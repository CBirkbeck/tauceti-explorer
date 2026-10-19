# REV-DESIGN-EtaleHomotopyTypes — handoff

Completed independent review by Codex (GPT-6), session `codex-81npMI`, 2026-10-19, for [#3526](https://github.com/CBirkbeck/tauceti-explorer/issues/3526). The [bot confirmed the claim](https://github.com/CBirkbeck/tauceti-explorer/issues/3526#issuecomment-6257687123). Branch: `codex-81npMI-review-etale-homotopy`. The original design was by a different session, `codex-d3cQwx`.

## Result

The packet is accepted as a complete planning pass with seven explicit gaps. All seven layers remain `planned`, none closed. Every implementation status remains `unchecked`. All 51 nodes have independent verdicts: 36 verified, 15 corrected; no nodes added or removed. Counts: 4 definitions, 14 constructions, 29 theorems, 4 comparisons, 71 API items, 54 tests, 31 planets, 15 confirmed pinned baseline declarations, 14 supplier contracts and 5 independently confirmed source findings.

The detailed review is [REV-DESIGN-EtaleHomotopyTypes.md](../reviews/REV-DESIGN-EtaleHomotopyTypes.md). It and the packet contain the evidence, source URLs/hashes, corrections, baseline boundaries, supplier readings and continuation requirements. The reader and roadmap are synchronized with the corrected packet. No scratch artifact is needed to continue.

## Corrections to carry forward

- Seven node locator corrections: IEt Theorem 3.3; SS Proposition A.6; SS Lemmas 2.1–2.2 on pp. 822–823; the two raw profiniteness convention locators on p. 822; BHH Proposition 7.3.6 and its explicit use for p-finite closure.
- Six arithmetic hypothesis lists now distinguish lifting/surjectivity from the strongly center-free assumptions used for bijectivity. The product target separately retains characteristic zero and arbitrary X.
- Geometric Galois cohomology uses one deck-equivariant lift of the entire finite Galois cover tower, rather than unrelated finite-cover lift choices. The direct EH.1 prerequisite is recorded; SF.2 is used for affine-limit abelian cohomology, not arbitrary-group torsor descent.
- R5 is only the existing profinite Layer 0/compactness interface. New R13 and R14 import existing ProfiniteProPGroups Layers 3–4 and current Tau Ceti topological generation/abelian pro-p structure. They request homotopy-group adapters; neither the predicates nor the group structure theorem are new work here.
- Source E3 is confirmed against FGV property (iii), p. 305, and the infinite-coproduct application in A.5. Page 309 already states finiteness; the record no longer suggests otherwise. Keep the prescribed componentwise graded construction.

## Validation

The packet checker reports zero errors and zero warnings. The suggested Lean file elaborated with exit 0 and exactly six admitted-proof warnings, no others, at the pinned Mathlib/Tau Ceti environment. The 78 GiB memory preflight passed. It contains only the same two real-bodied light definitions and six admitted theorem/example proofs; it does not implement the missing carriers. Reader synchronization, all eighteen definition/construction API/test sets, all 51 node-review records, source-issue/version validation and whitespace checks pass.

## Remaining mathematical and integration work

Keep the seven existing leaves; acceptance of this review does not discharge them:

| Gap | Required continuation |
| --- | --- |
| G1 | Read the published corrected Isaksen properness argument or a complete primary replacement. The public initial strict-model preprint does not contain the required correction. |
| G2 | Supply genuine unstable partial-totalization connectivity, the nonabelian fringe and complete convergence; formal spectral-sequence collapse alone is insufficient. |
| G3 | Read a primary arbitrary local-system étale cohomology comparison, including arbitrary constant abelian A and the needed simplicial comparison. Finite Artin comparison is insufficient. |
| G4 | Read the noetherian geometrically unibranch raw homotopy profiniteness theorem, including higher groups. |
| G5 | Read the all-prime nonproper elementary-fibration fiber theorem used in the finite Galois tower reduction. |
| G6 | Reconcile the shared analytic carrier with its accepted upstream layer. PR 196 remained open at `4bd72379658126cbe9be935656396f0c9dac4de0` on 2026-10-19. |
| G7 | Supply strict functorial chosen models and strict automorphism actions before strengthening the coherent statements. |

Artin–Mazur, Bousfield–Kan and Friedlander's 1982 book were not cleared in the maintainer's library index and were not obtained elsewhere. The packet's precise public sources and unread leaves are the recovery path. All source findings are paraphrased, with independent counterexamples and bounded correction searches; no source passages are retained.

The orchestrator should reconcile R1–R14 in their existing owners, propagate R11's NC.0 foundational dependency substitutions, and check the finite-type hypotheses on each specified FGV grade. No other roadmap or audit file was changed. This is a finished review, not a checkpoint; no second issue is claimed.
