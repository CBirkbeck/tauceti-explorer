# BP-PerfectoidSpaces--P8 — completed target-level planning pass

Issue #974. Agent: Codex. Session: `codex-oxYWsf`. Date: 6 October 2026.
Claim comment 6017731878; bot confirmation 6017735768.

## Result

The packet is **complete**, and P8 and P9 are both **planned**, under PROTOCOL §0's target-level stopping rule. Neither stage is closed: four exact gaps and twelve supplier requests remain. This is a blueprint for independent review, not a formalisation or a handoff-only checkpoint.

Inventory: 66 nodes (5 definitions, 4 constructions, 36 lemmas, 21 theorems), 60 API items, 37 unit tests, 11 planets, 55 pinned baseline declarations and 34 inherited source issues. All nodes remain `implementationStatus: unchecked`. Only the packet, reader, suggested Lean file and this note changed. Stage scope, established node IDs and source-issue IDs are preserved.

The two earlier mathematical continuations are now integrated:

- [Weighted-basis proof and integration notes](https://github.com/CBirkbeck/tauceti-explorer/blob/919bf760943644067515a97924a98953309d4123/research/blueprint/handoff/BP-PerfectoidSpaces--P8.md).
- [Integral saturation proof](https://github.com/CBirkbeck/tauceti-explorer/blob/844d15ea06e8014b74190db80485ff1f447be1f9/research/blueprint/handoff/BP-PerfectoidSpaces--P8.md).

Those revisions preserve the full earlier arguments. The packet and reader now contain their statements, proof outlines, tests and supplier interfaces, so no scratch files are needed to continue.

## Mathematical changes

The rational Banach comparison is the canonical inclusion-induced map. It uses weighted t-orthogonal coordinates for countable-type coefficients over a general complete nonarchimedean field. Over a discretely valued field it permits arbitrary Banach dimension, using arbitrary-cardinal residue bases. Countability is not transferred across extension of the base field. The actual R0 basis and tensor nodes are imported; extensions of their common coordinate/completion interface are requested from R0.

The new `invariants-of-completed-lattice-tensor` node supplies the integral transfer. The quotient lattice is torsion free over the valuation ring, hence flat; its tensor quotient stays torsion free. Principal-adic reductions are exact, and completion preserves the saturated inclusion. The completed ambient lattice intersects the localized fixed lattice in precisely the completed fixed lattice. The canonical rational comparison then gives the integral comparison. Cofinal norm estimates identify the generic fibre topologically, without identifying integral tensor lattices with rational unit balls. Tests include the rescaled Q₂ counterexample, nonsaturated πO ⊂ O and the sign action whose invariants do not commute with reduction modulo 2. Mathlib's unconditional `AdicCompletion.map_surjective` is reused; its Noetherian finite-module injectivity/exactness theorems are not applied to a general valuation ring.

Scalar extension states topological orthonormalisability explicitly, including all complete extensions of a discrete field. The algebra comparison is distinguished from the uniform pair comparison. The plus ring is integral closure in the algebraic tensor followed by closure in the completion, as in R0; saturation justifies fixed points of that closure. Perfectoid scalar extension invokes P2's actual fibre product and uniformity input.

The new `integral-matrix-coboundary-effectivity` node handles any finite rank. On each base chart an integral invertible P with C(g)g(P) = P provides an invariant integral frame. Actual function descent identifies its invariant coefficients, and invariant transition matrices and their inverses descend and glue. A descended local frame conversely gives such a P. The ramified quadratic sign lattice shows why a rational eigenfunction cannot establish integral effectivity. Integral full faithfulness uses an O⁺-trivializing cover, not an integral Kiehl assertion on arbitrary affinoids.

Mathlib already has ordinary faithfully flat module descent as `comonadicExtendScalars`. P9 adds the finite-group/comonad dictionary, with counit b ⊗ n ↦ bn, and imports R3's finite-projective étale descent. The accepted AUDIT-38 and REV-AUDIT-38 are acknowledged despite their omission from the generated coverage file.

The new seminormal-base application and full smooth-product sheaf equalizer nodes record the source targets beyond the earlier special cases. Product affinoids are distinguished from rational opens with mixed defining functions. R5's infinite-pseudobasis globalization gap is propagated to global Loc and coefficient-change conclusions. Mixed bounded-family tensors are not replaced by rational c₀ completions. Derived coefficient change has explicit flatness, quotient and acyclicity inputs; its Tor example uses the unit 1 + pS on a smaller parameter. Completed higher cohomology retains the Milnor lim¹ term unless the stated almost vanishing hypothesis holds. Actual completed degree-zero descent is distinguished from finite-level reduction.

## Target coverage

These abbreviated node names belong to the indicated stage; precise prerequisites and endpoints are in the packet.

| Target | Nodes or supplier interface |
| --- | --- |
| P8 invariant pairs, quotient and gluing | `invariant-huber-pair`, `categorical-quotient`, `invariant-spectrum-homeomorphism`, `affinoid-perfectoid-quotient`, `finite-quotient-chart`, `perfectoid-quotient-invariant-cover` |
| P8 wild groups and rational restrictions | `frobenius-on-invariants-of-p-group`, `invariants-of-perfectoid-tate-ring`, `rational-invariants-characteristic-p`, `rational-invariants-perfectoid` |
| P8 represented quotient and free torsors | `invariant-quotient-v-sheaf-presentation`, `quotient-diamond-comparison`, `free-action-quotient-is-torsor` |
| P8 scalar extension | `quotient-scalar-extension`; R0 tensor and saturation interfaces, P2 fibre products |
| P8 closed loci, plus ring and tilde-limit | `closed-subvariety-pullback-is-zariski-closed`, `closed-loci-in-towers`; Q4 strong Zariski closed theorem and H0 tilde-limit |
| P8 finite maps and good towers | `integral-extension-of-perfectoid-pair`, `finite-tower-over-perfectoid-tower`, `good-towers-under-finite-maps`, `quotient-of-good-tower` |
| P9 continuous torsor and Čech datum | `profinite-galois-tower`, `cech-descent-datum`, `etale-sheaf-sections-over-galois-tower`; D2–D3 |
| P9 functions and almost higher comparison | `function-descent-along-tower`, `function-descent-over-perfectoid-base`, `function-descent-seminormal-base`, `almost-cohomology-of-tower` |
| P9 modules, morphisms and integral effectivity | `descent-of-finite-locally-free-modules`, `finite-galois-descent-of-modules`, `integral-matrix-coboundary-effectivity`, `integral-coboundary-trivialises-integral-sheaf` |
| P9 completed coefficients and sheaf descent | R0 carriers and R5 product/coefficient sheaves; the three tensor-invariant nodes, `weight-extension-of-function-descent`, `weight-extension-sheaf-equalizer` |
| P9 finite-level characters | `twisted-character-sheaf`, `approximation-of-units-at-finite-level`, `finite-level-character-sheaf-comparison`; exact R5 mixed finite-projective base change |
| P9 flat/regular and derived coefficient change | `coefficient-change-by-regular-element`, `derived-coefficient-change`, explicit R5 inputs and Tor correction |
| P9 profinite modules and inverse systems | `profinite-module-coefficient-sheaf`, `higher-inverse-limits-vanish-on-towers` |

## Remaining gaps and refinement

1. **Integral-algebra perfectoidization.** Import BS22 Theorem 10.11 and its universal property from the routed but uninstalled `PerfectoidQuotientsPartIIIntegralPerfectoidization`. Include the continuous Tate-pair comparison and characteristic-p pseudouniformizer completion. No Q5 stage exists; Q4's semiperfectoid quotient theorem does not supply this integral-map statement. Avoid a cycle through P8 or adic almost purity.
2. **General seminormal structural comparison.** KL II Theorem 8.2.3 needs a Part II of the foundational PadicHodgeTheory direction: toric comparison, perfectoid scalar descent and the seminormalization/birational argument. The current smooth discrete-base local-rational supplier is a special case. P9 owns the torsor application.
3. **Full sheaf equalizer after smooth base change.** Prove the infinite-torsor comparison on rational subdomains with mixed defining functions, or a ringed-site descent theorem implying it. Product-affinoid comparisons alone do not establish the full BHW Lemma 3.7 target. Finite-group rational localization does not settle the infinite group case.
4. **Mixed-coefficient globalization/base change.** Respect R5's infinite-pseudobasis Kiehl existence gap: its source proof uses the false Banach-density assertion CHJ 6.19(2). Local finite-level Galois descent survives. Broad globalization, coefficient flatness and quotient compatibility remain inputs, distinguished from the established affinoid/finite-pseudobasis range.

Refinement should first implement R0's specified weighted/discrete coordinate and saturated-completion interfaces, then resolve the four comparisons in their owners. It should not reconstruct generic analytic tensors, finite-projective gluing or distributions in P9. RS-05 remains binding. The four new helper/application nodes add no planets, preserving at most six per stage.

## Evidence and checks

Pinned source baseline: Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`, Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. Statements of all 51 inherited baseline declarations and the four new Mathlib declarations were read at these pins. The declaration index validates all 55 references. Upstream conventions and density were checked against AdicSpaces and ProfiniteCohomology; the supplier packet and binding ownership/audit records were inspected.

Ten arXiv PDFs were downloaded and their hashes matched the inherited records. Fresh rereads are recorded in `continuationReads`: HJ 5.9–5.10 (pp. 31–32), CHJ 2.23, the finite-level argument and 2.28–2.29, appendix 6.15–6.21, KL II 3.3.26 and 8.2.3, BHW 3.4 and 3.6–3.8, and BS22 10.11–10.12. Earlier full-section reading records remain inherited evidence. Hansen's standalone PDF was unavailable from its recorded author URL; no fresh retrieval or byte check is claimed. The 34 source issues are preserved, not presented as a new independent errata review.

Validation:

- `python3 scripts/check_blueprint.py research/blueprint/packets/PerfectoidSpaces--P8.json` with the pinned declaration index: **0 errors, 0 warnings**, including source-issue validation and local acyclicity.
- A recursive traversal from all 66 nodes through current supplier packets and integrated decompositions reached **543 records/terminals, no node prerequisite cycles**. Its 19 requested-stage terminals remain requests; this does not assert closure of stage interfaces.
- Every node and all 60 API/37 test names appear as signatures or explicit missing-carrier comments in the suggested file.
- `lean-check` on the suggested file: **exit 0**, exactly **70 `sorry` warnings**, no other Lean warnings or errors. The shared build has the exact Mathlib pin and Tau Ceti `cf386627e9176a3827c1a5fe804989fd94a4d216`, newer than the source baseline. This is elaboration against that build, not an exact-Tau-pin build claim. No separate Lake project, cache download, build or language server was started.
- `git diff --check`: clean.

Next is independent review of this complete target-level packet. Follow-up refinement jobs may be created for the open stages after acceptance, as PROTOCOL §0 prescribes.
