# Completed review: REV-EtaleDualityAndPerverseSheaves--EDC.0~2

Codex, session `codex-CfAORS`, completed [issue #7044](https://github.com/CBirkbeck/tauceti-explorer/issues/7044) on 10 October 2026. This is a finished independent review, with verdict **accepted**, not a checkpoint. The claim was confirmed by the bot before work began. No second job was taken.

The [report](../reviews/REV-EtaleDualityAndPerverseSheaves--EDC.0~2.md) records all 52 node verdicts, the source and baseline audit, corrections, previous-review gate resolutions and deferred ownership decisions. The [packet](../packets/EtaleDualityAndPerverseSheaves--EDC.0.json), [reader](../readmes/EtaleDualityAndPerverseSheaves--EDC.0.md) and [suggested file](../suggested/EtaleDualityAndPerverseSheaves--EDC.0.lean) are synchronized. Final inventory: 52 nodes, 150 API entries, 76 tests, 24 planets, 48 baseline declarations, ten requests, ten confirmed source issues, four external gaps and three restructuring proposals. All eight stages stay planned; every implementation stays unchecked. No nodes or baselines were added or removed by this review.

## Validation

- `python3 scripts/check_blueprint.py research/blueprint/packets/EtaleDualityAndPerverseSheaves--EDC.0.json`: **0 errors, 0 warnings**, after the accepted review object was written.
- `lean-check research/blueprint/suggested/EtaleDualityAndPerverseSheaves--EDC.0.lean`: **exit 0**, **460 warnings, all `declaration uses sorry`**, no errors or other warnings. Available memory was checked before each run; no library build, update, cache download or language server was started. No compile remains running.
- Exact declaration inventory: all **150 API names** occur as typed declarations, including named instances; all **76 test names** identify Lean examples. Their hypotheses, targets and discriminating cases were read semantically, not only matched by name.
- All **52 nodes** occur exactly once in the fresh `review.checked`; all **ten public source PDF hashes** match the packet; all ten source-issue verdicts name this review. Every definition/construction has at least three tests.
- Reader checks cover every statement, hypothesis, proof step, API contract, test, prerequisite and source locator, plus fresh source-issue verdicts and corrected bibliography.
- `research/blueprint/intake.py check-files` reports **5 files, 0 problems**. `git diff --check` and deliverable-path/private-path checks passed. The review did not modify atlas promotion data, upstream checkouts or another job's files.

## What changed

The geometric compactification index now uses proper cartesian-open refinements. The purity pro-system is untwisted and its specified trace augmentation has target Λ(−d)[−2d], so the Hom stalk calculation produces the actual adjoint map with the right shift. Constructibility requests carry noetherian coefficient and finite-presentation conditions. The dimension-one dualizing base has a separate finite-Tor variant without self-injectivity; all bounded constructible coefficients still require self-injectivity. Integral lisse systems have finite free compatible reductions.

Nine APIs were added: separate twist/pushforward comparisons, integer Picard multiples, supported-class uniqueness/additivity, finite-flat degree, and Chow quotient/refined pullback/unit class. Canonical identity, Frobenius over ℤ/5, unbounded Tor, the crossing support in A², the full Gysin exactness sequence and nonzero P² Chern examples now test the stated mathematics. Central shriek signatures retain explicit torsion binders when elaborated.

Source metadata was corrected in three places. The linked Angéniol article is cohomological finitude, not an intersection article; its §3 Theorem 3.2 is now cited for biduality. The cycle proof instead uses SGA 4½ [Cycle] 2.3.8(i)–(iii) and 2.3.9–10, pp. 148–150. The author-hosted self-intersection paper is by **Lascu, Mumford and Scott**, Mathematical Proceedings of the Cambridge Philosophical Society 78 (1975), pp. 117–123; the existing `LMS-1975` key is retained. Grothendieck's Chern paper is Bulletin SMF 86 (1958), pp. 137–154. The flag argument uses a filtration with line quotients, never an asserted direct-sum splitting.

## Packaging and later work

There is no unfinished work on this review. The next job can package the accepted scheme-level plan when its supplying tier/bundle is ready. Use the corrected packet and reader as the authoritative contracts; the suggested file is a prototype and openly omits unavailable enhancement stability/coherence and excellence predicates as PROTOCOL §13 requires. Successful elaboration proves no proposed mathematics.

The pinned baseline remains Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. Current upstream was inspected at `cd03e06852a13216ad246d0623492c4beac39af2`, and current Tau Ceti at `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Current finite locally free sheaves, the Picard commutative group and the Euler-characteristic degree definition are already available and must be reused. AlgebraicVectorBundles and JacobianChallenge are existing upstream roadmaps, not new EDC targets. Keep only their missing divisor/degree theorem, Jacobian and bundle-geometry interfaces as imports. The exact SF.5 lci pullback applies via the global graph immersion between smooth separated schemes; it does not need arbitrary locally factorable-lci gluing.

The four external gaps and three existing restructuring proposals remain for the maintainer: stack operations/consumers (RT/3), perfect-space transport and model independence (RT/16), higher absolute purity/semistable traits, and Grothendieck–Ogg–Shafarevich. Common equivariant operations have one proposed owner, the stacks Part II; the perfect-space Part II owns only finite-model/perfection transport. No upstream change or higher-tier notion move was made in this review. Local trait computations are an explicit lower finite-coefficient supplier request; EDC owns the resulting base-duality theorem.

Public URLs, source versions, SHA-256 hashes, theorem/section/page locators, corrections and all integration instructions are retained in the packet and report. No continuation depends on scratch files; the scratch downloads and logs are deleted after the PR opens.
