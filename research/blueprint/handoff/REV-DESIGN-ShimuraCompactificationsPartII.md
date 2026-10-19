# Handoff: REV-DESIGN-ShimuraCompactificationsPartII

Completed independent review by Codex, session `codex-48EwRG`, issue #3613, on 2026-10-19. The author was Claude Opus 5.5 (`claude-foXVuD`). This is a finished review, not a checkpoint. Verdict: **needs_changes**.

The packet, roadmap, suggested Lean and reader are synchronized. All 73 original nodes were checked; C13/rank-p-finite-extension was added with `addedBy`, API, three tests and a planet. The packet has 74 nodes, 154 API entries and 85 tests (151/82 counted for definitions/constructions by the checker), 25 planets, 12 verified exact-pin baseline declarations, 29 supplier requests and six precise gaps. All nine layers are planned at target level; none is closed. Every source finding has its independent verdict: nine confirmed records and one rejected n=0 allegation.

The complete change log, all 74 node verdicts, reading limits and validation evidence are in [the review report](../reviews/REV-DESIGN-ShimuraCompactificationsPartII.md). Source URLs, file hashes and versions are durable in the packet and reader. Public source files and scratch notes are not deliverables.

## Resume for the revision

Two node contracts are unverifiable; start at these exact gaps:

1. `gap/zarhin-finiteness-ampleness` / C7/zarhin-self-dual-replacement: Lan16 Lemma 4.5, pp. 19–20 uses Hodge ampleness for all polarization degrees to obtain quasi-finiteness. A6’s finite automorphism groups do not provide it. Import the exact PELModuli:M6 or earlier all-degree theorem, then combine with the separate properness argument.
2. `gap/pel-lci-transfer` / C8/pel-local-properties: Lan16 Propositions 14.1–14.2 prove the listed fibre properties and regularity, not the added relative-lci implication. Stacks 069P gives smooth descent; supply the punctured-completed-chart to whole-torsor step, or narrow the target to the verified properties. C14 now uses its specific modular-base argument with its exact comparison gap.

The Klingen order-p gluing gap was closed in the review: Stroh’s construction needs only the two retained end pieces of the partial flag. In the covariant Tate convention the finite-flat-locus criteria are D⊂W̄^⊥ and D⊄W̄. They cover by isotropy; the polarized 1-motive pairing glues the two finite-flat models. The chart/interior identification is still its original conditional input. Keep this explicit adaptation rather than a normality-based uniqueness argument.

The third new gap, `gap/higher-level-graded-extension`, is an interface limit for HigherHidaAndColemanTheory. At n=1 use the separately glued C13 finite-flat order-p object. At n>1 the literal quasi-finite kernel is not a substitute for a global finite-flat graded group; do not export a divisor construction without its missing input. The original Kisin, Klingen/paramodular-interior and Iwahori/lattice-chain comparison gaps remain with ShimuraVarietiesPartII. The Klingen/paramodular gap now also names the required intermediate rank-one chart comparison.

## Conventions and supplier changes to preserve

Build C12 before C11. Within C12 construct the Proj core, compute its completion, then prove full strata. Preserve the removal of the C11 smoothness/embedding-independence cycle and the general C8-lci/C14-lci circularity. SF.4 supplies Stein factorization, not SF.2; integral Γ₀(p) models use ModularCurvesPartII R13.3 and R13.4a, not characteristic-zero R12.3. R11.1 supplies a DVR extension theorem, not unrestricted relative Weil extension.

De Rham cohomology and homology are dual with their stated weights and twists. Retain the similitude line for GSp/GU. Infinite cyclotomic maps are integral; finite-stage maps are finite. Bad-level middle boundary models are not automatically abelian torsors. A zero-dimensional pure base need not have zero abelian part. Keep literal quasi-finite boundary kernels distinct from the finite-flat glued groups, the n=0 identity-chain case, the negative-norm orthogonal cusp cone, and the Klingen multiplicative-H formal open as a proper sublocus of the full inverse image of p-rank≥1.

The MP19 W₁ misprint was checked in the published Numdam PDF at p. 408 against A.1.8, pp. 499–500; the sourceVersions record has its hash. Pilloni and Boxer–Pilloni findings are scoped to the public author PDFs because publisher attempts returned access/preview HTML. E8 records MP19’s published remark about the Lan book and is not an independent book erratum. Brylinski and Faltings–Chai were not directly read in this review: the explicit indirect/parent contracts are recorded.

## Existing work and verification

Mathlib pin: `082e2d37e8b0463410cdb532e111cd43d5a66174`; TauCeti pin: `f790474821cf4256814db967cb154e7af3d0c369`. Current TauCetiRoadmap main checked at `0d144d044dacebca17b654695b6f1ad58f159b27`, current TauCeti at `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Parent upstream PR #1053 checked at `ee6deacb49872a45f86e6a76fd428b03b1e69541`. The parent C5.31 input must come from C8’s independent minimal-model construction. General bundles, finite toric fans and Clifford/Spin theory are already owned elsewhere.

Packet checker: zero errors/warnings. Suggested Lean elaborated with `lean-check`, exit 0, only one theorem `sorry` warning; `check_sorry_data.py` passed. Memory available before elaboration: 86 GiB. Reader consistency, dependency cycles, source finding/version schemas, deliverable/path checks and diff whitespace passed. No source files, local paths, new Lean project or build outputs are committed. The report and this note contain everything a revision needs; this run stops after its one PR.
