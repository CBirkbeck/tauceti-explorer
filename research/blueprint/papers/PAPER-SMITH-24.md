# PAPER-SMITH-24 — corrected extraction

Alexander Smith, *Algebraic integers with conjugates in a prescribed distribution*,
Annals of Mathematics 200 (2024), 71–122. This inventory concerns the
[47-page arXiv v2](https://arxiv.org/pdf/2111.12660v2), not a collation of the published text.

Codex, session `codex-J6LwjP`, corrected the extraction on 30 September 2026 for
[issue #4974](https://github.com/CBirkbeck/tauceti-explorer/issues/4974), using all seven
findings confirmed by `REV-RT-PAPER-SMITH-24`. The original full-v2 extraction by
Claude Code (`cc-7b31c4`) and its acceptance by `cc-d67081` are historical evidence;
they do not constitute review of this revision. Their assertions that no mistakes
were found and that no Honda–Tate owner existed are superseded.

There are **74 items: 12 library, 2 planned and 60 missing**. All 60 missing items
have exactly one route. The 56 stable item identifiers remain; 18 imported inputs
are added as items 57–74. This is an inventory and routing proposal. Subsequent
blueprints will supply proof decomposition, APIs and tests under PROTOCOL §16.

## Results and hypotheses

Theorem 1.5 concerns a compact **real** set Σ with at most countably many connected
components and logarithmic capacity greater than one. A probability measure µ on Σ
is a weak limit of distinct irreducible monic integer-polynomial root measures
exactly when every nonzero integer polynomial Q satisfies ∫log|Q|dµ≥0. The necessary
condition is Serre’s resultant argument; Smith proves sufficiency through polynomial
coefficient adjustment and geometry of numbers.

Theorem 5.11 identifies the optimum of the corresponding mean-value problem with
the supremum obtained by Smyth’s auxiliary-polynomial inequalities. Example 5.16
then proves λ_SSS<1.89831. Here λ_SSS is the **greatest** finite-exception threshold,
equivalently the least limit point of normalized traces; the source’s “least” is E1.
Theorem 5.11’s root/zero-coefficient proof issue is recorded as E5, with its repair.

For a prime power q, Proposition 5.12 applies this optimization to
x=π+q/π for a Weil q-number π. The conjugates of x lie in [−2√q,2√q]. A real Weil
number π itself equals ±√q. If P is the minimal polynomial of x, Honda–Tate gives

`#A(F_q)^(1/dim A) = exp(∫ log|q+1−t| dµ_P(t))`.

The multiplicities in the Frobenius polynomial cancel in this normalized formula.
Proposition 5.13 and Corollary 1.3 yield the improved extreme point counts for
sufficiently large square q. The reduction follows
[Kadets, Proposition 2.1](https://arxiv.org/pdf/1906.02264), p.3, with his positive
coordinate y=q+1−x. Items 43 and 54 now distinguish these coordinates correctly.

## Source and check scope

The v2 PDF was fetched again on 2026-09-30. Its SHA-256 is
`99b3855a176ddb280630f50cbed23039c1348417aad31d817f34c3b60f4a35a9`.
The fix freshly read pp.1, 7–9, 11–14, 16, 23–27 and 31–47, including rendered
page images at pp.16, 24 and 27. The original full-paper read remains recorded in
`source.readSections`; this fix does not claim a second full-paper reading.

The [Annals publication page](https://annals.math.princeton.edu/2024/200-1/p02),
Crossref record, arXiv version history and author publications page were checked
for corrections. None was located. The 52-page published full text was **not read**;
`sourceVersions` therefore records only the preprint. E1–E11 are scoped to v2,
and no claim is made that they persist in the published paper.

The added Saff–Totik statements record the precise specializations used by Smith.
An accessible 13-page book PDF contained front matter only, so it is not evidence
of a fresh reading of the cited chapters. The domination hypotheses were separately
checked in [Saff’s survey, Theorem 2.8](https://arxiv.org/pdf/1010.3760), p.182.
The [BLPS author copy](https://www.math.ualberta.ca/~alexandr/papers/wwBLPS2503.pdf)
was read at the definition of flatness (pp.2–3) and Corollary 2.5 (p.10).
Erdélyi’s input is the exact complex-polynomial specialization printed in Smith’s
Lemma 2.8, p.8; it is not claimed that Erdélyi’s full proof was reread.

## Library and planned inputs

The pins are Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`. The revised classifications follow
fresh declaration-statement reads and the reviewed AUDIT-02, AUDIT-07 and AUDIT-18.

| Items | Supplier and fit |
| --- | --- |
| 6 | `TauCeti.Probability.empiricalMeasureOfFintype`: the normalized Dirac sum over `Fin n`, n≥1, with root multiplicities. FiniteMeasure and ProbabilityMeasure convergence are both built; on compact Σ their bounded continuous tests cover Definition 1.4. |
| 48, 72 | `Polynomial.resultant`, `resultant_eq_prod_eval`, `resultant_map_map`, `resultant_eq_zero_iff`, `discr`, `minpoly`, `IsIntegral`. The product formula uses splitting after mapping to ℂ; the zero criterion uses a field. |
| 51 | `Prokhorov.lean` supplies compactness of probability measures on compact spaces and supported finite-measure compactness. `instMetrizableSpaceProbabilityMeasure` plus `IsCompact.tendsto_subseq` supplies subsequences. |
| 69 | `MvPolynomial.eq_zero_of_eval_zero_at_prod_finset` and `combinatorial_nullstellensatz_exists_eval_nonzero`. A top-degree monomial and grids `{0,…,t_i}` yield the printed total-coordinate bound. No new Salzer/Gregory–Newton plan is needed. |
| 70, 71 | `geometric_hahn_banach_open` and `ContinuousMap.exists_extension` supply separation and Tietze extension. |
| 73, 74 | Blichfeldt and Minkowski I are in `MeasureTheory/Group/GeometryOfNumbers.lean`; GN.0’s lattice/covolume infrastructure is also built. |
| 16, 49, 50 | Retained library inputs: Gauss/primitivity, Eisenstein and Tonelli/monotone convergence. |
| 52 | Only Minkowski **II** remains planned, at GN.1’s `minkowski-second-lower` and `minkowski-second-upper` nodes. |
| 54 | The Weil bound remains planned in DWP.1 and R34.1–R34.2. |

Item 56 remains **missing**. Mathlib’s Chebyshev `measureT` and Tau Ceti’s
`chebyshevMeasureT_univ` give the arcsine carrier and mass π. Normalization and
an affine change of interval do not prove its logarithmic equilibrium property,
and do not supply the finite-union density.

## Routes

| Route | Missing items | Ownership |
| --- | ---: | --- |
| New `LogarithmicPotentialTheoryAndAlgebraicIntegers` | 52 | General complex potential theory; real Hölder/Chebyshev/adjustment constructions; Smith’s main and point-count results. |
| Source `GeometryOfNumbersAndQuadraticArithmetic:GN.1` | 3 | Polynomial flatness application (21), evaluation-polytope minima (23), BLPS flatness supplier (68). |
| Source `ClassicalArithmeticCompletion:CA.3`, `CA.6` | 4 | Classical trace problem, auxiliary inequalities, and squarefree integer combinations (1–3, 17). |
| Part II of `AbelianSchemesAndArithmeticModuli` | 1 | General finite-field Honda–Tate/Tate Hom (53), shared with the accepted Lipnowski–Tsimerman route. |

Route 1’s common analytic foundations are for compact subsets of **ℂ**. Its consumers
include the accepted `PAPER-CALEGARI-DIMITROV-TANG-25/potential-generalization-2.5.27`
in `ArithmeticAlgebraizationAndHolonomyBounds`, and CA.6’s Dimitrov capacity/hedgehog
input. Those consumers keep their specialized holonomy and arithmetic rationality
results. Smith’s arithmetic realization theorem retains its real-set and capacity>1
restrictions; a general complex potential-theory carrier does not remove them.

The missing imported inputs are now explicit: weighted admissibility/equilibrium
and Robin constants (57), identification for w=e^{U^µ} (58), extremal polynomials
(59), zero distribution (60), domination (61), Frostman bounds (62), energy lower
semicontinuity (63), countable polar sets (64), finite-energy nullity on polar sets
(65), increasing-union capacity continuity (66), Remez (67), and BLPS flatness (68).
The Saff–Totik references are respectively I.1.1/I.1.3, I.3.1, III.1.9, III.4.2,
II.3.2, I.1.4/I.1.9, and I.6.8. **I.1.4 is not domination.**

No separate general balayage item is needed for Lemma 5.2(1): Smith’s reciprocal
substitution already proves mass one using the arcsine measure. General balayage
on p.45 is proposed future work. The Remez supplier is Erdélyi, JLMS (2) 45 (1992),
255–264, Theorem 1; the flatness supplier is BLPS Corollary 2.5, not Minkowski II.

Route 4 is deliberately consolidated with the existing accepted
`PAPER-LIPNOWSKI-TSIMERMAN-18/honda-tate` and `/tate-hom` request.
The parent-based design [#3351](https://github.com/CBirkbeck/tauceti-explorer/issues/3351)
was still available when checked. Its proposed Part II is not an existing atlas
layer, so item 53 stays missing. Faltings R28.4 is a completed number-field isogeny
layer and cannot absorb this finite-field classification. The shared design must
retain arbitrary prime powers q even where its counting applications use primes.
Smith’s applications 5, 43 and 44 occur only in route 1 and import that classification.

## Source corrections

| ID | v2 location | Correction |
| --- | --- | --- |
| E1 | Introduction p.1 | Greatest/supremum trace threshold, not least. |
| E2 | **Proposition 2.12** proof p.11, after (2.14) | Exponential equals the absolute value of the monic polynomial. |
| E3 | Proposition 3.4 p.14 | Successive minima are least nonnegative dilation factors. |
| E4 | Notation 5.3 / (5.5), p.33 | Multiply the convolution potential error bound by µ(Σ). |
| E5 | Theorem 5.11 pp.39–40 | Drop zero auxiliary coefficients; use continuity at nonisolated roots and small positive logarithmic perturbations at isolated roots, with vanishing loss in λ. |
| E6 | Proposition 2.5 proof p.36 | Remove one-point components, not merely isolated points. |
| E7 | Same paragraph | Finite energy means I(µ)<∞ for the −log kernel. |
| E8 | Lemma 4.4 proof p.24 | Quotient roots lie in the convex hull of Σ; this still gives the fixed-degree sup bound. |
| E9 | Lemma 4.7 proof p.27 | Include every integer 0≤j<D. |
| E10 | Proposition 3.6 proof p.16 | The cofactor estimate includes k=n+1. |
| E11 | Lemma 4.7 proof p.27 | Cover [0,N) by at most n forbidden-shift intervals of length at most a to prove N≤na. The printed k=0 assertion contradicts the definition of N. |

E1–E7 preserve the separately confirmed errata-ledger findings, without copying
its `review` objects onto this different file. E8–E11 follow the verified red-team
findings with the verifier’s corrected examples and proof repairs. E8 uses
Σ=[−3,−1]∪[1,3], of capacity √2>1, not the smaller example that violates the
standing capacity assumption. Item 32 also restores the **signed** ratio
T(y_i)/T̃_r(y_i)≥1/2, needed for sign changes; item 36 states its potential inequality
for all z∈ℂ. These are extraction corrections, not additional source mistakes.

## Validation and handoff

The paper checker and the shared source-issue/version checks pass. All cited
library identifiers resolve in the pinned declaration index; all 60 missing items
are routed once. Thirty-two regression checks cover these invariants, the sign,
index, mass, root-coordinate and shift examples, and the numerical values of
Example 5.16 (70-digit decimal arithmetic):

- potential constant −1.285852310814315…×10⁻⁷;
- logarithmic moment 1.451279604820194…×10⁻⁶;
- trace 1.898303119178237… < 1.89831.

See the [fixes report](../redteam/RT-PAPER-SMITH-24.fixes.md) for exact declaration
locations, reproducible checks and the bounded administrative follow-ups. The
separate errata ledger’s E2 locator, the historical review files and the old
155-item handoff are outside this fix’s allowed paths; this document and the
[own-job handoff](../handoff/FIX-RT-PAPER-SMITH-24.md) supersede their stale claims.
No Lean file is part of this job and no Lean compilation was run.
