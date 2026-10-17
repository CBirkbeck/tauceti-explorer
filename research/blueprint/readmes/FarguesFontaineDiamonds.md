# Foundations of adic spaces, Part II: the Fargues–Fontaine curve as a diamond

This roadmap starts with the actual fixed-field Fargues–Fontaine adic curve of
[AdicSpaces, Layer 6](../../../content/tau-ceti/AdicSpaces/README.md#layer-6-the-adic-farguesfontaine-curve).
It adds the diamond comparison, the induced étale-site and sheaf-descent
comparisons, and the analytic interpretation of a marked untilt as a closed
Cartier divisor. Its final layer applies the enhanced coefficient theory after
that theory exists. The first geometric endpoint is F3: the curve constructed in
the adic roadmap has a specified locally spatial diamond with the same étale and
finite étale sites. The construction does not require a classification of vector
bundles or a moduli stack of bundles.

The accepted RS-20 ownership decisions govern this document. AdicSpaces supplies
the Witt period ring, its Huber-pair topology, interval annuli, wandering windows
and the actual adic quotient. PerfectoidSpaces P1 supplies marked untilts and
primitive kernels. DiamondsAndVStacks D6 supplies the general analytic adic-space
diamond functor and its site comparison. This document constructs their
fixed-field comparisons and applications. The generic Cartier criterion belongs
to AdicSpacesPartII R0, and the early integral recognition bridge belongs to
PerfectoidQuotients Q0. Those precise extensions are requests in the packet;
there is no second definition of their objects here.

## Conventions and imported objects

Fix a prime p and a complete nonarchimedean perfectoid field F of characteristic
p and rank one. Write O_F for its valuation ring and S=Spa(F,O_F). F need not be
algebraically closed. Choose a nonzero topologically nilpotent varpi in O_F. The
initial ring is A_inf=W(O_F), with the (p,[varpi])-adic topology and the complete
Huber pair specified by the anchor. The initial ring is not replaced by its
p-inversion. The generic analytic period domain is

\[
Y=D(p)\cap D([\varpi])=D(p[\varpi]),\qquad
q:Y\longrightarrow X=Y/\varphi_Y^{\mathbf Z}.
\]

D(p) and D([varpi]) mean loci where the corresponding valuations do not vanish.
Their intersection is the complement of the zero locus of the product. The
larger union is the analytic locus containing the characteristic-p boundary and
is not Y. An auxiliary chart of D([varpi]) is used only to prove the norm estimate
in F4; the fixed curve in this document always uses the generic intersection.

The absolute Frobenius phi_S of S comes contravariantly from x↦x^p on F. The
anchor's phi_Y comes contravariantly from Witt Frobenius, by precomposition of
valuations. Its radius is kappa=log|[varpi]|/log|p|, evaluated on rank-one
generalizations, with kappa(phi_Y x)=p kappa(x). The diamond comparison must
intertwine these positive generators. Replacing both actions by their inverses
would give the same orbit sets and conceal an incorrect generator convention.

A point of Y^diamond on a characteristic-p perfectoid test T is the isomorphism
class of a marked untilt (T^sharp,iota) and an adic map T^sharp→Y. Its Q_p
structure is part of the data induced by that map. The tilt marking iota is kept
until the Frobenius calculation has been made. All maps of pairs are continuous
and preserve the specified plus subrings. A unit condition in a Tate ring is not
a unit condition in its plus subring. The algebraic sharp map is multiplicative;
it is not treated as an additive ring map.

For sites, use the public KL15 Definitions 8.2.16 and 8.2.19 convention cited by
ECD v4: finite étale maps are affinoid-locally finite étale ring extensions with
plus ring the integral closure of the base plus ring; étale maps are locally an
open immersion, a finite étale map and an open immersion. Covering families are
set-theoretically surjective families, using the universal-surjectivity
convention for preadic spaces. On an actual adic space the underlying-space
criterion agrees. D6's packet predates this public citation and must be checked
against this convention, rather than importing an unexamined Huber convention
merely because the names agree.

Declaration names below use the namespace TauCeti.FFDiamond. Every declaration is a plan with implementation status unchecked. The
packet is a complete target-level pass: all six stages are planned, and none is
closed. A complete pass can retain named requests and precise proof gaps. The
boundary theorem in F4 is such a gap. Statements using it describe the theorem
to be proved and the reduction to that input; they do not certify that the
read source proves the omitted classical step.

## Baseline and supplier contracts

The baseline is Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174 and Tau Ceti
f790474821cf4256814db967cb154e7af3d0c369. No reviewed F0–F5 audit entries appear in
data/library-coverage.json. The declaration index and source statements were
therefore checked directly. No claim of an already formalized fixed-field
comparison is made.

Mathlib supplies coefficientwise Witt maps, algebraic Fontaine theta and its
Teichmuller evaluation, and Witt Frobenius as an equivalence for a perfect ring
of characteristic p. Its theta requires a commutative ring, prime p, nonunit p
and separated p-adic completeness. It does not supply the continuity,
plus-ring boundedness or principal primitive kernel needed here. Those are P1
interfaces. Tau Ceti's pinned theorem that all Spa points of a Tate ring are
analytic applies chartwise; it does not construct Y or X. Mathlib's bundled
categorical equivalence, including its triangle identity, is used directly.

| Contract | Owner used here | Boundary of the import |
| --- | --- | --- |
| Period domains, actual wandering-chart maps, radius and q | AdicSpaces Layer 6 | Import all; prove only comparison interfaces and categorical relation here. |
| Analytic Yoneda-adic embedding and fibre products | AdicEtaleGeometry A1 exact nodes | Do not infer fibre products from a purely topological quotient. |
| Bounded theta, integral tilts, marked untilts, primitive kernels | PerfectoidSpaces P1 exact nodes | Algebraic Mathlib theta is the baseline implementation to which P1 compares. |
| Rational perfectoid localizations and tilted slices | PerfectoidSpaces P2 exact nodes | Pull back untilts in the appropriate perfectoid slice. |
| General diamond functor and étale sites | DiamondsAndVStacks D6 exact nodes | Apply the general result; the torsor-tower proof stays with D6. |
| Effective sheaf quotients, descent and local morphism classes | DiamondsAndVStacks D0/D3/D4 exact nodes | The orbit quotient is a sheaf quotient, with locally varying labels on tests. |
| Integral chart recognition | PerfectoidQuotients Q0 request; P1 inversion theorem | Use the early algebraic contract, without importing animated quotients. |
| Closed adic subspaces and Cartier criterion | AdicSpacesPartII R0 exact node and request | The criterion must check all rational affinoids. |
| Split completed base change | AdicSpacesPartII R0/R5 exact nodes | Use ordinary completion with the continuous retraction. |
| Enhanced left-completed étale theory | DiamondEtaleCohomology C2 request | Used only in F5, including coherent truncation limits. |
| Adic coefficient systems | AdicCoefficientsAndComparisons L0 request | Used only in F5 with derived completion and finite-level reduction. |

The exact cross-roadmap node IDs, their consuming declarations and the requested
statements are listed in the packet. Some supplier packets are drafts or retain
review findings, so their IDs identify mathematical contracts rather than proven
Lean interfaces. In particular, the restricted separated-pro-étale descent result
for perfectoid bases alone is insufficient for finite covers over an arbitrary
diamond; F3 uses the v-local finite étale criterion after sheaf descent.

## Order of development

F0 supplies the structural and category interfaces. F1 identifies the fixed
period domain with S×Spd Q_p. F2 checks the chosen Frobenius generator and the
effective quotient presentation. F3 gives the étale sites and descent categories.
F4 uses F1 and F2 together with the analytic root-annulus argument to produce
closed untilt divisors. F5 uses F3 after C2 and L0 exist. There is no coefficient
or six-operation dependency in F0–F4.

The general relative curve is a consumer. RF0:annuli uses the fixed-field product
seed, RF1 the quotient and site comparison, and RF3 the analytic divisor seed.
This packet has no prerequisite from RelativeFarguesFontaine. It constructs no
ramified Witt coefficients and no curve over an arbitrary perfectoid base. The
fixed-field root-extension frame in F4 is enough for its estimate and does not
rebuild the relative curve or the anchor's sheafiness proof.

## F0. Reuse the actual adic objects

The objects remain those of the anchor. A rational annulus must be retained
as a complete topological ring with its integral subring and actual map to the
ambient adic space. A homeomorphism of underlying spaces does not provide the
D6 input. The first declarations check analyticity and scalar structure; the
next two check the chosen category and the identity/composition of choice
transport. General products enter through A1's analytic Yoneda-adic category,
which contains the anchor's sheafy objects fully faithfully.

### The analytic fixed-field interface

Identifier: `FarguesFontaineDiamonds:F0/analytic_interface`. Kind: **theorem**.

Y and X are analytic adic spaces over Spa(Z_p,Z_p). Every imported interval chart has its complete Hausdorff Tate ring B^I, plus subring B^{I,+} equal to the prescribed integral closure inside the power-bounded elements, and the structural ring maps from Z_p are continuous and bounded. The analytic open Y is D(p) ∩ D([varpi]) = D(p[varpi]), inside the unlocalized (p,[varpi])-adic Witt pair.

Proposed declaration: `TauCeti.FFDiamond.analytic_interface`.

Hypotheses and conventions:

- p is prime; F is a complete rank-one characteristic-p perfectoid field; S = Spa(F, O_F).
- Y, X, q, Frobenius and interval pairs are the actual objects and maps supplied by AdicSpaces Layer 6.

Construction and proof:

1. Apply the anchor’s actual chart isomorphisms and plus-ring descriptions; on a chart a power of p or [varpi] is a topologically nilpotent unit.
2. Apply the pinned Tate-ring analytic-point theorem on those charts, then glue the Z_p maps. X inherits the same maps on wandering charts.

Acceptance:

- A valuation with p=0 is outside Y even when [varpi]≠0.
- No initial replacement of W(O_F) by W(O_F)[1/p].

Direct prerequisites: `tauceti:TauCetiRoadmap/AdicSpaces#layer-6-the-adic-farguesfontaine-curve`, `tauceti:TauCeti.ValuationSpectrum.spaAnalytic_eq_spa_of_isTateRing`, `tauceti:TauCeti.ValuationSpectrum`.

Sources: [FS](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), II.1.1, pp.47–48; II.1.15–16, pp.54–55; [SW](https://people.mpim-bonn.mpg.de/scholze/Berkeley.pdf), Lecture 13, Proposition 13.1.1 and proof, pp.108–109; Definition 13.5.1, p.112.

Proposed library: module `TauCeti/AlgebraicGeometry/FarguesFontaine/DiamondComparison`, namespace `TauCeti.FFDiamond`.

### The Q_p structural factorization

Identifier: `FarguesFontaineDiamonds:F0/qp_factorisation`. Kind: **theorem**.

The structural morphisms Y → Spa(Z_p,Z_p) and X → Spa(Z_p,Z_p) factor uniquely through Spa(Q_p,Z_p). On every rational chart p is invertible and the extended Q_p ring homomorphism is continuous, carries Z_p into B^{I,+}, and agrees on overlaps; q and Frobenius are over Spa(Q_p,Z_p).

Proposed declaration: `TauCeti.FFDiamond.qp_factorisation`.

Hypotheses and conventions:

- p is prime; F is a complete rank-one characteristic-p perfectoid field; S = Spa(F, O_F).
- Y, X, q, Frobenius and interval pairs are the actual objects and maps supplied by AdicSpaces Layer 6.

Construction and proof:

1. Extend the structural ring map by the localization universal property because p is invertible on Y. Check continuity using the chart topology and boundedness on Z_p.
2. Glue and descend through the Z_p-linear Witt Frobenius and the anchor’s quotient chart maps; use uniqueness to prove the triangles.

Acceptance:

- p inverse maps to the actual inverse in each B^I.
- A characteristic-p untilt does not define a point of Spd Q_p.

Direct prerequisites: `FarguesFontaineDiamonds:F0/analytic_interface`, `tauceti:TauCetiRoadmap/AdicSpaces#layer-6-the-adic-farguesfontaine-curve`.

Sources: [FS](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), II.1.1, pp.47–48; II.1.15–16, pp.54–55.

Proposed library: module `TauCeti/AlgebraicGeometry/FarguesFontaine/DiamondComparison`, namespace `TauCeti.FFDiamond`.

Atlas planet: **The Q_p structural morphism**.

### Chart morphisms in the adic comparison category

Identifier: `FarguesFontaineDiamonds:F0/chart_category_interface`. Kind: **theorem**.

The imported maps U_n,V_n → Y, q:Y→X, and the isomorphisms U_n ≅ q(U_n), V_n ≅ q(V_n) are morphisms in the analytic adic category used by D6. The comparison with analytic Yoneda-adic spaces is fully faithful on these sheafy objects, preserves these open restrictions, and computes the analytic fibre products needed for q’s relation.

Proposed declaration: `TauCeti.FFDiamond.chart_category_interface`.

Hypotheses and conventions:

- p is prime; F is a complete rank-one characteristic-p perfectoid field; S = Spa(F, O_F).
- Y, X, q, Frobenius and interval pairs are the actual objects and maps supplied by AdicSpaces Layer 6.

Construction and proof:

1. Use the supplier’s fully faithful embedding on sheafy analytic adic spaces.
2. Transport the anchor’s actual locally valued ringed-space isomorphisms, not just their topological homeomorphisms. Compute products in the sheaf category and retain comparison maps to sheafy local charts.

Acceptance:

- The chart maps preserve O^+ and residue valuations.
- The relation’s products are supplied even though the anchor does not build general fibre products.

Direct prerequisites: `FarguesFontaineDiamonds:F0/qp_factorisation`, `tauceti:TauCetiRoadmap/AdicSpaces#layer-6-the-adic-farguesfontaine-curve`, `AdicEtaleGeometry:A1/adic-spaces-in-yoneda-adic-spaces`, `AdicEtaleGeometry:A1/yoneda-adic-fibre-products`.

Sources: [ECD](https://arxiv.org/pdf/1709.07343v4), Definition 15.5; Lemma 15.6 and proof, pp.91–92.

Proposed library: module `TauCeti/AlgebraicGeometry/FarguesFontaine/DiamondComparison`, namespace `TauCeti.FFDiamond`.

### Transport of the fixed-field interfaces

Identifier: `FarguesFontaineDiamonds:F0/choice_transport`. Kind: **theorem**.

For two pseudouniformizers varpi,varpi′, the anchor’s canonical Y and X isomorphisms intertwine q, Frobenius and the Q_p structural maps, preserve rational restrictions and satisfy identity/composition for three choices. Diamondification transports all these diagrams.

Proposed declaration: `TauCeti.FFDiamond.choice_transport`.

Hypotheses and conventions:

- p is prime; F is a complete rank-one characteristic-p perfectoid field; S = Spa(F, O_F).
- Y, X, q, Frobenius and interval pairs are the actual objects and maps supplied by AdicSpaces Layer 6.

Construction and proof:

1. Use the cofinality of (p,[varpi]) and (p,[varpi′]) topologies established by the anchor.
2. Uniqueness of structural factorization and identity on W(O_F) prove the compatibility; apply the functor supplied by D6.

Acceptance:

- Changing varpi twice agrees with the direct change.

Direct prerequisites: `FarguesFontaineDiamonds:F0/chart_category_interface`, `tauceti:TauCetiRoadmap/AdicSpaces#layer-6-the-adic-farguesfontaine-curve`, `DiamondsAndVStacks:D6/gluing-and-the-diamond-functor`.

Sources: [FS](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), II.1.1, pp.47–48; II.1.15–16, pp.54–55.

Proposed library: module `TauCeti/AlgebraicGeometry/FarguesFontaine/DiamondComparison`, namespace `TauCeti.FFDiamond`.

## F1. The untilt product formula

The central calculation is on affinoid test spaces, where the universal
property of a perfect Witt ring and theta give both directions. To map to Y,
p and [varpi] must be invertible in the untilt Tate ring, while the plus-ring
map must remain bounded. These conditions explain both product factors.
Proving only an algebraic bijection of untopologized homomorphisms would miss
the analytic map. Naturality uses the marked-untilt slice equivalence; it is
proved before the affinoid calculation is glued into a v-sheaf isomorphism.

### The bounded Witt–theta correspondence

Identifier: `FarguesFontaineDiamonds:F1/bounded_witt_theta`. Kind: **theorem**.

Let T=Spa(A,A^+) be a characteristic-p affinoid perfectoid test space with marked Q_p-untilt T^sharp=Spa(A^sharp,A^{sharp,+}). Continuous bounded maps W(O_F)→A^{sharp,+} whose [varpi] image is a unit of A^sharp are naturally in bijection with continuous bounded maps O_F→A^+ whose varpi image is a unit of A. In the forward construction from f, the map is theta_Asharp ∘ W(f), using the marking A^+ ≅ (A^{sharp,+})^flat. Both sides require the specified (p,[varpi])-adic/source and untilt-plus topologies. The inverse uses compatible p-power roots and reduction modulo p; it is not an assertion about all algebraic ring homomorphisms.

Proposed declaration: `TauCeti.FFDiamond.bounded_witt_theta`.

Hypotheses and conventions:

- p is prime; F is a complete rank-one characteristic-p perfectoid field; S = Spa(F, O_F).
- Y, X, q, Frobenius and interval pairs are the actual objects and maps supplied by AdicSpaces Layer 6.

Construction and proof:

1. Use perfectness of O_F for the continuous Witt lifting property, and the supplier’s topological theta and integral-tilt identification.
2. Check p and [varpi] are sent to topologically nilpotent elements of the plus ring, and that theta(W(f)([x]))=f(x)^sharp.
3. Use preservation of units by sharp and the marking to translate the open-locus condition. Construct the inverse and verify equality on all Teichmuller expansions by separated completeness.

Acceptance:

- The map on [x] is f(x)^sharp, not an additive sharp map.
- Invertibility is tested in A^sharp, not in A^{sharp,+}.

Direct prerequisites: `FarguesFontaineDiamonds:F0/qp_factorisation`, `PerfectoidSpaces:P1/witt-vectors-of-perfect-plus-ring`, `PerfectoidSpaces:P1/fontaine-theta-comparison-with-mathlib`, `PerfectoidSpaces:P1/rings-of-integral-elements-under-tilting`, `mathlib:WittVector.map`, `mathlib:WittVector.fontaineTheta`, `mathlib:WittVector.fontaineTheta_teichmuller`.

Sources: [FS](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), II.1.2, p.49; II.1.17, p.55.

Proposed library: module `TauCeti/AlgebraicGeometry/FarguesFontaine/DiamondComparison`, namespace `TauCeti.FFDiamond`.

Atlas planet: **The bounded Witt–theta correspondence**.

### The affinoid untilt-product bijection

Identifier: `FarguesFontaineDiamonds:F1/affinoid_product`. Kind: **construction**.

For every affinoid characteristic-p perfectoid T, construct alpha_T:Y^diamond(T) ≃ Hom_Perf(T,S) × Spd(Q_p)(T). The forward map sends the isomorphism class of ((T^sharp,iota),h:T^sharp→Y) to (the tilted O_F-map recovered by the bounded Witt–theta correspondence, (T^sharp,iota) with its induced Q_p structure). The inverse composes W(f) with theta and factors through the actual open Y. This respects isomorphisms of marked untilts.

Proposed declaration: `TauCeti.FFDiamond.affinoid_product`.

Hypotheses and conventions:

- p is prime; F is a complete rank-one characteristic-p perfectoid field; S = Spa(F, O_F).
- Y, X, q, Frobenius and interval pairs are the actual objects and maps supplied by AdicSpaces Layer 6.

Construction and proof:

1. Construct the two functions from the preceding theorem; retain the untilt marking throughout.
2. Use equality of bounded ring maps and the supplier’s morphism/affinoid dictionary to verify both composites.

API:

- `TauCeti.FFDiamond.affinoid_product_forward` (data): Evaluate alpha_T on a represented marked-untilt map by the formula in the statement.
- `TauCeti.FFDiamond.affinoid_product_inverse` (constructor): Evaluate alpha_T inverse on (f,u) by theta_u ∘ W(f) and the open-locus factorization.
- `TauCeti.FFDiamond.affinoid_product_inverse_formula` (characterisation): The inverse’s ring map sends [x] to f(x)^sharp for every x∈O_F.
- `TauCeti.FFDiamond.affinoid_product_ext` (extensionality): For z,z′ in Y^diamond(T), z=z′ if and only if their alpha_T images have equal tilted base maps and equal marked Q_p-untilts. Both coordinates are required.

Unit tests:

- `TauCeti.FFDiamond.affinoid_product_base` (computation): For T=S and any marked Q_p-untilt u of S, the theta-defined i_u maps to (id_S,u).
- `TauCeti.FFDiamond.affinoid_product_excludes_char_p` (non-example): An untilt with p=0 does not occur in either side with Spd Q_p; its map factors only into the integral analytic locus.
- `TauCeti.FFDiamond.affinoid_product_teichmuller` (computation): For the inverse of (f,u), [varpi] maps to f(varpi)^sharp, a unit in the untilt Tate ring; its plus-ring membership does not assert that it is a plus-ring unit.
- `TauCeti.FFDiamond.affinoid_product_compatible_roots` (computation): For F=completion(F_p((t^{1/p^infty}))), choose the Q_p(p^{1/p^infty})-completion untilt with t^sharp=p and compatible roots. The inverse of (id_S,u) sends every [t^{1/p^m}] to p^{1/p^m}, with the p-power relations retained and both p and [t] invertible in the untilt Tate field. No algebraic-closedness assumption is used.

Uses:

- **FS II.1.2 and II.1.17**: Build the fixed-field product formula.
- **F4 sections**: Recover a divisor map from the identity base map and a marked untilt.

Acceptance:

- The product keeps both factors, including the untilt’s Q_p structure.

Direct prerequisites: `FarguesFontaineDiamonds:F1/bounded_witt_theta`, `DiamondsAndVStacks:D6/spd-of-a-tate-pair`, `DiamondsAndVStacks:D6/gluing-and-the-diamond-functor`, `PerfectoidSpaces:P1/marked-untilt`.

Sources: [FS](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), II.1.2, p.49; II.1.17, p.55.

Proposed library: module `TauCeti/AlgebraicGeometry/FarguesFontaine/DiamondComparison`, namespace `TauCeti.FFDiamond`.

### Restriction and naturality of the point bijections

Identifier: `FarguesFontaineDiamonds:F1/point_naturality`. Kind: **theorem**.

For every morphism g:T′→T of characteristic-p perfectoid test spaces, alpha_T′(g^*z)=(f∘g,g^*u) when alpha_T(z)=(f,u). This includes rational restrictions and arbitrary test spaces after gluing. Untilts are pulled back in the perfectoid slice category, with the induced marking. The affinoid formulas agree on overlaps and are invariant under isomorphic presentations of the untilt.

Proposed declaration: `TauCeti.FFDiamond.point_naturality`.

Hypotheses and conventions:

- p is prime; F is a complete rank-one characteristic-p perfectoid field; S = Spa(F, O_F).
- Y, X, q, Frobenius and interval pairs are the actual objects and maps supplied by AdicSpaces Layer 6.

Construction and proof:

1. Use functoriality of Witt maps and theta in the plus-ring dictionary.
2. Pull back the marked untilt via the supplier slice equivalence; do not assert arbitrary adic fibre products are perfectoid.
3. Check on affinoid covers of both tests, then apply sheaf descent to equality of maps.

Acceptance:

- Restriction to a rational subspace commutes with both directions.

Direct prerequisites: `FarguesFontaineDiamonds:F1/affinoid_product`, `PerfectoidSpaces:P2/tilting-slice-equivalence`, `PerfectoidSpaces:P2/perfectoid-spaces-and-glued-tilting`, `DiamondsAndVStacks:D6/untilt-descent-along-v-covers`.

Sources: [FS](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), II.1.2, p.49; II.1.17, p.55.

Proposed library: module `TauCeti/AlgebraicGeometry/FarguesFontaine/DiamondComparison`, namespace `TauCeti.FFDiamond`.

### The fixed-field diamond product isomorphism

Identifier: `FarguesFontaineDiamonds:F1/product_iso`. Kind: **construction**.

Glue the alpha_T into a natural isomorphism of v-sheaves alpha_F:Y^diamond ≅ S × Spd(Q_p), and regard it as an isomorphism of locally spatial diamonds. Its component on an arbitrary T is obtained by affinoid restriction and gluing of the bounded formulas. The locally spatial structures are those supplied by D6 and the representable/Spd factors.

Proposed declaration: `TauCeti.FFDiamond.product_iso`.

Hypotheses and conventions:

- p is prime; F is a complete rank-one characteristic-p perfectoid field; S = Spa(F, O_F).
- Y, X, q, Frobenius and interval pairs are the actual objects and maps supplied by AdicSpaces Layer 6.

Construction and proof:

1. Natural inverse point bijections give a natural isomorphism on an affinoid basis.
2. Use the supplied v-sheaf property on both sides to extend the isomorphism; apply Yoneda, then retain the supplied local spatiality.

API:

- `TauCeti.FFDiamond.product_iso_apply` (characterisation): On affinoid T, alpha_F has component alpha_T.
- `TauCeti.FFDiamond.product_iso_inverse` (data): The inverse natural transformation is given by the inverse bounded-theta formula and gluing.
- `TauCeti.FFDiamond.product_iso_over_qp` (compatibility): alpha_F followed by the second projection equals the diamond of the structural Q_p map.
- `TauCeti.FFDiamond.product_iso_ext` (extensionality): For any v-sheaf Z and h,k:Z→Y^diamond, h=k if and only if h and k followed by alpha_F have equal first projections and equal second projections.

Unit tests:

- `TauCeti.FFDiamond.product_iso_identity_section` (computation): For any marked untilt u:S→Spd Q_p, the diamond map of i_u is sent to the graph (id_S,u).
- `TauCeti.FFDiamond.product_iso_rational_restriction` (compatibility): Restricting a test T to a rational open gives the restriction of alpha_T, with the same untilt and tilted base map.
- `TauCeti.FFDiamond.product_iso_both_factors` (characterisation): For two points with the same Q_p-untilt, equality of their images under alpha_T holds exactly when their maps to S agree; forgetting the first factor is not injective in general.

Uses:

- **FS II.1.17**: Identify the generic period domain as the product.
- **F2 quotient**: Conjugate Witt Frobenius to Frobenius on S.
- **RelativeFarguesFontaine RF0:annuli**: Supply only the fixed-field product seed, without importing the relative construction backwards.

Acceptance:

- This is an isomorphism of sheaves, including all perfectoid tests.

Direct prerequisites: `FarguesFontaineDiamonds:F1/point_naturality`, `DiamondsAndVStacks:D6/etale-site-comparison`, `DiamondsAndVStacks:D6/spd-is-a-spatial-diamond`.

Sources: [FS](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), II.1.2, p.49; II.1.17, p.55.

Proposed library: module `TauCeti/AlgebraicGeometry/FarguesFontaine/DiamondComparison`, namespace `TauCeti.FFDiamond`.

Atlas planet: **The untilt product formula**.

### Structural projection and field-map naturality

Identifier: `FarguesFontaineDiamonds:F1/projection_field_naturality`. Kind: **theorem**.

The alpha_F diagram commutes over Spd Q_p. For a continuous isometric characteristic-p field embedding F→F′ carrying O_F into O_F′, the induced maps S′→S and Y_F′→Y_F satisfy alpha_F ∘ (Y_F′→Y_F)^diamond = ((S′→S)×id) ∘ alpha_F′. The same statement holds for continuous bounded field maps with the corresponding admissible topology and plus-ring hypotheses. Choice transport intertwines these diagrams.

Proposed declaration: `TauCeti.FFDiamond.projection_field_naturality`.

Hypotheses and conventions:

- p is prime; F is a complete rank-one characteristic-p perfectoid field; S = Spa(F, O_F).
- Y, X, q, Frobenius and interval pairs are the actual objects and maps supplied by AdicSpaces Layer 6.
- F′ is also a complete rank-one characteristic-p perfectoid field with its valuation ring; both fixed-field constructions use the same prime p. Field maps have the stated continuity and plus-ring boundedness.

Construction and proof:

1. Prove the structural projection formula affinoid-locally by retaining the untilt structure in both directions.
2. Use theta naturality and W(f′∘f)=W(f′)∘W(f), then glue.

Acceptance:

- For the identity field map, the comparison square is the identity.

Direct prerequisites: `FarguesFontaineDiamonds:F1/product_iso`, `FarguesFontaineDiamonds:F0/choice_transport`, `FarguesFontaineDiamonds:F1/bounded_witt_theta`.

Sources: [FS](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), II.1.2, p.49; II.1.17, p.55.

Proposed library: module `TauCeti/AlgebraicGeometry/FarguesFontaine/DiamondComparison`, namespace `TauCeti.FFDiamond`.

## F2. Frobenius equivariance and quotient comparison

A quotient comparison needs its relation and its cover, not just its orbit
space. The anchor supplies locally isomorphic wandering charts and the positive
radius scaling. A1 supplies the actual fibre products. D6 transports the local
products and restrictions; the coproduct of graphs is recognized locally by its
component labels. The effective epimorphism property then gives the quotient
universal property. This order avoids any assertion that diamondification
preserves all colimits. The product action is Frobenius on S with identity on
Spd Q_p. Local spatiality comes from D6, and qcqs has its own finite-overlap
argument from bounded-radius windows.

### Equivariance for the chosen Frobenius generator

Identifier: `FarguesFontaineDiamonds:F2/frobenius_equivariance`. Kind: **theorem**.

With phi_Y induced contravariantly by Witt Frobenius and phi_S induced by x↦x^p, alpha_F ∘ phi_Y^diamond = (phi_S×id) ∘ alpha_F. On an affinoid point represented by theta_u ∘ W(f), postcomposition with phi_Y changes f to f∘Frob_O_F, while retaining u. The radius kappa=log|[varpi]|/log|p|, evaluated on the unique rank-one generalization of an analytic point, satisfies kappa(phi_Y x)=p·kappa(x).

Proposed declaration: `TauCeti.FFDiamond.frobenius_equivariance`.

Hypotheses and conventions:

- p is prime; F is a complete rank-one characteristic-p perfectoid field; S = Spa(F, O_F).
- Y, X, q, Frobenius and interval pairs are the actual objects and maps supplied by AdicSpaces Layer 6.
- The real-valued radius uses rank-one generalizations; higher-rank chart inequalities retain the anchor’s order-theoretic power-comparison convention.

Construction and proof:

1. Evaluate the composed ring map on [a], where Witt Frobenius sends [a] to [a^p] and fixes p.
2. Use the marked-untilt formula to identify the first factor, and the anchor’s valuation precomposition convention to compute the radius.
3. Check the positive generator before extending to its integer powers.

Acceptance:

- For varpi, the value is f(varpi^p)^sharp, not f(varpi^(1/p))^sharp.
- The Spd Q_p factor remains unchanged.

Direct prerequisites: `FarguesFontaineDiamonds:F1/product_iso`, `FarguesFontaineDiamonds:F1/bounded_witt_theta`, `tauceti:TauCetiRoadmap/AdicSpaces#layer-6-the-adic-farguesfontaine-curve`, `mathlib:WittVector.frobeniusEquiv`.

Sources: [FS](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), II.1.16–17, pp.54–55.

Proposed library: module `TauCeti/AlgebraicGeometry/FarguesFontaine/DiamondComparison`, namespace `TauCeti.FFDiamond`.

Atlas planet: **Frobenius equivariance**.

### The adic Frobenius graph relation

Identifier: `FarguesFontaineDiamonds:F2/adic_graph_relation`. Kind: **theorem**.

The map coprod_{n∈Z}Y → Y×_X Y, on the n-th component y↦(y,phi_Y^n(y)), is an isomorphism in the analytic Yoneda-adic category. Locally on both factors it is the coproduct of the actual graph isomorphisms between wandering charts. The cocycle composition is addition of integer exponents.

Proposed declaration: `TauCeti.FFDiamond.adic_graph_relation`.

Hypotheses and conventions:

- p is prime; F is a complete rank-one characteristic-p perfectoid field; S = Spa(F, O_F).
- Y, X, q, Frobenius and interval pairs are the actual objects and maps supplied by AdicSpaces Layer 6.

Construction and proof:

1. For U_n and V_n use the anchor’s disjoint translates and actual isomorphism onto q(U_n),q(V_n).
2. Identify each pullback chart with the unique translate meeting it; on overlaps the integer labels coincide by freeness. Glue these identifications.

Acceptance:

- The n=0 summand is the diagonal.
- Composing the n and m graphs gives the n+m graph.

Direct prerequisites: `FarguesFontaineDiamonds:F0/chart_category_interface`, `tauceti:TauCetiRoadmap/AdicSpaces#layer-6-the-adic-farguesfontaine-curve`, `AdicEtaleGeometry:A1/yoneda-adic-fibre-products`.

Sources: [FS](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), II.1.16–17, pp.54–55; [SW](https://people.mpim-bonn.mpg.de/scholze/Berkeley.pdf), Lecture 13, Definition 13.5.1, p.112.

Proposed library: module `TauCeti/AlgebraicGeometry/FarguesFontaine/DiamondComparison`, namespace `TauCeti.FFDiamond`.

### The diamond Frobenius graph relation

Identifier: `FarguesFontaineDiamonds:F2/diamond_graph_relation`. Kind: **theorem**.

The same graph maps give an isomorphism coprod_Z Y^diamond ≅ Y^diamond×_{X^diamond}Y^diamond of v-sheaves. Source and target are (y,n)↦y and (y,n)↦phi_Y^{diamond,n}(y); the diagonal, inverse and composition have labels 0,−n,n+m.

Proposed declaration: `TauCeti.FFDiamond.diamond_graph_relation`.

Hypotheses and conventions:

- p is prime; F is a complete rank-one characteristic-p perfectoid field; S = Spa(F, O_F).
- Y, X, q, Frobenius and interval pairs are the actual objects and maps supplied by AdicSpaces Layer 6.

Construction and proof:

1. Apply D6’s fibre-product and open-restriction comparisons on every wandering-chart pullback.
2. Identify a disjoint union via the locally constant component label on tests, then glue. This argument proves this coproduct comparison locally; it uses no unrestricted colimit-preservation claim.

Acceptance:

- A nonconnected test may have a locally constant integer label, rather than a single global integer.

Direct prerequisites: `FarguesFontaineDiamonds:F2/adic_graph_relation`, `DiamondsAndVStacks:D6/gluing-and-the-diamond-functor`.

Sources: [FS](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), II.1.16–17, pp.54–55.

Proposed library: module `TauCeti/AlgebraicGeometry/FarguesFontaine/DiamondComparison`, namespace `TauCeti.FFDiamond`.

### The local-isomorphism cover of the curve diamond

Identifier: `FarguesFontaineDiamonds:F2/diamond_quotient_cover`. Kind: **theorem**.

q^diamond:Y^diamond→X^diamond is a surjective étale morphism and hence a cover for the v-topology. It restricts to isomorphisms U_n^diamond→q(U_n)^diamond and V_n^diamond→q(V_n)^diamond; q(U_0)^diamond and q(V_0)^diamond cover X^diamond.

Proposed declaration: `TauCeti.FFDiamond.diamond_quotient_cover`.

Hypotheses and conventions:

- p is prime; F is a complete rank-one characteristic-p perfectoid field; S = Spa(F, O_F).
- Y, X, q, Frobenius and interval pairs are the actual objects and maps supplied by AdicSpaces Layer 6.

Construction and proof:

1. Use the two wandering-window families and the local chart isomorphisms.
2. Their images cover the adic X; D6 identifies the underlying spaces and open subdiamonds, and transports the covering family.

Acceptance:

- The cover proof does not require q to be quasicompact.

Direct prerequisites: `FarguesFontaineDiamonds:F0/chart_category_interface`, `tauceti:TauCetiRoadmap/AdicSpaces#layer-6-the-adic-farguesfontaine-curve`, `DiamondsAndVStacks:D6/etale-site-comparison`, `DiamondsAndVStacks:D6/gluing-and-the-diamond-functor`.

Sources: [FS](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), II.1.16–17, pp.54–55.

Proposed library: module `TauCeti/AlgebraicGeometry/FarguesFontaine/DiamondComparison`, namespace `TauCeti.FFDiamond`.

### Effectiveness of the fixed-field quotient sheaf

Identifier: `FarguesFontaineDiamonds:F2/effective_quotient`. Kind: **theorem**.

q^diamond is the effective quotient of the Frobenius graph relation: for every v-sheaf Z, composition with q^diamond identifies Hom(X^diamond,Z) with the morphisms h:Y^diamond→Z such that h∘phi_Y^diamond=h. The quotient is the sheaf quotient; an arbitrary pointwise orbit presheaf need not satisfy this universal property before sheafification.

Proposed declaration: `TauCeti.FFDiamond.effective_quotient`.

Hypotheses and conventions:

- p is prime; F is a complete rank-one characteristic-p perfectoid field; S = Spa(F, O_F).
- Y, X, q, Frobenius and interval pairs are the actual objects and maps supplied by AdicSpaces Layer 6.

Construction and proof:

1. Use effective epimorphism descent in the v-sheaf topos for q^diamond.
2. Its Cech relation is the preceding graph relation. Descent on all graph components is exactly invariance under the generator.

Acceptance:

- Invariant maps descend uniquely as morphisms of sheaves.
- Local integer labels on a disconnected test are admitted.

Direct prerequisites: `FarguesFontaineDiamonds:F2/diamond_graph_relation`, `FarguesFontaineDiamonds:F2/diamond_quotient_cover`, `DiamondsAndVStacks:D0/groupoid-quotients-and-two-fibre-products`, `DiamondsAndVStacks:D4/atlas-characterisation-of-diamonds`.

Sources: [FS](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), II.1.16–17, pp.54–55.

Proposed library: module `TauCeti/AlgebraicGeometry/FarguesFontaine/DiamondComparison`, namespace `TauCeti.FFDiamond`.

### The fixed-field quotient comparison

Identifier: `FarguesFontaineDiamonds:F2/quotient_iso`. Kind: **construction**.

Construct beta_F:X^diamond ≅ (S×Spd(Q_p))/(phi_S^Z×id) as the unique isomorphism induced by alpha_F between the two effective quotient sheaves. If pi:S×Spd(Q_p)→Q_F is the quotient map, beta_F∘q^diamond=pi∘alpha_F. The action is on S; Q_F is an imported quotient sheaf, not a newly defined curve carrier.

Proposed declaration: `TauCeti.FFDiamond.quotient_iso`.

Hypotheses and conventions:

- p is prime; F is a complete rank-one characteristic-p perfectoid field; S = Spa(F, O_F).
- Y, X, q, Frobenius and interval pairs are the actual objects and maps supplied by AdicSpaces Layer 6.

Construction and proof:

1. Use equivariance to descend pi∘alpha_F; descend alpha_F inverse in the reverse direction.
2. Check both composites after the respective covers and use uniqueness of effective descent.

API:

- `TauCeti.FFDiamond.quotient_iso_square` (compatibility): beta_F∘q^diamond=pi∘alpha_F.
- `TauCeti.FFDiamond.quotient_iso_over_qp` (compatibility): beta_F respects the maps to Spd Q_p induced by the second projection.
- `TauCeti.FFDiamond.quotient_iso_unique` (universal-property): Any sheaf morphism X^diamond→Q_F satisfying the defining square equals beta_F.

Unit tests:

- `TauCeti.FFDiamond.quotient_iso_zero_graph` (degenerate): The zero graph descends to the diagonal and beta_F agrees with alpha_F followed by pi on every wandering chart.
- `TauCeti.FFDiamond.quotient_iso_positive_generator` (compatibility): Under beta_F, the q-relation for phi_Y maps to the phi_S graph, with the Q_p factor fixed.
- `TauCeti.FFDiamond.quotient_iso_locally_constant_labels` (characterisation): A locally constant integer shift on a disjoint union of test spaces gives equal quotient sections; a construction quotienting only by a single global integer fails this test.

Uses:

- **FS II.1.17**: Describe the diamond of the existing curve.
- **F3 chart comparison**: Give the quotient’s descent presentation.
- **RelativeFarguesFontaine RF1**: Supply the fixed-field quotient specialization.

Acceptance:

- The defining commuting square determines beta_F uniquely.

Direct prerequisites: `FarguesFontaineDiamonds:F2/frobenius_equivariance`, `FarguesFontaineDiamonds:F2/effective_quotient`, `DiamondsAndVStacks:D0/groupoid-quotients-and-two-fibre-products`.

Sources: [FS](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), II.1.16–17, pp.54–55.

Proposed library: module `TauCeti/AlgebraicGeometry/FarguesFontaine/DiamondComparison`, namespace `TauCeti.FFDiamond`.

Atlas planet: **The diamond quotient comparison**.

### Local spatiality, qcqs and independence of choices

Identifier: `FarguesFontaineDiamonds:F2/quotient_spatiality_choices`. Kind: **theorem**.

X^diamond and Q_F are locally spatial and qcqs. Their underlying spaces agree with the adic quotient. Prove qcqs from the finite affinoid cover q(U_0),q(V_0) and quasi-compact intersections computed by finitely many translates between bounded-radius intervals. beta_F is compatible with the anchor’s varpi-change isomorphisms and independent of wandering-window choices.

Proposed declaration: `TauCeti.FFDiamond.quotient_spatiality_choices`.

Hypotheses and conventions:

- p is prime; F is a complete rank-one characteristic-p perfectoid field; S = Spa(F, O_F).
- Y, X, q, Frobenius and interval pairs are the actual objects and maps supplied by AdicSpaces Layer 6.

Construction and proof:

1. Use D6 for local spatiality and the topology comparison.
2. For any two bounded-radius windows only finitely many phi-translates can meet; overlaps are finite unions of rational interval intersections and hence quasi-compact. Transfer the two-chart qcqs proof.
3. Compare two beta maps after q, where the bounded point formula is choice independent, and use uniqueness.

Acceptance:

- No properness or smoothness of X^diamond→Spd Q_p is deduced.

Direct prerequisites: `FarguesFontaineDiamonds:F2/quotient_iso`, `FarguesFontaineDiamonds:F0/choice_transport`, `FarguesFontaineDiamonds:F2/adic_graph_relation`, `DiamondsAndVStacks:D6/etale-site-comparison`, `tauceti:TauCetiRoadmap/AdicSpaces#layer-6-the-adic-farguesfontaine-curve`.

Sources: [FS](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), II.1.16–17, pp.54–55.

Proposed library: module `TauCeti/AlgebraicGeometry/FarguesFontaine/DiamondComparison`, namespace `TauCeti.FFDiamond`.

Atlas planet: **The locally spatial curve diamond**.

## F3. Étale sites and finite-cover comparison

The general site theorem is not reconstructed here. Its specialization must
preserve the actual functors, topology and inclusion of finite étale covers.
Restriction squares are natural isomorphisms whose coherence matters on three
charts. The quotient presentation describes sheaves by Frobenius descent data,
with a transition isomorphism and a cocycle. An arbitrary family of invariant
sections is not the same data and cannot be used to define derived invariants.
This stage is the geometric endpoint of viewing the anchor's curve as a diamond.

### The fixed-curve étale-site equivalences

Identifier: `FarguesFontaineDiamonds:F3/site_equiv`. Kind: **construction**.

Specialize the general D6 comparison to an equivalence eta:X_et ≌ X^diamond_et and eta_f:X_fet ≌ X^diamond_fet. The forward functors send an étale or finite étale map Z→X to Z^diamond→X^diamond; the inverse is the D6 inverse, and unit/counit agree with it. Covering families are precisely the set-theoretically surjective families of the public KL15 site convention. The inclusion of finite étale into étale objects commutes up to the specified natural isomorphism.

Proposed declaration: `TauCeti.FFDiamond.site_equiv`.

Hypotheses and conventions:

- p is prime; F is a complete rank-one characteristic-p perfectoid field; S = Spa(F, O_F).
- Y, X, q, Frobenius and interval pairs are the actual objects and maps supplied by AdicSpaces Layer 6.

Construction and proof:

1. Apply the imported general theorem to the analytic interface, without rebuilding its torsor-tower proof.
2. Use the public KL15 definitions to identify the chosen adic-site convention, and the D6 underlying-space comparison to check covers.
3. Restrict the site functor to finite étale objects and preserve the supplier’s unit and counit.

API:

- `TauCeti.FFDiamond.site_equiv_functor` (data): eta sends Z→X to Z^diamond→X^diamond on objects and sends morphisms to their diamonds.
- `TauCeti.FFDiamond.site_equiv_finite` (data): eta_f:X_fet ≌ X^diamond_fet is the restriction compatible with the inclusion functors.
- `TauCeti.FFDiamond.site_equiv_covers` (characterisation): A family is covering on X_et exactly when its eta image is covering on X^diamond_et.
- `TauCeti.FFDiamond.site_equiv_unit_counit` (compatibility): The unit and counit are the general D6 unit and counit evaluated on X.

Unit tests:

- `TauCeti.FFDiamond.site_equiv_terminal` (degenerate): The identity X→X maps to the identity X^diamond→X^diamond.
- `TauCeti.FFDiamond.site_equiv_split_cover` (computation): The split finite étale cover X⊔X→X maps to X^diamond⊔X^diamond→X^diamond, with its two projections preserved.
- `TauCeti.FFDiamond.site_equiv_two_windows` (compatibility): The two wandering-chart images cover X exactly when their diamond images cover X^diamond.

Uses:

- **ECD Lemma 15.6**: Apply the general theorem to the actual fixed curve.
- **F5**: Supply the equivalence of sheaf categories to be enhanced and completed.

Acceptance:

- The functor is the diamondification of maps, not an arbitrary categorical equivalence.

Direct prerequisites: `FarguesFontaineDiamonds:F2/quotient_spatiality_choices`, `DiamondsAndVStacks:D6/etale-site-comparison`, `AdicEtaleGeometry:A1/adic-spaces-in-yoneda-adic-spaces`, `mathlib:CategoryTheory.Equivalence`.

Sources: [ECD](https://arxiv.org/pdf/1709.07343v4), Definition 15.5; Lemma 15.6 and proof, pp.91–92; [KL](https://arxiv.org/pdf/1301.0792v5), Definitions 8.2.16 and 8.2.19; Lemma 8.2.17, pp.162–163.

Proposed library: module `TauCeti/AlgebraicGeometry/FarguesFontaine/DiamondComparison`, namespace `TauCeti.FFDiamond`.

Atlas planet: **The étale-site comparison**.

### Restriction of the site equivalence to quotient charts

Identifier: `FarguesFontaineDiamonds:F3/chart_site_compatibility`. Kind: **theorem**.

For each wandering chart W⊂Y on which q is an isomorphism onto an open of X, the restriction/pullback functors on the two étale sites commute with eta through the D6 open comparison and alpha_F. The induced square is a natural isomorphism, coherent for nested charts and for overlaps. Under beta_F it is the restriction of the quotient presentation.

Proposed declaration: `TauCeti.FFDiamond.chart_site_compatibility`.

Hypotheses and conventions:

- p is prime; F is a complete rank-one characteristic-p perfectoid field; S = Spa(F, O_F).
- Y, X, q, Frobenius and interval pairs are the actual objects and maps supplied by AdicSpaces Layer 6.

Construction and proof:

1. Compute on an étale object by the fibre-product comparison.
2. Use D6 functoriality for inclusions and the defining beta square to identify restriction on all overlaps; coherence follows from the same canonical product comparison.

Acceptance:

- Restricting twice along nested rational charts agrees with direct restriction.

Direct prerequisites: `FarguesFontaineDiamonds:F3/site_equiv`, `FarguesFontaineDiamonds:F2/quotient_iso`, `DiamondsAndVStacks:D6/gluing-and-the-diamond-functor`.

Sources: [ECD](https://arxiv.org/pdf/1709.07343v4), Definition 15.5; Lemma 15.6 and proof, pp.91–92.

Proposed library: module `TauCeti/AlgebraicGeometry/FarguesFontaine/DiamondComparison`, namespace `TauCeti.FFDiamond`.

### Frobenius descent of étale sheaves

Identifier: `FarguesFontaineDiamonds:F3/sheaf_descent`. Kind: **construction**.

For any coefficient category for which étale sheaf descent is defined (in particular sets and modules over a discrete commutative ring), construct the equivalence between sheaves on X^diamond_et and pairs (M,c) with M a sheaf on Y^diamond_et and c:phi_Y^{diamond,*}M≅M. The induced c_n:phi_Y^{diamond,n,*}M≅M satisfy c_0=id and c_{m+n}=c_n∘phi^{n,*}(c_m), with the chosen pullback associators. Morphisms intertwine c. Use D0’s graph-relation Cech descent category, with the explicitly requested specialization to étale sheaves. Its quotient-stack API alone does not establish that the étale-sheaf pseudofunctor is a stack.

Proposed declaration: `TauCeti.FFDiamond.sheaf_descent`.

Hypotheses and conventions:

- p is prime; F is a complete rank-one characteristic-p perfectoid field; S = Spa(F, O_F).
- Y, X, q, Frobenius and interval pairs are the actual objects and maps supplied by AdicSpaces Layer 6.

Construction and proof:

1. Apply the requested effective descent theorem for étale sheaves along the surjective étale map q^diamond. The abstract quotient-stack descent API must first be specialized to this sheaf pseudofunctor.
2. Identify the Cech relation by its integer-indexed graphs, with composition n+m. Recover all c_n from the generator and inverse.
3. Transport to the product description through alpha_F, where pullback is on the S factor.

API:

- `TauCeti.FFDiamond.sheaf_descent_pullback` (data): The forward equivalence sends N to q^{diamond,*}N with its canonical Cech Frobenius isomorphism.
- `TauCeti.FFDiamond.sheaf_descent_inverse` (constructor): Compatible sheaf/cocycle data glue uniquely to an étale sheaf on X^diamond.
- `TauCeti.FFDiamond.sheaf_descent_cocycle` (relation): c_{m+n}=c_n∘phi^{n,*}(c_m), with c_0=id and all pullback associators retained.

Unit tests:

- `TauCeti.FFDiamond.sheaf_descent_constant` (computation): A constant sheaf pulled back from X^diamond has the canonical constant-sheaf Frobenius cocycle; its descent returns the original sheaf.
- `TauCeti.FFDiamond.sheaf_descent_negative_generator` (compatibility): The −1 transition is the pulled-back inverse of the +1 transition, not an independent choice.
- `TauCeti.FFDiamond.sheaf_descent_morphism` (characterisation): A morphism descends exactly when it commutes with the generator cocycle; maps of underlying sheaves alone do not suffice.

Uses:

- **F3 finite covers**: Describe descent of finite étale covers via the same relation.
- **F5**: Separate sheaf descent from enhanced derived descent; degreewise invariants are not a derived construction.

Acceptance:

- Cocycle composition includes the pullback of the first isomorphism.

Direct prerequisites: `FarguesFontaineDiamonds:F2/diamond_graph_relation`, `FarguesFontaineDiamonds:F2/diamond_quotient_cover`, `FarguesFontaineDiamonds:F3/chart_site_compatibility`, `DiamondsAndVStacks:D0/groupoid-quotients-and-two-fibre-products`, `mathlib:CategoryTheory.Equivalence`, `DiamondsAndVStacks:D0`.

Sources: [ECD](https://arxiv.org/pdf/1709.07343v4), Definition 15.5; Lemma 15.6 and proof, pp.91–92.

Proposed library: module `TauCeti/AlgebraicGeometry/FarguesFontaine/DiamondComparison`, namespace `TauCeti.FFDiamond`.

Atlas planet: **Frobenius sheaf descent**.

### Compatibility of Frobenius descent with finite étale covers

Identifier: `FarguesFontaineDiamonds:F3/finite_cover_descent`. Kind: **theorem**.

The analogous equivalence for finite étale covers identifies covers of X^diamond with finite étale covers Z→Y^diamond carrying a Frobenius isomorphism and its cocycle. Via eta_f this is the descent description of finite étale covers of the adic X. For a finite étale cover, its represented sheaf descends to the sheaf represented by the descended cover.

Proposed declaration: `TauCeti.FFDiamond.finite_cover_descent`.

Hypotheses and conventions:

- p is prime; F is a complete rank-one characteristic-p perfectoid field; S = Spa(F, O_F).
- Y, X, q, Frobenius and interval pairs are the actual objects and maps supplied by AdicSpaces Layer 6.

Construction and proof:

1. First descend the represented sheaf through the effective cover; the v-local finite étale criterion of ECD 10.11(iii) proves that its morphism is finite étale.
2. Check the finite-cover comparison on wandering charts, where q is an isomorphism; glue through the graph relation.

Acceptance:

- A split two-sheeted cover descends with its sheet action retained.

Direct prerequisites: `FarguesFontaineDiamonds:F3/site_equiv`, `FarguesFontaineDiamonds:F3/sheaf_descent`, `DiamondsAndVStacks:D3/v-local-nature-of-morphism-classes`, `DiamondsAndVStacks:D0/groupoid-quotients-and-two-fibre-products`, `DiamondsAndVStacks:D0`.

Sources: [ECD](https://arxiv.org/pdf/1709.07343v4), Proposition 10.11(iii), pp.52–53, proof using Proposition 9.7, pp.47–48.

Proposed library: module `TauCeti/AlgebraicGeometry/FarguesFontaine/DiamondComparison`, namespace `TauCeti.FFDiamond`.

## F4. Marked untilts and analytic Cartier divisors

The product formula identifies sections with marked untilts. The primitive
kernel is imported from P1, resolving the ownership overlap recorded as
RT-AREA-padic-1/8. The new work is analytic: prove a lower norm bound, closed
image after rational localization, the correct completed quotient, and an exact
sequence of analytic sheaves. A principal ideal in W(O_F) is not a closed
Cartier divisor until these conditions have been established.

The auxiliary root extension uses compatible roots of p and varpi. Their
quotients s_m=p_m/v_m obey s_m^p=s_(m−1). Use pi=v_1, so pi^p=[varpi]
  divides p; [varpi]^p need not divide p. The disc chart coordinate satisfies
t_1^sharp=p/[varpi]; reversing this ratio reverses the chart inequality. The
integral recognition uses a small root pseudouniformizer before inversion,
not the Tate ring in which p is already a unit. The Q0 bridge must explain this
varpi-adic situation rather than asserting that Q0's p-complete predicate
automatically applies. P1 supplies the integral-to-Tate inversion theorem.

For U_n={|xi|≤|[varpi]|^n}, normalize |[varpi]|=p^−1. Boundary norm detection
then gives ||xi b||≥p^−n||b||. Completeness makes xi's image closed because its
inverse on the image sends Cauchy sequences to Cauchy sequences. The check is
repeated on rational affinoids. Berkeley 5.3.9 expressly warns that closedness
of the original global ideal need not survive such restriction. The proof's
boundary/finite-root approximation input is the exact remaining source gap.

### Sections and marked Q_p-untilts

Identifier: `FarguesFontaineDiamonds:F4/section_untilt_equiv`. Kind: **construction**.

Construct the natural bijection between sections of Y^diamond→S, morphisms S→Spd Q_p, and isomorphism classes of marked Q_p-untilts (S^sharp,iota). A section corresponding to u is alpha_F inverse composed with the graph (id_S,u). The projection Y^diamond→S is available here; no structural map X^diamond→S is asserted.

Proposed declaration: `TauCeti.FFDiamond.section_untilt_equiv`.

Hypotheses and conventions:

- p is prime; F is a complete rank-one characteristic-p perfectoid field; S = Spa(F, O_F).
- Y, X, q, Frobenius and interval pairs are the actual objects and maps supplied by AdicSpaces Layer 6.

Construction and proof:

1. Use the product isomorphism and the ordinary graph/section universal property.
2. Use the imported definition and classification of marked untilts to identify the second set. Do not re-prove the primitive-kernel classification here.

API:

- `TauCeti.FFDiamond.section_untilt_equiv_graph` (constructor): The section for u is alpha_F inverse applied to (id_S,u).
- `TauCeti.FFDiamond.section_untilt_equiv_projection` (characterisation): Its composite with Y^diamond→S is id_S.
- `TauCeti.FFDiamond.section_untilt_equiv_recover` (data): The Q_p-untilt and its marking are recovered from the second projection through alpha_F.

Unit tests:

- `TauCeti.FFDiamond.section_untilt_equiv_identity` (computation): For S=Spa(C^flat,O_Cflat) and u=Spa(C,O_C), C a complete algebraically closed extension of Q_p, the section is the theta_C graph with identity marking.
- `TauCeti.FFDiamond.section_untilt_equiv_marking` (characterisation): Replacing the marking by precomposition with phi_S changes the first-factor graph before quotienting; the section bijection distinguishes the two marked data.
- `TauCeti.FFDiamond.section_untilt_equiv_char_p` (non-example): The characteristic-p untilt S with p=0 gives no element of Spd Q_p and hence no section in this bijection.

Uses:

- **FS II.1.18**: Provide the map of the untilt into the generic domain.
- **F4 curve divisors**: Track exactly the marking on which Frobenius acts.

Acceptance:

- The marking is not forgotten before constructing the section.

Direct prerequisites: `FarguesFontaineDiamonds:F1/product_iso`, `PerfectoidSpaces:P1/marked-untilt`, `PerfectoidSpaces:P1/untilts-classified-by-primitive-ideals`, `PerfectoidSpaces:P1/primitive-degree-one-ideals`.

Sources: [FS](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), II.1.4, pp.49–50; II.1.18, p.55.

Proposed library: module `TauCeti/AlgebraicGeometry/FarguesFontaine/DiamondComparison`, namespace `TauCeti.FFDiamond`.

Atlas planet: **Marked untilt sections**.

### The primitive equation on the imported domain

Identifier: `FarguesFontaineDiamonds:F4/primitive_equation_interface`. Kind: **theorem**.

For a marked Q_p-untilt of S, import the surjective bounded theta:W(O_F)→O_{Fsharp} and principal primitive kernel. After choosing a suitable pseudouniformizer varpi with varpi^sharp dividing p, choose a∈W(O_F) with theta(a)=p/varpi^sharp and use a primitive generator xi=p−a[varpi], up to an allowed unit multiple. The theta map induces i:S^sharp→Y because p and theta([varpi]) are units in Fsharp. This statement specifies the equation and map, not yet a closed Cartier divisor.

Proposed declaration: `TauCeti.FFDiamond.primitive_equation_interface`.

Hypotheses and conventions:

- p is prime; F is a complete rank-one characteristic-p perfectoid field; S = Spa(F, O_F).
- Y, X, q, Frobenius and interval pairs are the actual objects and maps supplied by AdicSpaces Layer 6.

Construction and proof:

1. Use the imported primitive-kernel theorem and theta surjectivity to choose a; verify the prescribed primitive generator and equality of its ideal with ker theta.
2. Apply the actual open-locus factorization. Transport to any original varpi by F0 choice transport.

Acceptance:

- The kernel ideal is independent of unit rescaling of xi.
- Principality in W(O_F) alone is not the analytic closedness proof.

Direct prerequisites: `FarguesFontaineDiamonds:F4/section_untilt_equiv`, `FarguesFontaineDiamonds:F1/bounded_witt_theta`, `PerfectoidSpaces:P1/fontaine-theta-and-primitive-kernel`.

Sources: [FS](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), II.1.4, pp.49–50; II.1.18, p.55.

Proposed library: module `TauCeti/AlgebraicGeometry/FarguesFontaine/DiamondComparison`, namespace `TauCeti.FFDiamond`.

### The split root-extension frame on fixed-field annuli

Identifier: `FarguesFontaineDiamonds:F4/root_extension_frame`. Kind: **theorem**.

Let K_infty be the completion of Q_p(p^{1/p^infty}) with compatible roots p_m^p=p_{m−1}. For each imported rational period annulus B^I, form Btilde^I=B^I completed-tensor_{Q_p} K_infty with the A0 completed tensor topology and the integral closure of the base-changed plus ring. The inclusion B^I→Btilde^I has a continuous B^I-linear retraction induced by the coefficient retraction of K_infty onto Q_p. It is a closed topological embedding, compatible with rational restrictions. This is ordinary completed base extension; no uniform completion is inserted.

Proposed declaration: `TauCeti.FFDiamond.root_extension_frame`.

Hypotheses and conventions:

- p is prime; F is a complete rank-one characteristic-p perfectoid field; S = Spa(F, O_F).
- Y, X, q, Frobenius and interval pairs are the actual objects and maps supplied by AdicSpaces Layer 6.

Construction and proof:

1. Check the completed-tensor supplier hypotheses: the scalar maps from Q_p to the rational annulus and K_infty are adic. On a bounded generic annulus powers of p define a cofinal ring-of-definition topology; retain the specified completed tensor and plus integral closure.
2. Choose the compatible root-basis coefficient projection; at each finite level it projects the coefficient of 1 and extends continuously to the completion.
3. Apply the supplier’s split completed-base-change theorem, and rational-localization compatibility.

Acceptance:

- The retraction sends 1 to 1 and commutes with multiplication by xi.
- Closedness downstairs can be checked using this closed summand.

Direct prerequisites: `FarguesFontaineDiamonds:F0/chart_category_interface`, `AdicSpacesPartII:R0/completed-tensor-product`, `AdicSpacesPartII:R5/split-injection-completed-base-change`.

Sources: [FS](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), Proof of II.1.1, p.48.

Proposed library: module `TauCeti/AlgebraicGeometry/FarguesFontaine/DiamondComparison`, namespace `TauCeti.FFDiamond`.

### Perfectoid root annuli and their tilt coordinates

Identifier: `FarguesFontaineDiamonds:F4/root_annulus_tilt`. Kind: **theorem**.

On the n=1 integral chart of the auxiliary analytic domain D([varpi]), take compatible v_m=[varpi^{1/p^m}], s_m=p_m/v_m in the localized root extension, so s_m^p=s_{m−1}. Let A_0^+ be the [varpi]-adic completion of (W(O_F) completed-tensor_{Z_p}O_Kinfty)[s_m:m≥0], and A=A_0^+[1/[varpi]]. Establish [varpi]-torsion freeness and the integral perfectoid criterion, then A is perfectoid. Its tilt is the chart F⟨t_1^{1/p^infty}⟩ with t_1^sharp=p/[varpi]; the coordinate in the perfect open disc is t=varpi·t_1, so the chart is |t|≤|varpi|≠0. Rational subannuli covering Y inherit this perfectoid frame. The roots are quotients of compatible roots, not arbitrarily chosen roots with missing relations.

Proposed declaration: `TauCeti.FFDiamond.root_annulus_tilt`.

Hypotheses and conventions:

- p is prime; F is a complete rank-one characteristic-p perfectoid field; S = Spa(F, O_F).
- Y, X, q, Frobenius and interval pairs are the actual objects and maps supplied by AdicSpaces Layer 6.

Construction and proof:

1. Compute A_0^+/[varpi] with compatible relations p_m=v_m s_m as in FS II.1.1. Verify the nonzerodivisor and Frobenius quotient criterion using the requested Q0 bridge and P1 inversion theorem. Use the root pi=v_1 as pseudouniformizer: pi^p=[varpi] divides p by the s_0 relation; do not require [varpi]^p to divide p.
2. Identify the tilt coordinate and its sharp image, then rationally localize to the generic annuli.
3. Use only the auxiliary frame, not a reconstruction of the anchor’s sheafiness or the general relative curve.

Acceptance:

- On the relevant boundary |s_m|=1, while s_m^p=s_{m−1}.
- The reciprocal coordinate [varpi]/p is not t_1.

Direct prerequisites: `FarguesFontaineDiamonds:F4/root_extension_frame`, `PerfectoidSpaces:P1/perfectoid-tate-ring-from-integral-perfectoid`, `PerfectoidSpaces:P2/rational-localization-of-perfectoid-affinoids`, `PerfectoidSpaces:P2/tilting-homeomorphism-and-rational-subsets`, `PerfectoidQuotients:Q0`.

Sources: [FS](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), Proof of II.1.1, p.48.

Proposed library: module `TauCeti/AlgebraicGeometry/FarguesFontaine/DiamondComparison`, namespace `TauCeti.FFDiamond`.

Atlas planet: **The perfectoid root-annulus frame**.

### The boundary supremum on an untilt neighborhood

Identifier: `FarguesFontaineDiamonds:F4/boundary_supremum`. Kind: **theorem**.

For a sufficiently small affinoid neighborhood U_n={|xi|≤|[varpi]|^n} of the untilt locus, normalize rank-one residue norms by |[varpi]|=p^−1. For every b∈O(U_n), the spectral supremum norm equals its supremum over boundary points where |xi|=|[varpi]|^n. The same norm detection holds after the split root extension. Geometric-fiber reduction, tilting and approximation by finite root levels must preserve this equality. The required classical one-variable input is the maximum-modulus boundary theorem for affinoid subdomains of the open disc without isolated components; it is an explicitly recorded source gap here.

Proposed declaration: `TauCeti.FFDiamond.boundary_supremum`.

Hypotheses and conventions:

- p is prime; F is a complete rank-one characteristic-p perfectoid field; S = Spa(F, O_F).
- Y, X, q, Frobenius and interval pairs are the actual objects and maps supplied by AdicSpaces Layer 6.

Construction and proof:

1. Reduce rank-one points to complete algebraically closed residue-field fibers.
2. After root extension pass to the perfect disc tilt; approximate functions and affinoid domains by finite root levels with compatible spectral norms. The P1 spectral-norm interface fixes |varpi|=1/2; renormalize both tilt and untilt gauges by the same positive power log(p)/log(2) to obtain |varpi|=1/p before comparing the inequalities.
3. Apply the classical boundary theorem and identify the boundary via specializations leaving U_n. The last theorem and finite-level norm passage need the recorded proof gap to be filled; they are not routine consequences of principality.

Acceptance:

- For the perfected closed disc, the Gauss boundary detects the norm of its coordinate.
- The statement applies to all functions, not just xi.

Direct prerequisites: `FarguesFontaineDiamonds:F4/root_annulus_tilt`, `PerfectoidSpaces:P1/spectral-norm-under-sharp`, `PerfectoidSpaces:P2/tilting-homeomorphism-and-rational-subsets`.

Sources: [FS](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), Proof of II.1.4, p.50.

Proposed library: module `TauCeti/AlgebraicGeometry/FarguesFontaine/DiamondComparison`, namespace `TauCeti.FFDiamond`.

Atlas planet: **The boundary norm estimate**.

### The primitive-generator multiplication bound

Identifier: `FarguesFontaineDiamonds:F4/multiplication_lower_bound`. Kind: **theorem**.

Under the preceding neighborhood and normalization, every b∈O(U_n) satisfies ||xi·b||_sp ≥ p^−n ||b||_sp. The spectral norm induces the affinoid topology and is a genuine norm. For any rational affinoid U⊂Y, there is a positive constant c_U such that ||xi·b||_U ≥ c_U||b||_U, after an equivalent chart norm. Prove the analogous inequalities on every rational restriction needed for the closed-divisor criterion.

Proposed declaration: `TauCeti.FFDiamond.multiplication_lower_bound`.

Hypotheses and conventions:

- p is prime; F is a complete rank-one characteristic-p perfectoid field; S = Spa(F, O_F).
- Y, X, q, Frobenius and interval pairs are the actual objects and maps supplied by AdicSpaces Layer 6.

Construction and proof:

1. Evaluate |xi b|=p^−n|b| on the boundary and take suprema.
2. Away from the zero locus xi is bounded below; use a rational cover by {|xi|≤|[varpi]|^n} and {|[varpi]|^n≤|xi|}.
3. Use the FS/SW quasicompact-neighborhood argument and the split embedding to transfer the norm control; finite rational covers give a positive minimum of constants.

Acceptance:

- For b=1 on U_n the bound has the factor p^−n, not p^n.
- A zero xi cannot satisfy the bound in a nonzero ring.

Direct prerequisites: `FarguesFontaineDiamonds:F4/boundary_supremum`, `FarguesFontaineDiamonds:F4/primitive_equation_interface`, `FarguesFontaineDiamonds:F4/root_extension_frame`, `tauceti:TauCetiRoadmap/AdicSpaces#layer-6-the-adic-farguesfontaine-curve`.

Sources: [SW](https://people.mpim-bonn.mpg.de/scholze/Berkeley.pdf), Lecture 11, Proposition 11.3.1 and proof, pp.94–95.

Proposed library: module `TauCeti/AlgebraicGeometry/FarguesFontaine/DiamondComparison`, namespace `TauCeti.FFDiamond`.

Atlas planet: **The primitive-generator lower bound**.

### Closed image and quotient on rational affinoids

Identifier: `FarguesFontaineDiamonds:F4/rational_strict_exactness`. Kind: **theorem**.

For every rational affinoid U=Spa(B,B^+)⊂Y, multiplication by xi on B is injective and has closed image; B/xi B is its separated complete quotient. If V=U×_Y S^sharp is nonempty it is affinoid perfectoid and B/xi B ≅ O(V) as topological rings, with plus ring the integral closure of the image of B^+. If V is empty the quotient is zero. These identifications commute with further rational restrictions.

Proposed declaration: `TauCeti.FFDiamond.rational_strict_exactness`.

Hypotheses and conventions:

- p is prime; F is a complete rank-one characteristic-p perfectoid field; S = Spa(F, O_F).
- Y, X, q, Frobenius and interval pairs are the actual objects and maps supplied by AdicSpaces Layer 6.

Construction and proof:

1. The lower bound implies injectivity and makes the preimages of a Cauchy sequence in xi B Cauchy. Completeness proves closed image.
2. The theta presentation identifies the untilt algebra with the separated completion of the quotient; closedness removes further completion.
3. Use the affinoid quotient-pair plus convention and rational universal properties; an empty intersection forces the completed quotient to vanish.

Acceptance:

- The proof checks rational subsets as well as the original period annulus.
- The quotient topology, plus ring and restriction maps are all retained.

Direct prerequisites: `FarguesFontaineDiamonds:F4/multiplication_lower_bound`, `FarguesFontaineDiamonds:F4/primitive_equation_interface`, `PerfectoidSpaces:P2/rational-localization-of-perfectoid-affinoids`, `AdicSpacesPartII:R0/closed-adic-subspaces-and-embeddings`.

Sources: [FS](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), II.1.4, pp.49–50; II.1.18, p.55.

Proposed library: module `TauCeti/AlgebraicGeometry/FarguesFontaine/DiamondComparison`, namespace `TauCeti.FFDiamond`.

### The analytic untilt divisor on Y

Identifier: `FarguesFontaineDiamonds:F4/untilt_closed_divisor`. Kind: **construction**.

Construct the actual closed immersion i_u:S^sharp→Y as the closed Cartier divisor with ideal sheaf xi O_Y. Cartier means this ideal embeds in O_Y and is locally free of rank one; closed means its quotient ringed space with inherited valuations is an adic space. Its affinoid quotient pairs are those of rational strict exactness. The construction is independent of the chosen primitive generator, auxiliary varpi and root-extension frame.

Proposed declaration: `TauCeti.FFDiamond.untilt_closed_divisor`.

Hypotheses and conventions:

- p is prime; F is a complete rank-one characteristic-p perfectoid field; S = Spa(F, O_F).
- Y, X, q, Frobenius and interval pairs are the actual objects and maps supplied by AdicSpaces Layer 6.

Construction and proof:

1. Apply the requested general Cartier/closed-image criterion to the rational injectivity and closedness theorem.
2. Glue the quotient pairs and identify their morphisms with the original theta map. Unit multiples give the same ideal sheaf, and F0 transports choices.

API:

- `TauCeti.FFDiamond.untilt_closed_divisor_equation` (data): The ideal on each rational chart is generated by the image of xi=ker(theta)’s chosen primitive generator.
- `TauCeti.FFDiamond.untilt_closed_divisor_quotient` (compatibility): On U, the quotient topological pair is (O(U)/xi, integral closure of image O^+(U)), identified with U∩S^sharp.
- `TauCeti.FFDiamond.untilt_closed_divisor_unit_change` (characterisation): Replacing xi by a unit multiple gives the same closed divisor and immersion.

Unit tests:

- `TauCeti.FFDiamond.untilt_closed_divisor_geometric` (computation): For F=C^flat and the marked untilt C, the completed residue field of its divisor point on Y is C and its integral theta quotient is O_C.
- `TauCeti.FFDiamond.untilt_closed_divisor_disjoint` (degenerate): On a rational chart disjoint from S^sharp, xi is a unit and the divisor quotient is zero.
- `TauCeti.FFDiamond.untilt_closed_divisor_rational` (compatibility): Restricting the divisor to any rational U gives the closed quotient pair above; global principality alone would not pass this test.

Uses:

- **FS II.1.4/II.1.18**: Upgrade an untilt section to an actual analytic closed Cartier divisor.
- **RelativeFarguesFontaine RF3**: Supply this fixed-field analytic estimate as the seed for the relative owner.

Acceptance:

- Both the closed immersion and its ideal sheaf are provided.

Direct prerequisites: `FarguesFontaineDiamonds:F4/rational_strict_exactness`, `AdicSpacesPartII:R0/closed-adic-subspaces-and-embeddings`, `AdicSpacesPartII:R0`.

Sources: [SW](https://people.mpim-bonn.mpg.de/scholze/Berkeley.pdf), Lecture 5, Definitions 5.3.2, 5.3.7; Proposition 5.3.8; Remark 5.3.9, pp.38–40.

Proposed library: module `TauCeti/AlgebraicGeometry/FarguesFontaine/DiamondComparison`, namespace `TauCeti.FFDiamond`.

Atlas planet: **The closed untilt Cartier divisor**.

### The exact analytic divisor sequence

Identifier: `FarguesFontaineDiamonds:F4/untilt_sheaf_exactness`. Kind: **theorem**.

The canonical sequence 0→O_Y --xi→ O_Y → i_{u,*}O_{S^sharp}→0 is exact as sheaves of modules on Y, with strict exact quotient sequences on rational affinoid charts. The last map is the actual untilt restriction map. With unit-rescaled generators, the two sequences are identified by the unit multiplication in the first term.

Proposed declaration: `TauCeti.FFDiamond.untilt_sheaf_exactness`.

Hypotheses and conventions:

- p is prime; F is a complete rank-one characteristic-p perfectoid field; S = Spa(F, O_F).
- Y, X, q, Frobenius and interval pairs are the actual objects and maps supplied by AdicSpaces Layer 6.

Construction and proof:

1. Check exactness on a rational basis via the topological quotient identifications.
2. Sheafify/glue these maps; use the actual kernel ideal and retain the unit-change identification.

Acceptance:

- The sheaf quotient is i_*O_{S^sharp}, not merely a sheaf supported on the same point.

Direct prerequisites: `FarguesFontaineDiamonds:F4/untilt_closed_divisor`, `FarguesFontaineDiamonds:F4/rational_strict_exactness`.

Sources: [FS](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), II.1.4, pp.49–50; II.1.18, p.55.

Proposed library: module `TauCeti/AlgebraicGeometry/FarguesFontaine/DiamondComparison`, namespace `TauCeti.FFDiamond`.

### The descended untilt divisor on X

Identifier: `FarguesFontaineDiamonds:F4/curve_untilt_divisor`. Kind: **construction**.

The composite j_u=q∘i_u:S^sharp→X is a closed Cartier immersion. On each wandering chart of X its inverse image is obtained from the appropriate Frobenius translate of i_u; these local ideal sheaves glue to the Cartier ideal I_{D_u}. The pullback q^*I_{D_u} has support the locally finite union of all translates of the untilt locus. The ideal on X is not asserted globally principal and is not defined by a divergent product of all phi-translates of xi.

Proposed declaration: `TauCeti.FFDiamond.curve_untilt_divisor`.

Hypotheses and conventions:

- p is prime; F is a complete rank-one characteristic-p perfectoid field; S = Spa(F, O_F).
- Y, X, q, Frobenius and interval pairs are the actual objects and maps supplied by AdicSpaces Layer 6.

Construction and proof:

1. For a fixed-field untilt the zero locus lies at its rank-one radius, so distinct phi-translates are disjoint. On any bounded-radius chart only finitely many translates occur.
2. Use the actual quotient-chart isomorphisms to transport the local closed Cartier ideals, and compare them on overlap graphs.
3. Apply ideal-sheaf and closed-immersion gluing; identify the descended space with S^sharp and its map with q∘i_u.

API:

- `TauCeti.FFDiamond.curve_untilt_divisor_map` (data): The underlying immersion is exactly q∘i_u.
- `TauCeti.FFDiamond.curve_untilt_divisor_chart` (characterisation): On a wandering chart it is the transported primitive equation of the appropriate Frobenius translate.
- `TauCeti.FFDiamond.curve_untilt_divisor_pullback` (compatibility): Pullback to Y is the locally finite union of the translated Cartier divisors, with their ideal sheaves.

Unit tests:

- `TauCeti.FFDiamond.curve_untilt_divisor_residue` (computation): For F=C^flat and untilt C, the closed point of X defined by this construction has completed residue field C.
- `TauCeti.FFDiamond.curve_untilt_divisor_frobenius` (compatibility): Precomposing the marking by phi_S gives the same closed divisor on X, because its lifted graph is related by phi_Y.
- `TauCeti.FFDiamond.curve_untilt_divisor_window_change` (compatibility): Two overlapping wandering windows yield the same Cartier ideal on their common quotient open, including the transition unit.

Uses:

- **FS II.1.18**: Descend the analytic untilt divisor to the existing fixed curve.
- **RelativeFarguesFontaine RF3**: Provide the fixed-field orbit-invariant divisor map; arbitrary base extension belongs there.

Acceptance:

- The divisor on X retains the untilt residue field.

Direct prerequisites: `FarguesFontaineDiamonds:F4/untilt_closed_divisor`, `FarguesFontaineDiamonds:F4/untilt_sheaf_exactness`, `FarguesFontaineDiamonds:F2/adic_graph_relation`, `FarguesFontaineDiamonds:F2/quotient_spatiality_choices`, `AdicSpacesPartII:R0`.

Sources: [FS](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), II.1.4, pp.49–50; II.1.18, p.55.

Proposed library: module `TauCeti/AlgebraicGeometry/FarguesFontaine/DiamondComparison`, namespace `TauCeti.FFDiamond`.

Atlas planet: **The descended untilt divisor**.

### Frobenius-orbit invariance of the marked-untilt divisor

Identifier: `FarguesFontaineDiamonds:F4/untilt_orbit_invariance`. Kind: **theorem**.

The assignment u↦D_u is invariant under integer Frobenius shifts of the marking, with canonical isomorphism of closed immersions over X. On the Y lift, the section (id,u∘phi_S) is related to (id,u) by reparametrization of S and the positive phi_Y action: (phi_S×id)∘(id,u)∘phi_S^−1=(id,u∘phi_S^−1). Thus positive phi_Y corresponds to inverse precomposition of the marking when one resets the first coordinate to id. Prove this convention explicitly. The resulting fixed-field map factors through maps S→Spd Q_p/phi^Z in the stated FS sense; this moduli quotient is distinct from X^diamond.

Proposed declaration: `TauCeti.FFDiamond.untilt_orbit_invariance`.

Hypotheses and conventions:

- p is prime; F is a complete rank-one characteristic-p perfectoid field; S = Spa(F, O_F).
- Y, X, q, Frobenius and interval pairs are the actual objects and maps supplied by AdicSpaces Layer 6.

Construction and proof:

1. Compute the graph identity under alpha_F, retaining the reparametrization.
2. Use q∘phi_Y=q and transport the theta kernel ideals contravariantly; identify the closed immersions over X.
3. Use the marked-untilt quotient’s sheaf descent for the factorization, restricted to the fixed field. No classification of all closed points or identification of quotient functors is made.

Acceptance:

- The graph computation distinguishes the positive generator from its inverse before quotienting.
- The orbit relation does not produce a sheaf morphism X^diamond→S.

Direct prerequisites: `FarguesFontaineDiamonds:F4/curve_untilt_divisor`, `FarguesFontaineDiamonds:F4/section_untilt_equiv`, `FarguesFontaineDiamonds:F2/frobenius_equivariance`, `DiamondsAndVStacks:D0/groupoid-quotients-and-two-fibre-products`.

Sources: [FS](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), II.1.4, pp.49–50; II.1.18, p.55.

Proposed library: module `TauCeti/AlgebraicGeometry/FarguesFontaine/DiamondComparison`, namespace `TauCeti.FFDiamond`.

## F5. Enhanced derived and adic coefficient comparison

Fix first a discrete commutative coefficient ring Lambda killed by an
ell-power, ell≠p. There are two relevant categories: the ordinary enhanced
derived category of the étale topos and its left completion. An exact equivalence
of module topoi induces the former in all degrees. C2 identifies the diamond
D_et with the left-completed category; without additional completeness, this
identification is used directly only for bounded-below ordinary complexes.
For a completed object, global sections are compared using its compatible
Postnikov tower and the actual natural maps, not an abstract isomorphism of
cohomology groups.

For adic coefficients, Lambda is complete for I, a finite regular sequence ideal
containing an integer prime to p. L0 supplies derived I-completeness and the
inverse-limit equivalence for Lambda/I^n. Since these finite levels are killed
by a power of a prime-to-p integer, their finitely many primary pieces reduce to
the displayed torsion range through C2's requested coefficient devissage.
Transition natural transformations must be checked before taking the enhanced
limit. Tensor means completed tensor where L0 requires it. The constant Z_ell
system, I=(ell), ell≠p, is the principal test. This route supplies neither a
Z_p comparison nor a rational ell-adic theory without a separately specified
localization.

### The enhanced left-completed étale comparison

Identifier: `FarguesFontaineDiamonds:F5/completed_derived_equiv`. Kind: **construction**.

For the stated discrete Lambda, enhance the exact sheaf equivalence induced by eta to an equivalence of ordinary enhanced derived categories of the two étale topoi, then left-complete in the standard t-structure. Compose with C2’s identification on the diamond side to obtain E_Lambda:hat D(X_et,Lambda) ≃ D_et(X^diamond,Lambda). Retain the inverse, unit, counit and t-exactness as coherent enhanced data, not only an equivalence of triangulated homotopy categories.

Proposed declaration: `TauCeti.FFDiamond.completed_derived_equiv`.

Hypotheses and conventions:

- The fixed curve and site equivalence of F3.
- Lambda is a discrete commutative torsion coefficient ring killed by an ell-power, ell a prime different from p; the enhanced categories and left completions are supplied by C2.

Construction and proof:

1. Use the exact inverse equivalences of sheaves of Lambda-modules; they induce compatible functors on the supplied enhanced derived categories and truncation towers.
2. Take the inverse limit of the truncation comparisons, and apply C2’s left-completion theorem for locally spatial diamonds.

API:

- `TauCeti.FFDiamond.completed_derived_equiv_t_exact` (structure): E_Lambda preserves both halves of the standard t-structure and commutes with truncations.
- `TauCeti.FFDiamond.completed_derived_equiv_heart` (compatibility): On degree-zero sheaves it is the equivalence induced by eta.
- `TauCeti.FFDiamond.completed_derived_equiv_inverse` (data): The inverse and its coherent unit/counit are induced by the inverse site comparison and truncation limits.

Unit tests:

- `TauCeti.FFDiamond.completed_derived_equiv_constant` (computation): The constant sheaf Lambda in degree zero maps to the constant sheaf Lambda on X^diamond.
- `TauCeti.FFDiamond.completed_derived_equiv_bounded_below` (compatibility): For every bounded-below complex, E_Lambda agrees with the ordinary enhanced site comparison followed by C2’s inclusion.
- `TauCeti.FFDiamond.completed_derived_equiv_tower` (characterisation): For an unbounded compatible Postnikov tower, E_Lambda is the limit of its finite-below truncation comparisons; the underlying uncompleted representative is not declared equal to this limit.

Uses:

- **ECD Proposition 14.15 and Remark 14.14**: Identify the left-completed site-derived category with D_et.
- **F5 adic coefficients**: Use this comparison at every finite coefficient level.

Acceptance:

- No ordinary unbounded complex is silently identified with its left completion.

Direct prerequisites: `FarguesFontaineDiamonds:F3/site_equiv`, `DiamondEtaleCohomology:C2`, `mathlib:CategoryTheory.Equivalence`.

Sources: [ECD](https://arxiv.org/pdf/1709.07343v4), Definition 14.13; Remark 14.14; Proposition 14.15, p.88.

Proposed library: module `TauCeti/AlgebraicGeometry/FarguesFontaine/DiamondComparison`, namespace `TauCeti.FFDiamond`.

Atlas planet: **The left-completed étale comparison**.

### The ordinary comparison in the bounded-below range

Identifier: `FarguesFontaineDiamonds:F5/ordinary_bounded_below`. Kind: **theorem**.

On D^+(X_et,Lambda), E_Lambda agrees with the ordinary site-derived comparison and gives D^+(X_et,Lambda) ≃ D_et^+(X^diamond,Lambda). Ordinary enhanced derived categories of the two étale sites are equivalent in all degrees because their module topoi are exactly equivalent; the comparison with diamond D_et in unbounded degrees is the separately stated left-completed comparison, without an extra left-completeness assumption.

Proposed declaration: `TauCeti.FFDiamond.ordinary_bounded_below`.

Hypotheses and conventions:

- The fixed curve and site equivalence of F3.
- Lambda is a discrete commutative torsion coefficient ring killed by an ell-power, ell a prime different from p; the enhanced categories and left completions are supplied by C2.

Construction and proof:

1. Use t-exactness and C2’s bounded-below agreement.
2. Keep the ordinary topos-derived equivalence separate from the identification with the enhanced v-derived subcategory.

Acceptance:

- A degree-zero module and any shift agree with the ordinary construction.

Direct prerequisites: `FarguesFontaineDiamonds:F5/completed_derived_equiv`, `DiamondEtaleCohomology:C2`.

Sources: [ECD](https://arxiv.org/pdf/1709.07343v4), Definition 14.13; Remark 14.14; Proposition 14.15, p.88.

Proposed library: module `TauCeti/AlgebraicGeometry/FarguesFontaine/DiamondComparison`, namespace `TauCeti.FFDiamond`.

### The actual global-sections comparison map

Identifier: `FarguesFontaineDiamonds:F5/completed_global_sections`. Kind: **theorem**.

Let eta^* be the exact module-sheaf equivalence. For bounded-below A the natural map RΓ(X_et,A)→RΓ(X^diamond_et,eta^*A) induced by the site functor is an equivalence. For a left-completed object represented by the compatible tower A_n=tau_{≥−n}A, the corresponding completed global sections are lim_n RΓ(X_et,A_n); compare them to RΓ_et(X^diamond,E_Lambda A) by the compatible actual finite-truncation comparison maps. The diamond right adjoint preserves this limit. Do not replace this map by a noncanonical equivalence of abstract cohomology groups.

Proposed declaration: `TauCeti.FFDiamond.completed_global_sections`.

Hypotheses and conventions:

- The fixed curve and site equivalence of F3.
- Lambda is a discrete commutative torsion coefficient ring killed by an ell-power, ell a prime different from p; the enhanced categories and left completions are supplied by C2.

Construction and proof:

1. Identify the underived section maps by the terminal object under the site equivalence.
2. Derive via the supplied enhancements; use the exact inverse equivalence for bounded-below objects.
3. For the tower, use right-adjoint preservation of limits and C2’s global-sections/truncation compatibility; take the coherent limit of the maps.

Acceptance:

- On constant Lambda in degree zero the degree-zero comparison sends a section to itself through eta.
- No invariant-sections formula omits derived Frobenius descent.

Direct prerequisites: `FarguesFontaineDiamonds:F5/ordinary_bounded_below`, `FarguesFontaineDiamonds:F5/completed_derived_equiv`, `DiamondEtaleCohomology:C2`.

Sources: [ECD](https://arxiv.org/pdf/1709.07343v4), Definition 14.13; Remark 14.14; Proposition 14.15, p.88.

Proposed library: module `TauCeti/AlgebraicGeometry/FarguesFontaine/DiamondComparison`, namespace `TauCeti.FFDiamond`.

### Pullback and tensor compatibility of the derived comparison

Identifier: `FarguesFontaineDiamonds:F5/derived_pullback_tensor`. Kind: **theorem**.

For inclusions of imported rational and wandering charts, the completed derived comparison commutes with pullback via the coherent square of F3. It is compatible with the enhanced derived tensor product of Lambda-modules in the chosen C2 category (using its completion if that monoidal convention requires it), and with the unit Lambda. These natural isomorphisms agree on nested restrictions, associativity and units; tensor compatibility does not assert that a general inverse limit commutes with ordinary tensor.

Proposed declaration: `TauCeti.FFDiamond.derived_pullback_tensor`.

Hypotheses and conventions:

- The fixed curve and site equivalence of F3.
- Lambda is a discrete commutative torsion coefficient ring killed by an ell-power, ell a prime different from p; the enhanced categories and left completions are supplied by C2.

Construction and proof:

1. Enhance the sheaf-level chart square and its associators.
2. Use the exact monoidal site equivalence and the supplied completed monoidal structure, then compare truncation towers in that structure.

Acceptance:

- The tensor unit maps to Lambda and restriction of its unit isomorphism is the local unit isomorphism.

Direct prerequisites: `FarguesFontaineDiamonds:F5/completed_derived_equiv`, `FarguesFontaineDiamonds:F3/chart_site_compatibility`, `DiamondEtaleCohomology:C2`.

Sources: [ECD](https://arxiv.org/pdf/1709.07343v4), Definition 14.13; Remark 14.14; Proposition 14.15, p.88.

Proposed library: module `TauCeti/AlgebraicGeometry/FarguesFontaine/DiamondComparison`, namespace `TauCeti.FFDiamond`.

### The derived-complete adic coefficient comparison

Identifier: `FarguesFontaineDiamonds:F5/adic_derived_equiv`. Kind: **construction**.

Using L0, define the adic comparison E_{Lambda,I}:D_et,adic(X,Lambda) ≃ D_et(X^diamond,Lambda) by the coherent inverse limit of the completed comparisons E_{Lambda/I^n}. On the adic side D_et,adic is the derived I-complete enhancement of the adic étale-site coefficient system, equivalently the compatible inverse limit of the finite-level categories supplied by L0. The diamond side is L0’s derived I-complete subcategory, not the same ring viewed with the discrete topology.

Proposed declaration: `TauCeti.FFDiamond.adic_derived_equiv`.

Hypotheses and conventions:

- The fixed curve and F3 site equivalence.
- Lambda is complete for I, generated by a finite regular sequence and containing an integer prime to p; the enhanced derived I-complete coefficient system is supplied by L0.

Construction and proof:

1. Construct each finite-level functor, for the torsion coefficients allowed by C2 and the prime-to-p integer hypothesis; extend from the displayed ell-primary specialization by the supplier’s coefficient devissage.
2. Verify coefficient-reduction natural transformations before taking the enhanced inverse limit.
3. Apply L0’s equivalences on both sides and retain the inverse/unit/counit.

API:

- `TauCeti.FFDiamond.adic_derived_equiv_reduce` (compatibility): Derived reduction of E_{Lambda,I}(A) modulo I^n equals E_{Lambda/I^n}(A tensor_Lambda^L Lambda/I^n), coherently in n.
- `TauCeti.FFDiamond.adic_derived_equiv_complete_tensor` (structure): The comparison preserves the completed tensor product Lhat_{I}(A tensor_Lambda^L B), with its unit.
- `TauCeti.FFDiamond.adic_derived_equiv_inverse_limit` (characterisation): The comparison is the L0 inverse limit of its finite-level comparisons, including transition equivalences.

Unit tests:

- `TauCeti.FFDiamond.adic_derived_equiv_zell` (computation): For Lambda=Z_ell, I=(ell), ell≠p, the constant derived-complete Z_ell sheaf reduces to the constant Z/ell^n comparison at every n.
- `TauCeti.FFDiamond.adic_derived_equiv_reduction` (compatibility): For I=(ell), the square for Z/ell^(n+1)→Z/ell^n commutes with derived coefficient reduction.
- `TauCeti.FFDiamond.adic_derived_equiv_completed_unit` (characterisation): The tensor unit is the derived-complete Lambda object, and the tensor comparison is completed tensor; no ordinary tensor is declared complete by definition.

Uses:

- **ECD Proposition 26.2**: Use the enhanced inverse-limit description.
- **F5 adic global sections**: Take the limit of actual finite-level section maps.

Acceptance:

- The construction uses derived completion and compatible reduction data.

Direct prerequisites: `FarguesFontaineDiamonds:F5/completed_derived_equiv`, `AdicCoefficientsAndComparisons:L0`, `mathlib:CategoryTheory.Equivalence`.

Sources: [ECD](https://arxiv.org/pdf/1709.07343v4), Definition 26.1; Proposition 26.2 and proof; Remark 26.3, pp.161–162.

Proposed library: module `TauCeti/AlgebraicGeometry/FarguesFontaine/DiamondComparison`, namespace `TauCeti.FFDiamond`.

Atlas planet: **The adic coefficient comparison**.

### Finite-level and global-sections compatibility for adic coefficients

Identifier: `FarguesFontaineDiamonds:F5/adic_global_sections`. Kind: **theorem**.

The adic comparison commutes with chart pullbacks, derived reduction modulo every I^n, and L0 completed tensor. For A in the adic category, the actual global-sections comparison is the coherent inverse limit of the finite-level maps RΓ(X_et,A_n)→RΓ_et(X^diamond,E_n A_n), using the completed interpretation for unbounded A_n. Both sides are derived I-complete; for Lambda=Z_ell the reductions recover the finite Z/ell^n comparisons. No statement for Z_p or rational ell-adic coefficients is obtained by this completion argument.

Proposed declaration: `TauCeti.FFDiamond.adic_global_sections`.

Hypotheses and conventions:

- The fixed curve and F3 site equivalence.
- Lambda is complete for I, generated by a finite regular sequence and containing an integer prime to p; the enhanced derived I-complete coefficient system is supplied by L0.

Construction and proof:

1. Use L0’s finite-level detection and completed tensor compatibility.
2. The global-sections right adjoints commute with the enhanced limit; transport the actual compatible maps rather than only their values.

Acceptance:

- The Z_ell test is a coherent tower, not an isolated finite-level calculation.

Direct prerequisites: `FarguesFontaineDiamonds:F5/adic_derived_equiv`, `FarguesFontaineDiamonds:F5/completed_global_sections`, `FarguesFontaineDiamonds:F5/derived_pullback_tensor`, `AdicCoefficientsAndComparisons:L0`.

Sources: [ECD](https://arxiv.org/pdf/1709.07343v4), Definition 26.1; Proposition 26.2 and proof; Remark 26.3, pp.161–162.

Proposed library: module `TauCeti/AlgebraicGeometry/FarguesFontaine/DiamondComparison`, namespace `TauCeti.FFDiamond`.

## Review and prototype limits

The suggested file is a signature experiment against individual pinned Mathlib
modules and the available Tau Ceti Spa.Basic module. It defines no alternate
perfectoid, diamond or Cartier carrier. Generic category and point-set parameters
denote the imported objects that the future supplier interfaces must expose.
For instance, a product isomorphism has the genuine categorical type of an
isomorphism to a binary product, and the Frobenius equation has the genuine
composite-morphism type. This is not a construction of a missing v-site.
Likewise, the file uses the actual Witt theta map for Teichmuller evaluations and
an actual normed complete ring for the implication from a positive lower bound
to injectivity and closed image.

The geometric hypotheses and enhanced coherent data that cannot yet be typed are
omitted with explicit comments, as the protocol requires. There are no arbitrary
Prop-valued fields standing for those conditions. The full mathematical test
appears beside each named example; its typeable part can be smaller than the full
contract. In particular the characteristic-p exclusion test proves the genuine
obstruction that p is not a unit in a nonzero characteristic-p ring; it does not
pretend that the Spd Q_p carrier is already present. The completed-derived
prototypes show underlying equivalences and natural-isomorphism shapes; their
enhanced content remains a C2/L0 contract and cannot be certified by elaborating
ordinary category signatures.

Spa.Analytic is present in the pinned source but its object file is unavailable
in the shared build. The suggested F0 signature therefore tests the product-open
condition in the actual valuation spectrum, while the packet cites the pinned
Tate analyticity theorem separately. The directly imported Spa.Basic source is
unchanged from the Tau Ceti pin. The shared build uses the pinned Mathlib and a
newer Tau Ceti checkout, so elaboration is evidence for these available signature
shapes, not a claim of a fully rebuilt pinned Tau Ceti environment. All proofs and
constructed comparisons use unimplemented proof placeholders, and every packet node remains unchecked.

A review must check the source gap in the norm proof, the requested integral
recognition bridge, the all-rational-affinoids Cartier criterion, the exact D6
site convention and the enhanced coefficient contracts. It must also distinguish
the two Frobenius computations. In F2 the positive phi_Y acts by phi_S on the
first product factor. In F4, resetting the first coordinate of a translated graph
to the identity uses phi_S inverse and changes the marking in the opposite
direction. Both lead to the same orbit relation, but their generator equations
have different forms. Neither computation identifies the fixed curve diamond
with Div^1=Spd Q_p/phi^Z. A map of underlying topological spaces to |S| cannot
supply a structural morphism of v-sheaves X^diamond→S.

## Supplier contracts

### tauceti:TauCetiRoadmap/AdicSpaces#layer-6-the-adic-farguesfontaine-curve

The complete AdicSpaces Layer 6 output: (p,[varpi])-adic Witt Huber pair, analytic Y=D(p[varpi]), strongly noetherian complete interval pairs with plus rings, actual locally valued-ringed-space wandering-chart isomorphisms, valuation-precomposition Frobenius/radius scaling, adic quotient q, finite two-window cover, and varpi-change isomorphisms. These are imported existing roadmap targets, not baseline implementations.

Consumers: `FarguesFontaineDiamonds:F0/analytic_interface`, `FarguesFontaineDiamonds:F0/qp_factorisation`, `FarguesFontaineDiamonds:F0/chart_category_interface`, `FarguesFontaineDiamonds:F0/choice_transport`, `FarguesFontaineDiamonds:F2/frobenius_equivariance`, `FarguesFontaineDiamonds:F2/adic_graph_relation`, `FarguesFontaineDiamonds:F2/diamond_quotient_cover`, `FarguesFontaineDiamonds:F2/quotient_spatiality_choices`, `FarguesFontaineDiamonds:F4/multiplication_lower_bound`.

### PerfectoidQuotients:Q0

Early integral-algebra bridge used by FS II.1.1 and BMS1 Lemma 3.10(ii): for the displayed [varpi]-complete compatible-root chart A0+, prove the integral perfectoid recognition criterion with [varpi] regular and Frobenius A0+/[varpi]→A0+/[varpi]^p an isomorphism; relate it to the p-complete Q0 predicate whenever that hypothesis holds. The existing Q0 p-complete criterion alone does not establish this chart. No animated quotient theorem is requested.

Consumers: `FarguesFontaineDiamonds:F4/root_annulus_tilt`.

### AdicSpacesPartII:R0

Uniform analytic closed Cartier divisor vocabulary and Berkeley 5.3.8 criterion: an invertible ideal subsheaf embedded in O_X defines a closed Cartier adic subspace exactly when it has closed image on every rational affinoid; quotient plus rings are integral closures. Include gluing and transport along local adic isomorphisms. Existing R0/closed-adic-subspaces-and-embeddings supplies quotient subspaces, but not this Cartier criterion in this generality.

Consumers: `FarguesFontaineDiamonds:F4/untilt_closed_divisor`, `FarguesFontaineDiamonds:F4/curve_untilt_divisor`.

### DiamondEtaleCohomology:C2

Enhanced (not just triangulated) exact module-topos derived categories, the D_et left-completion comparison for locally spatial diamonds, bounded-below agreement, coherent truncations/pullbacks, completed monoidal structure and global-sections right adjoint preserving Postnikov limits. Allow the prime-to-p torsion coefficients needed for all L0 finite levels, by devissage beyond the displayed ell-primary case.

Consumers: `FarguesFontaineDiamonds:F5/completed_derived_equiv`, `FarguesFontaineDiamonds:F5/ordinary_bounded_below`, `FarguesFontaineDiamonds:F5/completed_global_sections`, `FarguesFontaineDiamonds:F5/derived_pullback_tensor`.

### AdicCoefficientsAndComparisons:L0

Derived I-complete coefficient systems for both the adic étale topoi and their diamonds, the enhanced limit equivalence with finite Lambda/I^n categories, coherent derived reductions, completed tensors and global-sections compatibility, for I a finite regular sequence containing an integer prime to p. Include the actual Z_ell,(ell),ell≠p test.

Consumers: `FarguesFontaineDiamonds:F5/adic_derived_equiv`, `FarguesFontaineDiamonds:F5/adic_global_sections`.

### DiamondsAndVStacks:D0

Effective Cech descent for the pseudofunctor U↦Sh(U_et,A) on locally spatial diamonds, for sets and modules over a discrete commutative ring (or a coefficient category with a specified sheaf theory), along surjective étale maps. Give the descent equivalence on objects and morphisms, pullback associators, restriction compatibility and its graph-relation specialization. Also give effective quotient descent for morphisms of sheaves in the chosen Grothendieck topos. D0/groupoid-quotients-and-two-fibre-products supplies an abstract quotient-stack descent API, but does not explicitly establish the stack condition for this étale-sheaf pseudofunctor. Do not substitute pointwise invariant sections or reconstruct the cyclic specialization outside F3.

Consumers: `FarguesFontaineDiamonds:F3/sheaf_descent`, `FarguesFontaineDiamonds:F3/finite_cover_descent`.

## Remaining mathematical gaps

### Classical boundary theorem and finite-root approximation in the analytic divisor proof

FS II.1.4 p.50 and Berkeley 11.3.1 p.95 reduce to affinoid subdomains of a perfected open disc and call the maximum on the Shilov boundary well-known. A proof is still needed that on these domains every analytic function has its spectral supremum detected by specializations leaving the domain, and that the boundary/norm equality survives finite-root approximation and geometric-fiber passage. The statement is planned as boundary_supremum with this exact gap, not claimed proved by the read source. A continuation must read/prove the classical one-variable boundary theorem and verify the approximation step, then close this chain.

Needed by: `FarguesFontaineDiamonds:F4/boundary_supremum`, `FarguesFontaineDiamonds:F4/multiplication_lower_bound`.

### Reviewed audit coverage and supplier review limitations

No FarguesFontaineDiamonds F0–F5 entries occur in the reviewed data/library-coverage.json. Direct pinned source/index checks were performed instead. The supplier DiamondsAndVStacks and PerfectoidSpaces--P0 packets are drafts or have unresolved review findings; RelativeFarguesFontaine--RF0 is read only as a consumer, not imported; exact supplier nodes are contracts, not established implementations. In particular D6’s site interface must be reconciled with ECD v4’s public KL15 definitions. Independent review must check this contract rather than infer correctness from a matching name.

Needed by: `FarguesFontaineDiamonds:F0/analytic_interface`, `FarguesFontaineDiamonds:F0/qp_factorisation`, `FarguesFontaineDiamonds:F0/chart_category_interface`, `FarguesFontaineDiamonds:F0/choice_transport`, `FarguesFontaineDiamonds:F1/bounded_witt_theta`, `FarguesFontaineDiamonds:F1/affinoid_product`, `FarguesFontaineDiamonds:F1/point_naturality`, `FarguesFontaineDiamonds:F1/product_iso`, `FarguesFontaineDiamonds:F1/projection_field_naturality`, `FarguesFontaineDiamonds:F2/frobenius_equivariance`, `FarguesFontaineDiamonds:F2/adic_graph_relation`, `FarguesFontaineDiamonds:F2/diamond_graph_relation`, `FarguesFontaineDiamonds:F2/diamond_quotient_cover`, `FarguesFontaineDiamonds:F2/effective_quotient`, `FarguesFontaineDiamonds:F2/quotient_iso`, `FarguesFontaineDiamonds:F2/quotient_spatiality_choices`, `FarguesFontaineDiamonds:F3/site_equiv`, `FarguesFontaineDiamonds:F3/chart_site_compatibility`, `FarguesFontaineDiamonds:F3/sheaf_descent`, `FarguesFontaineDiamonds:F3/finite_cover_descent`, `FarguesFontaineDiamonds:F4/section_untilt_equiv`, `FarguesFontaineDiamonds:F4/primitive_equation_interface`, `FarguesFontaineDiamonds:F4/root_extension_frame`, `FarguesFontaineDiamonds:F4/root_annulus_tilt`, `FarguesFontaineDiamonds:F4/boundary_supremum`, `FarguesFontaineDiamonds:F4/multiplication_lower_bound`, `FarguesFontaineDiamonds:F4/rational_strict_exactness`, `FarguesFontaineDiamonds:F4/untilt_closed_divisor`, `FarguesFontaineDiamonds:F4/untilt_sheaf_exactness`, `FarguesFontaineDiamonds:F4/curve_untilt_divisor`, `FarguesFontaineDiamonds:F4/untilt_orbit_invariance`, `FarguesFontaineDiamonds:F5/completed_derived_equiv`, `FarguesFontaineDiamonds:F5/ordinary_bounded_below`, `FarguesFontaineDiamonds:F5/completed_global_sections`, `FarguesFontaineDiamonds:F5/derived_pullback_tensor`, `FarguesFontaineDiamonds:F5/adic_derived_equiv`, `FarguesFontaineDiamonds:F5/adic_global_sections`.

### Geometric and enhanced supplier types unavailable at the Lean baseline

The suggested file elaborates only ring-theoretic, norm-theoretic and parametrized categorical shapes against pinned modules. The actual analytic adic/perfectoid/marked-untilt/diamond/site/closed-Cartier/enhanced-left-complete coefficient types are not supplied at the pins. Their geometric conditions are omitted and documented beside each prototype, never replaced by Prop-valued placeholder fields. Generic parameters are to be instantiated with the imported supplier objects; compilation does not certify those instantiations or the omitted hypotheses.

Needed by: `FarguesFontaineDiamonds:F0/analytic_interface`, `FarguesFontaineDiamonds:F0/qp_factorisation`, `FarguesFontaineDiamonds:F0/chart_category_interface`, `FarguesFontaineDiamonds:F0/choice_transport`, `FarguesFontaineDiamonds:F1/bounded_witt_theta`, `FarguesFontaineDiamonds:F1/affinoid_product`, `FarguesFontaineDiamonds:F1/point_naturality`, `FarguesFontaineDiamonds:F1/product_iso`, `FarguesFontaineDiamonds:F1/projection_field_naturality`, `FarguesFontaineDiamonds:F2/frobenius_equivariance`, `FarguesFontaineDiamonds:F2/adic_graph_relation`, `FarguesFontaineDiamonds:F2/diamond_graph_relation`, `FarguesFontaineDiamonds:F2/diamond_quotient_cover`, `FarguesFontaineDiamonds:F2/effective_quotient`, `FarguesFontaineDiamonds:F2/quotient_iso`, `FarguesFontaineDiamonds:F2/quotient_spatiality_choices`, `FarguesFontaineDiamonds:F3/site_equiv`, `FarguesFontaineDiamonds:F3/chart_site_compatibility`, `FarguesFontaineDiamonds:F3/sheaf_descent`, `FarguesFontaineDiamonds:F3/finite_cover_descent`, `FarguesFontaineDiamonds:F4/section_untilt_equiv`, `FarguesFontaineDiamonds:F4/primitive_equation_interface`, `FarguesFontaineDiamonds:F4/root_extension_frame`, `FarguesFontaineDiamonds:F4/root_annulus_tilt`, `FarguesFontaineDiamonds:F4/boundary_supremum`, `FarguesFontaineDiamonds:F4/multiplication_lower_bound`, `FarguesFontaineDiamonds:F4/rational_strict_exactness`, `FarguesFontaineDiamonds:F4/untilt_closed_divisor`, `FarguesFontaineDiamonds:F4/untilt_sheaf_exactness`, `FarguesFontaineDiamonds:F4/curve_untilt_divisor`, `FarguesFontaineDiamonds:F4/untilt_orbit_invariance`, `FarguesFontaineDiamonds:F5/completed_derived_equiv`, `FarguesFontaineDiamonds:F5/ordinary_bounded_below`, `FarguesFontaineDiamonds:F5/completed_global_sections`, `FarguesFontaineDiamonds:F5/derived_pullback_tensor`, `FarguesFontaineDiamonds:F5/adic_derived_equiv`, `FarguesFontaineDiamonds:F5/adic_global_sections`.

## Sources read for this plan

- Laurent Fargues and Peter Scholze, [*Geometrization of the local Langlands
  correspondence*](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf),
  II.1.1–4 and II.1.15–18, including proof interiors, pp.47–50 and 54–55.
  II.1.19's introductory definition fixes the Div^1 boundary.
- Peter Scholze and Jared Weinstein, [*Berkeley Lectures on p-adic Geometry*](https://people.mpim-bonn.mpg.de/scholze/Berkeley.pdf),
  author draft March 27, 2020, Lecture 5 §5.3, pp.38–40, and Lecture 11
  §11.2–3, pp.92–95, including the proofs of 5.3.8 and 11.3.1; Lecture 13
  §13.1 and Definition 13.5.1, pp.108–109 and 112, for the imported adic anchor.
- Peter Scholze, [*Étale cohomology of diamonds*](https://arxiv.org/pdf/1709.07343v4),
  v4 April 2026, Definition 15.5 and Lemma 15.6 with proof; Definition 14.13
  and Propositions 14.15–16; Definition 26.1 and Proposition 26.2 with proof.
  Quotient and morphism-descent passages used by the imports are recorded in
  the packet's source list.
- Kiran S. Kedlaya and Ruochuan Liu, [*Relative p-adic Hodge theory:
  Foundations*](https://arxiv.org/pdf/1301.0792v5), v5, manuscript May 2, 2015,
  Definitions 8.2.16 and 8.2.19, Lemma 8.2.17 with proof and Remark 8.2.18,
  pp.162–163, for the public site convention now cited by ECD.

The packet records the downloaded source hashes and access date. Numbered
references use these editions. The AdicSpaces and AnalyticToricGeometry upstream
documents were read as the specification models for this target-level plan.
