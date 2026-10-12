# BP-ClassicalArithmeticCompletion~3 — revision handoff

Claude — claude-zb226n, 2026-10-12. Job [#8899](https://github.com/CBirkbeck/tauceti-explorer/issues/8899); claim comment 6125203557, confirmed by bot comment 6125205931. Base commit `4d725cf9e`. This is revision round 3, the last round allowed. It completes the budgeted pass again. It is not a checkpoint, and it does not claim that the roadmap is mathematically closed.

The independent review [REV-ClassicalArithmeticCompletion~2](../reviews/REV-ClassicalArithmeticCompletion~2.md) (Codex, codex-tkotD7) did not accept the round-2 plan. It withheld acceptance for one reason: the reader document still disagreed with the corrected packet. In particular, the reader stated that integral closures are orders without requiring an integrally closed base, and it treated separability as if it gave a nondegenerate regular trace. That review object is left in place for the next reviewer. This session wrote neither the plan nor either review.

The packet already had 333 nodes, above the 300-node budget, so no node was added. All 333 node ids are kept.

## What this round changed

**The review's corrections.** I re-derived all 23 node corrections of the review and kept them:

- the cyclotomic power-basis and unit-classification inputs of the two primary-element nodes;
- termwise transport and `gaussSum_mulShift_eq` in place of FF.1 in the three cubic nodes;
- the three CA.1-owned inputs of Eisenstein reciprocity;
- `Polynomial.hasseDeriv_mul` in the exponential-polynomial node;
- the direct automaton for eventually periodic sequences, including base one;
- the Thue–Morse nonperiodicity argument. An odd eventual period forces the sequence to be eventually constant, which the values at 2^j and 3·2^j contradict;
- determinant-one coprimality of Stern–Brocot mediants, including the sentinel (1, 0);
- Stein's p. 20 locators, and Micciancio as the source for Hermite uniqueness;
- the characteristic-two norm argument in the 2-power Capelli case;
- the ⌊k/2⌋ + l − v₇(k) valuation bound, for k ≥ 2, in the Ramanujan–Nagell binomial step;
- the intrinsic CA.5 certificate criteria;
- the fundamental theorem of symmetric polynomials, and the subset-product (exterior-power) polynomial;
- the dyadic prime count as a CA.6-owned input;
- the Dobrowolski constant chain. With M = ⌈7L⌉ we get 20 ≤ M ≤ d − 1 and log M ≥ 6u/7 + 1, and 26·(15/2)³ = 10968.75 < 11700;
- the universal-coefficient proof of the root-power polynomial, with its ZMod 4 test;
- for orders: an integrally closed base for integral closures, and an explicit nondegenerate regular-trace premise for the order criterion and for maximal orders. The regular trace of M_p(F) vanishes in characteristic p.

The nine declarations the review added were reopened at the pinned Mathlib, and each exists with the statement the packet records.

**Reader synchronisation.** The reader is now regenerated from the packet. The renderer used reproduces the round-2 reader byte for byte from the round-2 packet, so every unchanged section keeps its exact text. Only the following changed:

- the 23 corrected sections and the sections whose gaps changed;
- the layer introductions and the closing sections, which had named FiniteFieldsAndCharacterSums as the owner of character normalisation and gave stale counts;
- three new kinds of material that the old reader omitted: the Tau Ceti roadmap layers each node uses, a section listing the 40 requests grouped by supplier, and the layer-level and packet-level gaps.

I compared the two files with whitespace normalised. Every node title, statement, hypothesis, proof step, acceptance check, API item, unit test, source locator and match, prerequisite, gap detail and response, coverage item and request appears in the reader. The two contradictions the review named are gone; the CA.7 introduction now states both premises.

**Upstream tier rule.** `research/blueprint/upstream/CaraianiNewton.md` places this roadmap in tier 5. It lists four citations outside the 94 roadmaps: KTheoryLowDegrees, K2SymbolsBrauer, QSeriesPartitionsAndMockModularForms and ArithmeticDynamics. A tier-5 plan may cite only Mathlib, Tau Ceti, Tau Ceti roadmaps, its bundle and lower tiers, so the notions these citations supplied now belong to this roadmap:

| Formerly cited | Now owned by | What | Nodes | Recorded as |
| --- | --- | --- | --- | --- |
| K2SymbolsBrauer:T.7 | CA.1 | the degree-n norm-residue symbol (a, b)_v = Art_v(a)(β)/β, with root independence, bimultiplicativity, Steinberg relation, skew-symmetry, norm criterion, archimedean values, and comparison with Class Field Theory Layer 5's `localSymbol (kummerCupPairing ζ)` | tame-hilbert-symbol-formula, hilbert-product-formula-of-degree-n, power-reciprocity-law | gap "The degree-n norm-residue symbol in the Artin orientation is a CA.1-owned input" |
| QSeriesPartitionsAndMockModularForms:QM.0 | CA.4 | the Jacobi triple product identity in ℤ⟦x⟧ and the four specialisations Hirschhorn uses | hirschhorn-sixth-power-identity, hirschhorn-logarithmic-derivative-identity, theta-fourth-power-lambert-series | gap "The Jacobi triple product identity and its specialisations are a CA.4-owned input" |
| ArithmeticDynamics:DY.1 | CA.6 | the canonical height of the power map, now defined as Tate's limit inside the node, which proves that the limit exists and equals h | canonical-height-power-map | restated node; no gap needed |
| KTheoryLowDegrees:Z.1, Z.4/rank-pic-equivalence | CA.7 | stable equality in SplitK0 of finitely generated projective modules, extension and restriction of scalars, and Steinitz's theorem for Dedekind domains | locally-free-class-group | gap "Stable equality, scalar change and the Steinitz comparison for K₀ of an order are CA.7-owned inputs" |

The four requests to those roadmaps are removed. The roadmaps that formerly supplied these notions should import them from here: K2SymbolsBrauer T.7, QSeriesPartitionsAndMockModularForms QM.0, ArithmeticDynamics DY.1, and KTheoryLowDegrees Z.1 and Z.4. The review's earlier moves stand: FF.1 → CA.1 and CA.4, AN.2 → CA.6, and ComputationalNumberTheory consuming the CA.5 criteria.

I checked suppliers against the read-only TauCetiRoadmap checkout. ClassFieldTheory Layer 5 owns the cohomological local Hilbert pairing (bilinearity, Steinberg relation, antisymmetry and the norm-group criterion), and its Layer 14 says that higher power reciprocity laws are follow-on work. The Artin-orientation symbol and its comparison with that pairing therefore stay with CA.1. Mathlib has the pentagonal number theorem for power series but not the triple product. Tau Ceti has `SplitK0`, `SplitK0.map` and `finiteProjectiveModules`, but no stable-isomorphism criterion.

**Other fixes:**

- The inherited review gap on Eisenstein reciprocity still said two inputs were missing; it now says three.
- The coverage notes of CA.1, CA.4 and CA.6 no longer name FF.1, K2SymbolsBrauer or DY.1 as suppliers.
- CA.1, CA.4 and CA.7 have new `remaining` items for the moved notions.
- `tauceti:TauCeti.SplitK0.map` was added to the baseline (line 275 of `TauCeti/CategoryTheory/GrothendieckGroup/Split.lean`).
- The suggested file has the missing unit test `zsqrtdToRingOfIntegers_degree_one_excluded`.
- The order theorems' trace-pairing binder is renamed from `hsep` to `htrace`, so it no longer suggests separability.
- The file's comments no longer name the removed suppliers.
- The packet's `revisionAudit` records this round; round 2's record is in `revisionAuditHistory`.

## Coverage and where to resume

| Layer | Targets | Status | Inherited review findings |
| --- | ---: | --- | ---: |
| CA.0 | 1 | closed | 0 |
| CA.1 | 34 | partial | 12 |
| CA.2 | 61 | partial | 20 |
| CA.3 | 41 | partial | 22 |
| CA.4 | 77 | partial | 45 |
| CA.5 | 19 | partial | 16 |
| CA.6 | 45 | partial | 32 |
| CA.7 | 55 | partial | 49 |

The packet has 220 gaps (217 inherited and 3 new) and 40 requests (44 inherited, minus the 4 to roadmaps outside the 94). Each stage's `remaining` list and the reader's "Continuation frontier" sections give the exact next items. The new ones are:

- **CA.1:** a definition node for the degree-n norm-residue symbol, built on Tau Ceti's local Artin map.
- **CA.4:** the Jacobi triple product and its specialisations. Read a public proof first.
- **CA.7:** the K₀ bridges of the locally free class group.

Each stage left partial becomes a follow-up job once a review accepts the plan. The inherited items remain as round 2 described them:

- **CA.1:** quartic reciprocity, the three Eisenstein inputs, the explicit laws above n, the Koymans–Milovic number-field law, and the Calegari–Geraghty zero count.
- **CA.2:** the elliptic divisibility sequence source, the Lawrence–Sawin Eulerian numbers, and the Yu binomial congruences.
- **CA.3:** Int(𝓞_K), the Mignotte bound, and Smith's Lemma 2.10.
- **CA.4:** the Chen, Gamburd–Magee–Ronan, Ghosh–Sarnak and Koymans–Pagano routes.
- **CA.5:** the narrow-class and unit-module comparisons.
- **CA.6:** the Smyth analytic core, the Dimitrov potential theory, the Smith trace constants, the stronger BKK bounds, and the dyadic prime count.
- **CA.7:** the Fröhlich–Taylor theorems, Jacobinski cancellation, and Reiner's theorem 27.4.

## Validation

- `TAUCETI_BASELINE=<worker baseline> python3 scripts/check_blueprint.py research/blueprint/packets/ClassicalArithmeticCompletion.json`: 0 errors, 0 warnings. The checker reports 333 nodes, 502 API items, 286 unit tests, 42 planets, 619 baseline declarations, 220 gaps and 40 requests.
- Reader/packet agreement: no packet string is missing from the reader after whitespace normalisation. The reader contains no Lean code, no `sorry` and no local paths.
- Every API item and unit-test name in the packet occurs in the suggested file.
- `lean-check research/blueprint/suggested/ClassicalArithmeticCompletion.lean`: exit 0 at Mathlib 082e2d3 in the shared build. There are 969 warnings, all for admitted proofs (`sorry`), and no other diagnostics. The owner-dependent commented interfaces (the locally free class group and its consumers, and the degree-n Hilbert symbol theorems) are not elaborated.
- `git diff --check` passes.

## Sources

No new source passage was read in this round. The mathematical checks re-derived the review's corrections from the packet text. Supplier checks read the pinned Mathlib and Tau Ceti sources, the current Tau Ceti library, and the read-only TauCetiRoadmap checkout (ClassFieldTheory README Layers 5 and 14; GlobalNumberFields). The packet's source records, source findings and their verdicts are unchanged: 88 confirmed, and 2 (E406, E503) that the second review could not reconfirm. No restricted book was used.
