# Handoff: REV-FIX-RT-AREA-ktheory-1~2

Refs #5542. Codex (GPT-6), session `codex-ZlHsdM`, 17 October 2026.
Claim 6241672571 was confirmed by bot comment 6241675270.

**Blocked checkpoint: the issue authorizes seven packets, but the current
queue requires nineteen.** [WORKERS.md](../WORKERS.md), Doing the work,
says “Edit only the files the issue names.” This session requested expanded
authorization; none had arrived when preparing this checkpoint. Only the
review report and this handoff were changed. No second job was claimed.

## Exact completion blocker

The current `issues.py:deliverables_complete` returns false. All 39 outputs
exist, but twelve suppliers have other review identifiers. The same predicate
on a scratch-only job restricted to the issue's seven packets returns true.
The existing negative verdicts are completed review outcomes, not the blocker.
Do not repeat the original seven-packet review, overwrite independent reviews
without evaluating the relevant fixes, or modify queue scope to bypass review.

The previous checkpoint's 22-packet scope is stale. Current additional
basenames, each naming a packet under `packets/` and a matching Lean file
under `suggested/`, are:

1. `BorelRegulators`
2. `MotivicEtaleKTheory--M.1`
3. `StableHomotopyKTheory`
4. `KTheoryLowDegrees--U.1`
5. `KTheoryLowDegrees--U.6`
6. `SpecialValuesBirchTate`
7. `MotivicEtaleKTheory--M.5d`
8. `SchemeKTheoryOperations`
9. `KTheoryLowDegrees--U.4`
10. `K2SymbolsBrauer--T.1-classical`
11. `K3BlochGroups--V.1`
12. `KTheoryFiniteLocalFields`

Arithmetic N.2, N.3-finite-generation, N.5 and low-degree Z.3 were removed
from the queue's earlier list; classical T.1 was added. Z.3's historical Lean
errors therefore belong to a different job unless expressly reassigned.

## Fresh work in this run

- All nineteen current packets pass `scripts/check_blueprint.py` with zero
  errors and warnings.
- The new classical T.1 supplement elaborates with `lean-check`: zero errors,
  sixteen `sorry` warnings and no other warnings, at the atlas pins. Memory
  exceeded 20 GB. The other eighteen files were not recompiled in this run.
- A targeted source check verified the supplement's centrality/trivial-action
  criterion against the actual pinned conjugation and InducesAction API.
  The supplement imports 43 parent T.1 nodes and keeps the existing Hopf/UCE
  ownership; this does not certify its remaining imported refinements.
- The report's new opening contains the actual twelve reviewer identifiers,
  the source locations and the compiled file's hash. Older source records,
  38 finding dispositions and corrections remain explicitly historical.
- No packet, review object or Lean declaration was changed. No build, update,
  cache download, language server or upstream mutation was performed.

## Mathematical boundaries retained from the prior review

The original seven verdicts remain accepted for Arithmetic N.1, symbols T.1
and K3BlochGroups; needs changes for general K.1/K.6, arithmetic N.7 and
symbols T.3. These concern the area fixes, not every unrelated packet gap.

- K.1/K.6: actual parent stages still need the early-construction/product and
  late-cofinality splits. An acyclic internal node graph does not establish
  an acyclic stage projection. The previous report identifies K.3/K.7 and
  K.6/K.7 dependencies and the embedded proposals.
- N.7: cyclotomic generation needs Zhang–Xu's Uₘ-compatible representatives,
  finite membership data and the Skalba input or a separately verified route.
  Norm(2)=16 < (25/16)·11, with 2 inert in ℚ(ζ₅), shows that the numerical
  bound alone does not rule out later prime support; it does not refute the
  theorem or a specified rounding algorithm.
- T.3: the arbitrary-residue complete-DVR norm/valuation/length contract is
  broader than upstream LocalFieldsRamification's finite-residue scope.
  ℚ((t))→ℚ((s)), t=s², is the test case: norm(s)=−t, residue degree one.
- T.1: preserve the executable odd-order Heisenberg sign control. Its actual
  transgression comparison remains admitted. CFT6 separately owes the proof
  of the character-evaluation identity referred elsewhere by Milne III.3.6.
- Historical supplier issues include H.3/H.6 rational-Hurewicz ownership and
  M.7 Dedekind truncation/naturality. Inspect their current nodes after scope
  authorization; do not treat old missing-input claims as current evidence.
- U.1's unchanged Lean file was previously reported to fail in Fin inequalities,
  native Morita smallness universes and ℚˣ-versus-ℚ parameters. It remains a
  queue output; recheck and repair after authorization. No fresh compilation
  claim for that file is made here.

## Where to resume

Obtain explicit authorization for the twelve additional packet/Lean pairs,
or reconcile the live issue with the queue. Then perform a scoped review of
their area-fix obligations, preserve their review history, correct clear
errors and record this job's verdicts. The full report supplies all earlier
finding and source details; nothing in deleted scratch is needed.
