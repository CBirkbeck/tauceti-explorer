# ER.3 — The elliptic dilogarithm and its companion

This part completes a target-level planning pass for `EllipticRegulators:ER.3`.
It builds on the reviewed [parent packet](../packets/EllipticRegulators.json),
whose fourteen declarations in this stage retain their identifiers, statements,
APIs and tests. The four declarations added here fill the direct complex Fourier
calculation and the relative projective-line input to the Steinberg argument.
The stage is **planned**, with three explicit gaps and one supplier request;
it is not mathematically closed. All implementation statuses remain unchecked.

The scope includes both real components of Bloch's complex function. The
companion matters for complex regulator values and for changes of lattice
basis. A proof of the real elliptic dilogarithm alone does not give the complex
formula. Conversely, the complex orbit-sum Fourier expansion can be proved
without integrating a singular Green kernel. This distinction keeps the direct
Fourier proof independent of the unresolved analytic step in Brunault's
Proposition 24.

## Conventions and owners

Fix a complex number τ with y = Im τ > 0. Use the oriented lattice
Λ = Z + τZ, the point coordinate z = a + bτ, and

\[
 q=\exp(2\pi i\tau),\qquad x=\exp(2\pi iz).
\]

The positive intersection pairing is ⟨1,τ⟩ = 1. A lattice vector is
λ = m + nτ, whereas the point is a + bτ. Its character is

\[
 \chi_{m,n}(a,b)=\exp(2\pi i(mb-na)).
\]

All circle measures in the Fourier calculation have total mass one. A
coefficient uses the conjugate of this character. Thus the usual horizontal
Fourier index is −n, and the vertical index is m. In particular, the source's
notation z = ξτ + η translates to b = ξ and a = η; its lattice index mτ+n
translates by exchanging the two integer index names. This exchange must be
made in the character as well as the denominator.

The complex analytic elliptic curve, its uniformisation and the period/homology
comparison belong to ER.1, through
`EllipticRegulators:ER.1/complex-uniformisation`,
`EllipticRegulators:ER.1/the-q-parameter-and-the-multiplicative-presentation`
and `EllipticRegulators:ER.1/periods-and-the-comparison-isomorphism`.
The accepted RS-06 boundary makes the general uniformisation an import from
`ModularCurvesPartII:R12.1`. This part constructs no second uniformisation.
The ordinary polylogarithm and Bloch–Wigner function belong to Polylogarithms
P.1. Chow dilogarithms and their current identities belong to P.5. Symbols,
tame symbols and Matsumoto's presentation remain K2SymbolsBrauer's. General
normalized Green kernels belong to GrossZagierAndArithmeticHeights GZ.2.

The reviewed library audit for ER.3 reports that the elliptic orbit sums and
their Kronecker descriptions are missing. Source inspection confirms that the
pinned libraries contain the analytic infrastructure but not these functions.
The existing Bernoulli Fourier formula is a further useful baseline discovery:
it is used directly below, with no new Bernoulli-polynomial theory planned.
The upstream EllipticCurves and ModularForms roadmap documents were read for
scope, precision and the distinction between an API and an endpoint theorem.

## The imported orbit sums

Write D for Polylogarithms P.1's Bloch–Wigner dilogarithm. For |w| < 1, away
from zero, its convention is

\[
 D(w)=\operatorname{Im}\operatorname{Li}_2(w)
       +\log|w|\,\arg(1-w).
\]

It extends continuously to the projective line with value zero at 0, 1 and ∞.
The inversion relation is D(w⁻¹) = −D(w), and conjugation negates D. These are
imports, not new definitions in this packet.

The existing declaration
`EllipticRegulators:ER.3/the-elliptic-dilogarithm` defines

\[
 D_q(x)=\sum_{r\in\mathbb Z}D(xq^r),\qquad x\in\mathbb C^\times.
\]

The parent node `bloch-wigner-bounds-at-zero` supplies, for |w| ≤ 1/2,

\[
 |D(w)|\leq 2|w|(1+|\log|w||),\qquad
 |J(w)|\leq 2|w|\,|\log|w||,
 \quad J(w)=\log|w|\log|1-w|.
\]

For a compact annulus r₀ ≤ |x| ≤ R₀ and fixed q, these bounds control the
positive orbit tail by C(N+1)|q|ᴺ. Inversion controls the negative D tail by
the same kind of bound. The constant depends on the compact annulus and q,
not on x or N. The finitely many middle terms are continuous. This proves
normal convergence on compact subsets of C×, continuity, and legitimacy of
reindexing the D sum. No uniform assertion as |q| tends to one is made.

Consequently D_q(qx) = D_q(x) and D_q(x⁻¹) = −D_q(x).
Conjugation takes (q,x) to (q̄,x̄) and negates the value. In additive notation,
for a nonzero integer N the distribution relation is

\[
 D_{E,\eta}(NP)=N\sum_{Q\in E[N]}D_{E,\eta}(P+Q).
\]

The ordinary distribution relation, followed by absolutely justified orbit
reindexing, supplies this API. For a real elliptic curve the normalized
orientation of its real locus determines D_E; reversing that orientation
negates it. The reviewed parent owns this whole API and its examples.

Acceptance checks retained from that node include q-periodicity, inversion,
conjugation, the ordinary-polylogarithm degeneration as q tends to zero, and
vanishing on real x when q is real. The zero and two-torsion values also follow
from oddness on the torus. These checks are interpreted with the chosen
uniformisation, rather than with an unspecified isomorphism of complex tori.

## Two companions and a complex function

The existing construction
`EllipticRegulators:ER.3/the-companion-and-Bloch-convention` distinguishes
three functions. First extend J by J(0) = J(1) = 0. Bloch's uncorrected
companion on C× is

\[
 J_q^{\rm B}(x)=\sum_{r\geq0}J(xq^r)
                  -\sum_{r\geq1}J(q^r/x).
\]

Both one-sided sums converge. The two-sided sum of J(xqʳ) is not used: at the
large arguments its logarithmic growth prevents convergence. With
L = log|x| and ℓ = log|q| < 0, the inversion formula for ordinary J gives

\[
 J_q^{\rm B}(qx)-J_q^{\rm B}(x)=-L^2,
 \qquad J_q^{\rm B}(x^{-1})+J_q^{\rm B}(x)=L^2.
\]

This companion is therefore a function of a lift, with a controlled defect.
The elliptic companion is

\[
 \mathcal J_q(x)=J_q^{\rm B}(x)+\frac{\ell^2}{3}B_3(L/\ell),
 \qquad B_3(t)=t^3-\tfrac32t^2+\tfrac12t.
\]

The polynomial is Mathlib's Bernoulli polynomial with its usual B₁ = −1/2
convention. Its shift B₃(t+1)−B₃(t)=3t² cancels the defect. Its inversion
identity B₃(−t)=−B₃(t)−3t² cancels the inversion square as well. Hence

\[
 \mathcal J_q(qx)=\mathcal J_q(x),\quad
 \mathcal J_q(x^{-1})=-\mathcal J_q(x),\quad
 \mathcal J_{\bar q}(\bar x)=\mathcal J_q(x).
\]

The parent API includes the ordinary formula, both convergent one-sided sums,
the shift defect, the Bernoulli equality, descent to the torus, and the
permitted-divisor comparison. The last statement has essential hypotheses:
for divisors represented by α_j,β_k with integer weights d_j,e_k, both degrees
are zero and both weighted products of lifts equal one. Evaluating on the
diamond α_j⁻¹β_k then kills the Bernoulli correction. Expand its cubic in
log|β_k|−log|α_j|: the degree terms and the mixed terms vanish using the two
weighted logarithmic sums. Arbitrarily moving a single lift by q need not
preserve these conditions, and need not preserve the uncorrected evaluation.

Bloch's complex convention in this roadmap is

\[
 R_q(x)=\mathcal J_q(x)+iD_q(x),\qquad
 F_q(x)=D_q(x)-i\mathcal J_q(x)=-iR_q(x).
\]

These identities pin both the order and the sign of the two components. At
τ = 0.23+1.05i and (a,b) = (0.31,0.17), the inherited numerical checks are
D_q(x) ≈ 0.502940259517639, J_qᴮ(x) ≈ −0.242027754937798 and
𝒥_q(x) ≈ 0.433523077962249. The Bernoulli term is visible here; omitting it
changes the complex formula. Another discriminatory check is
J_qᴮ(qx)−J_qᴮ(x) ≈ −1.25787121131. On the real locus, under the parent's real
normalization, the elliptic companion vanishes. It does not follow that the
uncorrected lift function is globally periodic.

## The new weight-two kernel and its API

The construction
`EllipticRegulators:ER.3/weight-two-kronecker-kernel` proposes
`TauCeti.EllipticRegulator.kroneckerTerm`. Define

\[
 K_\tau(a,b;m,n)=
 \begin{cases}
 0,&(m,n)=(0,0),\\
 \displaystyle\frac{\chi_{m,n}(a,b)}{(m+n\tau)^2(m+n\bar\tau)},&\text{otherwise}.
 \end{cases}
\]

The definition is a summand. Summability is a theorem with y > 0 as a
hypothesis. That hypothesis ensures the only zero denominator occurs at the
excluded index, by taking imaginary parts of m+nτ = 0. The proposed API is
sized from the Fourier reconstruction, the basis-change formula and ER.4–ER.5's
use of divisor and torsion characters:

| Declaration suffix | Contract and use |
| --- | --- |
| `kroneckerTerm_zero` | Evaluation at (0,0) is zero; no singular lattice term enters a sum. |
| `kroneckerTerm_eq` | For a nonzero index, the displayed character/denominator equality. |
| `kroneckerTerm_norm` | For y > 0 and nonzero index, the norm is |m+nτ|⁻³; supplies the uniform majorant. |
| `kroneckerTerm_neg_index` | Negating the index gives −conjugate(χ)/(λ²λ̄); at zero both sides are zero. |
| `kroneckerTerm_neg_point` | K(−a,−b;v)=−K(a,b;−v); supplies oddness after reindexing. |
| `kroneckerTerm_add_int_left` | Adding an integer to a preserves every summand. |
| `kroneckerTerm_add_int_right` | Adding an integer to b preserves every summand. |
| `kroneckerTerm_circle` | The character equals the product of Mathlib circle characters of indices −n and m. |

The last contract is an equality with the closest existing Fourier object,
not a replacement torus-character theory. In particular it allows the baseline
Fourier coefficient and Hilbert-basis infrastructure to be used directly.

The six tests, also present as examples in the suggested file, are exact.
At τ = i and a = b = 0, the zero index gives 0, (1,0) gives 1, (0,1) gives −i,
and (2,0) gives 1/8. The value −i distinguishes which factor is conjugated;
1/8 distinguishes this kernel from a Green coefficient of order |λ|⁻².
At τ = i, a = 1/4,b = 0, the index (0,1) gives −1, which detects the sign
of the horizontal character. At a = 0,b = 1/4 the index (1,0) gives i,
agreeing with Mathlib's positive circle character at a quarter turn. These
are not accuracy claims from floating-point evaluation.

## Direct complex Fourier coefficients

The theorem
`EllipticRegulators:ER.3/complex-fourier-coefficient-calculation` proposes
`TauCeti.EllipticRegulator.complex_fourier_coefficients`. For the imported
continuous periodic function F_τ(a,b)=F_q(x(a,b)), it asserts

\[
 \int_0^1\!\int_0^1
 F_\tau(a,b)\overline{\chi_{m,n}(a,b)}\,da\,db
 =\begin{cases}
 0,&m=n=0,\\
 -\displaystyle\frac{y^2}{\pi(m+n\tau)^2(m+n\bar\tau)},&\text{otherwise}.
 \end{cases}
\]

This proof follows the unfolding method in Zagier's Theorem 1, with the
weight-two coefficients recalculated rather than imported from its printed
statement. It simultaneously supplies the real dilogarithm and the imaginary
companion coefficient. The following calculation makes the convention
checkable without relying on a numerical match.

For |w| < 1, the ordinary series give

\[
 D(w)-iJ(w)=\sum_{h\geq1}
 \left(\frac{w^h-\bar w^h}{2ih^2}
              +\frac{i\log|w|}{h}w^h\right).
\]

Split the orbit into u=b+r > 0 and u < 0. On the negative half-line, inversion
turns the D and J terms together into the negative of this disc expression
at w⁻¹. For horizontal index h > 0, averaging over a gives

\[
 \begin{array}{ll}
 -i\left(\frac1{2h^2}+\frac{2\pi yu}{h}\right)e^{2\pi ih\tau u},
       &u>0,\\[2mm]
 -\frac{i}{2h^2}e^{2\pi ih\bar\tau u},&u<0.
 \end{array}
\]

Multiplication by the vertical coefficient character e⁻²πⁱᵐᵇ survives the
unfolding because m is an integer. Put A = hτ−m and B = hτ̄−m. The two
half-line integrals are evaluated using

\[
 \int_0^\infty e^{2\pi iAu}du=-\frac1{2\pi iA},\quad
 \int_0^\infty ue^{2\pi iAu}du=\frac1{(2\pi iA)^2},\quad
 \int_{-\infty}^0 e^{2\pi iBu}du=\frac1{2\pi iB}.
\]

Their sum simplifies to y²/(πA²B). Since the kernel's horizontal index is
−n=h, this is −y²/(πλ²λ̄). Oddness gives the coefficients for h < 0.
For h = 0 the disc-series terms have zero horizontal average, leaving

\[
 -i\frac{4\pi^2y^2}{3}B_3(b).
\]

The pinned theorem `bernoulliFourierCoeff_eq` gives

\[
 \int_0^1 B_3(b)e^{-2\pi imb}db
 =-\frac6{(2\pi im)^3}\quad(m\ne0),
 \qquad \int_0^1B_3(b)db=0.
\]

Thus these coefficients are −y²/(πm³), including the Bernoulli mode that
Brunault's real-part argument alone does not identify. This coefficient also
fixes the sign before any regulator or special-value comparison is made.

Every exchange here has an explicit integrability obligation. On a compact
substrip 0 < ε ≤ b ≤ 1−ε, use geometric uniform convergence. Over the full
strip, unfold each absolute disc-series term: the integrals of e⁻²πʰʸᵘ/h²
and u e⁻²πʰʸᵘ/h are bounded by constant multiples of h⁻³. Their sum is finite.
The finitely excluded boundary values have measure zero, and the full
orbit-sum function is continuous there. Apply the baseline integral/sum theorem
only after checking each summand's integrability and the summability of the
integrals of its norm. This avoids an unsupported exchange at x = 1.

## Reconstruction, the origin and basis change

The comparison
`EllipticRegulators:ER.3/complex-fourier-reconstruction` proposes
`TauCeti.EllipticRegulator.complex_fourier_reconstruction` and establishes

\[
 F_\tau(a,b)=-\frac{y^2}{\pi}\sum_{m,n}K_\tau(a,b;m,n),\qquad
 R_q(x)=-\frac{iy^2}{\pi}\sum_{m,n}K_\tau(a,b;m,n).
\]

Identify the integer-coordinate lattice with the existing `PeriodPair.lattice`
for (1,τ). It is discrete of rank two. The baseline theorem
`ZLattice.summable_norm_rpow` applies with exponent −3, strictly below −2.
The kernel norm is independent of the point, so the series converges absolutely
and uniformly on the whole torus. It defines a continuous function and its
coefficients may be integrated termwise against characters; the area-one
integrals of norms are bounded by the same summable majorant.

To identify the two continuous functions, subtract their matching
coefficients. For each horizontal index, its coefficient is a continuous
function of b all of whose circle coefficients vanish. The baseline
`fourierBasis_repr` identifies these with the coordinates of a Hilbert-basis
isometry, which is injective. Consequently that function vanishes in L²,
and continuity makes it vanish everywhere. Apply the same argument in a.
This uses existing one-dimensional Fourier theory twice, without inventing
an unverified product-basis declaration.

At the origin χ = 1. Pairing v and −v in the absolutely convergent sum gives
zero. The formula therefore includes the origin and all two-torsion points;
no regularisation of this weight-two kernel is needed. A standard-library
numerical calculation at the point above gave a 400-square cutoff
0.502940257579898−0.433523075730731i, within 3×10⁻9 of the orbit sums.
The finite calculation checks the sign and scale; the majorant and Fourier
uniqueness prove the identity.

This direct proof supplies the equality in the imported
`fourier-and-kronecker-eisenstein` target, replacing its dependency on an
unread passage of Bloch's Lecture 10 for this purpose. It does not decompose
the finite-torsion transform and K₂-class computations of ER.4–ER.5.

The existing `lattice-basis-change` node states that, for γ in SL₂(Z) with
bottom row (c,d), τ′=γτ and z′=z/(cτ+d),

\[
 R_{\tau'}(z')=\frac{R_\tau(z)}{c\bar\tau+d}.
\]

The complex character is unchanged by the corresponding integral lattice
reindexing. The denominator rescales with λ′=λ/(cτ+d), while
Im τ′=y/|cτ+d|². Substitution gives precisely the displayed antiholomorphic
factor. This is why D_q alone generally mixes with the companion under a
basis change. The imported node owns its transformation API and acceptance
checks; this part's kernel exposes the factors needed to apply them.

## The projective-line input and both Lecture 9 limits

The new theorem
`EllipticRegulators:ER.3/relative-projective-line-chow-bridge` proposes
`TauCeti.EllipticRegulator.relative_projective_line_steinberg`. Let f be a
nonzero rational function, regular at 0 and ∞, with f(0)=f(∞)=1. Take
K≠0,1 and g=K−f nonzero. Its divisor and that of f have finite supports in
C×, say div(f)=Σd_j[α_j] and div(g)=Σe_k[β_k]. The assertion is

\[
 \sum_{j,k}d_je_kD(\beta_k/\alpha_j)=0.
\]

The endpoint normalization implies Σd_j=0 and Π α_jᵈʲ=1. These are the
conditions used for permitted lifts in the truncation argument. The proof
starts with F=f/K and 1−F=g/K and uses the already planned real Chow
dilogarithm

\[
 P_2=-\frac1{2\pi}\int r_2.
\]

Goncharov's constant-invariance theorem makes the two scalar divisions
irrelevant. The corrected P.5 Steinberg identity with third entry t gives
P₂((1−F)∧F∧t)=D(F(0))−D(F(∞))=0. Reversing the first two entries still gives
zero. The projective-line Chow formula evaluates the remaining quantity as
Σd_j e_k D(α_j/β_k): the cross-ratio convention
r(∞,0,1,z)=z gives r(α,β,0,∞)=α/β, and degenerate terms vanish.
Inversion negates this sum and yields the roadmap's β/α diamond convention.
This argument is relative to 0 and ∞ and uses no elliptic Steinberg relation.

The source's Lemma 6.9 misses a factor 2π, and its displayed integral
normalization is imaginary. The parent Polylogarithms issues E11 and E12
already record and correct these problems. This part imports those corrected
nodes. It does not build a second Chow dilogarithm, a conjectural strong
reciprocity homomorphism, or a general theory of regulator currents.

The parent `steinberg-relation-on-the-projective-line` also supplies the
ordinary J relation through tame symbols. The new bridge fills its generic
D-input. The subsequent elliptic argument is retained in the following
existing nodes:

| Parent node suffix | Role in the limiting argument |
| --- | --- |
| `truncated-theta-products` | Form F_N from the factors with |r|≤N on annuli A_N; bound exterior zeros and choose comparison annuli. |
| `zeros-of-truncated-products` | Locate simple zeros and poles in translated small circles and control the remaining divisor's degree and logarithmic moment. |
| `companion-truncation-estimates` | Bound exterior J contributions; compare J_{F_N} with J_{F,q}, retaining the linear N C_F correction; supply a logarithmic continuity modulus. |
| `steinberg-for-the-companion` | Apply the projective-line J relation and let the interior comparison and exterior error tend to zero. |
| `steinberg-for-the-dilogarithm` | Run the separate D argument with its two uniform estimates and absolutely convergent orbit sums. |
| `the-steinberg-relation-by-truncation` | Combine the two components and descend through the appropriate K₂-symbol presentation. |

The estimates remain quantitative. On A_{N(1−ε)+R}, the companion comparison
has error O(Nε|q|ᴺᵋ) after its N C_F correction; the dilogarithm comparison
has the same exponential error without that correction. Nearby arguments
satisfy the inherited O(ε|log ε|) continuity bound. Exterior zeros contribute
O(Nε)+O(1), with the degree and logarithmic-moment cancellations used before
taking the limit. These facts are already planned in the reviewed parent and
are not restated as new nodes here.

The endpoint statement is explicit: for every nonzero meromorphic f on E and
constant K for which K−f is nonzero, evaluate either D_q or Bloch's companion
on the permitted-lift divisor diamond div(f)⁻ ∗ div(K−f). Both evaluations
vanish. The degree-zero and product-one lift conditions are retained for the
companion. Therefore R_q vanishes on the Steinberg tensors, and the bilinear
symbol evaluation descends through Matsumoto's presentation to K₂ of the
function field; restriction to the complete curve uses ER.2's symbol-regulator
comparison. A constant K does not add an unexplained tame-symbol term: the
relative J calculation cancels it with the weighted logarithmic moment.
This is the theorem planned by the imported nodes, with the continuity
obligation below still attached to its proof chain.

One obligation remains explicit: the parent source issue E5 records the
reduction to simple zeros and generic K. A complete proof must make weighted
divisor evaluation continuous when roots collide, handle multiplicities, and
account for exceptional constants K=0,1 and constant functions. The bridge
above is intentionally stated for K≠0,1 with supports in C×. It does not
claim that root continuity or the exceptional cases have already been
supplied. This gap consumes both separate Lecture 9 limits, not just J.

## Singular Green kernels and the exact open boundary

The existing `green-function-of-the-curve` node imports the normalized general
kernel from GZ.2. On this torus the canonical volume is
(i/(2y)) dz∧dz̄ and ‖λ‖²=π|λ|²/y. Its Fourier description is

\[
 G_E(P,Q)=-\frac12\sum_{\lambda\ne0}
                 \frac{\chi_\lambda(P-Q)}{\|\lambda\|^2}
\]

as a distribution. Its closed form in the strip 0≤b<1 is

\[
 \frac12 B_2(b)\log|q|+\log|1-x|
       +\sum_{r\geq1}\log|(1-q^rx)(1-q^r/x)|.
\]

The normalization requires a mean-zero real kernel, symmetry, a logarithmic
singularity with coefficient one, and the current identity
∂∂̄G(P,·)=πi(vol−δ_P). The GZ.2 request also requires smoothness of the
logarithmic remainder and the local derivative bound O(1/r). This supplies
G(P,·) in every finite Lᵖ and its antiholomorphic derivative in Lᵖ for p<2.
No suitable declaration-sized GZ.2 supplier node was found. General existence
and normalization remain at that supplier boundary.

The imported `goncharov-function-and-the-regulator` forms

\[
 R_\omega(P,Q)=\int_E G_E(P,t)\,\omega_t\wedge\bar\partial_tG_E(Q,t),
 \qquad\omega=dz.
\]

Its target Fourier expression is

\[
 R_\omega(P,Q)=\frac{iy^2}{2\pi}
       \sum_{\lambda\ne0}\frac{\chi_\lambda(P-Q)}{\lambda\bar\lambda^2}.
\]

This final series is absolutely convergent. The preceding Green series is
not: its absolute radial partial sums grow logarithmically. Brunault's
Proposition 24 exchanges sums and an integral without an adequate argument,
as recorded by parent issue E2. The derivative singularity 1/r is not in
L², so ordinary L² Parseval does not justify the pairing.

An exact route to closure is recorded. Insert the Gaussian multiplier
exp(−δ‖λ‖²). For δ>0 the smoothed series and derivatives allow legitimate
integration. Prove convergence of the smoothed Green kernels in L³ and of
the smoothed antiholomorphic derivative in L³ᐟ². Hölder's inequality then
passes their product integrals to the limit. Alternatively supply the exact
H¹ᐟ²/H⁻¹ᐟ² duality argument. The local bounds just requested do not by
themselves prove this approximation theorem. Dominated convergence for the
final |λ|⁻³ series finishes the comparison once that analytic input is proved.
Until then, this packet records a gap rather than pretending the Gaussian
factor alone closes the proof.

With the pairing expression established, conjugating the direct Fourier
formula and reindexing λ↦−λ gives

\[
 2R_\omega(P,0)=-\overline{R_q(x)}
                 =-\mathcal J_q(x)+iD_q(x).
\]

This fixes Brunault's convention and supplies the input for ER.4's divisor
formula. The claim about the actual Green integral remains conditional on the
recorded analytic closure. The direct orbit-sum Fourier theorem does not share
that dependency.

## Sources, the recorded correction and acceptance

The public sources read on 2026-10-06 are [Zagier's author-hosted typeset
scan](https://people.mpim-bonn.mpg.de/zagier/files/doi/10.1007/BF01453591/fulltext.pdf),
§§1–2 through p. 620; [Brunault's thesis, arXiv
v1](https://arxiv.org/pdf/math/0602186v1), §§1.1–1.2; and [Goncharov's
arXiv v3](https://arxiv.org/pdf/math/0207036), Theorem 3.4, Proposition 6.8,
Lemma 6.9 and their relevant proofs. Their file hashes and exact sections are
in the packet. Bloch's CRM Monograph 11 full text and the chapter endpoints
for Lectures 5, 6 and 10 refused public retrieval. The parent packet contains
reviewed excerpts from its earlier scan; this run does not claim to have read
those book chapters. The public proofs above replace the missing book inputs
for the newly planned Fourier and relative projective-line statements.

New source issue `EllipticRegulators/E-ER3-1` concerns only weight two in
Zagier's Theorem 1 on p. 619. The definitions on pp. 617–618 give
D₁,₂(q;x)=2(𝒥+iD) and D₂,₁(q;x)=2(𝒥−iD). With the character printed in that
theorem, its weight-two formula requires a minus sign and an exchange of the
two denominator exponents. There is an exact short certificate: averaging
D₁,₂ over η leaves (8π²y²/3)B₃(ξ). Its frequency-one coefficient is
−2iy²/π, whereas the printed theorem's (m,n)=(0,1) term gives +2iy²/π.
The nonzero horizontal calculation above checks the required exponent order.
No finding about other weights is asserted. The source is identified as the
specific author-hosted typeset scan; an attached correction was not located
in the author's publication list or exact-title erratum searches. The
independent review must verify this finding at the recorded version.

The p. 616 sine-formula sign is already parent issue E6, so it is used in
corrected form and not registered again. The Bernoulli polynomial on that
page has the correct quadratic denominator 2; it is not a new source issue.
The parent companion assertion E3 is supplied by the direct complex Fourier
calculation. E2 and E5 remain the two genuine proof gaps described above.

Acceptance for this planning pass requires the four new declarations to have
acyclic direct dependencies, exact statements and evidence; all fourteen
parent targets to be mapped without duplicated identifiers; all eight new
kernel API items and six discriminatory tests to appear in the suggested
file; and the pinned baseline statements to match the uses here. In addition
to the eleven baseline citations, the unchanged parent chains carry their own
reviewed baseline and cross-roadmap dependencies. The packet checker reports
no errors or warnings. The suggested file records only proposed forms; its
elaboration result is recorded in the handoff. The three planets selected
here are the Kronecker–Eisenstein kernel, elliptic Kronecker expansion and
relative Steinberg relation. The assembly retains the parent's central
orbit-sum planets and reconciles the total per-layer limit.

A follow-up closes the GZ.2 request, the regularised Green-pairing convergence,
and the multiple-root/exceptional-constant reduction. Source collation with
Bloch's publicly accessible text also remains recorded. Those refinements do
not require re-planning the orbit-sum definitions, ordinary polylogarithms or
Bernoulli Fourier theory.
