# Euler systems revision-2 review

Issue [#10780](https://github.com/CBirkbeck/tauceti-explorer/issues/10780), job
`REV-EulerSystemsAndKolyvaginSystems~2`. Codex session `codex-cc7dWg`, branch
`codex-cc7dWg-review-euler-systems-r2`.
[Claim confirmation](https://github.com/CBirkbeck/tauceti-explorer/issues/10780#issuecomment-6269457193).

**Complete independent review; accepted as a partial target-level plan.** This is
not a checkpoint. The packet's `status: complete` describes completion of this
planning pass. All nine stages remain `planned`, none is `closed`, and every
implementation remains `unchecked`. The previous review is preserved. This
session authored neither blueprint nor revision nor the preceding review.

The durable [review report](../reviews/REV-EulerSystemsAndKolyvaginSystems~2.md)
contains the mathematical assessment, every target's verdict, the baseline
register, source finding verdicts, ownership and validation. The
[packet](../packets/EulerSystemsAndKolyvaginSystems.json) and
[reader](../readmes/EulerSystemsAndKolyvaginSystems.md) incorporate the corrections.
The [suggested Lean file](../suggested/EulerSystemsAndKolyvaginSystems.lean) was
read and elaborated successfully; it needed no changes.

The review covers 151 targets (124 imported, 27 local), 61 definition/construction
APIs, 427 API entries, 223 tests, 45 planets and all 46 distinct pinned baseline
declarations. The selected scaled descent, global restriction bound, general
character local operator and ordinary coefficient-prime comparison now have
adequate explicit target-level routes. The report explains the necessary
hypotheses and distinguishes conditional supplier work from completed proofs.

Corrections made here:

- ES.4 finite-depth variant: use Rubin's published Theorem9.3.3, pp.179–180,
  with annihilator `((M):a2)a1`, replacing the reversed factor in the 1999 draft.
  Added zero/primitive and compatible bounded-divisibility checks.
- ES.8 zero/torsion Euler class: index0 makes the ideal inclusion automatic;
  it does not force the dual characteristic ideal to vanish.
- Narrowed E911 to the stray coefficient symbol in LTXZZ's published proof.
  Its full-exponent Lemma2.3.4 is valid. Added version-scoped E912–E914 and
  rechecked all 22 source findings, preserving the earlier verdict history.

Both imported part files remain untouched and hash-pinned. Reconstruct the
whole by applying string-leaf corrections, field additions, prerequisite
removals/additions, stage assignments, then local nodes. Stage assignments
update both `parentStageId` and `realises`, preserving stable IDs. The whole
26-request list replaces the imported union. The report gives both SHA-256 pins.

The next work is packaging. Preserve the exact 26 supplier contracts and the
two recorded limitations: the original Kolyvagin1990 source was not read, and
the classical square-index constant uniform in K remains an arithmetic
application request. An annihilator-exponent bound does not close the latter.
Do not turn the residual full/unramified mu input into an assumed ordinary
mu conclusion. CM CZ.3 owns finite-character mu=0, including exceptional
characters in both orientations; ES owns the residual transfer and the
ordinary Poitou–Tate argument.

Resolve the late application as the proposed bundle or ES PartII before
introducing roadmap edges: generic ES.8 → CM CZ.2/CZ.3 → residual transfer →
ordinary comparison → late integral application. The node order is acyclic;
unsplit roadmap names would create a cycle. Generic ES.8 uses ES.5, not ES.7.
The existing eight restructuring proposals remain proposals; this job changes
no campaign graph or other roadmap's files.

The supplied current upstream tree and TauCeti library, including the nine
newer and four Completed roadmaps, were checked for duplication. The order file
reports PadicMeasuresIwasawaAlgebras merged, but that roadmap is absent from
the supplied upstream tree. Its atlas contracts were checked; the packager
must identify the actual upstream target/version or preserve the exact
extension contract. Generic algebra must not be replanned under ES.

Validation: blueprint checker reports zero errors/warnings; a separate full
assembly audit passes hashes, overlays, 151-node coverage, internal DAG, layer
order, all API/test names in the reader, baseline reference coverage and planet
limits. Packet source-issue/version validators pass. Sorry-data validation
passes. `lean-check` succeeded at the pins with 15 `declaration uses sorry`
warnings and no errors. The 356-line file contains no admitted data definitions.
Intake deliverable-path validation and `git diff --check` pass.

Published LTXZZ and Zhang were read in the cleared library copies, in place;
no files or passages were copied. Other source versions, hashes, locators and
edition limits are durable in the packet and report. Scratch has no unique
handoff material and is removed after submission. No background process remains.
