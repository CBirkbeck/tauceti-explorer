# Nahm series, asymptotics and Habiro integrality: HB.5

This is the follow-up plan for **The proved implication in Nahm’s conjecture**,
`HabiroNahmSeries:HB.5`. It builds on the
[accepted parent packet](../packets/HabiroNahmSeries.json), whose endpoint and
foundational nodes retain their IDs. The
[follow-up packet](../packets/HabiroNahmSeries--HB.5.json) adds seven refinements;
it introduces no second Nahm datum, Bloch group, modular-function carrier,
q-Pochhammer symbol or asymptotic-series construction.

The pass is complete and the stage is **planned**. The formerly missing public
Zagier chapter has been read. An elementary majorant supplies the cusp bound for
all root orders and infinity. The rational-data arithmetic argument is stated
over one fixed enlarged number field. Its use of the corrected HB.4
constant-term descent remains conditional on one precise supplier proof
obligation, described below. No statement here claims implementation.

## Targets and ownership

The proved implication concerns the distinguished positive solution, for an
arbitrary finite-index subgroup of SL₂(ℤ). It assumes neither that the subgroup
is congruence nor that every solution of the Nahm equations has zero Bloch class.

| Scoped target | Existing owner and follow-up refinement |
| --- | --- |
| CGZ Theorem 7.5 | `HB.5/modularity-implies-torsion`; the new fixed-extension lift, bounded-power comparison and rational arithmetic bridge give its rational-data interpretation. |
| Introductory vanishing in B(ℚ̄) | `HB.5/introductory-formulation`, consuming the same bridge and its uniquely divisible target. |
| Transformations, cusp widths and finite Laurent principal parts | `HB.5a/supplier-interface` and `HB.5/nahm-sum-meromorphic-at-every-cusp`. |
| Nonzero algebraic leading constant at q=1 | `HB.5/expansion-at-one`; Zagier (28), printed p. 46, and (29), printed p. 48, are now obtained. |
| Comparison at good primitive roots | `HB.5/comparison-of-expansions`; refined by the actual multiplier and the retained qᶜ factor. |
| Divisibility for unbounded orders | `HB.5/torsion-from-unbounded-orders` and `HB.5/torsion-criterion-for-the-cgz-bloch-group`. |
| Exceptional primes and unbounded good denominators | `HB.5/excluded-primes-and-hypotheses` and `HabiroNumberFields:HB.1/the-excluded-primes`, applied to the enlarged field E. |
| GZ Proposition 7.1, including infinity | The parent restricted `HB.5/valuation-bound-at-every-cusp`, completed by the new block estimate, residue majorant and every-order growth bound. |
| Conjectural boundary and weight-zero scope | `HB.5/nahm-conjecture-statement` and `HB.5/boundaries-of-the-implication`. |

In this table and below, `HB.k/…` abbreviates `HabiroNahmSeries:HB.k/…`.
The packet’s `targetCoverage` gives the full IDs. The printed stronger-converse
example with matrix (8,5;5,4) reports a computer search in Zagier’s survey.
Obtaining that passage does not certify nonmodularity for every rational B,C;
this pass imports no such exhaustive counterexample test.

## Conventions and baseline

Let r≥0, A∈Mᵣ(ℚ) be symmetric positive definite, B∈ℚʳ and C∈ℚ. Write

\[
 Q(n)=\tfrac12 n^tAn+B^tn+C,\qquad
 P(q,N)=\prod_{j=1}^{N}(1-q^j).
\]

The Nahm function is the parent holomorphic series

\[
 f_{A,B,C}(\tau)=
 \sum_{n\in\mathbb N^r}
 \frac{\exp(2\pi i\tau Q(n))}{\prod_iP(e^{2\pi i\tau},n_i)}.
\]

Rational powers always mean the displayed exponential on the upper half-plane.
The finite product P is the specialization (q;q)ₙ of
`QSeriesPartitionsAndMockModularForms:QM.0/q-pochhammer`. The empty-rank sum is
exp(2πiCτ); it retains C.

Let X∈(0,1)ʳ be the parent distinguished solution, F=ℚ(X₁,…,Xᵣ), and

\[
 \Lambda=\sum_iL_{\rm CGZ}(X_i),\qquad
 L_{\rm CGZ}(x)=\frac{\pi^2}{6}-\operatorname{Li}_2(x)
                -\frac12\log x\log(1-x).
\]

Thus Λ≥0, strictly positive for r>0, and
**C₀(A)=−Λ/(4π²)**. GZ’s L is the negative of this complementary Rogers
normalization. Their printed minus sign in (50) is not used.

The pinned baseline is Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`
and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`.
The reviewed AUDIT-14 records HB.5 as not built. Searches at those commits did
not find the scoped Nahm/Bloch endpoint or the new majorant. Eight actual
Mathlib declarations are reused and checked against the pinned declaration
index: matrix positivity, finite product recursion, division with remainder,
absolute-sum bounds, the mean-value estimate, geometric summation, root
factorization, and extension of algebraic embeddings. The packet lists their
modules and exact uses. The suggested file imports individual Mathlib modules;
it does not import a newer Tau Ceti implementation.

## The residue-class majorant

**`HB.5/residue-class-majorant` — construction.** For m≥1 and t>0 define

\[
 M_{A,B,C;m}(t)=\sum_{n\in\mathbb N^r}
 \frac{e^{-tQ(n)}}{\prod_i P(e^{-m^2t},\lfloor n_i/m\rfloor)}.
\]

Coordinatewise division with remainder gives n=mℓ+s, with 0≤sᵢ<m, and symmetry
of A gives the exact identity

\[
 Q(m\ell+s)=m^2\left(\tfrac12\ell^tA\ell+
                 \left(\frac{As+B}{m}\right)^t\ell\right)+Q(s).
\]

Consequently

\[
 M_{A,B,C;m}(t)=\sum_{s\in\{0,\ldots,m-1\}^r}e^{-tQ(s)}
 f_{A,(As+B)/m,0}\left(\frac{i m^2t}{2\pi}\right).
\]

This equality proves summability and strict positivity from the parent analytic
Nahm-sum API. Its use is to keep A, hence Λ, fixed while discarding the original
phases. It also pins the square m², the residue shifts and the constant factors.
The total prototype uses Mathlib’s real infinite sum outside t>0; no convergence
or analytic property is claimed there.

The proposed home is `TauCeti/NumberTheory/Nahm/CuspBounds`, namespace
`TauCeti.Nahm.HB5`. Its API is derived from the every-order bound and its cusp
consumer:

| Declaration | Export |
| --- | --- |
| `residueMajorant_eq_tsum` | The defining block-denominator series, including empty products. |
| `residueMajorant_summable` | Summability of that real summand for positive definite A and t>0. |
| `residueMajorant_pos` | M>0 on that domain. |
| `residueMajorant_quadratic_split` | The displayed exact quadratic identity, requiring symmetry of A. |
| `residueMajorant_split` | Equality with the finite sum of shifted positive Nahm functions. |
| `residueMajorant_order_one` | M at m=1 equals the original imaginary-axis Nahm function. |
| `residueMajorant_rank_zero` | M=exp(−Ct) in rank zero. |
| `residueMajorant_shift_constant` | Replacing C by C+u multiplies M by exp(−ut). |

All four unit tests occur as examples in the suggested file:

| Test | Required value or comparison |
| --- | --- |
| `majorant_rank_one_even_order` | A=(2), B=(1), C=11/60, m=2 gives e⁻¹¹ᵗ⁄⁶⁰∑ℓ e⁻⁴ᵗ⁽ℓ²⁺ℓ⁄²⁾/P(e⁻⁴ᵗ,ℓ) + e⁻¹³¹ᵗ⁄⁶⁰∑ℓ e⁻⁴ᵗ⁽ℓ²⁺³ℓ⁄²⁾/P(e⁻⁴ᵗ,ℓ). |
| `majorant_empty_rank` | Rank zero, C=7, m=2, t=log 2 gives 1/128. |
| `majorant_original_axis` | A=(2), B=(1), C=11/60, m=1 gives ∑ₙ exp[−t(n²+n+11/60)]/P(e⁻ᵗ,n). |
| `majorant_constant_shift` | For A=(2), B=(1), m=2, changing C from 11/60 to 71/60 multiplies M by exp(−t). |

## Every root order and every cusp

**`HB.5/block-product-lower-bound` — theorem.** For each m≥1 there is cₘ>0,
uniform in primitive ζ, N≥0 and 0<t≤1, such that

\[
 |P(\zeta e^{-t},N)|\ \geq\ c_mP(e^{-m^2t},\lfloor N/m\rfloor).
\]

Write N=mL+s. In the block mk+j, compare the actual radius e⁻ᵗ⁽ᵐᵏ⁺ʲ⁾ with
ρₖ=e⁻ᵗᵐ⁽ᵏ⁺¹⁾. At j=m the factors agree. For j<m, ζʲ≠1, so
log|1−ζʲu| has bounded derivative on [0,1]. The total logarithmic discrepancy
is bounded by a constant times

\[
 t\sum_{k\geq0}e^{-mkt}=\frac{t}{1-e^{-mt}}
 \leq\frac1{1-e^{-m}}\quad(0<t\leq1).
\]

The reference block product is 1−ρₖᵐ, by factorization of Xᵐ−1. Incomplete
blocks have only nontrivial phases and a fixed positive lower bound. Exponentiate
and minimize over the finitely many primitive roots. This pays one bounded total
loss, rather than a loss per block. For m=1 equality holds; for m=2 pair
(1+e⁻⁽²ᵏ⁺¹⁾ᵗ)(1−e⁻⁽²ᵏ⁺²⁾ᵗ)≥1−e⁻⁽⁴ᵏ⁺⁴⁾ᵗ, so c₁=c₂=1.

This is a new elementary adaptation of GZ’s residue grouping, whose proof is
included here. It does not claim that the full asymptotic-series theorem holds
at even or bad denominator orders.

**`HB.5/growth-at-all-roots-of-unity` — theorem.** For reduced a/m and t>0,
the triangle inequality, the block bound and summability give

\[
 |f_{A,B,C}(a/m+it/(2\pi))|\leq c_m^{-r}M_{A,B,C;m}(t)
 \quad(0<t\leq1).
\]

For each residue s the parent q=1 expansion has the positive constant

\[
 K_{A,B_s}=\det(\widetilde A)^{-1/2}
          \prod_iX_i^{(B_s)_i}(1-X_i)^{-1/2},\qquad B_s=(As+B)/m.
\]

All shifted data have the same Λ. The finite splitting therefore gives

\[
 M_{A,B,C;m}(t)=e^{\Lambda/(m^2t)}
           \left(\sum_s K_{A,B_s}+O(t)\right).
\]

This proves an O(exp(Λ/(m²t))) upper bound at every order. Cancellation or
identical vanishing of the original formal root expansion causes no problem.
For A=(2), Λ=π²/15; at a primitive second root the bound is O(exp(π²/(60t))).

**`HB.5/unrestricted-cusp-valuation-bound` — theorem.** Suppose f is invariant
under an arbitrary finite-index Γ≤SL₂(ℤ). First consume the parent
`nahm-sum-meromorphic-at-every-cusp`: positivity gives a uniform bound by the
imaginary-axis series, which makes every cusp singularity a pole or removable.
Invariance alone would not give a finite principal part.

Normalize vₚ by the least exponent in e(τ) in f∘γ, γ∞=P. If the width is w and
the least local integer exponent is k, then vₚ=k/w. For P=a/c in lowest terms,
c>0, the inverse transform of a/c+it/(2π) has imaginary part 2π/(c²t). Its
nonzero leading Laurent coefficient gives

\[
 \log|f(a/c+it/(2\pi))|=-\frac{4\pi^2v_P}{c^2t}+O(1).
\]

Compare the every-order upper bound to obtain **vₚ≥−Λ/(4π²)**, with equality
at zero from the positive q=1 constant. A nontrivial lower-unipotent power in Γ
moves infinity to a finite cusp; invariance gives the infinity case too.

Coercivity makes min Q(n) exist. The denominator expansions have nonnegative
coefficients and leading coefficient one, so minimal terms cannot cancel:

\[
 v_\infty=\min_{n\in\mathbb N^r}Q(n)\geq C_0(A).
\]

Since min Q≤Q(0)=C, this also gives C≥C₀(A). The additional condition Q(n)≥C
is needed only for v∞=C. As a convention check, A=(2), B=−3, C=5 has infinity
valuation 3, attained twice, and leading coefficient 2; it is not an assertion
of modularity. The Rogers–Ramanujan datum (2,0,−1/60) fixes C₀=−1/60.

## The fixed-field arithmetic bridge

**`HB.5/fixed-extension-constant-term-lift` — comparison.** Choose D clearing
A,B and satisfying the strong-denominator condition for the quadratic form.
Use the fixed field from the corrected HB.4 statement,

\[
 E=F(X_1^{1/D},\ldots,X_r^{1/D},\zeta_D),\qquad
 M_E=6|\operatorname{disc}(E)|\,|K_2(\mathcal O_E)|.
\]

With Yᵢ=Xᵢ¹⁄ᴰ, Xᵢ=Yᵢᴰ and 1−Xᵢ=∏ⱼYⱼᴰᴬⁱʲ. Thus symmetry cancels
∑ᵢXᵢ∧(1−Xᵢ)=D∑ᵢⱼ(DAᵢⱼ)Yᵢ∧Yⱼ, making
**ηᴱ=∑ᵢ[Xᵢ] an integral element of B_CGZ(E)**.

For n prime to 6DMᴱ, let u=Φζ(0)≠0. The corrected HB.4 supplier states
uⁿ∈Eₙ, the inverse Pζ class in the Kummer extension, and the χ⁻¹ eigenspace
condition. At n prime to 6, Dζ(1) is an n-th power by CGZ Lemma 2.4(b) and
(23). The unique lift in `HabiroNumberFields:HB.2/the-map-R-zeta` therefore
identifies

\[
 [u^n]=R_\zeta(\eta_E)^{-1}\quad\text{in }E_n^\times/(E_n^\times)^n.
\]

Only this constant-term identity is consumed. The parent unit corollary’s
integer-valued-Q restriction is not applied to general rational data.

**`HB.5/bounded-powers-with-the-actual-multiplier` — comparison.** Modularity
and the finite principal part at zero give λ=Λ/(4π²)∈ℚ and a uniform complex
expansion. For γ=(a b;c d)∈Γ, d>0 a good order, use
ε=dh/(1−ich/(2π)). Then

\[
 \gamma(i\varepsilon/(2\pi))=(b+ih/(2\pi))/d,\quad
 1/\varepsilon=1/(dh)-ic/(2\pi d).
\]

Comparing the q=1 expansion with the corrected root expansion gives

\[
 u=\mu_b^{-1}\omega_d^{-1}e(-Cb/d)e(-\lambda c/d)K\ne0,
\]

where μ_b=e(r s(b,d)/2), ω_d=d⁻ʳ⁄²det(Ã)⁻¹⁄²∏ᵢ(1−Xᵢ)¹⁄², and K is the
q=1 constant. The negative phase, ω and qᶜ are all retained. The Gauss factor
stays inside Φ; it is not absorbed into a universally fixed μ.

Choose s divisible by 24, 2den(B), den(C) and den(λ). The formulas give
K²ᵈᵉⁿ⁽ᴮ⁾∈F and ω_d²∈F. Expanding the rational definition of the Dedekind sum
and using the sums of integers and squares shows 12d s(b,d)∈ℤ. Hence
μ_b²⁴∈ℚ(ζ_d), and both remaining phases to the s-th power lie there as well.
Thus **uˢ∈F_d×⊂E_d× with s independent of d**. For (2,0,−1/60), s=120 works.

**`HB.5/rational-bloch-arithmetic-bridge` — theorem.** Suppose this fixed-power
property holds for an unbounded set of orders prime to 6DMᴱ. The Kummer
identity gives Rζ(sηᴱ)=1; good-order injectivity over E gives sηᴱ∈nB_CGZ(E).
Apply the parent torsion criterion through Suslin’s Bloch group and finitely
generated K₃(E)ᶦⁿᵈ, allowing the comparison’s 2-primary kernel and cokernel.
This does not assume that the CGZ convention itself is finitely generated.

For rational A the original class is

\[
 \xi_F=[\delta\textstyle\sum_i[X_i]]\otimes(1/\delta)
             \in B_{\rm CGZ}(F)\otimes\mathbb Q.
\]

It is not reduced modulo n. Every embedding F→ℂ extends to E→ℂ by the pinned
algebraic embedding-extension theorem. Torsion of ηᴱ makes the Bloch–Wigner
regulator vanish at every extended embedding. The parent regulator criterion
therefore gives **ξ_F=0**. When A is integral, the integral original class is
torsion; its image in B(ℚ̄) is zero by the parent introductory formulation.

For the modular application intersect Γ with Γ(6DMᴱ). Positive powers Uᵘ,Tᵛ
of the lower and upper unipotents belong to this intersection. The matrices
UᵘTᵏᵛ have d=1+ukv≡1 modulo 6DMᴱ, b=kv and gcd(b,d)=1. They provide
unbounded positive good orders for the actual-multiplier comparison. The field
and excluded integer are fixed throughout.

## Supplier obligation and acceptance

One gap remains: the parent HB.4 root-change bookkeeping is not written out,
and conjugating its formula from ζ to ζᶜ alone does not prove the χ⁻¹ power
law for its Kummer class. The request to **HabiroNahmSeries:HB.4** asks for the
three constant-term statements over fixed E: membership uⁿ∈Eₙ, the inverse Pζ
class and the eigenspace condition, with rational B and the Gauss factor retained.
The new arithmetic comparisons and bridge are conditional on these imported
statements. The every-order majorant and cusp bound do not use this gap.

Acceptance requires the four majorant tests, the uniform block estimate with a
bounded total loss, the even-order and infinity cases, the negative Rogers sign,
and the exact normalization v=k/w. The arithmetic branch must reduce the
integral ηᴱ rather than ξ_F, use Mᴱ rather than M_F, retain all four factors in
the comparison, and use a fixed s and an unbounded set of orders. No converse or
all-solution conclusion is an acceptance criterion.

The new planets are **Radial asymptotics of Nahm sums** and **Cusp valuation
bound**. Together with the parent’s **Nahm’s conjecture** and **Modularity
implies Bloch torsion**, HB.5 has four planets; the auxiliary majorant and
arithmetic bookkeeping are not additional planets. No restructuring is proposed.

## Sources and prototype

Read on 6 October 2026:

- [Calegari–Garoufalidis–Zagier, arXiv v3](https://arxiv.org/pdf/1712.04887v3),
  §1.1, §2.2–2.3 and §7.1/7.3. The publisher publicly serves a sample and offers
  purchase; published Section 7 was not obtained. CGZ findings remain scoped to
  this preprint.
- [Garoufalidis–Zagier, published version](https://people.mpim-bonn.mpg.de/stavros/publications/printed/asymptotics_of_nahm_sums_at_roots_of_unity.pdf),
  §§2–4 and 7. Theorem 3.1 remains restricted to odd coprime orders; (50) has the
  sign error, and Proposition 7.1 on p. 234 retains the restricted-proof gap.
- [Zagier, The dilogarithm function](https://people.mpim-bonn.mpg.de/zagier/files/doi/10.1007/978-3-540-30308-4_1/fulltext.pdf),
  II.3B, pp. 44–48, and II.3C, pp. 51–57. The exact constant is (29) on printed
  p. 48; CGZ’s p. 56 reference points to the asymptotic discussion.

The packet retains the parent’s seven canonical findings E14 and E19–E24,
with their independent review and the additional GZ version-of-record collation;
it does not create duplicate errata IDs. File hashes and exact versions are in
the packet. The newly obtained survey does not change the modular justification
needed for a complex ε.

The [suggested file](../suggested/HabiroNahmSeries--HB.5.lean) gives the majorant,
all eight API signatures, all four test examples, and the finite-product and
literal-series bounds against existing Mathlib objects. Signatures requiring the
absent Bloch, Rogers or cusp-expansion carriers are identified precisely in
comments, with no substitute proposition. It elaborated with `lean-check` at
the pinned Mathlib, with only the intended incomplete-proof warnings.
