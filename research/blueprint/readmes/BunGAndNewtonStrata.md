# Reductive bundles, B(G) and Newton strata

The Fargues–Fontaine curve turns a Frobenius module into a bundle. With a connected reductive structure group, this construction links the arithmetic classification of isocrystals to a moduli stack whose points are Newton classes, whose stabilizers include positive Banach–Colmez spaces, and whose local charts parametrize filtered extensions. The purpose of this roadmap is to build that link with its tensor structures, invariant maps and topology intact.

The stages cover algebraic G-isocrystals and torsors (BG0), integral Kottwitz and rational Newton invariants (BG1), the stack and uniformization (BG2:uniformization), its Artin smoothness (BG2:smooth-Artin), Newton strata and flag pullbacks (BG3), and filtered charts (BG4). BG2 is the aggregate of its two sublayers. VectorBundlesAndIsocrystals supplies the linear theory; RelativeFarguesFontaine supplies the curve and lattice patching; ReductiveGroups supplies general group theory. GeometricSatakeAndFusion supplies loop and Schubert geometry, VStackSheavesAndLisseCategories supplies Artin formalism and the Jacobian criterion, and IgusaVarietiesAndTorsionConcentration supplies the unitary PEL input for the specific flag dimension comparison.

## Conventions and reusable foundations

Let E be a nonarchimedean local field with residue field F_q, π a uniformizer, and L its completed maximal unramified extension. Choose an algebraic closure k of F_q. Frobenius σ is arithmetic q-Frobenius and fixes π. In mixed characteristic L is the fraction field of the ramified Witt vectors of k; when E=Q_p this agrees with Mathlib's WittVector.Isocrystal coefficient field. The p-adic statements of the routed papers retain E=Q_p or their explicitly stated p-adic extensions. Statements requiring a reductive integral model, a quasi-split form, a minuscule cocharacter or an unramified restriction of scalars retain those hypotheses.

The representation category Rep_E(G) means finite-dimensional rational algebraic-group representations. Tau Ceti already supplies FGPointRepresentationCat, its rigid symmetric monoidal equivalence with finite comodules and the field-valued Tannakian reconstruction of algebra-valued points. A representation of the abstract group G(E) is insufficient. Exact tensor functors preserve bundle short exact sequences, tensor products, the unit and duals. Isomorphisms are tensor natural isomorphisms, not just identifications of a faithful vector space. The relative analytic reconstruction theorem is an additional assertion.

The slope protorus D has character group Q. A rank-one isocrystal with Frobenius π^m has isocrystal slope m and produces O(−m). For dominant Newton vectors the bundle convention is ν_bundle=w₀(−ν_isocrystal); the first Chern invariant is −κ. For GL_n we order slopes in decreasing order and compare partial sums with equal total. Dominance uses positive **coroots** in a rational cocharacter space.

We use b′=g b σ(g)⁻¹ for sigma conjugacy. The inverse-g convention in several sources gives the same quotient. The representative Kottwitz map takes values in π₁(G)_I; the class invariant takes values in the full Galois coinvariants π₁(G)_Γ. Rational averaging relates κ⊗1 to ν, and loses integral torsion. The order on B(G) fixes κ and increases dominant ν. GIZ26 v3 Theorem7.18 (pp.51–53), together with the schematic order comparison, supplies the topology in both characteristics. Its topology satisfies [b]≤[b′] exactly when E_b′ is in the closure of E_b; a basic point generalizes to more unstable points in its κ fibre. A rational Newton orbit need not have an E-rational representative inside G. Its central morphism inside J_b does descend for every b.

For the bundle moduli, tildeJ_b is the full automorphism v-group. Its positive Banach–Colmez kernel has dimension ⟨2ρ,ν_b⟩; the stratum has the negative dimension. The chart uses the opposite extension filtration and negative-slope extension spaces. The framed chart is not an absolute diamond, although its punctured complement is locally spatial and its map to the point is representable in locally spatial diamonds. The chart quotient is an Artin v-stack. These absolute and relative assertions are distinct. For ℓ-cohomological assertions fix a prime ℓ≠p. The separate finite-coefficient curve comparison treats p-torsion by tilting and Artin–Schreier theory.

The existing upstream [ReductiveGroups Part II RG2.1.5](https://github.com/TauCetiProject/TauCetiRoadmap/blob/201bcaee1f4014c91897d50cdb7631fc6d6a6d71/TauCetiRoadmap/ReductiveGroupsPartII/README.md#rg215-arithmetic-invariants-π₁-z-extensions-and-the-kottwitz-homomorphism) supplies integral π₁, its Galois and inertia-coinvariant APIs, generic z-extensions, their existence, central lattice exactness and representative Kottwitz homomorphisms. These are imported; BG owns the sigma-class invariants and B-set consequences. The remaining induced-torus resolution and canonical maximal-torus/inner-twist comparison refinements are specified in G01/G02. The algebraic BG0/BG1 classification uses no analytic RF4 patching. The whole-stack Artin proof uses uniformization, open Schubert cells and VS0, and the chart proof consumes VS1.

The abelianized Weil construction is restricted to the stated p-adic setting. Its discrete coefficient points are taken in L^sep with the natural Weil action, including inertia; L itself is insufficient. For isocrystal slope λ, A_λ=End_Φ(D_λ) has arithmetic Brauer invariant −λ. The bundle has slope −λ; right-module Morita uses Hom(E_b,E) with precomposition and inverse M⊗_A E_b. FS’s Hom(E,E_b) convention uses left modules. The one-third test detects the sign; one-half does not.

## Stage targets

The declarations below specify definitions, APIs, proof chains and discriminating tests. Every implementation status is unchecked. All 98 reviewed target IDs are retained. This revision is partial: exact supplier proof interiors, comparison interiors and full geometric Lean signatures remain open. The affine filtered splitting, coefficient-family arc-descent and source-version qualifications are now explicit; their concrete supplier interfaces still require work. No stage is closed.

| Stage | Planned declarations | Planets |
|---|---:|---:|
| BunGAndNewtonStrata:BG0 | 17 | 6 |
| BunGAndNewtonStrata:BG1 | 35 | 5 |
| BunGAndNewtonStrata:BG2 | 23 | 0 |
| BunGAndNewtonStrata:BG2:smooth-Artin | 3 | 2 |
| BunGAndNewtonStrata:BG2:uniformization | 20 | 6 |
| BunGAndNewtonStrata:BG3 | 15 | 6 |
| BunGAndNewtonStrata:BG4 | 8 | 4 |

BG2 has no duplicated declarations: its uniformization and Artin sublayers jointly realize its targets.

## BG0 — Torsors and isocrystals with reductive structure

Construct the rational tensor descriptions and the sigma-conjugacy quotient. Identify the algebraic centralizer by descent from its Newton Levi, then build twisting, decency and family interfaces. Keep the algebraic point stabilizer separate from full curve-bundle automorphisms.

<a id="g-bundle"></a>

### G-bundles as exact tensor functors

**Definition: TauCeti.BunG.GBundle.** For a sousperfectoid E-space X and connected reductive G/E, a G-bundle is an exact E-linear tensor functor from finite rational representations Rep_E(G) to finite locally free bundles on X. Arrows are tensor natural isomorphisms. Exactness means preservation of bundle short exact sequences, not an arbitrary functor or abstract action of G(E).

**Hypotheses.** Global conventions in the reader apply; additional restrictions are stated in the contract.

**Prerequisites.** [ReductiveGroups#layer-1-representations--comodules](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ReductiveGroups/README.md#layer-1-representations--comodules); [VectorBundlesAndIsocrystals:VB1](../../../content/campaign/VectorBundlesAndIsocrystals/README.md); [CategoryTheory.Functor.Monoidal](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/CategoryTheory/Monoidal/Functor.lean); [TauCeti.FGPointRepresentationCat](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Algebra/AlgebraicGroup/Representation/Comodule/Equivalence.lean); [TauCeti.FGPointRepresentationCat.instRigidCategory](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Algebra/AlgebraicGroup/Representation/Comodule/Monoidal.lean); [TauCeti.ExactStructure](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/CategoryTheory/Exact/ExactStructure.lean); [TauCeti.ExactStructure.IsConflationExact](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/CategoryTheory/Exact/Functor.lean); [CategoryTheory.Functor.Linear](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/CategoryTheory/Linear/LinearFunctor.lean); [CategoryTheory.Functor.Braided](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/CategoryTheory/Monoidal/Braided/Basic.lean); [CategoryTheory.NatTrans.IsMonoidal](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/CategoryTheory/Monoidal/NaturalTransformation.lean).

**Proof/construction.** (1) Use the rational representation category supplied by ReductiveGroups and the exact tensor category of vector bundles supplied by VB1. (2) Construct the groupoid by retaining tensor isomorphisms and the specified exact structure.

**API.**

| Declaration | Role | Contract |
|---|---|---|
| TauCeti.BunG.GBundle.trivial | constructor | The standard fibre functor V↦V⊗_E O_X defines the trivial G-bundle. |
| TauCeti.BunG.GBundle.evaluate | projection | For each rational representation V, evaluate a G-bundle to a bundle of rank dim_E V; tensor and dual comparisons are natural. |
| TauCeti.BunG.GBundle.tensorIso | characterisation | An isomorphism consists of invertible natural maps preserving the unit and tensor constraints. |
| TauCeti.BunG.GBundle.pullback | functoriality | For f:Y→X, bundle pullback gives f* on G-bundles, with coherent identity and composition isomorphisms. |
| TauCeti.BunG.GBundle.tensorIso_ext | extensionality | Two tensor natural isomorphisms are equal if their components agree on every finite rational representation. |

**Discriminating unit tests.**

- **TauCeti.BunG.GBundle.testGL1** (compatibility): For G=G_m, evaluation at the standard character identifies G-bundles with line bundles.
- **TauCeti.BunG.GBundle.testTrivial** (degenerate): For G=1 the G-bundle groupoid has one object up to a unique isomorphism.
- **TauCeti.BunG.GBundle.testNoFaithfulChoice** (non-example): For GL_2 the standard and standard-plus-determinant faithful realizations recover isomorphic torsors; independent unrelated bundles do not define a tensor functor.

**Uses.** FS III.1-III.5: Evaluation is the interface for HN theory, Isom sheaves and inner twisting. LZ17 Corollary4.9: An exact rational tensor functor produces the de Rham torsor.

**Acceptance.** GL_n gives rank-n vector bundles and their isomorphisms.

**Sources.** [Geometrization of the local Langlands correspondence](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), After III.1.1 p.88. The cited passage supplies the stated contract; qualifications and source corrections are retained in the node.

**Lean formulation.** typed-category-interface; Native exact E-linear symmetric tensor data and monoidal natural isomorphisms are elaborated over specified structured categories, with identity/composition coherence and six categorical controls. These restricted interfaces do not supply the actual analytic bundle or general-E isocrystal categories, the full named API, or the geometric reconstruction tests. Those obligations remain G08; no arbitrary geometry carrier or unspecified proposition is introduced. Full carrier obligations: G08.

**Atlas planet:** G-bundle.

<a id="g-torsors-three-descriptions"></a>

### Tannakian description of analytic torsors

**Theorem: TauCeti.BunG.GTorsorsThreeDescriptions.** For X sousperfectoid over E and reductive G/E, geometric étale-locally trivial G-torsors, étale sheaf G-torsors, and G-bundles are naturally equivalent categories. Hence their isomorphism classes identify with H¹_et(X,G). The scheme version is fpqc/fppf, with étale comparison for smooth G; do not transplant a scheme statement to an arbitrary adic space.

**Hypotheses.** Global conventions in the reader apply; additional restrictions are stated in the contract.

**Prerequisites.** [G-bundles as exact tensor functors](#g-bundle); [AlgebraicModuliForArithmeticGeometry:R09.3](../../../content/campaign/AlgebraicModuliForArithmeticGeometry/README.md); [ReductiveGroups#layer-7-structure-theory](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ReductiveGroups/README.md#layer-7-structure-theory); [CategoryTheory.Equivalence](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/CategoryTheory/Equivalence.lean); [TauCeti.Tannaka.fgPointTensorIsoEquiv](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Algebra/AlgebraicGroup/Representation/Tannaka/Equivalence.lean).

**Proof/construction.** (1) Apply SW19.5.2 in the sousperfectoid setting; sections and associated bundles give the first two functors. (2) Recover the torsor from the tensor functor using the regular representation as a filtered colimit; exactness gives faithful flatness. (3) Use smooth torsor descent for the fpqc/étale comparison on schemes.

**Acceptance.** GL_n frame bundles and G_m line bundles. The 2020 SW scheme theorem is19.5.1; the adic theorem is19.5.2.

**Sources.** [Geometrization of the local Langlands correspondence](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), III.1.1 p.88. The cited passage supplies the stated contract; qualifications and source corrections are retained in the node.; [Berkeley Lectures on p-adic Geometry](https://www.math.uni-bonn.de/people/scholze/Berkeley.pdf), Theorems19.5.1 and19.5.2, printed178-180. The cited passage supplies the stated contract; qualifications and source corrections are retained in the node.

**Lean formulation.** full-signature-omitted; The suggested file contains a name-by-name register. A registered omission is not an elaborated theorem or a definition; the numerical tests and point stabilizer equations are expressly restricted cores. Full carrier obligations: G08.

<a id="structure-group-and-tensor-descent"></a>

### Structure group and tensor descent

**Theorem: TauCeti.BunG.StructureGroupAndTensorDescent.** For a morphism f:G→H of connected reductive E-groups, extending a G-bundle is precomposition by restriction Rep(H)→Rep(G); it agrees with contracted product of torsors, commutes with base change and respects identity/composition. Tensor isomorphisms descend effectively for étale covers. Reconstruction by any faithful rational representation with its defining tensors gives the same torsor.

**Hypotheses.** Global conventions in the reader apply; additional restrictions are stated in the contract.

**Prerequisites.** [Tannakian description of analytic torsors](#g-torsors-three-descriptions); [ReductiveGroups#layer-1-representations--comodules](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ReductiveGroups/README.md#layer-1-representations--comodules); [AlgebraicModuliForArithmeticGeometry:R09.3](../../../content/campaign/AlgebraicModuliForArithmeticGeometry/README.md).

**Proof/construction.** (1) Transport contracted products and effective smooth torsor descent across the comparison. (2) Tensor restriction composes contravariantly; torsor extension composes covariantly. (3) Use the regular representation reconstruction to compare faithful presentations.

**Acceptance.** Determinant GL_n→G_m gives the determinant line. No use of RF4 patching occurs in this node.

**Sources.** [Berkeley Lectures on p-adic Geometry](https://www.math.uni-bonn.de/people/scholze/Berkeley.pdf), Proof19.5.2 printed179-180. The cited passage supplies the stated contract; qualifications and source corrections are retained in the node.; [Rigidity and a Riemann-Hilbert correspondence for p-adic local systems](https://arxiv.org/pdf/1602.06282v3), Corollary4.9 printed33. The cited passage supplies the stated contract; qualifications and source corrections are retained in the node.

**Lean formulation.** full-signature-omitted; The suggested file contains a name-by-name register. A registered omission is not an elaborated theorem or a definition; the numerical tests and point stabilizer equations are expressly restricted cores. Full carrier obligations: G08.

<a id="g-isocrystals-and-B-of-G"></a>

### G-isocrystals

**Definition: TauCeti.BunG.GIsocrystal.** A G-isocrystal over L=breve E is an exact E-linear tensor functor Rep_E(G)→Isoc_E, with tensor isomorphisms as arrows. After trivializing its underlying L-fibre functor, Frobenius is bσ for b∈G(L). Steinberg triviality over L permits such a trivialization; it is a choice, not part of the definition.

**Hypotheses.** Global conventions in the reader apply; additional restrictions are stated in the contract.

**Prerequisites.** [VectorBundlesAndIsocrystals:VB0/tensor-and-dual-slopes](../../../content/campaign/VectorBundlesAndIsocrystals/README.md); [VectorBundlesAndIsocrystals:VB0/isocrystal-category-and-standard-block](../../../content/campaign/VectorBundlesAndIsocrystals/README.md); [ReductiveGroups#layer-1-representations--comodules](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ReductiveGroups/README.md#layer-1-representations--comodules); [ReductiveGroups#layer-7-structure-theory](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ReductiveGroups/README.md#layer-7-structure-theory); [WittVector.Isocrystal](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/WittVector/Isocrystal.lean); [CategoryTheory.Functor.Monoidal](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/CategoryTheory/Monoidal/Functor.lean); [TauCeti.FGPointRepresentationCat](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Algebra/AlgebraicGroup/Representation/Comodule/Equivalence.lean); [TauCeti.FGPointRepresentationCat.instRigidCategory](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Algebra/AlgebraicGroup/Representation/Comodule/Monoidal.lean); [TauCeti.ExactStructure](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/CategoryTheory/Exact/ExactStructure.lean); [TauCeti.ExactStructure.IsConflationExact](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/CategoryTheory/Exact/Functor.lean); [CategoryTheory.Functor.Linear](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/CategoryTheory/Linear/LinearFunctor.lean); [CategoryTheory.Functor.Braided](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/CategoryTheory/Monoidal/Braided/Basic.lean); [CategoryTheory.NatTrans.IsMonoidal](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/CategoryTheory/Monoidal/NaturalTransformation.lean); [TauCeti.FGComoduleCat.scalarExtensionMonoidalFunctor](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Algebra/Coalgebra/Comodule/Finite/ScalarExtension/Monoidal.lean); [TauCeti.Comodule.pointsAction](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Algebra/AlgebraicGroup/Representation/PointsAction.lean); [TauCeti.Tannaka.scalarExtensionComponent](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Algebra/AlgebraicGroup/Representation/Tannaka/Monoidal.lean); [TauCeti.Tannaka.fgPointTensorIsoEquiv](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Algebra/AlgebraicGroup/Representation/Tannaka/Equivalence.lean); [TauCeti.Comodule.rTensor_comp_endOfPoint](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Algebra/Coalgebra/Comodule/PointsAction.lean); [TauCeti.Comodule.baseChange_comp_endOfPoint](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Algebra/Coalgebra/Comodule/PointsAction.lean); [TauCeti.Comodule.endOfPoint_tensor](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Algebra/Coalgebra/Comodule/PointsAction.lean); [TauCeti.Comodule.endOfPoint_trivial](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Algebra/Coalgebra/Comodule/PointsAction.lean).

**Proof/construction.** (1) Use the exact tensor category of finite E-isocrystals from VB0. (2) Apply the reductive fibre-functor/torsor dictionary over L and Steinberg vanishing; changing the trivialization changes b by sigma conjugation. (3) For the trivialized presentation, linearize Φ by inverse coefficient Frobenius, use native Tannakian reconstruction on the fixed finite-comodule fibre functor, and reconstruct all tensor arrows. This does not instantiate VB0’s untrivialized exact category or establish Steinberg triviality.

**API.**

| Declaration | Role | Contract |
|---|---|---|
| TauCeti.BunG.GIsocrystal.ofRepresentative | constructor | The object from b sends ρ to (Vρ⊗_E L,ρ(b)σ). |
| TauCeti.BunG.GIsocrystal.forget | projection | Forget Frobenius to the underlying L-fibre functor; retain its tensor constraints. |
| TauCeti.BunG.GIsocrystal.changeTrivialization | equivalence | A change g of trivialization identifies the representatives b and g b σ(g)^−1. |
| TauCeti.BunG.GIsocrystal.map | functoriality | A group morphism carries b to f(b) and agrees with precomposition of rational representations. |
| TauCeti.BunG.RepresentativeTensor.coefficientSigma | constructor | For fields E,L, a commutative Hopf E-algebra H and an E-algebra automorphism σ of L, coefficient Frobenius on L⊗_E M is the invertible σ-semilinear map σ⊗id_M, for every native finite rational H-comodule M. |
| TauCeti.BunG.RepresentativeTensor.coefficientSigma_tmul | characterisation | Coefficient Frobenius sends a⊗m to σ(a)⊗m; the representation factor remains fixed. |
| TauCeti.BunG.RepresentativeTensor.frobenius | constructor | For a native convolution point b:H→L, compose σ⊗id_M with Tau Ceti’s native point action ρ_M(b), obtaining an invertible σ-semilinear map on L⊗_E M. |
| TauCeti.BunG.RepresentativeTensor.frobenius_apply | characterisation | The component formula is Φ_b,M(x)=ρ_M(b)((σ⊗id_M)(x)), with coefficient Frobenius applied first. |
| TauCeti.BunG.RepresentativeTensor.tensorCombine | compatibility | Combine x∈L⊗_E M and y∈L⊗_E N using the inverse native base-change distribution isomorphism on x⊗_L y. The result lies in L⊗_E(M⊗_E N). |
| TauCeti.BunG.RepresentativeTensor.Data | constructor | Trivialized Frobenius data on the fixed native scalar-extension fibre functor consist of invertible σ-semilinear components on every finite rational comodule, natural for comodule maps, taking a⊗1 in the tensor unit to σ(a)⊗1 and preserving tensorCombine. These are explicit equations; this presentation is not the untrivialized exact G-isocrystal definition. |
| TauCeti.BunG.RepresentativeTensor.ofRepresentative | constructor | The family Φ_b,M=ρ_M(b)(σ⊗id_M) satisfies the naturality, unit and tensor equations of Data. Its underlying L-fibre functor is the native finite-comodule scalar-extension functor. |
| TauCeti.BunG.RepresentativeTensor.linearized | constructor | Compose every component of Data with inverse coefficient Frobenius to obtain a native tensor automorphism of finite-comodule scalar extension. |
| TauCeti.BunG.RepresentativeTensor.linearized_component | characterisation | The transported component of the linearized tensor automorphism at M sends x to Φ_M((σ⊗id_M)⁻¹x). |
| TauCeti.BunG.RepresentativeTensor.reconstructedPoint | compatibility | Apply the inverse of Tau Ceti’s native field-valued Tannakian point/tensor-automorphism equivalence to the linearized family, reconstructing a genuine E-algebra point H→L. |
| TauCeti.BunG.RepresentativeTensor.equivalence | equivalence | Representative points and trivialized Frobenius families are equivalent, with inverse reconstructedPoint. The inverse laws recover the point and the entire family, rather than only one faithful representation. |
| TauCeti.BunG.RepresentativeTensor.Iso | constructor | An arrow between two trivialized families is a native tensor automorphism η of scalar extension satisfying η_MΦ_M=Ψ_Mη_M on every finite rational comodule. |
| TauCeti.BunG.RepresentativeTensor.conjugatorEquiv | equivalence | All points g with c=g b σ(g)⁻¹ are equivalent to the Frobenius-compatible tensor arrows from ofRepresentative b to ofRepresentative c. The forward arrow is native Tannakian action by g; the inverse reconstructs g from the tensor arrow. |
| TauCeti.BunG.RepresentativeTensor.changeTrivialization | equivalence | For b,g, the native tensor action by g gives a Frobenius-compatible arrow from the family of b to the family of g b σ(g)⁻¹. |
| TauCeti.BunG.RepresentativeTensor.changeTrivialization_component | characterisation | The component of that arrow on L⊗_E M is exactly the native point action ρ_M(g), without an extra coefficient Frobenius. |
| TauCeti.BunG.RepresentativeTensor.isoComp | functoriality | Compose a tensor arrow f:F→G with g:G→K by multiplying their native tensor automorphisms as g·f. This corresponds to the later conjugator on the left. |
| TauCeti.BunG.RepresentativeTensor.isoRefl | constructor | The identity native tensor automorphism is the identity arrow on each trivialized Frobenius family. |
| TauCeti.BunG.RepresentativeTensor.isoInv | constructor | The inverse native tensor automorphism reverses a Frobenius-compatible arrow. Together with isoComp and isoRefl these give a native Groupoid on Data. |

**Discriminating unit tests.**

- **TauCeti.BunG.GIsocrystal.testGLn** (compatibility): For GL_n with E=Q_p this agrees with finite-dimensional WittVector.Isocrystal over k=bar F_p, after fixing the coefficient identification.
- **TauCeti.BunG.GIsocrystal.testUnit** (degenerate): b=1 gives standard Frobenius on each representation.
- **TauCeti.BunG.GIsocrystal.testTensorSlope** (computation): For G_m representatives π^a and π^b, tensoring has slope a+b and duality has slope −a.

- **TauCeti.BunG.RepresentativeTensor.testSemilinearity** (compatibility): For every representation M and a∈L, Φ_b,M(a x)=σ(a)Φ_b,M(x), rather than aΦ_b,M(x).
- **TauCeti.BunG.RepresentativeTensor.testCoefficientUnit** (degenerate): For b=1 and every native finite rational comodule, Φ_1,M(a⊗m)=σ(a)⊗m.
- **TauCeti.BunG.RepresentativeTensor.testTensorFamily** (compatibility): The component on M⊗N sends tensorCombine(x,y) to tensorCombine(Φ_M(x),Φ_N(y)) for arbitrary M,N.
- **TauCeti.BunG.RepresentativeTensor.testNotLinear** (non-example): If σ(a)≠a for some a∈L, no L-linear map on the scalar-extended tensor-unit representation agrees everywhere with its Frobenius component.
- **TauCeti.BunG.RepresentativeTensor.testIntertwiner** (compatibility): For b′=g b σ(g)⁻¹, the point action ρ_M(g) intertwines Φ_b,M and Φ_b′,M on every M.
- **TauCeti.BunG.RepresentativeTensor.testArrowComposition** (compatibility): For conjugators g:b→c and h:c→d, the composite tensor arrow acts as ρ_M(h g) on every representation; reversing the point multiplication order fails in noncommutative cases.
- **TauCeti.BunG.RepresentativeTensor.testReconstruction** (compatibility): Reconstructing a point from an arbitrary Data family and applying ofRepresentative recovers that entire family, including its coherence fields.

**Uses.** FS III.2.2: Provides representatives for geometric classification. IG.0 and ET.5: Supplies the algebraic structured isocrystal without analytic uniformization inputs.

**Acceptance.** Underlying vector spaces are over L, not E.

**Sources.** [Geometrization of the local Langlands correspondence](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), III.2.1 p.89. The cited passage supplies the stated contract; qualifications and source corrections are retained in the node.; [Berkeley Lectures on p-adic Geometry](https://www.math.uni-bonn.de/people/scholze/Berkeley.pdf), Definition22.4.1 printed210 (PDF220). Independently checked in the recorded public source version on 2026-10-07; the node retains the stated scope and conventions.

**Lean formulation.** typed-native-trivialized-frobenius-family; Over fields E,L, a commutative Hopf E-algebra H and an E-algebra automorphism σ of L, RepresentativeTensor uses the actual native finite rational comodule category and scalar-extension fibre functor. It types σ-semilinear Frobenius components, explicit naturality/unit/tensor equations, linearization and native Tannakian reconstruction, a Groupoid of tensor intertwiners and all twisted conjugator arrows. These are the trivialized presentation, not another definition of linear isocrystals. VB0’s structured untrivialized exact category, its general local coefficients and the Steinberg trivialization comparison are still G08; the original full GIsocrystal API and Witt GL_n/slope tests remain unfulfilled. Full carrier obligations: G08.

**Atlas planet:** G-isocrystal.

<a id="sigma-conjugacy-quotient"></a>

### Kottwitz set B(G)

**Definition: TauCeti.BunG.SigmaClass.** B(G)=G(L)/~ where b~bprime iff bprime=g b σ(g)^−1 for some g∈G(L). Here σ is arithmetic q-Frobenius fixing E and its uniformizer. This orbit quotient is the set of isomorphism classes of G-isocrystals; the groupoid itself retains automorphisms.

**Hypotheses.** Global conventions in the reader apply; additional restrictions are stated in the contract.

**Prerequisites.** [G-isocrystals](#g-isocrystals-and-B-of-G); [Subgroup](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Group/Subgroup/Defs.lean); [MulEquiv](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Group/Equiv/Defs.lean); [TauCeti.AlgHom.mapValue](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Algebra/AlgebraicGroup/FunctorOfPoints.lean); [TauCeti.MultiplicativeGroup.pointsMulEquiv_mapValue](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Algebra/AlgebraicGroup/MultiplicativeGroup/Basic.lean); [CategoryTheory.Groupoid](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/CategoryTheory/Groupoid.lean); [CategoryTheory.Aut.Aut_mul_def](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/CategoryTheory/Endomorphism.lean); [WittVector.exists_frobenius_solution_fractionRing](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/WittVector/FrobeniusFractionField.lean); [WittVector.FractionRing.frobenius](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/WittVector/Isocrystal.lean); [TauCeti.FGComoduleCat.scalarExtensionMonoidalFunctor](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Algebra/Coalgebra/Comodule/Finite/ScalarExtension/Monoidal.lean); [TauCeti.Comodule.pointsAction](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Algebra/AlgebraicGroup/Representation/PointsAction.lean); [TauCeti.Tannaka.scalarExtensionComponent](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Algebra/AlgebraicGroup/Representation/Tannaka/Monoidal.lean); [TauCeti.Tannaka.fgPointTensorIsoEquiv](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Algebra/AlgebraicGroup/Representation/Tannaka/Equivalence.lean).

**Proof/construction.** (1) Check that twisted conjugation is a group action; its orbit relation is reflexive, symmetric and transitive. (2) Transport the change-of-trivialization formula from G-isocrystals to identify the quotient.

**API.**

| Declaration | Role | Contract |
|---|---|---|
| TauCeti.BunG.SigmaClass.mk | constructor | Send b∈G(L) to its sigma class. |
| TauCeti.BunG.SigmaClass.mk_eq_iff | characterisation | Two representative classes are equal precisely when a sigma conjugator exists. |
| TauCeti.BunG.SigmaClass.map | functoriality | A σ-compatible group homomorphism gives B(G)→B(H), with identity and composition laws. |
| TauCeti.BunG.SigmaClass.lift | universal-property | Every function on G(L) invariant under twisted conjugation descends uniquely to B(G). |
| TauCeti.BunG.SigmaClass.affinePoints | compatibility | For a commutative coordinate Hopf algebra H over E and an E-algebra automorphism σ of L, specialize the quotient to the native convolution group of E-algebra maps H→L. Arithmetic B(G) uses the actual coefficient field and Frobenius supplied by VB0. |
| TauCeti.BunG.SigmaClass.equiv | equivalence | A Frobenius-compatible group equivalence induces an equivalence of sigma-class quotients, carrying the class of b to the class of its image. |
| TauCeti.BunG.SigmaClass.representativeGroupoid | constructor | Objects are elements b of the coefficient point group; arrows b→c are all g satisfying c=g b σ(g)^−1. The composite of g:b→c and h:c→d has conjugator h g, and inverses use g^−1. |
| TauCeti.BunG.SigmaClass.representative_hom_iff | characterisation | A representative Hom is nonempty exactly when the two quotient classes agree; this does not make it a singleton. |
| TauCeti.BunG.SigmaClass.representativeAut | compatibility | The native category-theoretic automorphism group of representative b identifies multiplicatively with its sigma-stabilizer. Mathlib’s Aut multiplication reverses categorical composition, matching the usual stabilizer multiplication. |
| TauCeti.BunG.SigmaClass.gmEquiv | compatibility | The native Laurent-polynomial Hopf points equivalence identifies the split G_m sigma quotient with the quotient on L×, for any E-algebra automorphism of L. |
| TauCeti.BunG.SigmaClass.wittGmSlopeEquiv | equivalence | For prime p and an algebraically closed field k of characteristic p, the units of FractionRing(WittVector p k), with native Witt Frobenius, have sigma-class quotient equivalent to Z. This is a concrete p-typical specialization, not the general-E supplier theorem. |
| TauCeti.BunG.SigmaClass.wittGmSlopeEquiv_uniformizer | characterisation | In that Witt specialization, the class of p^m maps to m, for every integer m; the normalized valuation is Frobenius-invariant. |
| TauCeti.BunG.RepresentativeTensor.representativeFunctor | functoriality | Send each native twisted-conjugacy representative b to its whole Frobenius tensor family and every conjugator g to its native Tannakian tensor action. |
| TauCeti.BunG.RepresentativeTensor.reconstructionFunctor | functoriality | Reconstruct both the native coefficient point and the actual conjugator of each Frobenius-compatible tensor arrow. Identity and composition agree with the representative groupoid. |
| TauCeti.BunG.RepresentativeTensor.categoryEquivalence | equivalence | The native representative groupoid is equivalent to the Groupoid of trivialized Frobenius families on finite rational comodules. Comparison with untrivialized exact G-isocrystals still requires VB0’s structured category and Steinberg triviality. |

**Discriminating unit tests.**

- **TauCeti.BunG.SigmaClass.testGL1** (computation): For split G_m, valuation gives B(G_m)≅Z.
- **TauCeti.BunG.SigmaClass.testIdentitySigma** (compatibility): With σ the identity the orbit relation is ordinary conjugacy.
- **TauCeti.BunG.SigmaClass.testCommutative** (non-example): For an abelian group the relation is multiplication by g/σ(g), not equality unless σ is trivial.
- **TauCeti.BunG.SigmaClass.testRepresentativeHom** (compatibility): For representative objects b,c, equality of sigma classes is equivalent to existence of a conjugator arrow.
- **TauCeti.BunG.SigmaClass.testRepresentativeComposition** (compatibility): For arrows g:b→c and h:c→d, composition has conjugator h g; reversing this order is invalid in a noncommutative point group.
- **TauCeti.BunG.SigmaClass.testRepresentativeAutomorphisms** (non-example): With identity Frobenius and representative 1, the automorphism group is the entire point group, rather than the trivial group of a discrete quotient category.
- **TauCeti.BunG.SigmaClass.testGmNativePoints** (compatibility): The split G_m quotient equivalence sends a class represented by an actual Laurent-polynomial algebra map to the class of its corresponding unit.
- **TauCeti.BunG.SigmaClass.testWittGL1** (computation): For the native Witt fraction field and every integer m, the class of p^m has slope m.
- **TauCeti.BunG.SigmaClass.testWittGL1Unit** (degenerate): The class of 1 in the Witt units quotient has slope zero.
- **TauCeti.BunG.SigmaClass.testWittGL1Distinct** (non-example): The classes of 1 and p in the Witt units quotient differ; replacing Frobenius or dropping the valuation normalization would miss this control.

- **TauCeti.BunG.RepresentativeTensor.testRepresentativeFamily** (compatibility): The forward category equivalence sends b to the family whose component on every native representation is ρ_M(b)(σ⊗id_M).

**Uses.** KMPS1.1 and GLX2.2: Provides the invariant quotient used by acceptable classes. ET.5: Imports the structured local classes and algebraic centralizers.

**Acceptance.** Both g b σ(g)^−1 and g^−1 b σ(g) conventions give the same orbit relation.

**Sources.** [Cordial elements and dimensions of affine Deligne-Lusztig varieties](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/5A27DBF48CAEF6DA56A313061848574C/S205050862100010Xa.pdf/cordial-elements-and-dimensions-of-affine-delignelusztig-varieties.pdf), Section2.1 p.4. The cited passage supplies the stated contract; qualifications and source corrections are retained in the node. Also [FS DefinitionIII.2.1/TheoremIII.2.2 and III.2.4.1, pp.89–90](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf): the representative quotient and integral torus valuation are compared with the tensor description.

**Lean formulation.** typed-affine-point-and-tensor-groupoid-interface; The native Hopf-point quotient and representative groupoid now compare by an actual category-equivalence signature with the whole trivialized Frobenius tensor family on finite rational comodules. Its arrows reconstruct the actual conjugator by native Tannaka duality. G_m and Witt-unit controls remain concrete. The untrivialized exact tensor G-isocrystal comparison and actual general local coefficient/Frobenius instantiation remain G08; this does not supply analytic bundle or v-stack signatures. Full carrier obligations: G08.

**Atlas planet:** Kottwitz set.

<a id="sigma-centralizer-J-b"></a>

### Algebraic sigma-centralizer

**Construction: TauCeti.BunG.SigmaCentralizer.** For b∈G(L), J_b is the reductive E-group representing A↦{g∈G(A⊗_E L):g b=b σ(g)}. Its L-base change is the centralizer M_b of ν_b. It is an inner form of the corresponding Levi in the quasi-split inner form G*, and is an inner form of G* precisely when b is basic. Descent uses the semilinear action Ad(b)σ on M_b.

**Hypotheses.** Global conventions in the reader apply; additional restrictions are stated in the contract.

**Prerequisites.** [G-isocrystals](#g-isocrystals-and-B-of-G); [Newton and Kottwitz invariants](#newton-and-kottwitz-maps); [ReductiveGroups#layer-7-structure-theory](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ReductiveGroups/README.md#layer-7-structure-theory); [AlgebraicModuliForArithmeticGeometry:R09.3](../../../content/campaign/AlgebraicModuliForArithmeticGeometry/README.md); [TauCeti.ReductiveAffineGroupSchemeCat](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/AlgebraicGeometry/AffineGroupScheme/Reductive.lean); [Subgroup](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Group/Subgroup/Defs.lean); [Existence of decent representatives](#existence-of-decent-representative); [VectorBundlesAndIsocrystals:VB0/endomorphism-division-algebra](../../../content/campaign/VectorBundlesAndIsocrystals/README.md); [VectorBundlesAndIsocrystals:VB0/brauer-invariant-sign](../../../content/campaign/VectorBundlesAndIsocrystals/README.md); [TauCeti.AlgHom.mapValue](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Algebra/AlgebraicGroup/FunctorOfPoints.lean); [Algebra.TensorProduct.map](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/TensorProduct/Maps.lean); [Algebra.TensorProduct.congr](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/TensorProduct/Maps.lean); [TauCeti.FGComoduleCat.scalarExtensionMonoidalFunctor](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Algebra/Coalgebra/Comodule/Finite/ScalarExtension/Monoidal.lean); [TauCeti.Comodule.pointsAction](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Algebra/AlgebraicGroup/Representation/PointsAction.lean); [TauCeti.Tannaka.scalarExtensionComponent](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Algebra/AlgebraicGroup/Representation/Tannaka/Monoidal.lean); [TauCeti.Tannaka.fgPointTensorIsoEquiv](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Algebra/AlgebraicGroup/Representation/Tannaka/Equivalence.lean).

**Proof/construction.** (1) Construct ν_b from the representation slope grading, giving the Levi centralizer after base change. (2) Restrict Ad(b)σ to this centralizer; decency makes descent effective over a finite unramified extension. (3) Use reductive-group descent to represent the fixed-point functor and compare its rational points with tensor automorphisms.

**API.**

| Declaration | Role | Contract |
|---|---|---|
| TauCeti.BunG.SigmaCentralizer.points | characterisation | For every E-algebra A, membership is exactly g b=b σ(g). |
| TauCeti.BunG.SigmaCentralizer.baseChange | compatibility | J_b⊗_E L≅Z_(G_L)(ν_b), with the descended semilinear datum. |
| TauCeti.BunG.SigmaCentralizer.conjugate | equivalence | For bprime=g b σ(g)^−1, h↦g h g^−1 induces J_b≅J_bprime. |
| TauCeti.BunG.SigmaCentralizer.autIsocrystal | equivalence | J_b(E) is the tensor automorphism group of the G-isocrystal defined by b. |
| TauCeti.BunG.SigmaCentralizer.functorOfPoints | functoriality | Retain the whole group-valued functor on commutative E-algebras A. Its coefficient group is the native convolution group of maps H→A⊗_E L; Frobenius acts as id_A⊗σ and b enters through the right tensor factor. An algebra map f:A→B acts by f⊗id_L. |
| TauCeti.BunG.SigmaCentralizer.naturalConjugacy | equivalence | Changing b by g b σ(g)^−1 gives a natural isomorphism of these group-valued functors, whose component conjugates by the image of g in A⊗_E L. Representability and Levi descent remain additional contracts. |
| TauCeti.BunG.SigmaCentralizer.naturalConjugacy_apply | characterisation | At every coefficient E-algebra A, the natural representative-change map sends h to g_A h g_A^−1, where g_A is the image of g in G(A⊗_E L). It uses g_A on both sides, rather than σ(g_A). |
| TauCeti.BunG.RepresentativeTensor.tensorAut | compatibility | The native category-theoretic Aut group of ofRepresentative b identifies multiplicatively with the point sigma-stabilizer {g:g b=b σ(g)}. This is the tensor automorphism comparison on the trivialized presentation; reductive representability of J_b and untrivialized comparison remain additional contracts. |
| TauCeti.BunG.RepresentativeTensor.tensorAut_component | characterisation | Every tensor automorphism has component equal to the native representation action of its reconstructed stabilizer point, for every finite rational comodule. |

**Discriminating unit tests.**

- **TauCeti.BunG.SigmaCentralizer.testTrivial** (degenerate): J_1(E)=G(E).
- **TauCeti.BunG.SigmaCentralizer.testBasicGL2** (computation): For the simple GL_2 slope1/2 block, J_b(E)=A_(1/2)^×; two copies give GL_2(A_(1/2)). For the simple GL_3 slope1/3 block its division algebra has arithmetic invariant −1/3=2/3 mod Z, detecting the sign hidden by the half-slope case.
- **TauCeti.BunG.SigmaCentralizer.testNonbasic** (non-example): For GL_2 slopes0,1, the algebraic J_b is G_m×G_m, while the bundle automorphism v-group also has a positive-slope kernel.
- **TauCeti.BunG.SigmaCentralizer.testCoefficientNaturality** (compatibility): A coefficient map f:A→B sends an H-point by postcomposition with f⊗id_L, without changing the L factor.
- **TauCeti.BunG.SigmaCentralizer.testFixedGroup** (degenerate): For b=1 and every E-algebra A, the centralizer functor is exactly the id_A⊗σ-fixed subgroup of G(A⊗_E L). Arithmetic fixed-field descent to G(A) is a separate theorem.
- **TauCeti.BunG.SigmaCentralizer.testIdentityFrobenius** (non-example): If σ is replaced by the identity and b=1, the value at A is the entire coefficient point group. This control must not be mistaken for arithmetic fixed-field descent.

- **TauCeti.BunG.RepresentativeTensor.testTensorStabilizer** (compatibility): A tensor automorphism reconstructs a point satisfying g b=b σ(g), preserving the correct placement of Frobenius.
- **TauCeti.BunG.RepresentativeTensor.testTensorIdentitySigma** (non-example): At identity coefficient Frobenius and b=1, the tensor automorphism group is the entire native point group, rather than a trivial automorphism group of orbit classes.

**Uses.** FS III.4-III.5: Gives the discrete quotient of bundle automorphisms and pure inner twisting. He21 section2.2: Provides the F-rank used in defect. Kisin17 Lemma4.6.4: Its rational Kottwitz image controls component actions.

**Acceptance.** For b=1, J_b(E)=G(E). For a simple rank-h isocrystal of slope a/h, J_b is the unit group of its endomorphism division algebra A_(a/h), whose arithmetic Brauer invariant is −a/h. Multiplicity m gives GL_m(A_(a/h)); in the linear supplier’s bundle-slope notation A_(a/h)=D_(−a/h).

**Sources.** [Isocrystals with additional structure II](https://people.dm.unipi.it/maffei/didattica/male/lacci/Kottwitz.pdf), Sections4.3–4.4 pp.268–269. The cited passage supplies the stated contract; qualifications and source corrections are retained in the node.; [Mod p points on Shimura varieties of abelian type](https://people.math.harvard.edu/~kisin/dvifiles/lr.pdf?download=1), 1.2.12 printed14. The cited passage supplies the stated contract; qualifications and source corrections are retained in the node. Also [FS ExampleIII.4.4 pp.101–102](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf): the centralizer is the unit group of the isocrystal endomorphism algebra; the arithmetic sign is fixed by VB0.

**Lean formulation.** typed-affine-point-functor-and-tensor-automorphisms; The actual group-valued functor on all commutative E-algebras and natural representative-change isomorphism are typed using native tensor algebras and Hopf points. Native tensor automorphisms of the trivialized Frobenius family now identify multiplicatively with the point sigma-stabilizer, with component formulas on every representation. Reductive representation of this functor, Newton-Levi base change and untrivialized exact G-isocrystal comparison remain omitted. Full carrier obligations: G08.

**Atlas planet:** Sigma-centralizer.

<a id="sigma-centralizer-conjugacy"></a>

### Change of sigma-centralizer representative

**Lemma: TauCeti.BunG.SigmaCentralizerConjugacy.** If bprime=g b σ(g)^−1 then conjugation h↦g h g^−1 induces an E-group isomorphism J_b≅J_bprime and identifies their tensor automorphism actions. The transport is compatible with products of changes of trivialization.

**Hypotheses.** Global conventions in the reader apply; additional restrictions are stated in the contract.

**Prerequisites.** [Algebraic sigma-centralizer](#sigma-centralizer-J-b).

**Proof/construction.** (1) Substitute the twisted-conjugacy equation into the pointwise fixed equation. (2) Apply representability and descent to identify the natural functor isomorphism.

**Acceptance.** The map on J_b(E) uses g, not σ(g), on both sides.

**Sources.** [Honda-Tate theory for Shimura varieties](https://math.berkeley.edu/~swshin/HT.pdf), Section1.1.2 p.6. The cited passage supplies the stated contract; qualifications and source corrections are retained in the node.

**Lean formulation.** typed-natural-point-functor-isomorphism; The native affine point-functor isomorphism now retains naturality on all coefficient E-algebras, in addition to the stabilizer equivalence. The reductive representing-group isomorphism and its tensor automorphism action still require the Newton/descent and concrete isocrystal suppliers. Full carrier obligations: G08.

<a id="decent-representative"></a>

### Decent representative

**Definition: TauCeti.BunG.DecentRepresentative.** For a positive integer r and b∈G(L), require rν_b to be integral and (bσ)^r=(rν_b)(π)σ^r in G(L)⋊<σ>. Equivalently b σ(b)⋯σ^(r−1)(b)=(rν_b)(π), exactly r factors. A decent representative admits finite unramified descent; the definition excludes r=0.

**Hypotheses.** Global conventions in the reader apply; additional restrictions are stated in the contract.

**Prerequisites.** [Newton and Kottwitz invariants](#newton-and-kottwitz-maps); [ReductiveGroups#layer-7-structure-theory](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ReductiveGroups/README.md#layer-7-structure-theory).

**Proof/construction.** (1) State the integral slope homomorphism and the semidirect-product equation. (2) Use the fixed equation and slope functoriality for finite unramified descent; source misprint E1 is corrected.

**API.**

| Declaration | Role | Contract |
|---|---|---|
| TauCeti.BunG.DecentRepresentative.mk | constructor | Package b, r>0, integrality of rν_b and the r-factor equation. |
| TauCeti.BunG.DecentRepresentative.equation | projection | Expose the semilinear power equation with the chosen uniformizer. |
| TauCeti.BunG.DecentRepresentative.multiple | compatibility | A decent period r may be replaced by a positive multiple, with the matching integral slope. |
| TauCeti.BunG.DecentRepresentative.finiteDescent | data | Supply the unramified degree-r coefficient field and descended b and Newton map. |

**Discriminating unit tests.**

- **TauCeti.BunG.DecentRepresentative.testRankOne** (computation): b=π^m has period1 and integral Newton point m.
- **TauCeti.BunG.DecentRepresentative.testUnit** (degenerate): b=1 has period1 and zero Newton point.
- **TauCeti.BunG.DecentRepresentative.testPositivePeriod** (non-example): The zero period is excluded, even though its empty-product equality is tautological.

**Uses.** FS V.3.6: Descends the contracting chart action to a finite field. GLX section5.1: Provides the finite-field Newton eigenspaces for fibre functors.

**Acceptance.** Rank-one π^m is1-decent.

**Sources.** [The connected components of affine Deligne-Lusztig varieties](https://link.springer.com/content/pdf/10.1007/s00222-025-01386-1.pdf), Definition2.3 p.819. The cited passage supplies the stated contract; qualifications and source corrections are retained in the node.; [Honda-Tate theory for Shimura varieties](https://math.berkeley.edu/~swshin/HT.pdf), Section1.1.2 equations and decency p.6. The cited passage supplies the stated contract; qualifications and source corrections are retained in the node.

**Lean formulation.** full-signature-omitted; The suggested file contains a name-by-name register. A registered omission is not an elaborated theorem or a definition; the numerical tests and point stabilizer equations are expressly restricted cores. Full carrier obligations: G08.

**Atlas planet:** Decent representative.

<a id="existence-of-decent-representative"></a>

### Existence of decent representatives

**Theorem: TauCeti.BunG.ExistenceOfDecentRepresentative.** Every class of B(G) has a decent representative for some sufficiently divisible positive r. In the mixed-characteristic GLX setting r can be enlarged so G is quasi-split over E_r and the representative has the chosen dominant Newton map.

**Hypotheses.** Global conventions in the reader apply; additional restrictions are stated in the contract.

**Prerequisites.** [Decent representative](#decent-representative); [Kottwitz set B(G)](#sigma-conjugacy-quotient); [ReductiveGroups#layer-7-structure-theory](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ReductiveGroups/README.md#layer-7-structure-theory).

**Proof/construction.** (1) Use the slope cocharacter, a splitting extension and the Kottwitz descent construction. (2) Enlarge r to clear slope denominators and descent periods. (3) Conjugate over E_r to the chosen chamber; dominance here requires the quasi-split base change.

**Acceptance.** For a coprime slope a/h simple block choose a period divisible by h.

**Sources.** [The connected components of affine Deligne-Lusztig varieties](https://link.springer.com/content/pdf/10.1007/s00222-025-01386-1.pdf), Paragraph4 after Definition2.3 p.819. The cited passage supplies the stated contract; qualifications and source corrections are retained in the node.; [Isocrystals with additional structure](https://www.numdam.org/article/CM_1985__56_2_201_0.pdf), Section4.3 printed213-214. The cited passage supplies the stated contract; qualifications and source corrections are retained in the node.

**Lean formulation.** full-signature-omitted; The suggested file contains a name-by-name register. A registered omission is not an elaborated theorem or a definition; the numerical tests and point stabilizer equations are expressly restricted cores. Full carrier obligations: G08.

<a id="defect"></a>

### Defect of a sigma class

**Definition: TauCeti.BunG.Defect.** For the connected reductive local group G and its algebraic sigma-centralizer J_b, def_G(b)=rank_E G−rank_E J_b as an integer. The ranks are split ranks over E, not absolute ranks over L and not dimensions of topological point groups.

**Hypotheses.** Global conventions in the reader apply; additional restrictions are stated in the contract.

**Prerequisites.** [Algebraic sigma-centralizer](#sigma-centralizer-J-b); [ReductiveGroupsPartII:RG2.1](https://github.com/TauCetiProject/TauCetiRoadmap/blob/201bcaee1f4014c91897d50cdb7631fc6d6a6d71/TauCetiRoadmap/ReductiveGroupsPartII/README.md).

**Proof/construction.** (1) Import the split-rank interface from relative root theory and apply it to J_b. (2) Change-of-representative isomorphisms make the integer depend only on [b].

**API.**

| Declaration | Role | Contract |
|---|---|---|
| TauCeti.BunG.Defect.value | data | Return rank_E G−rank_E J_b in Z. |
| TauCeti.BunG.Defect.conjugate | compatibility | Sigma conjugate representatives have equal defect. |
| TauCeti.BunG.Defect.product | simp | Defect is additive for products of groups and classes. |

**Discriminating unit tests.**

- **TauCeti.BunG.Defect.testUnit** (degenerate): For split GL_n and b=1 the defect is0.
- **TauCeti.BunG.Defect.testHalf** (computation): For split GL_2 and simple slope1/2, ranks2 and1 give defect1.
- **TauCeti.BunG.Defect.testSplitNonbasic** (non-example): For split GL_2 slopes0,1, J_b is a split rank2 torus, so defect0 although b is nonbasic.

**Uses.** He21 virtual dimension: Defect is the arithmetic rank correction; the ADLV dimension theorem has another owner. Zhu17 Lemma3.7: Restriction of scalars transports the rank correction.

**Acceptance.** GL_n slope blocks give n−sum of their division-module multiplicities.

**Sources.** [Cordial elements and dimensions of affine Deligne-Lusztig varieties](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/5A27DBF48CAEF6DA56A313061848574C/S205050862100010Xa.pdf/cordial-elements-and-dimensions-of-affine-delignelusztig-varieties.pdf), Section2.2 p.5. The cited passage supplies the stated contract; qualifications and source corrections are retained in the node.

**Lean formulation.** full-signature-omitted; The suggested file contains a name-by-name register. A registered omission is not an elaborated theorem or a definition; the numerical tests and point stabilizer equations are expressly restricted cores. Full carrier obligations: G08.

<a id="pure-inner-twisting"></a>

### Pure inner twisting of torsors

**Theorem: TauCeti.BunG.PureInnerTwisting.** For a group sheaf H on a site and an H-torsor T, put H_T=Aut_H(T). The bitorsor T induces an equivalence between H-torsors and H_T-torsors by S↦Isom_H(S,T), with the inverse contracted product. Applied on the curve, this is an equivalence of the actual torsor groupoids, not just of isomorphism classes.

**Hypotheses.** Global conventions in the reader apply; additional restrictions are stated in the contract.

**Prerequisites.** [Tannakian description of analytic torsors](#g-torsors-three-descriptions); [AlgebraicModuliForArithmeticGeometry:R09.3](../../../content/campaign/AlgebraicModuliForArithmeticGeometry/README.md); [DiamondsAndVStacks:D3](../../../content/campaign/DiamondsAndVStacks/README.md).

**Proof/construction.** (1) Construct the left/right commuting bitorsor actions and the evaluation/counit isomorphisms. (2) Descend the local trivializations to establish quasi-inverse functors.

**Acceptance.** An untrivialized torsor does not yield a canonical isomorphism H_T≅H.

**Sources.** [Geometrization of the local Langlands correspondence](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), III.4.1 p.100. The cited passage supplies the stated contract; qualifications and source corrections are retained in the node.

**Lean formulation.** full-signature-omitted; The suggested file contains a name-by-name register. A registered omission is not an elaborated theorem or a definition; the numerical tests and point stabilizer equations are expressly restricted cores. Full carrier obligations: G08.

<a id="basic-inner-form-bundle-equivalence"></a>

### Basic inner form equivalence

**Theorem: TauCeti.BunG.BasicInnerFormBundleEquivalence.** For basic b, the curve group Aut_G(E_b) is J_b×_E X. Pure inner twisting therefore gives Bun_G≃Bun_(J_b), compatible with perfectoid base change and carrying E_b to the trivial J_b-bundle.

**Hypotheses.** Global conventions in the reader apply; additional restrictions are stated in the contract.

**Prerequisites.** [Pure inner twisting of torsors](#pure-inner-twisting); [Algebraic sigma-centralizer](#sigma-centralizer-J-b); [VectorBundlesAndIsocrystals:VB1/isocrystal-to-bundle-functor](../../../content/campaign/VectorBundlesAndIsocrystals/README.md); [Basic sigma class](#basic-class).

**Proof/construction.** (1) For a basic slope cocharacter the adjoint isocrystal has only slope0; its bundle is the descended J_b group. (2) Apply the torsor equivalence relatively.

**Acceptance.** For nonbasic b the curve automorphism group has a nonconstant positive part; this statement does not apply.

**Sources.** [Geometrization of the local Langlands correspondence](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), III.4.2 andIII.4.3 pp.100-101. The cited passage supplies the stated contract; qualifications and source corrections are retained in the node.

**Lean formulation.** full-signature-omitted; The suggested file contains a name-by-name register. A registered omission is not an elaborated theorem or a definition; the numerical tests and point stabilizer equations are expressly restricted cores. Full carrier obligations: G08.

<a id="division-algebra-morita"></a>

### Division-algebra Morita comparison

**Comparison: TauCeti.BunG.DivisionAlgebraMorita.** For a simple isocrystal D(a,h) of slope λ=a/h, gcd(a,h)=1 and h>0, set A_λ=End_Φ(D(a,h)). Under the arithmetic Frobenius/Brauer convention of VB0, A_λ≅D_{−λ} has invariant −λ mod Z, and J_b≅A_λ^×. The associated bundle is O(−λ); the natural End comparison identifies A_λ with its endomorphism algebra. Twisting gives an equivalence between rank-h vector bundles and locally free rank-one right (A_λ⊗_E O_X)-modules via E↦Hom(E_b,E), with right action by precomposition. Its inverse is M↦M⊗_(A_λ⊗O_X)E_b, where E_b is a left A_λ-module. For m copies the automorphism group is GL_m(A_λ). This is a Morita/torsor equivalence.

**Hypotheses.** The local field and arithmetic Frobenius conventions of VB0 apply; λ is the isocrystal slope, so the bundle slope is −λ. Right modules use Hom(E_b,E); the Hom(E,E_b) functor in FS Example III.4.4 uses left modules.

**Prerequisites.** [Basic inner form equivalence](#basic-inner-form-bundle-equivalence); [ReductiveGroups#layer-7-structure-theory](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ReductiveGroups/README.md#layer-7-structure-theory); [VectorBundlesAndIsocrystals:VB0/endomorphism-division-algebra](../../../content/campaign/VectorBundlesAndIsocrystals/README.md); [VectorBundlesAndIsocrystals:VB0/brauer-invariant-sign](../../../content/campaign/VectorBundlesAndIsocrystals/README.md); [VectorBundlesAndIsocrystals:VB2:classification/bundle-endomorphism-comparison](../../../content/campaign/VectorBundlesAndIsocrystals/README.md).

**Proof/construction.** (1) Import the simple-block endomorphism presentation and its arithmetic Brauer invariant from the separate VB0 nodes; its parameter is the bundle slope −λ. (2) Use the simple-block bundle endomorphism comparison, then apply basic inner twisting and the explicit right-module Hom/tensor adjunction.

**Acceptance.** For isocrystal slope 1/3 the bundle slope is −1/3 and inv_E(A_λ)=2/3 mod Z, rather than 1/3. The quaternion slope 1/2 example cannot distinguish the signs. The chosen Hom functor is covariant in E and right A_λ-linear by precomposition; exchanging the Hom arguments exchanges sidedness.

**Sources.** [Geometrization of the local Langlands correspondence](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), ExampleIII.4.4 pp.101-102. Independently checked in the recorded public source version on 2026-10-07; the node retains the stated scope and conventions.

**Lean formulation.** full-signature-omitted; The suggested file contains a name-by-name register. A registered omission is not an elaborated theorem or a definition; the numerical tests and point stabilizer equations are expressly restricted cores. Full carrier obligations: G08.

<a id="families-of-g-isocrystals"></a>

### Families of G-isocrystals

**Definition: TauCeti.BunG.GIsocrystalFamily.** For a perfect F_q-algebra R, put L_R=R((t)) in equal characteristic and L_R=W_(O_E)(R)[1/π] in mixed characteristic. A family is a G-torsor on Spec L_R with a Frobenius descent isomorphism σ^*P≃P. This is a groupoid-valued prestack on perfect schemes; it is distinct from the geometric groupoid G-Isoc and from Bun_G on perfectoid spaces.

**Hypotheses.** Global conventions in the reader apply; additional restrictions are stated in the contract.

**Prerequisites.** [G-isocrystals](#g-isocrystals-and-B-of-G); [AlgebraicModuliForArithmeticGeometry:R09.3](../../../content/campaign/AlgebraicModuliForArithmeticGeometry/README.md); [VectorBundlesAndIsocrystals:VB0](../../../content/campaign/VectorBundlesAndIsocrystals/README.md); [DiamondsAndVStacks:D3](../../../content/campaign/DiamondsAndVStacks/README.md).

**Proof/construction.** (1) Use the coefficient-ring and Frobenius construction from the linear supplier. (2) Form equivariant torsors and their isomorphisms; pullback acts on both the torsor and its descent datum. (3) The coefficient-ring torsor category has arc-descent by Ans22 Lemma11.3, using Iva23 Proposition5.10 and reflection of exactness along arc-covers. Frobenius isomorphisms and their coherence descend through its fully faithful morphism descent.

**API.**

| Declaration | Role | Contract |
|---|---|---|
| TauCeti.BunG.GIsocrystalFamily.pullback | functoriality | Perfect-algebra maps pull back the torsor and Frobenius isomorphism, coherently. |
| TauCeti.BunG.GIsocrystalFamily.ofLoopElement | constructor | A loop element b defines the trivial torsor with Frobenius bσ. |
| TauCeti.BunG.GIsocrystalFamily.geometricClass | projection | A geometric point defines its class in B(G). |
| TauCeti.BunG.GIsocrystalFamily.loopQuotient | equivalence | After v-stackification the moduli is LG/Ad_σ LG, using v-local triviality of the coefficient-ring torsor. |

**Discriminating unit tests.**

- **TauCeti.BunG.GIsocrystalFamily.testField** (compatibility): For R=bar F_q the geometric classes recover B(G).
- **TauCeti.BunG.GIsocrystalFamily.testTrivial** (degenerate): For G=1 the family groupoid is terminal.
- **TauCeti.BunG.GIsocrystalFamily.testAutomorphisms** (non-example): For a nonbasic GL_2 class its family automorphisms are J_b(E), not the full positive-kernel bundle automorphisms.

**Uses.** FS I.2 TheoremI.2.1: Provides the moduli and its locally closed strata. RR96 Corollary3.11: Provides the family κ-local-constancy application.

**Acceptance.** Do not identify all family morphisms with bundle morphisms.

**Sources.** [Geometrization of the local Langlands correspondence](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), I.2 pp.10-11. The cited passage supplies the stated contract; qualifications and source corrections are retained in the node. [Extending torsors on the punctured Spec(A_inf)](https://arxiv.org/pdf/1804.06356v2), Lemma11.3 pp.34–35 and Theorem11.4 pp.35–36. Supplies arc-descent for coefficient-ring G-torsors and their v-local triviality; this is a general scheme tensor-descent input, distinct from relative FF bundle descent.

**Lean formulation.** full-signature-omitted; The suggested file contains a name-by-name register. A registered omission is not an elaborated theorem or a definition; the numerical tests and point stabilizer equations are expressly restricted cores. Full carrier obligations: G08.

**Atlas planet:** Families of G-isocrystals.

<a id="isocrystal-family-v-descent"></a>

### Isocrystal-family v-descent and strata

**Theorem: TauCeti.BunG.IsocrystalFamilyVDescent.** The G-isocrystal family prestack is a v-stack on perfect F_q-schemes. It has locally closed geometric-class strata indexed by B(G), each equivalent to [*/J_b(E)] for the locally profinite rational-point group. This is the family stack statement of FS I.2.1; the algebraic classifying stack [*/J_b] and the bundle stratum with its full automorphisms are different objects.

**Hypotheses.** Global conventions in the reader apply; additional restrictions are stated in the contract.

**Prerequisites.** [Families of G-isocrystals](#families-of-g-isocrystals); [Algebraic sigma-centralizer](#sigma-centralizer-J-b); [DiamondsAndVStacks:D3](../../../content/campaign/DiamondsAndVStacks/README.md); [AlgebraicModuliForArithmeticGeometry:R09.3](../../../content/campaign/AlgebraicModuliForArithmeticGeometry/README.md); [Kottwitz invariant in isocrystal families](#family-kottwitz-local-constancy); [VectorBundlesAndIsocrystals:VB0](../../../content/campaign/VectorBundlesAndIsocrystals/README.md); [DiamondsAndVStacks:D2](../../../content/campaign/DiamondsAndVStacks/README.md); [ReductiveGroups#layer-1-representations--comodules](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ReductiveGroups/README.md#layer-1-representations--comodules); [ReductiveGroupsPartII:RG2.3](../../../content/campaign/ReductiveGroupsPartII/README.md); [Submodule](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Module/Submodule/Defs.lean).

**Proof/construction.** (1) Use Iva23 Lemma5.9/Proposition5.10 for arc-descent of coefficient vector bundles in both characteristics. Ans22 Lemma11.3 extends this to G-torsors by exact tensor reconstruction: exactness is reflected because the coefficient-ring map meets every maximal ideal (Iva23 Corollary5.6). Descend the Frobenius isomorphism using full faithfulness. Arc-descent implies v-descent independently of κ-local-constancy. (2) Ans22 Theorem11.4 trivializes the underlying coefficient-ring torsor v-locally. Its proof reduces to absolutely integrally closed finite-rank valuation rings, uses Steinberg in rank0, the punctured-period-ring extension theorem in rank1, and valuation-ring excision/induction in higher rank. These are supplier inputs, not consequences of schematic torsor descent alone. The resulting presentation is LG/Ad_σ LG. (3) Only after descent, use Newton semicontinuity and the separately proved family κ-local-constancy to construct the locally closed constant-class loci. The κ argument is not a premise of the descent proof. (4) Cover a constant-class locus in the v-topology by spectra of products of perfect normal valuation rings. Choose the connected smooth affine O_E-model already supplied by RG2.3, as required by HK22 §2.1. Follow HK22 v5 Proposition2.10/Theorem2.11 on each normal piece: separate the least slope by Φ=π^(−r)φ^s and construct an effective lattice. Correct its Lemma2.9 proof bound by choosing a uniform denominator d for Φ on the initial rank-h lattice; the field-level iterated sum is bounded by π^(−d(h−1)), not by the Newton polygon alone (E08). Local freeness over general perfect bases still requires the proper lattice-moduli cover. (5) For an effective local shtuka, HK22 Lemma2.8 represents finite-level fixed sections by affine étale schemes; constant slope-zero multiplicity makes them finite étale. The inverse limit trivializes the étale part on a profinite étale cover. Induct through the least slopes as in Proposition2.10. For G, reconstruct its defining tensor line in a faithful representation. Theorem2.11 then needs local continuous lifting within the actual Aut(V0) orbit of its Frobenius-compatible embeddings; a GL(H) section does not provide this lift (E09). This remains a genuine G04 proof obligation, so this sketch is not a closed proof of the stratum equivalence. (6) After the actual orbit-lifting input is supplied, the normal-chart Isom sheaf is a torsor for the locally profinite J_b(E), and v-descent identifies the stratum with [*/J_b(E)] over any perfect base. The current HK22 theorem requires normality; this route does not claim a profinite étale trivialization over every non-normal perfect base. It gives neither the algebraic classifying stack [*/J_b] nor the positive-kernel automorphism group of a curve bundle.

**Acceptance.** The arc-descent argument is independent of the later family κ-local-constancy argument. Apply current HK22 only over perfect normal charts. An arbitrary-perfect-base profinite étale statement cannot be read off from its v1 version or from v-local isotriviality. The lattice bound includes the initial Frobenius denominator, and the tensor-line lift lies in the actual automorphism group. E08/E09 affect source proofs; neither is recorded as a counterexample to the stated isotriviality theorem. G04 remains open. Restricted Lean controls force the shear coefficient into every stable over-lattice, rule out a bound making that coefficient nonintegral, and distinguish an ambient lift from the diagonal tensor stabilizer. They do not type the family v-stack theorem.

**Sources.** [Geometrization of the local Langlands correspondence](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), TheoremI.2.1 p.11. The cited passage supplies the stated contract; qualifications and source corrections are retained in the node. [Arc-descent for the perfect loop functor and p-adic Deligne–Lusztig spaces](https://arxiv.org/pdf/2003.04399v3), Corollary5.6 p.13; Lemmas5.8–5.9 and Proposition5.10 pp.14–15. Coefficient vector-bundle arc-descent, via perfectoid descent and the sousperfectoid comparison, in both characteristics. [Extending torsors on the punctured Spec(A_inf)](https://arxiv.org/pdf/1804.06356v2), Lemmas11.2–11.3 and Theorem11.4 pp.34–36. Exact tensor torsor arc-descent and v-local triviality; the valuation-ring and rank-one extension inputs are retained explicitly. [Point counting on Igusa varieties for function fields](https://arxiv.org/pdf/2208.01069v5), v5 Lemmas2.8–2.9 pp.7–8, Proposition2.10 p.8 and Theorem2.11 p.9; v1 normality comparison in sourceVersions. Current isotriviality and the Isom torsor require perfect normal bases. E08 corrects a proof-level bound; E09 leaves the actual tensor-orbit lifting step open. Normal v-covers do not by themselves close that proof gap or yield arbitrary-base profinite étale triviality. [On the slope filtration](https://www.math.uni-bielefeld.de/~zink/slopes.pdf), Lemma9 and proof, author pp.11–12 (not Duke pagination). The minimal-stable-lattice and Nakayama argument bounds the number of iterates. The denominator-dependent field repair is our deduction; the author lemma concerns a p-divisible-group Dieudonné module.

**Lean formulation.** full-signature-omitted; The full family v-stack signature remains omitted under G08. Three elaborated native Submodule/field-vector controls check E08/E09 only: stable over-lattices contain the shear coefficient, a nonintegral scaled coefficient violates a proposed bound, and an ambient invertible lift need not lie in the smaller tensor stabilizer. No analytic geometry or actual orbit-lifting theorem is supplied. Full carrier obligations: G08.

<a id="finite-frobenius-norm-centralizer"></a>

### Finite Frobenius norm centralizer

**Comparison: TauCeti.BunG.FiniteFrobeniusNormCentralizer.** For the degree-r unramified extension K_0/Q_p, δ∈G(K_0), σ^r=id, and γ=δσ(δ)⋯σ^(r−1)(δ), the algebraic twisted centralizer functor defined by δσ(g)=gδ becomes Z_G(γ) after base change to K_0. Extending the coefficient field from degree r to degree rn defines I_(p,n); after extension to L its centralizer is Z_G(γ^n). The norm of δ^n is not substituted for this iterated twisted product. This finite-period comparison is distinct from the infinite-coefficient Newton Levi J_δ.

**Hypotheses.** Global conventions in the reader apply; additional restrictions are stated in the contract.

**Prerequisites.** [Algebraic sigma-centralizer](#sigma-centralizer-J-b); [ReductiveGroups#layer-7-structure-theory](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ReductiveGroups/README.md#layer-7-structure-theory); [AlgebraicModuliForArithmeticGeometry:R09.3](../../../content/campaign/AlgebraicModuliForArithmeticGeometry/README.md).

**Proof/construction.** (1) Iterate the twisted equation r times to obtain centralization of γ. (2) On Z_G(γ), Ad(δ)σ has period r; perform finite Galois descent. (3) Compare the point functors after K_0 base change. (4) For the enlarged coefficient field, (δσ)^(rn)=γ^nσ^(rn); apply the same finite descent.

**Acceptance.** No general equality Z_G(γ)=Z_G(ν_b) is asserted.

**Sources.** [Mod p points on Shimura varieties of abelian type](https://people.math.harvard.edu/~kisin/dvifiles/lr.pdf?download=1), Section2.1.2 printed29. The cited passage supplies the stated contract; qualifications and source corrections are retained in the node.

**Lean formulation.** typed-pointwise-core; These declarations type only the explicitly restricted abstract-group or affine-fibre core. The general-E coefficient groups, represented reductive groups, and geometric signatures still depend on G08 suppliers; the register is not signature coverage. Full carrier obligations: G08.

<a id="central-newton-on-J"></a>

### Central Newton morphism of the centralizer

**Construction: TauCeti.BunG.CentralNewtonOnJ.** For every b∈G(L), the slope morphism ν_b, viewed in the center of its geometric centralizer, descends through the defining Frobenius descent datum to an E-rational central morphism ν_(b,J):D→J_b. No rational representative of ν_b inside G is needed. For a positive multiple N clearing its denominators, Nν_(b,J) is an integral cocharacter and U_π=(Nν_(b,J))(π) belongs to J_b(E).

**Hypotheses.** Global conventions in the reader apply; additional restrictions are stated in the contract.

**Prerequisites.** [Algebraic sigma-centralizer](#sigma-centralizer-J-b); [Newton and Kottwitz invariants](#newton-and-kottwitz-maps); [Decent representative](#decent-representative).

**Proof/construction.** (1) The slope decomposition is preserved by every isocrystal automorphism, so ν_b is central in the centralizer. (2) The semilinear Frobenius operator commutes with its slope grading; descend that central morphism with the J_b group. (3) Clear the finite weight denominators and evaluate the resulting integral cocharacter at π.

**API.**

| Declaration | Role | Contract |
|---|---|---|
| TauCeti.BunG.CentralNewtonOnJ.morphism | data | Return the E-defined central D→J_b morphism. |
| TauCeti.BunG.CentralNewtonOnJ.integralMultiple | constructor | For sufficiently divisible N>0 obtain an integral central cocharacter. |
| TauCeti.BunG.CentralNewtonOnJ.transport | compatibility | Sigma conjugacy transports ν_(b,J) through the centralizer isomorphism. |

**Discriminating unit tests.**

- **TauCeti.BunG.CentralNewtonOnJ.testBasicHalf** (computation): For a simple GL_2 slope1/2 block, 2ν_(b,J) is the central scalar cocharacter of D_(1/2)^×.
- **TauCeti.BunG.CentralNewtonOnJ.testUnit** (degenerate): For b=1 the morphism is zero and U_π=1.
- **TauCeti.BunG.CentralNewtonOnJ.testNonbasic** (non-example): For GL_2 slopes1,0 it is central in J_b=G_m×G_m, while its image in GL_2 is noncentral.

**Uses.** FS V.3.6: Defines the contracting action for every connected reductive G. KMPS1.1.16-1.1.17: Agrees with the central morphism obtained through a rational Newton witness when that witness exists.

**Acceptance.** Check its construction without the rational-Newton-in-G hypothesis.

**Sources.** [Geometrization of the local Langlands correspondence](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), PropositionV.3.6 p.175. The cited passage supplies the stated contract; qualifications and source corrections are retained in the node.

**Lean formulation.** full-signature-omitted; The suggested file contains a name-by-name register. A registered omission is not an elaborated theorem or a definition; the numerical tests and point stabilizer equations are expressly restricted cores. Full carrier obligations: G08.

## BG1 — Kottwitz and Newton invariants

Construct integral π₁ and its coinvariants alongside the rational slope orbit. Prove the two-invariant classification before using the fixed-κ order or acceptable and ordinary classes. The Levi, torus, affine-Weyl and z-extension comparisons preserve the stated local and integral hypotheses.

<a id="family-kottwitz-local-constancy"></a>

### Kottwitz invariant in isocrystal families

**Theorem: TauCeti.BunG.FamilyKottwitzLocalConstancy.** For an F_q-scheme S with a G-isocrystal family, the function s↦κ(E_s) in π_1(G)_Γ is locally constant. Perfectifying S preserves the relevant topology. Analytify the family to the curve and apply bundle κ-local-constancy; this establishes the routed FS III.2.8 assertion without assuming it in the family v-descent proof.

**Hypotheses.** Global conventions in the reader apply; additional restrictions are stated in the contract.

**Prerequisites.** [Families of G-isocrystals](#families-of-g-isocrystals); [Local constancy of bundle Kottwitz invariant](#semicontinuity-and-local-constancy); [VectorBundlesAndIsocrystals:VB1/isocrystal-to-bundle-functor](../../../content/campaign/VectorBundlesAndIsocrystals/README.md); [DiamondsAndVStacks:D3](../../../content/campaign/DiamondsAndVStacks/README.md).

**Proof/construction.** (1) After perfection write a Frobenius family on Spec R and associate the map Spd(R,R)→Bun_G, as in FS III.2.8. (2) Pull back the clopen κ fibres along that map. (3) Apply SW Proposition18.3.1, the bijection between clopen subsets of Spd(R,R) and Spec R; this proves scheme-topological local constancy. No commuting support or valuation map is assumed.

**Acceptance.** Do not create a dependency from bundle κ-local-constancy back to this corollary.

**Sources.** [Geometrization of the local Langlands correspondence](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), CorollaryIII.2.8 pp.92-93. The cited passage supplies the stated contract; qualifications and source corrections are retained in the node.; [Berkeley Lectures on p-adic Geometry](https://www.math.uni-bonn.de/people/scholze/Berkeley.pdf), Proposition18.3.1 §18.3. The cited passage supplies the stated contract; qualifications and source corrections are retained in the node.

**Lean formulation.** full-signature-omitted; The suggested file contains a name-by-name register. A registered omission is not an elaborated theorem or a definition; the numerical tests and point stabilizer equations are expressly restricted cores. Full carrier obligations: G08.

<a id="abelianized-kottwitz-set"></a>

### Abelianized Kottwitz set

**Definition: TauCeti.BunG.AbelianizedClass.** For E p-adic, B_ab(G)=H^1(W_E,[Gsc(L^sep)→G(L^sep)]) with the natural crossed-module action. The abelianization map comes from [1→G]→[Gsc→G]. A maximal torus complex [Tsc→T] and center complex [Zsc→Z] are homotopy-equivalent coefficient models, not replacements of G by an arbitrary abelian group.

**Hypotheses.** E is p-adic; L^sep denotes a separable algebraic closure of L=breve E (the overline of breve E in FS), with its natural W_E-action. Continuous Weil cohomology uses these discrete coefficient groups, not only L-rational points.

**Prerequisites.** [Kottwitz set B(G)](#sigma-conjugacy-quotient); [EndoscopicTransferAndUnitaryTraceComparison:ET.0](../../../content/campaign/EndoscopicTransferAndUnitaryTraceComparison/README.md); [ReductiveGroups#layer-7-structure-theory](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ReductiveGroups/README.md#layer-7-structure-theory).

**Proof/construction.** (1) Import continuous crossed-module cohomology and the actual simply connected covering from their owners. (2) Construct the canonical abelianization and compare the torus and center complexes.

**API.**

| Declaration | Role | Contract |
|---|---|---|
| TauCeti.BunG.AbelianizedClass.abelianize | functoriality | Send a sigma class to its crossed-module H^1 class. |
| TauCeti.BunG.AbelianizedClass.torusModel | equivalence | Replace the crossed module by [Tsc(L^sep)→T(L^sep)] for a maximal torus. |
| TauCeti.BunG.AbelianizedClass.centerModel | equivalence | Replace it by [Zsc(L^sep)→Z(L^sep)]. |
| TauCeti.BunG.AbelianizedClass.map | functoriality | Reductive homomorphisms and compatible simply connected lifts induce the abelianized map. |

**Discriminating unit tests.**

- **TauCeti.BunG.AbelianizedClass.testTorus** (compatibility): For a torus Gsc=1, B_ab(T)=B(T).
- **TauCeti.BunG.AbelianizedClass.testSLn** (degenerate): For simply connected semisimple G the abelianized set is0.
- **TauCeti.BunG.AbelianizedClass.testPGLn** (computation): For split PGL_n, B_ab(G)=Z/n, which cannot be recovered by rationalization.

**Uses.** FS III.2.11: Identifies κ as abelianization. FS III.2.13: Gives the constant target of curve crossed-module H^1.

**Acceptance.** Restriction to p-adic E keeps finite diagonalizable groups étale.

**Sources.** [Geometrization of the local Langlands correspondence](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), III.2.4.2 pp.93-94. The cited passage supplies the stated contract; qualifications and source corrections are retained in the node.

**Lean formulation.** full-signature-omitted; The suggested file contains a name-by-name register. A registered omission is not an elaborated theorem or a definition; the numerical tests and point stabilizer equations are expressly restricted cores. Full carrier obligations: G08.

<a id="slope-protorus"></a>

### Rational slope protorus

**Definition: TauCeti.BunG.SlopeProtorus.** Let D=D(Q) be the diagonalizable E-protorus with coordinate Hopf algebra E[Q], using the additive group Q. It is not a finite-type torus. A homomorphism D→G is a Hopf-compatible coordinate map O(G)→E[Q]. Its restriction on each finite rational representation gives rational weight subspaces, with only finitely many nonzero weights. Over a splitting field, Hom(D,T) is Hom(X*(T),Q), hence X_*(T)⊗Q for a finite-rank torus. A rational cocharacter need not be integral.

**Hypotheses.** Global conventions in the reader apply; additional restrictions are stated in the contract.

**Prerequisites.** [ReductiveGroups#layer-1-representations--comodules](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ReductiveGroups/README.md#layer-1-representations--comodules); [VectorBundlesAndIsocrystals:VB0/dieudonne-manin-isocrystals](../../../content/campaign/VectorBundlesAndIsocrystals/README.md); [TauCeti.DiagonalizableGroup.weightSpace](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Algebra/AlgebraicGroup/DiagonalizableGroup/Weight.lean); [TauCeti.DiagonalizableGroup.finite_setOf_weightSpace_ne_bot](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Algebra/AlgebraicGroup/DiagonalizableGroup/Weight.lean); [TauCeti.MonoidAlgebra.mapDomainBialgHom_surjective](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Algebra/Bialgebra/MonoidAlgebra/GroupLike.lean).

**Proof/construction.** (1) Reuse the native group-algebra Hopf structure and diagonalizable point/weight APIs at the pinned library, specialized to the multiplicative presentation of the additive group Q; the direct limit of character lattices identifies its spectrum with the inverse limit of G_m under positive power maps. (2) Restrict the representation comodule along O(G)→E[Q], and use the native internal weight decomposition and finite-support theorem. Clear the finitely many rational denominators. (3) Apply the native group-algebra morphism/character-homomorphism correspondence over a field. For a split finite-rank torus this is the rational cocharacter space; Galois descent to a nonsplit torus retains the supplier’s action rather than treating it as a split torus.

**API.**

| Declaration | Role | Contract |
|---|---|---|
| TauCeti.BunG.SlopeProtorus.weight | projection | For a representation comodule V and coordinate map ν:O(G)→E[Q], return the q-weight submodule of V obtained by native comodule corestriction. |
| TauCeti.BunG.SlopeProtorus.integralMultiple | constructor | For a finite representation, choose a positive integer n such that n q is integral for every nonzero rational weight submodule. Finite support comes from the native diagonalizable weight theorem. |
| TauCeti.BunG.SlopeProtorus.toTorus | equivalence | Over a splitting field, the coordinate maps E[X*(T)]→E[Q] identify with additive maps X*(T)→Q. For a finite free character lattice this identifies Hom(D,T) with X_*(T)⊗Q; a nonsplit descent comparison must preserve its Galois action. |
| TauCeti.BunG.SlopeProtorus.map | functoriality | For G→H represented by O(H)→O(G), postcomposition of D→G is coordinate-map composition O(H)→O(G)→E[Q]. |
| TauCeti.BunG.SlopeProtorus.mem_weight | characterisation | A vector v lies in the q-weight submodule precisely when its corestricted coaction is v⊗[q]. |
| TauCeti.BunG.SlopeProtorus.finite_weights | characterisation | A finite representation has only finitely many nonzero rational weight submodules. |
| TauCeti.BunG.SlopeProtorus.toTorus_generator | characterisation | The coordinate map associated to X*(T)→Q sends the group-like generator [m] to [ν(m)]. |
| TauCeti.BunG.SlopeProtorus.toMultiplicativeGroup | constructor | The rational slope q determines a coordinate map E[Z]→E[Q] sending [n] to [n q]. |
| TauCeti.BunG.SlopeProtorus.map_apply | compatibility | Coordinate-side postcomposition evaluates as the composite of the two bialgebra maps. |

**Discriminating unit tests.**

- **TauCeti.BunG.SlopeProtorus.testHalf** (computation): The actual half-slope coordinate map E[Z]→E[Q] sends the generator [2] to [1], detecting denominator clearing on Hopf algebra generators.
- **TauCeti.BunG.SlopeProtorus.testZero** (degenerate): The zero-slope coordinate map sends every [n] to the unit [0], giving the trivial group homomorphism.
- **TauCeti.BunG.SlopeProtorus.testDenominator** (non-example): The half-slope coordinate map differs from every integral-slope map E[Z]→E[Q], including slope one.

**Uses.** KMPS1.1.2: Newton morphisms have domain D. FS III.2: Graded tensor functors realize the Newton morphism.

**Acceptance.** Denominator h requires an h-fold integral representative.

**Sources.** [Honda-Tate theory for Shimura varieties](https://math.berkeley.edu/~swshin/HT.pdf), Notational conventions and1.1.1 p.5. The cited passage supplies the stated contract; qualifications and source corrections are retained in the node.

**Lean formulation.** typed-diagonalizable-protorus-interface; The native commutative Hopf algebra E[Q], representation weights, finite denominator clearing, split-torus character-map equivalence and coordinate postcomposition are typed. The three tests evaluate or distinguish actual coordinate morphisms. Canonical comparison with arbitrary nonsplit tori and the full Newton morphism remain the reductive/local coefficient supplier contracts; no finite-type diagonalizable group category is incorrectly applied to Q. Full carrier obligations: G08.

<a id="algebraic-fundamental-group"></a>

### Algebraic fundamental group

**Definition: TauCeti.BunG.AlgebraicPiOne.** Use the integral algebraic fundamental group already supplied by upstream ReductiveGroups Part II RG2.1.5: π_1(G)=X_*(T)/ZΦ∨ with its Γ_E-action. BG’s notation AlgebraicPiOne is an import alias for this object, not a second coroot-quotient construction. Use its integral inertia and full Galois coinvariants, preserving torsion; import Weyl invariance, functorial maps and their Galois compatibility. Independence of a maximal-torus choice and canonical inner-twist transport require the specific comparison refinement stated in the supplier request.

**Hypotheses.** Global conventions in the reader apply; additional restrictions are stated in the contract.

**Prerequisites.** [Existing ReductiveGroups Part II RG2.1.5](https://github.com/TauCetiProject/TauCetiRoadmap/blob/201bcaee1f4014c91897d50cdb7631fc6d6a6d71/TauCetiRoadmap/ReductiveGroupsPartII/README.md#rg215-arithmetic-invariants-π₁-z-extensions-and-the-kottwitz-homomorphism).

**Proof/construction.** (1) Import BruhatTits.AlgebraicFundamentalGroup, its galoisAction, inertiaCoinvariants, map and weyl_invariant from upstream RG2.1.5; retain the inverse-transpose convention on cocharacters. (2) Use full Galois coinvariants of the imported action for κ. Obtain the comparison between compatible maximal-torus choices and inner twists from the RG2.1 refinement; the existing suggested upstream signatures work with a fixed AbsoluteRootData and do not alone supply that comparison.

**API.**

| Declaration | Role | Contract |
|---|---|---|
| TauCeti.BunG.AlgebraicPiOne.ofCocharacter | constructor | Reuse the upstream RG2.1.5 operation: Take the class of an integral cocharacter. |
| TauCeti.BunG.AlgebraicPiOne.coinvariants | structure | Reuse the upstream RG2.1.5 operation: Form Γ- or I-coinvariants with the specified action. |
| TauCeti.BunG.AlgebraicPiOne.map | functoriality | Reuse the upstream RG2.1.5 operation: A reductive group morphism induces the canonical homomorphism on π_1. |
| TauCeti.BunG.AlgebraicPiOne.innerInvariant | equivalence | Use canonical Γ-module transport under inner twisting after importing the RG2.1 maximal-torus/inner-twist comparison refinement; existing fixed-datum signatures do not yet assert this comparison. |

**Discriminating unit tests.**

- **TauCeti.BunG.AlgebraicPiOne.testGLn** (computation): For GL_n with n≥1, reuse the upstream identification π_1≅Z by the sum of diagonal cocharacters; GL_0 instead has π_1=0.
- **TauCeti.BunG.AlgebraicPiOne.testSLn** (degenerate): For SL_n the coroot quotient is0.
- **TauCeti.BunG.AlgebraicPiOne.testNormOne** (non-example): The unramified quadratic norm-one torus has Γ-coinvariants Z/2; its rationalization loses its nonzero class.

**Uses.** GLX2.2 and KMPS1.1: κ and μ♯ take values in the full integral quotient. BG2 connected components: Indexes π_0 Bun_G, including torsion.

**Acceptance.** Do not replace integral coinvariants by their rationalization.

**Sources.** [Honda-Tate theory for Shimura varieties](https://math.berkeley.edu/~swshin/HT.pdf), Notational conventions p.5. The cited passage supplies the stated contract; qualifications and source corrections are retained in the node.; [The connected components of affine Deligne-Lusztig varieties](https://link.springer.com/content/pdf/10.1007/s00222-025-01386-1.pdf), Section2.2 p.818. The cited passage supplies the stated contract; qualifications and source corrections are retained in the node.

**Lean formulation.** imported-upstream-signatures; The upstream suggested file defines the quotient from actual AbsoluteRootData and supplies its Galois action, inertia coinvariants and maps. BG does not restate those definitions. The pinned shared build does not expose this roadmap module as an import; the BG alias and canonical inner-twist comparison signatures remain omitted. This is an import of existing work, not a missing fundamental-group plan. Full carrier obligations: G08.

<a id="newton-orbit-space"></a>

### Newton orbit space and rational dominance

**Definition: TauCeti.BunG.NewtonSpace.** N(G) is the Γ_E-fixed set of G(bar E)-conjugacy classes of D→G. For a quasi-split inner form G*, choose a rational Borel and torus and identify it with Γ-fixed dominant rational cocharacters. Define ν≤νprime when νprime−ν is a nonnegative rational combination of positive coroots in the chosen chamber; the central projection is consequently equal.

**Hypotheses.** Global conventions in the reader apply; additional restrictions are stated in the contract.

**Prerequisites.** [Rational slope protorus](#slope-protorus); [ReductiveGroups#layer-7-structure-theory](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ReductiveGroups/README.md#layer-7-structure-theory); [ReductiveGroupsPartII:RG2.1](https://github.com/TauCetiProject/TauCetiRoadmap/blob/201bcaee1f4014c91897d50cdb7631fc6d6a6d71/TauCetiRoadmap/ReductiveGroupsPartII/README.md).

**Proof/construction.** (1) Use the quasi-split rational chamber and the action on the based root datum. (2) Compare orbit representatives in that chamber; transport the order across an inner twisting.

**API.**

| Declaration | Role | Contract |
|---|---|---|
| TauCeti.BunG.NewtonSpace.dominant | characterisation | Choose the unique dominant representative in G*. |
| TauCeti.BunG.NewtonSpace.le | relation | Positive-coroot dominance with equal central projection. |
| TauCeti.BunG.NewtonSpace.delta | projection | Project to (π_1(G)⊗Q)^Γ. |
| TauCeti.BunG.NewtonSpace.transfer | equivalence | An inner twisting transports Newton orbit classes, independently of its representative. |

**Discriminating unit tests.**

- **TauCeti.BunG.NewtonSpace.testGL2** (computation): (1/2,1/2)≤(1,0), with equal total1.
- **TauCeti.BunG.NewtonSpace.testTorus** (degenerate): For a torus dominance is equality.
- **TauCeti.BunG.NewtonSpace.testCentral** (non-example): For G_m, 0 and1 are incomparable despite the usual rational-number inequality.

**Uses.** RR96 Proposition2.4: Detect basic minimality. KMPS1.1.5: Compare N_ξ(ν_b) with the Hodge average.

**Acceptance.** On GL_n compare descending slopes by partial sums with equal total.

**Sources.** [Honda-Tate theory for Shimura varieties](https://math.berkeley.edu/~swshin/HT.pdf), 1.1.1 pp.5-6. The cited passage supplies the stated contract; qualifications and source corrections are retained in the node.; [On the classification and specialization of F-isocrystals with additional structure](https://www.numdam.org/article/CM_1996__103_2_153_0.pdf), Section2.1 pp.165-166 (PDF14-15). Independently checked in the recorded public source version on 2026-10-07; the node retains the stated scope and conventions.

**Lean formulation.** full-signature-omitted; The suggested file contains a name-by-name register. A registered omission is not an elaborated theorem or a definition; the numerical tests and point stabilizer equations are expressly restricted cores. Full carrier obligations: G08.

<a id="galois-average"></a>

### Galois averaging and Hodge invariants

**Construction: TauCeti.BunG.HodgeInvariants.** For a geometric conjugacy class {μ}, choose its dominant representative μ* in a quasi-split inner form. Put μ♯=[μ*] in π_1(G)_Γ and μ◇=|Γ·μ*|^−1 sum over the finite orbit. The latter is dominant and Γ-fixed. Rational averaging gives (π_1(G)⊗Q)_Γ≅(π_1(G)⊗Q)^Γ and δ(μ◇)=average(μ♯⊗1); it is not an integral averaging isomorphism.

**Hypotheses.** Global conventions in the reader apply; additional restrictions are stated in the contract.

**Prerequisites.** [Algebraic fundamental group](#algebraic-fundamental-group); [Newton orbit space and rational dominance](#newton-orbit-space); [ReductiveGroups#layer-7-structure-theory](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ReductiveGroups/README.md#layer-7-structure-theory).

**Proof/construction.** (1) Choose the finite quotient through which the based-root action and μ orbit factor. (2) Average in the rational vector space; change of inner twisting changes the representative by conjugacy. (3) Prove invariance, idempotence and compatibility with the coroot quotient.

**API.**

| Declaration | Role | Contract |
|---|---|---|
| TauCeti.BunG.HodgeInvariants.sharp | projection | Return the full integral Γ-coinvariant class. |
| TauCeti.BunG.HodgeInvariants.diamond | projection | Return the rational dominant orbit average. |
| TauCeti.BunG.HodgeInvariants.average_eq | compatibility | The rational projection of sharp is delta of diamond. |
| TauCeti.BunG.HodgeInvariants.baseChange | functoriality | Restrict the Γ action and use the corresponding orbit average; ramified degree normalizations must be explicit. |

**Discriminating unit tests.**

- **TauCeti.BunG.HodgeInvariants.testSplitGL2** (computation): For split GL_2 and μ=(1,0), μ◇=(1,0) and μ♯=1.
- **TauCeti.BunG.HodgeInvariants.testUnit** (degenerate): The zero cocharacter has both invariants0.
- **TauCeti.BunG.HodgeInvariants.testTorsion** (non-example): For the quadratic norm-one torus μ=1 has μ◇=0 and nonzero μ♯ in Z/2.

**Uses.** KMPS1.1.5-1.1.6: Defines admissibility and its basic class. KZ2.2.4: Defines ordinary equality with the maximal possible Newton point.

**Acceptance.** Keep μ♯ integral even when μ◇ is fractional.

**Sources.** [Honda-Tate theory for Shimura varieties](https://math.berkeley.edu/~swshin/HT.pdf), 1.1.5 pp.7-8. The cited passage supplies the stated contract; qualifications and source corrections are retained in the node.

**Lean formulation.** full-signature-omitted; The suggested file contains a name-by-name register. A registered omission is not an elaborated theorem or a definition; the numerical tests and point stabilizer equations are expressly restricted cores. Full carrier obligations: G08.

<a id="newton-and-kottwitz-maps"></a>

### Newton and Kottwitz invariants

**Construction: TauCeti.BunG.Invariants.** There are functorial maps ν:B(G)→N(G) and κ:B(G)→π_1(G)_Γ. The Newton morphism is the slope grading in every rational representation. Import the representative homomorphism κ̃:G(L)→π_1(G)_I from upstream RG2.1.5, rather than reconstructing its torus and z-extension foundations here. Given its Frobenius equivariance, κ is its descent to sigma classes followed by integral Frobenius coinvariants. Their rational images agree: δ(ν_b)=average(κ(b)⊗1).

**Hypotheses.** Global conventions in the reader apply; additional restrictions are stated in the contract. The typed KottwitzDescent consumer interface takes an actual group G, an integral abelian group A, automorphisms σ and τ, and a supplied homomorphism with κ̃(σg)=τκ̃(g). It does not identify arbitrary such data with a reductive group over a local field.

**Prerequisites.** [Kottwitz set B(G)](#sigma-conjugacy-quotient); [Newton orbit space and rational dominance](#newton-orbit-space); [Algebraic fundamental group](#algebraic-fundamental-group); [Galois averaging and Hodge invariants](#galois-average); [VectorBundlesAndIsocrystals:VB0/dieudonne-manin-isocrystals](../../../content/campaign/VectorBundlesAndIsocrystals/README.md); [ReductiveGroups#layer-7-structure-theory](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ReductiveGroups/README.md#layer-7-structure-theory); [ReductiveGroupsPartII:RG2.1](https://github.com/TauCetiProject/TauCetiRoadmap/blob/8acc80159cfd301db68bde9393a52668efdd8c8c/TauCetiRoadmap/ReductiveGroupsPartII/README.md); [Representation.Coinvariants and its map](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RepresentationTheory/Coinvariants.lean).

**Proof/construction.** (1) Construct the slope morphism using Dieudonné–Manin and tensor compatibility; its general local-field signature remains G08. (2) Import the upstream representative Kottwitz homomorphism on G(L), its surjectivity and naturality. Request its local Frobenius-equivariance signature: the current upstream README states this property but explicitly supplies no Lean target. (3) For c=g b σ(g)⁻¹, compute κ̃(c)=κ̃(b)+κ̃(g)−τκ̃(g). Native integral coinvariants identify κ̃(g) with τκ̃(g), so the quotient universal property descends the representative formula uniquely. (4) For a cyclic ℤ-action, positive powers give telescoping sums in the range of τ−id and negative powers reduce to positive powers using τ⁻¹. Conversely the generator relation is τa−a. This identifies the native relation submodule with that range. For an abelian point group, the same equation gives both directions of the quotient equivalence. (5) Use the native coinvariant map of an integral intertwiner to check naturality on every representative; inherit surjectivity from the supplied homomorphism and quotient projection. Identify successive inertia/Frobenius coinvariants with π_1(G)_Γ using the actual local Galois action, then check the rational Newton compatibility square. Those reductive/local-field comparisons remain G08.

**Import boundary.** [Current upstream RG2.1.5](https://github.com/TauCetiProject/TauCetiRoadmap/blob/8acc80159cfd301db68bde9393a52668efdd8c8c/TauCetiRoadmap/ReductiveGroupsPartII/README.md) supplies the representative construction. Native [Representation.Coinvariants](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RepresentationTheory/Coinvariants.lean) supplies the integral quotient and induced maps. The local Frobenius-equivariance instantiation remains a precise request.

**API.**

| Declaration | Role | Contract |
|---|---|---|
| TauCeti.BunG.Invariants.newton | projection | Evaluate the Newton class or its chosen dominant representative. |
| TauCeti.BunG.Invariants.kottwitz | projection | Evaluate κ in integral Γ-coinvariants. |
| TauCeti.BunG.Invariants.representativeKottwitz | projection | Evaluate the imported upstream κ̃ in integral inertia coinvariants before the σ quotient. |
| TauCeti.BunG.Invariants.map | functoriality | Group morphisms commute with κ and with the induced conjugacy-class Newton map. |
| TauCeti.BunG.Invariants.rationalCompatibility | compatibility | The δ/average square commutes; it does not recover torsion κ from ν. |

| TauCeti.BunG.KottwitzDescent.cyclicRepresentation | constructor | For an integral abelian group A and additive automorphism τ, the multiplicativized integer n acts by the ℤ-linear automorphism τ^n. |
| TauCeti.BunG.KottwitzDescent.cyclicRepresentation_generator | characterisation | The positive generator acts by τ, fixing the arithmetic Frobenius orientation. |
| TauCeti.BunG.KottwitzDescent.Target | projection | Reuse native Representation.Coinvariants over ℤ for the cyclic action on A; retain torsion. |
| TauCeti.BunG.KottwitzDescent.relationMap | constructor | The integral relation map is τ−id on the actual ℤ-module A. |
| TauCeti.BunG.KottwitzDescent.ker_eq_range | characterisation | The native cyclic-action relation submodule equals the range of τ−id; no rationalization occurs. |
| TauCeti.BunG.KottwitzDescent.Data | constructor | Supply a homomorphism G→Multiplicative A together with its explicit Frobenius-equivariance equation. Upstream owns its reductive-group construction. |
| TauCeti.BunG.KottwitzDescent.representativeClass | projection | Project the supplied representative invariant to native integral Frobenius coinvariants. |
| TauCeti.BunG.KottwitzDescent.representative_twisted | characterisation | For c=g b σ(g)⁻¹, the additive representative invariant is κ̃(b)+κ̃(g)−τκ̃(g). |
| TauCeti.BunG.KottwitzDescent.representativeClass_twisted | compatibility | The native integral quotient kills the change κ̃(g)−τκ̃(g). |
| TauCeti.BunG.KottwitzDescent.classKottwitz | constructor | Descend the supplied invariant to the actual SigmaClass quotient using twisted-conjugacy invariance. |
| TauCeti.BunG.KottwitzDescent.classKottwitz_mk | characterisation | On the class represented by b, the descended map is the native coinvariant class of κ̃(b). |
| TauCeti.BunG.KottwitzDescent.classKottwitz_unique | extensionality | A function on SigmaClass with the specified representative formula equals classKottwitz. |
| TauCeti.BunG.KottwitzDescent.classKottwitz_surjective | compatibility | Surjectivity of the supplied representative homomorphism implies surjectivity on sigma classes; it is an explicit hypothesis. |
| TauCeti.BunG.KottwitzDescent.intertwiner | functoriality | A ℤ-linear map intertwining τ and υ induces a native Representation.IntertwiningMap between their cyclic representations. |
| TauCeti.BunG.KottwitzDescent.classKottwitz_natural | functoriality | A Frobenius-compatible point-group map and an integral intertwiner compatible with the supplied representative homomorphisms commute with the descended maps via native Coinvariants.map. |
| TauCeti.BunG.KottwitzDescent.identityData | constructor | For Multiplicative A with Frobenius τ, the identity homomorphism supplies the representative invariant. |
| TauCeti.BunG.KottwitzDescent.abelianEquiv | equivalence | The twisted-conjugacy quotient of Multiplicative A is equivalent to its native integral τ-coinvariants. |
| TauCeti.BunG.KottwitzDescent.abelianEquiv_mk | characterisation | The abelian equivalence sends a represented element a to its native integral coinvariant class. |
| TauCeti.BunG.KottwitzDescent.identityFrobeniusEquiv | equivalence | For identity Frobenius, the integral target is ℤ-linearly equivalent to A. |
| TauCeti.BunG.KottwitzDescent.identityFrobeniusEquiv_mk | characterisation | The identity-action target equivalence sends the class of a to a. |
| TauCeti.BunG.KottwitzDescent.signCoinvariantsEquiv | equivalence | For A=ℤ and τ(n)=−n, the native integral target is additively equivalent to ZMod 2. |
| TauCeti.BunG.KottwitzDescent.signCoinvariantsEquiv_mk | characterisation | The sign-action equivalence sends the integral class of n to its parity in ZMod 2. |

**Discriminating unit tests.**

- **TauCeti.BunG.Invariants.testGL1** (computation): b=π^m has ν=m and κ=m.
- **TauCeti.BunG.Invariants.testSign** (compatibility): Its associated line bundle is O(−m), so degree is −κ.
- **TauCeti.BunG.Invariants.testTorsion** (non-example): The two norm-one torus classes have equal Newton0 and distinct κ in Z/2.

- **TauCeti.BunG.KottwitzDescent.testIdentityTarget** (degenerate): With identity Frobenius and the identity representative map on Multiplicative A, the descended value of a is a.
- **TauCeti.BunG.KottwitzDescent.testUnit** (degenerate): For every supplied equivariant representative homomorphism, the class represented by 1 maps to zero.
- **TauCeti.BunG.KottwitzDescent.testTwistedInvariant** (compatibility): The classes represented by b and g b σ(g)⁻¹ have equal descended integral invariants.
- **TauCeti.BunG.KottwitzDescent.testSignParity** (computation): For sign Frobenius on Multiplicative ℤ, the actual twisted class of n maps to n modulo 2.
- **TauCeti.BunG.KottwitzDescent.testSignDistinct** (non-example): Under sign Frobenius, the twisted classes represented by 0 and 1 differ; rationalizing the target would lose this distinction.
- **TauCeti.BunG.KottwitzDescent.testSignTwo** (computation): Under sign Frobenius, the twisted classes represented by 2 and 0 agree.
- **TauCeti.BunG.KottwitzDescent.testSignNotFixed** (non-example): The sign-action coinvariant class of 1 is nonzero, whereas every fixed integer is zero; fixed points cannot replace coinvariants.

**Uses.** GLX2.2: Defines acceptable classes and component cosets. BG2 and IG.0: Controls curve components and structured admissibility.

**Acceptance.** For GL_n, κ=v(det b) and ν is the descending slope tuple.

**Sources.** [Honda-Tate theory for Shimura varieties](https://math.berkeley.edu/~swshin/HT.pdf), 1.1.2 equations1.1.2.1 and1.1.2.3 pp.6-7. The cited passage supplies the stated contract; qualifications and source corrections are retained in the node.; [On the classification and specialization of F-isocrystals with additional structure](https://www.numdam.org/article/CM_1996__103_2_153_0.pdf), Theorem1.15 p.163. The cited passage supplies the stated contract; qualifications and source corrections are retained in the node.

**Lean formulation.** typed-integral-kottwitz-descent-interface; KottwitzDescent types the actual sigma-class descent of a supplied Frobenius-equivariant homomorphism to native integral cyclic coinvariants, its uniqueness, surjectivity, naturality and abelian quotient equivalence. Identity/sign-action controls retain integral torsion. This consumer interface does not reconstruct upstream π_1 or κ̃. The general-E Newton morphism, local Frobenius-equivariance instantiation, successive inertia/Γ comparison and rational compatibility signatures remain G08; the original GL_n, bundle-sign and norm-one-torus examples are still required. Full carrier obligations: G08.

**Atlas planet:** Newton and Kottwitz invariants.

<a id="straight-weyl-classification"></a>

### Straight Weyl comparison with B(G)

**Theorem: TauCeti.BunG.StraightWeylClassification.** For the local Iwahori–Weyl group with its specified Frobenius and parahoric root datum, the map from σ-straight σ-conjugacy classes of Weyl elements to B(G) is a bijection and preserves κ and dominant Newton points. For w, choose n killing the finite Weyl/Frobenius action and write wσ(w)⋯σ^(n−1)(w)=t_λ; ν_w=λ/n. The straightness criterion is length(w)=<2ρ_Σ,ν_w^dom>. Generic affine Weyl groups, lengths and Adm(μ) belong to RG2.4.

**Hypotheses.** Global conventions in the reader apply; additional restrictions are stated in the contract.

**Prerequisites.** [Newton and Kottwitz invariants](#newton-and-kottwitz-maps); [ReductiveGroupsPartII:RG2.4](https://github.com/TauCetiProject/TauCetiRoadmap/blob/201bcaee1f4014c91897d50cdb7631fc6d6a6d71/TauCetiRoadmap/ReductiveGroupsPartII/README.md); [ReductiveGroupsPartII:RG2.3](https://github.com/TauCetiProject/TauCetiRoadmap/blob/201bcaee1f4014c91897d50cdb7631fc6d6a6d71/TauCetiRoadmap/ReductiveGroupsPartII/README.md).

**Proof/construction.** (1) Import the actual local extended Weyl datum and its lift to G(L). (2) Prove independence of an allowed n and compatibility of invariant maps. (3) Use the cited He14 straight-class theorem; its original proof remains a named source gap.

**Acceptance.** The rational translation normalization divides by n, not by the residue-field degree.

**Sources.** [Independence of l for Frobenius conjugacy classes attached to abelian varieties](https://arxiv.org/pdf/2103.09945v2), Section2.2.2 p.10, with the σ-straight definitions in Sections2.1.3-2.1.4 pp.7-8. Independently checked in the recorded public source version on 2026-10-07; the node retains the stated scope and conventions.

**Lean formulation.** full-signature-omitted; The suggested file contains a name-by-name register. A registered omission is not an elaborated theorem or a definition; the numerical tests and point stabilizer equations are expressly restricted cores. Full carrier obligations: G08.

**Atlas planet:** Straight Weyl classification.

<a id="classification-by-two-invariants"></a>

### Kottwitz classification by both invariants

**Theorem: TauCeti.BunG.ClassificationByTwoInvariants.** The map (ν,κ):B(G)→N(G)×π_1(G)_Γ is injective. For basic classes, κ restricts to a bijection B(G)_basic≅π_1(G)_Γ; their Newton point is the central rational representative determined by κ⊗1. Injectivity of ν alone is false.

**Hypotheses.** Global conventions in the reader apply; additional restrictions are stated in the contract.

**Prerequisites.** [Newton and Kottwitz invariants](#newton-and-kottwitz-maps); [ReductiveGroups#layer-7-structure-theory](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ReductiveGroups/README.md#layer-7-structure-theory).

**Proof/construction.** (1) Reduce to the centralizer of the Newton map and its basic class classification. (2) Apply the basic Kottwitz bijection there and the injectivity statement of Kot97.

**Acceptance.** Quadratic norm-one torus gives equal ν and unequal κ.

**Sources.** [Isocrystals with additional structure II](https://people.dm.unipi.it/maffei/didattica/male/lacci/Kottwitz.pdf), Section4.13 pp.274-275 (injectivity), Section4.4 pp.268-269 (basic bijection), and Section5.1 pp.278-280. Independently checked in the recorded public source version on 2026-10-07; the node retains the stated scope and conventions.; [Honda-Tate theory for Shimura varieties](https://math.berkeley.edu/~swshin/HT.pdf), 1.1.2.3 pp.6-7. The cited passage supplies the stated contract; qualifications and source corrections are retained in the node.

**Lean formulation.** full-signature-omitted; The suggested file contains a name-by-name register. A registered omission is not an elaborated theorem or a definition; the numerical tests and point stabilizer equations are expressly restricted cores. Full carrier obligations: G08.

<a id="basic-class"></a>

### Basic sigma class

**Definition: TauCeti.BunG.Basic.** A class is basic when its Newton morphism factors through Z(G), equivalently every adjoint representation slope is0. This definition applies to all connected reductive inner forms, independently of a rational representative choice.

**Hypotheses.** Global conventions in the reader apply; additional restrictions are stated in the contract.

**Prerequisites.** [Newton and Kottwitz invariants](#newton-and-kottwitz-maps); [ReductiveGroups#layer-7-structure-theory](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ReductiveGroups/README.md#layer-7-structure-theory); [Kottwitz classification by both invariants](#classification-by-two-invariants).

**Proof/construction.** (1) Use centrality of the slope morphism and tensor functoriality to identify the adjoint criterion.

**API.**

| Declaration | Role | Contract |
|---|---|---|
| TauCeti.BunG.Basic.adjoint_iff | characterisation | Basic iff the adjoint isocrystal has slope0. |
| TauCeti.BunG.Basic.ofKottwitz | constructor | Construct the unique basic class with a given integral κ. |
| TauCeti.BunG.Basic.newton | projection | Its central rational slope is determined by κ⊗1. |
| TauCeti.BunG.Basic.innerTransport | equivalence | Corresponding basic classes for inner forms have the same integral κ and transferred Newton point. |

**Discriminating unit tests.**

- **TauCeti.BunG.Basic.testGL2Half** (computation): The simple GL_2 slope1/2 class is basic.
- **TauCeti.BunG.Basic.testTorus** (degenerate): Every torus class is basic.
- **TauCeti.BunG.Basic.testNonbasic** (non-example): GL_2 with slopes1,0 is not basic.

**Uses.** FS III.4: Basic twisting replaces G by J_b. HK26 Section1.1: Selects the unique basic member of B(G,{μ}).

**Acceptance.** Basic is isoclinic for GL_n, not necessarily slope0.

**Sources.** [Honda-Tate theory for Shimura varieties](https://math.berkeley.edu/~swshin/HT.pdf), 1.1.2 p.6. The cited passage supplies the stated contract; qualifications and source corrections are retained in the node.

**Lean formulation.** full-signature-omitted; The suggested file contains a name-by-name register. A registered omission is not an elaborated theorem or a definition; the numerical tests and point stabilizer equations are expressly restricted cores. Full carrier obligations: G08.

<a id="partial-order-on-B-of-G"></a>

### Newton partial order with Kottwitz fibre

**Definition: TauCeti.BunG.NewtonOrder.** Define [b]≤[c] iff κ(b)=κ(c) and ν_b≤ν_c in the coroot order on N(G). Classification by both invariants makes this a partial order. The ν-only relation in KMPS is a preorder across all of B(G), and becomes a partial order on each κ fibre.

**Hypotheses.** Global conventions in the reader apply; additional restrictions are stated in the contract.

**Prerequisites.** [Kottwitz classification by both invariants](#classification-by-two-invariants); [Newton orbit space and rational dominance](#newton-orbit-space).

**Proof/construction.** (1) Combine reflexivity/transitivity of the coroot cone with κ equality. (2) Use the injectivity of (ν,κ) for antisymmetry.

**API.**

| Declaration | Role | Contract |
|---|---|---|
| TauCeti.BunG.NewtonOrder.le_iff | characterisation | Expose the κ equality and Newton dominance. |
| TauCeti.BunG.NewtonOrder.partialOrder | data | Reflexive, transitive and antisymmetric relation on B(G). |
| TauCeti.BunG.NewtonOrder.basic_minimal | other | The basic class with κ=α lies below every class of κ=α. |
| TauCeti.BunG.NewtonOrder.representationCriterion | characterisation | With κ fixed, dominance is equivalent to the Newton-polygon inequalities on every rational representation. |

**Discriminating unit tests.**

- **TauCeti.BunG.NewtonOrder.testGL2** (computation): Basic slopes1/2,1/2 are below slopes1,0 in κ=1.
- **TauCeti.BunG.NewtonOrder.testDifferentKappa** (non-example): GL_1 classes0 and1 are incomparable.
- **TauCeti.BunG.NewtonOrder.testTorsion** (non-example): Distinct norm-one torus κ classes are incomparable although ν is0 for both.

**Uses.** Viehmann Theorem1.1: The topology of |Bun_G| uses this ordered set. CS17 Proposition3.5.7: Determines closed upper Newton unions on the flag variety.

**Acceptance.** Order orientation is fixed once for specialization, flag stratification and charts.

**Sources.** [Geometrization of the local Langlands correspondence](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), III.2.2 p.89. The cited passage supplies the stated contract; qualifications and source corrections are retained in the node.; [Cordial elements and dimensions of affine Deligne-Lusztig varieties](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/5A27DBF48CAEF6DA56A313061848574C/S205050862100010Xa.pdf/cordial-elements-and-dimensions-of-affine-delignelusztig-varieties.pdf), Section4.1 p.7. The cited passage supplies the stated contract; qualifications and source corrections are retained in the node.

**Lean formulation.** full-signature-omitted; The suggested file contains a name-by-name register. A registered omission is not an elaborated theorem or a definition; the numerical tests and point stabilizer equations are expressly restricted cores. Full carrier obligations: G08.

**Atlas planet:** Newton partial order.

<a id="representation-detects-dominance"></a>

### Representations detect Newton dominance

**Theorem: TauCeti.BunG.RepresentationDetectsDominance.** For Γ-invariant rational cocharacter classes, ν≤νprime iff for every rational representation the descending slope tuples have the corresponding positive-coroot majorization; totals agree. Basic classes are minimal among the classes with the same rational central projection. Passing to B(G) additionally requires equality of integral κ.

**Hypotheses.** Global conventions in the reader apply; additional restrictions are stated in the contract.

**Prerequisites.** [Newton orbit space and rational dominance](#newton-orbit-space); [ReductiveGroups#layer-1-representations--comodules](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ReductiveGroups/README.md#layer-1-representations--comodules).

**Proof/construction.** (1) Reduce using dominant weights and highest weights of rational representations. (2) Separate the central character equality from the semisimple coroot inequalities.

**Acceptance.** A faithful representation alone does not establish the full equivalence without a weight-detection argument.

**Sources.** [On the classification and specialization of F-isocrystals with additional structure](https://www.numdam.org/article/CM_1996__103_2_153_0.pdf), Lemma2.2 and Proposition2.4 pp.165-166. The cited passage supplies the stated contract; qualifications and source corrections are retained in the node.

**Lean formulation.** full-signature-omitted; The suggested file contains a name-by-name register. A registered omission is not an elaborated theorem or a definition; the numerical tests and point stabilizer equations are expressly restricted cores. Full carrier obligations: G08.

<a id="admissible-pair"></a>

### Acceptable classes B(G,{μ})

**Definition: TauCeti.BunG.Acceptable.** For a geometric cocharacter class {μ}, set B(G,{μ})={ [b] : κ(b)=μ♯ and N_ξ(ν_b)≤μ◇ }. ξ is an inner twisting to the quasi-split form used for the dominant average. Both conditions are required. Acceptable describes the local invariant set; it does not assert existence of a period point or weak admissibility.

**Hypotheses.** Global conventions in the reader apply; additional restrictions are stated in the contract.

**Prerequisites.** [Galois averaging and Hodge invariants](#galois-average); [Newton and Kottwitz invariants](#newton-and-kottwitz-maps); [Newton partial order with Kottwitz fibre](#partial-order-on-B-of-G).

**Proof/construction.** (1) Define the subtype of sigma classes satisfying the two invariant conditions. (2) Check independence of Borel, torus and inner twisting via invariant transport.

**API.**

| Declaration | Role | Contract |
|---|---|---|
| TauCeti.BunG.Acceptable.mem_iff | characterisation | Membership is full κ equality and Newton bound. |
| TauCeti.BunG.Acceptable.basic | constructor | The unique basic class of κ=μ♯ lies in B(G,{μ}). API prerequisites: [Finiteness and the basic acceptable member](#admissible-finiteness-and-basic). |
| TauCeti.BunG.Acceptable.finite | other | The acceptable subset is finite. API prerequisites: [Finiteness and the basic acceptable member](#admissible-finiteness-and-basic). |
| TauCeti.BunG.Acceptable.torus_iff | simp | For T, membership is κ_T(b)=μ♯; the Newton equality follows. |
| TauCeti.BunG.Acceptable.product | equivalence | Acceptable sets for a product factor with the component bounds. API prerequisites: [Products and unramified restriction of scalars](#product-and-unramified-norm). |

**Discriminating unit tests.**

- **TauCeti.BunG.Acceptable.testGL2** (computation): For split GL_2 and μ=(1,0), basic slopes1/2,1/2 and ordinary slopes1,0 occur.
- **TauCeti.BunG.Acceptable.testZero** (degenerate): B(G,{0}) contains exactly its basic class with κ=0.
- **TauCeti.BunG.Acceptable.testTorsion** (non-example): For the quadratic norm-one torus μ=1, only κ=1 mod2 is allowed, though both Newton points equal μ◇=0.

**Uses.** HK26 Section1.1 and IG.0: Use finite indexing and its unique basic element. GLX Lemma3.16 and KMPS1.1.13: Lift bounded data through z-extensions and Levi subgroups.

**Acceptance.** Apply μ inverse in the CS flag convention.

**Sources.** [Honda-Tate theory for Shimura varieties](https://math.berkeley.edu/~swshin/HT.pdf), 1.1.5 conditions1.1.5.1-2 p.8. The cited passage supplies the stated contract; qualifications and source corrections are retained in the node.; [Independence of l for Frobenius conjugacy classes attached to abelian varieties](https://arxiv.org/pdf/2103.09945v2), Definition2.2.3 p.10. The cited passage supplies the stated contract; qualifications and source corrections are retained in the node.

**Lean formulation.** full-signature-omitted; The suggested file contains a name-by-name register. A registered omission is not an elaborated theorem or a definition; the numerical tests and point stabilizer equations are expressly restricted cores. Full carrier obligations: G08.

**Atlas planet:** Acceptable Newton classes.

<a id="levi-newton-formula"></a>

### Basic Levi Newton formula

**Theorem: TauCeti.BunG.LeviNewtonFormula.** For quasi-split G/Q_p and a rational standard Levi M, a basic class b_M with κ_M(b_M)=μ_M♯ has Newton point the corresponding element of (X_*(Z_M)⊗Q)^Γ. If μ_M and μ have the same image in π_1(G), its image in B(G) is acceptable for μ precisely when its G-dominant Newton point is bounded by μ◇. The M-dominant and G-dominant representatives can differ by a Weyl conjugation.

**Hypotheses.** Global conventions in the reader apply; additional restrictions are stated in the contract.

**Prerequisites.** [Basic sigma class](#basic-class); [Acceptable classes B(G,{μ})](#admissible-pair); [ReductiveGroups#layer-7-structure-theory](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ReductiveGroups/README.md#layer-7-structure-theory); [ReductiveGroupsPartII:RG2.1](https://github.com/TauCetiProject/TauCetiRoadmap/blob/201bcaee1f4014c91897d50cdb7631fc6d6a6d71/TauCetiRoadmap/ReductiveGroupsPartII/README.md).

**Proof/construction.** (1) Project the basic invariant through the rational center isomorphism for M. (2) Use the functorial π_1 map and take G-dominant Newton representatives.

**Acceptance.** For a nonbasic G-class several distinct basic Levi classes can map to it; their Levi κ values need not coincide.

**Sources.** [Honda-Tate theory for Shimura varieties](https://math.berkeley.edu/~swshin/HT.pdf), Lemma1.1.12 p.10. The cited passage supplies the stated contract; qualifications and source corrections are retained in the node.; [Cordial elements and dimensions of affine Deligne-Lusztig varieties](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/5A27DBF48CAEF6DA56A313061848574C/S205050862100010Xa.pdf/cordial-elements-and-dimensions-of-affine-delignelusztig-varieties.pdf), Section6.2 p.13. The cited passage supplies the stated contract; qualifications and source corrections are retained in the node.

**Lean formulation.** full-signature-omitted; The suggested file contains a name-by-name register. A registered omission is not an elaborated theorem or a definition; the numerical tests and point stabilizer equations are expressly restricted cores. Full carrier obligations: G08.

<a id="ordinary-class"></a>

### Ordinary Newton class

**Definition: TauCeti.BunG.Ordinary.** An acceptable class is μ-ordinary when its transferred dominant Newton point equals μ◇. Classification makes such a class unique if it exists. Its existence is guaranteed for quasi-split G; it is not automatic for a general inner form. For either characteristic, every B(G,{μ}) has a unique maximum, which need not satisfy ordinary equality.

**Hypotheses.** Global conventions in the reader apply; additional restrictions are stated in the contract.

**Prerequisites.** [Acceptable classes B(G,{μ})](#admissible-pair); [Kottwitz classification by both invariants](#classification-by-two-invariants); [Unique maximum of acceptable classes](#acceptable-unique-maximum).

**Proof/construction.** (1) Define equality with the actual Hodge average, retaining acceptability. (2) Use injectivity of (ν,κ) for uniqueness; use KZ’s quasi-split existence argument. (3) Import the general-field maximum deduction from the characteristic-independent He–Nie root-datum theorem; retain its specific RG2.4 and convex-proof obligations.

**API.**

| Declaration | Role | Contract |
|---|---|---|
| TauCeti.BunG.Ordinary.isOrdinary | relation | Acceptability and equality of transferred Newton with μ◇. |
| TauCeti.BunG.Ordinary.unique | characterisation | At most one acceptable class is ordinary. |
| TauCeti.BunG.Ordinary.quasiSplitExists | universal-property | Quasi-split G admits the ordinary class. |
| TauCeti.BunG.Ordinary.maximal | other | An ordinary class is the maximum of B(G,{μ}). |
| TauCeti.BunG.Ordinary.derivedIsogeny | compatibility | A morphism inducing an isogeny on derived groups preserves ordinary existence and membership for compatible μ. |

**Discriminating unit tests.**

- **TauCeti.BunG.Ordinary.testGL2** (computation): For split GL_2 μ=(1,0), slopes1,0 are ordinary and1/2,1/2 are not.
- **TauCeti.BunG.Ordinary.testTorus** (degenerate): The unique acceptable torus class is ordinary.
- **TauCeti.BunG.Ordinary.testQuaternion** (non-example): For G=D^× with invariant1/2 and geometric μ inverse=(0,−1), the acceptable set has its basic maximum but no ordinary member: after splitting/twisting the hypothetical slopes1/2,−1/2 each have multiplicity1, contrary to their denominator2.

**Uses.** KZ2.2.6-2.3.3: Provides a straight translation and integral conjugacy. CS24 ordinary stratum: Supplies the local index; the unitary dimension calculation retains its own datum.

**Acceptance.** The μ-ordinary predicate and maximum are separate contracts.

**Sources.** [Independence of l for Frobenius conjugacy classes attached to abelian varieties](https://arxiv.org/pdf/2103.09945v2), Definition2.2.4 and Remark2.2.5 p.10. The cited passage supplies the stated contract; qualifications and source corrections are retained in the node.; [Honda-Tate theory for Shimura varieties](https://math.berkeley.edu/~swshin/HT.pdf), Section1.3.15 p.20. The cited passage supplies the stated contract; qualifications and source corrections are retained in the node.

**Lean formulation.** full-signature-omitted; The suggested file contains a name-by-name register. A registered omission is not an elaborated theorem or a definition; the numerical tests and point stabilizer equations are expressly restricted cores. Full carrier obligations: G08.

**Atlas planet:** Ordinary Newton class.

<a id="acceptable-unique-maximum"></a>

### Unique maximum of acceptable classes

**Theorem: TauCeti.BunG.AcceptableUniqueMaximum.** For a connected reductive group G over any nonarchimedean local field E with finite residue field, and a geometric conjugacy class {μ}, B(G,{μ}) has a unique maximum for the fixed-integral-κ Newton order. It is ordinary exactly when its Newton point equals μ◇. The general-field assertion is derived from the characteristic-independent root-datum theorem HN18 Theorem1.1(1) and the local straight-class/invariant comparison; it is not attributed to HN18 Theorem0.1 outside that theorem’s p-adic scope.

**Hypotheses.** G/E is connected reductive, E is a nonarchimedean local field of either characteristic, and {μ} is a geometric cocharacter conjugacy class. No quasi-split hypothesis. Use the actual local affine root datum and Frobenius action from RG2.4. Retain the full integral κ fibre while removing central inertia torsion for the numerical root-datum calculation.

**Prerequisites.** [Acceptable classes B(G,{μ})](#admissible-pair); [ReductiveGroupsPartII:RG2.4](https://github.com/TauCetiProject/TauCetiRoadmap/blob/201bcaee1f4014c91897d50cdb7631fc6d6a6d71/TauCetiRoadmap/ReductiveGroupsPartII/README.md); [Straight Weyl comparison with B(G)](#straight-weyl-classification); [Kottwitz classification by both invariants](#classification-by-two-invariants).

**Proof/construction.** (1) Import the local Iwahori–Weyl datum, Frobenius and geometric cocharacter projection. He16 §2.2 permits both characteristics; its §2.4 comparison preserves κ and Newton points before the equal-characteristic restriction in §2.5. (2) By StraightWeylClassification and two-invariant injectivity, the acceptable B(G) fibre identifies as a poset with the acceptable Newton values in the corresponding affine datum, at the fixed integral κ. (3) For the finite central inertia-torsion subgroup K of the Iwahori–Weyl translation lattice, project to the torsion-free datum. Right exactness of σ-coinvariants identifies the kernel of the projected κ map with the image of K_σ. A lift with the wrong integral κ is corrected by a central torsion element; its Newton value is unchanged. Thus this numerical projection preserves the acceptable Newton set within the chosen κ fibre, without replacing κ by its rationalization. (4) The resulting based reduced root datum and finite-order alcove-preserving affine Frobenius satisfy HN18 §1.3–§1.4. Pass to its adjoint datum using §2.1; express the affine action as an alcove stabilizer times a linear diagram action as in §2.2. (5) Apply HN18 Theorem1.1(1). Its proof (§2.3–§2.5) uses the orbit-weight integrality criterion of Lemma2.5 and the largest allowed orbit-weight bounds to construct a Newton value ν. Chai Theorem6.5 gives the least dominant majorant of those bounds, and Lemma6.2(i) shows every acceptable value is ≤ν. These external convex/root proof inputs remain explicit G06/RG2.4 obligations. (6) Lift back to the chosen integral κ as above and then to B(G). Two-invariant injectivity gives a unique class, and order compatibility makes it dominate every acceptable class. This field-independent transfer is our deduction from the cited root-datum theorem, not a claim that the paper’s p-adic Appendix A states an equal-characteristic theorem. (7) Compare the resulting Newton value with μ◇ to characterize ordinary equality. Unique maximality does not assert ordinary existence for nonsplit inner forms.

**Acceptance.** In a nonsplit inner form maximality alone does not imply ordinary equality.

**Sources.** [On the acceptable elements](https://arxiv.org/pdf/1408.5836), §§1.1–1.4 pp.2–4, Theorem1.1(1) p.4; §§2.1–2.5 pp.4–8; Appendix A pp.20–22. The root-datum maximum theorem has no field parameter. The p-adic group theorem and Appendix are kept within their stated scope; the general-field transfer and fixed-κ central-torsion argument are explicit deductions in this proof sketch.; [Hecke algebras and p-adic groups](https://arxiv.org/pdf/1511.01386v3), §2.2 pp.22–24 and §2.4, Theorem2.6 pp.25–26. Supplies the local Iwahori–Weyl and invariant-preserving class comparison for a general local field. This citation precedes the equal-characteristic-only schematic closure discussion.; [Independence of l for Frobenius conjugacy classes attached to abelian varieties](https://arxiv.org/pdf/2103.09945v2), Remark2.2.5 p.10. Supplies the p-adic application and the distinction between a maximum and an ordinary class.

**Lean formulation.** full-signature-omitted; The suggested file contains a name-by-name register. A registered omission is not an elaborated theorem or a definition; the numerical tests and point stabilizer equations are expressly restricted cores. Full carrier obligations: G08.

<a id="ordinary-straight-translation"></a>

### Ordinary straight translation and Levi centrality

**Theorem: TauCeti.BunG.OrdinaryStraightTranslation.** Every ordinary class has a representative lifting a σ-straight translation t_μprime with μprime in the relative Weyl orbit of the projected μ. Such a translation has μprime central in the rational Newton Levi. If μprime=w(μ) with μ the projection of an absolute dominant cocharacter μtilde, the compatible absolute lift w(μtilde) is central in that Levi. The absolute/relative projection and Frobenius are part of the supplied root datum.

**Hypotheses.** Global conventions in the reader apply; additional restrictions are stated in the contract.

**Prerequisites.** [Ordinary Newton class](#ordinary-class); [Straight Weyl comparison with B(G)](#straight-weyl-classification); [ReductiveGroupsPartII:RG2.4](https://github.com/TauCetiProject/TauCetiRoadmap/blob/201bcaee1f4014c91897d50cdb7631fc6d6a6d71/TauCetiRoadmap/ReductiveGroupsPartII/README.md); [ReductiveGroups#layer-7-structure-theory](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ReductiveGroups/README.md#layer-7-structure-theory).

**Proof/construction.** (1) Apply the straightness equality to compare the coroot pairings with the Newton centralizer. (2) Use the compatible absolute lift and averaging to force the remaining Levi root pairings to vanish. (3) Use ordinary equality and the straight-class bijection to choose the translation representative.

**Acceptance.** Centrality is in the Newton Levi, not necessarily in G.

**Sources.** [Independence of l for Frobenius conjugacy classes attached to abelian varieties](https://arxiv.org/pdf/2103.09945v2), Lemma2.2.6 p.10, using Lemma2.1.7 p.8 and Lemma2.1.9 p.9 (arXiv v2). Independently checked in the recorded public source version on 2026-10-07; the node retains the stated scope and conventions.

**Lean formulation.** full-signature-omitted; The suggested file contains a name-by-name register. A registered omission is not an elaborated theorem or a definition; the numerical tests and point stabilizer equations are expressly restricted cores. Full carrier obligations: G08.

<a id="ordinary-derived-isogeny"></a>

### Ordinary classes under a derived isogeny

**Theorem: TauCeti.BunG.OrdinaryDerivedIsogeny.** If f:G→Gprime induces an isogeny of derived groups and sends μ to μprime, the ordinary class exists for (G,μ) iff it exists for (Gprime,μprime). For b∈B(G,{μ}), b is ordinary iff f(b) is ordinary. The proof compares the noncentral root data and restores the central equality from acceptability.

**Hypotheses.** Global conventions in the reader apply; additional restrictions are stated in the contract.

**Prerequisites.** [Ordinary Newton class](#ordinary-class); [Ordinary straight translation and Levi centrality](#ordinary-straight-translation); [ReductiveGroups#layer-7-structure-theory](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ReductiveGroups/README.md#layer-7-structure-theory).

**Proof/construction.** (1) Compare the dominant Newton points modulo the center using the derived isogeny. (2) The rational κ compatibility fixes the central component, so equality lifts. (3) For existence use the compatible straight translation and Kottwitz class.

**Acceptance.** The morphism need not be an isomorphism on centers; this is why full acceptability is retained.

**Sources.** [Independence of l for Frobenius conjugacy classes attached to abelian varieties](https://arxiv.org/pdf/2103.09945v2), Lemma2.2.8 p.10. The cited passage supplies the stated contract; qualifications and source corrections are retained in the node.

**Lean formulation.** full-signature-omitted; The suggested file contains a name-by-name register. A registered omission is not an elaborated theorem or a definition; the numerical tests and point stabilizer equations are expressly restricted cores. Full carrier obligations: G08.

<a id="ordinary-integral-conjugacy"></a>

### Integral conjugacy of an ordinary admissible element

**Theorem: TauCeti.BunG.OrdinaryIntegralConjugacy.** In the KZ local setup with the specified connected parahoric model, if b is μ-ordinary and lies in the union of μ-admissible parahoric double cosets, b lies in the double coset of a σ-straight translation t_μprime for μprime in W_0μ. It is σ-conjugate to the chosen translation lift by an element of G(O_breveF). The claim is for elements satisfying the integral double-coset hypothesis, not every representative of the ordinary class.

**Hypotheses.** Use KZ §2.1: F a nonarchimedean local field, connected reductive G/F, a σ-stable alcove, its Iwahori model I, and a specified connected parahoric model G_script with subgroup W_J. Require b to lie in both the μ-admissible parahoric double-coset union and the ordinary class. Here G_script(O_breveF) is the parahoric subgroup, not the rational points of G.

**Prerequisites.** [Ordinary straight translation and Levi centrality](#ordinary-straight-translation); [ReductiveGroupsPartII:RG2.4](https://github.com/TauCetiProject/TauCetiRoadmap/blob/201bcaee1f4014c91897d50cdb7631fc6d6a6d71/TauCetiRoadmap/ReductiveGroupsPartII/README.md); [ReductiveGroupsPartII:RG2.3](https://github.com/TauCetiProject/TauCetiRoadmap/blob/201bcaee1f4014c91897d50cdb7631fc6d6a6d71/TauCetiRoadmap/ReductiveGroupsPartII/README.md).

**Proof/construction.** (1) Use He–Rapoport Theorem6.1(b) to σ-conjugate b by the specified parahoric into an Iwahori cell indexed by a minimal W_J coset representative. He16 Theorem6.1 puts that index in Adm(μ). (2) Use He–Zhou Theorem4.1 to find a σ-straight x below that index whose Iwahori cell meets the ordinary class, and He14 Theorem3.5 to identify its class. The ordinary equality and KZ Lemma2.2.6 force x=t_μprime; admissible length comparison forces the original index to equal x. (3) Apply He14 Proposition4.5: the Iwahori double coset of a σ-straight lift is a single σ-conjugacy orbit under I(O_breveF). Composing the two integral conjugators proves (2). These non-routine imported inputs remain the precise G10 obligations.

**Acceptance.** A conjugate by an arbitrary G(L) element can leave the admissible integral double coset.

**Sources.** [Independence of l for Frobenius conjugacy classes attached to abelian varieties](https://arxiv.org/pdf/2103.09945v2), Proposition2.3.3 pp.11-12. The cited passage supplies the stated contract; qualifications and source corrections are retained in the node.

**Lean formulation.** full-signature-omitted; The suggested file contains a name-by-name register. A registered omission is not an elaborated theorem or a definition; the numerical tests and point stabilizer equations are expressly restricted cores. Full carrier obligations: G08.

<a id="product-and-unramified-norm"></a>

### Products and unramified restriction of scalars

**Comparison: TauCeti.BunG.ProductAndUnramifiedNorm.** B(G1×G2)=B(G1)×B(G2), compatibly with ν,κ,defect and acceptable bounds. For E/F unramified of degree d and G=Res_(E/F)H, after decomposing G(breveF) into d factors, Nm(b)=b_0 σ(b_1)⋯σ^(d−1)(b_(d−1)) gives B(G,σ)≅B(H,σ_E). The bound on H is the sum of the component cocharacters, with the chosen factor identifications. J_b^G≅Res_(E/F)J_Nm(b)^H and the F/E split-rank defects agree.

**Hypotheses.** Global conventions in the reader apply; additional restrictions are stated in the contract.

**Prerequisites.** [Defect of a sigma class](#defect); [Acceptable classes B(G,{μ})](#admissible-pair); [ReductiveGroups#layer-7-structure-theory](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ReductiveGroups/README.md#layer-7-structure-theory).

**Proof/construction.** (1) Write the Frobenius cycle on the d factors and eliminate d−1 factors by sigma conjugation. (2) Compare the surviving semilinear operator and centralizer. (3) Use Shapiro on π_1 and sum the Hodge components; compare ρ pairings with the precise normalized Newton tuple.

**Acceptance.** Do not multiply the defect by d; restriction of scalars preserves the appropriate local split rank.

**Sources.** [Affine Grassmannians and the geometric Satake in mixed characteristic](https://annals.math.princeton.edu/wp-content/uploads/annals-v185-n2-p02-p.pdf), Remark3.6 and Lemma3.7 p.459. The cited passage supplies the stated contract; qualifications and source corrections are retained in the node.; [Isocrystals with additional structure II](https://people.dm.unipi.it/maffei/didattica/male/lacci/Kottwitz.pdf), Section6.5 equations6.5.2-6.5.3 p.288. The cited passage supplies the stated contract; qualifications and source corrections are retained in the node.

**Lean formulation.** full-signature-omitted; The suggested file contains a name-by-name register. A registered omission is not an elaborated theorem or a definition; the numerical tests and point stabilizer equations are expressly restricted cores. Full carrier obligations: G08.

<a id="basic-levi-fibre-uniqueness"></a>

### Levi fibre over a basic G-class

**Theorem: TauCeti.BunG.BasicLeviFibreUniqueness.** For a basic G-class and a σ-stable standard Levi, its intersection with the Levi has at most one Levi σ-conjugacy class. For a nonbasic G-class the corresponding uniqueness assertion is false; the Levi-dominant Newton vector can be a Weyl conjugate of the G-dominant vector and Levi κ must be checked separately.

**Hypotheses.** Global conventions in the reader apply; additional restrictions are stated in the contract.

**Prerequisites.** [Kottwitz classification by both invariants](#classification-by-two-invariants); [Basic Levi Newton formula](#levi-newton-formula); [ReductiveGroupsPartII:RG2.4](https://github.com/TauCetiProject/TauCetiRoadmap/blob/201bcaee1f4014c91897d50cdb7631fc6d6a6d71/TauCetiRoadmap/ReductiveGroupsPartII/README.md).

**Proof/construction.** (1) Use the basic central Newton vector and the integral Levi invariant compatibility. (2) Apply the corrected GHN basic-only uniqueness statement cited by He. (3) Keep the nonbasic Levi invariant obstruction for ADLV consumers; do not import a false general uniqueness lemma.

**Acceptance.** In GL_3, different allocations of slopes to unequal Levi blocks can give different Levi κ while mapping to the same G-class.

**Sources.** [Cordial elements and dimensions of affine Deligne-Lusztig varieties](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/5A27DBF48CAEF6DA56A313061848574C/S205050862100010Xa.pdf/cordial-elements-and-dimensions-of-affine-delignelusztig-varieties.pdf), Theorem6.3 footnote and Section6.2 pp.13-14. The cited passage supplies the stated contract; qualifications and source corrections are retained in the node.

**Lean formulation.** full-signature-omitted; The suggested file contains a name-by-name register. A registered omission is not an elaborated theorem or a definition; the numerical tests and point stabilizer equations are expressly restricted cores. Full carrier obligations: G08.

<a id="gl-minuscule-quasisplit-centralizer"></a>

### Quasi-split centralizer in the GL minuscule case

**Theorem: TauCeti.BunG.GlMinusculeQuasisplitCentralizer.** For GL_n over a p-adic field L and μ(t)=diag(t repeated n−q,1 repeated q), exactly one class in B(GL_n/L,{μ^−1}) has quasi-split J_b: the ordinary class diag(π^−1 repeated n−q,1 repeated q). The extension to the CS17 unramified restrictions of scalars uses the cocharacter supported at one noncentral embedding. No implication quasi-split J_b⇒ordinary is claimed for arbitrary reductive data.

**Hypotheses.** Global conventions in the reader apply; additional restrictions are stated in the contract.

**Prerequisites.** [Algebraic sigma-centralizer](#sigma-centralizer-J-b); [Ordinary Newton class](#ordinary-class); [Products and unramified restriction of scalars](#product-and-unramified-norm); [VectorBundlesAndIsocrystals:VB0/dieudonne-manin-isocrystals](../../../content/campaign/VectorBundlesAndIsocrystals/README.md); [ReductiveGroups#layer-7-structure-theory](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ReductiveGroups/README.md#layer-7-structure-theory).

**Proof/construction.** (1) Acceptability confines slopes to [−1,0]. (2) A nonintegral slope introduces a nontrivial division algebra factor in J_b and prevents quasi-splitness. (3) κ fixes the multiplicities of the integral slopes−1 and0. (4) For Res use the single-embedding norm-bound normalization from the source.

**Acceptance.** For an arbitrary cocharacter with more integral slopes, a quasi-split centralizer need not select the ordinary class.

**Sources.** [On the generic part of the cohomology of compact unitary Shimura varieties](https://annals.math.princeton.edu/wp-content/uploads/annals-v186-n3-p01-p.pdf), Lemma5.5.8 and preceding footnote p.748. The cited passage supplies the stated contract; qualifications and source corrections are retained in the node.

**Lean formulation.** full-signature-omitted; The suggested file contains a name-by-name register. A registered omission is not an elaborated theorem or a definition; the numerical tests and point stabilizer equations are expressly restricted cores. Full carrier obligations: G08.

<a id="admissible-finiteness-and-basic"></a>

### Finiteness and the basic acceptable member

**Theorem: TauCeti.BunG.AdmissibleFinitenessAndBasic.** B(G,{μ}) is finite and has exactly one basic member, characterized by κ=μ♯. That member is its minimum for the Newton order. For μ=0 it is the only member. For tori the whole acceptable set is this singleton.

**Hypotheses.** Global conventions in the reader apply; additional restrictions are stated in the contract.

**Prerequisites.** [Acceptable classes B(G,{μ})](#admissible-pair); [Basic sigma class](#basic-class); [Representations detect Newton dominance](#representation-detects-dominance).

**Proof/construction.** (1) Use the finite coroot interval and denominator constraints from classification. (2) Apply basic minimality at the rational projection of μ♯. (3) For a torus there are no nonzero coroots, so κ determines the class.

**Acceptance.** Zero bound cannot contain a noncentral positive-coroot displacement with the same central projection.

**Sources.** [Isocrystals with additional structure II](https://people.dm.unipi.it/maffei/didattica/male/lacci/Kottwitz.pdf), Section6.4 and6.6 pp.287-288. The cited passage supplies the stated contract; qualifications and source corrections are retained in the node.; [Honda-Tate theory for Shimura varieties](https://math.berkeley.edu/~swshin/HT.pdf), Lemma1.1.6 p.8. The cited passage supplies the stated contract; qualifications and source corrections are retained in the node.

**Lean formulation.** full-signature-omitted; The suggested file contains a name-by-name register. A registered omission is not an elaborated theorem or a definition; the numerical tests and point stabilizer equations are expressly restricted cores. Full carrier obligations: G08.

<a id="rational-newton-witness"></a>

### Rational Newton representative

**Definition: TauCeti.BunG.RationalNewtonWitness.** A rational-Newton witness for [b] is a Q_p-rational homomorphism ν_G([b]):D→G in the G(L)-conjugacy class of ν_b, with a specified conjugator. It exists when G is quasi-split or [b] is basic; the KMPS constructions that require it retain this hypothesis for general inner forms.

**Hypotheses.** Global conventions in the reader apply; additional restrictions are stated in the contract.

**Prerequisites.** [Newton and Kottwitz invariants](#newton-and-kottwitz-maps); [ReductiveGroups#layer-7-structure-theory](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ReductiveGroups/README.md#layer-7-structure-theory); [Basic sigma class](#basic-class).

**Proof/construction.** (1) Record the actual representative and conjugacy equation. (2) For quasi-split groups choose the Γ-fixed dominant member; for basic classes descend the central morphism.

**API.**

| Declaration | Role | Contract |
|---|---|---|
| TauCeti.BunG.RationalNewtonWitness.quasiSplit | constructor | Build the unique B-dominant rational representative for quasi-split G. |
| TauCeti.BunG.RationalNewtonWitness.basic | constructor | A basic class has a central rational representative. |
| TauCeti.BunG.RationalNewtonWitness.levi | projection | Return Z_G(ν_G([b])) as an E-defined Levi. |
| TauCeti.BunG.RationalNewtonWitness.centralOnJ | projection | Transport the central Newton morphism to J_b, retaining the inner identification. API prerequisites: [Central Newton morphism of the centralizer](#central-newton-on-J). |

**Discriminating unit tests.**

- **TauCeti.BunG.RationalNewtonWitness.testSplitGL2** (computation): The slope1,0 map has the diagonal rational representative.
- **TauCeti.BunG.RationalNewtonWitness.testBasic** (degenerate): A basic witness centralizes all of G.
- **TauCeti.BunG.RationalNewtonWitness.testInnerForm** (non-example): An anisotropic inner form need not realize a noncentral geometric Newton orbit rationally.

**Uses.** KMPS1.1.15-1.1.17: Supports rational Levi reduction and torus transfer. Kisin17 proof2.2.2: Supplies the dominant rational Newton representative.

**Acceptance.** Galois invariance of an orbit is weaker than having a rational representative in G.

**Sources.** [Honda-Tate theory for Shimura varieties](https://math.berkeley.edu/~swshin/HT.pdf), 1.1.3 condition1.1.3.1 p.7. The cited passage supplies the stated contract; qualifications and source corrections are retained in the node.

**Lean formulation.** full-signature-omitted; The suggested file contains a name-by-name register. A registered omission is not an elaborated theorem or a definition; the numerical tests and point stabilizer equations are expressly restricted cores. Full carrier obligations: G08.

<a id="minuscule-basic-levi-lift"></a>

### Minuscule basic Levi lifting

**Theorem: TauCeti.BunG.MinusculeBasicLeviLift.** For a connected reductive G/Q_p, a rational Levi M containing a maximal torus T, a G-minuscule μ∈X_*(T), and basic b_M whose image lies in B(G,{μ}), some w in the absolute Weyl group W(G,T) makes b_M∈B(M,{wμ}). For quasi-split G the proof first treats unramified models, then replaces the based-root averaging datum by an unramified datum; the general case transports the rational Levi to G*.

**Hypotheses.** Global conventions in the reader apply; additional restrictions are stated in the contract.

**Prerequisites.** [Basic Levi Newton formula](#levi-newton-formula); [Rational Newton representative](#rational-newton-witness); [ReductiveGroups#layer-7-structure-theory](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ReductiveGroups/README.md#layer-7-structure-theory); [ReductiveGroupsPartII:RG2.4](https://github.com/TauCetiProject/TauCetiRoadmap/blob/201bcaee1f4014c91897d50cdb7631fc6d6a6d71/TauCetiRoadmap/ReductiveGroupsPartII/README.md); [ReductiveGroupsPartII:RG2.1](https://github.com/TauCetiProject/TauCetiRoadmap/blob/201bcaee1f4014c91897d50cdb7631fc6d6a6d71/TauCetiRoadmap/ReductiveGroupsPartII/README.md).

**Proof/construction.** (1) Use Wintenberger Cartan realization, Iwasawa reduction and Mazur inequality in the unramified case. (2) Require equality of the integral π_1(G) class in the Satake reduction; minuscule dominance alone is insufficient. (3) Use the torsion-free kernel of π_1(M)_Γ→π_1(G)_Γ and the matching Galois averages for the unramified replacement. (4) Transport a rational parabolic and its rational Levi by the inner twisting; basic κ and ν are compatible.

**Acceptance.** GL_3 with M=GL_1×GL_2, μ=(0,1,0), b_M=diag(p,1,1) needs the absolute Weyl swap; N_G(M)/M is trivial.

**Sources.** [Honda-Tate theory for Shimura varieties](https://math.berkeley.edu/~swshin/HT.pdf), Proposition1.1.13 and Corollary1.1.15 pp.10-12. The cited passage supplies the stated contract; qualifications and source corrections are retained in the node.; [Honda-Tate theory for Shimura varieties](https://math.berkeley.edu/~swshin/HT.pdf), Corollary1.1.15 p.11. The cited passage supplies the stated contract; qualifications and source corrections are retained in the node.

**Lean formulation.** full-signature-omitted; The suggested file contains a name-by-name register. A registered omission is not an elaborated theorem or a definition; the numerical tests and point stabilizer equations are expressly restricted cores. Full carrier obligations: G08.

<a id="torus-norm-description"></a>

### Torus norm and Newton average

**Theorem: TauCeti.BunG.TorusNormDescription.** For a torus T/E, κ:B(T)≅X_*(T)_Γ and ν of the class κ^−1([λ]) is the rational Γ-average of λ. Kottwitz’s finite splitting-field norm construction gives a representative after choosing the splitting extension, the unramified coefficient field and the valuation normalization of its uniformizer; these choices do not change the resulting class.

**Hypotheses.** Global conventions in the reader apply; additional restrictions are stated in the contract.

**Prerequisites.** [Kottwitz classification by both invariants](#classification-by-two-invariants); [Galois averaging and Hodge invariants](#galois-average); [ReductiveGroups#layer-7-structure-theory](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ReductiveGroups/README.md#layer-7-structure-theory).

**Proof/construction.** (1) Apply the valuation/cocharacter description over a splitting extension. (2) Use norm maps and Shapiro to descend the cocharacter class. (3) Identify Newton slopes through all characters with the normalized Galois average.

**Acceptance.** For a quadratic norm-one torus, two integral κ classes have Newton0.

**Sources.** [Honda-Tate theory for Shimura varieties](https://math.berkeley.edu/~swshin/HT.pdf), 1.1.2.4 p.7. The cited passage supplies the stated contract; qualifications and source corrections are retained in the node.; [Isocrystals with additional structure](https://www.numdam.org/article/CM_1985__56_2_201_0.pdf), Sections2.4-2.8 pp.208-210. The cited passage supplies the stated contract; qualifications and source corrections are retained in the node.

**Lean formulation.** full-signature-omitted; The suggested file contains a name-by-name register. A registered omission is not an elaborated theorem or a definition; the numerical tests and point stabilizer equations are expressly restricted cores. Full carrier obligations: G08.

<a id="torus-special-pair"></a>

### Torus-special acceptable pair

**Definition: TauCeti.BunG.TorusSpecial.** For T⊂G a maximal torus over Q_p, an acceptable pair ([b],{μ}) is T-special if there exists μ_T∈X_*(T) in {μ} such that the unique class of B(T) with κ_T=[μ_T] maps to [b]. For tori admissibility is determined by κ, and the Newton point is the Galois average of μ_T. This packages local specialness, not a global CM point.

**Hypotheses.** Global conventions in the reader apply; additional restrictions are stated in the contract.

**Prerequisites.** [Acceptable classes B(G,{μ})](#admissible-pair); [Torus norm and Newton average](#torus-norm-description); [ReductiveGroups#layer-7-structure-theory](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ReductiveGroups/README.md#layer-7-structure-theory).

**Proof/construction.** (1) Use the torus Kottwitz bijection to define the class from the cocharacter. (2) State its image equality in B(G) as the witness, rather than asserting arbitrary torus specialness.

**API.**

| Declaration | Role | Contract |
|---|---|---|
| TauCeti.BunG.TorusSpecial.mk | constructor | Package μ_T, its conjugacy class and its torus-class image equation. |
| TauCeti.BunG.TorusSpecial.witness | projection | Recover μ_T and the B(T) class. |
| TauCeti.BunG.TorusSpecial.newton | compatibility | The mapped class has Newton orbit the image of average(μ_T). |
| TauCeti.BunG.TorusSpecial.ellipticBasic | constructor | For elliptic T a basic acceptable pair has a T-special witness. API prerequisites: [Elliptic tori and basic acceptable classes](#elliptic-torus-basic-image). |

**Discriminating unit tests.**

- **TauCeti.BunG.TorusSpecial.testSplitGL1** (computation): For G=T=G_m, μ=m gives the class of p^m.
- **TauCeti.BunG.TorusSpecial.testZero** (degenerate): The trivial class with μ=0 is T-special.
- **TauCeti.BunG.TorusSpecial.testSplitTorus** (non-example): For GL_2, the basic slope1/2 class cannot come from an integral cocharacter of the split diagonal torus; the ellipticity hypothesis matters.

**Uses.** KMPS Lemma1.1.8: Supplies local basic specialness. KMPS Corollary1.1.17: Transferred maximal tori supply the nonbasic special witness.

**Acceptance.** The witness fixes both the cocharacter orbit and full κ.

**Sources.** [Honda-Tate theory for Shimura varieties](https://math.berkeley.edu/~swshin/HT.pdf), Definition1.1.7 p.8. The cited passage supplies the stated contract; qualifications and source corrections are retained in the node.

**Lean formulation.** full-signature-omitted; The suggested file contains a name-by-name register. A registered omission is not an elaborated theorem or a definition; the numerical tests and point stabilizer equations are expressly restricted cores. Full carrier obligations: G08.

<a id="elliptic-torus-basic-image"></a>

### Elliptic tori and basic acceptable classes

**Theorem: TauCeti.BunG.EllipticTorusBasicImage.** If T⊂G is elliptic modulo Z(G), the image of B(T)→B(G) is exactly B(G)_basic. For every basic acceptable pair ([b],{μ}) and every μ_T∈X_*(T) in {μ}, the image of κ_T^−1([μ_T]) is [b]. Thus every such pair is T-special; this argument requires no minuscule hypothesis.

**Hypotheses.** Global conventions in the reader apply; additional restrictions are stated in the contract.

**Prerequisites.** [Torus-special acceptable pair](#torus-special-pair); [Basic sigma class](#basic-class); [ReductiveGroups#layer-7-structure-theory](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ReductiveGroups/README.md#layer-7-structure-theory).

**Proof/construction.** (1) Ellipticity makes the rational average of every cocharacter central in G, so the image is basic. (2) The integral cocharacter quotient maps surjectively to π_1(G)_Γ, giving surjectivity onto basic classes. (3) For μ_T in the given geometric orbit the image κ is μ♯; basic-class uniqueness identifies it with [b].

**Acceptance.** A split nonelliptic torus in GL_2 also produces nonbasic classes.

**Sources.** [Isocrystals with additional structure](https://www.numdam.org/article/CM_1985__56_2_201_0.pdf), Proposition5.3 printed215. The cited passage supplies the stated contract; qualifications and source corrections are retained in the node.; [Honda-Tate theory for Shimura varieties](https://math.berkeley.edu/~swshin/HT.pdf), Lemma1.1.8 p.8. The cited passage supplies the stated contract; qualifications and source corrections are retained in the node.

**Lean formulation.** full-signature-omitted; The suggested file contains a name-by-name register. A registered omission is not an elaborated theorem or a definition; the numerical tests and point stabilizer equations are expressly restricted cores. Full carrier obligations: G08.

<a id="transferred-torus-specialness"></a>

### Specialness for a transferred centralizer torus

**Theorem: TauCeti.BunG.TransferredTorusSpecialness.** Under a rational Newton witness, a G-minuscule acceptable pair and a rational transfer j:Tprime→M_[b] of a maximal torus of J_b, the pair is j(Tprime)-special. There is μ_Tprime in the prescribed geometric class whose Galois average equals the central morphism ν_(b,J). Such a transfer exists if G is quasi-split or Tprime is elliptic; geometric conjugacy alone is not a transfer.

**Hypotheses.** Global conventions in the reader apply; additional restrictions are stated in the contract.

**Prerequisites.** [Rational Newton representative](#rational-newton-witness); [Minuscule basic Levi lifting](#minuscule-basic-levi-lift); [Torus-special acceptable pair](#torus-special-pair); [ReductiveGroups#layer-7-structure-theory](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ReductiveGroups/README.md#layer-7-structure-theory); [EndoscopicTransferAndUnitaryTraceComparison:ET.0](../../../content/campaign/EndoscopicTransferAndUnitaryTraceComparison/README.md); [Elliptic tori and basic acceptable classes](#elliptic-torus-basic-image).

**Proof/construction.** (1) Conjugate the Newton representative and transferred torus together; centralize its maximal split subtorus to obtain a rational Levi M. (2) The explicit representative mh·b·σ(mh)^−1 lies in M(L) and is basic there. (3) Apply the corrected absolute-Weyl-group Levi lift and the elliptic-torus specialness theorem in M. (4) Transport the average equality through the chosen J_b inner identification.

**Acceptance.** The statement retains the rational transfer witness in the non-quasi-split case.

**Sources.** [Honda-Tate theory for Shimura varieties](https://math.berkeley.edu/~swshin/HT.pdf), Section1.1.16 and Corollary1.1.17 pp.12-13. The cited passage supplies the stated contract; qualifications and source corrections are retained in the node.

**Lean formulation.** full-signature-omitted; The suggested file contains a name-by-name register. A registered omission is not an elaborated theorem or a definition; the numerical tests and point stabilizer equations are expressly restricted cores. Full carrier obligations: G08.

<a id="abelianization-identification"></a>

### Abelianized classes equal fundamental coinvariants

**Theorem: TauCeti.BunG.AbelianizationIdentification.** For p-adic E there is a canonical B_ab(G)≅π_1(G)_Γ under which B(G)→B_ab(G) is κ. In a maximal-torus model this is coker(B(Tsc)→B(T)), using H^2(W_E,Tsc(L^sep))=0 and the torus Kottwitz descriptions.

**Hypotheses.** E is p-adic; L^sep denotes a separable algebraic closure of L=breve E (the overline of breve E in FS), with its natural W_E-action. Continuous Weil cohomology uses these discrete coefficient groups, not only L-rational points.

**Prerequisites.** [Abelianized Kottwitz set](#abelianized-kottwitz-set); [Torus norm and Newton average](#torus-norm-description); [Newton and Kottwitz invariants](#newton-and-kottwitz-maps); [EndoscopicTransferAndUnitaryTraceComparison:ET.0](../../../content/campaign/EndoscopicTransferAndUnitaryTraceComparison/README.md).

**Proof/construction.** (1) Apply the cohomology sequence for the two-term torus complex. (2) Use local Weil-torus H^2 vanishing supplied by ET.0’s group-specific cohomology package. (3) Identify the cokernel with the coroot quotient coinvariants.

**Acceptance.** Finite π_1 torsion survives the comparison.

**Sources.** [Geometrization of the local Langlands correspondence](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), LemmaIII.2.11 p.94. The cited passage supplies the stated contract; qualifications and source corrections are retained in the node.

**Lean formulation.** full-signature-omitted; The suggested file contains a name-by-name register. A registered omission is not an elaborated theorem or a definition; the numerical tests and point stabilizer equations are expressly restricted cores. Full carrier obligations: G08.

<a id="rational-kottwitz-surjectivity"></a>

### Rational-point Kottwitz surjectivity

**Theorem: TauCeti.BunG.RationalKottwitzSurjectivity.** The restriction tildeκ:G(E)→(π_1(G)_I)^σ is surjective for connected reductive G over the nonarchimedean local field E. Its target is Frobenius invariants in inertia coinvariants, not π_1(G)_Γ. For the unramified Q_p model in Kisin17 Lemma4.6.4, J_b(Q_p)→π_1(G)^Γ is surjective for every b; the basic tame vH24 case also follows by inner-form compatibility and the rational quotient map.

**Hypotheses.** Global conventions in the reader apply; additional restrictions are stated in the contract.

**Prerequisites.** [Algebraic sigma-centralizer](#sigma-centralizer-J-b); [Newton and Kottwitz invariants](#newton-and-kottwitz-maps); [ReductiveGroups#layer-7-structure-theory](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ReductiveGroups/README.md#layer-7-structure-theory); [EndoscopicTransferAndUnitaryTraceComparison:ET.0](../../../content/campaign/EndoscopicTransferAndUnitaryTraceComparison/README.md).

**Proof/construction.** (1) For G(E), reduce to tori and simply connected derived groups using a z-extension and the exact invariant lattice sequence. (2) For unramified J_b, use Kisin’s local abelianized H^0 comparison and Levi invariant surjection, with local simply connected H^1 vanishing supplied separately. (3) Do not generalize the J_b target without the stated group hypotheses.

**Acceptance.** A ramified torus can have different invariant and coinvariant groups.

**Sources.** [Isocrystals with additional structure II](https://people.dm.unipi.it/maffei/didattica/male/lacci/Kottwitz.pdf), Section7.7 pp.300-301. The cited passage supplies the stated contract; qualifications and source corrections are retained in the node.; [Mod p points on Shimura varieties of abelian type](https://people.math.harvard.edu/~kisin/dvifiles/lr.pdf?download=1), Lemma4.6.4 printed93. The cited passage supplies the stated contract; qualifications and source corrections are retained in the node.; [Mod p points on Shimura varieties of parahoric level](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/EC6F7AD8C8B489FEB8FC4D64485ABE1D/S2050508624000222a.pdf/mod_p_points_on_shimura_varieties_of_parahoric_level.pdf), Corollary3.4.6 proof printed37. The cited passage supplies the stated contract; qualifications and source corrections are retained in the node.

**Lean formulation.** full-signature-omitted; The suggested file contains a name-by-name register. A registered omission is not an elaborated theorem or a definition; the numerical tests and point stabilizer equations are expressly restricted cores. Full carrier obligations: G08.

<a id="component-kottwitz-coset"></a>

### Component Kottwitz coset

**Construction: TauCeti.BunG.ComponentCoset.** For b∈G(L) and a bound μ with compatible full κ, let c_(b,μ)={x∈π_1(G)_I:(σ−1)x=tildeκ(μ(π))−tildeκ(b)}. Compatibility in π_1(G)_Γ makes this a nonempty affine coset under (π_1(G)_I)^σ. This is an affine set of components, with no distinguished origin before a choice.

**Hypotheses.** Global conventions in the reader apply; additional restrictions are stated in the contract.

**Prerequisites.** [Newton and Kottwitz invariants](#newton-and-kottwitz-maps); [Acceptable classes B(G,{μ})](#admissible-pair).

**Proof/construction.** (1) Take the kernel/cokernel sequence of σ−1 on inertia coinvariants. (2) Full κ equality says the difference lies in its image; a chosen solution identifies the fibre with the kernel.

**API.**

| Declaration | Role | Contract |
|---|---|---|
| TauCeti.BunG.ComponentCoset.mem_iff | characterisation | A component x solves the stated difference equation. |
| TauCeti.BunG.ComponentCoset.nonempty | universal-property | The Γ-coinvariant compatibility is equivalent to nonemptiness. |
| TauCeti.BunG.ComponentCoset.translate | structure | Invariant classes act freely and transitively on the fibre. |
| TauCeti.BunG.ComponentCoset.liftZExtension | other | A z-extension and lifted b,μ give a surjective map of affine component cosets. API prerequisites: [Bounded lifting through a z-extension](#z-extension-bounded-lifting). |

**Discriminating unit tests.**

- **TauCeti.BunG.ComponentCoset.testIdentity** (degenerate): For σ=id a nonempty coset requires difference0 and equals the entire lattice.
- **TauCeti.BunG.ComponentCoset.testSign** (computation): On Z with σ=−id, the equation −2x=2 has unique solution x=−1.
- **TauCeti.BunG.ComponentCoset.testParity** (non-example): On the same lattice difference1 has no solution; its full coinvariant compatibility fails.

**Uses.** GLX Lemma3.16(2): Transfers component indices before any ADLV connectivity theorem. Kisin17 component actions: Uses the rational-point Kottwitz map on the acting group.

**Acceptance.** The generic affine fibre is represented honestly in the suggested file.

**Sources.** [The connected components of affine Deligne-Lusztig varieties](https://link.springer.com/content/pdf/10.1007/s00222-025-01386-1.pdf), Section1.1 equations(1.3)-(1.4) p.807; Section2.2 p.818. Independently checked in the recorded public source version on 2026-10-07; the node retains the stated scope and conventions.

**Lean formulation.** typed-pointwise-core; These declarations type only the explicitly restricted abstract-group or affine-fibre core. The general-E coefficient groups, represented reductive groups, and geometric signatures still depend on G08 suppliers; the register is not signature coverage. Full carrier obligations: G08.

<a id="z-extension-bounded-lifting"></a>

### Bounded lifting through a z-extension

**Theorem: TauCeti.BunG.ZExtensionBoundedLifting.** For a z-extension 1→Z→Gtilde→G→1 with induced torus Z, every cocharacter class μ lifts after choosing maximal tori. Given b∈B(G,{μ}) and a chosen lift μtilde, there is btilde∈B(Gtilde,{μtilde}) above b; the induced map of component cosets is surjective. Projection to the adjoint group gives B(G,{μ})≅B(Gad,{μad}) with the fixed central invariant.

**Hypotheses.** Global conventions in the reader apply; additional restrictions are stated in the contract.

**Prerequisites.** [Acceptable classes B(G,{μ})](#admissible-pair); [Component Kottwitz coset](#component-kottwitz-coset); [Rational-point Kottwitz surjectivity](#rational-kottwitz-surjectivity); [ReductiveGroups#layer-7-structure-theory](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ReductiveGroups/README.md#layer-7-structure-theory).

**Proof/construction.** (1) Lift μ using the exact cocharacter sequence of the induced torus. (2) Use the adjoint acceptable-set bijection to choose btilde with the specified κ and Newton bound. (3) Lift differences in the affine coset using invariant-lattice surjectivity and H^1(E,Z)=0.

**Acceptance.** An arbitrary central torus lacks the induced-torus cohomological vanishing used here.

**Sources.** [The connected components of affine Deligne-Lusztig varieties](https://link.springer.com/content/pdf/10.1007/s00222-025-01386-1.pdf), Lemma3.16 p.829. The cited passage supplies the stated contract; qualifications and source corrections are retained in the node.; [Isocrystals with additional structure II](https://people.dm.unipi.it/maffei/didattica/male/lacci/Kottwitz.pdf), Section6.5 equation6.5.1 p.287. The cited passage supplies the stated contract; qualifications and source corrections are retained in the node.

**Lean formulation.** full-signature-omitted; The suggested file contains a name-by-name register. A registered omission is not an elaborated theorem or a definition; the numerical tests and point stabilizer equations are expressly restricted cores. Full carrier obligations: G08.

<a id="connected-center-basic-inner-forms"></a>

### Basic classes and adjoint torsors with connected center

**Theorem: TauCeti.BunG.ConnectedCenterBasicInnerForms.** If Z(G) is a connected torus, B(G)_basic→B(Gad)_basic≅H^1(E,Gad) is surjective. The map sends a basic class to the inner form J_b. The assertion does not assume this surjectivity for groups with disconnected center.

**Hypotheses.** Global conventions in the reader apply; additional restrictions are stated in the contract.

**Prerequisites.** [Basic sigma class](#basic-class); [Algebraic sigma-centralizer](#sigma-centralizer-J-b); [ReductiveGroups#layer-7-structure-theory](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ReductiveGroups/README.md#layer-7-structure-theory); [EndoscopicTransferAndUnitaryTraceComparison:ET.0](../../../content/campaign/EndoscopicTransferAndUnitaryTraceComparison/README.md).

**Proof/construction.** (1) Apply Kottwitz central-torus extension surjectivity to 1→Z(G)→G→Gad→1. (2) Use its restriction to the basic subsets; for an adjoint group basic Newton is0 and basic classes identify with H^1.

**Acceptance.** For SL_n, the finite center prevents invoking this connected-torus proposition.

**Sources.** [B(G) for all local and global fields](https://arxiv.org/pdf/1401.5728), Proposition10.4 printed50-51. The cited passage supplies the stated contract; qualifications and source corrections are retained in the node.

**Lean formulation.** full-signature-omitted; The suggested file contains a name-by-name register. A registered omission is not an elaborated theorem or a definition; the numerical tests and point stabilizer equations are expressly restricted cores. Full carrier obligations: G08.

<a id="general-levi-newton-comparison"></a>

### Newton comparison for a Levi representative

**Theorem: TauCeti.BunG.GeneralLeviNewtonComparison.** Let M_J be a σ-stable standard Levi of a quasi-split based local group G and let b_M∈M_J(L) map to b∈B(G). Its M_J-dominant Newton point ν_M is Weyl-conjugate to ν_G and ν_G−ν_M is a nonnegative rational sum of simple G-coroots. If κ_M(b_M)=κ_M(t^λσ(η)) in the situation of He §6.2, then λ◇−ν_M belongs to the rational span of the J-coroots. This comparison does not require b or b_M to be basic.

**Hypotheses.** Global conventions in the reader apply; additional restrictions are stated in the contract.

**Prerequisites.** [Newton and Kottwitz invariants](#newton-and-kottwitz-maps); [Newton orbit space and rational dominance](#newton-orbit-space); [ReductiveGroupsPartII:RG2.1](https://github.com/TauCetiProject/TauCetiRoadmap/blob/201bcaee1f4014c91897d50cdb7631fc6d6a6d71/TauCetiRoadmap/ReductiveGroupsPartII/README.md); [ReductiveGroupsPartII:RG2.4](https://github.com/TauCetiProject/TauCetiRoadmap/blob/201bcaee1f4014c91897d50cdb7631fc6d6a6d71/TauCetiRoadmap/ReductiveGroupsPartII/README.md).

**Proof/construction.** (1) Newton functoriality identifies the geometric orbit; choose the dominant representatives in the two chambers. (2) Use Weyl chamber dominance for the first difference and the fundamental-group projection for the J-coroot span conclusion.

**Acceptance.** The separate basic-Levi uniqueness theorem retains its basic hypothesis.

**Sources.** [Cordial elements and dimensions of affine Deligne-Lusztig varieties](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/5A27DBF48CAEF6DA56A313061848574C/S205050862100010Xa.pdf/cordial-elements-and-dimensions-of-affine-delignelusztig-varieties.pdf), Section6.2 p.13. The cited passage supplies the stated contract; qualifications and source corrections are retained in the node.

**Lean formulation.** full-signature-omitted; The suggested file contains a name-by-name register. A registered omission is not an elaborated theorem or a definition; the numerical tests and point stabilizer equations are expressly restricted cores. Full carrier obligations: G08.

## BG2:uniformization — The stack and its cover

Form Bun_G as a small groupoid-valued v-stack. Establish geometric-point classification and HN semicontinuity. Prove openness of the geometrically trivial locus before lifting modifications and proving BL surjectivity. Central-torus lifting then proves integral κ-local-constancy; the crossed-module computation gives its second p-adic proof.

<a id="curve-etale-base-site"></a>

### Curve-to-base étale site morphism

**Construction: TauCeti.BunG.CurveEtaleBase.** For S∈Perf_k, define τ:(X_S)_et→S_et through (X_S)_et≅(X_S^diamond)_et≅(Div^1_S)_et and the projection Div^1×S→S. Equivalently τ* sends étale T/S to X_T/X_S. This is a site morphism; no geometric projection X_S→S is postulated.

**Hypotheses.** Global conventions in the reader apply; additional restrictions are stated in the contract.

**Prerequisites.** [RelativeFarguesFontaine:RF2](../../../content/campaign/RelativeFarguesFontaine/README.md); [DiamondsAndVStacks:D2](../../../content/campaign/DiamondsAndVStacks/README.md); [DiamondsAndVStacks:D3](../../../content/campaign/DiamondsAndVStacks/README.md); [DiamondsAndVStacks:D6/etale-site-comparison](../../../content/campaign/DiamondsAndVStacks/README.md).

**Proof/construction.** (1) Import the curve/divisor étale-site equivalences. (2) Compose their inverse with the continuous functor induced by the divisor projection; check finite limits and cover preservation.

**API.**

| Declaration | Role | Contract |
|---|---|---|
| TauCeti.BunG.CurveEtaleBase.pullback | projection | On an étale T→S, τ* is X_T→X_S. |
| TauCeti.BunG.CurveEtaleBase.baseChange | compatibility | The square for Sprime→S commutes up to the natural site equivalence. |
| TauCeti.BunG.CurveEtaleBase.pushforward | universal-property | Use the induced adjoint sheaf pushforward and derived pushforward. |
| TauCeti.BunG.CurveEtaleBase.constantComparison | functoriality | The structural E-map induces RΓ_et(Spa E,F)→Rτ*(F\|X_S). |

**Discriminating unit tests.**

- **TauCeti.BunG.CurveEtaleBase.testGeometric** (compatibility): For geometric S, the comparison is the curve/local-field cohomology comparison.
- **TauCeti.BunG.CurveEtaleBase.testTrivialSheaf** (degenerate): The zero finite sheaf has zero derived pushforward.
- **TauCeti.BunG.CurveEtaleBase.testCoproduct** (compatibility): For T=S⊔S in S_et, τ*(T) is X_S⊔X_S over X_S, with the two inclusions preserved. This checks the actual inverse-image site functor.

**Uses.** FS III.2.12: Computes derived pushforward of finite coefficients. FS III.2.13: Builds the sheaf of crossed-module curve classes.

**Acceptance.** The missing curve projection is precisely why this site construction is used.

**Sources.** [Geometrization of the local Langlands correspondence](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), III.2.4.2 p.94. The cited passage supplies the stated contract; qualifications and source corrections are retained in the node.

**Lean formulation.** full-signature-omitted; The suggested file contains a name-by-name register. A registered omission is not an elaborated theorem or a definition; the numerical tests and point stabilizer equations are expressly restricted cores. Full carrier obligations: G08.

<a id="curve-torsion-cohomology"></a>

### Constant torsion cohomology on the curve

**Comparison: TauCeti.BunG.CurveTorsionCohomology.** For p-adic E, S∈Perf_k and a locally constant finite abelian sheaf F on Spa(E)_et, Rτ*(F|X_S) is the constant complex RΓ_et(Spa E,F). For algebraically closed perfectoid C the comparison is an isomorphism in all degrees. Prime-to-p coefficients use Kummer and p coefficients use Artin–Schreier after tilting.

**Hypotheses.** Global conventions in the reader apply; additional restrictions are stated in the contract.

**Prerequisites.** [Curve-to-base étale site morphism](#curve-etale-base-site); [DiamondEtaleCohomology:C1](../../../content/campaign/DiamondEtaleCohomology/README.md); [RelativeFarguesFontaine:RF0:annuli](../../../content/campaign/RelativeFarguesFontaine/README.md); [DiamondsAndVStacks:D6/etale-site-comparison](../../../content/campaign/DiamondsAndVStacks/README.md).

**Proof/construction.** (1) Apply proper base change along Div^1_S→S and reduce to geometric S. (2) After tilting to equal characteristic, annihilate cohomology on finite separable extensions using Kummer or Artin–Schreier. (3) Use Galois descent and the continuous direct limit over finite field extensions.

**Acceptance.** The argument is an actual cohomology computation, not a field in the definition of τ.

**Sources.** [Geometrization of the local Langlands correspondence](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), PropositionIII.2.12(i) pp.94-95. The cited passage supplies the stated contract; qualifications and source corrections are retained in the node.

**Lean formulation.** full-signature-omitted; The suggested file contains a name-by-name register. A registered omission is not an elaborated theorem or a definition; the numerical tests and point stabilizer equations are expressly restricted cores. Full carrier obligations: G08.

<a id="bun-g-as-v-stack"></a>

### Moduli v-stack Bun_G

**Construction: TauCeti.BunG.Bun.** For S∈Perf_k, Bun_G(S) is the groupoid of G-bundles on X_S, with pullback along perfectoid maps. Effective v-descent for vector bundles and the rational tensor description make it a v-stack. On affinoid S the algebraic and adic curve descriptions agree by GAGA. The moduli keeps bundle isomorphisms, rather than quotienting them out.

**Hypotheses.** Global conventions in the reader apply; additional restrictions are stated in the contract.

**Prerequisites.** [G-bundles as exact tensor functors](#g-bundle); [Tannakian description of analytic torsors](#g-torsors-three-descriptions); [VectorBundlesAndIsocrystals:VB1/isocrystal-to-bundle-functor](../../../content/campaign/VectorBundlesAndIsocrystals/README.md); [DiamondsAndVStacks:D3](../../../content/campaign/DiamondsAndVStacks/README.md); [VectorBundlesAndIsocrystals:VB2:ampleness/gaga-equivalence](../../../content/campaign/VectorBundlesAndIsocrystals/README.md); [DiamondsAndVStacks:D4/small-v-sheaves-and-small-v-stacks](../../../content/campaign/DiamondsAndVStacks/README.md); [DiamondsAndVStacks:D0/groupoid-quotients-and-two-fibre-products](../../../content/campaign/DiamondsAndVStacks/README.md).

**Proof/construction.** (1) Apply v-descent for bundle evaluations and tensor constraints. (2) Use GAGA on each affinoid curve to identify the scheme and adic torsor groupoids.

**API.**

| Declaration | Role | Contract |
|---|---|---|
| TauCeti.BunG.Bun.objects | projection | Evaluate to the G-bundle groupoid on X_S. |
| TauCeti.BunG.Bun.pullback | functoriality | For T→S, pullback is X_T←X_S bundle pullback, with coherent identities and compositions. |
| TauCeti.BunG.Bun.ofIsocrystal | constructor | An exact tensor G-isocrystal gives the constant bundle E_b on every X_S. |
| TauCeti.BunG.Bun.isomSheaf | projection | The diagonal fibre is the v-sheaf Isom of two G-bundles. |
| TauCeti.BunG.Bun.gaga | equivalence | For affinoid S compare algebraic and analytic curve torsor categories. |
| TauCeti.BunG.Bun.pullback_id | simp | Pullback of G-bundles along id_S is naturally tensor-isomorphic to the identity functor, with its unit coherence. |
| TauCeti.BunG.Bun.pullback_comp | compatibility | For U→T→S, pullback along the composite is naturally tensor-isomorphic to successive pullback, with the associativity coherence. |

**Discriminating unit tests.**

- **TauCeti.BunG.Bun.testGLn** (compatibility): For GL_n, objects are rank-n vector bundles with all bundle isomorphisms.
- **TauCeti.BunG.Bun.testTrivial** (degenerate): For G=1, Bun_G is the terminal v-stack.
- **TauCeti.BunG.Bun.testNonbasicHom** (non-example): For GL_2 slopes0,1, bundle automorphisms include positive-slope sections, so the isocrystal-to-bundle functor is not fully faithful on the ungraded categories.

**Uses.** FS ChaptersIII-V: Supplies the base of every uniformization and chart map. ES7 and IG.0: The actual moduli stack is imported; their extra arithmetic structures stay with those owners.

**Acceptance.** Pullback preserves the unit and composition coherences.

**Sources.** [Geometrization of the local Langlands correspondence](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), DefinitionIII.1.2 p.88. The cited passage supplies the stated contract; qualifications and source corrections are retained in the node.

**Lean formulation.** full-signature-omitted; The suggested file contains a name-by-name register. A registered omission is not an elaborated theorem or a definition; the numerical tests and point stabilizer equations are expressly restricted cores. Full carrier obligations: G08.

**Atlas planet:** Moduli of G-bundles.

<a id="bun-g-smallness"></a>

### Smallness of Bun_G

**Theorem: TauCeti.BunG.BunGSmallness.** Bun_G is a small v-stack. For an ω_1-cofiltered inverse system of affinoid perfectoids with limit S, Bun_G(S) is the filtered colimit of the groupoids Bun_G(S_i), and its Isom sheaves have the same limit property. Hence bundles and arrows descend to topologically countably generated coefficient algebras, giving a set-sized cover.

**Hypotheses.** Global conventions in the reader apply; additional restrictions are stated in the contract.

**Prerequisites.** [Moduli v-stack Bun_G](#bun-g-as-v-stack); [DiamondsAndVStacks:D3](../../../content/campaign/DiamondsAndVStacks/README.md); [VectorBundlesAndIsocrystals:VB2:ampleness/gaga-equivalence](../../../content/campaign/VectorBundlesAndIsocrystals/README.md); [RelativeFarguesFontaine:RF0:annuli](../../../content/campaign/RelativeFarguesFontaine/README.md); [DiamondsAndVStacks:D4/small-v-sheaves-and-small-v-stacks](../../../content/campaign/DiamondsAndVStacks/README.md).

**Proof/construction.** (1) Descend Cauchy sequences and interval period-ring elements through the ω_1-cofiltered limit. (2) Descend vector bundles, tensor data and arrows. (3) Take the disjoint union over a set of countably generated perfectoid algebras and bundle objects.

**Acceptance.** A claim of an arbitrary filtered-limit equivalence would be stronger than the source.

**Sources.** [Geometrization of the local Langlands correspondence](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), PropositionIII.1.3 pp.88-89. The cited passage supplies the stated contract; qualifications and source corrections are retained in the node.

**Lean formulation.** full-signature-omitted; The suggested file contains a name-by-name register. A registered omission is not an elaborated theorem or a definition; the numerical tests and point stabilizer equations are expressly restricted cores. Full carrier obligations: G08.

<a id="points-are-B-of-G"></a>

### Geometric classification of G-bundles

**Theorem: TauCeti.BunG.PointsAreBOfG.** For complete algebraically closed nonarchimedean C/k, b↦E_b gives a bijection B(G)→Bun_G(C)/≅ and consequently B(G)≅|Bun_G|. The slope grading identifies isocrystals with HN-graded bundles; positive-slope H^1 vanishing splits the filtered tensor functor. It does not identify the ungraded groupoids or all their morphisms.

**Hypotheses.** Global conventions in the reader apply; additional restrictions are stated in the contract.

**Prerequisites.** [Moduli v-stack Bun_G](#bun-g-as-v-stack); [Kottwitz set B(G)](#sigma-conjugacy-quotient); [VectorBundlesAndIsocrystals:VB0/dieudonne-manin-isocrystals](../../../content/campaign/VectorBundlesAndIsocrystals/README.md); [VectorBundlesAndIsocrystals:VB1/isocrystal-to-bundle-functor](../../../content/campaign/VectorBundlesAndIsocrystals/README.md); [VectorBundlesAndIsocrystals:VB2:classification](../../../content/campaign/VectorBundlesAndIsocrystals/README.md); [VectorBundlesAndIsocrystals:VB4/relative-HN-filtration-and-proetale-splitting](../../../content/campaign/VectorBundlesAndIsocrystals/README.md); [VectorBundlesAndIsocrystals:VB3:general-BC/families-of-banach-colmez-spaces](../../../content/campaign/VectorBundlesAndIsocrystals/README.md); [ReductiveGroups#layer-7-structure-theory](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ReductiveGroups/README.md#layer-7-structure-theory).

**Proof/construction.** (1) Lift the bundle tensor functor canonically to HN-filtered bundles; verify exactness, including the equal-characteristic argument of Ans19. (2) Identify the graded slope category with Isoc_E via VB2 and VB0. (3) The torsor of tensor splittings is unipotent with positive vector-bundle graded pieces; H^1 vanishing trivializes it. (4) Use the geometric-point equivalence relation for small v-stacks to identify |Bun_G|.

**Acceptance.** GL_n recovers the vector-bundle slope multiset; positive Hom spaces remain in the ungraded bundle category.

**Sources.** [Geometrization of the local Langlands correspondence](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), TheoremIII.2.2 pp.89-90. The cited passage supplies the stated contract; qualifications and source corrections are retained in the node.; [Reductive group schemes over the Fargues-Fontaine curve](https://arxiv.org/pdf/1703.00700), Theorem3.11 and proof pp.14-16. The cited passage supplies the stated contract; qualifications and source corrections are retained in the node.

**Lean formulation.** full-signature-omitted; The suggested file contains a name-by-name register. A registered omission is not an elaborated theorem or a definition; the numerical tests and point stabilizer equations are expressly restricted cores. Full carrier obligations: G08.

**Atlas planet:** Geometric bundle classification.

<a id="hn-sign-and-semicontinuity"></a>

### HN sign and semicontinuity

**Theorem: TauCeti.BunG.HnSignAndSemicontinuity.** For E_b, its bundle HN class is ν_b*=w_0(−ν_b) and c_1(E_b)=−κ(b). The HN class ν* on |Bun_G| is upper semicontinuous: specialization can increase the upper-concave HN polygon. Detect the reductive order on rational representations using RR96 Lemma2.2 and VB4 relative semicontinuity.

**Hypotheses.** Global conventions in the reader apply; additional restrictions are stated in the contract.

**Prerequisites.** [Geometric classification of G-bundles](#points-are-B-of-G); [Representations detect Newton dominance](#representation-detects-dominance); [VectorBundlesAndIsocrystals:VB4/semicontinuity-of-HN-polygon](../../../content/campaign/VectorBundlesAndIsocrystals/README.md); [VectorBundlesAndIsocrystals:VB1/isocrystal-to-bundle-functor](../../../content/campaign/VectorBundlesAndIsocrystals/README.md).

**Proof/construction.** (1) Apply the linear slope sign convention under each representation. (2) Use RR96’s representation criterion to pass from the vector-bundle HN polygons to the reductive class.

**Acceptance.** For b=π^m in G_m, E_b=O(−m), fixing both the Newton and degree signs.

**Sources.** [Geometrization of the local Langlands correspondence](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), TheoremIII.2.3 and preceding paragraph p.91. The cited passage supplies the stated contract; qualifications and source corrections are retained in the node.

**Lean formulation.** full-signature-omitted; The suggested file contains a name-by-name register. A registered omission is not an elaborated theorem or a definition; the numerical tests and point stabilizer equations are expressly restricted cores. Full carrier obligations: G08.

<a id="strictly-disconnected-torsors"></a>

### Pro-étale torsors on strictly disconnected bases

**Theorem: TauCeti.BunG.StrictlyDisconnectedTorsors.** Every pro-étale H-torsor on a strictly totally disconnected perfectoid S is trivial when H is a first-countable locally profinite group. Such torsors on arbitrary S are represented by perfectoid spaces as the inverse limit over compact open subgroups. First countability supplies the countable nested system used to choose compatible sections.

**Hypotheses.** Global conventions in the reader apply; additional restrictions are stated in the contract.

**Prerequisites.** [DiamondsAndVStacks:D2](../../../content/campaign/DiamondsAndVStacks/README.md); [DiamondsAndVStacks:D3](../../../content/campaign/DiamondsAndVStacks/README.md); [DiamondsAndVStacks:D1/strictly-totally-disconnected](../../../content/campaign/DiamondsAndVStacks/README.md); [DiamondsAndVStacks:D1/universally-open-std-cover](../../../content/campaign/DiamondsAndVStacks/README.md); [DiamondsAndVStacks:D3/locally-profinite-torsors](../../../content/campaign/DiamondsAndVStacks/README.md).

**Proof/construction.** (1) Reduce to a compact open subgroup after splitting the étale quotient cover. (2) Choose a countable cofinal system of open normal subgroups and compatible sections of the finite étale quotients. (3) Use separated étale descent and the perfectoid inverse-limit construction.

**Acceptance.** A generic torsor on an arbitrary perfectoid base need not be globally trivial.

**Sources.** [Geometrization of the local Langlands correspondence](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), RemarkIII.2.5 and LemmaIII.2.6 p.92. The cited passage supplies the stated contract; qualifications and source corrections are retained in the node.

**Lean formulation.** full-signature-omitted; The suggested file contains a name-by-name register. A registered omission is not an elaborated theorem or a definition; the numerical tests and point stabilizer equations are expressly restricted cores. Full carrier obligations: G08.

<a id="geometrically-trivial-locus"></a>

### Geometrically trivial open locus

**Theorem: TauCeti.BunG.GeometricallyTrivialLocus.** Bun_G^1 is open and [*/G(E)]→Bun_G^1 is an equivalence, where G(E) has its locally profinite topology and torsors are pro-étale. Prove openness before κ-local-constancy: on strictly disconnected bases the ν=0 locus yields E-local systems; their continuous fibre functor is a reductive torsor over C^0(π_0S,E), whose triviality is open by henselian local rings.

**Hypotheses.** Global conventions in the reader apply; additional restrictions are stated in the contract.

**Prerequisites.** [HN sign and semicontinuity](#hn-sign-and-semicontinuity); [Pro-étale torsors on strictly disconnected bases](#strictly-disconnected-torsors); [VectorBundlesAndIsocrystals:VB4](../../../content/campaign/VectorBundlesAndIsocrystals/README.md); [ReductiveGroups#layer-7-structure-theory](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ReductiveGroups/README.md#layer-7-structure-theory); [DiamondsAndVStacks:D3](../../../content/campaign/DiamondsAndVStacks/README.md); [VectorBundlesAndIsocrystals:VB4/slope-zero-local-systems](../../../content/campaign/VectorBundlesAndIsocrystals/README.md).

**Proof/construction.** (1) Use VB4’s equivalence of geometrically trivial bundles with E-local systems. (2) On a strictly disconnected base trivialize each local system, preserving its tensor structure. (3) Henselian continuity makes triviality of the fibre-functor torsor an open condition. (4) Identify the automorphism sheaf of the trivial bundle with the constant locally profinite G(E) sheaf.

**Acceptance.** The entire ν=0 locus can contain nontrivial torsion κ; it is not automatically Bun_G^1.

**Sources.** [Geometrization of the local Langlands correspondence](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), TheoremIII.2.4 pp.91-92. The cited passage supplies the stated contract; qualifications and source corrections are retained in the node.

**Lean formulation.** full-signature-omitted; The suggested file contains a name-by-name register. A registered omission is not an elaborated theorem or a definition; the numerical tests and point stabilizer equations are expressly restricted cores. Full carrier obligations: G08.

**Atlas planet:** Trivial bundle locus.

<a id="diagonalizable-curve-cohomology"></a>

### Diagonalizable Weil–curve comparison

**Comparison: TauCeti.BunG.DiagonalizableCurveCohomology.** For p-adic E and diagonalizable D/E, the pro-étale sheaf associated to T/S↦H^1_et(X_T,D) is constant with value H^1(W_E,D(L^sep)). For algebraically closed perfectoid C, H^i(W_E,D(L^sep))≅H^i_et(X_C,D), 0≤i≤2. The natural map comes from the curve étale site to discrete W_E-sets. Use 1→D^0→D→π_0(D)→1 and retain all finite component contributions.

**Hypotheses.** E is p-adic; L^sep denotes a separable algebraic closure of L=breve E (the overline of breve E in FS), with its natural W_E-action. Continuous Weil cohomology uses these discrete coefficient groups, not only L-rational points.

**Prerequisites.** [Constant torsion cohomology on the curve](#curve-torsion-cohomology); [Geometrically trivial open locus](#geometrically-trivial-locus); [Torus norm and Newton average](#torus-norm-description); [EndoscopicTransferAndUnitaryTraceComparison:ET.0](../../../content/campaign/EndoscopicTransferAndUnitaryTraceComparison/README.md).

**Proof/construction.** (1) For tori apply geometric classification and translate the neutral fibre using the Picard stack. (2) Use torsion comparison for finite π_0(D), which is étale in characteristic0. (3) Use the Weil-torus H^2 vanishing and compare the long exact sequences through degree2.

**Acceptance.** Do not silently apply this proof to μ_p in equal characteristic. For E=Q_p with p odd, μ_p(L)={1}, while μ_p(L^sep) has p elements with its natural nontrivial inertia action. The coefficient functor must retain this action.

**Sources.** [Geometrization of the local Langlands correspondence](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), PropositionIII.2.12(ii), comparison morphism and RemarkIII.2.14 pp.94-97. The cited passage supplies the stated contract; qualifications and source corrections are retained in the node.

**Lean formulation.** full-signature-omitted; The suggested file contains a name-by-name register. A registered omission is not an elaborated theorem or a definition; the numerical tests and point stabilizer equations are expressly restricted cores. Full carrier obligations: G08.

<a id="crossed-module-curve-classes"></a>

### Constant crossed-module curve classes

**Theorem: TauCeti.BunG.CrossedModuleCurveClasses.** For p-adic E, the pro-étale sheaf associated to T/S↦H^1_et(X_T,[Gsc→G]) is constant with value B_ab(G). The comparison identifies the curve abelianization of a bundle with its κ class.

**Hypotheses.** Global conventions in the reader apply; additional restrictions are stated in the contract.

**Prerequisites.** [Abelianized classes equal fundamental coinvariants](#abelianization-identification); [Diagonalizable Weil–curve comparison](#diagonalizable-curve-cohomology); [EndoscopicTransferAndUnitaryTraceComparison:ET.0](../../../content/campaign/EndoscopicTransferAndUnitaryTraceComparison/README.md).

**Proof/construction.** (1) Use the homotopy-equivalent center complex [Zsc→Z]. (2) Apply diagonalizable comparisons in degrees1 and2 to its long exact sequence. (3) Compare the curve and Weil abelianization maps; this is the second, p-adic-only proof of κ-local-constancy.

**Acceptance.** The first uniformization proof of κ-local-constancy remains independent of this second comparison proof.

**Sources.** [Geometrization of the local Langlands correspondence](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), PropositionIII.2.13 p.96. The cited passage supplies the stated contract; qualifications and source corrections are retained in the node.

**Lean formulation.** full-signature-omitted; The suggested file contains a name-by-name register. A registered omission is not an elaborated theorem or a definition; the numerical tests and point stabilizer equations are expressly restricted cores. Full carrier obligations: G08.

<a id="grassmannian-point-lifting"></a>

### Grassmannian point lifting

**Lemma: TauCeti.BunG.GrassmannianPointLifting.** For strictly totally disconnected S=Spa(R,R+) over Spa(E) and s∈S, Gr_G(R)→Gr_G(K(s)) is surjective. Split G after a finite field extension embedded in R, use the Cartan decomposition, and lift G(B_dR^+(K(s))) through successive nilpotent thickenings by smoothness and Lie algebra surjectivity.

**Hypotheses.** Global conventions in the reader apply; additional restrictions are stated in the contract.

**Prerequisites.** [GeometricSatakeAndFusion:GS0:loop-geometry/schubert-bounds-and-properness](../../../content/campaign/GeometricSatakeAndFusion/README.md); [ReductiveGroupsPartII:RG2.4](https://github.com/TauCetiProject/TauCetiRoadmap/blob/201bcaee1f4014c91897d50cdb7631fc6d6a6d71/TauCetiRoadmap/ReductiveGroupsPartII/README.md); [DiamondsAndVStacks:D2](../../../content/campaign/DiamondsAndVStacks/README.md); [RelativeFarguesFontaine:RF2:untilts](../../../content/campaign/RelativeFarguesFontaine/README.md); [DiamondsAndVStacks:D1/strictly-totally-disconnected](../../../content/campaign/DiamondsAndVStacks/README.md); [DiamondsAndVStacks:D1/universally-open-std-cover](../../../content/campaign/DiamondsAndVStacks/README.md).

**Proof/construction.** (1) Use the clopen-component argument to get R→K(s) surjective. (2) Lift group points using henselian smooth lifting. (3) Lift the positive period-ring points by the complete filtration and successive Lie corrections.

**Acceptance.** This supplies relative lifting from the fixed-point uniformization theorem.

**Sources.** [Geometrization of the local Langlands correspondence](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), LemmaIII.3.2 p.98. The cited passage supplies the stated contract; qualifications and source corrections are retained in the node.

**Lean formulation.** full-signature-omitted; The suggested file contains a name-by-name register. A registered omission is not an elaborated theorem or a definition; the numerical tests and point stabilizer equations are expressly restricted cores. Full carrier obligations: G08.

<a id="beauville-laszlo-surjectivity"></a>

### Beauville–Laszlo uniformization

**Theorem: TauCeti.BunG.BeauvilleLaszloSurjectivity.** The modification map BL:Gr_G→Bun_G is a surjection of pro-étale stacks and hence of v-stacks. Over a geometric point and a chosen untilt, every G-bundle can be modified at its untilt point to a trivial bundle. Relatively, lift that modification on a strictly disconnected base and use the geometrically trivial open locus to trivialize it near the given point.

**Hypotheses.** Global conventions in the reader apply; additional restrictions are stated in the contract.

**Prerequisites.** [RelativeFarguesFontaine:RF4:G-torsors/modification-of-G-bundle-by-lattice](../../../content/campaign/RelativeFarguesFontaine/README.md); [Geometrically trivial open locus](#geometrically-trivial-locus); [Grassmannian point lifting](#grassmannian-point-lifting); [Geometric classification of G-bundles](#points-are-B-of-G); [Pro-étale torsors on strictly disconnected bases](#strictly-disconnected-torsors); [ReductiveGroups#layer-7-structure-theory](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ReductiveGroups/README.md#layer-7-structure-theory).

**Proof/construction.** (1) Apply Anschütz’s geometric-point modification theorem for arbitrary connected reductive G. (2) Lift the modification by the Grassmannian point-lifting lemma. (3) On its open trivial locus split the locally profinite torsor and choose a trivialization. (4) Descend the local modifications along the pro-étale cover.

**Acceptance.** RF4:G-torsors owns patching and the map; BG2 owns this surjectivity argument.

**Sources.** [Geometrization of the local Langlands correspondence](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), PropositionIII.3.1 p.98. The cited passage supplies the stated contract; qualifications and source corrections are retained in the node.; [Reductive group schemes over the Fargues-Fontaine curve](https://arxiv.org/pdf/1703.00700), Theorem6.5 p.30. The cited passage supplies the stated contract; qualifications and source corrections are retained in the node.

**Lean formulation.** full-signature-omitted; The suggested file contains a name-by-name register. A registered omission is not an elaborated theorem or a definition; the numerical tests and point stabilizer equations are expressly restricted cores. Full carrier obligations: G08.

**Atlas planet:** Beauville–Laszlo uniformization.

<a id="central-torus-grassmannian-surjectivity"></a>

### Central-torus Grassmannian surjectivity

**Lemma: TauCeti.BunG.CentralTorusGrassmannianSurjectivity.** For a central extension Gtilde→G with torus kernel Z, Gr_Gtilde→Gr_G is surjective as a v-sheaf. After a splitting field, split maximal-torus cocharacters lift; on Schubert cells compare the unipotent factors and the central torus lattice. Generic Schubert geometry is imported from GS0.

**Hypotheses.** Global conventions in the reader apply; additional restrictions are stated in the contract.

**Prerequisites.** [GeometricSatakeAndFusion:GS0:loop-geometry/schubert-bounds-and-properness](../../../content/campaign/GeometricSatakeAndFusion/README.md); [GeometricSatakeAndFusion:GS0:Schubert-smoothness/open-cell-stabilizer-and-smoothness](../../../content/campaign/GeometricSatakeAndFusion/README.md); [ReductiveGroups#layer-7-structure-theory](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ReductiveGroups/README.md#layer-7-structure-theory).

**Proof/construction.** (1) Pass v-locally to a splitting field. (2) Lift the Schubert cocharacter through the exact torus lattice map and lift the root-group coordinates. (3) Descend the local lifts to obtain v-surjectivity.

**Acceptance.** Unlike rational-point z-extension lifting, this geometric statement needs a torus kernel but not an induced torus.

**Sources.** [Geometrization of the local Langlands correspondence](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), LemmaIII.3.5 p.99. The cited passage supplies the stated contract; qualifications and source corrections are retained in the node.

**Lean formulation.** full-signature-omitted; The suggested file contains a name-by-name register. A registered omission is not an elaborated theorem or a definition; the numerical tests and point stabilizer equations are expressly restricted cores. Full carrier obligations: G08.

<a id="central-torus-bundle-surjectivity"></a>

### Central-torus bundle surjectivity

**Lemma: TauCeti.BunG.CentralTorusBundleSurjectivity.** For a central extension Gtilde→G with torus kernel Z, Bun_Gtilde→Bun_G is a v-surjection. Bun_Z acts by central tensor product and Bun_G is its quotient stack; the action is a quasi-torsor before surjectivity is proved.

**Hypotheses.** Global conventions in the reader apply; additional restrictions are stated in the contract.

**Prerequisites.** [Beauville–Laszlo uniformization](#beauville-laszlo-surjectivity); [Central-torus Grassmannian surjectivity](#central-torus-grassmannian-surjectivity); [Structure group and tensor descent](#structure-group-and-tensor-descent); [DiamondsAndVStacks:D3](../../../content/campaign/DiamondsAndVStacks/README.md).

**Proof/construction.** (1) Lift a bundle to a Grassmannian point by BL, then lift that point along the central-torus map. (2) Identify its ambiguity with a Z-bundle via the contracted product and descend.

**Acceptance.** No circular use of κ-local-constancy is made in this proof.

**Sources.** [Geometrization of the local Langlands correspondence](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), LemmaIII.2.10 and proof afterIII.3.5 pp.93,99. The cited passage supplies the stated contract; qualifications and source corrections are retained in the node.

**Lean formulation.** full-signature-omitted; The suggested file contains a name-by-name register. A registered omission is not an elaborated theorem or a definition; the numerical tests and point stabilizer equations are expressly restricted cores. Full carrier obligations: G08.

<a id="semicontinuity-and-local-constancy"></a>

### Local constancy of bundle Kottwitz invariant

**Theorem: TauCeti.BunG.SemicontinuityAndLocalConstancy.** κ:|Bun_G|→π_1(G)_Γ is locally constant, with the discrete topology on its integral target. Together with HN semicontinuity this makes |Bun_G|→B(G) continuous for the Newton-order topology. The proof for every local E uses central-torus bundle surjectivity, z-extensions and induced tori; the crossed-module proof is a second proof for p-adic E.

**Hypotheses.** Global conventions in the reader apply; additional restrictions are stated in the contract.

**Prerequisites.** [Central-torus bundle surjectivity](#central-torus-bundle-surjectivity); [HN sign and semicontinuity](#hn-sign-and-semicontinuity); [Newton and Kottwitz invariants](#newton-and-kottwitz-maps); [ReductiveGroups#layer-7-structure-theory](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ReductiveGroups/README.md#layer-7-structure-theory).

**Proof/construction.** (1) Reduce by a z-extension to simply connected derived group, then to G/Gder. (2) Resolve that torus by an induced torus and use central-torus bundle surjectivity. (3) For induced tori integral κ is torsion-free and determined by ν; the torus order is equality, so semicontinuity implies local constancy.

**Acceptance.** The norm-one torus torsion classes show why directly using ν for all tori fails.

**Sources.** [Geometrization of the local Langlands correspondence](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), TheoremIII.2.7 and first proof pp.92-93. The cited passage supplies the stated contract; qualifications and source corrections are retained in the node.

**Lean formulation.** full-signature-omitted; The suggested file contains a name-by-name register. A registered omission is not an elaborated theorem or a definition; the numerical tests and point stabilizer equations are expressly restricted cores. Full carrier obligations: G08.

**Atlas planet:** Kottwitz local constancy.

<a id="grassmannian-kottwitz-sign"></a>

### Grassmannian components and Kottwitz sign

**Comparison: TauCeti.BunG.GrassmannianKottwitzSign.** For split G, GS0’s decomposition Gr_G=∐_(α∈π_1G) Gr_G^α has each component a filtered union of proper Schubert closures with [μ]=α. On the modification map, κ(BL(x))=−α. For nonsplit G, use geometric π_1 with Galois descent and then its Γ-coinvariant image in Bun_G. A component decomposition alone does not prove uniformization or bundle connectedness.

**Hypotheses.** Global conventions in the reader apply; additional restrictions are stated in the contract.

**Prerequisites.** [GeometricSatakeAndFusion:GS0:loop-geometry/schubert-bounds-and-properness](../../../content/campaign/GeometricSatakeAndFusion/README.md); [RelativeFarguesFontaine:RF4:G-torsors/modification-of-G-bundle-by-lattice](../../../content/campaign/RelativeFarguesFontaine/README.md); [Newton and Kottwitz invariants](#newton-and-kottwitz-maps); [Local constancy of bundle Kottwitz invariant](#semicontinuity-and-local-constancy).

**Proof/construction.** (1) Import the geometric connected-component theorem, its Schubert exhaustion and the nonsplit descent from GS0. (2) Evaluate on a cocharacter modification to fix the minus sign. (3) Use locally constant κ and connected Schubert pieces to extend the equality.

**Acceptance.** For G_m, the lattice ξ^m produces O(m) with κ=−m under the fixed BL convention.

**Sources.** [Geometrization of the local Langlands correspondence](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), PropositionIII.3.6(ii)-(iii) pp.99-100. The cited passage supplies the stated contract; qualifications and source corrections are retained in the node.; [Affine Grassmannians and the geometric Satake in mixed characteristic](https://annals.math.princeton.edu/wp-content/uploads/annals-v185-n2-p02-p.pdf), Proposition1.21 p.427. The cited passage supplies the stated contract; qualifications and source corrections are retained in the node.

**Lean formulation.** full-signature-omitted; The suggested file contains a name-by-name register. A registered omission is not an elaborated theorem or a definition; the numerical tests and point stabilizer equations are expressly restricted cores. Full carrier obligations: G08.

<a id="newton-topology-homeomorphism"></a>

### Newton topology theorem in both characteristics

**Theorem: TauCeti.BunG.NewtonTopologyHomeomorphism.** For every nonarchimedean local field E and connected reductive G/E, the geometric-class bijection |Bun_G|→B(G) is a homeomorphism for the topology whose closed subsets are upward closed in the fixed-κ Newton order. Equivalently, [b]≤[bprime] iff E_bprime lies in the closure of E_b. Mixed characteristic follows from Viehmann. In equal characteristic, combine the schematic closure theorem with the schematic/analytic topology comparison of Gleason–Ivanov–Zillinger; the comparison alone does not identify geometric specialization with the combinatorial order.

**Hypotheses.** E is a nonarchimedean local field of either characteristic, with finite residue field; G/E is connected reductive, with no quasi-split or unramified hypothesis. Use GIZ26 arXiv v3: its §2 and Remark2.1 allow both characteristics. He16 §2.5 restricts the schematic closure discussion to equal characteristic; use Vie21 for the mixed-characteristic route.

**Prerequisites.** [Geometric classification of G-bundles](#points-are-B-of-G); [Local constancy of bundle Kottwitz invariant](#semicontinuity-and-local-constancy); [Newton partial order with Kottwitz fibre](#partial-order-on-B-of-G); [Isocrystal-family v-descent and strata](#isocrystal-family-v-descent); [Straight Weyl comparison with B(G)](#straight-weyl-classification); [ReductiveGroupsPartII:RG2.4](https://github.com/TauCetiProject/TauCetiRoadmap/blob/201bcaee1f4014c91897d50cdb7631fc6d6a6d71/TauCetiRoadmap/ReductiveGroupsPartII/README.md).

**Proof/construction.** (1) Use geometric point classification and HN semicontinuity to obtain the continuous bijection with the stated reversed specialization convention. (2) In mixed characteristic, use Vie21 Theorem1.1 with its finite-Q_p-extension hypothesis. (3) In equal characteristic, He16 Theorems1.29 and2.12 identify the schematic specialization order with equal integral κ and Newton dominance. Import the straight-class and affine-Bruhat proof inputs through RG2.4, retaining inertia torsion. (4) GIZ26 Lemma7.17 reduces continuity to finite bounded loci and specialization chains. Its Theorem7.18 identifies schematic and analytic isocrystal specialization and reverses Bun_G specialization. (5) For that comparison, realize adjacent schematic specializations on perfect rank-one valuation rings (GIZ26 Proposition2.17). Theorem3.16 identifies the v-descent limit over Spd(Vhat,Vhat) with bundles on Y_(0,∞]; it does not assert that every arbitrary bundle on the open period space extends. Apply the separate PR24 Proposition2.1.3 and FS II.2.14 classification inputs to this schematic-family-induced boundary bundle. Use Theorem7.13 on products of geometric points for the reverse implication. These interiors remain G04/G06 obligations.

**Acceptance.** The basic point is more general than unstable points with the same κ.

**Sources.** [Meromorphic vector bundles on the Fargues–Fontaine curve](https://arxiv.org/pdf/2307.00887v3), §2 and Remark2.1 pp.6–7; §7.3, Lemma7.17 and Theorem7.18 pp.50–53. The recorded v3 permits both characteristics and compares schematic/analytic specialization with reversed bundle specialization; identifying this with the κ/ν order also needs the schematic closure theorem.; [Hecke algebras and p-adic groups](https://arxiv.org/pdf/1511.01386v3), §1.10.5, Theorem1.29 pp.20–21; §§2.2 and2.4–2.6 pp.22,25–28, Theorem2.12 p.28. The straight-class order is equality of integral κ plus Newton dominance; the schematic closure theorem is used within the equal-characteristic restriction of §2.5.; [On Newton strata in the B_dR^+-Grassmannian](https://arxiv.org/pdf/2101.07510), Theorem1.1 and topology convention p.2. Supplies the mixed-characteristic case, for E a finite extension of Q_p.; [Geometrization of the local Langlands correspondence](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), ConjectureIII.2.15 p.97. Records the original general-field topology assertion; the theorem is supplied by the later sources, not this conjecture.

**Lean formulation.** full-signature-omitted; The suggested file contains a name-by-name register. A registered omission is not an elaborated theorem or a definition; the numerical tests and point stabilizer equations are expressly restricted cores. Full carrier obligations: G08.

**Atlas planet:** Newton topology theorem.

<a id="modification-newton-bound"></a>

### Newton bound for a modification

**Theorem: TauCeti.BunG.ModificationNewtonBound.** For G/Q_p and any geometric cocharacter class μ, a geometric point of Gr_(G,μ) modifying the trivial bundle determines b∈B(G,{μ^−1}). For GL_n the bundle Newton tuple is dominated by its relative-position tuple with matching total degree; translate through ν_bundle=w_0(−ν_isocrystal). The full κ equality is μ^−1♯.

**Hypotheses.** Global conventions in the reader apply; additional restrictions are stated in the contract.

**Prerequisites.** [RelativeFarguesFontaine:RF4:G-torsors/modification-of-G-bundle-by-lattice](../../../content/campaign/RelativeFarguesFontaine/README.md); [Geometric classification of G-bundles](#points-are-B-of-G); [HN sign and semicontinuity](#hn-sign-and-semicontinuity); [Acceptable classes B(G,{μ})](#admissible-pair); [Representations detect Newton dominance](#representation-detects-dominance); [GeometricSatakeAndFusion:GS0:loop-geometry/schubert-bounds-and-properness](../../../content/campaign/GeometricSatakeAndFusion/README.md).

**Proof/construction.** (1) For GL_n use exterior powers to reduce to a bound on the first slope and determinant degree. (2) Compute the determinant line modification to establish the equality of totals. (3) Use RR96’s representation criterion for G and the component-sign comparison for κ.

**Acceptance.** The inverse Hodge class is essential in the CS convention.

**Sources.** [On the generic part of the cohomology of compact unitary Shimura varieties](https://annals.math.princeton.edu/wp-content/uploads/annals-v186-n3-p01-p.pdf), Proposition3.5.3 and Lemma3.5.4 pp.687-689. The cited passage supplies the stated contract; qualifications and source corrections are retained in the node.

**Lean formulation.** full-signature-omitted; The suggested file contains a name-by-name register. A registered omission is not an elaborated theorem or a definition; the numerical tests and point stabilizer equations are expressly restricted cores. Full carrier obligations: G08.

<a id="minuscule-modification-image"></a>

### Minuscule modification image

**Theorem: TauCeti.BunG.MinusculeModificationImage.** For minuscule μ over Q_p, the map from the flag variety Fℓ_(G,μ)≅Gr_(G,μ) to B(G,{μ^−1}) is surjective on geometric classes. This is stronger than the invariant containment for all μ and uses the Rapoport existence result recalled by CS17 Remark3.5.8.

**Hypotheses.** Global conventions in the reader apply; additional restrictions are stated in the contract.

**Prerequisites.** [Newton bound for a modification](#modification-newton-bound); [GeometricSatakeAndFusion:GS0:Schubert-smoothness/open-cell-stabilizer-and-smoothness](../../../content/campaign/GeometricSatakeAndFusion/README.md); [Acceptable classes B(G,{μ})](#admissible-pair).

**Proof/construction.** (1) Use the minuscule flag/Grassmannian identification supplied by GS0. (2) Apply Rapoport PropositionA.9 for every acceptable class; its original proof is an explicit gap, not inferred from containment.

**Acceptance.** A nonempty acceptable index set alone does not produce a flag point.

**Sources.** [On the generic part of the cohomology of compact unitary Shimura varieties](https://annals.math.princeton.edu/wp-content/uploads/annals-v186-n3-p01-p.pdf), Remark3.5.8 p.689. The cited passage supplies the stated contract; qualifications and source corrections are retained in the node.

**Lean formulation.** full-signature-omitted; The suggested file contains a name-by-name register. A registered omission is not an elaborated theorem or a definition; the numerical tests and point stabilizer equations are expressly restricted cores. Full carrier obligations: G08.

<a id="de-rham-quotient-group-class"></a>

### Class from a de Rham quotient-group lattice

**Comparison: TauCeti.BunG.DeRhamQuotientGroupClass.** In Liu–Zhu Corollary4.9, the tensor functor has domain Rep_(Q_p)(G^c), where G^c=G/Z_G^s. At a classical point embedded into C_p, its de Rham comparison defines compatible B_dR^+ lattices. The Fargues tensor modification construction therefore gives a class in B(G^c_(Q_p)). Producing a class in B(G_(Q_p)) requires a chosen compatible lift or additional G-level tensor data. No canonical lift is claimed.

**Hypotheses.** Global conventions in the reader apply; additional restrictions are stated in the contract.

**Prerequisites.** [Tannakian description of analytic torsors](#g-torsors-three-descriptions); [RelativeFarguesFontaine:RF4:G-torsors/modification-of-G-bundle-by-lattice](../../../content/campaign/RelativeFarguesFontaine/README.md); [Geometric classification of G-bundles](#points-are-B-of-G); [Central-torus bundle surjectivity](#central-torus-bundle-surjectivity).

**Proof/construction.** (1) Apply de Rham comparison at the point in every rational G^c representation. (2) Use the exact tensor lattice-to-bundle functor from RF4 and classify the resulting curve bundle. (3) Retain the correct coefficient group; central-torus v-surjectivity is local existence and supplies no canonical G-level lift.

**Acceptance.** The reviewed PAPER-LIU-ZHU-17/G22 qualification is retained.

**Sources.** [Rigidity and a Riemann-Hilbert correspondence for p-adic local systems](https://arxiv.org/pdf/1602.06282v3), Corollary4.9 and Remark4.1(iii) pp.33-34. The cited passage supplies the stated contract; qualifications and source corrections are retained in the node.

**Lean formulation.** full-signature-omitted; The suggested file contains a name-by-name register. A registered omission is not an elaborated theorem or a definition; the numerical tests and point stabilizer equations are expressly restricted cores. Full carrier obligations: G08.

## BG2:smooth-Artin — The whole smooth Artin stack

Use the Isom sheaves for the diagonal and the quotients of open Schubert cells for a covering. The proof establishes smooth Artin geometry of the whole stack and then computes its connected components; smoothness of separate strata does not supply this theorem.

<a id="isom-sheaf-representability"></a>

### Locally spatial Isom diagonal

**Theorem: TauCeti.BunG.IsomSheafRepresentability.** For G-bundles E1,E2 over X_S, Isom_G(E1,E2) is a locally spatial diamond over S. For vector bundles the surjection locus and isomorphism locus are open subdiamonds of BC(E1∨⊗E2). For general reductive G, a Chevalley faithful representation with its stabilizer line presents Isom_G as finite closed compatibility conditions inside products of these linear Isom diamonds.

**Hypotheses.** Global conventions in the reader apply; additional restrictions are stated in the contract.

**Prerequisites.** [Moduli v-stack Bun_G](#bun-g-as-v-stack); [VectorBundlesAndIsocrystals:VB3:general-BC/families-of-banach-colmez-spaces](../../../content/campaign/VectorBundlesAndIsocrystals/README.md); [ReductiveGroups#layer-7-structure-theory](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ReductiveGroups/README.md#layer-7-structure-theory); [ReductiveGroups#layer-1-representations--comodules](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ReductiveGroups/README.md#layer-1-representations--comodules); [DiamondsAndVStacks:D4](../../../content/campaign/DiamondsAndVStacks/README.md); [DiamondsAndVStacks:D5/relative-representability](../../../content/campaign/DiamondsAndVStacks/README.md).

**Proof/construction.** (1) For a linear map the support of the cokernel is closed and has closed image in S; surjectivity is its open complement. (2) Isomorphisms require both a map and its dual to be surjective. (3) Apply the actual rational Chevalley stabilizer presentation and stability of locally spatial diamonds under finite limits.

**Acceptance.** The faithful representation includes its defining tensor constraints; arbitrary GL_n isomorphisms need not preserve G.

**Sources.** [Geometrization of the local Langlands correspondence](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), LemmaIV.1.20 and proof ofIV.1.19 pp.112-113. The cited passage supplies the stated contract; qualifications and source corrections are retained in the node.

**Lean formulation.** full-signature-omitted; The suggested file contains a name-by-name register. A registered omission is not an elaborated theorem or a definition; the numerical tests and point stabilizer equations are expressly restricted cores. Full carrier obligations: G08.

<a id="bun-g-is-smooth-artin"></a>

### Cohomological smoothness of Bun_G

**Theorem: TauCeti.BunG.BunGIsSmoothArtin.** For ℓ≠p, Bun_G is an ℓ-cohomologically smooth Artin v-stack of ℓ-dimension0. The disjoint union over Galois cocharacter orbits of [G(E)\Gr_(G,μbar)] maps to Bun_G by a separated cohomologically smooth surjection. These are open Schubert cells, not their generally singular closures.

**Hypotheses.** Global conventions in the reader apply; additional restrictions are stated in the contract.

**Prerequisites.** [Smallness of Bun_G](#bun-g-smallness); [Beauville–Laszlo uniformization](#beauville-laszlo-surjectivity); [Geometrically trivial open locus](#geometrically-trivial-locus); [Locally spatial Isom diagonal](#isom-sheaf-representability); [GeometricSatakeAndFusion:GS0:Schubert-smoothness/open-cell-stabilizer-and-smoothness](../../../content/campaign/GeometricSatakeAndFusion/README.md); [VStackSheavesAndLisseCategories:VS0](../../../content/campaign/VStackSheavesAndLisseCategories/README.md).

**Proof/construction.** (1) The diagonal is locally spatial by the Isom theorem. (2) After an untilt, each fibre is the open locus of fixed-relative-position modifications that are geometrically trivial. (3) Use GS0 open-cell cohomological smoothness, and independent BL uniformization for surjectivity. (4) The source quotient is smooth over [*/G(E)] with dimension<2ρ,μ>, and the map has the same relative dimension; subtract them to obtain dimension0. (5) Import VS0 Artin descent, separatedness and locally profinite classifying-stack charts; no GS4, VS1 or VS4 is used.

**Acceptance.** For infinite locally profinite G(E), *→[*/G(E)] is not used as a cohomologically smooth atlas.

**Sources.** [Geometrization of the local Langlands correspondence](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), TheoremIV.1.19 pp.112-113. The cited passage supplies the stated contract; qualifications and source corrections are retained in the node.

**Lean formulation.** full-signature-omitted; The suggested file contains a name-by-name register. A registered omission is not an elaborated theorem or a definition; the numerical tests and point stabilizer equations are expressly restricted cores. Full carrier obligations: G08.

**Atlas planet:** Smooth Artin moduli stack.

<a id="connected-components"></a>

### Connected components of Bun_G

**Theorem: TauCeti.BunG.ConnectedComponents.** κ induces π_0(Bun_G)≅π_1(G)_Γ. Every nonempty open substack contains a basic point: restrict to a finite T_0 Newton region, take an open point, and compare the whole-stack dimension0 with the stratum dimension −<2ρ,ν_b> to force central ν_b.

**Hypotheses.** Global conventions in the reader apply; additional restrictions are stated in the contract.

**Prerequisites.** [Local constancy of bundle Kottwitz invariant](#semicontinuity-and-local-constancy); [Cohomological smoothness of Bun_G](#bun-g-is-smooth-artin); [Cohomological dimension of Newton strata](#stratum-dimension); [Semistable locus and basic strata](#semistable-locus-and-basic-strata); [Kottwitz classification by both invariants](#classification-by-two-invariants); [VStackSheavesAndLisseCategories:VS0](../../../content/campaign/VStackSheavesAndLisseCategories/README.md).

**Proof/construction.** (1) Use the finite T_0 open-point lemma with the discrete κ coordinate. (2) An open stratum has the ambient dimension0, so its positive-root pairing vanishes and b is basic. (3) The basic κ bijection makes each fibre connected; two disjoint nonempty open pieces would each have to contain its unique basic point.

**Acceptance.** Torsion components such as split PGL_n’s Z/n are included.

**Sources.** [Geometrization of the local Langlands correspondence](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), CorollaryIV.1.23 and LemmaIV.1.24 pp.113-114. The cited passage supplies the stated contract; qualifications and source corrections are retained in the node.

**Lean formulation.** full-signature-omitted; The suggested file contains a name-by-name register. A registered omission is not an elaborated theorem or a definition; the numerical tests and point stabilizer equations are expressly restricted cores. Full carrier obligations: G08.

**Atlas planet:** Connected components of Bun_G.

## BG3 — Basic and nonbasic strata

Identify HN-graded objects, the filtered relative automorphism group and its global sections. The positive kernel produces the true classifying-stack description for a nonbasic stratum. Pull minuscule flag modifications back to these strata, and retain the exact unitary datum in the dimension and ordinary-locus comparisons.

<a id="hn-graded-g-bundles"></a>

### HN-graded G-bundles

**Construction: TauCeti.BunG.HNGraded.** Bun_G^(HN-split)(S) consists of exact rational tensor functors into Q-graded bundles on X_S with weight-λ piece everywhere semistable of bundle slope λ. For b, use the slope-reversed grading of E_b. Forgetting the grading lands in Bun_G. The graded automorphism group scheme is the constant curve group J_b×X_S.

**Hypotheses.** Global conventions in the reader apply; additional restrictions are stated in the contract.

**Prerequisites.** [Moduli v-stack Bun_G](#bun-g-as-v-stack); [VectorBundlesAndIsocrystals:VB1/isocrystal-to-bundle-functor](../../../content/campaign/VectorBundlesAndIsocrystals/README.md); [VectorBundlesAndIsocrystals:VB4/relative-HN-filtration-and-proetale-splitting](../../../content/campaign/VectorBundlesAndIsocrystals/README.md); [Algebraic sigma-centralizer](#sigma-centralizer-J-b).

**Proof/construction.** (1) Use the tensor-compatible HN graded category, keeping the bundle slope sign. (2) Identify its automorphism group from the slope-centralizer of the isocrystal.

**API.**

| Declaration | Role | Contract |
|---|---|---|
| TauCeti.BunG.HNGraded.forget | functoriality | Forget grading to Bun_G. |
| TauCeti.BunG.HNGraded.ofClass | constructor | E_b has its canonical Q-grading from the isocrystal, with slope reversal. |
| TauCeti.BunG.HNGraded.automorphisms | characterisation | Aut of the graded object is J_b(E). |
| TauCeti.BunG.HNGraded.classifying | equivalence | Bun_G^(HN-split)≃∐_(b∈B(G))[*/J_b(E)]. |

**Discriminating unit tests.**

- **TauCeti.BunG.HNGraded.testGL2** (computation): For O⊕O(1), graded automorphisms are E××E×.
- **TauCeti.BunG.HNGraded.testBasic** (degenerate): For a basic object no positive grading-changing kernel occurs.
- **TauCeti.BunG.HNGraded.testUngraded** (non-example): For O⊕O(1), ungraded automorphisms also contain BC(O(1)), which grading removes.

**Uses.** FS III.5.1: Gives the projection of full automorphisms to the discrete centralizer. FS V.3.3: Defines the chart’s associated-graded map.

**Acceptance.** Weights refer to bundle slopes, not the original isocrystal slopes.

**Sources.** [Geometrization of the local Langlands correspondence](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), PropositionIII.4.7 pp.102-103. The cited passage supplies the stated contract; qualifications and source corrections are retained in the node.

**Lean formulation.** full-signature-omitted; The suggested file contains a name-by-name register. A registered omission is not an elaborated theorem or a definition; the numerical tests and point stabilizer equations are expressly restricted cores. Full carrier obligations: G08.

**Atlas planet:** HN-graded G-bundles.

<a id="hn-graded-classification"></a>

### Classification of HN-graded bundles

**Theorem: TauCeti.BunG.HnGradedClassification.** The natural map ∐_b[*/J_b(E)]→Bun_G^(HN-split) is an equivalence. The graded fibre is locally isomorphic to E_b^gr and its Isom torsor is a J_b-bundle geometrically trivial at the chosen point; openness and locally profinite torsor triviality make it locally constant.

**Hypotheses.** Global conventions in the reader apply; additional restrictions are stated in the contract.

**Prerequisites.** [HN-graded G-bundles](#hn-graded-g-bundles); [Geometrically trivial open locus](#geometrically-trivial-locus); [Pro-étale torsors on strictly disconnected bases](#strictly-disconnected-torsors); [VectorBundlesAndIsocrystals:VB4/relative-HN-filtration-and-proetale-splitting](../../../content/campaign/VectorBundlesAndIsocrystals/README.md); [VectorBundlesAndIsocrystals:VB4/slope-zero-local-systems](../../../content/campaign/VectorBundlesAndIsocrystals/README.md); [VectorBundlesAndIsocrystals:VB4/relative-cohomology-vanishing](../../../content/campaign/VectorBundlesAndIsocrystals/README.md).

**Proof/construction.** (1) Use local constancy of the filtration type and relative HN graded semistability. (2) Apply the trivial-locus theorem to the J_b Isom torsor. (3) Descend the local objects with their graded automorphisms.

**Acceptance.** This is an equivalence of graded groupoids, stronger than geometric point classification.

**Sources.** [Geometrization of the local Langlands correspondence](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), PropositionIII.4.7 pp.102-103. The cited passage supplies the stated contract; qualifications and source corrections are retained in the node.

**Lean formulation.** full-signature-omitted; The suggested file contains a name-by-name register. A registered omission is not an elaborated theorem or a definition; the numerical tests and point stabilizer equations are expressly restricted cores. Full carrier obligations: G08.

<a id="filtered-automorphism-group-scheme"></a>

### Filtered torsor automorphism group schemes

**Construction: TauCeti.BunG.FilteredAutomorphism.** For a reductive G/K, scheme X/K and Q-filtered G-fibre functor E, let H=Aut_G(E), its inner group over X. For λ≥0, H^≥λ consists of automorphisms whose difference from1 raises every represented filtration by at least λ. H^≥0 is parabolic with unipotent radical H^>0; the groups are smooth, Lie H^≥λ=(ad E)^≥λ, and for λ>0 the quotient H^≥λ/H^>λ is the vector group (ad E)^≥λ/(ad E)^>λ.

**Hypotheses.** The underlying functor is an exact K-linear tensor fibre functor for finite rational representations of a reductive G/K, associated to a G-torsor on X. The descending Q-filtration is exhaustive, separated and locally has finitely many jumps on each representation; its steps are subbundles with locally free graded pieces, and it is exact and tensor-compatible. Splitting is asserted on affine open charts, followed by étale trivialization of the smooth underlying torsor; no global splitting over an arbitrary scheme is assumed.

**Prerequisites.** [Pure inner twisting of torsors](#pure-inner-twisting); [ReductiveGroups#layer-7-structure-theory](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ReductiveGroups/README.md#layer-7-structure-theory); [ReductiveGroups#layer-1-representations--comodules](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ReductiveGroups/README.md#layer-1-representations--comodules); [TauCeti.Cocharacter.parabolic](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Algebra/AlgebraicGroup/Dynamic/Parabolic.lean); [TauCeti.Cocharacter.leviGroupExtension](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Algebra/AlgebraicGroup/Dynamic/LeviDecomposition/Basic.lean); [TauCeti.FGPointRepresentationCat](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Algebra/AlgebraicGroup/Representation/Comodule/Equivalence.lean); [TauCeti.FGPointRepresentationCat.instRigidCategory](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Algebra/AlgebraicGroup/Representation/Comodule/Monoidal.lean).

**Proof/construction.** (1) On an affine chart, choose a tensor generator and clear its finitely many rational weight denominators. Exact tensor generation extends the same denominator to all representations. Rescale to a Z-filtration; a chosen threshold λ can be included in the denominator. The underlying automorphism group is an inner form of reductive G, hence smooth. Zie15 Theorem1.3/4.15 therefore splits the filtration on that chart, rather than merely after an fpqc cover. (2) Trivialize the G-torsor étale locally. The splitting is then a rational cocharacter D→G. Apply the relative cocharacter/root-weight calculation from the group owner to represent the filtration-preserving parabolic, its positive radical and the higher raising subgroups. Their Lie algebras are the corresponding filtered adjoint subbundles. (3) At λ>0, the map g↦g−1 on associated gradeds is additive: the product error raises the filtration by 2λ>λ. Zie15 Proposition4.24 and Lemma4.25 give the vector-group quotient after rescaling; its Lie bundle identifies it with gr^λ(ad E). At λ=0 retain the reductive Levi quotient instead. (4) Descend the represented closed subgroup schemes and their Lie/graded identifications along the étale charts, compatibly with arbitrary scheme pullback. The generic relative representability and rational-cocharacter calculation are the RG layer7/G02 supplier refinement; native field point subgroups alone do not prove them.

**API.**

| Declaration | Role | Contract |
|---|---|---|
| TauCeti.BunG.FilteredAutomorphism.raising_iff | characterisation | For every rational representation and λprime, (γ−1)E^≥λprime⊂E^≥(λprime+λ). |
| TauCeti.BunG.FilteredAutomorphism.parabolic | projection | H^≥0 is the filtration-preserving parabolic. |
| TauCeti.BunG.FilteredAutomorphism.unipotent | projection | H^>0 is its unipotent radical. |
| TauCeti.BunG.FilteredAutomorphism.graded | equivalence | For λ>0 the quotient is the stated additive vector group. |
| TauCeti.BunG.FilteredAutomorphism.pullback | functoriality | Scheme pullback commutes with H, its filtration and vector-group quotients. |
| TauCeti.BunG.FilteredAutomorphism.localSplit | constructor | There is an affine open cover on which the filtered fibre functor splits; after an étale trivialization of its underlying torsor the splitting is a rational cocharacter D→G. This assertion is compatible with restriction and does not assert a global splitting on X. |

**Discriminating unit tests.**

- **TauCeti.BunG.FilteredAutomorphism.testGL2** (computation): For the two-step diagonal filtration the parabolic is triangular and the positive radical has one root line.
- **TauCeti.BunG.FilteredAutomorphism.testTrivialFiltration** (degenerate): For the trivial filtration H^≥0=H and H^>0=1.
- **TauCeti.BunG.FilteredAutomorphism.testZeroWeight** (non-example): At λ=0 the reductive Levi quotient is not generally an additive vector group.
- **TauCeti.BunG.FilteredAutomorphism.testRationalJump** (computation): For GL_2 with ordered basis of weights 0,3/2, H^≥0 is lower triangular and H^>0 is its one-dimensional lower unipotent radical. H^≥1/H^>1 is trivial, H^≥(3/2)/H^>(3/2) is G_a, and H^≥2 is trivial. Clearing denominator2 preserves these thresholds.
- **TauCeti.BunG.FilteredAutomorphism.testNonAffine** (non-example): On P^1_K, the Euler filtration 0→O(−1)→O^2→O(1)→0 defines a filtered GL_2 fibre functor with smooth underlying group, but no global splitting: O^2 is not O(−1)⊕O(1). It splits on affine opens. Thus the affine hypothesis cannot be dropped.

**Uses.** FS III.5.1: The global sections give the full automorphism filtration. FS V.3.5: The opposite filtration gives the extension tower in the chart.

**Acceptance.** A field of point-subgroup data alone cannot represent this relative group scheme. Do not replace the affine smooth-group splitting input by the general fpqc splitting theorem, or infer a global splitting on non-affine X.

**Sources.** [Geometrization of the local Langlands correspondence](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), PropositionIII.5.2 p.105. The cited passage supplies the stated contract; qualifications and source corrections are retained in the node. [Graded and filtered fiber functors on Tannakian categories](https://arxiv.org/pdf/1111.1981v4), Theorem1.3 p.2; §4.3, Theorems4.14–4.16 pp.24–25 and Proposition4.24/Lemma4.25/Theorem4.26 pp.26–27. Supplies the affine smooth-group splitting and positive filtered vector-quotient argument for Z-filtrations. The finite-generator denominator reduction to Q-filtrations is stated explicitly in the proof outline.

**Lean formulation.** full-signature-omitted; The suggested file contains a name-by-name register. A registered omission is not an elaborated theorem or a definition; the numerical tests and point stabilizer equations are expressly restricted cores. Full carrier obligations: G08.

<a id="full-automorphism-v-group"></a>

### Full bundle automorphism v-group

**Construction: TauCeti.BunG.FullAutomorphism.** For b, tildeJ_b(S)=Aut_(X_S)(E_b). Every automorphism preserves HN; its action on the associated graded gives a split exact sequence 1→tildeJ_b^>0→tildeJ_b→J_b(E)→1, with tildeJ_b=tildeJ_b^>0⋊J_b(E). For positive bundle slope λ the graded quotient is BC((ad E_b)^λ); it corresponds to the isocrystal slope −λ. The connected kernel is generally nonzero for nonbasic b.

**Hypotheses.** Global conventions in the reader apply; additional restrictions are stated in the contract.

**Prerequisites.** [Classification of HN-graded bundles](#hn-graded-classification); [Filtered torsor automorphism group schemes](#filtered-automorphism-group-scheme); [VectorBundlesAndIsocrystals:VB3:general-BC/families-of-banach-colmez-spaces](../../../content/campaign/VectorBundlesAndIsocrystals/README.md); [VectorBundlesAndIsocrystals:VB4/relative-HN-filtration-and-proetale-splitting](../../../content/campaign/VectorBundlesAndIsocrystals/README.md); [Algebraic sigma-centralizer](#sigma-centralizer-J-b); [VectorBundlesAndIsocrystals:VB4/slope-zero-local-systems](../../../content/campaign/VectorBundlesAndIsocrystals/README.md); [VectorBundlesAndIsocrystals:VB4/relative-cohomology-vanishing](../../../content/campaign/VectorBundlesAndIsocrystals/README.md); [DiamondsAndVStacks:D5/relative-representability](../../../content/campaign/DiamondsAndVStacks/README.md).

**Proof/construction.** (1) Take global sections of the filtered relative automorphism group. (2) Use H^1 vanishing of positive bundle pieces to make the quotient maps surjective. (3) The canonical graded isocrystal action splits the projection; identify π_0 with J_b(E).

**API.**

| Declaration | Role | Contract |
|---|---|---|
| TauCeti.BunG.FullAutomorphism.projection | functoriality | Return the action on the HN graded object in J_b(E). |
| TauCeti.BunG.FullAutomorphism.section | functoriality | The isocrystal automorphism action splits the projection. |
| TauCeti.BunG.FullAutomorphism.kernel | characterisation | Kernel consists of strictly HN-raising automorphisms. |
| TauCeti.BunG.FullAutomorphism.graded | equivalence | For λ>0, the filtration quotient is BC of the bundle-slope λ adjoint piece. |
| TauCeti.BunG.FullAutomorphism.semidirect | equivalence | Identify tildeJ_b with its positive kernel semidirect J_b(E). |

**Discriminating unit tests.**

- **TauCeti.BunG.FullAutomorphism.testGL2** (computation): Aut(O⊕O(1)) consists of invertible triangular matrices with diagonal E× and upper entry BC(O(1)).
- **TauCeti.BunG.FullAutomorphism.testBasic** (degenerate): For basic b all adjoint slopes are0, so the positive kernel is trivial.
- **TauCeti.BunG.FullAutomorphism.testAlgebraicJ** (non-example): For the nonbasic example J_b(E)=E××E× alone misses the upper triangular sections.

**Uses.** FS III.5.3 and IV.1.22: Defines the true stratum stabilizer and its dimension. VS4: Supplies the geometric kernel only; sheaf-category invariance is owned by VS4.

**Acceptance.** The GL_2 O⊕O(1) kernel is BC(O(1)).

**Sources.** [Geometrization of the local Langlands correspondence](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), PropositionIII.5.1 pp.104-105. The cited passage supplies the stated contract; qualifications and source corrections are retained in the node.

**Lean formulation.** full-signature-omitted; The suggested file contains a name-by-name register. A registered omission is not an elaborated theorem or a definition; the numerical tests and point stabilizer equations are expressly restricted cores. Full carrier obligations: G08.

**Atlas planet:** Full bundle automorphism group.

<a id="positive-automorphism-kernel"></a>

### Positive automorphism kernel geometry

**Theorem: TauCeti.BunG.PositiveAutomorphismKernel.** tildeJ_b^>0 is a successive extension of positive Banach–Colmez spaces, represented by a locally spatial diamond. For ℓ≠p it is cohomologically smooth of dimension sum_(λ>0) λ·rank((ad E_b)^λ)=<2ρ,ν_b>. Its connectedness identifies π_0 tildeJ_b=J_b(E). All dimensions use the isocrystal dominant ν_b with the slope reversal already incorporated.

**Hypotheses.** Global conventions in the reader apply; additional restrictions are stated in the contract.

**Prerequisites.** [Full bundle automorphism v-group](#full-automorphism-v-group); [VectorBundlesAndIsocrystals:VB3:general-BC/families-of-banach-colmez-spaces](../../../content/campaign/VectorBundlesAndIsocrystals/README.md); [VStackSheavesAndLisseCategories:VS0](../../../content/campaign/VStackSheavesAndLisseCategories/README.md); [ReductiveGroupsPartII:RG2.1](https://github.com/TauCetiProject/TauCetiRoadmap/blob/201bcaee1f4014c91897d50cdb7631fc6d6a6d71/TauCetiRoadmap/ReductiveGroupsPartII/README.md); [VectorBundlesAndIsocrystals:VB3:general-BC/positive-range-dimension](../../../content/campaign/VectorBundlesAndIsocrystals/README.md); [DiamondsAndVStacks:D5/relative-representability](../../../content/campaign/DiamondsAndVStacks/README.md).

**Proof/construction.** (1) Induct over the finite positive filtration and use BC positive-slope smoothness, connectedness and H^1 vanishing. (2) Apply additivity of ℓ-dimension to the extension tower. (3) Compute the positive adjoint root weights as the 2ρ pairing.

**Acceptance.** For O⊕O(1), the kernel dimension is1; its quotient classifying stack has dimension−1.

**Sources.** [Geometrization of the local Langlands correspondence](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), PropositionIII.5.1 pp.104-105. The cited passage supplies the stated contract; qualifications and source corrections are retained in the node.

**Lean formulation.** full-signature-omitted; The suggested file contains a name-by-name register. A registered omission is not an elaborated theorem or a definition; the numerical tests and point stabilizer equations are expressly restricted cores. Full carrier obligations: G08.

<a id="quasi-split-opposite-parabolic"></a>

### Quasi-split opposite-parabolic automorphisms

**Comparison: TauCeti.BunG.QuasiSplitOppositeParabolic.** For quasi-split G and a dominant rational ν_b, M_b=Z_G(ν_b), P_b^− is the parabolic with nonpositive ν_b weights. The curve group Q=E_(b_M)×^(M_b)P_b^− has tildeJ_b(S)=Q(X_S) and positive kernel Γ(X_S,R_uQ). The opposite sign reflects the slope-reversing isocrystal-to-bundle functor.

**Hypotheses.** Global conventions in the reader apply; additional restrictions are stated in the contract.

**Prerequisites.** [Full bundle automorphism v-group](#full-automorphism-v-group); [Rational Newton representative](#rational-newton-witness); [ReductiveGroups#layer-7-structure-theory](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ReductiveGroups/README.md#layer-7-structure-theory); [VectorBundlesAndIsocrystals:VB1/isocrystal-to-bundle-functor](../../../content/campaign/VectorBundlesAndIsocrystals/README.md).

**Proof/construction.** (1) Use the rational Newton representative to put b in its Levi. (2) Identify the HN-preserving inner parabolic with the twist of P_b^−. (3) Take curve sections and compare its unipotent root bundles with the positive HN pieces.

**Acceptance.** For GL_2 O⊕O(1), the positive section is the O(1) upper entry.

**Sources.** [Geometrization of the local Langlands correspondence](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), III.5.1.1 pp.105-106. The cited passage supplies the stated contract; qualifications and source corrections are retained in the node.

**Lean formulation.** full-signature-omitted; The suggested file contains a name-by-name register. A registered omission is not an elaborated theorem or a definition; the numerical tests and point stabilizer equations are expressly restricted cores. Full carrier obligations: G08.

<a id="semistable-locus-and-basic-strata"></a>

### Semistable locus and basic strata

**Construction: TauCeti.BunG.Semistable.** Bun_G^ss is the full substack where every geometric fibre has central Newton morphism. It is open; κ decomposes it into open and closed basic strata and Bun_G^ss≃∐_(b basic)[*/J_b(E)]. Each basic stratum is neutralized by its chosen E_b; the locally profinite topology on J_b(E) is retained.

**Hypotheses.** Global conventions in the reader apply; additional restrictions are stated in the contract.

**Prerequisites.** [Basic sigma class](#basic-class); [Local constancy of bundle Kottwitz invariant](#semicontinuity-and-local-constancy); [Geometrically trivial open locus](#geometrically-trivial-locus); [Basic inner form equivalence](#basic-inner-form-bundle-equivalence).

**Proof/construction.** (1) Centrality is a minimality condition and hence an open HN locus. (2) Use the basic κ bijection to decompose it into its discrete classes. (3) Apply basic inner twisting to the geometrically trivial locus in Bun_(J_b).

**API.**

| Declaration | Role | Contract |
|---|---|---|
| TauCeti.BunG.Semistable.mem_iff | characterisation | Every geometric Newton class is basic. |
| TauCeti.BunG.Semistable.openImmersion | data | The inclusion Bun_G^ss→Bun_G is open. |
| TauCeti.BunG.Semistable.basicDecomposition | equivalence | Decompose as the disjoint union of basic rational-point classifying stacks. |
| TauCeti.BunG.Semistable.component | projection | The κ index identifies the basic summand. |

**Discriminating unit tests.**

- **TauCeti.BunG.Semistable.testGL2Half** (computation): The bundle of the basic slope1/2 block is semistable of bundle slope−1/2.
- **TauCeti.BunG.Semistable.testTorus** (degenerate): For a torus Bun_T is entirely semistable.
- **TauCeti.BunG.Semistable.testUnstable** (non-example): O⊕O(1) is not semistable.

**Uses.** FS III.4 and IV.1.23: Provides basic points in each connected component. CS17 basic flag stratum: Pullback of the designated basic summand is the admissible open locus.

**Acceptance.** Basic does not imply isomorphism to the trivial G-bundle.

**Sources.** [Geometrization of the local Langlands correspondence](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), TheoremIII.4.5 p.102. The cited passage supplies the stated contract; qualifications and source corrections are retained in the node.

**Lean formulation.** full-signature-omitted; The suggested file contains a name-by-name register. A registered omission is not an elaborated theorem or a definition; the numerical tests and point stabilizer equations are expressly restricted cores. Full carrier obligations: G08.

**Atlas planet:** Semistable bundle locus.

<a id="torus-picard-stack"></a>

### Torus bundle Picard stack

**Construction: TauCeti.BunG.TorusPicard.** For a torus T, Bun_T is a Picard stack fitting into 0→[*/T(E)]→Bun_T→X_*(T)_Γ→0. Every κ-fibre is a T(E)-banded gerbe neutralized by a choice of representative b of its class. A multiplicative splitting exists when a group section of T(L)→B(T) is chosen, for example when B(T) is torsion-free. It is not asserted canonically for a torus with torsion coinvariants.

**Hypotheses.** Global conventions in the reader apply; additional restrictions are stated in the contract.

**Prerequisites.** [Semistable locus and basic strata](#semistable-locus-and-basic-strata); [Torus norm and Newton average](#torus-norm-description); [DiamondsAndVStacks:D3](../../../content/campaign/DiamondsAndVStacks/README.md).

**Proof/construction.** (1) Use contracted product of commuting torus torsors for the Picard operation. (2) Identify the neutral fibre and other fibres by translation with E_b. (3) A group section gives coherent multiplicative neutralizations; without it retain the extension.

**API.**

| Declaration | Role | Contract |
|---|---|---|
| TauCeti.BunG.TorusPicard.tensor | structure | Contracted product adds the κ classes. |
| TauCeti.BunG.TorusPicard.kottwitz | functoriality | Bun_T→X_*(T)_Γ is a Picard-stack morphism. |
| TauCeti.BunG.TorusPicard.fibre | equivalence | A chosen b of κ=β neutralizes the fibre as [*/T(E)]. |
| TauCeti.BunG.TorusPicard.splitOfSection | equivalence | A group section of T(L)→B(T) gives the Picard product decomposition. |

**Discriminating unit tests.**

- **TauCeti.BunG.TorusPicard.testGm** (computation): Line bundles form ∐_(d∈Z)[*/E×], with tensor product adding degrees.
- **TauCeti.BunG.TorusPicard.testTrivial** (degenerate): The trivial torus has the terminal Picard stack.
- **TauCeti.BunG.TorusPicard.testTorsion** (non-example): For the norm-one torus, the two κ fibres do not by themselves specify a canonical multiplicative splitting.

**Uses.** FS III.2.12 torus case: Translate the neutral fibre for the cohomology comparison. FS III.4.6: Explains the noncanonical gerbe neutralization.

**Acceptance.** A set-wise neutralization of each fibre is weaker than a Picard splitting.

**Sources.** [Geometrization of the local Langlands correspondence](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), ExampleIII.4.6 p.102. The cited passage supplies the stated contract; qualifications and source corrections are retained in the node.

**Lean formulation.** full-signature-omitted; The suggested file contains a name-by-name register. A registered omission is not an elaborated theorem or a definition; the numerical tests and point stabilizer equations are expressly restricted cores. Full carrier obligations: G08.

<a id="stratum-is-classifying-stack"></a>

### Full classifying-stack description of a stratum

**Theorem: TauCeti.BunG.StratumIsClassifyingStack.** For every b, Bun_G^b is the locally closed full substack of bundles geometrically isomorphic to E_b and Bun_G^b≃[*/tildeJ_b]. The map to [*/J_b(E)] has the canonical section induced by the semidirect splitting. For basic b the kernel vanishes; for nonbasic b it must be retained.

**Hypotheses.** Global conventions in the reader apply; additional restrictions are stated in the contract.

**Prerequisites.** [HN sign and semicontinuity](#hn-sign-and-semicontinuity); [Local constancy of bundle Kottwitz invariant](#semicontinuity-and-local-constancy); [Full bundle automorphism v-group](#full-automorphism-v-group); [Classification of HN-graded bundles](#hn-graded-classification); [VectorBundlesAndIsocrystals:VB4/relative-HN-filtration-and-proetale-splitting](../../../content/campaign/VectorBundlesAndIsocrystals/README.md); [VectorBundlesAndIsocrystals:VB3:general-BC/families-of-banach-colmez-spaces](../../../content/campaign/VectorBundlesAndIsocrystals/README.md); [DiamondsAndVStacks:D3](../../../content/campaign/DiamondsAndVStacks/README.md).

**Proof/construction.** (1) Constant HN type gives a relative filtered tensor functor. (2) Use the graded classification to trivialize its graded Isom torsor locally. (3) Positive filtered H^1 vanishing lifts a graded isomorphism to a filtered one. (4) Thus *→Bun_G^b is a v-surjection whose relation is exactly tildeJ_b.

**Acceptance.** A positive-dimensional stabilizer changes both the stratum geometry and its dimension.

**Sources.** [Geometrization of the local Langlands correspondence](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), PropositionIII.5.3 p.106. The cited passage supplies the stated contract; qualifications and source corrections are retained in the node.

**Lean formulation.** full-signature-omitted; The suggested file contains a name-by-name register. A registered omission is not an elaborated theorem or a definition; the numerical tests and point stabilizer equations are expressly restricted cores. Full carrier obligations: G08.

**Atlas planet:** Newton stratum classifying stack.

<a id="automorphism-torsor-reduction"></a>

### Reduction of full automorphism torsors

**Lemma: TauCeti.BunG.AutomorphismTorsorReduction.** Over affinoid perfectoid S, every tildeJ_b-torsor is induced from a J_b(E)-torsor and is representable in locally spatial diamonds; the reduction follows from H^1_v vanishing for the positive Banach–Colmez graded pieces. This is an existence of reduction, not a canonical equivalence of all torsor groupoids.

**Hypotheses.** Global conventions in the reader apply; additional restrictions are stated in the contract.

**Prerequisites.** [Full bundle automorphism v-group](#full-automorphism-v-group); [VectorBundlesAndIsocrystals:VB3:general-BC/families-of-banach-colmez-spaces](../../../content/campaign/VectorBundlesAndIsocrystals/README.md); [Pro-étale torsors on strictly disconnected bases](#strictly-disconnected-torsors); [DiamondsAndVStacks:D3](../../../content/campaign/DiamondsAndVStacks/README.md); [VectorBundlesAndIsocrystals:VB4/slope-zero-local-systems](../../../content/campaign/VectorBundlesAndIsocrystals/README.md).

**Proof/construction.** (1) Reduce successive positive extensions using affinoid v-H^1 vanishing. (2) Apply perfectoid representability of locally profinite torsors.

**Acceptance.** Different reductions can have positive-kernel automorphisms; do not collapse them.

**Sources.** [Geometrization of the local Langlands correspondence](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), RemarkIII.5.4 p.106. The cited passage supplies the stated contract; qualifications and source corrections are retained in the node.

**Lean formulation.** full-signature-omitted; The suggested file contains a name-by-name register. A registered omission is not an elaborated theorem or a definition; the numerical tests and point stabilizer equations are expressly restricted cores. Full carrier obligations: G08.

<a id="stratum-dimension"></a>

### Cohomological dimension of Newton strata

**Theorem: TauCeti.BunG.StratumDimension.** For ℓ≠p, Bun_G^b is a cohomologically smooth Artin v-stack of ℓ-dimension −<2ρ,ν_b>. The fibre over [*/J_b(E)] has the smooth cover * of relative dimension <2ρ,ν_b>; the rational-point classifying stack has dimension0.

**Hypotheses.** Global conventions in the reader apply; additional restrictions are stated in the contract.

**Prerequisites.** [Full classifying-stack description of a stratum](#stratum-is-classifying-stack); [Positive automorphism kernel geometry](#positive-automorphism-kernel); [VStackSheavesAndLisseCategories:VS0](../../../content/campaign/VStackSheavesAndLisseCategories/README.md).

**Proof/construction.** (1) Use the full kernel and its positive BC filtration to compute the dimension of the relative classifying stack. (2) Add the dimension0 of [*/J_b(E)] from VS0’s locally profinite classifying-stack theorem.

**Acceptance.** The O⊕O(1) stratum has dimension−1 despite its algebraic J_b being a torus.

**Sources.** [Geometrization of the local Langlands correspondence](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), PropositionIV.1.22 p.113. The cited passage supplies the stated contract; qualifications and source corrections are retained in the node.

**Lean formulation.** full-signature-omitted; The suggested file contains a name-by-name register. A registered omission is not an elaborated theorem or a definition; the numerical tests and point stabilizer equations are expressly restricted cores. Full carrier obligations: G08.

**Atlas planet:** Newton stratum dimension.

<a id="flag-newton-strata"></a>

### Newton strata of a minuscule flag variety

**Construction: TauCeti.BunG.FlagNewton.** For G/Q_p, minuscule μ and its reflex field E_μ, let Fℓ_(G,μ) be the adic/diamond flag variety and E(x) the modification of the trivial G-bundle at the untilt. Define Fℓ_(G,μ)^b as its fibre over Bun_G^b. The point map is independent of algebraically closed residue-field extension, is constant along rank-one generalization, and has image B(G,{μ^−1}).

**Hypotheses.** Global conventions in the reader apply; additional restrictions are stated in the contract.

**Prerequisites.** [Minuscule modification image](#minuscule-modification-image); [Full classifying-stack description of a stratum](#stratum-is-classifying-stack); [GeometricSatakeAndFusion:GS0:Schubert-smoothness/open-cell-stabilizer-and-smoothness](../../../content/campaign/GeometricSatakeAndFusion/README.md); [DiamondsAndVStacks:D4](../../../content/campaign/DiamondsAndVStacks/README.md).

**Proof/construction.** (1) Pull back the locally closed full bundle strata along the minuscule BL map. (2) Check geometric-base independence using geometric bundle classification. (3) Use the adic rank-one generalization compatibility of the modification construction.

**API.**

| Declaration | Role | Contract |
|---|---|---|
| TauCeti.BunG.FlagNewton.classAt | projection | Map a flag point to its bundle sigma class. |
| TauCeti.BunG.FlagNewton.stratum | constructor | Take the locally closed fibre over Bun_G^b. |
| TauCeti.BunG.FlagNewton.upperUnion | constructor | For b define the union over bprime≥b. |
| TauCeti.BunG.FlagNewton.acceptableImage | characterisation | The image equals B(G,{μ^−1}). |
| TauCeti.BunG.FlagNewton.baseChange | compatibility | Pullback along algebraically closed field extension preserves class and strata. |

**Discriminating unit tests.**

- **TauCeti.BunG.FlagNewton.testGL2** (computation): For split GL_2 μ=(1,0), the inverse-bound ordinary stratum has slopes0,−1 and the basic stratum slopes−1/2,−1/2.
- **TauCeti.BunG.FlagNewton.testCentral** (degenerate): A central minuscule μ gives a zero-dimensional flag variety with its single acceptable class.
- **TauCeti.BunG.FlagNewton.testSign** (non-example): Using B(G,{μ}) instead of B(G,{μ^−1}) gives the wrong κ for the same CS modification.

**Uses.** CS17 Theorem1.11: Provides locally closed strata and the basic open locus. CS24 Theorem2.7.3 and IG.3-IG.7: Provides the flag indexing used by the Igusa geometry.

**Acceptance.** The definition uses the actual flag moduli, supplied by GS0.

**Sources.** [On the generic part of the cohomology of compact unitary Shimura varieties](https://annals.math.princeton.edu/wp-content/uploads/annals-v186-n3-p01-p.pdf), Definition3.5.6 pp.689-690. The cited passage supplies the stated contract; qualifications and source corrections are retained in the node.

**Lean formulation.** full-signature-omitted; The suggested file contains a name-by-name register. A registered omission is not an elaborated theorem or a definition; the numerical tests and point stabilizer equations are expressly restricted cores. Full carrier obligations: G08.

**Atlas planet:** Flag Newton strata.

<a id="flag-strata-semicontinuity"></a>

### Closed upper flag Newton unions

**Theorem: TauCeti.BunG.FlagStrataSemicontinuity.** The flag Newton strata are locally closed and partially proper, their upper unions Fℓ^≥b are closed, and the basic stratum is open. The bundle HN polygon is upper semicontinuous under specialization, with κ fixed by μ^−1. CS17 Proposition3.5.7 prints lower semicontinuity; the retained E35 correction uses the upper-polygon and closed-upper-union convention.

**Hypotheses.** Global conventions in the reader apply; additional restrictions are stated in the contract.

**Prerequisites.** [Newton strata of a minuscule flag variety](#flag-newton-strata); [HN sign and semicontinuity](#hn-sign-and-semicontinuity); [Finiteness and the basic acceptable member](#admissible-finiteness-and-basic); [DiamondsAndVStacks:D4](../../../content/campaign/DiamondsAndVStacks/README.md).

**Proof/construction.** (1) Pull back HN semicontinuity and the constant κ bound. (2) Use the finite acceptable indexing set and representation inequalities to identify the closed upper unions. (3) Partial properness follows from the flag diamond and the fixed-class locally closed condition in the source’s adic sense.

**Acceptance.** No general dimension formula is asserted for every reductive minuscule flag datum.

**Sources.** [On the generic part of the cohomology of compact unitary Shimura varieties](https://annals.math.princeton.edu/wp-content/uploads/annals-v186-n3-p01-p.pdf), Proposition3.5.7 and Corollary3.5.9 pp.689-690. The cited passage supplies the stated contract; qualifications and source corrections are retained in the node.

**Lean formulation.** full-signature-omitted; The suggested file contains a name-by-name register. A registered omission is not an elaborated theorem or a definition; the numerical tests and point stabilizer equations are expressly restricted cores. Full carrier obligations: G08.

<a id="unitary-flag-stratum-dimension"></a>

### Unitary flag Newton dimensions

**Theorem: TauCeti.BunG.UnitaryFlagStratumDimension.** For the CS24 Section2.1 quasi-split unitary similitude datum on F^(2n) with its standard skew-hermitian form, self-dual O_F-lattice and signatures(n,n), at p unramified in F, let d=n²[F+:Q]. Its flag strata have Krull dimension d−d_b, where d_b=<2ρ,ν_b> is IG.0’s dimension of the corresponding Igusa variety. This is the specific unitary dimension statement of Theorem2.7.3, not a general dimension formula deduced solely from upper semicontinuity.

**Hypotheses.** Global conventions in the reader apply; additional restrictions are stated in the contract.

**Prerequisites.** [Closed upper flag Newton unions](#flag-strata-semicontinuity); [Cohomological dimension of Newton strata](#stratum-dimension); [IgusaVarietiesAndTorsionConcentration:IG.0](../../../content/campaign/IgusaVarietiesAndTorsionConcentration/README.md); [GeometricSatakeAndFusion:GS0:Schubert-smoothness/open-cell-stabilizer-and-smoothness](../../../content/campaign/GeometricSatakeAndFusion/README.md).

**Proof/construction.** (1) Identify the PEL p-divisible-group Newton index with the BL bundle index, retaining μ inverse. (2) Import the unitary local deformation and Igusa dimension calculation from IG.0. (3) Apply the CS17/CS24 local period-fibre calculation to transfer the codimension to the flag stratum; the general relative-dimension-to-Krull comparison requires the stated datum and remains a proof-interior expansion.

**Acceptance.** The dimensions concern |Fℓ^b|, not the negative ℓ-dimension of Bun_G^b.

**Sources.** [On the generic part of the cohomology of non-compact unitary Shimura varieties](https://arxiv.org/pdf/1909.01898v2), Section2.1 pp.11-12 and Theorem2.7.3 p.33. The cited passage supplies the stated contract; qualifications and source corrections are retained in the node.

**Lean formulation.** full-signature-omitted; The suggested file contains a name-by-name register. A registered omission is not an elaborated theorem or a definition; the numerical tests and point stabilizer equations are expressly restricted cores. Full carrier obligations: G08.

<a id="unitary-ordinary-flag-locus"></a>

### Unitary ordinary flag locus

**Theorem: TauCeti.BunG.UnitaryOrdinaryFlagLocus.** In the preceding unramified quasi-split CS24 unitary similitude datum, the reflex field is Q and the largest acceptable element is ordinary. Its flag stratum is Fℓ(Q_p), interpreted as the constant locally profinite rational-point diamond; hence its Krull dimension is0. The read original arguments identify the split/unramified cocharacter calculation and ambient Siegel rational-period criterion. Transport to this unramified unitary datum remains the exact PEL comparison in G07; the read CGH preprint assumes p splits completely.

**Hypotheses.** Global conventions in the reader apply; additional restrictions are stated in the contract.

**Prerequisites.** [Unitary flag Newton dimensions](#unitary-flag-stratum-dimension); [Ordinary Newton class](#ordinary-class); [IgusaVarietiesAndTorsionConcentration:IG.0](../../../content/campaign/IgusaVarietiesAndTorsionConcentration/README.md); [ReductiveGroupsPartII:RG2.3](https://github.com/TauCetiProject/TauCetiRoadmap/blob/201bcaee1f4014c91897d50cdb7631fc6d6a6d71/TauCetiRoadmap/ReductiveGroupsPartII/README.md); [DiamondsAndVStacks:D4](../../../content/campaign/DiamondsAndVStacks/README.md).

**Proof/construction.** (1) Use the rational reflex cocharacter and BG1’s ordinary-class theorem. Wed99 Theorem1.6.3 pp.584–585 and §§2.3.1–2.3.2 pp.588–589 compute the split and unramified unitary averages; in the balanced inert unitary case the signature is half the height, so the average has only ordinary slopes. The full Shimura density theorem is not needed to identify the maximum B-class. (2) In the ambient Siegel datum, Sch15 Lemma3.3.6 and Remark3.3.7 pp.1006–1007 identify rank-one ordinary points by Q_p-rational Hodge–Tate filtration: the kernel of the integral Hodge–Tate map is the Tate module of the maximal multiplicative subgroup, so rationality forces its maximal possible rank. Specializations and the neighborhood argument of Lemmas3.3.15/3.3.19 pass to arbitrary adic points. (3) CGH20 arXiv v2 Proposition3.3.2 p.31 restricts this criterion through the closed PEL flag immersion into the Siegel flag and the corresponding forgetful moduli map. This is the actual locator in the read version; the Proposition3.3.8 cited by CS24 is not used as an unread proof. Verify the same local closed-flag and Hodge–Tate compatibility for the CS24 unramified unitary datum through IG.0. Do not import CGH20’s globally split-p hypothesis as a theorem for all unramified p. (4) Identify the sub-v-sheaf, not only its C-valued points, with the locally profinite rational-point diamond Fℓ(Q_p). D4 then gives Krull dimension0. The datum-specific comparison and full diamond signature remain G07/G08.

**Acceptance.** The corresponding basic flag stratum is the open one; ordinary is the maximum index, not the basic index.

**Sources.** [On the generic part of the cohomology of non-compact unitary Shimura varieties](https://arxiv.org/pdf/1909.01898v2), AfterTheorem2.7.3 p.33. The cited passage supplies the stated contract; qualifications and source corrections are retained in the node. [Ordinariness in good reductions of Shimura varieties of PEL-type](https://www.numdam.org/article/ASENS_1999_4_32_5_575_0.pdf), Theorem1.6.3 pp.584–585; §§2.3.1–2.3.2 pp.588–589. Ordinary/reflex-field criterion and the explicit split/balanced unramified unitary cocharacter calculation; no new expansion of the global density proof. [Shimura varieties at level Gamma_1(p^infinity) and Galois representations](https://arxiv.org/pdf/1804.00136v2), arXiv1804.00136v2 Proposition3.3.2 pp.30–31. Ordinary Hodge–Tate preimage via the closed PEL/Siegel flag comparison. The source assumes completely split p; the broader unramified transport is explicitly separate. [On torsion in the cohomology of locally symmetric varieties](https://annals.math.princeton.edu/wp-content/uploads/annals-v182-n3-p03-p.pdf), Lemma3.3.6 and Remark3.3.7 pp.1006–1007; Lemmas3.3.15/3.3.19 pp.1011/1013. Ambient Siegel ordinary/rational Hodge–Tate criterion, including the direct multiplicative-subgroup argument and the extension to non-rank-one adic points.

**Lean formulation.** full-signature-omitted; The suggested file contains a name-by-name register. A registered omission is not an elaborated theorem or a definition; the numerical tests and point stabilizer equations are expressly restricted cores. Full carrier obligations: G08.

## BG4 — Local charts and specialization geometry

A chart parametrizes the opposite filtered extensions of E_b. Prove its map to the graded classifying stack, identify the split section and spatial complement, and use the central Newton action for properness. The Jacobian criterion and tangent positivity identify its smooth open image as the lower Newton locus.

<a id="filtered-bundle-chart"></a>

### Opposite filtered-bundle chart

**Construction: TauCeti.BunG.FilteredChart.** M(S) consists of G-bundles E on X_S with an increasing, separated and exhaustive Q-filtration on every rational representation, exact and tensor-compatible, whose weight-λ graded piece is semistable of bundle slope λ. This is opposite to the decreasing HN filtration. The associated graded map to Bun_G^(HN-split) decomposes M=∐_b M_b and gives q_b:M_b→[*/J_b(E)] and π_b:M_b→Bun_G.

**Hypotheses.** Global conventions in the reader apply; additional restrictions are stated in the contract.

**Prerequisites.** [Moduli v-stack Bun_G](#bun-g-as-v-stack); [Classification of HN-graded bundles](#hn-graded-classification); [VectorBundlesAndIsocrystals:VB4/relative-HN-filtration-and-proetale-splitting](../../../content/campaign/VectorBundlesAndIsocrystals/README.md); [DiamondsAndVStacks:D3](../../../content/campaign/DiamondsAndVStacks/README.md).

**Proof/construction.** (1) Form filtered tensor objects with coherent pullback; v-descent follows from bundle/filtration descent. (2) Take the semistable graded condition and use the graded classification to define the components.

**API.**

| Declaration | Role | Contract |
|---|---|---|
| TauCeti.BunG.FilteredChart.graded | functoriality | q_b records the graded J_b(E)-torsor. |
| TauCeti.BunG.FilteredChart.forget | functoriality | π_b forgets the filtration. |
| TauCeti.BunG.FilteredChart.split | constructor | A graded object gives the split filtered chart section. |
| TauCeti.BunG.FilteredChart.pullback | functoriality | Pullback preserves filtration subbundles, exactness and graded slopes. |
| TauCeti.BunG.FilteredChart.gradedFraming | constructor | tildeM_b=M_b×_[*/J_b(E)]* is the chart with a graded trivialization. |

**Discriminating unit tests.**

- **TauCeti.BunG.FilteredChart.testGL2Extension** (computation): For graded O and O(1), objects are 0→O→E→O(1)→0 and the framed chart is BC(O(−1)[1]).
- **TauCeti.BunG.FilteredChart.testBasic** (degenerate): For basic b there is one slope and M_b=[*/J_b(E)].
- **TauCeti.BunG.FilteredChart.testOpposite** (non-example): The HN filtration of O⊕O(1) begins with O(1); the chart extension filtration begins with O.

**Uses.** FS V.3.5: Graded framing exposes the negative BC tower. FS V.3.7: Forgetting the filtration yields smooth specialization neighborhoods.

**Acceptance.** The GL_n graded slopes increase with filtration index.

**Sources.** [Geometrization of the local Langlands correspondence](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), DefinitionV.3.2 and ExampleV.3.3 pp.173-174. The cited passage supplies the stated contract; qualifications and source corrections are retained in the node.

**Lean formulation.** full-signature-omitted; The suggested file contains a name-by-name register. A registered omission is not an elaborated theorem or a definition; the numerical tests and point stabilizer equations are expressly restricted cores. Full carrier obligations: G08.

**Atlas planet:** Filtered bundle chart.

<a id="quasi-split-parabolic-chart"></a>

### Quasi-split parabolic chart

**Comparison: TauCeti.BunG.QuasiSplitParabolicChart.** For quasi-split G and a rational dominant Newton representative, let M_b=Z_G(ν_b) and P_b be its parabolic with nonnegative ν_b weights. Then M_b(chart)=Bun_(P_b)×_(Bun_(M_b))Bun_(M_b)^(b_M), with the Levi basic summand identified as [*/J_b(E)]. Use the source’s positive Newton parabolic; it is opposite to the curve-HN automorphism parabolic.

**Hypotheses.** Global conventions in the reader apply; additional restrictions are stated in the contract.

**Prerequisites.** [Opposite filtered-bundle chart](#filtered-bundle-chart); [Rational Newton representative](#rational-newton-witness); [Semistable locus and basic strata](#semistable-locus-and-basic-strata); [ReductiveGroups#layer-7-structure-theory](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ReductiveGroups/README.md#layer-7-structure-theory).

**Proof/construction.** (1) A filtered fibre functor of the fixed type is the corresponding P_b reduction. (2) The graded semistable condition is precisely the basic Levi bundle condition. (3) Transport the diagram through the rational cocharacter filtration dictionary.

**Acceptance.** For a nonsplit inner form this particular rational parabolic presentation is not asserted.

**Sources.** [Geometrization of the local Langlands correspondence](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), ExampleV.3.4 p.174. The cited passage supplies the stated contract; qualifications and source corrections are retained in the node.

**Lean formulation.** full-signature-omitted; The suggested file contains a name-by-name register. A registered omission is not an elaborated theorem or a definition; the numerical tests and point stabilizer equations are expressly restricted cores. Full carrier obligations: G08.

<a id="chart-over-classifying-stack"></a>

### Negative Banach–Colmez tower of a chart

**Theorem: TauCeti.BunG.ChartOverClassifyingStack.** q_b:M_b→[*/J_b(E)] is partially proper, representable in locally spatial diamonds, and ℓ-cohomologically smooth of relative dimension <2ρ,ν_b> for ℓ≠p. After graded framing it is a successive torsor under negative Banach–Colmez v-sheaves, namely H^1 of the negative curve-slope pieces of the opposite unipotent group. The framed v-sheaf itself is not an absolute diamond; its punctured complement is locally spatial, and the representability assertion is relative.

**Hypotheses.** Global conventions in the reader apply; additional restrictions are stated in the contract.

**Prerequisites.** [Opposite filtered-bundle chart](#filtered-bundle-chart); [Filtered torsor automorphism group schemes](#filtered-automorphism-group-scheme); [VectorBundlesAndIsocrystals:VB3:general-BC/families-of-banach-colmez-spaces](../../../content/campaign/VectorBundlesAndIsocrystals/README.md); [VStackSheavesAndLisseCategories:VS0](../../../content/campaign/VStackSheavesAndLisseCategories/README.md).

**Proof/construction.** (1) The framed chart is the H^<0 torsor moduli on the curve. (2) Filter H^<0 by its negative vector-bundle quotients, giving the H^1 extension tower. (3) Use the relative BC supplier’s partial properness, representability and smoothness; add dimensions.

**Acceptance.** Absolute tildeM_b need not be a diamond even though tildeM_b→* is representable in locally spatial diamonds.

**Sources.** [Geometrization of the local Langlands correspondence](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), PropositionV.3.5 p.174. The cited passage supplies the stated contract; qualifications and source corrections are retained in the node.

**Lean formulation.** full-signature-omitted; The suggested file contains a name-by-name register. A registered omission is not an elaborated theorem or a definition; the numerical tests and point stabilizer equations are expressly restricted cores. Full carrier obligations: G08.

**Atlas planet:** Negative Banach–Colmez chart.

<a id="section-and-spatial-complement"></a>

### Split section and spatial chart complement

**Theorem: TauCeti.BunG.SectionAndSpatialComplement.** The split section [*/J_b(E)]→M_b is closed and is exactly the locus whose underlying bundle is geometrically E_b. Its framed preimage is the origin. The open complement tildeM_b°=tildeM_b minus {origin} is a spatial diamond. The unsplit extensions satisfy [bprime]≤[b] and can be strictly smaller.

**Hypotheses.** Global conventions in the reader apply; additional restrictions are stated in the contract.

**Prerequisites.** [Negative Banach–Colmez tower of a chart](#chart-over-classifying-stack); [Classification of HN-graded bundles](#hn-graded-classification); [HN sign and semicontinuity](#hn-sign-and-semicontinuity); [VectorBundlesAndIsocrystals:VB3:projectivized-properness/properness-of-projectivized-BC](../../../content/campaign/VectorBundlesAndIsocrystals/README.md); [VectorBundlesAndIsocrystals:VB4/relative-HN-filtration-and-proetale-splitting](../../../content/campaign/VectorBundlesAndIsocrystals/README.md); [VectorBundlesAndIsocrystals:VB3:general-BC/families-of-banach-colmez-spaces](../../../content/campaign/VectorBundlesAndIsocrystals/README.md); [DiamondsAndVStacks:D5/relative-representability](../../../content/campaign/DiamondsAndVStacks/README.md).

**Proof/construction.** (1) An extension is Newton-bounded by its split graded object, so the equal-class locus is closed. (2) There the opposite filtration and HN filtration are transverse, giving a graded splitting. (3) At the first nonzero extension step, the punctured negative BC space is an absolute diamond; combine the finite tower and the properness argument to get spatiality.

**Acceptance.** For the GL_2 example, the origin gives O⊕O(1); nonzero extension gives the rank2 O(1/2) block.

**Sources.** [Geometrization of the local Langlands correspondence](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), PropositionV.3.6 pp.175-176. The cited passage supplies the stated contract; qualifications and source corrections are retained in the node.

**Lean formulation.** full-signature-omitted; The suggested file contains a name-by-name register. A registered omission is not an elaborated theorem or a definition; the numerical tests and point stabilizer equations are expressly restricted cores. Full carrier obligations: G08.

**Atlas planet:** Spatial chart complement.

<a id="contracting-chart-action"></a>

### Contracting chart action and proper quotient

**Theorem: TauCeti.BunG.ContractingChartAction.** For sufficiently divisible N>0, the central Newton morphism in J_b gives U_π=ν_(b,J)^N(π)∈J_b(E). It contracts the framed extension tower to the origin. On tildeM_b° the Z-action has the source’s escaping property and tildeM_b°/U_π^Z→* is proper. This is ordinary properness, not merely partial properness.

**Hypotheses.** Global conventions in the reader apply; additional restrictions are stated in the contract.

**Prerequisites.** [Split section and spatial chart complement](#section-and-spatial-complement); [Decent representative](#decent-representative); [Central Newton morphism of the centralizer](#central-newton-on-J); [VectorBundlesAndIsocrystals:VB3:projectivized-properness/properness-of-projectivized-BC](../../../content/campaign/VectorBundlesAndIsocrystals/README.md); [VectorBundlesAndIsocrystals:VB4](../../../content/campaign/VectorBundlesAndIsocrystals/README.md); [DiamondsAndVStacks:D4](../../../content/campaign/DiamondsAndVStacks/README.md); [VectorBundlesAndIsocrystals:VB3:general-BC/families-of-banach-colmez-spaces](../../../content/campaign/VectorBundlesAndIsocrystals/README.md).

**Proof/construction.** (1) Choose a finite descent coefficient field and an integral Newton multiple. (2) At the first nonzero negative extension piece, U_π acts by a positive power of π; negative iterations escape each quasicompact open. (3) Apply the contraction/fixed-point lemma from the VB4 supplier and projectivized BC properness to the tower.

**Acceptance.** The quotient is proper only after removal of the fixed origin.

**Sources.** [Geometrization of the local Langlands correspondence](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), PropositionV.3.6 pp.175-176. The cited passage supplies the stated contract; qualifications and source corrections are retained in the node.

**Lean formulation.** full-signature-omitted; The suggested file contains a name-by-name register. A registered omission is not an elaborated theorem or a definition; the numerical tests and point stabilizer equations are expressly restricted cores. Full carrier obligations: G08.

<a id="chart-jacobian-positivity"></a>

### Positive tangent criterion for the filtered chart

**Lemma: TauCeti.BunG.ChartJacobianPositivity.** After S→Bun_G corresponds to E, the fibre M×_(Bun_G)S is the open subfunctor of sections of E×^GFl→X_S having semistable graded pieces of their specified slopes. Fl is the disjoint union of projective filtration varieties. Along these sections its tangent bundle has a finite filtration with semistable positive-slope quotients, so the section lies in VS1’s cohomologically smooth locus.

**Hypotheses.** Global conventions in the reader apply; additional restrictions are stated in the contract.

**Prerequisites.** [Opposite filtered-bundle chart](#filtered-bundle-chart); [Semistable locus and basic strata](#semistable-locus-and-basic-strata); [ReductiveGroups#layer-7-structure-theory](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ReductiveGroups/README.md#layer-7-structure-theory); [ReductiveGroups#layer-1-representations--comodules](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ReductiveGroups/README.md#layer-1-representations--comodules); [VStackSheavesAndLisseCategories:VS1/jacobian-criterion](../../../content/campaign/VStackSheavesAndLisseCategories/README.md); [VectorBundlesAndIsocrystals:VB4/relative-HN-filtration-and-proetale-splitting](../../../content/campaign/VectorBundlesAndIsocrystals/README.md).

**Proof/construction.** (1) Work componentwise on the projective filtration varieties. Their associated flag bundles admit the projective embeddings required by VS1; verify this hypothesis before applying its section criterion. (2) Identify rational tensor filtrations with sections of the flag scheme. (3) Use semistable openness on each graded piece. (4) Calculate tangent root weights and convert to positive bundle slopes. (5) Apply the actual Jacobian section-space theorem, including its smooth quasi-projective curve scheme hypotheses.

**Acceptance.** Tangent positivity is the reason the late chart theorem uses VS1.

**Sources.** [Geometrization of the local Langlands correspondence](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), Proof ofTheoremV.3.7 p.177. The cited passage supplies the stated contract; qualifications and source corrections are retained in the node.

**Lean formulation.** full-signature-omitted; The suggested file contains a name-by-name register. A registered omission is not an elaborated theorem or a definition; the numerical tests and point stabilizer equations are expressly restricted cores. Full carrier obligations: G08.

<a id="chart-to-bun-g"></a>

### Smooth specialization neighborhoods

**Theorem: TauCeti.BunG.ChartToBunG.** π_b:M_b→Bun_G is separated, partially proper, representable in locally spatial diamonds and ℓ-cohomologically smooth of relative dimension <2ρ,ν_b>. Its open image is exactly the points whose corresponding bundles specialize to E_b; in the fixed-κ order this is {[bprime]:[bprime]≤[b]}. The charts cover Bun_G, since every b lies in its own chart image.

**Hypotheses.** Global conventions in the reader apply; additional restrictions are stated in the contract.

**Prerequisites.** [Positive tangent criterion for the filtered chart](#chart-jacobian-positivity); [Negative Banach–Colmez tower of a chart](#chart-over-classifying-stack); [Contracting chart action and proper quotient](#contracting-chart-action); [Cohomological smoothness of Bun_G](#bun-g-is-smooth-artin); [VStackSheavesAndLisseCategories:VS1/jacobian-criterion](../../../content/campaign/VStackSheavesAndLisseCategories/README.md); [VStackSheavesAndLisseCategories:VS0](../../../content/campaign/VStackSheavesAndLisseCategories/README.md); [DiamondsAndVStacks:D5/relative-representability](../../../content/campaign/DiamondsAndVStacks/README.md).

**Proof/construction.** (1) Apply the section-space Jacobian criterion for representability, partial properness, separatedness and smoothness. (2) Subtract dim Bun_G=0 from dim M_b to compute relative dimension. (3) The split section contains the b-stratum; openness of the image includes every generalization of b. (4) The contracting action degenerates every chart point to the split section, proving the reverse inclusion.

**Acceptance.** For κ=1 in GL_2, the chart of slopes1,0 contains its basic generalization1/2,1/2.

**Sources.** [Geometrization of the local Langlands correspondence](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), TheoremV.3.7 p.177. The cited passage supplies the stated contract; qualifications and source corrections are retained in the node.

**Lean formulation.** full-signature-omitted; The suggested file contains a name-by-name register. A registered omission is not an elaborated theorem or a definition; the numerical tests and point stabilizer equations are expressly restricted cores. Full carrier obligations: G08.

**Atlas planet:** Smooth specialization chart.

<a id="gl2-extension-chart"></a>

### Rank-two extension chart

**Application: TauCeti.BunG.Gl2ExtensionChart.** For graded bundle O⊕O(1), tildeM_b=BC(O(−1)[1]) parametrizes framed extensions 0→O→E→O(1)→0. E is either split or the simple rank2 slope1/2 bundle. The fibres of π_b are open subspaces of (BC(E) minus {0})/E× of nowhere-vanishing sections giving the prescribed quotient.

**Hypotheses.** Global conventions in the reader apply; additional restrictions are stated in the contract.

**Prerequisites.** [Smooth specialization neighborhoods](#chart-to-bun-g); [VectorBundlesAndIsocrystals:VB3:general-BC/families-of-banach-colmez-spaces](../../../content/campaign/VectorBundlesAndIsocrystals/README.md); [VectorBundlesAndIsocrystals:VB3:projectivized-properness/properness-of-projectivized-BC](../../../content/campaign/VectorBundlesAndIsocrystals/README.md); [VectorBundlesAndIsocrystals:VB2:classification](../../../content/campaign/VectorBundlesAndIsocrystals/README.md); [VectorBundlesAndIsocrystals:VB4](../../../content/campaign/VectorBundlesAndIsocrystals/README.md).

**Proof/construction.** (1) Identify Ext^1 with the negative BC H^1 of O(−1). (2) Use the rank2 bundle classification and determinant degree1. (3) Describe a filtration by a nowhere-vanishing section, and import the saturated-section open condition.

**Acceptance.** The split point has full positive automorphism kernel; the framed chart extension direction has negative slope.

**Sources.** [Geometrization of the local Langlands correspondence](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), ExampleV.3.1 p.173. The cited passage supplies the stated contract; qualifications and source corrections are retained in the node.

**Lean formulation.** full-signature-omitted; The suggested file contains a name-by-name register. A registered omission is not an elaborated theorem or a definition; the numerical tests and point stabilizer equations are expressly restricted cores. Full carrier obligations: G08.

## Exact supplier contracts

Every request below imports an existing target or asks its owner for a precise extension. API consequences retain their later prerequisites without making the underlying definition cyclic.

### R01 — AlgebraicModuliForArithmeticGeometry:R09.3

Use the existing étale/fpqc descent of affine morphisms, torsors and locally free modules. Do not infer the relative filtered reductive-group representability theorem from algebraic-space descent alone; its missing foundation is G02. For families, the specific coefficient-ring arc-descent is Ans22 Lemma11.3: reconstruct torsors from exact tensor functors and reflect exactness using Iva23 Corollary5.6, not an assumed faithfully flat coefficient-ring map.

**Consumers:** [Tannakian description of analytic torsors](#g-torsors-three-descriptions); [Structure group and tensor descent](#structure-group-and-tensor-descent); [Algebraic sigma-centralizer](#sigma-centralizer-J-b); [Pure inner twisting of torsors](#pure-inner-twisting); [Families of G-isocrystals](#families-of-g-isocrystals); [Isocrystal-family v-descent and strata](#isocrystal-family-v-descent); [Finite Frobenius norm centralizer](#finite-frobenius-norm-centralizer).

### R02 — DiamondEtaleCohomology:C1

Use proper base change under the prime-to-p finite-coefficient hypotheses, including Scholze Corollary16.10(ii), not the j! exchange result of C5. The extra p-torsion tilting/Artin–Schreier computation needed for FS III.2.12(i) is G05.

**Consumers:** [Constant torsion cohomology on the curve](#curve-torsion-cohomology).

### R03 — DiamondsAndVStacks:D2

Use D2 only for pro-étale/v sites. Analytic-adic/diamond étale comparison is the separately read D6/etale-site-comparison; strictly totally disconnected covers and geometric lifting come from D1. The curve/Div^1 comparison remains the RF2/G05 refinement. D6’s read analytic comparison assumes a Z_p base; the equal-characteristic counterpart remains G05. The family descent route also uses the perfect-scheme v-site and normal valuation-ring covers; Iva23 Lemma5.9 gives the stronger perfectoid arc-descent input. Do not identify this site with the perfectoid base of Bun_G.

**Consumers:** [Curve-to-base étale site morphism](#curve-etale-base-site); [Pro-étale torsors on strictly disconnected bases](#strictly-disconnected-torsors); [Grassmannian point lifting](#grassmannian-point-lifting); [Isocrystal family v-descent and strata](#isocrystal-family-v-descent).

### R04 — DiamondsAndVStacks:D3

Use D3/locally-profinite-torsors and the actual effective-descent results. Small v-stacks come from D4, groupoid stack quotients from D0. SW18.3.1 clopen comparison is a requested refinement, not supplied by a valuation/support commuting map.

**Consumers:** [Pure inner twisting of torsors](#pure-inner-twisting); [Families of G-isocrystals](#families-of-g-isocrystals); [Isocrystal-family v-descent and strata](#isocrystal-family-v-descent); [Kottwitz invariant in isocrystal families](#family-kottwitz-local-constancy); [Curve-to-base étale site morphism](#curve-etale-base-site); [Moduli v-stack Bun_G](#bun-g-as-v-stack); [Smallness of Bun_G](#bun-g-smallness); [Pro-étale torsors on strictly disconnected bases](#strictly-disconnected-torsors); [Geometrically trivial open locus](#geometrically-trivial-locus); [Central-torus bundle surjectivity](#central-torus-bundle-surjectivity); [Torus bundle Picard stack](#torus-picard-stack); [Full classifying-stack description of a stratum](#stratum-is-classifying-stack); [Reduction of full automorphism torsors](#automorphism-torsor-reduction); [Opposite filtered-bundle chart](#filtered-bundle-chart).

### R05 — DiamondsAndVStacks:D4

Use D4 for diamonds, small v-stacks, underlying spaces and open substacks. D5 supplies spatiality and relative representability; D6 supplies analytic étale comparison. The escaping-Z-action and ordinary/partial properness criteria used by BG4 are requested refinements (G12), not conclusions of D4 alone.

**Consumers:** [Locally spatial Isom diagonal](#isom-sheaf-representability); [Contracting chart action and proper quotient](#contracting-chart-action); [Newton strata of a minuscule flag variety](#flag-newton-strata); [Closed upper flag Newton unions](#flag-strata-semicontinuity); [Unitary ordinary flag locus](#unitary-ordinary-flag-locus).

### R06 — EndoscopicTransferAndUnitaryTraceComparison:ET.0

Use local reductive Galois/Weil cohomology, crossed modules [Gsc→G], quasi-isomorphisms with [Tsc→T] and [Zsc→Z], abelianization and simply connected local H^1 vanishing. Request the degree-two Weil torus vanishing and point-to-curve comparison compatibility in G03. Generic z-extensions come from existing upstream RG2.1.5; induced-torus resolution refinements remain G01; do not construct a second B(G), κ, ν, J_b or acceptable-class theory. Export the identification H^1(E,H)≅(π_1(H)_Γ)_tors for connected reductive local H, using the BG1 Kottwitz invariant, rather than a second invariant definition. Coefficients in the FS Weil complexes are G(L^sep), T(L^sep), etc., with the natural continuous W_E-action on discrete groups, not only L-rational points.

**Consumers:** [Specialness for a transferred centralizer torus](#transferred-torus-specialness); [Abelianized Kottwitz set](#abelianized-kottwitz-set); [Abelianized classes equal fundamental coinvariants](#abelianization-identification); [Diagonalizable Weil–curve comparison](#diagonalizable-curve-cohomology); [Constant crossed-module curve classes](#crossed-module-curve-classes); [Rational-point Kottwitz surjectivity](#rational-kottwitz-surjectivity); [Basic classes and adjoint torsors with connected center](#connected-center-basic-inner-forms).

### R07 — GeometricSatakeAndFusion:GS0:Schubert-smoothness/open-cell-stabilizer-and-smoothness

Use the read open-cell stabilizer/congruence quotient theorem for all dominant μ, hence cohomological smoothness of open Schubert cells. For minuscule μ deduce the flag quotient by P_μ^− from the congruence description; retain finite splitting-field descent for nonsplit G. Schubert closures need not be smooth.

**Consumers:** [Central-torus Grassmannian surjectivity](#central-torus-grassmannian-surjectivity); [Cohomological smoothness of Bun_G](#bun-g-is-smooth-artin); [Minuscule modification image](#minuscule-modification-image); [Newton strata of a minuscule flag variety](#flag-newton-strata); [Unitary flag Newton dimensions](#unitary-flag-stratum-dimension).

### R08 — GeometricSatakeAndFusion:GS0:loop-geometry/schubert-bounds-and-properness

Import the current general-E Schubert exhaustion and properness contract, including its Galois-stable nonsplit bounds. It does not state the exact Grassmannian π_1 connected-component identification or its torus lattice representatives. Request that separate component refinement from GS0, with the appropriate inertia/Galois coinvariants and nonsplit descent, supported by Zhu Proposition1.21 and FS III.3.6; BG2 proves the sign under BL. This request does not replan the existing Schubert bounds.

**Consumers:** [Grassmannian point lifting](#grassmannian-point-lifting); [Central-torus Grassmannian surjectivity](#central-torus-grassmannian-surjectivity); [Grassmannian components and Kottwitz sign](#grassmannian-kottwitz-sign); [Newton bound for a modification](#modification-newton-bound).

### R09 — IgusaVarietiesAndTorsionConcentration:IG.0

Use its unitary PEL signatures, integral model and comparison of the local B-class with the p-divisible-group Newton stratum of dimension d_b=<2ρ,ν_b>. BG3 constructs the flag Newton strata and proves their dimension d−d_b for precisely this unitary datum. IG.0 imports BG0/BG1 general B(G), κ, ν, J_b and acceptable classes; avoid an edge back from BG1 to PEL geometry. Export the local Hodge–Tate compatibility of the unitary-to-Siegel forgetful map and closed flag immersion at every unramified p in this datum. The read CGH20 v2 Proposition3.3.2 proves its comparison under completely split p; BG cannot silently widen that hypothesis. Sch15 Lemma3.3.6/Remark3.3.7 supplies the ambient ordinary/rational-period criterion.

**Consumers:** [Unitary flag Newton dimensions](#unitary-flag-stratum-dimension); [Unitary ordinary flag locus](#unitary-ordinary-flag-locus).

### R10 — ReductiveGroupsPartII:RG2.1

Import current upstream RG2.1 local/absolute root data, split ranks, integral π_1, Galois/coinvariant maps, z-extensions and representative Kottwitz homomorphisms. Existing targets suffice for those contracts; they are not new work. Remaining refinements: canonical comparison between maximal-torus choices and inner twists (the actual Suggested.lean uses a fixed AbsoluteRootData), unramified-replacement averaging/triality equality for KMPS Proposition1.1.10, and the torsion-free Levi coinvariant kernel used by its minuscule lifting proof. Preserve the covariant inverse-transpose action on cocharacters. The simple integral Levi-kernel formula is already supplied; its coinvariant exactness refinement remains G10. Also export the local-field Frobenius-equivariance equation for the existing representative Kottwitz homomorphism, and its compatibility with the actual integral inertia/Frobenius quotient. Current upstream main states σ-equivariance in prose but explicitly has no Lean target for it; it is the named input to BG’s typed descent, not a request to rebuild κ̃.

**Consumers:** [Newton and Kottwitz invariants](#newton-and-kottwitz-maps); [Defect of a sigma class](#defect); [Basic Levi Newton formula](#levi-newton-formula); [Positive automorphism kernel geometry](#positive-automorphism-kernel); [Newton orbit space and rational dominance](#newton-orbit-space); [Newton comparison for a Levi representative](#general-levi-newton-comparison).

### R11 — ReductiveGroupsPartII:RG2.3

Import the connected parahoric and positive-loop/fixer structures already planned by upstream RG2.3, preserving the distinction between a parahoric and G(O_L). Request only the precise integral-conjugacy/lifting refinements used by KZ Proposition2.3.3: He–Rapoport6.1(b), He16 Theorem6.1, He–Zhou4.1, He14 Theorem3.5 and Proposition4.5; their proof interiors remain G10. Extended-Weyl double-coset structure is imported from upstream RG2.4. For HK22 §2.1 and Theorem2.11, import the existing connected smooth affine O_E-model with generic fibre G from its parahoric-group-scheme target; no new integral-model theory is planned in BG.

**Consumers:** [Straight Weyl comparison with B(G)](#straight-weyl-classification); [Integral conjugacy of an ordinary admissible element](#ordinary-integral-conjugacy); [Unitary ordinary flag locus](#unitary-ordinary-flag-locus); [Isocrystal family v-descent and strata](#isocrystal-family-v-descent).

### R12 — ReductiveGroupsPartII:RG2.4

Import current upstream RG2.4 Iwahori–Weyl exact sequences, lengths/Bruhat order, admissible sets, dominant coinvariant cocharacters and Cartan/Iwasawa decompositions, keeping its apartment-translation sign separate from arithmetic κ. Request the σ-straight/twisted-Newton comparison, integral π_1 compatibility, KMPS Wintenberger realization/Satake/unramified Mazur refinements not stated there. Its unramified-combinatorial-comparison target is retained in its stated p-adic setting; request the characteristic-independent reduced-affine-datum comparison needed for the general-field maximum. Central inertia-torsion restoration at fixed κ, HN18 Lemma2.5 integrality and Chai convex-majorant inputs remain G06. BG owns only the resulting B(G,{μ}) and ordinary-class consequences.

**Consumers:** [Minuscule basic Levi lifting](#minuscule-basic-levi-lift); [Unique maximum of acceptable classes](#acceptable-unique-maximum); [Straight Weyl comparison with B(G)](#straight-weyl-classification); [Ordinary straight translation and Levi centrality](#ordinary-straight-translation); [Integral conjugacy of an ordinary admissible element](#ordinary-integral-conjugacy); [Levi fibre over a basic G-class](#basic-levi-fibre-uniqueness); [Grassmannian point lifting](#grassmannian-point-lifting); [Newton comparison for a Levi representative](#general-levi-newton-comparison).

### R13 — RelativeFarguesFontaine:RF0:annuli

Use the period-domain annular exhaustion, continuous direct limits of period rings and the punctured-period-domain input in the torsion comparison; the cohomology computation is G05.

**Consumers:** [Constant torsion cohomology on the curve](#curve-torsion-cohomology); [Smallness of Bun_G](#bun-g-smallness).

### R14 — RelativeFarguesFontaine:RF2

Use Div^1 and its projection as a diamond, with the curve/Div^1 étale-site comparison needed to construct τ. The comparison itself is recorded as a refinement in G05, not confused with a map X_S→S.

**Consumers:** [Curve-to-base étale site morphism](#curve-etale-base-site).

### R15 — RelativeFarguesFontaine:RF2:untilts

Use B_dR^+ as the complete ξ-adic local ring at the untilt divisor, the field residue quotient, henselian lifting and successive nilpotent thickenings.

**Consumers:** [Grassmannian point lifting](#grassmannian-point-lifting).

### R16 — RelativeFarguesFontaine:RF4:G-torsors/modification-of-G-bundle-by-lattice

Use the existing tensor-compatible Beauville–Laszlo lattice-to-G-bundle construction and base change. BG2 proves v-surjectivity; BG0/BG1 do not depend on this analytic construction.

**Consumers:** [Beauville–Laszlo uniformization](#beauville-laszlo-surjectivity); [Grassmannian components and Kottwitz sign](#grassmannian-kottwitz-sign); [Newton bound for a modification](#modification-newton-bound); [Class from a de Rham quotient-group lattice](#de-rham-quotient-group-class).

### R17 — VStackSheavesAndLisseCategories:VS0

Use Artin v-stack descent, representable diagonals, relative ℓ-cohomological smoothness, quotient charts for locally profinite group actions and dimension additivity. The argument for [*/G(E)] is through a smooth quotient chart, with dimensions preserved.

**Consumers:** [Positive automorphism kernel geometry](#positive-automorphism-kernel); [Cohomological dimension of Newton strata](#stratum-dimension); [Cohomological smoothness of Bun_G](#bun-g-is-smooth-artin); [Connected components of Bun_G](#connected-components); [Negative Banach–Colmez tower of a chart](#chart-over-classifying-stack); [Smooth specialization neighborhoods](#chart-to-bun-g).

### R18 — VStackSheavesAndLisseCategories:VS1/jacobian-criterion

Use the existing Jacobian criterion for sections of a smooth relative space on the curve, with strictly positive tangent-bundle HN slopes. BG4 supplies that positivity; no VS4/GS4/Satake equivalence is needed.

**Consumers:** [Positive tangent criterion for the filtered chart](#chart-jacobian-positivity); [Smooth specialization neighborhoods](#chart-to-bun-g).

### R19 — VectorBundlesAndIsocrystals:VB0

Export the finite-dimensional isocrystal tensor category over a general local coefficient field E, semilinear descent and change-of-trivialization, with rank-one π^m slope m. No reductive B(G) theory is imported from this linear stage. Export the compatible local algebraic closures, the embedding into the coefficient algebraic closure, arithmetic Frobenius and degree-r unramified fixed fields. Global-v choices of the Shimura paper are not used in the local targets. For the perfect-algebra family application, supply the effective-lattice bound and slope-zero finite étale fixed-section construction used in HK22 v5 Lemmas2.8–2.9/Proposition2.10. Its profinite étale isotriviality requires a perfect normal base; the BG v-stack application handles other perfect bases only after normal v-covers. Correct the field-level effective-over-lattice bound to depend on rank and an initial Frobenius denominator d, using the minimal stable lattice/Nakayama argument of Zin01 Lemma9 author pp.11–12. For a rank-h lattice the iterated sum is bounded by π^(−d(h−1)). A rank-two slope-zero shear with coefficient π^(−N) requires c≥N (E08); do not promise a bound from Newton slopes alone. Over families retain the proper lattice-moduli cover and prove local-freeness separately. At finite level, fixed sections are affine étale; constant slope-zero multiplicity gives finite étale, whose inverse limit is profinite étale (HK22 Lemma2.8).

**Consumers:** [Families of G-isocrystals](#families-of-g-isocrystals); [Isocrystal family v-descent and strata](#isocrystal-family-v-descent).

### R20 — VectorBundlesAndIsocrystals:VB0/dieudonne-manin-isocrystals

Use this node only for Dieudonné–Manin decomposition and slope denominator multiplicities. End_Φ(D(a,h)) and its invariant are supplied by the separate VB0/endomorphism-division-algebra and VB0/brauer-invariant-sign nodes; its invariant is −a/h in the arithmetic convention. The curve comparison is VB2:classification/bundle-endomorphism-comparison. Right modules use Hom(E_b,E).

**Consumers:** [Division-algebra Morita comparison](#division-algebra-morita); [Geometric classification of G-bundles](#points-are-B-of-G); [Quasi-split centralizer in the GL minuscule case](#gl-minuscule-quasisplit-centralizer); [Rational slope protorus](#slope-protorus); [Newton and Kottwitz invariants](#newton-and-kottwitz-maps).

### R21 — VectorBundlesAndIsocrystals:VB0/isocrystal-category-and-standard-block

Reuse VB0’s existing TauCeti.FFBundles.FiniteIsocrystal L σ and its Hom/category, tensor object and endomorphism ring. Export its E-linear preadditive, Quillen exact and rigid symmetric monoidal category structures with coherence, over the actual general local coefficient field. The object and arrow carriers are already suggested; the full structured category needed to instantiate TensorInterface is not. Retain native Witt rank-one compatibility and the standard simple slope block; BG imports these rather than replanning their linear definitions. BG now supplies the whole trivialized Frobenius tensor family and Tannakian arrow reconstruction on native rational comodules; this request still supplies the untrivialized target category and its structured comparisons, rather than duplicating that presentation.

**Consumers:** [G-isocrystals](#g-isocrystals-and-B-of-G).

### R22 — VectorBundlesAndIsocrystals:VB0/tensor-and-dual-slopes

Use tensor/dual/exactness of linear slope gradings, with Frobenius eigenvalue valuation determining the isocrystal slope.

**Consumers:** [G-isocrystals](#g-isocrystals-and-B-of-G).

### R23 — VectorBundlesAndIsocrystals:VB1

Export the actual relative analytic FF finite locally free bundle category with its E-linear Quillen exact symmetric tensor structure, pullback coherence and effective v-descent. The existing scheme CurveBundle and upstream AlgebraicVectorBundles finite-locally-free modules are inputs; neither is the analytic FF category. No analytic G-torsor patching is needed for the algebraic BG0 classification.

**Consumers:** [G-bundles as exact tensor functors](#g-bundle).

### R24 — VectorBundlesAndIsocrystals:VB1/isocrystal-to-bundle-functor

Use the exact rational tensor isocrystal-to-bundle functor and its base-change equivalences, normalized by E_(π^m)=O(−m).

**Consumers:** [Basic inner form equivalence](#basic-inner-form-bundle-equivalence); [Kottwitz invariant in isocrystal families](#family-kottwitz-local-constancy); [Moduli v-stack Bun_G](#bun-g-as-v-stack); [Geometric classification of G-bundles](#points-are-B-of-G); [HN sign and semicontinuity](#hn-sign-and-semicontinuity); [HN-graded G-bundles](#hn-graded-g-bundles); [Quasi-split opposite-parabolic automorphisms](#quasi-split-opposite-parabolic).

### R25 — VectorBundlesAndIsocrystals:VB2:ampleness/gaga-equivalence

Use the existing exact tensor GAGA equivalence on finite locally free bundles for affinoid perfectoid bases, including bundle cohomology and Isom compatibility.

**Consumers:** [Moduli v-stack Bun_G](#bun-g-as-v-stack); [Smallness of Bun_G](#bun-g-smallness).

### R26 — VectorBundlesAndIsocrystals:VB2:classification

Use geometric-point classification of vector bundles and the slope/degree normalization to establish the reductive fibre-functor classification. The Tannakian reduction, not a new linear classification, belongs to BG2.

**Consumers:** [Geometric classification of G-bundles](#points-are-B-of-G); [Rank-two extension chart](#gl2-extension-chart).

### R27 — VectorBundlesAndIsocrystals:VB3:general-BC/families-of-banach-colmez-spaces

Use the actual two-term [E1→E0] relative Banach–Colmez theorem for representability, partial properness, punctured properness and cohomological smoothness under its negative/positive hypotheses. Dimensions come separately from positive-range-dimension. Positive-kernel connectedness and passage through reductive filtered extension towers remain precise refinements G12.

**Consumers:** [Geometric classification of G-bundles](#points-are-B-of-G); [Full bundle automorphism v-group](#full-automorphism-v-group); [Positive automorphism kernel geometry](#positive-automorphism-kernel); [Full classifying-stack description of a stratum](#stratum-is-classifying-stack); [Reduction of full automorphism torsors](#automorphism-torsor-reduction); [Locally spatial Isom diagonal](#isom-sheaf-representability); [Negative Banach–Colmez tower of a chart](#chart-over-classifying-stack); [Rank-two extension chart](#gl2-extension-chart).

### R28 — VectorBundlesAndIsocrystals:VB3:projectivized-properness/properness-of-projectivized-BC

The read node gives punctured properness for H^0 section BC(E), not by itself for negative H^1 extension spaces. Use the separately read families-of-banach-colmez-spaces theorem for negative bundles placed in degree −1. Passage from these linear factors to the entire reductive extension tower and its contracting Z-quotient remains G12.

**Consumers:** [Split section and spatial chart complement](#section-and-spatial-complement); [Contracting chart action and proper quotient](#contracting-chart-action); [Rank-two extension chart](#gl2-extension-chart).

### R29 — VectorBundlesAndIsocrystals:VB4

Use positive bundle H^1 vanishing, local-system detection, and the contraction/escaping criterion for the finite extension tower of FS V.3.6. Export the linear statement; BG4 proves its reductive chart consequence.

**Consumers:** [Geometrically trivial open locus](#geometrically-trivial-locus); [Contracting chart action and proper quotient](#contracting-chart-action); [Rank-two extension chart](#gl2-extension-chart).

### R30 — VectorBundlesAndIsocrystals:VB4/relative-HN-filtration-and-proetale-splitting

Use relative-HN-filtration-and-proetale-splitting only for constant-polygon HN filtrations and local splitting. The everywhere-slope-zero local-system equivalence is the separate VB4/slope-zero-local-systems node, and local positive H^1 vanishing is VB4/relative-cohomology-vanishing, with its precise base-change and affinoid restrictions.

**Consumers:** [Geometric classification of G-bundles](#points-are-B-of-G); [HN-graded G-bundles](#hn-graded-g-bundles); [Classification of HN-graded bundles](#hn-graded-classification); [Full bundle automorphism v-group](#full-automorphism-v-group); [Full classifying-stack description of a stratum](#stratum-is-classifying-stack); [Opposite filtered-bundle chart](#filtered-bundle-chart); [Split section and spatial chart complement](#section-and-spatial-complement); [Positive tangent criterion for the filtered chart](#chart-jacobian-positivity).

### R31 — VectorBundlesAndIsocrystals:VB4/semicontinuity-of-HN-polygon

Use upper semicontinuity of relative HN polygons; G-bundle dominance is deduced by evaluation on every rational representation.

**Consumers:** [HN sign and semicontinuity](#hn-sign-and-semicontinuity).

### R32 — tauceti:TauCetiRoadmap/ReductiveGroups#layer-1-representations--comodules

Use the existing rational representation/comodule category, rigid exact tensor structure, tensor-functor torsor reconstruction and faithful-representation descent. Export the upstream definitions rather than replacing them by abstract representations of G(E). Relative analytic/scheme representability beyond the existing field category is separately recorded in gap G02. The HK22 v5 Theorem2.11 application additionally requires faithful tensor-line stabilizer reconstruction over the coefficient ring and local lifting for the actual automorphism-group orbit, preserving all tensors; a GL of the ambient Hom space is insufficient to state that lifting input. E09 records the missing implication in the read proof: local sections into GL(H) do not ensure membership in Aut(V0). Supply local continuous lifts of the actual orbit map onto its tensor-line embedding orbit, with its induced topology and any smoothness/separability hypotheses made explicit. Do not mark this input proved by the ambient GL action or by the coordinate control.

**Consumers:** [G-bundles as exact tensor functors](#g-bundle); [Structure group and tensor descent](#structure-group-and-tensor-descent); [G-isocrystals](#g-isocrystals-and-B-of-G); [Filtered torsor automorphism group schemes](#filtered-automorphism-group-scheme); [Locally spatial Isom diagonal](#isom-sheaf-representability); [Positive tangent criterion for the filtered chart](#chart-jacobian-positivity); [Rational slope protorus](#slope-protorus); [Representations detect Newton dominance](#representation-detects-dominance); [Isocrystal family v-descent and strata](#isocrystal-family-v-descent).

### R33 — tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory

Use existing Borels, maximal tori, parabolics, Levi factors and based root/Galois data. Generic pure-inner descent, elliptic torus transfer and filtered relative group-scheme representability need the extension in G02; generic z-extensions are imported from existing upstream RG2.1.5, with only the remaining G01 refinements requested. Exact routed refinements: elliptic maximal tori modulo the center; rational transfer of a maximal torus of an inner Levi and its existence for quasi-split or elliptic cases; descent of Galois-invariant parabolic classes and rational Levi factors. These additions are G02, not claimed built in the field layer. The filtered refinement is precise: represent Aut^⊗ of a filtered G-torsor over any K-scheme, its parabolic and positive raising subgroups, Lie subbundles and positive vector quotients, with base change. Zie15 Theorem1.3/4.15 supplies splitting on affine charts because the underlying reductive inner form is smooth; clear Q-weight denominators on a tensor generator before applying it. Relative rational-cocharacter representability/descent remains additional work, and global non-affine splitting is excluded.

**Consumers:** [Tannakian description of analytic torsors](#g-torsors-three-descriptions); [G-isocrystals](#g-isocrystals-and-B-of-G); [Algebraic sigma-centralizer](#sigma-centralizer-J-b); [Decent representative](#decent-representative); [Existence of decent representatives](#existence-of-decent-representative); [Division-algebra Morita comparison](#division-algebra-morita); [Basic Levi Newton formula](#levi-newton-formula); [Minuscule basic Levi lifting](#minuscule-basic-levi-lift); [Torus-special acceptable pair](#torus-special-pair); [Elliptic tori and basic acceptable classes](#elliptic-torus-basic-image); [Specialness for a transferred centralizer torus](#transferred-torus-specialness); [Ordinary straight translation and Levi centrality](#ordinary-straight-translation); [Ordinary classes under a derived isogeny](#ordinary-derived-isogeny); [Products and unramified restriction of scalars](#product-and-unramified-norm); [Abelianized Kottwitz set](#abelianized-kottwitz-set); [Geometric classification of G-bundles](#points-are-B-of-G); [Geometrically trivial open locus](#geometrically-trivial-locus); [Beauville–Laszlo uniformization](#beauville-laszlo-surjectivity); [Central-torus Grassmannian surjectivity](#central-torus-grassmannian-surjectivity); [Local constancy of bundle Kottwitz invariant](#semicontinuity-and-local-constancy); [Filtered torsor automorphism group schemes](#filtered-automorphism-group-scheme); [Quasi-split opposite-parabolic automorphisms](#quasi-split-opposite-parabolic); [Locally spatial Isom diagonal](#isom-sheaf-representability); [Quasi-split parabolic chart](#quasi-split-parabolic-chart); [Positive tangent criterion for the filtered chart](#chart-jacobian-positivity); [Finite Frobenius norm centralizer](#finite-frobenius-norm-centralizer); [Quasi-split centralizer in the GL minuscule case](#gl-minuscule-quasisplit-centralizer); [Algebraic fundamental group](#algebraic-fundamental-group); [Newton orbit space and rational dominance](#newton-orbit-space); [Galois averaging and Hodge invariants](#galois-average); [Newton and Kottwitz invariants](#newton-and-kottwitz-maps); [Kottwitz classification by both invariants](#classification-by-two-invariants); [Basic sigma class](#basic-class); [Rational Newton representative](#rational-newton-witness); [Torus norm and Newton average](#torus-norm-description); [Rational-point Kottwitz surjectivity](#rational-kottwitz-surjectivity); [Bounded lifting through a z-extension](#z-extension-bounded-lifting); [Basic classes and adjoint torsors with connected center](#connected-center-basic-inner-forms).

### R34 — ReductiveGroupsPartII:RG2.1

The generic z-extension foundation is imported from existing upstream RG2.1.5, not added as RG2.6 and not attributed to the dual/L-group layer RG2.5. Request the remaining general induced-torus surjection/resolution and invariant-lattice surjectivity/descent comparison needed by these BG consumers. Use existing z-extension exact_central, map_galoisAction, surjective_points and fundamentalGroup_torsionFree for their actual contracts. Z-embeddings are outside the upstream scope and are not requested by this BG packet. The resolution contract is a surjective E-group morphism from an induced torus to a given E-torus with a torus kernel, not unrestricted surjectivity on E-points. For the lattice sequence of a z-extension, invariant surjectivity is requested only with the vanishing of continuous H^1(J,X_*(Z)); prove that vanishing for the induced kernel and the stated closed Galois subgroup J. Integral coinvariant right exactness is separate and does not imply invariant surjectivity.

**Consumers:** [Basic Levi Newton formula](#levi-newton-formula); [Minuscule basic Levi lifting](#minuscule-basic-levi-lift); [Elliptic tori and basic acceptable classes](#elliptic-torus-basic-image); [Specialness for a transferred centralizer torus](#transferred-torus-specialness); [Ordinary straight translation and Levi centrality](#ordinary-straight-translation); [Ordinary classes under a derived isogeny](#ordinary-derived-isogeny); [Abelianized Kottwitz set](#abelianized-kottwitz-set); [Central-torus Grassmannian surjectivity](#central-torus-grassmannian-surjectivity); [Local constancy of bundle Kottwitz invariant](#semicontinuity-and-local-constancy); [Algebraic fundamental group](#algebraic-fundamental-group); [Newton orbit space and rational dominance](#newton-orbit-space); [Galois averaging and Hodge invariants](#galois-average); [Newton and Kottwitz invariants](#newton-and-kottwitz-maps); [Torus norm and Newton average](#torus-norm-description); [Rational-point Kottwitz surjectivity](#rational-kottwitz-surjectivity); [Bounded lifting through a z-extension](#z-extension-bounded-lifting); [Basic classes and adjoint torsors with connected center](#connected-center-basic-inner-forms).

### R35 — VectorBundlesAndIsocrystals:VB0/endomorphism-division-algebra

Import End_Φ(D(a,h)) with Π^h=π^(−a), Πx=σ(x)Π under arithmetic Frobenius.

**Consumers:** [Division-algebra Morita comparison](#division-algebra-morita).

### R36 — VectorBundlesAndIsocrystals:VB0/brauer-invariant-sign

Import the arithmetic local Brauer invariant and opposite-algebra sign; the endomorphism parameter is the bundle slope −a/h.

**Consumers:** [Division-algebra Morita comparison](#division-algebra-morita).

### R37 — VectorBundlesAndIsocrystals:VB2:classification/bundle-endomorphism-comparison

Import End_Φ(D(a,h))≅End(O(−a/h)) on each simple block, not full faithfulness between arbitrary slopes.

**Consumers:** [Division-algebra Morita comparison](#division-algebra-morita).

### R38 — VectorBundlesAndIsocrystals:VB4/slope-zero-local-systems

Import the tensor equivalence for bundles whose every geometric HN slope is zero, with perfectoid base change; degree zero alone is insufficient.

**Consumers:** [Geometrically trivial open locus](#geometrically-trivial-locus); [Classification of HN-graded bundles](#hn-graded-classification); [Full bundle automorphism v-group](#full-automorphism-v-group); [Reduction of full automorphism torsors](#automorphism-torsor-reduction).

### R39 — VectorBundlesAndIsocrystals:VB4/relative-cohomology-vanishing

Import positive H^1 vanishing étale locally, universally on affinoid perfectoid bases after the specified cover; use it to split positive automorphism/graded lifting obstructions.

**Consumers:** [Classification of HN-graded bundles](#hn-graded-classification); [Full bundle automorphism v-group](#full-automorphism-v-group).

### R40 — VectorBundlesAndIsocrystals:VB3:general-BC/positive-range-dimension

Import dimension deg(E0)−deg(E1) in the positive/negative range, and in particular deg(E) for positive section BC.

**Consumers:** [Positive automorphism kernel geometry](#positive-automorphism-kernel).

### R41 — DiamondsAndVStacks:D6/etale-site-comparison

Import the equivalence of étale sites between an analytic adic space and its diamond; the curve/Div^1 equivalence is a further RF2/G05 input. The read supplier is for analytic adic spaces over Z_p; an equal-characteristic counterpart is requested in G05 rather than inferred from that statement.

**Consumers:** [Curve-to-base étale site morphism](#curve-etale-base-site); [Constant torsion cohomology on the curve](#curve-torsion-cohomology).

### R42 — DiamondsAndVStacks:D1/strictly-totally-disconnected

Import the definition and geometric-component description; combine with universally-open-std-cover for the local lifting arguments.

**Consumers:** [Pro-étale torsors on strictly disconnected bases](#strictly-disconnected-torsors); [Grassmannian point lifting](#grassmannian-point-lifting).

### R43 — DiamondsAndVStacks:D3/locally-profinite-torsors

Import pro-étale presentation of locally profinite torsors, then use split étale covers on strictly totally disconnected bases.

**Consumers:** [Pro-étale torsors on strictly disconnected bases](#strictly-disconnected-torsors).

### R44 — DiamondsAndVStacks:D4/small-v-sheaves-and-small-v-stacks

Import smallness by a set-sized presentation of v-stacks; do not cite D3 as the definition of smallness.

**Consumers:** [Moduli v-stack Bun_G](#bun-g-as-v-stack); [Smallness of Bun_G](#bun-g-smallness).

### R45 — DiamondsAndVStacks:D0/groupoid-quotients-and-two-fibre-products

Import groupoid quotient stacks and their two-fibre products to formulate Bun_G and its descent.

**Consumers:** [Moduli v-stack Bun_G](#bun-g-as-v-stack).

### R46 — DiamondsAndVStacks:D5/relative-representability

Import the relative notion of representability in locally spatial diamonds, distinguishing absolute diamondhood from representable maps.

**Consumers:** [Full bundle automorphism v-group](#full-automorphism-v-group); [Positive automorphism kernel geometry](#positive-automorphism-kernel); [Locally spatial Isom diagonal](#isom-sheaf-representability); [Split section and spatial chart complement](#section-and-spatial-complement); [Smooth specialization neighborhoods](#chart-to-bun-g).

### R47 — VectorBundlesAndIsocrystals:VB4

Supply the linear period-space comparison V_Y(F)≃Vect(Y_F), functorial for F=Spd(Vhat,Vhat) arising from complete perfect rank-one valuation bases, as in GIZ26 Theorem3.16 and Remark3.15 pp.16–17. Here V_Y is the v-descent limit of Vect(Y_X), and Y_F=Y_(0,∞]. This is not unrestricted extension of every bundle from Y_(0,∞) to Y_(0,∞]. The topology proof separately uses PR24 Proposition2.1.3 and FS II.2.14 to classify the induced boundary bundle; retain these precise inputs and GIZ26 Remark2.1 on both characteristics. BG0/BG2 owns the structured meromorphic comparison; VB4 supplies this linear comparison only.

**Consumers:** [Newton topology theorem in both characteristics](#newton-topology-homeomorphism).

## Refinements required for closure

The packet remains partial. Planned target contracts and successfully typed pointwise cores do not certify closed proof chains.

### G01 — Remaining torus-resolution and lattice refinements

The current upstream RG2.1.5 already supplies generic z-extensions, their existence, induced central kernels, simply connected derived groups, rational-point surjectivity, torsion-free π_1 and Γ-equivariant central lattice exactness. The earlier proposed RG2.6 is superseded for these inputs. What still needs an explicit owner contract is a general induced-torus surjection/resolution with the invariant-lattice surjectivity and descent comparison used by the BG arguments. Existing fixed-datum fundamental-group signatures also need maximal-torus/inner-twist comparison when canonical transport is invoked. Z-embeddings are explicitly outside the current upstream scope and are not prerequisites of this BG packet. The requests retain RG2.1 as the catalogue identifier and cite its actual current upstream targets.

**Consumers:** All 17 named consumers are listed in the packet.

### G02 — Relative reductive-group and Tannakian descent refinements

The affine filtered splitting input has now been read: Zie15 Theorem1.3/4.15 needs an affine base and pro-smooth underlying automorphism group; for the reductive finite-type case that group is smooth. The proof outline clears rational weights on a local tensor generator, splits on affine charts, then trivializes the torsor étale locally. Proposition4.24/Lemma4.25 describe the positive vector quotients. What remains is the generic relative scheme/analytic tensor-torsor and filtered-group representability interface, rational-cocharacter root calculation and effective descent, together with generic inner-form descent and elliptic-torus transfer. Native dynamic field point subgroups do not provide these represented relative objects. Route the generic additions to ReductiveGroups; BG keeps its curve-specific conclusions. Ans19 Theorem3.11 also needs the non-routine reductive invariant-theory/Haboush tensor argument from the rational representation owner. No global non-affine splitting is assumed.

**Consumers:** [Tannakian description of analytic torsors](#g-torsors-three-descriptions); [Algebraic sigma-centralizer](#sigma-centralizer-J-b); [Finite Frobenius norm centralizer](#finite-frobenius-norm-centralizer); [Filtered torsor automorphism group schemes](#filtered-automorphism-group-scheme); [Specialness for a transferred centralizer torus](#transferred-torus-specialness); [Geometric classification of G-bundles](#points-are-B-of-G).

### G03 — Weil crossed-module proof interior

Read and decompose Borovoi/Serre inputs establishing the abelian crossed-module comparison and H^2(W_E,Tsc(L^sep))=0. FS III.2.11 states these cohomological ingredients; this pass does not claim to have read their original proofs. ET.0 is the cohomological owner. Check the coefficient topologies and naturality of the W_E-to-curve map. Here L^sep is the overline of breve E, with the natural W_E-action and discrete coefficient topology; include inertia, in particular for μ_p over Q_p.

**Consumers:** [Abelianized Kottwitz set](#abelianized-kottwitz-set); [Abelianized classes equal fundamental coinvariants](#abelianization-identification); [Diagonalizable Weil–curve comparison](#diagonalizable-curve-cohomology); [Constant crossed-module curve classes](#crossed-module-curve-classes).

### G04 — G-isocrystal family descent and stratification refinements

The formerly unread family-stack inputs are now located: Iva23 Lemma5.9/Proposition5.10, Ans22 Lemma11.3/Theorem11.4, and HK22 v5 Proposition2.10/Theorem2.11. The first two give an arc-descent proof independent of κ-local-constancy and coefficient-torsor v-triviality; the latter gives Isom torsors over perfect normal bases. FS cites HK22 v1 Theorem1.4, which had no normality hypothesis; v5 adds it. Use normal valuation-ring v-covers for the arbitrary-perfect-base v-stratum equivalence, without claiming arbitrary-base profinite étale trivialization. Expand the remaining exact inputs: perfectoid almost/sousperfectoid descent, rank-one punctured-period-ring torsor extension and valuation excision, Zink’s effective-lattice bound, slope-zero finite étale fixed sections, and tensor-line orbit lifting for the actual automorphism group. The schematic family κ theorem is a later input to stratification, not to descent. GIZ26 Theorem7.13 meromorphic comparison still needs BL uniformization, parahoric BKF/shtuka comparison and proper quasi-pro-étale Isom descent; these analytic inputs are not supplied by the schematic family definition. New source findings E08/E09 make two of these obligations precise: HK22 Lemma2.9 p.8 needs an initial Frobenius denominator in its effective-over-lattice bound, and Theorem2.11 p.9 does not justify an actual Aut(V0) lift from an ambient GL(H) section. Zin01 Lemma9 author pp.11–12 supplies the minimal-lattice iteration argument, not the Newton-only bound. The finite-level fixed-section calculation in HK22 Lemma2.8 was read; representing it over the actual coefficient family and proving the actual-orbit lift remain supplier work. No closed stratum proof is claimed.

**Consumers:** [Families of G-isocrystals](#families-of-g-isocrystals); [Isocrystal-family v-descent and strata](#isocrystal-family-v-descent); [Kottwitz invariant in isocrystal families](#family-kottwitz-local-constancy); [Newton topology theorem in both characteristics](#newton-topology-homeomorphism).

### G05 — Curve étale comparison refinements

FS III.2.12 proof was read. Expand its curve/divisor étale-site equivalence, geometric-point punctured-period-domain computation and continuous finite-extension descent. C1 supplies only its actual prime-to-p proper-base-change scope; formalize the p-torsion Artin–Schreier/tilting step separately. This is not obtained by citing C5 j! exchange or RF3 line bundles. The read D6 étale-site-comparison has a Z_p base; its equal-characteristic analogue for general E is a further exact supplier refinement.

**Consumers:** [Curve-to-base étale site morphism](#curve-etale-base-site); [Constant torsion cohomology on the curve](#curve-torsion-cohomology); [Diagonalizable Weil–curve comparison](#diagonalizable-curve-cohomology); [Constant crossed-module curve classes](#crossed-module-curve-classes).

### G06 — Newton topology and maximal-element proof interiors

The source-level equal-characteristic coverage defects are repaired: the maximum now has an explicit derivation from HN18 Theorem1.1(1) and He16 §2.4, with central inertia torsion restored at fixed integral κ; topology uses GIZ26 v3 Theorem7.18 with He16 in equal characteristic and Vie21 in mixed characteristic. Full proof interiors remain open. For the maximum, expand the reduced-root/adjoint transfer, orbit-weight integrality (HN18 Lemma2.5), and Chai Theorem6.5/Lemma6.2(i) convex-majorant inputs through RG2.4. For topology, expand GIZ26 Proposition2.17, Theorem3.16 and its external boundary-bundle classification inputs, and Theorem7.13 through G04 and the exact VB4 request. No closed proof chain is claimed.

**Consumers:** [Newton topology theorem in both characteristics](#newton-topology-homeomorphism); [Unique maximum of acceptable classes](#acceptable-unique-maximum).

### G07 — Unitary flag dimension and ordinary comparison interiors

The ordinary source boundary is narrowed by reading Wed99 Theorem1.6.3 and its split/balanced unramified unitary calculation, CGH20 arXiv v2 Proposition3.3.2 (the actual read locator), and Sch15 Lemma3.3.6/Remark3.3.7/Lemma3.3.19. The rank-one rational Hodge–Tate criterion and its specialization argument are explicit. CGH20 assumes p splits completely; extend its local closed-flag/forgetful PEL compatibility to the CS24 unramified unitary datum and identify the entire sub-v-sheaf with the rational-point diamond. Separately expand the central-leaf/period-fibre comparison yielding Krull dimension d−d_b; this is not a consequence of the ordinary criterion or upper semicontinuity. Published CGH numbering is not claimed collated, and Wedhorn’s global density deformation proof is not newly expanded.

**Consumers:** [Unitary flag Newton dimensions](#unitary-flag-stratum-dimension); [Unitary ordinary flag locus](#unitary-ordinary-flag-locus).

### G08 — Lean formulation boundary

Native exact, E-linear symmetric tensor abstractions and the rational representation source are available. The suggested file types native affine Hopf point quotients, their representative groupoid/automorphism comparison, the centralizer functor on every coefficient E-algebra, the Witt-unit rank-one specialization and the diagonalizable rational slope protorus. RepresentativeTensor now types the actual semilinear Frobenius family on native finite rational comodules, its Tannakian point reconstruction, all tensor arrows and the point sigma-stabilizer comparison. This covers the trivialized presentation. Comparison with the untrivialized exact G-isocrystal category, Steinberg trivialization and represented Newton-Levi descent remain open. The inspected VB0 suggested file already defines FiniteIsocrystal L σ, its Hom/category, tensor object and endomorphism ring; the missing linear interface is its exported E-linear exact symmetric monoidal category and coherence, not its objects or morphisms. The inspected VB1 scheme CurveBundle likewise does not supply the relative analytic FF bundle category. Remaining geometric boundaries are concrete relative FF coefficients and analytic bundles, v-stack carriers, represented filtered groups, crossed-module Weil complexes and analytic cohomological predicates. Current upstream RG2.1.5 foundations are imported rather than duplicated. No arbitrary Type/Prop replacement is used; the omission register remains incomplete §13 coverage. The RF suggested file’s DiamondFormulas explicitly leaves the actual perfectoid site, represented base and coefficient sheaves as omitted hypotheses; VS0’s ArtinVStack and VS1’s analytic Jacobian/cohomological signatures likewise remain omission contracts. Generic sheaf carriers do not instantiate these geometric hypotheses. KottwitzDescent now types the unique sigma-class descent of a supplied equivariant representative homomorphism to native integral cyclic coinvariants, native naturality, surjectivity and an actual abelian quotient equivalence. Its sign-action controls compare the nonzero order-two quotient with zero fixed points. This narrows only the integral descent boundary; general-E Newton and actual local Galois/Frobenius identification remain open.

**Consumers:** All 98 named consumers are listed in the packet.

### G09 — Local de Rham coefficient group

Liu–Zhu Remark4.1(iii) is used through the reviewed G^c qualification. The target class lies in B(G^c); construction of a G-level lift from extra tensor data remains an explicit input. A local central-torus lifting theorem does not make this lift canonical.

**Consumers:** [Class from a de Rham quotient-group lattice](#de-rham-quotient-group-class).

### G10 — Levi coinvariant and Cartan refinements

Expand the torsion-free kernel π_1(M)_Γ→π_1(G)_Γ used in KMPS Proposition1.1.13, the unramified replacement/triality averaging, and the Wintenberger–Satake–Mazur local Cartan ingredients through the requested root/Cartan owner. Do not treat absolute Weyl transport as N_G(M)/M. For KZ Proposition2.3.3 expand the specific He–Rapoport6.1(b), He16 Theorem6.1, He–Zhou4.1, and He14 Theorem3.5/Proposition4.5 inputs listed in the corrected proof sketch.

**Consumers:** [Minuscule basic Levi lifting](#minuscule-basic-levi-lift); [Specialness for a transferred centralizer torus](#transferred-torus-specialness); [Integral conjugacy of an ordinary admissible element](#ordinary-integral-conjugacy).

### G11 — Source version collation

The author/preprint versions of KMPS, KZ, LZ17, CS24 and Kisin17 are recorded with hashes and exact local sections. Published versions were not collated for those texts. Findings against those files are scoped to them. Compare the statements against the versions of record before extending any finding to a published edition.

**Consumers:** All 31 named consumers are listed in the packet.

### G12 — Exact supplier boundaries for Schubert components and filtered BC towers

The current GS0 Schubert-bound node already treats general E and nonsplit bounds by splitting and Galois descent; reuse it. It does not state the exact π_1 connected-component comparison, which remains the separate GS0 refinement. Projectivized BC properness concerns H^0, while negative H^1 extensions use the two-term BC family theorem. The reductive extension-tower contraction/escaping/proper-Z-quotient argument and positive automorphism-kernel connectedness need the separately requested linear/diamond refinements. D4 smallness alone supplies neither spatiality nor properness; retain D5 and the missing proper-quotient criterion.

**Consumers:** [Grassmannian point lifting](#grassmannian-point-lifting); [Grassmannian components and Kottwitz sign](#grassmannian-kottwitz-sign); [Positive automorphism kernel geometry](#positive-automorphism-kernel); [Split section and spatial chart complement](#section-and-spatial-complement); [Contracting chart action and proper quotient](#contracting-chart-action).

## Suggested file and pinned baseline

Over fields E,L, a commutative Hopf E-algebra H and an E-algebra automorphism σ of L, RepresentativeTensor uses the actual native finite rational comodule category and scalar-extension fibre functor. It types σ-semilinear Frobenius components, explicit naturality/unit/tensor equations, linearization and native Tannakian reconstruction, a Groupoid of tensor intertwiners and all twisted conjugator arrows. These are the trivialized presentation, not another definition of linear isocrystals. VB0’s structured untrivialized exact category, its general local coefficients and the Steinberg trivialization comparison are still G08; the original full GIsocrystal API and Witt GL_n/slope tests remain unfulfilled.

The representative groupoid and the Groupoid of these families are linked by RepresentativeTensor.categoryEquivalence. Tensor automorphisms reconstruct all point stabilizers, with the native multiplication convention. Ten new controls check semilinearity, the unit, the tensor equation, non-linearity under nontrivial Frobenius, conjugator intertwining, multiplication order, full-family reconstruction, the representative comparison and automorphism stabilizers. These controls supplement the original Witt GL_n and slope tests, whose full signatures still depend on VB0. No target omission or stage is declared closed.

The native categorical interface uses specified Quillen exact structures and their distinguished conflations. TensorInterface.Data retains an additive E-linear functor, an invertible unit/tensor comparison compatible with symmetry, and native preservation of conflations. TensorInterface.Iso retains monoidal compatibility of a natural isomorphism. Postcomposition has tensor identity and associativity isomorphisms; componentwise equality determines a tensor isomorphism. Six categorical controls check the unit, tensor, exactness and natural-isomorphism contracts. Their hypotheses are actual category structures, not unspecified geometric predicates. Instantiation with relative analytic bundle and general-E isocrystal categories remains the supplier obligation G08; these controls do not replace the roadmap’s geometric reconstruction tests.

The suggested file now instantiates SigmaClass at native Hopf-algebra points and at Witt units, and retains every conjugator in a representative groupoid. Native Aut agrees with the sigma-stabilizer. The centralizer functor varies over all commutative E-algebras A, with coefficient algebra A⊗_E L and coefficient maps f⊗id_L; it is not yet represented by a reductive E-group in the prototype. The slope protorus uses the native Hopf algebra E[Q], actual representation weight submodules and coordinate morphisms. Its examples detect half-slope denominator clearing on generators and distinguish it from integral slopes. Untrivialized exact G-isocrystal comparison, nonsplit comparison and full analytic geometry remain named omissions; a register entry is not an elaborated theorem.

KottwitzDescent reuses native integral coinvariants for the cyclic Frobenius action. Its relation submodule is the range of τ−id. The representative formula descends uniquely to SigmaClass; native intertwining maps supply naturality, and representative surjectivity supplies quotient surjectivity. The abelian quotient equivalence and seven identity/sign controls test the actual quotients, retaining their order-two torsion. Reductive-group and local-field instantiation remains explicit supplier work.

Codex codex-hQQIPH rechecked the prototype on 2026-10-10 with exit code 0 and 178 declaration-uses-sorry warnings, with no other warnings. This checks the preceding native affine, tensor and integral Kottwitz interfaces plus three restricted Submodule/vector controls for E08/E09. All theorem and example proofs are admitted. Full geometric signatures, valuation-theoretic bounds, slope classification and actual continuous orbit lifting were not elaborated. The affine splitting and rational/non-affine controls remain omitted contracts. Native baseline declarations were read at their recorded pins; this file imports individual Mathlib and Tau Ceti modules.

Mathlib is pinned to 082e2d37e8b0463410cdb532e111cd43d5a66174 and Tau Ceti to f790474821cf4256814db967cb154e7af3d0c369. The source-checked baseline is:

- [TauCeti.ReductiveAffineGroupSchemeCat](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/AlgebraicGeometry/AffineGroupScheme/Reductive.lean): Finite-type reductive affine group schemes over a field via the Hopf-algebra equivalence; does not supply local Newton theory.
- [TauCeti.AffineGroupSchemeCat](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/AlgebraicGeometry/AffineGroupScheme/Basic.lean): Affine group objects over Spec of a bundled commutative ring, not arbitrary-base relative group schemes.
- [TauCeti.Cocharacter.parabolic](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Algebra/AlgebraicGroup/Dynamic/Parabolic.lean): Dynamic parabolic subgroup of the convolution group of A-valued points of a Hopf algebra. Relative representability and filtered-functor descent remain separate inputs.
- [TauCeti.Cocharacter.leviGroupExtension](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Algebra/AlgebraicGroup/Dynamic/LeviDecomposition/Basic.lean): GroupExtension of dynamic unipotent, parabolic and Levi point groups, with limit homomorphism; not the relative filtered group-scheme theorem of FS III.5.2.
- [WittVector.Isocrystal](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/WittVector/Isocrystal.lean): Frobenius-semilinear equivalence on a module over FractionRing of p-typical Witt vectors. Finite dimensionality is additional; the file proves rank-one classification. General E and the rigid exact category come from VB0.
- [CategoryTheory.Functor.Monoidal](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/CategoryTheory/Monoidal/Functor.lean): Strong monoidal structure on an actual functor, including inverse unit/tensor maps and coherence; exactness and rational group-scheme representations are additional inputs.
- [CategoryTheory.Equivalence](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/CategoryTheory/Equivalence.lean): Functor, inverse and natural unit/counit isomorphisms; a set bijection is weaker.
- [Subgroup](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Group/Subgroup/Defs.lean): Subgroups of a group, used for the expressible pointwise sigma-centralizer prototype, not its representability.
- [RootPairing](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/RootSystem/Defs.lean): Paired root/coroot data. Galois action, reductive fundamental group, rational dominant chamber and local affine Weyl group are supplier work, not consequences of this type alone.
- [Specializes](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Topology/Defs/Filter.lean): Topological specialization; orientation is fixed by b<=bprime iff Ebprime lies in the closure of Eb.
- [MulEquiv](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Group/Equiv/Defs.lean): An actual multiplicative equivalence, used for the group Frobenius prototype.
- [Rat.pos](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Data/Rat/Defs.lean): The reduced rational denominator is positive; Finset filtering records its slope multiplicity.
- [TauCeti.FGPointRepresentationCat](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Algebra/AlgebraicGroup/Representation/Comodule/Equivalence.lean): Finite natural algebra-valued point representations of a commutative Hopf algebra, equivalent to finite comodules; over a field these are finite-dimensional rational representations.
- [TauCeti.FGPointRepresentationCat.instRigidCategory](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Algebra/AlgebraicGroup/Representation/Comodule/Monoidal.lean): The finite representation category is rigid symmetric monoidal via transport from finite comodules; reuse this existing structure.
- [TauCeti.Tannaka.fgPointTensorIsoEquiv](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Algebra/AlgebraicGroup/Representation/Tannaka/Equivalence.lean): For a field k and commutative Hopf algebra H, A-valued points are tensor automorphisms of scalar extension on finite H-comodules; does not assert analytic torsor reconstruction.

- [TauCeti.ExactStructure](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/CategoryTheory/Exact/ExactStructure.lean): Chosen Quillen exact structure on an additive category with zero object and binary biproducts; the owner supplies the distinguished conflations.
- [TauCeti.ExactStructure.IsConflationExact](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/CategoryTheory/Exact/Functor.lean): Native preservation of the specified conflations by an additive functor. This does not assert preservation of all finite limits and colimits.
- [CategoryTheory.Functor.Linear](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/CategoryTheory/Linear/LinearFunctor.lean): A functor between E-linear categories respects scalar multiplication of morphisms.
- [CategoryTheory.Functor.Braided](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/CategoryTheory/Monoidal/Braided/Basic.lean): Strong monoidal functor with compatibility with the braiding; between symmetric categories this is the symmetric tensor structure.
- [CategoryTheory.NatTrans.IsMonoidal](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/CategoryTheory/Monoidal/NaturalTransformation.lean): Unit and tensor compatibility for natural transformations between monoidal functors; a natural isomorphism alone is insufficient.

- [TauCeti.AlgHom.mapValue](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Algebra/AlgebraicGroup/FunctorOfPoints.lean): Postcomposition by an E-algebra map is a homomorphism of native convolution point groups for a commutative Hopf algebra; used for coefficient Frobenius and coefficient change.
- [TauCeti.MultiplicativeGroup.pointsMulEquiv_mapValue](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Algebra/AlgebraicGroup/MultiplicativeGroup/Basic.lean): The Laurent-polynomial Hopf point group is multiplicatively equivalent to units, naturally under coefficient algebra maps. This supplies the G_m Frobenius comparison.
- [WittVector.exists_frobenius_solution_fractionRing](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/WittVector/FrobeniusFractionField.lean): Over an algebraically closed residue field of characteristic prime p, each nonzero Witt fraction a admits a nonzero b and integer m satisfying φ(b)a=p^m b. This provides existence of rank-one normal forms, not the full general-E category.
- [WittVector.FractionRing.frobenius](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/WittVector/Isocrystal.lean): For a perfect domain of characteristic p, native Frobenius extends to a ring equivalence of the p-typical Witt fraction field.
- [CategoryTheory.Groupoid](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/CategoryTheory/Groupoid.lean): A native category in which each morphism has an inverse. The representative groupoid keeps every twisted conjugator rather than replacing orbit classes by a discrete category.
- [CategoryTheory.Aut.Aut_mul_def](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/CategoryTheory/Endomorphism.lean): Native Aut multiplication is reversed categorical composition; this gives the usual point-stabilizer multiplication for the representative groupoid.
- [Algebra.TensorProduct.map](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/TensorProduct/Maps.lean): Tensor products of algebra homomorphisms give algebra homomorphisms; here coefficient maps act as f⊗id_L.
- [Algebra.TensorProduct.congr](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/TensorProduct/Maps.lean): Tensor products of algebra equivalences give algebra equivalences; here Frobenius is id_A⊗σ on A⊗_E L.
- [TauCeti.DiagonalizableGroup.weightSpace](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Algebra/AlgebraicGroup/DiagonalizableGroup/Weight.lean): Corestriction of a representation comodule along a coalgebra map to a group algebra defines weight submodules and their internal direct-sum decomposition.
- [TauCeti.DiagonalizableGroup.finite_setOf_weightSpace_ne_bot](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Algebra/AlgebraicGroup/DiagonalizableGroup/Weight.lean): For a finitely generated representation module, the nonzero weight submodules after corestriction to a group algebra have finite support.
- [TauCeti.MonoidAlgebra.mapDomainBialgHom_surjective](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Algebra/Bialgebra/MonoidAlgebra/GroupLike.lean): Over a commutative ring with connected prime spectrum, every bialgebra map between monoid algebras is induced by a monoid homomorphism; the adjacent injectivity theorem assumes a nontrivial base. A field satisfies both conditions.

- [TauCeti.FGComoduleCat.scalarExtensionMonoidalFunctor](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Algebra/Coalgebra/Comodule/Finite/ScalarExtension/Monoidal.lean): Native strong monoidal scalar extension of finite comodules to L-modules, with the tensorator given by inverse tensor-product base-change distribution and the tensor-unit comparison.
- [TauCeti.Comodule.pointsAction](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Algebra/AlgebraicGroup/Representation/PointsAction.lean): The native convolution group of algebra-valued Hopf points acts by linear automorphisms of the scalar-extended comodule, multiplicatively in the point.
- [TauCeti.Tannaka.scalarExtensionComponent](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Algebra/AlgebraicGroup/Representation/Tannaka/Monoidal.lean): Transport a native tensor-automorphism component to an L-linear map on the explicit module L⊗_E M; the adjacent point-action component lemma identifies this with the native comodule action.
- [TauCeti.Comodule.rTensor_comp_endOfPoint](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Algebra/Coalgebra/Comodule/PointsAction.lean): Coefficient postcomposition intertwines the point action with right-tensored coefficient maps. Applying the automorphism σ supplies the semilinear conjugation identity.
- [TauCeti.Comodule.baseChange_comp_endOfPoint](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Algebra/Coalgebra/Comodule/PointsAction.lean): A base-changed comodule morphism intertwines the scalar-extended actions of every algebra-valued Hopf point.
- [TauCeti.Comodule.endOfPoint_tensor](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Algebra/Coalgebra/Comodule/PointsAction.lean): The point action on a tensor comodule is the tensor product of its two actions, transported by the native base-change distribution isomorphism.
- [TauCeti.Comodule.endOfPoint_trivial](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Algebra/Coalgebra/Comodule/PointsAction.lean): The algebra-valued point action is the identity on the scalar extension of a trivial comodule, supplying the tensor-unit equation.
- [Representation.Coinvariants.map](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RepresentationTheory/Coinvariants.lean): Native induced linear map for an actual intertwining map; map_mk gives its representative formula. Used for integral Kottwitz naturality.
- [Representation.Coinvariants.mk](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RepresentationTheory/Coinvariants.lean): Native ℤ-linear quotient projection; mk_self_apply identifies a with ρ(g)a and mk_surjective is the quotient surjectivity used for descent.
- [Representation.Coinvariants](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RepresentationTheory/Coinvariants.lean): Native integral representation coinvariants: quotient by the span of ρ(g)a−a, with additive group and module structures. Applied over ℤ to the cyclic Frobenius action; this is not the reductive fundamental group.

- [Submodule](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Module/Submodule/Defs.lean): Native submodules closed under addition and scalar multiplication, used for the restricted effective-over-lattice shear controls on Fin 2 → K. This supplies no coefficient DVR, local-shtuka family or Newton classification.

## Routed paper coverage

All 148 items from the twelve issue-routed extractions have a named declaration or an exact supplier request. Each route retains the local hypotheses of the reviewed extraction. The two source conventions that change a conclusion are the full κ condition in the Newton order and G^c in the Liu–Zhu point application. The extraction paths and individual qualifications are recorded in the packet.

### PAPER-KISIN-17

| Item | Owned declaration or supplier |
|---|---|
| B01 | [Algebraic sigma-centralizer](#sigma-centralizer-J-b) |
| B02 | [Acceptable classes B(G,{μ})](#admissible-pair) |
| M02 | [Rational-point Kottwitz surjectivity](#rational-kottwitz-surjectivity) |
| kottwitz-twisted-centralizer | [Finite Frobenius norm centralizer](#finite-frobenius-norm-centralizer) |
| kottwitz-rational-dominant-representative | [Rational Newton representative](#rational-newton-witness) |
| rapoport-richartz-newton-vs-kottwitz | [Newton and Kottwitz invariants](#newton-and-kottwitz-maps) |

### PAPER-LIU-ZHU-17

| Item | Owned declaration or supplier |
|---|---|
| G21 | [Tannakian description of analytic torsors](#g-torsors-three-descriptions) |
| G22 | [Class from a de Rham quotient-group lattice](#de-rham-quotient-group-class) |

### PAPER-VANHOFTEN-24

| Item | Owned declaration or supplier |
|---|---|
| B01 | [Algebraic sigma-centralizer](#sigma-centralizer-J-b) |
| B02 | [Acceptable classes B(G,{μ})](#admissible-pair) |
| B04 | [Rational-point Kottwitz surjectivity](#rational-kottwitz-surjectivity) |

### PAPER-CARAIANI-SCHOLZE-24

| Item | Owned declaration or supplier |
|---|---|
| 27 | [Unitary flag Newton dimensions](#unitary-flag-stratum-dimension) |
| 28 | [Unitary ordinary flag locus](#unitary-ordinary-flag-locus) |

### PAPER-FARGUES-SCHOLZE-21

| Item | Owned declaration or supplier |
|---|---|
| c1-G-Isoc-stack | [Families of G-isocrystals](#families-of-g-isocrystals) |
| c1-thm-I.2.1-G-Isoc-stratification | [Isocrystal-family v-descent and strata](#isocrystal-family-v-descent) |
| c1-BunG-connected-components | [Connected components of Bun_G](#connected-components) |
| c1-viehmann-homeomorphism | [Viehmann Newton topology theorem](#newton-topology-homeomorphism) |
| c3-lem-III.2.6-proetale-torsor-trivial-std | [Pro-étale torsors on strictly disconnected bases](#strictly-disconnected-torsors) |
| c3-cor-III.2.8-rapoport-richartz | [Kottwitz invariant in isocrystal families](#family-kottwitz-local-constancy) |
| c3-def-abelianized-kottwitz-set | [Abelianized Kottwitz set](#abelianized-kottwitz-set) |
| c3-lem-III.2.11-Bab-equals-pi1-coinvariants | [Abelianized classes equal fundamental coinvariants](#abelianization-identification) |
| c3-def-tau-curve-to-base-etale | [Curve-to-base étale site morphism](#curve-etale-base-site) |
| c3-prop-III.2.12-i-etale-cohomology-curve-torsion | [Constant torsion cohomology on the curve](#curve-torsion-cohomology) |
| c3-prop-III.2.12-ii-H1-diagonalizable | [Diagonalizable Weil–curve comparison](#diagonalizable-curve-cohomology) |
| rev-comparison-morphism-from-w-e-cohomology-to-tale-cohomology-o | [Diagonalizable Weil–curve comparison](#diagonalizable-curve-cohomology) |
| c3-prop-III.2.13-H1-crossed-module-constant | [Constant crossed-module curve classes](#crossed-module-curve-classes) |
| c3-rem-III.2.14-weil-cohomology-comparison | [Constant crossed-module curve classes](#crossed-module-curve-classes) |
| c3-conj-III.2.15-BunG-homeomorphism | [Viehmann Newton topology theorem](#newton-topology-homeomorphism) |
| c3-lem-III.3.2-Gr-surjective-on-points | [Grassmannian point lifting](#grassmannian-point-lifting) |
| c3-lem-III.3.4-Gr-colimit-schubert | [GeometricSatakeAndFusion:GS0:loop-geometry/schubert-bounds-and-properness](../../../content/campaign/GeometricSatakeAndFusion/README.md) |
| c3-lem-III.3.5-Gr-z-extension-surjective | [Central-torus Grassmannian surjectivity](#central-torus-grassmannian-surjectivity) |
| c3-prop-III.3.6-i-Gr-components-pi1 | [GeometricSatakeAndFusion:GS0:loop-geometry/schubert-bounds-and-properness](../../../content/campaign/GeometricSatakeAndFusion/README.md) |
| c3-prop-III.3.6-ii-kappa-on-Gr | [Grassmannian components and Kottwitz sign](#grassmannian-kottwitz-sign) |
| c3-prop-III.3.6-iii-Gr-alpha-colimit | [GeometricSatakeAndFusion:GS0:loop-geometry/schubert-bounds-and-properness](../../../content/campaign/GeometricSatakeAndFusion/README.md) |
| c3-nonsplit-Gr-decomposition | [GeometricSatakeAndFusion:GS0:loop-geometry/schubert-bounds-and-properness](../../../content/campaign/GeometricSatakeAndFusion/README.md) |
| c3-prop-III.4.2-Gb-pure-inner-twist-on-curve | [Basic inner form equivalence](#basic-inner-form-bundle-equivalence) |
| c3-cor-III.4.3-BunG-BunGb | [Basic inner form equivalence](#basic-inner-form-bundle-equivalence) |
| c3-ex-III.4.4-morita | [Division-algebra Morita comparison](#division-algebra-morita) |
| c3-ex-III.4.6-BunT-torus | [Torus bundle Picard stack](#torus-picard-stack) |
| c3-prop-III.4.7-HN-split-moduli | [Classification of HN-graded bundles](#hn-graded-classification) |
| c3-prop-III.5.2-filtered-automorphism-group-scheme | [Filtered torsor automorphism group schemes](#filtered-automorphism-group-scheme) |
| c3-quasisplit-Gtilde-b-description | [Quasi-split opposite-parabolic automorphisms](#quasi-split-opposite-parabolic) |
| c3-rem-III.5.4-Gtilde-b-torsors | [Reduction of full automorphism torsors](#automorphism-torsor-reduction) |
| c4a-pi0-bunG-IV.1.23 | [Connected components of Bun_G](#connected-components) |
| c5-ex-V.3.4-quasisplit | [Quasi-split parabolic chart](#quasi-split-parabolic-chart) |

### PAPER-GLEASON-LIM-XU-26

| Item | Owned declaration or supplier |
|---|---|
| D05 | [Algebraic fundamental group](#algebraic-fundamental-group) |
| D06 | [G-isocrystals](#g-isocrystals-and-B-of-G) |
| D07 | [Acceptable classes B(G,{μ})](#admissible-pair) |
| D09 | [Decent representative](#decent-representative) |
| T03 | [Existence of decent representatives](#existence-of-decent-representative) |
| D10 | [Component Kottwitz coset](#component-kottwitz-coset) |
| T07 | [Bounded lifting through a z-extension](#z-extension-bounded-lifting) |
| T08 | [Bounded lifting through a z-extension](#z-extension-bounded-lifting) |

### PAPER-CARAIANI-SCHOLZE-17

| Item | Owned declaration or supplier |
|---|---|
| 42 | [Newton bound for a modification](#modification-newton-bound) |
| 44 | [Newton bound for a modification](#modification-newton-bound) |
| 45 | [Newton strata of a minuscule flag variety](#flag-newton-strata) |
| 46 | [Closed upper flag Newton unions](#flag-strata-semicontinuity) |
| 47 | [Minuscule modification image](#minuscule-modification-image) |
| 48 | [Closed upper flag Newton unions](#flag-strata-semicontinuity) |
| 109 | [Quasi-split centralizer in the GL minuscule case](#gl-minuscule-quasisplit-centralizer) |
| 137 | [Representations detect Newton dominance](#representation-detects-dominance) |
| 155 | [Ordinary Newton class](#ordinary-class) |
| 159 | [Products and unramified restriction of scalars](#product-and-unramified-norm) |

### PAPER-HE-21

| Item | Owned declaration or supplier |
|---|---|
| 10 | [Kottwitz set B(G)](#sigma-conjugacy-quotient) |
| 11 | [Newton and Kottwitz invariants](#newton-and-kottwitz-maps) |
| 12 | [Defect of a sigma class](#defect) |
| 13 | [Newton partial order with Kottwitz fibre](#partial-order-on-B-of-G) |
| 88 | [Newton comparison for a Levi representative](#general-levi-newton-comparison) |
| 90 | [Basic sigma class](#basic-class) |
| 105 | [Levi fibre over a basic G-class](#basic-levi-fibre-uniqueness) |

### PAPER-KISIN-ZHOU-25

| Item | Owned declaration or supplier |
|---|---|
| N07 | [ReductiveGroupsPartII:RG2.4](https://github.com/TauCetiProject/TauCetiRoadmap/blob/201bcaee1f4014c91897d50cdb7631fc6d6a6d71/TauCetiRoadmap/ReductiveGroupsPartII/README.md) |
| N08 | [ReductiveGroupsPartII:RG2.4](https://github.com/TauCetiProject/TauCetiRoadmap/blob/201bcaee1f4014c91897d50cdb7631fc6d6a6d71/TauCetiRoadmap/ReductiveGroupsPartII/README.md) |
| N09 | [ReductiveGroupsPartII:RG2.4](https://github.com/TauCetiProject/TauCetiRoadmap/blob/201bcaee1f4014c91897d50cdb7631fc6d6a6d71/TauCetiRoadmap/ReductiveGroupsPartII/README.md) |
| N11 | [Ordinary straight translation and Levi centrality](#ordinary-straight-translation) |
| N12 | [Ordinary straight translation and Levi centrality](#ordinary-straight-translation) |
| N13 | [ReductiveGroupsPartII:RG2.4](https://github.com/TauCetiProject/TauCetiRoadmap/blob/201bcaee1f4014c91897d50cdb7631fc6d6a6d71/TauCetiRoadmap/ReductiveGroupsPartII/README.md) |
| N15 | [Straight Weyl comparison with B(G)](#straight-weyl-classification) |
| N17 | [Ordinary Newton class](#ordinary-class) |
| N18 | [Unique maximum of acceptable classes](#acceptable-unique-maximum) |
| N19 | [Ordinary straight translation and Levi centrality](#ordinary-straight-translation) |
| N20 | [Ordinary classes under a derived isogeny](#ordinary-derived-isogeny) |
| N21 | [Ordinary classes under a derived isogeny](#ordinary-derived-isogeny) |
| N25 | [Integral conjugacy of an ordinary admissible element](#ordinary-integral-conjugacy) |
| N26 | [Integral conjugacy of an ordinary admissible element](#ordinary-integral-conjugacy) |

### PAPER-ZHU-17

| Item | Owned declaration or supplier |
|---|---|
| G30 | [GeometricSatakeAndFusion:GS0:loop-geometry/schubert-bounds-and-properness](../../../content/campaign/GeometricSatakeAndFusion/README.md) |
| D02 | [Defect of a sigma class](#defect) |
| cited-Kot97-functor-on-tori | [GeometricSatakeAndFusion:GS0:loop-geometry/schubert-bounds-and-properness](../../../content/campaign/GeometricSatakeAndFusion/README.md) |
| remark-3-6-norm-on-classes | [Products and unramified restriction of scalars](#product-and-unramified-norm) |

### PAPER-HOWE-KLEVDAL-26

| Item | Owned declaration or supplier |
|---|---|
| 180 | [Finiteness and the basic acceptable member](#admissible-finiteness-and-basic) |

### PAPER-KISIN-MADAPUSIPERA-SHIN-22

| Item | Owned declaration or supplier |
|---|---|
| N01 | [Rational slope protorus](#slope-protorus) |
| N02 | [Algebraic fundamental group](#algebraic-fundamental-group) |
| N03 | [Newton orbit space and rational dominance](#newton-orbit-space) |
| N04 | [Newton orbit space and rational dominance](#newton-orbit-space) |
| N06 | [Kottwitz set B(G)](#sigma-conjugacy-quotient) |
| N07 | [Newton and Kottwitz invariants](#newton-and-kottwitz-maps) |
| N08 | [Newton and Kottwitz invariants](#newton-and-kottwitz-maps) |
| N09 | [Existence of decent representatives](#existence-of-decent-representative) |
| N10 | [Newton and Kottwitz invariants](#newton-and-kottwitz-maps) |
| N11 | [Kottwitz classification by both invariants](#classification-by-two-invariants) |
| N12 | [Basic sigma class](#basic-class) |
| N13 | [Kottwitz classification by both invariants](#classification-by-two-invariants) |
| N14 | [Torus norm and Newton average](#torus-norm-description) |
| N15 | [Rational Newton representative](#rational-newton-witness) |
| N16 | [Rational Newton representative](#rational-newton-witness) |
| N17 | [Algebraic sigma-centralizer](#sigma-centralizer-J-b) |
| N18 | [Algebraic sigma-centralizer](#sigma-centralizer-J-b) |
| N19 | [Newton orbit space and rational dominance](#newton-orbit-space) |
| N20 | [Acceptable classes B(G,{μ})](#admissible-pair) |
| N21 | [Finiteness and the basic acceptable member](#admissible-finiteness-and-basic) |
| N22 | [Torus-special acceptable pair](#torus-special-pair) |
| N23 | [Elliptic tori and basic acceptable classes](#elliptic-torus-basic-image) |
| N24 | [ReductiveGroupsPartII:RG2.1](https://github.com/TauCetiProject/TauCetiRoadmap/blob/201bcaee1f4014c91897d50cdb7631fc6d6a6d71/TauCetiRoadmap/ReductiveGroupsPartII/README.md) |
| N25 | [ReductiveGroupsPartII:RG2.1](https://github.com/TauCetiProject/TauCetiRoadmap/blob/201bcaee1f4014c91897d50cdb7631fc6d6a6d71/TauCetiRoadmap/ReductiveGroupsPartII/README.md) |
| N26 | [Basic Levi Newton formula](#levi-newton-formula) |
| N27 | [Minuscule basic Levi lifting](#minuscule-basic-levi-lift) |
| N28 | [Minuscule basic Levi lifting](#minuscule-basic-levi-lift) |
| N29 | [Minuscule basic Levi lifting](#minuscule-basic-levi-lift) |
| N30 | [ReductiveGroups · layer 7 structure theory](../../../content/tau-ceti/ReductiveGroups/README.md#layer-7-structure-theory) |
| N31 | [ReductiveGroups · layer 7 structure theory](../../../content/tau-ceti/ReductiveGroups/README.md#layer-7-structure-theory) |
| N32 | [Specialness for a transferred centralizer torus](#transferred-torus-specialness) |
| C01 | [Torus norm and Newton average](#torus-norm-description) |
| C02 | [Ordinary Newton class](#ordinary-class) |
| galois-and-closure-conventions | [VectorBundlesAndIsocrystals:VB0](../../../content/campaign/VectorBundlesAndIsocrystals/README.md) |
| witt-field-closure-embedding-and-Qpr | [VectorBundlesAndIsocrystals:VB0](../../../content/campaign/VectorBundlesAndIsocrystals/README.md) |
| newton-to-pi1-map | [Newton orbit space and rational dominance](#newton-orbit-space) |
| coinvariant-to-invariant-averaging | [Galois averaging and Hodge invariants](#galois-average) |
| sigma-centralizer-change-of-representative | [Change of sigma-centralizer representative](#sigma-centralizer-conjugacy) |
| quasi-split-inner-form-and-inner-twisting | [ReductiveGroups · layer 7 structure theory](../../../content/tau-ceti/ReductiveGroups/README.md#layer-7-structure-theory) |
| newton-transfer-map | [Newton orbit space and rational dominance](#newton-orbit-space) |
| mu-sharp | [Galois averaging and Hodge invariants](#galois-average) |
| newton-transfer-compatible-with-pi1 | [Newton and Kottwitz invariants](#newton-and-kottwitz-maps) |
| elliptic-maximal-torus | [ReductiveGroups · layer 7 structure theory](../../../content/tau-ceti/ReductiveGroups/README.md#layer-7-structure-theory) |
| kottwitz-elliptic-torus-basic-image | [Elliptic tori and basic acceptable classes](#elliptic-torus-basic-image) |
| rr96-basic-is-minimal | [Representations detect Newton dominance](#representation-detects-dominance) |
| kottwitz-quasi-split-rational-newton-representative | [Rational Newton representative](#rational-newton-witness) |
| torus-admissibility | [Torus norm and Newton average](#torus-norm-description) |
| weil-restricted-adjoint-averaging | [ReductiveGroupsPartII:RG2.1](https://github.com/TauCetiProject/TauCetiRoadmap/blob/201bcaee1f4014c91897d50cdb7631fc6d6a6d71/TauCetiRoadmap/ReductiveGroupsPartII/README.md) |
| standard-levi-quasi-split | [ReductiveGroups · layer 7 structure theory](../../../content/tau-ceti/ReductiveGroups/README.md#layer-7-structure-theory) |
| central-cocharacter-nu-bJ | [Central Newton morphism of the centralizer](#central-newton-on-J) |
| wintenberger-cartan-coset-realisation | [ReductiveGroupsPartII:RG2.4](https://github.com/TauCetiProject/TauCetiRoadmap/blob/201bcaee1f4014c91897d50cdb7631fc6d6a6d71/TauCetiRoadmap/ReductiveGroupsPartII/README.md) |
| satake-levi-reduction | [ReductiveGroupsPartII:RG2.4](https://github.com/TauCetiProject/TauCetiRoadmap/blob/201bcaee1f4014c91897d50cdb7631fc6d6a6d71/TauCetiRoadmap/ReductiveGroupsPartII/README.md) |
| mazur-inequality-unramified | [ReductiveGroupsPartII:RG2.4](https://github.com/TauCetiProject/TauCetiRoadmap/blob/201bcaee1f4014c91897d50cdb7631fc6d6a6d71/TauCetiRoadmap/ReductiveGroupsPartII/README.md) |
| rational-parabolic-and-levi-in-quasi-split | [ReductiveGroups · layer 7 structure theory](../../../content/tau-ceti/ReductiveGroups/README.md#layer-7-structure-theory) |
| inner-twisted-levi-basic-classes | [Basic Levi Newton formula](#levi-newton-formula) |
| basic-levi-representative-from-transfer | [Specialness for a transferred centralizer torus](#transferred-torus-specialness) |
| remark-1-1-14-RV14 | [Minuscule basic Levi lifting](#minuscule-basic-levi-lift) |
| finiteness-of-B-G-mu | [Finiteness and the basic acceptable member](#admissible-finiteness-and-basic) |
| kottwitz-local-H1 | [EndoscopicTransferAndUnitaryTraceComparison:ET.0](../../../content/campaign/EndoscopicTransferAndUnitaryTraceComparison/README.md) |

## Source versions and corrections

Every source entry records its acquired URL, SHA-256 and the specific read sections. Author copies and preprints are distinguished from published versions. All statements and proof sketches are in our own words, with theorem, section and page locators. Legacy excerpts have been removed; the checker-required `printed` fields contain labelled paraphrases, not source transcriptions. Original review read dates remain provenance of that review; this revision does not claim to have reread every source. The published-text collation obligations are G11.

### FS — Geometrization of the local Langlands correspondence

Laurent Fargues, Peter Scholze. [author copy](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf). Read 2026-10-07. SHA-256: 9ab9efbd0df251bfa3b610d1d1d88a8dfb1bdf7c397bd04f4c277280d98ae905.

I.2 pp.10-11; I.4 pp.20-22; III.0-III.5 pp.87-106; IV.1 pp.107-114; V.3 pp.173-177. Statements and proof interiors inspected, with the external inputs below retained as requests/gaps.

### SW — Berkeley Lectures on p-adic Geometry

Peter Scholze, Jared Weinstein. [author copy](https://www.math.uni-bonn.de/people/scholze/Berkeley.pdf). Read 2026-10-07. SHA-256: 225505171ef809aa0070c023c881ff1da844923775f2d631474c0b42eea4bffc.

19.5, PDF188-191 = printed178-181; 22.4-22.6, PDF218-223 = printed208-213. Lecture23 boundary read but not replanned. Proposition18.3.1 and its proof: perfect-scheme v-functor full faithfulness, applied to clopen maps into the two-point scheme for FS CorollaryIII.2.8.

### Kot85 — Isocrystals with additional structure

Robert Kottwitz. [published](https://www.numdam.org/article/CM_1985__56_2_201_0.pdf). Read 2026-10-07. SHA-256: 51fe79cbe6798ea061128fd294c2459046572fcf5f7ed150c75d50e974819171.

Sections3-6, printed206-220; OCR formula omissions cross-checked against KMPS and Kot97; no claim of a new transcription of the damaged formula displays.

### Kot97 — Isocrystals with additional structure II

Robert Kottwitz. [author copy](https://people.dm.unipi.it/maffei/didattica/male/lacci/Kottwitz.pdf). Read 2026-10-07. SHA-256: 345b5feb633aa544930ede54c26a3bd673d17c69b4c490f3f40e0dd13a22e4db.

Sections4.1-4.17, pp.266-276; sections6.1-6.5 and7.7 used as classification/component proof inputs.

### RR96 — On the classification and specialization of F-isocrystals with additional structure

Michael Rapoport, Melanie Richartz. [published](https://www.numdam.org/article/CM_1996__103_2_153_0.pdf). Read 2026-10-07. SHA-256: 86acb9e18422e641d85f799262e1793614f705029a9cbd70dc0b03f74bcb13d8.

Sections1 and2, pp.160-166; Lemma2.2 representation criterion and Proposition2.4 read with rendered page166.

### Kot14 — B(G) for all local and global fields

Robert Kottwitz. [preprint](https://arxiv.org/pdf/1401.5728). Read 2026-10-07. SHA-256: 37c9980b749d315d014c5046f486ea9d8bac1acc3753fe766ae45ac7907f12a4.

Proposition10.4 pp.50-51: central torus extension, quotient B-set and restriction to basic elements.

### Ans19 — Reductive group schemes over the Fargues-Fontaine curve

Johannes Anschütz. [preprint](https://arxiv.org/pdf/1703.00700). Read 2026-10-07. SHA-256: c9e4a95792fb4c74fcba8e81286a1c80b8ff185d8e9025fef67e3f0e1baa3cb6.

Theorem3.11 and proof pp.14-16; Theorem6.5 and proof p.30.

### KMPS — Honda-Tate theory for Shimura varieties

Mark Kisin, Keerthi Madapusi Pera, Sug Woo Shin. [author copy](https://math.berkeley.edu/~swshin/HT.pdf). Read 2026-10-07. SHA-256: fd22990bc3eff8a726375cf8f0c9015828c39f1c32b0717347a9ef23ce9b52db.

Section1.1 pp.5-14, including decency, basic classes, transfer, minuscule Levi lifting and local specialness; section1.3.15 ordinary assertion checked against KZ and quaternion obstruction.

### KZ — Independence of l for Frobenius conjugacy classes attached to abelian varieties

Mark Kisin, Rong Zhou. [preprint](https://arxiv.org/pdf/2103.09945v2). Read 2026-10-07. SHA-256: 62d26eb931f271404c333c4b9a929e85239222788834cf16dcec1dff230c34c8.

Sections2.1.3-2.3.3 pp.7-12, including proofs of Lemmas2.1.7,2.1.9,2.2.6,2.2.8 and Proposition2.3.3. arXiv v2, not collated against the 2025 published edition.

### CS17 — On the generic part of the cohomology of compact unitary Shimura varieties

Ana Caraiani, Peter Scholze. [published](https://annals.math.princeton.edu/wp-content/uploads/annals-v186-n3-p01-p.pdf). Read 2026-10-07. SHA-256: 4f9449e5ecfd8fb8b43a04acef73060f531be995babaa9f744f3db36aaa5e61a.

Introduction Theorem1.11; section3.5 pp.687-691; section5.5 pp.747-749, Lemma5.5.8 and normalization footnote.

### CS24 — On the generic part of the cohomology of non-compact unitary Shimura varieties

Ana Caraiani, Peter Scholze. [preprint](https://arxiv.org/pdf/1909.01898v2). Read 2026-10-07. SHA-256: 803fc16ab30fa37fa1ce08c683885040c2034bbefc6ca6567e73026006229f2e.

Section2.7 pp.33-34, Theorem2.7.3 and its unitary ordinary comparison. arXiv v2, not a full published-version collation.

### Zhu17 — Affine Grassmannians and the geometric Satake in mixed characteristic

Xinwen Zhu. [published](https://annals.math.princeton.edu/wp-content/uploads/annals-v185-n2-p02-p.pdf). Read 2026-10-07. SHA-256: 5d50b415048f3a5ad14bccf1c8da83fc5a680fcf13b60911ca269daa474431a7.

Proposition1.21 p.427; section3.1.2 p.456; Remark3.6 and Lemma3.7 p.459.

### GLX — The connected components of affine Deligne-Lusztig varieties

Ian Gleason, Dong Gyu Lim, Yujie Xu. [published](https://link.springer.com/content/pdf/10.1007/s00222-025-01386-1.pdf). Read 2026-10-07. SHA-256: c40fe1fc5e0941812cf3aca5ba77c471ee49122c63ed7b0d864d322136031485.

Section2.2 pp.818-819; section3.7 pp.829-830, Lemma3.16; introduction component coset. Published PDF, not the older extraction page numbers.

### HK — Admissible pairs and p-adic Hodge structures II: the bi-analytic Ax-Lindemann theorem

Sean Howe, Christian Klevdal. [preprint](https://arxiv.org/pdf/2308.11064v2). Read 2026-10-07. SHA-256: c133b06bec1209a04f84d1c2984b78ce2242ba85fc1b72cf5a662002685cab8a.

Section6.2 pp.36-37, unique basic element of B(M,[mu^-1]); reductive specialization here. General nonreductive Hodge moduli are not claimed.

### LZ17 — Rigidity and a Riemann-Hilbert correspondence for p-adic local systems

Ruochuan Liu, Xinwen Zhu. [preprint](https://arxiv.org/pdf/1602.06282v3). Read 2026-10-07. SHA-256: 8b11e55bffbfb1835a6da8975272670c9465601c08640e06f3a566a459a1da79.

Corollary4.9 and Remark4.1 pp.33-34; theorem3.9 is imported from its owner.

### Kisin17 — Mod p points on Shimura varieties of abelian type

Mark Kisin. [author copy](https://people.math.harvard.edu/~kisin/dvifiles/lr.pdf?download=1). Read 2026-10-07. SHA-256: d3c19cddc9e8b073428de559a7215aae4f793490227b6c71d87477ccdb5d994a.

Sections1.2.1-1.2.12 pp.12-14; section2.1 pp.29-32; Lemma4.6.4 printed93. The integral reductive/unramified standing hypothesis is retained.

### vH24 — Mod p points on Shimura varieties of parahoric level

Pol van Hoften. [published](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/EC6F7AD8C8B489FEB8FC4D64485ABE1D/S2050508624000222a.pdf/mod_p_points_on_shimura_varieties_of_parahoric_level.pdf). Read 2026-10-07. SHA-256: d86da9a0e35c93d22df291979be37a5acf1ddc44fbd762e11f2a5f6c92961be0.

Section2.4.1 pp.23-24; Lemma3.4.2 and Corollary3.4.6 pp.34,36-37.

### He21 — Cordial elements and dimensions of affine Deligne-Lusztig varieties

Xuhua He. [published](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/5A27DBF48CAEF6DA56A313061848574C/S205050862100010Xa.pdf/cordial-elements-and-dimensions-of-affine-delignelusztig-varieties.pdf). Read 2026-10-07. SHA-256: d53843f0c8875cf1e14173ad271e025bd30f177fe319a7d83926629d454683dd.

Sections2.1-2.2 pp.4-5; section4.1 p.7; sections6.1-6.3 pp.13-14 including the nonbasic footnote.

### Vie21 — On Newton strata in the B_dR^+-Grassmannian

Eva Viehmann. [preprint](https://arxiv.org/pdf/2101.07510). Read 2026-10-07. SHA-256: 6170b63e81e3eb793fdce0a60bee1b3510717bd5a238c999266eb60cfa615c19.

Theorem1.1 and topology convention p.2; proof route in section6 is a precise proof-interior gap. arXiv v2 dated2023-03-04.

### HN18 — On the acceptable elements

Xuhua He, Sian Nie. [preprint](https://arxiv.org/pdf/1408.5836). Read 2026-10-07. SHA-256: 8377c0a45eb02125f819d30dffd64cc8209bda6208dec9e2b3989edf4569fe02.

Theorem0.1 and proof roadmap pp.1-2; combinatorial proof interiors are a named gap. arXiv v2 dated2016-10-20; KZ calls the published result Theorem1.1. Revision 2: §§1.1–1.4 pp.2–4, Theorem1.1(1); §§2.1–2.5 pp.4–8 and Appendix A pp.20–22 read on 2026-10-10. Chai external inputs are not claimed read. The general-field transfer is an explicit deduction, not a quotation of Theorem0.1.

### GIZ26 — Meromorphic vector bundles on the Fargues–Fontaine curve

Ian Gleason, Alexander B. Ivanov, Felix Zillinger. [arXiv:2307.00887v3, 14 May 2026; 62-page PDF, printed page equals PDF page.](https://arxiv.org/pdf/2307.00887v3). Read 2026-10-10. SHA-256: 78855695f8654374174073434eca08297751d397786b3abf29e367c9cc2cff23.

§2 and Remark2.1 pp.6–7; §7.3 pp.50–53, including Lemma7.17 and Theorem7.18 and its proof; Lemma7.11, Corollary7.12 and Theorem7.13 pp.45–47. Boundary-extension and external proof inputs remain G04/G06.

### He16 — Hecke algebras and p-adic groups

Xuhua He. [arXiv:1511.01386v3, 21 November 2016; survey version, not collated with the published edition cited by KZ.](https://arxiv.org/pdf/1511.01386v3). Read 2026-10-10. SHA-256: f6170c52ce24599a5b1b6d7991ae9c9b98a8be8e5cf8753b9a335e74d3fe3cdc.

§1.10.5, Theorem1.29 pp.20–21; §§2.2 and2.4–2.6 pp.22,25–28, including Theorems2.6,2.11 and2.12; §2.11.3–2.11.4 pp.42–43. §2.5 restricts the closure discussion to equal characteristic.

Continuation source read, Codex codex-1VC77g, 2026-10-10: FS III.1.1 and the tensor description pp.88–89, III.2.1–III.2.2 pp.89–90, and ExampleIII.4.4 pp.101–102 were reinspected in the recorded author copy (SHA-256 9ab9efbd0df251bfa3b610d1d1d88a8dfb1bdf7c397bd04f4c277280d98ae905). Other source reads retain their separately recorded inherited provenance.


### Zie15 — Graded and filtered fiber functors on Tannakian categories

Paul Ziegler. [arXiv:1111.1981v4; printed page equals PDF page. Not collated with the 2015 journal edition.](https://arxiv.org/pdf/1111.1981v4). Read 2026-10-10. SHA-256: 742e6ecb5be56cb3fc7c1b48a944ae0fdba91a0e8546f3ff61f6b6f57054ea9f.

Theorem1.3 p.2 and the Tannakian hypotheses in §§1–2 pp.1–5; Theorem4.6 and Definitions4.7–4.11 pp.22–23; Lemma4.12, Theorems4.13–4.16 and Lemmas4.17–4.22 pp.23–25; Proposition4.24, Lemma4.25 and Theorem4.26 with their proofs pp.26–27. The general fpqc-splitting proof in §5 is not claimed expanded.

### Iva23 — Arc-descent for the perfect loop functor and p-adic Deligne–Lusztig spaces

Alexander B. Ivanov. [arXiv:2003.04399v3, 3 September 2021; printed page equals PDF page. Not collated with the 2023 journal edition.](https://arxiv.org/pdf/2003.04399v3). Read 2026-10-10. SHA-256: 83407106dc3be635594040a9f6cab1a956aa05c0b05611b36e75067e65af549a.

§§2.1.1–2.1.2 pp.5–6, coefficient and finite-field Frobenius setup in both characteristics; Theorem5.1 and its proof route p.11; Corollary5.6 p.13; Lemmas5.8–5.9 and Proposition5.10 with their proofs pp.14–15. Perfectoid almost descent and the sousperfectoid comparison are retained as supplier inputs.

### Ans22 — Extending torsors on the punctured Spec(A_inf)

Johannes Anschütz. [arXiv:1804.06356v2, 21 October 2020; printed page equals PDF page. Not collated with the 2022 journal edition.](https://arxiv.org/pdf/1804.06356v2). Read 2026-10-10. SHA-256: 27c2e6fef2d1fd82ad825b087dbf19b1cd496b8bfc7a60ce6bdba8deaca08354.

§11, Lemmas11.1–11.3 and Theorem11.4 with proofs pp.33–36. Theorem9.10 on the rank-one punctured period ring and Steinberg Theorem7.1 are identified external inputs, not newly expanded here.

### HK22 — Point counting on Igusa varieties for function fields

Paul Hamacher, Wansu Kim. [arXiv:2208.01069v5, 21 August 2025; printed page equals PDF page. The normal-base hypothesis differs from v1.](https://arxiv.org/pdf/2208.01069v5). Read 2026-10-10. SHA-256: f060ee365ba1b6ba50b0c39cc086e1d87726643228ad001d6aa64fe7f54bb5c2.

Theorem1.1 p.2; §2.1 p.5 and §2.5 p.6; Lemmas2.8–2.9 pp.7–8; Proposition2.10 p.8 and Theorem2.11 with proof p.9. The latter two require a perfect normal base. Zink’s effective-lattice input and the tensor-line orbit-lifting step remain explicit proof obligations. Rechecked the rendered pp.8–9 for E08/E09: the Newton-only lattice bound and ambient-to-actual orbit factorization are proof issues, not established consequences of the cited source.

### Wed99 — Ordinariness in good reductions of Shimura varieties of PEL-type

Torsten Wedhorn. [Published Ann. Sci. École Norm. Sup. 32 (1999), 575–618; printed page = PDF page + 573.](https://www.numdam.org/article/ASENS_1999_4_32_5_575_0.pdf). Read 2026-10-10. SHA-256: 2d44cd511bd311580b110296ad118b39f2ede4173b7db68adbab188a9b7f57ba.

§1.6, Theorem1.6.3 and its first proof part pp.584–585 (PDF11–12); §§2.3.1–2.3.2, split and unramified unitary cocharacter calculations pp.588–589 (PDF15–16). The density theorem’s deformation proof in Chapters3–4 is not newly expanded.

### CGH20 — Shimura varieties at level Gamma_1(p^infinity) and Galois representations

Ana Caraiani, Daniel R. Gulotta, Chi-Yun Hsu, Christian Johansson, Lucia Mocz, Emanuel Reinecke, Sheng-Chi Shih. [arXiv:1804.00136v2, 25 July 2019; printed page equals PDF page. Published Compositio version not collated.](https://arxiv.org/pdf/1804.00136v2). Read 2026-10-10. SHA-256: 11d2c275c5dcf3bd715de9e4dc95ebcdb9884259cd7bc4fec01294b4bbf6cdc7.

§3.3, Proposition3.3.2 and proof pp.30–31. CS24’s Proposition3.3.8 locator is not the number in this read version. The source’s global hypothesis that p splits completely in the CM field is retained; extending its local closed-flag argument to the unramified CS24 datum is a separate comparison obligation.

### Sch15 — On torsion in the cohomology of locally symmetric varieties

Peter Scholze. [Published Annals of Mathematics 182 (2015), 945–1066; printed page = PDF page + 944.](https://annals.math.princeton.edu/wp-content/uploads/annals-v182-n3-p03-p.pdf). Read 2026-10-10. SHA-256: ebac854f47381c19a987b43b59d2c05cad55c3186c4d8cde067a7be0d06cbd16.

Lemma3.3.6 and Remark3.3.7 with proof pp.1006–1007 (PDF62–63); Lemma3.3.15 p.1011 (PDF67); Lemmas3.3.19–3.3.20 and their argument p.1013 (PDF69). The earlier canonical-subgroup and Hodge–Tate comparison inputs are not newly expanded.

HK22 version comparison, Codex codex-CxGyYK, 2026-10-10: [arXiv v1](https://arxiv.org/pdf/2208.01069v1), SHA-256 `6005d63c5f5b37b70cfb107429ccb92e61b5f739c745b2acf6da144cc5189cc5`, Theorem1.4 p.3, Proposition2.10 pp.7–8 and Theorem2.11 p.8 were compared with v5. The current theorem adds the perfect normal-base hypothesis. The v-stack argument uses valuation-ring v-covers and does not assert arbitrary-base profinite étale triviality. This is a version qualification, not a claim about a published erratum.

CGH20 locator comparison: the read v2 Proposition3.3.2 p.31 and the author copy Proposition3.3.2 p.29 (SHA-256 `1f1aa007d0d6972818273f15cfb242ba577d90dee1cd24892c68a6e0dbd60a37`) give the ordinary-period preimage. The CS24 Proposition3.3.8 citation is retained as a source-version boundary; the published CGH edition was not obtained. The unitary proof uses the read locator and retains its split-p scope.

### Corrections used by the declarations

- **BunGAndNewtonStrata/E01 (LZ17, gap):** The available de Rham tensor data determines a class for G^c. A class for G requires additional lifting data and a proof of its choice properties, or the hypothesis G=G^c. Locator: arXiv1602.06282v3; Remark4.1(iii),PDF34.

- **BunGAndNewtonStrata/E02 (GLX, error):** The torus valuation quotient is the inertia-coinvariant cocharacter lattice of T. Its map to π_1(G)_I can have a coroot kernel, so rational Kottwitz surjectivity requires the separate theorem. Locator: ProofLemma3.16(2),(3.23),p830; published57-page version, rendered page inspected unless stated otherwise.

- **BunGAndNewtonStrata/E03 (CS17, misprint):** For the order fixed on B(G), the Newton map is upper semicontinuous: locally b(y)≤b(x). Its finite image has constant κ, so upper unions are closed. This agrees with Corollary3.5.9 and Theorem1.11. Locator: §3.5, Proposition 3.5.7(1), p. 689, and the same word in its proof, p. 690 (also in arXiv v1).

- **BunGAndNewtonStrata/E04 (KMPS, misprint):** Decency uses exactly r factors b,σ(b),…,σ^(r−1)(b). After a change of representative by c, the last inverse is σ^r(c)^−1 and the right side is the conjugate by c of the integral Newton value. Locator: (1.1.2.2), p.6, in the author PDF https://math.berkeley.edu/~swshin/HT.pdf (41 pp., created 27 January 2021, SHA-256 fd22990b…52db), the latest version found; the published text, Duke Math. J. 171 (2022), 1559–1614, was not collated.

- **BunGAndNewtonStrata/E05 (KMPS, error):** Transport the cocharacter by the absolute Weyl group of a maximal torus in M. The quotient N_G(M)/M need not contain the required Weyl element; use the absolute-conjugacy conclusion of Proposition1.1.13. Locator: Corollary 1.1.15 and its proof, pp.11–12, in the author PDF https://math.berkeley.edu/~swshin/HT.pdf (41 pp., created 27 January 2021, SHA-256 fd22990b…52db), the latest version found; the published text, Duke Math. J. 171 (2022), 1559–1614, was not collated.

- **BunGAndNewtonStrata/E06 (KMPS, error):** The ordinary class is unique if it exists. For a quasi-split p-adic group its existence follows from the supplied theorem; for general inner forms existence must be assumed and can fail for a division-algebra multiplicative group. Density claims therefore need this existence or quasi-split hypothesis in addition to local integrality. Locator: §1.3.15, p.20; 41-page Berkeley author PDF SHA256 fd22990bc3eff8a726375cf8f0c9015828c39f1c32b0717347a9ef23ce9b52db; final Duke text not collated; also Introduction, Theorem 3, p.3 (the introduction's form of Corollary 1.3.16 / §1.3.15, p.20).

- **BunGAndNewtonStrata/E07 (KZ, misprint):** Dominance in rational cocharacter space uses nonnegative combinations of positive coroots. Roots have the wrong ambient lattice. Locator: §2.2.3 in arXiv2103.09945v2, printed10; the current Harvard author copy has the same phrase. Final Annals version not collated..

The 29 BG planets retain their reviewed names; the algebraic fundamental-group planet belongs to the existing upstream owner and is removed from BG. Coverage is partial for BG1, BG2 and BG2:uniformization, and planned for BG0, BG2:smooth-Artin, BG3 and BG4; none is closed. The independent needs_changes review remains in the packet for the next reviewer.

Source check: [Fargues–Scholze, Definition III.2.1 and Theorem III.2.2, printed pp.89–90](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), read 10 October 2026 by codex-vADPRt. SHA-256 9ab9efbd0df251bfa3b610d1d1d88a8dfb1bdf7c397bd04f4c277280d98ae905. This bounded read concerns the representative Frobenius and trivialization boundary; inherited source checks retain their own provenance.

Integral Kottwitz source check, Codex codex-pUspDa, 10 October 2026: KMPS §1.1.1–§1.1.2, printed pp.5–7, re-read in the recorded author copy (SHA-256 fd22990bc3eff8a726375cf8f0c9015828c39f1c32b0717347a9ef23ce9b52db). This supplies the p-adic invariant and torus-classification context; the abstract integral quotient argument above is a consumer construction, not a claim to have proved the reductive-group or general-E comparisons. Current upstream main 8acc80159cfd301db68bde9393a52668efdd8c8c and the pinned native coinvariant definitions were checked separately. No source passage is reproduced.

### Zin01 — On the slope filtration

Thomas Zink. [Bielefeld author copy](https://www.math.uni-bielefeld.de/~zink/slopes.pdf). Read 2026-10-10. SHA-256: cf94a433fe048706937a1326c87815fed96109dff45bd819d4ac38c3c9463a78. 19-page Bielefeld author copy, PDF creation date 23 January 2002. Author page numbers equal PDF pages; not the pagination of Duke Math. J. 109 (2001), 79–95. Published text not collated.

Proposition3 with proof author p.4; Lemma4 author pp.5–6; Lemma9 with proof and following height-bound remark author pp.11–12. The referenced Cartier-theory book was not read; existence of an effective lattice remains the linear slope-classification supplier input.

**BunGAndNewtonStrata/E08 (HK22, error):** Include the Frobenius denominator of the chosen lattice. Over a coefficient DVR with Frobenius preserving the DVR and fixing π, assume an effective lattice exists and ΦM0⊂π^(−d)M0 with d≥0. The minimal effective over-lattice is Σ_(i=0)^(h−1) Φ^i M0 for rank h, and lies in π^(−d(h−1))M0. This field-level repair does not remove the proper-cover or local-freeness obligations over general bases. Locator: arXiv2208.01069v5, proof of Lemma2.9, first paragraph p.8; not collated with the published edition.

Over an algebraically closed residue field, take rank two with Φ(x,y)=(σ(x)+π^(−N)σ(y),σ(y)) and standard M0. In equal characteristic choose a residue-field element u with u−u^q=1, which exists over the algebraic closure. The shear g=[[1,uπ^(−N)],[0,1]] satisfies b=g σ(g)^−1, so this is σ-conjugate to the identity and its Newton polygon is always (0,0). Any effective M containing M0 contains Φ(e2)−e2=π^(−N)e1. Containment in π^(−c)M0 therefore forces c≥N, while N is arbitrary. Zink author-copy Lemma9 pp.11–12 bounds the number of iterates by h−1 using a minimal stable lattice, the residue-field dimension and Nakayama; it does not bound these arbitrary input denominators. The subsequent height-only bound in his p-divisible-group setting uses its integral F,V structures.

**BunGAndNewtonStrata/E09 (HK22, gap):** Supply local continuous lifting for the actual Aut(V0) orbit map on the Frobenius-compatible tensor-line embeddings, with the required topology and all defining tensors preserved. Ambient GL(H) sections alone do not establish this input. Keep that lifting theorem as an unresolved supplier contract. Locator: arXiv2208.01069v5, proof of Theorem2.11, factorization diagram p.9; not collated with the published edition.

A section into GL(H) has no stated reason to land in Aut(V0). For a concrete membership control, the subgroup K={diag(t,t^−1)} of GL2(Q) sends (1,1) to (2,1/2) using t=2. The invertible matrix A=[[2,0],[−1/2,1]] also sends (1,1) to that vector, but A∉K. Thus even when a smaller-group lift exists, an ambient lift need not preserve its defining tensors. This control identifies the missing implication; it does not disprove local lifting for the particular isocrystal group or Theorem2.11.

These findings await independent verification. The bounded search checked the current arXiv history, publisher metadata, Wansu Kim’s publication page and title/identifier correction searches; no applicable correction was found. The published edition was not obtained. Neither finding is asserted present in that edition.
