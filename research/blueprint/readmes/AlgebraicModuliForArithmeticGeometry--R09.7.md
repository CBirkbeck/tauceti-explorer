# Characteristic-zero resolution and normal-crossings compactification

This is the target-level plan for **AlgebraicModuliForArithmeticGeometry:R09.7**, continuing the accepted A0-extension packet. It supplies the four R09.7a–d target groups without changing their atlas ids. The pass is complete and the stage is **planned**: every target has a proof route, and the five exact supplier interfaces below remain to be discharged. No implementation is claimed.

The main geometric input is a finite-type scheme over a characteristic-zero field. For an embedded problem its ambient scheme is smooth. Ideals are coherent, centres are closed and smooth, and the exceptional boundary has globally labelled smooth components in order of birth. Local coordinates and formal completions use the residue field of the point, which need not be the ground field. A resolution of a reduced scheme preserves its regular locus. Resolution of an existing smooth pair preserves its already resolved SNC locus under the separate pair hypotheses below.

The numerical Hilbert–Samuel function and invariant in the source are evaluated on closed points. Their upper semicontinuity is asserted on that space. On a smooth affine line the generic stalk has Hilbert–Samuel function 1 while a closed stalk has value ℓ+1, so intrinsic stalk functions on all scheme points cannot satisfy the same statement. Common regular stratum equations and Jacobson closed-point density supply the coherent centres and their properties on the full scheme.

The outputs are a finite resolution compatible with isomorphisms of open subschemes, a smooth projective strict-SNC compactification containing a prescribed smooth quasi-projective open unchanged, and analytic punctured-polydisc charts over the complex numbers. The Cartier separation adapter is independent of characteristic zero: it works for two effective Cartier divisors on any scheme. Arbitrary smooth-morphism functoriality is not asserted by the source used here.

## Inputs and ownership

The pinned baseline is Mathlib **082e2d37e8b0463410cdb532e111cd43d5a66174** and Tau Ceti **f790474821cf4256814db967cb154e7af3d0c369**. The declaration index and the actual Lean statements were checked. Native ideal-sheaf data, pullback ideals, total-degree formal order and differentiation, finite-product well-quasi-ordering, module length, determinants, Rees algebras and analytic inverse-function theorems are imported. The graded-lex exponent order below is a new adapter; Mathlib's pure lexicographic formal-series order is a different order.

**Ordinary blowups belong to [StableReduction, Layer 4](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/StableReduction).** Its Rees/relative-Proj construction, affine charts, universal property, exceptional ideal, strict transform, projectivity and flat base change are imported, not planned again. Its arithmetic-surface desingularization does not resolve arbitrary characteristic-zero schemes. Current Tau Ceti main additionally has `Ideal.affineBlowup`, `reesAlgebra.awayEquivAffineBlowup` and the scheme affine-chart morphisms. These newer results must be reused when this plan is packaged.

The current upstream geometry roadmaps and current Tau Ceti were read before assigning ownership. AlgebraicVectorBundles leaves the general analytification interface to a successor; ModularCurves has analytic carriers rather than a general scheme comparison. Tau Ceti's toric analytic boundary normal-form theorem is an existing special case of the desired local chart contract. It supplies toric regression examples without supplying the general bridge. The general SNC polydisc deduction is owned here at the lower tier, and higher ComplexComparisonPartII layers should consume it.

The exact supplier contracts are:

- **tauceti:TauCetiRoadmap/StableReduction#layer-4-blowups-and-intersection-theory-on-arithmetic-surfaces**: The existing ordinary Rees/relative-Proj blowup API: universal property, projectivity, complement isomorphism, exceptional ideal, strict transform, affine charts and flat base change. Retain arbitrary scheme and locally finite-type ideal generality for the two-regular-generator Cartier adapter; arithmetic-surface desingularization does not supply characteristic-zero resolution. For a regular pivot x_j, identify each standard chart with the subalgebra R[I/x_j] of R[1/x_j], so all original regular elements remain regular on it.
- **SchemeAndStackFoundations:SF.0**: Finite-type coherent ideal-sheaf localization, completion and quotient comparison; étale Jacobian coordinate calculus; scheme open gluing and local smooth embeddings. Completion must use the residue field at a possibly non-rational closed point, and preserve the local ideal-power inclusions. Use Jacobson closed-point density for finite-type schemes over a field to extend the coherent centre and bad-locus assertions from the closed-point numerical algorithm.
- **SchemeAndStackFoundations:SF.3**: Effective Cartier divisors as invertible ideals generated locally by regular elements, their additive/ideal-product dictionary, and pullback when local equations remain regular. Keep unrestricted schemes for separation, with no smoothness or characteristic hypothesis.
- **AlgebraicModuliForArithmeticGeometry:R09.1**: A chosen projective embedding of a quasi-projective variety gives a reduced projective closure with the prescribed dense open. Composition of projective morphisms preserves projectivity. The existing R09.1 packet has projective bundles and cohomology, but no exact projective-closure node.
- **AlgebraicModuliForArithmeticGeometry:A0-extension**: The same bundle supplies the analytification carrier for smooth finite-type complex schemes, restriction to open subschemes and analytic coordinate maps of étale morphisms with their Jacobians. This small carrier/coordinate bridge suffices for the lower-tier SNC polydisc deduction; no GAGA, algebraization or upper-tier ComplexComparisonPartII is imported.

The R09.1 packet was checked for a suitable projective-closure node; its projective-bundle and cohomology nodes do not supply that construction. The same-bundle A0 request is only the smooth finite-type analytification carrier and étale coordinate/Jacobian bridge. It does not import upper-tier GAGA, algebraization or Borel extension.

## Reading and source conventions

The proof source is the **full published 96-page article**, not the shorter Chapter-I arXiv extract:

- [Edward Bierstone and Pierre D. Milman, *Canonical desingularization in characteristic zero by blowing up the maximum strata of a local invariant*](https://mahalex.net/teaching/seminars/gabber/Bierstone-Milman%20Canonical%20desingularization%20in%20characteristic%20zero.pdf). Inventiones mathematicae 128 (1997), 207–302; full 96-page published article. Read on 2026-10-09: §§1–13, pp. 207–302, including proofs in §§5,7–9,11–13; targets use algebraic finite-type characteristic-zero case only.
- [Edward Bierstone and Pierre D. Milman, *Uniformization of analytic spaces*](https://www.researchgate.net/publication/255647609_Uniformization_of_Analytic_Spaces). Journal of the American Mathematical Society 2(4) (1989), 801–836; author-uploaded full text. Read on 2026-10-09: Theorem 5.2.1 and its proof, pp. 820–821; stabilization of Hilbert–Samuel functions of formal ideals.
- [George Boxer and Vincent Pilloni, *Higher Hida theory for Siegel modular forms*](https://www.imo.universite-paris-saclay.fr/~pilloni/higherhidaSiegel.pdf). Author preprint dated 5 November 2025, corresponding to Inventiones mathematicae 244 (2026), 45–141; locator uses author PDF pagination. Read on 2026-10-09: §4.1.10, Proposition-construction 4.1.11 and proof, p. 42; use in 4.1.13, pp. 42–43.

Every statement and proof outline below is in this plan's own words. Page numbers for BM1997 are the journal's printed pages 207–302; Boxer–Pilloni locators use its author PDF's pagination. Completion and Taylor-coordinate choices are local auxiliary choices; invariance is proved through presentation equivalence rather than declaring those choices canonical.

## R09.7a: coordinates, boundary and marked-ideal calculus

The local object is a marked ideal together with its geometric test transformations. A numerical order or an initial cosupport alone is insufficient: the equivalence relation remembers all subsequent admissible tests, including the exceptional tests used to recover exceptional multiplicities. Total, controlled, weak and strict transforms have separate definitions. In particular a Cartier-centre blowup can be the identity on schemes while changing a controlled marked ideal.

### Regular coordinates and algebraic Taylor calculus

**Node:** `AlgebraicModuliForArithmeticGeometry:R09.7/regular-coordinates` · theorem.

For a smooth finite-type k-scheme M with char(k)=0 and a closed point a, an étale coordinate neighbourhood gives a regular parameter system at a and a completion identification Ô_M,a ≃ κ(a)[[X₁,…,Xₙ]]. Taylor coefficients and partial derivatives of regular functions, including those restricted to a smooth coordinate submanifold, are regular after shrinking a single Zariski neighbourhood when the relevant Jacobian determinant is a unit. Coordinate blowup charts preserve these properties. The coefficient field is κ(a), including non-rational closed points.

**Hypotheses.** k is a characteristic-zero field; M is smooth of finite type; a is closed.

**Construction or proof.**

1. Use the étale Jacobian inverse to define differentiation on localized regular functions.
2. Construct the Taylor map over the residue field and apply completeness and the regular-parameter expansion.
3. Use the explicit coordinate-subspace blowup substitutions from StableReduction4 and invert the finitely many required denominators.

**Prerequisites.** `SchemeAndStackFoundations:SF.0`, `tauceti:TauCetiRoadmap/StableReduction#layer-4-blowups-and-intersection-theory-on-arithmetic-surfaces`, `mathlib:MvPowerSeries.pderiv`.

**Source.** BM1997, §3.1–3.8, pp. 231–234; Example 3.12, pp. 236–237; 4.14–4.20, pp. 244–246. The regular local category, coordinate blowup substitutions and common-neighbourhood Taylor coefficients provide the local calculus used here.

**Acceptance.** At a degree-two closed point of A¹ over Q the coefficient field is its quadratic residue field, not Q. The smooth chart Jacobian is inverted on one common open.

### Stalk ideal and local ideal order

**Node:** `AlgebraicModuliForArithmeticGeometry:R09.7/stalk-order` · construction.

For a quasi-coherent ideal I on a scheme X, stalkIdeal(I,a) is the ideal of O_X,a obtained from affine-section ideals by the germ maps. On a Noetherian local ring (A,m), idealOrder(J)=sup{r∈N : J⊆mʳ}, valued in N∪{∞}. For the smooth formal chart κ(a)[[X]], it equals inf{order(f):f∈J}, where order is Mathlib total-degree order; order(0)=∞ and order(A)=0. The local cosupport of (I,d) is {a:idealOrder(I_a)≥d}.

**Construction or proof.**

1. Take the directed sum of images under affine germs; localization compatibility makes it independent of affine neighbourhood.
2. Use powers of the local maximal ideal and the coefficient criterion for formal total degree.
3. Faithful flatness of completion preserves the inclusions into each maximal-ideal power.

**Prerequisites.** `mathlib:AlgebraicGeometry.Scheme.IdealSheafData`, `mathlib:MvPowerSeries.order`, `AlgebraicModuliForArithmeticGeometry:R09.7/regular-coordinates`, `SchemeAndStackFoundations:SF.0`.

**Source.** BM1997, Remark 1.8, p. 216; Proposition 3.13 and Remark 3.14, p. 237; Corollary 3.20, p. 239; 4.1 and 4.7, pp. 241–243. Ideal containment in powers of the maximal ideal defines order; transform order and Hilbert–Samuel comparison connect it to the subsequent presentation invariant.

**Uses.** BM4.1,4.7: Define cosupport and normalized presentation order. R09.7b invariant: Compare geometric orders with native formal-series order.

**API.**

- `stalkIdeal_affine` (characterisation): An affine germ identifies stalkIdeal with localization of the corresponding section ideal.
- `idealOrder_eq_iInf` (characterisation): In the finite-variable formal chart, idealOrder(J)=inf_{f∈J} MvPowerSeries.order(f).
- `idealOrder_span` (characterisation): For a finite generating family, its ideal order is the minimum of the generators’ orders.

**Unit tests.**

- `order_zero_ideal`: The zero ideal has order ∞, hence lies in every positive-mark cosupport.
- `order_unit_ideal`: The unit ideal has order 0 and empty positive-mark cosupport.
- `order_two_generators`: In k[[x,y]], (x³,y⁵) has order 3; replacing minimum by sum would fail.

**Acceptance.** Compare the affine germ ideal, completed ideal and finite-generator minimum; preserve infinity for the zero ideal and order zero for the unit ideal.

### Ordered simple normal-crossings boundary

**Node:** `AlgebraicModuliForArithmeticGeometry:R09.7/snc-boundary` · definition.

On a smooth finite-type k-scheme M, an ordered SNC boundary is a finite birth-ordered family of smooth effective Cartier hypersurfaces H_i, with distinct germs at every intersection, such that around every point an étale coordinate chart identifies each incident H_i with a different coordinate hyperplane; nonincident components miss a smaller chart. A closed smooth submanifold N has simultaneous SNC with E when the same coordinates also make N a coordinate subspace not contained in any H_i used in its presentation. The empty boundary is allowed. Global labels must not identify two local branches of a self-intersecting component.

**Construction or proof.**

1. Use native ideal-sheaf data for the labelled closed subschemes.
2. Specify an étale coordinate chart and inject incident labels into its coordinate indices.
3. Retain the order of birth separately from the local equations.

**Prerequisites.** `mathlib:AlgebraicGeometry.Scheme.IdealSheafData`, `AlgebraicModuliForArithmeticGeometry:R09.7/regular-coordinates`, `SchemeAndStackFoundations:SF.3`.

**Source.** BM1997, §1, admissibility and normal-crossings convention, p. 213; Example 3.12, pp. 236–237; 4.1, p. 241. Boundary hypersurfaces and centres have simultaneous coordinate equations; globally labelled smooth components are the strict-SNC convention retained by this plan.

**Uses.** BM4.1–4.4: Constrain permissible centres and exceptional test blowups. ShimuraVarieties:V3 and PELModuli:M3: Ensure the compactification boundary has distinct coordinate branches.

**API.**

- `sncBoundary_empty` (characterisation): An empty boundary on a smooth scheme is SNC.
- `sncBoundary_restrict` (functoriality): Restriction to an open subscheme preserves labels and the SNC condition.
- `sncBoundary_coordinate` (characterisation): Distinct coordinate hyperplanes in affine space form an SNC boundary.

**Unit tests.**

- `snc_coordinate_axes`: The two axes of A² are SNC at their intersection.
- `snc_tangent_curves`: y=0 and y=x² in A² are not SNC at0.
- `snc_self_intersection`: A single labelled irreducible nodal curve is not a smooth SNC component.

**Acceptance.** The simultaneous chart has one distinct coordinate per incident global label; tangent branches and a self-intersecting single label fail the definition.

### Marked ideals and weighted presentations

**Node:** `AlgebraicModuliForArithmeticGeometry:R09.7/marked-ideal` · definition.

A marked ideal on smooth M with boundary E consists of a smooth closed N⊆M simultaneous-SNC with E, a coherent ideal J on N, and a positive integer d. Its cosupport is {a∈N:ord_a(J)≥d}. A weighted presentation on N is a finite family (h_i,µ_i), with positive rational marks and µ_i≤ord_a(h_i) at the distinguished point, together with the remaining labelled boundary. Its cosupport is the simultaneous order inequalities. Pairs with mark 0 impose no constraint and are discarded; zero functions and an empty family are retained with infinite normalized order. Passing to a common integral mark D replaces h_i by h_i^(D/µ_i), with D/µ_i positive integral, and takes their generated ideal with mark D.

**Construction or proof.**

1. Discard zero-mark constraints before taking normalized ratios.
2. Choose D divisible by the numerators of the positive rational marks and use the native multiplicativity of formal order.
3. Keep J and its mark together, rather than retaining only the ordinary ideal.

**Prerequisites.** `AlgebraicModuliForArithmeticGeometry:R09.7/stalk-order`, `AlgebraicModuliForArithmeticGeometry:R09.7/snc-boundary`, `mathlib:MvPowerSeries.order_mul`.

**Source.** BM1997, 4.1–4.2, p. 241; Construction 4.23, p. 247. Finite function-and-positive-mark families on a smooth submanifold define presentations; a common integral mark identifies the ideal-based adapter.

**Uses.** BM4.18,4.23: Retain the weights in coefficient and residual presentations. BM6.12–6.15: Carry equimultiple loci through recursive invariant construction.

**API.**

- `markedIdeal_cosupport` (characterisation): Membership is exactly ord_a(J)≥d.
- `weightedPresentation_commonMark` (equivalence): Powering to a common positive mark preserves all allowed test cosupports.
- `markedIdeal_rescale` (compatibility): (J,d) and (Jʳ,rd) are test-equivalent for r>0.

**Unit tests.**

- `mark_changes_cosupport`: (x²,2) contains0 whereas (x²,3) does not.
- `marked_zero_and_unit`: The zero ideal has full cosupport and the unit ideal has empty cosupport for d>0.
- `weighted_common_mark`: Pairs (x²,2),(y³,3) become ((x⁶,y⁶),6), not ((x²,y³),6).

**Acceptance.** Marks remain part of the data and control the order threshold; common-mark conversion preserves cosupport while a changed mark alone need not.

### Permissible smooth centres

**Node:** `AlgebraicModuliForArithmeticGeometry:R09.7/permissible-centre` · definition.

A permissible centre for (N,J,d,E) is a closed smooth C⊆N contained in its cosupport, with C and E simultaneously coordinate subspaces/hyperplanes in smooth local coordinates. For controlled-transform divisibility require J⊆I_Cᵈ, which is equivalent to the cosupport condition along the smooth centre in this setting. A centre may be contained in a boundary component; simultaneous SNC is the convention, not disjointness. A resolution centre must also lie in the current invariant stratum selected by the algorithm.

**Construction or proof.**

1. Combine smoothness, equimultiplicity and one simultaneous coordinate system.
2. In regular coordinates expand in the centre variables to identify order along C with containment in I_Cᵈ.
3. Use the imported blowup chart theorem to preserve smoothness and SNC.

**Prerequisites.** `AlgebraicModuliForArithmeticGeometry:R09.7/marked-ideal`, `AlgebraicModuliForArithmeticGeometry:R09.7/regular-coordinates`, `tauceti:TauCetiRoadmap/StableReduction#layer-4-blowups-and-intersection-theory-on-arithmetic-surfaces`.

**Source.** BM1997, 4.3(i), p. 242; 4.15, p. 245; 6.7, pp. 255–256. An admissible centre is smooth, lies in the presentation cosupport and has simultaneous normal crossings with the boundary.

**Uses.** BM4.4(i): Ensure division by the exceptional equation is regular. BM1.14,10.3: Validate the globally selected centres.

**API.**

- `permissibleCentre_idealPower` (characterisation): J⊆I_Cᵈ supplies controlled-transform divisibility.
- `permissibleCentre_boundaryContained` (characterisation): A coordinate centre contained in some H_i remains permissible if the order condition holds.
- `permissibleCentre_snc_after` (compatibility): A permissible blowup has smooth ambient space and updated SNC boundary.

**Unit tests.**

- `centre_contained_in_boundary`: For E={x=0}, (x²,y²) marked 2 in A², the origin is permissible.
- `centre_outside_cosupport`: For (x,2), the origin is not permissible.
- `centre_tangent_to_boundary`: C={y=x²} and H={y=0} in A² fail the simultaneous-coordinate condition at0.

**Acceptance.** Check smoothness, closed immersion, simultaneous SNC and the ideal-power inclusion before forming a controlled transform; boundary-contained centres are allowed.

### Controlled transform and transform comparisons

**Node:** `AlgebraicModuliForArithmeticGeometry:R09.7/controlled-transform` · construction.

For a permissible blowup π:M′→M with new exceptional ideal L=I_Enew, totalTransform(J)=J·O_N′, controlledTransform(J,d)=L^(−d)·totalTransform(J), with mark d unchanged. This notation means the unique ideal J′ with totalTransform(J)=LᵈJ′. StrictTransform(J) is saturation of totalTransform(J) by all powers of L; weakTransform(J) divides by the actual generic order along C. These are different operations. Update the boundary by strict transforms of old components plus the newly born exceptional hypersurface, even when blowing up a Cartier centre makes π an isomorphism.

**Construction or proof.**

1. Import ordinary blowup, invertibility of L, affine charts and strict transform from StableReduction4.
2. Use J⊆I_Cᵈ to divide in each chart; transition units identify the ideals.
3. Compare division by d, by actual centre order, and saturation; flat base change follows the imported blowup comparison and flat ideal extension.

**Prerequisites.** `AlgebraicModuliForArithmeticGeometry:R09.7/permissible-centre`, `tauceti:TauCetiRoadmap/StableReduction#layer-4-blowups-and-intersection-theory-on-arithmetic-surfaces`, `mathlib:AlgebraicGeometry.Scheme.IdealSheafData.comap`.

**Source.** BM1997, Proposition 3.13 and Remark 3.14, p. 237; 4.4(i)–4.5, p. 242; Lemma 5.1, p. 248. Admissible transforms divide by the marked exceptional power; the local strict transform uses centre order, and an identity Cartier blowup can still change marked data.

**Uses.** BM4.12,4.19: Derive derivative and coefficient transform formulas. BM6,7.20: Track the invariant through actual blowups.

**API.**

- `controlledTransform_factor` (characterisation): Total transform=Lᵈ·controlled transform.
- `controlledTransform_identityCartier` (characterisation): A Cartier-centre identity blowup still divides the marked ideal by the centre equation to power d.
- `controlledTransform_flatBaseChange` (compatibility): Whenever the pulled-back marked ideal and centre remain permissible, flat base change identifies their controlled transforms.

**Unit tests.**

- `cusp_controlled_chart`: For (z²−x³,2) at the origin, the x-chart gives z=xw and controlled equation w²−x; total equation is x²(w²−x).
- `different_from_strict`: For (x³,2) blown up at the origin of A², the x-chart controlled ideal is(x), while the strict transform is the unit ideal.
- `cartier_identity_not_trivial`: Blowing up centre(x) on A¹ transforms (x³,2) to(x,2), despite the underlying map being an isomorphism.

**Acceptance.** Distinguish total, controlled, weak and saturated strict ideals on the same chart, including a Cartier-centre blowup that is the identity on schemes.

### Presentation equivalence under test transformations

**Node:** `AlgebraicModuliForArithmeticGeometry:R09.7/test-equivalence` · definition.

Two presentations with the same labelled boundary are equivalent if their cosupports agree after every finite admissible test sequence, including equality of the conditions for a point upstairs to remain in a transformed cosupport. Full equivalence permits (i) permissible controlled blowups, (ii) product with A¹ at (a,0), adding the artificial boundary t=0, and (iii) blowup of the intersection of two boundary hypersurfaces with pure pullback, without controlled division. The weaker relations use only (i,ii), or the restricted relation s*: an exceptional block follows a type (ii) or preceding type (iii) step; after a product it successively blows up the artificial/new exceptional hypersurface against strict transforms of one fixed old H, at the point on that strict transform. Empty test sequences are included. Equal initial cosupport alone is insufficient.

**Construction or proof.**

1. Define finite geometric test chains with the source’s three distinct transform laws.
2. Quantify cosupport equality over every allowed finite chain, not only the first blowup.
3. Restrict admissible type (iii) blocks exactly as in4.10 to obtain s*.

**Prerequisites.** `AlgebraicModuliForArithmeticGeometry:R09.7/controlled-transform`, `AlgebraicModuliForArithmeticGeometry:R09.7/marked-ideal`, `AlgebraicModuliForArithmeticGeometry:R09.7/snc-boundary`, `tauceti:TauCetiRoadmap/StableReduction#layer-4-blowups-and-intersection-theory-on-arithmetic-surfaces`.

**Source.** BM1997, Definitions 4.6 and 4.10, pp. 242–244. The three test laws and the full, two-type and restricted exceptional-block policies define equivalence by persistence of transformed cosupports.

**Uses.** BM4.8,4.11: Recover normalized orders from test-equivalence classes. BM4.24: Use s*, rather than full equivalence, for residual presentation compatibility.

**API.**

- `presentationEquivalent_equivalence` (equivalence): Each of the three test policies defines an equivalence relation.
- `presentationEquivalent_transform` (functoriality): A permitted first test carries equivalent presentations to equivalent presentations.
- `presentationEquivalent_strength` (relation): Full equivalence implies s*, which implies(i,ii) equivalence; converses are not asserted.

**Unit tests.**

- `rescaling_test_equivalence`: (x²,2) and(x⁴,4) are equivalent under full tests.
- `same_initial_cosupport_fails`: (x²,1) and(x³,1) on A¹ have the same initial cosupport; repeated Cartier-centre controlled blowups distinguish them.
- `exceptional_pullback_not_division`: A type (iii) chart x=t,y=tv pulls x²y to t³v with no division by its mark.

**Acceptance.** Include the empty chain, all subsequent admissible points and the exact restricted exceptional blocks; equal initial cosupport does not establish equivalence.

### Normalized order and exceptional residual order

**Node:** `AlgebraicModuliForArithmeticGeometry:R09.7/normalized-orders` · construction.

For a weighted presentation P=(N,{(h_i,µ_i)},E), µ(P)=min_i ord_a(h_i)/µ_i. If finite, µ_H(P)=min_i ord_{H∩N}(h_i)/µ_i and ν(P)=µ(P)−Σ_Hµ_H(P)≥0. If every h_i=0 or the family is empty, µ(P)=ν(P)=∞; no subtraction∞−∞ is performed. The exceptional order is generic divisibility by the boundary equation, not order at a.

**Construction or proof.**

1. Use local-order and coordinate-divisibility definitions.
2. Clear rational marks to compare finite ratios.
3. Separate the infinite branch before computing residual order.

**Prerequisites.** `AlgebraicModuliForArithmeticGeometry:R09.7/marked-ideal`, `AlgebraicModuliForArithmeticGeometry:R09.7/stalk-order`, `AlgebraicModuliForArithmeticGeometry:R09.7/snc-boundary`.

**Source.** BM1997, Definitions 4.7 and 4.9, p. 243. The minimum function order divided by its mark gives normalized order; subtracting boundary multiplicities gives the residual order, with infinity treated separately.

**Uses.** BM4.23: Choose the residual presentation and terminal monomial branch. BM6.15: Supply each rational entry of the complete invariant.

**API.**

- `normalizedOrder_commonMark` (characterisation): For common mark d, µ=ord_a(J)/d.
- `exceptionalOrder_divisibility` (characterisation): dµ_H is the largest exponent of x_H dividing all common-mark generators.
- `residualOrder_nonnegative` (characterisation): For finite µ, ν=µ−Σµ_H≥0; in the zero presentation ν=∞.

**Unit tests.**

- `exceptional_is_not_point_order`: For (x²y³,2) with E={x=0}, µ=5/2, µ_H=1 and ν=3/2.
- `monomial_residual_zero`: For the same pair with E={x=0,y=0}, ν=0.
- `empty_presentation_infinite`: An empty coefficient family has residual order ∞, not0.

**Acceptance.** For x²y³ marked 2, recover total normalized order 5/2, exceptional x-order 1 and residual order 3/2 with only the x-boundary; preserve the empty-family infinity branch.

### Orders recovered from test equivalence

**Node:** `AlgebraicModuliForArithmeticGeometry:R09.7/orders-invariant` · theorem.

For presentations of the same codimension, normalized order µ is invariant under (i,ii) equivalence. If µ is finite, each labelled exceptional order µ_H and henceν is invariant under s* equivalence. Codimension must remain fixed for these comparisons.

**Construction or proof.**

1. After product with a line, follow the distinguished axis through β point blowups and α controlled Cartier-centre steps. Their admissibility is equivalent to β(µ−1)−α≥1; these inequalities recover µ.
2. For a fixed boundary H, use the restricted exceptional chain x_H=tʲy_H. The eventual normalized-order differences recover µ_H.
3. Subtract the finitely many recovered exceptional contributions.

**Prerequisites.** `AlgebraicModuliForArithmeticGeometry:R09.7/test-equivalence`, `AlgebraicModuliForArithmeticGeometry:R09.7/normalized-orders`, `AlgebraicModuliForArithmeticGeometry:R09.7/controlled-transform`.

**Source.** BM1997, Propositions 4.8 and 4.11, pp. 243–244; proofs§5, pp. 248–251. Two-type equivalence recovers normalized order; the restricted exceptional tests additionally recover each labelled exceptional multiplicity.

**Acceptance.** The proof includes controlled Cartier-centre steps, although their underlying blowup is an identity. Do not assert residual-presentation invariance under arbitrary exceptional chains.

### Maximal contact in the permitted characteristic-zero case

**Node:** `AlgebraicModuliForArithmeticGeometry:R09.7/maximal-contact` · theorem.

Let a presentation F on smooth N satisfy µ(F)=1. Suppose an integral-mark pair (f*,d) has ord_a(f*)=d and a d-th derivative in a coordinate x_m transverse to every remaining boundary component is a unit at a. Then z=∂_(x_m)^(d−1)f* has order 1; adjoining (z,1) preserves full test equivalence. Its hypersurface is smooth, contains the cosupport and remains simultaneous-SNC with the boundary after every allowed test transform. This applies to normalized presentations with empty remaining boundary and to the source’s inductively transformed presentations; it is not a theorem about arbitrary marked ideals with boundary.

**Hypotheses.** The remaining-boundary transverse derivative condition is required.

**Construction or proof.**

1. Choose a direction where the degree-d initial form has nonzero d-th derivative; characteristic zero supplies the factorial units.
2. Use the formal implicit-function criterion for z and the derivative blowup formula.
3. Compare derivatives after controlled division, after product and after exceptional pure pullback to prove persistence.

**Prerequisites.** `AlgebraicModuliForArithmeticGeometry:R09.7/regular-coordinates`, `AlgebraicModuliForArithmeticGeometry:R09.7/orders-invariant`, `AlgebraicModuliForArithmeticGeometry:R09.7/controlled-transform`.

**Source.** BM1997, Proposition 4.12 and Remarks 4.13, p. 244; Example 4.16, p. 245; proof, pp. 251–252. A derivative of order one less than a distinguished integral mark supplies maximal contact when the highest derivative is a unit and boundary coordinates are transverse.

**Acceptance.** For f=z²+x³ with mark2, z is a valid maximal-contact coordinate. In characteristic p, f=zᵖ+x^(p+1) has zero p-th z-derivative; this proof and conclusion are not exported there.

### Coefficient presentation with its marks

**Node:** `AlgebraicModuliForArithmeticGeometry:R09.7/coefficient-presentation` · construction.

For an integral weighted presentation F satisfying the maximal-contact hypotheses with contact coordinate z, restrict to N₁={z=0} and take all pairs(c_{f,q},d_f−q), 0≤q<d_f, where c_{f,q}=(1/q!)∂_z^q f|_{z=0}. Keep zero coefficients and an empty family. Equivalently choose a common mark D and take the ideal generated by c_{f,q}^(D/(d_f−q)) with mark D. Ordinary coefficient generators without their weights do not specify the construction.

**Construction or proof.**

1. Taylor-expand in z and retain the coefficients below the assigned mark.
2. Use derivatives of localized regular functions, divided by the factorial unit.
3. Clear the finitely many positive marks without changing the test-equivalence class.

**Prerequisites.** `AlgebraicModuliForArithmeticGeometry:R09.7/maximal-contact`, `AlgebraicModuliForArithmeticGeometry:R09.7/marked-ideal`, `AlgebraicModuliForArithmeticGeometry:R09.7/regular-coordinates`, `mathlib:MvPowerSeries.pderiv`.

**Source.** BM1997, Construction 4.18 and Remarks 4.20, p. 246. Restricting Taylor derivatives of orders below each mark to maximal contact assigns the reduced marks needed for dimension reduction.

**Uses.** BM4.19: Lower the presentation dimension without losing continued cosupport. BM6.12–6.15: Produce the next residual invariant entry.

**API.**

- `coefficientPresentation_cosupport` (characterisation): On z=0 its cosupport equals that of F under the maximal-contact hypotheses.
- `coefficientPresentation_commonMark` (compatibility): The common-mark ideal retains the powers D/(d_f−q).
- `coefficientPresentation_transform` (functoriality): After a permissible chart change, c′_{f,q}=e^(−(d_f−q))π*c_{f,q}.

**Unit tests.**

- `cusp_coefficient_weights`: For z²+x³ marked 2, the coefficient pairs are(x³,2),(0,1), and the residual ratio without boundary is3/2.
- `mixed_coefficient_weights`: For z³+x⁴z+y⁵ marked3, the nonzero coefficient pairs are(y⁵,3),(x⁴,2); common mark6 gives(y¹⁰,x¹²).
- `contact_pure_power`: For zᵈ marked d, all lower coefficients vanish, so the coefficient ideal is zero, not the unit ideal.

**Acceptance.** Retain every reduced mark d−q, including zero coefficients, and compare with the common-mark ideal formed by the corresponding positive integral powers.

### Coefficient dimension reduction and transformation

**Node:** `AlgebraicModuliForArithmeticGeometry:R09.7/coefficient-equivalence` · theorem.

Under the maximal-contact hypotheses, the original presentation on N and its coefficient presentation on N₁ are fully test-equivalent, despite differing codimension by1. After every permitted test sequence, the coefficient presentation of the transformed F is the transformed coefficient presentation, with the controlled coefficient formula and pure-pullback exceptional formula. Their data extend regularly on the same suitably shrunk open.

**Construction or proof.**

1. Use the z-Taylor expansion to express the original order inequality by the lower coefficient inequalities.
2. Use the adjoined(z,1) pair to ensure all relevant transformed cosupport points stay on the contact hypersurface.
3. Compute derivatives in a permissible chart and treat type (iii) separately; divide by the individual coefficient mark only in type (i).

**Prerequisites.** `AlgebraicModuliForArithmeticGeometry:R09.7/coefficient-presentation`, `AlgebraicModuliForArithmeticGeometry:R09.7/test-equivalence`, `AlgebraicModuliForArithmeticGeometry:R09.7/controlled-transform`.

**Source.** BM1997, Proposition 4.19, p. 246; proof pp. 252–253; 4.20, p. 246. Maximal-contact coefficient presentations are equivalent to the original presentation and their controlled coefficient transforms have the reduced marks.

**Acceptance.** Compare the complete allowed test classes and the individual coefficient transform exponents; an initial formal cosupport comparison alone is insufficient.

### Residual presentation and the monomial guard

**Node:** `AlgebraicModuliForArithmeticGeometry:R09.7/residual-presentation` · construction.

For a common-mark coefficient ideal J=(h_i), mark d, finite normalized order µ, let M=Π_Hx_H^(dµ_H), write h_i=M g_i and ν=µ−Σµ_H. If ν>0 take pairs (g_i,dν), and, when ν<1, also (M,d(1−ν)); discard zero-mark constraints and clear any remaining rational marks. If ν=0 use the single pair (M,d). If ν=∞ terminate at the zero presentation. The resulting cosupport is the stratum where the previous invariant and ν retain their values. For positive finite ν its normalized order is 1.

**Construction or proof.**

1. Compute the largest common boundary monomial using exceptional orders.
2. Divide each generator and retain the monomial guard exactly when ν<1.
3. Use the coefficient transform identities to show compatibility under s* chains whose controlled centres lie in the residual cosupport.

**Prerequisites.** `AlgebraicModuliForArithmeticGeometry:R09.7/coefficient-equivalence`, `AlgebraicModuliForArithmeticGeometry:R09.7/normalized-orders`, `AlgebraicModuliForArithmeticGeometry:R09.7/orders-invariant`.

**Source.** BM1997, Construction 4.23, p. 247; Proposition 4.24 andproof pp. 248,253–254. Removing the common boundary monomial and retaining the low-residual guard produces a normalized presentation whose restricted equivalence class is invariant.

**Uses.** BM6.12–6.15: Normalize the next maximal-contact step. BM1.14(4): Separate the ν=0 monomial termination branch fromν=∞.

**API.**

- `residualPresentation_normalized` (characterisation): For 0<ν<∞ the new presentation has normalized order 1.
- `residualPresentation_stratum` (characterisation): Its cosupport cuts out equality of the newly computed residual order within the old stratum.
- `residualPresentation_sstar` (compatibility): Its s* class is determined by the preceding s* class and labelled remaining boundary.

**Unit tests.**

- `residual_requires_guard`: For (x²(x+y),3), E={x=0}, µ=1,µ_H=2/3,ν=1/3: residual pairs(x+y,1),(x²,2); dropping the guard enlarges the locus along x+y=0.
- `residual_monomial_terminal`: For (x²y³,2) with both boundary axes,ν=0 and the residual presentation is(x²y³,2).
- `residual_no_guard_above_one`: For (x²y³,2) with only x=0,ν=3/2; the residual pair is(y³,3) and no negative-mark guard is added.

**Acceptance.** When the residual value lies strictly between zero and one, the monomial guard is included with positive mark; zero and infinity follow their distinct terminal branches.

## R09.7b: Hilbert–Samuel presentations and the complete invariant

For a general embedded scheme the first invariant entry is its entire local Hilbert–Samuel function. The formal division and Samuel certificate inputs are needed to obtain a common regular presentation, then compare that presentation under actual blowups. Merely giving a formal presentation independently at every point would not give a closed maximum locus or a globally glueable centre. History blocks are defined from the first year a prefix attained its current value, not from the whole boundary.

Termination has two distinct parts. Positive residual entries use bounded denominators and the finite depth of the invariant; terminal monomial steps use a decreasing auxiliary mass. The bare invariant can stay constant during such a monomial step. When the Hilbert–Samuel order has incomparable maxima, the finite family of maximal strata is treated explicitly rather than assuming a total numerical maximum.

### Diagram of initial exponents

**Node:** `AlgebraicModuliForArithmeticGeometry:R09.7/initial-diagram` · definition.

For an ideal I⊆K[[X₁,…,Xₙ]], exp(f) of nonzero f is its least nonzero coefficient exponent in graded lexicographic order (|α|,α₁,…,αₙ). D(I)={exp(f):0≠f∈I} is upward closed for componentwise addition; its finitely many minimal vertices generate it under addition by Nⁿ. D(0)=∅ and D(1)=Nⁿ. This is graded lexicographic order, not the native pure lexOrder valuation.

**Construction or proof.**

1. Use total degree before the coordinate lexicographic tie breaker.
2. Multiplication by a monomial proves upward closure.
3. Apply finite-product Dickson well-quasi-ordering to obtain finitely many minimal vertices.

**Prerequisites.** `mathlib:MvPowerSeries.coeff`, `mathlib:Pi.wellQuasiOrderedLE`.

**Source.** BM1997, §3, Diagram of initial exponents, Theorem 3.17 and Corollary 3.19, p. 238; Corollary 3.20, p. 239. Total-degree-then-lexicographic initial exponents give an upward-closed diagram with finitely many vertices; complementary monomials compute the local Hilbert–Samuel function.

**Uses.** BM3.20: Count standard monomials to compute Hilbert–Samuel functions. BM7.2,9.6: Certify supported division and semicoherent presentations.

**API.**

- `initialDiagram_upward` (characterisation): α∈D and β∈Nⁿ implyα+β∈D.
- `initialDiagram_vertices` (characterisation): D is the union of the translates α+Nⁿ for its finite minimal vertices.
- `initialDiagram_monomial` (compatibility): For a monomial-generated ideal, D is the union of the generating translates.

**Unit tests.**

- `diagram_zero_and_unit`: The zero and unit ideals have empty and full diagrams respectively.
- `diagram_xy`: For(x²,xy)⊆K[[x,y]], the vertices are(2,0),(1,1).
- `graded_lex_not_pure_lex`: For x+y², exp=(1,0) because degree1 precedes degree2; pure lex on(x,y) would choose(0,2).

**Acceptance.** Use total degree before exponent lexicographic comparison; the ideal (x,y) has exactly the positive-degree diagram and the zero ideal has the empty diagram.

### Supported formal division and standard bases

**Node:** `AlgebraicModuliForArithmeticGeometry:R09.7/formal-division` · theorem.

Let F_i∈K[[X]] have graded-lex initial exponents α_i. Let Δ_i=(α_i+Nⁿ)\⋃_{j<i}(α_j+Nⁿ), and Δ=Nⁿ\⋃_iΔ_i. Every formal series G admits a unique decomposition G=Σ_iQ_iF_i+R with α_i+supp(Q_i)⊆Δ_i and supp(R)⊆Δ. Choosing generators with exponents the vertices of D(I) gives zero remainder exactly for G∈I; normalized vertex generators have prescribed initial monomials and remaining support outside D(I).

**Construction or proof.**

1. Recursively cancel the least remaining exponent in graded-lex order; the ordering is compatible with addition and only finitely many terms occur in each bounded degree.
2. Completeness gives formal Q_i andR with the required supports.
3. Compare least exponents to prove uniqueness; for vertex generators a nonzero remainder inI would contradict the definition ofD(I).

**Prerequisites.** `AlgebraicModuliForArithmeticGeometry:R09.7/initial-diagram`, `mathlib:MvPowerSeries.coeff`.

**Source.** BM1997, Theorem 3.17, Remark 3.18 and Corollary 3.19, p. 238. Formal division has prescribed, disjoint quotient supports and a complementary remainder; vertex generators yield the supported standard basis.

**Acceptance.** Division is formal, not just a finite polynomial Gröbner division. For I=(x²), remainders may contain1,x and arbitrary y-series coefficients.

### Hilbert–Samuel function and its order

**Node:** `AlgebraicModuliForArithmeticGeometry:R09.7/hilbert-samuel` · definition.

For a Noetherian local ring (A,m), H_A(ℓ)=length_A(A/m^(ℓ+1)), a finite natural number. For I⊆K[[X]], write H_I for H_{K[[X]]/I}; comparisons are pointwise in every ℓ. In a finite-type smooth ambient chart use the residue field κ(a), not ground-field dimension. Invariant words compare this first entry by the pointwise partial order, then subsequent entries lexicographically, so incomparable Hilbert–Samuel functions need not have a single greatest value. In the geometric algorithm a point means a closed point, as fixed on BM1997 p. 213; the unnormalized intrinsic local function at arbitrary scheme points is not being asserted upper semicontinuous.

**Construction or proof.**

1. Use the native module length and quotient by maximal-ideal powers.
2. Finite length follows from finite generation of each graded piece overA/m.
3. Transport length through completion, then apply the formal-division monomial basis.

**Prerequisites.** `mathlib:Module.length`, `AlgebraicModuliForArithmeticGeometry:R09.7/stalk-order`, `AlgebraicModuliForArithmeticGeometry:R09.7/formal-division`, `SchemeAndStackFoundations:SF.0`.

**Source.** BM1997, Closed-point convention and Remarks 1.3, pp. 213–214; Corollary 3.20, p. 239; Theorem 9.2 and Remarks 9.3, p. 276. Lengths of maximal-ideal truncations define the first invariant entry; the hypersurface formula, exponent diagram and completion explain the native formal-series adapter.

**Uses.** BM7–9: Present the first invariant for arbitrary embedding codimension. BM11.14: Detect the resolved reduced/smooth locus and control nonreduced inputs.

**API.**

- `hilbertSamuel_completion` (compatibility): Completion preserves every valueH_A(ℓ).
- `hilbertSamuel_diagram` (characterisation): H_I(ℓ) counts α∉D(I) with |α|≤ℓ.
- `hilbertSamuel_order` (relation): H≤H′ means∀ℓ,H(ℓ)≤H′(ℓ), and equality means equality of all values.

**Unit tests.**

- `hilbertSamuel_smooth`: For K[[x₁,…,xₙ]], H(ℓ)=choose(n+ℓ,n).
- `hilbertSamuel_double_point`: For K[[x]]/(x²), H(0)=1 andH(ℓ)=2 forℓ≥1.
- `hilbertSamuel_nonrational_point`: A degree-two closed point hasH(0)=1 by local length, although its residue field hasQ-dimension2.

**Acceptance.** Use local module length over the point’s residue field and compare every truncation degree; do not replace the first invariant by multiplicity or ground-field dimension.

### Descending Hilbert–Samuel functions stabilize

**Node:** `AlgebraicModuliForArithmeticGeometry:R09.7/hs-stabilization` · theorem.

Fix n. For ideals I_j⊆K[[X₁,…,Xₙ]], if H_{I_j}(ℓ)≥H_{I_{j+1}}(ℓ) for every j,ℓ, then there is j₀ such that all H_{I_j} with j≥j₀ coincide. The statement concerns functions realized by formal ideals in fixed embedding dimension, not arbitrary natural-number-valued functions.

**Construction or proof.**

1. Replace each ideal by its finite-vertex initial diagram. In a strictly decreasing subsequence, successive finite vertex prefixes can be fixed on infinite subsequences because Hilbert counts bound their degrees.
2. Diagonalize these prefixes. Dickson finite generation forces the limit diagram to have finitely many vertices, contradicting continuing strict decreases.

**Prerequisites.** `AlgebraicModuliForArithmeticGeometry:R09.7/hilbert-samuel`, `AlgebraicModuliForArithmeticGeometry:R09.7/initial-diagram`, `mathlib:Pi.wellQuasiOrderedLE`.

**Source.** BM1989, Theorem 5.2.1 and proof, pp. 820–821. For a fixed number of variables, pointwise nonincreasing Hilbert–Samuel functions of formal ideals eventually agree; finite diagram data and subsequences prove stabilization.

**Acceptance.** Fixed ambient dimension is explicit; arbitrary sequences of functions are not covered.

### Standard-basis certificate for a Samuel presentation

**Node:** `AlgebraicModuliForArithmeticGeometry:R09.7/standard-certificate` · definition.

A Samuel certificate is the data (7.2): vertex-indexed f_i∈I with orders d_i=|α_i|, their ordered degree blocks and nested essential-variable blocks Z^ℓ; disjoint division regions Δ_i=α_i+□_i; homogeneous supported division by initial forms in each degree block; supported formal division of every element of I by the f_i; derivative functions g_j=D^β_jf_{i(j)} with β_j=α_{i(j)}−e_j and invertible block Jacobian in the essential variables; and the derivative-vanishing conditions D_Z^βf_i∈(Z^ℓ) for subsequent blocks and β∈D_ℓ with |β|≤K, K≥max_i d_i−1. The support conditions in (2) and (3) are part of the data, not a mere claim that f_i generate I.

**Construction or proof.**

1. Record the five conditions with the degree-block and region indices of(7.2).
2. Formal division provides condition(3); finite homogeneous linear algebra checks condition(2).
3. Derivative Jacobians express essential variables by the formal implicit-function theorem.

**Prerequisites.** `AlgebraicModuliForArithmeticGeometry:R09.7/formal-division`, `AlgebraicModuliForArithmeticGeometry:R09.7/regular-coordinates`, `AlgebraicModuliForArithmeticGeometry:R09.7/hilbert-samuel`.

**Source.** BM1997, (7.1)–(7.2), pp. 261–262; Lemmas 7.3, 7.5 and 7.7, pp. 263–264. Five conditions retain initial vertices, homogeneous supported division, essential-variable derivative coordinates and finite-degree vanishing; these are the certificate required by the Samuel ideal comparison.

**Uses.** BM7.14: Identify the equimultiple derivative ideal with the determinantal Samuel ideal. BM7.20,9.6: Transport certificates and construct algebraic local presentations.

**API.**

- `samuelCertificate_generates` (characterisation): The supported-division condition implies the f_i generate I.
- `samuelCertificate_hilbert` (characterisation): Conditions(1),(2),(3) identifyD(I) and henceH_I.
- `samuelCertificate_finiteCheck` (characterisation): The homogeneous support constraints reduce to bounded-degree matrix tests after the finite-degree theorem.

**Unit tests.**

- `certificate_coordinate_ideal`: ForI=(x,y) the two coordinate generators have order 1 and identity derivative Jacobian.
- `certificate_pure_power`: ForI=(z²), f=z² hasd=2; the essential derivative2z has invertible z-Jacobian in characteristic zero.
- `certificate_wrong_order`: ForI=(x²), assigning the vertex(1) or order 1 to generatorx² violates condition(1).

**Acceptance.** Check all five conditions, including homogeneous and full supported division, the unit derivative Jacobian and finite-cutoff vanishing; merely generating the ideal is insufficient.

### Finite-degree stabilization for monotone diagrams

**Node:** `AlgebraicModuliForArithmeticGeometry:R09.7/finite-degree` · theorem.

Let D⊆Nⁿ be upward closed and monotone: moving an entire exponent from coordinate i to a subsequent coordinate j keeps it in D. Its vertices α_i and disjoint division regions Δ_i=α_i+□_i determine, for any commutative ring A and homogeneous H_i of degree |α_i|, the degree-ℓ family P(ℓ)={Y^βH_i:β∈□_i,|β|=ℓ−|α_i|}∪{Y^γ:γ∉D,|γ|=ℓ}. There is a finite bound k(D) such that if P(k) spans the degree-k homogeneous module for some k≥k(D), then P(ℓ) spans it for every ℓ≥k. The bound depends on the finite diagram cells; it is not just max|α_i|. Apply this criterion to each degree-block diagram in a Samuel certificate.

**Construction or proof.**

1. Partition the complement ofD into finitely many coordinate cells and define the recursive threshold from their cutoffs.
2. Induct on the number of coordinates, splitting multiplication byY₁ from the coordinate-zero quotient.
3. Use monotonicity to propagate supported spans above the threshold.

**Prerequisites.** `AlgebraicModuliForArithmeticGeometry:R09.7/initial-diagram`, `AlgebraicModuliForArithmeticGeometry:R09.7/standard-certificate`.

**Source.** BM1997, Theorem 8.1 and Definition 8.3, p. 274; proof, pp. 274–275; application, p. 282. A bound determined by the fixed monotone diagram makes supported homogeneous spanning in one sufficiently high degree propagate to all higher degrees; complementary monomials are included in the spanning family.

**Acceptance.** The monotone-coordinate hypothesis and finite degree bound are retained. This finite criterion is the step allowing one common algebraic neighbourhood in9.6.

### Determinantal Samuel jet ideal

**Node:** `AlgebraicModuliForArithmeticGeometry:R09.7/samuel-jet-ideal` · construction.

Given generators f_i in regular coordinates and a jet degree k, form B_k with rows α of|α|≤k and columns(i,β) of|β|≤k; its(α,(i,β)) entry isD^(α−β)f_i/(α−β)! when β≤α, otherwise 0. Let r_k be its rank at the distinguished point. I°_S,k is generated by all(r_k+1)-minors of B_k; I_S,k=Σ_{j≤k}I°_S,j. Its zero locus is the simultaneous lower-rank jet condition determining H_x(j)≥H_a(j) for j≤k. Changes of ideal generators preserve the resulting ideal, by coefficient-matrix factorization and Cauchy–Binet.

**Construction or proof.**

1. Interpret columns as truncated multiplesX^βf_i; their cokernel dimension is the truncated quotient dimension.
2. Use factorial-normalized derivatives to make Taylor coefficients regular functions.
3. Include all lower jet degrees, and use the minors’ generator-independence.

**Prerequisites.** `AlgebraicModuliForArithmeticGeometry:R09.7/regular-coordinates`, `AlgebraicModuliForArithmeticGeometry:R09.7/hilbert-samuel`, `mathlib:Matrix.det`, `mathlib:MvPowerSeries.pderiv`.

**Source.** BM1997, Definition 7.10, Remark 7.11 and (7.12), p. 265; Definition 7.13, p. 266; Remarks 9.1, p. 275. Normalized Taylor columns present the truncated jet quotient; minors one larger than the rank at the origin define its rank-defect ideal, and the sum through degree k is the Samuel jet ideal.

**Uses.** BM7.14: Compare the derivative equimultiple equations with intrinsic rank equations. BM9.2,9.6: Prove upper semicontinuity and algebraic semicoherence.

**API.**

- `samuelJetIdeal_vanishing` (characterisation): At a point its vanishing is equivalent to H_x(j)≥H_a(j) for every j≤k.
- `samuelJetIdeal_generatorIndependent` (compatibility): Replacing generators of the same coherent ideal leavesI_S,k unchanged.
- `samuelJetIdeal_monotone` (relation): I_S,k⊆I_S,k+1; all lower-degree rank conditions persist.

**Unit tests.**

- `jet_zero_ideal`: For the zero ideal B_k=0 andI_S,k=0, giving the entire smooth ambient locus.
- `jet_unit_ideal`: For the unit ideal the quotient jet dimension is0 at every point; the rank bound adds no false singular stratum.
- `jet_double_origin`: Forf=x² at0 inA¹, k=1 gives Samuel ideal(x) in characteristic zero; a0-jet-only test would miss the order 2 condition.

**Acceptance.** Normalize Taylor derivatives by factorials, determine rank at the distinguished point and sum the rank-defect ideals through k; verify independence of ideal generators.

### Equimultiple and determinantal Samuel ideals agree

**Node:** `AlgebraicModuliForArithmeticGeometry:R09.7/samuel-presentation-identity` · theorem.

Under a Samuel certificate, write f_i=Σ_γc_iγ(W)Z^γ in the essential variables. For k≥max d_i−1, the ideal generated by the equations of N and D_W^βc_iγ with |γ|<d_i and|β|<d_i−|γ| equals I_S,k from the jet matrices, locally at the distinguished point. Consequently the simultaneous coefficient order inequalities cut out the Hilbert–Samuel equality stratum near a. The derivative inequality is strict; derivatives at the mark are not vanishing equations.

**Construction or proof.**

1. Use the unit derivative Jacobian block to eliminate essential-variable columns.
2. Apply the homogeneous supported division and blockwise determinantal identities to identify the ideals.
3. The lower derivatives exactly express order≥d_i−|γ|; retain the strict derivative bound.

**Prerequisites.** `AlgebraicModuliForArithmeticGeometry:R09.7/samuel-jet-ideal`, `AlgebraicModuliForArithmeticGeometry:R09.7/standard-certificate`, `AlgebraicModuliForArithmeticGeometry:R09.7/coefficient-presentation`, `mathlib:MvPowerSeries.pderiv`.

**Source.** BM1997, Definition 7.9, p. 265; Theorem 7.14 and proof, pp. 266–268; coefficient application in the proof of 9.6, p. 282. Under all five certificate conditions, lower-derivative equimultiple ideals agree with determinantal Samuel ideals beyond the stated degree; coefficient order equations use the strict derivative bound recorded in the correction.

**Acceptance.** For a coefficient c=t² marked 2, generators c,c′ cut out(t); including c″ would give the unit ideal and erase the stratum.

### Hilbert–Samuel control under admissible transformations

**Node:** `AlgebraicModuliForArithmeticGeometry:R09.7/samuel-transform` · theorem.

For a Samuel certificate and a smooth coordinate centre containing its Samuel stratum equations, Hilbert–Samuel functions of the strict transforms do not increase. Equality at a point upstairs holds exactly when each controlled generator f_i′ has its original order d_i; on that equality locus the transformed generators retain the certificate and generate the strict-transform ideal. Coefficients obeyc_iγ′=e^(−(d_i−|γ|))π*c_iγ. The permitted exceptional tests preserve the presented Hilbert–Samuel stratum by pure pullback.

**Construction or proof.**

1. Use supported division to prove that division by the individual generator orders generates the strict transform.
2. Compare the translated homogeneous ideal and the actual chart ideal using finite-jet matrix ranks; specialization cannot lower quotient dimension.
3. Split charts according to the essential and nonessential centre variables. Preserve the certificate exactly in the equality case.

**Prerequisites.** `AlgebraicModuliForArithmeticGeometry:R09.7/standard-certificate`, `AlgebraicModuliForArithmeticGeometry:R09.7/samuel-presentation-identity`, `AlgebraicModuliForArithmeticGeometry:R09.7/controlled-transform`, `AlgebraicModuliForArithmeticGeometry:R09.7/samuel-jet-ideal`.

**Source.** BM1997, Theorems 7.20–7.21, pp. 268–269; Corollary 7.24 and proof, pp. 270–271. Admissible and exceptional formal blowups control Hilbert–Samuel functions and the transformed presentation; equality is characterized by the distinguished transformed generators.

**Acceptance.** Use jet-rank semicontinuity in the specialization argument; do not invoke9.2 recursively. Controlled and strict transforms agree here only because the certificate and equality hypotheses supply the stated generator orders.

### Semicoherent local presentation

**Node:** `AlgebraicModuliForArithmeticGeometry:R09.7/semicoherent-presentation` · definition.

A semicoherent presentation of an invariant value λ near a consists of one Zariski neighbourhood V, a smooth submanifold N⊆V and finitely many regular weighted coefficient functions with labelled remaining boundary, giving at every point of the λ-stratum the same infinitesimal presentation and compatible admissible transforms. Data must be regular on this common V; a separate formal power-series presentation at each point does not meet the condition.

**Construction or proof.**

1. State one neighbourhood and one finite regular family.
2. Require the infinitesimal cosupport and transform properties at every point in the invariant stratum.
3. Localize finitely many denominators together when refiningV.

**Prerequisites.** `AlgebraicModuliForArithmeticGeometry:R09.7/marked-ideal`, `AlgebraicModuliForArithmeticGeometry:R09.7/test-equivalence`, `AlgebraicModuliForArithmeticGeometry:R09.7/regular-coordinates`.

**Source.** BM1997, Definition and remarks 6.4, p. 254; Proposition 6.5, p. 255; 4.14, 4.20 and 4.25, pp. 244,246,248; Theorem 9.6, pp. 278–282. One regular family on a common neighbourhood represents the invariant stratum at its points and remains compatible with infinitesimal equivalence along admissible transformations.

**Uses.** BM1.14: Make invariant strata algebraic and centres glue. BM9.6: Supply the arbitrary-codimension first invariant presentation.

**API.**

- `semicoherentPresentation_restrict` (functoriality): Shrinking the common neighbourhood preserves its data and certificate.
- `semicoherentPresentation_stratum` (characterisation): Its cosupport agrees with the λ-stratum on the chosen neighbourhood.
- `semicoherentPresentation_transform` (compatibility): Permissible transformations produce compatible regular presentations on their chart cover.

**Unit tests.**

- `semicoherent_hypersurface`: A hypersurface equationf with fixed order d on its maximum stratum gives the regular pair (f,d).
- `semicoherent_common_open`: For regular rational-function coefficients, the intersection of finitely many denominator-unit opens is one valid neighbourhood.
- `formal_only_is_insufficient`: An unrelated formal series at each point, with no common regular coefficient functions, is not a semicoherent presentation.

**Acceptance.** One common open carries the regular functions, submanifold and boundary; separately chosen formal germs and a stratum identity without transform compatibility do not suffice.

### Semicoherent presentation of Hilbert–Samuel functions

**Node:** `AlgebraicModuliForArithmeticGeometry:R09.7/hs-semicoherence` · theorem.

For a coherent closed subscheme X⊆M in the finite-type characteristic-zero setting, the function a↦H_X,a on the closed-point space is Zariski upper semicontinuous and locally takes finitely many values. Every closed a has a semicoherent presentation of its Hilbert–Samuel equality stratum by coefficient pairs(c_iγ,d_i−|γ|), with a Samuel certificate, and those presentations have the source’s admissible-transform properties. Generic coordinate changes, coefficient restrictions and supported division are used; formal generators are not assumed to be global regular functions.

**Construction or proof.**

1. Use regular finite-jet determinantal equations and Noetherian stabilization of closed sets for upper semicontinuity. Vertex-prefix well-foundedness gives local finiteness of diagrams.
2. Choose generic characteristic-zero coordinates making the diagram monotone, and construct essential-variable blocks with the invertible derivative Jacobian.
3. Perform supported elimination by Cramer’s rule on finite jets, localize all denominators, and use the finite-degree theorem to extend the homogeneous support conditions to every degree.
4. Identify coefficient-stratum and determinantal ideals by7.14; shrink to a common neighbourhood and apply the transform theorem.

**Prerequisites.** `AlgebraicModuliForArithmeticGeometry:R09.7/semicoherent-presentation`, `AlgebraicModuliForArithmeticGeometry:R09.7/samuel-presentation-identity`, `AlgebraicModuliForArithmeticGeometry:R09.7/samuel-transform`, `AlgebraicModuliForArithmeticGeometry:R09.7/finite-degree`, `AlgebraicModuliForArithmeticGeometry:R09.7/hs-stabilization`.

**Source.** BM1997, Theorem 9.2, p. 276; Theorem 9.6 and proof, pp. 278–282; Remarks 9.15, pp. 282–283; closed-point convention, p. 213. Hilbert–Samuel functions are upper semicontinuous on closed points and admit semicoherent presentations; Samuel certificates and finite-degree diagram control make the formal data regular locally.

**Acceptance.** No formal-series coefficient is silently declared algebraic. The source’s erroneous non-strict derivative bound onp. 282 is replaced byDefinition 7.9’s strict bound.

### Exceptional history at the birth of a prefix

**Node:** `AlgebraicModuliForArithmeticGeometry:R09.7/exceptional-history` · definition.

For a point a on a finite admissible blowup tower, let a_i be its ancestors. E¹(a) consists of the surviving strict transforms of boundary components present at the earliest year when the current Hilbert–Samuel entry first attained its value. Remove E¹. Recursively, Eʳ(a) consists of surviving components of the remaining boundary present at the earliest year when the current prefix through ν_r first attained its value. Set s_r=card(Eʳ), and remove this old block before computing the next residual order. These blocks are disjoint and their birth years and strict-transform labels are retained; counting all exceptional components is not the definition.

**Construction or proof.**

1. Track boundary labels through every strict transform in the tower.
2. For each attained prefix take its least ancestor year, then select surviving components from that year’s remaining boundary.
3. Use prefix nonincrease to make birth years well-defined; Proposition 6.6 identifies blocks on the common prefix stratum.

**Prerequisites.** `AlgebraicModuliForArithmeticGeometry:R09.7/snc-boundary`, `AlgebraicModuliForArithmeticGeometry:R09.7/hilbert-samuel`, `AlgebraicModuliForArithmeticGeometry:R09.7/samuel-transform`.

**Source.** BM1997, Definitions 6.8 and 6.15, pp. 256,259; Proposition 6.6, pp. 255–256; Example 2.1, pp. 226–228. Old boundary blocks are selected at the first year their invariant prefix had its current value; the example shows why birth history affects subsequent centres.

**Uses.** BM6.12–6.15: Supply integer counters and the remaining boundary at every recursive step. BM13.1–13.2: Transport the full labelled tower under local isomorphisms.

**API.**

- `exceptionalHistory_disjoint` (characterisation): The old blocks Eʳ are pairwise disjoint subsets of the current boundary.
- `exceptionalHistory_birth` (characterisation): Each block is determined by the earliest attained prefix year, not just its current local equations.
- `exceptionalHistory_stratum` (compatibility): On a fixed prefix stratum, blocks at nearby points are intersections with the blocks at a.

**Unit tests.**

- `history_year_zero`: With empty initial boundary all old blocks have cardinality0 in year zero.
- `history_new_exceptional`: When the first invariant entry remains unchanged after the first blowup, the newly born exceptional is not inE¹.
- `history_changes_centre`: The equationv₃²−v₁v₂² obtained in year4 ofExample 2.1 has invariant(2,0;0), while the same equation started in year 0 has(2,0;3/2,0;1,0;∞); their selected centres differ.

**Acceptance.** Use the earliest attainment year of each current prefix and remove previous old blocks; a newly born divisor is not old merely because it is present now.

### Complete desingularization invariant word

**Node:** `AlgebraicModuliForArithmeticGeometry:R09.7/invariant-word` · definition.

An invariant word has first entry H, a realized Hilbert–Samuel function, followed by s₁ and finitely many positive rational residual entries ν_r with integer counters s_r, and terminalν_{t+1}∈{0,∞}. Compare words lexicographically using pointwise partial comparison of H, ordinary counter/rational comparison, and ∞ as the largest terminal residual value. In fixed ambient dimension n, depth t≤n. Set e₁(H) to the least k from which H(ℓ) agrees with its eventual polynomial for every ℓ≥k. The recursive bounds e_r=max{e_(r−1)!,e_(r−1)!ν_r} ensure e_(r−1)!ν_r∈N for every positive finite entry. For hypersurfaces the first entry may be computed as ordinary order through the explicit hypersurface Hilbert–Samuel formula. A scalar multiplicity alone is not the complete invariant.

**Construction or proof.**

1. Use a typed finite word with a separate terminal 0/∞ choice.
2. Specify first-entry comparison as the pointwise partial order.
3. Keep the depth and recursive denominator certificates; no well-ordering is asserted for all arbitrary rational words.

**Prerequisites.** `AlgebraicModuliForArithmeticGeometry:R09.7/hilbert-samuel`, `AlgebraicModuliForArithmeticGeometry:R09.7/normalized-orders`, `AlgebraicModuliForArithmeticGeometry:R09.7/exceptional-history`.

**Source.** BM1997, Remarks 1.3, pp. 213–214; Theorem 1.14, p. 220; 6.15–6.16, pp. 259–260; Remarks 9.15, pp. 282–283. The full word retains the Hilbert–Samuel entry, history counters, positive residual rationals and zero/infinity termination; factorial bounds and finite dimension constrain its realized values.

**Uses.** BM1.14: State semicontinuity, stabilization and stratum structure. BM10–12: Compare successive maximum loci and residual monomial steps.

**API.**

- `invariantWord_prefix` (projection): Truncation preserves the exact sequence of residual entries and old-boundary counters.
- `invariantWord_compare` (relation): The first differing comparable entry controls comparison; incomparable first functions remain incomparable.
- `invariantWord_terminal` (characterisation): Terminal0 and ∞ are distinct and 0<∞; positive entries precede the terminal branch.

**Unit tests.**

- `word_multiplicity_tie`: (2,0;5/2,0;1,0;∞) exceeds (2,0;3/2,1;1,0;∞) in the hypersurface notation despite equal first multiplicity.
- `word_history_tie`: With the same first and residual entries, the first differing s_r changes the order.
- `word_terminal_zero_infinity`: A word ending 0 differs from the identical prefix ending ∞; neither may be represented by an arbitrary finite rational.

**Acceptance.** Retain the entire first function, every old-boundary counter, recursive denominator certificate, dimension bound and separate terminal zero/infinity value.

### Recursive invariant from Samuel and coefficient data

**Node:** `AlgebraicModuliForArithmeticGeometry:R09.7/recursive-invariant` · construction.

Starting with a semicoherent Hilbert–Samuel presentation, adjoin old-boundary equations with mark 1, take a maximal-contact coefficient presentation, remove its common remaining-boundary monomial, and read the next residualν. If ν is0 or∞ stop. Otherwise normalize the residual presentation, select the next old block at the birth of its prefix, adjoin that block’s mark 1 equations and repeat in lower dimension. In arbitrary codimension, if a first presentation has codimension r, ambient dimension n and embedding dimension e=H(1)−1, insert (1,0) exactly e−(n−r)−1 times when n−r<e, then reindex as Remark 9.15 prescribes; for n−r=e retain the first prefix. This normalization makes the output independent of the initial presentation codimension and ambient enlargement.

**Construction or proof.**

1. Use the semicoherent Samuel presentation for arbitrary codimension, not only the hypersurface equation.
2. At each step combine history, maximal contact, coefficient equivalence and the guarded residual presentation.
3. Dimension decreases until terminal 0 or∞, with the explicit codimension padding to fix ambient dependence.

**Prerequisites.** `AlgebraicModuliForArithmeticGeometry:R09.7/hs-semicoherence`, `AlgebraicModuliForArithmeticGeometry:R09.7/exceptional-history`, `AlgebraicModuliForArithmeticGeometry:R09.7/invariant-word`, `AlgebraicModuliForArithmeticGeometry:R09.7/residual-presentation`.

**Source.** BM1997, Definitions 6.12–6.15, pp. 258–259; Remark 9.15, pp. 282–283. Repeated history equations, maximal contact, coefficient reduction and guarded residual normalization construct the invariant; codimension padding supplies embedding independence.

**Uses.** BM1.14: Construct the full invariant with algebraic presentations of its strata. BM13.1: Remove dependence on the chosen smooth embedding.

**API.**

- `resolutionInvariant_first` (characterisation): Its first entry is precisely the local Hilbert–Samuel function.
- `resolutionInvariant_equivalent` (compatibility): Equivalent initial presentations with the same history produce the same normalized word.
- `resolutionInvariant_hypersurface` (compatibility): For hypersurfaces it agrees with the source’s order-first algorithm after the hypersurface Hilbert–Samuel identification.

**Unit tests.**

- `invariant_smooth_empty_boundary`: For a smooth closed subvariety with empty boundary the algorithm reaches its smooth Hilbert–Samuel entry with s₁=0 and terminal ∞.
- `invariant_cusp`: For z²+x³ at0 with empty boundary the hypersurface word is(2,0;3/2,0;∞).
- `invariant_bm_example`: For x₃²−x₁²x₂³ at0 in year 0, the hypersurface word is(2,0;5/2,0;1,0;∞).

**Acceptance.** Reproduce the cusp and BM year-zero words from computed coefficient orders and apply the exact codimension padding before comparing choices of presentation.

### Invariance, semicontinuity and invariant strata

**Node:** `AlgebraicModuliForArithmeticGeometry:R09.7/invariant-properties` · theorem.

The recursive word is independent of permitted local presentations and smooth coordinate isomorphisms preserving the labelled history. On the closed-point spaces of every admissible finite tower it is Zariski upper semicontinuous with locally finitely many values, does not increase over each centre, and every nonincreasing sequence of realized values in bounded dimension stabilizes. Each equality stratum and boundary are simultaneously unions of coordinate subspaces. At terminal ∞ the stratum is smooth; at terminal 0 every irreducible stratum component Z equals S∩⋂_{H⊇Z}H.

**Construction or proof.**

1. Recover each finite ratio from test equivalence; coefficient and guarded residual construction preserve the required class.
2. Induct on prefixes using common regular semicoherent data and history-block constancy. Apply the chart order estimate for admissible nonincrease.
3. Stabilize the Hilbert–Samuel first entry; recursive denominator bounds and bounded word length then stabilize the subsequent entries.
4. At the terminal branch use the zero coefficient locus or the common boundary monomial to identify the coordinate-subspace strata.

**Prerequisites.** `AlgebraicModuliForArithmeticGeometry:R09.7/recursive-invariant`, `AlgebraicModuliForArithmeticGeometry:R09.7/orders-invariant`, `AlgebraicModuliForArithmeticGeometry:R09.7/semicoherent-presentation`, `AlgebraicModuliForArithmeticGeometry:R09.7/hs-stabilization`, `AlgebraicModuliForArithmeticGeometry:R09.7/samuel-transform`.

**Source.** BM1997, Theorem 1.14(1)–(3), p. 220; proof6.15–6.17, pp. 259–260; generalization9.6,9.15, pp. 278–283; closed-point convention §1, p. 213. The realized invariant is stable under choices, upper semicontinuous on closed points and semicoherently presented, with bounded-denominator stabilization.

**Acceptance.** Semicontinuity and local finiteness refer to the realized invariant values. No smooth-morphism functoriality follows from coordinate-isomorphism invariance.

### Residual monomial data and minimal centres

**Node:** `AlgebraicModuliForArithmeticGeometry:R09.7/monomial-data` · definition.

In a terminal 0 presentation with common mark d, write its boundary monomial M=Πx_H^(dΩ_H), Ω_H≥0 rational. Cosupport at a point isΣ_{H through a}Ω_H≥1. A minimal monomial centre has a boundary subset I with Σ_IΩ_H≥1 and Σ_IΩ_H−1<Ω_i for every i∈I. It is the coordinate intersection of those H together with the fixed preceding stratum equations. Let µ be the sum of the weights of the boundary components through the current point. Its denominator is bounded by the same terminal mark.

**Construction or proof.**

1. Translate the monomial order condition to a sum of rational weights.
2. Extract inclusion-minimal subsets meeting the threshold.
3. Retain the preceding invariant stratum equations when forming a centre.

**Prerequisites.** `AlgebraicModuliForArithmeticGeometry:R09.7/residual-presentation`, `AlgebraicModuliForArithmeticGeometry:R09.7/invariant-properties`.

**Source.** BM1997, Theorem 1.14(4), p. 220; proofend§6, pp. 259–260; Construction 4.23, p. 247. The zero-residual branch is encoded by boundary weights and minimal subsets whose weight reaches one; the auxiliary monomial datum chooses the centre.

**Uses.** BM1.14(4): Prove strict progress while the complete word can remain unchanged. BM12.8: Perform the strong cleanup of exceptional monomial factors.

**API.**

- `monomialCentre_minimal` (characterisation): Minimality is equivalent to removing any one component dropping the sum below1.
- `monomialWeight_transform` (characterisation): In the pivot i-chart, the new exceptional weight isΣ_IΩ−1 and all surviving old weights stay fixed.
- `monomialMass_denominator` (characterisation): A fixed common mark bounds denominators ofµ and transformed weights.

**Unit tests.**

- `monomial_two_axes`: Weights(1/2,1/2) have unique minimal centre{x,y}; the new exceptional weight is0.
- `monomial_single_axis`: Weight3/2 has minimal one-component centre; its identity blowup changes the weight to1/2.
- `monomial_nonminimal`: For weights(1,1), the pair{x,y} is not minimal: either singleton already meets the threshold.

**Acceptance.** The centre subset reaches weight one and removing any chosen pivot drops below one; a larger nonminimal subset is rejected.

### Monomial descent and terminal-infinity descent

**Node:** `AlgebraicModuliForArithmeticGeometry:R09.7/monomial-decrease` · theorem.

Blowing up a minimal monomial stratum component gives inv′≤inv; if inv′=inv thenµ′<µ, because the pivot weightΣ_IΩ−1 is less than every removed pivot weight by minimality. Fixed denominators imply only finitely many such equal-word steps. At terminal ∞, blowing up the smooth full invariant stratum strictly lowers the complete word at every point over it. Thus the augmented pair (inv,µ), not bare multiplicity, strictly decreases over the selected centre.

**Construction or proof.**

1. Write the coordinate chart transform of the common boundary monomial.
2. Use minimality to make the new pivot exponent smaller and nonnegative; components that disappear from a chart only decrease mass.
3. At terminal ∞ use the vanishing coefficient presentation and maximal-contact equations to force a strict invariant drop.

**Prerequisites.** `AlgebraicModuliForArithmeticGeometry:R09.7/monomial-data`, `AlgebraicModuliForArithmeticGeometry:R09.7/invariant-properties`, `AlgebraicModuliForArithmeticGeometry:R09.7/controlled-transform`.

**Source.** BM1997, Theorem 1.14(4), p. 220; proof§6, pp. 259–260. Terminal monomial steps strictly lower an auxiliary fixed-denominator mass, while a terminal-infinity step lowers the preceding invariant prefix.

**Acceptance.** The word may remain unchanged for several monomial blowups;µ is necessary. Example 2.1 has successive terminal 0 words with masses7/2,5/2,3/2.

### Globally compatible maximum centres

**Node:** `AlgebraicModuliForArithmeticGeometry:R09.7/global-centres` · construction.

At each year order all boundary subsets lexicographically by their birth-index bit sequences. For a point choose J(a), the greatest subset labelling an irreducible component of its invariant equality stratum, and extend the invariant byJ. On a quasi-compact closed unresolved locus S, take the union of the loci of all maximal values of the extended invariant, allowing finitely many incomparable Hilbert–Samuel first entries. This union is a closed smooth permissible centre; local component descriptions agree on overlaps and the union is disjoint between distinct maximal values. Retain the unresolved locus used by the selected variant, rather than blowing up smooth points everywhere. Numerical maxima are computed on closed points. Their common regular stratum equations define the centre schemes; take the corresponding closed subschemes, not the bare set of closed points. Finite-type schemes over a field are Jacobson, so closed-point checks of these closed bad loci determine the full scheme assertions.

**Construction or proof.**

1. Upper semicontinuity and quasi-compactness give finitely many attained maximal values.
2. The birth-ordered component label singles out smooth coordinate components and makes the extended strata smooth.
3. Identify local equations under presentation equivalence and glue their reduced closed subschemes; use the unresolved closed-locus condition to keep centres there.
4. Use the common coherent stratum equations and Jacobson closed-point density to pass from closed-point maxima to global centre subschemes.

**Prerequisites.** `AlgebraicModuliForArithmeticGeometry:R09.7/invariant-properties`, `AlgebraicModuliForArithmeticGeometry:R09.7/monomial-data`, `AlgebraicModuliForArithmeticGeometry:R09.7/permissible-centre`, `SchemeAndStackFoundations:SF.0`, `SchemeAndStackFoundations:SF.0`.

**Source.** BM1997, Remarks 1.15–1.16, pp. 220–221; 10.3 and algorithm, pp. 284–285; Theorem 11.14, pp. 290–291; closed-point convention, p. 213. Semicoherent maximal strata give compatible smooth centres; the labelled boundary and the treatment of incomparable maximal Hilbert–Samuel values determine the global choice.

**Uses.** BM10–13: Construct the finite global tower and make embedding-local towers agree. R09.7c: Export centre ideals suitable for the imported ordinary blowup.

**API.**

- `maximumCentre_local` (characterisation): On an invariant-bounded neighbourhood it is the selected smooth coordinate-stratum component.
- `maximumCentre_closed` (characterisation): The finite union of maximal extended strata in the closed unresolved locus is closed and permissible.
- `maximumCentre_localIso` (functoriality): A local isomorphism preserving the history identifies the centre ideals.

**Unit tests.**

- `maximum_is_not_multiplicity`: For x₃²−x₁²x₂³ at0 in year 0, the full maximum centre is the origin, although the multiplicity2 locus contains axes.
- `maximum_incomparable_union`: On a disjoint union with two incomparable realized first functions, both maximal extended loci are used; choosing one greatest value is invalid.
- `maximum_empty_unresolved`: An empty unresolved locus gives no further blowup, rather than a spurious centre.

**Acceptance.** Construct the coherent centre from common regular equations and keep every incomparable maximal value; prove overlap agreement, disjointness, smoothness and permissibility.

### Finite termination of the global resolution algorithm

**Node:** `AlgebraicModuliForArithmeticGeometry:R09.7/termination` · theorem.

On a quasi-compact finite-type characteristic-zero input, the selected maximum-centre algorithm terminates in finitely many blowups: over each selected centre the augmented invariant decreases; realized words satisfy stabilization and the equal-word monomial mass has fixed-denominator descent. Local finite-value semicontinuity and quasi-compactness turn these drops into termination of the finite global maximum-stratum procedure. The selected variant’s unresolved closed locus is empty at the end.

**Construction or proof.**

1. Combine the centre construction with the terminal descent theorem.
2. A hypothetical infinite sequence of maximal values admits a nonincreasing chain; after word stabilization only fixed-denominator monomial descent remains, a contradiction.
3. Use quasi-compact finite coverings of the maximum loci to pass from local decreases to a drop of the global maximum set.

**Prerequisites.** `AlgebraicModuliForArithmeticGeometry:R09.7/global-centres`, `AlgebraicModuliForArithmeticGeometry:R09.7/monomial-decrease`, `AlgebraicModuliForArithmeticGeometry:R09.7/hs-stabilization`.

**Source.** BM1997, Theorem 1.14(2),(4), p. 220; algorithm§10, pp. 284–285; 11.14, p. 291. Stabilization of the invariant, bounded positive denominators, finite dimension and monomial mass descent prove termination of the algebraic algorithm.

**Acceptance.** Termination uses quasi-compactness; noncompact analytic locally finite towers are outside this plan.

## R09.7c: embedded and abstract resolution, preserving resolved points

Embedded resolution begins with empty boundary. This is essential to the claim that the composite is an isomorphism on the original regular locus: a smooth subvariety tangent to an arbitrary initial SNC boundary can need modification at a regular point. The separate cleanup theorem begins with a smooth pair, assumes that no incident boundary component contains it locally, and avoids every point where the pair already has simultaneous SNC. Applied at the end of the singularity-removal phase, it supplies the stronger cleanup preservation contract of BM1997 Theorem 12.2.

### Embedded resolution preserving the regular locus

**Node:** `AlgebraicModuliForArithmeticGeometry:R09.7/embedded-resolution` · theorem.

Let X be a reduced finite-type k-scheme, char(k)=0, embedded as a closed subscheme of a smooth M, with empty initial boundary. There is a finite inv_X-admissible sequence of smooth permissible blowups such that the final strict transform X′ is smooth and X′ together with the accumulated exceptional boundaryE′ has simultaneous SNC. The composite is an isomorphism over Reg(X), and all centres lie over the original singular locus. For the source’s nonreduced extension, the exact conclusion is smooth (X′_red), local constancy ofH_{X′,·}, and simultaneous SNC with E′; it does not assert that a nonreduced X′ is smooth or remains nonempty.

**Construction or proof.**

1. Use the source’s closed bad locusΣ_X=Sing(H_X)∪Sing(X_red), which is a union of invariant strata.
2. Choose maximum centres there untilΣ disappears; then clean old boundary blocks on the smooth reduction as prescribed in11.14.
3. The source’s strict-transform and regular-locus lemmas show all chosen centres lie over Sing(X), hence preserveReg(X).

**Prerequisites.** `AlgebraicModuliForArithmeticGeometry:R09.7/termination`, `AlgebraicModuliForArithmeticGeometry:R09.7/hs-semicoherence`, `AlgebraicModuliForArithmeticGeometry:R09.7/global-centres`, `AlgebraicModuliForArithmeticGeometry:R09.7/controlled-transform`, `SchemeAndStackFoundations:SF.0`.

**Source.** BM1997, Proposition 11.4, p. 288; Propositions 11.9 and 11.11, p. 289; Proposition 11.13, p. 290; Theorem 11.14, pp. 290–291. The dimension and component analysis turns the general invariant algorithm into embedded resolution of a reduced scheme, with centres over its original singular locus.

**Acceptance.** A reduced cusp is resolved and its smooth open is preserved. For Spec(k[ε]/ε²), record only the nonreduced conclusion of11.14, never a smoothness claim for the original nilpotents.

### Resolved SNC locus and its closed complement

**Node:** `AlgebraicModuliForArithmeticGeometry:R09.7/resolved-locus` · definition.

For a smooth strict transform X⊆M with an ambient SNC family E whose components do not contain X locally, a point a∈X is resolved when X and E admit simultaneous coordinate-subspace/hyperplane equations at a, with distinct incident component germs. For every subset Λ of incident boundary labels, the intersectionX_Λ=X∩⋂_{H∈Λ}H must be empty locally or smooth of the expected codimension |Λ| in X. The unresolved set Σ* is the union of the rank-defect loci where embedding dimension(X_Λ,a)>dim(X,a)−|Λ|, including improper/coincident restricted components. It is closed and is exactly the complement of the resolved locus.

**Construction or proof.**

1. Use the simultaneous coordinate condition, retaining all subsetsΛ.
2. Detect its failure by Jacobian minors of the component equations restricted toX.
3. The finite family of closed rank-defect sets gives the closed bad locus.

**Prerequisites.** `AlgebraicModuliForArithmeticGeometry:R09.7/snc-boundary`, `AlgebraicModuliForArithmeticGeometry:R09.7/regular-coordinates`, `SchemeAndStackFoundations:SF.0`.

**Source.** BM1997, Definition of Σ* and subset-intersection criterion, pp. 292–293; Theorem 12.4, Lemma 12.5 and Remarks 12.6, p. 293. Simultaneous normal crossings is equivalent to every boundary-subset intersection having the expected smooth dimension; embedding-dimension defects define the closed unresolved locus.

**Uses.** BM12.2,12.4: Restrict all cleanup centres to already-unresolved points. R09.7d compactification: Preserve the chosen smooth open throughout boundary cleanup.

**API.**

- `resolvedLocus_subsetCriterion` (characterisation): All boundary-subset intersections have the stated smooth expected codimension exactly at resolved points.
- `resolvedLocus_open` (characterisation): The resolved locus is open and Σ* is closed.
- `resolvedLocus_restrict` (functoriality): Open restriction preserves both loci.

**Unit tests.**

- `resolved_transverse_axes`: X=M=A² and two distinct coordinate axes are resolved at0.
- `resolved_tangency`: X={z=xy} and E={z=0} in A³ are not resolved at0; onX the divisorxy has an improper two-branch intersection as one restricted component.
- `resolved_empty_boundary`: Every point of smooth X is resolved with empty E.

**Acceptance.** Check every incident boundary-subset intersection, including improper or coincident restrictions; the complement is exactly the closed rank-defect locus.

### Cleanup preserving every already resolved point

**Node:** `AlgebraicModuliForArithmeticGeometry:R09.7/preserve-resolved-points` · theorem.

For smooth X⊆M and a labelled ambient SNC boundaryE with distinct incident germs, none containing X locally, a finite sequence of permissible centres contained in Σ* makesX and E simultaneous-SNC everywhere and is an isomorphism at every initially resolved point. Applied after the singularity-removal phase of embedded resolution starting with empty boundary, this gives the refinement of Theorem 12.2: the cleanup also avoids every already resolved point. The stronger preservation concerns the pair, not merely Reg(X); pulling back an arbitrary divisor without cleanup does not establish it.

**Construction or proof.**

1. On smooth X factor each restricted boundary ideal I_i as its exceptional monomialD_i times its proper residual ideal J_i. Resolve their product until nonunitJ_i have order 1 and are distinct.
2. Induct on dimension to resolve each resulting smooth divisor against the others; Lemma 12.7 transfers transversality from the hypersurface subproblem.
3. Apply the strong monomial procedure12.8, with centres among new exceptional intersections, to eliminate common exceptional factors while remaining insideΣ*.
4. Apply this smooth-pair cleanup to the intermediate space in12.1; its centres avoid resolved points of that intermediate pair. The first phase of empty-boundary embedded resolution separately preserves the original regular locus.

**Prerequisites.** `AlgebraicModuliForArithmeticGeometry:R09.7/embedded-resolution`, `AlgebraicModuliForArithmeticGeometry:R09.7/resolved-locus`, `AlgebraicModuliForArithmeticGeometry:R09.7/principalization`, `AlgebraicModuliForArithmeticGeometry:R09.7/monomial-decrease`, `AlgebraicModuliForArithmeticGeometry:R09.7/global-centres`.

**Source.** BM1997, Theorem 12.2, p. 292; Theorem 12.4 and proof, pp. 293–295; Lemmas 12.7–12.8, p. 294; Example 12.9, pp. 295–296. The second resolution phase cleans up a smooth pair using centres in its unresolved locus; it preserves resolved points even when ordinary multiplicity alone would choose unsuitable centres.

**Acceptance.** ForX={z=xy},E={z=0}, the two-blowupExample12.9 cleans the bad origin while preserving the already transverse open. Do not replace the centres-in-Σ* proof with the weaker regular-locus preservation statement.

### Global resolution compatible with local isomorphisms

**Node:** `AlgebraicModuliForArithmeticGeometry:R09.7/local-isomorphism-resolution` · theorem.

Every reduced finite-type characteristic-zero k-scheme X has a finite resolution morphism X′→X, an isomorphism over Reg(X), obtained from its locally embedded smooth-ambient towers. Any isomorphism X|U≃Y|V of open subschemes lifts uniquely to an isomorphism between the restricted resolution spaces; the compatible centres and blowups agree throughout the towers after restricting and omitting empty blowup steps. Embedded pair cleanup may be incorporated. Compatibility with arbitrary smooth morphisms is not part of this assertion.

**Construction or proof.**

1. Use local smooth embeddings of affine finite-type charts.
2. The codimension-normalized invariant, history and birth-order labels agree after ambient isomorphisms and closed smooth ambient enlargements.
3. Glue the locally selected centre ideals and their blowups using the ordinary blowup universal property and scheme open gluing.
4. Isomorphisms identify the centre ideals inductively; the blowup lift is unique, so all overlaps satisfy the cocycle.

**Prerequisites.** `AlgebraicModuliForArithmeticGeometry:R09.7/recursive-invariant`, `AlgebraicModuliForArithmeticGeometry:R09.7/invariant-properties`, `AlgebraicModuliForArithmeticGeometry:R09.7/global-centres`, `AlgebraicModuliForArithmeticGeometry:R09.7/preserve-resolved-points`, `tauceti:TauCetiRoadmap/StableReduction#layer-4-blowups-and-intersection-theory-on-arithmetic-surfaces`, `SchemeAndStackFoundations:SF.0`.

**Source.** BM1997, Remarks 13.1, p. 296; Theorem 13.2 and proof, pp. 297–298. The normalized invariant removes dependence on local smooth embeddings and glues a resolution that lifts isomorphisms between open subschemes.

**Acceptance.** Open restrictions can have empty centres and shorter towers; compare after dropping those identity steps. Do not label13.2 as arbitrary smooth functoriality.

## R09.7d: open-preserving compactification and its adapters

Start with a chosen reduced projective closure of the smooth quasi-projective open. Resolve the closure, preserving the open, and principalize the complement's coherent ideal on the resulting smooth projective scheme. The support of that ideal is exactly the complement, so all subsequent centres avoid the prescribed open. Projectivity follows from the projectivity of the closure and each blowup, not just properness. The principalization labels give globally smooth branches; resolved-pair cleanup retains that strict-SNC convention. Choosing a different closure can give a different compactification.

The complex polydisc chart is a local analytic consequence of SNC coordinates and the inverse-function theorem once the same-bundle analytification coordinate bridge is present. This is precisely the source-neighbourhood input to the higher Borel-extension applications. The Cartier adapter uses the ordinary blowup on unrestricted schemes and its regular local factors, and therefore has a wider base hypothesis than resolution.

### Principalization with normal-crossings total transform

**Node:** `AlgebraicModuliForArithmeticGeometry:R09.7/principalization` · theorem.

For a nonzero coherent ideal J on a smooth finite-type characteristic-zero scheme M, assume J is nonzero at the generic point of every component. There is a finite sequence of smooth SNC-permissible blowups, an isomorphism on M∖V(J), such that the total transformed ideal is invertible and, locally, a unit times a monomial in distinct smooth exceptional-coordinate divisors. Its weak transform is the unit ideal. The assertion starts with empty boundary; the final accumulated exceptional boundary is SNC. An arbitrary prescribed boundary belongs to the smooth-pair cleanup theorem with its separate hypotheses. The hypothesis excluding an identically zero component is essential: the zero ideal cannot become an invertible divisor ideal there.

**Construction or proof.**

1. Run the ideal/hypersurface presentation algorithm on the marked order loci, with centres over V(J).
2. Track the total ideal as the accumulated exceptional factor times the weak transform.
3. Terminate when the weak transform is a unit; the coordinate boundary then gives invertibility and SNC support.

**Prerequisites.** `AlgebraicModuliForArithmeticGeometry:R09.7/termination`, `AlgebraicModuliForArithmeticGeometry:R09.7/controlled-transform`, `AlgebraicModuliForArithmeticGeometry:R09.7/recursive-invariant`, `tauceti:TauCetiRoadmap/StableReduction#layer-4-blowups-and-intersection-theory-on-arithmetic-surfaces`.

**Source.** BM1997, Theorem 1.10, pp. 216–217; Remark 1.18, p. 225; §6, pp. 254–260. Starting from empty boundary, admissible blowups turn an ideal into an invertible normal-crossings monomial ideal and preserve the complement of its support.

**Acceptance.** The total transformed ideal, rather than the controlled transform, is the final invertible ideal. For J=(x²y³) the final multiplicities remain2 and 3 even though the reduced support is SNC.

### Smooth projective SNC compactification preserving the open

**Node:** `AlgebraicModuliForArithmeticGeometry:R09.7/snc-compactification` · construction.

For a smooth quasi-projective finite-type variety U over a characteristic-zero field k, choose its reduced projective closure Y using R09.1. Resolve Y by the local-isomorphism-compatible algorithm, preserving U⊆Reg(Y). On the smooth projective result Y₁, principalize the coherent ideal of the reduced complement Y₁∖U, whose support misses U and contains all exceptional divisors of Y₁→Y. The final smooth projective variety Ū contains the same U as a dense open, and its complement is a reduced strict-SNC divisor with globally smooth labelled components. The compactification depends on the chosen closure; no universal or canonical choice of closure is asserted.

**Construction or proof.**

1. Import projective closure and projectivity of compositions/blowups from R09.1 andStableReduction4.
2. Apply abstract resolution, which is an isomorphism over the chosen smooth open.
3. Principalize the boundary ideal on the smooth result; all further centres lie over the complement, and its total support is exactly the inverse-image complement.
4. Use the normal-crossings principalization support together with resolved-pair cleanup if necessary to retain distinct globally smooth components; the exceptional divisor labels, not just unlabelled local branches, supply strict-SNC.

**Prerequisites.** `AlgebraicModuliForArithmeticGeometry:R09.7/local-isomorphism-resolution`, `AlgebraicModuliForArithmeticGeometry:R09.7/principalization`, `AlgebraicModuliForArithmeticGeometry:R09.7/preserve-resolved-points`, `AlgebraicModuliForArithmeticGeometry:R09.1`, `tauceti:TauCetiRoadmap/StableReduction#layer-4-blowups-and-intersection-theory-on-arithmetic-surfaces`.

**Source.** BM1997, Theorem 1.10, pp. 216–217; Theorem 11.14, pp. 290–291; Theorem 12.2, p. 292; Theorem 13.2, pp. 297–298; deduction for R09.7d. The stated compactification is a deduction: resolve a chosen projective closure, then principalize its complement away from the prescribed smooth open; projectivity is imported separately.

**Uses.** ShimuraVarieties:V3: Provide quasi-projective source compactification for Borel extension. PELModuli:M3: Supply punctured-polydisc charts for the source, independently of polarized-family algebraization.

**API.**

- `sncCompactification_open` (characterisation): The prescribedU embeds openly and densely, and every modification restricts to its identity.
- `sncCompactification_boundary` (characterisation): The reduced complement is the support of the transformed boundary ideal, with labelled strict-SNC components.
- `sncCompactification_projective` (characterisation): The final structure morphism is projective; it is not deduced from properness alone.

**Unit tests.**

- `compactify_affine_line`: A¹ embeds inP¹ with the single smooth boundary point∞.
- `compactify_two_torus`: G_m² embeds inP¹×P¹ with the four coordinate boundary curves, a strict-SNC divisor.
- `compactify_preserves_smooth_open`: A smooth open avoiding the boundary ideal is unchanged even if its chosen projective closure is singular elsewhere.

**Acceptance.** The prescribed open remains identified with a dense open throughout, the final embedding is projective, and the reduced complement has globally smooth strict-SNC labels.

### Analytic polydisc charts at an SNC boundary

**Node:** `AlgebraicModuliForArithmeticGeometry:R09.7/analytic-polydisc` · theorem.

For the complex analytification of a smooth finite-type complex variety with a labelled algebraic strict-SNC divisor, every point a has a biholomorphic neighbourhood chart onto a polydiscΔⁿ, sending a to0, in which the boundary components through a are exactly z₁=0,…,z_r=0 and other components miss the neighbourhood. Its intersection with the complement is (Δ*)ʳ×Δ^(n−r). The number r is the number of incident labels and r≤n. This is a local chart result, not an algebraization theorem or a Borel extension theorem.

**Construction or proof.**

1. Use the SNC étale coordinate chart and the analytification of its invertible Jacobian.
2. Apply the complex analytic inverse-function theorem and shrink its image to a product of sufficiently small discs.
3. Use the labelled component equations to identify the punctured factors; shrink away from nonincident components.

**Prerequisites.** `AlgebraicModuliForArithmeticGeometry:R09.7/snc-boundary`, `AlgebraicModuliForArithmeticGeometry:R09.7/snc-compactification`, `AlgebraicModuliForArithmeticGeometry:A0-extension`, `mathlib:OpenPartialHomeomorph.hasFPowerSeriesAt_symm`, `tauceti:TauCeti.ContDiffOn.exists_openPartialHomeomorph`.

**Source.** BM1997, §3.1–3.5, pp. 231–233; SNC coordinate convention, p. 213; deduction using the native analytic inverse-function theorem. The source supplies simultaneous regular SNC coordinates; the polydisc and punctured-polydisc conclusion is this plan’s analytic deduction through the requested étale analytification bridge.

**Acceptance.** The node is owned here at the lower tier; ComplexComparisonPartII consumes it, rather than supplying it. On the two-torus compactification at a corner,r=2; on a smooth boundary point,r=1.

### Blowup separating two effective Cartier divisors

**Node:** `AlgebraicModuliForArithmeticGeometry:R09.7/cartier-separation` · construction.

For any scheme X and two effective Cartier divisors D₁,D₂, set I=O_X(−D₁)+O_X(−D₂) and p:X̃=Bl_I X→X. Its invertible exceptional ideal defines an effective Cartier divisor F. The residual divisors D′_i=p*D_i−F are effective Cartier divisors with disjoint supports and p*D₁+D′₂=p*D₂+D′₁. Locally x_i generate D_i; their degree-one Rees sections x′_i generate O_X̃(1), obey x′₁x₂=x′₂x₁ and have no common zero. This statement requires neither characteristic zero nor smoothness, integrality or Noetherianity. The blowup centre is locally generated by two regular elements.

**Construction or proof.**

1. Import the finite-type ideal blowup and its two standard charts from StableReduction4.
2. In the x₁-chart, write x₁=e, x₂=e·b; residual equations are 1 and b. The symmetric chart has residual equations a and 1. The charts cover because the degree-one generators cover Proj.
3. For the x_j-chart identify its ring with R[I/x_j] inside R[1/x_j], since the original x_j is regular. Each original regular x_i stays regular in R[1/x_j] and therefore in this subring. Now x_i=e·a_i is regular on the chart, so both e and a_i are regular even when R has zero divisors. Blowup pullback is not assumed flat.
4. Glue the residual Cartier ideals and use the shared exceptional factor to prove the divisor identity.

**Prerequisites.** `tauceti:TauCetiRoadmap/StableReduction#layer-4-blowups-and-intersection-theory-on-arithmetic-surfaces`, `SchemeAndStackFoundations:SF.3`, `mathlib:reesAlgebra`.

**Source.** BP2026, §4.1.10, Proposition-construction 4.1.11 and proof, p. 42; application in 4.1.13, pp. 42–43. Blowing up the sum of two Cartier ideals factors each pullback into a common Cartier divisor and disjoint residual Cartier divisors, without smoothness or characteristic restrictions.

**Uses.** Boxer–Pilloni4.1.13: Separate divisor differences comparing boundary divisors with powers of p. A0-extension paper attachment PAPER-BOXER-PILLONI-26/blow-up-separating-two-cartier-divisors: Replace the pending-source attachment by the unrestricted scheme adapter.

**API.**

- `cartierSeparation_residual` (characterisation): p*D_i=F+D′_i for i=1,2.
- `cartierSeparation_disjoint` (characterisation): The residual ideal sum is the unit ideal, equivalently the residual supports are disjoint.
- `cartierSeparation_difference` (characterisation): D′₁−D′₂=p*(D₁−D₂), or equivalently p*D₁+D′₂=p*D₂+D′₁.

**Unit tests.**

- `separate_coordinate_axes`: For D₁=(x),D₂=(y) on A², blowing up (x,y) separates the strict transforms of the two axes.
- `separate_equal_divisors`: If D₁=D₂, the blowup of their invertible ideal is the identity and both residual divisors are zero.
- `separate_unequal_multiplicities`: On A¹, D₁=2[0],D₂=3[0]: the identity blowup of (t²) gives D′₁=0,D′₂=[0], satisfying 2[0]+[0]=3[0]+0.

**Acceptance.** Prove that every original regular x_i stays regular in the chart subring of R[1/x_j] before using regularity of the factors in x_i=e·a_i; no flatness of the blowup is assumed. The two residual ideals sum to the unit ideal on every Rees chart; do not replace the residuals by arbitrary strict transforms.

## Source corrections used in this plan

Two slips were verified in the published PDF page images. No published correction was found in the searches recorded in the packet; independent review must check the findings.

- **AlgebraicModuliForArithmeticGeometry/E1901**, Published article, Example 2.1, p. 226, year-one parenthesized equation: The parenthesized year-one equation uses x₁²x₃³ in its last monomial. Use x₁²x₂³ there, consistent with the immediately following chart calculation. Substitute x₁=y₁, x₂=y₁y₂, x₃=y₁y₃ and divide the total equation by y₁². The printed x₃ term would yield y₁³y₃³, whereas the displayed chart and its next blowup require y₁³y₂³. The PDF page image was inspected as well as its text. It affects nothing.

- **AlgebraicModuliForArithmeticGeometry/E1902**, Published article, completion of the proof of Theorem 9.6, p. 282, derivative generator index bound: The derivative list is indexed through equality |β|≤d_i−|γ|. Use |β|<d_i−|γ|, as in Definition 7.9 and the coefficient presentation identity. For h=t² marked 2, including the derivative of order 2 adds the nonzero constant 2 and makes the stratum empty. Derivatives of strictly smaller order generate (t) and preserve the intended origin. The strict condition also agrees with Definition 7.9. The printed PDF image confirms the non-strict symbol. It affects the proof.

## Suggested file, acceptance and completion

The [suggested file](../suggested/AlgebraicModuliForArithmeticGeometry--R09.7.lean) elaborated successfully at the pinned baseline, with only the expected unfinished-proof warnings. Its native types include ideal sheaves and stalks, regular coordinate and SNC conditions, formal division, the five-condition Samuel certificate, jet matrices and the formal Samuel identity, closed-point Hilbert–Samuel strata, computed invariant entries, ordinary-blowup specification adapters, global resolution outputs, projective embeddings and analytic charts. All 66 API names and 66 test names occur as declarations or labelled examples. These remain prototypes and planned tests; none of the geometric targets is claimed proved.

The conditions explicitly omitted from those prototypes are:

- The completed coefficient-field and regular Taylor-to-germ dictionary at possibly non-rational closed points.
- Realization of the numerical observation families by the three actual geometric test-chain policies, including the exact restricted exceptional blocks. The equivalence API and rescaling example type the numerical part.
- Whole-chain maximal-contact and coefficient equivalence, and equality of residual cosupport with the preceding regular stratum. The residual compatibility signature checks unit choices; it omits the full restricted-chain comparison.
- Regular interpretation of the formal Samuel identity and preservation of its certificates and strata under all admissible transformations.
- Infinitesimal equivalence and admissible-tower compatibility for the common regular semicoherent family.
- Identification of the computed-entry assembly with the canonical recursion, prefix-birth history, codimension padding and denominator derivation. Its three API signatures type first-entry identification, numerical equality and the hypersurface first-entry formula.
- Coherent maximum-centre ideals, their invariant certificates, permissible whole-tower selection and the termination comparison.
- Finite blowup towers with specified strict transforms and every old/new boundary label for the global output contracts. In particular, the smooth-pair output does not yet identify its boundary with transforms of the input boundary. Whole-tower local-isomorphism comparison is also absent.
- Identification of the native analytic chart with the algebraic SNC family through the same-bundle analytification bridge.

The final ledger in the suggested file names these omissions. It uses no arbitrary proposition field to stand for them. The five owner interfaces and these native conditions must be completed before packaging.

The six planets are **Simple normal-crossings boundary**, **Marked ideals**, **Maximal contact**, **Resolution invariant**, **Embedded resolution of singularities**, and **Normal-crossings compactification**. Their exact node assignments are in the packet. All 22 definitions/constructions have uses, three API items and three discriminating tests, giving 66 planned API items and 66 planned tests. The complete pass has 40 nodes: 12 definitions, 10 constructions and 18 theorems. All remain unchecked.

The stage is planned, with no unestablished mathematical step recorded as a gap and five explicit supplier requests. The follow-up work is to discharge those exact interfaces, complete the explicitly omitted native conditions and canonical tower signatures, prove the planned statements, and incorporate the current affine-blowup and toric chart APIs when packaging. The parent A0 attachment for Cartier separation can then point to the node here, and higher complex-comparison consumers can point down to the SNC polydisc node. No other packet is edited by this pass.
