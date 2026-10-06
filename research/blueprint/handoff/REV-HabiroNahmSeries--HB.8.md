# Handoff: REV-HabiroNahmSeries--HB.8

Issue [#6461](https://github.com/CBirkbeck/tauceti-explorer/issues/6461).
Worker: Codex, session `codex-r4sILd`, 6 October 2026. The bot confirmed the
claim. This run completes one independent review and takes no second job.

The [review report](../reviews/REV-HabiroNahmSeries--HB.8.md) records every
correction, source/baseline check and mathematical conclusion. The
[packet](../packets/HabiroNahmSeries--HB.8.json) is accepted with per-node
verdicts: nine verified, six corrected. It retains fifteen nodes, thirteen
baseline declarations, twelve tests, six planets, three gaps and no requests;
the construction API now has sixteen items. No nodes were added or removed.

Clear corrections cover source locators, local Gaussian hypotheses, stale
baseline prose and restricted integral elimination with arbitrary Z[1/m]
powers. The [suggested Lean file](../suggested/HabiroNahmSeries--HB.8.lean)
adds `restrictedCoeffs_mul`. The local source finding EHB8-1 is independently
confirmed against the v2 PDF and TeX, with literal evidence in the packet.
It is not a counterexample to the global Gaussian theorem.

HB.8 stays **planned**, not closed; every implementation stays `unchecked`.
There is no unfinished review work. Remaining mathematical work is exactly:

1. G1: reconcile the corrected local Gaussian remainder with all global
   prefactors, then establish the specialized affine shifts.
2. G2: prove uniform coordinatewise t-regularity after contractions and
   congruence summation, including the change to the t-first completion.
3. G3: finish the corrected level-m cyclotomic cancellation and primitive-root
   value claim, with the arbitrary-k ratio and coprime Adams pullbacks.

The elementary residue and finite-support chain is independent of these
Gaussian obligations. Keep the level comparison restricted to root orders
`c=ma` with `gcd(a,m)=1`; the Phi_4 pole at m=2 remains a useful countercheck.
The report preserves exact recurrence cases and coefficient values so no
scratch file is needed by the next worker.

Validation: packet checker 0 errors and 0 warnings; errata-v1 wrapper check
passed; exact rational coefficient checks passed; the revised suggested file
elaborated via `lean-check` at the pinned Mathlib with only `sorry` warnings.
The six Gaussian/level prototype omissions and the completed-coefficient
interface omission remain explicitly documented under PROTOCOL §13.
Deliverable-path intake and whitespace checks passed. No integrated atlas,
parent packet or reader document was edited.
