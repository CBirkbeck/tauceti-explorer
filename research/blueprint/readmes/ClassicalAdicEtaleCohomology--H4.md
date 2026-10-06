# The classical analytic cohomology inputs to diamonds: H4–H5

This part supplies classical analytic cohomology to the diamond roadmap. H4 treats smooth proper-support images, discs, annuli, the punctured disc, and the coordinate-root towers used in geometric field-pair invariance. H5 supplies proper and finite-type algebraic/analytic comparison, the finite-dimensional ball argument, and the curve compactification and boundary reduction used in local duality. The objects are classical analytic spaces or pseudo-adic subspaces, with their analytic étale sites. Theorems about diamond direct images, cohomological smoothness, or Verdier biduality remain with their consumers.

The accepted RS-05 restructuring keeps both layers and determines their boundaries. R1 owns scheme analytification, scheme/adic fibre products, and proper coherent GAGA. R2 owns formal schemes, formal completion, admissible blow-ups, and generic fibres. A2 supplies relative polydiscs and the needed geometric identifications. H0 owns ordinary analytic étale sheaves, constructibility, Kummer sequences, derived cohomology, and site continuity. H1 supplies the actual henselian comparisons and valuation specialization exports; H2 supplies surjective geometric field-pair invariance; H3 supplies proper-support operations, curve traces, and curve duality. These are imported with their exact hypotheses. Their appearance in a proof does not give H4 or H5 a second implementation of them.

The pinned audit marks H4 and H5 not built. The baseline is Tau Ceti f790474821cf4256814db967cb154e7af3d0c369 and Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174. Tau Ceti already has Spa as a set of continuous valuative relations bounded on a plus subring, rational subsets and their membership API, closed polydiscs as valuation sets of restricted series, and classical evaluation points. Mathlib has the strict valuative relation and cohomology of abelian sheaves on an already specified site. Those facts are baseline citations rather than new targets. Neither source tree at these commits supplies the analytic étale site, the category of ringed adic spaces needed here, or Huber’s comparison and finiteness theorems.

## Conventions and the interfaces that matter

A geometric nonarchimedean field C is complete, algebraically closed and nontrivially valued. Its maximal ring of integers is O_C. An affinoid field pair Spa(C,C⁺) can instead carry a smaller admissible open bounded valuation ring C⁺. Such a change changes its higher-rank points. A surjective extension of field pairs requires C′⁺∩C=C⁺, as in the H2 criterion; the map from Spa(C,O_C) to Spa(C,C⁺) is generally not surjective. The radial calculation over the latter base requires a specialization/overconvergence theorem in addition to H2 invariance.

For Λ=ℤ/n, n is a positive integer. The disc, annulus, tame tower and analytic smooth-duality calculations require n invertible in O_C: prime to the residue characteristic exponent. In contrast, Huber’s proper comparison permits every torsion ring, and his finite-type comparison requires n prime to the characteristic of the field. In characteristic zero that second condition permits residue-characteristic torsion. These domains must stay separate. In mixed characteristic, the much larger p-torsion cohomology of an analytic disc does not contradict the algebraic comparison theorem for a whole analytified algebraic variety. Berkovich Remark 6.4.2 records the relevant wild-coefficient warning.

Cohomological degree q is nonnegative for sheaf cohomology. A displayed Λ(−1) is the inverse Tate twist, not a preferred copy of Λ. The annulus coordinate gives a canonical class in H¹(A,μ_n); identifying this with an untwisted ℤ/n basis requires choosing a trivialization of μ_n. Proper support means the H3 relative functor Rf_!, including its compactification and extension-by-zero convention. It is not support in a compact Hausdorff subset of the underlying valuation space. The H3 residue formula also fixes the signs of the boundary contributions, so changing annular orientation cannot silently change the trace.

There are two distinct uses of limits. For a genuine increasing analytic open cover B_j of X, global sections give a derived inverse limit RΓ(X,F)≃Rlim_j RΓ(B_j,F). Restriction runs from a larger ball to a smaller ball. Neighborhood continuity of an overconvergent sheaf instead gives a filtered direct limit over neighborhoods shrinking toward a fixed ball. Algebraic finite-stage approximation of a perfectoid space uses a colimit-presented analytic tilde-limit and descent of coefficients. An inverse limit of point sets, by itself, proves none of these assertions.

All valuative inequalities are interpreted at every rank. A weak radial annulus is a rational adic domain even though it is called closed in Berkovich terminology. A strict predicate at an endpoint need not define an analytic open subset. Ito’s Appendix A.1 gives the rank-two refinements η(r), η(r)′ of the radius-r Gauss point: an infinitesimal strict inequality can hold although no strictly interior constant radius separates the point from the endpoint. Accordingly the analytic open disc and annulus below are unions of rational radial domains; the strict-valuative annulus is a separate set. This distinction is needed by the cohomological exhaustion and boundary arguments. [Ito, Appendix A.1](https://arxiv.org/pdf/2008.07794)

## H4. Constructibility in curve families and annulus computations

The relative-ball application starts at a finite-type approximating base. Apply smooth constructibility there, then pull the resulting finite all-point constructible stratification to the perfectoid base. Identification with a classical direct image at the nonnoetherian limit is a separate contract. The proof of diamond cohomological smoothness uses its own base-change theorem at that step; it is not a proof of classical nonnoetherian base change.

The radial computations supply both groups and maps. Tame classification, the H0 Kummer sequence, H3 degree/residue normalization, and the H3 curve vanishing theorem jointly give the annulus class. The important map sends that class to e times the class of a root coordinate under T=S^e. An ℓ-root stage therefore kills degree one modulo ℓ. A p-root stage, with ℓ≠p, acts invertibly and does not kill it. This is the mechanism needed in ECD 19.5, rather than a statement that perfection alone makes annuli acyclic. [Scholze, §19](https://people.mpim-bonn.mpg.de/scholze/EtCohDiamonds.pdf)

### The closed-disc radial locus

For a commutative topological ring A, an explicit plus subring A⁺, coordinate T and outer radius representative b, closedDisc(A⁺,T,b) is the set of continuous valuations bounded by one on A⁺ and satisfying T≤ᵥb. It is a subset of the pinned Spa set. With b a unit it agrees with the pinned rationalSubset(A⁺,{T},b). For a Tate-algebra coordinate and a nonzero constant radius it is the underlying set of the analytic closed disc supplied by A2. Valuative comparison retains every rank.

The proposed declaration is `Radial.closedDisc`.

The API serves the following uses. ECD Theorem 19.5 proof: Annulus inequalities and roots of its invertible coordinate determine the base-field tower calculation. ECD Theorem 24.1; Proposition 27.2: Identify balls and their actual inclusions without turning higher-rank valuation inequalities into real radii. H5 curve-boundary calculation: Distinguish a boundary circle from the strict annulus it bounds.

Its interface consists of:

- `Radial.mem_closedDisc` (characterisation): x belongs iff x∈Spa(A,A⁺) and T≤ᵥb.

- `Radial.closedDisc_eq_rational` (compatibility): For a unit b, closedDisc equals the pinned rationalSubset(A⁺,{T},b).

- `Radial.baseChange` (functoriality): For a continuous plus-preserving ring map φ:A→B, comap(φ)⁻¹(closedDisc(A⁺,T,b))∩Spa(B,B⁺)=closedDisc(B⁺,φ(T),φ(b)); the intersection specifies the domain Spa.


The unit tests distinguish the intended construction:

- `Radial.zero_coordinate` (degenerate): For v∈Spa(A,A⁺) and unit b, v∈closedDisc(A⁺,0,b).

- `Radial.unit_radius` (compatibility): closedDisc(A⁺,T,1) equals rationalSubset(A⁺,{T},1).

- `Radial.classical_point` (computation): For the pinned classicalPoint at a power-bounded coordinate c over a complete Hausdorff nonarchimedean ring, unit-disc membership is the base point comparison c≤ᵥ1. The exact evaluation comparison is the pinned classicalPoint_vle; no field assumption is needed for this disc test.



Construction or proof. Intersect the pinned Spa set with T≤ᵥb. For unit b the rational-subset denominator is outside every valuation support, giving the pinned rationalSubset equality. A continuous plus-preserving ring map gives the comap identity inside its domain Spa; R0/A2 supplies the geometric interpretation.

The external interface is `tauceti:TauCeti.ValuationSpectrum.spa`, `tauceti:TauCeti.ValuationSpectrum.mem_rationalSubset_iff`, `mathlib:ValuativeRel.vlt`, `AdicEtaleGeometry:A2/relative-closed-polydisc`.

Acceptance: Check weak versus strict boundaries on a rank-two valuation; compare the closed unit disc with the pinned closedPolydisc set.

Source: [Kazuhiro Ito, pp. 35,37: B(ε), B(a,b), D(ε)](https://arxiv.org/pdf/2008.07794); [Vladimir G. Berkovich, §6.3, before Theorem 6.3.5, p. 121](https://www.wisdom.weizmann.ac.il/~vova/IHES_1993_78_etale.pdf).

### The punctured-disc radial locus

puncturedDisc(A⁺,T,b) is closedDisc(A⁺,T,b) intersected with the complement of support(T): T is not ≤ᵥ0. In a geometric one-variable disc this removes the closed analytic origin. It is an open analytic subspace once A2 identifies the locus; it is not the complement of an entire reduction fibre.

The proposed declaration is `Radial.puncturedDisc`.

The API serves the following uses. ECD Theorem 19.5 proof: Annulus inequalities and roots of its invertible coordinate determine the base-field tower calculation. ECD Theorem 24.1; Proposition 27.2: Identify balls and their actual inclusions without turning higher-rank valuation inequalities into real radii. H5 curve-boundary calculation: Distinguish a boundary circle from the strict annulus it bounds.

Its interface consists of:

- `Radial.mem_puncturedDisc` (characterisation): Membership is closed-disc membership and T outside the valuation support.

- `Radial.puncturedDisc_subset_closedDisc` (relation): The punctured-disc locus is contained in its outer closed disc.

- `Radial.puncturedDisc_eq_diff` (compatibility): It equals closedDisc minus {v | T≤ᵥ0}, the support locus defined by the pinned valuative relation.


The unit tests distinguish the intended construction:

- `Radial.puncture_zero` (degenerate): puncturedDisc(A⁺,0,b) is empty for every b.

- `Radial.puncture_unit` (computation): puncturedDisc(A⁺,1,1)=Spa(A,A⁺).

- `Radial.puncture_support` (non-example): A valuation with T≤ᵥ0 does not belong to puncturedDisc, even if it satisfies the outer bound.



Construction or proof. Intersect the ambient Spa with the indicated valuative inequalities; exclude support(T) for punctured and annular regions. Apply the pinned rationalSubset membership API for the closed disc and both rational inequalities of a closed annulus. Transport a radius by rescaling T using a chosen nonzero constant; obtain the analytic ring and open subspace from A2/R0.

Within this part it uses The closed-disc radial locus.

Acceptance: Check weak versus strict boundaries on a rank-two valuation; compare the closed unit disc with the pinned closedPolydisc set.

Source: [Kazuhiro Ito, pp. 35,37: B(ε), B(a,b), D(ε)](https://arxiv.org/pdf/2008.07794); [Vladimir G. Berkovich, §6.3, before Theorem 6.3.5, p. 121](https://www.wisdom.weizmann.ac.il/~vova/IHES_1993_78_etale.pdf).

### The closed-annulus radial locus

closedAnnulus(A⁺,T,a,b) consists of v∈Spa(A,A⁺) with a≤ᵥT≤ᵥb and T outside support. For units a,b it is R({T}/b)∩R({a}/T). Standard analytic annuli have nonzero constant representatives with 0<|a|≤|b|. Equality of radii gives a boundary circle and is allowed. The affinoid presentation is imported from A2.

The proposed declaration is `Radial.closedAnnulus`.

The API serves the following uses. ECD Theorem 19.5 proof: Annulus inequalities and roots of its invertible coordinate determine the base-field tower calculation. ECD Theorem 24.1; Proposition 27.2: Identify balls and their actual inclusions without turning higher-rank valuation inequalities into real radii. H5 curve-boundary calculation: Distinguish a boundary circle from the strict annulus it bounds.

Its interface consists of:

- `Radial.mem_closedAnnulus` (characterisation): Membership is Spa membership, both weak inequalities and T outside support.

- `Radial.closedAnnulus_eq_inter` (compatibility): For units a,b, the locus is rationalSubset(A⁺,{T},b)∩rationalSubset(A⁺,{a},T).

- `Radial.closedAnnulus_subset_puncturedDisc` (relation): Every closed-annulus point lies in the punctured outer disc.


The unit tests distinguish the intended construction:

- `Radial.annulus_zero` (non-example): closedAnnulus(A⁺,0,a,b) is empty.

- `Radial.annulus_unit_circle` (computation): closedAnnulus(A⁺,1,1,1)=Spa(A,A⁺).

- `Radial.annulus_rational` (compatibility): For unit a,b, compare the locus exactly with the intersection of the two pinned rational subsets.



Construction or proof. Intersect the ambient Spa with the indicated valuative inequalities; exclude support(T) for punctured and annular regions. Apply the pinned rationalSubset membership API for the closed disc and both rational inequalities of a closed annulus. Transport a radius by rescaling T using a chosen nonzero constant; obtain the analytic ring and open subspace from A2/R0.

Within this part it uses The closed-disc radial locus, The punctured-disc radial locus.

The external interface is `tauceti:TauCeti.ValuationSpectrum.mem_rationalSubset_iff`.

Acceptance: Check weak versus strict boundaries on a rank-two valuation; compare the closed unit disc with the pinned closedPolydisc set.

Source: [Kazuhiro Ito, pp. 35,37: B(ε), B(a,b), D(ε)](https://arxiv.org/pdf/2008.07794); [Vladimir G. Berkovich, §6.3, before Theorem 6.3.5, p. 121](https://www.wisdom.weizmann.ac.il/~vova/IHES_1993_78_etale.pdf).

### The strict-valuative annulus locus

strictAnnulus(A⁺,T,a,b) imposes a<ᵥT<ᵥb and T outside support on Spa(A,A⁺); strict means the negation of the reverse weak comparison, as in Mathlib ValuativeRel.vlt. It is the locus with strict bounds at every rank. A strict-valuative locus is not asserted to be an open subset of the adic topology: topology and the corresponding pseudo-adic/support convention are supplied by A2/H0. In geometric Berkovich or rigid terminology the associated region is called an open annulus; the words open and closed in radial terminology do not determine adic topological openness.

The proposed declaration is `Radial.strictAnnulus`.

The API serves the following uses. ECD Theorem 19.5 proof: Annulus inequalities and roots of its invertible coordinate determine the base-field tower calculation. ECD Theorem 24.1; Proposition 27.2: Identify balls and their actual inclusions without turning higher-rank valuation inequalities into real radii. H5 curve-boundary calculation: Distinguish a boundary circle from the strict annulus it bounds.

Its interface consists of:

- `Radial.mem_strictAnnulus` (characterisation): Membership is Spa membership, both strict comparisons and T outside support.

- `Radial.strictAnnulus_subset_closedAnnulus` (relation): The strict-annulus locus lies in the weak-annulus locus.

- `Radial.strictAnnulus_vlt` (compatibility): Membership equals Spa membership, a<ᵥT and T<ᵥb in the pinned ValuativeRel.vlt convention, and T outside support.


The unit tests distinguish the intended construction:

- `Radial.equal_radii` (degenerate): strictAnnulus(A⁺,T,a,a)=∅; equality of radii must not produce the weak circle.

- `Radial.strict_annulus_zero` (non-example): strictAnnulus(A⁺,0,a,b)=∅.

- `Radial.strict_annulus_boundary` (compatibility): A valuation equivalent in value on T and a is excluded by the inner strict bound, including a higher-rank refinement with that exact equivalence.



Construction or proof. Intersect the ambient Spa with the indicated valuative inequalities; exclude support(T) for punctured and annular regions. Apply the pinned rationalSubset membership API for the closed disc and both rational inequalities of a closed annulus. Transport a radius by rescaling T using a chosen nonzero constant; obtain the analytic ring and open subspace from A2/R0.

Within this part it uses The closed-annulus radial locus.

The external interface is `mathlib:ValuativeRel.vlt`.

Acceptance: Check weak versus strict boundaries on a rank-two valuation; compare the closed unit disc with the pinned closedPolydisc set.

Source: [Kazuhiro Ito, pp. 35,37: B(ε), B(a,b), D(ε)](https://arxiv.org/pdf/2008.07794); [Vladimir G. Berkovich, §6.3, before Theorem 6.3.5, p. 121](https://www.wisdom.weizmann.ac.il/~vova/IHES_1993_78_etale.pdf).

### The analytic open-annulus exhaustion

Given inner and outer radius representatives a_j,b_j, define openAnnulus(A⁺,T,a,b)=⋃_j closedAnnulus(A⁺,T,a_j,b_j). Under 0<r<|a_j|≤|b_j|<R, with inner radii decreasing to r and outer radii increasing to R and nested domains, this is the inherited analytic open annulus, including every rank allowed by its union topology. It is not defined as the single strict-valuative locus r<|T|<R. Rank-two points infinitesimally inside an endpoint can satisfy the latter while their rank-one generalization lies at that endpoint and they are absent from this union.

The proposed declaration is `Radial.openAnnulus`.

The API serves the following uses. ECD Theorem 19.5 proof: Annulus inequalities and roots of its invertible coordinate determine the base-field tower calculation. ECD Theorem 24.1; Proposition 27.2: Identify balls and their actual inclusions without turning higher-rank valuation inequalities into real radii. H5 curve-boundary calculation: Distinguish a boundary circle from the strict annulus it bounds.

Its interface consists of:

- `Radial.mem_openAnnulus` (characterisation): Membership means membership in one closed-annulus stage.

- `Radial.closedAnnulus_subset_openAnnulus` (relation): Every stage is contained in the union.

- `Radial.openAnnulus_constant` (simp): Constant inner and outer representative families give the same closed-annulus locus, not an automatically strict annulus.


The unit tests distinguish the intended construction:

- `Radial.open_annulus_constant` (degenerate): With a_j=b_j=1 and T=1 the union is Spa(A,A⁺), so the family hypotheses cannot be omitted from analytic openness.

- `Radial.open_annulus_zero` (non-example): The open-annulus union with coordinate T=0 is empty.

- `Radial.open_annulus_stage` (compatibility): A point belongs to this union iff one of the exact pinned rational annulus intersections contains it, when each a_j,b_j is a unit.



Construction or proof. Take the union of the existing rational closed radial domains. Import the A2 identification of this union with the analytic open region; use the union topology rather than the strict-valuative predicate at a single endpoint.

Within this part it uses The closed-annulus radial locus.

The external interface is `AdicEtaleGeometry:A2`.

Acceptance: Check the rank-two specialization η(r) in Ito20 Appendix A: strict valuation comparison at an endpoint can include a point that no strictly interior rational radius captures.

Source: [Kazuhiro Ito, Appendix A.1, pp.46–47; definitions of η(r),η(r)′ and Example A.1](https://arxiv.org/pdf/2008.07794); [Vladimir G. Berkovich, §6.3, disc and annulus conventions](https://www.wisdom.weizmann.ac.il/~vova/IHES_1993_78_etale.pdf).

### The analytic open-disc exhaustion

For a radius family b_j, define openDisc(A⁺,T,b)=⋃_j closedDisc(A⁺,T,b_j). If 0<|b_j|<R increases cofinally to R with nested rational domains, A2 identifies this union with the analytic open disc of outer radius R. A predicate |T|<R at every valuation rank is a different pseudo-adic subset and is not substituted for this open space.

The proposed declaration is `Radial.openDisc`.

The API serves the following uses. ECD Theorem 19.5 proof: Annulus inequalities and roots of its invertible coordinate determine the base-field tower calculation. ECD Theorem 24.1; Proposition 27.2: Identify balls and their actual inclusions without turning higher-rank valuation inequalities into real radii. H5 curve-boundary calculation: Distinguish a boundary circle from the strict annulus it bounds.

Its interface consists of:

- `Radial.mem_openDisc` (characterisation): Membership is membership in one closed-disc stage.

- `Radial.closedDisc_subset_openDisc` (relation): Every closed-disc stage lies in the union.

- `Radial.openDisc_constant` (simp): A constant radius family gives the associated closed-disc locus.


The unit tests distinguish the intended construction:

- `Radial.open_disc_constant` (degenerate): A constant radius-one family gives the unit closed-disc locus.

- `Radial.open_disc_zero` (computation): For a nonzero unit radius family and v∈Spa, T=0 lies in every stage and hence in the union.

- `Radial.open_disc_rational` (compatibility): For unit representatives b_j the union equals ⋃_j rationalSubset(A⁺,{T},b_j).



Construction or proof. Take the union of the existing rational closed radial domains. Import the A2 identification of this union with the analytic open region; use the union topology rather than the strict-valuative predicate at a single endpoint.

Within this part it uses The closed-disc radial locus.

The external interface is `AdicEtaleGeometry:A2`.

Acceptance: Check the rank-two specialization η(r) in Ito20 Appendix A: strict valuation comparison at an endpoint can include a point that no strictly interior rational radius captures.

Source: [Kazuhiro Ito, Appendix A.1, pp.46–47; definitions of η(r),η(r)′ and Example A.1](https://arxiv.org/pdf/2008.07794); [Vladimir G. Berkovich, §6.3, disc and annulus conventions](https://www.wisdom.weizmann.ac.il/~vova/IHES_1993_78_etale.pdf).

### Tame covers of discs and annuli

Over algebraically closed complete nonarchimedean C with residue characteristic exponent p, every tame finite étale Galois cover of a geometric disc is trivial. Tameness is required at all geometric points; arbitrary finite étale covers need not be tame.

The proposed declaration is `tameDiscCover_trivial`.

Construction or proof. Use Berkovich 6.3.2 to split the disc branches. Apply 6.3.5 to the boundary circle and extend across the skeleton and disc branches. Translate only overconvergent finite locally constant sheaves through the taut adic/Berkovich comparison imported from H3.

Within this part it uses The closed-disc radial locus, The analytic open-disc exhaustion.

The external interface is `ClassicalAdicEtaleCohomology:H3/berkovich-taut-comparison`.

Acceptance: Degree-one cover is the identity; z↦z^ℓ is nontrivial for ℓ≠p; do not infer triviality of wild disc covers.

Source: [Vladimir G. Berkovich, Theorems 6.3.2,6.3.5, pp. 119–122](https://www.wisdom.weizmann.ac.il/~vova/IHES_1993_78_etale.pdf).

### Tame Kummer covers of closed annuli

Over the same C, every connected tame finite étale Galois cover of a strict closed annulus A(r,R), 0<r≤R, is a standard Kummer cover z↦z^e from A(r^(1/e),R^(1/e)), with e prime to p. Equality r=R is allowed. This classifies tame Galois covers, not all finite étale covers.

The proposed declaration is `tameAnnulusCover_kummer`.

Construction or proof. Use Berkovich 6.3.2 to split the disc branches. Apply 6.3.5 to the boundary circle and extend across the skeleton and disc branches. Translate only overconvergent finite locally constant sheaves through the taut adic/Berkovich comparison imported from H3.

Within this part it uses The closed-annulus radial locus, Tame covers of discs and annuli.

The external interface is `ClassicalAdicEtaleCohomology:H3/berkovich-taut-comparison`.

Acceptance: Degree-one cover is the identity; z↦z^ℓ is nontrivial for ℓ≠p; do not infer triviality of wild disc covers.

Source: [Vladimir G. Berkovich, Theorems 6.3.2,6.3.5, pp. 119–122](https://www.wisdom.weizmann.ac.il/~vova/IHES_1993_78_etale.pdf).

### The annulus Kummer generator

For a strict closed annulus A over C and n≥1 prime to the residue characteristic, define annulusKummer(T)=δ_n(T)∈H¹(A,μ_n), using the H0 Kummer connecting map and the invertible annulus coordinate. The degree map identifies H¹(A,μ_n) with ℤ/n, sending δ_n(T) to 1. This identification is canonical with a coordinate and μ_n coefficients; identifying H¹(A,ℤ/n) with ℤ/n requires a trivialization of μ_n. The prototype accepts the imported connecting homomorphism; it does not define the étale Kummer sequence anew.

The proposed declaration is `annulusKummer`.

The API serves the following uses. ECD Theorem 19.5: Controls the maps in the field-extension colimit. H4 annulus restriction and H5 boundary contributions: Fixes the basis, Tate twist and degree of the transition maps.

Its interface consists of:

- `annulusKummer_natural` (functoriality): For an annulus map g, pullback δ_n(T)=δ_n(g* T).

- `annulusKummer_pow` (compatibility): δ_n(S^e)=e·δ_n(S).

- `annulusKummer_mul_nthPower` (simp): δ_n(T·u^n)=δ_n(T).

- `annulusKummer_degree` (characterisation): Under the degree isomorphism to ℤ/n, δ_n(T) maps to 1.

- `annulusKummer_coordinateScale` (compatibility): Replacing T by cT for c∈C× leaves the μ_n class unchanged since c has an n-th root.


The unit tests distinguish the intended construction:

- `annulusKummer_one` (degenerate): The class of the unit coordinate 1 is zero.

- `annulusKummer_power` (computation): Under T=S^e, the pulled back coordinate class is e times the S-class; for e=n it is zero.

- `annulusKummer_nthPower` (compatibility): Multiplying the coordinate by an n-th power preserves its class.

- `annulusKummer_disc_origin` (non-example): The coordinate on an unpunctured disc is not a unit at the origin, so this annulus construction cannot take it as input.



Construction or proof. Import δ_n and its naturality from H0. Use the tame cover classification and the circle degree/residue API from H3 to identify the coordinate class. Apply functoriality to powers and multiplication by n-th powers; constants have roots over C.

Within this part it uses Tame covers of discs and annuli, Tame Kummer covers of closed annuli.

The external interface is `ClassicalAdicEtaleCohomology:H0/kummer-sequence`, `ClassicalAdicEtaleCohomology:H3/local-residue-degree-formula`, `mathlib:CategoryTheory.Sheaf.H.map`.

Acceptance: The class with μ_n coefficients is independent of a chosen primitive root; untwisting changes the basis.

Source: [Peter Scholze, Theorem 19.5 proof, p. 112](https://people.mpim-bonn.mpg.de/scholze/EtCohDiamonds.pdf); [Vladimir G. Berkovich, §6.2 circle-unit and degree calculation, pp. 113–118](https://www.wisdom.weizmann.ac.il/~vova/IHES_1993_78_etale.pdf).

### Prime-to-residue-characteristic disc cohomology

For a nonempty geometric closed disc D over Spa(C,O_C), C algebraically closed complete nontrivially valued and Λ=ℤ/n with n invertible in O_C, H⁰(D,Λ)=Λ and H^q(D,Λ)=0 for q>0. The geometric analytic open-disc union has the same groups by compatible exhaustion and derived continuity. The strict-valuative pseudo-adic subset at a fixed endpoint is not identified with that open union.

The proposed declaration is `disc_cohomology`.

Construction or proof. Use trivial tame disc covers and H3 cohomological vanishing to obtain the closed-disc calculation. Use exhaustion by closed subdiscs, the derived inverse-limit/continuity supplier and constant restriction maps for the open disc. Import relative-ball compact support and the H3 trace; apply rescaling and the compatible exhaustion for open discs.

Within this part it uses The closed-disc radial locus, The analytic open-disc exhaustion, Tame covers of discs and annuli.

The external interface is `ClassicalAdicEtaleCohomology:H3/curve-cohomology-finiteness`, `EnhancedDerivedSheaves:E1`.

Acceptance: For Λ=Fℓ the dimensions are (1,0,…) and compact dimensions (0,0,1); mixed characteristic ℓ=p is excluded.

Source: [Vladimir G. Berkovich, Theorem 6.3.2; Remark 6.2.10; §6.4](https://www.wisdom.weizmann.ac.il/~vova/IHES_1993_78_etale.pdf).

### Disc cohomology with proper support

Under the same geometric disc and prime-to-residue coefficient hypotheses, H^q_c(D,Λ)=Λ(−1) for q=2 and zero otherwise, for the H3 relative proper-support convention. The trace on μ_n identifies degree two with Λ. The analytic open-disc version uses the genuine rational exhaustion. Compact support here is not compact support in a compact Hausdorff space.

The proposed declaration is `disc_compactSupport`.

Construction or proof. Use trivial tame disc covers and H3 cohomological vanishing to obtain the closed-disc calculation. Use exhaustion by closed subdiscs, the derived inverse-limit/continuity supplier and constant restriction maps for the open disc. Import relative-ball compact support and the H3 trace; apply rescaling and the compatible exhaustion for open discs.

Within this part it uses Prime-to-residue-characteristic disc cohomology.

The external interface is `ClassicalAdicEtaleCohomology:H3/relative-ball-compact-support`, `ClassicalAdicEtaleCohomology:H3/lower-shriek-quasi-compact-exhaustion`.

Acceptance: For Λ=Fℓ the dimensions are (1,0,…) and compact dimensions (0,0,1); mixed characteristic ℓ=p is excluded.

Source: [Vladimir G. Berkovich, Theorem 6.3.2; Remark 6.2.10; §6.4](https://www.wisdom.weizmann.ac.il/~vova/IHES_1993_78_etale.pdf).

### Prime-to-residue-characteristic annulus cohomology

For a nonempty strict closed annulus A(r,R) over Spa(C,O_C), including r=R, H⁰(A,Λ)=Λ, H¹(A,Λ)=Λ(−1) and H^q(A,Λ)=0 for q>1, where Λ=ℤ/n and n is invertible in O_C. With μ_n coefficients the coordinate Kummer generator maps to 1 under degree. A geometric analytic open annulus, formed as the union of rational subannuli strictly inside its two endpoints, has the same cohomology by derived continuity. Arbitrary plus rings require the separate valuation export.

The proposed declaration is `annulus_cohomology`.

Construction or proof. Use the Kummer degree identification and affinoid-curve higher vanishing to compute H⁰,H¹ and the zero range. Naturality sends the coordinate class to the identical coordinate class under radius restriction; connectedness gives the degree-zero identity. Use H3 curve duality and finiteness for compact-support groups and their twists; for open annuli use the two distinct exhaustion functors.

Within this part it uses The closed-annulus radial locus, The analytic open-annulus exhaustion, The annulus Kummer generator.

The external interface is `ClassicalAdicEtaleCohomology:H3/curve-cohomology-finiteness`, `EnhancedDerivedSheaves:E1`.

Acceptance: For Fℓ the dimensions are (1,1,0,…); choosing a primitive root only untwists the generator; the circle case is retained.

Source: [Peter Scholze, Theorem 19.5 proof, p. 112](https://people.mpim-bonn.mpg.de/scholze/EtCohDiamonds.pdf); [Vladimir G. Berkovich, Theorem 6.3.5; §§6.2,7.3](https://www.wisdom.weizmann.ac.il/~vova/IHES_1993_78_etale.pdf).

### Annulus cohomology with proper support

For a nonempty geometric annulus and Λ=ℤ/n prime to residue characteristic, H¹_c(A,Λ)=Λ and H²_c(A,Λ)=Λ(−1), with all other proper-support groups zero. Use the H3 trace and curve duality convention, including the boundary residue signs. For analytic open annuli use the genuine rational exhaustion and the lower-shriek colimit theorem.

The proposed declaration is `annulus_compactSupport`.

Construction or proof. Use the Kummer degree identification and affinoid-curve higher vanishing to compute H⁰,H¹ and the zero range. Naturality sends the coordinate class to the identical coordinate class under radius restriction; connectedness gives the degree-zero identity. Use H3 curve duality and finiteness for compact-support groups and their twists; for open annuli use the two distinct exhaustion functors.

Within this part it uses Prime-to-residue-characteristic annulus cohomology.

The external interface is `ClassicalAdicEtaleCohomology:H3/curve-duality-perfect-pairing`, `ClassicalAdicEtaleCohomology:H3/curve-cohomology-finiteness`, `ClassicalAdicEtaleCohomology:H3/lower-shriek-quasi-compact-exhaustion`.

Acceptance: For Fℓ the dimensions are (1,1,0,…); choosing a primitive root only untwists the generator; the circle case is retained.

Source: [Peter Scholze, Theorem 19.5 proof, p. 112](https://people.mpim-bonn.mpg.de/scholze/EtCohDiamonds.pdf); [Vladimir G. Berkovich, Theorem 6.3.5; §§6.2,7.3](https://www.wisdom.weizmann.ac.il/~vova/IHES_1993_78_etale.pdf).

### Restriction between concentric annuli

With the preceding geometric and coefficient hypotheses, restriction from a closed annulus to any nonempty concentric closed subannulus is an isomorphism in every cohomological degree. In degree one with μ_n coefficients it preserves the class δ_n(T) of the same coordinate. The coordinate degree, rather than abstract equality of dimensions, determines this actual map.

The proposed declaration is `annulus_restrict_isIso`.

Construction or proof. Use the Kummer degree identification and affinoid-curve higher vanishing to compute H⁰,H¹ and the zero range. Naturality sends the coordinate class to the identical coordinate class under radius restriction; connectedness gives the degree-zero identity. Use H3 curve duality and finiteness for compact-support groups and their twists; for open annuli use the two distinct exhaustion functors.

Within this part it uses Prime-to-residue-characteristic annulus cohomology, The annulus Kummer generator.

Acceptance: For Fℓ the dimensions are (1,1,0,…); choosing a primitive root only untwists the generator; the circle case is retained.

Source: [Peter Scholze, Theorem 19.5 proof, p. 112](https://people.mpim-bonn.mpg.de/scholze/EtCohDiamonds.pdf); [Vladimir G. Berkovich, Theorem 6.3.5; §§6.2,7.3](https://www.wisdom.weizmann.ac.il/~vova/IHES_1993_78_etale.pdf).

### Punctured-disc cohomology and the localization map

For D×=D∖{0}, with D a nonempty geometric disc containing the closed analytic origin and Λ=ℤ/n invertible in O_C, H⁰(D×,Λ)=Λ, H¹(D×,Λ)=Λ(−1) and H^q=0 for q>1. The degree-one class is δ_n(T). Also H¹_c(D×,Λ)=Λ and H²_c(D×,Λ)=Λ(−1), with other degrees zero. Compute by annular exhaustion and the H3 support triangle, keeping the analytic puncture rather than an entire reduction fibre.

The proposed declaration is `puncturedDisc_cohomology`.

Construction or proof. Exhaust the punctured disc by nonempty concentric closed annuli. Apply annulus restriction isomorphisms and the derived inverse-limit supplier. Use H3 open/closed proper-support triangle, the closed-point calculation, and disc compact support to calculate the boundary map.

Within this part it uses The punctured-disc radial locus, Prime-to-residue-characteristic annulus cohomology, Restriction between concentric annuli, Disc cohomology with proper support.

The external interface is `ClassicalAdicEtaleCohomology:H3/lower-shriek-open-closed-triangle`, `EnhancedDerivedSheaves:E1`.

Acceptance: The added origin kills ordinary H¹, and compact support has a nonzero connecting map from that point.

Source: [Vladimir G. Berkovich, §6.3 Corollary 6.3.6 and annulus classification](https://www.wisdom.weizmann.ac.il/~vova/IHES_1993_78_etale.pdf).

### The puncture localization map

In the H3 localization triangle for the closed origin {0}⊂D, with D a geometric disc and prime-to-residue Λ, the canonical boundary H⁰_c({0},Λ)=Λ→H¹_c(D∖{0},Λ)=Λ is an isomorphism. The disc proper-support groups vanish in degrees zero and one, so exactness determines this map.

The proposed declaration is `puncturedDisc_localization`.

Construction or proof. Exhaust the punctured disc by nonempty concentric closed annuli. Apply annulus restriction isomorphisms and the derived inverse-limit supplier. Use H3 open/closed proper-support triangle, the closed-point calculation, and disc compact support to calculate the boundary map.

Within this part it uses Punctured-disc cohomology and the localization map, Disc cohomology with proper support.

The external interface is `ClassicalAdicEtaleCohomology:H3/lower-shriek-open-closed-triangle`.

Acceptance: The added origin kills ordinary H¹, and compact support has a nonzero connecting map from that point.

Source: [Vladimir G. Berkovich, §6.3 Corollary 6.3.6 and annulus classification](https://www.wisdom.weizmann.ac.il/~vova/IHES_1993_78_etale.pdf).

### Tame-root towers kill the annulus class

Let ℓ be prime to residue characteristic p and let an annular coordinate t acquire an ℓ-th root at a higher stage. On H¹(−,Fℓ), pullback multiplies the coordinate generator by ℓ, hence is zero. In a filtered tower cofinal in adjoining such roots, the colimit cohomology is Fℓ in degree 0 and zero in positive degrees. For the ECD 19.5 field tower, the finite extensions L of k((t^(1/p∞))) supply these ℓ-power roots; the limit has trivial positive Fℓ cohomology by H0 continuity. A tower that only adjoins p-power roots has invertible degree-one transitions modulo ℓ and does not kill H¹.

The proposed declaration is `tameRootTower_annulus_acyclic`.

Construction or proof. Apply annulusKummer_pow to the root-coordinate map. Every degree-one class dies after an ℓ-root extension; constant degree-zero classes persist. Apply H0 tilde-limit cohomological continuity. For the ECD higher-rank field-pair realization use the valuation radial export.

Within this part it uses Prime-to-residue-characteristic annulus cohomology, The annulus Kummer generator, Radial exports over geometric field pairs, Restriction between concentric annuli, Annulus cohomology with proper support, Annulus cohomology over a geometric plus ring.

The external interface is `ClassicalAdicEtaleCohomology:H0/tilde-limits-and-cohomological-continuity`, `ClassicalAdicEtaleCohomology:H2/finite-type-approximation-of-perfectoid-affinoids`.

Acceptance: Compare an ℓ-root transition (zero on H¹) with a p-root transition (automorphism on H¹).

Source: [Peter Scholze, Theorem 19.5 proof, p. 112](https://people.mpim-bonn.mpg.de/scholze/EtCohDiamonds.pdf).

### Constructibility of smooth proper-support direct images

Let K be algebraically closed and let f:X→Y be a smooth separated quasi-compact morphism of classical adic spaces over Spa(K,O_K) in Huber’s locally noetherian analytic scope, and F a constructible ℤ/n-sheaf with n invertible in O_K. Then R^q f_!F is constructible for every q≥0. In particular this holds for the relative ball B¹_Y→Y at every finite-type approximating base Y. Constructible means the H0 all-point pseudo-adic locally closed stratification, not merely Zariski-constructible or finite geometric fibres. Finite relative dimension gives the H3 uniform vanishing bound.

The proposed declaration is `smooth_pushforwardShriek_constructible`.

Construction or proof. Use Huber 6.2.2 in the precisely restated public form Ito Theorem 6.8. Its book proof is a source-access gap, so the node does not claim proof closure. Specialize to the relative ball using A2 smoothness and compactifiability. Apply H3 proper-support base change for finite-type changes of base and finite relative cohomological dimension.

The external interface is `ClassicalAdicEtaleCohomology:H0/classical-constructible-sheaves`, `ClassicalAdicEtaleCohomology:H3/proper-support-direct-image`, `ClassicalAdicEtaleCohomology:H3/lower-shriek-base-change`, `ClassicalAdicEtaleCohomology:H3/lower-shriek-cohomological-dimension`, `AdicEtaleGeometry:A2/relative-closed-polydisc`.

Acceptance: Over a geometric point obtain finite groups; a finite constructible stratification is required on a finite-type base; do not claim this for arbitrary nonsmooth maps.

Source: [Kazuhiro Ito, Theorem 6.8 and Remark 6.9, p. 35](https://arxiv.org/pdf/2008.07794); [Peter Scholze, Theorem 24.1 proof, p. 153](https://people.mpim-bonn.mpg.de/scholze/EtCohDiamonds.pdf).

### Constructibility transfer to perfectoid bases

Let Y be a strictly totally disconnected affinoid perfectoid base with a colimit-presented finite-type approximation Y∼lim Y_i and a constructible coefficient descended to the relative ball at stage i. Once the finite-stage smooth constructibility theorem applies over its actual base field, the pullback to Y of every R^qf_{i!}F_i is constructible, by H0 pullback stability. Ito20 verifies the geometric base-field form; the general-K form used in ECD24.1 is explicitly requested. This statement is about the pullback sheaf, and does not yet identify it with a nonnoetherian classical direct image.

The proposed declaration is `perfectoidBase_pullback_constructible`.

Construction or proof. Import finite-type approximation and coefficient descent from P6/H0. Apply finite-stage smooth constructibility when the base is geometric, or the general-K extension explicitly requested from H3/Hub96; then apply pullback stability of constructibility. Use the requested extension of classical proper-support comparison to identify the pullback image when available. S5 may instead use its own diamond base change after the classical input has been supplied.

Within this part it uses Constructibility of smooth proper-support direct images.

The external interface is `ClassicalAdicEtaleCohomology:H0/constructible-sheaves-stability`, `ClassicalAdicEtaleCohomology:H0/tilde-limits-and-cohomological-continuity`, `PerfectoidSpaces:P6`, `ClassicalAdicEtaleCohomology:H3`.

Acceptance: Descended strata pull back to genuine constructible locally closed subsets of the spectral base; no appeal to S5, diamonds or v-descent in the classical proof.

Source: [Peter Scholze, Theorem 24.1 proof, pp. 152–153](https://people.mpim-bonn.mpg.de/scholze/EtCohDiamonds.pdf).

### The perfectoid proper-support image contract

For the same descended relative ball family, the desired canonical isomorphism g*R^qf_{i!}F_i≅R^qf_!g*F_i over the perfectoid base is conditional on the requested classical proper-support base-change/continuity theorem admitting nonnoetherian bases. H3’s current locally noetherian base-change theorem does not cover this case. ECD24.1 uses diamond base change, which belongs to S5 and cannot prove the requested classical contract.

The proposed declaration is `perfectoidBase_image_comparison`.

Construction or proof. Import finite-type approximation and coefficient descent from P6/H0. Apply finite-stage smooth constructibility when the base is geometric, or the general-K extension explicitly requested from H3/Hub96; then apply pullback stability of constructibility. Use the requested extension of classical proper-support comparison to identify the pullback image when available. S5 may instead use its own diamond base change after the classical input has been supplied.

Within this part it uses Constructibility transfer to perfectoid bases, Constructibility of smooth proper-support direct images.

The external interface is `ClassicalAdicEtaleCohomology:H0/constructible-sheaves-stability`, `ClassicalAdicEtaleCohomology:H0/tilde-limits-and-cohomological-continuity`, `PerfectoidSpaces:P6`, `ClassicalAdicEtaleCohomology:H3`.

Acceptance: Descended strata pull back to genuine constructible locally closed subsets of the spectral base; no appeal to S5, diamonds or v-descent in the classical proof.

Source: [Peter Scholze, Theorem 24.1 proof, pp. 152–153](https://people.mpim-bonn.mpg.de/scholze/EtCohDiamonds.pdf).

### Radial exports over geometric field pairs

Let Spa(C′,C′⁺)→Spa(C,C⁺) be a surjective extension of geometric affinoid field pairs, with C′⁺∩C=C⁺. H2 invariance for finite-type affinoids identifies prime-to-residue cohomology of the pulled-back radial affinoids and their inherited support sheaves. Passage from C⁺ to O_C is not generally a surjective extension and is not this theorem.

The proposed declaration is `radial_surjectiveFieldPair_invariance`.

Construction or proof. Import the exact H2 invariance-for-affinoids statement and its supports. Apply it to the same radial inequalities pulled back along the field extension. Obtain the extra specialization-invariance contract from H1 valuation exports/H3 overconvergent radial sheaves; keep its verification gap visible.

Within this part it uses The closed-disc radial locus, The closed-annulus radial locus.

The external interface is `ClassicalAdicEtaleCohomology:H2/invariance-for-affinoids-of-finite-type`, `ClassicalAdicEtaleCohomology:H2/surjectivity-criterion-for-field-pair-extensions`.

Acceptance: A proper rank-two plus subring and O_C are different bases; the map to the rank-two spectrum is not automatically surjective.

Source: [Peter Scholze, Theorem 19.5 proof, p. 112](https://people.mpim-bonn.mpg.de/scholze/EtCohDiamonds.pdf).

### Annulus cohomology over a geometric plus ring

For a geometric annulus over Spa(C,C⁺) with arbitrary admissible open bounded valuation plus ring and prime-to-residue constant coefficients, the needed annulus cohomology agrees with the maximal-plus-ring calculation only after the H1/H3 specialization-invariance and support contract is proved. That contract is an explicit gap. It is required by the actual field tower in ECD19.5 and is not inferred from H2 surjective field-pair invariance.

The proposed declaration is `annulus_geometricPlusRing`.

Construction or proof. Import the exact H2 invariance-for-affinoids statement and its supports. Apply it to the same radial inequalities pulled back along the field extension. Obtain the extra specialization-invariance contract from H1 valuation exports/H3 overconvergent radial sheaves; keep its verification gap visible.

Within this part it uses Prime-to-residue-characteristic annulus cohomology, Annulus cohomology with proper support, Radial exports over geometric field pairs.

The external interface is `ClassicalAdicEtaleCohomology:H1:valuation-exports`, `ClassicalAdicEtaleCohomology:H3`.

Acceptance: A proper rank-two plus subring and O_C are different bases; the map to the rank-two spectrum is not automatically surjective.

Source: [Peter Scholze, Theorem 19.5 proof, p. 112](https://people.mpim-bonn.mpg.de/scholze/EtCohDiamonds.pdf).

## H5. Algebraic/analytic comparison and compactification of smooth curves

Two reviewed comparison identifiers are retained: `H5/proper-comparison-3-7-2` and `H5/comparison-over-nonarchimedean-fields-3-8-1`. Their status as named theorems gives them planets without changing the inherited mathematical statements or locators. Proper coherent GAGA is a geometric input from R1, not the étale comparison theorem. Strict-localization stalks use the appropriate henselized ring and its plus ring, never the original affinoid ring in place of the strict localization.

Mieda’s public proof verifies per-degree finiteness for smooth quasi-compact quasi-separated analytic spaces with the stated prime-to-residue coefficients. The radius argument additionally uses finite total Fℓ cohomology of the polydiscs, explicitly invoked in ECD 27.2. The bounded range is needed so a single neighborhood stage can surject in every nonzero degree. Scaling automorphisms produce equal dimensions; neighborhood continuity supplies surjectivity of the actual restriction maps. Only together do they yield isomorphisms. The cofinal stable radius system then computes analytic affine-space cohomology by a derived inverse limit. Finite-type algebraic/analytic comparison applies in every finite dimension m, which exposes the all-dimension relative duality input in its characteristic-p proof. [Scholze, §27](https://people.mpim-bonn.mpg.de/scholze/EtCohDiamonds.pdf)

The compactification argument has different hypotheses. Lütkebohmert’s Theorem 5.3 is over the fraction field of a complete DVR and is local on the source and étale local on the base. Its proof proceeds through reduced-fibre formal models, infinitesimal completions along special-fibre strata, and approximation into projective parameter spaces. Formal GAGA, general rig-smooth approximation and blow-up invariance remain R2 contracts. The two curve-specific compactifiability predicates are stated here because the extension theorem consumes them. The proof over a global geometric nondiscrete field needs the additional bridge recorded below. [Lütkebohmert, §5](https://gdz.sub.uni-goettingen.de/id/PPN243919689_0468)

### Proper algebraic/analytic direct-image comparison

In the setup of the reviewed Huber 3.7.1–3.7.2 statement, let R be an adic space satisfying the geometric supplier’s hypotheses, S a scheme and R_→S a morphism of locally ringed spaces. Let X,Y be locally finite-type S-schemes, f:X→Y proper, X^ad=X×_S R, Y^ad=Y×_S R and φ_X,φ_Y their étale-site morphisms. For a torsion ring Λ, the canonical base-change transformation φ_Y* R⁺f_*→R⁺f^ad_* φ_X* on D⁺(X_ét,Λ) is an isomorphism. Here φ* denotes inverse image, not direct image. No constructibility or prime-to-residue restriction is imposed. The generality of R is limited by the existence contract of R1; no nonnoetherian extension is silently added.

The proposed declaration is `proper_analyticComparison`.

Construction or proof. Import the universal scheme/adic fibre product and the commuting étale-site square. Reduce to affine S=Spec O_R(R) and affinoid R using scheme proper base change. At a geometric point use the strict localization Spa(B,B⁺) with B strictly henselized at its support, not the original affinoid ring. Use qcqs of f^ad and the H0 higher-image stalk formula; apply H1 proper henselian comparison 3.2.10. Book proof interiors are inherited, not newly verified.

The external interface is `AdicSpacesPartII:R1/scheme-fibre-product-analytification`, `ClassicalAdicEtaleCohomology:H1:henselian/relative-comparison-3-2-9-3-2-12`, `ClassicalAdicEtaleCohomology:H0`, `EtaleDualityAndPerverseSheaves:EDC.0`.

Acceptance: Proper p-torsion over a mixed-characteristic field is allowed; analytification of the identity gives the identity comparison; no coherent GAGA theorem is substituted.

Source: [Roland Huber, Theorem 3.7.2, p. 226; proof and Lemma 3.7.3, p. 227 (inherited reviewed locators)](https://link.springer.com/book/10.1007/978-3-663-09991-8).

### Excision for a proper map and an open isomorphism

For a commutative triangle of k-schemes U→^j X→^g Y with g proper, h=g∘j:U→Y an open immersion, j an open immersion and j(U)=g⁻¹(h(U)), every abelian sheaf F on U^rig_ét has a canonical isomorphism h^rig_!F→Rg^rig_* j^rig_!F. No constructibility, invertibility or finite-stalk condition on F is added. The equality of opens ensures g is an isomorphism above h(U), so the comparison is the identity there.

The proposed declaration is `proper_open_excision`.

Construction or proof. On h(U), restrict to the isomorphism g⁻¹(h(U))≅U. At a geometric point outside h(U), the strict localization remains in the complement, so j_!F pulls back to zero. Use the qcqs higher-image stalk formula from H0; all stalks in the complement vanish.

Within this part it uses Proper algebraic/analytic direct-image comparison.

The external interface is `ClassicalAdicEtaleCohomology:H0/supports-and-extension-by-zero`, `ClassicalAdicEtaleCohomology:H0`.

Acceptance: For g=id, recover extension by zero; omit the inverse-image equality and the statement is not asserted.

Source: [Roland Huber, Lemma 3.8.2 and proof, pp. 228–229 (inherited)](https://link.springer.com/book/10.1007/978-3-663-09991-8).

### Finite-type algebraic/analytic comparison

Let k be a complete nonarchimedean field, X,Y schemes locally of finite type over k, f:X→Y of finite type, n≥1 prime to char(k) when char(k)>0, and F a constructible ℤ/n-sheaf on X_ét. For every q≥0 the canonical map φ_Y* R^q f_*F→R^q f^rig_* φ_X*F is an isomorphism. Unlike smooth analytic duality, this comparison in characteristic zero allows residue-characteristic torsion. The positive-characteristic proof consumes relative smooth duality in every dimension, not merely smooth proper absolute duality or the H3 curve theorem.

The proposed declaration is `finiteType_analyticComparison`.

Construction or proof. Characteristic zero: the recorded Huber proof follows SGA 4 XVI §4 using proper comparison, analytic purity 3.9.1(b), and proper-open excision; request the exact purity/reduction input from H0/H3. Characteristic p: use Berkovich §7.5 generic constructibility and compact-support comparison, then relative analytic duality for smooth pure dimension d, all d, including the locally constant Rf_! condition of 7.4.9. Transfer the Berkovich statement to taut adic spaces for overconvergent analytified sheaves through Zavyalov A.15,A.18,A.19; extend the compactifiable case with H3’s factorization. Stratify and perform noetherian induction as in Berkovich 7.5.1–7.5.3; import scheme finiteness and smooth purity from EDC/L2. The book’s full characteristic-zero reduction remains a gap.

Within this part it uses Proper algebraic/analytic direct-image comparison, Excision for a proper map and an open isomorphism.

The external interface is `AdicSpacesPartII:R1/scheme-fibre-product-analytification`, `ClassicalAdicEtaleCohomology:H3`, `ClassicalAdicEtaleCohomology:H0`, `AdicCoefficientsAndComparisons:L2`, `EtaleDualityAndPerverseSheaves:EDC.2:trace-purity`.

Acceptance: Apply to A^m_C→Spec C for every m≥0, char C=p, ℓ≠p; m=2 must consume the all-dimension supplier. In mixed characteristic compare an algebraic constructible p-torsion sheaf without claiming that an analytic p-torsion disc has the same small cohomology.

Source: [Roland Huber, Theorem 3.8.1 and proof routes, pp. 227–228 (inherited)](https://link.springer.com/book/10.1007/978-3-663-09991-8); [Vladimir G. Berkovich, §7.3 Theorem 7.3.1; §7.4 Theorem 7.4.9; §7.5 Corollary 7.5.3, pp. 134–150](https://www.wisdom.weizmann.ac.il/~vova/IHES_1993_78_etale.pdf); [Bogdan Zavyalov, Appendix A Theorem A.15, Definition A.17, Lemmas A.18–A.19](https://arxiv.org/pdf/2111.01830).

### Constructible cohomology of smooth analytic spaces

Let C be a separably closed complete nonarchimedean field, X a quasi-compact quasi-separated smooth adic space locally of finite type over Spa(C,C⁺), and ℓ a prime distinct from the residue characteristic of C⁺. For every Huber-constructible Fℓ-sheaf F and q≥0, H^q(X,F) is a finite-dimensional Fℓ-vector space. Mieda’s Proposition3.38 proof explicitly supplies this finite-generation assertion for its quasi-compact opens, citing Hub96 Proposition6.1.1 and (1.7.7). The statement concerns each degree; total bounded cohomology on the ECD balls is supplied by the separate verified ball instance. Non-smooth generality is not inferred.

The proposed declaration is `smoothAnalytic_cohomology_finite`.

Construction or proof. Apply the finite-generation assertion for quasi-compact opens in the proof of Mieda Proposition3.38, with the trivial group action and X itself as the quasi-compact stage. Finite generation over Fℓ is finite vector-space dimension. The proposition’s separate assumption about a countable non-qc union is not used to prove this finite-stage claim. The underlying Huber proof remains a source-access leaf; no conclusion about arbitrary nonsmooth spaces or an unbounded total dimension follows from this statement alone.

The external interface is `ClassicalAdicEtaleCohomology:H0/classical-constructible-sheaves`, `AdicEtaleGeometry:A2`, `ClassicalAdicEtaleCohomology:H0`.

Acceptance: Constant coefficients on a geometric point give a one-dimensional degree-zero group; smooth relative dimension is unrestricted. No non-qc finiteness is concluded.

Source: [Yoichi Mieda, §3.3.1 p.12; proof of Proposition3.38 p.20](https://www.ms.u-tokyo.ac.jp/~mieda/pdf/RZ-Zel.pdf).

### Finite total cohomology on analytic polydiscs

For C the completed algebraic closure of F_p((t)), ℓ≠p, m finite and a constructible Fℓ-sheaf A pulled back from finite-dimensional algebraic affine space over F_p, the cohomology of its analytic pullback to each strict closed m-ball over C has finite total Fℓ dimension: each H^q is finite-dimensional and only finitely many q are nonzero. Perfecting coordinates preserves these groups by the requested finite universal-homeomorphism/tilde-limit comparison. This is the exact verified use of Huber Proposition 6.1.1 in ECD 27.2. The maximal statement for all constructible sheaves on general finite-type analytic spaces has a separate source-access gap, so it is not generalized from this use.

The proposed declaration is `closedBall_finiteTotalCohomology`.

Construction or proof. Apply the Huber Proposition 6.1.1 instance explicitly cited in ECD 27.2; inspect the book proof and generality as recorded remaining work. Use H0 continuity and purely inseparable étale invariance to remove p-power roots of coordinates without changing cohomology. Use H3 cohomological-dimension bounds to retain a uniform bounded degree range for the radius argument.

Within this part it uses Constructible cohomology of smooth analytic spaces.

The external interface is `ClassicalAdicEtaleCohomology:H0`, `ClassicalAdicEtaleCohomology:H3`, `AdicEtaleGeometry:A2/relative-closed-polydisc`.

Acceptance: m=0 gives Fℓ in degree zero for constant coefficients; finite in each degree alone is insufficient for simultaneous stabilization.

Source: [Peter Scholze, Proposition 27.2 proof, p. 164, citing Hub96 Proposition 6.1.1](https://people.mpim-bonn.mpg.de/scholze/EtCohDiamonds.pdf).

### The ball exhaustion of analytic affine space

For m finite, C complete nontrivially valued and 0<|t|<1, let B_n^m⊂(A^m_C)^ad be the closed ball defined by |t^n X_i|≤1 for all i, n≥1. These balls increase with n and cover analytic affine space. In characteristic p one also uses positive n∈ℤ[1/p], choosing compatible p-power roots of t, and perfections C⟨(t^n X_i)^(1/p∞)⟩; those roots are part of the input, not formal real powers. The suggested radiusBall signature gives the valuation-set core inside the imported ambient point set X. The full analytification and perfectoid ball are supplied by R1/P5; no set is promoted to an adic space by declaration.

The proposed declaration is `radiusBall`.

The API serves the following uses. ECD Proposition 27.2: Provides actual inclusions for radius-stability and derived-limit calculations. AdicCoefficientsAndComparisons L3/L6: Exports the classical finite-dimensional calculation that the algebraic/diamond comparison consumes.

Its interface consists of:

- `radiusBall_mem` (characterisation): x∈radiusBall(X,t,T,n) iff x∈X and every t^n T_i≤ᵥ1.

- `radiusBall_zero` (simp): At n=0 the coordinate inequalities are T_i≤ᵥ1.

- `radiusBall_mono` (relation): If every x∈X satisfies t≤ᵥ1, radiusBall n⊂radiusBall(n+1).

- `radiusBall_dimensionZero` (simp): With no coordinates the ball is exactly X.

- `radiusBall_polydisc` (compatibility): For n=0 and X the pinned closedPolydisc set with its weightedX coordinates, the radiusBall set equals that closedPolydisc. This set equality does not provide the missing affine-space site.

- `radiusBall_baseChange` (functoriality): Pullback along a compatible point map that preserves coordinate valuation comparisons gives the ball formed from pulled-back t and T.

- `radiusBall_exhaustive` (characterisation): Under the full analytic affine-space hypotheses and topological nilpotence, the union over n≥1 is the whole analytification.


The unit tests distinguish the intended construction:

- `radiusBall_no_coordinates` (degenerate): For Fin 0 coordinates, every ball equals X.

- `radiusBall_unit_scale` (non-example): If t=1, radiusBall n is independent of n; it need not exhaust affine space.

- `radiusBall_unit_polydisc` (compatibility): At n=0 on closedPolydisc, the set is exactly the existing Tau Ceti closedPolydisc.

- `radiusBall_first_step` (computation): For one coordinate, n=1 membership is exactly tT≤ᵥ1; the outer radius is |t|⁻¹, not |t|.



Construction or proof. Use R1 affine-chart analytification and A2’s closed polydisc after rescaling coordinates. Monotonicity follows from |t|<1; any finitely many coordinates are bounded by some |t|^−n, giving the exhaustion. Import the perfectoid completed-series algebra and the étale comparison along coordinate perfection before using the ℤ[1/p] system.

The external interface is `AdicSpacesPartII:R1/scheme-fibre-product-analytification`, `AdicEtaleGeometry:A2/relative-closed-polydisc`, `PerfectoidSpaces:P5`, `tauceti:TauCeti.ValuationSpectrum.closedPolydisc`, `mathlib:ValuativeRel.vlt`.

Acceptance: Increasing exponent enlarges the ball; check the union covers rank-two points using the actual affine-chart topology.

Source: [Peter Scholze, Proposition 27.2 proof, pp. 163–164](https://people.mpim-bonn.mpg.de/scholze/EtCohDiamonds.pdf).

### Stabilization of actual radius restriction maps

With C=completed algebraic closure of F_p((t)), ℓ≠p, m finite and constructible coefficients descended from F_p affine space, the restriction RΓ(B_n,A)→RΓ(B_1,A) is an equivalence for some n>1 in ℤ[1/p] sufficiently close to 1 and for the cofinal geometric sequence of radii n^j obtained by scaling. The proof requires both finite total cohomology and overconvergent neighborhood continuity: colim_{n>1,n→1} H^q(B_n,A)≅H^q(B_1,A). Automorphisms over F_p sending t to t^n yield equal finite dimensions, but they alone do not prove that the restriction maps are isomorphisms. Uniform surjectivity in the finitely many degrees, followed by equal finite cardinality, does.

The proposed declaration is `ballRadius_restriction_isIso`.

Construction or proof. Import neighborhood continuity for overconvergent analytic sheaves; use finite total dimension to choose one neighborhood stage surjective in all nonzero degrees. Scaling automorphisms give equal finite Fℓ dimensions at that stage and B_1; actual surjective restriction maps are therefore bijective. Apply the scaling automorphisms to these maps, retaining their direction, to obtain the cofinal n^j sequence of isomorphisms.

Within this part it uses Finite total cohomology on analytic polydiscs, The ball exhaustion of analytic affine space.

The external interface is `ClassicalAdicEtaleCohomology:H0`, `ClassicalAdicEtaleCohomology:H3`, `EnhancedDerivedSheaves:E1`.

Acceptance: Abstractly isomorphic vector spaces with zero transition maps fail the statement; m=0 and constant coefficients produce identity maps.

Source: [Peter Scholze, Proposition 27.2 proof, p. 164](https://people.mpim-bonn.mpg.de/scholze/EtCohDiamonds.pdf).

### Affine-space cohomology from the stable ball system

Under the preceding F_p descent, finite-dimension and overconvergence hypotheses, RΓ((A^m_C)^ad,A^ad)≅Rlim_j RΓ(B_(n^j),A^ad)≅RΓ(B_1,A^ad). Finite-type algebraic/analytic comparison then identifies RΓ(A^m_C,A) with the last object. Coordinate perfection is admitted only through the imported étale equivalence/continuity. The first limit is derived and inverse, coming from restriction on an increasing open cover; it is distinct from the filtered direct limit over shrinking neighborhoods used to prove stabilization. ECD 27.2’s scheme/diamond fully faithful functor is a consumer theorem, not this node.

The proposed declaration is `affineSpace_ballCohomology`.

Construction or proof. Apply the E1 derived sheaf descent theorem for an increasing countable open cover by these balls. Use actual quasi-isomorphic transitions to evaluate the derived inverse limit; no unexamined R¹lim term remains. Apply comparison 3.8.1 and H0 universal-homeomorphism invariance; export the canonical map and its compatibility, not just equality of dimensions.

Within this part it uses Finite-type algebraic/analytic comparison, Stabilization of actual radius restriction maps, The ball exhaustion of analytic affine space.

The external interface is `EnhancedDerivedSheaves:E1`, `ClassicalAdicEtaleCohomology:H0`.

Acceptance: Test m=2 to detect the missing relative duality input; maintain canonical coefficient and coordinate functoriality.

Source: [Peter Scholze, Proposition 27.2 proof, p. 164](https://people.mpim-bonn.mpg.de/scholze/EtCohDiamonds.pdf).

### S-compactifiable formal curves

Let X→S be a flat admissible formal morphism with smooth rigid curve generic fibre. It is S-compactifiable if, writing U⊂S for its open image, there is an open U-immersion X→C into a flat projective formal U-curve with smooth rigid generic fibre. The property remembers the actual U; projectivity is over U, not automatically over S.

The proposed declaration is `FormalCurve.IsSCompactifiable`.

The API serves the following uses. Lut95 Proposition5.7 and proof of Theorem5.3: Identifies which formal chart compactifications can be enlarged and assembled near the special-fibre strata. H5 compactification/boundary reduction: Separates formal local compactifiability from a global rigid embedding over a geometric nondiscrete field.

Its interface consists of:

- `FormalCurve.compactification_data` (projection): Extract U, the flat projective formal U-curve C, the open immersion and smooth rigid fibres.

- `FormalCurve.compactifiable_baseChange` (functoriality): Admissible formal base change preserves the property when the pulled-back flat morphism and open image satisfy the same contracts.

- `FormalCurve.compactifiable_genericFibre` (compatibility): The generic-fibre map factors as an open immersion into a smooth proper relative rigid curve over U_rig, agreeing with H3 compactifiability.


The unit tests distinguish the intended construction:

- `FormalCurve.projective_curve` (degenerate): A flat projective formal curve with smooth rigid fibres and image S is compactifiable via its identity immersion.

- `FormalCurve.affine_chart` (computation): An affine open chart of the projective formal line over S is S-compactifiable by its given embedding.

- `FormalCurve.generic_factorization` (compatibility): The resulting generic-fibre open/proper factorization satisfies the H3 compactifiable-morphism contract; a merely proper special fibre without that formal embedding is insufficient.



Construction or proof. Use the R2 category of admissible formal schemes and its projective/flat/generic-fibre predicates. Package only the curve-specific existence property; retain the open image of X→S as part of the data.

The external interface is `AdicSpacesPartII:R2`, `ClassicalAdicEtaleCohomology:H3/proper-support-direct-image`.

Acceptance: Boundary is smooth and contained in the ample divisor; distinguish completion along a stratum from the original topology.

Source: [Werner Lütkebohmert, Definition5.6, p.200, public scan](https://gdz.sub.uni-goettingen.de/id/PPN243919689_0468).

### Infinitesimal compactification of relative curves

In Lütkebohmert’s §5 setting over a complete discrete valuation ring R, let X→S be a flat affine morphism of admissible formal schemes with geometrically reduced fibres of pure dimension one. There is a finite locally closed stratification of S_0 and a rig-étale cover S′→S such that the base-changed relative curve has a projective compactification over the completion along every stratum, smooth at infinity. It carries an ample relative Cartier divisor containing infinity, lying in the smooth locus. The generic-fibre meaning of rig-étale and formal completions are imported from R2. These stratum-wise formal compactifications are not yet a rigid compactification of the whole family. Over each completed stratum choose coherent projective flat models on all thickenings: reduced geometric fibres, relative density of the original curve, smooth boundary, and a relative Cartier divisor containing the boundary and lying in the smooth locus (Lemma5.5).

The proposed declaration is `formalCurve_infinitesimalCompactification`.

Construction or proof. Use Lemma 5.5: compactify after a finite radicial residue-field extension, make the boundary étale, and lift the smooth boundary chart and ample Cartier divisor through formal thickenings. Import algebraic normalization/projective curve completion and formal lifting from the named suppliers. Use noetherian induction on the special fibre to obtain the stratification and rig-étale cover, as the proof of 5.4 states.

The external interface is `AdicSpacesPartII:R2`, `AdicCoefficientsAndComparisons:L2`, `tauceti:TauCetiRoadmap/JacobianChallenge#layer-b-coherent-cohomology-over-k-genus-riemannroch-serre-duality`.

Acceptance: Boundary is smooth and contained in the ample divisor; distinguish completion along a stratum from the original topology.

Source: [Werner Lütkebohmert, Proposition 5.4 and Lemma 5.5, pp. 197–199; public pages 00000201–00000203](https://gdz.sub.uni-goettingen.de/id/PPN243919689_0468).

### Locally S-compactifiable formal curves

A flat admissible formal curve X→S with smooth rigid generic fibre is locally S-compactifiable if every closed point x₀ of X₀ has an open formal neighborhood V⊂X that is S-compactifiable in Definition5.6. This is a neighborhood property at closed special-fibre points, not existence of one global projective completion of X.

The proposed declaration is `FormalCurve.IsLocallySCompactifiable`.

The API serves the following uses. Lut95 Proposition5.7 and proof of Theorem5.3: Identifies which formal chart compactifications can be enlarged and assembled near the special-fibre strata. H5 compactification/boundary reduction: Separates formal local compactifiability from a global rigid embedding over a geometric nondiscrete field.

Its interface consists of:

- `FormalCurve.local_compactification_at` (projection): At every closed special-fibre point choose an open neighborhood and its S-compactification.

- `FormalCurve.compactifiable_isLocal` (relation): A global S-compactification implies the local property by restricting its open immersion to neighborhoods.

- `FormalCurve.local_compactifiable_open` (functoriality): The local property restricts to a formal open subcurve, with its inherited open base image.


The unit tests distinguish the intended construction:

- `FormalCurve.global_to_local` (degenerate): A projective smooth formal curve is locally compactifiable.

- `FormalCurve.local_chart` (computation): For an affine open of the formal projective line, the original projective line supplies the neighborhood completion.

- `FormalCurve.local_cover` (characterisation): A formal open cover by S-compactifiable subcurves supplies a witness around every closed special-fibre point; the definition must not demand one common projective completion.



Construction or proof. Use the R2 category of admissible formal schemes and its projective/flat/generic-fibre predicates. Package only the curve-specific existence property; retain the open image of X→S as part of the data.

Within this part it uses S-compactifiable formal curves.

The external interface is `AdicSpacesPartII:R2`.

Acceptance: Boundary is smooth and contained in the ample divisor; distinguish completion along a stratum from the original topology.

Source: [Werner Lütkebohmert, Definition5.6, p.200, public scan](https://gdz.sub.uni-goettingen.de/id/PPN243919689_0468).

### Extension of curve compactifications by approximation

Let R be a complete DVR with fraction field K, X→S a flat affine morphism of admissible formal schemes whose rigid generic fibre is a smooth curve fibration. Let V=Spf B⊂X be faithfully flat over an affine open U=Spf A⊂S, and suppose V is S-compactifiable in the sense of §5. Then after an admissible formal blow-up of S there are an admissible blow-up X′ of the base-changed X and an open formal subscheme V′⊂X′ whose special fibre contains the schematic closure of the inverse image of V_0 and which is S-compactifiable. The use of Hilbert schemes, formal GAGA and Elkik approximation is geometric; those general tools are requested, not redefined at H5.

The proposed declaration is `formalCurve_extendCompactification`.

Construction or proof. Use an ample embedding of the known compactification, keep its Hilbert polynomial fixed, and algebraize it by formal GAGA. Choose the embedding degree d≥2g−1 so the smooth-curve Hilbert parameter open H(d,g,N) is smooth over ℤ (Lemma5.8); the deformation/Serre-duality input is imported from the upstream extension. Apply R2’s requested Lut95 Theorem7.4 and Proposition7.5: retain the relatively compact image and Weierstrass-domain hypotheses, approximate modulo a prescribed uniformizer power and extend after admissible blow-ups, preserving an open immersion on generic fibres.

Within this part it uses Infinitesimal compactification of relative curves, S-compactifiable formal curves, Locally S-compactifiable formal curves.

The external interface is `AdicSpacesPartII:R2`, `PerfectoidSpaces:P3/elkik-noetherian-henselian-approximation`, `tauceti:TauCetiRoadmap/JacobianChallenge#layer-b-coherent-cohomology-over-k-genus-riemannroch-serre-duality`.

Acceptance: The blow-ups do not change the rigid generic fibre; the new special-fibre closure lies inside the compactifiable chart.

Source: [Werner Lütkebohmert, Proposition 5.7, pp. 200–201, Lemma 5.8, p. 202](https://gdz.sub.uni-goettingen.de/id/PPN243919689_0468).

### Local projective compactification of smooth rigid curves

Let K be the fraction field of a complete DVR R and f:X→S a smooth rigid curve fibration, meaning smooth qcqs with purely one-dimensional fibres. Étale locally on S and locally on X, there is a smooth projective S-compactification: for charts S′→S and an open U⊂X×_S S′, U admits an open immersion into a smooth projective S′-curve. This is the exact scope of Lütkebohmert Theorem 5.3. It does not state a global compactification of X, and it does not directly cover a nondiscretely valued algebraically closed field.

The proposed declaration is `smoothRigidCurve_localCompactification`.

Construction or proof. Import the reduced-fibre theorem to obtain a flat formal model with geometrically reduced fibres after the allowed changes of base/model. Apply infinitesimal compactification on finitely many special-fibre strata. Use the extension/approximation theorem successively to cover neighborhoods of those strata; pass to generic fibres, where admissible blow-ups are invisible.

Within this part it uses Infinitesimal compactification of relative curves, Extension of curve compactifications by approximation, S-compactifiable formal curves, Locally S-compactifiable formal curves.

The external interface is `AdicSpacesPartII:R2`.

Acceptance: A proper smooth projective curve is already its own compactification; source charts and base cover remain explicit in a nonproper family.

Source: [Werner Lütkebohmert, Theorem 5.3, p. 197; proof pp. 202–203; public pages 00000201,00000206–00000207](https://gdz.sub.uni-goettingen.de/id/PPN243919689_0468).

### The geometric curve compactification export used by biduality

For a quasi-compact separated smooth rigid curve X over an algebraically closed complete nonarchimedean C, the ECD 25.3 proof uses an open embedding X→X′ into a proper smooth rigid curve. This export is planned with a source-generalization gap: one must establish descent/approximation to discrete valuation data and globalization of Lütkebohmert’s local compactifications, or obtain a primary theorem covering this exact field and global scope. Until then the assertion is conditional on that recorded supplier/gap; Theorem 5.3 alone is not its proof. Only the compactification needed by this curve proof is planned; proper coherent GAGA and general formal models remain R1/R2.

The proposed declaration is `geometricCurve_properCompactification`.

Construction or proof. Obtain an applicable compactification theorem with these field and locality hypotheses; current discrete local result is a starting point, not a completed implication. Verify the needed descent of the curve, admissible open charts and smoothness, then glue the finite chart compactifications with compatible boundary data. Import R1 properness/GAGA and R2 model invariance only where their actual hypotheses suffice.

Within this part it uses Local projective compactification of smooth rigid curves.

The external interface is `AdicSpacesPartII:R1`, `AdicSpacesPartII:R2`.

Acceptance: Closed unit disc embeds into P¹; a nondiscrete C and a whole qc curve must be covered by the chosen theorem, not only one neighborhood.

Source: [Peter Scholze, Proposition 25.3 proof, p. 160](https://people.mpim-bonn.mpg.de/scholze/EtCohDiamonds.pdf).

### Finite frontier support contributions

Let X be a quasi-compact separated smooth rigid curve over Spa(C,O_C), C geometric, and j:U→X a quasi-compact open. The adic frontier B=closure(U)∖U is finite and discrete in this curve setting, by the requested A2 topology theorem. For constant M∈D(Fℓ), ℓ invertible in O_C, define the canonical map j!M→RHom(Rj_*Fℓ,M) as the transpose of j!M⊗Rj_*Fℓ→M obtained from j*Rj_*Fℓ=Fℓ and extension-by-zero adjunction. Its cone is supported on B and its global sections split as the finite sum of the point-supported contributions. The statement uses H0/E1 analytic sheaf operations; the diamond biduality target remains S6.

The proposed declaration is `curveFrontier_finite`.

Construction or proof. On U the canonical pairing is the identity; outside closure(U) both terms vanish. Thus the cone is supported on the frontier. Import the exact finite discrete frontier theorem from A2; use H0/E1 decomposition of sheaves supported on a finite discrete closed set. Export the actual pairing and support decomposition to S6 rather than defining diamond Verdier duality.

Within this part it uses Restriction between concentric annuli, Annulus cohomology with proper support.

The external interface is `ClassicalAdicEtaleCohomology:H3/curve-poincare-duality`, `ClassicalAdicEtaleCohomology:H3/curve-duality-perfect-pairing`, `ClassicalAdicEtaleCohomology:H0/supports-and-extension-by-zero`, `AdicEtaleGeometry:A2`, `EnhancedDerivedSheaves:E1`.

Acceptance: For U=X the frontier is empty and its supported cone is zero; for a radial annular boundary preserve generator signs and twists.

Source: [Peter Scholze, Proposition 25.3 proof, pp. 159–160](https://people.mpim-bonn.mpg.de/scholze/EtCohDiamonds.pdf).

### Proper-curve local duality reduction

On the proper geometric curve X′, take M=N(1)[2] for N∈D(Fℓ), the H3 smooth-curve dualizing normalization. Proper support equals ordinary global sections on X′. H3 curve duality identifies RHom_D(X′)(Rj_*Fℓ,M) with RHom_D(Fℓ)(RΓ(U,Fℓ),N), while RΓ(X′,j!M)=RΓ_c(U,N(1)[2]). The H3 finite curve pairing makes the canonical map between these objects an isomorphism. Finite cohomological dualizability and the E1 colimit theorem extend the bounded/coefficient-generator case to all N. This is an application of H3 curve duality for the compactification reduction; it does not plan a second duality theorem.

The proposed declaration is `curveCompactification_dualityReduction`.

Construction or proof. Use the H3 trace normalization f!Fℓ=Fℓ(1)[2] and properness to identify the actual left and right adjunction maps. Import H3 curve duality and finiteness for U; dualizable finite complexes identify a dual with its double dual. Use E1 commutation with colimits to pass from the coefficient generator to every N; apply the frontier direct summand to reduce the canonical cone on X.

Within this part it uses Finite frontier support contributions, The geometric curve compactification export used by biduality, Prime-to-residue-characteristic annulus cohomology, Restriction between concentric annuli, Annulus cohomology with proper support, The compactification direct summand.

The external interface is `ClassicalAdicEtaleCohomology:H3/curve-poincare-duality`, `ClassicalAdicEtaleCohomology:H3/curve-duality-perfect-pairing`, `ClassicalAdicEtaleCohomology:H0/supports-and-extension-by-zero`, `AdicEtaleGeometry:A2`, `EnhancedDerivedSheaves:E1`.

Acceptance: For U=X the frontier is empty and its supported cone is zero; for a radial annular boundary preserve generator signs and twists.

Source: [Peter Scholze, Proposition 25.3 proof, pp. 159–160](https://people.mpim-bonn.mpg.de/scholze/EtCohDiamonds.pdf).

### The compactification direct summand

Assume additionally an open embedding i:X→X′ into a proper smooth geometric curve. Write α_X:j!M→RHom(Rj_*Fℓ,M) for the preceding canonical map, and α_X′ for the same open U⊂X′ and constant coefficient M. Restriction identifies i*cone(α_X′) with cone(α_X). Their frontier supports are finite and discrete. Decomposition over those supports gives explicit inclusion and projection making RΓ(X,cone(α_X)) a direct summand of RΓ(X′,cone(α_X′)). This is a cone/support comparison, not an equality of dimensions.

The proposed declaration is `curveBoundary_directSummand`.

Construction or proof. Use exact open restriction, open base change for Rj_* and locality of internal RHom to identify the restricted canonical map. Decompose the finite frontier supports; retain those points lying in X. The inclusion and projection on these finite support summands compose to the identity. The global embedding remains the separate compactification gap.

Within this part it uses Finite frontier support contributions, The geometric curve compactification export used by biduality, Prime-to-residue-characteristic annulus cohomology, Restriction between concentric annuli, Annulus cohomology with proper support.

The external interface is `ClassicalAdicEtaleCohomology:H3/curve-poincare-duality`, `ClassicalAdicEtaleCohomology:H3/curve-duality-perfect-pairing`, `ClassicalAdicEtaleCohomology:H0/supports-and-extension-by-zero`, `AdicEtaleGeometry:A2`, `EnhancedDerivedSheaves:E1`.

Acceptance: For U=X the frontier is empty and its supported cone is zero; for a radial annular boundary preserve generator signs and twists.

Source: [Peter Scholze, Proposition 25.3 proof, pp. 159–160](https://people.mpim-bonn.mpg.de/scholze/EtCohDiamonds.pdf).

## Relative duality in every dimension: RT-AREA-etale/5

The existing H3 curve theorem supplies dimension one. Zavyalov’s absolute smooth proper theorem supplies a different, absolute contract. Neither suffices for the positive-characteristic proof of Huber 3.8.1 applied to affine m-space for arbitrary m. The required suffix is `H3:smooth-duality`, with the edge `H3:smooth-duality → H5`. Keep the early curve trace/duality prefix and its current S4/S5 consumers independent of this suffix.

The suffix must export Huber 5.7.2 algebraic/analytic proper-support comparison, the 7.2.2 curve trace normalization, general relative traces, and 7.5.3 relative Poincaré duality for smooth separated morphisms of pure dimension d, for every d≥0, with n invertible in the ring of integers. For G bounded above and F bounded below, the canonical map

Rf_* RHom(G,f*F(d)[2d]) → RHom(Rf_!G,F)

must be an isomorphism, with the actual smoothness, support and finiteness hypotheses. Its trace must agree with étale trace at d=0, with the existing curve trace at d=1, with composition and with the admitted base changes. Berkovich 7.4.9 additionally requires finite locally constant F and finite locally constant compact-support direct images of its dual before ordinary direct-image duality is applied. The Tate twist and that condition cannot be dropped.

The primary public route is Berkovich 7.2.1, 7.3.1 and 7.4.9, transported through Huber’s comparison as made explicit in Zavyalov Appendix A.15, A.18 and A.19. That transport concerns taut analytic spaces and overconvergent sheaves; it is not an equivalence between every adic sheaf and every Berkovich sheaf. Zavyalov’s relative trace in §5.3 permits all torsion coefficients, while the duality theorem invoked here has the separate prime-to-residue domain. The packet requests this suffix from H3 and proposes its structure; it does not place out-of-scope H3 declarations in H5. [Berkovich, §7](https://www.wisdom.weizmann.ac.il/~vova/IHES_1993_78_etale.pdf), [Zavyalov, §5.3 and Appendix A](https://arxiv.org/pdf/2111.01830)

## Closure leaves and supplier contracts

A completed target-level planning pass is not proof closure. Each target in H4 and H5 has a node or an explicit supplier boundary, and every listed local prerequisite resolves to the baseline, another named node, an existing stage with a request, or the gaps below. The book-access leaves and compactification bridge are genuine mathematical remaining work. No item claims formalization.

**PerfectoidSpaces:P6**. A finite-type affinoid approximation of a strictly totally disconnected perfectoid base over K, with descended qc étale objects, constructible coefficients and rational-ball coordinates; specify the colimit-presented tilde-limit and finite-stage morphisms.

**PerfectoidSpaces:P5**. Completed perfectoid coordinate-root balls and their underlying inverse-limit topology, including all-rank compatibility of the ℤ[1/p] radius system; no real powers without roots.

**ClassicalAdicEtaleCohomology:H0**. Constructible coefficient descent along the relevant colimit-presented analytic tilde-limits; higher-image stalk formula 2.6.1; universal-homeomorphism/purely inseparable coordinate invariance; overconvergent neighborhood continuity colim H^q(V,F)=H^q(B,F) for the ball B and shrinking strict neighborhoods V. The last contract needs topology at all ranks, not just scheme continuity. For the general smooth finite-type finiteness refinement, provide the ordinary analytic cohomological-dimension/boundedness theorem with its exact dimension and field-pair hypotheses; lower-shriek dimension bounds alone are not ordinary-site bounds.

**ClassicalAdicEtaleCohomology:H3**. Add the suffix H3:smooth-duality required by RT-AREA-etale/5. Export algebraic/analytic proper-support comparison Hub96 5.7.2 for finite-type separated scheme maps, and the Hub96 7.2.2 curve trace normalization as an input to relative traces and duality Hub96 7.5.3 for smooth separated pure dimension d, EVERY d≥0, with n invertible in O_K. The duality morphism Rf_*RHom(G,f*F(d)[2d])→RHom(Rf_!G,F) must be an isomorphism (G bounded above, F bounded below), compatible with base change, composition, étale trace at d=0 and the existing curve trace at d=1. Include Berkovich 7.4.9 with finite locally constant F and R^qf_!F∨ and the correct twist. Transport by Zavyalov A.15,A.18,A.19 only in their taut/overconvergent scope. Keep H3 curve trace/duality as the early prefix consumed by S4/S5; H5 depends on the suffix.

**EtaleDualityAndPerverseSheaves:EDC.2:trace-purity**. Algebraic smooth purity and trace in every finite relative dimension, with the exact torsion-invertibility and constructibility domains used in Ber93 §7.5 comparison.

**ClassicalAdicEtaleCohomology:H3**. General-K smooth constructibility in Hub96 6.2.2: Ito20 §6 fixes algebraically closed K, while ECD24.1 applies the result over a perfectoid field K. Verify the book statement or justify descent from a geometric extension, with all-point constructibility and proper-support base change. Classical proper-support base change admitting a nonnoetherian perfectoid base for the finite-type relative-ball family, proved via compactification and H0 continuity. The existing lower-shriek-base-change node only admits locally noetherian analytic base changes and is insufficient.

**ClassicalAdicEtaleCohomology:H3**. Analytic purity Hub96 3.9.1(b) and the exact SGA4 XVI §4 comparison reduction in characteristic zero, retaining all hypotheses and allowing field-characteristic-invertible torsion when residue characteristic divides n. Do not substitute prime-to-residue smooth duality.

**ClassicalAdicEtaleCohomology:H1:valuation-exports**. For constant prime-to-p radial cohomology over Spa(C,C⁺), prove the specialization/overconvergent-sheaf comparison to the maximal-rank-one base under the precise hypotheses, and proper-support compatibility; distinguish it from surjective field-pair invariance C′⁺∩C=C⁺.

**AdicSpacesPartII:R1**. Properness and qcqs of the relative scheme/adic fibre product in Hub96 3.7.3, with the exact noetherian-type hypotheses; full affine analytification/exhaustion charts and compatible étale-site morphisms. Geometry/GAGA is not cohomology comparison.

**AdicSpacesPartII:R2**. Reduced Fibre Theorem over a complete DVR and admissible blow-up invariance; formal completion along special-fibre strata, rig-étale morphisms, formal GAGA/algebraization of projective formal curves and approximation of Hilbert-parameter maps. Match the precise hypotheses of Lut95 5.4–5.8. Also Lut95 §7.1 relative S-compactness via proper schematic closure on formal models, and Theorem7.4: separated rig-smooth target over Spf(A), affinoid Z_rig, U_rig a Weierstrass domain, relatively S-compact image; after a blow-up finite over U, an enlarged U′ containing the special-fibre closure and a map agreeing to prescribed level λ₀, preserving generic-fibre open immersion. Proposition7.5 supplies a uniform λ₁ for lifting a modulo-π^λ map to an actual map agreeing modulo π^(λ−λ₁), for a rig-smooth affine formal target. These statements cannot be replaced by abstract Elkik approximation without the model/topology hypotheses.

**tauceti:TauCetiRoadmap/JacobianChallenge#layer-b-coherent-cohomology-over-k-genus-riemannroch-serre-duality**. Use the existing algebraic-curve/Jacobian direction for normalization and smooth projective completion after finite residue-field extension, high-degree divisor vanishing and deformation of smooth curves/embeddings. The additional general smooth Hilbert-scheme parameter contract needed by Lut95 Lemma 5.8 is proposed as a Part II extension rather than re-planned here; public Lemma5.8 gives d≥2g−1 for the open Hilbert scheme H(d,g,N) of smooth genus-g degree-d embedded curves to be smooth over ℤ; import smooth-curve and embedding deformations, relative Cartier-divisor lifting, and H¹(C,O_C(Δ))=0 by Serre duality.

**AdicCoefficientsAndComparisons:L2**. Scheme compactification and coefficient extensions in their general qcqs domain, plus the constructible/generic base-change finiteness used in Ber93 7.5.1–7.5.3. Import existing EDC finite-type cohomology results when they suffice.

**EtaleDualityAndPerverseSheaves:EDC.0**. Scheme proper base change, bounded constructible direct images and generic finiteness in the exact domains used by the Huber/Berkovich comparison; EDC owns ordinary algebraic étale formalism.

**EnhancedDerivedSheaves:E1**. Derived global sections for countable increasing open covers as Rlim, acyclicity of a tower with quasi-isomorphic transitions, filtered-neighborhood continuity under coherent-site hypotheses, and finite-dimensional Fℓ dualizability/colimit extension. Supply actual canonical maps and hypotheses.

**AdicEtaleGeometry:A2**. Finite discrete adic frontier of a quasi-compact open in a quasi-compact separated smooth rigid curve, with all rank points and topology specified; radial inclusions and smooth/proper geometric contracts supplied by R0.

### Gaps requiring a refinement pass

**Huber book proof and full finiteness statement inaccessible**. The public publisher request returned HTML. The reviewed 3.7/3.8 locators are preserved, Ito20 proves the exact statement attribution for 6.2.2, and ECD verifies the finite-ball use of Proposition 6.1.1. Read Hub96 §§3.7–3.9,6.1–6.3 before claiming proof closure or the maximal analytic finiteness statement. In particular extract the definitions and key theorems in the proof of smooth constructibility §6.3 and add/import them in a refinement pass; the present theorem is a source-backed closure leaf, not a proof of that book theorem.

**Maximal analytic finiteness statement and nonsmooth scope**. The ball finite-total-dimension instance is verified in ECD27.2; the smooth qcqs per-degree finiteness assertion is verified in Mieda Proposition3.38’s proof. Retrieve Hub96 Proposition6.1.1 and its proof for the maximal domain and boundedness, and Hub98a Proposition3.1 if using the nonsmooth characteristic-zero extension named there. Do not infer finite total dimension just from per-degree finite generation, or general nonsmooth finiteness from the smooth theorem.

**Nondiscrete global smooth-curve compactification bridge**. Lut95 Theorem5.3 is discrete-base and local on X/étale-local on S. ECD25.3 uses a global embedding of a qc smooth curve over algebraically closed complete C. Provide a primary general compactification theorem or prove descent, source globalization and admissible gluing; the local DVR result alone is insufficient. Source issue E1 concerns the cited proof step, not a counterexample to the target.

**Overconvergent radial cohomology over arbitrary plus rings**. ECD19.5 uses annuli over Spa(C,C⁺). H2 surjective-extension invariance does not compare Spa(C,O_C) to Spa(C,C⁺) when C⁺ is smaller. Verify the required specialization invariance and support comparisons via H1/H3; retain all-rank topology and coefficient restrictions.

**Book characteristic-zero reduction and purity domain**. The full recorded Hub96 comparison permits residue-characteristic torsion in characteristic zero. Read 3.9.1(b), its characteristic/invertibility and generalization-closure clauses, and SGA4 XVI §4; the all-dimension prime-to-residue duality route closes only characteristic p here.

**All-dimension relative duality supplier not yet planned**. The existing H3 curve theorem and Zavyalov absolute proper theorem do not cover smooth relative dimension d>1. The detailed H3 request and proposed suffix/edge are the explicit boundary. No out-of-scope H3 nodes are edited or supplied by this packet.

**Suggested file lacks analytic geometric carriers**. The pinned baseline has valuation spectra/rational subsets and generic Sheaf.H, but lacks the category of ringed adic spaces, its analytic étale site, pseudo-adic support functors, formal schemes and the comparison square. The suggested file elaborates only genuine valuation-set and additive-homomorphism cores. All unstatable full definitions, API tests and theorem signatures are named in explicit omission comments, with suppliers; there are no placeholder propositions or theorem-valued data records. These omissions do not establish formalization. The shared build has no compiled Spa.Polydisc object; the exact pinned closedPolydisc/classicalPoint compatibility signatures are retained as named omission comments. Available valuation-set and additive-map signatures can be checked with the supplied lean-check wrapper.

### The compactification citation gap

ECD 25.3 embeds a quasi-compact smooth curve into a proper smooth rigid curve and cites Lütkebohmert 5.3. The public statement of 5.3 assumes a complete discrete valuation base and gives only local source compactification after étale base change. An algebraically closed nontrivially valued field is nondiscrete, and compactifying neighborhoods is not yet a global embedding of the whole curve. This is recorded as source issue `ClassicalAdicEtaleCohomology/E1`, affecting the proof bridge. It asserts no counterexample to the curve theorem or to diamond biduality. A primary theorem with the exact global/geometric scope, or a proof of descent and compatible globalization, closes it. The discrete theorem and its exact formal construction remain part of the plan.

The new upstream requirement is the smooth Hilbert parameter open H(d,g,N), smooth over ℤ for d≥2g−1, together with the deformation of curves and embeddings and the normalization/completion inputs used by §5. The existing Jacobian challenge supplies line bundles, coherent curve cohomology, degree and Serre duality. The additional parameter-space and deformation contract is proposed as “Jacobian challenge, Part II: deformation and projective parameter spaces for smooth curves”, building on that roadmap. The maintainer determines its final owner; no existing upstream roadmap is re-planned.

## Planets, sources and suggested forms

**H4**: Discs and annuli, Tame annulus coverings, Disc cohomology, Annulus cohomology, Tame-root acyclicity, Smooth constructibility.

**H5**: Proper comparison, Algebraic–analytic comparison, Analytic finiteness, Ball exhaustion, Radius stability, Smooth curve compactification.

The suggested file provides real valuation-set definitions and API signatures for the radial loci, genuine union exhaustions, integer-radius balls and the additive Kummer-map core. An arbitrary additive map is not asserted to be the analytic connecting homomorphism: naturality needs its actual commuting square, and coordinate scaling needs the exhibited n-th root and n-torsion hypothesis. The degree isomorphism, formal-curve predicates and named analytic theorem signatures require their canonical geometric/site carriers and have explicit named omission comments. The pinned closedPolydisc and classicalPoint comparison signatures are preserved as comments because the shared compiled build lacks the Polydisc object. The packet records these limitations rather than replacing the missing conditions by propositions.

The source ledger fixes editions and access, rather than treating a book citation as a new reading of its proof. Public source files were read on 6 October 2026; their hashes are recorded in the packet. Lütkebohmert’s public page images were used to verify the OCR-sensitive statements. Huber’s publisher PDF endpoint returned HTML, so the book proof interiors and maximal finiteness statement remain access gaps. The inherited reviewed H5 locators are retained. Ito’s public smooth-constructibility restatement fixes an algebraically closed K throughout §6; the extension to the general perfectoid K used in ECD 24.1 is separately requested.

- [Peter Scholze, Étale cohomology of diamonds](https://people.mpim-bonn.mpg.de/scholze/EtCohDiamonds.pdf). Author PDF dated 14 April 2026. Read: Theorem 19.5 proof, pp. 110–112; Theorem 24.1 proof, pp. 151–153; Proposition 25.3 proof, pp. 159–160; Proposition 27.2 proof, pp. 163–164. Public text read.
- [Kazuhiro Ito, Uniform local constancy of étale cohomology of rigid analytic varieties](https://arxiv.org/pdf/2008.07794). arXiv:2008.07794 public PDF retrieved 2026-10-06. Read: Theorem 6.8 and Remark 6.9, p. 35; Definitions of B(ε), B(a,b), D(ε), pp. 35, 37; Lemma 6.12; Introduction on smooth constructibility; Appendix A.1, pp.46–47: rank-two endpoint refinements and Example A.1. Public text read.
- [Vladimir G. Berkovich, Étale cohomology for non-Archimedean analytic spaces](https://www.wisdom.weizmann.ac.il/~vova/IHES_1993_78_etale.pdf). Publ. Math. IHÉS 78 (1993), 5–161, digitized author copy. Read: §6.2 trace and coefficient caveat; §6.3 tame covers of discs and annuli; §6.4 Remark 6.4.2; §7.1 proper-support comparison; §§7.2–7.4 relative trace and duality; §7.5 comparison proof and Corollaries 7.5.3–7.5.4. Public text read.
- [Bogdan Zavyalov, Mod-p Poincaré Duality in p-adic analytic geometry](https://arxiv.org/pdf/2111.01830). Public arXiv:2111.01830 PDF; Annals of Mathematics 201 (2025). Read: Theorem 1.1.3 and its coefficient distinction; §5.3 Theorem 5.3.3 (relative trace); Appendix A, taut-space scope, Theorem A.15, Definition A.17, Lemmas A.18–A.19. Public text read.
- [Werner Lütkebohmert, The structure of proper rigid groups](https://gdz.sub.uni-goettingen.de/id/PPN243919689_0468). J. Reine Angew. Math. 468 (1995), 167–219; GDZ public page transcription. Read: §5 pp. 196–203: smooth curve fibration, Theorem 5.3, Proposition 5.4, Lemma 5.5, Proposition 5.7, Lemma 5.8 and proof of 5.3; Definition5.6 p.200; §7.1 relative compactness, pp.211–212; Theorem7.4 and Proposition7.5 pp.212–213. Public OCR pp.196–203 and selected §7 passages read; public IIIF images pp.197,198,200,201,202,212,213 inspected. The scan confirms the divisor clauses and d≥2g−1 in Lemma5.8..
- [Roland Huber, Étale Cohomology of Rigid Analytic Varieties and Adic Spaces](https://link.springer.com/book/10.1007/978-3-663-09991-8). Aspects of Mathematics E30 (1996). Read: No book pages newly accessed. Reviewed integrated decomposition supplies inherited §3.7–§3.8 locators; ECD supplies the specific §6.1.1 use; Ito supplies the §6.2.2 statement.. Publisher full-PDF request returned HTML, not the book. No copied private-scan hash is asserted. Proof interiors and exact maximal generality remain recorded gaps..
- [Yoichi Mieda, Zelevinsky involution and ℓ-adic cohomology of the Rapoport–Zink tower](https://www.ms.u-tokyo.ac.jp/~mieda/pdf/RZ-Zel.pdf). Public author PDF retrieved 6 October 2026. Read: §3.3.1 p.12: base field, adic finite-type scope, prime-to-residue truncated-DVR coefficients; Proposition3.38 and proof, pp.19–20: intermediate qc-open finiteness assertion and exact inverse-limit sequence. Public author PDF read. The finiteness assertion is an intermediate claim in the proof of Proposition3.38; it is not the proposition’s conclusion, which assumes finiteness on a possibly non-qc U..
