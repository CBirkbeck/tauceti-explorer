# Global centres and termination

This part of **Algebraic moduli and representability for arithmetic geometry** specifies the passage from the local resolution invariant to finite geometric outputs. Its stage is `AlgebraicModuliForArithmeticGeometry:R09.7c`. It imports the local presentations and history from R09.7b and supplies the resolution and principalization towers consumed by R09.7d. The outputs retain their centres, transforms, boundary labels and preserved opens. An unspecified proper morphism with a smooth source is insufficient.

The mathematics has canonical owners in the accepted [R09.7 aggregate packet](../packets/AlgebraicModuliForArithmeticGeometry--R09.7.json) and [R09.7a supplement](../packets/AlgebraicModuliForArithmeticGeometry--R09.7a.json). This part imports their targets. It introduces no second definition of a centre, invariant, blowup or resolution tower. The associated [packet](../packets/AlgebraicModuliForArithmeticGeometry--R09.7c.json) records the import hashes and the remaining supplier contracts. Coverage is **planned**. No target is claimed implemented or closed.

## Conventions and dependencies

Let $k$ be a field of characteristic zero. Ambient schemes are smooth, quasi-compact and of finite type over $k$. A coherent ideal is represented by Mathlib's native `AlgebraicGeometry.Scheme.IdealSheafData`. Schemes and ideal pullbacks remain the native ones throughout. A finite-type hypothesis together with quasi-compactness supplies the Noetherian setting used for coherent ideals, finite boundary families and closed bad loci. No algebraically closed or rational-point hypothesis is imposed.

An SNC boundary is a finite family of smooth effective Cartier hypersurfaces with chronological labels. Locally in étale coordinates, distinct incident component germs have distinct coordinate equations. A label whose strict transform disappears remains in the history with empty support. A permissible centre is a closed smooth centre which, together with the incident boundary, has simultaneous coordinate equations and satisfies the marked-ideal cosupport/divisibility condition. Centres may be contained in boundary components. For the smooth-pair cleanup theorem, the input strict transform is smooth and no incident boundary component contains it locally; this is a separate noncontainment hypothesis on the pair.

The chronological tower has ambient spaces $M_0,\ldots,M_N$, centre ideals on $M_i$, and specified ordinary blowups $M_{i+1}\to M_i$. Its composite is denoted $p_N:M_N\to M_0$. The initial boundary is empty for principalization and for the reduced embedded-resolution theorem. The smooth-pair theorem has its explicitly prescribed boundary. General boundary principalization is not inferred by silently changing the empty-boundary hypothesis.

Write `R09.7/name` for `AlgebraicModuliForArithmeticGeometry:R09.7/name`, and similarly for `R09.7a/name`. Ownership is as follows.

| Stage target | Canonical owner |
| --- | --- |
| Globally compatible permissible centres | `R09.7/global-centres` |
| Finite termination, including the monomial case | `R09.7/termination` |
| Principalization with invertible SNC total ideal | `R09.7/principalization` |
| Embedded resolution | `R09.7/embedded-resolution` |
| The resolved open of a smooth pair | `R09.7/resolved-locus` |
| Cleanup preserving that open | `R09.7/preserve-resolved-points` |
| Resolution compatible with local isomorphisms | `R09.7/local-isomorphism-resolution` |
| Principalization with a native finite witness | `R09.7a/principalization-tower-output` |
| Embedded resolution with specified strict transforms | `R09.7a/embedded-tower-output` |

The eleven direct supporting owners are `R09.7/invariant-properties`, `monomial-data`, `monomial-decrease`, `hs-stabilization`, `hs-semicoherence`, `recursive-invariant`, `regular-coordinates`, `snc-boundary`, `permissible-centre`, `controlled-transform`, and `R09.7a/finite-blowup-tower`. Their accepted graphs retain the definitions, maximal-contact/coefficient constructions, Hilbert–Samuel presentations and exceptional history needed by these results. In particular, Hilbert–Samuel stabilization is a theorem about functions realized by formal ideals in bounded embedding dimension. It is not well-foundedness of all functions from natural numbers to natural numbers.

Three external interfaces remain explicit. **StableReduction Layer 4** owns ordinary Rees/relative-Proj blowups, their universal property, projectivity, complement isomorphism, exceptional ideal, strict transform, charts and flat base change. Its arithmetic-surface resolution theorem is not the higher-dimensional characteristic-zero theorem needed here. **SchemeAndStackFoundations:SF.0** supplies the residual local algebra, completion and Jacobian comparisons, local smooth embeddings and scheme open gluing. `SF.0/jacobson-finite-type` and `SF.0/etale-coordinates` are exact target pointers for two portions of that interface; they do not settle its whole comparison/gluing contract. **SchemeAndStackFoundations:SF.3** supplies the remaining additive Cartier-divisor/ideal-product dictionary on unrestricted schemes, using the existing native effective-Cartier predicate. These are inherited supplier requests, with the precise consumers recorded in the packet.

At the pinned baseline, Mathlib supplies ideal data, `IdealSheafData.comap`, its identity and composition laws, `Scheme.Hom.ker`, `Smooth`, `IsProper`, `IsReduced` and `Scheme.Hom.smoothLocus`. For a quasi-compact morphism, the native kernel ideal agrees with section kernels. This matters when forming scheme-theoretic strict-transform closures; Noetherian opens give the required quasi-compactness here. The smooth locus is available for a locally finitely presented morphism. Its identification with the regular locus over a characteristic-zero field belongs to the imported geometric endpoint assertion.

Current Tau Ceti also has `Scheme.IdealSheafData.IsEffectiveCartier` on arbitrary schemes and affine blowup charts in `TauCeti/AlgebraicGeometry/Blowup/AffineCharts.lean`. Reuse those developments. The chart open immersions `affineBlowupι`, their covering theorem `iSup_opensRange_affineBlowupι`, and `affineBlowupι_toSpecZero` do not themselves supply a global maximum-centre algorithm or a finite resolution tower. The packet distinguishes these current-library observations from declarations at the pins. AlgebraicVectorBundles supplies general sheaf/module interfaces; it does not own the resolution targets above.

## Selecting and gluing the centres

The input is the full invariant from R09.7b, including the Hilbert–Samuel first entry, residual orders, counts of old exceptional components and their birth history. Its usual shape is

$$
\operatorname{inv}(a)=(H_a,s_1(a);\nu_2(a),s_2(a);\ldots;\nu_{t+1}(a)),
$$

with terminal entry zero or infinity. Equality strata are controlled by semicoherent local presentations. They and the boundary are simultaneously unions of coordinate subspaces. The construction must use this whole word; multiplicity alone does not specify the centre.

For each year, associate to a boundary subset its bit sequence in birth order and order those sequences lexicographically. If $Z$ is an irreducible component of the invariant equality stratum at $a$, label it by the set of boundary hypersurfaces containing it. Let $J(a)$ be the greatest such label and extend the invariant to $(\operatorname{inv}(a),J(a))$. This selects the smooth component specified by the source. It is not a choice of an arbitrary irreducible component independently on each chart.

Let $S$ be the quasi-compact closed unresolved locus for the chosen variant. Use the union of the loci of **all maximal attained values** of the extended invariant on $S$. Hilbert–Samuel functions are partially ordered pointwise; there need not be a greatest attained value. Local finite-valued semicontinuity and quasi-compactness give finitely many maximal values. Their selected strata are closed, smooth and mutually disjoint, so their union is a closed smooth centre. It is permissible for the current marked presentations and boundary.

The construction produces centre **ideals**, not only a collection of points. On a chart bounded by an invariant value, take the regular equations of the selected smooth coordinate-stratum component. Presentation equivalence and history compatibility identify these ideal sheaves on overlaps. Glue their reduced closed subschemes and prove compatibility with the ordinary blowup construction. Numerical comparisons in the source are made on closed points. Finite-type schemes over a field are Jacobson; the coherent local equations and closed rank conditions extend the assertions to the full scheme. Merely closing an arbitrary set of numerically selected points is not the construction.

The inherited API consists of:

- `maximumCentre_local`: on an invariant-bounded neighbourhood, the centre is the selected smooth coordinate-stratum component.
- `maximumCentre_closed`: the finite union of maximal extended strata in the prescribed closed unresolved locus is closed and permissible.
- `maximumCentre_localIso`: a local isomorphism preserving the labelled history identifies the centre ideals.

These operations supply each next blowup and the overlap comparisons used in the global tower. The source is Bierstone–Milman, Remarks 1.15–1.16, pp. 220–221; Remarks 10.3 and the algorithm, pp. 284–285; Theorem 11.14, pp. 290–291. The closed-point convention is on p. 213.

The three inherited tests are:

1. **`maximum_is_not_multiplicity`.** For $x_3^2-x_1^2x_2^3$ in year zero, the full maximum centre at the origin is the origin. The multiplicity-two locus contains the coordinate axes in the plane $x_3=0$. A definition using only that first multiplicity would choose too much.
2. **`maximum_incomparable_union`.** On a disjoint union realizing two incomparable maximal Hilbert–Samuel first entries, retain both maximal extended loci. Do not implement a “greatest value” operation which discards one component. Pointwise comparison is essential: for example the Artin algebras $k[x,y,z]/(x,y,z)^2$ and $k[u,v]/(u^2,uv,v^4)$ have cumulative functions $(1,4,4,4,\ldots)$ and $(1,3,4,5,5,\ldots)$, which are incomparable. These numerical functions illustrate the ordering issue; the test applies when the selected variant's unresolved locus realizes the two maximal values.
3. **`maximum_empty_unresolved`.** If $S$ is empty, stop with no next centre or blowup. Taking the maximum of an empty value set must not create a step.

**Check.** Prove the ideal-level overlap equality, disjointness for different maximal values, smoothness, boundary permissibility and containment in $S$. A centre that is only set-theoretically compatible does not pass.

## Strict decrease and finite termination

`R09.7/termination` applies to the quasi-compact finite-type characteristic-zero inputs above. The selected maximum-centre procedure ends after finitely many blowups, with the chosen unresolved locus empty. Its proof imports `invariant-properties`, `hs-stabilization` and `monomial-decrease`.

There are two terminal cases. At terminal infinity the relevant invariant stratum is smooth, and blowing it up strictly lowers the word above the centre. At terminal zero the remaining presentation is monomial. Write its weights as nonnegative rationals $\Omega_H$, with one common bounded denominator arising from its mark. The cosupport condition is

$$
\sum_{H\ni a}\Omega_H\geq 1.
$$

A minimal boundary subset $I$ defining a centre satisfies

$$
\sum_{H\in I}\Omega_H\geq1,
\qquad
\sum_{H\in I}\Omega_H-1<\Omega_i\quad(i\in I).
$$

On a pivot chart, the new exceptional weight is $\sum_I\Omega_H-1$. If the full word stays equal, this new weight is strictly less than the replaced pivot weight. Consequently the auxiliary monomial mass $\mu$, the sum of weights through the point, strictly decreases. With denominator fixed after stabilization, this is a discrete descent. For instance two weights $3/5,3/5$ give new weight $1/5$; an upper bound for the new mass is $4/5<6/5$. This check uses a minimal subset. An arbitrary coordinate intersection does not supply the strict inequality.

The decrease is for the augmented invariant $(\operatorname{inv},\mu)$ over the selected centre. One must not assert that multiplicity, every residual order, or the bare invariant word strictly drops at every step. The allowed invariant words first stabilize by the imported Hilbert–Samuel and bounded-denominator results. Equal-word monomial descent then rules out an infinite continuation. The source's finite-value and quasi-compact global argument turns these local drops into a finite maximum-stratum algorithm, including the finitely many incomparable maximal values. Finiteness at each individual year alone is not the termination proof.

The locators are Theorem 1.14(2),(4), p. 220; the monomial proof, pp. 259–260; the global algorithm, pp. 284–285; and the proof of Theorem 11.14, p. 291. The Hilbert–Samuel stabilization supplier remains `R09.7/hs-stabilization`, whose accepted source is Bierstone–Milman (1989), Theorem 5.2.1, pp. 820–821. That accepted input is imported rather than extracted again here.

**Check.** Exhibit the monomial strict inequality when the word is constant, retain its denominator bound, and identify the use of quasi-compactness in the global argument. Noncompact analytic spaces and their locally finite towers are outside this finite algebraic assertion.

## Principalization and its finite output

Let $J\subseteq\mathcal O_M$ be coherent and nonzero at the generic point of **every** irreducible component of $M$. Starting with empty boundary, `R09.7/principalization` produces a finite sequence of smooth SNC-permissible blowups, all over $V(J)$. The composite is an isomorphism on $U=M\setminus V(J)$. On the endpoint the **total ideal** $J\mathcal O_{M_N}$ is invertible and locally has the form

$$
(u)\prod_H(x_H)^{a_H},\qquad a_H\in\mathbb N,
$$

where $u$ is a unit and the distinct incident $x_H=0$ are components of the final labelled SNC boundary. The weak transform is the unit ideal. The support is SNC, but the exponents need not be one.

Total, controlled, weak and strict transforms have different jobs. The total ideal is native pullback. A controlled transform with mark $d$ divides that pullback by the new exceptional ideal to power $d$. The weak transform divides by the actual generic exceptional order. The strict transform is saturation, or equivalently closure of the inverse image away from the centre in the present Noetherian setting. Neither a unit controlled transform nor a reduced SNC support may replace the total-ideal assertion.

Generic nonvanishing ensures that $U$ is dense in every component. If $J$ vanishes identically on a nonempty component, its pullback at that component's generic point remains zero, which is not an invertible divisor ideal. The zero ideal is therefore excluded. For the unit ideal the correct output has length zero and empty boundary.

`R09.7a/principalization-tower-output` packages the actual witness as a `PrincipalizationTower`, over the `BlowupTower` already owned by R09.7a. Store every centre and ordinary blowup identification, smoothness and coordinate permissibility, all total/weak transform relations, the surviving and newly born boundary ideals, endpoint monomial equations and the isomorphism over $U$. Tower length is the finite termination witness. Its composite must agree with the pullback used in the total ideal.

Exponents are local data attached to actual boundary components. If a prototype instead uses one global exponent for a label born from a disconnected smooth centre, split it into its finitely many disjoint connected components before filling that record. Retain comparison with the algorithm's original grouped centre. Such splitting does not silently change the canonical grouping of the algorithm, and an existence certificate is not by itself its canonicity theorem.

The four inherited API items are:

- `PrincipalizationTower.totalIdeal`: the stored total ideal is exactly $J$ pulled back along the tower composite.
- `PrincipalizationTower.weakIdeal`: the endpoint weak ideal is the unit ideal.
- `PrincipalizationTower.preservedOpen`: the tower composite restricted over $M\setminus\operatorname{Supp}(\mathcal O_M/J)$ is an isomorphism.
- `PrincipalizationTower.ofUnit`: the unit ideal has the identity tower and empty boundary.

They serve the closed-complement principalization used by the compactification interface. The three inherited tests are:

1. **`PrincipalizationTowerTests.unit`.** `ofUnit` has length zero, identity composite and empty boundary.
2. **`PrincipalizationTowerTests.coordinateMonomial`.** On $\mathbb A^2_k$, a valid certificate for $(x^2y^3)$ blows up the Cartier centres $(x)$, then $(y)$. Both ambient morphisms are canonically isomorphisms, but the final labelled boundary has the $x$- and $y$-components. The total exponents are $2,3$ and the weak ideal is a unit. This tests a valid finite certificate, without claiming these are the selected canonical algorithm's exact steps.
3. **`PrincipalizationTowerTests.nativePullback`.** For every output $P$, its total ideal equals the native pullback of $J$ along the endpoint-to-base morphism. Iterating the one-step pullbacks gives the same ideal by `IdealSheafData.comap_comp`, in its contravariant order.

An additional chart calculation checks the multiplicity bookkeeping. In the $x$-chart of the blowup of the origin, set $x=u,\ y=uv$. Then $x^2y^3=u^5v^3$. Passing to reduced support would lose both exponents. The suggested file states this elementary polynomial identity using the existing substitution homomorphism.

The sources are Theorem 1.10, pp. 216–217; Remark 1.18, p. 225; and the ideal-invariant and terminal monomial construction in §6, pp. 254–260. The output witness uses the finite sequence in §10, pp. 283–287.

**Check.** Produce the sequence, the native pullback equality, the unit weak transform and the local integer monomial factorization. Keep the nonvanishing and empty-initial-boundary hypotheses visible.

## Embedded resolution and strict transforms

Let $X\hookrightarrow M$ be reduced and closed, with $M$ as above and empty initial boundary. `R09.7/embedded-resolution` gives a finite sequence of smooth invariant-admissible permissible centres. The endpoint strict transform $X_N$ is smooth, and $X_N$ and the exceptional boundary are simultaneously coordinate subspaces and hyperplanes. The centres lie over the original singular locus, so $X_N\to X$ is proper and an isomorphism over $\operatorname{Reg}(X)$.

For the source's nonreduced extension, the conclusion is that $(X_N)_{\mathrm{red}}$ is smooth, its Hilbert–Samuel function is locally constant and its reduction meets the boundary with simultaneous normal crossings. This does not imply that $X_N$ itself is smooth; it can also be empty. A doubled point therefore cannot be used to infer removal of nilpotents while retaining the same nonempty strict transform. The finite native `EmbeddedTower` in this part has a reduced input.

`R09.7a/embedded-tower-output` retains each closed immersion $X_i\hookrightarrow M_i$ and the next strict-transform map. Define $X_{i+1}$ as the scheme-theoretic closure in $M_{i+1}$ of the inverse image of $X_i\setminus C_i$. Its defining ideal is the native kernel ideal of that open inverse-image morphism to $M_{i+1}$. Store the commuting square relating the strict-transform map and ambient blowup, then compose those squares to identify the endpoint map. A total inverse image cannot replace this closure.

The output includes smoothness of $X_N$, the expected smooth codimensions of every boundary-subset intersection on it, properness of its map to $X$, and the original-regular-open isomorphism. It also imports the smooth-pair resolved-open variant and the whole-tower local-isomorphism comparisons described below. Each centre must have coordinate permissibility, in addition to its own smoothness and the SNC condition on the ambient boundary.

The four inherited API items are:

- `EmbeddedTower.strictIdeal`: the next strict ideal is the kernel ideal of the open inverse-image composite to the new ambient scheme, including its scheme structure.
- `EmbeddedTower.square`: the next closed immersion followed by the ambient blowup equals the strict-transform map followed by the preceding closed immersion.
- `EmbeddedTower.smoothEndpoint`: the endpoint is smooth and every incident boundary-subset intersection has its expected smooth codimension.
- `EmbeddedTower.preservedOpen`: the endpoint map is an isomorphism over $\operatorname{Reg}(X)$; for the smooth-pair variant it preserves the specified resolved open.

These provide a usable resolution witness to R09.7d. The inherited tests are:

1. **`EmbeddedTowerTests.identity`.** A smooth closed $X\hookrightarrow M$ with empty boundary has the identity output, strict transform $X$, and identity map to $X$.
2. **`EmbeddedTowerTests.avoidsCentre`.** If $X_i$ misses a centre, its next strict transform is its full inverse image and maps isomorphically to $X_i$.
3. **`EmbeddedTowerTests.containsCentre`.** If $X$ is the origin in $\mathbb A^2$ and the ambient space is blown up there, the strict transform of $X$ is empty, while the total inverse image is the nonempty exceptional projective line. This is a strict-transform test on a specified blowup, not a claim that the canonical resolution chooses a centre on an already smooth zero-dimensional input.

For a reduced cusp $y^2=x^3$, the first chart $x=u,y=uv$ gives total equation $u^2(v^2-u)$ and strict equation $v^2-u$. The strict curve is smooth but tangent to the exceptional component $u=0$. Blow up that point with $v=t,u=tw$; the strict curve is $w=t$. It now passes through the crossing of the two boundary components $t=0,w=0$. A third point blowup separates it from that crossing and gives the required simultaneous SNC pair. This example detects both stopping as soon as the strict curve is smooth and checking each boundary component separately without checking their joint intersection. All three centres lie over the cusp's singular origin.

The source locators are Proposition 11.4, p. 288; Propositions 11.9 and 11.11, p. 289; Proposition 11.13, p. 290; and Theorem 11.14 with its proof and following paragraph, pp. 290–291. The closed bad locus for the nonreduced theorem combines failure of local Hilbert–Samuel constancy with singularity of the reduction. The resolution proof then performs the specified old-boundary cleanup. It does not deduce embedded resolution by forgetting exceptional factors from an arbitrary principalization output.

**Check.** Retain the actual iterative strict transforms, all commuting squares, the prescribed-open identification and SNC at the endpoint. Smoothness of the endpoint alone does not pass.

## The resolved open and cleanup of smooth pairs

Let $X\subseteq M$ be smooth. Let $E$ be a labelled ambient SNC family with distinct incident germs, none containing $X$ locally. Define the **resolved locus** on $X$ to consist of points admitting simultaneous coordinate-subspace equations for $X$ and distinct coordinate-hyperplane equations for the incident members of $E$.

For every subset $\Lambda$ of incident boundary labels, form

$$
X_\Lambda=X\cap\bigcap_{H\in\Lambda}H.
$$

At a resolved point it is smooth of codimension $|\Lambda|$ in $X$, whenever nonempty. Conversely all these expected-codimension smoothness conditions imply simultaneous normal crossings. The empty subset is included. Requiring only the individual restrictions to be smooth misses coincident restrictions and higher intersection defects.

The unresolved set $\Sigma^*$ is the finite union, over boundary subsets, of loci where

$$
\operatorname{edim}(X_\Lambda,a)>\dim(X,a)-|\Lambda|.
$$

Here the defining ideal carries its scheme structure. Jacobian rank conditions detect improper, nonreduced or coincident restrictions as well as ordinary tangency. The dimension of smooth $X$ is locally constant, so these rank-defect loci are closed. Thus the resolved locus is open.

The three inherited API items of `R09.7/resolved-locus` are:

- `resolvedLocus_subsetCriterion`: the simultaneous-coordinate condition is equivalent to the expected smooth codimension for every boundary subset.
- `resolvedLocus_open`: the resolved locus is open and $\Sigma^*$ is closed.
- `resolvedLocus_restrict`: both loci commute with open restriction.

The source uses this locus to constrain every cleanup centre; compactification uses it to preserve a chosen smooth open. Its three tests are:

1. **`resolved_transverse_axes`.** For $X=M=\mathbb A^2$ with its two distinct coordinate axes as boundary, the origin is resolved: the two-divisor intersection has codimension two.
2. **`resolved_tangency`.** For $X=\{z=xy\}\subseteq\mathbb A^3$, $E=\{z=0\}$, the origin is unresolved. On $X\cong\mathbb A^2$, the single labelled ambient component restricts to $xy=0$, which is singular at the origin. The fact that its reduced support consists of coordinate axes does not make this one restricted component smooth.
3. **`resolved_empty_boundary`.** Every point of a smooth $X$ is resolved when $E$ is empty.

`R09.7/preserve-resolved-points` states that a finite sequence of permissible centres in the successive $\Sigma^*$ makes the pair simultaneous-SNC everywhere and is an isomorphism over every initially resolved point. This is stronger preservation than the original-regular-locus assertion: the smooth $X$ in the second test is regular everywhere, but its pair needs cleanup at the origin.

For the proof, restrict the boundary ideals to $X$, and factor each into an accumulated exceptional monomial and its proper residual ideal. Apply the ideal invariant to the product of residual ideals on the closed locus where their order exceeds the number of distinct proper residual ideals. This reaches distinct order-one residual divisors. Induct on dimension on those smooth divisors, using Lemma 12.7 to transfer transversality back to $X$. The residual exceptional factors still matter. Lemma 12.8 removes them using its stronger monomial procedure with centres among intersections of the **new** exceptional divisors, remaining inside $\Sigma^*$. Ordinary principalization of the residual product alone is not the pair theorem.

The source is Theorem 12.2, p. 292; Theorem 12.4 and Lemma 12.5, p. 293; the criterion in Remarks 12.6, p. 293; Lemmas 12.7–12.8 and the monomial proof, pp. 294–295; Example 12.9, pp. 295–296. Apply this cleanup after the singularity-removal phase in the empty-boundary embedded theorem. The two preservation assertions retain their different input opens.

**Check.** In Example 12.9, $X=\{z=xy\}$, the first centre is the origin. After that blowup the remaining bad locus is the intersection of the strict $X$, the old boundary transform and the new exceptional divisor. Blowing up that locus gives a simultaneous-SNC pair. Both steps avoid the initially resolved open. Merely pulling back $z=0$ or removing its multiplicity does not prove this result.

## Local isomorphisms and descent of the whole tower

`R09.7/local-isomorphism-resolution` removes the need for a global smooth embedding. Every reduced finite-type characteristic-zero scheme $X$ has a finite proper resolution $X'\to X$, an isomorphism over its regular locus. For an isomorphism of open subschemes $X|_U\cong Y|_V$, the corresponding resolution spaces over those opens are uniquely isomorphic over the given map. The comparison lifts through the entire specified towers, after deleting steps with empty centre on restriction. The smooth-pair refinement can be incorporated with its own hypotheses.

Local affine charts admit smooth ambient embeddings. The normalized invariant and its history are independent of this choice. Compare ambient isomorphisms first, then closed smooth ambient enlargements. Use the codimension normalization of `R09.7/recursive-invariant`; extra ambient coordinates cannot change the selected intrinsic centre by inserting unaccounted-for entries in the invariant word. The source provides these comparisons in Remarks 13.1, p. 296, and the proof of Theorem 13.2, pp. 297–298.

At each year identify the selected coherent centre ideals on overlaps. The ordinary blowup universal property supplies the induced comparison of the next spaces and the commuting square. Carry the strict transforms and boundary labels across that square. Scheme open gluing and induction then construct the global sequence. Unique lifts give the identity, composition and triple-overlap cocycle laws; record these through the sequence rather than deducing an unspecified endpoint equivalence. Theorem 13.2(2), pp. 297–298, states the local-isomorphism and whole-tower conclusion.

Open restriction of a length-$N$ native tower initially keeps all $N$ years. A centre missing the open becomes the unit ideal and its blowup is an identity. Remove precisely those empty-centre steps for comparison with the locally selected sequence, while retaining the surviving chronological labels and their comparison with the original labels. Do not remove a nonempty Cartier-centre step just because its ambient blowup is an isomorphism: it still creates a nonempty exceptional label, as the principal monomial certificate shows. Restricting twice must agree with restriction to the intersection under the canonical pullback comparisons.

**Check.** Verify ambient-embedding independence, centre-ideal equality, all commuting blowup and strict-transform squares, open restriction with empty-step reindexing, and coherent identity/composition/cocycle laws. The result is compatibility with isomorphisms between open subschemes. Theorem 13.2 is not cited for arbitrary smooth-morphism or arbitrary base-change functoriality. Flat base change of an individual ordinary blowup is a different supplier fact.

## Acceptance boundary and suggested statements

This part imports nine target nodes: one definition, three constructions and five theorems. Their four object/construction interfaces have fourteen API items and twelve tests, all specified above. The inherited planets are **Embedded resolution of singularities**, **Principalization tower**, and **Embedded resolution tower**. The supporting finite-tower and local-invariant planets keep their existing stage ownership. No additional planet or mathematical node is introduced here.

The definitive specification includes all centre ideals, permissibility conditions, transform equations, SNC subset conditions, finite witnesses and comparison maps. The compact [suggested Lean file](../suggested/AlgebraicModuliForArithmeticGeometry--R09.7c.lean) follows the fixed WORKERS shape: it states the native proper smooth resolution consequence, plus a few chart and pullback checks over existing carriers. It contains no substitute data definitions for unavailable towers, invariants or SNC geometry. That endpoint consequence is weaker than the full imported target, and elaborating its signature is not a proof of resolution or of the tower interface.

The remaining implementation work is to discharge the inherited blowup/local-algebra/Cartier suppliers; populate and prove the two finite outputs from the selected algorithm; prove the smooth-pair preserved-open variant; and construct unique, coherent whole-tower comparisons with empty-step deletion. R09.7d consumes those results for compactification and boundary interfaces. Finite covers, meridians, stable-curve boundaries and Borel extension are not additional targets of R09.7c.

## Source

Edward Bierstone and Pierre D. Milman, [*Canonical desingularization in characteristic zero by blowing up the maximum strata of a local invariant*](https://mahalex.net/teaching/seminars/gabber/Bierstone-Milman%20Canonical%20desingularization%20in%20characteristic%20zero.pdf), *Inventiones mathematicae* **128** (1997), 207–302. All locators above use printed pages of the full article. The short arXiv version does not supply the proofs of the final embedded, smooth-pair and local-isomorphism theorems. The packet records the public PDF's hash and the passages read. The accepted Hilbert–Samuel stabilization supplier retains its separate 1989 reference; this part makes no fresh reading claim for that article.
