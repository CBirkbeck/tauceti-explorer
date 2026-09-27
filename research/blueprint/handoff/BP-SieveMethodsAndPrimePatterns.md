# BP-SieveMethodsAndPrimePatterns — indexed residue-class checkpoint

Refs #1036. Author: Codex; session codex-a71f92. Claim comment 5853068109 was confirmed by bot comment 5853069002 before work. The whole issue was reread after confirmation. Snapshot base: 59dd715eedc9d5d13d8726e3cf80074779859caf.

## Delivered

Twelve additional SV.0 nodes preserve all eight inherited node objects. Two constructions reuse the existing BoundingSieve: finite weighted families with fiber-summed weights, and arbitrary excluded residue classes encoded by products of the bad primes. Eight new lemma nodes expose the finite-family sum laws, prime/divisor label equivalences, survival equivalence and residue sum/Euler laws. Two new theorem nodes handle a full local obstruction and transfer the finite Legendre error to the original indexed sample.

The complete packet has 20 nodes: two constructions, twelve lemmas and six theorems; fourteen API items; nine construction tests and twenty-one total Lean examples; five SV.0 planets; 41 exact baseline declarations; six gaps and no requests. Five nontrivial sum/Euler interfaces were promoted from construction API obligations to individual lemma nodes because downstream results consume them. All implementation statuses remain unchecked.

The indexed construction retains repeated values and weights. The residue constructor removes empty local classes from its prime product, keeping the pinned carrier's strict positive-density field valid. The existing prodPrimeFactors density is multiplicative, not completely multiplicative. Full local residue sets are handled outside that constructor by an explicit zero-survivor theorem. Negative sample integers, empty samples/prime sets and arbitrary signed approximate mass are supported. No claim of a small remainder, linear cutoff, CRT count or quantitative sieve bound is made.

SV.0 and SV.1 remain partial; SV.2–SV.5 remain not_read. This is a substantive continuation checkpoint, not completion of the roadmap. No inherited source finding or source-version object was changed.

## Sources and ownership

Read the whole inherited packet, reader, suggested file and handoff, all six reviewed stage-audit rows, campaign and atlas extract. Comparing 58 consulted paths with this session's earlier sieve checkpoint found 56 byte-identical files and two known absences; matching link maps were unchanged. The complete earlier readings of RS-07/report/review, AUDIT-07 review, upstream EffectiveBounds/ArithmeticDirichletSeries examples, routed Bennett–Siksek item 45 and supplier/consumer packets therefore remain applicable. AN.8 and an integrated sieve decomposition were absent.

Freshly reread Kedlaya Chapter 11's weighted inclusion-exclusion proof and Definition 11.6, and Heath-Brown arXiv math/0209360v1 pp.1–4. The fresh Kedlaya download has the identical recorded SHA-256. The preceding checkpoint read the complete live Chapter 11 and Heath-Brown through p.8, the statement of Lemma 2.1, not its proof. No broader reading is claimed. The historical Kedlaya edition and Heath-Brown's Bonner publication were not equated with the acquired sources.

The eight version-specific, unreviewed source findings remain unchanged. The finite-family constructor addresses the multiplicity loss identified in the Goldbach image example. Prime-product labels do not repair source finding E7: the sample integer 33 has label 1155 for bad residues 0 and −2 at primes 3,5,7,11. E8's leading-constant issue also remains an analytic gap.

Reread the pinned BoundingSieve carrier and actual statements for all sixteen added baseline references: fiber products and the generated additive fiber-sum companion, squarefree prime products, prime factors and coprimality, finite-cardinality/full-set APIs, ZMod cardinality and prodPrimeFactors. The Tau Ceti prime-product file was read completely; its needed ingredients are already available in Mathlib. Exact-name and broader library/roadmap searches found no existing sieve-specific indexed/residue adapters. Generic finite fiber sums are reused, not replanned.

Existing upper-sieve coefficients and Selberg diagonalization remain imported. RS-07's SV.2-to-AN.3 ownership direction remains intact. The finite bridge does not supply ArithmeticStatistics' quadratic-symbol large sieve or FiniteFieldsAndCharacterSums' polynomial Farey large sieve.

## Validation

- Suggested file: Lean 4.34.0-rc2, 20 main signatures, 14 API signatures and 21 examples; exactly 55 required proof-placeholder warnings and no others. All 1,426 reached Mathlib source files byte-matched the pin.
- New scratch checks: both constructors implemented; nine general bridge statements, one direct squarefree-product baseline application and all eleven new examples proved with no placeholders or warnings. All 8,482 tactic-environment Mathlib source files byte-matched the pin.
- Inherited scratch checks rerun: all eight finite statements, one Möbius-divisor specialization and five examples; no placeholders or warnings. Scratch proofs are not submitted and do not change unchecked status.
- New exact rational regressions: 1,485 local residue systems, 13,365 finite populations (9,216 proper and 4,149 full-obstruction cases), 53,460 label checks, 89,505 divisor/fiber checks and 36,864 Legendre-error checks. Negative/repeated samples, rational weights and negative, zero or non-normalized approximate masses are included.
- Inherited regressions rerun: 1,280 cases each for weighted divisor interchange, Legendre, Euler/error, lower coefficients/main-error and first Bonferroni; 9,200 coefficient-cutoff cases; 1,542 strict-cutoff prime-count cases and the explicit source-example witnesses.
- Official blueprint checker with pinned declaration index: zero errors and warnings.
- Source-issue/version checker on an in-memory errata-v1 envelope: zero errors.
- Only the issue's four deliverables are submitted; no source copies, private paths or scratch proofs.

## Resume

The generic finite-family/residue representation is now decomposed. Its remaining application layer needs exact polynomial root sets, CRT counts and interval discrepancy bounds. Derive those from their intended uses rather than add a second sieve carrier or a generic pushforward abstraction.

Next read and decompose Kedlaya Chapter 11 Lemmas 11.5, 11.7, 11.8, Theorem 11.9 and the justified Brun application in Theorem 11.11: dimension with exact uniform constants, Rankin, divisor-tail and quantitative sieve estimates. Check the hypotheses exposed by E7–E8. The new labels have no linear bound by the sample cutoff. Resolve AN.0 analytic suppliers at their actual statements and add requests only for specified consuming nodes. A coefficient-support parameter is not a distribution theorem.

SV.1 needs the remaining Selberg proof, optimizer and estimates beyond baseline diagonalization, plus Brun/fundamental-lemma sources. SV.2 needs the original Bennett–Siksek proof, large-sieve/duality/Vaughan sources and the exact quadratic-symbol and polynomial Farey consumer statements. SV.3 needs full Bombieri–Vinogradov quantifiers and AN.3 suppliers. SV.4 needs Maynard's original proof. SV.5 needs separate original beta/Chen/affine-sieve sources and their distinct hypotheses. The packet's coverage and gaps are the detailed checklist.
