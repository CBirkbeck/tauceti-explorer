# Roadmap: geometry of numbers, quadratic forms and homogeneous arithmetic

This roadmap builds the geometry of numbers and the arithmetic of quadratic and hermitian lattices on top of Mathlib's `ZLattice`, Minkowski's first theorem and the number-field embeddings, and on top of Tau Ceti's integral lattices over `ℤ`, its exact categories and its spinor norms. From covolumes and Gram determinants it goes to successive minima and both sharp halves of Minkowski's second theorem; from there to integral quadratic lattices over a Dedekind domain with their localisations, genera and spinor genera, to the local theory (invariant factors, dyadic normal forms, hermitian and quaternionic variants), to representation densities, Siegel polynomials and the mass of a genus; then to lattice-point counting, the homogeneous-dynamics theorems behind Margulis's and Duke's results, star bodies and transference; to a certified LLL reduction; and finally to Schlichting's hermitian K-theory of exact categories with its applications to Dedekind rings and to the integers. The end theorems are Minkowski's second theorem in both directions, the Cho–Yamauchi density formula and the mass identity for a definite genus, Henk's lattice-point bound, Margulis's theorem on values of indefinite forms, Duke's equidistribution of lattice points on spheres, the LLL approximation factor with an exact certificate, and the hermitian delooping theorem with the integral Grothendieck–Witt tables.

The construction has seven layers, in order.

| Layer | Construction |
| --- | --- |
| 0 | Lattices, Gram determinants and covolumes |
| 1 | Convex bodies, successive minima and Minkowski's theorems |
| 2 | Integral quadratic and hermitian lattices |
| 3 | Representation densities, mass and theta coefficients |
| 4 | Lattice points, star bodies and homogeneous dynamics |
| 5 | Certified LLL reduction |
| 6 | Hermitian K-theory of exact categories |

Layers 0 and 1 are the geometry of numbers proper and are consumed by Layers 3, 4 and 5. Layer 2 is independent of Layer 1 except for the finiteness lemma 1.2.2, which Layer 3 uses. Layer 5 needs only Layer 0 and the first minimum of Layer 1. Layer 6 needs Layer 2 only for its field-level and signed hermitian comparisons and can be built in parallel with Layers 3–5.

## Scope and ownership

This roadmap owns: the covolume calculus of discrete full lattices in real inner-product spaces beyond what Mathlib and Tau Ceti state (Hadamard, projections, duals, primitive intersections); successive minima of a convex body with respect to a lattice and Minkowski's second theorem in both directions; Minkowski's linear forms theorem; integral quadratic lattices over a Dedekind domain with localisation, descent, genus and proper spinor genus over a number field; invariant factors over a discrete valuation ring and Voight's atomic normal forms; integral hermitian lattices over a quadratic extension, quaternionic hermitian lattices over a quaternion order, and signed hermitian forms over a local field of odd residue characteristic; hermitian representation counts, local densities, Siegel polynomials and the Cho–Yamauchi formula; finite stabilizers and class sets over number rings, the mass of a genus, the adelic mass identity and the mass formula for maximal lattices; the theta series of a positive definite lattice as a holomorphic function with its coefficients; Henk's lattice-point bounds and Davenport's estimate; Howe–Moore, ergodicity, Dani–Margulis, Ratner's three theorems, Margulis's theorem on quadratic values and Duke's theorem with their analytic inputs; packing and covering radii, Gaussian lattice sums and transference; star bodies, critical determinants, critical lattices and Mahler's criterion; Siegel's mean value theorem; certified LLL reduction; and the hermitian K-theory of exact categories from dualities to the nonconnective spectrum, with the ordinary K-theoretic and homotopical inputs it needs.

It leaves to other roadmaps, and cites: the field theory of quadratic forms (QuadraticFormInvariants Layers 1–6 and 9: hyperbolic planes and Witt cancellation, quaternion algebras, discriminants, the Witt ring, the Brauer-valued invariants, classification over a local field, the Scharlau transfer); isotropy and isometry over number fields (GlobalQuadraticForms Layers 5 and 6); integral lattices over `ℤ` and `ℤ_p` with their duals, discriminant groups, overlattices, Jordan splittings, genera over `ℤ`, Minkowski reduction and class-number finiteness over `ℤ`, the local automorphism density over `ℤ_p` and the masses over `ℤ` (Completed IntegralLattices Layers 1, 2 and 4; IntegralLattices milestones 2A–2G, 3A–3F, 4A–4C and 7A–7C); the spinor norm over a field with `2` invertible, its local tables and its adelic form over `ℚ` (OrthogonalSpinGroups Layers 1–3); the Pin and Spin groups and the double cover (RepresentationTheory/SpinRepresentations Layer 2); matrix Lie groups and the closed-subgroup theorem (RepresentationTheory/LieGroups Layer 2); finite adelic points, quotient and Tamagawa measures, reduction theory and the finite volume of arithmetic quotients (AdelicAlgebraicGroups AA.1, AA.2 and AA.3); exact structures and conflation-exact functors (GrothendieckEulerForms Layer 0, Tau Ceti `ExactStructure`) and exact Grothendieck groups (GrothendieckEulerForms Layer 2, Tau Ceti `ExactK0`); and Construction A (AlgebraicCodingTheory Layer 6). The modularity of theta series, strong approximation for spin groups, Tamagawa numbers and the Smith–Minkowski–Siegel formula for arbitrary genera are not stated here.

Already in Mathlib or Tau Ceti, used without restatement: Blichfeldt's theorem (`MeasureTheory.exists_pair_mem_lattice_not_disjoint_vadd`), Minkowski's first theorem in its strict and compact forms (`exists_ne_zero_mem_lattice_of_measure_mul_two_pow_lt_measure`, `…_le_measure`), the covolume of an ideal lattice under the mixed embedding (`NumberField.mixedEmbedding.covolume_idealLattice`, `covolume_integerLattice`), the bounded ideal-class representatives (`NumberField.exists_ideal_in_class_of_norm_le`) and the unit rank (`NumberField.Units.finrank_modTorsion`); the squared covolume as a Gram determinant (`ZLattice.covolume_sq_eq_det_gram`, Tau Ceti) and the Gram determinant of the image of an orthonormal basis as a squared normal determinant (`LinearMap.normDet_sq_eq_det_gram`, Mathlib, of which the family form `det Gram(v) = ‖det_b v‖²` is the case `U = EuclideanSpace 𝕜 (Fin n)`); the dual lattice (`LinearMap.BilinForm.dualSubmodule`); the spinor norm `θ(τ_{v₁}⋯τ_{v_r}) = [Q v₁ ⋯ Q v_r]` (Tau Ceti `CliffordAlgebra.spinorNorm`) and its finite adelic form over `ℚ` (`OrthogonalCompactOpens.adelicSpinorNorm`); the finiteness of isometries into a positive definite `ℤ`-lattice (`IntegralLattice.IsPosDef.finite_isometry`) and representation numbers (`IntegralLattice.representationNumber`); the Witt and Witt–Grothendieck rings of a field (`WittRing`, `WittGrothendieckRing`); involutive dualities on a category (`Functor.IsInvolutiveDual`, `Functor.dualityEquivalence`); lattice-point counts with an error term for Lipschitz boundaries (`TauCeti.NumberTheory.GeometryOfNumbers.LatticePointCount`), which Layer 4 does not reprove; and exact categories with their conflations, exact functors and `K₀` (`TauCeti.CategoryTheory.Exact`, `TauCeti.ExactK0`). Where a target here is a variant of one of these, its entry says in one clause how it differs.

## Conventions

**Lattices and volumes.** A lattice is a `Submodule ℤ E` with `DiscreteTopology` and `IsZLattice ℝ`; a lattice of lower rank is moved into its real span before any volume is taken. Volumes are the canonical Euclidean volumes of the space in question (`volume` on a finite-dimensional real inner-product space), with volume `1` in dimension zero; the covolume is `ZLattice.covolume`. Gram matrices use Mathlib's convention that the inner product is conjugate-linear in the first argument. An oriented determinant is never used as a covolume.

**Convex bodies and minima.** A body is a `ConvexBody E` with `0` in its interior; central symmetry is a separate hypothesis, assumed only where stated. The gauge is Mathlib's `gauge`. The successive minima are real numbers indexed by `i : Fin d`, `d = dim E`, with `i` meaning the `(i+1)`-st minimum; there is no minimum in dimension zero. The polar of a box is a weighted cross-polytope.

**Integral lattices.** Over a Dedekind domain `R` with fraction field `K`, an integral quadratic lattice is a `Submodule R V` with `Submodule.IsLattice K` and a quadratic map `q : V → K` with `q(L) ⊆ R`; it is projective and may be non-free, and no basis is stored. The quadratic map is primary: the polar pairing `B(x,y) = q(x+y) − q(x) − q(y)` is never divided by two silently, and whenever a symmetric bilinear lattice is compared with a quadratic one the convention `q(x) = B(x,x)/2` is written out, with the resulting factor `2^{−n}` in determinants and the sign `(−1)^{n(n−1)/2}` in signed discriminants. Localisation at a prime and completion at a prime are different operations. Rational isometry, integral isometry, genus and proper spinor genus are four different relations with four different types.

**Local fields.** At a nonarchimedean place `q` denotes the residue cardinality of the base field; an unramified quadratic extension has residue field of size `q²`. Representation counts count all form-preserving maps; embedding counts count injective ones. Haar measure on lattice coordinates gives the integral coordinate lattice volume `1`.

**Mass.** The mass of a genus is the sum of the reciprocals of the orders of the finite integral isometry groups over the classes of the genus; the proper mass uses proper classes and `SO`. The two are related by an index comparison that is a theorem, not a convention.

**Reduction.** The LLL parameter is `δ = 3/4`, Gram–Schmidt coefficients are exact rational numbers, shears use nearest integers in descending index order, and every output carries an integer change-of-basis certificate `U, V` with `UV = VU = I`.

**Dynamics.** Homogeneous spaces are `G/Γ` for a connected real matrix Lie group `G` and a lattice `Γ`, with the invariant probability measure; mixing, ergodicity, nondivergence, orbit closures, measure classification and equidistribution are separate statements.

**Exact categories and dualities.** An exact category is a Tau Ceti `ExactStructure` on a preadditive category with a zero object and biproducts. A strong duality is Tau Ceti's `IsInvolutiveDual` together with exactness of the duality functor. Symmetric spaces have a pairing isomorphism; a Lagrangian is an admissible inflation whose quotient is the dual of the subobject; hyperbolic spaces and the diagonal Lagrangian use biproducts and never divide by two. Invertibility of `2` is a hypothesis of the individual targets that need it and nothing else.

## Exact supplier contracts

**From Mathlib.** `ZLattice.covolume`, `covolume_eq_det_mul_measureReal`, `covolume_div_covolume_eq_relIndex'`, `ZSpan.isAddFundamentalDomain'`, `ZSpan.fundamentalDomain_ae_parallelepiped`, `ZLattice.comap`, `Module.Basis.ofZLatticeBasis`, `Matrix.gram` with `gram_eq_conjTranspose_mul`, `posSemidef_gram`, `det_gram_ne_zero_iff_linearIndependent`, `InnerProductSpace.gramSchmidt`, `gramSchmidtOrthonormalBasis` and `gramSchmidtOrthonormalBasis_det`, `Submodule.exists_smith_normal_form_of_le`, `LinearMap.BilinForm.dualSubmodule`, `dualBasis` and `dualSubmodule_span_of_basis`, `ConvexBody`, `gauge` and the gauge lemmas named in Layer 1, `MeasureTheory.exists_pair_mem_lattice_not_disjoint_vadd` and the two Minkowski theorems, `MeasureTheory.Measure.addHaar_image_linearMap` and `addHaar_preimage_linearMap`, `Convex.addHaar_frontier`, `MeasureTheory.volume_sum_rpow_le`, `Submodule.IsLattice`, `QuadraticMap`, `QuadraticForm`, `LinearMap.IsSymm`, `Quaternion` and `QuaternionAlgebra`, `Subgroup.index` and `relIndex`, `ZMod`, `Nat.card`, `Polynomial` with `derivative`, `Metric.infEDist`, `CategoryTheory.nerve`, `SSet.toTop`, `HomotopyGroup`, `CategoryTheory.Localization`, `IsPullback`, biproducts, `FreeAbelianGroup`. Each is used with its actual hypotheses; in particular `QuadraticMap.associated`, `QuadraticForm.discr` and `QuadraticForm.baseChange` are used only where `2` is invertible.

**From Tau Ceti.** `ZLattice.covolume_sq_eq_det_gram`; `IntegralLattice`, `IntegralLattice.dualCarrier`, `IsPosDef.finite_isometry`, `representationNumber`, `IntegralLattice.minimum`; `CliffordAlgebra.spinorNorm`, the local spinor-norm images and `OrthogonalCompactOpens.adelicSpinorNorm`; `WittRing`, `WittGrothendieckRing`, `QuadraticMap.scharlauTransfer`; `Functor.IsInvolutiveDual` and `dualityEquivalence`; `ExactStructure`, `ExactStructure.IsConflationExact`, `ExactStructure.op`, `ExactStructure.split`, `ExactK0`, `ExactK0.of`, `ExactK0.of_conflation`, `ExactK0.map`; `TauCeti.NumberTheory.GeometryOfNumbers.LatticePointCount`.

**From TauCetiRoadmap.QuadraticFormInvariants.** Layer 1 (hyperbolic decomposition, reflection generation and Witt cancellation over fields of characteristic not `2`), used by 2.1.1; Layer 2 (quaternion algebras and the standard involution), used by 2.8; Layer 3 (rank, determinant and signed discriminant with the `q = B(x,x)/2` scaling), used by 2.1.2; Layer 4 (the Witt ring), used by 2.1.3; Layer 5 (Hasse and Clifford invariants as Brauer classes), used by 2.1.4; Layer 6 (classification over a nonarchimedean local field by dimension, discriminant and Hasse invariant), used by 2.1.5 and 2.4; Layer 9 (the Scharlau transfer and its change-of-functional theorem in the quadratic case), used by 2.9.6. What is assumed is exactly the field statements; no integral consequence is read into them.

**From TauCetiRoadmap.GlobalQuadraticForms.** Layer 5 (Hasse–Minkowski isotropy over a number field), used by 2.1.6; Layer 6 (local-to-global isometry of regular forms), used by 2.1.7 and 2.4.1. Neither supplies an integral isometry.

**From Completed/IntegralLattices and TauCetiRoadmap/IntegralLattices.** Completed Layer 1 (the `ℤ`-carrier with a symmetric rational form), Layer 2 (duality and the discriminant group) and Layer 4 (overlattices and isotropic subgroups) are the three comparison targets of 2.3; IntegralLattices milestones 2A–2C, 2F–2G, 3A, 3F, 4C and 7A are the `ℤ`-cases that the variants of 1.2.1, 2.2.2, 2.4.1, 2.4.5, 3.3.1–3.3.3 and 3.4.1 cite.

**From TauCetiRoadmap.OrthogonalSpinGroups and RepresentationTheory/SpinRepresentations.** The spinor norm on `O(Q)` and `SO(Q)` over a field with `2` invertible (OrthogonalSpinGroups 1D), the local tables (2F), the adelic norm over `ℚ` (3F), and the spin double cover with kernel the spinor norm (SpinRepresentations Layer 2) are consumed by 2.4; no surjectivity of `Spin → SO` on local points is assumed.

**From AdelicAlgebraicGroups.** AA.1 (finite adelic points of a linear algebraic group with the restricted-product topology, and the induced map of adelic points along a homomorphism), used by 2.4; AA.2 (compatible Haar measures on local factors, quotient measures and `L²` of the quotient), used by 3.3.4, 4.2.1 and 4.2.2; AA.3 (reduction domains, finite volume of `G(K)\G(𝔸)` for semisimple `G`, and the quotient topology of `SL_n(ℝ)/SL_n(ℤ)`), used by 3.3.2, 3.3.4, 4.5.8 and 4.6.1. No Tamagawa number is read off from these.

**From TauCetiRoadmap.GrothendieckEulerForms.** Layer 0 (intrinsic exact structures, conflation-exact functors, biproduct conflations, the opposite exact structure), used throughout Layer 6; Layer 2 (exact Grothendieck groups), used by 6.4 and 6.1.2.

**From TauCetiRoadmap.AlgebraicCodingTheory.** Layer 6 (Construction A with its exact index, duality and parity hypotheses), used by 4.7.1.

**From RepresentationTheory/LieGroups.** Layer 2 (the closed-subgroup theorem, the matrix groups `SL_n`, `SO(p,q)` as Lie groups with their Lie algebras), used by 4.2 and 4.3.

## How to read the build

Layer 0 gives the Gram-determinant and covolume identities and the adapted bases behind them. Layer 1 defines successive minima and proves Minkowski's theorems. Layer 2 sets up integral quadratic and hermitian lattices over Dedekind domains with their local theory and their genera, and the comparisons that connect them to the field theory and to the `ℤ`-lattices of Tau Ceti. Layer 3 counts: finite-field representation numbers, local densities and Siegel polynomials, stabilizers, classes, mass, theta coefficients. Layer 4 is the analytic and dynamical side: lattice-point bounds, the homogeneous-dynamics theorems and their two arithmetic applications, transference, star bodies and critical lattices, Siegel's mean value theorem, lattices from codes. Layer 5 is the certified LLL algorithm. Layer 6 is hermitian K-theory of exact categories, beginning with the ordinary K-theoretic inputs it needs. Within Layer 2, build 2.2 and 2.7 before the field comparisons and the dual-quotient invariants; within Layer 6, the degree-zero presentations and formation comparison feed the topological comparisons. Each target's `*Needs:*` line names its inputs by subsection number or supplier, and every definition ends with its checks, which reappear as `example`s in `Suggested.lean`.
## Layer 0: Lattices, Gram determinants and covolumes

This layer is the calculus of covolumes of discrete full ℤ-submodules of a real inner-product space `E`. Everything is stated intrinsically: a lattice of lower rank is first moved into its real span, which carries the inherited inner product and its own Lebesgue measure, and every volume is the canonical Euclidean volume of the space in which it is taken, with volume one in dimension zero. The layer proves the Gram–Hadamard inequality in the hermitian generality needed by Couveignes’ counting argument, and establishes the three covolume identities of Horesh–Karasik’s appendix: the covolume of an orthogonal projection, the reciprocal covolume of the inner dual, and the equality of the covolumes of the two primitive intersections `Δ ∩ W` and `Δ ∩ W^⊥` of a self-dual lattice. The adapted-basis lemmas of 0.2 are the integral linear algebra these identities need (Smith normal form for a saturated sublattice, the projected basis, biorthogonal families) and are reusable on their own.

### 0.1 Gram determinants and the Hadamard inequality

**0.1.1 Hadamard bound in orthonormal coordinates.** Prove `orthonormal_coordinate_hadamard`: For an orthonormal basis b:Fin n→E over an RCLike field and any v:Fin n→E, ‖det_b(v)‖≤∏i ‖v_i‖.
*Hypotheses.* b is a full orthonormal basis; n=0 and dependent families are allowed.
(Source: Couveignes, *Enumerating number fields*, §3, printed p.494 (physical PDF p.8), Gram/covolume calculation.)
*Needs:* Mathlib `InnerProductSpace.gramSchmidtOrthonormalBasis`, `InnerProductSpace.gramSchmidtOrthonormalBasis_det`, `norm_inner_le_norm`, `Orientation.abs_volumeForm_apply_le`, Mathlib `LinearMap.normDet_sq_eq_det_gram`.
**Checks.**
- Orthogonal real columns (2,0),(0,3) attain determinant norm 6 and product norm 6.
- Columns (1,0),(1,1) have determinant norm 1 and product norm √2; equality fails.
- Duplicate nonzero columns have determinant 0 and positive product norms.

**0.1.2 Hermitian Gram–Hadamard inequality.** Prove `hermitian_gram_hadamard`: For any v:Fin n→E in a normed RCLike inner-product space, det Gram(v) is the scalar image of its real part, and 0≤Re(det Gram(v))≤∏i ‖v_i‖². The ambient space need not be finite-dimensional.
*Hypotheses.* E is normed, not merely seminormed; n may be zero. No linear independence or nonsingularity assumption.
(Source: Couveignes, *Enumerating number fields*, §3, printed p.494 (physical PDF p.8), Gram/covolume calculation.)
*Needs:* Mathlib `Matrix.det_gram_ne_zero_iff_linearIndependent`, `Matrix.posSemidef_gram`, `finrank_span_eq_card`, Mathlib `LinearMap.normDet_sq_eq_det_gram`, 0.1 `orthonormal_coordinate_hadamard`.
**Checks.**
- The empty Gram determinant and diagonal product both equal 1.
- Family (1,i) in C has Gram [[1,i],[-i,1]], determinant 0 and diagonal product 1; conjugation is essential.
- Real vectors (1,0),(1,1) have Gram [[1,1],[1,2]], determinant 1 and diagonal product 2.

**0.1.3 Uniform Gram determinant bound.** Prove `gram_uniform_bound`: If D≥0 and every v_i in v:Fin n→E satisfies ‖v_i‖²≤D, then Re(det Gram(v))≤D^n.
*Hypotheses.* The bound is on squared norms, not individual coefficients; n=0 is allowed.
(Source: Couveignes, *Enumerating number fields*, §3, printed p.494 (physical PDF p.8), Gram/covolume calculation.)
*Needs:* 0.1 `hermitian_gram_hadamard`.
**Checks.**
- n=0,D=0 gives 1≤0^0=1.
- A nonempty zero family with D=0 has determinant 0.
- Two orthogonal vectors of squared norm 5 attain determinant 25, so replacing D^n by D fails.

### 0.2 Adapted integral bases, projections and biorthogonal families

**0.2.1 Integral basis adapted to a primitive intersection.** Prove `saturated_adapted_basis`: With E, Δ, W and L as in the hypotheses, there exist natural numbers r,s, an integral basis b of Δ indexed by Fin r disjoint-union Fin s, and an integral basis c of L indexed by Fin r, such that b(inl i)=c_i in E for every i. Consequently r=dim W, s=dim W-perp and r+s=dim E; no orthogonality of the integral complement is asserted.
*Hypotheses.* E is a finite-dimensional real normed inner-product space. All subspaces carry the inherited inner product; all volumes are their canonical intrinsic Euclidean volumes, including volume one in dimension zero. Δ is a discrete full Z-submodule of E. W is a real subspace. L is the comap of Δ along W→E; span_R(L)=W, written intrinsically as span_R(L in W)=top. P is the image of Δ under orthogonal projection E→W-perp.
(Source: Horesh–Karasik 2023, Proposition B.4, published p.1290, basis-completion step.)
*Needs:* Mathlib `Submodule.exists_smith_normal_form_of_le`, `instModuleFinite_of_discrete_submodule`, `instModuleFree_of_discrete_submodule`, `ZLattice.comap_discreteTopology`, `Module.Basis.isUnitSMul`, `Module.Basis.ofZLatticeBasis`, `Submodule.finrank_add_finrank_orthogonal`, `Module.finrank_eq_card_basis`.
**Checks.**
- Columns (1,1),(0,1) form an integral basis: determinant 1.
- No matrix with first column (2,0) and an integral second column has determinant ±1.
- The zero lattice in zero-dimensional Euclidean space admits the empty integral basis.

**0.2.2 Basis of the projected lattice.** Prove `projected_adapted_basis`: Let b be an integral basis of a full lattice Δ indexed by Fin r disjoint-union Fin s, c a real basis of W indexed by Fin r, and b(inl i)=c_i in E. Then the vectors q_j=π(b(inr j)), with π:E→W-perp orthogonal projection, form a real basis q of W-perp, and their integral span is exactly P=π(Δ). In particular P is discrete and full in W-perp; these properties are conclusions.
*Hypotheses.* E is a finite-dimensional real normed inner-product space. All subspaces carry the inherited inner product; all volumes are their canonical intrinsic Euclidean volumes, including volume one in dimension zero. Δ is a discrete full lattice, b and c are the displayed actual bases, and the first block equality is assumed; no image discreteness, rational coordinate matrix or orthogonal integral splitting is assumed.
(Source: Horesh–Karasik 2023, Proposition B.4, published p.1290, projected last block; Appendix introduction pp.1284–1285.)
*Needs:* Mathlib `Module.Basis.ofZLatticeBasis`, `Submodule.ker_orthogonalProjectionOnto`, `Submodule.isCompl_orthogonal`, `ZSpan.discreteTopology_pi_basisFun`, `instIsZLatticeRealSpan`, `Module.Basis.restrictScalars`.
**Checks.**
- Projecting e₂ orthogonally off R(1,1) gives (−1/2,1/2), not (−1,1).
- Projection off the full ambient space sends every integral submodule to the zero submodule of the zero-dimensional complement.
- The projection of Z² off the diagonal is exactly the integral span of the projected e₂.

**0.2.3 Gram determinant factorization under orthogonal projection.** Prove `gram_det_adapted_projection`: Let b be a real basis of E indexed by Fin r disjoint-union Fin s and c a real basis of W indexed by Fin r, with b(inl i)=c_i in E. Then det Gram(b)=det Gram(c)·det Gram(j↦π(b(inr j))), where π:E→W-perp and each Gram matrix uses the intrinsic real inner product.
*Hypotheses.* E is a finite-dimensional real normed inner-product space. All subspaces carry the inherited inner product; all volumes are their canonical intrinsic Euclidean volumes, including volume one in dimension zero. The first block spans W and is a basis of W; r or s may be zero.
(Source: Horesh–Karasik 2023, Proposition B.4, published p.1290, block-triangular determinant proof.)
*Needs:* Mathlib `stdOrthonormalBasis`, `Module.Basis.prod`, `Submodule.prodEquivOfIsCompl`, `Submodule.isCompl_orthogonal`, `Matrix.det_fromBlocks_zero₂₁`, Mathlib `LinearMap.normDet_sq_eq_det_gram`.
**Checks.**
- The adapted columns (1,1),(0,1) give Gram determinant 1 = 2·(1/2).
- A sign-reversed coordinate basis has determinant −1 but Gram determinant 1.
- Empty Gram determinants multiply as 1 = 1·1.

**0.2.4 Gram determinants of biorthogonal bases.** Prove `gram_det_biorthogonal`: For real bases b,d of E indexed by Fin n satisfying inner(b_i,d_j)=δ_ij, det Gram(b)·det Gram(d)=1. This includes n=0 and does not say either basis is orthonormal.
*Hypotheses.* E is a finite-dimensional real normed inner-product space. All subspaces carry the inherited inner product; all volumes are their canonical intrinsic Euclidean volumes, including volume one in dimension zero. b and d are actual real bases, with the displayed mixed inner products.
(Source: Horesh–Karasik 2023, Corollary A.3, published p.1285, reciprocal Gram determinants; proof of A.1, p.1284, biorthogonality.)
*Needs:* Mathlib `stdOrthonormalBasis`, `OrthonormalBasis.sum_inner_mul_inner`, `Matrix.det_mul`, `Matrix.det_conjTranspose`, Mathlib `LinearMap.normDet_sq_eq_det_gram`.
**Checks.**
- The paired real bases 2 and 1/2 have Gram determinants 4 and 1/4.
- Gram matrices [[2,1],[1,1]] and [[1,−1],[−1,2]] have determinant product 1.
- Two copies of the basis vector 2 are not a biorthogonal pair: their Gram determinant product is 16, not 1.

**0.2.5 Dual of a projected integral submodule.** Prove `dual_projection_comap`: For any Z-submodule Δ of E and real subspace W, let π:E→W-perp be orthogonal projection. The intrinsic inner dual of π(Δ) equals the comap of the ambient inner dual Δ* along W-perp→E: (π(Δ))*=Δ*∩W-perp. Here every dual is the BilinForm.dualSubmodule with the real inner product. No discreteness, fullness or rationality is required for this equality of submodules.
*Hypotheses.* E is a finite-dimensional real normed inner-product space. All subspaces carry the inherited inner product; all volumes are their canonical intrinsic Euclidean volumes, including volume one in dimension zero. Dual means integer-valued pairing with every member of the submodule; the intrinsic dual is formed inside W-perp.
(Source: Horesh–Karasik 2023, Proposition B.5, published p.1291, corrected pairing proof.)
*Needs:* Mathlib `LinearMap.BilinForm.dualSubmodule`, `ZLattice.comap`, `Submodule.inner_orthogonalProjectionOnto_eq_of_mem_left`.
**Checks.**
- The integral span of any finite real orthonormal basis is self-dual for the integer-valued inner pairing.
- For Δ=2Z in R the dual is (1/2)Z, so an arbitrary ambient lattice cannot be substituted for its dual.
- The dual of the projected Z² lattice in the diagonal's orthogonal line is exactly Z² intersected with that line.

**0.2.6 Full orthogonal intersection in a self-dual lattice.** Prove `orthogonal_intersection_basis`: Under the full-lattice and rational-intersection hypotheses on Δ,W,L, assume Δ*=Δ for the real inner pairing. Then there exist s and a real basis q of W-perp indexed by Fin s such that span_Z(q)=Δ∩W-perp, with s=dim W-perp. Thus the primitive orthogonal intersection is a discrete full lattice in its intrinsic space.
*Hypotheses.* E is a finite-dimensional real normed inner-product space. All subspaces carry the inherited inner product; all volumes are their canonical intrinsic Euclidean volumes, including volume one in dimension zero. Δ is a discrete full Z-submodule of E. W is a real subspace. L is the comap of Δ along W→E; span_R(L)=W, written intrinsically as span_R(L in W)=top. P is the image of Δ under orthogonal projection E→W-perp. Ambient self-duality Δ*=Δ is required, not merely covolume one or integrality.
(Source: Horesh–Karasik 2023, Corollary A.2, p.1285, and Proposition B.5, p.1291.)
*Needs:* Mathlib `Module.Basis.ofZLatticeBasis`, `LinearMap.BilinForm.dualBasis`, `LinearMap.BilinForm.dualSubmodule_span_of_basis`, `ZSpan.discreteTopology_pi_basisFun`, `instIsZLatticeRealSpan`, 0.2 `saturated_adapted_basis`, 0.2 `projected_adapted_basis`, 0.2 `dual_projection_comap`.
**Checks.**
- The orthogonal intersection for the diagonal in Z² is the integral span of a real basis indexed by one element.
- The orthogonal intersection for the full plane has an empty real basis.
- The orthogonal intersection for the zero subspace in the plane has a two-element real basis.

**0.2.7 Complete a prescribed primitive-intersection basis.** Prove `saturated_adapted_basis_of_basis`: If W is a real subspace whose intersection with L spans W, every prescribed integral basis c:Fin r→(L∩W) extends to an integral basis b of L indexed by Fin r disjoint-union Fin s, with r+s=d and initial vectors exactly c_i in E.
*Hypotheses.* E is a finite-dimensional real normed inner-product space, L a discrete full Z-submodule, and d=dim_R E. Reuse IsZLattice, Basis and Basis.flag. The minimum index i:Fin d is zero-based; dimension zero has no index. L∩W means the lattice comap along W→E. The input c is a basis of this saturated intersection, not an independent family of nontrivial index.
(Source: Henk, *Successive minima and lattice points*, p.3, simultaneous integral-basis statement before (2.1).)
*Needs:* Mathlib `Module.Basis.constr`, `Module.Basis.equiv`, `Module.finrank_eq_card_basis`, `ZLattice.rank`, 0.2 `saturated_adapted_basis`.
**Checks.**
- The columns (1,1),(0,−1) have determinant −1, so orientation reversal is allowed.
- Every matrix with first column (2,0) has even determinant, hence cannot be an integral basis of Z².

**0.2.8 Integral basis adapted to a rational complete flag.** Prove `exists_integral_basis_same_flag`: For a real basis w:Fin d→E with w_i∈L, there is an integral basis b:Fin d→L whose real extension has exactly the same basis flags as w at every k=0,…,d.
*Hypotheses.* E is a finite-dimensional real normed inner-product space, L a discrete full Z-submodule, and d=dim_R E. Reuse IsZLattice, Basis and Basis.flag. The minimum index i:Fin d is zero-based; dimension zero has no index. Equality concerns real prefix spans, not equality of the vectors or their integral spans. The w_i need not be an integral basis.
(Source: Henk, *Successive minima and lattice points*, p.3, prefix-span equality and (2.1).)
*Needs:* Mathlib `Module.Basis.flag`, `Module.Basis.span`, `Module.Basis.ofZLatticeBasis`, `ZLattice.comap_discreteTopology`, `ZLattice.rank`, `Module.finrank_eq_card_basis`, 0.2 `saturated_adapted_basis_of_basis`.
**Checks.**
- The columns (1,1),(1,−1) have determinant −2: an independent integral-valued real basis is not necessarily an integral basis.
- For the standard real basis of R³, x lies in flag 2 exactly when x_2=0.

### 0.3 Covolumes of projections, duals and primitive intersections

*Standing hypotheses.* E is a finite-dimensional real normed inner-product space. All subspaces carry the inherited inner product; all volumes are their canonical intrinsic Euclidean volumes, including volume one in dimension zero.

**0.3.1 Covolume of a factor lattice.** Prove `covolume_projection`: Under the full-lattice and rational-intersection hypotheses on Δ,W,L, the projected lattice P=π(Δ) in W-perp satisfies covol(P)=covol(Δ)/covol(L), with canonical intrinsic Euclidean volumes. No unimodularity or self-duality of Δ is assumed.
*Hypotheses.* Δ is a discrete full Z-submodule of E. W is a real subspace. L is the comap of Δ along W→E; span_R(L)=W, written intrinsically as span_R(L in W)=top. P is the image of Δ under orthogonal projection E→W-perp.
(Source: Horesh–Karasik 2023, Proposition B.4, published p.1290.)
*Needs:* Mathlib `Module.Basis.ofZLatticeBasis`, `Module.Basis.restrictScalars`, `ZLattice.covolume_pos`, 0.2 `saturated_adapted_basis`, 0.2 `projected_adapted_basis`, 0.2 `gram_det_adapted_projection`, Tau Ceti `ZLattice.covolume_sq_eq_det_gram`.
**Checks.**
- The projected Z² lattice off the diagonal has intrinsic covolume 1/√2.
- The zero lattice in zero-dimensional Euclidean space has intrinsic covolume 1.
- For Δ=2Ze₁⊕3Ze₂ and L=2Ze₁ the projected covolume is 3=6/2, not 1/2.

**0.3.2 Reciprocal covolume of the inner dual.** Prove `covolume_dual`: For a discrete full Z-lattice L in a finite-dimensional real inner-product space E with canonical intrinsic Euclidean volume, covol(L*)=covol(L)^{-1}, where L* is the integer-valued inner dual in E. The full-lattice property of L* follows from the dual-basis and span-basis results and is not an additional assumption.
*Hypotheses.* L is discrete and spans E over R. A lower-rank lattice is first transported into its real span; its ambient polar is not used.
(Source: Horesh–Karasik 2023, Corollary A.3, published p.1285.)
This variant uses real covolumes of the inner dual, rather than rational Gram determinants, and includes dimension zero.
*Needs:* Mathlib `Module.Basis.ofZLatticeBasis`, `Module.Basis.ofZLatticeBasis_span`, `LinearMap.BilinForm.dualBasis`, `LinearMap.BilinForm.apply_dualBasis_right`, `LinearMap.BilinForm.dualSubmodule_span_of_basis`, `Module.Basis.restrictScalars`, `ZSpan.discreteTopology_pi_basisFun`, `instIsZLatticeRealSpan`, `ZLattice.covolume_pos`, 0.2 `gram_det_biorthogonal`, Tau Ceti `ZLattice.covolume_sq_eq_det_gram`.
**Checks.**
- The inner dual of 2Z in R has covolume 1/2.
- The standard integral lattice in Euclidean n-space has covolume one, including n=0.
- The ambient inner dual of the zero subgroup in R is all of R, not a discrete full lattice; a lower-rank lattice must be dualized inside its span.

**0.3.3 Equal covolumes of primitive orthogonal intersections.** Prove `primitive_orthogonal_covolume`: Let Δ be a discrete full self-dual lattice in E for the real inner pairing, and W a real subspace such that L=Δ∩W spans W. Then K=Δ∩W-perp is a full lattice in W-perp and covol(K)=covol(L), intrinsically. In particular, for rational W in R^n and Δ=Z^n, the primitive intersections W∩Z^n and W-perp∩Z^n have equal covolumes. This includes n=0, W=0 and W=E.
*Hypotheses.* Δ is a discrete full Z-submodule of E. W is a real subspace. L is the comap of Δ along W→E; span_R(L)=W, written intrinsically as span_R(L in W)=top. P is the image of Δ under orthogonal projection E→W-perp. Self-duality Δ*=Δ is explicit. For Z^n use the integral span of the standard orthonormal basis; rational W means its integral intersection spans it.
(Source: Horesh–Karasik 2023, Corollary B.6, published p.1291; Couveignes2020 p.493 uses its standard-lattice case.)
*Needs:* Mathlib `LinearMap.BilinForm.dualSubmodule_span_of_basis`, `LinearMap.BilinForm.dualBasis_eq_iff`, `OrthonormalBasis.inner_eq_ite`, `ZLattice.covolume_pos`, 0.2 `orthogonal_intersection_basis`, 0.2 `saturated_adapted_basis`, 0.2 `projected_adapted_basis`, 0.3 `covolume_projection`, 0.3 `covolume_dual`, 0.2 `dual_projection_comap`.
**Checks.**
- Both primitive diagonal and antidiagonal intersections in Z² have intrinsic covolume √2.
- Replacing the primitive generator (1,1) by (2,2) doubles its one-dimensional covolume while leaving its orthogonal line unchanged.
- The primitive diagonal and antidiagonal generators form an index-two sublattice, not an integral basis of Z².

### Examples

`ℤ(1,1)` in its own line has intrinsic covolume `√2` and Gram determinant `2`, while the ambient plane gives it volume `0`. For `W = ℝ(1,2) ⊂ ℝ²` and `Δ = ℤ²`, the intersections `W ∩ ℤ² = ℤ(1,2)` and `W^⊥ ∩ ℤ² = ℤ(2,−1)` both have covolume `√5`, as 0.3.3 predicts. The lattice `2ℤ ⊕ 3ℤ` has covolume `6` and inner dual `½ℤ ⊕ ⅓ℤ` of covolume `1/6`. The empty family in the zero space has Gram determinant `1` and the zero lattice has covolume `1`.

### Dependencies

Mathlib only: `ZLattice.covolume` and `covolume_eq_det_mul_measureReal`, `Matrix.gram`, `InnerProductSpace.gramSchmidtOrthonormalBasis`, `Submodule.exists_smith_normal_form_of_le`, `LinearMap.BilinForm.dualSubmodule` and the orthogonal-projection API.

## Layer 1: Convex bodies, successive minima and Minkowski’s theorems

This layer defines the successive minima `λ_i(L, K)` of a convex body `K` with `0` in its interior with respect to a discrete full lattice `L`, as real numbers indexed by `Fin d` with `d = dim E`, and proves both halves of Minkowski’s second theorem in their sharp form, Minkowski’s linear forms theorem with its boundary convention, and the elementary ordered-product and ball-volume bounds that the counting arguments of Layer 4 use. The lower inequality is the weighted cross-polytope argument; the upper inequality follows Henk’s short proof through volumes of unions of translates of `½K` along a flag of coordinate boxes (1.5). The minima are defined on the carriers `IsZLattice` and `ConvexBody`; the symmetric hypothesis is imposed only where the statement needs it.

### 1.1 Elementary product and volume bounds

**1.1.1 Ordered tail product inequality.** Prove `ordered_tail_product`: For monotone a:Fin n→R with a_j≥1, every i:Fin n satisfies a_i^(n−i.val)≤∏j a_j.
*Hypotheses.* Indices are zero-based; tail length n−i.val is strictly positive. The lower bound 1 and monotonicity are both load-bearing.
(Source: Couveignes, *Enumerating number fields*, §3, printed p.494 (physical PDF p.8), ordered norms and intrinsic closed-ball volume.)
**Checks.**
- For (1,2,4), the three left sides are 1,4,4 and total product is 8.
- Dropping a_j≥1 fails for (1/2,2): final term 2 exceeds total product 1.
- Dropping ordering fails for (4,1): first square 16 exceeds product 4.

**1.1.2 Ordered-product root bound.** Prove `ordered_product_root_bound`: If a:Fin n→R is monotone, a_j≥1, and ∏j a_j≤V, then a_i≤V^(1/(n−i.val)) for every i:Fin n, using Real.rpow.
*Hypotheses.* V≥1 follows from the hypotheses; no negative-base root. n−i.val>0 follows from i:Fin n; n=0 has no requested index.
(Source: Couveignes, *Enumerating number fields*, §3, printed p.494 (physical PDF p.8), ordered norms and intrinsic closed-ball volume.)
*Needs:* Mathlib `Real.le_rpow_inv_iff_of_pos`, 1.1 `ordered_tail_product`.
**Checks.**
- All terms 1 and V=1 give equality.
- For (1,2,4),V=8, the final bound has exponent 1, not 1/0.
- For (2,2),V=4, the first bound 2≤√4 is exact.

**1.1.3 Intrinsic volume of an orthonormal cube.** Prove `orthonormal_cube_volume`: For a full real orthonormal basis b:Fin n→E and r≥0, volume_E{x : every |(b.repr x)_i|≤r}=ENNReal.ofReal((2r)^n).
*Hypotheses.* E finite-dimensional with Borel structure and canonical volume. n=0 and r=0 allowed; no new cube type.
(Source: Couveignes, *Enumerating number fields*, §3, printed p.494 (physical PDF p.8), ordered norms and intrinsic closed-ball volume.)
*Needs:* Mathlib `OrthonormalBasis.measurePreserving_repr`, `PiLp.volume_preserving_ofLp`, `Real.volume_Icc_pi`.
**Checks.**
- n=0,r=0 gives volume 1.
- n=1,r=0 gives volume 0.
- n=2,r=3 gives 36, not 9: r is half-side length.

**1.1.4 A cube inside the Euclidean unit ball.** Prove `inscribed_cube`: For a real orthonormal basis b:Fin n→E and n>0, the coordinate cube |(b.repr x)_i|≤1/√n is contained in closedBall_E(0,1).
*Hypotheses.* The norm is Euclidean and b orthonormal; a general algebraic basis is insufficient. The normalized radius requires n>0.
(Source: Couveignes, *Enumerating number fields*, §3, printed p.494 (physical PDF p.8), ordered norms and intrinsic closed-ball volume.)
*Needs:* Mathlib `EuclideanSpace.real_norm_sq_eq`.
**Checks.**
- n=1 gives [−1,1], whose endpoints have norm 1.
- n=4 gives half-side 1/2; the vertex with all four coordinates 1/2 has squared norm 1.
- Half-side 1 fails for n=2 at (1,1).

**1.1.5 Intrinsic Euclidean ball lower bound.** Prove `intrinsic_ball_lower_bound`: For a finite-dimensional real inner-product space E with an orthonormal basis indexed by Fin n and n>0, ENNReal.ofReal((2/√n)^n)≤volume_E(closedBall_E(0,1)). The real lower constant equals 2^n·n^(−n/2).
*Hypotheses.* Intrinsic volume on E; for a proper subspace of R^M instantiate E with the subspace. This is a closed ball, not its boundary sphere. Dimension zero has unit volume and is separate from division by √0.
(Source: Couveignes, *Enumerating number fields*, §3, printed p.494 (physical PDF p.8), ordered norms and intrinsic closed-ball volume.)
*Needs:* 1.1 `orthonormal_cube_volume`, 1.1 `inscribed_cube`.
**Checks.**
- n=1 gives exact lower bound 2.
- n=4 gives lower constant 1.
- n=2 gives lower constant 2, not 4; ambient volume of a ball in a proper subspace is zero and cannot satisfy this intrinsic estimate.

### 1.2 Successive minima

*Standing hypotheses.* E is a finite-dimensional real normed vector space; L is a discrete full Z-submodule (the IsZLattice carrier). K is an ConvexBody E with 0 in its interior. No replacement gauge or lattice carrier is introduced. Write d=finrank_R E. An index i:Fin d means the source’s (i.val+1)-st minimum. There is no minimum to evaluate when d=0. Symmetry is assumed only in statements that need it.

**1.2.1 Successive minima on the lattice and convex body.** Define `successiveMin_def`: For a Z-submodule L of a finite-dimensional real normed space E, K:ConvexBody E and i:Fin d, define λ_i(L,K) as the real infimum of A_i={r∈R : 0≤r and i.val+1≤dim_R span_R{x∈L : gauge K x≤r}}. This is a real-valued function on carriers. Its geometric laws require L discrete and full and 0∈interior K; central symmetry is needed for Minkowski’s product inequality.
*API.* `successiveMin_def` (characterisation: λ_i is the infimum of the nonnegative gauge-rank thresholds A_i specified in the definition.); `successiveMin_isLeast` (relation: For every i:Fin d, λ_i(L,K) is the least element of A_i={r≥0 : dim span_R{x∈L : gauge K x≤r}≥i.val+1}.); `successiveMin_pos` (relation: For every i:Fin d, 0<λ_i(L,K).); `successiveMin_monotone` (relation: The function i↦λ_i(L,K), on Fin d, is monotone.); `successiveMin_le_iff` (relation: For r≥0, λ_i(L,K)≤r if and only if i.val+1≤dim_R span_R((L:Set E)∩r·(K:Set E)).); `exists_successiveMin_witnesses` (relation: There exists a real basis b indexed by Fin d such that b_i∈L, gauge K b_i=λ_i(L,K), and every x∈L of gauge<λ_i lies in span_R{b_j:j<i}. In particular b_i∈λ_iK and all minimum bounds are attained by one independent family.); `successiveMin_antitone_body` (relation: If K⊆K' and both bodies contain zero in their interior, then λ_i(L,K')≤λ_i(L,K) for every i.); `successiveMin_monotone_lattice` (relation: If L≤M are discrete full lattices in the same E, then λ_i(M,K)≤λ_i(L,K).); `successiveMin_smul_body` (relation: For c>0, λ_i(L,cK)=λ_i(L,K)/c. The scalar action on ConvexBody is the one.); `successiveMin_linearEquiv` (relation: Let e:E≃_R F, L'=e(L) as integral submodules, and K'=e(K) as convex bodies. For valid indices i,j with i.val=j.val, λ_j(L',K')=λ_i(L,K). Finite-dimensional normed real E,F and the discrete/full/interior hypotheses are understood. The equivalence need not be orthogonal or unimodular.); `successiveMin_first_le_iff` (relation: If d>0 and r≥0, λ_0(L,K)≤r if and only if there exists x∈L with x≠0 and x∈rK.); `successiveMin_box` (relation: Let b be a real basis of E indexed by Fin d, L=span_Z(range b), and a:Fin d→R positive and nondecreasing. If K is the convex body {x:∀j, a_j|b.repr(x)_j|≤1}, then λ_i(L,K)=a_i for every i.); `successiveMin_crosspolytope` (relation: With b,L and positive nondecreasing a as for rectangular-body-minima, let K={x:Σ_j a_j|b.repr(x)_j|≤1}. Then λ_i(L,K)=a_i. Together with weighted-crosspolytope-volume, this attains equality in minkowski-second-lower.).
(Source: Evertse, *Geometry of numbers*, §2.3, Lemma 2.8, printed pp.23–24 (physical pp.13–14).)
This variant takes any convex body with `0` in its interior and is real-valued; for the Euclidean ball it agrees with squared-length minima after a square root.
*Needs:* Mathlib `ConvexBody`, `gauge`, `finrank_span_eq_card`, `gauge_closedBall`.
**Checks.**
- For L=Z⊂R and K=[−2,2], λ_0(L,K)=1/2.
- For L=Z² and K={|x_0|≤1/2, |x_1|≤1/3}, (λ_0,λ_1)=(2,3).
- For the zero lattice in R^0 and its singleton convex body, the product over all minima indices is 1.
- For L=2Z in R and K=[−1,1], λ_0=2, not 1.
- On K=closedBall(0,1), the defining rank condition is dim span{x∈L : norm x≤r}≥i.val+1.
- In Z² with the unit square, vectors (1,1),(1,−1) independently attain both minima 1 but their integral span has index two.
- In Z and K=[−1,1], the attained minimum 1 has nonzero boundary witnesses; the strict sublevel {x∈Z : gauge K x<1} is {0}.
- For a lattice that is not full (`ℤ(1,0)` in `ℝ²`) the minima beyond the rank are the junk value `0` of `sInf ∅`; this is why every law of 1.2 assumes `IsZLattice ℝ L`.

**1.2.2 Finite lattice points below a gauge bound.** Prove `finite_gauge_sublevel`: For every real R, the set {x∈L : gauge K x≤R} is finite.
(Source: Evertse, *Geometry of numbers*, §2.3, Lemma 2.8, printed pp.23–24 (physical pp.13–14).)
*Needs:* Mathlib `gauge_nonneg`, `gauge_eq_zero`, `gauge_smul_of_nonneg`, `gauge_le_one_iff_mem_closure`, `ConvexBody.isClosed`, `ConvexBody.isCompact`, `ZSpan.setFinite_inter`, `Module.Basis.ofZLatticeBasis`, `Module.Basis.ofZLatticeBasis_span`, `absorbent_nhds_zero`, `IsCompact.isVonNBounded`.
**Checks.**
- Negative bound gives the empty set.
- Bound zero gives precisely the zero lattice vector.
- For Z² and the unit square, bound 2 gives 25 points.

**1.2.3 An attained least gauge outside a proper subspace.** Prove `exists_min_gauge_outside`: If W<E is a proper real subspace, there is v∈L∖W with gauge K v≤gauge K x for every x∈L∖W. In particular the selected gauge is positive.
(Source: Evertse, *Geometry of numbers*, §2.3, Lemma 2.8, printed pp.23–24 (physical pp.13–14).)
*Needs:* Mathlib `IsZLattice`, `Set.exists_min_image`, `gauge_pos`, `absorbent_nhds_zero`, `ConvexBody.isCompact`, `IsCompact.isVonNBounded`, 1.2 `finite_gauge_sublevel`.
**Checks.**
- For Z², the rectangle with minima 2,3, and W=Re_0, the least outside gauge is 3.
- W=top is excluded because the complement is empty.

**1.2.4 A greedy independent family with a strict-sublevel flag.** Prove `exists_greedy_gauge_family`: There is a real-linearly-independent family v:Fin d→L such that a_i=gauge K v_i is positive and nondecreasing, and every x∈L with gauge K x<a_i lies in span_R{v_j:j<i}. The family has d members and thus spans E over R. No integral-basis claim is made.
(Source: Evertse, *Geometry of numbers*, §2.3, Lemma 2.8, printed pp.23–24 (physical pp.13–14).)
*Needs:* Mathlib `linearIndependent_finSucc'`, `finrank_span_eq_card`, `basisOfLinearIndependentOfCardEqFinrank'`, 1.2 `exists_min_gauge_outside`.
**Checks.**
- Repeated minima are allowed: the unit square has both values 1.
- Strict inequality in the flag is essential: e_0 has gauge equal to the first minimum and does not lie in the zero prefix.

**1.2.5 Attainment of the rank threshold.** Prove `successiveMin_isLeast`: For every i:Fin d, λ_i(L,K) is the least element of A_i={r≥0 : dim span_R{x∈L : gauge K x≤r}≥i.val+1}.
(Source: Evertse, *Geometry of numbers*, §2.3, Lemma 2.8, printed pp.23–24 (physical pp.13–14).)
*Needs:* Mathlib `Submodule.finrank_mono`, `finrank_span_eq_card`, `Real.sInf_nonneg`, 1.2 `successiveMin_def`, 1.2 `exists_greedy_gauge_family`.
**Checks.**
- A_i contains its endpoint; replacing ≤ by < in the membership assertion is false.
- For the rectangle 2,3 the rank jumps from zero to one at 2 and from one to two at 3.

**1.2.6 Positivity of each successive minimum.** Prove `successiveMin_pos`: For every i:Fin d, 0<λ_i(L,K).
(Source: Evertse, *Geometry of numbers*, §2.3, Lemma 2.8, printed pp.23–24 (physical pp.13–14).)
*Needs:* 1.2 `successiveMin_isLeast`, 1.2 `exists_greedy_gauge_family`.
**Checks.**
- For (1/2)Z and the unit interval the minimum is 1/2: positivity does not imply a lower bound of 1.

**1.2.7 Ordering of successive minima.** Prove `successiveMin_monotone`: The function i↦λ_i(L,K), on Fin d, is monotone.
(Source: Evertse, *Geometry of numbers*, §2.3, Lemma 2.8, printed pp.23–24 (physical pp.13–14).)
*Needs:* 1.2 `successiveMin_isLeast`.
**Checks.**
- The unit cube has a constant sequence of minima; strict monotonicity is false.

**1.2.8 Closed-dilate rank characterization.** Prove `successiveMin_le_iff`: For r≥0, λ_i(L,K)≤r if and only if i.val+1≤dim_R span_R((L:Set E)∩r·(K:Set E)).
(Source: Evertse, *Geometry of numbers*, §2.3, Lemma 2.8, printed pp.23–24 (physical pp.13–14).)
*Needs:* Mathlib `gauge_eq_zero`, `gauge_smul_of_nonneg`, `gauge_le_one_iff_mem_closure`, `Submodule.finrank_mono`, `absorbent_nhds_zero`, `ConvexBody.isCompact`, `IsCompact.isVonNBounded`, 1.2 `successiveMin_isLeast`.
**Checks.**
- At r=0 the right side is false for every valid index.
- At r=λ_i the threshold holds.

**1.2.9 Simultaneously attained independent minimum vectors.** Prove `exists_successiveMin_witnesses`: There exists a real basis b indexed by Fin d such that b_i∈L, gauge K b_i=λ_i(L,K), and every x∈L of gauge<λ_i lies in span_R{b_j:j<i}. In particular b_i∈λ_iK and all minimum bounds are attained by one independent family.
(Source: Evertse, *Geometry of numbers*, §2.3, Lemma 2.8, printed pp.23–24 (physical pp.13–14).)
*Needs:* Mathlib `basisOfLinearIndependentOfCardEqFinrank'`, `gauge_le_one_iff_mem_closure`, `gauge_smul_of_nonneg`, `absorbent_nhds_zero`, 1.2 `exists_greedy_gauge_family`, 1.2 `successiveMin_isLeast`, 1.2 `successiveMin_pos`.
**Checks.**
- The unit-square diagonal pair has determinant −2 and attains both minima, so attainment alone does not certify an integral basis.
- The zero-dimensional family is an empty real basis and has no minimum value to evaluate.

**1.2.10 Larger bodies have smaller minima.** Prove `successiveMin_antitone_body`: If K⊆K' and both bodies contain zero in their interior, then λ_i(L,K')≤λ_i(L,K) for every i.
(Source: direct body-monotonicity deduction from the threshold definition in Evertse §2.3, printed p.23.)
*Needs:* Mathlib `Submodule.finrank_mono`, 1.2 `successiveMin_le_iff`, 1.2 `successiveMin_pos`.
**Checks.**
- Changing [−1,1] to [−2,2] divides the only minimum by two.

**1.2.11 Sublattices have larger minima.** Prove `successiveMin_monotone_lattice`: If L≤M are discrete full lattices in the same E, then λ_i(M,K)≤λ_i(L,K).
(Source: deduction from the threshold definition in Evertse §2.3, printed p.23; Lemma 2.8, pp.23–24, supplies attainment, rather than stating lattice monotonicity.)
*Needs:* Mathlib `Submodule.finrank_mono`, 1.2 `successiveMin_le_iff`, 1.2 `successiveMin_pos`.
**Checks.**
- 2Z⊂Z gives minima 2 and 1 for the unit interval.

**1.2.12 Positive body scaling inverts the minima.** Prove `successiveMin_smul_body`: For c>0, λ_i(L,cK)=λ_i(L,K)/c. The scalar action on ConvexBody is the one.
(Source: Evertse, *Geometry of numbers*, §2.3, Lemma 2.8, printed pp.23–24 (physical pp.13–14).)
*Needs:* Mathlib `gauge_smul_left_of_nonneg`, `ConvexBody.coe_smul`, 1.2 `successiveMin_isLeast`.
**Checks.**
- Scaling the unit interval by 3 changes its minimum from 1 to 1/3.

**1.2.13 Invariance under a simultaneous linear change.** Prove `successiveMin_linearEquiv`: Let e:E≃_R F, L'=e(L) as integral submodules, and K'=e(K) as convex bodies. For valid indices i,j with i.val=j.val, λ_j(L',K')=λ_i(L,K). Finite-dimensional normed real E,F and the discrete/full/interior hypotheses are understood. The equivalence need not be orthogonal or unimodular.
(Source: Evertse, *Geometry of numbers*, §2.3, change-of-coordinates remark after Theorem 2.9, printed pp.24–25 (physical pp.14–15); corrected nonsingularity hypothesis in sourceIssue E11.)
*Needs:* Mathlib `LinearEquiv.finrank_eq`, 1.2 `successiveMin_le_iff`, 1.2 `successiveMin_pos`.
**Checks.**
- Scaling both Z and [−1,1] by 2 preserves minimum 1; scaling only the lattice gives 2.
- A shear acts simultaneously on the standard lattice and unit square without changing their two minima.

**1.2.14 The first minimum detects a nonzero lattice point.** Prove `successiveMin_first_le_iff`: If d>0 and r≥0, λ_0(L,K)≤r if and only if there exists x∈L with x≠0 and x∈rK.
(Source: Evertse, *Geometry of numbers*, §2.3, definition and Lemma 2.8, pp.23–24; Henk p.2 before Theorem 1.2.)
*Needs:* Mathlib `finrank_span_eq_card`, `Submodule.finrank_mono`, 1.2 `successiveMin_le_iff`.
**Checks.**
- For Z and the unit interval, r=1 has witnesses ±1, while every 0≤r<1 has none.

**1.2.15 Integral basis for the strict minimum flag.** Prove `exists_integral_minimum_flag`: There is an integral basis b:Fin d→L such that x∈L and gauge_K(x)<λ_i imply x belongs to the real flag of b at i, the span of its first i vectors.
*Hypotheses.* E is a finite-dimensional real normed inner-product space, L a discrete full Z-submodule, and d=dim_R E. Reuse IsZLattice, Basis and Basis.flag. The minimum index i:Fin d is zero-based; dimension zero has no index. K is a ConvexBody with zero in its interior. Write λ_i=successiveMin L K i. Symmetry is imposed only on the final counting theorem. No bound on the individual gauges of b_i is claimed; only the attained real basis's flag is preserved.
(Source: Henk, *Successive minima and lattice points*, pp.3–4, (2.1)–(2.3).)
*Needs:* Mathlib `Module.Basis.flag`, 1.2 `exists_successiveMin_witnesses`, 0.2 `exists_integral_basis_same_flag`.
**Checks.**
- The nonzero constant vector in R² does not belong to flag zero; equality at the first minimum is not a strict sublevel.
- The empty standard basis of R⁰ has flag zero equal to the entire zero space.

### 1.3 Minkowski’s lower inequality and its sharpness

**1.3.1 Volume of a weighted cross-polytope in basis coordinates.** Prove `weighted_crosspolytope_volume`: Let E be a finite-dimensional real inner-product space with canonical volume, o an orthonormal basis and b any real basis, both indexed by Fin n. For positive a_i, volume{x:Σ_i a_i·|b.repr(x)_i|≤1}=ofReal((2^n/n!)·|det_o(b)|/∏_i a_i). Dimension zero is included.
*Hypotheses.* E has the canonical inner-product volume; o is orthonormal and b is a basis, not an arbitrary dependent family. Each a_i>0. n can be zero.
(Source: Evertse, *Geometry of numbers*, §2.3, proof of the lower bound in Theorem 2.9, printed p.27 (physical p.17).)
*Needs:* Mathlib `MeasureTheory.volume_sum_rpow_le`, `Real.Gamma_nat_eq_factorial`, `MeasureTheory.Measure.addHaar_image_linearMap`, `OrthonormalBasis.measurePreserving_repr`, `PiLp.volume_preserving_ofLp`, `Matrix.det_mul`, `volume_euclideanSpace_eq_dirac`, `Matrix.det_diagonal`.
**Checks.**
- n=0 gives volume one.
- With the standard basis and a=(2,3), the planar diamond has area 1/3.
- Replacing the basis by (2e_0,3e_1), with a=(1,1), gives area 12.

**1.3.2 A symmetric body contains its weighted inscribed cross-polytope.** Prove `weighted_crosspolytope_subset`: Let K be symmetric about zero with zero in its interior. For a real basis b and positive a_i, if b_i∈a_iK for every i, then {x:Σ_i a_i|b.repr(x)_i|≤1}⊆K.
*Hypotheses.* K:ConvexBody E, 0∈interior K and x∈K implies −x∈K. b is a finite real basis. All a_i are positive. The containment is independent of any lattice or volume normalization.
(Source: Evertse, *Geometry of numbers*, §2.3, Lemma 2.10 and lower-bound proof, printed pp.26–27 (physical pp.16–17).)
*Needs:* Mathlib `gauge_le_of_mem`, `gauge_sum_le`, `gauge_neg`, `gauge_smul_of_nonneg`, `gauge_le_one_iff_mem_closure`, `absorbent_nhds_zero`.
**Checks.**
- The diamond with vertices ±e_0,±e_1 is contained in the unit square.
- Without symmetry, containing b_i/a_i does not imply containing its negative.

**1.3.3 An independent lattice family has determinant at least the covolume.** Prove `covolume_le_abs_basis_det`: In a finite-dimensional real inner-product space with canonical volume, let L be a discrete full lattice, o an orthonormal basis and b a real basis with every b_i∈L. Then covolume(L)≤|det_o(b)|.
*Hypotheses.* Both bases have the full ambient rank, including rank zero. L is discrete and full. The measure is intrinsic canonical Euclidean volume.
(Source: Evertse, *Geometry of numbers*, §2.3, lower-bound proof, printed p.27 (physical p.17).)
*Needs:* Mathlib `ZLattice.covolume_div_covolume_eq_relIndex'`, `ZLattice.covolume_eq_det_mul_measureReal`, `ZLattice.covolume_pos`, `ZSpan.fundamentalDomain_ae_parallelepiped`, `OrthonormalBasis.volume_parallelepiped`, `instIsZLatticeRealSpan`, `Module.Basis.restrictScalars`.
**Checks.**
- The diagonal and antidiagonal vectors in Z² have absolute determinant 2≥1.
- For 2Ze_0⊕3Ze_1 the basis determinant and covolume are both 6.

**1.3.4 Minkowski’s sharp lower product inequality.** Prove `minkowski_second_lower`: For a discrete full lattice L in a finite-dimensional real inner-product space E and a symmetric convex body K with zero in its interior, (2^d/d!)·covolume(L)≤(∏_{i:Fin d}λ_i(L,K))·volume.real(K). Here d=finrank_R E and volume is intrinsic canonical Euclidean volume. The formula holds also for d=0.
*Hypotheses.* E is a finite-dimensional real inner-product space with Borel structure and canonical volume. L is a discrete full integral submodule. K is compact convex, centrally symmetric about zero, and has zero in its interior. A lower-rank lattice is first considered as a full lattice in its real span with that span’s own volume. No ambient-volume inequality for a measure-zero subspace is claimed.
(Source: Evertse, *Geometry of numbers*, §2.3, Theorem 2.9 and its complete lower-bound proof, printed pp.24,26–27.)
*Needs:* Mathlib `ConvexBody.isCompact`, `volume_euclideanSpace_eq_dirac`, 1.2 `exists_successiveMin_witnesses`, 1.2 `successiveMin_pos`, 1.3 `weighted_crosspolytope_volume`, 1.3 `weighted_crosspolytope_subset`, 1.3 `covolume_le_abs_basis_det`.
**Checks.**
- For Z² and the unit diamond, product 1 times area 2 equals 2²/2!.
- For Z² and the unit square, product 1 times area 4 is strictly larger than 2.
- For 2Z and [−3,3], minimum 2/3 times length 6 equals 4=(2/1!)·2.
- For dimension zero both sides are 1.

**1.3.5 All prescribed minima of a coordinate box.** Prove `successiveMin_box`: Let b be a real basis of E indexed by Fin d, L=span_Z(range b), and a:Fin d→R positive and nondecreasing. If K is the convex body {x:∀j, a_j|b.repr(x)_j|≤1}, then λ_i(L,K)=a_i for every i.
*Hypotheses.* b:Basis (Fin d) R E where d=finrank_R E. L is exactly its integral span. All a_i>0 and a is monotone. The stated set is the carrier of K.
(Source: Evertse, *Geometry of numbers*, §2.3, Example 2, printed pp.25–26 (physical pp.15–16).)
*Needs:* Mathlib `finrank_span_eq_card`, `Submodule.finrank_mono`, 1.2 `successiveMin_le_iff`, 1.2 `successiveMin_pos`.
**Checks.**
- a=(2,3) gives minima 2,3.
- a=(1,1,4) gives a repeated first value; the two shortest lattice vectors may be opposites and still fail to be independent.

**1.3.6 Sharpness via prescribed cross-polytope minima.** Prove `successiveMin_crosspolytope`: With b,L and positive nondecreasing a as for rectangular-body-minima, let K={x:Σ_j a_j|b.repr(x)_j|≤1}. Then λ_i(L,K)=a_i. Together with weighted-crosspolytope-volume, this attains equality in minkowski-second-lower.
*Hypotheses.* b:Basis (Fin d) R E where d=finrank_R E. L is exactly its integral span. All a_i>0 and a is monotone. The weighted l1 set is the carrier of K.
(Source: Evertse, *Geometry of numbers*, §2.3, Example 3 and Exercise 2.9, printed p.26 (physical p.16).)
*Needs:* Mathlib `finrank_span_eq_card`, `Submodule.finrank_mono`, `ZLattice.covolume_eq_det_mul_measureReal`, 1.2 `successiveMin_le_iff`, 1.2 `successiveMin_pos`, 1.3 `weighted_crosspolytope_volume`.
**Checks.**
- a=(2,3), b standard in R² gives minima 2,3 and area 1/3, so the product-volume is 2.
- Empty dimension has no minimum index and still attains the volume-product equality 1.

### 1.4 Minkowski’s linear forms theorem

**1.4.1 Volume of a closed linear-forms parallelepiped.** Prove `linear_forms_box_volume`: For n≥0, an invertible real n×n matrix A and positive a_i, the set C={x∈R^n:∀i, |(Ax)_i|≤a_i} has volume ofReal(2^n·(∏a_i)/|det A|).
*Hypotheses.* The matrix is square and det A≠0; all a_i>0. Lebesgue measure is the product volume on Fin n→R. n=0 is allowed for this volume identity.
(Source: Evertse, *Geometry of numbers*, §2.2, Corollary 2.6, printed p.20 (physical p.10).)
*Needs:* Mathlib `LinearMap.det_toLin'`, `LinearMap.equivOfDetNeZero`, `MeasureTheory.Measure.addHaar_preimage_linearMap`, `Real.volume_Icc_pi`.
**Checks.**
- For n=1, A=(−2) and a=3 the set is [−3/2,3/2] of length 3.
- For A=diag(2,3), a=(2,3), the region is the unit square of area 4.
- For n=0 the determinant, coordinate product and volume are one.

**1.4.2 Minkowski’s boundary linear-forms theorem.** Prove `minkowski_linear_forms`: For n≥1, an invertible real n×n matrix A and positive a_i with ∏a_i≥|det A|, there exists z∈Z^n, z≠0, with |Σ_j A_ij z_j|≤a_i for every i. Every coordinate inequality is non-strict, including at equality in the determinant bound.
*Hypotheses.* n≥1, A:Matrix(Fin n,Fin n,R), det A≠0, all a_i>0, and ∏a_i≥|det A|. No rationality of the matrix entries is required.
(Source: Evertse, *Geometry of numbers*, §2.2, Corollary 2.6 and complete proof, printed p.20 (physical p.10).)
*Needs:* Mathlib `MeasureTheory.exists_ne_zero_mem_lattice_of_measure_mul_two_pow_le_measure`, `ZSpan.isAddFundamentalDomain'`, `ZSpan.volume_fundamentalDomain`, `instIsZLatticeRealSpan`, 1.4 `linear_forms_box_volume`.
**Checks.**
- For n=1, A=(2), a=2, z=1 is a boundary witness; replacing ≤ with < would eliminate every nonzero integer witness.
- A determinant of −2 has the same threshold as 2.
- n=0 is excluded: its only integer vector is zero despite the empty-product determinant inequality.

### 1.5 Minkowski’s upper inequality

**1.5.1 Volume of interior-disjoint convex translates.** Prove `finite_interior_disjoint_translate_volume`: Let K⊆E be compact and convex, and v:I→E a finite family. If v_i+int(K) and v_j+int(K) are disjoint whenever i≠j, then μ(⋃_i(v_i+K))=|I|·μ(K). Equality is in the nonnegative extended reals.
*Hypotheses.* E is finite-dimensional real normed with Borel structure; μ is an additive Haar measure. No symmetry, origin condition or positive-dimensional interior of K is required. The index type may be empty. Repeated translation vectors are not silently deduplicated; the stated interior-disjointness hypothesis controls when the cardinal factor is valid.
(Source: Henk, *Successive minima and lattice points*, p.5 (3.2), and p.6 the two volume factorizations after (3.4).)
*Needs:* Mathlib `Convex.addHaar_frontier`, `Convex.translate`, `Homeomorph.image_interior`, `IsCompact.image`, `IsCompact.isClosed`, `IsClosed.measurableSet`, `MeasureTheory.measure_iUnion₀`, `MeasureTheory.measure_preimage_mul_right`.
**Checks.**
- The closed intervals [0,1] and [1,2] have union of real volume 2 despite sharing an endpoint.
- Two copies of [0,1] have union volume 1, not 2; their interiors are not disjoint.

**1.5.2 Sections of a finite translated union.** Prove `finite_translate_section`: For every K⊆E×F, y∈F and finite v:I→E, {x:(x,y)∈U_v(K)}=⋃_i(v_i+{x:(x,y)∈K}).
*Hypotheses.* E and F are finite-dimensional real normed vector spaces with their Borel measurable structures; μ and ν are additive Haar measures on E and F. Use their product measure μ×ν. The spaces may have dimension zero. For a finite indexing type I and v:I→E, write U_v(K)=⋃_{i∈I}{(v_i+x,y):(x,y)∈K}. Write f₁,r(x,y)=(rx,y), f₂,r(x,y)=(x,ry). These are ordinary finite unions and linear maps, not new constructors or carrier types.
(Source: Henk, *Successive minima and lattice points*, p.6, the section inclusion between (3.6) and the successive integrations.)
**Checks.**
- The union of translates of [0,1] indexed by Fin 0 is the empty real set.

**1.5.3 Translation containment of an enlarged convex section.** Prove `convex_section_enlargement`: If K⊆E×F is convex and r≥1, then for every y∈F there exists t∈E such that {x:(x,y)∈U_v(K)}⊆t+{x:(x,y)∈U_v(f₁,r(K))}.
*Hypotheses.* E and F are finite-dimensional real normed vector spaces with their Borel measurable structures; μ and ν are additive Haar measures on E and F. Use their product measure μ×ν. The spaces may have dimension zero. For a finite indexing type I and v:I→E, write U_v(K)=⋃_{i∈I}{(v_i+x,y):(x,y)∈K}. Write f₁,r(x,y)=(rx,y), f₂,r(x,y)=(x,ry). These are ordinary finite unions and linear maps, not new constructors or carrier types.
(Source: Henk, *Successive minima and lattice points*, p.6, pointwise t(x) inclusion immediately after (3.6).)
*Needs:* Mathlib `Convex.add_smul_sub_mem`, 1.5 `finite_translate_section`.
**Checks.**
- [2,3]⊆[4,6]−2, using a=2 and r=2.
- [2,3] is not a subset of its dilation [4,6] about zero; the translation cannot be omitted.
- There is no real t with {0,1,3}⊆{0,2,6}+t; arbitrary nonconvex sections do not satisfy the containment.

**1.5.4 Section-volume monotonicity under partial dilation.** Prove `section_union_volume_mono`: For convex K⊆E×F, r≥1 and every y∈F, μ{x:(x,y)∈U_v(K)}≤μ{x:(x,y)∈U_v(f₁,r(K))}.
*Hypotheses.* E and F are finite-dimensional real normed vector spaces with their Borel measurable structures; μ and ν are additive Haar measures on E and F. Use their product measure μ×ν. The spaces may have dimension zero. For a finite indexing type I and v:I→E, write U_v(K)=⋃_{i∈I}{(v_i+x,y):(x,y)∈K}. Write f₁,r(x,y)=(rx,y), f₂,r(x,y)=(x,ry). These are ordinary finite unions and linear maps, not new constructors or carrier types.
(Source: Henk, *Successive minima and lattice points*, p.6, the inequality between section-volume integrals.)
*Needs:* Mathlib `MeasureTheory.measure_preimage_mul_right`, 1.5 `convex_section_enlargement`.
**Checks.**
- At r=1, f₁,r(K)=K for every subset of ℝ×ℝ, so every section inequality is equality.

**1.5.5 Volume monotonicity of partially dilated unions.** Prove `partial_dilation_union_volume`: For compact convex K⊆E×F, finite v:I→E and r≥1, (μ×ν)(U_v(K))≤(μ×ν)(U_v(f₁,r(K))).
*Hypotheses.* E and F are finite-dimensional real normed vector spaces with their Borel measurable structures; μ and ν are additive Haar measures on E and F. Use their product measure μ×ν. The spaces may have dimension zero. For a finite indexing type I and v:I→E, write U_v(K)=⋃_{i∈I}{(v_i+x,y):(x,y)∈K}. Write f₁,r(x,y)=(rx,y), f₂,r(x,y)=(x,ry). These are ordinary finite unions and linear maps, not new constructors or carrier types.
(Source: Henk, *Successive minima and lattice points*, p.6 (3.6) and the three-line successive-integration argument ending on p.7.)
*Needs:* Mathlib `IsCompact.image`, `isCompact_iUnion`, `IsCompact.isClosed`, `IsClosed.measurableSet`, `measurable_measure_prodMk_right`, `MeasureTheory.Measure.prod_apply_symm`, `MeasureTheory.lintegral_mono`, 1.5 `section_union_volume_mono`.
**Checks.**
- At r=1 both measurable unions are the same, so the product-volume comparison is equality.
- For an empty index type both sides are zero, including when either factor has dimension zero.
- The integration uses only the two measurable section-volume functions; no measurable choice of the pointwise center is permitted as an unstated premise.

**1.5.6 Complementary coordinate dilation of a union.** Prove `complementary_dilation_union`: For any real r, any K⊆E×F and finite v:I→E, U_v(rK)=f₂,r(U_v(f₁,r(K))).
*Hypotheses.* E and F are finite-dimensional real normed vector spaces with their Borel measurable structures; μ and ν are additive Haar measures on E and F. Use their product measure μ×ν. The spaces may have dimension zero. For a finite indexing type I and v:I→E, write U_v(K)=⋃_{i∈I}{(v_i+x,y):(x,y)∈K}. Write f₁,r(x,y)=(rx,y), f₂,r(x,y)=(x,ry). These are ordinary finite unions and linear maps, not new constructors or carrier types.
(Source: Henk, *Successive minima and lattice points*, p.6, identity M_q^i+K_{i+1}=f₂(M_q^i+f₁(K_i)).)
**Checks.**
- On ℝ×ℝ, f₁,2(3,5)=(6,5).
- On ℝ×ℝ, f₂,2(3,5)=(3,10); it must leave the translation coordinate unchanged.

**1.5.7 Codimension growth for translated convex unions.** Prove `transverse_union_volume`: For compact convex K⊆E×F, finite v:I→E and r≥1, r^(dim F)·(μ×ν)(U_v(K))≤(μ×ν)(U_v(rK)), interpreting the scalar factor by the nonnegative extended-real inclusion.
*Hypotheses.* E and F are finite-dimensional real normed vector spaces with their Borel measurable structures; μ and ν are additive Haar measures on E and F. Use their product measure μ×ν. The spaces may have dimension zero. For a finite indexing type I and v:I→E, write U_v(K)=⋃_{i∈I}{(v_i+x,y):(x,y)∈K}. Write f₁,r(x,y)=(rx,y), f₂,r(x,y)=(x,ry). These are ordinary finite unions and linear maps, not new constructors or carrier types.
(Source: Henk, *Successive minima and lattice points*, p.6 (3.5), using the partial maps and (3.6).)
*Needs:* Mathlib `MeasureTheory.Measure.addHaar_image_linearMap`, `LinearMap.det_prodMap`, `LinearMap.det_smul`, `MeasureTheory.Measure.prod.instIsHaarMeasure`, 1.5 `partial_dilation_union_volume`, 1.5 `complementary_dilation_union`.
**Checks.**
- For F=EuclideanSpace ℝ (Fin 0), the factor 2^(dim F) is 1, not 2 or zero.

**1.5.8 Gauge under an invertible linear change.** Prove `gauge_linearEquiv`: For real modules E,F, a linear equivalence e:E≃_R F, K⊆E and x∈E, gauge_{e(K)}(e(x))=gauge_K(x). No convexity, boundedness, symmetry or nonempty-interior hypothesis is needed.
*Hypotheses.* E,F are real modules with additive commutative group structure. Both the set and the evaluation point are transformed; this is a comparison for the gauge, not another gauge definition.
(Source: direct deduction from Mathlib `gauge_def'`; Henk p.5, §3, uses the accompanying reduction to a standard lattice.)
*Needs:* Mathlib `gauge_def'`.
**Checks.**
- For K=[−1,1], transforming K and x=1 by multiplication by 2 gives gauge_[−2,2](2)=1.
- Keeping K=[−1,1] while replacing x=1 by x=2 gives gauge 2, not 1.

**1.5.9 Null intersection of separated convex clusters.** Prove `convex_cluster_intersection_null`: For finite families A:I→Set(E), B:J→Set(E) of convex sets, if int(A_i) and int(B_j) are disjoint for every i,j, then μ((⋃_i A_i)∩(⋃_j B_j))=0.
*Hypotheses.* E is finite-dimensional real normed, with Borel structure and an additive Haar measure μ. The families may be empty; the individual convex sets need not be closed or bounded. The unions need not be convex.
(Source: Henk, *Successive minima and lattice points*, p.6, the volume factorizations immediately after (3.4).)
*Needs:* Mathlib `mem_frontier_iff_notMem_interior`, `Convex.addHaar_frontier`, `MeasureTheory.measure_iUnion_null_iff`, `MeasureTheory.measure_union_null`, `MeasureTheory.measure_mono_null`.
**Checks.**
- ([0,2]∪[1,3])∩([3,5]∪[4,6]) has real volume zero.
- [0,2]∩[1,3] has volume one: dropping cross-interior disjointness is false.

**1.5.10 Additive volume of transverse translate clusters.** Prove `clustered_translate_volume`: For compact convex K⊆E, finite u:I→E and v:J→E, suppose int(u_i+v_j+K) and int(u_i′+v_j′+K) are disjoint whenever j≠j′, for all i,i′. Then μ(⋃_j⋃_i(u_i+v_j+K))=|J|·μ(⋃_i(u_i+K)).
*Hypotheses.* E is finite-dimensional real normed and Borel; μ is additive Haar measure. Both index types may be empty. Within each row j, the sets may overlap and the labels i may repeat.
(Source: Henk, *Successive minima and lattice points*, p.6, the two factorizations following (3.4).)
*Needs:* Mathlib `Convex.translate`, `Homeomorph.image_interior`, `IsCompact.image`, `isCompact_iUnion`, `IsCompact.isClosed`, `IsClosed.measurableSet`, `MeasureTheory.measure_iUnion₀`, `MeasureTheory.measure_preimage_mul_right`, 1.5 `convex_cluster_intersection_null`.
**Checks.**
- The union of [0,2],[1,3],[3,5],[4,6] has volume 6=2·3, not 4·2=8.
- Repeating [0,1] within a row does not double that row's volume; two touching translated rows still have total volume 2.

**1.5.11 Separation outside a strict gauge flag.** Prove `strict_flag_translate_separation`: Let K⊆R^d be a symmetric convex body with 0 in its interior, t>0 and 0≤k≤d. Suppose every z∈Z^d with gauge_K(c(z))<t has z_j=0 for j≥k. If x,y∈Z^d differ in some coordinate j≥k, then c(x)+int((t/2)K) and c(y)+int((t/2)K) are disjoint.
*Hypotheses.* These are sets, finite unions and scalar images, not new box or lattice carrier types. For d,q∈N, write M_q={z∈Z^d:−q≤z_j≤q for every j}, a finite interval in the function lattice. Write c(z)=(z_j:R)_j, U_q(S)=⋃_{z∈M_q}(c(z)+S), and M_q^k={z∈M_q:z_j=0 when k≤j<d}. Write U_q^k(S) for the same union restricted to M_q^k. Indices are zero-based. A cutoff k∈{0,…,d} retains the first k coordinates; the transverse dimension is d−k. Empty-coordinate products and volumes use the zero-dimensional convention. The flag condition is strict. No assertion about gauge=t points is made. A minimum vector need not be a basis vector, and no equality between a real and integral basis is assumed.
(Source: Henk, *Successive minima and lattice points*, pp.5–6, (3.2) and (3.4), using the strict flag from (2.3).)
*Needs:* Mathlib `interior_subset_gauge_lt_one`, `gauge_smul_left_of_nonneg`, `gauge_add_le`, `gauge_neg`, `absorbent_nhds_zero`.
**Checks.**
- The open intervals (−1/2,1/2) and (1/2,3/2) are disjoint, even though the corresponding closed intervals touch.
- Replacing the half-body by the whole unit interval makes translates centered at 0 and 1 overlap on (0,1).

**1.5.12 Volume factorization by lattice-box rows.** Prove `lattice_box_row_volume`: For compact convex S⊆R^d, q∈N and k≤d, assume c(x)+int(S) and c(y)+int(S) are disjoint for all x,y∈M_q whose tails (coordinates j≥k) differ. Then volume(U_q(S))=(2q+1)^(d−k)·volume(U_q^k(S)).
*Hypotheses.* These are sets, finite unions and scalar images, not new box or lattice carrier types. For d,q∈N, write M_q={z∈Z^d:−q≤z_j≤q for every j}, a finite interval in the function lattice. Write c(z)=(z_j:R)_j, U_q(S)=⋃_{z∈M_q}(c(z)+S), and M_q^k={z∈M_q:z_j=0 when k≤j<d}. Write U_q^k(S) for the same union restricted to M_q^k. Indices are zero-based. A cutoff k∈{0,…,d} retains the first k coordinates; the transverse dimension is d−k. Empty-coordinate products and volumes use the zero-dimensional convention. Lebesgue volume is the product volume on R^d. The statement is in the nonnegative extended reals, with the natural cardinal factor cast into that space.
(Source: Henk, *Successive minima and lattice points*, p.6, the two displayed volume factorizations after (3.4).)
*Needs:* Mathlib `Equiv.piEquivPiSubtypeProd`, `Pi.card_Icc`, `Int.card_Icc`, 1.5 `clustered_translate_volume`.
**Checks.**
- For q=1,k=1,d=2 and S=[−1,1]×[−1/2,1/2], the prefix union has area 4 and the full union area 12=3·4; summing nine individual areas would incorrectly give 18.
- M_0 consists only of zero in every dimension, so every row-volume factor at q=0 is one.

**1.5.13 Codimension growth in prefix coordinates.** Prove `coordinate_transverse_union_volume`: For k≤d, compact convex S⊆R^d, a finite family v:I→R^d with (v_i)_j=0 whenever j≥k, and r≥1, r^(d−k)·volume(⋃_i(v_i+S))≤volume(⋃_i(v_i+rS)).
*Hypotheses.* These are sets, finite unions and scalar images, not new box or lattice carrier types. For d,q∈N, write M_q={z∈Z^d:−q≤z_j≤q for every j}, a finite interval in the function lattice. Write c(z)=(z_j:R)_j, U_q(S)=⋃_{z∈M_q}(c(z)+S), and M_q^k={z∈M_q:z_j=0 when k≤j<d}. Write U_q^k(S) for the same union restricted to M_q^k. Indices are zero-based. A cutoff k∈{0,…,d} retains the first k coordinates; the transverse dimension is d−k. Empty-coordinate products and volumes use the zero-dimensional convention. No symmetry or origin condition is required for S. The family may be empty or have repeated labels. This is the product-space inequality expressed in coordinate space, not a new geometric carrier.
(Source: Henk, *Successive minima and lattice points*, p.6, (3.5) and the coordinate maps f₁,f₂.)
*Needs:* Mathlib `Equiv.piEquivPiSubtypeProd`, `Homeomorph.piEquivPiSubtypeProd`, `MeasureTheory.volume_preserving_piEquivPiSubtypeProd`, `Module.finrank_fintype_fun_eq_card`, 1.5 `transverse_union_volume`.
**Checks.**
- For d=3,k=1,r=2 the multiplier is 4, not the ambient factor 8.
- For k=d the multiplier is r^0=1; for k=0 it is r^d.

**1.5.14 Consecutive-threshold lattice-box volume inequality.** Prove `flag_box_volume_ratio`: For K⊆R^d a symmetric convex body with 0 in its interior, 0<s≤t, q∈N and k≤d, assume gauge_K(c(z))<t implies z_j=0 for all j≥k. Then (t/s)^(d−k)·volume.real(U_q((s/2)K))≤volume.real(U_q((t/2)K)).
*Hypotheses.* These are sets, finite unions and scalar images, not new box or lattice carrier types. For d,q∈N, write M_q={z∈Z^d:−q≤z_j≤q for every j}, a finite interval in the function lattice. Write c(z)=(z_j:R)_j, U_q(S)=⋃_{z∈M_q}(c(z)+S), and M_q^k={z∈M_q:z_j=0 when k≤j<d}. Write U_q^k(S) for the same union restricted to M_q^k. Indices are zero-based. A cutoff k∈{0,…,d} retains the first k coordinates; the transverse dimension is d−k. Empty-coordinate products and volumes use the zero-dimensional convention. K is the compact nonempty ConvexBody; compactness is used to convert finite union measures to real volume.
(Source: Henk, *Successive minima and lattice points*, pp.5–6, (3.3)–(3.5).)
*Needs:* Mathlib `IsCompact.measure_lt_top`, `isCompact_iUnion`, `IsCompact.image`, 1.5 `strict_flag_translate_separation`, 1.5 `lattice_box_row_volume`, 1.5 `coordinate_transverse_union_volume`.
**Checks.**
- If s=t>0, the ratio inequality is equality, including every q and cutoff.
- For q=1, K=[−1,1]×[−1/3,1/3], s=1,t=3,k=1, the smaller and larger union areas are 3 and 15. The required factor gives 9≤15; the incorrect ambient exponent gives 27≤15, which is false.

**1.5.15 Initial lattice-box translate volume.** Prove `first_box_volume`: For K⊆R^d a symmetric convex body with 0 in its interior and s>0, suppose gauge_K(c(z))<s for an integer vector z implies z=0. Then for every q∈N, volume.real(U_q((s/2)K))=(2q+1)^d·(s/2)^d·volume.real(K).
*Hypotheses.* These are sets, finite unions and scalar images, not new box or lattice carrier types. For d,q∈N, write M_q={z∈Z^d:−q≤z_j≤q for every j}, a finite interval in the function lattice. Write c(z)=(z_j:R)_j, U_q(S)=⋃_{z∈M_q}(c(z)+S), and M_q^k={z∈M_q:z_j=0 when k≤j<d}. Write U_q^k(S) for the same union restricted to M_q^k. Indices are zero-based. A cutoff k∈{0,…,d} retains the first k coordinates; the transverse dimension is d−k. Empty-coordinate products and volumes use the zero-dimensional convention. K is the compact nonempty ConvexBody; compactness is used to convert finite union measures to real volume.
(Source: Henk, *Successive minima and lattice points*, p.5, (3.2).)
*Needs:* Mathlib `Pi.card_Icc`, `Int.card_Icc`, `MeasureTheory.Measure.addHaar_smul_of_nonneg`, `IsCompact.measure_lt_top`, 1.5 `strict_flag_translate_separation`, 1.5 `finite_interior_disjoint_translate_volume`.
**Checks.**
- For q=1 and K=[−1,1]^2 with s=1, the union area is 9=3²·(1/2)²·4.
- For q=1, K=[−2,2]×[−1,1] and s=1/2, the union area is 9/2=3²·(1/4)²·8.

**1.5.16 Uniform enclosing box for lattice translates.** Prove `outer_lattice_box_volume`: For any compact S⊆R^d there is R≥0 such that, for every q∈N, volume.real(U_q(S))≤(2q+2R)^d.
*Hypotheses.* These are sets, finite unions and scalar images, not new box or lattice carrier types. For d,q∈N, write M_q={z∈Z^d:−q≤z_j≤q for every j}, a finite interval in the function lattice. Write c(z)=(z_j:R)_j, U_q(S)=⋃_{z∈M_q}(c(z)+S), and M_q^k={z∈M_q:z_j=0 when k≤j<d}. Write U_q^k(S) for the same union restricted to M_q^k. Indices are zero-based. A cutoff k∈{0,…,d} retains the first k coordinates; the transverse dimension is d−k. Empty-coordinate products and volumes use the zero-dimensional convention. S need not be convex, symmetric or nonempty. R depends on S and d but is chosen once, independently of q.
(Source: Henk, *Successive minima and lattice points*, p.5, (3.1).)
*Needs:* Mathlib `IsCompact.isBounded`, `isBounded_iff_forall_norm_le'`, `MeasureTheory.measureReal_mono`, `Real.volume_Icc_pi`.
**Checks.**
- For q=1 and R=3/2 in dimension two, the enclosing area is (2+3)²=25, bounding the anisotropic row example of area 15.
- In dimension zero the right side is one, including q=R=0; the empty union's volume is zero.

**1.5.17 Telescoping product with descending exponents.** Prove `weighted_ratio_product`: For n∈N and positive a:Fin(n+1)→R, a_0^(n+1)·∏_{i:Fin n}(a_{i+1}/a_i)^(n−i)=∏_{j:Fin(n+1)}a_j.
*Hypotheses.* All a_j are strictly positive, so every denominator is nonzero. No monotonicity is needed for this algebraic identity. With n=0 the ratio product is empty and both sides are a_0.
(Source: Henk, *Successive minima and lattice points*, p.7, the final product expansion.)
*Needs:* Mathlib `Fin.prod_univ_succ`.
**Checks.**
- For a=(2,3,5), 2³·(3/2)²·(5/3)=30=2·3·5.
- For a=(2,2,5), the repeated ratio is one and the identity gives 20.
- For n=0, the empty ratio product gives a_0^1=a_0.

**1.5.18 Accumulate the consecutive volume inequalities.** Prove `weighted_volume_chain`: For positive a:Fin(n+1)→R, nonnegative V:Fin(n+1)→R and B≥0, assume a_0^(n+1)B≤V_0 and (a_{i+1}/a_i)^(n−i)V_i≤V_{i+1} for every i:Fin n. Then (∏_j a_j)B≤V_n.
*Hypotheses.* All sequence entries and endpoints use Fin(n+1). The recurrence has exactly n inequalities, so for n=0 the conclusion is the initial inequality.
(Source: Henk, *Successive minima and lattice points*, p.7, the chain of inequalities after (3.6).)
*Needs:* 1.5 `weighted_ratio_product`.
**Checks.**
- For a=(2,3,5), B=1 and V=(8,18,30), the two recurrence steps are equalities and the endpoint is 30.
- With B=0 and V identically zero the conclusion holds; a proof that divides by a volume would be invalid.

**1.5.19 Pass a uniform box comparison to the limit.** Prove `large_box_comparison_limit`: For d∈N and real R,B, if (2q+1)^d B≤(2q+2R)^d for every q∈N, then B≤1.
*Hypotheses.* The scalar statement does not require R≥0 or B≥0; the geometric application supplies both. The denominator 2q+1 is always strictly positive. Dimension zero is allowed.
(Source: Henk, *Successive minima and lattice points*, p.7, the last display and its conclusion for all q.)
*Needs:* Mathlib `tendsto_add_mul_div_add_mul_atTop_nhds`, `le_of_tendsto'`.
**Checks.**
- For R=1/2 the ratio (2q+2R)/(2q+1) is identically one.
- For d=0 both powers are one even when the numerator vanishes.

**1.5.20 Sharp product bound from a coordinate flag.** Prove `coordinate_flag_upper`: Let K be a symmetric convex body in R^d with 0 in its interior, and let a:Fin d→R be positive and nondecreasing. Suppose for every i and z∈Z^d, gauge_K(c(z))<a_i implies z_j=0 for all j≥i. Then (∏_i a_i)·volume.real(K)≤2^d.
*Hypotheses.* These are sets, finite unions and scalar images, not new box or lattice carrier types. For d,q∈N, write M_q={z∈Z^d:−q≤z_j≤q for every j}, a finite interval in the function lattice. Write c(z)=(z_j:R)_j, U_q(S)=⋃_{z∈M_q}(c(z)+S), and M_q^k={z∈M_q:z_j=0 when k≤j<d}. Write U_q^k(S) for the same union restricted to M_q^k. Indices are zero-based. A cutoff k∈{0,…,d} retains the first k coordinates; the transverse dimension is d−k. Empty-coordinate products and volumes use the zero-dimensional convention. The a_i are threshold data satisfying the explicit flag condition; the statement does not define a new successive-minimum invariant. The conclusion includes d=0.
(Source: Henk, *Successive minima and lattice points*, §3, pp.5–7, (3.1)–(3.6) and final display.)
*Needs:* Mathlib `MeasureTheory.Measure.volume_pi_eq_dirac`, `ConvexBody.isCompact`, 1.5 `flag_box_volume_ratio`, 1.5 `first_box_volume`, 1.5 `weighted_volume_chain`, 1.5 `outer_lattice_box_volume`, 1.5 `large_box_comparison_limit`.
**Checks.**
- For Z² and K=[−3,3]×[−1,1], thresholds (1/3,1) give product-volume 4, exactly 2².
- For the unit diamond and thresholds (1,1), product-volume is 2<4.
- For d=0 the product-volume and the bound are both one.

**1.5.21 Minkowski’s sharp upper product inequality.** Prove `minkowski_second_upper`: For a discrete full Z-lattice L in a finite-dimensional real inner-product space E and a centrally symmetric convex body K with 0 in its interior, (∏_{i:Fin d}λ_i(L,K))·volume.real(K)≤2^d·covolume(L), where d=dim_R E and λ_i is the inherited zero-based successive minimum. The formula includes d=0.
*Hypotheses.* E carries its Borel structure and canonical intrinsic Euclidean volume. L uses Submodule Z E, DiscreteTopology and IsZLattice. K uses ConvexBody. Lower-rank lattices are first regarded as full lattices in their real spans, with intrinsic measure. No ambient-volume conclusion for a lower-dimensional body is substituted.
(Source: Henk, *Successive minima and lattice points*, p.2 Theorem 1.3 and complete §3 proof, pp.5–7.)
*Needs:* Mathlib `Module.Basis.ofZLatticeBasis_repr_apply`, `Module.Basis.mem_flag_iff_repr_eq_zero`, `Module.Basis.equivFun`, `Convex.linear_image`, `Homeomorph.image_interior`, `IsCompact.image`, `IsCompact.isClosed`, `IsClosed.measurableSet`, `ZLattice.volume_image_eq_volume_div_covolume'`, `ZLattice.covolume_pos`, `IsCompact.measure_lt_top`, 1.2 `exists_integral_minimum_flag`, 1.5 `gauge_linearEquiv`, 1.2 `successiveMin_pos`, 1.2 `successiveMin_monotone`, 1.5 `coordinate_flag_upper`.
**Checks.**
- For L=2Z and K=[−3,3], minimum 2/3 times length 6 is 4=2·covolume(L); omitting covolume would assert 4≤2.
- For L=2Z×3Z and K=[−2,2]×[−1,1], minima (1,3) and area 8 give 24=4·6.
- In the zero-dimensional canonical space the empty product, volume, covolume and 2^0 are all one.

### Examples

For `L = ℤ^d` and the cube `K = [−1,1]^d` every minimum is `1` and the product `λ_1⋯λ_d · vol K = 2^d` attains the upper bound. For positive half-widths `a_i`, both the weighted cross-polytope `{Σ|x_i|/a_i ≤ 1}` and the box `∏[−a_i,a_i]` have the reciprocals `1/a_i` as their successive minima, sorted in increasing order of the reciprocals. With half-widths `(2,1)` the minima are `(1/2,1)`, not `(1,2)`. The cross-polytope attains the lower bound `2^d/d!`. For Dirichlet approximation apply the linear forms theorem to `x−αy` and `y` with bounds `(1/T,T)`, `T>1`: the determinant is `1`, so there is a nonzero integer pair with `|x−αy|≤1/T` and `|y|≤T`. Since `1/T<1`, `y=0` would also force `x=0`, so the denominator is nonzero.

### Dependencies

Layer 0 (Gram determinants and covolumes); Mathlib `ConvexBody`, `gauge` and its calculus, `MeasureTheory.exists_pair_mem_lattice_not_disjoint_vadd`, `ZSpan.isAddFundamentalDomain`, `ZLattice.volume_image_eq_volume_div_covolume`, `Module.Basis.flag`, the Haar-measure image lemmas.

## Layer 2: Integral quadratic and hermitian lattices

This layer builds the arithmetic of integral quadratic and hermitian lattices over a Dedekind domain `R` with fraction field `K`, not only over `ℤ`: the carrier is a full `R`-submodule of a `K`-quadratic space on which the quadratic map takes values in `R`, with no basis stored. Localisation at a prime and descent from a completion (2.2) let every local question be asked of a lattice over a discrete valuation ring. The genus and the proper spinor genus (2.4) are defined over a number field with the spin image taken place by place. The local theory has three branches: invariant factors over a DVR (2.5), Voight’s atomic normal forms over a characteristic-zero DVR, dyadic case included (2.6), and the hermitian, quaternionic and signed hermitian variants (2.7–2.9). The field-level comparisons of 2.1 and the ℤ-lattice comparisons of 2.3 are the exact bridges to QuadraticFormInvariants, GlobalQuadraticForms and the two IntegralLattices roadmaps, with the convention `q(x) = B(x,x)/2` made explicit at every crossing.

### 2.1 Comparisons with the field theory

**2.1.1 Field hyperbolic comparison.** Prove the comparison: For a finite-dimensional field space with 2 invertible, passage from a nondegenerate symmetric pairing B to q(x)=B(x,x)/2 identifies its categorical hyperbolic plane with the hyperbolic plane `xy` of QuadraticFormInvariants Layer 1. The integral hyperbolic plane over Z needs no division by 2.
(Source: QuadraticFormInvariants, Layer 1, hyperbolic decomposition and Witt cancellation, in the named supplier README; this target compares the integral carrier with that supplied field or ℤ statement.)
*Needs:* 2.2 `IntegralQuadraticLattice.ofCarrier`, QuadraticFormInvariants Layer 1.

**2.1.2 Field discriminant comparison.** Prove the comparison: In a basis of the generic space, the plain quadratic discriminant of QuadraticFormInvariants Layer 3 of q=B(x,x)/2 is the square class of 2^(−n) det Gram(B), and signed discriminant multiplies by (−1)^(n(n−1)/2). Basis changes multiply by a square.
(Source: QuadraticFormInvariants, Conventions and Layer 3, plain and signed discriminants, in the named supplier README; this target compares the integral carrier with that supplied field or ℤ statement.)
*Needs:* 2.2 `IntegralQuadraticLattice.ofCarrier`, QuadraticFormInvariants Layer 3.

**2.1.3 Field Witt comparison.** Prove the comparison: Over a field with 2 invertible, the exact-category symmetric W0 of finite-dimensional vector spaces is additively isomorphic to the Witt ring of QuadraticFormInvariants Layer 4 via B↦B(x,x)/2; orthogonal sums and hyperbolic relations agree. This supplies no integral Witt ring or dyadic quadratic-refinement identification.
(Source: QuadraticFormInvariants, Layer 4, Witt and Witt–Grothendieck rings; the B/2 comparison is an additive transport, in the named supplier README; this target compares the integral carrier with that supplied field or ℤ statement.)
The field Witt ring is Tau Ceti `WittRing K` with `WittGrothendieckRing K`; the exact-category group `W₀` is constructed in 6.4, so this comparison is stated here and proved there.
*Needs:* 2.2 `IntegralQuadraticLattice.ofCarrier`, QuadraticFormInvariants Layer 4.

**2.1.4 Field Hasse comparison.** Prove the comparison: The generic quadratic form of an integral lattice uses the Brauer-valued Hasse and Clifford invariants of QuadraticFormInvariants Layer 5, with its signed/plain discriminant conventions; integral basis change preserves these through the generic isometry. No complete invariant claim over a general field is made.
(Source: QuadraticFormInvariants, Layer 5, Hasse and Clifford invariants, in the named supplier README; this target compares the integral carrier with that supplied field or ℤ statement.)
*Needs:* 2.2 `IntegralQuadraticLattice.ofCarrier`, QuadraticFormInvariants Layer 5.

**2.1.5 Local field classification comparison.** Prove the comparison: For a characteristic-zero nonarchimedean local field, generic nondegenerate quadratic spaces are isometric exactly when dimension, plain discriminant and local Hasse sign agree. Completed integral lattices with those generic invariants can still be inequivalent.
(Source: QuadraticFormInvariants, Layer 6, local Hasse invariant and local classification, in the named supplier README; this target compares the integral carrier with that supplied field or ℤ statement.)
*Needs:* 2.2 `IntegralQuadraticLattice.ofCarrier`, QuadraticFormInvariants Layer 6.

**2.1.6 Global field isotropy comparison.** Prove the comparison: For the generic nondegenerate quadratic form over a number field, a nonzero isotropic vector exists exactly when one exists at all finite and real completions. Integral representation of a prescribed value requires additional lattice conditions.
(Source: GlobalQuadraticForms, Layer 5, Hasse–Minkowski isotropy, in the named supplier README; this target compares the integral carrier with that supplied field or ℤ statement.)
*Needs:* 2.2 `IntegralQuadraticLattice.ofCarrier`, GlobalQuadraticForms Layer 5.

**2.1.7 Global field isometry comparison.** Prove the comparison: Local generic isometry at every finite and real place gives a single generic K-isometry. It does not identify the embedded lattices; the integral-genus relation and its class set retain precisely that extra problem.
(Source: GlobalQuadraticForms, Layer 6, local-to-global isometry, in the named supplier README; this target compares the integral carrier with that supplied field or ℤ statement.)
*Needs:* 2.2 `IntegralQuadraticLattice.ofCarrier`, GlobalQuadraticForms Layer 6.

### 2.2 Integral quadratic lattices over a Dedekind domain, localisation and descent

**2.2.1 Integral quadratic lattices over a Dedekind domain.** Define `IntegralQuadraticLattice.ofCarrier`: For a Dedekind domain R with fraction field K, a finite-dimensional K-space V and q:V→K quadratic, an integral quadratic lattice is L:Submodule R V with Submodule.IsLattice K L and q(L)⊆R. Nondegeneracy of q and unimodularity of its integral polar pairing are separate predicates. There is no global free-basis field.
*Hypotheses.* K has characteristic different from 2 for the field-classification interface; the integral quadratic-map definition itself does not require 2 to be a unit in R. The embedding R→K and scalar tower are fixed. Invariant-factor and genus work uses a nondegenerate generic fibre.
*API.* `IntegralQuadraticLattice.ofCarrier` (constructor: Bundle a full finite submodule and q with q(L)⊆R.); `IntegralQuadraticLattice.carrier` (projection: Return the original R-submodule, preserving its IsLattice instance.); `IntegralQuadraticLattice.quadraticMap` (compatibility: The restricted R-quadratic map extends back to q on the K-span.); `IntegralQuadraticLattice.ext` (extensionality: For fixed q, equal carriers yield equal bundled integral-lattice data.).
(Source: Voight, *Quaternion algebras*, §9.3 Definition 9.3.1 and §9.7 Definitions 9.7.1–9.7.8, printed pp.137,144–145.)
The carrier in `Suggested.lean` is stated for any commutative ring `R` with an `R`-algebra field `K`; the Dedekind hypothesis is carried by the theorems of 2.2.2–2.2.5, not by the structure.
*Needs:* Mathlib `Submodule.IsLattice`, `QuadraticMap`, `QuadraticForm`.
**Checks.**
- R=Z, K=Q, L=Z and q(x)=x² give an integral lattice whose polar pairing is 2xy and is not unimodular.
- Over a non-Dedekind base such as `R = ℤ[√−3]` the structure still makes sense, but 2.2.3 (recovery from localisations) is a Dedekind statement and is not claimed there.
- The integral symmetric pairing B(x,y)=xy on Z does not make q(x)=B(x,x)/2 integral.
- A nonprincipal fractional ideal is allowed as an R-lattice; no constructor asks for an R-basis.

**2.2.2 Localization of an integral quadratic lattice.** Construct `IntegralQuadraticLattice.localize`: For a nonzero prime p of R, extend L to L_(p)=L⊗R R_(p), viewed as the span of L in the same K-space; extend its quadratic map and coefficient line by scalar change. Integral values and full finite generation are preserved.
*Hypotheses.* Use localization R_(p), not completion R_p; the latter changes the ambient field. No global freeness is assumed.
*API.* `IntegralQuadraticLattice.localize` (constructor: Return the R_(p)-lattice and restricted quadratic form.); `IntegralQuadraticLattice.localize_mem_iff` (characterisation: x lies in L_(p) iff s x lies in L for some s∈R\p.); `IntegralQuadraticLattice.localize_map` (functoriality: An integral isometry localizes, preserving identity and composition.).
(Source: Voight, *Quaternion algebras*, §9.4, (9.4.1)–(9.4.5), printed pp.139–140.)
This variant localises at a prime of a Dedekind domain inside the fixed fraction-field space; it keeps completion, which changes the ambient field, for 2.2.5.
*Needs:* 2.2 `IntegralQuadraticLattice.ofCarrier`.
**Checks.**
- Z_(2) contains 1/3 and excludes 1/2; this is not Z₂.
- Localizing a nonprincipal coefficient ideal makes it principal at a nonzero prime of a Dedekind domain.
- Localizing the zero-dimensional lattice still gives the zero-dimensional lattice.

**2.2.3 Integral lattice inclusion detected locally.** Prove: For full R-lattices L,M in a fixed fraction-field K-space over a Dedekind domain, L is contained in M iff L_(p) is contained in M_(p) for every maximal ideal p.
*Hypotheses.* R is a Dedekind domain; intersections are in the fixed K-space. This detects embedded submodule equality, not the existence of a compatible family of integral isometries.
(Source: Voight, *Quaternion algebras*, Lemma 9.4.6 and Corollary 9.4.7, printed p.140.)
*Needs:* 2.2 (recover a lattice from its localizations), 2.2 `IntegralQuadraticLattice.localize`.
**Checks.**
- 2Z is contained in Z at every prime, and the reverse inclusion fails at prime 2.

**2.2.4 Recover a lattice from its localizations.** Prove: For a full R-lattice L in a fixed fraction-field K-space over a Dedekind domain, L equals the intersection of its localizations L_(p) over maximal ideals p, as embedded submodules.
*Hypotheses.* R is a Dedekind domain; intersections are in the fixed K-space. This detects embedded submodule equality, not the existence of a compatible family of integral isometries.
(Source: Voight, *Quaternion algebras*, Lemma 9.4.6 and Corollary 9.4.7, printed p.140.)
*Needs:* 2.2 `IntegralQuadraticLattice.localize`.
**Checks.**
- 2Z and Z differ at the prime 2, though their Q-spans coincide.
- For equal embedded localizations the conclusion is L=M; independent local isometries do not supply a single global integral isometry.

**2.2.5 Descent of a lattice from a DVR completion.** Prove: If R is a DVR with fraction field K and completion R̂ with fraction field K̂, extension L↦L⊗R R̂ and intersection N↦N∩V are inverse bijections between full R-lattices in finite-dimensional V and full R̂-lattices in V⊗K K̂.
*Hypotheses.* Intersection uses the canonical injection V→V⊗K K̂. Finite-generation and torsion-free hypotheses are retained; a torsion R-module is not declared free.
(Source: Voight, *Quaternion algebras*, §9.5 (9.5.1)–(9.5.4), Lemma 9.5.3 and full proof, printed pp.142–143.)
*Needs:* 2.2 `IntegralQuadraticLattice.localize`.
**Checks.**
- The descent of 2Z₂⊂Q₂ is 2Z_(2)⊂Q, not 2Z as a global lattice.
- The finite quotient comparison R/p^e≅R̂/p^e for e≥1 is essential to lifting completed generators.

### 2.3 Comparisons with symmetric ℤ-lattices

**2.3.1 Symmetric Z carrier comparison.** Prove the comparison: For R=Z,K=Q and a symmetric integral pairing B, the GN integral hermitian carrier with trivial involution recovers the completed IntegralLattices carrier. For an integral quadratic q use B=polar(q), not q(x)=B(x,x)/2 without the evenness condition.
(Source: Completed/IntegralLattices, Layer 1, embedded rational carrier and restricted integer pairing, in the named supplier README; this target compares the integral carrier with that supplied field or ℤ statement.)
*Needs:* 2.2 `IntegralQuadraticLattice.ofCarrier`, Completed IntegralLattices Layer 1.

**2.3.2 Symmetric Z dual comparison.** Prove the comparison: Under the same symmetric Q-space specialization, GN hermitian dual equals B.dualSubmodule L as embedded Z-submodules. The quotient L∨/L and its determinant cardinality are the discriminant group of Completed IntegralLattices Layer 2, for nondegenerate integral L.
(Source: Completed/IntegralLattices, Layer 2, duality and discriminant group, in the named supplier README; this target compares the integral carrier with that supplied field or ℤ statement.)
*Needs:* 2.2 `IntegralQuadraticLattice.ofCarrier`, Completed IntegralLattices Layer 2.

**2.3.3 Symmetric Z overlattice comparison.** Prove the comparison: For the specialization, intermediate L⊂M⊂L∨ correspond through Completed IntegralLattices Layer 4 to subgroups of A_L. Integral M requires vanishing of the bilinear form; even M requires the quadratic refinement. A subgroup isotropic only for a quadratic form is used only when L is even.
(Source: Completed/IntegralLattices, Layer 4, integral and even overlattice correspondences, in the named supplier README; this target compares the integral carrier with that supplied field or ℤ statement.)
*Needs:* 2.2 `IntegralQuadraticLattice.ofCarrier`, Completed IntegralLattices Layer 4.

### 2.4 Genus and proper spinor genus

**2.4.1 Integral genus inside a rational quadratic space.** Define `IntegralGenus.localIsometry`: Within a fixed nondegenerate quadratic K-space (V,q), two integral R-lattices belong to the same genus when their completed lattices are isometric under O(q_v)(K_v) at every nonzero prime v. If quadratic spaces themselves vary, also require the archimedean signature data and the rational-space identification from GlobalQuadraticForms. Genus classes are integral isometry classes inside this equivalence class.
*Hypotheses.* R is the ring of integers of a number field, or a specified localization with exactly its retained places. Genus, rational isometry and global integral isometry have separate types and separate quotient relations.
*API.* `IntegralGenus.localIsometry` (data: A local isometry at each retained finite place, with archimedean data when spaces vary.); `IntegralGenus.equivalence` (structure: The genus relation is an equivalence relation.); `IntegralGenus.ofIntegralIsometry` (compatibility: A global integral isometry determines a genus relation.); `IntegralGenus.classSet` (constructor: Integral-isometry classes of lattices in the fixed genus.).
(Source: Voight, *Quaternion algebras*, Definition 9.7.13, printed p.146; completion comparison §9.5.)
This variant is over a number ring or its localisation, with archimedean data as part of the definition.
*Needs:* 2.2 `IntegralQuadraticLattice.ofCarrier`, 2.2 (descent of a lattice from a dvr completion), QuadraticFormInvariants Layer 6, GlobalQuadraticForms Layer 6.
**Checks.**
- In fixed (Q,x²), Z and 2Z are rationally in the same ambient space but not in one integral genus.
- A global integral isometry yields local isometries at every place.
- Opposite real signatures cannot be identified when ambient spaces vary.

**2.4.2 Nondyadic unimodular spinor image.** Prove: For a nondyadic nonarchimedean local field and nondegenerate unimodular lattice of rank at least two, the proper stabilizer spinor norm image is R×K×².
(Source: Schulze-Pillot, *Lecture notes on quadratic forms*, §9.2, Lemma 9.19, printed pp.126–127.)
OrthogonalSpinGroups milestone 2F tabulates `θ(SO(V_v))` over `ℚ_p` and `ℝ`; this is the image on the integral stabilizer of a unimodular lattice over any nondyadic local field.
*Needs:* 2.4 `ProperSpinorGenus.orbit`, QuadraticFormInvariants Layer 6.

**2.4.3 Adelic spinor norm.** Prove: Local spinor norms of an adelic proper isometry assemble to an idele square class: almost all coordinates are units since its components stabilize unimodular local lattices.
(Source: Schulze-Pillot, *Lecture notes on quadratic forms*, §9.2, Definition/Lemma 9.20, printed p.127.)
OrthogonalSpinGroups milestone 3F and Tau Ceti `OrthogonalCompactOpens.adelicSpinorNorm` are the adelic spinor norm for `K = ℚ`; this target is its number-field form, with the reference subgroups given by the unimodular stabilizers of 2.4.2.
*Needs:* 2.4 (nondyadic unimodular spinor image), AdelicAlgebraicGroups AA.1.

**2.4.4 Proper spinor stabilizer quotient.** Prove: In the proper genus, φL belongs to the proper spinor genus of L exactly when θ(φ) lies in θ(SO(K))θ(SO(A;L)); proper spinor genera correspond to the quotient of the actual adelic spinor-norm image by this product.
(Source: Schulze-Pillot, *Lecture notes on quadratic forms*, §9.2, Theorem 9.21 and full proof, printed p.127.)
*Needs:* 2.4 (adelic spinor norm), 2.4 `ProperSpinorGenus.orbit`.

**2.4.5 Proper spinor genus.** Define `ProperSpinorGenus.orbit`: For nondegenerate q in characteristic different from 2, proper spinor genus is the orbit of an integral lattice under SO(q)(K) times the image of Spin(q)(A_f)→SO(q)(A_f), acting on its finite adelic completion. Proper genus uses SO instead of O. Their forgetful maps to ordinary genus are separate.
*Hypotheses.* Use the actual local-field image of the spin covering; no blanket surjectivity on local rational points. Dyadic spinor-norm images and signatures are supplied by their owners or left as precise gaps.
*API.* `ProperSpinorGenus.orbit` (constructor: Use global SO and the finite adelic spin image.); `ProperSpinorGenus.equivalence` (structure: Orbit relation is reflexive, symmetric and transitive.); `ProperSpinorGenus.toGenus` (compatibility: Forget orientation and the spin-image restriction.).
(Source: Schulze-Pillot, *Lecture notes on quadratic forms*, §9.2, Definitions 9.9,9.13 and Remark 9.14, printed pp.124–126.)
This variant takes the spin image at each finite place of a number field, rather than only over `ℚ`; no surjectivity of `Spin → SO` on local points is assumed.
*Needs:* 2.4 `IntegralGenus.localIsometry`, RepresentationTheory/SpinRepresentations Layer 2, AdelicAlgebraicGroups AA.1.
**Checks.**
- For q=xy, τ_(1,1)τ_(1,2)=diag(2,1/2) has spinor norm [2]; over Q₂ this is not in the spin image.
- Over Q₃ the same diag(2,1/2) stabilizes Z₃² and has nonsquare unit norm [2], so the integral stabilizer image is nontrivial.
- In rank one SO is trivial and its spinor orbit fixes the lattice.

### 2.5 Invariant factors over a discrete valuation ring

**2.5.1 Dual quotient is primary torsion.** Prove: For an integral nondegenerate rank-n lattice over a DVR, L∨/L is a finitely generated torsion module of finite length, killed by some π^a, and generated by at most n elements. It is finite as a set only when the residue field is finite; this includes the local-number-field setting of Li–Zhang. The algebraic statement also applies to infinite residue fields.
(Source: Li–Zhang, *Kudla–Rapoport cycles*, §1.7, printed p.8.)
*Needs:* 2.7 `IntegralHermitianLattice.dual`.

**2.5.2 DVR torsion decomposition comparison.** Prove: The primary torsion cited decomposes L∨/L into O_F/(π^a_i); remove zero summands, order the exponents and pad with zeros to exactly n entries.
(Source: Li–Zhang, *Kudla–Rapoport cycles*, §1.7, printed p.8.)
*Needs:* Mathlib `Module.torsion_by_prime_power_decomposition`, 2.5 (dual quotient is primary torsion).

**2.5.3 DVR graded slice count.** Prove: For exponents a_i and m≥1, dimension over the residue field of π^(m−1)M/π^m M is #{i:a_i≥m}.
(Source: Li–Zhang, *Kudla–Rapoport cycles*, §1.7, printed p.8.)
*Needs:* 2.5 (dvr torsion decomposition comparison).

**2.5.4 Ordered elementary divisor uniqueness.** Prove: Two ordered length-n exponent tuples defining the same finite-length DVR module coincide, including padded zeros.
(Source: Li–Zhang, *Kudla–Rapoport cycles*, §1.7, printed p.8.)
*Needs:* 2.5 (dvr graded slice count).

**2.5.5 Uniformizer independence.** Prove: Replacing π by uπ, u a unit, preserves the ordered exponent tuple and every type/length invariant.
(Source: Li–Zhang, *Kudla–Rapoport cycles*, §1.7, printed p.8.)
*Needs:* 2.5 (ordered elementary divisor uniqueness).

**2.5.6 DVR length and cardinality comparison.** Prove: For finite residue field of size Q, length(M)=Σa_i and #M=Q^(Σa_i). For an unramified quadratic O_F/O_F0 extension Q=q², giving q^(2Σa_i).
(Source: Li–Zhang, *Kudla–Rapoport cycles*, §1.7, printed p.8.)
*Needs:* 2.5 (dvr graded slice count).

### 2.6 Atomic forms over a local principal ideal domain

**2.6.1 Atomic integral quadratic forms over a DVR.** Define `IsAtomicIntegralQuadraticForm`: Over a DVR R with valuation v and uniformizer π, an atomic quadratic form is either ⟨a⟩ with a a unit, or, when 2 is not a unit, a binary [a,b,c] satisfying v(b)<v(2a)≤v(2c) and at least one of a,b a unit. These are integral quadratic maps; the polar pairing is not divided by two.
*Hypotheses.* Valuation may take infinity for zero; the stated strict inequality excludes the unwanted zero terms. The field case of the source’s trivial-valuation convention is outside this DVR predicate; the normalization theorem below additionally assumes characteristic zero.
*API.* `IsAtomicIntegralQuadraticForm` (constructor: The exact unary or dyadic binary valuation predicate.); `IsAtomicIntegralQuadraticForm.unary` (characterisation: Unary atomic forms have unit coefficient.); `IsAtomicIntegralQuadraticForm.binary` (characterisation: The binary case includes 2 nonunit and all valuation inequalities.).
(Source: Voight, *Quaternion algebras*, Definition 9.8.1 and Example 9.8.2, printed p.147.)
*Needs:* Mathlib `QuadraticMap`, `IsDiscreteValuationRing.addVal`.
**Checks.**
- Over Z₂ the hyperbolic quadratic form xy is an atomic binary form.
- Over a ring with 2 invertible only the rank-one unit case occurs.
- The zero-dimensional quadratic form is not an atomic unary or binary block; zero blocks in a normalization require the separate infinity-exponent convention.

**2.6.2 Minimal polar pivot.** Prove: For nonzero polar matrix choose an entry of minimal valuation, preferring a diagonal entry in a tie. The chosen pivot divides every entry over the DVR.
(Source: Voight, *Identifying the matrix ring* (2012), §3, Algorithm 3.12, correctness proof, printed pp.12–14.)
*Needs:* 2.6 `IsAtomicIntegralQuadraticForm`.

**2.6.3 Odd pivot diagonalization.** Prove: If 2 is a unit and the strictly minimal entry is off diagonal T_ij, the vector e_i+e_j has T(v,v) of the same minimal valuation.
(Source: Voight, *Identifying the matrix ring* (2012), §3, Algorithm 3.12, correctness proof, printed pp.12–14.)
*Needs:* 2.6 (minimal polar pivot).

**2.6.4 Unary integral complement.** Prove: A minimal diagonal pivot v admits integral ratios T(v,e_k)/T(v,v); subtracting these multiples of v produces an orthogonal complementary basis.
(Source: Voight, *Identifying the matrix ring* (2012), §3, Algorithm 3.12, correctness proof, printed pp.12–14.)
*Needs:* 2.6 (minimal polar pivot), 2.6 (odd pivot diagonalization).

**2.6.5 Dyadic binary pivot normalization.** Prove: For a strict off-diagonal minimum at a dyadic DVR, scale e_i by the unit π^v(T_ij)/T_ij and take e_j as the second vector. Their off-diagonal entry is π^v(T_ij), with both diagonal entries of strictly higher valuation.
(Source: Voight, *Identifying the matrix ring* (2012), §3, Algorithm 3.12, correctness proof, printed pp.12–14.)
*Needs:* 2.6 (minimal polar pivot).

**2.6.6 Binary determinant valuation.** Prove: For diagonal entries A,C and off-diagonal B with v(A),v(C)>v(B), d=AC−B² has valuation 2v(B).
(Source: Voight, *Identifying the matrix ring* (2012), §3, Algorithm 3.12, correctness proof, printed pp.12–14.)
*Needs:* 2.6 (dyadic binary pivot normalization).

**2.6.7 Binary integral complement.** Prove: For each remaining e_k put t=B T(v2,e_k)−C T(v1,e_k), u=B T(v1,e_k)−A T(v2,e_k). Both t/d,u/d are integral; e_k+(t/d)v1+(u/d)v2 is orthogonal to the binary plane.
(Source: Voight, *Identifying the matrix ring* (2012), §3, Algorithm 3.12, correctness proof, printed pp.12–14.)
*Needs:* 2.6 (binary determinant valuation).

**2.6.8 Atomic block extraction.** Prove: Remove the common valuation from the unary or binary pivot. A binary pivot has at least one unit quadratic coefficient or unit middle coefficient, and satisfies the atomic inequalities.
(Source: Voight, *Identifying the matrix ring* (2012), §3, Algorithm 3.12, correctness proof, printed pp.12–14.)
*Needs:* 2.6 (unary integral complement), 2.6 (binary integral complement).

**2.6.9 Atomic splitting termination.** Prove: Each nonzero pivot removes a unary or binary rank, so recursion terminates. In a characteristic-zero DVR a zero polar matrix means q=0, recorded as zero blocks with infinite exponent.
(Source: Voight, *Identifying the matrix ring* (2012), §3, Algorithm 3.12, correctness proof, printed pp.12–14.)
*Needs:* 2.6 (atomic block extraction).

**2.6.10 Corrected square completion.** Prove: When the unary pivot a is allowed, [a,b,c] becomes ⟨a,c−b²/(4a)⟩ in the basis `(e₁,e₂−(b/(2a))e₁)`. Require `a≠0`, `2≠0`, and `b/(2a)∈R`, the integral unary-pivot condition; the second diagonal entry is `c−b²/(4a)`. The printed plus signs in Example 3.14 are incorrect.
(Source: Voight, *Identifying the matrix ring* (2012), §3, Algorithm 3.12, correctness proof, printed pp.12–14.)
*Needs:* 2.6 (unary integral complement).

**2.6.11 Normalized integral quadratic form.** Prove: Every finite-projective quadratic form over a characteristic-zero DVR has an integral basis giving an orthogonal sum π^{e₁}Q₁⊥…⊥π^{e_s}Q_s of atomic unary/binary forms, with ordered exponents e_i≥0, allowing the zero blocks specified by the source infinity convention. This normalized form is not asserted unique.
*Hypotheses.* Over a local PID the finite-projective underlying module is free. No uniform diagonalization theorem is exported for dyadic rings. Algorithm comparison here is proved for a finite free module over a characteristic-zero DVR; a projective module is free locally. The broader source proposition remains a separate scope, not an equal-characteristic-two algorithm assertion.
(Source: Voight, *Quaternion algebras*, Proposition 9.8.4 and proof reference, printed pp.147–148.)
*Needs:* 2.6 `IsAtomicIntegralQuadraticForm`, 2.6 (atomic splitting termination).
**Checks.**
- The binary hyperbolic dyadic block cannot be discarded in favour of an unsupported integral diagonalization.
- The zero quadratic map requires the specified zero-block convention.

### 2.7 Hermitian lattices

**2.7.1 Integral hermitian lattices.** Define `IntegralHermitianLattice.ofCarrier`: Let K be a field with involution, R⊂K a stable integral subring and V a finite K-space. A hermitian integral lattice consists of L:Submodule R V, Submodule.IsLattice K L and a sesquilinear H, conjugate-linear in its first argument and linear in its second, with H(y,x)=star H(x,y) and H(L,L)⊆R. Generic nondegeneracy is distinct from integral self-duality.
*Hypotheses.* Commutative K/R in this declaration; the quaternionic right-module variant is a separate target. For Li–Zhang density the extension is unramified quadratic F/F₀ and F₀ has characteristic different from 2; dyadic residue fields are allowed in §3 except its explicitly geometric branch.
*API.* `IntegralHermitianLattice.ofCarrier` (constructor: Bundle the full finite submodule and actual integral star-sesquilinear form.); `IntegralHermitianLattice.carrier` (projection: The R-submodule, with its IsLattice certificate.); `IntegralHermitianLattice.ext` (extensionality: For fixed H, equality of carriers identifies bundled lattice data.); `IntegralHermitianLattice.map` (functoriality: Transport along a hermitian isometry; identity and composition laws.).
(Source: Li–Zhang, *Kudla–Rapoport cycles*, §1.7, physical p.8; §3 hypotheses, physical p.15.)
*Needs:* Mathlib `Submodule.IsLattice`, `LinearMap.IsSymm`, `LinearMap.Nondegenerate`.
**Checks.**
- For rank one over an unramified quadratic extension, H(x,y)=star(x)y on O_F is integral and self-dual.
- Replacing conjugate transpose by ordinary transpose on the complex vector (i) changes its Gram value from 1 to −1.
- An integral hermitian lattice with nonunit Gram determinant is nondegenerate over F but not self-dual over O_F.

**2.7.2 Hermitian dual lattice.** Construct `IntegralHermitianLattice.dual`: For a nondegenerate integral hermitian lattice L in V, define L∨={x∈V : H(x,L)⊆R}; under the stable involution this equals the right-dual condition H(L,x)⊆R. This is a full finite R-lattice over a Dedekind domain; integrality is equivalent to L⊆L∨. Self-duality means equality, not just equality of generic spans.
*Hypotheses.* R is Dedekind and stable under the involution; H is nondegenerate on the generic fibre. No finiteness of residue fields is needed until cardinalities are used.
*API.* `IntegralHermitianLattice.dual` (constructor: The submodule defined by integral pairings.); `IntegralHermitianLattice.mem_dual_iff` (characterisation: Membership is equivalent to all pairings with L lying in R.); `IntegralHermitianLattice.dual_dual` (relation: The double dual equals L under the stated Dedekind/nondegeneracy hypotheses.); `IntegralHermitianLattice.integral_iff_le_dual` (characterisation: Integrality is exactly L⊆L∨.).
(Source: Li–Zhang, *Kudla–Rapoport cycles*, §1.7, physical pp.8–9.)
*Needs:* 2.7 `IntegralHermitianLattice.ofCarrier`, 2.2 (descent of a lattice from a dvr completion).
**Checks.**
- For rank-one Gram π^a over an unramified extension, the dual of O_F e is π^−a O_F e.
- The Gram-1 lattice is self-dual; Gram-π lattice is integral but not self-dual.
- The zero-dimensional lattice equals its dual and has zero discriminant length.

**2.7.3 Fundamental invariants of a local hermitian lattice.** Construct `HermitianLatticeInvariants.ofDualQuotient`: For an integral nondegenerate O_F-hermitian lattice L of rank n over a DVR, attach the unique ordered a₁≤…≤a_n with a_i≥0 and L∨/L≅⊕O_F/π^{a_i}; define val(L)=Σa_i and t(L)=#{i:a_i>0}. Vertex means a_i∈{0,1}; self-dual means all a_i=0.
The `Suggested.lean` carrier is stated for any principal ideal domain `R` with an element `π` and any module `M`; the discrete-valuation-ring, uniformiser and torsion hypotheses are those of the theorems.
*Hypotheses.* The quotient is measured by O_F-length; q is the size of the residue field of F₀ when F/F₀ is unramified quadratic. A_i=0 contributes the zero summand; n=0 has length/type 0.
*API.* `HermitianLatticeInvariants.ofDualQuotient` (constructor: The ordered DVR elementary-divisor exponents.); `HermitianLatticeInvariants.valuation` (data: Sum of the exponents, equal to O_F-length.); `HermitianLatticeInvariants.type` (data: Number of positive exponents.); `HermitianLatticeInvariants.selfDual_iff` (characterisation: Self-duality iff valuation is zero.); `HermitianLatticeInvariants.vertex_iff` (characterisation: Vertex iff every exponent is 0 or 1.).
(Source: Li–Zhang, *Kudla–Rapoport cycles*, §1.7, physical p.8.)
*Needs:* 2.7 `IntegralHermitianLattice.dual`, 2.5 (dvr torsion decomposition comparison), 2.5 (ordered elementary divisor uniqueness), 2.5 (uniformizer independence), 2.5 (dvr length and cardinality comparison).
**Checks.**
- Rank one with Gram π³ has val=3 and type=1; it is not a vertex lattice.
- Invariants (0,1,1) give val=2, type=2 and a vertex lattice.
- The cardinality of L∨/L is q^{2 val(L)} in an unramified quadratic extension, not q^{val(L)}.

### 2.8 Quaternionic hermitian lattices

**2.8.1 Quaternionic integral hermitian lattices.** Construct `QuaternionicIntegralHermitianLattice.ofOrderStableCarrier`: An embedded full central-ring lattice L in a right quaternion module is stable under the chosen star-stable quaternion order O. A nondegenerate pairing h has h(xa,yb)=star(a)h(x,y)b and h(y,x)=star(h(x,y)); integrality means h(L,L)⊂O. The right module is represented by the opposite-ring action and the quaternion algebra and standard involution by an actual algebra-isomorphism model.
*Hypotheses.* Characteristic-zero central fraction field, standard-involution quaternion algebra, order full over the central ring, and a right module whose opposite-ring action is compatible with central scalar multiplication. The pairing is perfect on the generic space; integral regularity is an additional condition.
*API.* `QuaternionicIntegralHermitianLattice.ofOrderStableCarrier` (constructor: The actual O-stable R-lattice and quaternionic pairing.); `QuaternionicIntegralHermitianLattice.order` (projection: Retain the coefficient order and its involution.); `QuaternionicIntegralHermitianLattice.localize` (functoriality: Localize order, lattice and pairing simultaneously.).
(Source: Emery–Kim 2022, §5.1, printed pp.10–11.)
*Needs:* 2.2 `IntegralQuadraticLattice.ofCarrier`, QuadraticFormInvariants Layer 2.
**Checks.**
- For a star-stable quaternion order O, H(x,y)=star(x)y on O satisfies the integral pairing condition.
- Taking reduced trace of H(1,1)=1 gives 2, so reduced-trace metric normalization is a separate comparison.
- Changing the order changes the integral-isometry problem even when the ambient quaternion algebra is unchanged.

**2.8.2 Quaternion order involution stability.** Prove: For a quaternion order over the number ring, standard involution preserves the order.
(Source: Emery–Kim 2022, §5.1, printed p.10.)
*Needs:* 2.8 `QuaternionicIntegralHermitianLattice.ofOrderStableCarrier`.

**2.8.3 Quaternion right twisted dual.** Prove: For a right order module L, its dual of right-linear maps to the order becomes a right module by (f·a)(x)=star(a)f(x). The adjoint x↦h(x,−) is right-linear for this action.
(Source: Emery–Kim 2022, §5.1, printed pp.10–11.)
*Needs:* 2.8 `QuaternionicIntegralHermitianLattice.ofOrderStableCarrier`, 2.8 (quaternion order involution stability).

**2.8.4 Unit diagonal quaternion regularity.** Prove: On a free right order module with diagonal hermitian coefficients central units a_i, the adjoint is an isomorphism, with inverse on dual basis e_i*↦e_i a_i^−1.
(Source: Emery–Kim 2022, Lemma 5.1 and full proof, printed p.11.)
*Needs:* 2.8 (quaternion right twisted dual).

**2.8.5 Split quaternion stabilizer comparison.** Prove: For a PID R with fraction field K, a split order O⊗R≅M2(R) and a regular free rank-r right hermitian module, its unitary stabilizer identifies with Sp_(2r)(R) inside the generic unitary group identified with Sp_(2r)(K).
(Source: Emery–Kim 2022, Lemma 5.2 and full proof, printed pp.11–12.)
*Needs:* 2.8 (unit diagonal quaternion regularity).

### 2.9 Signed hermitian forms over a local field of odd residue characteristic

*Standing hypotheses.* Nonarchimedean local fields of odd residue characteristic; commutative trivial or quadratic extension with its specified involution.

**2.9.1 Odd local quadratic norms.** Prove: For a quadratic local extension F/F0 of odd residue characteristic, norms are the base-field units/elements lying in F-squares at even base valuation, together with negatives of F-squares at odd base valuation. In the unramified case they are exactly elements of even base valuation.
(Source: Kurinczuk–Skodlerack–Stevens, Lemma 3.1 and full proof, printed pp.10–11.)
*Needs:* 2.7 `IntegralHermitianLattice.ofCarrier`.

**2.9.2 Signed hermitian determinant comparison.** Prove the comparison: The determinant of a nondegenerate ε-hermitian field space is a well-defined class modulo the norm group, and changes by N(det B) under basis change; for the trivial extension the quotient is by squares. For a hyperbolic plane the class is −ε.
(Source: Kurinczuk–Skodlerack–Stevens, §3.2, printed pp.12–13.)
*Needs:* 2.7 `IntegralHermitianLattice.ofCarrier`, 2.1 (field discriminant comparison), 2.9 (odd local quadratic norms).

**2.9.3 Signed hermitian twist.** Construct `signedHermitianTwist`: For perfect ε-hermitian h and invertible endomorphism a with adjoint(a)=ηa, η=±1, put h_a(v,w)=h(v,aw). This is perfect ηε-hermitian and its adjoint is b↦a^−1 adjoint(b)a.
*API.* `signedHermitianTwist` (constructor: Compose the perfect sesquilinear form in its second variable with the given unit endomorphism.); `signedHermitianTwist_apply` (simp: Evaluate as h(v,aw).); `signedHermitianTwist_adjoint` (compatibility: The endomorphism adjoint is conjugated by a, with the displayed order.).
(Source: Kurinczuk–Skodlerack–Stevens, §3.3, printed pp.13–14.)
*Needs:* 2.7 `IntegralHermitianLattice.ofCarrier`.
**Checks.**
- a=1 leaves h unchanged.
- A scalar of negative involution changes hermitian to skew-hermitian.
- a=0 fails perfectness in positive rank and is excluded.

**2.9.4 Odd local signed Witt comparison.** Prove the comparison: The exact-category Witt quotient for finite signed-hermitian vector spaces identifies with the anisotropic-class Witt group. For a quadratic extension it has order four, C2×C2 when −1 is a norm and C4 otherwise. The trivial-extension alternating case is zero; the orthogonal case imports the field Witt theory.
(Source: Kurinczuk–Skodlerack–Stevens, §3.4, Proposition 3.12, printed p.14.)
*Needs:* 2.9 (odd local quadratic norms), QuadraticFormInvariants Layer 4.

**2.9.5 Signed Witt scalar twisting.** Prove the comparison: For γ≠0 with involution(γ)=ηγ, scalar twisting induces an additive equivalence Wε(F/F0)→Wηε(F/F0), with inverse twist by γ^−1.
(Source: Kurinczuk–Skodlerack–Stevens, §3.4, printed p.14.)
*Needs:* 2.9 `signedHermitianTwist`, 2.9 (odd local signed witt comparison).

**2.9.6 Signed hermitian transfer.** Construct `signedHermitianTransfer`: For finite E/F with extending involutions and a nonzero involution-equivariant F-linear map λ:E→F, restriction of scalars with λ∘h gives a perfect ε-hermitian form. It sends a hyperbolic E-plane to [E:F] hyperbolic F-planes and induces a Witt homomorphism.
*API.* `signedHermitianTransfer` (constructor: Transfer an actual sesquilinear field form using a nonzero equivariant functional.); `signedHermitianTransfer_apply` (simp: Evaluate as λ(h(v,w)).); `signedHermitianTransfer_hyperbolic` (compatibility: A hyperbolic plane transfers to [E:F] hyperbolic planes.); `signedHermitianTransfer_witt` (functoriality: The induced additive map on the exact Witt quotients.).
(Source: Kurinczuk–Skodlerack–Stevens, §3.5, printed p.15.)
*Needs:* 2.9 (odd local signed witt comparison), QuadraticFormInvariants Layer 9.
**Checks.**
- E=F and λ=id give the identity.
- A hyperbolic plane transfers to degree-many hyperbolic planes.
- The zero linear functional on a positive-rank space is degenerate and is excluded.
- Over 𝔽₂ the diagonal bilinear plane with matrix diag(1,1) has the isotropic line (1,1), but is nonalternating since B((1,0),(1,0))=1. Thus a Lagrangian alone cannot define a hyperbolic bilinear form in characteristic two; the Lean hyperbolic predicate requires 2≠0.

**2.9.7 Signed transfer image independence.** Prove: For a self-dual extension E=F[β] with involution β↦−β, the image of the signed Witt transfer does not depend on the nonzero equivariant functional λ.
(Source: Kurinczuk–Skodlerack–Stevens, Proposition 3.13(i) and proof, printed p.15.)
*Needs:* 2.9 `signedHermitianTransfer`, 2.9 (signed witt scalar twisting).

**2.9.8 Signed transfer maximal element.** Prove: For the self-dual extension, transfer sends the unique maximal anisotropic Witt class to the target maximal class.
(Source: Kurinczuk–Skodlerack–Stevens, Proposition 3.13(ii) and printed proof, printed p.15; Skodlerack–Stevens, *Intertwining semisimple characters for p-adic classical groups*, Theorem 4.4, Proposition 4.6 and Lemma 4.7 with proofs, printed pp.13–14, supply the cited transfer argument.)
*Needs:* 2.9 (signed transfer image independence).

**2.9.9 Signed transfer parity injectivity.** Prove: Outside the alternating trivial-extension case, for a self-dual E=F[β] extension, signed transfer is injective separately on the even and the odd anisotropic-dimension classes. It need not be globally injective.
(Source: Kurinczuk–Skodlerack–Stevens, Proposition 3.14 and full proof, printed p.15.)
*Needs:* 2.9 (signed transfer maximal element), 2.9 (odd local signed witt comparison).

### Examples

`ℤ ⊂ ℚ` with `q(x) = x²` is an integral quadratic lattice whose polar pairing `2xy` is not unimodular. `ℤ` and `2ℤ` in `(ℚ, x²)` are not in one genus. Over `ℤ₂` the form `[1,1,1]` (that is `x² + xy + y²`) is atomic and binary; the substitution `(x,y) ↦ (x + y/3, y/3)` shows that the coefficient triple of an atomic presentation is not an isometry invariant. For `q = xy` the product of the reflections in `(1,1)` and `(1,2)` is `diag(2, 1/2)`, with spinor norm `[2]`, a nonsquare unit at `3` and outside the spin image at `2`. The Lipschitz order in Hamilton’s quaternions with `h(x,y) = x̄y` is a quaternionic integral hermitian lattice.

### Dependencies

QuadraticFormInvariants Layers 1, 2, 3, 4, 5, 6 and 9; GlobalQuadraticForms Layers 5 and 6; Completed IntegralLattices Layers 1, 2 and 4; OrthogonalSpinGroups Layers 1–3 and RepresentationTheory/SpinRepresentations Layer 2 for the spinor norm and the spin cover; AdelicAlgebraicGroups AA.1 for finite adelic points; Mathlib `Submodule.IsLattice`, `QuadraticMap`, `LinearMap.BilinForm.dualSubmodule`, `Quaternion`, the DVR and PID module theory.

## Layer 3: Representation densities, mass and theta coefficients

This layer counts. Over a finite field with an involution it counts hermitian representations and embeddings (3.1); over an unramified quadratic extension of a nonarchimedean local field it defines the hermitian local representation density as a limit of normalised finite-level counts, with the empty-generic-fibre branch made explicit, constructs the normalised Siegel polynomial `D_L` and proves the Cho–Yamauchi overlattice formula and the functional equation (3.2). Over a totally real number field it proves finiteness of definite stabilizers and of the class set of a definite genus, defines the mass of a genus as a weighted class sum, identifies it with an adelic volume quotient under explicitly fixed Haar measures, and states the mass formula for the genus of maximal integral lattices with its exact local table (3.3). The theta series of a positive definite ℤ-lattice and its coefficients are defined in 3.4; their modularity is not.

### 3.1 Hermitian representation counts over finite fields

**3.1.1 Finite hermitian representation counts.** Define `hermitianRepresentationCount`: For a finite commutative star ring A and hermitian Gram matrices G of size m and B of size n, count all m×n matrices X with XᴴGX=B. This is a finite count of form-preserving maps, including noninjective maps when the source form is degenerate.
*Hypotheses.* m,n may be zero; star is part of the input. The target space is rank m and the represented/source lattice is rank n.
*API.* `hermitianRepresentationCount` (constructor: Finite cardinality of XᴴGX=B.); `hermitianRepresentationCount_empty` (simp: The empty source has count 1.); `hermitianRepresentationCount_basisChange` (functoriality: Invertible source/target coordinate changes induce a bijection of representation sets.).
(Source: Li–Zhang, *Kudla–Rapoport cycles*, §3.1, definition of Rep_{M,L}, physical p.15.)
*Needs:* Mathlib `Matrix.conjTranspose`.
**Checks.**
- Over Z/3 with trivial star, m=n=1, G=B=1 gives 2 maps.
- With G=1,B=0 over Z/3 the count is 1: the zero map.
- For n=0 there is one empty-column representation, for every ambient rank.

**3.1.2 Finite hermitian embedding counts.** Define `hermitianEmbeddingCount`: For the same finite matrices, count solutions XᴴGX=B whose associated A-linear map A^n→A^m is injective. Over finite fields this is equivalent to column rank n; with a degenerate source it is stronger than the representation equation.
*Hypotheses.* The finite-field formula uses the extension F_{q²}/F_q with its nontrivial involution. Injectivity is not substituted by invertibility unless m=n.
*API.* `hermitianEmbeddingCount` (constructor: Finite count with the actual injectivity condition.); `hermitianEmbeddingCount_empty` (simp: Count is 1 for n=0.); `hermitianEmbeddingCount_le` (relation: Embedding count is at most representation count.); `hermitianEmbeddingCount_eq_of_nonsingular` (compatibility: Over a field with nonsingular source, every representation is injective.).
(Source: Li–Zhang, *Kudla–Rapoport cycles*, Proof of Theorem 3.5.1, physical p.18, finite hermitian isometries.)
*Needs:* 3.1 `hermitianRepresentationCount`.
**Checks.**
- Over Z/3, G=1,B=0 at rank one gives 0 embeddings but 1 representation.
- For an empty source the unique map is injective and the count is 1.
- When n>m over a field the embedding count is zero.

**3.1.3 Finite-field hermitian isometry formula.** Prove: For an n-dimensional F_{q²}/F_q-hermitian source with radical dimension a and a nondegenerate m-dimensional target, m≥n, the number of injective isometries is q^{n(2m−n)} ∏_{i=0}^{n+a−1}(1−(−q)^{i−m}).
*Hypotheses.* q is a prime power ≥2; the involution is x↦x^q. Count embeddings, not all maps from a degenerate source.
(Source: Li–Zhang, *Kudla–Rapoport cycles*, Proof of Theorem 3.5.1, physical p.18.)
*Needs:* 3.1 `hermitianEmbeddingCount`.
**Checks.**
- n=m=1,a=0 gives q+1 norm-one elements.
- n=m=1,a=1 gives 0 embeddings.
- n=0,a=0 gives the empty product 1.

### 3.2 Local densities and Siegel polynomials

**3.2.1 Normalized finite-level hermitian counts.** Define `normalizedHermitianCount`: For N≥1 let A_N=O_F/π^N, reduce fixed integral source/target Gram matrices of ranks n≤m to A_N, and let q=#k_{F₀}. Set a_N=hermitianRepresentationCount(G_N,B_N)/q^{N n(2m−n)}. Equivalently its numerator is #Rep_{M,L}(O_{F₀}/π^N), because the representation scheme is over O_{F₀}; it is not #Rep_{M,L}(A_N). The denominator uses q, not q².
The `Suggested.lean` definition takes the finite ring `A_N`, `q` and `N` as parameters and is total (with `q ≥ 2` the denominator is nonzero); the identification `A_N = O_F/π^N` with `q = #k_{F₀}` is a hypothesis of every theorem about it.
*Hypotheses.* F/F₀ is unramified quadratic and F₀ is a nonarchimedean local field of characteristic different from 2. The generic representation scheme is nonempty with dimension n(2m−n). This sequence does not by itself assert convergence.
*API.* `normalizedHermitianCount` (constructor: Finite count divided by q^{N n(2m−n)}.); `normalizedHermitianCount_empty` (simp: The empty-source count is 1.); `normalizedHermitianCount_basisChange` (compatibility: Integral invertible basis changes preserve every normalized count.).
(Source: Li–Zhang, *Kudla–Rapoport cycles*, §3.1 local density definition, physical p.15.)
*Needs:* 3.1 `hermitianRepresentationCount`, 2.7 `IntegralHermitianLattice.ofCarrier`.
**Checks.**
- For n=0 the normalized count is 1 at every level.
- For m=n=1 the exponent is N, not 2N.
- A generic empty representation problem is not treated as a smooth nonempty scheme of the stated dimension.

**3.2.2 Hermitian local representation density.** Construct `hermitianLocalDensity`: In the stated unramified local-field setting, Den(M,L) is the limit of normalized finite-level representation counts. For nonempty generic fibre use its specified dimension and the source existence theorem. For empty generic fibre set Den(M,L)=0; eventual emptiness of the finite-level counts proves agreement with the limit for any fixed exponent. Its finite value and integral-basis independence are part of the construction.
*Hypotheses.* The unramified analytic density branch allows residue characteristic 2; geometric §3.4 hypotheses are not assumed throughout §3. Haar measures on lattice coordinates assign volume 1 to the integral coordinate lattice before any self-dual Fourier normalization is applied.
*API.* `hermitianLocalDensity` (constructor: The proved limit of normalized counts.); `hermitianLocalDensity_tendsto` (characterisation: The normalized sequence tends to the stated density.); `hermitianLocalDensity_basisChange` (compatibility: Integral isometries preserve the density.); `hermitianLocalDensity_emptyGeneric` (simp: An empty generic representation fibre has density zero.).
(Source: Li–Zhang, *Kudla–Rapoport cycles*, §§3.1–3.2, physical pp.15–16.)
*Needs:* 3.2 `normalizedHermitianCount`, 2.7 `HermitianLatticeInvariants.ofDualQuotient`, 3.2 (eventually empty integral representation counts). **Gap:** existence and finiteness of the nonempty analytic density limit need a stabilization argument; the finite-field count and the empty-fibre lemma do not provide it.
**Checks.**
- Density of the empty source is 1.
- The denominator and measure use q=#k_{F₀}; substituting q² changes the limit.
- A ramified quadratic extension cannot reuse the unramified formula without a new theorem.
- An empty generic representation fibre has density zero, although initial finite reductions can still admit solutions.

**3.2.3 Eventually empty integral representation counts.** Prove: For complete discrete valuation fields in the stated unramified hermitian setting, if the generic representation scheme Rep(M,L)(F0) is empty, there is N0 such that every integral Gram representation count modulo pi^N is zero for N>=N0. Consequently every fixed-power normalized count is eventually zero and its limit is zero.
*Hypotheses.* The unramified analytic density branch allows residue characteristic 2; geometric §3.4 hypotheses are not assumed throughout §3. Haar measures on lattice coordinates assign volume 1 to the integral coordinate lattice before any self-dual Fourier normalization is applied.
(Source: Li–Zhang, *Kudla–Rapoport cycles*, Li–Zhang §3.1, physical p.15, definition of the count.)
*Needs:* 3.1 `hermitianRepresentationCount`.
**Checks.**
- For a rank-one target of norm 1 and source of norm pi, reduction modulo pi has a zero-vector solution, while modulo pi^2 no solution can have norm of valuation one. Generic emptiness implies eventual zero, not zero at every finite level.

**3.2.4 Normalized hermitian Siegel polynomial.** Construct `normalizedSiegelPolynomial`: For an integral nondegenerate unramified hermitian lattice L of rank n, construct the unique D_L∈Z[X] such that D_L((−q)^−k)=Den(⟨1⟩_{n+k},L)/Den(⟨1⟩_{n+k},⟨1⟩_n) for every integer k≥0. The denominator is ∏_{i=1}^n(1−(−q)^−i(−q)^−k).
*Hypotheses.* q≥2 and the extension is unramified quadratic. The interpolating polynomial and its integral coefficients require a proof, not a generic choice of a function through finitely many values.
*API.* `normalizedSiegelPolynomial` (constructor: The integral normalized density polynomial.); `normalizedSiegelPolynomial_eval` (characterisation: Evaluate at (−q)^−k to recover the specified density ratio.); `normalizedSiegelPolynomial_selfDual` (simp: Polynomial equals 1 for a self-dual lattice.); `normalizedSiegelPolynomial_isometry` (functoriality: Integral hermitian isometries preserve the polynomial.).
(Source: Li–Zhang, *Kudla–Rapoport cycles*, §3.2, physical p.16.)
*Needs:* 3.2 `hermitianLocalDensity`, 2.7 `HermitianLatticeInvariants.ofDualQuotient`. **Gap:** polynomial interpolation and integral coefficients require Hironaka’s density-polynomial theorem and the lattice-counting argument of 3.2.6; a limit alone supplies neither.
**Checks.**
- For a rank-one lattice with valuation a, D_L(X)=Σ_{i=0}^a(−X)^i.
- A self-dual lattice has polynomial 1.
- Using q^−k instead of (−q)^−k loses the alternating sign.

**3.2.5 Cho–Yamauchi weight polynomial.** Define `choYamauchiWeight`: For q≥2 and a∈N define m_q(a;X)=∏_{i=0}^{a−1}(1−(−q)^i X) in Z[X], with empty product m_q(0;X)=1. The derivative weight is −m_q(a;X)′ at X=1; for a=0 it is 0, and for a≥1 it is ∏_{i=1}^{a−1}(1−(−q)^i).
*Hypotheses.* The negative base is in Z before taking powers. Polynomial empty weight 1 and derivative empty weight 0 are distinct.
*API.* `choYamauchiWeight` (constructor: The integral polynomial finite product.); `choYamauchiWeight_zero` (simp: Empty polynomial weight is 1.); `choYamauchiWeight_succ` (relation: m(a+1;X)=m(a;X)(1−(−q)^a X).); `choYamauchiWeight_derivative` (relation: The negative derivative at 1 is 0 for a=0 and the stated product for a>0.).
(Source: Li–Zhang, *Kudla–Rapoport cycles*, §3.5 before Theorem 3.5.1, physical p.17.)
*Needs:* Mathlib `Polynomial`, `Polynomial.derivative`.
**Checks.**
- m_q(0;X)=1, derivative weight 0.
- m_q(1;X)=1−X, derivative weight 1.
- m_q(2;X)=(1−X)(1+qX), derivative weight 1+q.

**3.2.6 Cho–Yamauchi hermitian density formula.** Prove: D_L(X)=Σ_{L⊆L′⊆(L′)∨} X^{2 length_{O_F}(L′/L)} m_q(t(L′);X), summing over integral overlattices of L. The sum is finite because every such L′ lies between L and L∨.
*Hypotheses.* Unramified quadratic extension of a local field of characteristic different from 2, including dyadic residue characteristic in this analytic statement. Length is over O_F; t is the number of positive fundamental invariants.
(Source: Li–Zhang, *Kudla–Rapoport cycles*, Theorem 3.5.1 and proof, physical pp.17–18.)
*Needs:* 3.2 `normalizedSiegelPolynomial`, 3.2 `choYamauchiWeight`, 2.7 `IntegralHermitianLattice.dual`, 2.7 `HermitianLatticeInvariants.ofDualQuotient`, 3.1 (finite-field hermitian isometry formula). **Gap:** the hermitian smooth integral representation model, including the dyadic case, and its normalized count comparison are needed to pass from finite-field isometries to the limit. Li–Zhang p.18 uses Cho–Yamauchi Corollary 3.11 and Gan–Yu Lemma 5.5.2 and §9 for this step; those inputs have no target or lower-tier supplier here.
**Checks.**
- For valuation-one rank one, D=1−X and the negative derivative is 1.
- For valuation-three rank one, D=1−X+X²−X³ and the negative derivative is 2.
- A self-dual L contributes just L with type 0 and polynomial 1.

**3.2.7 Hermitian Siegel polynomial functional equation.** Prove: For integral nondegenerate L, D_L(X)=(−X)^{val(L)}D_L(X^−1), interpreted in the Laurent polynomial ring. If val(L) is odd then D_L(1)=0.
*Hypotheses.* The val(L) parity and the negative sign are retained.
(Source: Li–Zhang, *Kudla–Rapoport cycles*, §3.2 (3.2.0.2), physical p.16.)
*Needs:* 3.2 `normalizedSiegelPolynomial`, 2.7 `HermitianLatticeInvariants.ofDualQuotient`. **Gap:** the functional-equation proof cited by Li–Zhang is Hironaka 2012, Theorem 5.3; this input is not reduced to the polynomial construction here.
**Checks.**
- Rank-one D=1−X at valuation 1 satisfies D(X)=−X D(X^−1).
- At valuation 2, D=1−X+X² and D(1)=1, so the odd-valuation vanishing does not extend to even valuation.

### 3.3 Finite stabilizers, genus classes and mass

**3.3.1 Finite integral isometry stabilizers.** Prove: The integral isometry group of a totally positive number-field quadratic lattice is finite, by restriction through all real embeddings to a positive-definite real lattice.
*Hypotheses.* Definiteness and full finite generation are essential; indefinite lattices can have infinite isometry groups.
(Source: Voight, *Quaternion algebras*, Definition 9.7.13.)
This variant constructs the number-ring restriction-of-scalars comparison through all real embeddings.
*Needs:* 2.4 `IntegralGenus.localIsometry`, 1.2 `finite_gauge_sublevel`. **Gap:** restriction of scalars must supply a positive real metric compatible with every archimedean embedding and a discrete full underlying ℤ-lattice; the genus definition does not construct this comparison.
**Checks.**
- For (Z,x²) the isometry group is {±1}, so its mass weight is 1/2.
- Positive definiteness cannot be dropped: Pell-type indefinite rank-two lattices have infinite stabilizers.

**3.3.2 Finiteness of a positive-definite genus class set.** Prove: The integral-isometry class set of a fixed totally positive quadratic genus over a number ring is finite.
*Hypotheses.* A fixed determinant/discriminant ideal and archimedean signatures belong to the genus data. This is finiteness of classes, not finiteness of all embedded lattices.
(Source: Voight, *Quaternion algebras*, Definition 9.7.13 and local-global finite-support lattice conventions, printed pp.141,146.)
This variant retains coefficient ideals in the number-ring reduction.
*Needs:* 2.4 `IntegralGenus.localIsometry`, AdelicAlgebraicGroups AA.3. **Gap:** finite adelic volume alone does not imply finiteness of a discrete double-coset set. A number-ring reduction or compactness argument with coefficient ideals and a proof source must be supplied; Voight’s definition is not that finiteness theorem.
**Checks.**
- Infinitely many embedded coordinate changes can represent one integral-isometry class.
- The rank-one positive unimodular Z-genus has one class, though its isometry group has two elements.

**3.3.3 Weighted genus mass.** Define `genusMass`: For a positive-definite genus with its proved finite class set, mass(L)=Σ_[M] 1/|O(M)| as a positive rational number. Proper mass uses proper classes and SO(M) separately; neither is substituted for the other without an index comparison.
*Hypotheses.* Finite automorphism groups and a finite class set are supplied before summing. Their orders are positive because they contain the identity. The total Lean finite-sum adapter permits zero orders with inverse zero, but such inputs are outside arithmetic mass. Unweighted class number and mass are different invariants.
*API.* `genusMass` (constructor: Finite sum of rational reciprocal integral-isometry stabilizer orders.); `genusMass_representative` (compatibility: The summand is independent of the chosen representative.); `genusMass_singleton` (simp: A singleton class set has mass the reciprocal stabilizer order.); `genusMass_pos` (relation: A nonempty finite positive genus has strictly positive mass.).
(Source: Voight, *Quaternion algebras*, §9.7 genus class set.)
This variant is over a number ring; its index comparison is a separate target.
*Needs:* 3.3 (finite integral isometry stabilizers), 3.3 (finiteness of a positive-definite genus class set).
**Checks.**
- The rank-one positive unimodular genus has ordinary mass 1/2, not class number 1.
- For proper rank-one classes the stabilizer is trivial and proper mass is 1.
- Changing representatives cannot change the stabilizer cardinality.

**3.3.4 Adelic weighted mass identity.** Prove: Let q be totally positive over a totally real number field, G=SO(q), and K_f the integral stabilizer of a fixed lattice in its finite adelic genus. For compatible product Haar measures with convergent product vol(K_f), proper mass equals vol(G(K)\G(A))/(vol(G(K∞))·vol(K_f)). Every double-coset contribution is the reciprocal order of the proper integral stabilizer.
*Hypotheses.* Use proper SO classes and weights consistently. Local measures, archimedean measure and the convergent product are fixed before numerical evaluation. The numerator is not replaced by 2 until a separate Tamagawa-number theorem is supplied; low-rank tori have separate behavior.
(Source: double-coset integration in Gan–Hanke–Yu §7, printed pp.118–119; Benoist physical pp.5–7 supplies the quotient/Haar convention.)
*Needs:* 3.3 `genusMass`, AdelicAlgebraicGroups AA.2, AdelicAlgebraicGroups AA.3.
**Checks.**
- Rescaling one local Haar measure changes the numerator and local factor compatibly.
- For proper rank-one classes the SO stabilizer is trivial and mass equals class count. A proper class whose stabilizer has order four contributes 1/4; for example SO(Z^2,x^2+y^2) has order four.
- The numerical constant 2 is not an assumption-free formula for SO of rank 1 or 2.

**3.3.5 Mass formula for maximal integral lattices.** Prove: Let K be totally real of degree d≥2, Q a totally positive nondegenerate m-dimensional form, m≥3, and Λ the genus of maximal integral O_K-lattices. With ordinary O-isometry mass, r=floor(m/2), G=SO(Q), 2 mass(Λ)=2 γ_G^d |disc K|^(dim G/2) L(G) ∏_p λ_p(Q). Here dim G=r(2r−(−1)^m); γ_G=∏_(i=1)^r(2i−1)!/(2π)^(r(r+1)) for odd m and (r−1)!∏_(i=1)^(r−1)(2i−1)!/(2π)^(r²) for even m. L(G)=∏_(i=1)^r ζ_K(2i) for odd m; ζ_K(r)∏_(i=1)^(r−1)ζ_K(2i) for even m with square discriminant; otherwise [ζ_E(r)/ζ_K(r)] N(d_E/K)^(r−1/2)∏_(i=1)^(r−1)ζ_K(2i), E=K(√disc Q). The local λ_p are `maximalLocalMassFactor` below; they are distinct from the hermitian normalized density polynomial of 3.2.
*Hypotheses.* Maximal integrality is essential. Do not apply this formula to arbitrary lattices or indefinite forms. The leading two multiplies the ordinary O mass; τ(SO)=2, the compatible Tamagawa measures, and the evaluation of the archimedean volume require separate proofs. **Gap:** AA.2–AA.3 supply Haar measures and finite volume, but no target here supplies these numerical evaluations or the Dedekind-zeta functional-equation conversion used by this formula. The finite exceptional product and convergent positive-integer zeta Euler products are required.
(Source: Kirschmer, *One-class genera of maximal integral quadratic forms*, pp.3–4, Definition 3.1, Proposition 3.2 and Theorem 3.3; Gan–Hanke–Yu, *On an exact mass formula of Shimura*, §6 Tables 3–4, printed pp.115–116, and Propositions 7.4–7.5, pp.119–120.)
*Needs:* 3.3 `genusMass`, 3.3 (adelic weighted mass identity), 2.4 `IntegralGenus.localIsometry`.
**Checks.**
- Class number one implies mass=1/|Aut L|; it is not an unweighted class count.
- The formula is restricted to m≥3; binary zeta-at-one substitution is excluded.
- A dyadic exceptional factor is retained rather than set to one.

**3.3.6 Ordinary and proper number-ring mass comparison.** Prove: In positive rank, for the genus of a totally positive lattice over a number ring, the sum of the proper masses of the proper genera inside its ordinary genus is twice its ordinary mass. The rational group `O(Q)(K)` has two determinant components (a reflection supplies determinant −1). When an ordinary class has an improper integral automorphism it gives one proper class with an index-two proper stabilizer; otherwise it gives two proper classes with unchanged stabilizer. Both cases double its total weight. This comparison concerns the entire ordinary genus; no equality of a single proper genus with that sum is assumed.
(Source: orbit–stabilizer deduction from the `O`/`SO` class sets of Kirschmer §2, p.3, and Gan–Hanke–Yu §7, pp.118–119.) *Needs:* 3.3.1–3.3.3, field reflection generation of QuadraticFormInvariants Layer 1.
**Checks.**
- The positive rank-one ordinary class has stabilizer order 2 and mass 1/2; its proper mass is 1.
- If an ordinary stabilizer has order 4 and has no improper automorphism, its two proper classes contribute 1/4+1/4=1/2.
- In rank zero `O=SO` is trivial, so both masses are 1 and the doubling formula is excluded.

**3.3.7 Local invariants for maximal-lattice mass.** Define `MaximalMassLocalType` with cases `zero`, `I`, `IIPlus`, `IIMinus`, `II`, `IIIPlus`, `IIIMinus`. For a characteristic-zero nonarchimedean local field, rank `m≥3`, and diagonal form with coefficients `a_i`, use the **signed** discriminant `d_Q=(−1)^{m(m−1)/2}∏a_i` and Hasse invariant `c=∏_{i<j}(a_i,a_j)`. Its Witt sign is `ω=c` for `m≡1,2 (mod 8)`, `c(−1,−1)` for `m≡5,6`, `c(−1,d_Q)` for `m≡0,3`, and `c(−1,−d_Q)` for `m≡4,7`. For odd rank the nonzero types are `I` when `v(d_Q)` is even and `ω=−1`, and `IIPlus` or `IIMinus` when `v(d_Q)` is odd, according to `ω`. For even rank they are `I` when `d_Q` is square and `ω=−1`; `II` when the nonsquare discriminant extension is unramified and `ω=−1`; and `IIIPlus` or `IIIMinus` when that extension is ramified, according to `ω`. All other cases have type `zero`. This classification includes dyadic fields; it does not extend the characteristic-zero table to equal characteristic two.
*API.* `MaximalMassLocalType` names the table cases; `maximalMassWittSign` implements the rank-mod-eight conversion; `maximalMassLocalType` selects a case from rank, valuation parity, square class, ramification and Witt sign, and `maximalMassLocalType_basisChange` proves that a basis change preserves it.
(Source: Kirschmer §2, equation (1) and Table 1, pp.2–3; Gan–Hanke–Yu §6, pp.114–116.) *Needs:* 2.1 field invariants, local Hilbert symbols and quadratic-extension ramification from QuadraticFormInvariants Layers 5–6.
**Checks.**
- `⟨1,1⟩` has determinant 1 but signed discriminant −1; the split plane `⟨1,−1⟩` has signed discriminant 1.
- At odd rank and odd discriminant valuation the signs +1 and −1 select different `II` cases; at even valuation the positive sign has type `zero`.
- At even rank a ramified nonsquare discriminant has a `III` type for either sign, including residue characteristic 2; its local factor is not 1.

**3.3.8 Maximal-lattice local mass factors.** Define the rational function `maximalLocalMassFactor(q,r,odd,t)` for residue cardinality `q≥2`, rank `2r+1≥3` when `odd`, and rank `2r≥4` otherwise. Type `zero` gives 1. For odd rank, type `I` gives `(q^{2r}−1)/(2(q+1))`, and type `IIPlus` or `IIMinus` gives `(q^r±1)/2`. For even rank, type `I` gives `(q^{r−1}−1)(q^r−1)/(2(q+1))`, type `II` gives `(q^{r−1}+1)(q^r+1)/(2(q+1))`, and either `III` type gives `1/2`. The function is used only with the compatible types of 3.3.7. The only denominators are 2 and `2(q+1)`, which are nonzero in ℚ.
*API.* `maximalLocalMassFactor` evaluates the rational table; `maximalLocalMassFactor_zero` is its good-place value; `maximalLocalMassFactor_odd_I`, `maximalLocalMassFactor_even_II`, and `maximalLocalMassFactor_even_III` pin the exceptional factors. The local comparison identifies these factors with the reductive-quotient factors of the smooth integral stabilizer model, including its component group. **Gap:** the smooth stabilizer models and their reductive quotients are not supplied here; a dyadic naive orthogonal group scheme cannot replace them.
(Source: Kirschmer Definition 3.1, p.4; Gan–Hanke–Yu Tables 3–4, pp.115–116, Proposition 6.12 and its remarks, p.116.) *Needs:* 3.3.7, finite reductive-group orders and smooth integral stabilizer models.
**Checks.**
- At `q=2,r=1`, odd types `I`, `IIPlus`, `IIMinus` give respectively `1/2,3/2,1/2`.
- At `q=3,r=2`, even types `I`, `II`, `IIIPlus` give respectively `2,5,1/2`.
- Good type `zero` gives 1 at `q=2`; ramified even type `IIIMinus` gives `1/2`, so dyadic factors cannot all be dropped.

### 3.4 Theta series and their coefficients

**3.4.1 The theta series of a positive definite lattice and its coefficients.** Define `latticeThetaSeries`: For a positive definite integral lattice `L` (the Completed IntegralLattices carrier: a full ℤ-submodule of a rational space with a symmetric rational form `B` that is integral on `L`), define `latticeThetaSeries L τ = Σ_{x ∈ L} exp(π i τ B(x,x))` for `τ` in the upper half-plane, and prove that the sum converges absolutely and locally uniformly, so that it is holomorphic; and that, writing `q = exp(π i τ)`, the coefficient of `q^m` is the representation number `r_L(m) = #{x ∈ L : B(x,x) = m}` (Tau Ceti `IntegralLattice.representationNumber`), which is finite by 1.2.2. For an even lattice the series is a power series in `exp(2π i τ)` with coefficient `#{x : B(x,x)/2 = m}` at `m`. Modularity of the series is not stated in this roadmap.
*Hypotheses.* Positive definiteness is essential: for an indefinite or negative definite form the series diverges. An odd lattice has half-norms in `½ℤ`, so the `exp(2π i τ)`-expansion convention applies only to even lattices.
*API.* `latticeThetaSeries_summable` (convergence: absolute, locally uniform summability on the upper half-plane); `latticeThetaSeries_coeff` (the coefficient of `q^m` is `r_L(m)`); `latticeThetaSeries_directSum` (`Θ_{L ⊕ M} = Θ_L · Θ_M`); `latticeThetaSeries_rescale` (`Θ_{L(a)}(τ) = Θ_L(aτ)` for an integer `a > 0`); `latticeThetaSeries_coeff_even` (the even-lattice expansion in `exp(2π i τ)`).
(Source: Conway–Sloane, *Sphere packings, lattices and groups*, Chapter 2 §2.3; Duke 1988, printed p. 74.)
*Needs:* Completed IntegralLattices Layer 1, Tau Ceti `IntegralLattice.representationNumber` (IntegralLattices milestone 2B), 1.2 `finiteGaugeSublevel`, 4.4 `gaussian_lattice_summable`.
**Checks.**
- For `L = ℤ` with `B(x,y) = xy` the coefficient of `q` is `2`, of `q²` and `q³` is `0`, and of `q⁴` is `2`.
- For `L = ℤ²` with the standard form the coefficient of `q` is `4` and of `q²` is `4`.
- The rank-zero lattice has theta series `1`.
- For `L = ℤ` with `B(x,y) = xy`, the half-norm of `1` is `½`, so the series is not a power series in `exp(2π i τ)`; the even convention does not apply.

### Examples

Over `𝔽_{q²}/𝔽_q` the embedding count of the zero rank-one source into an anisotropic rank-one target is `0`, while its representation count is `1`. For a rank-one hermitian lattice of valuation `a` the Siegel polynomial is `Σ_{i=0}^{a} (−X)^i`, and a self-dual lattice has polynomial `1`. The norm form `x² + y² = 3` over the unramified quadratic extension of `ℚ₃` has one solution modulo `3` and none modulo `9`: initial finite levels can be nonempty while the density is `0`. The square lattice `ℤ²` has four proper isometries, so its single proper class contributes `1/4` to the proper mass.

### Dependencies

Layers 1 and 2; AdelicAlgebraicGroups AA.2 (quotient and Tamagawa measures) and AA.3 (reduction and finite volume); the existing ℤ-lattice supplier contracts in the boundaries section; Mathlib `ZMod`, `Nat.card`, the finite-quotient and Haar-measure API.

## Layer 4: Lattice points, star bodies and homogeneous dynamics

This layer has four independent branches. Lattice-point counting (4.1) proves Henk’s bound `#(L ∩ K) < 2^{d−1} ∏ (⌊2/λ_i⌋ + 1)` through the sublattice and first-minimum bounds, and states Davenport’s multiset estimate for bounded semialgebraic regions with its uniform constant. Homogeneous dynamics (4.2–4.3) states, with their exact hypotheses, Howe–Moore decay of matrix coefficients, ergodicity of noncompact subgroup actions, Dani–Margulis nondivergence, Ratner’s orbit-closure, measure-classification and equidistribution theorems, and the two arithmetic applications: Margulis’s theorem on values of irrational indefinite forms and Duke’s equidistribution of lattice points on spheres. Packing, covering and transference (4.4) go through the Gaussian-sum argument of Regev’s lecture, with the lattice Poisson summation it needs stated as a target; star bodies, critical determinants, the existence of critical lattices and Mahler’s compactness criterion are 4.5; Siegel’s mean value theorem is 4.6; the real-metric form of Construction A is 4.7.

### 4.1 Lattice-point counting

**4.1.1 Counting by differences in finite-index cosets.** Prove `ncard_le_index_mul`: For an additive commutative group G, finite-index subgroup N, sets S,T⊆G with T finite, suppose x,y∈S and x−y∈N imply x−y∈T. Then S is bounded in cardinality by |S|≤[G:N]·|T|, with both cardinalities the natural cardinal. No finiteness assumption on S is needed: the proof injects it into a finite set.
*Hypotheses.* N has finite index; T is finite. No topology, convexity, lattice, or prior finiteness of S is required.
(Source: Henk, *Successive minima and lattice points*, §2, Lemma 2.1 proof, p.4.)
*Needs:* Mathlib `Subgroup.index`, `AddSubgroup.FiniteIndex`, `Subgroup.finite_quotient_of_finiteIndex`, `QuotientGroup.eq_iff_div_mem`, `Nat.card_le_card_of_injective`, `Nat.card_prod`, `Nat.card_coe_set_eq`.
**Checks.**
- The empty subset of Z has natural cardinal zero.
- For N={0} in Z, N.index=0 but |{0}|=1; finite-index hypotheses are essential.

**4.1.2 Henk’s sublattice counting lemma.** Prove `henk_sublattice_count`: Let E be a finite-dimensional real normed space, L a discrete full integral lattice, M≤L a submodule with nonzero finite relative index m=[L:M], and K a symmetric convex body with 0 in its interior. Then |L∩K|≤m·|M∩2K|. Counts include boundary points and the origin. In real inner-product coordinates with canonical volume and full M, the already-built index/covolume formula identifies m=covol(M)/covol(L), exactly as in Henk Lemma 2.1.
*Hypotheses.* L is discrete and full; M≤L; M.toAddSubgroup.relIndex(L.toAddSubgroup)≠0. K is compact convex, 0∈interior K, and x∈K implies −x∈K. Dimension zero is allowed.
(Source: Henk, *Successive minima and lattice points*, §2, Lemma 2.1 and its complete proof, p.4.)
*Needs:* Mathlib `Subgroup.relIndex`, `Set.ncard_image_of_injective`, `Convex.midpoint_mem`, `ConvexBody.convex`, `gauge_le_of_mem`, `ZLattice.covolume_div_covolume_eq_relIndex'`, `ZLattice.covolume_pos`, 4.1 `ncard_le_index_mul`, 1.2 `finite_gauge_sublevel`.
**Checks.**
- The set {−1,0,1} has three elements, {−2,0,2} has three elements, and 3≤2·3.
- The singleton consisting of the zero function Fin 0→Z has cardinal one.

**4.1.3 Counting separated points in integral basis residues.** Prove `ncard_le_pow_of_no_congruent`: Let G be an additive commutative group with an integral basis b indexed by Fin n, let q≥1 be a natural number, and let S⊆G. Suppose x,y∈S and x−y=qz for some z∈G imply x=y. Then |S|≤q^n. The basis is an integral basis of all G, not merely an independent family; n=0 is included.
*Hypotheses.* b:Basis(Fin n,Z,G); q is a positive natural number. Separation is modulo qG. No topology or prior finiteness of S is required.
(Source: Henk, *Successive minima and lattice points*, §2, p.4, inequality (1.3) deduction after Lemma 2.1.)
*Needs:* Mathlib `AddSubgroup.index_range_nsmul`, `Module.finrank_eq_card_basis`, 4.1 `ncard_le_index_mul`.
**Checks.**
- The residue images of −1,0,1 in ZMod 3 have cardinal three.
- In ZMod 2 the integers 0 and 2 have equal residue, although they differ in Z.
- Nat.card(ZMod 0)=0; this does not make ZMod 0 finite.

**4.1.4 Excluding nonzero points in a dilated sublattice.** Prove `homothetic_lattice_avoidance`: For a discrete full integral lattice L in finite-dimensional real normed E, a convex body K with 0 in its interior, d=dim E>0, and q≥1 natural with 2/q<λ_0(L,K), one has (qL)∩2K={0}. Here qL is the pointwise real scalar image of the lattice set. Symmetry is not needed for this lemma.
*Hypotheses.* d>0, q>0, and the threshold is strict: 2/q<λ_0. L is discrete/full and K has zero in its interior.
(Source: Henk, *Successive minima and lattice points*, §2, p.4, inequality (1.3) deduction after Lemma 2.1.)
*Needs:* 1.2 `successiveMin_first_le_iff`.
**Checks.**
- An integer divisible by 3 with absolute value at most 2 is zero.
- 2 is nonzero, divisible by 2, and has absolute value at most 2; also 2/2=1.

**4.1.5 Lattice-point bound from the first minimum.** Prove `lattice_count_le_first_minimum`: For a discrete full integral lattice L in finite-dimensional real normed E of positive dimension d and a symmetric convex body K with 0 in its interior, |L∩K|≤(floor(2/λ_0(L,K))+1)^d. The floor is the natural floor of the positive real argument; λ_0 is the source's first minimum. Counts include closed boundary points. This is Henk (1.3), not Conjecture 1.4 and not the stronger Theorem 1.5.
*Hypotheses.* d>0; L discrete/full; K compact convex symmetric about zero with 0 in its interior.
(Source: Henk, *Successive minima and lattice points*, p.2, inequality (1.3); §2 p.4, its complete deduction after Lemma 2.1.)
*Needs:* Mathlib `Module.finBasisOfFinrankEq`, `ZLattice.rank`, `instModuleFinite_of_discrete_submodule`, `instModuleFree_of_discrete_submodule`, `Nat.lt_floor_add_one`, `Convex.midpoint_mem`, `ConvexBody.convex`, `Set.ncard_image_of_injective`, 4.1 `ncard_le_pow_of_no_congruent`, 4.1 `homothetic_lattice_avoidance`, 1.2 `successiveMin_pos`.
**Checks.**
- The product {−1,0,1}×{−1,0,1} has cardinal nine, equal to (floor(2/1)+1)^2.
- For λ_0=3 the factor floor(2/λ_0)+1 is one.
- For minima 1/2 and 3, the first-minimum square bound is 25 while the last-minimum substitution gives 1<5.

**4.1.6 One step of divisibility-compatible rounding.** Prove `divisible_rounding_step`: For positive naturals q,m with m<2q, let n=m if q≤m and n=q+m−(q mod m) otherwise. Then q≤n<2q and m divides n.
*Hypotheses.* Subtraction is natural. Even when the remainder is zero the second branch advances to the next multiple; no least-multiple claim.
(Source: Henk, *Successive minima and lattice points*, p.4, two-case construction after (2.4).)
**Checks.**
- q=5,m=6 gives n=6.
- q=6,m=3 gives n=9, not 6; it still satisfies the strict upper bound.

**4.1.7 Backward rounding along a divisibility chain.** Prove `exists_divisible_rounding`: For any positive antitone q:Fin d→N there exists n with q_i≤n_i, n_i=q_i at the final index, n_i<2q_i at earlier indices, and n_j dividing n_i whenever i≤j.
*Hypotheses.* The empty family is allowed. Antitone means q_j≤q_i for i≤j. Positivity of n follows from q_i≤n_i.
(Source: Henk, *Successive minima and lattice points*, p.4, (2.4) and backward induction.)
*Needs:* 4.1 `divisible_rounding_step`.
**Checks.**
- q=(7,5,3) gives n=(12,6,3), with 3|6|12 and both earlier factors strictly below twice q.
- The empty factor product is one.

**4.1.8 Strict product loss from backward rounding.** Prove `divisible_rounding_product`: For d≥2, positive q, n_i≥q_i, final n_i=q_i and earlier n_i<2q_i imply ∏n_i<2^(d−1)∏q_i.
*Hypotheses.* Products are natural. This consequence needs no divisibility assumption.
(Source: Henk, *Successive minima and lattice points*, pp.4–5, (2.4)–(2.5).)
*Needs:* Mathlib `Finset.prod_lt_prod`.
**Checks.**
- 12·6·3=216<2²·7·5·3=420.
- For d=1,q=n=3 the strict assertion would be 3<3 and is false.

**4.1.9 Coordinate membership in a diagonal sublattice.** Prove `mem_diagonal_span_iff`: For an integral basis b:Fin d→G of an additive commutative group, x∈span_Z{n_i b_i} if and only if each n_i divides the integral coordinate b.repr(x)_i.
*Hypotheses.* The n_i are arbitrary naturals, including zero; use the Submodule.span and integral module structure.
(Source: Henk, *Successive minima and lattice points*, pp.4–5, lattice generated by n_i e_i.)
*Needs:* Mathlib `Module.Basis.sum_repr`.
**Checks.**
- Coordinates (4,6) satisfy divisibility by (2,3), while 3 is not divisible by 2.
- Zero divides an integer z exactly when z=0.

**4.1.10 Index of a diagonal sublattice.** Prove `diagonal_span_index`: The additive index of span_Z{n_i b_i} in the finite free integral module with basis b is ∏n_i.
*Hypotheses.* The n_i are arbitrary naturals. A zero factor gives infinite index and the index sentinel zero; all-positive factors give nonzero finite index. The empty product is one.
(Source: Henk, *Successive minima and lattice points*, p.4, determinant ratio of the diagonal sublattice.)
*Needs:* Mathlib `Module.Basis.equivFun`, `Subgroup.index_map_equiv`, `Subgroup.index_pi`, `Int.index_zmultiples`, 4.1 `mem_diagonal_span_iff`.
**Checks.**
- 2Z×3Z has index six.
- 2Z×{0} has natural index zero, not a positive finite cardinality.

**4.1.11 Diagonal sublattice avoids the doubled body.** Prove `diagonal_lattice_avoidance`: Given an integral basis with the strict minimum-flag property, positive n_i with n_j|n_i for i≤j and 2/n_i<λ_i, every point of span_Z{n_i b_i}∩2K is zero.
*Hypotheses.* E is a finite-dimensional real normed inner-product space, L a discrete full Z-submodule, and d=dim_R E. Reuse IsZLattice, Basis and Basis.flag. The minimum index i:Fin d is zero-based; dimension zero has no index. K is a ConvexBody with zero in its interior. Write λ_i=successiveMin L K i. Symmetry is imposed only on the final counting theorem. The exact flag hypothesis is the conclusion of integral-minimum-flag. Symmetry is unnecessary here.
(Source: Henk, *Successive minima and lattice points*, p.5, largest nonzero coordinate argument after (2.5).)
*Needs:* Mathlib `Module.Basis.sum_repr`, `Module.Basis.mem_flag_iff_repr_eq_zero`, `Module.Basis.ofZLatticeBasis_repr_apply`, `gauge_le_of_mem`, 4.1 `mem_diagonal_span_iff`.
**Checks.**
- No integer equals 2/3; division by the last factor is not integral without the divisibility condition.
- For Z and K=[−1,1], n=2 leaves the point 2 in nZ∩2K at the equality 2/n=λ_0=1.

**4.1.12 Henk's successive-minima lattice-point bound.** Prove `lattice_count_lt_successive_minima`: For d≥2 and centrally symmetric K, |L∩K|<2^(d−1)∏_{i<d}(floor(2/λ_i)+1). The count includes the origin and all boundary points.
*Hypotheses.* E is a finite-dimensional real normed inner-product space, L a discrete full Z-submodule, and d=dim_R E. Reuse IsZLattice, Basis and Basis.flag. The minimum index i:Fin d is zero-based; dimension zero has no index. K is a ConvexBody with zero in its interior. Write λ_i=successiveMin L K i. Symmetry is imposed only on the final counting theorem. Floor means the greatest integer at most the input. This is Theorem 1.5, not Conjecture 1.4.
(Source: Henk, *Successive minima and lattice points*, pp.3–5, Theorem 1.5 and (2.1)–(2.5).)
*Needs:* Mathlib `Nat.floor_mono`, `Nat.lt_floor_add_one`, `Subgroup.relIndex`, 1.2 `exists_integral_minimum_flag`, 1.2 `successiveMin_pos`, 1.2 `successiveMin_monotone`, 4.1 `exists_divisible_rounding`, 4.1 `divisible_rounding_product`, 4.1 `diagonal_span_index`, 4.1 `diagonal_lattice_avoidance`, 4.1 `henk_sublattice_count`.
**Checks.**
- For the standard unit square the nine points satisfy 9<2·3·3=18.
- A rectangle with minima (1,3) has three points and gives 3<2·3·1=6; its product factor 3 is below the first-minimum square factor 9.

**4.1.13 Davenport semialgebraic multiset estimate.** Prove: For n≥1, a bounded semialgebraic multiset R⊂R^n with maximum multiplicity m, given by at most k polynomial inequalities of degrees≤ell, and an upper or lower triangular unipotent image R′, the multiplicity-weighted integer count differs from vol(R) by at most C(n,m,k,ell)·max(1,max_{1≤d<n}vol_d(proj_d R)). Projections are coordinate projections of the original region R.
*Hypotheses.* The n=1 inner projection maximum is empty and the error bound uses 1. The complexity and multiplicity control the uniform constant; boundedness alone is not enough. General linear transformations are not silently treated as the triangular-unipotent variant.
(Source: Bhargava–Shankar, *Binary quartic forms*, Proposition 2.5, physical p.14; Davenport 1951 plus 1964 corrigendum identified separately.)
*Needs:* Mathlib `ZLattice.covolume`.
**Checks.**
- For an interval [0,N] with N integral, count−length=1.
- Counting a region twice multiplies both volume and point count; ignoring multiset multiplicity is wrong.
- The projection error for a triangular image refers to the original region as in Proposition 2.5.

### 4.2 Mixing, ergodicity and unipotent flows

**4.2.1 Howe–Moore matrix-coefficient decay.** Prove: For a connected noncompact almost-simple real Lie group G with finite centre and a strongly continuous unitary representation on a Hilbert space with no nonzero G-invariant vector, every matrix coefficient tends to 0 as g leaves all compact subsets of G.
*Hypotheses.* Strong continuity, unitarity, finite centre and almost simplicity are retained. For a semisimple product one must specify escape in every noncompact factor or the appropriate factor-invariant exclusions.
(Source: Benoist, *Arithmeticity of discrete subgroups*, Fact 3.3, physical p.20.)
*Needs:* RepresentationTheory/LieGroups Layer 2, AdelicAlgebraicGroups AA.2. **Gap:** the Lie-group structure and Haar measure do not supply the unitary-representation and matrix-coefficient argument; Benoist states this as a fact, rather than proving it.
**Checks.**
- A constant vector in the full L² quotient space has a nondecaying coefficient; remove constants before applying the theorem.
- Escaping only one factor of a product does not justify the unqualified product theorem.

**4.2.2 Ergodicity of a noncompact subgroup action.** Prove: Let G be connected noncompact almost-simple with finite centre, Γ a lattice and μ the invariant probability measure on G/Γ. Every closed noncompact subgroup H acts ergodically on (G/Γ,μ).
*Hypotheses.* Finite quotient volume is used to normalize μ; G is almost-simple, not an arbitrary product.
(Source: Morris, *Introduction to arithmetic groups*, Moore-ergodicity conventions in the standing setting, §4.10; consequence derived from the preceding matrix-coefficient target.)
*Needs:* 4.2 (howe–moore matrix-coefficient decay), AdelicAlgebraicGroups AA.2.
**Checks.**
- A compact subgroup does not meet the noncompactness hypothesis.
- For a semisimple product, a lattice quotient with factor-invariant functions requires an irreducibility/factor version instead.

**4.2.3 Dani–Margulis recurrence in the lattice space.** Prove: For d≥2, X=SL_d(R)/SL_d(Z), a one-parameter unipotent subgroup u_t, x∈X and epsilon>0, there exists a compact K⊂X such that for every T>0, Leb{t∈[0,T]:u_t x∈K}/T≥1−epsilon.
*Hypotheses.* K depends on x, epsilon and the flow. This is qualitative recurrence; no spectral rate or uniform compact set over all x is asserted.
(Source: Benoist, *Arithmeticity of discrete subgroups*, Fact 3.4, physical p.20.)
*Needs:* 1.5 `minkowski_second_upper`. **Gap:** Minkowski’s bound does not supply quantitative unipotent nondivergence, from which the recurrence statement follows. The source states the recurrence fact; its proof inputs are not constructed here.
**Checks.**
- A diagonal flow can diverge and cannot replace the unipotent flow.
- The statement controls every T>0 with a compact set containing the necessary initial trajectory segment.

**4.2.4 Ratner orbit-closure theorem.** Prove: For a connected linear semisimple real Lie group G, a lattice Γ, a connected subgroup U generated by one-parameter unipotent subgroups and x=gΓ, the closure of Ux is Lx for a connected closed subgroup L containing U, with L∩gΓg^−1 a lattice in L.
*Hypotheses.* The homogeneous orbit has finite invariant volume; the subgroup is generated by unipotent flows. A general diagonal orbit does not satisfy this conclusion.
(Source: Morris, *Introduction to arithmetic groups*, Theorem 20.1.3 and Remarks 20.1.4–20.1.5, printed pp.406–407; connected specialization.)
*Needs:* 4.2 (dani–margulis recurrence in the lattice space), RepresentationTheory/LieGroups Layer 2. **Gap:** recurrence and a Lie-group carrier do not supply Ratner’s rigidity argument. An original-proof contract and its intermediate analytic targets are still needed.
**Checks.**
- The orbit closure carries a finite L-invariant measure, not just an unspecified closed set.

**4.2.5 Ratner invariant-measure classification.** Prove: In the preceding homogeneous setting, every ergodic U-invariant probability measure on G/Γ is the unique normalized L-invariant measure on a closed finite-volume orbit Lx for a closed subgroup L containing U.
*Hypotheses.* U is connected and generated by one-parameter unipotent subgroups. Probability, invariance and ergodicity are separate hypotheses.
(Source: Morris, *Introduction to arithmetic groups*, Theorem 20.3.4, printed p.413.)
*Needs:* 4.2 (dani–margulis recurrence in the lattice space), RepresentationTheory/LieGroups Layer 2. **Gap:** recurrence and a Lie-group carrier do not supply Ratner’s rigidity argument. An original-proof contract and its intermediate analytic targets are still needed.
**Checks.**
- A convex combination of different homogeneous orbit measures need not be ergodic.
- Replacing probability by an arbitrary infinite invariant measure is outside the statement.

**4.2.6 Equidistribution of a unipotent orbit.** Prove: For a one-parameter unipotent flow u_t and x∈G/Γ, there is a closed finite-volume homogeneous orbit Lx containing u_t x and a normalized invariant probability μ_L such that T^−1∫_0^T f(u_t x)dt→∫f dμ_L for every continuous compactly supported f.
*Hypotheses.* The orbit measure is on the actual orbit closure, not necessarily all of G/Γ. No quantitative rate is inferred.
(Source: Morris, *Introduction to arithmetic groups*, Definition 20.3.2 and Theorem 20.3.3, printed pp.412–413.)
*Needs:* 4.2 (dani–margulis recurrence in the lattice space), 4.2 (ratner orbit-closure theorem), 4.2 (ratner invariant-measure classification). **Gap:** classification does not identify the limit of every orbit average; the original equidistribution proof and its no-escape and orbit-identification inputs are needed.
**Checks.**
- A closed periodic unipotent orbit equidistributes on itself, not on the full quotient.
- The limiting measure has mass 1; vague convergence with escaped mass would not satisfy the statement.

### 4.3 Oppenheim and Duke

Both applications rest on inputs that are stated here as targets with their own sources, so that nothing is left to an unnamed owner. For Duke’s theorem these are `halfIntegralCoefficientBound`: for a cusp form `f` of half-integral weight `k = ℓ + ½ ≥ 5/2` on `Γ_0(4N)` and a square-free `n`, the Fourier coefficient satisfies `a_f(n) ≪_{f,ε} n^{k/2 − 2/7 + ε}` (Source: Iwaniec, *Fourier coefficients of modular forms of half-integral weight*, Invent. Math. 87 (1987), Theorem 1); and `siegelLowerBound_r3`: for square-free `n ≢ 7 (mod 8)`, the number `r_3(n)` of representations of `n` as a sum of three squares satisfies `r_3(n) ≫_ε n^{1/2 − ε}` with an ineffective constant, through Gauss’s formula expressing `r_3(n)` for square-free `n` as an explicit multiple of the class number of primitive binary forms of discriminant `−n` or `−4n`, and Siegel’s theorem `h(−d) ≫_ε d^{1/2 − ε}` (Source: Duke 1988, printed p. 74, the two displayed inputs before Theorem 1). The deduction of Duke’s theorem from these two inputs and from the theta coefficient identity of 3.4 is the content of 4.3.2; its hypotheses are exactly those of its statement. Margulis’s theorem (4.3.1) uses only 4.2 and the closed-subgroup theorem.


**4.3.1 Margulis’s theorem on irrational quadratic values.** Prove: For n≥3, a real nondegenerate indefinite quadratic form q on R^n that is not proportional to a form with rational coefficients has q(Z^n) dense in R.
*Hypotheses.* Nondegeneracy, indefiniteness, dimension≥3 and irrationality up to scalar are all retained.
(Source: Morris, *Introduction to arithmetic groups*, Corollary 20.2.5 and three-variable proof, printed pp.410–411.)
*Needs:* 4.2 (ratner orbit-closure theorem), RepresentationTheory/LieGroups Layer 2.
**Checks.**
- An integral form has discrete values and is excluded.
- Positive-definite forms do not have values dense in all R.
- The n=2 form x²−(3+2√2)y² shows why dimension≥3 is required.

**4.3.2 Duke spherical lattice-point equidistribution.** Prove: As n→∞ through positive square-free integers n not congruent to 7 modulo 8, the normalized counting measure on {v/√n:v∈Z³,‖v‖²=n} converges to normalized rotation-invariant surface measure on S².
*Hypotheses.* The representation set is nonempty on the stated admissible sequence. No effective constant is claimed: the representation-number lower bound is ineffective.
(Source: Duke 1988, Introduction, printed p.74, before Theorem 1.)
*Needs:* 3.4 (integral lattice theta coefficient interface), 4.3 `halfIntegralCoefficientBound`. **Gap:** the required theta series has harmonic-polynomial weights and must be identified with a half-integral-weight cusp form. The unweighted theta coefficient interface of 3.4 does not supply this comparison or the ineffective representation-number lower bound.
**Checks.**
- n≡7 mod8 has no three-square representations and is excluded.
- A measure on primitive representations for nonsquare-free n is a different theorem.

### 4.4 Packing, covering and transference

**4.4.1 Euclidean lattice packing radius.** Define `latticePackingRadius`: For a positive-dimensional full Euclidean lattice L, its packing radius is half the attained shortest nonzero norm. In dimension zero set it to zero.
*Hypotheses.* Full rank and positive dimension are retained; zero dimension has a separate radius-0 convention.
*API.* `latticePackingRadius` (constructor: Half the attained first Euclidean minimum, zero in rank zero.); `latticePackingRadius_eq_half` (characterisation: In positive rank it is half the first Euclidean minimum.); `latticePackingRadius_smul` (functoriality: Positive scalar multiplication multiplies the packing radius by that scalar.).
(Source: Benoist, *Arithmeticity of discrete subgroups*, Physical pp.5–7 quotient/lattice conventions.)
*Needs:* Mathlib `ZLattice.covolume`, 1.2 `successiveMin_first_le_iff`.
**Checks.**
- For aZ in R, a>0, the packing radius is a/2.
- For Z² the packing radius is 1/2.
- In dimension zero the packing radius is zero.

**4.4.2 Euclidean lattice covering radius.** Define `latticeCoveringRadius`: For a full Euclidean lattice L, μ(L)=sup_x inf_{v∈L} ‖x−v‖. It is the maximum of the continuous periodic distance-to-L function on the compact quotient; dimension zero gives zero.
*Hypotheses.* Finite-dimensional real Euclidean ambient space; L is discrete and spans the ambient space.
*API.* `latticeCoveringRadius` (constructor: Supremum of the distance-to-lattice function.); `latticeCoveringRadius_attained` (relation: A point in a compact fundamental domain attains the radius.); `latticeCoveringRadius_smul` (functoriality: Positive scalar multiplication multiplies μ by the same scalar.).
(Source: Regev, *Transference theorems* (lecture 11), p.2, Definition 2 and Example 1.)
*Needs:* Mathlib `ZLattice.covolume`, `Metric.infEDist`, 1.2 `successiveMin_first_le_iff`.
**Checks.**
- For aZ in R with a>0, μ=a/2.
- For Z², μ=√2/2, larger than its packing radius 1/2.
- In dimension zero μ=0; a non-full-rank subgroup in positive dimension can have infinite ambient covering radius.

**4.4.3 Polar-body transference lower inequality.** Prove: For a full real Euclidean lattice L and symmetric convex body K with nonempty interior, λ_i(K,L)·λ_{n+1−i}(K°,L*)≥1 for 1≤i≤n, where K° is the inner-product polar and L* the pairing-integral dual.
*Hypotheses.* Use the same inner-product and intrinsic dimension on both sides. The sharp upper transference and covering bounds require separate source theorems; they are not exported by this elementary lower bound.
(Source: Lenstra–Lenstra–Lovász 1982, Proposition 1.11 uses the same integral-coefficient norm floor; transference is a separate deduction from the polar pairing, not an attributed LLL theorem.)
*Needs:* 1.2 `exists_successiveMin_witnesses`, 0.3 `covolume_dual`.
**Checks.**
- For L=Z^n and K=product_i[-a_i,a_i], a_i>0, the polar is the cross-polytope sum_i a_i|y_i|<=1. The ordered minima of K are sorted reciprocals 1/a_i and those of its polar are sorted a_i, so the oppositely indexed products equal one.
- An arbitrary real pairing has no integer ≥1 floor.

**4.4.4 Lattice Gaussian sum.** Define `latticeGaussianSum`: For s>0 define ρ_s(x)=exp(-π||x||²/s²) and ρ_s(L+u)=Σ_{x∈L}ρ_s(x+u), using the countable sum of real values.
*API.* `latticeGaussianSum` (constructor: The countable Gaussian sum on the lattice subtype.); `latticeGaussianSum_zeroRank` (simp: The sum in rank zero is 1.); `latticeGaussianSum_translate` (relation: Integral shifts preserve the sum.); `latticeGaussianSum_scale` (compatibility: Simultaneous positive scaling of L,u,s preserves the sum.).
(Source: Regev, *Transference theorems* (lecture 11), Lecture 11, Definition 2, p.2 and Poisson identities p.3.)
**Checks.**
- For rank zero the sum is 1.
- For L=aZ and s=a the unshifted sum equals that for Z at s=1.
- For u∈L the shifted sum equals the unshifted sum.

**4.4.5 Gaussian lattice summability.** Prove: For a full discrete lattice and s>0, the Gaussian and every polynomial-weighted Gaussian are absolutely summable over lattice translates.
(Source: Regev, *Transference theorems* (lecture 11), Lecture 11 p.3, justification required for its Poisson use.)
*Needs:* 4.4 `latticeGaussianSum`.

**4.4.6 Gaussian lattice Poisson comparison.** Prove: ρ_s(L+u)=covol(L)^(-1)s^n Σ_{y∈L*}ρ_(1/s)(y) exp(2πi<y,u>); in particular ρ_s(L)=covol(L)^(-1)s^nρ_(1/s)(L*).
(Source: Regev, *Transference theorems* (lecture 11), Lecture 11 p.3, equations preceding Lemma 5.)
*Needs:* 4.4 (gaussian lattice summability), 0.3 `covolume_dual`.

**4.4.7 Shifted Gaussian maximum.** Prove: For every translate u, ρ_s(L+u)≤ρ_s(L).
(Source: Regev, *Transference theorems* (lecture 11), Lecture 11 Lemma 5, p.3.)
*Needs:* 4.4 (gaussian lattice poisson comparison).

**4.4.8 Gaussian scale upper bound.** Prove: For s≥1, ρ_s(L+u)≤s^nρ_1(L).
(Source: Regev, *Transference theorems* (lecture 11), Lecture 11 Lemma 6, p.3.)
*Needs:* 4.4 (shifted gaussian maximum), 4.4 (gaussian lattice poisson comparison).

**4.4.9 Shifted Gaussian tail bound.** Prove: For n≥1, the sum of ρ_1 over (L+u) outside the open radius-√n ball is at most c^nρ_1(L), where c=2 exp(-3π/4)<1/4.
(Source: Regev, *Transference theorems* (lecture 11), Lecture 11 Lemma 7, p.4.)
*Needs:* 4.4 (gaussian scale upper bound).

**4.4.10 Dual Gaussian error bound.** Prove: For n≥1, if λ₁(L)>√n, put R=ρ_1(L\{0}). Then R≤c^n/(1-c^n), with c as in the shifted-tail lemma.
(Source: Regev, *Transference theorems* (lecture 11), Lecture 11 Corollary 8, pp.4–5; explicit-constant strengthening.)
*Needs:* 4.4 (shifted gaussian tail bound).

**4.4.11 Poisson approximation error.** Prove: For every u, |ρ_1(L*+u)-covol(L)|≤covol(L)R, where R=ρ_1(L\{0}).
(Source: Regev, *Transference theorems* (lecture 11), Lecture 11 Lemma 9, p.5.)
*Needs:* 4.4 (gaussian lattice poisson comparison).

**4.4.12 Gaussian covering contradiction.** Prove: For n≥1, if λ₁(L)>√n, then no translate of L* can avoid the closed √n-ball. The lower estimate 1-R and upper estimate c^n(1+R) contradict each other since c^n<1/3.
(Source: Regev, *Transference theorems* (lecture 11), Lecture 11 Theorem 4, pp.5–6.)
*Needs:* 4.4 (dual gaussian error bound), 4.4 (poisson approximation error), 4.4 (shifted gaussian tail bound).

**4.4.13 Euclidean successive-minima transference.** Prove: For a full rank-n Euclidean lattice L, n≥1, and 1≤i≤n, λ_i(L)λ_(n+1−i)(L*)≤n, where L* is defined by integral inner products and both bodies are the Euclidean unit ball.
*Hypotheses.* The n constant here is Euclidean; it is not asserted for arbitrary polar convex bodies.
(Source: Regev, *Transference theorems* (lecture 11), p.1, Theorem 1 and Remark 1, citing Banaszczyk 1993.)
*Needs:* 4.4 (polar-body transference lower inequality). **Gap:** this only supplies the lower bound. Regev’s proof controls the endpoint minimum through the covering radius; its Remark 1 attributes the all-index upper bound to Banaszczyk. The all-index proof needs its own target-level input and an accessible original proof.
**Checks.**
- For aZ in R, the product is one.
- For Zⁿ, each product is one and is at most n.
- In dimension one every full lattice has paired Euclidean minima product one, attaining the upper bound n=1.

**4.4.14 Covering radius and reciprocal shortest vector.** Prove: For a full rank-n Euclidean lattice L, n≥1, 1/2≤μ(L)λ_1(L*)≤n. The upper constant n is the uniform estimate proved in Regev’s lecture.
*Hypotheses.* Full rank, positive dimension and the actual Euclidean reciprocal lattice.
(Source: Regev, *Transference theorems* (lecture 11), p.2, Claim 3 and Theorem 4.)
*Needs:* 4.4 `latticeCoveringRadius`, 4.4 (polar-body transference lower inequality), 4.4 (gaussian covering contradiction).
**Checks.**
- For aZ in R the product is 1/2.
- For Zⁿ the product is √n/2.
- An asymptotic 0.1275+o(1) constant from Aggarwal–Stephens-Davidowitz is not a uniform small-rank constant.

### 4.5 Star bodies, critical determinants and Mahler compactness

**4.5.1 Compact star bodies from homogeneous gauges.** Define `CompactStarBody.ofGauge`: A compact star body is specified by a continuous positive homogeneous function p:V→R_{≥0} with p(x)=0 iff x=0, p(t x)=t p(x) for t≥0, and compact unit sublevel K={p≤1}. Convexity is not assumed. Nonzero lattice avoidance and critical determinants use this body, rather than the convex-body API without its hypotheses.
*Hypotheses.* Finite-dimensional real V; the compactness/properness condition is explicit. The body contains a neighborhood of zero.
*API.* `CompactStarBody.ofGauge` (constructor: The actual continuous definite homogeneous gauge and compact unit sublevel.); `CompactStarBody.radial` (characterisation: Positive radial scaling is governed by p(tx)=t p(x).); `CompactStarBody.admissible` (data: No nonzero lattice point in the interior.); `CompactStarBody.convexComparison` (compatibility: When the unit sublevel is convex, compare to the ConvexBody.).
(Source: Benoist, *Arithmeticity of discrete subgroups*, Mahler statement physical p.7 motivates compactness.)
**Checks.**
- The Euclidean norm gives a convex star body.
- p(x,y)=(√|x|+√|y|)² gives a compact nonconvex star body: (1,0),(0,1) lie in it but their midpoint does not.
- A gauge vanishing along a nonzero ray fails the stated definiteness/compactness conditions.

**4.5.2 Critical determinant.** Define `criticalDeterminant`: For a compact star body K in finite-dimensional Euclidean E (including rank zero), Δ(K) is the infimum of covolumes of full discrete Z-lattices L with (int K)∩L={0}, equivalently p_K(x)≥1 for all nonzero lattice vectors (`int K` is the interior, not the polar body). A critical lattice attains this infimum.
*API.* `criticalDeterminant` (constructor: Infimum over admissible full lattices.); `criticalDeterminant_le_covolume` (relation: Δ(K)≤covolume(L) for each admissible full L.); `criticalDeterminant_mono` (relation: Body inclusion K⊂H implies Δ(K)≤Δ(H).); `criticalDeterminant_smul` (compatibility: Δ(aK)=a^n Δ(K), a>0.).
(Source: Mahler 1946, §6, Definition 3 and Theorems 6–7, printed pp.158–159.)
*Needs:* 4.5 `CompactStarBody.ofGauge`.
**Checks.**
- For p(x)=|x| on R, Δ=1 and Z is critical.
- For p(x)=|x|/2 on R, Δ=2 and 2Z is critical.
- For the Euclidean rank-zero convention Δ=1, the zero lattice is critical; the positive-dimension positivity proof is not used.

**4.5.3 Interior ball of a star body.** Prove: There is ρ>0 such that the Euclidean open ball B(0,ρ) lies in the strict gauge sublevel p<1.
(Source: Mahler 1946, §6, proof of Theorem 6, printed p.158.)
*Needs:* 4.5 `CompactStarBody.ofGauge`.

**4.5.4 Admissible dilation lattice.** Prove: There exists an admissible full lattice for every bounded star body: scale an orthonormal Z-basis lattice past a bound for its unit sublevel.
(Source: Mahler 1946, Worker orthonormal-basis construction from compact boundedness; background Definition 3 and Theorem 6, §6 printed p.158.)
*Needs:* 4.5 `CompactStarBody.ofGauge`.

**4.5.5 Positive critical determinant.** Prove: In positive dimension, Δ(K)>0: every admissible lattice has covolume at least the Minkowski threshold for an interior Euclidean ball.
(Source: Mahler 1946, §6, Theorem 6, printed p.158.)
*Needs:* 4.5 `criticalDeterminant`, 4.5 (interior ball of a star body), Mathlib `MeasureTheory.exists_ne_zero_mem_lattice_of_measure_mul_two_pow_lt_measure` and its compact `le` form.

**4.5.6 Critical minimizing sequence.** Prove: There is a sequence of admissible lattices whose covolumes converge to Δ(K), bounded above by a fixed positive number and with every shortest nonzero vector at least ρ.
(Source: Mahler 1946, §7, proof of Theorem 8, printed pp.158–159.)
*Needs:* 4.5 (positive critical determinant), 4.5 (admissible dilation lattice), 4.5 (interior ball of a star body).

**4.5.7 Closed admissibility under basis convergence.** Prove: If bases b_m converge to an independent basis b and their integer spans are K-admissible, then the integer span of b is admissible.
(Source: Mahler 1946, §7, proof of Theorem 8, printed p.159; asymmetric gauge extension uses the same argument.)
*Needs:* 4.5 `CompactStarBody.ofGauge`.

**4.5.8 Mahler compactness criterion.** Prove: For n≥2 and X_n=SL_n(R)/SL_n(Z), the closed set of covolume-one lattices whose shortest nonzero norm is at least epsilon>0 is compact. A subset is relatively compact iff its first minimum is uniformly bounded below away from zero.
*Hypotheses.* Covolume normalization and closedness for compactness are explicit. Relative compactness does not require the subset itself to be closed.
(Source: Benoist, *Arithmeticity of discrete subgroups*, Fact 1.5, physical p.7.)
*Needs:* 1.5 `minkowski_second_upper`, AdelicAlgebraicGroups AA.3.
**Checks.**
- diag(t,t^−1)Z² escapes compact sets as t→∞ because its first minimum tends to 0.
- A nonclosed subset with a uniform first-minimum bound is relatively compact, but need not be compact.

**4.5.9 Critical lattice existence.** Prove: Every compact star body in finite-dimensional Euclidean space has a critical full lattice.
(Source: Mahler 1946, §7, Theorem 8 and its complete proof, printed pp.158–159.)
*Needs:* 4.5 (critical minimizing sequence), 4.5 (mahler compactness criterion), 4.5 (closed admissibility under basis convergence).

### 4.6 Siegel’s mean value theorem

**4.6.1 Siegel lattice mean-value theorem.** Prove: For n≥2, invariant probability μ on X_n=SL_n(R)/SL_n(Z), and integrable f:R^n→R, its lattice transform Σ_{v∈L\{0}}f(v) is integrable on X_n and its μ-integral equals the Lebesgue integral of f. For nonnegative measurable f the Tonelli version permits infinity.
*Hypotheses.* Zero vectors are excluded; μ has total mass 1 and lattices have covolume 1. n=1 is excluded. Integrability of the lattice transform is a theorem, not an assumption silently imported from integrability of f.
(Source: Benoist, *Arithmeticity of discrete subgroups*, Physical pp.5–7 invariant lattice-space measure conventions; exact Siegel source remains a recorded acquisition gap.)
*Needs:* AdelicAlgebraicGroups AA.2, 4.5 (mahler compactness criterion).
**Checks.**
- Including v=0 adds f(0) and changes the formula.
- In dimension one the single lattice Z does not give the Lebesgue mean-value formula.

### 4.7 Lattices from codes

**4.7.1 Construction A real-lattice comparison.** Prove the comparison: For a linear code C⊂F_p^n, take the Construction A lattice of AlgebraicCodingTheory Layer 6 and identify its unscaled real realization {x∈Z^n:x mod p∈C} with covolume p^{n−dim C}. The rescaled realization p^−1/2L has covolume p^{n/2−dim C}; unimodularity/integrality/evenness require the cited roadmap’s exact self-duality and parity hypotheses.
*Hypotheses.* p is prime and C is linear; no code-distance statement alone supplies integral Gram conditions. Construction A itself is owned by AlgebraicCodingTheory layer 6.
(Source: AlgebraicCodingTheory Layer 6, Construction A index and discriminant; real covolume follows from the index and scalar-dilation identities of Layer 0.)
AlgebraicCodingTheory Layer 6 proves the discriminant `m^n/(#C)²` and the duality `P_m(C)^∨ = P_m(C^⊥)`; the statement here is only the real covolume of the unscaled and rescaled realisations.
*Needs:* Mathlib `ZLattice.covolume`, AlgebraicCodingTheory Layer 6.
**Checks.**
- For the zero code, the unscaled lattice is pZ^n and has covolume p^n.
- For the whole code it is Z^n with covolume 1.

### Examples

For `d≥2`, `ℤ^d` and the cube `[−1,1]^d` Henk’s bound gives `#(L ∩ K) = 3^d < 2^{d−1} · 3^d`. For `d=1` the proposed strict inequality is equality; for `d=0` the lattice-point count is one. The binary form `x² − (3+2√2)y²` has no nonzero value in `(−1,1)`, so its values are not dense. To check this, put `a=|x|`, `b=|y|`, `α=1+√2`, `α′=1−√2`. For a nonzero integer pair, `N=a²−2ab−b²` is a nonzero integer and `|x²−α²y²|=|N|(a+αb)/(a−α′b)≥1`. A claim that the value set is discrete is stronger and is not needed. `n ≡ 7 (mod 8)` has no representation as a sum of three squares and is excluded from Duke’s sequence. For `d≥1`, the packing radius of `ℤ^d` is `½` and its covering radius is `√d/2`, so the product of the covering radius with the first minimum of the dual is between `½` and `d`. The zero code gives the lattice `pℤ^n` of covolume `p^n`; the full code gives `ℤ^n`.

### Dependencies

Layers 0, 1 and 3; RepresentationTheory/LieGroups Layer 2 for the closed-subgroup theorem and the matrix groups; AdelicAlgebraicGroups AA.2 and AA.3 for the invariant measures and finite volume of `SL_n(ℝ)/SL_n(ℤ)`; AlgebraicCodingTheory Layer 6; Mathlib `Metric.infDist`, `Real.Gamma`, the Gaussian integral and the `ZMod` counting API.

## Layer 5: Certified LLL reduction

This layer is the Lenstra–Lenstra–Lovász reduction with every step certified: the exact Gram–Schmidt coefficients `μ_{ij}` over an ordered real basis, the reduced-basis condition with `δ = 3/4`, the approximation factor `2^{(n−1)/2}` for the first vector, and an algorithm whose output comes with an integer change-of-basis certificate that is checked against the input lattice. The elementary transitions (a nearest-integer shear, an adjacent swap) are separate lemmas with explicit formulas for the new orthogonalised vectors and coefficients (5.2); termination is proved from the integer prefix-Gram potential, which strictly decreases at every swap, together with the cursor position in a lexicographic measure (5.3); the assembled reduction and its verification theorem are 5.4. Floating-point output is never a proof here: all Gram data is exact and rational.

### 5.1 Gram–Schmidt coefficients and reduced families

**5.1.1 Gram–Schmidt reduction coefficients.** Define `lllCoefficient`: For a real inner-product space and a family b:Fin n→V, set μ_{ij}=⟨b_i,b*_j⟩/‖b*_j‖² using the ordered gramSchmidt b. Reduced-basis theorems require linear independence so denominators for relevant j are nonzero; the total function still uses the zero-division convention.
*Hypotheses.* Indices are zero based; size reduction concerns j<i only. Exact rational Gram data is retained for certified arithmetic; floating approximations do not discharge inequalities.
*API.* `lllCoefficient` (constructor: The Gram–Schmidt inner-product ratio.); `lllCoefficient_eq` (simp: Evaluation equals the stated ratio.); `lllCoefficient_orthogonal` (relation: Off-diagonal coefficient is zero for an orthogonal family.); `lllCoefficient_denominator_pos` (relation: Independent input gives a strictly positive squared denominator.).
(Source: Lenstra–Lenstra–Lovász 1982, §1, (1.2)–(1.3), physical p.2.)
*Needs:* Mathlib `InnerProductSpace.gramSchmidt`, `InnerProductSpace.gramSchmidt_ne_zero`.
**Checks.**
- For b=((1,0),(1/2,1)) the coefficient μ₁₀ is 1/2.
- For an orthogonal family, off-diagonal reduction coefficients vanish.
- For dependent input b*_j can be zero; the total coefficient does not certify a reduced basis.

**5.1.2 LLL-reduced independent families.** Define `IsLLLReduced`: An LLL-reduced family at δ=3/4 is linearly independent, has |μ_{ij}|≤1/2 for j<i, and for each adjacent j<i with i=j+1 satisfies ‖b*_i‖²≥(3/4−μ_{ij}²)‖b*_j‖². A basis of the input lattice is required separately by output certificates.
*Hypotheses.* The equality boundary is accepted; swaps occur for strict failure. The empty family is reduced by vacuity; positive-rank approximation statements assume n≥1.
*API.* `IsLLLReduced` (constructor: The concrete independence, size and Lovász predicate.); `IsLLLReduced.linearIndependent` (projection: Return independence.); `IsLLLReduced.size` (projection: Return |μ_{ij}|≤1/2 for j<i.); `IsLLLReduced.lovasz` (projection: Return the adjacent δ=3/4 inequality.).
(Source: Lenstra–Lenstra–Lovász 1982, §1, (1.4)–(1.5), physical pp.2–3.)
*Needs:* 5.1 `lllCoefficient`.
**Checks.**
- The standard orthonormal basis is reduced.
- The basis ((2,0),(0,1)) has size coefficients zero but fails the Lovász condition.
- The dependent family ((1,0),(2,0)) is not reduced even when a zero-denominator convention makes some inequalities vacuous.

**5.1.3 Growth bound for reduced orthogonal lengths.** Prove: For an LLL-reduced family and j<i, ‖b*_j‖²≤2^{i−j}‖b*_i‖².
*Hypotheses.* Fin-index differences are ordinary nonnegative integer differences.
(Source: Lenstra–Lenstra–Lovász 1982, Proof of Proposition 1.6, physical p.3.)
*Needs:* 5.1 `IsLLLReduced`.
**Checks.**
- For orthonormal input the right-hand side is at least the left-hand side.
- The exponent is an index difference, not the full ambient dimension.

**5.1.4 LLL shortest-vector approximation bound.** Prove: For n≥1 and an LLL-reduced basis b of a full real Euclidean Z-lattice L, every nonzero x∈L satisfies ‖b₀‖²≤2^{n−1}‖x‖². Equivalently b₀ is within factor 2^{(n−1)/2} of the shortest nonzero vector.
*Hypotheses.* L-membership is in the exact integer span of b, not the real span. This is an approximation bound; it does not assert exact SVP or CVP.
(Source: Lenstra–Lenstra–Lovász 1982, Proposition 1.11 and its proof, physical p.4.)
*Needs:* 5.1 `IsLLLReduced`, 5.1 (growth bound for reduced orthogonal lengths).
**Checks.**
- For n=1 the factor is 1 and the basis vector is shortest.
- Replacing integer coordinates by real coefficients destroys the lower bound on the last nonzero coefficient.

### 5.2 Change-of-basis certificates and the elementary transitions

**5.2.1 Exact integer change-of-basis certificates.** Define `UnimodularBasisCertificate.ofMatrices`: A certificate for input b and output c consists of U,V∈Mat_n(Z), UV=VU=I, and c_i=Σ_j U_{ji}b_j. Columns are output coordinates in the input family. This proves equality of integer spans and determinant ±1; determinant −1 is allowed.
*Hypotheses.* Input and output families have the same dimension; an input real basis gives an output basis. The certificate matrices are integral, not arbitrary rational or real inverses.
*API.* `UnimodularBasisCertificate.ofMatrices` (constructor: Supply actual integral inverse matrices and the exact output coordinates.); `UnimodularBasisCertificate.span_eq` (relation: The input and output Z-spans are equal.); `UnimodularBasisCertificate.det_unit` (relation: det U is 1 or −1.); `UnimodularBasisCertificate.trans` (functoriality: Compose certificates by matrix multiplication with the correct column order.).
(Source: Lenstra–Lenstra–Lovász 1982, reduction algorithm following (1.15), size reductions and adjacent swaps, physical pp.5–7; certificate format is a worker verification interface.)
*Needs:* Mathlib `Matrix.det_mul`.
**Checks.**
- The coordinate swap [[0,1],[1,0]] has determinant −1 and is a valid certificate.
- diag(2,1) is not an integer-invertible basis change.
- A floating matrix approximately inverting U does not inhabit this certificate.

**5.2.2 Nearest integer residual.** Prove: For t∈R put r=floor(t+1/2). Then -1/2≤t-r<1/2; in particular |t-r|≤1/2. This fixes ties deterministically.
(Source: Lenstra–Lenstra–Lovász 1982, §1, size reduction in (1.18), printed p.31 (physical p.5); the floor tie choice is the convention here.)

**5.2.3 Integral shear certificate.** Prove: Replacing b_i by b_i-r b_j, j<i and r∈Z, has integral inverse replacing that column by b_i+r b_j; the two coordinate matrices multiply to the identity.
(Source: Lenstra–Lenstra–Lovász 1982, §1, (1.15)–(1.25), physical pp.5–8 (reprint folios 31–34).)
*Needs:* 5.2 `UnimodularBasisCertificate.ofMatrices`.

**5.2.4 Shear preserves orthogonalized vectors.** Prove: For independent b and j<i, subtracting an integral multiple r b_j from b_i preserves every Gram–Schmidt vector.
(Source: Lenstra–Lenstra–Lovász 1982, §1, (1.15)–(1.25), physical pp.5–8 (reprint folios 31–34).)
*Needs:* 5.1 `lllCoefficient`, 5.2 (integral shear certificate).

**5.2.5 Shear coefficient update.** Prove: For c_i=b_i-r b_j and c_k=b_k otherwise, μ(c)_ij=μ(b)_ij-r; for ℓ<j, μ(c)_iℓ=μ(b)_iℓ-r μ(b)_jℓ; coefficients in every other row, and in row i at j<ℓ<i, agree.
(Source: Lenstra–Lenstra–Lovász 1982, §1, (1.15)–(1.25), physical pp.5–8 (reprint folios 31–34).)
*Needs:* 5.2 (shear preserves orthogonalized vectors).

**5.2.6 Descending size reduction.** Prove: Process j=i-1,...,0 using the nearest-integer shear. Already bounded coefficients with index greater than j stay bounded; the final row i satisfies all |μ_ij|≤1/2.
(Source: Lenstra–Lenstra–Lovász 1982, §1, (1.15)–(1.25), physical pp.5–8 (reprint folios 31–34).)
*Needs:* 5.2 (nearest integer residual), 5.2 (shear coefficient update).

**5.2.7 Adjacent swap certificate.** Prove: Swapping adjacent columns i,j=i+1 gives an integral involutive coordinate matrix and hence a unimodular certificate.
(Source: Lenstra–Lenstra–Lovász 1982, §1, (1.15)–(1.25), physical pp.5–8 (reprint folios 31–34).)
*Needs:* 5.2 `UnimodularBasisCertificate.ofMatrices`.

**5.2.8 First swapped orthogonal vector.** Prove: Write u=b*_i, v=b*_j, a=μ_ji, B=||u||²,C=||v||²,T=C+a²B. For the adjacent swap c, c*_i=v+a u and ||c*_i||²=T>0.
(Source: Lenstra–Lenstra–Lovász 1982, §1, (1.22), printed p.32.)
*Needs:* 5.1 `lllCoefficient`, 5.2 (adjacent swap certificate).

**5.2.9 Second swapped orthogonal vector.** Prove: In the same notation c*_j=(C/T)u-(a B/T)v, ||c*_j||²=BC/T, and μ(c)_ji=a B/T; T is positive.
(Source: Lenstra–Lenstra–Lovász 1982, §1, (1.22), printed p.32.)
*Needs:* 5.2 (first swapped orthogonal vector).

**5.2.10 Later swapped coefficients.** Prove: For k>j, μ(c)_kj=μ(b)_ki-a μ(b)_kj and μ(c)_ki=μ(b)_kj+(aB/T)μ(c)_kj. Orthogonalized vectors outside i,j are unchanged; earlier coefficients of rows i,j are interchanged.
(Source: Lenstra–Lenstra–Lovász 1982, §1, (1.22), printed p.32.)
*Needs:* 5.2 (second swapped orthogonal vector).

### 5.3 The integer potential and termination

**5.3.1 Integer Gram-prefix potential.** Define `lllIntegerPotential`: For independent integer-column input in Euclidean R^n, let d_i be the determinant of the Gram matrix of the first i vectors, d₀=1, and D=∏_{1≤i<n} d_i. Each d_i is a positive integer; in ranks 0 and 1 the empty potential is 1.
*Hypotheses.* The metric is the standard integral Gram metric, or a specified positive-definite rational Gram metric cleared by a common denominator. For arbitrary real Gram data integrality of the potential is not claimed.
*API.* `lllIntegerPotential` (constructor: Product of positive integral Gram-prefix determinants.); `lllIntegerPotential_pos` (relation: The potential is a positive integer for independent integral input.); `lllIntegerPotential_sizeReduce` (compatibility: An integer shear within the relevant prefix preserves the potential.); `lllIntegerPotential_swap` (relation: A strict Lovász-failing adjacent swap decreases the potential by a factor strictly below 3/4.).
(Source: Lenstra–Lenstra–Lovász 1982, (1.23)–(1.25), physical pp.7–8.)
*Needs:* Mathlib `Matrix.gram`, `Matrix.det_mul`.
**Checks.**
- The standard basis has all prefix determinants and potential equal to 1.
- A rational metric with denominator 2 needs a fixed rescaling; its original determinants are not asserted to be integers.
- In ranks 0 and 1 the empty potential is 1, and no adjacent swap exists.

**5.3.2 Prefix Gram product.** Prove: For independent b and 0≤k≤n, d_k=det Gram(b_0,...,b_(k-1))=∏_{i<k}||b*_i||²>0, including d_0=1.
(Source: Lenstra–Lenstra–Lovász 1982, §1, (1.24)–(1.25), printed p.33.)
*Needs:* 5.1 `lllCoefficient`.

**5.3.3 Integral positive prefix determinants.** Prove: If every original Gram entry is integral, each d_k is a positive integer. Integral shears and swaps preserve integral Gram entries.
(Source: Lenstra–Lenstra–Lovász 1982, §1, (1.23)–(1.25), printed pp.33–34; integral-Gram extension of the coordinate-integer source setting.)
*Needs:* 5.3 (prefix gram product), 5.2 `UnimodularBasisCertificate.ofMatrices`.

**5.3.4 Shear prefix determinant invariance.** Prove: For j<i, replacing b_i by b_i-r b_j preserves every d_k and therefore D=∏_{k=0}^{n-1}d_k.
(Source: Lenstra–Lenstra–Lovász 1982, §1, (1.15)–(1.25), physical pp.5–8 (reprint folios 31–34).)
*Needs:* 5.2 (shear preserves orthogonalized vectors), 5.3 (prefix gram product).

**5.3.5 Swap prefix determinant ratio.** Prove: For j=i+1 only d_j changes under the adjacent swap, and its ratio is T/B. Thus D(c)=(T/B)D(b).
(Source: Lenstra–Lenstra–Lovász 1982, §1, (1.15)–(1.25), physical pp.5–8 (reprint folios 31–34).)
*Needs:* 5.2 (first swapped orthogonal vector), 5.2 (second swapped orthogonal vector), 5.3 (prefix gram product).

**5.3.6 Strict LLL potential decrease.** Prove: If C<(3/4-a²)B then 0<T/B<3/4 and 4D(c)<3D(b). For integral Gram data D is a positive integer, so D(c)<D(b).
(Source: Lenstra–Lenstra–Lovász 1982, §1, (1.15)–(1.25), physical pp.5–8 (reprint folios 31–34).)
*Needs:* 5.3 (swap prefix determinant ratio), 5.3 (integral positive prefix determinants).

**5.3.7 LLL prefix invariant.** Prove: At outer index 1≤k≤n, all pairs in the prefix b_0,...,b_(k-1) satisfy size and Lovász inequalities. A swap at k after reducing μ_k,k-1 preserves this invariant at max(1,k-1); a successful descending reduction extends it to k+1.
(Source: Lenstra–Lenstra–Lovász 1982, §1, (1.16)–(1.21), printed pp.31–33.)
*Needs:* 5.2 (descending size reduction), 5.2 (later swapped coefficients).

**5.3.8 LLL lexicographic termination.** Prove: Outer transitions for n≥2 strictly decrease the lexicographic pair (D,n-k): swaps decrease D; successful passes increase k at fixed D. The finite descending shear loop terminates separately. The rank-zero and rank-one algorithms terminate immediately.
(Source: Lenstra–Lenstra–Lovász 1982, §1, termination argument (1.23)–(1.25), printed pp.33–34.)
*Needs:* 5.3 (strict lll potential decrease), 5.3 (shear prefix determinant invariance), 5.3 (lll prefix invariant).

### 5.4 The reduction and its verification

**5.4.1 Exact terminating LLL reduction.** Construct `exactLLL`: Given a nonsingular integer basis matrix (or rational input cleared by a common denominator) in the standard Euclidean metric, compute a reduced output basis together with an exact unimodular-basis certificate. Use nearest-integer size reduction and strict Lovász-failing adjacent swaps at δ=3/4.
*Hypotheses.* Rank 0 and rank 1 return immediately with the identity certificate. Rounding ties use a fixed nearest-integer rule satisfying distance≤1/2. The polynomial complexity theorem is not supplied here; its proof continues beyond the selected p.8 source slice.
*API.* `exactLLL` (constructor: Return output coordinates, reducedness and the exact integer inverse certificate.); `exactLLL_certificate` (projection: Recover the original-lattice certificate.); `exactLLL_reduced` (projection: Recover the exact size and Lovász tests.); `exactLLL_shortVector` (relation: For positive rank, the first vector satisfies the proven approximation inequality in the original lattice.).
(Source: Lenstra–Lenstra–Lovász 1982, reduction algorithm following (1.15), updates (1.22), Figure 1, termination proof, physical pp.5–8.)
*Needs:* 5.1 `IsLLLReduced`, 5.2 `UnimodularBasisCertificate.ofMatrices`, 5.3 `lllIntegerPotential`, 5.2 (nearest integer residual), 5.2 (descending size reduction), 5.3 (lll prefix invariant), 5.3 (lll lexicographic termination), 5.2 (integral shear certificate), 5.2 (adjacent swap certificate).
**Checks.**
- Input columns (2,0),(0,1) require a swap; the returned certificate may have determinant −1.
- Rank zero returns an empty reduced basis and empty identity matrices.
- An output without a proven Lovász condition is rejected even if short in floating-point arithmetic.

**5.4.2 Verify the short output in the original lattice.** Prove: If a certified output c is LLL-reduced and b is an independent input basis of L, then c₀∈L is nonzero and for every nonzero x∈L, ‖c₀‖²≤2^{n−1}‖x‖², for n≥1.
*Hypotheses.* The metric used by reduction and verification is the same exact Euclidean or specified rational Gram metric. Arithmetic height, relation exclusion and representation conditions are consumer-owned inputs.
(Source: Lenstra–Lenstra–Lovász 1982, Proposition 1.11 plus exact shear/swap lattice preservation, physical pp.4–8.)
*Needs:* 5.2 `UnimodularBasisCertificate.ofMatrices`, 5.1 `IsLLLReduced`, 5.1 (lll shortest-vector approximation bound).
**Checks.**
- A verified certificate includes both original membership and the approximation factor.
- A short vector in the real span but outside the integer span cannot pass verification.

### Examples

The basis `(1,0), (1/2,1)` has `μ_{10} = 1/2` and is already reduced; `(1,0), (0,1)` has `μ_{10} = 0`. The basis `(1,0), (1,1)` size-reduces by the shear `b_1 ↦ b_1 − b_0` with certificate `U = [[1,−1],[0,1]]`. The basis `(2,0), (1,1)` fails the Lovász condition at `δ = 3/4` and a swap strictly decreases the potential. The output of the reduction on a rank-one lattice is its generator, with factor `1`.

### Dependencies

Layer 0 (Gram determinants) and Layer 1 (the first minimum); Mathlib `InnerProductSpace.gramSchmidt`, `gramSchmidt_ne_zero`, `Matrix.SpecialLinearGroup`, `Int.floor` and `round`, `Polynomial` for the potential arithmetic.

## Layer 6: Hermitian K-theory of exact categories

This layer is Schlichting’s hermitian K-theory of exact categories, built on Tau Ceti’s intrinsic exact structures: a strong duality on a category and on an exact category (6.2), symmetric spaces, Lagrangians, hyperbolic spaces and isotropic reduction (6.2–6.3), the Grothendieck–Witt and Witt groups in degree zero with the forgetful and hyperbolic maps (6.4), the hermitian Q-construction and the Grothendieck–Witt space as a homotopy fibre with its higher groups (6.5), cofinality (6.6), the hermitian cone, suspension, delooping and the nonconnective hermitian spectrum (6.7), formations as the loop-space presentation (6.8), localisation for Dedekind rings with the residue duality line (6.9), the source-scoped periodicity and number-ring comparisons (6.10) and the integral tables (6.11). The ordinary K-theory and homotopical inputs the layer consumes are stated as its own targets in 6.1, against Tau Ceti’s `ExactStructure` and `ExactK0` and Mathlib’s nerve, geometric realisation and homotopy groups. No invertibility of `2` is assumed except where a target says so.

### 6.1 Ordinary K-theory and homotopical inputs

The constructions of this layer need Quillen’s Q-construction and K-groups of an exact category, Waldhausen’s S-construction with its delooping, the nonconnective K-theory spectrum obtained by suspension, geometric realisation of nerves, Quillen’s Theorems A and B, and the group completion of a symmetric monoidal groupoid. None of these is in Mathlib or Tau Ceti beyond `ExactK0`, `CategoryTheory.nerve` and `SSet.toTop`, so they are targets here, stated for the exact categories of Tau Ceti’s `ExactStructure`.

**6.1.1 The Q-construction.** Define `quillenQ E` for an exact category `E`: the objects are those of `E`, a morphism `X → Y` is an isomorphism class of spans `X ↞ Z ↣ Y` with an admissible deflation on the left and an admissible inflation on the right, and composition is by pullback of the inflation along the deflation, which is again admissible by Tau Ceti’s exact axioms. Prove `quillenQ.ofSpan_eq_iff` (two spans represent the same morphism exactly when they are isomorphic over `X` and `Y`), `quillenQ.comp_ofSpan`, `quillenQ.id_ofSpan` and associativity, and use the image of a chosen zero object of `E` as the distinguished basepoint of the nerve. It is generally not a categorical zero object of `quillenQ E`. (Source: Quillen, *Higher algebraic K-theory I*, §2, the definition of `QM` and the paragraph following it.) *Needs:* Tau Ceti `ExactStructure`, GrothendieckEulerForms Layer 0, Mathlib `IsPullback`.
**Checks.**
- The two spans `X ↞ X ≅ Y` and `X ≅ Y ↣ Y` attached to an isomorphism `X ≅ Y` represent the same morphism of `quillenQ E`.
- `Hom(0, X)` is in bijection with the isomorphism classes of admissible inflations `Z ↣ X` (every `Z ↠ 0` is an admissible deflation), so it is a singleton exactly when `X` has no admissible subobject other than `0`; for `X = 0` it is a singleton, and for a nonzero vector space in the split structure it is not.
- In the split exact structure on finite-dimensional vector spaces, every subquotient `X ⊇ A ⊇ B` gives the morphism `A/B → X` and the morphism also retains the chosen identification with the source. Two spans are equal precisely under the equivalence of spans, rather than merely when their quotient objects are abstractly isomorphic.

**6.1.2 K-groups of an exact category.** Define `exactKGroup E n` as the homotopy group `π_{n+1}(|N(quillenQ E)|, 0)`, using Mathlib’s `CategoryTheory.nerve`, `SSet.toTop` and `HomotopyGroup`, and prove `exactKGroup_zero_iso`, the isomorphism `exactKGroup E 0 ≃ ExactK0 E` of Tau Ceti (Quillen §2, Theorem 1), `exactKGroup_map` (functoriality for conflation-exact functors) and `exactKGroup_prod` (products of exact categories). (Source: Quillen, *Higher algebraic K-theory I*, §2, Theorem 1 and the definition of `K_i` following it; §3 for products.) *Needs:* 6.1.1, Tau Ceti `ExactK0`, Mathlib `CategoryTheory.nerve`, `SSet.toTop`, `HomotopyGroup`.
**Checks.**
- `exactKGroup E 0` is generated by the classes `[X]` subject to `[Y] = [X] + [Z]` for every conflation, through `exactKGroup_zero_iso`.
- The zero exact category has `exactKGroup 0 n = 0` for every `n`.
- For a field `k`, `exactKGroup (finite-dimensional k-spaces) 0 ≃ ℤ` by dimension.

**6.1.3 Nerves, realisation and Quillen’s theorems.** Prove `nerveRealization_homotopy`: a natural transformation `F ⇒ G` of functors between small categories induces a homotopy between `|N F|` and `|N G|`; `nerveRealization_contractible_of_initial`: a category with an initial or terminal object has contractible realisation; `quillenTheoremA`: if every comma category `f/Y` is contractible then `|N f|` is a homotopy equivalence; and `quillenTheoremB`: if every base change `Y → Y'` induces a homotopy equivalence `f/Y → f/Y'`, then `|N(f/Y)|` is the homotopy fibre of `|N f|` over `Y`, with the long exact sequence. (Source: Quillen, *Higher algebraic K-theory I*, §1, Theorem A, Theorem B and the corollaries preceding them.) *Needs:* Mathlib `CategoryTheory.nerve`, `SSet.toTop`, `CategoryTheory.Comma`, `ContinuousMap.Homotopy`.
**Checks.**
- Theorem A applied to the identity functor is the identity equivalence.
- A functor with a right adjoint satisfies the hypothesis of Theorem A, since `f/Y` has the terminal object determined by the counit `f(RY)→Y`. For a left adjoint, the corresponding under-comma category instead has an initial object.
- The projection `E × E' → E` of nerves of exact categories has homotopy fibre `|N E'|` by Theorem B.

**6.1.4 The S-construction and delooping.** Define Waldhausen’s `waldhausenS E` for an exact category `E` (the simplicial category of filtered objects `0 = X_0 ↣ X_1 ↣ ⋯ ↣ X_n` with chosen admissible quotients `X_j/X_i`), prove the additivity theorem, the comparison `|N(quillenQ E)| ≃ |N(iS_• E)|`, and the identification of `exactKGroup E n` with `π_n` of the K-theory space `Ω|N(iS_• E)|`. Here `iS_n E` is the groupoid of isomorphisms in `S_n E` and the displayed realisation is the diagonal of its bisimplicial nerve. The iterated construction gives the additional delooping `|N(iS_• E)| ≃ Ω|N(iS_• S_• E)|`; this is a different statement from the Q-comparison. (Source: Waldhausen, *Algebraic K-theory of spaces*, §1.3 for `S.`, §1.4 Theorem 1.4.2 for additivity, §1.5 for iterated delooping and §1.9 for the comparison with the Q-construction, printed pp.375–376 (physical pp.57–58).) *Needs:* 6.1.1–6.1.3.
**Checks.**
- `S_0 E` is the trivial category and `S_1 E` is `E`.
- Additivity: the two functors `S_2 E → E` sending a conflation to its outer terms induce, with the total object, a homotopy equivalence `|wS.S_2 E| ≃ |wS.E| × |wS.E|`.
- For finite-dimensional spaces over a field, `|N(QE)|` is connected, while `π₀ Ω|N(iS_• E)|=ℤ`; equating these two spaces would lose a loop. The comparison gives `π₁ |N(QE)|=π₁ |N(iS_• E)|=K₀(E)`.

**6.1.5 The nonconnective K-theory spectrum.** For an idempotent complete exact category `E`, construct Schlichting’s suspension `SE = CE/E` through the countable envelope `CE` of admissible-inflation sequences, with `Hom((A_i),(B_j))=lim_i colim_j Hom_E(A_i,B_j)` and its induced exact structure. Prove the filtering hypotheses needed to construct the exact quotient; flasqueness alone is insufficient. Use this envelope, prove that `K(CE)` is contractible by the Eilenberg swindle, that `K(E) → ΩK(SE)` is a homotopy equivalence on the idempotent completion, and define `nonconnectiveKSpectrum E` with `π_{−n} = K₀(̃SⁿE)` for `n≥1`, where the tilde denotes idempotent completion. Its degree-zero group is `K₀(̃E)`. (Source: Schlichting, *Delooping the K-theory of exact categories*, Topology 43 (2004), Definition 3.3 and Theorem 3.4; the author’s *Higher Algebraic K-Theory*, §§2.4.3–2.4.6, printed pp.181–183, gives the envelope, quotient, negative-group convention and vanishing statement.) *Needs:* 6.1.4, GrothendieckEulerForms Layer 0.
**Checks.**
- The negative K-groups of a field, and more generally of a regular noetherian ring, vanish.
- `π_0` of the spectrum is `ExactK0 E` for idempotent complete `E`.
- The hermitian cone of 6.7 maps to `CE` by forgetting the duality, and the hyperbolic comparison of 6.7 is a map of spectra.

**6.1.6 Group completion.** For a symmetric monoidal groupoid `M` construct the group completion `groupCompletion M` as a Segal Γ-space, prove `groupCompletion_pi0` (its `π_0` is the Grothendieck group of the monoid of isomorphism classes) and the group-completion theorem on homology: for the topological monoid model of `|N M|`, require centrality of `π₀ M` in its Pontryagin homology ring and identify `H_*(M)[(π₀M)⁻¹]` with `H_*(ΩBM)`. Orthogonal sum supplies the required commutativity. For a **split exact** category with duality `E`, prove that the group completion of the isometry-class monoid maps isomorphically to `π₀ GW(E)=GW₀(E)` of 6.5, using Schlichting’s stable metabolic cancellation. For arbitrary exact `E`, the metabolic relations of 6.4 are additional relations and this comparison is not asserted. (Source: Segal, *Categories and cohomology theories*, Topology 13 (1974), §§1–2, Proposition 1.4 and the symmetric-monoidal-category construction of §2, printed pp.296–300; McDuff–Segal, *Homology fibrations and the group-completion theorem*, Invent. Math. 31 (1976), Proposition 1, printed p.279, with the homology-fibration construction of Proposition 2, p.280; Schlichting 2010, Lemma 2.9 and Corollary 2.10, printed pp.111–112.) *Needs:* 6.1.3, 6.4 (metabolic relations), Mathlib `CategoryTheory.MonoidalCategory`.
**Checks.**
- For the groupoid of finite sets under disjoint union the `π_0` is `ℤ`.
- The orthogonal sum is associative and commutative up to the coherence isomorphisms of 6.2, and these are what the Γ-space records.
- A groupoid with a single object and trivial automorphism group has contractible group completion.


### 6.2 Dualities, symmetric spaces and Lagrangians

**6.2.1 Exact category with strong duality.** Construct `ExactCategoryDuality.ofExactFunctor`: On an TauCeti.ExactStructure on a preadditive category E, equip a strong duality D that is additive and sends each conflation X→Y→Z to the reversed dual conflation DZ→DY→DX. The coefficient sign −η gives the alternating variant when D is additive.
*Hypotheses.* Use the completed intrinsic ExactStructure carrier and conflation-exact functors. No assumption 2 is invertible is required for this classical exact-category construction.
*API.* `ExactCategoryDuality.ofExactFunctor` (constructor: An additive conflation-exact strong duality on the exact category.); `ExactCategoryDuality.map_conflation` (functoriality: Reverse a conflation to its dual conflation.); `ExactCategoryDuality.sign` (constructor: The sign-twisted duality with double dual −η.).
(Source: Schlichting, *Hermitian K-theory of exact categories*, Definition 2.1, Example 2.2 and §2.4, printed pp.109–110.)
*Needs:* Tau Ceti `TauCeti.ExactStructure`, Tau Ceti `TauCeti.ExactStructure.IsConflationExact`, Tau Ceti `TauCeti.ExactStructure.op`, Tau Ceti `TauCeti.ExactStructure.split`, Tau Ceti `Functor.IsInvolutiveDual` and `Functor.dualityEquivalence`, GrothendieckEulerForms Layer 0.
**Checks.**
- Finite projective R-modules with Hom_R(−,R) form the split exact example; arbitrary finite modules need not have invertible biduality.
- Over Z the hyperbolic symmetric plane is available without 1/2.
- Changing η to −η changes the symmetry equation and does not identify symmetric and quadratic refinements at 2.

**6.2.2 Nondegenerate symmetric spaces.** Define `SymmetricSpace`: For strong duality (D,η), a symmetric space is (X,φ) with an isomorphism φ:X→DX satisfying D(φ)η_X=φ. A form-preserving map f:X→Y satisfies φ_X=D(f)φ_Y f; an isometry is such a map whose underlying morphism is an isomorphism.
*Hypotheses.* Nondegeneracy is an isomorphism, not merely a separating form over a ring. Symplectic spaces use the sign-twisted duality; a quadratic refinement is additional data at dyadic coefficients.
*API.* `SymmetricSpace` (constructor: Object, pairing isomorphism and typed symmetry equation.); `SymmetricSpace.pairing` (projection: The actual map X≅DX.); `SymmetricSpace.preserves` (characterisation: Form-preservation is the displayed categorical equation.); `SymmetricSpace.preserves_id` (simp: Identity preserves a symmetric space.); `SymmetricSpace.preserves_comp` (functoriality: The composite of form-preserving maps preserves the forms.).
(Source: Schlichting, *Hermitian K-theory of exact categories*, Definition 2.4 and §3.1, printed pp.110,113.)
*Needs:* Tau Ceti `Functor.IsInvolutiveDual` and `Functor.dualityEquivalence`.
**Checks.**
- The rank-one pairing xy on Z is nondegenerate; 2xy is separating but not a pairing isomorphism over Z.
- The identity map preserves every symmetric space.
- A noninvertible form-preserving map is not called an isometry.

**6.2.3 Symmetric isometry classes.** Define `SymmetricIsometry`: Isometry classes are the quotient of nondegenerate symmetric spaces by existence of an actual form-preserving categorical isomorphism.
*API.* `SymmetricIsometry` (data: A categorical isomorphism satisfying the pairing equation.); `symmetricIsometrySetoid` (characterisation: Two spaces are related exactly when such an isometry exists.); `SymmetricIsometryClass` (constructor: The quotient by that setoid; its generator identifies precisely isometric spaces.).
(Source: Schlichting, *Hermitian K-theory of exact categories*, §2.2, printed p.111.)
*Needs:* 6.2 `SymmetricSpace`.
**Checks.**
- A rank-one Z pairing xy is not isometric to 2xy, which is not perfect.
- The zero space has a single isometry class.
- Over Q, determinant square class separates ⟨1⟩ from ⟨2⟩.

**6.2.4 Orthogonal sum.** Construct `orthogonalSum`: Orthogonal sum has carrier X⊕Y and the direct-sum pairing, transported across the additive duality biproduct isomorphism.
*API.* `orthogonalSum` (constructor: Construct the space on the actual categorical biproduct.); `orthogonalSum_carrier` (simp: Its carrier is X.carrier⊕Y.carrier.); `orthogonalSum_assoc` (compatibility: The canonical biproduct associator preserves the pairing.); `orthogonalSum_comm` (compatibility: The biproduct swap is an isometry.).
(Source: Schlichting, *Hermitian K-theory of exact categories*, §2.2, printed p.111.)
*Needs:* 6.2 `ExactCategoryDuality.ofExactFunctor`, 6.2 `SymmetricSpace`.
**Checks.**
- The sum of two rank-one unit forms over Z has diagonal Gram matrix (1,1).
- Zero is a unit up to isometry.
- Rank and determinant multiply in the usual block formula.

**6.2.5 Negative symmetric space.** Construct `negativeSpace`: Negate the pairing isomorphism on the same object; additive duality preserves the symmetry equation.
*API.* `negativeSpace` (constructor: Negate the perfect pairing without changing the carrier.); `negativeSpace_carrier` (simp: The underlying object is unchanged.); `negativeSpace_pairing` (simp: The pairing hom is the negative of the original hom.); `negativeSpace_negative` (simp: Double negation recovers the original pairing.).
(Source: Schlichting, *Hermitian K-theory of exact categories*, §2.2, printed p.111.)
*Needs:* 6.2 `ExactCategoryDuality.ofExactFunctor`, 6.2 `SymmetricSpace`.
**Checks.**
- Negating ⟨1⟩ gives ⟨−1⟩ over Q.
- Negation twice recovers the original space.
- Negation preserves the zero space.

**6.2.6 Admissible Lagrangians.** Define `ExactLagrangian.ofConflation`: A Lagrangian of (X,φ) is an admissible inflation i:L→X such that L→X→DL, with second map D(i)φ, is a conflation. Thus L is its own orthogonal, in the actual exact structure. A space is metabolic when a Lagrangian exists.
*Hypotheses.* An arbitrary isotropic submodule is not automatically admissible. An exact Lagrangian specifies the quotient and conflation, not only a rank equality.
*API.* `ExactLagrangian.ofConflation` (constructor: A conflation L→X→DL with the displayed second map.); `ExactLagrangian.zero` (relation: D(i)φi=0.); `ExactLagrangian.mapIsometry` (functoriality: An isometry transports the admissible Lagrangian.).
(Source: Schlichting, *Hermitian K-theory of exact categories*, Definition 2.5, printed p.110.)
*Needs:* Tau Ceti `TauCeti.ExactStructure.split`, 6.2 `SymmetricSpace`, 6.2 `ExactCategoryDuality.ofExactFunctor`.
**Checks.**
- The first summand of the hyperbolic plane is a Lagrangian.
- 2Z⊂Z is not an admissible summand in the split exact category of projectives.
- An isotropic subobject of too small a rank is not a Lagrangian.

**6.2.7 Hyperbolic symmetric space.** Construct `hyperbolicSpace`: For X in an exact category with duality, H(X) has underlying object X⊕DX and pairing matrix [[0,1],[η_X,0]] to DX⊕DDX, with its actual biproduct identifications. The inclusion of X is an admissible Lagrangian.
*Hypotheses.* No division by 2 is used. The exact category’s split biproduct conflation is imported.
*API.* `hyperbolicSpace` (constructor: The biproduct with the off-diagonal perfect pairing.); `hyperbolicLagrangian` (projection: The first summand is an admissible Lagrangian.); `hyperbolicSpace_sum` (compatibility: Hyperbolic construction carries sums to orthogonal sums.).
(Source: Schlichting, *Hermitian K-theory of exact categories*, After Definition 2.5, printed p.110.)
*Needs:* 6.2 `ExactCategoryDuality.ofExactFunctor`, 6.2 `SymmetricSpace`, 6.2 `ExactLagrangian.ofConflation`.
**Checks.**
- Over Z, H(Z) has Gram [[0,1],[1,0]] and is even unimodular.
- H(0) is the zero symmetric space.
- H(X⊕Y) is isometric to H(X)⊥H(Y).

**6.2.8 Diagonal Lagrangian for opposite forms.** Prove: For a symmetric space X in an exact category with strong exact duality, the diagonal X into X orthogonally summed with -X is an admissible Lagrangian.
*Hypotheses.* The diagonal Lagrangian proof uses the actual perfect pairing and split exactness of its short sequence.
(Source: Schlichting, *Hermitian K-theory of exact categories*, §2.2 and Lemma 2.8, printed pp.111–112.)
*Needs:* 6.2 `SymmetricSpace`, 6.2 `ExactLagrangian.ofConflation`, 6.2 `negativeSpace`, 6.2 `orthogonalSum`.
**Checks.**
- For a one-dimensional field form <a>, the diagonal line in <a> orthogonal-sum <-a> has zero pairing and is the Lagrangian.

### 6.3 Isotropic reduction

**6.3.1 Admissible isotropic subobject.** Define `ExactIsotropicSubobject`: Store L→L-perp→X, the quotient L-perp→Q and the two conflations L→L-perp→Q and L-perp→X→DL. The composite L→X is an inflation. The second outgoing map is obtained from the actual pairing and dual inclusion.
*API.* `ExactIsotropicSubobject` (data: The two actual conflations, inclusion and quotient maps.); `ExactIsotropicSubobject.totalInclusion` (projection: The composite admissible inclusion L→X.); `ExactIsotropicSubobject.quotientMap` (projection: The specified admissible quotient L-perp→Q.).
(Source: Schlichting, *Hermitian K-theory of exact categories*, Lemma 2.6, printed pp.110–111.)
*Needs:* 6.2 `ExactCategoryDuality.ofExactFunctor`, 6.2 `SymmetricSpace`.
**Checks.**
- L=0 in a perfect field space gives Q=X.
- A Lagrangian gives Q=0.
- The image 2Z inside the first summand of H(Z) does not qualify in the projective split exact structure.

**6.3.2 Exact short five lemma.** Prove: In an exact category a map of conflations with isomorphisms on both ends is an isomorphism in the middle.
(Source: Schlichting, *Hermitian K-theory of exact categories*, Lemma 2.6 proof, printed p.111; elementary exact-category comparison.)
*Needs:* 6.2 `ExactCategoryDuality.ofExactFunctor`.

**6.3.3 Isotropic pairing descends.** Prove: The restricted pairing on L-perp factors uniquely through the admissible quotient in both variables to a map Q→DQ.
(Source: Schlichting, *Hermitian K-theory of exact categories*, Lemma 2.6 proof, printed p.111.)
*Needs:* 6.3 `ExactIsotropicSubobject`, 6.2 `ExactCategoryDuality.ofExactFunctor`.

**6.3.4 Isotropic quotient symmetry.** Prove: The descended quotient pairing satisfies the strong-duality symmetry equation.
(Source: Schlichting, *Hermitian K-theory of exact categories*, Lemma 2.6 proof, printed p.111.)
*Needs:* 6.3 (isotropic pairing descends).

**6.3.5 Isotropic quotient is perfect.** Prove: The descended quotient pairing is an isomorphism.
(Source: Schlichting, *Hermitian K-theory of exact categories*, Lemma 2.6 proof, printed p.111.)
*Needs:* 6.3 (isotropic pairing descends), 6.3 (exact short five lemma).

**6.3.6 Isotropic graph is Lagrangian.** Prove: The graph L-perp→X⊕−Q given by its inclusion and quotient is an admissible Lagrangian.
(Source: Schlichting, *Hermitian K-theory of exact categories*, Lemma 2.6 proof, printed pp.110–111.)
*Needs:* 6.3 (isotropic quotient is perfect), 6.2 `ExactLagrangian.ofConflation`.

**6.3.7 Isotropic reduction of a symmetric space.** Construct `isotropicReduction`: For an admissible totally isotropic L⊂X with L⊂L⊥ also an inflation, there is a unique nondegenerate symmetric form on L⊥/L pulling back to the restricted form.
*Hypotheses.* Both admissibility conditions are retained. The quotient is the exact-category quotient of the specified conflation.
*API.* `isotropicReduction` (constructor: The unique induced perfect symmetric quotient form.); `isotropicReduction_pullback` (characterisation: Its pullback is the restricted pairing.); `isotropicReduction_isometry` (functoriality: An isometry carrying one admissible isotropic subobject to another induces an isometry of their perfect quotient forms.).
(Source: Schlichting, *Hermitian K-theory of exact categories*, Lemma 2.6 and complete proof, printed pp.110–111.)
*Needs:* 6.3 `ExactIsotropicSubobject`, 6.3 (isotropic quotient symmetry), 6.3 (isotropic quotient is perfect).
**Checks.**
- For L=0 the quotient is X and X⊥−X is metabolic.
- For a Lagrangian L the quotient L⊥/L is zero.
- For a nonadmissible inclusion the quotient construction cannot be invoked.

**6.3.8 Metabolic comparison for isotropic reduction.** Prove: For the admissible isotropic subobject L and induced perfect quotient form of isotropic-reduction, X orthogonally summed with the negative quotient form is metabolic, with admissible Lagrangian L-perp mapped by inclusion and quotient.
*Hypotheses.* Both admissibility conditions are retained. The quotient is the exact-category quotient of the specified conflation.
(Source: Schlichting, *Hermitian K-theory of exact categories*, Lemma 2.6 and complete proof, printed pp.110–111.)
*Needs:* 6.3 `isotropicReduction`, 6.3 (isotropic graph is lagrangian), 6.2 `negativeSpace`, 6.2 `orthogonalSum`.
**Checks.**
- At L=0 the reduction is X and the comparison becomes X orthogonal-sum -X with its diagonal Lagrangian.

### 6.4 Grothendieck–Witt and Witt groups in degree zero

**6.4.1 Degree-zero Grothendieck–Witt group of an exact category.** Construct `ExactGW0`: GW₀(E) is the group completion of isometry classes of nondegenerate symmetric spaces modulo [M]=[H(L)] for every metabolic M with an admissible Lagrangian L. Orthogonal sum is addition. This extra relation is essential in a nonsplit exact category.
*Hypotheses.* E is essentially small with its intrinsic exact structure and strong exact duality. Degree-zero field Witt/GW theory is QuadraticFormInvariants Layer 4; this declaration supplies the general exact-category extension and the comparison.
*API.* `ExactGW0` (constructor: The presented additive group.); `ExactGW0.of` (constructor: The generator class of a symmetric space.); `ExactGW0.sum` (simp: Orthogonal sum becomes addition.); `ExactGW0.metabolic` (relation: [M]=[H(L)] for an admissible Lagrangian.); `ExactGW0.lift` (universal-property: Descend exactly the additive invariants satisfying the metabolic relation.).
(Source: Schlichting, *Hermitian K-theory of exact categories*, §2.2, printed p.111.)
*Needs:* Mathlib `FreeAbelianGroup`, 6.2 `SymmetricSpace`, 6.2 `ExactLagrangian.ofConflation`, 6.2 `hyperbolicSpace`, 6.2 `SymmetricIsometry`, 6.2 `orthogonalSum`.
**Checks.**
- A metabolic space with Lagrangian L has the same GW class as H(L).
- Over a split exact projective category, stable metabolic cancellation yields the usual group completion.
- Over Z the symmetric and quadratic-refined group presentations are not conflated.

**6.4.2 Witt group of an exact category.** Construct `ExactW0`: W0(E) is the orthogonal-sum monoid of symmetric-space isometry classes modulo metabolic spaces, equipped with its abelian group structure: the negative form supplies the inverse, as proved by symmetric-diagonal-lagrangian.
*Hypotheses.* The diagonal Lagrangian proof uses the actual perfect pairing and split exactness of its short sequence.
*API.* `ExactW0` (constructor: The metabolic quotient group.); `ExactW0.of` (constructor: The Witt class of a symmetric space.); `ExactW0.metabolic` (simp: Metabolic spaces have zero class.); `ExactW0.neg` (relation: Negating the pairing gives the additive inverse.); `ExactW0.fieldComparison` (compatibility: For fields in the owner’s scope, recover its Witt group.).
(Source: Schlichting, *Hermitian K-theory of exact categories*, §2.2 and Lemma 2.8, printed pp.111–112.)
Specialised to finite-dimensional signed hermitian spaces over a nonarchimedean local field of odd residue characteristic, this presentation recovers the anisotropic-class Witt group of 2.9.
*Needs:* 6.4 `ExactGW0`, 6.2 `ExactLagrangian.ofConflation`, 6.2 `hyperbolicSpace`, QuadraticFormInvariants Layer 4, 6.2 (diagonal lagrangian for opposite forms).
**Checks.**
- A hyperbolic plane has zero Witt class.
- The inverse of [X,φ] is [X,−φ].
- W=GW is false: over R the hyperbolic plane has nonzero rank in GW but zero Witt class.

**6.4.3 Forgetful map on Grothendieck–Witt groups.** Construct `grothendieckWittForgetful`: For a small exact category E with strong exact duality, the underlying-object assignment induces the group homomorphism F:GW0(E)->K0(E).
*Hypotheses.* K₀ is the imported exact Grothendieck group. The duality involution can act nontrivially on K₀; multiplication by two is only a specialization when it acts trivially.
*API.* `grothendieckWittForgetful` (constructor: The underlying-object group homomorphism.); `grothendieckWittForgetful_of` (simp: F([X,phi])=[X].); `grothendieckWittForgetful_natural` (functoriality: Commutes with exact form functors and their underlying exact functors.).
(Source: Schlichting, *Hermitian K-theory of exact categories*, Lemma 2.8 and proof, printed p.112.)
*Needs:* Tau Ceti `TauCeti.ExactK0`, Tau Ceti `TauCeti.ExactK0.of`, Tau Ceti `TauCeti.ExactK0.of_conflation`, Tau Ceti `TauCeti.ExactK0.map`, 6.4 `ExactGW0`, 6.1 `exactKGroup`.
**Checks.**
- F of the zero space is zero.
- Over a field, a nonsingular one-dimensional form has underlying K0 rank one.
- F of a metabolic space with Lagrangian L is [L]+[DL].

**6.4.4 Hyperbolic map from the exact Grothendieck group.** Construct `grothendieckWittHyperbolic`: For a small exact category E with strong exact duality, X maps to H(X) and induces a group homomorphism H:K0(E)->GW0(E).
*Hypotheses.* K₀ is the imported exact Grothendieck group. The duality involution can act nontrivially on K₀; multiplication by two is only a specialization when it acts trivially.
*API.* `grothendieckWittHyperbolic` (constructor: The hyperbolic group homomorphism.); `grothendieckWittHyperbolic_of` (simp: H([X])=[H(X)].); `grothendieckWittHyperbolic_natural` (functoriality: Commutes with nonsingular exact form functors.).
(Source: Schlichting, *Hermitian K-theory of exact categories*, Lemma 2.8 and proof, printed p.112.)
*Needs:* Tau Ceti `TauCeti.ExactK0`, Tau Ceti `TauCeti.ExactK0.map`, 6.4 `ExactGW0`, 6.2 `hyperbolicSpace`, 6.1 `exactKGroup`.
**Checks.**
- H(0)=0.
- Over a field the underlying rank of H of a rank-one class is two.
- For each exact conflation X->Y->Z, H([Y])=H([X])+H([Z]).

**6.4.5 Witt group as the hyperbolic cokernel.** Prove: For a small exact category with strong exact duality, K0(E) --H--> GW0(E) -> W0(E) -> 0 is exact.
*Hypotheses.* K₀ is the imported exact Grothendieck group. The duality involution can act nontrivially on K₀; multiplication by two is only a specialization when it acts trivially.
(Source: Schlichting, *Hermitian K-theory of exact categories*, Lemma 2.8 and proof, printed p.112.)
*Needs:* 6.4 `ExactGW0`, 6.4 `ExactW0`, 6.4 `grothendieckWittHyperbolic`.
**Checks.**
- Each hyperbolic class maps to zero in the Witt group.

**6.4.6 Hyperbolic and forgetful maps in degree zero.** Prove: The composite of the forgetful and hyperbolic maps is F H=1+D on the exact Grothendieck group: F H([X])=[X]+[DX]. It specializes to multiplication by two only when D acts trivially.
*Hypotheses.* K₀ is the imported exact Grothendieck group. The duality involution can act nontrivially on K₀; multiplication by two is only a specialization when it acts trivially.
(Source: Schlichting, *Hermitian K-theory of exact categories*, Lemma 2.8 and proof, printed p.112.)
*Needs:* 6.4 `grothendieckWittForgetful`, 6.4 `grothendieckWittHyperbolic`.
**Checks.**
- Over a field with trivial rank-duality action, F H doubles rank.
- The hyperbolic image maps to zero in W₀.
- For a nontrivial K₀ involution, the equation is 1+D and cannot be simplified without proof.

### 6.5 The hermitian Q-construction and the Grothendieck–Witt space

**6.5.1 Hermitian Q span.** Define `HermitianQSpan`: A representative X←U→Y has admissible deflation p and inflation i; the square from U to Y and X, with opposite corner DU and maps φY followed by Di and φX followed by Dp, is both cartesian and cocartesian.
*API.* `HermitianQSpan` (constructor: Store the actual bicartesian square and admissible span legs.); `HermitianQSpan.identity` (constructor: The two identity arrows give an identity representative.); `HermitianQSpan.equivalent` (characterisation: A middle-object isomorphism commutes with both legs.); `HermitianQSpan.comp` (constructor: Use the exact pullback of the next deflation along the previous inflation.).
(Source: Schlichting, *Hermitian K-theory of exact categories*, Definition 4.1, printed p.116.)
*Needs:* 6.2 `ExactCategoryDuality.ofExactFunctor`, 6.2 `SymmetricSpace`.
**Checks.**
- The identity representative uses U=X and both identity legs.
- A Lagrangian inclusion represents zero→X.
- An inclusion with a nonzero restricted self-pairing cannot represent zero→X.

**6.5.2 Hermitian Q representative equivalence.** Prove: Isomorphisms of middle objects respecting both legs give an equivalence relation on hermitian Q representatives.
(Source: Schlichting, *Hermitian K-theory of exact categories*, Definition 4.1, printed p.116.)
*Needs:* 6.5 `HermitianQSpan`.

**6.5.3 Hermitian Q pullback closure.** Prove: Pullback composition of admissible spans produces another admissible hermitian bicartesian span.
(Source: Schlichting, *Hermitian K-theory of exact categories*, Definition 4.1 and Remark 4.3, printed pp.116–117; source omitted routine diagram verification is made explicit.)
*Needs:* 6.5 `HermitianQSpan`, 6.3 `isotropicReduction`.

**6.5.4 Hermitian Q composition respects representatives.** Prove: Isomorphic input spans have isomorphic pullback composites, respecting both outer legs.
(Source: Schlichting, *Hermitian K-theory of exact categories*, Definition 4.1, printed p.116; exact pullback comparison.)
*Needs:* 6.5 (hermitian q pullback closure).

**6.5.5 Hermitian Q identity laws.** Prove: Composing an identity representative on either side gives an equivalent span.
(Source: Schlichting, *Hermitian K-theory of exact categories*, Definition 4.1, printed p.116.)
*Needs:* 6.5 (hermitian q pullback closure).

**6.5.6 Hermitian Q associativity.** Prove: The two iterated pullback composites are isomorphic representatives, compatibly with the outer legs.
(Source: Schlichting, *Hermitian K-theory of exact categories*, Definition 4.1, printed p.116.)
*Needs:* 6.5 (hermitian q pullback closure).

**6.5.7 Hermitian Q-construction.** Construct `HermitianQ`: Qʰ(E) has symmetric spaces as objects. A morphism X→Y is an isomorphism class of spans X←p U→i Y with p an admissible deflation and i an admissible inflation, satisfying the matching restricted pairings and ker p≅ker(D(i)φ_Y). Equivalently the corresponding pairing square is bicartesian. Composition is the imported Q pullback composition.
*Hypotheses.* Use the actual pairing square and exact-category quotient data; not every ordinary Q-span lifts.
*API.* `HermitianQ` (constructor: The category of hermitian Q-spans.); `HermitianQ.ofSpan` (constructor: A span with its actual bicartesian pairing condition.); `HermitianQ.forget` (functoriality: Forget the pairings to the Q-construction.); `HermitianQ.identity` (simp: Identity is the identity span.).
(Source: Schlichting, *Hermitian K-theory of exact categories*, Definition 4.1 and §4.1, printed pp.116–117.)
*Needs:* 6.5 (hermitian q representative equivalence), 6.5 (hermitian q composition respects representatives), 6.5 (hermitian q identity laws), 6.5 (hermitian q associativity), 6.1 `quillenQ`.
**Checks.**
- A Lagrangian gives a Qʰ path from zero to its metabolic space.
- The identity span gives the identity morphism.
- A Q-span with incompatible pairing or wrong kernel is not a hermitian morphism.

**6.5.8 Hermitian Q forgetful functor.** Prove the comparison: Forgetting the pairings and bicartesian witness gives a functor Qh(E)→Q(E), preserving the chosen zero-object basepoint and representative composition.
(Source: Schlichting, *Hermitian K-theory of exact categories*, Definition 4.1 and Definition 4.4, printed pp.116–117.)
*Needs:* 6.5 `HermitianQ`, 6.1 `quillenQ`.

**6.5.9 Hyperbolic Q equivalence.** Prove the comparison: For the hyperbolic category HE=E×E-op with exchange duality, Qh(HE) is equivalent to Q(E), and its GW fibre space is equivalent to K(E).
(Source: Schlichting, *Hermitian K-theory of exact categories*, Example 2.3, Remark 4.3 and Example 4.5, printed pp.109,117.)
*Needs:* 6.5 `HermitianQ`, 6.5 (hermitian q forgetful functor), 6.1 `exactKGroup`.

**6.5.10 Hermitian Q nerve realization.** Prove the comparison: Take Mathlib’s `CategoryTheory.nerve` of a small model of Qh(E), apply the supplied geometric realization functor and realize the forgetful natural transformation. The zero symmetric space gives the fibre base point.
(Source: Schlichting, *Hermitian K-theory of exact categories*, Definition 4.4, printed p.117; the realization comparison is 6.1.3.)
*Needs:* Mathlib `CategoryTheory.nerve`, `CategoryTheory.nerveMap`, 6.5 (hermitian q forgetful functor), 6.1 `nerveRealization`, 6.1 `quillenTheoremA`.

**6.5.11 Grothendieck–Witt space of an exact category.** Construct `grothendieckWittSpace`: GW(E) is the pointed homotopy fibre over the zero object of |Qʰ(E)|→|Q(E)|.
*Hypotheses.* Use actual nerve realization, homotopy fibre and homotopy groups from 6.1. No assumption 2 is invertible is needed for Schlichting’s exact-category model.
*API.* `grothendieckWittSpace` (constructor: The specified pointed homotopy fibre.); `grothendieckWittSpace_fibration` (relation: GW(E)→|QʰE|→|QE| is the defining fibre sequence.); `grothendieckWittSpace_map` (functoriality: Nonsingular exact form functors induce pointed maps.).
(Source: Schlichting, *Hermitian K-theory of exact categories*, Definition 4.4 and Definition 4.12, printed pp.117–118,122.)
*Needs:* 6.5 (hermitian q nerve realization).
**Checks.**
- For the constant map from a point to false in the discrete two-point space, the homotopy fibre over true is empty: there is no path joining the two points.
- The fibre of the identity of the discrete two-point space over false is a singleton.
- The fibre of the constant point-to-false map over false is a singleton; keeping the endpoint is essential.
- The zero symmetric space supplies the distinguished base point; it is not an arbitrary unrecorded form.
- For the hyperbolic category HE, GW(HE)≃K(E).
- A four-periodic shifted-duality statement does not imply GW_i≅GW_{i+4}; homotopy degree and duality shift are separate indices.

**6.5.12 Higher Grothendieck–Witt groups.** Define `higherGrothendieckWittGroup`: For i≥0, GW_i(E)=π_i of the pointed Grothendieck–Witt fibre space; in degree zero use its canonical abelian H-space component group, not a shifted-duality index.
*Hypotheses.* Use actual pointed homotopy groups and orthogonal sum.
*API.* `higherGrothendieckWittGroup` (constructor: Pointed homotopy group of the Grothendieck–Witt fibre.); `higherGrothendieckWittGroup_map` (functoriality: Nonsingular exact form functors induce group maps.); `higherGrothendieckWittGroup_zero` (compatibility: π0 as a type is equivalent to path components of the fibre. Its canonical abelian H-space law and comparison with exact GW0 are the separate components theorem and group-completion interface of 6.1.6.).
(Source: Schlichting, *Hermitian K-theory of exact categories*, printed pp.121–122, Proposition 4.11 and Definition 4.12.)
*Needs:* Mathlib `HomotopyGroup`, `HomotopyGroup.pi0EquivZerothHomotopy`, 6.5 `grothendieckWittSpace`.
**Checks.**
- GW_0 agrees with the exact presentation, including metabolic relations.
- For HE the higher groups agree with ordinary K_i(E).
- For the terminal pointed fibre, each pointed homotopy group is a singleton; this does not use a duality shift or a periodicity hypothesis.

**6.5.13 Orthogonal additivity on GW spaces.** Prove the comparison: Orthogonal sum of exact form functors induces the sum of their maps on the pointed GW H-space; a natural form isometry gives a homotopy.
(Source: Schlichting, *Hermitian K-theory of exact categories*, §4.2 and Corollary 9.6 proof, printed pp.118,161.)
*Needs:* 6.5 `grothendieckWittSpace`, 6.2 `orthogonalSum`, 6.1 `groupCompletion`.

**6.5.14 Degree-zero comparison for the GW space.** Prove the comparison: There is a natural additive isomorphism π₀GW(E)≅GW₀(E) with the previously defined metabolic presentation, compatible with forgetful and hyperbolic maps.
*Hypotheses.* Essentially small exact category with strong exact duality; no 1/2 assumption.
(Source: Schlichting, *Hermitian K-theory of exact categories*, Proposition 4.11 and full proof, printed pp.121–122.)
*Needs:* 6.5 `grothendieckWittSpace`, 6.4 `ExactGW0`, 6.4 `ExactW0`, 6.1 `exactKGroup`, 6.8 (formation loop comparison), 6.8 (formation detects hyperbolic kernel).
**Checks.**
- The comparison respects the hyperbolic image of an actual exact object.
- The degree-zero class is the metabolic GW presentation, not just unconstrained free isometry classes.

### 6.6 Cofinality

**6.6.1 Cofinal object complement.** Prove: For a full extension-closed cofinal inclusion A⊂B, every object X of B admits T with X⊕T in A.
(Source: Schlichting, *Hermitian K-theory of exact categories*, §5.1, printed p.124.)
*Needs:* 6.2 `ExactCategoryDuality.ofExactFunctor`.

**6.6.2 Cofinal hermitian comma contraction.** Prove: The two comma-category inclusions in the proof of hermitian cofinality have contractible classifying spaces.
(Source: Schlichting, *Hermitian K-theory of exact categories*, Theorem 5.1 full proof, printed pp.126–127.)
*Needs:* 6.6 (cofinal object complement), 6.2 `hyperbolicSpace`, 6.2 (diagonal lagrangian for opposite forms), 6.5 `HermitianQ`, 6.1 `quillenTheoremA`.

**6.6.3 Cofinal hermitian Q fibration.** Prove: For a duality-preserving cofinal fully exact inclusion, |Qh A|→|Qh B|→|H(B,A)| is a homotopy fibration; H(B,A) is the comma category for the relative hyperbolic map K0(B,A)→GW0(B,A).
(Source: Schlichting, *Hermitian K-theory of exact categories*, Theorem 5.1, printed pp.126–127.)
*Needs:* 6.6 (cofinal hermitian comma contraction), 6.4 `grothendieckWittHyperbolic`, 6.1 `quillenTheoremA`.

**6.6.4 Grothendieck–Witt cofinality.** Prove: A duality-preserving cofinal inclusion induces isomorphisms on GW_i for i≥1 and a monomorphism on GW0. Surjectivity on GW0 is not asserted.
(Source: Schlichting, *Hermitian K-theory of exact categories*, Corollary 5.2 and full proof, printed pp.127–128.)
*Needs:* 6.6 (cofinal hermitian q fibration), 6.5 `grothendieckWittSpace`, 6.1 `exactKGroup`.

### 6.7 Hermitian cones, suspension and the nonconnective spectrum

**6.7.1 Hermitian cone diagrams.** Define `HermitianConeDiagram`: C0(E,E) is the full subcategory of functors on the linear order N⊔N-op, all forward positions preceding every backward position. Forward arrows are inflations, backward arrows deflations. For a uniform k, all crossing arrows U_i→U^(i+k) are inflations and U_(i+k)→U^i deflations.
*API.* `HermitianConeDiagram` (constructor: The full-subcategory object is an actual functor with the specified admissibility conditions.); `HermitianConeDiagram.diagram` (projection: The underlying functor on N⊔N-op.); `HermitianConeDiagram.constant` (constructor: Embed an exact object as its constant diagram.); `HermitianConeDiagram.crossingBound` (characterisation: A single natural number controls both crossing families.).
(Source: Schlichting, *Hermitian K-theory of exact categories*, §9.1, printed pp.154–155.)
*Needs:* Mathlib `CategoryTheory.ObjectProperty.FullSubcategory`, 6.2 `ExactCategoryDuality.ofExactFunctor`.
**Checks.**
- Constant diagrams satisfy the conditions with k=0.
- A diagram whose forward map is multiplication by 2 on a projective Z-module fails inflation.
- Separate crossing bounds that are unbounded in i do not supply a cone object.

**6.7.2 Cone diagrams are extension closed.** Prove: The cone conditions are closed under pointwise conflations, giving the induced exact structure on C0(E,E).
(Source: Schlichting, *Hermitian K-theory of exact categories*, §9.1, printed p.155.)
*Needs:* 6.7 `HermitianConeDiagram`.

**6.7.3 Hermitian cone shifts.** Construct `coneLowerShift`: The forward-row shift U[k] replaces U_i by U_(i+k) and leaves U^i unchanged; the backward-row shift U^[k] replaces U^i by U^(i+k) and leaves U_i unchanged. Their natural maps are U→U[k] and U^[k]→U. The shifts commute and preserve pointwise conflations.
*API.* `coneLowerShift` (constructor: The lower-row reindexing exact endofunctor.); `coneUpperShift` (constructor: The upper-row reindexing exact endofunctor.); `coneLowerShiftMap` (data: The natural map from the identity to the lower shift.); `coneUpperShiftMap` (data: The natural map from the upper shift to the identity.).
(Source: Schlichting, *Hermitian K-theory of exact categories*, §9.1, printed p.155.)
*Needs:* 6.7 `HermitianConeDiagram`.
**Checks.**
- The zero shift is the identity.
- Two lower shifts add their indices.
- A lower and an upper shift commute.

**6.7.4 Cone duality exchanges shifts.** Prove: Dualizing a cone diagram exchanges its forward and backward rows and interchanges the lower and upper shifts, reversing the comparison maps.
(Source: Schlichting, *Hermitian K-theory of exact categories*, §9.1, printed p.155.)
*Needs:* 6.7 `coneLowerShift`, 6.2 `ExactCategoryDuality.ofExactFunctor`.

**6.7.5 Cone fraction morphisms.** Construct `ConeFraction`: The cone morphisms U→V are the filtered colimit of Hom_C0(U^[i],V[j]); representatives agree after sufficiently increasing both shift indices.
*API.* `ConeFraction` (constructor: A shifted middle map and its two indices.); `ConeFraction.advance` (constructor: Increase both shift indices by composing the canonical shift maps.); `ConeFraction.equivalent` (characterisation: Equality of those specific advanced maps at a common larger shift.); `ConeFraction.comp` (constructor: Shift the two representatives to compose; the new indices are their sums.); `ConeFraction.toLocalization` (compatibility: The universal comparison to categorical localization.).
(Source: Schlichting, *Hermitian K-theory of exact categories*, Definition 9.1, printed pp.155–156.)
*Needs:* 6.7 `coneLowerShift`.
**Checks.**
- Unshifted maps embed faithfully.
- Every lower and upper comparison map becomes invertible.
- Constant-diagram morphisms agree with the original E morphisms.

**6.7.6 Cone fraction composition laws.** Prove: The representative g[j] composed with f^[k] defines associative, representative-independent composition with the shift comparisons as identities.
(Source: Schlichting, *Hermitian K-theory of exact categories*, Definition 9.1, printed pp.155–156.)
*Needs:* 6.7 `ConeFraction`.

**6.7.7 Cone localization exactness.** Prove: A sequence in C(E,E) is a conflation exactly when it is isomorphic to a localized pointwise conflation; these sequences form an exact structure and duality descends.
(Source: Schlichting, *Hermitian K-theory of exact categories*, Lemma 9.2 and full proof, printed pp.156–158.)
*Needs:* Mathlib `CategoryTheory.MorphismProperty.Localization`, `CategoryTheory.MorphismProperty.Q`, 6.7 (cone diagrams are extension closed), 6.7 (cone fraction composition laws), 6.7 (cone duality exchanges shifts).

**6.7.8 Constant cone embedding is fully exact.** Prove: The constant-diagram embedding E→C(E,E) is fully faithful, exact and reflects conflations.
(Source: Schlichting, *Hermitian K-theory of exact categories*, Lemma 9.3 and full proof, printed pp.158–159.)
*Needs:* 6.7 (cone localization exactness).

**6.7.9 Constant cone embedding is s-filtering.** Prove: For idempotent-complete E, its fully exact constant inclusion into C(E,E) satisfies all four s-filtering conditions.
(Source: Schlichting, *Hermitian K-theory of exact categories*, Lemma 9.3 full proof, printed pp.158–159.)
*Needs:* 6.7 (constant cone embedding is fully exact), 6.7 `coneLowerShift`.

**6.7.10 Relative cone quotient equivalence.** Prove: For the fully exact inclusion A⊂U of the source, C(A,A)/A→C(U,A)/U is an exact duality-preserving equivalence.
(Source: Schlichting, *Hermitian K-theory of exact categories*, Lemma 9.4 and full proof, printed pp.159–160.)
*Needs:* 6.7 (cone localization exactness), 6.7 (constant cone embedding is s-filtering).

**6.7.11 Cone zero extension shift.** Construct `coneZeroExtension`: The simultaneous backward shift [-1] inserts zero at index 0 in both rows and takes the old (i−1)-component at i≥1; it is exact and duality-preserving.
*API.* `coneZeroExtension` (constructor: The diagram functor with the initial zero inserted.); `coneZeroExtension_zero` (simp: Both components at zero are zero objects.); `coneZeroExtension_successor` (simp: Both successor components recover the original components.).
(Source: Schlichting, *Hermitian K-theory of exact categories*, Lemma 9.5 proof, printed p.160.)
*Needs:* 6.7 `HermitianConeDiagram`.
**Checks.**
- The new zero-position component is zero.
- Its index-one component is the original index-zero component.
- Duality commutes with this simultaneous shift.

**6.7.12 Hermitian cone swindle functor.** Construct `coneSwindle`: T is the pointwise sum of all nonnegative iterates of the zero-extension shift. At index i only the first i+1 terms contribute, so no countable coproduct hypothesis on E is introduced.
*API.* `coneSwindle` (constructor: The locally finite diagonal sum exact endofunctor.); `coneSwindle_component` (simp: The i-th component is the finite sum of shifted source components.); `coneSwindle_duality` (compatibility: The simultaneous dual shift makes T a form functor.).
(Source: Schlichting, *Hermitian K-theory of exact categories*, Lemma 9.5 proof, printed pp.160–161.)
*Needs:* 6.7 `coneZeroExtension`, 6.2 `orthogonalSum`.
**Checks.**
- At index zero T has the original zero-index object.
- At index one its component is U1⊕U0.
- For the zero diagram every component is zero.

**6.7.13 Cone swindle descends to localization.** Prove: T sends both shift comparison families to isomorphisms in C(E,E), hence descends as an exact form endofunctor.
(Source: Schlichting, *Hermitian K-theory of exact categories*, Lemma 9.5 proof, printed p.161.)
*Needs:* 6.7 `coneSwindle`, 6.7 (cone fraction composition laws).

**6.7.14 Hermitian swindle absorption.** Prove: On the localized cone, the exact form functors id orthogonal-sum T and T are naturally isometric.
(Source: Schlichting, *Hermitian K-theory of exact categories*, Lemma 9.5 proof, printed pp.160–161.)
*Needs:* 6.7 (cone swindle descends to localization).

**6.7.15 Hermitian cone category.** Construct `hermitianCone`: For the small exact category E with strong exact duality, C(E,E) is the exact diagram category of Schlichting section 9.1, localized at its specified shift morphisms, with induced strong exact duality and its embedded copy of E.
*Hypotheses.* C(E,E) is the filtered diagram/cone category of §9, not a ring of dummy symbols. Do not replace a hermitian cone by the ordinary K-theory cone without a duality comparison.
*API.* `hermitianCone` (constructor: The diagram cone category with exact structure and strong duality.); `hermitianConeLocalization` (data: The canonical functor from genuine cone diagrams to their shift localization.); `hermitianConeLocalization_inverts` (functoriality: Each specified shift morphism becomes an isomorphism under that localization.).
(Source: Schlichting, *Hermitian K-theory of exact categories*, §9.1, Definition 9.1 and Lemmas 9.2–9.4, printed pp.154–160.)
*Needs:* 6.7 (cone localization exactness), 6.7 (constant cone embedding is fully exact).
**Checks.**
- The cone of the zero exact category is equivalent to the zero exact category.
- The shift maps chosen for localization become isomorphisms.
- The embedded E objects retain their original morphisms, exact conflations and pairings.

**6.7.16 Contractibility of the hermitian cone space.** Prove: GW(C(E,E)) is contractible, using the source exact form endofunctor T and its natural form isomorphism id orthogonal-sum T isomorphic to T.
*Hypotheses.* C(E,E) is the filtered diagram/cone category of §9, not a ring of dummy symbols. Do not replace a hermitian cone by the ordinary K-theory cone without a duality comparison.
(Source: Schlichting, *Hermitian K-theory of exact categories*, printed pp.159–162, Lemma 9.5, Corollary 9.6, Definition 9.10.)
*Needs:* 6.7 (hermitian swindle absorption), 6.5 (orthogonal additivity on gw spaces).
**Checks.**
- The comparison retains the source hypotheses: C(E,E) is the filtered diagram/cone category of §9, not a ring of dummy symbols.

**6.7.17 Hermitian suspension of an exact category.** Construct `hermitianSuspension`: For idempotent-complete exact E with strong exact duality, S_h E=C(E,E)/E is Schlichting's hermitian suspension, the actual filtering exact quotient of the diagram cone, equipped with its induced strong exact duality.
*Hypotheses.* C(E,E) is the filtered diagram/cone category of §9, not a ring of dummy symbols. Do not replace a hermitian cone by the ordinary K-theory cone without a duality comparison.
*API.* `hermitianSuspension` (constructor: The specified exact quotient with induced strong duality.); `hermitianSuspension_map` (functoriality: Compatible exact form functors induce suspension form functors.); `hermitianSuspension_duality` (compatibility: The quotient form functor from the cone intertwines the induced suspension duality with the cone duality.).
(Source: Schlichting, *Hermitian K-theory of exact categories*, printed pp.159–162, Lemma 9.5, Corollary 9.6, Definition 9.10.)
*Needs:* 6.7 `hermitianCone`, 6.9 (hermitian filtering localization), 6.7 (constant cone embedding is s-filtering).
**Checks.**
- The cone GW space is contractible by id⊥T≅T.
- The quotient is by the embedded E and retains exact duality.
- Every constant diagram from E has zero image in the filtering quotient C(E,E)/E.

**6.7.18 Loop comparison under hermitian completion.** Prove the comparison: The idempotent-completion map Omega GW(S_h E) -> Omega GW(completion(S_h E)) is an equivalence, by hermitian cofinality.
*Hypotheses.* No invertibility of two is imposed on this exact-category model.
(Source: Schlichting, *Hermitian K-theory of exact categories*, printed p.162, Theorem 9.11 and Remark 9.12.)
*Needs:* 6.7 `hermitianSuspension`, 6.6 (grothendieck–witt cofinality).
**Checks.**
- The comparison retains the source hypotheses: No invertibility of two is imposed on this exact-category model.

**6.7.19 Hermitian suspension delooping.** Prove: For idempotent-complete exact E with strong exact duality, GW(E) is equivalent to Omega GW(S_h E).
*Hypotheses.* No invertibility of two is imposed on this exact-category model.
(Source: Schlichting, *Hermitian K-theory of exact categories*, printed p.162, Theorem 9.11 and Remark 9.12.)
*Needs:* 6.7 `hermitianSuspension`, 6.9 (hermitian filtering localization), 6.7 (contractibility of the hermitian cone space).
**Checks.**
- Idempotent completion is explicitly retained before iteration.
- The analogous Ω|Qʰ(S_h E)| completion map is not always a π_0 isomorphism.

**6.7.20 Nonconnective hermitian spectrum.** Construct `nonconnectiveHermitianSpectrum`: Iterating idempotent-completed hermitian suspension gives the Omega-spectrum with levels GW(E), GW(completion(S_h E)), GW(completion(S_h^2 E)), and so on, and structure equivalences induced by hermitian delooping. Its homotopy groups in all integer degrees are the nonconnective hermitian groups.
*Hypotheses.* Keep hermitian structure maps and all idempotent completions. The sequence of |Qʰ(˜S_hⁿ E)| spaces alone is generally not an Ω-spectrum.
*API.* `nonconnectiveHermitianSpectrum` (constructor: The completed hermitian-suspension Ω-spectrum.); `nonconnectiveHermitianSpectrum_loop` (relation: Each adjacent structure map is a loop equivalence.); `nonconnectiveHermitianSpectrum_homotopy` (characterisation: The homotopy group in any integer degree is the corresponding nonconnective hermitian group, with the fixed suspension convention.).
(Source: Schlichting, *Hermitian K-theory of exact categories*, printed p.162, Remark 9.12.)
*Needs:* 6.7 (hermitian suspension delooping), 6.7 (loop comparison under hermitian completion), 6.5 `higherGrothendieckWittGroup`.
**Checks.**
- For the zero exact category, all integer-degree nonconnective hermitian groups are zero.
- For HE negative groups recover nonconnective K groups.
- If an exact category has nonzero negative K group, its hyperbolic Qh-only tower fails an adjacent loop equivalence; replacing the fibre levels by Qh levels loses that group.

**6.7.21 Nonconnective hyperbolic comparison.** Prove the comparison: For the hyperbolic exact category HE with its exchange duality, the completed-suspension nonconnective hermitian spectrum is naturally equivalent to the nonconnective K-theory spectrum of 6.1.5 of E.
*Hypotheses.* Keep hermitian structure maps and all idempotent completions. The sequence of |Qʰ(˜S_hⁿ E)| spaces alone is generally not an Ω-spectrum.
(Source: Schlichting, *Hermitian K-theory of exact categories*, printed p.162, Remark 9.12.)
*Needs:* 6.7 `nonconnectiveHermitianSpectrum`, 6.1 `nonconnectiveKSpectrum`.
**Checks.**
- Positive degrees agree with Quillen K groups; degree zero uses the idempotent-completed derived-category convention of the imported spectrum.

### 6.8 Formations

**6.8.1 Formation.** Define `Formation`: A formation is a perfect symmetric space with two specified admissible Lagrangians. An isometry must carry each named Lagrangian to the corresponding one.
*API.* `Formation` (constructor: A symmetric space and two actual ExactLagrangian objects.); `Formation.first` (projection: The first admissible Lagrangian.); `Formation.second` (projection: The second admissible Lagrangian.); `Formation.swap` (constructor: Exchange the two named Lagrangians.).
(Source: Schlichting, *Hermitian K-theory of exact categories*, §4.3, printed pp.119–120.)
*Needs:* 6.2 `ExactLagrangian.ofConflation`, 6.2 `SymmetricIsometry`.
**Checks.**
- Using the same Lagrangian twice gives a trivial formation class.
- Interchanging the Lagrangians reverses its class.
- Over Q, the two coordinate Lagrangians of the hyperbolic plane are a formation; a non-isotropic coordinate does not qualify.

**6.8.2 Formation group.** Construct `FormationGroup`: The formation group is the free abelian group on formation isometry classes, modulo orthogonal additivity, concatenation [L1,L2]+[L2,L3]=[L1,L3], and common admissible isotropic reduction.
*API.* `FormationGroup` (constructor: The actual group quotient by the three relation families.); `FormationGroup.of` (constructor: The class of a formation.); `FormationGroup.concat` (relation: The three-Lagrangian concatenation relation.); `FormationGroup.reduce` (relation: Common admissible isotropic reduction leaves the class unchanged.); `FormationGroup.lift` (universal-property: A function on formation classes respecting all three relations induces a unique additive map.).
(Source: Schlichting, *Hermitian K-theory of exact categories*, §4.3, printed pp.119–120.)
*Needs:* Mathlib `FreeAbelianGroup`, 6.8 `Formation`, 6.2 `orthogonalSum`, 6.3 `isotropicReduction`.
**Checks.**
- The class [L,L] is zero by concatenation.
- Swapping gives its additive negative.
- Reducing both Lagrangians by a common admissible isotropic subobject preserves the formation class.

**6.8.3 Formation loop comparison.** Prove the comparison: Sending (X,L1,L2) to the loop formed by the L1 path followed by the inverse L2 path identifies the formation group with π1|Qh E| at zero.
(Source: Schlichting, *Hermitian K-theory of exact categories*, Proposition 4.9 and full proof, printed pp.120–121; Lemma 4.15 full proof pp.123–124.)
*Needs:* 6.8 `FormationGroup`, 6.5 `HermitianQ`, 6.1 `groupCompletion`.

**6.8.4 Formation detects hyperbolic kernel.** Prove: The homomorphism from formations to ExactK0 sending a formation to [L1]−[L2] has image equal to the kernel of the hyperbolic homomorphism.
(Source: Schlichting, *Hermitian K-theory of exact categories*, Lemma 4.10 and full proof, printed p.121.)
*Needs:* Tau Ceti `TauCeti.ExactK0.of`, 6.8 `FormationGroup`, 6.4 `grothendieckWittHyperbolic`, 6.4 (witt group as the hyperbolic cokernel).

### 6.9 Localisation for Dedekind rings

**6.9.1 Canonical residue duality coefficient.** Prove the comparison: For a Dedekind ring R, nonzero prime p and line bundle M with involution, the right adjoint residue dual coefficient RHom_R(R/p,M) is canonically (p^−1M/M)[−1]. A choice of uniformizer identifies p^−1M/M with M/pM; this last identification is not canonically natural under ramified base change.
*Hypotheses.* Use derived Hom with its actual shift and residue-module structure. A uniformizer choice is recorded when replacing the canonical coefficient by the unshifted residue line.
(Source: Calmès–Dotto–Harpaz–Hebestreit–Land–Moi–Nardin–Nikolaus–Steimle III, Lemma 2.2.2 and proof, physical p.37.)
*Needs:* derived Hom for perfect complexes and a symmetric Poincaré structure, with a derived/exact comparison. **Gap:** these are not supplied by 6.5, whose input is an exact category with strong duality.
**Checks.**
- The residue term has a −1 duality shift, not degree zero.
- For Z→Z[i] at 2, the integer 2 does not become a uniformizer at (1+i), so the naive residue-field identity is not the induced map.

**6.9.2 Hermitian filtering localization.** Prove: For a duality-preserving s-filtering inclusion A⊂U of exact categories with strong duality, with A idempotent complete, |QʰA|→|QʰU|→|Qʰ(U/A)| is a pointed homotopy fibre sequence over zero.
*Hypotheses.* The four source s-filtering conditions and idempotent completeness are retained. The map W₀(U)→W₀(U/A) need not be surjective.
(Source: Schlichting, *Hermitian K-theory of exact categories*, §8.1, Theorem 8.2 and Remark 8.3, printed pp.140–141.)
*Needs:* 6.5 `HermitianQ`. **Gap:** the duality-stable exact quotient `U/A`, its four s-filtering conditions, and the induced duality need named construction/API targets. The ordinary envelope quotient in 6.1.5 does not provide the general hermitian quotient. The current dependency of 6.7.17 on this later result requires an explicit reordered construction.
**Checks.**
- A fully exact inclusion without the four s-filtering conditions is not enough.
- Idempotent completeness of A is an explicit hypothesis.

**6.9.3 Symmetric Grothendieck–Witt localization for Dedekind rings.** Prove: For R,M as above, a set S of nonzero primes and every duality shift r, there is a canonical fibre sequence ⊕_{p∈S}GW(R/p;Q^s_{RHom_R(R/p,M)}[r])→GW(R;Q^s_M[r])→GW(R_S;Q^s_{M_S}[r]). With chosen uniformizers the left coefficient is (M/pM)[r−1].
*Hypotheses.* This is the symmetric Poincaré flavour at the spectrum level. No 2-unit assumption is imposed for this theorem; the analogous quadratic spectrum sequence fails at dyadic primes without additional restrictions. **Gap:** the stable Poincaré structures, dévissage equivalence, and spectrum-level localization inputs of this theorem are not constructed by 6.9.1 or by the filtering exact-category theorem 6.9.2.
(Source: Calmès–Dotto–Harpaz–Hebestreit–Land–Moi–Nardin–Nikolaus–Steimle III, Theorem 2.2.4, Corollary 2.2.5 and Remark 2.2.6, physical pp.38–39.)
*Needs:* 6.9 (canonical residue duality coefficient).
**Checks.**
- The left shift is r−1 after a uniformizer choice.
- Quadratic L-theory at the prime 2 cannot simply replace symmetric L-theory in this sequence.

### 6.10 Periodicity and number rings

**6.10.1 Classical hermitian Bott triangle.** Prove the comparison: For the uniquely 2-divisible dg category with weak equivalences and duality in Schlichting Theorem 6.1, GW^[r](A) -> K(A) -> GW^[r+1](A) -> Sigma GW^[r](A) is an exact triangle, with forgetful and hyperbolic maps.
*Hypotheses.* The dg model, weak equivalences and pretriangulated/smallness conventions are those of Schlichting. This theorem does not assert integral four-periodicity for genuine symmetric GW at dyadic coefficients.
(Source: Schlichting, *Hermitian K-theory, derived equivalences and Karoubi’s fundamental theorem*, SchlichtingDerived Theorem 6.1 and proof, physical pp.57–58; the dg-category carrier, its shifted dualities, and its comparison with the exact-category model of 6.5 remain gaps.)
*Needs:* 6.5 `grothendieckWittSpace`, 6.1 `waldhausenS`.
**Checks.**
- The comparison retains the source hypotheses: The dg model, weak equivalences and pretriangulated/smallness conventions are those of Schlichting.

**6.10.2 shifted Karoubi periodicity.** Prove the comparison: For a dg category with weak equivalences and duality whose mapping complexes are uniquely 2-divisible, the shifted classical GW spectra satisfy GW^[r+4](A) equivalent to GW^[r](A). This shifts the duality index, not the higher homotopy degree.
*Hypotheses.* The dg model, weak equivalences and pretriangulated/smallness conventions are those of Schlichting. This theorem does not assert integral four-periodicity for genuine symmetric GW at dyadic coefficients.
(Source: Schlichting, *Hermitian K-theory, derived equivalences and Karoubi’s fundamental theorem*, Introduction, physical pp.2–4; Theorems 6.1–6.2 are announced here.)
*Needs:* 6.5 `grothendieckWittSpace`, 6.1 `waldhausenS`.
**Checks.**
- The equality relates shift r with r+4 while keeping homotopy degree fixed.
- The hypothesis 2 invertible cannot be removed by citing the characteristic-free exact-category definitions.

**6.10.3 Number-ring homotopy-limit comparison.** Prove: For a Dedekind ring R whose fraction field is a number field, a line bundle M with involution ±1 and any duality shift r, GW(R;Q^s_M[r])→K(R;Q^s_M[r])^{hC₂} is a 2-adic equivalence. Its classical symmetric connective-cover specialization is an equivalence in nonnegative degrees after 2-completion.
*Hypotheses.* Do not replace 2-adic completion by localization at 2 or claim an integral equivalence in the presence of real embeddings. The spectrum, stable Poincaré-category, and homotopy-fixed-point carriers must be supplied before this comparison can be constructed; 6.1 only supplies exact-category K-theory. **Gap:** no lower-tier supplier contract or construction of these carriers and their comparison with 6.5 is given here.
(Source: Calmès–Dotto–Harpaz–Hebestreit–Land–Moi–Nardin–Nikolaus–Steimle III, Theorem 3.1.7 and full proof, physical pp.51–52.)
*Needs:* 6.9 (symmetric grothendieck–witt localization for dedekind rings).
**Checks.**
- A number ring with real places requires 2-completion; the rational signature contribution prevents the unqualified integral statement.
- Classical connective groups give the nonnegative-degree specialization.

**6.10.4 Berrick–Karoubi comparison after inverting two.** Prove: For a Dedekind ring R with number-field fraction field and epsilon=±1, GW^s(R;epsilon)→GW^s(R[1/2];epsilon) is a 2-local equivalence on connected covers, hence in strictly positive homotopy degrees, and is injective in degree zero.
*Hypotheses.* A degree-zero isomorphism is not asserted. 2-local equivalence is distinct from the preceding 2-adic homotopy-limit comparison.
(Source: Calmès–Dotto–Harpaz–Hebestreit–Land–Moi–Nardin–Nikolaus–Steimle III, Proposition 3.1.11 and proof, physical p.53.)
*Needs:* 6.9 (symmetric grothendieck–witt localization for dedekind rings), 6.10 (number-ring homotopy-limit comparison).
**Checks.**
- The map on π₀ is injective; it need not be surjective.
- The theorem compares R with R[1/2], not GW with ordinary K without duality.

**6.10.5 Classical homotopy-limit obstruction.** Prove: For a ring R and invertible coefficient bimodule M with involution, if the mod-2 map from connective classical symmetric GW to K homotopy fixed points is n-truncated, n≥0, then Lgs(R;M)→Ls(R;M) is (n−1)-truncated.
(Source: Calmès–Dotto–Harpaz–Hebestreit–Land–Moi–Nardin–Nikolaus–Steimle III, Proposition 3.1.13 and full proof, printed pp.53–54.)
*Needs:* 6.10 (genuine l-theory after inverting two).

**6.10.6 Genuine L-theory after inverting two.** Prove the comparison: For any ring R, invertible coefficient bimodule M with involution and m∈Z∪{±∞}, L(R;Q_M^≥m)[1/2]→L(R;Q_M^s)[1/2] is an equivalence.
(Source: Calmès–Dotto–Harpaz–Hebestreit–Land–Moi–Nardin–Nikolaus–Steimle III, Proposition 3.1.14 and full proof, printed p.54.)

### 6.11 The integers

**6.11.1 Classical integral degree-zero groups.** Prove the comparison: For Z, symmetric classical GW0 is Z⊕Z generated by ⟨1⟩,⟨−1⟩; symplectic GW0 is Z generated by the rank-two alternating hyperbolic form.
(Source: Calmès–Dotto–Harpaz–Hebestreit–Land–Moi–Nardin–Nikolaus–Steimle III, §3.2, printed pp.54–55.)
*Needs:* 6.4 `ExactGW0`.

**6.11.2 Integral symmetric table, residue 0.** Prove the comparison: For k≥0 and n=8k+0≥1, the classical symmetric group is Z⊕Z/2 and the classical symplectic group is 0. Here w_(2m) is the denominator of |B_(2m)/(4m)| and K_n(Z)_odd is the actual odd torsion subgroup; unrestricted cyclicity is not assumed.
(Source: Calmès–Dotto–Harpaz–Hebestreit–Land–Moi–Nardin–Nikolaus–Steimle III, Theorem 3.2.2, Remark 3.2.1 and full proof, printed pp.55–57.)
*Needs:* 6.10 (berrick–karoubi comparison after inverting two), 6.10 (number-ring homotopy-limit comparison).

**6.11.3 Integral symmetric table, residue 1.** Prove the comparison: For k≥0 and n=8k+1≥1, the classical symmetric group is (Z/2)^3 and the classical symplectic group is 0. Here w_(2m) is the denominator of |B_(2m)/(4m)| and K_n(Z)_odd is the actual odd torsion subgroup; unrestricted cyclicity is not assumed.
(Source: Calmès–Dotto–Harpaz–Hebestreit–Land–Moi–Nardin–Nikolaus–Steimle III, Theorem 3.2.2, Remark 3.2.1 and full proof, printed pp.55–57.)
*Needs:* 6.10 (berrick–karoubi comparison after inverting two), 6.10 (number-ring homotopy-limit comparison).

**6.11.4 Integral symmetric table, residue 2.** Prove the comparison: For k≥0 and n=8k+2≥1, the classical symmetric group is (Z/2)^2⊕K_(8k+2)(Z)_odd and the classical symplectic group is Z⊕K_(8k+2)(Z)_odd. Here w_(2m) is the denominator of |B_(2m)/(4m)| and K_n(Z)_odd is the actual odd torsion subgroup; unrestricted cyclicity is not assumed.
(Source: Calmès–Dotto–Harpaz–Hebestreit–Land–Moi–Nardin–Nikolaus–Steimle III, Theorem 3.2.2, Remark 3.2.1 and full proof, printed pp.55–57.)
*Needs:* 6.10 (berrick–karoubi comparison after inverting two), 6.10 (number-ring homotopy-limit comparison).

**6.11.5 Integral symmetric table, residue 3.** Prove the comparison: For k≥0 and n=8k+3≥1, the classical symmetric group is Z/w_(4k+2) and the classical symplectic group is Z/(2w_(4k+2)). Here w_(2m) is the denominator of |B_(2m)/(4m)| and K_n(Z)_odd is the actual odd torsion subgroup; unrestricted cyclicity is not assumed.
(Source: Calmès–Dotto–Harpaz–Hebestreit–Land–Moi–Nardin–Nikolaus–Steimle III, Theorem 3.2.2, Remark 3.2.1 and full proof, printed pp.55–57.)
*Needs:* 6.10 (berrick–karoubi comparison after inverting two), 6.10 (number-ring homotopy-limit comparison).

**6.11.6 Integral symmetric table, residue 4.** Prove the comparison: For k≥0 and n=8k+4≥1, the classical symmetric group is Z and the classical symplectic group is Z/2. Here w_(2m) is the denominator of |B_(2m)/(4m)| and K_n(Z)_odd is the actual odd torsion subgroup; unrestricted cyclicity is not assumed.
(Source: Calmès–Dotto–Harpaz–Hebestreit–Land–Moi–Nardin–Nikolaus–Steimle III, Theorem 3.2.2, Remark 3.2.1 and full proof, printed pp.55–57.)
*Needs:* 6.10 (berrick–karoubi comparison after inverting two), 6.10 (number-ring homotopy-limit comparison).

**6.11.7 Integral symmetric table, residue 5.** Prove the comparison: For k≥0 and n=8k+5≥1, the classical symmetric group is 0 and the classical symplectic group is Z/2. Here w_(2m) is the denominator of |B_(2m)/(4m)| and K_n(Z)_odd is the actual odd torsion subgroup; unrestricted cyclicity is not assumed.
(Source: Calmès–Dotto–Harpaz–Hebestreit–Land–Moi–Nardin–Nikolaus–Steimle III, Theorem 3.2.2, Remark 3.2.1 and full proof, printed pp.55–57.)
*Needs:* 6.10 (berrick–karoubi comparison after inverting two), 6.10 (number-ring homotopy-limit comparison).

**6.11.8 Integral symmetric table, residue 6.** Prove the comparison: For k≥0 and n=8k+6≥1, the classical symmetric group is K_(8k+6)(Z)_odd and the classical symplectic group is Z⊕K_(8k+6)(Z)_odd. Here w_(2m) is the denominator of |B_(2m)/(4m)| and K_n(Z)_odd is the actual odd torsion subgroup; unrestricted cyclicity is not assumed.
(Source: Calmès–Dotto–Harpaz–Hebestreit–Land–Moi–Nardin–Nikolaus–Steimle III, Theorem 3.2.2, Remark 3.2.1 and full proof, printed pp.55–57.)
*Needs:* 6.10 (berrick–karoubi comparison after inverting two), 6.10 (number-ring homotopy-limit comparison).

**6.11.9 Integral symmetric table, residue 7.** Prove the comparison: For k≥0 and n=8k+7≥1, the classical symmetric group is Z/w_(4k+4) and the classical symplectic group is Z/w_(4k+4). Here w_(2m) is the denominator of |B_(2m)/(4m)| and K_n(Z)_odd is the actual odd torsion subgroup; unrestricted cyclicity is not assumed.
(Source: Calmès–Dotto–Harpaz–Hebestreit–Land–Moi–Nardin–Nikolaus–Steimle III, Theorem 3.2.2, Remark 3.2.1 and full proof, printed pp.55–57.)
*Needs:* 6.10 (berrick–karoubi comparison after inverting two), 6.10 (number-ring homotopy-limit comparison).

**6.11.10 Integral symmetrization cofiber.** Prove: The cofiber C of Lgq(Z)→Lgs(Z) has π1=Z/2, π0=Z/8, π−1=Z/2, and all other homotopy groups zero. The degree-zero L map is multiplication by 8.
(Source: Calmès–Dotto–Harpaz–Hebestreit–Land–Moi–Nardin–Nikolaus–Steimle III, Lemma 3.2.7 and full proof, printed p.58.)
*Needs:* 6.9 (symmetric grothendieck–witt localization for dedekind rings).

**6.11.11 Integral quadratic Grothendieck–Witt groups.** Prove the comparison: Classical quadratic GW0(Z)=Z⊕Z, with generators Hq and E8; GW1(Z)=(Z/2)^2. Symmetrization identifies quadratic and symmetric GW_n(Z) for every n≥2.
(Source: Calmès–Dotto–Harpaz–Hebestreit–Land–Moi–Nardin–Nikolaus–Steimle III, Theorem 3.2.9 and full proof, printed pp.58–59.)
*Needs:* 6.11 (classical integral degree-zero groups), 6.11 (integral symmetrization cofiber), 6.11 (integral symmetric table, residue 1).

**6.11.12 Skew integral symmetrization cofiber.** Prove: The cofiber D of L−gq(Z)→L−gs(Z) is equivalent to Σ²C, with the symmetrization map identified under the two double-suspension equivalences.
(Source: Calmès–Dotto–Harpaz–Hebestreit–Land–Moi–Nardin–Nikolaus–Steimle III, Lemma 3.2.10 and full proof, printed p.59.)
*Needs:* 6.11 (integral symmetrization cofiber).

**6.11.13 Low skew-duality K homotopy orbits.** Prove: For K(Z) with the skew-duality C2 action, π1 of the homotopy-orbit spectrum is Z/4 and π2 is zero.
(Source: Calmès–Dotto–Harpaz–Hebestreit–Land–Moi–Nardin–Nikolaus–Steimle III, Lemma 3.2.11 and full proof, printed pp.59–60.)
*Needs:* 6.10 (berrick–karoubi comparison after inverting two), 6.11 (integral symmetric table, residue 1), 6.11 (integral symmetric table, residue 2).

**6.11.14 Integral skew-quadratic Grothendieck–Witt groups.** Prove the comparison: Classical skew-quadratic GW_n(Z), for n=0,1,2,3, is respectively Z⊕Z/2, Z/4, Z and Z/24. For n≥4 it agrees with symplectic GW_n(Z). The Z/2 in degree zero is the Arf class.
(Source: Calmès–Dotto–Harpaz–Hebestreit–Land–Moi–Nardin–Nikolaus–Steimle III, Theorem 3.2.13 and full proof, printed pp.60–61.)
*Needs:* 6.11 (skew integral symmetrization cofiber), 6.11 (low skew-duality k homotopy orbits), 6.11 (integral symmetric table, residue 3).

### Examples

Over a field with `2` invertible, the symmetric `W₀` of finite-dimensional vector spaces is additively isomorphic to the underlying Witt group of QuadraticFormInvariants Layer 4 under `B ↦ B(x,x)/2`. This convention is not a unital tensor-ring comparison: the bilinear unit `⟨1⟩` maps to `⟨1/2⟩`. The hyperbolic plane has Witt class `0` and nonzero class in `GW₀`. For the hyperbolic category `HE` the Grothendieck–Witt space is `K(E)`. The zero exact category has all hermitian groups zero. Over `ℤ` the symmetric Grothendieck–Witt groups in degrees `0` to `7` modulo the ordinary `K(ℤ)` contributions are the eight rows of 6.11, with `GW₀^s(ℤ) = ℤ ⊕ ℤ` generated by `⟨1⟩` and `⟨−1⟩`.

### Dependencies

GrothendieckEulerForms Layer 0 (intrinsic exact structures, conflation-exact functors) and Layer 2 (exact Grothendieck groups), Tau Ceti `ExactStructure` and `ExactK0`; Layer 2 (the field and signed hermitian comparisons); the 6.1 targets; Mathlib `CategoryTheory.nerve`, `SSet.toTop`, `HomotopyGroup`, `CategoryTheory.Localization`, biproducts and `IsPullback`.

## Downstream consumers

ArithmeticStatistics ST.0 (families, heights and measures) and DiophantineApproximationAndTranscendence DT.0 (heights and approximation constants) consume Layer 1; DiophantineApproximationAndTranscendence DT.4 and EffectiveDiophantineMethods ED.1 (lattice reduction and integer relations) consume Layer 5 and use only its exported certificate and approximation factor; ProbabilisticAndMetricNumberTheory PM.4 consumes Layer 4. The Grothendieck–Witt groups of Layer 6 are the degree-zero and higher hermitian invariants that a stable Poincaré-category treatment of hermitian K-theory compares against.

## References

Locators in the layers refer to the following editions.

- **Couveignes, *Enumerating number fields*** — Jean-Marc Couveignes, *Enumerating number fields*. Annals of Mathematics 192 (2020), 487–497. https://annals.math.princeton.edu/wp-content/uploads/annals-v192-n2-p04-s.pdf
- **Horesh–Karasik 2023** — Tal Horesh and Yakov Karasik, *Equidistribution of primitive lattices in R^n*. The Quarterly Journal of Mathematics 74 (2023), 1253–1294, DOI 10.1093/qmath/haad008; version of record deposited at ISTA. https://research-explorer.ista.ac.at/download/14717/14720/2023_QuarterlyJourMath_Horesh.pdf
- **Horesh–Karasik, arXiv v2** — Tal Horesh and Yakov Karasik, *Equidistribution of primitive lattices in R^n*. arXiv:2012.04508v2, 28 October 2021; superseded by the 2023 published text. https://arxiv.org/pdf/2012.04508v2
- **Evertse, *Geometry of numbers*** — Jan-Hendrik Evertse, *Diophantine approximation, Chapter 2: Geometry of numbers*. Author-hosted dio19-2.pdf linked by the Fall 2023 course page. https://pub.math.leidenuniv.nl/~evertsejh/dio19-2.pdf
- **Henk, *Successive minima and lattice points*** — Martin Henk, *Successive Minima and Lattice Points*. arXiv:math/0204158v1 (12 April 2002), seven-page preprint. Author bibliography lists Rend. Circ. Mat. Palermo (2), Suppl.70 (2002), 377–384. https://arxiv.org/pdf/math/0204158v1
- **Lenstra–Lenstra–Lovász 1982** — A. K. Lenstra, H. W. Lenstra, Jr., L. Lovász, *Factoring polynomials with rational coefficients*. Math. Ann. 261 (1982), 515–534; scanned academic mirror with reprint folios 27–46. https://www.math.ucdavis.edu/~deloera/MISC/LA-BIBLIO/trunk/Lovasz/LovaszLenstraLenstrafactor.pdf
- **Voight, *Quaternion algebras*** — John Voight, *Quaternion algebras*. Author post-publication v.1.0.7u, 5 August 2026. https://jvoight.github.io/quat-book.pdf
- **Li–Zhang, *Kudla–Rapoport cycles*** — Chao Li, Wei Zhang, *Kudla–Rapoport cycles and derivatives of local densities*.  https://arxiv.org/pdf/1908.01701v3
- **Schlichting, *Hermitian K-theory of exact categories*** — Marco Schlichting, *Hermitian K-theory of exact categories*.  https://webhomes.maths.ed.ac.uk/~v1ranick/papers/schlicht.pdf
- **Schlichting, *Hermitian K-theory, derived equivalences and Karoubi’s fundamental theorem*** — Marco Schlichting, *Hermitian K-theory, derived equivalences and Karoubi’s Fundamental Theorem*. arXiv:1209.0848v3, 7 September 2016. https://arxiv.org/pdf/1209.0848v3
- **Calmès–Dotto–Harpaz–Hebestreit–Land–Moi–Nardin–Nikolaus–Steimle III** — Baptiste Calmès, Emanuele Dotto, Yonatan Harpaz, Fabian Hebestreit, Markus Land, Kristian Moi, Denis Nardin, Thomas Nikolaus, Wolfgang Steimle, *Hermitian K-theory for stable infinity-categories III: Grothendieck–Witt groups of rings*. arXiv:2009.07225v4, 27 April 2026. https://arxiv.org/pdf/2009.07225v4
- **Bhargava–Shankar, *Binary quartic forms*** — Manjul Bhargava, Arul Shankar, *Binary quartic forms having bounded invariants, and the boundedness of the average rank of elliptic curves*.  https://arxiv.org/pdf/1006.1002v2
- **Duke 1988** — W. Duke, *Hyperbolic distribution problems and half-integral weight Maass forms*. Published-layout author copy, Invent. Math. 92 (1988), 73–90. https://www.math.ucla.edu/~wdduke/preprints/hyperbolic.pdf
- **Benoist, *Arithmeticity of discrete subgroups*** — Yves Benoist, *Arithmeticity of discrete subgroups*.  https://www.imo.universite-paris-saclay.fr/~yves.benoist/prepubli/19ArithmeticityLectures.pdf
- **Morris, *Introduction to arithmetic groups*** — Dave Witte Morris, *Introduction to Arithmetic Groups*.  https://arxiv.org/pdf/math/0106063v6
- **Regev, *Transference theorems* (lecture 11)** — Oded Regev; scribe Elad Verbin, *Transference Theorems, Lattices in Computer Science, Lecture 11*. Fall 2004, author-hosted lecture notes. https://cims.nyu.edu/~regev/teaching/lattices_fall_2004/ln/transference.pdf
- **Aggarwal–Stephens-Davidowitz 2019** — Divesh Aggarwal; Noah Stephens-Davidowitz, *An improved constant in Banaszczyk’s transference theorem*. arXiv:1907.09020v1, 21 July 2019. https://arxiv.org/pdf/1907.09020v1
- **Kirschmer, *One-class genera of maximal integral quadratic forms*** — Markus Kirschmer, *One-class genera of maximal integral quadratic forms*. Author preprint, June 2013. https://www.math.rwth-aachen.de/~Markus.Kirschmer/papers/maxgen.pdf
- **Mahler 1946** — Kurt Mahler, *On lattice points in n-dimensional star bodies I. Existence theorems*. Published-layout archival copy, Proc. Royal Society A 187 (1946), 151–187. https://carmamaths.org/resources/mahler/docs/090.pdf
- **Schulze-Pillot, *Lecture notes on quadratic forms*** — Rainer Schulze-Pillot, *Lecture notes on quadratic forms and their arithmetic*. arXiv:2008.12847v2, 21 March 2021. https://arxiv.org/pdf/2008.12847
- **Voight, *Identifying the matrix ring* (2012)** — John Voight, *Identifying the matrix ring: algorithms for quaternion algebras and quadratic forms*. arXiv:1004.0994v2, 30 April 2012. https://arxiv.org/pdf/1004.0994
- **Emery–Kim 2022** — Vincent Emery and Inkang Kim, *Quaternionic hyperbolic lattices of minimal covolume*. Version of record, Forum of Mathematics, Sigma 10 (2022), e68, pp.1–19; DOI 10.1017/fms.2022.43. https://www.cambridge.org/core/services/aop-cambridge-core/content/view/FB96042ED962BAA031D1F39C7A8AA012/S2050509422000433a.pdf/quaternionic-hyperbolic-lattices-of-minimal-covolume.pdf
- **Kurinczuk–Skodlerack–Stevens** — Robert Kurinczuk, Daniel Skodlerack and Shaun Stevens, *Endo-parameters for p-adic classical groups*. arXiv:1611.02667v3, 31 August 2020. https://arxiv.org/pdf/1611.02667
- **Voight, *Identifying the matrix ring* (2019 revision)** — John Voight, *Author revision, 21 May 2019, 38 physical pages*.  https://jvoight.github.io/articles/quatalgs-051919.pdf
- **Voight, *Identifying the matrix ring*, errata** — John Voight, *Author errata, 21 May 2019, two pages, read in full*. Algorithm 3.22 correction, no Example 3.14 correction. https://jvoight.github.io/articles/quatalgs-errata.pdf
- **Quillen, *Higher algebraic K-theory I*** — D. Quillen, in *Algebraic K-theory I*, Lecture Notes in Mathematics 341 (1973), 85–147.
- **Waldhausen, *Algebraic K-theory of spaces*** — F. Waldhausen, in *Algebraic and geometric topology*, Lecture Notes in Mathematics 1126 (1985), 318–419.
- **Gan–Hanke–Yu 2001** — Wee Teck Gan, Jonathan Hanke and Jiu-Kang Yu, *On an exact mass formula of Shimura*. Duke Mathematical Journal 107 (2001), 103–133. Author-hosted published-layout copy. https://web.math.princeton.edu/~jonhanke/Web-02/Mass-Formula-of-Shimura/shimura-mass.pdf
- **Schlichting, *Higher Algebraic K-Theory*** — Marco Schlichting, *Higher Algebraic K-Theory (After Quillen, Thomason and Others)*, lecture notes, §§2.4.3–2.4.6, printed pp.181–183. https://warwick.ac.uk/fac/sci/maths/people/staff/marco_schlichting/research/sedanosln2008.pdf
- **Skodlerack–Stevens** — Daniel Skodlerack and Shaun Stevens, *Intertwining semisimple characters for p-adic classical groups*, accepted manuscript, §4, Theorem 4.4 and proof, pp.13–14. https://ueaeprints.uea.ac.uk/id/eprint/60983/1/Xin_manucript_2016.pdf
- **Schlichting, *Delooping the K-theory of exact categories*** — M. Schlichting, Topology 43 (2004), 1089–1103.
- **Segal, *Categories and cohomology theories*** — G. Segal, Topology 13 (1974), 293–312.
- **McDuff–Segal** — D. McDuff and G. Segal, *Homology fibrations and the group-completion theorem*, Invent. Math. 31 (1976), 279–284.
- **Iwaniec 1987** — H. Iwaniec, *Fourier coefficients of modular forms of half-integral weight*, Invent. Math. 87 (1987), 385–401.
- **Conway–Sloane** — J. H. Conway and N. J. A. Sloane, *Sphere packings, lattices and groups*, 3rd edition, Grundlehren 290 (1999).

## Misprints in the sources

The following passages of the sources are misprinted or incomplete as printed; the targets above use the corrected statements. Each item gives the passage and the correction.

- **E1** (Couveignes2020, §3, published p.493 (PDF p.7).) Use 𝓛 ⊗_Z R, equivalently rationalize over Z first and then extend from Q to R.
- **E2** (Published p.1290 (physical PDF p.38), paragraph immediately after the proof of Proposition B.3; the preprint p.34 (physical p.34) has the stronger finite-group claim.) For nonsaturated Λ only Δ/Λ has nonzero torsion. Its map to π(Δ) has kernel (Δ∩span_R Λ)/Λ; π(Δ), being a subgroup of a real vector space, is torsion-free. B.3 itself remains valid under primitivity.
- **E3** (Published p.1290, Proposition B.4 proof, three transitions from squared Gram determinants to signed block determinants.) Use absolute values on all three determinants, or explicitly select compatible positively oriented bases/coordinates before these steps. The covolume quotient theorem is unchanged.
- **E4** (Preprint p.28, Example A.5; compare published p.1285, Example A.4.) The numerator is adj(BᵀB). The published displayed formula corrects it; its following prose still calls the adjugate that of B and should also say BᵀB.
- **E5** (Preprint p.34, Proposition B.5 proof, final paragraph and preceding span label; compare published p.1291.) Use the last complementary columns C of B: π(B) as an image lattice is spanned by π(C), not π(B′). The preceding common-span label must be VΛ-perp rather than VΛ. The published text replaces the proof with the correct direct pairing argument.
- **E6** (Preprint p.29, Proposition A.6 proof; compare published pp.1285–1286, Lemma A.5 and Proposition A.6.) Specify the quotient Haar measure and show the duality is induced by the identity on SO(n) and the inverse-transpose Cartan automorphism on GL(d). The published text supplies that argument; no measure-space claim is used in this blueprint.
- **E7** (Published p.1261, Definition 2.2, orientation on an arbitrary full lattice in VΛ-perp.) For arbitrary full L the criterion is det(B|C)>0. Equality to one is valid only with the additional normalization covol(Λ)covol(L)=1, which is imposed on the subsequently defined space of pairs but not on the stated arbitrary L.
- **E8** (Author course chapter dio19-2.pdf, Lemma 2.10, printed p.26 (physical p.16).) The coefficients of the r given vectors are indexed by i=1,…,r, matching both sums. The ambient dimension is n.
- **E9** (arXiv math/0204158v1, p.2, sentence after (1.2); preprint only.) For the displayed floor brackets, read greatest integer not greater than x.
- **E10** (§9.4.5: publisher version of record (2021), printed p.144 / physical p.160; also post-publication v1.0.7u (5 August 2026), printed p.140 / physical p.160. Both passages read; updated passage visually verified.) Every finitely generated torsion-free module over a DVR is free. The lattice applications have that torsion-free hypothesis because their carriers are submodules of a fraction-field vector space.
- **E11** (Course chapter dio19-2.pdf, remark after Theorem 2.9, printed pp.24–25 (physical PDF pp.14–15).) Require an invertible real linear transformation (a linear equivalence). Its nonzero determinant permits cancellation in the following covolume-to-volume quotient.
- **E12** (Example 9.8.2, post-publication v1.0.7u (5 August 2026), printed p.147 / physical p.167, final uniqueness assertion; rendered page inspected.) The stated normalization of a does not give a unique coefficient triple [a,1,c] within an integral isometry class. Retain existence of an atomic presentation, and require a separate justified classification/normalization for uniqueness.
- **E13** (Example 2.2, printed p.109 / physical PDF p.5; rendered author copy inspected.) Read P(R) as finitely generated projective right R-modules. The following bidual isomorphism and split exact category with duality assertion use that restriction.
- **E14** (arXiv math/0106063v6, prose immediately before Theorem 20.3.3, printed p.413 / physical p.429; rendered page inspected.) Insert unipotent in the preceding orbit-closure summary, as in the immediately following Theorem 20.3.3.
- **E15** (Example 3.14, printed p.13) Both correction terms have a minus sign.
