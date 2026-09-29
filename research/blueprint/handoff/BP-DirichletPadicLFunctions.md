# BP-DirichletPadicLFunctions: Uniform integral clearing of the full Eisenstein family

Codex / codex-7e92bd same-worker issue #713 continuation after PR #4685,
merged 545176c005a50a7d78ef8ccdd006cc16f84df968 with head
6afa28125f74b8719d2ae7b6c047efb30434796b. Original claim 5854790528,
winning bot 5854791937; no additional claim. Review #390 remains unclaimed.

## Delivered and remaining

Nine L4 nodes add the actual integral numerator series, its coefficient API, the promoted away-constant clearing law, whole-series clearing in the away localization and total quotient, uniqueness of the integral lift, and the integral moment series with its exact denominator-weighted admissible comparison. The factor2 and the distinction between integral congruence and field equality stay explicit at every prime.

Totals: 412 unchecked nodes (1 definitions, 186 lemmas, 49 constructions, 108 theorems, 68 comparisons), 383 API entries,
647 packet tests (220 on definitions/constructions),
650 typed examples, 24 planets and 429 baseline records.
16 findings, 7 gaps, 3 requests (PadicMeasuresIwasawaAlgebras:L1, PadicMeasuresIwasawaAlgebras:L3, PadicMeasuresIwasawaAlgebras:L3), zero closed stages.
All16 source findings and sourceVersions remain whole, with no new source finding or independent verdict. The external confirmed E54 boundary remains explicit.

The full family now has a unique actual integral numerator series after multiplication by the explicit doubled shifted denominator, and its integral arithmetic moment series maps to the exact denominator times the full admissible specialization. Next prove coefficientwise integral test congruences for these actual measure coefficients and arithmetic weight congruences with the full modulus p^(r−1)(p−1); record the denominator precision loss before any cancellation. The PMIA generic twist equivalence, completed-algebra comparison and general coefficient-field evaluator requests remain open. Smoothing independence beyond the canonical parameter, actual pole and ordinary-pseudomeasure exclusion, the tame-character family and full source extraction remain explicit work; PadicFamilies owns geometric realization.

## Reading and validation

The complete published159–160, including Theorem8.2 and Remark8.3, was read again with confirmed correction E54. The reviewed L0–L4 library audit was reread. The exact existing numerator, denominator, localized constant, full series and moment-map interfaces were read. The supplier character-integral algebra-hom node was read whole. Native PowerSeries coefficient multiplication, coefficient maps, map composition, map injectivity, IsFractionRing.injective and IsLocalization.mk′_spec′ were read with their ambient hypotheses at the pinned commit. No new baseline declaration is needed.

All 403 predecessor nodes, 429 baseline records, 16 findings, requests and sourceVersions remain whole. This checkpoint adds 9 nodes, 15 named suggested declarations and 16 typed examples. The indexed blueprint, four-file intake, whitespace, preservation, API/test parity and versioned-source checks pass. The graph has 587 reachable nodes, 2783 edges and 546 native leaves and is acyclic. Its stage request leaves are PadicMeasuresIwasawaAlgebras:L1, PadicMeasuresIwasawaAlgebras:L3, PadicMeasuresIwasawaAlgebras:L3. Each new route has no stage request leaf.

The full suggested module elaborates with zero errors and 1264 expected placeholder warnings. Source and artifact audits cover 3596 pinned Mathlib modules, 21 pinned Tau Ceti modules and the verified actual 332-node PMIA artifact. The current 369-node PMIA source preserves the compiled 332-node artifact's source in order; no new supplier declaration is called and no compilation against the current supplier revision is claimed. Source, olean and original compiler-log hashes were rechecked. Existing builds only were used.

One complete native constructor and seven complete lemmas check integral coefficient assembly, uniform clearing, the native away-fraction relation, uniqueness through an injective coefficient map, and compatibility with both specialization and integral coefficient-map composition. The probe elaborates against 1193 pinned Mathlib modules with zero errors, warnings or placeholders. General roadmap declarations remain unchecked.

Exact finite controls compare10920 cleared coefficients over168 prime/exponent pairs, checking their p-integrality,168 constant factorizations and168 first-coefficient factors. They include168 missing-factor2 controls,168 surviving prime-index coefficients,168 identity-parameter zero constants and one explicit dyadic precision-loss control. Exact rational Bernoulli recurrence and integer divisor sums. Positive cleared coefficients are computed independently by evaluating the convolution (2a δ_a−2δ_1) times the divisor Dirac sum; compare with the explicit denominator times the original coefficient. All168 prime/exponent pairs use65 coefficients, including0. P-integrality means the reduced rational denominator is prime to p. A finite dyadic precision control compares exponents3 and7, congruent modulo4, and records valuations before and after clearing. These are exact finite computations, not a proof of general congruences. The largest observed discrepancy is 0.

The initial57-input capture changed only the global source-issue aggregate and errata register. All16 own aggregate records were compared recursively and remain identical; all supplier, source-review and other inputs are unchanged. PMIA remains369 nodes preserving its compiled332-node interface. No new supplier declaration is called and no compilation of the current369-node source is claimed.

The publication guard at 2de163a3055031b4e7e99a65dc0407e1a5771837 checks 57 inputs, four
predecessor outputs, unchanged issue text, the original winning claim and
unclaimed review #390.
The initial57-input capture changed only the global source-issue aggregate and errata register. All16 own aggregate records were compared recursively and remain identical; all supplier, source-review and other inputs are unchanged. PMIA remains369 nodes preserving its compiled332-node interface. No new supplier declaration is called and no compilation of the current369-node source is claimed.
Suggested SHA256: `04d914758f7c61801c6bc12cd3a3f216849779cb9559b39e908f578064d3a584`.
Native probe SHA256: `8a68551dcb3bac9787ca0624d77ada5b303021ae13a980ed2ad131676d0b820f`.

One reusable worktree and one Lean process at a time were used. All compiler
processes have ended. Exactly the four authorized deliverables change.

Retain EisensteinClearingProbe.lean and its compiler/result/source audit, numerical
control code and results, the full suggested compiler/result/source audit,
artifact hashes, graph/preservation/API receipts, captured inputs and guard,
and exact submitted files with remote receipts. Retire scratch after opening
the PR. No private path or source PDF is published.
