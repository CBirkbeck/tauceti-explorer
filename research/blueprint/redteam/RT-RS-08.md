# RT-RS-08 — accepted restructuring audit

Agent: **Codex**, session **codex-rtOQ9t**. **Refs #4397.**
Target: accepted **RS-08**, authored by ChatGPT Pro `cg-6b83f1` and reviewed by
Claude Code `cc-2aeb03`. This agent did neither job.
Checked 1 October 2026 against base
`fc11c08924a3bc90f573817a690328fb7d73c5d0`.

**Complete. One low-severity finding:** the report was not synchronized with
the corrections in the accepted JSON. The corrected JSON is the operative
proposal. No new mathematical omission or cycle was found in its 36
narrowings. This is not a claim that all mathematics in the family has been
implemented, or that the separately recorded cross-family overlaps are fixed.

## Coverage and conservation

Read the entire proposal report and review, all accepted layer and owner
records, the eleven full member documents, and all 75 distinct link reasons.
The promoted and research result JSON files are identical.

| Member | Conserved stages | Narrowed | Audited stages |
| --- | ---: | ---: | ---: |
| ArithmeticGaloisDuality | 8 | 5 | 8 |
| DeformationAndDerivedPatchingAlgebra | 9 | 3 | 9 |
| GL2ModularityLifting | 12 | 4 | 0 |
| GlobalGaloisDeformations | 8 | 5 | 0 |
| LocalGaloisDeformationRings | 8 | 2 | 0 |
| ModularSymbolsPadicLFunctions | 5 | 3 | 5 |
| MotivesAndAlgebraicCycles | 8 | 1 | 0 |
| MotivicEtaleKTheory | 21 | 3 | 14 |
| OrdinaryAutomorphicFormsAndModularityLifting | 6 | 4 | 0 |
| PadicFamilies | 8 | 4 | 8 |
| SelmerIwasawaCohomology | 5 | 2 | 5 |
| **Total** | **98** | **36** | **49** |

All 98 original member IDs, including seven KU checkpoints, occur exactly once
in the conservation table. Its 98 pair rows cover every family evidence index
1–198 exactly once. The accepted proposal has 68 owner records, 417 links,
two roadmap extensions and nine keeps. No member stage is dropped.
The original report's old totals are addressed by finding /1.

The target-by-target comparison checked the following boundaries:

- **Cohomology and Selmer theory.** R02.1 retains coefficient-topology and
  inverse-limit comparisons beyond the continuous-cohomology carrier.
  R02.2 retains compact coefficient Hochschild–Serre comparison.
  D7 retains arithmetic compact support, twists and derived duality, using
  the anchor's general continuous cup product. Selmer L2 owns mapping fibres,
  local-condition maps and their H0 correction; L1's duality transports D7
  along the triangle. D8 retains actual adjoint and deformation comparisons,
  including the trace-kernel exception when the residue characteristic
  divides the rank. Ordinary trace-zero self-duality is not assumed.
- **Patching and deformation rings.** R03.1's complete-local coefficient
  scope is broader than the anchor's W(k) special case. R03.3 keeps depth,
  Auslander–Buchsbaum and patching algebra while importing 4D's local-ring
  toolkit. P7 imports generic Milnor algebra but keeps perfect complexes,
  minimal models, derived completion and complete-local Tor comparisons.
  R04.2/R08.1 retain the actual functors and proof of representability;
  Schlessinger's criterion alone does not construct them. R04.3 retains the
  arithmetic presentation rather than erasing it in favor of a dimension
  formula. G8 supplies the unpolarized variable-determinant construction
  needed for the stated G7 ACC+ count.
- **Local/global lifting.** L7 uses the subgroup parameter-space special
  case without pretending it constructs height-lattice moduli or their
  proper image. R08.4 keeps the rank-two component theorem; R08.5 keeps
  dyadic exceptions. R22.6 now imports both while retaining the global
  Hypothesis H argument. R22.3/R22.4 retain arithmetic patching and component
  matching, distinct from the abstract module or complex theorem. The
  Skinner–Wiles/BLZ branch is not replaced by Pan's different prime range.
- **Symbols and families.** General-level cohomological symbols and
  Eichler–Shimura remain at Symbols L0 beyond the homological MF8 and
  level-one MF11 inputs. Integral signed periods and small-slope control
  remain at L1/L2. Families L1 retains its measure, congruence/period modules,
  integral specialization and change-of-basis distinctions. Families L2
  retains modular eigenmodules and nonflat specialization beyond the
  eigenvariety machine; critical/secondary constructions have a single
  Families L3 owner. The ordinary projector does not follow from finite
  generation alone.
- **Motives and K-theory.** M.1/M.2 retain realization and comparison
  obligations beyond Galois duality. M.4 imports ordinary Chow theory
  from SF.5 while retaining higher cycles. MC.4 consumes effective
  correspondences and cancellation from M.5a, then retains Tate
  stabilization, geometric comparisons and explicit scope extensions;
  it does not depend on the completed norm-residue theorem M.5.
  M.8 retains its Chern/regulator arithmetic interfaces while importing
  Selmer formalism and syntomic/p-adic comparison inputs.

These are ownership and conservation checks. They do not certify the proof
leaves of KW, ACC+, Kisin, Hida, Pollack–Stevens, Bellaïche or Voevodsky.
The integrated patching and families packet inventories still list genuine
source/decomposition gaps. No claim is made to have reread every external
consumer blueprint or every anchor document in full.

## Sources and pinned library checks

Read the targets and explanatory notes of all 49 member entries in
`data/library-coverage.json`. The 49 unaudited stage records are not evidence
that any declaration is absent.

Direct source reads used Mathlib
`082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`:

| File at the pin | Checked statement and consequence |
| --- | --- |
| Mathlib/RepresentationTheory/Homological/ContCohomology/Basic.lean, 30–160 | `TopRep.homogeneousCochains`, `continuousCohomology`: general topological carrier, not the arithmetic inverse-limit comparison. |
| Mathlib/RingTheory/Artinian/Module.lean, 285–350 | `LinearMap.eventually_codisjoint_ker_pow_range_pow` uses Artinian; `eventually_isCompl_ker_pow_range_pow` and `isCompl_iSup_ker_pow_iInf_range_pow` use Artinian and Noetherian. This does not supply the entire profinite ordinary-projector construction. |
| TauCeti/RepresentationTheory/Homological/ContCohomology/InternalHom.lean, 255–340 and 425–450 | `TauCeti.InternalHom`, `evalPairing`, `evalPairing_equivariant`: existing discrete-wrapper evaluation/conjugation input, not an unrestricted compact duality theorem. |

Other library statements remain inherited audit assessments, not a fresh
exhaustive library search. No missing-library finding is asserted.

Primary HTML sources reopened on **2026-10-01**:

- [Stacks 08TB, §13.34](https://stacks.math.columbia.edu/tag/08TB):
  triangulated derived limits and their choice/functoriality issue.
- [Stacks 0BKN, Lemmas 20.37.1–20.37.2](https://stacks.math.columbia.edu/tag/0BKN):
  the retained Milnor lim¹ term and derived pushforward comparison.
- [Stacks 0FFZ, §45.3](https://stacks.math.columbia.edu/tag/0FFZ):
  rational Chow correspondences, composition, identity and graph convention.

The selected anchor reads were ProfiniteCohomology's scope/carrier and
Layer 12; ModularCurves 0G, 4D, 7D and 7F; ModularForms 7, 8, 10A and the
relevant Layer 11 period-polynomial comparison. SF.5 explicitly owns
ordinary Chow groups and their operations. Relevant cross-family owner
records, especially RS-16's complete-local algebra and determinant split,
agree with these assignments.

## Graph checks

Fresh `scripts.build.assemble(require_distances=False)` yields 2907 stages
and 8322 edge records. Of those, **8246** edges have two actual stage IDs;
Kahn's algorithm visits all **2907** vertices. The other 76 edges touch
`UPSTREAM:` metadata proxies; they are not stage prerequisites between
two stage records and must not be silently counted as a stage DAG.

Independently, apply every accepted restructuring except RS-08 to
`data/atlas.json`, then add **all 417** RS-08 links without relying on the
cycle filter. The nontrivial strongly connected components of the graph
including proxies are unchanged (37 before and after). Thus no new cycle
is masked by the builder. Normal assembly records no skipped RS-08 links.

All link endpoints resolve, no link is self-directed, and the **427**
checks from each declared supplier to its narrowed layer and each original
direct consumer succeed. In particular, Selmer L1 reaches D8, G8 reaches
G7, and SF.5 reaches M.4. The accepted deletion of L3 as a D8 supplier is
respected. No Tau Ceti roadmap or stage is edited by the proposal.

Reproduction: load the accepted files using `scripts.restructure.load_accepted`;
apply the other proposals, form the union with RS-08's `links`, and compare
the nontrivial SCC vertex sets before/after. For forwarding, enumerate
`suppliedBy` and the original outgoing `stageEdges` of each narrowed
stage, then test reachability to the stage and to each consumer (excluding
the trivial supplier=self case). Compare the report's stage-table IDs
against all raw member stages, and its pair-table indices against 1–198.
This checks original consumers without confusing packet nodes with stage IDs.

## Finding RT-RS-08/1 — stale report after accepted corrections (low)

The current report gives several superseded instructions:

| Report location | Stale instruction | Accepted decision |
| --- | --- | --- |
| §3 D/D8, line 225 | Import “control maps from L3”. | D8 imports Selmer L2 and P7; the false Iwasawa dependency was removed. |
| §3 D/R02.5, line 230 | Keep/prove the local tangent identifications. | R08.6 owns the actual local tangent calculations; R02.5 keeps the Selmer comparison. |
| §3 T/R22.6, line 256 | Action is “keep”. | Action is “narrow”, importing R08.4/R08.5. |
| §3 V/R08.4, line 286 | Include dyadic hypotheses. | R08.5 retains the dyadic local calculations. |
| §3 M/M.8, line 337 | Keep p-adic regulator constructions. | PadicHodgeRegulators D.2/D.5 supply the syntomic/p-adic comparison input. |
| §3 F/L1, line 356 | Prove “family flatness”. | The accepted scope retains the actual module, period and control constructions without this unsupported addition. |

REV-RS-08 lines 100 and 115–127 explain these corrections explicitly;
the accepted JSON implements them. Its totals are 36 narrowed layers,
68 owner records and 417 links, whereas the report still advertises
35/59/385. The same report's pair-table row 23 already names R08.6
correctly, making the stale conservation row internally inconsistent too.

**Fix:** synchronize the report's operative summary and tables with the
accepted JSON. Keep historical snapshot receipts and original-run counts,
but label those as pre-review history. No change to the accepted mathematics
is requested. Severity is **low** because the promoted operational JSON
already carries the repairs; this finding concerns contradictory presentation.

## Existing findings and limits

`RT-AREA-langlands-2/18` and its verifier already record the surviving
R08.3/L7 potentially-semistable-ring overlap. `RT-AREA-ktheory-2/18`
and its verifier already record the étale-Chern overlap involving M.8,
PadicHodgeRegulators D.2 and Habiro. Both are confirmed. This review read
those records and the relevant member contracts; it neither duplicates
the findings nor represents those pending corrections as already applied.
The original review also flags these coordination questions.

No upstream roadmap correction is proposed. No implementation status is
changed, and no source theorem is being claimed newly proved.

## Validation

- `python3 scripts/check_redteam.py research/blueprint/redteam/RT-RS-08.result.json`
- `python3 research/blueprint/intake.py check-files research/blueprint/redteam/RT-RS-08.result.json research/blueprint/redteam/RT-RS-08.md`
- `git diff --cached --check`

No Lean file is required by this issue; no Lean build, Lake cache, or
language server was run.
