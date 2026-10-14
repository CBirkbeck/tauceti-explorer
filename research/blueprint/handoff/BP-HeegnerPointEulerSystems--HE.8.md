# Handoff: BP-HeegnerPointEulerSystems--HE.8

Worker: Codex, session `codex-HJgfro`. Claimed issue #9417 after the bot confirmed the claim. Submission branch: `codex-HJgfro-he8`. This is a completed target-level planning pass for HE.8, not a checkpoint and not a claim of mathematical closure or implementation.

## Scope and the accepted input

The issue identifies HE.0 as its input, but the accepted `HeegnerPointEulerSystems--HE.7s.json` also covers HE.8, HE.8b and HE.8c. Its independent revision-2 review is accepted. This pass therefore imports its 49 HE.8 nodes rather than giving their endpoints new IDs. The separate Nekovář parity node added to that packet is outside the issue’s two-paragraph scope. No existing packet is edited.

The new packet has **8 nodes: 1 construction and 7 theorems; 4 API items; 4 unit tests; 0 new planets; 2 baseline declarations; 6 gaps; 10 supplier requests**. HE.8 coverage is **planned**, with a precise remaining list; no stage is closed. All implementation statuses are unchecked. The imported material has 33 theorems, 7 constructions, 7 lemmas and 2 definitions, with 37 API items, 29 tests and the existing six planets. Those imported counts are not added to the new-node counts.

The reader supplies the mathematical conventions and targets, complete new-node specifications and an explicitly labelled imported specification/API/test catalogue. The packet’s `refinementEdges` are assembly proposals, not edits to the accepted input. At assembly, attach these new proof inputs to their existing consumers:

| New input | Accepted consumer |
| --- | --- |
| Adelic fibre and isogeny annulus; arithmetic p-adic joining application | Joint CM equidistribution |
| Fixed-torsion CM trace theorem | Cornut tower-trace non-torsion |
| Traced universal-norm module | Non-torsion Λ-bottom class |
| Weak-torsion d(k) descent verification | Universal-norm family and derivative restriction |
| Clean arithmetic Howard A–D verification | Howard’s Theorem B endpoint |
| Perfect coefficient-character base change | Specialized determinant lattice |
| Broadened integral determinant containment | Castella–Sano refined equivalence |

Do not add a main-conjecture-return edge to the early geometric family. Conditional BCGS and CS theorems retain their conjecture hypotheses.

## Confirmed findings assigned to this job

**RT-AREA-iwasawa-1/1.** Reuse HE.7s’s joint-distribution, orbit-surjectivity and primitive-character targets. The generic p-adic orbit/measure/stabilizer theorem has one owner: GN.4 or its homogeneous-dynamics Part II. The packet refines its exact CV-CM Theorem 2.29/Lemma 2.30 contract and adds only the HE-owned local fibre and arithmetic joining applications. The finite-extension F_P proof boundary remains explicit. The CM parametrization uses κ⊂F_P^×, a multiplicative open subgroup; the scaled annuli carry additive Haar measure. It does not use a subgroup of K_P^× as the unipotent parameter. The exceptional set is a countable union of P-rational Galois cosets as in Proposition 2.24. Generic real Ratner and marginal coordinate density do not supply the joining input. The inert branch therefore retains the dynamics request. A split BDP alternative is described as an existing route, without duplicating it.

**RT-AREA-iwasawa-1/13.** Refine the already accepted extraction proposal: HE.8 comes from README lines 102–108, HE.8b from 110–116, and the process notes are separate. Preserve the existing HE.8c Cornut–Vatsal node ID and its accepted HE.8 parent. Remove the reversed process edges only through the maintainer’s restructuring procedure. An early HE.8e and downstream HE.8s split is proposed if stage-wide edges are needed, giving early family → BSD.7a → HE.8b → specialization consequences. BSD.6/6a and BSD.7/7a extraction repair remains BSD-owner work. No atlas or roadmap-source file is changed here.

## Remaining work and supplier contracts

The six gaps are precise proof/interface work, not uncovered stage targets:

1. Verify the original p-adic homogeneous-dynamics sources with the exact local-field and averaging hypotheses. GN.4 owns the generic theorem; HE applies it to the arithmetic joining.
2. Supply the central-component supersingular fibre model, H2 degeneracy transport and quantitative fibre growth. Requests go to AA.3–AA.4 and R18.2–R18.4.
3. Verify Howard’s traced norm-module rank comparison and presentation/augmentation interface. PMIA L5 remains not_read; Howard’s cited Perrin–Riou original passage was not independently read in this run. The clean argument uses p∤h_K and does not make aug(Φ) a unit.
4. Prove the weak-torsion auxiliary invariant/descent checks and finite simultaneous solvability with d(k) and finite G0 retained. HE.4 owns the stronger auxiliary descent interface. The pro-p base-tower fixed-vector argument alone is insufficient.
5. Supply exact arithmetic integral control, the functional equation with the same local conditions and perfect arbitrary-character base change. SI.L3’s finite-layer control and duality with error cones are imported, but do not discharge these stronger requests. Nekovář 8.10.1 is cited through CS, not independently read here.
6. Reconcile the broadened CS integral-containment application with clean Howard Theorem B. CS does not impose p∤h_K, whereas the read Howard statement does. CGLS’s broad bound is localized. The ES.8/SI.L3 request therefore verifies integral A–D at all height-one primes, including p and augmentation, for the actual broadened tower. This is an application gap, not a claimed source error. Do not assume the desired main-conjecture equality to prove its converse’s integral containment.

Inherited HE.7s gaps also remain: the global χ localization square, exact BCGS paired rigidity/uniform error and control normalization, and the p=3 extension of the verified p>3 proof. Reuse its ES.4 supplier contracts; no second ES.5 owner is introduced. Continuous near-trivial CS characters are distinguished from the crystalline BCGS logarithm/control sequence.

## Sources and baseline

Read Howard’s arXiv v1 introduction and Chapter 2, PDF pp.22–35; published CV-CM printed pp.263–300; the CV nontriviality preprint’s statement/setup passages and complete §§4–5, PDF pp.36–60, plus Appendix 6.5 pp.67–69; BCGS arXiv v2 introduction and §§1–2, PDF pp.1–20; CS arXiv v1 introduction and complete §3, PDF pp.11–17; and CGLS’s published setup p.547 and §§3.4–4.1 pp.564–569. The packet records exact versions, URLs, digests, reading scopes and page conventions. The CS author copy p.13 was separately checked. No private book or uncleared copy was needed, and no source passage is reproduced.

The reversed CS coefficient-membership condition is the already confirmed **E2**, independently rechecked here, not a new source-issue ID. Use I_n⊂p^mℤ_p, equivalently M(n)≥m. The inherited **E3** keeps the exact-rigidity proof at p>3. No new erratum is asserted. Original Ratner/Margulis–Tomanov, Perrin–Riou and Nekovář 8.10.1 proofs remain acquisition or supplier-verification boundaries.

Mathlib pin: `082e2d37e8b0463410cdb532e111cd43d5a66174`; Tau Ceti pin: `f790474821cf4256814db967cb154e7af3d0c369`. The actual `Module` and `LinearMap` declarations were read at that Mathlib pin. Current read-only TauCetiRoadmap at `0d144d044dacebca17b654695b6f1ad58f159b27` and Tau Ceti at `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039` were also screened. Current elliptic-curve, profinite-cohomology and adelic-group plans are reused; no lake command was run in those trees.

## Validation

`python3 scripts/check_blueprint.py research/blueprint/packets/HeegnerPointEulerSystems--HE.8.json --json` passes with **no errors or warnings**. `lean-check` elaborates the Suggested file against the pinned Mathlib with **only seven expected admitted-proof warnings**: four theorem signatures and three examples. It has no new definitions or data placeholders, and is below the 5,000-line limit. The eight new arithmetic targets and the norm-module API/tests stay in the README because their actual carriers are absent at the pins, as WORKERS.md’s fixed shape requires. This check is not an arithmetic implementation claim.

The intake file check accepts exactly the four deliverables with no problems. A cross-packet dependency audit, including all proposed refinement edges and prioritizing the accepted HE.7s specifications, reaches 3,321 existing/new nodes with no cycles. The eight new IDs are disjoint from the accepted packet’s IDs.

Resume with independent review of these eight refinements and their supplier boundaries, then reconcile the proposed proof-input edges in assembly. Everything needed to resume is in these four deliverables and their cited existing packets; no scratch file is required.
