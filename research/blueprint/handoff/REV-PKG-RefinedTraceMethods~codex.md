# REV-PKG-RefinedTraceMethods~codex — completed fixing review

Codex, session **codex-TBjuiV**, 20 October 2026. Refs #11269; independently reviewed package #11265. Claim comment 6280746263 was confirmed by bot comment 6280748541. Only this job was taken. The verdict is **needs_changes**, with the review completed and the fixable defects corrected in place.

Read the [review report](../reviews/REV-PKG-RefinedTraceMethods~codex.md) first. It contains the exact four unresolved groups, all thirteen duplicate removals, every retained target's inventory, fifteen sampled source checks, eleven author-flagged source/foundation checks, the adversarial mathematical pass, ten Lean signature checks, supplier blob identities and public-source hashes. This handoff and report contain everything needed after the temporary scratch data is deleted.

## What changed

The package now distinguishes the residual C_p norm F V on genuine Prüfer TR from multiplication by p for trivial action; uses actual supplier sections, including StableHomotopyKTheory §§7.29/7.31; fixes the generated cyclotomic t-structure/truncation argument and completeness input; fixes Hatcher/Higher Algebra anchors and the attribution of graded cyclic HKR; and replaces garbled NS PDF extraction with our own locators. Several weak Checks now compute actual failures. The ordinary coefficient quotient and coherent spectral realization remain separate, and the Lean closing comment accounts explicitly for the heavy definitions.

Deleted thirteen duplicate targets. TopologicalKTheory supplies compact-space K, reduced/relative/negative groups, Bott, representability, splitting, special λ-structure and degree-zero Adams. CharacteristicClasses supplies integral Chern classes/cohomology of BU and the rational character. GeneralizedCohomology G5.4 supplies commutative ku/KU, their coefficients, connective cover and Bott localization. The report lists all thirteen individually with input section numbers. Layer 5 is renumbered to §§5.1–5.3 and keeps only the additional Snaith comparison, coherent localized stable Adams lifts, relative graded cyclic HKR/THH and oriented fixed-point coefficients. No removal stubs remain. All 237 nonduplicate targets retain their mathematical scope.

## Where a revision must resume

1. **Find or construct the missing supplier prefixes.** HabiroRings and HabiroCohomologyFoundations need actual upstream contracts for the scalar/solid and q-Hodge/Habiro–Hodge objects consumed in Layers 6–8. K2SymbolsBrauer needs relative Dennis–Stein symbols for §4.19; KTheoryLowDegrees' Steinberg/plus comparison does not supply them. KTheoryFiniteLocalFields needs the π₀TR/Witt and full truncated-polynomial inputs. No matching current main folder or open new-folder PR was identified. Keep these visible as required constructions until an actual owner supplies them; an accepted atlas packet is insufficient.
2. **Provide concrete stable-category K and IK.** GeneralAlgebraicKTheory §13.6 covers enhanced DG/Waldhausen/Frobenius models and explicitly leaves arbitrary stable-infinity-category K separate. Layers 4 and 7 need the stable S-construction, suspension/delooping, localization/Morita/filtered-colimit laws and comparison with those concrete models. BGT's corepresentability theorem does not replace the concrete construction.
3. **Supply the structured chromatic j input.** §6.8 requires K(1)-localization, coherent stable Adams actions, the Adams-summand fixed-point/local-sphere comparison, the prime-two variant and E∞ maps. Ordinary completion and Moore towers do not suffice. Keep j and the source's j_{p,0} distinct, and preserve all-prime E₁ versus odd-prime E∞ hypotheses of their THH comparisons.
4. **Finish §8.12's syntomic K-sheaf proof.** Supply the finite-coefficient henselian rigidity of CMM Theorem 4.36, p. 36, prime-to-p rigidity, and the derived syntomic-to-étale pushforward/descent argument. BM Example 1.6 is an announcement, not that proof. Keep n≥1, i≥0, the full p-quasisyntomic domain and sheafification before pushforward; DGM alone cannot close this gap.

The report additionally states the limits of the source audit: no complete independent Barwick–Glasman model proof or unpublished Raksit proof was obtained; W's lecture-based light solid foundations remain explicit construction targets. The rational-index rigidification source was checked at Ramzi v2 Construction 4.79/Theorem 4.81, pp. 43–46. The NS 2019 erratum, pp. 215–218, was read separately from the atlas's B.19 mathematical correction. No source passage was copied into a deliverable.

## Baseline and ownership

Current read-only roadmap checkout: `0d144d044dacebca17b654695b6f1ad58f159b27`; newer remote main tree: `b9ad8291de4c8b319427ed40b412eb6135b88dc9`. Current Tau Ceti: `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Elaboration pins: Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`, Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. Read both current trees; no Lake command was run there, no repository was copied and no build/cache was created.

Current DGAInfinity ordinary Hochschild/Morita and EnhancedDerivedSheaves absolute symmetric trace-class/duality objects stay boundary imports; the retained variants add cyclic/mixed structure or ordered relative E₁ structure. The nine newer roadmaps and Completed directions were included in object searches. The Caraiani–Newton 94-roadmap list does not assign these K/Habiro stray directions a tier; none was invented. No move was made into a higher supplier. Preserve Layer 3 as owner of the general TR/Cartier/V-completion machinery and §9.5 as owner of the polynomial extension into uncompleted derived de Rham; the later prismatic/Beilinson statements consume them.

## Validation and submission

`lean-check` exits 0 at the pins, with exactly four admitted-theorem warnings and no errors. All seven examples are proved and concern the kept definitions. There is a single `import Mathlib`, no sorry'd data, admitted example, `set_option` or fabricated coherent carrier. Suggested.lean has representative statements only; the README retains the full programme.

All three unchanged RefinedTraceMethods packets pass `scripts/check_blueprint.py` with zero errors and warnings. The six validated files pass `intake.py check-files` with zero problems; `git diff --check` is clean. Metadata stays the single `math.KT` line. Packets and other jobs' files are unchanged. No suspicious untrusted instruction was encountered; fetched source and PR text was used only as data, and no source PDF was added to the repository.

The branch is **codex-TBjuiV-refined-trace-review**. The submission completes this review with its precise negative verdict; it does not accept the package for TauCetiRoadmap and does not claim a second job.
