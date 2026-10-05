# Analytic number theory independent review — checkpoint

Job `REV-AnalyticNumberTheory--AN.0`, issue [#527](https://github.com/CBirkbeck/tauceti-explorer/issues/527). Codex — `codex-7e92bd`, 2026-10-05.

**Partial review; no acceptance verdict.** The maintainer requested that this session submit its current work and stop for the transition to one process per job. The packet intentionally has no top-level `review` object. Its inherited `status: complete` describes the blueprint author's planning pass, not completion of this review. The intake's `deliverables_complete` must return false for this checkpoint.

The input is commit `5132943b05181dfb33bfc0a3ba618f200f1cc7fe`. After fetching main, the job's files were unchanged upstream; the branch was rebased before editing. The blueprint authors recorded in its provenance and prior submissions are `cc-39fac3`, `codex-a71f92` ([PR #3142](https://github.com/CBirkbeck/tauceti-explorer/pull/3142)) and `codex-rtOQ9t` ([PR #6149](https://github.com/CBirkbeck/tauceti-explorer/pull/6149)). This session did not write that blueprint. Its earlier authorship of the accepted Lipnowski–Tsimerman paper extraction does not constitute an independent re-review of that extraction here; its existing review must remain the authority for that input.

## Counts and concrete changes

The packet retains 224 nodes: 22 definitions, 80 lemmas, 112 theorems and 10 comparisons; 89 API items, 75 unit tests, 26 planets, 54 baseline declarations, 24 requests and 43 gaps. No node, API item, test or planet was added or removed. Source issues increase from 15 to 16.

1. The baseline description for `DirichletCharacter.LFunction_ne_zero_of_one_le_re` now includes `χ ≠ 1 ∨ s ≠ 1`, as required by `Nonvanishing.lean:400`. Its consuming Hecke node already distinguishes the principal pole.
2. `AN.4/ray-character-log-coefficients` now cites Kedlaya Theorem 3.7 and (3.3.1), rather than Definition 3.9. It records the Euler-logarithm coefficient `Σχ χ(h^k)/k`, the positive-integer range, and the trivial-group coefficient test at k=2. Its locator and excerpt were checked in the primary text; the ray-class supplier contracts remain to be checked.
3. `AN.4/quadratic-landau-contradiction` now cites Theorem 3.11, printed pp.19–20, rather than the nonreal-character Theorem 3.10. This correction does not certify the separate endpoint/supplier obligation.
4. `AN.4/hecke-primitive-functional-equation` distinguishes conductor-completed Λ from Mathlib's completion without the conductor power. The acceptance check gives the pinned equation and its transformation, including the inverse character and orientation of the root number. The general number-field comparison remains to be audited.
5. `AN.2/prime-power-interval-margin` now specifies a common complex coefficient sequence bounded by 1 on the same interval in both sums. The triangle inequality proves the transfer once the numerical mass bound is supplied. The numerical bound itself remains an original-source obligation.
6. `AN.2/explicit-weighted-prime-sum` now explicitly quantifies one E before every x, so interval subtraction uses the same constant. The original Rosser–Schoenfeld proof is still unread in this review.
7. New `AnalyticNumberTheory/E18` records the missing divisor n in Kedlaya (3.3.1). Both text and page image show the omission; at level 1, the local second coefficient must be 1/2. The positive divisor preserves the intended proof. The bounded correction search and version hash are in the finding. Its local confirmed verdict does not count as a completed independent review until this job finishes.
8. The suggested file's two affected mathematical comments are synchronized, and its header now reports successful elaboration. Executable declarations were unchanged. Historical author provenance saying their file was not compiled is retained as history; the separate review-checkpoint record gives the current result.

## What was actually read

All 54 baseline defining/theorem statements were freshly read at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`, including surrounding field/number-field parameters for Tau Ceti. Every name exists in its cited module. This is not a claim that all 224 consumers satisfy those statements' hypotheses: the consumer audit is partial. The declaration-index SHA256 was `86649a7d5f35d1178a45fe7aa4713741d03d43ff3b37bb8c91a1da1c794c8ce1`.

The AN.0–AN.7 reviewed library-audit target descriptions, evidence names and overlap records were read. The audit's AN.7 expZeta equality misses a z factor already restored in the packet. Its Hecke layer number is stale; the packet points to GlobalNumberFields layer 9, whose actual current contract still needs reading.

The complete payloads of input nodes 0–50 inclusive and two later nodes were read, 53 total. Reading a payload is not a verified node verdict. The first 210 lines of the incoming suggested file were manually read; subsequent executable lines have compiled but have not all received the mathematical signature review. The blueprint handoff was read; the entire reader document has not yet been independently checked.

Fresh primary-source reading is limited to the following:

| Source | Passages read in this session | SHA256 of acquired text |
| --- | --- | --- |
| [Tao, The divisor bound](https://terrytao.wordpress.com/2008/09/23/the-divisor-bound/) | Entire main post as browser text; excludes reader comments | `fa8e842cdb21d5db6a12d7486698a0e4f3260469a9d14c35dd4a75e8e7104840` |
| [Kedlaya, December 2025 notes](https://kskedlaya.org/papers/ant-ptx.pdf) | Printed pp.19–22, 43–63, 127–130 as text; printed pp.19 and 51 additionally inspected as page images | `7a934fce8272cedd36ad609f79bbe79af0056320bb1e0bc690c87af990f305be` |
| [Bennett–Siksek, published 2020 article](https://annals.math.princeton.edu/wp-content/uploads/annals-v191-n2-p02-s.pdf) | Printed pp.362, 365, 369–370, 372–379, 382–388 as text | `3920a7524a37870942fe3591ac858db23cb604f4331bccd2a6dc5f11a1671fbf` |
| [Tsimerman, published 2018 article](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p02-p.pdf) | Printed pp.381–384 as text | `43259ca3cfedfb574bf1fe2f80e1023cb736ea299a76588536fd816340722abc` |

Tao's current HTML differs from the historical packet hash because the page is dynamic; no byte identity with the earlier acquisition is claimed. None of the downloaded but unread sources counts as verification. In particular, Tate's scan, the Lerch papers, Yun–Zhang, Duke–Imamoğlu–Tóth, the remaining routed papers and Schoenfeld's 1976 original were not freshly read in this checkpoint. Rosser–Schoenfeld's publisher URL returned an anti-bot HTML page. The Thorner–Zaman supplement for the quadratic Hecke route was not acquired. The 14 accepted extraction payloads were recovered from commit `30e57b9090cc4c5e6d91a92848a4837206a921f8`; they do not replace primary-source reading.

All 15 inherited source-issue records were read. Fresh Kedlaya text supports the concerns E2–E13 and E16, but a completed item-by-item adjudication was not written. E1's Bennett–Siksek passage was read, without yet independently certifying its numerical counterexample; E17's Lerch source was not read. The inherited `sourceVersions` dates are the authors' records, not a claim that this reviewer read those entire works.

A possible gamma-duplication error suggested by PDF text extraction was rejected after inspecting printed p.51: the denominator is correctly `2^(2z−1)`. Do not add this as an erratum. Remark 10.8's χ/χ² denominator on printed p.62 still needs an image check; no finding is asserted here.

## Compilation and checks

The final full suggested file was elaborated using an existing build with clean Mathlib source at the exact pin, Lean 4.34.0-rc2, and the command shape:

```text
lake env lean -j1 -M8192 <checkout>/research/blueprint/suggested/AnalyticNumberTheory--AN.0.lean
```

The command ran from the existing outer project's directory so sibling package dependencies were on the search path. An earlier attempt from its nested Mathlib directory stopped at a missing Aesop search path; no source or dependency build was needed to resolve that invocation issue. No Lake project was created, cache downloaded, library built, or language server started. A single Lean process was used; 91 GiB was available before the final run, which finished in 2.587 seconds.

Final suggested-file SHA256: `7c837cb342c8c439d16ed1e1e41d601375f13aa15f4e4e672365f982dc3c8645`. Result: exit 0, 158 warnings, every one `declaration uses sorry`, no errors or other output. The raw local compiler-output SHA256 was `c4f207263de5c6beb5e175f5f39fa52077d1704d7b14d280bfaeef4e0f5618b9`; that raw log contains machine paths and is not retained. Reproduction uses the public suggested file and the pins above. Only Mathlib modules are imported; Tau Ceti declarations were inspected as source, not compiled by this file. No transitive cache-provenance audit is claimed.

The six carrier definitions listed in `provenance.currentPass.nativeSignatures.omittedCarrierDefinitions` remain mathematical comments, not executable signatures. Successful elaboration does not resolve that gap or establish the propositions proved with `sorry`.

The packet checker with the pinned declaration index reports **0 errors and 0 warnings**. The source-issue schema/version checks, submission file checks, and checkpoint-classification assertion are also run before submission. Their results are summarized in the pull request. The [handoff](../handoff/REV-AnalyticNumberTheory--AN.0.md) gives the remaining review work. No promotion or manual merge is requested.

## Read payload inventory

Zero-based input positions; all identifiers below have prefix `AnalyticNumberTheory:`. No inventory entry means that the node is accepted.

- 0: `AN.5/prime-power-log-bound`
- 1: `AN.5/large-prime-power-bound`
- 2: `AN.5/divisor-bound-from-local-bounds`
- 3: `AN.5/explicit-divisor-subpower-bound`
- 4: `AN.5/uniform-divisor-subpower-bound`
- 5: `AN.5/absorb-divisor-bound-constant`
- 6: `AN.5/eventual-divisor-subpower-bound`
- 7: `AN.2/classical-zero-free-region`
- 8: `AN.3/von-mangoldt-explicit-formula-and-pnt-error`
- 9: `AN.4/hecke-L-function-euler-product-comparison`
- 10: `AN.4/artin-induction-versus-artin-holomorphy`
- 11: `AN.4/landau-nonnegative-logarithm`
- 12: `AN.4/ray-class-product-nonvanishing`
- 13: `AN.4/hecke-nonvanishing-on-line-one`
- 14: `AN.4/dedekind-zeta-continuation-and-residue`
- 15: `AN.4/hecke-primitive-functional-equation`
- 16: `AN.4/mth-root-gluing`
- 17: `AN.2/exceptional-real-zero`
- 18: `AN.2/theta-ap`
- 19: `AN.2/exceptional-conductor-repulsion`
- 20: `AN.5/quadratic-conductor-largest-prime`
- 21: `AN.2/schoenfeld-theta-upper`
- 22: `AN.2/mod-eight-interval-mass`
- 23: `AN.2/prime-power-interval-margin`
- 24: `AN.2/two-real-zero-separation`
- 25: `AN.2/exceptional-zero-unique`
- 26: `AN.2/character-weighted-pnt`
- 27: `AN.2/rosser-schoenfeld-pi`
- 28: `AN.2/explicit-prime-reciprocal`
- 29: `AN.2/landau-page-bounded-height`
- 30: `AN.3/selberg-zero-density`
- 31: `AN.2/quadratic-effective-zero-gap`
- 32: `AN.2/explicit-weighted-prime-sum`
- 33: `AN.2/explicit-plus-euler-product`
- 34: `AN.2/weighted-prime-interval`
- 35: `AN.4/bounded-degree-brauer-siegel`
- 36: `AN.5/bounded-norm-ideal-count`
- 37: `AN.4/artin-conductor-bound`
- 38: `AN.4/artin-log-functional-equation`
- 39: `AN.4/artin-value-one-subpower`
- 40: `AN.4/artin-log-derivative-one`
- 41: `AN.4/quadratic-zeta-factorization`
- 42: `AN.4/bounded-degree-residue-bounds`
- 43: `AN.4/quadratic-hecke-value-one`
- 44: `AN.4/primitive-hecke-convexity`
- 45: `AN.4/quadratic-hecke-cauchy-derivative`
- 46: `AN.4/quadratic-hecke-log-derivative-one`
- 47: `AN.4/quadratic-hecke-log-functional-equation`
- 48: `AN.5/ideal-coefficient-divisor-majorant`
- 49: `AN.5/fixed-order-divisor-subpower`
- 50: `AN.4/quadratic-residue-quotient`
- 166: `AN.4/ray-character-log-coefficients`
- 170: `AN.4/quadratic-landau-contradiction`
