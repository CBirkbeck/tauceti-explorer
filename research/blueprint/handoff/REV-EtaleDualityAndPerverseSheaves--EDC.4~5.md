# Handoff: independent EDC.4 review, round five

Job `REV-EtaleDualityAndPerverseSheaves--EDC.4~5`, issue #10135. Codex — codex-Jum238, 2026-10-17. **Complete; accepted after corrections.** No second job was taken. This reviewer participated in none of the five incoming blueprint rounds.

The independent report is [REV-EtaleDualityAndPerverseSheaves--EDC.4~5.md](../reviews/REV-EtaleDualityAndPerverseSheaves--EDC.4~5.md). The packet's `review` names this review and records all 25 current dispositions. `independentReviewRound5` records the 23 independent source readings/checksums and validation, separately from historical receipts.

## What changed

- Generic affine weak Lefschetz: specified Katz's incidence/localization exchange (Appendix A.1–A.5, pp.218–221), finite-coefficient dévissage, and integral exchange on one residue-chosen dense open with derived Nakayama. Connected iteration ends at curve dimension; a generic final zero-dimensional section can be two points.
- Projective bundles: supplied the arbitrary bounded nonperfect finite-coefficient proof by proper base change/free resolutions. Relative trace works over nonsmooth bases, justifying projective/flag retractions. Added nonperfect ℤ/4 coefficients, nonreduced-base checks, and a nontrivial P¹-bundle check distinguishing trace retraction from coordinate projection.
- Ample divisors: preserved each conclusion's own amplitude and smooth-pair hypotheses. Complete-intersection families: made the arbitrary-base reduction explicit and specified integral trace-dual high quadric generators. Orthogonality: removed unnecessary affine-complement prerequisites and qualified complementary decompositions.
- Sharpened all three normalized-system API locators, specified the direction K_rel[s] = K_abs of the smooth-base normalization, and replaced the blocked AMS Katz link by the readable author-hosted scan.
- Kept the 137-line suggested Lean file unchanged after independently reading and compiling it. Its four definitions have real bodies; the full geometric targets remain in the reader.

## Checks

- Packet checker: 0 errors, 0 warnings; 25 nodes, 12 API entries, 12 definition/construction tests (18 named tests overall), eight planets, three baseline references, seven precise requests, zero local gaps. Status complete; EDC.4 coverage planned, not closed; every implementation status unchecked.
- All 25 node statements, hypotheses, proof steps, acceptance checks, APIs, named tests and intended declarations match the reader.
- EDC.4 fine-node prerequisite closure: 110 nodes, zero missing fine references, zero cycles. All 93 retirement replacements exist; all references listed for the six recorded consumer packets occur there.
- `lean-check research/blueprint/suggested/EtaleDualityAndPerverseSheaves--EDC.4.lean`: exit 0; twelve `declaration uses sorry` warnings only. Pinned Mathlib imported, no Tau Ceti implementation used. Available memory exceeded 20 GB; no background compile remains.
- Submission path/content checks and `git diff --check`: passed. Only this issue's packet, reader, independent report and own handoff changed.
- All three cited Mathlib declarations were read at 082e2d37e8b0463410cdb532e111cd43d5a66174 and checked by Lean. AUDIT-18 and current Tau Ceti/upstream main, including the nine newer roadmaps, were checked for duplication. No shared source tree was modified or built.

## Routing for the maintainer

1. Repoint `WeightsInEtaleCohomology:R34.4/finite-field-pencil-descent` from retired `EDC.4/pencil-axis-blowup` to the imported LPV §4.5 statement plus `EDC.4/blowup-formula`. The general axis geometry/cohomology belongs to LPV §§3.3,4.5; EDC retains the specified trace/Frobenius refinement.
2. Repoint `FiniteFieldsAndCharacterSums:FF.2/smooth-affine-betti-bound` from the bare EDC.4 stage to `EDC.4/generic-affine-weak-lefschetz`. The Bertini smoothness request still requires an unramified quasi-finite map and positive-dimensional connected iteration.
3. Apply the earlier retirement map for GS0, IG.4, ES7 and text references in SF.0, ET.0 and ET.5. All 93 replacements are verified; none of these consumer files was edited here.
4. Preserve the EDC.5 → EDC.4, L3 → EDC.6 and GS1 routing proposals in `restructure`. Fine-node prerequisites are acyclic; coarse atlas edits remain the orchestrator's task.
5. The GlobalShtukas GS.1/GS.2 smooth-base ULA normalization uses the absolute perverse category and shift, not a newly planned general relative t-structure. General-base nearby cycles/Orgogozo already belong to ClassicalAdicEtaleCohomology §5.4 on its stated domain.
6. Strong diamond exceptional-pullback transport remains with the accepted EDC.6 packet's gap/request. The retained EDC.6 interfaces here give only right-adjoint recovery. This acceptance does not discharge that separate gap.
7. Preserve all seven exact supplier requests and package existing upstream mathematics as imports: no new projective/flag geometry, Rees blow-up, global cohomological blow-up, Veronese or ctf complex comparison should be planned again. The seven open PR heads were rechecked and remain those recorded in the packet.

No EDC.4 review work remains. The next step is packaging under the programme's queue. The independent report and packet preserve all needed evidence; scratch sources and scripts are disposable. Cleared-library sources were read only in place, and no source passages were copied into a deliverable.
