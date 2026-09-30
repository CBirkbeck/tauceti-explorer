# FIX-RT-LINK-tauceti_TauCetiRoadmap_AlgebraicCurves

Codex · `codex-5ebb6f` · issue #5031 · 2026-09-30 · complete repair.

Both confirmed findings are fixed, including the low-severity ledger finding.
The AlgebraicCurves map now contains 50 links and 11 overlaps. It requires a
new independent review before the repaired revision can be promoted.

## /1 — Restore the four lost imports exactly once

Moved AC-L28–AC-L31 from `alreadyRecorded` into `links`, retaining their
stable IDs, source/target pairs and all eight inherited evidence quotations.
Added source paths and exact line locators to those quotations. Replaced the
incorrect cross-map deduplication reasons with the actual supply contracts,
removed `recordedIn`, and set each confidence to `inferred`. The consumer
names the supplier, while the supplier does not name this consumer.

All four target ModularCurves Layer 10:

| Link | AlgebraicCurves supplier | Contract and boundary |
| --- | --- | --- |
| AC-L28 | Layer 7 | Different divisor and finite-separable Hurwitz formula, including constant-field factors and the residue-separability qualifications of tame different computations. Translate to the consumer's componentwise Euler-characteristic form. |
| AC-L29 | Layer 8 | Function-field decomposition/inertia, lower ramification and Hilbert different exponents, with residue-inseparability qualifications. No unrestricted upper-numbering or arbitrary-residue local-field import. |
| AC-L30 | Layer 9 | Kähler/Weil differential comparison under its perfect-constant-field hypothesis, used with the separate finite-separable different package. |
| AC-L31 | Layer 12 | Regular-projective point/place/divisor dictionary and the cohomological comparison under separable-generation, smooth-proper and geometric-connectedness hypotheses. Verify the component/base-change hypotheses before summing over disconnected fibres. |

Relative constancy of the Euler characteristics and assembly across
characteristics remain ModularCurves obligations. Layer 12 does not supply
relative coherent cohomology or base change. No new node or roadmap is needed;
the defect was the loss of imports of existing planned contracts.

The ModularCurves research map is unchanged, as the confirmed fix prescribes.
It does not emit these four pairs. No generated `data/links` copy is edited.
The original 46 links and all 11 overlaps retain their contents.

Updated the summary and coverage annotation to describe the repair without
claiming a fresh catalogue-wide screen. Preserved the former acceptance,
including its now-superseded deduplication removals, under `reviewHistory`.
The current `review` is pending and explicitly requests renewed independent
review; it no longer attributes these imports to another emitter. This avoids
promoting an unreviewed revision merely because the fix changed an old
accepted review's signature.

## /2 — Reconcile the two stale examined notes

Changed both entries to `result: links` and named their existing suppliers:

- `InverseGaloisAndArithmeticFundamentalGroups`: accepted
  `data/restructure/RS-29.result.json` supplies AlgebraicCurves Layer 8 → IG.1.
  Keep finite function-field decomposition/inertia and lower ramification
  separate from IG.1's general scheme exact sequence and smooth-proper
  specialization targets.
- `KTheoryLowDegrees`: accepted `data/restructure/RS-18.result.json` supplies
  AlgebraicCurves Layer 12 → Z.5 and → Z.6. The regular-projective dictionary
  does not discharge the general regular noetherian, potentially nonproper or
  arithmetic curve theorem and its extra resolution/dictionary obligations.

Those three dependencies are already live and are not re-emitted. This fix
uses the current accepted restructuring records and does not repeat the
reversed historical promotion chronology corrected by the verifier.

## Evidence and graph verification

Base: `aa27ea5bc3998947dacd413309e2ba302bffb0a2`. Read both findings and both
confirmed verdicts; the four carried contracts and evidence; ModularCurves
README lines 2168–2192; the relevant AlgebraicCurves different, lower-group,
differential and Layer-12 comparison passages; and the complete relevant
RS-29/RS-18 layer/import records. Consulted the reviewed library-coverage
statuses and duplicate records for Layers 7/8/9/12. This change makes no new
library implementation claim and does not decompose or certify the source
theorems' proofs.

Ran the production `scripts.build.assemble(require_distances=False)` in memory.
The baseline has 2,840 stages and 8,249 distinct edges. None of the four
restored pairs is present. All three restructuring dependencies from /2 are
present and populate the corresponding consumer `requires` lists.

Then simulated a future accepted/promoted repair in memory only, through
the assembler's real link merger. The candidate has 2,840 stages and 8,253
distinct edges: exactly the four restored pairs are added, and all four
populate ModularCurves Layer 10's `requires`. Both complete graphs pass
acyclicity when their external proof endpoints are included (2,891 total
candidate endpoints). A check limited to drawn stages would omit those
external prerequisite nodes and is not the full mathematical graph.

The repository file remains pending. `promote.decide` skips it for lack of
a new accepted review; no scratch simulation is published as an independent
verdict. After renewed independent review and promotion, the reviewer or
orchestrator should repeat the production assembly and confirm the four
actual `data/links` imports. The repair is ready for that review; these
imports are not claimed already live.

## Validation

- `python3 scripts/check_links.py` on both named link maps: zero errors and warnings.
- `python3 research/blueprint/intake.py check-files` on the changed map and fixes report: zero problems.
- Parsed JSON; verified all eight restored quotes at their exact raw source locators, one emitter per pair, unchanged original links/overlaps and unrelated examined records, preserved original review history, and unchanged ModularCurves map.
- Production assembly and full graph checks described above; pending-review promotion gate checked.
- `git diff --check`.

No Lean compiled. There is no Lean file for this fix, and no project, cache,
library build or generated-atlas edit was created.
