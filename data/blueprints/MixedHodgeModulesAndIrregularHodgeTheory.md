# Mixed Hodge modules, exponential mixed Hodge structures and the irregular Hodge filtration

This roadmap builds the general Hodge and exponential machinery used in the appendix to Fresán–Sabbah–Yu’s *Hodge theory of Kloosterman connections*. Its outputs are usable categories and operations, a strict bifiltered exponential realization, the classicality theorem for the function tg, Fourier costalk and monodromy formulas, and logarithmic/Newton descriptions of the rational filtration. It includes Hodge modules in the dimensions needed by products and graph compactifications; restricting the entire construction to curves would not support its pair-cohomology applications.

The linear Hodge structures are the existing Tau Ceti carriers. SpringerResolutionAndCharacteristicCycles owns algebraic differential operators, good filtrations, holonomicity, transfer, duality and intermediate extension. HodgeStructuresPartII owns variations, canonical extensions and nilpotent-orbit theory; LefschetzPencilsAndVanishingCycles LPV.1 owns the linear algebra of monodromy filtrations and LPV.3 Lefschetz pencils; AlgebraicModuliForArithmeticGeometry R09.7 owns resolution, principalization and SNC compactification; ComplexComparisonPartII cites the analytification carrier and owns Deligne's regular-singular equivalence. Their exact nodes appear in the prerequisites below, and the remaining requested extensions are listed below. Betti constructible sheaves here use rational and complex coefficients on analytifications; the étale roadmaps continue to own their ℓ-adic categories.

KloostermanMomentsAndPotentialAutomorphy is the first consumer. It owns its special connections, symmetric powers, Newton polytopes, explicit monomial bases, parity and singularity tests, Jordan blocks and numerical Hodge counts. The present targets export the general interfaces used in those computations.

## Conventions and build order

- Work over C with algebraic maps between separated finite-type varieties, using smooth quasi-projective ambient varieties for Hodge modules and supported categories for singular closed supports. All Hodge objects are rational and graded-polarizable. No integral polarization is inferred from an arbitrary rational form.
- For X smooth of dimension d, unshifted DR has degrees 0,…,d and pDR=DR[d]. The constant perverse object is pQ_X=Q_X[d], of Hodge-module weight d. A smooth variation of weight m has Hodge-module weight m+d.
- Left Hodge filtrations are increasing F_p, with decreasing notation F^p=F_{−p}. The constant left module starts at F_0O_X. Side changing gives F_p(M_right)=ω_X⊗F_{p+d}(M_left). For i:pt→A¹, F_p i_+V=Σ_{k≥0}F_{p−1−k}V·∂^k. This shift cancels the degree-one shift in its de Rham realization.
- Tau Ceti’s Tate convention is Q(m) of weight −2m with F^p nonzero through p=−m. Duality therefore gives D(pQ_X)=pQ_X(d). On a smooth divisor i!pQ_X=pQ_D(−1)[−1], while i*pQ_X=pQ_D[1].
- Exponential connections use d+df. For input τ and output t, Fourier kernel E^{tτ} gives t=−∂_τ and ∂_t=τ; Fourier squared is the sign involution. At infinity x=θ⁻¹ the exponential operator on coefficients is ∂_x−x⁻².
- The specialization filtration is increasing V_α, with x∂_x+α nilpotent on gr^V_α. Full nearby cycles include every monodromy eigenvalue. The unipotent N is (2πi)⁻¹log T_u. With HodgeStructuresPartII's residue convention T=exp(−2πi·Res) this is N=−Res on a unipotent block; the topological relation var∘can=T−1 is converted to the normalized can and var at B/betti-cycles.
- Weights W^E in EMHS descend through Π. They differ from ambient MHM(A¹) weights. In particular K=Πδ_0Q is exponentially pure of weight zero but has ambient pieces of weights zero and one.
- The de Rham fibre is ωN=H¹_dR(A¹,N⊗E^θ). Its rational decreasing irregular filtration is the image of F^{Del}_{−λ}DR in degree one. For classical objects it is F^{ceil(λ)}. Constants have zero exponential fibre.
- The build order is B → D → F → H.0 → H.1 → E → I → C → P → G → T → N, with the additional supplier arrows written at each target. F/additive-convolution first concerns underlying holonomic complexes; its Hodge lift is obtained at H.1. N/filtered-kunneth-duality is the filtered product theorem, distinct from P’s exponential-category product theorem.

A “Check” below is an acceptance condition on the future development. Planned API names and unit tests are specifications. The compact [suggested Lean file](../suggested/MixedHodgeModulesAndIrregularHodgeTheory.lean) contains the polynomial specialization of F/exponential-twist, the point case of simultaneous W∩F strictness from H.0/abelian-strictness on the pinned mixed Hodge structures, and existing Tate-carrier convention checks. The remaining targets need carriers absent at the pins and are stated in this document, following the 2026-10-12 shape rule. All packet implementation statuses are unchecked.

## Existing baseline and supplier boundaries

Baseline: Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`; Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. The audited current upstream roadmap checkout is recorded separately in the packet so that newer descriptions are not mistaken for pinned declarations.

**`mathlib:DerivedCategory`** — Derived category of an abelian category, formed by localization at quasi-isomorphisms; supplies the generic derived carrier, not constructibility or perversity. Source module: `Mathlib/Algebra/Homology/DerivedCategory/Basic.lean`.

**`mathlib:Polynomial.derivative`** — The coefficientwise formal polynomial derivative as an R-linear map for a semiring R. Source module: `Mathlib/Algebra/Polynomial/Derivative.lean`.

**`mathlib:Polynomial.derivative_mul`** — Leibniz rule for the formal polynomial derivative; supplies the affine rank-one connection check. Source module: `Mathlib/Algebra/Polynomial/Derivative.lean`.

**`tauceti:TauCeti.Hodge.HodgeStructureOn`** — A pure Hodge structure of weight n on a complex vector space with a conjugation: a decreasing exhaustive filtration n-opposed to its conjugate. It imposes no finiteness and no rational or integral structure; HodgeStructure specializes it to a base change of an abelian group. Source module: `TauCeti/Geometry/Hodge/Structure.lean`.

**`tauceti:TauCeti.Hodge.MixedHodgeStructure`** — A mixed Hodge structure on an abelian group Vℤ with rational and complex base-change models: a finite increasing rational weight filtration WQ, a finite decreasing complex Hodge filtration F, and pure structures on the rational graded pieces. Taking Vℤ to be a rational space with the identity model gives rational mixed Hodge structures; finite dimension and graded polarizability are not imposed. Source module: `TauCeti/Geometry/Hodge/Mixed/Basic.lean`.

**`tauceti:TauCeti.Hodge.MixedHodgeStructure.Hom.range_inf_F_eq_map_F`** — Morphisms of the existing mixed Hodge structures are strict for F: range(f) ∩ Fᵖ(target) = f(Fᵖ(source)). Source module: `TauCeti/Geometry/Hodge/Mixed/Strictness.lean`.

**`tauceti:TauCeti.Hodge.MixedHodgeStructure.Hom.range_inf_WQ_eq_map_WQ`** — Rational weight strictness of existing mixed Hodge structure morphisms. Source module: `TauCeti/Geometry/Hodge/Mixed/Strictness.lean`.

**`tauceti:TauCeti.Hodge.tate`** — The Tate Hodge structure ℤ(m) on the lattice ℤ with complex model ℂ, of weight −2m, with F^p the whole line exactly when p≤−m; its rationalization is Q(m). Source module: `TauCeti/Geometry/Hodge/Tate/Basic.lean`.

**`tauceti:TauCeti.Hodge.tate_F`** — The explicit top/bottom formula for the Hodge filtration of the existing Tate object. Source module: `TauCeti/Geometry/Hodge/Tate/Basic.lean`.

**`tauceti:TauCeti.Hodge.HodgeStructureOn.tateTwist`** — Tate twist changes pure weight n to n−2m and shifts the Hodge filtration to Fᵖ = Fᵖ⁺ᵐ of the input. Source module: `TauCeti/Geometry/Hodge/Tate/Twist.lean`.

**`tauceti:TauCeti.Hodge.MixedHodgeStructure.Hom.range_inf_iSup_deligneSplittingFamily_eq_map_iSup`** — For a morphism f of mixed Hodge structures and any set P of bidegrees, range f meets the sum of the target's Deligne pieces I^{p,q} over P in exactly the image of the corresponding sum for the source; with P={(r,s): p≤r, r+s≤k} this is strictness for W_k∩F^p. Source module: `TauCeti/Geometry/Hodge/Mixed/Strictness.lean`.

**`mathlib:LaurentSeries`** — Formal Laurent series over a ring R, the Hahn series HahnSeries ℤ R; over C it is the field C((x)). Source module: `Mathlib/RingTheory/LaurentSeries.lean`.

**`mathlib:PowerSeries`** — Formal power series R⟦X⟧; over C it is the lattice ring C[[x]] of formal differential modules. Source module: `Mathlib/RingTheory/PowerSeries/Basic.lean`.

The point category uses the graded-polarizable rational subcategory of the existing mixed Hodge structures, with its rational/complex base-change maps: a rational mixed Hodge structure is realized on the pinned carrier by taking its abelian group to be the rational space itself with the identity model, and the pinned morphisms are already rational-linear. Finite dimension and graded polarizability are added conditions. The integral Tate carrier is rationalized when used as Q(m). The existing integral polarization class does not provide the rational polarization interface required for arbitrary rational variations.

**`HodgeStructuresPartII:H.6` ([supplier packet](../packets/HodgeStructuresPartII.json))** — The one-variable nilpotent-orbit theorem, limiting mixed Hodge structure and norm estimates (H.6/limiting-mhs-one-variable, H.6/flat-norm-estimate) for a polarizable variation on a punctured disc with a rational (not integral) polarization and quasi-unipotent monodromy; the existing nodes assume an integral lattice. The monodromy-filtration linear algebra is imported from LefschetzPencilsAndVanishingCycles LPV.1 and the residue sign from H.2/residue-monodromy. Needed by [H.0/curve-l2-hodge](#h0-curve-l2-hodge), [H.0/projective-direct-image](#h0-projective-direct-image).

**`tauceti:TauCetiRoadmap/AnalyticToricGeometry#layer-0-the-toric-compatible-algebraic-supplier`** — Integral character lattices, rational polytopes and their normal fans, regular proper refinements, affine/global toric schemes, orbit charts, boundary simple normal crossings and the algebraic properness/completeness criterion. The normal-fan refinement and polytope bridge are precise addition requests where not already in Layer 0. Needed by [N/newton-complex](#n-newton-complex), [N/newton-concentration](#n-newton-concentration), [N/newton-hodge-comparison](#n-newton-hodge-comparison), [N/constant-gauss-manin-cone](#n-constant-gauss-manin-cone).

**`AnalyticToricGeometryPartII:NT.0` ([supplier packet](../packets/AnalyticToricGeometryPartII.json))** — Vanishing H^i(X_Σ,O(floor(aP)))=0 for i>0 and a≥0, for the Newton pole divisor P on a smooth proper toric refinement of the normal fan (the divisor is nef with polytope aΔ), with the rounding of rational coefficients. Divisors, section weights and global sections are the existing NT.0/invariant-divisor, NT.0/section-weights and NT.0/divisor-sections. Needed by [N/newton-complex](#n-newton-complex), [N/newton-hodge-comparison](#n-newton-hodge-comparison).

**`SpringerResolutionAndCharacteristicCycles:H/regular-holonomic` ([supplier packet](../packets/SpringerResolutionAndCharacteristicCycles.json))** — Extend the regular-holonomic direction by the specializability/Bernstein b-function theorem along a smooth hypersurface, also after graph direct image. For a coherent holonomic module give a good V_0D lattice and a nonzero polynomial for the Euler action on its boundary quotient, prove its existence, and prove rationality of exponents for quasi-unipotent regular modules. The inspected regular-holonomic node defines regularity but does not provide this theorem. Rational V-filtration construction and F compatibility remain H.0/v-filtration here. Needed by [H.0/v-filtration](#h0-v-filtration).

**`AlgebraicModuliForArithmeticGeometry:R09.7` ([supplier packet](../packets/AlgebraicModuliForArithmeticGeometry--R09.7.json))** — For the blowup π:X′→X of a smooth complex variety along a smooth centre Ξ of codimension c≥2, the exceptional divisor E is the projective bundle P(N_{Ξ/X}) over Ξ with O_E(E)≅O_E(−1), and Rπ_*O_E(−μ)=0 for 0<μ<c; these are the blowups R09.7 uses for resolution and principalization. Needed by [N/filtered-blowup](#n-filtered-blowup), [N/filtered-kunneth-duality](#n-filtered-kunneth-duality).

**`tauceti:TauCetiRoadmap/AlgebraicCurves#layer-9-kähler-differentials-residues-and-the-comparison`** — Existing content, no addition: the place expansion of the function field of a smooth complex curve at a C-rational place into C((x)) for a uniformizer x, compatible with derivations, used to pass from an algebraic connection to its formal differential module at a boundary point. Needed by [D/curve-index](#d-curve-index).

The following stages give the actual mathematical specifications; a supplier request states its exact additional theorem rather than treating a roadmap title as evidence that the theorem exists.

<a id="b"></a>
## Layer B — Betti constructibility and regular Riemann–Hilbert

On analytifications of complex algebraic varieties, construct bounded algebraically constructible rational and complex sheaf categories with the support and cosupport middle perversity, recollement, Verdier duality, the six operations and nearby/vanishing cycles. Prove the algebraic regular Riemann–Hilbert comparison, normalized by DR(M)[dim X], from Springer’s regular holonomic modules. This is the Betti interface; the existing étale perverse roadmaps retain their ℓ-adic objects.

**Inputs:** `EnhancedDerivedSheaves:E1` ([supplier packet](../packets/EnhancedDerivedSheaves.json)), `ComplexComparisonPartII:C0` ([supplier packet](../packets/ComplexComparisonPartII.json)), `ComplexComparisonPartII:C5` ([supplier packet](../packets/ComplexComparisonPartII.json)), `AlgebraicModuliForArithmeticGeometry:R09.7` ([supplier packet](../packets/AlgebraicModuliForArithmeticGeometry--R09.7.json)), `SpringerResolutionAndCharacteristicCycles:H` ([supplier packet](../packets/SpringerResolutionAndCharacteristicCycles.json)).

**Atlas planets:** Constructible Betti complexes; Middle perverse sheaves; Nearby and vanishing cycles; Riemann–Hilbert correspondence.

<a id="b-constructible-six-operations"></a>
### B/constructible-six-operations — Algebraically constructible Betti complexes

**Construction.** For a separated finite-type complex variety X, let Dᵇ_c(X_an,Q) be the full subcategory of the derived category of sheaves of Q-vector spaces whose cohomology is bounded, finite dimensional on stalks and locally constant on a finite algebraic Whitney stratification. Construct f*, Rf_*, Rf_!, f!, derived tensor, internal Hom, external product and Verdier duality for algebraic maps, with adjunctions, proper base change, projection formula and the two open/closed localization triangles. Do the same over C and compare by Q→C. Define RΓ_Z by i_*i! for a closed support Z.

**Hypotheses and conventions.** All maps are algebraic; coefficient fields are Q and C. Constructibility of a nonproper analytic direct image is not asserted.

**Prerequisites:** `mathlib:DerivedCategory`, `EnhancedDerivedSheaves:E1/ringed-pullback-pushforward` ([supplier packet](../packets/EnhancedDerivedSheaves--E0.json)), `EnhancedDerivedSheaves:E1/presentability-and-derived-tensor` ([supplier packet](../packets/EnhancedDerivedSheaves--E0.json)), `EnhancedDerivedSheaves:E1/derived-internal-hom` ([supplier packet](../packets/EnhancedDerivedSheaves--E0.json)), `EnhancedDerivedSheaves:E1/coefficient-change-and-perfect-action` ([supplier packet](../packets/EnhancedDerivedSheaves--E0.json)), `ComplexComparisonPartII:C0/repair-analytification` ([supplier packet](../packets/ComplexComparisonPartII.json)).

**Construction or proof.**

1. Apply the EnhancedDerivedSheaves:E1 nodes for ringed topoi to the topological space X_an (from the ComplexComparisonPartII:C0/repair-analytification carrier) with constant coefficient rings Q and C: they give the derived categories, Lf*=f⁻¹ and Rf_*, derived tensor, internal Hom and coefficient change; take the full bounded constructible subcategories.
2. Choose compatible algebraic Whitney stratifications for a map and use stratified local triviality to prove finite constructibility of direct images (the stratification theorem is gap G5); construct Rf_! by proper supports and f! as its right adjoint (Verdier duality), and verify the adjunctions.
3. Prove localization on an open/closed pair and proper base change stalkwise, then derive support cohomology and Künneth from the projection formula.

**Planning API.**

- `BettiConstructible.coeffChange` — Tensoring rational constructible complexes with C commutes with all six operations for algebraic maps.
- `BettiConstructible.localisation` — i_*i!K→K→Rj_*j*K and j_!j*K→K→i_*i*K are distinguished triangles.
- `BettiConstructible.properBaseChange` — For a proper f and any algebraic base change, pullback commutes with Rf_*.
- `BettiConstructible.support` — RΓ_Z(X,K)=RΓ(X,i_*i!K), with the open-complement localization triangle.

**Unit tests.**

- `BettiConstructible.point` (compatibility) — On a point recover bounded complexes of finite-dimensional Q-vector spaces in the existing derived carrier.
- `BettiConstructible.affineLine` (computation) — H⁰(A¹,Q)=Q, H_c²(A¹,Q)=Q and their other cohomology groups vanish.
- `BettiConstructible.supportZero` (non-example) — RΓ_{0}(A¹,Q)=Q[−2], whereas i_0* i_0*Q is supported in degree zero; using i* in place of i! fails this test.

**Use:** FSY Example A.27 and Theorem A.30: Localize with supports along a possibly singular zero locus and identify the Fourier costalk.

**Check.** RΓ_Z and RΓ_c must remain different functors. For X smooth of dimension d, D_Q(Q_X[d])=Q_X[d], before Hodge Tate twists.

**Sources:** [Dimca](https://doi.org/10.1007/978-3-642-18868-8), Definition 4.1.1, Theorem 4.1.5 with Remark 4.1.7 and Corollary 4.1.6, pp. 81–84; Definition 4.2.7, p. 107; §3.2, Definition 3.2.1 and Theorem 3.2.3, p. 62; Theorem 3.3.10, p. 69 — Defines constructibility, proves stability of the algebraically constructible categories under the six operations for algebraic maps (Theorem 4.1.5) and finiteness (Corollary 4.1.6), defines S-constructibility for a Whitney stratification (4.2.7), and constructs f! with local and global Verdier duality (3.2.1, 3.2.3, 3.3.10).

<a id="b-middle-perverse"></a>
### B/middle-perverse — Middle perverse Betti sheaves

**Definition.** For an algebraic Whitney stratification and a smooth complex stratum S of dimension s, define the middle perverse t-structure by Hʲ(i_S*K)=0 for j>−s and Hʲ(i_S!K)=0 for j<−s. Prove independence of the adapted stratification, boundedness and self-duality; its heart Perv(X,Q) is abelian. Construct perverse cohomology and j_!*L=image(pH⁰j_!L→pH⁰Rj_*L). For a local system L on a smooth d-fold, L[d] is perverse. Constants on a reduced divisor in a smooth variety are perverse after the divisor-dimension shift.

**Hypotheses and conventions.** Use finite algebraic constructibility from B/constructible-six-operations; the normal-slice description of strata uses the stratification input of gap G5. The reduced divisor is a local complete intersection; no assertion for arbitrary singular constants is made.

**Prerequisites:** [B/constructible-six-operations](#b-constructible-six-operations).

**Construction or proof.**

1. Glue the support and cosupport truncations over strata, using open/closed recollement from B/constructible-six-operations.
2. Check independence by refinement, and exchange the inequalities with Verdier duality.
3. Use normal slices and the local complete-intersection connectivity bound to prove the reduced-divisor constant case; form images in the glued heart.

**Planning API.**

- `BettiPerverse.localSystem` — A finite rank local system on a smooth d-fold gives a perverse object after shift [d].
- `BettiPerverse.truncation` — Produce the bounded perverse truncation triangles and long exact perverse-cohomology sequence.
- `BettiPerverse.intermediateExtension` — j_!*L is the unique extension of L with no subobject or quotient on the complement.
- `BettiPerverse.dual` — Verdier duality is exact on the heart and exchanges j_! and Rj_*.

**Unit tests.**

- `BettiPerverse.point` (compatibility) — Perv(pt,Q) is finite-dimensional Q-vector spaces in degree zero.
- `BettiPerverse.constantShift` (non-example) — Q_{A¹}[1] is perverse and Q_{A¹} is not.
- `BettiPerverse.nodalDivisor` (computation) — For xy=0 in A², Q_{xy=0}[1] is perverse, although it is not a local system on a smooth curve.

**Use:** Sai88 §5.1.6; FSY Appendix A.2: Supplies the rational realization and the shifted constant-divisor object.

**Check.** On a curve an unshifted nonzero local system is not perverse; its shift by one is. j_!* has no nonzero subobject or quotient supported on the omitted closed set.

**Sources:** [Dimca](https://doi.org/10.1007/978-3-642-18868-8), §5.1, pp. 125–133, particularly Theorem 5.1.20, p. 131; §5.2, pp. 133–140 — Constructs middle perversity, the perverse heart and intermediate extension, with the complete-intersection constant example.

<a id="b-betti-cycles"></a>
### B/betti-cycles — Betti nearby and vanishing cycles

**Construction.** For f:X→A¹ and K in Dᵇ_c(X_an,Q), construct Rψ_fK from the universal cover of the punctured disk and Rφ_fK from the specialization triangle i*K→Rψ_fK→Rφ_fK. Set pψ_f=Rψ_f[−1] and pφ_f=Rφ_f[−1]. Prove t-exactness on perverse objects, finite monodromy decomposition after complexification and the can/var triangles. On the generalized eigenvalue-one part normalize variation by the invertible series log(T)/(T−1) so that var∘can=N=(2πi)⁻¹log T_u after adjoining the Tate line; the unnormalized topological relation is var_top∘can=T−1.

**Hypotheses and conventions.** The unipotent decomposition is over Q; individual non-rational eigenvalues are taken over C. Tate lines carry their rational comparison factor 2πi; rational topological variation is kept distinct from its normalized Hodge version.

**Prerequisites:** [B/constructible-six-operations](#b-constructible-six-operations), [B/middle-perverse](#b-middle-perverse).

**Construction or proof.**

1. Build Rψ from the covering-space pullback and pushforward and obtain Rφ as the cone of specialization.
2. Prove constructibility and perverse t-exactness by the local Milnor-fibre support and cosupport estimates.
3. Derive the two can/var triangles by recollement, then apply the finite logarithm polynomial on the unipotent part.

**Planning API.**

- `BettiCycles.specialisation` — The specialization triangle and the can and var triangles are functorial in K.
- `BettiCycles.perverseExact` — pψ and pφ are exact functors between the appropriate perverse hearts.
- `BettiCycles.monodromy` — can and var intertwine monodromy, and their topological composite is T−1.
- `BettiCycles.properPush` — Nearby and vanishing cycles commute with a proper direct image.

**Unit tests.**

- `BettiCycles.smooth` (computation) — For f=t on A¹, pψ(Q[1])=Q with T=1 and pφ(Q[1])=0.
- `BettiCycles.punctual` (degenerate) — For δ_0V, pψ=0 and pφ=V in degree zero.
- `BettiCycles.ramified` (computation) — For f=t² and Q[1], the nearby fibre has dimension two and eigenvalues 1,−1; keeping only eigenvalue one loses rank.

**Use:** Sai90 §2.2–§2.4; FSY Corollary A.31: Carries the rational comparison of F,V specialization and the pure costalk calculation.

**Check.** For a coordinate on a smooth curve, pψ(Q[1])=Q and pφ(Q[1])=0. For a sheaf supported on the zero fibre, pψ=0 and pφ recovers that sheaf.

**Sources:** [Dimca](https://doi.org/10.1007/978-3-642-18868-8), §4.2, Definitions 4.2.1 and 4.2.4, Propositions 4.2.8–4.2.11 and Remark 4.2.12, pp. 103–110; Theorem 5.2.21, p. 139 — Defines nearby and vanishing cycles with monodromy and the variation map, proves their constructibility and proper base change, and proves t-exactness of the shifted functors.

<a id="b-regular-riemann-hilbert"></a>
### B/regular-riemann-hilbert — Regular algebraic Riemann–Hilbert comparison

**Theorem.** For X a smooth complex algebraic d-fold, analytification followed by pDR(M)=DR(M)[d] identifies algebraic regular holonomic left D_X-modules with algebraically constructible complex perverse sheaves. Extend to bounded derived categories with regular holonomic cohomology. The comparison is exact, fully faithful and compatible with the six operations, duality and tensor/external product. Compatibility with nearby and vanishing cycles is not part of this node: it is proved at H.0/v-filtration (Sai88 Proposition 3.4.12) from the V-filtration. Regularity includes regular singularities at an algebraic compactification boundary. The inverse is the regular holonomic realization of the constructible complex, not arbitrary analytic solutions of an irregular connection.

**Hypotheses and conventions.** Regularity and D-module six operations are the Springer-owned notions. Unshifted DR has terms in degrees 0,…,d.

**Prerequisites:** [B/constructible-six-operations](#b-constructible-six-operations), [B/middle-perverse](#b-middle-perverse), [B/betti-cycles](#b-betti-cycles), `SpringerResolutionAndCharacteristicCycles:H/regular-holonomic` ([supplier packet](../packets/SpringerResolutionAndCharacteristicCycles.json)), `SpringerResolutionAndCharacteristicCycles:H/kashiwara-equivalence` ([supplier packet](../packets/SpringerResolutionAndCharacteristicCycles.json)), `SpringerResolutionAndCharacteristicCycles:H/transfer-and-duality` ([supplier packet](../packets/SpringerResolutionAndCharacteristicCycles.json)), `AlgebraicModuliForArithmeticGeometry:R09.7/embedded-resolution` ([supplier packet](../packets/AlgebraicModuliForArithmeticGeometry--R09.7.json)), `AlgebraicModuliForArithmeticGeometry:R09.7/principalization` ([supplier packet](../packets/AlgebraicModuliForArithmeticGeometry--R09.7.json)), `ComplexComparisonPartII:C5/deligne-regular-singular-equivalence` ([supplier packet](../packets/ComplexComparisonPartII.json)).

**Construction or proof.**

1. Use the tempered-solution construction in Kash84 §6 to define an inverse on constructible complexes.
2. Reduce local biduality and regularity to a local system on the complement of a normal-crossing divisor by embedded resolution and principalization (AlgebraicModuliForArithmeticGeometry:R09.7), proper direct image and induction on support; solve the normal-crossing logarithmic model; on the smooth locus the base case is Deligne's regular-singular equivalence (ComplexComparisonPartII C5/deligne-regular-singular-equivalence).
3. Verify the adjunction maps locally, glue them, and algebraize the regular meromorphic extension. Translate the solution comparison to pDR by holonomic duality and verify the displayed shift.

**Check.** pDR(O_X)=C_X[d]. The algebraic E^t on A¹ cannot be identified with O_{A¹} by the analytic gauge e^t in this regular-at-infinity category.

**Sources:** [Kash84](https://www.kurims.kyoto-u.ac.jp/~kenkyubu/kashiwara/RiemannHilbert.pdf), §6 and its Main Theorem, pp. 353–355; §7, pp. 355–358 — Constructs the regular holonomic inverse and proves the comparison by reduction to normal crossings.; [Dimca](https://doi.org/10.1007/978-3-642-18868-8), Theorems 5.3.1 and 5.3.3, pp. 144–145 — States the de Rham and regular Riemann–Hilbert equivalence with the perverse shift.

**Layer acceptance.** Every target above satisfies its stated Check, every definition/construction satisfies its API and unit tests, and all identifications respect the pinned conventions. The planning inventory covers this layer; mathematical closure also requires its supplier requests and inherited proof inputs.

<a id="d"></a>
## Layer D — Formal slopes and the index on a punctured curve

Import differential operators, holonomicity, transfer, duality and intermediate extension from Springer. Construct formal differential modules at a curve point, the finite ramified exponential decomposition, rational slopes and irregularity. Prove the local index comparison and, for a connection on G_m regular at zero, dim H¹_dR−dim H⁰_dR = irr_∞. The kernel of j_!E→j_!*E has punctual support.

**Inputs:** [B](#b), `SpringerResolutionAndCharacteristicCycles:D` ([supplier packet](../packets/SpringerResolutionAndCharacteristicCycles.json)), `SpringerResolutionAndCharacteristicCycles:H` ([supplier packet](../packets/SpringerResolutionAndCharacteristicCycles.json)), `SchemeAndStackFoundations:SF.3` ([supplier packet](../packets/SchemeAndStackFoundations.json)), `tauceti:TauCetiRoadmap/AlgebraicCurves#layer-9-kähler-differentials-residues-and-the-comparison`.

**Atlas planets:** Formal connection and irregularity; Levelt–Turrittin decomposition; Index formula for connections.

<a id="d-formal-differential-module"></a>
### D/formal-differential-module — Formal differential modules and irregularity

**Definition.** At a chosen coordinate x on a smooth complex curve, a formal differential module is a finite-dimensional C((x))-vector space V with a C-linear connection ∂ satisfying ∂(av)=a′v+a∂v. A lattice is a free C[[x]]-submodule spanning V. Regular singular means some lattice is stable under D=x∂. Define intrinsic irregularity by χ(D:E→E₁)+dim_C(E₁/E), for lattices E⊂E₁ with DE⊂E₁, where χ is dimension of kernel minus dimension of cokernel. Prove finiteness, independence of the lattice pair and coordinate, nonnegativity, additivity in exact sequences, and vanishing precisely at regular singularity.

**Hypotheses and conventions.** Finite rank and characteristic zero; all lattice quotients have finite complex dimension.

**Prerequisites:** `SpringerResolutionAndCharacteristicCycles:D/differential-operators` ([supplier packet](../packets/SpringerResolutionAndCharacteristicCycles.json)), `mathlib:LaurentSeries`, `mathlib:PowerSeries`.

**Construction or proof.**

1. Form the differential-module category over the pinned LaurentSeries C=C((x)) with its lattice ring PowerSeries C=C[[x]], and the ramified scalar extension x=uᵉ by substitution; compare with Springer’s algebraic connections on a curve only at D/curve-index.
2. Use a cyclic vector to produce one lattice pair with a finite-index operator. Compare two pairs through a common larger pair and their finite-dimensional quotient exact sequences.
3. Apply the lattice-index comparison to prove additivity, nonnegativity, the stable-lattice criterion and coordinate invariance, without using the exponential decomposition.

**Planning API.**

- `FormalConnection.ramify` — The scalar extension x=uᵉ is functorial, and intrinsic irregularity multiplies by e. Slopes and their normalized ramification rule are constructed at D/formal-decomposition.
- `FormalConnection.latticeIndependence` — The displayed lattice-index formula is independent of E,E₁ and the coordinate.
- `FormalConnection.irregularity` — Intrinsic irregularity is a nonnegative integer and is additive in every exact sequence.
- `FormalConnection.regularIff` — Intrinsic irregularity is zero if and only if there is an x∂-stable lattice.

**Unit tests.**

- `FormalConnection.logarithmic` (computation) — The rank-one connection d+a dx/x has intrinsic irregularity zero even when a is not an integer.
- `FormalConnection.exponentialPole` (computation) — d+d(x⁻ᵐ) has intrinsic irregularity m for m>0.
- `FormalConnection.ramified` (computation) — The rank-two ramified descent of E^{u⁻¹}, x=u², has intrinsic irregularity one. Its fractional slopes are the separate D/formal-decomposition test.

**Use:** FSY Appendix A.1 and Proposition 4.6: Compute the cohomological index from slopes and control regular Fourier inputs.

**Check.** Treat the slope formula as a theorem about the intrinsic lattice-index invariant; the definition does not depend circularly on an unproved chosen decomposition.

**Sources:** [Mal21](https://www.numdam.org/item/SEDP_1971-1972____A21_0.pdf), §5, Propositions 5.1 and 5.5 and Definition 5.3, pp. XXI.1–XXI.4 — Constructs and characterizes the intrinsic lattice-index irregularity.

<a id="d-formal-decomposition"></a>
### D/formal-decomposition — Ramified exponential decomposition

**Theorem.** Every formal differential module over C((x)) admits, after some finite ramification x=uᵉ, a decomposition into E^φ⊗R_φ with φ in u⁻¹C[u⁻¹] and R_φ regular singular. The distinct exponential factors are unique up to the ramification action, and there are no horizontal homomorphisms between different exponential factors. Consequently the groups of equal rational slope descend canonically and are independent of e. Define the rational slope of E^φ⊗R_φ as pole_u(φ)/e, with zero slope for φ=0. The rank-weighted slope sum equals the intrinsic irregularity of D/formal-differential-module, is integral, and is independent of the splitting ramification.

**Hypotheses and conventions.** Finite rank over the characteristic-zero Laurent-series field.

**Prerequisites:** [D/formal-differential-module](#d-formal-differential-module).

**Construction or proof.**

1. Choose a cyclic vector and normalize the matrix; split distinct leading eigenvalues by recursive off-diagonal gauge elimination.
2. In the nilpotent-leading case perform the Turrittin–Katz shearing and finite ramification of Mal22 §9.E; the rank or irregularity induction terminates.
3. Remove each scalar negative Laurent principal part by an exponential factor and finish with a stable logarithmic lattice. Prove uniqueness by the leading term of a putative horizontal Hom, then descend slope groups.
4. Compare the lattice index on each elementary factor and under ramification to identify the intrinsic invariant with the normalized slope sum.

**Check.** The descent of E^{1/u} for x=u² has a genuine fractional slope. Only the formal splitting is required; a global analytic exponential splitting is not asserted.

**Sources:** [Mal22](https://www.numdam.org/item/SEDP_1971-1972____A22_0.pdf), Remark 8.5, p. XXII.7; §9.D–§9.E, pp. XXII.9–XXII.12; Theorem 10.3, p. XXII.14 — Explains the formal splitting, ramification and terminating reduction to elementary systems.; [Mal21](https://www.numdam.org/item/SEDP_1971-1972____A21_0.pdf), Definition 5.3 and Proposition 5.6, pp. XXI.2–XXI.4 — Computes the lattice index of a connection with invertible irregular leading coefficient.

<a id="d-curve-index"></a>
### D/curve-index — Index and punctual extension on G_m

**Theorem.** Let E be an algebraic connection on G_m whose singularity at zero is regular. Its algebraic de Rham groups are finite dimensional, vanish outside degrees zero and one, and dim H¹_dR(G_m,E)−dim H⁰_dR(G_m,E)=irr_∞(E). More generally the connection Euler characteristic on a smooth open curve is rank(E)χ_c(U)−Σ_boundary irr_x(E). For j:G_m→A¹, ker(j_!E→j_!*E) and coker(j_!*E→j_*E) have support {0}. The assertion about punctual support does not imply their cohomology vanishes.

**Hypotheses and conventions.** The index uses unshifted DR. The general formula sums over the complete smooth boundary; the G_m specialization uses irr_0=0.

**Prerequisites:** [D/formal-differential-module](#d-formal-differential-module), [D/formal-decomposition](#d-formal-decomposition), `SpringerResolutionAndCharacteristicCycles:H/intermediate-extension` ([supplier packet](../packets/SpringerResolutionAndCharacteristicCycles.json)), `SpringerResolutionAndCharacteristicCycles:H/transfer-and-duality` ([supplier packet](../packets/SpringerResolutionAndCharacteristicCycles.json)), `SchemeAndStackFoundations:SF.3/nonsingular-projective-model` ([supplier packet](../packets/SchemeAndStackFoundations--SF.3.json)), `SchemeAndStackFoundations:SF.3/vector-bundle-riemann-roch` ([supplier packet](../packets/SchemeAndStackFoundations--SF.3.json)), `tauceti:TauCetiRoadmap/AlgebraicCurves#layer-9-kähler-differentials-residues-and-the-comparison`.

**Construction or proof.**

1. Use the smooth projective completion (SF.3/nonsingular-projective-model) and the place expansions at boundary points (AlgebraicCurves Layer 9) to pass to formal differential modules; the meromorphic lattice comparison reduces the global Euler characteristic to that of a pair of coherent lattices on the completion.
2. Apply curve Riemann–Roch (SF.3/vector-bundle-riemann-roch) to their degrees and insert the local index defect of Mal20 Theorem 3.3; D/formal-decomposition identifies the defect with the slope sum.
3. Specialize χ_c(G_m)=0. Restrict the kernel and cokernel of the intermediate-extension maps to G_m and use their zero restriction to obtain punctual support.

**Check.** For the trivial connection on G_m both H⁰ and H¹ have dimension one and irregularity is zero. For E^x on G_m, H⁰=0, dim H¹=1 and irr_∞=1.

**Sources:** [Mal20](https://www.numdam.org/item/SEDP_1971-1972____A20_0.pdf), Theorem 3.3 and Proposition 3.4, pp. XX.9–XX.10 — Computes the local index defect and relates zero irregularity to regular singularity.; [FSY](https://arxiv.org/pdf/1810.06454v5), Appendix A.1, pp. 59–61; (4.11), p. 29 — Uses the curve index and the punctual kernel of the natural extension map.

**Layer acceptance.** Every target above satisfies its stated Check, every definition/construction satisfies its API and unit tests, and all identifications respect the pinned conventions. The planning inventory covers this layer; mathematical closure also requires its supplier requests and inherited proof inputs.

<a id="f"></a>
## Layer F — Exponential connections and Fourier–Laplace operations

Construct exponential twists with connection d+df, Fourier–Laplace transformation with kernel E^{tτ}, additive derived convolution, and localized Fourier transformation. Prove exactness on holonomic modules, Fourier inversion with the sign involution, duality, regular-input slope bounds and the projector/localization identity. Keep unshifted de Rham degrees 0,…,dim X separate from perverse degrees.

**Inputs:** [D](#d), `SpringerResolutionAndCharacteristicCycles:H` ([supplier packet](../packets/SpringerResolutionAndCharacteristicCycles.json)).

**Atlas planets:** Exponential connection; Fourier–Laplace transformation; Additive convolution; Localized Fourier transform; Fourier duality.

<a id="f-exponential-twist"></a>
### F/exponential-twist — Exponential connections and twists

**Construction.** For U smooth and f a regular function, define E^f=(O_U,d+df), the left D_U-module on which a vector field ξ acts by ξ+ξ(f). Construct M⊗E^f and its meromorphic extension at a pole divisor. Its unshifted de Rham differential is ∇_M+df∧. Identify E^f⊗E^g=E^{f+g}, D(E^f)=E^{−f} and h^+E^f=E^{f∘h}, with the normalized D-module inverse-image convention specified separately. On C[t], the rank-one differential is p↦p′+f′p.

**Hypotheses and conventions.** f regular on U; a meromorphic extension explicitly permits poles on the chosen boundary. Duality of a general twisted module is D(M⊗E^f)=DM⊗E^{−f}.

**Prerequisites:** `SpringerResolutionAndCharacteristicCycles:D/differential-operators` ([supplier packet](../packets/SpringerResolutionAndCharacteristicCycles.json)), `SpringerResolutionAndCharacteristicCycles:H/transfer-and-duality` ([supplier packet](../packets/SpringerResolutionAndCharacteristicCycles.json)), `mathlib:Polynomial.derivative`, `mathlib:Polynomial.derivative_mul`.

**Construction or proof.**

1. Define the vector-field action and use the Leibniz and integrability relations of Springer’s D-module algebra to extend it.
2. Apply the existing tensor/transfer and duality functors; compute the differential and its sign in local coordinates.
3. For the affine polynomial check use the pinned Polynomial.derivative and derivative_mul, without introducing a new derivative.

**Planning API.**

- `ExponentialConnection.tensor` — E^f⊗E^g≅E^{f+g}, naturally and associatively.
- `ExponentialConnection.dual` — D(M⊗E^f)≅DM⊗E^{−f}.
- `ExponentialConnection.pullback` — Unshifted connection pullback takes E^f to E^{f∘h}; normalized inverse image adds dim(source)−dim(target).
- `ExponentialConnection.deRham` — DR(M⊗E^f) has differential ∇_M+df∧; on C[t] it is p′+f′p.

**Unit tests.**

- `ExponentialConnection.zero` (degenerate) — E^0 is the existing structure connection O_U.
- `ExponentialConnection.linear` (computation) — For f=ct, the polynomial differential sends 1 to c and tⁿ to ntⁿ⁻¹+ctⁿ.
- `ExponentialConnection.sign` (computation) — On C[t], d/dt+1 is bijective; hence H⁰ and H¹ of (A¹,E^t) vanish.
- `ExponentialConnection.constantGauge` (non-example) — E^t is analytically gauge-trivial on A¹ but is not algebraically isomorphic to O_{A¹}.

**Use:** FSY (A.7)–(A.8), Definition A.18 and Theorem A.24: Defines the faithful fibre and all pair cohomology differentials.

**Check.** Use d+df throughout; Fourier signs and the tg computation must agree with it.

**Sources:** [FSY](https://arxiv.org/pdf/1810.06454v5), Appendix A.1, pp. 60–61; (A.7)–(A.8), p. 64 — Fixes exponential twisting and the de Rham realization convention.; [ESY](https://arxiv.org/pdf/1302.4537v3), §2.1–§2.3, pp. 18–21 — Writes the local exponential connection and the corresponding Rees action.

<a id="f-fourier-laplace"></a>
### F/fourier-laplace — Fourier–Laplace transformation

**Construction.** With input coordinate τ and output coordinate t, define FT_τM=p_{t,+}(p_τ^+M⊗E^{tτ}). On the Weyl-algebra realization, t acts as −∂_τ and ∂_t as τ. This is an exact autoequivalence of holonomic modules and an equivalence on bounded holonomic complexes, with FT_tFT_τ≅r_+ for r(τ)=−τ. Construct its inverse and natural identifications FT(δ_a)=E^{at}, FT(O)=δ_0. The unshifted DR convention makes the transfer pushforward include its relative-dimension shift.

**Hypotheses and conventions.** Both projections are affine-line projections; use Springer’s actual left-module transfer conventions. The intermediate inverse image p^+ in the kernel formula is the unshifted connection inverse image.

**Prerequisites:** [F/exponential-twist](#f-exponential-twist), `SpringerResolutionAndCharacteristicCycles:D/filtered-pbw` ([supplier packet](../packets/SpringerResolutionAndCharacteristicCycles.json)), `SpringerResolutionAndCharacteristicCycles:H/holonomic-modules` ([supplier packet](../packets/SpringerResolutionAndCharacteristicCycles.json)), `SpringerResolutionAndCharacteristicCycles:H/transfer-and-duality` ([supplier packet](../packets/SpringerResolutionAndCharacteristicCycles.json)).

**Construction or proof.**

1. Construct the exact Weyl-algebra automorphism τ↦∂_t and ∂_τ↦−t using the PBW presentation imported from Springer.
2. Compare it with the relative de Rham two-term kernel pushforward; compute its contraction and the required shift.
3. Apply the automorphism twice and compute the cyclic presentations of O and δ_a.

**Planning API.**

- `FourierLaplace.weylAction` — The transported actions are t=−∂_τ and ∂_t=τ.
- `FourierLaplace.exact` — FT is exact on the holonomic heart and takes a short exact sequence to a short exact sequence.
- `FourierLaplace.inversion` — FT_t∘FT_τ≅r_+ and FT⁻¹≅r_+∘FT.
- `FourierLaplace.kernel` — The Weyl realization is naturally isomorphic to p_{t,+}(p_τ^+M⊗E^{tτ}).

**Unit tests.**

- `FourierLaplace.delta` (computation) — FT_τ(δ_a)=E^{at}, including δ_0↦O.
- `FourierLaplace.structure` (computation) — FT_τ(O_{A¹})=δ_0; neither object is sent to zero.
- `FourierLaplace.double` (non-example) — FT_tFT_τ(δ_a)=δ_{−a}, so a nonzero a detects a missing sign.

**Use:** FSY Theorem A.24 and Theorem A.30: Converts tg cohomology into a localized Koszul differential and recovers the costalk.

**Check.** The two Weyl operators obey [∂_t,t]=1 after transport. FT² is pullback by the sign involution, not the identity.

**Sources:** [FSY](https://arxiv.org/pdf/1810.06454v5), §2.1, Proposition 2.4 and its proof, pp. 10–11; Appendix A.1, p. 61 — Fixes the Fourier convention, exactness and its kernel interpretation.

<a id="f-additive-convolution"></a>
### F/additive-convolution — Additive convolution

**Construction.** For holonomic complexes on A¹ let M⋆N=s_+(M⊠N), where s(x,y)=x+y, and construct the associative symmetric derived convolution with unit δ_0. Prove FT(M⋆N)≅FT(M)⊗^L_O FT(N). For regular holonomic modules the possible off-heart convolution cohomology is constant and occurs in negative degrees; do not declare all such convolutions exact before applying Π. Lift this construction to derived Hodge modules using H.1/operations.

**Hypotheses and conventions.** The tensor product on the Fourier side is the unshifted connection tensor, with the transfer shifts fixed by F/fourier-laplace. The Hodge-module lift is a consequence of the operations layer, not an input to its construction.

**Prerequisites:** [F/fourier-laplace](#f-fourier-laplace), [B/middle-perverse](#b-middle-perverse), `SpringerResolutionAndCharacteristicCycles:H/transfer-and-duality` ([supplier packet](../packets/SpringerResolutionAndCharacteristicCycles.json)).

**Construction or proof.**

1. Use the addition morphism and the Springer external product and transfer functors; prove associativity and symmetry by projection formula and change of variables.
2. Compare the two exponential kernels to obtain the Fourier tensor identity.
3. For regular holonomic heart inputs use the one-dimensional affine pushforward bounds and the constant nature of off-heart terms; Hodge lifts then use rat and DR compatibility.

**Planning API.**

- `AdditiveConvolution.associator` — (M⋆N)⋆P≅M⋆(N⋆P), coherently with symmetry and δ_0.
- `AdditiveConvolution.fourier` — FT intertwines convolution with the connection tensor product.
- `AdditiveConvolution.translate` — δ_a⋆M is the translate of M by a.
- `AdditiveConvolution.constantTerms` — For regular holonomic heart inputs each off-degree-zero cohomology is constant.

**Unit tests.**

- `AdditiveConvolution.pointMasses` (computation) — δ_a⋆δ_b=δ_{a+b}.
- `AdditiveConvolution.zero` (degenerate) — M⋆0=0 and 0⋆M=0.
- `AdditiveConvolution.nonexact` (non-example) — O⋆O has a nonzero constant negative-degree term, so ordinary derived convolution is not an exact operation on the whole regular heart.

**Use:** FSY Appendix A.3, (A.5): Constructs Π, exponential tensor products and the monoidal fibre.

**Check.** δ_0⋆M≅M. The tensor unit of EMHS will be Πδ_0, rather than the derived-convolution unit itself.

**Sources:** [KS](https://arxiv.org/pdf/1006.2706v2), §4.2, pp. 27–31 — Builds the convolution realization of the global-cohomology quotient.; [FSY](https://arxiv.org/pdf/1810.06454v5), Appendix A.1, p. 61; (A.5) and Remark A.6, pp. 63–64 — Uses the derived convolution and its Hodge-module lift.

<a id="f-localized-fourier"></a>
### F/localized-fourier — Localized Fourier transform

**Construction.** For j_0:G_m→A¹, define the localized Fourier functor on holonomic G_m-modules by ℱ=j_0^+∘FT∘j_{0,+}, and similarly on complexes. The first j_0^+ is restriction to the output punctured line. If the input is regular holonomic at every singularity including the compactification boundary, ℱ(M) is a connection on G_m, regular singular at output zero, with formal slopes contained in {0,1} at output infinity. Prove compatibility with restriction of FT and retain the distinction between j_{0,+}, j_{0,!} and j_{0,!*}.

**Hypotheses and conventions.** The input may have singularities inside G_m. Regular singularity at the boundary is part of the hypothesis; a general irregular input has different Fourier slopes.

**Prerequisites:** [F/fourier-laplace](#f-fourier-laplace), [D/formal-decomposition](#d-formal-decomposition), `SpringerResolutionAndCharacteristicCycles:H/regular-holonomic` ([supplier packet](../packets/SpringerResolutionAndCharacteristicCycles.json)), `SpringerResolutionAndCharacteristicCycles:H/intermediate-extension` ([supplier packet](../packets/SpringerResolutionAndCharacteristicCycles.json)).

**Construction or proof.**

1. Compose the imported localization/restriction with F/fourier-laplace.
2. Use the formal decomposition and local stationary phase: an input singular point c≠0 contributes E^{ct} times a regular factor (slope one) at output infinity, the input point 0 contributes the slope-zero part at output infinity, and the regular input infinity contributes only at output zero, where the result is regular singular.
3. Check the output at nonzero finite points by the same localized Weyl calculation and establish regularity at zero.

**Planning API.**

- `LocalizedFourier.apply` — ℱ(M)=j_0^+FT(j_{0,+}M), with an explicit natural identification on morphisms.
- `LocalizedFourier.exact` — The localized functor is exact on holonomic modules.
- `LocalizedFourier.regularInput` — A globally regular holonomic input gives an output connection with regular zero and infinity slopes in {0,1}.
- `LocalizedFourier.extensionComparison` — Changing an extension by a constant module is invisible after output restriction of FT.

**Unit tests.**

- `LocalizedFourier.punctual` (computation) — For a≠0, ℱ(δ_a)=E^{at}|_{G_m}, with slope one at infinity.
- `LocalizedFourier.zero` (degenerate) — ℱ(0)=0.
- `LocalizedFourier.regularityBoundary` (non-example) — A rank-one exponential input with a higher-order pole is outside the regular-input slope statement; it must not be accepted by that hypothesis.

**Use:** KloostermanMomentsAndPotentialAutomorphy; FSY §2.1: Supplies the general localized Fourier interface for the companion’s recursive connections.

**Check.** No assertion is made that FT preserves regularity at infinity.

**Sources:** [FSY](https://arxiv.org/pdf/1810.06454v5), §2.1, Proposition 2.4 and its proof, pp. 10–11; Appendix A.1, p. 61 — Defines localized Fourier transformation and states its regular-input singularity bounds.

<a id="f-fourier-duality"></a>
### F/fourier-duality — Fourier duality and the sign involution

**Theorem.** For holonomic M on A¹, D FT(M)≅r_+FT(DM), compatibly with biduality, where r(t)=−t. Under the Fourier tensor/convolution comparison the natural !→+ maps and intermediate images retain their dual maps. In particular Fourier–Laplace transformation with the negative kernel gives the dual kernel, and applying duality twice returns the original identification.

**Hypotheses and conventions.** D is holonomic duality, including the dimension shift of Springer H/transfer-and-duality.

**Prerequisites:** [F/exponential-twist](#f-exponential-twist), [F/fourier-laplace](#f-fourier-laplace), [F/additive-convolution](#f-additive-convolution), `SpringerResolutionAndCharacteristicCycles:H/transfer-and-duality` ([supplier packet](../packets/SpringerResolutionAndCharacteristicCycles.json)).

**Construction or proof.**

1. Dualize the relative exponential kernel and use E^{tτ}∨=E^{−tτ}.
2. Change the output coordinate by r and use transfer duality; verify the comparison on the Weyl presentations so that the biduality signs agree.

**Check.** On δ_a the assertion compares the dual of E^{at} with E^{−at}. A comparison without r fails for a≠0.

**Sources:** [FSY](https://arxiv.org/pdf/1810.06454v5), Proof of Theorem A.24(1), p. 69 — Uses the isomorphism between the Fourier transform of a !-localized module and the sign-involution pullback of the dual of the Fourier transform of the dual, citing Malgrange's book (Appendix 2, Proposition 1.7).

**Layer acceptance.** Every target above satisfies its stated Check, every definition/construction satisfies its API and unit tests, and all identifications respect the pinned conventions. The planning inventory covers this layer; mathematical closure also requires its supplier requests and inherited proof inputs.

<a id="h0"></a>
## Layer H.0 — Pure and mixed Hodge modules

Construct compatible good F,V and Rees modules; define polarizable pure Hodge modules by strict support, recursive specialization and primitive polarizations. Build graded-polarizable algebraic mixed Hodge modules by admissibility and relative monodromy, not by a bare tuple. Prove strict-support extension and semisimplicity, the polarized projective direct-image theorem and abelian strictness. The construction is in every smooth quasi-projective dimension, including the dimensions of pair pushforwards. At a point compare with the existing Tau Ceti rational mixed Hodge structures.

**Inputs:** [B](#b), [D](#d), `HodgeStructuresPartII:H.0` ([supplier packet](../packets/HodgeStructuresPartII.json)), `HodgeStructuresPartII:H.2` ([supplier packet](../packets/HodgeStructuresPartII.json)), `HodgeStructuresPartII:H.6` ([supplier packet](../packets/HodgeStructuresPartII.json)), `LefschetzPencilsAndVanishingCycles:LPV.1`, `LefschetzPencilsAndVanishingCycles:LPV.3`, `AlgebraicModuliForArithmeticGeometry:R09.7` ([supplier packet](../packets/AlgebraicModuliForArithmeticGeometry--R09.7.json)), `SpringerResolutionAndCharacteristicCycles:D` ([supplier packet](../packets/SpringerResolutionAndCharacteristicCycles.json)).

**Atlas planets:** Kashiwara–Malgrange filtration; Polarizable Hodge module; Strict-support extension; Zucker curve Hodge theorem; Saito projective direct image; Mixed Hodge module.

<a id="h0-filtered-rees"></a>
### H.0/filtered-rees — Compatible filtrations and Rees modules

**Construction.** For a regular holonomic left D_X-module with a good increasing filtration F, construct R_FM=⊕_p F_pM z^p and the Rees ring R_FD_X. Goodness means local finite generation over the Rees ring, not arbitrary coherent pieces. Strict filtered morphisms are exactly those whose Rees cokernel has no z-torsion. Construct compatible multiple filtrations by requiring that the associated cubes of intersections and quotients are exact. Side changing to right modules is F_p(M^r)=ω_X⊗F_{p+d}M for d=dim X; weights are unchanged. Define filtered pDR by F_p(pDR M)^j=Ω_X^{j+d}⊗F_{p+j+d}M for −d≤j≤0.

**Hypotheses and conventions.** F is exhaustive, locally bounded below and good. For several filtrations, pairwise strictness alone does not replace compatibility.

**Prerequisites:** `SpringerResolutionAndCharacteristicCycles:D/good-filtration` ([supplier packet](../packets/SpringerResolutionAndCharacteristicCycles.json)), `SpringerResolutionAndCharacteristicCycles:D/filtered-pbw` ([supplier packet](../packets/SpringerResolutionAndCharacteristicCycles.json)), `HodgeStructuresPartII:H.0/rees-parameter` ([supplier packet](../packets/HodgeStructuresPartII.json)), `HodgeStructuresPartII:H.0/rees-specialization` ([supplier packet](../packets/HodgeStructuresPartII.json)).

**Construction or proof.**

1. Import good filtrations and the filtered PBW algebra from Springer; form the graded Rees module and its specialization z=1 and z=0. For an O-locally free module with connection, compare with the λ-connection Rees family of HodgeStructuresPartII H.0/rees-parameter and H.0/rees-specialization via F_p=F^{−p} and z=t.
2. Prove the z-torsion criterion by the short exact sequence of filtered modules and the intersection formula for an image.
3. Use Saito’s exact-cube criterion for multiple filtrations. Derive side changing from F_{−d}ω_X=ω_X and check the filtered Spencer complex.

**Planning API.**

- `FilteredRees.specialise` — At z=1 recover M and at z=0 recover gr_F M.
- `FilteredRees.strict` — An exact underlying sequence is strictly exact if and only if its Rees sequence is exact.
- `FilteredRees.sideChange` — F_p of the right module is ω_X⊗F_{p+d} of the left module.
- `FilteredRees.compatible` — Compatible F,W,V permit iterated associated gradeds and their canonical interchange isomorphisms.

**Unit tests.**

- `FilteredRees.constant` (compatibility) — The constant O_X has right F_{−d}=ω_X and right F_{−d−1}=0.
- `FilteredRees.nonStrict` (non-example) — The identity of a line whose source filtration starts at 1 and target filtration at 0 is filtered but not strict.
- `FilteredRees.pointImage` (computation) — For i:pt→A¹, F_p i_+V=Σ_{k≥0}F_{p−1−k}V·∂^k; its filtered unshifted DR H¹ has the original F on V.

**Use:** ESY §2.3–§3.3; FSY Proposition A.10: Controls filtered Fourier specialization and simultaneous weight/Hodge strictness.

**Check.** The constant left module has F_0O_X=O_X; its right version first occurs at F_{−d}. For a point included in a smooth curve, the left direct image of F_0V starts in F_1.

**Sources:** [Sai88](https://ems.press/content/serial-article-files/42460?nt=1), Introduction, pp. 849–850; §1.1, pp. 861–865; §2.1–§2.2, pp. 876–886 — Sets the right-module shift, exact compatibility of filtrations and filtered differential complexes.; [ESY](https://arxiv.org/pdf/1302.4537v3), §2.2, pp. 19–20 — Uses Rees modules and z-torsion to formulate strictness.

<a id="h0-v-filtration"></a>
### H.0/v-filtration — Rational specialization filtration

**Construction.** For a regular holonomic module, quasi-unipotent along a smooth coordinate x=0, construct its unique increasing rational Kashiwara–Malgrange filtration V_α with coherent V_0D-lattices, exhaustive and locally discrete, xV_α⊂V_{α−1}, ∂_xV_α⊂V_{α+1}, and x∂_x+α nilpotent on gr^V_α. Set gr^V_α=V_α/V_{<α}. For a good F impose x:F_pV_α→F_pV_{α−1} is an isomorphism for α<1, and ∂_x:F_p gr^V_α→F_{p+1}gr^V_{α+1} is an isomorphism for α>0. Define cycles for a general function by its graph direct image; keep the graph’s codimension-one F shift. Compare the appropriate fundamental interval with the normalized Betti cycles.

**Hypotheses and conventions.** The indexing here is the increasing left-module convention used for the Deligne filtration; translation from Saito’s decreasing left convention is explicit. For Hodge modules the F,V strict-specializability conditions are axioms, then consequences for all admissible functions.

**Prerequisites:** [H.0/filtered-rees](#h0-filtered-rees), [B/betti-cycles](#b-betti-cycles), [B/regular-riemann-hilbert](#b-regular-riemann-hilbert), `SpringerResolutionAndCharacteristicCycles:H/kashiwara-equivalence` ([supplier packet](../packets/SpringerResolutionAndCharacteristicCycles.json)), `SpringerResolutionAndCharacteristicCycles:H/regular-holonomic` ([supplier packet](../packets/SpringerResolutionAndCharacteristicCycles.json)).

**Construction or proof.**

1. Use the explicitly requested Bernstein b-function/specializability theorem of Springer H/regular-holonomic to construct coherent V lattices, and move the roots into a fundamental interval using x and ∂_x. Quasi-unipotence makes the exponents rational; regularity alone is not that rationality assertion.
2. Uniqueness follows from the generalized eigenspaces and the shift relations. Translate Saito’s right-module conventions by H.0/filtered-rees.
3. Construct the graph direct image, compare its graded de Rham complex with Betti nearby cycles (Sai88 Proposition 3.4.12: the de Rham complexes of gr^V_α for α in the fundamental intervals are ψ_{f,λ} and φ_{f,1} of DR M, with x∂_x+α, ∂_x and x matching N, can and var), and transport the F conditions through the graph shift. This is the compatibility of Riemann–Hilbert with nearby and vanishing cycles.

**Planning API.**

- `SpecialisationFiltration.unique` — The coherence, eigenvalue and shift conditions characterize V.
- `SpecialisationFiltration.graph` — The construction for f is independent of local coordinates after graph direct image.
- `SpecialisationFiltration.rat` — The graded de Rham complex identifies with the corresponding Betti nearby or vanishing eigenspace.
- `SpecialisationFiltration.filteredShift` — Multiplication and differentiation have the stated filtered isomorphism ranges.

**Unit tests.**

- `SpecialisationFiltration.trivial` (computation) — For O(*0), the class of x^k has index −k and x∂ has eigenvalue k.
- `SpecialisationFiltration.kummer` (computation) — For x∂e=ae, x^ke has index −a−k, so nonintegral rational a gives nonintegral jumps.
- `SpecialisationFiltration.punctual` (non-example) — A module supported at zero has zero nearby cycles; it contributes through vanishing cycles instead.

**Use:** ESY Definition 2.2.1 and Lemma 2.3.3: Builds the local Deligne filtration and proves its Rees description.

**Check.** For O(*0), V_α=x^{−floor(α)}O for nonintegral α with the endpoint convention determined by x∂+α. The fundamental interval includes every monodromy eigenspace, not only eigenvalue one.

**Sources:** [Sai88](https://ems.press/content/serial-article-files/42460?nt=1), §3.1–§3.2, especially Lemma 3.1.2 and §3.2.1–§3.2.6, pp. 902–908 — Defines rational specialization, proves uniqueness and gives the F-compatibility conditions; existence of specializability is the explicit Springer extension request.; [ESY](https://arxiv.org/pdf/1302.4537v3), §2.1 and §2.3, pp. 18–21 — Uses the increasing V convention in the Deligne construction.; [Sai88](https://ems.press/content/serial-article-files/42460?nt=1), §3.4, Proposition 3.4.12 and its proof, pp. 924–925 — Identifies the de Rham complexes of the V-graded pieces with nearby and vanishing cycles of the de Rham complex, matching the Euler operator, ∂ and multiplication with N, can and var.

<a id="h0-pure-hodge-module"></a>
### H.0/pure-hodge-module — Polarizable pure Hodge modules

**Definition.** Define MH(X,w)^pol inside good filtered regular holonomic modules with rational perverse realization by Saito’s induction on support dimension: finite direct sums by strict support; at points polarizable rational pure Hodge structures of weight w; strict specializability along local functions; for functions nonconstant on the strict-support component, the monodromy filtration on nearby cycles centered at w−1 and on unipotent vanishing cycles centered at w, and pure polarized primitive graded pieces on the smaller support. A function identically zero on a component is handled by its supported/Kashiwara clause, not by a false decrease of support dimension. A polarization is a nondegenerate rational duality M→D M(−w) satisfying the primitive sign and positivity conditions of Saito 5.2.10. Strict support means absence of subobjects and quotients on a smaller closed support. On a smooth d-dimensional support the smooth objects are polarizable rational variations of weight w−d.

**Hypotheses and conventions.** All local specialization tests in the recursive definition are required. Rational polarizations need a rational extension of the existing integral polarization interface; no integral lattice is silently imposed.

**Prerequisites:** [H.0/filtered-rees](#h0-filtered-rees), [H.0/v-filtration](#h0-v-filtration), [B/regular-riemann-hilbert](#b-regular-riemann-hilbert), `tauceti:TauCeti.Hodge.HodgeStructureOn`, `SpringerResolutionAndCharacteristicCycles:H/kashiwara-equivalence` ([supplier packet](../packets/SpringerResolutionAndCharacteristicCycles.json)), `HodgeStructuresPartII:H.2/graded-polarizable` ([supplier packet](../packets/HodgeStructuresPartII--H.2.json)), `LefschetzPencilsAndVanishingCycles:LPV.1/monodromy-filtration` ([supplier packet](../packets/LefschetzPencilsAndVanishingCycles--LPV.0.json)), `LefschetzPencilsAndVanishingCycles:LPV.1/primitive-decomposition-and-strictness` ([supplier packet](../packets/LefschetzPencilsAndVanishingCycles--LPV.0.json)).

**Construction or proof.**

1. Form the rationally realized filtered category via regular Riemann–Hilbert, with the existing pure Hodge structure as the point carrier.
2. Use support-dimension recursion with H.0/v-filtration and the monodromy-filtration linear algebra of LefschetzPencilsAndVanishingCycles LPV.1; impose the primitive pairing conditions as in Saito 5.1.6 and 5.2.10.
3. Prove independence of embeddings by Kashiwara equivalence and verify the weight shift on smooth supports.

**Planning API.**

- `PureHodgeModule.rat` — The rational realization is a faithful exact functor to Perv(X,Q).
- `PureHodgeModule.smooth` — Smooth weight-w objects on a smooth d-fold are polarizable variations of weight w−d.
- `PureHodgeModule.point` — At a point identify with polarizable rational pure structures on the existing HodgeStructureOn carrier.
- `PureHodgeModule.primitive` — Primitive nearby-cycle pieces carry the required shifted weight and polarization.

**Unit tests.**

- `PureHodgeModule.constantCurve` (computation) — pQ_{A¹} has weight one, not zero.
- `PureHodgeModule.pointTate` (compatibility) — The point Q(m) has weight −2m with the existing Tate filtration.
- `PureHodgeModule.unpolarizable` (non-example) — A rational pure structure admitting no polarization is excluded even if its complex filtration is opposed.

**Use:** Sai88 Theorem 5.3.1; FSY Remark A.6 and Corollary A.31: Supplies projective strictness, exponential weights and the pure-input costalk computation.

**Check.** A tuple (M,F,K) without these specialization conditions is not a pure Hodge module. On X smooth d-dimensional, pQ_X has weight d and D(pQ_X)=pQ_X(d).

**Sources:** [Sai88](https://ems.press/content/serial-article-files/42460?nt=1), Definition 5.1.6, pp. 955–956; Definition 5.2.10 and 5.2.11–5.2.14, pp. 967–970 — Defines pure Hodge modules recursively and specifies polarizations of their primitive parts.

<a id="h0-strict-support-extension"></a>
### H.0/strict-support-extension — Strict-support extension and semisimplicity

**Theorem.** A polarizable variation of weight w−d on a dense smooth open subset of an irreducible d-dimensional support, with quasi-unipotent boundary monodromy, has a unique pure Hodge-module extension of weight w with that strict support. Its perverse realization is intermediate extension. Every polarizable pure Hodge module decomposes uniquely by strict support and is semisimple; morphisms preserve support summands and are strict for F.

**Hypotheses and conventions.** Algebraic variations have the prescribed regular/admissible boundary behavior.

**Prerequisites:** [H.0/pure-hodge-module](#h0-pure-hodge-module), [B/middle-perverse](#b-middle-perverse), `SpringerResolutionAndCharacteristicCycles:H/intermediate-extension` ([supplier packet](../packets/SpringerResolutionAndCharacteristicCycles.json)), `HodgeStructuresPartII:H.2/canonical-extension` ([supplier packet](../packets/HodgeStructuresPartII--H.2.json)), `HodgeStructuresPartII:H.2/admissible-variation` ([supplier packet](../packets/HodgeStructuresPartII--H.2.json)), `HodgeStructuresPartII:H.2/limit-mhs` ([supplier packet](../packets/HodgeStructuresPartII--H.2.json)).

**Construction or proof.**

1. Construct the filtered extension locally from the canonical extension (HodgeStructuresPartII H.2/canonical-extension, with quasi-unipotent boundary monodromy by H.2/admissible-variation and the limit mixed Hodge structure of H.2/limit-mhs) and V lattices, and verify the recursive primitive polarization conditions by induction on the support.
2. Uniqueness uses absence of boundary-supported subquotients. Polarization splits a subobject by its orthogonal complement, giving semisimplicity and strictness.

**Check.** The middle extension differs from j_* when local monodromy has invariants. The direct-sum assertion is for pure polarizable objects, not arbitrary mixed extensions.

**Sources:** [Sai88](https://ems.press/content/serial-article-files/42460?nt=1), Lemmas 5.1.8–5.1.10, pp. 957–958; 5.2.12–5.2.14, pp. 968–969 — Gives the strict-support and smooth-variation description and the polarizable semisimplicity mechanism.

<a id="h0-curve-l2-hodge"></a>
### H.0/curve-l2-hodge — Hodge theory of a punctured-curve variation

**Theorem.** Let j:C°→C be the complement of finitely many points in a compact smooth complex curve, and let V be a polarizable variation of pure weight m with quasi-unipotent monodromy. H^i(C,j_*V) is finite dimensional and has a functorial polarizable pure Hodge structure of weight m+i. Its filtered L² de Rham realization gives Hodge decomposition and E₁ degeneration. These are the curve intersection-cohomology groups used in the projective direct-image induction.

**Hypotheses and conventions.** Use the complete Poincaré metric near the punctures and the Hodge metric of V. The analytic closed-range input is recorded as gap G1, rather than inferred from a compact-manifold Laplacian.

**Prerequisites:** `HodgeStructuresPartII:H.6` ([supplier packet](../packets/HodgeStructuresPartII.json)), [B/constructible-six-operations](#b-constructible-six-operations), `HodgeStructuresPartII:H.2/graded-polarizable` ([supplier packet](../packets/HodgeStructuresPartII--H.2.json)), `HodgeStructuresPartII:H.2/canonical-extension` ([supplier packet](../packets/HodgeStructuresPartII--H.2.json)).

**Construction or proof.**

1. Use the canonical extension (HodgeStructuresPartII H.2/canonical-extension) and the nilpotent-orbit norm estimates to compute the weighted L² stalk complex and identify it with j_*V by the local Poincaré lemma.
2. Identify the filtered local Dolbeault complex using Zucker’s local Hardy estimates and curvature identities.
3. Apply the self-adjoint closed-range Hodge theorem for these domains to obtain harmonic representatives and the Hodge decomposition; the gap records this precise analytic dependency. The integrated pairing gives polarization.

**Check.** For a constant Q variation, recover H^i(C,Q), not H^i(C°,Q). The weight of H¹ is m+1.

**Sources:** [Zucker](https://www.math.stonybrook.edu/~cschnell/mat690/Zucker.pdf), Theorem 4.8, p. 434; §5–§6, pp. 434–444; Theorem 7.12, Corollary 7.13 and Proposition 8.2, pp. 446–448 — Identifies the L² complex, proves its Hodge decomposition and establishes functoriality.

<a id="h0-projective-direct-image"></a>
### H.0/projective-direct-image — Polarized projective direct images

**Theorem.** For f:X→Y projective between smooth complex algebraic varieties and M pure polarizable of weight w, the filtered direct image is strict, and each H^j f_*M is pure polarizable of weight w+j. A relatively ample class ℓ gives ℓ^k:H^{−k}f_*M≅H^k f_*M(k) for k≥0; its primitive parts carry the induced polarizations. In particular the associated Hodge-to-de Rham spectral sequences of a projective direct image degenerate at E₁.

**Hypotheses and conventions.** Projectivity, purity and polarizability are essential. The operations here use bare filtered transfer; the theorem is an input to the mixed six-functor construction.

**Prerequisites:** [H.0/filtered-rees](#h0-filtered-rees), [H.0/v-filtration](#h0-v-filtration), [H.0/pure-hodge-module](#h0-pure-hodge-module), [H.0/strict-support-extension](#h0-strict-support-extension), [H.0/curve-l2-hodge](#h0-curve-l2-hodge), `HodgeStructuresPartII:H.6` ([supplier packet](../packets/HodgeStructuresPartII.json)), `SpringerResolutionAndCharacteristicCycles:H/transfer-and-duality` ([supplier packet](../packets/SpringerResolutionAndCharacteristicCycles.json)), `LefschetzPencilsAndVanishingCycles:LPV.3/existence-of-lefschetz-pencils` ([supplier packet](../packets/LefschetzPencilsAndVanishingCycles--LPV.0.json)), `LefschetzPencilsAndVanishingCycles:LPV.1/primitive-decomposition-and-strictness` ([supplier packet](../packets/LefschetzPencilsAndVanishingCycles--LPV.0.json)).

**Construction or proof.**

1. Induct on the strict-support dimension. Reduce the nontrivial support case by a Lefschetz pencil on the smooth projective ambient variety (LefschetzPencilsAndVanishingCycles LPV.3/existence-of-lefschetz-pencils, over C) and use H.0/curve-l2-hodge for its variation on the punctured pencil base.
2. Apply specialization and primitive polarizations to compare the pencil’s nearby terms and prove relative hard Lefschetz.
3. Use the polarized primitive decomposition and strict filtered specialization to prove z-torsion-freeness of the direct-image cohomology; obtain the weight and polarization statements.

**Check.** For f:P¹→pt and pQ_{P¹}, the nonzero direct-image degrees are j=−1,1 with weights 0,2. The corresponding objects are Q and Q(−1).

**Sources:** [Sai88](https://ems.press/content/serial-article-files/42460?nt=1), Theorem 5.3.1, p. 977; proof §5.3.3–§5.3.11, pp. 978–988 — Proves strict projective direct image, relative hard Lefschetz and primitive polarizations through support induction.

<a id="h0-mixed-hodge-module"></a>
### H.0/mixed-hodge-module — Admissible graded-polarizable mixed Hodge modules

**Definition.** Construct the algebraic category MHM(X) by Saito’s admissible gluing definition: a rationally realized good filtered regular holonomic module, a finite increasing W with gr^W_w in MH(X,w)^pol, compatibility of F,W,V under local graph specialization, existence of the relative monodromy filtration on nearby cycles, and admissible gluing across every local hypersurface. Require the admissible variation condition on a dense smooth open support and the recursive vanishing-cycle condition on the complement. In the algebraic case require the extendability condition at a good compactification used in Saito 4.1 (with Remark 3.29). Morphisms preserve the full realized filtered structure. Use ambient support categories for singular closed supports.

**Hypotheses and conventions.** All objects are rational and graded-polarizable. A finite W with pure graded objects in the ambient filtered category alone is insufficient: admissibility and relative monodromy are required.

**Prerequisites:** [H.0/filtered-rees](#h0-filtered-rees), [H.0/v-filtration](#h0-v-filtration), [H.0/pure-hodge-module](#h0-pure-hodge-module), [H.0/strict-support-extension](#h0-strict-support-extension), [B/betti-cycles](#b-betti-cycles), `HodgeStructuresPartII:H.2/admissible-variation` ([supplier packet](../packets/HodgeStructuresPartII--H.2.json)), `HodgeStructuresPartII:H.2/graded-polarizable` ([supplier packet](../packets/HodgeStructuresPartII--H.2.json)), `LefschetzPencilsAndVanishingCycles:LPV.1/relative-monodromy-uniqueness` ([supplier packet](../packets/LefschetzPencilsAndVanishingCycles--LPV.0.json)), `LefschetzPencilsAndVanishingCycles:LPV.1/monodromy-filtration` ([supplier packet](../packets/LefschetzPencilsAndVanishingCycles--LPV.0.json)), `AlgebraicModuliForArithmeticGeometry:R09.7/snc-compactification` ([supplier packet](../packets/AlgebraicModuliForArithmeticGeometry--R09.7.json)), `AlgebraicModuliForArithmeticGeometry:R09.7/embedded-resolution` ([supplier packet](../packets/AlgebraicModuliForArithmeticGeometry--R09.7.json)).

**Construction or proof.**

1. Form the category of weakly mixed realized objects with pure weight-graded pieces.
2. Impose the local admissibility conditions of Saito 2.17, using compatible filtrations and the relative-monodromy supplier. Glue across hypersurfaces with can and var, checking independence of defining function and embeddings.
3. Apply the algebraic extendability condition of 4.1 on SNC compactifications (AlgebraicModuliForArithmeticGeometry R09.7/snc-compactification, with R09.7/embedded-resolution for singular supports) and prove locality and independence using the admissible gluing equivalence.

**Planning API.**

- `MixedHodgeModule.weightGraded` — gr^W_w is pure polarizable of weight w.
- `MixedHodgeModule.admissibility` — The local F,W,V compatibility and relative-monodromy/gluing tests characterize admissibility.
- `MixedHodgeModule.support` — A closed embedding identifies MHM of its support with the corresponding supported ambient objects.
- `MixedHodgeModule.point` — MHM(pt) is equivalent to finite-dimensional graded-polarizable rational mixed Hodge structures. Realize these on TauCeti.Hodge.MixedHodgeStructure by taking its abelian group to be the rational space itself with the identity as rational model; the pinned morphisms are already rational-linear, and finite dimension and graded polarizability are added conditions the pinned carrier does not impose.

**Unit tests.**

- `MixedHodgeModule.pointTate` (compatibility) — At a point Q(−1) has only W_2/W_1 nonzero and F¹=C.
- `MixedHodgeModule.mixedExtension` (computation) — An admissible extension of Q(0) by Q(1) can have both weights 0 and −2; it need not split.
- `MixedHodgeModule.badVariation` (non-example) — A variation with no relative monodromy filtration at its boundary is excluded despite pure graded fibres.

**Use:** FSY Appendix A.2–A.7; ESY §3.3: Supplies the actual input category for the projector, pair cohomology and weight dévissage.

**Check.** At a point this category is the graded-polarizable rational subcategory of the existing mixed Hodge structures. The definition applies in every dimension needed by U and U×A¹, not just on curves.

**Sources:** [Sai90](https://ems.press/content/serial-article-files/42511), §2.17, pp. 256–258; Remark 3.29, p. 313; §4.1, p. 314 — Defines the admissible local category and its algebraic extension condition.

<a id="h0-abelian-strictness"></a>
### H.0/abelian-strictness — Abelian structure and simultaneous strictness

**Theorem.** MHM(X) is abelian, its rational realization is exact and faithful, and every morphism is strictly compatible with F and W, including the intersections W_n∩F_p. Kernels, images and cokernels carry the induced admissible structures. At a point its equivalence with graded-polarizable rational mixed Hodge structures identifies F,W and their strict morphisms with the pinned Tau Ceti definitions.

**Hypotheses and conventions.** Simultaneous strictness is formulated through compatible filtrations, not deduced from separate strictness without a compatibility argument.

**Prerequisites:** [H.0/mixed-hodge-module](#h0-mixed-hodge-module), [H.0/strict-support-extension](#h0-strict-support-extension), [H.0/filtered-rees](#h0-filtered-rees), `tauceti:TauCeti.Hodge.MixedHodgeStructure`, `tauceti:TauCeti.Hodge.MixedHodgeStructure.Hom.range_inf_F_eq_map_F`, `tauceti:TauCeti.Hodge.MixedHodgeStructure.Hom.range_inf_WQ_eq_map_WQ`, `tauceti:TauCeti.Hodge.MixedHodgeStructure.Hom.range_inf_iSup_deligneSplittingFamily_eq_map_iSup`.

**Construction or proof.**

1. Construct kernels and cokernels through the local admissible gluing presentation and use pure semisimplicity on gr^W.
2. Apply compatibility of F,W,V to the exact gluing diagrams, deducing strictness of the associated multi-filtered cubes.
3. At a point identify the defining weight-graded purity with the existing MixedHodgeStructure and its base-change maps; compare range-intersection identities with the pinned strictness theorems. Simultaneous strictness for W_k∩F^p at a point is the pinned bigrading strictness range_inf_iSup_deligneSplittingFamily_eq_map_iSup for the bidegree set {(r,s): p≤r, r+s≤k}, since W_k∩F^p is the sum of the Deligne pieces over that set.

**Check.** Morphisms need not split; strictness survives their kernels and images. The point comparison retains rational base change and graded polarizability.

**Sources:** [Sai90](https://ems.press/content/serial-article-files/42511), Introduction 0.1–0.2, pp. 221–223; §2.2–§2.4, pp. 237–240; §4.1, pp. 314–316 — Establishes abelianity, exact realization and the point comparison.

**Layer acceptance.** Every target above satisfies its stated Check, every definition/construction satisfies its API and unit tests, and all identifications respect the pinned conventions. The planning inventory covers this layer; mathematical closure also requires its supplier requests and inherited proof inputs.

<a id="h1"></a>
## Layer H.1 — Hodge-module operations, weights and specialization

Lift f_*, f_!, f*, f!, external products, duality and Tate twists to bounded derived Hodge modules and establish weight inequalities. Construct normalized nearby and vanishing cycles with can, var and N. Prove curve rank and pure costalk formulas and constant-divisor localization, including singular reduced divisors through the supported ambient category. Normalize D(pQ_U)=pQ_U(dim U) and i* pQ_U=pQ_D[1].

**Inputs:** [H.0](#h0), [B](#b), `LefschetzPencilsAndVanishingCycles:LPV.1`, `HodgeStructuresPartII:H.2` ([supplier packet](../packets/HodgeStructuresPartII.json)).

**Atlas planets:** Hodge-module operations; Hodge nearby cycles; Pure Hodge-module costalk; Divisor localization.

<a id="h1-operations"></a>
### H.1/operations — Derived Hodge-module operations

**Construction.** Construct on DᵇMHM the functors f_*, f_!, f*, f!, D, external product, derived Hodge tensor and Tate twists, with adjunctions, composition, proper base change, projection formula and open/closed localization. The faithful rational realization commutes with their Betti counterparts, and filtered de Rham realization with normalized D-module transfer. Define the Hodge tensor by Δ* of the external product. It is not the unshifted O-module tensor on arbitrary left D-modules. On a smooth d-fold D(pQ_X)=pQ_X(d); Q(m) shifts weights by −2m and F^p to F^{p+m}.

**Hypotheses and conventions.** Maps are algebraic between the quasi-projective varieties and supported ambient categories in scope.

**Prerequisites:** [H.0/projective-direct-image](#h0-projective-direct-image), [H.0/mixed-hodge-module](#h0-mixed-hodge-module), [H.0/abelian-strictness](#h0-abelian-strictness), [B/constructible-six-operations](#b-constructible-six-operations), `SpringerResolutionAndCharacteristicCycles:H/transfer-and-duality` ([supplier packet](../packets/SpringerResolutionAndCharacteristicCycles.json)), `tauceti:TauCeti.Hodge.tate`, `tauceti:TauCeti.Hodge.HodgeStructureOn.tateTwist`.

**Construction or proof.**

1. Construct external products and projective direct images first, using pure projective strictness and weight dévissage.
2. Construct open extension and inverse images via admissible gluing; factor an algebraic map into an immersion followed by a projective projection, and prove independence by base change.
3. Define dual operations by D, obtain tensor from the diagonal, and prove the identities after the compatible rational and filtered realizations.

**Planning API.**

- `HodgeOperations.rat` — Every listed operation commutes with rational realization.
- `HodgeOperations.localisation` — j_!j*M→M→i_*i*M and i_*i!M→M→j_*j*M are distinguished triangles.
- `HodgeOperations.dual` — D²≅id, Df_*≅f_!D, and D(pQ_X)=pQ_X(d).
- `HodgeOperations.tate` — At a point the twist is the pinned Tate twist, with weight and filtration shifts as stated.

**Unit tests.**

- `HodgeOperations.point` (compatibility) — All operations for id_pt agree with the existing rational mixed Hodge structure operations.
- `HodgeOperations.constantDual` (computation) — D(pQ_{A¹})=pQ_{A¹}(1), of weight −1.
- `HodgeOperations.tensorShift` (non-example) — For X a smooth d-fold, pQ_X⊗^H pQ_X=pQ_X[d]; using unshifted O_X⊗O_X as this tensor loses the shift.

**Use:** FSY (A.5), Definition A.18 and Theorem A.24: Supports Hodge convolution and both kinds of pair direct image.

**Check.** For pQ_X of weight d, its dual has weight −d, forcing the twist (d).

**Sources:** [Sai90](https://ems.press/content/serial-article-files/42511), §4.2–§4.5, pp. 315–325; Introduction 0.1–0.3, pp. 222–224 — Builds the algebraic derived operations and their realization compatibilities.; [FSY](https://arxiv.org/pdf/1810.06454v5), Appendix A.2, pp. 61–63 — Uses these operations for convolution and pair direct images; the dual Tate sign is corrected here.

<a id="h1-weight-bounds"></a>
### H.1/weight-bounds — Weight bounds and duality

**Theorem.** For an object of MHM of weights ≤w, H^j f_! has weights ≤w+j; for weights ≥w, H^j f_* has weights ≥w+j. Duality reverses weights, and Tate twist (m) subtracts 2m. For pure M and projective f, H^j f_*M is pure of weight w+j. With the derived convention, a complex has weights ≤w or ≥w when its jth cohomology has the corresponding bound w+j.

**Hypotheses and conventions.** The one-sided inequalities do not assert purity for arbitrary nonproper f.

**Prerequisites:** [H.1/operations](#h1-operations), [H.0/projective-direct-image](#h0-projective-direct-image), [H.0/abelian-strictness](#h0-abelian-strictness).

**Construction or proof.**

1. Use the admissible local gluing and specialization bounds, together with pure projective direct images.
2. Factor f through a compactification and apply open-extension weight bounds; obtain the opposite inequality by duality.
3. Check Tate shifts on pure graded pieces and extend through W.

**Check.** H¹(G_m,Q)=Q(−1) and H_c¹(G_m,Q)=Q(0) show the two bounds differ.

**Sources:** [Sai90](https://ems.press/content/serial-article-files/42511), Proposition 0.3, pp. 223–224; §4.4–§4.5, pp. 321–325 — States and proves the functorial weight estimates used in the cohomology comparison.; [FSY](https://arxiv.org/pdf/1810.06454v5), Proposition A.19 and its proof, pp. 66–67 — Applies the weight estimates for ! and * pushforward to the central-degree exponential cohomology.

<a id="h1-hodge-cycles"></a>
### H.1/hodge-cycles — Hodge nearby and vanishing cycles

**Construction.** Lift pψ_f,pφ_f and their unipotent summands to exact functors on MHM, with can and var, rational Betti comparison and N:ψ_{f,1}M→ψ_{f,1}M(−1). Normalize can,var so var∘can=N and can∘var=N. For mixed M the weight on ψ is the relative monodromy filtration for N against L_kψ=ψ(W_{k+1}M), while L_kφ=φ(W_kM); for pure weight w these are centered at w−1 and w respectively. For a curve, the rank of a generic F-graded connection is the dimension of the corresponding F-graded full nearby-cycle space, with all eigenvalues included.

**Hypotheses and conventions.** N is the normalized logarithm; the conversion from the supplier’s residue sign and the topological T−1 variation is part of the comparison.

**Prerequisites:** [H.0/v-filtration](#h0-v-filtration), [H.0/mixed-hodge-module](#h0-mixed-hodge-module), [H.1/operations](#h1-operations), [B/betti-cycles](#b-betti-cycles), `LefschetzPencilsAndVanishingCycles:LPV.1/relative-monodromy-uniqueness` ([supplier packet](../packets/LefschetzPencilsAndVanishingCycles--LPV.0.json)), `LefschetzPencilsAndVanishingCycles:LPV.1/monodromy-filtration` ([supplier packet](../packets/LefschetzPencilsAndVanishingCycles--LPV.0.json)), `HodgeStructuresPartII:H.2/canonical-extension` ([supplier packet](../packets/HodgeStructuresPartII--H.2.json)), `HodgeStructuresPartII:H.2/residue-monodromy` ([supplier packet](../packets/HodgeStructuresPartII--H.2.json)).

**Construction or proof.**

1. Apply the graph V construction and its rational comparison; use the compatible F,W,V quotients to define filtered cycles.
2. Use the admissibility relative-monodromy condition for the induced weights (uniqueness by LPV.1) and the normalized polynomial in log T for can and var. HodgeStructuresPartII H.2/residue-monodromy gives T=exp(−2πi·Res), so on a unipotent block N=(2πi)⁻¹log T_u=−Res.
3. Compare F at a generic point with the canonical extension and its full graded V fundamental interval to prove the curve rank formula.

**Planning API.**

- `HodgeCycles.rat` — The rational realization gives the shifted Betti cycles.
- `HodgeCycles.canVar` — The two normalized composites are N with the indicated Tate target.
- `HodgeCycles.weights` — Weights are the relative monodromy filtration with the shifted input L.
- `HodgeCycles.curveRank` — All eigenvalue pieces together recover the generic Hodge ranks of a curve connection.

**Unit tests.**

- `HodgeCycles.smooth` (computation) — A smooth variation of weight m on a curve gives nearby weight m for its module of weight m+1.
- `HodgeCycles.point` (degenerate) — For i_0V, ψ=0 and φ=V, with its original point weight.
- `HodgeCycles.nonunipotentRank` (non-example) — A rank-one variation with monodromy −1 has zero ψ_1 but full nearby rank one.

**Use:** FSY Proposition A.10 and Corollary A.31; MT Proposition A.3: Supplies strict weight dévissage, the costalk and monodromy-at-infinity formulas.

**Check.** For pQ_{A¹}, ψ=Q of weight zero and φ=0.

**Sources:** [Sai90](https://ems.press/content/serial-article-files/42511), §2.2–§2.4, pp. 237–240; §2.9–§2.11, pp. 245–247 — Lifts specialization and constructs its relative monodromy weights.; [FSY](https://arxiv.org/pdf/1810.06454v5), Example A.2, pp. 62–63; Corollary A.31, p. 72 — Uses the cycle maps and the full nearby-cycle rank formula.

<a id="h1-curve-costalk"></a>
### H.1/curve-costalk — Pure curve costalk formula

**Theorem.** For a pure polarizable M on a smooth curve and i at a point, decompose M=M_1⊕M_2 with M_2 supported at i and M_1 having no punctual summand there. Then H⁰i!M_1=0, H¹i!M_2=0, H⁰i!M_2=M_2, and H¹i!M_1=coker(N:ψ_{1}M_1→ψ_{1}M_1(−1)). Other costalk cohomology vanishes. In particular a smooth weight-w module at i has H¹i!M=ψ_iM(−1), pure of weight w+1.

**Hypotheses and conventions.** This is a costalk statement, not a stalk statement. Purity supplies the punctual/strict-support splitting.

**Prerequisites:** [H.0/strict-support-extension](#h0-strict-support-extension), [H.1/operations](#h1-operations), [H.1/hodge-cycles](#h1-hodge-cycles).

**Construction or proof.**

1. Split by strict support and use the localization triangles for i,j.
2. Identify the boundary map with normalized var on the unipotent nearby piece; absence of a punctual quotient makes can surjective, so the image of var equals the image of N=var∘can.
3. Compute the resulting two-term cone; for a smooth connection N=0 and ψ has weight w−1.

**Check.** For pQ_{A¹}, i!pQ=Q(−1)[−1]; its stalk is Q[1], so exchanging the two fails.

**Sources:** [FSY](https://arxiv.org/pdf/1810.06454v5), Example A.2, pp. 62–63; Corollary A.31 and its proof, p. 72 — Example A.2 computes the costalk of a pure module on the line through the cokernel of N on unipotent nearby cycles; Corollary A.31 uses it.

<a id="h1-divisor-localisation"></a>
### H.1/divisor-localisation — Constant-divisor localization sequences

**Theorem.** Let U be smooth of dimension d, D⊂U a reduced divisor, i:D→U and j its complement. The supported constant pQ_D=Q_D[d−1] is perverse, and i*pQ_U=pQ_D[1]. Hence 0→i_*pQ_D→pQ_U[!D]→pQ_U→0 is exact in MHM(U). If D is smooth, i!pQ_U=pQ_D(−1)[−1] and 0→pQ_U→pQ_U[*D]→i_*pQ_D(−1)→0 is exact. For a singular reduced D use the full i! triangle for ordinary supports rather than the smooth purity formula.

**Hypotheses and conventions.** The first sequence allows singular reduced divisors because they are local complete intersections. The second displayed short exact sequence requires D smooth.

**Prerequisites:** [H.1/operations](#h1-operations), [H.1/weight-bounds](#h1-weight-bounds), [B/middle-perverse](#b-middle-perverse).

**Construction or proof.**

1. Use the Betti local-complete-intersection perversity result and the supported Hodge realization of constants.
2. Apply Hodge localization and take perverse cohomology, with the explicit dimension shift for i*.
3. For smooth D apply codimension-one purity, or the local normal-coordinate de Rham residue calculation, to compute i! and its Tate twist.

**Check.** On A¹ with D={0}, the ! sequence is 0→δ_0Q→j_!pQ_Gm→pQ_A¹→0. For xy=0 in A² do not replace local cohomology by smooth-divisor cohomology.

**Sources:** [FSY](https://arxiv.org/pdf/1810.06454v5), Example A.3, p. 63 — Gives the divisor sequences; its first inverse-image shift is corrected here.; [Sai90](https://ems.press/content/serial-article-files/42511), §4.4–§4.5, pp. 321–325 — Supplies localization and the supported constant complexes.

**Layer acceptance.** Every target above satisfies its stated Check, every definition/construction satisfies its API and unit tests, and all identifications respect the pinned conventions. The planning inventory covers this layer; mathematical closure also requires its supplier requests and inherited proof inputs.

<a id="e"></a>
## Layer E — Exponential mixed Hodge structures and the projector

Define EMHS as the full subcategory with vanishing derived global Betti cohomology. Construct Π by additive convolution with j_!pQ_Gm, prove its reflector and constant-kernel/cokernel properties, and construct its tensor product, induced exponential weights and faithful exact de Rham fibre. Distinguish these weights from the ambient MHM(A¹) weights.

**Inputs:** [H.1](#h1), [F](#f).

**Atlas planets:** Exponential mixed Hodge structure; Exponential projector; Exponential tensor product; Exponential weight filtration; Exponential de Rham fibre; Fourier projector identity.

<a id="e-exponential-category"></a>
### E/exponential-category — Exponential mixed Hodge structures

**Definition.** Define EMHS as the full subcategory of MHM(A¹_θ) consisting of N with RΓ(A¹_an,rat N)=0. This is an abelian subcategory, with exact inclusion. The definition concerns derived global cohomology, not absence of punctual subobjects. Define the constant subcategory by objects a*V[1] for graded-polarizable rational mixed Hodge structures V on a point.

**Hypotheses and conventions.** The input category is algebraic and regular at infinity.

**Prerequisites:** [H.0/mixed-hodge-module](#h0-mixed-hodge-module), [H.0/abelian-strictness](#h0-abelian-strictness), [H.1/operations](#h1-operations), [B/middle-perverse](#b-middle-perverse).

**Construction or proof.**

1. Take the full cohomological kernel in the perverse heart.
2. Use the perverse global-cohomology bounds on A¹ and their long exact sequence to show closure under kernels, cokernels and extensions.
3. Identify constant objects through the smooth constant local system and the point equivalence.

**Planning API.**

- `EMHS.inclusion` — The full inclusion into MHM(A¹) is exact.
- `EMHS.globalVanishing` — Membership means vanishing of every derived global Betti cohomology group.
- `EMHS.extension` — A short exact sequence whose outer terms are EMHS has middle term in EMHS.

**Unit tests.**

- `EMHS.zero` (degenerate) — The zero object is in EMHS.
- `EMHS.constant` (non-example) — A nonzero constant pQ_A¹ has RΓ=Q[1] and is excluded.
- `EMHS.punctual` (non-example) — δ_0Q has nonzero H⁰ and is excluded.
- `EMHS.extensionByZero` (computation) — j_!pQ_Gm has vanishing RΓ and is included, even though δ_0Q embeds in it.

**Use:** FSY Appendix A.3–A.7: Provides the category for pair invariants and the classicality theorem.

**Check.** A nonzero punctual module is not in EMHS. The object j_!pQ_Gm is in EMHS and contains a punctual subobject.

**Sources:** [KS](https://arxiv.org/pdf/1006.2706v2), §4.2, Definition 7, p. 31, with the vanishing-cohomology subcategory Perv₀ on p. 30 — Defines EMHS as the mixed Hodge modules on the line whose perverse sheaf has vanishing global cohomology, equivalently the image of the projector.; [FSY](https://arxiv.org/pdf/1810.06454v5), Appendix A.3, p. 63 — Uses the same heart and constant objects.

<a id="e-projector"></a>
### E/projector — The exponential projector

**Construction.** Let K=j_!pQ_Gm for j:G_m→A¹. Construct ΠN=H⁰s_*(N⊠K), with a natural unit η:N→ΠN. Prove the derived convolution has no off-heart cohomology here, Π is exact and Π²≅Π, and Π is left adjoint to the full EMHS inclusion. The kernel and cokernel of η are constant; its kernel is the maximal constant submodule. The essential image is exactly EMHS, and Π annihilates every constant mixed Hodge module.

**Hypotheses and conventions.** Use * additive convolution and the ! extension K, with their distinct roles.

**Prerequisites:** [E/exponential-category](#e-exponential-category), [F/additive-convolution](#f-additive-convolution), [H.1/divisor-localisation](#h1-divisor-localisation), [H.1/operations](#h1-operations).

**Construction or proof.**

1. Use the exact sequence 0→δ_0Q→K→pQ_A¹→0 from divisor localization to obtain the unit and its cohomology triangle.
2. Compute the convolution with pQ_A¹ through global cohomology; the perverse bounds yield heart concentration, constant kernel/cokernel and exactness.
3. Show RΓ of the result vanishes, and use the universal property against any global-acyclic target to prove adjunction and idempotence.

**Planning API.**

- `ExponentialProjector.unit` — Hom_EMHS(ΠN,E)=Hom_MHM(N,E), naturally in N,E.
- `ExponentialProjector.exact` — Π is exact on the mixed Hodge-module heart.
- `ExponentialProjector.idempotent` — Π²≅Π and η is an isomorphism precisely on EMHS.
- `ExponentialProjector.kernel` — ker η is the maximal constant subobject, and coker η is constant.

**Unit tests.**

- `ExponentialProjector.delta` (computation) — Πδ_0Q=j_!pQ_Gm.
- `ExponentialProjector.constant` (degenerate) — ΠpQ_A¹=0.
- `ExponentialProjector.unitObject` (computation) — Applying Π to K returns K.
- `ExponentialProjector.notMinimalExtension` (non-example) — Πδ_0Q is not δ_0Q, so replacing Π by intermediate extension fails.

**Use:** FSY Proposition A.10, Lemma A.12, Definition A.18 and the proof of Theorem A.24(2): Defines the bifiltered realization, classical embedding and localized Fourier identity.

**Check.** Πδ_0Q=K, whereas ΠpQ_A¹=0.

**Sources:** [KS](https://arxiv.org/pdf/1006.2706v2), §4.2, pp. 30–31; §4.4, p. 34 — Constructs the convolution projector and its quotient property.; [FSY](https://arxiv.org/pdf/1810.06454v5), (A.5), Appendix A.3, pp. 63–64 — States exactness, adjunction and the constant kernel and cokernel.

<a id="e-tensor"></a>
### E/tensor — Tensor product of exponential structures

**Construction.** For E,F in EMHS, define E⊗_E F=H⁰(E⋆F); prove their derived additive convolution is concentrated in degree zero and belongs to EMHS. The tensor is exact in both arguments and symmetric associative, with unit K=Πδ_0Q. For arbitrary N,M, ΠH⁰(N⋆M)≅ΠN⊗_EΠM, and Π annihilates the constant off-heart convolution cohomology. Establish the coherence of all these identifications.

**Hypotheses and conventions.** The product is exponential convolution; it is not the Hodge tensor along the diagonal.

**Prerequisites:** [E/projector](#e-projector), [F/additive-convolution](#f-additive-convolution), [F/localized-fourier](#f-localized-fourier), [H.1/operations](#h1-operations).

**Construction or proof.**

1. Use Fourier conversion to a tensor of localized modules to prove the heart concentration and exactness.
2. Apply the projector to the derived convolution associator and its constant off-heart terms.
3. Transport the δ_0 convolution unit through Π to obtain K and verify the coherence diagrams.

**Planning API.**

- `EMHSTensor.projector` — Π(N⋆M)=ΠN⊗_EΠM after taking the heart.
- `EMHSTensor.unit` — K⊗_EE≅E coherently.
- `EMHSTensor.symmetric` — The convolution symmetry and associator induce a symmetric monoidal structure.
- `EMHSTensor.exact` — Tensor preserves short exact sequences in each variable.

**Unit tests.**

- `EMHSTensor.zero` (degenerate) — E⊗_E0=0.
- `EMHSTensor.unitValue` (computation) — K⊗_EK=K.
- `EMHSTensor.deltaInputs` (compatibility) — Π(δ_a⋆δ_b)=Πδ_{a+b}, including a+b=0.

**Use:** FSY Lemma A.12 and Example A.22: Provides the tensor classical embedding and the Künneth target.

**Check.** δ_0Q is not an EMHS object; the tensor unit is K.

**Sources:** [KS](https://arxiv.org/pdf/1006.2706v2), §4.2, Definition 7, p. 31; §4.4, Proposition 4 and Lemma 1, pp. 36–37 — Gives the tensor structure by additive convolution, strict compatibility of weights with it, and the vanishing of Π on the cone of ! to * convolution.; [FSY](https://arxiv.org/pdf/1810.06454v5), Appendix A.3, p. 64 — States the tensor and projector comparison and heart concentration.

<a id="e-exponential-weight"></a>
### E/exponential-weight — Exponential weight filtration

**Construction.** For any presentation E=ΠN, define W^E_nE=Π(W_nN), as a subobject by exactness. Prove independence of presentation, finite exhaustive increasing filtration, strictness for morphisms and tensor compatibility W^E_n(E⊗F)=Σ_{a+b=n}W^E_aE⊗W^E_bF. If N is pure of weight w, ΠN is pure of exponential weight w. Its ambient Hodge-module weights are ≥w and may be larger, with the extra pieces constant. Construct the canonical comparison from ambient W_nE to W^E_nE.

**Hypotheses and conventions.** Ambient and exponential weight filtrations must have distinct names.

**Prerequisites:** [E/projector](#e-projector), [E/tensor](#e-tensor), [H.0/abelian-strictness](#h0-abelian-strictness), [H.1/weight-bounds](#h1-weight-bounds).

**Construction or proof.**

1. Use the constant-kernel/cokernel projector quotient to descend W and show that different presentations give the same filtered subobjects.
2. Apply simultaneous strictness of Hodge-module morphisms, exactness of Π and the pure weight dévissage.
3. Use the weights of convolution and constant correction to prove tensor compatibility and the ambient comparison; retain all larger constant pieces.

**Planning API.**

- `ExponentialWeight.presentation` — W^E_nΠN=ΠW_nN independent of N.
- `ExponentialWeight.strict` — Every EMHS morphism is strict for W^E.
- `ExponentialWeight.tensor` — The tensor filtration is the convolution of the two weight filtrations.
- `ExponentialWeight.ambient` — There is a functorial map W_n^{MHM}E→W_n^EE.

**Unit tests.**

- `ExponentialWeight.unit` (computation) — K is pure of exponential weight zero.
- `ExponentialWeight.ambientUnit` (non-example) — K is not ambient-pure: 0→δ_0Q→K→pQ_A¹→0 has weights 0 and 1.
- `ExponentialWeight.pointTate` (compatibility) — Πδ_0Q(m) has exponential weight −2m, agreeing with the pinned Tate convention.

**Use:** FSY Proposition A.10 and Proposition A.19: Gives the W on the fibre and the middle-weight comparison.

**Check.** For K=Πδ_0Q the exponential weight is zero; its ambient exact sequence has weights zero and one.

**Sources:** [KS](https://arxiv.org/pdf/1006.2706v2), §4.4, Definitions 11–12 and Propositions 2–4, pp. 34–37 — Defines the descended filtration and its tensor compatibility; its proof’s ambient-weight assertion is corrected here.; [FSY](https://arxiv.org/pdf/1810.06454v5), Remark A.6, p. 64 — Distinguishes exponential weights from the ambient filtration.

<a id="e-de-rham-fibre"></a>
### E/de-rham-fibre — De Rham fibre of an exponential structure

**Construction.** For regular holonomic N on A¹, regular also at infinity, set ω(N)=H¹_dR(A¹,N⊗E^θ). Prove H^j_dR=0 for j≠1 and exactness of ω on the regular holonomic heart. The map N→ΠN induces an isomorphism on ω, and the restriction to EMHS is faithful and exact. Give its monoidal comparison ω(E⊗_EF)=ω(E)⊗_Cω(F), carrying K to C. Define W_nω(ΠN) as the image ω(W_nN) and identify it with ω(W_n^EΠN).

**Hypotheses and conventions.** The vanishing is for regular input N before the exponential twist.

**Prerequisites:** [E/projector](#e-projector), [E/tensor](#e-tensor), [E/exponential-weight](#e-exponential-weight), [F/fourier-laplace](#f-fourier-laplace), [F/localized-fourier](#f-localized-fourier), [D/curve-index](#d-curve-index).

**Construction or proof.**

1. Use Fourier transformation and regular-input slope bounds to identify the fibre with a nonsingular localized Fourier fibre; prove finite dimensionality and the vanishing bounds.
2. Constant inputs have acyclic exponential de Rham complex, so the kernel and cokernel of η give Π invariance.
3. Use the Fourier localization equivalence for faithfulness on EMHS and the relative de Rham Künneth formula for monoidality.

**Planning API.**

- `ExponentialFibre.exact` — ω takes short exact regular-input sequences to short exact vector-space sequences.
- `ExponentialFibre.projector` — ωη:ωN≅ωΠN.
- `ExponentialFibre.detectZero` — For E in EMHS, ωE=0 if and only if E=0.
- `ExponentialFibre.tensor` — The fibre is symmetric monoidal and ωK=C.

**Unit tests.**

- `ExponentialFibre.constant` (degenerate) — Every constant Hodge module has zero fibre.
- `ExponentialFibre.punctual` (computation) — ωδ_aV=V_C, with the scalar exponential gauge giving the comparison.
- `ExponentialFibre.unit` (compatibility) — ωK=C, of exponential weight zero.

**Use:** FSY Proposition A.10 and (A.16)–(A.17): Defines the filtered fibre and identifies pair cohomology with twisted de Rham cohomology.

**Check.** ω(pQ_A¹)=0 but ω(δ_0V)=V_C. Weights on this fibre are exponential weights.

**Sources:** [FSY](https://arxiv.org/pdf/1810.06454v5), (A.7)–(A.9), p. 64 — States vanishing, exactness, projector invariance and faithfulness of the fibre.; [KS](https://arxiv.org/pdf/1006.2706v2), §4.3, Definition 8, p. 31 — Defines the de Rham realization at u≠0 as a fibre of the Fourier transform and identifies it with the cokernel of d/dx+u⁻¹, the exponentially twisted H¹.

<a id="e-fourier-localisation-projector"></a>
### E/fourier-localisation-projector — Fourier localization realizes the projector

**Theorem.** With j:G_m,t→A¹_t and the Fourier convention t=−∂_θ, construct Π_θ FT_t^{-1}≅FT_t^{-1}j_+j^+ on regular inputs. Equivalently FT_θΠ_θN≅(FT_θN)(*0). The natural projector map corresponds to localization at t=0, with constant kernel and cokernel on the inverse-transform side. Use the regular Fourier subcategory where this identification descends to EMHS.

**Hypotheses and conventions.** This is an identity of underlying regular holonomic/projector constructions; FT(N^H) is not asserted to be a mixed Hodge module.

**Prerequisites:** [E/projector](#e-projector), [F/fourier-laplace](#f-fourier-laplace), [F/additive-convolution](#f-additive-convolution), [F/localized-fourier](#f-localized-fourier), [H.1/divisor-localisation](#h1-divisor-localisation).

**Construction or proof.**

1. Apply Fourier to convolution with K and compute FT K as the localization O(*0) using the divisor exact sequence.
2. Compare the natural unit with M→M(*0) by its Weyl presentation.
3. Use exactness and inversion to identify the kernel and cokernel and the resulting functor isomorphism.

**Check.** The localization is on the Fourier coordinate, not on θ in the input.

**Sources:** [FSY](https://arxiv.org/pdf/1810.06454v5), Proofs of Theorem A.24(2)–(3), p. 70 — Uses that the Fourier transform of a projected module is already localized at the origin, citing Katz (Exponential sums and differential equations, Proposition 12.3.5), and characterizes the classical image by the localized Fourier transform being a constant connection.

**Layer acceptance.** Every target above satisfies its stated Check, every definition/construction satisfies its API and unit tests, and all identifications respect the pinned conventions. The planning inventory covers this layer; mathematical closure also requires its supplier requests and inherited proof inputs.

<a id="i"></a>
## Layer I — Deligne filtration and strict bifiltered realization

Construct the rational Deligne filtration on the exponential twist of a mixed Hodge module on A¹, with the F,V/Rees normalization fixed by the punctual classical object. Prove the filtered Laplace specialization formula, polarized curve strictness and E₁ degeneration, then factor the de Rham realization through Π. Establish strictness simultaneously on W_n∩Fᵖ, not merely separately for the two filtrations.

**Inputs:** [E](#e), [H.0](#h0), [H.1](#h1).

**Atlas planets:** Deligne filtration; Rees–Laplace specialization; Polarized Fourier strictness; Irregular Hodge degeneration; Strict bifiltered realization.

<a id="i-deligne-filtration"></a>
### I/deligne-filtration — Rational Deligne filtration

**Construction.** For N^H on A¹_θ extend it by j_{∞,*} to P¹, with underlying good filtered module (M,F); tensor M(*∞) with E^θ. For x=θ⁻¹, α∈[0,1)∩Q and p∈Z define F^{Del}_{α+p}=Σ_{k≥0}(∂_x−x⁻²)^k[x⁻¹(F_{p−k}M∩V_αM)e^{1/x}]. On the finite chart use F_pN e^θ. Define F^{Del}_a DR in unshifted degree q as Ω^q⊗F^{Del}_{a+q}; then F^λ_irr ω(N)=image[H¹(P¹,F^{Del}_{−λ}DR)→H¹(P¹,DR)]. Prove these local filtrations glue, have rational discrete finite jumps on cohomology, and are independent of the permitted extension at infinity.

**Hypotheses and conventions.** N is a graded-polarizable algebraic mixed Hodge module; use the increasing V convention x∂+α of H.0/v-filtration. The graph and point direct-image filtration shifts are retained, so δ_0V gives F^λ_irr=F^{ceil(λ)}V.

**Prerequisites:** [H.0/filtered-rees](#h0-filtered-rees), [H.0/v-filtration](#h0-v-filtration), [H.1/operations](#h1-operations), [E/de-rham-fibre](#e-de-rham-fibre), [F/exponential-twist](#f-exponential-twist).

**Construction or proof.**

1. Use strict F,V specialization to prove finite generation and compatibility of the displayed local formula under coordinate changes.
2. Compare extensions using the boundary-supported quotient, killed after the meromorphic exponential localization.
3. Form the filtered de Rham complex using the degree shift q; the E₁ and strictness nodes below prove the cohomological properties and the point normalization.

**Planning API.**

- `DeligneFiltration.local` — The local formula at infinity and F_p on the finite chart determine the filtration.
- `DeligneFiltration.functor` — Hodge-module morphisms induce filtered maps of twisted de Rham complexes.
- `DeligneFiltration.normalise` — The punctual δ_0V fibre has the original decreasing Hodge filtration.
- `DeligneFiltration.extension` — Changing the extension at infinity does not change the filtered meromorphic twist.

**Unit tests.**

- `DeligneFiltration.point` (compatibility) — For δ_0Q(−1), F¹_irr=C and F^{1+ε}_irr=0 for 0<ε<1.
- `DeligneFiltration.constant` (degenerate) — For pQ_A¹ the cohomological filtered fibre is zero at every rational index.
- `DeligneFiltration.poleSign` (computation) — At infinity ∂_x(e^{1/x})=−x⁻²e^{1/x}; a plus sign is a different exponential.

**Use:** ESY Theorems 3.3.1 and 3.3.3; FSY Proposition A.10: Supplies the filtered complex whose injectivity and simultaneous strictness define the irregular Hodge realization.

**Check.** The derivative at infinity is ∂_x−x⁻², not ∂_x+x⁻². The cohomology degree in the fibre is one; no extra Hodge shift is inserted.

**Sources:** [ESY](https://arxiv.org/pdf/1302.4537v3), Display (3.1.1), pp. 22–23; Proposition 3.1.2, p. 23 — Constructs the local Deligne filtration from F and V and its Rees specialization.; [FSY](https://arxiv.org/pdf/1810.06454v5), Appendix A.3, pp. 63–64; Proposition A.13, p. 65 — Uses the decreasing rational filtration and fixes its classical normalization.

<a id="i-rees-laplace-specialisation"></a>
### I/rees-laplace-specialisation — Filtered Laplace specialization

**Theorem.** Let R_FM be the Rees module of a mixed Hodge module on X×P¹_θ. Form its partial Laplace module L=p^*(R_FM)(*∞)⊗E^{θτ/z}; on the finite chart z∂_θ acts by z∂_θ+τ and z∂_τ by θ. It is strictly specializable along τ=0, and R_{F^{Del}_{α+•}}(M⊗E^θ)=V^τ_αL/(τ−z)V^τ_αL. The operator τ−z is injective. The graded V^τ pieces, with their specified shifts including the endpoint α=0, are strict and identified with Rees modules from Hodge specialization. The formula commutes with projective filtered direct image.

**Hypotheses and conventions.** α∈[0,1); the τ−z quotient means specialization to τ=z, not τ=1 before the Rees parameter is removed.

**Prerequisites:** [I/deligne-filtration](#i-deligne-filtration), [H.0/filtered-rees](#h0-filtered-rees), [H.0/v-filtration](#h0-v-filtration), [H.0/projective-direct-image](#h0-projective-direct-image), [H.1/hodge-cycles](#h1-hodge-cycles).

**Construction or proof.**

1. Write the explicit V^τ lattice by the sums of F∩V terms at x=0, and verify the b-polynomial conditions using z∂_x−τ/x².
2. Use the coefficient expansion and division by τ−z to identify the quotient with I/deligne-filtration and prove injectivity.
3. Apply the endpoint argument of ESY Appendix B, then strict projective direct image and specialization compatibility to push the formula forward.

**Check.** Both the finite-chart and infinity-chart operator actions must agree under x=1/θ. The eigenvalue-one endpoint is covered explicitly, not discarded.

**Sources:** [ESY](https://arxiv.org/pdf/1302.4537v3), Lemma 2.3.3 and §2.4, pp. 21–22; Proposition 3.1.2, p. 23; Proposition 3.2.3, pp. 24–25; Appendix B, pp. 27–28 — Establishes the V-lattice, τ−z quotient, strict graded specialization and projective comparison.

<a id="i-polarized-curve-strictness"></a>
### I/polarized-curve-strictness — Polarized Fourier–Laplace strictness

**Theorem.** For a polarizable pure Hodge module on P¹_θ, the global Deligne-filtered exponential de Rham complex has strict cohomology: every H^j(F^{Del}_aDR)→H^j(DR) is injective. Equivalently its Hodge-to-de Rham spectral sequence degenerates at E₁, and the filtered Fourier fibre is finite dimensional with the Deligne filtration. The assertion holds for every rational a.

**Hypotheses and conventions.** This node needs the polarized twistor Fourier-transform theorem and its analytic harmonic-metric input, recorded precisely as gap G2.

**Prerequisites:** [I/deligne-filtration](#i-deligne-filtration), [I/rees-laplace-specialisation](#i-rees-laplace-specialisation), [H.0/pure-hodge-module](#h0-pure-hodge-module), [H.0/projective-direct-image](#h0-projective-direct-image).

**Construction or proof.**

1. Use the polarized twistor structure attached to the pure Hodge module and its Fourier–Laplace transform to obtain strictness over the Rees parameter.
2. Identify its filtration with the explicit Deligne lattice by Sab10 Proposition 6.10 and I/rees-laplace-specialisation.
3. Apply the strict Fourier direct-image statement to deduce injectivity at every filtration index. The unplanned twistor analytic input is not replaced by a weight argument.

**Check.** This is the deep pure-input input; the mixed case requires a further strictness argument.

**Sources:** [Sab10](https://arxiv.org/pdf/0804.4328v2), Theorem 6.1, p. 31; §6.a–§6.c, pp. 31–36; Proposition 6.10 and its proof, pp. 35–36 — Theorem 6.1 follows from Proposition 6.10, whose proof forms the Fourier–Laplace twistor triple of a polarized Hodge D-module, computes its V-filtration along τ=0 and quotients by τ−z, then invokes strictness of the projective direct image of polarized twistor D-modules (Sabbah, Polarizable twistor D-modules, Theorems 3.3.15 and 6.1.1; Monodromy at infinity and Fourier transform II, Proposition 4.1(ii) and Corollary 5.9).

<a id="i-irregular-e1"></a>
### I/irregular-e1 — E₁ degeneration for mixed exponential twists

**Theorem.** For a mixed Hodge module on X×P¹ with X projective, the global Deligne-filtered exponential de Rham complex is strict. Its hypercohomology spectral sequence degenerates at E₁. In particular for N^H on A¹ every H¹(F^{Del}_aDR)→H¹(DR) is injective. The filtered Deligne construction commutes with the projective pushforwards in the graph realization of pair cohomology.

**Hypotheses and conventions.** X is projective; the projection to P¹ is projective. The log/Deligne comparison for pairs is the separate target N/model-independence.

**Prerequisites:** [I/rees-laplace-specialisation](#i-rees-laplace-specialisation), [I/polarized-curve-strictness](#i-polarized-curve-strictness), [H.0/projective-direct-image](#h0-projective-direct-image), [H.0/abelian-strictness](#h0-abelian-strictness), [H.1/hodge-cycles](#h1-hodge-cycles).

**Construction or proof.**

1. Prove the mixed curve case by induction on W: pure strictness and compatibility of W,F,V make the connecting maps strictly filtered, so the filtered long exact sequences split into strict exact pieces.
2. Use I/rees-laplace-specialisation to commute projective direct image with the Deligne construction, then the pure projective direct-image theorem and weight dévissage.

**Check.** The theorem concerns filtered hypercohomology and does not claim every termwise differential vanishes.

**Sources:** [ESY](https://arxiv.org/pdf/1302.4537v3), Theorem 3.3.1, Remark 3.3.2 and Lemma 3.3.3 with their proofs, pp. 25–26; §3.4 and Theorem 1.2.2, pp. 26 and 6; Proposition 1.7.4 and Corollary 1.7.6, pp. 17–18 — Proves strictness for mixed modules and derives E₁ degeneration of the logarithmic pair filtration.

<a id="i-strict-bifiltered-realisation"></a>
### I/strict-bifiltered-realisation — Strict bifiltered exponential realization

**Theorem.** The functor N↦(ωN,W,F_irr) factors through Π. Every morphism a induces a strictly bifiltered map: a(W_nωN∩F^λ_irrωN)=image(a)∩W_nωN′∩F^λ_irrωN′ for every n and rational λ. The filtered inclusion from the Deligne complex is injective. Thus the fibre has finite rational Hodge jumps and integral exponential weights, with strict kernel, image and cokernel bifiltrations.

**Hypotheses and conventions.** W on ω is defined from W^E, not the ambient W of the EMHS representative.

**Prerequisites:** [I/deligne-filtration](#i-deligne-filtration), [I/irregular-e1](#i-irregular-e1), [E/exponential-weight](#e-exponential-weight), [E/de-rham-fibre](#e-de-rham-fibre), [H.0/abelian-strictness](#h0-abelian-strictness), [H.1/hodge-cycles](#h1-hodge-cycles).

**Construction or proof.**

1. Use I/irregular-e1 for injectivity and the simultaneous F,W compatibility of Hodge-module exact sequences to identify the filtered weight-subspace fibre.
2. Constants have zero exponential fibre at every filtration index, so strict exactness for the unit kernel/cokernel descends the bifiltration through Π.
3. Apply the same argument to kernel, image and cokernel of a and to their W_n pieces, yielding intersection strictness rather than only two separate strictness equations: F,V-bistrictness of Hodge-module morphisms makes the Deligne-filtered twisted complex exact on short exact sequences, so I/irregular-e1 makes F^λ_irr∘ω exact; applied to W_nN₁↠W_n(im a)↪W_nN₂ with W-strictness of a, this gives a(W_n∩F^λ)=im(a)∩W_n∩F^λ. FSY instead deduce this from Sabbah's Irregular Hodge theory (Mém. SMF 156), Theorems 0.2(2), 0.3(4) and 0.3(2); that route is not used here.

**Check.** A proposed separate F-strict and W-strict proof must also justify W_n∩F^λ.

**Sources:** [FSY](https://arxiv.org/pdf/1810.06454v5), Proposition A.10 and proof, p. 65 — States injectivity, factorization through Π and strict bifiltered functoriality.; [ESY](https://arxiv.org/pdf/1302.4537v3), Theorem 3.3.1, Remark 3.3.2 and Lemma 3.3.3, p. 25 — Provides the mixed filtered strictness needed for the weight pieces.

**Layer acceptance.** Every target above satisfies its stated Check, every definition/construction satisfies its API and unit tests, and all identifications respect the pinned conventions. The planning inventory covers this layer; mathematical closure also requires its supplier requests and inherited proof inputs.

<a id="c"></a>
## Layer C — Classical mixed Hodge structures inside EMHS

Construct the fully faithful tensor functor V↦Π i_{0!}V from the existing rational mixed Hodge structures, with φ_{t,1} as inverse on its image and agreement with the classical weight filtration. For ΠN in this classical image, identify its bifiltered de Rham fibre with φ_{t,1}N and prove F_irr=F. An integral jumping set alone is not the definition of classical.

**Inputs:** [I](#i), [E](#e).

**Atlas planets:** Classical exponential structure; Classical filtration comparison.

<a id="c-classical-embedding"></a>
### C/classical-embedding — Classical mixed Hodge structures in EMHS

**Construction.** Let MHS_gp denote the graded-polarizable rational subcategory of the pinned MixedHodgeStructure carrier. Construct I(V)=Πi_{0,*}V and prove I is fully faithful, exact and symmetric monoidal, with φ_{θ,1}I(V)=V. Define a classical exponential structure by membership in its essential image. Its exponential weight filtration is I(WV); this comparison does not identify its ambient MHM weights with WV. Give the canonical criterion that the localized Fourier connection of a representative is constant, with its induced Hodge data.

**Hypotheses and conventions.** The rational carrier uses the existing Q- and C-base-change maps of TauCeti.Hodge.MixedHodgeStructure, with the abelian group taken to be the rational space itself (the pinned morphisms are rational-linear); finite dimension and graded polarizability are added conditions. No new mixed-Hodge vector-space structure is introduced.

**Prerequisites:** [E/projector](#e-projector), [E/tensor](#e-tensor), [E/exponential-weight](#e-exponential-weight), [E/fourier-localisation-projector](#e-fourier-localisation-projector), [H.0/abelian-strictness](#h0-abelian-strictness), [H.1/hodge-cycles](#h1-hodge-cycles), `tauceti:TauCeti.Hodge.MixedHodgeStructure`.

**Construction or proof.**

1. Apply the punctual direct image and Π; constants have zero vanishing cycles, so φ_1Πi_* is the identity.
2. Use the projector adjunction and the punctual supported-category equivalence to prove full faithfulness.
3. Use the convolution of punctual modules for tensor compatibility and exactness of Π for weights; Fourier localization gives the essential-image criterion.

**Planning API.**

- `ClassicalEmbedding.fullFaithful` — Hom(I(V),I(W))≅Hom(V,W).
- `ClassicalEmbedding.cycles` — φ_{θ,1}I≅id and φ_{θ,1}Π≅φ_{θ,1}.
- `ClassicalEmbedding.tensor` — I(V⊗W)≅I(V)⊗_EI(W), with I(Q)=K.
- `ClassicalEmbedding.weights` — W^E_nI(V)=I(W_nV).

**Unit tests.**

- `ClassicalEmbedding.unit` (computation) — I(Q)=K, not δ_0Q.
- `ClassicalEmbedding.tate` (compatibility) — I(Q(m)) has exponential weight −2m and its cycles are the pinned Q(m).
- `ClassicalEmbedding.translatedPoint` (non-example) — Πδ_aQ for a≠0 has zero φ_{θ,1} at zero but nonzero fibre, hence is not classical.

**Use:** FSY Proposition A.13 and Theorem A.24: Defines the meaning of classicality and the inverse used to recover ordinary MHS.

**Check.** Integer irregular-Hodge jumps alone are not a definition or sufficient criterion for classicality.

**Sources:** [FSY](https://arxiv.org/pdf/1810.06454v5), Lemma A.12 and proof of Theorem A.24(3), pp. 65 and 70 — Gives the full tensor embedding and the localized-Fourier characterization.

<a id="c-classical-filtration"></a>
### C/classical-filtration — Agreement of classical and irregular Hodge filtrations

**Theorem.** If ΠN^H is classical, there is a natural bifiltered isomorphism (ωN,W,F_irr)≅(φ_{θ,1}N^H)_C with its classical W,F. At rational λ the right-hand filtration is F^{ceil(λ)}. Thus the rational irregular filtration is exactly the classical integer-indexed filtration in every application of the classicality criterion.

**Hypotheses and conventions.** Classicality is the essential-image condition in C/classical-embedding.

**Prerequisites:** [C/classical-embedding](#c-classical-embedding), [I/deligne-filtration](#i-deligne-filtration), [I/strict-bifiltered-realisation](#i-strict-bifiltered-realisation), [H.0/filtered-rees](#h0-filtered-rees), [H.1/hodge-cycles](#h1-hodge-cycles).

**Construction or proof.**

1. For N=i_{0,*}V use the explicit filtered point direct image F_p=Σ_kF_{p−1−k}V∂^k and compute its two-term twisted de Rham complex.
2. The filtered complex is quasi-isomorphic to V[−1] with its original F, including the codimension-one shift.
3. Use I/strict-bifiltered-realisation, full faithfulness and φ_1Π=φ_1 to pass from the punctual presentation to any representative N.

**Check.** For Q(−1), the last nonzero integer filtration step is F¹.

**Sources:** [FSY](https://arxiv.org/pdf/1810.06454v5), Proposition A.13 and its proof, p. 65 — Computes the punctual filtered complex and deduces the bifiltered comparison for the classical image.

**Layer acceptance.** Every target above satisfies its stated Check, every definition/construction satisfies its API and unit tests, and all identifications respect the pinned conventions. The planning inventory covers this layer; mathematical closure also requires its supplier requests and inherited proof inputs.

<a id="p"></a>
## Layer P — Cohomology of a pair and its weights

Construct ordinary, compactly supported and middle exponential cohomology of a smooth quasi-projective pair (U,f), and the coefficient version. Identify the fibres with the unshifted twisted de Rham groups, prove Künneth, duality, the middle-weight criterion and divisor localization, and compute the affine-line and torus-sum Tate examples. At f=0 recover the usual mixed Hodge structures.

**Inputs:** [C](#c), [H.1](#h1), [E](#e).

**Atlas planets:** Exponential cohomology of a pair; Twisted de Rham comparison; Exponential Künneth and duality; Middle exponential weight; Torus-sum Tate calculation.

<a id="p-pair-cohomology"></a>
### P/pair-cohomology — Ordinary, compact and middle cohomology of a pair

**Construction.** For U smooth quasi-projective of dimension d, f:U→A¹_θ and N^H∈MHM(U), set N_*^r=H^{r−d}f_*N^H, N_!^r=H^{r−d}f_!N^H and N_mid^r=image(N_!^r→N_*^r). Define H^r(U,N^H,f)=ΠN_*^r, H_c^r=ΠN_!^r and H_mid^r=ΠN_mid^r, with their W^E and filtered de Rham fibres. For N^H=pQ_U omit the coefficient. At f=0 identify these objects with the classical mixed Hodge structures of ordinary, compact and image cohomology, with the indicated unshifted DR degrees.

**Hypotheses and conventions.** Coefficients are Hodge modules on all of U; a smooth variation is the special case whose left module is a connection. The shift r−d depends on U even for a supported coefficient.

**Prerequisites:** [H.1/operations](#h1-operations), [H.0/abelian-strictness](#h0-abelian-strictness), [E/projector](#e-projector), [E/exponential-weight](#e-exponential-weight), [E/de-rham-fibre](#e-de-rham-fibre), [C/classical-embedding](#c-classical-embedding), [I/strict-bifiltered-realisation](#i-strict-bifiltered-realisation).

**Construction or proof.**

1. Apply the Hodge direct images and take the perverse cohomology degree r−d.
2. Use abelianity for the middle image and exactness of Π to commute it with that image.
3. For the zero map factor through the point, then use C/classical-embedding and the point equivalence to identify the ordinary cohomological MHS.

**Planning API.**

- `PairCohomology.natural` — Coefficient morphisms and proper pair maps induce maps compatible with !→*.
- `PairCohomology.middle` — H_mid^r=image(H_c^r→H^r).
- `PairCohomology.zeroFunction` — At f=0 recover the existing classical MHS of unshifted de Rham cohomology.
- `PairCohomology.exact` — A coefficient distinguished triangle yields the associated long exact exponential cohomology sequences.

**Unit tests.**

- `PairCohomology.pointZero` (computation) — For U=pt, f=0 and coefficient V, H⁰=H_c⁰=H_mid⁰=I(V), with all other degrees zero.
- `PairCohomology.affineIdentity` (degenerate) — H^r(A¹,t)=H_c^r(A¹,t)=0 in all degrees.
- `PairCohomology.constantLine` (compatibility) — For (A¹,0), H⁰=Q and H_c²=Q(−1), with the other groups zero.

**Use:** FSY Proposition A.19, Theorem A.24 and Lemma A.28: Provides the invariants whose weights, classicality and Fourier realization are computed.

**Check.** The middle object is the image in EMHS, not an independently chosen subspace.

**Sources:** [FSY](https://arxiv.org/pdf/1810.06454v5), (A.14), p. 65; Example A.15 and Definition A.18, p. 66 — Defines the coefficient versions, the zero-function comparison and the three pair invariants.

<a id="p-pair-fibre"></a>
### P/pair-fibre — Twisted de Rham realization of pair cohomology

**Theorem.** For the objects of P/pair-cohomology with left coefficient module N, identify ωH^r with H^r_dR(U,N⊗E^f), ωH_c^r with H^r_dR,c(U,N⊗E^f), and the middle fibre with the image of the natural compact-to-ordinary map. The identifications are bifiltered for the pushforward Deligne filtration and exponential weights, and commute with coefficient long exact sequences.

**Hypotheses and conventions.** Use unshifted DR degrees and the pushforward filtered realization; compact DR is defined through holonomic ! direct image.

**Prerequisites:** [P/pair-cohomology](#p-pair-cohomology), [E/de-rham-fibre](#e-de-rham-fibre), [I/strict-bifiltered-realisation](#i-strict-bifiltered-realisation), [H.1/operations](#h1-operations), [F/exponential-twist](#f-exponential-twist), [I/irregular-e1](#i-irregular-e1).

**Construction or proof.**

1. Apply the projection formula for exponential twisting to f_* and f_!.
2. Use the direct-image spectral sequence and E/de-rham-fibre: the exponential fibre of every perverse cohomology term has cohomology only in degree one, so the spectral sequence has a single nonzero row.
3. Insert the r−d normalization and exactness of ω and Π; use I/irregular-e1 (the Deligne construction commutes with the projective pushforward of a compactification of f) for the filtered identification, and I/strict-bifiltered-realisation for filtered images.

**Check.** For a point supported in a d-fold the nonzero unshifted DR degree is d; the normalization must retain it.

**Sources:** [FSY](https://arxiv.org/pdf/1810.06454v5), Displays (A.16)–(A.17) and the following paragraph, p. 66 — Identifies the filtered ordinary and compact twisted de Rham cohomology of the pair with the de Rham fibres of the pushforward modules; FSY deduce the filtered statement from Sabbah–Yu (Forum Math. Sigma 3 (2015), Theorem 1.3(4)) applied to a compactification of f, which this plan replaces by I/irregular-e1.

<a id="p-pair-kunneth-duality"></a>
### P/pair-kunneth-duality — Künneth and duality for exponential cohomology

**Theorem.** For smooth U,V and regular f,g, the pair (U×V,f⊞g) has H^r=⊕_{a+b=r}H^a(U,f)⊗_E H^b(V,g), and similarly for compact supports, as exponential mixed Hodge structures. W is the integral tensor convolution. For U of dimension d, the natural trace pairing H_c^r(U,f)⊗_E H^{2d−r}(U,−f)→Q(−d) is perfect and compatible with W. The coefficient version uses holonomic dual coefficients with the dimension normalization inherited from H.1. Compatibility with the rational irregular filtration for constant coefficients is the separate log-comparison theorem N/filtered-kunneth-duality.

**Hypotheses and conventions.** The dual exponential has sign −f; this sign must not be dropped. The statement uses the rational de Rham realization; it does not introduce a Betti fibre for arbitrary exponentials.

**Prerequisites:** [P/pair-cohomology](#p-pair-cohomology), [P/pair-fibre](#p-pair-fibre), [E/tensor](#e-tensor), [E/de-rham-fibre](#e-de-rham-fibre), [I/strict-bifiltered-realisation](#i-strict-bifiltered-realisation), [H.1/operations](#h1-operations), [F/fourier-duality](#f-fourier-duality), `tauceti:TauCeti.Hodge.tate`.

**Construction or proof.**

1. Use the Hodge external product, projection formula and the exponential tensor E^{f⊞g}=E^f⊠E^g.
2. Apply Π and the exact monoidal fibre to obtain the Künneth decomposition and its weight compatibility. This does not by itself prove the irregularly filtered formula.
3. Apply duality to the !/* direct images, with D(pQ_U)=pQ_U(d), and evaluate the exponential factors E^f and E^{−f}; the trace gives the twist (−d).

**Check.** The pair H_c¹(G_m,x)=Q pairs with H¹(G_m,−x)=Q(−1) into Q(−1).

**Sources:** [FSY](https://arxiv.org/pdf/1810.06454v5), Example A.22, pp. 67–68 — Uses Künneth for the sum of coordinates (convolution powers) and the duality H^jf_!≅(DH^{−j}f_*)(−k) with its Tate twist.; [Yu](https://arxiv.org/pdf/1203.2338v2), Theorem 2.2 and proof, pp. 14–16 — Proves compatibility of duality with the irregular filtration in its logarithmic realization.

<a id="p-middle-weight"></a>
### P/middle-weight — Middle degree and the lowest weight piece

**Theorem.** For U smooth of dimension d and constant coefficients, H_c^d(U,f) has exponential weights ≤d, H^d(U,f) has weights ≥d, and H_mid^d(U,f) is pure of weight d. The map gr_d^W H_c^d→gr_d^W H^d is an isomorphism if and only if H_mid^d=W_dH^d. All maps and identifications are strict for F_irr and W.

**Hypotheses and conventions.** This is the central degree d and the constant pure coefficient of weight d.

**Prerequisites:** [P/pair-cohomology](#p-pair-cohomology), [P/pair-kunneth-duality](#p-pair-kunneth-duality), [H.1/weight-bounds](#h1-weight-bounds), [E/exponential-weight](#e-exponential-weight), [I/strict-bifiltered-realisation](#i-strict-bifiltered-realisation).

**Construction or proof.**

1. Apply the ! upper and * lower weight bounds to H⁰f_!pQ_U and H⁰f_*pQ_U, then descend by Π.
2. The image has both bounds, hence is pure of weight d.
3. Use the kernel/cokernel sequences of !→*, their duality with the Tate twist, and exact gr^WΠ to show that vanishing of the weight-d cokernel is equivalent to vanishing of the weight-d kernel.

**Check.** Do not substitute the ambient weight of the EMHS representative.

**Sources:** [FSY](https://arxiv.org/pdf/1810.06454v5), Proposition A.19 and proof, pp. 66–67 — Proves the central-degree bounds and the equivalent lowest-weight criterion.

<a id="p-pair-localisation"></a>
### P/pair-localisation — Divisor sequences for pair cohomology

**Theorem.** For a reduced divisor D⊂U on which f vanishes, construct the compact long exact sequence …→H_c^{r−1}(D)→H_c^r(U∖D,f)→H_c^r(U,f)→H_c^r(D)→…. If D is smooth, construct …→H^{r−2}(D)(−1)→H^r(U,f)→H^r(U∖D,f)→H^{r−1}(D)(−1)→…, commuting with the compact-to-ordinary comparison. For singular D the ordinary localization triangle retains RΓ_D rather than the smooth purity replacement.

**Hypotheses and conventions.** D is reduced; the ordinary displayed sequence requires smooth D.

**Prerequisites:** [H.1/divisor-localisation](#h1-divisor-localisation), [P/pair-cohomology](#p-pair-cohomology), [P/pair-fibre](#p-pair-fibre), [C/classical-filtration](#c-classical-filtration).

**Construction or proof.**

1. Apply f_! and Π to H.1/divisor-localisation, and use the dimension normalization and zero-function comparison on D.
2. For smooth D apply f_* to its other sequence, including its codimension-one Tate twist.
3. Use naturality of the localization triangles to prove the commutative comparison diagram.

**Check.** All terms on D carry classical MHS because f|D=0.

**Sources:** [FSY](https://arxiv.org/pdf/1810.06454v5), Example A.20 and (A.21), p. 67 — Derives the compact sequence and smooth ordinary sequence from the divisor diagram.

<a id="p-tate-examples"></a>
### P/tate-examples — Affine-line and torus-sum examples

**Theorem.** For every r, H^r(A¹,t)=H_c^r(A¹,t)=0. For k≥1, H^r(G_m^k,x₁+⋯+x_k) vanishes except r=k, where it is the classical Q(−k); H_c^r vanishes except r=k, where it is Q(0). The compact-to-ordinary map in degree k is zero and H_mid^k=0. For k=0 the point case is Q in degree zero and its comparison is the identity.

**Hypotheses and conventions.** These are equalities in the classical subcategory and hence statements about both Hodge and irregular filtrations.

**Prerequisites:** [P/pair-cohomology](#p-pair-cohomology), [P/pair-kunneth-duality](#p-pair-kunneth-duality), [P/pair-localisation](#p-pair-localisation), [C/classical-filtration](#c-classical-filtration), [H.1/weight-bounds](#h1-weight-bounds).

**Construction or proof.**

1. The affine identity pushforward is constant and is killed by Π.
2. Use the two divisor sequences at {0} to obtain H¹(G_m,x)=Q(−1) and H_c¹(G_m,x)=Q.
3. Use Künneth for the k-fold sum and duality for compact supports. The comparison is zero for k≥1 by the different pure weights.

**Check.** The ordinary and compact Hodge jumps are k and 0 respectively. The k=0 comparison distinguishes the unit from an indiscriminately zero middle map.

**Sources:** [FSY](https://arxiv.org/pdf/1810.06454v5), Example A.22 and (A.23), pp. 67–68 — Computes the ordinary and compact torus-sum Tate structures.

**Layer acceptance.** Every target above satisfies its stated Check, every definition/construction satisfies its API and unit tests, and all identifications respect the pinned conventions. The planning inventory covers this layer; mathematical closure also requires its supplier requests and inherited proof inputs.

<a id="g"></a>
## Layer G — The classical tg criterion and the zero locus

For V smooth quasi-projective, g regular and M in MHM(V), prove classicality of all degrees for pQ_A¹⊠M with exponential tg, and of the ordinary [*0] and compact [!0] variants. For constant coefficients identify compact cohomology with H_c^{r−2}(g^{-1}(0))(−1), and ordinary cohomology with H^r_{g^{-1}(0)}(V); reduce the latter to H^{r−2}(g^{-1}(0))(−1) when the zero locus is a smooth divisor.

**Inputs:** [P](#p), [F](#f), `HodgeStructuresPartII:H.2` ([supplier packet](../packets/HodgeStructuresPartII.json)).

**Atlas planets:** Classical tg criterion; Zero-locus cohomology formula.

<a id="g-tg-classicality"></a>
### G/tg-classicality — The classical tg criterion

**Theorem.** For V smooth quasi-projective, g∈O(V), M^H∈MHM(V), U=A¹_t×V and f=tg, all H^r(U,pQ_A¹⊠M^H,f) and H_c^r are classical. For pQ_A¹[*0]⊠M^H the ordinary groups are classical in every degree; for pQ_A¹[!0]⊠M^H the compact groups are classical. Their bifiltered fibres are the corresponding ordinary MHS, so F_irr agrees exactly with F. These assertions allow g=0 and an arbitrary singular or empty zero locus.

**Hypotheses and conventions.** The one-sided [*0] and [!0] hypotheses are kept in their stated support theories.

**Prerequisites:** [P/pair-cohomology](#p-pair-cohomology), [P/pair-fibre](#p-pair-fibre), [P/pair-localisation](#p-pair-localisation), [C/classical-embedding](#c-classical-embedding), [C/classical-filtration](#c-classical-filtration), [E/de-rham-fibre](#e-de-rham-fibre), [E/fourier-localisation-projector](#e-fourier-localisation-projector), [F/fourier-laplace](#f-fourier-laplace), [F/fourier-duality](#f-fourier-duality), [H.1/operations](#h1-operations), `HodgeStructuresPartII:H.2/mixed-fixed-part` ([supplier packet](../packets/HodgeStructuresPartII--H.2.json)).

**Construction or proof.**

1. Localize along A¹×g⁻¹(0); its supported term pushes to θ=0 and is classical. On the complement push first along (t,g) to reduce to g=τ.
2. The ordinary localized fibre is the Fourier de Rham complex [M(*0)→M(*0)] with differential multiplication by τ. It is acyclic since τ is invertible. Obtain the compact version by duality with sign involution.
3. For [*0], replace M by Π_τM; the difference has constant cohomology killed after localization of its Fourier transform. Constancy is checked on underlying D-modules: an admissible mixed Hodge module on A¹ whose underlying local system is constant is constant, by HodgeStructuresPartII H.2/mixed-fixed-part (A¹ is simply connected, so the evaluation of the invariants is a bijective morphism of variations, hence an isomorphism by strictness). Use E/fourier-localisation-projector for the other comparison. Duality gives [!0].
4. Use faithfulness of the exponential fibre to obtain the classicality statement in EMHS, then C/classical-filtration for its bifiltration.

**Check.** The argument works with the derived pushforward of M, since the projector and fibre are exact on cohomology. No tameness or nondegeneracy assumption on g is needed.

**Sources:** [FSY](https://arxiv.org/pdf/1810.06454v5), Theorem A.24 and proofs (A.25)–(A.26), pp. 68–70 — Proves all three classicality cases using localization, Fourier acyclicity and the projector.

<a id="g-zero-locus"></a>
### G/zero-locus — Zero-locus description of tg cohomology

**Theorem.** For constant coefficients and K=g⁻¹(0) as a reduced support, identify H_c^r(A¹×V,tg)≅H_c^{r−2}(K)(−1), and H^r(A¹×V,tg)≅H_K^r(V). These are isomorphisms of classical MHS and filtered fibres. If K is a smooth divisor, identify the ordinary group further with H^{r−2}(K)(−1). For g=0 the ordinary group is H^r(V) and the compact group is H_c^{r−2}(V)(−1); for g a unit both groups vanish.

**Hypotheses and conventions.** The smooth-divisor clause is not applied to g=0 or a singular K. The support category handles singular K without requiring it to be smooth.

**Prerequisites:** [G/tg-classicality](#g-tg-classicality), [P/pair-kunneth-duality](#p-pair-kunneth-duality), [P/pair-localisation](#p-pair-localisation), [H.1/operations](#h1-operations), [B/constructible-six-operations](#b-constructible-six-operations).

**Construction or proof.**

1. Use the localized vanishing from G/tg-classicality and the compact localization triangle to reduce compact cohomology to A¹×K, where the exponential function is zero.
2. Apply compact Künneth with H_c²(A¹)=Q(−1).
3. For ordinary cohomology use i_*i! and homotopy invariance in the A¹ direction, obtaining supports H_K^r(V). The map tg∘i is the zero-valued function, whose direct image factors through the point; its pushforward functor is not the zero functor. Apply purity only for a smooth divisor.

**Check.** For V=pt and g=0 the groups are Q in ordinary degree zero and Q(−1) in compact degree two. For g=1 all groups vanish. For a singular K retain H_K^r(V), not a smooth purity formula.

**Sources:** [FSY](https://arxiv.org/pdf/1810.06454v5), Example A.27, pp. 70–71 — Gives the compact zero-locus and ordinary support formulas; the assertion about a zero pushforward is corrected here.

**Layer acceptance.** Every target above satisfies its stated Check, every definition/construction satisfies its API and unit tests, and all identifications respect the pinned conventions. The planning inventory covers this layer; mathematical closure also requires its supplier requests and inherited proof inputs.

<a id="t"></a>
## Layer T — Fourier cohomology, costalks and weights at infinity

Give the Fourier transform of an MHM a cohomological MHS through the pair (A¹×A¹,tτ), without claiming its Fourier transform is an MHM. Prove the costalk comparison and pure-input Hodge-number formula, and compute the constant correction of Π. Prove the general nearby-infinity monodromy-filtration theorem for Π of a pure Hodge module with no constant submodule, retaining every primitive part. Specific Kloosterman Jordan blocks belong to the companion roadmap.

**Inputs:** [G](#g), [H.1](#h1), [I](#i), `LefschetzPencilsAndVanishingCycles:LPV.1`.

**Atlas planets:** Fourier cohomology; Fourier costalk theorem; Fourier Hodge-rank formula; Projector constant correction; Regular Fourier stationary phase; Projector monodromy at infinity.

<a id="t-fourier-cohomology"></a>
### T/fourier-cohomology — Classical cohomology of a Fourier transform

**Construction.** For M^H∈MHM(A¹_τ), define the classical MHS H^j(A¹_t,FTM^H)=H^{j+1}(A¹_t×A¹_τ,pQ_A¹⊠M^H,tτ), and similarly H_c^j. Their de Rham fibres are H^j_dR(A¹,FTM) and H^j_dR,c(A¹,FTM); ordinary cohomology can be nonzero only in j=0,1 and compact cohomology only in j=1,2. Give them the F_irr and W supplied by the classical pair comparison. This notation does not assert that FTM is a regular Hodge module.

**Hypotheses and conventions.** M^H is the regular input; its Fourier transform may be irregular.

**Prerequisites:** [G/tg-classicality](#g-tg-classicality), [P/pair-cohomology](#p-pair-cohomology), [P/pair-fibre](#p-pair-fibre), [F/fourier-laplace](#f-fourier-laplace), [F/fourier-duality](#f-fourier-duality), [C/classical-filtration](#c-classical-filtration).

**Construction or proof.**

1. Use G/tg-classicality to define the classical MHS through the pair.
2. Compare the projection along τ with the Fourier kernel and account for its relative dimension one.
3. Apply P/pair-fibre and the affine-curve holonomic DR bounds; obtain the compact degree range by duality.

**Planning API.**

- `FourierCohomology.fibre` — The complex fibre is the ordinary or compact de Rham cohomology of FTM.
- `FourierCohomology.exact` — Input exact sequences give long exact sequences of classical MHS.
- `FourierCohomology.filtered` — The classical Hodge filtration equals the pair irregular filtration.

**Unit tests.**

- `FourierCohomology.pointAtZero` (computation) — For M^H=δ_0V, H⁰(FTM^H)=V and other ordinary degrees vanish.
- `FourierCohomology.constant` (computation) — For M^H=pQ_A¹, H¹(FTM^H)=Q(−1) and H⁰=0.
- `FourierCohomology.translatedPoint` (degenerate) — For δ_aV with a≠0, ordinary and compact Fourier cohomology vanish.

**Use:** FSY Theorem A.30 and Corollary A.31: Provides the MHS on which costalk and Hodge-rank formulas are stated.

**Check.** The pair degree is j+1; using j changes the costalk formula.

**Sources:** [FSY](https://arxiv.org/pdf/1810.06454v5), Lemma A.28 and Notation A.29, p. 71 — Defines the Fourier cohomology MHS through the tτ pair and computes its de Rham degrees.

<a id="t-fourier-costalk"></a>
### T/fourier-costalk — Fourier cohomology is the costalk

**Theorem.** For every M^H∈MHM(A¹_τ), there are natural isomorphisms of classical MHS H^j(A¹_t,FTM^H)≅H^j i_0!M^H for all j. Both sides vanish outside degrees zero and one. The isomorphisms identify W and the irregular Hodge filtration on the Fourier fibre with the classical W,F of the costalk.

**Hypotheses and conventions.** i_0 is the origin in the input τ line.

**Prerequisites:** [T/fourier-cohomology](#t-fourier-cohomology), [G/tg-classicality](#g-tg-classicality), [H.1/operations](#h1-operations), [C/classical-filtration](#c-classical-filtration), [E/de-rham-fibre](#e-de-rham-fibre), [F/fourier-laplace](#f-fourier-laplace).

**Construction or proof.**

1. First compute M=i_{0,*}V: the tτ pair is supported on θ=0 and gives V in pair degree one.
2. Apply the localization triangle i_*i!M→M→M[*0]. The Fourier de Rham complex of the last term is acyclic since it becomes multiplication by the invertible input coordinate τ.
3. Take cohomology, use the punctual case and strict classical realization to identify the resulting isomorphisms.

**Check.** For pQ_A¹ the answer is Q(−1) in degree one; the stalk Q[1] would give a different degree and twist.

**Sources:** [FSY](https://arxiv.org/pdf/1810.06454v5), Theorem A.30 and proof, p. 71 — Identifies the Fourier cohomology MHS with the input costalk via localization.

<a id="t-pure-fourier-hodge"></a>
### T/pure-fourier-hodge — Pure-input Fourier Hodge numbers

**Theorem.** Let M^H be pure of weight w with no nonzero section supported at τ=0. Then H^j_dR(A¹,FTM)=0 for j≠1 and H¹(A¹,FTM^H)=coker(N:ψ_{τ,1}M^H→ψ_{τ,1}M^H(−1)). If M is nonsingular at zero, this is ψ_τM^H(−1), pure of weight w+1, and dim gr^p_{F_irr}H¹_dR(A¹,FTM)=rank gr_F^{p−1}M for every integer p.

**Hypotheses and conventions.** Absence of a punctual summand at zero is weaker than nonsingularity there; the rank formula requires nonsingularity.

**Prerequisites:** [T/fourier-costalk](#t-fourier-costalk), [H.1/curve-costalk](#h1-curve-costalk), [H.1/hodge-cycles](#h1-hodge-cycles), [H.0/strict-support-extension](#h0-strict-support-extension).

**Construction or proof.**

1. Apply T/fourier-costalk and the pure costalk decomposition.
2. Use pure semisimplicity to rule out a degree-zero costalk when no punctual summand occurs.
3. For a smooth input N=0, full nearby cycles have the generic Hodge ranks and weight w−1; Tate twist (−1) yields the stated shift.

**Check.** At a singular point one must retain coker N and cannot use the generic-rank formula.

**Sources:** [FSY](https://arxiv.org/pdf/1810.06454v5), Corollary A.31(1)–(2) and its proof, p. 72 — Computes the cokernel and, at a smooth point, its weight and Hodge ranks.

<a id="t-constant-correction"></a>
### T/constant-correction — The constant correction of the projector

**Theorem.** For a pure weight-w M^H with no constant submodule, η gives 0→M^H→ΠM^H→M′^H→0, with M′ constant of ambient weights ≥w+1 and W_wΠM=M. For every integer l,p, dim gr^p_{F_irr}gr_l^WH¹_dR(A¹,FTM′)=rank gr_F^{p−1}gr_{l−1}^WM′. Here the left W is the classical cohomology weight and the right W is ambient MHM weight.

**Hypotheses and conventions.** The rank formula applies to the constant quotient, which is smooth at zero.

**Prerequisites:** [E/projector](#e-projector), [E/exponential-weight](#e-exponential-weight), [H.0/strict-support-extension](#h0-strict-support-extension), [H.1/weight-bounds](#h1-weight-bounds), [T/pure-fourier-hodge](#t-pure-fourier-hodge), [I/strict-bifiltered-realisation](#i-strict-bifiltered-realisation).

**Construction or proof.**

1. The projector kernel is the maximal constant submodule and hence vanishes. Pure splitting rules out an additional weight-w constant quotient inside ΠM, giving the lower bound.
2. Apply T/pure-fourier-hodge separately to every pure constant gr_{l−1}^WM′.
3. Use exact W-graded realization and the shift from a constant curve module to its nearby-cycle MHS.

**Check.** The weight shift l−1 on the constant module is essential.

**Sources:** [FSY](https://arxiv.org/pdf/1810.06454v5), Corollary A.31(3) and its proof, p. 72 — Gives the constant correction and its filtered dimension formula.

<a id="t-stationary-phase"></a>
### T/stationary-phase — Regular Fourier stationary phase at eigenvalue one

**Theorem.** For a regular holonomic input M on A¹, including infinity, compare the unipotent vanishing cycles of its Fourier transform at output zero with the unipotent nearby cycles of M at input infinity, intertwining nilpotent monodromy after the Fourier sign normalization. The comparison is natural for the localization map FT(M)→FT(M)(*0) and matches its can/var diagram with ψ_∞M→ψ_∞ΠM. Use the underlying regular local system comparison; filtered Tate shifts are attached through Hodge cycles, rather than claiming the irregular Fourier module is an MHM.

**Hypotheses and conventions.** The finite input is regular. A complete kernel-specialization proof of this local stationary-phase comparison is recorded as gap G3.

**Prerequisites:** [F/fourier-laplace](#f-fourier-laplace), [F/localized-fourier](#f-localized-fourier), [D/formal-decomposition](#d-formal-decomposition), [B/betti-cycles](#b-betti-cycles), [H.1/hodge-cycles](#h1-hodge-cycles).

**Construction or proof.**

1. Compactify the kernel to P¹×A¹ and specialize at the Fourier coordinate zero.
2. Use the local exponential model near the input boundary and exclude the nonzero finite exponential factors; identify the surviving unipotent factor and its logarithm.
3. Apply proper specialization and compare the natural localization/variation morphisms. This is the missing proof input isolated by G3, not a consequence of exactness of Fourier alone.

**Check.** The comparison concerns vanishing cycles at output zero and nearby cycles at input infinity, not the reverse pair.

**Sources:** [MT](https://arxiv.org/pdf/0912.5144v12), Lemma A.4 and its proof, p. 39 — States this comparison and obtains it by adapting an earlier kernel-specialization argument.

<a id="t-weights-at-infinity"></a>
### T/weights-at-infinity — Monodromy weights at infinity of the projector

**Theorem.** Let M^H be pure polarizable of weight w with no constant submodule, and write 0→M→ΠM→M″→0. Set Ψ=ψ_{∞,1}ΠM and L_kΨ=ψ_{∞,1}(W_{k+1}ΠM). Its weight filtration is the absolute monodromy filtration of N centered at w. On underlying nilpotent vector spaces Im N=ψ_{∞,1}M; the inclusion with its filtration shift is the variation comparison. Write P_k=ker[N^{k+1}:gr^W_{w−1+k}ψ_{∞,1}M→gr^W_{w−3−k}ψ_{∞,1}M(−k−1)] for k≥0. Then W_{w+1}M″ is the constant variation with fibre H⁰(P¹,pDR M_min), and gr^W_{w+k+2}M″ is the constant variation with fibre P_k(−1). M_min is the pure intermediate extension to P¹. Retain every primitive part P_k.

**Hypotheses and conventions.** The central weight for ψ∞ΠM is w; for ψ∞M it is w−1. The statement is general pure input and does not assume a single Jordan block.

**Prerequisites:** [T/constant-correction](#t-constant-correction), [T/stationary-phase](#t-stationary-phase), [H.0/strict-support-extension](#h0-strict-support-extension), [H.0/projective-direct-image](#h0-projective-direct-image), [H.1/hodge-cycles](#h1-hodge-cycles), [E/projector](#e-projector), [E/exponential-weight](#e-exponential-weight), `LefschetzPencilsAndVanishingCycles:LPV.1/monodromy-filtration` ([supplier packet](../packets/LefschetzPencilsAndVanishingCycles--LPV.0.json)), `LefschetzPencilsAndVanishingCycles:LPV.1/relative-monodromy-uniqueness` ([supplier packet](../packets/LefschetzPencilsAndVanishingCycles--LPV.0.json)), `LefschetzPencilsAndVanishingCycles:LPV.1/primitive-decomposition-and-strictness` ([supplier packet](../packets/LefschetzPencilsAndVanishingCycles--LPV.0.json)).

**Construction or proof.**

1. Compute the constant quotient from the long exact global sequence and RΓ(ΠM)=0: its constant fibre is H⁰(A¹,pDR M).
2. Use intermediate extension to P¹ and the boundary coker N to split its weight-graded pieces into H⁰(P¹,pDR M_min) and the primitive parts P_k(−1).
3. Apply regular Fourier stationary phase and semisimplicity to identify Im N on the projected nearby space with the original nearby space.
4. Use the primitive decomposition to compare dimensions of the relative and absolute monodromy graded pieces; pure negative pieces and monodromy symmetry force W=M(N)[w].

**Check.** A direct sum with two different primitive lengths must retain two corresponding constant weight pieces. The companion, rather than this roadmap, determines the special Kloosterman Jordan blocks.

**Sources:** [MT](https://arxiv.org/pdf/0912.5144v12), Proposition A.3, Lemmas A.2 and A.4 and complete proof, pp. 36–40, especially (A.1)–(A.7) — Proves the absolute weight-monodromy statement and computes every primitive contribution to the constant correction.; [FSY](https://arxiv.org/pdf/1810.06454v5), Proposition 2.21, pp. 16–18 — Applies the general infinity statement to the Kloosterman realization.

**Layer acceptance.** Every target above satisfies its stated Check, every definition/construction satisfies its API and unit tests, and all identifications respect the pinned conventions. The planning inventory covers this layer; mathematical closure also requires its supplier requests and inherited proof inputs.

<a id="n"></a>
## Layer N — Logarithmic and Newton descriptions of the filtration

Construct the pole-order logarithmic filtration on good and non-degenerate compactifications; prove filtered blow-up comparison, model independence, E₁ degeneration and agreement with the EMHS filtration. For a full dimensional Newton-nondegenerate Laurent polynomial, construct the cone Newton complex and prove its comparison and top-degree concentration. For convenient non-degenerate Laurent maps prove that the cone of h_!O→h_*O has constant cohomology, and export the Π comparison. Import toric varieties and refinements; the companion owns the special polytopes, parity tests, monomial bases and Kloosterman Hodge counts. Prove rationally filtered Künneth by the explicit product-model blowups and filtered duality by the compact horizontal-boundary log complex.

**Inputs:** [P](#p), [I](#i), [T](#t), `tauceti:TauCetiRoadmap/AnalyticToricGeometry#layer-0-the-toric-compatible-algebraic-supplier`, `AnalyticToricGeometryPartII:NT.0` ([supplier packet](../packets/AnalyticToricGeometryPartII.json)), `AlgebraicModuliForArithmeticGeometry:R09.7` ([supplier packet](../packets/AlgebraicModuliForArithmeticGeometry--R09.7.json)), `SchemeAndStackFoundations:SF.2` ([supplier packet](../packets/SchemeAndStackFoundations.json)), `HodgeStructuresPartII:H.2` ([supplier packet](../packets/HodgeStructuresPartII.json)).

**Atlas planets:** Logarithmic irregular Hodge complex; Filtered blowup comparison; Model-independent irregular filtration; Newton filtration; Newton concentration theorem; Constant Gauss–Manin boundary.

<a id="n-logarithmic-filtration"></a>
### N/logarithmic-filtration — Logarithmic pole-order complex

**Construction.** A good compactification of (U,f) is a smooth projective X with D=X∖U a simple normal crossing divisor and f extending to X→P¹; write its pole divisor P with multiplicities and D=P_red+T. Define the decreasing rational filtered twisted log complex by (F^λ_logDR_f)^q=0 for q<λ and Ω_X^q(log D)(floor((q−λ)P)) for q≥λ, with differential d+df∧. Its λ≤0 underlying quasi-isomorphism recovers DR(U,E^f). For compact supports use the log complex twisted by O(−T), retaining the pole components instead of twisting by all of D. Also allow a non-degenerate compactification whose local indeterminacy model is f=z/x^e, with zero and pole divisors transverse, in addition to the pole model 1/x^e.

**Hypotheses and conventions.** P is the effective pole divisor with its actual multiplicities. The compact support model has the induced rational filtration and the horizontal boundary twist −T.

**Prerequisites:** [F/exponential-twist](#f-exponential-twist), [P/pair-fibre](#p-pair-fibre), `AlgebraicModuliForArithmeticGeometry:R09.7/snc-compactification` ([supplier packet](../packets/AlgebraicModuliForArithmeticGeometry--R09.7.json)), `AlgebraicModuliForArithmeticGeometry:R09.7/principalization` ([supplier packet](../packets/AlgebraicModuliForArithmeticGeometry--R09.7.json)).

**Construction or proof.**

1. Obtain a good model from an SNC compactification of U (R09.7/snc-compactification) by principalizing the indeterminacy ideal of f (R09.7/principalization), so that f extends to X→P¹ with SNC boundary.
2. Check that d+df∧ preserves the displayed degree-dependent pole bounds; use the local exponential Koszul calculation to compare the meromorphic and log complexes.
3. Define the compact variant through extension by zero at the horizontal boundary and meromorphic extension at poles; compare with holonomic ! de Rham realization.

**Planning API.**

- `LogPoleFiltration.degree` — The qth term is the stated log form sheaf with floor((q−λ)P), and zero if q<λ.
- `LogPoleFiltration.deRham` — The full complex computes twisted de Rham cohomology and its horizontal twist computes compact supports.
- `LogPoleFiltration.rational` — The filtration is decreasing and its jumps have denominators dividing pole multiplicities.
- `LogPoleFiltration.zeroFunction` — For f=0 it recovers the usual Hodge filtration on the logarithmic de Rham complex.

**Unit tests.**

- `LogPoleFiltration.point` (compatibility) — For (pt,0), F⁰=C and F^λ=0 for every positive λ; equivalently only index zero survives.
- `LogPoleFiltration.linearPole` (computation) — For x on A¹⊂P¹, P={∞} has multiplicity one, and degree q has twist floor(q−λ){∞}.
- `LogPoleFiltration.multiplePole` (computation) — For x^m on A¹, the degree-q pole bound is floor(m(q−λ)), which permits jumps in (1/m)Z.
- `LogPoleFiltration.horizontal` (non-example) — For f=x on G_m, the horizontal boundary is {0} and the pole boundary is {∞}; compact filtration twists by −{0}, not −{0}−{∞}.

**Use:** Yu Proposition 4.4 and Theorem 4.6; FSY §4.3: Provides a geometric complex for computing F_irr and comparing resolutions.

**Check.** For f=0, P=0 and this is the classical filtered logarithmic de Rham complex. Twisting compact supports by −D changes the filtered pole contribution and is not this definition.

**Sources:** [Yu](https://arxiv.org/pdf/1203.2338v2), §1(a)–(c), pp. 4–8, with the logarithmic complex on p. 8; §2, pp. 14–16; §4(b), pp. 27–31 — Defines the logarithmic filtration, compact dual complex and non-degenerate toric models.; [ESY](https://arxiv.org/pdf/1302.4537v3), §1.2, pp. 5–6; Proposition 1.7.4 and Corollary 1.7.6, pp. 17–18 — Gives the filtered log/Deligne comparison.

<a id="n-filtered-blowup"></a>
### N/filtered-blowup — Filtered comparison under the toric blowups

**Theorem.** For the explicit blowup resolving an indeterminacy stratum of the non-degenerate model f=z/x^e, the pullback comparison of F^λ_log complexes is a filtered derived isomorphism after pushforward, for every rational λ. In Yu’s interpolation between the pulled-back complex and the complex of the new pole divisor, the successive error terms are sums of O_{E/Ξ}(−1), and their derived pushforwards vanish. The same holds with the horizontal compact-support twist.

**Hypotheses and conventions.** The center is a smooth boundary stratum of the zero/pole intersection as in Yu §4(b); this is not a statement for arbitrary blowups with no boundary condition.

**Prerequisites:** [N/logarithmic-filtration](#n-logarithmic-filtration), `SchemeAndStackFoundations:SF.2/projective-space-cohomology` ([supplier packet](../packets/SchemeAndStackFoundations--SF.2.json)), `SchemeAndStackFoundations:SF.2/derived-pullback-pushforward-qcoh` ([supplier packet](../packets/SchemeAndStackFoundations--SF.2.json)), `AlgebraicModuliForArithmeticGeometry:R09.7` ([supplier packet](../packets/AlgebraicModuliForArithmeticGeometry--R09.7.json)).

**Construction or proof.**

1. Write the two affine blowup charts, the transformed zero/pole divisors and their multiplicities.
2. Insert the intermediate complexes R^λ(q) with their exceptional pole bounds; compute the quotient of pullback and R^λ and the adjacent quotients.
3. Use the local exponential Koszul exactness to reduce them to relative O_E(−μ) with 0<μ≤dim_Ξ E on the projective-bundle exceptional divisor (requested from AlgebraicModuliForArithmeticGeometry:R09.7), whose fibre cohomology vanishes by SF.2/projective-space-cohomology. The projection formula (SF.2/derived-pullback-pushforward-qcoh) gives the compact variant.

**Check.** The floor function must be recomputed with the transformed pole multiplicities on both blowup charts.

**Sources:** [Yu](https://arxiv.org/pdf/1203.2338v2), Proposition 4.4, Lemma 4.5 and proof, pp. 29–31 — Computes the successive quotient complexes and their exceptional O(−1) description.

<a id="n-model-independence"></a>
### N/model-independence — Model independence and Deligne comparison

**Theorem.** For any two good compactifications, the image filtrations on H^r_dR(U,E^f) and its compact variant agree under their canonical de Rham identifications, because on each of them the image filtration equals the intrinsic F_irr of P/pair-fibre. On non-degenerate compactifications the same filtration is obtained before resolving indeterminacy. These filtrations equal F_irr of P/pair-cohomology. Their spectral sequences degenerate at E₁, so H^r(F^λ_log)→H^r(DR) is injective. The construction is functorial for the proper filtered direct images used to define pair cohomology.

**Hypotheses and conventions.** Independence of the good model is deduced from the identification with F_irr on each model (ESY §1.7 and §3.4); Yu's own proof of Theorem 1.7 through weak factorization of birational maps is not used, and no weak-factorization input is required.

**Prerequisites:** [N/logarithmic-filtration](#n-logarithmic-filtration), [N/filtered-blowup](#n-filtered-blowup), [I/deligne-filtration](#i-deligne-filtration), [I/rees-laplace-specialisation](#i-rees-laplace-specialisation), [I/irregular-e1](#i-irregular-e1), [P/pair-fibre](#p-pair-fibre), [P/pair-kunneth-duality](#p-pair-kunneth-duality).

**Construction or proof.**

1. On a fixed good model, identify Yu's logarithmic filtration with the Deligne filtration of the localized module (ESY Proposition 1.7.4 and Corollary 1.7.6).
2. Use N/filtered-blowup to pass from the local non-degenerate model to a good model.
3. Use the graph construction and local log/Deligne filtered quasi-isomorphism, then I/irregular-e1 and projective pushforward, to identify the image filtration with the EMHS filtered fibre. Apply duality for compact supports.

**Check.** The agreement includes all rational steps and both support theories, not only the dimensions of the final vector spaces.

**Sources:** [Yu](https://arxiv.org/pdf/1203.2338v2), Lemma 1.6, p. 9; Theorem 1.7 and Corollary 1.8, pp. 10–12; Proposition 4.4, pp. 29–31 — Proves blowup invariance along smooth centres with normal crossings and independence of the good model (through weak factorization, a route not used here), and the comparison for the non-degenerate toric model.; [ESY](https://arxiv.org/pdf/1302.4537v3), Theorem 1.2.2, p. 6; §1.7, Proposition 1.7.4 and Corollary 1.7.6, pp. 16–18; §3.3–§3.4, pp. 25–26 — Proves E₁ degeneration of Yu's filtration by identifying it on each good model with the Deligne filtration and its image with the filtration of the pushforward module on the line, which does not depend on the model.

<a id="n-newton-complex"></a>
### N/newton-complex — Newton filtration for a Laurent polynomial

**Construction.** Let φ=Σ_m a_mx^m be a Laurent polynomial on T=(G_m)^n, Δ=conv({0}∪supp φ), and assume dim Δ=n. For every face σ not containing zero, require that the logarithmic derivatives x_i∂_iφ_σ have no common zero on T; this is Newton nondegeneracy. Define convenience by 0∈interior Δ. Let C_Δ be the cone generated by Δ and h(m)=inf{a≥0:m∈aΔ} on C_Δ. The cone Newton complex has qth term C[C_Δ∩Z^n]⊗Λ^q⟨dlog x_i⟩, differential d+dφ∧, and F^λ term zero for q<λ, otherwise the span of x^m dlog x_I with h(m)≤q−λ. Construct its comparison with the full Laurent twisted de Rham complex. The truncation by q≥λ is retained even at a cone containing lines.

**Hypotheses and conventions.** Characteristic zero, full-dimensional Δ, and the face nondegeneracy test are explicit hypotheses for the comparison theorems. In the nonconvenient case the cone can be smaller than R^n; do not replace its monoid by all Z^n.

**Prerequisites:** `tauceti:TauCetiRoadmap/AnalyticToricGeometry#layer-0-the-toric-compatible-algebraic-supplier`, `AnalyticToricGeometryPartII:NT.0` ([supplier packet](../packets/AnalyticToricGeometryPartII.json)), [F/exponential-twist](#f-exponential-twist), [N/logarithmic-filtration](#n-logarithmic-filtration), `AnalyticToricGeometryPartII:NT.0/divisor-sections` ([supplier packet](../packets/AnalyticToricGeometryPartII.json)), `AnalyticToricGeometryPartII:NT.0/section-weights` ([supplier packet](../packets/AnalyticToricGeometryPartII.json)).

**Construction or proof.**

1. Import character lattices, rational polytopes, fans and regular subdivisions from the toric supplier.
2. Use the gauge of the convex polytope to prove h is rational piecewise linear and subadditive; the exponents of φ have height at most one, so the displayed pole bound is stable under d+dφ.
3. Identify the finite filtration pieces with toric global sections of O(floor((q−λ)P)) via invariant divisor valuations; form the natural inclusion into the full Laurent complex.

**Planning API.**

- `NewtonFiltration.faceTest` — Nondegeneracy is the stated absence of common logarithmic critical points on every face away from zero.
- `NewtonFiltration.monomial` — In degree q, x^m dlog x_I belongs to F^λ exactly when q≥λ and h(m)≤q−λ.
- `NewtonFiltration.differential` — d+dφ preserves F^λ and squares to zero.
- `NewtonFiltration.toric` — The monomial span is the global section space of the corresponding rounded pole-divisor line bundle.

**Unit tests.**

- `NewtonFiltration.oneSided` (computation) — For φ=x on G_m, Δ=[0,1], C_Δ=R_{≥0} and h(m)=m for m≥0; negative monomials are absent in this cone complex.
- `NewtonFiltration.twoSided` (computation) — For φ=x+x⁻¹, Δ=[−1,1], h(m)=|m|, and convenience holds.
- `NewtonFiltration.constant` (non-example) — For φ constant and n>0, dim Δ=0; the full-dimensional comparison hypothesis fails.
- `NewtonFiltration.degenerateFace` (non-example) — For φ=(x+y)² on (G_m)², the edge of Δ joining (2,0) and (0,2) has face polynomial (x+y)², whose logarithmic derivatives vanish on the curve x+y=0; nondegeneracy fails.

**Use:** Yu Theorem 4.6; FSY §4.3.1 and the companion Hodge computation: Gives the general filtered monomial complex while leaving special polytopes and bases to the consumer.

**Check.** For a face not containing zero, weighted Euler makes the common-derivative condition equivalent to Yu’s condition including φ_σ=0.

**Sources:** [Yu](https://arxiv.org/pdf/1203.2338v2), §4(a), Definition and (24)–(25), pp. 25–26 — Defines nondegeneracy and the Newton filtration and identifies its monomial global sections.; [FSY](https://arxiv.org/pdf/1810.06454v5), §4.3.1, p. 35 — Uses the Newton filtration to bound monomial Hodge representatives.

<a id="n-newton-concentration"></a>
### N/newton-concentration — Newton cohomology concentration and volume

**Theorem.** For a full-dimensional Newton-nondegenerate Laurent polynomial as in N/newton-complex, the cone-to-Laurent inclusion is a quasi-isomorphism, the associated Newton-graded cohomology vanishes outside degree n, and H^r_dR(T,E^φ)=0 for r≠n while dim H^n_dR(T,E^φ)=n!Vol(Δ), with the lattice fundamental cell of volume one. The Newton spectral sequence degenerates at E₁.

**Hypotheses and conventions.** This uses the graded semigroup-algebra acyclicity theorem of Adolphson–Sperber, whose full proof is recorded as gap G4. Full dimension is necessary; a product torus on which φ is constant contributes ordinary torus cohomology.

**Prerequisites:** [N/newton-complex](#n-newton-complex), `tauceti:TauCetiRoadmap/AnalyticToricGeometry#layer-0-the-toric-compatible-algebraic-supplier`.

**Construction or proof.**

1. Write the leading differential on each polyhedral graded piece as the Koszul differential of the face logarithmic derivatives.
2. Use the nondegeneracy condition and the required semigroup-ring acyclicity/regular-sequence theorem to prove cohomology only in top degree. Gap G4 records this algebraic step rather than treating it as elementary.
3. Compute the top Hilbert-series Euler characteristic as the normalized lattice volume, then use filtered acyclicity to compare the cone and Laurent complexes and degenerate the spectral sequence.

**Check.** For φ=x on G_m the dimension is one; for x+x⁻¹ it is two. For φ=x on (G_m)², full dimension fails and cohomology is not confined to degree two.

**Sources:** [Yu](https://arxiv.org/pdf/1203.2338v2), Theorem 4.1 and Corollary 4.2, pp. 26–27 — States the Adolphson–Sperber acyclicity, concentration, volume formula and Newton degeneration; the original proof is not read in this run.

<a id="n-newton-hodge-comparison"></a>
### N/newton-hodge-comparison — Newton and irregular Hodge filtrations agree

**Theorem.** For every full-dimensional Newton-nondegenerate Laurent polynomial, F^λ_irrH^n_dR(T,E^φ) is exactly the image of H^n(F^λ_Newton) for every rational λ. For a top-form monomial x^m dlog x₁∧⋯∧dlog x_n from C_Δ, h(m)≤n−λ implies that its cohomology class lies in F^λ_irr. The equality of image filtrations holds independently of the toric subdivision and resolution of indeterminacy; it does not assert that all such monomials form an independent basis.

**Hypotheses and conventions.** The full-dimensional and nondegenerate hypotheses are those of N/newton-complex; convenience is not required here.

**Prerequisites:** [N/logarithmic-filtration](#n-logarithmic-filtration), [N/filtered-blowup](#n-filtered-blowup), [N/model-independence](#n-model-independence), [N/newton-complex](#n-newton-complex), [N/newton-concentration](#n-newton-concentration), `tauceti:TauCetiRoadmap/AnalyticToricGeometry#layer-0-the-toric-compatible-algebraic-supplier`, `AnalyticToricGeometryPartII:NT.0` ([supplier packet](../packets/AnalyticToricGeometryPartII.json)), `AnalyticToricGeometryPartII:NT.0/divisor-sections` ([supplier packet](../packets/AnalyticToricGeometryPartII.json)).

**Construction or proof.**

1. Use the regular refinement of the normal fan to realize the Newton complex as global logarithmic pole-order forms; invoke toric line-bundle higher-cohomology vanishing.
2. The toric zero/pole intersection is transverse by face nondegeneracy. Resolve its indeterminacy through the explicit blowups and apply N/filtered-blowup.
3. Combine N/model-independence and the filtered global-sections comparison to identify every rational step and the stated monomial inclusion.

**Check.** The implication bounds the filtration of a monomial class, including a zero class; linear independence is a separate companion computation.

**Sources:** [Yu](https://arxiv.org/pdf/1203.2338v2), Proposition 4.3, p. 27; Proposition 4.4 and Lemma 4.5, pp. 29–31; Theorem 4.6, p. 31 — Proves transversality of zero and pole divisors on the toric model (4.3), the blowup comparison (4.4–4.5) and the agreement of the Newton and irregular Hodge filtrations (Theorem 4.6).; [FSY](https://arxiv.org/pdf/1810.06454v5), §4.3.1, p. 35 — Uses the comparison to place top monomial forms in the irregular filtration.

<a id="n-constant-gauss-manin-cone"></a>
### N/constant-gauss-manin-cone — Constant boundary correction of a Laurent Gauss–Manin system

**Theorem.** For a convenient Newton-nondegenerate Laurent polynomial h:T=(G_m)^n→A¹, the cone of h_!pQ_T→h_*pQ_T has constant cohomology Hodge modules. Consequently ΠH⁰h_!pQ_T≅Π image(H⁰h_!pQ_T→H⁰h_*pQ_T)≅ΠH⁰h_*pQ_T. In particular the central pair compact-to-ordinary map is an isomorphism after Π and the central invariant is pure of exponential weight n. This is the complex Hodge-module analogue of the convenient boundary argument, with all operations normalized as in H.1.

**Hypotheses and conventions.** Both convenience and face nondegeneracy are required. The conclusion concerns a constant boundary cone; h need not be a proper morphism.

**Prerequisites:** [N/newton-complex](#n-newton-complex), `tauceti:TauCetiRoadmap/AnalyticToricGeometry#layer-0-the-toric-compatible-algebraic-supplier`, [B/constructible-six-operations](#b-constructible-six-operations), [H.1/operations](#h1-operations), [E/projector](#e-projector), [P/middle-weight](#p-middle-weight), `HodgeStructuresPartII:H.2/mixed-fixed-part` ([supplier packet](../packets/HodgeStructuresPartII--H.2.json)).

**Construction or proof.**

1. Take the closure of the graph h−θ=0 in a smooth proper toric refinement. Denef–Loeser’s face calculation gives a proper graph compactification smooth over the boundary strata, whose boundary maps have no vanishing cycles over A¹.
2. Use proper Betti base change, the local product charts and the boundary-strata Čech resolution to show every boundary direct-image cohomology is a local system on A¹. It is constant because A¹_an is simply connected.
3. Use the admissible fixed-part theorem (HodgeStructuresPartII H.2/mixed-fixed-part on the simply connected A¹) to upgrade underlying constant local systems to constant Hodge modules. The boundary localization triangle identifies these with the cone cohomology.
4. Apply exact Π, then the central weight result to its image.

**Check.** For h=x on G_m, convenience fails and H_c¹=Q, H¹=Q(−1), so the Π comparison cannot be asserted from nondegeneracy alone. For h=x+x⁻¹, convenience holds and the common central fibre has dimension two.

**Sources:** [DL](https://webusers.imj-prg.fr/~francois.loeser/inv91.pdf), §3.3–§3.7 and proof §3.9(c), pp. 280–282 — Gives the toroidal graph and local product boundary argument; its finite-field constancy step is replaced here by complex simple connectedness.; [FSY](https://arxiv.org/pdf/1810.06454v5), Proof of Proposition 2.21, pp. 16–18 — Uses the constant Gauss–Manin boundary correction and attributes the argument to Denef–Loeser.

<a id="n-filtered-kunneth-duality"></a>
### N/filtered-kunneth-duality — Filtered Künneth and Poincaré duality

**Theorem.** For smooth quasi-projective pairs (U,f),(V,g), the ordinary Künneth isomorphism of P/pair-kunneth-duality identifies F^λ_irr on H^r(U×V,f⊞g) with ⊕_{a+b=r}Σ_{α+β=λ}F^α_irr H^a(U,f)⊗F^β_irr H^b(V,g). The same holds for compact supports. The perfect pairing H_c^r(U,f)⊗H^{2d−r}(U,−f)→C(−d) identifies the rational filtration with its dual: the annihilator of F^λ on the compact factor is F^{>d−λ} on the ordinary factor. Here F^{>a}=Σ_{b>a}F^b. These are constant-coefficient pair statements; no unrestricted irregular Hodge-module category is assumed.

**Hypotheses and conventions.** Use the rational filtration from N/model-independence and actual pole multiplicities.

**Prerequisites:** [N/logarithmic-filtration](#n-logarithmic-filtration), [N/filtered-blowup](#n-filtered-blowup), [N/model-independence](#n-model-independence), [P/pair-kunneth-duality](#p-pair-kunneth-duality), [I/irregular-e1](#i-irregular-e1), `SchemeAndStackFoundations:SF.2/serre-proper` ([supplier packet](../packets/SchemeAndStackFoundations.json)), `SchemeAndStackFoundations:SF.2/tor-independent-base-change` ([supplier packet](../packets/SchemeAndStackFoundations--SF.2.json)), `SchemeAndStackFoundations:SF.2/derived-pullback-pushforward-qcoh` ([supplier packet](../packets/SchemeAndStackFoundations--SF.2.json)), `SchemeAndStackFoundations:SF.2/cech-to-cohomology` ([supplier packet](../packets/SchemeAndStackFoundations--SF.2.json)), `SchemeAndStackFoundations:SF.2/projective-space-cohomology` ([supplier packet](../packets/SchemeAndStackFoundations--SF.2.json)), `AlgebraicModuliForArithmeticGeometry:R09.7` ([supplier packet](../packets/AlgebraicModuliForArithmeticGeometry--R09.7.json)).

**Construction or proof.**

1. Starting from two good models, blow up intersections of boundary components whose f and g pole-order differences have opposite signs. The smallest negative product increases after finitely many such blowups, producing a non-degenerate model for f⊞g (CY §3.1).
2. On an intermediate model use the convex sum of divisor sheaves Σ_{0≤θ≤1}O(floor(μ((1−θ)P_f+θP_g))). On the initial product it is the convolution-filtered log complex. On each blowup its quotient is a sum of relative exceptional O(−1), hence has zero derived pushforward (projective-bundle structure of the exceptional divisor requested from AlgebraicModuliForArithmeticGeometry R09.7, and SF.2/projective-space-cohomology). Check the finite monomial-generator intersection resolution to justify pushforward even though that sum need not be locally free (CY §3.2).
3. Use the coherent external-product calculation (Künneth over C from SF.2/tor-independent-base-change and the projection formula, computed by Čech complexes, SF.2/cech-to-cohomology) and E₁ degeneration of both factors to identify the convolution filtration on hypercohomology, then transfer by N/model-independence. This is the additional filtered Künneth proof, rather than an appeal to the unfiltered formula.
4. For duality pair the log complex and its horizontal-boundary compact twist; local residue and Serre duality (SF.2/serre-proper) identify the complementary pole quotients, with the strict inequality at a rational jump. Apply filtered strictness and the trace. Obtain compact Künneth by dualizing the ordinary statement.

**Check.** The G_m sum examples give F^k H^k=H^k and compact F^0 H_c^k=H_c^k, paired into Q(−k). For (A¹,x²), a half-integer jump must add under external product; rounding each summand to an integer first is incorrect.

**Sources:** [CY](https://www.imath.kiev.ua/~sigma/2018/055/sigma18-055.pdf), Theorem 1, pp. 1–2; §3.1–§3.2, pp. 7–11 — Proves filtered Künneth by explicit elimination and the two comparison lemmas.; [Yu](https://arxiv.org/pdf/1203.2338v2), Theorem 2.2 and proof, pp. 14–16 — Proves the perfect filtered duality with the strict inequality at the complementary index.

**Layer acceptance.** Every target above satisfies its stated Check, every definition/construction satisfies its API and unit tests, and all identifications respect the pinned conventions. The planning inventory covers this layer; mathematical closure also requires its supplier requests and inherited proof inputs.

## Worked convention checks

For the pair (G_m,x), localization at zero in A¹ gives H¹=Q(−1) and H_c¹=Q(0); the comparison is zero because the weights differ. Taking k products gives H^k((G_m)^k,Σx_i)=Q(−k) and H_c^k=Q(0), with all other groups zero. The ordinary filtration jumps at k, the compact one at zero, and the duality pairing lands in Q(−k). For k≥1 the map from compact to ordinary is zero. This checks the pair degree normalization, Tate signs, the distinction between two support theories and the classical filtration comparison together.

For M=pQ_{A¹_τ}, Fourier cohomology is H¹=Q(−1). Indeed i_0!pQ=Q(−1)[−1], and T/fourier-costalk identifies the cohomology with that costalk. The stalk i_0*pQ=Q[1] has different degree and twist, so replacing costalk by stalk is a detectable error. For M=δ_0V instead, Fourier cohomology is V in degree zero.

For g=x on V=A¹, the zero locus K is a point. The pair (A²,tx) has H_c²=Q(−1) and H²=H²_K(A¹)=Q(−1). For g invertible both groups vanish. For g=0, K=V and ordinary cohomology is H^r(V), while compact cohomology is H_c^{r−2}(V)(−1); the purity formula for a smooth divisor does not apply to this whole-space zero locus.

For φ=x on G_m, the Newton cone has only nonnegative exponents, and top cohomology has dimension one. For φ=x+x⁻¹ the cone is the whole line, the height is |m|, and top dimension is two. For φ=x on (G_m)², the Newton polytope is not full dimensional, and ordinary torus cohomology in the unused variable prevents the asserted top-degree-only conclusion. These tests separate full dimension, nondegeneracy and convenience.

## Proof inputs requiring closure

All twelve layers have complete target inventories and are marked planned. This is planning completion; no layer is marked closed and no formalization is claimed. These direct proof inputs remain explicit. Their consequences propagate through prerequisite arrows.

**G1 — Weighted L² Hodge analytic input.** No inspected supplier covers Zucker’s complete punctured-curve weighted L² domains: equality of the closed weak/strong extensions, essential self-adjointness of the Laplacian and closed range yielding finite-dimensional harmonic representatives and Hodge decomposition (Zucker §7.1–§7.12, pp. 444–447). Current DifferentialGeometry has the compact smooth Laplacian/Green operator and excludes this analysis. The nilpotent-orbit norm estimates are requested separately from HodgeStructuresPartII:H.6. To close this gap, assign and plan the stated analytic theorem, with the local Hardy estimates of Zucker §5–§6; neither compact Hodge theory nor an unexplained appeal to elliptic regularity closes it. Direct target: [H.0/curve-l2-hodge](#h0-curve-l2-hodge).

**G2 — Polarized twistor Fourier strictness.** Sab10 Theorem 6.1 uses the strict Fourier transform of a polarized regular twistor D-module and its harmonic-metric/analytic existence theorem (the proof of Proposition 6.10 invokes Sab05 Theorems 3.3.15 and 6.1.1 and Sab06 Proposition 4.1(ii) and Corollary 5.9). The inspected HodgeStructuresPartII nonabelian Hodge moduli targets do not supply the twistor D-module category or this theorem. To close: assign the restricted polarized-curve twistor Fourier theorem, read those primary proofs, and give its construction, API and analytic prerequisites. The Deligne/Rees formulas and ESY’s mixed-weight induction are planned here; E₁ degeneration remains dependent on this input. Direct target: [I/polarized-curve-strictness](#i-polarized-curve-strictness).

**G3 — Kernel proof of regular Fourier stationary phase.** MT Lemma A.4, pp. 38–39, gives the comparison of φ at Fourier zero with ψ at input infinity by adapting an earlier proof, rather than writing the local kernel-specialization calculation. That calculation was not established in this pass. Read Sabbah, Monodromy at infinity and Fourier transform II, Proposition 4.1(ivb), and build the regular eigenvalue-one specialization/variation comparison, including the Fourier sign and filtered Tate translation. Exact Weyl Fourier and formal Levelt–Turrittin alone are not a proof. Direct target: [T/stationary-phase](#t-stationary-phase).

**G4 — Newton graded acyclicity over the cone semigroup algebra.** Yu Theorem 4.1, pp. 26–27, cites the Adolphson–Sperber acyclicity theorem; it does not prove the needed face-graded Koszul regular-sequence/semigroup-ring statement. The original proof of Adolphson–Sperber, On twisted de Rham cohomology, Nagoya Math. J. 146 (1997), 55–81, was not read. To close: read it, identify the precise characteristic-zero theorem for the cone complex, and assign its commutative-algebra foundations (including the required Cohen–Macaulay or equivalent acyclicity result) once. Do not infer top-degree concentration solely from face nondegeneracy without that argument. Direct target: [N/newton-concentration](#n-newton-concentration).

**G5 — Algebraic Whitney stratifications and stratified local triviality.** Constructibility of Rf_* and Rf_! for algebraic maps of complex varieties (Dimca Theorem 4.1.5), and the normal-slice description used for the middle perversity, rest on the existence of finite algebraic Whitney stratifications of source and target for which f is a stratified submersion, with Thom–Mather local topological triviality over each stratum (Verdier's stratification theorem). No atlas packet or upstream roadmap plans this for complex algebraic maps: SchemeAndStackFoundations SF.0 has no stratification or analytification node; AlgebraicTopologyPartII AT2.16/stratified-pair-transport assumes the Whitney stratification and control data for real manifolds; the upstream CohomologicalPointCounting/ComplexComparison proposal (TauCetiRoadmap pull request 196, Layer 3) gives semialgebraic triangulations compatible with algebraic stratifications, which yields finiteness on a fixed variety but not relative triviality of a map. To close: plan Verdier's theorem (or Hardt's semialgebraic triviality applied to the analytified map) once, as a node with its hypotheses, in this layer or in a semialgebraic-topology roadmap, and cite it from both consumers. Direct targets: [B/constructible-six-operations](#b-constructible-six-operations), [B/middle-perverse](#b-middle-perverse).

## Source corrections and version control

The following findings state mathematical assertions in original words. Each carries the verdict of the independent review. The design also listed two FSY findings (the divisor pullback shift in Example A.3 and the zero-function pushforward in Example A.27) that duplicate PAPER-FRESAN-SABBAH-YU-22/E6 and E7; they are referenced in the packet's inheritedSourceIssues rather than recorded twice. The packet records the files read, hashes, dates and correction searches. FSY locators below were checked in the Duke journal PDF as well as the arXiv version. The KS and Yu findings are explicitly restricted to the preprints read; they make no assertion about changed wording in a journal version.

**E1 (misprint, affects nothing).** Appendix A.2, p. 1726; also FSY v5 p. 61. The left-to-right side change uses ω_X⊗F_{p−dim X}M. Use F_p(M_right)=ω_X⊗F_{p+dim X}M_left. For the constant left module F_0O=O and F_{−1}O=0. The associated right ω_X begins in degree −dim X, as in Sai88 introduction p. 850. The printed sign would place it in degree +dim X. Correction status: new. Review (REV-DESIGN-MixedHodgeModulesAndIrregularHodgeTheory): confirmed. Rendered both the Duke journal page 1726 and arXiv v5 p. 61: both print ω_X⊗F_{•−dim X}M. Saito's introduction (p. 850) gives ω_X with Gr^F_p=0 for p≠−n, so the tensor filtration is F_p(ω⊗M)=ω⊗F_{p+n}M; with the printed sign the right module of O_X would start in degree +n.

**E2 (misprint, affects nothing).** Appendix A.2, p. 1727; also FSY v5 p. 62. Duality sends pQ_U^H to pQ_U^H(−d). The twist is (+d): D(pQ_U^H)=pQ_U^H(d). The constant perverse Hodge module on a smooth d-fold has weight d; its dual has weight −d. Since Q(m) has weight −2m, the positive d twist gives −d. The displayed negative twist gives 3d instead. Equivalently use the dualizing complex Q(d)[2d]. Correction status: new. Review (REV-DESIGN-MixedHodgeModulesAndIrregularHodgeTheory): confirmed. Rendered journal p. 1727: the natural isomorphism is printed with the twist (−d). pQ_U has weight d, its dual weight −d, and pQ_U(m) has weight d−2m, so the twist must be (d); FSY's own Example A.22 uses Q(−1) of weight 2, fixing the convention.

**E5 (error, affects the proof).** arXiv:1006.2706v2, §4.4, proof of Proposition 3, p. 35; finding restricted to this preprint. The proof assigns Π of a pure ambient weight-n object weights n and n−1 and presents the original object as a quotient. In the ambient MHM category, for a pure object without constant subobject, the original object embeds as W_nΠM and the constant quotient has weights at least n+1. Ambient weights and exponential quotient weights must be distinguished. For a punctual Q at zero, n=0 and Πδ_0Q=j_!Q_{G_m}[1]. Its exact sequence has δ_0Q of weight zero as subobject and Q_{A¹}[1] of weight one as quotient. Thus the asserted ambient weights and quotient direction both fail. The semisimplicity target can instead use the pure intermediate-extension representative in the Serre quotient; the counterexample does not refute that target. Correction status: new. Review (REV-DESIGN-MixedHodgeModulesAndIrregularHodgeTheory): confirmed. KS v2 p. 35 (proof of Proposition 3) gives Π(F) a two-step filtration with gr_n=F and a constant gr_{n−1} of weight n−1. For F=δ₀Q of weight 0, Π(F)=j_!Q_{G_m}[1] contains δ₀Q as a subobject with quotient Q_{A¹}[1] of weight 1 (FSY Corollary A.31 and MT (A.1) give the constant quotient weights ≥n+1). Proposition 3's statement is unaffected.

**E6 (error, affects nothing).** arXiv:1203.2338v2, §4(a), p. 26, following (24); finding restricted to this preprint. Convenience, that zero is interior to the Newton polytope, is said to make f:T→A¹ proper. Convenience puts a pole on every toric boundary component and makes the cone filtration exhaustive. A good graph compactification maps properly to A¹; the original torus map need not be proper. For T=(G_m)² and f=x+x⁻¹+y+y⁻¹ the Newton polytope is the diamond with zero interior, and every proper face not containing zero is nondegenerate. The nonempty fibre over zero is positive dimensional and affine. If f were proper, this fibre would be both proper and affine and hence finite, a contradiction. Exhaustiveness follows directly because the cone of that polytope is the full lattice space. Correction status: new. Review (REV-DESIGN-MixedHodgeModulesAndIrregularHodgeTheory): confirmed. Yu v2 p. 26 asserts that 0 in the interior of Δ(f) makes f:U→A proper. For f=x+1/x+y+1/y on (G_m)², nondegenerate and convenient, the fibre over 0 is a positive-dimensional affine curve, so f is not proper. Only the exhaustiveness of the Newton filtration, which holds, is used afterwards, so the reviewer sets affects to nothing.

## Ownership adjustments

**MixedHodgeModulesAndIrregularHodgeTheory, SpringerResolutionAndCharacteristicCycles.** The extraction brief predates the general algebraic D-module plan now in Springer. Rebuilding operators, PBW, holonomicity, transfer or intermediate extension would duplicate its exact D and H nodes. Springer retains D/differential-operators through D/characteristic-cycle and H/transfer-and-duality, H/kashiwara-equivalence, H/holonomic-modules, H/intermediate-extension and H/regular-holonomic. This roadmap imports those exact nodes and owns only the additional curve formal/index, Betti/Hodge, Fourier and exponential targets.

**MixedHodgeModulesAndIrregularHodgeTheory, HodgeStructuresPartII.** Linear Hodge structures already exist; admissible variations, canonical extensions and monodromy theory have a Part II supplier. Its moduli Riemann–Hilbert correspondence does not supply the derived constructible/regular-holonomic correspondence. Keep the pinned linear Hodge carriers as imports. Cite HodgeStructuresPartII's exact H.2 nodes (graded-polarizable, admissible-variation, canonical-extension, limit-mhs, residue-monodromy, mixed-fixed-part) and its H.0 Rees nodes; request from H.6 only the rational-coefficient form of the one-variable nilpotent-orbit theorem and norm estimates. The monodromy-filtration linear algebra is LefschetzPencilsAndVanishingCycles LPV.1, which HodgeStructuresPartII itself imports. This roadmap retains Saito’s recursive Hodge modules, their strictness and operations, and its own Betti regular Riemann–Hilbert comparison.

**MixedHodgeModulesAndIrregularHodgeTheory, SchemeAndStackFoundations, AlgebraicModuliForArithmeticGeometry.** SchemeAndStackFoundations, now merged upstream, plans neither Hironaka resolution, SNC compactification, Lefschetz pencils for this use, analytification nor weak factorization. The exact resolution, principalization and SNC-compactification nodes are AlgebraicModuliForArithmeticGeometry R09.7, and pencils are LefschetzPencilsAndVanishingCycles LPV.3. Good-model invariance needs no weak factorization once the logarithmic filtration is identified with the intrinsic F_irr on each model (ESY §1.7, §3.3–§3.4). Cite R09.7/embedded-resolution, R09.7/principalization and R09.7/snc-compactification, LPV.3/existence-of-lefschetz-pencils and the exact SF.2 and SF.3 nodes; request from R09.7 only the projective-bundle structure of exceptional divisors of smooth-centre blowups. No SchemeAndStackFoundations Part II is proposed.

**MixedHodgeModulesAndIrregularHodgeTheory, AnalyticToricGeometryPartII.** The toric schemes and lattice/fan carriers are existing upstream material; rounded divisor cohomology is an extension of the toric divisor direction. Import AnalyticToricGeometry Layer 0 and request the normal-fan/refinement bridge there; cite NT.0/divisor-sections and NT.0/section-weights and request only the rounded Newton-divisor vanishing under AnalyticToricGeometryPartII:NT.0. Exceptional-divisor acyclicity is requested from AlgebraicModuliForArithmeticGeometry R09.7. This roadmap owns the exponential complexes and their comparisons.

**MixedHodgeModulesAndIrregularHodgeTheory, EtaleDualityAndPerverseSheaves, LefschetzPencilsAndVanishingCycles, WeightsInEtaleCohomology.** The brief asks for a Betti input from EDC.5, LPV.0/LPV.6 and R34.3, but the inspected stages specify étale/ℓ-adic carriers. No Q-Betti base-change theorem is supplied by their descriptions. Keep the ℓ-adic categories and cycle theory with those owners. B here constructs the Q/C algebraically constructible analytic-site interface using the exact EnhancedDerivedSheaves E1 nodes, the analytification carrier cited at ComplexComparisonPartII C0/repair-analytification (upstream CohomologicalPointCounting/ComplexComparison, TauCetiRoadmap pull request 196) and regular Riemann–Hilbert; the stratification input is gap G5. If a shared coefficient-independent constructible core is extracted, import it once; do not identify Q-Betti and ℓ-adic realizations without a comparison.

**MixedHodgeModulesAndIrregularHodgeTheory, tauceti:FormalConnectionsOpers (TauCetiRoadmap pull request 1056, open).** The open upstream roadmap FormalConnectionsOpers plans, in its F6, the cyclic-vector theorem and the finite-ramification formal normal form of differential modules over ℂ((t)) with slope decomposition, commuting semisimple irregular parts, regular residue and ramified descent, together with lattice estimates. This overlaps D/formal-differential-module and D/formal-decomposition. It is not on TauCetiRoadmap main, so it is not yet existing work. Keep D planned here while that pull request is open. When it merges, D/formal-decomposition should cite its F6 normal-form theorem instead of re-planning it, and D/formal-differential-module should keep only the lattice-index irregularity and its comparison with slopes; D/curve-index is unaffected.

**MixedHodgeModulesAndIrregularHodgeTheory, ComplexComparisonPartII, SheafConvolutionOnAbelianVarieties.** SheafConvolutionOnAbelianVarieties request R8 asks ComplexComparisonPartII:C5 for regular holonomic Riemann–Hilbert as an undesigned extension; ComplexComparisonPartII plans only Deligne's equivalence for regular singular connections, and this roadmap plans the holonomic comparison at B/regular-riemann-hilbert. Make B/regular-riemann-hilbert the single owner of the regular holonomic Riemann–Hilbert correspondence, importing ComplexComparisonPartII C5/deligne-regular-singular-equivalence as its smooth case, and redirect SheafConvolutionOnAbelianVarieties R8 to it.

## Routed coverage

Every one of the 25 items routed from PAPER-FRESAN-SABBAH-YU-22 has a target or an exact supplier import. This map is an inventory of mathematical ownership; it does not reproduce the source’s order or its prose.

| Routed item | Targets |
| --- | --- |
| 9 | [D/formal-differential-module](#d-formal-differential-module), [D/formal-decomposition](#d-formal-decomposition), [D/curve-index](#d-curve-index) (also Springer imports) |
| 10 | [F/fourier-laplace](#f-fourier-laplace), [F/localized-fourier](#f-localized-fourier), [F/fourier-duality](#f-fourier-duality) |
| 11 | [H.0/pure-hodge-module](#h0-pure-hodge-module), [H.0/mixed-hodge-module](#h0-mixed-hodge-module), [H.0/abelian-strictness](#h0-abelian-strictness), [H.1/operations](#h1-operations), [E/projector](#e-projector) |
| 12 | [H.1/hodge-cycles](#h1-hodge-cycles), [H.1/curve-costalk](#h1-curve-costalk) |
| 13 | [H.1/divisor-localisation](#h1-divisor-localisation) |
| 14 | [E/exponential-category](#e-exponential-category), [E/projector](#e-projector), [E/tensor](#e-tensor), [E/de-rham-fibre](#e-de-rham-fibre) |
| 15 | [E/exponential-weight](#e-exponential-weight) |
| 16 | [I/deligne-filtration](#i-deligne-filtration), [I/rees-laplace-specialisation](#i-rees-laplace-specialisation), [I/polarized-curve-strictness](#i-polarized-curve-strictness), [I/irregular-e1](#i-irregular-e1) |
| 17 | [I/strict-bifiltered-realisation](#i-strict-bifiltered-realisation) |
| 18 | [C/classical-embedding](#c-classical-embedding) |
| 19 | [C/classical-filtration](#c-classical-filtration) |
| 20 | [P/pair-cohomology](#p-pair-cohomology), [P/pair-fibre](#p-pair-fibre), [P/pair-kunneth-duality](#p-pair-kunneth-duality) |
| 21 | [P/middle-weight](#p-middle-weight) |
| 22 | [P/pair-localisation](#p-pair-localisation) |
| 23 | [P/tate-examples](#p-tate-examples) |
| 24 | [G/tg-classicality](#g-tg-classicality) |
| 25 | [G/zero-locus](#g-zero-locus) |
| 26 | [T/fourier-cohomology](#t-fourier-cohomology) |
| 27 | [T/fourier-costalk](#t-fourier-costalk) |
| 28 | [T/pure-fourier-hodge](#t-pure-fourier-hodge), [T/constant-correction](#t-constant-correction) |
| 64 | [N/newton-complex](#n-newton-complex), [N/newton-concentration](#n-newton-concentration), [N/newton-hodge-comparison](#n-newton-hodge-comparison) |
| 68 | [N/constant-gauss-manin-cone](#n-constant-gauss-manin-cone) |
| 69 | [E/fourier-localisation-projector](#e-fourier-localisation-projector) |
| 70 | [T/stationary-phase](#t-stationary-phase), [T/weights-at-infinity](#t-weights-at-infinity) |
| 73 | [N/logarithmic-filtration](#n-logarithmic-filtration), [N/filtered-blowup](#n-filtered-blowup), [N/model-independence](#n-model-independence) |

## References and reading boundaries

Locators in the targets use the pagination of the linked version. The cited proofs were used to derive reusable targets, rather than copied into this repository. Dimca is a maintainer-cleared in-place reference; all other linked primary texts are publicly readable. The analytic twistor and original Adolphson–Sperber proofs named under the gaps are required reading for closing those gaps and are not represented as inspected sources.

**FSY.** Javier Fresán, Claude Sabbah and Jeng-Daw Yu, [Hodge theory of Kloosterman connections](https://arxiv.org/pdf/1810.06454v5). arXiv:1810.06454v5, 13 June 2022; preprint pagination, compared with the Duke journal PDF for the source findings. Read 2026-10-19: Appendix A.1–A.7, pp. 59–73, including proofs; §2.3, Proposition 2.21, pp. 16–18; §4.3.1–§4.3.3, pp. 35–37.

**Sai88.** Morihiko Saito, [Modules de Hodge polarisables](https://ems.press/content/serial-article-files/42460?nt=1). Publ. RIMS 24 (1988), 849–995; EMS scan. Read 2026-10-19: §3.1.1–§3.1.8, pp. 902–905; §3.2.1–§3.2.6, pp. 905–908; §5.1.6–§5.1.10, pp. 955–958; §5.2.10–§5.2.14, pp. 967–970; Theorem 5.3.1 and §5.3.3–§5.3.11, pp. 977–988; §3.4, Proposition 3.4.12, pp. 917–925 (read by the review).

**Sai90.** Morihiko Saito, [Mixed Hodge modules](https://ems.press/content/serial-article-files/42511). Publ. RIMS 26 (1990), 221–333; EMS scan. Read 2026-10-19: Introduction 0.1–0.3, pp. 221–226; §1.7–§1.9, pp. 231–232; §2.2–§2.4 and §2.7–§2.11, pp. 237–247; §3.29 and §4.1–§4.5, pp. 314–325.

**Dimca.** Alexandru Dimca, [Sheaves in Topology](https://doi.org/10.1007/978-3-642-18868-8). Universitext, Springer, 2004; maintainer-cleared reference copy. Read 2026-10-19: §4.1, Definition 4.1.1 and Theorem 4.1.5, pp. 81–84; §4.2, pp. 107–117; §5.1–§5.3, pp. 125–145, particularly 5.1.20, 5.2.16, 5.2.21 and 5.3.3; §3.2–§3.3, Definition 3.2.1, Theorems 3.2.3 and 3.3.10, pp. 62–69; §4.2, pp. 103–110 (read by the review).

**Kash84.** Masaki Kashiwara, [The Riemann–Hilbert problem for holonomic systems](https://www.kurims.kyoto-u.ac.jp/~kenkyubu/kashiwara/RiemannHilbert.pdf). Publ. RIMS 20 (1984), 319–365. Read 2026-10-19: Main theorem, §6, pp. 353–355; §7, proof by reduction to normal crossings, pp. 355–362.

**KS.** Maxim Kontsevich and Yan Soibelman, [Cohomological Hall algebra, exponential Hodge structures and motivic Donaldson–Thomas invariants](https://arxiv.org/pdf/1006.2706v2). arXiv:1006.2706v2, 11 July 2011; preprint pagination. Read 2026-10-19: §4.2, pp. 27–31, projector and tensor product; §4.4, pp. 34–37, Definitions 11–12 and Propositions 2–4; §4.2–§4.3, Definitions 7–8, pp. 30–31 (read by the review).

**ESY.** Hélène Esnault, Claude Sabbah and Jeng-Daw Yu, with appendices by Morihiko Saito, [E₁-degeneration of the irregular Hodge filtration](https://arxiv.org/pdf/1302.4537v3). arXiv:1302.4537v3, 30 January 2014; preprint pagination. Read 2026-10-19: §1.2, Theorem 1.2.2, pp. 5–6; §1.6, pp. 11–14; §2.2–§2.4, pp. 19–22; §3.1–§3.4, pp. 22–26; Appendices A–B, pp. 26–29.

**Yu.** Jeng-Daw Yu, [Irregular Hodge filtration on twisted de Rham cohomology](https://arxiv.org/pdf/1203.2338v2). arXiv:1203.2338v2, 4 October 2013; preprint pagination. Read 2026-10-19: §1, pp. 4–13, especially Lemma 1.6, Theorem 1.7 and Corollary 1.8; §2, Theorem 2.2 and proof, pp. 14–16; §4, pp. 25–31, Theorem 4.1, Corollary 4.2, Proposition 4.4 and Theorem 4.6; Appendix A, Theorem A.1 and Proposition A.2, p. 32.

**MT.** Yutaka Matsui and Kiyoshi Takeuchi; appendix by Claude Sabbah, [Monodromy at infinity of polynomial maps and Newton polyhedra (appendix by Claude Sabbah)](https://arxiv.org/pdf/0912.5144v12). arXiv:0912.5144v12, 22 February 2012; appendix pp. 34–40. Read 2026-10-19: Appendix A.1–A.5, pp. 34–40; Proposition A.3 and its complete proof.

**Sab10.** Claude Sabbah, [Fourier–Laplace transform of a variation of polarized complex Hodge structure, II](https://arxiv.org/pdf/0804.4328v2). arXiv:0804.4328v2; published in Adv. Stud. Pure Math. 59 (2010), 289–347; locators use preprint pages. Read 2026-10-19: §6.a–§6.c, Theorem 6.1 and Proposition 6.10, pp. 30–36; Proof of Proposition 6.10 and the references it invokes, pp. 35–36 (read by the review).

**Mal20.** Bernard Malgrange, [Sur les points singuliers des équations différentielles](https://www.numdam.org/item/SEDP_1971-1972____A20_0.pdf). Séminaire Goulaouic–Schwartz 1971–1972, exposé XX, pp. 1–13. Read 2026-10-19: §1–§3, pp. XX.1–XX.11, local analytic/formal index comparison and Theorem 3.3.

**Mal21.** Bernard Malgrange, [Sur les points singuliers des équations différentielles (suite)](https://www.numdam.org/item/SEDP_1971-1972____A21_0.pdf). Séminaire Goulaouic–Schwartz 1971–1972, exposé XXI, pp. 1–8. Read 2026-10-19: §5, Propositions 5.1 and 5.5, Definition 5.3, pp. XXI.1–XXI.4; §6, Proposition 6.1, pp. XXI.4–XXI.6.

**Mal22.** Bernard Malgrange, [Sur les points singuliers des équations différentielles (fin)](https://www.numdam.org/item/SEDP_1971-1972____A22_0.pdf). Séminaire Goulaouic–Schwartz 1971–1972, exposé XXII, pp. 1–15. Read 2026-10-19: §8, Proposition 8.4 and Remark 8.5, pp. XXII.6–XXII.7; §9, formal splitting and ramification algorithm, pp. XXII.7–XXII.12; §10.C, Theorem 10.3, p. XXII.14.

**Zucker.** Steven Zucker, [Hodge theory with degenerating coefficients: L₂ cohomology in the Poincaré metric](https://www.math.stonybrook.edu/~cschnell/mat690/Zucker.pdf). Annals of Mathematics 109 (1979), 415–476; journal scan hosted by Christian Schnell. Read 2026-10-19: §4, Theorem 4.8, pp. 433–434; §5–§6, local L₂ lemmas and their estimates, pp. 434–444; §7–§8, Theorem 7.12, Corollary 7.13 and Proposition 8.2, pp. 444–448.

**DL.** Jan Denef and François Loeser, [Weights of exponential sums, intersection cohomology, and Newton polyhedra](https://webusers.imj-prg.fr/~francois.loeser/inv91.pdf). Invent. math. 106 (1991), 275–294; journal scan on the author’s site. Read 2026-10-19: §3.3–§3.9, pp. 280–282, toroidal graph compactification, boundary local acyclicity and the convenient case.

**CY.** Kai-Chieh Chen and Jeng-Daw Yu, [The Künneth Formula for the Twisted de Rham and Higgs Cohomologies](https://www.imath.kiev.ua/~sigma/2018/055/sigma18-055.pdf). SIGMA 14 (2018), 055, 14 pages; journal PDF. Read 2026-10-19: Theorem 1, pp. 1–2; §2.1–§2.3, pp. 2–7; §3.1–§3.2, pp. 7–11, including both comparison lemmas.

**FSY-journal.** Javier Fresán, Claude Sabbah and Jeng-Daw Yu, [Hodge theory of Kloosterman connections](https://javier.fresan.perso.math.cnrs.fr/kloosterman.pdf). Duke Math. J. 171 (2022), no. 8, 1649–1747; journal PDF on first author’s site. Read 2026-10-19: Appendix A.2, pp. 1726–1729; Example A.27, p. 1739, compared with the arXiv version for the source findings.
