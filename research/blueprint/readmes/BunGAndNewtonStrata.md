# Reductive bundles, B(G) and Newton strata

The Fargues–Fontaine curve turns a Frobenius module into a bundle. With a connected reductive structure group, this construction links the arithmetic classification of isocrystals to a moduli stack whose points are Newton classes, whose stabilizers include positive Banach–Colmez spaces, and whose local charts parametrize filtered extensions. The purpose of this roadmap is to build that link with its tensor structures, invariant maps and topology intact.

The stages cover algebraic G-isocrystals and torsors (BG0), integral Kottwitz and rational Newton invariants (BG1), the stack and uniformization (BG2:uniformization), its Artin smoothness (BG2:smooth-Artin), Newton strata and flag pullbacks (BG3), and filtered charts (BG4). BG2 is the aggregate of its two sublayers. VectorBundlesAndIsocrystals supplies the linear theory; RelativeFarguesFontaine supplies the curve and lattice patching; ReductiveGroups supplies general group theory. GeometricSatakeAndFusion supplies loop and Schubert geometry, VStackSheavesAndLisseCategories supplies Artin formalism and the Jacobian criterion, and IgusaVarietiesAndTorsionConcentration supplies the unitary PEL input for the specific flag dimension comparison.

## Conventions and reusable foundations

Let E be a nonarchimedean local field with residue field F_q, π a uniformizer, and L its completed maximal unramified extension. Choose an algebraic closure k of F_q. Frobenius σ is arithmetic q-Frobenius and fixes π. In mixed characteristic L is the fraction field of the ramified Witt vectors of k; when E=Q_p this agrees with Mathlib's WittVector.Isocrystal coefficient field. The p-adic statements of the routed papers retain E=Q_p or their explicitly stated p-adic extensions. Statements requiring a reductive integral model, a quasi-split form, a minuscule cocharacter or an unramified restriction of scalars retain those hypotheses.

The representation category Rep_E(G) means finite-dimensional rational algebraic-group representations. Tau Ceti already supplies FGPointRepresentationCat, its rigid symmetric monoidal equivalence with finite comodules and the field-valued Tannakian reconstruction of algebra-valued points. A representation of the abstract group G(E) is insufficient. Exact tensor functors preserve bundle short exact sequences, tensor products, the unit and duals. Isomorphisms are tensor natural isomorphisms, not just identifications of a faithful vector space. The relative analytic reconstruction theorem is an additional assertion.

The slope protorus D has character group Q. A rank-one isocrystal with Frobenius π^m has isocrystal slope m and produces O(−m). For dominant Newton vectors the bundle convention is ν_bundle=w₀(−ν_isocrystal); the first Chern invariant is −κ. For GL_n we order slopes in decreasing order and compare partial sums with equal total. Dominance uses positive **coroots** in a rational cocharacter space.

We use b′=g b σ(g)⁻¹ for sigma conjugacy. The inverse-g convention in several sources gives the same quotient. The representative Kottwitz map takes values in π₁(G)_I; the class invariant takes values in the full Galois coinvariants π₁(G)_Γ. Rational averaging relates κ⊗1 to ν, and loses integral torsion. The order on B(G) fixes κ and increases dominant ν. Its topology satisfies [b]≤[b′] exactly when E_b′ is in the closure of E_b; a basic point generalizes to more unstable points in its κ fibre. A rational Newton orbit need not have an E-rational representative inside G. Its central morphism inside J_b does descend for every b.

For the bundle moduli, tildeJ_b is the full automorphism v-group. Its positive Banach–Colmez kernel has dimension ⟨2ρ,ν_b⟩; the stratum has the negative dimension. The chart uses the opposite extension filtration and negative-slope extension spaces. The framed chart is not an absolute diamond, although its punctured complement is locally spatial and its map to the point is representable in locally spatial diamonds. The chart quotient is an Artin v-stack. These absolute and relative assertions are distinct. For ℓ-cohomological assertions fix a prime ℓ≠p. The separate finite-coefficient curve comparison treats p-torsion by tilting and Artin–Schreier theory.

The required general z-extension foundation is requested once as proposed ReductiveGroupsPartII RG2.6. Its contracts are induced-torus central kernels, simply connected derived group, induced-torus resolutions and lattice exactness. The current RG2.5 concerns dual/L-group data and supplies none of these conclusions by itself. BG1 owns the B-set consequences; ET.0 owns the relevant cohomology. The algebraic BG0/BG1 classification uses no analytic RF4 patching. The whole-stack Artin proof uses uniformization, open Schubert cells and VS0, and the chart proof then consumes VS1. This order keeps those proofs independent of Satake and sheaf-category compact generation.

## Stage targets

The declarations below specify definitions, APIs, proof chains and discriminating tests. Every implementation status is unchecked. The pass plans every target in all seven stages; the precise proof and formulation refinements at the end determine the follow-up work before any stage can be called closed.

| Stage | Planned declarations | Planets |
|---|---:|---:|
| BunGAndNewtonStrata:BG0 | 17 | 6 |
| BunGAndNewtonStrata:BG1 | 35 | 6 |
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

**Prerequisites.** [ReductiveGroups · layer 1 representations  comodules](../../../content/tau-ceti/ReductiveGroups/README.md#layer-1-representations--comodules); [VectorBundlesAndIsocrystals:VB1](../../../content/campaign/VectorBundlesAndIsocrystals/README.md); [CategoryTheory.Functor.Monoidal](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/CategoryTheory/Monoidal/Functor.lean); [TauCeti.FGPointRepresentationCat](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Algebra/AlgebraicGroup/Representation/Comodule/Equivalence.lean); [TauCeti.FGPointRepresentationCat.instRigidCategory](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Algebra/AlgebraicGroup/Representation/Comodule/Monoidal.lean).

**Proof/construction.** (1) Use the rational representation category supplied by ReductiveGroups and the exact tensor category of vector bundles supplied by VB1. (2) Construct the groupoid by retaining tensor isomorphisms and the specified exact structure.

**API.**

| Declaration | Role | Contract |
|---|---|---|
| TauCeti.BunG.GBundle.trivial | constructor | The standard fibre functor V↦V⊗_E O_X defines the trivial G-bundle. |
| TauCeti.BunG.GBundle.evaluate | projection | For each rational representation V, evaluate a G-bundle to a bundle of rank dim_E V; tensor and dual comparisons are natural. |
| TauCeti.BunG.GBundle.tensorIso | characterisation | An isomorphism consists of invertible natural maps preserving the unit and tensor constraints. |
| TauCeti.BunG.GBundle.pullback | functoriality | For f:Y→X, bundle pullback gives f* on G-bundles, with coherent identity and composition isomorphisms. |

**Discriminating unit tests.**

- **TauCeti.BunG.GBundle.testGL1** (compatibility): For G=G_m, evaluation at the standard character identifies G-bundles with line bundles.
- **TauCeti.BunG.GBundle.testTrivial** (degenerate): For G=1 the G-bundle groupoid has one object up to a unique isomorphism.
- **TauCeti.BunG.GBundle.testNoFaithfulChoice** (non-example): For GL_2 the standard and standard-plus-determinant faithful realizations recover isomorphic torsors; independent unrelated bundles do not define a tensor functor.

**Uses.** FS III.1-III.5: Evaluation is the interface for HN theory, Isom sheaves and inner twisting. LZ17 Corollary4.9: An exact rational tensor functor produces the de Rham torsor.

**Acceptance.** GL_n gives rank-n vector bundles and their isomorphisms.

**Sources.** [Geometrization of the local Langlands correspondence](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), After III.1.1 p.88.

**Atlas planet:** G-bundle.

<a id="g-torsors-three-descriptions"></a>

### Tannakian description of analytic torsors

**Theorem: TauCeti.BunG.GTorsorsThreeDescriptions.** For X sousperfectoid over E and reductive G/E, geometric étale-locally trivial G-torsors, étale sheaf G-torsors, and G-bundles are naturally equivalent categories. Hence their isomorphism classes identify with H¹_et(X,G). The scheme version is fpqc/fppf, with étale comparison for smooth G; do not transplant a scheme statement to an arbitrary adic space.

**Prerequisites.** [G-bundles as exact tensor functors](#g-bundle); [AlgebraicModuliForArithmeticGeometry:R09.3](../../../content/campaign/AlgebraicModuliForArithmeticGeometry/README.md); [ReductiveGroups · layer 7 structure theory](../../../content/tau-ceti/ReductiveGroups/README.md#layer-7-structure-theory); [CategoryTheory.Equivalence](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/CategoryTheory/Equivalence.lean); [TauCeti.Tannaka.fgPointTensorIsoEquiv](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Algebra/AlgebraicGroup/Representation/Tannaka/Equivalence.lean).

**Proof/construction.** (1) Apply SW19.5.2 in the sousperfectoid setting; sections and associated bundles give the first two functors. (2) Recover the torsor from the tensor functor using the regular representation as a filtered colimit; exactness gives faithful flatness. (3) Use smooth torsor descent for the fpqc/étale comparison on schemes.

**Acceptance.** GL_n frame bundles and G_m line bundles. The 2020 SW scheme theorem is19.5.1; the adic theorem is19.5.2.

**Sources.** [Geometrization of the local Langlands correspondence](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), III.1.1 p.88; [Berkeley Lectures on p-adic Geometry](https://www.math.uni-bonn.de/people/scholze/Berkeley.pdf), Theorems19.5.1 and19.5.2, printed178-180.

<a id="structure-group-and-tensor-descent"></a>

### Structure group and tensor descent

**Theorem: TauCeti.BunG.StructureGroupAndTensorDescent.** For a morphism f:G→H of connected reductive E-groups, extending a G-bundle is precomposition by restriction Rep(H)→Rep(G); it agrees with contracted product of torsors, commutes with base change and respects identity/composition. Tensor isomorphisms descend effectively for étale covers. Reconstruction by any faithful rational representation with its defining tensors gives the same torsor.

**Prerequisites.** [Tannakian description of analytic torsors](#g-torsors-three-descriptions); [ReductiveGroups · layer 1 representations  comodules](../../../content/tau-ceti/ReductiveGroups/README.md#layer-1-representations--comodules); [AlgebraicModuliForArithmeticGeometry:R09.3](../../../content/campaign/AlgebraicModuliForArithmeticGeometry/README.md).

**Proof/construction.** (1) Transport contracted products and effective smooth torsor descent across the comparison. (2) Tensor restriction composes contravariantly; torsor extension composes covariantly. (3) Use the regular representation reconstruction to compare faithful presentations.

**Acceptance.** Determinant GL_n→G_m gives the determinant line. No use of RF4 patching occurs in this node.

**Sources.** [Berkeley Lectures on p-adic Geometry](https://www.math.uni-bonn.de/people/scholze/Berkeley.pdf), Proof19.5.2 printed179-180; [Rigidity and a Riemann-Hilbert correspondence for p-adic local systems](https://arxiv.org/pdf/1602.06282v3), Corollary4.9 printed33.

<a id="g-isocrystals-and-B-of-G"></a>

### G-isocrystals

**Definition: TauCeti.BunG.GIsocrystal.** A G-isocrystal over L=breve E is an exact E-linear tensor functor Rep_E(G)→Isoc_E, with tensor isomorphisms as arrows. After trivializing its underlying L-fibre functor, Frobenius is bσ for b∈G(L). Steinberg triviality over L permits such a trivialization; it is a choice, not part of the definition.

**Prerequisites.** [VectorBundlesAndIsocrystals:VB0/tensor-and-dual-slopes](../../../content/campaign/VectorBundlesAndIsocrystals/README.md); [VectorBundlesAndIsocrystals:VB0/isocrystal-category-and-standard-block](../../../content/campaign/VectorBundlesAndIsocrystals/README.md); [ReductiveGroups · layer 1 representations  comodules](../../../content/tau-ceti/ReductiveGroups/README.md#layer-1-representations--comodules); [ReductiveGroups · layer 7 structure theory](../../../content/tau-ceti/ReductiveGroups/README.md#layer-7-structure-theory); [WittVector.Isocrystal](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/WittVector/Isocrystal.lean); [CategoryTheory.Functor.Monoidal](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/CategoryTheory/Monoidal/Functor.lean); [TauCeti.FGPointRepresentationCat](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Algebra/AlgebraicGroup/Representation/Comodule/Equivalence.lean); [TauCeti.FGPointRepresentationCat.instRigidCategory](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Algebra/AlgebraicGroup/Representation/Comodule/Monoidal.lean).

**Proof/construction.** (1) Use the exact tensor category of finite E-isocrystals from VB0. (2) Apply the reductive fibre-functor/torsor dictionary over L and Steinberg vanishing; changing the trivialization changes b by sigma conjugation.

**API.**

| Declaration | Role | Contract |
|---|---|---|
| TauCeti.BunG.GIsocrystal.ofRepresentative | constructor | The object from b sends ρ to (Vρ⊗_E L,ρ(b)σ). |
| TauCeti.BunG.GIsocrystal.forget | projection | Forget Frobenius to the underlying L-fibre functor; retain its tensor constraints. |
| TauCeti.BunG.GIsocrystal.changeTrivialization | equivalence | A change g of trivialization identifies the representatives b and g b σ(g)^−1. |
| TauCeti.BunG.GIsocrystal.map | functoriality | A group morphism carries b to f(b) and agrees with precomposition of rational representations. |

**Discriminating unit tests.**

- **TauCeti.BunG.GIsocrystal.testGLn** (compatibility): For GL_n with E=Q_p this agrees with finite-dimensional WittVector.Isocrystal over k=bar F_p, after fixing the coefficient identification.
- **TauCeti.BunG.GIsocrystal.testUnit** (degenerate): b=1 gives standard Frobenius on each representation.
- **TauCeti.BunG.GIsocrystal.testTensorSlope** (computation): For G_m representatives π^a and π^b, tensoring has slope a+b and duality has slope −a.

**Uses.** FS III.2.2: Provides representatives for geometric classification. IG.0 and ET.5: Supplies the algebraic structured isocrystal without analytic uniformization inputs.

**Acceptance.** Underlying vector spaces are over L, not E.

**Sources.** [Geometrization of the local Langlands correspondence](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), III.2.1 p.89; [Berkeley Lectures on p-adic Geometry](https://www.math.uni-bonn.de/people/scholze/Berkeley.pdf), Definition22.4.1 printed208.

**Atlas planet:** G-isocrystal.

<a id="sigma-conjugacy-quotient"></a>

### Kottwitz set B(G)

**Definition: TauCeti.BunG.SigmaClass.** B(G)=G(L)/~ where b~bprime iff bprime=g b σ(g)^−1 for some g∈G(L). Here σ is arithmetic q-Frobenius fixing E and its uniformizer. This orbit quotient is the set of isomorphism classes of G-isocrystals; the groupoid itself retains automorphisms.

**Prerequisites.** [G-isocrystals](#g-isocrystals-and-B-of-G); [Subgroup](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Group/Subgroup/Defs.lean); [MulEquiv](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Group/Equiv/Defs.lean).

**Proof/construction.** (1) Check that twisted conjugation is a group action; its orbit relation is reflexive, symmetric and transitive. (2) Transport the change-of-trivialization formula from G-isocrystals to identify the quotient.

**API.**

| Declaration | Role | Contract |
|---|---|---|
| TauCeti.BunG.SigmaClass.mk | constructor | Send b∈G(L) to its sigma class. |
| TauCeti.BunG.SigmaClass.mk_eq_iff | characterisation | Two representative classes are equal precisely when a sigma conjugator exists. |
| TauCeti.BunG.SigmaClass.map | functoriality | A σ-compatible group homomorphism gives B(G)→B(H), with identity and composition laws. |
| TauCeti.BunG.SigmaClass.lift | universal-property | Every function on G(L) invariant under twisted conjugation descends uniquely to B(G). |

**Discriminating unit tests.**

- **TauCeti.BunG.SigmaClass.testGL1** (computation): For split G_m, valuation gives B(G_m)≅Z.
- **TauCeti.BunG.SigmaClass.testIdentitySigma** (compatibility): With σ the identity the orbit relation is ordinary conjugacy.
- **TauCeti.BunG.SigmaClass.testCommutative** (non-example): For an abelian group the relation is multiplication by g/σ(g), not equality unless σ is trivial.

**Uses.** KMPS1.1 and GLX2.2: Provides the invariant quotient used by acceptable classes. ET.5: Imports the structured local classes and algebraic centralizers.

**Acceptance.** Both g b σ(g)^−1 and g^−1 b σ(g) conventions give the same orbit relation.

**Sources.** [Cordial elements and dimensions of affine Deligne-Lusztig varieties](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/5A27DBF48CAEF6DA56A313061848574C/S205050862100010Xa.pdf/cordial-elements-and-dimensions-of-affine-delignelusztig-varieties.pdf), Section2.1 p.4.

**Atlas planet:** Kottwitz set.

<a id="sigma-centralizer-J-b"></a>

### Algebraic sigma-centralizer

**Construction: TauCeti.BunG.SigmaCentralizer.** For b∈G(L), J_b is the reductive E-group representing A↦{g∈G(A⊗_E L):g b=b σ(g)}. Its L-base change is the centralizer M_b of ν_b. It is an inner form of the corresponding Levi in the quasi-split inner form G*, and is an inner form of G* precisely when b is basic. Descent uses the semilinear action Ad(b)σ on M_b.

**Prerequisites.** [G-isocrystals](#g-isocrystals-and-B-of-G); [Newton and Kottwitz invariants](#newton-and-kottwitz-maps); [ReductiveGroups · layer 7 structure theory](../../../content/tau-ceti/ReductiveGroups/README.md#layer-7-structure-theory); [AlgebraicModuliForArithmeticGeometry:R09.3](../../../content/campaign/AlgebraicModuliForArithmeticGeometry/README.md); [TauCeti.ReductiveAffineGroupSchemeCat](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/AlgebraicGeometry/AffineGroupScheme/Reductive.lean); [Subgroup](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Group/Subgroup/Defs.lean).

**Proof/construction.** (1) Construct ν_b from the representation slope grading, giving the Levi centralizer after base change. (2) Restrict Ad(b)σ to this centralizer; decency makes descent effective over a finite unramified extension. (3) Use reductive-group descent to represent the fixed-point functor and compare its rational points with tensor automorphisms.

**API.**

| Declaration | Role | Contract |
|---|---|---|
| TauCeti.BunG.SigmaCentralizer.points | characterisation | For every E-algebra A, membership is exactly g b=b σ(g). |
| TauCeti.BunG.SigmaCentralizer.baseChange | compatibility | J_b⊗_E L≅Z_(G_L)(ν_b), with the descended semilinear datum. |
| TauCeti.BunG.SigmaCentralizer.conjugate | equivalence | For bprime=g b σ(g)^−1, h↦g h g^−1 induces J_b≅J_bprime. |
| TauCeti.BunG.SigmaCentralizer.autIsocrystal | equivalence | J_b(E) is the tensor automorphism group of the G-isocrystal defined by b. |

**Discriminating unit tests.**

- **TauCeti.BunG.SigmaCentralizer.testTrivial** (degenerate): J_1(E)=G(E).
- **TauCeti.BunG.SigmaCentralizer.testBasicGL2** (computation): For the simple GL_2 slope1/2 block, J_b(E)=D_(1/2)^×; two copies give GL_2(D_(1/2)).
- **TauCeti.BunG.SigmaCentralizer.testNonbasic** (non-example): For GL_2 slopes0,1, the algebraic J_b is G_m×G_m, while the bundle automorphism v-group also has a positive-slope kernel.

**Uses.** FS III.4-III.5: Gives the discrete quotient of bundle automorphisms and pure inner twisting. He21 section2.2: Provides the F-rank used in defect. Kisin17 Lemma4.6.4: Its rational Kottwitz image controls component actions.

**Acceptance.** For b=1, J_b(E)=G(E). For a simple rank-h slope a/h block, J_b is D_(a/h)^×; multiplicity m gives GL_m(D), not a division algebra of rank mh.

**Sources.** [Isocrystals with additional structure II](https://people.dm.unipi.it/maffei/didattica/male/lacci/Kottwitz.pdf), Sections4.3-4.4 pp.267-268; [Mod p points on Shimura varieties of abelian type](https://people.math.harvard.edu/~kisin/dvifiles/lr.pdf?download=1), 1.2.12 printed14.

**Atlas planet:** Sigma-centralizer.

<a id="sigma-centralizer-conjugacy"></a>

### Change of sigma-centralizer representative

**Lemma: TauCeti.BunG.SigmaCentralizerConjugacy.** If bprime=g b σ(g)^−1 then conjugation h↦g h g^−1 induces an E-group isomorphism J_b≅J_bprime and identifies their tensor automorphism actions. The transport is compatible with products of changes of trivialization.

**Prerequisites.** [Algebraic sigma-centralizer](#sigma-centralizer-J-b).

**Proof/construction.** (1) Substitute the twisted-conjugacy equation into the pointwise fixed equation. (2) Apply representability and descent to identify the natural functor isomorphism.

**Acceptance.** The map on J_b(E) uses g, not σ(g), on both sides.

**Sources.** [Honda-Tate theory for Shimura varieties](https://math.berkeley.edu/~swshin/HT.pdf), Section1.1.2 p.6.

<a id="decent-representative"></a>

### Decent representative

**Definition: TauCeti.BunG.DecentRepresentative.** For a positive integer r and b∈G(L), require rν_b to be integral and (bσ)^r=(rν_b)(π)σ^r in G(L)⋊<σ>. Equivalently b σ(b)⋯σ^(r−1)(b)=(rν_b)(π), exactly r factors. A decent representative admits finite unramified descent; the definition excludes r=0.

**Prerequisites.** [Newton and Kottwitz invariants](#newton-and-kottwitz-maps); [ReductiveGroups · layer 7 structure theory](../../../content/tau-ceti/ReductiveGroups/README.md#layer-7-structure-theory).

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

**Sources.** [The connected components of affine Deligne-Lusztig varieties](https://link.springer.com/content/pdf/10.1007/s00222-025-01386-1.pdf), Definition2.3 p.819; [Honda-Tate theory for Shimura varieties](https://math.berkeley.edu/~swshin/HT.pdf), Section1.1.2 equations and decency p.6.

**Atlas planet:** Decent representative.

<a id="existence-of-decent-representative"></a>

### Existence of decent representatives

**Theorem: TauCeti.BunG.ExistenceOfDecentRepresentative.** Every class of B(G) has a decent representative for some sufficiently divisible positive r. In the mixed-characteristic GLX setting r can be enlarged so G is quasi-split over E_r and the representative has the chosen dominant Newton map.

**Prerequisites.** [Decent representative](#decent-representative); [Kottwitz set B(G)](#sigma-conjugacy-quotient); [ReductiveGroups · layer 7 structure theory](../../../content/tau-ceti/ReductiveGroups/README.md#layer-7-structure-theory).

**Proof/construction.** (1) Use the slope cocharacter, a splitting extension and the Kottwitz descent construction. (2) Enlarge r to clear slope denominators and descent periods. (3) Conjugate over E_r to the chosen chamber; dominance here requires the quasi-split base change.

**Acceptance.** For a coprime slope a/h simple block choose a period divisible by h.

**Sources.** [The connected components of affine Deligne-Lusztig varieties](https://link.springer.com/content/pdf/10.1007/s00222-025-01386-1.pdf), Paragraph4 after Definition2.3 p.819; [Isocrystals with additional structure](https://www.numdam.org/article/CM_1985__56_2_201_0.pdf), Section4.3 printed213-214.

<a id="defect"></a>

### Defect of a sigma class

**Definition: TauCeti.BunG.Defect.** For the connected reductive local group G and its algebraic sigma-centralizer J_b, def_G(b)=rank_E G−rank_E J_b as an integer. The ranks are split ranks over E, not absolute ranks over L and not dimensions of topological point groups.

**Prerequisites.** [Algebraic sigma-centralizer](#sigma-centralizer-J-b); [ReductiveGroupsPartII:RG2.1](../../../content/campaign/ReductiveGroupsPartII/README.md).

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

**Sources.** [Cordial elements and dimensions of affine Deligne-Lusztig varieties](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/5A27DBF48CAEF6DA56A313061848574C/S205050862100010Xa.pdf/cordial-elements-and-dimensions-of-affine-delignelusztig-varieties.pdf), Section2.2 p.5.

<a id="pure-inner-twisting"></a>

### Pure inner twisting of torsors

**Theorem: TauCeti.BunG.PureInnerTwisting.** For a group sheaf H on a site and an H-torsor T, put H_T=Aut_H(T). The bitorsor T induces an equivalence between H-torsors and H_T-torsors by S↦Isom_H(S,T), with the inverse contracted product. Applied on the curve, this is an equivalence of the actual torsor groupoids, not just of isomorphism classes.

**Prerequisites.** [Tannakian description of analytic torsors](#g-torsors-three-descriptions); [AlgebraicModuliForArithmeticGeometry:R09.3](../../../content/campaign/AlgebraicModuliForArithmeticGeometry/README.md); [DiamondsAndVStacks:D3](../../../content/campaign/DiamondsAndVStacks/README.md).

**Proof/construction.** (1) Construct the left/right commuting bitorsor actions and the evaluation/counit isomorphisms. (2) Descend the local trivializations to establish quasi-inverse functors.

**Acceptance.** An untrivialized torsor does not yield a canonical isomorphism H_T≅H.

**Sources.** [Geometrization of the local Langlands correspondence](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), III.4.1 p.100.

<a id="basic-inner-form-bundle-equivalence"></a>

### Basic inner form equivalence

**Theorem: TauCeti.BunG.BasicInnerFormBundleEquivalence.** For basic b, the curve group Aut_G(E_b) is J_b×_E X. Pure inner twisting therefore gives Bun_G≃Bun_(J_b), compatible with perfectoid base change and carrying E_b to the trivial J_b-bundle.

**Prerequisites.** [Pure inner twisting of torsors](#pure-inner-twisting); [Algebraic sigma-centralizer](#sigma-centralizer-J-b); [VectorBundlesAndIsocrystals:VB1/isocrystal-to-bundle-functor](../../../content/campaign/VectorBundlesAndIsocrystals/README.md).

**Proof/construction.** (1) For a basic slope cocharacter the adjoint isocrystal has only slope0; its bundle is the descended J_b group. (2) Apply the torsor equivalence relatively.

**Acceptance.** For nonbasic b the curve automorphism group has a nonconstant positive part; this statement does not apply.

**Sources.** [Geometrization of the local Langlands correspondence](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), III.4.2 andIII.4.3 pp.100-101.

<a id="division-algebra-morita"></a>

### Division-algebra Morita comparison

**Comparison: TauCeti.BunG.DivisionAlgebraMorita.** For a simple isocrystal of slope λ=a/h and division algebra D_λ/E of invariant λ, J_b≅D_λ^×. Twisting GL_h-bundles by E_b identifies them with bundles of rank1 right D_λ-modules; m copies give GL_m(D_λ). The comparison is Morita/torsor equivalence, not an E-group isomorphism GL_h≅D_λ^×.

**Prerequisites.** [Basic inner form equivalence](#basic-inner-form-bundle-equivalence); [VectorBundlesAndIsocrystals:VB0/dieudonne-manin-isocrystals](../../../content/campaign/VectorBundlesAndIsocrystals/README.md); [ReductiveGroups · layer 7 structure theory](../../../content/tau-ceti/ReductiveGroups/README.md#layer-7-structure-theory).

**Proof/construction.** (1) Use End of a simple slope block from VB0 and its induced curve Azumaya algebra. (2) Apply basic inner twisting and the module/torsor dictionary.

**Acceptance.** The quaternion slope1/2 example has h=2; its E-points differ from GL_2(E).

**Sources.** [Geometrization of the local Langlands correspondence](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), ExampleIII.4.4 p.101.

<a id="families-of-g-isocrystals"></a>

### Families of G-isocrystals

**Definition: TauCeti.BunG.GIsocrystalFamily.** For a perfect F_q-algebra R, put L_R=R((t)) in equal characteristic and L_R=W_(O_E)(R)[1/π] in mixed characteristic. A family is a G-torsor on Spec L_R with a Frobenius descent isomorphism. This is a groupoid-valued prestack on perfect schemes; it is distinct from the geometric groupoid G-Isoc and from Bun_G on perfectoid spaces.

**Prerequisites.** [G-isocrystals](#g-isocrystals-and-B-of-G); [AlgebraicModuliForArithmeticGeometry:R09.3](../../../content/campaign/AlgebraicModuliForArithmeticGeometry/README.md); [VectorBundlesAndIsocrystals:VB0](../../../content/campaign/VectorBundlesAndIsocrystals/README.md); [DiamondsAndVStacks:D3](../../../content/campaign/DiamondsAndVStacks/README.md).

**Proof/construction.** (1) Use the coefficient-ring and Frobenius construction from the linear supplier. (2) Form equivariant torsors and their isomorphisms; pullback acts on both the torsor and its descent datum.

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

**Sources.** [Geometrization of the local Langlands correspondence](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), I.2 pp.10-11.

**Atlas planet:** Families of G-isocrystals.

<a id="isocrystal-family-v-descent"></a>

### Isocrystal-family v-descent and strata

**Theorem: TauCeti.BunG.IsocrystalFamilyVDescent.** The G-isocrystal family prestack is a v-stack on perfect F_q-schemes. It has locally closed geometric-class strata indexed by B(G), each equivalent to [*/J_b(E)] for the locally profinite rational-point group. This is the family stack statement of FS I.2.1; the algebraic classifying stack [*/J_b] and the bundle stratum with its full automorphisms are different objects.

**Prerequisites.** [Families of G-isocrystals](#families-of-g-isocrystals); [Algebraic sigma-centralizer](#sigma-centralizer-J-b); [DiamondsAndVStacks:D3](../../../content/campaign/DiamondsAndVStacks/README.md); [AlgebraicModuliForArithmeticGeometry:R09.3](../../../content/campaign/AlgebraicModuliForArithmeticGeometry/README.md).

**Proof/construction.** (1) Use coefficient-ring torsor v-local triviality and v-descent, then the twisted loop quotient. (2) Use the representation Newton criterion and integral κ-local-constancy to construct locally closed loci. (3) Apply the family isotriviality theorem in the source’s cited HK22 general case to identify each stratum.

**Acceptance.** This named theorem is planned; the three cited original proof interiors are precise source gaps.

**Sources.** [Geometrization of the local Langlands correspondence](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), TheoremI.2.1 p.11.

<a id="finite-frobenius-norm-centralizer"></a>

### Finite Frobenius norm centralizer

**Comparison: TauCeti.BunG.FiniteFrobeniusNormCentralizer.** For the degree-r unramified extension K_0/Q_p, δ∈G(K_0), σ^r=id, and γ=δσ(δ)⋯σ^(r−1)(δ), the algebraic twisted centralizer functor defined by δσ(g)=gδ becomes Z_G(γ) after base change to K_0. Extending the coefficient field from degree r to degree rn defines I_(p,n); after extension to L its centralizer is Z_G(γ^n). The norm of δ^n is not substituted for this iterated twisted product. This finite-period comparison is distinct from the infinite-coefficient Newton Levi J_δ.

**Prerequisites.** [Algebraic sigma-centralizer](#sigma-centralizer-J-b); [ReductiveGroups · layer 7 structure theory](../../../content/tau-ceti/ReductiveGroups/README.md#layer-7-structure-theory); [AlgebraicModuliForArithmeticGeometry:R09.3](../../../content/campaign/AlgebraicModuliForArithmeticGeometry/README.md).

**Proof/construction.** (1) Iterate the twisted equation r times to obtain centralization of γ. (2) On Z_G(γ), Ad(δ)σ has period r; perform finite Galois descent. (3) Compare the point functors after K_0 base change. (4) For the enlarged coefficient field, (δσ)^(rn)=γ^nσ^(rn); apply the same finite descent.

**Acceptance.** No general equality Z_G(γ)=Z_G(ν_b) is asserted.

**Sources.** [Mod p points on Shimura varieties of abelian type](https://people.math.harvard.edu/~kisin/dvifiles/lr.pdf?download=1), Section2.1.2 printed29.

<a id="central-newton-on-J"></a>

### Central Newton morphism of the centralizer

**Construction: TauCeti.BunG.CentralNewtonOnJ.** For every b∈G(L), the slope morphism ν_b, viewed in the center of its geometric centralizer, descends through the defining Frobenius descent datum to an E-rational central morphism ν_(b,J):D→J_b. No rational representative of ν_b inside G is needed. For a positive multiple N clearing its denominators, Nν_(b,J) is an integral cocharacter and U_π=(Nν_(b,J))(π) belongs to J_b(E).

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

**Sources.** [Geometrization of the local Langlands correspondence](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), PropositionV.3.6 p.175.

## BG1 — Kottwitz and Newton invariants

Construct integral π₁ and its coinvariants alongside the rational slope orbit. Prove the two-invariant classification before using the fixed-κ order or acceptable and ordinary classes. The Levi, torus, affine-Weyl and z-extension comparisons preserve the stated local and integral hypotheses.

<a id="family-kottwitz-local-constancy"></a>

### Kottwitz invariant in isocrystal families

**Theorem: TauCeti.BunG.FamilyKottwitzLocalConstancy.** For an F_q-scheme S with a G-isocrystal family, the function s↦κ(E_s) in π_1(G)_Γ is locally constant. Perfectifying S preserves the relevant topology. Analytify the family to the curve and apply bundle κ-local-constancy; this establishes the routed FS III.2.8 assertion without assuming it in the family v-descent proof.

**Prerequisites.** [Families of G-isocrystals](#families-of-g-isocrystals); [Local constancy of bundle Kottwitz invariant](#semicontinuity-and-local-constancy); [VectorBundlesAndIsocrystals:VB1/isocrystal-to-bundle-functor](../../../content/campaign/VectorBundlesAndIsocrystals/README.md); [DiamondsAndVStacks:D3](../../../content/campaign/DiamondsAndVStacks/README.md).

**Proof/construction.** (1) After perfection write a Frobenius family on Spec R and associate the map Spd(R,R)→Bun_G, as in FS III.2.8. (2) Pull back the clopen κ fibres along that map. (3) Apply SW Proposition18.3.1, the bijection between clopen subsets of Spd(R,R) and Spec R; this proves scheme-topological local constancy. No commuting support or valuation map is assumed.

**Acceptance.** Do not create a dependency from bundle κ-local-constancy back to this corollary.

**Sources.** [Geometrization of the local Langlands correspondence](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), CorollaryIII.2.8 pp.92-93; [Berkeley Lectures on p-adic Geometry](https://www.math.uni-bonn.de/people/scholze/Berkeley.pdf), Proposition18.3.1 §18.3.

<a id="abelianized-kottwitz-set"></a>

### Abelianized Kottwitz set

**Definition: TauCeti.BunG.AbelianizedClass.** For E p-adic, B_ab(G)=H^1(W_E,[Gsc(L)→G(L)]) with the natural crossed-module action. The abelianization map comes from [1→G]→[Gsc→G]. A maximal torus complex [Tsc→T] and center complex [Zsc→Z] are homotopy-equivalent coefficient models, not replacements of G by an arbitrary abelian group.

**Prerequisites.** [Kottwitz set B(G)](#sigma-conjugacy-quotient); [EndoscopicTransferAndUnitaryTraceComparison:ET.0](../../../content/campaign/EndoscopicTransferAndUnitaryTraceComparison/README.md); [ReductiveGroups · layer 7 structure theory](../../../content/tau-ceti/ReductiveGroups/README.md#layer-7-structure-theory).

**Proof/construction.** (1) Import continuous crossed-module cohomology and the actual simply connected covering from their owners. (2) Construct the canonical abelianization and compare the torus and center complexes.

**API.**

| Declaration | Role | Contract |
|---|---|---|
| TauCeti.BunG.AbelianizedClass.abelianize | functoriality | Send a sigma class to its crossed-module H^1 class. |
| TauCeti.BunG.AbelianizedClass.torusModel | equivalence | Replace the crossed module by [Tsc(L)→T(L)] for a maximal torus. |
| TauCeti.BunG.AbelianizedClass.centerModel | equivalence | Replace it by [Zsc(L)→Z(L)]. |
| TauCeti.BunG.AbelianizedClass.map | functoriality | Reductive homomorphisms and compatible simply connected lifts induce the abelianized map. |

**Discriminating unit tests.**

- **TauCeti.BunG.AbelianizedClass.testTorus** (compatibility): For a torus Gsc=1, B_ab(T)=B(T).
- **TauCeti.BunG.AbelianizedClass.testSLn** (degenerate): For simply connected semisimple G the abelianized set is0.
- **TauCeti.BunG.AbelianizedClass.testPGLn** (computation): For split PGL_n, B_ab(G)=Z/n, which cannot be recovered by rationalization.

**Uses.** FS III.2.11: Identifies κ as abelianization. FS III.2.13: Gives the constant target of curve crossed-module H^1.

**Acceptance.** Restriction to p-adic E keeps finite diagonalizable groups étale.

**Sources.** [Geometrization of the local Langlands correspondence](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), III.2.4.2 pp.93-94.

<a id="slope-protorus"></a>

### Rational slope protorus

**Definition: TauCeti.BunG.SlopeProtorus.** Let D be the E-protorus with character group Q. A homomorphism D→G is a compatible rational cocharacter, not a single integral cocharacter. For each representation its weight grading records all rational isocrystal slopes.

**Prerequisites.** [ReductiveGroups · layer 1 representations  comodules](../../../content/tau-ceti/ReductiveGroups/README.md#layer-1-representations--comodules); [VectorBundlesAndIsocrystals:VB0/dieudonne-manin-isocrystals](../../../content/campaign/VectorBundlesAndIsocrystals/README.md).

**Proof/construction.** (1) Construct D as the inverse limit of G_m under positive power maps. (2) Use the character-group anti-equivalence to identify Hom(D,T) with X_*(T)⊗Q.

**API.**

| Declaration | Role | Contract |
|---|---|---|
| TauCeti.BunG.SlopeProtorus.weight | projection | Evaluate a rational weight in a representation. |
| TauCeti.BunG.SlopeProtorus.integralMultiple | constructor | Clear finitely many weight denominators for a finite representation. |
| TauCeti.BunG.SlopeProtorus.toTorus | equivalence | Hom(D,T) identifies with X_*(T)⊗Q. |
| TauCeti.BunG.SlopeProtorus.map | functoriality | Postcomposition sends D→G to D→H. |

**Discriminating unit tests.**

- **TauCeti.BunG.SlopeProtorus.testHalf** (computation): The slope1/2 character becomes integral after multiplication by2.
- **TauCeti.BunG.SlopeProtorus.testZero** (degenerate): Zero slope is the trivial homomorphism.
- **TauCeti.BunG.SlopeProtorus.testDenominator** (non-example): The slope1/2 homomorphism cannot be replaced by an integral slope1 cocharacter.

**Uses.** KMPS1.1.2: Newton morphisms have domain D. FS III.2: Graded tensor functors realize the Newton morphism.

**Acceptance.** Denominator h requires an h-fold integral representative.

**Sources.** [Honda-Tate theory for Shimura varieties](https://math.berkeley.edu/~swshin/HT.pdf), Notational conventions and1.1.1 p.5.

<a id="algebraic-fundamental-group"></a>

### Algebraic fundamental group

**Definition: TauCeti.BunG.AlgebraicPiOne.** For a geometric maximal torus T of connected reductive G, π_1(G)=X_*(T)/ZΦ∨, with its canonical Γ_E-action; identify different T using conjugacy and Weyl invariance of the quotient. Form integral inertia coinvariants π_1(G)_I and full Galois coinvariants π_1(G)_Γ, retaining torsion.

**Prerequisites.** [ReductiveGroups · layer 7 structure theory](../../../content/tau-ceti/ReductiveGroups/README.md#layer-7-structure-theory); [RootPairing](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/RootSystem/Defs.lean).

**Proof/construction.** (1) Construct the coroot quotient and prove that Weyl reflections act trivially. (2) Descend its action independently of the geometric torus; distinguish inertia and Frobenius quotients.

**API.**

| Declaration | Role | Contract |
|---|---|---|
| TauCeti.BunG.AlgebraicPiOne.ofCocharacter | constructor | Take the class of an integral cocharacter. |
| TauCeti.BunG.AlgebraicPiOne.coinvariants | structure | Form Γ- or I-coinvariants with the specified action. |
| TauCeti.BunG.AlgebraicPiOne.map | functoriality | A reductive group morphism induces the canonical homomorphism on π_1. |
| TauCeti.BunG.AlgebraicPiOne.innerInvariant | equivalence | An inner twisting canonically identifies the Γ-modules π_1. |

**Discriminating unit tests.**

- **TauCeti.BunG.AlgebraicPiOne.testGLn** (computation): For GL_n the sum of diagonal entries identifies π_1 with Z.
- **TauCeti.BunG.AlgebraicPiOne.testSLn** (degenerate): For SL_n the coroot quotient is0.
- **TauCeti.BunG.AlgebraicPiOne.testNormOne** (non-example): The unramified quadratic norm-one torus has Γ-coinvariants Z/2; its rationalization loses its nonzero class.

**Uses.** GLX2.2 and KMPS1.1: κ and μ♯ take values in the full integral quotient. BG2 connected components: Indexes π_0 Bun_G, including torsion.

**Acceptance.** Do not replace integral coinvariants by their rationalization.

**Sources.** [Honda-Tate theory for Shimura varieties](https://math.berkeley.edu/~swshin/HT.pdf), Notational conventions p.5; [The connected components of affine Deligne-Lusztig varieties](https://link.springer.com/content/pdf/10.1007/s00222-025-01386-1.pdf), Section2.2 p.818.

**Atlas planet:** Algebraic fundamental group.

<a id="newton-orbit-space"></a>

### Newton orbit space and rational dominance

**Definition: TauCeti.BunG.NewtonSpace.** N(G) is the Γ_E-fixed set of G(bar E)-conjugacy classes of D→G. For a quasi-split inner form G*, choose a rational Borel and torus and identify it with Γ-fixed dominant rational cocharacters. Define ν≤νprime when νprime−ν is a nonnegative rational combination of positive coroots in the chosen chamber; the central projection is consequently equal.

**Prerequisites.** [Rational slope protorus](#slope-protorus); [ReductiveGroups · layer 7 structure theory](../../../content/tau-ceti/ReductiveGroups/README.md#layer-7-structure-theory); [ReductiveGroupsPartII:RG2.1](../../../content/campaign/ReductiveGroupsPartII/README.md).

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

**Sources.** [Honda-Tate theory for Shimura varieties](https://math.berkeley.edu/~swshin/HT.pdf), 1.1.1 pp.5-6; [On the classification and specialization of F-isocrystals with additional structure](https://www.numdam.org/article/CM_1996__103_2_153_0.pdf), Section2.1 pp.165-166.

<a id="galois-average"></a>

### Galois averaging and Hodge invariants

**Construction: TauCeti.BunG.HodgeInvariants.** For a geometric conjugacy class {μ}, choose its dominant representative μ* in a quasi-split inner form. Put μ♯=[μ*] in π_1(G)_Γ and μ◇=|Γ·μ*|^−1 sum over the finite orbit. The latter is dominant and Γ-fixed. Rational averaging gives (π_1(G)⊗Q)_Γ≅(π_1(G)⊗Q)^Γ and δ(μ◇)=average(μ♯⊗1); it is not an integral averaging isomorphism.

**Prerequisites.** [Algebraic fundamental group](#algebraic-fundamental-group); [Newton orbit space and rational dominance](#newton-orbit-space); [ReductiveGroups · layer 7 structure theory](../../../content/tau-ceti/ReductiveGroups/README.md#layer-7-structure-theory).

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

**Sources.** [Honda-Tate theory for Shimura varieties](https://math.berkeley.edu/~swshin/HT.pdf), 1.1.5 pp.7-8.

<a id="newton-and-kottwitz-maps"></a>

### Newton and Kottwitz invariants

**Construction: TauCeti.BunG.Invariants.** There are functorial maps ν:B(G)→N(G) and κ:B(G)→π_1(G)_Γ. The Newton morphism is the slope grading in every rational representation. The representative homomorphism tildeκ:G(L)→π_1(G)_I is the torus valuation map extended through a z-extension; composing with Frobenius coinvariants gives κ. Their rational images agree: δ(ν_b)=average(κ(b)⊗1).

**Prerequisites.** [Kottwitz set B(G)](#sigma-conjugacy-quotient); [Newton orbit space and rational dominance](#newton-orbit-space); [Algebraic fundamental group](#algebraic-fundamental-group); [Galois averaging and Hodge invariants](#galois-average); [VectorBundlesAndIsocrystals:VB0/dieudonne-manin-isocrystals](../../../content/campaign/VectorBundlesAndIsocrystals/README.md); [ReductiveGroups · layer 7 structure theory](../../../content/tau-ceti/ReductiveGroups/README.md#layer-7-structure-theory).

**Proof/construction.** (1) Construct the slope morphism using Dieudonné–Manin and tensor compatibility. (2) Construct the torus representative map, then descend along the induced central torus of a z-extension using its exact π_1 sequence. (3) Check sigma-conjugacy invariance and the rational compatibility square.

**API.**

| Declaration | Role | Contract |
|---|---|---|
| TauCeti.BunG.Invariants.newton | projection | Evaluate the Newton class or its chosen dominant representative. |
| TauCeti.BunG.Invariants.kottwitz | projection | Evaluate κ in integral Γ-coinvariants. |
| TauCeti.BunG.Invariants.representativeKottwitz | projection | Evaluate tildeκ in inertia coinvariants before the σ quotient. |
| TauCeti.BunG.Invariants.map | functoriality | Group morphisms commute with κ and with the induced conjugacy-class Newton map. |
| TauCeti.BunG.Invariants.rationalCompatibility | compatibility | The δ/average square commutes; it does not recover torsion κ from ν. |

**Discriminating unit tests.**

- **TauCeti.BunG.Invariants.testGL1** (computation): b=π^m has ν=m and κ=m.
- **TauCeti.BunG.Invariants.testSign** (compatibility): Its associated line bundle is O(−m), so degree is −κ.
- **TauCeti.BunG.Invariants.testTorsion** (non-example): The two norm-one torus classes have equal Newton0 and distinct κ in Z/2.

**Uses.** GLX2.2: Defines acceptable classes and component cosets. BG2 and IG.0: Controls curve components and structured admissibility.

**Acceptance.** For GL_n, κ=v(det b) and ν is the descending slope tuple.

**Sources.** [Honda-Tate theory for Shimura varieties](https://math.berkeley.edu/~swshin/HT.pdf), 1.1.2 equations1.1.2.1 and1.1.2.3 pp.6-7; [On the classification and specialization of F-isocrystals with additional structure](https://www.numdam.org/article/CM_1996__103_2_153_0.pdf), Theorem1.15 p.163.

**Atlas planet:** Newton and Kottwitz invariants.

<a id="straight-weyl-classification"></a>

### Straight Weyl comparison with B(G)

**Theorem: TauCeti.BunG.StraightWeylClassification.** For the local Iwahori–Weyl group with its specified Frobenius and parahoric root datum, the map from σ-straight σ-conjugacy classes of Weyl elements to B(G) is a bijection and preserves κ and dominant Newton points. For w, choose n killing the finite Weyl/Frobenius action and write wσ(w)⋯σ^(n−1)(w)=t_λ; ν_w=λ/n. The straightness criterion is length(w)=<2ρ_Σ,ν_w^dom>. Generic affine Weyl groups, lengths and Adm(μ) belong to RG2.4.

**Prerequisites.** [Newton and Kottwitz invariants](#newton-and-kottwitz-maps); [ReductiveGroupsPartII:RG2.4](../../../content/campaign/ReductiveGroupsPartII/README.md); [ReductiveGroupsPartII:RG2.3](../../../content/campaign/ReductiveGroupsPartII/README.md).

**Proof/construction.** (1) Import the actual local extended Weyl datum and its lift to G(L). (2) Prove independence of an allowed n and compatibility of invariant maps. (3) Use the cited He14 straight-class theorem; its original proof remains a named source gap.

**Acceptance.** The rational translation normalization divides by n, not by the residue-field degree.

**Sources.** [Independence of l for Frobenius conjugacy classes attached to abelian varieties](https://arxiv.org/pdf/2103.09945v2), Sections2.1.3-2.1.4 and2.2.1 pp.6-8.

**Atlas planet:** Straight Weyl classification.

<a id="classification-by-two-invariants"></a>

### Kottwitz classification by both invariants

**Theorem: TauCeti.BunG.ClassificationByTwoInvariants.** The map (ν,κ):B(G)→N(G)×π_1(G)_Γ is injective. For basic classes, κ restricts to a bijection B(G)_basic≅π_1(G)_Γ; their Newton point is the central rational representative determined by κ⊗1. Injectivity of ν alone is false.

**Prerequisites.** [Newton and Kottwitz invariants](#newton-and-kottwitz-maps); [ReductiveGroups · layer 7 structure theory](../../../content/tau-ceti/ReductiveGroups/README.md#layer-7-structure-theory).

**Proof/construction.** (1) Reduce to the centralizer of the Newton map and its basic class classification. (2) Apply the basic Kottwitz bijection there and the injectivity statement of Kot97.

**Acceptance.** Quadratic norm-one torus gives equal ν and unequal κ.

**Sources.** [Isocrystals with additional structure II](https://people.dm.unipi.it/maffei/didattica/male/lacci/Kottwitz.pdf), Theorem4.13 and Proposition5.1 pp.272,277; [Honda-Tate theory for Shimura varieties](https://math.berkeley.edu/~swshin/HT.pdf), 1.1.2.3 pp.6-7.

<a id="basic-class"></a>

### Basic sigma class

**Definition: TauCeti.BunG.Basic.** A class is basic when its Newton morphism factors through Z(G), equivalently every adjoint representation slope is0. This definition applies to all connected reductive inner forms, independently of a rational representative choice.

**Prerequisites.** [Newton and Kottwitz invariants](#newton-and-kottwitz-maps); [ReductiveGroups · layer 7 structure theory](../../../content/tau-ceti/ReductiveGroups/README.md#layer-7-structure-theory).

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

**Sources.** [Honda-Tate theory for Shimura varieties](https://math.berkeley.edu/~swshin/HT.pdf), 1.1.2 p.6.

<a id="partial-order-on-B-of-G"></a>

### Newton partial order with Kottwitz fibre

**Definition: TauCeti.BunG.NewtonOrder.** Define [b]≤[c] iff κ(b)=κ(c) and ν_b≤ν_c in the coroot order on N(G). Classification by both invariants makes this a partial order. The ν-only relation in KMPS is a preorder across all of B(G), and becomes a partial order on each κ fibre.

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

**Sources.** [Geometrization of the local Langlands correspondence](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), III.2.2 p.89; [Cordial elements and dimensions of affine Deligne-Lusztig varieties](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/5A27DBF48CAEF6DA56A313061848574C/S205050862100010Xa.pdf/cordial-elements-and-dimensions-of-affine-delignelusztig-varieties.pdf), Section4.1 p.7.

**Atlas planet:** Newton partial order.

<a id="representation-detects-dominance"></a>

### Representations detect Newton dominance

**Theorem: TauCeti.BunG.RepresentationDetectsDominance.** For Γ-invariant rational cocharacter classes, ν≤νprime iff for every rational representation the descending slope tuples have the corresponding positive-coroot majorization; totals agree. Basic classes are minimal among the classes with the same rational central projection. Passing to B(G) additionally requires equality of integral κ.

**Prerequisites.** [Newton orbit space and rational dominance](#newton-orbit-space); [ReductiveGroups · layer 1 representations  comodules](../../../content/tau-ceti/ReductiveGroups/README.md#layer-1-representations--comodules).

**Proof/construction.** (1) Reduce using dominant weights and highest weights of rational representations. (2) Separate the central character equality from the semisimple coroot inequalities.

**Acceptance.** A faithful representation alone does not establish the full equivalence without a weight-detection argument.

**Sources.** [On the classification and specialization of F-isocrystals with additional structure](https://www.numdam.org/article/CM_1996__103_2_153_0.pdf), Lemma2.2 and Proposition2.4 pp.165-166.

<a id="admissible-pair"></a>

### Acceptable classes B(G,{μ})

**Definition: TauCeti.BunG.Acceptable.** For a geometric cocharacter class {μ}, set B(G,{μ})={ [b] : κ(b)=μ♯ and N_ξ(ν_b)≤μ◇ }. ξ is an inner twisting to the quasi-split form used for the dominant average. Both conditions are required. Acceptable describes the local invariant set; it does not assert existence of a period point or weak admissibility.

**Prerequisites.** [Galois averaging and Hodge invariants](#galois-average); [Newton and Kottwitz invariants](#newton-and-kottwitz-maps); [Newton partial order with Kottwitz fibre](#partial-order-on-B-of-G).

**Proof/construction.** (1) Define the subtype of sigma classes satisfying the two invariant conditions. (2) Check independence of Borel, torus and inner twisting via invariant transport.

**API.**

| Declaration | Role | Contract |
|---|---|---|
| TauCeti.BunG.Acceptable.mem_iff | characterisation | Membership is full κ equality and Newton bound. |
| TauCeti.BunG.Acceptable.basic | constructor | The unique basic class of κ=μ♯ lies in B(G,{μ}). |
| TauCeti.BunG.Acceptable.finite | other | The acceptable subset is finite. |
| TauCeti.BunG.Acceptable.torus_iff | simp | For T, membership is κ_T(b)=μ♯; the Newton equality follows. |
| TauCeti.BunG.Acceptable.product | equivalence | Acceptable sets for a product factor with the component bounds. |

**Discriminating unit tests.**

- **TauCeti.BunG.Acceptable.testGL2** (computation): For split GL_2 and μ=(1,0), basic slopes1/2,1/2 and ordinary slopes1,0 occur.
- **TauCeti.BunG.Acceptable.testZero** (degenerate): B(G,{0}) contains exactly its basic class with κ=0.
- **TauCeti.BunG.Acceptable.testTorsion** (non-example): For the quadratic norm-one torus μ=1, only κ=1 mod2 is allowed, though both Newton points equal μ◇=0.

**Uses.** HK26 Section1.1 and IG.0: Use finite indexing and its unique basic element. GLX Lemma3.16 and KMPS1.1.13: Lift bounded data through z-extensions and Levi subgroups.

**Acceptance.** Apply μ inverse in the CS flag convention.

**Sources.** [Honda-Tate theory for Shimura varieties](https://math.berkeley.edu/~swshin/HT.pdf), 1.1.5 conditions1.1.5.1-2 p.8; [Independence of l for Frobenius conjugacy classes attached to abelian varieties](https://arxiv.org/pdf/2103.09945v2), Definition2.2.3 p.10.

**Atlas planet:** Acceptable Newton classes.

<a id="levi-newton-formula"></a>

### Basic Levi Newton formula

**Theorem: TauCeti.BunG.LeviNewtonFormula.** For quasi-split G/Q_p and a rational standard Levi M, a basic class b_M with κ_M(b_M)=μ_M♯ has Newton point the corresponding element of (X_*(Z_M)⊗Q)^Γ. If μ_M and μ have the same image in π_1(G), its image in B(G) is acceptable for μ precisely when its G-dominant Newton point is bounded by μ◇. The M-dominant and G-dominant representatives can differ by a Weyl conjugation.

**Prerequisites.** [Basic sigma class](#basic-class); [Acceptable classes B(G,{μ})](#admissible-pair); [ReductiveGroups · layer 7 structure theory](../../../content/tau-ceti/ReductiveGroups/README.md#layer-7-structure-theory); [ReductiveGroupsPartII:RG2.1](../../../content/campaign/ReductiveGroupsPartII/README.md).

**Proof/construction.** (1) Project the basic invariant through the rational center isomorphism for M. (2) Use the functorial π_1 map and take G-dominant Newton representatives.

**Acceptance.** For a nonbasic G-class several distinct basic Levi classes can map to it; their Levi κ values need not coincide.

**Sources.** [Honda-Tate theory for Shimura varieties](https://math.berkeley.edu/~swshin/HT.pdf), Lemma1.1.12 p.10; [Cordial elements and dimensions of affine Deligne-Lusztig varieties](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/5A27DBF48CAEF6DA56A313061848574C/S205050862100010Xa.pdf/cordial-elements-and-dimensions-of-affine-delignelusztig-varieties.pdf), Section6.2 p.13.

<a id="ordinary-class"></a>

### Ordinary Newton class

**Definition: TauCeti.BunG.Ordinary.** An acceptable class is μ-ordinary when its transferred dominant Newton point equals μ◇. Classification makes such a class unique if it exists. Its existence is guaranteed for quasi-split G; it is not automatic for a general inner form. Every B(G,{μ}) has a unique maximum, which need not satisfy ordinary equality.

**Prerequisites.** [Acceptable classes B(G,{μ})](#admissible-pair); [Kottwitz classification by both invariants](#classification-by-two-invariants).

**Proof/construction.** (1) Define equality with the actual Hodge average, retaining acceptability. (2) Use injectivity of (ν,κ) for uniqueness; use KZ’s quasi-split existence argument. (3) Import the unique-maximum theorem of He–Nie, with its combinatorial proof interior identified as a gap.

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

**Sources.** [Independence of l for Frobenius conjugacy classes attached to abelian varieties](https://arxiv.org/pdf/2103.09945v2), Definition2.2.4 and Remark2.2.5 p.10; [Honda-Tate theory for Shimura varieties](https://math.berkeley.edu/~swshin/HT.pdf), Section1.3.15 p.20.

**Atlas planet:** Ordinary Newton class.

<a id="acceptable-unique-maximum"></a>

### Unique maximum of acceptable classes

**Theorem: TauCeti.BunG.AcceptableUniqueMaximum.** For connected reductive G over a nonarchimedean local field and a geometric class {μ}, B(G,{μ}) has a unique maximal element for the fixed-κ Newton order. The maximum is ordinary exactly when its Newton point equals μ◇. No quasi-split hypothesis is attached to unique maximality.

**Prerequisites.** [Acceptable classes B(G,{μ})](#admissible-pair); [ReductiveGroupsPartII:RG2.4](../../../content/campaign/ReductiveGroupsPartII/README.md).

**Proof/construction.** (1) Use the He–Nie combinatorial maximal-element theorem for the acceptable Newton set. (2) Apply finiteness and the fixed-κ order; compare the maximal point with μ◇.

**Acceptance.** In a nonsplit inner form maximality alone does not imply ordinary equality.

**Sources.** [On the acceptable elements](https://arxiv.org/pdf/1408.5836), Theorem0.1 pp.1-2; [Independence of l for Frobenius conjugacy classes attached to abelian varieties](https://arxiv.org/pdf/2103.09945v2), Remark2.2.5 p.10.

<a id="ordinary-straight-translation"></a>

### Ordinary straight translation and Levi centrality

**Theorem: TauCeti.BunG.OrdinaryStraightTranslation.** Every ordinary class has a representative lifting a σ-straight translation t_μprime with μprime in the relative Weyl orbit of the projected μ. Such a translation has μprime central in the rational Newton Levi. If μprime=w(μ) with μ the projection of an absolute dominant cocharacter μtilde, the compatible absolute lift w(μtilde) is central in that Levi. The absolute/relative projection and Frobenius are part of the supplied root datum.

**Prerequisites.** [Ordinary Newton class](#ordinary-class); [Straight Weyl comparison with B(G)](#straight-weyl-classification); [ReductiveGroupsPartII:RG2.4](../../../content/campaign/ReductiveGroupsPartII/README.md); [ReductiveGroups · layer 7 structure theory](../../../content/tau-ceti/ReductiveGroups/README.md#layer-7-structure-theory).

**Proof/construction.** (1) Apply the straightness equality to compare the coroot pairings with the Newton centralizer. (2) Use the compatible absolute lift and averaging to force the remaining Levi root pairings to vanish. (3) Use ordinary equality and the straight-class bijection to choose the translation representative.

**Acceptance.** Centrality is in the Newton Levi, not necessarily in G.

**Sources.** [Independence of l for Frobenius conjugacy classes attached to abelian varieties](https://arxiv.org/pdf/2103.09945v2), Lemmas2.1.7,2.1.9 and2.2.6 pp.7,9.

<a id="ordinary-derived-isogeny"></a>

### Ordinary classes under a derived isogeny

**Theorem: TauCeti.BunG.OrdinaryDerivedIsogeny.** If f:G→Gprime induces an isogeny of derived groups and sends μ to μprime, the ordinary class exists for (G,μ) iff it exists for (Gprime,μprime). For b∈B(G,{μ}), b is ordinary iff f(b) is ordinary. The proof compares the noncentral root data and restores the central equality from acceptability.

**Prerequisites.** [Ordinary Newton class](#ordinary-class); [Ordinary straight translation and Levi centrality](#ordinary-straight-translation); [ReductiveGroups · layer 7 structure theory](../../../content/tau-ceti/ReductiveGroups/README.md#layer-7-structure-theory).

**Proof/construction.** (1) Compare the dominant Newton points modulo the center using the derived isogeny. (2) The rational κ compatibility fixes the central component, so equality lifts. (3) For existence use the compatible straight translation and Kottwitz class.

**Acceptance.** The morphism need not be an isomorphism on centers; this is why full acceptability is retained.

**Sources.** [Independence of l for Frobenius conjugacy classes attached to abelian varieties](https://arxiv.org/pdf/2103.09945v2), Lemma2.2.8 p.10.

<a id="ordinary-integral-conjugacy"></a>

### Integral conjugacy of an ordinary admissible element

**Theorem: TauCeti.BunG.OrdinaryIntegralConjugacy.** In the KZ local setup with the specified connected parahoric model, if b is μ-ordinary and lies in the union of μ-admissible parahoric double cosets, b lies in the double coset of a σ-straight translation t_μprime for μprime in W_0μ. It is σ-conjugate to the chosen translation lift by an element of G(O_breveF). The claim is for elements satisfying the integral double-coset hypothesis, not every representative of the ordinary class.

**Prerequisites.** [Ordinary straight translation and Levi centrality](#ordinary-straight-translation); [ReductiveGroupsPartII:RG2.4](../../../content/campaign/ReductiveGroupsPartII/README.md); [ReductiveGroupsPartII:RG2.3](../../../content/campaign/ReductiveGroupsPartII/README.md).

**Proof/construction.** (1) Use Adm(μ) and the ordinary Newton equality to force the translation cell. (2) Reduce the remaining factor through the Levi and its unipotent radical, applying the Frobenius/Lang argument in the parahoric model.

**Acceptance.** A conjugate by an arbitrary G(L) element can leave the admissible integral double coset.

**Sources.** [Independence of l for Frobenius conjugacy classes attached to abelian varieties](https://arxiv.org/pdf/2103.09945v2), Proposition2.3.3 pp.11-12.

<a id="product-and-unramified-norm"></a>

### Products and unramified restriction of scalars

**Comparison: TauCeti.BunG.ProductAndUnramifiedNorm.** B(G1×G2)=B(G1)×B(G2), compatibly with ν,κ,defect and acceptable bounds. For E/F unramified of degree d and G=Res_(E/F)H, after decomposing G(breveF) into d factors, Nm(b)=b_0 σ(b_1)⋯σ^(d−1)(b_(d−1)) gives B(G,σ)≅B(H,σ_E). The bound on H is the sum of the component cocharacters, with the chosen factor identifications. J_b^G≅Res_(E/F)J_Nm(b)^H and the F/E split-rank defects agree.

**Prerequisites.** [Defect of a sigma class](#defect); [Acceptable classes B(G,{μ})](#admissible-pair); [ReductiveGroups · layer 7 structure theory](../../../content/tau-ceti/ReductiveGroups/README.md#layer-7-structure-theory).

**Proof/construction.** (1) Write the Frobenius cycle on the d factors and eliminate d−1 factors by sigma conjugation. (2) Compare the surviving semilinear operator and centralizer. (3) Use Shapiro on π_1 and sum the Hodge components; compare ρ pairings with the precise normalized Newton tuple.

**Acceptance.** Do not multiply the defect by d; restriction of scalars preserves the appropriate local split rank.

**Sources.** [Affine Grassmannians and the geometric Satake in mixed characteristic](https://annals.math.princeton.edu/wp-content/uploads/annals-v185-n2-p02-p.pdf), Remark3.6 and Lemma3.7 p.459; [Isocrystals with additional structure II](https://people.dm.unipi.it/maffei/didattica/male/lacci/Kottwitz.pdf), Section6.5 equations6.5.2-6.5.3 p.288.

<a id="basic-levi-fibre-uniqueness"></a>

### Levi fibre over a basic G-class

**Theorem: TauCeti.BunG.BasicLeviFibreUniqueness.** For a basic G-class and a σ-stable standard Levi, its intersection with the Levi has at most one Levi σ-conjugacy class. For a nonbasic G-class the corresponding uniqueness assertion is false; the Levi-dominant Newton vector can be a Weyl conjugate of the G-dominant vector and Levi κ must be checked separately.

**Prerequisites.** [Kottwitz classification by both invariants](#classification-by-two-invariants); [Basic Levi Newton formula](#levi-newton-formula); [ReductiveGroupsPartII:RG2.4](../../../content/campaign/ReductiveGroupsPartII/README.md).

**Proof/construction.** (1) Use the basic central Newton vector and the integral Levi invariant compatibility. (2) Apply the corrected GHN basic-only uniqueness statement cited by He. (3) Keep the nonbasic Levi invariant obstruction for ADLV consumers; do not import a false general uniqueness lemma.

**Acceptance.** In GL_3, different allocations of slopes to unequal Levi blocks can give different Levi κ while mapping to the same G-class.

**Sources.** [Cordial elements and dimensions of affine Deligne-Lusztig varieties](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/5A27DBF48CAEF6DA56A313061848574C/S205050862100010Xa.pdf/cordial-elements-and-dimensions-of-affine-delignelusztig-varieties.pdf), Theorem6.3 footnote and Section6.2 pp.13-14.

<a id="gl-minuscule-quasisplit-centralizer"></a>

### Quasi-split centralizer in the GL minuscule case

**Theorem: TauCeti.BunG.GlMinusculeQuasisplitCentralizer.** For GL_n over a p-adic field L and μ(t)=diag(t repeated n−q,1 repeated q), exactly one class in B(GL_n/L,{μ^−1}) has quasi-split J_b: the ordinary class diag(π^−1 repeated n−q,1 repeated q). The extension to the CS17 unramified restrictions of scalars uses the cocharacter supported at one noncentral embedding. No implication quasi-split J_b⇒ordinary is claimed for arbitrary reductive data.

**Prerequisites.** [Algebraic sigma-centralizer](#sigma-centralizer-J-b); [Ordinary Newton class](#ordinary-class); [Products and unramified restriction of scalars](#product-and-unramified-norm); [VectorBundlesAndIsocrystals:VB0/dieudonne-manin-isocrystals](../../../content/campaign/VectorBundlesAndIsocrystals/README.md); [ReductiveGroups · layer 7 structure theory](../../../content/tau-ceti/ReductiveGroups/README.md#layer-7-structure-theory).

**Proof/construction.** (1) Acceptability confines slopes to [−1,0]. (2) A nonintegral slope introduces a nontrivial division algebra factor in J_b and prevents quasi-splitness. (3) κ fixes the multiplicities of the integral slopes−1 and0. (4) For Res use the single-embedding norm-bound normalization from the source.

**Acceptance.** For an arbitrary cocharacter with more integral slopes, a quasi-split centralizer need not select the ordinary class.

**Sources.** [On the generic part of the cohomology of compact unitary Shimura varieties](https://annals.math.princeton.edu/wp-content/uploads/annals-v186-n3-p01-p.pdf), Lemma5.5.8 and preceding footnote p.748.

<a id="admissible-finiteness-and-basic"></a>

### Finiteness and the basic acceptable member

**Theorem: TauCeti.BunG.AdmissibleFinitenessAndBasic.** B(G,{μ}) is finite and has exactly one basic member, characterized by κ=μ♯. That member is its minimum for the Newton order. For μ=0 it is the only member. For tori the whole acceptable set is this singleton.

**Prerequisites.** [Acceptable classes B(G,{μ})](#admissible-pair); [Basic sigma class](#basic-class); [Representations detect Newton dominance](#representation-detects-dominance).

**Proof/construction.** (1) Use the finite coroot interval and denominator constraints from classification. (2) Apply basic minimality at the rational projection of μ♯. (3) For a torus there are no nonzero coroots, so κ determines the class.

**Acceptance.** Zero bound cannot contain a noncentral positive-coroot displacement with the same central projection.

**Sources.** [Isocrystals with additional structure II](https://people.dm.unipi.it/maffei/didattica/male/lacci/Kottwitz.pdf), Section6.4 and6.6 pp.287-288; [Honda-Tate theory for Shimura varieties](https://math.berkeley.edu/~swshin/HT.pdf), Lemma1.1.6 p.8.

<a id="rational-newton-witness"></a>

### Rational Newton representative

**Definition: TauCeti.BunG.RationalNewtonWitness.** A rational-Newton witness for [b] is a Q_p-rational homomorphism ν_G([b]):D→G in the G(L)-conjugacy class of ν_b, with a specified conjugator. It exists when G is quasi-split or [b] is basic; the KMPS constructions that require it retain this hypothesis for general inner forms.

**Prerequisites.** [Newton and Kottwitz invariants](#newton-and-kottwitz-maps); [ReductiveGroups · layer 7 structure theory](../../../content/tau-ceti/ReductiveGroups/README.md#layer-7-structure-theory).

**Proof/construction.** (1) Record the actual representative and conjugacy equation. (2) For quasi-split groups choose the Γ-fixed dominant member; for basic classes descend the central morphism.

**API.**

| Declaration | Role | Contract |
|---|---|---|
| TauCeti.BunG.RationalNewtonWitness.quasiSplit | constructor | Build the unique B-dominant rational representative for quasi-split G. |
| TauCeti.BunG.RationalNewtonWitness.basic | constructor | A basic class has a central rational representative. |
| TauCeti.BunG.RationalNewtonWitness.levi | projection | Return Z_G(ν_G([b])) as an E-defined Levi. |
| TauCeti.BunG.RationalNewtonWitness.centralOnJ | projection | Transport the central Newton morphism to J_b, retaining the inner identification. |

**Discriminating unit tests.**

- **TauCeti.BunG.RationalNewtonWitness.testSplitGL2** (computation): The slope1,0 map has the diagonal rational representative.
- **TauCeti.BunG.RationalNewtonWitness.testBasic** (degenerate): A basic witness centralizes all of G.
- **TauCeti.BunG.RationalNewtonWitness.testInnerForm** (non-example): An anisotropic inner form need not realize a noncentral geometric Newton orbit rationally.

**Uses.** KMPS1.1.15-1.1.17: Supports rational Levi reduction and torus transfer. Kisin17 proof2.2.2: Supplies the dominant rational Newton representative.

**Acceptance.** Galois invariance of an orbit is weaker than having a rational representative in G.

**Sources.** [Honda-Tate theory for Shimura varieties](https://math.berkeley.edu/~swshin/HT.pdf), 1.1.3 condition1.1.3.1 p.7.

<a id="minuscule-basic-levi-lift"></a>

### Minuscule basic Levi lifting

**Theorem: TauCeti.BunG.MinusculeBasicLeviLift.** For a connected reductive G/Q_p, a rational Levi M containing a maximal torus T, a G-minuscule μ∈X_*(T), and basic b_M whose image lies in B(G,{μ}), some w in the absolute Weyl group W(G,T) makes b_M∈B(M,{wμ}). For quasi-split G the proof first treats unramified models, then replaces the based-root averaging datum by an unramified datum; the general case transports the rational Levi to G*.

**Prerequisites.** [Basic Levi Newton formula](#levi-newton-formula); [Rational Newton representative](#rational-newton-witness); [ReductiveGroups · layer 7 structure theory](../../../content/tau-ceti/ReductiveGroups/README.md#layer-7-structure-theory); [ReductiveGroupsPartII:RG2.4](../../../content/campaign/ReductiveGroupsPartII/README.md).

**Proof/construction.** (1) Use Wintenberger Cartan realization, Iwasawa reduction and Mazur inequality in the unramified case. (2) Require equality of the integral π_1(G) class in the Satake reduction; minuscule dominance alone is insufficient. (3) Use the torsion-free kernel of π_1(M)_Γ→π_1(G)_Γ and the matching Galois averages for the unramified replacement. (4) Transport a rational parabolic and its rational Levi by the inner twisting; basic κ and ν are compatible.

**Acceptance.** GL_3 with M=GL_1×GL_2, μ=(0,1,0), b_M=diag(p,1,1) needs the absolute Weyl swap; N_G(M)/M is trivial.

**Sources.** [Honda-Tate theory for Shimura varieties](https://math.berkeley.edu/~swshin/HT.pdf), Proposition1.1.13 and Corollary1.1.15 pp.10-12; [Honda-Tate theory for Shimura varieties](https://math.berkeley.edu/~swshin/HT.pdf), Corollary1.1.15 p.11.

<a id="torus-norm-description"></a>

### Torus norm and Newton average

**Theorem: TauCeti.BunG.TorusNormDescription.** For a torus T/E, κ:B(T)≅X_*(T)_Γ and ν of the class κ^−1([λ]) is the rational Γ-average of λ. Kottwitz’s finite splitting-field norm construction gives a representative after choosing the splitting extension, the unramified coefficient field and the valuation normalization of its uniformizer; these choices do not change the resulting class.

**Prerequisites.** [Kottwitz classification by both invariants](#classification-by-two-invariants); [Galois averaging and Hodge invariants](#galois-average); [ReductiveGroups · layer 7 structure theory](../../../content/tau-ceti/ReductiveGroups/README.md#layer-7-structure-theory).

**Proof/construction.** (1) Apply the valuation/cocharacter description over a splitting extension. (2) Use norm maps and Shapiro to descend the cocharacter class. (3) Identify Newton slopes through all characters with the normalized Galois average.

**Acceptance.** For a quadratic norm-one torus, two integral κ classes have Newton0.

**Sources.** [Honda-Tate theory for Shimura varieties](https://math.berkeley.edu/~swshin/HT.pdf), 1.1.2.4 p.7; [Isocrystals with additional structure](https://www.numdam.org/article/CM_1985__56_2_201_0.pdf), Sections2.4-2.8 pp.208-210.

<a id="torus-special-pair"></a>

### Torus-special acceptable pair

**Definition: TauCeti.BunG.TorusSpecial.** For T⊂G a maximal torus over Q_p, an acceptable pair ([b],{μ}) is T-special if there exists μ_T∈X_*(T) in {μ} such that the unique class of B(T) with κ_T=[μ_T] maps to [b]. For tori admissibility is determined by κ, and the Newton point is the Galois average of μ_T. This packages local specialness, not a global CM point.

**Prerequisites.** [Acceptable classes B(G,{μ})](#admissible-pair); [Torus norm and Newton average](#torus-norm-description); [ReductiveGroups · layer 7 structure theory](../../../content/tau-ceti/ReductiveGroups/README.md#layer-7-structure-theory).

**Proof/construction.** (1) Use the torus Kottwitz bijection to define the class from the cocharacter. (2) State its image equality in B(G) as the witness, rather than asserting arbitrary torus specialness.

**API.**

| Declaration | Role | Contract |
|---|---|---|
| TauCeti.BunG.TorusSpecial.mk | constructor | Package μ_T, its conjugacy class and its torus-class image equation. |
| TauCeti.BunG.TorusSpecial.witness | projection | Recover μ_T and the B(T) class. |
| TauCeti.BunG.TorusSpecial.newton | compatibility | The mapped class has Newton orbit the image of average(μ_T). |
| TauCeti.BunG.TorusSpecial.ellipticBasic | constructor | For elliptic T a basic acceptable pair has a T-special witness. |

**Discriminating unit tests.**

- **TauCeti.BunG.TorusSpecial.testSplitGL1** (computation): For G=T=G_m, μ=m gives the class of p^m.
- **TauCeti.BunG.TorusSpecial.testZero** (degenerate): The trivial class with μ=0 is T-special.
- **TauCeti.BunG.TorusSpecial.testSplitTorus** (non-example): For GL_2, the basic slope1/2 class cannot come from an integral cocharacter of the split diagonal torus; the ellipticity hypothesis matters.

**Uses.** KMPS Lemma1.1.8: Supplies local basic specialness. KMPS Corollary1.1.17: Transferred maximal tori supply the nonbasic special witness.

**Acceptance.** The witness fixes both the cocharacter orbit and full κ.

**Sources.** [Honda-Tate theory for Shimura varieties](https://math.berkeley.edu/~swshin/HT.pdf), Definition1.1.7 p.8.

<a id="elliptic-torus-basic-image"></a>

### Elliptic tori and basic acceptable classes

**Theorem: TauCeti.BunG.EllipticTorusBasicImage.** If T⊂G is elliptic modulo Z(G), the image of B(T)→B(G) is exactly B(G)_basic. For every basic acceptable pair ([b],{μ}) and every μ_T∈X_*(T) in {μ}, the image of κ_T^−1([μ_T]) is [b]. Thus every such pair is T-special; this argument requires no minuscule hypothesis.

**Prerequisites.** [Torus-special acceptable pair](#torus-special-pair); [Basic sigma class](#basic-class); [ReductiveGroups · layer 7 structure theory](../../../content/tau-ceti/ReductiveGroups/README.md#layer-7-structure-theory).

**Proof/construction.** (1) Ellipticity makes the rational average of every cocharacter central in G, so the image is basic. (2) The integral cocharacter quotient maps surjectively to π_1(G)_Γ, giving surjectivity onto basic classes. (3) For μ_T in the given geometric orbit the image κ is μ♯; basic-class uniqueness identifies it with [b].

**Acceptance.** A split nonelliptic torus in GL_2 also produces nonbasic classes.

**Sources.** [Isocrystals with additional structure](https://www.numdam.org/article/CM_1985__56_2_201_0.pdf), Proposition5.3 printed215; [Honda-Tate theory for Shimura varieties](https://math.berkeley.edu/~swshin/HT.pdf), Lemma1.1.8 p.8.

<a id="transferred-torus-specialness"></a>

### Specialness for a transferred centralizer torus

**Theorem: TauCeti.BunG.TransferredTorusSpecialness.** Under a rational Newton witness, a G-minuscule acceptable pair and a rational transfer j:Tprime→M_[b] of a maximal torus of J_b, the pair is j(Tprime)-special. There is μ_Tprime in the prescribed geometric class whose Galois average equals the central morphism ν_(b,J). Such a transfer exists if G is quasi-split or Tprime is elliptic; geometric conjugacy alone is not a transfer.

**Prerequisites.** [Rational Newton representative](#rational-newton-witness); [Minuscule basic Levi lifting](#minuscule-basic-levi-lift); [Torus-special acceptable pair](#torus-special-pair); [ReductiveGroups · layer 7 structure theory](../../../content/tau-ceti/ReductiveGroups/README.md#layer-7-structure-theory); [EndoscopicTransferAndUnitaryTraceComparison:ET.0](../../../content/campaign/EndoscopicTransferAndUnitaryTraceComparison/README.md).

**Proof/construction.** (1) Conjugate the Newton representative and transferred torus together; centralize its maximal split subtorus to obtain a rational Levi M. (2) The explicit representative mh·b·σ(mh)^−1 lies in M(L) and is basic there. (3) Apply the corrected absolute-Weyl-group Levi lift and the elliptic-torus specialness theorem in M. (4) Transport the average equality through the chosen J_b inner identification.

**Acceptance.** The statement retains the rational transfer witness in the non-quasi-split case.

**Sources.** [Honda-Tate theory for Shimura varieties](https://math.berkeley.edu/~swshin/HT.pdf), Section1.1.16 and Corollary1.1.17 pp.12-13.

<a id="abelianization-identification"></a>

### Abelianized classes equal fundamental coinvariants

**Theorem: TauCeti.BunG.AbelianizationIdentification.** For p-adic E there is a canonical B_ab(G)≅π_1(G)_Γ under which B(G)→B_ab(G) is κ. In a maximal-torus model this is coker(B(Tsc)→B(T)), using H^2(W_E,Tsc(L))=0 and the torus Kottwitz descriptions.

**Prerequisites.** [Abelianized Kottwitz set](#abelianized-kottwitz-set); [Torus norm and Newton average](#torus-norm-description); [Newton and Kottwitz invariants](#newton-and-kottwitz-maps); [EndoscopicTransferAndUnitaryTraceComparison:ET.0](../../../content/campaign/EndoscopicTransferAndUnitaryTraceComparison/README.md).

**Proof/construction.** (1) Apply the cohomology sequence for the two-term torus complex. (2) Use local Weil-torus H^2 vanishing supplied by ET.0’s group-specific cohomology package. (3) Identify the cokernel with the coroot quotient coinvariants.

**Acceptance.** Finite π_1 torsion survives the comparison.

**Sources.** [Geometrization of the local Langlands correspondence](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), LemmaIII.2.11 p.94.

<a id="rational-kottwitz-surjectivity"></a>

### Rational-point Kottwitz surjectivity

**Theorem: TauCeti.BunG.RationalKottwitzSurjectivity.** The restriction tildeκ:G(E)→(π_1(G)_I)^σ is surjective for connected reductive G over the nonarchimedean local field E. Its target is Frobenius invariants in inertia coinvariants, not π_1(G)_Γ. For the unramified Q_p model in Kisin17 Lemma4.6.4, J_b(Q_p)→π_1(G)^Γ is surjective for every b; the basic tame vH24 case also follows by inner-form compatibility and the rational quotient map.

**Prerequisites.** [Algebraic sigma-centralizer](#sigma-centralizer-J-b); [Newton and Kottwitz invariants](#newton-and-kottwitz-maps); [ReductiveGroups · layer 7 structure theory](../../../content/tau-ceti/ReductiveGroups/README.md#layer-7-structure-theory); [EndoscopicTransferAndUnitaryTraceComparison:ET.0](../../../content/campaign/EndoscopicTransferAndUnitaryTraceComparison/README.md).

**Proof/construction.** (1) For G(E), reduce to tori and simply connected derived groups using a z-extension and the exact invariant lattice sequence. (2) For unramified J_b, use Kisin’s local abelianized H^0 comparison and Levi invariant surjection, with local simply connected H^1 vanishing supplied separately. (3) Do not generalize the J_b target without the stated group hypotheses.

**Acceptance.** A ramified torus can have different invariant and coinvariant groups.

**Sources.** [Isocrystals with additional structure II](https://people.dm.unipi.it/maffei/didattica/male/lacci/Kottwitz.pdf), Section7.7 pp.300-301; [Mod p points on Shimura varieties of abelian type](https://people.math.harvard.edu/~kisin/dvifiles/lr.pdf?download=1), Lemma4.6.4 printed93; [Mod p points on Shimura varieties of parahoric level](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/EC6F7AD8C8B489FEB8FC4D64485ABE1D/S2050508624000222a.pdf/mod_p_points_on_shimura_varieties_of_parahoric_level.pdf), Corollary3.4.6 proof printed37.

<a id="component-kottwitz-coset"></a>

### Component Kottwitz coset

**Construction: TauCeti.BunG.ComponentCoset.** For b∈G(L) and a bound μ with compatible full κ, let c_(b,μ)={x∈π_1(G)_I:(σ−1)x=tildeκ(μ(π))−tildeκ(b)}. Compatibility in π_1(G)_Γ makes this a nonempty affine coset under (π_1(G)_I)^σ. This is an affine set of components, with no distinguished origin before a choice.

**Prerequisites.** [Newton and Kottwitz invariants](#newton-and-kottwitz-maps); [Acceptable classes B(G,{μ})](#admissible-pair).

**Proof/construction.** (1) Take the kernel/cokernel sequence of σ−1 on inertia coinvariants. (2) Full κ equality says the difference lies in its image; a chosen solution identifies the fibre with the kernel.

**API.**

| Declaration | Role | Contract |
|---|---|---|
| TauCeti.BunG.ComponentCoset.mem_iff | characterisation | A component x solves the stated difference equation. |
| TauCeti.BunG.ComponentCoset.nonempty | universal-property | The Γ-coinvariant compatibility is equivalent to nonemptiness. |
| TauCeti.BunG.ComponentCoset.translate | structure | Invariant classes act freely and transitively on the fibre. |
| TauCeti.BunG.ComponentCoset.liftZExtension | other | A z-extension and lifted b,μ give a surjective map of affine component cosets. |

**Discriminating unit tests.**

- **TauCeti.BunG.ComponentCoset.testIdentity** (degenerate): For σ=id a nonempty coset requires difference0 and equals the entire lattice.
- **TauCeti.BunG.ComponentCoset.testSign** (computation): On Z with σ=−id, the equation −2x=2 has unique solution x=−1.
- **TauCeti.BunG.ComponentCoset.testParity** (non-example): On the same lattice difference1 has no solution; its full coinvariant compatibility fails.

**Uses.** GLX Lemma3.16(2): Transfers component indices before any ADLV connectivity theorem. Kisin17 component actions: Uses the rational-point Kottwitz map on the acting group.

**Acceptance.** The generic affine fibre is represented honestly in the suggested file.

**Sources.** [The connected components of affine Deligne-Lusztig varieties](https://link.springer.com/content/pdf/10.1007/s00222-025-01386-1.pdf), Section1.1 equations1.1-1.2 and Section2.2 pp.813-814,818.

<a id="z-extension-bounded-lifting"></a>

### Bounded lifting through a z-extension

**Theorem: TauCeti.BunG.ZExtensionBoundedLifting.** For a z-extension 1→Z→Gtilde→G→1 with induced torus Z, every cocharacter class μ lifts after choosing maximal tori. Given b∈B(G,{μ}) and a chosen lift μtilde, there is btilde∈B(Gtilde,{μtilde}) above b; the induced map of component cosets is surjective. Projection to the adjoint group gives B(G,{μ})≅B(Gad,{μad}) with the fixed central invariant.

**Prerequisites.** [Acceptable classes B(G,{μ})](#admissible-pair); [Component Kottwitz coset](#component-kottwitz-coset); [Rational-point Kottwitz surjectivity](#rational-kottwitz-surjectivity); [ReductiveGroups · layer 7 structure theory](../../../content/tau-ceti/ReductiveGroups/README.md#layer-7-structure-theory).

**Proof/construction.** (1) Lift μ using the exact cocharacter sequence of the induced torus. (2) Use the adjoint acceptable-set bijection to choose btilde with the specified κ and Newton bound. (3) Lift differences in the affine coset using invariant-lattice surjectivity and H^1(E,Z)=0.

**Acceptance.** An arbitrary central torus lacks the induced-torus cohomological vanishing used here.

**Sources.** [The connected components of affine Deligne-Lusztig varieties](https://link.springer.com/content/pdf/10.1007/s00222-025-01386-1.pdf), Lemma3.16 p.829; [Isocrystals with additional structure II](https://people.dm.unipi.it/maffei/didattica/male/lacci/Kottwitz.pdf), Section6.5 equation6.5.1 p.287.

<a id="connected-center-basic-inner-forms"></a>

### Basic classes and adjoint torsors with connected center

**Theorem: TauCeti.BunG.ConnectedCenterBasicInnerForms.** If Z(G) is a connected torus, B(G)_basic→B(Gad)_basic≅H^1(E,Gad) is surjective. The map sends a basic class to the inner form J_b. The assertion does not assume this surjectivity for groups with disconnected center.

**Prerequisites.** [Basic sigma class](#basic-class); [Algebraic sigma-centralizer](#sigma-centralizer-J-b); [ReductiveGroups · layer 7 structure theory](../../../content/tau-ceti/ReductiveGroups/README.md#layer-7-structure-theory); [EndoscopicTransferAndUnitaryTraceComparison:ET.0](../../../content/campaign/EndoscopicTransferAndUnitaryTraceComparison/README.md).

**Proof/construction.** (1) Apply Kottwitz central-torus extension surjectivity to 1→Z(G)→G→Gad→1. (2) Use its restriction to the basic subsets; for an adjoint group basic Newton is0 and basic classes identify with H^1.

**Acceptance.** For SL_n, the finite center prevents invoking this connected-torus proposition.

**Sources.** [B(G) for all local and global fields](https://arxiv.org/pdf/1401.5728), Proposition10.4 printed50-51.

<a id="general-levi-newton-comparison"></a>

### Newton comparison for a Levi representative

**Theorem: TauCeti.BunG.GeneralLeviNewtonComparison.** Let M_J be a σ-stable standard Levi of a quasi-split based local group G and let b_M∈M_J(L) map to b∈B(G). Its M_J-dominant Newton point ν_M is Weyl-conjugate to ν_G and ν_G−ν_M is a nonnegative rational sum of simple G-coroots. If κ_M(b_M)=κ_M(t^λσ(η)) in the situation of He §6.2, then λ◇−ν_M belongs to the rational span of the J-coroots. This comparison does not require b or b_M to be basic.

**Prerequisites.** [Newton and Kottwitz invariants](#newton-and-kottwitz-maps); [Newton orbit space and rational dominance](#newton-orbit-space); [ReductiveGroupsPartII:RG2.1](../../../content/campaign/ReductiveGroupsPartII/README.md); [ReductiveGroupsPartII:RG2.4](../../../content/campaign/ReductiveGroupsPartII/README.md).

**Proof/construction.** (1) Newton functoriality identifies the geometric orbit; choose the dominant representatives in the two chambers. (2) Use Weyl chamber dominance for the first difference and the fundamental-group projection for the J-coroot span conclusion.

**Acceptance.** The separate basic-Levi uniqueness theorem retains its basic hypothesis.

**Sources.** [Cordial elements and dimensions of affine Deligne-Lusztig varieties](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/5A27DBF48CAEF6DA56A313061848574C/S205050862100010Xa.pdf/cordial-elements-and-dimensions-of-affine-delignelusztig-varieties.pdf), Section6.2 p.13.

## BG2:uniformization — The stack and its cover

Form Bun_G as a small groupoid-valued v-stack. Establish geometric-point classification and HN semicontinuity. Prove openness of the geometrically trivial locus before lifting modifications and proving BL surjectivity. Central-torus lifting then proves integral κ-local-constancy; the crossed-module computation gives its second p-adic proof.

<a id="curve-etale-base-site"></a>

### Curve-to-base étale site morphism

**Construction: TauCeti.BunG.CurveEtaleBase.** For S∈Perf_k, define τ:(X_S)_et→S_et through (X_S)_et≅(X_S^diamond)_et≅(Div^1_S)_et and the projection Div^1×S→S. Equivalently τ* sends étale T/S to X_T/X_S. This is a site morphism; no geometric projection X_S→S is postulated.

**Prerequisites.** [RelativeFarguesFontaine:RF2](../../../content/campaign/RelativeFarguesFontaine/README.md); [DiamondsAndVStacks:D2](../../../content/campaign/DiamondsAndVStacks/README.md); [DiamondsAndVStacks:D3](../../../content/campaign/DiamondsAndVStacks/README.md).

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
- **TauCeti.BunG.CurveEtaleBase.testNoProjection** (non-example): τ is not obtained by assuming an algebraic or adic X_S→S projection.

**Uses.** FS III.2.12: Computes derived pushforward of finite coefficients. FS III.2.13: Builds the sheaf of crossed-module curve classes.

**Acceptance.** The missing curve projection is precisely why this site construction is used.

**Sources.** [Geometrization of the local Langlands correspondence](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), III.2.4.2 p.94.

<a id="curve-torsion-cohomology"></a>

### Constant torsion cohomology on the curve

**Comparison: TauCeti.BunG.CurveTorsionCohomology.** For p-adic E, S∈Perf_k and a locally constant finite abelian sheaf F on Spa(E)_et, Rτ*(F|X_S) is the constant complex RΓ_et(Spa E,F). For algebraically closed perfectoid C the comparison is an isomorphism in all degrees. Prime-to-p coefficients use Kummer and p coefficients use Artin–Schreier after tilting.

**Prerequisites.** [Curve-to-base étale site morphism](#curve-etale-base-site); [DiamondEtaleCohomology:C1](../../../content/campaign/DiamondEtaleCohomology/README.md); [RelativeFarguesFontaine:RF0:annuli](../../../content/campaign/RelativeFarguesFontaine/README.md).

**Proof/construction.** (1) Apply proper base change along Div^1_S→S and reduce to geometric S. (2) After tilting to equal characteristic, annihilate cohomology on finite separable extensions using Kummer or Artin–Schreier. (3) Use Galois descent and the continuous direct limit over finite field extensions.

**Acceptance.** The argument is an actual cohomology computation, not a field in the definition of τ.

**Sources.** [Geometrization of the local Langlands correspondence](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), PropositionIII.2.12(i) pp.94-95.

<a id="bun-g-as-v-stack"></a>

### Moduli v-stack Bun_G

**Construction: TauCeti.BunG.Bun.** For S∈Perf_k, Bun_G(S) is the groupoid of G-bundles on X_S, with pullback along perfectoid maps. Effective v-descent for vector bundles and the rational tensor description make it a v-stack. On affinoid S the algebraic and adic curve descriptions agree by GAGA. The moduli keeps bundle isomorphisms, rather than quotienting them out.

**Prerequisites.** [G-bundles as exact tensor functors](#g-bundle); [Tannakian description of analytic torsors](#g-torsors-three-descriptions); [VectorBundlesAndIsocrystals:VB1/isocrystal-to-bundle-functor](../../../content/campaign/VectorBundlesAndIsocrystals/README.md); [DiamondsAndVStacks:D3](../../../content/campaign/DiamondsAndVStacks/README.md); [VectorBundlesAndIsocrystals:VB2:ampleness/gaga-equivalence](../../../content/campaign/VectorBundlesAndIsocrystals/README.md).

**Proof/construction.** (1) Apply v-descent for bundle evaluations and tensor constraints. (2) Use GAGA on each affinoid curve to identify the scheme and adic torsor groupoids.

**API.**

| Declaration | Role | Contract |
|---|---|---|
| TauCeti.BunG.Bun.objects | projection | Evaluate to the G-bundle groupoid on X_S. |
| TauCeti.BunG.Bun.pullback | functoriality | For T→S, pullback is X_T←X_S bundle pullback, with coherent identities and compositions. |
| TauCeti.BunG.Bun.ofIsocrystal | constructor | An exact tensor G-isocrystal gives the constant bundle E_b on every X_S. |
| TauCeti.BunG.Bun.isomSheaf | projection | The diagonal fibre is the v-sheaf Isom of two G-bundles. |
| TauCeti.BunG.Bun.gaga | equivalence | For affinoid S compare algebraic and analytic curve torsor categories. |

**Discriminating unit tests.**

- **TauCeti.BunG.Bun.testGLn** (compatibility): For GL_n, objects are rank-n vector bundles with all bundle isomorphisms.
- **TauCeti.BunG.Bun.testTrivial** (degenerate): For G=1, Bun_G is the terminal v-stack.
- **TauCeti.BunG.Bun.testNonbasicHom** (non-example): For GL_2 slopes0,1, bundle automorphisms include positive-slope sections, so the isocrystal-to-bundle functor is not fully faithful on the ungraded categories.

**Uses.** FS ChaptersIII-V: Supplies the base of every uniformization and chart map. ES7 and IG.0: The actual moduli stack is imported; their extra arithmetic structures stay with those owners.

**Acceptance.** Pullback preserves the unit and composition coherences.

**Sources.** [Geometrization of the local Langlands correspondence](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), DefinitionIII.1.2 p.88.

**Atlas planet:** Moduli of G-bundles.

<a id="bun-g-smallness"></a>

### Smallness of Bun_G

**Theorem: TauCeti.BunG.BunGSmallness.** Bun_G is a small v-stack. For an ω_1-cofiltered inverse system of affinoid perfectoids with limit S, Bun_G(S) is the filtered colimit of the groupoids Bun_G(S_i), and its Isom sheaves have the same limit property. Hence bundles and arrows descend to topologically countably generated coefficient algebras, giving a set-sized cover.

**Prerequisites.** [Moduli v-stack Bun_G](#bun-g-as-v-stack); [DiamondsAndVStacks:D3](../../../content/campaign/DiamondsAndVStacks/README.md); [VectorBundlesAndIsocrystals:VB2:ampleness/gaga-equivalence](../../../content/campaign/VectorBundlesAndIsocrystals/README.md); [RelativeFarguesFontaine:RF0:annuli](../../../content/campaign/RelativeFarguesFontaine/README.md).

**Proof/construction.** (1) Descend Cauchy sequences and interval period-ring elements through the ω_1-cofiltered limit. (2) Descend vector bundles, tensor data and arrows. (3) Take the disjoint union over a set of countably generated perfectoid algebras and bundle objects.

**Acceptance.** A claim of an arbitrary filtered-limit equivalence would be stronger than the source.

**Sources.** [Geometrization of the local Langlands correspondence](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), PropositionIII.1.3 pp.88-89.

<a id="points-are-B-of-G"></a>

### Geometric classification of G-bundles

**Theorem: TauCeti.BunG.PointsAreBOfG.** For complete algebraically closed nonarchimedean C/k, b↦E_b gives a bijection B(G)→Bun_G(C)/≅ and consequently B(G)≅|Bun_G|. The slope grading identifies isocrystals with HN-graded bundles; positive-slope H^1 vanishing splits the filtered tensor functor. It does not identify the ungraded groupoids or all their morphisms.

**Prerequisites.** [Moduli v-stack Bun_G](#bun-g-as-v-stack); [Kottwitz set B(G)](#sigma-conjugacy-quotient); [VectorBundlesAndIsocrystals:VB0/dieudonne-manin-isocrystals](../../../content/campaign/VectorBundlesAndIsocrystals/README.md); [VectorBundlesAndIsocrystals:VB1/isocrystal-to-bundle-functor](../../../content/campaign/VectorBundlesAndIsocrystals/README.md); [VectorBundlesAndIsocrystals:VB2:classification](../../../content/campaign/VectorBundlesAndIsocrystals/README.md); [VectorBundlesAndIsocrystals:VB4/relative-HN-filtration-and-proetale-splitting](../../../content/campaign/VectorBundlesAndIsocrystals/README.md); [VectorBundlesAndIsocrystals:VB3:general-BC/families-of-banach-colmez-spaces](../../../content/campaign/VectorBundlesAndIsocrystals/README.md); [ReductiveGroups · layer 7 structure theory](../../../content/tau-ceti/ReductiveGroups/README.md#layer-7-structure-theory).

**Proof/construction.** (1) Lift the bundle tensor functor canonically to HN-filtered bundles; verify exactness, including the equal-characteristic argument of Ans19. (2) Identify the graded slope category with Isoc_E via VB2 and VB0. (3) The torsor of tensor splittings is unipotent with positive vector-bundle graded pieces; H^1 vanishing trivializes it. (4) Use the geometric-point equivalence relation for small v-stacks to identify |Bun_G|.

**Acceptance.** GL_n recovers the vector-bundle slope multiset; positive Hom spaces remain in the ungraded bundle category.

**Sources.** [Geometrization of the local Langlands correspondence](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), TheoremIII.2.2 pp.89-90; [Reductive group schemes over the Fargues-Fontaine curve](https://arxiv.org/pdf/1703.00700), Theorem3.11 and proof pp.14-16.

**Atlas planet:** Geometric bundle classification.

<a id="hn-sign-and-semicontinuity"></a>

### HN sign and semicontinuity

**Theorem: TauCeti.BunG.HnSignAndSemicontinuity.** For E_b, its bundle HN class is ν_b*=w_0(−ν_b) and c_1(E_b)=−κ(b). The HN class ν* on |Bun_G| is upper semicontinuous: specialization can increase the upper-concave HN polygon. Detect the reductive order on rational representations using RR96 Lemma2.2 and VB4 relative semicontinuity.

**Prerequisites.** [Geometric classification of G-bundles](#points-are-B-of-G); [Representations detect Newton dominance](#representation-detects-dominance); [VectorBundlesAndIsocrystals:VB4/semicontinuity-of-HN-polygon](../../../content/campaign/VectorBundlesAndIsocrystals/README.md); [VectorBundlesAndIsocrystals:VB1/isocrystal-to-bundle-functor](../../../content/campaign/VectorBundlesAndIsocrystals/README.md).

**Proof/construction.** (1) Apply the linear slope sign convention under each representation. (2) Use RR96’s representation criterion to pass from the vector-bundle HN polygons to the reductive class.

**Acceptance.** For b=π^m in G_m, E_b=O(−m), fixing both the Newton and degree signs.

**Sources.** [Geometrization of the local Langlands correspondence](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), TheoremIII.2.3 and preceding paragraph p.91.

<a id="strictly-disconnected-torsors"></a>

### Pro-étale torsors on strictly disconnected bases

**Theorem: TauCeti.BunG.StrictlyDisconnectedTorsors.** Every pro-étale H-torsor on a strictly totally disconnected perfectoid S is trivial when H is a first-countable locally profinite group. Such torsors on arbitrary S are represented by perfectoid spaces as the inverse limit over compact open subgroups. First countability supplies the countable nested system used to choose compatible sections.

**Prerequisites.** [DiamondsAndVStacks:D2](../../../content/campaign/DiamondsAndVStacks/README.md); [DiamondsAndVStacks:D3](../../../content/campaign/DiamondsAndVStacks/README.md).

**Proof/construction.** (1) Reduce to a compact open subgroup after splitting the étale quotient cover. (2) Choose a countable cofinal system of open normal subgroups and compatible sections of the finite étale quotients. (3) Use separated étale descent and the perfectoid inverse-limit construction.

**Acceptance.** A generic torsor on an arbitrary perfectoid base need not be globally trivial.

**Sources.** [Geometrization of the local Langlands correspondence](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), RemarkIII.2.5 and LemmaIII.2.6 p.92.

<a id="geometrically-trivial-locus"></a>

### Geometrically trivial open locus

**Theorem: TauCeti.BunG.GeometricallyTrivialLocus.** Bun_G^1 is open and [*/G(E)]→Bun_G^1 is an equivalence, where G(E) has its locally profinite topology and torsors are pro-étale. Prove openness before κ-local-constancy: on strictly disconnected bases the ν=0 locus yields E-local systems; their continuous fibre functor is a reductive torsor over C^0(π_0S,E), whose triviality is open by henselian local rings.

**Prerequisites.** [HN sign and semicontinuity](#hn-sign-and-semicontinuity); [Pro-étale torsors on strictly disconnected bases](#strictly-disconnected-torsors); [VectorBundlesAndIsocrystals:VB4](../../../content/campaign/VectorBundlesAndIsocrystals/README.md); [ReductiveGroups · layer 7 structure theory](../../../content/tau-ceti/ReductiveGroups/README.md#layer-7-structure-theory); [DiamondsAndVStacks:D3](../../../content/campaign/DiamondsAndVStacks/README.md).

**Proof/construction.** (1) Use VB4’s equivalence of geometrically trivial bundles with E-local systems. (2) On a strictly disconnected base trivialize each local system, preserving its tensor structure. (3) Henselian continuity makes triviality of the fibre-functor torsor an open condition. (4) Identify the automorphism sheaf of the trivial bundle with the constant locally profinite G(E) sheaf.

**Acceptance.** The entire ν=0 locus can contain nontrivial torsion κ; it is not automatically Bun_G^1.

**Sources.** [Geometrization of the local Langlands correspondence](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), TheoremIII.2.4 pp.91-92.

**Atlas planet:** Trivial bundle locus.

<a id="diagonalizable-curve-cohomology"></a>

### Diagonalizable Weil–curve comparison

**Comparison: TauCeti.BunG.DiagonalizableCurveCohomology.** For p-adic E and diagonalizable D/E, the pro-étale sheaf associated to T/S↦H^1_et(X_T,D) is constant with value H^1(W_E,D(L)). For algebraically closed perfectoid C, H^i(W_E,D(L))≅H^i_et(X_C,D), 0≤i≤2. The natural map comes from the curve étale site to discrete W_E-sets. Use 1→D^0→D→π_0(D)→1 and retain all finite component contributions.

**Prerequisites.** [Constant torsion cohomology on the curve](#curve-torsion-cohomology); [Geometrically trivial open locus](#geometrically-trivial-locus); [Torus norm and Newton average](#torus-norm-description); [EndoscopicTransferAndUnitaryTraceComparison:ET.0](../../../content/campaign/EndoscopicTransferAndUnitaryTraceComparison/README.md).

**Proof/construction.** (1) For tori apply geometric classification and translate the neutral fibre using the Picard stack. (2) Use torsion comparison for finite π_0(D), which is étale in characteristic0. (3) Use the Weil-torus H^2 vanishing and compare the long exact sequences through degree2.

**Acceptance.** Do not silently apply this proof to μ_p in equal characteristic.

**Sources.** [Geometrization of the local Langlands correspondence](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), PropositionIII.2.12(ii), comparison morphism and RemarkIII.2.14 pp.94-97.

<a id="crossed-module-curve-classes"></a>

### Constant crossed-module curve classes

**Theorem: TauCeti.BunG.CrossedModuleCurveClasses.** For p-adic E, the pro-étale sheaf associated to T/S↦H^1_et(X_T,[Gsc→G]) is constant with value B_ab(G). The comparison identifies the curve abelianization of a bundle with its κ class.

**Prerequisites.** [Abelianized classes equal fundamental coinvariants](#abelianization-identification); [Diagonalizable Weil–curve comparison](#diagonalizable-curve-cohomology); [EndoscopicTransferAndUnitaryTraceComparison:ET.0](../../../content/campaign/EndoscopicTransferAndUnitaryTraceComparison/README.md).

**Proof/construction.** (1) Use the homotopy-equivalent center complex [Zsc→Z]. (2) Apply diagonalizable comparisons in degrees1 and2 to its long exact sequence. (3) Compare the curve and Weil abelianization maps; this is the second, p-adic-only proof of κ-local-constancy.

**Acceptance.** The first uniformization proof of κ-local-constancy remains independent of this second comparison proof.

**Sources.** [Geometrization of the local Langlands correspondence](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), PropositionIII.2.13 p.96.

<a id="grassmannian-point-lifting"></a>

### Grassmannian point lifting

**Lemma: TauCeti.BunG.GrassmannianPointLifting.** For strictly totally disconnected S=Spa(R,R+) over Spa(E) and s∈S, Gr_G(R)→Gr_G(K(s)) is surjective. Split G after a finite field extension embedded in R, use the Cartan decomposition, and lift G(B_dR^+(K(s))) through successive nilpotent thickenings by smoothness and Lie algebra surjectivity.

**Prerequisites.** [GeometricSatakeAndFusion:GS0:loop-geometry/schubert-bounds-and-properness](../../../content/campaign/GeometricSatakeAndFusion/README.md); [ReductiveGroupsPartII:RG2.4](../../../content/campaign/ReductiveGroupsPartII/README.md); [DiamondsAndVStacks:D2](../../../content/campaign/DiamondsAndVStacks/README.md); [RelativeFarguesFontaine:RF2:untilts](../../../content/campaign/RelativeFarguesFontaine/README.md).

**Proof/construction.** (1) Use the clopen-component argument to get R→K(s) surjective. (2) Lift group points using henselian smooth lifting. (3) Lift the positive period-ring points by the complete filtration and successive Lie corrections.

**Acceptance.** This supplies relative lifting from the fixed-point uniformization theorem.

**Sources.** [Geometrization of the local Langlands correspondence](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), LemmaIII.3.2 p.98.

<a id="beauville-laszlo-surjectivity"></a>

### Beauville–Laszlo uniformization

**Theorem: TauCeti.BunG.BeauvilleLaszloSurjectivity.** The modification map BL:Gr_G→Bun_G is a surjection of pro-étale stacks and hence of v-stacks. Over a geometric point and a chosen untilt, every G-bundle can be modified at its untilt point to a trivial bundle. Relatively, lift that modification on a strictly disconnected base and use the geometrically trivial open locus to trivialize it near the given point.

**Prerequisites.** [RelativeFarguesFontaine:RF4:G-torsors/modification-of-G-bundle-by-lattice](../../../content/campaign/RelativeFarguesFontaine/README.md); [Geometrically trivial open locus](#geometrically-trivial-locus); [Grassmannian point lifting](#grassmannian-point-lifting); [Geometric classification of G-bundles](#points-are-B-of-G); [Pro-étale torsors on strictly disconnected bases](#strictly-disconnected-torsors); [ReductiveGroups · layer 7 structure theory](../../../content/tau-ceti/ReductiveGroups/README.md#layer-7-structure-theory).

**Proof/construction.** (1) Apply Anschütz’s geometric-point modification theorem for arbitrary connected reductive G. (2) Lift the modification by the Grassmannian point-lifting lemma. (3) On its open trivial locus split the locally profinite torsor and choose a trivialization. (4) Descend the local modifications along the pro-étale cover.

**Acceptance.** RF4:G-torsors owns patching and the map; BG2 owns this surjectivity argument.

**Sources.** [Geometrization of the local Langlands correspondence](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), PropositionIII.3.1 p.98; [Reductive group schemes over the Fargues-Fontaine curve](https://arxiv.org/pdf/1703.00700), Theorem6.5 p.30.

**Atlas planet:** Beauville–Laszlo uniformization.

<a id="central-torus-grassmannian-surjectivity"></a>

### Central-torus Grassmannian surjectivity

**Lemma: TauCeti.BunG.CentralTorusGrassmannianSurjectivity.** For a central extension Gtilde→G with torus kernel Z, Gr_Gtilde→Gr_G is surjective as a v-sheaf. After a splitting field, split maximal-torus cocharacters lift; on Schubert cells compare the unipotent factors and the central torus lattice. Generic Schubert geometry is imported from GS0.

**Prerequisites.** [GeometricSatakeAndFusion:GS0:loop-geometry/schubert-bounds-and-properness](../../../content/campaign/GeometricSatakeAndFusion/README.md); [GeometricSatakeAndFusion:GS0:Schubert-smoothness/open-cell-stabilizer-and-smoothness](../../../content/campaign/GeometricSatakeAndFusion/README.md); [ReductiveGroups · layer 7 structure theory](../../../content/tau-ceti/ReductiveGroups/README.md#layer-7-structure-theory).

**Proof/construction.** (1) Pass v-locally to a splitting field. (2) Lift the Schubert cocharacter through the exact torus lattice map and lift the root-group coordinates. (3) Descend the local lifts to obtain v-surjectivity.

**Acceptance.** Unlike rational-point z-extension lifting, this geometric statement needs a torus kernel but not an induced torus.

**Sources.** [Geometrization of the local Langlands correspondence](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), LemmaIII.3.5 p.99.

<a id="central-torus-bundle-surjectivity"></a>

### Central-torus bundle surjectivity

**Lemma: TauCeti.BunG.CentralTorusBundleSurjectivity.** For a central extension Gtilde→G with torus kernel Z, Bun_Gtilde→Bun_G is a v-surjection. Bun_Z acts by central tensor product and Bun_G is its quotient stack; the action is a quasi-torsor before surjectivity is proved.

**Prerequisites.** [Beauville–Laszlo uniformization](#beauville-laszlo-surjectivity); [Central-torus Grassmannian surjectivity](#central-torus-grassmannian-surjectivity); [Structure group and tensor descent](#structure-group-and-tensor-descent); [DiamondsAndVStacks:D3](../../../content/campaign/DiamondsAndVStacks/README.md).

**Proof/construction.** (1) Lift a bundle to a Grassmannian point by BL, then lift that point along the central-torus map. (2) Identify its ambiguity with a Z-bundle via the contracted product and descend.

**Acceptance.** No circular use of κ-local-constancy is made in this proof.

**Sources.** [Geometrization of the local Langlands correspondence](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), LemmaIII.2.10 and proof afterIII.3.5 pp.93,99.

<a id="semicontinuity-and-local-constancy"></a>

### Local constancy of bundle Kottwitz invariant

**Theorem: TauCeti.BunG.SemicontinuityAndLocalConstancy.** κ:|Bun_G|→π_1(G)_Γ is locally constant, with the discrete topology on its integral target. Together with HN semicontinuity this makes |Bun_G|→B(G) continuous for the Newton-order topology. The proof for every local E uses central-torus bundle surjectivity, z-extensions and induced tori; the crossed-module proof is a second proof for p-adic E.

**Prerequisites.** [Central-torus bundle surjectivity](#central-torus-bundle-surjectivity); [HN sign and semicontinuity](#hn-sign-and-semicontinuity); [Newton and Kottwitz invariants](#newton-and-kottwitz-maps); [ReductiveGroups · layer 7 structure theory](../../../content/tau-ceti/ReductiveGroups/README.md#layer-7-structure-theory).

**Proof/construction.** (1) Reduce by a z-extension to simply connected derived group, then to G/Gder. (2) Resolve that torus by an induced torus and use central-torus bundle surjectivity. (3) For induced tori integral κ is torsion-free and determined by ν; the torus order is equality, so semicontinuity implies local constancy.

**Acceptance.** The norm-one torus torsion classes show why directly using ν for all tori fails.

**Sources.** [Geometrization of the local Langlands correspondence](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), TheoremIII.2.7 and first proof pp.92-93.

**Atlas planet:** Kottwitz local constancy.

<a id="grassmannian-kottwitz-sign"></a>

### Grassmannian components and Kottwitz sign

**Comparison: TauCeti.BunG.GrassmannianKottwitzSign.** For split G, GS0’s decomposition Gr_G=∐_(α∈π_1G) Gr_G^α has each component a filtered union of proper Schubert closures with [μ]=α. On the modification map, κ(BL(x))=−α. For nonsplit G, use geometric π_1 with Galois descent and then its Γ-coinvariant image in Bun_G. A component decomposition alone does not prove uniformization or bundle connectedness.

**Prerequisites.** [GeometricSatakeAndFusion:GS0:loop-geometry/schubert-bounds-and-properness](../../../content/campaign/GeometricSatakeAndFusion/README.md); [RelativeFarguesFontaine:RF4:G-torsors/modification-of-G-bundle-by-lattice](../../../content/campaign/RelativeFarguesFontaine/README.md); [Newton and Kottwitz invariants](#newton-and-kottwitz-maps); [Local constancy of bundle Kottwitz invariant](#semicontinuity-and-local-constancy).

**Proof/construction.** (1) Import the geometric connected-component theorem, its Schubert exhaustion and the nonsplit descent from GS0. (2) Evaluate on a cocharacter modification to fix the minus sign. (3) Use locally constant κ and connected Schubert pieces to extend the equality.

**Acceptance.** For G_m, the lattice ξ^m produces O(m) with κ=−m under the fixed BL convention.

**Sources.** [Geometrization of the local Langlands correspondence](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), PropositionIII.3.6(ii)-(iii) pp.99-100; [Affine Grassmannians and the geometric Satake in mixed characteristic](https://annals.math.princeton.edu/wp-content/uploads/annals-v185-n2-p02-p.pdf), Proposition1.21 p.427.

<a id="newton-topology-homeomorphism"></a>

### Viehmann Newton topology theorem

**Theorem: TauCeti.BunG.NewtonTopologyHomeomorphism.** The bijection |Bun_G|→B(G) is a homeomorphism when B(G) has the specialization order [b]≤[bprime] iff E_bprime lies in the closure of E_b. Thus closed upper Newton unions and open lower unions are determined by the fixed-κ order. The assertion was a conjecture in FS III.2.15 and is a theorem in Viehmann; its full proof is a separate proof-interior obligation.

**Prerequisites.** [Geometric classification of G-bundles](#points-are-B-of-G); [Local constancy of bundle Kottwitz invariant](#semicontinuity-and-local-constancy); [Newton partial order with Kottwitz fibre](#partial-order-on-B-of-G).

**Proof/construction.** (1) Use the established continuous bijection from FS. (2) Apply Viehmann’s realization of the specialization relations to prove the inverse continuous. (3) Expand the proof interior from section6 before claiming a lemma-level closed plan.

**Acceptance.** The basic point is more general than unstable points with the same κ.

**Sources.** [On Newton strata in the B_dR^+-Grassmannian](https://arxiv.org/pdf/2101.07510), Theorem1.1 and preceding topology convention p.2; [Geometrization of the local Langlands correspondence](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), ConjectureIII.2.15 p.97.

**Atlas planet:** Newton topology theorem.

<a id="modification-newton-bound"></a>

### Newton bound for a modification

**Theorem: TauCeti.BunG.ModificationNewtonBound.** For G/Q_p and any geometric cocharacter class μ, a geometric point of Gr_(G,μ) modifying the trivial bundle determines b∈B(G,{μ^−1}). For GL_n the bundle Newton tuple is dominated by its relative-position tuple with matching total degree; translate through ν_bundle=w_0(−ν_isocrystal). The full κ equality is μ^−1♯.

**Prerequisites.** [RelativeFarguesFontaine:RF4:G-torsors/modification-of-G-bundle-by-lattice](../../../content/campaign/RelativeFarguesFontaine/README.md); [Geometric classification of G-bundles](#points-are-B-of-G); [HN sign and semicontinuity](#hn-sign-and-semicontinuity); [Acceptable classes B(G,{μ})](#admissible-pair); [Representations detect Newton dominance](#representation-detects-dominance); [GeometricSatakeAndFusion:GS0:loop-geometry/schubert-bounds-and-properness](../../../content/campaign/GeometricSatakeAndFusion/README.md).

**Proof/construction.** (1) For GL_n use exterior powers to reduce to a bound on the first slope and determinant degree. (2) Compute the determinant line modification to establish the equality of totals. (3) Use RR96’s representation criterion for G and the component-sign comparison for κ.

**Acceptance.** The inverse Hodge class is essential in the CS convention.

**Sources.** [On the generic part of the cohomology of compact unitary Shimura varieties](https://annals.math.princeton.edu/wp-content/uploads/annals-v186-n3-p01-p.pdf), Proposition3.5.3 and Lemma3.5.4 pp.687-689.

<a id="minuscule-modification-image"></a>

### Minuscule modification image

**Theorem: TauCeti.BunG.MinusculeModificationImage.** For minuscule μ over Q_p, the map from the flag variety Fℓ_(G,μ)≅Gr_(G,μ) to B(G,{μ^−1}) is surjective on geometric classes. This is stronger than the invariant containment for all μ and uses the Rapoport existence result recalled by CS17 Remark3.5.8.

**Prerequisites.** [Newton bound for a modification](#modification-newton-bound); [GeometricSatakeAndFusion:GS0:Schubert-smoothness/open-cell-stabilizer-and-smoothness](../../../content/campaign/GeometricSatakeAndFusion/README.md); [Acceptable classes B(G,{μ})](#admissible-pair).

**Proof/construction.** (1) Use the minuscule flag/Grassmannian identification supplied by GS0. (2) Apply Rapoport PropositionA.9 for every acceptable class; its original proof is an explicit gap, not inferred from containment.

**Acceptance.** A nonempty acceptable index set alone does not produce a flag point.

**Sources.** [On the generic part of the cohomology of compact unitary Shimura varieties](https://annals.math.princeton.edu/wp-content/uploads/annals-v186-n3-p01-p.pdf), Remark3.5.8 p.689.

<a id="de-rham-quotient-group-class"></a>

### Class from a de Rham quotient-group lattice

**Comparison: TauCeti.BunG.DeRhamQuotientGroupClass.** In Liu–Zhu Corollary4.9, the tensor functor has domain Rep_(Q_p)(G^c), where G^c=G/Z_G^s. At a classical point embedded into C_p, its de Rham comparison defines compatible B_dR^+ lattices. The Fargues tensor modification construction therefore gives a class in B(G^c_(Q_p)). Producing a class in B(G_(Q_p)) requires a chosen compatible lift or additional G-level tensor data. No canonical lift is claimed.

**Prerequisites.** [Tannakian description of analytic torsors](#g-torsors-three-descriptions); [RelativeFarguesFontaine:RF4:G-torsors/modification-of-G-bundle-by-lattice](../../../content/campaign/RelativeFarguesFontaine/README.md); [Geometric classification of G-bundles](#points-are-B-of-G); [Central-torus bundle surjectivity](#central-torus-bundle-surjectivity).

**Proof/construction.** (1) Apply de Rham comparison at the point in every rational G^c representation. (2) Use the exact tensor lattice-to-bundle functor from RF4 and classify the resulting curve bundle. (3) Retain the correct coefficient group; central-torus v-surjectivity is local existence and supplies no canonical G-level lift.

**Acceptance.** The reviewed PAPER-LIU-ZHU-17/G22 qualification is retained.

**Sources.** [Rigidity and a Riemann-Hilbert correspondence for p-adic local systems](https://arxiv.org/pdf/1602.06282v3), Corollary4.9 and Remark4.1(iii) pp.33-34.

## BG2:smooth-Artin — The whole smooth Artin stack

Use the Isom sheaves for the diagonal and the quotients of open Schubert cells for a covering. The proof establishes smooth Artin geometry of the whole stack and then computes its connected components; smoothness of separate strata does not supply this theorem.

<a id="isom-sheaf-representability"></a>

### Locally spatial Isom diagonal

**Theorem: TauCeti.BunG.IsomSheafRepresentability.** For G-bundles E1,E2 over X_S, Isom_G(E1,E2) is a locally spatial diamond over S. For vector bundles the surjection locus and isomorphism locus are open subdiamonds of BC(E1∨⊗E2). For general reductive G, a Chevalley faithful representation with its stabilizer line presents Isom_G as finite closed compatibility conditions inside products of these linear Isom diamonds.

**Prerequisites.** [Moduli v-stack Bun_G](#bun-g-as-v-stack); [VectorBundlesAndIsocrystals:VB3:general-BC/families-of-banach-colmez-spaces](../../../content/campaign/VectorBundlesAndIsocrystals/README.md); [ReductiveGroups · layer 7 structure theory](../../../content/tau-ceti/ReductiveGroups/README.md#layer-7-structure-theory); [ReductiveGroups · layer 1 representations  comodules](../../../content/tau-ceti/ReductiveGroups/README.md#layer-1-representations--comodules); [DiamondsAndVStacks:D4](../../../content/campaign/DiamondsAndVStacks/README.md).

**Proof/construction.** (1) For a linear map the support of the cokernel is closed and has closed image in S; surjectivity is its open complement. (2) Isomorphisms require both a map and its dual to be surjective. (3) Apply the actual rational Chevalley stabilizer presentation and stability of locally spatial diamonds under finite limits.

**Acceptance.** The faithful representation includes its defining tensor constraints; arbitrary GL_n isomorphisms need not preserve G.

**Sources.** [Geometrization of the local Langlands correspondence](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), LemmaIV.1.20 and proof ofIV.1.19 pp.112-113.

<a id="bun-g-is-smooth-artin"></a>

### Cohomological smoothness of Bun_G

**Theorem: TauCeti.BunG.BunGIsSmoothArtin.** For ℓ≠p, Bun_G is an ℓ-cohomologically smooth Artin v-stack of ℓ-dimension0. The disjoint union over Galois cocharacter orbits of [G(E)\Gr_(G,μbar)] maps to Bun_G by a separated cohomologically smooth surjection. These are open Schubert cells, not their generally singular closures.

**Prerequisites.** [Smallness of Bun_G](#bun-g-smallness); [Beauville–Laszlo uniformization](#beauville-laszlo-surjectivity); [Geometrically trivial open locus](#geometrically-trivial-locus); [Locally spatial Isom diagonal](#isom-sheaf-representability); [GeometricSatakeAndFusion:GS0:Schubert-smoothness/open-cell-stabilizer-and-smoothness](../../../content/campaign/GeometricSatakeAndFusion/README.md); [VStackSheavesAndLisseCategories:VS0](../../../content/campaign/VStackSheavesAndLisseCategories/README.md).

**Proof/construction.** (1) The diagonal is locally spatial by the Isom theorem. (2) After an untilt, each fibre is the open locus of fixed-relative-position modifications that are geometrically trivial. (3) Use GS0 open-cell cohomological smoothness, and independent BL uniformization for surjectivity. (4) The source quotient is smooth over [*/G(E)] with dimension<2ρ,μ>, and the map has the same relative dimension; subtract them to obtain dimension0. (5) Import VS0 Artin descent, separatedness and locally profinite classifying-stack charts; no GS4, VS1 or VS4 is used.

**Acceptance.** For infinite locally profinite G(E), *→[*/G(E)] is not used as a cohomologically smooth atlas.

**Sources.** [Geometrization of the local Langlands correspondence](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), TheoremIV.1.19 pp.112-113.

**Atlas planet:** Smooth Artin moduli stack.

<a id="connected-components"></a>

### Connected components of Bun_G

**Theorem: TauCeti.BunG.ConnectedComponents.** κ induces π_0(Bun_G)≅π_1(G)_Γ. Every nonempty open substack contains a basic point: restrict to a finite T_0 Newton region, take an open point, and compare the whole-stack dimension0 with the stratum dimension −<2ρ,ν_b> to force central ν_b.

**Prerequisites.** [Local constancy of bundle Kottwitz invariant](#semicontinuity-and-local-constancy); [Cohomological smoothness of Bun_G](#bun-g-is-smooth-artin); [Cohomological dimension of Newton strata](#stratum-dimension); [Semistable locus and basic strata](#semistable-locus-and-basic-strata); [Kottwitz classification by both invariants](#classification-by-two-invariants); [VStackSheavesAndLisseCategories:VS0](../../../content/campaign/VStackSheavesAndLisseCategories/README.md).

**Proof/construction.** (1) Use the finite T_0 open-point lemma with the discrete κ coordinate. (2) An open stratum has the ambient dimension0, so its positive-root pairing vanishes and b is basic. (3) The basic κ bijection makes each fibre connected; two disjoint nonempty open pieces would each have to contain its unique basic point.

**Acceptance.** Torsion components such as split PGL_n’s Z/n are included.

**Sources.** [Geometrization of the local Langlands correspondence](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), CorollaryIV.1.23 and LemmaIV.1.24 pp.113-114.

**Atlas planet:** Connected components of Bun_G.

## BG3 — Basic and nonbasic strata

Identify HN-graded objects, the filtered relative automorphism group and its global sections. The positive kernel produces the true classifying-stack description for a nonbasic stratum. Pull minuscule flag modifications back to these strata, and retain the exact unitary datum in the dimension and ordinary-locus comparisons.

<a id="hn-graded-g-bundles"></a>

### HN-graded G-bundles

**Construction: TauCeti.BunG.HNGraded.** Bun_G^(HN-split)(S) consists of exact rational tensor functors into Q-graded bundles on X_S with weight-λ piece everywhere semistable of bundle slope λ. For b, use the slope-reversed grading of E_b. Forgetting the grading lands in Bun_G. The graded automorphism group scheme is the constant curve group J_b×X_S.

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

**Sources.** [Geometrization of the local Langlands correspondence](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), PropositionIII.4.7 pp.102-103.

**Atlas planet:** HN-graded G-bundles.

<a id="hn-graded-classification"></a>

### Classification of HN-graded bundles

**Theorem: TauCeti.BunG.HnGradedClassification.** The natural map ∐_b[*/J_b(E)]→Bun_G^(HN-split) is an equivalence. The graded fibre is locally isomorphic to E_b^gr and its Isom torsor is a J_b-bundle geometrically trivial at the chosen point; openness and locally profinite torsor triviality make it locally constant.

**Prerequisites.** [HN-graded G-bundles](#hn-graded-g-bundles); [Geometrically trivial open locus](#geometrically-trivial-locus); [Pro-étale torsors on strictly disconnected bases](#strictly-disconnected-torsors); [VectorBundlesAndIsocrystals:VB4/relative-HN-filtration-and-proetale-splitting](../../../content/campaign/VectorBundlesAndIsocrystals/README.md).

**Proof/construction.** (1) Use local constancy of the filtration type and relative HN graded semistability. (2) Apply the trivial-locus theorem to the J_b Isom torsor. (3) Descend the local objects with their graded automorphisms.

**Acceptance.** This is an equivalence of graded groupoids, stronger than geometric point classification.

**Sources.** [Geometrization of the local Langlands correspondence](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), PropositionIII.4.7 pp.102-103.

<a id="filtered-automorphism-group-scheme"></a>

### Filtered torsor automorphism group schemes

**Construction: TauCeti.BunG.FilteredAutomorphism.** For a reductive G/K, scheme X/K and Q-filtered G-fibre functor E, let H=Aut_G(E), its inner group over X. For λ≥0, H^≥λ consists of automorphisms whose difference from1 raises every represented filtration by at least λ. H^≥0 is parabolic with unipotent radical H^>0; the groups are smooth, Lie H^≥λ=(ad E)^≥λ, and for λ>0 the quotient H^≥λ/H^>λ is the vector group (ad E)^≥λ/(ad E)^>λ.

**Prerequisites.** [Pure inner twisting of torsors](#pure-inner-twisting); [ReductiveGroups · layer 7 structure theory](../../../content/tau-ceti/ReductiveGroups/README.md#layer-7-structure-theory); [ReductiveGroups · layer 1 representations  comodules](../../../content/tau-ceti/ReductiveGroups/README.md#layer-1-representations--comodules); [TauCeti.Cocharacter.parabolic](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Algebra/AlgebraicGroup/Dynamic/Parabolic.lean); [TauCeti.Cocharacter.leviGroupExtension](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Algebra/AlgebraicGroup/Dynamic/LeviDecomposition/Basic.lean); [TauCeti.FGPointRepresentationCat](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Algebra/AlgebraicGroup/Representation/Comodule/Equivalence.lean); [TauCeti.FGPointRepresentationCat.instRigidCategory](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Algebra/AlgebraicGroup/Representation/Comodule/Monoidal.lean).

**Proof/construction.** (1) Use étale-local splitting of Q-filtered fibre functors and torsors. (2) In the split chart apply the cocharacter root-weight decomposition; descend smooth closed subgroups and Lie gradings. (3) Tau Ceti supplies dynamic point-group parabolic and Levi splitting only; relative scheme representability remains in the requested group-form input.

**API.**

| Declaration | Role | Contract |
|---|---|---|
| TauCeti.BunG.FilteredAutomorphism.raising_iff | characterisation | For every rational representation and λprime, (γ−1)E^≥λprime⊂E^≥(λprime+λ). |
| TauCeti.BunG.FilteredAutomorphism.parabolic | projection | H^≥0 is the filtration-preserving parabolic. |
| TauCeti.BunG.FilteredAutomorphism.unipotent | projection | H^>0 is its unipotent radical. |
| TauCeti.BunG.FilteredAutomorphism.graded | equivalence | For λ>0 the quotient is the stated additive vector group. |
| TauCeti.BunG.FilteredAutomorphism.pullback | functoriality | Scheme pullback commutes with H, its filtration and vector-group quotients. |

**Discriminating unit tests.**

- **TauCeti.BunG.FilteredAutomorphism.testGL2** (computation): For the two-step diagonal filtration the parabolic is triangular and the positive radical has one root line.
- **TauCeti.BunG.FilteredAutomorphism.testTrivialFiltration** (degenerate): For the trivial filtration H^≥0=H and H^>0=1.
- **TauCeti.BunG.FilteredAutomorphism.testZeroWeight** (non-example): At λ=0 the reductive Levi quotient is not generally an additive vector group.

**Uses.** FS III.5.1: The global sections give the full automorphism filtration. FS V.3.5: The opposite filtration gives the extension tower in the chart.

**Acceptance.** A field of point-subgroup data alone cannot represent this relative group scheme.

**Sources.** [Geometrization of the local Langlands correspondence](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), PropositionIII.5.2 p.105.

<a id="full-automorphism-v-group"></a>

### Full bundle automorphism v-group

**Construction: TauCeti.BunG.FullAutomorphism.** For b, tildeJ_b(S)=Aut_(X_S)(E_b). Every automorphism preserves HN; its action on the associated graded gives a split exact sequence 1→tildeJ_b^>0→tildeJ_b→J_b(E)→1, with tildeJ_b=tildeJ_b^>0⋊J_b(E). For positive bundle slope λ the graded quotient is BC((ad E_b)^λ); it corresponds to the isocrystal slope −λ. The connected kernel is generally nonzero for nonbasic b.

**Prerequisites.** [Classification of HN-graded bundles](#hn-graded-classification); [Filtered torsor automorphism group schemes](#filtered-automorphism-group-scheme); [VectorBundlesAndIsocrystals:VB3:general-BC/families-of-banach-colmez-spaces](../../../content/campaign/VectorBundlesAndIsocrystals/README.md); [VectorBundlesAndIsocrystals:VB4/relative-HN-filtration-and-proetale-splitting](../../../content/campaign/VectorBundlesAndIsocrystals/README.md); [Algebraic sigma-centralizer](#sigma-centralizer-J-b).

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

**Sources.** [Geometrization of the local Langlands correspondence](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), PropositionIII.5.1 pp.104-105.

**Atlas planet:** Full bundle automorphism group.

<a id="positive-automorphism-kernel"></a>

### Positive automorphism kernel geometry

**Theorem: TauCeti.BunG.PositiveAutomorphismKernel.** tildeJ_b^>0 is a successive extension of positive Banach–Colmez spaces, represented by a locally spatial diamond. For ℓ≠p it is cohomologically smooth of dimension sum_(λ>0) λ·rank((ad E_b)^λ)=<2ρ,ν_b>. Its connectedness identifies π_0 tildeJ_b=J_b(E). All dimensions use the isocrystal dominant ν_b with the slope reversal already incorporated.

**Prerequisites.** [Full bundle automorphism v-group](#full-automorphism-v-group); [VectorBundlesAndIsocrystals:VB3:general-BC/families-of-banach-colmez-spaces](../../../content/campaign/VectorBundlesAndIsocrystals/README.md); [VStackSheavesAndLisseCategories:VS0](../../../content/campaign/VStackSheavesAndLisseCategories/README.md); [ReductiveGroupsPartII:RG2.1](../../../content/campaign/ReductiveGroupsPartII/README.md).

**Proof/construction.** (1) Induct over the finite positive filtration and use BC positive-slope smoothness, connectedness and H^1 vanishing. (2) Apply additivity of ℓ-dimension to the extension tower. (3) Compute the positive adjoint root weights as the 2ρ pairing.

**Acceptance.** For O⊕O(1), the kernel dimension is1; its quotient classifying stack has dimension−1.

**Sources.** [Geometrization of the local Langlands correspondence](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), PropositionIII.5.1 pp.104-105.

<a id="quasi-split-opposite-parabolic"></a>

### Quasi-split opposite-parabolic automorphisms

**Comparison: TauCeti.BunG.QuasiSplitOppositeParabolic.** For quasi-split G and a dominant rational ν_b, M_b=Z_G(ν_b), P_b^− is the parabolic with nonpositive ν_b weights. The curve group Q=E_(b_M)×^(M_b)P_b^− has tildeJ_b(S)=Q(X_S) and positive kernel Γ(X_S,R_uQ). The opposite sign reflects the slope-reversing isocrystal-to-bundle functor.

**Prerequisites.** [Full bundle automorphism v-group](#full-automorphism-v-group); [Rational Newton representative](#rational-newton-witness); [ReductiveGroups · layer 7 structure theory](../../../content/tau-ceti/ReductiveGroups/README.md#layer-7-structure-theory); [VectorBundlesAndIsocrystals:VB1/isocrystal-to-bundle-functor](../../../content/campaign/VectorBundlesAndIsocrystals/README.md).

**Proof/construction.** (1) Use the rational Newton representative to put b in its Levi. (2) Identify the HN-preserving inner parabolic with the twist of P_b^−. (3) Take curve sections and compare its unipotent root bundles with the positive HN pieces.

**Acceptance.** For GL_2 O⊕O(1), the positive section is the O(1) upper entry.

**Sources.** [Geometrization of the local Langlands correspondence](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), III.5.1.1 pp.105-106.

<a id="semistable-locus-and-basic-strata"></a>

### Semistable locus and basic strata

**Construction: TauCeti.BunG.Semistable.** Bun_G^ss is the full substack where every geometric fibre has central Newton morphism. It is open; κ decomposes it into open and closed basic strata and Bun_G^ss≃∐_(b basic)[*/J_b(E)]. Each basic stratum is neutralized by its chosen E_b; the locally profinite topology on J_b(E) is retained.

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

**Sources.** [Geometrization of the local Langlands correspondence](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), TheoremIII.4.5 p.102.

**Atlas planet:** Semistable bundle locus.

<a id="torus-picard-stack"></a>

### Torus bundle Picard stack

**Construction: TauCeti.BunG.TorusPicard.** For a torus T, Bun_T is a Picard stack fitting into 0→[*/T(E)]→Bun_T→X_*(T)_Γ→0. Every κ-fibre is a T(E)-banded gerbe neutralized by a choice of representative b of its class. A multiplicative splitting exists when a group section of T(L)→B(T) is chosen, for example when B(T) is torsion-free. It is not asserted canonically for a torus with torsion coinvariants.

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

**Sources.** [Geometrization of the local Langlands correspondence](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), ExampleIII.4.6 p.102.

<a id="stratum-is-classifying-stack"></a>

### Full classifying-stack description of a stratum

**Theorem: TauCeti.BunG.StratumIsClassifyingStack.** For every b, Bun_G^b is the locally closed full substack of bundles geometrically isomorphic to E_b and Bun_G^b≃[*/tildeJ_b]. The map to [*/J_b(E)] has the canonical section induced by the semidirect splitting. For basic b the kernel vanishes; for nonbasic b it must be retained.

**Prerequisites.** [HN sign and semicontinuity](#hn-sign-and-semicontinuity); [Local constancy of bundle Kottwitz invariant](#semicontinuity-and-local-constancy); [Full bundle automorphism v-group](#full-automorphism-v-group); [Classification of HN-graded bundles](#hn-graded-classification); [VectorBundlesAndIsocrystals:VB4/relative-HN-filtration-and-proetale-splitting](../../../content/campaign/VectorBundlesAndIsocrystals/README.md); [VectorBundlesAndIsocrystals:VB3:general-BC/families-of-banach-colmez-spaces](../../../content/campaign/VectorBundlesAndIsocrystals/README.md); [DiamondsAndVStacks:D3](../../../content/campaign/DiamondsAndVStacks/README.md).

**Proof/construction.** (1) Constant HN type gives a relative filtered tensor functor. (2) Use the graded classification to trivialize its graded Isom torsor locally. (3) Positive filtered H^1 vanishing lifts a graded isomorphism to a filtered one. (4) Thus *→Bun_G^b is a v-surjection whose relation is exactly tildeJ_b.

**Acceptance.** A positive-dimensional stabilizer changes both the stratum geometry and its dimension.

**Sources.** [Geometrization of the local Langlands correspondence](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), PropositionIII.5.3 p.106.

**Atlas planet:** Newton stratum classifying stack.

<a id="automorphism-torsor-reduction"></a>

### Reduction of full automorphism torsors

**Lemma: TauCeti.BunG.AutomorphismTorsorReduction.** Over affinoid perfectoid S, every tildeJ_b-torsor is induced from a J_b(E)-torsor and is representable in locally spatial diamonds; the reduction follows from H^1_v vanishing for the positive Banach–Colmez graded pieces. This is an existence of reduction, not a canonical equivalence of all torsor groupoids.

**Prerequisites.** [Full bundle automorphism v-group](#full-automorphism-v-group); [VectorBundlesAndIsocrystals:VB3:general-BC/families-of-banach-colmez-spaces](../../../content/campaign/VectorBundlesAndIsocrystals/README.md); [Pro-étale torsors on strictly disconnected bases](#strictly-disconnected-torsors); [DiamondsAndVStacks:D3](../../../content/campaign/DiamondsAndVStacks/README.md).

**Proof/construction.** (1) Reduce successive positive extensions using affinoid v-H^1 vanishing. (2) Apply perfectoid representability of locally profinite torsors.

**Acceptance.** Different reductions can have positive-kernel automorphisms; do not collapse them.

**Sources.** [Geometrization of the local Langlands correspondence](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), RemarkIII.5.4 p.106.

<a id="stratum-dimension"></a>

### Cohomological dimension of Newton strata

**Theorem: TauCeti.BunG.StratumDimension.** For ℓ≠p, Bun_G^b is a cohomologically smooth Artin v-stack of ℓ-dimension −<2ρ,ν_b>. The fibre over [*/J_b(E)] has the smooth cover * of relative dimension <2ρ,ν_b>; the rational-point classifying stack has dimension0.

**Prerequisites.** [Full classifying-stack description of a stratum](#stratum-is-classifying-stack); [Positive automorphism kernel geometry](#positive-automorphism-kernel); [VStackSheavesAndLisseCategories:VS0](../../../content/campaign/VStackSheavesAndLisseCategories/README.md).

**Proof/construction.** (1) Use the full kernel and its positive BC filtration to compute the dimension of the relative classifying stack. (2) Add the dimension0 of [*/J_b(E)] from VS0’s locally profinite classifying-stack theorem.

**Acceptance.** The O⊕O(1) stratum has dimension−1 despite its algebraic J_b being a torus.

**Sources.** [Geometrization of the local Langlands correspondence](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), PropositionIV.1.22 p.113.

**Atlas planet:** Newton stratum dimension.

<a id="flag-newton-strata"></a>

### Newton strata of a minuscule flag variety

**Construction: TauCeti.BunG.FlagNewton.** For G/Q_p, minuscule μ and its reflex field E_μ, let Fℓ_(G,μ) be the adic/diamond flag variety and E(x) the modification of the trivial G-bundle at the untilt. Define Fℓ_(G,μ)^b as its fibre over Bun_G^b. The point map is independent of algebraically closed residue-field extension, is constant along rank-one generalization, and has image B(G,{μ^−1}).

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

**Sources.** [On the generic part of the cohomology of compact unitary Shimura varieties](https://annals.math.princeton.edu/wp-content/uploads/annals-v186-n3-p01-p.pdf), Definition3.5.6 pp.689-690.

**Atlas planet:** Flag Newton strata.

<a id="flag-strata-semicontinuity"></a>

### Closed upper flag Newton unions

**Theorem: TauCeti.BunG.FlagStrataSemicontinuity.** The flag Newton strata are locally closed and partially proper, their upper unions Fℓ^≥b are closed, and the basic stratum is open. The bundle HN polygon is upper semicontinuous under specialization, with κ fixed by μ^−1. CS17 Proposition3.5.7 prints lower semicontinuity; the retained E35 correction uses the upper-polygon and closed-upper-union convention.

**Prerequisites.** [Newton strata of a minuscule flag variety](#flag-newton-strata); [HN sign and semicontinuity](#hn-sign-and-semicontinuity); [Finiteness and the basic acceptable member](#admissible-finiteness-and-basic); [DiamondsAndVStacks:D4](../../../content/campaign/DiamondsAndVStacks/README.md).

**Proof/construction.** (1) Pull back HN semicontinuity and the constant κ bound. (2) Use the finite acceptable indexing set and representation inequalities to identify the closed upper unions. (3) Partial properness follows from the flag diamond and the fixed-class locally closed condition in the source’s adic sense.

**Acceptance.** No general dimension formula is asserted for every reductive minuscule flag datum.

**Sources.** [On the generic part of the cohomology of compact unitary Shimura varieties](https://annals.math.princeton.edu/wp-content/uploads/annals-v186-n3-p01-p.pdf), Proposition3.5.7 and Corollary3.5.9 pp.689-690.

<a id="unitary-flag-stratum-dimension"></a>

### Unitary flag Newton dimensions

**Theorem: TauCeti.BunG.UnitaryFlagStratumDimension.** For the CS24 Section2.1 quasi-split unitary similitude datum on F^(2n) with its standard skew-hermitian form, self-dual O_F-lattice and signatures(n,n), at p unramified in F, let d=n²[F+:Q]. Its flag strata have Krull dimension d−d_b, where d_b=<2ρ,ν_b> is IG.0’s dimension of the corresponding Igusa variety. This is the specific unitary dimension statement of Theorem2.7.3, not a general dimension formula deduced solely from upper semicontinuity.

**Prerequisites.** [Closed upper flag Newton unions](#flag-strata-semicontinuity); [Cohomological dimension of Newton strata](#stratum-dimension); [IgusaVarietiesAndTorsionConcentration:IG.0](../../../content/campaign/IgusaVarietiesAndTorsionConcentration/README.md); [GeometricSatakeAndFusion:GS0:Schubert-smoothness/open-cell-stabilizer-and-smoothness](../../../content/campaign/GeometricSatakeAndFusion/README.md).

**Proof/construction.** (1) Identify the PEL p-divisible-group Newton index with the BL bundle index, retaining μ inverse. (2) Import the unitary local deformation and Igusa dimension calculation from IG.0. (3) Apply the CS17/CS24 local period-fibre calculation to transfer the codimension to the flag stratum; the general relative-dimension-to-Krull comparison requires the stated datum and remains a proof-interior expansion.

**Acceptance.** The dimensions concern |Fℓ^b|, not the negative ℓ-dimension of Bun_G^b.

**Sources.** [On the generic part of the cohomology of non-compact unitary Shimura varieties](https://arxiv.org/pdf/1909.01898v2), Section2.1 pp.11-12 and Theorem2.7.3 p.33.

<a id="unitary-ordinary-flag-locus"></a>

### Unitary ordinary flag locus

**Theorem: TauCeti.BunG.UnitaryOrdinaryFlagLocus.** In the preceding unramified quasi-split CS24 unitary similitude datum, the reflex field is Q and the largest acceptable element is ordinary. Its flag stratum is Fℓ(Q_p), interpreted as the constant locally profinite rational-point diamond; hence its Krull dimension is0. The original Wedhorn and CGH comparison inputs are explicitly retained as source gaps.

**Prerequisites.** [Unitary flag Newton dimensions](#unitary-flag-stratum-dimension); [Ordinary Newton class](#ordinary-class); [IgusaVarietiesAndTorsionConcentration:IG.0](../../../content/campaign/IgusaVarietiesAndTorsionConcentration/README.md); [ReductiveGroupsPartII:RG2.3](../../../content/campaign/ReductiveGroupsPartII/README.md); [DiamondsAndVStacks:D4](../../../content/campaign/DiamondsAndVStacks/README.md).

**Proof/construction.** (1) Use the rational reflex cocharacter and the unramified ordinary theorem. (2) Apply the actual local p-divisible/flag ordinary comparison of CGH Proposition3.3.8. (3) A locally profinite diamond has Krull dimension0.

**Acceptance.** The corresponding basic flag stratum is the open one; ordinary is the maximum index, not the basic index.

**Sources.** [On the generic part of the cohomology of non-compact unitary Shimura varieties](https://arxiv.org/pdf/1909.01898v2), AfterTheorem2.7.3 p.33.

## BG4 — Local charts and specialization geometry

A chart parametrizes the opposite filtered extensions of E_b. Prove its map to the graded classifying stack, identify the split section and spatial complement, and use the central Newton action for properness. The Jacobian criterion and tangent positivity identify its smooth open image as the lower Newton locus.

<a id="filtered-bundle-chart"></a>

### Opposite filtered-bundle chart

**Construction: TauCeti.BunG.FilteredChart.** M(S) consists of G-bundles E on X_S with an increasing, separated and exhaustive Q-filtration on every rational representation, exact and tensor-compatible, whose weight-λ graded piece is semistable of bundle slope λ. This is opposite to the decreasing HN filtration. The associated graded map to Bun_G^(HN-split) decomposes M=∐_b M_b and gives q_b:M_b→[*/J_b(E)] and π_b:M_b→Bun_G.

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

**Sources.** [Geometrization of the local Langlands correspondence](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), DefinitionV.3.2 and ExampleV.3.3 pp.173-174.

**Atlas planet:** Filtered bundle chart.

<a id="quasi-split-parabolic-chart"></a>

### Quasi-split parabolic chart

**Comparison: TauCeti.BunG.QuasiSplitParabolicChart.** For quasi-split G and a rational dominant Newton representative, let M_b=Z_G(ν_b) and P_b be its parabolic with nonnegative ν_b weights. Then M_b(chart)=Bun_(P_b)×_(Bun_(M_b))Bun_(M_b)^(b_M), with the Levi basic summand identified as [*/J_b(E)]. Use the source’s positive Newton parabolic; it is opposite to the curve-HN automorphism parabolic.

**Prerequisites.** [Opposite filtered-bundle chart](#filtered-bundle-chart); [Rational Newton representative](#rational-newton-witness); [Semistable locus and basic strata](#semistable-locus-and-basic-strata); [ReductiveGroups · layer 7 structure theory](../../../content/tau-ceti/ReductiveGroups/README.md#layer-7-structure-theory).

**Proof/construction.** (1) A filtered fibre functor of the fixed type is the corresponding P_b reduction. (2) The graded semistable condition is precisely the basic Levi bundle condition. (3) Transport the diagram through the rational cocharacter filtration dictionary.

**Acceptance.** For a nonsplit inner form this particular rational parabolic presentation is not asserted.

**Sources.** [Geometrization of the local Langlands correspondence](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), ExampleV.3.4 p.174.

<a id="chart-over-classifying-stack"></a>

### Negative Banach–Colmez tower of a chart

**Theorem: TauCeti.BunG.ChartOverClassifyingStack.** q_b:M_b→[*/J_b(E)] is partially proper, representable in locally spatial diamonds, and ℓ-cohomologically smooth of relative dimension <2ρ,ν_b> for ℓ≠p. After graded framing it is a successive torsor under negative Banach–Colmez v-sheaves, namely H^1 of the negative curve-slope pieces of the opposite unipotent group. The framed v-sheaf itself is not an absolute diamond; its punctured complement is locally spatial, and the representability assertion is relative.

**Prerequisites.** [Opposite filtered-bundle chart](#filtered-bundle-chart); [Filtered torsor automorphism group schemes](#filtered-automorphism-group-scheme); [VectorBundlesAndIsocrystals:VB3:general-BC/families-of-banach-colmez-spaces](../../../content/campaign/VectorBundlesAndIsocrystals/README.md); [VStackSheavesAndLisseCategories:VS0](../../../content/campaign/VStackSheavesAndLisseCategories/README.md).

**Proof/construction.** (1) The framed chart is the H^<0 torsor moduli on the curve. (2) Filter H^<0 by its negative vector-bundle quotients, giving the H^1 extension tower. (3) Use the relative BC supplier’s partial properness, representability and smoothness; add dimensions.

**Acceptance.** Absolute tildeM_b need not be a diamond even though tildeM_b→* is representable in locally spatial diamonds.

**Sources.** [Geometrization of the local Langlands correspondence](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), PropositionV.3.5 p.174.

**Atlas planet:** Negative Banach–Colmez chart.

<a id="section-and-spatial-complement"></a>

### Split section and spatial chart complement

**Theorem: TauCeti.BunG.SectionAndSpatialComplement.** The split section [*/J_b(E)]→M_b is closed and is exactly the locus whose underlying bundle is geometrically E_b. Its framed preimage is the origin. The open complement tildeM_b°=tildeM_b minus {origin} is a spatial diamond. The unsplit extensions satisfy [bprime]≤[b] and can be strictly smaller.

**Prerequisites.** [Negative Banach–Colmez tower of a chart](#chart-over-classifying-stack); [Classification of HN-graded bundles](#hn-graded-classification); [HN sign and semicontinuity](#hn-sign-and-semicontinuity); [VectorBundlesAndIsocrystals:VB3:projectivized-properness/properness-of-projectivized-BC](../../../content/campaign/VectorBundlesAndIsocrystals/README.md); [VectorBundlesAndIsocrystals:VB4/relative-HN-filtration-and-proetale-splitting](../../../content/campaign/VectorBundlesAndIsocrystals/README.md).

**Proof/construction.** (1) An extension is Newton-bounded by its split graded object, so the equal-class locus is closed. (2) There the opposite filtration and HN filtration are transverse, giving a graded splitting. (3) At the first nonzero extension step, the punctured negative BC space is an absolute diamond; combine the finite tower and the properness argument to get spatiality.

**Acceptance.** For the GL_2 example, the origin gives O⊕O(1); nonzero extension gives the rank2 O(1/2) block.

**Sources.** [Geometrization of the local Langlands correspondence](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), PropositionV.3.6 pp.175-176.

**Atlas planet:** Spatial chart complement.

<a id="contracting-chart-action"></a>

### Contracting chart action and proper quotient

**Theorem: TauCeti.BunG.ContractingChartAction.** For sufficiently divisible N>0, the central Newton morphism in J_b gives U_π=ν_(b,J)^N(π)∈J_b(E). It contracts the framed extension tower to the origin. On tildeM_b° the Z-action has the source’s escaping property and tildeM_b°/U_π^Z→* is proper. This is ordinary properness, not merely partial properness.

**Prerequisites.** [Split section and spatial chart complement](#section-and-spatial-complement); [Decent representative](#decent-representative); [Central Newton morphism of the centralizer](#central-newton-on-J); [VectorBundlesAndIsocrystals:VB3:projectivized-properness/properness-of-projectivized-BC](../../../content/campaign/VectorBundlesAndIsocrystals/README.md); [VectorBundlesAndIsocrystals:VB4](../../../content/campaign/VectorBundlesAndIsocrystals/README.md); [DiamondsAndVStacks:D4](../../../content/campaign/DiamondsAndVStacks/README.md).

**Proof/construction.** (1) Choose a finite descent coefficient field and an integral Newton multiple. (2) At the first nonzero negative extension piece, U_π acts by a positive power of π; negative iterations escape each quasicompact open. (3) Apply the contraction/fixed-point lemma from the VB4 supplier and projectivized BC properness to the tower.

**Acceptance.** The quotient is proper only after removal of the fixed origin.

**Sources.** [Geometrization of the local Langlands correspondence](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), PropositionV.3.6 pp.175-176.

<a id="chart-jacobian-positivity"></a>

### Positive tangent criterion for the filtered chart

**Lemma: TauCeti.BunG.ChartJacobianPositivity.** After S→Bun_G corresponds to E, the fibre M×_(Bun_G)S is the open subfunctor of sections of E×^GFl→X_S having semistable graded pieces of their specified slopes. Fl is the disjoint union of projective filtration varieties. Along these sections its tangent bundle has a finite filtration with semistable positive-slope quotients, so the section lies in VS1’s cohomologically smooth locus.

**Prerequisites.** [Opposite filtered-bundle chart](#filtered-bundle-chart); [Semistable locus and basic strata](#semistable-locus-and-basic-strata); [ReductiveGroups · layer 7 structure theory](../../../content/tau-ceti/ReductiveGroups/README.md#layer-7-structure-theory); [ReductiveGroups · layer 1 representations  comodules](../../../content/tau-ceti/ReductiveGroups/README.md#layer-1-representations--comodules); [VStackSheavesAndLisseCategories:VS1/jacobian-criterion](../../../content/campaign/VStackSheavesAndLisseCategories/README.md); [VectorBundlesAndIsocrystals:VB4/relative-HN-filtration-and-proetale-splitting](../../../content/campaign/VectorBundlesAndIsocrystals/README.md).

**Proof/construction.** (1) Identify rational tensor filtrations with sections of the flag scheme. (2) Use semistable openness on each graded piece. (3) Calculate tangent root weights and convert to positive bundle slopes. (4) Apply the actual Jacobian section-space theorem, including its smooth quasi-projective curve scheme hypotheses.

**Acceptance.** Tangent positivity is the reason the late chart theorem uses VS1.

**Sources.** [Geometrization of the local Langlands correspondence](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), Proof ofTheoremV.3.7 p.177.

<a id="chart-to-bun-g"></a>

### Smooth specialization neighborhoods

**Theorem: TauCeti.BunG.ChartToBunG.** π_b:M_b→Bun_G is separated, partially proper, representable in locally spatial diamonds and ℓ-cohomologically smooth of relative dimension <2ρ,ν_b>. Its open image is exactly the points whose corresponding bundles specialize to E_b; in the fixed-κ order this is {[bprime]:[bprime]≤[b]}. The charts cover Bun_G, since every b lies in its own chart image.

**Prerequisites.** [Positive tangent criterion for the filtered chart](#chart-jacobian-positivity); [Negative Banach–Colmez tower of a chart](#chart-over-classifying-stack); [Contracting chart action and proper quotient](#contracting-chart-action); [Cohomological smoothness of Bun_G](#bun-g-is-smooth-artin); [VStackSheavesAndLisseCategories:VS1/jacobian-criterion](../../../content/campaign/VStackSheavesAndLisseCategories/README.md); [VStackSheavesAndLisseCategories:VS0](../../../content/campaign/VStackSheavesAndLisseCategories/README.md).

**Proof/construction.** (1) Apply the section-space Jacobian criterion for representability, partial properness, separatedness and smoothness. (2) Subtract dim Bun_G=0 from dim M_b to compute relative dimension. (3) The split section contains the b-stratum; openness of the image includes every generalization of b. (4) The contracting action degenerates every chart point to the split section, proving the reverse inclusion.

**Acceptance.** For κ=1 in GL_2, the chart of slopes1,0 contains its basic generalization1/2,1/2.

**Sources.** [Geometrization of the local Langlands correspondence](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), TheoremV.3.7 p.177.

**Atlas planet:** Smooth specialization chart.

<a id="gl2-extension-chart"></a>

### Rank-two extension chart

**Application: TauCeti.BunG.Gl2ExtensionChart.** For graded bundle O⊕O(1), tildeM_b=BC(O(−1)[1]) parametrizes framed extensions 0→O→E→O(1)→0. E is either split or the simple rank2 slope1/2 bundle. The fibres of π_b are open subspaces of (BC(E) minus {0})/E× of nowhere-vanishing sections giving the prescribed quotient.

**Prerequisites.** [Smooth specialization neighborhoods](#chart-to-bun-g); [VectorBundlesAndIsocrystals:VB3:general-BC/families-of-banach-colmez-spaces](../../../content/campaign/VectorBundlesAndIsocrystals/README.md); [VectorBundlesAndIsocrystals:VB3:projectivized-properness/properness-of-projectivized-BC](../../../content/campaign/VectorBundlesAndIsocrystals/README.md); [VectorBundlesAndIsocrystals:VB2:classification](../../../content/campaign/VectorBundlesAndIsocrystals/README.md); [VectorBundlesAndIsocrystals:VB4](../../../content/campaign/VectorBundlesAndIsocrystals/README.md).

**Proof/construction.** (1) Identify Ext^1 with the negative BC H^1 of O(−1). (2) Use the rank2 bundle classification and determinant degree1. (3) Describe a filtration by a nowhere-vanishing section, and import the saturated-section open condition.

**Acceptance.** The split point has full positive automorphism kernel; the framed chart extension direction has negative slope.

**Sources.** [Geometrization of the local Langlands correspondence](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), ExampleV.3.1 p.173.

## Exact supplier contracts

Each contract imports the supplier’s own general theory. The named consumer declarations identify why the statement is required. A request does not claim the supplier has already implemented its theorem.

### R01 — AlgebraicModuliForArithmeticGeometry:R09.3

Use the existing étale/fpqc descent of affine morphisms, torsors and locally free modules. Do not infer the relative filtered reductive-group representability theorem from algebraic-space descent alone; its missing foundation is G02.

**Consumers:** [Tannakian description of analytic torsors](#g-torsors-three-descriptions); [Structure group and tensor descent](#structure-group-and-tensor-descent); [Algebraic sigma-centralizer](#sigma-centralizer-J-b); [Pure inner twisting of torsors](#pure-inner-twisting); [Families of G-isocrystals](#families-of-g-isocrystals); [Isocrystal-family v-descent and strata](#isocrystal-family-v-descent); [Finite Frobenius norm centralizer](#finite-frobenius-norm-centralizer).

### R02 — DiamondEtaleCohomology:C1

Use proper base change under the prime-to-p finite-coefficient hypotheses, including Scholze Corollary16.10(ii), not the j! exchange result of C5. The extra p-torsion tilting/Artin–Schreier computation needed for FS III.2.12(i) is G05.

**Consumers:** [Constant torsion cohomology on the curve](#curve-torsion-cohomology).

### R03 — DiamondsAndVStacks:D2

Use étale sites of locally spatial diamonds, the curve/Div^1 local comparison, and strictly totally disconnected geometric point lifting.

**Consumers:** [Curve-to-base étale site morphism](#curve-etale-base-site); [Pro-étale torsors on strictly disconnected bases](#strictly-disconnected-torsors); [Grassmannian point lifting](#grassmannian-point-lifting).

### R04 — DiamondsAndVStacks:D3

Use small v-stacks, sheafification, groupoids, torsors and descent, including FS III.2.5 for locally profinite group torsors. Export SW18.3.1 clopen comparison for Spd(R,R); no valuation/support commuting map is used.

**Consumers:** [Pure inner twisting of torsors](#pure-inner-twisting); [Families of G-isocrystals](#families-of-g-isocrystals); [Isocrystal-family v-descent and strata](#isocrystal-family-v-descent); [Kottwitz invariant in isocrystal families](#family-kottwitz-local-constancy); [Curve-to-base étale site morphism](#curve-etale-base-site); [Moduli v-stack Bun_G](#bun-g-as-v-stack); [Smallness of Bun_G](#bun-g-smallness); [Pro-étale torsors on strictly disconnected bases](#strictly-disconnected-torsors); [Geometrically trivial open locus](#geometrically-trivial-locus); [Central-torus bundle surjectivity](#central-torus-bundle-surjectivity); [Torus bundle Picard stack](#torus-picard-stack); [Full classifying-stack description of a stratum](#stratum-is-classifying-stack); [Reduction of full automorphism torsors](#automorphism-torsor-reduction); [Opposite filtered-bundle chart](#filtered-bundle-chart).

### R05 — DiamondsAndVStacks:D4

Use spatiality, closed/open loci, properness, geometric points and quotients by the escaping Z-action. The formalism must distinguish a diamond from a quotient stack and partial from ordinary properness.

**Consumers:** [Locally spatial Isom diagonal](#isom-sheaf-representability); [Contracting chart action and proper quotient](#contracting-chart-action); [Newton strata of a minuscule flag variety](#flag-newton-strata); [Closed upper flag Newton unions](#flag-strata-semicontinuity); [Unitary ordinary flag locus](#unitary-ordinary-flag-locus).

### R06 — EndoscopicTransferAndUnitaryTraceComparison:ET.0

Use local reductive Galois/Weil cohomology, crossed modules [Gsc→G], quasi-isomorphisms with [Tsc→T] and [Zsc→Z], abelianization and simply connected local H^1 vanishing. Request the degree-two Weil torus vanishing and point-to-curve comparison compatibility in G03. Generic extensions come from proposed RG2.6; do not construct a second B(G), κ, ν, J_b or acceptable-class theory. Export the identification H^1(E,H)≅(π_1(H)_Γ)_tors for connected reductive local H, using the BG1 Kottwitz invariant, rather than a second invariant definition.

**Consumers:** [Specialness for a transferred centralizer torus](#transferred-torus-specialness); [Abelianized Kottwitz set](#abelianized-kottwitz-set); [Abelianized classes equal fundamental coinvariants](#abelianization-identification); [Diagonalizable Weil–curve comparison](#diagonalizable-curve-cohomology); [Constant crossed-module curve classes](#crossed-module-curve-classes); [Rational-point Kottwitz surjectivity](#rational-kottwitz-surjectivity); [Basic classes and adjoint torsors with connected center](#connected-center-basic-inner-forms).

### R07 — GeometricSatakeAndFusion:GS0:Schubert-smoothness/open-cell-stabilizer-and-smoothness

Use smoothness and stabilizer computation for open minuscule Schubert cells and the quotient presentation of the flag variety; do not assert smoothness of a Schubert closure.

**Consumers:** [Central-torus Grassmannian surjectivity](#central-torus-grassmannian-surjectivity); [Cohomological smoothness of Bun_G](#bun-g-is-smooth-artin); [Minuscule modification image](#minuscule-modification-image); [Newton strata of a minuscule flag variety](#flag-newton-strata); [Unitary flag Newton dimensions](#unitary-flag-stratum-dimension).

### R08 — GeometricSatakeAndFusion:GS0:loop-geometry/schubert-bounds-and-properness

Use Schubert exhaustion/properness, the geometric loop/Grassmannian connected-component identification with the appropriate π_1 coinvariants, and cocharacter lattice representatives, including nonsplit descent. Zhu Proposition1.21 and its Kottwitz torus-functor argument belong to GS0; BG2 proves only the sign under BL.

**Consumers:** [Grassmannian point lifting](#grassmannian-point-lifting); [Central-torus Grassmannian surjectivity](#central-torus-grassmannian-surjectivity); [Grassmannian components and Kottwitz sign](#grassmannian-kottwitz-sign); [Newton bound for a modification](#modification-newton-bound).

### R09 — IgusaVarietiesAndTorsionConcentration:IG.0

Use its unitary PEL signatures, integral model and comparison of the local B-class with the p-divisible-group Newton stratum of dimension d_b=<2ρ,ν_b>. BG3 constructs the flag Newton strata and proves their dimension d−d_b for precisely this unitary datum. IG.0 imports BG0/BG1 general B(G), κ, ν, J_b and acceptable classes; avoid an edge back from BG1 to PEL geometry.

**Consumers:** [Unitary flag Newton dimensions](#unitary-flag-stratum-dimension); [Unitary ordinary flag locus](#unitary-ordinary-flag-locus).

### R10 — ReductiveGroupsPartII:RG2.1

Export split-rank and relative-root interfaces for the reductive group and its centralizer, root/coroot lattices, Levi chamber transport and Galois actions. Extend the based-root package to the unramified-replacement averaging and triality orbit equality used by KMPS Proposition1.1.10; keep its proof here as a supplier request. Include the torsion-free Levi coinvariant kernel needed for the KMPS minuscule lifting argument; its refinement is G10.

**Consumers:** [Defect of a sigma class](#defect); [Basic Levi Newton formula](#levi-newton-formula); [Positive automorphism kernel geometry](#positive-automorphism-kernel); [Newton orbit space and rational dominance](#newton-orbit-space); [Newton comparison for a Levi representative](#general-levi-newton-comparison).

### R11 — ReductiveGroupsPartII:RG2.3

Export the connected parahoric model, its positive loop group, its extended-Weyl double-coset parametrization and the integral conjugacy/lifting input used by KZ Proposition2.3.3. Preserve the distinction between a parahoric and G(O_L) in the hypotheses.

**Consumers:** [Straight Weyl comparison with B(G)](#straight-weyl-classification); [Integral conjugacy of an ordinary admissible element](#ordinary-integral-conjugacy); [Unitary ordinary flag locus](#unitary-ordinary-flag-locus).

### R12 — ReductiveGroupsPartII:RG2.4

Export extended affine Weyl groups, Newton vectors from finite twisted products, σ-straight elements with ℓ(w)=<2ρ,ν_w>, the μ-admissible Bruhat subset and Levi/Iwasawa/Cartan reduction with integral π_1 compatibility. Supply the KMPS Wintenberger realization, Satake reduction and unramified Mazur input as local Cartan facts; BG1 owns only their Newton-class consequences.

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

Export the finite-dimensional isocrystal tensor category over a general local coefficient field E, semilinear descent and change-of-trivialization, with rank-one π^m slope m. No reductive B(G) theory is imported from this linear stage. Export the compatible local algebraic closures, the embedding into the coefficient algebraic closure, arithmetic Frobenius and degree-r unramified fixed fields. Global-v choices of the Shimura paper are not used in the local targets.

**Consumers:** [Families of G-isocrystals](#families-of-g-isocrystals).

### R20 — VectorBundlesAndIsocrystals:VB0/dieudonne-manin-isocrystals

Use Dieudonné–Manin decomposition, rational slope denominator multiplicities and End of simple slope a/h as the division algebra of invariant a/h; retain the right-module convention.

**Consumers:** [Division-algebra Morita comparison](#division-algebra-morita); [Geometric classification of G-bundles](#points-are-B-of-G); [Quasi-split centralizer in the GL minuscule case](#gl-minuscule-quasisplit-centralizer); [Rational slope protorus](#slope-protorus); [Newton and Kottwitz invariants](#newton-and-kottwitz-maps).

### R21 — VectorBundlesAndIsocrystals:VB0/isocrystal-category-and-standard-block

Use the exact rigid finite-dimensional linear isocrystal category and its standard simple slope block, extending the WittVector.Isocrystal baseline to general E.

**Consumers:** [G-isocrystals](#g-isocrystals-and-B-of-G).

### R22 — VectorBundlesAndIsocrystals:VB0/tensor-and-dual-slopes

Use tensor/dual/exactness of linear slope gradings, with Frobenius eigenvalue valuation determining the isocrystal slope.

**Consumers:** [G-isocrystals](#g-isocrystals-and-B-of-G).

### R23 — VectorBundlesAndIsocrystals:VB1

Use finite locally free bundles and their effective v-descent as an exact tensor category; no analytic G-torsor patching is needed for algebraic BG0 classification.

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

Use relative positive/negative Banach–Colmez spaces with their section/extension interpretation, dimensions, connectedness and ℓ-cohomological smoothness; no full reductive automorphism group is supplied by BC alone.

**Consumers:** [Geometric classification of G-bundles](#points-are-B-of-G); [Full bundle automorphism v-group](#full-automorphism-v-group); [Positive automorphism kernel geometry](#positive-automorphism-kernel); [Full classifying-stack description of a stratum](#stratum-is-classifying-stack); [Reduction of full automorphism torsors](#automorphism-torsor-reduction); [Locally spatial Isom diagonal](#isom-sheaf-representability); [Negative Banach–Colmez tower of a chart](#chart-over-classifying-stack); [Rank-two extension chart](#gl2-extension-chart).

### R28 — VectorBundlesAndIsocrystals:VB3:projectivized-properness/properness-of-projectivized-BC

Use properness of the projectivized negative-extension/BC quotient with its explicit origin removed, as needed for FS V.3.6. Retain ordinary properness in addition to partial properness.

**Consumers:** [Split section and spatial chart complement](#section-and-spatial-complement); [Contracting chart action and proper quotient](#contracting-chart-action); [Rank-two extension chart](#gl2-extension-chart).

### R29 — VectorBundlesAndIsocrystals:VB4

Use positive bundle H^1 vanishing, local-system detection, and the contraction/escaping criterion for the finite extension tower of FS V.3.6. Export the linear statement; BG4 proves its reductive chart consequence.

**Consumers:** [Geometrically trivial open locus](#geometrically-trivial-locus); [Contracting chart action and proper quotient](#contracting-chart-action); [Rank-two extension chart](#gl2-extension-chart).

### R30 — VectorBundlesAndIsocrystals:VB4/relative-HN-filtration-and-proetale-splitting

Use tensor-compatible relative HN filtration, pro-étale local splitting and the equivalence of everywhere slope-zero bundles with E-local systems. Keep slope signs as bundle slopes.

**Consumers:** [Geometric classification of G-bundles](#points-are-B-of-G); [HN-graded G-bundles](#hn-graded-g-bundles); [Classification of HN-graded bundles](#hn-graded-classification); [Full bundle automorphism v-group](#full-automorphism-v-group); [Full classifying-stack description of a stratum](#stratum-is-classifying-stack); [Opposite filtered-bundle chart](#filtered-bundle-chart); [Split section and spatial chart complement](#section-and-spatial-complement); [Positive tangent criterion for the filtered chart](#chart-jacobian-positivity).

### R31 — VectorBundlesAndIsocrystals:VB4/semicontinuity-of-HN-polygon

Use upper semicontinuity of relative HN polygons; G-bundle dominance is deduced by evaluation on every rational representation.

**Consumers:** [HN sign and semicontinuity](#hn-sign-and-semicontinuity).

### R32 — tauceti:TauCetiRoadmap/ReductiveGroups#layer-1-representations--comodules

Use the existing rational representation/comodule category, rigid exact tensor structure, tensor-functor torsor reconstruction and faithful-representation descent. Export the upstream definitions rather than replacing them by abstract representations of G(E). Relative analytic/scheme representability beyond the existing field category is separately recorded in gap G02.

**Consumers:** [G-bundles as exact tensor functors](#g-bundle); [Structure group and tensor descent](#structure-group-and-tensor-descent); [G-isocrystals](#g-isocrystals-and-B-of-G); [Filtered torsor automorphism group schemes](#filtered-automorphism-group-scheme); [Locally spatial Isom diagonal](#isom-sheaf-representability); [Positive tangent criterion for the filtered chart](#chart-jacobian-positivity); [Rational slope protorus](#slope-protorus); [Representations detect Newton dominance](#representation-detects-dominance).

### R33 — tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory

Use existing Borels, maximal tori, parabolics, Levi factors and based root/Galois data. Generic pure-inner descent, elliptic torus transfer and filtered relative group-scheme representability need the extension in G02; generic z-extensions are separately requested as proposed RG2.6, not inferred from layer7 or RG2.5. Exact routed refinements: elliptic maximal tori modulo the center; rational transfer of a maximal torus of an inner Levi and its existence for quasi-split or elliptic cases; descent of Galois-invariant parabolic classes and rational Levi factors. These additions are G02, not claimed built in the field layer.

**Consumers:** [Tannakian description of analytic torsors](#g-torsors-three-descriptions); [G-isocrystals](#g-isocrystals-and-B-of-G); [Algebraic sigma-centralizer](#sigma-centralizer-J-b); [Decent representative](#decent-representative); [Existence of decent representatives](#existence-of-decent-representative); [Division-algebra Morita comparison](#division-algebra-morita); [Basic Levi Newton formula](#levi-newton-formula); [Minuscule basic Levi lifting](#minuscule-basic-levi-lift); [Torus-special acceptable pair](#torus-special-pair); [Elliptic tori and basic acceptable classes](#elliptic-torus-basic-image); [Specialness for a transferred centralizer torus](#transferred-torus-specialness); [Ordinary straight translation and Levi centrality](#ordinary-straight-translation); [Ordinary classes under a derived isogeny](#ordinary-derived-isogeny); [Products and unramified restriction of scalars](#product-and-unramified-norm); [Abelianized Kottwitz set](#abelianized-kottwitz-set); [Geometric classification of G-bundles](#points-are-B-of-G); [Geometrically trivial open locus](#geometrically-trivial-locus); [Beauville–Laszlo uniformization](#beauville-laszlo-surjectivity); [Central-torus Grassmannian surjectivity](#central-torus-grassmannian-surjectivity); [Local constancy of bundle Kottwitz invariant](#semicontinuity-and-local-constancy); [Filtered torsor automorphism group schemes](#filtered-automorphism-group-scheme); [Quasi-split opposite-parabolic automorphisms](#quasi-split-opposite-parabolic); [Locally spatial Isom diagonal](#isom-sheaf-representability); [Quasi-split parabolic chart](#quasi-split-parabolic-chart); [Positive tangent criterion for the filtered chart](#chart-jacobian-positivity); [Finite Frobenius norm centralizer](#finite-frobenius-norm-centralizer); [Quasi-split centralizer in the GL minuscule case](#gl-minuscule-quasisplit-centralizer); [Algebraic fundamental group](#algebraic-fundamental-group); [Newton orbit space and rational dominance](#newton-orbit-space); [Galois averaging and Hodge invariants](#galois-average); [Newton and Kottwitz invariants](#newton-and-kottwitz-maps); [Kottwitz classification by both invariants](#classification-by-two-invariants); [Basic sigma class](#basic-class); [Rational Newton representative](#rational-newton-witness); [Torus norm and Newton average](#torus-norm-description); [Rational-point Kottwitz surjectivity](#rational-kottwitz-surjectivity); [Bounded lifting through a z-extension](#z-extension-bounded-lifting); [Basic classes and adjoint torsors with connected center](#connected-center-basic-inner-forms).

### R34 — ReductiveGroupsPartII:RG2.5

Ownership-extension request: add proposed stage RG2.6 after the current RG2.5. Supply existence of z-extensions (induced central torus kernel, simply connected derived group), a surjection from an induced torus to any torus, cocharacter/π_1 exactness, invariant-lattice surjectivity and central-torus descent. Current RG2.5 owns dual/L-group data and is not claimed to prove these inputs. Extend to z-embeddings in the shared owner when ES consumers require them, following the confirmed RT10 proposal. BG1 retains the B-set/acceptable-set consequences; ET.0 imports the common foundation.

**Consumers:** [Basic Levi Newton formula](#levi-newton-formula); [Minuscule basic Levi lifting](#minuscule-basic-levi-lift); [Elliptic tori and basic acceptable classes](#elliptic-torus-basic-image); [Specialness for a transferred centralizer torus](#transferred-torus-specialness); [Ordinary straight translation and Levi centrality](#ordinary-straight-translation); [Ordinary classes under a derived isogeny](#ordinary-derived-isogeny); [Abelianized Kottwitz set](#abelianized-kottwitz-set); [Central-torus Grassmannian surjectivity](#central-torus-grassmannian-surjectivity); [Local constancy of bundle Kottwitz invariant](#semicontinuity-and-local-constancy); [Algebraic fundamental group](#algebraic-fundamental-group); [Newton orbit space and rational dominance](#newton-orbit-space); [Galois averaging and Hodge invariants](#galois-average); [Newton and Kottwitz invariants](#newton-and-kottwitz-maps); [Torus norm and Newton average](#torus-norm-description); [Rational-point Kottwitz surjectivity](#rational-kottwitz-surjectivity); [Bounded lifting through a z-extension](#z-extension-bounded-lifting); [Basic classes and adjoint torsors with connected center](#connected-center-basic-inner-forms).

## Refinements required for closure

### G01 — Generic z-extension foundation

Proposed RG2.6 is absent from the integrated stage catalogue. Its existence/exactness/induced-torus contracts are requested from ReductiveGroupsPartII, but cannot be cited as existing nodes. No RG2.5 dependency is used as a substitute.

**Consumers:** All 17 named consumers are listed in the packet.

### G02 — Relative reductive-group and Tannakian descent refinements

Expand the generic inner-form descent and scheme/analytic tensor-torsor representability arguments, including fpqc versus étale comparison, split filtered fibre functors (FS III.5.2 cites Ziegler Theorem1.3, not read here), relative smooth parabolic/radical representability and elliptic-torus transfer. The upstream field group category and dynamic point subgroups supply only their stated pieces. Route generic additions to ReductiveGroups; BG keeps its curve-specific conclusions.

**Consumers:** [Tannakian description of analytic torsors](#g-torsors-three-descriptions); [Algebraic sigma-centralizer](#sigma-centralizer-J-b); [Finite Frobenius norm centralizer](#finite-frobenius-norm-centralizer); [Filtered torsor automorphism group schemes](#filtered-automorphism-group-scheme); [Specialness for a transferred centralizer torus](#transferred-torus-specialness).

### G03 — Weil crossed-module proof interior

Read and decompose Borovoi/Serre inputs establishing the abelian crossed-module comparison and H^2(W_E,Tsc(bar E))=0. FS III.2.11 states these cohomological ingredients; this pass does not claim to have read their original proofs. ET.0 is the cohomological owner. Check the coefficient topologies and naturality of the W_E-to-curve map.

**Consumers:** [Abelianized Kottwitz set](#abelianized-kottwitz-set); [Abelianized classes equal fundamental coinvariants](#abelianization-identification); [Diagonalizable Weil–curve comparison](#diagonalizable-curve-cohomology); [Constant crossed-module curve classes](#crossed-module-curve-classes).

### G04 — G-isocrystal family descent and stratification refinements

The local sigma-conjugacy category and effective perfect-algebra family descent are specified, but the modern family-stack proof cited by FS I.2 (Ivanov 2023 and Hamacher–Kim 2022) was not read. Expand the v-local conjugation/descent argument and its locally closed constant-class loci. Do not use scheme κ-local-constancy to prove the v-descent premise on which it depends.

**Consumers:** [Families of G-isocrystals](#families-of-g-isocrystals); [Isocrystal-family v-descent and strata](#isocrystal-family-v-descent); [Kottwitz invariant in isocrystal families](#family-kottwitz-local-constancy).

### G05 — Curve étale comparison refinements

FS III.2.12 proof was read. Expand its curve/divisor étale-site equivalence, geometric-point punctured-period-domain computation and continuous finite-extension descent. C1 supplies only its actual prime-to-p proper-base-change scope; formalize the p-torsion Artin–Schreier/tilting step separately. This is not obtained by citing C5 j! exchange or RF3 line bundles.

**Consumers:** [Curve-to-base étale site morphism](#curve-etale-base-site); [Constant torsion cohomology on the curve](#curve-torsion-cohomology); [Diagonalizable Weil–curve comparison](#diagonalizable-curve-cohomology); [Constant crossed-module curve classes](#crossed-module-curve-classes).

### G06 — Newton topology and maximal-element proof interiors

Viehmann Theorem1.1 and He–Nie Theorem0.1 were read as exact statements and their proof routes identified. Refine Viehmann §6 specialization realization and the He–Nie combinatorial maximum proof into lemma-level declarations before claiming these two chains closed.

**Consumers:** [Viehmann Newton topology theorem](#newton-topology-homeomorphism); [Unique maximum of acceptable classes](#acceptable-unique-maximum).

### G07 — Unitary flag dimension and ordinary comparison interiors

The datum and CS24 Theorem2.7.3 statement/proof route were checked, but the original Wedhorn Theorem1.6.3 and CGH+ Proposition3.3.8 proof interiors were not read. Expand the central-leaf/period-fibre dimension comparison and the ordinary rational-point identification for this unitary datum; do not generalize its d−d_b formula to arbitrary reductive flags.

**Consumers:** [Unitary flag Newton dimensions](#unitary-flag-stratum-dimension); [Unitary ordinary flag locus](#unitary-ordinary-flag-locus).

### G08 — Lean formulation boundary

The pinned libraries express group quotients, subgroups, finite-dimensional linear isocrystals, rational finite slope data and topology. They do not yet supply the exact tensor-functor target categories for analytic curve bundles and general-E isocrystals, general-E perfectoid coefficient rings, relative FF bundle tensor categories, v-stacks, filtered relative group schemes, crossed-module Weil complexes or the needed analytic cohomological predicates. The suggested file gives concrete pointwise and rational-slope cores plus a name-by-name omission register for these unavailable carriers. It does not replace them with arbitrary propositions, arbitrary types or asserted representability fields. Full signatures depend on the requested suppliers. Tau Ceti already has FGPointRepresentationCat, its rigid symmetric monoidal comodule equivalence and pointwise finite-comodule Tannakian reconstruction. Reuse these as the rational representation source; its existence is not a gap.

**Consumers:** All 98 named consumers are listed in the packet.

### G09 — Local de Rham coefficient group

Liu–Zhu Remark4.1(iii) is used through the reviewed G^c qualification. The target class lies in B(G^c); construction of a G-level lift from extra tensor data remains an explicit input. A local central-torus lifting theorem does not make this lift canonical.

**Consumers:** [Class from a de Rham quotient-group lattice](#de-rham-quotient-group-class).

### G10 — Levi coinvariant and Cartan refinements

Expand the torsion-free kernel π_1(M)_Γ→π_1(G)_Γ used in KMPS Proposition1.1.13, the unramified replacement/triality averaging, and the Wintenberger–Satake–Mazur local Cartan ingredients through the requested root/Cartan owner. Do not treat absolute Weyl transport as N_G(M)/M.

**Consumers:** [Minuscule basic Levi lifting](#minuscule-basic-levi-lift); [Specialness for a transferred centralizer torus](#transferred-torus-specialness); [Integral conjugacy of an ordinary admissible element](#ordinary-integral-conjugacy).

### G11 — Source version collation

The author/preprint versions of KMPS, KZ, LZ17, CS24 and Kisin17 are recorded with hashes and exact local sections. Published versions were not collated for those texts. Findings against those files are scoped to them. Compare the statements against the versions of record before extending any finding to a published edition.

**Consumers:** All 31 named consumers are listed in the packet.

## Suggested file and pinned baseline

The suggested file contains concrete generic group and rational-slope cores. SigmaClass and ComponentCoset have the stated abstract algebraic types; the point stabilizer, finite product, GL_n slope conditions and numerical examples have explicitly restricted types. The full geometric declarations are named in an omission register because their target carriers and predicates require the requested suppliers. A register entry is neither a Lean declaration nor an elaborated theorem. G08 specifies those formulation obligations. No opaque substitute for a perfectoid space, tensor equivalence, representability theorem or smoothness proposition is introduced.

The concrete prototype elaborated on 2026-10-07 with exit code 0 and only admitted-proof warnings. This checks the explicitly restricted Mathlib cores; the full signatures in the omission register were not elaborated. Tau Ceti baseline declarations were read at their pinned commit but were not imported from the shared build, whose Tau Ceti HEAD differs.

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
| N07 | [ReductiveGroupsPartII:RG2.4](../../../content/campaign/ReductiveGroupsPartII/README.md) |
| N08 | [ReductiveGroupsPartII:RG2.4](../../../content/campaign/ReductiveGroupsPartII/README.md) |
| N09 | [ReductiveGroupsPartII:RG2.4](../../../content/campaign/ReductiveGroupsPartII/README.md) |
| N11 | [Ordinary straight translation and Levi centrality](#ordinary-straight-translation) |
| N12 | [Ordinary straight translation and Levi centrality](#ordinary-straight-translation) |
| N13 | [ReductiveGroupsPartII:RG2.4](../../../content/campaign/ReductiveGroupsPartII/README.md) |
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
| N24 | [ReductiveGroupsPartII:RG2.1](../../../content/campaign/ReductiveGroupsPartII/README.md) |
| N25 | [ReductiveGroupsPartII:RG2.1](../../../content/campaign/ReductiveGroupsPartII/README.md) |
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
| weil-restricted-adjoint-averaging | [ReductiveGroupsPartII:RG2.1](../../../content/campaign/ReductiveGroupsPartII/README.md) |
| standard-levi-quasi-split | [ReductiveGroups · layer 7 structure theory](../../../content/tau-ceti/ReductiveGroups/README.md#layer-7-structure-theory) |
| central-cocharacter-nu-bJ | [Central Newton morphism of the centralizer](#central-newton-on-J) |
| wintenberger-cartan-coset-realisation | [ReductiveGroupsPartII:RG2.4](../../../content/campaign/ReductiveGroupsPartII/README.md) |
| satake-levi-reduction | [ReductiveGroupsPartII:RG2.4](../../../content/campaign/ReductiveGroupsPartII/README.md) |
| mazur-inequality-unramified | [ReductiveGroupsPartII:RG2.4](../../../content/campaign/ReductiveGroupsPartII/README.md) |
| rational-parabolic-and-levi-in-quasi-split | [ReductiveGroups · layer 7 structure theory](../../../content/tau-ceti/ReductiveGroups/README.md#layer-7-structure-theory) |
| inner-twisted-levi-basic-classes | [Basic Levi Newton formula](#levi-newton-formula) |
| basic-levi-representative-from-transfer | [Specialness for a transferred centralizer torus](#transferred-torus-specialness) |
| remark-1-1-14-RV14 | [Minuscule basic Levi lifting](#minuscule-basic-levi-lift) |
| finiteness-of-B-G-mu | [Finiteness and the basic acceptable member](#admissible-finiteness-and-basic) |
| kottwitz-local-H1 | [EndoscopicTransferAndUnitaryTraceComparison:ET.0](../../../content/campaign/EndoscopicTransferAndUnitaryTraceComparison/README.md) |

## Source versions and corrections

Every source entry records its acquired URL, SHA-256 and the specific read sections. Author copies and preprints are distinguished from published versions. The packet contains literal excerpts of at most 300 characters at each source locator. The published-text collation obligations are G11.

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

Theorem0.1 and proof roadmap pp.1-2; combinatorial proof interiors are a named gap. arXiv v2 dated2016-10-20; KZ calls the published result Theorem1.1.

### Corrections used by the declarations

- **BunGAndNewtonStrata/E01 (LZ17, gap):** The tensor construction explicitly available in the preceding paragraph yields a class in B(G^c_Qp). To assert a class in B(G_Qp), supply a G-level lift and prove its existence/choice properties, or assume G=G^c. Locator: arXiv1602.06282v3; Remark4.1(iii),PDF34. Confirmed finding PAPER-LIU-ZHU-17/E10.
- **BunGAndNewtonStrata/E02 (GLX, error):** The torus quotient has target X_*(T)_I. The map onward to pi1(G)_I can have a coroot kernel. Prove rational Kottwitz surjectivity by its actual theorem (cited Zhou5.18), not this exact sequence. Locator: ProofLemma3.16(2),(3.23),p830; published57-page version, rendered page inspected unless stated otherwise. Confirmed finding PAPER-GLEASON-LIM-XU-26/E03.
- **BunGAndNewtonStrata/E03 (CS17, misprint):** Read "upper semicontinuous" in both places, for the partial order ⪯ on B(G) defined on p. 677. That is, every point x has a neighbourhood on which b(·) ⪯ b(x). Since the image is the finite set B(G, µ^{−1}) by part (2), and κ is constant on it, this is equivalent to the following: for every b ∈ B(G), the set {x : b ⪯ b(x)} is closed. Corollary 3.5.9 (p. 690) and Theorem 1.11 (p. 655) use the proposition in exactly this form. Locator: §3.5, Proposition 3.5.7(1), p. 689, and the same word in its proof, p. 690 (also in arXiv v1). Confirmed finding PAPER-CARAIANI-SCHOLZE-17/E35.
- **BunGAndNewtonStrata/E04 (KMPS, misprint):** c b σ(b) ··· σ^{r−1}(b) σ^r(c)^{−1} = c(rν_b)(p)c^{−1}. Locator: (1.1.2.2), p.6, in the author PDF https://math.berkeley.edu/~swshin/HT.pdf (41 pp., created 27 January 2021, SHA-256 fd22990b…52db), the latest version found; the published text, Duke Math. J. 171 (2022), 1559–1614, was not collated. Confirmed finding PAPER-KISIN-MADAPUSIPERA-SHIN-22/E1.
- **BunGAndNewtonStrata/E05 (KMPS, error):** Replace N_G(M)/M by the absolute Weyl group W(G, T) of a maximal torus T ⊂ M with μ ∈ X_*(T), as in Proposition 1.1.13. Equivalently: some G(Q̄_p)-conjugate μ′ of μ factoring through T makes ([b_M], {μ′}) M-admissible. Locator: Corollary 1.1.15 and its proof, pp.11–12, in the author PDF https://math.berkeley.edu/~swshin/HT.pdf (41 pp., created 27 January 2021, SHA-256 fd22990b…52db), the latest version found; the published text, Duke Math. J. 171 (2022), 1559–1614, was not collated. Confirmed finding PAPER-KISIN-MADAPUSIPERA-SHIN-22/E2.
- **BunGAndNewtonStrata/E06 (KMPS, error):** Uniqueness holds by (1.1.2.3); existence does not. Assume G_{Q_p} quasi-split, in which case [b_μ] exists and satisfies (1.1.3.1) (C02, N16); otherwise assume that [b_μ] exists and satisfies (1.1.3.1). Corollaries 1.3.16 and 1.3.18 and Theorem 3 of the Introduction need the same hypothesis. Also: Theorem 3 (and Corollary 1.3.16): 'Suppose G_{Q_p} is quasi-split. If the special fibre of S is locally integral then the μ-ordinary locus is dense in the special fibre.' This matches the abstract and Theorems 4–5. Alternatively, keep G general but assume that a class [b_μ] with N_ξ(ν̄_G([b_μ])) = μ̄^{-1} exists, and in §1.3.15 replace 'There is a unique [b_μ]' by 'If G_{Q_p} is quasi-split, there is a unique [b_μ]' (it can fail otherwise, e.g. G_{Q_p} = D^×). Record as an additional locator of ledger E8, not as a separate entry. Locator: §1.3.15, p.20; 41-page Berkeley author PDF SHA256 fd22990bc3eff8a726375cf8f0c9015828c39f1c32b0717347a9ef23ce9b52db; final Duke text not collated; also Introduction, Theorem 3, p.3 (the introduction's form of Corollary 1.3.16 / §1.3.15, p.20). Confirmed finding PAPER-KISIN-MADAPUSIPERA-SHIN-22/E8.
- **BunGAndNewtonStrata/E07 (KZ, misprint):** Use positive coroots in the rational cocharacter space. Locator: §2.2.3 in arXiv2103.09945v2, printed10; the current Harvard author copy has the same phrase. Final Annals version not collated.. The bounded correction search and the two read versions are recorded in the packet; the claim is confined to their wording.

The planets are the definitions and named results marked in each layer, at most six in any stage. All other declarations remain part of the development. The coverage records keep each stage planned with its exact remaining refinements and supplier contracts.
