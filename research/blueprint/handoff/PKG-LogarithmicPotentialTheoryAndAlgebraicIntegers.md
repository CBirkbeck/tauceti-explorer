# PKG-LogarithmicPotentialTheoryAndAlgebraicIntegers

Issue: #9180. Worker: Codex, session `codex-Lf7bto`. Date: 2026-10-14.
Claim confirmation: [bot receipt](https://github.com/CBirkbeck/tauceti-explorer/issues/9180#issuecomment-6161472067).

## Delivered

This is the complete package of the accepted target-level plan, not a checkpoint
and not an implementation. The README has all 69 targets in 13 layers, all 86
accepted API items, all 80 accepted checks, additional discriminating checks
(124 checks across the 26 definition/construction targets), worked examples for
every layer, exact supplier contracts, hypotheses and source locators. It is
written afresh in mathematical prose. Its order agrees with the corrected
packet rather than the older standalone reader.

Suggested.lean has 466 lines, 31 public real-bodied definitions, 18 representative
theorem signatures and 64 examples. Only native carriers and the light definitions
occur in its statements. The choices of minimizers, auxiliary polynomials,
inverse-interval measures and sweetening remain exact README targets. Its closing
comment accounts for the definitions/constructions absent from the Lean file.
All four finite-field application targets remain in the README; no synthetic
simple-class carrier or unconstrained real dimension was introduced.

The metadata category is `math.NT`. Only the three package files and this handoff
are deliverables. No packet, original reader, source file, atlas data, upstream
roadmap or current-library file was edited.

## Inputs and changes at the package boundary

The source of truth is the accepted
`research/blueprint/packets/LogarithmicPotentialTheoryAndAlgebraicIntegers.json`,
reviewed by `independent-review-REV-DESIGN-LogarithmicPotentialTheoryAndAlgebraicIntegers`
on 2026-10-11. The design and independent-review handoffs, original reader and
original suggested file were read. The upstream models read in full were current
ConformalMapping and OneParameterSemigroups, README and Suggested.lean together.
WORKERS, both protocols, UPSTREAM_GUIDE and the 2026-10-12 PACKAGE_REVIEW shape
govern this package; the original exhaustive suggested file was not copied.

Three ownership updates matter to the next worker:

1. The packet's general `quantile` definition is already in the pinned and current
   Tau Ceti library: `MeasureTheory.Measure.quantile`, in
   `TauCeti.Probability.Quantile`. The general function was removed from the
   intended declarations. Its CDF inverse-transform direction also belongs to
   the current OptimalTransport roadmap, Layer 3, item 7. The retained LP.4
   target constructs only the upper-grid polynomial and nearest-root distance,
   and proves the support, atomless exact-level and level-one endpoint adapter.
   `quantile_le_iff` applies only at 0<t<1; `quantile_def`, compact support and
   CDF continuity handle t=1. The gap example in §4.3 prevents replacing the
   least level point by the far edge of a CDF plateau. The packet was not edited.
2. R1 and R2 are now matched by the accepted GN.1 follow-up, reviewed on
   2026-10-12, at
   `research/blueprint/packets/GeometryOfNumbersAndQuadraticArithmetic--GN.1.json`.
   R1 imports `GN.1/evaluation-polytope`, `evaluation-polytope-volume` and
   `evaluation-polytope-minima`. R2 imports `GN.4/smith-cofactor-adjustment`,
   backed by the GN.1 cofactor/integer-functional/real-basis targets and
   `GN.4/l1-covering-transference`. No new GN Part II is planned here. The
   cofactor adjustment accepts either sign of leading coefficient and gives
   the stronger explicit bound below, hence the needed O(n log n) bound with
   C=9. Smith's cited simplex flatness does not alone apply to the cross-polytope;
   the accepted supplier supplies Gaussian ℓ1 covering instead. The GN package
   still needs to absorb that follow-up; this mapping is planning ownership,
   not a claim that the GN implementation exists. The stale R1/R2 extension
   text in the LP packet remains untouched, as this job requires.
3. The CA.6 indexing import is late, after LP.10. LP.0–2 have no reverse
   dependency on it. LP.10 owns the optimal admissible measure, and CA.6 is
   asked only for the classical name/indexing identification. The older
   restructure text that puts the optimal measure in CA.6 is superseded in
   the package boundary, without editing that text in the packet.

The GN cofactor bound imported is

```text
sum |beta_i| < 3 sqrt(2) n sqrt(log(8n)/pi) <= 9 n log(2n),  n >= 1.
P - R = sum beta_i Q/(X-alpha_i),   deg P, deg R < n.
```

All source-issue corrections E1–E13 survive: cofinite supremum, absolute
polynomial values, nonnegative minima, finite-mass smoothing, positive
perturbation weights, accumulating singleton components, finite energy as an
upper bound, gap roots in the convex hull, all D complementary levels, all n+1
cofactors, half-open shift coverage, distinct weighted constants, and energy
lower semicontinuity. No source passage was stored in the repository.

## Library and current-upstream audit

Pinned statements were read at Mathlib
`082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`. This includes the packet's 22 baseline
declarations and the additional native quantile interface. The README states
the needed hypotheses, rather than citing a name alone: finite/SFinite Tonelli,
bounded-continuous weak convergence, common compact support, bounded-size
resultant leading factors, prime-ideal/primitivity Eisenstein conditions,
grid-degree conditions, and harmonic-neighborhood/attained-maximum conditions.
The suggested imports are actually used: empirical measures, the Chebyshev T
measure, and the translated planar Newtonian kernel.

The separate current audit used TauCetiRoadmap main
`0d144d044dacebca17b654695b6f1ad58f159b27` and current Tau Ceti
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Searches used mathematical content
as well as intended names: singular log/distance kernels, diagonal infinity,
energy and capacity, weak root laws, CDF infima, Hölder interval mass,
finite-dimensional coefficient lattices, potential weights and roots,
irreducible integer polynomials, and simple finite-field dimension/count data.
Relevant definitions and theorem statements, not just search results, were read.

All nine post-snapshot families were included: AlgebraicVectorBundles,
DifferentialGeometry, IntegralLattices, LocalGaloisGroups, OperatorTheory
(including its split roadmaps), OrthogonalSpinGroups, PeripheralActions,
ProfiniteArithmetic and RealAlgebraicGeometry. The Completed directions
ContourIntegration, EffectiveBounds, OrthogonalL2Bases and RestrictedProducts
were checked through their README/current-library interfaces where Suggested
files are absent. Each of the 69 kept targets was compared with these searches
and the semantic interfaces listed in the following ledger.

Reused objects are native empirical probabilities, convolution, the general
real quantile, ordinary Chebyshev polynomials and its mass-π orthogonality
measure, planar harmonic kernel and maximum principle, Cauchy formulas and
native abelian varieties/isogenies. IntegralLattices' quadratic-norm minima
do not supply successive minima for the arbitrary polynomial evaluation body.
The kept root law, affine equilibrium law, singular energy and capacity are
adapters or objects with different defining data. No existing general
logarithmic-capacity, Fekete, Frostman, Remez or sweetening interface was found
that subsumes the kept target. Native geometric dimension is not yet the
positive natural simple-class dimension/count interface required by Layer 12.
No library or roadmap development command was run in the read-only checkouts.

## Adversarial pass, every target

The section numbers below are those of the delivered README. Each row records
an instance or a failed weakening used to check the defining data, hypotheses,
normalization, quotient or direction. The full exact contract is in that
section; this table is the audit record, not a second roadmap. All public Lean
signatures were checked against the corresponding contract as well.

| Target | Instance or excluded weakening | Result in the package |
|---|---|---|
| 0.1 kernel | k(0,0)=∞; k(0,2)=−log 2; planar kernel differs by 2π | Singular EReal diagonal and scalar fixed; native off-pole comparison tested. |
| 0.2 potential | Two unit atoms at 0,1 have U(2)=−log 2; uniform [0,1] has U(0)=1 | Finite mass bounds the negative part; real pushforward retained. |
| 0.3 energy | I(δ0)=∞, I(uniform [0,1])=3/2, I(0)=0 | Positive diagonal and zero-scaling convention retained. |
| 0.4 descent | Adding arbitrarily small atoms can make approximating energies infinite | Lower direction retained; common compact support and product weak convergence explicit. |
| 0.5 strict energy | μ=ν gives zero, unequal equal-mass finite-energy laws give a positive value | Equal mass and both finite self-energies retained; no undefined signed integral. |
| 1.1 capacity | Empty/singleton zero, radius-two disk two, [−1,1] one half | Empty infimum and affine absolute scale fixed; inner extension can be infinite. |
| 1.2 polar/q.e. | A countable set is polar; a real interval has area zero but positive capacity | Relative exceptional set retained; area-zero substitution excluded. |
| 1.3 polar nullity | An atom has infinite energy; finite-energy laws cannot charge a polar set | Borel restrictions and countable unions spelled out. |
| 1.4 equilibrium | [−2,2] has Robin constant zero; singleton has no finite-energy minimizer | Compactness/nonpolarity and finite-energy uniqueness retained. |
| 1.5 Frostman | Interval equilibrium has U=V on its interval, U≤V globally | q.e. lower/everywhere upper directions distinguished; support-boundary proof described. |
| 1.6 domination | A zero dominated measure makes the a.e. premise vacuous | Positive dominated mass and finite energy explicit; atomic comparison allowed; G1 open. |
| 1.7 capacity continuity | Increasing bounded Borel sets versus decreasing compact sets | Two different continuity contracts; no arbitrary Borel intersection rule. |
| 1.8 Fekete/diameter | Two points {0,2} give d2=2, but d3=0; unit disk limit one | Cardinality/exponent/finite-set branch fixed by checks. |
| 1.9 diameter=capacity | Diagonal atoms prevent using untruncated empirical energy | Upper kernel truncation contributes the M/n diagonal term before limits. |
| 2.1 field/weight | Constant zero, constant one, and identically ∞ fields | Nonpolar finite locus and lower bound explicit; exp(−Q) gives weights 1,e⁻¹,0. |
| 2.2 weighted energy | Constant-one field adds two to probability energy | Factor two fixed; bounded-field nonpolar sublevel supplies finite competitor. |
| 2.3 weighted equilibrium/Robin | Adding c shifts minimum by 2c but modified Robin constant by c | Both constants and uniqueness retained; no Saff E12 identification. |
| 2.4 variation | Constant fields agree with ordinary equilibrium; irregular sets allow polar exceptions | q.e. bounds and regular continuous special case kept separate. |
| 2.5 weighted norms | w=2,t=3,P=1 gives 8; empty K gives 0; uniform-law weight at 0 is e | Positive continuous weight assumptions bound norms; exponent and sign fixed. |
| 3.1 Hölder | Uniform [0,1] works; Dirac fails; zero measure works at positive η | Finite mass and positive exponent retained; no density-only definition. |
| 3.2 finite intervals | [0,1] works; adjoining {3} fails | Nonempty, nondegenerate, separated components required. |
| 3.3 Hölder potential | An atom would give an infinite pole | Full complex continuity, real exponent 0<η<1; no endpoint η=1 claim. |
| 3.4 potential field | For Q=−Uμ, Uμ+Q=0 and modified Robin constant zero | Sign checked; finite-energy μ gives nonpolar support. |
| 3.5 root law | (X−1)²(X−2) gives weights 2/3,1/3; X²+1 uses default δ0 | Multiset and positive-degree real splitting fixed; no root-set averaging. |
| 3.6 zero limit | Monic real roots in compact K versus arbitrary complex roots | Real support, diverging degree and nth-root norm limit retained; domination dependency visible. |
| 3.7 Remez | A measurable set of length 2−m⁻² need not contain a large interval | Measurable-set input and complex rotation retained; G2 not attributed to Tietze. |
| 3.8 root removal | A removable root can be nonreal or outside K; exponent n can be zero | Complex coefficient extension and polynomial loss explicit; degree-zero parent excluded. |
| 3.9 affine equilibrium | Native T measure has mass π; affine normalized law has mass one | π⁻¹ and scale 1/2 tested; invalid endpoints give zero. |
| 3.10 finite-interval equilibrium | One interval recovers arcsine density and −log((b−a)/4) | Gap-normalizing polynomial specified; square-root endpoint density gives Hölder bound. |
| 3.11 countable components | Empty set works; Cantor set fails; accumulating singleton components count | Countability, not finite-interval regularity or isolation, is the predicate. |
| 4.1 log moment | Lδ0(X)=−∞, Lδ2(X)=log 2, L0(Q)=0 | Singular zero and finite positive part retained. |
| 4.2 admissibility | Zero mass works; algebraic atoms fail; integer reflection/translation preserves it | Probability/support remain separate; weak-closure API named with later proof dependency. |
| 4.3 quantile polynomial | Uniform n=1 has root 1; n=2 first root 1/2; a gap plateau chooses its near edge | General quantile imported; upper grid, least level point, level-one and n=0 branches explicit. |
| 4.4 quantile estimates | Evaluating at a quantile root gives distance zero and polynomial zero | Absolute polynomial value, n²/2 energy factor and positive-degree denominators retained. |
| 4.5 moment semicontinuity | At a singular root the value falls to −∞ | Upper direction opposite energy descent; compact support bounds the positive part. |
| 4.6 Hölder extremizers | Upper-grid polynomials exist at every positive degree | Real-root law and norm limit one retained; no subsequence-only replacement. |
| 5.1 lower norm product | Vandermonde nodes and positive weights make D positive | Factorial and energy exponent kept; exact GN.1 volume/minima supplier used. |
| 5.2 upper norm product | Degree n interpolation has n+1 cofactor polynomials | E10 corrected cardinality retained; GN.1 upper-minima/volume contract imported. |
| 5.3 Hölder energy bound | Support can lie in many components but inside one enclosing interval | No unnecessary finite-interval assumption; admissible log moments force I≤0. |
| 5.4 integer approximation | 4(X+1) is squarefree over ℚ, but not over ℤ | Rational squarefreeness/content allowed; GN.4 adjustment imported; no monicity or root location added. |
| 5.5 gcd norm bound | A common factor can have positive degree and nonunit content | Primitive positive-leading rational gcd, quotient degree and ordered norms kept. |
| 5.6 small squarefree | Integral constants in a quotient are units over ℚ | Squarefreeness over ℚ; degree n≥2; no irreducibility/monicity/root-support promise. |
| 6.1 Chebyshev | On [−1,1], degree-two minimizer X²−1/2 has norm 1/2 | Uniqueness/alternation APIs retained; gap roots lie in convex hull, not necessarily K. |
| 6.2 pruning | Removing all gap roots and extreme roots can lower degree | Retained-root predicate alone gives no prescribed degree; next target supplies it. |
| 6.3 pruned bounds | A gap root may be outside K but inside its convex hull | Use convex-hull diameter loss and the 3k0 surplus, with all removed roots accounted for. |
| 6.4 parity adjustment | Top nonleading coefficient corrected by an ordinary monic Ti | Descending triangular correction and half-margin kept; not Ti powers with wrong degree. |
| 6.5 complementary choice | κ=3,C1=2 gives D=8; κ=2,C1=2 gives D=16; parent 1 uses N=0 | Ceiling, positive D, κ>1, all shift branches and parent-independent constants stated. |
| 6.6 complementary roots | Every j=0,…,D−1 is needed to obtain Dr roots | All D level intervals retained; least-shift coverage is [0,N), excluding its endpoint. |
| 6.7 complementary bounds | Close roots require isolated brackets before dividing by root distance | Lower slope and upper removal bounds have explicit distinct hypotheses and uniform constants. |
| 7.1 interior quantiles | An upper-grid root at an endpoint must move inward | Any fixed integral exponent shift allowed; roots and brackets stay inside K. |
| 7.2 real rounding margins | n−m is positive only beyond a threshold; high coefficients are even | m=floor(B√n log n), threshold and all disjoint positive endpoint margins retained. |
| 8.1 inverse interval | a=b invalid; valid law has mass one and mean √(ab) | Density, inverse pushforward and zero branch specified; a>0 makes inversion valid. |
| 8.2 inverse potential | log|z| has a pole at z=0 | Complex upper bound with equality on [a,b]; value at zero computed separately. |
| 8.3 smoothing | A mass-M law incurs M times the potential error | Tonelli/convolution, common compact support and M factor retained; not probability-only scaling. |
| 8.4 sweetening | κ>1 and finite B≥0 imply β<1 | All masses, support and individual polynomial-moment inequalities checked. |
| 8.5 admissible energy | I<∞ is the required side of finiteness | Hölder assumptions removed by smoothing/sweetening and lower descent; no E7 reversal. |
| 8.6 Hölder reduction | Accumulating singleton components are polar, not necessarily isolated | Interval exhaustion crosses capacity one, preserves support and yields diagonal weak convergence. |
| 9.1 realization | Integer rounding must preserve each sign-changing bracket | Monic even coefficients/odd constant give Eisenstein at 2; distinctness and all roots in K kept. |
| 10.1 optimization | Empty/singleton populations give cofinite value ∞; X−2 has mean 2 | Supremum direction, multiset average, nonzero auxiliaries, positive weights and empty certificate fixed. |
| 10.2 compact reduction | Preserving only the total admissibility predicate loses stronger moment bounds | Closed countable-component set, superlog growth and every individual moment inequality retained. |
| 10.3 completeness | Constant objective on a compact set has finite cofinite value when population is infinite | Extended suprema first, finite attained minimum later; no probability/support hypotheses hidden. |
| 11.1 majorant | A zero auxiliary would produce a singular false certificate | Nonzero Qi and positive weights; complex norm log, resultant leading factors and permitted perturbations explicit. |
| 11.2 witness | Exact a,b,γ give C<0, L(X)>0 and mean 1.898303… | Density/mass/Hölder API retained; exact rational certificate below replaces float-only evidence. |
| 11.3 trace bound | A strict mean bound gives a strict gap below 1.89831 | LP.10 optimization plus witness; CA.6 only identifies the classical notation. |
| 11.4 optimal support | Active constraints have zero moment; only roots in the interior are excluded | Endpoint/interior distinction kept; positive witness X moment alone says nothing about optimality. |
| 12.1 real Weil bridge | d=2,e=3 gives dimension 6 and the e-th power point product | Sole F3 classification and DWP arithmetic Frobenius imports; finite endpoint exceptions required both ways. |
| 12.2 point optimization | At q=4, interval capacity 2 and q+1−x≥1 | q>1, natural positive dimension and normalized logarithm fixed; e cancels. |
| 12.3 square asymptotics | Square q makes ±2√q integral; a nonsquare translation need not preserve integrality | Both inequalities, fixed compact support and sufficiently-large square q retained. |
| 12.4 explicit bounds | Strict λSSS gap absorbs ε, with positive point-count bases eventually | Infinitely many simple classes and large square prime powers only; no all-q claim. |

## Sources independently checked

The public PDF bytes matched the packet's recorded versions. Locators use
printed pages, not PDF viewer page indices. The mathematical passages used for
the retained statements, proof sketches and edge corrections were read. No
uncleared Saff–Totik or Ransford book was accessed. The private-library index was
consulted; these sources did not require any authorized private text.

| Source | Version/hash | Checked locations and limits |
|---|---|---|
| Smith | [2111.12660v2](https://arxiv.org/pdf/2111.12660v2), 16 March 2024; SHA256 `99b3855a176ddb280630f50cbed23039c1348417aad31d817f34c3b60f4a35a9` | Definitions 1.4, 2.1, 2.4, 2.11, 4.3, 4.6, 5.5; Theorems 1.5, 1.6, 3.1, 3.2, 5.11; Lemmas/Propositions in §§2–5 used by all arithmetic layers, printed pp.3–45. Proposition 3.4's minimum-direction error and the cofactor flatness issue are corrected through the GN supplier. Journal DOI metadata checked; journal full text not collated. |
| Saff | [1010.3760](https://arxiv.org/pdf/1010.3760); SHA256 `cfbeaad8cf695fc1b5528fd56295d7e3053056634c6841765a434ce9b074d862` | Kernel/energy and descent, pp.171–172; capacity and Frostman, pp.173–174; domination Theorem 2.8, p.182; Fekete diameter and weighted fields in §§1–2,6, pp.196–198. The full general domination proof is not supplied by this survey sketch. |
| Levenberg | [DRNA 5 (2012), 1–59](https://www.maths.tcd.ie/EMIS/journals/DRNA/pdf/levenberg-2012-wpt.pdf); SHA256 `461e6a5657bd7135d68ceaef422ce89bb6cafbd807c812243fdbb5c967277f37` | Proposition 2.1, p.8; diameter, polarity/nullity, Frostman and Proposition 2.7, pp.8–12; Exercise 3, p.13; weighted hypotheses/variation, §5, pp.23–24. Energy descent uses the corrected lower direction. Proposition 2.7 only proves the continuous comparison form. |
| Christiansen–Simon–Zinchenko | [author PDF](https://math.caltech.edu/SimonPapers/336.pdf), Invent. Math. 208 (2017), 217–245; SHA256 `e79397783e4d928e6cafd1a2ea55a7654565479629ecbd95cd125c40d0faf1d2` | Theorems 1.1,1.3,1.4, pp.218–222; band measures, reciprocal energy and Theorems 2.1–2.6, pp.227–232; §4 proof of uniform finite-gap bound, pp.236–237. Alternation/gap location and one-band-per-gap accounting checked. |

## Exact numerical witness certificate

This is an independently run rational computation, not a Lean proof. Put
`a=87353/10^6`, `b=4411076/10^6`, `g=215485/10^6`,
`u=(a+b+2 sqrt(ab))/4` and `cap=(b−a)/4=4323723/4000000>1`.
The rational square-root interval is

```text
620742073512018 / 10^15 < sqrt(ab) < 620742073512019 / 10^15.
```

Squaring both endpoints certifies it. For x>0, use y=(x−1)/(x+1),
the first 80 odd terms in `2 sum y^(2k+1)/(2k+1)`, and the two-sided error
`2 |y|^161 / (161(1−y²))`. Monotonicity transfers the u endpoint bounds.
Exact rational comparisons give

```text
-128586/10^12 < -log(cap)+g log(u) < -128585/10^12 < 0,
0 < 1451279/10^12 < (1−2g)log(u)+g log(ab) < 1451280/10^12,
1898303119178/10^12 < g sqrt(ab)+(1−g)(a+b)/2 < 1898303119179/10^12.
```

The last interval is strictly inside (1.898303,1.898304). This reproduces the
small negative potential offset and the positive X moment without relying on
rounded decimal signs. To reproduce the sign and trace decisions:

```python
from fractions import Fraction as F

def log_bounds(x):
    y = (x - 1) / (x + 1)
    s = 2 * sum((y**(2*k+1) / (2*k+1) for k in range(80)), F(0))
    r = 2 * abs(y)**161 / (161 * (1-y*y))
    return s-r, s+r

a, b, g = F(87353,10**6), F(4411076,10**6), F(215485,10**6)
lo, hi = F(620742073512018,10**15), F(620742073512019,10**15)
assert 0 < a < b and 0 < g < 1 and lo*lo < a*b < hi*hi
cap = (b-a)/4
assert cap > 1
lc, lab = log_bounds(cap), log_bounds(a*b)
ul = log_bounds((a+b+2*lo)/4)[0]
uh = log_bounds((a+b+2*hi)/4)[1]
assert -lc[0] + g*uh < 0
assert 0 < (1-2*g)*ul + g*lab[0]
ml, mh = g*lo+(1-g)*(a+b)/2, g*hi+(1-g)*(a+b)/2
assert F(1898303,10**6) < ml < mh < F(1898304,10**6)
```

## Remaining obligations and port order

The accepted plan explicitly retained three gaps and six supplier requests.
This package does not relabel them as proved or implemented. R1/R2 now have
accepted owners as above. The following remain:

- **G1:** full finite-energy complex domination proof. Saff Theorem 2.8 gives
  the exact statement, but the read public proofs do not establish its entire
  a.e.-to-everywhere generality with atomic comparison measures. The README
  retains the theorem and identifies this proof obligation. Narrowing to a
  continuous comparison potential would break the root-law application.
- **G2:** a full primary proof of the sharp measurable-set Remez input. Smith
  Lemma 2.8, p.8, invokes Erdélyi's Theorem 1. The reduction to exp(5) and to
  complex coefficients is specified, but this does not replace the sharp proof.
- **G3, R5/R6:** native simple finite-field isogeny classes, positive natural
  dimension and finite rational-point/Frobenius compatibility. The exact
  classification is already `F3/honda-tate`, and the exact weight/count imports
  are the two DWP.1 abelian nodes. Request only the native adapter, not another
  classification or purity theory. Add the four Lean application signatures
  when these carriers are supplied.
- **R3:** CA.3's bounded rational-squarefree combination and normalized
  primitive-gcd/divisibility bridge. The native multivariate grid and
  discriminant inputs do not already prove this output.
- **R4:** CA.6's classical cofinite-supremum SSS indexing identification,
  including conjugacy classes versus minimal polynomials. Optimal measure
  existence is LP.10's output and is not an extra CA.6 request.

The independent design handoff required an explicit coupling choice before
packaging. This package uses its permitted **coupled LP/CA boundary**, with
build order LP.0–10, CA.6 indexing, then the classical LP.11–12 consequences.
The witness computation itself is independent of CA.6. This records a proposed
bundle boundary; it does not edit or claim approval of upstream tier metadata.

The new roadmap is not assigned a tier in CaraianiNewton's 94-roadmap order.
GN is tier 3 (including the GN.4 covering target), CA is tier 5, DWP is tier 9,
and F3 is outside that list. The maintainer must place the coupled boundary
after its external suppliers, or split the early foundation from the late
applications when setting the port order. Do not port this full package ahead
of GN.4, the CA adapters, F3 or DWP. Do not create an early LP→CA.6 dependency
to resolve the naming bridge. Package review should retain all 69 mathematical
targets while confirming this port boundary; the job's four-file scope does
not authorize editing the tier file or sibling packages.

## Validation and next step

- `lean-check research/blueprint/packages/LogarithmicPotentialTheoryAndAlgebraicIntegers/Suggested.lean`:
  exit 0 at the stated pins; 82 warnings, all `declaration uses sorry`,
  no errors or other warnings. No background compiler or language server remains.
- `python3 scripts/check_blueprint.py research/blueprint/packets/LogarithmicPotentialTheoryAndAlgebraicIntegers.json`:
  0 errors, 0 warnings. This read-only check does not assert implementation or
  erase the packet's gap/request records.
- Mechanical coverage: 69 README sections, every accepted API name and check
  statement present, at least three checks for each of the 26 definition or
  construction targets, and every public Lean name present in the README.
- Exact rational witness computation passed all comparisons above.
- Submission path/format check and `git diff --check` are run on these four
  deliverables before opening the pull request; the PR reports their outcome.

Next step is an independent package review, followed by the maintainer's port
ordering. There is no unfinished package-writing task to resume. The source
proof and supplier-interface obligations above are the durable worklist; all
scratch PDFs, scripts and logs can be deleted after the PR opens because their
versions, mathematical results and reproducible certificate are recorded here.
