# Handoff: REV-GrossZagierAndArithmeticHeights--GZ.0~2

Issue #7053. Codex, session `codex-57X7se`, 10 October 2026. This is a completed independent review, with verdict **accepted**, rather than a checkpoint. This session did not author either blueprint being reviewed or the earlier independent review. No second job was claimed.

## Completed work

The packet, reader and suggested Lean file agree on 243 targets, 274 API items, 202 mathematical tests and 33 planets. The current review checked every node: 211 verified, 30 corrected and two added. All 50 pinned baseline declarations are confirmed, including five additional Mathlib inputs for imaginary-quadratic unit classification. No inherited baseline citation was removed. All 78 supplier contracts were checked against their available statements and consumers. All 86 source issues have current independent verdicts: 85 confirmed and E47 rejected. Earlier review decisions remain as history.

All eight stages GZ.0–GZ.7 are planned at target level, with target counts 17, 4, 17, 11, 6, 10, 68 and 110. None is closed; every implementation is unchecked. The full correction ledger and evidence are in [the review report](../reviews/REV-GrossZagierAndArithmeticHeights--GZ.0~2.md).

## Mathematical changes to carry forward

- The two added GZ.7 nodes are `classical-modified-intersection` and `classical-tensor-global-decomposition`, both marked with this review's `addedBy`. Conrad's modified automorphism pairing is distinct from a cotangent local symbol. With the weight-six discriminant tensor, the finite term is `J_v = I_v^GZ − r_A(m) ord_(v,x)(Δ)/(r_x+6)`, with `r_x+6=6/u_x`. Its complex counterpart is the eta-normalized limit. The product formula supplies the global comparison. Exceptional stabilizer, inert, ramified, split, level and aggregate formulas all use this convention. The ordinary-unit, prime-to-level eta corollary retains its restrictions. Future implementation must use actual integral diagrams and coarse deformation coordinates.
- The starred arithmetic height kernel centrally probability-averages on a compact central idele quotient, then integrates over the torus quotient. Its normalized regularized average divides by `vol([T])=2L(1,η)` and becomes a finite-orbit average only with the stated invariance and finite-level hypotheses. It has a new volume conversion API and test. This operation is separate from later spectral projection. Use the 2011 draft §1.6.7, pp.34–35.
- The weight-two projection uses the factored `exp(2πimz)` expansion. The s-dependent real zero Whittaker formula requires the standard Gaussian. Coefficient/character height locators now distinguish the trace-dual construction and inverse-character slot. Public-draft Picard/theta/local-identity pagination is corrected.
- EllipticCurves Layer 7 supplies the full-period definition, while GZ.0 still supplies the component comparison. The real-period request makes this boundary explicit. HE.1, R07.2, R14.6 and AF.5/AS.3 requests likewise distinguish current supplier scope from the needed extensions.

## Baseline and current upstream normalization

The baseline remains Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. At that Tau Ceti pin, canonical height is half the x-height limit. The packet's full Poincaré pairing is twice the pinned pairing, and its regulator conversion is `2^r`.

The read-only current upstream check used TauCetiRoadmap `48cda9f` and Tau Ceti `a91d3aa`. The current height code instead uses the full x-height and matching polar form. Migration must import that existing implementation and translate the pinned convention; it must not plan another height or regulator machine. Both the old text/code discrepancy and the new normalization are recorded in `upstreamNotes`.

The nine roadmaps newer than the atlas snapshot and the four Completed additions were checked for overlap. Existing generic line-bundle, differential, lattice, orthogonal/quaternionic, model, intersection and Jacobian infrastructure remains imported. No upstream checkout was changed or built. The five supplied red-team ownership findings are explicitly reconciled in the report and packet.

## Source and signature limits

Public primary statements were read at the packet's edition-specific locators. The 25 inherited 2013 YZZ citations remain historical and unverifiable as edition-specific evidence; each affected node has a separately identified public alternative. That publication was not acquired or read. The 2011 draft, two Colmez author errata and Yuan author manuscript are not equated to unacquired published editions. Historical hashes and erratum searches are distinguished from current evidence. Source statements and correction reasons use our own words; no source excerpts or private-book copies were deposited.

The actual Lean correspondence is:

| Kind | Typed | Fragment | Omitted |
| --- | --- | --- | --- |
| Targets | 6 | 75 | 162 |
| API | 23 | 205 | 46 |
| Tests | 20 | 166 | 16 |

The full height dictionary is a partial signature because its written theorem only supplies the elliptic comparisons. Five absent examples previously labelled as fragments are now explicitly omitted: two dualizing-metric genus examples, standard zero Whittaker value, nonzero inert norm image and negative-index genus sign. Every claimed written declaration and retained example was checked against the file body. Algebraic fragments exercise their own operations; future workers must construct the geometric carriers and instantiate the mathematical tests.

## Remaining roadmap work

This review itself is finished. The ten precise gaps remain: full Picard/bad-place proof comparisons; arithmetic carriers; genus-one resistance measure; integral tensor realization; historical definite theta comparison; half-weight and 2-adic normalization; nilpotent deformation; distinct unread editions; geometric signatures/tests; and exact split Shimizu contraction. Retain all 78 requests. MP.6 owns the analytic theta/Siegel–Weil/see-saw and Shimizu input, RP.0/RP.1 general heights/descent, A2 algebraic Poincaré data, StableReduction the general model/intersection infrastructure, and the modular/local representation owners their actual interfaces. GZ retains its arithmetic specializations.

Do not cancel `2g−2` in genus one, identify a modified intersection with an arbitrary cotangent symbol, infer nilpotent deformation from perfect-field classification, or replace an exact Shimizu contraction by an identity modulo a residual image. Later GZ layers and whole-roadmap packaging are separate jobs. No answer from the orchestrator is needed to merge this review.

## Validation

- Packet checker: zero errors and zero warnings.
- Full suggested file: `lean-check` exited 0 at the pinned build, with 443 `sorry` warnings and no errors or other warnings. Memory was checked; compilation was sequential. No language server, build, update or cache command was used.
- Structural checks: exact planned target sets, acyclic prerequisites, all node/baseline/source verdicts, all API/test names and actual written examples, at least three mathematical tests per definition/construction, no excerpt fields or private paths.
- Swarm file intake and `git diff --check`: all five authorized paths passed.

All information needed to continue is in these deliverables; scratch source files and logs are disposable.
