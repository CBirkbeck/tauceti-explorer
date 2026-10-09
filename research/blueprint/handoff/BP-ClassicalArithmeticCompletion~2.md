# BP-ClassicalArithmeticCompletion~2 — revision handoff

Codex — codex-y0ztZt, 2026-10-09. Job [#6513](https://github.com/CBirkbeck/tauceti-explorer/issues/6513); claim comment 6088598158, confirmed by bot comment 6088600350. Base commit: `ad273a796`. This is the completed **budgeted revision pass**, not a checkpoint or a claim that the roadmap has mathematical closure.

The inherited packet has 333 nodes, exceeding the issue's 300-node budget. Its explicit rule therefore requires no new nodes and an updated packet, reader, suggested file and handoff with status `complete`. All 333 IDs are retained. The current WORKERS/PROTOCOL target-level granularity governs this pass; smaller proof steps and separate signatures stay with their target. The independent review by codex-rtOQ9t, [REV-ClassicalArithmeticCompletion](../reviews/REV-ClassicalArithmeticCompletion.md), is unchanged, including its `needs_changes` verdict. This worker did not review its own revision.

## What changed

The packet and reader now agree on every target's statement, hypotheses, source locators, API, tests and frontier. The 38 inherited reviewer corrections were retained. Every one of the 196 unresolved review findings has a `revisionResponse` and appears in its layer's `reviewFrontier`; no source or supplier obligation is silently declared solved. The 20 inherited gaps remain alongside them, for 216 gap records. The 90 inherited source findings and their independent verdicts are unchanged: 89 confirmed and E406 rejected for insufficient accessible evidence. No new source-finding verdict was issued here.

The integral-square-root argument now uses the normalized U′ and V′ throughout, including the odd constant shift. The tame/trace criterion now separates the field case, supplied by the pinned `Algebra.trace_surjective`, from the prime-ideal argument over a nonfield Dedekind domain. Noether and locally free class-group statements repeat that nonfield hypothesis. The greedy Egyptian-fraction proof sketch follows the native fuel recursion and numerator decrease.

The suggested file adds 17 signatures and strengthens three existing signatures within 16 existing nodes. The packet's `revisionAudit.signatureChanges` records the exact mapping. These cover finite-field root counts including exponent zero; odd/even four-square formulas; negative-Pell positivity and reduction at primes dividing d; Apéry decomposition and finite generation; Frobenius reflection and counting with F(ℕ)=−1; Sylvester sums and greedy terms; Vieta gcd preservation; relation-determinant completeness; Mahler measure under inversion; the constant coefficient in Smyth's quotient; class-group **and** regulator completeness in the analytic certificate; the integral Fermat consequence; divergence outside the Bernoulli and zigzag convergence discs; and a nonzero real vector in local solubility.

Owner-dependent interfaces remain pending. In particular, the commented K₀ adapters were not counted as executable declarations or as elaborated signatures. No replacement `RingK0` carrier was invented. `implementationStatus` remains `unchecked`.

## Coverage and where to resume

| Layer | Targets | Status | Unresolved review targets |
| --- | ---: | --- | ---: |
| CA.0 | 1 | closed | 0 |
| CA.1 | 34 | partial | 12 |
| CA.2 | 61 | partial | 20 |
| CA.3 | 41 | partial | 22 |
| CA.4 | 77 | partial | 45 |
| CA.5 | 19 | partial | 16 |
| CA.6 | 45 | partial | 32 |
| CA.7 | 55 | partial | 49 |

CA.0 retains its independently reviewed planning closure; it was not freshly audited in full. For the other layers, resume the exact IDs in `coverage[].reviewFrontier`, their `gaps` and the reader's continuation sections. A checked signature establishes a usable contract, not its proof or the sufficiency of every prerequisite.

Concrete frontiers include the number-field quadratic law with dyadic/infinite corrections and relative norms, the projective-zero count for binary quadratic forms, quartic reciprocity with defined primary elements, the missing inputs of Eisenstein reciprocity, and the analytic/automatic-series suppliers in CA.2. CA.3 still needs general rectangular Smith and Hermite algorithms and certificates; square nonsingular Smith existence is already supplied by Tau Ceti. The larger CA.4 Diophantine, CA.5 certified number-field and CA.6 lower-bound/analytic proof chains are not closed by the new contracts. CA.7 needs actual finite-projective class-map and scalar-extension adapters, local integral action/trace interfaces, and the Fröhlich/Taylor inputs rather than undefined replacement carriers. The packet retains all 45 precisely scoped ownership requests. No owner was moved during this revision.

Do not reintroduce structural splits merely to match the older lemma-level review request. Do resolve each substantive proof, source and supplier obligation. A successor should obtain sources at the full hypotheses before claiming closure, and preserve the separation between source-supported results and stronger adapters derived here. Damer's HNF source was not available to the independent reviewer; E406's rejected verdict remains evidence insufficiency, not confirmation of the alleged source error.

## Sources and existing work

Fresh reading was limited to the selected passages below, with complete proofs where the receipt says so. The packet's `revisionAudit.freshSourceReading` stores the actual public URLs, SHA256 hashes, dates and reading scope. It does not claim a reread of all 79 sources or all baseline declarations. Source statements are written in our own words; no source excerpts or extracted source files are submitted.

| Source | Fresh passage |
| --- | --- |
| Dimitrov, arXiv:1912.12545v1 | PDF/printed pp.4–5; root-product congruence, Proposition 2.2 and Lemma 2.3 with proofs |
| Conrad, *Infinite descent* | pp.7–8; Theorem 3.10, both parity cases and integral absolute-value reduction |
| Conrad, *Pell's equation I* | p.11; Lemmas 7.3–7.4 with proofs |
| Wuthrich, Gaussian-integer notes | p.7; Theorem 5.14 odd/even formulas, stated without proof |
| Assi–García-Sánchez, arXiv:1411.6093v1 | pp.4,6; Proposition 6, Corollary 7 and Lemma 14 with proofs |
| Biasse–Fieker | PDF pp.15–16 / printed pp.399–400; §4.3 certificate and accuracy bounds |
| Cahen–Chabert | PDF p.6 / printed p.315; Proposition 6 and Theorem 7, factorization-length example |
| Chun, Egyptian fractions | pp.1–3; §§1.1,1.3.1,1.4, proper-fraction greedy termination and 5/31 |
| Christol et al. | PDF pp.3–4 / printed pp.402–403; §2 conventions and Morse-series example |
| Johnston, Galois-module notes | pp.2,6,16–17,19,27–28; Remark 1.5, Definition 1.6, Example 3.16, Theorem 9.5 with its split proof, Corollary 9.10 and §§15.1–15.3 |
| Voight, public author edition | PDF pp.338,346,348 / printed pp.318,326,328; 20.2.6–20.2.8, Proposition 20.7.4 with proof, Remark 20.7.13 |

No restricted book was used. Other inherited reading and source-version records remain attributed to their original worker or reviewer. Missing source and stronger-generalization requirements remain explicit in each target's gap record.

Read-only upstream checked at TauCetiRoadmap `df8020193b157c047bcaa0381c3f0d6c3f605dcb` and Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. The nine roadmaps newer than the atlas snapshot were searched, with nearby IntegralLattices and NumberFieldArithmetic documents read. Current Smith normal form already has square nonsingular existence, uniqueness and newer first-invariant/2×2 APIs. Current CartanMap/Basic already has finite-projective modules and categorical exact K₀; the missing task is the order-lattice adapter. The monoid-algebra projective-trace theorem is character-trace vanishing on p-singular elements, not the integral norm-image criterion required here. Existing quadratic-lattice, local reciprocity and field normal-basis theories remain imports.

## Validation

The packet checker passed with **0 errors and 0 warnings**, using the pinned declaration index. The source-issue validator passed. Consistency checks preserved all node IDs, the independent review and all source verdicts, checked the reader against all 333 targets, and checked all 196 review-frontier dispositions. Every definition has at least three planned tests. Counts: 121 lemmas, 127 theorems, 27 constructions, 45 definitions, six comparisons and seven applications; 502 API items, 284 tests, 42 planets, 609 baseline declarations, 216 gaps and 45 requests.

`lean-check research/blueprint/suggested/ClassicalArithmeticCompletion.lean` completed with exit 0 at Mathlib `082e2d3` and Tau Ceti `f790474`. Its only diagnostics were **966 `declaration uses sorry` warnings**. The compiled file's SHA256 is `bf8178c3f0115e784064b837b63c136a8bcc92e74ca6302a46735bc37771aa3f` (302566 bytes). Pending interfaces in comments were excluded from this compilation claim. No library build, update, cache download or language server was used.

Finite diagnostic checks covered 828 finite-field root cases, 102 integral constant shifts, 3993 Vieta gcd cases, 1830 proper greedy fractions, four boundary counterexamples, 27 negative-Pell solutions and 500 odd/even divisor-sum specializations. These check the revised contracts on small cases; they do not prove the proposed theorems, including the four-square representation count. The scratch source files and logs are disposable; all continuation evidence needed by the next worker is in the packet, reader, independent review and this note.
