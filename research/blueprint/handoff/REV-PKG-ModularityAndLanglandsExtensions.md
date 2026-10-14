# REV-PKG-ModularityAndLanglandsExtensions — completed independent review

Issue #9226; Codex, session `codex-0ANVwD`; branch `codex-0ANVwD-review-9226`. The bot confirmed [this claim](https://github.com/CBirkbeck/tauceti-explorer/issues/9226#issuecomment-6157503835). The package author was Codex session `codex-8M65j7`, a different worker. This is the completed single review job, not a checkpoint. No second job was claimed.

The verdict is **needs_changes** in [review.json](../packages/ModularityAndLanglandsExtensions/review.json). [The report](../reviews/REV-PKG-ModularityAndLanglandsExtensions.md) records applied corrections, the source sample and previously unverified sources, all-target adversarial coverage, all fourteen Lean signature checks, current-upstream duplication screening and exact remaining defects R1–R8. [The package README](../packages/ModularityAndLanglandsExtensions/README.md) incorporates every correction that could be made within this review's scope. Suggested.lean, metadata, the accepted packet and the author's handoff were left unchanged.

## What changed

The GSp₄ limit chamber now has λ₁>0 and the shifted character-lattice parity, with a weight-(2,2) witness. The local scalar uses residue cardinality q rather than coefficient prime p. SP_n's rank/degree convention, the single-valued archimedean character and compact-group character imports are corrected. Ordinary/Fontaine–Laffaille lifting is mapped to the existing Layer 5 endpoints, while genuinely stronger lifting contracts remain explicit gaps. The exterior-square assertion is scoped to its verified s=1 source support, cyclic automorphic induction loses its incorrect Arthur citation, and several page locators are corrected. FKP's local-lift/primitivity/cyclotomic hypotheses and the needed all-primes monodromy comparison are made explicit. Primary Schmidt citations and a current-library Satake ownership boundary were added.

All 142 target anchors, 151 API bullets and 110 Checks remain. All 27 definition/construction targets have at least three Checks; no target or test was dropped. There are 201 distinct anchors and 895 resolved internal links. Target removals against current upstream: **none**. The newly found classical rational Satake API supplies a special case, while the retained targets are arithmetic CM-field or automorphic comparisons with broader specified hypotheses.

## Where to resume before an upstream draft

1. Supply the six absent method/geometric owners named in the README scope: the four symmetric-power methods, PotentialAutomorphyDworkMotivesPartII and OpenImageTheoremsForAbelianVarieties. Their consumer statements are preserved, but a name alone is not a supplying roadmap.
2. Close the Dwork coefficient-prime semistability/ordinary-filtration and semisimplification comparison; use Qian thesis Remark 3.0.13, printed p. 55, to distinguish it from auxiliary-prime local compatibility. Ordinary automorphy lifting itself is already in PotentialAutomorphyInfrastructure Layer 5, §5.23.
3. Establish the exact local-connects CM lifting, Caraiani–Newton potentially semistable lifting plus residual modularity/X₀(15) analysis, and CG conditional general-field exports. Strengthen AL.4, ALS.3, R19.2, MP.3, ET.3/ET.4, AF.1 and ES5 only at the comparisons listed in R3–R5.
4. Verify the Hilbert-field R22.5 export and Patrikis–Taylor constituent-system/common-extension export R24.5. Settle the upstream order for out-of-list suppliers. PotentialAutomorphyInfrastructurePartII already exists in the atlas; the older author handoff's claim that it does not is stale. Existence is separate from permitted tier ordering and exact export coverage.
5. For §2.30 prove the all-primes regular-nilpotent local comparison, including the coefficient prime at the auxiliary Steinberg place, or furnish a second appropriate place. The stronger conclusion is now conditional on this input; the review does not purport to refute FKP Proposition 9.1.
6. Obtain the remaining primary proofs/locators: Clozel Theorem 3.13 and Lemme 4.9, corrected Khare weight-one descent, BHR Proposition 5.3.7, Henniart's finite-place completion and the separate archimedean comparison, Kim 2003/2004, cyclic induction and full Adams–Johnson conditions. The report distinguishes inaccessible primary proofs from statements checked in later sources. General-rank exterior-square analysis needs its own primary locator.

Do not accept the package merely because the unchanged packet checker passes or Suggested.lean elaborates. Conversely, no heavy carrier should be added to Lean just to simulate one of these absent contracts. All source descriptions must remain in original words; obtain restricted books only through the maintainer's cleared library.

## Validation and environment

- `lean-check` on Suggested.lean: exit 0; 22 warnings, all `declaration uses sorry`; 106 GB available before the single run. Suggested.lean was unchanged after compilation. No other Lean process was started.
- `check_sorry_data.py`: exit 0. `check_blueprint.py` on the unchanged accepted packet: zero errors/warnings; six planned and zero closed stages, fourteen gaps, sixty-one requests.
- Independent inventory/link audit: all 142 input targets retained once, 151 API items, 110 Checks, minimum three definition/construction Checks, no forward dependency between numbered targets. Small numerical Hodge sweep: 135 cases passed.
- Intake check on the four changed deliverables: zero problems. `git diff --check`: passed. Only the package README/review verdict, independent report and this handoff are submitted.

Pinned elaboration: Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`, Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. Duplication audit: current roadmap checkout `0d144d044dacebca17b654695b6f1ad58f159b27`, current library `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. The nine newer roadmaps and four specified Completed roadmaps were screened and relevant matches read. No Lake command was run in either current read-only checkout. No source files, source passages, local paths or scratch-dependent evidence are needed by the next worker.
