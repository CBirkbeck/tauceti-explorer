# Roadmap: multiquadratic fields and genus theory, part II: real quadratic signs and form characters

**Summary.** This roadmap builds the sign-sensitive interfaces between narrow
ideal classes, genera and integral binary quadratic forms in a real quadratic
field. Its targets are the exact narrow-to-wide kernel, unique descent of real
class characters, the number of narrow classes in each genus, arithmetic
criteria for the distinguished principal class to lie in the principal genus,
the genus character of an integral binary quadratic form, and its agreement
with the narrow ideal genus character at a positive fundamental discriminant.
These interfaces supply the algebraic normalizations used in real quadratic
period and trace formulas.

## Scope and ownership

The starting point is the completed [Multiquadratic roadmap](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/Completed/Multiquadratic/README.md).
Its narrow class group, prime-discriminant factorization, genus characters,
principal genus theorem and narrow two-rank formula are inputs here. In
particular, the singleton character value on the distinguished class and the
criterion that this class be a square are already Tau Ceti theorems. This
roadmap adds their composite and arithmetic consequences, rather than another
construction of those objects or proofs of those two results.

The precise ownership boundaries are as follows.

- **Multiquadratic, Part II** owns one definition and nine theorem targets in
  Layers 0–3: two narrow-defect interfaces, the genus-fibre cardinality, five
  sign and arithmetic interfaces, and the comparison of form and ideal genus
  characters. The definition is the genus character `binaryFormGenusChar` of
  an integral binary quadratic form, with its evaluation and zero laws.
- **[IntegralLattices, Layer B](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/IntegralLattices/README.md#layer-b-binary-lattices-and-quadratic-orders)**
  (B1–B3) owns integral binary forms and their content, proper equivalence,
  the oriented form–ideal bijection into GlobalNumberFields' `NarrowPic` for
  positive nonsquare discriminants, and its composition, inverse and
  genus-coset compatibilities. This roadmap does not use that bijection.
  Layer 3 compares characters on one form at a time, using the explicit
  coefficient ideal of that form and the library's
  `NumberField.NarrowClassGroup`. The ideal it uses is the one B2 attaches to
  the form, including the B2 sign clause for a negative leading coefficient.
- **[GlobalNumberFields, Layer 11](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/GlobalNumberFields/README.md#layer-11-orders-and-picard-groups)** owns number-field orders, invertible proper
  fractional ideals, `Pic`, `NarrowPic`, the forgetful homomorphism and its
  maximal-order specialization. No second narrow quotient is constructed here.
  Nothing here needs `NarrowPic` of the maximal order to be identified with the
  library's narrow class group.
- **GeometryOfNumbersAndQuadraticArithmetic** plans positive definite binary
  forms of negative discriminant and their ideal correspondence. It plans no
  genus character on forms. The character, in the generality of Gross–Kohnen–Zagier
  and of Duke–Imamoḡlu–Tóth §9 (any discriminant divisible by a fundamental
  one, with its zero branch on forms whose content meets the character's
  modulus), is therefore defined and specified in Layer 3 here. The analytic
  consumers listed at the end use it.
- Form reduction, composition algorithms and general representation theory
  stay with their lattice and quadratic-arithmetic owners. Hecke periods,
  gamma factors, spectral formulas, Weyl sums, subconvexity and asymptotic
  errors stay with the analytic and modular roadmaps.

The one new definition is the form character of Layer 3, a light definition
on integer coefficient triples. Otherwise the notation below names existing
objects and ordinary fibres. The distinction between narrow and wide
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
the narrow class number and $h(D)=\#W$ for the wide class number. Beware
that Duke–Imamoḡlu–Tóth write $h(D)$ for the *narrow* class number (§2,
p.950); their formula (4.2) is the narrow count of Layer 1.

Binary forms have the polynomial convention

$$Q(x,y)=[a,b,c](x,y)=ax^2+bxy+cy^2,\qquad \operatorname{disc}(Q)=b^2-4ac.$$

All coefficients are integers, and a form is its coefficient triple; the
content is $\gcd(a,b,c)$, and primitive means content one. Proper
equivalence uses determinant-one integral substitutions, equivalently
$\mathrm{PSL}_2(\mathbb Z)$ because $(-I)$ acts trivially. A full
$\mathrm{GL}_2(\mathbb Z)$ orbit loses orientation. These conventions do not
identify the classical discriminant with an unnormalized bilinear determinant.
A fundamental discriminant $\delta$ (possibly $1$) is a *fundamental divisor*
of a discriminant $\Delta$ when $\Delta=\delta\delta'$ with
$\delta'\equiv0,1\pmod4$; for $t\subseteq s$ as above, $\delta$ is a
fundamental divisor of $D$ with $\delta'=\prod_{P\in s\setminus t}P$.

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
`FractionalIdeal`, its membership predicate, `Ideal.absNorm`, `Int.gcd` and
`IsCoprime` are the carriers of Layer 3. Binary forms enter only through
their integer coefficient triples. Mathlib's `QuadraticForm ℤ (Fin 2 → ℤ)`
is not used: its discriminant passes through the associated bilinear form and
needs $2$ to be invertible.

### From Tau Ceti and Multiquadratic

Use Tau Ceti at `f790474821cf4256814db967cb154e7af3d0c369`. The declarations
below are the starting interfaces, not targets of the build.

- `NumberField.NarrowClassGroup`, its `mk` (the narrow class of an invertible
  fractional ideal), `mkPrincipal`, `mk0`, `mk_mk0`, `toClassGroup`,
  `toClassGroup_ker` and `toClassGroup_surjective` supply the existing carrier,
  representatives, kernel-as-principal-range and surjective forgetful map.
  `NumberField.coe_gen_ne_zero` supplies the field unit used in $J$, and
  `NumberField.NarrowClassGroup.mkPrincipal_neg` and
  `mkPrincipal_eq_one_of_isTotallyPositive` give the triviality of a principal
  class with a generator of positive norm in the real quadratic case.
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
  The membership condition is coprimality of the absolute norm with the
  product $\delta$ of the indexing subset, not with all of $D$.
- `genusCharFun` is the product over $t$ of `primeDiscriminantCharFun`, a
  total function on all integers. `genusCharFun_mul_right`,
  `genusCharFun_eq_zero_iff`, `genusCharFun_eq_one_or_eq_neg_one` and
  `primeDiscriminantCharFun_neg_one` (the value at $-1$ is the sign of the
  prime discriminant) are the arithmetic laws Layer 3 uses, including at
  negative arguments.

These interfaces are in `NumberField/NarrowClassGroup`,
`NumberField/Quadratic/Conjugation/NarrowClassGroup`,
`Multiquadratic/Quadratic/TwoRank`, and
`Multiquadratic/Quadratic/GenusCharacter/{Basic,CoprimeIdeal,NarrowClassGroup,PrincipalGenus,OrdinaryTwoRank}`,
together with the discriminant files and
`Multiquadratic/Legendre/PrimeDiscriminant/Character`.

## How to read the build

Layer 0 identifies the narrow defect and makes character descent unique.
Layer 1 counts the elements in an arbitrary genus using the existing quotient.
Layer 2 translates the value on the distinguished class into signed
prime-discriminant and two-square criteria. Layer 3 defines the genus
character of an integral binary form, proves that it is well defined, and
shows that at a positive fundamental discriminant it is the narrow ideal genus
character of the class of the form's coefficient ideal. Layers 0–2 consume
only the pinned Tau Ceti narrow-class and genus-character theory; Layer 3
consumes the same theory and the sign theorem of Layer 2.
`Suggested.lean` states the nine theorem endpoints, the form character as a
real-bodied definition with its evaluation and zero laws, and checks on
explicit values.

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
This is the elementary step that turns Tau Ceti's sign criterion
`isSquare_mkPrincipal_gen_iff` into the prime-divisor form in which
Duke–Imamoḡlu–Tóth state when $J$ lies in the principal genus (§4, p.960,
paragraph after (4.4)).

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

## Layer 3: genus characters of binary forms

### 3.1 The genus character of a binary form

Let $t$ be a finite set of prime discriminants with at most one even member,
and put $\delta=\prod_{P\in t}P$, a fundamental discriminant (possibly $1$).
Define `binaryFormGenusChar t a b c`, written $\chi_\delta(Q)$ for
$Q=[a,b,c]$:

$$
\chi_\delta(Q)=\begin{cases}
\texttt{genusCharFun}\ t\ m & \text{if $Q$ represents some $m\in\mathbb Z$ coprime to $\delta$,}\\
0 & \text{otherwise,}
\end{cases}
$$

where in the first case $m$ is any such represented integer. The
definition is total on integer triples and takes no discriminant hypothesis.
In Lean the represented integer is picked by choice, so the definition has a
real body. That the choice does not matter is the first API theorem, and it
needs $\delta$ to be a fundamental divisor of $\operatorname{disc}Q$. The
represented integer may be negative. `genusCharFun` is the Kronecker
character $(\delta/\cdot)$ on all integers, so its value at $-1$ is
$\operatorname{sign}\delta$. This is the generalized genus character of
Duke–Imamoḡlu–Tóth (§9, p.978, definition preceding Proposition 5) and the
classical genus character for a fundamental divisor, together with its
extension to imprimitive forms (Gross–Kohnen–Zagier, Ch. I §2, p.508, the
paragraph opening the section; Proposition 1 there is the level-$N$
generalization, which is not needed here).

Its API:

- `binaryFormGenusChar_eq_of_represents` (evaluation law). Suppose
  $b^2-4ac=\delta\delta'$ with $\delta'\equiv0,1\pmod4$, and suppose
  $Q(x,y)$ is coprime to $\delta$. Then
  $\chi_\delta(Q)=\texttt{genusCharFun}\ t\ (Q(x,y))$. The form may be
  imprimitive, definite, indefinite or of square discriminant, and the value
  may be negative. Compare the factor at one $P\in t$, lying over the prime
  $p$. Since $Q(x,y)$ is prime to $p$ and $p$ divides the discriminant, $p$
  cannot divide both $a$ and $c$. When $p\nmid a$, the identity
  $4a\,Q(x,y)=(2ax+by)^2-\operatorname{disc}(Q)\,y^2$ shows that
  $a\,Q(x,y)$ is a nonzero square modulo $p$ for odd $p$, so the factor
  equals the character of $P$ at $a$. For $p=2$, write $b=2b'$; then
  $a\,Q(x,y)=(ax+b'y)^2-(\operatorname{disc}Q/4)\,y^2$, and
  $\operatorname{disc}Q/P=(\delta/P)\,\delta'\equiv0,1\pmod4$ makes this
  odd value $\equiv1\pmod4$ for $P=-4$, $\equiv\pm1\pmod8$ for $P=8$ and
  $\equiv1,3\pmod8$ for $P=-8$. When $p\nmid c$ argue the same way with
  $c$. Either way the factor does not depend on $(x,y)$
  (Gross–Kohnen–Zagier, Ch. I §2, proof of Proposition 1, p.509).
- `binaryFormGenusChar_eq_zero_iff` (zero law): $\chi_\delta(Q)=0$ exactly
  when $\gcd(a,b,c)$ is not coprime to $\delta$. If a prime divides both
  the content and $\delta$, it divides every represented value. Conversely,
  when the content is prime to $\delta$, for each prime $p\mid\delta$ one of
  $Q(1,0)=a$, $Q(0,1)=c$, $Q(1,1)=a+b+c$ is prime to $p$. The Chinese
  remainder theorem combines these choices into one pair $(x,y)$ with
  $Q(x,y)$ coprime to $\delta$, and `genusCharFun` is $\pm1$ there
  (Gross–Kohnen–Zagier, p.509, the representation fact quoted in the proof).
  No discriminant hypothesis is needed.
- `binaryFormGenusChar_empty`: for $t=\varnothing$ the value is $1$ on
  every form, the zero form included.
- `binaryFormGenusChar_smul`: under the hypotheses of the evaluation law,
  $\chi_\delta(\mu Q)=\texttt{genusCharFun}\ t\ \mu\cdot\chi_\delta(Q)$
  for every integer $\mu$, by multiplicativity of `genusCharFun`.
- `binaryFormGenusChar_comp`: $\chi_\delta(Q\circ g)=\chi_\delta(Q)$ for
  every $g\in\mathrm{GL}_2(\mathbb Z)$, because both forms represent the
  same integers. In particular $\chi_\delta$ is a class function for proper
  equivalence, and $\chi_\delta([a,-b,c])=\chi_\delta([a,b,c])$.
- `binaryFormGenusChar_neg`: under the hypotheses of the evaluation law,
  $\chi_\delta(-Q)=\operatorname{sign}(\delta)\,\chi_\delta(Q)$, because
  $-Q$ represents $-m$ and `genusCharFun` at $-1$ is
  $\operatorname{sign}\delta$ (`primeDiscriminantCharFun_neg_one`). The
  same holds for $[-a,b,-c]$, which is $-Q$ composed with
  $\operatorname{diag}(1,-1)$.

`Suggested.lean` states the definition with the evaluation and zero laws.
The current Tau Ceti library, after the pinned commit, has a coefficient
carrier `TauCeti.BinaryQuadraticForm` with `eval`, `discrim` and the
$\mathrm{SL}_2$ action; it has no genus character on forms. A formalization
at a later pin should define the character on that carrier rather than on
bare triples.

**Checks.**

- $Q=[1,0,-3]$ has discriminant $12=(-4)(-3)$. With $\delta=-4$ it represents
  $1$ at $(1,0)$, so the value is $1$. It also represents $-3$ at $(0,1)$,
  and the character of $-4$ at $-3$ is again $1$. A definition that
  evaluated at $|m|$ would give $-1$ at the value $-3$ and fail
  well-definedness here.
- $-Q=[-1,0,3]$ represents $3$ at $(0,1)$, giving $-1=\operatorname{sign}(-4)
  \cdot\chi_{-4}(Q)$, as the sign law requires.
- The imprimitive form $[2,0,-6]$ has discriminant $48=(-4)(-12)$ with
  $-12\equiv0\pmod4$. Its content $2$ shares the prime $2$ with $-4$, so
  $\chi_{-4}$ is $0$ on it. A definition giving every form a unit value fails
  this test.
- $x^2+2y^2$ has discriminant $-8=(-4)\cdot2$, and $2\not\equiv0,1\pmod4$.
  It represents $1$ and $3$, where the character of $-4$ takes the values
  $1$ and $-1$. So the congruence condition on $\delta'$ cannot be dropped
  from the evaluation law.
- At discriminant $-15=5\cdot(-3)$ with $\delta=5$, the form $[2,1,2]$
  represents $2$ and $(5/2)=-1$, while the principal form $[1,1,4]$
  represents $1$. The character separates these two proper classes.
- With $\delta=1$ the value is $1$ for every form.

### 3.2 Agreement with the narrow ideal genus character

Under the real quadratic conventions, let $t\subseteq s$ and $\delta=\prod_{P\in
t}P$. Fix $\omega\in K$ with $\omega^2=D$, and let $Q=[a,b,c]$ have
$b^2-4ac=D$. Let $\mathfrak a$ be an invertible fractional ideal of
$\mathcal O_K$ whose elements are exactly the integral combinations of $a$
and $(-b+\omega)/2$. Prove `formCharacter_eq_idealCharacter`:

$$
\chi_\delta(Q)=\begin{cases}
\chi_t\bigl([\mathfrak a]^+\bigr) & a>0,\\
\chi_t\bigl(J\,[\mathfrak a]^+\bigr) & a<0,
\end{cases}
$$

with $\chi_t$ read in $\mathbb Z$. Since $D$ is fundamental and greater than
one, $Q$ is primitive and $a\neq0$ (Duke–Imamoḡlu–Tóth, §2, p.951).
The class on the right is the narrow class, in the library group, of the
ideal that IntegralLattices B2 attaches to $Q$: $\mathfrak a_Q=\mathfrak a$
when $a>0$, and $\sqrt D\,\mathfrak a_Q$ when $a<0$, where $[\sqrt D]^+=J$.
(B2 takes that class in GlobalNumberFields' `NarrowPic`; no comparison of the
two groups is used here.) For $a>0$ it is
also the class that Duke–Imamoḡlu–Tóth attach to $Q$. Their ideal is
$w\mathbb Z+\mathbb Z$ with $w=(-b+\sqrt D)/(2a)$ and $w^\sigma<w$, and
$Q(x,y)=N(x-wy)/N(w\mathbb Z+\mathbb Z)$. That ideal is
$a^{-1}\mathfrak a$, in the same narrow class because $a>0$ (§2, p.952).
The statement is theirs for $D>0$ fundamental (§9, p.978, sentence before
Proposition 5). Either square root $\omega$ may be used. Replacing $\omega$
by $-\omega$ replaces $\mathfrak a$ by its conjugate, whose class is the
inverse class, and $\chi_t$ takes the same value on a class and its inverse.

Proof. Write $\beta=(-b+\omega)/2$. It is a root of $X^2+bX+ac$, so it is
integral. Also $\mathcal O_K=\mathbb Z+\beta\mathbb Z$, because $(D+\omega)/2-\beta=(D+b)/2$
is an integer. Hence $\mathfrak a=a\mathbb Z+\beta\mathbb Z$ is an
integral ideal of index and absolute norm $|a|$. For integers $u,v$,
$N(ua+v\beta)=a\,Q(u,-v)$. Take any $m=Q(x,y)$ coprime to $\delta$; one
exists by the zero law of 3.1, and $\chi_\delta(Q)=\texttt{genusCharFun}\
t\ m$ by the evaluation law. Put $\alpha=xa-y\beta\in\mathfrak a$, so
$N(\alpha)=am\neq0$. The ideal $\mathfrak b=\alpha\mathfrak a^{-1}$ is
integral of absolute norm $|m|$, coprime to $\delta$. So $\mathfrak b$ lies
in the coprime-ideal submonoid, and
$\chi_t([\mathfrak b]^+)=\texttt{genusCharFun}\ t\ |m|$
(`genusCharFunNarrowClassGroupHom_mk0`, `genusCharFunCoprimeIdealHom_apply`).
In the real quadratic field a principal ideal with a generator of positive norm
has trivial narrow class, and one with a generator of negative norm has class
$J$. So $[\mathfrak b]^+=[\mathfrak a]^{-1}$ when $am>0$, and
$J[\mathfrak a]^{-1}$ when $am<0$. Finally
$\chi_t(J)=\operatorname{sign}\delta$ (2.1),
$\texttt{genusCharFun}\ t\ m=(\operatorname{sign}\delta)^{[m<0]}\,
\texttt{genusCharFun}\ t\ |m|$, and $\chi_t$ is $\pm1$-valued, so
$\chi_t(A^{-1})=\chi_t(A)$. The exponents of $\operatorname{sign}\delta$ that
occur are $[m<0]+[am<0]$ on one side and $[a<0]$ on the other, and these have
the same parity. This gives the displayed equality in all four sign cases.
Choosing $m>0$ when $a>0$ (possible by moving $(x,y)$ by multiples of
$\delta$) reduces the main case to $[\mathfrak b]^+=[\mathfrak a]^{-1}$ and
$N(\mathfrak b)=m$. That is the norm-form computation of Duke–Imamoḡlu–Tóth
§2, p.952.

*Needs:* 3.1 (evaluation and zero laws), 2.1; Tau Ceti `NarrowClassGroup.mk`,
`mk_mk0`, `mkPrincipal_eq_mkPrincipal_gen_of_norm_neg`,
`mkPrincipal_eq_one_of_isTotallyPositive`, `mkPrincipal_neg`, the
coprime-ideal submonoid and evaluation law, `genusCharFunNarrowClassGroupHom_mk0`,
`primeDiscriminantCharFun_neg_one`; Mathlib's absolute ideal norm of a
principal ideal and the index of a sublattice given by a basis change.

**Checks.**

- $D=12$, $\omega^2=12$, so $\omega/2=\pm\sqrt3$. For $Q=[1,0,-3]$,
  $\mathfrak a=\mathbb Z+\sqrt3\,\mathbb Z=\mathcal O_K$, of trivial class.
  Every $\chi_t$ is $1$, and $\chi_\delta(Q)=1$ at the represented value $1$.
- For $Q=[3,0,-1]$, $\mathfrak a=3\mathbb Z+\sqrt3\,\mathbb Z=\sqrt3\,
  \mathcal O_K$, of class $J$ since $N(\sqrt3)=-3$. Then
  $\chi_{\{-4\}}(J)=-1$, and $Q$ represents $3$ with character $-1$.
- For $-Q=[-1,0,3]$ the set $\mathfrak a$ is again $\mathcal O_K$. The
  unoriented class would give $1$, but the oriented class $J$ gives $-1$,
  which agrees with $\chi_{-4}(-Q)=-1$ from 3.1. Moreover $x^2-3y^2$ does not
  represent $-1$ modulo $3$, so $Q$ and $-Q$ are not equivalent. This is the
  orientation witness of IntegralLattices B2.
- $D=5$, $Q=[1,1,-1]$: $\mathfrak a=\mathbb Z+\frac{-1+\sqrt5}2\mathbb Z=
  \mathcal O_K$, and $\chi_t$ is $1$ for $t=\varnothing$ and $t=\{5\}$; the
  empty factor is valid input.
- Duke–Imamoḡlu–Tóth's table (§2, p.952, (2.3)–(2.5)) says that if $Q$
  corresponds to $A$, then $[a,-b,c]$ corresponds to $A^{-1}$, $[-a,b,-c]$ to
  $JA$ and $-Q$ to $JA^{-1}$. Under $\chi_t$ these labels become the
  invariance and sign laws of 3.1. The comparison must reproduce all three.
  Swapping $JA$ and $JA^{-1}$ is invisible to real characters, but it is
  still a wrong statement about classes; this roadmap uses only the
  character values.

### Examples

For $D=12$ and $\delta=-4$, the forms $Q=x^2-3y^2$ and $-Q$ have character
values $1$ and $-1$. They are computed at the represented values $1$ and $3$,
or equally at $-3$ and $-1$. Their unoriented coefficient ideals coincide, so
an unoriented comparison would force an incorrect equality. After the proper
rotation of $-Q$ to $3x^2-y^2$, its ideal $(3,\sqrt3)=\sqrt3\,\mathcal O_K$
gives exactly $J$. This checks the orientation, the sign of the represented
value, the dyadic Kronecker normalization and the sign factor
$\chi_t(J)=\operatorname{sign}\delta$ at once.

### Dependencies

Layer 2 (2.1) and the pinned Tau Ceti narrow class group, coprime-ideal
genus character and prime-discriminant characters. No binary-form supplier is
consumed. The oriented form–ideal bijection of IntegralLattices B2 and the
order and Picard carriers of GlobalNumberFields Layer 11 are not needed. Layer
0 explains which of these narrow characters descend to wide classes.

## Downstream consumers

AnalyticNumberTheory, Layer AN.4, uses even and odd class characters, the
value $\chi(J)=\operatorname{sign}\delta$ and the genus Euler factorization in
its Hecke-period interfaces. The proposed Fuchsian orbifolds Part II (Nielsen
cores $F_A$ of narrow classes) uses the genus signs of Layers 0 and 2. The
genus averages of Duke–Imamoḡlu–Tóth (Theorem 2 and (4.4)) average over one
narrow genus with the normalization $h^+/2^{r-1}$ of Layer 1. Their twisted
traces (§9) weight forms by $\chi_\delta$ of Layer 3, including imprimitive
forms and nonfundamental discriminants. This roadmap provides those algebraic
interfaces; the analytic conclusions belong to the consumers.

## References

- W. Duke, Ö. Imamoḡlu and Á. Tóth, *Geometric invariants for real quadratic
  fields*, Annals of Mathematics **184** (2016), 949–990,
  [DOI: 10.4007/annals.2016.184.3.8](https://doi.org/10.4007/annals.2016.184.3.8),
  [public final PDF](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n3-p08-p.pdf).
  The locators above use printed page numbers: §2, pp.950–952; §4,
  pp.959–960; §7, pp.970–972; §9, pp.977–978. The complementary-sign
  assertion from p.971 is used with the explicit real-discriminant qualifier.
- B. Gross, W. Kohnen and D. Zagier, *Heegner points and derivatives of
  L-series. II*, Mathematische Annalen **278** (1987), 497–562,
  [DOI: 10.1007/BF01458081](https://doi.org/10.1007/BF01458081),
  [author-hosted copy](https://people.mpim-bonn.mpg.de/zagier/files/doi/10.1007/BF01458081/fulltext.pdf).
  Ch. I §2, pp.508–510: the genus character on forms, its well-definedness
  and its extension to imprimitive forms.
- Mathlib, `GroupTheory.Coset`, `GroupTheory.QuotientGroup`,
  `NumberTheory.SumTwoSquares`, `RingTheory.FractionalIdeal` and
  `RingTheory.Ideal.Norm`, at the commit specified in the supplier contracts.
- Tau Ceti, narrow class groups and quadratic genus characters, at the
  commit specified in the supplier contracts; the completed Multiquadratic
  roadmap; IntegralLattices, Layer B; GlobalNumberFields, Layer 11.
