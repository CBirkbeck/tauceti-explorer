# BP-AnalyticNumberTheory--AN.0 — checkpoint 2 (Claude Code cc-39fac3)

Claude Code, session `cc-39fac3`, 29 September 2026. Refs #1021; the bot confirmed the claim (comment 5884836949). **Status: partial.**

## Checkpoint 2: AN.4 on top of AL.1

AutomorphicLFunctionsAndLocalFactors AL.1 now plans Tate's thesis (#3918), so AN.4 imports it.

**Sources.**
- Kedlaya, *Notes on analytic number theory* (same sha256 7a934f…): §§3.3–3.4 (Lemma 3.6, Theorems 3.7–3.11), Exercises 3.6.1–3.6.5 and Chapter 22.
- Tate's thesis §§4.4–4.5, read on page images for AL.1.

**New AN.4 nodes (6).**
- `dedekind-zeta-continuation-and-residue` (planet "Analytic class number formula"). Continuation of Mathlib's `NumberField.dedekindZeta`, its residue κ = `dedekindZeta_residue`, Λ_K(1 − s) = Λ_K(s), and ζ_K(−2) = 0.
- `hecke-primitive-functional-equation` (planet). An identity of meromorphic functions; imprimitive factors are multiplied in, never divided.
- `landau-nonnegative-logarithm`. Kedlaya's Lemma 3.6, whose proof he leaves as an exercise, planned via 3 + 4cos θ + cos 2θ = 2(1 + cos θ)².
- `ray-class-product-nonvanishing`.
- `hecke-nonvanishing-on-line-one` (planet). Kedlaya's Theorems 3.8, 3.10 and 3.11 for ray class characters.
- `mth-root-gluing`.

**Rewired.**
- `hecke-L-function-euler-product-comparison` now imports AL.1/global-zeta-integral and completed-hecke-l-function.
- `artin-induction-versus-artin-holomorphy` now uses the nonvanishing, root-gluing and Dedekind nodes.
- The gaps "Hecke comparison construction and completed functional equation" and "Hecke nonvanishing and local root gluing" are closed, and removed from AN.4's remaining list.
- The AL.1 request records which AL.1 nodes are imported.

**Lean.** Six checked examples were added to the suggested file:
- the 3-4-1 identity and inequality;
- the two local factors of Kedlaya's ψ;
- κ(ℚ(i)) = π/4.

The file elaborates against Mathlib 082e2d3 with 0 errors; the only warnings are the 20 existing placeholders.

**Checks.** `check_blueprint.py`: 0 errors, 0 warnings (17 nodes). `intake.py check-files`: 0 problems. Unit tests pass.

**Continue with:**
- AN.4's Artin Euler-factor carrier: the remaining gap "Artin arithmetic Euler factors and induction adapter".
- The AN.2 and AN.3 proof decompositions.

# BP-AnalyticNumberTheory--AN.0 — partial checkpoint

Author: Codex — codex-a71f92. Refs #1021.

## Completed work

- Read the issue in full before and after the bot-confirmed claim (claim5851054697, confirmation5851055522).
- Read the scoped AUDIT-06 rows before planning, the accepted RS-07 proposal/review, all ten inherited decomposition records and all AN-touching link records.
- Follow RS-07's title/base and ownership: AN.0, AN.1 and AN.6 are closed with no new nodes. Their closure is removal of duplicate/process scope, not a proof-completion claim.
- Seven AN.5 declarations supply the explicit constant D^B, the uniform C≥1 interface and a separate eventual threshold. No divisor-function carrier or prime-factor formula is rebuilt.
- Four inherited AN-owned IDs are retained and narrowed to individual conclusions. The explicit formula now uses the half-weight endpoint convention. The old PNT-error and Hecke-functional-equation bundles have precise continuation gaps.
- Six inherited zeta/Tate IDs remain in the provenance/import ledger. Full Tate Z1–Z3 admissibility is retained in the AL.0/1 requests, not weakened to unspecified test functions.
- All 19 Bennett–Siksek routed items are recorded. Item96 is the selected completed proof-plan chain; the other 18 original proofs are not claimed decomposed.
- Thirteen version-scoped source issues are recorded. E1 is the already confirmed BS divisor-bound error; E5 retains an inherited review qualification. Other findings are author-PDF/HTML checks awaiting independent review, not author contact or a novelty claim.

Statistics: 11 nodes (4 lemmas, 6 theorems, 1 comparison), 0 new definitions/constructions, 0 definition-API items, 0 definition unit tests, 12 theorem/compatibility examples, 5 planets, 27 baseline declarations, 13 gaps, 8 requests. All nodes are unchecked.

## Checks

The suggested file elaborates against Lean4.34.0-rc2 and the pinned source baseline. Every reached Mathlib source file (8,482) was byte-compared with the compilation cache source; no Tau Ceti module is needed. Eight named signatures plus twelve examples produce exactly20 declaration-placeholder warnings, with zero errors and no other warnings. The three analytic signatures omitted for unavailable precise interfaces are explicitly recorded as a gap, not encoded by proposition-valued stand-ins.

A separate scratch file proves the two local inequalities, constant absorption and five concrete carrier/counterexample checks: eight declarations, zero errors and zero warnings. This scratch verification is not published as an implementation.

Exact finite diagnostics passed: 10,000 prime-factorization/divisor-count checks, 70,000 small-prime-cardinality checks, 36,600 rational local-bound checks and 2,562 large-cutoff checks. Rational checks use coarse constants at ε=1/m; they are finite diagnostics, not a proof of the real-parameter theorem. The unit-constant false claim fails at n=2, and the signed reciprocal-zero toy sum cancels while its absolute-value counterpart does not.

The blueprint checker with the pinned declaration index reports zero errors and zero warnings. Supplemental checks validate all seven canonical upstream-stage edges, matching requests and links, 19 routed inputs, short source excerpts, unchecked statuses and empty dropped-stage node sets.

## Checker limitation

The checker treats a prerequisite starting with tauceti: as a library declaration before testing membership in atlas stages. The seven upstream-stage dependencies therefore appear under upstreamPrerequisites, explicit links and requests; they are not fabricated baseline declarations. A recorded gap and supplemental endpoint check make this transparent. Normalize that field when the checker supports canonical upstream stage IDs. No checker/application code is changed.

## Source boundaries

The packet gives URLs, hashes and exact reading ranges. Fresh reads include Tao's full main divisor post; Kedlaya §§7.1–7.3, §8.2, §8.3, Lemma9.8/Theorem9.9 final assembly, Chapter10 and Chapter22; Tate scan57–59 as page images. The key Kedlaya gamma, signed-ordinate and Frobenius passages were checked on rendered pages and/or the author HTML. The old author course page, current preface and bounded author-domain searches were checked for corrections. Full source coverage is not claimed.

Tate scan53–56 was inspected only as unreliable OCR: its full construction remains inherited-review provenance. The local Tate chapters, Kedlaya exercise proofs, the original proofs behind the other BS inputs, the complete mean-value sources and general complex Lerch sources require continued source work. Existing inherited Gauss-sum conjugation and local Fourier-factor corrections remain in the provenance ledger.

At least two nearby upstream documents were read fully: EffectiveBounds and GlobalNumberFields. ArithmeticDirichletSeries was additionally read fully, and the exact NFA2, CFT11, GlobalNumberFields9, AL.0/1 and RepresentationTheory/InductionRestriction6 supplier contracts were inspected.

## Exact resumption order

1. Preserve the seven AN.5 IDs and consume uniform-divisor-subpower-bound for the ES.0 request; do not replace its uniform constant by a unit constant at every input.
2. Decompose AN.2's Hadamard/logarithmic-derivative/gamma chain and bounded-height patch; audit existing complex-analysis results first.
3. Decompose the prerequisites of Theorem9.9 into actual zero-multiplicity, local-zero-count and contour declarations, then add the separately named PNT-error corollary.
4. Read Tate scan53–56 from images and complete the AN.4 arithmetic comparison, importing the full AL admissibility and analytic contracts.
5. Build the Artin Euler-factor/induction adapters and the Hecke boundary-nonvanishing/root-gluing lemmas. Global Brauer meromorphy is not Artin holomorphy, and Chebotarev remains another owner's theorem.
6. Work through the 18 remaining BS routed inputs with their exact constants, conductor/height ranges, exceptional-zero alternatives and certified small cases.
7. Source/decompose the remaining multiplicative-function families and the complex Lerch branch-dependent API.

Publication guard: all55 consulted input blobs were unchanged between snapshot5680ec2a4546c8e933d37e18c2224543d0ebf708 and main bf0c1ca3ffff66284779a374e39a4a33ac829ecb; both recursive tree responses were untruncated. All four deliverable paths remained absent, and the bot-confirmed claim remained ours. Supplier-packet prefixes were also checked for newly appearing inputs.

No new independent-review verdict has been asserted. No issue was closed, no labels were edited, and no git command was used.
