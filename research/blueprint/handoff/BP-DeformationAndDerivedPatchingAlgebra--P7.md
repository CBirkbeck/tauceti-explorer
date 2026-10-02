# BP-DeformationAndDerivedPatchingAlgebra--P7: Hilbert–Samuel continuation

Codex — session `codex-a71f92`, 2 October 2026. Refs #551.
Status: partial checkpoint; all eight stages remain open.

## New work

Preserves all nine prior nodes, their API/tests, original baseline declarations,
coverage, requests, gaps, source receipts and historical elaboration report.
Adds fourteen R03.3 nodes: four definition/construction nodes, seven lemmas
and three theorems. They plan the reserved general module multiplicity once,
with 19 API entries, 16 discriminating tests and three new planets.
The combined packet has 23 nodes, 24 API entries, 20 unit tests, five planets,
62 baseline references, eleven gap groups and two existing requests.
Everything remains implementationStatus unchecked.

The main reserved id is
`DeformationAndDerivedPatchingAlgebra:key/hilbert-samuel-multiplicity`.
It is planned with gaps, not certified closed. Definition is through the
actual eventual cumulative quotient-length polynomial. Intrinsic dimension
and ambient dimension are separate, with dimension-indexed additivity.
The raw length stays in ℕ∞ until finiteness is proved; the zero-module
support dimension remains bottom.

Source reads: Stacks §10.59 mathematical proofs, 10.58.7, 10.52.8, 10.58.5,
10.62.6 and §43.15 at the stated locators, all with source URLs and downloaded
HTML hashes in the packet. Selected IKM arXiv v3 Theorem 9.2/its multiplicity
proof paragraph and Huneke–Yao's introductory unmixedness definition are
recorded with PDF hashes. No whole-paper or publisher-edition collation claim.

## Hypothesis clarification for the maintainer

The out-of-scope key brief conflates formal equidimensionality and
unmixedness in its Nagata sample API. The complete ring
k[[x,y]]/(xy,y²) has a unique one-dimensional minimal component but its
associated prime Ann(y)=m has dimension zero. It has multiplicity one
without regularity. Use every associated prime of the completion in the
unmixedness hypothesis, as in the Huneke–Yao definition. The key-definition
data file is unchanged; this is not an alleged published-source erratum.

## Verification

The actual check_blueprint.py and intake file rules ran read-only from Git
tree 7ec04d9c5af7f5501e7e699d168b512e5c2fe444, with an overlay of these four
deliverables and the pinned declaration index: 0 errors, 0 warnings; all
four intake file-rule checks passed. Historical nodes/baseline records,
sources, gaps, requests and baselineCoverage are preserved exactly.
All fourteen new declaration signatures, 19 API names and 16 labeled example
statements agree with the packet and reader. All new prerequisite edges were
screened against the complete integrated/blueprint node graph; no new cycle.
Literal excerpts and source HTML hashes pass. Exact rational finite
differences through degree five, forty-one monomial truncations, the initial
embedded-prime exception, ideal-power shifts and mixed-dimension additivity
checks pass. Whitespace checks pass. Finite model checks are not
formal-series proofs. GitHub submission/intake results are reported in the
PR conversation after publication, not preclaimed here.

No new Lean compilation: no existing build at both required pins was found.
No project, cache download, library build or language server was started.
The earlier worker's successful elaboration receipt covers the older file
only. New formal-series tests explicitly retain the unresolved local/Noetherian
instance hypotheses. The associativity signature exposes finite-prime and
quotient-ideal adapter data; these adapters still need proof.

## Exact continuation order

1. Inspect pinned associated-graded carriers/APIs; construct actual gr_q(A),
   gr_q(M), degree-one generation, Noetherianity and finite generation.
2. Prove the cumulative filtration identity and decompose the inspected
   graded Hilbert–Serre induction and integer-valued antidifference.
3. Read Stacks 10.60.9, which this continuation did not read. Prove the
   degree/dimension bridge, finite-colength leading-term invariance,
   Artin–Rees induced-filtration comparisons and the finite-length branch.
4. Inspect/prove the polynomial-tail positivity lemma and the finite
   top-dimensional-support/localization length adapter.
5. Prove completion invariance, plane-curve order comparisons and their
   characteristic-qualified examples, regular-local multiplicity, Nagata's
   unmixed converse, and parameter-ideal/Cohen–Macaulay comparisons.
6. Retain the regular-local-domain gap and all original R03.3 depth/support
   work. Preserve RS-08's ModularCurves 4D and ArithmeticGaloisDuality R02.1
   imports. P7–P9 and R03.1–R03.5 keep every original source-route obligation
   from the full issue; none is discharged by the new multiplicity strand.
7. Elaborate all new suggested signatures only in an already available
   build at both exact pins, respecting WORKERS memory/time limits.

All durable results are in the four deliverables. Job scratch is recoverably
removed after publication and remote-body verification; downloaded source
receipts remain in the packet. No local scratch path is required to resume.

---

## Preserved earlier handoff

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
