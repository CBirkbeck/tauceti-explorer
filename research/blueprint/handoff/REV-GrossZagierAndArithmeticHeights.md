# REV-GrossZagierAndArithmeticHeights — handoff

This is the independent review of the consolidated GZ.0–GZ.9 blueprint (BP-GrossZagierAndArithmeticHeights, Codex `codex-fpPjYu`, PR #9580). Issue #9387; Claude (Opus), session `claude-EGtFwd`, 2026-10-14. **The review is finished; verdict: accepted.** The verdict and a per-target ledger of 51 entries are in the packet's `review` object. The full account is in `research/blueprint/reviews/REV-GrossZagierAndArithmeticHeights.md`.

## What was done

- **Resolution.** Resolved all 277 targets by the packet's `importPolicy`, after checking both part hashes. Every prerequisite resolves, and the internal graph (591 distinct edges) is acyclic.
- **Owned targets.** All 13 were checked:
  - the 4 new targets against the pinned code and CST arXiv v2, with fractions checked on rendered pages;
  - the 9 milestone copies against their accepted originals.
- **Corrections and supplier material.** All 30 target corrections were checked, as were the requests, gaps, supplier audit, restructure proposals and the 7 red-team dispositions.
- **Corrected in place** (packet and reader):
  - Six modular-forms targets were misrouted. They are re-routed to ModularForms Layers 2–3, AS.4, R14.2 and two pinned Tau Ceti declarations: the Atkin–Lehner Main Lemma and the newness criterion, now baseline entries.
  - Requests 45 and 91 are corrected, and Requests 99 (ModularForms Layer 2) and 100 (A2) are added.
  - Consumer lists are completed for the new targets.
  - Two duplicate prerequisites and one missing R12.5 prerequisite are fixed.
  - Two broken sentences are repaired.
  - Supplier-audit entries R1-partial-4 and R1-partial-7 are corrected (the latter named a non-existent roadmap id), as is one restructure roadmap list.
- **Source issue E101.** It is added and confirmed: CST Proposition 2.5 prints γ_v as the reciprocal of the γ of Proposition 2.4 and Lemma 3.5.
- **Checks.**
  - `check_blueprint.py` with the pinned index: 0 errors, 0 warnings.
  - `lean-check` of the unchanged suggested file: 30 warnings for admitted proofs and nothing else.
  - `intake.py check-files` on the four changed files: 0 problems.

## For the next worker and the orchestrator

1. **Promotion.** The atlas build does not resolve `importPolicy` or `targetCorrections`, so a promoted copy shows only the 13 owned targets. The corrected imported targets are in this packet and its reader only.
2. **Package.** The roadmap package (`research/blueprint/packages/GrossZagierAndArithmeticHeights`, needs_changes) should take the corrected modular-forms routing from this packet. It should cite `TauCeti.mem_cuspFormsOld_of_forall_coprime_qExpansion_coeff_eq_zero` and `TauCeti.mem_cuspFormsNew_iff` (both at f790474) instead of ModularCurvesPartII R12.5 or R14.5.
3. **Theta series.** TauCetiRoadmap IntegralLattices gives positive-definite lattice theta series to a Theta Series roadmap that is not yet on main. Once it lands, Request 44 (MP.5, the weight-one ideal-class theta series) should move to it.
4. **Sources.** The 2011 YZZ draft URL returns 404 and the 2013 book is not cleared, which leaves gaps 0, 6 and 8 open. E101 still needs a check against the published CST (Algebra Number Theory 8, 2014).

Nothing in this job's scratch space is needed later.
