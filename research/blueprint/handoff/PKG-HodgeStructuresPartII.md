# PKG-HodgeStructuresPartII — blocked checkpoint (codex-O0ziZK)

Issue [#7491](https://github.com/CBirkbeck/tauceti-explorer/issues/7491).
Agent: Codex (GPT-6), session `codex-O0ziZK`, 10 October 2026.
[Claim confirmation](https://github.com/CBirkbeck/tauceti-explorer/issues/7491#issuecomment-6092143282).
No manager-priority issue was available; this was an eligible focus package.
Only this job was claimed. Status remains partial; this is not an upstream-ready
package. The receipt below supersedes earlier claims about H.7 signature coverage.

## Correction made

The previous file's twenty named H.7 results omitted essential hypotheses from
their Lean statements while explaining those omissions in comments. Several
then assert false claims for arbitrary receiving data. Comments cannot restrict
a theorem's quantifiers. Removed that entire result block and its now-unused
private coordinate/Gram helpers. The README's precise mathematical targets,
hypotheses, locators and earlier checks remain unchanged. A short H.7 closing
comment names the omitted signatures, as PACKAGE_REVIEW permits. No packet or
supplier was edited; no generic Prop or replacement variation was introduced.

Added six README negative controls and seven native Lean `example`s with complete
proofs (one control uses two examples, for image equality and nonclosedness).
These examples do not depend on admitted geometric results:

| Statement family checked | Instance / result | Correction |
| --- | --- | --- |
| Rough-function membership | Empty receiving set excludes every function | Removed `flatNorm_roughMonomial`, `movingNorm_roughMonomial`, `hodgeEntry_roughPolynomial`; the actual coefficient algebra and norm hypotheses are required. |
| Strict determinant comparison | Positive-rank zero matrix gives 0<0 | Removed `determinantWeight_bound` and `uniformReducedness`; the positive Hodge metric and adapted-basis estimates are required. |
| Row reducedness | Entry −1 gives 1≤−C for C>0 | Removed `curvewiseReducedness`; an arbitrary real matrix is insufficient. |
| Finite Siegel containment | Empty indexing type cannot cover a point image | Removed `deepSiegelContainment` and `positiveHeightSiegelCover`; use the actual same-K arithmetic family. |
| Closedness / algebraicity | Inclusion (0,1)→R has precisely that nonclosed image | Removed `specialImage_closedAnalytic` and `specialPullback_algebraic`; arbitrary maps and subsets are insufficient. |
| Exceptional-locus conclusion | All proper subsets of Unit are empty | Removed `hodgeLocus_algebraicity`; an arbitrary whole-base locus cannot be such a union. |
| Gram formula | Arbitrary basis and labels need not refine the Hodge filtration | Removed `gramDeterminant_formulas`; adaptation and denominator nonvanishing must be expressed. |
| Definability / tensor classification | Arbitrary language, maps, fibre families and subsets do not encode the source hypotheses | Removed `sectorLift_definable`, `localPeriod_definable`, `globalPeriod_definable`, `specialImage_definable`, `localTensorLocus_analytic`, `exceptionalSpecial_preimage`, `rationalSpecial_countability`, `compactTargetPeriod_definable`. |

The last two rows are hypothesis audits, not completed Lean counterexample
constructions. This pass concerns the H.7 named-result block only; it is not an
adversarial certification of the remaining 1,623 admitted declarations.

## Concrete blockers and distinction from permitted omissions

A missing Lean prototype alone does not block packaging. PACKAGE_REVIEW explicitly
permits such signatures to be absent while their exact statements remain in the
README. Likewise, `ShimuraData:D3/variation` DOES state the mathematical real or
rational variation contract. Its incomplete suggested carrier is not by itself
proof that the mathematical variation definition is missing. Its
`IntegralVariationFibers` still lacks scalar-extension agreement and naturality
in the prototype; do not use that record to instantiate H.7's integral variation.

Two independently checked plan gaps are different: the cited owner statements
do not cover the mathematical contracts this package consumes.

- H.0 part gap G1 and its request to `CrystallineCohomology:CR.1` require ordinary
  integrable connections on arbitrary supplied commutative ringed differential
  sites, including restriction/gluing and comparison of exterior extensions.
  `CrystallineCohomology--CR.0.json`, node `CR.1/integrable-connection`, states an
  affine quotient-differential construction and a crystalline-site sheaf version.
  Its stated hypotheses are not those of the requested arbitrary site. Current
  AlgebraicVectorBundles and DifferentialGeometry do not supply this missing
  arbitrary-site comparison. Native sheaf tensor operations must be reused.
- H.0 gap G3 and its request to `DerivedDeRhamCohomology:DD.1` require an ordinary
  finite locally split Rees sheaf, local freeness, and operator-compatible
  specializations at t=0, t=1 and t inverted. The accepted owner nodes
  `DD.1/filtered-modules` and `DD.1/rees-description` state enhanced derived
  filtered diagrams and a derived graded Rees equivalence. They do not state
  the requested underived finite locally free sheaf comparisons. An additional
  exact comparison target is needed, not an implementation of an existing one.

The H.0 review explicitly accepts a target-level planning pass with these gaps;
its stage is planned, not closed. Resolving the owner contracts requires edits
outside #7491's allowed deliverables. The issue's accepted-plan premise therefore
does not establish dependency closure. This checkpoint is for a scope blocker,
not expiration of this run's time. `metadata.toml` remains absent so intake does
not mistake this partial correction for a completed package.

## Validation and source receipt

- `lean-check research/blueprint/packages/HodgeStructuresPartII/Suggested.lean`:
  whole-file exit 0; zero errors; 1,623 warnings, all `declaration uses sorry`;
  zero other warnings. All seven new native checks have complete proofs.
- Mathlib build HEAD verified as `082e2d37e8b0463410cdb532e111cd43d5a66174`.
  Compared all 5,477 `TauCeti/**/*.lean` source blobs at
  `f790474821cf4256814db967cb154e7af3d0c369` with the shared build: zero missing,
  zero differing. Used read-only Git manifests; no dependency copy/build.
  Available memory was 100 GB before elaboration.
- All ten unchanged Hodge input packets: `scripts/check_blueprint.py`, zero
  errors and warnings each. These structural checks do not prove closure.
- README is 187,159 bytes, below the issue's 200 KB limit. `git diff --check`
  and `research/blueprint/intake.py check-files` pass. Only the package README,
  Suggested.lean and this handoff change.
- Read the binding worker/protocol/upstream guidance and package-form rules,
  reviewed Hodge library audit, current Completed/HodgeStructures and
  Completed/UniversalCovers; inspected the relevant current algebraic vector
  bundle, differential-form and native Hodge declarations. Current read-only
  roadmap HEAD at verification: `d6f707516e7ede3181dac4b2420ba25c0799d22d`;
  current library: `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`.
- Fresh primary reading: [BKT20 published PDF](https://par.nsf.gov/servlets/purl/10200187),
  Theorems 1.3, 1.5, 1.6, pp.920–922; Definition 4.4 and Lemma 4.5, pp.929–930;
  §§4.4–4.6, pp.930–934; §5, pp.933–934. Confirmed the polarized-variation,
  coefficient-algebra, homogeneous-vector and adapted-basis hypotheses, and
  individual special pullbacks. SHA-256
  `b7cf457907c30c9dc1c349637e74027ce4ef038a2e0f646b7685f571d367e058`.
  [BKT23 author erratum](https://benjamin-bakker.github.io/DefArithErr.pdf),
  §§1.1–1.6, pp.1–4, Theorem 1.2 and Corollary 1.3: fixed-K and Cartan-compatible
  quotient functoriality. SHA-256
  `86d76a5d2443840ddcaf2c08966cd236759bade659e338e3fcdb3edcd2b61ac7`.
  No restricted source was used; no source passage was copied.

## Resume after the owner contracts are resolved

Preserve the native H.5 additions from the previous receipt and these proved H.7
negative controls. Do not restore the twenty H.7 theorems with arbitrary receiving
data: either state every geometric hypothesis using the owners' actual carriers
or retain the permitted omissions. Complete the semantic audit of ALL remaining
signatures, especially blocks with comments saying conditions are omitted. Finish
upstream-form conversion (outer namespace, theorem declarations, one module
note, short omissions, prose/API/Checks per definition and layer dependencies);
the inherited large file still has historical inventory comments and `lemma`s.
These form defects are not certified as fixed by this checkpoint. Add metadata
only when the dependency and complete-package conditions hold, then repeat the
whole-file check. Everything needed to resume is in the repository and the public
sources linked above; scratch files are disposable.

---

# Previous continuation receipt (codex-Z9BBS5)

# PKG-HodgeStructuresPartII — checkpoint handoff

Status: partial, blocked on missing supplier interfaces; not a completed package.
Issue [#7491](https://github.com/CBirkbeck/tauceti-explorer/issues/7491).
Continued by Codex (GPT-6), session `codex-Z9BBS5`, on 10 October 2026, after
[the bot confirmed the claim](https://github.com/CBirkbeck/tauceti-explorer/issues/7491#issuecomment-6091583681).
None of the manager's priority-list issues was available at selection time;
this was an available focus package in WORKERS' next eligible group.
Only this job was claimed.

## Changes in this run

Two H.5 components previously listed as unavailable have native signatures now:

- `RigidLocus.fibre` compares the relative rigid open with the rigid open of the
  actual scheme-theoretic fibre, using `Scheme.Hom.fiberToSpecResidueField` and
  `fiberι`. The equality is between opens of the fibre scheme, retaining
  nilpotents. Three examples test point membership, finite fibres and fibres
  disjoint from the relative rigid locus. This restores the full
  `H.5/rigid-locus-fibre` signature and the corresponding API of `/rigid-locus`.
- `IsIntegralRepresentation.iff_projectiveLattice` supplies the GL representation
  component of `H.5/integral-projective-lattice` and `/integral-representation`.
  It uses native finite projective submodules over a number field's ring of
  integers, a native `IsBaseChange` witness for the inclusion into the whole
  complex representation, and stability under the restricted-scalar action.
  No free basis over the initial ring of integers is imposed. The reverse
  direction principalizes the Steinitz class after a finite number-field
  extension; finite generation of the group is not needed. Four examples test
  the trivial action, the nonintegral rank-one multiplier 1/2, the zero
  submodule's failure to span positive rank, and the conjugated unipotent
  generator with upper-right entry 1/3. The global projective-local-system
  formulation still needs monodromy classification and scalar-extension
  comparison; it is explicitly retained as an omission.

The README states these APIs, hypotheses, prerequisites and tests in its H.5
sections. The native declaration register and omission inventory agree with
these additions. No packet or supplier file is changed. `metadata.toml` remains
absent because the complete-package conditions are not satisfied.

## Why completion is blocked

The issue's accepted-plan premise does not supply the interfaces required for
its remaining global signatures. The following were checked directly again,
against the current suppliers and current read-only upstream/library:

| Consumer | Existing owner and concrete missing input |
| --- | --- |
| H.0 ordinary connections, lambda-connections and operator families | `CrystallineCohomology:CR.1/integrable-connection`, in `CrystallineCohomology--CR.0.json`, is a partial prototype in a `needs_changes` packet. Its affine ring definition and crystalline-site sheaf construction do not give connections on arbitrary commutative ringed differential sites, their restriction/gluing, or ordinary-fibre comparisons. Native module sheaves and tensor products already exist and must be reused. |
| H.0 ordinary filtered/Rees specialization | `DerivedDeRhamCohomology:DD.1/filtered-modules` and `/rees-description` give enhanced derived coherent diagrams and a derived Rees equivalence. They do not specify the ordinary locally split module-sheaf comparison, local freeness, specialization and localization identifications used by the H.0 operators. |
| H.2/H.3/H.6/H.8 global variations | `ShimuraData:D3/variation` is in a `needs_changes` packet. In its suggested file, `Supplier.connection` is a pointwise derivative with an explicit missing sheaf/restriction/gluing comparison. `IntegralVariationFibers` explicitly omits agreement of the integral and real fibre Hodge structures and naturality of the lattice comparison. Neither record supplies the single compatible global polarized variation required by these consumers. |

These are missing statement/definition interfaces, not unimplemented proofs of
otherwise adequate theorem signatures. Completing or changing them requires
edits at their existing owners, outside this issue's allowed files. Defining
another connection/variation hierarchy in this package would duplicate those
owners; admitted type placeholders would violate PROTOCOL §13. The historical
H.1 and H.6 omission inventories remain unresolved too. This is therefore a
checkpoint for a demonstrated blocker, not a time-limit checkpoint.

## Verification and reading receipt

- Whole-file command: `lean-check research/blueprint/packages/HodgeStructuresPartII/Suggested.lean`.
  Exit 0; zero errors; 1,643 warnings, all `declaration uses sorry`; zero
  other warnings. All layers reach the end. This checks elaboration of the
  signatures and admitted bodies, not theorem proofs or full target fidelity.
- Required Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` matches the shared
  build HEAD. All 5,489 tracked Lean source blobs at Tau Ceti
  `f790474821cf4256814db967cb154e7af3d0c369` match the corresponding shared-build
  files: zero missing, zero differing. This used the existing read-only
  repository's Git manifest, without copying or building a dependency.
- All ten unchanged Hodge input packets pass `python3 scripts/check_blueprint.py`:
  zero errors and warnings each. They contain 885 targets and 113 requests;
  structural validity is not dependency closure or a completed fidelity audit.
- README: 184,788 bytes, below 200 KB. The 108-import block is unchanged.
  `git diff --check` passes; only the two package files and this handoff change.
  Available memory exceeded 100 GB; no Lean process is left running.
- Read WORKERS, both protocols, UPSTREAM_GUIDE, the reviewed Hodge library audit,
  and current Completed/HodgeStructures and Completed/UniversalCovers in full.
  Inspected relevant current AlgebraicVectorBundles, DifferentialGeometry and
  library interfaces. Current read-only snapshots: roadmap repository
  `cb8dda51b498dc00183d100031b631dfb58ea5e1`; Tau Ceti
  `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. No Lake command ran there.
- Fresh primary reading: [EG18 v3](https://arxiv.org/pdf/1711.06436v3), §1,
  pp.1–2, for the projective-module integrality criterion; SHA-256
  `622fb7b327b30b522b23c6d50f23e24b5e252d44f61c3684594a78362d5a64dc`.
  [EG20 author version v4](https://arxiv.org/pdf/1707.00752v4), §3.1,
  Definition 3.2, manuscript pp.16–17 (published pp.121–123); SHA-256
  `bcc435b58bb2b1c06869413c1cd96018676d15da8003d21e5b507b114a63c4eb`.
  Read pinned native `IsBaseChange`, number-field rings of integers and
  class-group finiteness, fibre morphisms and quasi-finite-locus statements.
  No restricted book was used and no source passage was copied into a deliverable.

## Resume

Resolve the owner interfaces in the table before attempting complete global
signatures. Preserve the working native imports and the H.5 additions. The
representation-level lattice criterion does not replace the global
local-coefficient comparison. Finish the remaining target-by-target semantic,
source and signature audit; the earlier receipts below describe its prior
extent and outstanding H.0/H.1/H.6/H.8 work. Add metadata only after the complete
package requirements hold, and rerun the whole-file check. No scratch artifact
is needed to resume; disposable logs and public PDFs can be deleted at submission.

---

# Previous continuation receipt (codex-aMGSqn)

Status: partial; the complete file now elaborates at both required pins.
Completion still requires genuine global supplier signatures and the remaining
full target-fidelity audit. Issue
[#7491](https://github.com/CBirkbeck/tauceti-explorer/issues/7491).
Continued by Codex (GPT-6), session `codex-aMGSqn`, on 9 October 2026, after
[the claim confirmation](https://github.com/CBirkbeck/tauceti-explorer/issues/7491#issuecomment-6086636005).

## What this continuation changes

The [Suggested.lean](../packages/HodgeStructuresPartII/Suggested.lean) now
passes the whole-file native check, including H.2, H.3, H.6, H.7 and H.8.
The previous import/build blocker is resolved in the prepared shared build;
do not resume by looking for a missing LocalCoefficient object.

The elaboration fixes are:

- Call native `MixedHodgeStructure.ofPure` with both base-change witnesses
  `hQ hC`, as its pinned signature requires.
- Use `→ₛₗ[starRingEnd ℂ]` for the conjugate-linear flag test.
- Enable the existing `LieRing.ofAssociativeRing` locally, with priority 100,
  in H.3's section. Mathlib deliberately makes this instance local in
  `Mathlib/Algebra/Lie/OfAssociative.lean`; importing that file does not
  register the commutator Lie ring on module endomorphisms. This fixes the
  Lie-subalgebra, Lie-filtration and horizontal-bracket signatures without
  defining another bracket or leaking an instance to other layers.
- Supply classical membership decidability in `tensorHodgeLocus.constant`.
- Remove duplicate finite-dimensional instances and name intentionally unused
  point-data arguments with an underscore. No warning is suppressed.

The native Betti part of `H.1/stable-automorphisms` now has two theorem
signatures, `stable_automorphisms_betti` and
`determinant_rigidified_automorphisms_betti`. The former characterizes each
commuting matrix as a unique scalar unit. The latter adds determinant-one
and identifies the scalars satisfying `c^r=1`. Both allow an arbitrary group
and determinant character: finite presentation and finite order are not
needed for this algebraic component. Four `example`s test rank-one
rigidification, preservation by every unrigidified scalar, a nonidentity
rank-one scalar's failure to preserve a determinant identification, and the
native determinant exponent in every rank. The full geometric operator and
stack-inertia assertions remain explicitly omitted. No moduli space or
universal bundle is inferred from these representation statements.

The [README](../packages/HodgeStructuresPartII/README.md) adds those API and
test statements and corrects the coefficient-operations ownership below.
All other mathematical prose, targets and scope remain as in the retained
checkpoint. No packet, supplier file or original assembly artifact is edited.
`metadata.toml` remains absent because the complete-package requirements are
not met; its eventual content is `topic = "math.AG"`.

## Corrected library and owner boundary

The inherited blanket description of missing sheaf tensors is too strong.
At Tau Ceti `f790474`, the following actual site-level operations were read
and checked by a supplemental native import/signature check:

- `TauCeti.SheafOfModules.tensorProduct` and `tensorProductIso`;
- `tensorProductUnitIsoLeft`, `tensorProductUnitIsoRight` and
  `tensorProductComm` in `TauCeti/Algebra/Category/ModuleCat/Sheaf/TensorProduct/Basic.lean`;
- `tensorProductAssoc` in `…/TensorProduct/Associator.lean`;
- `pushforwardTensorProductIso` and `overTensorProductIso` in
  `…/TensorProduct/Restriction.lean`.

Mathlib already supplies `SheafOfModules`, `IsLocallyFree` and
`IsFinitePresentation`. Use these, not new module-sheaf or tensor carriers.
The generic site operations retain their explicit sheafification and
sheaf-composition assumptions. They do not identify a tensor of global
sections with the global sections of the tensor sheaf.

Current upstream `AlgebraicVectorBundles` L0A–L0C already owns the closed
monoidal sheaf theory, finite locally free duality, pullback and polynomial
operations on schemes. Current Tau Ceti also contains, among others,
`Sheaf/TensorProduct/Closed.lean`, `Sheaf/TensorProduct/Dual.lean` and
`AlgebraicGeometry/VectorBundle/FiniteLocallyFree.lean`. These current files
were inspected read-only and are **not** present at the atlas's `f790474`
baseline; no import from the newer dependency was used to certify this check.
The package now cites the upstream owner rather than planning its operations
again. The general ringed-site coefficient and differential comparisons
remain distinct requirements of E1 and CR.1.

For the plan owner: original H.0 request R2 and the corresponding H.0/H.1
omission inventories must be read with this correction. Remove requests to
rebuild native tensor primitives, and route existing algebraic vector-bundle
operations to the upstream L0 layers. This issue permits no packet edits;
the corrected ownership is recorded here and in the package instead.

## Why this remains a checkpoint

The mathematical carrier/comparison requirements cannot be completed by
compiling the existing local shadows. Concrete outstanding interfaces are:

| Consumer | Exact supplier boundary to resolve |
| --- | --- |
| H.0 global `Preconnection`, `LambdaBundle`, tensor/dual/descent and ordinary fibre | CR.1's generic ringed differential-site ordinary connection and exterior extension, with the actual E1 sheaf-operation comparisons. The node `CrystallineCohomology:CR.1/integrable-connection` in the current partial CR.0 packet describes ring connections and the crystalline-site specialization; neither is the requested arbitrary-site export. Native tensor primitives alone do not provide the differential calculus. |
| H.0 filtered symbol and Rees family | `DerivedDeRhamCohomology:DD.1/filtered-modules` and `/rees-description` state coherent filtered objects in an enhanced derived category. H.0 needs their ordinary finite locally split module-sheaf specialization, local freeness and explicit fibre/localization identifications. The existing completed DD package does not supply that comparison merely by naming its derived Rees equivalence. |
| H.2/H.3/H.6/H.8 global variations | `ShimuraData:D3/variation` has a genuine prototype, but its `Supplier.connection` still lacks the sheaf restriction/gluing comparison. `IntegralVariationFibers` explicitly omits agreement of its integral Hodge filtration with the real variation and naturality of the scalar-extension comparison. Copying its record into this roadmap would duplicate ownership and retain those omissions. Constant native local systems and fibre Hodge structures do not discharge them. |
| H.1 geometry | The unchanged H.1 G1–G9/G11 register requests coherent operator families, Quot/Hom/GIT, nonreduced analytic families, compact coefficient metric analysis and deformation/compactness comparisons. There are 34 inventoried global omissions; the new Betti stabilizer statements discharge only the representation portion of one. |
| H.6/H.7 degeneration and arithmetic containment | The previous detailed H.6 receipt below remains authoritative: 22 global signatures need polarized variations, limiting-Hodge and norm estimates, and the Schmid-torus/canonical-compact comparison. The ten local matrix/coordinate forms do not supply them. |

The current native library and upstream roadmaps were checked for these
interfaces. Hodge structures, mixed strictness, period-domain points,
local coefficients and the general algebraic/smooth bundle substrate must be
consumed; they are not a complete realization of the requested analytic or
ringed differential-site comparisons. Building those provider libraries in
this package would cross the issue's allowed files and duplicate their
owners. Arbitrary admitted types and empty `Prop` fields are not acceptable
substitutes (PROTOCOL §13). These are unresolved supplier/interface inputs,
not a claim that all prerequisite theorem proofs must be implemented before
a roadmap can be packaged.

## Verification receipt

Required baseline: Mathlib
`082e2d37e8b0463410cdb532e111cd43d5a66174`, Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`.

The configured shared build has the exact Mathlib HEAD. Its Tau Ceti build
tree has no Git metadata, so provenance was checked by comparing every one
of its 5,477 `.lean` files with the Git blob manifest at `f790474` in an
existing repository: zero missing files, zero differing blobs. The prebuilt
native imports load successfully. This is an exact source-provenance and
elaboration check; it is not a new dependency build. No cache download,
update, language server, extra repository copy or command in the read-only
roadmap Lake environment was run.

- Final whole-file command:
  `lean-check research/blueprint/packages/HodgeStructuresPartII/Suggested.lean`.
  Exit 0; zero errors, 1,634 warnings, all `declaration uses sorry`;
  zero non-sorry warnings. All native layers reach the end of the file.
  This checks signatures and their admitted bodies, not theorem correctness.
- Supplemental sheaf-interface check imports the pinned Basic, Associator,
  Restriction and Mathlib LocallyFree modules and checks the native tensor,
  sheafification, symmetry and finiteness-predicate signatures: exit 0,
  zero errors and zero warnings. It tests availability, not the omitted
  global operator signatures.
- All ten unchanged accepted packets pass `python3 scripts/check_blueprint.py`:
  zero errors and zero warnings each.
- Structural inventory confirms 885 distinct targets: original H.0 569,
  H.0 additions 7, then H.1–H.8 36/33/43/30/73/32/31/31. Their active request
  counts are 5/4/18/14/23/3/16/7/12/11 (113 total). This inventory and packet
  validation are **not** the unfinished semantic/source/signature fidelity
  audit of every target.
- 182,829 bytes in the README, below the 200 KB limit; one import
  block with 108 distinct imports in Suggested.lean. `git diff --check`
  passes. Only the two package files and this handoff change.
- Available memory was 107 GB before the final check. Nothing remains
  compiling when submitted. Logs and downloaded public source material are
  disposable; no scratch file is needed to resume.

## Reading and source extent

Read current upstream Completed/HodgeStructures and Completed/UniversalCovers
in full, both protocols, UPSTREAM_GUIDE and the reviewed Hodge library audit.
Read the relevant current AlgebraicVectorBundles and DifferentialGeometry
interfaces and native library statements without editing or running Lake
there. Their read-only snapshot commits were TauCetiRoadmap
`de435a569d325b365a30fe83269ce34674eaea80` and Tau Ceti
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`.

Fresh primary reading was [Simpson I, published IHÉS 79 (1994)](https://www.numdam.org/item/PMIHES_1994__79__47_0.pdf),
§3's scalar endomorphism argument, printed p.90, and §4, Theorem 4.7(4),
printed p.104; SHA-256
`c75ffddf60b20eea2d93fa12e1d030cda524d9f8e2b4df4d60014bc8130a7054`.
Also read [Stacks §60.15, tag 07J5](https://stacks.math.columbia.edu/tag/07J5),
the connection/exterior extension and Lemma 60.15.1, to check the crystalline
site versus the requested generic differential-site interface. The scalar
representation component consumes the pinned native Schur theorem and scalar
matrix/determinant statements. No expanded reading of the other papers is
claimed. No restricted book was used and no source passage was placed in a
deliverable.

## Resume from here

1. Preserve the working whole-file imports and the exact-pin check. The old
   build blocker in the historical receipts below is superseded.
2. Resolve the provider comparisons above at their existing owners, then
   replace omission inventories by actual signatures, API and tests. Import
   the native tensor primitives and current upstream vector-bundle ownership;
   do not re-plan them. The new Betti stabilizer component is ready to consume.
3. Finish the remaining full target-by-target README/signature/source audit.
   Prior H.0 statements/API/tests and H.8 prose audits below remain useful;
   this continuation does not certify all 885 targets.
4. Run the whole-file check after those changes, add the metadata only once
   every package requirement is met, and replace this partial receipt by a
   completion receipt. Until then submit a checkpoint.

---

## Prior continuation receipt (codex-bIhl76)

The following historical receipt describes the earlier source state and build
availability; its compiler blocker is superseded by this continuation.

Status: partial; blocked on the complete native build at both required pins
and on unresolved geometric supplier signatures. Issue
[#7491](https://github.com/CBirkbeck/tauceti-explorer/issues/7491).
Continued by Codex (GPT-6), session `codex-bIhl76`, on 9 October 2026, after
[the claim confirmation](https://github.com/CBirkbeck/tauceti-explorer/issues/7491#issuecomment-6075064852).

## This continuation: H.0 operator and comparison fidelity

The [package README](../packages/HodgeStructuresPartII/README.md) gives more
precise H.0 statements, API and discriminating computations. Its H.1–H.8
text and the whole Suggested.lean remain byte-for-byte unchanged. No input
packet, supplier roadmap or original assembly artifact was edited. Metadata
remains absent because the complete-package requirements are not met.

The mathematical changes are:

- Fix the coordinate convention to `s′=Gs`, hence
  `A′=GAG⁻¹−λδ(G)G⁻¹`, including the determinant trace correction with
  its minus sign. For a matrix whose rows are sections, the connection acts
  on those rows by `S Aᵗ`; distinguish this from the auxiliary `A S`
  row-action determinant identity. Flat determinant does not imply a flat
  original operator, as the `E12,E21` test shows.
- Specify the intrinsic balanced extension, its odd-degree sign, curvature
  square identity, horizontal maps, restriction, descent cocycle, tensor
  unit, dual, rescaling and genuine differential-chart comparison. Include
  the discrete-space example with finite stalk ranks but no finite cover
  by constant-rank free charts.
- Specify the symmetric action's augmentation ideal in its source algebra,
  the exact quotient exponent, and its uniqueness. An ambient endomorphism
  ideal is different. The characteristic-two truncated-polynomial example
  has nonzero ordered second iterate and zero symmetric projection.
- State the exact flatness hypotheses for injective horizontal and
  coefficient reflection, and the retract alternative. Give the actual
  arbitrary-coefficient base-change equivalences in every degree and the
  faithfully flat reflection theorem. A principal affine cover has a finite
  subcover; arbitrary infinite ringed-site covers still need uniformity.
- Specify finite-direction exterior detection, its arbitrary-coefficient
  forward implication and finite-basis converse. For ordered tensor powers,
  retain the integral subset shuffle, stable slot order, mixed-sign exterior
  cancellation, larger bounds and the zero-iterate premise. The torsion
  coefficient and independent-direction F₂ examples reject dual testing
  and tests using only individual powers.
- Make the parameter residue's equality criterion, quotient naturality and
  nonzero mod-2 example explicit. Remove an unnecessary integrability
  premise from the ordered nilpotence/finite-lowering-filtration equivalence;
  kernels need not be subbundles over a nonreduced base.
- Specify the additive affine extension, the same-parameter balancing
  restriction, actual coordinate conjugation, ramified calculus morphism
  and receiving-ring derivative term. Give native tensorator/cotensorator
  and unit maps, triple tensor formulas and both directions of monoidal
  natural comparisons.
- State the dual curvature pairing with the term
  `λ(d₀λ∧d₀(φ(e)))`, in that wedge order; negative transpose and
  dual flatness reflection require `d₀λ=0`. Native bidual transport itself
  is horizontal for arbitrary λ. Include actual four- and six-scalar dual
  evaluation formulas and polynomial/nonreduced derivative and sign tests.
- Spell out the Griffiths symbol's scalar-term cancellation, shift,
  bound `b−a+1`, finite relative Rees generator and failed-transversality
  example. The unbounded period-lattice adapter remains a supplier boundary.

The statements and definition/construction API and test records of the
569-node original H.0 plan and seven H.0 additions were read for this semantic
comparison. This is **not** a certification of complete 576-target source,
hypothesis, prerequisite, proof-outline and typed-signature fidelity: those
records are much larger, and their complete audit is still required. In
particular, literal node-id comments do not account for every active affine
declaration; match the packet's `declaration` names to the actual namespaces
instead of treating absence of an id comment as absence of a signature.

H.0 resume map, using zero-based indices in the unchanged original packet:

| README subsection | Original target indices and additions |
| --- | --- |
| Intrinsic operators | 12–31; reserved `key/higgs-parameter-connections`; intrinsic tensor/dual/pullback/descent |
| Matrix charts, gauge and determinant | 0–11, 47–59 |
| Twisted fields and symmetric actions | 32–34, 60–70, 131–160 |
| Ordered powers and local detection | 35–41, 71–130 |
| Tensor fields and shuffle | 161–223; `h0-tensor-valued-shuffle`, `h0-shuffle-term-vanishing`, `h0-ordered-shuffle-expansion`, `h0-arbitrary-coefficient-tensor-bound` |
| Rank bounds and parameter residue | `h0-field-rank-bound`, `h0-reduced-free-rank-bound`, `h0-parameter-residue` |
| Additive calculus and transport | 224–304 |
| Scalar extension and towers | 305–367 |
| Categories and monoidal pullback | 368–507 |
| Finite-projective duality | 508–568 |
| Griffiths symbols and Rees | 42–46 |

## Reading and native interfaces

Fresh source checks used freely readable versions, with no source passages
or restricted books copied:

- [Esnault–Groechenig's 44-page author manuscript](https://www.mi.fu-berlin.de/users/esnault/preprints/helene/126_esn_gro.pdf):
  §2.1, pp.5–6; §4.2, pp.23–24, including Lemma 4.9 and its printed proof.
  These are the parameter, Higgs and filtered-symbol conventions; the
  arbitrary-ring coherence is an authored algebraic deduction.
- [Liu–Zhu, arXiv v3](https://arxiv.org/pdf/1602.06282v3):
  Theorem 2.1(i),(iii),(iv), pp.7–8; Lemma 2.15 and proof, pp.18–19;
  Definitions 3.5–3.6, pp.21–22; Remark 3.2, p.24. Their correspondence
  supplies the nilpotence premise; the elementary rank bounds here assume it.
- [Heuer's published article](https://link.springer.com/content/pdf/10.1007/s00222-025-01321-4.pdf):
  Definition 1.2(2), p.262; Definition 4.1 and Remark 4.2, pp.297–298.
  This preserves the published locators used by the package.
- Stacks [§60.15, 07J5](https://stacks.math.columbia.edu/tag/07J5),
  connection/extension paragraphs and Lemma 60.15.1;
  [§17.16, 01CA](https://stacks.math.columbia.edu/tag/01CA),
  sheaf tensor construction and Lemmas 17.16.1–5;
  [§10.39, 00H9](https://stacks.math.columbia.edu/tag/00H9),
  Definition 10.39.1 and Lemmas 10.39.5 and 10.39.14;
  [§10.23, 00EN](https://stacks.math.columbia.edu/tag/00EN),
  Lemmas 10.23.1–2; and
  [§15.74, 0FNJ](https://stacks.math.columbia.edu/tag/0FNJ),
  Lemma 15.74.1(1)–(3), finite-projective evaluation.

Read the pinned Mathlib statements for `Derivation`, `MvPolynomial.pderiv`,
the matrix trace cyclicity identity, `dualTensorHomEquiv`,
`Functor.CoreMonoidal`, `TensorProduct.liftAddHom`,
`AlgebraTensorModule.cancelBaseChange` and `distribBaseChange`,
`PiTensorProduct.tmulEquiv`, and `SheafOfModules.IsLocallyFree`. This is a
focused interface check, not a fresh audit of every baseline declaration in
the 885-target plan. The upstream HodgeStructures and UniversalCovers readers,
WORKERS, both protocols, UPSTREAM_GUIDE and the Hodge library audit were also
consulted before editing.

## Checks and blocking evidence

- All ten unchanged accepted packets pass `scripts/check_blueprint.py`:
  zero errors and zero warnings each.
- The README is 181,496 bytes; H.0–H.8 occur in order. All edits are within
  H.0. Suggested.lean is unchanged, including its 108 distinct imports,
  single header and geometric omission inventories. `git diff --check`
  passes. No mathematical claim of formalisation or completion was added.
- Full-file command:
  `lean-check research/blueprint/packages/HodgeStructuresPartII/Suggested.lean`.
  It exits 1 while loading imports, before checking any body, because the
  object for `TauCeti.AlgebraicTopology.LocalCoefficient` is missing. All ten
  native Tau Ceti direct-import objects are missing in the configured build;
  their module names are retained in the prior receipt below.
- The configured build has the exact Mathlib pin
  `082e2d37e8b0463410cdb532e111cd43d5a66174`, but Tau Ceti HEAD
  `cf386627e9176a3827c1a5fe804989fd94a4d216` instead of required
  `f790474821cf4256814db967cb154e7af3d0c369`. An existing exact-pin
  source tree has no native import objects. A different existing build has
  all ten, but Tau Ceti `d4cf9545db80ecae6c0afd176120cbf86971d26b`
  and Mathlib `f6090c7095e1e56b3464c1daba5f24631f1290d2`;
  it cannot validate the required baseline. Read-only inspection found no
  usable complete build at both pins. No dependency build or modification
  is authorized by WORKERS; none was attempted. Available memory was 113 GB.
- A disposable **H.0 projection** passes `lean-check`, exit 0, with 982
  warnings, all `declaration uses sorry`, and no errors. It contains the
  exact shared representation adapter, original H.0 and H.0 additions,
  preceded by every Mathlib import from the package, and excludes the Tau
  Ceti imports and H.1–H.8. Its 8,730 lines check available affine forms at
  the exact Mathlib pin. This is not a full-file or native Tau Ceti check,
  does not discharge the geometric omission inventories, and proves no
  admitted theorem. Suggested.lean itself retains every native import.

To reproduce the diagnostic, use this extraction in the next worker's own
disposable on-disk scratch, then run `lean-check` on that file:

```python
from pathlib import Path
import sys
s = Path("research/blueprint/packages/HodgeStructuresPartII/Suggested.lean").read_text()
imports = "\n".join(line for line in s.splitlines() if line.startswith("import Mathlib."))
body = s[s.index("/-! Shared native representation adapter"):s.index("/-! ## H.1 -/")]
Path(sys.argv[1]).write_text(imports + "\n\n" + body)
```

## What remains

1. Select an existing complete build at both exact pins through
   `ATLAS_LEAN_BUILD`, then check the **whole** Suggested.lean. Do not remove
   native imports or use different pins to certify completion.
2. Finish the complete target-by-target audit of hypotheses, source locators,
   prerequisites and typed signatures. H.0's statements/API/tests comparison
   now has the corrections above; H.8's prior full prose audit is retained
   below. This continuation did not audit H.1–H.7 afresh.
3. Restore omitted global signatures only against actual CR.1/E1/DD.1 and
   geometric supplier interfaces. H.0's inventory begins in the intrinsic
   namespace before `signature omitted: Preconnection`; its global bundle,
   tensor, dual, pullback, descent, filtration and Rees targets remain
   untyped there. The detailed H.6 inventory below remains outstanding too.
   An affine diagnostic does not solve these supplier boundaries.
4. Fix all full-file elaboration errors, retain only sorry warnings, and add
   `metadata.toml` with `topic = "math.AG"` only after all package requirements
   are met. Its absence preserves checkpoint classification in intake.

No scratch file is needed for continuation. The diagnostic is reproducible
above and its result and blocker are recorded here. No compile from this
session remains in the background. The previous H.8 and H.6 receipts follow intact.

---

## Prior continuation receipt (codex-Zdji46)

Status: partial; the full pinned Lean check is blocked on unavailable native
Tau Ceti dependency objects. Issue [#7491](https://github.com/CBirkbeck/tauceti-explorer/issues/7491).
Continued by Codex, session `codex-Zdji46`, on 9 October 2026, after the bot
confirmed the claim in [its reply](https://github.com/CBirkbeck/tauceti-explorer/issues/7491#issuecomment-6074106589).
This is a checkpoint, not a completed package or an implementation claim.

## This continuation: H.8 fidelity and its prerequisite interfaces

The [package README](../packages/HodgeStructuresPartII/README.md) now includes
an H.8 definition-by-definition API and discriminating example suite, and
six target groups specifying the direct mathematical supplier interfaces.
All 31 H.8 node statements, hypotheses, API items, unit tests, prerequisites,
source locators and acceptance boundaries were compared with the accepted
[H.8 plan](../packets/HodgeStructuresPartII--H.8.json). The README still groups
related targets into a roadmap rather than reproducing node records.

The audit clarifies the notation in the Green argument: ℐ is the untwisted
real (1,1) bundle on the complex base, whereas J_b is the Tate-twisted fixed
(1,1) space at a real point. The real criterion and `GoodRealLocus` now give
J_b=H_R,b^(1,1)(1)^G explicitly. It also states the connected smooth projective
surface hypothesis in the product-threefold application, puts the divisor
sequence's quotient sheaf on T by pushforward from C, and attributes the
negative flat-class obstruction derivative to the graph calculation rather
than to a statement in Griffiths' paper. These make the existing targets more
precise; they add no target and change no accepted plan.

H.8 target-to-subsection map (suffixes of `HodgeStructuresPartII:H.8/`):

| README subsection | Targets accounted for |
| --- | --- |
| Real action and transported classes | real-action; combined-type; twisted-invariants; twist-sign; geometric-real-variation; transported-hodge-locus; transported-locus-gluing; nl-obstruction-derivative |
| Geometric contraction and normal boundaries | kodaira-spencer-contraction; griffiths-derivative; normal-boundary-factorization; normal-vanishing-surjectivity |
| Green submersion and real cones | positive-open-cone; green-evaluation-submersion; fixed-linear-surjectivity; real-green-open-cone; good-real-locus; real-good-locus-density |
| Constant and vanishing subvariations | orthogonal-constant-splitting; constant-symbol-zero; vanishing-rank-criterion; vanishing-real-green; full-lattice-coset-cone |
| Voisin's complex pushforward-kernel theorem | voisin-infinitesimal-kernel; voisin-kernel-cone; voisin-product-surface |
| Ordinary integral topology and divisor export | affine-cw-bound; affine-integral-vanishing; ordinary-integral-lefschetz-h3; ordinary-integral-lefschetz-h2; transported-divisor-export |

The API/examples subsection spells out all six definitions' 32 API items and
26 tests in mathematical prose. The prerequisites subsection retains the
ordinary integral topology, the non-polarized intersection-pairing boundary,
and the genuine equivariant integral lift needed for real divisor export.

Read [Benoist, *Sums of three squares and Noether–Lefschetz loci*](https://www.math.ens.psl.eu/~benoist/articles/NLsquares.pdf)
§§1.1–1.4, Propositions 1.1–1.3 and their proofs, printed pp.1050–1052,
on 9 October 2026 to check the action, Tate sign, admissible neighbourhoods,
real-cone conclusion and componentwise density. No fresh reading of the
other H.8 sources is claimed: their statements and locators were compared
with the accepted plan. No restricted book or source passage was copied.
The upstream HodgeStructures and UniversalCovers roadmaps were read in full,
alongside WORKERS, both protocols, UPSTREAM_GUIDE and the reviewed parent
Hodge library coverage. Native fibre-Hodge statements and the nondegenerate
orthogonal-complement theorem were read at the exact recorded pins.

## Current checks and blocker

- All ten input packets passed `python3 scripts/check_blueprint.py`:
  zero errors and zero warnings for each. They remain unchanged.
- The README is 171,486 bytes, under the 200 KB limit. H.0–H.8 occur in
  order; there are no private paths, source excerpts or process records in
  its new text. The only modified deliverables are the README and this note.
- `Suggested.lean` remains unchanged from the previous continuation,
  including its 108 individual imports and H.6 omission inventory.
- Whole-file `lean-check research/blueprint/packages/HodgeStructuresPartII/Suggested.lean`
  failed with exit code 1 while loading imports, before any declaration was
  checked: `TauCeti.AlgebraicTopology.LocalCoefficient` has no object file.
  All ten Tau Ceti direct imports are unavailable in the configured build;
  the complete module list is preserved below.
- The configured build has Mathlib
  `082e2d37e8b0463410cdb532e111cd43d5a66174` but Tau Ceti
  `cf386627e9176a3827c1a5fe804989fd94a4d216`, rather than the required
  `f790474821cf4256814db967cb154e7af3d0c369`. Read-only inspection of
  the existing Tau Ceti build directories and roadmap dependency found no
  usable build at both pins. Existing exact-pin source trees have no compiled
  Tau Ceti objects. More recent complete builds also use other Mathlib pins.
  Memory is sufficient; no build, cache fetch, update, language server,
  repository copy or dependency modification was started.

`metadata.toml` remains absent, preserving checkpoint classification; its
final content is `topic = "math.AG"` once all package requirements are met.

## Resume

Provide an existing complete native build at both exact pins, then run the
whole-file check. Do not discard native imports, change the pins or replace
geometric carriers by arbitrary admitted types. Complete the remaining
whole-roadmap fidelity audit, especially H.0's 576 targets, and restore H.6's
missing global signatures against the actual supplier interfaces below.
The H.8 prose/API/prerequisite comparison is finished; its geometric Lean
omissions are not thereby discharged. Compile the whole file, fix its actual
errors, and add metadata only when the complete package is valid.

No scratch artifact is needed to resume. The prior continuation's detailed
H.6 inventory and remaining signature requirements follow intact.

---

## Prior continuation receipt (codex-DpXa1j)

Status: partial; blocked on prebuilt native dependencies and incomplete native
geometric signatures. Issue [#7491](https://github.com/CBirkbeck/tauceti-explorer/issues/7491).
Continued by Codex, session `codex-DpXa1j`, on 9 October 2026, after the bot
confirmed this session's claim. This is a checkpoint, not a finished package
or an implementation claim.

## Retained package and this continuation

The [README](../packages/HodgeStructuresPartII/README.md) retains the previous
161 KB draft: purpose, ownership, conventions, H.0–H.8 in order, mathematical
targets, API, tests, hypotheses, source locators and bibliography. A new
signature-boundary paragraph distinguishes the ten local H.6 target forms
from its global geometric signatures. No mathematical target was removed.

The [Suggested.lean](../packages/HodgeStructuresPartII/Suggested.lean) retains
its single standard header, all 108 distinct imports and all code outside
`Layer7` (H.6), byte for byte. The new H.6 inventory follows the protocol's
native-interface requirement instead of declaring arbitrary admitted supplier
types and functions. The former carriers `PolarizedDatum`, `IntegralVariation`,
`UnipotentVariation` and `SemistableFamily`, their independent projections,
the arbitrary monodromy-filtration and exterior-coordinate functions, and the
arbitrary limiting bigrading are removed. The 22 global theorem signatures
depending on these values are also removed; their mathematical targets,
missing carriers/comparisons and geometric tests are explicitly inventoried.
This removes 56 declarations in total, including seven dependent or unused
private helpers. All 17 H.6 examples and every surviving local signature and
body are preserved.

This corrects a misleading interface; it does not complete the omitted targets.
Quantifying over an arbitrary finite group does not give an action on a
geometric family, a bare flag-domain subset does not impose polarization on
its logarithms, and a freely supplied function does not define a positive Hodge
metric. The supplier's actual data and comparisons must occur in eventual
global signatures.

`metadata.toml` remains absent. Its required final line is `topic = "math.AG"`.
The intake currently recognizes all three package files as a completion,
without examining the compiler result or this note. Retaining the absence
preserves checkpoint classification while the job is blocked.

## Exact H.6 continuation inventory

All target suffixes below belong to `HodgeStructuresPartII:H.6/`. Full target
statements, API and tests remain in the unchanged H.6 packet and reader; the
README groups them in mathematical prose. The ten surviving typed target forms
are local reductions, not full statements of their global targets:

| Target suffix | Surviving local form; missing global content |
| --- | --- |
| semistable-log-model | Coordinate model and three examples; proper analytic log family absent |
| relative-log-forms | Degree-one quotient dimension; analytic complexes absent |
| wedge-triangle | Pointwise quotient kernel; derived triangle absent |
| log-gauss-manin | Frame operator, API and three examples; global connection comparison absent |
| ramified-residue | Matrix exponential and nilpotency identity; semistable modification absent |
| unipotent-normalization | Commuting matrix power/logarithm statement; rational lattice and cover comparisons absent |
| nilpotent-orbit | Coordinate orbit, API and three examples; real/rational isometry and polarization interface absent |
| untwisted-map | Local untwisting, API and three examples; geometric descent absent |
| negative-lie-chart | Matrix exponential, API and five examples; native negative-Lie complement absent |
| power-curve-normalization | Rational slope clearing and matrix sum; variation pullback and fixed-K containment absent |

The 22 omitted global signatures are grouped under their missing native inputs
in the H.6 inventory:

| Targets (suffixes) | Native supplier interfaces |
| --- | --- |
| log-cohomology-basechange, special-residue, semistable-betti, equivariant-comparison | ComplexComparisonPartII C0/C3/C5 and CR.5 analytic log comparison: proper family, actual cohomology and base-change maps, residue/boundary and nearby-cycle comparison, specified action on the family |
| quasi-unipotence, untwisted-extension, nilpotent-orbit-theorem, finite-monodromy-extension | H.2/H.3 and ShimuraData D3: integral polarized variation, marked horizontal holomorphic lift, represented compact dual/domain, canonical extension and finite descent |
| sl2-orbit-theorem, limiting-mhs-one-variable, cone-weights, limiting-mhs, logarithms-type, distributive-family, simultaneous-splittings | Genuine polarized real/rational nilpotent orbit; LPV.1 centered/relative monodromy filtrations and naturality/splitting API; native limiting MHS and Deligne bigrading; H.2 mixed tensor/Hom/Tate comparisons |
| horizontal-correction, flat-norm-estimate, moving-norm-estimate, exterior-power-estimates, perturbed-norm-comparison | H.2/H.3 negative isometry-Lie complement, analytic splitting subbundles, positive Hodge forms, exterior powers and common-depth compact-family comparisons |
| one-variable-sl2, one-variable-siegel | H.3/AA.3 actual period lift, rational parabolic factors, canonical compact and fixed-K Siegel comparison |

The inventory lists each former theorem name and geometry-level tests. Consult
H.6 G1–G6 for exact mathematical contracts. In particular G5's comparison of
Schmid's rational torus with canonical Cartan-stable compact data is still
required; removing its stand-in theorem does not prove it.

## Validation and external blocker

- All ten unchanged input packets passed `python3 scripts/check_blueprint.py`
  with zero errors and zero warnings each.
- An isolated scratch file containing the **exact edited H.6 section**, with
  the ten original H.6 Mathlib imports, passed `lean-check`: exit code 0,
  zero errors and 50 warnings, all `declaration uses sorry`. This checks the
  changed local code against Mathlib at its exact pin. It is not a whole-file
  or Tau Ceti check. Reproduce it by extracting `section Layer7` through
  `end Layer7` from the package and prepending the Mathlib imports from the
  unchanged H.6 suggested file. Use disposable scratch, not a new Lake project.
- Structural comparison confirmed all bytes outside H.6 are unchanged, all
  17 examples survive, the single 108-import block survives, and executable
  H.6 code contains no references to removed supplier values.
- `git diff --check` passed. The README remains below 200 KB with all nine
  layer headings ordered; no source passages or private paths were added.
- Final whole-file command:
  `lean-check research/blueprint/packages/HodgeStructuresPartII/Suggested.lean`.
  **Failed, exit code 1, while loading imports**, before checking any package
  declaration: the object for `TauCeti.AlgebraicTopology.LocalCoefficient`
  does not exist.

Direct inspection found ten unavailable direct-import object files in the
configured shared build. Their sources are present, but sources alone do not
supply native Lean imports:

1. `TauCeti.AlgebraicTopology.LocalCoefficient`
2. `TauCeti.Geometry.Hodge.Polarization`
3. `TauCeti.Geometry.Hodge.Mixed.Basic`
4. `TauCeti.Geometry.Hodge.Mixed.Morphism`
5. `TauCeti.Geometry.Hodge.Mixed.Strictness`
6. `TauCeti.Geometry.Hodge.PeriodDomain`
7. `TauCeti.LinearAlgebra.BilinearForm.Isometry`
8. `TauCeti.Geometry.Hodge.HodgeForm`
9. `TauCeti.Geometry.Hodge.Structure`
10. `TauCeti.Geometry.Hodge.Conjugation`

Required pins: Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`. The configured shared build has the
exact Mathlib pin but Tau Ceti checkout
`cf386627e9176a3827c1a5fe804989fd94a4d216`. Read-only inspection of the other
existing builds again found none at both required pins. A different build
having LocalCoefficient cannot validate this baseline. Available memory was
114 GB at both checks, so memory was not the blocker. No dependency build,
update, cache download, language server or extra clone was started. Nothing
remains compiling in the background.

## Source and remaining package work

Inputs remain the ten accepted packets: `HodgeStructuresPartII.json` and
`HodgeStructuresPartII--H.0.json` through `--H.8.json`. They contain 885 unique
targets: 569 original H.0, seven H.0 additions, then 36/33/43/30/73/32/31/31
in H.1–H.8. No packet, original reader, original suggested file or review was
edited. See [the assembly handoff](ASM-HodgeStructuresPartII.md) for the 113
supplier contracts and reconciliation details.

This continuation read the upstream HodgeStructures and GeometricTopology
roadmaps, both protocols and UPSTREAM_GUIDE, and the reviewed parent-Hodge
library audit. It inspected native period-domain points, mixed Hodge
structures, Hodge forms and local coefficient systems in the Tau Ceti source
at `f790474`. These provide fibre and local-system data; they do not establish
the omitted analytic variation interfaces. No source-paper reading claim is
expanded, no restricted book was used and no source passage was copied into a
deliverable.

Resume with a complete prebuilt dependency set at **both exact pins**. Run the
whole-file check, fix remaining package errors and preserve its actual result.
Do not remove native imports or substitute a different pin to turn the
checkpoint into a completion. Restore omitted global signatures only against
actual supplier carriers and comparison maps, retaining every hypothesis and
test in the README. Necessary accepted-plan corrections belong to its owner
and must be described here: this issue permits no packet edits.

The previous draft's target-by-target README fidelity audit remains unfinished,
especially the 576 H.0 targets and inherited global supplier contracts. This
continuation audits H.6's native-interface boundary, not all 885 targets.
Keep coherent versus locally free operators, arbitrary real admissibility,
Schmid versus canonical compact, mixed tensors and real integral-divisor
boundaries visible. After every obligation and the whole-file check passes,
add the metadata line and replace this partial note with the completion
receipt. Until then submit a checkpoint. Everything needed to continue is in
the repository; disposable scratch files need not be retained.
