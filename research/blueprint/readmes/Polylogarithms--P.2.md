# Polylogarithms, P.2: The weight-two regulator

This document continues [the parent plan](Polylogarithms.md) at its eight existing
P.2 nodes. The [part packet](../packets/Polylogarithms--P.2.json) adds fourteen
nodes: Lobachevsky analysis, Kummer reduction, an exact rational Fourier
approximation, Milnor's angle calculation, and a corrected source normalization
test. The pass is complete and P.2 is **planned**, with two explicit gaps. This
is a mathematical plan; no declaration is claimed implemented.

The regulator is the real-valued Bloch–Wigner function descended through
Suslin's integral Bloch-group convention. Its geometric interpretation uses
curvature −1 and ordered ideal vertices. Its numerical approximation returns
rationals with a proved error radius. These three uses share the same function
and sign, but a numerical certificate does not supply an algebraic Bloch boundary
certificate or an exact Borel normalization.

## Existing objects and ownership

P.1 owns the principal polylogarithms and the Bloch–Wigner function

\[
 D(z)=\operatorname{Im}\operatorname{Li}_2(z)
       +\arg(1-z)\log|z|.
\]

The principal argument is Mathlib's \((-\pi,\pi]\) convention. The principal
\(\operatorname{Li}_2\) value on the positive cut is its lower-half-plane limit.
The correction makes \(D\) continuous across the cut; \(D(0)=D(1)=0\),
\(D(\bar z)=-D(z)\), and \(D\) vanishes on the real axis. P.1's differential,
five-term identity, and positivity in the upper half-plane are imported by their
existing node IDs. They are not definitions of this part.

The eight inherited targets remain the following contracts:

| Existing P.2 node | Contract and refinement supplied here |
|---|---|
| `bloch-wigner-descent` | The homomorphism \(P(\mathbb C)\to\mathbb R\), restricted to \(B(\mathbb C)\), sends \([z]\) to \(D(z)\). It kills torsion. |
| `weight-two-regulator` | Apply the descent after each selected complex embedding of a number field; conjugating a selected embedding negates that coordinate. Real coordinates vanish. |
| `borel-comparison` | The existing rational comparison is retained. Its exact Burgos/Suslin scalar has the normalization gap described below. P.2 owns that analytic comparison. |
| `bloch-wigner-cocycle` | The homogeneous measurable cocycle evaluates \(D\) at the cross-ratio, with zero on repeated configurations. The comparison of its class with smooth/continuous cochains is requested explicitly. |
| `hyperbolic-volume` | Ordered ideal volume is \(D(r)\). This part supplies Milnor's calculation and imports the metric and Riemannian volume. |
| `lobachevsky-identity` | For an upper-half-plane shape, \(D(z)\) is the sum of the three Lobachevsky angle values. This part supplies the precise Lobachevsky normalization. |
| `certified-numerics` | The explicit rational Fourier construction below instantiates the existing approximation contract. |
| `certified-numerics-error` | Its precision bound and strict nonvanishing tests follow from the new uniform error theorem. |

All these IDs have prefix `Polylogarithms:P.2/` and remain in the parent packet.
None is copied into the part packet. The first two use
`K3BlochGroups:V.3/pre-bloch-group`, its five-term relation, and its Bloch group
as the kernel of the **antisymmetric tensor quotient** boundary. They do not
replace that quotient by an exterior square. The natural degree-three maps and
Suslin rational comparison are imported from V.4. In particular, a primitive
sixth-root symbol need not itself have zero integral boundary; its rational or
suitable multiple is a different input from an arbitrary integral symbol.

The cross-ratio used for volume satisfies
\(r(\infty,0,1,z)=z\). V.4's convention instead has
\(\operatorname{cr}(0,\infty,1,z)=z\). Swapping the first two vertices gives
\(r=1/\operatorname{cr}\), hence \(D(r)=-D(\operatorname{cr})\). An ordered
\((\infty,0,1,z)\) with \(\operatorname{Im}z>0\) is positive. Forgetting this
minus sign changes both the volume test and the regulator comparison.

## Lobachevsky analysis

Define, for every real \(\theta\),

\[
 \Lambda(\theta)=-\int_0^\theta \log|2\sin t|\,dt.
\]

This is `lobachevsky-function`, declaration `TauCeti.Polylog.lobachevsky`.
The integral is the native signed interval integral; negative upper limits
reverse orientation. The zeros of sine produce integrable logarithmic
singularities. The pinned `intervalIntegrable_log_sin` already proves
integrability of \(\log(\sin t)\) on every real interval. Away from a
measure-zero set, adding \(\log 2\) gives this integrand. Consequently the
integral is defined without a new improper-integral carrier.

Milnor's normalization gives oddness and period \(\pi\), not \(2\pi\) as a
minimal prescribed period. The native theorem `integral_log_sin_zero_pi` gives
\(\int_0^\pi\log(\sin t)dt=-\pi\log2\), so \(\Lambda(\pi)=0\). Oddness and
periodicity also give \(\Lambda(\pi/2)=0\). The function is continuous
through the singular angles and has derivative
\(-\log|2\sin\theta|\) when \(\sin\theta\ne0\).

The API has eight entries, with namespace prefix `TauCeti.Polylog.`:

| Declaration | Mathematical API |
|---|---|
| `lobachevsky_integrand_intervalIntegrable` | Integrability between arbitrary real endpoints, with native volume. |
| `lobachevsky_zero` | \(\Lambda(0)=0\). |
| `lobachevsky_pi_div_two` | \(\Lambda(\pi/2)=0\). |
| `lobachevsky_neg` | \(\Lambda(-\theta)=-\Lambda(\theta)\). |
| `lobachevsky_add_pi` | \(\Lambda(\theta+\pi)=\Lambda(\theta)\). |
| `lobachevsky_continuous` | Continuity on the entire real line. |
| `lobachevsky_hasDerivAt` | The stated derivative wherever sine is nonzero. |
| `lobachevsky_integral_compat` | Agreement at \(\pi\) with the pinned log-sine integral, including its sign and \(\pi\log2\) term. |

The four tests are `lobachevsky_zero`, `lobachevsky_half_period`,
`lobachevsky_catalan_half`, and `lobachevsky_native_integral`. The third is

\[
 \Lambda(\pi/4)=\frac12\sum_{k\ge0}\frac{(-1)^k}{(2k+1)^2}.
\]

It rejects a factor-of-two confusion with the Clausen function. The last tests
agreement with Mathlib's actual integral rather than an independently chosen
constant.

The theorem `lobachevsky-fourier`, declaration `lobachevsky_fourier`, proves

\[
 2\Lambda(\theta)=\sum_{n\ge1}\frac{\sin(2n\theta)}{n^2}
 \qquad(\theta\in\mathbb R).
\]

The series is absolutely and uniformly convergent. A proof expands the
weight-one logarithm at radius \(r<1\), integrates, and takes \(r\uparrow1\).
Near multiples of \(\pi\), an integrable logarithmic bound controls the
integral; the integrated series has majorant \(1/(2n^2)\). The pinned
`Real.summable_nat_pow_inv` supplies summability. This is a Fourier identity
for all angles, including singular angles, rather than a differentiated series
asserted to converge there.

The separate theorem `lobachevsky-duplication`, declaration
`lobachevsky_duplication`, is

\[
 \Lambda(2\theta)=2\Lambda(\theta)+2\Lambda(\theta+\pi/2).
\]

Adding the two absolutely convergent Fourier series cancels their odd-indexed
terms. This promoted functional identity is a direct prerequisite of the
sector calculation below.

## Kummer reduction and uniform error

The theorem `unit-circle-fourier`, declaration `blochWigner_unit_fourier`,
imports P.1's \(\operatorname{Li}_2\) series and continuity to prove

\[
 D(w)=\sum_{n\ge1}\frac{\operatorname{Im}(w^n)}{n^2},
 \qquad |w|=1.
\]

The term \(\arg(1-w)\log|w|\) vanishes. Passing from an interior radius to the
circle uses the summable reciprocal-square majorant. This includes \(w=1\),
where every term is zero. It is not restricted to an open arc avoiding 1.

For an integer \(N\ge1\), `unit-circle-fourier-tail`, declaration
`blochWigner_unit_fourier_tail`, supplies

\[
 \left|D(w)-\sum_{n=1}^N\frac{\operatorname{Im}(w^n)}{n^2}\right|
 \le \sum_{n>N}n^{-2}\le\frac1N.
\]

The last inequality comes from the pinned `sum_Ioc_inv_sq_le_sub` by taking a
limit in its upper endpoint. Its hypothesis that the lower endpoint is
nonzero is respected. The bound is uniform on the whole unit circle.

For \(z\ne0,1\), put

\[
 u_0=z,\quad u_1=\frac1{1-z},\quad u_2=1-\frac1z,
 \qquad w_j=\frac{u_j}{\bar u_j}.
\]

All three \(u_j\) are nonzero, and \(|w_j|=1\). The theorem
`kummer-unit-reduction`, declaration `blochWigner_kummer`, states

\[
 D(z)=\frac12\bigl(D(w_0)+D(w_1)+D(w_2)\bigr).
\]

This is Zagier I.3 equation (2), attributed there to Kummer. The proof route
uses P.1's differential to show that the difference has zero differential on
each half-plane. Continuity and real-axis vanishing identify the constants.
It therefore covers both half-planes and every real \(z\ne0,1\), without an
extra branch restriction.

Since \(w_j=e^{2i\arg u_j}\), the two Fourier identities also give
\(D(z)=\sum_j\Lambda(\arg u_j)\). For \(\operatorname{Im}z>0\), these are
three angles in \((0,\pi)\) summing to \(\pi\); this agrees with the inherited
`lobachevsky-identity`. At \(z=i\), the three unit shapes are \(-1,i,i\), so
the factor \(1/2\) is checked directly. For a real admissible shape they are
all 1.

This route resolves the inherited numerical obstruction near the unit circle.
A geometrically convergent \(\operatorname{Li}_2\) expansion is not needed for
the stated computable approximation target. The present algorithm has
exponentially many terms in the requested precision; no fast-complexity claim
is attached to it.

## Exact rational construction and its tests

Rational pairs represent coordinates for computation; the mathematical target
remains the native complex number \(a+bi\). No new abstract Gaussian-rational
field is introduced. The construction `rational-unit-shapes`, declaration
`rationalUnitShapes`, returns a three-element family of rational pairs. Define

\[
 \rho(x,y)=\left(\frac{x^2-y^2}{x^2+y^2},
                      \frac{2xy}{x^2+y^2}\right).
\]

For a pair \(z=(a,b)\) other than \((0,0),(1,0)\), set

\[
 W_0=\rho(a,b),\quad W_1=\rho(1-a,b),\quad
 W_2=\rho(a-1,b)\,\overline{W_0},
\]

where pair multiplication is \((x,y)(s,t)=(xs-yt,xt+ys)\). At each exceptional
pair set all \(W_j=(1,0)\). The denominators are nonzero on valid input.
The plus sign in the imaginary coordinate of \(W_1\) matters: inverting
\(1-z\) conjugates its ratio.

Its five API items are `rationalUnitShapes_zero`, `rationalUnitShapes_one`,
`rationalUnitShapes_conj`, `rationalUnitShapes_real`, and
`rationalUnitShapes_correct`. They give the exceptional values, compatibility
with conjugation, the value \((1,0)\) on all real rational inputs, and exact
agreement with the three native complex Kummer ratios. The last is promoted
to the separate lemma node `rational-unit-shapes-correct`, also proving norm
one. It uses the native coordinate multiplication formulas and norm, not an
assumed unit flag.

The tests `unit_shapes_i`, `unit_shapes_exceptional`, `unit_shapes_real_two`,
and `unit_shapes_native_norm` respectively check the tuple \((-1,i,i)\),
both exceptional inputs, the real input 2, and the norm in Mathlib's complex
space. The third input is admissible even though it lies on the classical
polylogarithm cut.

The definition `rational-fourier-sum`, declaration `rationalFourierSum`,
computes powers by the recurrence

\[
 q_0=(1,0),\qquad
 q_{n+1}=(q_n^{\rm re}x-q_n^{\rm im}y,
                 q_n^{\rm re}y+q_n^{\rm im}x),\qquad
 S_N(x,y)=\sum_{n=1}^N\frac{q_n^{\rm im}}{n^2}\in\mathbb Q.
\]

The definition accepts any rational pair and \(N\ge0\). Unit norm is an
analytic hypothesis, not a condition needed to compute powers. The five API
items `rationalFourierSum_zero`, `rationalFourierSum_one`,
`rationalFourierSum_conj`, `rationalFourierSum_succ`, and
`rationalFourierSum_coe` give the empty sum, vanishing at 1, conjugation, the
next summand, and agreement after coercion with the native complex-power
sum. The last is the separate comparison node `rational-fourier-compatibility`;
its induction uses exactly Mathlib's `Complex.mul_re` and `Complex.mul_im`.

The tests `fourier_sum_i_three`, `fourier_sum_empty`, `fourier_sum_one`, and
`fourier_sum_native_powers` check \(S_3(i)=1-1/9=8/9\), the empty sum at
\((2,3)\), \(S_7(1)=0\), and the general native compatibility. Replacing
powers by repeated imaginary coordinates fails the first and last tests.

The construction `rational-fourier-approximation`, declaration
`blochWignerFourierApprox`, is the fully specified rational output

\[
 A(z,p)=\frac12\sum_{j=0}^2 S_{3\cdot2^p}(W_j(z)).
\]

Its six API items are `blochWignerFourierApprox_formula`,
`blochWignerFourierApprox_zero`, `blochWignerFourierApprox_one`,
`blochWignerFourierApprox_real`, `blochWignerFourierApprox_conj`, and
`blochWignerFourierApprox_error`. The error API is promoted to
`rational-fourier-error`. Every operation defining the output is rational;
neither a real logarithm nor a numerical argument is evaluated.

The five tests are `approx_i_precision_zero`, `approx_i_precision_one`,
`approx_exceptional`, `approx_real_two`, and `approx_conjugate`. They pin
\(A(i,0)=8/9\), \(A(i,1)=209/225\), zero at 0 and 1, zero at the real
input 2, and \(A(-i,0)=-8/9\). An unsigned-volume approximator fails the last
test. The output at precision one also exceeds its error radius \(1/2\).

For valid input the error proof is short once the preceding contracts are
available. Apply Kummer to the three embedded unit shapes, apply each uniform
tail bound at \(N=3\cdot2^p\), and sum:

\[
 |A(z,p)-D(z)|\le\frac3{2N}
    =\frac1{2\cdot2^p}\le2^{-p}.
\]

Thus \(A(z,p)>2^{-p}\) proves \(D(z)>0\), the corresponding negative
inequality proves negativity, and \(|A(z,p)|>2^{-p}\) proves nonvanishing.
For \(\sum_i n_i[z_i]\), use the rational centre
\(\sum_i n_iA(z_i,p_i)\) with radius \(\sum_i|n_i|2^{-p_i}\). Two values
are proved distinct only when their centres differ by more than the sum of
the radii. These certificates concern values. Membership in the integral
Bloch group still uses V.6's algebraic boundary certificate.

## Milnor's volume calculation

The node `milnor-angle-volume`, declaration
`idealTetrahedron_volume_eq_lobachevsky`, uses a nondegenerate ideal geodesic
tetrahedron in the **explicit** curvature \(-1\) hyperbolic metric. Its three
dihedral angles are positive and sum to \(\pi\); opposite edges have equal
angles. The theorem states finite unoriented volume

\[
 \operatorname{Vol}(T)=\Lambda(\alpha)+\Lambda(\beta)+\Lambda(\gamma).
\]

Ordered volume is the orientation sign times this number. For the normalized
upper-half-plane shape, the angles are
\(\arg z,\arg(1/(1-z)),\arg(1-1/z)\). The inherited angle identity gives
\(\operatorname{Vol}_{\rm or}(\infty,0,1,z)=D(z)\).

GeometricTopology layer 7 owns the metric and Riemannian volume measure; layer
8 supplies the hyperbolic model framework. Neither is replanned here. The
early ideal-boundary interface is a precise gap: a canonical identification
with \(\mathbb P^1(\mathbb C)\), measurable geodesic regions, orientation,
model isometries, and integration/exhaustion compatibility are needed. This is
proposed as **GeometricTopology, Part II: Ideal boundary and finite-volume
geodesic regions**, starting from layers 7–8. It also supplies QT.5's geometric
carrier. This part does not introduce an abstract tetrahedron with an arbitrary
volume field.

Milnor's integral proof fixes the numerical scale independently of Goncharov's
boundary-current normalization. Move one vertex to infinity and put its
opposite face on the unit hemisphere. The native metric becomes
\((dx^2+dy^2+dh^2)/h^2\), hence the volume density is \(h^{-3}\,dx,dy,dh\).
Project to a triangle inscribed in the unit disk. In the acute case split it
into six right sectors. For a sector with angle \(a\in(0,\pi/2)\), the region
has bounds

\[
 0<x<\cos a,\quad0<y<x\tan a,\quad
 h>\sqrt{1-x^2-y^2}.
\]

Integration in height supplies \(1/[2(1-x^2-y^2)]\). The elementary second
integration and substitution \(x=\cos t\) give

\[
 \frac{-\Lambda(\pi/2+a)+\Lambda(2a)
          +\Lambda(\pi/2-a)-\Lambda(0)}4
       =\frac{\Lambda(a)}2.
\]

The equality uses oddness, periodicity and the promoted duplication theorem.
Summing the six sectors gives the stated volume. For an obtuse triangle, signed
sectors about the circumcentre give its indicator almost everywhere; integrable
sector contributions can be subtracted. The geometry request includes that
signed-region interface. This avoids treating the acute decomposition as valid
for every triangle without proof.

Acceptance checks include a regular ideal tetrahedron with volume
\(3\Lambda(\pi/3)=D(e^{i\pi/3})>0\), a reflected ordering with negative
volume, and a real admissible shape with flat ordered volume zero. The flat
case is outside the nondegenerate angle hypotheses. The five-term volume
subdivision remains the inherited `hyperbolic-volume` contract. Manifold
triangulations, completeness equations, flattenings and Chern–Simons are QT.5's
work. QT.5 imports the edge `Polylogarithms:P.2 → ArithmeticQuantumTopology:QT.5`
for its manifold volume sum and Bloch-invariant statement.

## Exact regulator normalization and source corrections

The comparison is made with the **Burgos-normalized** class already owned by
`BorelRegulators:R.4/trace-cocycle` and its regulator, not with an unnamed
nonzero continuous class. In weight two its trace polynomial is
\(\Phi_3=-(1/6)\operatorname{Alt}_3\operatorname{Tr}\); its relative and
absolute representatives involve the conjugate-transpose and coefficient
projection specified in that supplier. Equality of classes does not imply
pointwise equality of these representatives.

Goncharov's published section 5.4 constructs \(\beta_{\rm DR}\) by restricting
an invariant form to the symmetric-space tangent and integrating over geodesic
simplices. Section 5.5 defines
\(C_2=(1/2)\operatorname{Alt}_3\operatorname{Tr}\), with **unnormalized**
alternation. Theorem 5.7 prints the weight-two class coefficient \(1/12\);
Corollary 5.10 prints \(1/24\) against its \(b_2\). Those printed numbers are
not accepted here as an audited Borel-to-\(D\) scalar.

The new comparison `goncharov-elementary-calibration`, declaration
`goncharov_weightTwo_elementaryCalibration`, records the exact obstruction.
For \(E_2=e_{12}\wedge e_{21}\wedge e_{22}\), the six ordered products have
traces

| Permutation | Sign | Trace |
|---|---:|---:|
| 123 | + | 0 |
| 231 | + | 0 |
| 312 | + | 0 |
| 132 | − | 1 |
| 321 | − | 1 |
| 213 | − | 1 |

Consequently \(\operatorname{Alt}_3\operatorname{Tr}(E_2)=-3\),
\(C_2(E_2)=-3/2\), and \(\Phi_3(E_2)=1/2\). The published proof on p.39
instead asserts \(C_n(E_n)=1\). Source issue **Polylogarithms/E22** records the
contradiction to the stated conventions and its full calculation. Reversing
the first two matrices gives \(+3/2\), which still fails the printed value.
The correction is scoped to the proof: this calculation alone does not justify
a replacement scalar in Theorem 5.7.

Source issue **Polylogarithms/E23** concerns Appendix 7.2's undeveloped
conversion to \(c_3=-1/(6\pi)\). The derivation must include the boundary
measure-ratio powers and orientation from 7.1. It is a missing calibration
argument, not an assertion that the volume identity is false. Milnor's
independent density calculation supplies the volume theorem's source route.
Both passages were checked in the published PDF and against arXiv v3; the
packet records hashes and versions. No correction was found in the revision
history, author site or targeted publisher/title erratum search.

The remaining normalization gap has a concrete worklist: recompute the class
coefficient from the symmetric-space integral; identify \(\beta_{\rm DR}\)
with the early AF.1a van Est maps; include the measurable-to-continuous
comparison of the \(D\) cocycle; fix the \(\mathbb R(1)=(2\pi i)\mathbb R\)
generator and real-coordinate division; compare the natural V.4
Suslin/Hurewicz maps after rationalization; and retain the cross-ratio sign.
The final map-level scalar then becomes an export of P.2.

This handles RT-AREA-ktheory-2/23: V.6 supplies rational and integral algebraic
comparisons; its current regulator-agreement node is a transport consumer of
P.2, with its residual wording about R.7 as supplier to be corrected. No whole
V.6 dependency is needed for this pass. R.7 retains the universal factor-two
comparison and the weight-two test. It consumes P.2's analytic comparison.
Importing `R.7/weight-two-bloch-wigner` to prove P.2 would create a cycle.

The volume ownership above handles both RT-AREA-ktheory-2/25 and
RT-AREA-topology/7. The packet proposes the consumer edge and rescoping; this
job edits no other packet or atlas content.

## Baseline, planets and acceptance

The reviewed P.2 library audit says the targets are not built. The pinned
Mathlib and Tau Ceti searches found no Lobachevsky, Bloch–Wigner, ideal-tetrahedron
or Borel-regulator target declaration. Twelve actual foundations are cited:
the signed interval integral, log-sine integrability and its full-period
integral, native complex numbers, both multiplication coordinates, norm and
principal argument, p-series summability, the reciprocal-square finite-tail
bound, matrix trace and trace commutation. Each declaration statement was read
at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`; the Tau Ceti search used
`f790474821cf4256814db967cb154e7af3d0c369`. Merely mentioning the dilogarithm in
a log-integral module does not define it.

The two new planets are **Lobachevsky function** and **Kummer's formula**. With
the four inherited planets (Bloch-group descent, weight-two regulator, Borel
comparison and Lobachevsky volume formula), P.2 has six, within the layer limit.
Numerical helpers and correction bookkeeping are not additional planets.

The [suggested file](../suggested/Polylogarithms--P.2.lean) contains all 24 new
API items and all 17 unit tests. Its local \(D\) notation expands P.1's actual
principal-log integral formula; it is not an arbitrary function assumed to have
the desired properties. The unavailable canonical geometric signature is
identified by name in a comment, while its real sector-integral signature is
present. The exact Borel scalar is not replaced by an assumed proposition.
Elaboration validates signatures only; the proof bodies remain placeholders.

Acceptance of this part requires the correct rational test values, native
complex compatibility and explicit precision proof, consistent volume and
cross-ratio signs, the matrix-unit normalization discrepancy, and the supplier
boundaries. The follow-up must resolve the two recorded gaps: the exact
Burgos/Suslin comparison and the early canonical ideal-region interface. It does
not need to restart the completed uniform numerical route or duplicate the
inherited eight targets.

## Sources read

- John Milnor, [*Hyperbolic geometry: The first 150 years*](https://www.ams.org/journals/bull/1982-06-01/S0273-0979-1982-14958-8/S0273-0979-1982-14958-8.pdf), Bull. AMS 6 (1982), 9–24, Appendix pp.17–20: Lemmas 1–2, Fourier identity and complete volume proof.
- Don Zagier, [*The Dilogarithm Function*](https://people.mpim-bonn.mpg.de/zagier/files/doi/10.1007/978-3-540-30308-4_1/fulltext.pdf), Frontiers II (2007), I.3–I.4, pp.10–14: Kummer equation (2), circle Fourier series, cross-ratio and volume formulas.
- Alexander Goncharov, [*Polylogarithms, regulators, and Arakelov motivic complexes*](https://www.ams.org/journals/jams/2005-18-01/S0894-0347-04-00472-2/S0894-0347-04-00472-2.pdf), JAMS 18 (2005), 1–60: section 5.1–5.6, pp.32–42, and Appendix 7.1–7.2, pp.55–57. [arXiv v3](https://arxiv.org/pdf/math/0207036v3) was read separately and collated at the normalization passage.

The pinned Tau Ceti GeometricTopology and AlgebraicTopology roadmap documents
were each read in full to check the upstream boundary and style. Sources were
publicly obtained and read on 2026-10-05. Source versions and SHA-256 values are
in the packet.
