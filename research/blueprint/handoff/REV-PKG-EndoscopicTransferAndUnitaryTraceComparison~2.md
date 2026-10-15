# Handoff: independent package fixing review, second version

Job `REV-PKG-EndoscopicTransferAndUnitaryTraceComparison~2`, issue #9868. Codex session `codex-axYnXd`, 15 October 2026. This session did neither package version and did not conduct the earlier review. The review is complete; its verdict is **needs_changes** for the single structured CM lifting input described below. This is not a partial-review checkpoint.

## What changed

The package README and Suggested.lean contain the fixing review's corrections. The independent report is `research/blueprint/reviews/REV-PKG-EndoscopicTransferAndUnitaryTraceComparison~2.md`; review.json has this job's independent reviewer identifier and dated verdict. Metadata remains `topic = "math.NT"`. No packet, atlas, library or upstream roadmap file was changed.

The principal corrections are:

- §§2.5, 2.7–2.9: positive κ transport for unprimed factors, inverse for primed factors, and the actual type-R₃ quadratic splitting correction. The order-three check detects a reversed convention.
- §§8.9, 8.19, 8.23: normalized opposite Jacquet trace pairs with a half-modulus orbital factor; the full-modulus version pairs with unnormalized Jacquet. Removed the redundant H half-modulus input. GL₂ with q=4 gives 2 rather than 1 and is pinned by a proved numerical Lean example.
- §§1.1, 1.4, 1.6–1.7, 1.14, 1.18: distinguish Picard from merely braided cohomology, ordinary from inverse-s twisted data, and pointed real kernels from groups; transport inner cocycles correctly and require a sufficiently large z-extension for the L-embedding.
- §1.12: retain the integral reductive-model z-extension rather than duplicating the existing field extension, integral Lang theorem or rational Kottwitz kernel.
- §§3.4, 3.7–3.17: correct the positive-characteristic Kostant slice, positivity quantifier, cameral connectedness, inertial rank defect, Picard stabilizers/components, weak abelian hypotheses, support amplitude across degrees, and the #P′⁰(k) trace factor. SL₄ in characteristic 5 and the translation quotient of an elliptic curve are explicit controls.
- §§4.1–4.4: correct auxiliary connected-centralizer notation, measures, the Sp–Spin pair, globalization order and the Laumon–Ngô self-dual versus Kostant basepoint sign.
- §§10.1, 10.30, 15.3: separate trace construction from the imported classical LLC theorem and state arithmetic/geometric correspondence duality consistently.
- §12.12: integral coefficient systems live on sheaves before compact supports; rational ℓ-adic coefficients are obtained afterwards. An inverse limit of global compact supports and an arbitrary finite-stage factorization of colimit maps are both excluded by examples. §§12.22, 15.6 no longer promise an unsupported action dictionary between Dat and basic-Hecke conventions.
- Added explicit API/checks for the global obstruction, unitary Lie centralizer, CM lift, strict Dieudonné normalization, quasi-EL generators, tower actions and locally analytic vectors, and the Matsushima boundary cases.

## Exactly what remains

Resume at **§8.14, `CMIsogenyLift.pelRealization`**, then recheck its use in §8.15. In the unramified simple PEL situation of [Shin, Counting points on Igusa varieties](https://math.berkeley.edu/~swshin/IgusaVar.pdf), Lemma 11.1, pp. 36–37, the target is a positive (B⊗_F N,∗⊗c)-polarization and rational paired B⊗_F N-module W₀ matching the prime-to-p Tate module and the prescribed real paired B-module. The proof needs a characteristic-zero lift with the extra N-action and compatible positive polarization, retaining the embeddingwise integral O_F Lie ranks used in (35), together with algebraization. The integral O_B-linear identification Σ≅A[p∞] is part of the hypotheses.

Shin's proof refers to Harris–Taylor pp. 170–171 at this lifting step. That book was not available as a cleared source; no other copy was obtained. The review does not replace the proof by a claim of formal smoothness: O_B-PEL smoothness alone does not lift the extra N-action. Supply the structured lemma after Shin's factorwise splitting/Morita reduction, using a cleared reading or an accessible proof, or give a direct paired-realization proof with the same local and real conditions. The missing theorem must preserve Lie multiplicities; an arbitrary principal polarization need not lift.

The weaker target is now separated in §8.14. [Tate's Honda exposition](https://numdam.org/item/SB_1968-1969__11__95_0.pdf), Theorem 2, p. 102, and Lemmas 3–6, pp. 101–105, construct a CM reduction up to equivariant isogeny after finite extension. That does not preserve the prescribed integral Lie signature or lift the full quaternion endomorphism algebra of a supersingular elliptic curve. [Kottwitz, Points on some Shimura varieties over finite fields](https://webusers.imj-prg.fr/~christophe.cornut/M2/Ref/Kottwitz_PointsShiModp.pdf), Lemmas 13.1–13.2, pp. 415–418, prove the global invariant cancellation by first varying the comparison space/polarization and then computing on a weak isogeny lift. The p and infinity contributions cancel globally. This cancellation is not the structured realization theorem. Kottwitz Lemma 9.2, p. 402, and Lemmas 17.1–17.2, pp. 434–435, separately justify positive polarizations and the H¹ twisting classification.

The README marks this gap explicitly and carries it into §8.15. Do not remove the marker or accept the package until the precise structured proof is present.

## Ownership and inventory

Current upstream checked: TauCetiRoadmap `0d144d044dacebca17b654695b6f1ad58f159b27`; current Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. The nine post-snapshot roadmaps and Completed ContourIntegration, EffectiveBounds, OrthogonalL2Bases and RestrictedProducts were searched, along with the current library and pinned declarations. The report records the previous A1–A49 supplier recheck. No command built or mutated the read-only checkouts.

Four generic local aliases were removed: `TauCeti.orbitalIntegral`, `TauCeti.normalizedOrbitalIntegral`, `TauCeti.pseudoCoefficient`, `TauCeti.trace_pseudoCoefficient`. Their existing owner is AutomorphicSpectralTheory §§6.9, 6.18–6.19, now a boundary input. §2.1 retains centralizer-normalization/Lie descent; §2.10 retains the averaged Euler–Poincaré elliptic formula. Existing SR.5.2 classical LLC, SR.5.3 multisegment theory, Satake and ExactK0 remain imported. No new separate roadmap was created, and there is no new upward supplier move to propagate.

The package represents 210 packet topics in 211 numbered sections. Of 420 packet API entries, 416 remain local/specialized and four are the imports just listed. All 271 named checks (268 distinct names) remain represented. The final explicit local Needs graph has 710 edges, zero unresolved sections and zero cycles; qualified external roadmap section numbers were excluded. All 33 backticked external roadmap names have valid current/lower-tier ownership. The graph does not certify the semantic CM input.

## Unmodified packet-name discrepancy

ET.6a still refers to 14 obsolete names, producing 26 checker errors. The other four packets pass. This pre-existing issue was not patched because packets are outside this review's authorized files. If a separate job authorizes reconciliation, use the following suppliers; the table does not imply the packet checker passes today.

| Obsolete reference suffix | Current supplier / package section |
| --- | --- |
| ET.5/acceptable-test-functions | acceptable-functions-with-geometry, §8.1 |
| ET.5/igusa-endoscopic-test-function | p-test-function, §8.19 |
| ET.5/transfer-at-p | acceptable-levi-pushforward, transfer-factor-constant, p-test-function; §§8.9, 8.18, 8.19 |
| ET.5/jb-endoscopic-levi-data | effective-levi-endoscopy, §8.8 |
| ET.5/acceptable-functions-determine | central-shift-character-separation, §8.11 |
| ET.5/unitary-igusa-trace-formula | unitary-stable-specialization, §8.22 |
| ET.6/llc-characterizing-properties | functorial-weil-parameter and full-wd-correspondence; §§10.20, 10.30 |
| ET.6/full-wd-local-langlands | full-wd-parameter and full-wd-correspondence; §§10.26, 10.30 |
| ET.6/local-jacquet-langlands | esi-jacquet-langlands, §10.3 |
| ET.6/segment-wd-parameter | segment-wd-adapter and special-block-factor-formulas; §§10.23, 10.25 |
| ET.6/drinfeld-level-deformation-spaces | drinfeld-deformation-instance, §10.2 |
| ET.6/semisimple-langlands-parameter | semisimple-trace-parameter, §10.18 |
| ET.6/badulescu-langlands-jacquet-map | additive-langlands-jacquet and jacquet-induction-quotient; §§10.6, 10.10 |
| ET.6/zelevinsky-classification | Existing SmoothRepresentationsOfLocalGroups SR.5.3 |

## Verification

- Final Suggested.lean: **311 lines, ten light real-bodied definitions**. `lean-check` exited **0** with **16 warnings, all `declaration uses sorry`**, no errors or other warnings. Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`; Tau Ceti pin `f790474821cf4256814db967cb154e7af3d0c369`. Available memory was 90 GB. Only README changes followed that final successful check. No Lean process remains running.
- All layers received an adversarial pass; the report gives the tested instances and the corrections. Ten Lean signature groups were compared by hand with their README claims. The two new numerical examples are proved; the general target theorems remain roadmap statements with sorry.
- Fifteen random source sections, seed 9868, were opened and checked; further source passages were read for the new corrections and the CM boundary. Public file hashes and version-specific locators are retained in the report. Cleared material was read in place; no file or passage from it was copied.
- Packet checker: ET.0 61 nodes, ET.4 34, ET.5 32, ET.6 33, each exit 0 with zero errors/warnings. ET.6a 50 nodes, exit 1, 26 existing unresolved-name errors, zero warnings.
- `python3 research/blueprint/intake.py check-files` on the six authorized deliverables (including unchanged metadata): **6 files, 0 problems**, exit 0. `git diff --check`: clean, exit 0. Only the five authorized changed files are submitted.

This handoff contains everything needed to resume the specific mathematical fix; scratch downloads, local logs and scripts are not dependencies and are deleted after submission. Stop this session after its one review PR; do not claim another issue.
