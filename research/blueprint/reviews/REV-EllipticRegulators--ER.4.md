# Independent review of EllipticRegulators ER.4

Accepted after corrections. Job `REV-EllipticRegulators--ER.4`, issue #6437,
6 October 2026. Reviewer: Codex (GPT-6), session `codex-8wmDo2`.
The reviewed follow-up was written by Codex `codex-FlFWqs` for #6485,
PR #6583, commit `d7ea0972`; this session did none of that work.

This is a target-level review of eleven new declarations and seven accepted
parent imports. It accepts a complete planning pass with ER.4 coverage
`planned`, rather than claiming implementation or a closed roadmap. The
reviewed library audit, stage description, parent packet and relevant
supplier statements were read. The upstream EllipticCurves and ModularForms
documents supplied the scope and density comparisons.

| Item | Result |
| --- | --- |
| New declarations | 11: 8 theorems, 1 lemma, 2 definitions |
| Per-node verdicts | 8 verified, 3 corrected, 0 unverifiable |
| Added nodes | 0 |
| Imported parent declarations | 7 contracts checked; none replanned |
| Definition API items | 12, retained |
| Definition unit tests | 9, including 1 added during review |
| Baseline citations | All 12 confirmed; 0 removed or replaced |
| Planets | 3 new, supplementing 3 parent planets |
| Source findings | 1 confirmed against its explicitly scoped text source |
| Open gaps and requests | 1 inherited ER.7 gap, 0 new requests |

The packet's `review.checked` records a verdict and reason for every new
node. The inherited norm gap and parent assembly work are stated below;
neither is concealed by the acceptance.

## Corrections

1. The convergence declaration previously controlled the raw logarithmic
   orbit sums and the Li₂ double series, but did not explicitly control the
   logarithmic double series used in Proposition 10.3.1. Absolute convergence
   of the summed logarithmic values alone does not authorize exchanging their
   Taylor and orbit sums. The same convergence node and its Lean signature
   now include both weighted logarithmic double-series norm sums. For an
   open-disc term, `Σ |z|^j/j ≤ |z|/(1−|z|)`; the orbit moduli away from the
   boundary have a common bound below one, and `|log|z||` grows linearly.
   Thus `(n+1)|q|^n` dominates the tail. At ℓ=n=0 every logarithmic
   power-series summand has zero real-log weight. No new node is needed at
   this planning granularity.
2. `log_test_complex_scalar` remains a valid linearity test, but a wrong
   real-part logarithmic kernel passes it too. Its description now states
   that limitation and its kind is compatibility. Added
   `log_test_nonreal_kernel` in the packet and suggested file:
   `Im W(i/2)=log(2) arctan(1/2)>0`. A real-part replacement has zero imaginary
   part. This detects loss of the argument contribution to the regulator.
3. The raw identity's excerpt now points to equation `(10.3.1)`. The old
   `10.3.1.` occurs at the distinct logarithmic proposition. All eleven
   source `match` fields now describe their particular calculation, rather
   than sharing a generic source-match sentence. The formulas themselves
   needed no sign, conjugation or normalization change.
4. The inherited geometric-norm gap's `neededBy` now names
   `EllipticRegulators:ER.7/regulator-under-finite-pushforward`. Naming the
   ER.4 constant-field transfer there contradicted the gap's own explanation
   that this transfer needs no geometric norm theorem. The gap is retained
   as supplier context; its mathematics is not asserted solved.
5. Each baseline `checked` record now includes this independent rereading;
   the source finding has the required independent verdict. These are
   verification records, not new baseline declarations or source errors.

The reader document is not an authorized deliverable for this review and
was left unchanged. Its convergence statement is a true but weaker version
of the corrected one, and its scalar-test description has the limitation
identified above. Assembly should incorporate the extra double-series
estimate and ninth test. This discrepancy introduces no false theorem or
missing proof obligation in the corrected packet and suggested file.

## Sources

Independently read Bloch, *Higher Regulators, Algebraic K-Theory, and Zeta
Functions of Elliptic Curves*, CRM 11 (2000), Lecture 10 §§10.2–10.3,
in [the book](https://bookstore.ams.org/crmm-11).
Every node's locator and excerpt was checked. The exact equation anchor
correction is recorded above. The supporting passages are:

| Nodes | Locator checked | Mathematical check |
| --- | --- | --- |
| Convergence | §10.3, pp.80–85, including (10.3.3) | These are rearrangements requiring the estimates supplied here; no separately printed convergence theorem is claimed. |
| L, M definitions | (10.3.2), p.80 and its preceding decomposition | L contains the full principal complex logarithm; the negative integral in M becomes positive Li₂. |
| Orbit splitting | Proof of Proposition 10.3.3, pp.82–83 | The canonical negative lift changes at ℓ=0 and leaves the endpoint once. |
| Bernoulli row | Lemma 10.2.3, pp.79–80 | Cubic Bernoulli polynomial, inverse transform at (0,−n), and oddness give the positive horizontal prefactor. |
| Logarithmic evaluation | Proposition 10.3.1, Lemma 10.3.2, pp.80–82 | Negative y/(2π), signed m≠0, and weighted geometric series agree. |
| Forward dilogarithm | Lemma 10.3.4, pp.83–84 | Positive H and the negative projected lattice term agree. |
| Boundary dilogarithm | Lemma 10.3.5, p.84 | The unit-circle contribution is −H, including 1/C. |
| Dilogarithmic evaluation | Proposition 10.3.3, pp.82–85 | H cancels and Im precedes multiplication by complex f. |
| Raw identity | Equation (10.3.1), p.80; concluding algebra, p.85 | The m=0 row is absent; the denominator conjugation follows from the checked algebra. |
| Regularized identity | Lemma 10.2.3 and beginning/end of §10.3 | The horizontal row is added analytically before C³ class scaling. |

The public text loses overbars. For w=mτ+n, direct computation gives

`1/(m w²) + Im(1/(m²w))/y = −2iy/(w² conjugate(w))`.

This verifies the packet's barred denominator and signs without treating
the damaged text layer as a page image. The AMS source could not be retrieved;
no original-image collation is claimed. This limitation was already explicit
in the packet and remains explicit here.

Independently obtained [Brunault's thesis, math/0602186v1](https://arxiv.org/pdf/math/0602186v1)
and checked §1.2, printed pp.20–28. The PDF hash agrees with the packet:
`8fd73faba5db08328c2884d9f35b79bc528145428766444f3eb8097f3b494fb7`.
Its regulator/dilogarithm comparisons support the conventions, but Theorem 21
uses Bloch's final theorem. It is correctly excluded as a premise of the
new direct proof.

Confirmed `EllipticRegulators/ER4-E1` at the parenthesis before (10.3.2).
The accessible text asserts strict forward-disc membership for every n≥0;
ℓ=n=0 gives norm one. The weighted logarithm vanishes there, while the Li₂
endpoint must survive. The confirmation is scoped to that digitization,
not to unavailable original pages. Independent author-publications and
errata searches found no correction for this passage. The parent's capital-C
finding E11 is inherited, rather than duplicated as a new finding.

## Baseline and proof closure

All twelve declarations were read at Mathlib
`082e2d37e8b0463410cdb532e111cd43d5a66174`. Their actual statements provide
the following inputs; no merely similar declaration is used as evidence.

| Declaration | Hypothesis and use checked |
| --- | --- |
| `Complex.hasSum_taylorSeries_neg_log` | Norm strictly below one; principal log Taylor sum, with totalized zero term. |
| `hasSum_coe_mul_geometric_of_norm_lt_one` | Norm strictly below one; n-weighted geometric sum. Complex coefficients meet its ambient assumptions. |
| `cot_series_rep` | Argument outside the integers; paired positive-index partial fractions, not an absolutely summable unprojected bilateral reciprocal series. |
| `iteratedDerivWithin_cot_pi_mul_eq_mul_tsum_div_pow` | k≥1 in the open upper half-plane; k=1 supplies the square-denominator identity. |
| `Complex.cot_pi_eq_exp_ratio` | Exponential form; Im z>0 makes the rearranged denominator nonzero. |
| `hasSum_one_div_nat_pow_mul_sin` | k≠0 and x∈[0,1]; k=1 supplies the cubic Bernoulli Fourier series, including endpoints. |
| `Real.summable_one_div_nat_pow` | Natural exponent p>1; p=2 controls the Li₂ boundary and logarithmic row bound. |
| `Real.summable_one_div_int_pow` | Natural exponent p>1; p=3, together with norm summability, controls the horizontal row. |
| `EisensteinSeries.summable_one_div_norm_rpow` | Real exponent k>2 on integer two-vectors; k=3 and an invertible real coordinate map control the full lattice kernel. |
| `Function.Periodic.qParam` | Period-one exponential gives the specified q and canonical torsion lifts. |
| `Function.Periodic.norm_qParam` | Its exact norm formula gives geometric decay and precisely the ℓ=n=0 forward boundary. |
| `ZMod.stdAddChar` | Positive additive character; conjugation gives the specified negative-first/positive-second Fourier kernel. |

The supplier `Polylogarithms:P.1/classical-polylogarithm` includes the
closed-disc continuity API for order at least two and the open-disc series;
uniform 1/j² domination gives the needed boundary series. Its Bloch–Wigner
definition supplies the raw regulator decomposition. The accepted ER.3 raw
companion and its Bernoulli regularization use elementary q-shift and
polynomial arguments, so the direct proof need not consume ER.3's Fourier
expansion. AC.0 supplies normalized character orthogonality and inversion.

The shell bound on Σ_n |mτ+n|⁻² is uniform in m Re τ and is O(1/|m|).
Multiplication by 1/|m| controls L; the projected imaginary kernel is
exactly −y/(m|mτ+n|²), so its norm has the same bound. The full cubic kernel
uses a positive lower norm bound for the real-linear map (m,n)↦mτ+n.
These estimates support product-index absolute summation. No irrationality
condition or hidden summation order is required.

For complex odd f, the even cosine character component sums to zero.
This justifies the forward and endpoint calculations with complex
coefficients; it does not move a complex coefficient through Im. Their
independent values give M₁=H+M and M₂=−H. The regularized identity then
adds the Bernoulli row to L+M. The dependency order is convergence and
imported Fourier/polylogarithm interfaces, analytic evaluations, raw and
regularized identities, then geometric divisor/class interpretation.

All seven parent imports were checked against their statements: Q−P
diamond convolution; divisor-regulator formula with its half-conjugation;
permitted degree-zero/product-one lifts; C³ corrected-class formula;
the torsion Fourier adapter; the final class theorem; and constant-field
trace via split base change and additivity. They cover the stage's remaining
targets. No class theorem, divisor formula or final ER.3 Fourier expansion
appears as a prerequisite of the new direct analytic identity.

The two new definitions each retain six API items and have respectively
five and four tests. Their apply, zero, add, scalar, character and boundary
or splitting interfaces suffice for their observed uses without unfolding
the definition. No inapplicable universal property is invented. The three
new planets are the Bernoulli correction, logarithmic sum and dilogarithmic
sum; together with the parent's three they fit the six-planet limit.

## Confirmed finding and remaining assembly

`RT-AREA-combinatorics/14` and the accepted RS-03 owner decision are preserved
in both packet and reader. Generic averaged finite-abelian Fourier theory
belongs solely to AC.0; ER.4 consumes its torsion specialization. The explicit
AC.0→ER.4 link preserves Lecture 10's C⁻² convention. The named transform,
Parseval and normalized-convolution suppliers are not replanned here.
The ZMod.dft, Haar/Peter–Weyl, upstream AlgebraicCodingTheory Layer 3 and
ModularForms Layer 0 comparisons stay with the owner.

Independently read `CommGroup.sum_monoidHom_apply_eq_ite` at Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`,
`TauCeti/GroupTheory/FiniteAbelian/CharacterOrthogonality.lean:104`.
Its domain, enough-roots-of-unity, finite-group and decidable-equality
assumptions match the packet's note. The missing audit evidence and explicit
upstream comparisons remain an AC.0 maintainer note; this review is not
authorized to edit that packet or audit. It adds no orthogonality node.

Assembly must connect `ER.4/direct-regularized-fourier-identity` to the
parent `ER.3/fourier-and-kronecker-eisenstein` torsion expansion and
`ER.4/bloch-theorem-10-2-1`, preserving their identifiers and the proof order
above. It must also carry the strengthened convergence statement and new
test into the reader. The inherited ER.7 norm obligation remains:
prove `r_Y(N_φ ξ)(ω)=r_X(ξ)(φ*ω)` for every ξ, rather than only symbols
whose second entry is a pullback. ER.4 constant-field trace is independent
of that obligation. These are explicit follow-through items for the
orchestrator and suppliers; no unanswered question blocks this review.

## Validation

`python3 scripts/check_blueprint.py research/blueprint/packets/EllipticRegulators--ER.4.json`
reports zero errors and zero warnings. `lean-check` on the corrected suggested
file exits successfully with only declaration-uses-sorry warnings. Available
memory was checked first. The shared Mathlib checkout matches its pin;
the suggested file imports only Mathlib, so a newer shared Tau Ceti checkout
does not affect elaboration. No library build or language server was started.

Independent standard-library numerical diagnostics used C=4,
τ=0.27+0.83i and C=5, τ=−0.31+1.17i, with
`f=(1+2i)(δ_(1,0)−δ_(-1,0)) + (−0.7+0.4i)(δ_(0,1)−δ_(0,-1)) + (0.3−0.9i)(δ_(1,2)−δ_(-1,-2))`.
Twenty q-orbit terms, 200000 unit-circle/p-series terms and independent
rectangular lattice cutoffs N=100,200,400 were compared. The regularized
identity residuals decreased respectively
`1.25e−5, 3.11e−6, 7.75e−7` and
`1.02e−5, 2.54e−6, 6.34e−7`; the separate L and M residuals decreased with
their slower absolute tails. The Bernoulli row was nonzero in both cases.
At matching finite cutoffs the orbit splitting, forward/H and boundary/H
comparisons agreed within 3e−16; this is floating-point agreement, not a
certified infinite-series error bound. M had nonzero real parts of magnitudes
0.417 and 0.335, which a purely imaginary outside-Im definition cannot have.
The added W(i/2) test gave 0.32137603295226863 on both sides. These are
diagnostics supplementing the proof audit, not formal proofs.
