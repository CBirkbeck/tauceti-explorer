# REV-AInfCohomology — complete

Codex, session `codex-T6I7bf`, 13 October 2026. Refs #9377. Independent of BP-AInfCohomology session `codex-tzz4ur` and both imported-part workers. This run took one job.

The [review report](../reviews/REV-AInfCohomology.md) accepts the [whole-roadmap packet](../packets/AInfCohomology.json) after in-place correction. Its `review.checked` contains all **226 targets: 151 verified, 75 corrected, zero added or unverifiable**. All **59 baseline citations** are confirmed; none removed or replaced. Checked all sources, exact hypotheses, proof routes, suppliers, APIs/tests, reader consistency, library reuse and nine assigned red-team findings. Reconfirmed 21 source findings and added four, all with this review's verdict. The corrected reader has 249 API items, 190 tests and 44 planets.

All ten stages remain **planned**, none **closed**. The pass is complete, with **25 supplier requests and 17 gaps**. There is no remaining work for this review; those explicit supplier/proof boundaries are the follow-up work, not implemented inputs. The report records every correction and the source editions and reading limits.

## Packaging instructions

The historical AI.0 and AI.6 parts are unchanged and retain their exact import hashes. Load the 197 imported targets and 29 main-packet targets. For each imported target apply `assembly.importedNodeCorrections[id].fields`, then replace prerequisites with `assembly.importedPrerequisites[id]`. The field replacements are authoritative for sources, statements, proofs, APIs and Lean metadata. `importedTextReplacements` is now empty: ownership changes are explicit field overrides. The complete reader is the corrected specification. The stock checker does not interpret this assembly, so packaging by concatenating old parts would reintroduce incorrect statements and upward dependencies.

Redirect the moves already recorded in `assembly.moves`:

- CP.3's ten required canonical B_dR⁺ targets → AI.6, before the semistable comparison consumers.
- RT.6's nine required relative/absolute trace-prefix targets → AI.7. Keep generic spectral/norm/Tate carriers at E5:abstract.
- CP.0 finite-Witt coherence → AI.0/witt-coherence.
- CP.5 generic perfectness/Tor and module structure → AI.2/ainf-module-perfectness and AI.2/ainf-module-structure.

AInf remains tier 13 in the PadicHodgeTheory/PerfectoidQuotients/PrismaticCohomology bundle. The requests retain their lower-tier or bundled owners. In particular the early primitive proper comparison, nonnoetherian A_crys bridge, punctured analytic endpoints and exact comparison-map identities must not be replaced by later theorems or mere object equivalences. Read G-01–G-12 and the five named additional gaps for their precise contracts. Integrate the accepted AUDIT-35 AInf audit into the aggregate library register when appropriate.

## Checks and files

- Stock packet validator: **0 errors, 0 warnings**, with the pinned declaration index.
- Effective 226-target assembly/reader audit: hashes, import and coverage equality, all verdicts, source matches, acyclic prerequisites, API/test inventory, acceptance clauses, requests/gaps and planet caps passed.
- Source-finding schema and edition helper checks: **no errors**, 25 confirmed findings.
- Suggested Lean: `lean-check` **exit 0**, only **16 declaration uses sorry warnings** at the pinned Mathlib. The file imports Mathlib only; no change was needed. Its 164 lines contain ten real light definitions, nine theorem statements and seven examples. The remaining targets are accurately marked as reader-only or partial.
- JSON, allowed-file and whitespace checks passed.

Only the main packet, main reader, this report and this handoff were changed. Imported parts and the suggested file were verified without edits. No source excerpt, copied library document or local path is in the deliverables. Current upstream/library commits and the overlap check are recorded in the report and packet. Scratch audit scripts and source downloads are transient and are removed after the pull request opens; all information needed by the next worker is in these deliverables.
