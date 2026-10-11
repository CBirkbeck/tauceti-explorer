# Analytic toric geometry, Part II: nonarchimedean models and perfectoid approximation

This roadmap extends the complex toric geometry of the parent to integral toric line bundles, nonarchimedean unit models, perfectoid power towers and algebraic approximation over the tilted field. Its endpoints are the five comparisons of Scholze Theorem 8.5, Proposition 8.6 on prime-to-p torsion cohomology, Proposition 8.7 on hypersurfaces and Corollary 8.8 on set-theoretic complete intersections. The finite fan is part of the input. No classification of all toric varieties by fans, and hence no separate Sumihiro development, is needed by these targets.

The parent owns lattices, rational cones, finite fans, primitive rays, Gordan finite generation, dual semigroups and the complex fan scheme. Current Tau Ceti has more of these than the pinned atlas snapshot. C0 of ShimuraCompactifications owns arbitrary-ring affine toric charts, their face maps and finite fan gluing. They are imported here, including the nonnoetherian valuation-ring case; only the toric divisor modules and their nonarchimedean/perfectoid applications are new. AdicSpacesPartII owns formal completion, generic fibres, analytification and general section-valuation domains. PerfectoidSpaces owns general perfected cone algebras, tilting, almost purity, tilde-limits and the homogeneous approximation induction. SchemeAndStackFoundations owns general intersection and scheme-cohomology machinery. This roadmap specializes those inputs, with exact supplier requests where a sufficiently general node is absent.

Fix a finite-rank lattice N and its dual M, and a nonempty finite fan Σ on the parent carrier. All rays use primitive generators. Empty fans allowed by the native carrier are excluded from the nonempty geometric targets; the rank-zero nonempty fan is admitted. Coefficient rings may have nilpotents and need not be noetherian. Weil-divisor terminology is used only on normal field fibres. Cartier data over arbitrary rings use monomial modules, and all invariant divisors are Cartier only when the fan is regular. The sign is div(χ^u)=Σ_i〈u,v_i〉D_i and section weights satisfy 〈u,v_i〉≥−a_i.

K has a nontrivial complete rank-one nonarchimedean valuation. Choose a pseudouniformizer ϖ. For perfectoid comparisons its residue characteristic is the prime p, and ϖ=(ϖ♭)♯ is chosen with ϖ^p dividing p. Completed monoid algebras use the coefficient Gauss norm and an explicit integral plus ring. Completed monomial modules are c₀ sums, never arbitrary products. Valuations at adic points can have higher rank; rational threshold c=a/b means the inequality raised to the bth power, not a choice of real-valued point valuation.

Write AΣ,K for the formal-model generic fibre and (XΣ,K)^an for full analytification. For the positive ray, these are respectively the unit disc and the full affine line. They agree for complete fans, by properness, with no projectivity assumption. Formal face opens become rational unit localizations. Write TΣ,K for the perfectoid toric space; π is a continuous map and a geometric morphism of étale topoi, without a cross-characteristic ringed-space morphism. Sharp is multiplicative, not additive.

The approximation outputs are algebraic zero loci of line-bundle sections over any specified dense subfield of K♭. The complete-intersection theorem assumes a smooth projective ambient fan and exactly codimension-many defining hypersurfaces. Nonemptiness follows from positive refined degree; connectedness and geometric irreducibility are not part of its conclusion. DeligneWeightsAndPurityPartII consumes π, the torsion comparison and the approximation theorem. MotivesAndAlgebraicCyclesPartII consumes the geometric neighbourhood construction. These consumers are never prerequisites. Component selection and field extension for a geometrically irreducible weight-monodromy input belong with its consumer.

The parent has two distinct continuations: the nonarchimedean and perfectoid geometry here, and the arithmetic toroidal compactifications of ShimuraCompactifications. Both import the same finite-fan algebraic supplier; the subtitles distinguish their directions.

## Target layers

## Layer NT.0: Invariant divisors and integral sections

Import the general-ring fan scheme from C0 and the lattice/cone/fan data from the parent. Construct invariant ray divisors in the native Weil carrier, their weight sets and arbitrary-ring character modules. Prove invariant divisor representatives, the coefficient-field-independent character presentation of divisor classes, and build the integral Cartier models for regular fans. Give complete APIs and monomial tests, with singular divisorial sheaves kept distinct from line bundles.

### Invariant toric divisors

**Target `AnalyticToricGeometryPartII:NT.0/invariant-divisor` (construction).** On X_{Σ,k} over a field k, let D_i be the reduced closure of the codimension-one orbit in U_{ρ_i}=A¹×G_m^{rank N−1}. Construct the injective homomorphism from integer ray coefficients to the native scheme Weil divisors, a↦Σ a_iD_i, and identify its image with invariant divisors. Over an arbitrary ring A, use the same monomial orbit ideals and Cartier data when available, without asserting that X_{Σ,A} is normal or that these are prime Weil divisors.

**Named signature.** `TauCeti.Toric.Nonarchimedean.invariantDivisor`.

**Hypotheses.** N is a finite-rank free Z-module, M=Hom_Z(N,Z), and Σ is a nonempty finite rational strongly convex fan in N_R, on the parent carrier. The distinct rays ρ_i of Σ have primitive generators v_i; D=Σ_i a_i D_i uses the sign convention div(χ^u)=Σ_i <u,v_i>D_i. k is a field for the Weil-divisor interpretation.

**Construction or proof.** Import X_{Σ,A}, orbit ideals, torus action and base change from C0. Use the primitive ray chart to identify its boundary coordinate; take its closure and codimension-one generic point. Map ray Finsupp coefficients to the native SchemeWeilDivisor by the injective ray-point map; do not reconstruct the generic divisor carrier.

**Inputs.** `ShimuraCompactifications:C0/arbitrary-ring-toric-charts`, `tauceti:TauCeti.Toric.primitiveGenerator`, `tauceti:TauCeti.AlgebraicGeometry.SchemeWeilDivisor`.

**Planning API.**

- `invariantDivisor` (constructor): Map a finitely supported integer ray coefficient function to the sum of the associated native point divisors.
- `invariantDivisor_coeff` (simp): The coefficient at D_i is a_i, and at a codimension-one point outside the ray boundary it is zero.
- `invariantDivisor_injective` (extensionality): Two invariant divisors agree exactly when their ray coefficients agree.
- `invariantDivisor_principal` (compatibility): For u∈M the character divisor has coefficient <u,v_i> at ray i.

**Discriminating tests.**

- `invariantDivisor_p1` (computation): For the P¹ fan with rays +1 and −1, the character t has divisor D_+−D_−.
- `invariantDivisor_torus` (degenerate): For the zero-cone fan there are no boundary rays and the invariant divisor group is zero.
- `invariantDivisor_multiplicity` (non-example): On P¹, 2D_+ differs from D_+; the coefficient is 2, not a reduced support indicator.

**Uses.** NT.0 section formula and NT.5 hypersurface approximation: Invariant coefficients transport line bundles across coefficient fields without choosing equations twice.

**Acceptance.** All ray identifications agree on overlaps; coefficients retain multiplicities.

**Source.** SCH12, §8, Definition/Proposition 8.4, p. 304. The ray boundary gives an invariant prime divisor over a field and the invariant divisor group is freely generated by these boundaries.

### Divisor character weights

**Target `AnalyticToricGeometryPartII:NT.0/section-weights` (definition).** Define W_Σ(D)={u∈M : <u,v_i>≥−a_i for every ray i}. For a single cone σ impose only its rays, obtaining W_σ(D). Each local W_σ(D) is a module over its dual monoid P_σ=σ∨∩M under addition; no such action on the global weight set by an individual chart monoid is asserted. They need not contain zero and need not be monoids. Local Cartier data m_σ satisfy <m_σ,v_i>=−a_i on the rays of σ, so W_σ(D)=m_σ+P_σ.

**Named signature.** `TauCeti.Toric.Nonarchimedean.sectionWeights`.

**Hypotheses.** N is a finite-rank free Z-module, M=Hom_Z(N,Z), and Σ is a nonempty finite rational strongly convex fan in N_R, on the parent carrier. The distinct rays ρ_i of Σ have primitive generators v_i; D=Σ_i a_i D_i uses the sign convention div(χ^u)=Σ_i <u,v_i>D_i.

**Construction or proof.** Pair the dual lattice with each primitive ray; use finite conjunctions of integral inequalities. On a regular cone extend its primitive rays to a lattice basis to construct m_σ. Translate the inequalities by m_σ; keep the negative coefficient sign.

**Inputs.** `tauceti:TauCetiRoadmap/AnalyticToricGeometry#layer-0-the-toric-compatible-algebraic-supplier`, `AnalyticToricGeometryPartII:NT.0/invariant-divisor`.

**Planning API.**

- `sectionWeights` (constructor): The subset of M cut out by all ray inequalities for D.
- `mem_sectionWeights` (characterisation): Membership is equivalent to <u,v_i>+a_i≥0 for every i.
- `sectionWeights_principalShift` (compatibility): W(D+div χ^m)=W(D)−m.
- `sectionWeights_add` (relation): u∈W(D) and w∈W(E) imply u+w∈W(D+E).

**Discriminating tests.**

- `sectionWeights_p1` (computation): For P¹ and D=dD_−, W(D) is exactly the integers 0≤u≤d.
- `sectionWeights_negative` (non-example): For P¹ with D=−D_−, W(D) is empty.
- `sectionWeights_torus` (degenerate): For the zero-cone fan and D=0, W(D)=M, not {0}.

**Uses.** NT.0 algebraic sections; NT.2 perfected sections and divisor cone: The same inequalities index sections over A, K and K♭.

**Acceptance.** No effectivity or ampleness assumption is built into W_Σ(D).

**Source.** SCH12, §8, Definition/Proposition 8.4 and the integral-trivialization paragraph in the proof of Proposition 8.7, pp. 304, 306. The character section inequalities specify the weight set; character generators on regular cones give the integral local description.

### Monomial divisor sections

**Target `AnalyticToricGeometryPartII:NT.0/divisor-sections` (construction).** For every commutative ring A, define the A-module S_A(D)=⊕_{u∈W_Σ(D)} Aχ^u inside A[M]. On cone charts use S_{A,σ}(D) indexed by W_σ(D), with the dual-monoid action and face restrictions, and glue their associated modules. When D is Cartier these give O(D) on X_{Σ,A}; over a normal field fibre for an arbitrary invariant Weil divisor they agree with the native divisorial sheaf. Global sections identify with S_A(D). Multiplication maps S_A(D)⊗_A S_A(E)→S_A(D+E); they are not asserted isomorphisms.

**Named signature.** `TauCeti.Toric.Nonarchimedean.divisorSections`.

**Hypotheses.** N is a finite-rank free Z-module, M=Hom_Z(N,Z), and Σ is a nonempty finite rational strongly convex fan in N_R, on the parent carrier. The distinct rays ρ_i of Σ have primitive generators v_i; D=Σ_i a_i D_i uses the sign convention div(χ^u)=Σ_i <u,v_i>D_i. A is any commutative ring; Cartier is required for the line-bundle interpretation.

**Construction or proof.** Work in the native additive monoid algebra A[M], with Finsupp support in W(D). Localize the character modules along the ordinary face maps supplied by C0. Intersect the local character support conditions in A[M]; monomial independence gives exactly W_Σ(D), even for rings with nilpotents. Identify the field-fibre module with the native Weil-divisor sheaf using the character orders along D_i.

**Inputs.** `AnalyticToricGeometryPartII:NT.0/section-weights`, `ShimuraCompactifications:C0/arbitrary-ring-toric-charts`, `ShimuraCompactifications:C0/relative-face-open`, `mathlib:AddMonoidAlgebra`, `tauceti:TauCeti.AlgebraicGeometry.SchemeWeilDivisor.sheaf`.

**Planning API.**

- `divisorSections` (constructor): The support-constrained A-submodule of A[M].
- `divisorSections_monomial` (constructor): For u∈W(D), χ^u is a basis element.
- `divisorSections_coeff` (extensionality): Two sections agree iff all character coefficients agree.
- `divisorSections_baseChange` (functoriality): Coefficient change acts on each monomial coefficient and satisfies identity and composition; it induces the tensor base-change isomorphism.
- `divisorSections_mul` (structure): Convolution multiplication sends S_A(D)×S_A(E) to S_A(D+E), associatively and with the unit in S_A(0).

**Discriminating tests.**

- `divisorSections_p1` (computation): For P¹ and d≥0 the sections of O(dD_−) are free on 1,t,…,t^d, of rank d+1.
- `divisorSections_nilpotents` (compatibility): For A=k[ε]/ε² and D=0 on P¹, S_A(0)=A, including its nonzero nilpotent ε.
- `divisorSections_zeroRing` (degenerate): For the zero coefficient ring, every divisor section module is zero.

**Uses.** NT.0 integral models and NT.5 denominator clearing: Finite character expansions and arbitrary coefficient change turn a tilted finite-support expression into an algebraic section.

**Acceptance.** Arbitrary coefficient change A→B gives B⊗_A S_A(D)≅S_B(D); singular charts do not silently make O(D) invertible.

**Source.** SCH12, §8, Definition/Proposition 8.4, p. 304; proof of Proposition 8.7, p. 306. The field formula indexes characters by ray bounds; the proof uses the same toric modules over the valuation ring. The arbitrary-ring statement follows by monomial chart construction, rather than a generic Weil-divisor theorem.

### Invariant divisor representatives

**Target `AnalyticToricGeometryPartII:NT.0/invariant-representative` (theorem).** Every Weil divisor on X_{Σ,k} for a field k is linearly equivalent to an invariant divisor. In particular, on a regular fan every effective Cartier hypersurface Y has O(Y)≅O(D) for an integer invariant D and an equation f∈S_k(D) whose zero scheme is Y, with its original multiplicity.

**Named signature.** `TauCeti.Toric.Nonarchimedean.invariantDivisorRepresentative`.

**Hypotheses.** N is a finite-rank free Z-module, M=Hom_Z(N,Z), and Σ is a nonempty finite rational strongly convex fan in N_R, on the parent carrier. k is a field; regularity is required only to make all invariant divisors Cartier.

**Construction or proof.** Restrict the divisor to the dense split torus Spec k[M]. Choose a lattice basis: k[M] is a Laurent polynomial UFD, so the restricted divisor is principal. Subtract that principal divisor. Its remaining support lies in the ray boundary, giving integer coefficients D. Transport the defining section through the induced invertible-sheaf isomorphism; this does not replace the equation by its squarefree part.

**Inputs.** `AnalyticToricGeometryPartII:NT.0/invariant-divisor`, `AnalyticToricGeometryPartII:NT.0/divisor-sections`, `tauceti:TauCeti.AlgebraicGeometry.WeilDivisor.OrderSystem.ofScheme`, `SchemeAndStackFoundations:SF.0`.

**Acceptance.** The hypersurface x²=0 on an affine chart retains coefficient multiplicity two.

**Source.** SCH12, §8, Definition/Proposition 8.4 and start of proof of Proposition 8.7, pp. 304, 306. The invariant representative is recalled and then used to replace a hypersurface equation by a section in an invariant line bundle.

### Integral toric line bundles

**Target `AnalyticToricGeometryPartII:NT.0/cartier-integral-model` (construction).** For a regular fan and integer D, construct O(D) on X_{Σ,A} for every commutative ring A using local generators χ^{m_σ}, where <m_σ,v_i>=−a_i for rays in σ. On overlaps the ratio χ^{m_σ−m_τ} is a unit. Specialize A=K° and complete to obtain the tautological integral line bundle whose generic fibre is O(D). Changes of integral generator have valuation one at every generic-fibre point, since both the unit and its inverse are integral. The model, rather than the generic line bundle alone, fixes section bounds.

**Named signature.** `TauCeti.Toric.Nonarchimedean.cartierIntegralModel`.

**Hypotheses.** N is a finite-rank free Z-module, M=Hom_Z(N,Z), and Σ is a nonempty finite rational strongly convex fan in N_R, on the parent carrier. The distinct rays ρ_i of Σ have primitive generators v_i; D=Σ_i a_i D_i uses the sign convention div(χ^u)=Σ_i <u,v_i>D_i. Σ is regular (smooth over every coefficient ring); completeness means properness, and projectivity is a separate hypothesis. K is a complete nontrivially valued rank-one nonarchimedean field; K° is its valuation ring and ϖ is a chosen pseudouniformizer.

**Construction or proof.** Use the regular-cone lattice basis to solve the Cartier equations. Translate S_{A,σ}(D) by m_σ to a free rank-one A[P_σ]-module. Use ordinary face localization to verify transition units and the triple-overlap cocycle. Import admissible completion and generic-fibre functor from R2; use its section-valuation domains.

**Inputs.** `AnalyticToricGeometryPartII:NT.0/divisor-sections`, `AdicSpacesPartII:R2/admissible-formal-scheme`, `AdicSpacesPartII:R2/section-valuation-domain`.

**Planning API.**

- `cartierIntegralModel` (constructor): Build the character trivializations and their integral invertible sheaf for a Cartier divisor.
- `cartierIntegralModel_generator` (data): On σ the generator has character weight m_σ satisfying the negative coefficient equations.
- `cartierIntegralModel_transition` (relation): The overlap transition is χ^{m_σ−m_τ}; transition products telescope on triple overlaps.
- `cartierIntegralModel_baseChange` (functoriality): The sheaf and character generators commute with arbitrary coefficient change.
- `cartierIntegralModel_unitNorm` (compatibility): Integral change of frame preserves section valuation because the transition and its inverse are bounded by one.

**Discriminating tests.**

- `cartierIntegralModel_p1` (computation): For O(dD_−) on P¹, the two chart generators have weights 0 and d; the transition is t^{−d} in the first-to-second convention.
- `cartierIntegralModel_zero` (degenerate): D=0 admits weight-zero generators and the trivial integral line bundle.
- `cartierIntegralModel_rescale` (non-example): Replacing a section f by cf scales its bound by |c|; the same radius gives the same locus for |c|=1, but this is false for arbitrary c∈K×.

**Uses.** NT.5 tube basis and hypersurface approximation: Well-defined section inequalities are needed to transfer neighbourhoods across tilting.

**Acceptance.** K° is not assumed noetherian or discretely valued.

**Source.** SCH12, §8, proof of Proposition 8.7, p. 306. The approximation proof evaluates a line-bundle section by choosing integral trivializations; their ratios have valuation one.

### Toric divisor class relations

**Target `AnalyticToricGeometryPartII:NT.0/divisor-class-relations` (theorem).** For X_{Σ,k} over any field, the invariant-divisor map induces the presentation M→Z^{Σ(1)}→Cl(X_{Σ,k})→0, with the first map u↦(<u,v_i>)_i. An invariant divisor is principal exactly when its coefficient vector is the character-divisor vector of some u∈M. The first map need not be injective for an incomplete fan. Thus the presentation canonically identifies class groups across coefficient fields, using the same fan. For regular Σ it also identifies Pic with this class group. When Σ is complete and regular, a full-dimensional regular cone gives an identity minor for the character map; the quotient is free abelian, so no nonzero divisor class is killed by a positive integer.

**Named signature.** `TauCeti.Toric.Nonarchimedean.invariantDivisorClassRelations`.

**Hypotheses.** N is a finite-rank free Z-module, M=Hom_Z(N,Z), and Σ is a nonempty finite rational strongly convex fan in N_R, on the parent carrier. The distinct rays ρ_i of Σ have primitive generators v_i; D=Σ_i a_i D_i uses the sign convention div(χ^u)=Σ_i <u,v_i>D_i. k is a field; regularity is required for Pic=Cl. Completeness and regularity are both required for the asserted free quotient.

**Construction or proof.** Use the invariant-representative theorem for surjectivity onto the class group. If an invariant divisor equals div(f), then f has no torus zeros or poles. The Laurent polynomial UFD identifies f|_T as a unit aχ^u, so its ray coefficients equal <u,v_i>. The character divisor gives the converse. The resulting integer presentation uses no coefficient-field data. For regular Σ every Weil divisor is Cartier; on a complete regular fan choose a full-dimensional cone whose primitive rays form a lattice basis, making the map split with free cokernel.

**Inputs.** `AnalyticToricGeometryPartII:NT.0/invariant-representative`, `AnalyticToricGeometryPartII:NT.0/invariant-divisor`, `AnalyticToricGeometryPartII:NT.0/cartier-integral-model`, `tauceti:TauCeti.AlgebraicGeometry.WeilDivisor.OrderSystem.ofScheme`, `SchemeAndStackFoundations:SF.0`.

**Acceptance.** For P¹, Cl=Pic=Z with degree a_++a_−. A nonempty effective divisor has a nonzero class which stays nonzero over the tilted field and after multiplication by p^N. An incomplete smooth fan need not have torsion-free Pic: the two separate rays (1,0),(1,2) in Z² give cokernel Z/2.

**Source.** SCH12, §8, Definition/Proposition 8.4 and its use in Proposition 8.7, pp. 304, 306. The invariant representatives and character-divisor formula give the class presentation by the split-torus unit argument; Fulton–Sturmfels Corollary 2.4 recalls the corresponding Cartier/Picard presentation. FS94, Corollary 2.4 and proof, p. 7. Cartier character data modulo principal characters present the Picard group. The native class-group presentation is obtained by the explicit torus-unit argument stated here.

## Layer NT.1: Formal models and unit toric spaces

Construct the formal generic fibre AΣ,K using completed monoid charts and rational unit face overlaps. Identify its image in analytification and prove equality for complete fans, including nonprojective examples. Construct coefficient-linear power morphisms, compatible with all integral models and toric strata.

### Unit toric adic spaces

**Target `AnalyticToricGeometryPartII:NT.1/unit-toric-space` (construction).** Define A_{Σ,K} as the generic fibre of the ϖ-adic completion of X_{Σ,K°}. For each cone σ its affinoid chart is Spa(K⟨P_σ⟩,K°⟨P_σ⟩), where P_σ=σ∨∩M and restricted sums use the coefficient supremum norm. A face τ⊂σ is the formal localization in a monomial χ^m, m∈P_σ∩τ⊥ exposing the face, and its generic-fibre chart is the rational unit locus |χ^m|=1. Glue these charts along the fan intersections. The plus subring is explicit and agrees with the integral closure of the model ring.

**Named signature.** `TauCeti.Toric.Nonarchimedean.unitToricSpace`.

**Hypotheses.** N is a finite-rank free Z-module, M=Hom_Z(N,Z), and Σ is a nonempty finite rational strongly convex fan in N_R, on the parent carrier. K is a complete nontrivially valued rank-one nonarchimedean field; K° is its valuation ring and ϖ is a chosen pseudouniformizer.

**Construction or proof.** Import arbitrary-ring fan gluing and the ordinary algebraic face maps from C0. Complete the monoid chart K°[P_σ] ϖ-adically, then invert ϖ; Gordan finite generation supplies topological finite presentation. Use R2 generic fibres of formal opens, which are completed localizations, to obtain rational unit overlaps. Apply parent AdicSpaces gluing to the finite compatible affinoid cover.

**Inputs.** `ShimuraCompactifications:C0/arbitrary-ring-toric-charts`, `ShimuraCompactifications:C0/relative-face-open`, `tauceti:TauCetiRoadmap/AnalyticToricGeometry#layer-0-the-toric-compatible-algebraic-supplier`, `AdicSpacesPartII:R2/raynaud-generic-fibre`, `AdicSpacesPartII:R2/good-reduction-locus`.

**Planning API.**

- `unitToricSpace` (constructor): The glued adic space A_{Σ,K}, with its structure and plus sheaves.
- `unitToricSpace_chart` (projection): Each σ has its named open affinoid embedding, and these images cover A_{Σ,K}.
- `unitToricSpace_face` (compatibility): The face embedding agrees with the rational unit localization of the monoid chart.
- `unitToricSpace_baseChange` (functoriality): Complete valued-field extension gives the corresponding base change of A_{Σ,K}, preserving the chart cover and integral models.

**Discriminating tests.**

- `unitToricSpace_disc` (computation): For the positive ray fan in Z, A_{Σ,K}=Spa(K⟨t⟩,K°⟨t⟩), the closed unit disc.
- `unitToricSpace_unitTorus` (non-example): For the zero-cone fan in Z, A_{Σ,K}=Spa(K⟨t,t⁻¹⟩,K°⟨t,t⁻¹⟩) and |t|=1; it is not the full analytification of G_m.
- `unitToricSpace_p1` (compatibility): For the complete P¹ fan, the two unit discs glued along |t|=1 give the whole P¹ analytification.

**Uses.** NT.2 perfected chart tower and NT.3 comparison: This is the finite-level object in the φ-tower; incomplete fans require the integral unit space.

**Acceptance.** Do not replace a formal face overlap by the entire analytification of D(χ^m).

**Source.** SCH12, §8, paragraph following Definition/Proposition 8.4, p. 304. The adic toric object is built from completed semigroup charts as a formal generic fibre, with affine space giving the unit ball.

### Toric analytification comparison

**Target `AnalyticToricGeometryPartII:NT.1/analytification-comparison` (theorem).** The model comparison is an open embedding A_{Σ,K}→(X_{Σ,K})^{an}; its image consists of points whose valued residue-field morphism extends to X_{Σ,K°}. If Σ is complete, X_{Σ,K°} is proper over K° and this map is an isomorphism. Regularity and projectivity are unnecessary. For incomplete fans no equality with analytification is asserted.

**Named signature.** `TauCeti.Toric.Nonarchimedean.toricAnalytificationComparison`.

**Hypotheses.** N is a finite-rank free Z-module, M=Hom_Z(N,Z), and Σ is a nonempty finite rational strongly convex fan in N_R, on the parent carrier. K is a complete nontrivially valued rank-one nonarchimedean field; K° is its valuation ring and ϖ is a chosen pseudouniformizer.

**Construction or proof.** Apply R2 good-reduction-locus to the imported finite-type separated toric model. Use the complete-fan valuative properness criterion for X_{Σ,K°} supplied by C0. Properness gives all valued points an integral extension, hence surjectivity of the comparison.

**Inputs.** `AnalyticToricGeometryPartII:NT.1/unit-toric-space`, `AdicSpacesPartII:R2/good-reduction-locus`, `ShimuraCompactifications:C0/arbitrary-ring-toric-charts`, `ShimuraCompactifications:C0`.

**Acceptance.** The smooth complete nonprojective threefold of Fujino–Sato Example 4.1 satisfies this comparison. A classical point t=ϖ⁻¹ of A¹ lies in analytification and outside the unit disc.

**Source.** SCH12, §8, formal-generic-fibre paragraph, p. 304. The source identifies the formal-model generic fibre with analytification when the toric scheme is proper. FS25, Example 4.1, pp. 7–8. The displayed finite fan gives a smooth complete nonprojective threefold, a concrete test that these targets do not require projectivity.

### Toric power morphisms

**Target `AnalyticToricGeometryPartII:NT.1/power-map` (construction).** For every integer q≥1, multiplication by q on M preserves each P_σ, gives χ^u↦χ^{qu}, and glues to an endomorphism φ_q of X_{Σ,A}, its formal model and A_{Σ,K}. It commutes with coefficient change and preserves every toric stratum. Put φ=φ_p. In characteristic p this is relative Frobenius on characters with coefficients fixed; absolute Frobenius additionally acts on coefficients.

**Named signature.** `TauCeti.Toric.Nonarchimedean.toricPowerMap`.

**Hypotheses.** N is a finite-rank free Z-module, M=Hom_Z(N,Z), and Σ is a nonempty finite rational strongly convex fan in N_R, on the parent carrier.

**Construction or proof.** Apply the native monoid-algebra map to u↦qu; retain fixed coefficients. Check compatibility with face localization and completion. Glue the compatible chart maps and specialize q=p.

**Inputs.** `ShimuraCompactifications:C0/arbitrary-ring-toric-charts`, `ShimuraCompactifications:C0/relative-face-open`, `AnalyticToricGeometryPartII:NT.1/unit-toric-space`, `mathlib:AddMonoidAlgebra`.

**Planning API.**

- `toricPowerMap` (constructor): The coefficient-linear endomorphism φ_q on a toric chart, glued to the toric model.
- `toricPowerMap_monomial` (simp): φ_q*χ^u=χ^{qu} and φ_q*a=a.
- `toricPowerMap_comp` (functoriality): φ_1=id and φ_q∘φ_r=φ_{qr}.
- `toricPowerMap_divisor` (compatibility): φ_q*D=qD for invariant Cartier D; section weights multiply by q.

**Discriminating tests.**

- `toricPowerMap_p1` (computation): On P¹, φ_p sends [x₀:x₁] to [x₀^p:x₁^p], preserving zero and infinity.
- `toricPowerMap_identity` (degenerate): q=1 fixes every monomial and coefficient.
- `toricPowerMap_coefficients` (non-example): In characteristic p the coefficient-linear map fixes every a∈K; it does not send arbitrary a to a^p.

**Uses.** NT.3 inverse limits; NT.4 cohomology; NT.5 clearing denominators: The same lattice power map controls the tower and rescales divisor classes.

**Acceptance.** The tower uses φ_p, rather than a coefficient-changing absolute Frobenius over K.

**Source.** SCH12, §8, paragraph immediately preceding Theorem 8.5, p. 304. Multiplication by p on the character lattice gives the common transition morphism of all toric constructions.

## Layer NT.2: Perfected toric charts and graded sections

Construct the perfected toric space and p-local divisor modules with c₀ coefficients. Define C_D and identify the graded divisor completion with the P2 cone algebra, including its tilt and homogeneous degree pieces. Import P2 perfected-cone perfectoidness and homogeneous approximation through the precise request; keep their general proofs with that supplier.

### Perfectoid toric spaces

**Target `AnalyticToricGeometryPartII:NT.2/perfectoid-toric-space` (construction).** Let P_σ[1/p] be the additive submonoid of M[1/p] consisting of u/p^n with u∈P_σ. Construct B_{σ,K}=K⟨P_σ[1/p]⟩ with plus ring K°⟨P_σ[1/p]⟩ and glue their Spa spectra by the perfected unit face localizations, obtaining T_{Σ,K}. Each chart is perfectoid, and the glued space is perfectoid. Supply compatible maps pr_n:T_{Σ,K}→A_{Σ,K}, characterized by χ^u↦χ^{u/p^n}. No regularity or completeness is required.

**Named signature.** `TauCeti.Toric.Nonarchimedean.perfectoidToricSpace`.

**Hypotheses.** N is a finite-rank free Z-module, M=Hom_Z(N,Z), and Σ is a nonempty finite rational strongly convex fan in N_R, on the parent carrier. K is a perfectoid field of residue characteristic p, with tilt K♭; choose ϖ♭ with ϖ=(ϖ♭)♯ and ϖ^p dividing p in K°.

**Construction or proof.** Use the P2 perfected-cone-algebra request, specialized to σ∨, for the Banach algebra, its plus ring, perfectoidness and monomial-compatible tilt. Perfect the face maps and use P2 rational localization and gluing. At each level the monomial embedding is u↦u/p^n, so φ∘pr_{n+1}=pr_n.

**Inputs.** `AnalyticToricGeometryPartII:NT.1/unit-toric-space`, `AnalyticToricGeometryPartII:NT.1/power-map`, `PerfectoidSpaces:P2`, `PerfectoidSpaces:P2/rational-localization-of-perfectoid-affinoids`, `PerfectoidSpaces:P2/perfectoid-spaces-and-glued-tilting`.

**Planning API.**

- `perfectoidToricSpace` (constructor): Glue the perfected chart spectra to T_{Σ,K}.
- `perfectoidToricSpace_chart` (projection): Its cone charts are the named perfected monoid spectra, with unit face overlaps.
- `perfectoidToricSpace_projection` (projection): pr_n on a chart pulls χ^u back to χ^{u/p^n}; φ∘pr_{n+1}=pr_n.
- `perfectoidToricSpace_baseChange` (functoriality): Perfectoid valued-field extension and fan-compatible maps commute with the chart construction and projections.

**Discriminating tests.**

- `perfectoidToricSpace_disc` (computation): For the positive ray, the chart algebra is K⟨t^{1/p^∞}⟩ with the usual Gauss plus ring.
- `perfectoidToricSpace_torus` (non-example): For the zero cone in Z, the algebra contains both t^{1/p^n} and their inverses; it is not the perfected disc algebra.
- `perfectoidToricSpace_rankZero` (degenerate): For the rank-zero nonempty fan the space is Spa(K,K°) and every projection is the identity.

**Uses.** NT.2 line bundles; NT.3 all comparisons: Perfectoid charts are the common intermediate object linking K and K♭.

**Acceptance.** The zero cone produces a perfected unit torus, retaining invertible characters.

**Source.** SCH12, §8, perfectoid-chart paragraph before Theorem 8.5, p. 304; Proposition 5.20, p. 280. The perfected toric charts are asserted perfectoid by the same integral-completion/Frobenius calculation as the perfected polydisc.

### Perfected divisor sections

**Target `AnalyticToricGeometryPartII:NT.2/perfected-divisor-sections` (construction).** For D=Σ a_iD_i with a_i∈Z[1/p], define W^p_Σ(D)={u∈M[1/p]:<u,v_i>≥−a_i}. Localize the character modules indexed by these sets and complete in the coefficient supremum norm; this defines the toric divisorial sheaf O_T(D) on T_{Σ,K}. Its global sections are c₀(W^p_Σ(D),K): coefficient families with only finitely many coefficients of norm ≥ε for every ε>0. For regular Σ these are line bundles with perfected character frames. General fans retain divisorial modules; no unsupported invertibility on singular cones is asserted.

**Named signature.** `TauCeti.Toric.Nonarchimedean.perfectedDivisorSections`.

**Hypotheses.** N is a finite-rank free Z-module, M=Hom_Z(N,Z), and Σ is a nonempty finite rational strongly convex fan in N_R, on the parent carrier. K is a perfectoid field of residue characteristic p, with tilt K♭; choose ϖ♭ with ϖ=(ϖ♭)♯ and ϖ^p dividing p in K°. The distinct rays ρ_i of Σ have primitive generators v_i; D=Σ_i a_i D_i uses the sign convention div(χ^u)=Σ_i <u,v_i>D_i. Coefficients may have p-power denominators; regularity is required for all O_T(D) to be invertible.

**Construction or proof.** Extend the ray inequalities to M[1/p]. Identify finite-level character modules and clear a common p-power denominator to descend integral D. Complete the monomial span; finite support is dense, and compatible chart coefficients satisfy exactly the global ray bounds. On regular cones translate by the local perfected Cartier character and glue the resulting rank-one modules.

**Inputs.** `AnalyticToricGeometryPartII:NT.0/section-weights`, `AnalyticToricGeometryPartII:NT.0/cartier-integral-model`, `AnalyticToricGeometryPartII:NT.2/perfectoid-toric-space`, `mathlib:ZeroAtInftyContinuousMap`.

**Planning API.**

- `perfectedDivisorSections` (constructor): The Banach coefficient module c₀(W^p(D),K), with its chartwise divisorial-sheaf interpretation.
- `perfectedDivisorSections_coeff` (extensionality): Equality is coefficientwise and the norm is the supremum of coefficient norms.
- `perfectedDivisorSections_dense` (universal-property): The finite-support monomial span is dense and its bounded maps uniquely extend to the completion.
- `perfectedDivisorSections_mul` (structure): Convolution gives a bounded product Ŝ(D)×Ŝ(E)→Ŝ(D+E).
- `perfectedDivisorSections_descent` (compatibility): Finite-support sections with common denominator p^n become algebraic sections after the characteristic-p p^n power, in O(p^nD).

**Discriminating tests.**

- `perfectedDivisorSections_p1` (computation): For P¹ and D=D_−, the coefficient index is Z[1/p]∩[0,1], which includes every 1/p^n.
- `perfectedDivisorSections_zero` (degenerate): For a complete fan and D=0 the module is K, since only the zero weight is allowed.
- `perfectedDivisorSections_constantFamily` (non-example): For P¹ and D=D_−, the family with coefficient 1 at every admissible weight is not a section: it fails the c₀ condition.

**Uses.** NT.2 graded divisor algebra and NT.5 dense-field perturbation: Banach sections can be truncated to finitely many characters before clearing denominators.

**Acceptance.** Use c₀, not the unrestricted product K^{W^p(D)}.

**Source.** SCH12, §8, perfectoid divisor paragraph before Theorem 8.5, p. 304; proof of Proposition 8.7, p. 306. The sheaf and its global sections are described as the Banach-completed character span for p-localized divisor coefficients.

### Graded divisor cones

**Target `AnalyticToricGeometryPartII:NT.2/divisor-cone` (definition).** Define the rational polyhedral cone C_D={(u,j)∈M_R×R : <u,v_i>+j a_i≥0 for all rays i}, for integer invariant D. Let Q_D=C_D∩(M[1/p]×Z[1/p]), an additive monoid, graded by (u,j)↦j. Its degree-j fibre is W^p_Σ(jD). If Σ is complete, Q_D in degree zero consists solely of (0,0). Negative degrees remain part of the definition; when D is effective their nonzero fibres can vanish, but no positive-degree truncation is silently substituted.

**Named signature.** `TauCeti.Toric.Nonarchimedean.divisorCone`.

**Hypotheses.** N is a finite-rank free Z-module, M=Hom_Z(N,Z), and Σ is a nonempty finite rational strongly convex fan in N_R, on the parent carrier. The distinct rays ρ_i of Σ have primitive generators v_i; D=Σ_i a_i D_i uses the sign convention div(χ^u)=Σ_i <u,v_i>D_i.

**Construction or proof.** Use the simultaneous homogeneous linear inequalities in M_R×R. Check addition, p-divisibility and the grading. For complete Σ, the rays generate N_R as a cone; a linear functional nonnegative on every cone and its opposite is zero.

**Inputs.** `AnalyticToricGeometryPartII:NT.0/section-weights`, `AnalyticToricGeometryPartII:NT.2/perfected-divisor-sections`, `tauceti:TauCetiRoadmap/AnalyticToricGeometry#layer-0-the-toric-compatible-algebraic-supplier`.

**Planning API.**

- `divisorCone` (constructor): The homogeneous ray-inequality cone C_D and its perfected lattice monoid Q_D.
- `divisorCone_grade` (projection): The grading sends (u,j) to j and its fibre is the weight set of jD.
- `divisorCone_add` (structure): Q_D is closed under addition and division by p.
- `divisorCone_principal` (compatibility): For D′=D+div χ^m, (u,j)↦(u−jm,j) identifies Q_D with Q_D′ and preserves degrees.

**Discriminating tests.**

- `divisorCone_p1` (computation): For P¹ and D=D_−, Q_D consists of p-local rational pairs with 0≤u≤j.
- `divisorCone_zeroDivisor` (degenerate): For a complete fan and D=0, Q_D={0}×Z[1/p], with negative degrees present.
- `divisorCone_incompleteDegreeZero` (non-example): For the positive-ray fan and D=0, degree zero contains every nonnegative p-local weight, so its completed algebra is not K.

**Uses.** NT.2 graded-algebra identification and NT.5 homogeneous approximation: It identifies the exact cone and linear grading to pass to the P2 supplier.

**Acceptance.** Degree zero equals K only after imposing completeness; this hypothesis is needed by the homogeneous P2 approximation request.

**Source.** SCH12, §8, graded ring in the proof of Proposition 8.7, p. 306. The section inequalities in degree j assemble into one perfected rational cone monoid, making the claimed graded completion precise.

### Graded divisor algebras

**Target `AnalyticToricGeometryPartII:NT.2/graded-divisor-algebra` (construction).** For integer D define R_D to be the coefficient-Gauss completion of the algebraic direct sum over j∈Z[1/p] of H⁰(T_{Σ,K},O_T(jD)); use convolution products and the integral coefficient lattice. Identify it isometrically with the P2 completed monoid algebra K⟨Q_D⟩, with homogeneous degree-j subspace c₀(W^p(jD),K). Thus R_D is perfectoid and R_D♭≅K♭⟨Q_D⟩, monomial compatibly. The completed grading is a c₀ direct sum, not a product, and sharp preserves homogeneous degrees but is not additive. When Σ is complete R_D has degree-zero part K and satisfies the exact hypotheses of the P2 homogeneous approximation request.

**Named signature.** `TauCeti.Toric.Nonarchimedean.gradedDivisorAlgebra`.

**Hypotheses.** N is a finite-rank free Z-module, M=Hom_Z(N,Z), and Σ is a nonempty finite rational strongly convex fan in N_R, on the parent carrier. K is a perfectoid field of residue characteristic p, with tilt K♭; choose ϖ♭ with ϖ=(ϖ♭)♯ and ϖ^p dividing p in K°. The distinct rays ρ_i of Σ have primitive generators v_i; D=Σ_i a_i D_i uses the sign convention div(χ^u)=Σ_i <u,v_i>D_i.

**Construction or proof.** Send the degree-j monomial χ^u to the monomial χ^{(u,j)} of Q_D. Check products and the integral coefficient lattices; complete the isometric monomial identification. Import perfected-cone perfectoidness/tilt from P2, rather than reproduce its Frobenius proof. For complete Σ use the divisor-cone degree-zero calculation and import P2 homogeneous approximation; the toric application is NT.5.

**Inputs.** `AnalyticToricGeometryPartII:NT.2/divisor-cone`, `AnalyticToricGeometryPartII:NT.2/perfected-divisor-sections`, `PerfectoidSpaces:P2`.

**Planning API.**

- `gradedDivisorAlgebra` (constructor): The P2 completed cone algebra indexed by Q_D, identified with the completed graded section sum.
- `gradedDivisorAlgebra_homogeneous` (characterisation): Degree-j elements have coefficients only at Q_D weights of grading j.
- `gradedDivisorAlgebra_section` (compatibility): The degree-j piece is isometrically Ŝ(jD), and products add degrees.
- `gradedDivisorAlgebra_tilt` (equivalence): The tilt has the same perfected monomial cone over K♭, with sharp preserving a homogeneous degree.
- `gradedDivisorAlgebra_degreeZero` (characterisation): For complete Σ the degree-zero piece is exactly K.

**Discriminating tests.**

- `gradedDivisorAlgebra_p1` (computation): For P¹ with D=D_−, Q_D is the perfected two-generator cone under (u,j)↦(u,j−u), so R_D is K⟨s^{1/p^∞},t^{1/p^∞}⟩ graded by total degree.
- `gradedDivisorAlgebra_zeroDivisor` (degenerate): For D=0 on a complete fan, R_D=K⟨z^{±1/p^∞}⟩, not K; only its degree-zero piece is K.
- `gradedDivisorAlgebra_product` (non-example): A coefficient-one family in infinitely many different degrees is excluded by the outer c₀ condition.

**Uses.** NT.5 hypersurface approximation: Approximate an integral homogeneous degree-one equation without changing its divisor class.

**Acceptance.** No arbitrary completion topology or ordinary Proj construction replaces the Gauss completion.

**Source.** SCH12, §8, proof of Proposition 8.7, p. 306; Proposition 5.20, p. 280; Lemma 6.5 and Remark 6.6, pp. 288–290. The proof uses this completion and its tilted homogeneous approximation. The cone formulation fixes its coefficient norm and grading while leaving the general approximation induction with P2.

## Layer NT.3: Tilting, inverse limits and étale topoi

Prove the five parts of Scholze Theorem 8.5: perfectoid tilt, tilde-limit, underlying inverse-limit homeomorphism, étale fibred-topos limit and restriction to arbitrary opens. Construct π only on topological spaces and étale topoi. Recover full affine-line analytification from the invariant complement of infinity in P¹.

### Toric tilting comparison

**Target `AnalyticToricGeometryPartII:NT.3/tilting` (theorem).** For every Σ, T_{Σ,K}♭≅T_{Σ,K♭}, preserving cone charts, plus rings, perfected characters and p-local divisor models. On a chart the tilted algebra is K♭⟨P_σ[1/p]⟩. This is an isomorphism of perfectoid spaces; it does not identify the unperfected K and K♭ toric spaces as ringed spaces.

**Named signature.** `TauCeti.Toric.Nonarchimedean.toricTiltingComparison`.

**Hypotheses.** N is a finite-rank free Z-module, M=Hom_Z(N,Z), and Σ is a nonempty finite rational strongly convex fan in N_R, on the parent carrier. K is a perfectoid field of residue characteristic p, with tilt K♭; choose ϖ♭ with ϖ=(ϖ♭)♯ and ϖ^p dividing p in K°.

**Construction or proof.** Apply the P2 cone tilt and monomial correspondence chartwise. Use compatibility with rational unit face localization, then glue by the common fan cocycle.

**Inputs.** `AnalyticToricGeometryPartII:NT.2/perfectoid-toric-space`, `PerfectoidSpaces:P2/perfectoid-spaces-and-glued-tilting`, `PerfectoidSpaces:P2`.

**Acceptance.** For the positive ray this is the usual perfected-disc tilt.

**Source.** SCH12, §8, Theorem 8.5(i) and proof, pp. 304–305. The source proves the comparison affinoid-locally by the perfected-monomial tilting calculation.

### Toric perfectoid tilde-limits

**Target `AnalyticToricGeometryPartII:NT.3/tilde-limit` (theorem).** The compatible projections give T_{Σ,K} ~ lim_{φ_p} A_{Σ,K}. Here ~ is the P7 perfectoid tilde-limit, with both the homeomorphism of underlying spaces and dense finite-level functions on an affinoid cover. On cone charts the completed colimit of K⟨P_σ⟩ under u↦pu is K⟨P_σ[1/p]⟩. This is not a claim of a categorical inverse limit in all adic spaces.

**Named signature.** `TauCeti.Toric.Nonarchimedean.toricTildeLimit`.

**Hypotheses.** N is a finite-rank free Z-module, M=Hom_Z(N,Z), and Σ is a nonempty finite rational strongly convex fan in N_R, on the parent carrier. K is a perfectoid field of residue characteristic p, with tilt K♭; choose ϖ♭ with ϖ=(ϖ♭)♯ and ϖ^p dividing p in K°.

**Construction or proof.** Use the shared pseudouniformizer and coefficient-Gauss integral lattices in the P7 completed-colimit theorem. Identify the algebraic colimit by u at level n↦u/p^n; its image is dense in the perfected chart. Apply the P7 gluing theorem to the stable finite toric cover.

**Inputs.** `AnalyticToricGeometryPartII:NT.2/perfectoid-toric-space`, `AnalyticToricGeometryPartII:NT.1/power-map`, `PerfectoidSpaces:P7/tilde-limit-from-completed-colimit`, `PerfectoidSpaces:P7/tilde-limit-gluing`.

**Acceptance.** Check both the topological and density conditions, including for the rank-zero fan.

**Source.** SCH12, §8, Theorem 8.5(ii) and proof, p. 305; Definition 7.14 and Theorem 7.17, p. 302. The perfected toric charts are the completed power-tower colimits. The stronger chart-dense tilde-limit supplies the source residue-field comparison.

### Toric inverse-limit homeomorphism

**Target `AnalyticToricGeometryPartII:NT.3/topological-limit` (theorem).** There is a canonical homeomorphism |A_{Σ,K♭}|≅lim_{φ_p}|A_{Σ,K}|, where the right side is the inverse limit of topological spaces. Use the characteristic-p perfection homeomorphism |T_{Σ,K♭}|≅|A_{Σ,K♭}|, the perfectoid tilting homeomorphism and the K tilde-limit. All cone restrictions and toric strata correspond.

**Named signature.** `TauCeti.Toric.Nonarchimedean.toricTopologicalLimit`.

**Hypotheses.** N is a finite-rank free Z-module, M=Hom_Z(N,Z), and Σ is a nonempty finite rational strongly convex fan in N_R, on the parent carrier. K is a perfectoid field of residue characteristic p, with tilt K♭; choose ϖ♭ with ϖ=(ϖ♭)♯ and ϖ^p dividing p in K°.

**Construction or proof.** In characteristic p φ_p has purely inseparable residue extensions and is a universal homeomorphism on each toric chart. Apply P7 perfection-tilde-limit and tilting preservation of underlying spaces. Compose with the K tilde-limit homeomorphism and glue.

**Inputs.** `AnalyticToricGeometryPartII:NT.3/tilting`, `AnalyticToricGeometryPartII:NT.3/tilde-limit`, `PerfectoidSpaces:P7/perfection-tilde-limit`.

**Acceptance.** For projective space it sends a tilted point to its compatible p-power-root sequence.

**Source.** SCH12, §8, Theorem 8.5(iii) and proof, p. 305. The comparison combines characteristic-p perfection with the same topological space under perfectoid tilting.

### Toric tilting projections

**Target `AnalyticToricGeometryPartII:NT.3/projection` (construction).** Define π:|A_{Σ,K♭}|→|A_{Σ,K}| by the preceding homeomorphism followed by level-zero projection. On classical projective coordinates π([x₀:…:x_n])=[x₀♯:…:x_n♯]. On a monomial chart, evaluation of χ^u after π agrees with sharp applied to its perfected-character lift. π is continuous, surjective and compatible with the toric cover and strata. It comes with a morphism of étale topoi from the following comparison. No morphism of K/K♭ locally ringed spaces or additive sharp map is asserted.

**Named signature.** `TauCeti.Toric.Nonarchimedean.toricProjection`.

**Hypotheses.** N is a finite-rank free Z-module, M=Hom_Z(N,Z), and Σ is a nonempty finite rational strongly convex fan in N_R, on the parent carrier. K is a perfectoid field of residue characteristic p, with tilt K♭; choose ϖ♭ with ϖ=(ϖ♭)♯ and ϖ^p dividing p in K°.

**Construction or proof.** Compose the explicitly named topological comparison with evaluation at level zero. Surjectivity follows from characteristic-p perfection and existence of compatible tower lifts chartwise. For projective coordinates use multiplicativity of sharp to verify independence of the common nonzero scalar.

**Inputs.** `AnalyticToricGeometryPartII:NT.3/topological-limit`.

**Planning API.**

- `toricProjection` (constructor): The level-zero continuous projection from the tilted unit toric space.
- `toricProjection_coordinates` (simp): On P^n classical points it is given by homogeneous coordinate sharp.
- `toricProjection_power` (compatibility): π∘φ_p=φ_p∘π on underlying spaces.
- `toricProjection_strata` (compatibility): The inverse image of each toric stratum is the corresponding tilted stratum.
- `toricProjection_preimage` (projection): For every open U the set V=π⁻¹(U) is open and carries the restricted topological map.

**Discriminating tests.**

- `toricProjection_p1` (computation): π fixes the zero and infinity strata of P¹ and maps t to t♯ on tilted classical affine points.
- `toricProjection_scaling` (compatibility): Multiplying all projective coordinates by λ multiplies their sharp images by λ♯, so the projective point is unchanged.
- `toricProjection_line` (non-example): For the line x₀+x₁+x₂=0 in P², its π-preimage is modeled topologically by the tower of equations x₀^{p^n}+x₁^{p^n}+x₂^{p^n}=0. It is not obtained by the algebraic line x₀+x₁+x₂=0 over K♭; sharp does not preserve sums.

**Uses.** NT.5 neighbourhood pullback; NT.4 cohomology; DeligneWeightsAndPurityPartII and MotivesAndAlgebraicCyclesPartII: The projection transfers open tubes and, through the site comparison, cohomology.

**Acceptance.** Additivity of sharp is never required.

**Source.** SCH12, §8, sentence following Theorem 8.5, p. 305; §1, discussion after Theorem 1.13, pp. 249–250. The source introduces π on topological spaces and étale topoi; the coordinate sharp formula is homogeneous because sharp is multiplicative.

### Toric étale topos comparison

**Target `AnalyticToricGeometryPartII:NT.3/etale-topos` (theorem).** The étale topos of A_{Σ,K♭} is the projective limit of the fibred diagram of étale topoi of A_{Σ,K} under φ_p, with its level projections. Construct this as an equivalence with the sheaves on the finite-stage colimit étale site, not a pointwise limit of categories. The associated level-zero geometric morphism has underlying continuous map π. It respects finite étale objects, covering families and constant torsion coefficients.

**Named signature.** `TauCeti.Toric.Nonarchimedean.toricEtaleComparison`.

**Hypotheses.** N is a finite-rank free Z-module, M=Hom_Z(N,Z), and Σ is a nonempty finite rational strongly convex fan in N_R, on the parent carrier. K is a perfectoid field of residue characteristic p, with tilt K♭; choose ϖ♭ with ϖ=(ϖ♭)♯ and ϖ^p dividing p in K°.

**Construction or proof.** Convert the chart-dense tilde-limit to the residue-field tilde-limit using P7. Use P7 étale-topos comparison for the qcqs locally noetherian finite-level unit toric spaces. Identify the K♭ tower with its level-zero étale topos by inseparable-tower invariance, then use P3 site tilting.

**Inputs.** `AnalyticToricGeometryPartII:NT.3/tilde-limit`, `AnalyticToricGeometryPartII:NT.3/tilting`, `AnalyticToricGeometryPartII:NT.3/projection`, `PerfectoidSpaces:P7/tilde-limit-implies-residue-field-tilde-limit`, `PerfectoidSpaces:P7/tilde-limits-and-etale-topos-comparison`, `PerfectoidSpaces:P7/etale-topos-invariance-under-inseparable-towers`, `PerfectoidSpaces:P3/etale-site-tilting-equivalence`, `AdicEtaleGeometry:A1/etale-site`.

**Acceptance.** For the P^n fan this is Theorem 1.13; unperfected tilted spaces are not assumed perfectoid.

**Source.** SCH12, §8, Theorem 8.5(iv), p. 305; Theorem 7.17 and Corollary 7.19, pp. 302–303. The projective-limit topos comes from finite-stage étale descent and characteristic-p inseparable invariance.

### Open toric topos restrictions

**Target `AnalyticToricGeometryPartII:NT.3/open-topos` (theorem).** For every open U⊂A_{Σ,K}, put V=π⁻¹(U)⊂A_{Σ,K♭}. There is a geometric morphism Sh(V_ét)→Sh(U_ét), and its square with the inclusions in the two global étale topoi commutes up to the canonical natural isomorphism. It is obtained by restricting the tower to φ_p^{-n}(U). U need not be φ-stable or quasicompact; arbitrary opens are covered by rational finite-stage opens.

**Named signature.** `TauCeti.Toric.Nonarchimedean.toricOpenTopos`.

**Hypotheses.** N is a finite-rank free Z-module, M=Hom_Z(N,Z), and Σ is a nonempty finite rational strongly convex fan in N_R, on the parent carrier. K is a perfectoid field of residue characteristic p, with tilt K♭; choose ϖ♭ with ϖ=(ϖ♭)♯ and ϖ^p dividing p in K°. U is any open subset of the unit toric space.

**Construction or proof.** Use P7 tilde-limit rational restriction and étale base change at each finite level. Tilt the restricted perfectoid opens using P2 open-subspace compatibility. Apply site descent on a rational cover to remove quasicompactness; the canonical isomorphisms give the commuting topos square.

**Inputs.** `AnalyticToricGeometryPartII:NT.3/etale-topos`, `PerfectoidSpaces:P7/tilde-limit-rational-restriction`, `PerfectoidSpaces:P7/tilde-limit-base-change`, `PerfectoidSpaces:P2/open-subspaces-of-perfectoid-spaces`.

**Acceptance.** Take U to be a small neighbourhood of an algebraic hypersurface; U is not required to be invariant under φ.

**Source.** SCH12, §8, Theorem 8.5(v), p. 305; Proposition 7.16, p. 302. The étale comparison restricts to inverse images of arbitrary open subsets through étale base change.

### Affine-line sharp comparison

**Target `AnalyticToricGeometryPartII:NT.3/affine-line` (application).** Theorem 1.5 concerns full analytification: |(A¹_{K♭})^{an}|≅lim_{t↦t^p}|(A¹_K)^{an}|. Derive it by applying the complete P¹ comparison and restricting to the complement of infinity, which φ preserves and whose π-preimage is the corresponding complement. Its level-zero projection is sharp on classical affine points. The unit-disc version is only the positive-ray instance of Theorem 8.5 and is distinguished explicitly.

**Named signature.** `TauCeti.Toric.Nonarchimedean.affineLineSharpComparison`.

**Hypotheses.** K is a perfectoid field of residue characteristic p, with tilt K♭; choose ϖ♭ with ϖ=(ϖ♭)♯ and ϖ^p dividing p in K°.

**Construction or proof.** Apply the complete-fan analytification comparison to P¹. Use φ^{-1}(∞)={∞} and the matching tilted stratum under π. Restrict the global inverse-limit homeomorphism to the compatible open complements; equivalently all tower coordinates avoid infinity.

**Inputs.** `AnalyticToricGeometryPartII:NT.1/analytification-comparison`, `AnalyticToricGeometryPartII:NT.3/topological-limit`, `AnalyticToricGeometryPartII:NT.3/open-topos`, `AnalyticToricGeometryPartII:NT.3/projection`.

**Acceptance.** The point t=ϖ⁻¹ is admitted by the affine-line statement although it is excluded from the unit-disc statement.

**Source.** SCH12, §1, Theorem 1.5, p. 247; §8, Theorem 8.5(iii),(v), p. 305. The introduction states the affine-line homeomorphism; the complete P¹ fan and invariant complement recover its full analytic domain.

## Layer NT.4: Prime-to-p torsion cohomology

For complete regular Σ, algebraically closed perfectoid K and ℓ≠p, prove invertibility of φ_p on Z/ℓ^m cohomology by the smooth proper valuation-ring model and universal-homeomorphism invariance on its special fibre. Deduce π* is an isomorphism with cup compatibility, distinguishing invertibility from identity.

### Power-map cohomology invariance

**Target `AnalyticToricGeometryPartII:NT.4/power-cohomology` (theorem).** Let Σ be complete and regular, K algebraically closed perfectoid of residue characteristic p, ℓ≠p prime and m≥1. For every i≥0, φ_p* is an automorphism of H^i((X_{Σ,K})^{an}_ét,Z/ℓ^m). Compare with the geometric special fibre of the common smooth proper K° toric scheme, where φ_p is a relative Frobenius and hence a universal homeomorphism. Invertibility is asserted, not identity: on H²(P¹,Z/ℓ^m(1)), it is multiplication by p.

**Named signature.** `TauCeti.Toric.Nonarchimedean.toricPowerCohomology`.

**Hypotheses.** N is a finite-rank free Z-module, M=Hom_Z(N,Z), and Σ is a nonempty finite rational strongly convex fan in N_R, on the parent carrier. K is a perfectoid field of residue characteristic p, with tilt K♭; choose ϖ♭ with ϖ=(ϖ♭)♯ and ϖ^p dividing p in K°. Σ is regular (smooth over every coefficient ring); completeness means properness, and projectivity is a separate hypothesis. Σ is complete; K is algebraically closed; ℓ is a prime different from p, m≥1.

**Construction or proof.** Use H5 proper algebraic/analytic cohomology comparison. Apply SF.2 smooth proper base change over the rank-one valuation ring K° with invertible torsion, compatibly with φ_p. In characteristic p the monomial power map is a universal homeomorphism (absolute Frobenius after the coefficient twist); use SF.2 topological invariance of the étale site. Transport the automorphism back to the analytic generic fibre.

**Inputs.** `AnalyticToricGeometryPartII:NT.1/power-map`, `AnalyticToricGeometryPartII:NT.1/analytification-comparison`, `ShimuraCompactifications:C0/arbitrary-ring-toric-charts`, `ShimuraCompactifications:C0`, `ClassicalAdicEtaleCohomology:H5`, `SchemeAndStackFoundations:SF.2`.

**Acceptance.** The P¹ top-degree action distinguishes an automorphism from the identity; ℓ=p is excluded.

**Source.** SCH12, §8, Proposition 8.6 and proof, pp. 305–306. The source reduces power-map invertibility on torsion cohomology to the purely inseparable special-fibre map by proper base change.

### Toric torsion cohomology comparison

**Target `AnalyticToricGeometryPartII:NT.4/projection-cohomology` (theorem).** Under the preceding hypotheses, the level-zero geometric morphism associated with π induces π*:H^i((X_{Σ,K})^{an}_ét,Z/ℓ^m)≅H^i((X_{Σ,K♭})^{an}_ét,Z/ℓ^m) for every i≥0. It is natural under the named toric maps and compatible with cup products and constant-coefficient pullback. Negative cohomological degrees vanish. No Z_ℓ comparison is asserted without a separate inverse-limit argument.

**Named signature.** `TauCeti.Toric.Nonarchimedean.toricProjectionCohomology`.

**Hypotheses.** N is a finite-rank free Z-module, M=Hom_Z(N,Z), and Σ is a nonempty finite rational strongly convex fan in N_R, on the parent carrier. K is a perfectoid field of residue characteristic p, with tilt K♭; choose ϖ♭ with ϖ=(ϖ♭)♯ and ϖ^p dividing p in K°. Σ is regular (smooth over every coefficient ring); completeness means properness, and projectivity is a separate hypothesis. Σ complete; K algebraically closed; ℓ≠p prime; m≥1.

**Construction or proof.** Use P7 cohomological continuity with constant torsion on the finite-stage tower. Identify the tilted topos with the tower-limit topos from NT.3. All φ_p* transitions are isomorphisms by the preceding node, so the map from level zero to their filtered colimit is an isomorphism. Cup compatibility is functoriality of inverse image of sheaves and derived cohomology, imported from H0.

**Inputs.** `AnalyticToricGeometryPartII:NT.4/power-cohomology`, `AnalyticToricGeometryPartII:NT.3/etale-topos`, `PerfectoidSpaces:P7/tilde-limits-and-etale-topos-comparison`, `ClassicalAdicEtaleCohomology:H0`.

**Acceptance.** For P¹, H⁰ and H² are identified and H¹=0; no mixed-characteristic ringed-space morphism is used.

**Source.** SCH12, §8, Proposition 8.6, pp. 305–306. The projection comparison is the torsion-cohomology consequence of the topos limit and invertible power transitions.

## Layer NT.5: Dense-field hypersurface approximation

Use the tautological integral divisor model to obtain cofinal section neighbourhoods. Apply P2 homogeneous sharp approximation to R_D, perturb to finite support over any given dense subfield of K♭ and clear p-denominators. Prove Proposition 8.7 with the result a section of O(p^N D), retaining nonreduced equations and requiring proper smoothness but no projectivity.

### Toric section neighbourhoods

**Target `AnalyticToricGeometryPartII:NT.5/tube-neighbourhoods` (theorem).** Let Σ be complete and regular and let f₁,…,f_s be finitely many nonzero sections of invariant integral Cartier models O(D₁),…,O(D_s), with nonempty common zero locus Y. Normalize each section into its tautological integral lattice by a scalar and fix those normalizations. For every open neighbourhood U of Y^{an}, some rational c>0 makes the common section domain N_c(f₁,…,f_s)=∩_i{x:|f_i(x)|≤|ϖ(x)|^c} lie in U. It contains Y^{an} and is a quasicompact open. The s=1 case is the hypersurface neighbourhood used in Proposition 8.7. For a fractional c=a/b use |f_i|^b≤|ϖ|^a; higher-rank points use their ordered valuation groups, not an imposed real-valued point norm. The domains are independent of integral frames, but depend on the chosen section scale and integral model.

**Named signature.** `TauCeti.Toric.Nonarchimedean.toricSectionNeighbourhoods`.

**Hypotheses.** N is a finite-rank free Z-module, M=Hom_Z(N,Z), and Σ is a nonempty finite rational strongly convex fan in N_R, on the parent carrier. K is a complete nontrivially valued rank-one nonarchimedean field; K° is its valuation ring and ϖ is a chosen pseudouniformizer. Σ is regular (smooth over every coefficient ring); completeness means properness, and projectivity is a separate hypothesis. Σ complete; the family is finite and each f_i defines an effective Cartier hypersurface; U contains the full common adic zero locus.

**Construction or proof.** Import R2 section-valuation domains on the completed tautological line bundle. Use finitely many integral toric charts and rational localization to express the zero-locus neighbourhoods. Each rational section domain is closed in the compact constructible topology, while the complement of U in X^{an} is constructibly closed and compact. Continuity of the point valuations makes the intersection over c of the common domains exactly Y^{an}. The finite intersection property on the complement of U in X^{an} gives one common c for which the domain avoids that complement. For f^r, compare |f^r|≤|ϖ|^{rc}; unchanged reduced zero locus does not imply unchanged radius.

**Inputs.** `AnalyticToricGeometryPartII:NT.0/cartier-integral-model`, `AnalyticToricGeometryPartII:NT.1/analytification-comparison`, `AdicSpacesPartII:R2/section-valuation-domain`.

**Acceptance.** Rescaling by c∈K× scales the threshold; a nonreduced equation f^r uses threshold exponent multiplied by r.

**Source.** SCH12, §8, proof of Proposition 8.7, p. 306; proof of Corollary 8.8, p. 307. The proof replaces a small neighbourhood by a bound on an integral line-bundle equation. This node spells out frame independence, cofinality and fractional valuation bounds.

### Dense-field section approximation

**Target `AnalyticToricGeometryPartII:NT.5/dense-field-approximation` (theorem).** Let Σ be complete and regular, D integer invariant, f an integral degree-one section of R_D, and choose rational c≥0 and ε∈Z[1/p], 0<ε<1. The P2 homogeneous approximation gives a degree-one g∈R_D♭° with |f−g♯|≤|ϖ^{1−ε}|max(|f|,|ϖ^c|) at every point of Spa(R_D,R_D°), and hence equality of the corresponding bounded maxima. Via integral chart frames this identifies the pulled-back toric section domains on T_{Σ,K♭}, then on A_{Σ,K♭} using its perfection homeomorphism. For any dense subfield k₀⊂K♭, g can be replaced by a finite-support degree-one g₀ with coefficients in k₀ and uniformly smaller perturbation than the chosen threshold. If a common p^N clears its weight denominators, h=g₀^{p^N} is an algebraic section of O(p^N D) over k₀; its zero locus lies in the pulled-back section domain.

**Named signature.** `TauCeti.Toric.Nonarchimedean.denseFieldSectionApproximation`.

**Hypotheses.** N is a finite-rank free Z-module, M=Hom_Z(N,Z), and Σ is a nonempty finite rational strongly convex fan in N_R, on the parent carrier. K is a perfectoid field of residue characteristic p, with tilt K♭; choose ϖ♭ with ϖ=(ϖ♭)♯ and ϖ^p dividing p in K°. Σ is regular (smooth over every coefficient ring); completeness means properness, and projectivity is a separate hypothesis. Σ complete; k₀ is a specified dense subfield, not necessarily perfect or algebraically closed.

**Construction or proof.** Use R_D=K⟨Q_D⟩ and its tilt with degree-zero K. Invoke the P2 cone-homogeneous approximation request exactly once. On each integral frame, map the graded cone algebra to the perfected chart by (u,j)↦u−jm_σ. This is a bounded monomial map, so the pointwise estimate restricts to the chart. Finite support is Gauss-dense; approximate its finitely many coefficients by k₀ within an error strictly below |(ϖ♭)^c|. Nonarchimedean inequalities preserve the truncated norm domain. Choose N clearing the finitely many p-denominators. In characteristic p, taking p^N powers raises coefficients and weights termwise; coefficients remain in k₀, even if k₀ is imperfect. Use the characteristic-p perfection homeomorphism to transfer vanishing and containment down to the algebraic hypersurface analytification.

**Inputs.** `AnalyticToricGeometryPartII:NT.2/graded-divisor-algebra`, `AnalyticToricGeometryPartII:NT.2/perfected-divisor-sections`, `AnalyticToricGeometryPartII:NT.3/projection`, `AnalyticToricGeometryPartII:NT.5/tube-neighbourhoods`, `PerfectoidSpaces:P2`.

**Acceptance.** The perturbed equation is kept nonzero by preserving a selected nonzero coefficient; it is not interpreted as a global regular function on a proper variety.

**Source.** SCH12, §8, proof of Proposition 8.7, p. 306; Lemma 6.5 and Remark 6.6, pp. 288–290. The proof combines a homogeneous sharp estimate, finite-support dense-field perturbation and p-power denominator clearing. The last object is a line-bundle section, as corrected by the confirmed extraction issue E11.

### Toric hypersurface approximation

**Target `AnalyticToricGeometryPartII:NT.5/hypersurface-approximation` (theorem).** Let Σ be complete and regular, K perfectoid, Y⊂X_{Σ,K} a nonempty effective Cartier hypersurface (possibly nonreduced), and U an open neighbourhood of Y^{an}. For every specified dense subfield k₀⊂K♭ there is an algebraic hypersurface Z⊂X_{Σ,K♭}, defined over k₀, with Z^{an}⊂π⁻¹(U). For an invariant divisor representative D of Y, one may produce Z as the zero locus of a nonzero section of O(p^N D) for some N≥0. Projectivity and algebraic closedness are not hypotheses of this result.

**Named signature.** `TauCeti.Toric.Nonarchimedean.toricHypersurfaceApproximation`.

**Hypotheses.** N is a finite-rank free Z-module, M=Hom_Z(N,Z), and Σ is a nonempty finite rational strongly convex fan in N_R, on the parent carrier. K is a perfectoid field of residue characteristic p, with tilt K♭; choose ϖ♭ with ϖ=(ϖ♭)♯ and ϖ^p dividing p in K°. Σ is regular (smooth over every coefficient ring); completeness means properness, and projectivity is a separate hypothesis. Σ complete; Y is a nonempty effective Cartier hypersurface; k₀⊂K♭ is dense.

**Construction or proof.** Represent Y by f in an invariant O(D) using NT.0. Choose an integral normalization and a section domain N_c(f)⊂U. Apply the preceding dense-field approximation and denominator-clearing theorem, then take the zero locus of h. The preceding character-lattice class presentation identifies Pic across K and K♭. Completeness and regularity make it torsion-free, and a nonempty effective divisor on the proper geometrically integral toric variety has nonzero class. Hence its class stays nonzero under p^N; a nowhere-vanishing section would trivialize it. Thus Z is a hypersurface, not an empty or whole-space zero locus.

**Inputs.** `AnalyticToricGeometryPartII:NT.0/invariant-representative`, `AnalyticToricGeometryPartII:NT.0/divisor-class-relations`, `AnalyticToricGeometryPartII:NT.5/tube-neighbourhoods`, `AnalyticToricGeometryPartII:NT.5/dense-field-approximation`.

**Acceptance.** Apply to a line in P², to a nonreduced equation f², and to a hypersurface on the smooth complete nonprojective fan of Fujino–Sato Example 4.1.

**Source.** SCH12, §8, Proposition 8.7 and proof, pp. 306–307; §1, Lemma 1.16, p. 251. The endpoint is a tilted algebraic hypersurface in the projection-preimage of the prescribed neighbourhood, with arbitrary dense-field coefficients. FS25, Example 4.1, pp. 7–8. The displayed finite fan gives a smooth complete nonprojective threefold, a concrete test that these targets do not require projectivity.

## Layer NT.6: Complete-intersection approximation

Compute positive toric complete-intersection degree from the fan and divisor classes. Use refined support in excess intersections to guarantee nonemptiness after tilt, and ample cuts to reach the original dimension. Prove Corollary 8.8 over a specified dense subfield, without unsupported irreducibility or connectedness claims.

### Toric intersection weights

**Target `AnalyticToricGeometryPartII:NT.6/intersection-weights` (construction).** For a complete fan Σ of rank n, define MW^j(Σ) as the integer functions c on cones σ of codimension j satisfying the following balancing equations: for every cone τ of codimension j+1 and u in the annihilator M(τ), sum over σ⊃τ of <u,n_{σ,τ}>c(σ)=0, where n_{σ,τ} is the primitive positive generator of N_σ/N_τ and N_σ=N∩span_R σ. A basis of each M(τ) gives a finite integral relation matrix. Import the operational Chow group from SF.5 and identify A^j(X_{Σ,k}) with MW^j(Σ), by evaluation on the orbit closures V(σ). Cartier line bundles give degree-one weights: for adjacent maximal cones ρ,ρ′ with wall σ and local section weights m_ρ,m_ρ′, m_ρ′−m_ρ=c(σ)b_{ρ,σ}, where b_{ρ,σ} is the primitive annihilator positive on ρ.

**Named signature.** `TauCeti.Toric.Nonarchimedean.toricIntersectionWeights`.

**Hypotheses.** N is a finite-rank free Z-module, M=Hom_Z(N,Z), and Σ is a nonempty finite rational strongly convex fan in N_R, on the parent carrier. Σ complete; 0≤j≤n; k is a field. Cartier data use the section-generator convention <m_ρ,v_i>=−a_i.

**Construction or proof.** Express orbit-closure cycle relations using characters of M(τ); they give exactly the balancing matrix. Apply the requested SF.5 finite-orbit Kronecker-duality theorem to the split torus action on the complete toric variety. Together with the orbit-cycle presentation this identifies the integer functionals annihilating the character relations. For a Cartier divisor, compare local equations χ^{−m_ρ}; their wall difference yields the stated degree-one coefficient, with the opposite sign from the local section generator.

**Inputs.** `AnalyticToricGeometryPartII:NT.0/cartier-integral-model`, `ShimuraCompactifications:C0/arbitrary-ring-toric-charts`, `SchemeAndStackFoundations:SF.5`.

**Planning API.**

- `toricIntersectionWeights` (constructor): The Z-submodule of integer cone weights annihilated by the finite character balancing matrix.
- `toricIntersectionWeights_mem` (characterisation): A weight belongs exactly when every character balancing sum vanishes.
- `toricIntersectionWeights_ext` (extensionality): Two intersection weights agree exactly when their values on all indexed cones agree.

**Discriminating tests.**

- `toricIntersectionWeights_p1` (computation): Degree-zero weights of the P¹ fan give the same integer to its two maximal cones; the relation matrix is [1,−1].
- `toricIntersectionWeights_product` (compatibility): For P¹×P¹, degree-one weights on rays (+e₁,+e₂,−e₁,−e₂) have equal opposite values. The two balancing rows are [1,0,−1,0] and [0,1,0,−1].
- `toricIntersectionWeights_unbalanced` (non-example): The P¹×P¹ ray assignment (1,0,0,0) is not balanced.

**Uses.** NT.6 fan displacement and positive degree: Finite integer balancing gives a field-independent representation of the relevant Chow classes.

**Acceptance.** Changing lattice bases or annihilator bases produces a canonically identified kernel, not a different Chow group.

**Source.** FS94, Proposition 1.1, p. 4; Proposition 1.4 and Theorem 2.1, p. 6; Corollary 2.4, p. 7. Orbit-cycle relations give balancing; operational Chow classes and Cartier degrees have the stated weight presentation. Local divisor equations have the negative of the section-generator weight.

### Toric fan displacement products

**Target `AnalyticToricGeometryPartII:NT.6/intersection-product` (theorem).** For complete Σ, codimension-a and codimension-b balanced weights c,d multiply as follows. At a cone γ of codimension a+b, choose a generic displacement in (N/N_γ)_R. Sum c(σ)d(τ)[N:N_σ+N_τ] over σ,τ containing γ, of codimensions a,b, whose images meet after the displacement in that quotient. This is the weight of the SF.5 cup product, independent of the generic displacement. Iterating on the Cartier weights and evaluating the degree-n weight at the zero cone computes deg(L₁⋯L_n∩[X]); all lattice indices and coefficients depend only on Σ and the Cartier data, hence are independent of k and its characteristic.

**Named signature.** `TauCeti.Toric.Nonarchimedean.toricFanDisplacementProduct`.

**Hypotheses.** N is a finite-rank free Z-module, M=Hom_Z(N,Z), and Σ is a nonempty finite rational strongly convex fan in N_R, on the parent carrier. Σ complete; k is a field; a,b≥0 and a+b≤rank N. Generic displacement avoids the finite exceptional linear subspaces; indices in contributing terms are finite.

**Construction or proof.** Apply the diagonal torus deformation to the lattice N/N_γ; its multiplicities are the indices [N:N_σ+N_τ]. Use the diagonal formula for the operational Chow cup product and the balanced-weight evaluation pairing. Iterate the product and evaluate at the zero cone; top-degree evaluation equals degree. The formula involves only integer lattice data.

**Inputs.** `AnalyticToricGeometryPartII:NT.6/intersection-weights`, `SchemeAndStackFoundations:SF.5`.

**Acceptance.** On P¹×P¹ the degree of O(a,b)·O(c,d) is ad+bc. In particular O(2,0)·O(1,1) has degree 2.

**Source.** FS94, Proposition 3.1, p. 10; Theorem 3.2, p. 11, proof pp. 12–13. The diagonal deformation computes the cup product by a generic fan displacement and integer lattice indices; the top weight is the intersection degree.

### Toric complete-intersection degrees

**Target `AnalyticToricGeometryPartII:NT.6/intersection-degree` (theorem).** Let X_{Σ,k} be smooth projective of dimension n, D₁,…,D_c invariant Cartier divisors whose sections cut out a nonempty set-theoretic complete intersection of codimension c, and H ample. Then δ=deg(c₁(H)^{n−c}c₁(O(D₁))⋯c₁(O(D_c))∩[X]) is a positive integer determined by the fan and divisor data, independent of the coefficient field. Replacing D_i by p^{N_i}D_i multiplies δ by p^{Σ N_i}. For arbitrary sections of the replaced bundles, even with excess intersection, the refined intersection class is supported on their common zero locus and has this positive degree after ample intersection; hence that zero locus cannot be empty.

**Named signature.** `TauCeti.Toric.Nonarchimedean.toricIntersectionDegree`.

**Hypotheses.** N is a finite-rank free Z-module, M=Hom_Z(N,Z), and Σ is a nonempty finite rational strongly convex fan in N_R, on the parent carrier. Σ is regular (smooth over every coefficient ring); completeness means properness, and projectivity is a separate hypothesis. Σ projective; 0≤c≤n; the initial sections form a proper intersection of effective Cartier divisors, set-theoretically of codimension c; H ample.

**Construction or proof.** A smooth toric scheme is Cohen–Macaulay. Codimension c for c Cartier equations gives a regular-sequence intersection cycle with positive generic lengths. Apply SF.5 Chern classes and ample degree positivity to this nonzero effective (n−c)-cycle. Apply the preceding fan displacement product to its Cartier weights; the resulting integral degree is unchanged by coefficient field or characteristic. Apply SF.5 refined Gysin support and projection/excess formulas to arbitrary tilted equations in the same powered divisor classes. A positive-degree class cannot be supported on an empty scheme.

**Inputs.** `AnalyticToricGeometryPartII:NT.6/intersection-product`, `AnalyticToricGeometryPartII:NT.0/cartier-integral-model`, `ShimuraCompactifications:C0/arbitrary-ring-toric-charts`, `SchemeAndStackFoundations:SF.5`, `SchemeAndStackFoundations:SF.0`.

**Acceptance.** For type (2,0) on P¹×P¹, H=O(1,1) gives degree 2 for two disjoint fibres; positivity does not assert connectedness.

**Source.** SCH12, §8, Corollary 8.8 and proof, p. 307. The corollary uses a positive combinatorial complete-intersection degree for nonemptiness. Refined intersection makes that argument valid when the new equations have excess intersection.

### Toric complete-intersection approximation

**Target `AnalyticToricGeometryPartII:NT.6/complete-intersection-approximation` (theorem).** Let Σ be smooth projective, K perfectoid, and nonempty Y⊂X_{Σ,K} be set-theoretically the intersection of c effective Cartier hypersurfaces, where c=codim(Y). Given any open neighbourhood U of Y^{an} and any dense subfield k₀⊂K♭, there exists a closed reduced k₀-defined subvariety Z⊂X_{Σ,K♭} with Z^{an}⊂π⁻¹(U) and dim Z=dim Y. Here subvariety means a reduced closed subscheme, possibly reducible. This theorem does not promise geometric irreducibility or connectedness; those require additional component/field-extension work in the consumer.

**Named signature.** `TauCeti.Toric.Nonarchimedean.toricCompleteIntersectionApproximation`.

**Hypotheses.** N is a finite-rank free Z-module, M=Hom_Z(N,Z), and Σ is a nonempty finite rational strongly convex fan in N_R, on the parent carrier. K is a perfectoid field of residue characteristic p, with tilt K♭; choose ϖ♭ with ϖ=(ϖ♭)♯ and ϖ^p dividing p in K°. Σ is regular (smooth over every coefficient ring); completeness means properness, and projectivity is a separate hypothesis. Σ projective; Y nonempty of codimension c and cut out set-theoretically by exactly c hypersurfaces; k₀⊂K♭ dense.

**Construction or proof.** Apply the finite-family section-neighbourhood theorem to the defining equations. Put U_i=N_c(f_i), so each contains its hypersurface and their intersection is contained in U; no normality or arbitrary closed-set separation claim is used. Apply NT.5 to each equation, producing Z_i defined over k₀ in the powered invariant divisor classes. The positive refined degree from the preceding node forces W=∩Z_i nonempty. The height bound gives dim W≥n−c. If its dimension exceeds n−c, cut W successively by sufficiently general ample hypersurfaces defined over the infinite field k₀. Avoid each geometric top-dimensional component and use projective ample intersection positivity to keep the intersection nonempty, until its maximal dimension equals n−c. Take the reduced structure. All cuts stay in W^{an}⊂π⁻¹(U); reduction and field extension preserve the support and dimension.

**Inputs.** `AnalyticToricGeometryPartII:NT.5/hypersurface-approximation`, `AnalyticToricGeometryPartII:NT.6/intersection-degree`, `SchemeAndStackFoundations:SF.5`, `SchemeAndStackFoundations:SF.0`.

**Acceptance.** For P¹×P¹ and the two disjoint fibres of type (2,0), the conclusion permits a disconnected one-dimensional Z. For c=0 the construction returns the whole toric variety. A hypersurface in P^n is the c=1 case; a collection with fewer or more equations than codimension is not a set-theoretic complete-intersection input.

**Source.** SCH12, §8, Corollary 8.8 and proof, p. 307. Intersect the approximating hypersurfaces, establish nonemptiness by degree and reduce excess dimension with additional hypersurfaces.

## A nonprojective acceptance fan

Use the fan from Fujino–Sato, Example 4.1, pp. 7–8 (author version dated 12 July 2025). In N=Z³ take primitive ray vectors (1,0,0), (0,1,0), (0,0,1), (−1,−1,−1), (−1,−1,0), (0,−1,−1), (−1,0,−1). Its maximal cones, denoted by ray indices, are 123, 127, 136, 167, 235, 257, 356, 456, 457 and 467, together with all faces. The fan is complete and regular. Its three cyclic wall relations prevent a strictly convex Cartier support function, so it is nonprojective. NT.1–NT.5 apply, including the proper generic-fibre comparison, while NT.6 needs projectivity and does not use this fan as an input. This is an acceptance example, not a new classification target.

## Supplier contracts and closure

The following requests are part of the plan. They name the mathematical owner and the consuming nodes; the packet does not claim these suppliers are formalized or independently accepted. A precise request is preferable to importing their narrower existing polydisc or noetherian statement as if it supplied the needed generality.

- **`tauceti:TauCetiRoadmap/AnalyticToricGeometry#layer-0-the-toric-compatible-algebraic-supplier`.** Import Layer 0 dual semigroup σ∨∩M and Gordan finite generation, cones/fans/primitive rays and the complex fan scheme; use the current main additions rather than replanning them. The invariant divisor conventions must use its same lattice/fan carrier. Needed by `AnalyticToricGeometryPartII:NT.0/section-weights`, `AnalyticToricGeometryPartII:NT.1/unit-toric-space`, `AnalyticToricGeometryPartII:NT.2/divisor-cone`.
- **`ShimuraCompactifications:C0`.** Export, for the finite-fan scheme of C0/arbitrary-ring-toric-charts over every commutative ring A, regular-fan smoothness and complete-fan properness over Spec A, with integral Cartier character gluing and compatibility at A=C with the parent fan scheme. The accepted RS-32 general-base owner includes XΣ,A; these properties are needed also when A=K° is nonnoetherian. Needed by `AnalyticToricGeometryPartII:NT.1/analytification-comparison`, `AnalyticToricGeometryPartII:NT.4/power-cohomology`.
- **`PerfectoidSpaces:P2`.** For a finite-rank lattice L and rational polyhedral cone C⊂L_R, construct K⟨C∩L[1/p]⟩ with its coefficient-Gauss integral subring, prove perfectoidness and monomial-compatible tilt K♭⟨C∩L[1/p]⟩, including cones with lineality. For a Z[1/p]-valued linear grading whose degree-zero part is K, prove the homogeneous analogue of Lemma 6.5: integral homogeneous f of degree d, rational c≥0 and ε∈Z[1/p] with 0<ε<1 admit an integral homogeneous g of degree d with |f(x)−g♯(x)|≤|ϖ^{1−ε}(x)|max(|f(x)|,|ϖ^c(x)|) at every Spa point, hence equality of bounded maxima. Assume K perfectoid, ϖ=(ϖ♭)♯, ϖ^p|p. General perfected cone algebras and approximation induction remain in P2; NT.2 supplies only its toric specializations and the identification for C_D. Needed by `AnalyticToricGeometryPartII:NT.2/perfectoid-toric-space`, `AnalyticToricGeometryPartII:NT.2/graded-divisor-algebra`, `AnalyticToricGeometryPartII:NT.3/tilting`, `AnalyticToricGeometryPartII:NT.5/dense-field-approximation`.
- **`SchemeAndStackFoundations:SF.0`.** Supply the lattice-basis Laurent polynomial UFD calculation for the split torus and its divisor class triviality; effective Cartier divisors/zero sections and dimension/height facts for smooth Cohen–Macaulay varieties, including regular-sequence intersections and dimension after generic hyperplane cuts over an infinite coefficient field. Needed by `AnalyticToricGeometryPartII:NT.0/invariant-representative`, `AnalyticToricGeometryPartII:NT.0/divisor-class-relations`, `AnalyticToricGeometryPartII:NT.6/intersection-degree`, `AnalyticToricGeometryPartII:NT.6/complete-intersection-approximation`.
- **`SchemeAndStackFoundations:SF.2`.** Smooth proper base change for Z/ℓ^m cohomology over an arbitrary rank-one valuation ring with algebraically closed fraction field, ℓ invertible, and topological invariance of the étale site under universal homeomorphisms. Preserve naturality for the coefficient-linear toric power morphism. Needed by `AnalyticToricGeometryPartII:NT.4/power-cohomology`.
- **`SchemeAndStackFoundations:SF.5`.** Integral Chow groups and operational Chow groups, Chern classes of invertible sheaves, the Kronecker evaluation duality for complete schemes with a split connected solvable group acting with finitely many orbits (the general theorem applied in Fulton–Sturmfels Proposition 1.4, p. 6), refined intersection support/projection/excess formulas, positivity of ample degree on a nonzero effective cycle, and general ample-hypersurface cuts over infinite fields that remain nonempty in positive dimension. No connectedness premise or conclusion is used. NT.6 owns the toric fan computation and field-independence application. Needed by `AnalyticToricGeometryPartII:NT.6/intersection-weights`, `AnalyticToricGeometryPartII:NT.6/intersection-product`, `AnalyticToricGeometryPartII:NT.6/intersection-degree`, `AnalyticToricGeometryPartII:NT.6/complete-intersection-approximation`.
- **`ClassicalAdicEtaleCohomology:H5`.** Proper algebraic/adic comparison for the smooth proper toric variety with constant Z/ℓ^m coefficients, ℓ≠p, natural for φ_p; no inverse-limit upgrade to Z_ℓ is assumed. Needed by `AnalyticToricGeometryPartII:NT.4/power-cohomology`.
- **`ClassicalAdicEtaleCohomology:H0`.** Ordinary torsion étale cohomology, functorial pullback along geometric morphisms and its cup-product compatibility, with the P7 perfectoid-limit continuity supplying the tower comparison. Needed by `AnalyticToricGeometryPartII:NT.4/projection-cohomology`.


## Prototype boundary

The Suggested file is a signature aid at the pinned libraries, not an implementation. Native finite fans, monoid algebras, codimension-one Weil divisors and coefficient-function constructions are reused. Global adic and perfectoid categories, toric generic-ring schemes and the required small étale site carriers are not present at that pin. The file gives coordinate and underlying-space signatures where they are meaningful, and records each omitted geometric condition or type explicitly. No arbitrary proposition field stands in for those missing notions. The reader's statements remain definitive; the prototype ledger in the handoff quantifies what is fully stated and what awaits a supplier type.

## Sources and reproducibility

SCH12 is Peter Scholze, [*Perfectoid spaces*](https://www.numdam.org/item/PMIHES_2012__116__245_0/), published IHÉS version, volume 116 (2012), pp. 245–313, DOI 10.1007/s10240-012-0042-x. All section and page references here use that published numbering, not the shorter arXiv pagination. Read Proposition 5.20, Lemma 6.5, the §7 limit results and the full §8. The confirmed extraction correction PAPER-SCHOLZE-12/E11 changes the final approximation object to a line-bundle section. All target statements and proofs use our own words.

FS25 is Osamu Fujino and Hiroshi Sato, [*On non-projective complete toric varieties*](https://www.math.kyoto-u.ac.jp/~fujino/toric-projectivity11.pdf), author version 0.27 of 12 July 2025, Example 4.1, pp. 7–8. FS94 is William Fulton and Bernd Sturmfels, [*Intersection theory on toric varieties*](https://arxiv.org/abs/alg-geom/9403002), arXiv:alg-geom/9403002v1 of 1 March 1994. NT.6 uses Theorem 2.1 (p. 6), Corollary 2.4 (p. 7), Proposition 3.1 (p. 10) and Theorem 3.2 (p. 11; proof pp. 12–13) for the toric balancing and integer product formula. These are preprint page numbers. The packet records primary URLs, access dates and SHA-256 hashes for all three inspected PDFs.

The pinned proof-signature baseline is Tau Ceti f790474821cf4256814db967cb154e7af3d0c369 with Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174. Ownership and duplication were also checked against TauCetiRoadmap current main 070dc2becd74419e76303ede84b465ed4a69461f and Tau Ceti current main a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039. Later current-main declarations are cited through the parent roadmap; they are not misreported as pinned declarations.
