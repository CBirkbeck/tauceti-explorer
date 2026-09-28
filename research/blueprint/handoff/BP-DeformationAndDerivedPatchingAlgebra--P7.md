# BP-DeformationAndDerivedPatchingAlgebra--P7: R03.3 catenarity and regular-local freeness

Claude Code — session `cc-39fac3`, 28 September 2026. Refs #551. **Status: partial checkpoint.** The eight-stage part (P7–P9, R03.1–R03.5) remains open.

This continues the ChatGPT Pro checkpoint #3101. Its handoff, covering the R03.4 characteristic-zero-point refinement and the prime-filtration baseline, is kept [at the #3101 merge](https://github.com/CBirkbeck/tauceti-explorer/blob/7c389e1ff9fb56351da1e84fcfb66074f2769538/research/blueprint/handoff/BP-DeformationAndDerivedPatchingAlgebra--P7.md). Everything recorded there is unchanged unless stated below.

## What this checkpoint adds

Layer R03.6 (PR #3317) requested two statements from R03.3 that the integrated depth node does not export. RS-08 assigns both to R03.3: it keeps "explicit catenarity hypotheses" and "Cohen–Macaulay modules over a regular local base", to be proved compatible with ModularCurves 4D. Four nodes now supply them:

1. **`R03.3/catenary`** (definition `Ring.IsCatenary`; Stacks 00NI; planet "Catenary rings").
   - Chains of primes between p ⊆ q are bounded, and all saturated chains, whose steps are `⋖` in `PrimeSpectrum R`, have equal length.
   - Five API items: isomorphism invariance, quotients (00NK), localizations (00NJ), dimension ≤ 1, and the characterisation below.
   - Four unit tests: a field; ℤ; k[x, y], which pins *saturated*; and Nagata's non-catenary ring (02JE), which pins equal length.
2. **`R03.3/catenary-iff-dimension-function`** (Stacks 0ECF). A Noetherian local A is catenary iff dim A/p = dim A/q + 1 for every p ⋖ q.
   - The right side is exactly R03.6's hypothesis `hcat`.
   - The direct chain proof uses `ringKrullDim_quotient`, finiteness of dimension and `RelSeries.insertNth`.
   - Acceptance: a semilocal counterexample for the local hypothesis, and a catenary but non-equidimensional ring.
3. **`R03.3/regular-local-cohen-macaulay`** (Stacks 00NQ). A minimal generating set of m in a regular local ring is a regular sequence.
   - The proof inducts on the dimension, using the pinned `ringKrullDim_quotient_span_singleton_succ_eq_ringKrullDim_of_mem_nonZeroDivisors` and `isRegularLocalRing_iff`.
4. **`R03.3/free-of-maximal-depth-regular-local`** (Stacks 00NT; the case e = d of 00O7). A finite module with an M-regular sequence in m of length dim A over a regular local A is free.
   - Proof: Auslander–Buchsbaum with finite global dimension (the integrated node `R03.3/depth-auslander-buchsbaum-and-dimension-bounds`), node 3 for depth A, then `Module.Flat.of_projective` and `Module.free_of_flat_of_isLocalRing`.
   - The hypotheses are exactly R03.6's regular-sequence form.
   - Acceptance: the regular and depth hypotheses are both needed, and the result recovers 4D's miracle flatness instead of restating it (RS-08 compatibility).

**New gap:** regular local rings are domains (Stacks 00NP, via gr_m ≅ κ[X₁, …, X_d], 00NO). This is needed by node 3. It is not in the pinned Mathlib and no layer plans it; it is generic local algebra for R03.3.

**For R03.6:** once this merges, R03.6 can replace its two requests to `DeformationAndDerivedPatchingAlgebra:R03.3` with these node ids:
- `free-of-maximal-depth-regular-local` for `patching-free-conclusion` and `patching-kernel-equals-ideal`;
- `catenary-iff-dimension-function` for `nearly-faithful-lift-from-special-fibre`.

## Prototype

- **Fix:** the suggested file did not compile. The prime-filtration induction wrapper failed with "failed to elaborate eliminator, motive is not type correct". It now passes `(motive := motive)` to the `elab_as_elim` lemma.
- **Additions:** a section with the definition, four API signatures, the lemma signatures, four catenary unit tests and one acceptance example (dual numbers).
- **Compilation:** the file was compiled at the pins with the v4.34.0-rc2 `lean` against the prebuilt Mathlib 082e2d3 oleans, one compile with at least 20 GB free and no lake. The result is 0 errors, placeholder-proof warnings only. Every new declaration elaborated, and so did the R03.4 intermediate-field signatures the previous handoff worried about.

## Sources read

- Stacks §10.105 (Definition 10.105.1 and Lemmas 10.105.2–10.105.10 with the proof of 0ECF).
- Stacks §10.106 (Lemmas 10.106.1–10.106.8 with the proofs of 00NQ and 00NT).
- Stacks Proposition 10.110.1 (00O7) and its cited 00NG.
- Stacks §10.119 (02JE, Nagata's example).
- The ModularCurves 4D layer text (its local-algebra list, to confirm that it does not own Cohen–Macaulayness or domain-ness of regular local rings).
- The RS-08 R03.3 decision.
- The pinned Mathlib statements of every new baseline reference.

## Checks

- `scripts/check_blueprint.py` with the pinned declaration index: 0 errors, 0 warnings.
- `research/blueprint/intake.py check-files`: no problems.

## Remaining (unchanged, except R03.3)

- Every other stage keeps the worklist in its coverage record.
- **R03.3 still needs:**
  - the domain property above;
  - the reconciliation of the integrated depth, Auslander–Buchsbaum, complete-intersection, dimension and support node into declaration-sized nodes;
  - the import of the ModularCurves 4D local statements.
