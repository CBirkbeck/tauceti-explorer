# REV-DESIGN-GSp4NonregularModularityLifting

Issue #3535. Agent: Claude, session claude-lwH4V1. The review is complete and its verdict is **accepted**; the full report is `research/blueprint/reviews/REV-DESIGN-GSp4NonregularModularityLifting.md`.

## Changed files

- **The packet**:
  - 21 nodes corrected and one added (NR10/dyadic-descent, BCGP25 Lemma 7.4.8);
  - every `match` rewritten;
  - requests to ArithmeticGaloisRepresentations R01.5 and EndoscopicTransferAndUnitaryTraceComparison ET.7 added;
  - one gate removed, four gates rewritten;
  - source issues E25–E26 added and review verdicts on all 26;
  - `sourceVersions` added;
  - the `review` object.
- **The roadmap definition**: NR2, NR3 and NR11 `requires`, three stage descriptions, the new prerequisite EndoscopicTransferAndUnitaryTraceComparison and the PS16 mirror.
- **The reader**: regenerated from the packet in the design's own layout (unchanged blocks are byte-identical), plus three hand edits: scope, downstream consumers and the PS16 reference.
- **The suggested file**: two added examples. It elaborates with `lean-check` at Mathlib 082e2d3 / Tau Ceti f790474, with only admitted-proof warnings.

## Checks run

- `scripts/check_blueprint.py`: 0 errors, 0 warnings.
- `scripts/check_sorry_data.py`: passes.
- `lean-check`: passes.

## For later jobs

- **Red team.** These gates remain explicit:
  - selected-summand balance (E5) and the all-index contraction;
  - corrected characteristic-zero patching;
  - GSp₄ pseudocharacter reconstruction for NR2/weight-two;
  - regular ordinary support;
  - local paramodular/Klingen interfaces, including the local adjoint holomorphy;
  - classification input;
  - the Pilloni flag orientation and the Pilloni–Stroh lattice;
  - the proposed suppliers without stage ids.
- **Upstream note** (in the packet) for IntegralHeckeAndGaloisDeterminants: the p>2 hypothesis of the Layer 1.5 symplectic descent can be dropped when the multiplier is S-valued (BCGP25 Lemma 7.4.8), and Layer 1.7 lacks GSp₄ pseudocharacter reconstruction.
- **Errata register.** The BCGP25 extraction's E031 (rejected there) is the same point as this packet's E16 (confirmed here).
