# PAPER-BINDA-KATO-VEZZANI-25 handoff

Codex / codex-a71f92. Refs #1211. Partial checkpoint; no formalization claim.

Completed: whole arXivv2, all §§1–5 and AppendixA; selected supplementary original passages and all AGV2025 erratum; pinned library declarations and relevant current owner descriptions/audits. The JSON has 131 items (6 library,6 planned,119 missing),16 routes,46 API/test triples,10 gaps and14 source findings awaiting independent review. All119 missing items have one route. The item graph is acyclic.

Version: arXiv2207.00369v2,10June2025,36pages. Published Inventiones241(2025)559–603 metadata matches; full publisher PDF unavailable. Source hashes and precise read extents are in JSON, with no private paths.

Resume in this order:
1. G1/G2: acquire/collate full journal article and settle the meaning of variety/connectedness in Theorem5.6. The smooth O(2,0) divisor in P1×P1 is disconnected; SGA2's cited theorem requires ampleness. Do not declare the main theorem false or assume components are complete intersections.
2. G6: extract original Lazda–Pál2016 Theorems4.27/4.36/5.33/5.46 and Lemma5.36, with exact coefficients and comparison maps.
3. G3–G5: close Vidal/Ogus/AGV log-specialization leaves and Vez/LBV/CN/EY motivic tilting/HK comparisons. Correct AGV site-comparison hypotheses apply.
4. G7/G8: repair the two nonexistent Proposition3.8(2) references, check arithmetic descent, and extract the weight-complex/full-monodromy comparison. BGVv2 augmentation discussion was read, not its entire paper.
5. G9/G10: further split residual multi-assertion items, match finer suppliers, recheck current candidate promotion and independently verify all14 findings. Do not mark complete while these gaps remain.

Ownership: generic enhancement/log algebra/cycles/alterations remain with current owners. New candidates are MotivesRigidAnalyticPartII, AnalyticToricGeometryNonarchimedeanPartII and PadicWeightMonodromyPartII. Reuse PAPER-JANNSEN-16's MotivesPartIIWeightHomology. Preserve the generic weight-complex prefix → rigid-heart application order to avoid a coarse roadmap cycle. CP.4 owns B_st comparison, not weight–monodromy.

Conventions: rational coefficients; strict-étale rather than Kummer descent; A1 for log formal versus B1 for rigid; conventional Tate T[-1]; cohomological contravariance; compact monoidality; K0^nr uncompleted; N phi=p phi N and ramified N/e; invertible Frobenius for nilpotence; AppendixA gives graded monodromy unless the separate BGV theorem is imported.

Checks to reproduce:
- python3 scripts/check_paper.py research/blueprint/papers/PAPER-BINDA-KATO-VEZZANI-25.result.json
- python3 research/blueprint/intake.py check-files research/blueprint/papers/PAPER-BINDA-KATO-VEZZANI-25.result.json research/blueprint/papers/PAPER-BINDA-KATO-VEZZANI-25.md research/blueprint/handoff/PAPER-BINDA-KATO-VEZZANI-25.md
- python3 -m unittest discover -s tests -p test_check_paper.py
- python3 -m unittest discover -s tests -p test_source_issues.py

No Lean deliverable or compilation: API/tests are mathematical specifications only. No author contact, manual merge, issue closure or label mutation.
