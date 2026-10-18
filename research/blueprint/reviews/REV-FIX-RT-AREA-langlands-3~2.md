# Independent review of FIX-RT-AREA-langlands-3~2

**Job:** REV-FIX-RT-AREA-langlands-3~2, Refs #7019. **Reviewer:** Codex, session codex-vUp5LQ. **Date:** 18 October 2026. **Verdict: accepted, with corrections.** I did none of the fixes being reviewed (#6980, claude-c9cXZu), the red team or its verification.

This accepts the corrections for RT-AREA-langlands-3, not closure or formalisation of the roadmap. The packet still has six planned stages, fourteen gaps, sixty-one requests and 142 unchecked targets. The earlier verdict `independent-review-REV-FIX-RT-AREA-langlands-2~4` is preserved in `reviewHistory`; this verdict follows that review and `REV-RT-AREA-langlands-3` for the present fix scope.

## Findings

| Finding | Review verdict and reason |
|---|---|
| /1, confirmed classification ownership/input gap | **Fix accepted after corrections below.** The 31 ML.4 targets provide source-specific owner interfaces, and the proposed endoscopy Part II retains the missing constructive stabilization/classification work. The verifier permits retaining conditional endpoint branches while those assumptions remain unproved. Gan–Takeda's local correspondence and generic global descent are separated from the conditional packet/multiplicity assertions. ET.3's ordinary transfer and ET.4's restricted comparison do not discharge the weighted input. This does not certify that the proposed Part II has been constructed. |
| /2, rejected claim that all ML stages are registries | **Correctly left unchanged.** The fix does not move ML.2 potential-automorphy endpoints or ML.3 symmetric-power endpoints into PA.5. The verifier's distinction between an endpoint and its method suppliers remains intact; no new closure claim about the routed papers is made. |
| /3, rejected companion-form ownership claim | **Correctly left unchanged.** The existing R15.4 Edixhoven node delegates the relevant proof to R20.3. The fix introduces no duplicate companion-form owner and does not assert a Coleman–Voloch treatment of the exceptional k=p=2 case. This review preserves the verifier's exceptional-case boundary rather than certifying that proof. |
| /4, confirmed missing definite completed-cohomology branch | **Scoped handoff accepted.** I checked that the open blueprint issue [#700](https://github.com/CBirkbeck/tauceti-explorer/issues/700) explicitly includes this finding and Dospinescu–Le Bras route 5's 26 items. The fix correctly leaves that construction to its owner, outside this review's deliverables. It remains unfinished mathematics, not a supplied theorem. |

For /4 the downstream acceptance gate remains definite quaternionic degree-zero completed cohomology over Q: the quaternion algebra is split at p and ramified at infinity, the space is C⁰(X), and absolute irreducibility is imposed on the residual representation restricted at p. Dospinescu–Le Bras Theorem 5.4 requires a positive multiplicity in its Banach representation decomposition. The generic CC adapter and the degree-one curve theorem do not prove this branch. These are the verifier's checked requirements (§4.1, pp. 20–22; §5.1, pp. 25–26; appendix §13, pp. 69–73 of arXiv v2); I did not independently re-read that paper for this packet review.

## Corrections made in this review

1. **`ML.0/arthur-dependency-gate` and `ML.4/trace-formula-inputs-register`:** confined the single remaining trace-formula hypothesis to the quasi-split classification. Inner-form consumers retain their own field, parameter, pure-inner-twist and additional local classification/intertwining conditions. The register's acceptance test now applies to classification-dependent clauses, avoiding an accidental conditional label on unconditional Gan–Takeda exports.
2. **`ML.4/symplectic-branch-status`:** corrected the title and test to include unconditional generic global descent. The former title's local/global division contradicted its statement.
3. **`ML.4/gsp4-arthur-classification`:** removed the claim of memberwise, all-place rec_GT compatibility for arbitrary A-packets. The strong L-parameter assertion is retained for general type; the general A-packet interface uses stable character transfer. Added a test for nontrivial Arthur SL₂. Gee–Taïbi Theorem 3.1.1 and the general-type consequence of Theorem 7.4.1 have different interfaces.
4. **`ML.4/gl4-symplectic-descent`:** made cuspidal Π and its multiplier the inputs, with π an output. Removed the hypothesis that already assumed a discrete descent. Its proof and test distinguish unconditional generic existence over any number field from BCGP's conditional full-packet statement over totally real fields.
5. **`ML.4/vogan-packets-so-v`:** expanded the field/form convention from two nonarchimedean forms to all relevant real signatures, and treated the rank-zero exception explicitly. Replaced the non-split V⁻ shorthand where it would obscure the real scope.
6. **Ishimoto references:** the local intertwining statement is Theorem* 4.13 in **§4.6, pp. 32–33**, not an opening of §4.9. The introduction's Mœglin–Renard and metaplectic-application paragraphs are on **p. 3**. Corrected the register, the two inner-form nodes and the bibliography reading record. Generic global parameters remain a restriction; the all-A-parameter near-equivalence decomposition is not a full nongeneric multiplicity formula.
7. **ET.4 request:** recorded that `EndoscopicTransferAndUnitaryTraceComparison:ET.4/gsp4-gl4-transfer` already states the general-type consequences. Its overlap with the two ML.4 transfer/classification interfaces needs one imported ownership boundary, not another classification proof. The existing target supplies neither full stabilization nor the missing weighted theorem.

The suggested file's manifest comments were synchronized with the changed mathematical specifications and locators. No Lean declaration, carrier, proof body, node id, placement, planet or implementation status changed. All added prose is original; no source passages or source-excerpt fields were added.

## Source checks

Public PDFs were read on 18 October 2026. Their SHA-256 values match the packet's existing version records. Page numbers below are those printed in the cited version, unless specified otherwise.

| Public source | Sections read for this review and use |
|---|---|
| [Atobe–Gan–Ichino–Kaletha–Mínguez–Shin, arXiv:2410.13504v3](https://arxiv.org/pdf/2410.13504v3) | Introduction and §0.1, pp. 4–6; §0.3, p. 14; §0.4, p. 15. Checked the common local/global induction and the distinction between proved unweighted inputs and the remaining twisted weighted input. The quasi-split result does not remove extra inner-form assumptions. |
| [Gee–Taïbi, arXiv:1807.03988v1](https://arxiv.org/pdf/1807.03988v1) | Disclosure §1.1, p. 3; §2.5, p. 12; §§2.6–2.8, pp. 15–16; Theorem 3.1.1, pp. 16–17, and §3.3, pp. 19–21; Proposition 7.3.1, p. 39; Theorem 7.4.1 and cases, pp. 40–41. Checked any-number-field scope, the tempered local interface, general-type multiplicity and the stable-transfer distinction above. |
| [Gan–Takeda, Annals 173 (2011)](https://annals.math.princeton.edu/wp-content/uploads/annals-v173-n3-p12-p.pdf) | §12, Theorem 12.1 and proof, printed pp. 1878–1880. Checked generic cuspidal descent, central characters and all-place parameter compatibility through theta correspondences, independently of weighted stabilization. |
| [Ishimoto, arXiv:2301.12143v2](https://arxiv.org/pdf/2301.12143v2) | Introduction, pp. 1–3; Theorems 3.12–3.14, pp. 21–22; §4.6, Theorem* 4.13 and scope paragraph, pp. 32–33. Checked the separation of near-equivalence, generic multiplicity and local L-parameter statements. |
| [Gan–Ichino, arXiv:1705.10106v3](https://arxiv.org/pdf/1705.10106v3) | §§5.1–5.2, pp. 16–18, particularly (5.3). Checked the union over quadratic forms, character labels, and the difference between the real-form constraint and the nonarchimedean equality. |
| [BCGP, arXiv:1812.09269v3](https://arxiv.org/pdf/1812.09269v3) | §2.9, pp. 38–39, including Theorem 2.9.3. Checked the definition of general type, its strong transfer, and the totally real packet consequence. |
| [Jiang–Zhang, arXiv:1508.03205v4](https://arxiv.org/pdf/1508.03205v4) | §1.1, p. 6, and §7.2, pp. 75–76. Checked the split odd-orthogonal generic descent boundary; this is not the unproved general Vogan-packet uniqueness statement. |

Chan–Gan's primary paper was not read. The packet therefore retains the conservative conditional status of Gee–Taïbi's whole theorem for that interface, rather than asserting a separate status for Chan–Gan's proof. Arthur, Mok, KMSW, Xu and the real-packet primary proofs were not re-audited in full: their inherited locators and scope restrictions remain, with the new status claims checked against the public sources above. This is a fix review, not a fresh audit of every theorem in the packet.

## Baseline, ownership and structural checks

I read all eight cited declarations at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`, not merely their names:

| Declaration | Verified boundary |
|---|---|
| `Matrix.trace` | Sum of diagonal entries under the finite-index additive hypotheses. |
| `Polynomial.reverse` | Reversal at the polynomial's actual natural degree. |
| `Polynomial.eval₂_reverse_mul_pow` | Evaluation identity with an invertible element and a coefficient homomorphism. |
| `Matrix.charpoly` | Determinant of XI−A over a commutative ring. |
| `Matrix.ProjGenLinGroup` | Quotient of GL by its centre. |
| `Matrix.ProjGenLinGroup.mk` | The quotient homomorphism. |
| `Matrix.ProjGenLinGroup.map` | Map induced by a coefficient ring homomorphism. |
| `Matrix.ProjectiveSpecialLinearGroup.toPGL` | Natural PSL-to-PGL map, with injectivity. |

None supplies an automorphic classification. Tau Ceti's pin is `f790474821cf4256814db967cb154e7af3d0c369`; no new positive library claim is made. I read `data/library-coverage.json`: its related R15.5/R17.4/R17.5/AGR19.1 ownership entries do not replace ML.4, and the relevant pending audit is not accepted evidence of library coverage.

For roadmap form I read the snapshot's ReductiveGroups and CompactGroups roadmaps. To avoid relying on the older snapshot for ownership, I also checked the current upstream roadmaps at `0d144d044dacebca17b654695b6f1ad58f159b27` and Tau Ceti at `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`, including the OrthogonalSpinGroups and SmoothRepresentationsOfLocalGroups boundaries and relevant Suggested files. Their algebraic-group and smooth representation inputs do not construct the classification being registered here. This was a targeted ownership check, not an audit of the entire current library.

The five proposed ML.4 sublayers partition its 31 targets exactly (2/13/12/2/2). They remain proposals, with original ids and parent assignments retained. The packet's internal prerequisite graph is acyclic; the unconditional GSp₄-local branch uses no classical-classification node, and the classical branch uses no GSp₄ node. All 27 definition/construction targets retain API outlines and at least three tests. This fix adds no definitions requiring a new API. The existing GSp₄/Galois continuation remains a consumer of the classification interface, not a duplicate supplier. MP.3's current local theta/Howe targets retain explicit supplier gaps; they do not close the requested global theta argument.

## Validation and remaining synchronization

- `python3 scripts/check_blueprint.py research/blueprint/packets/ModularityAndLanglandsExtensions.json`: **0 errors, 0 warnings**.
- `lean-check research/blueprint/suggested/ModularityAndLanglandsExtensions.lean`: **exit 0**, 38 warnings for declarations using `sorry`, no other warnings or errors, in the shared pinned-Mathlib build. Memory was checked before compilation. Subsequent edits affected manifest comments only; the executable Lean prefix is byte-identical.
- Manifest checked against all 142 packet targets; internal graph, sublayer partition and API/test counts checked separately. `git diff --check` is clean. Submission path/JSON checks pass.
- No link map or standalone restructuring proposal is under review, so `check_links.py` and `check_restructure.py` have no applicable input. The embedded sublayer proposal was checked directly as described above.

The reader is not an allowed deliverable in #7019. Its seven affected node sections, status title, Ishimoto bibliography/locators and ET.4 request must be synchronized from this packet. The package also needs the round-two corrections already listed in `RT-AREA-langlands-3.fixes-2.md`, plus this review's all-place/general-type restriction, descent input, real-form convention and classification-only prerequisite rule, before upstream submission. Neither reader nor package is certified by this review.

The maintainer still installs the proposed sublayers and route pointers, reconciles the existing ET.4 transfer target, and carries status interfaces to other roadmaps' coarse ML.4 imports. The handoff at `research/blueprint/handoff/REV-FIX-RT-AREA-langlands-3~2.md` records these boundaries. No atlas promotion, upstream edit or manual issue-state change was performed.
