# Roadmap: multiquadratic fields and genus theory, part II: real quadratic signs and form characters

**Summary.** This roadmap builds the sign-sensitive interfaces between narrow
ideal classes, genera and integral binary quadratic forms in a real quadratic
field. Its targets are the exact narrow-to-wide kernel, unique descent of real
class characters, the number of narrow classes in each genus, arithmetic
criteria for the distinguished principal class to lie in the principal genus,
and agreement of fundamental form and ideal genus characters. These interfaces
supply the algebraic normalizations used in real quadratic period and trace
formulas.

## Scope and ownership

The starting point is the completed [Multiquadratic roadmap](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/Completed/Multiquadratic/README.md).
Its narrow class group, prime-discriminant factorization, genus characters,
principal genus theorem and narrow two-rank formula are inputs here. In
particular, the singleton character value on the distinguished class and the
criterion that this class be a square are already Tau Ceti theorems. This
roadmap adds their composite and arithmetic consequences, rather than another
construction of those objects or proofs of those two results.

The precise ownership boundaries are as follows.

- **Multiquadratic, Part II** owns the nine theorem targets in Layers 0–3:
  two narrow-defect interfaces, the genus-fibre cardinality, five sign and
  arithmetic interfaces, and the fundamental form/ideal character comparison.
- **IntegralLattices, Layers B1–B3** owns integral binary forms and content,
  proper equivalence, the oriented form–ideal dictionary, and its composition,
  inverse and genus-coset compatibilities. The dictionary for positive
  nonsquare discriminant takes values in a narrow Picard group. Its orientation
  clause at negative leading coefficient is essential.
- **GlobalNumberFields, Layer 11** owns number-field orders, invertible proper
  fractional ideals, `Pic`, `NarrowPic`, the forgetful homomorphism and its
  maximal-order specialization. No second narrow quotient is constructed here.
- **GeometryOfNumbersAndQuadraticArithmetic, GN.2** supplies the general
  integral binary-form genus character, including its zero branch and proper
  invariance. **GN.3** supplies the remaining fundamental/maximal-order and
  Duke–Imamoḡlu–Tóth convention adapters, and positive coprime norm witnesses,
  consuming the IntegralLattices dictionary. These are the exact contracts
  below, rather than a request for another form theory.
- Form reduction, composition algorithms and general representation theory
  stay with their lattice and quadratic-arithmetic owners. Hecke periods,
  gamma factors, spectral formulas, Weyl sums, subconvexity and asymptotic
  errors stay with the analytic and modular roadmaps.

There are no new definition or construction targets. The notation below names
existing objects and ordinary fibres. The distinction between narrow and wide
classes is retained throughout; the full prime-discriminant compositum is not
identified with a totally real, all-place-unramified genus field.

## Conventions

Let $K$ be a number field and $\theta$ an algebraic integer generating $K$
over $\mathbb Q$, with

$$
\operatorname{minpoly}_{\mathbb Z}(\theta)=X^2-d,
\qquad \mathbb Q[\theta]=K.
$$

In the real quadratic applications, $d>0$ is squarefree and

$$
D=\operatorname{fundamentalDiscriminant}(d)
 =\begin{cases}d&d\equiv1\pmod4,\\4d&d\not\equiv1\pmod4.\end{cases}
$$

The minimal-polynomial and generation hypotheses make this a genuine
quadratic presentation; $d=1$ does not present the rational field this way.
Thus the field statements have $D>1$. The independent arithmetic statements
in Layer 2 allow the fundamental discriminant $D=1$. Keep the squarefree
radicand $d$, the field discriminant $D$, and a character factor $\delta$
distinct.

Write $C=\operatorname{Cl}^+(K)$, $W=\operatorname{ClassGroup}(\mathcal O_K)$,
and $\pi:C\to W$ for the forgetful homomorphism. The narrow relation uses
principal ideals with totally positive generators. In a real quadratic field
this agrees with using a generator of positive norm: its two signs agree, and
multiplication by the unit $(-1)$ makes two negative signs positive. This
argument is specific to the quadratic signature, not a definition for an
arbitrary number field.

Use the notation

$$J=\operatorname{mkPrincipal}(\theta)\in C.$$

Here $\theta$ is regarded as a unit of the field, using the nonzero proof from
its minimal polynomial. This is the source's different class: $\sqrt D$ equals
$\theta$ or $2\theta$ up to sign, so $(\sqrt D)$ and $(\theta)$ have the same
narrow class. A positive rational multiplier has trivial narrow principal
class, and changing the sign of an ideal's generator leaves the ideal itself
unchanged. No new different or principal-class carrier is implicit in $J$.

A prime discriminant is one of $(-4,8,-8)$, or

$$p^*=\begin{cases}p&p\equiv1\pmod4,\\-p&p\equiv3\pmod4,\end{cases}$$

for an odd rational prime $p$. Let $s$ be a finite set of distinct prime
discriminants, at most one even, with product $D$. Set $r=\#s=\omega(D)$,
the number of distinct rational primes ramified in $K$. In the genuine
quadratic case $r\geq1$. For $t\subseteq s$, put

$$
\delta=\prod_{P\in t}P,\qquad
\delta'=\prod_{P\in s\setminus t}P,\qquad \delta\delta'=D.
$$

Both products are nonzero fundamental discriminants in the convention that
includes the empty product $1$. Their signs agree when $D>0$. The narrow
genus character is $\chi_t:C\to\mathbb Z^\times$, whose values are $1,-1$.
When comparing with an integer-valued form character, coerce this value to
$\mathbb Z$ explicitly. The arithmetic function `genusCharFun t n` is the
product of the prime-discriminant Kronecker characters at the integer $n$.

Write $q:C\to C/C^2$ for the existing elementary-two quotient map. Its target
`NumberField.NarrowClassGroup.ElementaryTwoQuotient K` is additive, so the
principal genus is its zero fibre. The quotient $C/C^2$, its square-subgroup
fibres, and $C[2]=\{A:A^2=1\}$ play different roles. Use $h^+(D)=\#C$ for
the narrow class number and $h(D)=\#W$ for the wide class number.

Binary forms have the polynomial convention

$$Q(x,y)=[a,b,c](x,y)=ax^2+bxy+cy^2,\qquad \operatorname{disc}(Q)=b^2-4ac.$$

All coefficients are integers. Primitive means $\gcd(a,b,c)=1$. Proper
equivalence uses determinant-one integral substitutions, equivalently
$\mathrm{PSL}_2(\mathbb Z)$ because $(-I)$ acts trivially. A full
$\mathrm{GL}_2(\mathbb Z)$ orbit loses orientation. These conventions do not
identify the classical discriminant with an unnormalized bilinear determinant.

## Exact supplier contracts

### From Mathlib

Use Mathlib at `082e2d37e8b0463410cdb532e111cd43d5a66174`.
`QuotientGroup.lift` supplies quotient descent and
`QuotientGroup.quotientKerEquivOfSurjective` supplies the first isomorphism
theorem. `MonoidHom.fiberEquivKerOfSurjective` and
`Subgroup.card_eq_card_quotient_mul_card_subgroup` give fibre and cardinality
arguments. The additive elementary-two presentation is transported to a
multiplicative quotient when applying these group-theoretic interfaces.

`Nat.eq_sq_add_sq_iff`, in `Mathlib.NumberTheory.SumTwoSquares`, is the full
two-square theorem: primes congruent to three modulo four must have even
valuation. Layer 2 specializes this to positive fundamental discriminants.
`QuadraticForm ℤ (Fin 2 → ℤ)` is the existing carrier for the
conditional binary-form comparison; it is not a new integral-lattice theory.

### From Tau Ceti and Multiquadratic

Use Tau Ceti at `f790474821cf4256814db967cb154e7af3d0c369`. The declarations
below are the starting interfaces, not targets of the build.

- `NumberField.NarrowClassGroup`, its `mkPrincipal`, `mk0`, `toClassGroup`,
  `toClassGroup_ker` and `toClassGroup_surjective` supply the existing carrier,
  representatives, kernel-as-principal-range and surjective forgetful map.
  `NumberField.coe_gen_ne_zero` supplies the field unit used in $J$.
- `NumberField.NarrowClassGroup.mkPrincipal_sq` proves principal classes have
  square one. `NumberField.mkPrincipal_eq_one_or_eq_mkPrincipal_gen` supplies
  the quadratic principal-class dichotomy, and
  `NumberField.mkPrincipal_eq_mkPrincipal_gen_of_norm_neg` identifies the
  negative-norm case. The imported
  `NumberField.NarrowClassGroup.toClassGroup_injective_iff_exists_norm_eq_neg_one`
  tests injectivity by an integral unit of norm $(-1)$. The narrow finite
  instance and `card_eq_card_classGroup_mul_card_ker` give the class-number
  relation.
- `NumberField.NarrowClassGroup.ElementaryTwoQuotient` and
  `TauCeti.elementaryTwoQuotientMk`, its surjectivity and
  `elementaryTwoQuotientMk_eq_zero_iff` give the genus map and its
  square criterion. `TauCeti.elementaryTwoQuotientEquivSquareQuotient` relates
  it to the direct quotient by squares.
  `NumberField.NarrowClassGroup.card_elementaryTwoQuotient_eq_two_pow_twoRank`,
  `TauCeti.Multiquadratic.narrowTwoRank_eq_ncard_ramifiedPrimes_sub_one` and
  `TauCeti.Multiquadratic.ncard_ramifiedPrimes_eq_card` provide its cardinality.
- In namespace `TauCeti.Multiquadratic`, use `IsPrimeDiscriminant`,
  `oddPrimeDiscriminant_def`, `natCast_dvd_primeDiscriminant_iff`,
  `IsFundamentalDiscriminant`, `fundamentalDiscriminant`,
  `isFundamentalDiscriminant_prod` and
  `prod_primeDiscriminant_mod_four_eq_one` for the signed factorization and
  its subproducts.
- In the same namespace, `genusCharFunNarrowClassGroupHom` is the character,
  and `genusCharFunNarrowClassGroupHom_eq_prod_singleton` its product law.
  `genusCharFunNarrowClassGroupHom_mkPrincipal_gen` is the **singleton** sign
  theorem. `isSquare_mkPrincipal_gen_iff` is the positivity-of-all-factors
  square criterion. The principal genus test is
  `isSquare_iff_forall_genusCharFunNarrowClassGroupHom_eq_one`.
- `genusCharFun`, `genusCharFunCoprimeIdealSubmonoid`,
  `mem_genusCharFunCoprimeIdealSubmonoid_iff`,
  `genusCharFunCoprimeIdealHom_apply` and
  `genusCharFunNarrowClassGroupHom_mk0` identify the class character with the
  arithmetic character on a nonzero integral ideal of coprime absolute norm.
  Nonzeroness and coprimality are required before using that evaluation law.

These interfaces are in `NumberField/NarrowClassGroup`,
`NumberField/Quadratic/Conjugation/NarrowClassGroup`,
`Multiquadratic/Quadratic/TwoRank`, and
`Multiquadratic/Quadratic/GenusCharacter/{CoprimeIdeal,NarrowClassGroup,PrincipalGenus,OrdinaryTwoRank}`,
together with the discriminant files.

### From IntegralLattices and GlobalNumberFields

Consume [IntegralLattices, Layer B](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/IntegralLattices/README.md#layer-b-binary-lattices-and-quadratic-orders),
specifically B1 for forms and content, B2 for the oriented primitive-form/ideal
bijection, and B3 for composition and inverse compatibility. Consume
[GlobalNumberFields, Layer 11](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/GlobalNumberFields/README.md#layer-11-orders-and-picard-groups)
for its order and Picard carriers and maximal-order comparison. In particular,
`NumberFieldOrder.narrowToPic` and the maximal-order `narrowClassToClass`
comparison must respect forgetting positivity. These are roadmap interfaces,
not declarations asserted to be present in the pinned library.

For a nonsquare positive discriminant the B2 coefficient ideal is

$$\mathfrak a_Q=a\mathbb Z+\frac{-b+\sqrt D}{2}\mathbb Z.$$

The oriented narrow class is that of $\mathfrak a_Q$ for $a>0$, and that of
$\sqrt D\,\mathfrak a_Q$ for $a<0$. A form of nonsquare discriminant has
$a\ne0$. Keep this sign clause when specializing to a fundamental
discriminant and the maximal order. The positive-norm definition of narrow
equivalence in this quadratic dictionary agrees with the totally positive
one by the two-sign argument in the conventions.

The witness is $D=12$: $Q=x^2-3y^2$ and $-Q=-x^2+3y^2$ yield the same
unoriented coefficient ideal $\mathcal O_{12}$. Their oriented classes differ
by $J$. Rotating $-Q$ by $(x,y)\mapsto(y,-x)$ gives $3x^2-y^2$, whose
coefficient ideal is $(3,\sqrt3)=\sqrt3\mathcal O_{12}$. Moreover $Q$
does not represent $(-1)$ modulo three, so a proper equivalence with $-Q$
would be impossible. This distinguishes the needed dictionary from both a
wide dictionary and an unoriented map into a narrow group.

### From GeometryOfNumbersAndQuadraticArithmetic, GN.2

For a nonsquare discriminant $\Delta=\delta\delta'$ with $\delta$ fundamental
and $\delta'$ a discriminant, supply the integer-valued character
$\chi_\delta$ on integral binary forms of discriminant $\Delta$. Its content
law is $\chi_\delta([a,b,c])=0$ when $\gcd(a,b,c,\delta)>1$. Otherwise it
evaluates at an integer represented by the form and coprime to $\delta$ as
the Kronecker symbol $(\delta/m)$. Supply existence of such a represented
integer, independence of its choice, and proper invariance. The normalization
must agree with `genusCharFun t m` for the subset factorization used here,
including even and empty factors. Supply also
$\chi_\delta(-Q)=\operatorname{sign}(\delta)\chi_\delta(Q)$.

The consumer in Layer 3 specifically uses evaluation at a **positive**
represented integer $m$ coprime to $\delta$. Its canonical comparison is
restricted to primitive forms of positive fundamental discriminant; the
general character's zero branch remains part of this supplier contract. GN.2
consumes the IntegralLattices binary carrier, content and proper action rather
than creating alternatives. This is the same character used by the
Bruinier–Ehlen–Yang direction. (Duke–Imamoḡlu–Tóth, §9, pp.977–978, definition
preceding Proposition 5.)

### From GeometryOfNumbersAndQuadraticArithmetic, GN.3

Supply only the following adapters to the preceding owners. For positive
fundamental $D>1$, specialize the quadratic order to $\mathcal O_K$ and
identify its `NarrowPic` with `NumberField.NarrowClassGroup K`, respecting
principal classes and the forgetful map. Use GlobalNumberFields' maximal-order
comparison whenever it already supplies this compatibility.

After a proper change to $a>0$, match the source's fractional norm form:

$$
w=\frac{-b+\sqrt D}{2a},\qquad w^\sigma<w,\qquad
\mathfrak a=w\mathbb Z+\mathbb Z,\qquad
Q(x,y)=\frac{N(x-wy)}{N(\mathfrak a)}.
$$

Here the coefficient ideal is the positive rational multiple
$\mathfrak a_Q=a\mathfrak a$, with the same narrow class. Retain the B2 sign
clause for a representative with $a<0$. Provide the source's coefficient
actions

| Form, when $Q$ represents $A$ | Associated narrow class |
| --- | --- |
| $[a,-b,c]$ | $A^{-1}$ |
| $[-a,b,-c]$ | $JA$ |
| $[-a,-b,-c]=-Q$ | $JA^{-1}$ |

For each primitive form and factor $\delta$ used in Layer 3, supply a positive
represented $m$ coprime to $\delta$ and a nonzero integral ideal
$\mathfrak b=(\alpha)\mathfrak a^{-1}$ with absolute norm $m$ and narrow
class $A^{-1}$. This includes integrality and proper-basis compatibility,
not just an equality of absolute norms. These are specialization, convention
and witness adapters; they do not include another construction of proper
equivalence, reduction, composition or the oriented dictionary.
(Duke–Imamoḡlu–Tóth, §2, p.952, norm-form paragraph and (2.3)–(2.5).)

## How to read the build

Layer 0 identifies the narrow defect and makes character descent unique.
Layer 1 counts the elements in an arbitrary genus using the existing quotient.
Layer 2 translates the value on the distinguished class into signed
prime-discriminant and two-square criteria. Layer 3 compares the canonical
form character with the ideal character using the exact supplier contracts.
`Suggested.lean` states the nine representative endpoints on existing
carriers; its last theorem is the explicit witness version of the comparison.
The canonical supplier instantiation and the general form character's zero
test are specified here, rather than typed using an invented supplier API.

## Layer 0: the quadratic narrow defect

### 0.1 The exact kernel

Under the real quadratic conventions, prove `ker_toClassGroup_eq_pair`: for
every $A\in C$,

$$\pi(A)=1\quad\Longleftrightarrow\quad A=1\ \text{or}\ A=J.$$

Thus $\ker\pi=\{1,J\}$ as a set, allowing the displayed entries to coincide.
Since $J^2=1$, this is the subgroup $\langle J\rangle$, and the first
isomorphism theorem gives $C/\langle J\rangle\simeq W$. Unlike a bound of
two on the kernel cardinality, this identifies its elements and their action.
The statement in `Suggested.lean` is slightly more general: the quadratic
minimal-polynomial and generation hypotheses suffice, for either signature;
neither positivity nor squarefreeness is needed for this kernel identity.
(Duke–Imamoḡlu–Tóth, §2, pp.950–951, narrow and wide classes.)

A class in the kernel is in the range of `mkPrincipal`. Apply the quadratic
principal-class dichotomy to that representative. Conversely, both displayed
classes map to the wide identity. For each $A$, the entire fibre above
$\pi(A)$ is $\{A,JA\}$. Its two entries coincide precisely when $J=1$;
otherwise multiplication by $J$ exchanges them.

*Needs:* Tau Ceti `toClassGroup_ker`,
`mkPrincipal_eq_one_or_eq_mkPrincipal_gen`, `mkPrincipal_sq`,
`toClassGroup_surjective`; Mathlib's quotient-kernel equivalence.

**Checks.**

- When $J=1$, the kernel and each wide fibre are singletons. The formula
  must not assert two distinct elements merely because $J^2=1$.
- An integral unit of norm $(-1)$ makes the forgetful map injective by the
  supplier criterion; the displayed kernel must then collapse.
- In the absence of such a unit, injectivity fails and the displayed entries
  are distinct. Multiplication by $J$ must exchange, rather than fix, the
  two narrow lifts of any wide class.

### 0.2 Unique descent of real characters

For a multiplicative homomorphism $\chi:C\to\mathbb Z^\times$, prove
`existsUnique_wideCharacter_iff`:

$$
\bigl(\exists!\,\psi:W\to\mathbb Z^\times,\ \psi\circ\pi=\chi\bigr)
\quad\Longleftrightarrow\quad\chi(J)=1.
$$

The quantified $\psi$ is also a homomorphism, and the equality is equality
of homomorphisms. The input is not an arbitrary function on classes. As in
0.1, the signature only needs the quadratic presentation, so holds for either
signature. (Duke–Imamoḡlu–Tóth, §7, p.971, paragraph after (7.7).)

The exact kernel shows that $\chi$ kills $\ker\pi$ precisely when it kills
$J$. Lift through the quotient by that kernel and use the first isomorphism
theorem. Surjectivity proves uniqueness by evaluation at lifts of wide
classes. A descent necessarily kills $J$, because $\pi(J)=1$.

Every real character kills squares, so all real characters kill a square
$J$, even when $J\ne1$. Complex characters need not kill a nontrivial
square. The all-even real-character condition is therefore weaker than
equality of narrow and wide class groups.

*Needs:* 0.1; Mathlib `QuotientGroup.lift` and
`quotientKerEquivOfSurjective`; Tau Ceti `toClassGroup_surjective`.

**Checks.**

- The trivial character has exactly one wide descent.
- A character with $\chi(J)=-1$ has no descent.
- If $J=1$, every real class character descends. If $J$ is a nontrivial
  square, every genus character still descends, without an assertion about
  arbitrary complex characters.

### Examples

For $\mathbb Q(\sqrt3)$, $D=12$, the prime-three obstruction in Layer 2
will give $J\ne1$. Its two narrow lifts over any wide class are $A$ and
$JA$. Each singleton genus character for $\{-4,-3\}$ takes value $(-1)$
on $J$, so neither descends; their product and the empty-factor character
do descend. For $\mathbb Q(\sqrt2)$, the integral unit $1+\sqrt2$ has norm
$(-1)$, so the kernel collapses. The two outcomes check both sides of the
kernel dichotomy without computing a class number.

### Dependencies

Multiquadratic's quadratic principal-class and narrow-class interfaces, and
Mathlib's quotient-group theory. The second target uses the first; neither
requires a binary-form supplier.

## Layer 1: the number of classes in a narrow genus

### 1.1 Equal finite fibres

Under the real quadratic presentation and prime-discriminant factorization,
for arbitrary $g\in C/C^2$ let $G_g=\{A\in C:q(A)=g\}$. This is an ordinary
fibre subtype of the existing map, not a new genus definition. Prove
`card_genusFiber_mul_twoPow`:

$$2^{r-1}\,\#G_g=\#C,\qquad r=\#s.$$

The Lean signature uses natural-number cardinalities and natural subtraction
in $s.\mathrm{card}-1$; the genuine quadratic factorization has $r\geq1$.
Equivalently, as a rational-number formula,

$$\#G_g=2^{1-r}h^+(D).$$

This is a narrow class number. The negative exponent in the second display
is not a natural-number exponent. The representative signature also works
for imaginary quadratic presentations: it requires squarefreeness and the
factorization, but not positivity of $d$. The real specialization is the
one used here. (Duke–Imamoḡlu–Tóth, §4, p.959, (4.1)–(4.2).)

Choose a lift $A_0$ of $g$. Multiplication by $A_0$ identifies the square
subgroup with $G_g$. The choice affects the equivalence, not its
cardinality. The subgroup cardinality theorem gives
$\#C=\#(C/C^2)\,\#C^2$. The supplied quotient/two-rank formula and ramified
prime count give $\#(C/C^2)=2^{r-1}$; substitution proves the target.
Surjectivity makes each fibre nonempty, finiteness of $C$ makes it finite,
and the formula proves equal cardinalities and $2^{r-1}\mid h^+(D)$.

*Needs:* the elementary-two map, its surjectivity and square-quotient
equivalence; the narrow finite instance; the quotient-cardinality,
narrow-two-rank and ramified-prime-count theorems; Mathlib's surjective fibre
equivalence and subgroup cardinality formula. Layer 0 is not needed for the
count itself.

**Checks.**

- For $s=\{5\}$ or $s=\{8\}$, $r=1$ and there is one genus containing
  all narrow classes. This alone says nothing about class number one.
- For $D=12=(-4)(-3)$ or $D=28=(-4)(-7)$, there are two genera, each with
  $h^+/2$ classes.
- For $D=60=(-4)(-3)5$, there are four genera, each with $h^+/4$ classes.
- In a cyclic group of order eight, the square subgroup has four elements,
  the quotient has two elements, and each quotient fibre has four elements.
  The two-torsion subgroup has only two elements and cannot replace a fibre.

### Examples

The $D=60$ factorization has three signed prime discriminants even though
its positive rational prime divisors are $2,3,5$. Thus the exponent is
$3-1=2$, independently of the signs of the factors. Each of the four fibres
has the same cardinality, and their disjoint union has $h^+$ elements.
`Suggested.lean` also gives the cyclic-eight fibre and two-torsion counts on
`Multiplicative (ZMod 8)`, which detects confusing the two carriers.

### Dependencies

Multiquadratic's genus quotient, narrow two-rank and ramification count;
Mathlib's finite quotient and fibre cardinalities. Enumeration, form
reduction and effective class-number calculations are outside this layer.

## Layer 2: signs, principal genera and arithmetic criteria

### 2.1 Composite character values on the distinguished class

Under the real quadratic conventions, for every $t\subseteq s$, prove
`genusCharacter_J_eq_sign_prod`:

$$\chi_t(J)=\operatorname{sign}(\delta)=\operatorname{sign}(\delta').$$

The first equality reads the unit value in $\mathbb Z$. This extends the
singleton supplier theorem to arbitrary subsets, and includes the equality
of complementary signs. Evaluate the supplied product-of-singletons law at
$J$ and multiply the singleton signs. Since the factors are nonzero and
$\delta\delta'=D>0$, the complementary signs agree.
(Duke–Imamoḡlu–Tóth, §7, p.971, paragraph before (7.8).)

Positivity is essential to the complementary-sign equality. The sentence at
this source location is used here with the explicit qualifier $D>0$. For
$D=-4=1\cdot(-4)$, the two signs differ; in the imaginary quadratic
signature the distinguished principal class is trivial. There is no
unqualified extension of the displayed theorem to negative discriminants.

*Needs:* Tau Ceti's narrow genus character, product-of-singletons law,
singleton $J$-value, and nonzero fundamental subproducts.

**Checks.**

- For $D=12=(-4)(-3)$, each singleton has value $(-1)$ on $J$, while
  the empty and full factors have value $1$.
- For $D=24=(-8)(-3)$, the dyadic factor is $(-8)$. Substituting $8$
  would change the product to $(-24)$.
- For $D=8$, the singleton value is $1$. For $D=136=8\cdot17$, all
  subset values on $J$ are $1$, even if $J$ is nontrivial.
- The empty factor has product $1$, not zero. For $D<0$, complementary
  factor signs are opposite, as the $D=-4$ example demonstrates.

### 2.2 Positive prime discriminants and prime divisors

For any positive integer discriminant $D$ expressed as a finite set $s$
of prime discriminants with at most one even member and product $D$, prove
`primeDiscriminants_positive_iff`:

$$
(\forall P\in s,\ P>0)
\quad\Longleftrightarrow\quad
(\forall p\in\mathbb N,\ p\text{ prime},\ p\mid D\Rightarrow p\not\equiv3\pmod4).
$$

No field carrier is required, and $D=1,s=\varnothing$ is allowed.
Divisibility on the right uses the integer cast of the natural prime.
(Duke–Imamoḡlu–Tóth, §4, p.960, paragraph after (4.4).)

For an odd prime-discriminant factor, negativity is exactly the condition
$p\equiv3\pmod4$ on its underlying prime. A prime dividing the product
divides a factor; the underlying-prime theorem identifies which rational
prime that factor lies over. Thus absence of a prime of residue three forces
all odd factors positive. Positivity of the full product then forces the
possible even factor positive as well, hence equal to $8$. Conversely all
positive odd factors lie over primes of residue one, and an even factor lies
over two. At most one even factor prevents an invalid dyadic factorization.

*Needs:* `IsPrimeDiscriminant`, `oddPrimeDiscriminant_def`,
`natCast_dvd_primeDiscriminant_iff`, elementary prime divisibility and finite
products. This is independent of the field presentation.

**Checks.**

- $D=12$ and $D=24$ fail: three divides the product, and their signed
  factorizations have negative factors.
- $D=5,8,40,136$ pass. The $D=8$ case checks the positive even prime
  discriminant; $D=1$ checks both vacuous quantifications.
- Dropping $D>0$ is false: $D=-4$ has no prime divisor of residue three,
  but its prime-discriminant factor is negative.

### 2.3 The two-square criterion for fundamental discriminants

For $D>0$ satisfying `IsFundamentalDiscriminant D`, prove
`fundamental_sumTwoSquares_iff`:

$$
(\exists x,y\in\mathbb Z,\ D=x^2+y^2)
\quad\Longleftrightarrow\quad
(\forall p\in\mathbb N,\ p\text{ prime},\ p\mid D\Rightarrow p\not\equiv3\pmod4).
$$

The coordinates need not be coprime or nonzero, and $D=1$ is included.
Fundamentality means either squarefree $D\equiv1\pmod4$, or $D=4e$ with
$e$ squarefree and $e\equiv2,3\pmod4$.
(Duke–Imamoḡlu–Tóth, §4, p.960, paragraph after (4.4); Mathlib
`Nat.eq_sq_add_sq_iff`.)

Use Mathlib's full even-valuation criterion. Every odd prime dividing a
positive fundamental discriminant has valuation one: squarefreeness gives
this in the odd branch, and multiplication by four changes only the
two-adic valuation in the even branch. A prime of residue three therefore
cannot divide $D$. Convert integer representations to natural ones using
absolute values of the coordinates, and natural representations back by
casts. Positivity of $D$ must be kept during that conversion.

*Needs:* `IsFundamentalDiscriminant`, its squarefree cases, and Mathlib's
two-square valuation theorem. Do not replace the valuation theorem by a
no-divisor criterion for arbitrary positive integers.

**Checks.**

- $5=1^2+2^2$, $8=2^2+2^2$ and $136=6^2+10^2$ pass. The last two
  also reject a spurious primitive-representation hypothesis.
- $D=12$ has no representation as a sum of two integer squares.
- $9=0^2+3^2$ has prime divisor three but is not fundamental. It rejects
  removing fundamentality from this theorem.
- $1=1^2+0^2$ is allowed arithmetically, while it does not produce a
  quadratic field presentation in the conventions above.

### 2.4 The distinguished class in the principal genus

Under the real quadratic presentation and prime-discriminant factorization,
prove `J_square_iff_sumTwoSquares`:

$$
J\in C^2
\quad\Longleftrightarrow\quad
\text{no prime }p\equiv3\pmod4\text{ divides }D
\quad\Longleftrightarrow\quad
\exists x,y\in\mathbb Z,\ D=x^2+y^2.
$$

This translates the supplier's all-positive-prime-discriminants square
criterion into two arithmetic interfaces. Combine it with 2.2 and 2.3;
fundamentality of the full product supplies the latter's hypothesis.
Equivalently every $\chi_t(J)=1$: the principal genus theorem tests the
singleton characters and the product law gives all subsets. By 0.2, each
of those characters then has a unique wide descent.
(Duke–Imamoḡlu–Tóth, §4, p.960, paragraph after (4.4); §7, p.971,
paragraphs after (7.7) and before (7.8).)

The conclusion is that $J$ is square, not that $J=1$. In
$\mathbb Q(\sqrt{34})$, $D=136=8\cdot17$, the distinguished class is a
square but is nontrivial: there is no integral unit of norm $(-1)$. The
negative-Pell distinction is a boundary example, not a new Pell theorem or
algorithm. Narrow genera and narrow characters remain the objects being
tested. All-positive factors do not imply that the complete
prime-discriminant compositum is a totally real genus-field extension.

*Needs:* 2.2, 2.3, 0.2; Tau Ceti `isSquare_mkPrincipal_gen_iff`, principal
genus test, character product law and fundamental-product theorem.

**Checks.**

- $D=12$ puts $J$ outside the principal genus, since three divides $D$.
- $D=136$ puts $J$ inside the principal genus, witnessed arithmetically
  by $136=6^2+10^2$.
- The latter case must not imply $J=1$ or produce a negative-norm integral
  unit. Those are stronger conditions.
- Character descent here refers to all narrow genus characters; it does
  not replace narrow ideal equivalence by wide equivalence in the form
  dictionary.

### 2.5 A prime-divisor obstruction to trivial narrow defect

Under the real quadratic conventions, if a natural prime $p$ divides $D$
and $p\bmod4=3$, prove `J_ne_one_of_prime_threeModFour`: $J\ne1$, there is
no integral unit of norm $(-1)$, and

$$h^+(D)=2h(D).$$

Moreover $\pi$ is noninjective and its kernel consists of two distinct
elements. First 2.4 makes $J$ nonsquare; since one is square, $J\ne1$.
Apply 0.1, the norm-unit injectivity criterion, and the narrow/wide cardinality
formula to obtain the consequences. This uses the **field** discriminant,
not an arbitrary multiple of it.
(Duke–Imamoḡlu–Tóth, §2, p.951, paragraph before the minus continued
fractions.)

*Needs:* 2.4, 0.1; Tau Ceti's injectivity/norm-unit criterion and
`card_eq_card_classGroup_mul_card_ker`.

**Checks.**

- For $d=3,D=12$, take $p=3$; the kernel is a distinct pair and the
  narrow/wide class-number ratio is two.
- For $d=7,D=28$, take $p=7$, with the same conclusions.
- The converse fails: $D=136$ has no prime divisor of residue three,
  although $J\ne1$. The absence of this obstruction does not construct
  a norm $(-1)$ integral unit.

### Examples

For $D=12$, the two singleton signs are $(-1)$, $J$ is nonsquare and
nontrivial, the narrow class number is twice the wide one, and each of the
two genera has $h^+/2$ classes. For $D=8$, the single factor is positive,
$8=2^2+2^2$ and $1+\sqrt2$ has norm $(-1)$, so $J=1$. For $D=136$, all
characters kill $J$ and $J$ is square, while $J\ne1$. Together these
examples distinguish a nonsquare defect, a collapsed defect, and a nontrivial
defect invisible to real characters.

### Dependencies

Layer 0 for unique descent and the obstruction consequences; the
Multiquadratic character and principal-genus interfaces; prime-discriminant
arithmetic; Mathlib's sum-of-two-squares theorem. The sign and arithmetic
targets do not need form reduction or analytic inputs.

## Layer 3: fundamental form and ideal characters

### 3.1 Agreement at positive fundamental discriminant

Under the real quadratic conventions and $t\subseteq s$, let $Q=[a,b,c]$
be an integral primitive form with $b^2-4ac=D>1$, associated to $A\in C$
by the oriented dictionary in the supplier contracts. Prove the canonical
target `formCharacter_eq_idealCharacter`:

$$\chi_\delta(Q)=(\chi_t(A):\mathbb Z).$$

The form character is the GN.2 Kronecker-normalized character, and the
association is IntegralLattices' oriented dictionary specialized to the
maximal order and transported to the existing narrow class group. A positive
fundamental discriminant forces primitive content, but content one is retained
as an explicit hypothesis to expose the dictionary's domain. The general form
character can have value zero; the right side is always a unit. The restricted
domain is therefore part of the statement.
(Duke–Imamoḡlu–Tóth, §2, p.952, norm-form paragraph and (2.3)–(2.5);
§9, p.978, paragraph before Proposition 5.)

Take a positive represented integer $m$ coprime to $\delta$, as supplied
by GN.3. After proper normalization to $a>0$, use
$\mathfrak a=w\mathbb Z+\mathbb Z$ and a representation
$\alpha=x-wy\in\mathfrak a$. Then

$$
\mathfrak b=(\alpha)\mathfrak a^{-1},\qquad
N(\mathfrak b)=\frac{N(\alpha)}{N(\mathfrak a)}=m,\qquad
[\mathfrak b]^+=A^{-1}.
$$

Integrality follows from $\alpha\in\mathfrak a$. Nonzeroness follows from
$m>0$. Because the absolute ideal norm $N(\mathfrak a)$ is positive,
$N(\alpha)>0$, so its principal ideal is trivial in the real quadratic
narrow group. This gives the inverse class in the last equality. Using a
negative represented value and retaining only its absolute norm would instead
introduce $J$. The witness therefore includes positivity, integrality, norm
and narrow class, rather than only a represented absolute value.

GN.2 evaluates the left side as `genusCharFun t m`. The coprime ideal
evaluation law evaluates $\chi_t([\mathfrak b]^+)$ by the same arithmetic
character. Establish membership of $\mathfrak b$ in the existing nonzero
coprime-ideal submonoid before invoking this law. Finally
$\chi_t(A^{-1})=\chi_t(A)$, since every unit of $\mathbb Z$ is its own inverse.
This proves the comparison without any new genus character or form quotient.

Proper changes of basis preserve the supplied form character. Coprime
integral representatives preserve the ideal class character. Together with
the supplier's proper-basis compatibility, these laws make the equality
independent of the norm-form representative.

The representative Lean theorem states this witness argument on the existing
`QuadraticForm` carrier. It takes the coefficients and discriminant/content
equations, a function `formChar` with the positive represented-value law, a
positive natural $m$, a vector representing it, and a nonzero integral ideal
of absolute norm $m$ in $A^{-1}$. It does not assume the comparison as a
hypothesis. The canonical theorem requires instantiating this function and
these witnesses with GN.2/GN.3 and the imported oriented dictionary. Their
precise laws are the supplier contracts above; no unnamed canonical API is
claimed by the signature.

*Needs:* GN.2's evaluation and invariance; GN.3's specialization and positive
coprime norm witness; IntegralLattices B1–B3 and GlobalNumberFields Layer 11;
Tau Ceti's coprime ideal character, membership and evaluation laws.

**Checks.**

- The principal form $[1,0,-3]$ of discriminant twelve represents $1$,
  giving character $1$ for either singleton factor. Its negative represents
  $3$ at $(0,1)$. For $\delta=-4$ the Kronecker value at $3$ is $(-1)$,
  agreeing with the narrow ideal character on $J$.
- The principal form $[1,1,-1]$ of discriminant five has trivial genus
  character for either factor $1$ or $5$. A factor $1$ is valid input.
- The imprimitive form $[2,0,-6]$ has discriminant
  $48=(-4)(-12)$ and content two. GN.2's $\chi_{-4}$ must be zero there,
  because the content shares a factor with $(-4)$. The nonfundamental
  discriminant excludes it from the comparison; assigning a unit value to
  every integral form would fail this check. This is a canonical supplier
  test in the README; the Lean example checks its discriminant, content and
  nonfundamentality without inventing a canonical character declaration.
- The coefficient actions must retain their complete class labels:
  $[a,-b,c]\leftrightarrow A^{-1}$,
  $[-a,b,-c]\leftrightarrow JA$, and $-Q\leftrightarrow JA^{-1}$.
  Swapping the last two labels is wrong even when real characters do not
  distinguish them.

### 3.2 Sign consequences of the comparison

The coefficient actions in the supplier contract imply that reversing the
middle coefficient preserves the character, while changing $[a,b,c]$ to
either $[-a,b,-c]$ or $[-a,-b,-c]$ multiplies it by
$\chi_t(J)=\operatorname{sign}(\delta)$. In particular,

$$\chi_\delta(-Q)=\operatorname{sign}(\delta)\chi_\delta(Q).$$

This recovers the supplier's parity law on the fundamental domain and tests
agreement of the two normalizations. For a positive factor the value is
unchanged; for a negative factor its sign reverses. These are consequences
of the comparison and supplied coefficient actions, not additional
construction targets. (Duke–Imamoḡlu–Tóth, §2, p.952, (2.3)–(2.5);
§7, p.971, before (7.8); §9, p.978, before Proposition 5.)

*Needs:* 3.1, 2.1 and the GN.3 coefficient actions, with the orientation
convention fixed in the supplier contracts.

### Examples

For $D=12$ and $\delta=-4$, the pair $Q=x^2-3y^2$ and $-Q$ has character
values $1,-1$, computed at the positive represented values $1,3$.
Their unoriented coefficient ideals coincide, so an unoriented comparison
would force an incorrect equality. After the proper rotation of $-Q$ to
$3x^2-y^2$, its ideal $(3,\sqrt3)=\sqrt3\mathcal O_K$ gives exactly $J$.
This checks the orientation, positivity of the represented value, dyadic
Kronecker normalization and the sign factor simultaneously.

### Dependencies

The canonical comparison consumes IntegralLattices B1–B3,
GlobalNumberFields Layer 11, GN.2 and the GN.3 adapters. Its algebraic witness
version consumes only the supplied evaluation and norm/class equations and
the pinned ideal-character theory. Layer 2 supplies the sign consequences;
Layer 0 explains which of these narrow characters descend to wide classes.

## Downstream consumers

AnalyticNumberTheory, AN.4, uses even and odd class characters in Hecke-period
interfaces and L-function factorization. The plus-space trace direction of
the modular programme uses the same general form character supplied by GN.2.
GeometryOfNumbersAndQuadraticArithmetic, GN.4, uses the exact $h^+/2^{r-1}$
normalization when averaging over one narrow genus. This roadmap provides
those algebraic interfaces; their analytic conclusions belong to those
consumers.

## References

- W. Duke, Ö. Imamoḡlu and Á. Tóth, *Geometric invariants for real quadratic
  fields*, Annals of Mathematics **184** (2016), 949–990,
  [DOI: 10.4007/annals.2016.184.3.8](https://doi.org/10.4007/annals.2016.184.3.8),
  [public final PDF](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n3-p08-p.pdf).
  The locators above use printed page numbers: §2, pp.950–952; §4,
  pp.959–960; §7, pp.970–972; §9, pp.977–978. The complementary-sign
  assertion from p.971 is used with the explicit real-discriminant qualifier.
- Mathlib, `GroupTheory.Coset`, `GroupTheory.QuotientGroup`,
  `NumberTheory.SumTwoSquares` and `LinearAlgebra.QuadraticForm`, at the
  commit specified in the supplier contracts.
- Tau Ceti, narrow class groups and quadratic genus characters, at the
  commit specified in the supplier contracts; the completed Multiquadratic
  roadmap; IntegralLattices, Layers B1–B3; GlobalNumberFields, Layer 11;
  GeometryOfNumbersAndQuadraticArithmetic, GN.2/GN.3.
