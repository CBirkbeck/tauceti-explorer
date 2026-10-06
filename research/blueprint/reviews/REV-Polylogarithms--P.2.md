# Independent review: Polylogarithms, P.2

**Accepted**, after the corrections below. Reviewed by Codex (GPT-6), session
`codex-bnNBAm`, on 2026-10-06, for issue #6402. This session did not author the
plan. The verdict is `independent-review-REV-Polylogarithms--P.2` in the part
packet. Acceptance concerns the mathematical plan and suggested signatures;
all implementation statuses remain `unchecked`.

## Scope and counts

I read the part reader and suggested file, every local node, the eight inherited
P.2 target statements and proof routes, their P.1 analytic suppliers, and the
relevant K3BlochGroups V.3/V.4/V.6, BorelRegulators R.4 and AF.1a statements.
I also read the GeometricTopology and AlgebraicTopology upstream documents,
the reviewed P.2 library audit, and the three specified red-team findings with
their independent confirmation records.

| Item | Result |
|---|---|
| Local nodes | 14: two definitions, two constructions, seven theorems, one lemma, two comparisons |
| Node verdicts | Six verified, eight corrected, none added or unverifiable |
| Inherited P.2 contracts | Eight retained by reference; none copied or removed |
| Definition/construction API | 24 items, all present in the suggested file |
| Unit tests | 17, with at least four for each definition/construction |
| Baseline citations | 12 confirmed; none removed or replaced |
| Source findings | E22 and E23 confirmed; E24 added and independently confirmed |
| Gaps and requests | Two precise gaps, three supplier requests |
| Coverage | One stage planned; zero closed; one complete planning pass |
| Planets | Two new, plus four inherited, meeting the six-per-layer limit |

The pass can be accepted under PROTOCOL section 0: every inherited target has a
contract, and its unfinished chains end in identified suppliers or explicit
gaps. `complete` does not assert that the exact Borel scalar or ideal-region
carrier has been constructed. Those remain in `coverage.remaining` and `gaps`.

## Corrections

- Changed nine test categories from `value` to the protocol's `computation`.
  Their names, values and mathematical scope are unchanged.
- Replaced the Milnor excerpts “Lobachevsky function” and “ideal tetrahedron”,
  which are not literal phrases at the cited passages, by literal English
  excerpts there. Replaced the plain-text mathematical `dL2` excerpt by
  “sense of distributions”, checked on published p.57.
- Replaced “three distinct dihedral angles” by “three dihedral angles at any
  one vertex”. Equal angle values are allowed, including the regular ideal
  tetrahedron used in the acceptance test.
- Strengthened `lobachevsky_fourier` and `blochWigner_unit_fourier` to include
  absolute summability, which their packet statements already promise.
  Strengthened `blochWigner_kummer` to include the three unit-norm conclusions.
- Added source issue E24, below. No new mathematical node was needed.

The reader's formulas, test values and ownership statements agree with these
corrections. Its mathematical exposition required no correction. It is outside
this review issue's editable deliverables; the new E24 evidence is recorded in
the packet and this report for the assembly.

## Node-by-node mathematical check

All node names in this table have prefix `Polylogarithms:P.2/`.

| Node | Verdict and independent evidence |
|---|---|
| `lobachevsky-function` | Corrected. Milnor's signed integral gives the stated normalization. Native log-sine integrability applies on arbitrary intervals because real logarithm uses absolute values. Oddness, period pi, continuity and the derivative away from sine zeros follow by the indicated integral arguments. The Catalan-half test rejects the Clausen factor-two error. |
| `lobachevsky-fourier` | Corrected. Milnor equation (2) is twice Lambda. For radial parameters bounded below away from zero, the logarithmic integrands have an integrable log-sine majorant near each zero. The integrated coefficients have majorant 1/(2n^2), giving absolute and uniform convergence and the endpoint passage. The Lean statement now includes all three conclusions. |
| `lobachevsky-duplication` | Verified. Adding the shifted Fourier series cancels odd indices; reindexing even indices gives exactly the two factors of two. This matches Milnor's distribution identity at n=2. |
| `unit-circle-fourier` | Corrected. Zagier I.3 gives the series. The radial Li2 limit and reciprocal-square majorant cover the whole circle, including w=1. The logarithmic correction vanishes because log norm w=0. Absolute summability is now explicit in Lean. |
| `unit-circle-fourier-tail` | Verified. The absolute value of each imaginary coefficient is at most one. Applying the pinned Ioc tail bound at nonzero N and taking the upper-endpoint limit gives 1/N, without excluding a neighbourhood of 1. |
| `kummer-unit-reduction` | Corrected. Zagier equation (2) has exactly these three conjugate ratios and coefficient 1/2. Nonzero denominators follow from z not equal to 0 or 1. The differential comparison on each half-plane and real-boundary continuity fix both integration constants. Native norms are now part of the suggested conclusion. |
| `rational-unit-shapes` | Corrected. Exact arithmetic verifies rho, the positive imaginary sign in W1, and W2 as the ratio for z−1 times the conjugate of the ratio for z. Exceptions are explicit. Its compatibility and exceptional-value APIs cover all inputs without introducing an abstract Gaussian-rational carrier. |
| `rational-unit-shapes-correct` | Verified. Clearing the two nonzero rational denominators proves equality with the native ratios. Squared-coordinate sums are one. Conjugation and real inputs have the stated values. |
| `rational-fourier-sum` | Corrected. Primitive recursion computes successive native complex powers rather than repeated first coefficients. No norm condition is needed to define it or for its coercion API. |
| `rational-fourier-compatibility` | Verified. Induction uses the actual native multiplication coordinates; coercion preserves the finite sum and its nonzero integer-square denominators. |
| `rational-fourier-approximation` | Corrected. The algorithm is total and rational throughout. The length 3·2^p and coefficient 1/2 are fixed. Exact arithmetic gives A(i,0)=8/9, A(i,1)=209/225 and A(−i,0)=−8/9; real and exceptional inputs give zero. No fast-complexity assertion is made. |
| `rational-fourier-error` | Verified. Compatibility, Kummer and three uniform tails give 3/(2N)=1/(2·2^p). Strict sign and nonvanishing implications follow by interval containment. Integer coefficients require the stated absolute-value weights. Algebraic Bloch boundary membership is a separate V.6 input. |
| `milnor-angle-volume` | Corrected. Milnor's upper-half-space density h^−3 produces the crucial height factor 1/2. The displayed sector integral simplifies to Lambda(a)/2 using duplication and symmetries. Signed sectors handle obtuse triangles; the geometry request includes their almost-everywhere region identity and integration compatibility. Equal angles are permitted. Ordered volume and reflection signs agree with r(infinity,0,1,z)=z. The missing canonical region carrier remains visible. |
| `goncharov-elementary-calibration` | Verified. The exact six-permutation computation gives Alt=−3, C2=−3/2 and Burgos Phi3=1/2. These are cochain evaluations only. Neither class equality nor an exact Borel scalar is inferred from them. |

Independent exact rational checks covered exceptional inputs, real input 2,
conjugation, the three listed nonzero outputs, unit norms, and native-ratio
compatibility. High-precision checks compared Kummer and the certified error
bound against the analytic dilogarithm on five admissible real/nonreal inputs
at three precisions. Direct quadrature of the sector integral at pi/12, pi/6,
pi/4 and pi/3 agreed with Lambda(a)/2 to over 30 decimal places. These numerical
checks corroborate the mathematical arguments; they are not proofs or claims
of Lean implementation.

## Pinned library audit

Every declaration below was independently read at Mathlib commit
`082e2d37e8b0463410cdb532e111cd43d5a66174`. The paths are source paths at that
commit, not guessed import names.

| Declaration | Module and checked scope |
|---|---|
| `intervalIntegral` | `MeasureTheory/Integral/IntervalIntegral/Basic.lean`: signed Bochner integral, difference of the two oriented Ioc integrals. |
| `intervalIntegrable_log_sin` | `Analysis/SpecialFunctions/Integrability/LogMeromorphic.lean`: integrability for any two real endpoints. |
| `integral_log_sin_zero_pi` | `Analysis/SpecialFunctions/Integrals/LogTrigonometric.lean`: integral is −log(2)·pi, with the required sign. |
| `Complex` | `Basic/Complex/Basic.lean`: native real and imaginary coordinates. |
| `Complex.mul_re` | Same module: ac−bd. |
| `Complex.mul_im` | Same module: ad+bc. |
| `Complex.norm_def` | `Analysis/Complex/Norm.lean`: square root of normSq. |
| `Complex.arg` | `Analysis/SpecialFunctions/Complex/Arg.lean`: principal argument in (−pi,pi], including the value at zero. |
| `Real.summable_nat_pow_inv` | `Analysis/PSeries.lean`: natural-power reciprocal series is summable iff 1<p; p=2 applies. |
| `sum_Ioc_inv_sq_le_sub` | Same module: ordered-field finite-tail bound with k nonzero and k≤n. Here N≥1 supplies that hypothesis. |
| `Matrix.trace` | `LinearAlgebra/Matrix/Trace.lean`: finite diagonal sum. |
| `Matrix.trace_mul_comm` | Same module: compatible rectangular matrix sizes, additive commutative monoid and commutative multiplication; complex matrices satisfy the hypotheses. |

Searches of all pinned Mathlib sources and Tau Ceti at
`f790474821cf4256814db967cb154e7af3d0c369` found no target definition for
Lobachevsky, Bloch–Wigner, the Borel regulator or the ideal-tetrahedron formula.
The Mathlib dilogarithm hit is documentation in the log-trigonometric integral
module. This agrees with the reviewed `Polylogarithms:P.2` audit in
`data/library-coverage.json` (AUDIT-30). The new nodes do not duplicate built
material.

## Closure, suppliers and the three red-team findings

The local dependency graph is acyclic. Its external analytic inputs are
existing P.1 nodes. The eight inherited P.2 targets remain references to the
parent packet: the V.3 antisymmetric tensor quotient, natural V.4 Suslin maps,
number-field complex places and R.4 regulator remain their owners' objects.
The Fourier algorithm supplies the inherited computable approximation and error
contracts without requiring the parent proof sketch's near-circle expansion.

The geometric request imports the curvature −1 metric and its Riemannian
volume from GeometricTopology layer 7, and the hyperbolic model from layer 8.
Those upstream stages do not promise the canonical ideal boundary, measurable
ideal-tetrahedron regions or signed exhaustion interface. The precise early
Part II request owns those missing generic foundations. The plan does not
import JSJ or manifold volume minimization into this calculation.

AF.1a supplies the smooth/continuous/invariant-form/relative-Lie comparisons.
It does not currently supply the measurable cocycle comparison. The request
states that extension explicitly, including repeated configurations and
coefficients. R.4 supplies the independently Burgos-normalized trace class;
the elementary calculation does not bypass the measurable-to-continuous,
Tate-coordinate or Suslin/Hurewicz comparisons.

I checked both the original red-team findings and their confirming reviews:

- **RT-AREA-ktheory-2/23:** P.2 owns the analytic regulator comparison. V.6
  imports it for transport along the algebraic comparison. R.7 is a consumer,
  with no reverse R.7→P.2 premise. The residual supplier wording in the parent
  and V.6 is explicitly identified for assembly/rescoping.
- **RT-AREA-ktheory-2/25** and **RT-AREA-topology/7:** P.2 owns the single
  ideal-tetrahedron volume identity. QT.5 imports it for triangulated manifold
  volume and its Bloch invariant. The proposed P.2→QT.5 edge and early geometry
  supplier prevent duplicated identities and reverse dependencies.

The reader states the same boundaries. The part's `restructure` proposals are
requests for the orchestrator; they do not assert that unrelated packets or
atlas edges have already been edited.

## Source findings and version checks

I obtained the public Milnor, Zagier and Goncharov PDFs independently. Their
SHA-256 hashes match the packet. The Goncharov findings are against the
**published JAMS version**, not merely the preprint. Its relevant appendix
pages were also inspected visually. The arXiv v3 passages were read separately;
the page and equation numbers differ. Independent reading dates are added
without erasing the author's original reading dates.

**E22 confirmed.** Published equations (66)–(67) and the unnormalized Alt
convention give C2(e12 wedge e21 wedge e22)=−3/2. All three even permutations
have trace zero and all three odd permutations have trace one. The proof's
claimed value one fails. Reversing the first two matrices only changes the
sign. This finding affects the proof; it does not establish a replacement for
Theorem 5.7 or Corollary 5.10's class coefficients.

**E23 confirmed, in its stated limited scope.** Published Appendix 7.2 introduces
the specialized boundary coefficient and uses c3=−1/(6pi) without deriving that
conversion from the normalized boundary ratios, volume and orientation. The
printed preceding coefficient also has the problem below. The required
calibration remains an explicit source-proof gap. Milnor independently proves
the volume endpoint, so this is not a claim that the D/volume identity fails.

**E24 added and confirmed.** Published Theorem 7.1, equation (99), p.55, prints
boundary integral / simplex volume = (n−1)^n vol(S^(n−1))/n. For n=3 this is
32pi/3. The volume form immediately before it is normalized to the ordinary
coordinate volume form at the centre of the projective unit ball.

Take the Klein-model vertices y0=0 and yi=epsilon e_i for i=1,2,3. Choose
homogeneous lifts (yi,1) and boundary lift (x,1), with x on the unit sphere.
The source's boundary measure ratios are

\[
 \mu_{y_i}/\mu_0=(1-\epsilon x_i)^{-2}.
\]

Consequently, with outward boundary orientation, the integral has leading term

\[
 8\epsilon^3\int_{S^2} x_1\,dx_2\wedge dx_3
   =\frac{32\pi}{3}\epsilon^3.
\]

The geodesic simplex is the straight coordinate tetrahedron in the Klein
model. Its normalized volume is epsilon^3/6 + o(epsilon^3). The ratio therefore
tends to **64pi**, six times the printed coefficient. Changing orientation
cannot correct a factor six. The general leading-term calculation introduces
n!, because an exterior volume-form evaluation measures a parallelepiped,
whereas the coordinate simplex has volume 1/n!. Lemma 7.3's exterior-form
calculation is not itself a calibration of simplex volume without that factor.

As a cross-check, quadrature of the boundary integral and the Klein tetrahedron
volume at epsilon=0.1, 0.03 and 0.01 gave the ratio 201.061929829747 each time,
consistent with 64pi. The asymptotic argument establishes the error independently
of quadrature. The same printed coefficient is present in arXiv v3 equation
(97), pp.64–65. No replacement Borel scalar or Appendix 7.2 conversion is claimed
from this one correction.

The packet records the primary URLs, locators, hashes and search details. I
checked arXiv's revision history (v3 remains latest), the author's website, and
targeted publisher/title/calibration/erratum searches; I found no correction.
The AMS article HTML was unavailable to the browsing tool, but the publisher
PDF was obtained directly and checked. These are the searches performed, not
a claim that every possible later discussion was exhausted.

## Validation and assembly actions

The packet validator reports **zero errors and zero warnings**. The source-issue
and version checks also pass. All 24 API names and 17 test names occur in the
suggested file. `lean-check` elaborated the corrected suggested file at the pinned Mathlib
commit with exit status zero and only `sorry` warnings. Memory available before
the check exceeded 20 GB. This validates signatures, not the placeholder proofs.

The orchestrator should retain the two follow-up gaps and apply the three
ownership proposals during assembly. In particular, align the inherited
`borel-comparison` and V.6 text with P.2 as scalar owner and R.7 as consumer;
replace the inherited numerical proof recipe with this explicit Fourier route;
and make the Milnor refinement the direct proof input for the inherited volume
endpoint. The additional E24 source evidence should accompany that assembly.
These actions reconcile the inherited parent prose with the accepted part's
explicit contracts; this review does not edit those other deliverables.
