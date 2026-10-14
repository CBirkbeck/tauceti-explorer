# REV-ClassicalArithmeticCompletion--CA.7 handoff

Issue #9680. Reviewer: Claude, session `claude-UDH4gC`, branch `claude-UDH4gC-rev-ca7`. The plan under review is
`BP-ClassicalArithmeticCompletion--CA.7`, written by Codex `codex-ruGjB5` in pull request #9716.

## Done

The review is complete and the verdict is **accepted**, with corrections made in place in the four deliverables:
the packet, the reader, the suggested Lean file and the report
`research/blueprint/reviews/REV-ClassicalArithmeticCompletion--CA.7.md`. The report lists every correction. In brief:

- **Duplicates removed.** Three targets duplicated GeometryOfNumbersAndQuadraticArithmetic GN.2 (Steinitz
  decomposition, torsion-free projectivity, Steinitz class) and were removed. The reduced norm and the reduced
  characteristic polynomial now import IntegralHeckeAndGaloisDeterminants IHG.0.
- **Target added.** `ell-elementary-determinant-descent` (Chinburg–Pappas–Taylor Theorem 6.6) closes a gap in
  `determinant-fixed-point` and `general-group-determinant-stability`. Its new boundary is G-ELLELEMENTARY.
- **Boundaries changed.**
  - G-COMPLETION closed from pinned Mathlib.
  - G-GENERALIDEAL resolved by review decision: the inherited rank-one contract is restricted to arithmetic orders.
  - G-DH narrowed to the sign for p=2, and taken off Taylor’s chain.
  - G-LOCALBRAUER broadened to the integral Witt–Berman form.
- **Source issues.** E901 renumbered E1701, because CA.3 already uses E901; two new CPT misprints recorded as
  E1702–E1703.
- **Other edits.** Source locators corrected in 26 targets; supplier-contract texts rewritten; the reader re-rendered
  and verified section by section.

## Checks run

- `TAUCETI_BASELINE=… python3 scripts/check_blueprint.py research/blueprint/packets/ClassicalArithmeticCompletion--CA.7.json`:
  0 errors, 0 warnings.
- `scripts/check_errata.py`, run on the packet’s `sourceIssues` and `sourceVersions` wrapped as an errata file: ok.
- `lean-check research/blueprint/suggested/ClassicalArithmeticCompletion--CA.7.lean`: exit 0. The only warnings are
  20 for declarations using `sorry`, and the file has 181 lines. Before the edits it had exit 0 with 22 such warnings.
- `scripts/check_sorry_data.py` on the suggested file: ok.
- Reader renderer: all 69 continuation sections and all 55 retained sections agree with the corrected packet.

## For the next jobs

- **Assembly.** Restrict the parent packet’s `locally-free-class-represented-by-rank-one` and the `exists_classOf_eq`
  item of `locally-free-class-group` to O_F-orders in semisimple F-algebras, F a number field. This is the review
  decision on G-GENERALIDEAL.
- **Higher-tier owners.** NoncommutativeAndEquivariantIwasawa NE.3 and NE.6 should import IHG.0’s reduced norm and
  CA.7’s `integral-group-log`. KTheoryLowDegrees Z.1 and Z.4 should cite GN.2 for the Steinitz class.
- **Remaining boundaries.** The open boundaries are G-LOCALCONSTANTS, G-ARTIN, G-DH (p=2 only), G-LOCALBRAUER,
  G-CROSSEDPRODUCT, G-FTCONGRUENCE and G-ELLELEMENTARY. Four books would let these be closed:
  - Fröhlich, *Galois Module Structure of Algebraic Integers*;
  - Reiner, *Maximal Orders*;
  - Serre, *Linear Representations of Finite Groups*;
  - the Fröhlich–Taylor 1980 paper, which is still needed.

No scratch files are needed by any later job.
