# REV-ClassicalArithmeticCompletion~3

Independent review of revision round 3 of `BP-ClassicalArithmeticCompletion`. Done by Claude, session `claude-W1NvTw`, issue [#8898](https://github.com/CBirkbeck/tauceti-explorer/issues/8898), on 2026-10-12. This session wrote neither the plan nor any earlier review of it.

**Verdict: accepted.** The packet was corrected in place, and so were its reader and its suggested Lean file. The review object is in the packet, with a receipt for every node and every baseline declaration. REV~2's review object has moved to `reviewHistory`.

## The previous review's blocker

REV~2 withheld acceptance for one reason: the reader contradicted the corrected packet on orders in CA.7. That is fixed.

- An integral closure is an order only over an integrally closed base.
- The order criterion and the existence of maximal orders take an explicit nondegenerate regular-trace pairing. Separability is not enough: M_p(F) in characteristic p is separable, but its regular trace vanishes.

The reader now agrees with the packet node by node. Each node's title, statement, hypotheses, API, unit tests, acceptance checks, proof sketch, Tau Ceti layers, prerequisites and source lines are re-rendered from the packet. I first confirmed that the renderer reproduces the committed reader byte for byte from the committed packet. A string check finds every node, gap, coverage and request text of the packet in the reader. The only packet strings it does not contain are the gap titles, which the reader leaves out by design.

All 23 node corrections of REV~2 were re-checked at their sources. All are kept, and several are refined below. The two source findings REV~2 could not reconfirm are now confirmed:

- **E406** was read in an archived copy of Damer's survey; the ePrint URL now returns HTTP 403.
- **E503** was read on a scan of Ankeny's published paper.

## Scope and method

The review is at target level (PROTOCOL §2, `detail.json`). I checked every one of the 333 nodes in four ways:

- against its source at the locator;
- against the pinned Mathlib 082e2d3 and Tau Ceti f790474 sources, for every cited declaration;
- for closure, the truth of its statements and tests, and API coverage;
- against its signatures in the suggested file.

Every one of the 79 sources was read afresh. The 82 new `sourceVersions` entries give the URL, the hash where one was obtained, and the pages read. Small cases were computed for every unit test and acceptance item that has one. Among them:

- the class groups of ℚ(√−14) and ℚ(√−30);
- the Ramanujan–Nagell solutions and their classes modulo 42;
- Lucas strong divisibility for all coprime |P|, |Q| ≤ 7;
- the Lehmer and plastic-number data;
- the Dobrowolski constant chain;
- cubic reciprocity on 6,246 prime pairs;
- the Markoff counts over 𝔽_p.

The per-layer checks were done by assistant instances of this session, each working from a common brief, one layer group at a time. I checked every proposed correction before applying it, and checked several of the strongest claims independently, for example the counterexample to Berrevoets's Example 4.10 and the privacy of a Mathlib lemma. The suggested file was compiled after each batch of corrections.

## Counts

| Layer | Nodes | Verified | Corrected |
| --- | ---: | ---: | ---: |
| CA.0 | 1 | 1 | 0 |
| CA.1 | 34 | 22 | 12 |
| CA.2 | 61 | 32 | 29 |
| CA.3 | 41 | 25 | 16 |
| CA.4 | 77 | 49 | 28 |
| CA.5 | 19 | 11 | 8 |
| CA.6 | 45 | 25 | 20 |
| CA.7 | 55 | 26 | 29 |
| Total | 333 | 191 | 142 |

No node was added, and none is unverifiable.

- **Baseline:** 677 declarations. These are the 619 inherited ones, plus 64 added for steps that used a named library fact without listing it, minus 6 near misses removed. All 677 exist at their cited modules. Eleven `provides` texts were corrected.
- **Source findings:** 98 in all, all confirmed: the 90 inherited ones and 8 new.
- **Gaps:** 220. Of these, 24 per-node review gaps now carry a third-review disposition: most are resolved locally, a few are clarified.
- **Requests:** 41. One is new: DT.2, for the closed form of linear recurrences.

## Corrections of substance

**False or misleading statements and examples**

- **CA.6/dobrowolski-auxiliary-polynomial.** The acceptance item copied Berrevoets's Example 4.10, and the example is wrong. (Φ₆L)²⁰ has largest coefficient 1471288954441, which exceeds the bound 4000²·M(τ₁₀)⁴⁰ ≈ 1.058·10¹⁰. The item is replaced by a correct small example (φ, M = 3, N = 13), and the old one is kept as a non-example. Recorded as new finding E720.
- **CA.1/primitive-characters-agreeing-at-almost-all-primes-are-equal.** χ₄ and χ₈′ agree at primes ≡ 1, 7 (mod 8), not at primes ≡ 1, 3.
- **CA.1/power-residue-euler-criterion.** The cited example did not show that the coprimality hypothesis is needed. It is replaced by n = 6 at (2) in ℚ(ζ₃).
- **CA.2/linear-recurrence-of-a-monic-polynomial** and **closed-form-of-a-complex-linear-recurrence.** With 0⁰ = 1, the solution δ₀ of `ofMonic X` does have a closed form. The first failing case is `ofMonic X²` with δ₁.
- **CA.2/mediant.** The example given for "not the arithmetic mean" is the arithmetic mean.
- **CA.2/farey-sequence.** The cardinality formula needs n ≥ 1. The Ladies' Diary attribution has no source in the packet and is removed.
- **CA.3/dumas-theorem.** Barbeau's printed slope lists count edges, not widths. The acceptance item now uses widths.
- **CA.6/canonical-height-power-map.** log M(α)/deg α is meaningful only for algebraic α. The claimed identification with preperiodic points now has a proof step.

**Closure and structure**

- **Ghosh–Sarnak nodes (CA.4).** CA.4/markoff-positive-root-orbits and CA.4/markoff-exceptional-class-number-lower-bound listed their own stage as a prerequisite, which is a cycle. They now cite the existing finer nodes, and the level-k carriers stay a recorded gap.
- **Euler numbers (CA.2).** CA.2/euler-zigzag-numbers proved an API item through CA.2/secant-plus-tangent-formal-identity, which depends on it. The Bernoulli computation moves to the theorem.
- **Normal integral bases (CA.7).** CA.7/trace-of-normal-integral-basis-generator now states Johnston's Proposition 6.1 with its local case, in Galois-group form. This gives CA.7/local-noether the trace step that REV~1 found missing.
- **Noether's theorem (CA.7).** CA.7/noether-theorem gains its missing prerequisite, CA.7/projective-of-tame.
- **Capelli (CA.3).** CA.3/capelli-two-power-case marks the two steps that need characteristic ≠ 2. Characteristic 2 is settled by the norm argument of the previous step.
- **Root-power polynomial (CA.6).** CA.6/root-power-polynomial now proves P_m = (minpoly α^m)^[K(α):K(α^m)] by a block-diagonal characteristic-polynomial argument that works in every characteristic. Counting conjugates does not work for inseparable α.
- **Galois module and orders (CA.7).** CA.7/ring-of-integers-as-group-ring-module now needs G finite. CA.7/associated-order states the tame criterion only for number fields and local fields.
- **Fermat descent (CA.4).** The descent steps now justify the pairwise coprimality the induction needs.

**Library citations**

- `exists_linearIndependent_algEquiv_apply_of_finite` is private at the pin: the file is a `module` file and the lemma has no `public` modifier. It is replaced by the public `exists_linearIndependent_algEquiv_apply`.
- Removed as near misses that no node now uses:
  - `AdicCompletion.flat_of_isNoetherian`, which concerns the wrong completion;
  - `Algebra.discr_eq_det_embeddingsMatrixReindex_pow_two`, which has a hidden algebraically closed target;
  - `trace_eq_sum_roots`, which is the wrong sum;
  - Tau Ceti's `NumberField.discr_eq_of_integralBasis`, which is ℚ-valued;
  - the isolated-zeros dichotomy `AnalyticAt.eventually_eq_zero_or_eventually_ne_zero`.
- Corrected `provides` texts: `natAbs_discr`, `factorsThrough_iff_ker_unitsMap` ([NeZero n]), `integralPowerBasisOfPrimePow`, `gaussSum_pow_eq_prod_jacobiSum`, `jacobiSum_eq_gaussSum_mul_gaussSum_div_gaussSum`, `lt_rootMultiplicity_iff_isRoot_iterate_derivative`, `Matrix.minpoly_dvd_charpoly`, `Real.ofDigits_const_last_eq_one'`, `Nat.digits_append_digits`, `Rat.num_div_eq_of_coprime`, `Matrix.rank`.

**Suggested file**

These statements were false as typed and are corrected:

- `powerResidueSymbolIdeal_mul_right` and `_eq_zero_iff`, for the zero ideal when n = 1;
- the Lean form of the odd-prime Hilbert symbol, which covered only integer units and natural exponents;
- `associatedOrder_gaussian`, which asserted membership instead of equality;
- `primitiveZero_projectivization`, which did not fix the map;
- `numericalGenus_eq_zero_iff`, which lacked its Frobenius clause;
- `greedy_egyptian_step`, which lacked its monotonicity clause;
- `associatedOrder_eq_groupRing_iff`, which needs a number-field base.

Concrete bodies replace admitted data in `generatingIdeal`, `minPoly`, `digitsEquiv`, `LaurentSeries.cartier` and `leftOrder`. New signatures cover the new or previously untyped API items: the DFAO run lemmas, `NewtonSlopeMultiplicity.sum_eq`, `rootPowPoly_two_cyclotomic`, `sumSquaresCount_one` and `_genFun`, the projectivity over subgroup rings, Johnston's Proposition 6.1 in Galois-group form, the local lifting criterion, unique factorisation of ℤ[(1+√−7)/2], the degree bound in Christol's converse, and others.

The file elaborates with `lean-check`: exit 0, with 985 warnings, all for admitted proofs (`sorry`), and no other diagnostics. The packet's API items and unit tests all appear in the file under their packet names.

**Ownership and the upstream tiers**

- No prerequisite points above tier 5. Round 3's four moves are correct against the Tau Ceti ClassFieldTheory README, Hirschhorn 1987, Smyth's survey and Tau Ceti's `SplitK0` file:
  - the degree-n norm-residue symbol, to CA.1;
  - the Jacobi triple product and its specialisations, to CA.4 (the gap's list (i)–(iv) is complete for Hirschhorn's proof);
  - the power-map canonical height, to CA.6;
  - the K₀ bridges, to CA.7.
- The stable-isomorphism criterion is not packaged in Tau Ceti, but it is a short derivation from `SplitK0.grothendieckAddGroupEquiv`. The gap now says so.
- **CA.2/closed-form-of-a-complex-linear-recurrence** duplicated a target that the tier-4 DiophantineApproximationAndTranscendence package now owns (`closedFormRecurrence`, its §2.4). The node now imports the existence half (prerequisite `DiophantineApproximationAndTranscendence:DT.2`, with a request) and keeps only uniqueness.
- **The potential theory behind Dimitrov's theorem** was described as ownerless. In fact `LogarithmicPotentialTheoryAndAlgebraicIntegers` now exists, with an accepted design packet, but it does not precede this roadmap in the upstream order. So the transfinite diameter, Dubinin's hedgehog bound and Bertrandias's rationality theorem are recorded as CA.6-owned inputs, in the gap, the coverage, the restructure proposal and the reader.
- **Two Tau Ceti anchors were wrong.**
  - The archimedean Artin maps are in ClassFieldTheory Layer 10, not Layer 11.
  - That K(ⁿ√u)/K is unramified for a unit u is not stated in LocalFieldsRamification Layer 2. It follows from Layer 1 together with Layer 2.

  The proof steps, requests and Tau Ceti layer lists are corrected.
- The GN.5 `uses` entries on two CA.3 nodes are removed, because GeometryOfNumbersAndQuadraticArithmetic's packet states that it no longer depends on CA.3.

**Source findings.** The 8 new findings are E210 (Shastri §9), E516–E517 (Conrad's Pell II), E518 (Ghosh–Sarnak's V₂), E720–E721 (Berrevoets), E814 (Johnston's matrix units) and E815 (Voight 10.3.7: integrally closed needed). Three existing entries were corrected: E403's correction gains a proviso, E703's numerical range is narrowed, and E806's locator is fixed.

**Wording.** A few `match` texts quoted source phrases; they are now paraphrased. Several locators were corrected: Biasse–Fieker p. 398, Wuthrich p. 6, Bridy §2.3, Stanley p. 13 (where Stanley states the converse principle), Johnston Corollary 9.10, and Voight pp. 154–155.

## Questions for the orchestrator

1. The accepted DiophantineApproximationAndTranscendence packet still makes CA.2/closed-form-of-a-complex-linear-recurrence a prerequisite of DT.2/skolem-mahler-lech-simple-roots. Its own package has since taken that statement over. That packet should cite its own `closedFormRecurrence`; until it does, the atlas sees a stage cycle and drops one of the two links.
2. CA.6/dobrowolski-auxiliary-polynomial requests the product form of Siegel's lemma from DT.0. DT's finished package plans only the house-uniform form (Evertse, Theorem 3.20). Either DT's package adds the product form, or this roadmap's package plans it with the same pigeonhole proof.
3. Should `LogarithmicPotentialTheoryAndAlgebraicIntegers` be placed below tier 5? If it is, CA.6 imports LP.1's capacity notions instead of owning them.
4. GeometryOfNumbersAndQuadraticArithmetic says the atlas link CA.3 → GN.5 is stale. It should be reversed or dropped when that roadmap is synchronised.
5. Some publisher URLs now answer with bot challenges or HTTP 403:
   - AMS, for Hirschhorn and Ankeny;
   - IACR ePrint, for Damer.

   These were read from archived copies, recorded with their hashes. The Ullom sha256 in `sources` no longer matches the bytes served today, though it matches REV~2's receipt.
6. These inherited items stand and remain recorded honestly:
   - Catalan–Mihăilescu still has no owner in the atlas.
   - The requests whose supplier is a layer of this roadmap (CA.1, CA.4, CA.6) are continuation contracts for owned inputs, not cross-roadmap requests.

## Checks run

- `python3 scripts/check_blueprint.py research/blueprint/packets/ClassicalArithmeticCompletion.json`, with the pinned declaration index: 0 errors, 0 warnings. It reports 333 nodes, 511 API items, 288 unit tests, 42 planets (six per layer from CA.1 to CA.7), 677 baseline declarations, 220 gaps and 41 requests.
- `lean-check research/blueprint/suggested/ClassicalArithmeticCompletion.lean`: exit 0 at Mathlib 082e2d3 in the shared build, with 985 warnings, all for admitted proofs, and no other diagnostics.
- Reader/packet agreement: no packet node, gap, coverage or request string is missing from the reader, apart from the gap titles. The reader contains no Lean code, no `sorry` and no local paths.
- No restricted book was used. No source passage is reproduced.
