# Multiquadratic fields and genus theory, Part II: real quadratic signs and form characters

This roadmap extends `tauceti:TauCetiRoadmap/Multiquadratic`. It begins with the existing narrow class group, prime-discriminant factorization, genus characters and principal genus theorem. Its purpose is to make the signs in real quadratic genus theory usable at the boundary between ideal classes and binary forms. The endpoint is the equality of the form and ideal genus characters for a positive fundamental discriminant. On the way, it supplies the exact narrow defect, the criterion for a real class character to descend to the ordinary class group, and the number of narrow classes in each genus.

The motivating source is Duke–Imamoḡlu–Tóth, *Geometric invariants for real quadratic fields*, Annals of Mathematics 184 (2016), 949–990. The relevant algebra occurs in §§2, 4, 7 and 9. Its analytic applications distinguish two positive discriminant factors from two negative factors. A formal interface must retain that distinction: both kinds of factorization have positive product, but their genus characters have different values on the distinguished principal class. The same interface controls the sign introduced by reversing a norm form. These are algebraic inputs to period formulas, rather than analytic estimates themselves.

The reviewed library audit marks all four layers of the upstream Multiquadratic roadmap as built. Reading the pinned declarations reveals more than the paper extraction's original availability report: the singleton sign formula and the criterion that the distinguished class be a square are already proved. This Part II imports those results. It adds their composite and arithmetic interfaces and the specific comparison with the form character. It introduces no replacement for a group, quotient or character that the libraries already contain.

## Conventions and the starting library

Let $K$ be a number field, and choose an algebraic integer $\theta$ generating it over $\mathbb Q$, with minimal polynomial

$$
\operatorname{minpoly}_{\mathbb Z}(\theta)=X^2-d,
\qquad d\in\mathbb Z,
\qquad d>0,
\qquad d\text{ squarefree}.
$$

The generating condition means that the algebra adjoined by $\theta$ is all of $K$. The minimal-polynomial condition makes this a genuine quadratic presentation; it is not merely a chosen element whose square happens to equal $d$. In particular, the presentation does not apply to the rational field with $d=1$. We write

$$
D=\operatorname{fundamentalDiscriminant}(d)
 =\begin{cases}d&d\equiv1\pmod4,\\4d&d\not\equiv1\pmod4.\end{cases}
$$

Thus $D>1$ is the field discriminant. Keep $d$, the squarefree radicand, separate from $D$, which can contain a power of two. The genus-character factor below is called $\delta$, rather than $d$, to avoid the source's use of the same letter for a different object.

Let $C=\operatorname{Cl}^+(K)$. The baseline carrier is `NumberField.NarrowClassGroup`. Its equivalence relation on nonzero fractional ideals uses principal ideals with totally positive generators. In a real quadratic field, this agrees with the source's condition that the norm of the multiplier be positive: its two real signs are then equal, and multiplication by the integral unit $-1$ changes two negative signs to two positive signs. This argument uses the real quadratic signature. It is not a replacement definition of narrow equivalence for a number field with more real places.

Write $W=\operatorname{ClassGroup}(\mathcal O_K)$ and let $\pi:C\to W$ be `NumberField.NarrowClassGroup.toClassGroup`. This forgetful map is surjective. The principal-class homomorphism `mkPrincipal` takes a nonzero field element, expressed as a unit of $K$, to the narrow class of its principal fractional ideal. Define notation, not a new library object,

$$
J=\operatorname{mkPrincipal}(\theta).
$$

The nonzero proof needed to regard $\theta$ as a field unit follows from the quadratic minimal polynomial. The source calls $J$ the class of the different, represented by $(\sqrt D)$. Since $\sqrt D$ is either $\theta$ or $2\theta$, up to the choice of real square root, these principal ideals have the same narrow class. A positive rational multiplier changes no narrow class, and changing the sign of the generator changes no principal ideal. The plan uses the existing principal-class expression throughout; it does not require a new definition of the different or another ideal-class carrier.

The baseline proves that every principal narrow class has square one. In particular, $J^2=1$. It also proves that a negative-norm generator has class $J$, that every principal class in a quadratic presentation is either one or $J$, and that $\pi$ is injective exactly when an integral unit has norm $-1$. These are imports from the quadratic conjugation and narrow-class files. Reproving the norm-unit criterion would duplicate the upstream theory.

A prime discriminant is one of $-4,8,-8$, or

$$
p^*=\begin{cases}p&p\equiv1\pmod4,\\-p&p\equiv3\pmod4,\end{cases}
$$

for an odd rational prime $p$. Let $s$ be a finite set of prime discriminants with product $D$, containing at most one even member. Its cardinality is the number of distinct rational primes dividing $D$, equivalently the number of rational primes ramified in $K$. Distinctness and the restriction on the even member matter. A list containing both $-4$ and $8$ is not a prime-discriminant factorization of a fundamental discriminant, even though both lie above the prime two.

For $t\subseteq s$, put

$$
\delta=\prod_{P\in t}P,\qquad
\delta'=\prod_{P\in s\setminus t}P.
$$

Both products are fundamental discriminants in the baseline's convention, which includes the empty product $1$. Their product is $D$. The baseline narrow genus character is

$$
\chi_t:C\longrightarrow\mathbb Z^\times=\{1,-1\},
$$

provided by `genusCharFunNarrowClassGroupHom`. Its arguments include the quadratic presentation, squarefreeness of $d$, the factorization $s$, and the containment $t\subseteq s$. The integer arithmetic function `genusCharFun` multiplies the prime-discriminant characters in $t$. On a nonzero integral ideal whose absolute norm is coprime to $\delta$, the narrow character evaluates to this arithmetic function at that norm. The coprime ideal submonoid, its character, the descent to narrow classes and the evaluation law all exist in the pinned library.

The carrier for genera is the existing additive $\mathbb F_2$-space `NumberField.NarrowClassGroup.ElementaryTwoQuotient`. It is $C/C^2$, with class map $q$, provided by `TauCeti.elementaryTwoQuotientMk`. Thus $q(A)=0$ means that $A$ is a square in $C$. The identity genus is written zero in this additive model even though $C$ is written multiplicatively. This quotient is distinct from the subgroup $C[2]=\{A:A^2=1\}$. For finite abelian groups the two objects have equal cardinality, but neither the elements nor the fibres of the quotient map can be replaced by two-torsion elements.

The pinned baseline is Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. The packet records the declarations used from these commits. `Mathlib/GroupTheory/Coset/Basic` and `Card` supply fibre equivalences and the subgroup cardinality formula. `Mathlib/GroupTheory/QuotientGroup` supplies quotient lifts and the first isomorphism theorem. `Mathlib/NumberTheory/SumTwoSquares` supplies the full valuation criterion for sums of two squares. The additional theorems below are adapters to these objects, rather than general theories of finite quotients or binary forms.

## RQ.0 — The real quadratic narrow defect

The first declaration is `TauCeti.Multiquadratic.RealSigns.ker_toClassGroup_eq_pair`:

$$
\pi(A)=1\quad\Longleftrightarrow\quad A=1\ \text{or}\ A=J
\qquad(A\in C).
$$

As a set, the kernel is $\{1,J\}$. A set with these two displayed entries can have one element. The theorem must allow $J=1$. Equivalently, the kernel subgroup is the cyclic subgroup generated by $J$, and the existing first isomorphism theorem identifies $C/\langle J\rangle$ with $W$. The quotient equivalence is an application of the imported construction, not a new construction node.

To prove the displayed assertion, use the baseline identity identifying $\ker\pi$ with the range of `mkPrincipal`. A kernel class is therefore the class of some principal fractional ideal. The existing quadratic principal-class dichotomy makes it one or $J$. In the reverse direction, $\pi$ kills every principal ideal class and preserves one. This proof also explains the scope of the suggested signature: the kernel assertion itself works for either quadratic signature, although this roadmap uses its real specialization.

This exact identity sharpens a cardinality bound already in the library. The bound $\#\ker\pi\leq2$ cannot by itself identify the nontrivial element or explain its action on a narrow class. With the exact identity, if $A\in C$, all narrow classes above $\pi(A)$ are $A$ and $JA$. They coincide exactly when $J=1$. If $J\ne1$, multiplication by $J$ exchanges the two members of every ordinary-class fibre. No choice of a representative ideal is needed for that action.

The second declaration is `existsUnique_wideCharacter_iff`. For a multiplicative real character $\chi:C\to\mathbb Z^\times$, it states

$$
\bigl(\exists!\,\psi:W\to\mathbb Z^\times,
\ \psi\circ\pi=\chi\bigr)
\quad\Longleftrightarrow\quad\chi(J)=1.
$$

This is an existence and uniqueness theorem. A function on the underlying set of narrow classes is insufficient input: multiplicativity is part of the hypothesis. The equation is equality of homomorphisms, so it determines values on all wide classes. An implementation should use the existing quotient lift through $\ker\pi$, followed by the existing quotient-kernel equivalence to $W$.

Indeed, the exact kernel identity shows that $\chi$ kills $\ker\pi$ precisely when it kills $J$. Quotient lifting then supplies $\psi$. Surjectivity of $\pi$ proves uniqueness: evaluate two proposed descents at a lift of each wide class. Conversely, any descent takes value one on $J$, because $\pi(J)=1$. The source uses this distinction before introducing the genus characters in §7; the theorem makes the unique descent usable without choosing ideals of prescribed norm.

There are two notions of evenness worth keeping separate. A real character is even on the narrow defect when $\chi(J)=1$. Every real character kills squares, so a square $J$ is invisible to all real characters even when $J\ne1$. A character with complex values can detect a nontrivial square; it need not descend in that case. Thus the criterion that all genus characters descend is weaker than the criterion that narrow and ordinary classes agree. This is the distinction needed by RQ.2.

The acceptance cases are the trivial character, a character taking $-1$ on $J$, and the collapsed kernel $J=1$. The trivial character has exactly one descent. A character odd on $J$ has none. When an integral unit has norm $-1$, the imported norm-unit criterion makes $\pi$ injective and the kernel collapses. The suggested file states the first two cases as examples. The packet also requires that a formalizer never conclude that the kernel has two distinct elements from $J^2=1$ alone.

The only upstream mathematical input for this layer is the built Multiquadratic theory, especially its narrow ideal and genus-theory summit. There is no open supplier request for RQ.0. Its planets are **Narrow defect** and **Even character descent**.

## RQ.1 — Equal cardinalities of narrow genera

For a genus $g\in C/C^2$, let

$$
G_g=\{A\in C:q(A)=g\}.
$$

This is ordinary subtype notation for a fibre of the existing class map. It is not a new notion of genus, an equivalence relation on forms, or a genus selected by a vector of character values. The actual quotient and its zero-characterization already exist. The source's symbol $G_D$ denotes a chosen fibre of this sort, rather than the entire quotient group.

The theorem `card_genusFiber_mul_twoPow` is

$$
2^{\#s-1}\,\#G_g=\#C.
$$

Equivalently, with $r=\omega(D)=\#s$ and $h^+(D)=\#C$,

$$
\#G_g=2^{1-r}h^+(D).
$$

The first formula is the declaration proposed for a natural-number cardinality API. The second is a rational-number reformulation. A negative exponent is not evaluated in the natural numbers, and natural-number subtraction in the first exponent is justified by the genuine quadratic factorization. Use $h^+$ for the narrow class number. The ordinary class number has a different normalization when the narrow defect is nontrivial.

The proof has two independent parts. The first is group theory already present in Mathlib. Every fibre of a surjective group homomorphism is equivalent to the kernel. For the quotient by $C^2$, choose a lift $A_0$ of $g$; multiplication by $A_0$ gives an equivalence from $C^2$ to $G_g$. Changing the chosen lift changes that equivalence but not the cardinality. The subgroup cardinality theorem gives

$$
\#C=\#(C/C^2)\,\#C^2.
$$

The baseline comparison between its additive elementary-two quotient and the direct quotient by squares allows this argument to use the existing class map. No second multiplicative genus carrier is needed.

The second part is the built narrow two-rank theorem. The narrow genus quotient has cardinality $2^{\operatorname{twoRank}(C)}$, and this rank is $r-1$. The prime-discriminant factorization counts the rational ramified primes, so $r=\#s$. Substitute these cardinalities in the group-theoretic equation. This proof retains the square subgroup as the kernel of the quotient map; replacing it by the two-torsion subgroup would change the argument even when some numerical coincidences survive.

Surjectivity makes every $G_g$ nonempty. Finiteness of the narrow class group makes each fibre finite. The displayed identity, whose coefficient is a positive power of two, makes all fibre cardinalities equal and shows that $2^{r-1}$ divides $h^+(D)$. These consequences do not require a computed class number or a choice of genus. They are the exact normalization needed by averages over a single genus.

For $D=5$ and $D=8$, there is one prime discriminant and one genus; that genus consists of all narrow classes. This statement does not assert that the narrow class group has one element. For $D=12=(-4)(-3)$ and $D=28=(-4)(-7)$, there are two genera, each with $h^+/2$ classes. For $D=60=(-4)(-3)5$, there are four genera, each with $h^+/4$ classes. These examples test the exponent and the dyadic normalization without importing unsupported class-number computations.

A useful group-theoretic non-example is a cyclic group of order eight. Its subgroup of squares has four elements and its quotient by squares has two fibres, each of size four. Its two-torsion subgroup has two elements. Treating a genus fibre as a subset of two-torsion would give the wrong cardinality in this case. The suggested file uses the multiplicative form of $\mathbb Z/8\mathbb Z$ for this check. Equal cardinalities of the quotient and the two-torsion subgroup are insufficient to identify their roles.

The endpoint of RQ.1 is the exact integer identity, together with the imported fibre equivalence and its finite, nonempty consequences. It does not include effective enumeration of narrow classes, form reduction, class-number-one predictions, or an infinitude theorem for discriminants with small class number. Its single planet is **Genus cardinality**. The layer has no open supplier request.

## RQ.2 — Signs of genus characters

The pinned file `GenusCharacter/OrdinaryTwoRank` proves the singleton formula

$$
\chi_{\{P\}}(J)=\operatorname{sign}(P)\qquad(P\in s).
$$

It also proves that $J$ is a square exactly when all prime-discriminant factors are positive. Both results are stronger starting points than the route's original missing-result labels suggest. RQ.2 therefore contains the composite sign formula and the arithmetic translation of this existing square criterion, not another node for either singleton theorem.

The declaration `genusCharacter_J_eq_sign_prod` states, for every $t\subseteq s$,

$$
\chi_t(J)=\operatorname{sign}(\delta)
         =\operatorname{sign}(\delta').
$$

The first equality reads the unit-valued character as an integer. The second uses $D>0$. All prime discriminants are nonzero, so neither subproduct is zero. Since $\delta\delta'=D$, the two signs agree. In particular the empty factor and the full factor both give value one on $J$. A primitive implementation can keep the two assertions as a simultaneous theorem, as in the suggested signature.

The proof is a finite product calculation using the existing `genusCharFunNarrowClassGroupHom_eq_prod_singleton`. Evaluate its factors at $J$ by the imported singleton formula; multiply their signs; then use the positivity of the full product. The calculation covers the factors $-4$, $8$ and $-8$ without separate definitions of dyadic characters. It also preserves the factor $1$, which is essential for the trivial character and the endpoint of a complementary factorization.

There is a genuine signature restriction here. If $D<0$, the signs of $\delta$ and $\delta'$ are opposite. The unqualified equality printed in the source's genus-character paragraph cannot hold in that case. The roadmap's hypothesis $D>0$ is part of the theorem, not an implicit convention that an implementation may omit. The source finding is recorded below and in the packet. Nothing in this layer replaces the imaginary-field character theory.

The example $D=12=(-4)(-3)$ tests the distinction between an odd genus character and an empty or full factor. Each singleton takes value $-1$ on $J$, while their product takes value one. For $D=24=(-8)(-3)$, the negative dyadic factor is $-8$. Replacing it by $8$ would give negative product $-24$, rather than the field discriminant $24$. For $D=8$, the sole factor is positive and the sign on $J$ is one. These calculations distinguish a signed prime-discriminant factorization from a factorization of the positive integer into its absolute prime divisors.

The next declaration, `primeDiscriminants_positive_iff`, is an arithmetic theorem that does not require a field carrier. Let $D>0$ be the product of a finite set $s$ of prime discriminants, at most one of which is even. Then

$$
\bigl(\forall P\in s,\ P>0\bigr)
\quad\Longleftrightarrow\quad
\bigl(\forall p\text{ prime},\ p\mid D\Rightarrow p\not\equiv3\pmod4\bigr).
$$

The statement includes the empty factorization of $D=1$. It is useful separately from the quadratic presentation, since it compares two arithmetic descriptions of a discriminant. The positivity of $D$, the signed nature of $s$, and the restriction to a single even member are explicit hypotheses.

For an odd member $P=p^*$, its sign is negative precisely when $p\equiv3\pmod4$. Such a prime divides $D$. Conversely, a rational prime dividing the finite product divides at least one member, and the baseline underlying-prime theorem identifies that member's rational prime. If no prime of residue three divides $D$, every odd member is positive. Their product is positive. The remaining even member, if present, must then also be positive because $D>0$; among the three allowed even prime discriminants only $8$ is positive. This handles the dyadic factor without mistaking its sign for an independent choice.

In the opposite direction, every odd positive prime discriminant lies over a prime congruent to one modulo four. Any even member lies over two. Thus a positive factorization cannot contain a rational prime of residue three. The case $D=-4$ shows why positivity of the full discriminant is indispensable: its only rational prime divisor is two, but its prime discriminant is negative. This is an acceptance non-example for the arithmetic theorem as well as a useful check on the source sign qualification.

The declaration `fundamental_sumTwoSquares_iff` states that, for a positive fundamental discriminant $D$,

$$
\bigl(\exists x,y\in\mathbb Z,\ D=x^2+y^2\bigr)
\quad\Longleftrightarrow\quad
\bigl(\forall p\text{ prime},\ p\mid D\Rightarrow p\not\equiv3\pmod4\bigr).
$$

Here fundamentality has its existing arithmetic definition. Either $D\equiv1\pmod4$ and $D$ is squarefree, or $D=4e$, where $e$ is squarefree and $e\equiv2$ or $3\pmod4$. The value $D=1$ is allowed in this arithmetic statement; it is excluded from the real quadratic field presentation. The integers $x,y$ can be zero or negative. No primitive representation hypothesis is needed.

Mathlib's theorem `Nat.eq_sq_add_sq_iff` is the full input. It asks that every prime congruent to three modulo four have even valuation. For a positive fundamental discriminant, each odd prime divisor has valuation one: squarefreeness proves this in the odd branch, and multiplication by four affects only the prime two in the even branch. Consequently a prime of residue three cannot appear at all. Converting an integer representation into a natural one uses the absolute values of its coordinates; converting back uses the natural-number casts. This conversion must retain positivity of $D$, rather than silently replace a signed discriminant by its absolute value.

The examples are $5=1^2+2^2$, $8=2^2+2^2$, and $136=6^2+10^2$, while $12$ has no representation as two integer squares. The non-example $9=0^2+3^2$ detects a false extension to arbitrary positive integers: it has a prime divisor congruent to three, but that prime has even valuation. A development must use Mathlib's valuation theorem before specializing, rather than assert the no-prime-divisor criterion for general integers. The exponent of two is unconstrained by this criterion and cannot be treated as another odd prime.

The combined declaration `J_square_iff_sumTwoSquares` returns the real quadratic consequence:

$$
J\in C^2
\quad\Longleftrightarrow\quad
D\text{ has no prime divisor }p\equiv3\pmod4
\quad\Longleftrightarrow\quad
D=x^2+y^2\text{ for some }x,y\in\mathbb Z.
$$

Start with the imported theorem `isSquare_mkPrincipal_gen_iff`. Apply the positive-prime-discriminant adapter, then the two-square adapter. The fundamental-discriminant product theorem ensures that the arithmetic hypothesis is supplied by the chosen factorization. This proof introduces neither a second principal genus theorem nor a new account of the class group's two-rank.

The built principal genus theorem tests the singleton genus characters. The built product decomposition then shows that $J\in C^2$ is equivalent to $\chi_t(J)=1$ for every subset $t$. RQ.0 supplies the unique wide descent of each of these characters. Thus the all-even genus-character condition, the principal-genus condition and the two arithmetic conditions coincide. The statement does not say that $J=1$. For $D=136=8\cdot17$, all factors are positive and $J$ is square. The pinned ordinary-two-rank file explicitly uses $\mathbb Q(\sqrt{34})$ to distinguish this phenomenon from an integral unit of norm $-1$: the negative Pell equation for $34$ has no integer solution, although $-1$ is a rational field norm. This roadmap uses that distinction as a regression boundary and does not add a general negative-Pell theorem.

Finally, `J_ne_one_of_prime_threeModFour` states a sufficient obstruction. If $p$ is a rational prime dividing $D$ with $p\equiv3\pmod4$, then $J\ne1$, there is no integral unit of norm $-1$, and

$$
h^+(D)=2h(D).
$$

The proof uses the principal-genus arithmetic criterion to show that $J$ is not square. Since one is square, $J\ne1$. The exact kernel theorem makes $\pi$ noninjective, the imported norm-unit theorem excludes a negative-norm integral unit, and the existing narrow-class-number/kernel formula gives the factor two. The suggested signature packages these consequences together. The kernel is therefore a pair of distinct elements in this case, rather than a pair whose entries might coincide.

For $D=12$ the obstructing prime is three; for $D=28$ it is seven. The converse is deliberately absent: a nontrivial $J$ can be square, as the $D=136$ distinction illustrates. All the hypotheses use the positive field discriminant, not an arbitrary multiple of it. Divisibility by a prime of residue three is a sufficient obstruction to a negative-norm unit; failure of that obstruction does not produce such a unit.

This layer has five planets: **Genus character signs**, **Positive prime discriminants**, **Two-square discriminants**, **Principal genus signs**, and **Narrow defect obstruction**. Its dependency chains end in RQ.0, the imported narrow genus theory and Mathlib's arithmetic theorem. It has no open supplier request.

## RQ.3 — Fundamental form and ideal characters

This layer compares two theories that have different owners. The ideal character $\chi_t$ is the built Multiquadratic character. The form character $\chi_\delta$, including its definition on imprimitive forms, belongs to `GeometryOfNumbersAndQuadraticArithmetic:GN.2`. The oriented primitive-form/narrow-ideal dictionary belongs to `GeometryOfNumbersAndQuadraticArithmetic:GN.3`. Neither supplier's current packet has a node with exactly the interface required here. The two requests in this packet state those interfaces precisely, so the consumer does not conceal the absent declarations behind an informal reference to reduction theory.

Use the integral binary form

$$
Q(x,y)=[a,b,c](x,y)=ax^2+bxy+cy^2,
\qquad a,b,c\in\mathbb Z,
\qquad b^2-4ac=D.
$$

For a positive fundamental $D$, this form is primitive. We retain the explicit content-one hypothesis in the comparison specification and suggested signature because it explains the scope of the norm-form dictionary and prevents an imprimitive carrier from entering by coercion. The underlying polynomial can be expressed with Mathlib's existing `QuadraticForm` on $\mathbb Z^2$. Its classical discriminant is $b^2-4ac$. This is not a declaration identifying that expression with every bilinear determinant convention over the integers; the middle coefficient and the factor four must be preserved.

Proper equivalence means the usual determinant-one integral change of variables, or equivalently the $\mathrm{PSL}_2(\mathbb Z)$ action since $-I$ acts trivially on quadratic forms. It is not the full $\mathrm{GL}_2(\mathbb Z)$ orbit relation. The orientation distinguishes a narrow class from the information remaining after a determinant-minus-one basis change. The supplier must expose the actual equivalence and representative maps, rather than a proposition field asserting that a form is somehow associated to a class.

The source's convention on p.952 is important. Take a fractional ideal $\mathfrak a=w\mathbb Z+\mathbb Z$ with $w^\sigma<w$, and form

$$
Q(x,y)=\frac{N(x-wy)}{N(\mathfrak a)}.
$$

For a representative with $a>0$, its inverse expression is

$$
w=\frac{-b+\sqrt D}{2a}.
$$

The minus sign in front of $b$ and the order $w^\sigma<w$ were checked on the published page image. They cannot be inferred safely from text extraction, which loses minus signs and superscripts in these equations. The supplier request includes this convention and the transition between fractional and integral ideal representatives.

GN.2's form character has a zero branch when the content shares a factor with $\delta$, and otherwise evaluates at a represented integer coprime to $\delta$. It is independent of the chosen such integer and invariant under proper equivalence. Its normalization is the Kronecker character attached to $\delta$; for the present subset factorization this must agree with the baseline arithmetic function `genusCharFun` on the same input. These evaluation, content, invariance and parity laws constitute a supplier contract. Rebuilding them in MultiquadraticPartII would give two owners to the shared character used by the DIT and Bruinier–Ehlen–Yang routes.

The consumer theorem `formCharacter_eq_idealCharacter` is

$$
\chi_\delta(Q)=\chi_t(A),
$$

where $A\in C$ is the narrow class associated to $Q$ by that oriented dictionary. Its hypotheses are $D>0$ fundamental, the real quadratic presentation, the prime-discriminant factorization $s$, the subset $t$, the primitive form of discriminant $D$, and the specified form/class association. Equality reads the ideal character's integer value, so the value sets are compared without replacing a zero-valued general form character by a units-valued function on all forms.

A proof needs a positive represented integer $m$ coprime to $\delta$. It also needs an associated nonzero integral ideal $\mathfrak b$ with absolute norm $m$ and narrow class $A^{-1}$. These are the exact GN.3 input laws requested here. In the norm-form description, a representation by $\alpha=x-wy\in\mathfrak a$ gives

$$
\mathfrak b=(\alpha)\mathfrak a^{-1},
\qquad N(\mathfrak b)=\frac{N(\alpha)}{N(\mathfrak a)}=m.
$$

Integrality follows from $\alpha\in\mathfrak a$. Positivity of $m$, with the positive absolute ideal norm convention, implies $N(\alpha)>0$. The principal ideal $(\alpha)$ is therefore trivial as a narrow class, and $\mathfrak b$ represents $A^{-1}$. If a negative represented value were used without tracking its sign, the narrow class would acquire a factor $J$. Taking an absolute norm alone does not remove that factor. This is why the input asks for a positive represented value, not just any nonzero represented value.

Now GN.2 computes the form character as the arithmetic character at $m$. The baseline ideal-character evaluation computes $\chi_t(A^{-1})$ by exactly the same arithmetic character. The value of $\chi_t$ lies in $\mathbb Z^\times$, so every value is its own inverse and $\chi_t(A^{-1})=\chi_t(A)$. This proves the comparison. The arithmetic evaluation concerns a nonzero ideal coprime to the modulus; its membership in the existing coprime-ideal submonoid must be established explicitly.

The supplier must also supply independence of the oriented norm-form representative. A proper basis change leaves the form character unchanged, and the ideal-class character is already independent of a coprime integral representative. Those two existing invariance laws make the computed equality descend to the appropriate quotient. The consumer does not create another quotient of forms or a private class-association predicate. In particular, ordinary ideal equivalence is too coarse for the sign-sensitive cases.

The three coefficient changes on the published p.952 are

| Form | Associated narrow class |
| --- | --- |
| $[a,-b,c]$ | $A^{-1}$ |
| $[-a,b,-c]$ | $JA$ |
| $[-a,-b,-c]=-Q$ | $JA^{-1}$ |

These are dictionary inputs from GN.3. The character consequence of the first row is equality with the original character, since its values are self-inverse. The other two rows multiply its value by $\chi_t(J)=\operatorname{sign}(\delta)$. Thus negating a form preserves the character when the factor is positive and changes its sign when the factor is negative. Swapping the last two class labels would preserve some character values but corrupt the oriented class relation; the dictionary must retain the whole table, not only its genus-character shadow.

For $Q=[1,0,-3]$ and $D=12$, the form represents one and has form character one for either singleton factor. Its negative represents three at $(0,1)$. The character for $\delta=-4$ at three is $-1$, agreeing with the ideal character on $J$. This checks the positive-value choice as well as the sign factor. For the principal form $[1,1,-1]$ of discriminant five, the factor choices $1$ and $5$ give the trivial genus character. Neither example requires a reduction algorithm or an independently computed class number.

A separate boundary example is the imprimitive form $[2,0,-6]$, of discriminant $48=(-4)(-12)$. Its content shares two with $\delta=-4$, so the GN.2 character takes value zero. The discriminant is not fundamental, and the form lies outside the comparison theorem. This example rejects a putative definition assigning a unit value to every form and rejects an attempted comparison with a narrow character in an imprimitive case. It is stated as a supplier acceptance case, rather than given a new zero-branch definition here.

The suggested signature is intentionally explicit about the current interface boundary. It takes an actual `QuadraticForm`, a form-character function on that carrier, its represented-value evaluation law, a positive represented natural number and a nonzero ideal with that norm and narrow class $A^{-1}$. These are mathematical data and equations, not a hypothesis of the desired comparison. This witness version reduces the consumer theorem to the existing ideal evaluation. It does not prove that the canonical GN form-character and dictionary declarations exist at the pin. Binding those declarations and discharging the witness arguments is the single recorded gap for RQ.3.

The canonical form character's zero test cannot yet be written against a supplier declaration with a verified name. The suggested file therefore tests the arithmetic discriminant and content of the imprimitive example and explicitly identifies the missing canonical-character test. It does not replace the absent character by an unconstrained proposition or conceal the missing zero branch behind a trivial theorem hypothesis.

This layer has one planet, **Form and ideal characters**. Its planned endpoint is the fundamental-discriminant comparison, with its two supplier interfaces stated exactly. RQ.0 and RQ.2 account for every sign-sensitive character consequence. General content reduction, form-character well-definedness, proper equivalence, oriented form carriers and reduction domains remain with GN.2/GN.3. The layer has planned coverage until those actual interfaces are bound.

## Boundaries, sources and acceptance of the plan

The five items routed from the DIT16 extraction are all accounted for. The distinguished-class order and norm-unit criterion are verified imports; the exact kernel assertion is in RQ.0. The equal genus cardinality is RQ.1. The composite sign and the principal-genus arithmetic criterion are RQ.2, as is the sufficient prime-divisor obstruction to $J=1$. The fundamental form/ideal comparison is RQ.3. The baseline supplies the narrow quotient, the two-rank count, singleton characters and the principal genus theorem, so none receives a duplicate node.

There are no new definition or construction nodes. Consequently there is no new definition API or definition-test list to fill with wrappers. The reused object's essential interfaces are described above: narrow principal classes and the forgetful map, the elementary-two class map and its square criterion, prime-discriminant factors, coprime integral ideal characters and their descended evaluation. Every new theorem has acceptance properties in the packet. The suggested file contains eighteen acceptance examples, including the dyadic signs, the empty factor, the positive fundamental arithmetic cases, the nonfundamental counterexample and the quotient-versus-two-torsion distinction. It also states all nine proposed named theorems.

The consumer directions are clear without adding an analytic theorem to this packet. `AnalyticNumberTheory:AN.4` uses even and odd class characters in Hecke-period interfaces and L-function factorization. The plus-space trace direction of the modular programme uses the same general form character supplied by GN.2. `GeometryOfNumbersAndQuadraticArithmetic:GN.4` uses the exact cardinality when an equidistribution statement averages over a fixed genus. These are uses of the present algebra; gamma factors, spectral normalization, subconvex estimates, Weyl sums and asymptotic error terms remain with their analytic owners. The full prime-discriminant compositum can contain imaginary quadratic subfields even when $K$ is real; no ordinary, all-place-unramified genus field is identified with that compositum here.

The publisher's final PDF was read at the algebraic passages on 5 October 2026. Its URL is [the Annals version of record](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n3-p08-p.pdf), with SHA-256 `a67de7157f76ee700bc2e6a0034a920adc390022d4ff528aa80084f829f35f61`. The [author-hosted copy](https://www.math.ucla.edu/~wdduke/preprints/geometric.pdf), dated 29 July 2016, was checked for the local sign sentence and has SHA-256 `f1f042adf06eafd410b43b819e076c24c9be8f928f0a8a7927f7569ef8b5cfcf`. The packet records exact source locators and the pinned library modules supporting the proofs. This is a reading of the source passages needed for this algebraic route, not a claim to have checked the paper's spectral and analytic proofs.

The packet records source finding `MultiquadraticPartII/E1`: the sign sentence on published p.971 needs the local qualifier $D>0$. The counterexample $D=-4=1\cdot(-4)$ has complementary factor signs one and minus one. In an imaginary quadratic field every nonzero norm is positive, and the distinguished principal class is trivial. The real sign theorem and the explicitly real branches of (7.8) retain their intended statements. The publisher article page, the author's publications page and copy, an arXiv/title search, and the existing extraction's source findings were checked for a correction. None recording this qualifier was located. The finding is a local missing qualifier, not a claim that the real comparison theorem fails.

At target level the plan has nine theorem nodes and nine planets. RQ.0, RQ.1 and RQ.2 have closed planning coverage: their chains end in verified baseline declarations and the theorem nodes above. RQ.3 has planned coverage with two precise cross-roadmap requests and one concrete-interface gap. A complete planning pass sends this packet to independent review; it is not a formalization claim. Every node keeps implementation status unchecked. The next mathematical work is to supply and bind the GN.2/GN.3 declarations, then replace the witness interface with the canonical comparison and its zero-domain regression test while retaining the present ownership boundary.
