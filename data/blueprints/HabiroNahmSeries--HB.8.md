# Admissibility and finite support for Nahm series

This document develops stage `HabiroNahmSeries:HB.8`, building on the accepted
[parent packet](../packets/HabiroNahmSeries.json). Its central result is the
finite-support theorem of Garoufalidis–Scholze–Wheeler–Zagier (GSWZ, Theorem 6):
the integral exponents of the Pochhammer product of a Nahm series have finite
support in the Laurent variable for each deformation monomial. The statement
holds for every symmetric integer matrix, including matrices with negative
diagonal or off-diagonal entries. Positive definiteness belongs to the analytic
Nahm-sum theory and is not a hypothesis here.

The proof below supplies the omitted arbitrary-rank argument without assuming
the Gaussian comparison. It first proves integrality of all signed shift
quotients, then iterates the difference equations around a cyclotomic orbit.
The orbit quotient specializes to the deformed Nahm solution. This determines
the residue of the logarithm at every root of unity and permits an explicit
induction removing all possible cyclotomic poles of the plethystic coefficients.

The Gaussian comparison and the level-m extension are also targets of the
accepted stage. Their objects are imported, their general-rank uniqueness and
decomposition are refined here, and their outstanding inputs are recorded
precisely. The coverage status is **planned**, with three gaps, rather than
closed. This is a complete target-level planning pass; none of its declarations
is claimed to be implemented.

## Conventions, sources and ownership

Fix a finite set of coordinates, represented by the indices 1 through N, and a
symmetric matrix A with entries in Z. Write n for a vector of nonnegative
integers, |n| for its total degree, and t^n for its monomial. A divisor l of n
divides every coordinate. Zero coordinates impose no restriction. For n
nonzero, the possible positive divisors form a finite set, bounded by any
positive coordinate and hence by |n|.

The coefficient field is Q(q). Formal t-series are completed at their
augmentation ideal. The integral coefficient rings are Z[q,q^{-1}] and
Z((q)); these are different rings. A Laurent polynomial has finite support in
both directions. A Laurent series is only bounded below. All root-of-unity
expansions are coefficientwise: q=ζ+x gives coefficients in K((x)), where K is
a characteristic-zero field containing ζ. There is no common lower x-bound
assumed for all t-coefficients of F itself.

Let σ_j multiply t_j by q and leave every other coordinate fixed. For a signed
vector a, σ^a multiplies t_i by q^{a_i}. Negative shifts are valid since q is
invertible in Q(q). Θ_j denotes t_j∂/∂t_j. Its effect on the coefficient of
t^n is multiplication by n_j. Formal logarithms are taken only for series with
constant coefficient one; formal polylogarithms are substituted only into
series with zero constant coefficient.

The source for the stage is [GSWZ, arXiv:2412.04241v2](https://arxiv.org/pdf/2412.04241v2),
especially §§2.2–2.7. The PDF and TeX source of that exact version were read;
the packet records hashes and the access date. The original attribution was
checked in [Kontsevich–Soibelman](https://arxiv.org/pdf/1006.2706v2),
Definition 19, Theorem 9 and §6.9, and in
[Efimov](https://arxiv.org/pdf/1103.2736v2), Theorem 1.1. The previously unread
Gaussian citations were checked in
[Garoufalidis–Storzer–Wheeler](https://arxiv.org/pdf/2305.14884v2), Lemmas 3.1–3.3,
and [the Århus integral II](https://arxiv.org/pdf/math/9801049v4), §2 and
Proposition 2.13. The elementary proof does not import a general Donaldson–Thomas
integrality theorem as an unexplained prerequisite.

The baseline is Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`. The reviewed library audit marks
HB.8 as not built. Mathlib supplies `RatFunc`, `LaurentPolynomial`,
`LaurentSeries`, `MvPowerSeries`, rescaling, one-variable formal logarithm and
substitution, power substitution by `MvPowerSeries.expand`, primitive roots,
reduced rational-function evaluation, cyclotomic polynomials, and coefficientwise
infinite-product tools. These are consumed directly. The packet cites thirteen
baseline declarations, each checked in its source file. A full Tau Ceti source search at its pin
found no Nahm or plethystic finite-support theorem. Analytic Gaussian theorems
in probability do not supply the algebraic all-orders Gaussian bracket.

Ownership is fixed as follows. The parent nodes
`HB.8/admissible-series`, `HB.8/product-expansion-and-dt-exponents`,
`HB.8/formal-pochhammer-symbol`, `HB.8/series-F-A`,
`HB.8/ratio-riccati-system` and `HB.8/t-deformed-nahm-equations` supply their
objects and APIs. The Gaussian operator belongs to
`HabiroNahmSeries:HB.4/formal-gaussian-integration`; it is not defined again.
Polylogarithms, including their formal coefficient series and rational
nonpositive weights, belong to `Polylogarithms:P.1/classical-polylogarithm`.
Generic product topology is shared with `QSeriesPartitionsAndMockModularForms:QM.0`.
This part adds proof refinements under fresh ids and leaves the parent packet
unchanged. Every refinement id begins `HabiroNahmSeries:HB.8/refinement-`.

## The imported objects and the theorem to prove

The formal Pochhammer symbol is the Euler series in Q(q)[[u]]. Its logarithm is

\[
 \log(u;q)_\infty=-\sum_{l\geq1}\frac{u^l}{l(1-q^l)}.
\]

The same formal series maps to the coefficientwise product in Z((q))[[u]].
The shift identity is (1-u)(qu;q)_∞=(u;q)_∞. The q-inversion identity is
(u;q^{-1})_∞=(qu;q)_∞^{-1}; these identities concern formal expansions,
not convergence of an analytic product at an arbitrary q-value.

A constant-one series F is admissible when

\[
 \log F=-\sum_{n\ne0}\sum_{l\geq1}
 \frac{L_n(q^l)}{l(1-q^l)}t^{ln},\qquad L_n\in\mathbf Z[q,q^{-1}].
\]

The rational functions L_n are uniquely determined whenever F has
rational-function coefficients. The coefficient at n has its l=1 term
-L_n/(1-q); all other terms use smaller total degree. For an arbitrary
integral Laurent-series coefficient F, the integral product construction gives
integer exponents c_{n,i} bounded below in i. Admissibility adds the conclusion
that they are also bounded above for each n, with L_n=Σ_i c_{n,i}q^i.
The boundedness conclusion is essential: an unrestricted product with integer
exponents does not establish Theorem 6.

The imported series is

\[
 F_A(t,q)=\sum_{n\in\mathbf N^N}
 \frac{(-1)^{\operatorname{diag}(A)\cdot n}
 q^{(n^TAn+\operatorname{diag}(A)\cdot n)/2}}
 {\prod_j(q;q)_{n_j}}t^n.
\]

Symmetry makes the exponent integral: the off-diagonal terms occur twice,
and n_j²+n_j is even. The denominator has constant q-coefficient one, so each
summand expands integrally in q with a finite lower bound. Thus F_A belongs to
Z((q))[[t]] even when its quadratic exponents are negative.

Its constant coefficient is one, and its defining equations are

\[
 F_A-\sigma_jF_A=(-q)^{A_{jj}}t_j\sigma^{A_{*,j}}F_A.
\]

The matrix column on the right includes every coordinate. The coefficient
recurrence proves existence from the sum and uniqueness among constant-one
series. For A=0, F_A is the product of the reciprocal Pochhammer symbols. For
A=(1), it is (qt;q)_∞. For A=(3), the t² coefficient is
q⁹/((1-q)(1-q²)). These cases fix the sign and half-exponent conventions.

Kontsevich–Soibelman’s Theorem 9 concerns admissibility under arbitrary
symmetric integer quadratic twists in a lambda ring; §6.9 includes the passage
from nonnegative entries to arbitrary integers. Efimov’s result concerns a
symmetric quiver, whose arrow counts are nonnegative, and finite primitive
generators for each dimension vector. Citing Efimov alone would not justify
every signed matrix in this statement. The proof below avoids either large
theory as a prerequisite while retaining their attribution.

## Integral signed quotients and cyclotomic orbits

The theorem `signedShift_integral` concerns

\[
 R_a=\frac{F_A(\sigma^at,q)}{F_A(t,q)},\qquad G_j=R_{e_j}.
\]

All these quotients have constant coefficient one. They satisfy the cocycle
law R_{a+b}=R_a σ^a(R_b). A path from 0 to a made of signed coordinate steps
therefore expresses R_a as a finite product of shifted G_i or their inverses.
For a negative step from b to b-e_i, the factor is
σ^{b-e_i}(G_i)^{-1}. This specifies the negative-shift convention without an
ambiguous reversed product.

Dividing the defining equations of F_A by F_A gives the corrected Riccati
system

\[
 1-G_j=(-q)^{A_{jj}}t_jR_{A_{*,j}}.
\]

Induct simultaneously on the total degree of all G_j. The coefficient of
degree d on the left is minus the coefficient being solved for. The factor
t_j on the right means that the signed path uses coefficients of degree at
most d-1. Multiplication, integral Laurent rescaling and inversion of a
constant-one integral series preserve Z[q,q^{-1}]. This establishes the
induction without division by a q-polynomial or a nonunit integer. Telescoping
then proves the claim for every signed a.

The printed equation (89) omits the quotient for the off-diagonal shifts.
The accepted source issue `HabiroNahmSeries/E31` corrects it. The mixed test
A=[[2,1],[1,1]] has t_1t_2 coefficient -q³ in G_1. Setting that coefficient to
zero would pass independent rank-one tests and fail this matrix test.

The construction `orbitRatio` is

\[
 U_{j,m}=\prod_{s=0}^{m-1}\sigma_j^sG_j
        =\frac{\sigma_j^mF_A}{F_A},\quad m\geq1.
\]

The API also permits m=0, giving the empty product one. Its declarations are
`orbitRatio_quotient`, `orbitRatio_add`, `orbitRatio_integral` and
`orbitRatio_one`. The additive law is U_{j,m+n}=U_{j,m}σ_j^m(U_{j,n}).
The compatibility statement identifies each coefficient with an actual
Mathlib integral Laurent polynomial. Evaluation at a nonzero algebraic q-value
is performed on that coefficient; evaluating F_A and its denominator
separately would be invalid at roots of unity.

The four tests are `orbitRatio_zero`, `orbitRatio_zeroMatrix`,
`orbitRatio_root_zeroMatrix` and `orbitRatio_rescale`. They give respectively
U_{j,0}=1, U_{j,2}=(1-t_j)(1-qt_j) for A=0, U_{j,m}(t,ζ_m)=1-t_j^m for A=0,
and σ_j^m F_A=U_{j,m}F_A using Mathlib’s rescaling operator.

We now prove `orbitRatio_at_root`. Put H=log F_A and write H_n for its
coefficient. Since

\[
 [t^n]\log G_i=(q^{n_i}-1)H_n,
\]

H_n has at most simple nonzero poles, and their orders divide every positive
n_i. Indeed, log G_i has rational Laurent-polynomial coefficients: its
logarithmic coefficient is a finite rational combination of products of
integral Laurent polynomials. Each q^{n_i}-1 is squarefree in characteristic
zero. A coordinate n_i=0 is ignored, and some positive coordinate exists for
every nonzero n. This argument precedes the plethystic integrality proof.

Let ζ have order m. In log U_{j,m}, the coefficient multiplier is
q^{mn_j}-1. It vanishes at ζ. If H_n is regular there, its contribution is zero.
If H_n has a pole there, every coordinate of n is divisible by m, and the
contribution is mn_j ζ^{-1} Res_ζ H_n. Consequently U_{j,m}(t,ζ), as well as
its logarithm, is supported on m-multiples of multi-indices. It is invariant
under multiplication of any coordinate t_i by ζ.

The higher difference operator is

\[
 P_{j,m}=\prod_{s=0}^{m-1}(1-q^{-s}\sigma_j).
\]

Direct cancellation of the last m Pochhammer factors gives

\[
 P_{j,m}F_A=(-1)^{mA_{jj}}q^{A_{jj}m(m+1)/2}
 t_j^m\sigma^{mA_{*,j}}F_A.
\]

The coefficients with n_j<m vanish because one factor in the operator is zero.
For n_j≥m the exponent difference between the two summands is
mΣ_i A_{ij}n_i-A_{jj}m(m-1)/2. This is precisely the exponent obtained by
shifting the preceding coefficient n-me_j on the right. The sign is
(-1)^{mA_{jj}}, correcting the triangular-number sign printed in several
source equations (`HabiroNahmSeries/E33`).

Divide by F_A before specializing. At q=ζ, the polynomial P_{j,m} becomes
1-σ_j^m. Signed telescoping expresses the quotient on the right through U_i,m.
Its intermediate shifts disappear after evaluation because of the invariance
proved above. The resulting system is

\[
 1-U_{j,m}(t,\zeta)=(-1)^{A_{jj}}t_j^m
             \prod_iU_{i,m}(t,\zeta)^{A_{ij}}.
\]

Here (-1)^{mA_{jj}}ζ^{A_{jj}m(m+1)/2}=(-1)^{A_{jj}}. For odd m this follows
from the m-divisibility of m(m+1)/2; for even m use ζ^{m/2}=-1. Both parities
are necessary acceptance cases.

The imported deformed Nahm equations have a unique constant-one solution z.
Their degree induction works with signed powers because the right side has a
factor t_j. Uniqueness proves U_{j,m}(t,ζ)=z_j(t^m). At A=(1) this is
(1-t^m)^{-1}. At A=(3),m=2 the t² coefficient is +1. The latter case rejects
the wrong phase at even orbit length.

## The residue potential and finite support

The construction `residuePotential` sets

\[
 V_A(t)=\operatorname{Res}_{q=1}\log F_A(t,q).
\]

The pole bound just proved makes this coefficientwise definition legitimate.
Its constant coefficient is zero. The m=1 orbit identity gives
Θ_jV_A=log z_j. This is the API statement `residuePotential_euler`.
The declarations `residuePotential_constantCoeff`, `residuePotential_unique`
and `residuePotential_coeff` fix respectively the constant term, uniqueness
among zero-constant primitives, and the formula
[t^n]V_A=[t^n]log z_j/n_j whenever n_j>0. Uniqueness uses characteristic zero
and chooses a nonzero coordinate of each n; it assumes no analytic primitive.

The tests are `residuePotential_rankZero`, `residuePotential_zeroMatrix`,
`residuePotential_three` and `residuePotential_logCompatibility`. They require
the zero potential in rank zero, -Σ_jLi_2(t_j) for A=0, the coefficients

\[
 V_{(3)}=t+\frac54t^2+\frac{28}9t^3+\frac{165}{16}t^4+O(t^5),
\]

and the linear coefficient (-1)^{A_jj+1}. An additional acceptance check for
A=(-1) is t-3t²/4+10t³/9-35t⁴/16. The different signs distinguish the formal
matrix parameter from a positive-definite analytic assumption.

The theorem `allRoot_residue` supplies Lemma 2.6 in arbitrary rank. Let
R_ζ(t)=Res_ζ H(t,q). The evaluation of log U from the preceding section gives

\[
 m\zeta^{-1}\Theta_jR_\zeta=\log z_j(t^m).
\]

The series ζV_A(t^m)/m² has the same Euler derivatives, and both constants
are zero. Thus

\[
 \log F_A(t,\zeta+x)=\frac{\zeta V_A(t^m)}{m^2x}+O(x^0).
\]

The theorem also states that every Laurent coefficient at exponent less than
-1 vanishes. Giving just a residue identity would leave the pole-order part
of the lemma unproved. At A=0,m=2 the coefficient of t_j² in the residue is
1/4. At A=(3),m=2 the residue begins -t²/4-5t⁴/16. A multi-index with any
coordinate not divisible by m has zero residue.

The comparison `residuePotential_criticalValue` identifies this potential with
the source’s expression (116):

\[
 V_A=-\sum_j\operatorname{Li}_2(1-z_j)
     -\frac12\sum_{i,j}A_{ij}\log z_i\log z_j.
\]

To check it, differentiate the Nahm equations and the expression. The relation
d log(1-z_j)=d log t_j+Σ_i A_ij d log z_i is used temporarily after localizing
at t_j; clear these denominators to obtain identities of ordinary formal
series. No formal series log t_j is introduced. The dilogarithm derivative
and the symmetry of A cancel the quadratic terms, leaving
Σ_j log z_j d log t_j. Zero constant terms and uniqueness give the comparison.
For the mixed matrix [[2,1],[1,1]], the t_1t_2 coefficient is -1. This is a
comparison of critical values, not an assertion about all Gaussian loop
coefficients.

The theorem `seriesFA_finiteSupport` now proves Theorem 6. Apply the imported
integral plethystic logarithm to each G_j. Its coefficient family M_{j,n}
consists of integral Laurent polynomials, and logarithmic comparison gives

\[
 M_{j,n}(q)=[n_j]_q L_n(q),\qquad
 [r]_q=1+q+\cdots+q^{r-1}.
\]

The identity follows because (q^{ln_j}-1)/(q^l-1)=[n_j]_{q^l}. For n_j=0,
both sides vanish and no division is made. For a positive coordinate, this
places L_n in [n_j]_q^{-1}Z[q,q^{-1}]. The parent pole-location lemma therefore
restricts a possible nonzero pole to a primitive a-th root, a>1, with a
dividing every coordinate of n. Such a pole is simple. At q=1 the denominator
[n_j]_1=n_j is nonzero, so there is no pole.

Induct on |n|. Suppose a pole occurs and write n=ab. For H_n the exact
coefficient identity is

\[
 H_n=-\sum_{l\mid n}\frac{L_{n/l}(q^l)}{l(1-q^l)}.
\]

All terms with l>1 use smaller degree, so their L coefficients are Laurent
polynomials by induction. At ζ of order a, terms with a not dividing l have
zero residue. For l=ad the residue is
ζL_{b/d}(1)/(a²d²). The complete proper-divisor sum is therefore

\[
 \frac{\zeta}{a^2}\sum_{d\mid b}\frac{L_{b/d}(1)}{d^2}.
\]

The q=1 residue of H_b says that the sum is V_b. The all-root residue theorem
predicts exactly ζV_b/a². The only remaining term, l=1, would add
-Res_ζL_n/(1-ζ). This extra contribution must be zero, contradicting the
supposed pole. Including all proper divisors avoids the source’s incorrect
truncated residue display, already recorded as `HabiroNahmSeries/E34`.

Finally, absence of poles alone proves rational Laurentness, not integer
Laurentness. Choose a positive coordinate and clear a power of q in
[n_j]_q L_n=M_{j,n}. The denominator is monic. Monic polynomial division over
Z, with remainder zero over Q, proves that the quotient is integral. Thus
L_n∈Z[q,q^{-1}]. The imported product equivalence identifies c_{n,i} with its
Laurent coefficients and gives finite support for every n.

The acceptance cases are L_1=q and L_n=0 for n>1 when A=(1), L_{e_j}=-1 and
all other L_n=0 when A=0, and L_(1,1)=-q³ for the mixed matrix. Removing the
sign from the A=(1) summand produces (-qt;q)_∞ and L_2=q²/(1+q), which fails
admissibility. Integer product exponents with infinite upper support likewise
fail the finite-support requirement.

## Congruence recurrences and the restricted Adams coefficients

For m≥1 and 0≤k_j<m, import the normalized congruence series F_{A,m,k}.
Its constant coefficient is one and its exponents lie in mN^N. Multiplying
by t^k gives H, supported on k+mN^N with coefficient one at k. The theorem
`congruenceSolution_unique` supplies the omitted multi-index uniqueness proof
for the corrected m-th order equations.

At n=k+mb the operator P_{j,m} has eigenvalue

\[
 D_j(n,q)=\prod_{s=0}^{m-1}(1-q^{n_j-s}).
\]

When b_j=0, the factor s=k_j vanishes, as the initial coefficient requires.
When b_j>0, every exponent is positive, so D_j is a nonzero rational
function. The right coefficient is the corrected phase times
q^{mΣ_iA_ij(n_i-mδ_ij)}H_{n-me_j}. Choosing any positive coordinate b_j
determines the coefficient from smaller total degree. The explicit imported
sum proves consistency between different choices of j. Subtracting two
solutions proves uniqueness.

After the injective Laurent expansion map, D_j remains nonzero and hence
invertible in K((x)), even when it has positive x-valuation. Uniqueness is
not claimed over K[[x]] by dividing by its constant coefficient. This
distinction matters at every root of unity. At m=1,k=0 the recurrence is the
defining equation of F_A. At A=(1),m=3 its sign is negative; the printed
triangular-number sign gives a positive value and fails the summand check.

The construction `restrictedCoeffs` extends Lemma 2.7 to several variables.
For a constant-one F∈Z[1/m]((q))[[t]], it provides a unique normalized family
L_0=0 with

\[
 \log F=-\sum_{n\ne0}\sum_{\substack{l\geq1\\(l,m)=1}}
       \frac{L_n(q^l)}{l(1-q^{ml})}t^{ln}.
\]

The leading l=1 term gives a triangular recursion. If H=log F, its exact form
is

\[
 L_n=-(1-q^m)\left(H_n+
 \sum_{\substack{l>1, l\mid n\\(l,m)=1}}
 \frac{L_{n/l}(q^l)}{l(1-q^{ml})}\right).
\]

Consequently a rational-function coefficient F gives rational-function L_n.
Integrality in Z[1/m]((q)) is a separate assertion; it does not follow by
looking only at the denominators in this recursion. Use the elementary
restricted factor and its inclusion-exclusion expression

\[
 \exp\left(-\sum_{(l,m)=1}
 \frac{q^{il}t^{ln}}{l(1-q^{ml})}\right)
 =\prod_{d\mid m}(q^{di}t^{dn};q^{dm})_\infty^{\mu(d)/d}.
\]

Each rational exponent has denominators supported on primes dividing m.
The binomial coefficients of such an exponent have the same denominator
restriction: at any prime not dividing m it is a p-integral exponent and its
binomial coefficients are p-integral. Thus these factors have coefficients
in Z[1/m]((q)). Eliminate F in increasing total degree using the factors.
For each fixed n, multiply its current coefficient by 1-q^m and use its
unique lower-bounded q-expansion. The q-adic topology handles this fixed-degree
product, while increasing t-degree handles the outer product. These
topologies are not interchangeable; the imported product construction
supplies both required coefficientwise limits.

The API consists of `restrictedCoeffs_log`, `restrictedCoeffs_unique`,
`restrictedCoeffs_recursion` and `restrictedCoeffs_one`, besides the
constructor. The last statement compares m=1 with the ordinary rational
plethystic coefficients already owned by the parent. The tests
`restrictedCoeffs_unit`, `restrictedCoeffs_linear`, `restrictedCoeffs_two`
and `restrictedCoeffs_mOne` use F=1 and F=1+t_1t_2. They require L=0 in the
first case, L_(1,1)=-(1-q^m), L_(2,2)=(1-q²)/2 at m=2, and L_(2,2)=1-q
at m=1. The factor 1/2 at level two and its absence at level one distinguish
the restricted transform from the unrestricted one.

## The Gaussian comparison and its explicit obligations

The parent supplies the formal bracket with covariance hΛ^{-1}, the
congruence-indexed integrals I, and the refined sum CS. The bracket is defined
by the exponential of the second derivative operator and evaluation at zero.
It is algebraic. No probability measure or positivity of Λ is used.
The source’s Hessian is Λ=-A-diag(z/(1-z)). Its entries live in a suitable
rational-function coefficient field before the t-expansion.

The comparison `gaussianLocal_normalization` checks a new discrepancy in
equation (114). Let q=ζ_m exp(h) and P=(q^{k+1}u exp(w);q)_∞. The leading
part of log P is

\[
 \frac{\operatorname{Li}_2(u^m\exp(mw))}{m^2h}.
\]

This follows from the m-fold Pochhammer splitting and polylogarithm
distribution. Its constant, linear and quadratic w-coefficients are
Li_2(u^m)/(m²h), Li_1(u^m)/(mh), and Li_0(u^m)/(2h). The constant term at
h^0 is -Σ_s((k+s+1)/m-1/2)log(1-ζ_m^{k+s+1}u). Removing precisely these
four terms gives

\[
 \begin{aligned}
 \log\psi={}&\log P-\frac{\operatorname{Li}_2(u^m)}{m^2h}
 -\frac{\operatorname{Li}_1(u^m)}{mh}w
 -\frac{\operatorname{Li}_0(u^m)}{2h}w^2\\
 &+\sum_{s=0}^{m-1}\left(\frac{k+s+1}{m}-\frac12\right)
       \log(1-\zeta_m^{k+s+1}u).
 \end{aligned}
\]

The printed factor uses m^{-2} in both w-subtractions and the opposite sign
for the added constant. Already at m=1,k=0 its log remainder has coefficients
-Li_0(u)/2 at h^{-1}w² and -log(1-u) at h^0w^0. These contradict the stated
four-term removal. The PDF page and TeX agree, so this is not a text-extraction
error. The packet records it as `HabiroNahmSeries/EHB8-1`, scoped to the exact
preprint version read; no published correction was found in the searches
listed there.

After the correct removal, remaining terms have h-exponent b-1 and
w-exponent r with b=0,r≥3; b=1,r≥1; or b≥2,r≥0. They have positive weight
for weight(h)=1, weight(w)=1/2 and belong to the augmentation completion
generated by w,h,w³/h. In particular the cubic term w³/h is allowed.
The printed claim of membership in 1+x times the whole completion is
stronger and fails. This local correction does not automatically repair the
global determinant, cyclotomic or square-root prefactors in (118).

The theorem obligation `gaussianAffine_system` requires the normalized
integrals to obey periodicity in the congruence index, its Kummer-root
shift, and the first-order difference identity (138). The exact generic
affine rule is

\[
 \langle e^{-b^T\Lambda w}f(w+hb)\rangle_{\Lambda,h}
 =e^{hb^T\Lambda b/2}\langle f(w)\rangle_{\Lambda,h}.
\]

GSW Lemma 3.1(b) supplies it after scaling w=h^{1/2}x. It can be proved
within the formal operator calculus by exponential generating functions and
extended in positive weight. Its determinant recentering rule is Lemma 3.2.
Århus Proposition 2.13 supplies the block Fubini identity by a block inverse
calculation. Neither cited rule asserts uniform t-regularity as z tends to
one. Their actual statements were read rather than inferred from the words
“change of variables.”

Apply the Pochhammer shift to the vertex at j, translate that integration
coordinate by h, and keep every exponential and determinant prefactor. This
should give I_ell-I_ell(σ_jt)=(-1)^{A_jj}t_jq^{A_jj}
I_{ell-e_j}(σ^{A_{*,j}}t). Iterate m times and use congruence periodicity to
obtain the corrected higher difference system for CS. **G1** is the exact
remaining reconciliation of these prefactors after repairing (114).

The theorem obligation `gaussianCS_regular` is distinct. It requires
CS(t,ζ_{mmprime}+x)∈Q(ζ_{mmprime})((x))[[t]], with constant coefficient one,
when gcd(mprime,m)=1. Write d_j=(1-z_j)/z_j and D=diag(d_j). Each d_j is
t_j times a unit, and

\[
 \Lambda^{-1}=-(I+DA)^{-1}D.
\]

This controls each covariance entry. A determinant estimate alone cannot
control the pole of every vertex in every coordinate. For A=0,z=1-t, even
the no-leg term hLi_0(z)/12 has a t^{-1} pole before contributions are
combined. The source’s one-sentence domination assertion therefore does
not prove termwise nonnegative t-orders. A valid argument must establish
cancellation after Wick contractions and the refined congruence sum,
separately in each t_j, at every loop order. It must then justify the change
from the x-first completion to K((x))[[t]]. Those two requirements, with
constant coefficient one, form **G2**. The source assertion is retained as
a gap rather than called a false regularity theorem.

Given G1 and G2, `gaussianIdentification` follows from the already supplied
multi-index congruence uniqueness. Both sides, after multiplication by t^k,
lie in the same supported space, solve the same corrected system and have
the same initial coefficient. The target equality is
F_{A,m,k}(t^{1/m},ζ_{mmprime}+x)=CS_{A,m,k}(t,ζ_{mmprime}+x).
The coprimality condition is required by the current definition (126),
despite the unrestricted mprime in the printed Theorem 8. This is the
accepted correction `HabiroNahmSeries/E39`.

The elementary residue lemma does not depend on G1 or G2. When the Gaussian
comparison is available, it provides a second route to that lemma and also
identifies the determinant and cyclotomic prefactors. Equality of V is
already proved here and cannot be used to infer equality of all prefactors.

## Corrected level-m admissibility and the completion contract

The target `congruenceRoot_residue` concerns roots of order c=ma with
gcd(a,m)=1. Gaussian identification and the regular constant-one factor then
give

\[
 \log F_{A,m,k}(t,\zeta_c+x)
   =\frac{\zeta_cV_A(t^c)}{c^2x}+O(x^0).
\]

It inherits G1 and G2. It is not used to claim residue control at c=ma
with gcd(a,m)>1. In particular c=4,m=2 is outside the supplied comparison.
That restriction explains why the Phi_4 pole in the following example
cannot be removed by the source’s proof.

For the ordinary series B(s,q)=F_{A,m,k}(s^{1/m},q), the corrected
`congruenceSum_correctedLevel` target says that its restricted coefficients
belong to

\[
 R_m=\mathbf Z[1/m,q,q^{-1},\Phi_d(q)^{-1}:
  m\nmid d\ \text{or}\ (m\mid d\text{ and }\gcd(d/m,m)>1)],
\]

and that L_n(ζ_m)∈Z[1/m]. This is the accepted correction
`HabiroNahmSeries/E28`; the printed smaller ring is false. For A=0,m=2,k=0,
B=Σ_{j≥0}s^j/(q;q)_{2j}, and a direct logarithmic calculation gives

\[
 L_2=-\frac{q^3+2q-1}
 {2(q-1)^3(1+q^2)(1+q+q^2)}.
\]

Its genuine Phi_4 pole is permitted by R_2. This is a counterexample to the
printed ring, not to the corrected target. When m=1 the ring is exactly
Z[q,q^{-1}] and the target reduces to the finite-support theorem proved here.

**G3** is the complete corrected level-m proof in arbitrary rank. The
simultaneous ratio induction must keep the leading q^{k_j} of σ_jH/H.
Linearizing the order-m polynomial at that constant yields, up to a Laurent
unit, the product

\[
 \prod_{\substack{0\leq s<m\\s\ne k_j}}
           (1-q^{k_j+mn_j-s}).
\]

None of these factors vanishes at a root whose order is divisible by m.
The k=0 formula printed in the source cannot simply be reused for arbitrary
k. Next track the cyclotomic factors under every Adams pullback with
gcd(l,m)=1 and prove the denominator set defining R_m is preserved. Finally
compare residues at forbidden roots c=ma, gcd(a,m)=1, with every proper
multi-index divisor term included. The conjugate primitive m-th root
evaluations and the coefficient of V must occur explicitly in that equality.
The value claim L_n(ζ_m)∈Z[1/m] also needs proof; pole removal alone does not
give it. These are precise remaining requirements, while existence and
uniqueness of the multivariable restricted decomposition are supplied above.

The stage has six planets: cyclotomic orbit equations, the Nahm potential,
the residue lemma, the finite support theorem, restricted Adams coefficients
and level-m admissibility. The Gaussian operator remains a planet of its
existing owner. The packet has fifteen refinements: nine theorems, three
constructions and three comparisons, with fifteen API items and twelve unit
tests. Each stated target is either an imported node or a refinement whose
prerequisite chain ends in the pinned libraries, an existing plan, or G1–G3.

The suggested file gives all three construction signatures, their APIs and
twelve tests using Mathlib’s actual power-series and rational-function
carriers. Its elementary residue and finite-support theorems have typed
signatures. Gaussian signatures whose required completion is unresolved
are explicitly named as omissions, with the missing object specified; no
abstract proposition field substitutes for their conditions. The file’s
elaboration is a check of signatures, not a proof of the mathematics.

The continuation contract is to discharge G1, then G2, then G3, preserving
the elementary proof chain and existing ownership. HB.9 consumes the
critical potential and the corrected level-m/Frobenius interface; its
p-adic regulator comparison and Habiro-module membership remain in HB.9.
No evaluation at t=1 is part of the coefficientwise formal development in
this stage.
