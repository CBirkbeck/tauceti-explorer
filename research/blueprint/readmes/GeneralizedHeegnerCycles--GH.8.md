# Weight-two and main-conjecture consumer comparisons

GH.8 compares generalized Heegner classes with the Heegner point system and
exports the resulting source-qualified inputs to AutomorphicCongruences L2
and RankZeroOneBSD BSD.6a. The comparison includes the actual modular
quotient, coefficient lattice, differential, character twist, conductor
normalization and period maps. Equality of two scalar logarithms is not a
substitute for equality of global classes.

The definitive specification is this document together with the
[packet](../packets/GeneralizedHeegnerCycles--GH.8.json). The
[suggested file](../suggested/GeneralizedHeegnerCycles--GH.8.lean) expresses
algebraic components and regression examples using the available library
interfaces. It does not implement the arithmetic comparisons. The target
pass is complete: **GH.8 is planned, not closed**. Every stated target has a
node and every unresolved input has an identified supplier or a recorded gap.
The six gap groups and their precise consuming nodes are in the packet.

## Conventions and imported objects

Fix an imaginary quadratic field K and an embedding into the p-adic closure.
Write p = 𝔭𝔭̄ when p splits. The comparison with the CH sources uses their
standing hypotheses: odd discriminant −D_K < −3, all primes of the tame
level N split in K, and p ∤ 2(2r−1)!Nφ(N) at weight 2r. At weight two this
reduces to p ∤ 2Nφ(N). The form is ordinary and has prime-to-p level. The
character conductor is prime to N. Conditions needed for a Hida-family or
BSD application are additional conditions, stated below; they cannot be
removed by this common-range comparison.

Let C be the actual modular curve of the cycle construction. Its level
structure can require a field larger than a ring class field. Let x_c be the
CM point and b a degree-one cusp, both rational over the chosen field L.
The cycle suppliers own their construction and descent. Let J = Pic⁰(C),
and let π:C→E be the fixed modular parametrization. Its pointed version is
x↦π(x)−π(b). The Jacobian universal property gives q_π:J→E with
q_π([x]−[b])=π(x)−π(b). Translation of π and change of basepoint must be
tracked through this formula. A normalized cusp is not replaced silently by
a rational Hodge class whose denominator has been cleared.

For the rational comparison use V_pJ and V_pE. The finite Picard–Kummer
comparison identifies J[p^m] with H¹_et(C̄,μ_{p^m}), and its continuous
limit gives

$$\theta_C:V_pJ\simeq H^1_{\mathrm{et}}(\overline C,\mathbf Q_p(1)).$$

On the chosen f-factor set γ_π = V_p(q_π)∘θ_C⁻¹. The actual cohomology map
H¹(γ_π), its topology, twists and field functoriality belong to GH.1 and
the cohomology suppliers. This notation never denotes an arbitrary map chosen
to make the desired equality true. The quotient relation q_πe_f=q_π is a
correspondence identity to prove, not an assumption of multiplicity one on
the entire Jacobian.

CH writes weight 2r and uses the generalized variety X_{2r−2}; BDP writes a
fiber-power index equal to k−2 at modular weight k. Thus weight two has CH
r=1 and BDP index zero. The empty fiber power is C. CM symmetric powers
have degree zero here. This case needs its own identification and cannot be
obtained by applying a positive-degree projector-vanishing argument.

All Iwasawa classes use the source’s continuous cohomology and its actual
corestriction inverse system. For c₀ prime to pN put K_n=K_{c₀pⁿ}. These
are ring class fields in one fixed separable closure. A chosen anticyclotomic
Z_p quotient may have a shift caused by the p-part of the class group. The
HE.8 plan specifies that shift. The full finite ring-class component is kept
until its quotient map has been applied explicitly.

No new abstract curve, Jacobian, cohomology, regulator or input-record type
is introduced in GH.8. Consequently this packet has no definition or
construction nodes and no new definition API. The imported objects keep
their owners’ APIs and tests. The comparison theorems have their own
acceptance checks and the suggested file supplies diagnostic examples.

## Baseline and ownership

The baseline is Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and
Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. The reviewed GH.8
audit identifies the arithmetic comparison as absent. Pinned Tau Ceti does
have `OrderSystem.weightedAbelJacobiClass`: an abstract divisor-class map
whose value is the degree-corrected formal divisor. It is useful evidence for
the divisor API, but its carrier is an abstract order system, not Pic⁰ of a
curve or an étale realization. Its multiplicative Kummer theory has
roots-of-unity coefficients; it does not provide E[p^m] Kummer classes.
Mathlib’s elliptic Jacobian coordinates likewise do not construct a Jacobian
variety. These distinctions determine which interfaces need suppliers.

The eleven cited baseline declarations supply the comparison algebra:
`LinearMap`, `Module.Dual`, `LinearMap.dualMap_apply`,
`LinearMap.dualMap_comp_dualMap`, `Int.natAbs_le_of_dvd_ne_zero`,
`Submodule.mapQ`, `Submodule.ker_mapQ`, `Submodule.mkQ_map_self`,
`LinearMap.ker_eq_bot`, `Equiv.prod_comp` and
`MulChar.sum_eq_zero_of_ne_one`. The additive finite reindexing theorem
`Equiv.sum_comp` is generated from `Equiv.prod_comp`. The packet cites the
literal source declaration because the declaration index does not enumerate
all generated names. These are existing results, not new orthogonality,
quotient or duality theories.

Use the finer HE supplier nodes rather than replanning their stages:

| Imported supplier | GH.8 use |
| --- | --- |
| HE.0 `conductor-change-kernel` | Exact order-class kernel, unit index and conductor-change degree |
| HE.0 `ring-class-tower-quotients` | Actual field inclusions, Artin compatibility and quotient groups |
| HE.1 `heegner-points-of-conductor-m-and-the-modular-parametrisation` | CM points, modular quotient, degree-zero normalization |
| HE.2 `split-ramified-first-step-recurrence` | Actual first trace, including unit/basepoint factors and reciprocity convention |
| HE.2 `repeated-conductor-predecessor-recurrence` | Positive-conductor predecessor recurrence |
| HE.3 `kummer-classes-and-the-modified-selmer-conditions` | Elliptic finite and p-adic Kummer classes; restriction, trace and reduction |
| HE.8 `ordinary-stabilized-point` | Ordinary positive-tail and initial point normalization |
| HE.8 `stabilized-corestriction` | True corestriction compatibility at the actual layer indices |
| HE.8 `anticyclotomic-heegner-class` | Continuous Iwasawa/Shapiro realization of the stabilized point system |

The integrated GH.4 node
`castella-hsieh-abel-jacobi-formula-and-big-logarithm-reciprocity` supplies
CH Theorems 4.9 and 5.7. GH.8 imports that theorem; it owns the additional
maps to the point and consumer presentations. GH.7 owns Hida classes,
moments, Yager modules, family regulator comparison and their actual
specialization. GH.0–GH.3 own the geometry, realization, local conditions
and normalized cycle tower. GH.5–GH.6 own nonvanishing and the higher-weight
Kolyvagin system.

General endpoint comparisons between determinant lines, characteristic
ideals, primitive/imprimitive statements and BDP’s square-root distribution
and its square belong to **ModularIwasawaMainConjectures L6**. GH.8 hands it
its geometric and differential maps. L6 is not an early prerequisite for
constructing this comparison. The dependency direction runs from producer
maps to consumer proofs and then to the general endpoint comparison.

## The divisor and Kummer comparison

`weight-zero-cycle` identifies the corrected cycle with

$$D_c=[x_c]-[b]\in\mathrm{CH}^1(C_L)_{0,\mathbf Q},$$

and its f-component with e_fD_c. BDP Remark 2.6 and Proposition 2.7
explicitly require the cusp subtraction at index zero. A raw CM point has
degree one, so it cannot be an input to the homologically trivial
Abel–Jacobi map. The field L must contain the level point and cusp before
the divisor is formed. Changing b to b′ changes D_c by [b]−[b′]; the
comparison retains this change rather than claiming integral independence.

`modular-quotient-kummer` proves

$$H^1(\gamma_\pi)\bigl(\operatorname{AJ}_{\mathrm{et}}(e_fD_c)\bigr)
  =\kappa_E\bigl(\pi(x_c)-\pi(b)\bigr).$$

The essential input is the finite Picard–Kummer/Gysin sign comparison.
For a divisor D=∑n_s[s] of degree zero and m=p^a, let U=C\S, where S is
its finite support. The residue vector (n_s mod m)_s lies in the kernel of
the total residue map. Compare its Gysin boundary with the Kummer boundary
of the line bundle O(D), under J[m]=H¹_et(C̄,μ_m). Compute the cocycle
using a division line bundle and its trivialization on U, keeping the
connecting convention σQ−Q. Show independence of choices, descent,
coefficient transitions and compatibility with q_π. Then perform the
continuous p-adic passage and apply q_πe_f=q_π.

This finite comparison is a specific GH.1 request. General site cohomology
or an abstract Ext construction alone does not prove it. The rational
identity has no automatic integral strengthening: a quotient map on the
full Jacobian may have a kernel, and an f-isotypical piece can have more
than one copy. A multiplicity-one factor and uniform denominators must be
identified for the two-sided lattice comparison.

Acceptance checks include x_c=b giving zero, degree one of the uncorrected
point, translation of π, change of cusp, and both weight-index conventions.
The actual modular quotient is tested through q_π([x]−[b]); a generic
linear-map signature does not certify this geometry.

## Finite characters and positive conductor

`character-sum-comparison` transports the **unnormalized** finite weighted
sum. Let G be the finite abelian ring-class quotient, B a coefficient ring
containing the character values, χ:G→B×, and γ a G-equivariant coefficient
map. For a class z,

$$\gamma\left(\sum_{g\in G}\chi(g)\,gz\right)
   =\sum_{g\in G}\chi(g)\,g\gamma(z).$$

The sum is in the χ⁻¹ eigenspace: reindexing by h multiplies it by
χ(h)⁻¹. The twisted descent uses this convention. There is no averaging
by |G|, particularly when p divides |G|. GH.3 supplies the actual finite
cohomology action and specialization/descent; HE.3 supplies the point
Kummer classes. A formal weighted sum proves neither the Galois descent
nor the source’s character-specialization map.

For a weight-two ordinary newform let α be the unit root of
X²−a_pX+p. Write z_n for the raw cycle class, k_n for its quotient Kummer
class and res for the actual field restriction. At positive conductor n≥1,
`positive-conductor-stabilization` gives

$$\gamma\bigl(z_n-\alpha^{-1}\operatorname{res}(z_{n-1})\bigr)
  =k_n-\alpha^{-1}\operatorname{res}(k_{n-1}).$$

Both sides retain the same α^{-n} multiplier when normalized. At n=1 the
lower class is the raw conductor-c₀ class, not the conductor-zero
stabilized expression. The difference is material at the first trace.

`positive-tail-corestriction` uses the repeated-conductor formula for n≥2:

$$\operatorname{cor}(k_n)=a_pk_{n-1}-\operatorname{res}(k_{n-2}),\qquad
  \operatorname{cor}\operatorname{res}=p.$$

Consequently

$$y_n=\alpha^{-n}\bigl(k_n-\alpha^{-1}\operatorname{res}(k_{n-1})\bigr)
  \quad\text{satisfies}\quad\operatorname{cor}(y_n)=y_{n-1}.$$

Expand the left side, use a_p−p/α=α and factor α^{-(n−1)}. This applies
to the positive tail. The first transition has a different degree and must
be computed separately. The HE.8 anticyclotomic realization is imported
only after comparing actual ring-class levels, group quotients and class
number shifts.

`primitive-character-stabilization` isolates the exact-conductor argument
used in CH Lemma 5.4. Let H be the last conductor kernel in a finite abelian
G. Let R be a commutative integral domain, M an R-module, χ:G→R a
multiplicative character nontrivial on H, and a,b:G→M with b constant on
H-cosets. For any R-linear q:M→N and scalars β,c,

$$q\left(c\sum_{g\in G}\chi(g)(a(g)-\beta b(g))\right)
   =c\sum_{g\in G}\chi(g)q(a(g)).$$

Partition into cosets, apply the existing scalar character-sum theorem on
H and act by that zero scalar on M. Cancellation occurs in R, so M may
have torsion. No nonzero scalar is cancelled in M and no group order is
inverted. In the arithmetic application c=α^{-n}, β=α^{-1}, b is the
restricted lower class and n≥1. GH.3 must show that this restriction image
is fixed by H and identify exact conductor with failure to factor through
the preceding quotient. Nontriviality on G alone is insufficient.

The boundary tests distinguish these conditions. For C₄ with
H={0,2}, χ(g)=(−1)^g is nontrivial on C₄ but trivial on H; the
H-invariant function b(g)=(−1)^g has weighted sum 4, not zero. Over
Z/8Z, the order-two unit 3 gives scalar sum 1+3=4, so the coefficient
domain condition cannot be dropped. Over Z, scalar cancellation still
works when M=Z/8Z. For C₉ over F₁₉ with χ(1)=4, the last kernel
{0,3,6} has scalar sum 1+4³+4⁶=0 and χ(3)≠1. These are integral
finite-sum checks, not proofs of arithmetic character descent or
conductor-zero normalization.

## The first trace and the initial Euler factor

`initial-corestriction-comparison` specifies exactly which input forces a
conductor-zero term. Write u=[O_{c₀}×:O_{c₀p}×] and
 d=[K_{c₀p}:K_{c₀}]. For split p prime to c₀, the HE.0 nodes give
ud=p−1. The HE.2 first-step recurrence and HE.3 Kummer map must give,
in the chosen class normalization,

$$u\operatorname{cor}(k_1)=a_pk_0-\sigma k_0-\tau k_0,\qquad
  \operatorname{cor}\operatorname{res}(k_0)=dk_0,$$

where σ and τ are the two source-convention Frobenius operators, with
στk₀=k₀. Basepoint corrections, arithmetic versus geometric reciprocity
and any level-field trace are part of identifying these maps.

The conditional algebra then proves

$$\operatorname{cor}\!\left(\alpha^{-1}(k_1-\alpha^{-1}\operatorname{res}k_0)\right)
 =u^{-1}(1-\alpha^{-1}\sigma)(1-\alpha^{-1}\tau)k_0.$$

Indeed the coefficient of k₀ is
α^{-1}a_p/u−α^{-2}d=(1+α^{-2})/u, using the root equation and ud=p−1.
The other two coefficients are −α^{-1}/u. The formula requires the unit
**index** u; replacing it by the full unit-group order changes it. CH
Definition 5.2 prints the full order |O_c×|, while Castella (6.7) prints
|O_c×|/2. CH Proposition 4.4 establishes the split recurrence for n>1,
not this initial input. Its positive-tail formula and a claim of norm
compatibility do not establish the missing initial normalization map.

The comparison keeps this as a precise gap rather than declaring another
proved source error. In the scalar test p=5, α=2, a_p=9/2, u=1 and d=4,
with σ=τ=id, k₀=1, cor=id, res=4 and k₁=5/2, the actual first normalized
trace is 1/4. The formula with a substituted full unit count 2 predicts
1/8. This is a diagnostic scalar model, not a claimed Fourier coefficient
of an elliptic curve.

`initial-only-rescaling-obstruction` proves that if cor(y₁)=y₀≠0,
rescaling only y₀ by t≠1 destroys compatibility. Uniform rescaling of the
whole system does commute with corestriction. Conversely an actual first
commutative square and equality of positive classes force equality of
compatible bottoms, without needing injectivity: apply the square to y₁.
One must prove that square on the actual systems before using it to compare
the two printed initial expressions.

## Integral comparison of towers

The quotient of the whole Jacobian need not have a rational inverse. The
comparison selects a multiplicity-one f-factor first. GH.0 provides the
factor and GH.1 provides its lattices. A rational isomorphism at each
conductor is only the beginning of the integral argument.

Write M_n and N_n for the selected cycle and point cohomology modules, with
corestrictions μ_n and ν_n. Required forward and reverse maps are
f_n:M_n→N_n and g_n:N_n→M_n. Their scalar composites must have one fixed
multiplier d, independent of n:

$$g_nf_n=d\,\mathrm{id}_{M_n},\qquad
  f_ng_n=d\,\mathrm{id}_{N_n}.$$

Both families commute with corestriction. In particular,
μ_ng_{n+1}=g_nν_n. Such data are requested from GH.1/GH.3 on the actual
lattices; clearing a different denominator at each level does not provide
them.

`uniform-coherent-kernel-bound` gives d x_n=0 whenever f_n(x_n)=0. It
applies directly to compatible sequences. `uniform-coherent-lift` proves
that if y=(y_n) is compatible in N, then x_n=g_n(y_n) is compatible in M
and f_n(x_n)=d y_n. Thus the induced tower comparison has kernel and
cokernel killed by d. The cokernel assertion uses this explicit coherent
lift, rather than a claim that inverse limits preserve surjections. After
inverting d, the two composite identities give inverse maps on the limits.
An integral isomorphism follows if d is a unit; a nonzero nonunit does not
suffice. These statements allow torsion modules and do not require
finite generation.

`unbounded-denominators-counterexample` prevents an invalid shortcut. Set
M_n=ℤ, μ_n=2, N_n=ℤ, ν_n=id and f_n=2^n. Then
f_nμ_n=ν_nf_{n+1}, and each f_n is an isomorphism over ℚ. Every compatible
integer sequence in M is zero: x_0 is divisible by arbitrarily large powers
of 2, and the same argument applies at every index. The compatible
sequences in N are all constant. Therefore

$$(\varprojlim M_n)\otimes\mathbf Q=0,\qquad
  (\varprojlim N_n)\otimes\mathbf Q=\mathbf Q.$$

The limit of the rationalized M_n does have sequences x_n=2^{-n}x_0.
Their growing denominators explain why it is a different object. The
comparison must specify whether scalar extension occurs before or after
forming the integral Iwasawa class.

Acceptance of the arithmetic tower comparison requires the selected factor,
one common multiplier, the actual reverse maps and both corestriction
squares. It also requires preservation of the local conditions carried by
HE.3 and GH.2. A rational coefficient identification cannot silently be
used for a statement about integral Selmer groups.

## Differential evaluation

`differential-evaluation` uses the same modular quotient as
`modular-quotient-kummer`. Work over the finite unramified local extension
L_v/ℚ_p and good-reduction models of BDP Section 3. Choose an invariant
differential ω_E and the f-differential ω_f, and define c_π by
π*ω_E=c_πω_f. For the degree-zero CM divisor D_φ=[x_φ]−[b], the target is

$$\log_{E,\omega_E}\bigl(\pi(x_\varphi)-\pi(b)\bigr)
 =c_\pi\,AJ_{\mathrm{dR}}(e_fD_\varphi)(\omega_f).$$

The quotient, f-projection and realization identifications on the right
are the maps already used in the étale comparison. GH.1 supplies their
de Rham functoriality; PadicHodgeRegulators L1 supplies the naturality of
the Bloch–Kato logarithm and its elliptic formal-group comparison. The
pullback of the differential is then the dual coefficient map. Pinned
Mathlib's `LinearMap.dualMap_apply` and `dualMap_comp_dualMap` supply the
ordinary linear algebra, not these arithmetic realization maps.

Changing either differential changes c_π. Neither the modular
parametrization nor the equation defining c_π implies c_π=1 or that c_π is
an integral unit. In a squared Abel–Jacobi formula, substitution of the
elliptic logarithm gives the factor c_π^{-2}. A single inverse power would
change the formula. The rational comparison and any integral assertion
about this factor therefore have separate acceptance checks. BDP's local
range must also be retained; it cannot establish the multiplicative
weight-two comparison used in the corrected BSD proof.

## Ordinary family specialization

`ordinary-p-old-family` imports the integral Hida branch I, critically
twisted representation T†, ordinary filtration and Howard class
Z_{c₀,∞} from GH.7. Use Castella's author-copy conventions. Here p∤6N,
c₀ is prime to pN, the imaginary quadratic discriminant is odd and less
than −3, and p splits in K. The residual representation is p-distinguished,
is irreducible on G_K, and satisfies the source ramification condition at
primes dividing (D_K,N). For comparison with CH, impose the stronger
common range in which all tame primes dividing N split; the ramification
condition is then vacuous. This restricted comparison does not cover every
ramified-level case in Castella.

Let the reference weight k>2 be even with k≡2 modulo p−1. Castella
Theorem 6.5 treats arithmetic specializations ν of weight 2r_ν>2 and
trivial character satisfying 2r_ν≡k modulo 2(p−1). Its class formula is

$$c_0^{r_\nu-1}\,\nu(Z_{c_0,\infty})
   =z_{f_\nu,c_0,\alpha},\qquad \alpha=\nu(a_p).$$

Remark 6.6 extends this comparison to weight two and trivial character
when f_ν is the ordinary p-stabilization of a newform of level prime to p.
Both congruences on the weights remain relevant: 2≡k modulo 2(p−1)
is stronger than evenness. The target then reads

$$\nu(Z_{c_0,\infty})=z_{f_\nu,c_0,\alpha}.$$

The equality lives in the identified Greenberg Iwasawa cohomology of
T_{f_ν}(1), with the source coefficient-specialization and critical-twist
maps. It retains the finite ring-class component. A trace to K is a further
map. A p-new multiplicative form or a nonordinary form fails the stated
range. The theorem does not identify differently normalized versions of
CH's class until their comparison maps have been supplied.

The proof has two injectivity obligations and a pairing obligation.
Castella Lemma 6.4 proves the global localization statement using the
integral Greenberg module's torsion-freeness, specialization/control of the
localization kernel, nonvanishing at infinitely many characters on each
finite ring-class component and the resulting rank-one Selmer bound.
GH.7 must retain this chain at the weight-two p-old specialization.
Residual irreducibility by itself is not a proof of injectivity.

For the local step, LZ14 Proposition 4.11 supplies two-variable regulator
injectivity with an **infinite unramified direction**. CH Theorem 5.1
passes through a coefficient/distribution quotient in its relative
Lubin–Tate construction. GH.7 must prove that the actual ordinary
rank-one representation has the required crystalline nonnegative
Hodge–Tate range, no trivial quotient and no fixed vectors over the torsion
extension, with the finite unramified base specified. It must then identify
the submodules being quotiented.

For a linear map h:M→N descending from M/P to N/Q, Mathlib's
`Submodule.ker_mapQ` identifies its kernel with the image of h^{-1}(Q)
in M/P. Thus h^{-1}(Q)=P suffices for descended injectivity; alternatively
one can prove this kernel is zero directly. Injectivity of h does not
suffice. Multiplication by X on ℚ[X] is injective but gives the zero map
on the nonzero quotient ℚ[X]/(X). This regression rejects a general
inference; it does not refute the arithmetic regulator theorem.

Finally the scalar functional must be nonzero on the one-dimensional
ordinary crystalline line after the chosen coefficient extension. On a
line, a nonzero functional is injective. On the full two-dimensional
crystalline realization, a nonzero functional need not be injective: the
first-coordinate projection kills (0,1). CH Section 5.3 supplies the
ordinary-line projection and CM-period identity. GH.7 supplies its actual
realization and source-version transport. Only after these checks can the
source scalar identities imply equality of local classes, and global
localization then imply equality of global classes.

## Weight-two explicit reciprocity

`weight-two-reciprocity` transports the imported CH 2022 Theorem 5.7 to
the point class. Let f be the ordinary weight-two prime-to-p newform
attached to E, and retain CH's standing hypotheses. Let ψ have infinity
type (1,−1) and conductor c₀. In CH's completed unramified coefficient
Iwasawa algebra S_F on its ring-class quotient, Theorem 5.7 specializes to

$$\bigl\langle\mathcal L_\psi(z_f),
      \omega_f\otimes t^{-2}\bigr\rangle
   =-\mathscr L_{p,\psi}(f)\,\sigma_{-1,\mathfrak p}.$$

The factor c₀^{r−1} is 1 at r=1. The minus sign and the group-like
factor σ_{−1,𝔭} remain. The latter has order dividing two on the full
ring-class quotient; its image may become trivial on the pro-p
anticyclotomic quotient. That image must be computed, not assumed.

Let γ_π be the actual quotient coefficient map to V_pE, and let d_γ
be its ordinary crystalline realization after the ψ^{-1} twist. Write
ℓ_f for the displayed CH functional. Transport the invariant differential
and CM generator to an elliptic functional ℓ_E satisfying

$$\ell_E\circ d_\gamma=c_\pi\ell_f.$$

This equation is part of the arithmetic comparison target. CH (5.3)
relates its CM generator ω_{f,ψ} to ω_f⊗t^{-2r} by the nonzero period
Ω_ψ. It provides a pairing comparison, not an assertion that Ω_ψ is an
integral unit. GH.4/GH.7 must realize this identity together with the
quotient differential and twist maps.

Regulator naturality then yields, for
y_E=H¹_Iw(γ_π)(z_f),

$$\ell_E\bigl(\mathcal R_E(y_E\otimes\psi^{-1})\bigr)
   =-c_\pi\mathscr L_{p,\psi}(f)\,\sigma_{-1,\mathfrak p}.$$

The class y_E is identified with the HE.8 Kummer system through the
positive-tail comparison and actual first-corestriction square. Fixed
lattice multipliers control the integral comparison. The displayed scalar
identity alone does not make c_π an integral unit.

For any defined coefficient/group homomorphism ρ, the transported identity
has right side −ρ(c_π)ρ(𝓛_{p,ψ}(f))ρ(σ_{−1,𝔭}). Its acceptance
checks verify the differential scalar, twist, coefficient ring, finite
component and group factor together. They also check the bottom Kummer
class through the actual normalization square. Ramified-character values
alone cannot supply a conductor-zero equality without a separation/control
theorem.

## Export to automorphic congruences

`automorphic-reciprocity-export` supplies the source-qualified ordinary
inputs for AutomorphicCongruences L2. It imports GH.4's CH scalar identity
and GH.7's family identity, including their coefficient rings. With the
notation of Castella Proposition 5.2, put

$$\lambda=\Psi(\operatorname{Frob}_{\mathfrak p})-1,\qquad
 S_I=I[\lambda^{-1}]\widehat\otimes W.$$

Theorem 5.3 states the native equality

$$\mathcal R_{\mathrm{Cas}}\!left(
 \operatorname{loc}_{\mathfrak p}(Z_{c_0,\infty}\otimes\xi^{-1})\right)
 =\mathscr L_{p,\xi}(\text{family})\,
   \sigma_{-1,\mathfrak p}
 \quad\text{in }S_I[[\widetilde\Gamma]].$$

Here the scalar regulator includes the printed finite-ring-class
corestriction and group restriction. The character ξ, critical twist,
ordinary-line trivialization and completion are the source data. At a
permitted specialization, Castella Theorem 2.11 compares the analytic
moment with the corresponding CH-convention p-adic L-function. The class
moment uses Theorem 6.5 in its higher-weight range and Remark 6.6 in its
weight-two p-old range.

A homomorphism ν from I does not automatically extend to S_I. It must send
λ to an invertible element in the target; over a field, this requires
ν(λ)≠0. If ν(λ)=0, evaluation of λ^{-1} is undefined. GH.7 must provide
a regular coefficient model or a proved denominator-cleared identity and
its specialization. Specializing a cleared equation at λ=0 cannot recover
its former quotient by cancellation. This check applies before naming the
class/regulator specialization square.

For every defined continuous coefficient/group map ρ on S_I[[Γ̃]],
apply ρ to the exact native identity. This gives equality of its two
images with the actual image of σ_{−1,𝔭}. It does not supply a map
between two distributions merely because both have been called p-adic
L-functions. The class moment, analytic moment and regulator moment must
commute with the same coefficient and group maps.

The Castella family equality has a positive sign. CH 2022 Theorem 5.7 has
−c₀^{r−1} and the functional involving t^{-2r}; the family comparison
proof uses t^{1−2r}. Keep both equalities with their own classes, periods
and functionals until the GH.4/GH.7 diagram identifies them. A Tate-period
power cannot be discarded as an ordinary coefficient unit. The version
comparison is an explicit request, rather than an informal renaming of
symbols.

L2 owns the ordinary GU(3,1) congruence construction, its lattice and
analytic-function comparisons, and its divisibility. Its FW
Beilinson–Flach input is a separate class. L2s owns the semi-ordinary CLW
branch. This export supplies the Heegner reciprocity input in the stated
ordinary range; the consumer verifies period units, excluded height-one
primes and any primitive/imprimitive or determinant comparisons through
ModularIwasawaMainConjectures L6. Those comparisons are not prerequisites
for the GH.8 identity itself.

## Export to the corrected multiplicative BSD proof

`corrected-bsd-input-export` follows Castella's correction to the
multiplicative anticyclotomic main-conjecture proof. It exports
higher-weight inputs to RankZeroOneBSD BSD.6a. The corrected argument
chooses, for each m, an auxiliary ordinary newform g_m of prime-to-p level
M=N/p, even weight k_m>2 with k_m≡2 modulo p−1, and a lattice congruence
modulo p^m. It transfers the higher-weight Selmer and analytic data to the
multiplicative elliptic curve by congruences and control. The weight-two
p-new point does not pass Remark 6.6.

The auxiliary theorem's range must be recorded exactly. The correction's
Theorem 2.3 assumes an ideal 𝔐⊂O_K with O_K/𝔐≅ℤ/Mℤ, residual
irreducibility on G_K, and a nonsplit q exactly dividing M. If 2 is
nonsplit, 2 exactly divides M. At nonsplit ℓ exactly dividing M, the local
automorphic representation is special twisted by the unramified character
sending ℓ to −ℓ^{k_m/2−1}. These conditions are not the all-split CH
standing Hypothesis (H).

For E itself, corrected Theorem 1.1 assumes multiplicative reduction at
p>3, split p, the corresponding ideal at level N, irreducibility of E[p]
on G_ℚ, nonsplit multiplicative reduction at the nonsplit primes exactly
dividing N, at least one such prime where E[p] is ramified, and
E(ℚ_p)[p]=0. It also retains the condition at nonsplit 2. BSD.6a owns
the residual restriction and local rigidity arguments that verify the
auxiliary forms' hypotheses, as well as the coefficient congruences,
Σ-imprimitive analytic congruence, Selmer control, both divisibilities and
the final limit argument.

The GH input consists of the actual GH.2–GH.7 system for each g_m, its
lattice T_{g_m}, corrected Selmer conditions, ordinary stabilization and
source-qualified reciprocity. The leading Kolyvagin class must agree with
κ_{g_m,∞} by an explicitly identified p-adic **unit**. GH.6 and the HE.8
comparison supply that unit and its inverse. A nonzero rational multiplier
such as p cannot replace it in an integral divisibility argument.

CH's one-page erratum changes the proof of derived local conditions: the
original absolutely-unramified-only Lemma 7.5 does not supply the ramified
conductor case. GH.2 owns the corrected route through the Kobayashi–Ota
replacement, with its hypotheses. GH.5 owns non-torsion and the rank-one
consequences; GH.6 owns the Longo–Vigni Kolyvagin system and its
admissibility conditions. GH.8 requests their exact auxiliary-form range
and exports the verified input, rather than reconstructing these theories.

There is a concrete supplier gap here. CH's all-split tame-level
hypothesis does not meet the corrected theorem's nonsplit-prime condition.
Its exclusion p∤(2r−1)! is also weight-dependent; an unrestricted sequence
of congruence weights cannot satisfy it automatically. The Longo–Vigni
exceptional set and admissibility restrictions likewise need checking.
GH.0–GH.7 must provide the precise tame-level and varying-weight extension
used by the corrected proof. Neither omitting CH's hypotheses nor assuming
the consumer's conclusion proves that extension. The gap records missing
source-range data; it does not assert that the corrected theorem is false.

Once the range adapter and normalization maps exist, export the scalar
reciprocity formula with −c₀^{r_m−1}, the actual group factor and completed
unramified coefficients, together with GH.7's analytic moments in a defined
coefficient model. Reduction R_{g_m}→R_{g_m}/p^m carries an exact scalar
equality to an exact scalar equality. Reduction of characteristic ideals
or preservation of Selmer ranks does not follow from that algebraic fact;
those are BSD.6a's congruence/control work. Its supersingular BSTW/CLW
branch has separate zeta elements and signed reciprocity.

## Source carrier and build order

The retained source finding `E-GH8-1` concerns the full symmetric-power
induction display in CH, not a normalization convention. If
h=[H_K:K]>1, the degree-zero left side has rank 1 and the induced right
side rank h. In degree two, the full symmetric square of a rank-2h Tate
module has rank h(2h+1), while induction of the rank-3 symmetric square has
rank 3h. For h>1 these differ. A pure-component projector may repair a
positive-degree carrier, but it does not identify the full symmetric
power, and degree zero requires its own treatment. GH.0/GH.3 own the
repair or bypass. GH.8's empty-power/divisor comparison avoids using the
false full-carrier equation. The unit-count and quotient-descent questions
above remain gaps, rather than additional established source errors.

The plan has sixteen nodes. The first seven targets build the degree-one
cycle, quotient Kummer, finite character sum, positive stabilization,
positive corestriction, differential evaluation and p-old family
comparison. Four algebraic targets control initial normalization and
uniform lattice bounds; the denominator counterexample and primitive
character comparison test the boundaries. The three final targets provide
point reciprocity and the two consumer exports. Dependencies and exact
statements are in the packet; every target has a chain ending in a named
library declaration, supplier node/stage or explicit gap.

The four planets are **Weight-two Abel–Jacobi comparison**, **Modular
differential comparison**, **Weight-two ordinary-family comparison** and
**Weight-two explicit reciprocity**. They group the geometric comparison,
its scalar differential, the ordinary specialization and the resulting
point identity. All nodes have unchecked implementation status. No new
arithmetic definition or construction is introduced in GH.8, so there is
no new-definition API or unit-test list. Node acceptance checks include
scalar calculations, conductor and carrier boundary cases, quotient
kernel regressions and source-range checks.

The stage is **planned** with six remaining groups: degree-one realization
and uniform integral lattice maps; CM carrier and finite-character descent;
initial conductor and source normalization; regulator descent and
source-qualified period maps; corrected BSD auxiliary-form range and
integral leading class; and actual arithmetic Lean interfaces. Its planning
pass is complete at target level. It is not a closed mathematical blueprint.
Requests name GH.0, GH.1, GH.2, GH.3, GH.4, GH.5, GH.6, GH.7 and
PadicHodgeRegulators L1. Existing finer HE supplier nodes are imported
directly rather than replaced by broader stage requests.

The suggested Lean file uses actual Mathlib modules for twelve named
algebraic signatures, twenty-nine examples and six baseline declaration
checks. These isolate the first-trace calculation, coherent lattice
arguments, conductor-character cancellation, linear transport of finite
sums and stabilizations, differential reciprocity, coefficient reduction
and the restriction on specialization of an inverse. Proofs remain
placeholders. The arithmetic signatures individually name their missing
supplier APIs and are omitted until those APIs exist; generic modules in
the algebraic checks are not presented as geometric or Iwasawa carriers.
The proposed arithmetic namespace is
`TauCeti.GeneralizedHeegnerCycles.WeightTwo`, in the module
`TauCeti/NumberTheory/HeegnerCycles/WeightTwo`.

## Sources and boundaries of reading

The packet records the exact versions, download hashes and bounded passages
supporting this part:

- Bertolini–Darmon–Prasanna, *Generalized Heegner cycles and p-adic
  Rankin L-series*, Duke Mathematical Journal 162 (2013), 1033–1148:
  [published version](https://www.math.mcgill.ca/darmon/pub/Articles/Research/51.BDP1/duke-publishedversion.pdf),
  Sections 2.3 and 3.1–3.4 for cycles, étale/de Rham Abel–Jacobi and local
  evaluation.
- Castella–Hsieh, *Heegner cycles and p-adic L-functions*,
  [published version](https://web.math.ucsb.edu/~castella/HeegnerCycles-print.pdf),
  standing hypotheses, Sections 4.3–4.4 and 5.2; and the
  [2 July 2022 author text](https://www.math.ntu.edu.tw/~mlhsieh/research/HCES.pdf),
  standing hypotheses, Sections 4.2–4.4, 5.1–5.3 and the beginning of 6.1.
  The revised Theorem 5.7 and its proof fix the scalar identity used here.
- Castella, *On the p-adic variation of Heegner points*,
  [author copy](https://web.math.ucsb.edu/~castella/Heegner.pdf),
  introduction, Theorem 2.11's analytic specialization, Sections 5.1–5.2
  through the statement of Theorem 5.3, and Section 6.2 through Remark 6.6.
- Loeffler–Zerbes, *Iwasawa theory and p-adic L-functions over
  ℤ_p²-extensions*, [arXiv v3](https://arxiv.org/pdf/1108.5954v3),
  Definition 4.6, Theorem 4.7's statement and Propositions 4.9–4.11,
  including the injectivity proof.
- Castella–Hsieh, [erratum](https://www.math.ntu.edu.tw/~mlhsieh/research/erratum2.pdf),
  the complete one-page correction to the derived-class local-condition
  proof.
- Castella, [multiplicative BSD correction](https://web.math.ucsb.edu/~castella/Birch-erratum.pdf),
  corrected Theorems 1.1 and 2.3 and their proof route, including the
  residual/local-type footnote.

These passages justify the GH.8 comparisons and precise supplier requests.
They do not constitute full new readings of the Hida construction,
Howard's construction, Rubin's finite-character specialization,
Kobayashi–Ota's replacement theorem or Longo–Vigni's system. Those source
proofs belong to the named suppliers. Likewise the FW, CLW and BSD
main-conjecture proofs remain with their consumers. The packet's source
locators distinguish a theorem statement from a proof and a published
normalization from a revised author normalization.
