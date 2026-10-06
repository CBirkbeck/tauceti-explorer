# Polylogarithms: other precise statements and tests

This target-level follow-up completes the missing weight-three differential in
P.6. The [accepted base packet](../packets/Polylogarithms.json) supplies the
polylogarithms, p-adic regulator, regulator equivalence and certificate tests.
The [follow-up packet](../packets/Polylogarithms--P.6.json) adds the exact
trilogarithm differential and its test application. These are plans, with
implementation status unchecked. The pass is complete; P.6 is planned, with
three supplier requests and the assembly refinements listed below.

## Imported objects and ownership

The conventions of `Polylogarithms:P.1/classical-polylogarithm` are fixed:
\(\operatorname{Li}_1(z)=-\log(1-z)\), with the principal logarithm, and the
higher functions have their principal analytic branch on
\(\mathbf C\setminus[1,\infty)\), with the lower-side convention on the cut.
The imported `Polylogarithms:P.1/single-valued-polylogarithm` takes the real part
in odd weight and the imaginary part in even weight, with coefficients
\(2^kB_k/k!\) and \(B_1=-1/2\). In particular, writing \(a=\log|z|\),

\[
 L_3(z)=\operatorname{Re}\left(
 \operatorname{Li}_3(z)-a\operatorname{Li}_2(z)
       +\tfrac13 a^2\operatorname{Li}_1(z)\right).
\]

`Polylogarithms:P.1/bloch-wigner-dilogarithm` supplies
\(D(z)=\operatorname{Im}\operatorname{Li}_2(z)+\arg(1-z)\log|z|\).
It vanishes on the real axis and is positive in the upper half-plane.
Single-valuedness and smoothness of \(L_3\) away from \(0,1\), including across
the classical branch cut, are imported through
`Polylogarithms:P.1/branch-change-and-monodromy`. No new definition of these
functions is made here.

The shared completed global-unit map, strong Leopoldt proposition and Leopoldt
defect belong to `IntegralIwasawaTheory:I.2`. For a number field \(K\) and prime
\(p\), let \(E_K=\mathcal O_K^\times\), and let \(\widehat U_v\) denote the
pro-p completion of the local unit group. The shared map is

\[
 E_K\otimes_{\mathbf Z}\mathbf Z_p
       \longrightarrow\prod_{v\mid p}\widehat U_v.
\]

Its injectivity is the strong Leopoldt statement. The free-rank defect is
\(\delta_{K,p}=r_1+r_2-1-\operatorname{rank}(\text{logarithmic image})\).
The interface must explain passage to principal units: an ordinary unit does
not canonically lie in \(U_v^1\). Projection to the pro-p part or powering must
be stated, and the p-primary torsion must be checked separately when converting
an integral injectivity claim to a torsion-free rank claim, especially at
\(p=2\). This is distinct from weak cyclotomic Leopoldt. The abelian strong
case is supplied by `IntegralIwasawaTheory:L4` through Baker–Brumer.

P.6 consumes this early interface. Its old `leopoldt-statement` node is an
imported adapter; its obsolete ownership sentence and its planet are assigned
to I.2 at assembly. The dependency directions are I.2 to L4, I.2 to
`AutomorphicPadicLFunctions:L0`, and I.2 to P.6. None requires a reverse edge
from polylogarithms. This addresses confirmed finding RT-AREA-ktheory-2/26.

P.6 retains `Polylogarithms:P.6/padic-regulator`. With a basis
\(\varepsilon_1,\ldots,\varepsilon_r\) of units modulo torsion and **all**
\(d=[K:\mathbf Q]\) embeddings \(\sigma_j:K\to\overline{\mathbf Q}_p\), its
matrix is \((\log_p\sigma_j(\varepsilon_i))_{i,j}\). The normalised Iwasawa
logarithm, \(\log_p(p)=0\), is imported from `PadicHodgeRegulators:D.1`.
The API names `padicRegulatorMatrix`, `padicRegulatorRank`,
`padicRegulatorRank_indep`, `padicRegulatorRank_le` and `padicRegulator` are
already outlined in the base packet. The rank is independent of the basis and
embedding order. For totally real \(K\), the deleted-column determinant is
well defined up to sign; in general use the rank, rather than a square
determinant. The existing `leopoldt-equivalence` equates full unit rank,
completed-map injectivity and, in the totally real case, nonzero determinant,
with the torsion passage just described.

The inherited regulator tests remain: rank zero for imaginary quadratic
fields; \(K=\mathbf Q(\sqrt2),p=7\), where \(\sqrt2=10\pmod{49}\) gives
\((1+\sqrt2)^6=15\pmod{49}\) and logarithm valuation one; two embedding columns
in that quadratic example irrespective of the number of places above p; and
nonzero logarithm for an algebraic unit that is not a root of unity. The
uncompleted diagonal unit map is always injective and is not the conjecture.

## Single-valued trilogarithm differential

**Theorem — `singleValuedPolylog_three_differential`.** For
\(z\in\mathbf C\setminus\{0,1\}\), the real Fréchet derivative of \(L_3\)
exists. With \(a=\log|z|\) and \(b=\log|1-z|\), for every real tangent vector
\(v\in\mathbf C\),

\[
 dL_3(z)[v]=-D(z)\operatorname{Im}(v/z)
  +\frac a3\left(b\operatorname{Re}(v/z)
                   -a\operatorname{Re}(v/(z-1))\right).
\]

Equivalently,

\[
 dL_3=-D\,d\arg z+
     \tfrac13\log|z|\bigl(\log|1-z|\,d\log|z|
                           -\log|z|\,d\log|1-z|\bigr).
\]

Here \(d\arg z\) denotes the smooth one-form
\(v\mapsto\operatorname{Im}(v/z)\). It does not assert differentiability of
the principal argument on its cut. Also
\(d\log|1-z|[v]=\operatorname{Re}(v/(z-1))\); writing \(1-z\) in that
denominator requires an additional minus sign. The derivative is over
\(\mathbf R\), since \(L_3\) is real valued. The signature asserts
`DifferentiableAt` together with its `fderiv` evaluation: Mathlib totalises
`fderiv` to zero at a nondifferentiable point, so an evaluation equality alone
would not certify the claimed differential.

This is the weight-three case of Goncharov,
[Explicit regulator maps on polylogarithmic motivic complexes](https://arxiv.org/pdf/math/0003086v1),
§4 Proposition 4.1, equation (28), printed pages 17–20. In that source the
even-weight projection is \(i\operatorname{Im}\), so
\(\widehat L_2=iD\) and the factor \(d\,i\arg z=i\,d\arg z\) contributes a
second \(i\). Their product is \(-D\,d\arg z\).
Equation (15) gives
\(\widehat L_{1,2}=a\alpha(1-z,z)\), with
\(\alpha(1-z,z)=-b\,da+a\,db\); its coefficient in (28) is \(-1/3\).
Both conversions are necessary for the displayed formula.

A direct proof specialises the defining combination. On the cut complement
write \(\operatorname{Li}_1=-b-i\phi\) and
\(\operatorname{Li}_2=u+iw\), where \(\phi=\arg(1-z)\), and use
\(d\operatorname{Li}_3=\operatorname{Li}_2\,dz/z\) and
\(d\operatorname{Li}_2=\operatorname{Li}_1\,dz/z\). Differentiation cancels
\(u\,da\); the angular coefficient is \(-(w+a\phi)=-D\), and the remaining
terms are \(ab\,da/3-a^2\,db/3\). The pinned library's
`Complex.log_re` and `Complex.hasStrictFDerivAt_log_real` supply the local
logarithmic calculation. Use a rotated local logarithm when needed to satisfy
the latter theorem's slit-plane hypothesis. Imported smoothness of \(L_3\)
and continuity of the displayed one-form extend the identity across
\((1,\infty)\) from its dense complement. This extension includes \(z=2\).

The theorem is an API item of the existing P.1 object, promoted to a new node
because P.6 consumes it. Its planet is **Single-valued trilogarithm
differential**. It proves the pointwise derivative, and leaves the separate
curve-current identity with `Polylogarithms:P.5/weight-three-curve-regulator`.

## Exact acceptance instances

The application `trilogarithm-differential-regression-tests` carries five
examples. Each asserts differentiability at the point as well as the stated
value, and appears under its test name in the suggested file.

| Test | Exact assertion | What it checks |
| --- | --- | --- |
| `trilog_diff_half` | \(dL_3(1/2)[v]=\frac43(\log2)^2\operatorname{Re}v\) | The Bernoulli coefficient and both logarithmic terms. |
| `trilog_diff_on_cut` | \(dL_3(2)[v]=-\frac13(\log2)^2\operatorname{Re}v\) | Smoothness on the principal cut and the sign of the last term. |
| `trilog_diff_minus_one` | \(dL_3(-1)=0\) | A regular point with a zero derivative. |
| `trilog_diff_unit_circle` | If \(|z|=1,z\ne1\), then \(dL_3(z)[z]=0\) and \(dL_3(z)[iz]=-D(z)\). | Radial and positively oriented angular directions. |
| `trilog_diff_i_sign` | \(dL_3(i)[-1]=-D(i)<0\), and \(dL_3(i)[i]=0\). | Detects loss of either factor of \(i\) in the source convention. |

These are exact consequences of the theorem and the imported reality and
positivity properties of \(D\), rather than numerical derivative estimates.
The half-point uses \(a=b=-\log2\), with denominators \(1/2\) and \(-1/2\).
At the cut-point \(b=0\). On the unit circle \(a=0\), so only the angular
term survives.

The other P.6 tests retain their accepted owners. The exact five-term instance
at \(x=i/2,y=(1+i)/2\) is

\[
 D(i/2)-D((1+i)/2)+D(1-i)-D(2-i)+D((3+i)/2)=0.
\]

It is an instance of `Polylogarithms:P.1/bloch-wigner-five-term`. Its independent
numerical consistency check has error at most \(5\cdot2^{-m}\) at precision
\(m\), by `Polylogarithms:P.2/certified-numerics-error`; an enclosure does not
prove the identity. Real-place cancellation is proved by
`Polylogarithms:P.2/weight-two-regulator`. Every claimed Bloch element uses
`K3BlochGroups:V.6/bloch-element-constructor` with a proved boundary, and equality
certificates use `K3BlochGroups:V.6/five-term-certificate`. Floating-point
regulator values are not boundary certificates. Those available nodes need no
new definition or supplier request.

## Sources, coverage and assembly

The source read is arXiv math/0003086v1, accessed 6 October 2026: §2 items 1, 4
and 6, and §4 Proposition 4.1 with its complete proof. The packet records the
PDF hash and passages. The first definition on printed page 3 prints the
logarithm exponent as \(n-k\); it must be \(k\), as in equation (33) and the
immediately following dilogarithm example. Finding `Polylogarithms/E22` is
scoped to this preprint. The page image confirms the misprint. The published
text was not obtained, and no claim is made about its typography.

The p-adic definitions and tests are reused from the accepted base plan and its
reviewed locators. The NSW electronic text was not obtained for this follow-up; its
Theorem 10.3.6 is an inherited source locator, not freshly verified here. The new differential
has a public proof independent of that source. The reviewed P.1/P.6 library
audit was read, and declarations were checked at Mathlib 082e2d3 and Tau Ceti
f790474. No existing higher-polylogarithm differential supplies this target.
The upstream ConformalMapping and ArithmeticDirichletSeries documents were
read in full for style and normalisation practice.

[Mathlib PR #44531](https://github.com/leanprover-community/mathlib4/pull/44531)
proposes `Complex.polylog` with complex weight, the classical derivative
recurrence, analyticity off the cut and the same lower-side cut convention.
Its declarations were read at head 7d07d5f. It is outside the pinned baseline
and does not supply the single-valued differential. The existing P.1 classical
function should follow that design and adopt it on integration, casting integer
weights to complex weights. This follow-up imports P.1 and introduces no
competing classical-polylogarithm API.

P.6 is **planned**, with no new local proof gap and three requests: the early
I.2 completed-map/strong-statement/defect interface, the D.1 logarithmic
comparison, and the L4 abelian special case. Assembly binds these supplier
interfaces to the inherited regulator equivalence, assigns the shared statement
and its planet to I.2, and adds the new differential as a prerequisite of the
old P.6 test node. Remove only the weight-three differential clause of the base
source gap; preserve the general-weight and higher-Bloch source obligations
under their own owners, together with P.5's current obligations. The pass adds
one theorem, one application, one planet and five exact acceptance examples;
it introduces no new definition requiring a second API outline.
