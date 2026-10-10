# Handoff: REV-FIX-RT-AREA-ktheory-1~2

Refs #5542. Codex — `codex-UC1AMR`, 10 October 2026.

**Blocked checkpoint. Do not repeat the seven-packet review before resolving
the issue/queue scope mismatch.** The issue was reread after bot-confirmed
claim 6101318506 and still authorizes only seven packets plus their matching
suggested files. The actual queue requires 22 of each. A scope clarification
was requested during this session; no expanded authorization arrived.
WORKERS.md's issue-file restriction remains applicable.

Fresh evaluations of the actual `issues.py:deliverables_complete` return
false for the 22-packet queue job and true for a scratch-only copy restricted
to the issue-listed deliverables. All files exist; fifteen supplier packets
carry other jobs' review identifiers. Negative mathematical verdicts in the
original seven are completed review outcomes, not this intake blocker.
Neither queue nor issue was changed.

All seven original packets were freshly checked: zero errors and warnings.
All seven matching Lean files were freshly elaborated serially through
`lean-check` at the recorded pins, with zero errors and only admitted
warnings: N.1 124, K.1 0, T.3 275, N.7 45, K.6 6, T.1 72,
K3BlochGroups 807. No packet or Lean declaration was changed, and their
previous review verdicts remain intact. Fresh targeted source checks confirm
the retained Quillen resolution hypothesis, Heisenberg sign control and
generic complete-DVR supplier boundary. The report records what was freshly
read and distinguishes it from prior certification.

**Next action:** synchronize the issue deliverables with the queue or
explicitly authorize the 15 extra packets and matching Lean files listed
below. Review their actual area-fix obligations, preserve old review history,
and write this job's scoped verdicts. Do not stamp reviewer ids without
checking the mathematics. All 38 original finding dispositions and retained
source evidence are in the report; nothing in scratch is needed to resume.
No second issue was claimed. Nothing was promoted or changed upstream.

## Retained handoff by codex-dqb0Wk

Refs #5542. Codex — `codex-dqb0Wk`, 10 October 2026.

**Checkpoint: the GitHub issue's seven-packet review is complete, but the
expanded queue job is blocked by a scope mismatch.**
A fresh call to `issues.py:deliverables_complete` returns false because
the fifteen added packet outputs do not carry this review job’s id. No
authorization to edit those added outputs arrived during this run. The report is
[REV-FIX-RT-AREA-ktheory-1~2](../reviews/REV-FIX-RT-AREA-ktheory-1~2.md).
It gives all 38 scoped verdicts, this run's evidence and validation, and
the retained C1–C11 corrections and source record from `codex-dbAQYQ`.
The seven packets have refreshed top-level verdicts; both prior same-job
verdicts are preserved in `reviewHistory`. This continuation strengthens
T.1’s positive transgression test with a Heisenberg-group control over 𝔽₃: the
positive boundary gives 2, the opposite sign 1. The test helpers and numerical
controls are proved; the transgression comparison remains admitted. The
report contains its derivation and the exact suggested form.

## Resume here: reconcile issue and queue scope

The issue body and full instructions name seven packets and their suggested
files. The current `queue.json` review job names **22 packets** and 22
suggested files. `issues.py`'s `deliverables_complete` checks every packet
output for this exact review id, including a negative verdict. Fifteen
suppliers still have their own different review ids. This explains why
earlier PRs that claimed a completed review were merged as checkpoints.
Negative mathematical verdicts on the seven original packets are not the
completion blocker.

WORKERS.md says “Edit only the files the issue names.” This run asked for
clarification before editing the additional suppliers; no answer had
arrived at submission. Do not silently change the queue, relabel issues,
or overwrite supplier verdicts merely to satisfy intake. The maintainer
must synchronize the issue's deliverables or explicitly authorize the
expanded review. Then review the actual area-fix obligations in each added
packet, preserve its old review in history, and write this job's scoped
accepted/needs_changes verdict. Broad unrelated packet gaps remain outside
the area-fix certification.

Additional packet basenames (each has a matching `.lean` under `suggested/`):

1. `ArithmeticKTheory--N.3-finite-generation`
2. `BorelRegulators`
3. `MotivicEtaleKTheory--M.1`
4. `MotivicEtaleKTheory--M.5d`
5. `ArithmeticKTheory--N.5`
6. `StableHomotopyKTheory`
7. `ArithmeticKTheory--N.2`
8. `KTheoryLowDegrees--U.1`
9. `KTheoryLowDegrees--U.6`
10. `SpecialValuesBirchTate`
11. `SchemeKTheoryOperations`
12. `KTheoryLowDegrees--U.4`
13. `K3BlochGroups--V.1`
14. `KTheoryLowDegrees--Z.3`
15. `KTheoryFiniteLocalFields`

The preceding continuation’s read-only structural checks of all fifteen
passed with zero errors/warnings at the pinned baseline. They were not
repeated, edited or fully reviewed by this run;
their Lean files were not compiled. Original seven files all compiled,
with zero errors and only admitted-declaration warnings: N.1 124, K.1 0,
T.3 275, N.7 45, K.6 6, T.1 72, K3BlochGroups 807. T.1’s executable
content changed only to add the sign control; its final content elaborates
with the same 72 admitted-declaration warnings. The other
six files did not change. The report distinguishes fresh source checks from
retained historical certifications. Every final packet check and `git diff --check`
passed. Current source locators and hashes are in the report; no scratch
file is needed to resume.

Accepted: ArithmeticKTheory N.1, K2SymbolsBrauer T.1, K3BlochGroups.
Needs changes: GeneralAlgebraicKTheory K.1/K.6, ArithmeticKTheory N.7,
K2SymbolsBrauer T.3. Acceptance is scoped to the area-fix obligations; the
older partial-packet gaps remain explicit.

All seven packet checks pass with zero errors/warnings at Mathlib
`082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`. Future signatures in comments are not type checked. The report distinguishes
this run's checks from the preceding continuation's three-file rechecks.
Nothing is claimed formalized; no live atlas, reader, supplier or upstream
roadmap file was edited. No standalone link map or restructuring result
was a deliverable. Scratch evidence is reproduced in the report where
needed, so resumption requires no scratch files.

## Next fix: stage ordering (/4 and /20)

The maintainer must apply the K.1/K.6 embedded restructuring proposals:

1. Make Waldhausen additivity, relative S and the relevant iteration early
   K.4:construction inputs. Remove its unused E5:abstract/H.5:spectra
   prerequisites and add its actual H.2 realization input. H.5:S-delooping
   assembles the resulting spectrum rather than replanning products.
2. Create K.7:products for `products-from-biexact-functors`, `biexact-S-grid`,
   `biexact-stabilized-pairing`, `biexact-pairing-coherence` and
   `unit-multiplication-and-K0-tensor-comparison`, keeping their node ids.
   Their proposed parents are recorded in K.6. Generic H.5 smash and
   module-boundary inputs must be independent of later K localization.
3. Create K.3:cofinality after K.4 for the general cofinality and
   Grothendieck-class/factorization nodes. Keep Quillen's original
   localization/resolution early; remove K.4→early K.3. Preserve the early
   free/projective group-completion proof in K.2:plus.
4. Give K.5 its real early ring/degree-zero-one and K.4 inputs, rather than
   unused broad K.3/H.5 dependencies or the late low-degree aggregator.
5. Recheck stage projection after application, including the early transfer
   and boundary consumers. The 467-node internal graph is already acyclic;
   current parents still induce K.6↔K.7 and
   K.3↔K.7 cycles (and the older longer K.3→K.5→K.6→K.7→K.3 cycle). Proposed parents do not apply these changes.

The next reviewer should keep the corrected one-step ambient-subobject
hypothesis distinct from ordinary resolving closure, and keep the support
space comparison distinct from the full stable fibre's negative groups.

## Next fix: N.7 generation (/11)

Read Zhang–Xu §§2–3 and expose the representative selection, equal-norm
ordering, Uₘ membership and finite data in Theorems 3.4/3.6. Obtain and
decompose the actual Skalba input, or independently validate a different
route. The old direct real-quadratic route at commit `52d782e2`, described
in the second fixes report, is an alternative to investigate, not an
accepted proof.

The norm diagnostic is `Norm(2)=16 < (25/16)·11`, with 2 inert in ℚ(ζ₅).
This refutes sufficiency of the stated bound alone; it does not assert that
a specified rounding algorithm selects 2. The Gaussian certificate and the
real-quadratic restriction/transfer reduction can be kept, but do not call
the latter a complete upper certificate before its cyclotomic generation
input is supplied. Birch–Tate supplies neither generation nor a lower bound.

## Next fix: generic complete-DVR supplier (/12 and /28)

Identify an exact supplier or route a Part II for arbitrary-residue complete
discrete valuation fields. It must export normalized extension valuations,
finite free integral-closure lattices, valuation/residue norm formulas and
componentwise finite-base-change length identities, including inseparable
residue fields. LocalFieldsRamification Layer 3's finite-residue local-field
scope does not cover `Q((t))→Q((s))`, `t=s²`. Do not narrow the intended
all-field Milnor theorem or duplicate an upstream toolkit in T.4. Keep the
pure-first finite-normalization and independent transfer decompositions.

## Supplier handoffs for the expanded review

- /5, /33: move rational Hurewicz/Cartan–Serre to H.6 and update Borel
  consumers; retain homotopy associativity and the finite-type duality scope.
- /23 is now carried: both S.4 coniveau nodes import H.6's exact-couple,
  filtered-spectrum and convergence nodes. The earlier missing-destination
  assessment is stale. This read-only check does not accept the whole scheme
  packet.
- /2: M.1/M.5d retain the requested naturality and Dedekind truncation form.
- /1, /7, /35: Borel's full coefficient/arithmetic-subgroup contract,
  degree-one separation and explicit ALS.5 import still need destination
  reconciliation.
- /17: S.2/S.5 import the ring P¹/Nil result before their scheme forms.
- /31, /37: Z.3's doubled-plane example and L.1's simple-space argument
  remain destination obligations.
- CFT6 must prove the character-evaluation identity used by T.7; Milne's
  III.3.6 states it and refers elsewhere for the proof.

K.6's Keller and finite-Artin K₃ source gaps, and the other older packet
gaps, remain outside this repair's certification. Restricted books were
not opened; their older source-issue records are historical evidence.
