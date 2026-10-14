# Independent package review: logarithmic potential theory and algebraic integers

Job: REV-PKG-LogarithmicPotentialTheoryAndAlgebraicIntegers · issue #9224  
Reviewer: Codex — codex-mB16pH · 2026-10-14  
Verdict: **needs_changes**

The package preserves all 69 accepted-plan targets, all 86 API names, and the
mathematical hypotheses needed by its representative Lean statements. Its
476-line Suggested.lean elaborates at the pins with only `sorry` warnings.
It is not ready for a draft upstream PR: its two Classical Arithmetic Completion
contracts have no supplying nodes, and the source-proof boundaries and native
application interfaces described below remain unresolved. This is a completed
independent review, not a checkpoint or a claim that admitted statements are proved.

## Corrections applied

1. Replaced assertions that CA.3 and CA.6 already supply the required arithmetic
   contracts by explicit required extensions. Kept their exact statements,
   consumers and source locators. Updated the late-trace Lean docstring and the
   downstream description consistently.
2. Added a direct, public Remez statement locator: Erdélyi (1993), Theorem 3.1
   and Corollary 3.2, printed p.173. The latter gives the exp(5) bound after
   substituting omitted length m⁻². This is distinct from the 1992 paper cited
   by Smith; it does not pretend that the sharp proof has been read.
3. Added a README Check and Lean example showing why domination requires
   positive mass: the zero-measure almost-everywhere premise at c=−1 is vacuous,
   whereas the global inequality is false.
4. Added a Lean example fixing the factor 2 in the external-field contribution
   to a probability's weighted energy.

No packet, source document, upstream roadmap or library was edited. No target
was deleted or reduced in generality.

## Unresolved inputs and exact resume points

**R3, CA.3:** Supply the primitive positive-leading rational gcd/Gauss bridge and
Smith Lemma 2.10's bounded squarefree combination. For nonzero integer Qᵢ of
maximum degree n and primitive gcd G, the coefficients for i≥2 range from 0 to
2(n−deg G); the quotient has degree n−deg G and is squarefree over ℚ. Preserve
nonunit constant quotients, including 4 from 4(X+1). README §5.5 and §5.6 need
this result. ClassicalArithmeticCompletion.json itself records this as an open
source-routed item PAPER-SMITH-24/17 and a gap titled “Sharper polynomial factor
bounds and squarefree combinations”; its normal-form nodes do not supply it.
The LP accepted plan requests it explicitly as R3. A supplier extension is
outside this review's editable files; moving it here would contradict the
accepted ownership boundary.

**R4, CA.6:** Supply the classical trace constant with the supremum-of-cofinite-
lower-bounds convention, and its equality with `cofiniteMean [0,∞) id`.
Prove that passing between conjugacy classes and monic minimal polynomials
preserves finite exceptions. README §11.3 and §12.3 need this bridge.
ClassicalArithmeticCompletion.json records PAPER-SMITH-24/1 and /3 as open and
has a gap titled “Classical trace constants and auxiliary-polynomial method”.
Its Pisot/Salem/Mahler nodes do not close R4. The analytic trace witness is
independent of this naming/indexing bridge.

**G1 and G2, source-proof boundaries:** Saff Theorem 2.8, p.182 supports the
full finite-energy domination statement, including atomic comparison measures,
but its proof is a sketch. Levenberg Proposition 2.7, p.12 supplies the
continuous comparison case, not the missing approximation passage. The added
Erdélyi source supports the sharp Remez statement and its numerical consequence,
but refers elsewhere for the sharp proof. README §1.6 and §3.7 correctly retain
these obligations as parts of their targets. A full freely readable or cleared
proof and its prerequisite decomposition remain to be obtained; this review
does not mark either inherited proof gap closed.

**G3 / R5–R6, native applications:** The accepted F3/honda-tate theorem gives
classification mathematics and the division-algebra multiplicity formula.
The two named DWP.1 abelian theorems give Weil absolute values and arithmetic-
Frobenius point counts. Their agreed native simple-class quotient, positive
natural dimension, finite rational-point count and compatibility adapters are
still needed. README §12.1–§12.4 states the four mathematical targets; omitting
synthetic carriers and their Lean signatures is correct under the current
package-shape rule. Keep these targets and connect the requested supplier
interfaces rather than supplying a proposition-valued simplicity surrogate.

The Caraiani–Newton order places GN in tier 3, CA in tier 5, and DWP in tier 11;
LP is outside its 94-roadmap list. It assigns no LP bundle or position. The
README's early LP export / late CA import is a layer-level separation, not
proof of an authorized roadmap bundle. Before upstream delivery, the maintainer
must reconcile this coupling and the native application suppliers with a build
order. No upward dependency was silently relabelled as a lower-tier import.

## Form, fidelity, API and definition tests

Read UPSTREAM_GUIDE.md, the atlas snapshot READMEs for ConformalMapping and
OneParameterSemigroups, and both current README/Suggested pairs as style
models. The package has
an opening Summary, scope and ownership, conventions, supplier contracts,
ordered Layers 0–12, prose statements, APIs, Checks, worked examples and
references. `metadata.toml` is the fitting single line `topic = "math.NT"`.
It contains mathematical targets, not process-status fields or source excerpts.

Read the whole accepted packet and package. All 69 targets, including the eight
later-added foundation/adapter targets, remain present. The 26 definition and
construction targets have at least three discriminating Checks each; the
README has 125 Check bullets after this review. Multi-definition subsections
cover each object separately: the five cofinite/certificate objects, the
capacity variants and the three weighted norms have their own computed or
negative instances. All 86 proposed API names remain in the README. The tests
distinguish singular from totalized logs, root multiplicity from sets of roots,
probabilities from zero measures, finite from infinite populations, rational
from integral squarefreeness, and endpoint branches from valid constructions.
No replacement of their existing tests was necessary.

Every README definition occurs either as a real-bodied Lean declaration or in
the closing list of README-only constructions. The Lean file contains 31 public
light definitions, 18 theorem signatures and 66 examples, plus private native
notation/integration helpers. Heavy equilibrium minimizers, quantile products,
Chebyshev choices, pruning, complementary polynomials, inversion, sweetening
and the Serre measure remain README targets. There are no sorry-bodied data
definitions, fake `True` statements or assumed application carriers.

## Source inspection

Random sample: 15 targets selected without replacement from the 69 nodes with
Python `random.Random(9224).sample`. Each locator below was opened and read,
along with the three inherited flagged boundaries. Printed pagination is used;
Smith locators refer specifically to arXiv v2, not the journal pagination.

| Sample target | Passage checked | Assessment |
|---|---|---|
| Quantile polynomial | Smith Definition 2.11, pp.9–10, (2.6) | Upper grid and endpoint convention agree. |
| Polar nullness | Levenberg Proposition 2.4 / Corollary 2.5, pp.10–11 | Finite energy and Borel exceptional sets retained. |
| Polynomial root law | Smith Definition 1.4, p.3; Lemma 2.7, p.7 | Multiplicities and positive degree retained. |
| Capacity continuity | Smith Proposition 2.5 proof, pp.36–37; Levenberg §2 Exercise 3, p.13 / Proposition 2.4 | Increasing Borel and decreasing compact cases separated. |
| Small squarefree polynomial | Smith Theorem 3.1, p.12; proof pp.19–20 | Rational squarefreeness and subexponential bound agree. |
| Chebyshev minimizer | Smith Lemma 4.2, p.23; Christiansen–Simon–Zinchenko Theorems 1.1, 1.4, 2.2–2.4, pp.218–219,222,227–229; §4, pp.236–237 | Convex-hull roots and finite-gap norm route agree. |
| Inverse interval potential | Smith Lemma 5.2, pp.32–33 | Finite value at zero separated from singular logAbs. |
| Coefficient adjustment | Smith Lemma 4.5, pp.24–25 | Descending parity corrections and root control agree. |
| Log-moment upper semicontinuity | Smith after Theorem 1.5, p.4; Theorem 5.11 proof, p.40 | Direction and finite resultant exceptions agree. |
| Interval equilibrium adapter | Saff Example 1.11, p.174; Smith Example 5.16, p.43 | Arcsine normalization and affine transport agree. |
| Log kernel | Smith Definition 2.1, p.5; Saff (1.8), p.171 | Sign and infinite diagonal agree. |
| Weighted zero limit | Smith Lemma 2.7, pp.7–8 | Root restriction, increasing degree and nth norm limit agree. |
| Explicit point-count constants | Smith Corollary 1.3, p.3; Proposition 5.13, p.41 | Square fields and sufficiently-large threshold retained. |
| Potential | Smith Definition 2.1, p.5; Saff (1.8), p.171 | Compact support controls the finite negative part. |
| Interior quantiles | Smith Lemma 4.9, pp.29–30 | Interior perturbation and shifted exponent agree. |

Additional inspection: Smith Lemma 2.10, p.9; Example 5.9, p.37;
Proposition 5.12, pp.40–41; Example 5.16, pp.42–43; Saff Theorem 2.8,
p.182; Levenberg Proposition 2.7, p.12; Erdélyi Theorem 3.1 / Corollary 3.2,
p.173. No sampled locator required a correction. G1/G2/G3 retain the limits
stated above; locating a theorem is not evidence that its complete proof or a
native interface has been obtained.

Public PDFs fetched on 2026-10-14 into disposable scratch only:

| Source / URL | SHA-256 |
|---|---|
| [Smith v2](https://arxiv.org/pdf/2111.12660v2) | `99b3855a176ddb280630f50cbed23039c1348417aad31d817f34c3b60f4a35a9` |
| [Saff](https://arxiv.org/pdf/1010.3760) | `cfbeaad8cf695fc1b5528fd56295d7e3053056634c6841765a434ce9b074d862` |
| [Levenberg](https://www.maths.tcd.ie/EMIS/journals/DRNA/pdf/levenberg-2012-wpt.pdf) | `461e6a5657bd7135d68ceaef422ce89bb6cafbd807c812243fdbb5c967277f37` |
| [Christiansen–Simon–Zinchenko](https://math.caltech.edu/SimonPapers/336.pdf) | `e79397783e4d928e6cafd1a2ea55a7654565479629ecbd95cd125c40d0faf1d2` |
| [Erdélyi](https://people.tamu.edu/~terdelyi/papers-online/JCAM.pdf) | `d0d28c6096c3ad51d619d98863dc1f1581ebd66084e8f6f2a871eb9762d2feba` |

## Prerequisites at the pins and current duplication audit

Read all 22 accepted-plan baseline declarations at Mathlib
`082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`. The shared build's relevant Tau Ceti
module bytes agree with that commit; its Mathlib checkout is at the exact pin.
The two qualified declarations `ContinuousMap.exists_restrict_eq` and
`DiffContOnCl.circleIntegral_sub_inv_smul` were read in their enclosing
namespaces, not discarded because a simple name search missed them.

The baseline checks covered empirical measure construction/integration,
probability weak convergence and Prokhorov compactness, positive-integral
Tonelli and support, resultant root products/base change and discriminants,
Eisenstein irreducibility, Tietze extension, geometric Hahn–Banach,
Stone–Weierstrass, both finite-grid Nullstellensatz declarations, Frullani,
both complex Cauchy declarations, the Chebyshev measure's mass, the planar
Newtonian kernel and its harmonicity, and the strong maximum principle.
Tietze is used for smoothing tests, never as a Remez theorem.
Additionally read `Measure.quantile`, `quantile_def` and `quantile_le_iff`
in TauCeti.Probability.Quantile at the pin: the inverse law needs 0<t<1;
compact-support endpoint t=1 is a separate adapter. The empirical sequence
constructor averages n+1 entries, so roots.length−1 gives the correct mass.

Read the GN.1 evaluation-polytope, volume, minima and cofactor contracts and
GN.4 covering/cofactor-adjustment targets. They now supply R1/R2: the minima
product uses D/(m+1)! and D, and cofactor adjustment permits either nonzero
leading sign with bound at most 9n log(2n). A simplex flatness statement would
not replace this ℓ1 covering estimate. Read the CA.3/CA.6 inventory and source
routing, F3/honda-tate and the two exact DWP.1 abelian statements for the
unresolved contracts above. `FoundationsAndLibraryIntegration` and `UPSTREAM:`
placeholders do not occur as package suppliers.

Current duplication comparison used TauCetiRoadmap main
`0d144d044dacebca17b654695b6f1ad58f159b27` and Tau Ceti
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`, read-only. Searched mathematical
families across the current tree, then read competing statements and relevant
README/Suggested sections. This included all nine newer families:
AlgebraicVectorBundles, DifferentialGeometry, IntegralLattices,
LocalGaloisGroups, OperatorTheory (its parts), OrthogonalSpinGroups,
PeripheralActions, ProfiniteArithmetic and RealAlgebraicGeometry; and the four
Completed roadmaps ContourIntegration, EffectiveBounds, OrthogonalL2Bases and
RestrictedProducts. Searches covered logarithmic energy/potential/capacity,
polar exceptions, variational external fields, Vandermonde/Fekete products,
polynomial minimizers and measurable-set estimates, interval-mass Hölder
control, quantile/root distributions, bounded squarefree combinations,
cofinite trace optimization and simple abelian Frobenius counts.

No additional owned target duplicates were found, so **no removals** were made.
Existing boundaries already defer the harmonic kernel/maximum principle,
Cauchy calculus, empirical probabilities, real quantiles, ordinary Chebyshev
polynomials and their mass-π measure. IntegralLattices §2F uses quadratic-norm
minima, whereas this package consumes arbitrary convex evaluation bodies from
GN. RealAlgebraicGeometry's root continuity, Sturm and CAD results do not give
large-degree weighted zero-law convergence. Completed OrthogonalL2Bases'
Chebyshev Hilbert basis/completeness does not give logarithmic equilibrium;
EffectiveBounds' ideal/field counts do not give bounded squarefree polynomial
combinations. Current TauCeti.Analysis.Polynomial.RootSum treats holomorphic
root sums in coefficients, and Polynomial.ResultantDiscriminant provides
algebraic root products: both differ from the asymptotic distribution target,
and the latter's resultant infrastructure is already imported. Completed
ContourIntegration's Cauchy/residue infrastructure remains a prerequisite.

## Adversarial mathematics pass: every accepted target

The following table records the instances and conventions checked. These are
mathematical checks, not proofs by Lean's `sorry`. The same hypotheses were
compared between the packet, README and representative Lean signatures.

| Target | Instance, boundary or convention checked; result |
|---|---|
| `LP.0/descent` | An atom approximated by smooth probabilities has infinite limiting energy; the lower semicontinuity direction is correct. Common compact support is retained. |
| `LP.0/energy` | Zero energy, atomic infinite energy, and unit-interval energy 3/2 fix the sign, mass and diagonal convention. |
| `LP.0/log-kernel` | Coincident points give +∞; distances 1 and 2 give 0 and −log 2. The planar kernel comparison excludes its pole. |
| `LP.0/potential` | Zero measure gives zero; an atom gives +∞ at its location; two unit atoms at 0,1 give −log 2 at 2. Negative-part finiteness uses compact support. |
| `LP.0/strict-energy` | Equal measures give zero difference energy, including two zero measures. Unequal masses are excluded; the cross term has coefficient −2. |
| `LP.1/capacity` | Empty/singleton capacity is zero; disk radius 2 gives 2; interval [−1,1] gives 1/2; unbounded inner capacity may be +∞. |
| `LP.1/capacity-continuity` | Decreasing disks with radii tending to zero have singleton intersection and zero limiting capacity. Increasing bounded Borel and decreasing compact domains remain distinct. |
| `LP.1/diameter-capacity` | A disk of radius 2 and [−1,1] distinguish diameter from twice capacity. Zero-capacity branches require no logarithmic division. |
| `LP.1/domination` | μ=ν=0,c=−1 makes the premise vacuous and conclusion false. Positive μ mass excludes it; atomic comparison ν remains allowed. Added a Lean negative control. |
| `LP.1/equilibrium` | The unit disk has zero potential at its centre; adding an isolated polar point changes no minimizer. Zero capacity is outside uniqueness. |
| `LP.1/frostman` | The disk and interval normalizations give the everywhere upper bound, with equality only quasi-everywhere on an arbitrary compact K. |
| `LP.1/polar` | Empty/countable sets pass, whereas [0,1] fails despite zero planar area. Quasi-everywhere failure is relative to K. |
| `LP.1/polar-null` | Dirac mass on a polar singleton fails the finite-energy hypothesis. Borel measurability is present for nullness and countable unions. |
| `LP.1/transfinite-diameter` | Two-point products fix exponent 2/(n(n−1)); repetitions give zero and n=0,1 are excluded. Nonzero affine scaling multiplies by its modulus. |
| `LP.2/external-field` | Zero field on a disk passes; all-infinite fields and singleton finite loci fail. An upward isolated spike fails lower semicontinuity. |
| `LP.2/weighted-energy` | Constant field 1 shifts probability energy by 2; a finite field leaves atomic energy infinite. Added the factor-two Lean example. |
| `LP.2/weighted-equilibrium` | At constant field c the minimizer is unchanged, V_Q shifts by 2c and F_Q by c. These constants are not identified. |
| `LP.2/weighted-norm` | Empty support gives zero; constant weight 2, exponent 3 and polynomial 1 give 8. Exponent zero recovers the uniform norm. |
| `LP.2/weighted-variational` | The constant-field witness gives U+c=F_Q on the regular support. Equality and lower bounds have their stated quasi-everywhere domains. |
| `LP.3/countable-components` | Empty sets pass; countable isolated components with accumulation are allowed; the Cantor set fails. A component is a set, not its chosen representative. |
| `LP.3/finite-interval-equilibrium` | The one-interval density has no gap numerator; two components require one gap zero and a vanishing period. Boundary singularities still permit exponent 1/2. |
| `LP.3/holder` | Zero measure passes every positive exponent; atoms fail by shrinking intervals. Exponent and control constant are strictly positive. |
| `LP.3/holder-potential` | Zero measure has continuous zero potential; atoms fail the Hölder premise. The quantitative potential exponent uses 0<η<1. |
| `LP.3/interval-equilibrium-adapter` | [−1,1] has mass 1 after division by π; coincident endpoints return zero. [−2,2] has capacity 1. |
| `LP.3/intervals` | A nondegenerate interval passes; an isolated extra point fails. The nonempty finite ordered-union convention prevents an empty-set capacity claim. |
| `LP.3/polynomial-root-law` | (X−1)²(X−2) gives masses 2/3,1/3; X²+1 uses the documented default δ0. Positive-degree splitting is required for root-average identities. |
| `LP.3/potential-field` | For the zero measure the weight is 1. The uniform [0,1] potential at 0 is 1, so its weight is exp(1), fixing the sign. |
| `LP.3/remez` | m=1 permits omitted length 1 and yields exp(5); m=0 is excluded. Arbitrarily dispersed measurable sets are allowed, not just intervals. |
| `LP.3/root-removal` | A simple linear root leaves a constant cofactor; the root itself is handled through the cofactor, not a division by its zero evaluation. |
| `LP.3/weighted-zero-limit` | Constant-degree and nonsplitting sequences are excluded. Positive degrees make nth roots valid; prescribed roots stay in one compact set. |
| `LP.4/admissible-measure` | Zero measure passes but is not a probability; δ_a for integer a fails on X−a. Probability hypotheses are added by consumers. |
| `LP.4/holder-extremizers` | The index n+1 starts at degree 1 and avoids 1/0. Both polynomial upper growth and a Hölder-based lower estimate are needed for limit 1. |
| `LP.4/integer-log-moment` | X at δ0 gives −∞; X at δ2 gives log 2; negative inputs use absolute value. Compact support bounds the positive part. |
| `LP.4/log-moment-upper-semicontinuity` | Approaching a polynomial zero gives the upper semicontinuity direction for logAbs. Distinct irreducibles avoid any fixed Q after finitely many terms. |
| `LP.4/quantile-estimates` | Distinct atomless quantiles make the Vandermonde nonzero. At a quantile root the polynomial magnitude and both stated pointwise bounds vanish. |
| `LP.4/quantile-polynomial` | n=0 gives 1. A half-uniform law on each of [0,1],[2,3] selects 1 at mass 1/2, and compactness supplies the level-1 endpoint. |
| `LP.5/gcd-norm-bound` | For 4(X+1), the primitive rational gcd is X+1 and quotient 4 is squarefree over ℚ. The required bounded-combination supplier remains missing. |
| `LP.5/holder-energy-nonpositive` | An integer Dirac cannot satisfy the admissible Hölder premises. Probabilities and the limiting norm-product exponent are retained. |
| `LP.5/integer-approximation` | A squarefree linear integer Q has nonzero derivative at its root. Negative leading coefficient is permitted by the GN cofactor supplier. |
| `LP.5/norm-product-lower` | Positive integer constant factors have modulus at least 1. The Vandermonde requires distinct nodes; the energy exponential retains its sign. |
| `LP.5/norm-product-upper` | m=0 is one-dimensional coefficient space with empty Vandermonde product 1. General m requires positive evaluation weights and the full integer lattice. |
| `LP.5/small-squarefree` | n≥2 avoids degenerate growth bounds; squarefreeness is over ℚ, not ℤ. Neither monicity nor roots in K is asserted. R3 remains missing. |
| `LP.6/chebyshev` | X²−1/2 alternates with norm 1/2 on [−1,1]; X on [−3,−1]∪[1,3] has a gap root. Degree-zero output is 1. |
| `LP.6/coefficient-adjustment` | Descending changes in [0,2] make coefficients even; root confinement belongs to the quantified controlled construction, not an arbitrary coefficient change. |
| `LP.6/complementary` | κ=2,C1=2 gives D=16; κ=3,C1=2 gives D=8. κ=1 invalidates the denominator. r=0 and parent degree zero have separate branches. |
| `LP.6/complementary-bounds` | At a root β the lower estimate is zero and grows linearly in |x−β|. A constant positive lower bound there would be false. |
| `LP.6/complementary-roots` | All 0≤j<D brackets are needed. Parent degree zero omits avoidance; a least feasible shift is not itself counted as forbidden. |
| `LP.6/pruned` | The empty retained product is 1; only the middle root can survive from (X+1)X(X−1). An endpoint of X(X−1) cannot survive on [0,1]. |
| `LP.6/pruned-chebyshev` | A single component still removes endpoint roots; gap roots may also be removed. The removed-factor estimate uses the convex hull, not false K-support. |
| `LP.7/interior-quantile` | Fixed negative shifts in the weighted exponent are allowed; quantile perturbations stay inside components rather than crossing endpoints. |
| `LP.7/real-construction` | For large n, floor(B sqrt(n) log n)<n. There are exactly n disjoint protected brackets and n roots; small degree is outside the threshold. |
| `LP.8/energy-nonpositive` | The conclusion includes finite energy, so polar-nullness is used only afterwards. Neither Hölder regularity nor countable components is a premise. |
| `LP.8/holder-reduction` | Countable singleton components carry no finite-energy mass; Cantor-type uncountably many components are outside this result. Interval smoothing must shift inward. |
| `LP.8/inverse-interval` | [1,4] has mean 2, not 5/2, with no endpoint atoms. a=0 uses the zero branch and is excluded from probability claims. |
| `LP.8/inverse-interval-potential` | z=0 uses logAbs(0)=−∞ in the inequality while Uν(0) is finite. Positive a,b and b−a justify all divisions. |
| `LP.8/smoothing` | Zero mass gives zero loss; mass M doubles the loss when doubled. The support shifts positively and need not remain in the original K. |
| `LP.8/sweetening` | ν=0 puts all mass in equilibrium; B=0 and mass-one ν leaves ν unchanged. κ=1,B=0 would divide by zero and is excluded. |
| `LP.9/realization` | Capacity 1 is outside the construction. At p=2, constant coefficient 2 mod 4 and all other nonleading coefficients even give Eisenstein irreducibility. |
| `LP.10/auxiliary-completeness` | S contains a compact subset of capacity >1, giving an infinite population. The mean minimum is attained; the cofinite quantity is a supremum of lower thresholds. |
| `LP.10/compact-reduction` | A constant objective on unbounded S fails the superlogarithmic growth assumption; on compact S that condition is vacuous. The auxiliary error is kept explicit. |
| `LP.10/optimization` | Empty or singleton polynomial populations give +∞, while a constant objective on an infinite population gives that constant. Empty certificate lists are permitted. |
| `LP.11/majorant` | Positive coefficients make zeros of auxiliary polynomials yield a +∞ potential majorant. Nonzero integer leading coefficients contribute nonnegative logarithms. |
| `LP.11/optimal-support` | X has boundary root 0 and does not meet the interior-root assumption; interior-root polynomials such as X−1 illustrate the correct domain. |
| `LP.11/serre-witness` | Exact rational parameters give C<0, L(X)>0 and mean in (1.898303,1.898304); a,b and all log arguments are positive. See rational enclosure below. |
| `LP.11/trace-bound` | The witness mean is strictly below 1.89831; translating that cofinite bound to the classical name requires the missing R4 indexing bridge. |
| `LP.12/point-count-asymptotics` | Square prime powers make translation by 2 sqrt(q) integral. Large-q thresholds keep both bases positive; no nonsquare or small-q conclusion follows. |
| `LP.12/point-count-explicit` | The strict gap below 1.89831 absorbs ε in both directions. Positive natural dimension is required for the normalized root and logarithm. |
| `LP.12/point-count-optimization` | q=1 fails capacity >1 and strict positivity of q+1−x; q=4 gives interval [−4,4] and argument at least 1. Both signs of the objective are used. |
| `LP.12/real-weil-bridge` | q=4,d=2,e=3 gives dimension 6 and cancels e in the normalized logarithm. Endpoint exceptions are finite, and classes, not representatives, are counted. |

### Exact numerical witness

Repeated the Serre witness calculation using Python Fraction arithmetic only.
Let a=87353/10⁶, b=4411076/10⁶ and γ=215485/10⁶. Square comparison encloses
sqrt(ab) strictly between 310371036756009/(5·10¹⁴) and
620742073512019/10¹⁵. For every required positive log argument x, put
y=(x−1)/(x+1) and use the first 80 terms of
2Σ y^(2k+1)/(2k+1). Its absolute tail is at most
2|y|¹⁶¹/(161(1−y²)); |y|<1 follows from x>0. Monotonicity encloses the
logarithm involving sqrt(ab). Exact rational comparison gives:

- −13/10⁸ < C < −12/10⁸;
- 14/10⁷ < L(X) < 16/10⁷;
- 1898303/10⁶ < mean < 1898304/10⁶.

These establish the three strict comparisons without treating rounded decimal
evaluations as certificates. The README's existing logarithm-series proof
route is retained; no computation or source text is committed as proof.

## Lean signature comparison and validation

Checked all 18 theorem signatures, exceeding the required sample of ten:

| Signature(s) | Hypotheses / normalization checked against README |
|---|---|
| `energy_descent`, `strict_energy` | Common compact support; weak probabilities; equal finite mass and finite energies; finite cross term. |
| `equilibrium_exists_unique`, `domination` | Compact positive capacity; positive μ mass; ν mass at most μ; finite μ energy only, atomic ν allowed. |
| `weightedEnergy_minimum_exists` | Compact K and lower-semicontinuous bounded-below field with nonpolar finite locus. |
| `holder_potential`, `weighted_zero_limit` | Positive Hölder exponent, η<1 for quantitative bound; splitting positive-degree roots in K; degree→∞ and weighted nth norm→1. |
| `logMoment_upperSemicontinuous`, `holder_extremizers` | Nonzero integer Q and common compact support; limsup ≤ limiting moment; every positive degree indexed by n+1. |
| `small_squarefree`, `chebyshev_finite_gap_bound` | n≥2 and squarefree after mapping to ℚ; finite nondegenerate interval union and positive Chebyshev degree. |
| `real_polynomial_rounding_margins` | Capacity >1, B>0, m<n, high coefficients even, ordered disjoint brackets and positive endpoint margins. |
| `admissible_energy_nonpositive`, `holder_reduction` | First has no component/Hölder premise; second adds countable components and strict capacity threshold. |
| `integer_conjugate_realization` | Probability support, countable components, capacity >1; injective monic irreducible positive-degree polynomials. |
| `auxiliary_completeness` | Closed countable-component S with a compact capacity>1 subset; continuous superlogarithmic objective; attained admissible minimum. |
| `serre_witness_numerics`, `trace_constant_bound` | Exact rational signs and strict mean interval; the cofinite trace bound is stated directly and its classical-name bridge remains required. |

Validation:

- `lean-check` on the final Suggested.lean: exit 0; 84 warnings, all
  `declaration uses sorry`; no errors or other warnings. More than 20 GB was
  available before compilation. No Lake build/update/cache or language server
  was run, and no upstream checkout was built.
- `python3 scripts/check_blueprint.py` on the unchanged accepted LP packet:
  0 errors, 0 warnings. Its three gaps and six requests remain visible;
  successful structural validation does not close them.
- `python3 research/blueprint/intake.py check-files` on the five changed
  deliverables/handoff: 0 problems.
- `git diff --check`: clean; review.json parses and uses the mandated reviewer
  id. No private path, source passage or section-by-section source summary is
  included in the deliverables.

The review is complete. Resolve R3/R4 in their supplier, the G1/G2 proof
boundaries, and the G3 native compatibility/build order before changing this
verdict to accepted. Preserve every present target and Check.
