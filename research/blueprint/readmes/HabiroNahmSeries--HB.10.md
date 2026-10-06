# HB.10 — Explicit examples and boundaries

This is the HB.10 part of **Nahm series, asymptotics and Habiro integrality**. It builds on the accepted parent packet [HabiroNahmSeries.json](../packets/HabiroNahmSeries.json). The parent supplies the Nahm datum, distinguished solution, Bloch class, formal Gaussian integration, general membership theorem, residue descendants and the principal examples. This part supplies concrete interfaces and exact algebraic certificates, applies the coefficient-ring cohomology comparison, and specifies the inputs still required for stronger membership and geometric conclusions. All declarations remain plans with implementation status `unchecked`.

There are four different mathematical outputs. A solution vector is algebraic data. A Frobenius-glued Taylor family can be an element of a Habiro ring. A perturbative series can instead belong to a K₃-indexed coefficient line. A geometric cohomology class needs a scheme and a comparison with its cohomology. The statements below give the map and hypotheses for each passage. They do not identify these outputs merely because they have similar Taylor expansions.

The scope is exactly `HabiroNahmSeries:HB.10`. Its coverage is **planned**, with five precise gaps and three supplier requests. Every target is addressed by a new node, an imported parent node, or a named obligation. In particular, the rational example, nonabelian example, rank-one products, knot-derived data, descendants and export interfaces all have an explicit place in the plan. The stage is not closed.

## Sources, baseline and conventions

The main source is Garoufalidis–Scholze–Wheeler–Zagier, [*The Habiro ring of a number field*, arXiv:2412.04241v2](https://arxiv.org/pdf/2412.04241v2), dated 27 August 2025. The target-relevant passages read are §§1.4–1.9, §3.3, §§4.1–4.3 and §4.7. The parent nodes import the general asymptotic, integrality and q-difference machinery; it is not developed a second time here.

Two additional sources are Ferdinand Wagner's [*q-Hodge filtrations, Habiro cohomology, and ku*](https://ferdinand-wagner.github.io/papers/q-Thesis.pdf), the public 230-page thesis, and his [*q-Hodge complexes over the Habiro ring*](https://ferdinand-wagner.github.io/papers/q-Habiro.pdf), author copy dated 14 January 2026. The thesis's Part I §2 and §3.2 were read in full, including the relative number-field comparison and the étale Habiro–Hodge identification. Its §9.3 was screened for an explicit Nahm application. No matching proof for the full family of shifted residue descendants was identified. Thus the old unread-thesis gap has been resolved as a source-reading task, but it does not supply an all-prime descendant theorem. The January paper's Lemma 2.12, Corollary 2.13 and Corollary 3.13 corroborate the comparison used here.

Garoufalidis–Wheeler, [*Explicit classes in Habiro cohomology*, arXiv:2505.19885v1](https://arxiv.org/pdf/2505.19885v1), dated 26 May 2025, supplies Proposition 1.14, the all-prime symmetrisation statement Theorem 1.13, and the separate naive geometric construction. §§1.1–1.3, §§1.5–1.6 and §§3.1–3.3 were read. An error in its auxiliary equation (182) is exhibited below and recorded as `HabiroNahmSeries/E64`. The author's [copy](https://people.mpim-bonn.mpg.de/stavros/publications/explicit-habiro-cohomology.pdf) retains the formula. Searches of the arXiv history and the authors' publication pages found no correction on 6 October 2026. The packet records hashes and versions, so the finding is tied to particular source texts. It also records the harmless §3.1 cross-reference to Theorem 1.13 in the proof of Theorem 1.11 as E65; the symmetrisation theorem has its own proof in §3.2.

The baseline is Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. The actual statements of all twelve baseline references were read at these commits. Mathlib supplies `PowerSeries.C`, `PowerSeries.coeff`, `PowerSeries.coeff_C`, `PowerSeries.map`, `PowerSeries.coeff_map`, `PowerSeries.ext`, `IsPrimitiveRoot`, `Matrix.det_fin_two`, `Algebra.discr_of_matrix_vecMul`, `RingEquiv.trans` and `RingEquiv.trans_apply`. Tau Ceti supplies `NumberField.discr_eq_of_integralBasis`. Neither list claims that the specialized examples or the Habiro comparison carriers are implemented. The reviewed HB.10 library audit marks the stage's targets as unbuilt.

For a number field K, a positive integer Δ divisible by its discriminant specifies R=O_K[1/Δ]. We use the GSWZ ring H_R and the relative ring H_{R/ℤ} with their owners' full cyclotomic coefficient algebras. At a prime p the coefficient ring is the product algebra obtained by p-completing R and adjoining the root, not one arbitrarily selected local field. The correction to Wagner's irreducibility assertion is imported as `HabiroRings/E5`; its index conventions are imported as `HabiroRings/E4`. Frobenius acts on the p-completed arithmetic coefficients. Taylor re-expansion changes x=q−ζ_m to the compatible root of order pm. Inverting p makes this completion zero, so its gluing condition becomes vacuous.

Finite Gaussian binomials are the polynomial convention of `QSeriesPartitionsAndMockModularForms:QM.0/q-binomial-coefficient`; the finite q-binomial theorem is imported from `QM.0/q-binomial-theorem`. Infinite products and their formal interpretation are supplied by the parent `rank-one-product-identities`. In particular F₀=(t;q)_∞⁻¹ and F₁=(qt;q)_∞. We keep the parent's GSWZ convention

\[
F_3(t,q)=\sum_{n\geq0}\frac{(-1)^n q^{3n(n+1)/2}t^n}{(q;q)_n}.
\]

A formal power series in t is not evaluated at t=1 by summing its coefficients. The specializations below use the algebraic expressions for its cyclotomic Taylor coefficients and a selected root of the specialized Nahm equation.

## The rational quadratic-Gauss family

The new definition `rational-gauss-taylor` is a family indexed by **positive** integers. Define the integer

\[
a_m=\begin{cases}2&4\mid m,\\0&2\mid m\text{ and }4\nmid m,\\1&2\nmid m,\end{cases}
\qquad
\operatorname{rationalGaussTaylor}(m)=C(a_m)\in\mathbb Z[[x]].
\]

Here C is Mathlib's constant-series ring homomorphism. At a primitive m-th complex root ζ, the defining number agrees with

\[
\frac1m\left(\sum_{k=0}^{m-1}\zeta^{k^2}\right)
           \left(\sum_{k=0}^{m-1}\zeta^{-k^2}\right).
\]

The two sums must both be present. A single quadratic Gauss sum need not be rational. To evaluate their product, write k=j+d. Summing over j annihilates every d except those with m dividing 2d. For odd m only d=0 remains, giving 1 after normalization. For even m the two contributions are 1 and ζ^{(m/2)²}; this second value is −1 when m≡2 modulo 4 and 1 when 4 divides m. This proves the displayed cases for every primitive root, without choosing a particular exponential representative.

The proposed namespace is `HabiroNahmExamples`, with module `TauCeti/NumberTheory/Habiro/Nahm/Examples/Gauss`. The API is determined by its use in GSWZ Example 4.4 and in the degree-zero export:

| Declaration | Statement |
| --- | --- |
| `rationalGaussTaylor_eq` | The series is C(2), C(0) or C(1) in the three divisibility cases. |
| `rationalGaussTaylor_coeff_zero` | Its constant coefficient is a_m. |
| `rationalGaussTaylor_coeff_succ` | Every coefficient of degree n+1 is zero. |
| `rationalGaussTaylor_map` | Coefficientwise mapping along ℤ→R, for every commutative ring R, gives C((a_m)_R). |
| `rationalGaussTaylor_gauss_product` | Its image in ℂ[[x]] equals the constant series of the normalized product above, for every primitive root. |

Five named tests distinguish the construction from plausible wrong definitions. `rationalGaussTaylor_one`, `rationalGaussTaylor_two` and `rationalGaussTaylor_four` require the values C(1), C(0) and C(2). `rationalGaussTaylor_positive_degree` requires the degree-one coefficient at order four to vanish; order zero is excluded from the domain. `rationalGaussTaylor_complex_four` computes the sums at ζ=i as 2+2i and 2−2i, whose product divided by four is 2. Together these tests exclude a parity indicator, a uniformly nonzero even case, and a family with spurious Taylor terms.

The theorem `rational-gauss-gluing` states that for every odd prime p and every positive m,

\[
\operatorname{rationalGaussTaylor}(pm)=\operatorname{rationalGaussTaylor}(m).
\]

Multiplication by an odd integer preserves the relevant divisibility cases. Frobenius fixes the integer constants, and re-expansion does not alter a constant series. Over ℤ[1/2] these equations prove membership in H_{ℤ[1/2]}; the 2-completion is zero. Over ℤ the family fails: the p=2, m=1 equation would identify 1 with 0 in ℤ₂[[x]]. This is a global gluing obstruction even though every component has integral coefficients. Acceptance includes p=3 with m=2 and m=4, retaining 0 and 2, and this explicit failed edge over ℤ.

This is the literal rational coefficient-ring example. The parent `figure-eight-example` is an abelian Nahm example over ℚ(√−3), while the Rogers–Ramanujan example in `modularity-examples-and-their-lesson` is over an abelian quadratic field. Neither the cubic nor the quartic field below is ℚ. Parent restructuring R1 is retained; no rational Nahm solution is claimed.

## The nonabelian quartic solution and its integral basis

Import `HabiroNahmSeries:HB.10/nonabelian-quartic-example`, which separates two Galois orbits of solutions for A=((8,5),(5,4)). This part selects the D₄ orbit, with field F=ℚ(u), signature (2,1), degree four and field discriminant −475. The other orbit has a different quartic polynomial, discriminant 229 and Galois group S₄. Its non-torsion behavior cannot be transferred to the selected field.

The new definition `quartic-coordinate-vector` takes a characteristic-zero field K and a specified u satisfying

\[
u^4+u^3+3u^2-3u-1=0.
\]

It returns the vector in K² with coordinates

\[
z_0=u,\qquad z_1=v=\frac{-9u^3-6u^2-25u+37}{5}.
\]

The root equation is an explicit argument in the suggested signature. This is an algebraic coordinate construction; the parent's distinguished real embedding supplies the intended numerical solution. The proposed namespace is `HabiroNahmExamples`, with module `TauCeti/NumberTheory/Habiro/Nahm/Examples/Quartic`.

| Declaration | Statement |
| --- | --- |
| `quarticCoordinates_zero` | The first coordinate is u. |
| `quarticCoordinates_one` | The second coordinate is the displayed expression including its denominator 5. |
| `quarticCoordinates_ext` | Coordinate vectors of two admitted roots are equal exactly when the roots are equal. |
| `quarticCoordinates_map` | Pointwise mapping by a field homomorphism agrees with the coordinate vector of the image root. |

These four API items supply the projections, equality test and coefficient-field changes used in the Bloch symbol, discriminant and membership application. The image-root equation follows by applying the field homomorphism to the original equation; the prototype makes that proof argument visible.

The four tests are `quarticCoordinates_first_equation`, requiring 1−z₀=z₀⁸z₁⁵; `quarticCoordinates_second_equation`, requiring 1−z₁=z₀⁵z₁⁴; `quarticCoordinates_missing_five`, requiring v to differ from the undivided numerator; and `quarticCoordinates_zero_not_root`, requiring the quartic at zero over ℚ to equal −1 and hence fail the admission condition. The omitted denominator test works because the numerator equals 5v and v is nonzero in characteristic zero.

The theorem `quartic-coordinate-certificate` proves these equations and the nonzero conditions u,v,1−u,1−v. Put

\[
\delta=\frac{753-505u-124u^2-186u^3}{5}.
\]

It has the explicit inverse

\[
\delta^{-1}=\frac{18+45u-44u^2+9u^3}{475}.
\]

The GSWZ Hessian convention is checked by the identity

\[
(1-u)(1-v)\left(\left(8+\frac{u}{1-u}\right)
                     \left(4+\frac{v}{1-v}\right)-25\right)
=\delta u^8v^4.
\]

This includes the factor u⁻⁸v⁻⁴ in GSWZ (36). The bare determinant of A is 7 and is not this discriminant. Each equation is certified by exact reduction modulo the quartic. The polynomial excludes u=0 and u=1; the Nahm equations then exclude v=0 and v=1. Multiplying the two displayed expressions for δ and δ⁻¹ and reducing gives 1, so no decimal recognition is needed for nondegeneracy.

The theorem `quartic-integral-basis` refines the coefficient ring. Define

\[
e=\frac{u^3-u^2+2}{5},\qquad\mathcal B=(1,u,u^2,e).
\]

Then e²−3e+1=0, so e is integral, and v=−9e−3u²−5u+11 is integral. The multiplication table is determined by

\[
\begin{aligned}
u^3&=-2+u^2+5e,&ue&=1+u-u^2-2e,\\
u^4&=3+3u-4u^2-5e,&u^2e&=-u+2u^2-e,\\
e^2&=-1+3e.
\end{aligned}
\]

Thus the ℤ-lattice generated by the four vectors is a full integral order. Its trace Gram matrix is

\[
\begin{pmatrix}
4&-1&-5&6\\
-1&-5&17&-4\\
-5&17&-1&-15\\
6&-4&-15&14
\end{pmatrix},\qquad\det=-475.
\]

To prove maximality, compare with an existing integral basis of O_F. The vectors are integral, so their transition matrix has integral entries. Mathlib's determinant-square formula and Tau Ceti's integral-basis discriminant equality give determinant square 1. The transition matrix is therefore invertible over ℤ, proving that \(\mathcal B\) is an integral basis. Integrality by itself would not prove this conclusion. The change from the power basis has determinant 1/5, explaining [O_F:ℤ[u]]=5 and the polynomial discriminant −11875=25(−475). This separates the two numbers confused in the parent source issue E50.

Determinants of multiplication give

\[
N(u)=-1,\quad N(v)=1,\quad N(1-u)=1,\quad N(1-v)=-1,
\quad N(\delta)=9025=5^2\cdot19^2.
\]

The four Nahm factors are units of O_F. The explicit δ inverse proves it is a unit after 5 and 19 are inverted. Acceptance requires the full integral basis, the trace matrix, the inverse identity, and all five norms. Exact rational polynomial-quotient calculations verify these certificates independently of the source's numerical asymptotics.

## The cubic symmetrisation and the missing small primes

Import the parent `cubic-example`, with K=ℚ(z), z³−z+1=0, field discriminant −23, and

\[
\delta=-z^2-z-2,\qquad
\delta^{-1}=\frac{2z^2+3z-9}{23},\qquad z^{-1}=1-z^2.
\]

The polynomial and field discriminants are both −23, so (1,z,z²) is an integral basis and the displayed ring R=ℤ[z,1/23] is O_K[1/23]. The cubic is a separate number-field example, not the rational example and not the nonabelian quartic. The parent `symmetrisation-and-residue-formula` and `descendant-elements-of-the-habiro-ring` supply the residue construction and its two independent shifts μ and ν.

The theorem `cubic-laurent-symmetrisation` specializes Garoufalidis–Wheeler Proposition 1.14 to A=(3):

\[
F_3(t,q)F_3(t,q^{-1})=
\sum_{k\geq0}q^{-k(k+1)}{3k+2\brack k}_q\,t^k
\quad\text{in }\mathbb Q(q)[[t]].
\]

Every coefficient is in ℤ[q,q⁻¹]. In particular the coefficient of t is q⁻²+q⁻¹+1+q+q². The proof expands the convolution, rewrites (q⁻¹;q⁻¹)_ℓ as (−1)^ℓq^{-ℓ(ℓ+1)/2}(q;q)_ℓ, and applies the finite q-binomial theorem owned by QM.0. The signs cancel in this scalar case. The finite polynomial statement makes evaluation at a root of unity legitimate for every individual t-coefficient; it does not define an infinite sum at t=1.

The theorem `cubic-root-constant` supplies a correction needed in the claimed all-prime proof. Introduce the formal solution z(t)=1+t z(t)³, z(0)=1, and

\[
\delta(t)=z(t)^{-3}(3-2z(t)).
\]

Write T²=t. At q=−1, the constant cyclotomic Taylor term of the symmetrisation is

\[
\frac{z(t)^{-1}+T}{\delta(t)}
=1+T+4T^2+5T^3+21T^4+28T^5+\cdots.
\]

For even and odd indices k=2h and k=2h+1, q-Lucas gives respectively

\[
{6h+2\brack2h}_{-1}=\binom{3h+1}{h},\qquad
{6h+5\brack2h+1}_{-1}=\binom{3h+2}{h}.
\]

The ordinary generating-function identities are

\[
\sum_{h\geq0}\binom{3h+a}{h}t^h
=\frac{z(t)^{a+1}}{3-2z(t)},\qquad a=0,1,2.
\]

They follow from Lagrange inversion for z=1+t z³, or by differentiating the standard powers-of-z coefficient formula. The cases a=1,2 give exactly the even and odd pieces above. After **algebraic** specialization t=1, the order-two constant is (z⁻¹+1)/δ in the selected cubic field. It is not inferred by convergence of the displayed T-series at T=1.

The general scalar root constant has a finite expression. For 0≤ℓ<m set

\[
a_\ell=\left\lfloor\frac{3\ell+2}{m}\right\rfloor,
\qquad b_\ell=(3\ell+2)\bmod m,
\qquad T^m=t.
\]

Then a_ℓ is one of 0,1,2, and the constant at a primitive m-th root ζ_m is

\[
\delta(t)^{-1}\sum_{\ell=0}^{m-1}
 z(t)^{a_\ell-2}\zeta_m^{-\ell(\ell+1)}
 {b_\ell\brack\ell}_{\zeta_m}T^\ell.
\]

Indeed, for k=mh+ℓ, q-Lucas reduces the Gaussian polynomial to \(\binom{3h+a_\ell}{h}{b_\ell\brack\ell}_{\zeta_m}\). The q-power depends only on ℓ at ζ_m. Sum each ordinary-binomial profile by the preceding identities, keeping the factor z^{a_ℓ−2}. QM.0 is requested to supply this q-Lucas interface and the cyclotomic Taylor-jet expansion; HB.10 does not introduce its own Gaussian-polynomial definition.

Equation (182) in *Explicit classes in Habiro cohomology* omits these algebraic factors. For A=3 and m=2 it gives (1+T)/δ(T²). This is false: Proposition 1.14 itself gives T² coefficient \({8\brack2}_{-1}=4\), while δ(T²)⁻¹ starts 1+5T²+28T⁴ and the printed expression therefore gives 5. This is an exact counterexample to an auxiliary formula in the proof, recorded as E64. It does **not** disprove Theorem 1.13, and this packet asserts no general corrected formula for matrices of arbitrary rank. The scalar correction has been checked against thirty Gaussian specializations and ten coefficients of each of the three ordinary-binomial generating functions, using exact arithmetic.

The application `cubic-small-prime-criterion` states the remaining membership task precisely. Let R=ℤ[z,1/23]. For every pair of independent shifts (μ,ν), the residue collection Ψ belongs to H_R if both of these inputs are supplied:

1. Every coefficient of every m-th Taylor component belongs to R[ζ_m].
2. For p=2 and p=3, every m-th component satisfies the GSWZ Frobenius re-expansion equation in the full p-completed algebra R̂_p[ζ_{pm}][[x]].

The parent theorem supplies the equations at all primes outside {2,3,23} over R[1/6], and the completion at 23 is zero. Coefficients integral at both 2 and 3 remove the residual factors of 6 from that localization. Together the two displayed inputs give exactly the definition of H_R. This is a conditional criterion, not a proof that the two inputs hold.

For μ=ν=0, the m=1 coefficients in degrees 0,1,2 are

\[
\frac{2z^2+3z-9}{23},\qquad 0,\qquad
\frac{-6477z^2-5311z+4318}{23^4}.
\]

The degree-two coefficient also equals (−59z²−51z+36)/δ⁷, by reduction modulo the cubic. The first three coefficients and the corrected order-two constant are useful acceptance checks, but neither proves all coefficients or all gluing equations. Garoufalidis–Wheeler Theorem 1.13 provides a route for the **unshifted** symmetrisation. To use it here requires repairing the root expansion, proving higher Taylor-coefficient integrality in the localized cubic étale algebra, and justifying the p-completed identification and uniqueness argument. Independently shifted descendants need their own recurrence and gluing proof. The old small-prime gap is therefore retained with these exact tasks.

## The degree-zero cohomology map

The comparison node `etale-nahm-cohomology-export` applies existing owner maps. Let K be a number field and R=O_K[1/Δ] with Δ divisible by its discriminant. Import

\[
\kappa_R:H_{R/\mathbb Z}\xrightarrow{\sim}H_R
\]

from `HabiroRings:HR.5-number-field-comparison/the-number-field-ring`, and

\[
d_R:q\mathrm{Hdg}_{R/\mathbb Z}\simeq H_{R/\mathbb Z}
\]

from `HabiroRings:HR.6/the-degree-zero-identification`. Here qHdg denotes Wagner's **Habiro–Hodge** complex with the canonical étale filtration, not just its q−1-completion. The HQ.5 export supplies the geometric interpretation for Spec R. The complex is concentrated in degree zero, so the exact composite is

\[
\eta_R=H^0(d_R)^{-1}\circ\kappa_R^{-1}:
H_R\xrightarrow{\sim}H^0(q\mathrm{Hdg}_{R/\mathbb Z}).
\]

This is a ℤ[q]-algebra isomorphism. It is not built by declaring every constant family in R to glue; that declaration would give an incorrect R-algebra structure on H_R. The two owners' comparisons are natural and preserve all cyclotomic quotient and completion maps. Consequently, for each admitted s∈H_R,

\[
\operatorname{Taylor}^{\mathrm{Hdg}}_m(\eta_R(s))
=\operatorname{Taylor}^{\mathrm{GSWZ}}_m(s).
\]

The equality is in the same full cyclotomic coefficient algebra and includes Frobenius and re-expansion compatibility. At m=1, the q−1-completion is R[[q−1]]. Completion must remain visible: it is not the assertion that the global Habiro coefficient ring equals its single Taylor component.

The application `rational-cohomology-class` instantiates this map for R=ℤ[1/2] and the proved Gauss-family element g. Its image has Taylor constants 1,0,2 at orders 1,2,4, positive-degree coefficients zero, and q=1 completion 1. Preservation of these three different constants is an acceptance test for the actual map. A construction that substituted a uniform constant 1 would fail it.

The application `cubic-cohomology-class` gives an unconditional export at the coefficient ring supported by the imported proof:

\[
R_6=\mathbb Z[z,1/138],\qquad
\eta_{R_6}(\Psi)\in H^0(q\mathrm{Hdg}_{R_6/\mathbb Z}).
\]

Its q=1 Taylor coefficients are the three displayed cubic coefficients. If the two small-prime obligations are supplied, the same construction is defined over R=ℤ[z,1/23], and naturality takes that class to the one over R₆. The first coefficients having denominators only at 23 does not establish this global descent. This resolves the parent no-export-map gap in relative dimension zero while keeping its coefficient-ring restrictions.

## The quartic coefficient line and regulator

The application `quartic-module-export` supplies an exact coefficient-ring ledger for the selected nonabelian field. Let

\[
k_F=|K_2(O_F)|>0,\qquad M_F=6\cdot475\cdot k_F,
\qquad M_F\mid\Delta,\qquad R=O_F[1/\Delta].
\]

This is the excluded-integer definition imported from `HabiroNumberFields:HB.1/the-excluded-primes`. The tame kernel is finite, but finiteness does not determine its prime factors. `ArithmeticKTheory:N.6` is requested to compute and certify k_F, including its 2-primary part, for the exact integral basis above. Until it does, the prime set is {2,3,5,19} together with the prime divisors of k_F; the numerical list is not certified to end at 19.

Since δ is a unit, introduce the finite étale quadratic R-algebra

\[
S=R[T]/(\delta T^2-1).
\]

The chosen T represents δ⁻¹/². The algebra is étale because 2 and δ are units. No assertion that it is a field is required; if it splits, the number-field construction is interpreted in its factors. Conditional on the finite étale module scalar-change interface requested by the parent HB.9 membership node from HabiroNumberFields HB.7, the general membership theorem and the parent example supply the polar-part-removed collection f in the **restricted** module H_{S,ξ}|_Δ, where only root orders coprime to Δ are present. The index is a specified K₃ lift of [u]+[v]. The even diagonal entries of A make the integral Suslin obstruction vanish in the parent's convention. The existence and ambiguity of a lift use `K3BlochGroups:V.6/suslin-lift-fibre`; a lift must not be silently chosen to have an asserted torsion order.

The source expansion retains its normalization:

\[
\widehat f_1(x)=
\exp\left(\frac{\pi^2}{15\log(1+x)}\right)\delta^{-1/2}
(1+a_1x+a_2x^2+\cdots),
\]

where

\[
a_1=\frac{-1284u^3+384u^2-5520u+2047}{12\cdot25\cdot19^2},
\qquad
a_2=\frac{-3084024u^3-11262336u^2-1073760u+17201653}
{32\cdot9\cdot25\cdot19^4}.
\]

The formal exponential is removed in the GSWZ module construction through its polar-part convention; the inverse square root is retained in S. Dropping either factor from the asymptotic formula would change the object. The exact solution and discriminant certificates establish the membership theorem's algebraic hypotheses. These two coefficients are acceptance checks, not an all-order denominator proof.

GSWZ asserts 60-torsion. To obtain a theorem about the class, supply an exact five-term certificate for 60([u]+[v]) in the declared Bloch convention and apply `K3BlochGroups:V.6/five-term-certificate`. To assert 60ξ=0 in K₃(F), also resolve the lift's torsion fibre. Numerical Bloch–Wigner vanishing can support a computation but is not such a certificate. This part therefore makes no unconditional claim that the sixtieth power lies in the ring. The stronger statement in the parent example is usable only after these inputs are supplied.

The comparison `picard-and-regulator-export` keeps two different exports explicit. First, conditional on the **global** module and tensor theorem of `HabiroNumberFields:HB.7/the-ring-case-and-tensor-products`, HR.6 transports the invertible coefficient line L_ξ=H_{S,ξ} to the degree-zero Habiro–Hodge coefficient ring. This gives the owner-supplied map ξ↦[L_ξ] in Pic. Its q=1 completed line is free by HR.6's completed scalar-extension and regulator-completion statements, which inherit the same supplier hypotheses. A series defined only on orders coprime to Δ is not automatically a global section of that line: an extension proof is required to transport that particular series globally.

The finite étale scalar-change interface for S is an inherited owner request, distinct from the explicit algebraic certificate that S is étale. The supplier packet records source issue `HabiroNumberFields/E23`: the printed proof verifies multiplicative compatibility but does not establish closure under addition, nonzero global modules, or bijectivity of the tensor map. This part imports those proof gaps rather than treating the line theorem as fully established.

Second, the parent `HB.3/embeddings-and-regulator-evaluations` exports the real tuple of Bloch–Wigner sums D(σu)+D(σv). At the conjugate complex embeddings the sums are opposite; the parent reports numerical vanishing for the selected orbit. This real regulator tuple and the Picard class have different targets. No comparison between them, or identification with a crystalline or étale class, follows from module membership.

## The geometric comparison obligation

The node `higher-cohomology-export-obligation` states where the proved export stops. The map η_R is for the zero-dimensional étale scheme Spec R. A Nahm datum, a K₃ lift or a coefficient line does not by itself specify a smooth geometric family, a differential form or a higher-degree cycle.

Garoufalidis–Wheeler Definition 1.2 gives a **naive** theory using V=H^n_dR(X/B) modulo torsion, rational Taylor coefficients, Frobenius gluing and positive p-adic convergence radius. Their introduction explicitly says they expect this construction to capture features of the theories being developed by Wagner and Scholze. That expectation is not a comparison theorem.

Their Theorem 1.18 has a concrete domain. Take an étale map ℤ[x,λ]→R, put X=Spec R, and view X over B=Spec ℤ[λ,1/Δ(λ)] by pushing forward in the x variables. Take a relative top form ω invariant under the specified p-Frobenius for all but finitely many primes. The analytic subring H^{an}_{R/ℤ[x,λ]} consists of elements whose root-of-unity Taylor series have positive radius of convergence at every prime-ideal completion. The theorem gives

\[
f\longmapsto[f\omega]:
H^{an}_{R/\mathbb Z[x,\lambda]}\longrightarrow H^n_{\mathrm{naive}}(X/B).
\]

The source works with affine schemes and explicit integral de Rham classes. To use this construction for an HB.10 example, supply X/B, ω, the coefficient ring and its bad-prime localization, and the convergence and Frobenius conditions. To identify the result with the HQ.5 **algebraic** Habiro cohomology requires a map

\[
H^n_{\mathrm{naive}}(X/B)
\longrightarrow H^n(R\Gamma_{\mathrm{Hab}}(X/B))
\]

on that same input, preserving cyclotomic completions, coefficient changes, Frobenius and de Rham realization. No source read supplies this map. Its exact statement is requested from `HabiroCohomologyFoundations:HQ.6`, with an extension proposal **Habiro cohomology foundations, Part II: explicit cycle realizations**. The cohomology owner supplies the naive carrier, push-forward and comparison; HB.10 supplies the concrete series and applications. The crystalline, A_inf and étale realizations of HQ.8 retain their own hypotheses and must be composed separately. They are not consequences of ring membership or of a complex embedding.

Acceptance is therefore an actual commuting comparison square for the selected family and form, under the same convergence and prime restrictions. A generic promise of a cohomology export, a type containing only a proposition, or an equality between unrelated regulator and cohomology targets fails this requirement.

## Ownership, dependencies and acceptance

The parent `knot-matrices-and-the-topological-boundary` is imported for formal matrices and their Nahm equations. The confirmed finding `RT-AREA-topology/11` is handled by leaving every identification with a knot invariant, Neumann–Zagier topological data, triangulation independence and state-integral comparison with `ArithmeticQuantumTopology:QT.6`. QT.6 must import the estimates of HB.4 and the formal Gaussian integration of HB.8. These two prerequisite-to-consumer edges are proposed in this packet's restructuring record. This part proves no topological identification, so it adds no QT.6→HB.10 edge. The QT.6 packet is outside this job's edit scope.

The imported HB.10 nodes also retain the abelian figure-eight example, rank-one products, residue formula, shifted descendants and modular examples. General Bloch groups and five-term certificates remain with K3BlochGroups V.6; Suslin and embedding interfaces with HB.3; asymptotics and formal integration with HB.4 and HB.8; gluing and module membership with HB.9 and HabiroNumberFields HB.6–HB.7. Gaussian polynomials and q-Lucas belong to QM.0. The relative Habiro ring and its cohomology coefficient maps belong to HR.5–HR.6, importing HQ.5. No second general theory is planned in this part.

The four new planets are **Quadratic Gauss sum**, **Nonabelian quartic example**, **Quartic integral basis** and **Cubic symmetrisation**. The parent already assigns **Symmetrisation as a residue** and **Descendants in the Habiro ring**, so the assembled stage has six planets. Neither a proof gap nor an acceptance check is used as a planet.

The suggested file contains the two concrete definition signatures, all nine API signatures and all nine named tests. It also gives the exact quartic certificate, a number-field integral-basis existence statement, the ordinary-binomial profiles for the corrected cubic constant, and the cubic discriminant inverse. The export signatures show composition of actual ring equivalences and preservation of actual Taylor ring homomorphisms supplied as arguments. These parametric signatures do not claim to construct the missing owner carriers. Full membership, coefficient-line and higher-cohomology statements whose types are not available in the pinned libraries are omitted from the prototype and specified here instead. Its standard note makes the reader definitive.

The baseline checks, exact algebra checks and structural packet check support the plan, without supplying the missing mathematical proofs. In particular, source numerical computations remain labeled as such. The five gaps are:

1. All-component cubic integrality and gluing at 2 and 3, repairing equation (182), including independent shifts.
2. The exact quartic 60-torsion certificate and its specified K₃-lift obstruction.
3. A certified quartic tame-kernel order and complete prime factorization.
4. The imported HB.7 finite étale scalar-change, global-module and tensor-map interfaces, together with a global extension for any restricted series to be exported as a section.
5. The geometric naive-to-algebraic cohomology comparison on a supplied family and form.

The three requests are q-Lucas and finite cyclotomic Taylor jets from QM.0, the quartic tame kernel from ArithmeticKTheory N.6, and the geometric comparison from the HQ.6 direction with the stated Part II extension. A follow-up must supply those exact inputs and reconcile the corresponding owner nodes before changing the coverage from planned to closed. The dimension-zero export, rational gluing and algebraic certificates already have complete mathematical routes in this pass.
