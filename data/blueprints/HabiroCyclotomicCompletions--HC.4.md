# HC.4 — Integral Taylor comparison and arithmetic rigidity

This part completes the filtered Taylor comparison assigned to **Arithmetic connectedness and rigidity**, `HabiroCyclotomicCompletions:HC.4`. The objects are the ordinary cyclotomic completion and its collections of Taylor series. The comparison describes exactly which integral collections come from the completion. It also supplies the finite coefficient-extension argument needed by the classical rootwise rigidity theorem.

The classical adjacency, restriction and evaluation results already have declaration plans in the [accepted parent packet](../packets/HabiroCyclotomicCompletions.json) and [parent document](HabiroCyclotomicCompletions.md). Their identifiers remain the suppliers of those results. The new [packet](../packets/HabiroCyclotomicCompletions--HC.4.json) adds the finite matrices, determinant and congruence results of Garoufalidis, Scholze, Wheeler and Zagier (GSWZ), §5.1, and Examples 5.6–5.7. It does not introduce another completion. The [suggested declarations](../suggested/HabiroCyclotomicCompletions--HC.4.lean) propose signatures and examples; all implementation statuses remain unchecked.

The library baseline is Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. Mathlib supplies polynomial quotients, monic remainder bases, cyclotomic polynomials, Hasse derivatives, Sylvester matrices and adjugates. HC.1–HC.3 supply the completion, factorial expansions and Taylor maps. The integral comparison and its image criterion are the new mathematics of this part.

## Scope and suppliers

The original HC.4 targets retain the following ownership. Here and throughout, identifiers without another roadmap prefix belong to `HabiroCyclotomicCompletions`.

| Target | Existing supplier |
| --- | --- |
| Cyclotomic congruences, resultants and comaximality | HC.4/cyclotomic-comaximality-and-resultant |
| Habiro order adjacency, its graph and positive-order connectedness | HC.4/adjacency-of-orders; HC.4/adjacency-is-the-radical-relation |
| Chain restriction injectivity and connected component reduction | HC.4/chain-injectivity-for-monic-completions; HC.4/injectivity-of-restriction |
| Rootwise Taylor rigidity and the domain theorem | HC.4/rootwise-taylor-injectivity; HC.4/the-completion-is-a-domain |
| Infinite adjacent-order evaluation detection | HC.4/evaluation-uniqueness-and-its-exact-hypothesis |
| Evaluation at infinitely many roots, with the specified cyclotomic irreducibility hypotheses | HC.4/evaluation-at-individual-roots |
| Restriction and Taylor nonsurjectivity | HC.4/non-surjectivity; HC.4/taylor-maps-are-not-surjective |

The packet's `inheritedTargets` records the complete parent list, including its intermediate monic-polynomial and primitive-root connectedness declarations. These are imports, not replacement nodes. The new finite-domain separation-transfer lemma resolves the coefficient-extension input singled out by the parent's rootwise argument.

The scope decision concerning Habiro's Theorem 6.2 is definite: this layer keeps the accepted special case in which the needed cyclotomic polynomials remain irreducible over the fraction field of the coefficient ring. It does not add a theorem about arbitrary incomplete sets of conjugate roots over arbitrary subrings of the algebraic numbers. No atlas consumer requires that enlargement. The packet's rescope proposal makes this boundary explicit and adds the GSWZ comparison to the atlas description. The determinant and image theorems below require neither cyclotomic irreducibility over the coefficient ring nor rootwise injectivity.

HabiroNumberFields:HB.6/ring-operations-and-the-classical-comparison consumes this part's ordinary integral comparison. HB.6 owns the Frobenius twists and the number-field Habiro ring. The ordinary comparison here does not supply those twists. HabiroRings:HR.2 owns derived completion; no derived completion is defined in HC.4. HC.5 supplies rational cyclotomic decomposition and decomposition after inverting a prime. HC.3 supplies substitution and re-expansion used by Example 5.7.

## The coefficient rings and indices

Let $R$ be a commutative unital ring. Rank assertions assume $R$ is nontrivial; all maps and vanishing ideals are defined for arbitrary $R$. Put

$$
 P_n(q)=\prod_{i=1}^{n}(1-q^i),\qquad P_0=1,
 \qquad H_R=\varprojlim_n R[q]/(P_n).
$$

This is the HC.1 cyclotomic completion over all positive orders, using its cofinal factorial system. The leading coefficient of $P_n$ is $(-1)^n$; normalized division uses a monic associate where necessary. HC.2 supplies the unique expansion

$$
 h=\sum_{n\geq1} a_n(q)P_{n-1}(q),\qquad
 a_n(q)=\sum_{0\leq k<n}a_{n,k}q^k.
$$

The shift is deliberate: GSWZ's digit $n$ is HC.2's digit $n-1$. A precision $N$ retains digits $1\leq n<N$, not $n\leq N$.

For each positive order $m$, use the **universal cyclotomic coefficient algebra**

$$
 A_m(R)=R[q]/(\Phi_m(q))
       =R\otimes_{\mathbb Z}\mathbb Z[\zeta_m],
 \qquad z_m=[q].
$$

Mathlib's `AdjoinRoot` is exactly this quotient. Monicity of $\Phi_m$ gives its canonical reduced representative and the basis $1,z_m,\ldots,z_m^{\varphi(m)-1}$ over a nontrivial $R$. The notation $R[\zeta_m]$ in the finite coordinate formulas is interpreted in this universal, coefficient-extension sense. An actual embedded compositum can be a proper quotient. For example, over $\mathbb Q(i)$, the universal quotient by $q^2+1$ has rank two, while specialization at $q=i$ has rank one and kills the nonzero class (q-i). Replacing the universal algebra by this chosen component would make the rank and reconstruction assertions false.

Define the untwisted Taylor product

$$
 P_R=\operatorname{TaylorProduct}(R)
    =\prod_{m\geq1} A_m(R)[[u]],\qquad q=z_m(1-u).
$$

For a collection $f=(f_m)$, write

$$
 f_m=\sum_{l\geq1} C_{m,l}u^{l-1},\qquad
 C_{m,l}=\sum_{0\leq j<\varphi(m)}\gamma_{m,l,j}z_m^j.
$$

The index $l$ is **exponent plus one**. Thus the constant coefficient has $l=1$; there is no coordinate with $l=0$. A coefficient map $R\to R'$ maps every $\gamma_{m,l,j}$ by that same map and preserves the universal root. It gives a product ring homomorphism; the identity and composition laws are part of its API. Equality is tested on every component and power-series coefficient.

Finite cyclotomic coefficient extension is an ordinary tensor product, and the finite free quotients below permit ordinary coefficient extension. Neither infinite $H_R$ nor infinite $P_R$ is identified with an uncompleted algebraic tensor product of its integral version. In particular $H_{\mathbb Q}$ is the completion formed **over** $\mathbb Q$. Its nontrivial idempotents contrast with the domain $H_{\mathbb Z}\otimes\mathbb Q$. On the Taylor side a rational power series with coefficients $1/(k+1)$ has no common denominator, so is not in the algebraic tensor product of the integral power-series module with $\mathbb Q$.

## Two filtrations and finite precision

For $N\geq1$, define

$$
 H_{R,N}=\ker\bigl(H_R\to R[q]/P_{N-1}\bigr),
 \qquad
 P_{R,N}=\{f: C_{m,l}=0\text{ whenever }ml<N\}.
$$

Both are ideals. Both decrease with $N$, begin at the whole ring when $N=1$, and have zero intersection. The factorial kernel characterization identifies $H_{R,N}$ with $P_{N-1}H_R$, or with expansions whose first $N-1$ digits vanish. The Taylor kernel characterization is componentwise: $f_m$ is divisible by $u^{\lfloor(N-1)/m\rfloor}$. Indeed the retained exponents $k=l-1$ satisfy $m(k+1)<N$. This is the boundary that distinguishes precision $N$ from $N+1$.

Consequently

$$
 H_R/H_{R,N}\cong R[q]/P_{N-1},\qquad
 P_R/P_{R,N}\cong
 \prod_{1\leq m<N} A_m(R)[u]/u^{\lfloor(N-1)/m\rfloor}.
$$

An exponent zero truncation is the zero algebra and contributes no coordinates. Both finite quotients have free $R$-module rank

$$
 d_N=\frac{N(N-1)}2.
$$

The source basis is $q^kP_{n-1}$, $1\leq n<N$, $0\leq k<n$. The target basis is supported in component $m$ and consists of $z_m^j u^{l-1}$, $ml<N$, $0\leq j<\varphi(m)$. The identity $\sum_{m\mid w}\varphi(m)=w$, supplied by `Nat.sum_totient`, equates the target count with $\sum_{1\leq w<N}w$. The digit and coefficient splittings reconstruct the infinite objects from these finite quotients.

The associated graded pieces are **quotients of $R$-modules**, since the ideals need not have units:

$$
 H_{R,N}/H_{R,N+1}\cong R[q]/(1-q^N),\qquad
 P_{R,N}/P_{R,N+1}\cong\prod_{m\mid N} A_m(R).
$$

The first equivalence sends $[g]$ to $[P_{N-1}g]$. The second extracts coefficient $u^{N/m-1}$ from component $m\mid N$. Both pieces have rank $N$. No unital algebra structure is imposed on these graded equivalences. Their proofs use normalized digits and coefficient extraction, avoiding any integral Chinese remainder assertion.

Tests pin the initial precision and the strict inequality. At precision one both quotients are zero. Precision two is evaluation at $q=1$. Precision three retains exactly $\gamma_{1,1,0},\gamma_{2,1,0},\gamma_{1,2,0}$. A collection supported at $m=2$ with component $u$ is in $P_{\mathbb Z,4}$, but not $P_{\mathbb Z,5}$: its weight is four. The polynomial $P_{N-1}$ belongs to $H_{\mathbb Z,N}$ and not to $H_{\mathbb Z,N+1}$. These distinguish the chosen filtration from a degree filtration or an off-by-one truncation.

## Taylor expansion and its leading factors

HC.3's additive Taylor map at the universal root uses $x=q-z_m$. Define

$$
 \iota:H_R\longrightarrow P_R
$$

by the change $x=-z_mu$ in every component. This is an $R$-algebra map. The change has zero constant term, so it is a legitimate formal substitution without an analytic convergence hypothesis. On a polynomial $g$, its coefficient at exponent $k$ is

$$
 [u^k]\iota(g)_m=(-z_m)^k(D_kg)(z_m),
$$

where $D_k$ is the Hasse derivative, already supplied by Mathlib. The formula uses no factorial division. The unit polynomial maps to the constant-one collection; $q$ maps to $z_m-z_mu$. At $m=1$, odd additive Taylor degrees acquire a minus sign. Coefficient maps commute with this comparison.

For $n\geq0$, the expansion of $P_n$ in component $m$ is divisible by $u^{\lfloor n/m\rfloor}$. Each factor whose index is a multiple of $m$ contributes a factor of $u$, since $z_m^m=1$. This proves

$$
 \iota(H_{R,N})\subseteq P_{R,N}.
$$

Using the principal kernel characterization makes this a direct ring-map argument: the Taylor expansion of $P_{N-1}$ has the required vanishing, and multiplying by any collection preserves that vanishing ideal. The result holds for arbitrary $R$; it asserts a lower bound on order, since the first coefficient can vanish after reduction modulo a prime.

The first surviving coefficient has the integral scalar

$$
 D_{m,l}=\operatorname{leadingFactor}(m,l)
       =m^{2l-1}(l-1)!,\qquad m,l\geq1.
$$

In the universal cyclotomic algebra,

$$
 P_{ml-1}(z_m(1-u))
       \equiv D_{m,l}u^{l-1}\pmod{u^l}.
$$

To prove the formula, first establish
$\prod_{r=1}^{m-1}(1-z_m^r)=m$. The existing domain theorem `IsPrimitiveRoot.prod_one_sub_pow_eq_order` gives the identity in a rational cyclotomic field. The monic-remainder basis embeds the integral universal quotient in its rational coefficient extension, and the rational minimal-polynomial identity embeds that extension in the field. Transfer back by this injection, then apply coefficient extension to every $R$. In $P_{ml-1}$, every nonzero residue modulo $m$ occurs $l$ times. These factors contribute $m^l$. The remaining $l-1$ factors have indices $mj$ and leading terms $mj\,u$, contributing $m^{l-1}(l-1)!u^{l-1}$. Multiplication gives the displayed coefficient.

The scalar is positive as an integer. Its recurrence is
$D_{m,l+1}=m^2lD_{m,l}$. The basic tests are $D_{1,l}=(l-1)!$, $D_{m,1}=m$, and $D_{2,2}=8$. For example $P_3$ at $q=-(1-u)$ starts with $8u$; at $q=1-u$ it starts with $6u^3$.

Under the graded equivalences, the induced map at weight $N$ is

$$
 [g]\longmapsto
 \bigl(D_{m,N/m}g(z_m)\bigr)_{m\mid N}.
$$

Only the constant term of $g(z_m(1-u))$ contributes at the first surviving degree. At $N=2$, this map sends $a+bq$ to $(a+b,2(a-b))$.

## Injectivity and rational reconstruction

Assume now that $R$ is torsion-free over $\mathbb Z$: multiplication by every nonzero integer is injective on its underlying additive group. The simultaneous remainder map

$$
 E_N:R[q]/(q^N-1)\longrightarrow\prod_{m\mid N}A_m(R)
$$

is injective. Its integral matrix in monomial bases becomes invertible over $\mathbb Q$, where distinct cyclotomic factors are coprime and their product is $q^N-1$. Apply the integral adjugate to a kernel vector over $R$. The determinant is a nonzero integer and can be cancelled coordinatewise. This proof works even when $R$ has zero divisors. It does not make the integral factors comaximal: $E_2(a+bq)=(a+b,a-b)$ has integral cokernel of order two.

Multiplication by each $D_{m,N/m}$ is also injective on the free $R$-module $A_m(R)$. Hence the associated graded comparison is injective. If $R$ is a $\mathbb Q$-algebra, both the simultaneous remainder map and the scalar multiplications are isomorphisms.

The filtered comparison descends to an $R$-algebra map

$$
 \iota_N:R[q]/P_{N-1}\longrightarrow P_R/P_{R,N}.
$$

It is compatible with decreasing precision and arbitrary coefficient maps. Induction on $N$, starting with the zero quotients at $N=1$, proves finite injectivity for torsion-free $R$. A kernel element is zero at lower precision, so lies in the last graded piece, where it is killed only if it vanishes. Over a $\mathbb Q$-algebra, the same induction lifts a lower precision preimage and corrects its last graded coefficient, giving bijectivity.

It follows that the joint infinite comparison $\iota$ is injective for every torsion-free $R$. All finite projections of an element in its kernel vanish; the factorial kernels have zero intersection. This is joint Taylor injectivity, and makes no assertion that one component is injective. Over $\mathbb Q$ a single component fails to detect the other components.

If $R$ is a $\mathbb Q$-algebra, $\iota$ is an $R$-algebra isomorphism. The finite inverses commute with precision because each finite preimage is unique. Their compatible family reconstructs an element of $H_R$, and every component coefficient agrees with the prescribed collection. This is the infinite rational reconstruction theorem. Tensoring one fixed finite map with $\mathbb Q$ is valid; rationalizing $H_{\mathbb Z}$ as an uncompleted module does not give this reconstruction theorem.

## The integer matrix and its determinant

Pin the basis order as follows. Source columns ((n,k)) have increasing $n$, then increasing $k$. Target rows ((m,l,j)) have increasing weight (ml), decreasing $m$ within each weight, then increasing $j$. Define $M_N$ by

$$
 (M_N)_{(m,l,j),(n,k)}=
 [z_m^j][u^{l-1}]\left(z_m^k(1-u)^k
                       P_{n-1}(z_m(1-u))\right),
$$

where the inner coefficient is reduced modulo the monic $\Phi_m$ before taking its $j$-th coefficient. This is a square integer matrix of size $d_N$. The finite map over $R$ is represented by casting this matrix to $R$, and

$$
 M_N\operatorname{digitCoordinates}_N(h)
       =\operatorname{jetCoordinates}_N(\iota(h)).
$$

Vanishing orders give zero entries above the weight diagonal: a row with weight below $n$ vanishes on column ((n,k)). This is the block triangular structure used by the determinant argument. The first nontrivial matrix and its signed adjugate are

$$
 M_3=\begin{pmatrix}1&0&0\\1&2&-2\\0&1&1\end{pmatrix},
 \qquad
 M_3^*=\begin{pmatrix}4&0&0\\-1&1&2\\1&-1&2\end{pmatrix}.
$$

The $u$-coefficient of (q(1-q)) at $q=1-u$ is $+1$, fixing the last entry and the multiplicative coordinate sign. The empty $M_1$ has determinant one.

The determinant calculation first identifies the simultaneous remainder determinant. For monic integer polynomials (f,g), the map from the quotient by (fg) to the two separate quotients has absolute determinant $|\operatorname{Res}(f,g)|$. Change its source basis to the low monomials followed by $f,qf,\ldots$. This is a unit triangular change and produces an identity block and multiplication by $f$ modulo $g$. The latter determinant is the resultant up to sign: monic division by $g$ gives the same block in the Sylvester map $(a,b)\mapsto ga+fb$. Mathlib's `Polynomial.toMatrix_sylvesterMap` identifies that coefficient matrix with its Sylvester matrix. This argument includes repeated roots and requires no integral CRT isomorphism.

Successive two-factor comparisons and multiplicativity of the resultant give

$$
 D_2(N)=|\det E_N|
       =\prod_{d<e,\ d,e\mid N}
          |\operatorname{Res}(\Phi_e,\Phi_d)|.
$$

The inherited cyclotomic resultant formula says that a pair $e/d=p^a$, $a\geq1$, contributes $p^{\varphi(d)}$; all other pairs contribute one. In particular
$D_2(1),\ldots,D_2(8)=1,2,3,8,5,72,7,128$.
This integral product formulation avoids any convention for fractional powers in GSWZ's alternative discriminant expression.

The scalar part of the graded determinant is

$$
 D_1(N)=\prod_{m\mid N}D_{m,N/m}^{\varphi(m)}.
$$

Thus the absolute determinant of the weight-$N$ block is $D_1(N)D_2(N)>0$. Applying the block triangular determinant theorem to $M_N$ proves

$$
 \delta_N:=|\det M_N|
       =\prod_{1\leq n<N}D_1(n)D_2(n)>0.
$$

The precision convention makes the upper bound $N-1$. The values at precisions 1, 2, 3, 4, 5, 6 are respectively

$$
 1,\ 1,\ 4,\ 216,\ 1327104,\ 99532800000.
$$

At $N=2$ the graded block determinant is four; at $N=3$ it is 54. The recurrence $\delta_{N+1}=\delta_ND_1(N)D_2(N)$ matches the dimensions. Equation (313) and its table in arXiv v2 use the product through $N$, which instead computes $\delta_{N+1}$ for the precision conventions of (301)–(306). The packet records this as source issue E19 and uses the corrected statement.

## Integral congruences and their local form

Define the integral signed adjugate

$$
 M_N^*=\operatorname{sign}(\det M_N)\operatorname{adj}(M_N).
$$

Mathlib's two adjugate identities give

$$
 M_NM_N^*=M_N^*M_N=\delta_NI.
$$

Over $\mathbb Q$, this is $M_N^*=\delta_NM_N^{-1}$. The sign is part of the definition; it is not inferred from selected small matrices.

For a torsion-free $R$ and a finite jet vector $\gamma$, the finite image criterion is

$$
 \gamma\in M_NR^{d_N}
 \quad\Longleftrightarrow\quad
 (M_N^*\gamma)_i\in\delta_NR\quad\text{for every }i.
$$

Divisibility means membership in the principal ideal of $R$. Necessity follows by multiplying a preimage by $M_N^*$. For sufficiency, choose a vector $b$ such that $M_N^*\gamma=\delta_Nb$. Multiplication by $M_N$ gives $\delta_N\gamma=\delta_NM_Nb$; cancellation of the positive integer $\delta_N$ proves $\gamma=M_Nb$. This is the precise place where torsion-freeness is used.

The global criterion, GSWZ Proposition 5.2 with the corrected indexing, is

$$
 f\in\iota(H_R)
 \quad\Longleftrightarrow\quad
 M_N^*\operatorname{jetCoordinates}_N(f)
       \equiv0\pmod{\delta_N}
 \quad\text{for every }N\geq1.
$$

Finite divisibility produces finite preimages. Finite injectivity makes them unique and compatible under precision reduction. The inverse-limit reconstruction of $H_R$ yields a preimage of $f$. Coefficient separation ensures equality of the entire Taylor collections. Thus the proof needs no infinite choice of mutually unrelated polynomial lifts.

For $R=\mathbb Z[1/\Delta]$, $\Delta\neq0$, one can test this criterion prime by prime. The coefficient map $R\to\mathbb Z_p$ exists when $p\nmid\Delta$, because $\Delta$ is a $p$-adic unit. The scalar lemma says that $a\in dR$, for $d>0$, exactly when its image is in $d\mathbb Z_p$ at every such prime. Write $a=b/\Delta^k$; away from $\Delta$ its valuation is the valuation of $b$. Factoring $d$ into primes proves the equivalence. The zero numerator is treated directly. The p-adic unit and divisibility statements are supplied by the pinned PadicInt API, and integer exponent comparison by `Nat.factorization_le_iff_dvd`.

Apply this scalar result to each entry of $M_N^*\gamma$, at every finite precision. The result is

$$
 f\in\iota(H_{\mathbb Z[1/\Delta]})
 \quad\Longleftrightarrow\quad
 f_p\in\iota(H_{\mathbb Z_p})
 \quad\text{for every prime }p\nmid\Delta.
$$

The maps commute with Taylor coordinates and with the integer matrices. Primes dividing $\Delta$ impose no condition. This is a finite scalar divisibility argument followed by all precisions, not an interchange of tensor products with infinite completion.

At precision three the two nontrivial congruences over $\mathbb Z$ are

$$
 -\gamma_{1,1,0}+\gamma_{2,1,0}+2\gamma_{1,2,0}\equiv0\pmod4,
 \qquad
 \gamma_{1,1,0}-\gamma_{2,1,0}+2\gamma_{1,2,0}\equiv0\pmod4.
$$

The vector ((1,0,0)) fails both. Its signed adjugate image is ((4,-1,1)), a test that excludes the tempting assertion that every integral Taylor collection has an integral preimage.

## Two source examples

The Kontsevich series $F=\sum_{n\geq0}P_n$ exists by HC.2 factorial convergence and has normalized digits all equal to one. At precision five its digit vector is
((1,1,0,1,0,0,1,0,0,0)). The integer matrix gives the ten Taylor coordinates

$$
 \gamma=(1,3,1,5,-1,2,8,-3,11,5).
$$

Equivalently,
$F_1=1+u+2u^2+5u^3$ modulo $u^4$,
$F_2=3+11u$ modulo $u^2$,
$F_3=5-z_3$ modulo $u$, and
$F_4=8-3z_4$ modulo $u$.
Changing only the first coordinate from one to two produces the rational digit vector

$$
 (2,3/4,1/4,65/72,-1/72,17/72,
     275/288,-7/144,1/32,17/72).
$$

Its second coordinate already precludes an integral preimage. Hence no integral Taylor collection with those modified ten jets is in the image, regardless of how its higher coefficients are chosen. This is Example 5.6, equations (334)–(337).

For Example 5.7, let $e_m=1$ at odd $m$ and $e_m=0$ at even $m$, as constant series in the universal coefficient algebras over $\mathbb Q$. Rational reconstruction gives a unique idempotent $e\in H_{\mathbb Q}$. HC.5's decomposition after inverting two lifts it to $H_{\mathbb Z[1/2]}$: it is the characteristic idempotent of the order component with $v_2(m)=0$. Its first four normalized digits are

$$
 1,\quad\frac{-1+q}{4},\quad
 \frac{1-q+q^2}{8},\quad
 \frac{-5+2q+q^2+4q^3}{32}.
$$

Its precision-three Taylor vector is ((1,0,0)), so it has no preimage in $H_{\mathbb Z}$. The second projector $g(q)=e(q^2)-e(q)$ has constant value one exactly when $v_2(m)=1$. HC.3 substitution supplies $q\mapsto q^2$, which changes the odd-order indicator to the indicator of orders with $v_2(m)\leq1$. Its first digits are

$$
 0,\quad\frac{1-q}{4},\quad
 \frac{-1+q-q^2}{8},\quad
 \frac{1-2q+3q^2-4q^3}{32}.
$$

Thus $e_1=1,e_2=0$, and $g_1=0,g_2=1,g_4=0$. These examples test both localization and the distinction between rational completion and uncompleted rational coefficient extension. The numerical denominators are determined by the same finite matrices as the image theorem.

## Separation under finite coefficient extension

Classical rootwise rigidity uses the actual embedded domain $R[\zeta_m]$, not the universal coefficient algebra above. The parent argument requires that prime-adic separation transfer to this finite domain extension. The following two declaration-sized lemmas give that input without a Noetherian assumption.

Let (R,B) be domains with an injective coefficient map $R\to B$, and suppose $B$ is finite as an $R$-module. Then there is an injective $R$-linear map

$$
 B\longrightarrow R^r
$$

for some positive $r$. Choose finite $R$-module generators of $B$. Inside the fraction field of $B$, take their span over the fraction field of $R$. This span is finite dimensional and contains every element of $B$. Choose a basis and write each generator's coordinates in the fraction field of $R$. One nonzero common denominator clears all these finitely many coordinates, using `IsLocalization.exist_integer_multiples`. Multiply the coordinate map by that denominator. The generators, and consequently all their $R$-linear combinations, have coordinates in $R$. Injectivity follows from the field embedding, uniqueness of basis coordinates and multiplication by the nonzero denominator. No assertion that $B$ is free or projective is needed.

For $c\in R$, suppose $\bigcap_{k\geq0}c^kR=0$. If $b\in\bigcap_kc^kB$, every coordinate of its image in $R^r$ lies in every $c^kR$, by $R$-linearity. Hence its image is zero, and injectivity gives $b=0$. Therefore

$$
 \bigcap_kc^kR=0\quad\Longrightarrow\quad\bigcap_kc^kB=0.
$$

An actual embedded $R[\zeta_m]$ is a domain and is generated over $R$ by finitely many powers of $\zeta_m$, since the cyclotomic relation is monic. Taking $c=p$ supplies the inherited Theorem 5.2 argument's prime-separation hypotheses in this extension. The claim concerns each finite extension separately; it does not assert separation of an infinite union of cyclotomic extensions. This closes the parent coefficient-extension boundary while retaining the stated scope of the evaluation-at-roots theorem.

## Declaration catalogue, APIs and acceptance tests

The API catalogue below fixes the public names and all unit tests. It supplements the constructions and proofs above. Every definition or construction has recorded source uses: the finite comparison and image theorem use its coordinates, kernels or matrix; HB.6 consumes the resulting integral lattice comparison and adds its own number-field gluing.

### The untwisted universal Taylor product

Node: `HabiroCyclotomicCompletions:HC.4/universal-taylor-product`. Source: §5.1, p. 59, (298)–(300), with §1.4, p. 7 (naive base changes).

| Public name | Role | Required assertion |
| --- | --- | --- |
| `TaylorProduct` | data | The product of the universal cyclotomic power-series algebras. |
| `taylorCoeff` | projection | C_{m,l}(f)=coefficient(l-1) of f_m. |
| `gamma` | projection | gamma_{m,l,j} is coefficient j of the monic reduced representative of C_{m,l}. |
| `TaylorProduct.ext` | extensionality | Equality of every component coefficient implies equality of collections. |
| `TaylorProduct.map` | functoriality | A ring map R->R′ acts coefficientwise and preserves the universal root. |
| `TaylorProduct.map_gamma` | characterisation | The map induced by phi sends gamma_{m,l,j}(f) to phi(gamma_{m,l,j}(f)). |
| `TaylorProduct.map_id` | simp | The identity coefficient map induces the identity on TaylorProduct. |
| `TaylorProduct.map_comp` | functoriality | Coefficient maps compose in the same order as ring maps. |

Unit tests:

- **taylorCoeff_zero** (degenerate): All positive-index coefficients of the zero collection are zero.
- **gamma_one** (computation): For the constant-one collection, gamma_{m,1,0}=1 and every other allowed coordinate is zero.
- **universal_split_nonexample** (non-example): A_4(Q(i))=Q(i)[q]/(q^2+1) has rank 2 over Q(i); evaluation q->i kills the nonzero class q-i. A single embedded copy of Q(i) is the wrong coefficient algebra.

### The factorial kernel filtration

Node: `HabiroCyclotomicCompletions:HC.4/factorial-kernel-filtration`. Source: §5.1, p. 60, (301)–(303).

| Public name | Role | Required assertion |
| --- | --- | --- |
| `hFiltration` | data | The kernel ideal at precision N, N>=1. |
| `mem_hFiltration_iff` | characterisation | Membership iff projection modulo P_{N-1} is zero. |
| `hFiltration_eq_principal` | characterisation | hFiltration R N=P_{N-1}H_R. |
| `hFiltration_antitone` | structure | hFiltration R (N+1)<=hFiltration R N. |
| `hFiltration_inter` | characterisation | The intersection for N>=1 is zero. |
| `hFiltration_quotient_equiv` | equivalence | H_R/hFiltration R N is R-algebra isomorphic to R[q]/(P_{N-1}). |

Unit tests:

- **hFiltration_one** (degenerate): hFiltration R 1 is the whole ring and its quotient is zero.
- **hFiltration_two** (compatibility): hFiltration R 2 is the kernel of evaluation at q=1, since P_1=1-q.
- **hFiltration_digit_boundary** (non-example): The element P_{N-1} lies in hFiltration Z N but not in hFiltration Z (N+1).

### The weighted Taylor filtration

Node: `HabiroCyclotomicCompletions:HC.4/weighted-taylor-filtration`. Source: §5.1, p. 60, (304)–(305).

| Public name | Role | Required assertion |
| --- | --- | --- |
| `pFiltration` | data | The weighted coefficient-vanishing ideal. |
| `mem_pFiltration_iff` | characterisation | f lies in pFiltration R N iff every coefficient with weight m*l<N vanishes. |
| `pFiltration_antitone` | structure | pFiltration R (N+1)<=pFiltration R N. |
| `pFiltration_inter` | characterisation | The intersection for N>=1 is zero. |
| `jetCoordinates` | projection | The finite vector of gamma coordinates with m*l<N, in the ordering fixed by taylorMatrix. |
| `jetCoordinates_kernel` | characterisation | jetCoordinates N f=0 iff f belongs to pFiltration R N. |

Unit tests:

- **pFiltration_one** (degenerate): pFiltration R 1 is the whole product.
- **pFiltration_three** (computation): pFiltration R 3 forces f_1 to have zero coefficients 0 and 1 and f_2 to have zero coefficient 0; orders >=3 are unrestricted.
- **pFiltration_shift_nonexample** (non-example): A collection supported at order 2 with f_2=u lies in pFiltration Z 4 but not pFiltration Z 5. The coefficient has weight 4, not 2.

### The multiplicative Taylor comparison

Node: `HabiroCyclotomicCompletions:HC.4/multiplicative-taylor-comparison`. Source: §5.1, p. 59, (298).

| Public name | Role | Required assertion |
| --- | --- | --- |
| `iota` | constructor | The R-algebra Taylor collection map. |
| `iota_fromPoly` | simp | iota(g)_m=g(z_m(1-u)). |
| `coeff_iota_fromPoly` | simp | coeff_k iota(g)_m=(-z_m)^k D_k g(z_m). |
| `iota_map` | functoriality | iota commutes with arbitrary coefficient ring maps. |

Unit tests:

- **iota_one** (degenerate): iota(1) is the constant-one collection.
- **iota_q** (computation): iota(q)_m=z_m-z_m*u; its coefficients at u^0,u^1,u^2 are z_m,-z_m,0.
- **iota_additive_coordinate** (compatibility): The coefficient at exponent k is (-z_m)^k times the HC.3 additive Taylor coefficient at exponent k; for m=1 this changes the sign in odd degrees.

### The integral leading factor

Node: `HabiroCyclotomicCompletions:HC.4/leading-factor`. Source: §5.1, p. 61, (310).

| Public name | Role | Required assertion |
| --- | --- | --- |
| `leadingFactor` | data | m^(2*l-1)*(l-1)! as a natural number. |
| `leadingFactor_pos` | characterisation | 0<leadingFactor m l for m,l>0. |
| `leadingFactor_succ` | relation | D_{m,l+1}=m^2*l*D_{m,l} for m,l>0. |

Unit tests:

- **leadingFactor_order_one** (computation): D_{1,4}=6.
- **leadingFactor_ell_one** (degenerate): D_{m,1}=m for every positive m.
- **leadingFactor_two_two** (non-example): D_{2,2}=8, not 2 or 4.

### The finite Taylor comparison map

Node: `HabiroCyclotomicCompletions:HC.4/finite-taylor-map`. Source: §5.1, pp. 60–61, (306).

| Public name | Role | Required assertion |
| --- | --- | --- |
| `finiteIota` | constructor | The finite R-algebra map at precision N. |
| `finiteIota_polynomial` | simp | On a polynomial class it is the class of its Taylor collection. |
| `finiteIota_transition` | compatibility | Forgetting precision commutes with finiteIota. |
| `finiteIota_baseChange` | functoriality | Finite coefficient extension carries finiteIota R N to finiteIota R′ N. |

Unit tests:

- **finiteIota_one** (degenerate): At precision 1 both source and target are zero.
- **finiteIota_two** (computation): At precision 2 the map is evaluation at 1 and is the identity R->R.
- **finiteIota_three_nonsurjective** (non-example): At precision 3 over Z the vector (1,0,0) in coordinates (gamma_1,1,0,gamma_2,1,0,gamma_1,2,0) is not in the image.

### The integral finite Taylor matrix

Node: `HabiroCyclotomicCompletions:HC.4/taylor-matrix`. Source: §5.1, pp. 61–62, before (312) and (312).

| Public name | Role | Required assertion |
| --- | --- | --- |
| `taylorMatrix` | constructor | The integer matrix defined by finite Taylor coefficients. |
| `taylorMatrix_entry` | characterisation | The coefficient-extraction and monic-remainder formula stated above. |
| `taylorMatrix_mul_digits` | characterisation | M_N times the first N-1 normalized digit coordinate blocks equals jetCoordinates N of iota. |
| `taylorMatrix_baseChange` | compatibility | The finite Taylor map over R is represented by the cast of this same integer matrix. |
| `taylorMatrix_zero_above_weight` | simp | An entry is zero if the row weight is smaller than the column n. |

Unit tests:

- **taylorMatrix_empty** (degenerate): M_1 is the empty 0 by 0 matrix, with determinant 1.
- **taylorMatrix_three** (computation): M_3 has rows (1,0,0), (1,2,-2), (0,1,1).
- **taylorMatrix_five_kontsevich** (computation): M_5 times (1,1,0,1,0,0,1,0,0,0) equals (1,3,1,5,-1,2,8,-3,11,5).
- **taylorMatrix_sign_nonexample** (non-example): At precision 3 the coefficient of u in q*(1-q) expanded at 1-u is 1, giving the last entry 1 rather than -1.

### The signed adjugate congruence matrix

Node: `HabiroCyclotomicCompletions:HC.4/signed-adjugate`. Source: §5.1, p. 63, Proposition 5.2, (319).

| Public name | Role | Required assertion |
| --- | --- | --- |
| `starMatrix` | constructor | The signed integral adjugate of M_N. |
| `taylorMatrix_mul_starMatrix` | relation | M_N*starMatrix N=delta_N I. |
| `starMatrix_mul_taylorMatrix` | relation | starMatrix N*M_N=delta_N I. |
| `starMatrix_over_rat` | compatibility | After casting to Q, starMatrix N=delta_N*M_N inverse. |

Unit tests:

- **starMatrix_empty** (degenerate): The empty signed-adjugate identities hold at N=1 with delta_1=1.
- **starMatrix_three** (computation): starMatrix 3 has rows (4,0,0),(-1,1,2),(1,-1,2).
- **starMatrix_three_nonexample** (non-example): starMatrix 3 applied to (1,0,0) equals (4,-1,1), which is not divisible by 4 coordinatewise.

### Proof declarations and dependency order

All new identifiers below have prefix `HabiroCyclotomicCompletions:HC.4/`.
The definitions and constructions above anchor the graph. Its proof declarations
refine the arguments into independently usable results, with exact hypotheses
specified in the corresponding mathematical sections.

| Identifier | Declaration | Source passage |
| --- | --- | --- |
| `factorial-kernel-characterisation` | Factorial projection kernels and separation | §5.1, pp. 60–61, (301)–(303) |
| `weighted-jet-kernel` | Weighted jet kernels and separation | §5.1, p. 60, (304)–(305) |
| `factorial-graded-piece` | The factorial graded piece | §5.1, p. 61, (308) |
| `taylor-graded-piece` | The Taylor graded piece | §5.1, p. 61, (308)–(309) |
| `finite-precision-bases` | Finite precision bases and ranks | §5.1, pp. 59–61, (297), (300), (303), (305)–(306) |
| `factorial-vanishing-order` | Vanishing orders of factorial products | §5.1, p. 60, before (304) |
| `root-product-identity` | The primitive-root product identity | §5.1, p. 61, calculation following (310) |
| `factorial-leading-coefficient` | Leading Taylor coefficient of a factorial product | §5.1, p. 61, (310) |
| `graded-taylor-map` | The graded Taylor map | §5.1, p. 61, (311) |
| `simultaneous-cyclotomic-remainders` | Simultaneous cyclotomic remainders are injective | §5.1, p. 61, after (311) |
| `graded-taylor-injective` | Injectivity on associated graded pieces | §5.1, p. 61, after (311) |
| `finite-taylor-injective` | Finite Taylor injectivity and rational equivalence | §5.1, p. 61, after (306) |
| `global-taylor-injective` | Joint Taylor injectivity | §5.1, p. 61, (307) |
| `rational-taylor-isomorphism` | Taylor reconstruction over a rational coefficient algebra | §5.1, p. 61, (307) |
| `finite-taylor-coordinate-matrix` | Taylor coefficients represent the finite comparison | §5.1, pp. 61–62, before (312) and (312) |
| `two-factor-remainder-determinant` | Determinant of a two-factor remainder map | §5.1, p. 62, Proposition 5.1, (315) |
| `cyclotomic-remainder-determinant` | Determinant of simultaneous cyclotomic remainders | §5.1, p. 62, Proposition 5.1, (315) |
| `graded-taylor-determinant` | Determinant of a graded Taylor block | §5.1, p. 62, (314)–(315) |
| `finite-taylor-determinant` | The finite Taylor determinant formula | §5.1, p. 62, Proposition 5.1, (313) (corrected indexing) |
| `signed-adjugate-identities` | Signed adjugate identities | §5.1, p. 63, after (319) |
| `finite-integral-image-criterion` | The finite integral image criterion | §5.1, p. 63, (317)–(319) |
| `global-integral-image-criterion` | Integral Taylor image congruences | §5.1, p. 63, Proposition 5.2, (319) |
| `localized-scalar-divisibility` | Scalar divisibility in an integer localization | §5.1, p. 63, local condition (318) used in Proposition 5.2; §5.2, p. 65, (332) |
| `local-integrality-detection` | Detection of the integral image prime by prime | §5.1, p. 63, (318)–(319); §5.2, p. 65, (332) |
| `kontsevich-matrix-example` | The Kontsevich series and a failed perturbation | §5.3, p. 66, Example 5.6, (334)–(337) |
| `odd-order-idempotent-example` | The odd-order idempotent after inverting two | §5.3, p. 66, Example 5.7, (338)–(341) |
| `finite-domain-module-embedding` | A finite domain extension embeds in a finite free module | Habiro, proof of Theorem 5.2, p. 1138 (coefficient-extension reduction) |
| `finite-domain-separation-transfer` | Adic separation transfers to a finite domain extension | Habiro, proof of Theorem 5.2, p. 1138 (coefficient-extension reduction) |

The kernel lemmas use the imported finite completion quotients and normalized
expansions. The graded equivalences use those kernels and the monic cyclotomic
basis. Factorial vanishing, the universal primitive-root product identity and the
leading-factor formula determine the graded map. Simultaneous remainder
injectivity and integer cancellation prove graded and finite injectivity; the
inverse-limit reconstructions then prove joint injectivity and rational
reconstruction. This chain is independent of the determinant formula.

The determinant chain starts with the matrix representation, the two-factor
Sylvester comparison, the inherited cyclotomic resultant formula and the graded
map. Block triangular determinants produce the corrected finite determinant.
Signed adjugates produce the finite divisibility criterion, and compatible
finite preimages produce the global criterion. The localized scalar divisibility
lemma is the entire additional arithmetic input to the local version. The two
examples then exercise these results and the already owned HC.3–HC.5
substitution and prime-inversion APIs.

The finite-domain embedding and separation-transfer lemmas form a separate
branch for the inherited classical rootwise theorem. They use finite module
generators, a basis of a finite fraction-field span and simultaneous denominator
clearing. They do not use the universal Taylor-product reconstruction to infer
injectivity at a single embedded root.

## Atlas structure and acceptance

This part proposes six planets: **Integral Taylor comparison**, **Cyclotomic
leading factor**, **Joint Taylor injectivity**, **Finite Taylor matrix**,
**Finite Taylor determinant**, and **Integral Taylor image criterion**.
The parent has five classical-rigidity planets. The packet therefore proposes
splitting the assembled HC.4 display into **Classical arithmetic rigidity**
(HC.4a) and **Integral Taylor comparison** (HC.4b). HC.4a holds the fifteen
imported declarations and the two finite-domain transfer lemmas, with the five
parent planets. HC.4b holds the thirty-four new comparison declarations, with
these six planets. Current declaration and scope identifiers remain HC.4; the
maintainer applies the proposed atlas split and redirects the HB.6 consumer.
The proposed split respects the limit of six planets per displayed layer.

Acceptance requires all eight definition/construction APIs and all twenty-five
unit tests above; in particular, the split-coefficient test, the strict weight
boundary, and the precision-three failed image test must be retained. It also
requires finite ranks 0, 3 and 10 at precisions 1, 3 and 5, the graded map
formula and corrected determinant recurrence, reconstruction over a rational
coefficient algebra, the finite and global congruence criteria with
Z-torsion-freeness, and transfer of scalar-adic separation through every finite
injective extension of domains. The Kontsevich vector, its failed perturbation,
and both projector digit lists are arithmetic acceptance examples. The inherited
rigidity targets retain exactly their parent hypotheses.

## Sources and corrected conventions

The primary comparison source is [Garoufalidis, Scholze, Wheeler and Zagier,
*The Habiro ring of a number field*, arXiv:2412.04241v2](https://arxiv.org/abs/2412.04241v2),
27 August 2025. The relevant passages are §1.3–1.4, printed pp. 4–8, for the
coefficient and gluing conventions; §5.1, pp. 59–64, equations (296)–(323), in
full; and Examples 5.6–5.7, pp. 65–66, equations (334)–(341). §5.2, pp. 64–65,
is used to identify the HB.6 consumer, not to re-plan its twisted ring.

The classical source is [Habiro, *Cyclotomic Completions of Polynomial Rings*,
Publ. RIMS 40 (2004), 1127–1146](https://ems.press/journals/prims/articles/2364).
The finite extension argument elaborates the coefficient reduction in the
proof of Theorem 5.2, pp. 1138–1139. The boundary for Theorem 6.2 is its proof on
pp. 1140–1141. §7.5, pp. 1145–1146, explains the rational component decomposition.
All other classical targets use the reviewed parent's source locators.

The packet records five source issues, E19–E23, against the specified arXiv v2
preprint. E19 corrects the upper bound in Proposition 5.1 from N to N−1 for its
own definition of M_N. E20 restricts the infinite algebraic tensor-product
claims before (312) to finite precision or completed coefficient extension.
E21 replaces the denominator of (317) by the filtration ideal P_(R,N), since
P_R^N already denotes the quotient. E22 shifts the coefficient index in (323)
from gamma_(1,k,0) to gamma_(1,k+1,0). E23 records the coefficient-ring,
filtration-direction and digit-basis typographical corrections: coefficients
are in the R-coefficient cyclotomic algebra, the ideal sequences decrease, and
the digit indices satisfy 0≤k<n. The node statements consistently use these
corrected conventions. No assertion about a corrected published version is
made; the records identify the preprint and the public versions searched.

The pinned baseline records contain the exact modules and statements read for
all thirty-two library declarations. In particular the root-product node
extends `IsPrimitiveRoot.prod_one_sub_pow_eq_order`, whose existing domain
hypothesis does not cover universal quotients over arbitrary rings; it uses
`Polynomial.cyclotomic_eq_minpoly_rat` and `minpoly.dvd_iff` to pass through the
rational cyclotomic field. The integral matrix comparison uses the existing
monic quotient basis and Sylvester-map matrix theorem, rather than assuming an
unprovided integral Chinese remainder isomorphism. The packet has no missing
source, gap or cross-roadmap request in its chosen scope.
