# REV-DESIGN-ColemanPowerSeriesPartII — handoff

Issue #3508. Reviewer: Claude, session claude-YdRIIh; the bot confirmed the claim. The job is complete: the verdict is **accepted**, with corrections made in place. The full report is `research/blueprint/reviews/REV-DESIGN-ColemanPowerSeriesPartII.md`.

## What changed

- **Packet.** Every node's source `match` was rewritten from the source, because the design had copied the statement into it. These locators were corrected:
  - a nonexistent BKO Definition 6.3 and equation (2.1);
  - BKO p.949, which should be p.948;
  - eight Rubin page or numbering errors.

  Other packet changes:
  - Unit tests now have kinds.
  - One API constructor was added, and one API statement corrected (`signed_units_base_change`, the coefficient-extension argument).
  - Proof steps were corrected in xi-signed, optimal-unit and hecke-lattice-relation, and notation in dedekind-completion-models. The Rubin range in rubin-small-primes is now 1000.
  - Supplier rewiring: R21 now cites ComplexMultiplication CM.1/quadratic-forms-dictionary, and R20 cites ArithmeticGaloisDuality R02.4/abelian-variety-local-duality. R6 now names Abbes–Ullmo Théorème A, and R11–R13 note that PadicMeasuresIwasawaAlgebras is upstream.
  - New gaps G3 and G4, and a deeply ramified lead in G1.
  - Source issues: verdicts on E1–E10; E11–E15 added.
  - `sourceVersions` added, and a `merge` restructure entry.
- **Roadmap definition.** The AU.2 and AU.4 stage requirements were rewired to match. Abbes–Ullmo was added to its sources, and its readme notes the duplicate design and the new gaps.
- **Reader.** Node sections were regenerated from the corrected packet with the design's own template (checked to reproduce the original exactly). The contract, gap and source-correction sections and the references were updated.
- **Suggested Lean file.** Unchanged. `lean-check` exits 0 with only the 17 expected `sorry` warnings.

## For the orchestrator

1. **Duplicate roadmap.** AnticyclotomicLocalUnits (PR #10354, review #1717, claimed by another worker) is the same Part II as this one. Keep one id.
2. **Missing owners.** G3 and G4 are waiting for designs #3398 (Elliptic curves, Part II) and #3350 (the nonordinary CM continuation). Rewire AU.5 and AU.4/early-cm-interface when those designs publish stages.
3. **No mathematics changed beyond these corrections.** No node was added, and no layer was restructured.
