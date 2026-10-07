# Elliptic regulators, ER.4: the direct torsion calculation

This part completes the analytic proof route left open in the accepted
EllipticRegulators blueprint. The layer relates regulators of symbols to their
divisors, evaluates Bloch’s corrected torsion classes, and computes a finite
Fourier combination of those regulators as a punctured lattice sum. Its new
work is the independent calculation of that sum. The divisor pairing, the
classes themselves, the torsion Fourier adapter and constant-field transfer
retain their existing owners and declaration identifiers.

The [packet](../packets/EllipticRegulators--ER.4.json) contains eleven new
declarations: two weighted terms, one orbit-splitting lemma and eight analytic theorems. Every stage
target is supplied either there or by the seven accepted parent nodes listed
below. ER.4 has coverage `planned`; the packet is `complete`. The general
geometric pushforward comparison remains a recorded supplier gap in ER.7.
These are plans for a library, with implementation status `unchecked`.

## Conventions and the endpoint

Let C≥1, τ∈ℍ, y=Im τ, q=exp(2πiτ), and T_C=(ℤ/C)². Use canonical
representatives 0≤k,ℓ<C and the lift

\[
 x_{k,\ell}=\exp(2\pi i(k+\ell\tau)/C).
\]

For f:T_C→ℂ write f(m,n) for its periodic extension to ℤ². The transform
imported from `EllipticRegulators:ER.4/finite-fourier-transform` is

\[
 \widehat f(k,\ell)=C^{-2}\sum_{a,b\bmod C}f(a,b)
                  e^{2\pi i(-ak+b\ell)/C},\qquad
 f(a,b)=\sum_{k,\ell}\widehat f(k,\ell)e^{2\pi i(ak-b\ell)/C}.
\]

It is the averaged coefficient of the character χ_(k,ℓ)(a,b)=exp(2πi(ak−bℓ)/C)
from `AdditiveCombinatorics:AC.0/fourier-transform`. The dual identification
uses these coordinates, including the minus sign on bℓ. Generic inversion,
Parseval and normalized convolution belong to AC.0. Only its torsion
specialization and oddness identities belong here. In particular this is the
C⁻² convention of Lecture 10; ER.5’s Lecture-11 transform has a different
C⁻¹ convention.

The lattice evaluation theorems require f(−u)=−f(u), and hence f̂ is odd,
f(0)=f̂(0)=0. Definitions, linearity and character tests accept every f.
Coefficients may be complex. The expressions Im Li₂(z) and Im(1/(m²w)) are
real numbers which are cast into ℂ **before** multiplication by f or f̂.
Taking the imaginary part of the weighted sum would destroy complex linearity.

The logarithm is principal. On the closed unit disc the imported principal
Li₂ is the absolutely convergent series Σ_(j≥1) z^j/j²; the suggested file uses
that coordinate expression without creating a second polylogarithm theory.
Set W(z)=log|z| log(1−z), with W(1)=0. When |z|=1, W(z)=0, but Im Li₂(z) need
not vanish. All torsion lifts satisfy |x_(k,ℓ)|≤1. Equality occurs when ℓ=0;
the forward term n=0 lies on the unit circle. The open-disc logarithm series
is used only after discarding its zero **weighted** summand. The unit-circle
Li₂ series is retained, giving the boundary term M₂ below.

## How this extends the accepted parent

All identifiers in this table have prefix `EllipticRegulators:ER.4/` and
refer to [the accepted parent packet](../packets/EllipticRegulators.json).
Their API and tests remain authoritative; this part adds no replacement nodes.

| Imported declaration | Target and fixed interface |
| --- | --- |
| `the-diamond-convolution` | For divisors D=Σm_i[P_i], D′=Σn_j[Q_j], D⋄D′=Σm_i n_j[Q_j−P_i], the product of the reflected first divisor with the second in AddMonoidAlgebra ℤ A. |
| `the-divisor-formula` | For nonzero rational functions F,G, r_E({F,G})(dz)=½ conjugate(R_q((F)⋄(G))). It holds without an unramified/tame-symbol hypothesis. |
| `bloch-lift-formula` | Raw evaluations on permitted lifts agree with the regularized divisor evaluation: degree zero and product one on both lifts kill the Bernoulli polynomial. |
| `the-regulator-of-the-corrected-classes` | For nonzero a∈E_τ[C], R_q(S_a)=C³ R_q(a). Constant-symbol corrections contribute zero; the classes are imported from EllipticKTheory E.7. |
| `finite-fourier-transform` | The AC.0 averaged transform through the character χ_(k,ℓ), its C-torsion dual equivalence, oddness and normalization comparisons. |
| `bloch-theorem-10-2-1` | The final class-regulator Fourier combination equals (iy²C³/π) times the full punctured lattice sum. The direct analytic theorem here supplies its missing proof route. |
| `transfer-and-the-trace-formula` | For a finite number-field extension L/k, reg_σ(Nβ)=Σ_(ρ\|k=σ)reg_ρ(β), from split base change of K₂ transfer and regulator additivity. |

For the diamond interface, bilinearity, degree multiplication, functoriality
under group homomorphisms and the reflection identity are inherited. In ℤ[ℤ/5],
[1]⋄[3]=[2], while exchanging the entries gives [3], the reflection of [2].
An odd function changes sign on reflection. Negating the divisor itself is a
different operation. The parent's point-mass and Parseval tests also fix the
transform: at C=3, δ_(0,0) has transform constantly 1/9, so its squared norm
sum is 1/9; δ_(1,0)−δ_(2,0) has coefficient −i√3/9 at (1,ℓ).

The distinction between the two companions is equally fixed. ER.3 supplies
R_q^Bl=J_q^Bl+iD_q on lifts and its q-invariant regularization R_q. At the
canonical lift the difference is

\[
 b_\tau(k,\ell)=4\pi^2y^2
 \left(\frac{\ell^3}{3C^3}-\frac{\ell^2}{2C^2}
                         +\frac{\ell}{6C}\right),\qquad
 R_q(x_{k,\ell})=R_q^{\mathrm{Bl}}(x_{k,\ell})+b_\tau(k,\ell).
\]

The class identity is C³(R_q^Bl+b), with C³ multiplying the whole bracket.
For permitted divisor lifts, expanding B₃(u−v) shows that each cubic monomial
is killed by degree zero or by the product-one condition. This justifies the
parent lift formula without asserting that the raw companion descends to the
curve. The raw companion does depend on a general lift.

## Proof order and ownership

The direct route begins with absolute convergence, the AC.0 adapter, ER.3’s
companion definition and Polylogarithms P.1’s Li₂/Bloch–Wigner interface. It
computes L, M₁, M₂ and the Bernoulli correction, obtaining the raw and then the
regularized analytic identities. None of these steps invokes the divisor
formula, a K₂-class regulator or ER.3’s Fourier/Kronecker–Eisenstein theorem.
Afterwards the accepted divisor/class nodes attach C³ to the analytic formula.

This order matters for assembly. The parent ER.3 Fourier expansion cites
Bloch’s Proposition 10.3.1, and Brunault’s torsion expansion invokes Bloch’s
Theorem 10.2.1. Using either expansion as an input to this direct calculation
would conceal the very proof dependency this part supplies. Assembly connects
`direct-regularized-fourier-identity` to the parent analytic torsion expansion
and final class theorem, retaining their identifiers. Non-torsion extension
continues to use ER.3’s continuity and density arguments.

The confirmed finding RT-AREA-combinatorics/14 is handled by the explicit
AC.0→ER.4 edge and by retaining only the parent torsion adapter. AC.0 owns
`fourier-transform`, `fourier-parseval` and `fourier-nconv`, with probability
counting measure on the group and counting measure on its dual. Its packet
already gives ZMod.dft and haarProb comparisons. Compatibility with the
existing AlgebraicCodingTheory Layer 3 and ModularForms Layer 0 remains a
supplier responsibility; neither upstream theory is rebuilt here.

One missing audit citation was checked directly at the Tau Ceti pin:
`CommGroup.sum_monoidHom_apply_eq_ite`, in
TauCeti/GroupTheory/FiniteAbelian/CharacterOrthogonality.lean, gives column
orthogonality for a finite commutative group and a domain with enough roots of
unity. The sum over characters at g is card G at g=1 and zero otherwise. The
packet records this evidence in `upstreamNotes` for the AC.0 audit owner. This
job’s allowed paths do not include that supplier packet or audit.

## New declarations, API and acceptance tests

The following catalogue states the complete targets of this part. Each id has
prefix `EllipticRegulators:ER.4/`. Every theorem uses the conventions above and
odd f unless explicitly stated otherwise. All sums over ℤ² are product-index
absolute sums. Removing an index means putting a zero term at that index in
the suggested file; it never means selecting a conditionally convergent order.

### Convergence for Bloch’s direct torsion calculation

`direct-series-convergence` — theorem.

For every u∈T_C, the forward and backward raw logarithmic orbit series are absolutely summable after defining W(z)=log|z| log(1−z) with W(1)=0; the corresponding Li₂ imaginary orbit series and the double power series Σ_{n≥0,j≥1}(x_u q^n)^j/j² are absolutely summable. For bounded periodic f, each of Σ_{m≠0,n} f(m,n)/(m(mτ+n)²), Σ_{m≠0,n} f(m,n) Im(1/(m²(mτ+n))), Σ'_{m,n} f(m,n)/((mτ+n)²(mτ̄+n)), and Σ_{n≠0}f(0,n)/n³ is absolutely summable. Here Σ' omits (0,0); Im is taken before multiplication by f.

The proof or construction uses the following steps.

1. Use norm_qParam: |q|<1, |x_u|≤1 and |x_u^(−1)q|<1. The only forward boundary is n=ℓ=0. There W vanishes because log|x_u|=0, including x_u=1. For the tail, |log(1−z)|≤A|z| from the principal logarithm Taylor series; |log|x_u q^n|| grows linearly, so n|q|^n dominates the log orbit series.
2. On the closed unit disc, Li₂ equals Σ_{j≥1} z^j/j²: import P.1 continuity and its open-disc series, extend by uniform 1/j² domination. For n≥1 the sum of absolute values is bounded by A|q|^n; for n=0 use the convergent p=2 series. This proves the absolute double-series bounds needed to exchange n,j and finite character sums.
3. For a=|m|y>0, divide integers n into shells j≤|n+m Re τ|<j+1, at most four per shell. Comparison with the integral of (a²+t²)^(−1) gives Σ_n|mτ+n|^(−2)≤K_y/|m|. Hence the log-kernel norm sum is ≤K_yΣ_{m≠0}|m|^(−2). The projected imaginary kernel has absolute value y/(|m||mτ+n|²), so the same bound applies. Do not claim the unprojected reciprocal series is absolutely summable.
4. For the full cubic kernel, the real-linear map (m,n)↦mτ+n is invertible because y>0. Its lower norm bound and EisensteinSeries.summable_one_div_norm_rpow at k=3 give the result. The horizontal series uses p=3. Boundedness of f follows from finiteness of T_C.

Direct prerequisites: `Polylogarithms:P.1/classical-polylogarithm`, `mathlib:hasSum_coe_mul_geometric_of_norm_lt_one`, `mathlib:Function.Periodic.norm_qParam`, `mathlib:Complex.hasSum_taylorSeries_neg_log`, `mathlib:Real.summable_one_div_nat_pow`, `mathlib:Real.summable_one_div_int_pow`, `mathlib:EisensteinSeries.summable_one_div_norm_rpow`.

Source locator: §10.3, pp.80–85, sum rearrangements underlying (10.3.2) and Propositions 10.3.1,10.3.3.


Acceptance checks:

- At ℓ=0 the logarithmic n=0 contribution is zero; the Li₂ n=0 contribution is retained.
- All lattice identities use product-index absolute sums, not a silently chosen order of summation.
- The row bound is uniform in the translate m Re τ; no irrationality condition on Re τ.

### Bloch’s logarithmic term L

`weighted-logarithmic-term` — definition.

Define blochLogTerm(C,τ,f)=L=Σ_{u∈T_C}f̂(u)A_τ(x_u), where W(z)=log|z| log(1−z), W(1)=0, and A_τ(x)=Σ_{n≥0}W(xq^n)−Σ_{n≥1}W(x^(−1)q^n). Complex.log is the principal logarithm; canonical torsion lifts make both tails lie in the closed unit disc. This construction is the weighted specialization of the raw regulator’s logarithmic part, not a new elliptic companion.

The construction accepts arbitrary f; oddness is required only by the evaluation theorems.

The proof or construction uses the following steps.

1. Use the imported torsion transform and q-parameter; define A only at canonical torsion lifts.
2. The convergence theorem gives both orbit sums; multiply by the finite Fourier coefficients and sum.
3. Complex linearity is in f, not in x. The raw part depends on its lift; it is not asserted q-invariant.

Direct prerequisites: `EllipticRegulators:ER.4/finite-fourier-transform`, `EllipticRegulators:ER.4/direct-series-convergence`, `EllipticRegulators:ER.3/the-companion-and-Bloch-convention`, `mathlib:Function.Periodic.qParam`, `mathlib:ZMod.stdAddChar`.

Source locator: (10.3.2), p.80.

The interface serves these uses.

- Bloch Proposition 10.3.1: Rewriting L with weighted geometric series isolates the logarithmic lattice kernel.
- Direct raw Fourier identity in this packet: Adds to the independently computed dilogarithmic contribution.

API outline:

- `blochLogTerm_apply` (characterisation): L(C,τ,f)=Σ_u f̂(u)A_τ(x_u).
- `blochLogTerm_zero` (simp): L(C,τ,0)=0.
- `blochLogTerm_add` (structure): L(C,τ,f+g)=L(C,τ,f)+L(C,τ,g).
- `blochLogTerm_smul` (structure): L(C,τ,c f)=c L(C,τ,f) for c∈ℂ.
- `blochLogTerm_character` (compatibility): For χ_u(a,b)=ZMod.stdAddChar(ak−bℓ), L(C,τ,χ_u)=A_τ(x_u), by AC.0 character orthogonality and the imported torsion identification.
- `blochLogTerm_boundary` (compatibility): For |z|=1, W(z)=0, including z=1. This is an equality for the weighted summand, not a Taylor series assertion for log(1−z).

Unit tests:

- `log_test_trivial_level` (degenerate): At C=1, L(1,τ,f)=0 for every f (A_τ(1)=0 by tail cancellation).
- `log_test_character_level_three` (computation): For C=3 and u=(0,1), L(3,τ,χ_u)=A_τ(exp(2πiτ/3)); no factor 3 or 9.
- `log_test_unit_boundary` (compatibility): W(i)=W(1)=0, although log(1−i) is nonzero; only the weighted summand is erased.
- `log_test_complex_scalar` (non-example): L(C,τ,i f)=i L(C,τ,f); replacing the complex log by its real part loses the original complex regulator decomposition.

Acceptance checks:

- Zero input gives zero on both sides.
- C=1 or C=2 forces an odd complex-valued input to vanish.
- Complex scalar multiplication preserves the identity; no coefficient passes through Im.

### Bloch’s dilogarithmic term M

`weighted-dilogarithmic-term` — definition.

Define blochDilogTerm(C,τ,f)=M=i Σ_{u∈T_C}f̂(u)V_τ(x_u), where V_τ(x)=Σ_{n≥0}Im Li₂(xq^n)−Σ_{n≥1}Im Li₂(x^(−1)q^n). On |z|≤1 use P.1’s principal Li₂, equal to the absolutely convergent Σ_{j≥1}z^j/j². Im is applied to each Li₂ value before the complex Fourier coefficient. Together A_τ(x)+iV_τ(x)=R_q^{Bl}(x)=J_q^{Bl}(x)+iD_q(x); the log|z| arg(1−z) part of D is in A, so V alone is not D_q.

The construction accepts arbitrary f; oddness is required only by the evaluation theorems.

The proof or construction uses the following steps.

1. Use imported P.1 Li₂ with its closed-disc continuity; the series coordinate form follows by uniform p=2 domination.
2. Form the two absolutely summable imaginary orbit sums, then the finite complex-linear weighted sum.
3. Expand the definition of D(z)=Im Li₂(z)+log|z|arg(1−z) and of J; principal log identifies A+iV with the imported raw Bloch regulator.

Direct prerequisites: `EllipticRegulators:ER.4/finite-fourier-transform`, `EllipticRegulators:ER.4/direct-series-convergence`, `Polylogarithms:P.1/classical-polylogarithm`, `Polylogarithms:P.1/bloch-wigner-dilogarithm`, `EllipticRegulators:ER.3/the-companion-and-Bloch-convention`.

Source locator: (10.3.2), p.80; proof of Proposition 10.3.3, pp.82–83.

The interface serves these uses.

- Bloch Propositions 10.3.3 and Lemmas 10.3.4–10.3.5: M₁ carries a cotangent sum and an extra H term; M₂ removes H.
- Raw Fourier identity; ER.3 companion comparison: The imaginary Li₂ piece combines with the principal-log piece to give R^{Bl}, rather than the dilogarithm alone.

API outline:

- `blochDilogTerm_apply` (characterisation): M(C,τ,f)=iΣ_u f̂(u)V_τ(x_u).
- `blochDilogTerm_zero` (simp): M(C,τ,0)=0.
- `blochDilogTerm_add` (structure): M(C,τ,f+g)=M(C,τ,f)+M(C,τ,g).
- `blochDilogTerm_smul` (structure): M(C,τ,c f)=c M(C,τ,f) for all complex c.
- `blochDilogTerm_character` (compatibility): M(C,τ,χ_u)=i V_τ(x_u), using the same torsion character as L.
- `blochDilogTerm_split` (relation): For odd f, M=M₁+M₂, where M₁=2iΣ_u f̂(u)Im Σ_{n≥0}Li₂(x_u q^n), M₂=−iΣ_k f̂(k,0)Im Li₂(exp(2πik/C)); both sums converge absolutely. The ℓ=0 boundary survives the orbit reindexing.

Unit tests:

- `dilog_test_trivial_level` (degenerate): M(1,τ,f)=0 for every f; V_τ(1)=0.
- `dilog_test_character_level_three` (computation): M(3,τ,χ_(0,1))=i V_τ(exp(2πiτ/3)); the character test catches the Fourier sign and C^(−2) factor.
- `dilog_test_complex_scalar` (non-example): M(C,τ,i f)=i M(C,τ,f); Im must not be moved outside a complex-weighted sum.
- `dilog_test_unit_circle` (compatibility): For C=4, τ=i and χ_(1,0), M=i Im Li₂(i)+2iΣ_{n≥1}Im Li₂(i exp(−2πn)); the nonzero unit-circle Li₂ value is retained.

Acceptance checks:

- Zero input gives zero on both sides.
- C=1 or C=2 forces an odd complex-valued input to vanish.
- Complex scalar multiplication preserves the identity; no coefficient passes through Im.

### Splitting the dilogarithmic orbit sum

`dilogarithmic-orbit-splitting` — lemma.

blochDilogTerm_split: for odd f, M=M₁+M₂, where M₁=2iΣ_u f̂(u)Im Σ_{n≥0}Li₂(x_u q^n) and M₂=−iΣ_k f̂(k,0)Im Li₂(exp(2πik/C)). This promotes the definition’s relation API to the explicit prerequisite used by the lattice evaluation.

The proof or construction uses the following steps.

1. Change u to −u in the backward sum and use f̂(−u)=−f̂(u). For ℓ>0, the canonical negative lift is q/x_u, so n≥1 becomes n−1≥0.
2. For ℓ=0 the canonical negative lift is 1/x_u; the backward series becomes the forward one with its n=0 term omitted.
3. The finite weighted sum is thus twice the forward sum minus exactly the ℓ=0 endpoint. Absolute convergence justifies the reindexing and taking Im termwise.

Direct prerequisites: `EllipticRegulators:ER.4/weighted-dilogarithmic-term`, `EllipticRegulators:ER.4/direct-series-convergence`, `EllipticRegulators:ER.4/finite-fourier-transform`.

Source locator: (10.3.2) and decomposition in proof of Proposition 10.3.3, pp.80,82–83.


Acceptance checks:

- The ℓ=0 boundary is retained with coefficient −i, not −2i.
- Complex f is permitted; only the real Li₂ values are projected.

### The Bernoulli horizontal term

`torsion-bernoulli-horizontal-term` — theorem.

Let b_τ(u)=4π²y²(t³/3−t²/2+t/6), t=ℓ/C. Then B=Σ_u f̂(u)b_τ(u)=(iy²/π)Σ_{n≠0}f(0,n)/n³. This is the unscaled correction for the analytic R_q, before multiplying by C³ for the K₂ classes.

The proof or construction uses the following steps.

1. Specialize Mathlib’s sine/Bernoulli formula at k=1. Pair ±n to obtain Σ_{n≠0}exp(2πint)/n³=(4π³i/3)B₃(t), including endpoints 0,1.
2. Multiply by −iy²/π and exchange the absolutely convergent n sum with the finite u sum.
3. AC.0 inversion in the imported ER.4 coordinates gives Σ_u f̂(u)exp(2πinℓ/C)=f(0,−n). Oddness changes the minus sign to plus.

Direct prerequisites: `EllipticRegulators:ER.4/finite-fourier-transform`, `EllipticRegulators:ER.4/direct-series-convergence`, `EllipticRegulators:ER.3/the-companion-and-Bloch-convention`, `AdditiveCombinatorics:AC.0/fourier-transform`, `mathlib:hasSum_one_div_nat_pow_mul_sin`.

Source locator: Lemma 10.2.3, pp.79–80.


Acceptance checks:

- For C=3 and f=δ_(0,1)−δ_(0,2), B=8π²i y²/(81√3); the horizontal row has that value after multiplying by iy²/π.
- The inherited capital-C correction is source issue EllipticRegulators/E11; no new spelling of it is introduced.
- For an input supported off the row a=0 the correction vanishes.

### Evaluation of Bloch’s logarithmic term

`logarithmic-lattice-evaluation` — theorem.

L=−y/(2π) Σ_{m≠0,n∈ℤ} f(m,n)/(m(mτ+n)²). All indices are signed integers; the m=0 row is absent.

The proof or construction uses the following steps.

1. Use oddness of f̂ to combine the forward/backward log orbit sums. The ℓ=0 endpoint has multiplier n+ℓ/C=0 at n=0; it contributes zero.
2. Expand the principal log only on the open unit-disc terms, using Complex.hasSum_taylorSeries_neg_log. Character orthogonality imposes j≡a (mod C); reindex nC+ℓ. The resulting expression is (4πy/C²)Σ_{a,b,j>0,j≡a} f(a,b)j^(−1)Σ_{r≥0}r exp(2πir(jτ+b)/C).
3. The weighted geometric baseline gives −1/(4sin²(πz)). The k=1 cotangent derivative gives π²/sin²(πz)=Σ_n(z+n)^(−2). Scale z=(jτ+b)/C and reindex b+Cn.
4. The positive j expression is −y/π times its positive-m lattice sum. Pair (m,n) with (−m,−n); both f and m change sign, so bilateralization introduces the factor 1/2. Convergence permits all rearrangements.

Direct prerequisites: `EllipticRegulators:ER.4/weighted-logarithmic-term`, `EllipticRegulators:ER.4/direct-series-convergence`, `EllipticRegulators:ER.4/finite-fourier-transform`, `AdditiveCombinatorics:AC.0/fourier-transform`, `mathlib:Complex.hasSum_taylorSeries_neg_log`, `mathlib:hasSum_coe_mul_geometric_of_norm_lt_one`, `mathlib:iteratedDerivWithin_cot_pi_mul_eq_mul_tsum_div_pow`.

Source locator: Proposition 10.3.1 and Lemma 10.3.2, pp.80–82.


Acceptance checks:

- Zero input gives zero on both sides.
- C=1 or C=2 forces an odd complex-valued input to vanish.
- Complex scalar multiplication preserves the identity; no coefficient passes through Im.

### Evaluation of the forward dilogarithmic sum

`dilogarithmic-forward-evaluation` — theorem.

For odd f define H=(1/C)Σ_{m≥1}Σ_{b mod C}f(m,b)/m² and M₁=2iΣ_u f̂(u)Im Σ_{n≥0}Li₂(x_u q^n). Then M₁=H−(1/(2π))Σ_{m≠0,n} f(m,n)Im(1/(m²(mτ+n))). These expressions are absolutely convergent.

The proof or construction uses the following steps.

1. Expand Li₂ on the closed disc and exchange the absolutely convergent sums. To handle complex f, pair (a,b) with (−a,−b): Σ f(a,b)Re(exp(2πi(−ak+bℓ)/C))=0. This identity, not moving complex scalars through Im, changes the remaining phase expression into f(a,b) times Im(i times the power series).
2. Sum over k to impose m≡a mod C and combine ℓ,n into a nonnegative integer r. Sum the geometric series with z=(mτ+b)/C (Im z>0).
3. Use 1/(1−exp(2πiz))=(1+i cotπz)/2. The constant 1/2 gives H. For the cotangent part use the paired baseline; its imaginary projection is absolutely summable, since Im 1/(mτ+n)=−my/|mτ+n|².
4. Reindex residue b+Cn and use simultaneous negation to convert the positive-m sum to half the bilateral sum.

Direct prerequisites: `EllipticRegulators:ER.4/weighted-dilogarithmic-term`, `EllipticRegulators:ER.4/direct-series-convergence`, `EllipticRegulators:ER.4/finite-fourier-transform`, `AdditiveCombinatorics:AC.0/fourier-transform`, `mathlib:Complex.cot_pi_eq_exp_ratio`, `mathlib:cot_series_rep`.

Source locator: Lemma 10.3.4, pp.83–84.


Acceptance checks:

- Zero input gives zero on both sides.
- C=1 or C=2 forces an odd complex-valued input to vanish.
- Complex scalar multiplication preserves the identity; no coefficient passes through Im.

### Cancellation of the unit-circle boundary

`dilogarithmic-boundary-evaluation` — theorem.

For odd f, M₂=−iΣ_{k mod C}f̂(k,0)Im Li₂(exp(2πik/C))=−H, with H=(1/C)Σ_{m≥1,b mod C}f(m,b)/m². This cancels precisely the H in the forward evaluation.

The proof or construction uses the following steps.

1. Use the absolutely convergent Li₂ series on the unit circle, including the value 1.
2. Pair the original Fourier input with its negative, cancel its cosine part and use finite orthogonality in k. The condition m≡a mod C leaves a factor C; the original transform contributed C^(−2).
3. The remaining expression is −(1/C)Σ_{m≥1,b}f(m,b)/m². Keeping this endpoint prevents an erroneous extra constant in Proposition 10.3.3.

Direct prerequisites: `EllipticRegulators:ER.4/weighted-dilogarithmic-term`, `EllipticRegulators:ER.4/direct-series-convergence`, `EllipticRegulators:ER.4/finite-fourier-transform`, `AdditiveCombinatorics:AC.0/fourier-transform`, `Polylogarithms:P.1/classical-polylogarithm`.

Source locator: Lemma 10.3.5, p.84.


Acceptance checks:

- For C=3, f=δ_(1,0)−δ_(2,0), H=(1/3)Σ_{r≥0}((3r+1)^(−2)−(3r+2)^(−2))>0, and M₂=−H is not zero.
- For f=δ_(0,1)−δ_(0,2), every residue row sum vanishes, hence H=M₂=0.
- The complex multiple (1+2i) of the first test scales H and M₂ by (1+2i).

### Evaluation of Bloch’s dilogarithmic term

`dilogarithmic-lattice-evaluation` — theorem.

M=−(1/(2π))Σ_{m≠0,n∈ℤ} f(m,n)Im(1/(m²(mτ+n))). The real imaginary-part value is cast into ℂ before multiplying by f; there is no Im on the entire weighted sum.

The proof or construction uses the following steps.

1. Use blochDilogTerm_split, which explicitly retains M₂ from ℓ=0.
2. Substitute the independently evaluated M₁=H+projected kernel and M₂=−H.
3. Cancel H in ℂ. The convergence theorem proves that the remaining product-index sum is independent of summation order.

Direct prerequisites: `EllipticRegulators:ER.4/dilogarithmic-orbit-splitting`, `EllipticRegulators:ER.4/dilogarithmic-forward-evaluation`, `EllipticRegulators:ER.4/dilogarithmic-boundary-evaluation`, `EllipticRegulators:ER.4/direct-series-convergence`.

Source locator: Proposition 10.3.3, pp.82–85.


Acceptance checks:

- Zero input gives zero on both sides.
- C=1 or C=2 forces an odd complex-valued input to vanish.
- Complex scalar multiplication preserves the identity; no coefficient passes through Im.

### The direct raw Fourier identity

`direct-raw-fourier-identity` — theorem.

Σ_{u∈T_C}f̂(u)R_q^{Bl}(x_u)=L+M=(iy²/π)Σ_{m≠0,n}f(m,n)/((mτ+n)²(mτ̄+n)). This identity concerns canonical lifts and the raw function; it omits the entire horizontal row.

The proof or construction uses the following steps.

1. The imported P.1 Bloch–Wigner formula and raw companion definition give A+iV=R^{Bl}, so its finite weighted sum is L+M.
2. Insert the logarithmic and projected dilogarithmic lattice evaluations. For m≠0 and w=mτ+n, verify 1/(m w²)+y^(−1)Im(1/(m²w))=−2iy/(w² conj w), using w−conj w=2imy.
3. Multiply by −y/(2π) and sum using absolute convergence. This proof never invokes the ER.3 Fourier expansion, Green function, divisor formula or class regulator.

Direct prerequisites: `EllipticRegulators:ER.4/weighted-logarithmic-term`, `EllipticRegulators:ER.4/weighted-dilogarithmic-term`, `EllipticRegulators:ER.4/logarithmic-lattice-evaluation`, `EllipticRegulators:ER.4/dilogarithmic-lattice-evaluation`, `EllipticRegulators:ER.4/direct-series-convergence`, `EllipticRegulators:ER.3/the-companion-and-Bloch-convention`, `Polylogarithms:P.1/bloch-wigner-dilogarithm`.

Source locator: (10.3.1) and concluding algebra, pp.80,85.


Acceptance checks:

- Zero input gives zero on both sides.
- C=1 or C=2 forces an odd complex-valued input to vanish.
- Complex scalar multiplication preserves the identity; no coefficient passes through Im.

### The direct regularized torsion Fourier identity

`direct-regularized-fourier-identity` — theorem.

Σ_u f̂(u)R_q(x_u)=L+M+B=(iy²/π)Σ'_{m,n} f(m,n)/((mτ+n)²(mτ̄+n)), where R_q=R_q^{Bl}+b_τ on canonical torsion lifts and Σ' omits only (0,0). Multiplying both sides by C³ and using the imported class-regulator formula supplies the accepted ER.4/bloch-theorem-10-2-1. This is the analytic input also needed by ER.3’s Fourier/Kronecker–Eisenstein node.

The proof or construction uses the following steps.

1. Import the regularization from ER.3: R_q(x_u)=R_q^{Bl}(x_u)+b_τ(u); here b is the unscaled correction, not C³ times the correction.
2. Add the Bernoulli horizontal identity to the raw m≠0 identity. For m=0,n≠0 the cubic kernel is exactly n^(−3).
3. Use absolute convergence to partition the punctured lattice into these disjoint parts. Attach the already planned K₂ class formula only after this analytic theorem; no new construction of S_a is needed.
4. For assembly, use this analytic theorem as the proof supplier for the parent ER.3 torsion expansion and parent ER.4 10.2.1. That fixes the earlier textual proof gap without editing their ids or introducing a back-edge from analysis to K₂ classes.

Direct prerequisites: `EllipticRegulators:ER.4/direct-raw-fourier-identity`, `EllipticRegulators:ER.4/torsion-bernoulli-horizontal-term`, `EllipticRegulators:ER.4/direct-series-convergence`, `EllipticRegulators:ER.3/the-companion-and-Bloch-convention`.

Source locator: Lemma 10.2.3 and end of §10.3, pp.79–80,85.


Acceptance checks:

- The full series includes horizontal n≠0 terms; erasing them loses the Bernoulli correction.
- The accepted class identity has prefactor iy²C³/π with Lecture 10’s C^(−2) transform. The analytic identity has iy²/π.
- Under f=i g with odd g, every side scales by i; taking Im after weighting fails this check.
- It supplies the analytic expansion before the divisor and class regulator results, breaking the earlier circular proof route.

## Pinned library inputs

The baseline is Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174 and Tau Ceti
f790474821cf4256814db967cb154e7af3d0c369. The reviewed ER.4 audit reports the
regulator/divisor/class targets as not built. No such declarations were found
in the pinned Tau Ceti source. These new nodes therefore plan the missing
analytic specializations while importing existing analytic tools. Each of the
following statements was read in its pinned source, rather than inferred from
its name.

| Baseline declaration | Exact role in the proof |
| --- | --- |
| Complex.hasSum_taylorSeries_neg_log | Principal −log(1−z)=Σzⁿ/n for ‖z‖<1. It does not justify the unit-circle endpoint. |
| hasSum_coe_mul_geometric_of_norm_lt_one | Σn rⁿ=r/(1−r)² for ‖r‖<1; already supplies the weighted geometric identity in Bloch’s Lemma 10.3.2. It also bounds n\|q\|ⁿ tails. |
| cot_series_rep | Paired cotangent partial fractions away from the integers; its unprojected series is not treated as an absolute bilateral sum. |
| iteratedDerivWithin_cot_pi_mul_eq_mul_tsum_div_pow | For derivative order k≥1 on the upper half-plane, the kth derivative of π cot(πz) is (−1)ᵏ k! Σ_(n∈ℤ)(z+n)⁻ᵏ⁻¹. Differentiating once gives the csc² sum. |
| Complex.cot_pi_eq_exp_ratio | Supplies the rational expression for cot(πz) in exp(2πiz), hence the constant/cotangent decomposition of the geometric series. |
| hasSum_one_div_nat_pow_mul_sin | The sine/Bernoulli series on [0,1]; k=1 supplies the cubic correction, including the endpoints. |
| Real.summable_one_div_nat_pow | p>1, especially p=2 for Li₂ on the closed disc and for row estimates. |
| Real.summable_one_div_int_pow | p>1, with zero denominator interpreted as zero; p=3 for the horizontal series. |
| EisensteinSeries.summable_one_div_norm_rpow | The lattice norm p-series for real exponent >2; the invertible real-linear map (m,n)↦mτ+n reduces the cubic kernel to exponent 3. |
| Function.Periodic.qParam | The existing exponential parameter supplies q and the torsion lifts. |
| Function.Periodic.norm_qParam | Its norm formula gives \|q\|<1 and distinguishes the unit-circle boundary. |
| ZMod.stdAddChar | The existing exponential character fixes the sign and normalization of the imported torsion adapter. |

The suggested file uses individual Mathlib imports. Its concrete abbreviations
are coordinate expressions for imported objects, not proposed public
definitions: in particular Li₂ is restricted to the disc series needed here.
Curve, divisor and K₂ declarations already supplied by the parent are not
restated with substitute types. Every new definition, API item and unit test
appears in the file; the orbit-splitting API is also the named prerequisite
`dilogarithmic-orbit-splitting`.

## Independent numerical acceptance check

An independent complex-input check uses C=3, τ=0.1+1.1i and
f=(1+2i)(δ_(1,0)−δ_(2,0)). Evaluating the definitions by 25 q-orbit terms gives

| Term | Value, rounded |
| --- | --- |
| L | 0.08636671411332274 + 0.3946267866837335i |
| M | 0.3306956044465817 + 0.6613912088931634i |
| M₁ | 0.5911297420787438 + 1.1822594841574876i |
| M₂ | −0.2604341376321621 − 0.5208682752643242i |
| B | 0 |

For L, summing each n-row with the csc² formula and then m through ±1200
agrees with the direct definition within 2×10⁻³⁴ at 35-digit precision. For M,
the projected cotangent rows have a polynomial m-tail; truncation at ±1200
alone gives error about 1.7×10⁻⁷. Removing that tail analytically gives a more
useful normalization check: compute

\[
 H=C^{-3}\sum_{r=1}^C\sum_{b\bmod C}f(r,b)\psi_1(r/C),
\]

using the trigamma residue sum, then subtract the limiting imaginary
cotangent −(π/C)sign(m) from each row. The remaining cotangent contribution
has exponential decay. H plus this remainder through ±35 agrees with the
direct M within 4×10⁻³⁶; M₁=H+M and M₂=−H agree within 5×10⁻³⁶.
This is an independent diagnostic of signs and factors, not a proof or a
claim of an implemented regulator.

A separate horizontal test, f=δ_(0,1)−δ_(0,2), has
B=8π²iy²/(81√3); at the same y its imaginary part is
0.6809723157426675. The finite Bernoulli calculation agrees within 4×10⁻³⁶.
The first test detects a missing M₂ or moving Im outside the complex weights;
the second detects an erased horizontal row or an incorrect C-power.

## Sources, source issue and remaining boundary

Bloch’s *Higher Regulators, Algebraic K-Theory, and Zeta Functions of Elliptic
Curves*, CRM Monograph Series 11 (AMS, 2000), Lecture 10 §§10.2–10.3,
printed pp.77–85, supplies the calculation locators. The accessible
[the book](https://bookstore.ams.org/crmm-11)
was read on 2026-10-06. The AMS PDF endpoints returned HTTP 403. The text layer
loses overlines, so the barred cubic denominator and the imaginary projection
were independently reconstructed by the displayed algebra and the numerical
checks. Original page images and the parent worker’s private scan were not
available. The packet states this limitation explicitly.

[Brunault’s thesis](https://arxiv.org/pdf/math/0602186v1), §1.2, printed
pp.20–28, was read for the existing regulator conventions and dependency
orientation. Its Theorem 21 derives the torsion expansion from Bloch’s
Theorem 10.2.1. It is a useful comparison, not a premise for this proof.
The fetched version and SHA-256 are recorded in the packet. The two upstream
style references are the Tau Ceti EllipticCurves and ModularForms roadmaps.

Source issue `EllipticRegulators/ER4-E1` concerns the strict unit-disc claim
before (10.3.2) in the accessible digitization. The printed inequality is
“|xqⁿ| < 1 for n ≥ 0”. At ℓ=n=0 its left side is 1; for instance C=3,k=1
has x=exp(2πi/3). The correct inequality is ≤, with this boundary handled
separately as described above. This changes a convergence justification, not
the final formula. The claim is scoped to the public text rather than an
original-page collation. A search of the author’s publications page and for
published Lecture-10 errata on 2026-10-06 found no corresponding correction.
The parent’s capital-C correction `EllipticRegulators/E11` is inherited,
not entered again as a new finding.

The retained geometric gap is precise: for a finite morphism φ:X→Y, the
formula r_Y(N_φξ)(ω)=r_X(ξ)(φ*ω) for **every** ξ∈K₂(ℂ(X)) belongs to
`EllipticRegulators:ER.7/regulator-under-finite-pushforward`. A projection
formula on symbols {F,φ*G} does not establish that those symbols generate
all of K₂(ℂ(X)). The parent’s constant-field trace uses a split field-extension
base-change formula instead and is already supplied. This part records the
geometric gap without asserting that unsupported reduction.

Assembly retains that gap and attaches the new regularized identity as the
analytic supplier of the parent ER.3 torsion expansion and ER.4 final theorem.
There are no new requests to other roadmaps. The three new planets are
**The Bernoulli correction**, **Bloch’s logarithmic sum** and **Bloch’s
dilogarithmic sum**. Together with the parent’s diamond, divisor formula and
final Fourier theorem, they give six planets for ER.4.
