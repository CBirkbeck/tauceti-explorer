# PAPER-ESNAULT-GROECHENIG-20 — handoff

Codex, session codex-a71f92; issue #1466; 2026-09-22. Status: **partial**.

## Delivered

- Complete reading of the published 56-page paper, including Appendix A and references; selected author-version and prerequisite proof comparisons, with URLs, hashes and scope in the JSON.
- 136 interfaces: 5 library, 12 planned, 119 missing; four coordinated Part II proposals and two source routes. Each missing item is routed once.
- Planning API outlines and at least three acceptance tests for all 54 definition/construction items. These are not executed Lean tests.
- Ten source findings, all awaiting independent review. E2 has a trace-free elliptic-curve/dual-number BNR witness; it is not a counterexample to the main nilpotency or Frobenius theorems.
- Full reproducible Python certificate in the report. Its six output counts are 24, 3, 19, 4, 5913 and 104 as labelled there.
- Existing HodgeStructuresPartII proposal reused, not duplicated. Field Azumaya and pointwise isocrystal library credits kept separate from the missing geometric theory.

## Resume precisely

- G1: Verify E2 independently and prove a corrected arbitrary-family BNR equivalence via Morita reduced characteristic invariants. The elliptic-curve dual-number witness is an elementary source-level obstruction, not a formal Lean proof. Reconcile Grc16's acknowledged historical correction.
- G2: Construct the explicit R(r,m), stability upgrade, uniform rigid-component length bound, determinant transport and valuation-controlled deformation truncation. E3 remains a proof gate.
- G3: Complete external LSZ/SYZ/Xu proof extraction, including finite-field descent, endpoint restrictions, locally split filtrations and the nilpotency convention. OV Theorem 2.8/Corollary 2.9 were read, but their full foundational proof closure was not attempted.
- G4: Prove stack/coarse-point and scalar-automorphism comparisons for Claims 4.14–4.15, spread the nonreduced Hodge splitting, and supply the finite-tower inverse-limit argument.
- G5: Read the full Faltings/LSZ comparison sources; resolve whether Theorem 5.4 exports generic or residual rigidity under Definition 5.3. Keep E4 fixed-determinant repair separate from this unresolved representation convention.
- G6: Check the normal-closure coefficient-field construction and prove good-point density on arbitrary opens, including the model refinements required by E6. A nonzero scalar nilpotent argument is valid only on the reduced geometric fibre.
- G7: Resolve geometric versus arithmetic isomorphism classes and finite-order determinant/Frobenius normalization in S(s,p,r,d) and S(s,ℓ,r,d). Over a point, an underlying rank-one crystal admits multiple root-of-unity Frobenius structures; one cannot infer a bijection of arithmetic objects from geometric counts alone. Decompose Abe/AE existence, uniqueness and shtuka realization with exact locators.
- G8: Repair the relative Brauer support argument E5; verify the PD scaling action, determinant condition and p-divisible weight/rank cases needed to obtain Corollary A.7 for every p>2. No safe replacement by the same unverified Appendix is claimed.
- G9: Read the properness theorem in Langer's semistable category and the exact external SL3, integrality, André, BKT and strong-integrality inputs. Match them to the pending HodgeStructuresPartII design without duplicating its ownership.

The first useful work is independent review of E2 and the acknowledged historical correction to the earlier Groechenig BNR theorem. Do not use an arbitrary-family p-power root argument or simply assume the parameter scheme reduced. Then supply the uniform support/truncation bound. Preserve the residual/generic representation and geometric/arithmetic coefficient-object distinctions.

Consult the item ids and `neededBy` lists in the JSON for each gate. Do not mark complete merely because schema checks pass or the main paper was read. External LSZ/SYZ/Faltings/Abe/AE/Langer/Simpson/André/BKT proof interiors remain only partly or not yet extracted, as explicitly recorded.

## Checks and scope

- Paper checker: passed.
- Intake `check-files` on the three deliverable paths: passed, 3 files and 0 problems.
- `python3 -m unittest tests.test_check_paper`: passed, 9 tests.
- Additional final structural audit: passed, 136 unique items, 275 acyclic item-dependency edges, exact-once routing for all 119 missing items, baseline references resolved, and 54 definition/construction API/test lists checked.
- Python finite certificate: passed, with the output recorded in the report.
- No Lean file compiled; no formalization claimed. This is a paper issue, not a suggested-Lean blueprint issue.

Only these files are in scope:

1. `research/blueprint/papers/PAPER-ESNAULT-GROECHENIG-20.result.json`
2. `research/blueprint/papers/PAPER-ESNAULT-GROECHENIG-20.md`
3. `research/blueprint/handoff/PAPER-ESNAULT-GROECHENIG-20.md`

No atlas, roadmap, library, audit, register or queue file is edited. PR must say Refs #1466. Submission ends this claim; leave the partial job to another worker after intake.
