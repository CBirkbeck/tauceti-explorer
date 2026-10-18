# MC.0: pointed curve moduli over arbitrary schemes

Issue #8900; worker Codex, model GPT-6; session `codex-MBET6q`.

The planning pass is complete. The sole scope is `StableReductionPartII:MC.0`, with coverage `planned`, not `closed`. The parent packet and its four owned identifiers are unchanged. Seven refinement targets supply the finite-diagram approximation, arbitrary-base genus and log-duality comparisons, concrete geometric fibre groupoids, polarized effective descent, universal evaluation and smooth-base restriction.

There are three theorems, two constructions and two comparisons. The constructions have 17 API items and ten discriminating tests; the universal comparison adds seven API items and five tests, for totals of 24 and 15. Two new planets are selected, leaving room for the parent's existing moduli and universal-curve planets. Twelve baseline declarations are cited after reading their statements at Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369` and Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`.

## Ownership and dependency closure

The 28 API/test names of the parent's owned moduli and universal-curve nodes each have exactly one provider in the export tables. The genus-zero base, cross-ratio, stable-stack properties, universal/forgetful equivalence and forgetting/stabilization exports remain with their precise MC.2 nodes. They do not enter MC.0's descent prerequisites, avoiding a circular proof through MC.2.

StableReduction Layers 0–3 are imported through four existing-contract requests, with the current upstream scope restrictions preserved. In particular, Layer 2's coherent theory is locally Noetherian and its polarized scheme descent is étale. Current TauCetiRoadmap StableReduction and AlgebraicVectorBundles README and suggested files were read at commit `0d144d044dacebca17b654695b6f1ad58f159b27`; their existing family, stability, line-bundle and tensor/pullback work is not replanned. The reviewed library audit and current Tau Ceti family carrier were checked. The latter is not silently available at the older compilation pin. AlgebraicVectorBundles' exact L0A–L0B import is recorded under `upstreamImports`, since the atlas snapshot has no stage identifiers for that newer roadmap.

Three mathematical gaps remain, each with a precise request and consuming node:

1. **SF.2 perfect pushforward and fibre amplitude**, consumed by `MC.0/arbitrary-base-genus`: proper finite-presentation perfect pushforward with arbitrary base change, the local unit splitting, and the single-fibre-degree finite-local-freeness criterion. Existing quasi-coherent pushforward and Tor-independent comparison statements are insufficient.
2. **SF.2 arbitrary-base Cohen–Macaulay module interface**, consumed by `MC.0/arbitrary-base-duality`: concentration and base change for the already owned rigid relative dualizing complex, plus Gorenstein invertibility. The existing module node is restricted to the Noetherian FTS setting; the arbitrary-base complex itself is already imported.
3. **SF.1 polarized fppf scheme descent**, consumed by `MC.0/polarized-descent-comparison`: effectivity with actual lifted line-bundle cocycles, arrows, sections, refinements and base-change compatibility. This reuses the outstanding supplier of `AlgebraicModuliForArithmeticGeometry:R09.3/r093-polarized-descent-comparison`. The existing space and module descent nodes are imported; an ample descended line recovers a scheme.

Thus there are seven requests in total: three extensions and four existing StableReduction contracts. A follow-up resolves those three supplier extensions and reviews their comparisons; it must preserve the distinction between groupoids and classes, and between an arbitrary extra section and a new disjoint stable marking. No general tensor, derived-duality or polarized-descent theory should be duplicated in MC.0. No ownership was moved to this layer from a higher roadmap.

## Suggested file and checks

The 86-line suggested file compiled with `lean-check`, exit status zero, using the shared build at the exact pins above. Memory was checked before compilation. Its only warnings are the four expected unproved-statement warnings. It contains one native slice-section comparison and three evaluation examples, with no data definitions or geometric placeholders. These check a portion of universal evaluation, not a moduli stack or effective descent.

WORKERS.md's binding 2026-10-12 shape rule supersedes the older issue instruction to prototype heavy carriers: the missing geometric family, genus, log-duality, moduli and polarized-descent carriers remain exact README targets. The file has a target/API/test omission inventory. Compiling its native statements does not discharge those mathematical targets or the three supplier gaps.

Local checks passed:

- `python3 scripts/check_blueprint.py research/blueprint/packets/StableReductionPartII--MC.0.json`: zero errors and zero warnings, with the pinned declaration index available.
- `python3 research/blueprint/intake.py check-files` on all four deliverables: zero problems.
- `python3 scripts/check_sorry_data.py research/blueprint/suggested/StableReductionPartII--MC.0.lean`: passed.
- Export coverage, uniqueness of all 28 providers, source-file SHA-256 values, API/test agreement between packet and reader, and reachable node dependencies were checked. No dependency cycle involving a new node was found.
- `git diff --check`: passed before submission.

## Sources and corrections

The source metadata records public URLs, access date 2026-10-18, versions, hashes, and exact sections/pages. Read Knudsen's published Part II scan, Definitions 1.1–1.2 and dualizing discussion (162–164), Proposition 2.1 (174), Lemma 2.5 (178), and Corollary 2.6/Theorem 2.7 (179); the 2012 arXiv v2 introduction/universal square (1–2) and main-lemma hypotheses (3); and the relevant Stacks chapters on limits, algebraic curves, moduli of curves, derived scheme cohomology, duality, descent of spaces and polarized proper schemes. No needed source was unavailable, and no restricted book was used. In particular, the 2012 Noetherian main lemma is not cited as an arbitrary-base stabilization proof.

Three harmless Stacks notation slips are recorded in `sourceIssues`, in independent wording: the repeated source variable in Lemma 53.20.11's residue map, the wrong intermediate-open index in Lemma 48.28.5's restriction cocycle, and the unprimed source of the primed immersion in Lemma 48.28.6. The PDF and live tags agree; the checked tag/section comments give no correction. Each affects nothing mathematically and requires independent review. Nothing was sent to source authors.

The scratch work contains no information a successor needs; the mathematical contracts, source provenance, omission inventory and validation outcome are all in these deliverables.
