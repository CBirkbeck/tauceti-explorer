# Lefschetz pencils, nearby cycles and vanishing cycles, Part II: prescribed finite-field points

This roadmap supplies a local curve through a specified rational point without changing its field of definition. Let $k$ be a field, let $Y/k$ be smooth near $y\in Y(k)$, and let $U\subset Y$ be open and dense on the component through $y$. The endpoint is an affine, smooth, geometrically integral curve $C/k$, a point $c\in C(k)$, and a $k$-morphism $g:C\to Y$ such that $g(c)=y$ and $g^{-1}(U)$ is nonempty open dense. The point can lie on the boundary $Y\setminus U$. The curve meets the good open as a scheme; its good open need not have a rational point.

The application is the smooth-chart curve step in Kisin–Zhou, *Independence of ℓ for Frobenius conjugacy classes attached to abelian varieties*, Corollary 5.2.7, proof on pp. 52–53, and Proposition 5.3.5, proof on p. 54, in arXiv:2103.09945v2. Over $k=\mathbf F_q$, both marked residue fields remain exactly $\mathbf F_q$. The singular local-model curve of Proposition 5.2.3, the rational lift to a stack atlas, and the subsequent independence-of-ℓ argument are separate inputs owned by their consumers. This endpoint supplies the smooth scheme step, rather than those whole results.

The construction has two layers. FC.0 substitutes increasingly separated powers of one variable into a multivariate polynomial, using bounded base expansion to prevent cancellation. FC.1 pulls that graph back along an étale chart and retains the connected component containing the rational mark. General smooth coordinates, image-dimension estimates and the rational-point criterion for geometric integrality already belong to `SchemeAndStackFoundations:SF.0`. The proof imports their exact nodes. This is a small target-level extension; it does not require a decomposition of the entire Bertini or nearby-cycle theories.

## Scope and conventions

The parent `LefschetzPencilsAndVanishingCycles:LPV.3` constructs sufficiently ample projective Lefschetz pencils. Its finite-field parameter-space result permits a finite extension. An open parameter space can have no rational points over its original finite field, so that result does not supply the marked same-field curve here. Conversely, the present local curve does not supply a pencil, a projective curve, a curve through several specified points, or an assertion about every embedding. The parent relation records the extension of scope; its pencil theorem is not a prerequisite of the elementary proof.

All polynomial variables are numbered $0,\ldots,m-1$. Write $T$ for the univariate variable and $X_i$ for multivariate variables. An exponent vector $d$ is an element of the existing finitely supported carrier $\operatorname{Fin}(m)\to_0\mathbf N$. Because the index set is finite, its positional weight is the finite sum

\[
 w_B(d)=\sum_{i=0}^{m-1}d_i B^i.
\]

This is notation for a sum, not a new mathematical object requiring an independent theory. The strict bound is on each individual exponent $d_i$, not on the number of monomials or their coefficients. Taking $B$ larger than the total degree would suffice, but the weaker individual bound is the contract.

Schemes and morphisms use the native Mathlib carriers. A rational point is a section $\operatorname{Spec}k\to Y$ of the specified structure morphism. A curve is nonempty and of finite type over $k$; its structure morphism is smooth of relative dimension one and geometrically integral. Affineness is included in the endpoint. The target $Y$ need not be globally smooth, separated, affine or projective. A smooth neighbourhood of the marked point is enough. Smoothness over an arbitrary field, rather than regularity alone, supplies geometric reducedness; no perfectness assumption is needed.

For the local density hypothesis one can give an open neighbourhood $V\subset Y$ containing $y$, smooth over $k$, with $U\cap V$ dense in $V$. Equivalently, start with density on the unique component through the smooth point and shrink into that component. Nothing is required of other components. A fixed chart and a chosen admissible integer $B$ determine the graph and marked component. Different charts or integers are allowed to give different curves. Only the marked component of a fixed pullback is canonical.

## Inputs and ownership

The pinned baseline is Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` with Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. The packet records nineteen source-read Mathlib declarations. In particular:

- `MvPolynomial.eval₂Hom` already constructs the evaluation ring map, with constant, variable, monomial and composition formulas. No polynomial or spectrum carrier is introduced here.
- `Nat.ofDigits_inj_of_len_eq` and `Nat.ofDigits_eq_sum_mapIdx` already give equal-length bounded base expansion and its positional-sum formula. FC.0 proves the finite-vector and coefficient specialization, rather than re-planning base expansion.
- Étale base change, its equivalence with smooth relative dimension zero, and addition of smooth relative dimensions already exist. A one-variable presentation with no equations has relative dimension one; this is an elementary application of the existing submersive-presentation API, not a new smoothness theorem.
- `IsClosedImmersion.spec_of_surjective` supplies the graph’s immersion once its coordinate map is surjective. `Flat.generalizingMap` and `isOpenMap_of_generalizingMap` give openness for the étale curve projection. This agrees with the existing universally open instance and `Scheme.Hom.isOpenMap`.
- `GeometricallyIntegral` is the existing scheme-morphism predicate. `IsOpen.dense` and `IsOpenMap.denseRange_of_isPreirreducibleSpace` provide the topological density steps.

There are two precise mathematical imports from `SchemeAndStackFoundations--SF.0.json`:

| Supplier node | Exact contract used |
| --- | --- |
| `SchemeAndStackFoundations:SF.0/etale-coordinates` | Part (b): an integral affine neighbourhood of a smooth rational point with an étale $k$-map to $\mathbf A^m$, translated to send the point to zero. Part (c): for a proper closed boundary its image closure has dimension at most $m-1$, hence lies in a hypersurface defined by a nonzero polynomial. |
| `SchemeAndStackFoundations:SF.0/rational-point-component` | Parts (b),(c): the component through a rational point in a smooth affine finite-type $k$-scheme is open and closed and geometrically integral. |

These contracts have been read, rather than inferred from their titles. Their source anchors include Stacks tag [054L](https://stacks.math.columbia.edu/tag/054L), Lemma 29.37.21, and tag [0CDW](https://stacks.math.columbia.edu/tag/0CDW), Lemma 33.25.10. Tag [04KV](https://stacks.math.columbia.edu/tag/04KV), Lemma 33.7.14, gives the rational-point criterion for geometric connectedness used in the component argument. These suppliers own the general coordinates, dimension and component theory. The enclosing SF.0 packet has a `needs_changes` review for wider ownership and proof/interface issues. Citing its exact nodes is not a claim that the whole supplier packet is accepted or implemented. The present plan is closed relative to those stated contracts.

The reviewed LPV.3 audit records the projective pencil theorem as unbuilt; it does not locate a same-field local curve theorem in the libraries. The duplication screen also used current TauCetiRoadmap main, including the roadmaps added after the atlas snapshot, and current Tau Ceti. Current Tau Ceti already has `TauCeti.AlgebraicGeometry.Smooth.geometricallyIntegral`: smooth and geometrically connected morphisms are geometrically integral. That general theorem belongs to the shared component input; the six nodes here do not re-plan it. The current library and roadmaps did not supply the graph-avoidance or marked curve-existence targets. The nearby AlgebraicCurves and StableReduction reader documents inform the carrier, relative-dimension and component conventions. The parent’s links involving local inertia and vanishing cycles do not enter this proof.

## FC.0 — Polynomial graphs over the original field

This layer has four declarations: a light definition, bounded-support coefficient preservation, surjectivity, and the avoiding-graph theorem. The first, second and fourth are its three planets.

### The evaluation map

**`TauCeti.SameFieldCurves.polynomialGraph`.** For a commutative ring $k$ and natural numbers $m,B$, define

\[
 \varphi_{m,B}:k[X_0,\ldots,X_{m-1}]\longrightarrow k[T],
 \qquad X_i\longmapsto T^{B^i},\quad a\longmapsto a.
\]

It is exactly the existing universal evaluation homomorphism with the coefficient inclusion into $k[T]$. The definition exists even at $m=0$ or $B=0$. Its geometric use has $k$ a field, $m>0$ and $B\ge2$. The induced morphism is denoted $a_B:\mathbf A^1_k\to\mathbf A^m_k$. The zero-based indexing matters: the first coordinate is $T^{B^0}=T$, rather than $T^B$.

The complete normalization API consists of the following named declarations. Names below have the prefix `TauCeti.SameFieldCurves.`.

| Name | Contract |
| --- | --- |
| `polynomialGraph_C` | Constants are preserved: $\varphi(C(a))=C(a)$. |
| `polynomialGraph_X` | The $i$-th variable maps to $T^{B^i}$. |
| `polynomialGraph_monomial` | $\varphi(aX^d)=C(a)T^{w_B(d)}$. |
| `polynomialGraph_eval_zero` | For $B\ge2$, evaluating the output at $T=0$ equals evaluating all input coordinates at zero. Thus $a_B(0)=0$. |
| `polynomialGraph_one_variable` | At $m=1$, for every $B$, this is the usual evaluation identification sending the sole variable to $T$. |
| `polynomialGraph_map` | Every map of commutative coefficient rings $k\to K$ commutes with this evaluation, with $m,B$ fixed. Identity and composition compatibility follow from the existing polynomial map laws. |

The bounded-support and surjectivity statements are promoted to their own nodes because the geometric layer consumes them. No global injectivity assertion is attached to $\varphi_{m,B}$ for $m>1$.

### Preservation of coefficients

**`polynomialGraph_coeff`.** Suppose $B\ge2$, $h\in k[X_0,\ldots,X_{m-1}]$, and every $d\in\operatorname{supp}(h)$ satisfies $d_i<B$ for all $i$. If $e_i<B$ for all $i$, then

\[
 [T^{w_B(e)}]\varphi_{m,B}(h)=[X^e]h.
\]

The coefficient ring can be any commutative ring. In particular, for a nonzero polynomial satisfying the support bound its substituted polynomial is nonzero. The test vector need not itself occur in the support; in that case the displayed coefficient is zero.

The proof passes from a vector to the ordered list $(d_0,\ldots,d_{m-1})$. All lists have length $m$, so trailing zero entries introduce no ambiguity. The existing sum formula identifies its base-$B$ value with $w_B(d)$, and bounded-digit uniqueness gives injectivity. Expand the finite support of $h$. Its monomials map to distinct powers of $T$, so no two nonzero coefficients can cancel. Coefficient extraction at $w_B(e)$ gives the displayed equality. At $m=0$ the only exponent vector is empty and its weight is zero, so the constant case is covered too.

There is no claim that polynomial evaluation as a function on a finite field is injective. The proof takes place in $k[T]$ and can use its generic point even when all rational values vanish.

### Surjectivity and avoidance

**`polynomialGraph_surjective`.** For $m>0$, the map $\varphi_{m,B}$ is surjective for every $B\in\mathbf N$. Given $p(T)=\sum_j a_jT^j$, the polynomial $\sum_j a_jX_0^j$ maps to it. This uses just preservation of constants and $X_0\mapsto T$. It remains true without an exponent bound, without a field hypothesis, and even at $B=0$.

**`exists_avoiding_graph`.** Let $m>0$ and $0\ne h\in k[X_0,\ldots,X_{m-1}]$. Choose an integer $B\ge2$ strictly greater than every individual exponent occurring in its finite support. Then $\varphi_{m,B}(h)\ne0$, and the associated spectrum map is a closed immersion by surjectivity. Over a field, it passes through the origin and

\[
 a_B^{-1}(D(h))=D(\varphi_{m,B}(h))
\]

is nonempty open dense in $\mathbf A^1_k$. The generic prime of the domain $k[T]$ belongs to this principal open. Its nonemptiness does not require a rational value of $T$ at which $h(a_B(T))\ne0$.

One possible bound is the maximum of two and one more than the maximum support coordinate; any admissible bound works. The result chooses a graph avoiding a **specified** hypersurface, not a graph avoiding every proper closed set at once. For $m>1$, the map has relations such as $X_1-X_0^B$ in its kernel. Those relations violate the individual bound and do not contradict coefficient preservation.

### Unit tests and acceptance

These four tests belong to `polynomialGraph`; each is a computed or structural test of the definition, rather than a restatement that an abstract morphism exists.

1. **`polynomialGraph_F2_lines`.** Over $\mathbf F_2$, put $h=X_0^2X_1-X_0X_1^2$. Each rational line through zero lies in its zero locus: the axes kill one factor, and the remaining line has $X_0=X_1$. At $B=3$, the substituted polynomial is $T^5+T^7\ne0$. A procedure choosing a rational straight line would fail this test.
2. **`polynomialGraph_bad_base`.** Over $\mathbf F_2$, $h=X_1-X_0^2$ maps to zero for $B=2$, because two weights collide. It maps to $T^3-T^2\ne0$ at $B=3$. A non-strict bound, a bound on coefficients, or a claim of unrestricted injectivity fails this test.
3. **`polynomialGraph_one_coordinate`.** For $m=1$, $X_0\mapsto T$ for every $B$, including zero. The map agrees with the existing one-variable polynomial identification. Numbering coordinates starting at one or replacing the first coordinate by $T^B$ fails this test.
4. **`polynomialGraph_zero_variables`.** At $m=0$, constants remain constants. Over a field this map is not surjective onto $k[T]$. The ring homomorphism exists, but the closed-immersion theorem is used only for $m>0$. A fake graph with an automatically supplied first coordinate fails this boundary case.

Acceptance for FC.0 requires the bounded coefficient identity, the surjectivity theorem and the resulting **scheme** immersion, together with these tests. It also requires a finite-field example such as $T^q-T$: its principal open is dense despite having no $\mathbf F_q$-rational points. It must not turn nonzero polynomial into an unsupported rational-point existence assertion.

## FC.1 — Marked étale curves through prescribed points

This layer has the marked pullback construction and the endpoint theorem as its two planets. It imports FC.0 and the two exact SF.0 nodes listed above. Neither the parent’s projective pencil existence nor a projective Bertini theorem is used.

### The fixed-chart construction

**`exists_marked_etale_curve` / marked pullback.** Fix a field $k$, a nonempty integral affine finite-type $k$-scheme $V$, an étale $k$-morphism $\pi:V\to\mathbf A^m_k$ with $m>0$, and $y\in V(k)$ with $\pi(y)=0$. Let $U\subset V$ be dense open. The closed boundary $Z=V\setminus U$ is proper. Part (c) of the coordinate supplier gives a nonzero polynomial $h$ vanishing on $\pi(Z)$: the closure of this image has dimension less than $m$. It is enough that $h$ vanish on the image; equality of closed subschemes and a principal boundary are not assumed.

Choose $B$ from FC.0 and form the categorical pullback

\[
\begin{array}{ccc}
 W=V\times_{\mathbf A^m_k}\mathbf A^1_k&\longrightarrow&V\\
 \downarrow&&\downarrow\pi\\
 \mathbf A^1_k&\xrightarrow{a_B}&\mathbf A^m_k.
\end{array}
\]

The pair $w=(y,0)$ is a $k$-point. Give its connected component $C\subset W$ the induced open subscheme structure, and write $j:C\to W$ for its inclusion. This is a heavy geometric construction recorded here; the suggested file states the existence milestone on existing scheme carriers and does not introduce a data definition for it.

The scheme $W$ is affine, since the three schemes defining its fibre product are affine. Its projection to $\mathbf A^1$ is étale by the pinned base-change instance. It is of finite type over $k$: the projection is locally of finite presentation and quasi-compact, and $\mathbf A^1/k$ is of finite type. In particular $W$ is noetherian. Composing the étale projection with the affine-line structure morphism shows that $W/k$ is smooth of relative dimension one. The affine line has the standard presentation with one generator and no relations; relative dimensions add as $0+1=1$.

The rational-point component supplier applies to $W,w$. Its component is open and closed, is smooth and geometrically integral, and contains a unique factorization of the marked section through the open inclusion. It is affine because it is a closed subscheme of affine $W$. This choice is necessary: an étale pullback of an integral chart can be disconnected. Selecting an arbitrary component or retaining all components does not meet the mark-and-integrality contract.

Write $q:C\to\mathbf A^1$ and $g:C\to V$ for the restricted projections. Then $\pi g=a_Bq$, $g(c)=y$, and $q(c)=0$. The map $q$ is étale and open. Its nonempty range is an open of irreducible $\mathbf A^1$, so it intersects the nonempty open $D(\varphi(h))$. Consequently $q^{-1}D(\varphi(h))\ne\varnothing$. The pullback equation shows

\[
 q^{-1}D(\varphi(h))\ \subset\ g^{-1}(U).
\]

Indeed, a point mapping into $Z$ would have $h=0$ at its image in affine space, contradicting invertibility of the pullback of $h$. Thus $g^{-1}(U)$ is nonempty open; it is dense because $C$ is integral. No dominance of $g:C\to V$ is asserted or needed. For $\dim V>1$, the curve usually cannot dominate $V$.

### Construction API

The following nine declarations describe the complete fixed-chart construction API. Their prefix is `TauCeti.SameFieldCurves.`. They are README targets, not a new stand-in carrier in the suggested file.

| Name | Contract |
| --- | --- |
| `markedPullback.component` | The object is the connected component through $w=(y,0)$ of the actual scheme pullback, with the induced open scheme structure. |
| `markedPullback.inclusion` | Its inclusion $j$ is both open and closed. The object is affine and finite type over $k$. |
| `markedPullback.projections` | The two projections are restrictions of the categorical pullback projections and satisfy $\pi g=a_Bq$. Their structure maps to $\operatorname{Spec}k$ agree. |
| `markedPullback.point` | The rational section $w$ has a unique lift through $j$, giving $c$ with $g(c)=y$, $q(c)=0$ and $s_Cc=\mathrm{id}$. |
| `markedPullback.smooth` | $q$ is étale, and $s_C$ is smooth of relative dimension one. |
| `markedPullback.geometricallyIntegral` | $s_C$ is geometrically integral, using the connected component and its rational point. |
| `markedPullback.goodOpen` | The displayed inclusion of inverse images holds; both opens are nonempty and $g^{-1}(U)$ is dense. |
| `markedPullback.chartCompatibility` | For the identity chart of affine space, the native pullback identification is $W=C=\mathbf A^1$, with $q=\mathrm{id}$ and $g=a_B$. |
| `markedPullback.changeField` | For an extension $K/k$, $C_K$ is integral and connected and is the component of $W_K$ containing $c_K$. The projections are their base changes and the good open stays dense. No independence of the choices of chart, $h$, or $B$ is asserted. |

The last item uses geometric integrality essentially. Since $j$ is open and closed, its base change has the same property. Its connected nonempty source is an entire component of $W_K$. The nonempty good open stays nonempty under the faithfully flat field extension. In particular this compatibility is about a fixed curve; the endpoint over $k$ is already obtained before any base change.

### Unit tests for the construction

1. **`markedPullback_identity`.** Let $V=\mathbf A^2_k$, $\pi=\mathrm{id}$, $y=0$, $U=V$, $h=1$, $B=2$. Then $W=C=\mathbf A^1$, $q=\mathrm{id}$, $g(T)=(T,T^2)$, and $c=0$. Check both maps against the native categorical pullback, not only their dimensions.
2. **`markedPullback_boundary`.** With this chart and $U=D(X_0)$, choose $h=X_0$, $B=2$. The marked point is outside the good open, but $g^{-1}(U)=D(T)$ is nonempty dense. A construction deleting the mark before selecting a component fails this test.
3. **`markedPullback_disconnected`.** Over $k=\mathbf F_3$, take the integral chart $V=\operatorname{Spec}k[x,z,z^{-1}]$, with $\pi(x,z)=(x,z^2-1-2x)$. Its Jacobian determinant in the second coordinate is $2z$, a unit, so the map is étale. Mark $y=(0,1)$, and put $U=V,h=1,B=2$. The pullback has equation $z^2=(T+1)^2$ with $z$ invertible, so $T+1$ is invertible. The factors $z-(T+1)$ and $z+(T+1)$ are relatively prime, because $2(T+1)$ is a unit. Thus $W$ is the disjoint union of two copies of $D(T+1)$. The mark selects exactly the plus branch. Keeping all of $W$, or the minus branch, fails this test even though the original chart $V$ is integral.
4. **`markedPullback_origin`.** Over $\mathbf F_2$, use the identity chart of $\mathbf A^2$, $h=X_0^2X_1-X_0X_1^2$, $U=D(h)$, and $B=3$. The curve is $\mathbf A^1$, the map is $(T,T^3)$, the mark is zero, and its good open is $D(T^5+T^7)$. This ties the finite-field failure of rational lines to the marked scheme construction.

### The local endpoint and dimension zero

**`exists_same_field_curve`.** For a scheme over any field $k$, a rational section $y$, and opens $U,V\subset Y$ with $y\in V$, $V/k$ smooth and $U\cap V$ dense in $V$, there is an affine smooth geometrically integral $k$-curve $C$, a rational point $c$, and a $k$-map $g:C\to Y$ with $g(c)=y$ and $g^{-1}(U)$ nonempty open dense. This is precisely the marked morphism conclusion; neither a proper map nor a one-dimensional immersion is included.

Shrink $V$ to the integral affine neighbourhood supplied by the coordinate node, and translate its rational coordinate value to zero. Density survives passage to this nonempty open. If its dimension $m$ is positive, apply the construction and compose with its open inclusion into $Y$.

If $m=0$, the integral affine chart is étale over $\operatorname{Spec}k$. A zero-dimensional finite-type integral $k$-algebra is a finite field extension; étaleness makes it separable. Its $k$-rational point gives a $k$-map from this field back to $k$, so the extension has degree one. Thus the neighbourhood is $\operatorname{Spec}k$. Its dense open contains $y$. Set $C=\mathbf A^1_k$, $c=0$, and let $g$ be the constant map through $y$. Its entire source maps into $U$. This handles an isolated smooth rational point while preserving a genuine dimension-one source. It also explains why an immersion is not part of the endpoint.

For $k=\mathbf F_q$, the maps on marked residue fields are identities over $k$: $\kappa(c)=k=\kappa(y)$. A lisse sheaf on $Y$, pulled back to $C$, therefore has the same stalk representation and the same geometric Frobenius at the two marked points, up to the usual choice of geometric point. No replacement by a positive power of Frobenius arises from a field extension. Formal sheaves, stalk comparisons and Frobenius conventions remain with the consumer; this roadmap exports the residue-degree-one geometry they require.

Acceptance for FC.1 includes the four construction tests, the constant map for $Y=\operatorname{Spec}k$, a target with an extraneous component disjoint from $U$, and $Y=\mathbf A^1_{\mathbf F_q}$, $U=D(T^q-T)$, $y=0$. The last example forbids a requirement for an additional rational point in the good open. The endpoint must work when the rest of $Y$ is singular, since only the chosen neighbourhood is used.

## Source discipline and the independent directions

The polynomial graph and its bounded-support argument are explicitly derived adapters. They are motivated by the curve use in Kisin–Zhou and extend existing evaluation and digit APIs. They are not attributed to a theorem printed in that paper. Kisin–Zhou v2’s proof on p. 53 cites Poonen Corollary 3.4 for a smooth atlas chart. The inspected Poonen author PDF, §3.3, p. 10, has a smooth **projective** geometrically integral ambient variety in that corollary. That mismatch is already recorded as `PAPER-KISIN-ZHOU-25/E11`; the packet carries a version-scoped record and resolves the needed local conclusion by the explicit proof here. The packet records both inspected PDF versions and hashes. The latest listed arXiv version is v2. The Annals bibliographic page was read, but its full-article link returned a Project Euclid access challenge, so the published article text was not compared. No defect in Poonen’s statement is alleged, and the local construction does not establish its stronger global conclusion.

Issue #3359 also groups two independent continuation directions. Its explicit split permission is used here. The packet’s restructuring proposal preserves both as separate design allocations:

- `UniversalHypersurfaceMonodromy` receives **both** the Browning–Sawin and Schiffmann routes. Its proof direction is the universal family, primitive pairing, full geometric Zariski symplectic or orthogonal monodromy with the precise Katz–Sarnak exceptions, the required product/Goursat statements, the characteristic-zero comparison, and the Chapter 10 curve-family input to Schiffmann’s Frobenius density theorem. The two routes must not create competing universal-family owners.
- `SemistablePotentialMaps` receives the Liu–Tian–Xiao–Zhang–Zhu route through Y. Liu’s semistable potential map, its exact sequence and Abel–Jacobi comparison. Its source coefficients and properness hypotheses must be compared with the consumer’s nonproper schemes and integral coefficients.

The handoff preserves the route-specific hypotheses and source gates for those design jobs. They are not stages of FC.0–FC.1 and are not declared closed by this packet. The six local declarations here have no gaps or open supplier requests at target level. Formalisation remains unchecked. The independent review accepts these six target-level declarations relative to the stated SF.0 contracts; the split remains a proposal for the maintainer.

## References and signature artifact

1. Mark Kisin and Rong Zhou, [arXiv:2103.09945v2](https://arxiv.org/abs/2103.09945v2), 7 October 2024: Proposition 5.2.3 and Remark 5.2.4, pp. 49–52; Corollary 5.2.7, pp. 52–53; Proposition 5.3.5, p. 54. Published as *Annals of Mathematics* 202 (2025), no. 3, 1077–1156, DOI [10.4007/annals.2025.202.3.3](https://doi.org/10.4007/annals.2025.202.3.3). Locators here refer to the inspected preprint.
2. Bjorn Poonen, [Bertini theorems over finite fields](https://math.mit.edu/~poonen/papers/bertini.pdf), author PDF dated 31 August 2004, §3.3, Theorem 3.3 and Corollary 3.4, p. 10. Used to check the boundary of the cited global theorem.
3. The Stacks Project, [054L](https://stacks.math.columbia.edu/tag/054L), Lemma 29.37.21, and [0CDW](https://stacks.math.columbia.edu/tag/0CDW), Lemma 33.25.10, and [04KV](https://stacks.math.columbia.edu/tag/04KV), Lemma 33.7.14; unpaginated online statements and proofs read 19 October 2026.
4. Mathlib at the pin above, `Algebra/MvPolynomial/Eval.lean`, `Data/Nat/Digits/Defs.lean` and `Lemmas.lean`, and the geometry modules listed with the exact declaration names in the packet. These are source-read library inputs, not unverified search hits.

The companion suggested file is a compact signature artifact: one real-bodied polynomial evaluation definition, its normalization formulas and discriminating examples, the FC.0 milestones, the marked-curve existence milestone and the endpoint. It deliberately leaves the heavy marked-component data and its nine-item API in this definitive reader, following the current roadmap shape. The examples state the full finite-field rational-line failure and zero-variable nonsurjectivity, the native identity pullback, the boundary and origin good opens, and the F₃ factorization with its marked branch. The localization, component identifications and nine construction API declarations remain reader targets. Elaboration checks signatures at the pins; the theorem and example proofs remain unimplemented.
