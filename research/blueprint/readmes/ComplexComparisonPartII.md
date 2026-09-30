# Complex comparison: partial interface repair

Partial source and interface repair for FIX-RT-AREA-algebraicgeometry. It corrects GAGA scope, separates additive sheaf–singular comparison from finite coefficients, and imports affine-curve models. Requests and gaps are explicit; this is neither a complete blueprint nor an applied atlas restructuring.

All declarations below are plans. Every stage remains partial, and every implementation status is unchecked. Source hashes, precise passages and baseline evidence are recorded in the companion packet.

## Analytification of complex schemes

`ComplexComparisonPartII:C0/repair-analytification`

For a C-scheme X locally of finite type, construct an analytic space X^an and a local C-ringed-space morphism phi_X : X^an → X representing T ↦ Hom_C(T, X) on complex analytic spaces. This representation specifies a functor, without imposing reducedness on X.

Proof obligations:

- Use the analytic affine line and finite products to represent affine space.
- For an affine presentation X in affine space, take the analytic closed subspace defined by the extended coherent ideal; retain the quotient sheaf, including nilpotents.
- Restrict to algebraic opens and glue affine presentations using the representing property.
- Define the map on morphisms by the representing property; verify the functor and finite-limit maps. The analytic foundation and coherence facts used in these steps are unresolved inputs, not baseline assertions.

API:

- `Analytification.map`: For f : X → Y, define f^an : X^an → Y^an with phi_Y ∘ f^an = f ∘ phi_X; map_id and map_comp follow from uniqueness.
- `Analytification.homEquiv`: Naturally in analytic T, Hom(T, X^an) ≅ Hom_C(T, X) as locally C-ringed spaces.
- `Analytification.closedSubspace`: For a coherent closed ideal I of X, analytification of V(I) has structure sheaf O_(X^an)/I O_(X^an), including nilpotents.
- `Analytification.fiberProductIso`: (X ×_Z Y)^an ≅ X^an ×_(Z^an) Y^an, naturally in the finite-type complex diagrams.

Tests:

- `Analytification.affineLine`: The analytic affine line has carrier C and its holomorphic structure sheaf.
- `Analytification.dualNumbers`: Analytification of Spec C[e]/(e^2) has local ring C[e]/(e^2).
- `Analytification.emptyClosedSubspace`: The unit ideal gives the empty analytic closed subspace; the zero ideal preserves the original scheme analytification.

Prerequisites: `mathlib:AlgebraicGeometry.LocallyRingedSpace`.

## Faithfully flat analytification at closed points

`ComplexComparisonPartII:C0/repair-local-faithful-flatness`

For X locally of finite type over C and x in X^an, O_(X,phi_X(x)) → O_(X^an,x) is a local faithfully flat homomorphism and induces an isomorphism on maximal-ideal completions.

Proof obligations:

- Use the polynomial-to-convergent local comparison for affine space.
- Pass to closed quotient ideals, then affine opens, as in 1.1.
- Apply the Noetherian completion criterion to obtain flatness; the local map is faithfully flat. The convergent-ring and completion criteria are recorded gaps.

Prerequisites: `ComplexComparisonPartII:C0/repair-analytification`.

## Coherent analytification functor

`ComplexComparisonPartII:C0/repair-coherent-pullback`

For X locally of finite type over C, send a coherent O_X-module F to phi_X^*F = O_(X^an) tensor_(phi_X^(-1)O_X) phi_X^(-1)F, and send a module map to its induced pullback map. The result is coherent.

Proof obligations:

- Use the sheaf-module inverse-image and tensor interfaces on the locally ringed morphism.
- Pull back a local finite presentation and use coherence of O_(X^an).
- Obtain identity and composition laws from module pullback; local-ring flatness proves exactness in the separate node.

API:

- `CoherentAnalytification.obj`: Object map is phi_X^*F with its O_(X^an)-module structure.
- `CoherentAnalytification.map`: Maps pull back through the same module functor; identity and composition are preserved.
- `CoherentAnalytification.tensorIso`: (F tensor G)^an ≅ F^an tensor G^an.
- `CoherentAnalytification.idealQuotientIso`: (O_X/I)^an ≅ O_(X^an)/I O_(X^an) for coherent I.

Tests:

- `CoherentAnalytification.structureSheaf`: O_X analytifies to O_(X^an).
- `CoherentAnalytification.freeModule`: O_X^r analytifies to O_(X^an)^r, including r=0.
- `CoherentAnalytification.dualNumberQuotient`: The quotient by e^2 in the affine-line model yields the length-two analytic local module.

Prerequisites: `ComplexComparisonPartII:C0/repair-analytification`.

## Exact and conservative coherent analytification

`ComplexComparisonPartII:C0/repair-exact-faithful-pullback`

For X locally of finite type over C, coherent analytification is exact and faithful and reflects isomorphisms.

Proof obligations:

- Exactness follows stalkwise from flatness.
- If F^an=0, faithful flatness gives zero stalks at closed points; a coherent support on a Jacobson scheme with no closed point is empty.
- Apply exactness to kernels, cokernels and images to deduce faithfulness and reflection of isomorphisms. The Jacobson/coherent-support criterion is a recorded input.

Prerequisites: `ComplexComparisonPartII:C0/repair-coherent-pullback`, `ComplexComparisonPartII:C0/repair-local-faithful-flatness`.

## Relative coherent comparison map

`ComplexComparisonPartII:C3/repair-higher-image-comparison-map`

For f : X → Y between C-schemes locally of finite type, coherent F and q ≥ 0, construct theta^q_(f,F) : (R^q f_*F)^an → R^q f^an_*F^an whenever the coherent higher-image source is defined. It is the map induced by F → phi_X,*F^an and the derived comparison of the commuting ringed-space square.

Proof obligations:

- Use the adjunction unit F → phi_X,*F^an and the commuting analytification square.
- Construct the comparison of higher images and its edge transformation, then pull back to Y^an.
- Prove naturality by naturality of the unit and derived comparison, rather than identifying groups merely by dimension. The required derived-comparison construction is a gap.

API:

- `CoherentComparison.map`: Degree-q component is theta^q_(f,F) with the stated coherent source and analytic target.
- `CoherentComparison.naturality`: For a coherent map F → G, the square with theta and the two induced higher-image maps commutes.
- `CoherentComparison.degreeZero`: Degree zero is the adjunction comparison (f_*F)^an → f^an_*F^an.
- `CoherentComparison.composition`: For composable proper maps the comparison agrees with their Leray comparison diagram; no unrestricted base-change is asserted.

Tests:

- `CoherentComparison.identity`: For f=id, theta^0 is the identity under canonical identifications.
- `CoherentComparison.dualNumberPoint`: For the proper dual-number point over Spec C and F=O, theta^0 identifies both length-two C-algebras.
- `CoherentComparison.projectiveTwist`: For P^r_C → Spec C and F=O(n), theta is the named map between the algebraic and analytic twist cohomology groups.

Prerequisites: `ComplexComparisonPartII:C0/repair-coherent-pullback`, `mathlib:CategoryTheory.Sheaf.H`.

## Relative proper coherent GAGA

`ComplexComparisonPartII:C3/repair-relative-proper-gaga`

For proper f : X → Y of C-schemes locally of finite type and coherent F on X, theta^q_(f,F) is an isomorphism for every q ≥ 0. X and Y need not be reduced and f need not be projective.

Proof obligations:

- Use C2 to establish the relative projective comparison by projective twists over local analytic base charts.
- Use R09.2–R09.3 for a projective Chow cover g : X′ → X and the coherent devissage criterion.
- Choose a sufficiently high relative twist on X′, so higher R^p g_* vanish and g_*O_(X′)(n) has the required nonzero generic stalks.
- Compare the algebraic and analytic Leray diagrams for f∘g and deduce the proper case by devissage. Serre vanishing, Chow cover, devissage and Leray are requested inputs, not established by this packet.

Prerequisites: `ComplexComparisonPartII:C3/repair-higher-image-comparison-map`, `ComplexComparisonPartII:C2`, `AlgebraicModuliForArithmeticGeometry:R09.1`, `AlgebraicModuliForArithmeticGeometry:R09.2`, `AlgebraicModuliForArithmeticGeometry:R09.3`.

## Full faithfulness for proper coherent modules

`ComplexComparisonPartII:C3/repair-proper-coherent-full-faithfulness`

For a proper C-scheme X and coherent O_X-modules F,G, the natural map Hom_(O_X)(F,G) → Hom_(O_(X^an))(F^an,G^an) is a bijection.

Proof obligations:

- Use coherence and analytification compatibility of the finite-presentation sheaf Hom.
- Apply the degree-zero proper cohomology comparison to sheaf Hom. Its coherence and Hom comparison remain C0 inputs.

Prerequisites: `ComplexComparisonPartII:C3/repair-relative-proper-gaga`, `ComplexComparisonPartII:C0/repair-coherent-pullback`.

## Algebraization of proper coherent modules

`ComplexComparisonPartII:C3/repair-proper-coherent-essential-surjectivity`

For a proper C-scheme X and coherent analytic O_(X^an)-module G, there is a coherent algebraic O_X-module F and an isomorphism F^an ≅ G.

Proof obligations:

- Use the projective essential-surjectivity theorem from C2 on a projective Chow cover.
- Use Noetherian induction on the proper closed locus where the cover is not an isomorphism.
- Algebraize the coherent kernels and cokernels supported on that locus.
- Use the local Ext comparison, the local-to-global Ext spectral sequence and proper cohomology comparison to algebraize the extension, then its coherent cokernel. These Ext/devissage inputs remain gaps.

Prerequisites: `ComplexComparisonPartII:C3/repair-relative-proper-gaga`, `ComplexComparisonPartII:C3/repair-proper-coherent-full-faithfulness`, `ComplexComparisonPartII:C2`, `AlgebraicModuliForArithmeticGeometry:R09.2`, `AlgebraicModuliForArithmeticGeometry:R09.3`.

## Algebraicity of maps between proper schemes

`ComplexComparisonPartII:C4/repair-proper-morphism-algebraicity`

For proper C-schemes X and Y, Hom_C(X,Y) → Hom_an(X^an,Y^an) is a bijection.

Proof obligations:

- For an analytic map, take its closed analytic graph in (X×Y)^an, using that Y^an is separated.
- Algebraize its coherent ideal by proper coherent GAGA on X×Y, preserving the closed subscheme structure.
- Use the analytification criterion for an algebraic projection to be an isomorphism (SGA 1 XII 3.2), and obtain the unique algebraic map. The graph/coherent-ideal and 3.2 criteria still need decomposition.

Prerequisites: `ComplexComparisonPartII:C0/repair-analytification`, `ComplexComparisonPartII:C3/repair-proper-coherent-essential-surjectivity`, `ComplexComparisonPartII:C3/repair-proper-coherent-full-faithfulness`.

## Affine curve in its projective model

`ComplexComparisonPartII:C4/repair-affine-curve-completion-interface`

For a smooth connected affine curve U of finite type over C, the regular projective model of C(U) from AlgebraicCurves Layer 12 contains U as an open subscheme with finite complement; the model is smooth over C.

Proof obligations:

- Import the unique regular projective function-field model from Layer 12B–12C.
- Use Layer 6 holomorphy rings and regular curve local rings to construct the open immersion inducing identity on the function field.
- Show the proper closed complement has dimension zero and is finite; smoothness follows from regularity over the perfect field C. The immersion and finiteness arguments remain to be supplied through the request.

Prerequisites: .

## Sheaf and singular cohomology comparison

`ComplexComparisonPartII:C5/repair-sheaf-singular-comparison`

For a semi-locally contractible topological space T, an abelian group A and q ≥ 0, sheaf cohomology H^q(T,constant A) and singular cohomology H^q_sing(T;A) are naturally additively isomorphic. Semi-local contractibility means every open U admits an open cover whose inclusions into U are nullhomotopic. There is no paracompactness hypothesis in this theorem.

Proof obligations:

- Import singular cochains, homotopies and cohomology from AlgebraicTopology Stage 6.
- Use Sella’s complex formed from nesting-controlled small cochains, and the proof that it is a sheaf (Step 1).
- Prove the small-chain quasi-isomorphisms and use Lemma 0.1 to obtain a flasque resolution of the constant sheaf.
- Apply the pinned flasque acyclicity result and the comparison from an acyclic resolution to Ext-defined sheaf cohomology.
- Record the nesting/small-chain and resolution-to-Ext proofs as unresolved leaves; do not replace them by naive sheafification on an arbitrary locally contractible space.

Prerequisites: `mathlib:CategoryTheory.Sheaf.H`, `tauceti:TauCeti.Topology.subsingleton_H_succ_of_isFlasque`.

## Proper algebraic de Rham comparison

`ComplexComparisonPartII:C5/repair-proper-de-rham-betti`

For smooth proper X over C and q ≥ 0, the natural comparison from algebraic de Rham hypercohomology H^q(X,Omega^bullet_(X/C)) to H^q_sing(X^an;C) is an isomorphism.

Proof obligations:

- Construct the algebraic and holomorphic differential complexes and their analytification comparison; full complexes and hypercohomology are recorded gaps beyond the pinned degree-one Poincare result.
- Use C3 degreewise coherent cohomology comparison in the bounded de Rham spectral sequences.
- Use the holomorphic Poincare lemma to identify analytic hypercohomology with cohomology of the constant complex sheaf.
- Use the additive sheaf–singular comparison to obtain the claimed Betti isomorphism. Cup products, trace and the relative connection are additional unresolved compatibilities.

Prerequisites: `ComplexComparisonPartII:C3/repair-relative-proper-gaga`, `ComplexComparisonPartII:C5/repair-sheaf-singular-comparison`.

## Supplier requests

- `tauceti:TauCetiRoadmap/StableReduction#layer-2-coherent-curve-theory-duality-and-positivity`: Relative Proj and O(1); coherence of proper higher direct images in the contract’s precise scope, the projection formula and Leray maps. Proper flat cohomology-and-base-change is imported from JacobianChallenge Layer C, and must not be duplicated here. Export the generality actually required for locally finite-type complex proper maps, or record the extension explicitly.
- `AlgebraicModuliForArithmeticGeometry:R09.1`: Algebraic projective-space twists O(n), their cohomology in all degrees, Serre vanishing and generation for coherent sheaves on projective schemes over locally Noetherian bases. Import the existing relative Proj carrier; these are the algebraic inputs to analytic GAGA.
- `AlgebraicModuliForArithmeticGeometry:R09.2`: The projective Chow cover and the coherent devissage criterion used in SGA 1 XII Theorem 4.2 for a proper scheme over a locally finite-type complex base.
- `AlgebraicModuliForArithmeticGeometry:R09.3`: The stated Chow/descent interface, and effective descent of coherent sheaves through etale presentations for proper algebraic spaces; the source scheme theorem does not establish this extension.
- `tauceti:TauCetiRoadmap/AlgebraicCurves#layer-12-the-dictionary--function-fields--curves-and-the-comparison-contracts`: Import the unique regular projective model of the function field of a smooth integral affine complex curve. Together with Layer 6 holomorphy rings provide its open immersion with finite complement, and transport to the smooth model over the perfect field C; do not normalize a second closure in C4.
- `tauceti:TauCetiRoadmap/AlgebraicCurves#layer-6-extensions-of-function-fields`: The holomorphy-ring and valuation/local-ring dictionary identifying the given affine curve with an open of its Layer 12 regular projective function-field model.
- `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-6-cohomology-products-and-manifold-duality`: Singular cochain complexes for abelian coefficients, induced coefficient and pullback maps, small-chain/homotopy interfaces and cohomology. C5 owns the sheaf-resolution bridge; Stage 6 supplies cohomology products to a separately proved product-compatible bridge.

## Remaining proof leaves

- **Upstream stage prerequisite checker defect:** check_blueprint.py tests the baseline-name pattern before known-stage membership and misclassifies valid tauceti:TauCetiRoadmap/... ids. To retain a checker-valid partial checkpoint, these supplier ids appear in requests rather than prerequisites. This does not meet the final cross-roadmap closure rule: restore the exact omitted pairs recorded in the handoff once the checker is repaired. No upstream stage is represented as a baseline declaration.
- **Tracked analytic-space supplier:** PR196 is an external proposal, not a stage or baseline implementation. Integrate its analytic local models, nonreduced quotients, gluing, fibre products and finite-type scheme analytification once, with supplier edges to C0, ShimuraVarieties V2, ShimuraCompactifications C2, PELModuli M3 and ModularCurvesPartII R12.3. Do not invent an accepted stage id.
- **Tracked holomorphic bundle supplier:** PR279 Milestones 5–7 require tracked supplier stages for analytic open gluing, topology/proper maps and holomorphic vector bundles. C0 consumes Milestone 7; AnalyticToricGeometry Layer 3 and ShimuraVarieties V1 consume gluing. No second atlas/gluing carrier is planned in this packet.
- **Analytic local algebra and coherent-module API:** Convergent rather than formal Weierstrass division, Noetherian coherent local rings, completion flatness criteria, sheaf-module pullback/tensor, coherent kernels/cokernels and finite-presentation Hom compatibility still require source decomposition. Smooth or one-variable holomorphic function sheaves do not supply nonreduced analytic spaces.
- **Jacobson support criterion:** Verify the exact pinned closed-point/coherent-support lemmas or decompose the Jacobson argument used by SGA 1 XII Proposition 1.3.1.
- **Relative projective GAGA and derived maps:** C1–C2 analytic O(n), Stein vanishing and generation, projective GAGA and the relative projective comparison still need proof-sized nodes, together with derived adjunction/edge maps and Leray diagrams.
- **Proper coherent devissage and Ext:** Decompose SGA 1 XII Theorem 4.4’s Noetherian induction, support restriction, coherent kernel/cokernel algebraization, local Ext comparison and local-to-global Ext spectral sequence.
- **Graph reflection and broader targets:** Decompose SGA 1 XII 3.2 and coherent graph algebraization. Corollary 4.5 supplies proper schemes as both source and target; a separated nonproper target, a relative family and proper algebraic spaces need separate proofs, not a widened citation.
- **Connected punctured Riemann surface:** After the algebraic completion import, prove analytic connectedness of the proper model via GAGA and idempotents; then prove that removing finitely many points from a connected Riemann surface preserves connectedness. Existing Euclidean chart connectedness alone is insufficient.
- **Nesting resolution and Ext comparison:** Sella pp. 2–8 were read for the theorem, Lemma 0.1, the naive-sheafification counterexample and Step 1. The small-chain proof in Steps 2–3 has not been fully decomposed. Add proof-sized nodes for nestings, face-controlled chains, chain homotopy equivalence, the flasque resolution and its comparison to the existing Ext-defined Sheaf.H.
- **Product-compatible Betti bridge:** The additive source theorem is insufficient for cup products. Supply a compatible cochain product and chain comparison with AlgebraicTopology Stage 6 products, as well as Z→Q→C and pullback naturality.
- **Differential complexes and hypercohomology:** Build the full differential on Kahler exterior powers, holomorphic Poincare in all degrees, hypercohomology and its bounded spectral-sequence comparison. Trace and nonproper logarithmic comparisons are separate C5 obligations.
- **Relative Gauss–Manin comparison:** For proper smooth f with smooth complex source and base, source and decompose Ehresmann local triviality, the relative holomorphic Poincare lemma resolving f^(-1)O_S, relative hypercohomology and base-change criteria, and the Gauss–Manin connection. A singular base needs a further argument. Integral Betti stalks are finitely generated and complex stalks finite dimensional; arbitrary A must not be assigned those finiteness properties.
- **Geometric Hodge theory owner:** Finding 4 requires a single tracked owner for geometric Hodge decomposition/degeneration and the relative variation theorem after C5. Reconcile the Qian extraction and proposed DegeneratingHodgeStructures route. Abstract HodgeStructures supplies carriers, not geometric Hodge theorems. No unverified new theorem or accepted owner is asserted here.
