# Continued fractions and ergodic methods — PM.4

This layer develops pointwise ergodic averages, the Gauss dynamical system and its metric continued-fraction statistics. It also applies homogeneous dynamics to the precise modular quotient and positive diagonal semiorbit specified below. Its objects use the native Mathlib continued fractions, matrices, measurable spaces, filtrations and conditional expectations.

The [packet](../packets/ProbabilisticAndMetricNumberTheory--PM.4.json) gives the declaration graph. The [suggested file](../suggested/ProbabilisticAndMetricNumberTheory--PM.4.lean) gives signatures and examples. The [parent packet](../packets/ProbabilisticAndMetricNumberTheory.json) supplies 46 PM.4 declarations by their existing identifiers. The prefix of every new identifier below is `ProbabilisticAndMetricNumberTheory:PM.4/`; a short identifier always means that prefix. Imported declarations retain their statements, APIs, tests and six planet assignments. Every declaration is a specification; none is asserted implemented.

## Conventions and targets

Let (A_n f(x)=n^{-1}\sum_{j=0}^{n-1}f(T^j x)), using the native `birkhoffAverage`, with (A_0=0). The pointwise theorem is for a probability-preserving measurable endomap and an integrable real observable. Its limit is native conditional expectation on the **strict** invariant sigma-algebra: an invariant measurable set satisfies (T^{-1}B=B). An almost-everywhere invariance assertion alone is insufficient when constructing a measurable function on this sigma-algebra.

For continued fractions set

\[
 I=[0,1],\qquad D=(0,1)\cap\{x:x\text{ is irrational}\},\qquad
 m=\operatorname{vol}|_{(0,1)},\qquad
 T(x)=\operatorname{fract}(1/x).
\]

The inherited total map has (T(0)=0). Its invariant probability is

\[
 d\mu_G(x)=h(x)\,dm(x),\qquad h(x)=\frac1{(1+x)\log2}.
\]

The density lies between (1/(2\log2)) and (1/\log2) on (I); hence (m) and (mu_G) have the same null sets. Every Gauss iterate preserves (D). Digits are indexed from zero: (a_j(x)=\lfloor 1/T^j x\rfloor\) on (D), so (a_0) is the first positive partial quotient. On rational points termination and the inherited zero sentinel are retained. Those points are removed only by an explicit conull argument.

The layer has these named targets:

| Target | Exact output |
|---|---|
| Pointwise ergodic theorem | (A_n f\to \mathbb E_\mu[f\mid\mathcal I_T]) almost everywhere; for an ergodic system the limit is (int f,d\mu). |
| Gauss invariance, exactness and mixing | Native measure preservation; null/conull pullback tail events; strong mixing of measurable-set correlations. |
| Digit and word frequencies | One conull irrational set supports every positive digit and every finite positive word, with frequency equal to its Gauss mass. No independence of successive digits is assumed. |
| Khinchin's theorem | The geometric mean of the first (N) digits tends to the inherited Khinchin constant (K). |
| Lévy's theorem | (log q_N/N\to\pi^2/(12\log2)), for native denominator (q_N=(\operatorname{GenContFract.of}x).\mathrm{dens}(N)). |
| Gauss–Kuzmin theorem | The (n)-th digit marginal under (m) differs from its Gauss mass by at most ((9/10)^n). |
| Modular homogeneous Birkhoff application | Haar-almost-everywhere time-one averages on (mathrm{SL}_2(\mathbb R)/\mathrm{SL}_2(\mathbb Z)) tend to the Haar integral. |
| Continued-fraction/diagonal-orbit comparison | For irrational (0<x<1), bounded digits are equivalent to compact closure of the positive diagonal semiorbit. Typical (x) has a noncompact semiorbit closure. |

## Pointwise averages: finite coloring to native conditional expectation

Four usable objects organize the proof: `upperOrbitTruncation`, `firstOrbitHit`, `greedyOrbitBlocks` and `orbitLimit`. Their APIs and distinguishing examples appear in the declaration catalogue.

For nonnegative (f), take the extended nonnegative limsup of the **positive-length** averages. Define (U_L), for (L\ge0), by truncating that limsup at (L) **before** taking its real value. This keeps (0\le U_L\le L) even when the untruncated limsup is infinite. The finite-average recurrence proves strict invariance (U_L(Tx)=U_L(x)), including the infinite case by arbitrary finite thresholds. Countable suprema and infima prove measurability.

The first hit (	au(T,f,c,x)) is the least (n\ge1) with (A_n f(x)>c(x)), and zero when there is no crossing. Zero is a sentinel, never a block length. The fiber of a positive value is one measurable crossing set minus the finitely many earlier crossing sets; the zero fiber is a countable complement.

Greedy coloring is a finite list of triples (start, length, blue). At a start (k<N), a permitted positive length (sigma(k)\le M) becomes a blue block if it fits. A zero or overlarge length becomes a red singleton. A permitted length that overruns (N) ends the construction. Every appended block advances; the list covers an initial segment, and the uncovered terminal interval has fewer than (M) points. These four properties are separate API declarations, with tests for empty input, unit blocks, boundary overrun and the zero sentinel.

For (g\ge0) strictly invariant, (arepsilon>0), (N\ge M\ge1), and a positive crossing at each orbit point, summing blue blocks gives

\[
 \sum_{k<N}\left(f(T^k x)+g(x)\mathbf1_{\{\sigma(k)>M\}}\right)
 \ge (N-M)(g(x)-\varepsilon).
\]

When (g(x)<\varepsilon), the right side is nonpositive and the inequality follows from nonnegativity. Red singleton costs are charged to the bad set. With (g=U_L), crossings exist everywhere. Integration and preservation give

\[
 \int f\,d\mu\ge\int_{\{\tau\le M\}}U_L\,d\mu-\varepsilon-ML/N.
\]

Take (N\to\infty), then (M\to\infty), then (arepsilon\downarrow0). This proves (int U_L\leint f). Only after that take (L\to\infty) by extended nonnegative monotone convergence. The resulting bound proves finite limsup almost everywhere.

Fatou's lemma makes the extended liminf finite almost everywhere and its real representative (ell) integrable, with (intell\leint f). The infinite exceptional set is invariant; put (ell=0) there. On the conull complement choose the first (n\ge1) with (A_n f<\ell+\varepsilon), by applying the first-hit construction to (-f). The other finite coloring inequality is

\[
 \sum_{k<N}\min(f(T^k x),M)\mathbf1_{\{\theta(T^k x)\le M\}}
 \le N(\ell(x)+\varepsilon)+M^2.
\]

Inside a blue block, the truncated summands are at most the untruncated nonnegative sum; red starts contribute zero. Each terminal term is bounded by (M). Integration, (N\to\infty), (M\to\infty) under domination by (f), and (arepsilon\downarrow0) prove the reverse integral inequality. Liminf is at most limsup, and their nonnegative difference has zero integral, giving almost-everywhere convergence.

An integrable observable need only be almost everywhere strongly measurable. Use the native measurable representative and intersect all forward pullbacks of its agreement set. That intersection is conull and forward invariant, so **all** orbit averages agree on it. Positive and negative parts then give the signed theorem.

`orbitLimit` is the unique finite real limit where one exists and zero elsewhere. The finite-average recurrence proves that convergence at (x) is equivalent to convergence at (Tx), with the same limit. Thus the totalized limit is strictly invariant at every point. For a measurable input its convergence set is measurable by the real Cauchy criterion, and its restriction is a measurable pointwise limit.

Bounded observables converge in (L^1) by dominated convergence. For a general integrable observable, clip a measurable representative to ([-C,C]). Averages contract the (L^1) distance to this truncation; Fatou bounds the distance of their limits by the same error. The two errors and bounded convergence prove (L^1) convergence. On a strictly invariant measurable set (B), every average has integral (int_B f), so the limit has the same integral. Native conditional-expectation uniqueness now identifies `orbitLimit` almost everywhere with (mu[f\mid\mathcal I_T]).

Every preservation-of-integral step uses native `integral_map` and the preservation map identity. The embedding version of `MeasurePreserving.integral_comp` requires injectivity and cannot be substituted for a general endomap. The existing Tau Ceti (L^1) mean theorem with an (L^2) hypothesis is also not substituted for the arbitrary-integrable pointwise theorem.

## Cylinders and native continued fractions

For a finite natural word (w=[a_0,\ldots,a_{n-1}]), define

\[
 C_w=\{x\in D:a_j(x)=a_j\ (j<n)\},\qquad
 v_w=v_{a_0}\circ\cdots\circ v_{a_{n-1}},\quad v_a(y)=\frac1{a+y}.
\]

The empty cylinder is (D); any word containing zero has empty cylinder. Inverse-word functions are total, but all geometry requires positive entries. Rational endpoints are excluded by the cylinder definition. The ordered native matrix product is

\[
 W_w=\prod_{a\in w}\begin{pmatrix}0&1\\1&a\end{pmatrix}
 =\begin{pmatrix}p_{n-1}&p_n\\q_{n-1}&q_n\end{pmatrix},\qquad
 v_w(y)=\frac{p_{n-1}y+p_n}{q_{n-1}y+q_n}.
\]

For the empty word the matrix is identity, with formal (p_{-1}=1,q_{-1}=0,p_0=0,q_0=1). For nonempty words its entries agree with native `GenContFract.of` numerators and denominators. The native integer/fractional-part stream at (n+1) has integer part (a_n(x)) and fractional part (T^{n+1}x). This index bridge, native irrational nontermination and native continuant recurrence supply the matrix comparison; no second continued-fraction carrier is introduced.

The determinant is ((-1)^n), (q_n\ge1), and (0\le q_{n-1}\le q_n). Thus

\[
 v_w'(y)=\frac{(-1)^n}{(q_n+q_{n-1}y)^2}.
\]

Native Fibonacci lower bounds give (q_n\ge\operatorname{fib}(n+1)). Cylinder closures have diameter at most (operatorname{fib}(n+1)^{-2}), tending to zero. Each positive cylinder is an inverse image of (D) by its word branch and has positive mass. The derivative ratio is at most four; the inherited Rényi inequalities follow with that constant and the unsigned absolute Jacobian.

The exact orbit-product identity is

\[
 \prod_{j<N}\frac1{T^j x}=q_N+q_{N-1}T^Nx,
\]

with (q_{-1}=0) for (N=0). Since the ratio to (q_N) is between one and two, the logarithmic difference is between zero and (log2). This is the native denominator bridge needed by Lévy's theorem, including the zero-length case.

## Cylinder filtration, exactness and strong mixing

`gaussCylinderFiltration` is the native increasing filtration (F_n) generated by (D) and cylinders of length at most (n). Its positive-mass atoms are precisely the length-(n) positive cylinders; (D^c) is a null atom. At depth zero it is exactly the sigma-algebra generated by (D), and is not the full Borel sigma-algebra.

The shrinking-cylinder argument generates the **Borel trace on (D)**: every Borel (B) has (B\cap D) measurable for (igvee_n F_n). It does not generate arbitrary distinctions outside (D). Relative open subsets are countable unions of sufficiently small cylinder prefixes. Native upward conditional-expectation convergence is applied to the strongly measurable representative (mathbf1_{B\cap D}), which agrees with (mathbf1_B) almost everywhere.

On a length-(n) cylinder, native conditional expectation of (mathbf1_B) is the cell ratio (m(B\cap C_w)/m(C_w)). If (B) is measurable for the pullback tail (igcap_n T^{-n}\mathcal B), it is exactly (T^{-n}B_n) for a Borel (B_n). Gauss preservation and the density bounds imply

\[
 m(B_n)\ge(\log2)\mu_G(B)\ge m(B)/2.
\]

Rényi's factor four gives the conditional-expectation lower bound (m(B)/8) on (D). Its upward almost-everywhere limit is (mathbf1_B). If (m(B)>0), that limit cannot vanish on a set of positive measure; hence (B) is conull. Equivalence of measures gives Gauss exactness.

For a general probability-preserving exact system, the pullback sigma-algebras form an antitone family with (F_0) ambient. The pinned Tau Ceti downward convergence theorem gives (L^1) convergence of (mu[\mathbf1_A\mid F_n]) to the tail conditional expectation. The pinned trivial-sigma-algebra theorem identifies that tail expectation with the constant (mu(A)). Integrating over (T^{-n}B) gives

\[
 \left|\mu(A\cap T^{-n}B)-\mu(A)\mu(B)\right|
 \le\int\left|\mu[\mathbf1_A\mid F_n]-\mu(A)\right|\,d\mu\longrightarrow0.
\]

This is the inherited exactness-to-mixing API. The abstract upward and downward martingale theorems are library suppliers, not new PM.4 targets.

## Logarithmic statistics and constants

The first-digit probability is

\[
 p_a=\frac{\log((a+1)^2/(a(a+2)))}{\log2},\quad a\ge1.
\]

Native logarithm bounds give (log(1+u)\le u) and (log a\le2\sqrt a). Consequently (log(a)p_a) is bounded by a constant times (a^{-3/2}). Native real p-series summability and the measurable digit partition prove integrability of (log a_0) and the formula (int\log a_0\,d\mu_G=\sum_{a\ge1}\log(a)p_a=\log K), with the corrected inherited product for (K). Pointwise ergodic averages and exponentiation give the geometric-mean theorem.

The observable (-\log x) is integrable for (m), with integral one, by native logarithm integration including the endpoint zero. Bounded density transfers integrability to (mu_G). Integration by parts first on ([epsilon,1]), followed by the native logarithmic boundary limit, gives

\[
 \int_0^1(-\log x)x^n\,dx=\frac1{(n+1)^2}.
\]

The geometric expansion of (1/(1+x)) is used on ((0,1)). Its summands after multiplication by (-\log x) have summable integrals of absolute values, so the native integral/sum interchange theorem applies. A false uniform-convergence claim at (x=1) is unnecessary. Separating even and odd terms of native (zeta(2)=\pi^2/6) gives

\[
 \int(-\log x)\,d\mu_G
 =\frac1{\log2}\sum_{n\ge0}\frac{(-1)^n}{(n+1)^2}
 =\frac{\pi^2}{12\log2}.
\]

The pointwise theorem applied to this observable, followed by the bounded logarithmic denominator error divided by (N), gives Lévy's limit.

## Quantitative transfer and the Gauss–Kuzmin target

The density transfer and normalized transfer act on native real functions:

\[
 (Lf)(x)=\sum_{a\ge1}\frac{f(v_a(x))}{(a+x)^2},\qquad
 (Pg)(x)=\sum_{a\ge1}h_a(x)g(v_a(x)),\qquad
 h_a(x)=\frac{1+x}{(a+x)(a+1+x)}.
\]

The total native infinite sum supplies values outside (I); all dynamics and convergence assertions are on (I). Continuous input on the compact interval gives absolute and uniform convergence. Both operators have linearity APIs. Positivity is retained, (P) preserves constants and interval bounds, and (Lh=h). The conjugacy is (P((1+\cdot)f)=(1+x)Lf). Unsigned branch change of variables gives the duality (int\psi Lf,dm=int(\psi\circ T)f,dm), and therefore the iterated pushforward density is (L^n1). The weighted integral (int Pg/(1+x)) equals (int g/(1+x)).

Use native (C^1) regularity **on the closed interval** and native within derivatives. If (|g|) and (|g'|) are bounded by (C), branch values and derivatives are dominated respectively by (2C/(a(a+1))) and (4C/(a(a+1))). The native open-domain termwise-derivative theorem is applied on ((0,1)). Uniform derivative convergence, continuity and native one-sided extension lemmas supply both endpoint derivatives. The native closed-domain characterization then proves (Pg) is (C^1) on (I).

Differentiating the weight sum gives (sum_a h_a'=0). Subtract (g(v_1(x))) in the derivative-weight sum. If (|g'|\le M), the mean-value inequality yields

\[
 |(Pg)'(x)|\le M\sum_{a\ge1}c_a(x),\qquad
 c_a=\delta_a|h_a'|+\frac{h_a}{(a+x)^2},\qquad
 \delta_a=\frac{a-1}{(1+x)(a+x)}.
\]

The absolute value is essential: (h_2'(1)=-1/72). The sufficient uniform bounds are

| Branch | Bound for (c_a) on (I) |
|---|---|
| (a=1) | (1/2) |
| (a=2) | (5/72), separating (delta_2|h_2'|\le1/36) and (h_2/(2+x)^2\le1/24) |
| (a=3) | (7/216) |
| (a=4) | (19/800) |
| (a\ge5) | (1/a^2), with total tail at most (1/4) |

For (a\ge3), (h_a'\ge0), and the combined rational coefficient has numerator (a(a-1)^2+(2+x)(1+x)^2) and denominator ((1+x)(a+x)^3(a+1+x)^2). The (a=3,4) inequalities clear positive denominators and reduce to polynomials with nonnegative coefficients. For (a\ge5), bound the numerator by (a(a-1)^2+12\le a(a+1)^2), and the denominator below by (a^3(a+1)^2). Telescoping (1/(a(a-1))) bounds the reciprocal-square tail. Thus

\[
 \sum_a c_a(x)\le\frac{18913}{21600}<\frac9{10},\qquad
 \|(P^ng)'\|_\infty\le(9/10)^n\|g'\|_\infty.
\]

The preserved weighted mean is (c=(\log2)^{-1}int g/(1+x),dm). Integrating the mean-value bound between (x) and (y) against the normalized weight gives (|P^ng(x)-c|\le(9/10)^nM). For (g_0=1+x), (M=1), (c=1/\log2), and conjugacy implies

\[
 |L^n1(x)-h(x)|\le(9/10)^n\quad(x\in I).
\]

Integrate over a first-digit cylinder to obtain the digit-marginal error uniformly in (a\ge1). This discharges the inherited existence of constants (C>0), (0<\rho<1), with the explicit sufficient choice (C=1,\rho=9/10). This target does not require a new Lipschitz Banach-space carrier, abstract Hennion theorem or optimal Gauss–Kuzmin–Wirsing rate.

## Homogeneous dynamics: exact consumers and ownership

Take native (G=\mathrm{SL}_2(\mathbb R)), with (Gamma) the image of the entrywise integer inclusion, and (X=G/\Gamma) with quotient topology and Borel sigma-algebra. Let (mu_X) be the normalized (G)-invariant Haar probability. Fix

\[
 a_t=\begin{pmatrix}e^t&0\\0&e^{-t}\end{pmatrix},\qquad
 u_x=\begin{pmatrix}1&x\\0&1\end{pmatrix}.
\]

`GeometryOfNumbersAndQuadraticArithmetic:GN.4` owns the lattice and Haar construction, continuous left action, Mahler compactness, homogeneous ergodicity and Howe–Moore theorem. The request specifies its concrete quotient interfaces and **strong mixing of the time-one map** (z\mapsto a_1z). Ergodicity of the continuous flow alone does not imply this discrete map is ergodic. Restriction of Howe–Moore along the escaping sequence (a_n) provides the required mixing; the PM.4 pointwise theorem then supplies Haar-almost-everywhere integral limits. This does not establish a pointwise limit at every (u_x\Gamma), or equidistribution along a horocycle.

`DiophantineApproximationAndTranscendence:DT.0` owns badly approximable numbers. The request is the exact criterion, for irrational (0<x<1), that bounded native continued-fraction digits are equivalent to

\[
 \exists c>0\ \forall q\in\mathbb N,\ q\ge1\Longrightarrow
 q\,|qx-\operatorname{round}(qx)|\ge c.
\]

For such a lower bound, a nonzero integer vector ((p,q)) in (a_tu_x\mathbb Z^2), (t\ge0), has maximum norm at least (min(1,\sqrt c)). If (q=0), use (|p|\ge1). Otherwise nearest-integer minimality bounds the product of its two scaled coordinates below by (c). Conversely a uniform maximum-norm lower bound (0<\delta\le1) gives (q|qx-\operatorname{round}(qx)|\ge\delta^2/2): choose (p=-\operatorname{round}(qx)), (t=\log(2q/\delta)\ge0), so the second coordinate is (delta/2) and the first must be at least (delta). GN.4 Mahler compactness now yields the compact-closure criterion.

The source uses row lattices and (Gamma\backslash G). Transpose maps that class to (g^T\Gamma), preserves the integer subgroup, and changes right diagonal action to left diagonal action. Source time (s), with diagonal entries (e^{s/2},e^{-s/2}), equals (2t). The requested quotient homeomorphism and the explicit coordinate comparisons preserve relative compactness. Rational (x=0) has a vector tending to zero and is excluded from the bounded-digit criterion.

On one conull irrational set, every positive digit has its strictly positive frequency. A bounded sequence would omit its next larger digit. Hence (m)-almost every (x) has an unbounded digit sequence and a semiorbit whose closure is not compact. No rate of cusp escape is asserted.

## Library boundary, coverage and atlas

The pins are Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. Exact declarations and their proof-sensitive hypotheses are listed in `baseline.declarations`. In particular, upward CE convergence needs a representative strongly measurable for the filtration supremum; downward convergence needs an antitone family bounded by the ambient sigma-algebra; native strict invariants require pointwise preimage equality; closed-interval differentiability is supplied separately at both endpoints.

The continuation has complete planning coverage of PM.4. The stage is **planned**, with two precise owner requests and no unassigned mathematical gaps. GN.4 and DT.0 must supply the requested contracts, and assembly must connect their exact declaration identifiers to these consumers. These owner requests prevent declaring the stage closed. Abstract spectral results are not outstanding requirements of the chosen digit-marginal target.

The six inherited planets remain: **Pointwise ergodic theorem**, **Gauss map**, **Gauss measure**, **Khinchin geometric mean theorem**, **Lévy denominator theorem**, and **Gauss–Kuzmin theorem**. This continuation adds no planet. The restructuring proposal records four possible sublayers for atlas assembly: pointwise ergodic theory, Gauss dynamics, metric continued fractions, and homogeneous number-theory consumers. Generic homogeneous theory remains GN.4-owned and the badly approximable criterion remains DT.0-owned.

## Source discipline and acceptance

The source and version tables in the packet record the acquired public files, dates, hashes and exact passages read. The pointwise proof uses [Sarig's ergodic-theory notes](https://www.weizmann.ac.il/math/sarigo/sites/math.sarigo/files/uploads/ergodicnotes.pdf), the cylinder/exactness proof uses [Sarig's transfer-operator course](https://www.weizmann.ac.il/math/sarigo/sites/math.sarigo/files/uploads/transferoperatorcourse-bonn.pdf), and logarithmic statistics use [Glasscock–Merriman–Robertson–Smyth's final UNCG notes](https://uncg.edu/~cdsmyth/UNCG_Ergodic_Theory_Summer_School_2020_Final_Lecture_Notes.pdf). The quantitative proof specializes [Peng Sun's arXiv v2](https://arxiv.org/pdf/1705.02921v2) and supplies the absolute-coefficient bound proved above. The homogeneous convention and short-vector comparisons use [Gorodnik's first TIFR lecture](https://www.math.uzh.ch/gorodnik/tifr/lecture1.pdf). No whole-book reading is claimed.

The parent source register supplies its corrections under their existing identifiers and verdicts. Its E23 and E25 allegations were rejected and are not treated as errors. The new EPM4-1 records the signed-coefficient proof gap in Sun's acquired arXiv v2, without claiming the existence theorem false. EPM4-2–EPM4-6 record the missing constant, closedness hypothesis, separation exponent, iteration formula and operator typo noticed in Sarig's Hennion appendix. EPM4-7 records an incidentally read functional-divergence quantifier error in the next appendix; it has no PM.4 consumer. EPM4-8 corrects the space symbol in the unused Conditional Closure Lemma. These are observations for independent verification. Bounded author/arXiv/publisher correction searches found no correction. The Sun publisher abstract and metadata were read; its full version-of-record text was not acquired, so the finding is restricted to the arXiv proof.

Acceptance requires the 32 specified examples to distinguish the objects, all API statements to match the catalogue, no new identifier to replace an imported parent object, every nonroutine dependency to be a listed native declaration, imported node or owner request, and the conditional-expectation and endpoint hypotheses above to survive implementation. The explicit rational transfer bounds require independent proof checking; signature elaboration does not prove them. Numerical agreement alone cannot establish an almost-everywhere limit or a source correction.

## Declaration catalogue

The catalogue below is organized by object and proof chain. Each entry gives its exact mathematical statement, direct prerequisites, proof steps, source scope and acceptance conditions. Definition and construction entries also give every proposed API item and every unit test.

<!-- generated-catalogue -->

### Finite averages and conditional expectation

#### upper-orbit-truncation — Finite truncation of an extended orbit limsup

**Definition.** For arbitrary T:Ω→Ω, real f, L≥0 and x, define U_L(T,f,x) as the real value of min(limsup over n of ENNReal.ofReal(A_(n+1)f(x)), ENNReal.ofReal L). A_n is native birkhoffAverage real T f n. The minimum is finite even before any integrability assertion.

**Direct prerequisites:** `mathlib:birkhoffAverage`.

**Construction or proof:**

1. Take the extended-nonnegative limsup along positive averaging lengths, truncate in ENNReal, then take its real value.

**Uses:**

- `upper-coloring-integrated`: The bounded invariant threshold makes finite coloring integrable.
- `upper-truncation-bound`: Monotone removal of L preserves possible infinite limsup.

**API:**

| Declaration | Role | Statement | Proof node |
|---|---|---|---|
| `upperOrbitTruncation_bounds` | relation | For L≥0, 0≤U_L(x)≤L. | `upper-truncation-bounds` |
| `upperOrbitTruncation_measurable` | structure | If T and f are measurable, U_L is measurable. | `upper-truncation-measurable` |
| `upperOrbitTruncation_comp` | compatibility | For pointwise f≥0 and L≥0, U_L(Tx)=U_L(x). | `upper-truncation-invariant` |

**Unit tests:**

- `upper_truncation_zero` (degenerate): For f=0 and L≥0, U_L=0.
- `upper_truncation_constant` (computation): For f=constant c≥0, U_L=constant min(c,L); in particular c=3,L=2 gives 2.
- `upper_truncation_infinite` (non-example): For Ω=natural, T(k)=k+1, f(k)=k and L≥0, U_L(0)=L, although the untruncated limsup is infinite.

**Acceptance:** The exact displayed hypotheses and conventions appear in the suggested signature.

**Source:** [Omri Sarig](https://www.weizmann.ac.il/math/sarigo/sites/math.sarigo/files/uploads/ergodicnotes.pdf), Theorem 2.2, physical pp.45–48, finite coloring proof. Declaration-sized refinement of the finite orbit argument; all extended-real and measurable-representative conventions are stated explicitly here.

#### upper-truncation-bounds — Bounds on the truncated limsup

**Lemma.** For L≥0 and all T,f,x, 0≤U_L(T,f,x)≤L.

**Direct prerequisites:** `upper-orbit-truncation`.

**Construction or proof:**

1. The ENNReal minimum is at most the finite ENNReal.ofReal L; apply monotonicity of the real-value map on finite values.

**Acceptance:** The exact displayed hypotheses and conventions appear in the suggested signature.

**Source:** [Omri Sarig](https://www.weizmann.ac.il/math/sarigo/sites/math.sarigo/files/uploads/ergodicnotes.pdf), Theorem 2.2, physical pp.45–48, finite coloring proof. Declaration-sized refinement of the finite orbit argument; all extended-real and measurable-representative conventions are stated explicitly here.

#### upper-truncation-measurable — Measurability of the truncated limsup

**Lemma.** For measurable T and measurable real f, U_L(T,f,·) is measurable for every L≥0.

**Direct prerequisites:** `upper-orbit-truncation`, `mathlib:birkhoffAverage`.

**Construction or proof:**

1. Every finite orbit average is measurable by finite sums and measurable iterates.
2. Write the limsup as the countable infimum of countable suprema, then compose with minimum and ENNReal.toReal on its bounded range.

**Acceptance:** The exact displayed hypotheses and conventions appear in the suggested signature.

**Source:** [Omri Sarig](https://www.weizmann.ac.il/math/sarigo/sites/math.sarigo/files/uploads/ergodicnotes.pdf), Theorem 2.2, physical pp.45–48, finite coloring proof. Declaration-sized refinement of the finite orbit argument; all extended-real and measurable-representative conventions are stated explicitly here.

#### upper-truncation-invariant — Strict invariance of the truncated limsup

**Lemma.** If f≥0 pointwise, then U_L(T,f,Tx)=U_L(T,f,x) for all x and L≥0.

**Direct prerequisites:** `upper-orbit-truncation`.

**Construction or proof:**

1. Use A_(n+1)f(x)=f(x)/(n+1)+n/(n+1) A_n f(Tx).
2. For nonnegative averages and finite f(x), the extended limsup is unchanged by the vanishing additive term and factor tending to one; handle infinite limsup by arbitrary finite lower thresholds.
3. Apply finite truncation.

**Acceptance:** The assertion is strict pointwise invariance; no almost-everywhere replacement is passed to MeasurableSpace.invariants.

**Source:** [Omri Sarig](https://www.weizmann.ac.il/math/sarigo/sites/math.sarigo/files/uploads/ergodicnotes.pdf), Theorem 2.2, physical pp.45–48, finite coloring proof. Declaration-sized refinement of the finite orbit argument; all extended-real and measurable-representative conventions are stated explicitly here.

#### first-orbit-hit — First positive averaging length above a threshold

**Construction.** For an endomap T:Ω→Ω and real-valued f,c:Ω→real, define τ(T,f,c,x) as the least positive natural n with A_n f(x)>c(x), and 0 if no such n exists. It depends on no measure.

**Direct prerequisites:** `mathlib:birkhoffAverage`.

**Construction or proof:**

1. Use the well-ordering of positive natural lengths when the crossing set is nonempty and the zero sentinel otherwise.

**Uses:**

- `upper-coloring-integrated`: Use threshold U_L−ε.
- `lower-coloring-integrated`: Apply to −f with threshold −liminf(A_n f)−ε.

**API:**

| Declaration | Role | Statement | Proof node |
|---|---|---|---|
| `firstOrbitHit_pos_iff` | characterisation | τ(x)>0 iff some positive-length average exceeds c(x). | `first-hit-positive` |
| `firstOrbitHit_average` | data | If τ(x)>0 then A_τ(x) f(x)>c(x). | `first-hit-average` |
| `firstOrbitHit_measurable` | structure | For measurable T,f,c the natural-valued τ is measurable. | `first-hit-measurable` |

**Unit tests:**

- `first_hit_constant` (computation): For f=constant 2 and c=constant 1, τ=1.
- `first_hit_no_crossing` (degenerate): For f=constant 2 and c=constant 2, τ=0; strict inequality matters.
- `first_hit_two_cycle` (computation): On Bool with T negation, f(false)=0,f(true)=4,c=constant 1, τ(false)=2 and τ(true)=1.

**Acceptance:** The exact displayed hypotheses and conventions appear in the suggested signature.

**Source:** [Omri Sarig](https://www.weizmann.ac.il/math/sarigo/sites/math.sarigo/files/uploads/ergodicnotes.pdf), Theorem 2.2, physical pp.45–48, finite coloring proof. Declaration-sized refinement of the finite orbit argument; all extended-real and measurable-representative conventions are stated explicitly here.

#### first-hit-positive — Positive first hit characterizes crossing

**Lemma.** τ(T,f,c,x)>0 iff ∃n≥1, A_n f(x)>c(x).

**Direct prerequisites:** `first-orbit-hit`.

**Construction or proof:**

1. Use the minimum definition and the zero sentinel.

**Acceptance:** The exact displayed hypotheses and conventions appear in the suggested signature.

**Source:** [Omri Sarig](https://www.weizmann.ac.il/math/sarigo/sites/math.sarigo/files/uploads/ergodicnotes.pdf), Theorem 2.2, physical pp.45–48, finite coloring proof. Declaration-sized refinement of the finite orbit argument; all extended-real and measurable-representative conventions are stated explicitly here.

#### first-hit-average — Average on the selected block

**Lemma.** If τ(T,f,c,x)>0, A_τ(x) f(x)>c(x).

**Direct prerequisites:** `first-orbit-hit`.

**Construction or proof:**

1. The minimum belongs to the nonempty crossing set.

**Acceptance:** The exact displayed hypotheses and conventions appear in the suggested signature.

**Source:** [Omri Sarig](https://www.weizmann.ac.il/math/sarigo/sites/math.sarigo/files/uploads/ergodicnotes.pdf), Theorem 2.2, physical pp.45–48, finite coloring proof. Declaration-sized refinement of the finite orbit argument; all extended-real and measurable-representative conventions are stated explicitly here.

#### first-hit-measurable — Measurability of the first hit

**Lemma.** For measurable T,f,c, τ(T,f,c,·) is measurable.

**Direct prerequisites:** `first-orbit-hit`, `mathlib:birkhoffAverage`.

**Construction or proof:**

1. For n≥1, {τ=n} is {A_n>c} minus the finite union of earlier crossing sets.
2. The zero fiber is the complement of the countable union of crossing sets; use the countable discrete Borel structure of natural numbers.

**Acceptance:** The exact displayed hypotheses and conventions appear in the suggested signature.

**Source:** [Omri Sarig](https://www.weizmann.ac.il/math/sarigo/sites/math.sarigo/files/uploads/ergodicnotes.pdf), Theorem 2.2, physical pp.45–48, finite coloring proof. Declaration-sized refinement of the finite orbit argument; all extended-real and measurable-representative conventions are stated explicitly here.

#### greedy-orbit-blocks — Finite greedy orbit coloring

**Construction.** For σ:natural→natural, M≥1 and N, construct a list of triples (start,length,isBlue). Starting at k=0, while k<N: if 1≤σ(k)≤M and k+σ(k)≤N, append the blue block (k,σ(k),true) and advance; if σ(k)=0 or σ(k)>M, append the red singleton (k,1,false) and advance; otherwise stop, leaving a terminal interval. The list is ordered by start and covers an initial segment of {0,…,N−1}.

**Direct prerequisites:** .

**Construction or proof:**

1. Use recursion with fuel N, since every appended block advances by at least one.
2. The only early stop is a positive permitted block that would overrun N.

**Uses:**

- `finite-upper-coloring`: Blue sums beat the invariant threshold; red starts are charged to the bad set.
- `finite-lower-coloring`: Blue sums lie below the lower threshold; terminal bounded terms contribute at most M².

**API:**

| Declaration | Role | Statement | Proof node |
|---|---|---|---|
| `greedyOrbitBlocks_partition` | characterisation | Listed disjoint consecutive intervals cover [0,k), for k≤N; their lengths sum to k. | `greedy-block-partition` |
| `greedyOrbitBlocks_blue` | data | Every blue triple has length σ(start) in [1,M] and ends at most N. | `greedy-block-blue` |
| `greedyOrbitBlocks_red` | data | Every red triple has length 1 and σ(start)=0 or σ(start)>M. | `greedy-block-red` |
| `greedyOrbitBlocks_tail` | relation | The uncovered terminal interval has length <M, unless N=0 where its length is zero. | `greedy-block-tail` |

**Unit tests:**

- `blocks_empty` (degenerate): N=0 gives the empty list for every σ and M≥1.
- `blocks_unit` (computation): σ=constant 1,M=1,N=3 gives [(0,1,true),(1,1,true),(2,1,true)].
- `blocks_boundary` (computation): σ=constant 2,M=2,N=5 gives [(0,2,true),(2,2,true)], with a single uncovered terminal point.
- `blocks_bad` (non-example): σ=constant 0,M=2,N=3 gives three red singletons, not a zero-length blue loop.

**Acceptance:** The exact displayed hypotheses and conventions appear in the suggested signature.

**Source:** [Omri Sarig](https://www.weizmann.ac.il/math/sarigo/sites/math.sarigo/files/uploads/ergodicnotes.pdf), Theorem 2.2, physical pp.45–48, finite coloring proof. Declaration-sized refinement of the finite orbit argument; all extended-real and measurable-representative conventions are stated explicitly here.

#### greedy-block-partition — Partition by greedy blocks

**Lemma.** The greedy list covers exactly an initial natural interval [0,k), has pairwise disjoint consecutive block intervals, and the sum of block lengths is k≤N.

**Direct prerequisites:** `greedy-orbit-blocks`.

**Construction or proof:**

1. Induct on the recursion fuel, using the displayed three branches and positivity of each appended length.

**Acceptance:** The exact displayed hypotheses and conventions appear in the suggested signature.

**Source:** [Omri Sarig](https://www.weizmann.ac.il/math/sarigo/sites/math.sarigo/files/uploads/ergodicnotes.pdf), Theorem 2.2, physical pp.45–48, finite coloring proof. Declaration-sized refinement of the finite orbit argument; all extended-real and measurable-representative conventions are stated explicitly here.

#### greedy-block-blue — Valid blue blocks

**Lemma.** Every blue block has length σ(start) with 1≤σ(start)≤M and start+length≤N.

**Direct prerequisites:** `greedy-orbit-blocks`.

**Construction or proof:**

1. Induct on the recursion fuel, using the displayed three branches and positivity of each appended length.

**Acceptance:** The exact displayed hypotheses and conventions appear in the suggested signature.

**Source:** [Omri Sarig](https://www.weizmann.ac.il/math/sarigo/sites/math.sarigo/files/uploads/ergodicnotes.pdf), Theorem 2.2, physical pp.45–48, finite coloring proof. Declaration-sized refinement of the finite orbit argument; all extended-real and measurable-representative conventions are stated explicitly here.

#### greedy-block-red — Red blocks detect bad starts

**Lemma.** Every red block has length 1 and σ(start)=0 or σ(start)>M.

**Direct prerequisites:** `greedy-orbit-blocks`.

**Construction or proof:**

1. Induct on the recursion fuel, using the displayed three branches and positivity of each appended length.

**Acceptance:** The exact displayed hypotheses and conventions appear in the suggested signature.

**Source:** [Omri Sarig](https://www.weizmann.ac.il/math/sarigo/sites/math.sarigo/files/uploads/ergodicnotes.pdf), Theorem 2.2, physical pp.45–48, finite coloring proof. Declaration-sized refinement of the finite orbit argument; all extended-real and measurable-representative conventions are stated explicitly here.

#### greedy-block-tail — Bound on the terminal interval

**Lemma.** For M≥1, the uncovered terminal interval after greedy coloring has length strictly less than M.

**Direct prerequisites:** `greedy-orbit-blocks`.

**Construction or proof:**

1. Induct on the recursion fuel, using the displayed three branches and positivity of each appended length.

**Acceptance:** The exact displayed hypotheses and conventions appear in the suggested signature.

**Source:** [Omri Sarig](https://www.weizmann.ac.il/math/sarigo/sites/math.sarigo/files/uploads/ergodicnotes.pdf), Theorem 2.2, physical pp.45–48, finite coloring proof. Declaration-sized refinement of the finite orbit argument; all extended-real and measurable-representative conventions are stated explicitly here.

#### finite-upper-coloring — Finite lower bound from blue blocks

**Lemma.** Let f≥0 pointwise, g≥0 with g(Tx)=g(x), ε>0, σ(k)=τ(T,f,g−ε,T^k x)>0 for every k, and N≥M≥1. Then Σ_(k<N) [f(T^k x)+g(x)·1_{σ(k)>M}] ≥ (N−M)(g(x)−ε).

**Direct prerequisites:** `greedy-block-partition`, `greedy-block-blue`, `greedy-block-red`, `greedy-block-tail`, `first-hit-average`.

**Construction or proof:**

1. If g(x)<ε the right side is nonpositive and the left side is nonnegative.
2. Otherwise sum the strict average lower bound on each blue block; invariance fixes its threshold at g(x).
3. Each red singleton is bad and contributes g(x) through the additional term. Ignore the nonnegative terminal sum; at least N−M points are covered.

**Acceptance:** The exact displayed hypotheses and conventions appear in the suggested signature.

**Source:** [Omri Sarig](https://www.weizmann.ac.il/math/sarigo/sites/math.sarigo/files/uploads/ergodicnotes.pdf), Theorem 2.2, physical pp.45–48, finite coloring proof. Declaration-sized refinement of the finite orbit argument; all extended-real and measurable-representative conventions are stated explicitly here.

#### upper-coloring-integrated — Integrated upper-limsup coloring inequality

**Lemma.** On a probability space, let T be measure preserving, f measurable, nonnegative and integrable, L≥0, ε>0, and τ=τ(T,f,U_L−ε). For N≥M≥1, ∫f ≥ ∫_{τ≤M} U_L − ε − ML/N. Here τ>0 everywhere because a limsup strictly exceeds U_L−ε.

**Direct prerequisites:** `finite-upper-coloring`, `upper-truncation-bounds`, `upper-truncation-measurable`, `upper-truncation-invariant`, `first-hit-measurable`, `first-hit-positive`, `mathlib:MeasureTheory.integral_map`.

**Construction or proof:**

1. The limsup characterization gives a positive crossing at every point.
2. Integrate the finite inequality; every iterate has the same f integral, and U_L is strictly invariant.
3. Rearrange the bad-set term and bound its boundary loss by ML/N.

**Acceptance:** The finite bound remains valid for L=0; take N→∞ before M→∞.

**Source:** [Omri Sarig](https://www.weizmann.ac.il/math/sarigo/sites/math.sarigo/files/uploads/ergodicnotes.pdf), Theorem 2.2, physical pp.45–48, finite coloring proof. Declaration-sized refinement of the finite orbit argument; all extended-real and measurable-representative conventions are stated explicitly here.

#### upper-truncation-bound — Removal of the bad-set and coloring boundary

**Lemma.** With the preceding hypotheses, ∫ U_L dμ ≤ ∫ f dμ for every L≥0.

**Direct prerequisites:** `upper-coloring-integrated`, `upper-truncation-bounds`, `first-hit-positive`, `mathlib:MeasureTheory.tendsto_integral_of_dominated_convergence`.

**Construction or proof:**

1. For fixed M,ε let N→∞ in the integrated inequality.
2. Since τ is finite and positive everywhere, 1_{τ≤M} U_L tends to U_L and is dominated by L; apply dominated convergence as M→∞.
3. Let ε↓0. This supplies the inherited birkhoff-coloring declaration without declaring it again.

**Acceptance:** The exact displayed hypotheses and conventions appear in the suggested signature.

**Source:** [Omri Sarig](https://www.weizmann.ac.il/math/sarigo/sites/math.sarigo/files/uploads/ergodicnotes.pdf), Theorem 2.2, physical pp.45–48, finite coloring proof. Declaration-sized refinement of the finite orbit argument; all extended-real and measurable-representative conventions are stated explicitly here.

#### liminf-finite-integrable — Finite integrable lower orbit limit

**Lemma.** For measurable nonnegative integrable f on a probability-preserving system, the extended liminf of A_(n+1)f is finite almost everywhere, and its finite real representative ℓ is integrable with ∫ℓ≤∫f. Take ℓ=0 on the infinite exceptional set.

**Direct prerequisites:** `mathlib:MeasureTheory.lintegral_liminf_le`, `mathlib:MeasureTheory.integral_map`, `mathlib:birkhoffAverage`.

**Construction or proof:**

1. Apply the nonnegative Fatou inequality to positive-length orbit averages.
2. Every average has integral ∫f by measure preservation.
3. Finite total extended integral implies the liminf is finite almost everywhere; take its real value and set zero on the invariant infinite set.

**Acceptance:** Do not take ENNReal.toReal of an infinite liminf and silently use its default zero as evidence of finiteness.

**Source:** [Omri Sarig](https://www.weizmann.ac.il/math/sarigo/sites/math.sarigo/files/uploads/ergodicnotes.pdf), Theorem 2.2, physical pp.45–48, finite coloring proof. Declaration-sized refinement of the finite orbit argument; all extended-real and measurable-representative conventions are stated explicitly here.

#### finite-lower-coloring — Finite upper bound for truncated blue sums

**Lemma.** Let f≥0, ℓ≥0 strictly invariant, ε>0 and θ(x)>0 satisfy A_θ(x)f(x)<ℓ(x)+ε. Let f_M=min(f,M), M≥1. For the greedy list using σ(k)=θ(T^k x), Σ_(k<N) f_M(T^k x)·1_{θ(T^k x)≤M} ≤ N(ℓ(x)+ε)+M².

**Direct prerequisites:** `greedy-block-partition`, `greedy-block-blue`, `greedy-block-red`, `greedy-block-tail`.

**Construction or proof:**

1. Red starts are bad and contribute zero to the left side.
2. Inside blue blocks dropping bad nonnegative terms and replacing f_M by f bounds the sum by length times ℓ+ε.
3. The terminal interval has fewer than M terms each bounded by M; bound it by M².

**Acceptance:** The exact displayed hypotheses and conventions appear in the suggested signature.

**Source:** [Omri Sarig](https://www.weizmann.ac.il/math/sarigo/sites/math.sarigo/files/uploads/ergodicnotes.pdf), Theorem 2.2, physical pp.45–48, finite coloring proof. Declaration-sized refinement of the finite orbit argument; all extended-real and measurable-representative conventions are stated explicitly here.

#### lower-coloring-integrated — Integrated lower-limsup coloring inequality

**Lemma.** For measurable nonnegative integrable f and probability-preserving T, let ℓ be the finite real liminf representative and θ the first positive length with A_θ f<ℓ+ε on its conull finite-liminf invariant set. Then ∫f≤∫ℓ+ε, hence ∫f≤∫ℓ after ε↓0.

**Direct prerequisites:** `finite-lower-coloring`, `liminf-finite-integrable`, `first-hit-measurable`, `first-hit-positive`, `mathlib:MeasureTheory.integral_map`, `mathlib:MeasureTheory.tendsto_integral_of_dominated_convergence`.

**Construction or proof:**

1. Set θ=firstOrbitHit(T,−f,−ℓ−ε); it is positive on the invariant conull finite-liminf set.
2. Integrate the finite inequality; fixed M, N→∞ removes M²/N.
3. As M→∞, min(f,M)1_{θ≤M}→f almost everywhere and is bounded by the integrable f.
4. The finite exceptional set complement has measure zero and is ignored throughout.

**Acceptance:** The exact displayed hypotheses and conventions appear in the suggested signature.

**Source:** [Omri Sarig](https://www.weizmann.ac.il/math/sarigo/sites/math.sarigo/files/uploads/ergodicnotes.pdf), Theorem 2.2, physical pp.45–48, finite coloring proof. Declaration-sized refinement of the finite orbit argument; all extended-real and measurable-representative conventions are stated explicitly here.

#### nonnegative-limit — Almost-everywhere convergence for nonnegative observables

**Lemma.** For a probability-preserving T and nonnegative measurable integrable real f, A_n f converges almost everywhere to an integrable real g, and ∫g=∫f.

**Direct prerequisites:** `upper-truncation-bound`, `liminf-finite-integrable`, `lower-coloring-integrated`, `mathlib:MeasureTheory.lintegral_iSup`.

**Construction or proof:**

1. Let L→∞ monotonically in the upper bound. This bounds the extended limsup integral by ∫f and proves it finite almost everywhere.
2. The complementary liminf integral is at least ∫f. Since liminf≤limsup, the nonnegative difference has zero integral and is zero almost everywhere.
3. Equality of finite liminf and limsup yields real convergence and the common integral.

**Acceptance:** The exact displayed hypotheses and conventions appear in the suggested signature.

**Source:** [Omri Sarig](https://www.weizmann.ac.il/math/sarigo/sites/math.sarigo/files/uploads/ergodicnotes.pdf), Theorem 2.2, physical pp.45–48, finite coloring proof. Declaration-sized refinement of the finite orbit argument; all extended-real and measurable-representative conventions are stated explicitly here.

#### measurable-orbit-replacement — Conull transport of a measurable representative

**Lemma.** Let T be measure preserving and f,g real functions with f=g almost everywhere. There is a T-forward-invariant conull set E on which f(T^n x)=g(T^n x) for all n, hence all native averages agree. In particular an integrable f can be replaced by a measurable real representative before pointwise coloring.

**Direct prerequisites:** `mathlib:MeasureTheory.Measure.QuasiMeasurePreserving.ae`, `mathlib:MeasureTheory.AEStronglyMeasurable.mk`.

**Construction or proof:**

1. Intersect the countably many pullbacks of the agreement conull set along T^n.
2. Measure preservation keeps every pullback conull; the intersection is forward invariant.
3. Use the native measurable representative of the integrable function.

**Acceptance:** Forward invariance alone is used for orbit transport; the strict invariant limit is constructed separately.

**Source:** [Omri Sarig](https://www.weizmann.ac.il/math/sarigo/sites/math.sarigo/files/uploads/ergodicnotes.pdf), Theorem 2.2, physical pp.45–48, finite coloring proof. Declaration-sized refinement of the finite orbit argument; all extended-real and measurable-representative conventions are stated explicitly here.

#### signed-limit — Almost-everywhere convergence for integrable real observables

**Lemma.** For probability-preserving T and integrable real f, A_n f converges almost everywhere to an integrable real g with ∫g=∫f.

**Direct prerequisites:** `nonnegative-limit`, `measurable-orbit-replacement`, `mathlib:birkhoffAverage`.

**Construction or proof:**

1. Take a measurable representative and its positive and negative parts, both integrable and nonnegative.
2. Intersect the two convergence sets and subtract their limits using linearity of native averages.
3. Transport the result back to the original f on the orbit-conull agreement set.

**Acceptance:** The exact displayed hypotheses and conventions appear in the suggested signature.

**Source:** [Omri Sarig](https://www.weizmann.ac.il/math/sarigo/sites/math.sarigo/files/uploads/ergodicnotes.pdf), Theorem 2.2, physical pp.45–48, finite coloring proof. Declaration-sized refinement of the finite orbit argument; all extended-real and measurable-representative conventions are stated explicitly here.

#### orbit-limit — Canonical finite orbit-limit representative

**Construction.** For T and real f, define orbitLimit(T,f,x) as the unique real limit of the sequence A_n f(x) if such a limit exists, and zero otherwise. No measure or selected convergence proof is part of the data.

**Direct prerequisites:** `mathlib:birkhoffAverage`.

**Construction or proof:**

1. Use uniqueness of a convergent real sequence to choose its limit, and use zero on the complement.

**Uses:**

- `native-condexp-identification`: Its strict invariance gives measurability for the native invariant sigma-algebra.
- `signed-limit`: Supplies a definite real representative on all points, including the exceptional set.

**API:**

| Declaration | Role | Statement | Proof node |
|---|---|---|---|
| `orbitLimit_of_tendsto` | characterisation | If A_n f(x)→c then orbitLimit(T,f,x)=c. | `orbit-limit-value` |
| `orbitLimit_measurable` | structure | Measurable T,f imply measurable orbitLimit. | `orbit-limit-measurable` |
| `orbitLimit_comp` | compatibility | For all T,f,x, orbitLimit(T,f,Tx)=orbitLimit(T,f,x). | `orbit-limit-invariant` |

**Unit tests:**

- `orbit_limit_constant` (computation): For constant real c, orbitLimit(T,c,x)=c.
- `orbit_limit_cycle` (computation): For Bool negation and f(false)=0,f(true)=4, orbitLimit is the constant 2.
- `orbit_limit_diverges` (non-example): For natural successor T and f(k)=k, orbitLimit(T,f,0)=0; divergence does not define an extended-real limit as a real number.

**Acceptance:** The exact displayed hypotheses and conventions appear in the suggested signature.

**Source:** [Omri Sarig](https://www.weizmann.ac.il/math/sarigo/sites/math.sarigo/files/uploads/ergodicnotes.pdf), Theorem 2.2, physical pp.45–48, finite coloring proof. Declaration-sized refinement of the finite orbit argument; all extended-real and measurable-representative conventions are stated explicitly here.

#### orbit-limit-value — Evaluation at convergent orbits

**Lemma.** If A_n f(x) tends to c∈real, orbitLimit(T,f,x)=c.

**Direct prerequisites:** `orbit-limit`.

**Construction or proof:**

1. Apply uniqueness of the real limit in the definition.

**Acceptance:** The exact displayed hypotheses and conventions appear in the suggested signature.

**Source:** [Omri Sarig](https://www.weizmann.ac.il/math/sarigo/sites/math.sarigo/files/uploads/ergodicnotes.pdf), Theorem 2.2, physical pp.45–48, finite coloring proof. Declaration-sized refinement of the finite orbit argument; all extended-real and measurable-representative conventions are stated explicitly here.

#### orbit-limit-measurable — Measurability of the canonical limit

**Lemma.** For measurable T and real f, orbitLimit(T,f,·) is measurable.

**Direct prerequisites:** `orbit-limit`, `mathlib:birkhoffAverage`.

**Construction or proof:**

1. The real Cauchy criterion expresses the convergence set by countable unions/intersections of measurable comparisons of orbit averages.
2. On this measurable set, the pointwise limit is measurable; extend by zero.

**Acceptance:** The exact displayed hypotheses and conventions appear in the suggested signature.

**Source:** [Omri Sarig](https://www.weizmann.ac.il/math/sarigo/sites/math.sarigo/files/uploads/ergodicnotes.pdf), Theorem 2.2, physical pp.45–48, finite coloring proof. Declaration-sized refinement of the finite orbit argument; all extended-real and measurable-representative conventions are stated explicitly here.

#### orbit-limit-invariant — Strict invariance of the canonical limit

**Lemma.** For every T,f and x, orbitLimit(T,f,Tx)=orbitLimit(T,f,x).

**Direct prerequisites:** `orbit-limit`.

**Construction or proof:**

1. Use the finite-average recurrence to show real convergence at x iff convergence at Tx, with the same limit.
2. On the invariant nonconvergence set both values are zero.

**Acceptance:** The exact displayed hypotheses and conventions appear in the suggested signature.

**Source:** [Omri Sarig](https://www.weizmann.ac.il/math/sarigo/sites/math.sarigo/files/uploads/ergodicnotes.pdf), Theorem 2.2, physical pp.45–48, finite coloring proof. Declaration-sized refinement of the finite orbit argument; all extended-real and measurable-representative conventions are stated explicitly here.

#### bounded-observable-l1-limit — Integral convergence for bounded observables

**Lemma.** For probability-preserving T and measurable real f bounded in absolute value by C, ∫|A_n f−orbitLimit(T,f)|→0.

**Direct prerequisites:** `signed-limit`, `orbit-limit-value`, `mathlib:MeasureTheory.tendsto_integral_of_dominated_convergence`.

**Construction or proof:**

1. The averages and their limit are bounded by C.
2. Apply dominated convergence with constant bound 2C to the pointwise-convergent absolute differences.

**Acceptance:** The exact displayed hypotheses and conventions appear in the suggested signature.

**Source:** [Omri Sarig](https://www.weizmann.ac.il/math/sarigo/sites/math.sarigo/files/uploads/ergodicnotes.pdf), Theorem 2.2, physical pp.45–48, finite coloring proof. Declaration-sized refinement of the finite orbit argument; all extended-real and measurable-representative conventions are stated explicitly here.

#### integrable-observable-l1-limit — Integral convergence for every L1 observable

**Lemma.** For probability-preserving T and integrable real f, ∫|A_n f−orbitLimit(T,f)|→0.

**Direct prerequisites:** `bounded-observable-l1-limit`, `signed-limit`, `measurable-orbit-replacement`, `mathlib:MeasureTheory.integral_map`, `mathlib:MeasureTheory.lintegral_liminf_le`, `mathlib:MeasureTheory.tendsto_integral_of_dominated_convergence`.

**Construction or proof:**

1. Truncate a measurable representative to [−C,C]; its L1 distance to f tends to zero by dominated convergence.
2. The averaging operator contracts this distance because triangle inequality and preservation give ∫|A_n(f−f_C)|≤∫|f−f_C|.
3. Fatou gives the same bound for the difference of limits. Combine these two bounds with the bounded-observable convergence.

**Acceptance:** This is a new pointwise-proof consequence for arbitrary L1. The existing Tau Ceti L1 average theorem has an additional MemLp 2 hypothesis and is not substituted here.

**Source:** [Omri Sarig](https://www.weizmann.ac.il/math/sarigo/sites/math.sarigo/files/uploads/ergodicnotes.pdf), Theorem 2.2, physical pp.45–48, finite coloring proof. Declaration-sized refinement of the finite orbit argument; all extended-real and measurable-representative conventions are stated explicitly here.

#### invariant-set-integrals — Equality of integrals on native invariant sets

**Lemma.** For integrable real f and probability-preserving T, every s measurable for MeasurableSpace.invariants T satisfies ∫_s orbitLimit(T,f)=∫_s f.

**Direct prerequisites:** `integrable-observable-l1-limit`, `orbit-limit-invariant`, `mathlib:MeasurableSpace.measurableSet_invariants`, `mathlib:MeasureTheory.integral_map`.

**Construction or proof:**

1. Strict invariance gives (T^n)⁻¹(s)=s. Thus ∫_s A_n f=∫_s f, by preservation applied to the indicator of f.
2. L1 convergence controls the absolute difference of these restricted integrals.
3. Let n→∞; this avoids a separate renormalized restricted-probability argument.

**Acceptance:** The exact displayed hypotheses and conventions appear in the suggested signature.

**Source:** [Omri Sarig](https://www.weizmann.ac.il/math/sarigo/sites/math.sarigo/files/uploads/ergodicnotes.pdf), Theorem 2.3, physical pp.48–49. Native conditional-expectation identification, using a strict invariant measurable representative.

#### native-condexp-identification — Identification with native invariant conditional expectation

**Lemma.** For probability-preserving T and integrable real f, orbitLimit(T,f) equals μ-almost everywhere μ[f | MeasurableSpace.invariants T].

**Direct prerequisites:** `signed-limit`, `orbit-limit-value`, `orbit-limit-measurable`, `orbit-limit-invariant`, `invariant-set-integrals`, `measurable-orbit-replacement`, `mathlib:MeasurableSpace.measurable_invariants_dom`, `mathlib:MeasureTheory.ae_eq_condExp_of_forall_setIntegral_eq`, `mathlib:MeasurableSpace.invariants`.

**Construction or proof:**

1. For measurable f, the strictly invariant measurable orbitLimit is measurable for the native invariant sigma-algebra, hence strongly measurable there because real is separable.
2. Its integrability follows from the signed limit; apply native conditional-expectation uniqueness using the invariant-set integral identities.
3. For arbitrary integrable f use a measurable representative and almost-everywhere congruence of native conditional expectation and all orbit averages.

**Acceptance:** Finite probability measure supplies sigma finiteness for the trimmed invariant sigma-algebra.

**Source:** [Omri Sarig](https://www.weizmann.ac.il/math/sarigo/sites/math.sarigo/files/uploads/ergodicnotes.pdf), Theorem 2.3, physical pp.48–49. Native conditional-expectation identification, using a strict invariant measurable representative.

### Continued-fraction cylinders and exactness

#### gauss-cylinder — Irrational continued-fraction cylinders

**Definition.** For a finite natural word w, define C_w={x:0<x<1 and Irrational x and, for every i<length w, gaussDigit(i,x)=w_i}. The digit convention is the inherited zero-based convention: digit 0 is the first positive partial quotient. A word containing 0 has empty cylinder; C_empty is the irrational unit interval D.

**Direct prerequisites:** `gauss-digit`, `gauss-map`.

**Construction or proof:**

1. Intersect the irrational unit interval with the finitely many digit fibers.
2. Do not choose half-open rational endpoints: all rational points are excluded from this definition.

**Uses:**

- `gauss-cylinder-filtration`: The finite-depth cylinders are its positive-mass atoms.
- `cylinder-ce-lower-bound`: Bounded distortion compares a tail event inside every cylinder.
- `gauss-word-frequency`: The inherited frequency theorem counts these exact words.

**API:**

| Declaration | Role | Statement | Proof node |
|---|---|---|---|
| `gaussCylinder_nil` | simp | C_empty=D. | `cylinder-empty` |
| `gaussCylinder_cons` | compatibility | For a≥1, C_(a::w)=D∩{digit0=a}∩T⁻¹(C_w). | `cylinder-cons` |
| `gaussCylinder_measurable` | structure | Every C_w is Borel measurable. | `cylinder-measurable` |
| `gaussCylinder_zero` | characterisation | If 0 occurs in w then C_w is empty. | `cylinder-zero` |

**Unit tests:**

- `cylinder_nil` (degenerate): C_empty=D.
- `cylinder_zero` (non-example): C_[0] is empty.
- `cylinder_one` (computation): C_[1]=D∩(1/2,1).
- `cylinder_twelve` (computation): C_[1,2]=D∩(2/3,3/4); C_[2,1]=D∩(1/3,2/5), so reversing words changes the cylinder.

**Acceptance:** The exact displayed hypotheses and conventions appear in the suggested signature.

**Source:** [Omri Sarig](https://www.weizmann.ac.il/math/sarigo/sites/math.sarigo/files/uploads/transferoperatorcourse-bonn.pdf), Appendix A.2, physical pp.31–35, continued-fraction cylinders and exactness. Refinement of the cylinder proof on irrational points; endpoint and density corrections from the inherited review are retained.

#### cylinder-empty — Empty cylinder

**Lemma.** C_empty=D.

**Direct prerequisites:** `gauss-cylinder`.

**Construction or proof:**

1. The finite digit condition is vacuous.

**Acceptance:** The exact displayed hypotheses and conventions appear in the suggested signature.

**Source:** [Omri Sarig](https://www.weizmann.ac.il/math/sarigo/sites/math.sarigo/files/uploads/transferoperatorcourse-bonn.pdf), Appendix A.2, physical pp.31–35, continued-fraction cylinders and exactness. Refinement of the cylinder proof on irrational points; endpoint and density corrections from the inherited review are retained.

#### cylinder-cons — Cylinder shift law

**Lemma.** For a≥1 and every finite word w, C_(a::w)=D∩{x:digit0(x)=a}∩T⁻¹(C_w).

**Direct prerequisites:** `gauss-cylinder`, `gauss-digit-api-2`, `gauss-map-api-2`.

**Construction or proof:**

1. On D, T maps D into D and the inherited digit shift identifies every remaining digit.

**Acceptance:** The exact displayed hypotheses and conventions appear in the suggested signature.

**Source:** [Omri Sarig](https://www.weizmann.ac.il/math/sarigo/sites/math.sarigo/files/uploads/transferoperatorcourse-bonn.pdf), Appendix A.2, physical pp.31–35, continued-fraction cylinders and exactness. Refinement of the cylinder proof on irrational points; endpoint and density corrections from the inherited review are retained.

#### cylinder-measurable — Borel measurability of cylinders

**Lemma.** C_w is Borel measurable for every finite natural word w.

**Direct prerequisites:** `gauss-cylinder`, `gauss-map-api-3`, `gauss-digit`, `irrational-conull`.

**Construction or proof:**

1. Digit fibers are Borel because floor, inverse and Gauss iterates are measurable.
2. The irrational set is the complement of the countable rational range; take the finite intersection.

**Acceptance:** The exact displayed hypotheses and conventions appear in the suggested signature.

**Source:** [Omri Sarig](https://www.weizmann.ac.il/math/sarigo/sites/math.sarigo/files/uploads/transferoperatorcourse-bonn.pdf), Appendix A.2, physical pp.31–35, continued-fraction cylinders and exactness. Refinement of the cylinder proof on irrational points; endpoint and density corrections from the inherited review are retained.

#### cylinder-zero — Zero digits give empty cylinders

**Lemma.** If 0 occurs in w, then C_w=empty.

**Direct prerequisites:** `gauss-cylinder`, `gauss-map-api-2`.

**Construction or proof:**

1. Each iterate of x∈D lies strictly between 0 and 1, so its inverse has natural floor at least one.

**Acceptance:** The exact displayed hypotheses and conventions appear in the suggested signature.

**Source:** [Omri Sarig](https://www.weizmann.ac.il/math/sarigo/sites/math.sarigo/files/uploads/transferoperatorcourse-bonn.pdf), Appendix A.2, physical pp.31–35, continued-fraction cylinders and exactness. Refinement of the cylinder proof on irrational points; endpoint and density corrections from the inherited review are retained.

#### irrational-conull — Irrational points form a conull Borel domain

**Lemma.** D={x:0<x<1 and Irrational x} is Borel and has measure one for m=volume restricted to (0,1), and for the inherited Gauss measure μ_G. Every Gauss iterate maps D into D.

**Direct prerequisites:** `gauss-measure-api-3`, `gauss-map-api-2`, `mathlib:Set.countable_range`, `mathlib:MeasureTheory.NullSingletonClass`, `mathlib:Set.Countable.measure_zero`, `mathlib:Irrational`.

**Construction or proof:**

1. Rational real numbers are the countable range of the rational cast and hence have zero Lebesgue measure.
2. Equivalence transfers this conull statement to μ_G.
3. For irrational x, a rational fractional part of 1/x would make x rational; positivity and the unit-interval range give preservation of D.

**Acceptance:** The exact displayed hypotheses and conventions appear in the suggested signature.

**Source:** [Omri Sarig](https://www.weizmann.ac.il/math/sarigo/sites/math.sarigo/files/uploads/transferoperatorcourse-bonn.pdf), Appendix A.2, physical pp.31–35, continued-fraction cylinders and exactness. Refinement of the cylinder proof on irrational points; endpoint and density corrections from the inherited review are retained.

#### inverse-word — Ordered inverse Gauss branches

**Definition.** For w=[a_0,…,a_(n−1)], define v_w=v_a0∘…∘v_a(n−1), with v_a(y)=1/(a+y), and v_empty=id. This total real function is defined for every natural word, but geometric statements assume all entries positive.

**Direct prerequisites:** `gauss-branch-jacobian`.

**Construction or proof:**

1. Fold the ordered list from the right, preserving the source’s composition order.

**Uses:**

- `word-derivative`: Express each cylinder Jacobian.
- `cylinder-image`: Map the irrational unit interval onto C_w.

**API:**

| Declaration | Role | Statement | Proof node |
|---|---|---|---|
| `inverseWord_nil` | simp | v_empty(y)=y. | `inverse-word-empty` |
| `inverseWord_cons` | data | v_(a::w)(y)=1/(a+v_w(y)). | `inverse-word-cons` |
| `inverseWord_append` | functoriality | v_(u++w)=v_u∘v_w. | `inverse-word-append` |

**Unit tests:**

- `inverse_word_empty` (degenerate): v_empty(2)=2.
- `inverse_word_twelve` (computation): v_[1,2](0)=2/3 and v_[1,2](1)=3/4.
- `inverse_word_twentyone` (non-example): v_[2,1](0)=1/3, not 2/3; word order is composition order.

**Acceptance:** The exact displayed hypotheses and conventions appear in the suggested signature.

**Source:** [Omri Sarig](https://www.weizmann.ac.il/math/sarigo/sites/math.sarigo/files/uploads/transferoperatorcourse-bonn.pdf), Appendix A.2, physical pp.31–35, continued-fraction cylinders and exactness. Refinement of the cylinder proof on irrational points; endpoint and density corrections from the inherited review are retained.

#### inverse-word-empty — Empty inverse word

**Lemma.** v_empty(y)=y for all real y.

**Direct prerequisites:** `inverse-word`.

**Construction or proof:**

1. Unfold the ordered fold and induct on the first word where needed.

**Acceptance:** The exact displayed hypotheses and conventions appear in the suggested signature.

**Source:** [Omri Sarig](https://www.weizmann.ac.il/math/sarigo/sites/math.sarigo/files/uploads/transferoperatorcourse-bonn.pdf), Appendix A.2, physical pp.31–35, continued-fraction cylinders and exactness. Refinement of the cylinder proof on irrational points; endpoint and density corrections from the inherited review are retained.

#### inverse-word-cons — Cons inverse word

**Lemma.** v_(a::w)(y)=1/(a+v_w(y)) for every natural a, word w and real y.

**Direct prerequisites:** `inverse-word`.

**Construction or proof:**

1. Unfold the ordered fold and induct on the first word where needed.

**Acceptance:** The exact displayed hypotheses and conventions appear in the suggested signature.

**Source:** [Omri Sarig](https://www.weizmann.ac.il/math/sarigo/sites/math.sarigo/files/uploads/transferoperatorcourse-bonn.pdf), Appendix A.2, physical pp.31–35, continued-fraction cylinders and exactness. Refinement of the cylinder proof on irrational points; endpoint and density corrections from the inherited review are retained.

#### inverse-word-append — Composition of inverse words

**Lemma.** v_(u++w)=v_u∘v_w for all finite natural words u,w.

**Direct prerequisites:** `inverse-word`.

**Construction or proof:**

1. Unfold the ordered fold and induct on the first word where needed.

**Acceptance:** The exact displayed hypotheses and conventions appear in the suggested signature.

**Source:** [Omri Sarig](https://www.weizmann.ac.il/math/sarigo/sites/math.sarigo/files/uploads/transferoperatorcourse-bonn.pdf), Appendix A.2, physical pp.31–35, continued-fraction cylinders and exactness. Refinement of the cylinder proof on irrational points; endpoint and density corrections from the inherited review are retained.

#### word-matrix — Matrix of a finite continued-fraction word

**Construction.** Construct W_w as the ordered product in Matrix(Fin 2,Fin 2,real) of B_a=[[0,1],[1,a]] for a in w; W_empty=identity. This is a native matrix, not a second continued-fraction carrier.

**Direct prerequisites:** `mathlib:Matrix`.

**Construction or proof:**

1. Use the native matrix monoid and the list product in word order.

**Uses:**

- `word-derivative`: The determinant and denominator entries give the Jacobian.
- `orbit-product-identity`: The same native denominator entries give the exact orbit-product identity.

**API:**

| Declaration | Role | Statement | Proof node |
|---|---|---|---|
| `wordMatrix_nil` | simp | W_empty=identity. | `word-matrix-empty` |
| `wordMatrix_cons` | functoriality | W_(a::w)=B_a W_w. | `word-matrix-cons` |
| `wordMatrix_det` | relation | det(W_w)=(-1)^(length w). | `word-matrix-determinant` |
| `wordMatrix_native` | compatibility | For x∈C_w, n=length w≥1, W_w=[[nums(n−1),nums n],[dens(n−1),dens n]] for native GenContFract.of x. | `word-native-continuants` |

**Unit tests:**

- `word_matrix_empty` (degenerate): W_empty is identity.
- `word_matrix_one` (computation): W_[3]=[[0,1],[1,3]].
- `word_matrix_twelve` (computation): W_[1,2]=[[1,2],[1,3]], whereas W_[2,1]=[[1,1],[2,3]].

**Acceptance:** The exact displayed hypotheses and conventions appear in the suggested signature.

**Source:** [Omri Sarig](https://www.weizmann.ac.il/math/sarigo/sites/math.sarigo/files/uploads/transferoperatorcourse-bonn.pdf), Appendix A.2, physical pp.31–35, continued-fraction cylinders and exactness. Refinement of the cylinder proof on irrational points; endpoint and density corrections from the inherited review are retained.

#### word-matrix-empty — Empty word matrix

**Lemma.** W_empty=identity matrix.

**Direct prerequisites:** `word-matrix`.

**Construction or proof:**

1. Use the empty list product.

**Acceptance:** The exact displayed hypotheses and conventions appear in the suggested signature.

**Source:** [Omri Sarig](https://www.weizmann.ac.il/math/sarigo/sites/math.sarigo/files/uploads/transferoperatorcourse-bonn.pdf), Appendix A.2, physical pp.31–35, continued-fraction cylinders and exactness. Refinement of the cylinder proof on irrational points; endpoint and density corrections from the inherited review are retained.

#### word-matrix-cons — Matrix product on cons

**Lemma.** W_(a::w)=[[0,1],[1,a]] W_w.

**Direct prerequisites:** `word-matrix`.

**Construction or proof:**

1. Use the list-product cons identity.

**Acceptance:** The exact displayed hypotheses and conventions appear in the suggested signature.

**Source:** [Omri Sarig](https://www.weizmann.ac.il/math/sarigo/sites/math.sarigo/files/uploads/transferoperatorcourse-bonn.pdf), Appendix A.2, physical pp.31–35, continued-fraction cylinders and exactness. Refinement of the cylinder proof on irrational points; endpoint and density corrections from the inherited review are retained.

#### word-matrix-determinant — Determinant of a word matrix

**Lemma.** det W_w=(-1)^(length w).

**Direct prerequisites:** `word-matrix`, `mathlib:Matrix.det_mul`.

**Construction or proof:**

1. Each branch matrix has determinant −1; multiply determinants through the ordered list.

**Acceptance:** The exact displayed hypotheses and conventions appear in the suggested signature.

**Source:** [Omri Sarig](https://www.weizmann.ac.il/math/sarigo/sites/math.sarigo/files/uploads/transferoperatorcourse-bonn.pdf), Appendix A.2, physical pp.31–35, continued-fraction cylinders and exactness. Refinement of the cylinder proof on irrational points; endpoint and density corrections from the inherited review are retained.

#### word-matrix-positive — Positive ordered matrix denominators

**Lemma.** For a positive word w of length n≥1, put q=W_w(1,1), r=W_w(1,0). Then 1≤q and 0<r≤q; for the empty word q=1,r=0. The denominator q+r y is positive for 0≤y≤1.

**Direct prerequisites:** `word-matrix-cons`, `word-matrix-empty`.

**Construction or proof:**

1. Equivalently use the append recurrence q_(n+1)=a_n q_n+q_(n−1) starting q_0=1,q_(−1)=0.
2. Induct with a_n≥1. The n=1 case permits equality q=r when a_0=1.

**Acceptance:** The exact displayed hypotheses and conventions appear in the suggested signature.

**Source:** [Omri Sarig](https://www.weizmann.ac.il/math/sarigo/sites/math.sarigo/files/uploads/transferoperatorcourse-bonn.pdf), Appendix A.2, physical pp.31–35, continued-fraction cylinders and exactness. Refinement of the cylinder proof on irrational points; endpoint and density corrections from the inherited review are retained.

#### native-stream-gauss — Native fractional-part stream equals Gauss iterates

**Comparison.** For x∈D and n≥0, native GenContFract.IntFractPair.stream x (n+1) is some pair whose integer component is gaussDigit(n,x) and fractional component is T^(n+1)x. Therefore GenContFract.of x has all partial numerators one and its n-th partial denominator equal to the real cast of gaussDigit(n,x).

**Direct prerequisites:** `gauss-digit`, `gauss-map`, `mathlib:GenContFract.IntFractPair.stream`, `mathlib:GenContFract.of`.

**Construction or proof:**

1. The stream at zero has floor x=0 and fract x=x.
2. Induct on n using the stream’s reciprocal-fractional-part recursion; irrationality prevents the zero-fract termination branch.
3. Read the of constructor’s one-step tail offset: stream index n+1 supplies partial denominator n.

**Acceptance:** Stream index zero is the integer part; the first Gauss digit uses stream index one.

**Source:** [Omri Sarig](https://www.weizmann.ac.il/math/sarigo/sites/math.sarigo/files/uploads/transferoperatorcourse-bonn.pdf), Appendix A.2, physical pp.31–35, continued-fraction cylinders and exactness. Refinement of the cylinder proof on irrational points; endpoint and density corrections from the inherited review are retained.

#### native-nontermination — Irrational Gauss fractions never terminate

**Lemma.** For x∈D, GenContFract.of x is not terminated at any natural index, its denominators are positive, and dens n≥fib(n+1).

**Direct prerequisites:** `native-stream-gauss`, `mathlib:GenContFract.terminates_iff_rat`, `mathlib:GenContFract.succ_nth_fib_le_of_nth_den`.

**Construction or proof:**

1. Apply the native termination/rationality equivalence and irrationality.
2. The native Fibonacci lower bound applies at every index; fib(n+1) is positive.

**Acceptance:** The exact displayed hypotheses and conventions appear in the suggested signature.

**Source:** [Omri Sarig](https://www.weizmann.ac.il/math/sarigo/sites/math.sarigo/files/uploads/transferoperatorcourse-bonn.pdf), Appendix A.2, physical pp.31–35, continued-fraction cylinders and exactness. Refinement of the cylinder proof on irrational points; endpoint and density corrections from the inherited review are retained.

#### word-native-continuants — Word matrices use the native continuants

**Comparison.** For x∈C_w and n=length w≥1, W_w=[[g.nums(n−1),g.nums n],[g.dens(n−1),g.dens n]], where g=GenContFract.of x. For n=0 W_w=identity, with the conventional previous numerator 1 and previous denominator 0.

**Direct prerequisites:** `native-stream-gauss`, `word-matrix-cons`, `word-matrix-empty`, `mathlib:GenContFract.nums_recurrence`, `mathlib:GenContFract.dens_recurrence`.

**Construction or proof:**

1. Check the first branch against native integer part zero and the first convergent.
2. Induct using the native nums and dens recurrences and the identified partial denominator.
3. Keep n=0 separate instead of applying natural subtraction to the formal index −1.

**Acceptance:** The exact displayed hypotheses and conventions appear in the suggested signature.

**Source:** [Omri Sarig](https://www.weizmann.ac.il/math/sarigo/sites/math.sarigo/files/uploads/transferoperatorcourse-bonn.pdf), Appendix A.2, physical pp.31–35, continued-fraction cylinders and exactness. Refinement of the cylinder proof on irrational points; endpoint and density corrections from the inherited review are retained.

#### word-mobius — Möbius formula for inverse words

**Lemma.** For a positive word w and 0≤y≤1, v_w(y)=(W_w(0,0)y+W_w(0,1))/(W_w(1,0)y+W_w(1,1)).

**Direct prerequisites:** `inverse-word-cons`, `word-matrix-cons`, `word-matrix-empty`, `word-matrix-positive`.

**Construction or proof:**

1. Induct on the word, composing the fractional-linear branch with the preceding formula.
2. Use positive denominators before cross multiplication.

**Acceptance:** The exact displayed hypotheses and conventions appear in the suggested signature.

**Source:** [Omri Sarig](https://www.weizmann.ac.il/math/sarigo/sites/math.sarigo/files/uploads/transferoperatorcourse-bonn.pdf), Appendix A.2, physical pp.31–35, continued-fraction cylinders and exactness. Refinement of the cylinder proof on irrational points; endpoint and density corrections from the inherited review are retained.

#### word-derivative — Signed inverse-word derivative

**Lemma.** For a positive word w of length n and y∈[0,1], v_w has within-interval derivative (-1)^n/(q+r y)^2, where q=W_w(1,1),r=W_w(1,0). Its absolute derivative is (q+r y)^(-2).

**Direct prerequisites:** `word-mobius`, `word-matrix-determinant`, `word-matrix-positive`.

**Construction or proof:**

1. Differentiate the fractional-linear formula on a neighborhood where its denominator is positive.
2. Use det W_w=(-1)^n, including n=0.

**Acceptance:** One branch is decreasing; an unsigned positive derivative is not substituted for the Jacobian.

**Source:** [Omri Sarig](https://www.weizmann.ac.il/math/sarigo/sites/math.sarigo/files/uploads/transferoperatorcourse-bonn.pdf), Appendix A.2, physical pp.31–35, continued-fraction cylinders and exactness. Refinement of the cylinder proof on irrational points; endpoint and density corrections from the inherited review are retained.

#### word-denominator-fibonacci — Uniform shrinking of positive-word intervals

**Lemma.** For every positive word w of length n, q=W_w(1,1)≥fib(n+1), and the diameter of v_w([0,1]) is at most 1/(fib(n+1)^2). These bounds tend to zero as n→∞.

**Direct prerequisites:** `word-matrix-positive`, `word-matrix-cons`, `word-derivative`, `mathlib:Nat.fib`.

**Construction or proof:**

1. Induct on the continuant recurrence with positive digits to obtain the Fibonacci bound.
2. Bound the absolute derivative by q^(-2) and apply the interval mean-value inequality.
3. Use growth of the Fibonacci sequence; it suffices to prove fib(n+2)≥n+1 by induction and eventual positivity.

**Acceptance:** The exact displayed hypotheses and conventions appear in the suggested signature.

**Source:** [Omri Sarig](https://www.weizmann.ac.il/math/sarigo/sites/math.sarigo/files/uploads/transferoperatorcourse-bonn.pdf), Appendix A.2, physical pp.31–35, continued-fraction cylinders and exactness. Refinement of the cylinder proof on irrational points; endpoint and density corrections from the inherited review are retained.

#### cylinder-image — Inverse words parametrize cylinders

**Lemma.** For every positive word w, v_w maps D bijectively onto C_w, with inverse T^(length w) on C_w. C_w is the open interval between v_w(0) and v_w(1), intersected with D, and has strictly positive m and μ_G mass.

**Direct prerequisites:** `cylinder-cons`, `inverse-word-cons`, `word-mobius`, `word-matrix-determinant`, `word-matrix-positive`, `irrational-conull`.

**Construction or proof:**

1. The one-branch floor identity holds on irrational points in (0,1); iterate in word order.
2. The nonzero determinant makes v_w strictly monotone and maps irrational points to irrational points in its rational-endpoint image interval.
3. The image interval has distinct rational endpoints; its Lebesgue length is positive and rational removal changes no mass.

**Acceptance:** The exact displayed hypotheses and conventions appear in the suggested signature.

**Source:** [Omri Sarig](https://www.weizmann.ac.il/math/sarigo/sites/math.sarigo/files/uploads/transferoperatorcourse-bonn.pdf), Appendix A.2, physical pp.31–35, continued-fraction cylinders and exactness. Refinement of the cylinder proof on irrational points; endpoint and density corrections from the inherited review are retained.

#### orbit-product-identity — Exact product identity for native denominators

**Lemma.** For x∈D and N≥0, (∏_(j<N) T^j x)^(-1)=g.dens N+r_N·T^N x, where g=GenContFract.of x, r_0=0 and r_N=g.dens(N−1) for N≥1. Hence the inherited denominator-log bridge has error in [0,log 2].

**Direct prerequisites:** `native-stream-gauss`, `word-native-continuants`, `word-mobius`, `word-matrix-positive`, `mathlib:GenContFract.of_den_mono`.

**Construction or proof:**

1. Use x=v_w(T^N x) for the first N digits; multiply the successive branch denominators to obtain the bottom-row expression.
2. Alternatively induct directly with the native continuant recurrence and T^j x=1/(a_j+T^(j+1)x).
3. Since 0≤r_N≤dens N and 0<T^N x<1, divide by dens N to get a factor in [1,2], then take logarithms.

**Acceptance:** The exact displayed hypotheses and conventions appear in the suggested signature.

**Source:** [Daniel Glasscock, Claire Merriman, Donald Robertson and Clifford Smyth](https://uncg.edu/~cdsmyth/UNCG_Ergodic_Theory_Summer_School_2020_Final_Lecture_Notes.pdf), Lesson 9 problem 2.4, physical p.49, printed p.46. The source asks for a bounded logarithmic remainder. The stronger exact product formula is derived here in native denominator indexing.

#### gauss-cylinder-filtration — Native finite-digit filtration

**Construction.** Construct a native Filtration natural on the Borel real line, F_n generated by D and all C_w with length w≤n. Its positive-mass atoms for m=volume|(0,1) are the positive-word cylinders of length n; the complement of D is a null atom. Do not claim F_n generates all ambient Borel sets away from D.

**Direct prerequisites:** `gauss-cylinder`, `cylinder-measurable`, `cylinder-cons`, `mathlib:MeasureTheory.Filtration`.

**Construction or proof:**

1. Use MeasurableSpace.generateFrom of the displayed collection, monotone in n and bounded by the real Borel sigma-algebra.

**Uses:**

- `cylinder-ce-formula`: Conditional expectation is a cell average on each positive cylinder.
- `cylinder-ce-converges`: Native Lévy upward identifies the limit of those averages.

**API:**

| Declaration | Role | Statement | Proof node |
|---|---|---|---|
| `gaussCylinderFiltration_cylinder` | data | C_w is F_n-measurable when length w≤n. | `filtration-cylinder` |
| `gaussCylinderFiltration_atoms` | characterisation | On D, length-n positive cylinders are a countable partition into F_n atoms. | `filtration-atoms` |
| `gaussCylinderFiltration_generates` | compatibility | Every real Borel B has B∩D measurable for the supremum of F_n. | `filtration-generates` |

**Unit tests:**

- `filtration_zero_domain` (degenerate): D is F_0-measurable and F_0 is generated by D alone.
- `filtration_first_digit` (compatibility): C_[1] is F_1-measurable.
- `filtration_not_top` (non-example): C_[1] is not F_0-measurable: it is a proper nonempty subset of the single atom D.

**Acceptance:** The exact displayed hypotheses and conventions appear in the suggested signature.

**Source:** [Omri Sarig](https://www.weizmann.ac.il/math/sarigo/sites/math.sarigo/files/uploads/transferoperatorcourse-bonn.pdf), Appendix A.2, physical pp.31–35, continued-fraction cylinders and exactness. Refinement of the cylinder proof on irrational points; endpoint and density corrections from the inherited review are retained.

#### filtration-cylinder — Finite-depth cylinder measurability

**Lemma.** If length w≤n then C_w is F_n-measurable.

**Direct prerequisites:** `gauss-cylinder-filtration`.

**Construction or proof:**

1. Use membership in the generating collection.

**Acceptance:** The exact displayed hypotheses and conventions appear in the suggested signature.

**Source:** [Omri Sarig](https://www.weizmann.ac.il/math/sarigo/sites/math.sarigo/files/uploads/transferoperatorcourse-bonn.pdf), Appendix A.2, physical pp.31–35, continued-fraction cylinders and exactness. Refinement of the cylinder proof on irrational points; endpoint and density corrections from the inherited review are retained.

#### filtration-atoms — Countable cylinder atoms

**Lemma.** For each n, the positive natural words of length n give a countable pairwise-disjoint partition of D into C_w; each C_w is an atom of F_n restricted to D.

**Direct prerequisites:** `gauss-cylinder-filtration`, `cylinder-cons`, `cylinder-zero`.

**Construction or proof:**

1. Each irrational has exactly its first n positive digits, giving coverage and disjointness.
2. Every shorter cylinder is the countable union of its length-n extensions. Thus the generated sigma-algebra is the sigma-algebra of unions of these partition cells.

**Acceptance:** The exact displayed hypotheses and conventions appear in the suggested signature.

**Source:** [Omri Sarig](https://www.weizmann.ac.il/math/sarigo/sites/math.sarigo/files/uploads/transferoperatorcourse-bonn.pdf), Appendix A.2, physical pp.31–35, continued-fraction cylinders and exactness. Refinement of the cylinder proof on irrational points; endpoint and density corrections from the inherited review are retained.

#### filtration-generates — Cylinder generation of the Borel trace

**Lemma.** For every Borel subset B of real, B∩D is measurable for ⨆n F_n.

**Direct prerequisites:** `filtration-cylinder`, `filtration-atoms`, `word-denominator-fibonacci`, `cylinder-image`.

**Construction or proof:**

1. For every relative open neighborhood of x∈D, a sufficiently long prefix cylinder containing x lies inside it because diameters shrink uniformly.
2. There are countably many words; every open set intersected with D is a countable union of such cylinders.
3. A monotone-class or sigma-algebra argument gives all Borel traces.

**Acceptance:** The complement of D stays one atom; equality with ambient Borel real is false.

**Source:** [Omri Sarig](https://www.weizmann.ac.il/math/sarigo/sites/math.sarigo/files/uploads/transferoperatorcourse-bonn.pdf), Appendix A.2, physical pp.31–35, continued-fraction cylinders and exactness. Refinement of the cylinder proof on irrational points; endpoint and density corrections from the inherited review are retained.

#### cylinder-ce-formula — Conditional expectation on a cylinder atom

**Lemma.** For Borel B and every positive length-n word w, on C_w almost everywhere for m, m[1_B | F_n] is the constant m.real(B∩C_w)/m.real(C_w).

**Direct prerequisites:** `filtration-atoms`, `cylinder-image`, `mathlib:MeasureTheory.ae_eq_condExp_of_forall_setIntegral_eq`.

**Construction or proof:**

1. Define the measurable step function by the displayed cell average on the countable cylinder partition and zero outside D.
2. Its values lie in [0,1]; integrals over each cell agree with 1_B, and countable unions give the same identity for every F_n-measurable set.
3. Apply native conditional-expectation uniqueness.

**Acceptance:** The exact displayed hypotheses and conventions appear in the suggested signature.

**Source:** [Omri Sarig](https://www.weizmann.ac.il/math/sarigo/sites/math.sarigo/files/uploads/transferoperatorcourse-bonn.pdf), Appendix A.2, physical pp.31–35, continued-fraction cylinders and exactness. Refinement of the cylinder proof on irrational points; endpoint and density corrections from the inherited review are retained.

#### cylinder-ce-converges — Cylinder conditional expectations recover indicators

**Lemma.** For Borel B, m[1_B | F_n](x)→1_B(x) for m-almost every x.

**Direct prerequisites:** `filtration-generates`, `irrational-conull`, `mathlib:MeasureTheory.Integrable.tendsto_ae_condExp`.

**Construction or proof:**

1. Replace 1_B by 1_(B∩D), which agrees m-almost everywhere and is strongly measurable for ⨆n F_n.
2. Apply the native upward conditional-expectation convergence theorem and transfer the almost-everywhere equality back.

**Acceptance:** The exact displayed hypotheses and conventions appear in the suggested signature.

**Source:** [Omri Sarig](https://www.weizmann.ac.il/math/sarigo/sites/math.sarigo/files/uploads/transferoperatorcourse-bonn.pdf), Appendix A.2, physical pp.31–35, continued-fraction cylinders and exactness. Refinement of the cylinder proof on irrational points; endpoint and density corrections from the inherited review are retained.

#### tail-sigma-antitone — Native pullback tail sigma-algebras decrease

**Lemma.** For measurable T on a measurable space (Ω,m0), Ftail_n=MeasurableSpace.comap(T^n,m0) is antitone and Ftail_0=m0; hence its infimum is ≤m0.

**Direct prerequisites:** `mathlib:MeasurableSpace.comap`, `mathlib:MeasurableSpace.comap_mono`.

**Construction or proof:**

1. T^(n+1)=T∘T^n and comap T m0≤m0 by measurability.
2. Use comap composition and monotonicity.

**Acceptance:** The exact displayed hypotheses and conventions appear in the suggested signature.

**Source:** [Omri Sarig](https://www.weizmann.ac.il/math/sarigo/sites/math.sarigo/files/uploads/transferoperatorcourse-bonn.pdf), Appendix A.2, physical pp.31–35, continued-fraction cylinders and exactness. Refinement of the cylinder proof on irrational points; endpoint and density corrections from the inherited review are retained.

#### tail-event-preimage — A tail event has measurable pullback representatives

**Lemma.** If B is measurable for ⨅n comap(T^n,m0), then for every n there is m0-measurable B_n with B=(T^n)⁻¹(B_n).

**Direct prerequisites:** `tail-sigma-antitone`, `mathlib:MeasurableSpace.measurableSet_comap`.

**Construction or proof:**

1. Infimum measurability implies measurability for each pullback sigma-algebra.
2. Use the native characterization of comap-measurable sets as measurable preimages.

**Acceptance:** The exact displayed hypotheses and conventions appear in the suggested signature.

**Source:** [Omri Sarig](https://www.weizmann.ac.il/math/sarigo/sites/math.sarigo/files/uploads/transferoperatorcourse-bonn.pdf), Appendix A.2, physical pp.31–35, continued-fraction cylinders and exactness. Refinement of the cylinder proof on irrational points; endpoint and density corrections from the inherited review are retained.

#### tail-density-lower — Correct Lebesgue lower bound for a tail preimage

**Lemma.** For a Gauss tail event B and B_n as above, m.real(B_n)≥(log 2)μ_G.real(B)≥m.real(B)/2.

**Direct prerequisites:** `tail-event-preimage`, `gauss-invariant`, `gauss-measure`.

**Construction or proof:**

1. Gauss invariance gives μ_G(B_n)=μ_G(B).
2. The exact density bounds 1/(2 log 2)≤h≤1/log 2 give the two comparisons.

**Acceptance:** The printed source’s reversed density estimate is not used; the lower comparison constant is one half.

**Source:** [Omri Sarig](https://www.weizmann.ac.il/math/sarigo/sites/math.sarigo/files/uploads/transferoperatorcourse-bonn.pdf), Appendix A.2, physical pp.31–35, continued-fraction cylinders and exactness. Refinement of the cylinder proof on irrational points; endpoint and density corrections from the inherited review are retained.

#### cylinder-ce-lower-bound — Uniform conditional lower bound for positive tail events

**Lemma.** For Borel Gauss tail B and every n, m[1_B|F_n](x)≥m.real(B)/8 for m-almost every x∈D.

**Direct prerequisites:** `tail-density-lower`, `tail-event-preimage`, `gauss-renyi`, `cylinder-ce-formula`, `filtration-atoms`.

**Construction or proof:**

1. For each positive length-n cylinder, identify B∩C_w with v_w(B_n∩D), modulo rational null sets.
2. Use the inherited Rényi inequality with the explicit distortion constant 4: m(B∩C_w)/m(C_w)≥m(B_n)/4≥m(B)/8.
3. Apply the cell formula and countable union over the cylinders.

**Acceptance:** The 1/8 constant comes from 1/4 distortion and 1/2 density comparison, not independence of digits.

**Source:** [Omri Sarig](https://www.weizmann.ac.il/math/sarigo/sites/math.sarigo/files/uploads/transferoperatorcourse-bonn.pdf), Appendix A.2, physical pp.31–35, continued-fraction cylinders and exactness. Refinement of the cylinder proof on irrational points; endpoint and density corrections from the inherited review are retained.

#### tail-zero-one — Gauss tail events are null or conull

**Lemma.** Every event B measurable for the native Gauss tail sigma-algebra has μ_G(B)=0 or μ_G(B)=1.

**Direct prerequisites:** `cylinder-ce-lower-bound`, `cylinder-ce-converges`, `gauss-measure-api-3`, `tail-sigma-antitone`.

**Construction or proof:**

1. Tail measurability implies ambient Borel measurability.
2. If m(B)>0, the positive lower bound passes to the indicator limit and forces m(B complement)=0.
3. Transfer null/conull to μ_G by equivalence and use its probability normalization.

**Acceptance:** The exact displayed hypotheses and conventions appear in the suggested signature.

**Source:** [Omri Sarig](https://www.weizmann.ac.il/math/sarigo/sites/math.sarigo/files/uploads/transferoperatorcourse-bonn.pdf), Appendix A.2, physical pp.31–35, continued-fraction cylinders and exactness. Refinement of the cylinder proof on irrational points; endpoint and density corrections from the inherited review are retained.

#### tail-ce-constant — Conditional expectation on an exact tail is constant

**Lemma.** Let T preserve a probability μ and suppose every event of its native pullback tail sigma-algebra is null or conull. For every integrable real f, μ[f|tail] equals the constant ∫f almost everywhere.

**Direct prerequisites:** `tail-sigma-antitone`, `tauceti:TauCeti.MeasureTheory.condExp_ae_eq_integral_of_forall_zero_or_one`.

**Construction or proof:**

1. The antitone tail lies below the ambient sigma-algebra.
2. Null/conull is measure 0/1 for a probability; apply the pinned native trivial-sigma-algebra theorem.

**Acceptance:** The exact displayed hypotheses and conventions appear in the suggested signature.

**Source:** [Omri Sarig](https://www.weizmann.ac.il/math/sarigo/sites/math.sarigo/files/uploads/transferoperatorcourse-bonn.pdf), Appendix A.2, physical pp.31–35, continued-fraction cylinders and exactness. Refinement of the cylinder proof on irrational points; endpoint and density corrections from the inherited review are retained.

#### tail-ce-l1-limit — Reverse conditional expectations converge in L1

**Lemma.** Under the preceding exact-system hypotheses, for Borel A the integral ∫|μ[1_A|Ftail_n]−μ.real(A)| tends to zero.

**Direct prerequisites:** `tail-ce-constant`, `tail-sigma-antitone`, `tauceti:MeasureTheory.tendsto_eLpNorm_condExp_iInf`, `mathlib:MeasureTheory.eLpNorm_one_eq_lintegral_enorm`.

**Construction or proof:**

1. Use the pinned downward conditional-expectation theorem for the antitone Ftail_n and finite μ.
2. Replace the tail conditional expectation by the constant μ(A).
3. Convert eLpNorm at exponent one into the integral of absolute value for integrable real differences.

**Acceptance:** The exact displayed hypotheses and conventions appear in the suggested signature.

**Source:** [Omri Sarig](https://www.weizmann.ac.il/math/sarigo/sites/math.sarigo/files/uploads/transferoperatorcourse-bonn.pdf), Appendix A.2, physical pp.31–35, continued-fraction cylinders and exactness. Refinement of the cylinder proof on irrational points; endpoint and density corrections from the inherited review are retained.

#### tail-correlation-bound — Exactness supplies the strong-mixing correlation bound

**Lemma.** For measurable A,B in the preceding probability system, |μ.real(A∩(T^n)⁻¹B)−μ.real(A)μ.real(B)|≤∫|μ[1_A|Ftail_n]−μ.real(A)|.

**Direct prerequisites:** `tail-event-preimage`, `tail-ce-l1-limit`, `mathlib:MeasureTheory.setIntegral_condExp`, `mathlib:MeasureTheory.integral_map`.

**Construction or proof:**

1. The preimage (T^n)⁻¹B is Ftail_n-measurable, so replace 1_A by its conditional expectation in the intersection integral.
2. Preservation gives μ((T^n)⁻¹B)=μ(B); subtract the constant product.
3. Bound the restricted absolute integral by the full L1 error; its convergence yields the inherited exact-system strong-mixing API.

**Acceptance:** The exact displayed hypotheses and conventions appear in the suggested signature.

**Source:** [Omri Sarig](https://www.weizmann.ac.il/math/sarigo/sites/math.sarigo/files/uploads/transferoperatorcourse-bonn.pdf), Appendix A.2, physical pp.31–35, continued-fraction cylinders and exactness. Refinement of the cylinder proof on irrational points; endpoint and density corrections from the inherited review are retained.

### Logarithmic statistics

#### digit-log-series-bound — Summable logarithmic digit weights

**Lemma.** The nonnegative series Σ_(a≥1) log(a)·log(1+1/(a(a+2)))/log 2 is summable. For a≥1 its summand is at most log(a)/(log 2·a²).

**Direct prerequisites:** `mathlib:Real.log_le_sub_one_of_pos`, `mathlib:Real.summable_nat_rpow`, `mathlib:Real.log_natCast_le_rpow_div`.

**Construction or proof:**

1. Use log(1+u)≤u for u≥0 and a(a+2)≥a².
2. For every positive a, the pinned logarithm/power bound with exponent 1/2 gives log a≤2sqrt a. Compare with 2a^(-3/2), whose native real p-series is summable.
3. Keep a=1 as a zero summand and finitely many small a separately.

**Acceptance:** The exact displayed hypotheses and conventions appear in the suggested signature.

**Source:** [Daniel Glasscock, Claire Merriman, Donald Robertson and Clifford Smyth](https://uncg.edu/~cdsmyth/UNCG_Ergodic_Theory_Summer_School_2020_Final_Lecture_Notes.pdf), Lesson 9, physical pp.45–49, printed pp.42–46: digit statistics and problem 2.4. Required logarithmic observables and denominator limit. The integral and series lemmas below are explicit worker refinements, using pinned logarithm and zeta results.

#### digit-log-integrable — Integrability of logarithmic first digits

**Lemma.** The real function x↦log(gaussDigit(0,x)) is μ_G-integrable, with integral equal to the inherited Khinchin logarithmic series.

**Direct prerequisites:** `digit-log-series-bound`, `cylinder-measurable`, `filtration-atoms`, `gauss-measure-api-2`, `khinchin-constant`.

**Construction or proof:**

1. Partition D into single-digit cylinders with positive natural digit a.
2. On each cylinder the function is constant log a and the mass is log(1+1/(a(a+2)))/log 2.
3. Sum its nonnegative integrals using the established summability; outside D is null.

**Acceptance:** Integrability is established before applying pointwise Birkhoff to log digit.

**Source:** [Daniel Glasscock, Claire Merriman, Donald Robertson and Clifford Smyth](https://uncg.edu/~cdsmyth/UNCG_Ergodic_Theory_Summer_School_2020_Final_Lecture_Notes.pdf), Lesson 9, physical pp.45–49, printed pp.42–46: digit statistics and problem 2.4. Required logarithmic observables and denominator limit. The integral and series lemmas below are explicit worker refinements, using pinned logarithm and zeta results.

#### negative-log-integrable — Integrability of negative logarithm for Gauss measure

**Lemma.** The real function x↦−log x is μ_G-integrable. Its restricted Lebesgue absolute integral is one, and the density upper bound 1/log 2 controls its Gauss integral.

**Direct prerequisites:** `gauss-measure`, `mathlib:integral_log`, `mathlib:intervalIntegral.intervalIntegrable_log'`.

**Construction or proof:**

1. On (0,1), −log x≥0 and the pinned log integral from 0 to 1 is −1.
2. Use interval integrability and endpoints of zero Lebesgue mass to get the restricted integral one.
3. Multiply by the positive bounded density to transfer absolute integrability.

**Acceptance:** The exact displayed hypotheses and conventions appear in the suggested signature.

**Source:** [Daniel Glasscock, Claire Merriman, Donald Robertson and Clifford Smyth](https://uncg.edu/~cdsmyth/UNCG_Ergodic_Theory_Summer_School_2020_Final_Lecture_Notes.pdf), Lesson 9, physical pp.45–49, printed pp.42–46: digit statistics and problem 2.4. Required logarithmic observables and denominator limit. The integral and series lemmas below are explicit worker refinements, using pinned logarithm and zeta results.

#### log-power-moment — Logarithmic monomial integral

**Lemma.** For every n≥0, ∫_(0,1) (−log x)x^n dx=1/(n+1)².

**Direct prerequisites:** `negative-log-integrable`, `mathlib:integral_log`, `mathlib:intervalIntegral.integral_mul_deriv_eq_deriv_mul_of_hasDerivAt`, `mathlib:tendsto_log_mul_rpow_nhdsGT_zero`, `mathlib:integral_pow`, `mathlib:MeasureTheory.tendsto_integral_of_dominated_convergence`.

**Construction or proof:**

1. Integrate by parts first on [ε,1], using antiderivative x^(n+1)/(n+1).
2. The boundary ε^(n+1)log ε tends to zero; the omitted integral tends to zero by integrability and 0≤x^n≤1.
3. Evaluate the remaining polynomial integral.

**Acceptance:** The n=0 case is one; no division by natural n at zero is introduced.

**Source:** [Daniel Glasscock, Claire Merriman, Donald Robertson and Clifford Smyth](https://uncg.edu/~cdsmyth/UNCG_Ergodic_Theory_Summer_School_2020_Final_Lecture_Notes.pdf), Lesson 9, physical pp.45–49, printed pp.42–46: digit statistics and problem 2.4. Required logarithmic observables and denominator limit. The integral and series lemmas below are explicit worker refinements, using pinned logarithm and zeta results.

#### alternating-zeta-two — Alternating reciprocal squares

**Lemma.** Σ_(n≥0) (-1)^n/(n+1)²=π²/12, and this series is absolutely summable.

**Direct prerequisites:** `mathlib:hasSum_zeta_two`.

**Construction or proof:**

1. Reindex the pinned reciprocal-square series, whose n=0 term is zero.
2. Separate even and odd positive indices; the even subsum is one fourth of π²/6.
3. Odd minus even is one half of the total, namely π²/12.

**Acceptance:** The exact displayed hypotheses and conventions appear in the suggested signature.

**Source:** [Daniel Glasscock, Claire Merriman, Donald Robertson and Clifford Smyth](https://uncg.edu/~cdsmyth/UNCG_Ergodic_Theory_Summer_School_2020_Final_Lecture_Notes.pdf), Lesson 9, physical pp.45–49, printed pp.42–46: digit statistics and problem 2.4. Required logarithmic observables and denominator limit. The integral and series lemmas below are explicit worker refinements, using pinned logarithm and zeta results.

#### negative-log-geometric-series — Interchange for the Gauss logarithmic integral

**Lemma.** ∫_(0,1) (−log x)/(1+x) dx=Σ_(n≥0) (-1)^n/(n+1)².

**Direct prerequisites:** `log-power-moment`, `alternating-zeta-two`, `mathlib:MeasureTheory.hasSum_integral_of_summable_integral_norm`.

**Construction or proof:**

1. For 0<x<1, the geometric series Σ(-x)^n is 1/(1+x).
2. The sum of the absolute integrals of (−log x)(−x)^n is Σ1/(n+1)², finite by the pinned zeta theorem.
3. Apply native integral/series interchange, avoiding an unjustified boundary-uniform geometric series at x=1.

**Acceptance:** The exact displayed hypotheses and conventions appear in the suggested signature.

**Source:** [Daniel Glasscock, Claire Merriman, Donald Robertson and Clifford Smyth](https://uncg.edu/~cdsmyth/UNCG_Ergodic_Theory_Summer_School_2020_Final_Lecture_Notes.pdf), Lesson 9, physical pp.45–49, printed pp.42–46: digit statistics and problem 2.4. Required logarithmic observables and denominator limit. The integral and series lemmas below are explicit worker refinements, using pinned logarithm and zeta results.

#### negative-log-integral — Evaluation of the Gauss logarithmic observable

**Lemma.** ∫ (−log x) dμ_G=π²/(12 log 2).

**Direct prerequisites:** `negative-log-geometric-series`, `alternating-zeta-two`, `negative-log-integrable`, `gauss-measure`.

**Construction or proof:**

1. Use the withDensity integral and its scalar normalization 1/log 2.
2. Apply the established alternating-square evaluation. This completes the proof input of the inherited gauss-density-log-integral.

**Acceptance:** The exact displayed hypotheses and conventions appear in the suggested signature.

**Source:** [Daniel Glasscock, Claire Merriman, Donald Robertson and Clifford Smyth](https://uncg.edu/~cdsmyth/UNCG_Ergodic_Theory_Summer_School_2020_Final_Lecture_Notes.pdf), Lesson 9, physical pp.45–49, printed pp.42–46: digit statistics and problem 2.4. Required logarithmic observables and denominator limit. The integral and series lemmas below are explicit worker refinements, using pinned logarithm and zeta results.

### Transfer operators and quantitative convergence

#### gauss-density-transfer — Gauss transfer operator on real functions

**Definition.** For a real function f define (L f)(x)=Σ_(a≥1) f(1/(a+x))/(a+x)², using the native real infinite sum. Statements on I=[0,1] require f continuous on I (or the stated boundedness) so the series converges there. Values outside I are totalized by the native sum convention and have no dynamics claim.

**Direct prerequisites:** `inverse-word`.

**Construction or proof:**

1. Use the native real sum indexed by a=n+1, retaining the positive branch indexing.

**Uses:**

- `density-pushforward`: It transports densities under Gauss iterates.
- `density-uniform-error`: Start from the uniform Lebesgue density f=1.

**API:**

| Declaration | Role | Statement | Proof node |
|---|---|---|---|
| `gaussDensityTransfer_zero` | simp | L(0)=0. | `density-transfer-zero` |
| `gaussDensityTransfer_add` | structure | For f,g continuous on I, L(f+g)=Lf+Lg on I. | `density-transfer-add` |
| `gaussDensityTransfer_duality` | compatibility | For continuous f on I and bounded Borel ψ on I, ∫_I ψ Lf dm=∫_I (ψ∘T)f dm. | `density-transfer-duality` |
| `gaussDensityTransfer_smul` | structure | For continuous f on I, L(c f)=c Lf on I. | `density-transfer-scalar` |
| `gaussDensityTransfer_nonnegative` | relation | For continuous f≥0 on I, Lf≥0 there. | `density-transfer-nonnegative` |
| `gaussDensityTransfer_continuous` | structure | Continuous f on I has continuous Lf on I. | `density-transfer-continuous` |

**Unit tests:**

- `density_transfer_zero` (degenerate): L(0)(0)=0.
- `density_transfer_one_at_zero` (computation): L(1)(0)=π²/6, so L does not preserve the constant one pointwise.
- `density_transfer_gauss_fixed` (compatibility): For x∈I and h(x)=1/((1+x)log 2), Lh(x)=h(x).

**Acceptance:** The exact displayed hypotheses and conventions appear in the suggested signature.

**Source:** [Peng Sun](https://arxiv.org/pdf/1705.02921v2), Theorem 2, physical pp.3–6, specialized to p=1. C1 transfer-operator argument with absolute derivative coefficients restored. The new 9/10 bound is a worker-derived correction, not the paper’s claimed optimal rate.

#### density-transfer-zero — Zero Gauss density transfer

**Lemma.** L(0)=0 as a real function.

**Direct prerequisites:** `gauss-density-transfer`.

**Construction or proof:**

1. Every summand is zero.

**Acceptance:** The exact displayed hypotheses and conventions appear in the suggested signature.

**Source:** [Peng Sun](https://arxiv.org/pdf/1705.02921v2), Theorem 2, physical pp.3–6, specialized to p=1. C1 transfer-operator argument with absolute derivative coefficients restored. The new 9/10 bound is a worker-derived correction, not the paper’s claimed optimal rate.

#### density-transfer-summable — Absolute convergence of the density transfer

**Lemma.** For f continuous on I, the defining series for Lf converges absolutely and uniformly on I; its a-th absolute summand is bounded by C/a² where C bounds |f| on I.

**Direct prerequisites:** `gauss-density-transfer`, `mathlib:hasSum_zeta_two`.

**Construction or proof:**

1. Compactness bounds the continuous f on I, and every inverse branch maps I into I.
2. Use (a+x)²≥a² for a≥1 and x∈I, then the reciprocal-square majorant.

**Acceptance:** The exact displayed hypotheses and conventions appear in the suggested signature.

**Source:** [Peng Sun](https://arxiv.org/pdf/1705.02921v2), Theorem 2, physical pp.3–6, specialized to p=1. C1 transfer-operator argument with absolute derivative coefficients restored. The new 9/10 bound is a worker-derived correction, not the paper’s claimed optimal rate.

#### density-transfer-add — Additivity on interval-continuous inputs

**Lemma.** If f,g are continuous on I, then L(f+g)(x)=Lf(x)+Lg(x) for x∈I.

**Direct prerequisites:** `gauss-density-transfer`, `density-transfer-summable`.

**Construction or proof:**

1. Use native infinite-sum additivity for the two summable branch series.

**Acceptance:** The exact displayed hypotheses and conventions appear in the suggested signature.

**Source:** [Peng Sun](https://arxiv.org/pdf/1705.02921v2), Theorem 2, physical pp.3–6, specialized to p=1. C1 transfer-operator argument with absolute derivative coefficients restored. The new 9/10 bound is a worker-derived correction, not the paper’s claimed optimal rate.

#### density-transfer-duality — Lebesgue transfer duality

**Lemma.** For f continuous on I and ψ Borel and bounded on I, ∫_I ψ(x)Lf(x) dx=∫_I ψ(Ty)f(y) dy.

**Direct prerequisites:** `density-transfer-summable`, `gauss-branch-derivative`, `cylinder-image`, `irrational-conull`, `mathlib:MeasureTheory.hasSum_integral_of_summable_integral_norm`, `mathlib:MeasureTheory.integral_image_eq_integral_abs_det_fderiv_smul`.

**Construction or proof:**

1. On each branch interval substitute y=1/(a+x), with absolute Jacobian (a+x)^(-2).
2. Endpoint values and rational branch boundaries are null.
3. The bounded ψ,f and square-summable branch domination justify summing the branch integrals; the intervals partition the unit interval modulo a null set.

**Acceptance:** This duality is relative to restricted Lebesgue measure; the normalized operator P below is different.

**Source:** [Peng Sun](https://arxiv.org/pdf/1705.02921v2), Theorem 2, physical pp.3–6, specialized to p=1. C1 transfer-operator argument with absolute derivative coefficients restored. The new 9/10 bound is a worker-derived correction, not the paper’s claimed optimal rate.

#### normalized-gauss-transfer — Density-normalized Gauss transfer

**Definition.** For real g define (P g)(x)=Σ_(a≥1) h_a(x)g(v_a(x)), where v_a(x)=1/(a+x) and h_a(x)=(1+x)/((a+x)(a+1+x)). On I these are nonnegative weights summing to one. P acts directly on real functions; no new C1 or Lipschitz Banach-space carrier is created.

**Direct prerequisites:** `gauss-density-transfer`, `gauss-density-telescope`.

**Construction or proof:**

1. Use native infinite sum and the explicitly normalized branch weights.

**Uses:**

- `transfer-derivative-contraction`: Derivative contraction of P supplies an elementary rate.
- `weighted-mean-pins-limit`: Its conserved weighted mean identifies the limiting constant.

**API:**

| Declaration | Role | Statement | Proof node |
|---|---|---|---|
| `normalizedGaussTransfer_const` | simp | For x∈I, P(constant c)(x)=c. | `normalized-transfer-constant` |
| `normalizedGaussTransfer_conjugate` | compatibility | For f continuous on I, P((1+·)f)(x)=(1+x)Lf(x) for x∈I. | `normalized-transfer-conjugate` |
| `normalizedGaussTransfer_integral` | relation | For continuous g on I, ∫_I Pg(x)/(1+x) dx=∫_I g(x)/(1+x) dx. | `normalized-transfer-integral` |
| `normalizedGaussTransfer_add` | structure | For continuous g,h on I, P(g+h)=Pg+Ph on I. | `normalized-transfer-add` |
| `normalizedGaussTransfer_smul` | structure | For continuous g on I, P(c g)=c Pg on I. | `normalized-transfer-scalar` |
| `normalizedGaussTransfer_bounds` | relation | For continuous g with c≤g≤C on I, c≤Pg≤C there. | `normalized-transfer-bounds` |

**Unit tests:**

- `normalized_transfer_zero` (degenerate): P(0)(0)=0.
- `normalized_transfer_one` (computation): For all x∈I, P(1)(x)=1.
- `normalized_transfer_coordinate` (non-example): P(id)(0)=π²/6−1, not 0; the operator is not the identity.

**Acceptance:** The exact displayed hypotheses and conventions appear in the suggested signature.

**Source:** [Peng Sun](https://arxiv.org/pdf/1705.02921v2), Theorem 2, physical pp.3–6, specialized to p=1. C1 transfer-operator argument with absolute derivative coefficients restored. The new 9/10 bound is a worker-derived correction, not the paper’s claimed optimal rate.

#### normalized-transfer-constant — Normalized transfer preserves constants

**Lemma.** For x∈I and real c, P(constant c)(x)=c.

**Direct prerequisites:** `normalized-gauss-transfer`, `gauss-density-telescope`.

**Construction or proof:**

1. The branch weights sum to one by telescoping; multiply by c.

**Acceptance:** The exact displayed hypotheses and conventions appear in the suggested signature.

**Source:** [Peng Sun](https://arxiv.org/pdf/1705.02921v2), Theorem 2, physical pp.3–6, specialized to p=1. C1 transfer-operator argument with absolute derivative coefficients restored. The new 9/10 bound is a worker-derived correction, not the paper’s claimed optimal rate.

#### normalized-transfer-conjugate — Conjugacy of the two transfer operators

**Lemma.** For f continuous on I, P((1+·)f)(x)=(1+x)Lf(x) for all x∈I.

**Direct prerequisites:** `normalized-gauss-transfer`, `density-transfer-summable`.

**Construction or proof:**

1. At v_a, (1+v_a)h_a=(1+x)/(a+x)².
2. Use summability and factor the constant 1+x from the native sum.

**Acceptance:** The exact displayed hypotheses and conventions appear in the suggested signature.

**Source:** [Peng Sun](https://arxiv.org/pdf/1705.02921v2), Theorem 2, physical pp.3–6, specialized to p=1. C1 transfer-operator argument with absolute derivative coefficients restored. The new 9/10 bound is a worker-derived correction, not the paper’s claimed optimal rate.

#### normalized-transfer-integral — Preservation of the weighted mean

**Lemma.** For g continuous on I, ∫_I Pg(x)/(1+x) dx=∫_I g(x)/(1+x) dx.

**Direct prerequisites:** `normalized-transfer-conjugate`, `density-transfer-duality`.

**Construction or proof:**

1. Put f=g/(1+x), continuous on I, in the conjugacy.
2. Apply Lebesgue duality with ψ=1.

**Acceptance:** The exact displayed hypotheses and conventions appear in the suggested signature.

**Source:** [Peng Sun](https://arxiv.org/pdf/1705.02921v2), Theorem 2, physical pp.3–6, specialized to p=1. C1 transfer-operator argument with absolute derivative coefficients restored. The new 9/10 bound is a worker-derived correction, not the paper’s claimed optimal rate.

#### transfer-branch-c1 — C1 branch summands and their uniform majorants

**Lemma.** For g of native class ContDiffOn real 1 on I, each x↦h_a(x)g(v_a(x)) is C1 on I. If |g| and |derivWithin g I| are bounded by C, then its absolute derivative is bounded by 4C/(a(a+1)) uniformly for a≥1 and x∈I; its value is bounded by 2C/(a(a+1)).

**Direct prerequisites:** `normalized-gauss-transfer`, `gauss-branch-derivative`, `mathlib:contDiffOn_one_iff_derivWithin`.

**Construction or proof:**

1. Use native within-interval product and chain rules, since v_a(I)⊆I.
2. Compute h_a′=(a²−a−1−2x−x²)/((a+x)²(a+1+x)²).
3. Bound |h_a′|≤3/(a(a+1)) and h_a/(a+x)²≤1/(a(a+1)); bound h_a≤2/(a(a+1)).

**Acceptance:** The exact displayed hypotheses and conventions appear in the suggested signature.

**Source:** [Peng Sun](https://arxiv.org/pdf/1705.02921v2), Theorem 2, physical pp.3–6, specialized to p=1. C1 transfer-operator argument with absolute derivative coefficients restored. The new 9/10 bound is a worker-derived correction, not the paper’s claimed optimal rate.

#### transfer-interior-derivative — Termwise derivative on the open interval

**Lemma.** For C1 g on I and 0<x<1, (Pg)′(x)=Σ_(a≥1) [h_a′(x)g(v_a(x))−h_a(x)/(a+x)²·g′(v_a(x))]. The derivative series converges uniformly on I when expressed using derivWithin g I.

**Direct prerequisites:** `transfer-branch-c1`, `mathlib:hasDerivAt_tsum_of_isPreconnected`.

**Construction or proof:**

1. The telescoping majorant Σ1/(a(a+1)) is summable and bounds the derivatives uniformly.
2. Apply the pinned smooth-series theorem on the open preconnected interval (0,1), using the value-series summability at a base point.
3. Interior ordinary derivatives of g agree with its within-interval derivatives; at v_1(0)=1 endpoint derivatives are reserved for the endpoint lemma.

**Acceptance:** The exact displayed hypotheses and conventions appear in the suggested signature.

**Source:** [Peng Sun](https://arxiv.org/pdf/1705.02921v2), Theorem 2, physical pp.3–6, specialized to p=1. C1 transfer-operator argument with absolute derivative coefficients restored. The new 9/10 bound is a worker-derived correction, not the paper’s claimed optimal rate.

#### transfer-endpoint-derivative — Endpoint derivatives and C1 closure of P

**Lemma.** If g is C1 on I, then Pg is native ContDiffOn real 1 on I, and the displayed derivative series equals derivWithin(Pg) I at every x∈I, including 0 and 1.

**Direct prerequisites:** `transfer-branch-c1`, `transfer-interior-derivative`, `mathlib:hasDerivWithinAt_Ici_of_tendsto_deriv`, `mathlib:hasDerivWithinAt_Iic_of_tendsto_deriv`, `mathlib:contDiffOn_one_iff_derivWithin`, `mathlib:TendstoUniformlyOn.continuousOn`.

**Construction or proof:**

1. Uniformly convergent value and derivative series of continuous branch terms give continuous functions on the closed interval.
2. On its interior the derivative equality is already proved. At 0 apply the native right-endpoint extension theorem, and at 1 its left-endpoint counterpart, using these continuous derivative limits.
3. Restrict the half-line within derivatives to I; unique differentiability of I identifies derivWithin.
4. Use the native C1 characterization by differentiability and continuous within derivative.

**Acceptance:** The open-set smooth-series theorem alone does not prove the endpoint or closed-interval C1 claim.

**Source:** [Peng Sun](https://arxiv.org/pdf/1705.02921v2), Theorem 2, physical pp.3–6, specialized to p=1. C1 transfer-operator argument with absolute derivative coefficients restored. The new 9/10 bound is a worker-derived correction, not the paper’s claimed optimal rate.

#### transfer-derivative-cancellation — Cancellation of derivative weights

**Lemma.** For C1 g on I and x∈I, derivWithin(Pg) I x equals Σ_(a≥1) [h_a′(x)(g(v_a(x))−g(v_1(x)))−h_a(x)/(a+x)²·derivWithin g I (v_a(x))].

**Direct prerequisites:** `transfer-endpoint-derivative`, `normalized-transfer-constant`.

**Construction or proof:**

1. Differentiate the uniformly convergent identity Σh_a=1, obtaining Σh_a′=0 with the same closed-interval argument.
2. Subtract g(v_1(x)) times this zero series.

**Acceptance:** The exact displayed hypotheses and conventions appear in the suggested signature.

**Source:** [Peng Sun](https://arxiv.org/pdf/1705.02921v2), Theorem 2, physical pp.3–6, specialized to p=1. C1 transfer-operator argument with absolute derivative coefficients restored. The new 9/10 bound is a worker-derived correction, not the paper’s claimed optimal rate.

#### transfer-absolute-coefficients — Correct absolute coefficient estimate

**Lemma.** If g is C1 on I and |derivWithin g I|≤M there, M≥0, then for x∈I, |derivWithin(Pg) I x|≤M Σ_(a≥1) c_a(x), where c_a=δ_a|h_a′|+h_a/(a+x)² and δ_a=(a−1)/((1+x)(a+x)).

**Direct prerequisites:** `transfer-derivative-cancellation`, `mathlib:Convex.norm_image_sub_le_of_norm_hasFDerivWithin_le`.

**Construction or proof:**

1. Apply the native interval mean-value bound to |g(v_a)−g(v_1)|≤M|v_a−v_1|=Mδ_a.
2. Take absolute values of every derivative-weight contribution before summing.
3. Use absolute summability established by the C1 majorant.

**Acceptance:** h_2′(1)=−1/72. Replacing |h_a′| by h_a′ in this triangle estimate is invalid.

**Source:** [Peng Sun](https://arxiv.org/pdf/1705.02921v2), Theorem 2, physical pp.3–6, specialized to p=1. C1 transfer-operator argument with absolute derivative coefficients restored. The new 9/10 bound is a worker-derived correction, not the paper’s claimed optimal rate.

#### transfer-coefficient-one — First branch coefficient

**Lemma.** For x∈I, c_1(x)=1/((1+x)²(2+x))≤1/2.

**Direct prerequisites:** `transfer-absolute-coefficients`.

**Construction or proof:**

1. δ_1=0; bound each positive denominator from below.

**Acceptance:** The exact displayed hypotheses and conventions appear in the suggested signature.

**Source:** [Peng Sun](https://arxiv.org/pdf/1705.02921v2), Theorem 2, physical pp.3–6, specialized to p=1. C1 transfer-operator argument with absolute derivative coefficients restored. The new 9/10 bound is a worker-derived correction, not the paper’s claimed optimal rate.

#### transfer-coefficient-two — Second branch coefficient

**Lemma.** For x∈I, c_2(x)≤5/72.

**Direct prerequisites:** `transfer-absolute-coefficients`.

**Construction or proof:**

1. Use δ₂≤1/2, |h₂′|≤1/18 and hence δ₂|h₂′|≤1/36.
2. For the other term, clear the positive denominator: (2+x)^3(3+x)−24(1+x)=20x+30x²+9x³+x⁴≥0 on I, giving h₂/(2+x)²≤1/24.
3. Add the bounds to obtain c₂≤5/72.

**Acceptance:** The exact displayed hypotheses and conventions appear in the suggested signature.

**Source:** [Peng Sun](https://arxiv.org/pdf/1705.02921v2), Theorem 2, physical pp.3–6, specialized to p=1. C1 transfer-operator argument with absolute derivative coefficients restored. The new 9/10 bound is a worker-derived correction, not the paper’s claimed optimal rate.

#### transfer-positive-coefficient — Positive derivative coefficients after the second branch

**Lemma.** For a≥3 and x∈I, h_a′≥0 and c_a(x)=[a(a−1)²+(2+x)(1+x)²]/[(1+x)(a+x)^3(a+1+x)^2].

**Direct prerequisites:** `transfer-absolute-coefficients`.

**Construction or proof:**

1. The derivative numerator is at least a²−a−4≥2.
2. Combine the two fractions using positive denominators.

**Acceptance:** The exact displayed hypotheses and conventions appear in the suggested signature.

**Source:** [Peng Sun](https://arxiv.org/pdf/1705.02921v2), Theorem 2, physical pp.3–6, specialized to p=1. C1 transfer-operator argument with absolute derivative coefficients restored. The new 9/10 bound is a worker-derived correction, not the paper’s claimed optimal rate.

#### transfer-coefficient-three — Third branch coefficient

**Lemma.** For x∈I, c_3(x)≤7/216.

**Direct prerequisites:** `transfer-positive-coefficient`.

**Construction or proof:**

1. Use the positive coefficient formula.
2. After clearing denominators, 14·den(x)−432·num(x)=12960x+12762x²+6596x³+1848x⁴+252x⁵+14x⁶≥0.

**Acceptance:** The exact displayed hypotheses and conventions appear in the suggested signature.

**Source:** [Peng Sun](https://arxiv.org/pdf/1705.02921v2), Theorem 2, physical pp.3–6, specialized to p=1. C1 transfer-operator argument with absolute derivative coefficients restored. The new 9/10 bound is a worker-derived correction, not the paper’s claimed optimal rate.

#### transfer-coefficient-four — Fourth branch coefficient

**Lemma.** For x∈I, c_4(x)≤19/800.

**Direct prerequisites:** `transfer-positive-coefficient`.

**Construction or proof:**

1. Use the positive coefficient formula.
2. After clearing denominators, 38·den(x)−1600·num(x)=122720x+95592x²+37806x³+8170x⁴+874x⁵+38x⁶≥0.

**Acceptance:** The exact displayed hypotheses and conventions appear in the suggested signature.

**Source:** [Peng Sun](https://arxiv.org/pdf/1705.02921v2), Theorem 2, physical pp.3–6, specialized to p=1. C1 transfer-operator argument with absolute derivative coefficients restored. The new 9/10 bound is a worker-derived correction, not the paper’s claimed optimal rate.

#### transfer-coefficient-tail — Reciprocal-square bound for branches with a≥5

**Lemma.** For a≥5 and x∈I, c_a(x)≤1/a².

**Direct prerequisites:** `transfer-positive-coefficient`.

**Construction or proof:**

1. The positive formula numerator is at most a(a−1)²+12 and its denominator is at least a³(a+1)².
2. The required inequality is 12≤4a².

**Acceptance:** The exact displayed hypotheses and conventions appear in the suggested signature.

**Source:** [Peng Sun](https://arxiv.org/pdf/1705.02921v2), Theorem 2, physical pp.3–6, specialized to p=1. C1 transfer-operator argument with absolute derivative coefficients restored. The new 9/10 bound is a worker-derived correction, not the paper’s claimed optimal rate.

#### transfer-square-tail — Telescoping bound on the reciprocal-square tail

**Lemma.** Σ_(a≥5) 1/a²≤1/4.

**Direct prerequisites:** `mathlib:hasSum_zeta_two`.

**Construction or proof:**

1. For a≥5, 1/a²≤1/(a(a−1))=1/(a−1)−1/a.
2. Telescope finite tails and pass to the summable limit.

**Acceptance:** The exact displayed hypotheses and conventions appear in the suggested signature.

**Source:** [Peng Sun](https://arxiv.org/pdf/1705.02921v2), Theorem 2, physical pp.3–6, specialized to p=1. C1 transfer-operator argument with absolute derivative coefficients restored. The new 9/10 bound is a worker-derived correction, not the paper’s claimed optimal rate.

#### transfer-coefficient-total — Uniform corrected contraction coefficient

**Lemma.** For every x∈I, Σ_(a≥1)c_a(x)≤18913/21600<9/10.

**Direct prerequisites:** `transfer-coefficient-one`, `transfer-coefficient-two`, `transfer-coefficient-three`, `transfer-coefficient-four`, `transfer-coefficient-tail`, `transfer-square-tail`.

**Construction or proof:**

1. Split branches 1,2,3,4 and the tail.
2. Add 1/2+5/72+7/216+19/800+1/4=18913/21600; its distance below 9/10 is 527/21600.

**Acceptance:** The exact displayed hypotheses and conventions appear in the suggested signature.

**Source:** [Peng Sun](https://arxiv.org/pdf/1705.02921v2), Theorem 2, physical pp.3–6, specialized to p=1. C1 transfer-operator argument with absolute derivative coefficients restored. The new 9/10 bound is a worker-derived correction, not the paper’s claimed optimal rate.

#### transfer-derivative-contraction — Elementary C1 derivative contraction

**Lemma.** For C1 g on I, M≥0 and |derivWithin g I|≤M on I, |derivWithin(Pg) I|≤(9/10)M on I.

**Direct prerequisites:** `transfer-absolute-coefficients`, `transfer-coefficient-total`.

**Construction or proof:**

1. Combine the absolute coefficient estimate with the uniform total bound.

**Acceptance:** The exact displayed hypotheses and conventions appear in the suggested signature.

**Source:** [Peng Sun](https://arxiv.org/pdf/1705.02921v2), Theorem 2, physical pp.3–6, specialized to p=1. C1 transfer-operator argument with absolute derivative coefficients restored. The new 9/10 bound is a worker-derived correction, not the paper’s claimed optimal rate.

#### transfer-iterate-c1-bound — C1 derivative bound for every iterate

**Lemma.** For C1 g on I and derivative bound M≥0, P^n g is C1 on I and its within derivative is bounded by (9/10)^n M.

**Direct prerequisites:** `transfer-endpoint-derivative`, `transfer-derivative-contraction`.

**Construction or proof:**

1. Induct on n starting with P^0 g=g, using C1 closure and the contraction at each step.

**Acceptance:** The exact displayed hypotheses and conventions appear in the suggested signature.

**Source:** [Peng Sun](https://arxiv.org/pdf/1705.02921v2), Theorem 2, physical pp.3–6, specialized to p=1. C1 transfer-operator argument with absolute derivative coefficients restored. The new 9/10 bound is a worker-derived correction, not the paper’s claimed optimal rate.

#### weighted-mean-pins-limit — Conserved weighted mean pins the transfer constant

**Lemma.** For C1 g on I, set c=(∫_I g(x)/(1+x) dx)/log 2. If |derivWithin g I|≤M, then for every n and x∈I, |P^n g(x)−c|≤(9/10)^n M.

**Direct prerequisites:** `transfer-iterate-c1-bound`, `normalized-transfer-integral`, `mathlib:Convex.norm_image_sub_le_of_norm_hasFDerivWithin_le`, `mathlib:integral_one_div_of_pos`.

**Construction or proof:**

1. The weighted mean of P^n g is the same as that of g, and the positive weight integrates to log 2. Translate ∫_0^1(1+x)^(-1) by x↦1+x to the pinned positive reciprocal integral from 1 to 2.
2. For fixed x, integrate the mean-value bound |P^n g(x)−P^n g(y)|≤(9/10)^n M|x−y|≤(9/10)^n M against the normalized weight.
3. This directly bounds distance to its weighted mean without choosing a zero of the derivative or invoking a spectral decomposition.

**Acceptance:** The exact displayed hypotheses and conventions appear in the suggested signature.

**Source:** [Peng Sun](https://arxiv.org/pdf/1705.02921v2), Theorem 2, physical pp.3–6, specialized to p=1. C1 transfer-operator argument with absolute derivative coefficients restored. The new 9/10 bound is a worker-derived correction, not the paper’s claimed optimal rate.

#### density-pushforward — Iterated densities of the Gauss map

**Lemma.** For f continuous on I and nonnegative with ∫_I f=1, the pushforward under T^n of m.withDensity(ENNReal.ofReal∘f) equals m.withDensity(ENNReal.ofReal∘L^n f). In particular map(T^n,m) has density L^n 1.

**Direct prerequisites:** `density-transfer-duality`, `density-transfer-summable`, `normalized-transfer-conjugate`, `density-transfer-nonnegative`, `density-transfer-continuous`.

**Construction or proof:**

1. The defining density is continuous, nonnegative and integrable. Duality for bounded indicators identifies one-step pushforward measures.
2. The uniformly convergent branch series is continuous and nonnegative on I, allowing induction.
3. Apply the formula to f=1.

**Acceptance:** The exact displayed hypotheses and conventions appear in the suggested signature.

**Source:** [Peng Sun](https://arxiv.org/pdf/1705.02921v2), Theorem 2, physical pp.3–6, specialized to p=1. C1 transfer-operator argument with absolute derivative coefficients restored. The new 9/10 bound is a worker-derived correction, not the paper’s claimed optimal rate.

#### density-uniform-error — Uniform exponential Gauss–Kuzmin density estimate

**Theorem.** For every n≥0 and x∈I, |L^n 1(x)−1/((1+x)log 2)|≤(9/10)^n.

**Direct prerequisites:** `weighted-mean-pins-limit`, `normalized-transfer-conjugate`, `density-transfer-continuous`.

**Construction or proof:**

1. Take g_0(x)=1+x, whose within derivative on I is 1 and whose weighted mean is 1/log 2.
2. Induct the conjugacy P^n g_0=(1+x)L^n 1.
3. Divide the weighted-mean estimate by 1+x≥1.

**Acceptance:** This proves an explicit sufficient rate, not the source’s sharper Q_1 or the Gauss–Kuzmin–Wirsing optimal rate.

**Source:** [Peng Sun](https://arxiv.org/pdf/1705.02921v2), Theorem 2, physical pp.3–6, specialized to p=1. C1 transfer-operator argument with absolute derivative coefficients restored. The new 9/10 bound is a worker-derived correction, not the paper’s claimed optimal rate.

#### digit-marginal-error — Uniform digit-marginal convergence

**Lemma.** For every a≥1 and n≥0, |m.real{x:gaussDigit(n,x)=a}−log((a+1)²/(a(a+2)))/log 2|≤(9/10)^n.

**Direct prerequisites:** `density-pushforward`, `density-uniform-error`, `gauss-digit-api-2`, `gauss-measure-api-2`.

**Construction or proof:**

1. Use the nth digit as the first-digit cylinder pulled back under T^n.
2. Integrate the uniform density error over that cylinder, whose Lebesgue length is at most one.
3. Its Gauss mass is the inherited logarithmic digit probability. The inherited gauss-kuzmin target holds with C=1 and ρ=9/10.

**Acceptance:** The exact displayed hypotheses and conventions appear in the suggested signature.

**Source:** [Peng Sun](https://arxiv.org/pdf/1705.02921v2), Theorem 2, physical pp.3–6, specialized to p=1. C1 transfer-operator argument with absolute derivative coefficients restored. The new 9/10 bound is a worker-derived correction, not the paper’s claimed optimal rate.

#### density-transfer-scalar — Scalar linearity of the density transfer

**Lemma.** For c real, f continuous on I and x∈I, L(c f)(x)=c Lf(x).

**Direct prerequisites:** `gauss-density-transfer`, `density-transfer-summable`.

**Construction or proof:**

1. Use absolute convergence of the branch series for f and c f.
2. Factor the fixed scalar through the native sum.

**Acceptance:** The exact displayed hypotheses and conventions appear in the suggested signature.

**Source:** [Peng Sun](https://arxiv.org/pdf/1705.02921v2), Theorem 2, physical pp.3–6, specialized to p=1. C1 transfer-operator argument with absolute derivative coefficients restored. The new 9/10 bound is a worker-derived correction, not the paper’s claimed optimal rate.

#### density-transfer-nonnegative — Positive densities remain positive

**Lemma.** For f continuous on I with f≥0 on I, Lf(x)≥0 for every x∈I.

**Direct prerequisites:** `density-transfer-summable`.

**Construction or proof:**

1. Every inverse branch maps I into I and every Jacobian weight is nonnegative.
2. Finite partial sums are nonnegative; their limit is Lf.

**Acceptance:** The exact displayed hypotheses and conventions appear in the suggested signature.

**Source:** [Peng Sun](https://arxiv.org/pdf/1705.02921v2), Theorem 2, physical pp.3–6, specialized to p=1. C1 transfer-operator argument with absolute derivative coefficients restored. The new 9/10 bound is a worker-derived correction, not the paper’s claimed optimal rate.

#### normalized-transfer-add — Additivity of normalized transfer

**Lemma.** For continuous g,h on I and x∈I, P(g+h)(x)=Pg(x)+Ph(x).

**Direct prerequisites:** `normalized-transfer-conjugate`, `density-transfer-add`.

**Construction or proof:**

1. Apply the conjugacy to g/(1+x) and h/(1+x), continuous since 1+x≥1 on I.
2. Use additivity of L and simplify the nonzero factors.

**Acceptance:** The exact displayed hypotheses and conventions appear in the suggested signature.

**Source:** [Peng Sun](https://arxiv.org/pdf/1705.02921v2), Theorem 2, physical pp.3–6, specialized to p=1. C1 transfer-operator argument with absolute derivative coefficients restored. The new 9/10 bound is a worker-derived correction, not the paper’s claimed optimal rate.

#### normalized-transfer-scalar — Scalar linearity of normalized transfer

**Lemma.** For c real, g continuous on I and x∈I, P(c g)(x)=c Pg(x).

**Direct prerequisites:** `normalized-transfer-conjugate`, `density-transfer-scalar`.

**Construction or proof:**

1. Apply the conjugacy to g/(1+x) and factor the scalar through L.

**Acceptance:** The exact displayed hypotheses and conventions appear in the suggested signature.

**Source:** [Peng Sun](https://arxiv.org/pdf/1705.02921v2), Theorem 2, physical pp.3–6, specialized to p=1. C1 transfer-operator argument with absolute derivative coefficients restored. The new 9/10 bound is a worker-derived correction, not the paper’s claimed optimal rate.

#### normalized-transfer-bounds — Preservation of pointwise interval bounds

**Lemma.** If g is continuous on I and c≤g(x)≤C there, then c≤Pg(x)≤C for x∈I.

**Direct prerequisites:** `normalized-transfer-constant`, `normalized-transfer-add`, `normalized-transfer-scalar`, `density-transfer-nonnegative`, `normalized-transfer-conjugate`.

**Construction or proof:**

1. Use positive transfer of g−c and C−g through conjugacy.
2. Use linearity and constant preservation to obtain both bounds.

**Acceptance:** The exact displayed hypotheses and conventions appear in the suggested signature.

**Source:** [Peng Sun](https://arxiv.org/pdf/1705.02921v2), Theorem 2, physical pp.3–6, specialized to p=1. C1 transfer-operator argument with absolute derivative coefficients restored. The new 9/10 bound is a worker-derived correction, not the paper’s claimed optimal rate.

#### density-transfer-continuous — Continuity of transferred densities

**Lemma.** For f continuous on I, Lf is continuous on I.

**Direct prerequisites:** `density-transfer-summable`, `mathlib:TendstoUniformlyOn.continuousOn`.

**Construction or proof:**

1. Every finite sum of branch terms is continuous on I because a+x≥1.
2. Apply the native uniform-limit continuity theorem to the uniformly convergent branch partial sums.

**Acceptance:** The exact displayed hypotheses and conventions appear in the suggested signature.

**Source:** [Peng Sun](https://arxiv.org/pdf/1705.02921v2), Theorem 2, physical pp.3–6, specialized to p=1. C1 transfer-operator argument with absolute derivative coefficients restored. The new 9/10 bound is a worker-derived correction, not the paper’s claimed optimal rate.

### Homogeneous number-theory consumers

#### homogeneous-birkhoff — Pointwise averages on the modular homogeneous space

**Application.** Let G=SL(2, real), Γ=SL(2, integer) embedded entrywise, X=G/Γ with its quotient Borel structure, μ the normalized G-invariant Haar probability, a_t=diag(exp t, exp(-t)), and S(gΓ)=a_1 gΓ. For every μ-integrable real f, native Birkhoff averages of S converge μ-almost everywhere to ∫f dμ.

**Direct prerequisites:** `GeometryOfNumbersAndQuadraticArithmetic:GN.4`, `GeometryOfNumbersAndQuadraticArithmetic:GN.4/homogeneous-ergodicity`, `birkhoff-pointwise-ergodic`, `GeometryOfNumbersAndQuadraticArithmetic:GN.4/howe-moore-mixing`, `mathlib:Matrix.SpecialLinearGroup`, `mathlib:Matrix.SpecialLinearGroup.map`, `mathlib:QuotientGroup.mk`, `mathlib:QuotientGroup.instTopologicalSpace`, `mathlib:borel`.

**Construction or proof:**

1. Import the concrete quotient, lattice, normalized measure and left-action contract requested from GN.4.
2. The subgroup {a_t:t∈real} is closed and noncompact; to conclude time-one ergodicity use the stronger GN.4 Howe–Moore mixing restriction, since continuous-flow ergodicity alone does not imply time-one ergodicity.
3. Apply the inherited pointwise ergodic theorem to S and f.

**Acceptance:** This is Haar-almost-everywhere on X. It makes no assertion about every point u_xΓ or Lebesgue-almost-everywhere on a single horocycle.

**Source:** [Alexander Gorodnik](https://www.math.uzh.ch/gorodnik/tifr/lecture1.pdf), Lecture 1, physical pp.3–8, bounded geodesics and lattices. Consumer comparison only. Generic quotient dynamics and Mahler compactness remain owned by GN.4; row-vector and time conventions are converted explicitly.

#### bounded-digits-compact-orbit — Bounded continued fractions and compact diagonal semiorbits

**Comparison.** For irrational real x with 0<x<1, let u_x=[[1,x],[0,1]] and a_t=diag(exp t,exp(-t)). There exists B∈natural with every inherited Gauss digit a_n(x)≤B if and only if the closure in SL(2,real)/SL(2,integer) of {a_t u_x Γ:t≥0} is compact.

**Direct prerequisites:** `DiophantineApproximationAndTranscendence:DT.0`, `GeometryOfNumbersAndQuadraticArithmetic:GN.4/mahler-compactness`, `diagonal-short-vector-forward`, `diagonal-short-vector-reverse`, `column-row-convention`, `mathlib:Matrix.SpecialLinearGroup`, `mathlib:Matrix.SpecialLinearGroup.map`, `mathlib:QuotientGroup.mk`, `mathlib:QuotientGroup.instTopologicalSpace`, `mathlib:borel`.

**Construction or proof:**

1. Import the requested DT.0 equivalence between bounded native continued-fraction digits and badly approximable numbers, with irrationality retained.
2. Use the two explicit short-vector estimates and GN.4 Mahler compactness to obtain the diagonal-semiorbit criterion.
3. Translate the source’s row-vector Γ\G convention by transpose and double its time parameter.

**Acceptance:** The rational x=0 has the short vector (0,exp(-t)) and an unbounded orbit; irrationality is essential.

**Source:** [Alexander Gorodnik](https://www.math.uzh.ch/gorodnik/tifr/lecture1.pdf), Lecture 1, physical pp.3–8, bounded geodesics and lattices. Consumer comparison only. Generic quotient dynamics and Mahler compactness remain owned by GN.4; row-vector and time conventions are converted explicitly.

#### typical-unbounded-semiorbit — Typical Gauss digits give noncompact semiorbits

**Application.** For restricted Lebesgue-almost every x∈(0,1), the positive diagonal semiorbit a_t u_x Γ is not relatively compact. More precisely, on one conull irrational set, every a≥1 occurs with its positive Gauss frequency, so the digit sequence is unbounded and the bounded-digits criterion applies.

**Direct prerequisites:** `bounded-digits-compact-orbit`, `gauss-digit-frequency`, `gauss-measure-api-3`.

**Construction or proof:**

1. Intersect the countably many conull digit-frequency sets and the irrational set.
2. If digits were bounded by B, the positive-frequency digit B+1 could not occur.
3. Apply the compact-orbit comparison and equivalence of Gauss and restricted Lebesgue measure.

**Acceptance:** No rate of cusp escape and no homogeneous equidistribution along a horocycle is inferred.

**Source:** [Alexander Gorodnik](https://www.math.uzh.ch/gorodnik/tifr/lecture1.pdf), Lecture 1, physical pp.3–8, bounded geodesics and lattices. Consumer comparison only. Generic quotient dynamics and Mahler compactness remain owned by GN.4; row-vector and time conventions are converted explicitly.

#### column-row-convention — Row/column and diagonal-time comparison

**Comparison.** Transpose identifies the source’s row-lattice class Γg in Γ\SL(2,real) with gᵀΓ in SL(2,real)/Γ. The row lattice {(p+xq,q)} uses g=u_xᵀ, and right multiplication by diag(exp(s/2),exp(−s/2)) becomes left multiplication by a_(s/2). Thus source positive time s corresponds to this document’s t=s/2.

**Direct prerequisites:** `GeometryOfNumbersAndQuadraticArithmetic:GN.4`, `mathlib:Matrix.SpecialLinearGroup`, `mathlib:Matrix.SpecialLinearGroup.map`, `mathlib:QuotientGroup.mk`, `mathlib:QuotientGroup.instTopologicalSpace`, `mathlib:borel`.

**Construction or proof:**

1. Transpose reverses multiplication and sends the integer subgroup to itself, so it descends to the two quotient conventions.
2. Check the row basis and the two diagonal entries explicitly.
3. The induced homeomorphism preserves relative compactness.

**Acceptance:** The exact displayed hypotheses and conventions appear in the suggested signature.

**Source:** [Alexander Gorodnik](https://www.math.uzh.ch/gorodnik/tifr/lecture1.pdf), Lecture 1, physical pp.3–8, bounded geodesics and lattices. Consumer comparison only. Generic quotient dynamics and Mahler compactness remain owned by GN.4; row-vector and time conventions are converted explicitly.

#### diagonal-short-vector-forward — Bad approximation gives a uniform short-vector lower bound

**Lemma.** Assume c>0 and q|qx−round(qx)|≥c for every positive natural q. For t≥0 and integers p,q not both zero, max(|exp(t)(p+xq)|,|exp(−t)q|)≥min(1,sqrt c).

**Direct prerequisites:** `DiophantineApproximationAndTranscendence:DT.0/badly-approximable`.

**Construction or proof:**

1. For q=0, |p|≥1 and exp t≥1.
2. For q≠0, nearest-integer minimality and the bound at |q| give |p+xq||q|≥c.
3. The product of the two scaled coordinates is the same; their maximum is at least sqrt c.

**Acceptance:** The exact displayed hypotheses and conventions appear in the suggested signature.

**Source:** [Alexander Gorodnik](https://www.math.uzh.ch/gorodnik/tifr/lecture1.pdf), Lecture 1, physical pp.3–8, bounded geodesics and lattices. Consumer comparison only. Generic quotient dynamics and Mahler compactness remain owned by GN.4; row-vector and time conventions are converted explicitly.

#### diagonal-short-vector-reverse — Uniform short vectors give a badly-approximable constant

**Lemma.** If 0<δ≤1 and for every t≥0 and integer pair (p,q)≠(0,0), max(|exp(t)(p+xq)|,|exp(−t)q|)≥δ, then q|qx−round(qx)|≥δ²/2 for every positive natural q.

**Direct prerequisites:** .

**Construction or proof:**

1. Choose p=−round(qx) and t=log(2q/δ)≥0.
2. The second coordinate has absolute value δ/2; hence the first has absolute value at least δ.
3. Use exp t=2q/δ and rearrange.

**Acceptance:** The exact displayed hypotheses and conventions appear in the suggested signature.

**Source:** [Alexander Gorodnik](https://www.math.uzh.ch/gorodnik/tifr/lecture1.pdf), Lecture 1, physical pp.3–8, bounded geodesics and lattices. Consumer comparison only. Generic quotient dynamics and Mahler compactness remain owned by GN.4; row-vector and time conventions are converted explicitly.

## Imported-target refinement map

The imported target keeps its existing identifier. The following new proof inputs refine its implementation chain. No imported definition or named target is replaced.

| Imported target | New proof inputs |
|---|---|
| `birkhoff-coloring` | `upper-coloring-integrated`, `upper-truncation-bound` |
| `birkhoff-identification` | `invariant-set-integrals`, `native-condexp-identification` |
| `birkhoff-pointwise` | `nonnegative-limit`, `signed-limit`, `orbit-limit-invariant` |
| `gauss-cylinder-distortion` | `word-native-continuants`, `word-derivative` |
| `gauss-exact` | `cylinder-ce-lower-bound`, `tail-zero-one` |
| `exact-system-api-3` | `tail-ce-constant`, `tail-correlation-bound` |
| `gauss-log-integrability` | `digit-log-integrable`, `negative-log-integrable` |
| `gauss-density-log-integral` | `alternating-zeta-two`, `negative-log-integral` |
| `gauss-denominator-log-bridge` | `orbit-product-identity` |
| `gauss-kuzmin` | `density-uniform-error`, `digit-marginal-error` |

## Exact owner requests

### DiophantineApproximationAndTranscendence:DT.0

For irrational 0<x<1, bounded native GenContFract.of x partial denominators (equivalently this packet’s Gauss digits via native-stream-gauss) iff DT.0/badly-approximable: ∃c>0 ∀natural q≥1, q|qx−round(qx)|≥c. Import this theorem from the owner; DT.0 currently defines badly approximable but has no exact bounded-digit equivalence node. Preserve the positive denominator and irrationality hypotheses.

Consumers: `bounded-digits-compact-orbit`.

### GeometryOfNumbersAndQuadraticArithmetic:GN.4

Concrete SL(2,real)/SL(2,integer) quotient topology and Borel structure, the integer subgroup lattice proof and normalized invariant Haar probability; continuous left action of a_t=diag(exp t,exp(−t)); the max-norm version of GN.4/mahler-compactness; and time-one strong mixing of left a_1 from GN.4/howe-moore-mixing. Continuous-flow ergodicity alone does not supply time-one ergodicity. Also expose transpose Γ\G→G/Γ as the quotient homeomorphism for the consumer convention.

Consumers: `homogeneous-birkhoff`, `bounded-digits-compact-orbit`, `column-row-convention`.

## Pinned declaration inventory

These are existing statements, read at the recorded commits. Their hypotheses are part of the reduction; a matching name alone is insufficient.

| Reference | Module | Supplies |
|---|---|---|
| `mathlib:birkhoffAverage` | Mathlib/Dynamics/BirkhoffSum/Average.lean | A_n=(n:real)^(-1) times the finite orbit sum, with A_0=0. |
| `mathlib:MeasureTheory.integral_map` | Mathlib/MeasureTheory/Integral/Bochner/Basic.lean | Change of variables for an AEMeasurable map and an AEStronglyMeasurable integrand for its pushforward. Combined with MeasurePreserving.map_eq; no injectivity required. |
| `mathlib:MeasureTheory.Measure.QuasiMeasurePreserving.ae` | Mathlib/MeasureTheory/Measure/QuasiMeasurePreserving.lean | Pulls back an almost-everywhere predicate under a quasi-measure-preserving map; preservation supplies the quasi-preserving hypothesis. |
| `mathlib:MeasureTheory.AEStronglyMeasurable.mk` | Mathlib/MeasureTheory/Function/StronglyMeasurable/AEStronglyMeasurable.lean | Native strongly measurable representative, with stronglyMeasurable_mk, measurable_mk and ae_eq_mk read alongside it. |
| `mathlib:MeasureTheory.tendsto_integral_of_dominated_convergence` | Mathlib/MeasureTheory/Integral/DominatedConvergence.lean | Almost-everywhere convergence under an integrable real norm bound, with AEStronglyMeasurable terms, gives integral convergence. |
| `mathlib:MeasureTheory.lintegral_liminf_le` | Mathlib/MeasureTheory/Integral/Lebesgue/Add.lean | Fatou inequality for measurable ENNReal functions and a countably generated filter. |
| `mathlib:MeasureTheory.lintegral_iSup` | Mathlib/MeasureTheory/Integral/Lebesgue/Add.lean | Integral of the supremum of a monotone sequence of measurable ENNReal functions equals the supremum of their integrals. |
| `mathlib:MeasurableSpace.measurableSet_invariants` | Mathlib/MeasureTheory/MeasurableSpace/Invariants.lean | Native invariant measurability iff ambient measurable and exact preimage equality. |
| `mathlib:MeasurableSpace.measurable_invariants_dom` | Mathlib/MeasureTheory/MeasurableSpace/Invariants.lean | Native invariant-domain measurability iff ambient measurability and every measurable target preimage agrees after composing with T. |
| `mathlib:MeasureTheory.ae_eq_condExp_of_forall_setIntegral_eq` | Mathlib/MeasureTheory/Function/ConditionalExpectation/Basic.lean | Uniqueness: sub-sigma-algebra ≤ambient, sigma-finite trimmed measure, integrable f, integrability/equal integrals on its finite-measure measurable sets, and AEStronglyMeasurable g for that sigma-algebra. |
| `mathlib:MeasureTheory.setIntegral_condExp` | Mathlib/MeasureTheory/Function/ConditionalExpectation/Basic.lean | Integral of condExp over a sub-sigma-algebra-measurable set equals the integral of an integrable observable, when the sub-sigma-algebra is ≤ambient. |
| `mathlib:Set.countable_range` | Mathlib/Data/Set/Countable.lean | Range of a map from a countable type is countable. |
| `mathlib:Set.Countable.measure_zero` | Mathlib/MeasureTheory/Measure/Typeclasses/NullSingletonClass.lean | Countable sets have zero measure when all singletons have zero measure. |
| `mathlib:MeasureTheory.NullSingletonClass` | Mathlib/MeasureTheory/Measure/Typeclasses/NullSingletonClass.lean | Singleton measure zero under the native NullSingletonClass; Lebesgue measure on real has this instance. |
| `mathlib:Matrix` | Mathlib/LinearAlgebra/Matrix/Defs.lean | Native matrix type m→n→R; no alternative matrix carrier. |
| `mathlib:Matrix.det_mul` | Mathlib/LinearAlgebra/Matrix/Determinant/Basic.lean | Determinant of a product over a commutative ring is the product of determinants. |
| `mathlib:GenContFract.IntFractPair.stream` | Mathlib/Algebra/ContinuedFractions/Computation/Basic.lean | Optional floor/fractional-part stream: zero integer part at x∈(0,1), reciprocal recursion, and termination at a zero fractional part. |
| `mathlib:GenContFract.of` | Mathlib/Algebra/ContinuedFractions/Computation/Basic.lean | Native general continued fraction from a field element; all partial numerators one and denominator stream shifted by one. |
| `mathlib:GenContFract.terminates_iff_rat` | Mathlib/Algebra/ContinuedFractions/Computation/TerminatesIffRat.lean | Native fraction terminates iff its value is the cast of a rational, in an ordered floor field. |
| `mathlib:GenContFract.succ_nth_fib_le_of_nth_den` | Mathlib/Algebra/ContinuedFractions/Computation/Approximations.lean | fib(n+1)≤dens n when n=0 or the native fraction has not terminated at n−1. |
| `mathlib:GenContFract.of_den_mono` | Mathlib/Algebra/ContinuedFractions/Computation/Approximations.lean | For the native fraction of v, dens n≤dens(n+1), with no irrationality hypothesis. |
| `mathlib:GenContFract.nums_recurrence` | Mathlib/Algebra/ContinuedFractions/ContinuantsRecurrence.lean | Given an available native sequence pair at n+1 and the two previous numerator values, nums(n+2)=b nums(n+1)+a nums n. |
| `mathlib:GenContFract.dens_recurrence` | Mathlib/Algebra/ContinuedFractions/ContinuantsRecurrence.lean | The analogous native denominator recurrence, requiring the available sequence pair. |
| `mathlib:Nat.fib` | Mathlib/Data/Nat/Fib/Basic.lean | Native Fibonacci sequence from (0,1), with zero, one and add-two recurrence; used only for a lower bound, never a new carrier. |
| `mathlib:MeasureTheory.Filtration` | Mathlib/Probability/Process/Filtration.lean | Native monotone sequence of sub-sigma-algebras bounded by ambient; seq, mono and le fields. |
| `mathlib:MeasureTheory.Integrable.tendsto_ae_condExp` | Mathlib/Probability/Martingale/Convergence.lean | Finite measure and integrable real g strongly measurable for the supremum of a native filtration give almost-everywhere CE convergence to g. |
| `mathlib:MeasurableSpace.comap` | Mathlib/MeasureTheory/MeasurableSpace/Basic.lean | Pullback sigma-algebra consisting of preimages of measurable sets. |
| `mathlib:MeasurableSpace.comap_mono` | Mathlib/MeasureTheory/MeasurableSpace/Basic.lean | Monotonicity of pullback in the target sigma-algebra. |
| `mathlib:MeasurableSpace.measurableSet_comap` | Mathlib/MeasureTheory/MeasurableSpace/Basic.lean | Comap-measurable iff it is exactly the preimage of a target-measurable set. |
| `mathlib:MeasureTheory.eLpNorm_one_eq_lintegral_enorm` | Mathlib/MeasureTheory/Function/LpSeminorm/Defs.lean | Exponent-one eLpNorm is the ENNReal integral of the extended norm. |
| `mathlib:Real.log_le_sub_one_of_pos` | Mathlib/Analysis/SpecialFunctions/Log/Basic.lean | For x>0, log x≤x−1. |
| `mathlib:Real.log_natCast_le_rpow_div` | Mathlib/Analysis/SpecialFunctions/Pow/Real.lean | For ε>0 and natural n, log n≤n^ε/ε. |
| `mathlib:Real.summable_nat_rpow` | Mathlib/Analysis/PSeries.lean | The real series Σn^p is summable iff p<−1, with the native zero-base convention. |
| `mathlib:integral_log` | Mathlib/Analysis/SpecialFunctions/Integrals/Basic.lean | Real interval integral of log from a to b equals b log b−a log a−b+a, including endpoint zero. |
| `mathlib:intervalIntegral.intervalIntegrable_log'` | Mathlib/Analysis/SpecialFunctions/Integrability/Basic.lean | Lebesgue interval integrability of real log on every finite interval, without excluding zero. |
| `mathlib:intervalIntegral.integral_mul_deriv_eq_deriv_mul_of_hasDerivAt` | Mathlib/MeasureTheory/Integral/IntervalIntegral/IntegrationByParts.lean | Integration by parts for continuous endpoints, two interior derivatives and interval-integrable derivatives; used first on [ε,1]. |
| `mathlib:tendsto_log_mul_rpow_nhdsGT_zero` | Mathlib/Analysis/SpecialFunctions/Pow/Asymptotics.lean | For real r>0, log x times x^r tends to zero as x approaches zero from above. |
| `mathlib:integral_pow` | Mathlib/Analysis/SpecialFunctions/Integrals/Basic.lean | Interval integral of a natural real power, from the rpow integral; denominator exponent+1 is positive. |
| `mathlib:hasSum_zeta_two` | Mathlib/NumberTheory/ZetaValues.lean | HasSum of real 1/n² over natural n, including zero term zero, to π²/6. |
| `mathlib:MeasureTheory.hasSum_integral_of_summable_integral_norm` | Mathlib/MeasureTheory/Integral/DominatedConvergence.lean | Countable family of integrable functions with summable integrals of norms gives HasSum of integrals to the integral of the pointwise tsum. |
| `mathlib:MeasureTheory.integral_image_eq_integral_abs_det_fderiv_smul` | Mathlib/MeasureTheory/Function/Jacobian.lean | Native Bochner change of variables for an injective within-differentiable map on a measurable set with additive Haar measure; in dimension one its absolute determinant is the absolute derivative. |
| `mathlib:contDiffOn_one_iff_derivWithin` | Mathlib/Analysis/Calculus/ContDiff/Deriv.lean | On a uniquely differentiable domain, native C1 iff differentiable there and its within derivative is continuous there. |
| `mathlib:hasDerivAt_tsum_of_isPreconnected` | Mathlib/Analysis/Calculus/SmoothSeries.lean | Termwise derivative on an open preconnected set, using a summable uniform derivative bound and one-point value summability. It gives no closed-interval endpoint assertion. |
| `mathlib:hasDerivWithinAt_Ici_of_tendsto_deriv` | Mathlib/Analysis/Calculus/FDeriv/Extend.lean | Right-endpoint derivative from differentiability on a right neighborhood, continuity at the endpoint and a convergent interior derivative. |
| `mathlib:hasDerivWithinAt_Iic_of_tendsto_deriv` | Mathlib/Analysis/Calculus/FDeriv/Extend.lean | Left-endpoint counterpart with the left neighborhood and derivative limit. |
| `mathlib:Convex.norm_image_sub_le_of_norm_hasFDerivWithin_le` | Mathlib/Analysis/Calculus/MeanValue.lean | Convex-domain Lipschitz estimate for a uniform bound on native within Frechet derivatives. |
| `mathlib:integral_one_div_of_pos` | Mathlib/Analysis/SpecialFunctions/Integrals/Basic.lean | Positive-endpoint reciprocal integral equals log(b/a); translating [0,1] to [1,2] gives log 2. |
| `tauceti:MeasureTheory.tendsto_eLpNorm_condExp_iInf` | TauCeti/Probability/Martingale/Convergence.lean | For finite μ, an antitone family F_n with F_0≤ambient, eLpNorm_1 of μ[f\|F_n]−μ[f\|inf F_n] tends to zero. The statement applies to real f, with native condExp zero convention; no new reverse-martingale theory is needed. |
| `tauceti:TauCeti.MeasureTheory.condExp_ae_eq_integral_of_forall_zero_or_one` | TauCeti/MeasureTheory/Function/ConditionalExpectation.lean | If m′≤ambient and all its measurable sets have μ measure 0 or 1, native condExp of an integrable function into a complete real normed space is almost everywhere its constant integral. |
| `mathlib:Irrational` | Mathlib/NumberTheory/Real/Irrational.lean | Native predicate excluding the range of the rational cast; exactly the irrational domain used by the cylinders. |
| `mathlib:MeasurableSpace.invariants` | Mathlib/MeasureTheory/MeasurableSpace/Invariants.lean | Ambient measurable sets with strict preimage equality under the given endomap. |
| `mathlib:Matrix.SpecialLinearGroup` | Mathlib/LinearAlgebra/Matrix/SpecialLinearGroup.lean | Native subtype of square matrices of determinant one. Its subtype topology and matrix coercion are used in the concrete consumer. |
| `mathlib:Matrix.SpecialLinearGroup.map` | Mathlib/LinearAlgebra/Matrix/SpecialLinearGroup.lean | Entrywise ring homomorphism induces a group homomorphism on the native determinant-one groups; its range is the integer subgroup. |
| `mathlib:QuotientGroup.mk` | Mathlib/GroupTheory/Coset/Defs.lean | Native quotient map to right cosets of any subgroup, without a normality assumption. |
| `mathlib:QuotientGroup.instTopologicalSpace` | Mathlib/Topology/Algebra/Group/Quotient.lean | Native quotient topology for any subgroup of a topological group carrier; no quotient group structure is required. |
| `mathlib:borel` | Mathlib/MeasureTheory/Constructions/BorelSpace/Basic.lean | Native sigma-algebra generated by the open subsets of a topological carrier. |
| `mathlib:TendstoUniformlyOn.continuousOn` | Mathlib/Topology/UniformSpace/UniformApproximation.lean | Uniform-on-set convergence along a nontrivial filter and frequently continuous-on-set approximants give continuity of the limit on that set. |

The native additive infinite-sum declaration is generated from the multiplicative declaration in `Mathlib/Topology/Algebra/InfiniteSum/Defs.lean`. Its source and elaborated name were checked, but the source declaration index omits this generated name. It is used as existing notation with separately established convergence, not as a fictional new prerequisite.

## Source receipts and findings

| Source | Acquired version and SHA-256 | Passages read |
|---|---|---|
| [Sarig2023](https://www.weizmann.ac.il/math/sarigo/sites/math.sarigo/files/uploads/ergodicnotes.pdf) | Author notes, 3 April 2023; `94b4fb65b7eb7730ad8b8369239eb5a5503a98b547a6bd812515b5bac6261094` | Physical pp.45–49, printed pp.37–41: full Theorems 2.2–2.3 and finite coloring proof. |
| [SarigTransfer](https://www.weizmann.ac.il/math/sarigo/sites/math.sarigo/files/uploads/transferoperatorcourse-bonn.pdf) | HMI/Bonn author lecture notes (2020 file); `c00fee5bb0685fac87afb3c66609253c2ddfde7ea553b60ceaa9d325e55fe3a0` | Physical pp.1–6 and 11–13: Gauss map and transfer operator; pp.31–35: Appendix A.2 exactness; pp.35–41: Appendix A.3 Hennion argument, read but not used in the chosen quantitative proof. The opening lemma on physical p.42 (Appendix A.4) was incidentally read; EPM4-7 records its quantifier error, but no analyticity theorem is used. |
| [Smyth2020](https://uncg.edu/~cdsmyth/UNCG_Ergodic_Theory_Summer_School_2020_Final_Lecture_Notes.pdf) | UNCG summer school, 18–22 May 2020, final author notes; `74a84b7ba741728055e9cc0da7b3c2b14e99b645ea79ac2f3b72d98034a9cf1f` | Physical pp.45–49, printed pp.42–46: pointwise theorem, digit frequencies, Khinchin product, mixing alternatives, and the full problem 2.4 logarithmic-denominator argument; inherited reviewed continued-fraction convention nodes are imported by id. No claim to a proof of the full text. |
| [Sun2017](https://arxiv.org/pdf/1705.02921v2) | arXiv:1705.02921v2, 9 November 2017; version of record Acta Mathematica Scientia 38(3) (2018), 965–972; `9b2eb1867614fe285aa4d729345c25962590e6767a36f2b0c20326a8b86cd703` | Physical pp.1–6: Theorems 1–2 and their full C1 argument; pp.7–8: zeta bound and references. Only p=1 is used, with a corrected weaker bound. |
| [Gorodnik2010](https://www.math.uzh.ch/gorodnik/tifr/lecture1.pdf) | Author course notes, Mumbai 2010, scanned lecture1.pdf; `63889917bce84dd38004ba0001e6946f190db02f33fae953ae719f01920303d8` | Physical pp.3–8: bounded geodesics, two-dimensional Mahler compactness, and the badly-approximable/diagonal-orbit comparison. Row-vector convention is transposed and time doubled explicitly. |

All receipt dates are 2026-10-05. The additional Sun publisher receipt covers metadata and abstract, not full text. New observations below require independent verification; the unused spectral and analyticity findings supply no target prerequisite.

### ProbabilisticAndMetricNumberTheory/EPM4-1

Gap, affecting the proof. arXiv:1705.02921v2, physical p.4, Theorem 2, displayed estimate after the derivative cancellation.

**Correction:** The triangle estimate needs Σ[δ_a|h_a′|+h_a/(a+x)²]. For p=1 this packet proves a sufficient bound ≤18913/21600<9/10; it does not claim the printed sharper Q_p rate.

**Reason:** At p=1,a=2,x=1, h_2′=−1/72. The separate mean-value derivative values may have different signs, so the displayed signed coefficient sum does not follow by the maximum-norm triangle inequality. The gap affects this proof step, not the existence of exponential convergence.

**Correction search:** arXiv abstract/version record https://arxiv.org/abs/1705.02921 and v2 PDF, accessed 2026-10-05; v2 is the latest listed version. Version-of-record DOI 10.1016/S0252-9602(18)30796-3 metadata and bounded title/author plus erratum/correction searches, 2026-10-05; no published correction found. The publisher full text was not read.

### ProbabilisticAndMetricNumberTheory/EPM4-2

Misprint, affecting the proof. 2020 author PDF, physical p.35, printed p.33, Conditional Closure Lemma equation (A.3).

**Correction:** Restore the factor R multiplying the seminorm: numerator ||g_n−g_m||+R||f_n−f_m||_0.

**Reason:** The preceding displayed inequality includes R; rearranging cannot remove it. The subsequence argument still works with the fixed positive constant R.

**Correction search:** Sarig author course page https://www.weizmann.ac.il/math/sarigo/ (accessed 2026-10-05): course file and proof-reading notice, no linked erratum for Appendix A.3 found. Bounded web search on 2026-10-05: Sarig transfer operator errata Hennion; no published correction of these displayed formulas found.

### ProbabilisticAndMetricNumberTheory/EPM4-3

Error, affecting a stated result. 2020 author PDF, physical p.35, printed p.33, Riesz Lemma statement.

**Correction:** Require U to be a proper closed subspace, or replace U by its closure and require closure(U)≠V.

**Reason:** A dense proper linear subspace has distance zero from every vector and contradicts the stated positive separation. The subsequent applications to finite-dimensional or established closed subspaces can use the corrected lemma.

**Correction search:** Sarig author course page https://www.weizmann.ac.il/math/sarigo/ (accessed 2026-10-05): course file and proof-reading notice, no linked erratum for Appendix A.3 found. Bounded web search on 2026-10-05: Sarig transfer operator errata Hennion; no published correction of these displayed formulas found.

### ProbabilisticAndMetricNumberTheory/EPM4-4

Misprint, affecting the proof. 2020 author PDF, physical p.37, printed p.35, Step 1 separation estimate.

**Correction:** For the sequence {L^m f_n}, use |z|^m/2 separation; when subsequently using L^(m+1), the corresponding power is |z|^(m+1)/2.

**Reason:** The factor pulled from z^(−m)L^m is |z|^m, and the normalized Riesz distance is at least 1/2. The printed last inequality changes its exponent without justification.

**Correction search:** Sarig author course page https://www.weizmann.ac.il/math/sarigo/ (accessed 2026-10-05): course file and proof-reading notice, no linked erratum for Appendix A.3 found. Bounded web search on 2026-10-05: Sarig transfer operator errata Hennion; no published correction of these displayed formulas found.

### ProbabilisticAndMetricNumberTheory/EPM4-5

Error, affecting the proof. 2020 author PDF, physical p.37, printed p.35, iterated (A.2).

**Correction:** The iteration is r^m||f||+R Σ_(j=0)^(m−1) r^j||L^(m−1−j)f||_0.

**Reason:** At m=1 the printed expression introduces an extra factor r in front of R||f||_0. Inducting the one-step inequality gives the corrected index and exponents; the required compactness argument remains available.

**Correction search:** Sarig author course page https://www.weizmann.ac.il/math/sarigo/ (accessed 2026-10-05): course file and proof-reading notice, no linked erratum for Appendix A.3 found. Bounded web search on 2026-10-05: Sarig transfer operator errata Hennion; no published correction of these displayed formulas found.

### ProbabilisticAndMetricNumberTheory/EPM4-6

Misprint, affecting the proof. 2020 author PDF, physical p.38, printed p.36, Step 2 direct-sum proof.

**Correction:** Replace the second operator by (zI−L)^(2m).

**Reason:** The vector f cannot occupy the operator position; the previous line identifies the stabilized range of zI−L.

**Correction search:** Sarig author course page https://www.weizmann.ac.il/math/sarigo/ (accessed 2026-10-05): course file and proof-reading notice, no linked erratum for Appendix A.3 found. Bounded web search on 2026-10-05: Sarig transfer operator errata Hennion; no published correction of these displayed formulas found.

### ProbabilisticAndMetricNumberTheory/EPM4-7

Error, affecting a stated result. 2020 author PDF, physical p.42, printed p.40, Appendix A.4 opening lemma (incidentally read, outside target chain).

**Correction:** The uniform-boundedness argument gives sup_n |φ(x_n)|=∞, hence a subsequence with |φ(x_(n_k))|→∞; it does not give divergence of the whole sequence. The weak-analyticity argument should use that subsequence.

**Reason:** In complex dimension two, in each block take a fine finite net of the unit sphere scaled by the block index, with mesh at most its inverse square. Norms tend to infinity, but every linear functional has a unit kernel vector, so a subsequence of its values tends to zero. The displayed proof itself only concludes an unbounded supremum.

**Correction search:** Sarig author course page https://www.weizmann.ac.il/math/sarigo/ (accessed 2026-10-05): course file and proof-reading notice, no linked erratum for Appendix A.3 found. Bounded web search on 2026-10-05: Sarig transfer operator errata Hennion; no published correction of these displayed formulas found.

### ProbabilisticAndMetricNumberTheory/EPM4-8

Misprint, affecting nothing. 2020 author PDF, physical p.35, printed p.33, Conditional Closure Lemma first sentence.

**Correction:** Replace the concrete-space symbol 𝓛 by the Banach space B in which the generic operator L acts.

**Reason:** Theorem A.3 fixes an arbitrary Banach space B and a bounded operator on B; 𝓛 was the earlier concrete Lipschitz function space. The lemma’s remaining hypotheses and proof identify B as the intended space.

**Correction search:** Sarig author course page https://www.weizmann.ac.il/math/sarigo/ (accessed 2026-10-05): course file and proof-reading notice, no linked erratum for Appendix A.3 found. Bounded web search on 2026-10-05: Sarig transfer operator errata Hennion; no published correction of these displayed formulas found.

## Inventory and validation boundary

114 new declaration nodes: 2 applications, 4 comparisons, 5 constructions, 5 definitions, 97 lemmas, 1 theorem. 39 API items and 32 unit-test specifications; 57 pinned baseline citations; 2 exact owner requests; zero unassigned gaps; zero new planets, retaining the six imported planets.

The suggested file elaborates against the pinned Mathlib with only proof-placeholder warnings. The two Tau Ceti supplier statements were read at the pinned source; their cached object files are unavailable, so the suggested signatures use the existing native Mathlib types without importing those unavailable compiled modules. No supplier theorem is restated as a new PM.4 implementation. The packet checker and source-version checks establish structural consistency; they do not validate the admitted proofs.
