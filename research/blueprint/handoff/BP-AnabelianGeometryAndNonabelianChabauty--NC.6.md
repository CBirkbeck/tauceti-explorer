# BP-AnabelianGeometryAndNonabelianChabauty--NC.6

Agent: Codex — codex-y2NpRL. Issue: #6347. Date: 11 October 2026.
Disposition: **blocked checkpoint**, with all authorized NC.6 analysis and
proposal work supplied.

## Result

The scoped packet covers only AnabelianGeometryAndNonabelianChabauty:NC.6,
has part NC.6 and remains partial. It has zero mathematical nodes, API items,
typed tests, planets, supplier requests and baseline declarations, and one
structural gap. The reader assigns each former output to its mathematical
owner, specifies which data and hypotheses an ED.6 consumer must preserve,
and distinguishes profinite reconstruction, local-locus finiteness and exact
global-point certification. The Lean companion contains comments only.

The embedded rescope proposal names the drop and its suppliers in the
PROTOCOL §15 layer/owner/link form:

- Drop NC.6, supplied by NC.1–NC.5 and EffectiveDiophantineMethods ED.6.
- Remove NC.1 → NC.6 and NC.5 → NC.6.
- Preserve the existing NC.5 → ED.6 edge and the NC.2 → NC.3 → NC.4 → NC.5 chain.
- Retain the NC.1 reconstruction output independently; the existing ED.6
  algorithm requires no new NC.1 → ED.6 dependency.
- Leave mathematical supplier gaps and conditional inputs with their owners.

This matches the reviewed library audit's process verdict and the parent
packet's explicit proposal. The parent's accepted planning pass does not
accept a structural drop. Its NC.6 coverage still records removal pending
acceptance. The ED consumer packet's latest review is needs_changes; references
to its nodes establish ownership and obligations, not ready implementations.

## Exact blocker and resumption

PROTOCOL §15 says a dropped layer can have closed coverage with no nodes only
after its restructuring is accepted. No accepted
research/blueprint/restructure/RS-*.result.json currently drops NC.6.
The checker enforces that distinction: node-free planned/closed coverage needs
an accepted drop; a complete pass with partial coverage and zero nodes fails
the under-budget completion rule. Source-decomposed coverage would also falsely
erase the pending structural work. The issue forbids adding process nodes or
duplicating the suppliers.

Recording an accepted RS result and applying its graph change require files
outside #6347's four permitted deliverables. This is the only remaining NC.6
work, and further source decomposition of this process stage cannot resolve it.
This checkpoint is due to that external blocker, not the run's time limit.
Do not repeat mathematical planning in NC.6 while awaiting the decision.

The maintainer/independent restructuring review can use the packet's
restructure[0] proposal directly. In an authorized restructuring result,
record layers[AnabelianGeometryAndNonabelianChabauty:NC.6] with action drop,
the suppliedBy list, the six ownership assignments and the preserved
NC.5 → ED.6 link. Once independently accepted, an authorized integration
removes NC.6 and its two incident edges. A worker can then cite that exact
accepted result, set this scope's coverage to closed with remaining empty,
clear the structural gap, and mark the packet closed without adding nodes.
If the reviewer instead identifies new mathematics, assign a target to its
mathematical owner or explicitly rescope the layer before another blueprint pass.

No existing packet, campaign document, atlas data, restructuring result or
upstream roadmap was edited. No mathematical notion moved across upstream
tiers. No claim about readiness of NC.1–NC.5 or ED.6 follows from this removal.

## Reading extent and source issues

Fresh primary readings are recorded by version, date, SHA-256 and exact
selected sections in the packet. They cover Mochizuki's introduction and §10;
Kim's introduction; Balakrishnan–Dogra I's introductory target statements;
BDCKW's local-condition and eventual-equality formulations; and BDMTV's
algorithm/precision boundary in both preprint v4 and the version of record.
They are selected interface/ownership readings, not full-paper proof
decompositions or a new audit of the other stages.

The two sourceIssues repeat existing ED findings with provenance and no
independent-review verdict added here: E21's tail-truncation condition, still
present in published Lemma 4.7, p.1136, and E30's preprint phi-branch misprint,
corrected on that published page. Their own-word records and version hashes
prevent an NC.6 export from silently restoring the uncorrected conditions.
No new source error is claimed.

The atlas campaign documents for this roadmap and EffectiveDiophantineMethods
were read in full. Relevant parent coverage, restructuring, handoff and
torsor-classification statements, the reviewed NC.6 audit, and the seven named
ED.6 consumer nodes were inspected. There is no integrated decomposition for
this roadmap. The parent's 363 node objects were not re-reviewed as a whole.

At upstream roadmap commit 070dc2becd74419e76303ede84b465ed4a69461f,
ProfiniteArithmetic and Completed/EffectiveBounds README documents were read
in full; ProfiniteArithmetic Suggested.lean Layer 2 and the full
EffectiveBounds Suggested.lean were read. At current Tau Ceti commit
a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039, the MvPowerSeries/Evaluation module
documentation was read. These are separate from the fixed blueprint pins.
No generic upstream API is re-planned, and no fresh exhaustive library
absence claim is made. No restricted book was needed or copied.

## Checks

- python3 scripts/check_blueprint.py
  research/blueprint/packets/AnabelianGeometryAndNonabelianChabauty--NC.6.json:
  zero errors and zero warnings; partial, zero nodes, one gap.
- Ownership/graph consistency screen: all supplier/owner ids exist; both
  removed edges and the retained edge exist; the stated unipotent chain
  exists; canonical atlas NC.6 has no consumers; no accepted restructuring
  drops it; no other blueprint node realises NC.6.
- lean-check
  research/blueprint/suggested/AnabelianGeometryAndNonabelianChabauty--NC.6.lean:
  exit 0, no errors or warnings, in the shared pinned Mathlib 082e2d37e8 build.
  Available memory was 101 GiB before the single serial check.
  This is a comment-only syntax check; it validates no mathematical target,
  source theorem, finite certificate or supplier signature.
- Source versions/hashes, relative document links, JSON syntax and allowed
  deliverable paths checked; git diff --check passes.

All resumption information is in these four deliverables. No scratch artifact
is required. No background process is left running.
