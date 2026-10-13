# Independent review: Diophantine approximation and transcendence, DT.0 follow-up

Accepted after corrections. Reviewer: Claude (Claude Code, session claude-hY9Ivg), job
REV-DiophantineApproximationAndTranscendence--DT.0 (#9277), 13 October 2026. The input was written by
Claude, session claude-hV03pM, in BP-DiophantineApproximationAndTranscendence--DT.0 (#9319, PR #9366);
this review shares no session with it.

## Scope and counts

The packet adds four nodes to Layer DT.0. The base packet's 46 DT.0 nodes are cited by id and were not
under review. The four nodes are:

- three theorems: the polar-lattice covering bound, Siegel's lemma in product form, and bounded
  partial quotients;
- one definition: the maximum height `h_max` of a tuple, with 13 API items and 5 unit tests.

I checked every field of every node: statement, hypotheses, proof steps, acceptance, uses, API, tests,
sources and prerequisites. All four are `corrected` in `review.checked`. No node was added and none is
unverifiable. The packet still has no gaps, no requests and no planets. Coverage of DT.0 stays
`closed`. Together with the base packet, every target of the stage is planned. The base GN.4 request
(Kronecker's covering input) is now met by `polar-lattice-covering-bound`, which rests on the
promoted `GN.4/covering-dual-transference`.

There are now 37 baseline declarations: the original 30, all confirmed, and 7 added.
`check_blueprint.py` with the pinned index reports 0 errors and 0 warnings.

## Sources

I downloaded all six PDFs again. Their SHA-256 hashes equal the recorded ones. I checked every locator,
and read each formula that a finding or a correction depends on from the rendered page, not from the
text layer. Page offsets: Evertse chapter 2, printed = PDF + 10, with the number before a line in the
text layer marking a page footer; Evertse chapter 3, printed = PDF + 38; Berrevoets, printed = PDF − 1;
Pottmeyer, printed = PDF − 6; Binyamini, published page = PDF page. All node locators are right. One
`readSections` range was fixed: Evertse's Theorem 2.23 is on p. 37, not within pp. 34–36.

## Corrections

1. **polar-lattice-covering-bound.** The packet said that Evertse assumes `‖y‖ > R` strictly. The
   rendered p. 33 shows that Corollary 2.21 assumes `‖y‖₂ ⩾ R`, and the proof on p. 34 uses
   `λ₁* ⩾ R`. The text layer turns ⩾ into `>`. The hypothesis note, the source `match` and the reader
   now say the hypothesis is the same non-strict one.

   I checked the rest of the node. The derivation from μ(L)·λ₁(L*) ≤ n is sound: GN.4's statement
   needs n ≥ 1 and the Euclidean polar lattice, and step 1 treats n = 0 separately. Step 2 gets the
   attained minimum from `GN.1/successive-minimum-first`. The maximum-norm form is right. All four
   checks are right: the k/2 counterexample for ℤ × kℤ, aℤ, ℤⁿ, and Kronecker with constant n + 1.
2. **siegel-lemma-number-field-product.**
   - Proof step 5 reported that Berrevoets sets Y equal to a non-integral root. The rendered p. 14
     shows integer-part brackets around the whole root, so the step now follows the source.
   - Step 5 now also states the M = 0 box count, `(Y + 1)^N > 1`. The strict inequality in
     Berrevoets's chain needs M ≥ 1.
   - The hypothesis "Berrevoets states M ≥ 1" is now "his exponent 1/(dM) presupposes M ≥ 1". The
     lemma never states M ≥ 1.

   I recomputed the checks: the bound 144 over ℚ(i); the house form (2√2·N·A)^{dM/(N−dM)}, which lies
   below (3NA)^{dM/(N−dM)}; and Dobrowolski's P_i ≤ N^{d·i}·M(α)^N. The statement is exactly what
   ClassicalArithmeticCompletion asked of DT.0 for CA.6.
3. **badly-approximable-iff-bounded-partial-quotients.**
   - Step 1 asserted that the numerators and denominators of `GenContFract.of ξ` are integers, and
     step 3 used `den(ξ.convergent k) = q_k`. Mathlib has neither at the pin. Step 1 now derives
     both: the integrality by induction from `zeroth_num_eq_h`, `zeroth_den_eq_one`, `first_num_eq`,
     `first_den_eq`, `nums_recurrence` and `dens_recurrence`; the coprimality from
     `GenContFract.determinant`, using `of_partNum_eq_one`.
   - Step 4 used `dens_recurrence` at k = 0, where it does not apply. That case now uses
     `first_den_eq`.
   - The seven lemmas were read at the pin and added to the prerequisites and the baseline.
   - Pottmeyer's Proposition 1.3.21 bounds a₀ as well. The source `match` now notes that this changes
     nothing.

   I re-derived both directions, with constants 1/(B + 2) and 1/c, and recomputed the √2 values at
   q = 1, 2, 5, 12. The statement is exactly what ProbabilisticAndMetricNumberTheory asked of DT.0 for
   PM.4.
4. **max-absolute-height-of-tuple.**
   - The node named its consumer only as "RP.0". The consumer is
     `HeightsRationalPointsAndObstructions:RP.0/tuple-height-adapters`, which compares max_i h(x_i)
     with the height of [1 : x₁ : ⋯ : x_m]. It also calls max_i h(x_i) "the counting height of a
     tuple", which is this node's definition restated.
   - HeightsRationalPointsAndObstructions is tier 9 and this roadmap is tier 4, so DT.0 owns h_max.
     The `uses` entry and the hypothesis now name the RP.0 node. A new `restructure` entry asks RP.0
     to cite this definition when its plan is revised.
   - The API item `absLogHeight₁_nonneg` is not a duplicate: Mathlib has no such lemma at the pin.
   - I checked every test value: log 3, (log 2)/2, 0, and log 2 against
     `Height.logHeight ![2, 4, 1] = log 4`. Binyamini's formula (1) and his vector-height convention
     are on p. 2.

## Baseline

A Sonnet agent compared each `provides` text with the declaration's source line. I read every
statement that led to a change.

- All 30 cited declarations exist at Mathlib 082e2d3, and the module and kind of each are right.
- Four `provides` texts were made precise:
  - `GenContFract.dens_recurrence`: the 0-indexed pair at position n + 1;
  - `Algebra.coe_norm_int`: the statement is the cast identity for x in 𝓞 K;
  - `Real.convergent`: its own floor/fract recursion;
  - `PiLp.norm_apply_le`: p ≥ 1 is a section hypothesis.
- Seven declarations were added: `GenContFract.zeroth_num_eq_h`, `zeroth_den_eq_one`, `first_num_eq`,
  `first_den_eq`, `nums_recurrence`, `determinant` and `of_partNum_eq_one`.
- Nothing was removed.

Neither the current TauCetiRoadmap main nor the pinned Tau Ceti library plans any of the four targets.
IntegralLattices there treats dual lattices of integral lattices, with no covering radius or
transference. So the packet duplicates no Tau Ceti work.

## Closure and cross-roadmap prerequisites

- **GN suppliers.** `GN.0/covolume-dual`, `GN.1/successive-minimum-first`, `GN.4/covering-radius` and
  `GN.4/covering-dual-transference` were read in the promoted GeometryOfNumbersAndQuadraticArithmetic
  packet. They supply exactly what the covering bound uses. GN is tier 3, below DT.
- **Base nodes.** The cited DT.0 base nodes were read in the accepted base packet: `badly-approximable`,
  `convergent-error-lower-bound`, `height-comparisons`, `mahler-measure-of-algebraic-number`,
  `abs-mul-height-eq-of-minpoly-eq` and `northcott-absolute-height`.
- **Restructure.** The packet's re-pointing of the base packet and of CA.6 and PM.4 is correct.
  - The base `kronecker-approximation-theorem` cites the stage GN.4.
  - The base `dirichlet-approximation-from-minkowski`, `DT.2/linear-form-dirichlet-exponent` and
    `DT.2/absolute-minkowski-for-twisted-heights` keep the GN.1 stage anchor beside their exact GN.1
    nodes.
  - CA.6 and PM.4 each cite the stage DT.0, with one request each.
- **Routing.** I checked the routing of the paper items against the extractions and the review of
  PAPER-BINYAMINI-22.
  - Route 2 (/28, /30, /18) was rejected there.
  - Binyamini's Lemma 25 cites Waldschmidt's Lemma 4.11, which is the base
    `DT.3/thue-siegel-lemma-for-inequalities`.
  - The DeMarco–Krieger–Ye, DeMarco–Mavraki–Ye and Masser–Zannier items are library citations or
    belong to RP.0 and R35.3, as stated.

## Mistakes in sources

| Id | Verdict | Finding |
|---|---|---|
| E601 | confirmed | Berrevoets, p. 14: the d-th root of ∏_k\|σ_k(a_iℓ)\| is written as \|N(a_iℓ)\|; it is \|N(a_iℓ)\|^{1/d}. Checked on the rendered page. |
| E602 | rejected | The finding said Berrevoets sets Y equal to the non-integral root. The rendered p. 14 shows integer-part brackets around the root, which the text extraction drops; the proof is correct as printed. |
| E603 | added, confirmed | Berrevoets, p. 13: the imaginary part of a complex σ_k is bounded with A_{k+r₁,i}; the index should be k + r₂. Affects nothing. |
| E604 | added, confirmed | Berrevoets, pp. 12–13: the pigeonhole tuples are said to lie in {0, …, Y}; they lie in {0, …, Y}^N. Affects nothing. |

E603 and E604 are new: there is no other version of the thesis, and neither the register nor
ClassicalArithmeticCompletion's Berrevoets entries mention them.

## Suggested file and reader

The suggested file elaborates with `lean-check` at Tau Ceti f790474 and Mathlib 082e2d3. Its only
warnings are the 29 "declaration uses sorry" warnings; there are no errors. I checked each statement
against the corrected packet and each example for truth, so the file needed no change. In particular:

- the ℤ × kℤ non-example holds with k = 6;
- the house-to-product example and the zero-row example are true.

The file contains the name of every API item and every unit test, and its `BadlyApproximable` is the
base file's definition verbatim. The reader was brought in line with every correction above,
including the notes on the sources. It names every API item and test.

## Questions for the orchestrator

- The DiophantineApproximationAndTranscendence package (Tau Ceti PR #855) does not yet have three of
  these targets: the product-form Siegel lemma, the bounded-partial-quotient criterion and h_max. Its
  Kronecker entry should also name the covering bound with constant n + 1. The package needs a fix;
  the handoff of BP-…--DT.0 says the same.
- At assembly, apply the four `restructure` entries. Three come from the planning job: re-point the
  base Kronecker node, drop the GN.1 anchors, and re-point CA.6 and PM.4. The fourth is new from this
  review: RP.0/tuple-height-adapters should import h_max.
- For Mathlib: the docstring of `NumberField.absMulHeight₁` says its junk value is 0, but the
  definition returns 1. Nothing in the atlas depends on this.
