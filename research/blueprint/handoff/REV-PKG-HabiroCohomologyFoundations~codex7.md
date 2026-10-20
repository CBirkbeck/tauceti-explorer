# Handoff: independent Part I package re-review

Job `REV-PKG-HabiroCohomologyFoundations~codex7`, issue #11466. Codex, session `codex-iFM9sJ`, 2026-10-20. Completed review; **accepted** under the maintainer-revised HC → QW → I → HR → RT → II order. No second job was claimed.

## Delivered

- Replaced the preceding needs_changes assessment in the package review.json with this independent accepted verdict. Full reasoning, source verification, adversarial controls and all 151 supplier sentences are in `research/blueprint/reviews/REV-PKG-HabiroCohomologyFoundations~codex7.md`.
- Added §3.7's three differential-ghost API entries and three tests: the m=1 identity, integral parity at m=2 versus splitting after inversion, and the factor 4 on the surviving ghost of V₂(dx). Extended the QW Paragraph 3.15 locator to pp.41–42.
- Aligned the Layer 5 opening with §5.13's perfectly covered base. Clarified that the étale scheme example first gives the static cohomological coefficient ring; ordinary GSWZ recognition is the later HR application.
- Preserved all 151 targets, all existing API entries and all existing Checks. The API count grows from 311 to 314 and Check blocks from 53 to 54; every block has 3–8 tests. Suggested.lean is unchanged at 226 lines, as is the single-line math.AG metadata. No packet or neighboring package was edited.

## Family integration and implementation boundaries

Old R1 is withdrawn: the HC → QW → I path now agrees with the required direction. Treat the commissioned QW.n contracts as named suppliers as the issue instructs. Part I directly imports QW.1–QW.4; it imports no derived HR, RT or Part II contract. Layer 0 owns common cohomological completion/descent/étale lifts. Sections 4.21/4.28 export the marked étale Habiro comparison and full divisor/Frobenius data. The uncompleted pair remains a derived pullback, distinct from its h-adic filtration completion, with the Q(i)/Q negative control intact.

Old R2 is being handled by FIX-PKG-HabiroRings~adv4. This review accepts Part I's own content; it does not certify that the separate HR donor retarget is complete. HR should consume the common interfaces rather than re-own them. RT's use of the étale pair should preserve the distinction between the uncompleted pair and its filtration completion. The old HQ.8 packet's BS proof-page note remains a historical packet issue; the package already gives pp.122–123. No out-of-scope file was changed.

Trace/spherical constructions remain in Part II with RT/prismatic/A_inf suppliers. Part I's all-prime algebraic α≥2 range, including p=2, stays independent of spectral lift restrictions. Its analytic comparison remains open. The explicit proof obligations for enhanced multiplicative/coherent refinements, framed comparison, smooth proper perfectness, normalized uniqueness, conditional finite-projective exchange and canonical θ/Witt map equalities are implementation work, not omitted targets or claims of existing formalization.

Current upstream/library were checked read-only at TauCetiRoadmap `0d144d044dacebca17b654695b6f1ad58f159b27` and TauCeti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`, including the newer/Completed roadmaps named by WORKERS. Existing torus characters and the vector-bundle dictionary are already deferred. Ordinary Rees grading and Adams completion of an already bigraded DGA do not implement these enhanced targets. No additional duplicate was identified and no target was removed for duplication.

## Verification

- `lean-check research/blueprint/packages/HabiroCohomologyFoundations/Suggested.lean`: **exit 0**, exactly seven declaration-uses-sorry warnings, no errors or other warnings. Required pins: Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`, TauCeti `f790474821cf4256814db967cb154e7af3d0c369`. Five real-bodied definitions, seven theorem targets, twelve proved examples. Twelve signature comparisons are in the report. Memory was checked before elaboration; no language server, project, dependency build or cache download was started.
- `python3 scripts/check_blueprint.py` on the main Part I packet and its HQ.1, HQ.1-2, HQ.3 and HQ.8 packets: **all exit 0**, zero errors and warnings. Inputs are unchanged.
- `python3 scripts/check_sorry_data.py` on Suggested.lean: **exit 0**, no offenders.
- `python3 research/blueprint/intake.py check-files` on the four changed deliverables/handoff plus unchanged Suggested.lean and metadata.toml: **6 files, zero problems**.
- JSON/metadata parsing, all baseline target/API conservation, the 151-row supplier inventory, every Check block's minimum count, and authorized file scope: **pass**. `git diff --check`: **pass**.

The source sample uses Random(11466) on the 151 ordered source-bearing headings; all 15 selections and their printed-page locators are in the report, along with the delicate/previously flagged passages. Public source versions were QH v2, QW v5, TC v4, BS v4, BMS1 v3, Scholze v1 and DAG VIII. No restricted book was needed. No source file or passage was copied into the repository, no fetched code was executed, and no suspicious executable instruction or credential request was encountered in the untrusted material read. Scratch source files and logs are disposable after submission; all needed evidence is recorded here and in the report.

Nothing remains for this review. Resume the separate QW design and HR fix in their own assigned jobs; this session stops after opening and validating its single PR.
