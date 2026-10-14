# GC.5 — All-degree character sheaves

This layer extends a rank-one local system on the square-root curve to a
character sheaf on every integer-degree component of the root Picard stack.
Effective divisors away from the branch locus move a component into the range
where Abel–Jacobi descent is available. Tensoring by the inverse fibre line
removes that auxiliary choice. The comparison maps, their cocycle, and the
unit and multiplication normalizations are part of the result.

This document refines the [accepted parent plan](FunctionFieldArithmeticPartII.md)
and imports its thirteen GC.5 nodes by their existing ids. It adds the native
index of admissible choices, the signed divisor-line interface, uniqueness
relative to all normalization maps, coherent signed translation, and the
multiplication comparison on the whole section space. The
[packet](../packets/FunctionFieldArithmeticPartII--GC.5.json) is **complete** as
a planning pass; GC.5 is **planned**. The exact supplier leaves below prevent
claiming that the stage is closed or implemented.

The motivating source is Yun–Zhang, *Shtukas and the Taylor expansion of
L-functions (II)*, Annals of Mathematics 189 (2019), especially Lemmas A.8–A.10
and Proposition A.11, printed pp. 520–523. The full-section-space consumer is
§6.2.1, p. 497. These targets are stated in our own words; API consequences are
identified as consequences rather than attributed as numbered source results.

## Conventions and imported objects

Let $k$ be a finite field of odd characteristic, $X/k$ a smooth projective
geometrically connected curve of genus $g$, and $R\subset X$ a reduced
finite closed subscheme. Put $U=X\setminus R$, $\rho=\deg R$, and

$$
 B=\rho+\max(2g-1,1).
$$

The empty ramification locus is allowed. Fix a prime $\ell\ne\operatorname{char}k$
and coefficients $\overline{\mathbf Q}_\ell$. The input $L$ is an arbitrary
rank-one lisse local system on $X_1^{\sqrt R}$, with its $k$-descent.
Its inertia at $R$ has order dividing two. Its global monodromy can have
order three or infinite image. The sheaves in this document are unshifted
rank-one local systems: $L_n[n]$, rather than $L_n$, is the perverse
normalization.

Write $\mathcal P^d=\operatorname{Pic}_X^{\sqrt R,d}$. Over a test scheme
$T/k$, an object is a degree-$d$ line bundle $M$ on $X_T$, a line bundle
$K_R$ on $R_T$, and an isomorphism $K_R^{\otimes2}\simeq M|_{R_T}$.
Morphisms preserve this isomorphism. These are the actual Picard-stack
objects of `FunctionFieldArithmeticPartII:GC.0/root-picard`; this layer does
not introduce another stack. Tensor product gives
$m_{d,e}:\mathcal P^d\times\mathcal P^e\to\mathcal P^{d+e}$.
The unit $e$ has both line bundles trivial and their standard comparison.
No chosen $k$-rational point of $X$ is part of the data. Ordinary
$\operatorname{Pic}^d$ is used as a torsor where appropriate, without
identifying it with a pointed Jacobian.

For $n\ge0$, the parent supplies the effective root-divisor space
$X_n^{\sqrt R}$, the whole section space $\widehat X_n^{\sqrt R}$, and
maps $AJ_n$ and $\widehat{AJ}_n$ forgetting section data. A whole-space
object also has a global section $a$ of $M$ and a root section
$\alpha_R$ of $K_R$, with $i(\alpha_R^2)=a|_{R_T}$. The effective open
and its symmetric local system $L_n$ are those of GC.1 and GC.3; this layer
does not redefine what effective means in a family.

The parent `GC.4/high-degree-descent` supplies a lisse sheaf $H_n$ on
$\mathcal P^n$, with $AJ_n^*H_n\simeq L_n$, for $n\ge B$, uniquely
with this comparison. Its effective descent and full-faithfulness theorem
are prerequisite results with a recorded gap. Connected geometric fibres
alone are insufficient to assert that an arbitrary sheaf descends.

A divisor $D\in\operatorname{Div}(U)$ means a finite integer combination
of closed points of $U$. Its degree is
$\sum_x n_x[\kappa(x):k]$, not $\sum_x n_x$.
The canonical rational section of $\mathcal O_X(D)$ is nonvanishing at
$R$; its restriction determines the trivial root there. Denote that
root-Picard $k$-point by $\delta_D$ and its translation by

$$
 t_D:\mathcal P^d\longrightarrow\mathcal P^{d+\deg D},\qquad
 M\longmapsto M\otimes\delta_D.
$$

This exists for signed divisors. Addition of a divisor on an effective
symmetric space, denoted $T_D$, is used only when $D\ge0$. Tensoring with
a Frobenius line means tensoring with its inverse image from
$\operatorname{Spec}k$. An arithmetic line need not be Frobenius-trivial.
All comparisons below are Frobenius-equivariant maps of sheaves, not just
equalities of functions on rational points.

## Native auxiliary choices

**New target:** `FunctionFieldArithmeticPartII:GC.5/auxiliary-index`.
Proposed name: `TauCeti.RamifiedClassField.auxiliaryDivisors`.

For fields $k,F$, a $k$-algebra structure on $F$, a set $S$ of native
places, and integers $d,B$, define the subset of `TauCeti.Divisor k F`

$$
 \mathcal A(S,d,B)=\{D:0\le D,\ D(P)=0\ (P\in S),\ B\le d+\deg D\}.
$$

This is a light definition over the existing coefficientwise divisor order
and `TauCeti.Divisor.degree`. The arithmetic definition does not require
that $F/k$ be a function field; its nonemptiness theorem does. For the
geometric application, take $F=k(X)$ and $S=S_R$, under the
closed-point/place dictionary. The comparison must identify this subset
with effective divisors supported on $U$ satisfying the same bound.
AlgebraicCurves Layer 12A/12D owns the dictionary and degree comparison.

The parent `GC.5/auxiliary-divisors` already proves existence and common
enlargement on the geometric side. The native API uses the pinned
`TauCeti.Divisor.exists_le_degree_add_nsmul_ofPoint`, with starting divisor
zero and lower bound $B-d$. Given a place $P\notin S$, it supplies some
$n\ge0$ with $n[P]\in\mathcal A(S,d,B)$. The geometric proof chooses any
closed point in the nonempty open $U$. Its residue degree can exceed one.
We need unbounded degrees of multiples, not an effective divisor of every
specified degree.

For members $D,E$, their sum is again a member and is an upper bound for
both in the coefficientwise order. Indeed each degree is nonnegative, and
$\deg(D+E)=\deg D+\deg E$. Thus the index is nonempty and directed when
an away place exists. This is the arithmetic interface to common-choice
comparisons, rather than a new growth theorem.

Every API name in this table has prefix
`TauCeti.RamifiedClassField.auxiliaryDivisors.`.

| Name | Contract |
| --- | --- |
| `mem_iff` | Membership is exactly effectivity, zero coefficients on $S$, and the weak degree bound. |
| `effective` | A member has $0\le D$. |
| `away` | For $P\in S$, a member has $D(P)=0$. |
| `degree_bound` | A member satisfies $B\le d+\deg D$. |
| `mono_bound` | Membership for $B$ implies membership for $B'\le B$. |
| `add_mem` | Two members have a member sum with $D\le D+E$ and $E\le D+E$. |
| `nonempty_of_away_place` | Given `IsFunctionField k F` and $P\notin S$, the set is nonempty. |
| `zero_mem_iff` | Zero is a member exactly when $B\le d$. |

**Checks**, with the same prefix:

| Test | Instance and error detected |
| --- | --- |
| `test_zero` | Zero is admissible iff $B\le d$, including equality; rejects a strict bound or a nonempty-support requirement. |
| `test_degree_two` | For $P\notin S$, $\deg P=2$, membership of $[P]$ is equivalent to $B\le d+2$; rejects unweighted degree. |
| `test_negative` | $-[P]$ is never admissible, whatever the bound; rejects a degree-only definition. |
| `test_ramified` | If $P\in S$, $[P]$ is never admissible even above the bound; rejects missing support control. |
| `test_negative_degree` | For an away degree-two $P$, with $d=-5,B=3$, $4[P]$ is admissible and $3[P]$ is not; rejects an implicit rational-point requirement. |

Source: Appendix A.2.2, pp. 521–522, and Lemma A.10, p. 522, for the effective
choice condition; the native definition and API are a refinement using the
pinned divisor carrier. The growth statement, order, and degree operations
are baseline imports, not new roadmap nodes.

## Divisor lines, including negative coefficients

The imported `GC.5/divisor-tensor-line` assigns to effective $D$ a line
$\Lambda_D$. For a closed point $x$ of degree $r$, the coefficient-one
line uses the tensor of **all $r$ geometric conjugate stalks**, with its
cyclic Frobenius permutation and local action. It is the value of
$L_{\deg D}$ at the canonical effective root divisor $\delta_D$.
This is an arithmetic descent datum; selecting one geometric lift of $x$
is not an equivalent definition.

**New target:** `GC.5/signed-divisor-line`, proposed name
`TauCeti.RamifiedClassField.signedDivisorTensorLine`.
For arbitrary $D=\sum n_x[x]$ away from $R$, use the same factors with
integer tensor powers. Negative powers are actual dual lines. Equivalently,
for $D=A-C$, with $A,C\ge0$ supported on $U$, put

$$
 \Lambda_D=\Lambda_A\otimes\Lambda_C^\vee.
$$

If $A-C=A'-C'$, then $A+C'=A'+C$. Apply the effective sum comparison
to this equality and cancel the dual factors. Associativity and symmetry of
the effective comparisons show that these identifications obey a cocycle
and are independent of a further common refinement. This gives a symmetric
monoidal functor from the discrete divisor group to one-dimensional
$\overline{\mathbf Q}_\ell$ representations of
$\operatorname{Gal}(\bar k/k)$. It is a construction of this layer over
lisse suppliers; the general tensor and dual theory is imported.

Every new API name has prefix
`TauCeti.RamifiedClassField.signedDivisorTensorLine.`.

| Name | Contract |
| --- | --- |
| `zero` | $\Lambda_0\simeq\overline{\mathbf Q}_\ell$ with trivial Frobenius. |
| `effective` | For effective $D$, agreement with the parent's line, its Frobenius action and sum comparison. |
| `sum` | $\Lambda_{D+E}\simeq\Lambda_D\otimes\Lambda_E$, satisfying associativity, symmetry and both unit diagrams. |
| `neg` | $\Lambda_{-D}\simeq\Lambda_D^\vee$; the sum with $D$ is identified with evaluation. |
| `decomposition` | The identification for $D=A-C$ is independent of the effective presentation, with its comparison cocycle. |
| `closedPoint` | For every integer $n$, $\Lambda_{n[x]}$ is the $n$th tensor power of all conjugate stalks; negative powers dualize the Frobenius action. |

**Checks**, with the same prefix:

| Test | Instance and error detected |
| --- | --- |
| `test_empty` | The zero signed divisor is the trivial Frobenius line. |
| `test_degree_two_negative` | $\Lambda_{-[x]}=$L_{x_1}\otimes L_{x_2}$^\vee$ for a degree-two point, with the dual cyclic action; rejects a single selected stalk or undualized action. |
| `test_cancellation` | $[x]-[x]$ and zero give the same canonical unit, with the sum/neg map equal to evaluation; rejects independent scalar normalizations. |
| `test_order_three` | For a rational away point and an unramified rank-one input with Frobenius eigenvalue $\lambda$ of order three, $\Lambda_{-[x]}$ has eigenvalue $\lambda^{-1}\ne\lambda$; rejects the global quadratic restriction. |

Source: A.2.2, end of p. 521 and p. 522 before (A.7), uses integral divisors
and their tensor lines. Lemma A.8, pp. 520–521, supplies effective
multiplication; decomposition independence is the explicit API consequence
of its coherent comparisons and rank-one duality.

## Normalize presentations and compare choices

The following targets are **imported**, with the full prefix
`FunctionFieldArithmeticPartII:GC.5/`:

| Node suffix | Precise imported target |
| --- | --- |
| `auxiliary-divisors` | For every integer $d$, an effective $D$ on $U$ reaches $d+\deg D\ge B$; two choices have the common effective enlargement $D+E$. |
| `translate-high-degree` | For effective $D$ and both $d,d+\deg D\ge B$, $t_D^*H_{d+\deg D}\simeq H_d\otimes\Lambda_D$. |
| `all-degree-extension` | For every $d\in\mathbf Z$, normalize a translated high-degree sheaf by $\Lambda_D^\vee$; the resulting $P_d$ is independent of choices through the specified comparisons. |
| `choice-comparison` | Presentations from admissible $D,E$ are canonically identified through $D+E$. |
| `choice-cocycle` | $c_{EF}\circ c_{DE}=c_{DF}$, and comparisons are unchanged by further common effective enlargement. |

Here and below $P_d$ denotes the **sheaf** on $\mathcal P^d$, while
$\mathcal P^d$ denotes its base stack. For every admissible $D$, write

$$
 Q_D=t_D^*H_{d+\deg D}\otimes\Lambda_D^\vee.
$$

A useful orientation convention is
$c_{DE}:Q_D\xrightarrow{\sim}Q_E$. The high-degree translation comparison,
after pulling back along $t_D$, gives
$\beta_{D,E}:Q_{D+E}\xrightarrow{\sim}Q_D$. The signed-line sum API is
used here only for its effective specialization. Then
$c_{DE}=\beta_{E,D}\circ\beta_{D,E}^{-1}$, using symmetry to identify the
two presentations for $D+E$. Pulling to the common presentation indexed
by $D+E+F$ makes the cocycle an equality of the two associative tensor
multiplication maps. Enlarging this divisor preserves that equality.
No arbitrary scalar is inserted when comparing choices.

The high-degree translation map is checked on the effective root space by
restricting $\alpha_{d,\deg D}$ at the point $D$, using
$AJ_{d+\deg D}\circ T_D=t_D\circ AJ_d$, then using the specified
full-faithfulness theorem. Source: A.2.2, pp. 521–522, and (A.7), p. 522.

**New target:** `GC.5/normalized-character-universal-property`, proposed name
`TauCeti.RamifiedClassField.picardCharacter.normalizedUniversalProperty`.
Let $q_D:Q_D\xrightarrow{\sim}P_d$ be the canonical maps, oriented so that
$q_E\circ c_{DE}=q_D$. For any actual lisse sheaf $M$ on
$\mathcal P^d$, precomposition gives a bijection

$$
 \operatorname{Hom}(P_d,M)\ \simeq
 \{(f_D:Q_D\to M)_D\mid f_E\circ c_{DE}=f_D\text{ for all }D,E\}.
$$

To prove surjectivity, select one admissible $D_0$ and use
$f=f_{D_0}\circ q_{D_0}^{-1}$. Compatibility proves that it has every
prescribed restriction and is independent of $D_0$. Since $q_{D_0}$ is
an isomorphism, it also proves injectivity. In particular, a sheaf equipped
with compatible isomorphisms from all $Q_D$ has a unique isomorphism from
$P_d$ respecting all those maps. Uniqueness concerns the normalized
object and its maps; it does not say that the bare sheaf has no scalar
automorphisms. This is a derived universal-property API for the construction
in A.2.2, not a new sheaf descent theorem or a new source theorem.

**Checks:** independently rescaling a single normalization map fails family
compatibility unless the scalar is one. For $d\ge B$, the zero divisor
is admissible and identifies $P_d$ with $H_d$. For $d=-1$, a
sufficiently large multiple of any away closed point is an admissible proof
witness; its degree need not be one.

## Pullback, unit and all-degree multiplication

These targets are imported with the same full GC.5 prefix:

| Node suffix | Precise imported target |
| --- | --- |
| `effective-pullback` | For every $d\ge0$, $AJ_d^*P_d\simeq L_d$, with the canonical normalization. |
| `unit-trivialization` | $e^*P_0\simeq\overline{\mathbf Q}_\ell$ canonically. |
| `high-degree-multiplication` | For $d,e\ge B$, $m_{d,e}^*H_{d+e}\simeq H_d\boxtimes H_e$, checked along $AJ_d\times AJ_e$. |
| `all-degree-multiplication` | For all $d,e\in\mathbf Z$, $\mu_{d,e}:m_{d,e}^*P_{d+e}\simeq P_d\boxtimes P_e$, independent of effective choices. |
| `character-associativity` | For all integers $d,e,f$, the two triple-product composites of $\mu$ agree with the specified associators. |
| `character-symmetry-unit` | Exchanging the factors commutes with $\mu$, and both restrictions at the Picard unit are identity unit maps after the canonical trivialization. |

For the effective pullback, choose **effective** $D$ away from $R$
with $d+\deg D\ge B$. Pull $Q_D$ along $AJ_d$, use its square with
$T_D$, and apply (A.7). The tensor $\Lambda_D\otimes\Lambda_D^\vee$
cancels. This is Lemma A.10, p. 522. In degree zero the effective empty
divisor gives the canonical unit line and its trivialization.

For high-degree multiplication, use the product $AJ_d\times AJ_e$.
The multiplication comparison on its domain is precisely Lemma A.8's
$\alpha_{d,e}$, through the addition/Abel–Jacobi square. For arbitrary
signed degrees $d,e$, choose effective $A,C$ reaching high degree on
each factor. Their sum is admissible for $d+e$, since
$d+e+\deg A+\deg C\ge2B\ge B$. The translation square relates
$t_A\times t_C$ to $t_{A+C}$. Transport the high-degree multiplication
through it and cancel $\Lambda_{A+C}$ with
$\Lambda_A\otimes\Lambda_C$. Comparison cocycles show independence of
both choices. This is the route in Proposition A.11, pp. 522–523.

For associativity take three effective choices and compare both diagrams in
the common high-degree presentation. The GC.3 associative comparison makes
them equal there; the normalization maps transport that equality back.
Exchanging two choices proves symmetry in the same way. With one factor the
Picard unit, effective degree-zero pullback and evaluation give both unit
identities. The source asks the reader to verify these compatibilities;
they are explicit acceptance requirements here, not assumed because the
individual sheaves are rank one.

**Checks:** $d=-1,e=1$ is covered by exactly the same multiplication
formula. For $d=e=f=-1$, both triple-product maps coincide after the same
common effective normalization. Restricting $\mu_{0,d}$ at the unit on
the first factor and $\mu_{d,0}$ at the second gives identities, including
negative $d$. These checks reject a result restricted to nonnegative
degrees or with unspecified scalar coherence.

## Signed translation as a coherent character operation

**New target:** `GC.5/signed-character-translation`, proposed name
`TauCeti.RamifiedClassField.picardCharacter.signedTranslation`.
For all $d\in\mathbf Z$ and $D\in\operatorname{Div}(U)$, require

$$
 \theta_{d,D}:t_D^*P_{d+\deg D}\xrightarrow{\sim}
 P_d\otimes\Lambda_D.
$$

For effective $A$, the effective pullback identifies
$\delta_A^*P_{\deg A}$ with $\Lambda_A$. Restrict multiplication and
its unit identity at $\delta_C,\delta_{-C}$ to identify the value at the
inverse point with the dual line. For $D=A-C$, it follows that
$\delta_D^*P_{\deg D}\simeq\Lambda_A\otimes\Lambda_C^\vee$.
The signed-line decomposition API proves independence of $A,C$.
Restrict $\mu_{d,\deg D}$ along $(\operatorname{id},\delta_D)$ to
obtain $\theta_{d,D}$.

Specify the composition law, rather than just existence of each map.
Under $t_E\circ t_D=t_{D+E}$, the map $\theta_{d,D+E}$ is the composite
of $t_D^*\theta_{d+\deg D,E}$, then
$\theta_{d,D}\otimes\operatorname{id}_{\Lambda_E}$, followed by the sum
identification of $\Lambda_D\otimes\Lambda_E$ with $\Lambda_{D+E}$.
Parent associativity, restricted to two divisor points, proves this law.
Parent symmetry-unit gives $\theta_{d,0}=\operatorname{id}$ and says the
$D,-D$ composite is the identity after evaluation. For effective $D$
this agrees with the parent's `picardCharacter.translation`, checked in a
common high-degree normalization and then by its universal property.

Source: the signed translation reduction in A.2.2, pp. 521–522, together
with Proposition A.11's character structure, pp. 522–523. The composition
and inverse laws are explicit consequences of the character structure.

**Checks:** if $d=-1$ and $x$ is an away degree-two point,
$t_{-[x]}^*P_{-3}\simeq P_{-1}\otimes\Lambda_{[x]}^\vee$. Translating
first by $D$, then by $-D$, recovers the identity map, not a scalar
multiple. At an away rational point with order-three eigenvalue, negative
translation uses its inverse. No signed divisor is added to an effective
symmetric power in these checks.

## Whole-space character pullback and addition

The imported target `GC.5/hat-character-pullback` sets
$\widehat L_d=\widehat{AJ}_d^*P_d$ on the whole section moduli problem
where it is defined, with $L_d$ on the effective open when $d\ge0$.
Every geometric zero-global-section stalk is the line at its underlying
root-Picard point, hence has rank one. This is the pullback used in
§6.2.1, p. 497; in that consumer the input happens to come from a ramified
double cover, while the Appendix A construction has arbitrary rank-one
input.

**New target:** `GC.5/hat-addition-pullback`, proposed name
`TauCeti.RamifiedClassField.hatCharacter.addition`.
For $d,e\ge0$, use the GC.1 whole-space addition, tensoring $M,K_R$
and multiplying both sections. Its forgetful square is

$$
 \widehat{AJ}_{d+e}\circ\widehat{\operatorname{add}}_{d,e}
 =m_{d,e}\circ(\widehat{AJ}_d\times\widehat{AJ}_e).
$$

Pull back $\mu_{d,e}$ through this square and apply inverse image's
external-tensor comparison to obtain

$$
 \widehat{\operatorname{add}}_{d,e}^{\,*}\widehat L_{d+e}
 \simeq\widehat L_d\boxtimes\widehat L_e.
$$

Pulling the parent's triple-product, exchange and unit diagrams through
the corresponding section-space squares proves associativity, symmetry
and unit. On effective opens this is exactly $\alpha_{d,e}$, via the
canonical effective pullback and normalization comparison. Sources:
A.1.4–A.1.5, p. 517, Lemma A.8, pp. 520–521, and Proposition A.11,
pp. 522–523. This target uses only the source-defined nonnegative-degree
section spaces and their actual maps; the signed translation theorem lives
on Picard stacks.

**Checks:** at a pair $(M,a=0),(N,b)$, the output global section is zero
but the stalk map is an isomorphism between the character line at
$M\otimes N$ and the tensor of the two character lines, all rank one.
The same holds when both sections vanish. Restriction to the effective
product agrees with $\alpha_{d,e}$, including $d=e=0$. The effective
empty divisor has global section 1 and is the unit; the degree-zero zero
section is a distinct section object. Extension by zero from the effective
open fails these whole-space checks and is not the required object.

## Imported construction APIs and tests

The effective divisor line, all-degree character and hat pullback remain
owned by their parent nodes, with all APIs and tests imported, not silently
replaced by the refinements. Every name below has prefix
`TauCeti.RamifiedClassField.`. Along with the statement inventory above,
this is the contract an assembly must retain.

| Parent node / declaration | API and tests |
| --- | --- |
| `GC.5/divisor-tensor-line` / `divisorTensorLine` | `zero`: coefficient line; `sum`: coherent tensor of effective lines; `closedPoint`: cyclic Frobenius descent. Tests `test_empty`: coefficient line; `test_rational`: $L_x$ at a rational away point; `test_degree_two`: both conjugate fibres with Frobenius descent. |
| `GC.5/all-degree-extension` / `picardCharacter` | `component`: $Q_D$ on degree $d$; `comparison`: identification via a common enlargement; `translation`: $t_D^*P_{d+\deg D}\simeq P_d\otimes\Lambda_D$ for every $d$ and effective $D$. Tests `test_negative_degree`: degree $-1$ without a degree-one point; `test_common_sum`: unchanged by further enlargement; `test_high_degree`: agreement with $H_d$ for $d\ge B$. |
| `GC.5/hat-character-pullback` / `hatCharacter` | `definition`: whole-map inverse image; `effective`: $L_d$ on the effective open; `zeroSection`: the character line at the underlying Picard object. Tests `test_effective`: unshifted symmetric local system; `test_zero`: zero-section stalk has rank one; `test_degree_zero`: canonical coefficient line at the effective empty divisor. |

The new signed line preserves the effective line's API and tests. The new
translation adds signed inputs and coherence to the parent's effective
translation; it does not change the existing constructor. Whole-space
addition preserves the parent's whole-map pullback definition.

## Dependencies and ownership

Direct internal suppliers are GC.0 root Picard, GC.1 section spaces,
addition and Abel–Jacobi, GC.3 symmetric local systems and coherent
multiplication, and GC.4 effective high-degree descent. The packet gives
fine node ids for each use and a complete inventory of the thirteen parent
GC.5 targets. It creates no cycles: signed translation uses the already
constructed character, and hat addition uses its already proved multiplication.

The reviewed FA.0/FA.1 audit distinguishes the built function-field divisor
and degree theory from the missing geometric dictionary. Eight pinned
Tau Ceti declarations are imported: `Divisor`, `Divisor.degree`,
`degree_zero`, `degree_add`, `degree_nonneg`, `degree_ofPoint`,
`exists_le_degree_add_nsmul_ofPoint`, and
`AlgebraicGeometry.WeilDivisor.ofPoint`. Their statements were read at
Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`; Mathlib is pinned at
`082e2d37e8b0463410cdb532e111cd43d5a66174`. None is replanned.

Current upstream was checked at TauCetiRoadmap
`0d144d044dacebca17b654695b6f1ad58f159b27`, rather than relying on the atlas
snapshot. AlgebraicCurves Layer 12A/12D owns the closed-point/place and
weighted-degree dictionary. JacobianChallenge A/C/D owns ordinary divisor
line bundles, family symmetric powers and Picard geometry. The SF.3
`picard-stack-curve`, `picard-scheme-without-point` and
`universal-section-stack` targets extend that ordinary geometry; their
packet is a supplier plan, not an accepted implementation. This part's
`GC5-CURVE-COMPARISON` request to `SchemeAndStackFoundations:SF.3` asks for
integration of those objects with the parent root objects and the native
auxiliary index. It does not build a second divisor or Picard theory.

AlgebraicVectorBundles' coherent `Scheme.Modules` tensor, dual and
pullback targets remain owned there. They are not the actual
$\overline{\mathbf Q}_\ell$-lisse category. Searching the current Tau Ceti
library at `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039` did not locate actual
root-Picard lisse carriers. Existing invertible-sheaf and class-group APIs
are not mistaken for a character-sheaf implementation.

There are three exact gap leaves:

1. **`GC5-DESCENT`**, inherited from parent `ST-LISSE`: actual effective
   nonproper Abel–Jacobi descent and full faithfulness on these tame DM
   stacks, using their locally trivial affine fibre charts. It lies behind
   `GC.4/high-degree-descent`, hence the normalization and character targets.
   A provisional, unregistered stacks proposal is not an existing dependency.
2. **`GC5-LISSE-OPS`**, the needed subset of parent `ST-OPS/ST-LISSE`:
   rank-one lisse tensor, dual evaluation, inverse image, external tensor,
   Frobenius descent and their coherence on the actual stacks. No derived
   nonrepresentable pushforward theorem is inferred merely from these operations.
3. **`GC5-LEAN-CARRIERS`**: the actual geometric stack and sheaf types for
   the end statements and checks. The reader specifies them exactly; the
   compact Suggested file records their omission by declaration family.
   Arbitrary carrier parameters or predicate placeholders would not discharge
   this leaf.

The native [Suggested file](../suggested/FunctionFieldArithmeticPartII--GC.5.lean)
elaborates with only admission warnings. It contains a real-bodied light
auxiliary-index definition, eight API statements and five examples.
The geometric declarations and the imported parent contracts are README
targets until their actual carriers exist, following WORKERS.md's fixed
2026-10-12 shape. Compilation of this fragment does not prove or typecheck
those geometric targets. The three gaps and the SF.3 request are the precise
remaining work; there is no implementation claim.

## Source qualifications and acceptance

The published author-hosted PDF was read on 2026-10-14: A.1–A.2.3,
printed pp. 514–523, and §6.2.1, pp. 496–497. Printed page images 522–523
were checked against the extracted formulas. SHA-256 and URL are in the
packet. No unavailable book is needed for this pass.

Four already confirmed parent source findings affect these conventions:

- Lemma A.8's proof, p. 520, constrains the global character to signs in its
  notation; the corrected argument allows arbitrary rank-one monodromy,
  with only the branch inertia of order dividing two.
- Proposition A.11's proof, p. 523, names a single sum-degree Abel–Jacobi
  map in a two-factor comparison. The correct checking map is
  $AJ_d\times AJ_e$.
- Lemma A.10's proof, p. 522, omits the explicit effectivity condition on
  its chosen auxiliary divisor. Use an effective away divisor above the
  bound; unbounded multiples suffice.
- Proposition A.11, p. 523, drops the Picard decoration in three translated
  expressions. All these operations act on $P_{d+e+\deg A+\deg C}$
  on the Picard stack, not on the symmetric-space sheaf.

These findings are inherited from the accepted independent parent review,
and their selected published passages were rechecked. Historical errata
searches remain attributed to that parent; no new exhaustive absence of a
published correction is asserted. `sourceIssues` uses paraphrases rather
than source excerpts. The source's coherence exercises are expanded into
the explicit common-enlargement and pullback proof routes above.

Acceptance of the layer requires all normalization cocycles, effective
pullbacks, the unit and all-integer multiplication diagrams, the signed-line
checks, coherent signed translation, and the whole-space zero-section
checks. The five old parent planets plus the signed divisor tensor-line
refinement give six planets for GC.5 in total; the native index and derived
API theorems need no additional planets. The packet checker validates the
new plan's ids and dependency closure; mathematical discharge still includes
its named supplier leaves and independent review.
