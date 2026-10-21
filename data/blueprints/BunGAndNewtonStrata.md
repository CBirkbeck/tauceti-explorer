# Roadmap: reductive bundles, B(G) and Newton strata

**Summary.** The Fargues–Fontaine curve turns Frobenius modules into bundles. For a connected reductive structure group, build the exact tensor version of this construction, classify its geometric objects by B(G), and recover the topology, stabilizers and dimensions of Newton strata. The end results are the smooth Artin v-stack Bun_G, its uniformization, and filtered charts whose images are the specialization neighborhoods of Newton classes.

## Scope and ownership

This roadmap owns algebraic G-isocrystals, sigma classes, the class invariants κ and ν, algebraic centralizers J_b, acceptable and ordinary classes, and the reductive bundle consequences. IgusaVarietiesAndTorsionConcentration IG.0, EndoscopicTransferAndUnitaryTraceComparison ET.5 and ExcursionOperatorsAndSpectralAction import these definitions. The algebraic classification uses no analytic RF4 lattice patching. The geometric theory separates the full bundle automorphism v-group from its algebraic isocrystal automorphism quotient.

VectorBundlesAndIsocrystals owns the linear isocrystal, curve-bundle, HN and Banach–Colmez theory. RelativeFarguesFontaine owns the relative curve and lattice patching; BG proves the structured uniformization and invariant consequences. GeometricSatakeAndFusion GS0 supplies loop quotients and Schubert geometry; VStackSheavesAndLisseCategories VS0 supplies Artin formalism and VS1 its Jacobian criterion. The whole-stack atlas uses neither the later filtered charts nor Satake, GS4 or VS4. The specific unitary flag dimension and ordinary comparisons retain the PEL input of IgusaVarietiesAndTorsionConcentration.

Existing [ReductiveGroupsPartII](https://github.com/TauCetiProject/TauCetiRoadmap/blob/0d144d044dacebca17b654695b6f1ad58f159b27/TauCetiRoadmap/ReductiveGroupsPartII/README.md) RG2.1.5 owns integral π₁, z-extensions and representative Kottwitz homomorphisms. Its RG2.4.2 owns generic rational-point Kottwitz surjectivity, including its rational quotient. Import these contracts; here only sigma-class descent and the centralizer applications are new. The algebraic fundamental-group subsection below specifies the consumed interface. Existing [AlgebraicVectorBundles](https://github.com/TauCetiProject/TauCetiRoadmap/blob/0d144d044dacebca17b654695b6f1ad58f159b27/TauCetiRoadmap/AlgebraicVectorBundles/README.md) owns general scheme bundle foundations. The present curve-bundle targets add the relative analytic FF specialization and its tensor comparisons.

## Conventions

Let E be a nonarchimedean local field with residue field F_q, π a uniformizer, and L its completed maximal unramified extension. Choose an algebraic closure k of F_q. Frobenius σ is arithmetic q-Frobenius and fixes π. In mixed characteristic L is the fraction field of the ramified Witt vectors of k; when E=Q_p this agrees with Mathlib's WittVector.Isocrystal coefficient field. The p-adic statements of the routed papers retain E=Q_p or their explicitly stated p-adic extensions. Statements requiring a reductive integral model, a quasi-split form, a minuscule cocharacter or an unramified restriction of scalars retain those hypotheses.

The representation category Rep_E(G) means finite-dimensional rational algebraic-group representations. Tau Ceti already supplies FGPointRepresentationCat, its rigid symmetric monoidal equivalence with finite comodules and the field-valued Tannakian reconstruction of algebra-valued points. A representation of the abstract group G(E) is insufficient. Exact tensor functors preserve bundle short exact sequences, tensor products, the unit and duals. Isomorphisms are tensor natural isomorphisms, not just identifications of a faithful vector space. The relative analytic reconstruction theorem is an additional assertion.

The slope protorus D has character group Q. A rank-one isocrystal with Frobenius π^m has isocrystal slope m and produces O(−m). For dominant Newton vectors the bundle convention is ν_bundle=w₀(−ν_isocrystal); the first Chern invariant is −κ. For GL_n we order slopes in decreasing order and compare partial sums with equal total. Dominance uses positive **coroots** in a rational cocharacter space.

We use b′=g b σ(g)⁻¹ for sigma conjugacy. The inverse-g convention in several sources gives the same quotient. The representative Kottwitz map takes values in π₁(G)_I; the class invariant takes values in the full Galois coinvariants π₁(G)_Γ. Rational averaging relates κ⊗1 to ν, and loses integral torsion. The order on B(G) fixes κ and increases dominant ν. GIZ26 v3 Theorem7.18 (pp.51–53), together with the schematic order comparison, supplies the topology in both characteristics. Its topology satisfies [b]≤[b′] exactly when E_b′ is in the closure of E_b; a basic point generalizes to more unstable points in its κ fibre. A rational Newton orbit need not have an E-rational representative inside G. Its central morphism inside J_b does descend for every b.

BG uses arithmetic translation lifts mu(pi), whose Kottwitz image is +[mu]. Upstream RG2.4 labels the same point by -mu because its apartment translation parameter uses inverse Kottwitz. Its dominant displacement converts by nu_std=-w_0(nu_disp). In split GL_2, diag(pi,1) has upstream dominant displacement (0,-1), arithmetic Newton point (1,0), and kappa=1. Length and dominance comparisons also transport the chosen chamber.

For the bundle moduli, tildeJ_b is the full automorphism v-group. Its positive Banach–Colmez kernel has dimension ⟨2ρ,ν_b⟩; the stratum has the negative dimension. The chart uses the opposite extension filtration and negative-slope extension spaces. The framed chart is not an absolute diamond, although its punctured complement is locally spatial and its map to the point is representable in locally spatial diamonds. The chart quotient is an Artin v-stack. These absolute and relative assertions are distinct. For ℓ-cohomological assertions fix a prime ℓ≠p. The separate finite-coefficient curve comparison treats p-torsion by tilting and Artin–Schreier theory.

The abelianized Weil construction is restricted to the stated p-adic setting. Its discrete coefficient points are taken in L^sep with the natural Weil action, including inertia; L itself is insufficient. For isocrystal slope λ, A_λ=End_Φ(D_λ) has arithmetic Brauer invariant −λ. The bundle has slope −λ; right-module Morita uses Hom(E_b,E) with precomposition and inverse M⊗_A E_b. FS’s Hom(E,E_b) convention uses left modules. The one-third test detects the sign; one-half does not.

## Exact supplier contracts

Consume the following interfaces only in their stated scope. A requested refinement is not a consequence of a broad stage name; the precise missing inputs are collected after the layers. General algebraic-space and structured descent is imported through R09.3 from SchemeAndStackFoundations SF.1 and upstream ModularCurves 0E. It does not by itself prove analytic reductive-torsor reconstruction or the coefficient-ring arc comparison.

### From Mathlib and Tau Ceti

Use Mathlib at `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti at `f790474821cf4256814db967cb154e7af3d0c369`. The native declarations supply the following exact inputs; their conclusions do not include the relative geometric assertions that follow.

- [`TauCeti.ReductiveAffineGroupSchemeCat`](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/AlgebraicGeometry/AffineGroupScheme/Reductive.lean): Finite-type reductive affine group schemes over a field via the Hopf-algebra equivalence; does not supply local Newton theory.
- [`TauCeti.AffineGroupSchemeCat`](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/AlgebraicGeometry/AffineGroupScheme/Basic.lean): Affine group objects over Spec of a bundled commutative ring, not arbitrary-base relative group schemes.
- [`TauCeti.Cocharacter.parabolic`](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Algebra/AlgebraicGroup/Dynamic/Parabolic.lean): Dynamic parabolic subgroup of the convolution group of A-valued points of a Hopf algebra. Relative representability and filtered-functor descent remain separate inputs.
- [`TauCeti.Cocharacter.leviGroupExtension`](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Algebra/AlgebraicGroup/Dynamic/LeviDecomposition/Basic.lean): GroupExtension of dynamic unipotent, parabolic and Levi point groups, with limit homomorphism; not the relative filtered group-scheme theorem of FS III.5.2.
- [`WittVector.Isocrystal`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/WittVector/Isocrystal.lean): Frobenius-semilinear equivalence on a module over FractionRing of p-typical Witt vectors. Finite dimensionality is additional; the file proves rank-one classification. General E and the rigid exact category come from VB0.
- [`CategoryTheory.Functor.Monoidal`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/CategoryTheory/Monoidal/Functor.lean): Strong monoidal structure on an actual functor, including inverse unit/tensor maps and coherence; exactness and rational group-scheme representations are additional inputs.
- [`CategoryTheory.Equivalence`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/CategoryTheory/Equivalence.lean): Functor, inverse and natural unit/counit isomorphisms; a set bijection is weaker.
- [`Subgroup`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Group/Subgroup/Defs.lean): Subgroups of a group, used for the expressible pointwise sigma-centralizer prototype, not its representability.
- [`RootPairing`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/RootSystem/Defs.lean): Paired root/coroot data. Galois action, reductive fundamental group, rational dominant chamber and local affine Weyl group are supplier work, not consequences of this type alone.
- [`Specializes`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Topology/Defs/Filter.lean): Topological specialization; orientation is fixed by b<=bprime iff Ebprime lies in the closure of Eb.
- [`MulEquiv`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Group/Equiv/Defs.lean): An actual multiplicative equivalence, used for the group Frobenius prototype.
- [`Rat.pos`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Data/Rat/Defs.lean): The reduced rational denominator is positive; Finset filtering records its slope multiplicity.
- [`TauCeti.FGPointRepresentationCat`](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Algebra/AlgebraicGroup/Representation/Comodule/Equivalence.lean): Finite natural algebra-valued point representations of a commutative Hopf algebra, equivalent to finite comodules; over a field these are finite-dimensional rational representations.
- [`TauCeti.FGPointRepresentationCat.instRigidCategory`](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Algebra/AlgebraicGroup/Representation/Comodule/Monoidal.lean): The finite representation category is rigid symmetric monoidal via transport from finite comodules; reuse this existing structure.
- [`TauCeti.Tannaka.fgPointTensorIsoEquiv`](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Algebra/AlgebraicGroup/Representation/Tannaka/Equivalence.lean): For a field k and commutative Hopf algebra H, A-valued points are tensor automorphisms of scalar extension on finite H-comodules; does not assert analytic torsor reconstruction.
- [`TauCeti.ExactStructure`](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/CategoryTheory/Exact/ExactStructure.lean): Chosen Quillen exact structure on an additive category with zero object and binary biproducts; the owner supplies the distinguished conflations.
- [`TauCeti.ExactStructure.IsConflationExact`](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/CategoryTheory/Exact/Functor.lean): Native preservation of the specified conflations by an additive functor. This does not assert preservation of all finite limits and colimits.
- [`CategoryTheory.Functor.Linear`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/CategoryTheory/Linear/LinearFunctor.lean): A functor between E-linear categories respects scalar multiplication of morphisms.
- [`CategoryTheory.Functor.Braided`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/CategoryTheory/Monoidal/Braided/Basic.lean): Strong monoidal functor with compatibility with the braiding; between symmetric categories this is the symmetric tensor structure.
- [`CategoryTheory.NatTrans.IsMonoidal`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/CategoryTheory/Monoidal/NaturalTransformation.lean): Unit and tensor compatibility for natural transformations between monoidal functors; a natural isomorphism alone is insufficient.
- [`TauCeti.AlgHom.mapValue`](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Algebra/AlgebraicGroup/FunctorOfPoints.lean): Postcomposition by an E-algebra map is a homomorphism of native convolution point groups for a commutative Hopf algebra; used for coefficient Frobenius and coefficient change.
- [`TauCeti.MultiplicativeGroup.pointsMulEquiv_mapValue`](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Algebra/AlgebraicGroup/MultiplicativeGroup/Basic.lean): The Laurent-polynomial Hopf point group is multiplicatively equivalent to units, naturally under coefficient algebra maps. This supplies the G_m Frobenius comparison.
- [`WittVector.exists_frobenius_solution_fractionRing`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/WittVector/FrobeniusFractionField.lean): Over an algebraically closed residue field of characteristic prime p, each nonzero Witt fraction a admits a nonzero b and integer m satisfying φ(b)a=p^m b. This provides existence of rank-one normal forms, not the full general-E category.
- [`WittVector.FractionRing.frobenius`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/WittVector/Isocrystal.lean): For a perfect domain of characteristic p, native Frobenius extends to a ring equivalence of the p-typical Witt fraction field.
- [`CategoryTheory.Groupoid`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/CategoryTheory/Groupoid.lean): A native category in which each morphism has an inverse. The representative groupoid keeps every twisted conjugator rather than replacing orbit classes by a discrete category.
- [`CategoryTheory.Aut.Aut_mul_def`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/CategoryTheory/Endomorphism.lean): Native Aut multiplication is reversed categorical composition; this gives the usual point-stabilizer multiplication for the representative groupoid.
- [`Algebra.TensorProduct.map`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/TensorProduct/Maps.lean): Tensor products of algebra homomorphisms give algebra homomorphisms; here coefficient maps act as f⊗id_L.
- [`Algebra.TensorProduct.congr`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/TensorProduct/Maps.lean): Tensor products of algebra equivalences give algebra equivalences; here Frobenius is id_A⊗σ on A⊗_E L.
- [`TauCeti.DiagonalizableGroup.weightSpace`](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Algebra/AlgebraicGroup/DiagonalizableGroup/Weight.lean): Corestriction of a representation comodule along a coalgebra map to a group algebra defines weight submodules and their internal direct-sum decomposition.
- [`TauCeti.DiagonalizableGroup.finite_setOf_weightSpace_ne_bot`](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Algebra/AlgebraicGroup/DiagonalizableGroup/Weight.lean): For a finitely generated representation module, the nonzero weight submodules after corestriction to a group algebra have finite support.
- [`TauCeti.MonoidAlgebra.mapDomainBialgHom_surjective`](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Algebra/Bialgebra/MonoidAlgebra/GroupLike.lean): Over a commutative ring with connected prime spectrum, every bialgebra map between monoid algebras is induced by a monoid homomorphism; the adjacent injectivity theorem assumes a nontrivial base. A field satisfies both conditions.
- [`TauCeti.FGComoduleCat.scalarExtensionMonoidalFunctor`](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Algebra/Coalgebra/Comodule/Finite/ScalarExtension/Monoidal.lean): Native strong monoidal scalar extension of finite comodules to L-modules, with the tensorator given by inverse tensor-product base-change distribution and the tensor-unit comparison.
- [`TauCeti.Comodule.pointsAction`](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Algebra/AlgebraicGroup/Representation/PointsAction.lean): The native convolution group of algebra-valued Hopf points acts by linear automorphisms of the scalar-extended comodule, multiplicatively in the point.
- [`TauCeti.Tannaka.scalarExtensionComponent`](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Algebra/AlgebraicGroup/Representation/Tannaka/Monoidal.lean): Transport a native tensor-automorphism component to an L-linear map on the explicit module L⊗_E M; the adjacent point-action component lemma identifies this with the native comodule action.
- [`TauCeti.Comodule.rTensor_comp_endOfPoint`](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Algebra/Coalgebra/Comodule/PointsAction.lean): Coefficient postcomposition intertwines the point action with right-tensored coefficient maps. Applying the automorphism σ supplies the semilinear conjugation identity.
- [`TauCeti.Comodule.baseChange_comp_endOfPoint`](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Algebra/Coalgebra/Comodule/PointsAction.lean): A base-changed comodule morphism intertwines the scalar-extended actions of every algebra-valued Hopf point.
- [`TauCeti.Comodule.endOfPoint_tensor`](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Algebra/Coalgebra/Comodule/PointsAction.lean): The point action on a tensor comodule is the tensor product of its two actions, transported by the native base-change distribution isomorphism.
- [`TauCeti.Comodule.endOfPoint_trivial`](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Algebra/Coalgebra/Comodule/PointsAction.lean): The algebra-valued point action is the identity on the scalar extension of a trivial comodule, supplying the tensor-unit equation.
- [`Representation.Coinvariants`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RepresentationTheory/Coinvariants.lean): Native integral representation coinvariants: quotient by the span of ρ(g)a−a, with additive group and module structures. Applied over ℤ to the cyclic Frobenius action; this is not the reductive fundamental group.
- [`Representation.Coinvariants.mk`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RepresentationTheory/Coinvariants.lean): Native ℤ-linear quotient projection; mk_self_apply identifies a with ρ(g)a and mk_surjective is the quotient surjectivity used for descent.
- [`Representation.Coinvariants.map`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RepresentationTheory/Coinvariants.lean): Native induced linear map for an actual intertwining map; map_mk gives its representative formula. Used for integral Kottwitz naturality.
- [`Submodule`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Module/Submodule/Defs.lean): Native submodules closed under addition and scalar multiplication, used for the restricted effective-over-lattice shear controls on Fin 2 → K. This supplies no coefficient DVR, local-shtuka family or Newton classification.
- [`MonoidAlgebra.mapDomainBialgHom`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Bialgebra/MonoidAlgebra.lean): A monoid homomorphism induces an R-bialgebra homomorphism R[M]→R[N], used for n↦nq on the actual integral/rational character groups. It does not construct a general Newton morphism.

### From AlgebraicModuliForArithmeticGeometry

For `AlgebraicModuliForArithmeticGeometry:R09.3`, Use the existing étale/fpqc descent of affine morphisms, torsors and locally free modules. Do not infer the relative filtered reductive-group representability theorem from algebraic-space descent alone; its missing foundation is G02. For families, the specific coefficient-ring arc-descent is Ans22 Lemma11.3: reconstruct torsors from exact tensor functors and reflect exactness using Iva23 Corollary5.6, not an assumed faithfully flat coefficient-ring map.

These inputs are used by [Tannakian description of analytic torsors](#g-torsors-three-descriptions); [Structure group and tensor descent](#structure-group-and-tensor-descent); [Algebraic sigma-centralizer](#sigma-centralizer-J-b); [Pure inner twisting of torsors](#pure-inner-twisting); [Families of G-isocrystals](#families-of-g-isocrystals); [Isocrystal-family v-descent and strata](#isocrystal-family-v-descent); [Finite Frobenius norm centralizer](#finite-frobenius-norm-centralizer).

### From DiamondEtaleCohomology

For `DiamondEtaleCohomology:C1`, Use proper base change under the prime-to-p finite-coefficient hypotheses, including Scholze Corollary16.10(ii), not the j! exchange result of C5. The extra p-torsion tilting/Artin–Schreier computation needed for FS III.2.12(i) is G05.

These inputs are used by [Constant torsion cohomology on the curve](#curve-torsion-cohomology).

### From DiamondsAndVStacks

For `DiamondsAndVStacks:D2`, Use D2 only for pro-étale/v sites. Analytic-adic/diamond étale comparison is the separately read D6/etale-site-comparison; strictly totally disconnected covers and geometric lifting come from D1. The curve/Div^1 comparison remains the RF2/G05 refinement. D6’s read analytic comparison assumes a Z_p base; the equal-characteristic counterpart remains G05. The family descent route also uses the perfect-scheme v-site and normal valuation-ring covers; Iva23 Lemma5.9 gives the stronger perfectoid arc-descent input. Do not identify this site with the perfectoid base of Bun_G.

These inputs are used by [Curve-to-base étale site morphism](#curve-etale-base-site); [Pro-étale torsors on strictly disconnected bases](#strictly-disconnected-torsors); [Grassmannian point lifting](#grassmannian-point-lifting); [Isocrystal-family v-descent and strata](#isocrystal-family-v-descent).

For `DiamondsAndVStacks:D3`, Use D3/locally-profinite-torsors and the actual effective-descent results. Small v-stacks come from D4, groupoid stack quotients from D0. SW18.3.1 clopen comparison is a requested refinement, not supplied by a valuation/support commuting map.

These inputs are used by [Pure inner twisting of torsors](#pure-inner-twisting); [Families of G-isocrystals](#families-of-g-isocrystals); [Isocrystal-family v-descent and strata](#isocrystal-family-v-descent); [Kottwitz invariant in isocrystal families](#family-kottwitz-local-constancy); [Curve-to-base étale site morphism](#curve-etale-base-site); [Moduli v-stack Bun_G](#bun-g-as-v-stack); [Smallness of Bun_G](#bun-g-smallness); [Pro-étale torsors on strictly disconnected bases](#strictly-disconnected-torsors); [Geometrically trivial open locus](#geometrically-trivial-locus); [Central-torus bundle surjectivity](#central-torus-bundle-surjectivity); [Torus bundle Picard stack](#torus-picard-stack); [Full classifying-stack description of a stratum](#stratum-is-classifying-stack); [Reduction of full automorphism torsors](#automorphism-torsor-reduction); [Opposite filtered-bundle chart](#filtered-bundle-chart).

For `DiamondsAndVStacks:D4`, Use D4 for diamonds, small v-stacks, underlying spaces and open substacks. D5 supplies spatiality and relative representability; D6 supplies analytic étale comparison. The escaping-Z-action and ordinary/partial properness criteria used by BG4 are requested refinements (G12), not conclusions of D4 alone.

These inputs are used by [Locally spatial Isom diagonal](#isom-sheaf-representability); [Contracting chart action and proper quotient](#contracting-chart-action); [Newton strata of a minuscule flag variety](#flag-newton-strata); [Closed upper flag Newton unions](#flag-strata-semicontinuity); [Unitary ordinary flag locus](#unitary-ordinary-flag-locus).

For `DiamondsAndVStacks:D6/etale-site-comparison`, Import the equivalence of étale sites between an analytic adic space and its diamond; the curve/Div^1 equivalence is a further RF2/G05 input. The read supplier is for analytic adic spaces over Z_p; an equal-characteristic counterpart is requested in G05 rather than inferred from that statement.

These inputs are used by [Curve-to-base étale site morphism](#curve-etale-base-site); [Constant torsion cohomology on the curve](#curve-torsion-cohomology).

For `DiamondsAndVStacks:D1/strictly-totally-disconnected`, Import the definition and geometric-component description; combine with universally-open-std-cover for the local lifting arguments.

These inputs are used by [Pro-étale torsors on strictly disconnected bases](#strictly-disconnected-torsors); [Grassmannian point lifting](#grassmannian-point-lifting).

For `DiamondsAndVStacks:D3/locally-profinite-torsors`, Import pro-étale presentation of locally profinite torsors, then use split étale covers on strictly totally disconnected bases.

These inputs are used by [Pro-étale torsors on strictly disconnected bases](#strictly-disconnected-torsors).

For `DiamondsAndVStacks:D4/small-v-sheaves-and-small-v-stacks`, Import smallness by a set-sized presentation of v-stacks; do not cite D3 as the definition of smallness.

These inputs are used by [Moduli v-stack Bun_G](#bun-g-as-v-stack); [Smallness of Bun_G](#bun-g-smallness).

For `DiamondsAndVStacks:D0/groupoid-quotients-and-two-fibre-products`, Import groupoid quotient stacks and their two-fibre products to formulate Bun_G and its descent.

These inputs are used by [Moduli v-stack Bun_G](#bun-g-as-v-stack).

For `DiamondsAndVStacks:D5/relative-representability`, Import the relative notion of representability in locally spatial diamonds, distinguishing absolute diamondhood from representable maps.

These inputs are used by [Full bundle automorphism v-group](#full-automorphism-v-group); [Positive automorphism kernel geometry](#positive-automorphism-kernel); [Locally spatial Isom diagonal](#isom-sheaf-representability); [Split section and spatial chart complement](#section-and-spatial-complement); [Smooth specialization neighborhoods](#chart-to-bun-g).

### From EndoscopicTransferAndUnitaryTraceComparison

For `EndoscopicTransferAndUnitaryTraceComparison:ET.0`, Use local reductive Galois/Weil cohomology, crossed modules [Gsc→G], quasi-isomorphisms with [Tsc→T] and [Zsc→Z], abelianization and simply connected local H^1 vanishing. Request the degree-two Weil torus vanishing and point-to-curve comparison compatibility in G03. Generic z-extensions come from existing upstream RG2.1.5; induced-torus resolution refinements remain G01; do not construct a second B(G), κ, ν, J_b or acceptable-class theory. Export the identification H^1(E,H)≅(π_1(H)_Γ)_tors for connected reductive local H, using the BG1 Kottwitz invariant, rather than a second invariant definition. Coefficients in the FS Weil complexes are G(L^sep), T(L^sep), etc., with the natural continuous W_E-action on discrete groups, not only L-rational points. Its current ET.0 brief restricts local groups to characteristic-zero fields; the general-E H^1 identification used by the connected-center basic-to-adjoint application is a separate equal-characteristic refinement, not supplied by that brief.

These inputs are used by [Specialness for a transferred centralizer torus](#transferred-torus-specialness); [Abelianized Kottwitz set](#abelianized-kottwitz-set); [Abelianized classes equal fundamental coinvariants](#abelianization-identification); [Diagonalizable Weil–curve comparison](#diagonalizable-curve-cohomology); [Constant crossed-module curve classes](#crossed-module-curve-classes); [Rational Kottwitz images of centralizers](#rational-kottwitz-surjectivity); [Basic classes and adjoint torsors with connected center](#connected-center-basic-inner-forms).

### From GeometricSatakeAndFusion

For `GeometricSatakeAndFusion:GS0:Schubert-smoothness/open-cell-stabilizer-and-smoothness`, Use the read open-cell stabilizer/congruence quotient theorem for all dominant μ, hence cohomological smoothness of open Schubert cells. For minuscule μ deduce the flag quotient by P_μ^− from the congruence description; retain finite splitting-field descent for nonsplit G. Schubert closures need not be smooth.

These inputs are used by [Central-torus Grassmannian surjectivity](#central-torus-grassmannian-surjectivity); [Cohomological smoothness of Bun_G](#bun-g-is-smooth-artin); [Minuscule modification image](#minuscule-modification-image); [Newton strata of a minuscule flag variety](#flag-newton-strata); [Unitary flag Newton dimensions](#unitary-flag-stratum-dimension).

For `GeometricSatakeAndFusion:GS0:loop-geometry/schubert-bounds-and-properness`, Import the current general-E Schubert exhaustion and properness contract, including its Galois-stable nonsplit bounds. It does not state the exact Grassmannian π_1 connected-component identification or its torus lattice representatives. Request that separate component refinement from GS0, with the appropriate inertia/Galois coinvariants and nonsplit descent, supported by Zhu Proposition1.21 and FS III.3.6; BG2 proves the sign under BL. This request does not replan the existing Schubert bounds.

These inputs are used by [Grassmannian point lifting](#grassmannian-point-lifting); [Central-torus Grassmannian surjectivity](#central-torus-grassmannian-surjectivity); [Grassmannian components and Kottwitz sign](#grassmannian-kottwitz-sign); [Newton bound for a modification](#modification-newton-bound).

### From IgusaVarietiesAndTorsionConcentration

For `IgusaVarietiesAndTorsionConcentration:IG.0`, Use its unitary PEL signatures, integral model and comparison of the local B-class with the p-divisible-group Newton stratum of dimension d_b=<2ρ,ν_b>. BG3 constructs the flag Newton strata and proves their dimension d−d_b for precisely this unitary datum. IG.0 imports BG0/BG1 general B(G), κ, ν, J_b and acceptable classes; avoid an edge back from BG1 to PEL geometry. Export the local Hodge–Tate compatibility of the unitary-to-Siegel forgetful map and closed flag immersion at every unramified p in this datum. The read CGH20 v2 Proposition3.3.2 proves its comparison under completely split p; BG cannot silently widen that hypothesis. Sch15 Lemma3.3.6/Remark3.3.7 supplies the ambient ordinary/rational-period criterion.

These inputs are used by [Unitary flag Newton dimensions](#unitary-flag-stratum-dimension); [Unitary ordinary flag locus](#unitary-ordinary-flag-locus).

### From ReductiveGroupsPartII

For `ReductiveGroupsPartII:RG2.1`, Import upstream RG2.1 local/absolute root data, split ranks, integral π_1, Galois/coinvariant maps, z-extensions and representative Kottwitz homomorphisms. Existing targets suffice for those contracts; they are not new work. Remaining refinements: canonical comparison between maximal-torus choices and inner twists (the actual Suggested.lean uses a fixed AbsoluteRootData), unramified-replacement averaging/triality equality for KMPS Proposition1.1.10, and the torsion-free Levi coinvariant kernel used by its minuscule lifting proof. Preserve the covariant inverse-transpose action on cocharacters. The simple integral Levi-kernel formula is already supplied; its coinvariant exactness refinement remains G10. Also export the local-field Frobenius-equivariance equation for the existing representative Kottwitz homomorphism, and its compatibility with the actual integral inertia/Frobenius quotient. Current upstream main states σ-equivariance in prose but explicitly has no Lean target for it; it is the named input to the integral descent statement, not a request to rebuild κ̃.

These inputs are used by [Defect of a sigma class](#defect); [Basic Levi Newton formula](#levi-newton-formula); [Positive automorphism kernel geometry](#positive-automorphism-kernel); [Newton orbit space and rational dominance](#newton-orbit-space); [Newton comparison for a Levi representative](#general-levi-newton-comparison); [Algebraic fundamental group](#algebraic-fundamental-group); [Newton and Kottwitz invariants](#newton-and-kottwitz-maps).

For `ReductiveGroupsPartII:RG2.3`, Import the connected parahoric and positive-loop/fixer structures already planned by upstream RG2.3, preserving the distinction between a parahoric and G(O_L). Request only the precise integral-conjugacy/lifting refinements used by KZ Proposition2.3.3: He–Rapoport6.1(b), He16 Theorem6.1, He–Zhou4.1, He14 Theorem3.5 and Proposition4.5; their proof interiors remain G10. Extended-Weyl double-coset structure is imported from upstream RG2.4. For HK22 §2.1 and Theorem2.11, import the existing connected smooth affine O_E-model with generic fibre G from its parahoric-group-scheme target; no new integral-model theory is planned in BG.

These inputs are used by [Straight Weyl comparison with B(G)](#straight-weyl-classification); [Integral conjugacy of an ordinary admissible element](#ordinary-integral-conjugacy); [Unitary ordinary flag locus](#unitary-ordinary-flag-locus); [Isocrystal-family v-descent and strata](#isocrystal-family-v-descent).

For `ReductiveGroupsPartII:RG2.4`, Import upstream RG2.4 Iwahori–Weyl exact sequences, lengths/Bruhat order, admissible sets, dominant coinvariant cocharacters and Cartan/Iwasawa decompositions, keeping its apartment-translation sign separate from arithmetic κ. Request the σ-straight/twisted-Newton comparison, integral π_1 compatibility, KMPS Wintenberger realization/Satake/unramified Mazur refinements not stated there. Its unramified-combinatorial-comparison target is retained in its stated p-adic setting; request the characteristic-independent reduced-affine-datum comparison needed for the general-field maximum. Central inertia-torsion restoration at fixed κ, HN18 Lemma2.5 integrality and Chai convex-majorant inputs remain G06. BG owns only the resulting B(G,{μ}) and ordinary-class consequences. In the source arithmetic convention, a translation lifted by mu(pi) has class +[mu]; upstream labels this same element by -mu. The requested comparison must transport both the chamber and the nu_std=-w_0(nu_disp) normalization, as detected by diag(pi,1) in split GL_2. Also supply the decent length-zero normalizer lift used in HV20 Lemma5.2, p.906, after enlarging a positive period. The general-field existence target uses this precise lift and the basic/integral comparison, rather than an unsupported extension of Kot85/GLX. Import the existing RG2.4.2/kottwitz-rational-surjectivity contract for G(E); no new generic rational-point surjectivity is requested. BG retains its stated J_b application only.

These inputs are used by [Minuscule basic Levi lifting](#minuscule-basic-levi-lift); [Unique maximum of acceptable classes](#acceptable-unique-maximum); [Straight Weyl comparison with B(G)](#straight-weyl-classification); [Ordinary straight translation and Levi centrality](#ordinary-straight-translation); [Integral conjugacy of an ordinary admissible element](#ordinary-integral-conjugacy); [Levi fibre over a basic G-class](#basic-levi-fibre-uniqueness); [Grassmannian point lifting](#grassmannian-point-lifting); [Newton comparison for a Levi representative](#general-levi-newton-comparison); [Existence of decent representatives](#existence-of-decent-representative); [Rational Kottwitz images of centralizers](#rational-kottwitz-surjectivity).

For `ReductiveGroupsPartII:RG2.1`, The generic z-extension foundation is imported from existing upstream RG2.1.5, not added as RG2.6 and not attributed to the dual/L-group layer RG2.5. Request the remaining general induced-torus surjection/resolution and invariant-lattice surjectivity/descent comparison needed by these BG consumers. Use existing z-extension exact_central, map_galoisAction, surjective_points and fundamentalGroup_torsionFree for their actual contracts. Z-embeddings are outside the upstream scope and are not requested by this roadmap. The resolution contract is a surjective E-group morphism from an induced torus to a given E-torus with a torus kernel, not unrestricted surjectivity on E-points. For the lattice sequence of a z-extension, invariant surjectivity is requested only with the vanishing of continuous H^1(J,X_*(Z)); prove that vanishing for the induced kernel and the stated closed Galois subgroup J. Integral coinvariant right exactness is separate and does not imply invariant surjectivity.

These inputs are used by [Basic Levi Newton formula](#levi-newton-formula); [Minuscule basic Levi lifting](#minuscule-basic-levi-lift); [Elliptic tori and basic acceptable classes](#elliptic-torus-basic-image); [Specialness for a transferred centralizer torus](#transferred-torus-specialness); [Ordinary straight translation and Levi centrality](#ordinary-straight-translation); [Ordinary classes under a derived isogeny](#ordinary-derived-isogeny); [Abelianized Kottwitz set](#abelianized-kottwitz-set); [Central-torus Grassmannian surjectivity](#central-torus-grassmannian-surjectivity); [Local constancy of bundle Kottwitz invariant](#semicontinuity-and-local-constancy); [Algebraic fundamental group](#algebraic-fundamental-group); [Newton orbit space and rational dominance](#newton-orbit-space); [Galois averaging and Hodge invariants](#galois-average); [Newton and Kottwitz invariants](#newton-and-kottwitz-maps); [Torus norm and Newton average](#torus-norm-description); [Rational Kottwitz images of centralizers](#rational-kottwitz-surjectivity); [Bounded lifting through a z-extension](#z-extension-bounded-lifting); [Basic classes and adjoint torsors with connected center](#connected-center-basic-inner-forms).

### From RelativeFarguesFontaine

For `RelativeFarguesFontaine:RF0:annuli`, Use the period-domain annular exhaustion, continuous direct limits of period rings and the punctured-period-domain input in the torsion comparison; the cohomology computation is G05.

These inputs are used by [Constant torsion cohomology on the curve](#curve-torsion-cohomology); [Smallness of Bun_G](#bun-g-smallness).

For `RelativeFarguesFontaine:RF2`, Use Div^1 and its projection as a diamond, with the curve/Div^1 étale-site comparison needed to construct τ. The comparison itself is recorded as a refinement in G05, not confused with a map X_S→S.

These inputs are used by [Curve-to-base étale site morphism](#curve-etale-base-site).

For `RelativeFarguesFontaine:RF2:untilts`, Use B_dR^+ as the complete ξ-adic local ring at the untilt divisor, the field residue quotient, henselian lifting and successive nilpotent thickenings.

These inputs are used by [Grassmannian point lifting](#grassmannian-point-lifting).

For `RelativeFarguesFontaine:RF4:G-torsors/modification-of-G-bundle-by-lattice`, Use the existing tensor-compatible Beauville–Laszlo lattice-to-G-bundle construction and base change. BG2 proves v-surjectivity; BG0/BG1 do not depend on this analytic construction.

These inputs are used by [Beauville–Laszlo uniformization](#beauville-laszlo-surjectivity); [Grassmannian components and Kottwitz sign](#grassmannian-kottwitz-sign); [Newton bound for a modification](#modification-newton-bound); [Class from a de Rham quotient-group lattice](#de-rham-quotient-group-class).

### From VStackSheavesAndLisseCategories

For `VStackSheavesAndLisseCategories:VS0`, Use Artin v-stack descent, representable diagonals, relative ℓ-cohomological smoothness, quotient charts for locally profinite group actions and dimension additivity. The argument for [*/G(E)] is through a smooth quotient chart, with dimensions preserved.

These inputs are used by [Positive automorphism kernel geometry](#positive-automorphism-kernel); [Cohomological dimension of Newton strata](#stratum-dimension); [Cohomological smoothness of Bun_G](#bun-g-is-smooth-artin); [Connected components of Bun_G](#connected-components); [Negative Banach–Colmez tower of a chart](#chart-over-classifying-stack); [Smooth specialization neighborhoods](#chart-to-bun-g).

For `VStackSheavesAndLisseCategories:VS1/jacobian-criterion`, Use the existing Jacobian criterion for sections of a smooth relative space on the curve, with strictly positive tangent-bundle HN slopes. BG4 supplies that positivity; no VS4/GS4/Satake equivalence is needed.

These inputs are used by [Positive tangent criterion for the filtered chart](#chart-jacobian-positivity); [Smooth specialization neighborhoods](#chart-to-bun-g).

### From VectorBundlesAndIsocrystals

For `VectorBundlesAndIsocrystals:VB0`, Export the finite-dimensional isocrystal tensor category over a general local coefficient field E, semilinear descent and change-of-trivialization, with rank-one π^m slope m. No reductive B(G) theory is imported from this linear stage. Export the compatible local algebraic closures, the embedding into the coefficient algebraic closure, arithmetic Frobenius and degree-r unramified fixed fields. Global-v choices of the Shimura paper are not used in the local targets. For the perfect-algebra family application, supply the effective-lattice bound and slope-zero finite étale fixed-section construction used in HK22 v5 Lemmas2.8–2.9/Proposition2.10. Its profinite étale isotriviality requires a perfect normal base; the BG v-stack application handles other perfect bases only after normal v-covers. Correct the field-level effective-over-lattice bound to depend on rank and an initial Frobenius denominator d, using the minimal stable lattice/Nakayama argument of Zin01 Lemma9 author pp.11–12. For a rank-h lattice the iterated sum is bounded by π^(−d(h−1)). A rank-two slope-zero shear with coefficient π^(−N) requires c≥N (E08); do not promise a bound from Newton slopes alone. Over families retain the proper lattice-moduli cover and prove local-freeness separately. At finite level, fixed sections are affine étale; constant slope-zero multiplicity gives finite étale, whose inverse limit is profinite étale (HK22 Lemma2.8).

These inputs are used by [Families of G-isocrystals](#families-of-g-isocrystals); [Isocrystal-family v-descent and strata](#isocrystal-family-v-descent).

For `VectorBundlesAndIsocrystals:VB0/dieudonne-manin-isocrystals`, Use this node only for Dieudonné–Manin decomposition and slope denominator multiplicities. End_Φ(D(a,h)) and its invariant are supplied by the separate VB0/endomorphism-division-algebra and VB0/brauer-invariant-sign nodes; its invariant is −a/h in the arithmetic convention. The curve comparison is VB2:classification/bundle-endomorphism-comparison. Right modules use Hom(E_b,E).

These inputs are used by [Division-algebra Morita comparison](#division-algebra-morita); [Geometric classification of G-bundles](#points-are-B-of-G); [Quasi-split centralizer in the GL minuscule case](#gl-minuscule-quasisplit-centralizer); [Rational slope protorus](#slope-protorus); [Newton and Kottwitz invariants](#newton-and-kottwitz-maps).

For `VectorBundlesAndIsocrystals:VB0/isocrystal-category-and-standard-block`, Reuse VB0’s existing TauCeti.FFBundles.FiniteIsocrystal L σ and its Hom/category, tensor object and endomorphism ring. Export its E-linear preadditive, Quillen exact and rigid symmetric monoidal category structures with coherence, over the actual general local coefficient field. The object and arrow carriers are already suggested; the full structured category needed to instantiate TensorInterface is not. Retain native Witt rank-one compatibility and the standard simple slope block; BG imports these rather than replanning their linear definitions. BG now supplies the whole trivialized Frobenius tensor family and Tannakian arrow reconstruction on native rational comodules; this request still supplies the untrivialized target category and its structured comparisons, rather than duplicating that presentation.

These inputs are used by [G-isocrystals](#g-isocrystals-and-B-of-G).

For `VectorBundlesAndIsocrystals:VB0/tensor-and-dual-slopes`, Use tensor/dual/exactness of linear slope gradings, with Frobenius eigenvalue valuation determining the isocrystal slope.

These inputs are used by [G-isocrystals](#g-isocrystals-and-B-of-G).

For `VectorBundlesAndIsocrystals:VB1`, Export the actual relative analytic FF finite locally free bundle category with its E-linear Quillen exact symmetric tensor structure, pullback coherence and effective v-descent. The existing scheme CurveBundle and upstream AlgebraicVectorBundles finite-locally-free modules are inputs; neither is the analytic FF category. No analytic G-torsor patching is needed for the algebraic BG0 classification.

These inputs are used by [G-bundles as exact tensor functors](#g-bundle).

For `VectorBundlesAndIsocrystals:VB1/isocrystal-to-bundle-functor`, Use the exact rational tensor isocrystal-to-bundle functor and its base-change equivalences, normalized by E_(π^m)=O(−m).

These inputs are used by [Basic inner form equivalence](#basic-inner-form-bundle-equivalence); [Kottwitz invariant in isocrystal families](#family-kottwitz-local-constancy); [Moduli v-stack Bun_G](#bun-g-as-v-stack); [Geometric classification of G-bundles](#points-are-B-of-G); [HN sign and semicontinuity](#hn-sign-and-semicontinuity); [HN-graded G-bundles](#hn-graded-g-bundles); [Quasi-split opposite-parabolic automorphisms](#quasi-split-opposite-parabolic).

For `VectorBundlesAndIsocrystals:VB2:ampleness/gaga-equivalence`, Use the existing exact tensor GAGA equivalence on finite locally free bundles for affinoid perfectoid bases, including bundle cohomology and Isom compatibility.

These inputs are used by [Moduli v-stack Bun_G](#bun-g-as-v-stack); [Smallness of Bun_G](#bun-g-smallness).

For `VectorBundlesAndIsocrystals:VB2:classification`, Use geometric-point classification of vector bundles and the slope/degree normalization to establish the reductive fibre-functor classification. The Tannakian reduction, not a new linear classification, belongs to BG2.

These inputs are used by [Geometric classification of G-bundles](#points-are-B-of-G); [Rank-two extension chart](#gl2-extension-chart).

For `VectorBundlesAndIsocrystals:VB3:general-BC/families-of-banach-colmez-spaces`, Use the actual two-term [E1→E0] relative Banach–Colmez theorem for representability, partial properness, punctured properness and cohomological smoothness under its negative/positive hypotheses. Dimensions come separately from positive-range-dimension. Positive-kernel connectedness and passage through reductive filtered extension towers remain precise refinements G12.

These inputs are used by [Geometric classification of G-bundles](#points-are-B-of-G); [Full bundle automorphism v-group](#full-automorphism-v-group); [Positive automorphism kernel geometry](#positive-automorphism-kernel); [Full classifying-stack description of a stratum](#stratum-is-classifying-stack); [Reduction of full automorphism torsors](#automorphism-torsor-reduction); [Locally spatial Isom diagonal](#isom-sheaf-representability); [Negative Banach–Colmez tower of a chart](#chart-over-classifying-stack); [Rank-two extension chart](#gl2-extension-chart).

For `VectorBundlesAndIsocrystals:VB3:projectivized-properness/properness-of-projectivized-BC`, The read node gives punctured properness for H^0 section BC(E), not by itself for negative H^1 extension spaces. Use the separately read families-of-banach-colmez-spaces theorem for negative bundles placed in degree −1. Passage from these linear factors to the entire reductive extension tower and its contracting Z-quotient remains G12.

These inputs are used by [Split section and spatial chart complement](#section-and-spatial-complement); [Contracting chart action and proper quotient](#contracting-chart-action); [Rank-two extension chart](#gl2-extension-chart).

For `VectorBundlesAndIsocrystals:VB4`, Use positive bundle H^1 vanishing, local-system detection, and the contraction/escaping criterion for the finite extension tower of FS V.3.6. Export the linear statement; BG4 proves its reductive chart consequence.

These inputs are used by [Geometrically trivial open locus](#geometrically-trivial-locus); [Contracting chart action and proper quotient](#contracting-chart-action); [Rank-two extension chart](#gl2-extension-chart).

For `VectorBundlesAndIsocrystals:VB4/relative-HN-filtration-and-proetale-splitting`, Use relative-HN-filtration-and-proetale-splitting only for constant-polygon HN filtrations and local splitting. The everywhere-slope-zero local-system equivalence is the separate VB4/slope-zero-local-systems node, and local positive H^1 vanishing is VB4/relative-cohomology-vanishing, with its precise base-change and affinoid restrictions.

These inputs are used by [Geometric classification of G-bundles](#points-are-B-of-G); [HN-graded G-bundles](#hn-graded-g-bundles); [Classification of HN-graded bundles](#hn-graded-classification); [Full bundle automorphism v-group](#full-automorphism-v-group); [Full classifying-stack description of a stratum](#stratum-is-classifying-stack); [Opposite filtered-bundle chart](#filtered-bundle-chart); [Split section and spatial chart complement](#section-and-spatial-complement); [Positive tangent criterion for the filtered chart](#chart-jacobian-positivity).

For `VectorBundlesAndIsocrystals:VB4/semicontinuity-of-HN-polygon`, Use upper semicontinuity of relative HN polygons; G-bundle dominance is deduced by evaluation on every rational representation.

These inputs are used by [HN sign and semicontinuity](#hn-sign-and-semicontinuity).

For `VectorBundlesAndIsocrystals:VB0/endomorphism-division-algebra`, Import End_Φ(D(a,h)) with Π^h=π^(−a), Πx=σ(x)Π under arithmetic Frobenius.

These inputs are used by [Division-algebra Morita comparison](#division-algebra-morita).

For `VectorBundlesAndIsocrystals:VB0/brauer-invariant-sign`, Import the arithmetic local Brauer invariant and opposite-algebra sign; the endomorphism parameter is the bundle slope −a/h.

These inputs are used by [Division-algebra Morita comparison](#division-algebra-morita).

For `VectorBundlesAndIsocrystals:VB2:classification/bundle-endomorphism-comparison`, Import End_Φ(D(a,h))≅End(O(−a/h)) on each simple block, not full faithfulness between arbitrary slopes.

These inputs are used by [Division-algebra Morita comparison](#division-algebra-morita).

For `VectorBundlesAndIsocrystals:VB4/slope-zero-local-systems`, Import the tensor equivalence for bundles whose every geometric HN slope is zero, with perfectoid base change; degree zero alone is insufficient.

These inputs are used by [Geometrically trivial open locus](#geometrically-trivial-locus); [Classification of HN-graded bundles](#hn-graded-classification); [Full bundle automorphism v-group](#full-automorphism-v-group); [Reduction of full automorphism torsors](#automorphism-torsor-reduction).

For `VectorBundlesAndIsocrystals:VB4/relative-cohomology-vanishing`, Import positive H^1 vanishing étale locally, universally on affinoid perfectoid bases after the specified cover; use it to split positive automorphism/graded lifting obstructions.

These inputs are used by [Classification of HN-graded bundles](#hn-graded-classification); [Full bundle automorphism v-group](#full-automorphism-v-group); [Geometric classification of G-bundles](#points-are-B-of-G).

For `VectorBundlesAndIsocrystals:VB3:general-BC/positive-range-dimension`, Import dimension deg(E0)−deg(E1) in the positive/negative range, and in particular deg(E) for positive section BC.

These inputs are used by [Positive automorphism kernel geometry](#positive-automorphism-kernel).

For `VectorBundlesAndIsocrystals:VB4`, Supply the linear period-space comparison V_Y(F)≃Vect(Y_F), functorial for F=Spd(Vhat,Vhat) arising from complete perfect rank-one valuation bases, as in GIZ26 Theorem3.16 and Remark3.15 pp.16–17. Here V_Y is the v-descent limit of Vect(Y_X), and Y_F=Y_(0,∞]. This is not unrestricted extension of every bundle from Y_(0,∞) to Y_(0,∞]. The topology proof separately uses PR24 Proposition2.1.3 and FS II.2.14 to classify the induced boundary bundle; retain these precise inputs and GIZ26 Remark2.1 on both characteristics. BG0/BG2 owns the structured meromorphic comparison; VB4 supplies this linear comparison only.

These inputs are used by [Newton topology theorem in both characteristics](#newton-topology-homeomorphism).

### From tauceti

For `tauceti:TauCetiRoadmap/ReductiveGroups#layer-1-representations--comodules`, Use the existing rational representation/comodule category, rigid exact tensor structure, tensor-functor torsor reconstruction and faithful-representation descent. Export the upstream definitions rather than replacing them by abstract representations of G(E). Relative analytic/scheme representability beyond the existing field category is separately recorded in gap G02. The HK22 v5 Theorem2.11 application additionally requires faithful tensor-line stabilizer reconstruction over the coefficient ring and local lifting for the actual automorphism-group orbit, preserving all tensors; a GL of the ambient Hom space is insufficient to state that lifting input. E09 records the missing implication in the read proof: local sections into GL(H) do not ensure membership in Aut(V0). Supply local continuous lifts of the actual orbit map onto its tensor-line embedding orbit, with its induced topology and any smoothness/separability hypotheses made explicit. Do not mark this input proved by the ambient GL action or by the coordinate control. For the general-E representation-detection target, additionally supply highest-weight modules for dominant integral weights over a split reductive group in arbitrary characteristic, the highest weights of exterior powers, and finite-separable restriction of scalars of representations. Export the resulting detection of the coroot cone and central equality by E-rational representations on Γ-fixed Newton classes. RR96 §2.1/Lemma2.2 pp.165–166 has a characteristic-zero hypothesis; the current rational comodule category alone does not supply this detection theorem.

These inputs are used by [G-bundles as exact tensor functors](#g-bundle); [Structure group and tensor descent](#structure-group-and-tensor-descent); [G-isocrystals](#g-isocrystals-and-B-of-G); [Filtered torsor automorphism group schemes](#filtered-automorphism-group-scheme); [Locally spatial Isom diagonal](#isom-sheaf-representability); [Positive tangent criterion for the filtered chart](#chart-jacobian-positivity); [Rational slope protorus](#slope-protorus); [Representations detect Newton dominance](#representation-detects-dominance); [Isocrystal-family v-descent and strata](#isocrystal-family-v-descent).

For `tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory`, Use existing Borels, maximal tori, parabolics, Levi factors and based root/Galois data. Generic pure-inner descent, elliptic torus transfer and filtered relative group-scheme representability need the extension in G02; generic z-extensions are imported from existing upstream RG2.1.5, with only the remaining G01 refinements requested. Exact routed refinements: elliptic maximal tori modulo the center; rational transfer of a maximal torus of an inner Levi and its existence for quasi-split or elliptic cases; descent of Galois-invariant parabolic classes and rational Levi factors. These additions are G02, not claimed built in the field layer. The filtered refinement is precise: represent Aut^⊗ of a filtered G-torsor over any K-scheme, its parabolic and positive raising subgroups, Lie subbundles and positive vector quotients, with base change. Zie15 Theorem1.3/4.15 supplies splitting on affine charts because the underlying reductive inner form is smooth; clear Q-weight denominators on a tensor generator before applying it. Relative rational-cocharacter representability/descent remains additional work, and global non-affine splitting is excluded.

These inputs are used by [Tannakian description of analytic torsors](#g-torsors-three-descriptions); [G-isocrystals](#g-isocrystals-and-B-of-G); [Algebraic sigma-centralizer](#sigma-centralizer-J-b); [Decent representative](#decent-representative); [Existence of decent representatives](#existence-of-decent-representative); [Division-algebra Morita comparison](#division-algebra-morita); [Basic Levi Newton formula](#levi-newton-formula); [Minuscule basic Levi lifting](#minuscule-basic-levi-lift); [Torus-special acceptable pair](#torus-special-pair); [Elliptic tori and basic acceptable classes](#elliptic-torus-basic-image); [Specialness for a transferred centralizer torus](#transferred-torus-specialness); [Ordinary straight translation and Levi centrality](#ordinary-straight-translation); [Ordinary classes under a derived isogeny](#ordinary-derived-isogeny); [Products and unramified restriction of scalars](#product-and-unramified-norm); [Abelianized Kottwitz set](#abelianized-kottwitz-set); [Geometric classification of G-bundles](#points-are-B-of-G); [Geometrically trivial open locus](#geometrically-trivial-locus); [Beauville–Laszlo uniformization](#beauville-laszlo-surjectivity); [Central-torus Grassmannian surjectivity](#central-torus-grassmannian-surjectivity); [Local constancy of bundle Kottwitz invariant](#semicontinuity-and-local-constancy); [Filtered torsor automorphism group schemes](#filtered-automorphism-group-scheme); [Quasi-split opposite-parabolic automorphisms](#quasi-split-opposite-parabolic); [Locally spatial Isom diagonal](#isom-sheaf-representability); [Quasi-split parabolic chart](#quasi-split-parabolic-chart); [Positive tangent criterion for the filtered chart](#chart-jacobian-positivity); [Finite Frobenius norm centralizer](#finite-frobenius-norm-centralizer); [Quasi-split centralizer in the GL minuscule case](#gl-minuscule-quasisplit-centralizer); [Algebraic fundamental group](#algebraic-fundamental-group); [Newton orbit space and rational dominance](#newton-orbit-space); [Galois averaging and Hodge invariants](#galois-average); [Newton and Kottwitz invariants](#newton-and-kottwitz-maps); [Kottwitz classification by both invariants](#classification-by-two-invariants); [Basic sigma class](#basic-class); [Rational Newton representative](#rational-newton-witness); [Torus norm and Newton average](#torus-norm-description); [Rational Kottwitz images of centralizers](#rational-kottwitz-surjectivity); [Bounded lifting through a z-extension](#z-extension-bounded-lifting); [Basic classes and adjoint torsors with connected center](#connected-center-basic-inner-forms).

<a id="algebraic-fundamental-group"></a>

### Imported algebraic fundamental group interface

Consumer notation: `TauCeti.BunG.AlgebraicPiOne`. Use the integral algebraic fundamental group already supplied by upstream ReductiveGroups Part II RG2.1.5: π_1(G)=X_*(T)/ZΦ∨ with its Γ_E-action. BG’s notation AlgebraicPiOne is an import alias for this object, not a second coroot-quotient construction. Use its integral inertia and full Galois coinvariants, preserving torsion; import Weyl invariance, functorial maps and their Galois compatibility. Independence of a maximal-torus choice and canonical inner-twist transport require the specific comparison refinement stated in the supplier request.

Use `ReductiveGroupsPartII:RG2.1`.

Import BruhatTits.AlgebraicFundamentalGroup, its galoisAction, inertiaCoinvariants, map and weyl_invariant from upstream RG2.1.5; retain the inverse-transpose convention on cocharacters. Use full Galois coinvariants of the imported action for κ. Obtain the comparison between compatible maximal-torus choices and inner twists from the RG2.1 refinement; the existing suggested upstream signatures work with a fixed AbsoluteRootData and do not alone supply that comparison.

The imported interface must support:

- `TauCeti.BunG.AlgebraicPiOne.ofCocharacter`: Reuse the upstream RG2.1.5 operation: Take the class of an integral cocharacter.
- `TauCeti.BunG.AlgebraicPiOne.coinvariants`: Reuse the upstream RG2.1.5 operation: Form Γ- or I-coinvariants with the specified action.
- `TauCeti.BunG.AlgebraicPiOne.map`: Reuse the upstream RG2.1.5 operation: A reductive group morphism induces the canonical homomorphism on π_1.
- `TauCeti.BunG.AlgebraicPiOne.innerInvariant`: Use canonical Γ-module transport under inner twisting after importing the RG2.1 maximal-torus/inner-twist comparison refinement; existing fixed-datum signatures do not yet assert this comparison.

**Checks.**

- `TauCeti.BunG.AlgebraicPiOne.testGLn`: For GL_n with n≥1, reuse the upstream identification π_1≅Z by the sum of diagonal cocharacters; GL_0 instead has π_1=0.
- `TauCeti.BunG.AlgebraicPiOne.testSLn`: For SL_n the coroot quotient is0.
- `TauCeti.BunG.AlgebraicPiOne.testNormOne`: The unramified quadratic norm-one torus has Γ-coinvariants Z/2; its rationalization loses its nonzero class.

In GLX2.2 and KMPS1.1, κ and μ♯ take values in the full integral quotient.

In BG2 connected components, Indexes π_0 Bun_G, including torsion.

Do not replace integral coinvariants by their rationalization.

Source: [Mark Kisin, Keerthi Madapusi Pera, Sug Woo Shin, Honda-Tate theory for Shimura varieties](https://math.berkeley.edu/~swshin/HT.pdf), Notational conventions p.5.

Source: [Ian Gleason, Dong Gyu Lim, Yujie Xu, The connected components of affine Deligne-Lusztig varieties](https://link.springer.com/content/pdf/10.1007/s00222-025-01386-1.pdf), Section2.2 p.818.

## How to read the build

First construct tensor torsors and algebraic Frobenius objects in BG0. BG1 supplies integral invariants, classification, acceptable classes and the order. BG2 uniformization then constructs the geometric stack and compares its points and topology. BG3 identifies the strata and stabilizers. Complete BG2’s Artin and component statements after those stratum results, since the component proof uses their dimensions and basic open loci. BG4 uses the whole-stack smoothness theorem to construct the filtered specialization charts. BG2 denotes the union of its two sublayers and introduces no duplicate objects.

Each subsection gives a mathematical target under its intended future `TauCeti.BunG` name, with its hypotheses, direct inputs, proof route, interface and checks. The accompanying suggested file uses `TauCetiRoadmap.BunGAndNewtonStrata` for a smaller set of native formulations: twisted orbit sets and point stabilizers, finite Frobenius norms, rank-one Witt classification, numerical GL_n slopes, rational Hopf weights and integral coinvariants. Full reductive classification and analytic geometry remain the precise targets below until their actual carriers exist. Arbitrary owner predicates or functions are not substitutes for those carriers.

## Layer 0: torsors and isocrystals with reductive structure

Construct the rational tensor descriptions and the sigma-conjugacy quotient. Descend algebraic centralizers from Newton Levi groups, then build twisting, decency and the coefficient-family comparison.

<a id="g-bundle"></a>

### 1. G-bundles as exact tensor functors

Define `TauCeti.BunG.GBundle`. For a sousperfectoid E-space X and connected reductive G/E, a G-bundle is an exact E-linear tensor functor from finite rational representations Rep_E(G) to finite locally free bundles on X. Arrows are tensor natural isomorphisms. Exactness means preservation of bundle short exact sequences, not an arbitrary functor or abstract action of G(E).

Use `tauceti:TauCetiRoadmap/ReductiveGroups#layer-1-representations--comodules`; `VectorBundlesAndIsocrystals:VB1`; `mathlib:CategoryTheory.Functor.Monoidal`; `tauceti:TauCeti.FGPointRepresentationCat`; `tauceti:TauCeti.FGPointRepresentationCat.instRigidCategory`; `tauceti:TauCeti.ExactStructure`; `tauceti:TauCeti.ExactStructure.IsConflationExact`; `mathlib:CategoryTheory.Functor.Linear`; `mathlib:CategoryTheory.Functor.Braided`; `mathlib:CategoryTheory.NatTrans.IsMonoidal`.

Use the rational representation category supplied by ReductiveGroups and the exact tensor category of vector bundles supplied by VB1. Construct the groupoid by retaining tensor isomorphisms and the specified exact structure.

The interface must support:

- `TauCeti.BunG.GBundle.trivial`: The standard fibre functor V↦V⊗_E O_X defines the trivial G-bundle.
- `TauCeti.BunG.GBundle.evaluate`: For each rational representation V, evaluate a G-bundle to a bundle of rank dim_E V; tensor and dual comparisons are natural.
- `TauCeti.BunG.GBundle.tensorIso`: An isomorphism consists of invertible natural maps preserving the unit and tensor constraints.
- `TauCeti.BunG.GBundle.pullback`: For f:Y→X, bundle pullback gives f* on G-bundles, with coherent identity and composition isomorphisms.
- `TauCeti.BunG.GBundle.tensorIso_ext`: Two tensor natural isomorphisms are equal if their components agree on every finite rational representation.

**Checks.**

- `TauCeti.BunG.GBundle.testGL1`: For G=G_m, evaluation at the standard character identifies G-bundles with line bundles.
- `TauCeti.BunG.GBundle.testTrivial`: For G=1 the G-bundle groupoid has one object up to a unique isomorphism.
- `TauCeti.BunG.GBundle.testNoFaithfulChoice`: For GL_2 the standard and standard-plus-determinant faithful realizations recover isomorphic torsors; independent unrelated bundles do not define a tensor functor.

In FS III.1-III.5, Evaluation is the interface for HN theory, Isom sheaves and inner twisting.

In LZ17 Corollary4.9, An exact rational tensor functor produces the de Rham torsor.

GL_n gives rank-n vector bundles and their isomorphisms.

Source: [Laurent Fargues, Peter Scholze, Geometrization of the local Langlands correspondence](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), After III.1.1 p.88.

<a id="g-torsors-three-descriptions"></a>

### 2. Tannakian description of analytic torsors

Prove `TauCeti.BunG.GTorsorsThreeDescriptions`. For X sousperfectoid over E and reductive G/E, geometric étale-locally trivial G-torsors, étale sheaf G-torsors, and G-bundles are naturally equivalent categories. Hence their isomorphism classes identify with H¹_et(X,G). The scheme version is fpqc/fppf, with étale comparison for smooth G; do not transplant a scheme statement to an arbitrary adic space.

Use [G-bundles as exact tensor functors](#g-bundle); `AlgebraicModuliForArithmeticGeometry:R09.3`; `tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory`; `mathlib:CategoryTheory.Equivalence`; `tauceti:TauCeti.Tannaka.fgPointTensorIsoEquiv`.

Apply SW19.5.2 in the sousperfectoid setting; sections and associated bundles give the first two functors. Recover the torsor from the tensor functor using the regular representation as a filtered colimit; exactness gives faithful flatness. Use smooth torsor descent for the fpqc/étale comparison on schemes.

GL_n frame bundles and G_m line bundles.

The 2020 SW scheme theorem is19.5.1; the adic theorem is19.5.2.

Source: [Laurent Fargues, Peter Scholze, Geometrization of the local Langlands correspondence](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), III.1.1 p.88.

Source: [Peter Scholze, Jared Weinstein, Berkeley Lectures on p-adic Geometry](https://www.math.uni-bonn.de/people/scholze/Berkeley.pdf), Theorems19.5.1 and19.5.2, printed178-180.

<a id="structure-group-and-tensor-descent"></a>

### 3. Structure group and tensor descent

Prove `TauCeti.BunG.StructureGroupAndTensorDescent`. For a morphism f:G→H of connected reductive E-groups, extending a G-bundle is precomposition by restriction Rep(H)→Rep(G); it agrees with contracted product of torsors, commutes with base change and respects identity/composition. Tensor isomorphisms descend effectively for étale covers. Reconstruction by any faithful rational representation with its defining tensors gives the same torsor.

Use [Tannakian description of analytic torsors](#g-torsors-three-descriptions); `tauceti:TauCetiRoadmap/ReductiveGroups#layer-1-representations--comodules`; `AlgebraicModuliForArithmeticGeometry:R09.3`.

Transport contracted products and effective smooth torsor descent across the comparison. Tensor restriction composes contravariantly; torsor extension composes covariantly. Use the regular representation reconstruction to compare faithful presentations.

Determinant GL_n→G_m gives the determinant line.

No use of RF4 patching occurs in this node.

Source: [Peter Scholze, Jared Weinstein, Berkeley Lectures on p-adic Geometry](https://www.math.uni-bonn.de/people/scholze/Berkeley.pdf), Proof19.5.2 printed179-180.

Source: [Ruochuan Liu, Xinwen Zhu, Rigidity and a Riemann-Hilbert correspondence for p-adic local systems](https://arxiv.org/pdf/1602.06282v3), Corollary4.9 printed33.

<a id="g-isocrystals-and-B-of-G"></a>

### 4. G-isocrystals

Define `TauCeti.BunG.GIsocrystal`. A G-isocrystal over L=breve E is an exact E-linear tensor functor Rep_E(G)→Isoc_E, with tensor isomorphisms as arrows. After trivializing its underlying L-fibre functor, Frobenius is bσ for b∈G(L). Steinberg triviality over L permits such a trivialization; it is a choice, not part of the definition.

Use `VectorBundlesAndIsocrystals:VB0/tensor-and-dual-slopes`; `VectorBundlesAndIsocrystals:VB0/isocrystal-category-and-standard-block`; `tauceti:TauCetiRoadmap/ReductiveGroups#layer-1-representations--comodules`; `tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory`; `mathlib:WittVector.Isocrystal`; `mathlib:CategoryTheory.Functor.Monoidal`; `tauceti:TauCeti.FGPointRepresentationCat`; `tauceti:TauCeti.FGPointRepresentationCat.instRigidCategory`; `tauceti:TauCeti.ExactStructure`; `tauceti:TauCeti.ExactStructure.IsConflationExact`; `mathlib:CategoryTheory.Functor.Linear`; `mathlib:CategoryTheory.Functor.Braided`; `mathlib:CategoryTheory.NatTrans.IsMonoidal`; `tauceti:TauCeti.FGComoduleCat.scalarExtensionMonoidalFunctor`; `tauceti:TauCeti.Comodule.pointsAction`; `tauceti:TauCeti.Tannaka.scalarExtensionComponent`; `tauceti:TauCeti.Tannaka.fgPointTensorIsoEquiv`; `tauceti:TauCeti.Comodule.rTensor_comp_endOfPoint`; `tauceti:TauCeti.Comodule.baseChange_comp_endOfPoint`; `tauceti:TauCeti.Comodule.endOfPoint_tensor`; `tauceti:TauCeti.Comodule.endOfPoint_trivial`.

Use the exact tensor category of finite E-isocrystals from VB0. Apply the reductive fibre-functor/torsor dictionary over L and Steinberg vanishing; changing the trivialization changes b by sigma conjugation. For the trivialized presentation, linearize Φ by inverse coefficient Frobenius, use native Tannakian reconstruction on the fixed finite-comodule fibre functor, and reconstruct all tensor arrows. This does not instantiate VB0’s untrivialized exact category or establish Steinberg triviality.

The interface must support:

- `TauCeti.BunG.GIsocrystal.ofRepresentative`: The object from b sends ρ to (Vρ⊗_E L,ρ(b)σ).
- `TauCeti.BunG.GIsocrystal.forget`: Forget Frobenius to the underlying L-fibre functor; retain its tensor constraints.
- `TauCeti.BunG.GIsocrystal.changeTrivialization`: A change g of trivialization identifies the representatives b and g b σ(g)^−1.
- `TauCeti.BunG.GIsocrystal.map`: A group morphism carries b to f(b) and agrees with precomposition of rational representations.
- `TauCeti.BunG.RepresentativeTensor.coefficientSigma`: For fields E,L, a commutative Hopf E-algebra H and an E-algebra automorphism σ of L, coefficient Frobenius on L⊗_E M is the invertible σ-semilinear map σ⊗id_M, for every native finite rational H-comodule M.
- `TauCeti.BunG.RepresentativeTensor.coefficientSigma_tmul`: Coefficient Frobenius sends a⊗m to σ(a)⊗m; the representation factor remains fixed.
- `TauCeti.BunG.RepresentativeTensor.frobenius`: For a native convolution point b:H→L, compose σ⊗id_M with Tau Ceti’s native point action ρ_M(b), obtaining an invertible σ-semilinear map on L⊗_E M.
- `TauCeti.BunG.RepresentativeTensor.frobenius_apply`: The component formula is Φ_b,M(x)=ρ_M(b)((σ⊗id_M)(x)), with coefficient Frobenius applied first.
- `TauCeti.BunG.RepresentativeTensor.tensorCombine`: Combine x∈L⊗_E M and y∈L⊗_E N using the inverse native base-change distribution isomorphism on x⊗_L y. The result lies in L⊗_E(M⊗_E N).
- `TauCeti.BunG.RepresentativeTensor.Data`: Trivialized Frobenius data on the fixed native scalar-extension fibre functor consist of invertible σ-semilinear components on every finite rational comodule, natural for comodule maps, taking a⊗1 in the tensor unit to σ(a)⊗1 and preserving tensorCombine. These are explicit equations; this presentation is not the untrivialized exact G-isocrystal definition.
- `TauCeti.BunG.RepresentativeTensor.ofRepresentative`: The family Φ_b,M=ρ_M(b)(σ⊗id_M) satisfies the naturality, unit and tensor equations of Data. Its underlying L-fibre functor is the native finite-comodule scalar-extension functor.
- `TauCeti.BunG.RepresentativeTensor.linearized`: Compose every component of Data with inverse coefficient Frobenius to obtain a native tensor automorphism of finite-comodule scalar extension.
- `TauCeti.BunG.RepresentativeTensor.linearized_component`: The transported component of the linearized tensor automorphism at M sends x to Φ_M((σ⊗id_M)⁻¹x).
- `TauCeti.BunG.RepresentativeTensor.reconstructedPoint`: Apply the inverse of Tau Ceti’s native field-valued Tannakian point/tensor-automorphism equivalence to the linearized family, reconstructing a genuine E-algebra point H→L.
- `TauCeti.BunG.RepresentativeTensor.equivalence`: Representative points and trivialized Frobenius families are equivalent, with inverse reconstructedPoint. The inverse laws recover the point and the entire family, rather than only one faithful representation.
- `TauCeti.BunG.RepresentativeTensor.Iso`: An arrow between two trivialized families is a native tensor automorphism η of scalar extension satisfying η_MΦ_M=Ψ_Mη_M on every finite rational comodule.
- `TauCeti.BunG.RepresentativeTensor.conjugatorEquiv`: All points g with c=g b σ(g)⁻¹ are equivalent to the Frobenius-compatible tensor arrows from ofRepresentative b to ofRepresentative c. The forward arrow is native Tannakian action by g; the inverse reconstructs g from the tensor arrow.
- `TauCeti.BunG.RepresentativeTensor.changeTrivialization`: For b,g, the native tensor action by g gives a Frobenius-compatible arrow from the family of b to the family of g b σ(g)⁻¹.
- `TauCeti.BunG.RepresentativeTensor.changeTrivialization_component`: The component of that arrow on L⊗_E M is exactly the native point action ρ_M(g), without an extra coefficient Frobenius.
- `TauCeti.BunG.RepresentativeTensor.isoComp`: Compose a tensor arrow f:F→G with g:G→K by multiplying their native tensor automorphisms as g·f. This corresponds to the later conjugator on the left.
- `TauCeti.BunG.RepresentativeTensor.isoRefl`: The identity native tensor automorphism is the identity arrow on each trivialized Frobenius family.
- `TauCeti.BunG.RepresentativeTensor.isoInv`: The inverse native tensor automorphism reverses a Frobenius-compatible arrow. Together with isoComp and isoRefl these give a native Groupoid on Data.

**Checks.**

- `TauCeti.BunG.GIsocrystal.testGLn`: For GL_n with E=Q_p this agrees with finite-dimensional WittVector.Isocrystal over k=bar F_p, after fixing the coefficient identification.
- `TauCeti.BunG.GIsocrystal.testUnit`: b=1 gives standard Frobenius on each representation.
- `TauCeti.BunG.GIsocrystal.testTensorSlope`: For G_m representatives π^a and π^b, tensoring has slope a+b and duality has slope −a.
- `TauCeti.BunG.RepresentativeTensor.testSemilinearity`: For every representation M and a∈L, Φ_b,M(a x)=σ(a)Φ_b,M(x), rather than aΦ_b,M(x).
- `TauCeti.BunG.RepresentativeTensor.testCoefficientUnit`: For b=1 and every native finite rational comodule, Φ_1,M(a⊗m)=σ(a)⊗m.
- `TauCeti.BunG.RepresentativeTensor.testTensorFamily`: The component on M⊗N sends tensorCombine(x,y) to tensorCombine(Φ_M(x),Φ_N(y)) for arbitrary M,N.
- `TauCeti.BunG.RepresentativeTensor.testNotLinear`: If σ(a)≠a for some a∈L, no L-linear map on the scalar-extended tensor-unit representation agrees everywhere with its Frobenius component.
- `TauCeti.BunG.RepresentativeTensor.testIntertwiner`: For b′=g b σ(g)⁻¹, the point action ρ_M(g) intertwines Φ_b,M and Φ_b′,M on every M.
- `TauCeti.BunG.RepresentativeTensor.testArrowComposition`: For conjugators g:b→c and h:c→d, the composite tensor arrow acts as ρ_M(h g) on every representation; reversing the point multiplication order fails in noncommutative cases.
- `TauCeti.BunG.RepresentativeTensor.testReconstruction`: Reconstructing a point from an arbitrary Data family and applying ofRepresentative recovers that entire family, including its coherence fields.

In FS III.2.2, Provides representatives for geometric classification.

In IG.0 and ET.5, Supplies the algebraic structured isocrystal without analytic uniformization inputs.

Underlying vector spaces are over L, not E.

Source: [Laurent Fargues, Peter Scholze, Geometrization of the local Langlands correspondence](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), III.2.1 p.89.

Source: [Peter Scholze, Jared Weinstein, Berkeley Lectures on p-adic Geometry](https://www.math.uni-bonn.de/people/scholze/Berkeley.pdf), Definition22.4.1 printed210 (PDF220).

<a id="sigma-conjugacy-quotient"></a>

### 5. Kottwitz set B(G)

Define `TauCeti.BunG.SigmaClass`. B(G)=G(L)/~ where b~bprime iff bprime=g b σ(g)^−1 for some g∈G(L). Here σ is arithmetic q-Frobenius fixing E and its uniformizer. This orbit quotient is the set of isomorphism classes of G-isocrystals; the groupoid itself retains automorphisms.

Use [G-isocrystals](#g-isocrystals-and-B-of-G); `mathlib:Subgroup`; `mathlib:MulEquiv`; `tauceti:TauCeti.AlgHom.mapValue`; `tauceti:TauCeti.MultiplicativeGroup.pointsMulEquiv_mapValue`; `mathlib:CategoryTheory.Groupoid`; `mathlib:CategoryTheory.Aut.Aut_mul_def`; `mathlib:WittVector.exists_frobenius_solution_fractionRing`; `mathlib:WittVector.FractionRing.frobenius`; `tauceti:TauCeti.FGComoduleCat.scalarExtensionMonoidalFunctor`; `tauceti:TauCeti.Comodule.pointsAction`; `tauceti:TauCeti.Tannaka.scalarExtensionComponent`; `tauceti:TauCeti.Tannaka.fgPointTensorIsoEquiv`.

Check that twisted conjugation is a group action; its orbit relation is reflexive, symmetric and transitive. Transport the change-of-trivialization formula from G-isocrystals to identify the quotient.

The interface must support:

- `TauCeti.BunG.SigmaClass.mk`: Send b∈G(L) to its sigma class.
- `TauCeti.BunG.SigmaClass.mk_eq_iff`: Two representative classes are equal precisely when a sigma conjugator exists.
- `TauCeti.BunG.SigmaClass.map`: A σ-compatible group homomorphism gives B(G)→B(H), with identity and composition laws.
- `TauCeti.BunG.SigmaClass.lift`: Every function on G(L) invariant under twisted conjugation descends uniquely to B(G).
- `TauCeti.BunG.SigmaClass.affinePoints`: For a commutative coordinate Hopf algebra H over E and an E-algebra automorphism σ of L, specialize the quotient to the native convolution group of E-algebra maps H→L. Arithmetic B(G) uses the actual coefficient field and Frobenius supplied by VB0.
- `TauCeti.BunG.SigmaClass.equiv`: A Frobenius-compatible group equivalence induces an equivalence of sigma-class quotients, carrying the class of b to the class of its image.
- `TauCeti.BunG.SigmaClass.representativeGroupoid`: Objects are elements b of the coefficient point group; arrows b→c are all g satisfying c=g b σ(g)^−1. The composite of g:b→c and h:c→d has conjugator h g, and inverses use g^−1.
- `TauCeti.BunG.SigmaClass.representative_hom_iff`: A representative Hom is nonempty exactly when the two quotient classes agree; this does not make it a singleton.
- `TauCeti.BunG.SigmaClass.representativeAut`: The native category-theoretic automorphism group of representative b identifies multiplicatively with its sigma-stabilizer. Mathlib’s Aut multiplication reverses categorical composition, matching the usual stabilizer multiplication.
- `TauCeti.BunG.SigmaClass.gmEquiv`: The native Laurent-polynomial Hopf points equivalence identifies the split G_m sigma quotient with the quotient on L×, for any E-algebra automorphism of L.
- `TauCeti.BunG.SigmaClass.wittGmSlopeEquiv`: For prime p and an algebraically closed field k of characteristic p, the units of FractionRing(WittVector p k), with native Witt Frobenius, have sigma-class quotient equivalent to Z. This is a concrete p-typical specialization, not the general-E supplier theorem.
- `TauCeti.BunG.SigmaClass.wittGmSlopeEquiv_uniformizer`: In that Witt specialization, the class of p^m maps to m, for every integer m; the normalized valuation is Frobenius-invariant.
- `TauCeti.BunG.RepresentativeTensor.representativeFunctor`: Send each native twisted-conjugacy representative b to its whole Frobenius tensor family and every conjugator g to its native Tannakian tensor action.
- `TauCeti.BunG.RepresentativeTensor.reconstructionFunctor`: Reconstruct both the native coefficient point and the actual conjugator of each Frobenius-compatible tensor arrow. Identity and composition agree with the representative groupoid.
- `TauCeti.BunG.RepresentativeTensor.categoryEquivalence`: The native representative groupoid is equivalent to the Groupoid of trivialized Frobenius families on finite rational comodules. Comparison with untrivialized exact G-isocrystals still requires VB0’s structured category and Steinberg triviality.

**Checks.**

- `TauCeti.BunG.SigmaClass.testGL1`: For split G_m, valuation gives B(G_m)≅Z.
- `TauCeti.BunG.SigmaClass.testIdentitySigma`: With σ the identity the orbit relation is ordinary conjugacy.
- `TauCeti.BunG.SigmaClass.testCommutative`: For an abelian group the relation is multiplication by g/σ(g), not equality unless σ is trivial.
- `TauCeti.BunG.SigmaClass.testRepresentativeHom`: For representative objects b,c, equality of sigma classes is equivalent to existence of a conjugator arrow.
- `TauCeti.BunG.SigmaClass.testRepresentativeComposition`: For arrows g:b→c and h:c→d, composition has conjugator h g; reversing this order is invalid in a noncommutative point group.
- `TauCeti.BunG.SigmaClass.testRepresentativeAutomorphisms`: With identity Frobenius and representative 1, the automorphism group is the entire point group, rather than the trivial group of a discrete quotient category.
- `TauCeti.BunG.SigmaClass.testGmNativePoints`: The split G_m quotient equivalence sends a class represented by an actual Laurent-polynomial algebra map to the class of its corresponding unit.
- `TauCeti.BunG.SigmaClass.testWittGL1`: For the native Witt fraction field and every integer m, the class of p^m has slope m.
- `TauCeti.BunG.SigmaClass.testWittGL1Unit`: The class of 1 in the Witt units quotient has slope zero.
- `TauCeti.BunG.SigmaClass.testWittGL1Distinct`: The classes of 1 and p in the Witt units quotient differ; replacing Frobenius or dropping the valuation normalization would miss this control.
- `TauCeti.BunG.RepresentativeTensor.testRepresentativeFamily`: The forward category equivalence sends b to the family whose component on every native representation is ρ_M(b)(σ⊗id_M).

In KMPS1.1 and GLX2.2, Provides the invariant quotient used by acceptable classes.

In ET.5, Imports the structured local classes and algebraic centralizers.

Both g b σ(g)^−1 and g^−1 b σ(g) conventions give the same orbit relation.

Source: [Xuhua He, Cordial elements and dimensions of affine Deligne-Lusztig varieties](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/5A27DBF48CAEF6DA56A313061848574C/S205050862100010Xa.pdf/cordial-elements-and-dimensions-of-affine-delignelusztig-varieties.pdf), Section2.1 p.4.

Source: [Laurent Fargues, Peter Scholze, Geometrization of the local Langlands correspondence](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), DefinitionIII.2.1 and TheoremIII.2.2 p.89; §III.2.2 p.90. The tensor-isocrystal classification distinguishes the representative groupoid from its isomorphism classes; the split torus invariant is the integral valuation. The Witt case here uses the pinned rank-one Frobenius-solution theorem.

<a id="sigma-centralizer-J-b"></a>

### 6. Algebraic sigma-centralizer

Define `TauCeti.BunG.SigmaCentralizer`. For b∈G(L), J_b is the reductive E-group representing A↦{g∈G(A⊗_E L):g b=b σ(g)}. Its L-base change is the centralizer M_b of ν_b. It is an inner form of the corresponding Levi in the quasi-split inner form G*, and is an inner form of G* precisely when b is basic. Descent uses the semilinear action Ad(b)σ on M_b.

Use [G-isocrystals](#g-isocrystals-and-B-of-G); [Newton and Kottwitz invariants](#newton-and-kottwitz-maps); `tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory`; `AlgebraicModuliForArithmeticGeometry:R09.3`; `tauceti:TauCeti.ReductiveAffineGroupSchemeCat`; `mathlib:Subgroup`; [Existence of decent representatives](#existence-of-decent-representative); `VectorBundlesAndIsocrystals:VB0/endomorphism-division-algebra`; `VectorBundlesAndIsocrystals:VB0/brauer-invariant-sign`; `tauceti:TauCeti.AlgHom.mapValue`; `mathlib:Algebra.TensorProduct.map`; `mathlib:Algebra.TensorProduct.congr`; `tauceti:TauCeti.FGComoduleCat.scalarExtensionMonoidalFunctor`; `tauceti:TauCeti.Comodule.pointsAction`; `tauceti:TauCeti.Tannaka.scalarExtensionComponent`; `tauceti:TauCeti.Tannaka.fgPointTensorIsoEquiv`.

Construct ν_b from the representation slope grading, giving the Levi centralizer after base change. Restrict Ad(b)σ to this centralizer; decency makes descent effective over a finite unramified extension. Use reductive-group descent to represent the fixed-point functor and compare its rational points with tensor automorphisms.

The interface must support:

- `TauCeti.BunG.SigmaCentralizer.points`: For every E-algebra A, membership is exactly g b=b σ(g).
- `TauCeti.BunG.SigmaCentralizer.baseChange`: J_b⊗_E L≅Z_(G_L)(ν_b), with the descended semilinear datum.
- `TauCeti.BunG.SigmaCentralizer.conjugate`: For bprime=g b σ(g)^−1, h↦g h g^−1 induces J_b≅J_bprime.
- `TauCeti.BunG.SigmaCentralizer.autIsocrystal`: J_b(E) is the tensor automorphism group of the G-isocrystal defined by b.
- `TauCeti.BunG.SigmaCentralizer.functorOfPoints`: Retain the whole group-valued functor on commutative E-algebras A. Its coefficient group is the native convolution group of maps H→A⊗_E L; Frobenius acts as id_A⊗σ and b enters through the right tensor factor. An algebra map f:A→B acts by f⊗id_L.
- `TauCeti.BunG.SigmaCentralizer.naturalConjugacy`: Changing b by g b σ(g)^−1 gives a natural isomorphism of these group-valued functors, whose component conjugates by the image of g in A⊗_E L. Representability and Levi descent remain additional contracts.
- `TauCeti.BunG.SigmaCentralizer.naturalConjugacy_apply`: At every coefficient E-algebra A, the natural representative-change map sends h to g_A h g_A^−1, where g_A is the image of g in G(A⊗_E L). It uses g_A on both sides, rather than σ(g_A).
- `TauCeti.BunG.RepresentativeTensor.tensorAut`: The native category-theoretic Aut group of ofRepresentative b identifies multiplicatively with the point sigma-stabilizer {g:g b=b σ(g)}. This is the tensor automorphism comparison on the trivialized presentation; reductive representability of J_b and untrivialized comparison remain additional contracts.
- `TauCeti.BunG.RepresentativeTensor.tensorAut_component`: Every tensor automorphism has component equal to the native representation action of its reconstructed stabilizer point, for every finite rational comodule.

**Checks.**

- `TauCeti.BunG.SigmaCentralizer.testTrivial`: J_1(E)=G(E).
- `TauCeti.BunG.SigmaCentralizer.testBasicGL2`: For the simple GL_2 slope1/2 block, J_b(E)=A_(1/2)^×; two copies give GL_2(A_(1/2)). For the simple GL_3 slope1/3 block its division algebra has arithmetic invariant −1/3=2/3 mod Z, detecting the sign hidden by the half-slope case.
- `TauCeti.BunG.SigmaCentralizer.testNonbasic`: For GL_2 slopes0,1, the algebraic J_b is G_m×G_m, while the bundle automorphism v-group also has a positive-slope kernel.
- `TauCeti.BunG.SigmaCentralizer.testCoefficientNaturality`: A coefficient map f:A→B sends an H-point by postcomposition with f⊗id_L, without changing the L factor.
- `TauCeti.BunG.SigmaCentralizer.testFixedGroup`: For b=1 and every E-algebra A, the centralizer functor is exactly the id_A⊗σ-fixed subgroup of G(A⊗_E L). Arithmetic fixed-field descent to G(A) is a separate theorem.
- `TauCeti.BunG.SigmaCentralizer.testIdentityFrobenius`: If σ is replaced by the identity and b=1, the value at A is the entire coefficient point group. This control must not be mistaken for arithmetic fixed-field descent.
- `TauCeti.BunG.RepresentativeTensor.testTensorStabilizer`: A tensor automorphism reconstructs a point satisfying g b=b σ(g), preserving the correct placement of Frobenius.
- `TauCeti.BunG.RepresentativeTensor.testTensorIdentitySigma`: At identity coefficient Frobenius and b=1, the tensor automorphism group is the entire native point group, rather than a trivial automorphism group of orbit classes.

In FS III.4-III.5, Gives the discrete quotient of bundle automorphisms and pure inner twisting.

In He21 section2.2, Provides the F-rank used in defect.

In Kisin17 Lemma4.6.4, Its rational Kottwitz image controls component actions.

For b=1, J_b(E)=G(E).

For a simple rank-h isocrystal of slope a/h, J_b is the unit group of its endomorphism division algebra A_(a/h), whose arithmetic Brauer invariant is −a/h. Multiplicity m gives GL_m(A_(a/h)); in the linear supplier’s bundle-slope notation A_(a/h)=D_(−a/h).

Source: [Robert Kottwitz, Isocrystals with additional structure II](https://people.dm.unipi.it/maffei/didattica/male/lacci/Kottwitz.pdf), Sections4.3–4.4 pp.268–269.

Source: [Mark Kisin, Mod p points on Shimura varieties of abelian type](https://people.math.harvard.edu/~kisin/dvifiles/lr.pdf?download=1), 1.2.12 printed14.

Source: [Laurent Fargues, Peter Scholze, Geometrization of the local Langlands correspondence](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), ExampleIII.4.4 pp.101–102. The centralizer is the unit group of the isocrystal endomorphism algebra. Its arithmetic invariant and bundle-slope name use the VB0 normalization, rather than a sign inferred from the half-slope example.

<a id="sigma-centralizer-conjugacy"></a>

### 7. Change of sigma-centralizer representative

Prove `TauCeti.BunG.SigmaCentralizerConjugacy`. If bprime=g b σ(g)^−1 then conjugation h↦g h g^−1 induces an E-group isomorphism J_b≅J_bprime and identifies their tensor automorphism actions. The transport is compatible with products of changes of trivialization.

Use [Algebraic sigma-centralizer](#sigma-centralizer-J-b).

Substitute the twisted-conjugacy equation into the pointwise fixed equation. Apply representability and descent to identify the natural functor isomorphism.

The map on J_b(E) uses g, not σ(g), on both sides.

Source: [Mark Kisin, Keerthi Madapusi Pera, Sug Woo Shin, Honda-Tate theory for Shimura varieties](https://math.berkeley.edu/~swshin/HT.pdf), Section1.1.2 p.6.

<a id="decent-representative"></a>

### 8. Decent representative

Define `TauCeti.BunG.DecentRepresentative`. For a positive integer r and b∈G(L), require rν_b to be integral and (bσ)^r=(rν_b)(π)σ^r in G(L)⋊<σ>. Equivalently b σ(b)⋯σ^(r−1)(b)=(rν_b)(π), exactly r factors. A decent representative admits finite unramified descent; the definition excludes r=0.

Use [Newton and Kottwitz invariants](#newton-and-kottwitz-maps); `tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory`.

State the integral slope homomorphism and the semidirect-product equation. Use the fixed equation and slope functoriality for finite unramified descent; source misprint E1 is corrected.

The interface must support:

- `TauCeti.BunG.DecentRepresentative.mk`: Package b, r>0, integrality of rν_b and the r-factor equation.
- `TauCeti.BunG.DecentRepresentative.equation`: Expose the semilinear power equation with the chosen uniformizer.
- `TauCeti.BunG.DecentRepresentative.multiple`: A decent period r may be replaced by a positive multiple, with the matching integral slope.
- `TauCeti.BunG.DecentRepresentative.finiteDescent`: Supply the unramified degree-r coefficient field and descended b and Newton map.

**Checks.**

- `TauCeti.BunG.DecentRepresentative.testRankOne`: b=π^m has period1 and integral Newton point m.
- `TauCeti.BunG.DecentRepresentative.testUnit`: b=1 has period1 and zero Newton point.
- `TauCeti.BunG.DecentRepresentative.testPositivePeriod`: The zero period is excluded, even though its empty-product equality is tautological.

In FS V.3.6, Descends the contracting chart action to a finite field.

In GLX section5.1, Provides the finite-field Newton eigenspaces for fibre functors.

Rank-one π^m is1-decent.

Source: [Ian Gleason, Dong Gyu Lim, Yujie Xu, The connected components of affine Deligne-Lusztig varieties](https://link.springer.com/content/pdf/10.1007/s00222-025-01386-1.pdf), Definition2.3 p.819.

Source: [Mark Kisin, Keerthi Madapusi Pera, Sug Woo Shin, Honda-Tate theory for Shimura varieties](https://math.berkeley.edu/~swshin/HT.pdf), Section1.1.2 equations and decency p.6.

Source: [Paul Hamacher, Eva Viehmann, Finiteness properties of affine Deligne–Lusztig varieties](https://ems.press/content/serial-article-files/26546?nt=1), §1 pp.899–900; Lemma5.2 and proof p.906 (PDF8). The local field may have characteristic zero or p. The decency equation has a positive period, and the lemma gives a representative in every sigma class. The extra building assertion is not a BG target.

<a id="existence-of-decent-representative"></a>

### 9. Existence of decent representatives

Prove `TauCeti.BunG.ExistenceOfDecentRepresentative`. Every class of B(G) has a decent representative for some sufficiently divisible positive r. In the mixed-characteristic GLX setting r can be enlarged so G is quasi-split over E_r and the representative has the chosen dominant Newton map.

Use [Decent representative](#decent-representative); [Kottwitz set B(G)](#sigma-conjugacy-quotient); `tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory`; [Kottwitz classification by both invariants](#classification-by-two-invariants); [Straight Weyl comparison with B(G)](#straight-weyl-classification); `ReductiveGroupsPartII:RG2.4`.

Use HV20 Lemma5.2 for the general local-field statement. Its proof reduces the class in its Newton centralizer to a basic class and chooses a length-zero normalizer lift; the requisite decent-lift interface is an exact RG2.4 request under G10. Use the integral invariant/basic and straight-Weyl comparisons, then enlarge the period to clear slope denominators and the finite descent period. This invokes the requested normalizer-lift theorem, rather than deducing decency from a bare root datum. In the separate p-adic GLX refinement, further enlarge the unramified extension so the group is quasi-split and conjugate the Newton map to its chosen dominant chamber.

For a coprime slope a/h simple block choose a period divisible by h.

Source: [Ian Gleason, Dong Gyu Lim, Yujie Xu, The connected components of affine Deligne-Lusztig varieties](https://link.springer.com/content/pdf/10.1007/s00222-025-01386-1.pdf), Paragraph4 after Definition2.3 p.819. Supplies the p-adic statement and chamber refinement. HV20 Lemma5.2 supplies decent representatives over general local fields.

Source: [Robert Kottwitz, Isocrystals with additional structure](https://www.numdam.org/article/CM_1985__56_2_201_0.pdf), Section4.3 printed213-214. Supplies the p-adic statement and chamber refinement. HV20 Lemma5.2 supplies decent representatives over general local fields.

Source: [Paul Hamacher, Eva Viehmann, Finiteness properties of affine Deligne–Lusztig varieties](https://ems.press/content/serial-article-files/26546?nt=1), §1 pp.899–900; Lemma5.2 and proof p.906 (PDF8). The local field may have characteristic zero or p. The decency equation has a positive period, and the lemma gives a representative in every sigma class. The extra building assertion is not a BG target.

<a id="defect"></a>

### 10. Defect of a sigma class

Define `TauCeti.BunG.Defect`. For the connected reductive local group G and its algebraic sigma-centralizer J_b, def_G(b)=rank_E G−rank_E J_b as an integer. The ranks are split ranks over E, not absolute ranks over L and not dimensions of topological point groups.

Use [Algebraic sigma-centralizer](#sigma-centralizer-J-b); `ReductiveGroupsPartII:RG2.1`.

Import the split-rank interface from relative root theory and apply it to J_b. Change-of-representative isomorphisms make the integer depend only on [b].

The interface must support:

- `TauCeti.BunG.Defect.value`: Return rank_E G−rank_E J_b in Z.
- `TauCeti.BunG.Defect.conjugate`: Sigma conjugate representatives have equal defect.
- `TauCeti.BunG.Defect.product`: Defect is additive for products of groups and classes.

**Checks.**

- `TauCeti.BunG.Defect.testUnit`: For split GL_n and b=1 the defect is0.
- `TauCeti.BunG.Defect.testHalf`: For split GL_2 and simple slope1/2, ranks2 and1 give defect1.
- `TauCeti.BunG.Defect.testSplitNonbasic`: For split GL_2 slopes0,1, J_b is a split rank2 torus, so defect0 although b is nonbasic.

In He21 virtual dimension, Defect is the arithmetic rank correction; the ADLV dimension theorem has another owner.

In Zhu17 Lemma3.7, Restriction of scalars transports the rank correction.

GL_n slope blocks give n−sum of their division-module multiplicities.

Source: [Xuhua He, Cordial elements and dimensions of affine Deligne-Lusztig varieties](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/5A27DBF48CAEF6DA56A313061848574C/S205050862100010Xa.pdf/cordial-elements-and-dimensions-of-affine-delignelusztig-varieties.pdf), Section2.2 p.5.

<a id="pure-inner-twisting"></a>

### 11. Pure inner twisting of torsors

Prove `TauCeti.BunG.PureInnerTwisting`. For a group sheaf H on a site and an H-torsor T, put H_T=Aut_H(T). The bitorsor T induces an equivalence between H-torsors and H_T-torsors by S↦Isom_H(S,T), with the inverse contracted product. Applied on the curve, this is an equivalence of the actual torsor groupoids, not just of isomorphism classes.

Use [Tannakian description of analytic torsors](#g-torsors-three-descriptions); `AlgebraicModuliForArithmeticGeometry:R09.3`; `DiamondsAndVStacks:D3`.

Construct the left/right commuting bitorsor actions and the evaluation/counit isomorphisms. Descend the local trivializations to establish quasi-inverse functors.

An untrivialized torsor does not yield a canonical isomorphism H_T≅H.

Source: [Laurent Fargues, Peter Scholze, Geometrization of the local Langlands correspondence](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), III.4.1 p.100.

<a id="basic-inner-form-bundle-equivalence"></a>

### 12. Basic inner form equivalence

Prove `TauCeti.BunG.BasicInnerFormBundleEquivalence`. For basic b, the curve group Aut_G(E_b) is J_b×_E X. Pure inner twisting therefore gives Bun_G≃Bun_(J_b), compatible with perfectoid base change and carrying E_b to the trivial J_b-bundle.

Use [Pure inner twisting of torsors](#pure-inner-twisting); [Algebraic sigma-centralizer](#sigma-centralizer-J-b); `VectorBundlesAndIsocrystals:VB1/isocrystal-to-bundle-functor`; [Basic sigma class](#basic-class).

For a basic slope cocharacter the adjoint isocrystal has only slope0; its bundle is the descended J_b group. Apply the torsor equivalence relatively.

For nonbasic b the curve automorphism group has a nonconstant positive part; this statement does not apply.

Source: [Laurent Fargues, Peter Scholze, Geometrization of the local Langlands correspondence](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), III.4.2 andIII.4.3 pp.100-101.

<a id="division-algebra-morita"></a>

### 13. Division-algebra Morita comparison

Prove `TauCeti.BunG.DivisionAlgebraMorita`. For a simple isocrystal D(a,h) of slope λ=a/h, gcd(a,h)=1 and h>0, set A_λ=End_Φ(D(a,h)). Under the arithmetic Frobenius/Brauer convention of VB0, A_λ≅D_{−λ} has invariant −λ mod Z, and J_b≅A_λ^×. The associated bundle is O(−λ); the natural End comparison identifies A_λ with its endomorphism algebra. Twisting gives an equivalence between rank-h vector bundles and locally free rank-one right (A_λ⊗_E O_X)-modules via E↦Hom(E_b,E), with right action by precomposition. Its inverse is M↦M⊗_(A_λ⊗O_X)E_b, where E_b is a left A_λ-module. For m copies the automorphism group is GL_m(A_λ). This is a Morita/torsor equivalence.

The local field and arithmetic Frobenius conventions of VB0 apply; λ is the isocrystal slope, so the bundle slope is −λ. Right modules use Hom(E_b,E); the Hom(E,E_b) functor in FS Example III.4.4 uses left modules.

Use [Basic inner form equivalence](#basic-inner-form-bundle-equivalence); `tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory`; `VectorBundlesAndIsocrystals:VB0/endomorphism-division-algebra`; `VectorBundlesAndIsocrystals:VB0/brauer-invariant-sign`; `VectorBundlesAndIsocrystals:VB2:classification/bundle-endomorphism-comparison`.

Import the simple-block endomorphism presentation and its arithmetic Brauer invariant from the separate VB0 nodes; its parameter is the bundle slope −λ. Use the simple-block bundle endomorphism comparison, then apply basic inner twisting and the explicit right-module Hom/tensor adjunction.

For isocrystal slope 1/3 the bundle slope is −1/3 and inv_E(A_λ)=2/3 mod Z, rather than 1/3. The quaternion slope 1/2 example cannot distinguish the signs.

The chosen Hom functor is covariant in E and right A_λ-linear by precomposition; exchanging the Hom arguments exchanges sidedness.

Source: [Laurent Fargues, Peter Scholze, Geometrization of the local Langlands correspondence](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), ExampleIII.4.4 pp.101-102.

<a id="families-of-g-isocrystals"></a>

### 14. Families of G-isocrystals

Define `TauCeti.BunG.GIsocrystalFamily`. For a perfect F_q-algebra R, put L_R=R((t)) in equal characteristic and L_R=W_(O_E)(R)[1/π] in mixed characteristic. A family is a G-torsor on Spec L_R with a Frobenius descent isomorphism σ^*P≃P. This is a groupoid-valued prestack on perfect schemes; it is distinct from the geometric groupoid G-Isoc and from Bun_G on perfectoid spaces.

Use [G-isocrystals](#g-isocrystals-and-B-of-G); `AlgebraicModuliForArithmeticGeometry:R09.3`; `VectorBundlesAndIsocrystals:VB0`; `DiamondsAndVStacks:D3`.

Use the coefficient-ring and Frobenius construction from the linear supplier. Form equivariant torsors and their isomorphisms; pullback acts on both the torsor and its descent datum. The coefficient-ring torsor category has arc-descent by Ans22 Lemma11.3, using Iva23 Proposition5.10 and reflection of exactness along arc-covers. Frobenius isomorphisms and their coherence descend through its fully faithful morphism descent.

The interface must support:

- `TauCeti.BunG.GIsocrystalFamily.pullback`: Perfect-algebra maps pull back the torsor and Frobenius isomorphism, coherently.
- `TauCeti.BunG.GIsocrystalFamily.ofLoopElement`: A loop element b defines the trivial torsor with Frobenius bσ.
- `TauCeti.BunG.GIsocrystalFamily.geometricClass`: A geometric point defines its class in B(G).
- `TauCeti.BunG.GIsocrystalFamily.loopQuotient`: After v-stackification the moduli is LG/Ad_σ LG, using v-local triviality of the coefficient-ring torsor.

**Checks.**

- `TauCeti.BunG.GIsocrystalFamily.testField`: For R=bar F_q the geometric classes recover B(G).
- `TauCeti.BunG.GIsocrystalFamily.testTrivial`: For G=1 the family groupoid is terminal.
- `TauCeti.BunG.GIsocrystalFamily.testAutomorphisms`: For a nonbasic GL_2 class its family automorphisms are J_b(E), not the full positive-kernel bundle automorphisms.

In FS I.2 TheoremI.2.1, Provides the moduli and its locally closed strata.

In RR96 Corollary3.11, Provides the family κ-local-constancy application.

Do not identify all family morphisms with bundle morphisms.

Source: [Laurent Fargues, Peter Scholze, Geometrization of the local Langlands correspondence](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), I.2 pp.10-11.

Source: [Johannes Anschütz, Extending torsors on the punctured Spec(A_inf)](https://arxiv.org/pdf/1804.06356v2), Lemma11.3 pp.34–35 and Theorem11.4 pp.35–36. Supplies arc-descent for coefficient-ring G-torsors and their v-local triviality; this is a general scheme tensor-descent input, distinct from relative FF bundle descent.

<a id="isocrystal-family-v-descent"></a>

### 15. Isocrystal-family v-descent and strata

Prove `TauCeti.BunG.IsocrystalFamilyVDescent`. The G-isocrystal family prestack is a v-stack on perfect F_q-schemes. It has locally closed geometric-class strata indexed by B(G), each equivalent to [*/J_b(E)] for the locally profinite rational-point group. This is the family stack statement of FS I.2.1; the algebraic classifying stack [*/J_b] and the bundle stratum with its full automorphisms are different objects.

Use [Families of G-isocrystals](#families-of-g-isocrystals); [Algebraic sigma-centralizer](#sigma-centralizer-J-b); `DiamondsAndVStacks:D3`; `AlgebraicModuliForArithmeticGeometry:R09.3`; [Kottwitz invariant in isocrystal families](#family-kottwitz-local-constancy); `VectorBundlesAndIsocrystals:VB0`; `DiamondsAndVStacks:D2`; `tauceti:TauCetiRoadmap/ReductiveGroups#layer-1-representations--comodules`; `ReductiveGroupsPartII:RG2.3`; `mathlib:Submodule`.

Use Iva23 Lemma5.9/Proposition5.10 for arc-descent of coefficient vector bundles in both characteristics. Ans22 Lemma11.3 extends this to G-torsors by exact tensor reconstruction: exactness is reflected because the coefficient-ring map meets every maximal ideal (Iva23 Corollary5.6). Descend the Frobenius isomorphism using full faithfulness. Arc-descent implies v-descent independently of κ-local-constancy. Ans22 Theorem11.4 trivializes the underlying coefficient-ring torsor v-locally. Its proof reduces to absolutely integrally closed finite-rank valuation rings, uses Steinberg in rank0, the punctured-period-ring extension theorem in rank1, and valuation-ring excision/induction in higher rank. These are supplier inputs, not consequences of schematic torsor descent alone. The resulting presentation is LG/Ad_σ LG. Only after descent, use Newton semicontinuity and the separately proved family κ-local-constancy to construct the locally closed constant-class loci. The κ argument is not a premise of the descent proof. Cover a constant-class locus in the v-topology by spectra of products of perfect normal valuation rings. Choose the connected smooth affine O_E-model already supplied by RG2.3, as required by HK22 §2.1. Follow HK22 v5 Proposition2.10/Theorem2.11 on each normal piece: separate the least slope by Φ=π^(−r)φ^s and construct an effective lattice. Correct its Lemma2.9 proof bound by choosing a uniform denominator d for Φ on the initial rank-h lattice; the field-level iterated sum is bounded by π^(−d(h−1)), not by the Newton polygon alone (E08). Local freeness over general perfect bases still requires the proper lattice-moduli cover. For an effective local shtuka, HK22 Lemma2.8 represents finite-level fixed sections by affine étale schemes; constant slope-zero multiplicity makes them finite étale. The inverse limit trivializes the étale part on a profinite étale cover. Induct through the least slopes as in Proposition2.10. For G, reconstruct its defining tensor line in a faithful representation. Theorem2.11 then needs local continuous lifting within the actual Aut(V0) orbit of its Frobenius-compatible embeddings; a GL(H) section does not provide this lift (E09). This remains a genuine G04 proof obligation, so this sketch is not a closed proof of the stratum equivalence. After the actual orbit-lifting input is supplied, the normal-chart Isom sheaf is a torsor for the locally profinite J_b(E), and v-descent identifies the stratum with [*/J_b(E)] over any perfect base. The current HK22 theorem requires normality; this route does not claim a profinite étale trivialization over every non-normal perfect base. It gives neither the algebraic classifying stack [*/J_b] nor the positive-kernel automorphism group of a curve bundle.

The arc-descent argument is independent of the later family κ-local-constancy argument.

Apply current HK22 only over perfect normal charts. An arbitrary-perfect-base profinite étale statement cannot be read off from its v1 version or from v-local isotriviality.

The lattice bound includes the initial Frobenius denominator, and the tensor-line lift lies in the actual automorphism group. E08/E09 affect source proofs; neither is recorded as a counterexample to the stated isotriviality theorem. G04 remains open.

The native Lean controls detect a nonintegral shear bound and an ambient lift outside the tensor stabilizer. The actual family v-stack theorem, coefficient-ring descent and tensor-preserving orbit lift remain reader targets with the precise G04 obligations.

Source: [Laurent Fargues, Peter Scholze, Geometrization of the local Langlands correspondence](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), TheoremI.2.1 p.11.

Source: [Alexander B. Ivanov, Arc-descent for the perfect loop functor and p-adic Deligne–Lusztig spaces](https://arxiv.org/pdf/2003.04399v3), Corollary5.6 p.13; Lemmas5.8–5.9 and Proposition5.10 pp.14–15. Coefficient vector-bundle arc-descent, via perfectoid descent and the sousperfectoid comparison, in both characteristics.

Source: [Johannes Anschütz, Extending torsors on the punctured Spec(A_inf)](https://arxiv.org/pdf/1804.06356v2), Lemmas11.2–11.3 and Theorem11.4 pp.34–36. Exact tensor torsor arc-descent and v-local triviality; the valuation-ring and rank-one extension inputs are retained explicitly.

Source: [Paul Hamacher, Wansu Kim, Point counting on Igusa varieties for function fields](https://arxiv.org/pdf/2208.01069v5), v5 Lemmas2.8–2.9 pp.7–8, Proposition2.10 p.8 and Theorem2.11 p.9; v1 normality comparison in sourceVersions. Current isotriviality and the Isom torsor require perfect normal bases. E08 corrects a proof-level bound; E09 leaves the actual tensor-orbit lifting step open. Normal v-covers do not by themselves close that proof gap or yield arbitrary-base profinite étale triviality.

Source: [Thomas Zink, On the slope filtration](https://www.math.uni-bielefeld.de/~zink/slopes.pdf), Lemma9 and proof, author pp.11–12 (not Duke pagination). The minimal-stable-lattice and Nakayama argument bounds the number of iterates. The denominator-dependent field repair is our deduction; the author lemma concerns a p-divisible-group Dieudonné module.

<a id="finite-frobenius-norm-centralizer"></a>

### 16. Finite Frobenius norm centralizer

Prove `TauCeti.BunG.FiniteFrobeniusNormCentralizer`. For the degree-r unramified extension K_0/Q_p, δ∈G(K_0), σ^r=id, and γ=δσ(δ)⋯σ^(r−1)(δ), the algebraic twisted centralizer functor defined by δσ(g)=gδ becomes Z_G(γ) after base change to K_0. Extending the coefficient field from degree r to degree rn defines I_(p,n); after extension to L its centralizer is Z_G(γ^n). The norm of δ^n is not substituted for this iterated twisted product. This finite-period comparison is distinct from the infinite-coefficient Newton Levi J_δ.

Use [Algebraic sigma-centralizer](#sigma-centralizer-J-b); `tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory`; `AlgebraicModuliForArithmeticGeometry:R09.3`.

Iterate the twisted equation r times to obtain centralization of γ. On Z_G(γ), Ad(δ)σ has period r; perform finite Galois descent. Compare the point functors after K_0 base change. For the enlarged coefficient field, (δσ)^(rn)=γ^nσ^(rn); apply the same finite descent.

No general equality Z_G(γ)=Z_G(ν_b) is asserted.

Source: [Mark Kisin, Mod p points on Shimura varieties of abelian type](https://people.math.harvard.edu/~kisin/dvifiles/lr.pdf?download=1), Section2.1.2 printed29.

<a id="central-newton-on-J"></a>

### 17. Central Newton morphism of the centralizer

Define `TauCeti.BunG.CentralNewtonOnJ`. For every b∈G(L), the slope morphism ν_b, viewed in the center of its geometric centralizer, descends through the defining Frobenius descent datum to an E-rational central morphism ν_(b,J):D→J_b. No rational representative of ν_b inside G is needed. For a positive multiple N clearing its denominators, Nν_(b,J) is an integral cocharacter and U_π=(Nν_(b,J))(π) belongs to J_b(E).

Use [Algebraic sigma-centralizer](#sigma-centralizer-J-b); [Newton and Kottwitz invariants](#newton-and-kottwitz-maps); [Decent representative](#decent-representative).

The slope decomposition is preserved by every isocrystal automorphism, so ν_b is central in the centralizer. The semilinear Frobenius operator commutes with its slope grading; descend that central morphism with the J_b group. Clear the finite weight denominators and evaluate the resulting integral cocharacter at π.

The interface must support:

- `TauCeti.BunG.CentralNewtonOnJ.morphism`: Return the E-defined central D→J_b morphism.
- `TauCeti.BunG.CentralNewtonOnJ.integralMultiple`: For sufficiently divisible N>0 obtain an integral central cocharacter.
- `TauCeti.BunG.CentralNewtonOnJ.transport`: Sigma conjugacy transports ν_(b,J) through the centralizer isomorphism.

**Checks.**

- `TauCeti.BunG.CentralNewtonOnJ.testBasicHalf`: For a simple GL_2 slope1/2 block, 2ν_(b,J) is the central scalar cocharacter of D_(1/2)^×.
- `TauCeti.BunG.CentralNewtonOnJ.testUnit`: For b=1 the morphism is zero and U_π=1.
- `TauCeti.BunG.CentralNewtonOnJ.testNonbasic`: For GL_2 slopes1,0 it is central in J_b=G_m×G_m, while its image in GL_2 is noncentral.

In FS V.3.6, Defines the contracting action for every connected reductive G.

In KMPS1.1.16-1.1.17, Agrees with the central morphism obtained through a rational Newton witness when that witness exists.

Check its construction without the rational-Newton-in-G hypothesis.

Source: [Laurent Fargues, Peter Scholze, Geometrization of the local Langlands correspondence](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), PropositionV.3.6 p.175.

### Examples

For G_m, the class of π^m has isocrystal slope m and its bundle is O(−m). Changing a trivialization sends b to g b σ(g)⁻¹. With σ=id in an abelian group this action is trivial, so the classes of 1 and −1 in Q× differ. A quotient retaining only scalar invariants set to zero would fail this elementary test.

### Dependencies

The local inputs come from BG1. Each subsection names the direct target it consumes.

The external contracts are `AlgebraicModuliForArithmeticGeometry:R09.3`; `DiamondsAndVStacks:D2`; `DiamondsAndVStacks:D3`; `ReductiveGroupsPartII:RG2.1`; `ReductiveGroupsPartII:RG2.3`; `ReductiveGroupsPartII:RG2.4`; `VectorBundlesAndIsocrystals:VB0`; `VectorBundlesAndIsocrystals:VB0/brauer-invariant-sign`; `VectorBundlesAndIsocrystals:VB0/endomorphism-division-algebra`; `VectorBundlesAndIsocrystals:VB0/isocrystal-category-and-standard-block`; `VectorBundlesAndIsocrystals:VB0/tensor-and-dual-slopes`; `VectorBundlesAndIsocrystals:VB1`; `VectorBundlesAndIsocrystals:VB1/isocrystal-to-bundle-functor`; `VectorBundlesAndIsocrystals:VB2:classification/bundle-endomorphism-comparison`; `mathlib:Algebra.TensorProduct.congr`; `mathlib:Algebra.TensorProduct.map`; `mathlib:CategoryTheory.Aut.Aut_mul_def`; `mathlib:CategoryTheory.Equivalence`; `mathlib:CategoryTheory.Functor.Braided`; `mathlib:CategoryTheory.Functor.Linear`; `mathlib:CategoryTheory.Functor.Monoidal`; `mathlib:CategoryTheory.Groupoid`; `mathlib:CategoryTheory.NatTrans.IsMonoidal`; `mathlib:MulEquiv`; `mathlib:Subgroup`; `mathlib:Submodule`; `mathlib:WittVector.FractionRing.frobenius`; `mathlib:WittVector.Isocrystal`; `mathlib:WittVector.exists_frobenius_solution_fractionRing`; `tauceti:TauCeti.AlgHom.mapValue`; `tauceti:TauCeti.Comodule.baseChange_comp_endOfPoint`; `tauceti:TauCeti.Comodule.endOfPoint_tensor`; `tauceti:TauCeti.Comodule.endOfPoint_trivial`; `tauceti:TauCeti.Comodule.pointsAction`; `tauceti:TauCeti.Comodule.rTensor_comp_endOfPoint`; `tauceti:TauCeti.ExactStructure`; `tauceti:TauCeti.ExactStructure.IsConflationExact`; `tauceti:TauCeti.FGComoduleCat.scalarExtensionMonoidalFunctor`; `tauceti:TauCeti.FGPointRepresentationCat`; `tauceti:TauCeti.FGPointRepresentationCat.instRigidCategory`; `tauceti:TauCeti.MultiplicativeGroup.pointsMulEquiv_mapValue`; `tauceti:TauCeti.ReductiveAffineGroupSchemeCat`; `tauceti:TauCeti.Tannaka.fgPointTensorIsoEquiv`; `tauceti:TauCeti.Tannaka.scalarExtensionComponent`; `tauceti:TauCetiRoadmap/ReductiveGroups#layer-1-representations--comodules`; `tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory`. Their exact scope is specified above; the missing refinements below remain necessary.

## Layer 1: integral Kottwitz and Newton invariants

Keep the integral Kottwitz class alongside the rational Newton point. Classification supplies the order, while Levi and Weyl comparisons identify bounded, maximal and ordinary classes with their exact field hypotheses.

<a id="family-kottwitz-local-constancy"></a>

### 1. Kottwitz invariant in isocrystal families

Prove `TauCeti.BunG.FamilyKottwitzLocalConstancy`. For an F_q-scheme S with a G-isocrystal family, the function s↦κ(E_s) in π_1(G)_Γ is locally constant. Perfectifying S preserves the relevant topology. Analytify the family to the curve and apply bundle κ-local-constancy; this establishes the routed FS III.2.8 assertion without assuming it in the family v-descent proof.

Use [Families of G-isocrystals](#families-of-g-isocrystals); [Local constancy of bundle Kottwitz invariant](#semicontinuity-and-local-constancy); `VectorBundlesAndIsocrystals:VB1/isocrystal-to-bundle-functor`; `DiamondsAndVStacks:D3`.

After perfection write a Frobenius family on Spec R and associate the map Spd(R,R)→Bun_G, as in FS III.2.8. Pull back the clopen κ fibres along that map. Apply SW Proposition18.3.1, the bijection between clopen subsets of Spd(R,R) and Spec R; this proves scheme-topological local constancy. No commuting support or valuation map is assumed.

Do not create a dependency from bundle κ-local-constancy back to this corollary.

Source: [Laurent Fargues, Peter Scholze, Geometrization of the local Langlands correspondence](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), CorollaryIII.2.8 pp.92-93.

Source: [Peter Scholze, Jared Weinstein, Berkeley Lectures on p-adic Geometry](https://www.math.uni-bonn.de/people/scholze/Berkeley.pdf), Proposition18.3.1 §18.3.

<a id="abelianized-kottwitz-set"></a>

### 2. Abelianized Kottwitz set

Define `TauCeti.BunG.AbelianizedClass`. For E p-adic, B_ab(G)=H^1(W_E,[Gsc(L^sep)→G(L^sep)]) with the natural crossed-module action. The abelianization map comes from [1→G]→[Gsc→G]. A maximal torus complex [Tsc→T] and center complex [Zsc→Z] are homotopy-equivalent coefficient models, not replacements of G by an arbitrary abelian group.

E is p-adic; L^sep denotes a separable algebraic closure of L=breve E (the overline of breve E in FS), with its natural W_E-action. Continuous Weil cohomology uses these discrete coefficient groups, not only L-rational points.

Use [Kottwitz set B(G)](#sigma-conjugacy-quotient); `EndoscopicTransferAndUnitaryTraceComparison:ET.0`; `tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory`.

Import continuous crossed-module cohomology and the actual simply connected covering from their owners. Construct the canonical abelianization and compare the torus and center complexes.

The interface must support:

- `TauCeti.BunG.AbelianizedClass.abelianize`: Send a sigma class to its crossed-module H^1 class.
- `TauCeti.BunG.AbelianizedClass.torusModel`: Replace the crossed module by [Tsc(L^sep)→T(L^sep)] for a maximal torus.
- `TauCeti.BunG.AbelianizedClass.centerModel`: Replace it by [Zsc(L^sep)→Z(L^sep)].
- `TauCeti.BunG.AbelianizedClass.map`: Reductive homomorphisms and compatible simply connected lifts induce the abelianized map.

**Checks.**

- `TauCeti.BunG.AbelianizedClass.testTorus`: For a torus Gsc=1, B_ab(T)=B(T).
- `TauCeti.BunG.AbelianizedClass.testSLn`: For simply connected semisimple G the abelianized set is0.
- `TauCeti.BunG.AbelianizedClass.testPGLn`: For split PGL_n, B_ab(G)=Z/n, which cannot be recovered by rationalization.

In FS III.2.11, Identifies κ as abelianization.

In FS III.2.13, Gives the constant target of curve crossed-module H^1.

Restriction to p-adic E keeps finite diagonalizable groups étale.

Source: [Laurent Fargues, Peter Scholze, Geometrization of the local Langlands correspondence](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), III.2.4.2 pp.93-94.

<a id="slope-protorus"></a>

### 3. Rational slope protorus

Define `TauCeti.BunG.SlopeProtorus`. Let D=D(Q) be the diagonalizable E-protorus with coordinate Hopf algebra E[Q], using the additive group Q. It is not a finite-type torus. A homomorphism D→G is a Hopf-compatible coordinate map O(G)→E[Q]. Its restriction on each finite rational representation gives rational weight subspaces, with only finitely many nonzero weights. Over a splitting field, Hom(D,T) is Hom(X*(T),Q), hence X_*(T)⊗Q for a finite-rank torus. A rational cocharacter need not be integral.

Use `tauceti:TauCetiRoadmap/ReductiveGroups#layer-1-representations--comodules`; `VectorBundlesAndIsocrystals:VB0/dieudonne-manin-isocrystals`; `tauceti:TauCeti.DiagonalizableGroup.weightSpace`; `tauceti:TauCeti.DiagonalizableGroup.finite_setOf_weightSpace_ne_bot`; `tauceti:TauCeti.MonoidAlgebra.mapDomainBialgHom_surjective`; `mathlib:MonoidAlgebra.mapDomainBialgHom`.

Reuse the native group-algebra Hopf structure and diagonalizable point/weight APIs at the pinned library, specialized to the multiplicative presentation of the additive group Q; the direct limit of character lattices identifies its spectrum with the inverse limit of G_m under positive power maps. Restrict the representation comodule along O(G)→E[Q], and use the native internal weight decomposition and finite-support theorem. Clear the finitely many rational denominators. Apply the native group-algebra morphism/character-homomorphism correspondence over a field. For a split finite-rank torus this is the rational cocharacter space; Galois descent to a nonsplit torus retains the supplier’s action rather than treating it as a split torus.

The interface must support:

- `TauCeti.BunG.SlopeProtorus.weight`: For a representation comodule V and coordinate map ν:O(G)→E[Q], return the q-weight submodule of V obtained by native comodule corestriction.
- `TauCeti.BunG.SlopeProtorus.integralMultiple`: For a finite representation, choose a positive integer n such that n q is integral for every nonzero rational weight submodule. Finite support comes from the native diagonalizable weight theorem.
- `TauCeti.BunG.SlopeProtorus.toTorus`: Over a splitting field, the coordinate maps E[X*(T)]→E[Q] identify with additive maps X*(T)→Q. For a finite free character lattice this identifies Hom(D,T) with X_*(T)⊗Q; a nonsplit descent comparison must preserve its Galois action.
- `TauCeti.BunG.SlopeProtorus.map`: For G→H represented by O(H)→O(G), postcomposition of D→G is coordinate-map composition O(H)→O(G)→E[Q].
- `TauCeti.BunG.SlopeProtorus.mem_weight`: A vector v lies in the q-weight submodule precisely when its corestricted coaction is v⊗[q].
- `TauCeti.BunG.SlopeProtorus.finite_weights`: A finite representation has only finitely many nonzero rational weight submodules.
- `TauCeti.BunG.SlopeProtorus.toTorus_generator`: The coordinate map associated to X*(T)→Q sends the group-like generator [m] to [ν(m)].
- `TauCeti.BunG.SlopeProtorus.toMultiplicativeGroup`: The rational slope q determines a coordinate map E[Z]→E[Q] sending [n] to [n q].
- `TauCeti.BunG.SlopeProtorus.map_apply`: Coordinate-side postcomposition evaluates as the composite of the two bialgebra maps.

**Checks.**

- `TauCeti.BunG.SlopeProtorus.testHalf`: The actual half-slope coordinate map E[Z]→E[Q] sends the generator [2] to [1], detecting denominator clearing on Hopf algebra generators.
- `TauCeti.BunG.SlopeProtorus.testZero`: The zero-slope coordinate map sends every [n] to the unit [0], giving the trivial group homomorphism.
- `TauCeti.BunG.SlopeProtorus.testDenominator`: The half-slope coordinate map differs from every integral-slope map E[Z]→E[Q], including slope one.

In KMPS1.1.2, Newton morphisms have domain D.

In FS III.2, Graded tensor functors realize the Newton morphism.

Denominator h requires an h-fold integral representative.

Source: [Mark Kisin, Keerthi Madapusi Pera, Sug Woo Shin, Honda-Tate theory for Shimura varieties](https://math.berkeley.edu/~swshin/HT.pdf), Notational conventions and1.1.1 p.5.

<a id="newton-orbit-space"></a>

### 4. Newton orbit space and rational dominance

Define `TauCeti.BunG.NewtonSpace`. N(G) is the Γ_E-fixed set of G(bar E)-conjugacy classes of D→G. For a quasi-split inner form G*, choose a rational Borel and torus and identify it with Γ-fixed dominant rational cocharacters. Define ν≤νprime when νprime−ν is a nonnegative rational combination of positive coroots in the chosen chamber; the central projection is consequently equal.

Use [Rational slope protorus](#slope-protorus); `tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory`; `ReductiveGroupsPartII:RG2.1`.

Use the quasi-split rational chamber and the action on the based root datum. Compare orbit representatives in that chamber; transport the order across an inner twisting.

The interface must support:

- `TauCeti.BunG.NewtonSpace.dominant`: Choose the unique dominant representative in G*.
- `TauCeti.BunG.NewtonSpace.le`: Positive-coroot dominance with equal central projection.
- `TauCeti.BunG.NewtonSpace.delta`: Project to (π_1(G)⊗Q)^Γ.
- `TauCeti.BunG.NewtonSpace.transfer`: An inner twisting transports Newton orbit classes, independently of its representative.

**Checks.**

- `TauCeti.BunG.NewtonSpace.testGL2`: (1/2,1/2)≤(1,0), with equal total1.
- `TauCeti.BunG.NewtonSpace.testTorus`: For a torus dominance is equality.
- `TauCeti.BunG.NewtonSpace.testCentral`: For G_m, 0 and1 are incomparable despite the usual rational-number inequality.

In RR96 Proposition2.4, Detect basic minimality.

In KMPS1.1.5, Compare N_ξ(ν_b) with the Hodge average.

On GL_n compare descending slopes by partial sums with equal total.

Source: [Mark Kisin, Keerthi Madapusi Pera, Sug Woo Shin, Honda-Tate theory for Shimura varieties](https://math.berkeley.edu/~swshin/HT.pdf), 1.1.1 pp.5-6.

Source: [Michael Rapoport, Melanie Richartz, On the classification and specialization of F-isocrystals with additional structure](https://www.numdam.org/article/CM_1996__103_2_153_0.pdf), Section2.1 pp.165-166 (PDF14-15).

<a id="galois-average"></a>

### 5. Galois averaging and Hodge invariants

Define `TauCeti.BunG.HodgeInvariants`. For a geometric conjugacy class {μ}, choose its dominant representative μ* in a quasi-split inner form. Put μ♯=[μ*] in π_1(G)_Γ and μ◇=|Γ·μ*|^−1 sum over the finite orbit. The latter is dominant and Γ-fixed. Rational averaging gives (π_1(G)⊗Q)_Γ≅(π_1(G)⊗Q)^Γ and δ(μ◇)=average(μ♯⊗1); it is not an integral averaging isomorphism.

Use [Algebraic fundamental group](#algebraic-fundamental-group); [Newton orbit space and rational dominance](#newton-orbit-space); `tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory`.

Choose the finite quotient through which the based-root action and μ orbit factor. Average in the rational vector space; change of inner twisting changes the representative by conjugacy. Prove invariance, idempotence and compatibility with the coroot quotient.

The interface must support:

- `TauCeti.BunG.HodgeInvariants.sharp`: Return the full integral Γ-coinvariant class.
- `TauCeti.BunG.HodgeInvariants.diamond`: Return the rational dominant orbit average.
- `TauCeti.BunG.HodgeInvariants.average_eq`: The rational projection of sharp is delta of diamond.
- `TauCeti.BunG.HodgeInvariants.baseChange`: Restrict the Γ action and use the corresponding orbit average; ramified degree normalizations must be explicit.

**Checks.**

- `TauCeti.BunG.HodgeInvariants.testSplitGL2`: For split GL_2 and μ=(1,0), μ◇=(1,0) and μ♯=1.
- `TauCeti.BunG.HodgeInvariants.testUnit`: The zero cocharacter has both invariants0.
- `TauCeti.BunG.HodgeInvariants.testTorsion`: For the quadratic norm-one torus μ=1 has μ◇=0 and nonzero μ♯ in Z/2.

In KMPS1.1.5-1.1.6, Defines admissibility and its basic class.

In KZ2.2.4, Defines ordinary equality with the maximal possible Newton point.

Keep μ♯ integral even when μ◇ is fractional.

Source: [Mark Kisin, Keerthi Madapusi Pera, Sug Woo Shin, Honda-Tate theory for Shimura varieties](https://math.berkeley.edu/~swshin/HT.pdf), 1.1.5 pp.7-8.

<a id="newton-and-kottwitz-maps"></a>

### 6. Newton and Kottwitz invariants

Define `TauCeti.BunG.Invariants`. There are functorial maps ν:B(G)→N(G) and κ:B(G)→π_1(G)_Γ. The Newton morphism is the slope grading in every rational representation. Import the representative homomorphism κ̃:G(L)→π_1(G)_I from upstream RG2.1.5, rather than reconstructing its torus and z-extension foundations here. Given its Frobenius equivariance, κ is its descent to sigma classes followed by integral Frobenius coinvariants. Their rational images agree: δ(ν_b)=average(κ(b)⊗1).

The typed KottwitzDescent consumer interface takes an actual group G, an integral abelian group A, automorphisms σ and τ, and a supplied homomorphism with κ̃(σg)=τκ̃(g). It does not identify arbitrary such data with a reductive group over a local field.

Use [Kottwitz set B(G)](#sigma-conjugacy-quotient); [Newton orbit space and rational dominance](#newton-orbit-space); [Algebraic fundamental group](#algebraic-fundamental-group); [Galois averaging and Hodge invariants](#galois-average); `VectorBundlesAndIsocrystals:VB0/dieudonne-manin-isocrystals`; `tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory`; `ReductiveGroupsPartII:RG2.1`; `mathlib:Representation.Coinvariants`; `mathlib:Representation.Coinvariants.map`.

Construct the slope morphism from the genuine finite-isocrystal category using Dieudonné–Manin, the exact tensor structure and rational representation weights. Prove its twisted-conjugacy transformation rule, then descend to the canonical Newton orbit space. The full statement awaits the native VB0 and RG carriers in G08; an arbitrary Newton function does not imply reductive classification. Import the upstream representative Kottwitz homomorphism on G(L), its surjectivity and naturality. Request its local Frobenius-equivariance signature: the upstream README states this property but explicitly supplies no Lean target. For c=g b σ(g)⁻¹, compute κ̃(c)=κ̃(b)+κ̃(g)−τκ̃(g). Native integral coinvariants identify κ̃(g) with τκ̃(g), so the quotient universal property descends the representative formula uniquely. For a cyclic ℤ-action, positive powers give telescoping sums in the range of τ−id and negative powers reduce to positive powers using τ⁻¹. Conversely the generator relation is τa−a. This identifies the native relation submodule with that range. For an abelian point group, the same equation gives both directions of the quotient equivalence. Use the native coinvariant map of an integral intertwiner to check naturality on every representative; inherit surjectivity from the supplied homomorphism and quotient projection. Identify successive inertia/Frobenius coinvariants with π_1(G)_Γ using the actual local Galois action, then check the rational Newton compatibility square. Those reductive/local-field comparisons remain G08; only the equivariant integral descent is stated in the suggested file.

The interface must support:

- `TauCeti.BunG.Invariants.newton`: Evaluate the Newton class or its chosen dominant representative.
- `TauCeti.BunG.Invariants.kottwitz`: Evaluate κ in integral Γ-coinvariants.
- `TauCeti.BunG.Invariants.representativeKottwitz`: Evaluate the imported upstream κ̃ in integral inertia coinvariants before the σ quotient.
- `TauCeti.BunG.Invariants.map`: Group morphisms commute with κ and with the induced conjugacy-class Newton map.
- `TauCeti.BunG.Invariants.rationalCompatibility`: The δ/average square commutes; it does not recover torsion κ from ν.
- `TauCeti.BunG.KottwitzDescent.cyclicRepresentation`: For an integral abelian group A and additive automorphism τ, the multiplicativized integer n acts by the ℤ-linear automorphism τ^n.
- `TauCeti.BunG.KottwitzDescent.cyclicRepresentation_generator`: The positive generator acts by τ, fixing the arithmetic Frobenius orientation.
- `TauCeti.BunG.KottwitzDescent.Target`: Reuse native Representation.Coinvariants over ℤ for the cyclic action on A; retain torsion.
- `TauCeti.BunG.KottwitzDescent.relationMap`: The integral relation map is τ−id on the actual ℤ-module A.
- `TauCeti.BunG.KottwitzDescent.ker_eq_range`: The native cyclic-action relation submodule equals the range of τ−id; no rationalization occurs.
- `TauCeti.BunG.KottwitzDescent.Data`: Supply a homomorphism G→Multiplicative A together with its explicit Frobenius-equivariance equation. Upstream owns its reductive-group construction.
- `TauCeti.BunG.KottwitzDescent.representativeClass`: Project the supplied representative invariant to native integral Frobenius coinvariants.
- `TauCeti.BunG.KottwitzDescent.representative_twisted`: For c=g b σ(g)⁻¹, the additive representative invariant is κ̃(b)+κ̃(g)−τκ̃(g).
- `TauCeti.BunG.KottwitzDescent.representativeClass_twisted`: The native integral quotient kills the change κ̃(g)−τκ̃(g).
- `TauCeti.BunG.KottwitzDescent.classKottwitz`: Descend the supplied invariant to the actual SigmaClass quotient using twisted-conjugacy invariance.
- `TauCeti.BunG.KottwitzDescent.classKottwitz_mk`: On the class represented by b, the descended map is the native coinvariant class of κ̃(b).
- `TauCeti.BunG.KottwitzDescent.classKottwitz_unique`: A function on SigmaClass with the specified representative formula equals classKottwitz.
- `TauCeti.BunG.KottwitzDescent.classKottwitz_surjective`: Surjectivity of the supplied representative homomorphism implies surjectivity on sigma classes; it is an explicit hypothesis.
- `TauCeti.BunG.KottwitzDescent.intertwiner`: A ℤ-linear map intertwining τ and υ induces a native Representation.IntertwiningMap between their cyclic representations.
- `TauCeti.BunG.KottwitzDescent.classKottwitz_natural`: A Frobenius-compatible point-group map and an integral intertwiner compatible with the supplied representative homomorphisms commute with the descended maps via native Coinvariants.map.
- `TauCeti.BunG.KottwitzDescent.identityData`: For Multiplicative A with Frobenius τ, the identity homomorphism supplies the representative invariant.
- `TauCeti.BunG.KottwitzDescent.abelianEquiv`: The twisted-conjugacy quotient of Multiplicative A is equivalent to its native integral τ-coinvariants.
- `TauCeti.BunG.KottwitzDescent.abelianEquiv_mk`: The abelian equivalence sends a represented element a to its native integral coinvariant class.
- `TauCeti.BunG.KottwitzDescent.identityFrobeniusEquiv`: For identity Frobenius, the integral target is ℤ-linearly equivalent to A.
- `TauCeti.BunG.KottwitzDescent.identityFrobeniusEquiv_mk`: The identity-action target equivalence sends the class of a to a.
- `TauCeti.BunG.KottwitzDescent.signCoinvariantsEquiv`: For A=ℤ and τ(n)=−n, the native integral target is additively equivalent to ZMod 2.
- `TauCeti.BunG.KottwitzDescent.signCoinvariantsEquiv_mk`: The sign-action equivalence sends the integral class of n to its parity in ZMod 2.

**Checks.**

- `TauCeti.BunG.Invariants.testGL1`: b=π^m has ν=m and κ=m.
- `TauCeti.BunG.Invariants.testSign`: Its associated line bundle is O(−m), so degree is −κ.
- `TauCeti.BunG.Invariants.testTorsion`: The two norm-one torus classes have equal Newton0 and distinct κ in Z/2.
- `TauCeti.BunG.KottwitzDescent.testIdentityTarget`: With identity Frobenius and the identity representative map on Multiplicative A, the descended value of a is a.
- `TauCeti.BunG.KottwitzDescent.testUnit`: For every supplied equivariant representative homomorphism, the class represented by 1 maps to zero.
- `TauCeti.BunG.KottwitzDescent.testTwistedInvariant`: The classes represented by b and g b σ(g)⁻¹ have equal descended integral invariants.
- `TauCeti.BunG.KottwitzDescent.testSignParity`: For sign Frobenius on Multiplicative ℤ, the actual twisted class of n maps to n modulo 2.
- `TauCeti.BunG.KottwitzDescent.testSignDistinct`: Under sign Frobenius, the twisted classes represented by 0 and 1 differ; rationalizing the target would lose this distinction.
- `TauCeti.BunG.KottwitzDescent.testSignTwo`: Under sign Frobenius, the twisted classes represented by 2 and 0 agree.
- `TauCeti.BunG.KottwitzDescent.testSignNotFixed`: The sign-action coinvariant class of 1 is nonzero, whereas every fixed integer is zero; fixed points cannot replace coinvariants.

In GLX2.2, Defines acceptable classes and component cosets.

In BG2 and IG.0, Controls curve components and structured admissibility.

For GL_n, κ=v(det b) and ν is the descending slope tuple.

Source: [Mark Kisin, Keerthi Madapusi Pera, Sug Woo Shin, Honda-Tate theory for Shimura varieties](https://math.berkeley.edu/~swshin/HT.pdf), 1.1.2 equations1.1.2.1 and1.1.2.3 pp.6-7.

Source: [Michael Rapoport, Melanie Richartz, On the classification and specialization of F-isocrystals with additional structure](https://www.numdam.org/article/CM_1996__103_2_153_0.pdf), Theorem1.15 pp.160–162 (PDF9–11). Supplies the characteristic-zero invariant comparison. The general-field classification route is He16 §2.2/Theorem2.6 and the basic-class comparison is Kot14 §13; this citation alone is not an equal-characteristic proof.

Source: [Xuhua He, Hecke algebras and p-adic groups](https://arxiv.org/pdf/1511.01386v3), §2.2 p.22 and §2.4, Theorem2.6 pp.25–26. Works over either characteristic and retains both integral κ and the dominant Newton point.

Source: [Robert Kottwitz, B(G) for all local and global fields](https://arxiv.org/pdf/1401.5728), §13.1–13.3 and Proposition13.1 pp.65–66. Relates the general local-field B(G) to its σ-conjugacy presentation and the basic integral invariant.

<a id="straight-weyl-classification"></a>

### 7. Straight Weyl comparison with B(G)

Prove `TauCeti.BunG.StraightWeylClassification`. For the local Iwahori–Weyl group with its specified Frobenius and parahoric root datum, the map from σ-straight σ-conjugacy classes of Weyl elements to B(G) is a bijection and preserves κ and dominant Newton points. For w, choose n killing the finite Weyl/Frobenius action and write wσ(w)⋯σ^(n−1)(w)=t_λ; ν_w=λ/n. The straightness criterion is length(w)=<2ρ_Σ,ν_w^dom>. Generic affine Weyl groups, lengths and Adm(μ) belong to RG2.4.

Use [Newton and Kottwitz invariants](#newton-and-kottwitz-maps); `ReductiveGroupsPartII:RG2.4`; `ReductiveGroupsPartII:RG2.3`.

Import the actual local extended Weyl datum; choose normalizer representatives individually and use Lang to prove independence of the lift. A group-homomorphic section is not required. Prove independence of an allowed n and compatibility of invariant maps. Use the cited He14 straight-class theorem; its original proof remains a named source gap.

The rational translation normalization divides by n, not by the residue-field degree.

Source: [Mark Kisin, Rong Zhou, Independence of l for Frobenius conjugacy classes attached to abelian varieties](https://arxiv.org/pdf/2103.09945v2), §2.2.2 pp.9–10, with σ-straight definitions in §§2.1.3–2.1.4 pp.7–8. The map uses arbitrary normalizer lifts and independence by Lang, not a group-homomorphic section. E10 corrects the displayed twisted-conjugacy variable; the intended straight-class bijection and invariant square are unchanged.

<a id="classification-by-two-invariants"></a>

### 8. Kottwitz classification by both invariants

Prove `TauCeti.BunG.ClassificationByTwoInvariants`. The map (ν,κ):B(G)→N(G)×π_1(G)_Γ is injective. For basic classes, κ restricts to a bijection B(G)_basic≅π_1(G)_Γ; their Newton point is the central rational representative determined by κ⊗1. Injectivity of ν alone is false.

Use [Newton and Kottwitz invariants](#newton-and-kottwitz-maps); `tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory`; [Straight Weyl comparison with B(G)](#straight-weyl-classification).

Use He16 §2.2/Theorem2.6 for injectivity of the pair (integral κ, dominant ν) over every nonarchimedean local field. Import the actual local affine datum and its comparison from the straight-Weyl classification, retaining central torsion. Kot14 §13.1–13.3 and Proposition13.1 identify the basic local-field set with π_1(G)_Γ and compare it with the σ-conjugacy presentation. The rational compatibility square then determines its central Newton point. Kot97 and KMPS provide the p-adic specializations; they are not by themselves citations for equal characteristic.

Quadratic norm-one torus gives equal ν and unequal κ.

Source: [Robert Kottwitz, Isocrystals with additional structure II](https://people.dm.unipi.it/maffei/didattica/male/lacci/Kottwitz.pdf), Section4.13 pp.274-275 (injectivity), Section4.4 pp.268-269 (basic bijection), and Section5.1 pp.278-280. Supplies the stated p-adic specialization; use He16 and Kot14 for the general-field target.

Source: [Mark Kisin, Keerthi Madapusi Pera, Sug Woo Shin, Honda-Tate theory for Shimura varieties](https://math.berkeley.edu/~swshin/HT.pdf), 1.1.2.3 pp.6-7. Supplies the stated p-adic specialization; use He16 and Kot14 for the general-field target.

Source: [Xuhua He, Hecke algebras and p-adic groups](https://arxiv.org/pdf/1511.01386v3), §2.2 p.22; §2.4, Theorem2.6 pp.25–26. The setup allows either characteristic; Theorem2.6(3) states injectivity of the two invariants.

Source: [Robert Kottwitz, B(G) for all local and global fields](https://arxiv.org/pdf/1401.5728), §13.1–13.3 and Proposition13.1 pp.65–66. Supplies the basic bijection over general nonarchimedean local fields, with the σ-class identification in §13.3.

<a id="basic-class"></a>

### 9. Basic sigma class

Define `TauCeti.BunG.Basic`. A class is basic when its Newton morphism factors through Z(G), equivalently every adjoint representation slope is0. This definition applies to all connected reductive inner forms, independently of a rational representative choice.

Use [Newton and Kottwitz invariants](#newton-and-kottwitz-maps); `tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory`; [Kottwitz classification by both invariants](#classification-by-two-invariants).

Use centrality of the slope morphism and tensor functoriality to identify the adjoint criterion.

The interface must support:

- `TauCeti.BunG.Basic.adjoint_iff`: Basic iff the adjoint isocrystal has slope0.
- `TauCeti.BunG.Basic.ofKottwitz`: Construct the unique basic class with a given integral κ.
- `TauCeti.BunG.Basic.newton`: Its central rational slope is determined by κ⊗1.
- `TauCeti.BunG.Basic.innerTransport`: Corresponding basic classes for inner forms have the same integral κ and transferred Newton point.

**Checks.**

- `TauCeti.BunG.Basic.testGL2Half`: The simple GL_2 slope1/2 class is basic.
- `TauCeti.BunG.Basic.testTorus`: Every torus class is basic.
- `TauCeti.BunG.Basic.testNonbasic`: GL_2 with slopes1,0 is not basic.

In FS III.4, Basic twisting replaces G by J_b.

In HK26 Section1.1, Selects the unique basic member of B(G,{μ}).

Basic is isoclinic for GL_n, not necessarily slope0.

Source: [Mark Kisin, Keerthi Madapusi Pera, Sug Woo Shin, Honda-Tate theory for Shimura varieties](https://math.berkeley.edu/~swshin/HT.pdf), 1.1.2 p.6.

<a id="partial-order-on-B-of-G"></a>

### 10. Newton partial order with Kottwitz fibre

Define `TauCeti.BunG.NewtonOrder`. Define [b]≤[c] iff κ(b)=κ(c) and ν_b≤ν_c in the coroot order on N(G). Classification by both invariants makes this a partial order. The ν-only relation in KMPS is a preorder across all of B(G), and becomes a partial order on each κ fibre.

Use [Kottwitz classification by both invariants](#classification-by-two-invariants); [Newton orbit space and rational dominance](#newton-orbit-space).

Combine reflexivity/transitivity of the coroot cone with κ equality. Use the injectivity of (ν,κ) for antisymmetry.

The interface must support:

- `TauCeti.BunG.NewtonOrder.le_iff`: Expose the κ equality and Newton dominance.
- `TauCeti.BunG.NewtonOrder.partialOrder`: Reflexive, transitive and antisymmetric relation on B(G).
- `TauCeti.BunG.NewtonOrder.basic_minimal`: The basic class with κ=α lies below every class of κ=α.
- `TauCeti.BunG.NewtonOrder.representationCriterion`: With κ fixed, dominance is equivalent to the Newton-polygon inequalities on every rational representation.

**Checks.**

- `TauCeti.BunG.NewtonOrder.testGL2`: Basic slopes1/2,1/2 are below slopes1,0 in κ=1.
- `TauCeti.BunG.NewtonOrder.testDifferentKappa`: GL_1 classes0 and1 are incomparable.
- `TauCeti.BunG.NewtonOrder.testTorsion`: Distinct norm-one torus κ classes are incomparable although ν is0 for both.

In Viehmann Theorem1.1, The topology of |Bun_G| uses this ordered set.

In CS17 Proposition3.5.7, Determines closed upper Newton unions on the flag variety.

Order orientation is fixed once for specialization, flag stratification and charts.

Source: [Laurent Fargues, Peter Scholze, Geometrization of the local Langlands correspondence](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), III.2.2 pp.90–91.

Source: [Xuhua He, Cordial elements and dimensions of affine Deligne-Lusztig varieties](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/5A27DBF48CAEF6DA56A313061848574C/S205050862100010Xa.pdf/cordial-elements-and-dimensions-of-affine-delignelusztig-varieties.pdf), Section4.1 p.7.

<a id="representation-detects-dominance"></a>

### 11. Representations detect Newton dominance

Prove `TauCeti.BunG.RepresentationDetectsDominance`. For Γ-invariant rational cocharacter classes, ν≤νprime iff for every rational representation the descending slope tuples have the corresponding positive-coroot majorization; totals agree. Basic classes are minimal among the classes with the same rational central projection. Passing to B(G) additionally requires equality of integral κ.

RR96 Lemma2.2 is stated in characteristic zero. The equal-characteristic target uses the explicitly requested highest-weight/exterior-power detection and finite-separable scalar-descent interface in G02; it is not claimed closed.

Use [Newton orbit space and rational dominance](#newton-orbit-space); `tauceti:TauCetiRoadmap/ReductiveGroups#layer-1-representations--comodules`.

For the forward implication, use Weyl-invariance of representation weights and apply the dominant-weight inequality to each exterior power. Its largest Newton weight gives the corresponding partial sum of slopes; the determinant controls the total. This argument does not require semisimplicity of representations. For the converse, over a finite separable splitting field take highest-weight modules for positive integral multiples of the fundamental dominant weights, and restrict their scalars to E. Γ-invariance of ν makes the conjugate highest-weight evaluations agree. These representations detect each coroot inequality; central characters in both directions detect equality of central projections. RR96 Lemma2.2 states this argument in characteristic zero. The characteristic-independent highest-weight module and finite-separable descent interface is an additional precise ReductiveGroups layer-1 request under G02, not an assertion already supplied by RR96 or the pinned representation category. The Weyl average of a dominant point is its central projection, so that projection is below it in the coroot order. On B(G), impose equality of full integral κ separately.

A faithful representation alone does not establish the full equivalence without a weight-detection argument.

Source: [Michael Rapoport, Melanie Richartz, On the classification and specialization of F-isocrystals with additional structure](https://www.numdam.org/article/CM_1996__103_2_153_0.pdf), §2.1 and Lemma2.2 pp.165–166; Proposition2.4 and proof pp.166–167. The representation-detection statement assumes characteristic zero in §2.1. The all-characteristic extension is the stated proof plan with an additional G02 supplier contract.

<a id="admissible-pair"></a>

### 12. Acceptable classes B(G,{μ})

Define `TauCeti.BunG.Acceptable`. For a geometric cocharacter class {μ}, set B(G,{μ})={ [b] : κ(b)=μ♯ and N_ξ(ν_b)≤μ◇ }. ξ is an inner twisting to the quasi-split form used for the dominant average. Both conditions are required. Acceptable describes the local invariant set; it does not assert existence of a period point or weak admissibility.

Use [Galois averaging and Hodge invariants](#galois-average); [Newton and Kottwitz invariants](#newton-and-kottwitz-maps); [Newton partial order with Kottwitz fibre](#partial-order-on-B-of-G).

Define the subtype of sigma classes satisfying the two invariant conditions. Check independence of Borel, torus and inner twisting via invariant transport.

The interface must support:

- `TauCeti.BunG.Acceptable.mem_iff`: Membership is full κ equality and Newton bound.
- `TauCeti.BunG.Acceptable.basic`: The unique basic class of κ=μ♯ lies in B(G,{μ}).
- `TauCeti.BunG.Acceptable.finite`: The acceptable subset is finite.
- `TauCeti.BunG.Acceptable.torus_iff`: For T, membership is κ_T(b)=μ♯; the Newton equality follows.
- `TauCeti.BunG.Acceptable.product`: Acceptable sets for a product factor with the component bounds.

**Checks.**

- `TauCeti.BunG.Acceptable.testGL2`: For split GL_2 and μ=(1,0), basic slopes1/2,1/2 and ordinary slopes1,0 occur.
- `TauCeti.BunG.Acceptable.testZero`: B(G,{0}) contains exactly its basic class with κ=0.
- `TauCeti.BunG.Acceptable.testTorsion`: For the quadratic norm-one torus μ=1, only κ=1 mod2 is allowed, though both Newton points equal μ◇=0.

In HK26 Section1.1 and IG.0, Use finite indexing and its unique basic element.

In GLX Lemma3.16 and KMPS1.1.13, Lift bounded data through z-extensions and Levi subgroups.

Apply μ inverse in the CS flag convention.

Source: [Mark Kisin, Keerthi Madapusi Pera, Sug Woo Shin, Honda-Tate theory for Shimura varieties](https://math.berkeley.edu/~swshin/HT.pdf), 1.1.5 conditions1.1.5.1-2 p.8.

Source: [Mark Kisin, Rong Zhou, Independence of l for Frobenius conjugacy classes attached to abelian varieties](https://arxiv.org/pdf/2103.09945v2), Definition2.2.3 p.10.

<a id="levi-newton-formula"></a>

### 13. Basic Levi Newton formula

Prove `TauCeti.BunG.LeviNewtonFormula`. For quasi-split G/Q_p and a rational standard Levi M, a basic class b_M with κ_M(b_M)=μ_M♯ has Newton point the corresponding element of (X_*(Z_M)⊗Q)^Γ. If μ_M and μ have the same image in π_1(G), its image in B(G) is acceptable for μ precisely when its G-dominant Newton point is bounded by μ◇. The M-dominant and G-dominant representatives can differ by a Weyl conjugation.

Use [Basic sigma class](#basic-class); [Acceptable classes B(G,{μ})](#admissible-pair); `tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory`; `ReductiveGroupsPartII:RG2.1`.

Project the basic invariant through the rational center isomorphism for M. Use the functorial π_1 map and take G-dominant Newton representatives.

For a nonbasic G-class several distinct basic Levi classes can map to it; their Levi κ values need not coincide.

Source: [Mark Kisin, Keerthi Madapusi Pera, Sug Woo Shin, Honda-Tate theory for Shimura varieties](https://math.berkeley.edu/~swshin/HT.pdf), Lemma1.1.12 p.10.

Source: [Xuhua He, Cordial elements and dimensions of affine Deligne-Lusztig varieties](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/5A27DBF48CAEF6DA56A313061848574C/S205050862100010Xa.pdf/cordial-elements-and-dimensions-of-affine-delignelusztig-varieties.pdf), Section6.2 p.13.

<a id="ordinary-class"></a>

### 14. Ordinary Newton class

Define `TauCeti.BunG.Ordinary`. An acceptable class is μ-ordinary when its transferred dominant Newton point equals μ◇. Classification makes such a class unique if it exists. Its existence is guaranteed for quasi-split G; it is not automatic for a general inner form. For either characteristic, every B(G,{μ}) has a unique maximum, which need not satisfy ordinary equality.

Use [Acceptable classes B(G,{μ})](#admissible-pair); [Kottwitz classification by both invariants](#classification-by-two-invariants); [Unique maximum of acceptable classes](#acceptable-unique-maximum).

Define equality with the actual Hodge average, retaining acceptability. Use injectivity of (ν,κ) for uniqueness; use KZ’s quasi-split existence argument. Import the general-field maximum deduction from the characteristic-independent He–Nie root-datum theorem; retain its specific RG2.4 and convex-proof obligations.

The interface must support:

- `TauCeti.BunG.Ordinary.isOrdinary`: Acceptability and equality of transferred Newton with μ◇.
- `TauCeti.BunG.Ordinary.unique`: At most one acceptable class is ordinary.
- `TauCeti.BunG.Ordinary.quasiSplitExists`: Quasi-split G admits the ordinary class.
- `TauCeti.BunG.Ordinary.maximal`: An ordinary class is the maximum of B(G,{μ}).
- `TauCeti.BunG.Ordinary.derivedIsogeny`: A morphism inducing an isogeny on derived groups preserves ordinary existence and membership for compatible μ.

**Checks.**

- `TauCeti.BunG.Ordinary.testGL2`: For split GL_2 μ=(1,0), slopes1,0 are ordinary and1/2,1/2 are not.
- `TauCeti.BunG.Ordinary.testTorus`: The unique acceptable torus class is ordinary.
- `TauCeti.BunG.Ordinary.testQuaternion`: For G=D^× with invariant1/2 and geometric μ inverse=(0,−1), the acceptable set has its basic maximum but no ordinary member: after splitting/twisting the hypothetical slopes1/2,−1/2 each have multiplicity1, contrary to their denominator2.

In KZ2.2.6-2.3.3, Provides a straight translation and integral conjugacy.

In CS24 ordinary stratum, Supplies the local index; the unitary dimension calculation retains its own datum.

The μ-ordinary predicate and maximum are separate contracts.

Source: [Mark Kisin, Rong Zhou, Independence of l for Frobenius conjugacy classes attached to abelian varieties](https://arxiv.org/pdf/2103.09945v2), Definition2.2.4 and Remark2.2.5 p.10.

Source: [Mark Kisin, Keerthi Madapusi Pera, Sug Woo Shin, Honda-Tate theory for Shimura varieties](https://math.berkeley.edu/~swshin/HT.pdf), Section1.3.15 p.20.

<a id="acceptable-unique-maximum"></a>

### 15. Unique maximum of acceptable classes

Prove `TauCeti.BunG.AcceptableUniqueMaximum`. For a connected reductive group G over any nonarchimedean local field E with finite residue field, and a geometric conjugacy class {μ}, B(G,{μ}) has a unique maximum for the fixed-integral-κ Newton order. It is ordinary exactly when its Newton point equals μ◇. The general-field assertion is derived from the characteristic-independent root-datum theorem HN18 Theorem1.1(1) and the local straight-class/invariant comparison; it is not attributed to HN18 Theorem0.1 outside that theorem’s p-adic scope.

G/E is connected reductive, E is a nonarchimedean local field of either characteristic, and {μ} is a geometric cocharacter conjugacy class. No quasi-split hypothesis.

Use the actual local affine root datum and Frobenius action from RG2.4. Retain the full integral κ fibre while removing central inertia torsion for the numerical root-datum calculation.

Use [Acceptable classes B(G,{μ})](#admissible-pair); `ReductiveGroupsPartII:RG2.4`; [Straight Weyl comparison with B(G)](#straight-weyl-classification); [Kottwitz classification by both invariants](#classification-by-two-invariants).

Import the local Iwahori–Weyl datum, Frobenius and geometric cocharacter projection. He16 §2.2 permits both characteristics; its §2.4 comparison preserves κ and Newton points before the equal-characteristic restriction in §2.5. By StraightWeylClassification and two-invariant injectivity, the acceptable B(G) fibre identifies as a poset with the acceptable Newton values in the corresponding affine datum, at the fixed integral κ. For the finite central inertia-torsion subgroup K of the Iwahori–Weyl translation lattice, project to the torsion-free datum. Right exactness of σ-coinvariants identifies the kernel of the projected κ map with the image of K_σ. A lift with the wrong integral κ is corrected by a central torsion element; its Newton value is unchanged. Thus this numerical projection preserves the acceptable Newton set within the chosen κ fibre, without replacing κ by its rationalization. The resulting based reduced root datum and finite-order alcove-preserving affine Frobenius satisfy HN18 §1.3–§1.4. Pass to its adjoint datum using §2.1; express the affine action as an alcove stabilizer times a linear diagram action as in §2.2. Apply HN18 Theorem1.1(1). Its proof (§2.3–§2.5) uses the orbit-weight integrality criterion of Lemma2.5 and the largest allowed orbit-weight bounds to construct a Newton value ν. Chai Theorem6.5 gives the least dominant majorant of those bounds, and Lemma6.2(i) shows every acceptable value is ≤ν. These external convex/root proof inputs remain explicit G06/RG2.4 obligations. Lift back to the chosen integral κ as above and then to B(G). Two-invariant injectivity gives a unique class, and order compatibility makes it dominate every acceptable class. This field-independent transfer is our deduction from the cited root-datum theorem, not a claim that the paper’s p-adic Appendix A states an equal-characteristic theorem. Compare the resulting Newton value with μ◇ to characterize ordinary equality. Unique maximality does not assert ordinary existence for nonsplit inner forms.

In a nonsplit inner form maximality alone does not imply ordinary equality.

Source: [Xuhua He, Sian Nie, On the acceptable elements](https://arxiv.org/pdf/1408.5836), §§1.1–1.4 pp.2–4, Theorem1.1(1) p.4; §§2.1–2.5 pp.4–8; Appendix A pp.20–22. The root-datum maximum theorem has no field parameter. The p-adic group theorem and Appendix are kept within their stated scope; the general-field transfer and fixed-κ central-torsion argument are explicit deductions in this proof sketch.

Source: [Xuhua He, Hecke algebras and p-adic groups](https://arxiv.org/pdf/1511.01386v3), §2.2 pp.22–24 and §2.4, Theorem2.6 pp.25–26. Supplies the local Iwahori–Weyl and invariant-preserving class comparison for a general local field. This citation precedes the equal-characteristic-only schematic closure discussion.

Source: [Mark Kisin, Rong Zhou, Independence of l for Frobenius conjugacy classes attached to abelian varieties](https://arxiv.org/pdf/2103.09945v2), Remark2.2.5 p.10. Supplies the p-adic application and the distinction between a maximum and an ordinary class.

<a id="ordinary-straight-translation"></a>

### 16. Ordinary straight translation and Levi centrality

Prove `TauCeti.BunG.OrdinaryStraightTranslation`. Every ordinary class has a representative lifting a σ-straight translation t_μprime with μprime in the relative Weyl orbit of the projected μ. Such a translation has μprime central in the rational Newton Levi. If μprime=w(μ) with μ the projection of an absolute dominant cocharacter μtilde, the compatible absolute lift w(μtilde) is central in that Levi. The absolute/relative projection and Frobenius are part of the supplied root datum.

Use [Ordinary Newton class](#ordinary-class); [Straight Weyl comparison with B(G)](#straight-weyl-classification); `ReductiveGroupsPartII:RG2.4`; `tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory`.

Use the source arithmetic convention for t_muprime: a lift of an actual split cocharacter is muprime(pi), with Kottwitz class +[muprime]. Current upstream RG2.4 labels a translation by the inverse Kottwitz image, so this same point has upstream label -muprime and apartment displacement -muprime. Transport the chamber and Newton normalization before applying its length or dominance statements; the source translation label is not the upstream displacement label. Apply the straightness equality to compare the coroot pairings with the Newton centralizer. Use the compatible absolute lift and averaging to force the remaining Levi root pairings to vanish. Use ordinary equality and the straight-class bijection to choose the translation representative.

Centrality is in the Newton Levi, not necessarily in G.

For split GL_2, diag(pi,1) has arithmetic kappa=1 and dominant Newton point (1,0). Its upstream translation label is (-1,0), whose dominant displacement is (0,-1); applying -w_0 recovers (1,0).

Source: [Mark Kisin, Rong Zhou, Independence of l for Frobenius conjugacy classes attached to abelian varieties](https://arxiv.org/pdf/2103.09945v2), Lemma2.2.6 p.10, using Lemma2.1.7 p.8 and Lemma2.1.9 p.9 (arXiv v2).

<a id="ordinary-derived-isogeny"></a>

### 17. Ordinary classes under a derived isogeny

Prove `TauCeti.BunG.OrdinaryDerivedIsogeny`. If f:G→Gprime induces an isogeny of derived groups and sends μ to μprime, the ordinary class exists for (G,μ) iff it exists for (Gprime,μprime). For b∈B(G,{μ}), b is ordinary iff f(b) is ordinary. The proof compares the noncentral root data and restores the central equality from acceptability.

Use [Ordinary Newton class](#ordinary-class); [Ordinary straight translation and Levi centrality](#ordinary-straight-translation); `tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory`.

Compare the dominant Newton points modulo the center using the derived isogeny. The rational κ compatibility fixes the central component, so equality lifts. For existence use the compatible straight translation and Kottwitz class.

The morphism need not be an isomorphism on centers; this is why full acceptability is retained.

Source: [Mark Kisin, Rong Zhou, Independence of l for Frobenius conjugacy classes attached to abelian varieties](https://arxiv.org/pdf/2103.09945v2), Lemma2.2.8 p.10.

<a id="ordinary-integral-conjugacy"></a>

### 18. Integral conjugacy of an ordinary admissible element

Prove `TauCeti.BunG.OrdinaryIntegralConjugacy`. In the KZ local setup with the specified connected parahoric model, if b is μ-ordinary and lies in the union of μ-admissible parahoric double cosets, b lies in the double coset of a σ-straight translation t_μprime for μprime in W_0μ. It is σ-conjugate to the chosen translation lift by an element of G(O_breveF). The claim is for elements satisfying the integral double-coset hypothesis, not every representative of the ordinary class.

Use KZ §2.1: F a nonarchimedean local field, connected reductive G/F, a σ-stable alcove, its Iwahori model I, and a specified connected parahoric model G_script with subgroup W_J. Require b to lie in both the μ-admissible parahoric double-coset union and the ordinary class. Here G_script(O_breveF) is the parahoric subgroup, not the rational points of G.

Use [Ordinary straight translation and Levi centrality](#ordinary-straight-translation); `ReductiveGroupsPartII:RG2.4`; `ReductiveGroupsPartII:RG2.3`.

Use He–Rapoport Theorem6.1(b) to σ-conjugate b by the specified parahoric into an Iwahori cell indexed by a minimal W_J coset representative. He16 Theorem6.1 puts that index in Adm(μ). Use He–Zhou Theorem4.1 to find a σ-straight x below that index whose Iwahori cell meets the ordinary class, and He14 Theorem3.5 to identify its class. The ordinary equality and KZ Lemma2.2.6 force x=t_μprime; admissible length comparison forces the original index to equal x. Apply He14 Proposition4.5: the Iwahori double coset of a σ-straight lift is a single σ-conjugacy orbit under I(O_breveF). Composing the two integral conjugators proves (2). These non-routine imported inputs remain the precise G10 obligations.

A conjugate by an arbitrary G(L) element can leave the admissible integral double coset.

Source: [Mark Kisin, Rong Zhou, Independence of l for Frobenius conjugacy classes attached to abelian varieties](https://arxiv.org/pdf/2103.09945v2), Proposition2.3.3 pp.11-12.

<a id="product-and-unramified-norm"></a>

### 19. Products and unramified restriction of scalars

Prove `TauCeti.BunG.ProductAndUnramifiedNorm`. B(G1×G2)=B(G1)×B(G2), compatibly with ν,κ,defect and acceptable bounds. For E/F unramified of degree d and G=Res_(E/F)H, after decomposing G(breveF) into d factors, Nm(b)=b_0 σ(b_1)⋯σ^(d−1)(b_(d−1)) gives B(G,σ)≅B(H,σ_E). The bound on H is the sum of the component cocharacters, with the chosen factor identifications. J_b^G≅Res_(E/F)J_Nm(b)^H and the F/E split-rank defects agree.

Use [Defect of a sigma class](#defect); [Acceptable classes B(G,{μ})](#admissible-pair); `tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory`.

Write the Frobenius cycle on the d factors and eliminate d−1 factors by sigma conjugation. Compare the surviving semilinear operator and centralizer. Use Shapiro on π_1 and sum the Hodge components; compare ρ pairings with the precise normalized Newton tuple.

Do not multiply the defect by d; restriction of scalars preserves the appropriate local split rank.

Source: [Xinwen Zhu, Affine Grassmannians and the geometric Satake in mixed characteristic](https://annals.math.princeton.edu/wp-content/uploads/annals-v185-n2-p02-p.pdf), Remark3.6 and Lemma3.7 p.459.

Source: [Robert Kottwitz, Isocrystals with additional structure II](https://people.dm.unipi.it/maffei/didattica/male/lacci/Kottwitz.pdf), Section6.5 equations6.5.2-6.5.3 p.288.

<a id="basic-levi-fibre-uniqueness"></a>

### 20. Levi fibre over a basic G-class

Prove `TauCeti.BunG.BasicLeviFibreUniqueness`. For a basic G-class and a σ-stable standard Levi, its intersection with the Levi has at most one Levi σ-conjugacy class. For a nonbasic G-class the corresponding uniqueness assertion is false; the Levi-dominant Newton vector can be a Weyl conjugate of the G-dominant vector and Levi κ must be checked separately.

Use [Kottwitz classification by both invariants](#classification-by-two-invariants); [Basic Levi Newton formula](#levi-newton-formula); `ReductiveGroupsPartII:RG2.4`.

Use the basic central Newton vector and the integral Levi invariant compatibility. Apply the corrected GHN basic-only uniqueness statement cited by He. Keep the nonbasic Levi invariant obstruction for ADLV consumers; do not import a false general uniqueness lemma.

In GL_3, different allocations of slopes to unequal Levi blocks can give different Levi κ while mapping to the same G-class.

Source: [Xuhua He, Cordial elements and dimensions of affine Deligne-Lusztig varieties](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/5A27DBF48CAEF6DA56A313061848574C/S205050862100010Xa.pdf/cordial-elements-and-dimensions-of-affine-delignelusztig-varieties.pdf), Theorem6.3 footnote and Section6.2 pp.13-14.

<a id="gl-minuscule-quasisplit-centralizer"></a>

### 21. Quasi-split centralizer in the GL minuscule case

Prove `TauCeti.BunG.GlMinusculeQuasisplitCentralizer`. For GL_n over a p-adic field L and μ(t)=diag(t repeated n−q,1 repeated q), exactly one class in B(GL_n/L,{μ^−1}) has quasi-split J_b: the ordinary class diag(π^−1 repeated n−q,1 repeated q). The extension to the CS17 unramified restrictions of scalars uses the cocharacter supported at one noncentral embedding. No implication quasi-split J_b⇒ordinary is claimed for arbitrary reductive data.

Use [Algebraic sigma-centralizer](#sigma-centralizer-J-b); [Ordinary Newton class](#ordinary-class); [Products and unramified restriction of scalars](#product-and-unramified-norm); `VectorBundlesAndIsocrystals:VB0/dieudonne-manin-isocrystals`; `tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory`.

Acceptability confines slopes to [−1,0]. A nonintegral slope introduces a nontrivial division algebra factor in J_b and prevents quasi-splitness. κ fixes the multiplicities of the integral slopes−1 and0. For Res use the single-embedding norm-bound normalization from the source.

For an arbitrary cocharacter with more integral slopes, a quasi-split centralizer need not select the ordinary class.

Source: [Ana Caraiani, Peter Scholze, On the generic part of the cohomology of compact unitary Shimura varieties](https://annals.math.princeton.edu/wp-content/uploads/annals-v186-n3-p01-p.pdf), Lemma5.5.8 and preceding footnote p.748.

<a id="admissible-finiteness-and-basic"></a>

### 22. Finiteness and the basic acceptable member

Prove `TauCeti.BunG.AdmissibleFinitenessAndBasic`. B(G,{μ}) is finite and has exactly one basic member, characterized by κ=μ♯. That member is its minimum for the Newton order. For μ=0 it is the only member. For tori the whole acceptable set is this singleton.

Use [Acceptable classes B(G,{μ})](#admissible-pair); [Basic sigma class](#basic-class); [Representations detect Newton dominance](#representation-detects-dominance); [Kottwitz classification by both invariants](#classification-by-two-invariants); `VectorBundlesAndIsocrystals:VB0/dieudonne-manin-isocrystals`.

Choose a faithful rational representation. Its Newton slopes lie in the bounded majorization interval given by μ◇, with fixed total, and each rational slope denominator divides its multiplicity by Dieudonné–Manin. Thus only finitely many GL_n slope tuples occur. The torus weight map is injective, so passage to Weyl orbits has finite fibres. At fixed integral κ, injectivity of (ν,κ) converts this finite set of Newton points into finiteness of B(G,{μ}). Use the general-field classification and linear slope inputs; Kot97/KMPS state the p-adic case. The unique basic class of κ=μ♯ exists by the basic bijection. Its Newton point is the Weyl average, hence below every acceptable dominant point by the coroot-cone argument. For μ=0 the only dominant point below zero with central projection zero is zero. For tori the coroot order is equality.

Zero bound cannot contain a noncentral positive-coroot displacement with the same central projection.

Source: [Robert Kottwitz, Isocrystals with additional structure II](https://people.dm.unipi.it/maffei/didattica/male/lacci/Kottwitz.pdf), Section6.4 and6.6 pp.287-288. Supplies the p-adic specialization; the displayed proof specifies the general-field deduction and its requested inputs.

Source: [Mark Kisin, Keerthi Madapusi Pera, Sug Woo Shin, Honda-Tate theory for Shimura varieties](https://math.berkeley.edu/~swshin/HT.pdf), Lemma1.1.6 p.8. Supplies the p-adic specialization; the displayed proof specifies the general-field deduction and its requested inputs.

Source: [Michael Rapoport, Melanie Richartz, On the classification and specialization of F-isocrystals with additional structure](https://www.numdam.org/article/CM_1996__103_2_153_0.pdf), Proposition2.4(iii) and proof pp.166–167. Provides the faithful-representation finiteness strategy in characteristic zero. Its all-characteristic adaptation uses the explicitly requested weight-detection interface and native general-E Dieudonné–Manin classification.

Source: [Robert Kottwitz, B(G) for all local and global fields](https://arxiv.org/pdf/1401.5728), §13.1–13.3 and Proposition13.1 pp.65–66. Provides uniqueness and existence of the basic class at the full integral κ in either characteristic.

<a id="rational-newton-witness"></a>

### 23. Rational Newton representative

Define `TauCeti.BunG.RationalNewtonWitness`. A rational-Newton witness for [b] is an E-rational homomorphism ν_G([b]):D→G in the G(L)-conjugacy class of ν_b, with a specified conjugator. It exists when G is quasi-split or [b] is basic; the KMPS constructions that require it retain this hypothesis for general inner forms.

Use [Newton and Kottwitz invariants](#newton-and-kottwitz-maps); `tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory`; [Basic sigma class](#basic-class).

Record the actual representative and conjugacy equation. For quasi-split groups choose the Γ-fixed dominant member; for basic classes descend the central morphism.

The interface must support:

- `TauCeti.BunG.RationalNewtonWitness.quasiSplit`: Build the unique B-dominant rational representative for quasi-split G.
- `TauCeti.BunG.RationalNewtonWitness.basic`: A basic class has a central rational representative.
- `TauCeti.BunG.RationalNewtonWitness.levi`: Return Z_G(ν_G([b])) as an E-defined Levi.
- `TauCeti.BunG.RationalNewtonWitness.centralOnJ`: Transport the central Newton morphism to J_b, retaining the inner identification.

**Checks.**

- `TauCeti.BunG.RationalNewtonWitness.testSplitGL2`: The slope1,0 map has the diagonal rational representative.
- `TauCeti.BunG.RationalNewtonWitness.testBasic`: A basic witness centralizes all of G.
- `TauCeti.BunG.RationalNewtonWitness.testInnerForm`: An anisotropic inner form need not realize a noncentral geometric Newton orbit rationally.

In KMPS1.1.15-1.1.17, Supports rational Levi reduction and torus transfer.

In Kisin17 proof2.2.2, Supplies the dominant rational Newton representative.

Galois invariance of an orbit is weaker than having a rational representative in G.

Source: [Mark Kisin, Keerthi Madapusi Pera, Sug Woo Shin, Honda-Tate theory for Shimura varieties](https://math.berkeley.edu/~swshin/HT.pdf), 1.1.3 condition1.1.3.1 p.7. KMPS states the p-adic case. For general E, the quasi-split rational chamber identifies Γ-fixed rational cocharacters with E-defined slope morphisms; a basic central morphism descends without a chamber choice. These are the requested rational-cocharacter descent inputs of the reductive-group owner.

<a id="minuscule-basic-levi-lift"></a>

### 24. Minuscule basic Levi lifting

Prove `TauCeti.BunG.MinusculeBasicLeviLift`. For a connected reductive G/Q_p, a rational Levi M containing a maximal torus T, a G-minuscule μ∈X_*(T), and basic b_M whose image lies in B(G,{μ}), some w in the absolute Weyl group W(G,T) makes b_M∈B(M,{wμ}). For quasi-split G the proof first treats unramified models, then replaces the based-root averaging datum by an unramified datum; the general case transports the rational Levi to G*.

Use [Basic Levi Newton formula](#levi-newton-formula); [Rational Newton representative](#rational-newton-witness); `tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory`; `ReductiveGroupsPartII:RG2.4`; `ReductiveGroupsPartII:RG2.1`.

Use Wintenberger Cartan realization, Iwasawa reduction and Mazur inequality in the unramified case. Require equality of the integral π_1(G) class in the Satake reduction; minuscule dominance alone is insufficient. Use the torsion-free kernel of π_1(M)_Γ→π_1(G)_Γ and the matching Galois averages for the unramified replacement. Transport a rational parabolic and its rational Levi by the inner twisting; basic κ and ν are compatible.

GL_3 with M=GL_1×GL_2, μ=(0,1,0), b_M=diag(p,1,1) needs the absolute Weyl swap; N_G(M)/M is trivial.

Source: [Mark Kisin, Keerthi Madapusi Pera, Sug Woo Shin, Honda-Tate theory for Shimura varieties](https://math.berkeley.edu/~swshin/HT.pdf), Proposition1.1.13 and Corollary1.1.15 pp.10-12.

Source: [Mark Kisin, Keerthi Madapusi Pera, Sug Woo Shin, Honda-Tate theory for Shimura varieties](https://math.berkeley.edu/~swshin/HT.pdf), Corollary1.1.15 p.11.

<a id="torus-norm-description"></a>

### 25. Torus norm and Newton average

Prove `TauCeti.BunG.TorusNormDescription`. For a torus T/E, κ:B(T)≅X_*(T)_Γ and ν of the class κ^−1([λ]) is the rational Γ-average of λ. Kottwitz’s finite splitting-field norm construction gives a representative after choosing the splitting extension, the unramified coefficient field and the valuation normalization of its uniformizer; these choices do not change the resulting class.

Use [Kottwitz classification by both invariants](#classification-by-two-invariants); [Galois averaging and Hodge invariants](#galois-average); `tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory`.

Apply the valuation/cocharacter description over a splitting extension. Use norm maps and Shapiro to descend the cocharacter class. Identify Newton slopes through all characters with the normalized Galois average.

For a quadratic norm-one torus, two integral κ classes have Newton0.

Source: [Mark Kisin, Keerthi Madapusi Pera, Sug Woo Shin, Honda-Tate theory for Shimura varieties](https://math.berkeley.edu/~swshin/HT.pdf), 1.1.2.4 p.7. Supplies the p-adic case and its normalized finite splitting-field norm formula; use Kot14 for the general-field statement.

Source: [Robert Kottwitz, Isocrystals with additional structure](https://www.numdam.org/article/CM_1985__56_2_201_0.pdf), Sections2.4-2.8 pp.208-210. Supplies the p-adic case and its normalized finite splitting-field norm formula; use Kot14 for the general-field statement.

Source: [Robert Kottwitz, B(G) for all local and global fields](https://arxiv.org/pdf/1401.5728), §12.13 p.63; Lemma12.12 and §13.2 p.65. The torus and norm/Shapiro constructions apply over arbitrary nonarchimedean local fields; §13.2 identifies the integral torus invariant.

<a id="torus-special-pair"></a>

### 26. Torus-special acceptable pair

Define `TauCeti.BunG.TorusSpecial`. For T⊂G a maximal torus over Q_p, an acceptable pair ([b],{μ}) is T-special if there exists μ_T∈X_*(T) in {μ} such that the unique class of B(T) with κ_T=[μ_T] maps to [b]. For tori admissibility is determined by κ, and the Newton point is the Galois average of μ_T. This packages local specialness, not a global CM point.

Use [Acceptable classes B(G,{μ})](#admissible-pair); [Torus norm and Newton average](#torus-norm-description); `tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory`.

Use the torus Kottwitz bijection to define the class from the cocharacter. State its image equality in B(G) as the witness, rather than asserting arbitrary torus specialness.

The interface must support:

- `TauCeti.BunG.TorusSpecial.mk`: Package μ_T, its conjugacy class and its torus-class image equation.
- `TauCeti.BunG.TorusSpecial.witness`: Recover μ_T and the B(T) class.
- `TauCeti.BunG.TorusSpecial.newton`: The mapped class has Newton orbit the image of average(μ_T).
- `TauCeti.BunG.TorusSpecial.ellipticBasic`: For elliptic T a basic acceptable pair has a T-special witness.

**Checks.**

- `TauCeti.BunG.TorusSpecial.testSplitGL1`: For G=T=G_m, μ=m gives the class of p^m.
- `TauCeti.BunG.TorusSpecial.testZero`: The trivial class with μ=0 is T-special.
- `TauCeti.BunG.TorusSpecial.testSplitTorus`: For GL_2, the basic slope1/2 class cannot come from an integral cocharacter of the split diagonal torus; the ellipticity hypothesis matters.

In KMPS Lemma1.1.8, Supplies local basic specialness.

In KMPS Corollary1.1.17, Transferred maximal tori supply the nonbasic special witness.

The witness fixes both the cocharacter orbit and full κ.

Source: [Mark Kisin, Keerthi Madapusi Pera, Sug Woo Shin, Honda-Tate theory for Shimura varieties](https://math.berkeley.edu/~swshin/HT.pdf), Definition1.1.7 p.8.

<a id="elliptic-torus-basic-image"></a>

### 27. Elliptic tori and basic acceptable classes

Prove `TauCeti.BunG.EllipticTorusBasicImage`. If T⊂G is elliptic modulo Z(G), the image of B(T)→B(G) is exactly B(G)_basic. For every basic acceptable pair ([b],{μ}) and every μ_T∈X_*(T) in {μ}, the image of κ_T^−1([μ_T]) is [b]. Thus every such pair is T-special; this argument requires no minuscule hypothesis.

Use [Torus-special acceptable pair](#torus-special-pair); [Basic sigma class](#basic-class); `tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory`.

Ellipticity makes the rational average of every cocharacter central in G, so the image is basic. The integral cocharacter quotient maps surjectively to π_1(G)_Γ, giving surjectivity onto basic classes. For μ_T in the given geometric orbit the image κ is μ♯; basic-class uniqueness identifies it with [b].

A split nonelliptic torus in GL_2 also produces nonbasic classes.

Source: [Robert Kottwitz, Isocrystals with additional structure](https://www.numdam.org/article/CM_1985__56_2_201_0.pdf), Proposition5.3 printed215.

Source: [Mark Kisin, Keerthi Madapusi Pera, Sug Woo Shin, Honda-Tate theory for Shimura varieties](https://math.berkeley.edu/~swshin/HT.pdf), Lemma1.1.8 p.8.

<a id="transferred-torus-specialness"></a>

### 28. Specialness for a transferred centralizer torus

Prove `TauCeti.BunG.TransferredTorusSpecialness`. Under a rational Newton witness, a G-minuscule acceptable pair and a rational transfer j:Tprime→M_[b] of a maximal torus of J_b, the pair is j(Tprime)-special. There is μ_Tprime in the prescribed geometric class whose Galois average equals the central morphism ν_(b,J). Such a transfer exists if G is quasi-split or Tprime is elliptic; geometric conjugacy alone is not a transfer.

Use [Rational Newton representative](#rational-newton-witness); [Minuscule basic Levi lifting](#minuscule-basic-levi-lift); [Torus-special acceptable pair](#torus-special-pair); `tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory`; `EndoscopicTransferAndUnitaryTraceComparison:ET.0`; [Elliptic tori and basic acceptable classes](#elliptic-torus-basic-image).

Conjugate the Newton representative and transferred torus together; centralize its maximal split subtorus to obtain a rational Levi M. The explicit representative mh·b·σ(mh)^−1 lies in M(L) and is basic there. Apply the corrected absolute-Weyl-group Levi lift and the elliptic-torus specialness theorem in M. Transport the average equality through the chosen J_b inner identification.

The statement retains the rational transfer witness in the non-quasi-split case.

Source: [Mark Kisin, Keerthi Madapusi Pera, Sug Woo Shin, Honda-Tate theory for Shimura varieties](https://math.berkeley.edu/~swshin/HT.pdf), Section1.1.16 and Corollary1.1.17 pp.12-13.

<a id="abelianization-identification"></a>

### 29. Abelianized classes equal fundamental coinvariants

Prove `TauCeti.BunG.AbelianizationIdentification`. For p-adic E there is a canonical B_ab(G)≅π_1(G)_Γ under which B(G)→B_ab(G) is κ. In a maximal-torus model this is coker(B(Tsc)→B(T)), using H^2(W_E,Tsc(L^sep))=0 and the torus Kottwitz descriptions.

E is p-adic; L^sep denotes a separable algebraic closure of L=breve E (the overline of breve E in FS), with its natural W_E-action. Continuous Weil cohomology uses these discrete coefficient groups, not only L-rational points.

Use [Abelianized Kottwitz set](#abelianized-kottwitz-set); [Torus norm and Newton average](#torus-norm-description); [Newton and Kottwitz invariants](#newton-and-kottwitz-maps); `EndoscopicTransferAndUnitaryTraceComparison:ET.0`.

Apply the cohomology sequence for the two-term torus complex. Use local Weil-torus H^2 vanishing supplied by ET.0’s group-specific cohomology package. Identify the cokernel with the coroot quotient coinvariants.

Finite π_1 torsion survives the comparison.

Source: [Laurent Fargues, Peter Scholze, Geometrization of the local Langlands correspondence](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), LemmaIII.2.11 p.94.

<a id="rational-kottwitz-surjectivity"></a>

### 30. Rational Kottwitz images of centralizers

Prove `TauCeti.BunG.RationalKottwitzSurjectivity`. For the unramified Q_p model of Kisin17 Lemma4.6.4, the invariant map J_b(Q_p)→π_1(G)^Γ is surjective for every b. In the basic tame setting of vH24, the corresponding statement follows by inner-form compatibility with the rational quotient. The generic surjectivity G(E)→(π_1(G)_I)^σ is an import from existing upstream ReductiveGroupsPartII RG2.4.2/kottwitz-rational-surjectivity, not a new target here. Its target is Frobenius invariants in inertia coinvariants, distinct from π_1(G)_Γ.

Use Kisin17’s unramified reductive model over Z_p for the every-b statement. The separate basic tame application retains the p-adic parahoric hypotheses of vH24. No equal-characteristic rational-point extension is asserted.

Use [Algebraic sigma-centralizer](#sigma-centralizer-J-b); [Newton and Kottwitz invariants](#newton-and-kottwitz-maps); `tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory`; `EndoscopicTransferAndUnitaryTraceComparison:ET.0`; `ReductiveGroupsPartII:RG2.1`; `ReductiveGroupsPartII:RG2.4`.

Import RG2.4.2/kottwitz-rational-surjectivity for the generic rational-point quotient. BG proves only its compatibility with the centralizer invariant under the stated local hypotheses. Under Kisin’s unramified G hypothesis, use Kisin’s local abelianized H^0 comparison and Levi invariant surjection, with local simply connected H^1 vanishing supplied separately. Do not generalize the J_b target without the stated group hypotheses.

A ramified torus can have different invariant and coinvariant groups.

Source: [Robert Kottwitz, Isocrystals with additional structure II](https://people.dm.unipi.it/maffei/didattica/male/lacci/Kottwitz.pdf), Section7.7 pp.300-301. Background for the imported generic rational-point surjectivity, confined to the p-adic scope of §7.7; the new BG target is its centralizer application.

Source: [Mark Kisin, Mod p points on Shimura varieties of abelian type](https://people.math.harvard.edu/~kisin/dvifiles/lr.pdf?download=1), Lemma4.6.4 printed93.

Source: [Pol van Hoften, Mod p points on Shimura varieties of parahoric level](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/EC6F7AD8C8B489FEB8FC4D64485ABE1D/S2050508624000222a.pdf/mod_p_points_on_shimura_varieties_of_parahoric_level.pdf), Lemma3.4.2 pp.33–34 and Corollary3.4.6 proof p.37. Lemma3.4.2 has the tame Q_p/parahoric hypotheses and gives the rational quotient; the basic-class proof uses its compatibility with J_b.

<a id="component-kottwitz-coset"></a>

### 31. Component Kottwitz coset

Define `TauCeti.BunG.ComponentCoset`. For b∈G(L) and a bound μ with compatible full κ, let c_(b,μ)={x∈π_1(G)_I:(σ−1)x=tildeκ(μ(π))−tildeκ(b)}. Compatibility in π_1(G)_Γ makes this a nonempty affine coset under (π_1(G)_I)^σ. This is an affine set of components, with no distinguished origin before a choice.

Use [Newton and Kottwitz invariants](#newton-and-kottwitz-maps); [Acceptable classes B(G,{μ})](#admissible-pair).

Take the kernel/cokernel sequence of σ−1 on inertia coinvariants. Full κ equality says the difference lies in its image; a chosen solution identifies the fibre with the kernel.

The interface must support:

- `TauCeti.BunG.ComponentCoset.mem_iff`: A component x solves the stated difference equation.
- `TauCeti.BunG.ComponentCoset.nonempty`: The Γ-coinvariant compatibility is equivalent to nonemptiness.
- `TauCeti.BunG.ComponentCoset.translate`: Invariant classes act freely and transitively on the fibre.
- `TauCeti.BunG.ComponentCoset.liftZExtension`: Over a finite extension of Q_p, a z-extension and lifted b,μ give a surjective map of affine component cosets, using ZExtensionBoundedLifting with its p-adic scope.

**Checks.**

- `TauCeti.BunG.ComponentCoset.testIdentity`: For σ=id a nonempty coset requires difference0 and equals the entire lattice.
- `TauCeti.BunG.ComponentCoset.testSign`: On Z with σ=−id, the equation −2x=2 has unique solution x=−1.
- `TauCeti.BunG.ComponentCoset.testParity`: On the same lattice difference1 has no solution; its full coinvariant compatibility fails.

In GLX Lemma3.16(2), Transfers component indices before any ADLV connectivity theorem.

In Kisin17 component actions, Uses the rational-point Kottwitz map on the acting group.

The generic affine fibre is represented honestly in the suggested file.

Source: [Ian Gleason, Dong Gyu Lim, Yujie Xu, The connected components of affine Deligne-Lusztig varieties](https://link.springer.com/content/pdf/10.1007/s00222-025-01386-1.pdf), Section1.1 equations(1.3)-(1.4) p.807; Section2.2 p.818.

<a id="z-extension-bounded-lifting"></a>

### 32. Bounded lifting through a z-extension

Prove `TauCeti.BunG.ZExtensionBoundedLifting`. For E a finite extension of Q_p and a z-extension 1→Z→Gtilde→G→1 with induced torus Z, every cocharacter class μ lifts after choosing maximal tori. Given b∈B(G,{μ}) and a chosen lift μtilde, there is btilde∈B(Gtilde,{μtilde}) above b; the induced map of component cosets is surjective. Projection to the adjoint group gives B(G,{μ})≅B(Gad,{μad}) with the fixed central invariant.

The bounded-class, component-coset and adjoint acceptable-set conclusions are asserted in the p-adic scope of Kot97 §6.5 and GLX Lemma3.16. The generic z-extension definition is imported in its existing broader scope.

Use [Acceptable classes B(G,{μ})](#admissible-pair); [Component Kottwitz coset](#component-kottwitz-coset); [Rational Kottwitz images of centralizers](#rational-kottwitz-surjectivity); `tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory`; `ReductiveGroupsPartII:RG2.1`.

Lift μ using the exact cocharacter sequence of the induced torus. Use the adjoint acceptable-set bijection to choose btilde with the specified κ and Newton bound. Lift differences in the affine coset using invariant-lattice surjectivity and H^1(E,Z)=0.

An arbitrary central torus lacks the induced-torus cohomological vanishing used here.

Source: [Ian Gleason, Dong Gyu Lim, Yujie Xu, The connected components of affine Deligne-Lusztig varieties](https://link.springer.com/content/pdf/10.1007/s00222-025-01386-1.pdf), Lemma3.16 p.829.

Source: [Robert Kottwitz, Isocrystals with additional structure II](https://people.dm.unipi.it/maffei/didattica/male/lacci/Kottwitz.pdf), Section6.5 equation6.5.1 p.287.

<a id="connected-center-basic-inner-forms"></a>

### 33. Basic classes and adjoint torsors with connected center

Prove `TauCeti.BunG.ConnectedCenterBasicInnerForms`. If Z(G) is a connected torus, B(G)_basic→B(Gad)_basic≅H^1(E,Gad) is surjective. The map sends a basic class to the inner form J_b. The assertion does not assume this surjectivity for groups with disconnected center.

Use [Basic sigma class](#basic-class); [Algebraic sigma-centralizer](#sigma-centralizer-J-b); `tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory`; `EndoscopicTransferAndUnitaryTraceComparison:ET.0`.

Apply Kottwitz central-torus extension surjectivity to 1→Z(G)→G→Gad→1. Use its restriction to the basic subsets; for an adjoint group basic Newton is0 and basic classes identify with H^1.

For SL_n, the finite center prevents invoking this connected-torus proposition.

Source: [Robert Kottwitz, B(G) for all local and global fields](https://arxiv.org/pdf/1401.5728), Proposition10.4 printed50-51.

<a id="general-levi-newton-comparison"></a>

### 34. Newton comparison for a Levi representative

Prove `TauCeti.BunG.GeneralLeviNewtonComparison`. Let M_J be a σ-stable standard Levi of a quasi-split based local group G and let b_M∈M_J(L) map to b∈B(G). Its M_J-dominant Newton point ν_M is Weyl-conjugate to ν_G and ν_G−ν_M is a nonnegative rational sum of simple G-coroots. If κ_M(b_M)=κ_M(t^λσ(η)) in the situation of He §6.2, then λ◇−ν_M belongs to the rational span of the J-coroots. This comparison does not require b or b_M to be basic.

Use [Newton and Kottwitz invariants](#newton-and-kottwitz-maps); [Newton orbit space and rational dominance](#newton-orbit-space); `ReductiveGroupsPartII:RG2.1`; `ReductiveGroupsPartII:RG2.4`.

Newton functoriality identifies the geometric orbit; choose the dominant representatives in the two chambers. Use Weyl chamber dominance for the first difference and the fundamental-group projection for the J-coroot span conclusion.

The separate basic-Levi uniqueness theorem retains its basic hypothesis.

Source: [Xuhua He, Cordial elements and dimensions of affine Deligne-Lusztig varieties](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/5A27DBF48CAEF6DA56A313061848574C/S205050862100010Xa.pdf/cordial-elements-and-dimensions-of-affine-delignelusztig-varieties.pdf), Section6.2 p.13.

### Examples

In GL₂ the basic tuple (1/2,1/2) lies below (1,0), both with κ=1. The reverse comparison fails at the first partial sum. A rank-one tuple (1/2) is impossible because its reduced denominator does not divide its multiplicity. For a torus with Frobenius −1 on the integral lattice Z, the coinvariants are Z/2Z: classes 0 and 1 differ although rational averaging annihilates both.

### Dependencies

The local inputs come from BG0, BG2:uniformization. Each subsection names the direct target it consumes.

The external contracts are `DiamondsAndVStacks:D3`; `EndoscopicTransferAndUnitaryTraceComparison:ET.0`; `ReductiveGroupsPartII:RG2.1`; `ReductiveGroupsPartII:RG2.3`; `ReductiveGroupsPartII:RG2.4`; `VectorBundlesAndIsocrystals:VB0/dieudonne-manin-isocrystals`; `VectorBundlesAndIsocrystals:VB1/isocrystal-to-bundle-functor`; `mathlib:MonoidAlgebra.mapDomainBialgHom`; `mathlib:Representation.Coinvariants`; `mathlib:Representation.Coinvariants.map`; `tauceti:TauCeti.DiagonalizableGroup.finite_setOf_weightSpace_ne_bot`; `tauceti:TauCeti.DiagonalizableGroup.weightSpace`; `tauceti:TauCeti.MonoidAlgebra.mapDomainBialgHom_surjective`; `tauceti:TauCetiRoadmap/ReductiveGroups#layer-1-representations--comodules`; `tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory`. Their exact scope is specified above; the missing refinements below remain necessary.

## Layer 2: the bundle stack and uniformization

Construct the v-stack, classify its geometric points, and prove the structured Beauville–Laszlo surjectivity. Site and cohomological comparisons retain their coefficient and characteristic restrictions. The topology theorem uses the independent meromorphic and schematic comparison route.

<a id="curve-etale-base-site"></a>

### 1. Curve-to-base étale site morphism

Define `TauCeti.BunG.CurveEtaleBase`. For S∈Perf_k, define τ:(X_S)_et→S_et through (X_S)_et≅(X_S^diamond)_et≅(Div^1_S)_et and the projection Div^1×S→S. Equivalently τ* sends étale T/S to X_T/X_S. This is a site morphism; no geometric projection X_S→S is postulated.

Use `RelativeFarguesFontaine:RF2`; `DiamondsAndVStacks:D2`; `DiamondsAndVStacks:D3`; `DiamondsAndVStacks:D6/etale-site-comparison`.

Import the curve/divisor étale-site equivalences. Compose their inverse with the continuous functor induced by the divisor projection; check finite limits and cover preservation.

The interface must support:

- `TauCeti.BunG.CurveEtaleBase.pullback`: On an étale T→S, τ* is X_T→X_S.
- `TauCeti.BunG.CurveEtaleBase.baseChange`: The square for Sprime→S commutes up to the natural site equivalence.
- `TauCeti.BunG.CurveEtaleBase.pushforward`: Use the induced adjoint sheaf pushforward and derived pushforward.
- `TauCeti.BunG.CurveEtaleBase.constantComparison`: The structural E-map induces RΓ_et(Spa E,F)→Rτ*(F|X_S).

**Checks.**

- `TauCeti.BunG.CurveEtaleBase.testGeometric`: For geometric S, the comparison is the curve/local-field cohomology comparison.
- `TauCeti.BunG.CurveEtaleBase.testTrivialSheaf`: The zero finite sheaf has zero derived pushforward.
- `TauCeti.BunG.CurveEtaleBase.testCoproduct`: For T=S⊔S in S_et, τ*(T) is X_S⊔X_S over X_S, with the two inclusions preserved. This checks the actual inverse-image site functor.

In FS III.2.12, Computes derived pushforward of finite coefficients.

In FS III.2.13, Builds the sheaf of crossed-module curve classes.

The missing curve projection is precisely why this site construction is used.

Source: [Laurent Fargues, Peter Scholze, Geometrization of the local Langlands correspondence](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), III.2.4.2 p.94.

<a id="curve-torsion-cohomology"></a>

### 2. Constant torsion cohomology on the curve

Prove `TauCeti.BunG.CurveTorsionCohomology`. For p-adic E, S∈Perf_k and a locally constant finite abelian sheaf F on Spa(E)_et, Rτ*(F|X_S) is the constant complex RΓ_et(Spa E,F). For algebraically closed perfectoid C the comparison is an isomorphism in all degrees. Prime-to-p coefficients use Kummer and p coefficients use Artin–Schreier after tilting.

Use [Curve-to-base étale site morphism](#curve-etale-base-site); `DiamondEtaleCohomology:C1`; `RelativeFarguesFontaine:RF0:annuli`; `DiamondsAndVStacks:D6/etale-site-comparison`.

Apply proper base change along Div^1_S→S and reduce to geometric S. After tilting to equal characteristic, annihilate cohomology on finite separable extensions using Kummer or Artin–Schreier. Use Galois descent and the continuous direct limit over finite field extensions.

The argument is an actual cohomology computation, not a field in the definition of τ.

Source: [Laurent Fargues, Peter Scholze, Geometrization of the local Langlands correspondence](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), PropositionIII.2.12(i) pp.94-95.

<a id="bun-g-as-v-stack"></a>

### 3. Moduli v-stack Bun_G

Define `TauCeti.BunG.Bun`. For S∈Perf_k, Bun_G(S) is the groupoid of G-bundles on X_S, with pullback along perfectoid maps. Effective v-descent for vector bundles and the rational tensor description make it a v-stack. On affinoid S the algebraic and adic curve descriptions agree by GAGA. The moduli keeps bundle isomorphisms, rather than quotienting them out.

Use [G-bundles as exact tensor functors](#g-bundle); [Tannakian description of analytic torsors](#g-torsors-three-descriptions); `VectorBundlesAndIsocrystals:VB1/isocrystal-to-bundle-functor`; `DiamondsAndVStacks:D3`; `VectorBundlesAndIsocrystals:VB2:ampleness/gaga-equivalence`; `DiamondsAndVStacks:D4/small-v-sheaves-and-small-v-stacks`; `DiamondsAndVStacks:D0/groupoid-quotients-and-two-fibre-products`.

Apply v-descent for bundle evaluations and tensor constraints. Use GAGA on each affinoid curve to identify the scheme and adic torsor groupoids.

The interface must support:

- `TauCeti.BunG.Bun.objects`: Evaluate to the G-bundle groupoid on X_S.
- `TauCeti.BunG.Bun.pullback`: For T→S, the curve map X_T→X_S induces bundle pullback Bun_G(S)→Bun_G(T), with coherent identities and compositions.
- `TauCeti.BunG.Bun.ofIsocrystal`: An exact tensor G-isocrystal gives the constant bundle E_b on every X_S.
- `TauCeti.BunG.Bun.isomSheaf`: The diagonal fibre is the v-sheaf Isom of two G-bundles.
- `TauCeti.BunG.Bun.gaga`: For affinoid S compare algebraic and analytic curve torsor categories.
- `TauCeti.BunG.Bun.pullback_id`: Pullback of G-bundles along id_S is naturally tensor-isomorphic to the identity functor, with its unit coherence.
- `TauCeti.BunG.Bun.pullback_comp`: For U→T→S, pullback along the composite is naturally tensor-isomorphic to successive pullback, with the associativity coherence.

**Checks.**

- `TauCeti.BunG.Bun.testGLn`: For GL_n, objects are rank-n vector bundles with all bundle isomorphisms.
- `TauCeti.BunG.Bun.testTrivial`: For G=1, Bun_G is the terminal v-stack.
- `TauCeti.BunG.Bun.testNonbasicHom`: For GL_2 slopes0,1, bundle automorphisms include positive-slope sections, so the isocrystal-to-bundle functor is not fully faithful on the ungraded categories.

In FS ChaptersIII-V, Supplies the base of every uniformization and chart map.

In ES7 and IG.0, The actual moduli stack is imported; their extra arithmetic structures stay with those owners.

Pullback preserves the unit and composition coherences.

Source: [Laurent Fargues, Peter Scholze, Geometrization of the local Langlands correspondence](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), DefinitionIII.1.2 p.88.

<a id="bun-g-smallness"></a>

### 4. Smallness of Bun_G

Prove `TauCeti.BunG.BunGSmallness`. Bun_G is a small v-stack. For an ω_1-cofiltered inverse system of affinoid perfectoids with limit S, Bun_G(S) is the filtered colimit of the groupoids Bun_G(S_i), and its Isom sheaves have the same limit property. Hence bundles and arrows descend to topologically countably generated coefficient algebras, giving a set-sized cover.

Use [Moduli v-stack Bun_G](#bun-g-as-v-stack); `DiamondsAndVStacks:D3`; `VectorBundlesAndIsocrystals:VB2:ampleness/gaga-equivalence`; `RelativeFarguesFontaine:RF0:annuli`; `DiamondsAndVStacks:D4/small-v-sheaves-and-small-v-stacks`.

Descend Cauchy sequences and interval period-ring elements through the ω_1-cofiltered limit. Descend vector bundles, tensor data and arrows. Take the disjoint union over a set of countably generated perfectoid algebras and bundle objects.

A claim of an arbitrary filtered-limit equivalence would be stronger than the source.

Source: [Laurent Fargues, Peter Scholze, Geometrization of the local Langlands correspondence](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), PropositionIII.1.3 pp.88-89.

<a id="points-are-B-of-G"></a>

### 5. Geometric classification of G-bundles

Prove `TauCeti.BunG.PointsAreBOfG`. For complete algebraically closed nonarchimedean C/k, b↦E_b gives a bijection B(G)→Bun_G(C)/≅ and consequently B(G)≅|Bun_G|. The slope grading identifies isocrystals with HN-graded bundles; positive-slope H^1 vanishing splits the filtered tensor functor. It does not identify the ungraded groupoids or all their morphisms.

Use [Moduli v-stack Bun_G](#bun-g-as-v-stack); [Kottwitz set B(G)](#sigma-conjugacy-quotient); `VectorBundlesAndIsocrystals:VB0/dieudonne-manin-isocrystals`; `VectorBundlesAndIsocrystals:VB1/isocrystal-to-bundle-functor`; `VectorBundlesAndIsocrystals:VB2:classification`; `VectorBundlesAndIsocrystals:VB4/relative-HN-filtration-and-proetale-splitting`; `VectorBundlesAndIsocrystals:VB3:general-BC/families-of-banach-colmez-spaces`; `tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory`; `VectorBundlesAndIsocrystals:VB4/relative-cohomology-vanishing`.

Lift the bundle tensor functor canonically to HN-filtered bundles; verify exactness, including the equal-characteristic argument of Ans19. Identify the graded slope category with Isoc_E via VB2 and VB0. The torsor of tensor splittings is unipotent with positive vector-bundle graded pieces; H^1 vanishing trivializes it. Use the geometric-point equivalence relation for small v-stacks to identify |Bun_G|.

GL_n recovers the vector-bundle slope multiset; positive Hom spaces remain in the ungraded bundle category.

Source: [Laurent Fargues, Peter Scholze, Geometrization of the local Langlands correspondence](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), TheoremIII.2.2 pp.89-90.

Source: [Johannes Anschütz, Reductive group schemes over the Fargues-Fontaine curve](https://arxiv.org/pdf/1703.00700), Theorem3.11 and proof pp.14-16.

<a id="hn-sign-and-semicontinuity"></a>

### 6. HN sign and semicontinuity

Prove `TauCeti.BunG.HnSignAndSemicontinuity`. For E_b, its bundle HN class is ν_b*=w_0(−ν_b) and c_1(E_b)=−κ(b). The HN class ν* on |Bun_G| is upper semicontinuous: specialization can increase the upper-concave HN polygon. Detect the reductive order on rational representations using RR96 Lemma2.2 and VB4 relative semicontinuity.

Use [Geometric classification of G-bundles](#points-are-B-of-G); [Representations detect Newton dominance](#representation-detects-dominance); `VectorBundlesAndIsocrystals:VB4/semicontinuity-of-HN-polygon`; `VectorBundlesAndIsocrystals:VB1/isocrystal-to-bundle-functor`.

Apply the linear slope sign convention under each representation. Use RR96’s representation criterion to pass from the vector-bundle HN polygons to the reductive class.

For b=π^m in G_m, E_b=O(−m), fixing both the Newton and degree signs.

Source: [Laurent Fargues, Peter Scholze, Geometrization of the local Langlands correspondence](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), TheoremIII.2.3 and preceding paragraph p.91.

<a id="strictly-disconnected-torsors"></a>

### 7. Pro-étale torsors on strictly disconnected bases

Prove `TauCeti.BunG.StrictlyDisconnectedTorsors`. Every pro-étale H-torsor on a strictly totally disconnected perfectoid S is trivial when H is a first-countable locally profinite group. Such torsors on arbitrary S are represented by perfectoid spaces as the inverse limit over compact open subgroups. First countability supplies the countable nested system used to choose compatible sections.

Use `DiamondsAndVStacks:D2`; `DiamondsAndVStacks:D3`; `DiamondsAndVStacks:D1/strictly-totally-disconnected`; `DiamondsAndVStacks:D1/universally-open-std-cover`; `DiamondsAndVStacks:D3/locally-profinite-torsors`.

Reduce to a compact open subgroup after splitting the étale quotient cover. Choose a countable cofinal system of open normal subgroups and compatible sections of the finite étale quotients. Use separated étale descent and the perfectoid inverse-limit construction.

A generic torsor on an arbitrary perfectoid base need not be globally trivial.

Source: [Laurent Fargues, Peter Scholze, Geometrization of the local Langlands correspondence](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), RemarkIII.2.5 and LemmaIII.2.6 p.92.

<a id="geometrically-trivial-locus"></a>

### 8. Geometrically trivial open locus

Prove `TauCeti.BunG.GeometricallyTrivialLocus`. Bun_G^1 is open and [*/G(E)]→Bun_G^1 is an equivalence, where G(E) has its locally profinite topology and torsors are pro-étale. Prove openness before κ-local-constancy: on strictly disconnected bases the ν=0 locus yields E-local systems; their continuous fibre functor is a reductive torsor over C^0(π_0S,E), whose triviality is open by henselian local rings.

Use [HN sign and semicontinuity](#hn-sign-and-semicontinuity); [Pro-étale torsors on strictly disconnected bases](#strictly-disconnected-torsors); `VectorBundlesAndIsocrystals:VB4`; `tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory`; `DiamondsAndVStacks:D3`; `VectorBundlesAndIsocrystals:VB4/slope-zero-local-systems`.

Use VB4’s equivalence of geometrically trivial bundles with E-local systems. On a strictly disconnected base trivialize each local system, preserving its tensor structure. Henselian continuity makes triviality of the fibre-functor torsor an open condition. Identify the automorphism sheaf of the trivial bundle with the constant locally profinite G(E) sheaf.

The entire ν=0 locus can contain nontrivial torsion κ; it is not automatically Bun_G^1.

Source: [Laurent Fargues, Peter Scholze, Geometrization of the local Langlands correspondence](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), TheoremIII.2.4 pp.91-92.

<a id="diagonalizable-curve-cohomology"></a>

### 9. Diagonalizable Weil–curve comparison

Prove `TauCeti.BunG.DiagonalizableCurveCohomology`. For p-adic E and diagonalizable D/E, the pro-étale sheaf associated to T/S↦H^1_et(X_T,D) is constant with value H^1(W_E,D(L^sep)). For algebraically closed perfectoid C, H^i(W_E,D(L^sep))≅H^i_et(X_C,D), 0≤i≤2. The natural map comes from the curve étale site to discrete W_E-sets. Use 1→D^0→D→π_0(D)→1 and retain all finite component contributions.

E is p-adic; L^sep denotes a separable algebraic closure of L=breve E (the overline of breve E in FS), with its natural W_E-action. Continuous Weil cohomology uses these discrete coefficient groups, not only L-rational points.

Use [Constant torsion cohomology on the curve](#curve-torsion-cohomology); [Geometrically trivial open locus](#geometrically-trivial-locus); [Torus norm and Newton average](#torus-norm-description); `EndoscopicTransferAndUnitaryTraceComparison:ET.0`.

For tori apply geometric classification and translate the neutral fibre using the Picard stack. Use torsion comparison for finite π_0(D), which is étale in characteristic0. Use the Weil-torus H^2 vanishing and compare the long exact sequences through degree2.

Do not silently apply this proof to μ_p in equal characteristic.

For E=Q_p with p odd, μ_p(L)={1}, while μ_p(L^sep) has p elements with its natural nontrivial inertia action. The coefficient functor must retain this action.

Source: [Laurent Fargues, Peter Scholze, Geometrization of the local Langlands correspondence](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), PropositionIII.2.12(ii), comparison morphism and RemarkIII.2.14 pp.94-97.

<a id="crossed-module-curve-classes"></a>

### 10. Constant crossed-module curve classes

Prove `TauCeti.BunG.CrossedModuleCurveClasses`. For p-adic E, the pro-étale sheaf associated to T/S↦H^1_et(X_T,[Gsc→G]) is constant with value B_ab(G). The comparison identifies the curve abelianization of a bundle with its κ class.

Use [Abelianized classes equal fundamental coinvariants](#abelianization-identification); [Diagonalizable Weil–curve comparison](#diagonalizable-curve-cohomology); `EndoscopicTransferAndUnitaryTraceComparison:ET.0`.

Use the homotopy-equivalent center complex [Zsc→Z]. Apply diagonalizable comparisons in degrees1 and2 to its long exact sequence. Compare the curve and Weil abelianization maps; this is the second, p-adic-only proof of κ-local-constancy.

The first uniformization proof of κ-local-constancy remains independent of this second comparison proof.

Source: [Laurent Fargues, Peter Scholze, Geometrization of the local Langlands correspondence](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), PropositionIII.2.13 p.96.

<a id="grassmannian-point-lifting"></a>

### 11. Grassmannian point lifting

Prove `TauCeti.BunG.GrassmannianPointLifting`. For strictly totally disconnected S=Spa(R,R+) over Spa(E) and s∈S, Gr_G(R)→Gr_G(K(s)) is surjective. Split G after a finite field extension embedded in R, use the Cartan decomposition, and lift G(B_dR^+(K(s))) through successive nilpotent thickenings by smoothness and Lie algebra surjectivity.

Use `GeometricSatakeAndFusion:GS0:loop-geometry/schubert-bounds-and-properness`; `ReductiveGroupsPartII:RG2.4`; `DiamondsAndVStacks:D2`; `RelativeFarguesFontaine:RF2:untilts`; `DiamondsAndVStacks:D1/strictly-totally-disconnected`; `DiamondsAndVStacks:D1/universally-open-std-cover`.

Use the clopen-component argument to get R→K(s) surjective. Lift group points using henselian smooth lifting. Lift the positive period-ring points by the complete filtration and successive Lie corrections.

This supplies relative lifting from the fixed-point uniformization theorem.

Source: [Laurent Fargues, Peter Scholze, Geometrization of the local Langlands correspondence](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), LemmaIII.3.2 p.98.

<a id="beauville-laszlo-surjectivity"></a>

### 12. Beauville–Laszlo uniformization

Prove `TauCeti.BunG.BeauvilleLaszloSurjectivity`. The modification map BL:Gr_G→Bun_G is a surjection of pro-étale stacks and hence of v-stacks. Over a geometric point and a chosen untilt, every G-bundle can be modified at its untilt point to a trivial bundle. Relatively, lift that modification on a strictly disconnected base and use the geometrically trivial open locus to trivialize it near the given point.

Use `RelativeFarguesFontaine:RF4:G-torsors/modification-of-G-bundle-by-lattice`; [Geometrically trivial open locus](#geometrically-trivial-locus); [Grassmannian point lifting](#grassmannian-point-lifting); [Geometric classification of G-bundles](#points-are-B-of-G); [Pro-étale torsors on strictly disconnected bases](#strictly-disconnected-torsors); `tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory`.

Apply Anschütz’s geometric-point modification theorem for arbitrary connected reductive G. Lift the modification by the Grassmannian point-lifting lemma. On its open trivial locus split the locally profinite torsor and choose a trivialization. Descend the local modifications along the pro-étale cover.

RF4:G-torsors owns patching and the map; BG2 owns this surjectivity argument.

Source: [Laurent Fargues, Peter Scholze, Geometrization of the local Langlands correspondence](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), PropositionIII.3.1 p.98.

Source: [Johannes Anschütz, Reductive group schemes over the Fargues-Fontaine curve](https://arxiv.org/pdf/1703.00700), Theorem6.5 p.30.

<a id="central-torus-grassmannian-surjectivity"></a>

### 13. Central-torus Grassmannian surjectivity

Prove `TauCeti.BunG.CentralTorusGrassmannianSurjectivity`. For a central extension Gtilde→G with torus kernel Z, Gr_Gtilde→Gr_G is surjective as a v-sheaf. After a finite splitting extension, lift the dominant cocharacter through the split torus lattice sequence. The corresponding map of bounded Schubert closures is surjective on geometric points and quasicompact, hence a v-cover. Generic Schubert bounds and properness are imported from GS0.

Use `GeometricSatakeAndFusion:GS0:loop-geometry/schubert-bounds-and-properness`; `GeometricSatakeAndFusion:GS0:Schubert-smoothness/open-cell-stabilizer-and-smoothness`; `tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory`.

Pass v-locally to a finite splitting extension and lift the dominant cocharacter through the exact split torus lattice sequence. On a geometric point with complete algebraically closed coefficient field C, the split torus kernel has H¹(B_dR(C),Z)=0 by Hilbert 90. Lift the group point and use the Cartan decomposition to obtain a lift in the specified bounded Schubert closure. The source Schubert closure is quasicompact and the target quasiseparated over Spd(E), because both are proper. The geometrically surjective bounded map is therefore a quasicompact v-cover. Use the Schubert exhaustion to cover the full Grassmannian.

Unlike rational-point z-extension lifting, this geometric statement needs a torus kernel but not an induced torus.

Source: [Laurent Fargues, Peter Scholze, Geometrization of the local Langlands correspondence](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), LemmaIII.3.5 p.99.

<a id="central-torus-bundle-surjectivity"></a>

### 14. Central-torus bundle surjectivity

Prove `TauCeti.BunG.CentralTorusBundleSurjectivity`. For a central extension Gtilde→G with torus kernel Z, Bun_Gtilde→Bun_G is a v-surjection. Bun_Z acts by central tensor product and Bun_G is its quotient stack; the action is a quasi-torsor before surjectivity is proved.

Use [Beauville–Laszlo uniformization](#beauville-laszlo-surjectivity); [Central-torus Grassmannian surjectivity](#central-torus-grassmannian-surjectivity); [Structure group and tensor descent](#structure-group-and-tensor-descent); `DiamondsAndVStacks:D3`.

Lift a bundle to a Grassmannian point by BL, then lift that point along the central-torus map. Identify its ambiguity with a Z-bundle via the contracted product and descend.

No circular use of κ-local-constancy is made in this proof.

Source: [Laurent Fargues, Peter Scholze, Geometrization of the local Langlands correspondence](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), LemmaIII.2.10 and proof afterIII.3.5 pp.93,99.

<a id="semicontinuity-and-local-constancy"></a>

### 15. Local constancy of bundle Kottwitz invariant

Prove `TauCeti.BunG.SemicontinuityAndLocalConstancy`. κ:|Bun_G|→π_1(G)_Γ is locally constant, with the discrete topology on its integral target. Together with HN semicontinuity this makes |Bun_G|→B(G) continuous for the Newton-order topology. The proof for every local E uses central-torus bundle surjectivity, z-extensions and induced tori; the crossed-module proof is a second proof for p-adic E.

Use [Central-torus bundle surjectivity](#central-torus-bundle-surjectivity); [HN sign and semicontinuity](#hn-sign-and-semicontinuity); [Newton and Kottwitz invariants](#newton-and-kottwitz-maps); `tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory`; `ReductiveGroupsPartII:RG2.1`.

Reduce by a z-extension to simply connected derived group, then to G/Gder. Resolve that torus by an induced torus and use central-torus bundle surjectivity. For induced tori integral κ is torsion-free and determined by ν; the torus order is equality, so semicontinuity implies local constancy.

The norm-one torus torsion classes show why directly using ν for all tori fails.

Source: [Laurent Fargues, Peter Scholze, Geometrization of the local Langlands correspondence](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), TheoremIII.2.7 and first proof pp.92-93.

<a id="grassmannian-kottwitz-sign"></a>

### 16. Grassmannian components and Kottwitz sign

Prove `TauCeti.BunG.GrassmannianKottwitzSign`. For split G, GS0’s decomposition Gr_G=∐_(α∈π_1G) Gr_G^α has each component a filtered union of proper Schubert closures with [μ]=α. On the modification map, κ(BL(x))=−α. For nonsplit G, use geometric π_1 with Galois descent and then its Γ-coinvariant image in Bun_G. A component decomposition alone does not prove uniformization or bundle connectedness.

Use `GeometricSatakeAndFusion:GS0:loop-geometry/schubert-bounds-and-properness`; `RelativeFarguesFontaine:RF4:G-torsors/modification-of-G-bundle-by-lattice`; [Newton and Kottwitz invariants](#newton-and-kottwitz-maps); [Local constancy of bundle Kottwitz invariant](#semicontinuity-and-local-constancy).

Import the geometric connected-component theorem, its Schubert exhaustion and the nonsplit descent from GS0. Evaluate on a cocharacter modification to fix the minus sign. Use locally constant κ and connected Schubert pieces to extend the equality.

For G_m, the lattice ξ^m produces O(m) with κ=−m under the fixed BL convention.

Source: [Laurent Fargues, Peter Scholze, Geometrization of the local Langlands correspondence](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), PropositionIII.3.6(ii)-(iii) pp.99-100.

Source: [Xinwen Zhu, Affine Grassmannians and the geometric Satake in mixed characteristic](https://annals.math.princeton.edu/wp-content/uploads/annals-v185-n2-p02-p.pdf), Proposition1.21 p.427.

<a id="newton-topology-homeomorphism"></a>

### 17. Newton topology theorem in both characteristics

Prove `TauCeti.BunG.NewtonTopologyHomeomorphism`. For every nonarchimedean local field E and connected reductive G/E, the geometric-class bijection |Bun_G|→B(G) is a homeomorphism for the topology whose closed subsets are upward closed in the fixed-κ Newton order. Equivalently, [b]≤[bprime] iff E_bprime lies in the closure of E_b. Mixed characteristic follows from Viehmann. In equal characteristic, combine the schematic closure theorem with the schematic/analytic topology comparison of Gleason–Ivanov–Zillinger; the comparison alone does not identify geometric specialization with the combinatorial order.

E is a nonarchimedean local field of either characteristic, with finite residue field; G/E is connected reductive, with no quasi-split or unramified hypothesis.

Use GIZ26 arXiv v3: its §2 and Remark2.1 allow both characteristics. He16 §2.5 restricts the schematic closure discussion to equal characteristic; use Vie21 for the mixed-characteristic route.

Use [Geometric classification of G-bundles](#points-are-B-of-G); [Local constancy of bundle Kottwitz invariant](#semicontinuity-and-local-constancy); [Newton partial order with Kottwitz fibre](#partial-order-on-B-of-G); [Isocrystal-family v-descent and strata](#isocrystal-family-v-descent); [Straight Weyl comparison with B(G)](#straight-weyl-classification); `ReductiveGroupsPartII:RG2.4`; `VectorBundlesAndIsocrystals:VB4`.

Use geometric point classification and HN semicontinuity to obtain the continuous bijection with the stated reversed specialization convention. In mixed characteristic, use Vie21 Theorem1.1 with its finite-Q_p-extension hypothesis. In equal characteristic, He16 Theorems1.29 and2.12 identify the schematic specialization order with equal integral κ and Newton dominance. Import the straight-class and affine-Bruhat proof inputs through RG2.4, retaining inertia torsion. GIZ26 Lemma7.17 reduces continuity to finite bounded loci and specialization chains. Its Theorem7.18 identifies schematic and analytic isocrystal specialization and reverses Bun_G specialization. Use the rank-one specialization construction in the proof of GIZ26 Theorem7.18 pp.51–52: pass to a product comb, apply Proposition2.17 p.11 to make the closed-locus ideal principal, and cut a valuation-ring component around the resulting nonzero nonunit. Proposition2.17 itself asserts the Bezout property, not the rank-one realization theorem. Theorem3.16 pp.16–17 identifies the v-descent limit over Spd(Vhat,Vhat) with bundles on Y_(0,infinity]; it does not assert unrestricted extension of arbitrary open-period-space bundles. Use the separate PR24 Proposition2.1.3 and FS II.2.14 classification inputs on this schematic-family-induced boundary bundle. Use Theorem7.13 on products of geometric points for the reverse implication. These inputs remain G04/G06 obligations.

The basic point is more general than unstable points with the same κ.

Source: [Ian Gleason, Alexander B. Ivanov, Felix Zillinger, Meromorphic vector bundles on the Fargues–Fontaine curve](https://arxiv.org/pdf/2307.00887v3), §2 and Remark2.1 pp.6–7; Proposition2.17 p.11; Remark3.15/Theorem3.16 pp.16–17; §7.3, Lemma7.17 and Theorem7.18 with rank-one construction pp.50–53. The recorded v3 permits both characteristics and compares schematic/analytic specialization with reversed bundle specialization; identifying this with the κ/ν order also needs the schematic closure theorem.

Source: [Xuhua He, Hecke algebras and p-adic groups](https://arxiv.org/pdf/1511.01386v3), §1.10.5, Theorem1.29 pp.20–21; §§2.2 and2.4–2.6 pp.22,25–28, Theorem2.12 p.28. The straight-class order is equality of integral κ plus Newton dominance; the schematic closure theorem is used within the equal-characteristic restriction of §2.5.

Source: [Eva Viehmann, On Newton strata in the B_dR^+-Grassmannian](https://arxiv.org/pdf/2101.07510), Theorem1.1 and topology convention p.2. Supplies the mixed-characteristic case, for E a finite extension of Q_p.

Source: [Laurent Fargues, Peter Scholze, Geometrization of the local Langlands correspondence](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), ConjectureIII.2.15 p.97. Records the original general-field topology assertion; the theorem is supplied by the later sources, not this conjecture.

<a id="modification-newton-bound"></a>

### 18. Newton bound for a modification

Prove `TauCeti.BunG.ModificationNewtonBound`. For G/Q_p and any geometric cocharacter class μ, a geometric point of Gr_(G,μ) modifying the trivial bundle determines b∈B(G,{μ^−1}). For GL_n the bundle Newton tuple is dominated by its relative-position tuple with matching total degree; translate through ν_bundle=w_0(−ν_isocrystal). The full κ equality is μ^−1♯.

Use `RelativeFarguesFontaine:RF4:G-torsors/modification-of-G-bundle-by-lattice`; [Geometric classification of G-bundles](#points-are-B-of-G); [HN sign and semicontinuity](#hn-sign-and-semicontinuity); [Acceptable classes B(G,{μ})](#admissible-pair); [Representations detect Newton dominance](#representation-detects-dominance); `GeometricSatakeAndFusion:GS0:loop-geometry/schubert-bounds-and-properness`.

For GL_n use exterior powers to reduce to a bound on the first slope and determinant degree. Compute the determinant line modification to establish the equality of totals. Use RR96’s representation criterion for G and the component-sign comparison for κ.

The inverse Hodge class is essential in the CS convention.

Source: [Ana Caraiani, Peter Scholze, On the generic part of the cohomology of compact unitary Shimura varieties](https://annals.math.princeton.edu/wp-content/uploads/annals-v186-n3-p01-p.pdf), Proposition3.5.3 and Lemma3.5.4 pp.687-689.

<a id="minuscule-modification-image"></a>

### 19. Minuscule modification image

Prove `TauCeti.BunG.MinusculeModificationImage`. For minuscule μ over Q_p, the map from the flag variety Fℓ_(G,μ)≅Gr_(G,μ) to B(G,{μ^−1}) is surjective on geometric classes. This is stronger than the invariant containment for all μ and uses the Rapoport existence result recalled by CS17 Remark3.5.8.

Use [Newton bound for a modification](#modification-newton-bound); `GeometricSatakeAndFusion:GS0:Schubert-smoothness/open-cell-stabilizer-and-smoothness`; [Acceptable classes B(G,{μ})](#admissible-pair).

Use the minuscule flag/Grassmannian identification supplied by GS0. Apply Rapoport PropositionA.9 for every acceptable class; its original proof is an explicit gap, not inferred from containment.

A nonempty acceptable index set alone does not produce a flag point.

Source: [Ana Caraiani, Peter Scholze, On the generic part of the cohomology of compact unitary Shimura varieties](https://annals.math.princeton.edu/wp-content/uploads/annals-v186-n3-p01-p.pdf), Remark3.5.8 p.689.

<a id="de-rham-quotient-group-class"></a>

### 20. Class from a de Rham quotient-group lattice

Prove `TauCeti.BunG.DeRhamQuotientGroupClass`. In Liu–Zhu Corollary4.9, the tensor functor has domain Rep_(Q_p)(G^c), where G^c=G/Z_G^s. At a classical point embedded into C_p, its de Rham comparison defines compatible B_dR^+ lattices. The Fargues tensor modification construction therefore gives a class in B(G^c_(Q_p)). Producing a class in B(G_(Q_p)) requires a chosen compatible lift or additional G-level tensor data. No canonical lift is claimed.

Use [Tannakian description of analytic torsors](#g-torsors-three-descriptions); `RelativeFarguesFontaine:RF4:G-torsors/modification-of-G-bundle-by-lattice`; [Geometric classification of G-bundles](#points-are-B-of-G); [Central-torus bundle surjectivity](#central-torus-bundle-surjectivity).

Apply de Rham comparison at the point in every rational G^c representation. Use the exact tensor lattice-to-bundle functor from RF4 and classify the resulting curve bundle. Retain the correct coefficient group; central-torus v-surjectivity is local existence and supplies no canonical G-level lift.

The coefficient group remains G^c throughout this construction.

Source: [Ruochuan Liu, Xinwen Zhu, Rigidity and a Riemann-Hilbert correspondence for p-adic local systems](https://arxiv.org/pdf/1602.06282v3), Corollary4.9 and Remark4.1(iii) pp.33-34.

### Examples

A modification of the trivial bundle in the minuscule GL₂ component of κ=1 has either split slopes (1,0) or basic slopes (1/2,1/2), in the arithmetic isocrystal convention. Passing to bundles reverses and reorders slopes. The basic point generalizes to the split point; it is the split point that lies in the closure of the basic point. The Grassmannian component sign must be converted before using this example.

### Dependencies

The local inputs come from BG0, BG1. Each subsection names the direct target it consumes.

The external contracts are `DiamondEtaleCohomology:C1`; `DiamondsAndVStacks:D0/groupoid-quotients-and-two-fibre-products`; `DiamondsAndVStacks:D1/strictly-totally-disconnected`; `DiamondsAndVStacks:D1/universally-open-std-cover`; `DiamondsAndVStacks:D2`; `DiamondsAndVStacks:D3`; `DiamondsAndVStacks:D3/locally-profinite-torsors`; `DiamondsAndVStacks:D4/small-v-sheaves-and-small-v-stacks`; `DiamondsAndVStacks:D6/etale-site-comparison`; `EndoscopicTransferAndUnitaryTraceComparison:ET.0`; `GeometricSatakeAndFusion:GS0:Schubert-smoothness/open-cell-stabilizer-and-smoothness`; `GeometricSatakeAndFusion:GS0:loop-geometry/schubert-bounds-and-properness`; `ReductiveGroupsPartII:RG2.1`; `ReductiveGroupsPartII:RG2.4`; `RelativeFarguesFontaine:RF0:annuli`; `RelativeFarguesFontaine:RF2`; `RelativeFarguesFontaine:RF2:untilts`; `RelativeFarguesFontaine:RF4:G-torsors/modification-of-G-bundle-by-lattice`; `VectorBundlesAndIsocrystals:VB0/dieudonne-manin-isocrystals`; `VectorBundlesAndIsocrystals:VB1/isocrystal-to-bundle-functor`; `VectorBundlesAndIsocrystals:VB2:ampleness/gaga-equivalence`; `VectorBundlesAndIsocrystals:VB2:classification`; `VectorBundlesAndIsocrystals:VB3:general-BC/families-of-banach-colmez-spaces`; `VectorBundlesAndIsocrystals:VB4`; `VectorBundlesAndIsocrystals:VB4/relative-HN-filtration-and-proetale-splitting`; `VectorBundlesAndIsocrystals:VB4/relative-cohomology-vanishing`; `VectorBundlesAndIsocrystals:VB4/semicontinuity-of-HN-polygon`; `VectorBundlesAndIsocrystals:VB4/slope-zero-local-systems`; `tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory`. Their exact scope is specified above; the missing refinements below remain necessary.

## Layer 3: automorphisms and Newton strata

First split the HN-graded description, then compare the full automorphism v-group with its algebraic quotient. Recover the classifying-stack stratum, its negative dimension, and the bounded flag pullbacks.

<a id="hn-graded-g-bundles"></a>

### 1. HN-graded G-bundles

Define `TauCeti.BunG.HNGraded`. Bun_G^(HN-split)(S) consists of exact rational tensor functors into Q-graded bundles on X_S with weight-λ piece everywhere semistable of bundle slope λ. For b, use the slope-reversed grading of E_b. Forgetting the grading lands in Bun_G. The graded automorphism group scheme is the constant curve group J_b×X_S.

Use [Moduli v-stack Bun_G](#bun-g-as-v-stack); `VectorBundlesAndIsocrystals:VB1/isocrystal-to-bundle-functor`; `VectorBundlesAndIsocrystals:VB4/relative-HN-filtration-and-proetale-splitting`; [Algebraic sigma-centralizer](#sigma-centralizer-J-b).

Use the tensor-compatible HN graded category, keeping the bundle slope sign. Identify its automorphism group from the slope-centralizer of the isocrystal.

The interface must support:

- `TauCeti.BunG.HNGraded.forget`: Forget grading to Bun_G.
- `TauCeti.BunG.HNGraded.ofClass`: E_b has its canonical Q-grading from the isocrystal, with slope reversal.
- `TauCeti.BunG.HNGraded.automorphisms`: At a geometric point, graded automorphisms of E_b^gr are J_b(E). Over S, the automorphism v-sheaf is the constant locally profinite group sheaf J_b(E), with sections given by continuous maps |S|→J_b(E).
- `TauCeti.BunG.HNGraded.classifying`: Bun_G^(HN-split)≃∐_(b∈B(G))[*/J_b(E)]. This equivalence uses HNGradedClassification.

**Checks.**

- `TauCeti.BunG.HNGraded.testGL2`: For O⊕O(1), graded automorphisms are E××E×.
- `TauCeti.BunG.HNGraded.testBasic`: For a basic object no positive grading-changing kernel occurs.
- `TauCeti.BunG.HNGraded.testUngraded`: For O⊕O(1), ungraded automorphisms also contain BC(O(1)), which grading removes.

In FS III.5.1, Gives the projection of full automorphisms to the discrete centralizer.

In FS V.3.3, Defines the chart’s associated-graded map.

Weights refer to bundle slopes, not the original isocrystal slopes.

Source: [Laurent Fargues, Peter Scholze, Geometrization of the local Langlands correspondence](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), PropositionIII.4.7 pp.102-103.

<a id="hn-graded-classification"></a>

### 2. Classification of HN-graded bundles

Prove `TauCeti.BunG.HnGradedClassification`. The natural map ∐_b[*/J_b(E)]→Bun_G^(HN-split) is an equivalence. The graded fibre is locally isomorphic to E_b^gr and its Isom torsor is a J_b-bundle geometrically trivial at the chosen point; openness and locally profinite torsor triviality make it locally constant.

Use [HN-graded G-bundles](#hn-graded-g-bundles); [Geometrically trivial open locus](#geometrically-trivial-locus); [Pro-étale torsors on strictly disconnected bases](#strictly-disconnected-torsors); `VectorBundlesAndIsocrystals:VB4/relative-HN-filtration-and-proetale-splitting`; `VectorBundlesAndIsocrystals:VB4/slope-zero-local-systems`; `VectorBundlesAndIsocrystals:VB4/relative-cohomology-vanishing`.

Use local constancy of the filtration type and relative HN graded semistability. Apply the trivial-locus theorem to the J_b Isom torsor. Descend the local objects with their graded automorphisms.

This is an equivalence of graded groupoids, stronger than geometric point classification.

Source: [Laurent Fargues, Peter Scholze, Geometrization of the local Langlands correspondence](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), PropositionIII.4.7 pp.102-103.

<a id="filtered-automorphism-group-scheme"></a>

### 3. Filtered torsor automorphism group schemes

Define `TauCeti.BunG.FilteredAutomorphism`. For a reductive G/K, scheme X/K and Q-filtered G-fibre functor E, let H=Aut_G(E), its inner group over X. For λ≥0, H^≥λ consists of automorphisms whose difference from1 raises every represented filtration by at least λ. H^≥0 is parabolic with unipotent radical H^>0; the groups are smooth, Lie H^≥λ=(ad E)^≥λ, and for λ>0 the quotient H^≥λ/H^>λ is the vector group (ad E)^≥λ/(ad E)^>λ.

The underlying functor is an exact K-linear tensor fibre functor for finite rational representations of a reductive G/K, associated to a G-torsor on X.

The descending Q-filtration is exhaustive, separated and locally has finitely many jumps on each representation; its steps are subbundles with locally free graded pieces, and it is exact and tensor-compatible.

Splitting is asserted on affine open charts, followed by étale trivialization of the smooth underlying torsor; no global splitting over an arbitrary scheme is assumed.

Use [Pure inner twisting of torsors](#pure-inner-twisting); `tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory`; `tauceti:TauCetiRoadmap/ReductiveGroups#layer-1-representations--comodules`; `tauceti:TauCeti.Cocharacter.parabolic`; `tauceti:TauCeti.Cocharacter.leviGroupExtension`; `tauceti:TauCeti.FGPointRepresentationCat`; `tauceti:TauCeti.FGPointRepresentationCat.instRigidCategory`.

On an affine chart, choose a tensor generator and clear its finitely many rational weight denominators. Exact tensor generation extends the same denominator to all representations. Rescale to a Z-filtration; a chosen threshold λ can be included in the denominator. The underlying automorphism group is an inner form of reductive G, hence smooth. Zie15 Theorem1.3/4.15 therefore splits the filtration on that chart, rather than merely after an fpqc cover. Trivialize the G-torsor étale locally. The splitting is then a rational cocharacter D→G. Apply the relative cocharacter/root-weight calculation from the group owner to represent the filtration-preserving parabolic, its positive radical and the higher raising subgroups. Their Lie algebras are the corresponding filtered adjoint subbundles. At λ>0, the map g↦g−1 on associated gradeds is additive: the product error raises the filtration by 2λ>λ. Zie15 Proposition4.24 and Lemma4.25 give the vector-group quotient after rescaling; its Lie bundle identifies it with gr^λ(ad E). At λ=0 retain the reductive Levi quotient instead. Descend the represented closed subgroup schemes and their Lie/graded identifications along the étale charts, compatibly with arbitrary scheme pullback. The generic relative representability and rational-cocharacter calculation are the RG layer7/G02 supplier refinement; native field point subgroups alone do not prove them.

The interface must support:

- `TauCeti.BunG.FilteredAutomorphism.raising_iff`: For every rational representation and λprime, (γ−1)E^≥λprime⊂E^≥(λprime+λ).
- `TauCeti.BunG.FilteredAutomorphism.parabolic`: H^≥0 is the filtration-preserving parabolic.
- `TauCeti.BunG.FilteredAutomorphism.unipotent`: H^>0 is its unipotent radical.
- `TauCeti.BunG.FilteredAutomorphism.graded`: For λ>0 the quotient is the stated additive vector group.
- `TauCeti.BunG.FilteredAutomorphism.pullback`: Scheme pullback commutes with H, its filtration and vector-group quotients.
- `TauCeti.BunG.FilteredAutomorphism.localSplit`: There is an affine open cover on which the filtered fibre functor splits; after an étale trivialization of its underlying torsor the splitting is a rational cocharacter D→G. This assertion is compatible with restriction and does not assert a global splitting on X.

**Checks.**

- `TauCeti.BunG.FilteredAutomorphism.testGL2`: For the two-step diagonal filtration the parabolic is triangular and the positive radical has one root line.
- `TauCeti.BunG.FilteredAutomorphism.testTrivialFiltration`: For the trivial filtration H^≥0=H and H^>0=1.
- `TauCeti.BunG.FilteredAutomorphism.testZeroWeight`: At λ=0 the reductive Levi quotient is not generally an additive vector group.
- `TauCeti.BunG.FilteredAutomorphism.testRationalJump`: For GL_2 with ordered basis of weights 0,3/2, H^≥0 is lower triangular and H^>0 is its one-dimensional lower unipotent radical. H^≥1/H^>1 is trivial, H^≥(3/2)/H^>(3/2) is G_a, and H^≥2 is trivial. Clearing denominator2 preserves these thresholds.
- `TauCeti.BunG.FilteredAutomorphism.testNonAffine`: On P^1_K, the Euler filtration 0→O(−1)→O^2→O(1)→0 defines a filtered GL_2 fibre functor with smooth underlying group, but no global splitting: O^2 is not O(−1)⊕O(1). It splits on affine opens. Thus the affine hypothesis cannot be dropped.

In FS III.5.1, The global sections give the full automorphism filtration.

In FS V.3.5, The opposite filtration gives the extension tower in the chart.

A field of point-subgroup data alone cannot represent this relative group scheme.

Do not replace the affine smooth-group splitting input by the general fpqc splitting theorem, or infer a global splitting on non-affine X.

Source: [Laurent Fargues, Peter Scholze, Geometrization of the local Langlands correspondence](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), PropositionIII.5.2 p.105.

Source: [Paul Ziegler, Graded and filtered fiber functors on Tannakian categories](https://arxiv.org/pdf/1111.1981v4), Theorem1.3 p.2; §4.3, Theorems4.14–4.16 pp.24–25 and Proposition4.24/Lemma4.25/Theorem4.26 pp.26–27. Supplies the affine smooth-group splitting and positive filtered vector-quotient argument for Z-filtrations. The finite-generator denominator reduction to Q-filtrations is stated explicitly in the proof outline.

<a id="full-automorphism-v-group"></a>

### 4. Full bundle automorphism v-group

Define `TauCeti.BunG.FullAutomorphism`. For b, tildeJ_b(S)=Aut_(X_S)(E_b). Every automorphism preserves HN; its action on the associated graded gives a split exact sequence 1→tildeJ_b^>0→tildeJ_b→J_b(E)→1, with tildeJ_b=tildeJ_b^>0⋊J_b(E). For positive bundle slope λ the graded quotient is BC((ad E_b)^λ); it corresponds to the isocrystal slope −λ. The connected kernel is generally nonzero for nonbasic b.

Use [Classification of HN-graded bundles](#hn-graded-classification); [Filtered torsor automorphism group schemes](#filtered-automorphism-group-scheme); `VectorBundlesAndIsocrystals:VB3:general-BC/families-of-banach-colmez-spaces`; `VectorBundlesAndIsocrystals:VB4/relative-HN-filtration-and-proetale-splitting`; [Algebraic sigma-centralizer](#sigma-centralizer-J-b); `VectorBundlesAndIsocrystals:VB4/slope-zero-local-systems`; `VectorBundlesAndIsocrystals:VB4/relative-cohomology-vanishing`; `DiamondsAndVStacks:D5/relative-representability`.

Take global sections of the filtered relative automorphism group. Use H^1 vanishing of positive bundle pieces to make the quotient maps surjective. The canonical graded isocrystal action splits the projection; identify π_0 with J_b(E).

The interface must support:

- `TauCeti.BunG.FullAutomorphism.projection`: Return the action on the HN graded object in J_b(E).
- `TauCeti.BunG.FullAutomorphism.section`: The isocrystal automorphism action splits the projection.
- `TauCeti.BunG.FullAutomorphism.kernel`: Kernel consists of strictly HN-raising automorphisms.
- `TauCeti.BunG.FullAutomorphism.graded`: For λ>0, the filtration quotient is BC of the bundle-slope λ adjoint piece.
- `TauCeti.BunG.FullAutomorphism.semidirect`: Identify tildeJ_b with its positive kernel semidirect J_b(E).

**Checks.**

- `TauCeti.BunG.FullAutomorphism.testGL2`: Aut(O⊕O(1)) consists of invertible triangular matrices with diagonal E× and upper entry BC(O(1)).
- `TauCeti.BunG.FullAutomorphism.testBasic`: For basic b all adjoint slopes are0, so the positive kernel is trivial.
- `TauCeti.BunG.FullAutomorphism.testAlgebraicJ`: For the nonbasic example J_b(E)=E××E× alone misses the upper triangular sections.

In FS III.5.3 and IV.1.22, Defines the true stratum stabilizer and its dimension.

In VS4, Supplies the geometric kernel only; sheaf-category invariance is owned by VS4.

The GL_2 O⊕O(1) kernel is BC(O(1)).

Source: [Laurent Fargues, Peter Scholze, Geometrization of the local Langlands correspondence](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), PropositionIII.5.1 pp.104-105.

<a id="positive-automorphism-kernel"></a>

### 5. Positive automorphism kernel geometry

Prove `TauCeti.BunG.PositiveAutomorphismKernel`. tildeJ_b^>0 is a successive extension of positive Banach–Colmez spaces, represented by a locally spatial diamond. For ℓ≠p it is cohomologically smooth of dimension sum_(λ>0) λ·rank((ad E_b)^λ)=<2ρ,ν_b>. Its connectedness identifies π_0 tildeJ_b=J_b(E). All dimensions use the isocrystal dominant ν_b with the slope reversal already incorporated.

Use [Full bundle automorphism v-group](#full-automorphism-v-group); `VectorBundlesAndIsocrystals:VB3:general-BC/families-of-banach-colmez-spaces`; `VStackSheavesAndLisseCategories:VS0`; `ReductiveGroupsPartII:RG2.1`; `VectorBundlesAndIsocrystals:VB3:general-BC/positive-range-dimension`; `DiamondsAndVStacks:D5/relative-representability`.

Induct over the finite positive filtration and use BC positive-slope smoothness, connectedness and H^1 vanishing. Apply additivity of ℓ-dimension to the extension tower. Compute the positive adjoint root weights as the 2ρ pairing.

For O⊕O(1), the kernel dimension is1; its quotient classifying stack has dimension−1.

Source: [Laurent Fargues, Peter Scholze, Geometrization of the local Langlands correspondence](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), PropositionIII.5.1 pp.104-105.

<a id="quasi-split-opposite-parabolic"></a>

### 6. Quasi-split opposite-parabolic automorphisms

Prove `TauCeti.BunG.QuasiSplitOppositeParabolic`. For quasi-split G and a dominant rational ν_b, M_b=Z_G(ν_b), P_b^− is the parabolic with nonpositive ν_b weights. The curve group Q=E_(b_M)×^(M_b)P_b^− has tildeJ_b(S)=Q(X_S) and positive kernel Γ(X_S,R_uQ). The opposite sign reflects the slope-reversing isocrystal-to-bundle functor.

Use [Full bundle automorphism v-group](#full-automorphism-v-group); [Rational Newton representative](#rational-newton-witness); `tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory`; `VectorBundlesAndIsocrystals:VB1/isocrystal-to-bundle-functor`.

Use the rational Newton representative to put b in its Levi. Identify the HN-preserving inner parabolic with the twist of P_b^−. Take curve sections and compare its unipotent root bundles with the positive HN pieces.

For GL_2 O⊕O(1), the positive section is the O(1) upper entry.

Source: [Laurent Fargues, Peter Scholze, Geometrization of the local Langlands correspondence](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), III.5.1.1 pp.105-106.

<a id="semistable-locus-and-basic-strata"></a>

### 7. Semistable locus and basic strata

Define `TauCeti.BunG.Semistable`. Bun_G^ss is the full substack where every geometric fibre has central Newton morphism. It is open; κ decomposes it into open and closed basic strata and Bun_G^ss≃∐_(b basic)[*/J_b(E)]. Each basic stratum is neutralized by its chosen E_b; the locally profinite topology on J_b(E) is retained.

Use [Basic sigma class](#basic-class); [Local constancy of bundle Kottwitz invariant](#semicontinuity-and-local-constancy); [Geometrically trivial open locus](#geometrically-trivial-locus); [Basic inner form equivalence](#basic-inner-form-bundle-equivalence).

Centrality is a minimality condition and hence an open HN locus. Use the basic κ bijection to decompose it into its discrete classes. Apply basic inner twisting to the geometrically trivial locus in Bun_(J_b).

The interface must support:

- `TauCeti.BunG.Semistable.mem_iff`: Every geometric Newton class is basic.
- `TauCeti.BunG.Semistable.openImmersion`: The inclusion Bun_G^ss→Bun_G is open.
- `TauCeti.BunG.Semistable.basicDecomposition`: Decompose as the disjoint union of basic rational-point classifying stacks.
- `TauCeti.BunG.Semistable.component`: The κ index identifies the basic summand.

**Checks.**

- `TauCeti.BunG.Semistable.testGL2Half`: The bundle of the basic slope1/2 block is semistable of bundle slope−1/2.
- `TauCeti.BunG.Semistable.testTorus`: For a torus Bun_T is entirely semistable.
- `TauCeti.BunG.Semistable.testUnstable`: O⊕O(1) is not semistable.

In FS III.4 and IV.1.23, Provides basic points in each connected component.

In CS17 basic flag stratum, Pullback of the designated basic summand is the admissible open locus.

Basic does not imply isomorphism to the trivial G-bundle.

Source: [Laurent Fargues, Peter Scholze, Geometrization of the local Langlands correspondence](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), TheoremIII.4.5 p.102.

<a id="torus-picard-stack"></a>

### 8. Torus bundle Picard stack

Define `TauCeti.BunG.TorusPicard`. For a torus T, Bun_T is a Picard stack fitting into 0→[*/T(E)]→Bun_T→X_*(T)_Γ→0. Every κ-fibre is a T(E)-banded gerbe neutralized by a choice of representative b of its class. A multiplicative splitting exists when a group section of T(L)→B(T) is chosen, for example when B(T) is torsion-free. It is not asserted canonically for a torus with torsion coinvariants.

Use [Semistable locus and basic strata](#semistable-locus-and-basic-strata); [Torus norm and Newton average](#torus-norm-description); `DiamondsAndVStacks:D3`.

Use contracted product of commuting torus torsors for the Picard operation. Identify the neutral fibre and other fibres by translation with E_b. A group section gives coherent multiplicative neutralizations; without it retain the extension.

The interface must support:

- `TauCeti.BunG.TorusPicard.tensor`: Contracted product adds the κ classes.
- `TauCeti.BunG.TorusPicard.kottwitz`: Bun_T→X_*(T)_Γ is a Picard-stack morphism.
- `TauCeti.BunG.TorusPicard.fibre`: A chosen b of κ=β neutralizes the fibre as [*/T(E)].
- `TauCeti.BunG.TorusPicard.splitOfSection`: A group section of T(L)→B(T) gives the Picard product decomposition.

**Checks.**

- `TauCeti.BunG.TorusPicard.testGm`: Line bundles form ∐_(d∈Z)[*/E×], with tensor product adding degrees.
- `TauCeti.BunG.TorusPicard.testTrivial`: The trivial torus has the terminal Picard stack.
- `TauCeti.BunG.TorusPicard.testTorsion`: For the norm-one torus, the two κ fibres do not by themselves specify a canonical multiplicative splitting.

In FS III.2.12 torus case, Translate the neutral fibre for the cohomology comparison.

In FS III.4.6, Explains the noncanonical gerbe neutralization.

A set-wise neutralization of each fibre is weaker than a Picard splitting.

Source: [Laurent Fargues, Peter Scholze, Geometrization of the local Langlands correspondence](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), ExampleIII.4.6 p.102.

<a id="stratum-is-classifying-stack"></a>

### 9. Full classifying-stack description of a stratum

Prove `TauCeti.BunG.StratumIsClassifyingStack`. For every b, Bun_G^b is the locally closed full substack of bundles geometrically isomorphic to E_b and Bun_G^b≃[*/tildeJ_b]. The map to [*/J_b(E)] has the canonical section induced by the semidirect splitting. For basic b the kernel vanishes; for nonbasic b it must be retained.

Use [HN sign and semicontinuity](#hn-sign-and-semicontinuity); [Local constancy of bundle Kottwitz invariant](#semicontinuity-and-local-constancy); [Full bundle automorphism v-group](#full-automorphism-v-group); [Classification of HN-graded bundles](#hn-graded-classification); `VectorBundlesAndIsocrystals:VB4/relative-HN-filtration-and-proetale-splitting`; `VectorBundlesAndIsocrystals:VB3:general-BC/families-of-banach-colmez-spaces`; `DiamondsAndVStacks:D3`.

Constant HN type gives a relative filtered tensor functor. Use the graded classification to trivialize its graded Isom torsor locally. Positive filtered H^1 vanishing lifts a graded isomorphism to a filtered one. Thus *→Bun_G^b is a v-surjection whose relation is exactly tildeJ_b.

A positive-dimensional stabilizer changes both the stratum geometry and its dimension.

Source: [Laurent Fargues, Peter Scholze, Geometrization of the local Langlands correspondence](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), PropositionIII.5.3 p.106.

<a id="automorphism-torsor-reduction"></a>

### 10. Reduction of full automorphism torsors

Prove `TauCeti.BunG.AutomorphismTorsorReduction`. Over affinoid perfectoid S, every tildeJ_b-torsor is induced from a J_b(E)-torsor and is representable in locally spatial diamonds; the reduction follows from H^1_v vanishing for the positive Banach–Colmez graded pieces. This is an existence of reduction, not a canonical equivalence of all torsor groupoids.

Use [Full bundle automorphism v-group](#full-automorphism-v-group); `VectorBundlesAndIsocrystals:VB3:general-BC/families-of-banach-colmez-spaces`; [Pro-étale torsors on strictly disconnected bases](#strictly-disconnected-torsors); `DiamondsAndVStacks:D3`; `VectorBundlesAndIsocrystals:VB4/slope-zero-local-systems`.

Reduce successive positive extensions using affinoid v-H^1 vanishing. Apply perfectoid representability of locally profinite torsors.

Different reductions can have positive-kernel automorphisms; do not collapse them.

Source: [Laurent Fargues, Peter Scholze, Geometrization of the local Langlands correspondence](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), RemarkIII.5.4 p.106.

<a id="stratum-dimension"></a>

### 11. Cohomological dimension of Newton strata

Prove `TauCeti.BunG.StratumDimension`. For ℓ≠p, Bun_G^b is a cohomologically smooth Artin v-stack of ℓ-dimension −<2ρ,ν_b>. The fibre over [*/J_b(E)] has the smooth cover * of relative dimension <2ρ,ν_b>; the rational-point classifying stack has dimension0.

Use [Full classifying-stack description of a stratum](#stratum-is-classifying-stack); [Positive automorphism kernel geometry](#positive-automorphism-kernel); `VStackSheavesAndLisseCategories:VS0`.

Use the full kernel and its positive BC filtration to compute the dimension of the relative classifying stack. Add the dimension0 of [*/J_b(E)] from VS0’s locally profinite classifying-stack theorem.

The O⊕O(1) stratum has dimension−1 despite its algebraic J_b being a torus.

Source: [Laurent Fargues, Peter Scholze, Geometrization of the local Langlands correspondence](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), PropositionIV.1.22 p.113.

<a id="flag-newton-strata"></a>

### 12. Newton strata of a minuscule flag variety

Define `TauCeti.BunG.FlagNewton`. For G/Q_p, minuscule μ and its reflex field E_μ, let Fℓ_(G,μ) be the adic/diamond flag variety and E(x) the modification of the trivial G-bundle at the untilt. Define Fℓ_(G,μ)^b as its fibre over Bun_G^b. The point map is independent of algebraically closed residue-field extension, is constant along rank-one generalization, and has image B(G,{μ^−1}).

Use [Minuscule modification image](#minuscule-modification-image); [Full classifying-stack description of a stratum](#stratum-is-classifying-stack); `GeometricSatakeAndFusion:GS0:Schubert-smoothness/open-cell-stabilizer-and-smoothness`; `DiamondsAndVStacks:D4`.

Pull back the locally closed full bundle strata along the minuscule BL map. Check geometric-base independence using geometric bundle classification. Use the adic rank-one generalization compatibility of the modification construction.

The interface must support:

- `TauCeti.BunG.FlagNewton.classAt`: Map a flag point to its bundle sigma class.
- `TauCeti.BunG.FlagNewton.stratum`: Take the locally closed fibre over Bun_G^b.
- `TauCeti.BunG.FlagNewton.upperUnion`: For b define the union over bprime≥b.
- `TauCeti.BunG.FlagNewton.acceptableImage`: The image equals B(G,{μ^−1}).
- `TauCeti.BunG.FlagNewton.baseChange`: Pullback along algebraically closed field extension preserves class and strata.

**Checks.**

- `TauCeti.BunG.FlagNewton.testGL2`: For split GL_2 μ=(1,0), the inverse-bound ordinary stratum has slopes0,−1 and the basic stratum slopes−1/2,−1/2.
- `TauCeti.BunG.FlagNewton.testCentral`: A central minuscule μ gives a zero-dimensional flag variety with its single acceptable class.
- `TauCeti.BunG.FlagNewton.testSign`: Using B(G,{μ}) instead of B(G,{μ^−1}) gives the wrong κ for the same CS modification.

In CS17 Theorem1.11, Provides locally closed strata and the basic open locus.

In CS24 Theorem2.7.3 and IG.3-IG.7, Provides the flag indexing used by the Igusa geometry.

The definition uses the actual flag moduli, supplied by GS0.

Source: [Ana Caraiani, Peter Scholze, On the generic part of the cohomology of compact unitary Shimura varieties](https://annals.math.princeton.edu/wp-content/uploads/annals-v186-n3-p01-p.pdf), Definition3.5.6 pp.689-690.

<a id="flag-strata-semicontinuity"></a>

### 13. Closed upper flag Newton unions

Prove `TauCeti.BunG.FlagStrataSemicontinuity`. The flag Newton strata are locally closed and partially proper, their upper unions Fℓ^≥b are closed, and the basic stratum is open. The bundle HN polygon is upper semicontinuous under specialization, with κ fixed by μ^−1. CS17 Proposition3.5.7 prints lower semicontinuity; the retained E03 correction uses the upper-polygon and closed-upper-union convention.

Use [Newton strata of a minuscule flag variety](#flag-newton-strata); [HN sign and semicontinuity](#hn-sign-and-semicontinuity); [Finiteness and the basic acceptable member](#admissible-finiteness-and-basic); `DiamondsAndVStacks:D4`.

Pull back HN semicontinuity and the constant κ bound. Use the finite acceptable indexing set and representation inequalities to identify the closed upper unions. Partial properness follows from the flag diamond and the fixed-class locally closed condition in the source’s adic sense.

No general dimension formula is asserted for every reductive minuscule flag datum.

Source: [Ana Caraiani, Peter Scholze, On the generic part of the cohomology of compact unitary Shimura varieties](https://annals.math.princeton.edu/wp-content/uploads/annals-v186-n3-p01-p.pdf), Proposition3.5.7 and Corollary3.5.9 pp.689-690.

<a id="unitary-flag-stratum-dimension"></a>

### 14. Unitary flag Newton dimensions

Prove `TauCeti.BunG.UnitaryFlagStratumDimension`. For the CS24 Section2.1 quasi-split unitary similitude datum on F^(2n) with its standard skew-hermitian form, self-dual O_F-lattice and signatures(n,n), at p unramified in F, let d=n²[F+:Q]. Its flag strata have Krull dimension d−d_b, where d_b=<2ρ,ν_b> is IG.0’s dimension of the corresponding Igusa variety. This is the specific unitary dimension statement of Theorem2.7.3, not a general dimension formula deduced solely from upper semicontinuity.

Use [Closed upper flag Newton unions](#flag-strata-semicontinuity); [Cohomological dimension of Newton strata](#stratum-dimension); `IgusaVarietiesAndTorsionConcentration:IG.0`; `GeometricSatakeAndFusion:GS0:Schubert-smoothness/open-cell-stabilizer-and-smoothness`.

Identify the PEL p-divisible-group Newton index with the BL bundle index, retaining μ inverse. Import the unitary local deformation and Igusa dimension calculation from IG.0. Apply the CS17/CS24 local period-fibre calculation to transfer the codimension to the flag stratum; the general relative-dimension-to-Krull comparison requires the stated datum and remains a proof-interior expansion.

The dimensions concern |Fℓ^b|, not the negative ℓ-dimension of Bun_G^b.

Source: [Ana Caraiani, Peter Scholze, On the generic part of the cohomology of non-compact unitary Shimura varieties](https://arxiv.org/pdf/1909.01898v2), Section2.1 pp.11-12 and Theorem2.7.3 p.33.

<a id="unitary-ordinary-flag-locus"></a>

### 15. Unitary ordinary flag locus

Prove `TauCeti.BunG.UnitaryOrdinaryFlagLocus`. In the preceding unramified quasi-split CS24 unitary similitude datum, the reflex field is Q and the largest acceptable element is ordinary. Its flag stratum is Fℓ(Q_p), interpreted as the constant locally profinite rational-point diamond; hence its Krull dimension is0. The read original arguments identify the split/unramified cocharacter calculation and ambient Siegel rational-period criterion. Transport to this unramified unitary datum remains the exact PEL comparison in G07; the read CGH preprint assumes p splits completely.

Use [Unitary flag Newton dimensions](#unitary-flag-stratum-dimension); [Ordinary Newton class](#ordinary-class); `IgusaVarietiesAndTorsionConcentration:IG.0`; `ReductiveGroupsPartII:RG2.3`; `DiamondsAndVStacks:D4`.

Use the rational reflex cocharacter and BG1’s ordinary-class theorem. Wed99 Theorem1.6.3 pp.584–585 and §§2.3.1–2.3.2 pp.588–589 compute the split and unramified unitary averages; in the balanced inert unitary case the signature is half the height, so the average has only ordinary slopes. The full Shimura density theorem is not needed to identify the maximum B-class. In the ambient Siegel datum, Sch15 Lemma3.3.6 and Remark3.3.7 pp.1006–1007 identify rank-one ordinary points by Q_p-rational Hodge–Tate filtration: the kernel of the integral Hodge–Tate map is the Tate module of the maximal multiplicative subgroup, so rationality forces its maximal possible rank. Specializations and the neighborhood argument of Lemmas3.3.15/3.3.19 pass to arbitrary adic points. CGH20 arXiv v2 Proposition3.3.2 p.31 restricts this criterion through the closed PEL flag immersion into the Siegel flag and the corresponding forgetful moduli map. This is the actual locator in the read version; the Proposition3.3.8 cited by CS24 is not used as an unread proof. Verify the same local closed-flag and Hodge–Tate compatibility for the CS24 unramified unitary datum through IG.0. Do not import CGH20’s globally split-p hypothesis as a theorem for all unramified p. Identify the sub-v-sheaf, not only its C-valued points, with the locally profinite rational-point diamond Fℓ(Q_p). D4 then gives Krull dimension0. The datum-specific comparison and full diamond signature remain G07/G08.

The corresponding basic flag stratum is the open one; ordinary is the maximum index, not the basic index.

Source: [Ana Caraiani, Peter Scholze, On the generic part of the cohomology of non-compact unitary Shimura varieties](https://arxiv.org/pdf/1909.01898v2), AfterTheorem2.7.3 p.33.

Source: [Torsten Wedhorn, Ordinariness in good reductions of Shimura varieties of PEL-type](https://www.numdam.org/article/ASENS_1999_4_32_5_575_0.pdf), Theorem1.6.3 pp.584–585; §§2.3.1–2.3.2 pp.588–589. Ordinary/reflex-field criterion and the explicit split/balanced unramified unitary cocharacter calculation; no new expansion of the global density proof.

Source: [Ana Caraiani, Daniel R. Gulotta, Chi-Yun Hsu, Christian Johansson, Lucia Mocz, Emanuel Reinecke, Sheng-Chi Shih, Shimura varieties at level Gamma_1(p^infinity) and Galois representations](https://arxiv.org/pdf/1804.00136v2), arXiv1804.00136v2 Proposition3.3.2 pp.30–31. Ordinary Hodge–Tate preimage via the closed PEL/Siegel flag comparison. The source assumes completely split p; the broader unramified transport is explicitly separate.

Source: [Peter Scholze, On torsion in the cohomology of locally symmetric varieties](https://annals.math.princeton.edu/wp-content/uploads/annals-v182-n3-p03-p.pdf), Lemma3.3.6 and Remark3.3.7 pp.1006–1007; Lemmas3.3.15/3.3.19 pp.1011/1013. Ambient Siegel ordinary/rational Hodge–Tate criterion, including the direct multiplicative-subgroup argument and the extension to non-rank-one adic points.

### Examples

For O⊕O(1), the full automorphism group has positive kernel BC(O(1)), while J_b(E)=E××E× only records the graded automorphisms. The kernel has dimension 1 and the stratum dimension is −1. For G_m² every Newton morphism is central; weights 0 and 1 on the sum of two characters still give a basic class. Thus basicness tests adjoint weights, not equality of all representation weights.

### Dependencies

The local inputs come from BG0, BG1, BG2:uniformization. Each subsection names the direct target it consumes.

The external contracts are `DiamondsAndVStacks:D3`; `DiamondsAndVStacks:D4`; `DiamondsAndVStacks:D5/relative-representability`; `GeometricSatakeAndFusion:GS0:Schubert-smoothness/open-cell-stabilizer-and-smoothness`; `IgusaVarietiesAndTorsionConcentration:IG.0`; `ReductiveGroupsPartII:RG2.1`; `ReductiveGroupsPartII:RG2.3`; `VStackSheavesAndLisseCategories:VS0`; `VectorBundlesAndIsocrystals:VB1/isocrystal-to-bundle-functor`; `VectorBundlesAndIsocrystals:VB3:general-BC/families-of-banach-colmez-spaces`; `VectorBundlesAndIsocrystals:VB3:general-BC/positive-range-dimension`; `VectorBundlesAndIsocrystals:VB4/relative-HN-filtration-and-proetale-splitting`; `VectorBundlesAndIsocrystals:VB4/relative-cohomology-vanishing`; `VectorBundlesAndIsocrystals:VB4/slope-zero-local-systems`; `tauceti:TauCeti.Cocharacter.leviGroupExtension`; `tauceti:TauCeti.Cocharacter.parabolic`; `tauceti:TauCeti.FGPointRepresentationCat`; `tauceti:TauCeti.FGPointRepresentationCat.instRigidCategory`; `tauceti:TauCetiRoadmap/ReductiveGroups#layer-1-representations--comodules`; `tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory`. Their exact scope is specified above; the missing refinements below remain necessary.

## Completion of Layer 2: the whole smooth Artin stack

Use the uniformization atlas and Schubert-cell smoothness for the whole-stack assertion. The connected-component theorem additionally uses the basic strata and stratum dimensions established in Layer 3; it does not feed those arguments.

<a id="isom-sheaf-representability"></a>

### 1. Locally spatial Isom diagonal

Prove `TauCeti.BunG.IsomSheafRepresentability`. For G-bundles E1,E2 over X_S, Isom_G(E1,E2) is a locally spatial diamond over S. For vector bundles the surjection locus and isomorphism locus are open subdiamonds of BC(E1∨⊗E2). For general reductive G, a Chevalley faithful representation with its stabilizer line presents Isom_G as finite closed compatibility conditions inside products of these linear Isom diamonds.

Use [Moduli v-stack Bun_G](#bun-g-as-v-stack); `VectorBundlesAndIsocrystals:VB3:general-BC/families-of-banach-colmez-spaces`; `tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory`; `tauceti:TauCetiRoadmap/ReductiveGroups#layer-1-representations--comodules`; `DiamondsAndVStacks:D4`; `DiamondsAndVStacks:D5/relative-representability`.

For a linear map the support of the cokernel is closed and has closed image in S; surjectivity is its open complement. Isomorphisms require both a map and its dual to be surjective. Apply the actual rational Chevalley stabilizer presentation and stability of locally spatial diamonds under finite limits.

The faithful representation includes its defining tensor constraints; arbitrary GL_n isomorphisms need not preserve G.

Source: [Laurent Fargues, Peter Scholze, Geometrization of the local Langlands correspondence](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), LemmaIV.1.20 and proof ofIV.1.19 pp.112-113.

<a id="bun-g-is-smooth-artin"></a>

### 2. Cohomological smoothness of Bun_G

Prove `TauCeti.BunG.BunGIsSmoothArtin`. For ℓ≠p, Bun_G is an ℓ-cohomologically smooth Artin v-stack of ℓ-dimension0. The disjoint union over Galois cocharacter orbits of [G(E)\Gr_(G,μbar)] maps to Bun_G by a separated cohomologically smooth surjection. These are open Schubert cells, not their generally singular closures.

Use [Smallness of Bun_G](#bun-g-smallness); [Beauville–Laszlo uniformization](#beauville-laszlo-surjectivity); [Geometrically trivial open locus](#geometrically-trivial-locus); [Locally spatial Isom diagonal](#isom-sheaf-representability); `GeometricSatakeAndFusion:GS0:Schubert-smoothness/open-cell-stabilizer-and-smoothness`; `VStackSheavesAndLisseCategories:VS0`.

The diagonal is locally spatial by the Isom theorem. After an untilt, each fibre is the open locus of fixed-relative-position modifications that are geometrically trivial. Use GS0 open-cell cohomological smoothness, and independent BL uniformization for surjectivity. The source quotient is smooth over [*/G(E)] with dimension<2ρ,μ>, and the map has the same relative dimension; subtract them to obtain dimension0. Import VS0 Artin descent, separatedness and locally profinite classifying-stack charts; no GS4, VS1 or VS4 is used.

For infinite locally profinite G(E), *→[*/G(E)] is not used as a cohomologically smooth atlas.

Source: [Laurent Fargues, Peter Scholze, Geometrization of the local Langlands correspondence](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), TheoremIV.1.19 pp.112-113.

<a id="connected-components"></a>

### 3. Connected components of Bun_G

Prove `TauCeti.BunG.ConnectedComponents`. κ induces π_0(Bun_G)≅π_1(G)_Γ. Every nonempty open substack contains a basic point: restrict to a finite T_0 Newton region, take an open point, and compare the whole-stack dimension0 with the stratum dimension −<2ρ,ν_b> to force central ν_b.

Use [Local constancy of bundle Kottwitz invariant](#semicontinuity-and-local-constancy); [Cohomological smoothness of Bun_G](#bun-g-is-smooth-artin); [Cohomological dimension of Newton strata](#stratum-dimension); [Semistable locus and basic strata](#semistable-locus-and-basic-strata); [Kottwitz classification by both invariants](#classification-by-two-invariants); `VStackSheavesAndLisseCategories:VS0`.

Use the finite T_0 open-point lemma with the discrete κ coordinate. An open stratum has the ambient dimension0, so its positive-root pairing vanishes and b is basic. The basic κ bijection makes each fibre connected; two disjoint nonempty open pieces would each have to contain its unique basic point.

Torsion components such as split PGL_n’s Z/n are included.

Source: [Laurent Fargues, Peter Scholze, Geometrization of the local Langlands correspondence](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), CorollaryIV.1.23 and LemmaIV.1.24 pp.113-114.

### Examples

For a torus there are no positive adjoint directions. Its components are indexed by the integral coinvariant lattice, and each stratum is the classifying stack of its locally profinite rational-point group. Replacing this lattice by its rationalization would incorrectly merge components in the presence of torsion.

### Dependencies

The local inputs come from BG1, BG2:uniformization, BG3. Each subsection names the direct target it consumes.

The external contracts are `DiamondsAndVStacks:D4`; `DiamondsAndVStacks:D5/relative-representability`; `GeometricSatakeAndFusion:GS0:Schubert-smoothness/open-cell-stabilizer-and-smoothness`; `VStackSheavesAndLisseCategories:VS0`; `VectorBundlesAndIsocrystals:VB3:general-BC/families-of-banach-colmez-spaces`; `tauceti:TauCetiRoadmap/ReductiveGroups#layer-1-representations--comodules`; `tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory`. Their exact scope is specified above; the missing refinements below remain necessary.

## Layer 4: filtered charts and specialization

Use the increasing opposite filtration, rather than the decreasing HN filtration. Graded framing exposes negative-slope extension spaces. Their relative geometry, contracting action and positive tangent bundles give the smooth charts and their exact open images.

<a id="filtered-bundle-chart"></a>

### 1. Opposite filtered-bundle chart

Define `TauCeti.BunG.FilteredChart`. M(S) consists of G-bundles E on X_S with an increasing, separated and exhaustive Q-filtration on every rational representation, exact and tensor-compatible, whose weight-λ graded piece is semistable of bundle slope λ. This is opposite to the decreasing HN filtration. The associated graded map to Bun_G^(HN-split) decomposes M=∐_b M_b and gives q_b:M_b→[*/J_b(E)] and π_b:M_b→Bun_G.

Use [Moduli v-stack Bun_G](#bun-g-as-v-stack); [Classification of HN-graded bundles](#hn-graded-classification); `VectorBundlesAndIsocrystals:VB4/relative-HN-filtration-and-proetale-splitting`; `DiamondsAndVStacks:D3`.

Form filtered tensor objects with coherent pullback; v-descent follows from bundle/filtration descent. Take the semistable graded condition and use the graded classification to define the components.

The interface must support:

- `TauCeti.BunG.FilteredChart.graded`: q_b records the graded J_b(E)-torsor.
- `TauCeti.BunG.FilteredChart.forget`: π_b forgets the filtration.
- `TauCeti.BunG.FilteredChart.split`: A graded object gives the split filtered chart section.
- `TauCeti.BunG.FilteredChart.pullback`: Pullback preserves filtration subbundles, exactness and graded slopes.
- `TauCeti.BunG.FilteredChart.gradedFraming`: tildeM_b=M_b×_[*/J_b(E)]* is the chart with a graded trivialization.

**Checks.**

- `TauCeti.BunG.FilteredChart.testGL2Extension`: For graded O and O(1), objects are 0→O→E→O(1)→0 and the framed chart is BC(O(−1)[1]).
- `TauCeti.BunG.FilteredChart.testBasic`: For basic b the adjoint Newton slopes are all zero, the opposite unipotent group is trivial, and M_b=[*/J_b(E)]. For G=G_m×G_m, a central Newton vector (0,1) is basic although the direct sum of the two standard characters has two slopes.
- `TauCeti.BunG.FilteredChart.testOpposite`: The HN filtration of O⊕O(1) begins with O(1); the chart extension filtration begins with O.

In FS V.3.5, Graded framing exposes the negative BC tower.

In FS V.3.7, Forgetting the filtration yields smooth specialization neighborhoods.

The GL_n graded slopes increase with filtration index.

Source: [Laurent Fargues, Peter Scholze, Geometrization of the local Langlands correspondence](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), DefinitionV.3.2 and ExampleV.3.3 pp.173-174.

<a id="quasi-split-parabolic-chart"></a>

### 2. Quasi-split parabolic chart

Prove `TauCeti.BunG.QuasiSplitParabolicChart`. For quasi-split G and a rational dominant Newton representative, let M_b=Z_G(ν_b) and P_b be its parabolic with nonnegative ν_b weights. Then M_b(chart)=Bun_(P_b)×_(Bun_(M_b))Bun_(M_b)^(b_M), with the Levi basic summand identified as [*/J_b(E)]. Use the source’s positive Newton parabolic; it is opposite to the curve-HN automorphism parabolic.

Use [Opposite filtered-bundle chart](#filtered-bundle-chart); [Rational Newton representative](#rational-newton-witness); [Semistable locus and basic strata](#semistable-locus-and-basic-strata); `tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory`.

A filtered fibre functor of the fixed type is the corresponding P_b reduction. The graded semistable condition is precisely the basic Levi bundle condition. Transport the diagram through the rational cocharacter filtration dictionary.

For a nonsplit inner form this particular rational parabolic presentation is not asserted.

Source: [Laurent Fargues, Peter Scholze, Geometrization of the local Langlands correspondence](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), ExampleV.3.4 p.174.

<a id="chart-over-classifying-stack"></a>

### 3. Negative Banach–Colmez tower of a chart

Prove `TauCeti.BunG.ChartOverClassifyingStack`. q_b:M_b→[*/J_b(E)] is partially proper, representable in locally spatial diamonds, and ℓ-cohomologically smooth of relative dimension <2ρ,ν_b> for ℓ≠p. After graded framing it is a successive torsor under negative Banach–Colmez v-sheaves, namely H^1 of the negative curve-slope pieces of the opposite unipotent group. The framed v-sheaf itself is not an absolute diamond; its punctured complement is locally spatial, and the representability assertion is relative.

Use [Opposite filtered-bundle chart](#filtered-bundle-chart); [Filtered torsor automorphism group schemes](#filtered-automorphism-group-scheme); `VectorBundlesAndIsocrystals:VB3:general-BC/families-of-banach-colmez-spaces`; `VStackSheavesAndLisseCategories:VS0`.

The framed chart is the H^<0 torsor moduli on the curve. Filter H^<0 by its negative vector-bundle quotients, giving the H^1 extension tower. Use the relative BC supplier’s partial properness, representability and smoothness; add dimensions.

Absolute tildeM_b need not be a diamond even though tildeM_b→* is representable in locally spatial diamonds.

Source: [Laurent Fargues, Peter Scholze, Geometrization of the local Langlands correspondence](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), PropositionV.3.5 p.174.

<a id="section-and-spatial-complement"></a>

### 4. Split section and spatial chart complement

Prove `TauCeti.BunG.SectionAndSpatialComplement`. The split section [*/J_b(E)]→M_b is closed and is exactly the locus whose underlying bundle is geometrically E_b. Its framed preimage is the origin. The open complement tildeM_b°=tildeM_b minus {origin} is a spatial diamond. The unsplit extensions satisfy [bprime]≤[b] and can be strictly smaller.

Use [Negative Banach–Colmez tower of a chart](#chart-over-classifying-stack); [Classification of HN-graded bundles](#hn-graded-classification); [HN sign and semicontinuity](#hn-sign-and-semicontinuity); `VectorBundlesAndIsocrystals:VB3:projectivized-properness/properness-of-projectivized-BC`; `VectorBundlesAndIsocrystals:VB4/relative-HN-filtration-and-proetale-splitting`; `VectorBundlesAndIsocrystals:VB3:general-BC/families-of-banach-colmez-spaces`; `DiamondsAndVStacks:D5/relative-representability`.

An extension is Newton-bounded by its split graded object, so the equal-class locus is closed. There the opposite filtration and HN filtration are transverse, giving a graded splitting. At the first nonzero extension step, the punctured negative BC space is an absolute diamond; combine the finite tower and the properness argument to get spatiality.

For the GL_2 example, the origin gives O⊕O(1); nonzero extension gives the rank2 O(1/2) block.

Source: [Laurent Fargues, Peter Scholze, Geometrization of the local Langlands correspondence](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), PropositionV.3.6 pp.175-176.

<a id="contracting-chart-action"></a>

### 5. Contracting chart action and proper quotient

Prove `TauCeti.BunG.ContractingChartAction`. For sufficiently divisible N>0, the central Newton morphism in J_b gives U_π=ν_(b,J)^N(π)∈J_b(E). It contracts the framed extension tower to the origin. On tildeM_b° the Z-action has the source’s escaping property and tildeM_b°/U_π^Z→* is proper. This is ordinary properness, not merely partial properness.

Use [Split section and spatial chart complement](#section-and-spatial-complement); [Decent representative](#decent-representative); [Central Newton morphism of the centralizer](#central-newton-on-J); `VectorBundlesAndIsocrystals:VB3:projectivized-properness/properness-of-projectivized-BC`; `VectorBundlesAndIsocrystals:VB4`; `DiamondsAndVStacks:D4`; `VectorBundlesAndIsocrystals:VB3:general-BC/families-of-banach-colmez-spaces`.

Choose a finite descent coefficient field and an integral Newton multiple. At the first nonzero negative extension piece, U_π acts by a positive power of π; negative iterations escape each quasicompact open. Apply the contraction/fixed-point lemma from the VB4 supplier and projectivized BC properness to the tower.

The quotient is proper only after removal of the fixed origin.

Source: [Laurent Fargues, Peter Scholze, Geometrization of the local Langlands correspondence](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), PropositionV.3.6 pp.175-176.

<a id="chart-jacobian-positivity"></a>

### 6. Positive tangent criterion for the filtered chart

Prove `TauCeti.BunG.ChartJacobianPositivity`. After S→Bun_G corresponds to E, the fibre M×_(Bun_G)S is the open subfunctor of sections of E×^GFl→X_S having semistable graded pieces of their specified slopes. Fl is the disjoint union of projective filtration varieties. Along these sections its tangent bundle has a finite filtration with semistable positive-slope quotients, so the section lies in VS1’s cohomologically smooth locus.

Use [Opposite filtered-bundle chart](#filtered-bundle-chart); [Semistable locus and basic strata](#semistable-locus-and-basic-strata); `tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory`; `tauceti:TauCetiRoadmap/ReductiveGroups#layer-1-representations--comodules`; `VStackSheavesAndLisseCategories:VS1/jacobian-criterion`; `VectorBundlesAndIsocrystals:VB4/relative-HN-filtration-and-proetale-splitting`.

Work componentwise on the projective filtration varieties. Their associated flag bundles admit the projective embeddings required by VS1; verify this hypothesis before applying its section criterion. Identify rational tensor filtrations with sections of the flag scheme. Use semistable openness on each graded piece. Calculate tangent root weights and convert to positive bundle slopes. Apply the actual Jacobian section-space theorem, including its smooth quasi-projective curve scheme hypotheses.

Tangent positivity is the reason the late chart theorem uses VS1.

Source: [Laurent Fargues, Peter Scholze, Geometrization of the local Langlands correspondence](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), Proof ofTheoremV.3.7 p.177.

<a id="chart-to-bun-g"></a>

### 7. Smooth specialization neighborhoods

Prove `TauCeti.BunG.ChartToBunG`. π_b:M_b→Bun_G is separated, partially proper, representable in locally spatial diamonds and ℓ-cohomologically smooth of relative dimension <2ρ,ν_b>. Its open image is exactly the points whose corresponding bundles specialize to E_b; in the fixed-κ order this is {[bprime]:[bprime]≤[b]}. The charts cover Bun_G, since every b lies in its own chart image.

Use [Positive tangent criterion for the filtered chart](#chart-jacobian-positivity); [Negative Banach–Colmez tower of a chart](#chart-over-classifying-stack); [Contracting chart action and proper quotient](#contracting-chart-action); [Cohomological smoothness of Bun_G](#bun-g-is-smooth-artin); `VStackSheavesAndLisseCategories:VS1/jacobian-criterion`; `VStackSheavesAndLisseCategories:VS0`; `DiamondsAndVStacks:D5/relative-representability`; [Newton topology theorem in both characteristics](#newton-topology-homeomorphism).

Apply the section-space Jacobian criterion for representability, partial properness, separatedness and smoothness. Subtract dim Bun_G=0 from dim M_b to compute relative dimension. The split section contains the b-stratum; openness of the image includes every generalization of b. The contracting action degenerates every chart point to the split section, proving the reverse inclusion. Apply the Newton topology theorem to identify the generalizations of b with the down-set [bprime]≤[b] in its integral κ fibre; openness alone does not identify this set with the combinatorial order.

For κ=1 in GL_2, the chart of slopes1,0 contains its basic generalization1/2,1/2.

Source: [Laurent Fargues, Peter Scholze, Geometrization of the local Langlands correspondence](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), TheoremV.3.7 p.177.

<a id="gl2-extension-chart"></a>

### 8. Rank-two extension chart

Prove `TauCeti.BunG.Gl2ExtensionChart`. For graded bundle O⊕O(1), tildeM_b=BC(O(−1)[1]) parametrizes framed extensions 0→O→E→O(1)→0. E is either split or the simple rank2 slope1/2 bundle. The fibres of π_b are open subspaces of (BC(E) minus {0})/E× of nowhere-vanishing sections giving the prescribed quotient.

Use [Smooth specialization neighborhoods](#chart-to-bun-g); `VectorBundlesAndIsocrystals:VB3:general-BC/families-of-banach-colmez-spaces`; `VectorBundlesAndIsocrystals:VB3:projectivized-properness/properness-of-projectivized-BC`; `VectorBundlesAndIsocrystals:VB2:classification`; `VectorBundlesAndIsocrystals:VB4`.

Identify Ext^1 with the negative BC H^1 of O(−1). Use the rank2 bundle classification and determinant degree1. Describe a filtration by a nowhere-vanishing section, and import the saturated-section open condition.

The split point has full positive automorphism kernel; the framed chart extension direction has negative slope.

Source: [Laurent Fargues, Peter Scholze, Geometrization of the local Langlands correspondence](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), ExampleV.3.1 p.173.

### Examples

The framed chart for O⊕O(1) is Ext¹(O(1),O)=H¹(O(−1)). Its origin gives the split bundle, and a nonzero extension gives the simple rank-two bundle O(1/2). The split bundle has positive automorphism direction H⁰(O(1)); the extension chart has the opposite slope. These two spaces cannot be interchanged.

### Dependencies

The local inputs come from BG0, BG1, BG2:smooth-Artin, BG2:uniformization, BG3. Each subsection names the direct target it consumes.

The external contracts are `DiamondsAndVStacks:D3`; `DiamondsAndVStacks:D4`; `DiamondsAndVStacks:D5/relative-representability`; `VStackSheavesAndLisseCategories:VS0`; `VStackSheavesAndLisseCategories:VS1/jacobian-criterion`; `VectorBundlesAndIsocrystals:VB2:classification`; `VectorBundlesAndIsocrystals:VB3:general-BC/families-of-banach-colmez-spaces`; `VectorBundlesAndIsocrystals:VB3:projectivized-properness/properness-of-projectivized-BC`; `VectorBundlesAndIsocrystals:VB4`; `VectorBundlesAndIsocrystals:VB4/relative-HN-filtration-and-proetale-splitting`; `tauceti:TauCetiRoadmap/ReductiveGroups#layer-1-representations--comodules`; `tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory`. Their exact scope is specified above; the missing refinements below remain necessary.

## Worked examples for the native formulations

For an actual group automorphism σ, `sigmaSetoid` records existence of a twisted conjugator, and `SigmaClass` is its quotient set. It deliberately forgets stabilizers. `SigmaCentralizer.points` keeps those as a genuine subgroup: at b=1 it is the σ-fixed subgroup; if also σ=id it is the whole group. Under b↦g b σ(g)⁻¹, the stabilizer transports by h↦g h g⁻¹. These elementary formulas do not assert representability by J_b.

The finite norm has N₀(b)=1, N₁(b)=b and N₂(b)=bσ(b). Its conjugation formula ends with σʳ(g)⁻¹, so a decency equation requires r>0. A rank-one b=π gives Nᵣ(b)=πʳ, not πʳ⁺¹. `decencyEquation` records only this positive-period equation; the integral Newton morphism and the existence of a decent representative are separate targets.

Over the fraction field of Witt vectors of an algebraically closed field of characteristic p, `WittRankOne.classification` assigns the class of pᵐ to m. It separates 1 from p and p from p⁻¹. `unitFrobenius` is induced by the actual ring Frobenius and preserves its coefficient coercion. This is the Q_p rank-one specialization, not classification for arbitrary coefficient rings or reductive groups.

`GLnSlopeData` requires descending rational slopes, integral total κ, and denominator divisibility of each slope multiplicity. Numerical dominance fixes κ and compares initial partial sums. Basicness is constant slope for the standard GL_n representation; numerical acceptability is dominance against the chosen bound, and numerical ordinarity additionally attains that bound. A Hodge application uses an integral dominant cocharacter as the bound. The empty tuple has κ=0 and is basic and ordinary. These objects do not yet identify numerical tuples with actual isocrystal classes.

For `SlopeProtorus.coordinates`, the coordinate Hopf algebra is E[Q]. The rational character q maps a monomial indexed by n∈Z to the monomial indexed by nq. At q=1/2 the generator indexed by 2 maps to the generator indexed by 1; at q=0 every group monomial maps to the unit. The half character differs from every integral character over any field E. A finite representation has finitely many weights and hence a common positive denominator, without making the protorus finite type.

For `KottwitzDescent.Data`, require an actual equivariant group homomorphism. Its composite with native integral cyclic coinvariants descends uniquely to sigma classes. When the group itself is abelian, twisted conjugacy is precisely quotienting by the range of τ−id. `ComponentCoset` is the solution set τx−x=d: if x₀ is a solution it is x₀ plus the fixed subgroup. For τ=id,d=0 it is all Z. For τ=−id,d=2 it is {−1}, whereas d=1 has no integral solution. The sign-action coinvariants retain their nonzero class of 1 and kill 2.

## Remaining supplier refinements

The following are explicit open mathematical inputs. The targets above specify what to build; they do not certify closed prerequisite chains or an implementation.

### Remaining torus-resolution and lattice refinements

Import RG2.1.5’s z-extensions, induced central kernels, simply connected derived groups, rational-point surjectivity and Γ-equivariant central lattice exactness. The additional input is a general induced-torus resolution with invariant-lattice surjectivity and descent comparison, together with canonical transport between choices of maximal torus and under inner twists. No z-embedding is required.

The recorded consumers include [Basic Levi Newton formula](#levi-newton-formula); [Minuscule basic Levi lifting](#minuscule-basic-levi-lift); [Elliptic tori and basic acceptable classes](#elliptic-torus-basic-image); [Specialness for a transferred centralizer torus](#transferred-torus-specialness); [Ordinary straight translation and Levi centrality](#ordinary-straight-translation); [Ordinary classes under a derived isogeny](#ordinary-derived-isogeny); [Abelianized Kottwitz set](#abelianized-kottwitz-set); [Central-torus Grassmannian surjectivity](#central-torus-grassmannian-surjectivity); [Local constancy of bundle Kottwitz invariant](#semicontinuity-and-local-constancy); [Algebraic fundamental group](#algebraic-fundamental-group); [Newton orbit space and rational dominance](#newton-orbit-space); [Galois averaging and Hodge invariants](#galois-average); [Newton and Kottwitz invariants](#newton-and-kottwitz-maps); [Torus norm and Newton average](#torus-norm-description); [Rational Kottwitz images of centralizers](#rational-kottwitz-surjectivity); [Bounded lifting through a z-extension](#z-extension-bounded-lifting); [Basic classes and adjoint torsors with connected center](#connected-center-basic-inner-forms).

### Relative reductive-group and Tannakian descent refinements

Generic relative tensor-torsor descent, filtered group-scheme representability and rational-cocharacter root calculations belong to ReductiveGroups. Zie15 Theorems1.3/4.15 apply on affine bases with pro-smooth underlying automorphism group; reductive finite-type groups satisfy the smoothness condition. Clear rational weights on a local tensor generator before splitting, and retain the positive vector quotients of Proposition4.24/Lemma4.25. No global splitting over a non-affine base follows. The analytic Tannakian argument also needs the reductive invariant-theory input of Ans19 Theorem3.11. For general-E representation detection, supply arbitrary-characteristic highest-weight modules, highest weights of exterior powers and finite-separable restriction of scalars. RR96 Lemma2.2 itself assumes characteristic zero.

The recorded consumers include [Tannakian description of analytic torsors](#g-torsors-three-descriptions); [Algebraic sigma-centralizer](#sigma-centralizer-J-b); [Finite Frobenius norm centralizer](#finite-frobenius-norm-centralizer); [Filtered torsor automorphism group schemes](#filtered-automorphism-group-scheme); [Specialness for a transferred centralizer torus](#transferred-torus-specialness); [Geometric classification of G-bundles](#points-are-B-of-G); [Representations detect Newton dominance](#representation-detects-dominance).

### Weil crossed-module proof interior

The p-adic crossed-module comparison needs the abelianization construction and H²(W_E,Tsc(L^sep))=0, including its original Borovoi/Serre proof inputs. ET.0 owns the reductive cohomological application; its present brief does not state this exact degree-two theorem or its comparison with the curve. Require the natural continuous W_E-action on discrete coefficients over L^sep, compatibility of the point-to-curve map, and the inertia contribution, including μ_p over Q_p. ET.0 currently treats characteristic-zero local fields; the general-E H¹ identification for the connected-center basic-to-adjoint application requires an additional equal-characteristic refinement.

The recorded consumers include [Abelianized Kottwitz set](#abelianized-kottwitz-set); [Abelianized classes equal fundamental coinvariants](#abelianization-identification); [Diagonalizable Weil–curve comparison](#diagonalizable-curve-cohomology); [Constant crossed-module curve classes](#crossed-module-curve-classes); [Basic classes and adjoint torsors with connected center](#connected-center-basic-inner-forms).

### G-isocrystal family descent and stratification refinements

Iva23 Lemma5.9/Proposition5.10 and Ans22 Lemma11.3/Theorem11.4 give arc-descent routes independent of κ-local constancy and coefficient-torsor v-triviality. HK22 v5 Proposition2.10/Theorem2.11 impose a perfect normal base. Normal valuation-ring v-covers can serve arbitrary-perfect-base v-strata; this does not assert profinite étale trivialization on an arbitrary base. Required refinements are perfectoid almost/sousperfectoid descent, punctured-period-ring torsor extension and valuation excision, effective-lattice bounds, slope-zero finite étale fixed sections and lifting through the actual tensor-preserving automorphism orbit. The lattice estimate must include the initial Frobenius denominator, and the orbit lift cannot be inferred from ambient GL(H) sections. GIZ26 Theorem7.13 further needs BL uniformization, parahoric BKF/shtuka comparison and proper quasi-pro-étale Isom descent. Schematic κ-local constancy is used later in stratification, rather than as an input to descent.

The recorded consumers include [Families of G-isocrystals](#families-of-g-isocrystals); [Isocrystal-family v-descent and strata](#isocrystal-family-v-descent); [Kottwitz invariant in isocrystal families](#family-kottwitz-local-constancy); [Newton topology theorem in both characteristics](#newton-topology-homeomorphism).

### Curve étale comparison refinements

The proof of FS III.2.12 needs the curve/divisor étale-site equivalence, the geometric-point punctured-period-domain calculation and continuous finite-extension descent. C1 provides prime-to-p proper base change only. The p-torsion Artin–Schreier/tilting argument is separate. D6’s étale-site comparison has a Z_p base; general E requires its equal-characteristic analogue.

The recorded consumers include [Curve-to-base étale site morphism](#curve-etale-base-site); [Constant torsion cohomology on the curve](#curve-torsion-cohomology); [Diagonalizable Weil–curve comparison](#diagonalizable-curve-cohomology); [Constant crossed-module curve classes](#crossed-module-curve-classes).

### Newton topology and maximal-element proof interiors

For the maximum, combine HN18 Theorem1.1(1) with He16 §2.4 and restore central inertia torsion at fixed integral κ. The missing proof inputs are reduced-root/adjoint transfer, orbit-weight integrality from HN18 Lemma2.5, and Chai Theorem6.5/Lemma6.2(i) convex majorants through RG2.4. For topology, GIZ26 v3 Theorem7.18 uses He16 in equal characteristic and Vie21 in mixed characteristic. Its rank-one construction on pp.51–52 needs the product-comb Bezout lemma, Proposition2.17 p.11, Theorem3.16 pp.16–17 with its external boundary-bundle classification, and Theorem7.13 with the family and VB4 refinements. These proof interiors remain prerequisites.

The recorded consumers include [Newton topology theorem in both characteristics](#newton-topology-homeomorphism); [Unique maximum of acceptable classes](#acceptable-unique-maximum).

### Unitary flag dimension and ordinary comparison interiors

Wed99 Theorem1.6.3 supplies the split/balanced unramified unitary ordinary calculation. CGH20 arXiv v2 Proposition3.3.2 assumes that p splits completely. Extend its closed-flag/forgetful PEL comparison to the CS24 unramified unitary datum and identify the entire sub-v-sheaf with the rational-point diamond. Sch15 Lemma3.3.6, Remark3.3.7 and Lemma3.3.19 supply the rank-one Hodge–Tate criterion and specialization step. Separately prove the central-leaf/period-fibre comparison giving Krull dimension d−d_b; neither the ordinary criterion nor semicontinuity gives that dimension. Wedhorn’s global density deformation argument is an additional prerequisite. The cited CGH locator refers to the identified preprint.

The recorded consumers include [Unitary flag Newton dimensions](#unitary-flag-stratum-dimension); [Unitary ordinary flag locus](#unitary-ordinary-flag-locus).

### Native carrier and Lean formulation boundary

The general statements require VB0’s exact E-linear symmetric monoidal finite-isocrystal category, VB1’s relative analytic bundle category, RF/D’s relative curve, sites and v-stacks, VS0/VS1’s Artin and cohomological-smoothness interfaces, and RG’s canonical root/Galois/inner-form and local Frobenius comparisons. Their actual carriers must be available before these targets can be stated in Lean. The suggested file gives representative light definitions over existing carriers and their stated specializations; the full mathematical contracts, APIs and checks remain above.

The recorded consumers include [G-bundles as exact tensor functors](#g-bundle); [Tannakian description of analytic torsors](#g-torsors-three-descriptions); [Structure group and tensor descent](#structure-group-and-tensor-descent); [G-isocrystals](#g-isocrystals-and-B-of-G); [Kottwitz set B(G)](#sigma-conjugacy-quotient); [Algebraic sigma-centralizer](#sigma-centralizer-J-b); [Change of sigma-centralizer representative](#sigma-centralizer-conjugacy); [Decent representative](#decent-representative); [Existence of decent representatives](#existence-of-decent-representative); [Defect of a sigma class](#defect); [Pure inner twisting of torsors](#pure-inner-twisting); [Basic inner form equivalence](#basic-inner-form-bundle-equivalence); [Division-algebra Morita comparison](#division-algebra-morita); [Basic Levi Newton formula](#levi-newton-formula); [Minuscule basic Levi lifting](#minuscule-basic-levi-lift); [Torus-special acceptable pair](#torus-special-pair); [Elliptic tori and basic acceptable classes](#elliptic-torus-basic-image); [Specialness for a transferred centralizer torus](#transferred-torus-specialness); [Ordinary Newton class](#ordinary-class); [Unique maximum of acceptable classes](#acceptable-unique-maximum); [Straight Weyl comparison with B(G)](#straight-weyl-classification); [Ordinary straight translation and Levi centrality](#ordinary-straight-translation); [Ordinary classes under a derived isogeny](#ordinary-derived-isogeny); [Integral conjugacy of an ordinary admissible element](#ordinary-integral-conjugacy); [Products and unramified restriction of scalars](#product-and-unramified-norm); [Levi fibre over a basic G-class](#basic-levi-fibre-uniqueness); [Families of G-isocrystals](#families-of-g-isocrystals); [Isocrystal-family v-descent and strata](#isocrystal-family-v-descent); [Kottwitz invariant in isocrystal families](#family-kottwitz-local-constancy); [Abelianized Kottwitz set](#abelianized-kottwitz-set); [Abelianized classes equal fundamental coinvariants](#abelianization-identification); [Curve-to-base étale site morphism](#curve-etale-base-site); [Constant torsion cohomology on the curve](#curve-torsion-cohomology); [Diagonalizable Weil–curve comparison](#diagonalizable-curve-cohomology); [Constant crossed-module curve classes](#crossed-module-curve-classes); [Moduli v-stack Bun_G](#bun-g-as-v-stack); [Smallness of Bun_G](#bun-g-smallness); [Geometric classification of G-bundles](#points-are-B-of-G); [HN sign and semicontinuity](#hn-sign-and-semicontinuity); [Pro-étale torsors on strictly disconnected bases](#strictly-disconnected-torsors); [Geometrically trivial open locus](#geometrically-trivial-locus); [Grassmannian point lifting](#grassmannian-point-lifting); [Beauville–Laszlo uniformization](#beauville-laszlo-surjectivity); [Central-torus Grassmannian surjectivity](#central-torus-grassmannian-surjectivity); [Central-torus bundle surjectivity](#central-torus-bundle-surjectivity); [Local constancy of bundle Kottwitz invariant](#semicontinuity-and-local-constancy); [Grassmannian components and Kottwitz sign](#grassmannian-kottwitz-sign); [Newton topology theorem in both characteristics](#newton-topology-homeomorphism); [HN-graded G-bundles](#hn-graded-g-bundles); [Classification of HN-graded bundles](#hn-graded-classification); [Filtered torsor automorphism group schemes](#filtered-automorphism-group-scheme); [Full bundle automorphism v-group](#full-automorphism-v-group); [Positive automorphism kernel geometry](#positive-automorphism-kernel); [Quasi-split opposite-parabolic automorphisms](#quasi-split-opposite-parabolic); [Semistable locus and basic strata](#semistable-locus-and-basic-strata); [Torus bundle Picard stack](#torus-picard-stack); [Full classifying-stack description of a stratum](#stratum-is-classifying-stack); [Reduction of full automorphism torsors](#automorphism-torsor-reduction); [Cohomological dimension of Newton strata](#stratum-dimension); [Locally spatial Isom diagonal](#isom-sheaf-representability); [Cohomological smoothness of Bun_G](#bun-g-is-smooth-artin); [Connected components of Bun_G](#connected-components); [Opposite filtered-bundle chart](#filtered-bundle-chart); [Quasi-split parabolic chart](#quasi-split-parabolic-chart); [Negative Banach–Colmez tower of a chart](#chart-over-classifying-stack); [Split section and spatial chart complement](#section-and-spatial-complement); [Contracting chart action and proper quotient](#contracting-chart-action); [Positive tangent criterion for the filtered chart](#chart-jacobian-positivity); [Smooth specialization neighborhoods](#chart-to-bun-g); [Rank-two extension chart](#gl2-extension-chart); [Finite Frobenius norm centralizer](#finite-frobenius-norm-centralizer); [Newton bound for a modification](#modification-newton-bound); [Minuscule modification image](#minuscule-modification-image); [Newton strata of a minuscule flag variety](#flag-newton-strata); [Closed upper flag Newton unions](#flag-strata-semicontinuity); [Unitary flag Newton dimensions](#unitary-flag-stratum-dimension); [Unitary ordinary flag locus](#unitary-ordinary-flag-locus); [Quasi-split centralizer in the GL minuscule case](#gl-minuscule-quasisplit-centralizer); [Rational slope protorus](#slope-protorus); [Algebraic fundamental group](#algebraic-fundamental-group); [Newton orbit space and rational dominance](#newton-orbit-space); [Galois averaging and Hodge invariants](#galois-average); [Newton and Kottwitz invariants](#newton-and-kottwitz-maps); [Kottwitz classification by both invariants](#classification-by-two-invariants); [Basic sigma class](#basic-class); [Newton partial order with Kottwitz fibre](#partial-order-on-B-of-G); [Representations detect Newton dominance](#representation-detects-dominance); [Acceptable classes B(G,{μ})](#admissible-pair); [Finiteness and the basic acceptable member](#admissible-finiteness-and-basic); [Rational Newton representative](#rational-newton-witness); [Torus norm and Newton average](#torus-norm-description); [Rational Kottwitz images of centralizers](#rational-kottwitz-surjectivity); [Component Kottwitz coset](#component-kottwitz-coset); [Bounded lifting through a z-extension](#z-extension-bounded-lifting); [Basic classes and adjoint torsors with connected center](#connected-center-basic-inner-forms); [Central Newton morphism of the centralizer](#central-newton-on-J); [Newton comparison for a Levi representative](#general-levi-newton-comparison); [Class from a de Rham quotient-group lattice](#de-rham-quotient-group-class).

### Local de Rham coefficient group

Liu–Zhu Remark4.1(iii) gives a class in B(G^c). A class in B(G) requires compatible additional G-level tensor data and a lifting argument. A local central-torus lifting theorem does not make that lift canonical.

The recorded consumers include [Class from a de Rham quotient-group lattice](#de-rham-quotient-group-class).

### Levi coinvariant and Cartan refinements

RG2.1/2.4 must supply the torsion-free kernel of π₁(M)_Γ→π₁(G)_Γ used in KMPS Proposition1.1.13, unramified replacement and triality averaging, and the Wintenberger–Satake–Mazur local Cartan arguments. Absolute Weyl transport must retain W(G,T), rather than N_G(M)/M. The KZ Proposition2.3.3 route needs He–Rapoport6.1(b), He16 Theorem6.1, He–Zhou4.1 and He14 Theorem3.5/Proposition4.5. HV20 Lemma5.2 p.906 needs a decent length-zero normalizer lift after a sufficiently divisible positive period; this is the additional input to general-field decency.

The recorded consumers include [Minuscule basic Levi lifting](#minuscule-basic-levi-lift); [Specialness for a transferred centralizer torus](#transferred-torus-specialness); [Integral conjugacy of an ordinary admissible element](#ordinary-integral-conjugacy); [Existence of decent representatives](#existence-of-decent-representative).

### Source version collation

The source findings against the identified author/preprint versions of KMPS, KZ, LZ17, CS24 and Kisin17 remain confined to those versions. Compare the versions of record before extending those findings to published editions.

The recorded consumers include [Structure group and tensor descent](#structure-group-and-tensor-descent); [Algebraic sigma-centralizer](#sigma-centralizer-J-b); [Change of sigma-centralizer representative](#sigma-centralizer-conjugacy); [Decent representative](#decent-representative); [Basic Levi Newton formula](#levi-newton-formula); [Minuscule basic Levi lifting](#minuscule-basic-levi-lift); [Torus-special acceptable pair](#torus-special-pair); [Elliptic tori and basic acceptable classes](#elliptic-torus-basic-image); [Specialness for a transferred centralizer torus](#transferred-torus-specialness); [Ordinary Newton class](#ordinary-class); [Unique maximum of acceptable classes](#acceptable-unique-maximum); [Straight Weyl comparison with B(G)](#straight-weyl-classification); [Ordinary straight translation and Levi centrality](#ordinary-straight-translation); [Ordinary classes under a derived isogeny](#ordinary-derived-isogeny); [Integral conjugacy of an ordinary admissible element](#ordinary-integral-conjugacy); [Finite Frobenius norm centralizer](#finite-frobenius-norm-centralizer); [Unitary flag Newton dimensions](#unitary-flag-stratum-dimension); [Unitary ordinary flag locus](#unitary-ordinary-flag-locus); [Rational slope protorus](#slope-protorus); [Algebraic fundamental group](#algebraic-fundamental-group); [Newton orbit space and rational dominance](#newton-orbit-space); [Galois averaging and Hodge invariants](#galois-average); [Newton and Kottwitz invariants](#newton-and-kottwitz-maps); [Kottwitz classification by both invariants](#classification-by-two-invariants); [Basic sigma class](#basic-class); [Acceptable classes B(G,{μ})](#admissible-pair); [Finiteness and the basic acceptable member](#admissible-finiteness-and-basic); [Rational Newton representative](#rational-newton-witness); [Torus norm and Newton average](#torus-norm-description); [Rational Kottwitz images of centralizers](#rational-kottwitz-surjectivity); [Class from a de Rham quotient-group lattice](#de-rham-quotient-group-class).

### Exact supplier boundaries for Schubert components and filtered BC towers

Reuse GS0’s general-E nonsplit Schubert bounds, with splitting and Galois descent. Its exact integral π₁ connected-component comparison is a separate refinement. Positive H⁰ projectivized BC properness does not supply negative H¹ extension towers, which need the two-term family theorem. The reductive tower also needs contraction, escaping, proper Z-quotient and positive automorphism-kernel connectedness arguments. D4 smallness alone gives neither spatiality nor properness; D5 and the proper-quotient criterion remain necessary.

The recorded consumers include [Grassmannian point lifting](#grassmannian-point-lifting); [Grassmannian components and Kottwitz sign](#grassmannian-kottwitz-sign); [Positive automorphism kernel geometry](#positive-automorphism-kernel); [Split section and spatial chart complement](#section-and-spatial-complement); [Contracting chart action and proper quotient](#contracting-chart-action).

## Downstream consumers

IgusaVarietiesAndTorsionConcentration uses the algebraic class and centralizer theory, acceptable bounds, the unitary flag Newton dimensions and the ordinary flag comparison. EndoscopicTransferAndUnitaryTraceComparison uses those same invariant definitions and supplies local cohomological inputs in return; it does not define another B(G). ExcursionOperatorsAndSpectralAction consumes the stack, its topology and parabolic consequences. GeometricSatakeAndFusion owns modification spaces and imports their bundle images. VStackSheavesAndLisseCategories consumes the full automorphism kernels and stratum geometry for its later sheaf-category results. These ownership directions keep pure algebra independent of RF4 and keep the whole-stack atlas independent of later coefficient categories.

## References

All contracts are stated in our own words. Page numbers refer to the identified public versions; author/preprint and final publication pagination are distinguished. A version-specific correction does not assert anything about an unread final edition.

### FS: Geometrization of the local Langlands correspondence

Laurent Fargues, Peter Scholze. [Geometrization of the local Langlands correspondence](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf). Author or open-access PDF identified by SHA-256; PDF and printed pages distinguished in readSections.

SHA-256: `9ab9efbd0df251bfa3b610d1d1d88a8dfb1bdf7c397bd04f4c277280d98ae905`.

I.2 pp.10-11; I.4 pp.20-22; III.0-III.5 pp.87-106; IV.1 pp.107-114; V.3 pp.173-177. Statements and proof interiors inspected, with the external inputs below retained as requests/gaps.

### SW: Berkeley Lectures on p-adic Geometry

Peter Scholze, Jared Weinstein. [Berkeley Lectures on p-adic Geometry](https://www.math.uni-bonn.de/people/scholze/Berkeley.pdf). Author or open-access PDF identified by SHA-256; PDF and printed pages distinguished in readSections.

SHA-256: `225505171ef809aa0070c023c881ff1da844923775f2d631474c0b42eea4bffc`.

19.5, PDF188-191 = printed178-181; 22.4-22.6, PDF218-223 = printed208-213. Lecture23 boundary read but not replanned. Proposition18.3.1 and its proof: perfect-scheme v-functor full faithfulness, applied to clopen maps into the two-point scheme for FS CorollaryIII.2.8.

### Kot85: Isocrystals with additional structure

Robert Kottwitz. [Isocrystals with additional structure](https://www.numdam.org/article/CM_1985__56_2_201_0.pdf). Author or open-access PDF identified by SHA-256; PDF and printed pages distinguished in readSections.

SHA-256: `51fe79cbe6798ea061128fd294c2459046572fcf5f7ed150c75d50e974819171`.

Sections3-6, printed206-220; OCR formula omissions cross-checked against KMPS and Kot97; no claim of a new transcription of the damaged formula displays.

### Kot97: Isocrystals with additional structure II

Robert Kottwitz. [Isocrystals with additional structure II](https://people.dm.unipi.it/maffei/didattica/male/lacci/Kottwitz.pdf). Author or open-access PDF identified by SHA-256; PDF and printed pages distinguished in readSections.

SHA-256: `345b5feb633aa544930ede54c26a3bd673d17c69b4c490f3f40e0dd13a22e4db`.

Sections4.1-4.17, pp.266-276; sections6.1-6.5 and7.7 used as classification/component proof inputs.

### RR96: On the classification and specialization of F-isocrystals with additional structure

Michael Rapoport, Melanie Richartz. [On the classification and specialization of F-isocrystals with additional structure](https://www.numdam.org/article/CM_1996__103_2_153_0.pdf). Author or open-access PDF identified by SHA-256; PDF and printed pages distinguished in readSections.

SHA-256: `86acb9e18422e641d85f799262e1793614f705029a9cbd70dc0b03f74bcb13d8`.

Sections1 and2, pp.160-166; Lemma2.2 representation criterion and Proposition2.4 read with rendered page166.

### Kot14: B(G) for all local and global fields

Robert Kottwitz. [B(G) for all local and global fields](https://arxiv.org/pdf/1401.5728). Author or open-access PDF identified by SHA-256; PDF and printed pages distinguished in readSections.

SHA-256: `37c9980b749d315d014c5046f486ea9d8bac1acc3753fe766ae45ac7907f12a4`.

Proposition10.4 pp.50-51: central torus extension, quotient B-set and restriction to basic elements.

### Ans19: Reductive group schemes over the Fargues-Fontaine curve

Johannes Anschütz. [Reductive group schemes over the Fargues-Fontaine curve](https://arxiv.org/pdf/1703.00700). Author or open-access PDF identified by SHA-256; PDF and printed pages distinguished in readSections.

SHA-256: `c9e4a95792fb4c74fcba8e81286a1c80b8ff185d8e9025fef67e3f0e1baa3cb6`.

Theorem3.11 and proof pp.14-16; Theorem6.5 and proof p.30.

### KMPS: Honda-Tate theory for Shimura varieties

Mark Kisin, Keerthi Madapusi Pera, Sug Woo Shin. [Honda-Tate theory for Shimura varieties](https://math.berkeley.edu/~swshin/HT.pdf). Author or open-access PDF identified by SHA-256; PDF and printed pages distinguished in readSections.

SHA-256: `fd22990bc3eff8a726375cf8f0c9015828c39f1c32b0717347a9ef23ce9b52db`.

Section1.1 pp.5-14, including decency, basic classes, transfer, minuscule Levi lifting and local specialness; section1.3.15 ordinary assertion checked against KZ and quaternion obstruction.

### KZ: Independence of l for Frobenius conjugacy classes attached to abelian varieties

Mark Kisin, Rong Zhou. [Independence of l for Frobenius conjugacy classes attached to abelian varieties](https://arxiv.org/pdf/2103.09945v2). Author or open-access PDF identified by SHA-256; PDF and printed pages distinguished in readSections.

SHA-256: `62d26eb931f271404c333c4b9a929e85239222788834cf16dcec1dff230c34c8`.

Sections2.1.3-2.3.3 pp.7-12, including proofs of Lemmas2.1.7,2.1.9,2.2.6,2.2.8 and Proposition2.3.3. arXiv v2, not collated against the 2025 published edition.

### CS17: On the generic part of the cohomology of compact unitary Shimura varieties

Ana Caraiani, Peter Scholze. [On the generic part of the cohomology of compact unitary Shimura varieties](https://annals.math.princeton.edu/wp-content/uploads/annals-v186-n3-p01-p.pdf). Author or open-access PDF identified by SHA-256; PDF and printed pages distinguished in readSections.

SHA-256: `4f9449e5ecfd8fb8b43a04acef73060f531be995babaa9f744f3db36aaa5e61a`.

Introduction Theorem1.11; section3.5 pp.687-691; section5.5 pp.747-749, Lemma5.5.8 and normalization footnote.

### CS24: On the generic part of the cohomology of non-compact unitary Shimura varieties

Ana Caraiani, Peter Scholze. [On the generic part of the cohomology of non-compact unitary Shimura varieties](https://arxiv.org/pdf/1909.01898v2). Author or open-access PDF identified by SHA-256; PDF and printed pages distinguished in readSections.

SHA-256: `803fc16ab30fa37fa1ce08c683885040c2034bbefc6ca6567e73026006229f2e`.

Section2.7 pp.33-34, Theorem2.7.3 and its unitary ordinary comparison. arXiv v2, not a full published-version collation.

### Zhu17: Affine Grassmannians and the geometric Satake in mixed characteristic

Xinwen Zhu. [Affine Grassmannians and the geometric Satake in mixed characteristic](https://annals.math.princeton.edu/wp-content/uploads/annals-v185-n2-p02-p.pdf). Author or open-access PDF identified by SHA-256; PDF and printed pages distinguished in readSections.

SHA-256: `5d50b415048f3a5ad14bccf1c8da83fc5a680fcf13b60911ca269daa474431a7`.

Proposition1.21 p.427; section3.1.2 p.456; Remark3.6 and Lemma3.7 p.459.

### GLX: The connected components of affine Deligne-Lusztig varieties

Ian Gleason, Dong Gyu Lim, Yujie Xu. [The connected components of affine Deligne-Lusztig varieties](https://link.springer.com/content/pdf/10.1007/s00222-025-01386-1.pdf). Author or open-access PDF identified by SHA-256; PDF and printed pages distinguished in readSections.

SHA-256: `c40fe1fc5e0941812cf3aca5ba77c471ee49122c63ed7b0d864d322136031485`.

Section2.2 pp.818-819; section3.7 pp.829-830, Lemma3.16; introduction component coset. Published PDF, not the older extraction page numbers.

### HK: Admissible pairs and p-adic Hodge structures II: the bi-analytic Ax-Lindemann theorem

Sean Howe, Christian Klevdal. [Admissible pairs and p-adic Hodge structures II: the bi-analytic Ax-Lindemann theorem](https://arxiv.org/pdf/2308.11064v2). Author or open-access PDF identified by SHA-256; PDF and printed pages distinguished in readSections.

SHA-256: `c133b06bec1209a04f84d1c2984b78ce2242ba85fc1b72cf5a662002685cab8a`.

Section6.2 pp.36-37, unique basic element of B(M,[mu^-1]); reductive specialization here. General nonreductive Hodge moduli are not claimed.

### LZ17: Rigidity and a Riemann-Hilbert correspondence for p-adic local systems

Ruochuan Liu, Xinwen Zhu. [Rigidity and a Riemann-Hilbert correspondence for p-adic local systems](https://arxiv.org/pdf/1602.06282v3). Author or open-access PDF identified by SHA-256; PDF and printed pages distinguished in readSections.

SHA-256: `8b11e55bffbfb1835a6da8975272670c9465601c08640e06f3a566a459a1da79`.

Corollary4.9 and Remark4.1 pp.33-34; theorem3.9 is imported from its owner.

### Kisin17: Mod p points on Shimura varieties of abelian type

Mark Kisin. [Mod p points on Shimura varieties of abelian type](https://people.math.harvard.edu/~kisin/dvifiles/lr.pdf?download=1). Author or open-access PDF identified by SHA-256; PDF and printed pages distinguished in readSections.

SHA-256: `d3c19cddc9e8b073428de559a7215aae4f793490227b6c71d87477ccdb5d994a`.

Sections1.2.1-1.2.12 pp.12-14; section2.1 pp.29-32; Lemma4.6.4 printed93. The integral reductive/unramified standing hypothesis is retained.

### vH24: Mod p points on Shimura varieties of parahoric level

Pol van Hoften. [Mod p points on Shimura varieties of parahoric level](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/EC6F7AD8C8B489FEB8FC4D64485ABE1D/S2050508624000222a.pdf/mod_p_points_on_shimura_varieties_of_parahoric_level.pdf). Author or open-access PDF identified by SHA-256; PDF and printed pages distinguished in readSections.

SHA-256: `d86da9a0e35c93d22df291979be37a5acf1ddc44fbd762e11f2a5f6c92961be0`.

Section2.4.1 pp.23-24; Lemma3.4.2 and Corollary3.4.6 pp.34,36-37.

### He21: Cordial elements and dimensions of affine Deligne-Lusztig varieties

Xuhua He. [Cordial elements and dimensions of affine Deligne-Lusztig varieties](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/5A27DBF48CAEF6DA56A313061848574C/S205050862100010Xa.pdf/cordial-elements-and-dimensions-of-affine-delignelusztig-varieties.pdf). Author or open-access PDF identified by SHA-256; PDF and printed pages distinguished in readSections.

SHA-256: `d53843f0c8875cf1e14173ad271e025bd30f177fe319a7d83926629d454683dd`.

Sections2.1-2.2 pp.4-5; section4.1 p.7; sections6.1-6.3 pp.13-14 including the nonbasic footnote.

### Vie21: On Newton strata in the B_dR^+-Grassmannian

Eva Viehmann. [On Newton strata in the B_dR^+-Grassmannian](https://arxiv.org/pdf/2101.07510). Author or open-access PDF identified by SHA-256; PDF and printed pages distinguished in readSections.

SHA-256: `6170b63e81e3eb793fdce0a60bee1b3510717bd5a238c999266eb60cfa615c19`.

Theorem1.1 and topology convention p.2; proof route in section6 is a precise proof-interior gap. arXiv v2 dated2023-03-04.

### HN18: On the acceptable elements

Xuhua He, Sian Nie. [On the acceptable elements](https://arxiv.org/pdf/1408.5836). Author or open-access PDF identified by SHA-256; PDF and printed pages distinguished in readSections.

SHA-256: `8377c0a45eb02125f819d30dffd64cc8209bda6208dec9e2b3989edf4569fe02`.

Theorem0.1 and proof roadmap pp.1-2; combinatorial proof interiors are a named gap. arXiv v2 dated2016-10-20; KZ calls the published result Theorem1.1. §§1.1–1.4 pp.2–4, Theorem1.1(1); §§2.1–2.5 pp.4–8 and Appendix A pp.20–22 with their proof routes. Chai external inputs remain additional prerequisites. The general-field transfer is an explicit deduction, not a quotation of Theorem0.1.

### GIZ26: Meromorphic vector bundles on the Fargues–Fontaine curve

Ian Gleason, Alexander B. Ivanov, Felix Zillinger. [Meromorphic vector bundles on the Fargues–Fontaine curve](https://arxiv.org/pdf/2307.00887v3). arXiv:2307.00887v3, 14 May 2026; 62-page PDF, printed page equals PDF page.

SHA-256: `78855695f8654374174073434eca08297751d397786b3abf29e367c9cc2cff23`.

§2 and Remark2.1 pp.6–7; §7.3 pp.50–53, including Lemma7.17 and Theorem7.18 and its proof; Lemma7.11, Corollary7.12 and Theorem7.13 pp.45–47. Boundary-extension and external proof inputs remain G04/G06. Remark3.15 and Theorem3.16 pp.16–17: v-descent-limit/period-space bundle comparison, not unrestricted extension of arbitrary open-period-space bundles.

### He16: Hecke algebras and p-adic groups

Xuhua He. [Hecke algebras and p-adic groups](https://arxiv.org/pdf/1511.01386v3). arXiv:1511.01386v3, 21 November 2016; survey version, not collated with the published edition cited by KZ.

SHA-256: `f6170c52ce24599a5b1b6d7991ae9c9b98a8be8e5cf8753b9a335e74d3fe3cdc`.

§1.10.5, Theorem1.29 pp.20–21; §§2.2 and2.4–2.6 pp.22,25–28, including Theorems2.6,2.11 and2.12; §2.11.3–2.11.4 pp.42–43. §2.5 restricts the closure discussion to equal characteristic.

### Zie15: Graded and filtered fiber functors on Tannakian categories

Paul Ziegler. [Graded and filtered fiber functors on Tannakian categories](https://arxiv.org/pdf/1111.1981v4). arXiv:1111.1981v4; printed page equals PDF page. Not collated with the 2015 journal edition.

SHA-256: `742e6ecb5be56cb3fc7c1b48a944ae0fdba91a0e8546f3ff61f6b6f57054ea9f`.

Theorem1.3 p.2 and the Tannakian hypotheses in §§1–2 pp.1–5; Theorem4.6 and Definitions4.7–4.11 pp.22–23; Lemma4.12, Theorems4.13–4.16 and Lemmas4.17–4.22 pp.23–25; Proposition4.24, Lemma4.25 and Theorem4.26 with their proofs pp.26–27. The general fpqc-splitting proof in §5 remains an additional prerequisite.

### Iva23: Arc-descent for the perfect loop functor and p-adic Deligne–Lusztig spaces

Alexander B. Ivanov. [Arc-descent for the perfect loop functor and p-adic Deligne–Lusztig spaces](https://arxiv.org/pdf/2003.04399v3). arXiv:2003.04399v3, 3 September 2021; printed page equals PDF page. Not collated with the 2023 journal edition.

SHA-256: `83407106dc3be635594040a9f6cab1a956aa05c0b05611b36e75067e65af549a`.

§§2.1.1–2.1.2 pp.5–6, coefficient and finite-field Frobenius setup in both characteristics; Theorem5.1 and its proof route p.11; Corollary5.6 p.13; Lemmas5.8–5.9 and Proposition5.10 with their proofs pp.14–15. Perfectoid almost descent and the sousperfectoid comparison are retained as supplier inputs.

### Ans22: Extending torsors on the punctured Spec(A_inf)

Johannes Anschütz. [Extending torsors on the punctured Spec(A_inf)](https://arxiv.org/pdf/1804.06356v2). arXiv:1804.06356v2, 21 October 2020; printed page equals PDF page. Not collated with the 2022 journal edition.

SHA-256: `27c2e6fef2d1fd82ad825b087dbf19b1cd496b8bfc7a60ce6bdba8deaca08354`.

§11, Lemmas11.1–11.3 and Theorem11.4 with proofs pp.33–36. Theorem9.10 on the rank-one punctured period ring and Steinberg Theorem7.1 are identified external inputs, additional prerequisites.

### HK22: Point counting on Igusa varieties for function fields

Paul Hamacher, Wansu Kim. [Point counting on Igusa varieties for function fields](https://arxiv.org/pdf/2208.01069v5). arXiv:2208.01069v5, 21 August 2025; printed page equals physical PDF page. The normal-base hypothesis differs from v1.

SHA-256: `f060ee365ba1b6ba50b0c39cc086e1d87726643228ad001d6aa64fe7f54bb5c2`.

Theorem1.1 p.2; §2.1 p.5 and §2.5 p.6; Lemmas2.8–2.9 pp.7–8; Proposition2.10 p.8 and Theorem2.11 with proof p.9. The latter two require a perfect normal base. Zink’s effective-lattice input and the tensor-line orbit-lifting step remain explicit proof obligations. Rechecked the printed pp.8–9 (physical PDF pp.8–9) for E08/E09: the Newton-only lattice bound and ambient-to-actual orbit factorization are proof issues, not established consequences of the cited source.

### Wed99: Ordinariness in good reductions of Shimura varieties of PEL-type

Torsten Wedhorn. [Ordinariness in good reductions of Shimura varieties of PEL-type](https://www.numdam.org/article/ASENS_1999_4_32_5_575_0.pdf). Published Ann. Sci. École Norm. Sup. 32 (1999), 575–618; printed page = PDF page + 573.

SHA-256: `2d44cd511bd311580b110296ad118b39f2ede4173b7db68adbab188a9b7f57ba`.

§1.6, Theorem1.6.3 and its first proof part pp.584–585 (PDF11–12); §§2.3.1–2.3.2, split and unramified unitary cocharacter calculations pp.588–589 (PDF15–16). The density theorem’s deformation proof in Chapters3–4 is additional prerequisites.

### CGH20: Shimura varieties at level Gamma_1(p^infinity) and Galois representations

Ana Caraiani, Daniel R. Gulotta, Chi-Yun Hsu, Christian Johansson, Lucia Mocz, Emanuel Reinecke, Sheng-Chi Shih. [Shimura varieties at level Gamma_1(p^infinity) and Galois representations](https://arxiv.org/pdf/1804.00136v2). arXiv:1804.00136v2, 25 July 2019; printed page equals PDF page. Published Compositio version not collated.

SHA-256: `11d2c275c5dcf3bd715de9e4dc95ebcdb9884259cd7bc4fec01294b4bbf6cdc7`.

§3.3, Proposition3.3.2 and proof pp.30–31. CS24’s Proposition3.3.8 locator is not the number in this read version. The source’s global hypothesis that p splits completely in the CM field is retained; extending its local closed-flag argument to the unramified CS24 datum is a separate comparison obligation.

### Sch15: On torsion in the cohomology of locally symmetric varieties

Peter Scholze. [On torsion in the cohomology of locally symmetric varieties](https://annals.math.princeton.edu/wp-content/uploads/annals-v182-n3-p03-p.pdf). Published Annals of Mathematics 182 (2015), 945–1066; printed page = PDF page + 944.

SHA-256: `ebac854f47381c19a987b43b59d2c05cad55c3186c4d8cde067a7be0d06cbd16`.

Lemma3.3.6 and Remark3.3.7 with proof pp.1006–1007 (PDF62–63); Lemma3.3.15 p.1011 (PDF67); Lemmas3.3.19–3.3.20 and their argument p.1013 (PDF69). The earlier canonical-subgroup and Hodge–Tate comparison inputs are additional prerequisites.

### Zin01: On the slope filtration

Thomas Zink. [On the slope filtration](https://www.math.uni-bielefeld.de/~zink/slopes.pdf). 19-page Bielefeld author copy, PDF creation date 23 January 2002. Author page numbers equal PDF pages; not the pagination of Duke Math. J. 109 (2001), 79–95. Published text not collated.

SHA-256: `cf94a433fe048706937a1326c87815fed96109dff45bd819d4ac38c3c9463a78`.

Proposition3 with proof author p.4; Lemma4 author pp.5–6; Lemma9 with proof and following height-bound remark author pp.11–12. The referenced Cartier-theory book remains an additional prerequisite; existence of an effective lattice remains the linear slope-classification supplier input.

### HV20: Finiteness properties of affine Deligne–Lusztig varieties

Paul Hamacher, Eva Viehmann. [Finiteness properties of affine Deligne–Lusztig varieties](https://ems.press/content/serial-article-files/26546?nt=1). Documenta Mathematica 25 (2020), 899–910; public published PDF identified by SHA-256.

SHA-256: `8884c1625ff90f828da0fd155ee9b13d94b4e593378a280aeb4fcd806b3789e6`.

§1 pp.899–900 fixes local fields in either characteristic; §3 pp.902–904 recalls the centralizer; Lemma5.2 and proof p.906 (PDF8) gives decent representatives.

### Version-specific corrections

**E01 — LZ17.** The available de Rham tensor data determines a class for G^c. A class for G requires additional lifting data and a proof of its choice properties, or the hypothesis G=G^c. LZ17 v3 Remark4.1(iii)/Corollary4.9 pp.33–34 use G^c. The resulting tensor modification class belongs to B(G^c); a class in B(G) requires compatible extra lifting data. This confirms the coefficient-group correction in the read preprint only. Locator: arXiv1602.06282v3; Remark4.1(iii),PDF34

**E02 — GLX.** The torus valuation quotient is the inertia-coinvariant cocharacter lattice of T. Its map to π_1(G)_I can have a coroot kernel, so rational Kottwitz surjectivity requires the separate theorem. GLX Lemma3.16 proof, equation(3.23) p.830, puts π_1(G)_I in a torus-point sequence. For SL_2 the group π_1(G) is zero while the split maximal torus has valuation lattice ℤ. The sequence must use X_*(T)_I; the desired rational-point surjectivity separately follows from Kot97 §7.7 in its p-adic scope. Locator: ProofLemma3.16(2),(3.23),p830; published57-page version, rendered page inspected unless stated otherwise

**E03 — CS17.** For the order fixed on B(G), the Newton map is upper semicontinuous: locally b(y)≤b(x). Its finite image has constant κ, so upper unions are closed. This agrees with Corollary3.5.9 and Theorem1.11. CS17 Proposition3.5.7 and proof pp.689–690 reverse the semicontinuity wording relative to the preceding dominance convention. Upper Newton unions are closed. For GL_2 with minuscule bound, the ordinary rational locus is closed and the basic Drinfeld locus open. This is a convention correction, not a failure of the intended theorem. Locator: §3.5, Proposition 3.5.7(1), p. 689, and the same word in its proof, p. 690 (also in arXiv v1)

**E04 — KMPS.** Decency uses exactly r factors b,σ(b),…,σ^(r−1)(b). After a change of representative by c, the last inverse is σ^r(c)^−1 and the right side is the conjugate by c of the integral Newton value. The recorded KMPS author PDF equation(1.1.2.2) p.6 has r+1 factors. With b=p in rank one, those factors give p^(r+1), whereas the r-th semilinear power gives p^r. The final exponent must be r−1. The final Duke version was not collated. Locator: (1.1.2.2), p.6, in the author PDF https://math.berkeley.edu/~swshin/HT.pdf (41 pp., created 27 January 2021, SHA-256 fd22990b…52db), the latest version found; the published text, Duke Math. J. 171 (2022), 1559–1614, was not collated

**E05 — KMPS.** Transport the cocharacter by the absolute Weyl group of a maximal torus in M. The quotient N_G(M)/M need not contain the required Weyl element; use the absolute-conjugacy conclusion of Proposition1.1.13. KMPS Corollary1.1.15 and proof pp.11–12 need an absolute Weyl element. For GL_3 with Levi GL_1×GL_2, μ=(0,1,0) and b_M=diag(p,1,1), the Levi κ values differ. Its unequal blocks have trivial Levi normalizer quotient, while an absolute Weyl transposition gives the required lift. Retain the other hypotheses; the finding concerns the recorded author PDF. Locator: Corollary 1.1.15 and its proof, pp.11–12, in the author PDF https://math.berkeley.edu/~swshin/HT.pdf (41 pp., created 27 January 2021, SHA-256 fd22990b…52db), the latest version found; the published text, Duke Math. J. 171 (2022), 1559–1614, was not collated

**E06 — KMPS.** The ordinary class is unique if it exists. For a quasi-split p-adic group its existence follows from the supplied theorem; for general inner forms existence must be assumed and can fail for a division-algebra multiplicative group. Density claims therefore need this existence or quasi-split hypothesis in addition to local integrality. KMPS §1.3.15 p.20 asserts ordinary existence for inner forms. In quaternion D^×, b↦bΠ with Π²=p identifies the σ-class set with GL_2 and shifts both slopes by 1/2. Ordinary slopes (0,−1) would give slopes (1/2,−1/2), each with multiplicity one, contradicting Dieudonné–Manin. Ordinary existence needs a hypothesis. The example makes the associated density locus undefined; it does not refute density under local integrality. No final-edition claim is made. Locator: §1.3.15, p.20; 41-page Berkeley author PDF SHA256 fd22990bc3eff8a726375cf8f0c9015828c39f1c32b0717347a9ef23ce9b52db; final Duke text not collated; also Introduction, Theorem 3, p.3 (the introduction's form of Corollary 1.3.16 / §1.3.15, p.20)

**E07 — KZ.** Dominance in rational cocharacter space uses nonnegative combinations of positive coroots. Roots have the wrong ambient lattice. KZ v2 §2.2.3 p.10 describes an order in the rational cocharacter space using positive roots. The cone must be generated by positive coroots. This confirms the typed notation correction in the read version, without a claim about the uncollated final Annals text. Locator: §2.2.3 in arXiv:2103.09945v2, printed p.10; current Harvard author copy, printed p.9. Final Annals version not collated.

**E08 — HK22.** Include the Frobenius denominator of the chosen lattice. Over a coefficient DVR with Frobenius preserving the DVR and fixing π, assume an effective lattice exists and ΦM0⊂π^(−d)M0 with d≥0. The minimal effective over-lattice is Σ_(i=0)^(h−1) Φ^i M0 for rank h, and lies in π^(−d(h−1))M0. This field-level repair does not remove the proper-cover or local-freeness obligations over general bases. HK22 v5 Lemma2.9 proof p.8 claims an effective over-lattice bound depending only on Newton slopes. The rank-two σ-conjugate-to-identity shear with coefficient π^(−N) has slopes (0,0), but any stable lattice containing the standard one contains π^(−N)e_1, forcing its bound c≥N. Zin01 Lemma9, author pp.11–12, controls the iterate count after an effective lattice is supplied. Adding an initial Frobenius denominator d yields the recorded rank-dependent bound. This confirms the proof defect, not falsity of Lemma2.9; published text was not collated. Locator: arXiv2208.01069v5, proof of Lemma2.9, first paragraph p.8; not collated with the published edition

**E09 — HK22.** Supply local continuous lifting for the actual Aut(V0) orbit map on the Frobenius-compatible tensor-line embeddings, with the required topology and all defining tensors preserved. Ambient GL(H) sections alone do not establish this input. Keep that lifting theorem as an unresolved supplier contract. HK22 v5 Theorem2.11 proof p.9 uses a section for the ambient GL(H) orbit map to assert a factorization through Aut(V_0). The displayed construction supplies no condition forcing the ambient lift to preserve the defining tensors. The diagonal-subgroup matrix control verifies this missing implication; it does not refute actual local lifting. The actual automorphism-orbit lifting contract remains open. This confirms a proof gap in v5 only. Locator: arXiv2208.01069v5, proof of Theorem2.11, factorization diagram p.9; not collated with the published edition

**E10 — KZ.** Use u⁻¹ w σ(u) as u varies in the Iwahori–Weyl group. The opposite inverse-g convention defines the same relation. Independently read both public preprints and checked the identity-class counterexample. This is a local notation defect, with the theorem unchanged. Locator: §2.2.2, arXiv:2103.09945v2 p.9 and current Harvard author PDF p.8; final Annals text not collated.

The bounded Kisin–Zhou author-copy comparison uses [the current Harvard PDF](https://people.math.harvard.edu/~kisin/dvifiles/l-independence.pdf), SHA-256 `8ed2e99abef2d667da70a46a2f846d4dbf94fed4c01504a13077380f7275b612`, §§2.2.1–2.2.3 pp.8–9. The arXiv version has §2.2.3 on p.10. Both notation corrections are confined to these copies; the final Annals text is uncollated.
