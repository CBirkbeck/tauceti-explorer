# GC.3 — Symmetric local systems

This layer starts from a rank-one $\overline{\mathbf Q}_\ell$-local system $L$ on
the root curve $X_1^{\sqrt R}$ and produces, for every $d\ge0$, a rank-one local
system $L_d$ on the root symmetric power $X_d^{\sqrt R}$. It computes the
cohomology of $L_d$ as the $d$-th exterior power of $H^1$, and makes $L_d$
multiplicative under addition of root divisors. These are Lemmas A.6–A.8 of
Yun–Zhang, *Shtukas and the Taylor expansion of L-functions (II)*, Annals of
Mathematics 189 (2019), Appendix A.2.1, printed pp. 519–520, in the corrected
form recorded below.

This document refines the [accepted parent plan](FunctionFieldArithmeticPartII.md)
and imports its twelve GC.3 nodes by their existing ids. The parent left four
items open: the inertia description of local systems on the root curve and
full faithfulness on Deligne–Mumford stacks; sheaf operations on stacks
(pushforward along the non-representable ordered map, intermediate extension,
duality and curve bounds); the comparison of graded antisymmetrization with the
exterior power; and the Lean signatures. This layer answers them as follows.

- The comparison with the exterior power is planned completely and stated in
  Lean at the pinned libraries, on top of Tau Ceti's permutation action on tensor
  powers.
- $L_d$ is constructed from its monodromy on the locus of distinct points and
  extended by purity. This is the description YZ19 itself uses to prove
  multiplicativity, and it needs no pushforward on stacks.
- The cohomology of $L_d$ is computed on the coarse space $\operatorname{Sym}^dX$,
  where Künneth, Poincaré duality and the bounds for curves are scheme
  statements with accepted suppliers.
- What remains of the stack theory is three precise statements, recorded as
  gaps for the proposed stacks Part II of EtaleDualityAndPerverseSheaves.

The [packet](../packets/FunctionFieldArithmeticPartII--GC.3.json) is
**complete** as a planning pass; GC.3 is **planned**, not closed. All targets
are stated in our own words; consequences that YZ19 does not state are labelled
as such.

## Conventions and imported objects

Let $k$ be a finite field of characteristic $p\ne2$, $X/k$ a smooth projective
geometrically connected curve of genus $g$, and $R\subset X$ a reduced finite
closed subscheme, possibly empty, with $\rho=\deg R$. Put $U=X\setminus R$ and
$j:U\to X$. Fix a prime $\ell\ne p$ and coefficients
$\overline{\mathbf Q}_\ell$. Geometric Frobenius is used throughout. All sheaves
called local systems are lisse and unshifted; $L_d[d]$, not $L_d$, is the perverse
normalization (source issue EGC3-3).

The parent supplies the following, which this layer does not redefine:

- the root curve $X_1^{\sqrt R}$, a smooth Deligne–Mumford curve with coarse
  space $X$ and stabilizer $\mu_2$ over $R$ (`RS.1/affine-chart`,
  `RS.1/regular-dm`, `RS.1/closed-fibre`);
- the root symmetric powers $X_d^{\sqrt R}$, smooth Deligne–Mumford stacks of
  dimension $d$ (`GC.1/root-symmetric-space`, `GC.1/root-symmetric-smooth`),
  with coarse map $\omega_d:X_d^{\sqrt R}\to X_d=\operatorname{Sym}^dX$ that is an
  isomorphism over $\operatorname{Sym}^dU$ (`GC.1/root-symmetric-coarse`);
- the ordered map $p_d:(X_1^{\sqrt R})^d\to X_d^{\sqrt R}$ and the addition maps
  (`GC.1/ordered-divisors`, `GC.1/ordered-proper`, `GC.1/root-addition`).

Write $q_d:X^d\to X_d$ for the finite quotient map, $U_d^\circ\subset X_d$ for
the open subscheme of multiplicity-free divisors supported in $U$, and
$(U^d)^\circ=q_d^{-1}(U_d^\circ)$ for the ordered tuples of distinct points of
$U$. Then $(U^d)^\circ\to U_d^\circ$ is a finite étale Galois cover with group
$S_d$, and $U_d^\circ$ is open in $X_d^{\sqrt R}$.

The input $L$ is an arbitrary rank-one local system on $X_1^{\sqrt R}$ over
$k$. Its inertia at the points of $R$ has order dividing two; its global
monodromy is unrestricted (source issue EGC3-4). An unramified character of
order three is the standing test case.

## Graded symmetric invariants of a degree-one space

The cohomology of a product is a graded tensor product, and exchanging two
classes of odd degree costs a sign. On the $d$-th tensor power of a space
concentrated in degree one, the symmetric group therefore acts by the sign
twist of the ordinary permutation action. Tau Ceti already has the ordinary
action, `PiTensorProduct.reindexRepresentation`, and its invariants (the span
of the pure powers when $d!$ is invertible). The three targets of this section
add the sign and the comparison with the exterior power. They are generic
algebra; the packet records that they move to a generic owner if one is
designated.

**New target:** `GC.3/koszul-sign-action`, proposed name
`TauCeti.RamifiedClassField.koszulPermAction`. For a commutative ring $K$, a
$K$-module $V$ and $d\ge0$, let $\sigma\in S_d$ act on $V^{\otimes d}$ by

$$
 \sigma\cdot(v_1\otimes\cdots\otimes v_d)=\operatorname{sgn}(\sigma)\,
 v_{\sigma^{-1}(1)}\otimes\cdots\otimes v_{\sigma^{-1}(d)} .
$$

This is a representation, natural in $V$; it is the action on the degree-$d$
part of the graded tensor power of a module placed in degree one. On degree-zero
factors the same permutation acts without sign.

| Name | Role | Contract |
| --- | --- | --- |
| `koszulPermAction` | data | $\sigma\mapsto\operatorname{sgn}(\sigma)P_\sigma$ on $V^{\otimes d}$. |
| `koszulPermAction.apply_tprod` | simp | The formula above on pure tensors. |
| `koszulPermAction.one`, `.mul` | structure | The identity acts trivially; $\sigma\tau$ acts as the composite. |
| `koszulRepresentation` | constructor | The representation $S_d\to\operatorname{End}_K(V^{\otimes d})$. |
| `koszulPermAction.eq_sign_smul_reindexRepresentation` | compatibility | The action is $\operatorname{sgn}(\sigma)$ times Tau Ceti's unsigned `reindexRepresentation`. |
| `koszulPermAction.swap_tprod` | relation | For $d=2$ the transposition sends $v\otimes w$ to $-w\otimes v$. |
| `koszulPermAction.naturality` | functoriality | $f^{\otimes d}$ commutes with the action for every $K$-linear $f$; a $K$-linear Frobenius is a case. |

| Test | Kind | Instance and error detected |
| --- | --- | --- |
| `koszulRepresentation.test_degree_zero` | degenerate | For $d=0$ every element of $V^{\otimes0}\simeq K$ is invariant. |
| `koszulRepresentation.test_degree_one` | degenerate | For $d=1$ every element of $V$ is invariant. |
| `koszulRepresentation.test_line_square` | computation | With $2$ invertible the invariants on $K^{\otimes2}$ are zero; the unsigned action would keep the whole line. |
| `koszulRepresentation.test_pure_square` | non-example | $x\otimes x$ is fixed by the unsigned action, but by the Koszul-signed action only when $x\otimes x=0$; forgetting the sign gives symmetric tensors. |
| `koszulRepresentation.test_char_two` | non-example | Over $\mathbf Z/2$ the sign is trivial, so $(\mathbf Z/2)^{\otimes2}$ is invariant although $\wedge^2(\mathbf Z/2)=0$. |

Inputs: Tau Ceti `PiTensorProduct.reindexRepresentation` and
`commute_reindexRepresentation_map`; Mathlib `PiTensorProduct.reindex`,
`map_reindex`, `TensorPower`, `Equiv.Perm.sign`. Source: YZ19, proof of
Lemma A.6, p. 519, which names the Koszul sign convention.

**New target:** `GC.3/antisymmetrization`, proposed name
`TauCeti.RamifiedClassField.antisymmetrization`. The antisymmetrization
$\alpha_d:\wedge^dV\to V^{\otimes d}$ is

$$
 \alpha_d(v_1\wedge\cdots\wedge v_d)=\sum_{\sigma\in S_d}\operatorname{sgn}(\sigma)\,
 v_{\sigma(1)}\otimes\cdots\otimes v_{\sigma(d)},
$$

obtained from Mathlib's `MultilinearMap.alternatization` of the tensor map and
the universal property `exteriorPower.alternatingMapLinearEquiv`. The exterior
projection $\pi_d:V^{\otimes d}\to\wedge^dV$ sends a pure tensor to the wedge of its
factors. Then $\pi_d\circ\alpha_d=d!\cdot\mathrm{id}$ (Mathlib
`AlternatingMap.coe_alternatization`), $\alpha_d$ is natural, and its values are
invariant under the Koszul-signed action: substituting $\sigma\tau^{-1}$ in the sum
absorbs the sign of $\tau$. No invertibility is needed for the construction.

| Name | Role | Contract |
| --- | --- | --- |
| `antisymmetrization` | constructor | $\alpha_d:\wedge^dV\to V^{\otimes d}$. |
| `exteriorProjection` | data | $\pi_d:V^{\otimes d}\to\wedge^dV$. |
| `antisymmetrization.apply_ιMulti` | simp | The signed-sum formula on $v_1\wedge\cdots\wedge v_d$. |
| `antisymmetrization.exteriorProjection_comp` | relation | $\pi_d\circ\alpha_d=d!\cdot\mathrm{id}$. |
| `antisymmetrization.mem_invariants` | characterisation | Every value of $\alpha_d$ is Koszul-invariant. |
| `antisymmetrization.naturality` | functoriality | $\alpha_d\circ\wedge^df=f^{\otimes d}\circ\alpha_d$. |

| Test | Kind | Instance and error detected |
| --- | --- | --- |
| `antisymmetrization.test_degree_two` | computation | $\alpha_2(v\wedge w)=v\otimes w-w\otimes v$. |
| `antisymmetrization.test_degree_zero` | degenerate | $\alpha_0$ is the identification $\wedge^0V\simeq K\simeq V^{\otimes0}$. |
| `antisymmetrization.test_projection_factor` | characterisation | $\pi_3\circ\alpha_3=6\cdot\mathrm{id}$; a version normalized by $1/d!$ would give the identity and is undefined over $\mathbf Z$. |
| `antisymmetrization.test_char_two` | non-example | Over $\mathbf Z/2$ with $V=\mathbf Z/2$, $\alpha_2=0$ while the Koszul-signed invariants of $V^{\otimes2}$ are nonzero. |

Source: Conrad, *Exterior powers*, §4, display (4.1), p. 12, and p. 13, where the
same map embeds $\wedge^k$ as the skew-symmetric tensors and the return to
$\wedge^k$ is multiplication by $k!$.

**New target:** `GC.3/alternating-invariants-exterior` (theorem; Lean
`antisymmetrization.bijective`). If $d!$ is a unit in $K$, then $\alpha_d$ is an
isomorphism from $\wedge^dV$ onto the Koszul-signed invariants
$(V^{\otimes d})^{S_d}$, with inverse $(d!)^{-1}\pi_d$. Indeed $\alpha_d\circ\pi_d$
is the sum of the Koszul-signed permutations, which is $d!$ on invariants. The
isomorphism is natural, hence Frobenius-equivariant; for $V$ free of rank $n$ the
invariants are free of rank $\binom nd$ (Mathlib `exteriorPower.finrank_eq`), zero
for $d>n$. As the parent notes, over $\overline{\mathbf Q}_\ell$ every $d!$ is
invertible, including when the prime $\ell$ divides $d!$; only integral or
torsion coefficients would need more care, and GC.3 does not use them. Checks: for $\dim V=1$ and $d=2$
the invariants vanish while the symmetric invariants would not; over
$\mathbf Z/2$ the statement fails, so the hypothesis cannot be dropped. This
discharges the parent gap EXTERIOR-COMP and is the input of the parent lemma
`GC.3/koszul-exterior`.

## Rational averaging, finite groups and the tensor character

**New target:** `GC.3/averaging-exactness` (lemma). Let $G$ be finite with
$|G|$ a unit in $K$, and $e=|G|^{-1}\sum_{g}g$. On a representation $V$, $e$ is
an idempotent with image $V^G$ (Mathlib `GroupAlgebra.average`,
`Representation.isProj_averageMap`; Tau Ceti `Representation.range_norm_eq_invariants`),
so invariants are exact: an equivariant surjection is onto on invariants (Lean
`invariants_map_surjective`). In a $K$-linear category in which idempotents
split, for example an abelian category of constructible
$\overline{\mathbf Q}_\ell$-sheaves (Mathlib
`isIdempotentComplete_iff_idempotents_have_kernels`), the invariants $A^G$ are the
image of $e_A$, and every $K$-linear additive functor satisfies
$F(A^G)\simeq F(A)^G$ because $F(e_A)=e_{F(A)}$. Hence
$H^i(Y,A^G)=H^i(Y,A)^G$ and finite pushforward commutes with invariants. Checks:
for $S_2$ swapping the coordinates of $K^2$ the projector is
$(x,y)\mapsto\bigl(\tfrac{x+y}2,\tfrac{x+y}2\bigr)$; over $\mathbf Z/2$ the
augmentation $(\mathbf Z/2)[\mathbf Z/2]\to\mathbf Z/2$ is onto but misses the
invariant $1$. Sources: Etingof et al., proof of Theorem 3.8, p. 37;
Abramovich–Vistoli, proof of Lemma 2.3.3, p. 5; Stacks §12.4 (09SF).

**New target:** `GC.3/finite-group-rational-acyclicity` (lemma; Lean
`groupCohomology_isZero_of_invertible`). If $|G|$ acts bijectively on a
$G$-module $M$, for example any $\overline{\mathbf Q}_\ell$-representation of a
finite group, then $H^r(G,M)=0$ for $r>0$ and $H^0(G,M)=M^G$. Corestriction
after restriction to the trivial subgroup is multiplication by $|G|$ and factors
through $H^r(1,M)=0$ (Milne, *Class Field Theory* v4.03, II.1.30–1.31, p. 70; the
same statement is `corestriction_comp_res` in ProfiniteCohomology Layer 10). Checks:
$\mu_2$ acting on $\overline{\mathbf Q}_\ell$ by the sign has no cohomology at all;
$\mathbf Z/2$ acting trivially on $\mathbf F_2$ has $H^r=\mathbf F_2$ for every $r$.
This is the rational finite-groupoid vanishing of the parent's collision and
middle-extension arguments, and of the coarse pushforward below.

**New target:** `GC.3/tensor-character-kernel` (lemma; Lean
`prod_character_eq_comp_prod`, `prod_character_eq_one_of_prod_eq_one`,
`prod_character_perm`). For a commutative group $A$ (here $\mu_2(\bar k)$), a
character $\chi$ and $m\ge1$, the character $(a_i)\mapsto\prod\chi(a_i)$ of $A^m$
equals $\chi\circ\mu_m$, where $\mu_m$ is multiplication. It is trivial on
$N_m=\ker\mu_m$ and invariant under permutations of the factors. So the
pushforward along $B(A^m)\to B(A)$ of the line $\chi^{\boxtimes m}$ is the line
$\chi$ in degree zero, by the previous lemma. At $n\cdot x$ with $x\in R$ the stalk
of the symmetric local system is therefore a line on which the stabilizer $\mu_2$
acts by the inertia character of $L$ at $x$, not by its $n$-th power. If two
factors carried different characters, $(-1,-1)\in N_2$ would act by $-1$. Source:
YZ19, proof of Lemma A.7, pp. 519–520. This is the algebraic content of the
parent lemma `GC.3/collision-kernel`.

## Local systems on the root curve

**New target:** `GC.3/root-curve-character-dictionary` (theorem). Let
$\mathcal X=X_1^{\sqrt R}$ and $\bar u$ a geometric point of $U$. Restriction to
$U$ is fully faithful from local systems on $\mathcal X$ to local systems on $U$.
Its essential image consists of the local systems whose monodromy on the inertia
group $I_{\bar x}\subset\pi_1(U,\bar u)$ of every geometric point $\bar x$ above
$R$ has order dividing two. In rank one these are the continuous characters
$\chi:\pi_1(U,\bar u)\to\overline{\mathbf Q}_\ell^\times$ of the arithmetic
fundamental group with $\chi(\tau)^2=1$ on every $I_{\bar x}$. They are tame,
since wild inertia is pro-$p$ with $p$ odd, and their global monodromy is
unrestricted. At a point over $x\in R$ the stabilizer $\mu_2$ acts on the stalk
by $\chi|_{I_{\bar x}}$; the local system descends to $X$ exactly when all these
inertia characters are trivial.

Proof route:

1. $U$ is a dense open substack of the connected normal curve $\mathcal X$, so
   $\pi_1(U)\to\pi_1(\mathcal X)$ is onto (`IG.5/finite-cover-image-lemmas`) and
   restriction is fully faithful.
2. Near $x\in R$ with local equation $s$, $\mathcal X$ is
   $[\operatorname{Spec}A[t]/(t^2-s)/\mu_2]$ (`RS.1/affine-chart`; upstream
   SchemeAndStackFoundations §1.21 `rootStack.affineChart`). A local system on
   $U$ extends over the chart exactly when its pullback to the double cover
   $t^2=s$ extends. The tame inertia of that cover at $t=0$ is the subgroup of
   squares (`IG.1/tame-and-prime-to-p`, `IG.1/decomposition-inertia`), so the
   pullback is unramified in codimension one exactly when the inertia
   character has order dividing two (Abhyankar's lemma, Stacks 0EYG).
3. Covers unramified in codimension one extend over the regular chart (Stacks
   0H2W), equivariantly by uniqueness, and descend along the atlas (gap
   GC3-STACK-PI1).
4. Noohi's Theorem 7.11 (π₁ of the stack modulo the stabilizers is π₁ of the
   coarse space) gives the descent criterion.

Checks: for $R=\varnothing$ this is the ordinary dictionary on $X$. For
$X=\mathbf P^1$, $R=\{0,\infty\}$, over $\bar k$ the root curve is
$[\mathbf P^1/\mu_2]$ for the squaring map, and the admissible geometric
characters are the trivial and the quadratic Kummer character. Inertia of order
four is excluded; an unramified $\chi$ with $\chi(\mathrm{Frob})=\zeta_3$ is
admitted. Source: YZ19, §A.2, first paragraph, p. 519, which states the
dictionary without proof. This target answers the parent requests PI1 and
TAME-INERTIA by accepted node ids and refines `GC.3/tame-local-systems`.

## The symmetric local system from its monodromy

**New target:** `GC.3/monodromy-symmetric-local-system`, proposed name
`TauCeti.RamifiedClassField.monodromySymmetricLocalSystem`.

1. On $(U^d)^\circ$ take $L^{\boxtimes d}=\operatorname{pr}_1^*L\otimes\cdots\otimes\operatorname{pr}_d^*L$
   with the $S_d$-linearization that permutes tensor factors **without sign**.
   It descends along the $S_d$-cover to a rank-one local system $L_d^\circ$ on
   $U_d^\circ$. Over $\bar k$ its monodromy is YZ19 (A.6),
   $\pi_1(U_d^\circ)\to\pi_1(U)^d\rtimes S_d\to\overline{\mathbf Q}_\ell^\times$,
   $(g_1,\dots,g_d;\sigma)\mapsto\prod\chi(g_i)$.
2. $L_d^\circ$ extends to a rank-one local system $\mathbb L_d$ on
   $X_d^{\sqrt R}$, uniquely up to unique isomorphism compatible with the
   identification on $U_d^\circ$.

The boundary of $U_d^\circ$ in $X_d^{\sqrt R}$ consists of the collision divisor
$\Delta$, the divisors $D_x$ ($x\in R$) of root divisors through $x$, and a set of
codimension at least two. Along $\Delta$ the local cover is the quotient by one
transposition, which exchanges two equal lines $L_y\otimes L_y$ and so acts
trivially: $L_d^\circ$ is unramified there. Along $D_x$ the stack is étale-locally
$X_1^{\sqrt R}$ near $x$ times $U_{d-1}^\circ$, and $L_d^\circ$ is
$L\boxtimes L_{d-1}^\circ$, which extends because $L$ is a local system on
$X_1^{\sqrt R}$. On a smooth atlas (`GC.1/root-symmetric-smooth`) the
trivializing covers of the finite-level reductions are then unramified in
codimension one and extend (Stacks 0H2W; purity of the branch locus, 0BMB). The
extensions descend along the atlas (gap GC3-STACK-PI1), and uniqueness is full
faithfulness on dense opens (`IG.5/finite-cover-image-lemmas`). The
construction is over $k$, so $\mathbb L_d$ has its Frobenius descent datum.

| Name | Role | Contract |
| --- | --- | --- |
| `monodromySymmetricLocalSystem` | constructor | $\mathbb L_d$ on $X_d^{\sqrt R}$ with Frobenius descent datum. |
| `.restrictDistinct` | characterisation | The restriction of $\mathbb L_d$ to $U_d^\circ$ is the descent of $L^{\boxtimes d}$ with the unsigned linearization. |
| `.uniqueExtension` | extensionality | Two extensions of $L_d^\circ$ are related by a unique compatible isomorphism. |
| `.zero`, `.one` | simp | $\mathbb L_0=\overline{\mathbf Q}_\ell$ on $\operatorname{Spec}k$; $\mathbb L_1=L$. |
| `.monodromy` | characterisation | Over $\bar k$ the monodromy on $U_d^\circ$ is (A.6) with $\chi$ valued in $\overline{\mathbf Q}_\ell^\times$. |
| `.stalk` | other | At $D=\sum n_xx$ the stalk is a line; the stabilizer factor at $x\in R\cap\operatorname{supp}D$ acts by the inertia character of $L$ at $x$. |
| `.multiplicative` | compatibility | $\operatorname{add}_{d,e}^*\mathbb L_{d+e}\simeq\mathbb L_d\boxtimes\mathbb L_e$, associative, commutative and unital; promoted to the parent `GC.3/symmetric-multiplicativity`. |

| Test | Kind | Instance and error detected |
| --- | --- | --- |
| `.test_zero` | degenerate | $\mathbb L_0$ is $\overline{\mathbf Q}_\ell$ on $\operatorname{Spec}k$. |
| `.test_one` | compatibility | $\mathbb L_1=L$. |
| `.test_constant` | computation | For $R=\varnothing$ and $L$ constant, $\mathbb L_d$ is constant on $X_d$. |
| `.test_order_three` | computation | For $\chi$ unramified with trivial geometric monodromy and $\chi(\mathrm{Frob})=\zeta_3$, $\mathbb L_d$ is geometrically constant with Frobenius $\zeta_3^d$; rejects a global quadratic restriction. |
| `.test_koszul_sign_obstructs` | non-example | With the sign-twisted linearization the descended system has monodromy $-1$ around $\Delta$ and does not extend; the Koszul sign belongs to cohomology, not to these tensor lines. |
| `.test_stabilizer_character` | characterisation | At $2x$, $x\in R$ with sign inertia, the stabilizer acts on the stalk by the sign, not by its square. |

Sources: YZ19, §A.2.1 and the proof of Lemma A.8 with (A.5)–(A.6), pp. 519–520,
where the monodromy on the multiplicity-free locus is what proves
multiplicativity; Stacks 0H2W and 0BMB. Because $\mathbb L_d$ is lisse by
construction, the parent theorem `GC.3/collision-descent` holds for it, and
consumers that need $L_d$ only as a local system (`GC.4/fibre-triviality`,
`GC.4/empty-ramification-descent`, `GC.5/divisor-tensor-line`,
`GC.5/unit-trivialization`) can cite this node without any stack pushforward.

**New target:** `GC.3/pushforward-description-comparison` (comparison).
$\mathbb L_d$ is canonically isomorphic, with Frobenius, to
$(p_{d,!}L^{\boxtimes d})^{S_d}$, the parent definition
`GC.3/symmetric-local-system`. The pullback $p_d^*\mathbb L_d$ agrees
equivariantly with $L^{\boxtimes d}$ on the dense open $(U^d)^\circ$, so
adjunction gives an $S_d$-invariant map $\mathbb L_d\to p_{d*}L^{\boxtimes d}$.
At $D=\sum n_xx$ proper base change computes the target stalk from the fibre: a
product of the maps $[\mathrm{pt}/\mu_2]^{n_x}\to[\mathrm{pt}/\mu_2]$ for $x\in R$ and
finite sets for $x\in U$. The tensor-character and acyclicity lemmas show that its
invariant part is one line in degree zero, so the map is an isomorphism. Proper
base change along this proper quasi-finite but **non-representable** map is gap
GC3-STACK-PUSHFORWARD (source issue EGC3-2). Checks: $d=1$ is the identity; over
$U_d^\circ$ both sides are $L_d^\circ$; at $2x$, $x\in R$, a theorem for
representable finite maps does not apply.

## The coarse model and the cohomology computation

**New target:** `GC.3/symmetric-coarse-model`, proposed name
`TauCeti.RamifiedClassField.symmetricCoarseModel`. Let $F=j_*L$; its stalk at
$x\in R$ is $L_{\bar x}$ if the inertia character there is trivial and $0$ if it is
the sign. Define on the scheme $X_d$

$$
 \mathcal M_d=\bigl(q_{d*}F^{\boxtimes d}\bigr)^{S_d},
$$

with the unsigned permutation of factors and coordinates. It is a constructible
$\overline{\mathbf Q}_\ell$-sheaf with Frobenius descent datum, equal to
$L_d^\circ$ on $U_d^\circ$, with stalk $\bigotimes_xF_x^{\otimes n_x}$ at
$D=\sum n_xx$: the $S_d$-orbit of an ordered preimage has stabilizer
$\prod_xS_{n_x}$, which acts trivially on a tensor power of a line. It injects into
$j'_*(L_d^\circ)$ for $j':U_d^\circ\to X_d$.

| Name | Role | Contract |
| --- | --- | --- |
| `symmetricCoarseModel` | constructor | $\mathcal M_d$ with its Frobenius descent datum. |
| `.stalk` | characterisation | $(\mathcal M_d)_D\simeq\bigotimes_xF_x^{\otimes n_x}$. |
| `.restrictDistinct` | compatibility | The restriction of $\mathcal M_d$ to $U_d^\circ$ is $L_d^\circ$. |
| `.zero`, `.one` | simp | $\mathcal M_0=\overline{\mathbf Q}_\ell$; $\mathcal M_1=j_*L$. |
| `.subsheaf` | other | $\mathcal M_d\to j'_*(L_d^\circ)$ is injective. |

| Test | Kind | Instance and error detected |
| --- | --- | --- |
| `.test_zero` | degenerate | $\mathcal M_0=\overline{\mathbf Q}_\ell$ on $\operatorname{Spec}k$. |
| `.test_one` | compatibility | $\mathcal M_1=j_*L$. |
| `.test_kummer_stalks` | computation | $X=\mathbf P^1$, $R=\{0,\infty\}$, quadratic Kummer $\chi$: the stalks of $\mathcal M_2$ at $2\cdot0$ and $0+\infty$ vanish, and at $y+y'$ with $y,y'\in U$ the stalk is a line. |
| `.test_not_lisse` | non-example | With sign inertia at some $x\in R$, $\mathcal M_d$ vanishes on the image of $D_x$ but not on $U_d^\circ$: it is not lisse, while $\mathbb L_d$ is. The coarse model carries cohomology, not descent. |

If $\chi$ is unramified at every point of $R$, $F$ is lisse and $\mathcal M_d$ is
Deligne's symmetric-power local system on $X_d$.

**New target:** `GC.3/rational-coarse-comparison` (comparison).
$R^i\omega_{d*}\mathbb L_d=0$ for $i>0$ and $\omega_{d*}\mathbb L_d\simeq\mathcal M_d$,
compatibly with $L_d^\circ$ and Frobenius. Hence
$H^i(X_d^{\sqrt R}\otimes\bar k,\mathbb L_d)\simeq H^i(X_d\otimes\bar k,\mathcal M_d)$
for all $i$; for $d=1$, $H^i(X_1^{\sqrt R}\otimes\bar k,L)\simeq H^i(X\otimes\bar k,j_*L)$.

1. Étale-locally on $X_d$ the stack is a quotient by the stabilizer
   $G_D=\prod_{x\in R\cap\operatorname{supp}D}\mu_2$ (Abramovich–Vistoli
   Lemma 2.2.3; `SF.1/tame-local-structure`), and
   $(R^i\omega_{d*}\mathbb L_d)_D=H^i(G_D,(\mathbb L_d)_{\tilde D})$ (gap
   GC3-COARSE-STALKS).
2. These vanish for $i>0$, and for $i=0$ give a line exactly when every inertia
   character at $R\cap\operatorname{supp}D$ is trivial
   (`GC.3/finite-group-rational-acyclicity`, `GC.3/tensor-character-kernel`).
3. Both $\omega_{d*}\mathbb L_d$ and $\mathcal M_d$ are subsheaves of
   $j'_*(L_d^\circ)$, whose stalks have dimension at most one, and they have
   stalks of the same dimension everywhere; so they coincide.
4. Leray for $\omega_d$ then degenerates (gap GC3-COARSE-STALKS).

Check: over $\bar k$, for $X=\mathbf P^1$, $R=\{0,\infty\}$ and the sign
character, $H^*([\mathbf P^1/\mu_2],L)$ is the sign-isotypic part of
$H^*(\mathbf P^1)$, which is zero, matching $H^*(\mathbf P^1,j_*L)=0$.

**New target:** `GC.3/symmetric-power-cohomology` (theorem; planet *Cohomology
of symmetric powers*). For every $d\ge0$ there is a natural Frobenius-equivariant
isomorphism of graded spaces

$$
 H^*(X_d\otimes\bar k,\mathcal M_d)\simeq\Bigl(H^*(X\otimes\bar k,j_*L)^{\otimes d}\Bigr)^{S_d},
$$

where $S_d$ permutes the factors with the Koszul sign: exchanging adjacent classes
of degrees $a,b$ costs $(-1)^{ab}$. On $(H^1)^{\otimes d}$ this is
`GC.3/koszul-sign-action`. Route: $q_d$ is finite, so
$H^*(X_d,q_{d*}F^{\boxtimes d})=H^*(X^d,F^{\boxtimes d})$; invariants commute with
cohomology (`GC.3/averaging-exactness`); Künneth on the proper $X^d$ identifies
$H^*(X^d_{\bar k},F^{\boxtimes d})$ with $H^*(X_{\bar k},F)^{\otimes d}$, and graded
commutativity of the external cup product turns the permutation of factors into the
Koszul-signed one. The scheme inputs are requested from SchemeAndStackFoundations
SF.2, whose upstream owner is EtaleCohomologyFoundations (TauCetiRoadmap pull
request #938, §§F.2.1, F.2.6, F.2.7, F.4.5). Checks: $d=0,1$ are trivial; for
$R=\varnothing$, $L$ constant and $X=\mathbf P^1$ the right side is spanned by
powers of the degree-two class, as $H^*(\mathbf P^d)$ requires. Source: YZ19,
proof of Lemma A.6, p. 519.

**New target:** `GC.3/twisted-curve-cohomology` (lemma). If $\chi$ is nontrivial
on $\pi_1(U\otimes\bar k)$, then
$H^0(X\otimes\bar k,j_*L)=H^2(X\otimes\bar k,j_*L)=0$, so the cohomology is
concentrated in degree one; by the previous comparison the same holds on
$X_1^{\sqrt R}\otimes\bar k$. $H^0$ is the $\pi_1(U_{\bar k})$-invariants of a line
with nontrivial action (`IG.0/etale-fundamental-group`). Poincaré duality for
$j_*$ coefficients on the projective curve
(`EDC.2/curve-poincare-duality-with-j-star-statement`, Weil I 2.12) pairs
$H^2(j_*L)$ with $H^0(j_*L^\vee(1))$, and $L^\vee$ is again geometrically
nontrivial. Checks: the constant sheaf on $\mathbf P^1$ and a geometrically
trivial $\chi$ with $\chi(\mathrm{Frob})=\zeta_3$ are excluded; for the quadratic
Kummer character on $\mathbf P^1$ ramified at $0,\infty$ even $H^1=0$. This answers
the parent request DUALITY-SCHEME on the coarse curve, where no stack duality is
needed.

**How the parent theorem follows.** For geometrically nontrivial $L$, combine the
four targets:

$$
 H^*(X_d^{\sqrt R}\otimes\bar k,\mathbb L_d)\simeq H^*(X_d\otimes\bar k,\mathcal M_d)
 \simeq\bigl((H^1)^{\otimes d}[-d]\bigr)^{S_d},
$$

and the Koszul-signed invariants are $\wedge^dH^1$ by
`GC.3/alternating-invariants-exterior`. This is the parent theorem
`GC.3/exterior-cohomology` (YZ19 Lemma A.6): $H^i=0$ for $i\ne d$ and
$H^d\simeq\wedge^dH^1(X_1^{\sqrt R}\otimes\bar k,L)$, Frobenius-equivariantly,
including $d=0$, and zero for $d>\dim H^1$. For the quadratic Kummer example on
$\mathbf P^1$ all $H^*$ vanish for $d\ge1$.

## Imported parent targets

The following nodes of the accepted parent are imported unchanged, with prefix
`FunctionFieldArithmeticPartII:GC.3/`. The packet's `importedTargets` keeps their
statements, and the API and tests of `symmetric-local-system`.

| Node | How this layer supports it |
| --- | --- |
| `tame-local-systems` | Stated with its proof route as `root-curve-character-dictionary`. |
| `symmetric-local-system` | YZ19's pushforward definition; identified with $\mathbb L_d$ by `pushforward-description-comparison`. |
| `collision-kernel` | Its algebra is `tensor-character-kernel`. |
| `middle-extension` | Needs proper pushforward along $p_d$ (GC3-STACK-PUSHFORWARD); consumed only inside GC.3. |
| `collision-descent` | Holds for $\mathbb L_d$ by construction, and for the parent definition through the comparison. |
| `cohomology-vanishing` | `rational-coarse-comparison` for $d=1$ with `twisted-curve-cohomology`. |
| `koszul-exterior` | `koszul-sign-action`, `antisymmetrization`, `alternating-invariants-exterior`. |
| `exterior-cohomology` | The coarse route of the previous section. |
| `multiplicity-free-product` | Block concatenation of the descent defining $\mathbb L_d$. |
| `symmetric-multiplicativity`, `symmetric-associativity`, `symmetric-symmetry` | Unchanged; their extension step is full faithfulness on dense opens (`IG.5/finite-cover-image-lemmas`, gap GC3-STACK-PI1). |

The packet's restructure entry lists the corresponding prerequisite edits for the
assembly. They change no parent statement and create no cycle.

## Dependencies and ownership

- **Inside the roadmap:** RS.1 (root stacks, affine chart, regularity), GC.1
  (root symmetric powers, smoothness, coarse map, ordered and addition maps), and
  the twelve imported GC.3 nodes.
- **InverseGaloisAndArithmeticFundamentalGroups:** `IG.0/etale-fundamental-group`,
  `IG.0/adic-local-systems`, `IG.1/tame-and-prime-to-p`,
  `IG.1/decomposition-inertia`, `IG.5/finite-cover-image-lemmas` (accepted
  nodes; upstream pull request #850, §§IG.1.2, IG.5.7).
- **EtaleDualityAndPerverseSheaves:**
  `EDC.2/curve-poincare-duality-with-j-star-statement` (accepted).
- **SchemeAndStackFoundations:** `SF.1/root-stack`, `SF.1/coarse-moduli-space`,
  `SF.1/tame-local-structure` (upstream main §§1.19, 1.21, 1.23); a request to SF.2
  for Künneth, finite pushforward and proper base change of constructible
  $\overline{\mathbf Q}_\ell$-sheaves, integrated from EtaleCohomologyFoundations.
- **Tau Ceti roadmap ProfiniteCohomology, Layer 10:** `corestriction_comp_res`.
- **Libraries:** Tau Ceti `reindexRepresentation`, its invariants and
  `range_norm_eq_invariants`; Mathlib exterior powers, alternatization,
  `PiTensorProduct`, averaging, `groupCohomology`, idempotent completeness.

**Gaps.** No roadmap with stage ids owns ℓ-adic sheaves on Deligne–Mumford
stacks; the red-team fix RT-AREA-etale/3 routes them to a stacks Part II of
EtaleDualityAndPerverseSheaves (layers ST.0–ST.6, to be designed). GC.3 needs
exactly three statements from it.

| Gap | Statement needed | Intended owner | Consumers here |
| --- | --- | --- | --- |
| GC3-STACK-PI1 | Noohi's fundamental group of a connected Deligne–Mumford stack, lisse $\overline{\mathbf Q}_\ell$-sheaves as its continuous representations, atlas descent. | ST.0, ST.2 | `root-curve-character-dictionary`, `monodromy-symmetric-local-system` |
| GC3-COARSE-STALKS | For a tame Deligne–Mumford stack with coarse map $\omega$: $(R^i\omega_*F)_{\bar y}=H^i(G_{\bar y},F_{\tilde y})$ and the Leray comparison, with Frobenius. | ST.0–ST.2 | `rational-coarse-comparison` |
| GC3-STACK-PUSHFORWARD | Proper base change along proper quasi-finite non-representable morphisms. | ST.1 | `pushforward-description-comparison` only |
| GC3-LEAN-CARRIERS | Stack, sheaf and fundamental-group carriers for the geometric signatures. | Tau Ceti | all geometric targets |

They replace, for GC.3, the parent gaps ST-LISSE and ST-OPS; the parent gap
EXTERIOR-COMP is discharged. GC3-STACK-PI1 overlaps the gap GC4-LISSE-ADAPTER of
the sibling GC.4 follow-up, which asks the same owner for finite locally constant
sheaves on tame Deligne–Mumford stacks, their comparison with representable finite
étale covers, smooth descent and degree-zero proper base change; the assembly
merges them. Intermediate extension, perverse sheaves and a
decomposition theorem on stacks are not needed by GC.3 or its consumers. The same
coarse comparison is requested by DeligneWeightsAndPurity (purity for smooth proper
Deligne–Mumford stacks) and WeilConjectures WC.6, so one owner serves all three.

## Source qualifications

- **EGC3-1 (misprint, new).** In the proof of Lemma A.6, p. 519 (arXiv v2
  pp. 85–86), the cohomology of the root curve is twice written over $k$; it should
  be over $\bar k$, as in the statement. Over $k$ the Frobenius coinvariants of the
  geometric $H^1$ sit in the arithmetic $H^2$, so that cohomology is not
  concentrated in degree one in general.
- **EGC3-2 (gap, new).** §A.2.1, p. 519, calls $p_d$ a finite map. At $m\cdot x$
  with $x\in R$ it induces multiplication $\mu_2^m\to\mu_2$ on stabilizers, so it
  is proper and quasi-finite but not representable. The middle-extension claim
  needs the corresponding statement for such morphisms; the monodromy
  construction avoids it.
- **EGC3-3 (inherited E1).** $L_d$ is the unshifted object; $L_d[d]$ is perverse.
- **EGC3-4 (inherited E3).** In Lemma A.8 the character $\chi$ takes values in
  $\overline{\mathbf Q}_\ell^\times$, not $\{\pm1\}$; only the inertia at $R$ has
  order dividing two.

Sources read: YZ19, published author-hosted PDF
(https://math.mit.edu/~zyun/GZW_ramified_published.pdf), Appendix A.1–A.2.1,
pp. 514–521, with page images of pp. 518–519, and arXiv v2 pp. 85–86; Stacks
Project §§58.21, 58.31 and 12.4; Noohi, *Fundamental groups of algebraic stacks*
(arXiv:math/0201021), §4 and §7; Abramovich–Vistoli, *Compactifying the space of
stable maps* (arXiv:math/9908167v2), §§2.2–2.3; Conrad, *Exterior powers*, §§2–5;
Milne, *Class Field Theory* v4.03, II §1; Etingof et al., *Introduction to
representation theory* (arXiv:0901.0827v5), §3. All are freely available; no
restricted source was used.

## Suggested Lean file

[`FunctionFieldArithmeticPartII--GC.3.lean`](../suggested/FunctionFieldArithmeticPartII--GC.3.lean)
states the algebra of this layer over carriers present at the pins (Mathlib
082e2d3, Tau Ceti f790474): the real-bodied definitions `koszulPermAction`,
`koszulRepresentation` (on Tau Ceti's `reindexRepresentation`),
`antisymmetrization` and `exteriorProjection`, their API, the comparison
`antisymmetrization.bijective`, `invariants_map_surjective`,
`groupCohomology_isZero_of_invertible`, the three tensor-character lemmas, and
the tests of this document as labelled `example`s. Proofs are `sorry`; no data
is. The geometric targets need étale sites, constructible and lisse sheaves and
fundamental groups of Deligne–Mumford stacks, which are absent at the pins; the
file lists them in an omission ledger and states no stand-in for them. The file
elaborates with `lean-check` at the pins, with only `sorry` warnings.
