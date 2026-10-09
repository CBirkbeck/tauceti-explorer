# Characteristic-zero resolution and SNC compactification

This part of Algebraic moduli and representability for arithmetic geometry plans R09.7a–d. It exports permissible transforms, the full history-sensitive local invariant, finite global resolution and the geometric compactification input to Borel extension. It also exports the separation of two effective Cartier divisors on arbitrary schemes, outside the characteristic-zero algorithm. All implementation statuses are unchecked.

## Scope and existing owners

Accepted RS-27 narrows R09.7a: general blowups, their Rees construction and universal property, affine charts, strict transforms and flat base change come from StableReduction Layer 4. Layer 2 supplies Cartier/invertible sheaves and relative projectivity; coherent tensor and dual operations reuse AlgebraicVectorBundles. This part plans only resolution-specific marked transforms and applications. A0-extension, R09.1–6, moduli-stack construction and coarse spaces keep their existing owners.

The resolution input is quasi-compact finite-type geometry over a characteristic-zero field. Smooth projective compactification is stated for smooth quasi-projective input. Principalization excludes an ideal identically zero on a component. Embedded resolution gives smooth output for reduced targets; the nonreduced version has a smooth reduced support and locally constant Hilbert–Samuel function. Only local-isomorphism universality is asserted from BM97 §13. One-step smooth base change does not prove full smooth-functorial resolution.

The compactification geometry and elementary complex-point/SNC chart realization must be available below their Hodge and complex-comparison consumers. R09.7d owns those geometric notions; higher roadmaps import them. Buffered charts remain a HodgeH.7 adaptation. The normal-crossing stack-boundary application is conditional on the explicit descent and topology suppliers below.

## Baseline and prototype meaning

Pinned Mathlib: 082e2d37e8b0463410cdb532e111cd43d5a66174. Pinned Tau Ceti: f790474821cf4256814db967cb154e7af3d0c369. Declarations were read in the shared build; the current read-only library and current upstream roadmaps were separately checked. The pin already has ideals, power-series coefficients/order, smooth/proper/open-immersion predicates, graded-ring Proj and affine ideal-sheaf data. Those are reused rather than redefined. Native ideal-sheaf data is compatible affine ideal data, not an actual subsheaf. Native Proj is not a relative blowup.

The suggested file elaborates local contracts and data projections with admissions; it is not an implementation. Each target below records its exact prototype limitation. Omitted global conditions are not encoded by arbitrary proposition fields or axioms assuming the desired result. Every API and test is named in the file; an explicitly omitted comment still needs a geometric signature before packaging. The complete planning pass is therefore **planned**, with refinements and supplier requests; it is not **closed**.

## Notation and proof route

Write I for a coherent ideal, b>0 for a mark, E for a chronological labelled SNC boundary and H=(y) for a new exceptional Cartier ideal. Point order uses powers of the maximal ideal; divisor order is divisibility by its local equation. Controlled division removes the fixed mark, weak division the generic centre order and strict transform uses saturation. A presentation is a weighted finite family, not just a support set. Its remaining boundary participates in tests; its old blocks are counted in the invariant.

The invariant is (H_X,s₁;ν₂,s₂;…;terminal), with terminal 0 or ∞. H_X is the whole Hilbert–Samuel function. Residual ν=µ−Σµ_H retains all exceptional factors and the monomial pair when 0<ν<1. Birth indices define the old blocks; a chosen embedding is normalized as BM97 Remark 9.15(3). Semicoherent presentations prove upper semicontinuity. The refined maximum selects a smooth chronological component. The terminal-zero case also decreases a bounded-denominator auxiliary order; arbitrary decreasing rational sequences are not a termination proof.

## R09.7a — Marked transforms and permissible centres

Atlas planets: Order along a centre, SNC pairs, Marked ideals, Controlled transforms, Test equivalence, Cartier divisor separation.

### Order along a centre

Target `AlgebraicModuliForArithmeticGeometry:R09.7a/order-filtration` (definition). Planning name: `TauCetiRoadmap.AlgebraicModuli.Resolution.orderAtLeast`.

For an ideal I in a Noetherian local ring A and a centre ideal P, orderAlong(P, I) is the supremum of d with I contained in P^d, valued in N∪{∞}. For point order use P=m_a. The predicate orderAtLeast(P, I, d) is exactly that containment; order of the zero ideal is infinite and order of the unit ideal at a proper P is zero. Finite order and generic centre order require separatedness and nonvanishing, not merely a numerical annotation.

Hypotheses: Commutative rings for the containment predicate; Noetherian local separated rings for finite-order consequences.

Proof plan:

1. Use native ideal powers and containment.
2. Apply Krull intersection to prove finiteness for nonzero ideals when required.
3. On regular coordinate charts compare with least nonzero Taylor degree.

Prerequisites: `mathlib:Ideal`, `mathlib:MvPowerSeries.order`.

Source match: BM97, §3, pp. 230–231; Remark 1.8, p. 215. The local order and admissibility clauses use ideal-power containment. Krull-intersection finiteness is an additional algebraic proof step, not inferred from an arbitrary numerical annotation.

Uses: BM97 §4.3 admissible centres: Ensures divisibility by the exceptional equation to the mark; supplies orders for µ and ν.

Planning API:

- `orderAtLeast_iff` (characterisation): Order at least d iff I≤P^d.
- `orderAtLeast_antitone` (compatibility): If e≤d then order at least d implies order at least e.
- `orderAtLeast_zero` (simp): Every ideal has order at least zero.

Discriminating unit tests:

- `order_zero_ideal` (degenerate): The zero ideal has order at least every d.
- `order_unit_ideal` (non-example): At a proper ideal P, the unit ideal does not have positive order.
- `order_power` (computation): P^d has order at least d, including d=0.

Acceptance: All hypotheses remain visible; the contract distinguishes the identified edge cases.

Lean prototype: Elaborates the exact order-at-least predicate; numerical order on arbitrary local rings and its stalk comparison are omitted.

### SNC boundaries and permissible centres

Target `AlgebraicModuliForArithmeticGeometry:R09.7a/snc-pair` (definition). Planning name: `TauCetiRoadmap.AlgebraicModuli.Resolution.coordinateIdeal`.

On a smooth finite-type k-scheme M, a labelled SNC boundary E is a finite family of distinct smooth effective Cartier hypersurfaces such that at every geometric point their local equations are distinct members of one regular parameter system. A smooth closed centre C is boundary-permissible when in the same parameters C is a coordinate subspace. Components may contain C or meet it transversely; requiring transversality to every divisor would incorrectly exclude monomial centres. In a chosen formal chart the boundary and centre are recorded by subsets B, J of coordinate indices.

Hypotheses: k has characteristic zero for resolution; SNC and coordinate permissibility themselves make sense over any perfect field. Boundary labels are retained after strict transform; new exceptional labels are appended.

Proof plan:

1. Import regular local and effective Cartier interfaces.
2. Express simultaneous normal crossings by a common étale parameter chart.
3. Use SR4 coordinate blowup charts to retain smoothness and SNC after a permissible blowup.

Prerequisites: `tauceti:TauCetiRoadmap/StableReduction#layer-4-blowups-and-intersection-theory-on-arithmetic-surfaces`, `tauceti:TauCetiRoadmap/StableReduction#layer-2-coherent-curve-theory-duality-and-positivity`, `mathlib:AlgebraicGeometry.Smooth`.

Source match: BM97, §3, pp. 234–237; §4.1–4.3, pp. 241–242. The local-coordinate boundary and admissible-centre conditions allow a centre contained in exceptional components; their coordinate blowup calculation preserves normal crossings.

Uses: BM97 §6.7, §12.3: Tracks the boundary through each step and permits centres contained in old exceptional components.

Planning API:

- `coordinateIdeal_empty` (simp): Empty coordinate set cuts out the whole chart.
- `coordinateIdeal_mono` (compatibility): Including more coordinates enlarges the ideal and shrinks the centre.
- `coordinateIdeal_mem` (projection): Each selected coordinate vanishes on the centre.

Discriminating unit tests:

- `centre_empty` (degenerate): The empty subset gives zero ideal, not the empty centre.
- `centre_singleton` (computation): A one-coordinate centre has ideal generated by that coordinate.
- `boundary_contained_centre` (compatibility): The origin centre contains each boundary equation in its ideal; containment is allowed.

Acceptance: All hypotheses remain visible; the contract distinguishes the identified edge cases.

Lean prototype: coordinateIdeal is the faithful chosen-chart centre. Global SNC, regular parameters and étale charts are omitted, never assumed in fields.

### Marked ideals and cosupport

Target `AlgebraicModuliForArithmeticGeometry:R09.7a/marked-ideal` (definition). Planning name: `TauCetiRoadmap.AlgebraicModuli.Resolution.MarkedIdeal`.

A geometric marked ideal consists of a smooth ambient M, a smooth embedded N meeting the boundary transversely, a coherent ideal I on N, a positive integer b and the labelled boundary E. Its cosupport consists of a∈N with ord_a(I)≥b. A permissible marked-ideal centre is a smooth boundary-coordinate centre contained in this cosupport; locally normal flatness or coordinate order comparison gives I⊂I_C^b. The local ring carrier retains I and b without confusing a mark with the actual order.

Hypotheses: Coherent ideal on smooth N over a characteristic-zero field. b>0; zero ideals are allowed locally but excluded in principalization of an ideal on a component.

Proof plan:

1. Use order-filtration at each stalk to define the cosupport.
2. Prove invariance under a change of generators.
3. Check containment along permissible smooth centres in adapted coordinates.

Prerequisites: `AlgebraicModuliForArithmeticGeometry:R09.7a/order-filtration`, `AlgebraicModuliForArithmeticGeometry:R09.7a/snc-pair`.

Source match: BM97, §4.1–4.4, pp. 241–242. Function-mark families and their common order loci supply the local marked-ideal contract; ideal operations assemble the corresponding coherent-ideal form.

Uses: BM974.18, 4.23, 6.10: Normalizes weighted coefficient data and encodes invariant strata as intersections of cosupports.

Planning API:

- `MarkedIdeal.cosupport_iff` (characterisation): Cosupport membership at P is I≤P^b.
- `MarkedIdeal.power` (constructor): For q>0 replace (I, b) by (I^q, qb), used after denominator clearing.
- `MarkedIdeal.intersection` (constructor): Weighted intersection uses a common mark d: sum of I_i^(d/b_i); its cosupport is the intersection in regular local rings.

Discriminating unit tests:

- `marked_zero` (degenerate): A zero ideal with positive mark has full cosupport.
- `marked_unit` (non-example): A unit ideal with positive mark has empty cosupport at a proper P.
- `mark_changes_cosupport` (computation): In K[[x]], (x, 1) has origin in cosupport while (x, 2) does not.

Acceptance: All hypotheses remain visible; the contract distinguishes the identified edge cases.

Lean prototype: Exact local carrier and cosupport at a supplied prime/maximal ideal. Smooth ambient, coherent stalks, boundary and global centre conditions remain omitted.

### Total, strict, weak and controlled transforms

Target `AlgebraicModuliForArithmeticGeometry:R09.7a/transforms` (construction). Planning name: `TauCetiRoadmap.AlgebraicModuli.Resolution.dividedIdeal`.

For a permissible blowup σ with exceptional Cartier ideal H=(y), total transform is I·O_M′; strict transform of a closed subscheme is the saturation ⋃_q(I_total:H^q), imported from SR4. Controlled transform of (I, b) is H^(−b)I_total with b unchanged. Weak transform divides by the generic order c along the centre, hence H^(−c)I_total. These operations generally differ. Locally controlled division is the unique ideal J satisfying (y^b)J=I_total when y is a nonzerodivisor; the colon ideal realizes J when divisibility holds.

Hypotheses: Permissible centre gives I_total⊂(y^b). y is a nonzerodivisor on the smooth blowup chart. Weak generic order may be defined separately on centre components.

Proof plan:

1. Import SR4 blowup, Cartier exceptional ideal and saturation.
2. Apply centre-order divisibility in every chart.
3. Glue local divided ideals using unit changes of y.

Prerequisites: `tauceti:TauCetiRoadmap/StableReduction#layer-4-blowups-and-intersection-theory-on-arithmetic-surfaces`, `AlgebraicModuliForArithmeticGeometry:R09.7a/marked-ideal`.

Source match: BM97, §3.13, p. 237; §4.4, pp. 242–243; Lemma 5.1, p. 248. The source distinguishes strict and weak transforms from fixed-mark division; exceptional test blowups use total pullback. The plan preserves all four distinctions.

Uses: BM974.4 and5.1; BP264.1.11: Controlled exponents retain the mark; SR4 strict transform is reused rather than replanned.

Planning API:

- `totalTransform_id` (simp): Identity ring map leaves the total ideal fixed.
- `dividedIdeal_mem` (characterisation): r belongs to the divided ideal iff y^b r belongs to I.
- `dividedIdeal_recover` (compatibility): If y is a nonzerodivisor and I=(y^b)J, dividedIdeal I y b=J.

Discriminating unit tests:

- `divide_mark_zero` (degenerate): Division by y^0 leaves I fixed.
- `divide_monomial` (computation): In a domain, total (y^3), mark 2 divides to (y), whereas strict saturation is the unit ideal if y≠0.
- `zero_divisor_division` (non-example): Colon division need not uniquely recover J when y=0: division of the zero ideal by mark 1 is the unit ideal.

Acceptance: All hypotheses remain visible; the contract distinguishes the identified edge cases.

Lean prototype: Exact affine total extension and colon division. It represents controlled transform only under the stated divisibility and nonzerodivisor hypotheses; saturation/weak/global transforms are omitted.

### Smooth base change of resolution transforms

Target `AlgebraicModuliForArithmeticGeometry:R09.7a/transform-base-change` (theorem). Planning name: `TauCetiRoadmap.AlgebraicModuli.Resolution.transform_base_change`.

A smooth base change of a permissible blowup identifies the pulled-back controlled transform and marked ideal with their transforms on the base-changed blowup. The analogous strict-transform comparison follows from the flat-base-change statement supplied by SR4. Permissibility and boundary-coordinate charts pull back smoothly. This is a one-step transform theorem; it does not assert that the chosen global invariant or resolution tower commutes with every smooth map.

Hypotheses: Smooth finite-type base change; permissible centre, finite-type coherent ideal and labelled SNC boundary.

Proof plan:

1. Use SR4 flat blowup/strict-transform base change.
2. Pull back the exceptional Cartier ideal and its powers.
3. Use flatness to preserve the exact sequence expressing controlled division; pull back the local coordinate centre.

Prerequisites: `tauceti:TauCetiRoadmap/StableReduction#layer-4-blowups-and-intersection-theory-on-arithmetic-surfaces`, `AlgebraicModuliForArithmeticGeometry:R09.7a/transforms`, `AlgebraicModuliForArithmeticGeometry:R09.7a/snc-pair`, `mathlib:AlgebraicGeometry.Smooth`.

Source match: BM97, §3, pp. 235–237; §4.4, p. 242; assembly using SR4. The cited chart formulas identify the controlled quotient. Flat pullback and the global blowup comparison are assembled using the imported SR4 theorem; full algorithm functoriality is not inferred.

Acceptance: Polynomial projection commutes with the controlled chart formula. No conclusion about selection of global centres is inferred.

Lean prototype: Global geometric signature omitted until the requested supplier carriers exist.

### Test transformations and equivalence of presentations

Target `AlgebraicModuliForArithmeticGeometry:R09.7a/test-equivalence` (definition). Planning name: `TauCetiRoadmap.AlgebraicModuli.Resolution.testEquivalent`.

A presentation P=(N, {(h_i, b_i)}, E) uses finitely many regular function-mark pairs on a smooth germ and its common cosupport. Type(i) is permissible controlled blowup; type(ii) is product with A¹ based at(a, 0), adding the zero-section to the boundary; type(iii) blows up the intersection of two exceptional divisors and uses total, not controlled, pullback of the h_i. Two presentations are equivalent for a named test class if their cosupports remain equal after every finite legal common test sequence. Keep weak(i, ii), strong(i, ii, iii), and the restricted s* class of Definition 4.10 separate; residualization is only certified for s*.

Hypotheses: Equal ambient germs and boundary identification; compare µ invariants only at equal codimension. Restricted s* strings are those of Definition 4.10 with its distinguished exceptional divisor, not all type(iii) strings.

Proof plan:

1. Define legal sequences by their transformations of germs, functions and boundary.
2. Quantify over all finite sequences and compare terminal cosupports.
3. Transport common transformations to prove reflexivity, symmetry and transitivity.

Prerequisites: `AlgebraicModuliForArithmeticGeometry:R09.7a/marked-ideal`, `AlgebraicModuliForArithmeticGeometry:R09.7a/transforms`.

Source match: BM97, Definitions 4.6, 4.10, pp. 242–244; Propositions 4.8, 4.11, 4.24. These definitions separate the weak, strong and restricted test classes. The numerical invariance propositions have different test hypotheses, which remain explicit here.

Uses: BM974.8, 4.11, 4.19, 4.24: Recovers numerical invariant values from presentation classes; controls permissible re-presentations.

Planning API:

- `Presentation.equivalent_refl` (relation): Every presentation is equivalent to itself in each fixed test class.
- `Presentation.equivalent_trans` (relation): Equivalence is transitive for the same test class and boundary identification.
- `Presentation.strong_implies_weak` (compatibility): Strong equivalence implies weak equivalence; reverse implication is not asserted.

Discriminating unit tests:

- `equivalence_generator_change` (compatibility): Changing a finite generating family of one marked ideal preserves its legal-test cosupports.
- `equivalence_not_same_support` (non-example): (x², 1) and(x, 1) have the same initial cosupport but differ after a Cartier-centre controlled blowup: the first retains(x), the second becomes unit.
- `exceptional_total_pullback` (computation): Under x1=y1, x2=y1y2 in an exceptional test, x1 pulls back to y1 without division by its mark.

Acceptance: All hypotheses remain visible; the contract distinguishes the identified edge cases.

Lean prototype: Elaborates the universal terminal-outcome equality and its relation API. Outcomes of actual legal geometric transformations, weak/strong/s* legality and boundary transport remain omitted; no arbitrary outcomes are claimed to come from geometry.

### Separation of two effective Cartier divisors

Target `AlgebraicModuliForArithmeticGeometry:R09.7a/cartier-separation` (construction). Planning name: `TauCetiRoadmap.AlgebraicModuli.Resolution.CartierSeparationChart`.

For any scheme X and effective Cartier divisors D1, D2, set I=O_X(−D1)+O_X(−D2). On p:Bl_I X→X, degree-one generators define regular sections s1, s2 of O(1). Their zero divisors D1′, D2′ are effective Cartier, have disjoint supports, and satisfy p*D1+D2′=p*D2+D1′. In local equations x1, x2, the s_i are the degree-one x_i t. Nonzerodivisor regularity must be proved in the Rees algebra/charts; disjointness alone does not prove the Cartier claim.

Hypotheses: No Noetherian, reduced, integral or characteristic-zero assumption on X. Each original x_i is a nonzerodivisor where it represents D_i.

Proof plan:

1. Import SR4 blowup of a finitely generated quasi-coherent ideal on an arbitrary scheme and SR2 effective Cartier/tautological O(1).
2. Multiplication by each x_i t on homogeneous Rees pieces is injective because x_i is regular; localizing preserves injectivity.
3. Degree-one generators cover Proj, so s1, s2 have no common zero.
4. The identity s1·p*x2=s2·p*x1 gives equality of tensor-product sections and divisors.

Prerequisites: `tauceti:TauCetiRoadmap/StableReduction#layer-4-blowups-and-intersection-theory-on-arithmetic-surfaces`, `tauceti:TauCetiRoadmap/StableReduction#layer-2-coherent-curve-theory-duality-and-positivity`, `mathlib:reesAlgebra`.

Source match: BP26, §4.1.10–4.1.11, p. 42. The construction is on any scheme: the two degree-one Rees sections define regular residual divisors with disjoint support and the balancing identity. Characteristic-zero and integrality assumptions would incorrectly narrow it.

Uses: BP26 Proposition 4.1.13, pp. 42–43: Separates competing vertical/boundary Cartier divisors before integral Hecke correspondences are used.

Planning API:

- `CartierSeparation.disjoint` (projection): Supports of D1′ and D2′ are disjoint.
- `CartierSeparation.balance` (compatibility): p*D1+D2′ equals p*D2+D1′ with the stated orientation.
- `CartierSeparation.flatPullback` (functoriality): Flat base change carries the construction to that for the pulled-back two divisors.

Discriminating unit tests:

- `cartier_equal_inputs` (degenerate): If D1=D2 then blowup along its invertible ideal is identity and both residual divisors are zero.
- `cartier_coordinate_axes` (computation): For(x, y) in A², the x-chart has s1=1, s2=y/x and the y-chart has the opposite residual; no common zero.
- `cartier_mixed_characteristic` (non-example): On Spec Z[t] with D1=(p), D2=(t), the same disjointness/balance theorem holds; it has no characteristic-zero hypothesis.

Acceptance: All hypotheses remain visible; the contract distinguishes the identified edge cases.

Lean prototype: Elaborates Rees-chart data, residual prime supports, the exact section balance and local tests. Blowup/Proj gluing, regular-section and Cartier-divisor predicates, global balance and flat comparison are omitted.

## R09.7b — Presentations and the full local invariant

Atlas planets: Hilbert–Samuel diagrams, Weighted presentations, Maximal contact, Coefficient presentations, Hilbert–Samuel presentations, Desingularization invariant.

### Initial exponents and Hilbert–Samuel diagrams

Target `AlgebraicModuliForArithmeticGeometry:R09.7b/formal-diagram` (definition). Planning name: `TauCetiRoadmap.AlgebraicModuli.Resolution.initialDiagram`.

In K[[X1, …, Xn]], order multiindices by(total degree, α1, …, αn). For f≠0 its initial exponent is the least exponent with nonzero coefficient. D(I) is the set of initial exponents of nonzero elements of I; it is closed under addition by N^n. Its finite vertices and the disjoint regions Δ_i=(α_i+N^n) minus previous regions determine standard division. H_I(l) counts exponents outside D(I) with degree≤l, equivalently length of A/(I+m^(l+1)). Use residue-field length intrinsically; a coefficient-field vector-space identification requires a chosen completion chart.

Hypotheses: K any field for formal division; finite n. No zero series initial exponent; do not identify diagrams with Hilbert–Samuel functions injectively.

Proof plan:

1. Use the native power-series coefficients and degree-lex well-order.
2. Apply Dickson finiteness to the upward-closed diagram.
3. Formal division identifies the quotient jets with the complement monomial basis.

Prerequisites: `mathlib:MvPowerSeries`, `AlgebraicModuliForArithmeticGeometry:R09.7a/order-filtration`.

Source match: BM97, §3.17–3.20, pp. 238–240; §7.1, p. 261; §9.15(1), p. 282. Initial exponents in a fixed degree-compatible order form an upward-closed diagram; complement counts recover the Hilbert–Samuel function in the later invariant construction.

Uses: BM97 §§7–9: Supports the general, non-hypersurface Hilbert–Samuel presentation.

Planning API:

- `initialDiagram_mem` (characterisation): Membership is witnessed by an ideal element whose least nonzero coefficient has that exponent.
- `initialDiagram_add` (compatibility): Adding any multiindex to a diagram element stays in the diagram.
- `initialExponent_unique` (characterisation): A nonzero series has at most one initial exponent.

Discriminating unit tests:

- `diagram_zero` (degenerate): The zero ideal has empty diagram.
- `diagram_unit` (computation): The unit ideal has full diagram.
- `diagram_monomial` (computation): A monomial ideal generated by X^α has diagram α+N^n.

Acceptance: All hypotheses remain visible; the contract distinguishes the identified edge cases.

Lean prototype: Named target signatures; no implementation claimed.

### Formal division and standard bases

Target `AlgebraicModuliForArithmeticGeometry:R09.7b/formal-division` (theorem). Planning name: `TauCetiRoadmap.AlgebraicModuli.Resolution.formal_division`.

For a finite ordered family g_i of nonzero formal series with initial exponents α_i and disjoint regions Δ_i, every f admits unique q_i, r with f=Σq_i g_i+r, α_i+supp(q_i)⊂Δ_i and supp(r) in the complement. Orders of q_i satisfy ord(q_i)≥ord(f)−|α_i|. A reduced standard basis indexed by the vertices of D(I) generates I and its complement monomials form every finite jet quotient basis.

Hypotheses: Field coefficients, finitely many variables, finite family; no convergence assertion is needed.

Proof plan:

1. Eliminate the least remaining degree-lex term in its unique region.
2. At each bounded degree only finitely many coefficients are involved; compatible truncations define formal limits.
3. Uniqueness follows by inspecting the least exponent of a difference.
4. Dickson vertices plus zero remainder for ideal elements yield the standard basis and Hilbert–Samuel count.

Prerequisites: `AlgebraicModuliForArithmeticGeometry:R09.7b/formal-diagram`, `mathlib:MvPowerSeries`.

Source match: BM97, Theorem 3.17, Corollaries 3.19–3.20, pp. 238–240; Lemma 7.3, p. 263. Formal division with specified support regions yields a standard basis and uniqueness of the supported remainder; these are the formal ingredients for the jet-minor construction.

Acceptance: All hypotheses remain visible; the contract distinguishes the identified edge cases.

Lean prototype: Global geometric signature omitted until the requested supplier carriers exist.

### Weighted presentations and numerical data

Target `AlgebraicModuliForArithmeticGeometry:R09.7b/weighted-presentation` (definition). Planning name: `TauCetiRoadmap.AlgebraicModuli.Resolution.WeightedPresentation`.

A finite nonempty list of pairs(h_i, b_i), with positive integral marks, on a smooth germ N defines common cosupport ord(h_i)≥b_i. At a point let µ=min_i ord(h_i)/b_i. For every boundary hypersurface H let µ_H=min_i ord_H(h_i)/b_i, and if µ is finite set ν=µ−Σ_H µ_H; all-zero data give µ=ν=∞. These are different orders: ord_H is divisibility by a local Cartier equation, not point order. For equal codimension, µ is invariant under weak test equivalence and µ_H under restricted s* equivalence.

Hypotheses: Finite nonempty marked family, SNC boundary transverse to N, characteristic zero regular chart. All finite values are rational, with explicit denominator bounds after equalizing marks.

Proof plan:

1. Use point and divisor orders, with zero represented by infinity.
2. Factor the common boundary monomial after clearing denominators.
3. Recover µ and µ_H from repeated test blowups as in Propositions 4.8, 4.11.

Prerequisites: `AlgebraicModuliForArithmeticGeometry:R09.7a/order-filtration`, `AlgebraicModuliForArithmeticGeometry:R09.7a/test-equivalence`, `AlgebraicModuliForArithmeticGeometry:R09.7b/formal-diagram`.

Source match: BM97, Definitions 4.7, 4.9; Propositions 4.8, 4.11, pp. 243–244; proof §5, pp. 248–250. The point and divisor minima are different numerical functions. The cited definitions and test-invariance proofs justify each under its own equivalence class.

Uses: BM974.18–4.24 and6.10–6.15: Expresses each truncated invariant stratum and its residual numerical term.

Planning API:

- `WeightedPresentation.cosupportAt_iff` (characterisation): All marked generator ideals satisfy the prescribed order threshold.
- `WeightedPresentation.permute` (compatibility): Permuting pairs leaves cosupport, µ and each µ_H unchanged.
- `WeightedPresentation.equalize` (constructor): For a common multiple d of the marks replace h_i by h_i^(d/b_i), all marked by d; equivalent under the specified tests.
- `WeightedPresentation.normalizedOrder_le` (characterisation): For supplied finite orders, the normalized minimum is at most each order divided by its positive mark. Geometric µ requires supplying the genuine orders.

Discriminating unit tests:

- `presentation_all_zero` (degenerate): All zero functions give full cosupport and infinite µ.
- `presentation_one_unit` (non-example): One unit function makes cosupport empty at every proper P.
- `presentation_ratio_min` (computation): For(x^3, 2), (x^5, 4), µ=5/4; maximum or sum gives a wrong invariant.

Acceptance: All hypotheses remain visible; the contract distinguishes the identified edge cases.

Lean prototype: Exact finite weighted carrier, cosupport, reindexing and common-mark power construction; finite normalized minimum from supplied numerical orders. Actual stalk/divisor orders, infinity, legal-test equivalence and global smooth germ are omitted. Common-mark equivalence requires every original mark to divide d; the power constructor alone does not assert that.

### Recovering µ and exceptional orders by tests

Target `AlgebraicModuliForArithmeticGeometry:R09.7b/test-invariance` (theorem). Planning name: `TauCetiRoadmap.AlgebraicModuli.Resolution.test_invariance`.

For equal-codimension equivalent presentations µ is equal under tests(i, ii), and each µ_H is equal under the restricted s* tests with matched boundary H. Thus ν is well-defined for these presentation classes. No equality across arbitrary codimensions is asserted; the full invariant later supplies the codimension normalization.

Hypotheses: Semicoherent weighted presentations, boundary identification and the exact named test class.

Proof plan:

1. Use a product line followed by repeated permissible point blowups to recover µ from allowable lengths and asymptotic slopes.
2. Repeat the distinguished exceptional substitutions to recover µ_H from successive µ differences.
3. Subtract the common exceptional sums.

Prerequisites: `AlgebraicModuliForArithmeticGeometry:R09.7b/weighted-presentation`, `AlgebraicModuliForArithmeticGeometry:R09.7a/test-equivalence`.

Source match: BM97, Propositions 4.8, 4.11 and proofs, pp. 243–244, 248–250. Repeated product and point tests recover the point minimum; the distinguished exceptional tests recover divisor minima. Equal codimension and the restricted test class cannot be dropped.

Acceptance: All hypotheses remain visible; the contract distinguishes the identified edge cases.

Lean prototype: Global geometric signature omitted until the requested supplier carriers exist.

### Maximal contact in characteristic zero

Target `AlgebraicModuliForArithmeticGeometry:R09.7b/maximal-contact` (theorem). Planning name: `TauCetiRoadmap.AlgebraicModuli.Resolution.maximal_contact`.

If a weighted presentation has µ=1, assume a pair(f, d) is chosen of point order d and a regular coordinate x with ∂_x^d f a unit and no boundary equation involving x. Then z=∂_x^(d−1)f has order 1, V(z) is smooth and transverse to the boundary, adjoining(z, 1) is strongly equivalent, and the strict transforms of V(z) contain the transformed cosupport through every allowed test string.

Hypotheses: Characteristic zero; regular coordinate chart and transverse boundary. The derivative-unit hypothesis is explicit; positive characteristic maximal contact is not claimed. µ=1 alone does not guarantee a boundary-transverse derivative direction. At a birth stage use empty remaining boundary; persistence and the old-component augmentation are the extra mechanism of Example 4.16 and conditions 4.17.

Proof plan:

1. Differentiate the equalized marked functions up to one less than their mark.
2. Use the Jacobian unit for smoothness and the coordinate choice for transversality.
3. Check controlled derivatives on blowup charts; the chart transverse to V(z) leaves the cosupport.
4. Verify product and exceptional tests with total-pullback convention.

Prerequisites: `AlgebraicModuliForArithmeticGeometry:R09.7b/weighted-presentation`, `AlgebraicModuliForArithmeticGeometry:R09.7a/transforms`, `AlgebraicModuliForArithmeticGeometry:R09.7b/test-invariance`.

Source match: BM97, Proposition 4.12, Remarks 4.14–4.16, pp. 244–245; proof §5, pp. 250–251. The proposition requires an essential derivative in a coordinate outside the boundary. Its persistence and the old-boundary augmentation are separately used, so a bare normalized minimum of one is insufficient.

Acceptance: For z²−x³, z=0 is maximal contact at the origin. For z^p−x^(p+1) in characteristic p the derivative-unit argument fails.

Lean prototype: Global geometric signature omitted until the requested supplier carriers exist.

### Coefficient presentations on maximal contact

Target `AlgebraicModuliForArithmeticGeometry:R09.7b/coefficient-presentation` (construction). Planning name: `TauCetiRoadmap.AlgebraicModuli.Resolution.coefficientSlice`.

For a chosen order-one maximal-contact coordinate z and (f, d), use coefficients c_q=(1/q!)∂_z^q f|_(z=0), 0≤q<d, marked by d−q. Taking all pairs gives the coefficient presentation on V(z). It is test-equivalent to the original, its construction commutes with permissible transforms, and its cosupport is precisely the original cosupport within V(z). The omission of the q=d coefficient is essential.

Hypotheses: Characteristic zero; chosen regular maximal-contact coordinate, positive integral marks; keep all weighted coefficients.

Proof plan:

1. Use Taylor expansion and regular derivatives from §3.5.
2. Compute c_q′=y_exc^(−(d−q))c_q∘σ on the strict maximal-contact chart.
3. Use Proposition 4.19 and the transverse chart to compare terminal cosupports.

Prerequisites: `AlgebraicModuliForArithmeticGeometry:R09.7b/maximal-contact`, `AlgebraicModuliForArithmeticGeometry:R09.7a/transforms`.

Source match: BM97, Construction 4.18, Proposition 4.19, pp. 246–247; proof §5, pp. 251–252. The finite derivative family with marks d−q restricts to maximal contact and has the stated controlled transformation law; the omitted normal direction is accounted for by the derivative hypothesis.

Uses: BM97 §6 induction: Lowers dimension while retaining the stratum and information required by the invariant.

Planning API:

- `coefficientSlice_coeff` (characterisation): A coefficient of the q-slice is the coefficient with last exponent q.
- `coefficientSlice_add` (compatibility): Coefficient extraction is additive.
- `coefficientSlice_reconstruct` (characterisation): All coefficient slices determine the original series.

Discriminating unit tests:

- `coefficient_zero` (degenerate): Zero has all coefficient slices zero.
- `coefficient_z_power` (computation): For z^d the d-slice is1 and all other slices vanish.
- `coefficient_cusp` (computation): For z²−x³ the q=0 slice is−x³, q=1 is0, and the mark 2 coefficient family therefore has residual order 3/2.

Acceptance: All hypotheses remain visible; the contract distinguishes the identified edge cases.

Lean prototype: Exact formal coefficient extraction with z the last variable; global derivatives, maximal contact and controlled-transform comparison are omitted.

### Residual presentation and exceptional monomial

Target `AlgebraicModuliForArithmeticGeometry:R09.7b/residual-presentation` (construction). Planning name: `TauCetiRoadmap.AlgebraicModuli.Resolution.residualValue`.

Equalize all marks to d. Let M=∏_H x_H^(dµ_H) divide each h and write h=M g. If0<ν<∞, form pairs(g, dν), and when ν<1 also(M, d(1−ν)); clear rational marks by taking powers. Ifν=0 use only(M, d); ifν=∞ stop. The positive residual presentation has µ=1 and its restricted s* class is independent of the chosen equivalent initial data. Do not divide without retaining the extra monomial pair when ν<1.

Hypotheses: SNC boundary transverse to N; nonnegative exceptional orders; common multiple d makes exponents integral. Zero, positive finite and infinite residual values are separate cases.

Proof plan:

1. Compute greatest common boundary factor using divisor orders.
2. Subtract Σµ_H from µ and verify ν≥0.
3. Use the transform factorization in Proposition 4.24.
4. Clear denominators and prove restricted s* equivalence, preserving the additional monomial cosupport.

Prerequisites: `AlgebraicModuliForArithmeticGeometry:R09.7b/weighted-presentation`, `AlgebraicModuliForArithmeticGeometry:R09.7b/coefficient-presentation`, `AlgebraicModuliForArithmeticGeometry:R09.7b/test-invariance`.

Source match: BM97, Construction 4.23, Proposition 4.24, pp. 247–248; proof §5, pp. 252–253. Factoring the common exceptional monomial gives the residual mark and, for a residual value below one, an additional monomial pair. The equivalence conclusion uses the restricted test class.

Uses: BM97§6.12–6.15: Creates the normalized next-stage data and separates monomial from residual order.

Planning API:

- `residualValue_zeroBoundary` (simp): No exceptional contribution leaves µ unchanged.
- `residualValue_balance` (characterisation): ν plus the sum of exceptional orders equals µ.
- `residualValue_nonneg` (compatibility): ν is nonnegative when the exceptional sum is at most µ.

Discriminating unit tests:

- `residual_first_year` (computation): For the BM97 Example2.1 year1 coefficient y1³y2³ of mark 2, µ=3, µ_H=3/2, ν=3/2.
- `residual_monomial` (degenerate): A pure boundary monomial has residual value0.
- `residual_not_total_order` (non-example): Subtracting exceptional contributions is essential: with µ=3, µ_H=3/2 the residual is not3.

Acceptance: All hypotheses remain visible; the contract distinguishes the identified edge cases.

Lean prototype: Exact numerical finite residual formula only; global greatest common monomial, rational-mark clearing and restricted test class are omitted.

### Hilbert–Samuel strata from finite jet minors

Target `AlgebraicModuliForArithmeticGeometry:R09.7b/jet-minors` (theorem). Planning name: `TauCetiRoadmap.AlgebraicModuli.Resolution.jet_minors`.

For I⊂K[[X]], form the finite jet module F_l=K[[X]][[Y]]/((Y)^(l+1), J^l I). A generator matrix B_l has rows monomials Y^α, |α|≤l and columns Y^β j_X^l f_i. If r_l=rank B_l(0), the(r_l+1)-minors generate the l-th jet rank condition near the reference point. The formal Hilbert–Samuel stratum idealI_S^l is the sum of these minor ideals over jetsk≤l. Under properties7.2(1)–(5), for l≥max_i ord(f_i)−1, the sum of these minor ideals equals the ideal generated by derivatives D^αf_i with|α|<ord(f_i). This is a finite determinantal, generator-independent presentation, not an assumed flatness theorem.

Hypotheses: Formal characteristic-zero regular chartK[[W, Z]], finite upward-closed diagram with verticesα_i ordered in total-degree blocks; d_i=|α_i|, chosen derivative multiindicesβ_j=α_(i(j))−e_j, block counts s_l and essential coordinates Z^l; K≥max d_i−1. (1)Each f_i∈I has order d_i. (2)For every degree block, homogeneous division by the corresponding initial forms is unique, with quotient supports in the disjoint Δ_i and remainder outside that partial diagram. (3)Every f∈I has a supported expansionΣq_i f_i with supp(q_i)⊂Δ_i. This is stronger than merely choosing generators. (4)For each essential-variable block, g_j=D^(β_j)f_(i(j)) lies in its coordinate ideal (Z^l), and its square Jacobian determinant in those coordinates is nonzero at 0. (5)For every later generator i>s_l and β in the partial essential diagram with |β|≤K, the derivative D_(Z^l)^β f_i belongs to (Z^l). These vanishings are required separately from the Jacobian unit.

Proof plan:

1. Prove generator independence of minor ideals by column changes.
2. Use homogeneous division to obtain a unit rank minor.
3. Adjoin each derivative column and compare its cofactor with the corresponding larger minor.
4. Use essential-variable conditions to induct through the vertex-order blocks; compare reverse inclusion by zero excess columns.

Prerequisites: `AlgebraicModuliForArithmeticGeometry:R09.7b/formal-division`, `AlgebraicModuliForArithmeticGeometry:R09.7b/coefficient-presentation`.

Source match: BM97, Definitions 7.9–7.13, Theorem 7.14 and proof, pp. 265–268. The determinantal jet ideal encodes the order threshold under the five formal presentation conditions. The cumulative ideal sums the relevant jet-minor ideals, rather than retaining only one degree.

Acceptance: All hypotheses remain visible; the contract distinguishes the identified edge cases.

Lean prototype: Global geometric signature omitted until the requested supplier carriers exist.

### Finite-degree stabilization for monotone diagrams

Target `AlgebraicModuliForArithmeticGeometry:R09.7b/diagram-stabilization` (theorem). Planning name: `TauCetiRoadmap.AlgebraicModuli.Resolution.diagram_stabilization`.

For a monotone diagram D⊂N^n with ordered vertices α_i and division regions Δ_i, there exists k(D) such that for any commutative coefficient ring A and homogeneous H_i of degree|α_i|, if the prescribed family {Y^βH_i:α_i+β∈Δ_i} together with complement monomials spans degree k≥k(D), it spans every degree l≥k. Monotone means replacing a later-coordinate exponent by the same added exponent in an earlier coordinate preserves membership.

Hypotheses: Finite n, monotone upward-closed diagram; arbitrary commutative coefficient ring.

Proof plan:

1. Construct the finite complement slices F_r and k(D) of Definition 8.3.
2. Above k(D), multiplication by the first surviving variable stays in the same division region.
3. Induct through coordinate slices, decompose a degree(k+1) polynomial into pieces divisible by successive variables, and lift each span.

Prerequisites: `AlgebraicModuliForArithmeticGeometry:R09.7b/formal-diagram`, `AlgebraicModuliForArithmeticGeometry:R09.7b/formal-division`.

Source match: BM97, Theorem 8.1, Definition 8.3 and proof, pp. 273–275. A nonincreasing sequence of ordered diagrams stabilizes. The finite-degree spanning threshold reduces the formal support condition to finitely many coefficient tests.

Acceptance: All hypotheses remain visible; the contract distinguishes the identified edge cases.

Lean prototype: Global geometric signature omitted until the requested supplier carriers exist.

### Semicoherent Hilbert–Samuel presentations

Target `AlgebraicModuliForArithmeticGeometry:R09.7b/hs-semi-presentation` (theorem). Planning name: `TauCetiRoadmap.AlgebraicModuli.Resolution.hs_semi_presentation`.

For a closed finite-type subscheme X in smooth M over characteristic zero, every closed point a has a neighbourhood, a smooth germ N and finitely many regular weighted coefficient functions whose cosupport equals the Hilbert–Samuel stratum through a. These presentations are semicoherent: the same regular data restrict along that stratum, and under legal test transforms unchanged Hilbert–Samuel value is equivalent to membership in the transformed cosupport. The Hilbert–Samuel function is Zariski upper semicontinuous and locally has finitely many values.

Hypotheses: Finite-type characteristic zero scheme, coherent ideal, regular coordinates; allow non-k-rational closed points using residue-field completions.

Proof plan:

1. Construct formal generators satisfying all five conditions 7.2; group vertices by degree and eliminate their essential variables using Jacobian-unit equations.
2. Obtain regular coefficient functions by finite matrix inversion/Cramer division, not by pretending the formal standard basis is convergent.
3. Apply diagram-stabilization to reduce openness of all homogeneous divisions to finitely many degrees.
4. Jet-minors identifies the common cosupport; Theorems 7.20, 7.21 supply admissible and exceptional transform comparisons.

Prerequisites: `AlgebraicModuliForArithmeticGeometry:R09.7b/jet-minors`, `AlgebraicModuliForArithmeticGeometry:R09.7b/diagram-stabilization`, `AlgebraicModuliForArithmeticGeometry:R09.7b/formal-division`, `AlgebraicModuliForArithmeticGeometry:R09.7a/transforms`.

Source match: BM97, Theorems 7.20–7.21, pp. 268–273; Theorems 9.2, 9.4, 9.6, pp. 276–282. The transformation theorem controls Hilbert–Samuel functions after admissible blowup; the semicontinuity and semicoherence proofs replace formal coefficients by regular local data on finite threshold opens.

Acceptance: All hypotheses remain visible; the contract distinguishes the identified edge cases.

Lean prototype: Global geometric signature omitted until the requested supplier carriers exist.

### Exceptional birth blocks

Target `AlgebraicModuliForArithmeticGeometry:R09.7b/exceptional-history` (definition). Planning name: `TauCetiRoadmap.AlgebraicModuli.Resolution.birthIndex`.

For a resolution history and a point a at stage j, the birth of a truncated half-invariant is the earliest ancestor stage with its current value. E^r(a) consists of remaining divisors through a descending from boundary divisors present at that birth, excluding previous blocks; s_r=#E^r(a). The complementary recent divisors enter residual µ_H calculations. These blocks are disjoint and semicoherent along fixed truncated-invariant strata. Two identical final equations with different histories may have different invariants.

Hypotheses: Admissible tower whose relevant truncated invariant never increases; boundary labels and ancestry are part of the data.

Proof plan:

1. Take the minimum stage with the equal ancestor value.
2. Transport boundary labels by strict transform and remove earlier blocks.
3. Use Proposition 6.6 to identify blocks after shrinking along a stratum.

Prerequisites: `AlgebraicModuliForArithmeticGeometry:R09.7b/hs-semi-presentation`, `AlgebraicModuliForArithmeticGeometry:R09.7a/snc-pair`, `AlgebraicModuliForArithmeticGeometry:R09.7b/residual-presentation`.

Source match: BM97, Proposition 6.6, Definitions 6.8, 6.15, pp. 255–259. The old exceptional blocks are determined at the birth of the successive truncated invariants. Earlier blocks are removed and divisor labels are transported through strict transform.

Uses: BM97§6.8–6.15: Separates old exceptional components from the recent monomial part in each invariant slot.

Planning API:

- `birthIndex_lt` (characterisation): If current occurs in the ancestor list, birth index is less than its length.
- `birthIndex_get` (projection): The value at the birth index is current, when it occurs.
- `birthIndex_first` (characterisation): Every earlier value differs from current.

Discriminating unit tests:

- `birth_plateau` (computation): In history[5, 3, 3], current3 is born at stage1, not2.
- `birth_new_value` (computation): In history[5, 3, 2], current2 is born at stage2.
- `birth_missing` (degenerate): Absent values return length only as a helper convention; valid tower histories must contain current.

Acceptance: All hypotheses remain visible; the contract distinguishes the identified edge cases.

Lean prototype: Exact finite-history earliest-index helper. Geometric ancestor transport and semicoherence remain omitted.

### Full desingularization invariant

Target `AlgebraicModuliForArithmeticGeometry:R09.7b/full-invariant` (construction). Planning name: `TauCetiRoadmap.AlgebraicModuli.Resolution.InvariantData`.

Construct inv_X(a)=(H_X, a, s1; ν2, s2; …; νt, st; ν_(t+1)), where finalν is0 or∞ and intermediateν are positive rational. For hypersurfaces H may be replaced by multiplicity. At each slot add old-boundary equations(mark 1), pass to maximal contact/coefficient data, subtract only the recent boundary monomial, normalize residual data, and take its birth block. General-variety presentations are padded as in Remark 9.15(3) using embedding dimension e=H(1)−1 so the invariant is independent of presentation codimension and ambient embedding. At most the ambient dimension many paired stages are followed by one terminal slot; denominators satisfy recursively e_r!ν_(r+1)∈N. Order or Hilbert–Samuel value alone is insufficient.

Hypotheses: Char0, finite-type smooth local embedding, admissible history, labelled exceptional boundary. Hilbert–Samuel functions ordered pointwise then subsequent slots lexicographically.

Proof plan:

1. Start from the semicoherent Hilbert–Samuel presentation and old-boundary block.
2. For positive finite residual values repeatedly lower dimension by maximal contact and coefficient presentations.
3. Record zero and infinity as distinct terminal cases, not rationals.
4. For ambient dimension n, codimension r and e=H(1)−1, if n−r<e insert e−(n−r)−1 copies of (1, 0), reindex the given presentation as slot e−(n−r), and set the intervening old blocks empty. If n−r=e, retain the initial slot with no padding. Resume the next residual value at index e−(n−r)+1, or at 2 in the equality case. Compare presentations and embeddings using Remark 9.15(3).
5. Track common-mark denominators using e_(r+1)=max(e_r!, e_r!ν_(r+1)).

Prerequisites: `AlgebraicModuliForArithmeticGeometry:R09.7b/hs-semi-presentation`, `AlgebraicModuliForArithmeticGeometry:R09.7b/maximal-contact`, `AlgebraicModuliForArithmeticGeometry:R09.7b/coefficient-presentation`, `AlgebraicModuliForArithmeticGeometry:R09.7b/residual-presentation`, `AlgebraicModuliForArithmeticGeometry:R09.7b/exceptional-history`.

Source match: BM97, §6.7–6.17, pp. 256–260; Remark 9.15(3), pp. 282–283. The recursive invariant combines the whole Hilbert–Samuel function, old-boundary counts and residual minima, with a distinct terminal value. Remark 9.15 supplies the explicit padding that removes presentation-codimension dependence.

Uses: BM97 Theorem1.14 and§§10–13: The complete value determines globally permissible maximal strata and supplies termination.

Planning API:

- `InvariantData.hilbertSamuel` (projection): The initial slot is the entire Hilbert–Samuel function, not just multiplicity.
- `InvariantData.slots` (projection): Each intermediate slot retains residual rational order and old-exceptional cardinality.
- `InvariantData.terminal` (projection): The last value distinguishes0(monomial)and∞(smooth stratum).

Discriminating unit tests:

- `invariant_terminal_distinct` (non-example): Terminal0 and∞ are different constructors.
- `invariant_cusp_tail` (computation): Cusp z²−x³ with empty boundary has tail(3/2, 0; ∞)after(2, 0).
- `invariant_history_matters` (non-example): BM97 Examples2.1(year4)and2.2 have the same equation z²−xy² but different residual tails0 and3/2 because their histories differ.

Acceptance: All hypotheses remain visible; the contract distinguishes the identified edge cases.

Lean prototype: Data carrier retains every slot and terminal case. Realization from geometry, lex ordering, padding, denominator constraints and embedding independence are omitted.

### Semicontinuity and permissible monotonicity

Target `AlgebraicModuliForArithmeticGeometry:R09.7b/invariant-semicontinuity` (theorem). Planning name: `TauCetiRoadmap.AlgebraicModuli.Resolution.invariant_semicontinuity`.

The full inv_X is Zariski upper semicontinuous and locally has finitely many values. Along inv-admissible blowups it never increases at points above the centre. In the terminal∞ case its stratum is smooth; in the terminal0 case the stratum is a union of boundary-coordinate intersections in the final maximal-contact space. The assertions apply to the full history-sensitive invariant and its semicoherent presentations.

Hypotheses: All conditions of full-invariant; compare admissible rather than arbitrary blowups.

Proof plan:

1. Induct slotwise through semicoherent presentations and exceptional birth blocks.
2. On a fixed earlier stratum residual order is the order of the divided regular functions divided by the common mark.
3. Apply Lemma 5.1 and Hilbert–Samuel transform theorem7.20 for no increase.
4. Use terminal zero monomial inequalities and terminal infinity all-zero coefficient data to identify strata.

Prerequisites: `AlgebraicModuliForArithmeticGeometry:R09.7b/full-invariant`, `AlgebraicModuliForArithmeticGeometry:R09.7b/test-invariance`, `AlgebraicModuliForArithmeticGeometry:R09.7b/exceptional-history`.

Source match: BM97, Theorem 1.14(1), (3), pp. 220–221; Proposition 6.13 and proof §6, pp. 258–260. Semicoherent presentations produce closed threshold loci for the complete invariant and identify the smooth local maximal locus; numerical order alone does not give this result.

Acceptance: All hypotheses remain visible; the contract distinguishes the identified edge cases.

Lean prototype: Global geometric signature omitted until the requested supplier carriers exist.

### Well-founded invariant values

Target `AlgebraicModuliForArithmeticGeometry:R09.7b/value-stabilization` (theorem). Planning name: `TauCetiRoadmap.AlgebraicModuli.Resolution.value_stabilization`.

Every nonincreasing sequence of realizable Hilbert–Samuel functions in fixed bounded ambient dimension stabilizes; with the recursive bounded-denominator conditions of the full invariant and finite length, every nonincreasing sequence of inv_X values stabilizes. The proof cannot use the false assertion that arbitrary rational numbers form a well-founded decreasing order.

Hypotheses: Realizable local Hilbert–Samuel functions; bounded ambient dimension; denominator recursion attached to fixed preceding slots.

Proof plan:

1. Apply BM89 Theorem5.2.1: from a strictly descending sequence extract successive subsequences with each initial diagram vertex fixed; bounded degree gives finitely many choices at each extraction. Dickson finiteness forces the limiting vertex list to terminate, contradicting strict descent. This combinatorial proof works over any coefficient field.
2. Once the initial slot stabilizes, the old count lies in bounded naturals.
3. Freeze earlier slots so later denominators are bounded; clear denominators and apply natural-number stabilization slotwise.

Prerequisites: `AlgebraicModuliForArithmeticGeometry:R09.7b/formal-diagram`, `AlgebraicModuliForArithmeticGeometry:R09.7b/full-invariant`.

Source match: BM97, Theorem 1.14(2), p. 220; proof §6, p. 260. The finite-denominator recursion controls each rational slot once preceding slots are fixed. The separate BM89 diagram argument supplies stabilization of the initial Hilbert–Samuel slot. BM89, Theorem 5.2.1 and Corollary 5.2.2, with proof, pp. 820–821. Stabilization of complement-count functions of upward-closed monomial diagrams; via formal division this supplies Hilbert–Samuel stabilization.

Acceptance: The rational sequence1, 1/2, 1/3, …is explicitly excluded by the bounded-denominator requirement.

Lean prototype: Global geometric signature omitted until the requested supplier carriers exist.

## R09.7c — Global centres and finite resolution

Atlas planets: Monomial centres, Canonical centres, Invariant decrease, Finite termination, Embedded resolution.

### Minimal monomial centres

Target `AlgebraicModuliForArithmeticGeometry:R09.7c/monomial-centres` (definition). Planning name: `TauCetiRoadmap.AlgebraicModuli.Resolution.minimalMonomialCentre`.

For nonnegative rational boundary weights Ω_i, a subset J of the components through a point is minimally admissible if Σ_(i∈J)Ω_i≥1 and removing any member makes that sum<1. In the terminalν=0 case these subsets index the smooth coordinate components of the invariant stratum in maximal-contact space. In a chart pivot l∈J, controlled transformation changes Ω_l to Σ_JΩ_i−1 and leaves other exponents unchanged. Minimality gives0≤Ω_l′<Ω_l and thus decreases the auxiliary µ=ΣΩ_i whenever inv remains fixed.

Hypotheses: Finite boundary set, nonnegative rational weights with bounded common denominator; nonempty J.

Proof plan:

1. Identify monomial cosupport by which coordinate divisors vanish.
2. Use nonnegativity to reduce minimal-subset testing to one-member deletion.
3. Compute the controlled monomial exponent in each SR4 blowup chart.

Prerequisites: `AlgebraicModuliForArithmeticGeometry:R09.7b/invariant-semicontinuity`, `AlgebraicModuliForArithmeticGeometry:R09.7b/residual-presentation`, `tauceti:TauCetiRoadmap/StableReduction#layer-4-blowups-and-intersection-theory-on-arithmetic-surfaces`.

Source match: BM97, Theorem 1.14(3)–(4), p. 220; proof §6, p. 260. At terminal residual value zero the permissible components come from inclusion-minimal boundary subsets whose weights reach one. The pivot update lowers the corresponding auxiliary order.

Uses: BM97 Theorem1.14(4), §10: Selects permissible components when the full invariant ends in zero and supplies strict auxiliary decrease.

Planning API:

- `monomialChartWeights_pivot` (simp): The pivot exponent is the centre-weight sum minus1.
- `monomialChartWeights_other` (simp): Nonpivot exponents stay unchanged.
- `monomialChartWeights_decrease` (compatibility): For a minimally admissible J and pivot in J, its new exponent is nonnegative and strictly smaller.

Discriminating unit tests:

- `monomial_exact_threshold` (computation): Weights1/2, 1/2 require both components; after blowing up their intersection the pivot exponent is0.
- `monomial_single_component` (computation): Weight3/2 admits its singleton centre; new weight1/2.
- `monomial_nonminimal` (non-example): With two weights1 the pair is not minimal; choosing it would fail strict decrease at the pivot.

Acceptance: All hypotheses remain visible; the contract distinguishes the identified edge cases.

Lean prototype: Named target signatures; no implementation claimed.

### Chronological tie breaking and maximal loci

Target `AlgebraicModuliForArithmeticGeometry:R09.7c/chronological-tie` (construction). Planning name: `TauCetiRoadmap.AlgebraicModuli.Resolution.chronologicalScore`.

Label exceptional divisors by creation stage, with fixed initial boundary order. Order subsets by their chronological binary words, with older labels compared first. For a fixed full invariant value choose the largest boundary subset J(a) that cuts out a component of the monomial stratum; at terminal∞ use its smooth stratum. The augmented(inv_X, J) has a smooth closed maximum locus on each quasi-compact unresolved locus. Local choices agree on overlaps because the invariant, labels and component equations agree. The whole unrefined maximum locus may be reducible and nonsmooth.

Hypotheses: Quasi-compact Noetherian finite-type spaces; fixed compatible chronological boundary ordering. Use only invariant strata and their components supplied by the preceding targets.

Proof plan:

1. Apply local finite-valued semicontinuity to obtain maxima.
2. Refine each monomial stratum by its largest chronological component.
3. Compare local closed ideals on overlaps, then glue using ideal-sheaf descent.

Prerequisites: `AlgebraicModuliForArithmeticGeometry:R09.7c/monomial-centres`, `AlgebraicModuliForArithmeticGeometry:R09.7b/invariant-semicontinuity`, `AlgebraicModuliForArithmeticGeometry:R09.7b/exceptional-history`, `mathlib:AlgebraicGeometry.Scheme.IdealSheafData`.

Source match: BM97, Remarks 1.15–1.16, pp. 220–221; Remark 6.17, p. 260; §10, p. 285. The boundary components carry chronological order, and the refined invariant selects one component of the unrefined maximum. This supplies a canonical smooth centre, rather than a potentially intersecting union.

Uses: BM97§§10, 11, 13: Turns local components into global smooth centres and gives choice-independent local-isomorphism compatibility.

Planning API:

- `chronologicalScore_empty` (simp): The empty subset has score0.
- `chronologicalScore_injective` (characterisation): The score uniquely identifies a finite subset of fixed ordered labels.
- `chronologicalScore_add_label` (compatibility): Adding an absent label adds exactly its binary weight.

Discriminating unit tests:

- `tie_older_first` (computation): With two labels the older singleton wins, as in BM97 Example2.1year2.
- `tie_not_cardinality` (non-example): With three labels{oldest}outranks{two younger}, even though it has fewer members.
- `tie_empty_history` (degenerate): An empty boundary has only the empty score0.

Acceptance: All hypotheses remain visible; the contract distinguishes the identified edge cases.

Lean prototype: Exact finite chronological-word score with older labels first; the selection/gluing of geometric maximum components is omitted.

### Global maximum centres are permissible

Target `AlgebraicModuliForArithmeticGeometry:R09.7c/global-permissibility` (theorem). Planning name: `TauCetiRoadmap.AlgebraicModuli.Resolution.global_permissibility`.

For the refined maximal stratum on the closed unresolved locus, the glued centre is smooth, closed, contained in the relevant marked cosupport and in the target unresolved set, and has normal crossings with the labelled boundary. Its blowup is proper and projective, retains ambient smoothness and the SNC boundary, and agrees with the chartwise controlled and strict transforms.

Hypotheses: Quasi-compact finite-type characteristic zero input; unresolved locus invariant-stratum saturated and closed; canonical tie rule.

Proof plan:

1. Use local strata descriptions to prove smoothness and coordinate permissibility.
2. Check order divisibility along each centre component.
3. Descend the equal ideals on overlaps.
4. Apply imported SR4 projectivity and smooth coordinate blowup charts.

Prerequisites: `AlgebraicModuliForArithmeticGeometry:R09.7c/chronological-tie`, `AlgebraicModuliForArithmeticGeometry:R09.7a/marked-ideal`, `AlgebraicModuliForArithmeticGeometry:R09.7a/transforms`, `tauceti:TauCetiRoadmap/StableReduction#layer-4-blowups-and-intersection-theory-on-arithmetic-surfaces`.

Source match: BM97, Theorem 1.14 and §10, pp. 220–221, 284–285; Theorem 11.14, p. 291. The local maximal-locus description and chronological refinement glue to a smooth globally permissible centre. The old and recent boundary conditions remain part of this conclusion.

Acceptance: All hypotheses remain visible; the contract distinguishes the identified edge cases.

Lean prototype: Global geometric signature omitted until the requested supplier carriers exist.

### Progress of the full invariant and monomial cleanup

Target `AlgebraicModuliForArithmeticGeometry:R09.7c/strict-progress` (theorem). Planning name: `TauCetiRoadmap.AlgebraicModuli.Resolution.strict_progress`.

Blowing up the selected centre gives inv_X′(a′)≤inv_X(a). At a maximal terminal∞ stratum the full invariant strictly decreases. At a terminal0 stratum either inv decreases or it stays equal and the auxiliary µ strictly decreases, with denominator bounded by the corresponding e_t!. Thus the lexicographic progress measure(inv, µ)has no infinite stationary-inv chain. Neither point order nor multiplicity is required to decrease at every step.

Hypotheses: Permissible refined-maximal centre, full invariant with bounded denominators, point a′ above it.

Proof plan:

1. If∞, the maximal-contact stratum is the centre and its strict transform is empty.
2. If0, apply the minimal monomial exponent update in every pivot chart.
3. Use no-increase for earlier slots and denominator bounds for the auxiliary order.

Prerequisites: `AlgebraicModuliForArithmeticGeometry:R09.7c/global-permissibility`, `AlgebraicModuliForArithmeticGeometry:R09.7c/monomial-centres`, `AlgebraicModuliForArithmeticGeometry:R09.7b/value-stabilization`.

Source match: BM97, Theorem 1.14(4), p. 220; proof §6, p. 260; Example 2.1, pp. 226–228. The infinite terminal case strictly lowers the full invariant; the zero terminal case first lowers the bounded-denominator monomial auxiliary value. These alternatives are retained in the progress contract.

Acceptance: BM97 Example2.1years2–4 has constant inv ending0 while auxiliaryµ decreases7/2→5/2→3/2.

Lean prototype: Global geometric signature omitted until the requested supplier carriers exist.

### Finite termination on quasi-compact input

Target `AlgebraicModuliForArithmeticGeometry:R09.7c/finite-termination` (theorem). Planning name: `TauCetiRoadmap.AlgebraicModuli.Resolution.finite_termination`.

The global algorithm has a finite number of blowups on a quasi-compact finite-type characteristic zero scheme. At each fixed maximum value, strict progress removes that value after finitely many steps; otherwise choose a persistent branch of maximum-value points through the proper towers and contradict the bounded-denominator auxiliary decrease. The successive maximum values form a nonincreasing realizable sequence and stabilize, so infinitely many strict global decreases are impossible. Termination depends on the Hilbert–Samuel stabilization proof and the proper/quasi-compact argument, not only on local strict decrease.

Hypotheses: Quasi-compact finite-type input, proper blowup maps, locally finite-valued full invariant with the established stabilization property.

Proof plan:

1. Use properness to retain nonempty inverse images of persistent closed maximum loci.
2. Compactness/Noetherian finite-stratum selection supplies a compatible persistent history when the maximum survives forever.
3. Contradict strict-progress on that history.
4. Apply value-stabilization to the sequence of global maxima and iterate until the unresolved locus is empty.

Prerequisites: `AlgebraicModuliForArithmeticGeometry:R09.7c/strict-progress`, `AlgebraicModuliForArithmeticGeometry:R09.7b/value-stabilization`, `tauceti:TauCetiRoadmap/StableReduction#layer-4-blowups-and-intersection-theory-on-arithmetic-surfaces`.

Source match: BM97, Proof of Theorem 1.6, §10, p. 285; proof of Theorem 11.14, p. 291. The global proof combines quasi-compactness, a persistent maximum branch and stabilization of the invariant with strict local progress. Finite global termination is not deduced solely from pointwise termination.

Acceptance: All hypotheses remain visible; the contract distinguishes the identified edge cases.

Lean prototype: Global geometric signature omitted until the requested supplier carriers exist.

### Resolution towers and their output

Target `AlgebraicModuliForArithmeticGeometry:R09.7c/resolution-tower` (definition). Planning name: `TauCetiRoadmap.AlgebraicModuli.Resolution.ResolutionTowerData`.

A finite resolution tower is a composable finite sequence of blowups of smooth ambient schemes in smooth permissible centres, with strict transforms of the closed target and labelled exceptional histories at every stage. Its output morphism is the composite from the last stage to the initial one. Record the open set preserved by every centre, projectivity and properness of the composite, transformed ideals and boundary—not only an abstract existence of a smooth model.

Hypotheses: Finite-type characteristic zero ambient, closed target and(initially possibly empty)SNC boundary. All geometric tower assertions are properties to prove using earlier nodes, not input axioms asserting resolution.

Proof plan:

1. Represent finite stages and connecting maps, with boundary/ideal transport.
2. Compose maps in the final-to-initial direction.
3. Induct projectivity, properness and identity over the chosen open set.

Prerequisites: `AlgebraicModuliForArithmeticGeometry:R09.7a/transforms`, `AlgebraicModuliForArithmeticGeometry:R09.7c/global-permissibility`, `mathlib:AlgebraicGeometry.Scheme.IdealSheafData`.

Source match: BM97, §6.7, p. 256; Theorems 11.14, 13.2, pp. 291, 297. The transformation sequence and the global universality theorem supply finite towers with transported centres and boundary; the Lean carrier records only their underlying scheme data.

Uses: BM97§§11–13; compactification assembly: Supplies the actual morphism and preserved open embedding, not an arbitrary smooth variety.

Planning API:

- `ResolutionTower.composite_proper` (compatibility): A tower of proper blowups has proper composite.
- `ResolutionTower.composite_projective` (compatibility): A finite tower of projective blowups has projective composite.
- `ResolutionTower.over_open` (compatibility): If every centre is disjoint from the current preimage of U, the composite restricts to an isomorphism above U.

Discriminating unit tests:

- `tower_length_zero` (degenerate): A zero-length tower has identity composite.
- `tower_orientation` (compatibility): For length2 the composite is step1 followed by step0, from M2 to M0.
- `tower_disjoint_open` (non-example): For A² blown up at the origin, the composite is identity over A² outside the origin, not over the origin.

Acceptance: All hypotheses remain visible; the contract distinguishes the identified edge cases.

Lean prototype: Finite-prefix scheme-map and centre-ideal data, with correctly oriented composite. Blowup identification, smooth/SNC/transforms/history and open-preservation conditions are omitted.

### Embedded resolution of finite-type varieties

Target `AlgebraicModuliForArithmeticGeometry:R09.7c/embedded-resolution` (theorem). Planning name: `TauCetiRoadmap.AlgebraicModuli.Resolution.embedded_resolution`.

For a reduced closed finite-type k-subscheme X⊂M with M smooth and k characteristic zero, there is a finite projective permissible ambient blowup tower whose final strict transform X′ is smooth and meets the final exceptional divisor with simultaneous normal crossings. The composite restricts to an isomorphism above Reg(X). For a nonreduced closed subscheme, the source theorem instead gives smooth reduced final support and locally constant Hilbert–Samuel function; it does not claim the nonreduced transform is smooth.

Hypotheses: Reduced target for smooth-output version; finite-type smooth ambient, characteristic zero; quasi-compact support.

Proof plan:

1. Use Hilbert–Samuel/Jacobian strata to identify the singular unresolved locus.
2. Apply canonical centres and finite termination until the reduced strict transform is smooth.
3. Run the boundary-transversality cleanup on the remaining closed bad locus.
4. Keep strict transform and exceptional-support identities; use the stronger preservation target for an initial boundary.

Prerequisites: `AlgebraicModuliForArithmeticGeometry:R09.7c/finite-termination`, `AlgebraicModuliForArithmeticGeometry:R09.7c/resolution-tower`, `AlgebraicModuliForArithmeticGeometry:R09.7b/hs-semi-presentation`.

Source match: BM97, Theorem 11.14, p. 291; §10, p. 285. The reduced conclusion is smooth strict transform with SNC boundary and preservation of the original regular locus. The nonreduced conclusion is stated separately in its weaker form.

Acceptance: A cusp in A² has a smooth strict transform after the permissible tower. For nonreduced X no false smoothness of X′ is asserted.

Lean prototype: Global geometric signature omitted until the requested supplier carriers exist.

### Principalization of coherent ideals

Target `AlgebraicModuliForArithmeticGeometry:R09.7c/principalization` (theorem). Planning name: `TauCetiRoadmap.AlgebraicModuli.Resolution.principalization`.

For a coherent ideal I nonzero on every component of a quasi-compact smooth finite-type characteristic zero scheme M, there is a finite permissible blowup tower such that the final weak transform is the unit ideal and the total transform is an invertible monomial ideal with respect to an SNC boundary. The product of the total transformed ideal with the Jacobian ideal of the composite is also normal crossing. Centres lie over the nonunit locus of I, so the unit open is preserved.

Hypotheses: I not identically zero on any component; coherent finite-type ideal, characteristic zero smooth M. Weak transform uses generic centre order, not fixed controlled mark.

Proof plan:

1. Present the initial ideal order by its finite generators marked with its current order, as in §1.19.
2. Apply the same presentation/invariant construction to weak transforms.
3. At zero order, the weak ideal is unit; all removed exceptional factors form the total monomial ideal.
4. Track the Jacobian exceptional factors in adapted smooth blowup coordinates.

Prerequisites: `AlgebraicModuliForArithmeticGeometry:R09.7b/full-invariant`, `AlgebraicModuliForArithmeticGeometry:R09.7a/transforms`, `AlgebraicModuliForArithmeticGeometry:R09.7c/finite-termination`.

Source match: BM97, Theorem 1.10, p. 216; §1.19, p. 225. For an ideal nonzero on each component, the theorem gives a unit weak transform and a monomial total transform, together with normal-crossing Jacobian data. The unit locus is unchanged.

Acceptance: Unit ideal requires no blowups. Zero ideal on a component is excluded: it cannot become a unit weak transform.

Lean prototype: Global geometric signature omitted until the requested supplier carriers exist.

### Preservation of prescribed regular and SNC open sets

Target `AlgebraicModuliForArithmeticGeometry:R09.7c/preserve-resolved` (theorem). Planning name: `TauCetiRoadmap.AlgebraicModuli.Resolution.preserve_resolved`.

For a smooth embedded X with SNC ambient boundary E, modify boundary cleanup so every centre lies in the closed locus where X and E fail simultaneous normal crossings; already resolved points are never blown up. More generally combine the singular-locus stage with this cleanup to preserve a prescribed open locus on which the input pair is already resolved. For compactification, principalize the boundary ideal while keeping the smooth dense open U fixed, and resolve/clean the boundary outside U.

Hypotheses: Finite-type characteristic zero; the chosen open locus is already smooth and has the required SNC relation; no assertion that arbitrary boundary-containing centres avoid it.

Proof plan:

1. Use the closed bad-intersection locus from Lemma 12.5.
2. Factor restricted boundary equations into exceptional monomials and strict components.
3. Resolve the reduced restricted components by induction on dimX as in §12.4.
4. Apply the strengthened combinatorial Lemma 12.8 to remove remaining exceptional factors with centres inside the unresolved locus.

Prerequisites: `AlgebraicModuliForArithmeticGeometry:R09.7c/embedded-resolution`, `AlgebraicModuliForArithmeticGeometry:R09.7c/principalization`, `AlgebraicModuliForArithmeticGeometry:R09.7c/monomial-centres`.

Source match: BM97, Theorems 12.2, 12.4, Lemmas 12.5–12.8, pp. 292–295. The modified construction excludes already resolved points. Closedness of the unresolved locus and the final monomial cleanup are separate proof ingredients.

Acceptance: The pair X=(z−xy), E=(z)has only the origin initially unresolved; centres elsewhere are forbidden. For an SNC pair the modified tower is empty.

Lean prototype: Global geometric signature omitted until the requested supplier carriers exist.

### Global gluing and local-isomorphism universality

Target `AlgebraicModuliForArithmeticGeometry:R09.7c/local-isomorphism-functoriality` (theorem). Planning name: `TauCetiRoadmap.AlgebraicModuli.Resolution.local_isomorphism_functoriality`.

The intrinsic invariant is independent of the smooth local embedding after Remark 9.15(3)normalization. Canonical centres glue across local embeddings, giving a finite resolution of quasi-compact finite-type X even without a global embedding. Every isomorphism X|U≅Y|V lifts uniquely to the complete towers and their final morphisms, with empty stages handled compatibly. Open restrictions are covered. Smooth-morphism functoriality is not concluded from this theorem; it requires an additional proof of invariant and centre compatibility.

Hypotheses: Quasi-compact finite-type characteristic zero schemes, compatible boundary labels; local-isomorphism universality as stated in BM97.

Proof plan:

1. Compare minimal embeddings by local ambient isomorphisms.
2. Apply Remarks 13.1 to a smooth ambient enlargement; use Hilbert–Samuel padding to retain the same invariant.
3. Compare local maximum-centre ideals on overlaps and descend them.
4. Lift local isomorphisms through each blowup via SR4 universal property; uniqueness holds because the maps agree on the dense unchanged open.

Prerequisites: `AlgebraicModuliForArithmeticGeometry:R09.7b/full-invariant`, `AlgebraicModuliForArithmeticGeometry:R09.7c/chronological-tie`, `AlgebraicModuliForArithmeticGeometry:R09.7c/preserve-resolved`, `tauceti:TauCetiRoadmap/StableReduction#layer-4-blowups-and-intersection-theory-on-arithmetic-surfaces`.

Source match: BM97, Remarks 13.1, Theorem 13.2, pp. 296–298. The source compares different smooth embeddings and glues the canonical construction, then states universality for local isomorphisms. General smooth-morphism universality is left outside that claim.

Acceptance: Two different smooth ambient embeddings give the same intrinsic resolution morphism. Open restriction yields the corresponding restricted tower. No unproved all-smooth-maps functoriality is included.

Lean prototype: Global geometric signature omitted until the requested supplier carriers exist.

## R09.7d — Compactification and boundary interfaces

Atlas planets: Good compactifications, SNC compactification theorem, Complex point charts, Punctured polydiscs, Holomorphic boundary charts, Finite cover compactifications.

### Boundary ideal on a projective closure

Target `AlgebraicModuliForArithmeticGeometry:R09.7d/boundary-ideal` (application). Planning name: `TauCetiRoadmap.AlgebraicModuli.Resolution.boundary_ideal`.

Let U be a smooth quasi-projective finite-type k-scheme in characteristic zero, with a chosen locally closed embedding in projective space. Import its reduced projective closure Y from R09.1. U is a dense open in Y and is contained in Reg(Y). Resolve Y by the intrinsic embedded-resolution output, preserving U. On the resulting smooth projective Y1 take the coherent radical ideal of the reduced closed complement Y1\U; it is unit on U and nonzero on each component of Y1.

Hypotheses: Smooth quasi-projective U; finite-type characteristic zero field; take reduced closure componentwise. A merely separated finite-type scheme is not thereby projectively compactifiable.

Proof plan:

1. Import R09.1 projective-space/closure and dense-open factorization.
2. Apply embedded resolution and local-embedding gluing; compose projective morphisms.
3. Extend the reduced complement ideal using Noetherian closed-subscheme correspondence.
4. Use density of U in every component to exclude an identically zero boundary ideal.

Prerequisites: `AlgebraicModuliForArithmeticGeometry:R09.1`, `AlgebraicModuliForArithmeticGeometry:R09.7c/embedded-resolution`, `AlgebraicModuliForArithmeticGeometry:R09.7c/local-isomorphism-functoriality`, `mathlib:AlgebraicGeometry.Scheme.IdealSheafData`.

Source match: BM97, Theorems 11.14, 13.2, pp. 291, 297; Theorem 1.10, p. 216. Resolution and principalization apply to the coherent ideal of the closed complement. Its pullback controls the exceptional boundary while centres stay outside the chosen smooth open.

Acceptance: For U=A¹, the projective closure isP¹ with a single missing point. For projective smooth U the complement ideal is unit.

Lean prototype: Global geometric signature omitted until the requested supplier carriers exist.

### Smooth projective SNC compactifications

Target `AlgebraicModuliForArithmeticGeometry:R09.7d/good-compactification` (definition). Planning name: `TauCetiRoadmap.AlgebraicModuli.Resolution.CompactificationData`.

A good compactification of U over a characteristic zero field k consists of a smooth projective k-scheme X, a dense open immersion j:U→X, and a finite labelled reduced SNC divisor D whose support is exactly X\j(U). Include j and the boundary identification as data with properties to prove; an abstract smooth X without this identification is insufficient. In dimension0, the boundary is empty. The geometric carrier is owned here; HodgeStructuresPartII:H.5 imports it and adds monodromy rather than defining another compactification.

Hypotheses: U smooth quasi-projective finite type; X projective over k and smooth, not just a proper algebraic space. For complex analytic outputs specialize k=C.

Proof plan:

1. Use snc-pair for the boundary condition.
2. Represent actual open immersion and structural morphism.
3. Record density, projectivity and exact support equality for all components.

Prerequisites: `AlgebraicModuliForArithmeticGeometry:R09.7a/snc-pair`, `AlgebraicModuliForArithmeticGeometry:R09.1`, `mathlib:AlgebraicGeometry.IsOpenImmersion`, `mathlib:AlgebraicGeometry.IsProper`.

Source match: BM97, Theorem 1.10, p. 216 and Theorem 13.2, p. 297; assembly specified here. This is a geometric carrier assembled from projective closure, resolution and principalization; it is not an extra theorem attributed to the source. Density, smoothness and boundary support are explicit conditions.

Uses: ShimuraVarieties:V3; HodgeStructuresPartII:H.5 andH.7; LL24 Lemma8.3.3: Exports the geometric compactification before Borel extension, period-map boundary analysis and finite-cover local monodromy.

Planning API:

- `CompactificationData.openRange_iff` (characterisation): The retained open range is precisely the image of the supplied inclusion.
- `GoodCompactification.support_complement` (projection): The boundary support is the complement of the dense open image.
- `GoodCompactification.projective_proper` (compatibility): Projectivity over k implies properness; the converse is not substituted in the definition.

Discriminating unit tests:

- `compactification_affine_line` (computation): A¹→P¹ has boundary∞ with multiplicity1 and smooth proper ambient.
- `compactification_projective` (degenerate): A smooth projective U has the identity good compactification with empty boundary.
- `compactification_cusp_rejected` (non-example): A projective cuspidal curve is not a good compactification, even with an empty boundary; smoothness fails.

Acceptance: All hypotheses remain visible; the contract distinguishes the identified edge cases.

Lean prototype: Uses native open-immersion/proper/smooth predicates, actual morphisms and ideal-sheaf data. Density, projectivity over a field, reduced Cartier boundary and SNC/support equality are omitted. This data carrier is not named GoodCompactification until those conditions exist.

### Existence of good compactifications

Target `AlgebraicModuliForArithmeticGeometry:R09.7d/snc-existence` (theorem). Planning name: `TauCetiRoadmap.AlgebraicModuli.Resolution.snc_existence`.

Every smooth quasi-projective finite-type characteristic zero U admits a good compactification. After resolving its reduced projective closure while preserving U, principalize the reduced boundary ideal on the smooth output. The total ideal becomes an invertible monomial ideal; take its reduced support D. Every blowup centre is outside U, so the final inclusion is the original U, and D has exactly the complement support. The result remains projective because every step is projective.

Hypotheses: Characteristic zero, quasi-projectivity and smoothness of U; boundary ideal nonzero on every component. The final reduced boundary need not have the multiplicities of the total ideal.

Proof plan:

1. Apply boundary-ideal to obtain smooth projective Y1 and its complement ideal.
2. Apply principalization with its unit-open preservation.
3. Replace the monomial Cartier divisor by its reduced SNC support.
4. Identify complement support by total pullback and preserved open; compose projective morphisms.

Prerequisites: `AlgebraicModuliForArithmeticGeometry:R09.7d/boundary-ideal`, `AlgebraicModuliForArithmeticGeometry:R09.7d/good-compactification`, `AlgebraicModuliForArithmeticGeometry:R09.7c/principalization`, `AlgebraicModuliForArithmeticGeometry:R09.7c/resolution-tower`.

Source match: BM97, Theorem 1.10, p. 216; Theorems 11.14, 13.2, pp. 291, 297. The cited resolution and principalization results, with the projective-closure supplier, produce a smooth projective compactification with SNC complement and unchanged original smooth open.

Acceptance: Already projective smooth input permits an empty tower. The resulting map retains the actual prescribed U, not only a birationally equivalent open.

Lean prototype: Global geometric signature omitted until the requested supplier carriers exist.

### Complex points for compactification charts

Target `AlgebraicModuliForArithmeticGeometry:R09.7d/complex-realization` (construction). Planning name: `TauCetiRoadmap.AlgebraicModuli.Resolution.affineComplexPoints`.

For a reduced separated finite-type C-scheme presented by affine polynomial charts, construct its analytic complex-point space by gluing those charts with Euclidean topology and holomorphic regular maps. Open immersions realize as open embeddings; divisor equations realize as holomorphic zero sets. A smooth n-dimensional scheme becomes a complex n-manifold via its Jacobian charts. For projective X, the complex-point space is compact, using closedness in complex projective space. This elementary realization is the lower-tier prerequisite for SNC charts; coherent GAGA, Chow and de Rham comparison remain with ComplexComparisonPartII.

Hypotheses: Reduced separated finite-type over C; smoothness for manifold conclusion; projectivity for compactness. Use X(C), not the underlying Zariski topological space of X.

Proof plan:

1. On affine embeddings use polynomial equations and holomorphic rational functions with nonvanishing denominators.
2. Glue transition functions; separatedness gives Hausdorffness.
3. Apply the Jacobian criterion and native complex local inverse theorem to the smooth coordinates.
4. For projective X use the compact quotient sphere model forPⁿ(C) and its closed polynomial zero locus.

Prerequisites: `AlgebraicModuliForArithmeticGeometry:R09.1`, `mathlib:HasStrictFDerivAt.toOpenPartialHomeomorph`.

Source match: SERRE56, §2no. 5, Lemma 1 and Proposition 2, pp. 7–9; no. 7Proposition6, p. 12. The elementary affine and projective complex-point results supply holomorphic realization and compactness. The plan uses only this reduced geometric comparison, leaving coherent GAGA to its existing owner.

Uses: Good compactification analytic boundary charts; ComplexComparisonPartII:C0: Supplies the basic local analytic realization needed before the higher-tier cohomological comparison.

Planning API:

- `ComplexPoints.openImmersion` (functoriality): A scheme open immersion gives a holomorphic open embedding of complex points.
- `ComplexPoints.projective_compact` (compatibility): A projective complex scheme has compact complex-point space.
- `ComplexPoints.divisor_zeroSet` (characterisation): On every realized affine chart, the Cartier divisor support is the zero set of its local regular equation.

Discriminating unit tests:

- `complex_affine_line` (computation): A¹(C) has the Euclidean complex-plane topology.
- `complex_projective_line` (computation): P¹(C) is compact; its affine chart isC and the complement is one point.
- `complex_topology_not_zariski` (non-example): A small Euclidean disk inC is analytically open but is not a Zariski open subset ofA¹.

Acceptance: All hypotheses remain visible; the contract distinguishes the identified edge cases.

Lean prototype: Elaborates affine polynomial complex-point zero sets and the divisor-equation API. Analytic topology, holomorphic scheme-map realization, projective gluing/compactness and global tests remain omitted. Local examples are explicitly projections of the geometric tests.

### SNC punctured polydiscs

Target `AlgebraicModuliForArithmeticGeometry:R09.7d/punctured-polydisc` (definition). Planning name: `TauCetiRoadmap.AlgebraicModuli.Resolution.puncturedPolydisc`.

For n≥0, positive radiusρ and0≤r≤n, define the polydisc Δ_ρ^n by |z_i|<ρ for all i and its boundary B_r by the union of coordinate hyperplanes z_i=0 for i<r. The complement is(Δ_ρ*)^r×Δ_ρ^(n−r). The local SNC analytic chart is a biholomorphism to the polydisc identifying D with B_r, not just a homeomorphism or a count of boundary components. Buffered radii and sector refinements are consuming adaptations already owned by HodgeStructuresPartII:H.7.

Hypotheses: n finite, r≤n, ρ>0; zero-coordinate exclusions for all first r coordinates.

Proof plan:

1. Define the domain and removed-coordinate predicate.
2. Split the coordinates into r and n−r for the product equivalence.
3. Check openness and extreme cases before using it as a chart contract.

Prerequisites: `AlgebraicModuliForArithmeticGeometry:R09.7d/complex-realization`.

Source match: BKT20, §4.1, preprint p.13; underlying coordinate-domain definition stated here. The source uses the coordinate domain obtained by removing boundary coordinate hyperplanes. The product domain and its nonempty and empty-boundary tests are stated explicitly in this plan.

Uses: ShimuraVarieties:V3 Borel extension; HodgeStructuresPartII:H.7 BKT boundary analysis: Gives the geometric punctured-polydisc neighbourhoods required by their separate analytic arguments.

Planning API:

- `puncturedPolydisc_mem` (characterisation): Membership requires both all norm bounds and nonvanishing of every removed coordinate.
- `puncturedPolydisc_zero` (simp): With no boundary the punctured polydisc is the full polydisc.
- `puncturedPolydisc_mono` (compatibility): Increasing r deletes more hyperplanes and shrinks the domain.

Discriminating unit tests:

- `puncture_dimension_zero` (degenerate): At n=r=0 the domain contains its unique empty tuple.
- `puncture_one_coordinate` (non-example): For n=2, r=1 the origin is excluded even when radius is positive.
- `puncture_unremoved_zero` (computation): For n=2, r=1, radius1 the tuple(1/2, 0)lies in the domain; the second zero is allowed.

Acceptance: All hypotheses remain visible; the contract distinguishes the identified edge cases.

Lean prototype: Exact coordinate domains elaborate. The biholomorphic chart and scheme-boundary identification are omitted; r≤n andρ>0 are explicit theorem hypotheses, not implicit definition assumptions.

### Finite holomorphic boundary charts

Target `AlgebraicModuliForArithmeticGeometry:R09.7d/snc-holomorphic-charts` (theorem). Planning name: `TauCetiRoadmap.AlgebraicModuli.Resolution.snc_holomorphic_charts`.

For a good compactification overC and each point x∈X(C), there is a biholomorphic polydisc chart with D equal to the union of its first r coordinate hyperplanes. The complement chart is exactly the punctured polydisc. Compactness of X(C) yields a finite such cover. The holomorphic map and its inverse extend over each full polydisc; a coordinate map defined only on the punctured locus would not suffice. Hodge H.7 may further shrink these charts to its own inner/outer buffered cover.

Hypotheses: Smooth projectiveC compactification, strict SNC reduced boundary; at each point use simultaneous regular parameters.

Proof plan:

1. Realize regular coordinate functions as holomorphic functions and use their nonzero Jacobian determinant.
2. Apply native inverse function theorem overC; shrink to a centred polydisc.
3. Identify each boundary equation up to a nowherezero holomorphic unit.
4. Use compactness and the open neighbourhoods to select a finite subcover.

Prerequisites: `AlgebraicModuliForArithmeticGeometry:R09.7d/good-compactification`, `AlgebraicModuliForArithmeticGeometry:R09.7d/complex-realization`, `AlgebraicModuliForArithmeticGeometry:R09.7d/punctured-polydisc`, `mathlib:HasStrictFDerivAt.toOpenPartialHomeomorph`.

Source match: SERRE56, §2no. 5, Lemma 1 and Proposition 2, pp. 7–9; elementary Jacobian/inverse-function assembly specified here. Regular coordinate functions become holomorphic in the elementary complex-point comparison. The SNC equations and the complex inverse-function theorem then supply the stated chart; full GAGA is unnecessary.

Acceptance: A point off D has r=0. At a transverse intersection of two components, r=2 and both coordinate zeros are removed. Chart inverses are holomorphic on the full disc.

Lean prototype: Global geometric signature omitted until the requested supplier carriers exist.

### Geometric input to Borel extension

Target `AlgebraicModuliForArithmeticGeometry:R09.7d/borel-geometric-input` (application). Planning name: `TauCetiRoadmap.AlgebraicModuli.Resolution.borel_geometric_input`.

Export the actual smooth projective compactification, finite full-polydisc SNC cover and its punctured complement cover to ShimuraVarieties:V3. Borel extension for maps into an arithmetic quotient is proved there from this geometric input and its own arithmetic/analytic hypotheses. Export the same geometry to HodgeStructuresPartII:H.5/H.7 for local monodromy and definable period maps. No extension theorem, quasi-unipotence, sector uniformization or Hodge-theoretic algebraicity follows from compactification alone.

Hypotheses: The complex source U is smooth quasi-projective; all target-group and variation hypotheses belong to the consuming theorem.

Proof plan:

1. Assemble snc-existence and snc-holomorphic-charts.
2. State the precise preserved-open and boundary equations in the consumer interface.
3. Keep DeligneHodgeII4.4.3 out of the compactification proof to avoid a Borel-algebraicity dependency cycle.

Prerequisites: `AlgebraicModuliForArithmeticGeometry:R09.7d/snc-existence`, `AlgebraicModuliForArithmeticGeometry:R09.7d/snc-holomorphic-charts`.

Source match: BKT20, §4.1, Theorem 4.1, preprint p.13:compactification is an input to period-map analysis. The period-map theorem consumes a smooth SNC compactification and punctured polydisc charts. This node exports those geometric inputs; buffered domains, sectors and period-map analysis keep their Hodge owner.

Acceptance: Borel consumer receives full holomorphic boundary charts. No arbitrary holomorphic map is claimed algebraic from this geometry.

Lean prototype: Global geometric signature omitted until the requested supplier carriers exist.

### Good compactification of a finite étale scheme cover

Target `AlgebraicModuliForArithmeticGeometry:R09.7d/finite-cover-compactification` (theorem). Planning name: `TauCetiRoadmap.AlgebraicModuli.Resolution.finite_cover_compactification`.

Let C°→M° be a finite étale cover by a smooth quasi-projectiveC scheme, with M° a scheme open in a projective normal model. Normalize that model in the finite extensions of its component function fields; the result is finite and projective by the imported Nagata-normalization theorem and agrees with C° over M°. It may be singular along the boundary. Resolve that model while preserving C°, then principalize the complement to obtain a good compactification. For covers of the moduli stack of stable pointed curves, use R09.4/R09.5 to supply the representable scheme model and its compactification/descent first; scheme normalization is not silently applied to an arbitrary stack.

Hypotheses: Finite étale cover, normal dense-open source and target; quasi-projective smooth scheme cover. Finite extensions componentwise; excellent/Nagata base; stable pointed curves require2g−2+n>0.

Proof plan:

1. Import finiteness of normalization and finite-type-over-a-field excellence.
2. Normality identifies normalization over the dense étale open with the given cover.
3. Track projectivity under finite maps and the preserved open.
4. Apply the intrinsic resolution and complement principalization; normality alone does not give smoothness.

Prerequisites: `SchemeAndStackFoundations:SF.0/nagata-normalization-finite`, `SchemeAndStackFoundations:SF.0/excellent-examples`, `AlgebraicModuliForArithmeticGeometry:R09.4`, `AlgebraicModuliForArithmeticGeometry:R09.5`, `AlgebraicModuliForArithmeticGeometry:R09.7d/snc-existence`, `AlgebraicModuliForArithmeticGeometry:R09.7c/local-isomorphism-functoriality`.

Source match: LL24, Lemma 8.3.3 proof, pp. 40–41. The proof normalizes the cover over a compactification and refines the boundary. The normalization may be singular, so scheme resolution and the stack/model suppliers are made explicit.

Acceptance: Normalize a finite étale scheme cover before boundary repair; do not assert the normalization is already smooth. Stack inputs have an explicit supplier requirement; they are not included in the scheme theorem.

Lean prototype: Global geometric signature omitted until the requested supplier carriers exist.

### Boundary-stratum refinement and geometric meridians

Target `AlgebraicModuliForArithmeticGeometry:R09.7d/boundary-stratum-refinement` (application). Planning name: `TauCetiRoadmap.AlgebraicModuli.Resolution.boundary_stratum_refinement`.

For a proper smooth DM compactification with ordinary normal-crossing boundary, blow up the boundary strata in a compatible order to separate local branches and obtain strict SNC boundary on the resulting model. This is the conditional stack interface used in LL24 Lemma8.3.3, distinct from the proved scheme compactification theorem. Locally a blowup of the intersection of r coordinate divisors pulls a new exceptional meridian back to the product of their r commuting meridians; on further boundary modifications the exponents are the nonnegative orders of the pulled-back boundary equations along the new divisor. Under the supplied stable-curve monodromy identification those images are products of commuting Dehn twists, up to conjugacy and finite-cover powers.

Hypotheses: Smooth proper DM input with toroidal normal-crossing boundary strata; stack blowup/descent supplied byR09.4/R09.5. Topology supplies local meridians, commutativity and stable-curve Dehn-twist identification; normalization or resolution alone does not prove it.

Proof plan:

1. Work on étale charts with boundary coordinate equations; use SR4 intersection blowup charts and descend.
2. In the pivot chart, x_p=y_p andx_i=y_p y_i for selectedi; around y_p=0 all selectedx_i wind once.
3. Read valuation exponents along successive exceptional divisors and compose the meridian maps.
4. Apply the topological monodromy supplier, whose proof must include the plumbing/Picard–Lefschetz calculation; LLSS23 itself citesAMO95Theorem2.2.

Prerequisites: `AlgebraicModuliForArithmeticGeometry:R09.4`, `AlgebraicModuliForArithmeticGeometry:R09.5`, `tauceti:TauCetiRoadmap/StableReduction#layer-4-blowups-and-intersection-theory-on-arithmetic-surfaces`, `AlgebraicModuliForArithmeticGeometry:R09.7d/snc-holomorphic-charts`.

Source match: LL24, Lemma 8.3.3 proof, pp. 40–41. The source passes from ordinary to strict normal crossings by boundary-stratum blowups. Scheme chart calculations are planned here; stack descent and stable-curve monodromy remain separate supplier obligations. LLSS23, Lemma 2.1.1 and proof, author PDF pp.7–8. Exceptional-boundary inertia is generated by a Dehn multitwist; the referenced original plumbing input remains a gap in the topological supplier.

Acceptance: Two transverse coordinate divisors give meridian(1, 1), not merely one old meridian. OrdinaryNC need not be strictNC; the distinction survives stack descent. Boundary monodromy is a supplier claim, not inferred from SNC geometry.

Lean prototype: Global geometric signature omitted until the requested supplier carriers exist.

## Supplier requests and remaining refinements

- `tauceti:TauCetiRoadmap/StableReduction#layer-4-blowups-and-intersection-theory-on-arithmetic-surfaces`: General relative Rees blowup of finite-type quasi-coherent ideals, universal property, projectivity, affine pivot charts, exceptional invertibility, strict-transform saturation and flat base change. Current newer TauCeti affineBlowupι is only an affine-chart implementation and is not in the pin. Consumers: `AlgebraicModuliForArithmeticGeometry:R09.7a/snc-pair`, `AlgebraicModuliForArithmeticGeometry:R09.7a/transforms`, `AlgebraicModuliForArithmeticGeometry:R09.7a/transform-base-change`, `AlgebraicModuliForArithmeticGeometry:R09.7a/cartier-separation`, `AlgebraicModuliForArithmeticGeometry:R09.7c/monomial-centres`, `AlgebraicModuliForArithmeticGeometry:R09.7c/global-permissibility`, `AlgebraicModuliForArithmeticGeometry:R09.7c/finite-termination`, `AlgebraicModuliForArithmeticGeometry:R09.7c/local-isomorphism-functoriality`, `AlgebraicModuliForArithmeticGeometry:R09.7d/boundary-stratum-refinement`.

- `tauceti:TauCetiRoadmap/StableReduction#layer-2-coherent-curve-theory-duality-and-positivity`: Effective Cartier divisors and their local regular sections on arbitrary schemes, invertible ideal/sheaf arithmetic, pullback of the two original regular sections to their blowup, relative Proj O(1), and projectivity composition. Do not restrict the Cartier-separation use to integral schemes or curves. Consumers: `AlgebraicModuliForArithmeticGeometry:R09.7a/snc-pair`, `AlgebraicModuliForArithmeticGeometry:R09.7a/cartier-separation`.

- `AlgebraicModuliForArithmeticGeometry:R09.1`: Reduced projective closure of a chosen quasi-projective finite-type embedding, with dense-open factorization, coherent closed-complement ideal, and finite/projective composition. Needed in this part; general parameter-space theory remains inR09.1. Consumers: `AlgebraicModuliForArithmeticGeometry:R09.7d/boundary-ideal`, `AlgebraicModuliForArithmeticGeometry:R09.7d/good-compactification`, `AlgebraicModuliForArithmeticGeometry:R09.7d/complex-realization`.

- `AlgebraicModuliForArithmeticGeometry:R09.4`: Algebraicity and smooth separated DM property ofM_g, n for2g−2+n>0; proper stable-pointed compactification with ordinary NC boundary; finite étale covers by smooth quasi-projective schemes; étale descent for boundary-stratum blowups. Tameness, properness and separatedness must be proved separately. Consumers: `AlgebraicModuliForArithmeticGeometry:R09.7d/finite-cover-compactification`, `AlgebraicModuliForArithmeticGeometry:R09.7d/boundary-stratum-refinement`.

- `AlgebraicModuliForArithmeticGeometry:R09.5`: Representable scheme models/coarse-space or level-cover compactifications sufficient to normalize the finite étale scheme cover, with correct dense-open identification and projectivity; do not treat a coarse-space map as automatically étale. Consumers: `AlgebraicModuliForArithmeticGeometry:R09.7d/finite-cover-compactification`, `AlgebraicModuliForArithmeticGeometry:R09.7d/boundary-stratum-refinement`.


**Global geometric Lean carriers and signatures.** The pinned build has no full SNC/marked-presentation/legal-test/resolution tower/relative blowup/analytic realization interface. Companion signatures project to explicit local algebra, data or coordinate domains; the exact omitted conditions are recorded per node. Before packaging, replace these projections and omitted API/test comments with global declarations and examples as the supplier carriers become expressible. Elaboration of the projections is not evidence of geometric formalization.


**Stack boundary refinement and finite-cover descent.** The scheme compactification assembly is planned. The stack application ofLL24 Lemma8.3.3 additionally needs theR09.4/R09.5 requests:normalization in a scheme model, descent of the boundary-stratum blowups, and a proof that branch separation gives globally smooth distinct boundary components. It is not supplied by intrinsic scheme resolution alone.


**Stable-curve boundary monodromy supplier.** LL24 Lemma8.3.3 andLLSS23 Lemma2.1.1 were read. The latter points toAMO95Theorem2.2 for the original stable-curve plumbing/Dehn-twist identification; that source proof has not been read. MappingClassGroupsAndCanonicalRepresentations is currently a design job with no valid layer id, so no invented prerequisite is used. Its future plan must supply local inertia/Picard–Lefschetz, commuting twists and conjugacy/cover powers; only the local coordinate winding calculation is planned here.

## Ownership and current upstream notes

**Current main differs from the pin.** Read-only currentTauCeti commit a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039 includes Ideal.affineBlowup and AlgebraicGeometry.affineBlowupι with opensRange_affineBlowupι, iSup_opensRange_affineBlowupι and affineBlowupι_toSpecZero in AlgebraicGeometry/Blowup/AffineCharts.lean. These are newer than the recorded pin. SR4 should reuse them; they do not provide global marked transforms, SNC centres or the invariant.

**Elementary analytic realization moves down.** This roadmap is tier4; ComplexComparisonPartII is tier5. R09.7d owns the elementary reduced-complex-point realization and SNC holomorphic charts needed here. Retarget the corresponding C0 prerequisite to complex-realization/snc-holomorphic-charts; leave coherent GAGA, proper GAGA, Chow and deRham comparison inC0–C5. No upward prerequisite is introduced.

**Good compactification geometry moves down.** HodgeStructuresPartII:H.5/boundary-monodromy-data currently packages good compactification geometry whileH.5 andH.7 depend onR09.7d. The geometric carrier is owned by good-compactification here. RetargetH.5 to that node; H.5 retains monodromy andH.7 retains buffered charts, sectors and BKT period-map analysis. This avoids a compactification-to-Hodge-to-compactification cycle.

**Current roadmap reuse screen.** Current StableReduction README/Suggested were read for general blowups and relative coherent/Cartier/projective interfaces, and AlgebraicVectorBundles for coherent tensor/dual/invertible-sheaf operations. The nine post-snapshot roadmaps were screened:AlgebraicVectorBundles, DifferentialGeometry, IntegralLattices, LocalGaloisGroups, OperatorTheory, OrthogonalSpinGroups, PeripheralActions, ProfiniteArithmetic, RealAlgebraicGeometry; the relevant smooth/analytic material in DifferentialGeometry and RealAlgebraicGeometry was inspected. None supplies the history-sensitive characteristic-zero invariant or these marked-ideal transforms. OperatorTheory has no Suggested file in the current checkout. The current toric complex boundary normal form is a special toric result, not a general SNC compactification supplier.

## Sources and access

All source statements and proof plans above are in original wording and organized by mathematical targets. No source excerpt or section-by-section paper summary is stored. No uncleared book was used. BM97 uses the full published paper; the older 30-page arXiv announcement cannot substantiate the later proofs.

- **BM97**: Edward Bierstone and Pierre D. Milman, [Canonical desingularization in characteristic zero by blowing up the maximum strata of a local invariant](https://www.mahalex.net/teaching/seminars/gabber/Bierstone-Milman%20Canonical%20desingularization%20in%20characteristic%20zero.pdf), Inventiones Mathematicae128 (1997), 207–302; full 96-page published version. Read: §§1, 3–9, pp. 207–225, 230–283; §§10–13, pp. 283–298; Theorems 11.14, 12.2, 12.4, 13.2; Examples 2.1–2.3, pp. 226–229; principalization Theorem 1.10, p. 216. SHA-256: `f01ebbb0591fa62f9b65c16ab54f35e7409cf4fb0abd1f01bf3bf9b59d87ecaf`.

- **BP26**: George Boxer and Vincent Pilloni, [Higher Hida theory for Siegel modular forms](https://www.ma.imperial.ac.uk/~gboxer/higherhidaSiegel.pdf), Author PDF accessed 2026-10-09. Read: §4.1.10, Proposition-construction4.1.11, p. 42. SHA-256: `b97084726de7a30645a7e154a0bd68de86bdda00d36ead35c5e248fde14662ee`.

- **LL24**: Aaron Landesman and Daniel Litt, [Canonical representations of surface groups](https://arxiv.org/pdf/2205.15352v4), arXiv2205.15352v4. Read: Lemma 8.3.3 and proof, pp. 40–41; Proposition 8.3.2, p. 40. SHA-256: `4cb511ba40675aa6899b351f2ee27eb9487b4a21f65ec8000c1f2cc1a5107ceb`.

- **BKT20**: Benjamin Bakker, Bruno Klingler and Jacob Tsimerman, [Tame topology of arithmetic quotients and algebraicity of Hodge loci](https://benjamin-bakker.github.io/DefArith.pdf), Author preprint of JAMS33 (2020), 917–939. Read: §4.1 and Theorem 4.1, preprint p. 13; compactification used as input. SHA-256: `b559c652490eb54595e86ec063945d016dd104949a91f9d6b4616cc4e25b8c8e`.

- **SR**: Tau Ceti roadmap contributors, [Stable reduction of curves](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/StableReduction), Current read-only TauCetiRoadmap main inspected2026-10-09. Read: Layer 2 coherent sheaves, relative Proj and Cartier interfaces; Layer 4 general blowups, strict transforms and flat base change; arithmetic-surface specialization.

- **BM89**: Edward Bierstone and Pierre D. Milman, [Uniformization of analytic spaces](https://www.researchgate.net/publication/255647609_Uniformization_of_Analytic_Spaces), Journal of the American Mathematical Society2 (1989), 801–836. Read: Theorem 5.2.1 and Corollary 5.2.2 with proof, pp. 820–821; primary paper full text read through ResearchGate because the AMS PDF returned403.

- **SERRE56**: Jean-Pierre Serre, [Géométrie algébrique et géométrie analytique](https://www.numdam.org/article/AIF_1956__6__1_0.pdf), Annales de l’Institut Fourier6 (1956), 1–42. Read: §1nos.1–2, pp. 3–5; §2no. 5, Lemma 1 and Proposition 2, pp. 7–9; no. 6, pp. 9–11; no. 7Proposition6, p. 12. SHA-256: `9898f985dd6932496e26450bfe0beca8655a937032f545b97cebd88d1bc8eb98`.

- **LLSS23**: Wanlin Li, Daniel Litt, Nick Salter and Padmavathi Srinivasan, [Surface bundles and the section conjecture](https://nsalter.science.nd.edu/research/sectconj.pdf), Author PDF of Mathematische Annalen386 (2023), 1057–1116. Read: §2.1, Lemma 2.1.1 and its proof, author PDFpp.6–8. SHA-256: `861d5317374d0cc7184d42afb21a4497dddae85502cebab68b66112fdd5dab44`.

## Validation

The handoff records the final structural check and Lean elaboration results. Review should examine the exact test classes, Hilbert–Samuel embedding normalization, old exceptional history, minimal monomial centres and the conditional stack interface. Compilation checks only the explicitly retained projections; global geometric theorem and API refinements remain listed above.
