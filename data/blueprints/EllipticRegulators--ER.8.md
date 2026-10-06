# Elliptic regulators: ER.8

## p-adic comparison and worked examples

This part continues the accepted `EllipticRegulators.json` packet. It specifies the
good-reduction elliptic instance of the syntomic comparison, fixes the weight-two
regulator and L-function coordinates, and supplies an explicit class over
\(\mathbb Q(\sqrt{-3})\) with its transfer. It also gives the full symbolic
six-torsion certificate for the CM class on 36a1. The positive and negative
arithmetic-integrality examples, the projective-line normalization, and the
conductor-14/35/54 examples are imported from the parent.

The stage is **planned** at target granularity. Its prerequisite chains end in
the pinned libraries, named owner nodes, or five precise supplier requests.
Three gaps remain: the exact geometric regulator interfaces, the CM point
dictionary and one-point reduction, and the geometric signatures absent from the
prototype. None of the declarations is claimed to be implemented. The
[packet](../packets/EllipticRegulators--ER.8.json) is the declaration inventory;
the [suggested file](../suggested/EllipticRegulators--ER.8.lean) gives the
signatures that can currently be expressed.

All new declaration names below belong to `TauCeti.EllipticRegulator.ER8`.
Names of imported declarations retain their owner's namespace. The twelve
nodes of this part refine the parent's six ER.8 nodes; they do not replace the
parent's earlier regulator, K-theory, or analytic definitions.

### Ownership and conventions

| Input | Owner | Use here |
| --- | --- | --- |
| Primitive real cycles, Néron periods, normalized differential | `EllipticRegulators:ER.1` | Coordinate choices and orientation |
| Deligne symbol comparison and period conversion | `EllipticRegulators:ER.2` | Conversion from the source regulator to the Beilinson coordinate |
| Elliptic \(D_q,J_q,R_q\), diamond and divisor formulas | `EllipticRegulators:ER.3`, `ER.4` | Evaluation of the explicit symbols |
| CM character, class \(U\), corrected L-value theorem | `EllipticRegulators:ER.5` | The 36a1 specialization |
| Regular model, integral part and vertical boundaries | `EllipticKTheory:E.6` | Arithmetic eligibility |
| Symbol certificates, corrections and transfer | `EllipticKTheory:E.7` | Horizontal certificates and descent |
| Worked model and nonrational residue examples | `EllipticKTheory:E.8` | Positive and negative tests |
| Coleman integration | `ColemanIntegration:L1` | Primitive and constant-term divisor evaluation |
| Syntomic and local étale regulators | `PadicHodgeRegulators:D.5`, `D.2` | Geometric maps and Frobenius comparison |
| Period lines, refined distributions, critical eigenlifts, Euler factors | `ModularSymbolsPadicLFunctions:L1`, `L2`, `L3`, `L4` | The p-adic L-function |
| Analytic/algebraic CM dictionary and Galois action | `ComplexMultiplicationAndExplicitReciprocity:CM.1`, `CM.2` | Coordinates and descent of the CM example |

The tame convention is

\[
\partial_P\{f,g\}=(-1)^{\operatorname{ord}_P(f)\operatorname{ord}_P(g)}
 \left(f^{\operatorname{ord}_P(g)}/g^{\operatorname{ord}_P(f)}\right)(P).
\]

Residues belong to \(k(P)^\times\). A nontrivial residue whose norm is one is
still nontrivial. Constant-field transfer uses the owner's norm-residue formula;
it does not authorize replacing each residue by its norm when testing a class.

The diamond convention is **second point minus first point**:

\[
 (f)\diamond(g)=\sum_{P,Q}m_Pn_Q[Q-P].
\]

Use ER.3's q-invariant \(R_q=J_q+iD_q\), including the Bernoulli correction in
\(J_q\). ER.4 gives

\[
 r_{\rm source}(\xi)(dz)=\tfrac12\overline{R_q(\operatorname{diamond}\xi)}.
\]

The factor \(1/2\), the conjugation, and the diamond direction are all part of
the convention. ER.2 compares the Deligne regulator with
\(2r_{\rm source}\), followed by the oriented period conversion. In particular,
an evaluation against \(dz\) is not itself the Néron-cycle coordinate used in
the p-adic Beilinson conjecture.

## The good-reduction comparison

### `good-reduction-elliptic-pairing`

Let \(K/\mathbb Q_p\) be finite, \(p>2\), and let
\(\mathcal X/\mathcal O_K\) be a smooth proper elliptic model with generic fibre
\(E\). Fix a branch of the p-adic logarithm. Take
\(u\in K_2(\mathcal X)^{(2)}\otimes\mathbb Q\), and a finite presentation of
its generic restriction as \(\sum_i n_i\{f_i,g_i\}\). Its horizontal tame
symbols are trivial. For every holomorphic differential \(\eta\), the required
specialization of D.5 is

\[
 \operatorname{Tr}(\operatorname{reg}_{\rm syn}(u)\cup\eta)
 =\sum_i n_i\sum_P\operatorname{ord}_P(f_i)
   \operatorname{Tr}_{K(P)/K}
   \left(\operatorname{CT}_P\int\log(g_i)\eta\right).
\]

The primitive is a Coleman function, not an ordinary indefinite integral.
At a zero or pole of \(g\), write \(g=t^m v(t)\) with \(v\) a unit and
\(\eta=h(t)\,dt\). Then \(\log(g)=m\log(t)+\log(v(t))\). Integrating a term
\(t^n\log(t)\,dt\), \(n\geq0\), produces a multiple of
\(t^{n+1}(\log(t)-1/(n+1))\). This has zero constant term. Consequently the
logarithmic singularity in this primitive does not introduce a dependence on
the choice of local parameter. This argument is special to the stated
holomorphic differential; an arbitrary logarithmic Coleman function need not
have parameter-independent constant term.

Adding a global constant to the primitive changes the divisor evaluation by
that constant times
\(\sum_P\operatorname{ord}_P(f)[K(P):K]=0\). At a nonsplit point one first
works over a splitting extension and then takes the residue-field trace.
Coleman Galois equivariance is required for the result to descend to \(K\).
Neither choosing a single conjugate point nor replacing the trace by one value
is valid.

The public source is Besser–de Jeu, introduction pp. 3–4 and Remark 1.10. That
remark restates the degree-two Coleman–de Shalit formula and identifies it as
syntomic through Besser's earlier comparison. Its weight-three/K4 theorems are
outside this part. Presentation independence, Steinberg relations and the
actual regulator map are imported from D.5; a local expansion does not prove
those statements. The full Besser II proof was not obtained.

There are two distinct acceptance obligations. The holomorphic pairing must
have the displayed formula and be independent of presentation. To compute
the Frobenius-normalized scalar, D.5 must also provide the **whole**
two-dimensional de Rham regulator vector or a reconstruction algorithm. One
holomorphic pairing does not determine that vector. Coleman L1's current
general pullback statement also carries an elliptic-domain gap outside its
established punctured-line cases; the request names the coordinate and Taylor
hypotheses rather than assuming they hold automatically.

The projective-line check imports the parent normalization example. A based
dilogarithm primitive on \(\mathbb P^1\setminus\{0,1,\infty\}\) can be
nonzero. The Steinberg symbol \(\{z,1-z\}\) and its proper-curve syntomic
regulator are zero. Since \(H^1_{\rm dR}(\mathbb P^1)=0\), a nonzero primitive
value cannot be substituted for that proper-curve regulator. This is compatible
with the parent's separate real path integral, which checks the normalization
of the differential representing \(dD\).

### `elliptic-syntomic-etale-factor`

Here take \(E/\mathbb Q\) with good reduction at \(p\). Let \(\Phi\) be
untwisted crystalline Frobenius on \(H^1_{\rm dR}(E/\mathbb Q_p)\), whose
eigenpolynomial is \(X^2-a_pX+p\). Extend this linear operator and the
pairing to a coefficient field \(K\) containing the selected eigenvalue;
\(H=H^1_{\rm dR}(E/\mathbb Q_p)\otimes_{\mathbb Q_p}K\). This is coefficient
extension of the \(\mathbb Q_p\)-linear operator. For a general curve over a
finite p-adic field, crystalline Frobenius can be semilinear, and the same
linear statement requires a separate descent convention. Under the owner's
cohomological identification, put
\(z=\log_{\rm BK}(\operatorname{reg}_{\rm et}(u))\). The comparison is

\[
 \operatorname{reg}_{\rm syn}(u)=(1-p^{-2}\Phi)z.
\]

This convention appears in Asakura–Chida's accepted manuscript and in the
public publisher preview, footnote 10, citing Besser Proposition 9.11. For
\(B(a,b)=\operatorname{Tr}(a\cup b)\), Frobenius satisfies
\(B(\Phi a,\Phi b)=pB(a,b)\). If \(\Phi v=\gamma v\) and \(\gamma\neq0\),
then

\[
 B(\Phi z,v)=\frac p\gamma B(z,v),\qquad
 B(\operatorname{reg}_{\rm syn}(u),v)
   =\left(1-\frac1{p\gamma}\right)B(z,v).
\]

The suggested `elliptic_syntomic_etale_pairing` proves the linear-algebra
component from similitude and the eigenvector equation. It does not assume the
claimed regulator comparison as a field of an artificial structure. The
geometric comparison still needs D.2/D.5's actual étale regulator, Bloch–Kato
logarithm and cohomology identification. At \(p=5,\gamma=2\), this pairing
factor is \(9/10\); substituting one or confusing it with the normalization
factor below fails the test.

### `frobenius-regulator-scalar`

For a characteristic-zero field \(K\), a \(K\)-vector space \(H\), a bilinear
form \(B\), and vectors \(\omega,v,r\), define

\[
 \operatorname{frobeniusRegulatorScalar}(p,\gamma,B,\omega,v,r)
 =\left(1-\frac p\gamma\right)\frac{B(r,v)}{B(\omega,v)}.
\]

The coordinate expression is total, but its geometric interpretation requires
\(\gamma\neq0\) and \(B(\omega,v)\neq0\). In the elliptic application,
\(r=\operatorname{reg}_{\rm syn}(\xi)\), \(\omega\) is the chosen Néron
differential and \(v\) is a nonzero \(\gamma\)-eigenvector. The condition
\(\Phi\omega\neq\gamma\omega\) excludes a dependent Hodge/eigenline and
ensures the denominator is nonzero. This is Asakura–Chida §3.4 at \(n=0\),
where the gamma-factor is one.

The API is derived from the ratio in Conjecture 3.3 and from period rescaling:

- `frobeniusRegulatorScalar_eq` exposes exactly the displayed formula.
- `frobeniusRegulatorScalar_zero`, `frobeniusRegulatorScalar_add` and
  `frobeniusRegulatorScalar_smul` make it linear in the regulator vector.
- `frobeniusRegulatorScalar_scale_eigenvector` removes nonzero scaling of
  \(v\), with the denominator and eigenvalue guards explicit.
- `frobeniusRegulatorScalar_scale_differential` says that replacing
  \(\omega\) by \(c\omega\), \(c\neq0\), multiplies the scalar by \(c^{-1}\).
  This is the scaling required by the L-function period normalization.

The unit tests use the existing bilinear-form interface on \(\mathbb Q^2\)
with determinant pairing \(B((a,b),(c,d))=ad-bc\):

- `frobenius_scalar_small`: \(p=5,\gamma=2,\omega=(1,0),v=(0,1),r=(3,0)\)
  gives \(-9/2\).
- `frobenius_scalar_zero`: the same data with \(r=0\) gives zero.
- `frobenius_scalar_eigenvector`: replacing \(v\) by \((0,7)\) leaves
  \(-9/2\).
- `frobenius_scalar_bad_denominator`: \(\omega=v=(1,0)\) has zero cup
  denominator and is inadmissible. A total field expression evaluating to zero
  does not make it a geometric regulator coordinate.

Combining the two nodes gives the étale-coordinate expression

\[
 R_{p,\gamma}(\xi)=
 \left(1-\frac p\gamma\right)
 \left(1-\frac1{p\gamma}\right)
 \frac{B(\log_{\rm BK}\operatorname{reg}_{\rm et}(\xi),v)}{B(\omega,v)}.
\]

The two factors have different origins. This part keeps both.

## The refined L-function and the conjectural relation

### `neron-refinement-period-dictionary`

Let \(E/\mathbb Q\) have conductor \(N\), and take \(p>2\), \(p\nmid N\).
Use primitive integral cycles \(u^\pm\) in the conjugation eigenspaces with
\(\Omega^+=\int_{u^+}\omega>0\) and \(\Omega^-/i>0\). The whole real locus
can have index two in the primitive positive cycle. ER.1 supplies that index
and prevents a silent replacement of \(u^+\).

For the associated newform \(f_E\), choose a root \(\gamma\) of
\(X^2-a_pX+p\) with slope less than one, or slope one with the refinement
non-theta-critical. Select the owner period bases by the exact symbols

\[
 \lambda^\pm(a,m)=\frac{\pi i}{\Omega^\pm}
 \left(\int_{\infty}^{a/m}f_\gamma(z)\,dz
       \ \pm\int_{\infty}^{-a/m}f_\gamma(z)\,dz\right).
\]

The measure is the refined eigen-distribution of L2, or L3's non-theta-critical
eigenlift. Its finite-coset moments carry \(\gamma^{-\nu}\). Its period bases
are selected to give these Néron-normalized symbols; if a modular
parametrization is used, its pullback differential factor must be included.
This part does not construct a new measure. Define its Mellin evaluation by

\[
 L_p(E,\chi,s)=\int_{\mathbb Z_p^\times}\chi(x)\langle x\rangle^{s-1}
                       \,d\mu_\gamma.
\]

Pin the complex convention
\(\tau(\chi)=\sum_{a\bmod p^\nu}\chi(a)e^{2\pi ia/p^\nu}\) and
\(L(E,\chi,s)=\sum_n\chi(n)a_n n^{-s}\). At weight two, the imported L2
interpolation formula becomes

\[
 L_p(E,\chi,1)=
 \gamma^{-\nu}\tau(\chi)
 \frac{L(E,\chi^{-1},1)}{\Omega^{\chi(-1)}}
 \quad(\chi\text{ primitive and nontrivial}),
\]

and

\[
 L_p(E,1,1)=(1-\gamma^{-1})^2\frac{L(E,1)}{\Omega^+}.
\]

The first trivial-character factor comes from restricting the distribution to
units, the second from p-stabilization. L4's Euler-factor comparison supplies
the same pair. For a primitive p-power character the Euler factors are one.
At critical slope, classical interpolation does not uniquely determine the
distribution: the specified non-theta-critical eigenlift is essential. The
CM split theta-critical refinement is excluded from this statement.

Since \(x=\omega_{\rm Teich}(x)\langle x\rangle\), the evaluation
\(L_p(E,\omega_{\rm Teich}^{-1},0)\) is the inverse-\(x\) moment. It is
outside the weight-two classical interpolation range. No special-value
identity is obtained merely by substituting a negative exponent into the
classical interpolation theorem.

Two source corrections are recorded with their versions. **E28:** arXiv v2
Theorem 2.2(1) omits \(\alpha^{-\nu}\); the accepted manuscript restores it.
The unscaled modular-symbol values satisfy a \(U_p\) relation with factor
\(\alpha\), so they cannot be the additive coset masses.

**E29:** the accepted manuscript Theorem 2.3 and §3.4 print, for nontrivial
characters, \((p/\gamma)^\nu L(E,\chi,1)/(\tau(\chi)\Omega^{\chi(-1)})\).
In its displayed coset convention, summing the masses against \(\chi(a)\)
and using the owner twisted Mellin identity gives the formula above. An
equivalent form is

\[
 \chi(-1)(p/\gamma)^\nu
 \frac{L(E,\chi^{-1},1)}{\tau(\chi^{-1})\Omega^{\chi(-1)}}.
\]

For the odd quadratic character modulo three,
\(\tau=\zeta_3-\zeta_3^2\), \(\tau^2=-3\), and \(3/\tau=-\tau\).
Thus the printed factor has the opposite sign; character inversion cannot
repair this test because the character is its own inverse. Even quadratic
characters conceal the discrepancy. The suggested `odd_quadratic_gauss_test`
records its exact algebraic check. E29 concerns the inspected accepted
manuscript; the publisher preview does not expose the body, so the packet does
not claim to have checked that formula in the version of record. No separate
correction was found in the inspected version history or author publication
page.

### `weight-two-beilinson-relation`

Let \(M\) be a \(\mathbb Q\)-vector space, \(K\) a characteristic-zero field,
and let \(r_\infty:M\to\mathbb R\), \(r_p:M\to K\) be rational-linear maps.
For \(A\in\mathbb R\), \(B\in K\), define
`WeightTwoBeilinsonRelation` to mean that there are \(\xi\in M\),
\(q\in\mathbb Q\), \(\epsilon\in\{1,-1\}\) such that

\[
 \xi\neq0,\quad q\neq0,\quad r_\infty(\xi)\neq0,
 \quad r_p(\xi)\neq0,\qquad
 A=q r_\infty(\xi),\quad B=\epsilon q r_p(\xi).
\]

The rational number is embedded separately in the two coefficient fields.
This is an actual predicate with an existential body. It neither defines
motivic cohomology nor asserts that arbitrary linear maps satisfy Beilinson's
conjecture. Its purpose is to make the cross-field ratio meaningful and retain
the nonzero hypotheses that field division can otherwise hide.

Its API serves the conjectural application and the source's scaling ambiguity:

- `weightTwoBeilinsonRelation_iff` exposes the witnesses and equations.
- `weightTwoBeilinsonRelation_ratios` gives
  \(A/r_\infty(\xi)=q\) and \(B/r_p(\xi)=\epsilon q\).
- `weightTwoBeilinsonRelation_rescale_witness` transports a witness by
  \(\xi\mapsto c\xi\), \(q\mapsto q/c\), \(c\in\mathbb Q^\times\), including
  the nonzero conditions.
- `weightTwoBeilinsonRelation_change_sign` changes \(r_\infty\) to
  \(-r_\infty\), \(q\) to \(-q\) and \(\epsilon\) to \(-\epsilon\), preserving
  the predicate.

The tests take \(M=K=\mathbb Q\), \(r_\infty(x)=x\), \(r_p(x)=2x\):

- `beilinson_relation_small`: \(A=3,B=6\) has witness \(\xi=1,q=3,\epsilon=1\).
- `beilinson_relation_zero`: the zero p-adic map admits no witness.
- `beilinson_relation_wrong_ratio`: \(A=3,B=5\) fails.
- `beilinson_relation_negative_sign`: \(A=3,B=-6\) has \(\epsilon=-1\).

These tests detect a predicate that drops the common rational scalar, the sign,
or the nonzero regulator guards.

### `weight-two-padic-beilinson-conjecture`

This is a **conjectural application**, not a proved theorem. Under the
good-prime, Néron-period and slope hypotheses above, and
\(\Phi\omega\neq\gamma\omega\), set

\[
 M=H_M^2(E,\mathbb Q(2))_{\mathbb Z},\quad
 r_\infty(\xi)=\frac{\operatorname{reg}_D(\xi)(u^-)}{2\pi i},\quad
 r_p(\xi)=R_{p,\gamma}(\xi),
\]

\[
 A=L'(E,0),\qquad B=L_p(E,\omega_{\rm Teich}^{-1},0).
\]

The n=0 formulation of Asakura–Chida Conjecture 3.3, together with its preceding
real Beilinson rationality component, asserts the relation just defined. Its
witness belongs to the **arithmetic-integral** motivic group. An unramified
function-field symbol alone is insufficient. The real functional uses the
Deligne normalization, so ER.2's factor-two and period comparison precede this
application. A proposed numerical witness needs an exact integral certificate
and an exact special-value comparison before any instance is called proved.

## The CM certificate on 36a1

### `cm36-full-torsion-certificate`

Take \(E:y^2=x^3+1\), \(\kappa=\mathbb Q(\sqrt{-3})\),
\(\tau=(1+\sqrt{-3})/2\), and \(L=\kappa(E[6])\). All 36 six-torsion
points are rational over \(L\); they are not all rational over \(\kappa\).
The existing division-polynomial recurrence gives

\[
 \psi_6=6xy(x^3+4)(x^3-8)(x^9+228x^6+48x^3+64).
\]

Put \(\rho=1/\psi_6\). The baseline torsion-zero equivalence and a
simple-zero check give

\[
 (\rho)=35[O]-\sum_{b\in E[6]\setminus\{O\}}[b].
\]

The pole order of \(\psi_6\) is 35. In \(t_O=-x/y\), its leading unit is
\(-6\), hence \(\rho\) has leading unit \(-1/6\). The pole order is not
36; including the zero point in the finite zero sum would be an error.

For every \(b\neq O\), compute the function with divisor \(6[b]-6[O]\)
by the fixed Miller chain \(1,2,3,6\):

\[
 f_1=1,\quad f_2=h_{b,b}/v_{2b},\quad
 f_3=f_2h_{2b,b}/v_{3b},\quad
 f_6=f_3^2h_{3b,3b}/v_{6b}.
\]

Here \(h\) is the chord or tangent function and \(v_P=x-x(P)\) is the
vertical function, with \(v_O=1\). If \(P+Q=O\) with \(P,Q\neq O\),
including a vertical tangent, put \(h_{P,Q}=v_P\). Put
\(h_{O,P}=h_{P,O}=v_P\) and \(h_{O,O}=1\), so the Miller quotient
\(h_{P,Q}/v_{P+Q}\) is one when either input is \(O\). Normalize
\(f_6\) to leading unit one at
\(O\), and denote it by \(f_b\). Thus the chain also covers points of order
two and three, rather than only points of exact order six. The general
principal-torsion existence theorem and correction construction are already
owned by the baseline and E.7.

For a fixed \(a\neq O\), take the support to be all \(E[6]\), every residue
field to be \(L\), and local parameter
\(t_b=x-x_b\) if \(y_b\neq0\), \(t_b=y\) if \(y_b=0\), and \(t_O=-x/y\).
Let \(r_b\) be the leading unit of \(\rho\) and \(u_a\) that of \(f_a\)
at \(a\). The complete residue schema is

| Row | Orders of \(\rho,f_a\) | Uncorrected residue \(c_{a,b}\) | Corrected numerator residue |
| --- | --- | --- | --- |
| \(b\neq a,O\) | \(-1,0\) | \(f_a(b)\) | \(c_{a,b}^6c_{a,b}^{-6}=1\) |
| \(a\) | \(-1,6\) | \(r_a^6u_a\) | \(c_{a,a}^6c_{a,a}^{-6}=1\) |
| \(O\) | \(35,-6\) | \(6^6\) | \((c_{a,O}\prod_{b\neq O}c_{a,b})^6=1\) |

The finite leading unit \(r_b\) is the inverse of the coefficient of \(t_b\)
in \(\psi_6\). The last equality is reciprocity over the fully split field.
Outside the support all entries are units. This specifies every finite row,
not merely an unspecified assertion that the rows vanish. The owner class is

\[
 S_a=\frac16\left(6\{\rho,f_a\}+
          \sum_{b\neq O}\{f_b,c_{a,b}\}\right).
\]

The three \(a\) are the images, in the fixed ER.5 uniformization, of
\(1/6,(5+4\tau)/6,(3+2\tau)/6\). Sum the three classes and descend by
\(N/[L:\mathbb Q]\). E.7 choice independence over a number field identifies
the result with ER.5's \(U\). Individual summands are not claimed to descend.
The CM.1/CM.2 requests supply the matching algebraic point coordinates,
orientation and torsion-level action. Until those interfaces are supplied,
this is a full symbolic certificate schema rather than a printed coordinate
table for the 105 finite rows and three infinity rows. It is a horizontal
certificate; the global
vertical condition is separate.

### `cm36-corrected-l-value`

The CM setup and character belong to ER.5. For this twist they give
\(f=2\sqrt{-3}\), \(g=-\sqrt{-3}\), \(C=6\),
\((\operatorname{Im}\tau)^2=3/4\), and
\(\widehat\chi(\bar g)g=3\). Use its corrected Fourier kernel
\(\langle\text{dual},\text{input}\rangle\) and corrected theorem:

\[
 L(E,2)=\frac{\pi}{324i}R_q(U)
       =\frac{2\pi}{3}\sum_{a}D_E(a).
\]

The sum has three index points. The printed extra factor
\(|\mu_\kappa|=6\) is absent. These are inherited corrections E7–E9 from the
accepted parent; the restricted Bloch book was not rechecked here. ER.4 gives
\(R_q(S_a)=6^3R_q(a)\); the reality of the L-value makes the J-sum zero.

The parent diagnostics are
\(L(E,2)=0.94001300738822578150\ldots\) and
\(L'(E,0)=0.85718907492991773072\ldots\). Its numerical one-point identity
\(L(E,2)=-(2\pi/3)D_E((2,3))\) requires the exact identity between the
three-point sum and \(-D_E((2,3))\). The remaining CM dictionary and
distribution calculation must establish that equality; decimal agreement
does not establish it. This complex identity also does not prove a p-adic
Beilinson relation for \(U\).

## The explicit quadratic symbol

### `quadratic-corrected-symbol`

Let \(L=\mathbb Q(\zeta)\), \(\zeta^2+\zeta+1=0\), with chosen embedding
\(\zeta=e^{2\pi i/3}\). On \(E:y^2=x^3+1\), set
\(T=(2\zeta,3)\), \(A=(0,1)\), \(B=(0,-1)\). The group law gives
\(2T=A\), \(3T=(-\zeta,0)\), \(6T=O\), and \(B=-A\). Define

\[
 \ell=y-2\zeta^2x+1,\qquad m=y-\zeta^2x-1,
\]

\[
 f_T=\frac{\ell^2m^2}{(\zeta^2x)^2(\zeta^2x+1)},\qquad
 f_A=(y-1)^2,\qquad f_B=(y+1)^2.
\]

The tangent and secant factorizations are

\[
 (2\zeta^2x-1)^2-x^3-1=-x(x-2\zeta)^2,
\qquad
 (\zeta^2x+1)^2-x^3-1=-x(x-2\zeta)(x+\zeta).
\]

They give
\((\ell)=2[T]+[B]-3[O]\), \((x)=[A]+[B]-2[O]\), and
\((f_P)=6[P]-6[O]\) for \(P=T,A,B\). In particular, the displayed
function \(f_T\) has the required divisor; it is not merely a choice of some
function with that divisor.

Put \(c_T=1/(4\zeta^2)\), \(c_A=2\), \(c_B=2\zeta^2\). The class is

\[
 \beta=6\{\ell,x\}+\{f_T,c_T\}+\{f_A,2\}+\{f_B,2\zeta^2\}.
\]

The support \(\{T,A,B,O\}\) is a subset of the support allowed in the
parent target. Every row has residue field \(L\). The following table gives
the order and leading unit of each function; notation \((n,u)\) means
\(f=t^n(u+\text{higher terms})\).

| Point; parameter | \(\ell\) | \(x\) | \(f_T\) | \(f_A\) | \(f_B\) | \(\partial\{\ell,x\}\) |
| --- | --- | --- | --- | --- | --- | --- |
| \(T;\ x-2\zeta\) | \((2,\zeta/3)\) | \((0,2\zeta)\) | \((6,1/108)\) | \((0,4)\) | \((0,16)\) | \(1/(4\zeta^2)\) |
| \(A;\ x\) | \((0,2)\) | \((1,1)\) | \((0,4)\) | \((6,1/4)\) | \((0,4)\) | \(2\) |
| \(B;\ x\) | \((1,-2\zeta^2)\) | \((1,1)\) | \((0,16)\) | \((0,4)\) | \((6,1/4)\) | \(2\zeta^2\) |
| \(O;\ -x/y\) | \((-3,-1)\) | \((-2,1)\) | \((-6,1)\) | \((-6,1)\) | \((-6,1)\) | \(1\) |

At \(B\), the sign in the tame symbol changes the leading ratio
\(-2\zeta^2\) to \(+2\zeta^2\). At each finite support point, the
correction contributes \(c_P^{-6}\), cancelling the sixth power of the
uncorrected residue. At infinity it contributes
\((c_Tc_Ac_B)^6=1\). Outside the support the entries are units. Thus all tame
values of \(\beta\) are one.

E.7 supplies the finite-support certificate and E.3 supplies the unique
rational lift from its tame kernel to \(K_2(E_L)\otimes\mathbb Q\). This
construction does not assert global arithmetic integrality. For the suggested
file, `quadraticSymbol` is the raw representative in the existing
`FreeAbelianGroup` on pairs of function-field units. It uses the pinned
elliptic function field and generic coordinates; its projection to the
owner symbol quotient is a separate imported operation.

Its API serves the certificate, transfer and divisor calculation:

- `quadraticFunctionT_val`, `quadraticFunctionA_val`,
  `quadraticFunctionB_val` expose the three actual function-field formulas.
- `quadraticFunctionT_principal` identifies the principal divisor with
  \(6[T]-6[O]\) using Tau Ceti's point places and principal-divisor operation.
- `quadraticSymbol_expand` exposes precisely the four raw terms.
- `quadraticSymbol_map` evaluates them under any additive homomorphism out of
  the free group, using the baseline universal property.
- `quadraticSymbol_certified` is the compatibility with the owner's actual
  quotient and certificate map. Its geometric signature is explicitly absent
  from the current fragment because that map is not in the pinned library.

There are five unit tests:

- `quadratic_function_divisor` checks the principal divisor of the displayed
  \(f_T\), using the nearest existing Tau Ceti operation.
- `quadratic_symbol_tameT_table` evaluates the raw representative by the finite
  T-table \(\{\ell,x\}\mapsto c_T\), \(\{f_T,c_T\}\mapsto c_T^{-6}\), other
  displayed terms to one. The result is one.
- `quadratic_symbol_tameB_table` uses the B-table and obtains one, with the
  uncorrected value \(+2\zeta^2\).
- `quadratic_symbol_infinity_table` obtains \(c_T^6c_A^6c_B^6=1\).
- `quadratic_uncorrected_nonexample` obtains \(c_T\neq1\) for
  \(\{\ell,x\}\) alone.

The table evaluations are honest homomorphisms on the raw free group. Their
agreement with geometric tame values comes from the explicit leading-unit
calculation above. They do not assert that an arbitrary evaluator on all
pairs of units is the K2 tame map. Dropping the factor six, reversing a
correction constant, or omitting the B sign fails these tests.

### `quadratic-transfer-certificate`

Conjugate by \(\zeta\mapsto\zeta^2\). Put

\[
 H=\ell\bar\ell=(y+1)^2+2x(y+1)+4x^2,
 \qquad J=m\bar m=(y-1)^2+x(y-1)+x^2,
\]

\[
 F=f_T\bar f_T=\frac{H^2J^2}{x^4(x^2-x+1)}.
\]

The projection formula gives, in \(K_2(\mathbb Q(E))\otimes\mathbb Q\),

\[
 N_{L/\mathbb Q}\beta
 =\gamma=6\{H,x\}+\{F,1/4\}+\{f_A,4\}+\{f_B,4\}.
\]

This identity is rational. Writing \(c_T=\zeta/4\) and splitting
\(c_B=2\zeta^2\) produces root-of-unity symbols killed by three. They are
discarded after rationalization, not assigned zero in integral K2. The
integral transfer itself is certified by the owner's transfer theorem.

Over \(\mathbb Q\), the support is \(Z,A,B,O\), where
\(Z=(x^2+2x+4=0,y=3)\) has residue field \(\mathbb Q(\zeta)\). The divisor
of \(H\) has multiplicity two at each geometric conjugate of \(Z\), and
\(F\) has multiplicity six there. For \(x_0=2\zeta\), the residue of
\(\{H,x\}\) is

\[
 1/x_0^2=1/(4\zeta^2)\in\mathbb Q(\zeta)^\times.
\]

Its norm \(1/16\) is not that residue. The complete cancellation table is

| Point | Residue field; parameter | Uncorrected \(\{H,x\}\) value | Corrected value |
| --- | --- | --- | --- |
| \(Z\) | \(\mathbb Q(\zeta);\ x-x_0\) | \(1/(4\zeta^2)\) | \((1/(4\zeta^2))^6(1/4)^{-6}=1\) |
| \(A\) | \(\mathbb Q;\ x\) | \(4\) | \(4^6 4^{-6}=1\) |
| \(B\) | \(\mathbb Q;\ x\) | \(4\) | \(4^6 4^{-6}=1\) |
| \(O\) | \(\mathbb Q;\ -x/y\) | \(1\) | \((1/4)^{12}4^6 4^6=1\) |

These individual equalities, together with the unit statement off the
support, certify the rational representative. A check of the normed product
alone would not certify it. E.8's existing nonrational-residue example is the
same distinction in another symbol on this curve.

### `quadratic-regulator-trace`

Expanding the chosen diamond gives

\[
 (\ell)\diamond(x)=7[O]+2[T]-5[2T]+2[3T]-2[4T]-4[5T].
\]

Every odd function evaluates this as \(6R_q(T)-3R_q(A)\), since
\(2T=A\), \(4T=-A\), \(5T=-T\), and \(3T\) is two-torsion. The
constant-entry corrections have zero regulator. Therefore

\[
 r_{\rm source}(\beta)(dz)=18\overline{R_q(T)}-9\overline{R_q(A)}.
\]

Use the existing ER.4 constant-field trace theorem for the two embeddings of
\(L\), obtaining

\[
 r_{\rm source}(N\beta)(dz)
  =18\overline{R_q(T)+R_q(\bar T)-R_q(A)}.
\]

For the rational transferred class with the real-adapted differential, the
real part vanishes, so this becomes

\[
 r_{\rm source}(N\beta)(dz)
  =-18i\bigl(D_E(T)+D_E(\bar T)-D_E(A)\bigr).
\]

The individual \(\beta\) regulator need not be purely imaginary. The full
complex identity must precede that simplification. Reversing the diamond
direction changes the odd-regulator sign. Converting this functional into
\(R_\infty\) needs ER.2's factor-two and period comparison. The parent's
decimal values of \(D_E(T)\) and \(D_E(\bar T)\) are checks; no nonvanishing,
arithmetic-integrality or p-adic L-value theorem for \(\beta\) follows from
this calculation alone.

## Arithmetic eligibility and imported examples

### `integral-example-padic-eligibility`

On 11a3, \(E_{11}:y^2+y=x^3-x^2\), import
\(\xi=\{x,y\}+\{-1,x\}\). The parent and E.8 give its horizontal
certificate and its arithmetic-integral certificate on the regular minimal
proper model over \(\mathbb Z\). The discriminant is \(-11\); the bad fibre
is split I1 and irreducible, and \(x,y\) have vertical order zero. This is an
integral input at every good prime \(p>2\), \(p\neq11\), after checking the
refinement and denominator conditions. Its parent source-regulator value is

\[
 r_{\rm source}(\xi)=-\frac{11i}{8\pi}L(E_{11},2)
                     =-\frac{\pi i}{2}L'(E_{11},0).
\]

This value still needs the Deligne-period conversion for the conjectural
relation. No p-adic numerical special-value comparison for this class is
asserted here.

For the negative example \(u=1/3\), on
\(y^2=x(x+1)(x+1/9)\), E.8 gives a horizontally certified class and the model

\[
 3(V^2-Z^2)(W^2-Z^2)+4VWZ^2=0.
\]

At the generic point of \(V=0\) in the fibre at three, its vertical tame
value is \(1/w\in\mathbb F_3(w)^\times\), of infinite order. Every nonzero
rational multiple remains outside the global integral part. The class can
have a local regulator at a different good prime without becoming a global
integral witness. The quadratic \(\beta\) and CM \(U\) likewise need an
independent vertical certificate for a global arithmetic-integral claim.

The completed parent projective-line example and conductor-14/35/54
modular-unit examples are retained by node id. Their mathematical content,
orientation and distinction between exact identities and numerical targets
are imported. They are not new declaration nodes in this part.

## Baseline, acceptance and remaining contracts

The baseline is Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369` and
Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`. The reviewed
EllipticRegulators library audit was read before planning. The sixteen cited
declarations were checked by reading their statements at those commits:

- Mathlib `LinearMap.BilinForm.smul_left` and `.smul_right` supply the
  scalar algebra; `FreeAbelianGroup`, `.of` and `.lift` supply the raw symbol
  and its evaluation interface.
- Mathlib `WeierstrassCurve.Affine.FunctionField` is the actual fraction-ring
  construction; Tau Ceti `WeierstrassCurve.Affine.genericX`, `.genericY`,
  `.equation_genericX_genericY` and `.isFunctionField` supply its coordinates
  and function-field structure.
- Tau Ceti `TauCeti.Divisor.principal` and
  `WeierstrassCurve.Affine.exists_principal_zsmul_pointPlace_sub_infinity`
  supply principal divisors and the already-built torsion-principality
  existence theorem. This part computes a particular function, not that
  general existence theorem again.
- Mathlib `WeierstrassCurve.Ψ` and `.preΨ_even`, and Tau Ceti
  `WeierstrassCurve.zsmul_eq_zero_of_evalEval_ψ_eq_zero` and
  `.evalEval_ψ_eq_zero_of_zsmul_eq_zero`, supply the division-polynomial
  construction and its torsion-zero dictionary. The two Tau Ceti conclusions
  use the Jacobian point obtained from the affine point; that transport is
  retained rather than guessed from their names.

Acceptance requires all thirteen definition/construction tests above, the
complete four-row quadratic and transferred residue certificates, the
six-torsion CM schema with its pole and leading-unit checks, and the corrected
complex scalar. It also requires the Frobenius factor test, the odd quadratic
Gauss test, and preservation of conjectural status. Exact polynomial arithmetic
was independently checked in characteristic zero modulo
\(\zeta^2+\zeta+1\) and \(y^2-x^3-1\), including tangent/secant
factorizations, torsion arithmetic, norm functions, residue cancellations and
the division-polynomial recurrence. That computation supports the example;
the suggested declarations remain planning signatures.

The five requests are explicit in the packet:

1. **D.5:** the actual weight-two good-reduction regulator and cup/trace
   interface, the Coleman symbol comparison, and the full de Rham vector or
   reconstruction algorithm. Its integration step must import Coleman L1.
2. **D.2:** the actual local étale regulator and Bloch–Kato logarithm with the
   target and normalization used by the Frobenius comparison.
3. **Coleman L1:** elliptic constant-term evaluation, primitive-constant
   independence and finite-extension/Galois trace compatibility, with its
   general elliptic pullback hypotheses discharged or retained explicitly.
4. **CM.1:** the matching oriented analytic/algebraic map and coordinates of
   the three index points and the full six-torsion set over \(L\).
5. **CM.2:** the full torsion-level Galois action for this twist and character,
   matching ER.5 and including complex conjugation.

The first gap is the conjunction of the D.5/D.2 and general elliptic Coleman
interfaces. The second is the matching CM coordinate dictionary and exact
reduction of the three-point D-sum to the parent's numerical one-point
formula. The third records the geometric signatures that cannot yet be
expressed against the pinned library. The suggested file names every omitted
map and hypothesis instead of inserting an arbitrary proposition field. The
scalar, predicate, actual function-field data, principal-divisor statement and
raw residue-table tests are supplied as concrete signatures.

The four planets are **Syntomic regulator comparison**, **Frobenius
regulator**, **Corrected torsion symbol**, and **Transfer of a torsion
symbol**. No restructuring is proposed. Promoted prerequisites add the missing
ER.5 and E.6 dependencies from confirmed finding `RT-AREA-ktheory-2/10`, and
the Coleman L1 and modular-symbol L2/L4 dependencies from
`RT-AREA-ktheory-2/11`. The D.5 request also records the missing supplier-side
Coleman dependency; only D.5's owner edits that plan.

## Sources and version discipline

The public sources read for the new comparison are Asakura–Chida
[arXiv v2](https://arxiv.org/pdf/2003.08888v2), §§2.2–2.3 and 3.3–3.4;
their [accepted manuscript](https://eprints.lib.hokudai.ac.jp/repo/huscap/all/91491/Perrin-Riou-conj-v1.pdf),
especially Theorems 2.2–2.3, Conjecture 3.3 and footnote 10; and
Besser–de Jeu [arXiv v1](https://arxiv.org/pdf/1208.0516v1), introduction
pp. 1–4 and Remark 1.10. The packet records URLs, access date 6 October 2026
and SHA-256 hashes of the downloaded public PDFs. The
[published preview](https://link.springer.com/article/10.1007/s40687-023-00374-2)
confirms footnote 10 but does not expose the article's body.

Brunault's [2010 paper](https://pmb.centre-mersenne.org/item/10.5802/pmb.a-125.pdf),
including its logarithmic regulator and §9 examples, was read as a comparison
source. Its measure conventions are not silently identified with the
period-normalized owner distribution. The algebraic examples inherit their
general correction, transfer and regulator theorems from the accepted owner
packets; their new functions, tables and coefficient calculations are given
explicitly here. Restricted book claims remain inherited from the reviewed
parent, with its corrections. The unread Besser II full proof and unread
published body are identified precisely; neither is described as verified.
