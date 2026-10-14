# DM.8 revision 2: reader reconciliation complete

Issue: #9314. Job: `BP-DrinfeldModulesAndTModules--DM.8~2`.
Worker: Codex (GPT-6), session `codex-Oq1NOv`, 14 October 2026.
The bot confirmed `/claim Codex — codex-Oq1NOv` before work began.

## Completed return conditions

The [reader](../readmes/DrinfeldModulesAndTModules--DM.8.md) now agrees with the
corrections in the [packet](../packets/DrinfeldModulesAndTModules--DM.8.json).
The [independent review](../reviews/REV-DrinfeldModulesAndTModules--DM.8.md)
finished its mathematical audit and returned the job solely because its issue
did not authorize editing that reader. This revision closes that return condition:

- Reconciled all 19 corrected node blocks, including their exact statements,
  proof routes, source locators and direct inputs. Preserved all 48 node IDs,
  their hypotheses and target conclusions.
- Reused MC.6's existing arbitrary-field neutral reconstruction, tensor-generator
  finiteness and fibre-functor torsor nodes. Requested only the remaining generated
  subcategory, group-map recognition criteria and graded-category group computation.
- Reused SF.1's affine descent and torsor nodes. Restricted its remaining request
  to vector-group torsor splitting after the particular kernel is proved vectorial.
  Routed dimension to SF.0's existing theorem and recorded bounded-generator
  filtration growth as a distinct remaining export.
- Matched the current univariate restricted-series norm exports, SF.3's existing
  degree bounds, and the required transport of the finite-field Lang morphism
  after base change to the larger algebraically closed coefficient field.
- Included both reviewed native spectrum declarations, all nine supplier
  contracts, seven source records, six preprint/publication version records and
  all eight confirmed source findings. Removed the stale claim that six findings
  await review. E-DM8-8 explicitly reuses PAPER-NGODAC-21/E10.

The packet and suggested Lean file are byte-for-byte unchanged from the claimed
checkout. Their reviewed in-place corrections were checked against the actual
supplier statements and the source readings described below. The packet's review
object remains untouched, including `needs_changes`; acceptance belongs to the
next independent reviewer. Packet status is already `complete`, coverage remains
`planned`, and the three honest gaps are preserved. This is a completed revision,
not a checkpoint or an implementation claim. No ownership or tier move was made.

## Evidence and reading boundaries

Read the DM.8 row of `data/library-coverage.json`, the full review report and the
accepted node specifications. Read MC.6's `neutral-tannaka-reconstruction`,
`tannaka-finiteness-recognition` and `tensor-iso-torsor`; SF.0's
`algebraic-scheme-dimension` and `jacobson-finite-type`; SF.1's
`affine-fpqc-descent` and `torsor`; and SF.3's `line-bundle-degree-bounds`.
These confirm the narrowed imports and requests rather than adding owners.

Inspected current TauCetiRoadmap main
`0d144d044dacebca17b654695b6f1ad58f159b27` and Tau Ceti
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039` read-only. Read the
GrothendieckEulerForms and JacobianChallenge readers in full. Checked AdicSpaces
layer 0.5, ReductiveGroupsPartII RG2.3.7 and the `Lang.lang_surjective` signature,
and the actual current `TauCeti.PowerSeries` norm instance and three named norm
lemmas. No current upstream build or library installation was run. The reader
distinguishes this snapshot from the earlier continuation/review snapshot.

Fresh primary-text checks in this revision were limited to:

- PAP-v2 pp.7, 13–14, 23–25, 28, 31, 33 and 38: analytic conventions,
  fixed-vector comparison, ideal/torsor descent, geometric invariants,
  subobjects, bounded monomial growth and the zero-exponential case.
- Published ABP printed pp.244–256 and 262–263: coefficient twist, arithmetic
  entire ring, restricted-to-entire argument, estimates, the complete lifting
  proof, and the dual-module finite-generation/freeness criterion.
- CPY-v2 Proposition 2.2.1 and its full proof, p.6: rational matrix denominators.

The three downloaded PDF hashes matched the packet's recorded hashes. The full
PAP/preprint ABP audit, multizeta consumer readings and confirmation of all eight
findings remain attributed to the independent review of 11 October 2026; this
revision does not claim to have repeated that entire audit. Papanikolas and CPY
published full texts remain uncollated. The source findings stay scoped to the
preprints. No source passages or source files were added to the repository.

The independent review confirmed all 56 baseline declarations at the recorded
pins. This revision additionally read the two added native `Spec` declarations
in the pinned Mathlib source; the declaration-index check validated all citations.

## Validation

- `python3 scripts/check_blueprint.py research/blueprint/packets/DrinfeldModulesAndTModules--DM.8.json`:
  zero errors and zero warnings; 48 nodes, 11 definitions/constructions, 43 API
  items, 33 tests, six planets, 56 baseline declarations, nine requests, three gaps.
- Exhaustive packet/reader comparison: every node statement, hypothesis, proof
  step, source locator, direct input, API, test and consumer agrees; all nine
  request contracts and 56 baseline contracts agree. Source identities, hashes,
  version URLs and all eight confirmed findings are represented.
- `lean-check research/blueprint/suggested/DrinfeldModulesAndTModules--DM.8.lean`:
  exit 0 in the shared pinned build; 118 warnings, all for `sorry`, no errors.
  Available memory exceeded 20 GB before compilation; no compiler remains running.
- Intake file checks, job-output completeness and `git diff --check` passed.

## Remaining work

The next independent reviewer should assess the reconciled reader against the
unchanged packet and suggested file, then update the review object independently.
There is no unfinished revision work. The stage's preserved implementation gaps
are the particular Carlitz logarithm-kernel separability check, the actual motive
and neutral-category interfaces, and matching the analytic/dimension suppliers.
The supplier contracts and `coverage.remaining` identify those boundaries.
