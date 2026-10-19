# Completed review handoff: admissible pairs and p-adic Hodge structures

- Job: `REV-DESIGN-AdmissiblePairsAndPadicHodgeStructures`, issue #3488.
- Worker: Codex — `codex-bosL7v`; bot-confirmed claim at 2026-10-19T05:21:28Z.
- Branch: `codex-bosL7v-review-admissible-pairs`.
- Verdict: accepted after corrections, as a complete target-level pass. All 13 stages are planned, none closed; acceptance does not certify that the stated targets are proved or formalized.
- Full record: [review report](../reviews/REV-DESIGN-AdmissiblePairsAndPadicHodgeStructures.md), with a per-node register matching `packet.review.checked`.

The final packet has 78 nodes (63 corrected, 15 verified, no added nodes), six confirmed baseline declarations, 136 API statements, 104 discriminating tests and 58 planets. Each of the 34 definitions/constructions has at least three tests. All 191 extraction items remain routed. All 48 inherited source findings have independent verdicts: 47 confirmed and E24 rejected because the source already defines M0 using the trivial filtration. Three new Part I findings, E49–E51, are confirmed; the total is 50 confirmed and one rejected.

The substantive corrections cover AP0's exactness/specialization dependency, local-system topology and coefficient hypotheses, integral-locus scope, residual flat-bundle comparison and analytic flag descent, the distinction between a fixed isocrystal and varying étale fibre forms, the obstruction to a globally framed inverse Hodge family, the duality proof of product connectedness, and exact application suppliers. Reader, roadmap and suggested-file explanations are synchronized. Existing supplier targets were imported as exact nodes, while current upstream representation, quotient and parabolic Levi targets remain direct imports. No upstream file was changed and no target was re-planned from the current roadmaps or library.

One mathematical proof gap is explicit: AP6's arbitrary-field full-rank de Rham criterion. It must be established independently at `PadicHodgeTheory:P8:local-rational`, at least for a constant flat bundle. The finite-Q_p field hypothesis in Liu–Zhu cannot be removed by resolving the source, and a fixed-Levi-type Grassmannian theorem cannot prove constancy of that type. The source theorem remains a justified planning target with this open input, inherited by downstream uses. This review job is finished; the remaining mathematics is assigned to its supplier contracts.

Eleven extension requests remain, each with exact consumers: generated-subcategory/subobject Tannaka reduction; strict-field Serre openness; four specific ReductiveGroups refinements; basic Hodge-type uniformization; rational rigidified BKF modifications; the full-rank criterion; ordinary Katz–Igusa formal/generic tower monodromy; localized-period finite-projective effective descent. The last case is beyond the existing RF4 positive-ring descent and localized-isomorphism statement. Avoid recreating those existing positive-ring or representation-theory targets when routing follow-up.

Source scope: Howe–Klevdal I/II arXiv v2, plus the precise Scholze and Liu–Zhu comparison passages and Bhatt–Hansen weakly Shilov definition. Published Part I formulas were selectively collated on pp. 1004, 1006, 1008, 1014, confirming the new sign/index/quotient findings. No full journal collation was done. Part II DOI/SharedIt access supplied no article text, so its findings remain scoped to arXiv v2. V1 Lemma 4.1.1 was directly compared with v2's corrected basic-stratum scope. Source URLs, versions and hashes are in the packet. No source passages or restricted files were added.

Pinned statements checked: Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`; Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. Ownership also checked against current TauCetiRoadmap `0d144d044dacebca17b654695b6f1ad58f159b27` and current Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`, read-only. No Lake command was run in those current checkouts.

Validation:

- `python3 scripts/check_blueprint.py research/blueprint/packets/AdmissiblePairsAndPadicHodgeStructures.json`: 0 errors, 0 warnings.
- `lean-check research/blueprint/suggested/AdmissiblePairsAndPadicHodgeStructures.lean`: exit 0 at the pinned shared build; only 13 expected `sorry` warnings. Memory was checked before compiling. The file has 187 lines, one real-bodied definition, seven theorem signatures and six examples; no fabricated carrier or sorry-valued data definition.
- Source-finding schema/version checks: passed for all 51 entries, including individual review attribution.
- Exact reader synchronization: all 78 statements, 136 API entries and 104 tests present; all 191 routing entries unique and owned nodes present; planet count at most six per layer.
- `python3 scripts/check_sorry_data.py research/blueprint/suggested/AdmissiblePairsAndPadicHodgeStructures.lean`: passed.
- `git diff --check`: passed.
- Submission-path/JSON check (`intake.py check-files`): six files, zero problems.

No second issue was claimed. Scratch contains no material needed for a continuation and is removed after the pull request opens.
