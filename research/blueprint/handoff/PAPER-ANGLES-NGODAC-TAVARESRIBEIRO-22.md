# Handoff: PAPER-ANGLES-NGODAC-TAVARESRIBEIRO-22

Agent: Codex — codex-a71f92. Issue: #1268. This is a **partial checkpoint**, not a completed source audit or formalization.

## Done

Read all 31 numbered pages of HAL hal-02490566v2, plus cover and references; verified ambiguous formulas on page images. Established publisher metadata and detected the important 31-page preprint versus 44-page journal boundary. Read Taelman 0910.3142v4 §§2–5 and Stark units 1606.05502v1 §§2.2–2.3, with hashes and exact scope recorded in JSON.

Extracted 103 items, two exact baseline imports, nine planned imports, 92 missing items, four routes and 239 acyclic internal edges. Each missing item has exactly one route. Forty definitions/constructions have three API specifications and three precise tests each; all 63 theorem items have an acceptance condition. Generic Fitting algebra stays with IHG.6; Steinitz and determinant/norm transfer with KTheoryLowDegrees Z.4. Proposed Part II AdmissibleAndersonClassFormulas covers arbitrary A and the Anderson/Stark extension of DM.6.

Recorded 14 HAL-v2 source findings with counterexamples/repairs and correction-search limits. **Do not describe them as new errors in the published article.** The journal acknowledges corrections to an earlier version and could already repair these. The apparent missing power in Lemma 5.4's ideal norm was rejected after inspecting the PDF image: the printed text says I^m.

## Resume here

1. G1: obtain a lawful final journal/accepted-author text, collate numbering, hypotheses and proofs, and adjudicate E1–E14 against it.
2. G2/G4: read the exact higher-dimensional exponential, z-unit and Stark-quotient inputs, continuous Lie action and Euler-characteristic/norm extensions. The inspected Taelman/2017 inputs alone only prove their Drinfeld/Carlitz scope.
3. G3: prove uniform denominator control in the Gauss-limit step of Theorem 4.3; z+pi^n shows why Gauss convergence alone is insufficient.
4. G5: repair the homogeneous-relation descent and verify the Picard/Jacobian inputs. The source's polynomial R_0 generation claim fails for E_t=tau over F_4 with relation (-z,t).
5. G6/G7: acquire Hartl–Juschka/Goss motive proofs, separate projectivity/good-reduction statements and construct the corrected abelian skew-motive tau-z cokernel with trace duality and the i=0 term.
6. G8: finish the proof-interior, baseline adapters and finer declaration splitting, maintaining the current owners. Verify Corollary 6.5's principality separately, including bad reductions.

The JSON has exact consumers for each gap. This issue authorizes only its result JSON, report and this handoff; do not add roadmaps, packets or Lean files here. Accepted routes create their own jobs after independent review.

## Checks

Run the following from the repository root:

- `python3 scripts/check_paper.py research/blueprint/papers/PAPER-ANGLES-NGODAC-TAVARESRIBEIRO-22.result.json`
- `python3 research/blueprint/intake.py check-files research/blueprint/papers/PAPER-ANGLES-NGODAC-TAVARESRIBEIRO-22.result.json research/blueprint/papers/PAPER-ANGLES-NGODAC-TAVARESRIBEIRO-22.md research/blueprint/handoff/PAPER-ANGLES-NGODAC-TAVARESRIBEIRO-22.md`
- `python3 -m unittest discover -s tests -p test_check_paper.py`
- `python3 -m unittest discover -s tests -p test_source_issues.py`

Also checked exact-once routing, ids, acyclicity, and 120 API/120 test entries. Exact scratch arithmetic passed 80 characteristic-polynomial cases, six prime-power factors and 2187 trace-adjoint cases, plus the dimension-factor, graded-relation and normal-basis counterexamples. The report gives complete mathematical inputs for reproduction. These tests are not proofs of the general statements. No Lean compilation is claimed; no Lean file belongs to this paper issue.

Source PDFs and scratch files remain outside the repository. Base instructions and owner documents were rechecked against the fresh publication snapshot; no manual merge/close/relabel action is part of submission.
