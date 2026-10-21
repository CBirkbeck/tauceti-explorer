# Modularity and modular parametrisations of elliptic curves over ℚ

An elliptic curve over ℚ determines local point counts, Galois representations, and an
Euler product. Modularity identifies this arithmetic with the Fourier expansion of a
weight-two newform and realizes the curve as a quotient of a modular Jacobian. This
roadmap builds the comparison in both directions and constructs the resulting map from a
modular curve. The main objects are the finite exceptional set of residual
characteristics, Serre witnesses, the predicate that a newform is attached to an
elliptic curve, its unique newform, and a modular parametrisation with a chosen quotient
isogeny.

The existence proof uses the classical Serre modularity theorem. For infinitely many
primes $p$, the representation on $E[p]$ has the conductor of $E$, weight two, and
trivial residual character. Serre modularity produces forms whose good coefficients
agree with the traces of $E$ modulo primes above $p$. Finiteness of the forms and an
algebraic-integer norm argument turn these congruences into exact equalities. Galois
conjugation gives rational integral coefficients, local compatibility supplies the
conductor and bad factors, and Faltings's isogeny theorem produces the geometric
quotient and parametrisation.

There is also a conditional comparison theory that starts with an attached newform or a
quotient of a modular Jacobian. It proves the equivalence of the newform, quotient, and
parametrisation formulations without using the existence theorem. Separating this theory
makes it usable when modularity is already known from a geometric construction.

## Scope and neighbouring theories

The base field throughout is ℚ. The curve may have complex multiplication over ℚ̄; the
constructions and theorems include that case. The endomorphisms used in the proofs are
defined over ℚ. In particular,

$$
\operatorname{End}_{\mathbb Q}(E)=\mathbb Z,
$$

including for a curve whose geometric endomorphism ring is larger. The Tate module over
a field containing the CM field has different irreducibility properties and must not be
substituted for the representation over ℚ.

This roadmap begins after the elementary theory of elliptic curves, local reduction,
modular forms, and modular curves. It imports those objects and their general theorems
and supplies the arithmetic comparisons specific to elliptic curves over ℚ. The
following divisions of responsibility determine the interfaces.

* Tau Ceti **EllipticCurves**, Layers 1–4, provides Weierstrass equations,
  isogenies, torsion and Tate modules, finite-field traces, local reduction and
  the Tate curve. ArithmeticGaloisRepresentations **R01.6** supplies the
  arithmetic Galois representation, its determinant and Frobenius polynomial,
  and the comparison of the elliptic conductor with Artin conductors.
* Tau Ceti **ModularForms**, Layers 4, 5, 7 and 8g, supplies newforms,
  finiteness at fixed weight and level, the old/new decomposition, strong
  multiplicity one across levels, L-functions, and Galois conjugation of
  coefficients. The general theory of those constructions stays there.
* ClassicalSerreModularity **R27.6/finite-flat-weight-two-export** supplies
  the weight-two trivial-character consequence of Serre modularity. The
  argument here applies that result to residual representations verified to
  satisfy its hypotheses.
* FiniteFlatGroupsAndIntegralPadicHodgeTheory
  **R07.6/abelian-scheme-torsion-finite-flat** and
  AlgebraicModularFormsAndSerreWeights
  **R15.4/weight-two-iff-finite-flat-at-p** supply the integral and weight
  comparisons. Eigenvalue lifting belongs to
  **R15.5/deligne-serre-eigenvalue-lifting-lemma**.
* AutomorphicGaloisRepresentations **R19.1**, **R19.4** and **R19.6** supplies
  the representations of newforms, their full local compatibility, and their
  realization in the Tate modules of modular quotients.
* FaltingsFinitenessAndIsogenyTheorems **R28.4** and **R28.6** supplies
  semisimplicity, the Tate–Hom comparison, isogeny criteria, finiteness of
  elliptic isogeny classes, and the ℚ-endomorphism statement above.
* Tau Ceti **ModularCurves** supplies the curve and scheme dictionaries;
  ModularCurvesPartII **R14.5** and **R14.6** supplies the quotients of the
  modular Jacobians, their differentials, the rational cusp and Abel–Jacobi
  map. Tau Ceti **JacobianChallenge**, Layer F, supplies its universal
  property. Degree and the passage between function fields and projective
  curves use Tau Ceti **AlgebraicCurves**, Layers 6 and 12.

The analytic output is continuation and a functional equation for $L(E,s)$. Its
consumers include EllipticCurves Layer 7 and RankZeroOneBSD. The rank formula,
special-value formula, Tate–Shafarevich group, and the arithmetic parts of
Birch–Swinnerton-Dyer belong to those further theories. The companion real
multiplication statement is specified at the end with its own domain.

## Conventions and the existing library

Write $E$ for a smooth projective elliptic curve over ℚ with origin $O$, presented by a
nonsingular Weierstrass equation

$$
y^2+a_1xy+a_3y=x^3+a_2x^2+a_4x+a_6.
$$

The coefficients of a model are ordered $a_1,a_2,a_3,a_4,a_6$. In Mathlib this is a
`WeierstrassCurve ℚ` with the instance `E.IsElliptic`; this instance asserts that the
discriminant is a unit. Reduction types always refer to a minimal model over ℤℓ. An
integral presentation is used for calculations, but the conductor and the arithmetic
conclusions depend only on the elliptic curve. Valuations have $v_\ell(\ell)=1$, and
$j_E=c_4^3/\Delta$. At multiplicative reduction $v_\ell(j_E)<0$, so only finitely many
rational primes divide it.

Let $N=N_E\geq1$ be the conductor. A prime ℓ is good exactly when $\ell\nmid N$,
multiplicative exactly when $v_\ell(N)=1$, and additive when $v_\ell(N)\geq2$. The
latter exponent includes wild contributions at 2 and 3. The conductor is the product of
the local Artin conductors of the rational Tate representations, using an auxiliary
prime different from the place being measured.

Put $G_{\mathbb Q}=\operatorname{Gal}(\overline{\mathbb Q}/\mathbb Q)$, write
$\bar\rho_{E,p}$ for the representation on $E[p](\overline{\mathbb Q})$, and write
$V_r(E)=T_r(E)\otimes_{\mathbb Z_r}\mathbb Q_r$. Both have dimension two over their
respective coefficient fields. At a good prime ℓ different from the coefficient
characteristic, **arithmetic Frobenius** has polynomial

$$
X^2-a_\ell(E)X+\ell,
\qquad a_\ell(E)=\ell+1-\#\widetilde E(\mathbb F_\ell).
$$

The determinant is the cyclotomic character. For the residual representation,
$N(\bar\rho_{E,p})$ always means its **prime-to-$p$** Artin conductor. It has no factor
at $p$, even when $E$ has bad reduction there.

The Euler polynomial is $P_\ell(E,T)$, with local factor $P_\ell(E,\ell^{-s})^{-1}$. The
four possibilities are

| Reduction of $E$ at ℓ | $a_\ell(E)$ | $P_\ell(E,T)$ |
| --- | --- | --- |
| good | $\ell+1-\#\widetilde E(\mathbb F_\ell)$ | $1-a_\ell(E)T+\ell T^2$ |
| split multiplicative | $1$ | $1-T$ |
| nonsplit multiplicative | $-1$ | $1+T$ |
| additive | $0$ | $1$ |

For the homological representation $V_r(E)$ and arithmetic Frobenius the local
polynomial is obtained on inertia **coinvariants**. Equivalently it is obtained from the
dual cohomological representation on inertia invariants using geometric Frobenius. At
split multiplicative reduction, arithmetic Frobenius acts by ℓ on the invariant line in
$V_r(E)$; using that line in the displayed Euler polynomial would incorrectly give
$1-\ell T$. Local compatibility must carry the duality and Frobenius convention
explicitly.

The integer $a_n(E)$ is the coefficient of Mathlib's `WeierstrassCurve.LFunction`. It is
multiplicative at coprime positive indices, has $a_1(E)=1$, and is determined by the
local polynomials. Its value at zero is zero, as for an arithmetic function. The complex
L-series is `WeierstrassCurve.LSeries`. Its definition as a Dirichlet series does not
itself provide analytic continuation; continuation is a theorem of Layer R29.6.

A form $F$ has expansion $\sum_{n\geq1}A_n(F)q^n$, with $q=e^{2\pi iz}$, and is
normalized by $A_1(F)=1$. A newform in this roadmap has weight two, positive level, and
trivial nebentypus unless explicitly stated otherwise. The bundled library type is
`HeckeRing.GL2.Newform M 2`. Its underlying form is on Γ₁$M$, with a character $(\mathbb
Z/M\mathbb Z)^\times\to\mathbb C^\times$. The trivial-character condition identifies the
relevant Γ₀$M$ subspace. The record contains newness, normalization, and the
away-from-level Hecke eigenvalue system; the bad-prime eigenvalue theory is imported
from ModularForms Layer 4. Write $K_F=\mathbb Q(A_n(F):n\geq1)$ for its coefficient
field.

For trivial character let $A_F^0$ be the modular quotient of **J₀$M$** attached to $F$.
The quotient $A_F^1$ of **J₁$M$** has a compatible $K_F$-action and is ℚ-isogenous to
$A_F^0$. The superscripts distinguish the actual quotients; $A_F^0$ is abbreviated to
$A_F$ below. Isogeny of these two quotients suffices for comparing Tate modules but does
not identify their elliptic models. At level 11, this distinction separates 11a1 and
11a3.

The library reference points are Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and
Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. The following existing declarations
are used with their stated generality.

| Declaration | Input supplied here |
| --- | --- |
| `WeierstrassCurve.j` | $j_E=c_4^3/\Delta$ for a nonsingular model |
| `Set.Finite`, `Set.Infinite` | finite and infinite sets, using their subtype cardinality |
| `CuspForm` | bundled cusp forms for a subgroup of GL₂$ℝ$, holomorphic and vanishing at all cusps |
| `IsPrimitiveRoot` | a root of unity with specified exact order |
| `Nat.totient` | the cardinality of the unit group modulo the level |
| `Finite.exists_infinite_fiber` | an infinite type mapping to a finite type has an infinite fibre |
| `NumberField.RingOfIntegers` | the integral closure of ℤ in a number field |
| `Algebra.norm` | determinant of multiplication in a finite free extension |
| `Algebra.norm_eq_zero_iff` | in a finite free extension of domains, norm zero is equivalent to element zero |
| `Int.eq_zero_of_abs_lt_dvd` | $m\mid x$ and $|x|<m$ force $x=0$ |
| `HeckeRing.GL2.Newform` | normalized newforms at a fixed positive level and weight |
| `Newform.eq_of_forall_notMem_eigenvalue_eq` | equality at a fixed level and character from agreement at all good indices outside a finite set |
| `WeierstrassCurve.localPolynomial` | the integer polynomial in the four reduction cases above |
| `WeierstrassCurve.LFunction`, `WeierstrassCurve.LSeries` | the formal coefficients and their complex Dirichlet series |

The fixed-level multiplicity-one theorem in this table takes agreement at all indices
coprime to the level outside a finite set. Cross-level comparison from agreement at
almost all **prime** indices is the stronger imported statement from ModularForms Layer
5. Neither its different domain nor its hypotheses are absorbed into the fixed-level
reference.

For implementation against later Tau Ceti versions, the elliptic input has concrete
library realizations: `WeierstrassCurve.torsionGaloisAction` is the coordinate action
on `AddSubgroup.torsionBy`, and `WeierstrassCurve.tateModuleGaloisRepresentation`
acts on `TateModule r (E.baseChange (AlgebraicClosure ℚ)).toAffine.Point`.
`WeierstrassCurve.nonempty_linearEquiv_tateModule` identifies this integral Tate
module with $\mathbb Z_r^2$ over a separably closed field where $r$ is invertible;
`TauCeti.det_tateModuleGaloisRepresentation` gives its cyclotomic determinant.
Use these constructions, extending scalars to $\mathbb Q_r$ for $V_r(E)$,
when replacing the corresponding typed interfaces in `Suggested.lean`. Their
construction belongs to EllipticCurves Layer 2. The conductor and local comparison
contracts remain the arithmetic inputs from R01.6.

Names below are in the namespace `TauCeti.EllipticCurve.Modularity`. They name the
proposed interface and its mathematical assertions. The accompanying `Suggested.lean`
fixes possible signatures against the existing curve, newform, representation, and
scheme vocabulary.

## Sources

The proof is organized around the comparisons it needs. The main references and their
roles are:

* [J.-P. Serre, *Sur les représentations modulaires de degré 2 de
  Gal$ℚ̄/ℚ$*, Duke Math. J. 54 (1987), 179–230][serre]. Proposition 4 in
  §2.8, pp. 189–190, gives the finite-flat weight-two criterion; Proposition
  5 in §2.9, pp. 191–192, treats elliptic torsion in the good and
  multiplicative cases. The lifting discussion is §3.1, especially (3.1.6),
  pp. 194–195. The weight-two specialization is §3.3, p. 198. Theorem 4,
  Lemma 5, and (4.6.1)–(4.6.4) in §4.6, pp. 207–208, provide the modularity
  argument; Theorem 5 in §4.7, pp. 208–209, specifies the real multiplication
  companion. The modularity input in the 1987 paper is conjectural. Here it
  is supplied by ClassicalSerreModularity R27.6.
* [G. Faltings, *Endlichkeitssätze für abelsche Varietäten über Zahlkörpern*,
  Invent. Math. 73 (1983), 349–366][faltings]. In §5, Satz 3 and Satz 4,
  p. 360, give semisimplicity and the endomorphism comparison. Korollar 1
  and Korollar 2, p. 361, give the Hom comparison and equivalent criteria
  for isogeny. They support both the construction of a quotient isogeny
  and the irreducibility argument in the converse.
* [H. Carayol, *Sur les représentations ℓ-adiques associées aux formes
  modulaires de Hilbert*, Ann. Sci. École Norm. Sup. (4) 19 (1986),
  409–468][carayol]. The normalization in §0.5, p. 410, and Theorem $A$ in
  §0.7, pp. 410–411, lead to the conductor and L-function corollary in
  §0.8, p. 411. Its specialization to a rational weight-two classical
  newform gives the full local comparison required here.
* [P. Deligne and J.-P. Serre, *Formes modulaires de poids 1*, Ann. Sci.
  École Norm. Sup. (4) 7 (1974), 507–530][deligne-serre]. Lemme 6.11,
  p. 522, lifts an eigenvalue system for commuting endomorphisms of a
  finite free module over a discrete valuation ring after a finite
  extension. Its linear algebra statement is applicable to the integral
  Hecke module used here, regardless of the title's weight-one setting.
* [J. E. Cremona, *Algorithms for modular elliptic curves*, second edition
  (1997), Chapter II][cremona]. Section 2.6, pp. 24–25, gives the
  newform/elliptic-curve and coefficient conventions; §2.7 and Lemma
  2.7.1, pp. 25–26, describe oldclasses and their divisor multiplicities;
  §2.15.1, p. 47, gives the differential and period interpretation of a
  modular parametrisation.

All page numbers refer to printed pagination. In the Serre PDF printed page 179 is PDF
page 1. In the Faltings PDF printed page 349 is PDF page 1. The Numdam PDFs include a
cover page: Carayol p. 409 is PDF page 2 and Deligne–Serre p. 507 is PDF page 2. In
Cremona's Chapter II PDF, subtract 6 from the printed page to obtain the one-based PDF
page.

## Layer R29.1. Exceptional primes and the residual conductor

The first layer produces infinitely many residual characteristics for which the
representation of $E$ is absolutely irreducible and has conductor $N$. The set discarded
has four clauses. Keeping them separate makes the definition reusable and permits tests
that detect loss of a local or global condition.

### The exceptional set

Define `HasRationalCyclicSubgroup E p` to mean that $E(\overline{\mathbb Q})$ has a
cyclic subgroup of order $p$ stable under $G_{\mathbb Q}$. When $p$ is prime this is
equivalently the existence of a ℚ-rational cyclic isogeny of degree $p$. The generator
need not be a rational point: a subgroup may be defined over ℚ while its nonzero points
are not. In the point-group description, stability means that every Galois automorphism
sends the subgroup onto itself.

Define `exceptionalPrimes E`, denoted $\Sigma_E$, to be the set of primes $p$ satisfying
at least one of the following conditions:

1. $p\leq5$.
2. $E$ has bad reduction at $p$, equivalently $p\mid N$.
3. There is a multiplicative prime ℓ such that $p\mid v_\ell(j_E)$.
4. `HasRationalCyclicSubgroup E p` holds.

The valuation in the third clause is a negative integer. Divisibility is ordinary
divisibility in ℤ; changing its sign does not change the clause. There are only finitely
many multiplicative primes and each has nonzero $v_\ell(j_E)$. The clause does not
quantify over every prime at which the displayed model has a denominator, nor over all
bad reduction types.

The API has the following assertions. `exceptionalPrimes_finite` states that $\Sigma_E$
is finite. `irreducible_of_not_mem` states that, for a prime $p\notin\Sigma_E$, $E[p]$
is irreducible over $\mathbb F_p$. `goodReduction_of_not_mem` gives good reduction at
$p$, and `not_dvd_conductor_of_not_mem` presents its equivalent arithmetic form. The
first two names above give the defining set and the rational-subgroup predicate; users
of the remaining assertions need not unfold either.

For finiteness of the last clause, use the finite ℚ-isogeny class of $E$ from
FaltingsFinitenessAndIsogenyTheorems
**R28.6/finiteness-of-the-isogeny-class-of-an-elliptic-curve**. For each representative
$E_i$ of that class, $\operatorname{Hom}_{\mathbb Q}(E,E_i)$ is infinite cyclic, by
**R28.6/hom-to-an-isogenous-elliptic-curve-is-infinite-cyclic**, together with the
**R28.6** input $\operatorname{End}_{\mathbb Q}(E_i)=\mathbb Z$. If a generator has
degree $d_i$, every nonzero homomorphism has degree $d_i n^2$ for a nonzero integer $n$.
A prime degree in this family can occur only with $n=\pm1$ and $d_i$ prime. A finite set
of representatives therefore gives a finite set of prime degrees. This proof includes
the CM case over ℚ and supplies precisely the qualitative finiteness needed in the
modularity argument.

An invariant line in $E[p]$ is a stable cyclic subgroup of order $p$. Its absence gives
irreducibility. It also explains why replacing the last clause by rational $p$-torsion
would give a weaker and unsuitable exceptional set. Rational torsion implies a rational
cyclic subgroup, but the converse does not hold.

**Sources and prerequisites.** The role of the exceptional set is Serre, §4.6, Lemma 5,
p. 207. The qualitative finiteness proof uses the R28.6 results just specified, rather
than the numerical rational-isogeny bound mentioned there. The other direct inputs are
ArithmeticGaloisRepresentations **R01.6**, Mathlib `WeierstrassCurve.j` and
`Set.Finite`, and the local reduction definitions of EllipticCurves Layer 4. No uniform
numerical bound on the elements of $\Sigma_E$ is needed or asserted.

### Comparison of conductors before and after reduction

For every prime $p$, `artinConductor_residualRep_dvd` asserts

$$
N(\bar\rho_{E,p})\mid N_E.
$$

At ℓ different from $p$, reduction of a stable lattice can enlarge the inertia-fixed
subspace, so the tame conductor contribution cannot increase. The wild inertia image is
a finite ℓ-group. Since its order is prime to $p$, averaging preserves the relevant
dimensions and the Swan contribution under reduction. At $p$ the residual conductor has
no factor. These local comparisons give the global divisibility, including small
residual characteristics; they do not assert equality there.

For $p\geq5$, `artinConductor_residualRep_eq_iff` states

$$
N(\bar\rho_{E,p})=N_E
\quad\Longleftrightarrow\quad
p\nmid N_E\ \text{and}\quad
p\nmid v_\ell(j_E)\text{ for every multiplicative prime }\ell.
$$

The condition at $p$ is necessary because the left side is prime to $p$. At a
multiplicative prime ℓ different from $p$, pass through at most an unramified quadratic
twist to a Tate curve with parameter $q_E$. Its inertia extension class on $E[p]$ is
controlled by $v_\ell(q_E)=-v_\ell(j_E)$. The extension becomes trivial precisely when
$p$ divides this integer. Its residual conductor exponent is then zero; otherwise it is
one, matching the characteristic-zero exponent. The unramified twist changes the split
sign but does not change this inertia criterion.

At additive primes, the finite potentially good inertia action has order dividing 24,
and its fixed-space and wild contributions survive reduction for $p\geq5$. In the
potentially multiplicative additive case, the ramified quadratic character retains the
zero fixed-space contribution; the wild contribution is also unchanged. Thus the
additive places impose no additional excluded primes beyond the small characteristics
already listed. These assertions require the full local-reduction interface, especially
at ℓ equal to 2 or 3.

Serre states this conductor criterion for $p>5$. The formulation at $p=5$ uses the same
local argument, since 5 is prime to 24 and to the quadratic character's order. The
existence proof below uses only $p\notin\Sigma_E$, and hence only $p\geq7$. Keeping that
distinction visible prevents a source locator for the stricter statement from serving as
the proof of the endpoint.

**Sources and prerequisites.** Both conductor assertions come from Serre, §4.6, p. 207,
the discussion between Lemma 5 and its application. The divisibility assertion imports
ArithmeticGaloisRepresentations **R01.6**, including the prime-to-$p$ residual conductor
comparison. The equality criterion also uses the preceding divisibility and Tau Ceti
EllipticCurves **Layer 4: Elliptic curves over local fields — reduction, Tate's
algorithm, the Tate curve**
(`tauceti:TauCetiRoadmap/EllipticCurves#layer-4-elliptic-curves-over-local-fields--reduction-tates-algorithm-the-tate-curve-aec-vii-ataec-ivv`).

### The residual representation outside the exceptional set

For every prime $p$, `det_residualRep` identifies $\det\bar\rho_{E,p}$ with the mod-$p$
cyclotomic character, by the Weil pairing. For a prime $p\notin\Sigma_E$, the two
further conclusions are `absolutelyIrreducible_of_not_mem` and
`artinConductor_residualRep_of_not_mem`:

$$
\bar\rho_{E,p}\text{ is absolutely irreducible},\qquad
N(\bar\rho_{E,p})=N_E.
$$

Absolute irreducibility means irreducibility after extension from $\mathbb F_p$ to every
field containing it. The passage from irreducibility over $\mathbb F_p$ uses oddness.
Complex conjugation has eigenvalues $1,-1$, distinct because $p$ is odd. If an
irreducible two-dimensional representation split into two characters over an algebraic
closure, those lines would be its complex-conjugation eigenlines, already defined over
$\mathbb F_p$. This contradicts irreducibility over $\mathbb F_p$. This argument uses
the base field ℚ and the oddness hypothesis; it is not a statement about every
two-dimensional representation of every group over a finite field.

**Sources and prerequisites.** Serre, §4.6, (4.6.1), Lemma 5 and (4.6.2)–(4.6.3), p.
207, gives the determinant, irreducibility and conductor conclusions. The oddness
argument is §3.3, p. 198. Import it from ArithmeticGaloisRepresentations **R01.4**, and
the Weil pairing and determinant from **R01.6**. The other inputs are the
exceptional-set API and the conductor-equality criterion in this layer.

### Tests of all four exceptional-set clauses

The following tests use concrete nonsingular equations. They distinguish the
small-prime, bad-reduction, valuation, and rational-isogeny clauses; membership alone in
an example satisfying two clauses does not test either one separately.

* `exceptionalPrimes_11a1`: for
  $E: y^2+y=x^3-x^2-10x-20$, both 5 and 11 lie in $\Sigma_E$.
  Here $\Delta=-11^5$, $c_4=496$, and ($5,5$) has order 5. The prime
  11 is bad, while 5 is also included by the small-prime clause.
* `exceptionalPrimes_contains_small`: for every $E$, the primes 2, 3
  and 5 are included. The statement has no hypothesis on the reduction
  type at those primes.
* `exceptionalPrimes_CM`: for $E:y^2=x^3-x$, with
  $\Delta=2^6$ and geometric CM by ℤ[i], the set remains finite and
  contains 2. The finiteness theorem is not restricted to non-CM curves.
* `exceptionalPrimes_11a1_seven`: 7 is outside the exceptional set of
  11a1. It is good at 7, its only multiplicative prime is 11, and
  $v_{11}(j_E)=-5$. There is no rational cyclic subgroup of order 7:
  the good reduction count $\#E(\mathbb F_3)=5$ gives $a_3=-1$, and
  $a_3^2-4\cdot3\equiv3\pmod7$ is a nonsquare. A globally stable
  $\mathbb F_7$-line would force that Frobenius polynomial to split.
* `exceptionalPrimes_26b1`: for
  $y^2+xy+y=x^3-x^2-3x+3$, 7 is exceptional despite good reduction
  at 7. The point ($1,0$) has order 7, with multiples giving
  $x=1,-1,3$, and $\Delta=-2^7\cdot13, c_4=129$ give
  $v_2(j_E)=-7$. The isogeny and valuation clauses both apply.
* `exceptionalPrimes_valuation_only`: for
  $y^2+xy=x^3-7x+9$, $\Delta=-2^7\cdot137, c_4=337$. At the
  multiplicative prime 2, $v_2(j_E)=-7$, so 7 is exceptional. It is
  good at 7 and has no rational 7-isogeny: $\#E(\mathbb F_3)=6$,
  $a_3=-2$, and the Frobenius discriminant is the nonsquare 6 modulo
  7. This test detects deletion of the valuation clause.
* `exceptionalPrimes_isogeny_only`: for
  $y^2+xy+y=x^3-x^2-5x+5$, $\Delta=-2^3\cdot3^4, c_4=225$.
  It is good at 7, additive at 3, and multiplicative only at 2, where
  $v_2(j_E)=-3$. Nevertheless 7 is exceptional through a rational
  cyclic subgroup. The irreducible cubic $x^3-3x^2+3$ divides the
  7-division polynomial and its roots are permuted by duplication,
  giving the three pairs of nonzero points of that subgroup. This
  test detects deletion of the rational-isogeny clause, and also
  distinguishes a rational subgroup from a rational generator.

The computations are uses of the curve invariant and point-group APIs. The
interpretation of their results uses the definition in this layer, the good-reduction
Frobenius polynomial from R01.6, and the local reduction tests from EllipticCurves Layer
4. The expected finite-set and residual conclusions follow the Lemma 5 interface, rather
than assuming modularity of the curves being tested.

## Layer R29.2. Finite-flat weight two and Serre witnesses

Fix a prime $p\notin\Sigma_E$. The first layer gives $p\geq7$, good reduction at $p$,
absolute irreducibility of $E[p]$, cyclotomic determinant, and residual conductor $N_E$.
This layer determines its Serre weight and constructs the characteristic-zero modular
data used in the infinite-congruence argument.

### Finite flatness determines the weight

`serreWeight_residualRep` states

$$
k(\bar\rho_{E,p})=2\qquad(p\notin\Sigma_E).
$$

The good-reduction model is an abelian scheme over ℤₚ. Its $p$-torsion is a finite flat
group scheme, and its generic fibre realizes the local representation on $E[p]$. The
determinant on inertia at $p$ is the mod-$p$ cyclotomic character. Together these give
weight two under Serre's recipe. A congruence $k\equiv2\pmod{p-1}$ alone is
insufficient: finite flatness selects the actual weight, not just its congruence class.
This distinction also excludes the multiplicative-at-$p$ cases with weight $p+1$.

The determinant identity also fixes the residual tame character. In Serre's convention
the determinant is the product of that character and the cyclotomic character to the
power $k-1$. At weight two this leaves the tame character equal to 1. Thus all the
hypotheses of the trivial-character weight-two export of classical Serre modularity are
available before a modular form for $E$ is constructed.

**Sources and prerequisites.** Serre, §2.8, Proposition 4, pp. 189–190, identifies
weight two with the cyclotomic determinant and finite flatness; §2.9, Proposition 5$i$,
p. 191, applies this to good elliptic reduction. The specialization to trivial character
is §3.3, p. 198. Import finite-flat torsion from
FiniteFlatGroupsAndIntegralPadicHodgeTheory
**R07.6/abelian-scheme-torsion-finite-flat**, the weight equivalence from
AlgebraicModularFormsAndSerreWeights **R15.4/weight-two-iff-finite-flat-at-p**, and the
determinant interface from ArithmeticGaloisRepresentations **R01.6**. The remaining
hypotheses are the residual conclusions of Layer R29.1.

### The witness at a residual characteristic

The data `SerreWitness E p` consists of a normalized newform $g_p$ of weight two and
level $N_E$, and a maximal ideal $\lambda_p$ of the ring of algebraic integers in ℂ
containing $p$. Its residue field has characteristic $p$. The operation `serreWitness E
hp h` selects these data for a prime $p$ with $p\notin\Sigma_E$; no selection is
asserted at an exceptional prime.

The character and comparison properties are accessed through the API:

* `serreWitness_level` gives the trivial nebentypus. Weight two and the
  level $N_E$ are part of the form's type.
* `serreWitness_trace` gives, for every prime $\ell\nmid N_Ep$,
  $A_\ell(g_p)-a_\ell(E)\in\lambda_p$. The membership is a statement
  about an algebraic integer, with the complex coefficient obtained by
  its inclusion into ℂ.
* `serreWitness_residual` gives the equivariant comparison
  $\bar\rho_{g_p,\lambda_p}\simeq
  \bar\rho_{E,p}\otimes_{\mathbb F_p}k_{\lambda_p}$.
  In the point-module formulation it is an equivariant
  $\mathbb F_p$-linear map $E[p]\to k_{\lambda_p}^2$ whose image spans
  the target over $k_{\lambda_p}$. After scalar extension this map is
  an isomorphism between two two-dimensional representations.

The newform is primitive at the exact level $N_E$, rather than merely an eigenform in a
space at that level. This property is what lets the next layer take its finite range
inside the normalized newforms of level $N_E$. In a formulation passing first through
characteristic $p$, the integral Hecke lattice and eigenvalue lifting supply the
characteristic-zero form. The residual representation is compared after
semisimplification as in the automorphic residual interface. Absolute irreducibility of
$E[p]$ ensures that this comparison is adequate.

The ring of all algebraic integers used in the witness is convenient for choosing a
prime before choosing one coefficient field. In the norm argument it is restricted to
the finite field generated by a particular newform's coefficients. The prime ideals then
lie in its ring of integers, where the norm is defined by a finite free ℤ-module. No
norm of the entire ring of algebraic integers in ℂ is used.

**Sources and prerequisites.** Serre, §3.3, (3.3.1 with its conjectural marker), p. 198,
and its application in §4.6, p. 207, give the weight-two residual modular data. The
unconditional input is ClassicalSerreModularity **R27.6/finite-flat-weight-two-export**.
The other inputs are finite-flat weight two in this layer, the residual irreducibility
and conductor in R29.1, Mathlib `CuspForm`, and Tau Ceti `HeckeRing.GL2.Newform`. The
automorphic residual representation is the interface of AutomorphicGaloisRepresentations
**R19.6/residual-representation-of-a-newform**. The elliptic modularity export in R20.6,
whose hypotheses already include modularity of $E$, cannot serve as an input to this
existence argument.

### Trivial character from reduction

A separate elementary assertion explains how to recover the characteristic-zero trivial
character from a congruence. Suppose $K$ is a number field, $p$ is prime, $\mathfrak
p\subset\mathcal O_K$ is a prime above $p$, and $\zeta\in\mathcal O_K$ satisfies

$$
\zeta^m=1,\qquad p\nmid m,\qquad \zeta-1\in\mathfrak p.
$$

Then `eq_one_of_pow_eq_one_of_sub_mem` asserts $\zeta=1$. Reduction is injective on
roots of unity of order prime to $p$. One proof uses the factorization of $\zeta^m-1$:
if $\zeta\neq1$, the sum of the $m$ powers is zero, but its reduction is $m$, which is
nonzero in characteristic $p$. This proof also makes the prime-to-$p$ condition
explicit.

Consequently, if a character $\varepsilon$ of $(\mathbb Z/N\mathbb Z)^\times$ takes
algebraic-integer root-of-unity values, reduces to 1 at a prime above $p$, and
$p\nmid\varphi(N)$, then $\varepsilon=1$. The order of every value divides $\varphi(N)$.
The condition on $\varphi(N)$ is used in this reduction argument; the chosen Serre
witness already has trivial character by the weight-two export and does not need this
additional exclusion.

The coprimality hypothesis is essential. At level 5 and residual prime 2, a quadratic
character has values $\pm1$, both reducing to 1. Thus a character may reduce to the
trivial character without being trivial when its order is divisible by $p$. Primality of
the rational integer called $p$ is also a genuine hypothesis: an ideal containing a
composite integer need not have that characteristic.

**Source and prerequisites.** This isolates the character reasoning in Serre, §3.3, p.
198, with the determinant convention of §1.3, p. 181. Mathlib `IsPrimitiveRoot` and
`Nat.totient` provide the root-order and unit-group vocabulary. The proof is an
algebraic-integer reduction argument and assumes a proper prime ideal above the
specified rational prime.

### Witness tests

At level 11 the normalized weight-two form is

$$
f_{11}(z)=\eta(z)^2\eta(11z)^2
 =q\prod_{n\geq1}(1-q^n)^2(1-q^{11n})^2.
$$

Its first coefficients are $A_1=1, A_2=-2, A_3=-1$. The one-dimensional newform space
means that the witness's selected prime may vary while its form at $p=7$ is fixed.

* `serreWitness_11a1` asserts that the form of the witness of 11a1 at
  7 is $f_{11}$, as a function on the upper half-plane. The preceding
  `exceptionalPrimes_11a1_seven` test supplies the domain condition.
* `serreWitness_trace_2` asserts the exact values
  $A_2(g_7)=-2=a_2(11a1)$. In particular the congruence API must
  specialize correctly at a good prime distinct from 7.
* `serreWitness_not_at_exceptional` asserts $5\in\Sigma_{11a1}$
  and reducibility of $E[5]$. Its rational point ($5,5$) spans an
  invariant line. A witness with the irreducible Serre hypotheses is
  therefore not supplied at 5.

These tests use the eta function and its q-expansion, finite-field point counts, and the
torsion action. Their mathematical role is to test the exact level, normalization, trace
convention, and domain of the witness construction, not merely to exhibit a cusp form
congruent to $E$.

## Layer R29.3. One newform with exact coefficients

Congruences at infinitely many rational primes can be used one coefficient at a time.
The key is to choose a single form on an infinite set of residual characteristics before
taking norms. This layer also defines the attachment predicate independently of
existence, proves its uniqueness, and determines the coefficient field.

### The finite-range argument

For an infinite set $P\subseteq\mathbb N$, a finite type $I$, and a map $u:P\to I$,
there is an $i\in I$ such that $u^{-1}(i)$ is infinite. The interface
`exists_infinite_fiber` permits a function on ℕ and returns the infinite set $P\cap
u^{-1}(\{i\})$. It is a direct specialization of Mathlib `Finite.exists_infinite_fiber`
to the subtype of $P$. The finite type can be equipped with a `Finite` instance; there
is no need to choose a particular enumeration.

For use with modular forms, the finite type consists of normalized newforms of fixed
weight and level with the relevant character. The finite-dimensional space alone does
not make all of its vectors a finite set. It is the normalized Hecke eigenforms in its
new subspace that form a finite collection. Normalization removes the infinitely many
scalar multiples of a nonzero eigenvector.

**Source and prerequisites.** This is the finite-choice step of Serre, §4.6, p. 208. Its
set-theoretic content imports Mathlib `Finite.exists_infinite_fiber` and `Set.Infinite`.
The modular finiteness theorem is supplied by Tau Ceti ModularForms **Layer 4:
Eigenforms, newforms, primitive forms, the conductor**
(`tauceti:TauCetiRoadmap/ModularForms#layer-4-eigenforms-newforms-primitive-forms-the-conductor`).
The current Tau Ceti library supplies the instance `Finite (Newform M k)` in
`TauCeti.NumberTheory.ModularForms.Newforms.OrthogonalBasis`, derived from
`HeckeRing.GL2.Newform.basis`. Use that instance when working beyond the pinned
baseline; restrict it to the trivial-character subtype for the witness range.

### Vanishing of an algebraic integer

Let $K$ be a number field and $\alpha\in\mathcal O_K$. Suppose $P$ is an infinite set of
distinct rational primes and, for each $p\in P$, there is a prime ideal $\mathfrak
p_p\subset\mathcal O_K$ above $p$ containing $\alpha$. Then `eq_zero_of_mem_primes`
asserts $\alpha=0$.

Indeed $p\mid\operatorname{Norm}_{K/\mathbb Q}(\alpha)$ for each such $p$. The norm is
an ordinary integer. If it were nonzero it could have only finitely many prime divisors.
Once it is zero, Mathlib `Algebra.norm_eq_zero_iff` applies to the finite free extension
of domains $\mathcal O_K/\mathbb Z$. The reduction-to-norm step follows from the
determinant of multiplication by $\alpha$ modulo $p$: a prime ideal above $p$ containing
$\alpha$ makes this multiplication noninvertible on $\mathcal O_K/p\mathcal O_K$, so its
determinant is zero modulo $p$.

The integer form `int_eq_zero_of_forall_dvd` says that an integer divisible by every
member of an infinite subset of ℕ is zero. A nonzero integer's positive divisors are
bounded by its absolute value; infinite subsets of ℕ are unbounded. Mathlib
`Int.eq_zero_of_abs_lt_dvd` gives the final contradiction. This integer form does not
need primality because infinitely many distinct natural divisors already suffice.

The number-field form does require infinitely many different rational characteristics. A
single congruence is inadequate: $2\in(2)$, yet $2\neq0$. A finite extension has only
finitely many primes above a fixed rational prime, so an assertion phrased merely as
repeated membership at one characteristic cannot establish the conclusion. The element
must also be integral. The comparison applies to $A_\ell(F)-a_\ell(E)$, whose two
summands are integral, without clearing a denominator that depends on $p$.

**Source and prerequisites.** This supplies the algebraic justification of Serre, §4.6,
(4.6.4), p. 208. Its direct library inputs are `NumberField.RingOfIntegers`,
`Algebra.norm`, `Algebra.norm_eq_zero_iff`, and `Int.eq_zero_of_abs_lt_dvd`, with the
finite free integral-basis structure of a number field's integers. The number-field norm
is taken after fixing the form and its field.

Small checks distinguish the hypotheses: no infinite set of natural numbers can all
divide 6; the infinite set of primes has an infinite fibre under a map to two congruence
classes; and $3\nmid2$. The two-class example asserts that one fibre is infinite, not
that the pigeonhole theorem identifies which fibre, or proves infinitude of each class
separately.

### Attachment and uniqueness across levels

For $E/\mathbb Q$, a positive integer $M$, and a normalized newform $F$ of weight two
and level $M$, define `IsNewformOf E F` by

$$
\chi_F=1\quad\text{and}\quad
A_\ell(F)=a_\ell(E)\text{ for all but finitely many primes }\ell.
$$

This definition neither assumes $M=N_E$ nor asserts the existence of $F$. The bad-prime
values are included in the expression but may all belong to its finite exceptional set.
Equivalently, one can require agreement outside a finite set containing the primes
dividing $MN_E$. This makes attachment the appropriate input to an independent local
comparison theorem.

The API `IsNewformOf.unique` says that two attached newforms at levels $M,M'$ have
$M=M'$ and identical Fourier coefficients at every index. Transporting one form along
the level equality then identifies the bundled forms. The proof invokes cross-level
strong multiplicity one with agreement at almost all primes not dividing $MM'$. Both
forms must be new. An oldform raised from a proper divisor is not an input to this
theorem.

`IsNewformOf.congr` says that if $a_\ell(E)=a_\ell(E')$ at almost all primes, then $F$
is attached to $E$ exactly when it is attached to $E'$. Changes of Weierstrass model and
ℚ-isogenies satisfy this hypothesis by their good-prime Tate-module comparisons. The
predicate therefore depends on the isogeny class, even though a later chosen
parametrisation depends on the individual curve.

**Source and prerequisites.** Serre, §4.6, (4.6.4), p. 208, supplies the coefficient
relation being named. The definition uses Tau Ceti `HeckeRing.GL2.Newform` and Mathlib
`WeierstrassCurve.LFunction`. Uniqueness is imported from Tau Ceti ModularForms **Layer
5: Strong multiplicity one and the eigenform characterization**
(`tauceti:TauCetiRoadmap/ModularForms#layer-5-strong-multiplicity-one-and-the-eigenform-characterization`),
in the cross-level weight-two trivial-character form associated there with Miyake's
Theorem 4.6.19. The fixed-level library theorem listed in the introduction cannot
replace this input.

The defining predicate has three named tests:

* `isNewformOf_11a1` asserts that $f_{11}$ is attached both to 11a1
  and to 11a3, $y^2+y=x^3-x^2$, which is ℚ-isogenous to it.
* `not_isNewformOf_37a1` asserts that no newform of level 11 is
  attached to $37a1:y^2+y=x^3-x$. At 3 its trace is $-3$, while
  $f_{11}$ has coefficient $-1$. That single discrepancy alone
  does not disprove an almost-all-primes condition. The theorem in
  R29.4 giving the exact conductor, or the Tate comparison and
  isogeny criterion, supplies the decisive obstruction: the
  conductors 37 and 11 differ. In particular, the two good-prime
  sequences cannot agree outside a finite set.
* `not_isNewformOf_of_char_ne_one` asserts that a weight-two newform
  with nontrivial character is attached to no $E/\mathbb Q$.
  This test follows from the explicit character clause, regardless
  of any sample coefficient agreement.

### From infinitely many congruences to one exact form

`exists_newform_coeff_eq` states that there is a normalized newform $F$ of weight two,
level $N_E$, and trivial character with

$$
A_\ell(F)=a_\ell(E)\qquad\text{for every prime }\ell\nmid N_E.
$$

Start with the infinite set of primes outside the finite set $\Sigma_E$. Apply the
witness construction to each. The finite collection of normalized forms at level $N_E$
has an infinite fibre, so one form $F$ occurs for infinitely many distinct residual
primes $p$. The prime above $p$ is allowed to vary. Fix a good prime ℓ and remove
$p=\ell$ from this infinite set. The witness trace congruence puts $A_\ell(F)-a_\ell(E)$
in a prime above every remaining $p$. Restrict those ideals to $\mathcal O_{K_F}$; they
remain primes above their respective rational characteristics. Norm vanishing gives the
exact equality for this ℓ. Repeat for each good ℓ using the same form $F$, while
allowing the infinite subset with $p\neq\ell$ to depend on ℓ.

No uniform choice of one residual prime works for all ℓ, and none is needed. The object
held fixed throughout the coefficient argument is the form in the infinite fibre.
Conversely, allowing the form itself to vary with $p$ while taking a norm would compare
elements in different coefficient fields and would not establish equality of any one
form's coefficients.

The exact level here follows from the exact-level witness. The historical argument can
first produce a primitive form at a divisor of $N_E$, then use local compatibility to
show that the divisor is $N_E$. The conditional exact-conductor theorem in R29.4 retains
that useful comparison for any attached form; it does not need the witness construction
as a hypothesis.

**Sources and prerequisites.** This is Serre, §4.6, proof of Theorem 4, pp. 207–208. The
eigenvalue lifting used on the way to the characteristic-zero form is Serre (3.1.6), pp.
194–195, and Deligne–Serre, Lemme 6.11, p. 522. Import the latter from
AlgebraicModularFormsAndSerreWeights **R15.5/deligne-serre-eigenvalue-lifting-lemma**.
Lifting preserves the eigenvalues after a finite extension; it does not promise that an
arbitrarily specified eigenvector itself lifts. The direct inputs in this roadmap are
the Serre witnesses in R29.2, the infinite-fibre and norm-vanishing assertions above,
and the attachment predicate. Finiteness of the forms is ModularForms Layer 4.

### Rationality of the whole coefficient field

For any attached newform $F$ of any level, `IsNewformOf.coeff_int` states that each
$A_n(F)$ is a rational integer. In particular $K_F=\mathbb Q$. This conclusion applies
to an attached form provided by a geometric construction as well as to the form just
constructed by congruences.

For every embedding $\sigma:K_F\hookrightarrow\mathbb C$, the conjugate form $F^\sigma$
is a normalized newform of the same level, with coefficients $\sigma(A_n(F))$. Its
character is trivial because the original character is trivial. At almost all good
primes the coefficient $A_\ell(F)=a_\ell(E)$ is already a rational integer, so
$F^\sigma$ is attached to $E$ as well. Attachment uniqueness then gives
$\sigma(A_n(F))=A_n(F)$ for every $n$. Every coefficient is rational and is also an
algebraic integer, hence lies in ℤ.

This reasoning is needed at bad primes and composite indices too. Rationality of a few
Hecke traces, or of the good traces without a uniqueness theorem, is not the
all-coefficient statement. For general nebentypus, Galois conjugation also conjugates
the character, so the character preservation used here must be limited to the trivial
case.

**Source and prerequisites.** Serre's rational-coefficient step is §4.6, p. 208. The
attachment predicate and its cross-level uniqueness are the preceding API and
ModularForms Layer 5. The construction and coefficient formula for the conjugate newform
are supplied by Tau Ceti ModularForms **Layer 8g: Galois stability, the character field,
and rationality**
(`tauceti:TauCetiRoadmap/ModularForms#layer-8g-galois-stability-the-character-field-and-rationality`).
Algebraic integrality of normalized newform coefficients is part of the modular-form
input, as in Cremona §2.6, pp. 24–25.

### The newform of an elliptic curve

Define `newformOf E`, denoted $F_E$, by selecting the unique attached newform of weight
two and level $N_E$. Existence follows from `exists_newform_coeff_eq`, and attachment
uniqueness makes the choice independent of the witnesses used in its proof. The API is:

* `isNewformOf_newformOf`: $F_E$ is attached to $E$.
* `newformOf_coeff_prime`: $A_\ell(F_E)=a_\ell(E)$ at every good
  prime ℓ, with no further exceptional primes.
* `newformOf_unique`: every attached newform $F$ at any positive
  level $M$ has $M=N_E$ and all coefficients equal to those of
  $F_E$.
* `newformOf_coeff_int`: every $A_n(F_E)$ lies in ℤ.

The construction itself is `newformOf`; its character is trivial by attachment, exposed
also as `newformOf_χ`. Equality between forms whose level expressions differ is stated
first as equality of levels and coefficients, and then transported to the common bundled
type. This avoids concealing a level-identification requirement inside an untyped
equation.

**Source and prerequisites.** Serre, §4.6, p. 208, supplies the existence and
rationality conclusion. The direct inputs are the exact good-coefficient existence
theorem, attachment and uniqueness, the rational-coefficient-field assertion, and Tau
Ceti `HeckeRing.GL2.Newform`. ModularForms Layer 4 supplies the new/old distinction
needed in the following tests.

* `newformOf_11a1`: $N_{11a1}=11$ and $F_{11a1}=f_{11}$.
* `newformOf_isogeny_invariant`: 11a1, 11a2
  ($y^2+y=x^3-x^2-7820x-263580$), and 11a3 have identical
  Fourier coefficients in their $F_E$. The construction is
  invariant under ℚ-isogeny.
* `newformOf_twist`: if $E'$ is the twist of 11a1 by $-1$,
  presented as $y^2=x^3+4x^2-160x+1264$, then
  $A_\ell(F_{E'})=\chi_{-4}(\ell)A_\ell(F_{11a1})$ for every prime
  $\ell\nmid2\cdot11$. Here $\chi_{-4}$ is the nontrivial
  character modulo 4, matching Mathlib's `ZMod.χ₄`. The excluded
  primes are the ones where this simple good-reduction twist
  formula does not apply.

A further newness check is level 22. The two forms $f_{11}(z)$ and $f_{11}(2z)$ span the
weight-two cusp space there, and its new part is zero. The level-11 form is attached to
11a1, but this does not produce a newform of level 22. This is a test both of exact
level and of the bundled newform condition used in attachment uniqueness. The divisor
multiplicity behind the example is Cremona, §2.7, p. 26, and is used again in the
geometric converse.

## Layer R29.4. Tate modules, exact conductor and every Euler factor

This layer starts with an arbitrary attached newform $F$ of level $M$. Its hypotheses do
not include a Serre witness or the existence construction of $F_E$. All its coefficients
are integers by R29.3, so its Galois representations can be compared with $V_r(E)$ over
$\mathbb Q_r$. The comparison is global first, then local, with the bad-place monodromy
retained.

### The rational Tate-module comparison

For every prime $r$, `IsNewformOf.nonempty_tateModule_equiv` asserts an isomorphism of
$\mathbb Q_r[G_{\mathbb Q}]$-modules

$$
V_r(E)\simeq V_r(F).
$$

Here $V_r(F)$ is the two-dimensional rational representation of the newform with
coefficient field ℚ. At a prime ℓ outside a finite set containing the divisors of
$MN_Er$, both representations are unramified, and both Frobenius polynomials are
$X^2-a_\ell(E)X+\ell$. This uses the full determinant identity in addition to trace
agreement.

Chebotarev and Brauer–Nesbitt identify their semisimplifications. To identify the actual
representations, verify semisimplicity on both sides. For $E$ use the elliptic
Tate-module semisimplicity theorem. For $F$, the dimension theorem for the modular
quotient gives a dimension-one abelian variety because $K_F=\mathbb Q$. The comparison
of its Tate module with the newform realization and Faltings semisimplicity then gives
semisimplicity of $V_r(F)$. This route does not require an independently proved
irreducibility theorem for every automorphic representation as an extra input.

The statement is an equivariant linear isomorphism, not an equality of matrices in
unrelated bases. The module structure over the monoid algebra $\mathbb Q_r[G_{\mathbb
Q}]$ is a convenient bundled form. The input representations still have their continuity
and unramifiedness properties from their owners. The algebraic module isomorphism is
used to compare the local restrictions and Tate modules, rather than to reconstruct
those structures from scratch.

**Sources and prerequisites.** Serre, §4.6, p. 208, uses the comparison after (4.6.4).
Faltings, §5, Satz 3, p. 360, and Korollar 2, p. 361, give the semisimplicity and
recognition framework. The direct inputs are attachment and rational coefficients in
R29.3; ArithmeticGaloisRepresentations **R01.5** for Chebotarev/Brauer–Nesbitt and
**R01.6** for $E$; FaltingsFinitenessAndIsogenyTheorems
**R28.6/semisimplicity-of-the-rational-tate-module-of-an-elliptic-curve** and
**R28.4/semisimplicity-and-the-tate-homomorphism-comparison**;
AutomorphicGaloisRepresentations **R19.1/newform-rank-two-realisation** and
**R19.6/weight-two-tate-module-decomposition**; and ModularCurvesPartII
**R14.5/modular-quotient-dimension**.

As an acceptance condition, the comparison must be available for each auxiliary prime
$r$, not just for one chosen prime. Its proof may choose its finite exceptional
Frobenius set separately for each $r$. The next assertions require an auxiliary prime
different from each local place, which this quantification supplies.

### The level is the conductor

`IsNewformOf.level_eq` states that every attached newform has

$$
M=N_E.
$$

Fix a rational prime ℓ and choose $r\neq\ell$. Restrict the Tate isomorphism to the
decomposition group at ℓ. The Artin conductor of $V_r(E)$ at ℓ gives $v_\ell(N_E)$. Full
local compatibility of the primitive newform representation gives $v_\ell(M)$. Their
equality proves the equality of levels prime by prime. In particular, local
compatibility includes the potentially multiplicative monodromy operator and the
additive wild conductor; agreement of good Frobenius traces alone does not compute those
local invariants.

Using two distinct choices of $r$ is enough to measure every place: when ℓ equals the
first auxiliary prime, use the second. This is the precise reason that a prime-to-$r$
conductor comparison for one fixed $r$ does not by itself give equality of the full
integers $M$ and $N_E$.

**Source and prerequisites.** Carayol, §0.8, Corollaire, p. 411, asserts the conductor
identity for the curve attached to a rational newform; its proof invokes Theorem $A$,
§0.7, pp. 410–411, and the elliptic conductor comparison. Here the direct inputs are the
Tate isomorphism just obtained, AutomorphicGaloisRepresentations
**R19.4/conductor-and-local-factors-classical**, and ArithmeticGaloisRepresentations
**R01.6**. The local representation must be transported between Carayol's cohomological
normalization and the homological arithmetic-Frobenius convention fixed above.

The level-11/level-22 oldform example tests the primitive-form hypothesis: an old
eigenform at 22 with good traces of 11a1 would not satisfy the conclusion if it were
admitted as a newform. The 37a1 non-example tests the almost-all-primes input in the
other direction: its conductor forces an attached form's level to be 37.

### The bad factors and all Dirichlet coefficients

`IsNewformOf.localPolynomial_eq` identifies, for every rational prime ℓ, Mathlib's local
polynomial with

$$
P_\ell(E,T)=1-A_\ell(F)T+
\begin{cases}
\ell T^2,&\ell\nmid N_E,\\
0,&\ell\mid N_E.
\end{cases}
$$

The coefficient $A_\ell(F)$ is first identified with an integer, so the polynomial is in
ℤ[T]. At multiplicative places this integer is 1 in the split case and $-1$ in the
nonsplit case. At additive places it is zero. Thus $A_\ell(F)=a_\ell(E)$ holds at
**every** prime, supplementing the good-prime existence theorem. The bad-prime $U_\ell$
coefficient formula for a weight-two newform of trivial character is compatible with
these values: $\pm1$ when $\ell\parallel M$, and 0 when $\ell^2\mid M$.

Full local compatibility gives the equality of Euler polynomials using the corresponding
Weil–Deligne representation. An isomorphism only of the semisimplified local Galois
representations would discard the monodromy information at a Steinberg place. The global
Tate isomorphism here is of the actual representations, so restriction preserves that
information; the local-factor interface must preserve it too.

The statement compares Mathlib's minimal model over ℤℓ with its local polynomial.
Mathlib's number-field Euler product instead uses completions at height-one prime ideals
of $\mathcal O_{\mathbb Q}$. The identification of that completion and its valuation
ring with ℚℓ and ℤℓ is part of the arithmetic comparison interface. It transports the
curve, minimal model, residue-field point count and polynomial. Treating the completion
identification as definitional would leave a gap between the local polynomial theorem
and the formal L-function statement.

`IsNewformOf.coeff_eq` then gives

$$
A_n(F)=a_n(E)\qquad(n\geq0).
$$

At $n=0$ both sides are zero; at $n=1$ both are one. For positive indices, use
multiplicativity at coprime arguments and the prime-power recurrence. For a good prime
ℓ,

$$
a_{\ell^{t+1}}=a_\ell a_{\ell^t}-\ell a_{\ell^{t-1}}
\qquad(t\geq1),
$$

and for a bad prime $a_{\ell^t}=a_\ell^t$. The same identities hold for $F$. Agreement
of the local polynomials and initial terms therefore identifies all positive
coefficients. This is the usable coefficient interface for the analytic application; it
does not simply rename equality of good traces.

**Sources and prerequisites.** Carayol, §0.8, Corollaire, p. 411, gives the
all-local-factor identity. The coefficient recurrences are Cremona, §2.6,
(2.6.1)–(2.6.2), p. 25. Direct inputs are the Tate comparison and exact conductor in
this layer, AutomorphicGaloisRepresentations
**R19.4/conductor-and-local-factors-classical**, Mathlib
`WeierstrassCurve.localPolynomial`, EllipticCurves Layer 4 for local reduction, and
ModularForms Layer 4 for the bad-prime eigenvalues and newform coefficient recurrences.

For 11a1 the split multiplicative polynomial at 11 is $1-T$, so its newform coefficient
there is 1. For a nonsplit multiplicative place the polynomial must change to $1+T$. For
the CM test curve $y^2=x^3-x$ at 2 the additive polynomial is 1. These three cases test
the removal of the quadratic term and the split sign. They also show why dropping all
bad places from the Euler product would lose information needed for equality of L-series
and conductors.

## Layer R29.5. Quotient isogenies and modular parametrisations

The coefficient comparison produces an elliptic modular quotient whose Tate module
agrees with that of $E$. This layer passes from the representation to an isogeny over ℚ,
then uses the rational cusp of the modular curve to produce a morphism to the given
elliptic curve. The form is canonical; the isogeny and the resulting parametrisation
require a choice.

### Isogeny from the modular quotient

For a newform $F$ attached to $E$, its coefficient field is ℚ and its level is $N_E$.
The modular quotient $A_F^0$ of J₀($N_E$) has dimension one and has a rational origin;
it is therefore an elliptic curve over ℚ. Its rational Tate module is the representation
of $F$, through its comparison with the J₁ quotient. By R29.4 it is isomorphic to
$V_r(E)$.

`IsNewformOf.nonempty_quotientIsogeny` states that there is a ℚ-isogeny
$\lambda:A_F^0\to E$. Faltings's isogeny criterion gives an isogeny over the ground
field ℚ. A rational Tate-module isomorphism alone is not an isomorphism of elliptic
curves; the conclusion is isogeny. One can choose an isogeny in the indicated direction,
and its kernel is finite. Both the origin and the field of definition are retained.

The interface `QuotientIsogeny E F hF` packages the chosen map from the J₀ quotient with
its origin-preservation and surjectivity properties. The interpretation as an isogeny
uses the dimension-one assertion above: a surjective origin-preserving morphism between
these elliptic curves is automatically a homomorphism with finite kernel. The quotient
scheme and its origin are imported objects, rather than alternative definitions of the
modular quotient.

Two consequences are useful without any existence theorem for all elliptic curves.
`IsNewformOf.exists_hom_J0` gives a surjective homomorphism J₀($M$) → $E$ over ℚ from an
attached form of level $M$. `IsNewformOf.exists_hom_X0` gives a nonconstant, hence
surjective, morphism X₀($M$) → $E$ sending ∞ to $O$. Here R29.4 implies $M=N_E$, but the
signatures permit an arbitrary attached form's level.

**Sources and prerequisites.** This is the isogeny step of Serre, §4.6, p. 208, after
(4.6.4). Faltings, §5, Korollar 2, p. 361, gives the implication from isomorphic Tate
representations to isogeny. The direct inputs are rationality in R29.3, Tate comparison
and exact conductor in R29.4, ModularCurvesPartII **R14.5/modular-quotient-dimension**
and **R14.5/trivial-character-J0**, AutomorphicGaloisRepresentations
**R19.6/weight-two-tate-module-decomposition**, and FaltingsFinitenessAndIsogenyTheorems
**R28.6/isogeny-criterion-for-elliptic-curves**. The X₀ consequence additionally uses
the Abel–Jacobi and nonzero composite interfaces specified next.

### The morphism from X₀ at the conductor

For $F_E$ and a chosen `QuotientIsogeny` $\lambda$, define `modularParametrisation lam`
by the composite

$$
X_0(N_E)\xrightarrow{x\mapsto[x-\infty]}J_0(N_E)
\xrightarrow{\pi_{F_E}}A_{F_E}^0
\xrightarrow{\lambda}E.
$$

The rational cusp ∞ fixes the Abel–Jacobi map over ℚ. Each arrow is over ℚ, and their
composition is too. The cusp maps to zero in the Jacobian, then to zero in the quotient,
and then to $O$ in $E$. The quotient receives a nonzero Abel–Jacobi composite; composing
with an isogeny between elliptic curves remains nonconstant. A nonconstant morphism
between smooth projective integral curves is finite and surjective, with positive degree
equal to the extension degree of function fields.

The API consists of the constructor and three mathematical properties:

* `modularParametrisation_cusp` states $\phi_E(\infty)=O$.
* `modularParametrisation_nonconstant` states surjectivity
  and $\deg\phi_E>0$.
* `modularParametrisation_pullback` gives a rational scalar
  $c\neq0$ with
  $\phi_E^*\omega_E=c\,2\pi iF_E(z)\,dz$, where
  $\omega_E=dx/(2y+a_1x+a_3)$ is the differential of the
  specified Weierstrass equation.

The pullback first lands in the $F_E$-eigenline of differentials on the modular curve.
Compatibility of the quotient with the Hecke action identifies that line with the
normalized cusp form. Its rational structure and the ℚ-defined morphism give
$c\in\mathbb Q$. Nonconstancy in characteristic zero makes the pullback differential
nonzero, so $c\neq0$. In the prototype, `pullbackInvariantDifferential` records the
corresponding cusp form, with the factor $2\pi i\,dz$ already accounted for in that
interface.

The assertion is for the differential of the displayed model and the chosen isogeny.
Changing a Weierstrass model rescales the differential by a rational factor; composing
with multiplication by an integer rescales the map and changes its degree. For an
optimal curve and Néron differential, the usual Manin-constant normalization requires
additional integral assertions. The statement here gives the nonzero rational scalar,
and does not set it equal to 1 for arbitrary curves or arbitrary choices.

**Source and prerequisites.** Cremona, Chapter II, §2.15.1, p. 47, describes the
parametrisation and its differential. The direct inputs are the isogeny theorem above,
$F_E$ in R29.3, ModularCurvesPartII **R14.5/trivial-character-J0**,
**R14.5/abel-jacobi-composite-nonzero**, **R14.5/modular-quotient-differentials**, and
**R14.6/rational-cusp-abel-jacobi**, and Tau Ceti JacobianChallenge **Layer F:
Abel–Jacobi and the universal property**
(`tauceti:TauCetiRoadmap/JacobianChallenge#layer-f-abeljacobi-and-the-universal-property`).
The differential/form identification uses ModularCurvesPartII **R12.5**, and curve
degree uses Tau Ceti AlgebraicCurves Layers 6 and 12. The projective model of a
Weierstrass curve is the ModularCurves Layer 1 interface.

### Degree and quotient-choice tests

* `modularParametrisation_11a1`: X₀(11) is the
  elliptic curve 11a1. For a suitable quotient isogeny,
  the resulting map is an isomorphism, of degree 1.
  It must still send the chosen cusp to the origin.
* `modularParametrisation_11a3`: the least degree over
  the possible quotient isogenies to 11a3 is 5. It
  is attained by a 5-isogeny from 11a1. The group
  $\operatorname{Hom}_{\mathbb Q}(11a1,11a3)$ is
  generated by a degree-5 isogeny, so every nonzero
  choice has degree $5n^2$. This tests the use of
  the J₀ quotient: the J₁ quotient at this level
  is 11a3 itself and would give the wrong degree
  if silently substituted into the construction.
* `modularParametrisation_37a`: for 37a1, the J₀
  modular quotient is isomorphic to $E$, but the
  parametrisation from X₀(37) has degree 2. This
  distinguishes the degree of $\lambda$ from
  that of the Abel–Jacobi/quotient composite.

These assertions test a choice-exists statement, a lower bound over all choices, and a
case in which the quotient isogeny is an isomorphism while the parametrisation is not.
They use the degree convention of the curve interface and the homomorphism-degree
formula of R28.6. The interpretation of a modular degree follows Cremona §2.15.1,
pp. 47–48, including Proposition 2.15.1 on p. 48;
the concrete equations are the ones fixed in the earlier tests.

## Layer R29.6. The converse, modularity, and analytic continuation

The geometric converse starts with a surjective homomorphism $J_0(N')\to E$, where $N'$
is an arbitrary positive integer. It recovers an attached primitive form at a divisor of
$N'$. The conditional comparisons of R29.3–R29.5 then force that divisor to be $N_E$.
This proves the equivalence of the modularity formulations separately from their
unconditional truth, and prevents a geometric presentation at a larger level from being
mistaken for the conductor.

### Absolute irreducibility of the rational Tate module

For every elliptic curve $E/\mathbb Q$ and prime $r$, `span_range_rationalTateRep`
asserts that the ℚᵣ-linear span of the image of $G_{\mathbb Q}$ is

$$
\mathbb Q_r[\rho_{E,r}(G_{\mathbb Q})]
   =\operatorname{End}_{\mathbb Q_r}(V_r(E)).
$$

Consequently, for every extension field $L/\mathbb Q_r$, $V_r(E)\otimes_{\mathbb Q_r}L$
is irreducible as an $L[G_{\mathbb Q}]$-module. In particular, this is absolute
irreducibility, not just irreducibility over ℚᵣ.

By the Tate–Hom comparison, the commutant of the Galois image is

$$
\operatorname{End}_{G_{\mathbb Q}}(V_r(E))
=\operatorname{End}_{\mathbb Q}(E)\otimes\mathbb Q_r
=\mathbb Q_r.
$$

Faltings semisimplicity makes $V_r(E)$ a semisimple module for the algebra $B$ spanned
by the image. It is simple: otherwise a nontrivial summand decomposition would yield a
nontrivial idempotent in its scalar endomorphism ring. The finite-dimensional algebra
$B\subseteq\operatorname{End}(V_r(E))$ acts faithfully on this simple module. Its
radical is zero and it is a simple matrix algebra over a division algebra. The scalar
commutant forces that division algebra to be ℚᵣ; the two-dimensional module then forces
$B=M_2(\mathbb Q_r)$. Equivalently, one can apply the finite-dimensional density theorem
to this simple module with scalar commutant. Extending scalars gives every endomorphism
of $V_r(E)\otimes L$, leaving no proper nonzero invariant subspace.

Both semisimplicity and the scalar commutant are used. A semisimple sum of two
characters is reducible; a module with scalar commutant without the semisimplicity input
does not justify the argument above. The result is specific to $E$ over ℚ. For the CM
curve $y^2=x^3-x$, restriction to $G_{\mathbb Q(i)}$ splits over an algebraic closure of
ℚ₅, while the full $G_{\mathbb Q}$ action exchanges the two lines under complex
conjugation. This is the CM acceptance test for $r=5$.

**Source and prerequisites.** Faltings, §5, Satz 3 and Satz 4, p. 360, and Korollar 1,
p. 361, supply semisimplicity and the commutant comparison. The direct inputs are
FaltingsFinitenessAndIsogenyTheorems **R28.6/tate-hom-comparison-for-elliptic-curves**,
**R28.6/semisimplicity-of-the-rational-tate-module-of-an-elliptic-curve**, and the
**R28.6** assertion $\operatorname{End}_{\mathbb Q}(E)=\mathbb Z$, together with
ArithmeticGaloisRepresentations **R01.6** for the representation. The matrix-algebra
step is the usual finite-dimensional semisimple-algebra argument. None of the residual
Serre witnesses is an input.

### Recovering a primitive form from a Jacobian quotient

Let $N'\geq1$ and let $\pi:J_0(N')\to E$ be a surjective homomorphism over ℚ. Then
`exists_isNewformOf_of_J0` gives a divisor $M\mid N'$ and a normalized weight-two
newform $f$ of level $M$ and trivial character attached to $E$. It follows that $M=N_E$,
$N_E\mid N'$, all coefficients of $f$ are integers, and $A_\ell(f)=a_\ell(E)$ for every
prime ℓ. The geometric hypothesis alone supplies this result; classical Serre modularity
is not used in its proof.

The imported old/new decomposition over ℚ has the form

$$
J_0(N')\sim_{\mathbb Q}
\prod_{M\mid N'}\ \prod_{[f]}
(A_f^0)^{\sigma_0(N'/M)}.
$$

The inner product runs over Galois orbits of normalized weight-two newforms of exact
level $M$ with trivial character, and $\sigma_0$ counts positive divisors. The powers
record oldform multiplicity. They are essential even for rational newforms. The
decomposition must exhaust the whole Jacobian up to ℚ-isogeny; a comparison for one
selected orbit or for J₁ does not suffice to select a constituent of a general map out
of J₀($N'$).

Fix $r$. Exactness of rational Tate modules gives a surjective equivariant map
$V_r(J_0(N'))\to V_r(E)$. The decomposition implies that it is nonzero on at least one
copy of $V_r(A_f^0)$, for some $M\mid N'$. Through the compatible isogeny with $A_f^1$,
this module is a free rank-two module over $K_f\otimes\mathbb Q_r$. After extending
scalars to $\overline{\mathbb Q}_r$, it decomposes as

$$
V_r(A_f^0)\otimes\overline{\mathbb Q}_r
  =\bigoplus_{\sigma:K_f\hookrightarrow\overline{\mathbb Q}_r}
        V_{f,\sigma},
$$

with each summand of dimension two and stable under Galois. At ℓ not dividing $Mr$, the
polynomial on the summand is $X^2-\sigma(A_\ell(f))X+\ell$. Some restriction to
$V_{f,\sigma}$ is nonzero. Its target $V_r(E)\otimes\overline{\mathbb Q}_r$ is
irreducible by the preceding assertion. The restriction is therefore surjective and,
since both spaces have dimension two, an isomorphism.

At every prime $\ell\nmid N_EN'r$, this isomorphism gives $\sigma(A_\ell(f))=a_\ell(E)$.
To obtain a complex newform, fix an embedding $\iota:\overline{\mathbb
Q}\hookrightarrow\overline{\mathbb Q}_r$, where $\overline{\mathbb Q}\subset\mathbb C$.
The embedding $\sigma$ of the number field $K_f$ factors through $\iota$, say
$\sigma=\iota\circ\tau$. Its finite algebraic image lies in the image of this algebraic
closure, and $\iota$ fixes ℤ. Hence $\tau(A_\ell(f))=a_\ell(E)$ at the same good primes.
The conjugate newform $f^\tau$ has the same level and trivial character, and is attached
to $E$. Apply the conditional rational-coefficient, exact-level, and all-Euler-factor
comparisons to it.

This proof extracts a two-dimensional constituent before claiming rational coefficients.
An entire modular quotient with coefficient field of degree greater than one has a
larger rational Tate module; it cannot be identified directly with $V_r(E)$. The
constituent and coefficient-embedding steps are what allow the argument to start with
arbitrary Jacobian quotients and still recover a rational newform.

**Sources and prerequisites.** Serre, §4.6, Theorem 4, p. 207, states the modular
quotient formulation; this assertion supplies its converse. Cremona, §2.7 and Lemma
2.7.1, p. 26, supplies the oldform divisor multiplicity. Carayol, §0.8, proof of the
Corollaire, p. 411, supplies the newform/Tate-module comparison. Import the exhaustive
J₀ decomposition from ModularCurvesPartII **R14.5**, together with
**R14.5/quotient-tate-exact** and **R14.5/trivial-character-J0**. The realization of the
constituents is AutomorphicGaloisRepresentations
**R19.6/weight-two-tate-module-decomposition** and
**R19.1/newform-rank-two-realisation**; the elliptic Frobenius data is
ArithmeticGaloisRepresentations **R01.6**. Conjugation is ModularForms Layer 8g. The
other inputs are the preceding absolute irreducibility, attachment and rationality in
R29.3, and exact conductor and bad Euler factors in R29.4.

Two examples test the scope of the decomposition:

* At $N'=22$, either degeneracy map to J₀(11)
  gives an elliptic quotient 11a1. The level-11
  form occurs twice, through $f(z)$ and $f(2z)$,
  and the level-22 new part is zero. Thus
  $\dim V_r(J_0(22))=4$; putting only one copy
  of the primitive form in the decomposition
  would incorrectly give dimension two. The
  form recovered by the converse has level 11,
  a proper divisor of 22.
* At $N'=23$, the weight-two space is one
  Galois orbit with coefficient field
  $\mathbb Q(\sqrt5)$, and
  $A_2(f)=(-1\pm\sqrt5)/2$. The quotient is
  an abelian surface. It cannot have an
  elliptic quotient over ℚ: a quotient would
  give an attached rational form at a divisor
  of 23; the level-1 space is zero, and the
  level-23 orbit has irrational coefficients.
  This conclusion uses the full attachment
  comparison, not a claim that one irrational
  coefficient alone rules out almost-all-prime
  agreement.

### The three equivalent modularity formulations

For every elliptic curve $E/\mathbb Q$ of conductor $N_E$, the following statements
hold:

1. There is a normalized newform $F$ of weight
   two, exact level $N_E$, and trivial character
   with $A_n(F)=a_n(E)$ for every $n\geq0$.
   Its coefficients are rational integers.
2. There is a surjective homomorphism
   $J_0(N_E)\to E$ over ℚ.
3. There is a nonconstant morphism
   $X_0(N_E)\to E$ over ℚ sending ∞ to $O$.

The names `modularity`, `modularity_quotient`, and `modularity_parametrisation` present
these formulations. The first is R29.3 and R29.4 for $F_E$; the second composes the
quotient map with the isogeny in R29.5; the third is the parametrisation there. Their
unconditional existence uses ClassicalSerreModularity
**R27.6/finite-flat-weight-two-export** in the witness construction, and then the
intervening comparisons.

For an individual curve, there is also an equivalence without that existence input: an
attached newform at some positive level, a surjective homomorphism $J_0(N')\to E$ at
some positive level, and a nonconstant morphism $X_0(N')\to E$ at some positive level
are equivalent. Any level $N'$ appearing in the geometric formulations is a multiple of
$N_E$, and level $N_E$ itself is possible.

To prove this equivalence, an attached form gives a quotient and a parametrisation at
$N_E$ by R29.4–R29.5. A nonconstant morphism $\phi:X_0(N')\to E$ has rational value
$\phi(\infty)$, so translation by $-\phi(\infty)$ makes it send ∞ to $O$. The universal
property of the Abel–Jacobi map then gives a homomorphism $J_0(N')\to E$. Its image
contains the image of the nonconstant curve morphism, which is all of $E$, so it is
surjective. The preceding Jacobian-quotient converse gives the attached form. The
interface `exists_isNewformOf_of_X0` presents the parametrisation-to-form implication,
and `conductor_dvd_of_J0` presents the level divisibility conclusion.

The induced map from the Jacobian is a homomorphism of abelian varieties. Merely having
a scheme morphism that sends the origin to the origin would need the rigidity theorem to
justify that interpretation. The general interfaces for projective curves, Jacobians and
abelian varieties supply it; the geometric equivalence is stated with the homomorphism
hypothesis explicitly.

**Sources and prerequisites.** Serre, §4.6, Theorem 4 and its proof, pp. 207–208, gives
the newform and quotient formulations. The equivalence uses attachment and $F_E$ in
R29.3, rational coefficients, exact conductor and bad factors in R29.4, the isogeny and
parametrisation in R29.5, and the Jacobian-quotient converse in this layer. The
geometric inputs are ModularCurvesPartII **R14.5/abel-jacobi-composite-nonzero**,
**R14.6/rational-cusp-abel-jacobi**, and JacobianChallenge Layer F. The distinction
between an arbitrary $N'$ and $N_E$, together with the two old copies at level 22, is
the acceptance condition for this equivalence.

### Continuation and the functional equation

`LFunction_eq` gives the equality of the formal Dirichlet coefficients of $E$ and $F_E$.
By the local factor theorem of R29.4, their Euler products include identical factors at
bad primes as well as good primes. The complex Dirichlet series therefore agree in their
half-plane of absolute convergence, $\operatorname{Re}s>3/2$.

The completed function, initially on that half-plane, is

$$
\Lambda(E,s)=N_E^{s/2}(2\pi)^{-s}
             \Gamma(s)L(E,s).
$$

`exists_entire_completed_LSeries` asserts an entire continuation of this function and a
sign $w_E\in\{1,-1\}$ satisfying

$$
\Lambda(E,s)=w_E\Lambda(E,2-s)
\qquad(s\in\mathbb C).
$$

In the weight-two convention the sign is the eigenvalue of $-W_{N_E}$ on $F_E$. The
Mellin transform and Fricke functional equation are supplied by the modular-form
L-function theory. The inverse gamma factor is entire, so $L(E,s)$ also has an entire
continuation. The literal Mathlib Dirichlet-series expression outside its domain of
convergence is not the definition of that continuation; the prototype asserts existence
of an entire function agreeing with it in the stated half-plane.

For 11a1, the completed function has sign $+1$ and nonzero value at $s=1$. This is an
acceptance example for the sign convention and continuation. The factors $N_E^{s/2}$ and
$(2\pi)^{-s}$ must both be retained: changing them changes the displayed functional
equation. The nonvanishing example is an analytic statement and does not deduce a rank
formula.

**Source and prerequisites.** Cremona, §2.6, p. 25, gives the L-series identity for a
modular elliptic curve. The direct inputs are the all-local-factor identity in R29.4,
Mathlib `WeierstrassCurve.LFunction` and `WeierstrassCurve.LSeries`, and Tau Ceti
ModularForms **Layer 7: L-functions**
(`tauceti:TauCetiRoadmap/ModularForms#layer-7-l-functions`) for Hecke continuation and
the functional equation.

### Theorem 4 and the real multiplication boundary

The modularity assertion above is the conclusion of Serre's Theorem 4, §4.6, p. 207: the
weight-two trivial-character case of classical Serre modularity implies modularity of
every elliptic curve over ℚ. Its deduction is exactly the chain R29.1–R29.5 and the
formulation theorem in this layer. It uses residual representations at infinitely many
distinct primes and then Faltings's isogeny criterion; it does not assume that the
starting elliptic curve is modular.

The companion statement has a different domain. Let $X$ be an abelian variety over ℚ of
dimension $n$, with

$$
K_X=\mathbb Q\otimes_{\mathbb Z}
           \operatorname{End}_{\mathbb Q}(X)
$$

a totally real number field of degree **exactly $n$**. Serre's Theorem 5, §4.7, p. 209,
asserts, under the same weight-two modularity input, that the conductor of $X$ is $N^n$
for an integer $N$ and that $X$ is isomorphic to a quotient of $J_0(N)$ over ℚ. The
degree, total reality, and identification of the rational endomorphism algebra are its
hypotheses; an arbitrary embedding of a smaller totally real field is not that
statement. The case $n=1$ recovers the elliptic formulation.

This companion is a separately scoped target for the real multiplication extension. Its
proof requires the $K_X$-linear compatible system, the $n$-th-power conductor
comparison, and the eventual irreducibility, conductor and finite-flat weight-two
statements at primes split in $K_X$. These are the inputs of Serre (4.7.1)–(4.7.6),
pp. 209–210, rather than
consequences of the elliptic point-module interfaces alone. The present application
records the exact statement and its boundary; the elliptic constructions are the domain
of the proof here. Its prerequisite is the modularity theorem above. Neither the
companion nor Theorem 4 asserts general GL₂-type modularity over other fields or a
Birch–Swinnerton-Dyer special-value formula.

## Dependency order and reusable outputs

The construction of $F_E$ uses R29.1, then R29.2, then the finite-range and norm
arguments in R29.3. The finite witness range and infinitude of distinct residual
characteristics must be available before one coefficient field is fixed for the norm.
This order is what turns residual congruences into a characteristic-zero object.

Within R29.3, attachment and uniqueness are defined before any selected $F_E$.
Rationality applies to every attached form. The conditional comparison chain starts
there, passes through R29.4 to the isogeny theorem of R29.5, and supplies the geometric
equivalence in R29.6. The Jacobian-quotient converse also uses absolute irreducibility
from Faltings and the exhaustive old/new decomposition. It has no dependency on the
Serre witnesses or on the definition of a selected $F_E$. Only the unconditional
existence assertion inserts those inputs into the equivalence.

The reusable outputs are the finite exceptional set with its local and global clauses;
certified witness data at its complement; the attachment predicate and cross-level
uniqueness; the newform $F_E$ and all-coefficient identity; an isogeny from the J₀
quotient; the chosen parametrisation with its cusp, degree and differential properties;
and the entire completed L-function with its functional equation. Each uses the general
objects owned by the neighbouring roadmaps, and each can be consumed without
reconstructing the existence proof.

[serre]: https://www.college-de-france.fr/media/jean-pierre-serre/UPL5835292064138487263_Serre_Repr.modulaires_Galois.pdf
[faltings]: https://math.uchicago.edu/~drinfeld/Deligne%27s_conjecture_Manin_conf/Faltings_argument/Faltings.pdf
[carayol]: https://www.numdam.org/article/ASENS_1986_4_19_3_409_0.pdf
[deligne-serre]: https://www.numdam.org/article/ASENS_1974_4_7_4_507_0.pdf
[cremona]: https://johncremona.github.io/book/fulltext/chapter2.pdf
