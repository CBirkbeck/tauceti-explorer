# PKG-ModularityAndLanglandsExtensions~2 — blocked checkpoint

Issue: #9884. Worker: Codex, session `codex-ajs4yM`, 2026-10-16.
Branch: `codex-ajs4yM-modularity-langlands-package`.
Claim confirmed by the bot in issue comment 6212026245, responding to claim comment 6212022785.

**Status: incomplete; do not approve or advance this package upstream.** The accepted input still contains fourteen gaps, sixty-one requests, six planned stages and zero closed stages. The existing package review remains `needs_changes` and is unchanged. This checkpoint makes bounded source and proof repairs; it does not certify the package or resolve all R1–R8.

## Blocking condition and required decision

R1 cannot be completed within the issue's allowed files. Searches of `research/blueprint/roadmaps`, `packets` and `packages` found no supplying files for:

- `SymmetricPowersByAnalyticContinuation`
- `SymmetricPowersByUnitaryLevelRaising`
- `SymmetricPowerAutomorphyLifting`
- `SymmetricPowersByTensorFunctorialityLifting`
- `PotentialAutomorphyDworkMotivesPartII`
- `OpenImageTheoremsForAbelianVarieties`

These are proposed owners, not established imports. The accepted plan routes the method proofs to these owners. Creating their plans, changing ownership or changing the tier/bundle order would require edits outside this issue's explicit deliverables. The maintainer needs to arrange supplying jobs, or authorize a corrected ownership/order plan, before this package can close. No substitute local method roadmap or placeholder carrier has been invented.

There is also an intake limitation: `issues.py::deliverables_complete` has no package-specific incomplete-state test and falls through to success when the listed outputs exist. All three package files already existed before this run. Submit this checkpoint as a **draft** so automatic intake cannot misclassify an incomplete revision as complete. Maintainer intervention is needed to merge it while preserving the unfinished job. No pipeline file was changed.

## Changes made

Only the package README and this handoff are changed. Suggested.lean, metadata, review.json, accepted packet and reader document are untouched.

1. Added the editor's freely accessible primary Clozel text. Theorem 3.13 is stated on printed p. 112, with proof pp. 112–129; Lemme 4.9 and proof are on pp. 144–145, also announced on p. 112. Corrected the coefficient-isomorphism contract to use the conjugate automorphic representation and its permuted infinity type. Explicitly separated archimedean purity from finite-place Ramanujan. Added conjugate-weight and higher-degree-CM counterexamples in §4.7, and restricted the Bianchi consequence to regular algebraic cuspidal representations.
2. Specified AJ87 induction degree, root inequality, transported characters, real/complex Weyl double cosets, parameter factorization and the separate unequal-rank reduction in §3.17. Added discriminating Checks and primary references to §§2–3 and §10. These are required AF.1 construction data, not an assertion that the missing carrier or transfer machinery now exists.
3. Sharpened the Patrikis–Taylor §2.7 contract: full coefficient field of definition, conjugation-invariant coefficient primes, actual multiplier pairing, finite family and one common Galois extension with avoidance. Retained the distinction between cuspidal constituents and their possibly reducible isobaric sum.
4. Supplied a mathematical repair for R7 in §§2.13 and 2.30. Repeat the finite local-condition construction with two trivial Steinberg places of distinct residue characteristics, both away from the original coefficient prime. FKP Theorem E accepts simultaneous finite prescriptions and the Moret–Bailly step accepts both negative-valuation conditions. For each new coefficient prime, one place is away from it, so strict ramified compatibility supplies regular nilpotent monodromy. Labelled this as a finite-set deduction from the construction, rather than the literal statement of Proposition 9.1. The original one-place formulation still needs its own residue-characteristic comparison.

## What remains, by review item

| Item | Remaining obligation / next location |
|---|---|
| R1 | Establish the six actual suppliers above, their exports and a permitted order. Affects eigenvariety propagation, level raising, automorphy lifting, tensor lifting, Dwork geometry and open image, especially Layer 4 §§4.1, 4.9, 4.11, 4.16–4.18 and 4.22–4.24. |
| R2 | Construct the coefficient-prime semistable ordinary filtration at v(t)<0 and its subquotient/global-semisimplification comparison in the appropriate supplier. Qian thesis Remark 3.0.13, printed p. 55, distinguishes coefficient-prime from auxiliary-prime monodromy. Remark 4.0.4, p. 65, also warns against inferring automorphic ordinarity from the auxiliary-prime realization. Reading the remarks does not supply the missing construction. Resume §§2.3–2.5, 2.26, 2.29 and 2.32–2.33. |
| R3 | The existing ordinary and Fontaine–Laffaille endpoints do not supply local-connects BCGNT Theorem 3.2.1, Caraiani–Newton's potentially semistable Theorem 1.3 with AKT residual modularity and X₀(15) analysis, or conditional CG Theorem 5.16 over general number fields. Resume the C-LOCAL-DEFORMATION contract and §§1.5, 2.9, 2.14 and 2.20. |
| R4 | AL.4 still needs the analytic continuation/nonvanishing comparison; ALS.3 the Harder Bianchi comparison; R19.2 parallel weight one; MP.3 full Howe duality and GRS descent. The existing coarse-stage names do not provide these extensions. |
| R5 | Weighted/twisted stabilization, local intertwining, full AJ carrier/character maps and the FS I.10.2 stable-category equivalence still require real supplying constructions. The new AJ data improve the contract only. Preserve TWFL and all nongeneric classification hypotheses. |
| R6 | R22.5's exact totally real Hilbert potentially Barsotti–Tate export is still unverified. The primary Patrikis–Taylor contract is sharper, but R24.5 still lacks its required constituent-system export at regular/pure generality. Do not substitute BLGGT extreme regularity or claim the reducible sum is cuspidal. |
| R7 | Two-place proof repair is now specified. It still uses the exact finite local-prescription and strict-compatibility suppliers. Check those exports when closing the dependencies; no coefficient-prime monodromy comparison has been fabricated. |
| R8 | Clozel primary locators are supplied and AJ defining constructions are located. Khare 1997 plus the 1999 corrigendum, BHR Proposition 5.3.7, Henniart 2009's completed finite-place comparison, Kim 2003/2004, all-place cyclic Arthur–Clozel induction and the general-rank exterior-square analytic theorem still need the exact primary statements/proof locators identified in the review. No unauthorized copy was used. |

`PotentialAutomorphyInfrastructurePartII` does exist; do not repeat the earlier handoff's contrary claim. Its exports and upstream order still need checking. It and `MetaplecticAutomorphicForms` lie outside the 94-roadmap order. The six R1 absences are a different problem. Preserve the plan's distinction between import contracts and local endpoint proofs, and avoid restoring the coarse PA.4/ML.1 cycle.

## Sources read and limits

- Clozel, [editor's public volume](https://www.jmilne.org/math/Books/AA1988a.pdf): Theorem 3.13 and proof, printed pp. 112–129, and Lemme 4.9 and proof, pp. 144–145. The scan's PDF page number is printed page plus eleven. The proof supplies conjugate regular algebraic cuspidal representations and the archimedean weight relation; it supplies no finite-place Ramanujan theorem.
- Adams–Johnson, [Numdam primary paper](https://www.numdam.org/item/CM_1987__64_3_271_0.pdf): introduction, §§1–4 and §10, especially Definition 2.2 p. 277, (2.5) pp. 279–280, Definitions 2.9/2.11 and Lemma 2.10 pp. 280–281, parameter construction p. 286 and Theorem 10.3/Proposition 10.4 pp. 307–308. The complete middle character-identity proofs were not audited; the L-embedding lemma itself refers to separate work. No claim of full primary-proof closure is made for AF.1.
- Patrikis–Taylor, [author manuscript](https://virtualmath1.stanford.edu/~rltaylor/irred.pdf): Lemmas 1.3–1.6 and proofs, pp. 8–9; Theorems 1.7 and 2.1, pp. 10–13; Corollaries 2.2–2.3 p. 13. Theorem 2.1 supplies a common extension and constituent systems; Lemma 1.6 retains its coefficient-prime hypothesis.
- FKP, [arXiv v5](https://arxiv.org/pdf/2008.12593v5): Theorem E pp. 5–6 and Proposition 9.1 with its proof pp. 41–43. The two-place variant follows by imposing both finite local conditions in that construction. No error in the published one-place argument is asserted.
- Qian, [Stanford thesis](https://stacks.stanford.edu/file/druid:yn815wp7042/Thesis%20Final%20Version-augmented.pdf): Lemma 3.0.12 and Remark 3.0.13 p. 55, and Remark 4.0.4 p. 65. These readings locate the outstanding local comparison, without treating it as constructed.
- BCGNT arXiv:2309.15880v3, §1.6, Definition 1.6.1 and following paragraph, p. 13: checked the parallel-weight and conjugate-pair conventions against the primary text.

All new mathematical descriptions are original formulations. No source files or excerpts are committed. Scratch sources are dispensable; the URLs and page locators above suffice to resume.

## Library boundary and verification

Read the binding protocols, issue and independent review. The two full style models were DifferentialGeometry and AdicSpaces. The current read-only roadmap and library commits are respectively `0d144d044dacebca17b654695b6f1ad58f159b27` and `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`, matching the prior review's audit. The nine newer roadmap locations and four Completed locations were checked; no new target ownership was introduced in this partial revision. No Lake command was run there. `data/library-coverage.json` contains no entries keyed `ModularityAndLanglandsExtensions:*`; this is a missing roadmap audit entry, not a claim that the libraries contain nothing relevant.

Read the current `HeckeRing.GL2.Newform` Satake declarations: parameters are quadratic roots with multiplicity, and the angle theorem assumes a real coefficient and a Ramanujan bound; the exponential parameter comparison additionally uses trivial local nebentypus. Preserve the package's existing rational-newform import boundary. The pinned Mathlib reverse-evaluation statement was also checked. No current-library declarations were re-planned.

- `lean-check research/blueprint/packages/ModularityAndLanglandsExtensions/Suggested.lean`: exit 0, 22 warnings, all `declaration uses sorry`, no other warning or error. One elaboration, 88 GB available before starting. Shared Mathlib commit `082e2d37e8b0463410cdb532e111cd43d5a66174`; shared Tau Ceti build is the configured `f790474` build. Suggested.lean remains 230 lines and imports Mathlib only.
- `python3 scripts/check_sorry_data.py research/blueprint/packages/ModularityAndLanglandsExtensions/Suggested.lean`: exit 0.
- `python3 scripts/check_blueprint.py research/blueprint/packets/ModularityAndLanglandsExtensions.json`: exit 0, zero errors/warnings; 142 nodes. This is structural validation, not closure of the fourteen gaps.
- Inventory/link audit: all 142 input target anchors appear exactly once; all original 151 named API items and numbered subsections retained; all original Checks retained, with additional witnesses; 203 unique explicit anchors and 906 resolved internal links; 121 numbered subsections and 32 Checks blocks.
- Numerical witnesses: the conjugate cross-sums/differences, higher-degree-CM counterexample and distinct-characteristic place selection were checked directly.
- `python3 research/blueprint/intake.py check-files` on the two changed deliverables: two files, zero problems. `git diff --check`: clean.
- `metadata.toml` remains `topic = "math.NT"`. `review.json` remains `needs_changes`.

Resume by resolving the supplier/ownership blocker, then work through R2–R6 and the remaining R8 sources against the unchanged independent report. This run did not perform a new full package acceptance review.
