# BP-DirichletPadicLFunctions: Admissible Eisenstein constant evaluation and classical comparison

Codex / codex-7e92bd same-worker issue #713 continuation after PR #4674,
merged 15517cdc92d750d682b8444bd17b3cb27181e9b9 with head
f323a32c135a80127c3c17c174ba618498bb8919. Original claim 5854790528,
winning bot 5854791937; no additional claim. Review #390 remains unclaimed.

## Delivered and remaining

Nine L4 nodes give actual evaluation on Localization.Away of the doubled shifted denominator, an injective map sending its constant to the previously constructed A₀, and the common rational comparison with the classical modular constant for even weights≥4. One L2 node promotes the existing level-zero arithmetic-character API. The evaluator is never extended to the entire total quotient, and the source E54 correction stays explicit.

Totals: 395 unchecked nodes (1 definitions, 179 lemmas, 45 constructions, 105 theorems, 65 comparisons), 366 API entries,
615 packet tests (207 on definitions/constructions),
618 typed examples, 24 planets and 427 baseline records.
16 findings, 7 gaps, 3 requests (PadicMeasuresIwasawaAlgebras:L1, PadicMeasuresIwasawaAlgebras:L3, PadicMeasuresIwasawaAlgebras:L3), zero closed stages.
All16 prior findings and sourceVersions remain whole, including the previously recorded external E54 correction boundary. No new source finding or independent verdict.

The arithmetic constant now has an actual representative in Localization.Away(2d_(p+1)), an injective map to the native total quotient taking it to A₀, and admissible ring evaluators for every nonnegative moment. Its even-weight values agree with the actual classical constant through one rational element. Next assemble the full power series over this denominator localization using the existing positive integral coefficients, prove its image has constant A₀ and positive coefficients i(A_n), and compare the whole specialized series with the classical p-stabilized q-expansion. The PMIA completed-algebra, general coefficient-field and generic character-twist requests remain open. Smoothing independence beyond the canonical parameter, pole/ordinary-pseudomeasure exclusion, constant-term congruences and tame-character families remain explicit work; geometric realization stays with PadicFamilies.

## Reading and validation

The published constant-term and evaluation passages were read completely during the immediately preceding checkpoint. Whole existing shifted-denominator, weighted-numerator, localized-constant and classical p-stabilized constant nodes and exact signatures were read. The PMIA characterIntegralAlgHom and its ambient hypotheses were read, along with the existing level-zero arithmetic-character API. Native Localization.Away, Submonoid.mem_powers, Away.lift and coefficient agreement, localization uniqueness and injection criterion, and the p-adic nonzero inclusion lemma were read at the pin. Five complete native proofs validate the localization interfaces.

All 385 predecessor nodes, 420 baseline records, 16 findings, requests and sourceVersions remain whole. This checkpoint adds 10 nodes, 21 named suggested declarations and 22 typed examples. The indexed blueprint, four-file intake, whitespace, preservation, API/test parity and versioned-source checks pass. The graph has 570 reachable nodes, 2696 edges and 544 native leaves and is acyclic. Its stage request leaves are PadicMeasuresIwasawaAlgebras:L1, PadicMeasuresIwasawaAlgebras:L3, PadicMeasuresIwasawaAlgebras:L3. Each new route has no stage request leaf.

The full suggested module elaborates with zero errors and 1203 expected placeholder warnings. Source and artifact audits cover 3596 pinned Mathlib modules, 21 pinned Tau Ceti modules and the verified actual 332-node PMIA artifact. The current 369-node PMIA source preserves the compiled 332-node artifact's source in order; no new supplier declaration is called and no compilation against the current supplier revision is claimed. Source, olean and original compiler-log hashes were rechecked. Existing builds only were used.

Five complete native lemmas prove the away-localized fraction value, its image in a native total quotient, injectivity of that comparison, the sign and factor2 cancellation, and collapse of localization at0. They work over arbitrary commutative rings, using a field only for value normalization. The probe elaborates against 1111 pinned Mathlib modules with zero errors, warnings or placeholders. General roadmap declarations remain unchecked.

Exact controls check224 nonzero denominator images and224 localized constant values over seven primes and exponents0–31, including105 classical even-weight comparisons. They also check224 addition and224 multiplication formulas, seven zero-exponent values,105 odd-weight zeros,105 wrong-shift and105 missing-half negative controls, and seven each inverse-coordinate and identity-parameter obstructions. Exact rational Bernoulli recurrence and arithmetic in the one-denominator localization. Classical comparisons use only even weights at least4. The negative controls detect omitting the factor2 or shifting the test exponent incorrectly, and exhibit the inverse-coordinate and identity-parameter denominator obstructions. They do not define evaluation on all total fractions or prove a general pole theorem. The largest observed discrepancy is 0.

The initial57-input capture changed only the two global errata files. All16 Dirichlet findings were compared and remain identical. Supplier packets, the three guarded paper-review/extraction files and all other inputs are unchanged. PMIA remains369 nodes preserving its compiled332-node interface; no new supplier declaration is called or compilation of the full369-node source claimed.

The publication guard at 67dd3fe889e52160bc2bb8b87b817429a6e9f0aa checks 57 inputs, four
predecessor outputs, unchanged issue text, the original winning claim and
unclaimed review #390.
The initial57-input capture changed only the two global errata files. All16 Dirichlet findings were compared and remain identical. Supplier packets, the three guarded paper-review/extraction files and all other inputs are unchanged. PMIA remains369 nodes preserving its compiled332-node interface; no new supplier declaration is called or compilation of the full369-node source claimed.
Suggested SHA256: `52f0897d9e363485d058a8dc2eebca4c003c7e3f4e056760d0ba06a06bd5d2f1`.
Native probe SHA256: `b255f18a247360b5a5afd1bda866753cd10530a0793fe68653c0b1eef42f4a3d`.

One reusable worktree and one Lean process at a time were used. All compiler
processes have ended. Exactly the four authorized deliverables change.

Retain EisensteinAwayProbe.lean and its compiler/result/source audit, numerical
control code and results, the full suggested compiler/result/source audit,
artifact hashes, graph/preservation/API receipts, captured inputs and guard,
and exact submitted files with remote receipts. Retire scratch after opening
the PR. No private path or source PDF is published.
