# Handoff: REV-PerfectoidShimuraVarieties

Codex — session `codex-pMKjxR`, 2026-10-07. Refs #469. This is a **completed independent review**, not a checkpoint. The original planner was Claude Opus 5.5, session `claude-hkZHP3`, #972. Claim confirmed by [bot comment 6028261300](https://github.com/CBirkbeck/tauceti-explorer/issues/469#issuecomment-6028261300). Exactly one job was taken.

## Result and durable notes

The [review report](../reviews/REV-PerfectoidShimuraVarieties.md) contains the complete node and source-issue ledgers, all corrections, baseline scope checks, source URLs/hashes and reproducible counterexamples. The [packet](../packets/PerfectoidShimuraVarieties.json) has `review.status = needs_changes`, reviewer `independent-review-REV-PerfectoidShimuraVarieties`, and 90 checked entries: 52 verified, 30 corrected and eight unverifiable. Thirty-five nodes are modified; five of those retain unresolved proof inputs. No node is added or removed. The [suggested file](../suggested/PerfectoidShimuraVarieties.lean) contains the corresponding corrected contracts and native fixes.

Counts remain 90 nodes, 154 API items, 97 unit tests, 27 planets, 21 confirmed pinned baseline declarations, 15 original source files and eight planned stages. No stage is closed and all implementationStatus fields remain unchecked. There are now six gaps, 20 requests, three retained restructuring proposals and 42 source issues (40 confirmed, E7/E15 rejected). New findings E40–E42 carry this review's addedBy and independent verdict. No original test name was deleted.

All 184 node citations were checked in exact-SHA source files; 182 normalized excerpts match automatically, and the two Milne formulas were checked visually. All 162 distinct original external prerequisite references were read against node hypotheses/statements or the supplier stage where no packet exists. All 16 original requests and the four additions were checked. The related reviewed library audit, all local stage documents, and the two upstream comparison documents were read. The report preserves the mathematical reasoning, so no scratch file is needed by the next worker.

## Revision priorities

1. Replace the comment-only suggested prototypes by actual signatures/examples wherever supplier carriers permit them, and document genuinely unstated conditions according to Protocol §13. Name occurrence in a comment and native compilation do not satisfy this requirement. The file has only four partial native fragments, 25 named declarations/instances and 15 actual examples; the remaining geometry is in CONTRACT comments.
2. Supply or explicitly qualify the effective arithmetic central-kernel annihilation and logarithmic-to-v torsor bridge in S6/kummer-to-v-bridge, general-toroidal-period-map and integral-levi-reduction. T6 period-sheaf evaluations alone do not give the necessary v-covers and analytic torsor descent. Coordinate with AutomorphicBundles B0's ineffective-fibre descent.
3. Extend ShimuraData D4's supplier to Lovering's auxiliary reflex-torus B₁ datum, maps, cocharacter/reflex-field properties and the G^c/Levi fibre-product identities. The existing whole-group central-isogeny lift is too narrow. Part (i) of S6/torsor-fibre-product is sound with smooth surjectivity; part (ii)'s character calculation is missing.
4. Obtain logarithmic/coarse torsor descent through the ramified toroidal finite quotient, proving trivial boundary inertia on pushed-out fibres. The new request is to AutomorphicBundles B3.general, coordinated with ShimuraCompactifications C3.general.
5. Retain the existing missing Bruhat flag-tube/root-normalization supplier and repair BP Lemma 4.6.20's separate-vanishing inference (E41). The factors can cancel without either vanishing; the desired Levi-image theorem is not disproved.
6. The new D6 request for S2/genuine-to-image-comparison is fully faithful perfectoid-to-diamond lifting with fixed base/untilt. The proof now starts from diamond limits; it assumes no genuine-minimal tilde-limit.
7. Regenerate the read-only roadmap reader from the corrected packet and reconcile its introduction. This issue did not authorize editing that file. Apply the three existing ownership proposals through the usual restructuring flow; they have not been applied to the atlas by this review.

Recorded gaps alone do not require a checkpoint or closing every stage. The next job is a revision round, not continuation of unfinished reviewing. The independent verdict can be reconsidered after actual signature coverage and the unverified interfaces are repaired. O8 frame linearization, O4 all-unit scalar closure, and T3/T4 Frobenius ownership remain separate consumer jobs; no such job was claimed here.

## Source findings to preserve

- E7 rejected: the source already asserts uniqueness of the complete abelian-scheme diagram, not arbitrary base Frobenius lifts.
- E15 rejected: revised HJ Corollary 5.21, p. 38, explicitly proves strong boundary closedness.
- E2 confirmed only as a gap in the all-coordinate-chart proof; the 2^g admissible Lagrangian charts cover. No counterexample to the all-J theorem was established.
- E4 confirmed for the wrong common generic degree; the universal integral-nonflatness assertion was removed as unproved.
- E21 persists in published Caraiani–Scholze pp. 673–674; retain the canonical cyclotomic twist and qualify equivariance after a chosen trivialization.
- E24's preprint misprint is already corrected in printed BHW Lemma 3.19, p. 1731.
- E26's false injection persists in printed BHW Lemma 8.20, p. 1775. The report gives F=ℚ(√5), p=7 inert, N=4, n=1: a map between groups of order 6 has image of order 3. This refutes the injection, not eventual stabilization. No numerical p=2 stabilization counterexample is claimed.
- E40: Heuer arXiv v1 p. 24 and printed p. 2419 incorrectly require b/d to be a unit in the proof; γ=1 gives 0. The formula only needs integrality.
- E41: BP v1 p. 96 and revised manuscript p. 99 infer both opposite-root factors are 1 from their product lying in the parabolic. At t=w=1, u and u⁻¹ refute the inference.
- E42: Caraiani–Scholze v1 p. 21 and printed p. 674 use the determinant representation for the Tate line; the required character is the similitude, since det=c^g.

Three additional published PDFs (BHW, Caraiani–Scholze, Heuer) were collated and their exact URLs/hashes are in the packet and report. Pan's published article metadata was read but the PDF was unobtainable (404 / Project Euclid access challenge); E25 is scoped to arXiv v1. E32–E34 remain scoped to the accessible author copies, without alleging a corresponding published-version error.

## Validation

- `python3 scripts/check_blueprint.py research/blueprint/packets/PerfectoidShimuraVarieties.json`: 0 errors, 0 warnings.
- `source_issues.check_issues` and `check_errata.versions_checked` on the packet lists: no errors. The standalone errata CLI requires errata-v1 and is not a blueprint validator.
- `lean-check research/blueprint/suggested/PerfectoidShimuraVarieties.lean`: exit 0; 31 warnings, all declaration-uses-sorry. Memory was above the 20 GB threshold. The existing shared Mathlib is exactly 082e2d37e8. The shared Tau Ceti checkout differs from the f790474 pin; no Tau Ceti module is imported, and compilation is claimed only for the native Mathlib fragments. Tau Ceti's one cited theorem was read at its exact pin instead.
- All 251 API/test names occur as native qualified declarations or contract labels. Every definition/construction retains at least three tests. The 90 node verdicts are unique, all 42 source issues have independent verdicts, and the internal prerequisite graph is acyclic.
- Direct quadratic-ring modular multiplication confirms ε orders 6, 16 and 48 modulo 4, 7 and 28, and the order-three image in E26. The added modular-unit and matrix-cancellation examples elaborate with decide.
- Valid JSON, no private filesystem paths, unchanged reader/live atlas files, and `git diff --check` passed. Only the packet, suggested file, review report and this handoff are submitted.

- `python3 research/blueprint/intake.py check-files` on the four deliverables: 4 files, 0 problems.
