# Handoff: REV-ArithmeticGaloisRepresentations--R01.3

Issue [#7948](https://github.com/CBirkbeck/tauceti-explorer/issues/7948); Codex session `codex-QbX3Ak`; 2026-10-09. This is a finished independent review, not a checkpoint. The input was authored by session `codex-RCESYh` in PR #8102.

**Accepted as a complete target-level planning pass.** R01.3 remains **planned, not closed**, with five precise gaps and ten supplier requests. Current `detail.json` and PROTOCOL §2 govern granularity. All 24 nodes have individual verdicts: 13 verified and 11 corrected. No node was added or removed. All fourteen baseline declarations are independently confirmed at the pins; 36 API items, 36 tests and six planets remain.

Deliverables are the [review](../reviews/REV-ArithmeticGaloisRepresentations--R01.3.md), [packet](../packets/ArithmeticGaloisRepresentations--R01.3.json), [reader](../readmes/ArithmeticGaloisRepresentations--R01.3.md) and [suggested file](../suggested/ArithmeticGaloisRepresentations--R01.3.lean). The report records every correction and every node’s evidence and limitations. Public source URLs, sections, pages and matching SHA-256 hashes are in the packet and reader. No source excerpt, restricted source file or scratch artifact is needed to continue.

The material corrections restore Schur-index factors in the Brumer–Kramer aggregate proof, correct quotient/tower and digit locators, distinguish Serre–Tate traces from the endomorphism characteristic-polynomial input, supply direct integrality and residual API prerequisites, strengthen the unipotent test and right-limit invariant signature, and consume R01.2’s WD invariant identity rather than re-plan it. The sharp elliptic bound uses the concrete auxiliary primes 3 and 2. The current-library note identifies the already implemented finite upper quotient theorem and wild inertia; neither is a new target here.

The five inputs still requiring closure are:

1. LocalFieldsRamification, Part II: finite/absolute ramification theory over complete DVR fields with perfect infinite residue field.
2. R01.3’s restricted curve-cohomology and determinant/duality interfaces, including semistable unipotent monodromy and the node-count Euler formula. General higher-tier cohomology/duality must import these restricted inputs.
3. Saito’s matching finite-extension discriminant/Artin defect identity. Liu’s restatement and elliptic deduction were read; the original Saito proof was not obtained. The uniform Ogg target includes mixed characteristic (0,2), but is not claimed closed.
4. ClassFieldTheory, Part II: the exact density identity comparing the local Artin image of each unit subgroup with upper ramification.
5. RepresentationTheory refinement: rational Schur-index/character-field and p-group classification/Clifford interfaces. The arithmetic lift and constituent applications remain owned here.

The restricted elliptic minimal-regular smooth-locus/minimal-differential result moves down to R01.3. Higher-tier `NeronModelsAndSemistableAbelianVarieties:R11.2` imports it. `ArithmeticGaloisRepresentations:R01.6` imports the uniform Ogg conductor comparison; its general abelian Tate-module construction is not an R01.3 prerequisite. These moves are already recorded in the packet. No upstream checkout was edited.

Validation: the packet checker reports zero errors and zero warnings. The revised suggested file elaborates with `lean-check` at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`: 57 warnings, all for `sorry`, no errors or other warnings. `git diff --check` passes. All nodes retain `implementationStatus: unchecked`.

The orchestrator can integrate this review and route the five precise follow-ups. Keep their dependencies visible when packaging; do not label this stage closed or the uniform Ogg proof finished. No revision-round question remains for the original author. This worker takes no second job.
