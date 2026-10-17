# RT-AREA-algebraicnt-1: fixes, round 2

Issue: #6212 (`FIX-RT-AREA-algebraicnt-1~2`). Worker: Codex (GPT-6), session `codex-IMcnvz`, 2026-10-17. This is a completed fix submission for independent review, not a new acceptance of the roadmap or an implementation claim.

## Finding /1: direct supplier contracts

The verifier confirmed a narrow dependency-record problem. The suppliers already had ownership and indirect paths; the required correction is an exact supplier-stage → consumer-stage contract, from which assembly derives the reciprocal roadmap records. The original finding's proposed reverse direction and its claim of wholly absent machine-readable ownership are not adopted.

Round 1 could only propose the contracts. Since then, the accepted 300-node blueprint has acquired all twelve stage relationships: ten GN.2 comparison nodes directly require the upstream stages, and the GN.3 finiteness/mass nodes require AA.2 and AA.3. The promoted assembly already derives all four roadmap prerequisites and reciprocal consumers. Adding another owner, hand-editing a generated export, or duplicating the supplier theory would not repair anything further.

The remaining inconsistency was in the deliverables themselves: the packet still proposed a manual restructuring for these relationships, four request records omitted existing direct consumers, and the reader repeated the obsolete integration instruction.

### Changes

- **Packet:** add the six missing `neededBy` references to the QFI Layer 6, GlobalQuadraticForms Layer 6, AA.1 and QFI Layer 4 requests. Describe the QFI Layer 4 request broadly enough to include its existing field and trivial-involution hermitian comparisons. Remove the obsolete `rescope` proposal and replace the associated upstream note with the actual prerequisite-driven assembly mechanism, including AA.2/AA.3. Every mathematical node, hard prerequisite, baseline declaration, coverage row, source, gap and historical review remains unchanged.
- **Reader:** synchronize the imported-contract list with the packet's 18 current requests, including the six added consumer references. This also removes seven obsolete list entries already removed from the accepted packet during its tier/ownership review; it changes no ownership decision. Add the twelve-edge table and explain the field/integral, evenness and measure-normalization boundaries and automatic reciprocity.
- **Suggested Lean file:** document the same import boundary in its opening comment. The mathematical declarations are unchanged. Planned roadmap inputs are not executable Lean imports, and unavailable supplier carriers remain explicit gaps.

### Exact contracts retained

All consumer node names below have prefix `GeometryOfNumbersAndQuadraticArithmetic:`. The supplier identifiers are the registered atlas identifiers, including the umbrella QFI Layer 6 identifier for the 6D classification contract.

| Supplier stage | Direct consumer node establishing the required stage edge |
| --- | --- |
| `tauceti:TauCetiRoadmap/QuadraticFormInvariants#layer-1-hyperbolic-planes-and-witt-theory` | `GN.2/field-hyperbolic-comparison` |
| `tauceti:TauCetiRoadmap/QuadraticFormInvariants#layer-3-the-classical-invariants-that-need-no-brauer-group` | `GN.2/field-discriminant-comparison` |
| `tauceti:TauCetiRoadmap/QuadraticFormInvariants#layer-4-the-witt-ring-and-the-fundamental-ideal` | `GN.2/field-witt-comparison` |
| `tauceti:TauCetiRoadmap/QuadraticFormInvariants#layer-5-the-brauer-valued-invariants` | `GN.2/field-hasse-comparison` |
| `tauceti:TauCetiRoadmap/QuadraticFormInvariants#layer-6-forms-over-a-nonarchimedean-local-field` | `GN.2/local-field-classification-adapter` |
| `tauceti:TauCetiRoadmap/GlobalQuadraticForms#layer-5-hasseminkowski-isotropy` | `GN.2/global-field-isotropy-adapter` |
| `tauceti:TauCetiRoadmap/GlobalQuadraticForms#layer-6-representation-and-isometry` | `GN.2/global-field-isometry-adapter` |
| `tauceti:Completed/IntegralLattices#layer-1-lattices-with-forms` | `GN.2/symmetric-z-carrier-comparison` |
| `tauceti:Completed/IntegralLattices#layer-2-duality-and-the-finite-discriminant-group` | `GN.2/symmetric-z-dual-comparison` |
| `tauceti:Completed/IntegralLattices#layer-4-overlattices-and-isotropic-subgroups` | `GN.2/symmetric-z-overlattice-comparison` |
| `AdelicAlgebraicGroups:AA.2` | `GN.3/adelic-mass-identity` |
| `AdelicAlgebraicGroups:AA.3` | `GN.3/definite-genus-class-finite` and `GN.3/adelic-mass-identity` |

The extra request-list corrections cover QFI Layer 6 → `GN.2/spinor-unimodular-stabilizer`, AA.1 → `GN.2/spinor-adelic-norm` and QFI Layer 4 → `GN.2/signed-hermitian-witt-comparison`, alongside the three corresponding comparison nodes in the table. They record existing hard prerequisites; they do not add mathematical dependencies.

### Ownership and source checks

Read the relevant reviewed library-coverage entries, particularly GN.2 and GN.3, and the current read-only upstream roadmaps at TauCetiRoadmap commit `0d144d044dacebca17b654695b6f1ad58f159b27`. The following are supplier-contract checks, not fresh claims that the roadmap prototypes compile at the older pinned libraries. Markdown sources have no printed pagination; their numbered layers and the indicated Lean declarations locate the checks.

- [QuadraticFormInvariants](https://github.com/TauCetiProject/TauCetiRoadmap/blob/0d144d044dacebca17b654695b6f1ad58f159b27/TauCetiRoadmap/QuadraticFormInvariants/README.md), Layers 1, 3, 4, 5 and 6D; corresponding `Suggested.lean` sections on hyperbolic splitting/cancellation, `discr`/`signedDiscr`, `wittRing`, `hasseInvariant` and `exists_of_realization`. These supply field theory with its characteristic assumptions and discriminant conventions; they do not classify integral lattices.
- [GlobalQuadraticForms](https://github.com/TauCetiProject/TauCetiRoadmap/blob/0d144d044dacebca17b654695b6f1ad58f159b27/TauCetiRoadmap/GlobalQuadraticForms/README.md), Layers 5–6, especially §5.5; `Suggested.lean` declarations `hasseMinkowski_isotropic`, `represents_iff_locallyRepresents`, `represented_iff_locallyRepresented` and `hasseMinkowski_equivalent`. These require the appropriate local conditions at all places and conclude generic-field statements, not integral isometry.
- [Completed/IntegralLattices](https://github.com/TauCetiProject/TauCetiRoadmap/blob/0d144d044dacebca17b654695b6f1ad58f159b27/Completed/IntegralLattices/README.md), read in full, especially Layers 1–4; `Suggested.lean` declarations `integral`, `isEven_iff`, `dual_eq`, `discriminantGroup_eq`, `dual_isLattice_iff` and `discriminantGroup_finite`. The carrier, dual and overlattice theory are imported. Nondegeneracy controls dual finiteness, and evenness is retained for the quadratic discriminant refinement.
- `content/campaign/AdelicAlgebraicGroups/README.md`, AA.2–AA.3: quotient integration supplies the compatible Haar measures, while reduction supplies the appropriate finiteness/finite-volume inputs. GN's mass identity does not assert a numerical Tamagawa constant from those inputs alone.

The newer upstream IntegralLattices Layers 3–4 and OrthogonalSpinGroups Layers 1 and 3 were also inspected. Their local/genus and spinor specializations remain imports recorded by the accepted packet's existing current-upstream registration gaps. The successor OrthogonalTamagawaAndLatticeMass remains the owner of its numerical mass/strong-approximation branch. No target is replanned here.

### Validation and graph limits

At atlas checkout `fbed6652321ba8f2f7be5265fd76d85b336a757b`, on 2026-10-17:

- `python3 scripts/check_blueprint.py research/blueprint/packets/GeometryOfNumbersAndQuadraticArithmetic.json`: **0 errors, 0 warnings**; 300 nodes, 193 baseline declarations, 68 gaps, 18 requests, seven partial stages, no closed or planned stage.
- A focused scratch check compared all 15 requests from the four named supplier roadmaps with their actual direct hard-prerequisite consumers, and all 18 reader request entries with the packet. All matched after correction. It also compared mathematical nodes and the baseline/coverage/source/gap/review fields with the pre-fix packet; they are unchanged.
- The check ran `merge_blueprints` with this packet alone on the base snapshot, then `scripts.build.assemble(require_distances=False)` with the promoted inputs, then the full assembly with this candidate substituted for its promoted parent packet. **All three modes contain the twelve required stage edges, the stage-level `requires` and reciprocal `consumers`, and the four reciprocal roadmap relationships. No expected edge is skipped, and no consumer stage reaches its supplying stage.** The isolated merge has no reverse roadmap path to any of these suppliers.
- The full assembly's stage-edge and roadmap-edge sets are identical before and after candidate substitution. Its roadmap projection already has a reverse path `GeometryOfNumbersAndQuadraticArithmetic → AbelianSchemesAndArithmeticModuliPartII → HilbertModularVarietiesAndShimuraCurves → WeightsInEtaleCohomology → ModularCurvesPartII → AdelicAlgebraicGroups`. This cross-roadmap projection path is present before this fix; the stage checks above do not establish global roadmap acyclicity. It is recorded for the maintainer, without changing other jobs' files.
- `lean-check` completed successfully in the provided pinned shared build: **701 warnings, all for admitted proofs; no errors or other warnings**. The file has 3,268 lines. Its SHA-256 is `ebdb5a70bf84b3b5bb030808dbf6677beed7eed51883fcb40b263f7640032e99`. Elaboration checks the planning signatures; it proves none of the admitted obligations.

For the generated export named in the finding, the intended result is the four named suppliers in GN's `prerequisites`, and GN in each supplier's `consumers`, with the stage edges above. Assembly already produces that result from the accepted blueprint. Regeneration through the normal review/promotion/build workflow is sufficient; there is no remaining hand edit to that export, `data/atlas.json`, or an upstream document for this finding.

## Finding /2: rejected by the verifier

No new stage, Part II or competing Siegel-series owner is added. The accepted source routes assign that mathematics to GN.3, and the accepted packet already contains `GN.3/hermitian-local-density`, `GN.3/normalized-siegel-polynomial` and its source-specific routed obligations/gaps. This fix leaves those statements and their restrictions unchanged. The verifier's rejection remains in force; this report does not re-review those sources.

## Completion

The confirmed finding is satisfied by the existing hard contracts and the corrected metadata/documentation. The four allowed blueprint/report deliverables are ready for `REV-FIX-RT-AREA-algebraicnt-1~2`. No supplier mathematics was duplicated, no gap was hidden, and no generated or upstream file was changed.
