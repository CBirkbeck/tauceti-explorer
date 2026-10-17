# REV-ShimuraData~5 — handoff

Codex, session `codex-6ig0yK`, 17 October 2026. Issue #10136. Independent of BP-ShimuraData and revisions 2–5. **Completed review; accepted after corrections.** The packet's active review is `independent-review-REV-ShimuraData~5`; the previous review is preserved in its history. No further claim was taken.

The review report is [REV-ShimuraData~5](../reviews/REV-ShimuraData~5.md). It records the source scope, mathematical corrections, baseline verification, ownership checks and validation. The packet, reader and suggested Lean file contain the corrections. No other roadmap was edited.

Changes to carry forward:

- Weight one alone does not imply Griffiths transversality. The automatic case requires types `(1,0),(0,1)`; `variationNonEffectiveWeightOne` tests the distinction.
- The suggested local signatures now require independent holomorphic frames, finite rank, sections on all open subsets and decreasingness for the quotient tangent criterion. The Lagrangian quotient example assumes transitivity. The cusp example uses a punctured disk.
- Isogeny invariance of full-GSp genericity uses uniqueness of the polarization-form line under full GSp. Arbitrary polarizations cannot simply be assumed proportional under an arbitrary Hodge isomorphism.
- `TauCeti.Hodge.exists_isCompl_of_isPolarizable` already supplies semisimplicity at the pin. Choose a lattice and clear rational polarization denominators by a positive integer. H1 supplies the rational-carrier comparison, R6 the faithful semisimple representation criterion; neither should re-plan the native theorem.
- The zero-rank Tate example, the moving line on the open genus-one Bruhat cell and the scalar adelic closedness argument are corrected.
- The distinguished Levi identity is over a common cocharacter field; its superscript `c` is the quotient inherited from the original datum's centre. Its base is `G₁^ab`.
- E19–E22 have independent confirmed verdicts. E1–E18 keep their earlier verdicts. The public BKT author manuscript was read after the NSF endpoint timed out; the alternative version and hash are recorded separately, without claiming a new check of the historical NSF hash.

The final packet has 56 nodes, 85 API items, 72 unit tests, 20 planets, 30 baseline declarations, 25 supplier requests, 16 incoming requests and 8 gaps. All six stages are planned and none is closed, as allowed by PROTOCOL §0. All implementation statuses are unchecked.

Validation: pinned-index `check_blueprint.py` has zero errors and warnings; the 1,364-line suggested file elaborates with `lean-check`, exit 0 and 116 placeholder-proof warnings only. The errata wrapper, name/test/coverage consistency, in-memory atlas merge, submission file checks and whitespace check pass. The atlas merge retains the same seven skipped cross-links awaiting the restructure.

## External work already recorded by the plan

This is not unfinished review work. Resume future roadmap work from the packet's coverage, gaps, supplier requests, `consumerRetargets` and `incomingRequests`:

1. Apply the recorded retargets in seven other packets: `AutomorphicBundles--B0`, `HilbertModularVarietiesAndShimuraCurves--H0`, `PELModuli`, `PerfectoidShimuraVarieties`, `ShimuraVarieties`, `ShimuraVarieties--V0` and `ShimuraVarieties--V8`. All 126 current prerequisite occurrences of the 74 superseded IDs have retarget entries. Perfectoid S6 should cite the distinguished-datum and distinguished-Levi nodes. Keep the earlier trace-form sign correction and PEL M5 cycle removal.
2. Apply the existing restructure proposal: reverse the ShimuraVarieties/PELModuli ownership edges, move D0 into D5 and D2 into D3. The review did not change atlas data or upstream roadmaps.
3. Register ComplexKahlerGeometry §K4 and ComplexManifolds Milestone 7 as atlas suppliers when they become available there. Their current open upstream statements are consumed, not re-planned.
4. Refine the eight explicit gaps: integral flags and incidence, parabolic-type descent, MT representability/carrier and elliptic classification inputs, projective Hilbert Weil restriction, analytic compact-dual charts and the central extension with a prescribed derived cover, together with the recorded analytic registration and suggested-signature limits. The BL03 incidence proof and general Milne–Shih extension proof remain unread; no closure was inferred from their secondary citations.

No source files, source passages, private local paths or scratch artifacts are needed to resume. The packet records source URLs, versions, hashes, theorem/section/page locators and the scope of the independent readings. The job scratch directory is disposable after submission.
