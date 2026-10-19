# Handoff: REV-DESIGN-NonordinaryCMSpecialValues

Issue #1729. Reviewer: Claude, session `claude-Cm7nRe`, 19 October 2026. This is a completed independent review of the Codex design by `codex-Aw3zf7` (PR #10512), not a checkpoint. The corrected packet is accepted. No implementation and no closed stage is claimed.

## Completed work

The report `research/blueprint/reviews/REV-DESIGN-NonordinaryCMSpecialValues.md` records every correction with its source locator. The packet's `review.checked` covers all 27 nodes: 15 verified, 11 corrected and 1 added (`NCM.5/rohrlich-lattice-count`). The packet now has:

- 31 API items and 21 tests;
- 18 planets;
- 5 baseline declarations, all confirmed at the pin;
- 13 requests and 5 gaps (G1, G3, G5, G6, G7).

All six stages are planned; none is closed.

The main changes are these.

- **Gaps G2 and G4 removed, with the DT.2, CM.4 and AL.5 requests.** Rohrlich 1984 §3 supplies the counting, derived from the accepted DT.2 subspace theorem. Galois stability of vanishing comes from the CM theta newform (CZ.5) and the ModularSymbols L4 coefficient-embedding comparison. The field of definition of the normalized values follows from Kato 15.9 at prime-to-p level.
- **New gap G7.** The local Fröhlich–Queyrut root number is requested from AL.1.
- **G3 narrowed.** The accepted L3h node now states Finis 1.1(2) exactly; only its ordinary-only prerequisite chain is missing.
- **G1 extended.** It now carries a smoothing route on the projected component.
- **Source issues.** Two new BKO issues were added (E7, E8); all six recorded issues are confirmed.

The suggested file elaborates under `lean-check` with no errors and no warnings. With the pinned declaration index, `check_blueprint.py` reports 0 errors and 0 warnings. `intake.py check-files` reports no problems. A dry atlas assembly adds 24 stages and 58 edges with no skipped links. A latent-cycle scan finds no cycle through NCM.

## What remains

- **Reader document.** `research/blueprint/readmes/NonordinaryCMSpecialValues.md` was not a deliverable of this job and is now out of date. It still describes G2, G4, the DT.2/CM.4/AL.5 requests and the trace-zero step, and it lacks the added node. Regenerate it from the reviewed packet.
- **G1:** the integral zeta class and the Betti-lattice comparison, from CMAllPrimeMainConjectures CZ.0.
- **G3:** Finis Theorem 1.1(2) for an inert valuation prime through Finis's own proof (Proposition 2.4, Theorem 4.1), from AutomorphicPadicLFunctions L3h.
- **G5:** the semilocal dual exponential and the continuous twist, from PadicHodgeRegulators L1 and SelmerIwasawaCohomology L3.
- **G6:** no unrestricted ramified-coefficient descent is claimed.
- **G7:** the local Fröhlich–Queyrut theorem, from AutomorphicLFunctionsAndLocalFactors AL.1. The full Fröhlich–Queyrut paper (Invent. Math. 20, 1973) was not read; Queyrut's 1974 note was.
- **Neighbouring roadmap.** AnticyclotomicLocalUnits gaps G2 and G11 can now point at this roadmap's nodes.

No scratch file is needed to resume.
