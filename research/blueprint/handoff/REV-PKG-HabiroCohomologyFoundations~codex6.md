# Handoff: independent Part I package review

Job `REV-PKG-HabiroCohomologyFoundations~codex6`, issue #11452. Codex session `codex-QXXPkr`, 2026-10-20. This is the completed independent review of the package after adv5, with verdict **needs_changes**. No second job was taken. The prior fix worker's accepted self-assessment is replaced by the independent verdict.

The report is [REV-PKG-HabiroCohomologyFoundations~codex6.md](../reviews/REV-PKG-HabiroCohomologyFoundations~codex6.md). It contains the concrete findings, all 151 direct supplier sentences, a complete subsection adversarial audit, twelve native signature checks, source sample and trace relocation map. This note and the report contain everything needed after the review scratch directory is deleted.

## Changes delivered

- Corrected §4.21's false assertion qdR=R[[h]] for an arbitrary étale algebra. The completed empty-frame filtration on qΩ is h-adic; the animated pair is its derived pullback along qdR→qΩ. Added `HabiroHodge.etalePair` and `etalePair_completion`.
- Added the computed counterexample A=ℚ, R=ℚ(i): qdR=ℚ[[h]], qΩ=R[[h]], and for j>0 the uncompleted step has H⁰=h^jℚ[[h]] and H¹=(R/ℚ)[[h]]/h^j. Propagated the distinction into §4.28 and the dimension-zero discussion in §5.7.
- Preserved the natural marked E∞ equivalence H(R,F)≃E(R/A), staticity of H and its partial lifts, every q-Witt/Frobenius transition and canonical h-map. Its domain remains every étale algebra over every perfectly covered Λ-base, without a factor-6, spherical-lift or global-Frobenius assumption.
- Removed the claim that the requested family order and HR donor retarget had already landed. Part I now states its actual direct QW suppliers and acknowledges their cyclotomic prerequisites.
- Corrected QH B.3 from Corollary to Lemma (§0.1) and BS Lemma 18.3's proof range to pp.122–123 (§8.18).
- Left Suggested.lean and metadata unchanged. All 151 baseline numbered subsections, baseline API targets and 53 Check blocks remain. There are 309 baseline bullets with a code-quoted API name followed by a colon, and 311 after this edit; two API bullets and one Check bullet were added. This count comes from the current files rather than adv5’s broader reported count of 314. No mathematical target or generality range was removed to make a shorter proof route.

The README is 255,281 bytes. PACKAGE_REVIEW's binding shape section explicitly overrides older size notes; it requires complete targets and Checks and says the README's size is whatever that content needs. That rule supersedes the issue template's older 200 KB note. No content was cut to satisfy the obsolete cap.

## Unresolved integration findings

**R1: the requested order is not the current topological order.** Part I has no direct supplier clause for HR-derived material, HC, RT or Part II. However, HR §§2.2–2.4 and other explicit contracts consume HC, giving HC→HR. QW.2's current description and `requires` both consume HC.4; QW.3/4 consume QW.2 and Part I consumes those QW stages. Thus HC.4→QW.2→QW.3/4→I also remains. The direct five-package construction graph is acyclic, but not in the order I→HR→HC→RT→II required by #11452. Do not report this as a discovered cycle: the actual reverse prerequisite is the defect. Repair requires authorized changes in HC/QW/HR or an explicit maintainer revision of that order. Changing only Part I cannot remove its suppliers' suppliers.

**R2: duplicate construction ownership.** Part I §§0.1–0.3 now own completion/tensor/detection, coherent finite cyclotomic descent and marked étale coefficient lifts. HR §§2.1–2.8, 3.6–3.11 and 4.1–4.11 still construct the common interfaces themselves and have not been retargeted. Reconcile those targets with the Part I owner and update their consumers; retain HR's additional ordinary comparison, solid/spectral theory, and arithmetic presentations. HR's polynomial/Laurent and scalar-restriction comparisons already connect the apparently different coefficient conventions. Removing Part I's common interfaces would reintroduce the prohibited derived-HR input. Neighbor files and packets are outside this review's allowed edits.

## Trace and boundary conservation

Old Part I §§6.1–6.3 are in Part II §§1.1–1.3; old §6.4 in Part II §§2.1–2.3; old §6.5 in Part II §§4.1–4.2; old §8.1's framed trace clause in Part II §3.3. RT supplies the framed theorem and its q-PD/Čech proof, including prime two, and the trace realizations. The old §9.15 trace–Nygaard comparison is imported through Part II's prismatic/trace contracts (PR Part III §7.0 and AI §AI.7.2); the independent algebraic Nygaard target remains Part I §8.15. Part I §§8.18–8.19 remain the additional canonical θ/Witt map-equality targets. Current Part I Layer 6 is only the open analytic problem. RT and Part II are downstream consumers throughout its construction contracts.

The all-prime algebraic higher-power result α≥2, including at 2, is retained independently of the stronger spectral E₁/E₂ ranges in Part II/RT. The canonical smooth construction retains all relative dimensions with exactly its stated small-prime inversion condition. The analytic comparison remains explicitly open, with its coefficient localization and solid bounded-below compatibility still obligations.

## Out-of-scope observations for the maintainer

- RT §6.14's étale proof prose still calls the filtration h-adic without distinguishing completion from the pair on animated qdR. Its supplier reference to Part I §§4.21/4.28 is now correct, but that prose should be aligned with the pullback contract. This review does not edit RT.
- QW.2's HC.4 prerequisite and HR's donor targets need their own authorized integration change; the local removal of a direct edge does not certify transitive independence.
- The HQ.8 packet's E806 discussion still has the old BS p.124 proof locator. The package now cites pp.122–123; no packet was changed.
- QH Proposition 2.12's proof uses a false general cyclotomic irreducibility premise over ℤ_ℓ (Φ₃ already splits modulo 7). The Part I construction uses the whole finite étale coefficient algebra and marked completion, not an irreducible single-field simplification. This is a source caveat, not a new local defect.
- No suspicious executable instruction or credential request was found in the untrusted material read. No fetched code was executed and no source passages were added to the repository.

## Evidence and verification

Review baseline: atlas `18faffeca6a15be8927e5d95fc45ab4436724d3c`. Current upstream screened read-only: TauCetiRoadmap `0d144d044dacebca17b654695b6f1ad58f159b27` and TauCeti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`, including Completed roadmaps. No additional current-upstream/library duplicate was found; R2 concerns the atlas family. Native pins: Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`, TauCeti `f790474821cf4256814db967cb154e7af3d0c369`.

Sources were the public QH v2, QW v5, TC v4, Scholze canonical-q v1 and BS v4 PDFs linked with exact pages in the report. The 15 sampled subsections are 1.12, 1.11, 1.23, 1.7, 4.21, 4.2, 4.10, 2.7, 2.9, 5.26, 4.11, 3.4, 3.18, 5.6 and 7.2 (seed 11452), plus changed/flagged passages. No restricted book was needed.

Checks:

- `lean-check` on Suggested.lean: **exit 0**, exactly seven declaration-uses-sorry warnings, no other warnings/errors. 226 lines, five real definitions, seven theorem targets, twelve proved examples. Memory was checked first; no Lean server, new project, build or cache fetch was used.
- `scripts/check_sorry_data.py` on Suggested.lean: **exit 0**.
- `scripts/check_blueprint.py` on the main packet and HQ.1, HQ.1-2, HQ.3, HQ.8 packets: **all exit 0**, zero errors and warnings. These input packets are unchanged.
- Target/API/Check conservation, declaration counts, independent review JSON and one-line metadata parsing: **pass**.
- `research/blueprint/intake.py check-files` on the four changed deliverables and the unchanged Lean/metadata: **zero problems**.
- `git diff --check`: **pass**.

The report and review verdict require the family integration above before upstream package acceptance. This submission does not certify that integration or claim that prospective mathematical targets have been formalized.
