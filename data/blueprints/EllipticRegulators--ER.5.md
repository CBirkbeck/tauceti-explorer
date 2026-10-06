# ER.5 — The complete CM example of Bloch

This part completes the target-level plan left open by the accepted
EllipticRegulators packet. Its scope is exactly `EllipticRegulators:ER.5`.
All eight parent declarations retain their identifiers. Ten new declarations
supply the missing convention, conductor-fiber, orbit and principal-ideal
normalization arguments, together with a named Gauss coefficient and worked
examples. The packet is **complete**, and the stage is **planned**. The six
owner requests below prevent a claim of library closure. Every declaration
has implementation status unchecked.

The target is a specified rational K₂ class with nonzero regulator and an
explicit relation to $L(E,2)$. The stage does not establish that this class
spans K₂, or prove injectivity of the regulator. Integrality belongs to ER.6.

## Objects and owner boundaries

Let $E/\mathbb Q$ have CM by the **maximal** order
$O=O_\kappa=\mathbb Z+\mathbb Z\tau$ of an imaginary quadratic field.
Fix the embedding with $y=\operatorname{Im}\tau>0$ and an oriented analytic
uniformization $E(\mathbb C)\simeq\mathbb C/\Omega O$. Here the field has
class number one. The possible maximal-order discriminants are
$-3,-4,-7,-8,-11,-19,-43,-67,-163$. Rational j-invariants of nonmaximal
orders do not satisfy this plan's hypothesis.

`ComplexMultiplicationAndExplicitReciprocity:CM.1` supplies the CM action,
order and ideal-lattice interface. `CM.4` supplies the Hecke character,
conductor and Frobenius identities. ER.5 consumes their maximal-order,
class-number-one specialization; it constructs neither a second character
nor a second Deuring theory. This is the resolution of
**RT-AREA-ktheory-2/5**. The packet proposes the explicit CM.1→ER.5 and
CM.4→ER.5 edges. CM.2 supplies the torsion reciprocity action used for descent.

In Bloch's convention, the incoming character satisfies

\[
\psi((h))=\bar h\,\chi(h),\qquad
\chi:(O/fO)^\times\longrightarrow\mu=O^\times,
\qquad \chi(\zeta)=\zeta\quad(\zeta\in\mu).
\]

The finite character has exact conductor $fO$, obeys
$\chi(\bar x)=\overline{\chi(x)}$, and its conductor ideal is stable under
conjugation: **$\bar fO=fO$**. This is an equality of ideals, not of
chosen generators. In the Gaussian example $f=2+2i$ is not real.
The parent's `cmHeckeCharacter_conductor` API must be read in this ideal-level
form at assembly.

CM.4 exports ψ in the already existing
`TauCeti.MultiplicativeIdealWeight κ` carrier, with value zero at the zero
ideal and at ideals divisible by a conductor prime. On the other ideals,
$\lvert \psi(I)\rvert =N(I)^{1/2}$. Its infinity type for the chosen embedding is
$(0,1)$; conjugating the embedding conjugates that convention. Deuring's
comparison must identify every local factor with the pinned
`WeierstrassCurve.LSeries`, including the factor 1 at bad additive primes.
The conductor is $N_E=\lvert \operatorname{disc}\kappa\rvert N(f)$. Matching only good
split primes does not supply the required comparison. A twist of E selects
its own finite character and conductor.

For rational descent, the selected Bloch model and its uniformization
must also carry complex conjugation to $z\mapsto\bar z$ on $\mathbb C/O$.
This real-structure compatibility is part of the CM.1/CM.2 input. An
abstract complex homothety $\mathbb C/\Omega O$ does not by itself prove
that assertion for every rational twist: its transported conjugation can
include the unit $\bar\Omega/\Omega$. The finite analytic identity below
holds independently of this compatibility; rational U and the
pure-imaginary regulator conclusion use it explicitly. A twist with a
different transported action must be treated using that actual action.

Choose a rational integer $C\geq1$ and nonzero $g\in O$ with $C=fg$.
On $O/CO$, extend χ by reduction modulo f on residues invertible modulo f,
and by zero on the other residues. Put

\[
W=\{x\in O/CO:x\bmod f\text{ is invertible}\}.
\]

This is the index set throughout. It equals $(O/CO)^\times$ precisely when
every prime of g also divides f. Using W allows arbitrary permitted C.

The parent and `EllipticKTheory:E.7/bloch-classes` supply
$S_{x/C}\in K_2^T(E_L)\otimes\mathbb Q$, where
$L=\kappa(E[C])$, with $S_0=0$. Write
$R_C(x)=R_q(S_{x/C})$, $q=e^{2\pi i\tau}$.
All classes in a distribution identity are built using the **same C**.
In particular a point written $x/f$ does not instruct a change to a
Bloch class built at level f. The imported normalization is
$R_C(x)=C^3R_q(x/C)$.

## Imported declarations and their interfaces

These are imports from `research/blueprint/packets/EllipticRegulators.json`,
not new nodes of this part:

| Parent identifier after `EllipticRegulators:ER.5/` | Retained content |
| --- | --- |
| `the-CM-setup-and-the-hecke-character` | Incoming CM datum, finite character and all-factor Deuring comparison; CM.1/CM.4 own their construction. |
| `the-class-U` | The specified W/μ sum, equivariance, rational descent and tests. |
| `the-L-value-theorem` | The corrected final identity; the normalization certificate below supplies its proof. |
| `nonvanishing-and-what-is-not-claimed` | U has nonzero regulator and is nonzero; the spanning conjecture remains unproved. |
| `fourier-transform-on-O-mod-C` | The specialized transform, pairing, inversion, Parseval and coordinate tests. |
| `lattice-sum-form-of-theorem-10-2-1` | The corrected C⁴ lattice identity and oddness. |
| `cm-twisting-and-distribution` | Unit twisting and same-level CM distribution. |
| `fourier-transform-of-the-character` | Primitive conductor support and covariance. |

The construction APIs remain named as follows. The incoming CM setup exports
`cmHeckeCharacter`, `cmHeckeCharacter_conductor`, `cmFiniteCharacter_conj`,
`deuringComparison`, `deuringComparison_badPrimes`, `cm_maximal_order`.
Its inherited tests are `deuring_32a2` $(a_5=-2,a_{13}=6)$,
`deuring_bad_prime_32a2` (factor 1 at 2), `not_from_endomorphisms`
$$x^3-x$ versus $x^3+x$, conductors 32 and 64$, and `cm_fields_over_Q`
(the nine maximal discriminants). These are owner interface tests, not
proofs of Deuring from an analytic torus.

The class API exports `cmCharExtend`, `blochClassU`,
`blochClassU_summand_orbit`, `blochClassU_galois_invariant`,
`blochClassU_descends`, `blochClassU_rational`.
Its tests are `blochClassU_Qi_C4`, `blochClassU_zero_point`,
`blochClassU_descends_test`, `blochClassU_index_set`.
The rational descent inverse is norm divided by $[L:\mathbb Q]$;
restriction and norm do not give integral descent. The actual Galois image
acts through the ray representation $y/C\mapsto z^{-1}\chi(z)y/C$.
No equality of that image with the entire ray class group is required.

The Fourier API exports `pairingO`, `pairingO_swap`, `pairingO_mul_left`,
`fourierO`, `fourierO_inversion`, `fourierO_eq_finiteFourier10`,
`fourierO_parseval`. Its tests are `pairingO_lemma_11_1_4`,
`fourierO_chi_Qi`, `fourierO_normalisation`, `fourierO_printed_kernel`,
`fourierO_output_index`. The generic finite abelian character theory remains
`AdditiveCombinatorics:AC.0`; ER.4 supplies its torsion adapter. The reviewed
ER.4 direct analytic proof is an input, whereas its final theorem is not a
premise of that analytic proof.

## Fourier convention and the C⁴ factor

The new comparison `dual-first-fourier-comparison`
(`dualFirstFourierComparison` in the suggested file) pins

\[
B(a+b\tau,k+\ell\tau)=e^{2\pi i(-a\ell+bk)/C},\qquad
H_F(x)=\frac1C\sum_{z\in O/CO}F(z)B(x,z).
\]

Thus the coordinate kernel of H is
$e^{2\pi i(a\ell-bk)/C}$. The pairing's arguments are **dual first**.
For the Lecture 10 input $f_{10}(a,b)=F(b+a\tau)$,

\[
H_F(k+\ell\tau)=C\widehat f_{10}(k,\ell).
\]

The output coordinates stay $(k,\ell)$. Renaming the two input summation
variables is not an output swap. At C=3 and $F=\delta_{(1,0)}$,
$H_F(0,1)=e^{2\pi i/3}/3$ while $H_F(1,0)=1/3$.

`EllipticRegulators:ER.4/direct-regularized-fourier-identity` and
`ER.4/the-regulator-of-the-corrected-classes` then give, for odd F,

\[
\sum_xH_F(x)R_C(x)
 =\frac{iy^2C^4}{\pi}\sum_{w\in O,\,w\ne0}\frac{F(w)}{w^2\bar w}.
\]

The new C comes from replacing the C⁻² transform by C⁻¹; C³ comes from the
class regulator. Absolute convergence is imported from the reviewed direct
ER.4 calculation. The sine kernel obtained by inversion is
$\sin(2\pi(bm-an)/C)$ for $x=a+b\tau,w=m+n\tau$.

The printed (11.1.1) uses the opposite kernel, replacing H(x) by H(−x).
For odd F that is −H(x). Hence its weighted identity has the negative sign.
This is inherited, confirmed source issue **EllipticRegulators/E7**.
This part neither copies the parent's erratum nor claims a new collation of
its original scan.

## The CM Gauss coefficient and its API

The one new definition, `cm-gauss-coefficient`, is

\[
\Gamma_C(F,g)=gH_F(\bar g\bmod C).
\]

It is a complex-linear scalar for arbitrary finite weights F. Its geometric
use is $F=\chi$. The raw definition does not construct a Hecke character;
its CM norm assertions require the full primitive datum above.

| API declaration | Statement and use |
| --- | --- |
| `cmGaussCoefficient_apply` | $\Gamma_C(F,g)=gC^{-1}\sum_xF(x)B(\bar g,x)$; finite computation certificate. |
| `cmGaussCoefficient_zero` | Zero weight gives zero; prevents applying the primitive norm statement without hypotheses. |
| `cmGaussCoefficient_add` | $\Gamma(F+G,g)=\Gamma(F,g)+\Gamma(G,g)$. |
| `cmGaussCoefficient_smul` | $\Gamma(cF,g)=c\Gamma(F,g)$; complex coefficients remain outside the sum. |
| `cmGaussCoefficient_changeGenerator` | For $f'=\zeta f,g'=\zeta^{-1}g\$, same C, $\Gamma_C(\chi,g')=\Gamma_C(\chi,g)$. |
| `cmGaussCoefficient_real` | With conjugation and the μ-restriction, $\overline\Gamma=\Gamma$. |
| `cmGaussCoefficient_norm` | For primitive χ, $\lvert \Gamma\rvert =N(g)=C^2/N(f)>0$. |
| `cmGaussCoefficient_oppositeKernel` | For odd F the coefficient using the printed opposite kernel is $-\Gamma$. |

The use-derived API serves the final regulator coefficient, the ER.8 finite
certificates, and the conductor-generator choice mentioned in Bloch's
Remark 11.2.2(ii). Generator independence is not a claim that changing C
preserves the class U or its regulator.

`primitive-gauss-normalization` refines the imported Lemma 11.1.7:
Hχ is supported exactly on
$\bar g\,(O/\bar fO)^\times\subset O/CO$, and

\[
|H_\chi(\bar g)|^2=N(g),\qquad
\Gamma_C(\chi,g)\in\mathbb R,\qquad
\Gamma_C(\chi,g)=\pm N(g).
\]

The proof has three inputs. First, conductor support and covariance say every
allowed coefficient is a root of unity times $H_\chi(\bar g)$.
Lifting a unit modulo the conductor to a unit modulo C uses the finite
quotient/CRT interface of GlobalNumberFields layer 9. Second, pullback from
O/f has N(g) residues per fiber. Therefore χ has squared norm
$N(g)\varphi(f)$, while the allowed support has $\varphi(f)$ elements.
Unitary Parseval gives $\lvert H_\chi(\bar g)\rvert ^2=N(g)$, including nonzero at every
allowed support point. Third, conjugation reverses B and gives
$\overline{H_\chi(w)}=H_\chi(\bar w)$.
As $u=g/\bar g=\bar f/f\in\mu$, covariance yields
$H_\chi(g)=uH_\chi(\bar g)$, which makes Γ real.
Replacing f by ζf changes $\bar g$ by ζ and H by ζ, cancelling the
inverse ζ in g. Taking absolute values never chooses the sign of Γ.

The six definition tests appear by name in the suggested file:

| Test | Discriminating value |
| --- | --- |
| `cmGaussCoefficient_Qi_C4` | $H(1+i)=1+i,\Gamma=2$. |
| `cmGaussCoefficient_Eisenstein_C6` | $H(\sqrt{-3})=\sqrt{-3},\Gamma=3$. |
| `cmGaussCoefficient_Qsqrt7_C7` | $H(\sqrt{-7})=\sqrt{-7},\Gamma=7$. |
| `cmGaussCoefficient_zero_weight` | Γ=0 for the raw zero weight. |
| `cmGaussCoefficient_wrong_kernel` | The Gaussian printed kernel gives Γ=−2. |
| `cmGaussCoefficient_imprimitive` | The trivial unit character modulo $2+2i$, extended by zero at nonunits, gives $H(1+i)=0$. Its character conductor is (1); its zero extension is an indicator prime to $1+i$. It fails primitivity and the embedding on μ. |

The final two tests reject plausible wrong conventions even when a norm-only
calculation might seem to pass.

## Conductor fibers, orbits and rational descent

`conductor-fiber-regulator-evaluation` evaluates
$A_C=\sum_wH_\chi(w)R_C(w)$. Support and covariance rewrite it as

\[
H_\chi(\bar g)\sum_{t\in(O/\bar fO)^\times}\chi(t)R_C(\bar gt).
\]

Apply the imported distribution relation to **$C=\bar f\bar g$**:

\[
R_C(\bar gt)=g\sum_{\nu\in O/\bar gO}R_C(t+\bar f\nu).
\]

The factor is g, not $\bar g$. Each R uses classes built at C, including
the notation for the point $t/\bar f$. The fibers partition W, because
$\bar fO=fO$, and χ is constant on them. Consequently

\[
A_C=\Gamma_C(\chi,g)\sum_{x\in W}\chi(x)R_C(x).
\]

`unit-orbit-regulator-count` supplies the second normalization step. If
ζx=x modulo C with x invertible modulo f, then ζ=1 modulo f. Applying χ
and its restriction to μ proves ζ=1. Thus μ acts freely on W, including
when a member of W is not a unit modulo C. The map
$x\mapsto x\overline{\chi(x)}$ is constant on orbits. Equality of two
images implies $x=(\chi(x)/\chi(z))z$, so it identifies the quotient with
its image. The number of indices is $N(g)\varphi(f)/\lvert \mu\rvert $.

The imported class is exactly

\[
U=\sum_{x\in W/\mu}S_{x\overline{\chi(x)}/C}.
\]

Unit twisting, $R_C(\zeta x)=\zeta^{-1}R_C(x)$, gives
$\chi(x)R_C(x)=R_C(x\overline{\chi(x)})$. Additivity and free orbit sizes
then prove

\[
A_C=|\mu|\Gamma_C(\chi,g)R_q(U).
\]

The ray action permutes the index set: the image of the index for x under z
is the index for $xz^{-1}$. Conjugation also permutes it. The actual Galois
image therefore fixes the sum. `EllipticKTheory:E.7/rational-galois-descent`
and E.3 identify its rational descent in $K_2(E/\mathbb Q)\otimes\mathbb Q$.
Descent is a supplied construction, not a second K-theory target here.

## Ideal L-series and the scalar certificate

`principal-generator-L-series-comparison` makes the lattice/ideal step
explicit. For a conductor-prime-to element a,

\[
\frac{\chi(a)}{a^2\bar a}=\frac{\psi((a))}{N((a))^2}.
\]

Multiplying a by ζ does not change the summand. Every nonzero ideal is
principal, and has exactly $\lvert \mu\rvert $ generators. Absolute convergence permits
regrouping, so

\[
\sum_{a\in O,\,a\ne0}\frac{\chi(a)}{a^2\bar a}
 =|\mu|\sum_{I\ne0}\frac{\psi(I)}{N(I)^2}
 =|\mu|L(2,\psi).
\]

The second equality uses the pinned `TauCeti.LSeries_normCoeff`.
The first equality does not discard ideals above extra primes of C: their
values are controlled by f. Even the ideal (1) illustrates the multiplier:
it has four generators in the Gaussian ring, each contributing 1 to the
element sum, and contributes once to the ideal sum.

The new application `cm-ideal-series-at-two` uses the existing ideal
Euler-product library directly. For $\operatorname{Re}s>3/2$, the CM norm
and `TauCeti.norm_idealTerm` give the majorant
$N(I)^{-(\operatorname{Re}s-1/2)}$.
`TauCeti.summable_absNorm_rpow_ideal_iff` proves its summability, and
`TauCeti.MultiplicativeIdealWeight.LSeries_ne_zero_of_summable_idealTerm`
proves nonvanishing. At s=2 the exponent is 3/2. The weight ψ is not unitary;
applying a bounded-weight theorem directly to it would be invalid.
This eliminates the parent's obsolete ideal-series request and its
natural-number Euler-product near miss. No new generic ideal Euler theory
is planned.

`unit-factor-cancellation-certificate` compares the **same** A_C:

\[
A_C=|\mu|\Gamma R_q(U),\qquad
A_C=\frac{iy^2C^4}{\pi}|\mu|L(2,\psi).
\]

The generator multiplicity cancels the orbit multiplicity, giving the
accepted parent target

\[
\boxed{L(E,2)=\frac{\pi\Gamma_C(\chi,g)}{iy^2C^4}R_q(U).}
\]

This is the correction **EllipticRegulators/E8**. With the printed opposite
kernel, the coefficient is the negative of this dual-first coefficient;
there is still no factor $\lvert \mu\rvert $.
For the rational class, the real companion cancels under conjugation, and

\[
R_q(U)=iC^3\sum_{W/\mu}D_q(e^{2\pi ix\overline{\chi(x)}/C}),\qquad
L(E,2)=\frac{\pi\Gamma}{y^2C}\sum_{W/\mu}D_q.
\]

This uses Bloch's complex regulator. The Deligne regulator in ER.4 is
one half of its conjugate; substituting it without changing the scalar is
wrong. Since the ideal L-value is nonzero and Γ is nonzero, U has nonzero
regulator and is nonzero. Bloch's conjecture that U spans the whole rational
K₂ group does not follow.

## Exact examples and independent diagnostics

`three-CM-normalization-examples` specifies the characters rather than
inferring them from j alone:

| Curve / field | τ, C | f, g | $\lvert W\rvert ,\lvert \mu\rvert ,\lvert W/\mu\rvert $ | Γ | Dilogarithm coefficient |
| --- | --- | --- | --- | --- | --- |
| $y^2=x^3-x$, 32a2, Gaussian | i, 4 | $2+2i,1-i$ | 8, 4, 2 | 2 | π/2 |
| $y^2=x^3+1$, 36a1, Eisenstein | $(1+\sqrt{-3})/2,6$ | $2\sqrt{-3},-\sqrt{-3}$ | 18, 6, 3 | 3 | 2π/3 |
| 49a1, $\mathbb Q(\sqrt{-7})$ | $(1+\sqrt{-7})/2,7$ | $\sqrt{-7},-\sqrt{-7}$ | 42, 2, 21 | 7 | 4π/7 |

In the first two cases χ(h) is the unique unit congruent to h modulo f,
with zero at nonunits. In the third,
$\chi(a+b\tau)=(\frac{a+4b}{7})$, with the Legendre symbol zero at 0.
For the Gaussian C=4 table, χ is zero when a,b have the same parity;
otherwise it is ±1 if a is odd and ±i if b is odd. The sign is positive
when $a+b\equiv1\pmod4$, negative when $a+b\equiv3\pmod4$.
This pins the concrete suggested-file model against unit congruence.

For √−7, the double residue sum reduces exactly to the quadratic Gauss
sum $G=\sum_{t\bmod7}(\frac t7)e^{2\pi it/7}$. Its imaginary part is
$2[\sin(2\pi/7)+\sin(4\pi/7)-\sin(6\pi/7)]>0$, because
$\sin(2\pi/7)>\sin(\pi/7)=\sin(6\pi/7)$. The primitive norm fixes
$G=i\sqrt7$ and Γ=7. At C=14 four lifts of each modulo-7 residue and
the normalization 1/14 give $H(\bar g)=2G$ and Γ=28. This supplies an
exact sign certificate alongside the numerical calculation.

The Gaussian index image is exactly $\{(1,0),(3,2)\}$ modulo 4.
The Eisenstein image is $\{(1,0),(5,4),(3,2)\}$ modulo 6.
The calculated regulator and L-values are:

| Case | $\operatorname{Im}R_q(U)$ | Corrected L-value |
| --- | --- | --- |
| Gaussian, C=4 | 37.364004269190911386610301731885 | 0.917050635318654988643805524296 |
| Eisenstein, C=6 | 96.945800419341372714919399252911 | 0.940013007388225781496302121363 |
| √−7, C=7 | 217.588151041284222231094880964721 | 1.138814388703848117450670150191 |

These are diagnostic computations, not rigorous decimal error certificates.
They used 45-digit working precision and 32 forward/backward q-orbit terms.
For each canonical lift $z=e^{2\pi i(a+b\tau)/C}$, compute

\[
R_C(a+b\tau)=C^3\left(
\sum_{n\geq0}W(zq^n)-\sum_{n\geq1}W(z^{-1}q^n)
+4\pi^2y^2(v^3/3-v^2/2+v/6)\right),
\]

where $v=b/C$ and
$W(z)=\log\lvert z\rvert \log(1-z)+i\operatorname{Im}\operatorname{Li}_2(z)$,
using the principal logarithm and $W(1)=0$. This is the reviewed direct
ER.4 convention; its imaginary part is Bloch–Wigner D, not simply Im Li₂.
The summed real parts, finite Parseval residuals and Gauss norm residuals
are below $10^{-40}$ in these computations.

There is a separate arithmetic check for the Gaussian example.
The table gives
$\chi(a+bi)=\sin(\pi a/2)\cos(\pi b/2)+i\cos(\pi a/2)\sin(\pi b/2)$.
Regrouping the absolute lattice sum and evaluating the alternating b rows,
by differentiation of the paired cotangent expansion, yields

\[
L(2,\psi)=\sum_{a\geq1\text{ odd}}(-1)^{(a-1)/2}
\left[\frac{\pi}{4a^2}\operatorname{csch}\frac{\pi a}{2}
+\frac{\pi^2}{8a}\operatorname{csch}\frac{\pi a}{2}
\operatorname{coth}\frac{\pi a}{2}\right].
\]

Summing odd a through 79 independently agrees with the q-regulator result
within $10^{-42}$. This check contains neither U nor a dilogarithm on its
arithmetic side, so it can detect the missing unit factor and sign.

`extra-prime-level-counterexample` recalculates the parent's confirmed
**EllipticRegulators/E9** test. Keep the √−7 character and take C=14,
$g=-2\sqrt{-7}$. Now Γ=28 and W has 168 residues, hence 84 orbits.
There are only 42 units modulo 14, hence 21 unit orbits. Indeed
$O/2O\simeq\mathbb F_2\times\mathbb F_2$ has four elements but one unit.
The conductor fibers use all four. The W regulator has imaginary part
870.352604165136888924379523858885; the unit-only sum has imaginary part
1740.705208330273777848759047717771. Numerical evaluation gives the correct
L-value above from W and twice it from units. The cardinalities and the
failure of the prime-support condition are exact. The factor-two statement
is recorded as an independent numerical diagnostic, not as an exact theorem
proved by this application. This distinction preserves the accepted source
correction without claiming that a numerical computation proves a general
identity.

## Dependencies, acceptance and remaining owner contracts

The local proof order is Fourier comparison; definition of Γ;
primitive Gauss normalization; conductor fibers; orbit normalization;
ideal convergence and generator regrouping; scalar cancellation; examples.
No new analytic identity depends on the final CM formula. A dependency
review of the accepted parent imports introduces no return path from CM.1,
CM.2 or CM.4 to this ER.5 specialization.

The six requests are:

1. **CM.1:** the endomorphism/order, oriented lattice and finite-unit interface.
2. **CM.2:** the actual torsion-field action through the ray representation and
   conjugation, sufficient for the parent rational descent.
3. **CM.4:** ψ in the pinned ideal-weight carrier, primitive χ, conjugation,
   conductor, principal-ideal law, norm, and all-local-factor Deuring
   comparison. A good-prime-only theorem does not fulfill this request.
4. **AL.1:** generic rank-one Hecke versus rank-two elliptic local-factor
   conventions, with the elliptic Frobenius theorem remaining CM.4's.
5. **GlobalNumberFields layer 9:** character/conductor and finite quotient/CRT
   interfaces, including unit lifting to C.
6. **GlobalNumberFields layer 10:** the infinity type and norm comparison.

The RS-14 links to natural-number Dirichlet contracts and modular
nebentypus are adjacent supplier contracts, not mandatory inputs for this
fixed CM regulator example. ER.7's modular uses are outside the scope.
The existing ArithmeticDirichletSeries Euler link is realized by its pinned
library declaration. AC.0 supplies the generic Fourier API by node import;
E.7 supplies the K₂ classes and rational descent by node import.

Acceptance requires all eight parent targets accounted for, six exact owner
contracts recorded, correct dual-first kernel and unchanged output index,
same-C distribution classes, two cancelling unit multiplicities, and W as
the full conductor index set. The finite examples reject sign, normalization,
imprimitive-character and conductor-level mistakes. There are no new local
mathematical gaps. Owner requests and assembly wiring remain explicit in
coverage. The two new planets are **The CM Gauss coefficient** and
**Gauss sum nonvanishing**; with the parent's **Bloch's class U** and
**Bloch's CM L-value theorem**, the assembled layer has four.

## Sources, pins and suggested forms

Read Bloch, *Higher Regulators, Algebraic K-Theory, and Zeta Functions of
Elliptic Curves*, CRM Monograph Series 11 (2000), Lecture 11 §§11.1–11.2,
printed pp.87–93, in [the book](https://bookstore.ams.org/crmm-11)
on 2026-10-06. Its text loses overlines. No page-image or private-scan
verification is claimed. The source hash and version scope are recorded in
the packet. E7/E8/E9 are confirmed findings of REV-EllipticRegulators and
are inherited without duplicate errata. The scalar proof and the finite
calculations independently check their mathematical corrections.

Read Brunault, *Valeur en 2 de fonctions L de courbes elliptiques*,
[arXiv math/0602186v1](https://arxiv.org/pdf/math/0602186v1), introduction
§0.5 and §1.2, especially Theorem 21 and the neighboring normalization
formulas. That theorem invokes Bloch's final Fourier identity; it is not an
independent input to ER.4's direct analytic proof. The upstream
EllipticCurves and GlobalNumberFields documents were read for their object
interfaces, dependency boundaries and API density.

The eight baseline declarations were checked in source at Mathlib
082e2d37e8b0463410cdb532e111cd43d5a66174 and Tau Ceti
f790474821cf4256814db967cb154e7af3d0c369. They are the curve L-series,
ZMod standard additive character, cotangent expansion, ideal-weight carrier,
ideal-term norm, norm regrouping, ideal-norm convergence and ideal Euler
nonvanishing. None becomes a new node.

The suggested file gives concrete finite coordinate tables, the new raw Γ
signature and expressible API/test forms, the Fourier comparison and scalar
cancellation signature. These elaborate against the pinned Mathlib build.
The first attempted Tau Ceti import failed because Convergence lacked a
compiled object; no library build was started. The exact Tau Ceti forms are
therefore recorded as comments and have **not** been elaborated. The CM/K₂
dependent signatures are also omitted with their precise mathematical
statements, following the protocol's rule for unavailable carriers. They are
not replaced by arbitrary predicates. The final executable file imports
only individual Mathlib modules and elaborates with the expected placeholder
proof warnings. This is a checked signature proposal, not a formalization.
