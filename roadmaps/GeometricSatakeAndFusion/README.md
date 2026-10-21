# Geometric Satake over the Fargues–Fontaine curve

Construct the integral geometric Satake equivalence from bounded bundle
modifications, with its tensor structure, coefficient changes and Weil action. The geometric input is the
Beilinson–Drinfeld Grassmannian over the divisor space of the relative
Fargues–Fontaine curve. Its Witt vector special fibre supplies projective models
and dimension calculations. Universally locally acyclic, flat perverse sheaves
form the Satake category; convolution gives rigidity, fusion gives its symmetric
tensor structure, and relative Tannaka reconstruction recovers the pinned dual
group. A final comparison identifies normalized Frobenius traces with the
classical spherical Satake transform.

The development has five layers. GS0 constructs loop spaces, Schubert geometry,
Witt bounds and determinant lines. GS1 develops semi-infinite constant terms,
ULA recognition and relative perversity. GS2 constructs the Satake fibre functor,
convolution and duals. GS3 extends exterior products across collision diagonals
and fixes the symmetry sign. GS4 reconstructs and identifies the dual group,
normalizes the Weil action and extends the representation functor to perfect
complexes. Its classical comparison comes after both Satake theorems. The
rational Witt equivalence has its own route through generic reductivity; it does
not depend on the characteristic-two integral rank-one argument.

## Scope and dependency boundaries

This roadmap owns the applications to local modification spaces, their Satake
sheaves and the resulting dual group identification. The following layers own
the general theories used in those applications. A reference to one of these
layers includes the precise contract stated here and in the relevant result
below; merely having its abstract carrier is insufficient.

| Dependency | Required mathematical interface |
| --- | --- |
| `RelativeFarguesFontaine:RF0`, `RF2:integral-divisors`, `RF2:untilts` | Ramified Witt coefficients; completed Cartier-divisor rings and localization; ordered divisors, collisions and disjoint products; finite-thickening descent; geometric DVR factors, including special integral untilts; closed support maps. |
| `RelativeFarguesFontaine:RF4:G-torsors`, `RF4:vector-bundles` | Effective completed-system descent and Beauville–Laszlo gluing; uniform-rank algebraization of compatible finite projectives; punctured A_inf torsor extension; the uniform Banach finite-projectivity and bounded-lattice fibre-detection criteria. Finite-thickening descent alone does not algebraize the completed system. |
| `ReductiveGroupsPartII:RG2.0`, `RG2.0a`, `RG2.1`, `RG2.3`, `RG2.4`, `RG2.5` | Integral-point topology and lattice preservation over the completed maximal unramified coefficient DVR; Weil restriction; relative Lie weights; integral and parahoric models, Greenberg jets and smooth lifting; affine Weyl, Cartan, Iwasawa and rank-one convolution data; pinned integral dual groups, central maps and finite pinned Weil action. The closed-immersion theorem of Prasad–Yu belongs to RG2.3 with its exact characteristic-two exception. |
| Tau Ceti `ReductiveGroups`, layers 3, 6, 7 and 9 | Components and sufficiently high Frobenius images; finite-type characteristic-zero reductivity; subgroups and normalizers of SL₂; integral pinned Chevalley–Demazure groups and classification by based root datum. Import the existing absolute theory before its relative extensions. |
| Tau Ceti `AlgebraicVectorBundles`, L0A–L0C | Tensor and pullback for module sheaves, finite locally free sheaves and their rank-one identification with `InvertibleSheaf`, and exterior-power determinants. Import these operations; the Witt-resolution descent and positivity arguments are the applications constructed here. |
| `SchemeAndStackFoundations:SF.0`–`SF.5` | Pfp perfect schemes and algebraic spaces, finite models and Greenberg realization; effective smooth quotients and finite boundary pushouts; finite-model trace comparison; proper connected-fibre bundle descent; Witt descent, local models and bounded fibre products; positivity, Keel's criterion, Stein contraction and Frobenius-power sections. General line-bundle positivity is constructed there. |
| `VStackSheavesAndLisseCategories:VS0`, `VS1`, `VS3`; `DiamondSixOperations:S2`–`S6` | Enhanced Artin quotient descent and bounded proper correspondences; ULA and hyperbolic localization with monodromicity and coefficient hypotheses; complete congruence filtrations and ordinary-cohomology continuity; perfect locally constant Drinfeld realization with its Tate character; relative duality and enhanced coefficient comparison. Representable diamond operations alone do not cover quotient-stack maps. |
| `EnhancedDerivedSheaves:E3`, `E5:presentability` | Coherent composition of pull–push kernels and filtered support extension; the generated Ind t-structure with accessibility and small generators. Pairwise associators in a homotopy category do not give this coherence. |
| `EtaleDualityAndPerverseSheaves:EDC.5`, `EDC.7` | Early perverse recollement, coefficient reduction and derived-complete adic passage on the stated coefficient classes; separately, rational proper decomposition and IC parity on finite models. EDC.7 is used only in the rational and torsion-bound arguments. |
| `MotivesAndAlgebraicCycles:MC.6` | The single relative reconstruction theorem: bounded representability, filtered dual coalgebras, tensor multiplication and rigidity antipodes. Satake verifies and applies these hypotheses rather than reconstructing the abstract theory again. |
| `LanglandsParameterStacks:LP3`, `LP4` | Highest-weight and tilting calculations, Steinberg-kernel invariants and good filtrations; relative Perf(BG) base change and stable idempotent completion of exact finite-projective representations, for every ℓ≠p with Q-equivariance. Prime exclusions in parameter-stack generation do not supply this contract. |
| `SmoothRepresentationsOfLocalGroups:SR.4` | The spherical Hecke algebra and normalized classical Satake transform, including the unramified nonsplit version. The geometric comparison does not construct this transform. |
| Tau Ceti `ClassFieldTheory`, layer 9 | The local Weil group, its topology, inertia, geometric-Frobenius degree and continuous representation conventions. |
| `AdicCoefficientsAndComparisons:L0`, `L1`, `L3`; `DiamondsAndVStacks:D3`, `D6` | Coefficient limits and constructible comparisons, characteristic-p scheme diamonds, étale v-descent and topological comparison. |
| `CrystallineCohomology:CR.1`, `CR.7`; `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.2`, `R07.6`; `KTheoryLowDegrees:Z.3`; `PadicHodgeTheory:P8:local-rational` | Crystal evaluation and Hodge determinants for canonical Demazure models; Dieudonné chains and their deformation comparison; elementary determinants of finite projectives; the filtered period-sheaf connection for minuscule flags. The Witt projectivity proof uses geometric determinant descent, not a K-theoretic determinant construction. |

The early Grassmannian and finite-loop results are inputs to
`HeckeStacksAndLocalShtukas` and `BunGAndNewtonStrata`. The normalized multileg
and perfect-complex functors feed `ExcursionOperatorsAndSpectralAction` and its
Hecke action. Equal-characteristic global shtukas are a separate construction.
Metaplectic Satake, Zhu's own Gelfand commutativity constraint and the rational
equivalence over arbitrary larger algebraically closed residue fields belong to
`GeometricSatakeAndFusionPartII`. Here the rational Witt comparison uses an
algebraic closure of a finite field and the symmetry transported from fusion.

## Conventions

Let E be a nonarchimedean local field with residue field F_q of characteristic p,
and G/E a connected reductive group. Generic divisor spaces are those of the
relative spaces Y or X; the integral space is 𝒴. Use a split reductive O_E-model
only in results whose hypotheses specify one. Ramified generic groups are
treated by finite splitting-field descent. Integral parahoric statements use
their specified smooth affine models, not an inferred reductive O_E-model.

The standing coefficient classes are prime-to-p torsion rings and derived-complete
ℓ-adic coefficients, with ℓ≠p; an adic assertion includes compatible torsion-level
passage. A claim about rational coefficients explicitly requires a characteristic
zero coefficient field. ULA stalks are perfect complexes. Individual cohomology
modules become finite projective only after the flat-perverse criterion. The
integral Satake category is additive with its flat exact sequences and need not
be abelian.

Write B_D⁺ for the completed divisor ring and B_D for its localization, with
Cartier ideal I=(ξ). Ordered legs give D=ΣD_i, including repeated divisors.
Completions factor over distinct geometric supports; each completed DVR factor
is counted once. Collision weights are summed first. In particular, geometric
lengths and relative positions are not multiplied again by the number of
coincident legs. Distinct blocks of an ordered partition must have disjoint
supports, while supports within one block may coincide.

Fix a maximal torus T and Borel B after splitting. The dominance relation on
coweights is the nonnegative integral **coroot** order within a fixed π₁(G)
component. The Schubert dimension is d_μ=⟨2ρ,μ⟩. The stabilizer convention uses
the opposite parabolic P_μ⁻. The minuscule period-map formula uses the ascending
filtration specified below; reconcile the inverse-cocharacter convention of CS
with the μ(ξ) convention of FS. Witt filtrations decrease, and lattice chains
with increasing multiplication kernels are reverse-indexed before comparison.

Perversity is relative to the divisor base. On a geometric collision stratum,
its dimension shift is the sum of d_μ over the distinct local factors after
combining their weights. Unnormalized standard, costandard and IC objects use
Λ[d_μ]. A half Tate twist is inserted only in the normalized equivalence and
Frobenius comparison, where the open-cell normalization is
Λ[d_μ](d_μ/2). Geometric Frobenius acts on Λ(1) by q⁻¹. Choose a unit r with
r²=q to define the half twist; its Frobenius eigenvalue is r⁻¹. The Drinfeld
stalk-action/parameter-action conversion must be proved with this orientation
before using the normalized Weil or Levi formulas.

Fusion commutativity includes the component sign (−1)^{ε(A)ε(B)}, where
ε=⟨2ρ,μ⟩ mod 2. Apply it separately to the canonical even and odd summands.
Total cohomology then has the ordinary ungraded symmetric tensor structure.
The internal Satake dual is sw*D, with sw inversion of the modification and D
relative Verdier duality. Component grading uses the split diagonalizable group
with character group π₁(G), which may have torsion and therefore need not be a
torus.

For perfect schemes, coordinate-ring perfection is the direct Frobenius colimit.
Mathlib's inverse-limit `Perfection` does not express this construction. Fix
finite-type models and the relevant Frobenius power when defining top-cycle
traces. A model-independent scalar trace cannot discard the p-power degree of
Frobenius. Finite-model Frobenius descent is additional data for the classical
trace bridge; a geometric ULA object alone does not define its arithmetic trace.

All short declaration names below belong to `TauCeti.GeometricSatake`. The
associated [Suggested.lean](Suggested.lean) uses existing library carriers for
the expressible algebraic and categorical parts. Its adjacent omission comments
describe the geometric hypotheses that need the named supplier interfaces.
The mathematical specification here remains definitive for each result.

## Existing library vocabulary

Use Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. The following declarations are prerequisites, with their actual scope. Their existence does not assert geometric representability, a Satake equivalence or enhanced coherence.

| Declaration | Supplied scope |
| --- | --- |
| `mathlib:WittVector` | The type of p-typical Witt vectors, indexed by a natural p. Its ring laws and perfect-ring properties are reused; ramified Witt coefficient comparison is RF0’s result, not a new definition here. |
| `mathlib:PerfectRing` | PerfectRing R p asserts bijectivity of the p-th power map on a type with powers; it does not itself assert that p is prime or that R has characteristic p. The Witt geometric applications separately require a commutative ring, Fact p.Prime and CharP R p, giving a perfect F_p-algebra. This is the algebraic hypothesis carrier, not a representability result. |
| `mathlib:AlgebraicGeometry.Scheme` | The ordinary scheme carrier and category. The projective perfection models are constructed in GS0; the scheme carrier alone supplies no representability theorem. |
| `mathlib:AlgebraicGeometry.IsProper` | Properness of a morphism of schemes. The representing object is a proper perfectly finitely presented scheme, and the fibral descent criterion is for proper maps. |
| `mathlib:ValuationRing` | Valuation rings. The proof of the fibral descent criterion reduces to a base whose connected components are spectra of valuation rings. |
| `tauceti:TauCeti.AlgebraicGeometry.InvertibleSheaf` | Invertible sheaves on an ordinary scheme, including the Witt-bound and Demazure determinant lines after those schemes are constructed. This carrier supplies neither ampleness nor the adic Cartier-divisor line I_S^m/I_S^{m+1}; the latter belongs to the RF2/RF4 geometric interfaces. |
| `mathlib:CoxeterSystem` | Abstract Coxeter-system combinatorics only. Affine root data, Cartan/Iwasawa decomposition and parahoric geometry require RG2.4. |
| `tauceti:TauCeti.TitsSystem.bruhatCell` | Bruhat cells of a Tits system. Tau Ceti already has the Bruhat decomposition, which is the combinatorial shadow of the Schubert stratification this layer builds geometrically. |
| `mathlib:RootPairing` | The abstract paired roots/coroots and their module dualities, not a built split reductive group, Lie-weight decomposition or affine Cartan theorem. |
| `tauceti:TauCeti.ReductiveAffineGroupSchemeCat` | Reductive affine group schemes over a field k. This does not provide an integral O_E-model or parahoric group scheme; RG2.3 supplies those integral models. |
| `mathlib:CategoryTheory.Triangulated.TStructure` | t-structures on a triangulated category, already in the pinned library with IsLE and IsGE. The relative perverse t-structure of GS1 is one of these, so the abstract notion is cited and only its normalisation is specified. |
| `mathlib:CategoryTheory.Triangulated.TStructure.Heart` | The Heart typeclass identifies a heart with a full subcategory of a pretriangulated category; TStructure.heart is the underlying object property. No generic abelian-heart theorem is claimed. |
| `mathlib:CategoryTheory.Pretriangulated` | Pretriangulated categories, the level at which the t-structure and the recollement of the Schubert stratification are stated. |
| `mathlib:DerivedCategory` | The Verdier-localization carrier for the derived category of an abelian category, not the stable enhanced sheaf categories or six-operation coherence; EDS owns those extensions. |
| `mathlib:CategoryTheory.Sheaf` | Sheaves valued in a category on a Grothendieck site; the diamond/v-site topology and geometric representability are not provided by this carrier. |
| `mathlib:CategoryTheory.GrothendieckTopology` | Abstract Grothendieck topologies; actual v/h/étale topologies and their descent properties are supplier work. |
| `mathlib:CategoryTheory.MonoidalCategory` | Monoidal categories, the structure convolution puts on the bounded sheaf category and on the Satake category. |
| `mathlib:CategoryTheory.LeftRigidCategory` | Left duals only. The conclusion that all Satake objects have both duals uses the separate RigidCategory carrier. |
| `mathlib:CategoryTheory.Equivalence` | Equivalences of categories, the form of the special-fibre comparison of the ULA categories over Spd O_C, Spd C and Spd k. |
| `mathlib:CategoryTheory.Comma` | Comma categories, the pinned form of the slice and correspondence categories over which the convolution 2-category is indexed. |
| `mathlib:Module.Flat` | Flatness. Flat perversity is half the definition of the Satake category, and it is what excludes the Tor obstruction to t-exactness of convolution. |
| `mathlib:Module.Projective` | Projective modules: finite projective terms of a strict perfect complex, flat-perverse torus fibres in degree zero, total Satake cohomology and lattice graded pieces. ULA alone requires perfect stalk complexes and does not make each cohomology module projective. |
| `mathlib:Module.Free` | Free modules. The lattice computation in the GL_n case of the open-cell stabilizer chooses a compatible basis, which is a freeness statement after localisation. |
| `mathlib:CategoryTheory.RigidCategory` | Both left and right rigid structures. LeftRigidCategory alone cannot state VI.8.2. |
| `mathlib:CategoryTheory.ActionCategory` | The category of elements of a monoid action, with Groupoid for group actions. This is the local quotient presentation, not stackification. |
| `mathlib:Action` | Objects with a monoid homomorphism into their endomorphisms; morphisms intertwine the action. Only the discrete equivariant-object core. |
| `mathlib:CategoryTheory.ObjectProperty.FullSubcategory` | Full subcategories with the existing fully faithful inclusion; their object property must be stated mathematically. |
| `mathlib:Module.Finite` | Finitely generated modules; paired with Module.Projective for lattice and fibre-functor finiteness. |
| `mathlib:Module.Flat.iff_lTensor_preserves_injective_linearMapₛ` | Flatness characterized by injectivity preservation of linear maps after tensor; the smallness universe condition is part of the source statement. |
| `mathlib:PadicInt` | The subtype of p-adic numbers with norm ≤1, with the existing commutative ring structure for prime p. Its ℤ_p-algebra structure explicitly states the coefficient hypothesis of the uniform ℓ-power torsion bound. |
| `tauceti:TauCeti.Tannaka.tensorAutFunctor` | For a given bialgebra H (a semiring) over a commutative ring R, tensor automorphisms of scalar extension on finitely generated H-comodules. Commutativity of H is not required here. Does not construct H from an arbitrary tensor category. |
| `tauceti:TauCeti.Tannaka.pointsFunctorIsoTensorAutFunctor` | Over a field k and a given commutative Hopf algebra H, identifies its points functor with the tensor automorphisms of scalar extension. This is a comparison after reconstruction, not the relative integral existence theorem. |
| `tauceti:TauCeti.Tannaka.reconstructedPoint` | Over a field k, for a given commutative Hopf algebra H and commutative k-algebra A, maps a tensor automorphism of scalar extension on finitely generated H-comodules to WithConv (H →ₐ[k] A). This assumes H rather than reconstructing it. |
| `mathlib:HopfAlgebra` | An antipode on a bialgebra satisfying the two convolution inverse identities; commutativity is an additional algebra hypothesis. |
| `mathlib:Bialgebra` | Compatible algebra and coalgebra structures on a semiring/module; the underlying coordinate algebra, not the representing object F(L1) before dualization. |
| `tauceti:TauCeti.AffineGroupSchemeCat` | Affine group objects over Spec of a commutative ring; usable for the integral reconstructed group. |
| `mathlib:CategoryTheory.BraidedCategory` | Natural braiding isomorphisms satisfying both hexagon identities. |
| `mathlib:CategoryTheory.SymmetricCategory` | A braided category with double braiding equal to the identity. |
| `mathlib:CategoryTheory.Functor.Braided` | A monoidal functor compatible with the specified braidings; applies to the modified fusion symmetry. |
| `mathlib:CategoryTheory.Functor.Monoidal` | Compatible lax and oplax monoidal structures with inverse tensor and unit constraints. |
| `mathlib:CategoryTheory.Adjunction` | Unit and counit with triangle identities; used for bounded left adjoints of the fibre functor. |
| `mathlib:Representation` | A monoid homomorphism to linear endomorphisms. Continuity of the Weil action and finite projectivity are extra conditions, not supplied by this abbreviation. |
| `mathlib:CategoryTheory.Monad.HasCoequalizerOfIsSplitPair` | For every F-split parallel pair, its coequalizer exists in the source category. |
| `mathlib:CategoryTheory.Monad.PreservesColimitOfIsSplitPair` | F preserves coequalizers of every F-split parallel pair. |
| `mathlib:CategoryTheory.Monad.ReflectsColimitOfIsSplitPair` | F reflects coequalizers of every F-split parallel pair. |
| `mathlib:CategoryTheory.Limits.HasColimit` | Existence of a colimit cocone; colimit chooses its object. Gives the underlying module only, not a Hopf structure. |
| `tauceti:TauCeti.reductiveAffineGroupSchemeProperty` | Object property on finite-type affine group schemes over a field, transported from the reductive coordinate Hopf-algebra property. |

For compact prerequisite references, the following prefixes expand to roadmap IDs. The part after the prefix is the exact layer and result ID, including its sublayer when present. References within this roadmap link directly to the mathematical result.

| Prefix | Roadmap ID |
| --- | --- |
| `RF` | `RelativeFarguesFontaine` |
| `RG` | `ReductiveGroupsPartII` |
| `DSO` | `DiamondSixOperations` |
| `VS` | `VStackSheavesAndLisseCategories` |
| `SF` | `SchemeAndStackFoundations` |
| `AC` | `AdicCoefficientsAndComparisons` |
| `EDC` | `EtaleDualityAndPerverseSheaves` |
| `EDS` | `EnhancedDerivedSheaves` |
| `MC` | `MotivesAndAlgebraicCycles` |
| `DVS` | `DiamondsAndVStacks` |
| `LP` | `LanglandsParameterStacks` |
| `SR` | `SmoothRepresentationsOfLocalGroups` |
| `CR` | `CrystallineCohomology` |
| `K` | `KTheoryLowDegrees` |
| `FF` | `FiniteFlatGroupsAndIntegralPadicHodgeTheory` |
| `PH` | `PadicHodgeTheory` |

<a id="supplier-calculus"></a>

The following abbreviations denote the full lists of supplier results:

| Calculus | Prerequisites |
| --- | --- |
| smooth diamond calculus | `DSO:S4/cohomologically-smooth`; `DSO:S4/smooth-composition`; `DSO:S4/smooth-stable-under-base-change`; `DSO:S4/smooth-descent-along-smooth-surjection`; `DSO:S5/ball-smooth` |
| dual six-operation calculus | `DSO:S3/upper-shriek`; `DSO:S3/adjunction-calculus`; `DSO:S3/verdier-duality-lower-shriek` |
| proper pushforward calculus | `DSO:S2/lower-shriek`; `DSO:S2/lower-shriek-base-change` |

## GS0. Modification spaces and Schubert geometry

### Loop quotients and ordered divisors

Begin with completed rings and effective torsor descent. The Hecke quotient retains automorphism groups, whereas a punctured trivialization removes them in the Grassmannian. Ordered legs control both product factorization and collision bounds.

<a id="loop-groups-and-local-hecke"></a>

**Positive and full loop spaces** (`positiveLoopSpace`). For an affine O_E-scheme Z and a divisor D in Div^d_𝒴, L⁺Z(S)=Z(B⁺_D(S)) and LZ(S)=Z(B_D(S)) are v-sheaves over Div^d_𝒴. The generic E-scheme version is defined over Div^d_Y or Div^d_X. For X use the basis of affinoid S for which D_S is affinoid. For a group scheme these are group v-sheaves, with the natural inclusion L⁺G→LG.

Hypotheses: Z affine; d≥1; integral G is a split reductive O_E-model; generic G/E can be ramified.

Proof: Import completed rings, their functoriality and v-descent from RF2.

API:

- `positiveLoopSpace_eval`: At a completed ring A, the positive loop space is the affine functor of points F(A); the full loop space uses A[1/ξ].
- `positiveLoopSpace_map`: A ring map induces the map F(f); identity and composition agree with those in the affine functor.
- `positiveLoopSpace_map_comp`: Positive loop maps compose in the same order as ring maps.

Tests:

- `loop_gm_units`: For G_m the evaluation at A agrees with the unit group of A.
- `loop_trivial`: The trivial affine group has one loop at every ring.
- `loop_affine_evaluation`: Evaluate the existing CommRingCat affine functor at the specified ring.

**Sources:** [FS](#source-fs), VI.1.5, p. 192.

**Prerequisites:** `RF:RF2:integral-divisors/completed-rings-B-plus-and-B`; `RF:RF2:integral-divisors/v-descent-of-bundles-on-the-divisor`; `RF:RF2:integral-divisors/product-equation-and-affineness`; `RG:RG2.3`; `AC:L1/char-p-scheme-diamond-and-comparison-functor`; `DVS:D6/pre-adic-topological-comparison`.

<a id="local-hecke-stack"></a>

**Local Hecke stack** (`localHeckeAction`). Hck_G(S) is the groupoid of two G-torsors on Spec B⁺_D(S), together with an isomorphism of their B_D-restrictions. It is a small v-stack; its étale-stack presentation is [L⁺G\LG/L⁺G].

Hypotheses: The same divisor basis and group-model conditions as loop spaces.

Proof: Use RF2 finite-thickening descent together with RF4 effective descent/algebraization of compatible completed finite-projective modules (uniform rank and continuity), then transfer through the faithful exact tensor description to G-torsors. The completed-ring conclusion is not supplied by RF2 finite-thickening descent alone. Trivialize torsors étale-locally using the geometric DVR and smooth finite-level lifting/spreading. Changes of the two trivializations give the double quotient; keep automorphisms, rather than taking only isomorphism classes.

API:

- `localHeckeAction_formula`: The double action is (h₁,h₂)·g=h₁gh₂⁻¹, and the quotient is an action groupoid.
- `localHeckeAction_groupoid`: For the double action, the local quotient uses Mathlib ActionCategory with its Groupoid instance.
- `localHeckeAction_unit_stabilizer`: The automorphism labels of the identity are exactly pairs (h,h), retaining the diagonal positive-loop group.

Tests:

- `hecke_trivial_group`: For the trivial group there is one modification and one automorphism.
- `hecke_identity_automorphisms`: In Multiplicative ℤ, the nonidentity diagonal label (1,1) fixes the identity modification; an orbit set loses it.
- `hecke_double_action`: For G=H, (h,1) sends the identity to h, whereas (1,h) sends it to h inverse.


**Sources:** [FS](#source-fs), VI.1.6–VI.1.7, p. 193.

**Prerequisites:** [Loop spaces](#loop-groups-and-local-hecke); `RF:RF2:integral-divisors/v-descent-of-bundles-on-the-divisor`; `RF:RF2:untilts/geometric-divisor-complete-dvr`; `RF:RF4:G-torsors`; `RG:RG2.3`; `mathlib:CategoryTheory.ActionCategory`; `RF:RF2:untilts`.

<a id="grassmannian"></a>

**Beilinson–Drinfeld Grassmannian** (`grassmannianQuotient`). Gr_G(S) classifies a G-torsor on Spec B⁺_D(S) with a B_D-trivialization. It is a small v-sheaf and the étale sheafification of LG/L⁺G. Its map to Hck_G fixes the second torsor as trivial.

Hypotheses: Integral and generic group and divisor conventions as above.

Proof: Use the same effective torsor descent as Hck_G.

API:

- `grassmannianQuotient_eq`: The trivialized local presentation is the existing right-coset carrier G/H; H need not be normal.
- `grassmannianQuotient_mk`: Every full loop gives its right-coset class and hence a trivialized modification.
- `grassmannianQuotient_eq_iff`: Two trivializations define the same point precisely when g⁻¹g′ lies in H.
- `grassmannianQuotient_unit`: The unit section is the class of the identity full loop.

Tests:

- `grassmannian_zero`: The unit section is the coset of the identity full loop.
- `grassmannian_all_subgroup`: When H=G, the local quotient has exactly one point.
- `grassmannian_non_normal`: Use Mathlib G/H for arbitrary H, without normality.

**Sources:** [FS](#source-fs), VI.1.8–VI.1.9, pp. 193–194.

**Prerequisites:** [Local Hecke stack](#local-hecke-stack); `RF:RF4:G-torsors`; `AC:L1/char-p-scheme-diamond-and-comparison-functor`; `DVS:D6/pre-adic-topological-comparison`.

<a id="ordered-leg-base-change"></a>

**Ordered legs and divisor base change** (`orderedLegCollision`). For finite I, pull back Gr_G and Hck_G along (Div¹_𝒴)^I→Div^{|I|}_𝒴 given by addition of Cartier divisors. Formation commutes with base change. Over disjoint divisors the completed rings split as products and Gr factors as the product of the individual Grassmannians. Equal untilts are counted once in the product, but their cocharacters add in the bound.

Hypotheses: Split integral model; restrict to generic Y/X for a general G/E.

Proof: Import divisor addition, disjointness and completion base change from RF2.

**Sources:** [FS](#source-fs), VI.2.6 and preceding discussion, pp. 199–200.

**Prerequisites:** [Beilinson–Drinfeld Grassmannian](#grassmannian); `RF:RF2:integral-divisors/addition-and-disjoint-divisor-loci`; `RF:RF2:untilts/divisor-completion-base-change`.

### Generic bounds and integral affine flags

Generic properness is established before special-fibre projectivity. Affine flags over Spd O_C also use the Witt parahoric construction in the next part of GS0; complete that construction before proving the flag comparison.

<a id="schubert-bounds-and-properness"></a>

**Generic Schubert bounds** (`dominanceBound`). After a splitting extension and choices T⊂B⊂G, define Gr_{≤μ} by geometric rank-one points whose Cartan coweight is ≤μ; Gr_μ has exact relative position μ. Over generic Div^d_Y and Div^d_X the bounded inclusions are closed and the projections proper and representable in spatial diamonds. Their filtered union in each π₁(G)-component is Gr. Bounds for a tuple of legs sum at collisions.

Hypotheses: μ dominant; μ−λ is a sum of positive coroots with the same π₁-class. General G/E descends its Galois-stable orbit of bounds.

Proof: Import Cartan decomposition and its functorial descent from RG2.4.

API:

- `dominanceBound_iff`: For GL_n, dominance means equal total degree and every initial partial sum of ν at most the corresponding sum of μ.
- `dominanceBound_refl`: Every dominant cocharacter lies in its own bound.
- `dominanceBound_trans`: Bounds are nested by transitivity of the dominance relation.

Tests:

- `bound_zero_component`: For a torus of rank one the bound is equality, not the usual integer order.
- `bound_gl2`: GL₂ coweight (1,1) is below (2,0).
- `bound_wrong_degree`: The cocharacter (1,0) is not below (2,0), despite its smaller partial sums.

**Sources:** [FS](#source-fs), VI.2.2–VI.2.3, pp. 196–197.

**Prerequisites:** [Beilinson–Drinfeld Grassmannian](#grassmannian); `RG:RG2.4`; [proper pushforward calculus](#supplier-calculus); `DSO:S2/projection-formula`; `DVS:D6/pre-adic-diamondification`; `AC:L1/char-p-scheme-diamond-and-comparison-functor`; `DVS:D6/pre-adic-topological-comparison`.

<a id="generic-galois-descent"></a>

**Galois descent of bounded modifications** (`genericGaloisDescent`). For finite Galois E′/E splitting G, base change identifies loop spaces, torsor-modification functors and each Galois-stable union of Schubert strata with the split constructions over E′. Descent returns the orbit-labelled cell Gr_{μ̄} and bound Gr_{≤μ̄}; this asserts no reductive O_E-model for a ramified G.

Hypotheses: Generic divisors on Y or X; μ̄ a finite Galois orbit.

Proof: Import finite étale/v-descent of affine group data.

**Sources:** [FS](#source-fs), VI.2 opening and VI.8 final paragraphs, pp. 196, 226.

**Prerequisites:** [Generic Schubert bounds](#schubert-bounds-and-properness); `RG:RG2.3`; [smooth diamond calculus](#supplier-calculus); `DSO:S5/analytic-smooth-is-cohomologically-smooth`.

<a id="affine-flag-demazure"></a>

**Affine flags and Demazure spaces over Spd O_C** (`demazureChains`). For split G and an Iwahori model 𝓘⊂G, Fl_G=LG/L⁺𝓘 over Spd O_C. Its projection to Gr has v-locally fibre (G/B)^⋄ and is proper and cohomologically smooth. For w=s₁⋯s_rω reduced in the extended affine Weyl group, the Demazure space is the contracted product of the minimal parahorics divided by L⁺𝓘, followed by ω. It is an iterated (P¹)^⋄-bundle, proper over the bound, and isomorphic over the open w-cell.

Hypotheses: Parahoric models and affine Weyl group from RG2.3–RG2.4.

Proof: Construct torsor quotients and their changes of trivialization.

API:

- `demazureChains_points`: The point core consists of chains x₀,…,x_r with each consecutive pair in the specified simple-step relation.
- `demazureChains_endpoint`: Multiplication forgets the intermediate flags and keeps the endpoints.
- `demazureChains_base_change`: A map of flag spaces preserving each simple-step relation acts on every vertex of a Demazure chain.

Tests:

- `demazure_empty`: An empty chain is one flag; its two endpoints coincide.
- `demazure_one_step`: A one-step chain is the given simple-step incidence relation.
- `demazure_not_product`: An empty step relation forces an empty chain space, even if X is nonempty.

**Sources:** [FS](#source-fs), VI.5.1–VI.5.7, pp. 209–211.

**Prerequisites:** [Beilinson–Drinfeld Grassmannian](#grassmannian); `RG:RG2.3`; `RG:RG2.4`; [smooth diamond calculus](#supplier-calculus); `DSO:S5/analytic-smooth-is-cohomologically-smooth`; [Witt affine flags and components](#parahoric-ind-projectivity).

### Divisor mapping spaces and finite loop charts

The separated étale lift lemma transfers étale coordinates on a smooth scheme to its divisor mapping space. Congruence quotients then give finite-dimensional charts; a finite quotient is distinct from its congruence kernel.

<a id="etale-over-divisor"></a>

**Separated étale lifts over an effective divisor** (`etaleOverDivisor`). Let S be a perfectoid space over F_q with a map S→Div^d_𝒴 and associated Cartier divisor D_S⊂𝒴_S. For any separated étale map of adic spaces D′→D_S, the functor on perfectoid T→S sending T to Hom_{D_S}(D_T,D′) is represented by a perfectoid space S′ with a separated étale map S′→S. The representing bijections Hom_S(T,S′)≃Hom_{D_S}(D_T,D′) are natural in T.

Hypotheses: E is a nonarchimedean local field with residue F_q; the integral divisor base is Div^d_𝒴, so untilts over O_E including special-characteristic legs are allowed. D_T is the pullback effective Cartier divisor on 𝒴_T. The degree d is finite; repeated legs retain their Cartier multiplicities. The map D′→D_S is separated étale. No reductive group, coefficient ring or ℓ≠p hypothesis is needed.

Proof: Use v-descent for separated étale perfectoid spaces to reduce S to a strictly totally disconnected cover (DiamondsAndVStacks:D3/etale-and-finite-etale-are-v-stacks; FS cites Sch17a Proposition 9.7). Exhaust D′ by increasing quasicompact opens and work with one such open. On each geometric fibre, D_S up to nilpotents is the finite disjoint union of its distinct geometric O_E-untilt supports. A separated étale D′ over this fibre is a disjoint union of open subspaces. Spread these fibrewise descriptions to a neighbourhood, using the étale local structure theorem and the étale-site comparison (FS cites Sch17a Proposition 11.23 and Lemma 15.6), and glue the resulting local representing spaces. For the reduced case D′⊂D_S open, the representing locus is the complement of the image of |D_S|\|D′| under |D_S|→|S|. This is open because that support map is closed. Its inclusion into S represents exactly the lift functor. Descent and gluing give the separated étale S′→S and the natural universal property. Uniqueness follows from Yoneda.

Checks: For D′=D_S, the represented functor is final over S and S′≃S. For d>0 and D′ empty, every geometric fibre has a nonempty divisor, so the represented functor is empty and S′ is empty; for d=0, D_T is empty and S′≃S. Over a geometric base with r distinct support points, D′ a disjoint union of n labelled copies of D_S has n^r lifts; coincident legs do not create additional choices.

**Sources:** [FS](#source-fs), Lemma VI.1.13 and proof, printed/PDF p. 196.

**Prerequisites:** `RF:RF0:integral-Y/untilt-functor-of-points`; `RF:RF2:integral-divisors/div-d-moduli-v-sheaf`; `RF:RF2:integral-divisors/product-equation-and-affineness`; `RF:RF2:untilts`; `DVS:D1/strictly-totally-disconnected`; `DVS:D3/etale-and-finite-etale-are-v-stacks`; `DVS:D5/local-structure-of-etale-maps`; `DVS:D6/etale-site-comparison`; `RF:RF2:integral-divisors`.

<a id="smooth-scheme-loops"></a>

**Smooth scheme loops over a divisor** (`smoothSchemeLoopDimension`). For a smooth quasiprojective Z→O_E of relative dimension n, the functor of maps D_S→Z is representable in locally spatial diamonds, partially proper and ℓ-cohomologically smooth of dimension dn over Div^d_𝒴. Separated étale maps Z′→Z give representable separated étale maps T_{Z′}→T_Z; open immersions give open immersions.

Hypotheses: D_S affinoid on the chosen basis; ℓ≠p.

Proof: For affine space, pull back to the ordered-leg cover and filter the map by d successive affine-space diamonds of the corresponding untilts; each layer has dimension n.

**Sources:** [FS](#source-fs), VI.1.12–VI.1.13, pp. 195–196.

**Prerequisites:** `RF:RF2:integral-divisors/completed-rings-B-plus-and-B`; `RF:RF2:untilts/geometric-divisor-complete-dvr`; [smooth diamond calculus](#supplier-calculus); `DSO:S5/analytic-smooth-is-cohomologically-smooth`; `RG:RG2.3`; [Separated étale lifts over an effective divisor](#etale-over-divisor); `RF:RF2:untilts`.

<a id="congruence-filtration-and-graded-pieces"></a>

**Congruence filtration of positive loops** (`congruenceFiltration`). L⁺_mG=ker(L⁺G→G(B⁺/I^m)), m≥1, has successive quotients Lie(G)⊗_{O_E}I^m/I^{m+1}. For degree d these are vector-group diamonds of ℓ-dimension d·dim G. The reduction L⁺G/L⁺_1G is the functor of maps D_S→G; in degree one it is G^⋄. The geometry assertion is for the finite quotients and graded pieces, not for the entire inverse-limit group with a finite dimension.

Hypotheses: G split reductive O_E-model; ℓ≠p; I is the ideal of the degree-d divisor.

Proof: Linearize the group law modulo successive powers of I using smoothness of G.

**Sources:** [FS](#source-fs), VI.1.10–VI.1.11, pp. 194–195.

**Prerequisites:** [Loop spaces](#loop-groups-and-local-hecke); `RF:RF2:integral-divisors/completed-rings-B-plus-and-B`; `RF:RF2:untilts/cartier-filtration-and-breuil-kisin-lines`; `RG:RG2.1`; [smooth diamond calculus](#supplier-calculus); `DSO:S5/analytic-smooth-is-cohomologically-smooth`.

<a id="truncated-positive-loops"></a>

**Truncated positive loop groups** (`truncatedPositiveLoop`). For m≥1, L^{+,<m}G(S)=G(B⁺_D(S)/I^m) is the finite congruence quotient of L⁺G as a v-sheaf. Reduction has smooth vector-group kernels Lie(G)⊗I^j/I^{j+1}, 1≤j<m. These quotients provide finite-dimensional group actions on bounded Hecke loci.

Hypotheses: Split smooth integral model; degree-d divisor; ℓ≠p.

Proof: Use smooth lifting across nilpotent thickenings to identify the quotient, not only its naive pointwise image.

API:

- `truncatedPositiveLoop_eval`: The finite loop quotient evaluates F on the ring A/I^m, rather than the subgroup ker(F(A)→F(A/I^m)).
- `truncatedPositiveLoop_reduction`: Reduction of a positive loop gives a point in the m-th quotient; smoothness makes this locally surjective.
- `truncatedPositiveLoop_transition`: For a≤b, reduction modulo I^b maps to reduction modulo I^a.

Tests:

- `truncation_one`: At m=1 the quotient is G(A/I), not the congruence kernel.
- `truncation_trivial_group`: Every finite quotient of the trivial group is trivial.
- `truncation_ring_quotient`: The ring input is Mathlib Ideal.Quotient, preserving the ideal and its exponent.

**Sources:** [FS](#source-fs), VI.1.10–VI.1.11, pp. 194–195; VI.2.8, p. 201, for the later bounded-action application.

**Prerequisites:** [Congruence filtration of positive loops](#congruence-filtration-and-graded-pieces); `RG:RG2.3`; [smooth diamond calculus](#supplier-calculus); `DSO:S5/analytic-smooth-is-cohomologically-smooth`.

### Open cells, action truncation and minuscule flags

Compute stabilizers with the opposite-parabolic convention and derive dimensions from positive Lie weights. This geometry precedes all perverse or decomposition arguments.

<a id="open-cell-stabilizer-and-smoothness"></a>

**Open Schubert cell smoothness** (`schubertCellDimension`). Gr_{G,μ} is ℓ-cohomologically smooth of dimension ⟨2ρ,μ⟩ over the degree-one divisor base. Its stabilizer in L⁺G reduces to P⁻_μ (weights ≤0); the m-th graded piece consists of Lie weights ≤m. The quotient maps to (G/P⁻_μ)^⋄ with successive positive-loop unipotent fibres. Galois-orbit cells descend over the generic base.

Hypotheses: G split for the computation; μ dominant; ℓ≠p. Integral statement requires the reductive model.

Proof: Compute L⁺G∩μ(ξ)L⁺Gμ(ξ)⁻¹ in a faithful representation; in GL_n, the upper entry A_ij is divisible by ξ^{k_i−k_j}.

**Sources:** [FS](#source-fs), VI.2.4–VI.2.5, pp. 198–200; IV.1.18, p. 112.

**Prerequisites:** [Congruence filtration of positive loops](#congruence-filtration-and-graded-pieces); [Truncated positive loop groups](#truncated-positive-loops); [Galois descent of bounded modifications](#generic-galois-descent); `RG:RG2.1`; [smooth diamond calculus](#supplier-calculus); `DSO:S5/analytic-smooth-is-cohomologically-smooth`; `RF:RF4:vector-bundles`.

<a id="truncation-of-the-loop-action"></a>

**Finite truncation of bounded actions** (`boundedLoopActionTrivial`). If m>0 is at least every weight of μ on Lie G, then L⁺_mG acts trivially on Gr_{≤μ}. For ordered legs use the corresponding bound for the sum at each collision. Thus the action factors through L^{+,<m}G. The comparison of equivariant derived categories is the later GS1/prounipotent-equivariance theorem, with its filtered continuity and prime-to-p coefficient hypotheses.

Hypotheses: Split G; dominant μ; finite Schubert bound.

Proof: Use normality of the congruence kernel and the stabilizer weight calculation on the open orbit.

**Sources:** [FS](#source-fs), VI.2.8, p. 201.

**Prerequisites:** [Open Schubert cell smoothness](#open-cell-stabilizer-and-smoothness); [Truncated positive loop groups](#truncated-positive-loops); `RG:RG2.1`.

<a id="minuscule-bialynicki-birula"></a>

**Minuscule Bialynicki–Birula isomorphism** (`minusculeBialynickiBirula`). If μ has Lie weights in {−1,0,1}, the Bialynicki–Birula map Gr_μ→(G/P⁻_μ)^⋄ is an isomorphism. In GL_n it sends a B⁺_dR-lattice Λ to the ascending filtration Fil^m=((B⁺)^n∩ξ^{-m}Λ)/(ξ(B⁺)^n∩ξ^{-m}Λ). CS uses μ(ξ^{-1}); matching FS uses inversion of the coweight or of the chosen parabolic convention.

Hypotheses: Generic characteristic-zero untilt; minuscule μ; ℓ≠p for the smoothness consequence.

Proof: The stabilizer filtration has no additional fibre when μ is minuscule.

**Sources:** [CS](#source-cs), 3.4.4–3.4.6, pp. 685–686.

**Prerequisites:** [Open Schubert cell smoothness](#open-cell-stabilizer-and-smoothness); `RG:RG2.1`; `RF:RF4:vector-bundles`; `PH:P8:local-rational`.


## GS0. Witt bounds, determinant lines and projective models

### Lattices, types and finite-jet quotients

Construct the lattice functor and its proper perfect algebraic-space bounds before using determinant ampleness. Greenberg realization and smooth effective quotients give the original finite-jet route.

<a id="witt-lattice-functor-and-representability"></a>

**Witt lattice functor** (`WittLattice`). For a perfect F_p-algebra R let Λ be a finite projective W(R)-submodule of W(R)[1/p]^n with Λ[1/p]=W(R)[1/p]^n. Gr^W_GL_n is the v-sheaf of such lattices; a positive bounded piece Gr_{≤λ} has Λ⊂W(R)^n and quotient of type ≤λ. Negative bounds are obtained by translating by p^a. For O_E coefficients use RF0’s ramified Witt ring; for a general smooth model 𝓖 use 𝓖-torsors with a punctured trivialization.

Hypotheses: The two pole bounds on a lattice are locally uniform; coefficients perfect; quotient type has fixed total length.

Proof: Use finite projectivity and bounded denominators to define the functor.

API:

- `WittLattice_module`: A lattice is a finite projective B-submodule of K^n whose K-span is the whole module.
- `WittLattice_standard`: The image of B^n in K^n gives the standard lattice when B→K is injective.
- `WittLattice_ext`: Lattices are equal when their embedded submodules are equal; finite-projectivity proofs carry no extra moduli.

Tests:

- `lattice_rank_zero`: There is only one rank-zero lattice.
- `lattice_standard_field`: Over B=K the standard lattice agrees with the top Submodule of K^n.
- `lattice_span`: Exclude the zero rank-one submodule over a nonzero field.


**Sources:** [BS](#source-bs), 8.1 and 9.4–9.5, pp. 32, 36–37.

**Prerequisites:** `mathlib:WittVector`; `mathlib:PerfectRing`; `mathlib:Module.Projective`; `RF:RF0:integral-Y/ramified-coefficient-comparison`; `SF:SF.4`; `RG:RG2.3`; `mathlib:Module.Finite`.

<a id="witt-types-and-bounds"></a>

**Witt torsion module types** (`wittTypeBound`). A finite p-power-torsion isogeny cokernel Q over W(R) has geometric type λ=(λ₁≥⋯≥λ_n≥0), meaning Q_x≅⊕W(k_x)/p^{λ_j}. Its row lengths are n_λ(i)=#{j:λ_j>i}. Dominance means equal total length and all partial sums bounded. Type ≤λ is a closed locus; on a constant-type locus the modules p^iQ/p^{i+1}Q are finite projective of ranks n_λ(i). An isogeny is a map of finite projective W-modules invertible after p-inversion.

Hypotheses: R perfect; a uniform p-power kills Q; the isogeny-cokernel criterion is projective dimension at most one, including Q=0.

Proof: Import projective module algebra, Fitting-ideal tests and reducedness of perfect rings from SF.

API:

- `wittTypeBound_dominance`: The quotient-type relation is GL_n dominance after embedding nonnegative parts in the integer coweight lattice.
- `wittTypeBound_columns`: The i-th graded quotient has rank equal to the number of parts λ_j exceeding i.
- `wittTypeBound_closed_under_dominance`: A lower quotient type remains in any larger bound.

Tests:

- `witt_type_zero`: The zero bound admits only zero nonnegative quotient parts.
- `witt_type_210`: For λ=(2,1,0), the successive column ranks are two and one.
- `witt_type_not_component_order`: (1,0,0) is not below (2,1,0): the total lengths differ.


**Sources:** [BS](#source-bs), 7.1–7.9, pp. 27–32.

**Prerequisites:** [Witt lattice functor](#witt-lattice-functor-and-representability); `SF:SF.0`; `mathlib:Module.Projective`.

<a id="zhu-finite-jet-presentation"></a>

**Zhu finite-jet presentation** (`jetDeterminantLocus`). For λ=(N,0,…,0), V_N parametrizes W-matrices with determinant p^N times a unit. For h>N, V_{N,h} is the perfection of the truncated determinant locus det₀=⋯=det_{N−1}=0, det_N invertible. Gr̄_{N,h} adds a W_h-trivialization of the lattice and is an L^hGL_n-torsor over Gr̄_N. The stabilizer J={(A,γ):Aγ=A} gives Gr̄_{N,h}≅J after a chosen normalized lift.

Hypotheses: The isomorphism uses a choice of lifting; h>N, not h=N. Nonperfect Greenberg test rings use the ring scheme of O_E/ϖ^h, not a naive tensor formula.

Proof: Import Greenberg realization and perfect finite models from SF.

API:

- `jetDeterminantLocus_mem`: The matrix jet lies on the determinant locus when det(A)=uπ^N for a unit u; the finite truncation and bound h>N are retained in the application.
- `jetDeterminantLocus_right_invariance`: Right multiplication by an invertible matrix preserves the determinant locus.
- `jetDeterminantLocus_ring_map`: A ring map takes the determinant locus to the corresponding locus with the image uniformizer.

Tests:

- `jet_level_zero`: For N=0 the determinant is a unit.
- `jet_identity`: The identity matrix is in the N=0 locus.
- `jet_zero_excluded`: A zero rank-one matrix is excluded at N=0 over a nonzero field.

**Sources:** [Zhu](#source-zhu), 1.9–1.11, pp. 418–421.

**Prerequisites:** [Witt lattice functor](#witt-lattice-functor-and-representability); `SF:SF.0`; `RG:RG2.3`.

<a id="zhu-original-algebraic-space"></a>

**Original perfect algebraic-space construction** (`zhuBoundPresentation`). Each Gr̄_N and hence each bounded GL_n Witt Grassmannian is a perfectly finitely presented separated proper algebraic space; Gr is an increasing union of such pieces. For general reductive G a faithful representation with quasi-affine quotient gives a locally closed embedding into the GL_n Grassmannian; an affine quotient gives a closed embedding.

Hypotheses: Zhu published edition; perfect fields/rings; integral model assumptions pinned.

Proof: Use the affine jet presentation and effective quotient theorem A.29.

**Sources:** [Zhu](#source-zhu), 1.12, 1.19–1.20; A.29–A.31, pp. 421, 425–426, 476–477.

**Prerequisites:** [Zhu finite-jet presentation](#zhu-finite-jet-presentation); [Witt Demazure filtration space](#witt-demazure-resolution); `SF:SF.1`; `RG:RG2.3`.

### Demazure filtrations and geometric determinant descent

Filtration resolutions supply the connected-fibre descent criterion. Choose the first quotient of Q/pQ with the prescribed rank; lower-type fibres need not make Q/pQ itself that quotient. The determinant line is descended from graded quotient determinants.

<a id="witt-demazure-resolution"></a>

**Witt Demazure filtration space** (`wittFiltration`). For Q of type ≤λ, Dem_λ(Q) classifies Q=Q₀⊃Q₁⊃⋯⊃0 with Q_i/Q_{i+1} locally free over R of rank n_λ(i). The global resolution Gr̃_λ classifies a lattice together with such a filtration of W(R)^n/Λ. It is a proper pfp perfect scheme obtained by successive perfected Grassmannian bundles. Its image is Gr_{≤λ}; over exact type the filtration is the p-adic filtration and the map is an isomorphism.

Hypotheses: λ sorted nonnegative; total length fixed; all quotient maps respect the Witt action; zero λ gives the vanishing locus.

Proof: Use SF’s perfected Quot/Grassmann bundles to choose a locally free quotient Q/pQ→G of rank n_λ(0), and recurse on ker(Q→G) with λ shifted by one column. Q/pQ itself can have larger rank on lower-type fibres; it is not the chosen quotient G. BS 7.13 gives image, uniqueness and properness. Zhu 1.13–1.18 gives the lattice-chain presentation, including reversed dual bounds for reversed chains. BS 8.6 produces a smooth projective finite-type model for the global tower.

API:

- `wittFiltration_eval`: The typed filtration consists of a decreasing chain of submodules starting at M and ending at zero.
- `wittFiltration_piece`: Evaluation gives the i-th submodule in the chain.
- `wittFiltration_ext`: Two filtration points are equal if all their submodules agree.

Tests:

- `filtration_length_zero`: A length-zero filtration forces the module to be zero.
- `filtration_one_step`: A length-one filtration has first piece top and all later pieces zero.
- `filtration_direction`: The filtration decreases; increasing kernels of p must first be reverse-indexed.


**Sources:** [BS](#source-bs), 7.10–7.13 and 8.4–8.6, pp. 29–34.

**Prerequisites:** [Witt torsion module types](#witt-types-and-bounds); `SF:SF.0`; `SF:SF.1`; `CR:CR.1`.

<a id="connected-cohomological-fibres"></a>

**Fibres of the Witt resolution** (`wittResolutionConnectedFibres`). The fibres of Gr̃_λ→Gr_{≤λ} are geometrically connected and have RΓ(O)=k at geometric perfect fields. The resolution is an isomorphism over exact type. In Zhu’s full ω₁-chain resolution of Gr̄_N every lower-type fibre has positive dimension.

Hypotheses: Nonempty geometric fibres; Q an isogeny cokernel.

Proof: Apply BS 7.14 to filtered Grassmann incidence parameters; reverse the increasing kernels of multiplication by p to match its decreasing-filtration convention.

**Sources:** [BS](#source-bs), 7.13–7.14, pp. 30–32; [Zhu](#source-zhu), Lemma 1.18, pp. 424–425.

**Prerequisites:** [Witt Demazure filtration space](#witt-demazure-resolution); `SF:SF.0`; `SF:SF.3`.

<a id="h-descent-and-fibral-criterion"></a>

**Descent on Witt resolution fibres** (`wittFibralDescent`). Apply the supplier’s v-descent for finite/formal Witt bundles and its proper pfp connected-fibre criterion to Gr̃_λ→Gr_{≤λ}. Pullback on line bundles is fully faithful; a line bundle trivial on every geometric fibre descends. The stronger Rψ_*O=O criterion applies to the same resolution and commutes with base change.

Hypotheses: Proper surjective pfp perfect morphism; geometric connectedness alone is the weaker sufficient criterion, not an equivalence with Rψ_*O=O.

Proof: Import BS 4.1 and 6.1, 6.8, 6.13 from SF rather than reproduce their general theory.

**Sources:** [BS](#source-bs), 6.1, 6.8, 6.13 and 8.5, pp. 21–26, 33.

**Prerequisites:** [Fibres of the Witt resolution](#connected-cohomological-fibres); `SF:SF.4`; `SF:SF.3`.

<a id="geometric-determinant-line"></a>

**Geometric determinant line** (`geometricDeterminantLine`). There is a unique line bundle L on Gr_{≤λ} whose pullback to Gr̃_λ is ⊗_i det_R(Q_i/Q_{i+1}); these lines agree under lower bounds and hence form the determinant line on Gr_GL_n. Construct it geometrically using complete-flag refinements and fibre triviality, without the K-theoretic determinant.

Hypotheses: Positive quotient convention W(R)^n/Λ; determinant of a sublattice would reverse the line.

Proof: Refine filtrations to full flag towers as in BS 6.11 and 8.8.

API:

- `geometricDeterminantLine_pullback`: On the Demazure resolution, the pulled-back line is the tensor product of the determinants of the graded quotients, with the positive quotient convention.
- `geometricDeterminantLine_unique`: Fibre-trivial descent is unique through the fully faithful pullback of invertible sheaves.
- `geometricDeterminantLine_lower_bound`: Restriction to a lower bound agrees with that bound’s determinant line.

Tests:

- `determinant_zero`: The zero bound has the trivial invertible sheaf.
- `determinant_existing_carrier`: geometricDeterminantLine has the existing InvertibleSheaf carrier.
- `determinant_quotient_sign`: On a one-step quotient Grassmannian the line is the quotient determinant, with positive sign.


**Sources:** [BS](#source-bs), 6.11 and 8.8, pp. 25, 33–34.

**Prerequisites:** [Descent on Witt resolution fibres](#h-descent-and-fibral-criterion); [Witt Demazure filtration space](#witt-demazure-resolution); Tau Ceti `AlgebraicVectorBundles`, L0A–L0C; `SF:SF.3`; `K:Z.3`.

### Positivity, projectivity and integral families

Strict positivity on curves and the boundary calculation feed Keel’s theorem on finite models. Construct the boundary as a representable finite union before applying positivity. The resulting compact special bounds enter the integral divisor family.

<a id="determinant-positivity"></a>

**Positivity of the determinant line** (`determinantCurveDegree`). On Gr̃_λ, ⊗det(Q_i/Q_{i+1})^{a_i} is ample for a₀≫a₁≫⋯>0. Each determinant factor has sections nonvanishing on the exact-type open locus. The unweighted descended line has positive degree on every nonconstant proper curve in Gr_{≤λ}; its resolution pullback is nef and big, with exceptional locus contained in the lower-type boundary.

Hypotheses: Finite-type models fixed up to Frobenius; a_i integers with successive domination; effective divisors interpreted on these models.

Proof: Use BS 8.9 and Grassmann-bundle induction for weighted ampleness and explicit nonvanishing sections.

Checks: For a one-step projective Grassmannian the line has degree one on a Schubert line.

**Sources:** [BS](#source-bs), 8.9–8.11, pp. 34–35.

**Prerequisites:** [Determinant line](#geometric-determinant-line); `SF:SF.5`.

<a id="ampleness-via-keel"></a>

**Projectivity of the Witt Grassmannian** (`wittProjectiveBound`). For every dominant positive λ, Gr_{≤λ} is the perfection of a projective F_p-scheme and its determinant line is ample on a finite Frobenius model. Consequently all pole-bounded GL_n lattice pieces are perfections of projective varieties.

Hypotheses: Use BS’s geometric determinant construction. Keel’s criterion, exceptional locus and Frobenius extension/descent are imported from SF.5; pfp/model theory from SF.0.

Proof: Induct on dominance. Realize the lower boundary as an iterated finite pushout of lower bounds along closed intersections, importing the missing representability argument from SF.1. The determinant is ample on boundary pieces; Keel’s union lemma and strict curve positivity make it ample on the boundary. Keel’s restriction criterion then makes ψ*L semiample because its exceptional locus lies there. Take its Stein contraction on a finite model. Strict curve positivity and fibre triviality identify its equivalence relation with the Demazure quotient; hence the contraction is Gr_{≤λ}. Its descended line is ample.

Checks: No Zhu representability input in this independent route; λ=(1) recovers projective space.

**Sources:** [BS](#source-bs), §8.4, Theorem 8.3 (statement p. 32; proof pp. 35–36), Lemmas 8.9–8.11 (pp. 34–35).

**Prerequisites:** [Positivity of the determinant line](#determinant-positivity); [Descent on Witt resolution fibres](#h-descent-and-fibral-criterion); `SF:SF.1`; `SF:SF.5`.

<a id="perfect-model-and-etale-comparison"></a>

**Perfect models and étale realization** (`wittEtaleComparison`). For the bounded Witt schemes/algebraic spaces, import compatible finite-type models up to Frobenius, dimension and fibre-product compatibility and étale-topos equivalence from SF0/SF1. Apply those general results to identify their scheme diamondification with the characteristic-p fibre of the integral Grassmannian, by equality of the lattice/torsor functors. This result owns the Witt comparison application; SF owns the general model and perfection theory.

Hypotheses: Coordinate perfection is a direct Frobenius colimit; Mathlib Perfection is an inverse-limit carrier and is not cited for this construction. Trace/cycle normalizations require a fixed model.

Proof: Import Zhu A.3, A.15–A.17 and BS 3 from SF.0–SF.1.

**Sources:** [SW](#source-sw), 20.3.1–20.3.4, p. 185.

**Prerequisites:** [Witt lattice functor](#witt-lattice-functor-and-representability); `SF:SF.0`; `SF:SF.1`; `AC:L1/char-p-scheme-diamond-and-comparison-functor`; `DVS:D6/pre-adic-diamondification`.

<a id="integral-family-bounded-properness"></a>

**Integral bounded Grassmannian families** (`integralWittGenericComparison`). The integral BD Grassmannian over Spd O_E (or Div^d_𝒴) interpolates between the generic B⁺_dR Grassmannian and the v-sheaf of the Witt Grassmannian. For a split reductive model, the geometric relative-position bounds are closed and proper and representable in spatial diamonds, also for ordered multiple legs with summed collision bounds; their componentwise filtered union is the full functor.

Hypotheses: Fixed integral reductive model; unramified cocharacter reflex extensions in SW 20.3–20.5; no ramified reductive O_E-model asserted.

Proof: Use SW 20.3.2 for the torsor/étale quotient description and the explicit characteristic-p comparison.

**Sources:** [SW](#source-sw), 20.3.6 and 20.5.4, pp. 186, 190.

**Prerequisites:** [Projectivity of the Witt Grassmannian](#ampleness-via-keel); [Perfect models and étale realization](#perfect-model-and-etale-comparison); [Ordered legs and divisor base change](#ordered-leg-base-change); [Generic Schubert bounds](#schubert-bounds-and-properness); [proper pushforward calculus](#supplier-calculus); `DSO:S2/projection-formula`.

### Parahoric spaces and canonical models

Use inertia coinvariants for geometric component labels and retain residual Frobenius. Canonical finite models require their crystal/Hodge determinant comparison. The rank-two cone chart includes a stabilizer calculation that prevents a false uniqueness assertion for a right factor.

<a id="parahoric-ind-projectivity"></a>

**Witt affine flags and components** (`parahoricGeometricComponents`). For a smooth affine O_E-model 𝓖 of a reductive generic fibre, the Witt affine Grassmannian is an ind-pfp perfect space with locally closed embedding into a GL_n Grassmannian and ind-quasiprojective bounds. If 𝓖 is parahoric its bounds are projective. Over k̄ its components are π₁(G)_I via Kottwitz, with residual Frobenius action retained. For an Iwahori, Schubert cells have dimension ℓ(w), closures are the Bruhat unions and reduced-word Demazure spaces are iterated perfected P¹-bundles.

Hypotheses: Parahoric/Iwahori notions supplied by RG2.3; inertia I, not the full absolute Galois group, labels geometric components.

Proof: Use the faithful representation with quasi-affine quotient and Zhu 1.20.

Checks: For a torus the geometric flag space is the discrete inertia-coinvariant coweight scheme with Frobenius action.

**Sources:** [SW](#source-sw), 21.1.1–21.1.4, pp. 191–192.

**Prerequisites:** [Original perfect algebraic-space construction](#zhu-original-algebraic-space); [Projectivity of the Witt Grassmannian](#ampleness-via-keel); `RG:RG2.3`; `RG:RG2.4`.

<a id="integral-parahoric-properness"></a>

**Integral parahoric ind-properness** (`integralParahoricProperBounds`). If 𝓖° is parahoric, Gr_{𝓖,Spd O_E} is an increasing union of closed proper subfunctors. A closed representation 𝓖→GL_n induces a closed immersion of integral Grassmannians. For minuscule bounds the closure is unchanged on replacing 𝓖 by 𝓖°, and central quasiparahoric isogenies identify the corresponding closures after reflex-field base change.

Hypotheses: Quasiparahoric models and component maps as in SW 21.2–21.5; minuscule hypothesis only for the closure comparisons.

Proof: Import Anschütz’s extension/triviality of torsors on punctured A_inf from RF4:G-torsors.

Checks: For a torus the integral flag is the diamondification of the integral coweight scheme; special labels are inertia coinvariants.

**Sources:** [SW](#source-sw), 21.2.1–21.2.3, 21.4.3, 21.5.1, pp. 192–197.

**Prerequisites:** [Witt affine flags and components](#parahoric-ind-projectivity); `RF:RF4:G-torsors`; `RG:RG2.3`; `RG:RG2.4`; [proper pushforward calculus](#supplier-calculus); `DSO:S2/projection-formula`.

<a id="canonical-witt-models"></a>

**Canonical determinant models** (`canonicalWittModel`). For h>N, the finite-type truncated matrix locus det₀=⋯=det_{N−1}=0 with det_N invertible is a normal complete intersection. The normalized finite-jet quotient supplies Zhu’s canonical weakly normal model Gr′_μ. Compatible transition maps between these models may require Frobenius twists. The canonical Demazure model Gr̃′_N is a smooth projective model obtained from chains of p-divisible groups, with determinant comparison to the product of their Hodge lines.

Hypotheses: Fix model and Frobenius levels; do not infer normal Cohen–Macaulayness of every canonical Schubert model (Conjecture III). Dieudonné/crystal and p-divisible-group theory is imported.

Proof: Use Zhu B.4’s codimension and Serre-criterion argument for the matrix complete intersection, with the SF model API. Descend the normalized jet quotient using SF effective quotients; use twisted transitions as in B.6. Import B.7–B.9’s Dieudonné realization from the p-divisible-group owner and check the pullback of the Hodge determinant; the sketch-only comparison remains an explicit proof obligation.

API:

- `canonicalWittModel_transition`: A sufficiently deep finite-jet level has a transition to a shallower canonical model; compatibility can require a Frobenius twist.
- `canonicalWittModel_normalized_quotient`: The canonical model is identified with the normalized jet quotient, not an arbitrary scheme having the same perfection.
- `canonicalWittModel_perfection`: Its scheme perfection is the specified Witt Schubert bound.

Tests:

- `canonical_model_zero`: The N=0 canonical bound is Spec k, over the specified perfect coefficient field.
- `canonical_model_rank_one`: For GL₁ and N<h the canonical bound is Spec k, representing p^N W(k).
- `canonical_model_not_choice`: The dual-number F₂ algebra has ε≠0 with ε²=0, forgotten by perfection; a shared perfection does not determine a finite model.


**Sources:** [Zhu](#source-zhu), B.4–B.9, pp. 484–486.

**Prerequisites:** [Zhu finite-jet presentation](#zhu-finite-jet-presentation); [Witt Demazure filtration space](#witt-demazure-resolution); `SF:SF.0`; `SF:SF.1`; `SF:SF.4`; `FF:R07.2`; `FF:R07.6`; `CR:CR.1`; `CR:CR.7`.

<a id="rank-two-cone-chart"></a>

**Rank-two quadratic cone model** (`rankTwoConeClosedOrbit`). For p>2, GL₂ and N=2, Gr̄₂ has an open chart equal to the perfection of Spec k[x,y,z]/(x²−yz), via A=((p+[x],−[y]),([z],p−[x])). Together with the open exact-type orbit it covers Gr̄₂. Its Demazure resolution is the perfection of P(O(1)⊕O(−1)). The open decomposition locus of W₃-matrices X with [λ]det X=p² is characterized by X=Ag with g∈GL₂(W₃); the representative A is unique.

Hypotheses: p>2; finite Witt truncation h=3; correct order g̃=Ã⁻¹X̃ and determinant det X=p²[λ]⁻¹.

Proof: Use the projective-bundle extension E/p and its splitting to identify the resolution model. Use the determinant equations B.3.1 to solve uniquely for x,y,z on the locus det(X₁) invertible, then saturate by the right GL₂(W₃)-action. Repair the displayed inverse order in B.11. The rank-two adjugate argument below proves integrality of the chosen right factor Ã⁻¹X̃ and its unit determinant. The remaining refinement is the typed truncated-Witt and jet-torsor interface; the jet torsor then identifies the open chart. Choose a Witt lift X̃ as in Remark 1.11 and let Ã be the displayed Teichmüller matrix, so det(Ã)=p². For the corrected factor g̃=Ã⁻¹X̃, use X̃* Ã≡0 mod p² and adj(X̃* Ã)=Ã* X̃ in rank two. Thus p⁻² Ã* X̃ is integral. The determinant has the form det(X̃)=p²u with u∈W(R)× reducing to λ⁻¹; hence det(g̃)=u is a unit. Reducing this chosen factor modulo p³ gives X=Ag. The factor g can depend on the chosen lift and the stabilizer of A; B.11 asserts uniqueness of the cone representative A, not uniqueness or lift-independence of g. The remaining task is to express existence and the induced jet-torsor/quotient compatibility in the supplier’s truncated-Witt interface.

Tests:

- `rank_two_right_factor_not_unique`: Over ℤ/27, A=3·Id and g=Id+9E₁₂ satisfy Ag=A, det g=1, g≠Id. Zhu B.11 specifies A uniquely, not g.


**Sources:** [Zhu](#source-zhu), B.10–B.11, pp. 486–488.

**Prerequisites:** [Canonical determinant models](#canonical-witt-models); [Zhu finite-jet presentation](#zhu-finite-jet-presentation); `SF:SF.0`.

### Normalized lines, sections and bounded flag correspondences

Normalization removes the standard-lattice determinant factor. Section growth and admissible local-model loci are separate consequences. All affine flag fibre dimensions are computed on compatible bounded perfect models; ordinary multiplication and Demazure multiplication have different bounds.

<a id="sl-determinant-normalization"></a>

**Normalized determinant on SL_n lattices** (`normalizedDeterminant`). On Gr_SL_n over the ramified Witt coefficient ring, lattices have determinant trivialization. For a≪0 define L_M as det̃(p^aW_{O_E}(R)^n/M)⊗det̃(p^aW_{O_E}(R)^n/W_{O_E}(R)^n)⁻¹, independent of a. It is ample on every proper bound. Translations differ from L only by a line on the base, giving a G_m-central extension of the loop group acting on L.

Hypotheses: The ordinary geometric determinant on filtered torsion modules agrees with the imported determinant calculus; the normalization factor is retained. This does not assert an honest LG-linearization.

Proof: Reduce the ramified coefficient module to W(R)^{ne} using a fixed coefficient basis, then use the GL_{ne} bound and determinant line.

API:

- `normalizedDeterminant_trivial`: At the standard lattice, the normalized determinant line is the tensor unit.
- `normalizedDeterminant_comparison`: Normalization retains the inverse standard-lattice determinant factor.
- `normalizedDeterminant_translation`: Translation gives a line from the base tensored with the original line; the compatible lines form a central extension rather than an honest action on the line.

Tests:

- `normalized_standard`: The standard lattice has normalized determinant R.
- `normalized_zero_quotient`: Two zero truncation quotients have the unit determinant.
- `normalized_tensor_carrier`: Tensor products and determinant duals use existing ModuleCat and TensorProduct.


**Sources:** [BS](#source-bs), 10.1 and discussion through 10.4, pp. 37–39.

**Prerequisites:** [Determinant line](#geometric-determinant-line); [Projectivity of the Witt Grassmannian](#ampleness-via-keel); `RF:RF0:integral-Y/ramified-coefficient-comparison`; `K:Z.3`.

<a id="sections-on-witt-bounds"></a>

**Sections of the Witt determinant line** (`determinantSectionsRestriction`). For the ample determinant line on Gr_SL_n, restriction of global sections to any proper closed bound is surjective, and the global section space is infinite dimensional whenever the Grassmannian has positive-dimensional bounds.

Hypotheses: Pass to fixed finite models and arbitrarily large Frobenius powers of their ample lines. This gives no answer to BS Question 10.6 about canonical modules or embeddings.

Proof: Use SF’s section-colimit description of line bundles on perfections.

**Sources:** [BS](#source-bs), 10.5 and 10.6, pp. 39–40.

**Prerequisites:** [Normalized determinant on SL_n lattices](#sl-determinant-normalization); `SF:SF.5`; `SF:SF.0`.

<a id="bounded-admissible-flags"></a>

**Bounded admissible affine flag loci** (`admissibleFlagLocus`). For a parahoric 𝓚 and a dominant cocharacter class μ, the admissible locus A_{𝓚,μ} is the finite closed union of affine Schubert strata labelled by the parahoric image of Adm(μ). Its reduced perfect structure is determined by geometric points. Under a morphism of parahoric models f:𝓚₁→𝓚₂ sending μ₁ to μ₂, the map of affine flags carries A_{𝓚₁,μ₁} into A_{𝓚₂,μ₂}.

Hypotheses: Admissible sets and affine Bruhat order from RG2.4; integral v-sheaf local-model existence/functoriality is an imported refinement, not inferred from Satake. Use the connected parahoric/local-model hypotheses of GLX §3.2 and §3.3 (Lemmas 3.3–3.4) and van Hoften §2.2.6–§2.2.15. Van Hoften §2.2.15 states the perfect local-model interpretation for minuscule μ; GLX §3.2 supplies the non-minuscule extension. A generic group homomorphism without an integral parahoric model morphism is not covered.

Proof: Use finite Bruhat unions and the representable flag spaces.

API:

- `admissibleFlagLocus_mem`: A flag lies in the admissible locus precisely when it is in one of the finitely many admissible Schubert strata.
- `admissibleFlagLocus_mono`: Increasing the admissible label set enlarges the locus.
- `admissibleFlagLocus_map`: An ambient flag morphism whose local-model comparison sends all admissible strata into the target locus restricts to the admissible locus.

Tests:

- `admissible_empty`: The empty label set gives the empty locus.
- `admissible_singleton`: A singleton label gives exactly its Schubert stratum.
- `admissible_nonlabel`: Exclude points in no admissible stratum, including wrong components.

**Sources:** [GLX](#source-glx), §3.2 and §3.3, Lemmas 3.3–3.4, pp. 822–823; [vH](#source-vh), §2.2.14–§2.2.15, pp. 15–16.

**Prerequisites:** [Witt affine flags and components](#parahoric-ind-projectivity); `RG:RG2.4`; `SF:SF.4`.

<a id="flag-incidence-correspondences"></a>

**Relative-position flag correspondences** (`flagIncidence`). For affine flags define O_w⊂Fl×Fl by relative position w. The two-step incidence C_{u,v}={(x,z,y):(x,z)∈O_u,(z,y)∈O_v} maps by forgetting z to Fl×Fl; pull back to O_{uv} or O_{u*v} to get the product and Demazure-product correspondences. Work on finite Schubert bounds over the first flag; these give pfp perfect models and compatible base changes.

Hypotheses: Relative position and Demazure product from RG2.4. The bounded twisted product is not an untwisted Cartesian product.

Proof: Construct the fibre-product incidence and its projection from the affine flag moduli.

API:

- `flagIncidence_points`: Two-step incidence consists of (x,z,y) with (x,z) in the first relative-position orbit and (z,y) in the second.
- `flagIncidence_projection`: The product projection forgets z and returns (x,y).
- `flagIncidence_fibre`: The fibre over (x,y) is the set of middle flags satisfying both relative-position conditions.

Tests:

- `incidence_identity_left`: If the first relation is the diagonal, z is uniquely x.
- `incidence_empty`: An empty first relation gives empty incidence.
- `incidence_no_unrestricted_middle`: For both diagonal relations, a middle flag different from x cannot occur.

**Sources:** [He](#source-he), 5.3–5.4, pp. 9–12.

**Prerequisites:** [Witt affine flags and components](#parahoric-ind-projectivity); `RG:RG2.4`; `SF:SF.0`; `SF:SF.1`.

<a id="flag-convolution-fibres"></a>

**Affine flag convolution fibre bounds** (`flagConvolutionFibreBound`). If ℓ(uv)=ℓ(u)+ℓ(v), the product-incidence projection C_{u,v}|_{O_{uv}}→O_{uv} is an isomorphism. In general it is surjective with each geometric fibre of dimension ≥(ℓ(u)+ℓ(v)−ℓ(uv))/2. The Demazure-product projection is surjective with fibres of dimension ≥ℓ(u)+ℓ(v)−ℓ(u*v). These statements transfer to compatible pfp perfect models and their bounded pullbacks.

Hypotheses: Nonempty fibres and bounded pfp models; ordinary and Demazure products kept distinct. Adjoint transfer is componentwise and needs the corrected GHN hypothesis. He’s standing geometric setting is a simple quasi-split group over the local field (§2.2); any transfer to other groups must use the componentwise comparison with its stated hypotheses.

Proof: Use rank-one A¹/G_m convolution strata and induction on affine reduced words, as in GH10 2.4–2.5 cited by He 5.6.

Checks: For u=v=s, ℓ(s)=1 and s*s=s: the Demazure fibre has dimension at least one, while the ordinary-product fibre lower bound is one.

**Sources:** [He](#source-he), 5.6 and proof 5.5, pp. 10–12.

**Prerequisites:** [Relative-position flag correspondences](#flag-incidence-correspondences); `RG:RG2.4`; `SF:SF.0`; `SF:SF.4`.


## GS1. Semi-infinite geometry, ULA and relative perversity

### Length, relative position and hyperbolic localization

Semicontinuity produces the closed weight filtrations used for constant terms. Affineness and dimensions are geometric inputs to perversity. Rational MV cycles use top cohomology on fixed finite models rather than an integral canonical basis.

<a id="length-semicontinuity"></a>

**Semicontinuity of completed divisor length** (`divisorLengthUpperSemicontinuous`). In the ordered O_E-untilt setup of FS VI.3.2, let f∈B⁺. The function ℓ_f:|S|→ℕ∪{∞}, s↦length_{B_s⁺}(B_s⁺/(f_s)), has open sublevel loci {s | ℓ_f(s)≤m} for every m∈ℕ. Infinite length is retained when f_s vanishes on a DVR factor; it is never replaced by zero.

Hypotheses: S=Spa(R,R⁺) is affinoid perfectoid over F_q; E is a nonarchimedean local field with residue field F_q. Fix n≥1 ordered O_E-untilts S_i^♯=Spa(R_i^♯,R_i^{♯+}), with repetitions allowed, and primitive generators ξ_i of ker(θ_i:W_{O_E}(R⁺)→R_i^{♯+}). Choose a pseudouniformizer ϖ of R. Put ξ=∏_i ξ_i, B⁺=lim_k W_{O_E}(R⁺)[1/[ϖ]]/(ξ^k), and B=B⁺[1/ξ]. These are the actual Cartier-completed period rings; ξ need not be a uniformizer when legs coincide. For s∈|S| use the corresponding completed residue-field pair (K(s),K(s)⁺) and the induced ring map B⁺→B_s⁺. Its distinct geometric untilt supports give the finite product of complete DVRs; repeated supports do not create new product factors. Use ordinary module length over that product, allowing infinity.

Proof: For each i, let S_i be the closed locus in S where the image of f in the i-th untilt R_i^♯ vanishes. Away from their finite union, f is a unit in every geometric completed DVR factor, so ℓ_f=0. On S_i, pull back to that closed locus and divide f by its regular Cartier generator ξ_i. For f_i=f/ξ_i the geometric module length is ℓ_f=ℓ_{f_i}+1, with ∞+1=∞. This counts that one degree-one divisor even if some other legs coincide. Induct on m. In each closed S_i the bad locus ℓ_f>m is the bad locus ℓ_{f_i}>m−1, closed by induction; their finite union is the complement of the required open sublevel locus. The case m=0 is the unit locus described in the first step.

Checks: A unit f has length zero on every fibre; f=0 has infinite length on every nonempty geometric divisor fibre. For one geometric leg and f=ξ_1^a, the length is a. For ξ=ξ_1^n at a coincident n-tuple, length(B_s⁺/ξ)=n, not one. For distinct supports, length is the sum of the DVR-factor lengths; no DVR assertion is made about the whole product.

**Sources:** [FS](#source-fs), Lemma VI.3.3 and full proof, printed p. 204; setup in Lemma VI.3.2, printed p. 203.

**Prerequisites:** `RF:RF2:integral-divisors/product-equation-and-affineness`; `RF:RF2:integral-divisors/completed-rings-B-plus-and-B`; `RF:RF2:integral-divisors/addition-and-disjoint-divisor-loci`; `RF:RF2:untilts/divisor-completion-base-change`; `RF:RF2:untilts/geometric-divisor-complete-dvr`; `RF:RF2:untilts`.

<a id="lattice-relative-position-semicontinuity"></a>

**Semicontinuity of lattice position** (`latticeRelativePositionUpperSemicontinuous`). In the ordered O_E-untilt setup of FS VI.3.2, let L⊂B be a finitely generated B⁺-submodule for which ξ^N B⁺⊂L⊂ξ^(−N)B⁺ for some N≥0. Let S_m⊂|S| be the locus where the image L_s of L⊗_{B⁺}B_s⁺ in B_s has total relative position m∈ℤ against B_s⁺. Then ⋃_{m′≥m}S_{m′} is closed for every m∈ℤ. If S_m=|S| for some m, L is a line bundle over B⁺ (a finite projective module of rank one); global freeness is not asserted.

Hypotheses: S=Spa(R,R⁺) is affinoid perfectoid over F_q; E is a nonarchimedean local field with residue field F_q. Fix n≥1 ordered O_E-untilts S_i^♯=Spa(R_i^♯,R_i^{♯+}), with repetitions allowed, and primitive generators ξ_i of ker(θ_i:W_{O_E}(R⁺)→R_i^{♯+}). Choose a pseudouniformizer ϖ of R. Put ξ=∏_i ξ_i, B⁺=lim_k W_{O_E}(R⁺)[1/[ϖ]]/(ξ^k), and B=B⁺[1/ξ]. These are the actual Cartier-completed period rings; ξ need not be a uniformizer when legs coincide. For s∈|S| use the corresponding completed residue-field pair (K(s),K(s)⁺) and the induced ring map B⁺→B_s⁺. Its distinct geometric untilt supports give the finite product of complete DVRs; repeated supports do not create new product factors. Use ordinary module length over that product, allowing infinity. Relative position uses the sum of the valuations on the distinct geometric DVR factors, with the convention that for L_s⊂B_s⁺ it is length(B_s⁺/L_s). The image of tensor base change is used, not an unproved injectivity of L⊗B_s⁺→B_s. L is finitely generated, open and bounded in the displayed ξ-adic sense. These hypotheses imply only finitely many relative-position values; local principality is the conclusion, not an input.

Proof: Multiply L by a power of ξ to reduce to L⊂B⁺. This changes every relative-position value by the same constant (the degree n times that power), so it preserves the claimed semicontinuity and constant-position criterion. At a point s, B_s⁺ is a finite product of DVRs and L_s is a free rank-one ideal. After localizing S, choose l∈L whose image generates L_s. Apply length-semicontinuity to l: near s the length of B_t⁺/(l_t) is at most the length at s. Since B⁺l⊂L, the relative position of L_t is at most that of B_t⁺l. Thus the relative-position sublevel loci are open; taking complements gives closed loci of position at least m. If the position is constant, the containment B⁺l⊂L has equal geometric fibre positions nearby and is an equality there; the generator gives a local trivialization. The ring/lattice fibre-detection step is supplied by RF4’s stated finite-projectivity and fibre-detection extension, not inferred from an arbitrary ring map. These local identifications make L a line bundle.

Checks: L=B⁺ has constant position zero and is a line bundle. L=ξ^aB⁺ has constant total position na, including coincident legs. The closed-locus direction is position≥m; the open-locus direction is position≤m. They are not interchanged. Constancy gives local rank-one projectivity, not a chosen global generator; no assertion is made for a merely pointwise specified or non-finitely-generated submodule.

**Sources:** [FS](#source-fs), Lemma VI.3.2 and full proof, printed pp. 203–204; relative-position convention immediately before the lemma.

**Prerequisites:** [Semicontinuity of completed divisor length](#length-semicontinuity); `RF:RF2:integral-divisors/completed-rings-B-plus-and-B`; `RF:RF2:untilts/divisor-completion-base-change`; `RF:RF2:untilts/geometric-divisor-complete-dvr`; `RF:RF4:vector-bundles`.

<a id="semi-infinite-orbits-and-hyperbolic-localization"></a>

**Semi-infinite strata and constant terms** (`constantTerm`). For a parabolic P⁺⊂G with Levi M and opposite P⁻, Hck_{P±}→Hck_G and Hck_{P±}→Hck_M give CT_P=R(p⁺)_!(q⁺)*. On bounded monodromic objects it identifies with R(p⁻)_*R(q⁻)!. For a Borel, on a one-leg geometric fibre with primitive equation t, the local strata are S_λ=L U·λ(t). On a general geometric fibre the stratum of total cocenter weight ν is the union of products of these local strata over the distinct supports, with local labels summing to ν. The union of total-weight strata with ν′≤ν is closed as in VI.3.1; for a Borel this is the coroot order on all coweights, without requiring dominance; the attracting and repelling decompositions come from a regular central cocharacter of M.

Hypotheses: G split for labels; bounded quasicompact Schubert support; coefficients killed by an integer prime to p initially, with derived adic passage supplied by L0. The cocenter degree is the sum of the combined local cocharacters over distinct geometric supports, counted once each. At collisions the ordered-leg labels add first; the support multiplicity is not an additional weight.

Proof: Use RG’s parabolic/Levi and Iwasawa decompositions on geometric points. For the locally closed strata and their closed weight-bound unions, reduce via a faithful representation, maximal parabolics and exterior powers to an image submodule of a rank-one period module; apply lattice-relative-position-semicontinuity (FS VI.3.2), whose proof uses length-semicontinuity (VI.3.3). In that reduction use ordinary product-DVR length, as in VI.3.2, rather than the extra multiplicity weighting in the description before VI.3.1. Verify FS IV.6.1’s finite attracting/repelling decomposition on each bound. Import the diamond hyperbolic-localization theorem, base change, duality and ULA preservation from VS1; apply it to the maps of Hecke stacks.

API:

- `constantTerm_formula`: The plus constant-term functor is q-plus pullback followed by p-plus shriek pushforward.
- `constantTerm_minus_comparison`: On bounded monodromic complexes the plus formula is naturally isomorphic to q-minus exceptional pullback followed by p-minus star pushforward.
- `constantTerm_map_comp`: Constant term preserves composition of morphisms as a genuine functor.

Tests:

- `ct_torus`: For G=T with identity correspondence, constant term is the identity functor.
- `ct_point_evaluation`: The plus formula evaluates to p-shriek of q-star on every object.
- `ct_order`: Composition agrees with Mathlib Functor.comp in pullback-then-pushforward order.


**Sources:** [FS](#source-fs), VI.3.1–VI.3.5, pp. 201–206.

**Prerequisites:** [Generic Schubert bounds](#schubert-bounds-and-properness); `RG:RG2.4`; `VS:VS0/artin-v-stack-definition`; `VS:VS1`; [dual six-operation calculus](#supplier-calculus); `AC:L0/derived-I-complete-etale-category`; `AC:L0/adic-coefficient-limit`; `AC:L0/completed-tensor-and-colimits`; `AC:L0/six-operations-for-adic-coefficients`; `VS:VS0`; [Semicontinuity of lattice position](#lattice-relative-position-semicontinuity); `VS:VS1/hyperbolic-localization`; `VS:VS1/braden-theorem`; `VS:VS1/hyperbolic-base-change-duality-and-ula`.

<a id="semi-infinite-affineness"></a>

**Affine semi-infinite intersections** (`semiInfiniteBoundAffine`). On the Witt special fibre, S_λ∩Gr_{≤μ} is affine and perfectly finitely presented. It is the nonvanishing locus of a section of the ample determinant line on the closed weight-bound union. When nonempty, this bounded intersection is equidimensional of dimension ⟨ρ,μ+λ⟩; the same holds for its nonempty open intersection with the exact μ-cell. Neither dimension formula is asserted for an empty intersection.

Hypotheses: Split group; fixed perfect field; nonempty for the dimension assertion; integral coefficient freeness does not follow from cycle counting.

Proof: Use the faithful representation and a highest-weight determinant section to express the semi-infinite weight condition as a nonvanishing locus (VI.3.7).

**Sources:** [FS](#source-fs), VI.3.7–VI.3.8, pp. 205–207.

**Prerequisites:** [Semi-infinite strata and constant terms](#semi-infinite-orbits-and-hyperbolic-localization); [Projectivity of the Witt Grassmannian](#ampleness-via-keel); `RF:RF4:G-torsors`; `RG:RG2.1`; `SF:SF.5`.

<a id="semi-infinite-intersections-and-mv-cycles"></a>

**Mirković–Vilonen intersections** (`mvCycleDimension`). For the rational special-fibre category over k̄, the top-dimensional irreducible components of the nonempty S_λ∩Gr_μ give the weight-cycle description of H_c^{⟨2ρ,λ⟩}(S_λ,IC_μ). The intersection dimension is ⟨ρ,μ+λ⟩; unshifted constant coefficients on its open top-dimensional pieces occur in degree ⟨2ρ,μ+λ⟩. Cycle normalization is relative to a fixed finite model, since different perfection models can rescale trace classes by powers of p.

Hypotheses: Rational ℓ-adic coefficients; IC perverse normalization [⟨2ρ,μ⟩]; choose model; no assertion of a canonical integral cycle basis.

Proof: Use semi-infinite dimensions and the rational concentration theorem.

Checks: The nonempty torus case has one component and weight dimension one.

**Sources:** [Zhu](#source-zhu), 2.8–2.9, pp. 434–436; A.3.3, pp. 479–480.

**Prerequisites:** [Affine semi-infinite intersections](#semi-infinite-affineness); [Rational special-fibre weights](#rational-weight-concentration); `EDC:EDC.5/intersection-complex`; [Perfect models and étale realization](#perfect-model-and-etale-comparison).

### Finite equivariance and recognition of ULA complexes

Deep prounipotent kernels are removed using ordinary-cohomology continuity. Constant terms detect ULA through their perfect locally constant torus pushforward. The special/generic equivalence here has one leg.

<a id="prounipotent-equivariance"></a>

**Prounipotent equivariance invariance** (`prounipotentEquivariance`). Let H be a group small v-sheaf over S with closed congruence subgroups H^{≥m}, complete separated filtered presentation, and, v-locally on S, finite filtrations of each successive quotient by affine-line diamonds of untilts. If the action on X factors through H^{<m}=H/H^{≥m}, m>0, pullback D_ét(H^{<m}\X,Λ)→D_ét(H\X,Λ) is an equivalence for coefficients killed by an integer prime to p. Consequently the deep congruence kernel adds no equivariance data. H itself need not have a finite filtration.

Hypotheses: Closed congruence filtration as in FS VI.4.1, with the filtered spatial ball-subgroup/inverse-limit presentation used in its proof; action factors at a finite level. Λ is killed by n prime to p. The adic extension is levelwise with compatible derived coefficient limits, not an unrestricted p-torsion assertion.

Proof: Descend along S→[H^{<m}\S] to reduce to a trivially acting deep kernel. Use the section to reduce equivariant descent to full faithfulness of pullback on complexes. Compute ordinary cohomology RΓ(S,A)→RΓ(S×H,A), using Postnikov towers, spatial ball subgroups H_j and their finite quotients H_j^{<r}. Apply Sch17a 14.9 continuity and ordinary cohomology of relative balls. Descend the equivalence through the action nerve and apply finite bounded-action factorization. Affine-space compact support is Λ(−d)[−2d], so it is not unshifted acyclicity.

Checks: A vector group has only the trivial bounded prime-to-p equivariant local system; this fails as an unrestricted p-torsion assertion.

**Sources:** [FS](#source-fs), VI.4.1, pp. 207–208.

**Prerequisites:** [Finite truncation of bounded actions](#truncation-of-the-loop-action); [Congruence filtration of positive loops](#congruence-filtration-and-graded-pieces); [smooth diamond calculus](#supplier-calculus); `DSO:S5/analytic-smooth-is-cohomologically-smooth`; `AC:L0/derived-I-complete-etale-category`; `AC:L0/adic-coefficient-limit`; `AC:L0/completed-tensor-and-colimits`; `AC:L0/six-operations-for-adic-coefficients`; [dual six-operation calculus](#supplier-calculus); `VS:VS1`.

<a id="constant-term-conservativity"></a>

**Conservativity of constant terms** (`constantTermConservative`). For split G and a Borel B, CT_B is conservative on bounded Hecke complexes with quasicompact Schubert support. After a splitting extension this supplies the corresponding criterion for general G/E.

Hypotheses: Bounded support and monodromic/positive-loop equivariance; prime-to-p coefficients.

Proof: Use the closed semi-infinite filtration and choose an extremal nonzero stratum.

**Sources:** [FS](#source-fs), VI.4.2, pp. 208–209.

**Prerequisites:** [Semi-infinite strata and constant terms](#semi-infinite-orbits-and-hyperbolic-localization); [Prounipotent equivariance invariance](#prounipotent-equivariance); [Galois descent of bounded modifications](#generic-galois-descent).

<a id="ula-sheaves-on-the-hecke-stack"></a>

**ULA Hecke complexes** (`ulaHeckeCategory`). D^ULA(Hck_G/S,Λ) is the full subcategory of complexes with bounded quasicompact Schubert support whose pullback to Gr_G is universally locally acyclic over S. Switching the two torsors preserves this condition. On one leg over Spd O_C this is equivalent to requiring that every open-cell restriction along a geometric section is locally constant with perfect fibre.

Hypotheses: Support can be locally bounded on the base; a fixed bound is used in each argument. General ULA and stack formalism imported from VS1.

Proof: Use the smooth truncated positive-loop quotient charts and VS1’s ULA descent.

API:

- `ulaHeckeCategory_finite_action`: The typed equivariant-object core is Action DU H, where DU is the supplied ULA category and H is a finite jet group on the chosen bound.
- `ulaHeckeCategory_forget`: Forget positive-loop equivariance to the underlying ULA object, keeping its intertwining morphisms.
- `ulaHeckeCategory_trivial_action`: A ULA object has the trivial finite-jet action whenever this is the desired equivariance.

Tests:

- `ula_trivial_group`: For the trivial group, an equivariant object has no additional automorphism labels.
- `ula_intertwining`: Equivariant morphisms intertwine every group element.
- `ula_action_identity`: The finite-jet action obeys the existing Action identity law.

**Sources:** [FS](#source-fs), VI.6.1–VI.6.5, pp. 211–214.

**Prerequisites:** [Prounipotent equivariance invariance](#prounipotent-equivariance); [Affine flags and Demazure spaces over Spd O_C](#affine-flag-demazure); `VS:VS1/ula-for-artin-v-stacks`; [Finite truncation of bounded actions](#truncation-of-the-loop-action); `mathlib:Action`.

<a id="ula-constant-term-criterion"></a>

**ULA recognition by constant terms** (`ulaConstantTermPerfect`). For a bounded Hecke complex A, the following are equivalent: A is ULA; CT_B A is ULA; for every D→Div^d the torus constant-term pushforward over D is locally constant with perfect stalks. On one-leg or disjoint-leg bases the ULA category is stable under Verdier duality, tensor and internal Hom, cell !/* extensions and cell !/* restrictions.

Hypotheses: Split G and Borel for labels; the disjoint-leg restriction is essential for the complete cell calculus.

Proof: For the forward direction, hyperbolic localization preserves ULA and proper torus pushforward on a bounded support remains ULA. For the converse, reduce to a strictly totally disconnected base and split G, and use the ULA diagonal-duality map of IV.2.23 on a bounded finite-dimensional quotient chart. By conservativity of CT for G×G it suffices to apply CT_{B⁻×B}; compatibility with exterior tensor products and hyperbolic duality IV.6.13 identifies the result with the same ULA criterion for CT_B(A). The final perfect locally constant pushforward criterion uses IV.2.28. Apply the one-leg cellwise criterion VI.6.5 and its closure consequence VI.6.6 one leg at a time on the disjoint locus for VI.6.8. The arbitrary collision version of those cell-functor closure assertions is not claimed.

Tests:

- `perfect_complex_cohomology_not_projective`: For R=ℤ/4, H¹(R —2→ R)=R/(2) is not projective, although the complex is perfect.


**Sources:** [FS](#source-fs), VI.6.4–VI.6.6, VI.6.8, pp. 212–215.

**Prerequisites:** [ULA Hecke complexes](#ula-sheaves-on-the-hecke-stack); [Conservativity of constant terms](#constant-term-conservativity); `VS:VS1`; `VS:VS1/ula-for-artin-v-stacks`; [dual six-operation calculus](#supplier-calculus); `mathlib:DerivedCategory`; `mathlib:Module.Finite`; `mathlib:Module.Projective`; `VS:VS1/ula-dualizability-criterion`; `VS:VS1/hyperbolic-base-change-duality-and-ula`; `VS:VS1/perfect-local-systems`; `VS:VS1/ula-relative-adjoints-and-calculus`.

<a id="integral-family-comparison"></a>

**One-leg ULA special/generic comparison** (`oneLegULAComparison`). For a split integral model and one leg, restriction induces equivalences D^ULA(Hck_{Spd O_C},Λ)≃D^ULA(Hck_{Spd C},Λ)≃D^ULA(Hck_{Spd k̄},Λ), compatible with finite Schubert bounds and coefficient change. The special side is identified with perfected scheme charts by the L1/L3 comparison; this is an actual restriction equivalence, not a formal analogy between lattice rings.

Hypotheses: Algebraically closed complete untilt C; split integral model; bounded quasicompact support; prime-to-p/derived adic coefficients.

Proof: Use the cellwise locally constant perfect criterion, whose restriction over the strictly local trait is an equivalence.

Checks: An arbitrary non-ULA complex is not transported by this equivalence; split model fixed throughout.

**Sources:** [FS](#source-fs), VI.6.7, p. 214; VI.7.4, pp. 217–219.

**Prerequisites:** [ULA recognition by constant terms](#ula-constant-term-criterion); [Integral bounded Grassmannian families](#integral-family-bounded-properness); `AC:L1/char-p-scheme-diamond-and-comparison-functor`; `AC:L3/rf-shriek-comparison-27-4`; `EDC:EDC.5/perverse-recollement`; `AC:L3/full-faithfulness-27-2`; `AC:L3/commutation-and-adjoints-27-1-27-3`.

### Perverse descent and flatness

Construct the relative t-structure from the cell dimensions and geometric-fibre tests. Shifted constant terms detect its heart. Flatness requires the all-module derived tensor test and is stronger than integral perversity.

<a id="relative-perverse-t-structure"></a>

**Relative perverse t-structure** (`relativePerverse`). On the bounded-support derived category over a leg base S, define perverse ≤0 by the condition that at each geometric point with r distinct untilts and open-cell labels μ₁,…,μ_r, the restriction lies in ordinary degrees ≤−Σ⟨2ρ,μ_i⟩. The opposite aisle is obtained by the glued costalk inequalities. These form a t-structure; pullback in S is t-exact. On ULA objects the relative condition is detected on geometric fibres.

Hypotheses: Use distinct local factors at collisions; bounded support and locally finite Schubert stratification. Stable enhancement and presentability are imported from EDS.

Proof: Use the stable enhanced category and Lurie HA 1.4.4.11 to generate the aisle and right orthogonal.

API:

- `relativePerverse_le`: On ULA complexes, the nonpositive aisle is detected by the normalized torus constant term in nonpositive ordinary degrees.
- `relativePerverse_ge`: On ULA complexes, the nonnegative aisle is detected by normalized torus constant term in nonnegative ordinary degrees.
- `relativePerverse_existing_heart`: Its heart is the intersection of the two degree-zero aisles, using Mathlib TStructure.heart.

Tests:

- `perverse_torus`: For a torus, normalized CT is identity and relative perversity is ordinary perversity.
- `perverse_zero`: The zero object belongs to the relative perverse heart.
- `perverse_shifted_cell`: A smooth d-cell uses Λ[d]; normalized torus constant term is in degree zero.

**Sources:** [FS](#source-fs), VI.7.1–VI.7.4, pp. 215–219.

**Prerequisites:** [Affine semi-infinite intersections](#semi-infinite-affineness); [One-leg ULA special/generic comparison](#integral-family-comparison); `EDC:EDC.5/perverse-t-structure`; `EDC:EDC.5/perverse-recollement`; `EDS:E5:abstract/stable-infinity-category`; `EDS:E5:presentability/ind-completion`; `EDS:E5:presentability`; `mathlib:CategoryTheory.Triangulated.TStructure`; `AC:L3/full-faithfulness-27-2`; `AC:L3/commutation-and-adjoints-27-1-27-3`; `EDC:EDC.5`.

<a id="perverse-descent-and-shifted-ct"></a>

**Equivariant perverse descent and constant terms** (`perverseConstantTermExact`). Pullback of perverse Hecke objects to Gr is fully faithful. For A≤0 and B≥0 the derived Hom is connective. Shifted CT_B[deg⟨2ρ,−⟩] is t-exact and conservative, and the relative t-structure commutes with base change.

Hypotheses: Finite bounded charts and positive-loop equivariance; ordinary scheme perverse input is EDC.5, not EDC.7.

Proof: Use FS 7.3: for a connected cohomologically smooth map with section, H⁰Rf_*f*A→H⁰A is an isomorphism in the connective range.

**Sources:** [FS](#source-fs), VI.7.2–VI.7.4, pp. 216–219.

**Prerequisites:** [Relative perverse t-structure](#relative-perverse-t-structure); [Conservativity of constant terms](#constant-term-conservativity); [Finite truncation of bounded actions](#truncation-of-the-loop-action); `EDC:EDC.5/affine-perverse-artin-vanishing`; `AC:L3/rf-shriek-comparison-27-4`; [Affine semi-infinite intersections](#semi-infinite-affineness); `EDC:EDC.5`.

<a id="flat-perverse-objects"></a>

**Flat perverse objects** (`flatPerverse`). A perverse object A is coefficient-flat if A⊗^L_Λ M is perverse for every Λ-module M. Among ULA objects this is equivalent to shifted torus constant terms having finite projective fibres concentrated in degree zero. Flatness defines a full subcategory; it is not automatic for integral perverse objects.

Hypotheses: Prime-to-p torsion rings and compatible adic systems; the ordinary tensor test uses every module, not just Λ itself.

Proof: Use t-exact conservative shifted CT and its compatibility with derived coefficient tensors.

API:

- `flatPerverse_iff`: An object is flat perverse when it is in the heart and remains there after derived coefficient tensor with every R-module.
- `flatPerverse_module`: On the one-point torus, coefficient flatness is Module.Flat: tensoring any injective linear map stays injective.
- `flatPerverse_heart`: A flat-perverse object belongs to the Mathlib t-structure heart.

Tests:

- `flat_perverse_zero`: The zero object is flat perverse when coefficient tensors preserve zero.
- `flat_module_field`: Every vector space over a coefficient field is flat.
- `flat_module_integral_nonexample`: ℤ/2 is not flat over ℤ, despite concentration in degree zero.


**Sources:** [FS](#source-fs), VI.7.7, pp. 220–221.

**Prerequisites:** [Equivariant perverse descent and constant terms](#perverse-descent-and-shifted-ct); [ULA recognition by constant terms](#ula-constant-term-criterion); `mathlib:Module.Flat`; `mathlib:Module.Projective`; `mathlib:Module.Flat.iff_lTensor_preserves_injective_linearMapₛ`; `EDC:EDC.5`.

### Standard objects, torsion control and rational weights

Standard and costandard objects and their comparison map are integral constructions. Rational decomposition gives their late parity calculation and a uniform torsion exponent. Weight concentration retains the quasi-minuscule section-at-infinity contribution.

<a id="standard-costandard-objects"></a>

**Standard and costandard objects** (`standardCostandard`). For a one-leg μ-cell of dimension d_μ, Δ_μ=pH⁰j_{μ!}Λ[d_μ] and ∇_μ=pH⁰Rj_{μ*}Λ[d_μ]. These objects are ULA and flat perverse, commute with base/coefficients, and Verdier duality interchanges them with Tate twist d_μ. The canonical map Δ_μ→∇_μ is retained integrally.

Hypotheses: One-leg base, split model; IC has perverse normalization [d_μ], not [2d_μ].

Proof: Apply cell ULA calculus and perverse gluing.

API:

- `standardCostandard_formula`: The standard and costandard objects are perverse H⁰ of j-shriek and j-star of the shifted constant local system Λ[d], respectively.
- `standardCostandard_map`: Adjunction gives the standard-to-costandard map; its perverse image is the IC object.
- `standardCostandard_restriction`: Both restrict to the same normalized local system on the open cell.

Tests:

- `standard_zero_cell`: For identity inclusions and d=0, both objects are isomorphic to Λ via the zero-shift comparison.
- `standard_open_restriction`: The costandard object restricts to Λ[d] on its own cell.
- `standard_h0_normalization`: Δ=pH⁰j_!Λ[d]: shift before extension and perverse H⁰; ordinary unshifted H⁰ is incorrect.

**Sources:** [FS](#source-fs), VI.7.5 and VI.7.9, pp. 219–222.

**Prerequisites:** [Flat perversity](#flat-perverse-objects); [ULA recognition by constant terms](#ula-constant-term-criterion); [Relative perverse t-structure](#relative-perverse-t-structure); `EDC:EDC.5/affine-perverse-artin-vanishing`; [dual six-operation calculus](#supplier-calculus); `EDC:EDC.5`.

<a id="standard-costandard-torsion-bound"></a>

**Rational parity and integral torsion bounds** (`standardCostandardBoundedTorsion`). For fixed μ, Δ_μ→∇_μ is an isomorphism after rationalization, and over Z_ℓ its kernel and cokernel are killed by some ℓ^a uniformly under base change. The rational special-fibre equivariant perverse category is semisimple with simple IC_μ indexed by dominant coweights and constant equivariant local systems.

Hypotheses: Rational statement requires decomposition/parity and connected stabilizers; the integral category is not semisimple.

Proof: Import EDC.7’s rational proper direct-image decomposition and parity on Demazure generators.

Checks: The assertion does not set a=0 and does not make integral extensions split.

**Sources:** [FS](#source-fs), VI.7.5 end and proof, pp. 219–220; [Zhu](#source-zhu), Lemma 2.1 and its proof, printed pp. 429–430.

**Prerequisites:** [Standard and costandard objects](#standard-costandard-objects); `EDC:EDC.7/proper-direct-image-decomposition`; `RG:RG2.3`; [Perfect models and étale realization](#perfect-model-and-etale-comparison); `mathlib:PadicInt`.

<a id="rational-weight-concentration"></a>

**Rational special-fibre weights** (`rationalWeightsFinite`). For rational equivariant perverse A on the Witt Grassmannian, H_c^i(S_λ,A)=0 unless i=⟨2ρ,λ⟩. The resulting weight functors are exact. For μ minuscule the weight multiplicities are one at Weyl orbit weights; for quasi-minuscule μ the zero-weight multiplicity is the number of simple coroots of G in the Weyl orbit of the quasi-minuscule coweight (the short simple coroots); equivalently count the corresponding simple roots of the dual root system. General concentration follows by generation from minimal convolutions.

Hypotheses: k algebraically closed; rational coefficients only; CT normalization uses compact support.

Proof: Use Zhu 2.11’s minuscule flag and quasi-minuscule parahoric P¹ resolution; retain the section-at-infinity term missing in 2.2.13.

Checks: For the SL₃ highest root, the zero-weight dimension is two; the missing infinity contribution would give the wrong answer.

**Sources:** [Zhu](#source-zhu), 2.7 and 2.11–2.17, pp. 434, 436–440.

**Prerequisites:** [Affine semi-infinite intersections](#semi-infinite-affineness); [Affine flags and Demazure spaces over Spd O_C](#affine-flag-demazure); [Rational parity and integral torsion bounds](#standard-costandard-torsion-bound); `EDC:EDC.5/semismall-pushforward-perverse`; `RG:RG2.4`.


## GS2. Satake categories, convolution and rigidity

### The flat exact category and total cohomology

Intersect bounded ULA complexes with flat perversity. Total cohomology is finite projective and faithful, using the split-kernel argument as well as conservation. Its semi-infinite filtration need not split canonically.

<a id="satake-category-and-fibre-functor"></a>

**Satake category** (`satakeCategory`). Sat^I_G(S,Λ) is the full subcategory of the bounded-support Hecke derived category consisting of ULA, relative perverse, coefficient-flat objects. Equivariance is encoded by the Hecke stack. Pullback to Gr is fully faithful and the switch involution preserves the category. The category is additive and exact under sequences whose terms remain flat; it is not asserted to be abelian.

Hypotheses: Split integral or generic descended setting; all three conditions are required.

Proof: Intersect the ULA subcategory with the relative perverse heart and the all-module flatness condition.

API:

- `satakeCategory_full_subcategory`: Satake is the full subcategory of the supplied bounded ULA category whose underlying object is flat perverse.
- `satakeCategory_inclusion`: The full-subcategory inclusion forgets only the Satake flat-perverse condition and is fully faithful.
- `satakeCategory_morphisms`: A Satake morphism is the same underlying ULA morphism; no separate morphism condition is imposed.

Tests:

- `satake_zero`: A zero ULA object whose underlying object is zero belongs to Satake.
- `satake_inclusion_fully_faithful`: The inclusion is full and faithful, using Mathlib ObjectProperty.FullSubcategory morphisms.
- `satake_wrong_degree`: A ULA object outside the relative perverse heart is excluded from Satake.


**Sources:** [FS](#source-fs), VI.7.8–VI.7.9, pp. 221–222.

**Prerequisites:** [ULA Hecke complexes](#ula-sheaves-on-the-hecke-stack); [Flat perversity](#flat-perverse-objects); [Equivariant perverse descent and constant terms](#perverse-descent-and-shifted-ct); `mathlib:CategoryTheory.Triangulated.TStructure.Heart`; `mathlib:CategoryTheory.ObjectProperty.FullSubcategory`.

<a id="satake-fibre-functor"></a>

**Satake cohomology functor** (`satakeFibre`). F^I(A)=⊕_i H^iRπ_*(A|Gr^I_G) is a locally constant sheaf of finite projective Λ-modules on the leg base. It is exact, faithful and conservative on Satake objects. It has the semi-infinite filtration whose graded pieces are shifted constant terms; over a general base this does not yet give a canonical splitting or a switch-invariant tensor identification. If ker F(f)→F(A) is split, f:A→B has a kernel in Satake and F preserves it; if F(B)→coker F(f) is split, the analogous cokernel exists and is preserved. These split conditions are essential over integral coefficients and do not make Satake abelian.

Hypotheses: Bounded support; A Satake; locally constant finite projectivity is part of the result.

Proof: Use proper support, CT filtration and flat-perverse recognition. On each connected component of Gr_G, the shifted constant-term graded pieces of a Satake object are concentrated in degrees of the same parity. Hence the finite filtration spectral sequence degenerates. The graded cohomology modules are finite projective, so successive module extensions split locally and give finite-projective cohomology and exactness; this argument does not claim a canonical splitting. For a morphism with a split total-cohomology kernel, the constant-term filtration identifies its perverse kernel as ULA and flat; apply the split-kernel clause of VI.7.10, and its analogous split-cokernel clause. For F(f)=0 the kernel is all F(A), hence split: conservation makes the kernel map an isomorphism, proving f=0 and faithfulness. Keep the filtration until GS3 tensor comparison.

For the algebraic direct-sum interface, specify a finite set of cohomological degrees, zero modules outside it, and finite projectivity in each degree. Specify joint faithfulness of the degreewise functors to deduce faithfulness of their sum. The geometric argument above proves these inputs for Satake objects; neither conclusion holds for an arbitrary family of module-valued functors.

API:

- `satakeFibre_cohomology`: The fibre at A is the direct sum of all integer-degree cohomology modules; bounded support makes only finitely many degrees nonzero.
- `satakeFibre_finite_projective`: The total cohomology module is finite and projective over the coefficient ring.
- `satakeFibre_faithful`: FS VI.7.10’s split-kernel lifting together with conservativity proves faithfulness; do not infer faithfulness from conservativity alone in an exact category.
- `satakeFibre_kernel`: If ker F(f)→F(A) is a split inclusion, f has a Satake kernel and F carries its universal cone to the module kernel.
- `satakeFibre_cokernel`: If F(B)→coker F(f) is a split projection, f has a Satake cokernel and F carries its universal cocone to the module cokernel.

Tests:

- `fibre_torus_rank_one`: A torus skyscraper with one rank-one cohomology module has total cohomology R.
- `fibre_zero`: If all cohomology modules vanish, total cohomology is the zero module.
- `fibre_existing_module`: Finite projective total cohomology uses ModuleCat and Module.Projective.
- `fibre_unbounded_nonexample`: One ℚ in every integer degree has infinite-dimensional direct sum despite degreewise finite projectivity.


**Sources:** [FS](#source-fs), VI.7.10–VI.7.11, pp. 222–223.

**Prerequisites:** [Satake category](#satake-category-and-fibre-functor); [Conservativity of constant terms](#constant-term-conservativity); [Flat perversity](#flat-perverse-objects); [proper pushforward calculus](#supplier-calculus); `DSO:S2/projection-formula`; `mathlib:Module.Projective`; `AC:L0/rational-constructible-coefficients`; `mathlib:Module.Finite`; `EDC:EDC.5`.

<a id="satake-verdier-duality"></a>

**Verdier duality of Satake objects** (`satakeVerdierBiduality`). Relative Verdier duality preserves Satake, the biduality map A→D(D(A)) is an isomorphism, and F(D(A)) identifies with the Λ-linear dual of F(A). Normalized Levi constant terms CT_P[deg⟨2ρ_G−2ρ_M,−⟩] preserve Satake and are transitive for nested Levis.

Hypotheses: ULA, flat perverse and bounded proper support; the normalization depends on the chosen parabolic.

Proof: Use ULA dualizability and biduality from VS1.

**Sources:** [FS](#source-fs), VI.7.12–VI.7.13, pp. 223–224.

**Prerequisites:** [Cohomology](#satake-fibre-functor); [Flat perversity](#flat-perverse-objects); `VS:VS1`; `VS:VS1/ula-for-artin-v-stacks`; [dual six-operation calculus](#supplier-calculus); `RG:RG2.1`; `VS:VS1/ula-dualizability-criterion`; `VS:VS1/hyperbolic-base-change-duality-and-ula`; `VS:VS1/ula-relative-adjoints-and-calculus`.

### Proper correspondences and rational semismallness

Convolution descends the twisted external product through the intermediate torsor. Common higher-step modification stacks supply coherent associativity and units. Rational semismallness is stated on bounded Witt convolution spaces.

<a id="convolution-diagram"></a>

**Ambient Hecke convolution** (`heckeConvolution`). The two-step Hecke stack has maps a:Hck×^{L⁺G}Hck→Hck×Hck (an L⁺G-torsor) and b to Hck (composition of modifications). On bounded support b is ind-proper with proper finite bounds. Define A⋆B=Rb_*a*(A⊠B), equivalently Rb_! for those bounds. Composition in the enhanced correspondence 2-category and Ind-extension give a coherent ambient monoidal structure with the unit supported on the trivial modification.

Hypotheses: Use the stack quotient, not a naive product; derived external tensor over Λ; bounds required for pushforward. General correspondence coherence is supplied by EDS and VS0.

Proof: Build the stack of three torsors and two punctured isomorphisms; multiplication composes them.

API:

- `heckeConvolution_obj`: A⋆B is b-star of a-pullback of the derived external product of A and B, with b proper on the chosen bounds.
- `heckeConvolution_associator`: The coherent correspondence calculus supplies the associator for convolution.
- `heckeConvolution_unit`: The unit is the identity-modification kernel and its left and right unit maps are isomorphisms.
- `torusConvolutionLabels`: On a torus, convolution support is the Minkowski sum of the two finite coweight supports.

Tests:

- `convolution_unit`: Convolving with the identity kernel returns the other kernel.
- `convolution_torus_labels`: For a torus, two skyscraper labels convolve to the skyscraper at their sum.
- `convolution_twisted_diagram`: A⋆B=b_*a*(A⊠B); omitting either a* or b_* fails this formula.

**Sources:** [FS](#source-fs), VI.8 opening, pp. 224–225.

**Prerequisites:** [Satake category](#satake-category-and-fibre-functor); [Local Hecke stack](#local-hecke-stack); [Integral bounded Grassmannian families](#integral-family-bounded-properness); [Relative-position flag correspondences](#flag-incidence-correspondences); [dual six-operation calculus](#supplier-calculus); [proper pushforward calculus](#supplier-calculus); `DSO:S2/projection-formula`; `VS:VS0/artin-v-stack-definition`; `EDS:E5:presentability/universal-property-of-ind`; `EDS:E3`; `VS:VS0`; `DSO:S2/exchange-pasting-coherence`.

<a id="convolution-associativity-and-unit"></a>

**Associativity and unit of convolution** (`convolutionPentagon`). Iterated composition supplies associator (A⋆B)⋆C≅A⋆(B⋆C), left/right unit isomorphisms, and the pentagon and triangle identities in the ambient bounded-support category, compatible with coefficient and base change when the six operations are defined.

Hypotheses: Enhanced coherence, rather than equality of iterated objects; proper finite bounds and derived tensors.

Proof: Use the common three-step Hecke stack and proper base-change/projection-formula isomorphisms.

**Sources:** [FS](#source-fs), VI.8 opening, pp. 224–225.

**Prerequisites:** [Ambient Hecke convolution](#convolution-diagram); `EDS:E3`; [dual six-operation calculus](#supplier-calculus); `DSO:S2/exchange-pasting-coherence`; `VS:VS0`.

<a id="rational-special-fibre-convolution"></a>

**Rational Witt convolution and semismallness** (`rationalConvolutionSemismall`). On the rational Witt special fibre, the n-fold unbounded convolution Grassmannian is identified with Gr^n by cumulative modifications, but a bounded convolution locus is a twisted product. The bounded multiplication map to Gr_{≤Σμ_i} is proper and stratified semismall: over the λ-stratum fibre dimension is ≤⟨ρ,Σμ_i−λ⟩. Hence twisted convolution of rational equivariant perverse sheaves is perverse.

Hypotheses: k algebraically closed; dominant bounds; rational coefficients; no integral coefficient-flatness inferred from this statement.

Proof: Use the lattice-chain Demazure and bounded proper map.

Checks: For minuscule one-step bounds, twisted convolution still need not be the product of the two flag varieties.

**Sources:** [Zhu](#source-zhu), 2.1.2 and 2.2–2.4, pp. 431–432.

**Prerequisites:** [Ambient Hecke convolution](#convolution-diagram); [Rational special-fibre weights](#rational-weight-concentration); [Witt Demazure filtration space](#witt-demazure-resolution); `EDC:EDC.5/semismall-pushforward-perverse`; `AC:L3/rf-shriek-comparison-27-4`.

### Perverse closure, duals and one-leg comparison

ULA preservation and elementary two-leg collision estimates prove convolution closure before symmetric fusion. Relative kernel adjunction then gives both duals. The one-leg fibre equivalence respects these actual correspondences.

<a id="convolution-ula"></a>

**ULA preservation by convolution** (`convolutionULAKernelDual`). If A and B are ULA bounded Hecke complexes, A⋆B is ULA over the leg base.

Hypotheses: Finite proper bounds; derived tensor; split and generic descended versions.

Proof: Use the VS1 ULA criterion as adjointability of kernels, including the proper-relative IV.2.24 variant.

**Sources:** [FS](#source-fs), VI.8.1(i), p. 225.

**Prerequisites:** [Ambient Hecke convolution](#convolution-diagram); `VS:VS1/ula-for-artin-v-stacks`; `VS:VS1`; [dual six-operation calculus](#supplier-calculus); [proper pushforward calculus](#supplier-calculus); `DSO:S2/projection-formula`; `VS:VS1/kernel-correspondence-category`; `VS:VS1/ula-relative-adjoints-and-calculus`.

<a id="convolution-perverse-nonpositive"></a>

**Nonpositive perverse convolution** (`convolutionPerverseNonpositive`). For any bounded Hecke complexes A,B in relative perverse degrees ≤0, A⋆B is perverse ≤0. First reduce by ordered collision-stratum excision and cell devissage to shifted cell constants with ULA factors. For those generators an elementary two-leg family is an external product away from the diagonal; locally constant perfect torus constant terms carry the nonpositive bound to the collision fibre. This is FS VI.8.1(ii), before VI.9 symmetric fusion.

Hypotheses: Coefficient derived tensor and correct cell dimensions; this elementary family is distinct from the coherent symmetric fusion construction of VI.9.

Proof: Use ordered legs, partial-diagonal excision and the defining cell inequalities to reduce the arbitrary bounded inputs to shifted cell constants. Their one-leg ULA property is supplied by VI.6.5.

Checks: A collision is tested by summed cocharacters; the proof has a geometric family but not a symmetric monoidal Satake theorem.

**Sources:** [FS](#source-fs), VI.8.1(ii), pp. 225–226.

**Prerequisites:** [ULA preservation by convolution](#convolution-ula); [Equivariant perverse descent and constant terms](#perverse-descent-and-shifted-ct); [Ordered legs and divisor base change](#ordered-leg-base-change); [Integral bounded Grassmannian families](#integral-family-bounded-properness); [ULA Hecke complexes](#ula-sheaves-on-the-hecke-stack); [ULA recognition by constant terms](#ula-constant-term-criterion).

<a id="convolution-preserves-satake-and-dualizability"></a>

**Closure of Satake under convolution** (`convolutionFlatPerverse`). Convolution of two Satake objects is Satake: it remains ULA, relative perverse and coefficient-flat. Derived tensors against arbitrary coefficient modules remain perverse, so the operation restricts to the flat subcategory.

Hypotheses: All Satake conditions retained; coefficients need not be fields.

Proof: ULA follows from VI.8.1(i). Apply the nonpositive result to A,B and their relative Verdier duals.

**Sources:** [FS](#source-fs), VI.8.1(iii), pp. 225–226.

**Prerequisites:** [ULA preservation by convolution](#convolution-ula); [Nonpositive perverse convolution](#convolution-perverse-nonpositive); [Verdier duality of Satake objects](#satake-verdier-duality); [Flat perversity](#flat-perverse-objects).

<a id="satake-rigidity"></a>

**Duals of Satake objects** (`satakeRigid`). Every Satake object has both left and right duals for convolution. The right dual is sw*D(A); evaluation and coevaluation come from the adjunction of proper relative ULA kernels and satisfy the two triangle identities. Switching gives the other dual.

Hypotheses: Proper bounded support; ULA; use both left and right rigid structures in the library. No symmetry or fibre-functor monoidality is assumed.

Proof: Apply FS IV.2.24 to the bounded Hecke kernel, using the proper target.

**Sources:** [FS](#source-fs), VI.8.2, p. 226; IV.2.24, pp. 125–126.

**Prerequisites:** [Closure of Satake under convolution](#convolution-preserves-satake-and-dualizability); [Verdier duality of Satake objects](#satake-verdier-duality); `VS:VS1`; `mathlib:CategoryTheory.RigidCategory`; `VS:VS1/kernel-correspondence-category`; `VS:VS1/ula-relative-adjoints-and-calculus`.

<a id="one-leg-satake-comparison"></a>

**One-leg Satake equivalence** (`oneLegSatakeComparison`). The one-leg ULA restriction equivalence over Spd O_C restricts to equivalences of flat-perverse Satake categories on the generic and Witt special fibres. The functors commute with coefficient change, finite bounds and bounded convolution diagrams and carry the unit and the convolution duals to their corresponding objects.

Hypotheses: Split integral model; chosen C and k̄; the comparison is not asserted for arbitrary multi-leg collision ULA categories.

Proof: Use t-exact base change and the all-module tensor criterion on the ULA equivalence.

**Sources:** [FS](#source-fs), VI.6.7, VI.7.4–VI.7.8 and VI.8, pp. 214, 217–226.

**Prerequisites:** [One-leg ULA special/generic comparison](#integral-family-comparison); [Equivariant perverse descent and constant terms](#perverse-descent-and-shifted-ct); [Duals of Satake objects](#satake-rigidity); [Associativity and unit of convolution](#convolution-associativity-and-unit); `AC:L3/rf-shriek-comparison-27-4`; `AC:L3/full-faithfulness-27-2`; `AC:L3/commutation-and-adjoints-27-1-27-3`.


## GS3. Fusion and symmetric tensor structure

The following standing hypotheses apply throughout GS3 and GS4. E is a nonarchimedean local field with residue field F_q of characteristic p; G/E is connected reductive. For torsion coefficients Λ is killed by an integer prime to p. The ℓ-adic extension uses a fixed prime ℓ ≠ p and its compatible reductions. Satake objects have bounded support, are universally locally acyclic over the leg base, and are flat perverse; representation objects have finite projective coefficient modules.

### Disjoint blocks, extension and the parity sign

Restriction away from cross-block collisions is fully faithful on the stated categories. This determines fusion comparisons uniquely, while the component parity corrects the graded cohomological flip.

<a id="disjoint-leg-locus"></a>

**Disjoint-leg locus** (`disjointLegLocus`). For a finite set I partitioned by b:I→K, define U_b ⊂ (Div¹_X)^I by x_i ≠ x_j whenever b(i) ≠ b(j). It allows coincidences inside one block. Pull the existing local Hecke stack and Satake category back to U_b; denote restriction by j_b*. On U_b, completion along the union of block divisors is the product of the block completions, giving the factorization of Grassmannians and local Hecke stacks.

Proof: Use the divisor product equation and invertibility of distinct divisor ideals to split the completed rings, then the loop quotient and torsor descriptions.

API:

- `disjointLegLocus`: For b:I→K and X=Div¹_X, U_b is the subfunctor of X^I satisfying the cross-block inequality.
- `disjointLegLocus_mem`: A geometric tuple x lies in U_b iff b(i)≠b(j) implies x_i≠x_j for all i,j.
- `disjointLegLocus_reindex`: A bijection of leg sets carries U_b to U_{b∘e}, compatibly with identity and composition.
- `disjointLegLocus_baseChange`: Pullback of U_b under S→(Div¹_X)^I is precisely the same cross-block condition on S.

Tests:

- `test_disjoint_oneBlock`: A constant block map gives U_b=X^I.
- `test_disjoint_twoSingletons`: For two singleton blocks, U_b={(x,y):x≠y}.
- `test_disjoint_internalCollision`: For blocks {1,2},{3}, (x,x,y) with x≠y is allowed.


**Sources:** [FS](#source-fs), VI.9 pp226–227; VI.0 p189.

**Prerequisites:** `RF:RF2:integral-divisors/product-equation-and-affineness`; `RF:RF2:untilts/div1-moduli-and-properness`; [Loop spaces](#loop-groups-and-local-hecke); [Ordered legs and divisor base change](#ordered-leg-base-change); [Local Hecke stack](#local-hecke-stack).

<a id="disjoint-leg-factorization-and-full-faithfulness"></a>

**Restriction across collision diagonals** (`restriction_fullyFaithful`). For the blockwise disjoint inclusion j_b, restriction j_b*:Sat^I_G(Λ)→Sat_G(U_b,Λ) is fully faithful, and so is restriction of finite projective local systems on the leg base. Every Satake object satisfies A ≅ pH⁰(Rj_b*j_b*A). This is uniqueness and reconstruction for objects already extending; full faithfulness alone asserts no essential surjectivity.

Proof: Filter the complement by smooth partial diagonals of positive ℓ-codimension. Purity makes their i*i! on locally constant perfect complexes lie in degrees ≥2.

Checks: For two legs the diagonal has codimension one and contributes starting in degree two. A codimension-zero closed component would invalidate the argument; arbitrary restrictions of arbitrary categories are not fully faithful.

**Sources:** [FS](#source-fs), Proposition VI.9.3 pp227–228.

**Prerequisites:** [Disjoint-leg locus](#disjoint-leg-locus); [Relative perverse t-structure](#relative-perverse-t-structure); [Semi-infinite strata and constant terms](#semi-infinite-orbits-and-hyperbolic-localization); [Satake category](#satake-category-and-fibre-functor); `VS:VS1`; [Equivariant perverse descent and constant terms](#perverse-descent-and-shifted-ct).

<a id="support-parity"></a>

**Satake support parity** (`supportParity`). The parity of a Schubert tuple μ• is ε(μ•)=Σ_i⟨2ρ,μ_i⟩ mod 2 in Z/2. Differences along dominance are sums of coroots, whose pairing with 2ρ is even, so parity is constant on a connected-component stratum and defines an open-and-closed even/odd decomposition of the local Hecke stack. For mixed-parity objects use their canonical summands. The correction scalar for homogeneous A,B is (-1)^{ε(A)ε(B)}.

Proof: Use ⟨2ρ,α∨⟩=2 for each simple coroot and dominance differences to prove constancy on closure relations.

API:

- `supportParity`: The degree sum reduced modulo two, equivalently the dimension parity on each component.
- `supportParity_dominance`: Comparable dominant Schubert tuples have equal parity.
- `supportParity_union`: Parity on a disjoint union is the sum of the two parities in Z/2.
- `fusionSign`: For e,f∈Z/2, the correction is (-1)^{ef}; it is a bicharacter.

Tests:

- `test_parity_unit`: The zero-cocharacter unit has parity zero.
- `test_sign_oddOdd`: The correction on two odd summands is -1.
- `test_sign_evenOdd`: Even/odd correction is +1; in characteristic two the two signs coincide.


**Sources:** [FS](#source-fs), VI.9 pp228–229.

**Prerequisites:** `RG:RG2.5`; [Generic Schubert bounds](#schubert-bounds-and-properness); `mathlib:RootPairing`.

<a id="fusion-product-and-sign-rule"></a>

**Fusion product and ordinary symmetry** (`fusionProduct`). For blocks I=⊔_a I_a and A_a∈Sat^{I_a}_G(Λ), use the chain of modifications E_0→⋯→E_k, projections p_a to the a-th modification and composition m. Define the fusion object *_{a}A_a=Rm_*(⊗_a p_a*A_a). The construction is ULA, bounded and flat perverse and restricts to ⊠_a A_a on U_b. It is independent of the order by full faithfulness. Pull back along the duplicated-leg diagonal to obtain the tensor product on Sat^I. Modify its geometric commutativity by (-1)^{ε(A)ε(B)}. This gives a symmetric monoidal structure refining the existing convolution, with total cohomology F^I strong symmetric monoidal into ordinary, ungraded finite projective Weil representations.

Proof: Construct the proper chain-composition correspondence, whose restriction to disjoint blocks is an isomorphism. ULA stability comes from the IV.2 correspondence criterion. Apply constant terms: their total pushforward is locally constant perfect and agrees on the disjoint locus with the degree-zero finite-projective exterior product. Density and VI.7.7 imply flat perversity. Use VI.9.3 for uniqueness of associativity, commutativity and unit comparisons; all relations hold after disjoint restriction. Total cohomology carries the geometric flip to the graded Koszul flip. The component correction cancels that sign and preserves hexagon, involution and unit laws.

API:

- `fusionProduct`: The proper chain-composition pushforward for a finite ordered partition.
- `fusionProduct_restrict`: Its restriction to U_b is canonically the exterior tensor product.
- `fusionTensor`: Duplicate legs and diagonal pullback give the internal tensor, canonically isomorphic to convolution.
- `fusionBraiding`: Geometric block permutation multiplied on homogeneous summands by (-1)^{ε(A)ε(B)}.
- `fibreFusionIso`: F(A*B) ≅ F(A)⊗F(B), respecting the ordinary symmetry, unit and associativity constraints.

Tests:

- `test_fusion_unit`: Fusion with the unit is isomorphic to the original object.
- `test_fusion_disjoint`: On distinct divisors fusion is the exterior product, with no diagonal extension summand.
- `test_fusion_oddSymmetry`: On odd/odd objects F sends corrected braiding to the ordinary flip; uncorrected braiding is its negative if 2 is invertible.


**Sources:** [FS](#source-fs), Definition/Proposition VI.9.4 pp228–230.

**Prerequisites:** [Restriction across collision diagonals](#disjoint-leg-factorization-and-full-faithfulness); [Satake support parity](#support-parity); [Ambient Hecke convolution](#convolution-diagram); [Closure of Satake under convolution](#convolution-preserves-satake-and-dualizability); `VS:VS1/ula-dualizability-criterion`; [Satake category](#satake-category-and-fibre-functor); `mathlib:CategoryTheory.SymmetricCategory`; `mathlib:CategoryTheory.Functor.Braided`; [Cohomology](#satake-fibre-functor); [Associativity and unit of convolution](#convolution-associativity-and-unit).

### Finite sets, Weil realization and duality

Collision maps merge fibres of finite sets and insert units for empty fibres. The closed immersion used for pull–push is on Grassmannians, not quotient Hecke stacks. Drinfeld realization applies to locally constant perfect complexes and specializes to continuous finite-projective Weil representations.

<a id="finite-set-functoriality-and-constant-terms"></a>

**CoCartesian finite-set functoriality** (`collisionFunctor`). For a map α:I→J, let Δ_α:(Div¹)^J→(Div¹)^I repeat the j-th divisor on its inverse-image block. Pull back along Gr^I_G ×_(Div¹)^I (Div¹)^J → Gr^I_G and push forward along the natural closed immersion Gr^I_G ×_(Div¹)^I (Div¹)^J ↪ Gr^J_G. Descending the required loop equivariance defines α_!:Sat^I→Sat^J; the closed immersion is on Grassmannians, not on quotient Hecke stacks. This merges each fibre of α and inserts unit modifications at empty fibres. For permutations it relabels legs, and for disjoint unions it respects exterior fusion. Canonical identity and composition comparisons satisfy the finite-set coherence relations. Together with exterior fusion they give the coCartesian family of symmetric monoidal Satake categories over finite sets.

Proof: Use the diagonal base-change square and its closed Grassmannian immersion to define pull-push, check loop equivariance and descend to the Satake categories. Directly check compositional base change; do not replace this diagram by a closed immersion of quotient Hecke stacks. Compare composite collision orders on the locus of distinct relevant divisors and use VI.9.3 to extend the comparison uniquely. Every coherence diagram reduces to the same disjoint-locus permutation/composition identity; include empty fibres with the unit. Use the imported operadic language to package these comparisons.

API:

- `collisionFunctor`: The functor α_! associated to any map α:I→J, including empty fibres.
- `collisionFunctor_id`: The identity-map functor is canonically isomorphic to identity.
- `collisionFunctor_comp`: (β∘α)_! ≅ α_! followed by β_!, with coherent associativity.
- `collisionFunctor_comp_assoc`: For I→J→K→L, the two composition comparisons from the composite functor to the iterated functors agree after the functor associator; retain the full enhanced finite-set coherence.
- `collisionFunctor_union`: Disjoint union of maps commutes with exterior fusion, including its corrected permutations.
- `collisionFunctor_unitInsertion`: An unused target leg is assigned the zero-modification tensor unit.

Tests:

- `test_collision_threeLegs`: The two successive three-leg merging orders have the canonical associativity comparison and commuting pentagon.
- `test_collision_permutation`: A transposition composed with itself gives the identity comparison.
- `test_collision_emptyFibre`: ∅→{1} sends the coefficient unit to the zero modification.


**Sources:** [FS](#source-fs), VI.9 pp226–227, including the footnote p227; Proposition VI.9.4 pp228–229.

**Prerequisites:** [Fusion product and ordinary symmetry](#fusion-product-and-sign-rule); [Restriction across collision diagonals](#disjoint-leg-factorization-and-full-faithfulness); `RF:RF2:integral-divisors/product-equation-and-affineness`; `EDS:E5:abstract/symmetric-monoidal-infinity-category`; [Loop spaces](#loop-groups-and-local-hecke); [Ordered legs and divisor base change](#ordered-leg-base-change); [Beilinson–Drinfeld Grassmannian](#grassmannian).

<a id="drinfeld-fibre-realization"></a>

**Weil realization of total cohomology** (`drinfeldFibreRealization`). For every finite I, finite projective local systems on (Div¹_X)^I are equivalent to continuous finite projective Λ-representations of W_E^I. Under this equivalence F^I is total cohomology on the Grassmannian over its leg base. It is faithful and conservative and has the inherited split-exact behaviour of VI.7.10, is symmetric monoidal for corrected fusion, and has the collision/permutation coherences. The Drinfeld statement is for locally constant perfect complexes, not all étale complexes or an assertion that fundamental groups commute with products.

Proof: Import IV.7.3 in its DLc form. Restrict to finite-projective local systems in degree zero to obtain VI.9.2.

Checks: For I=∅ the target is finite projective Λ-modules. For singleton I the action is the local Weil action, and for multiple legs the source is W_E^I, not its diagonal copy.

**Sources:** [FS](#source-fs), Proposition VI.9.2 p226; Proposition IV.7.3 pp165–166 (full faithfulness begins p164).

**Prerequisites:** [Satake category](#satake-category-and-fibre-functor); [Fusion product and ordinary symmetry](#fusion-product-and-sign-rule); [CoCartesian finite-set functoriality](#finite-set-functoriality-and-constant-terms); `VS:VS1`; `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-9-the-local-weil-group`; `RF:RF2:untilts/div1-moduli-and-properness`; `mathlib:Representation`; `mathlib:Module.Projective`; [Cohomology](#satake-fibre-functor).

<a id="symmetric-constant-term"></a>

**Symmetric constant terms** (`constantTermFusionIso`). For a parabolic P with Levi M, CT_P[deg_P]:Sat^I_G(Λ)→Sat^I_M(Λ) is symmetric monoidal for corrected fusion, commutes with F^I, and is transitive for nested parabolics with the sum of the degree shifts. It respects arbitrary finite-set collision functors, disjoint unions and permutations, with identity, composition and transitivity coherences. The degree is componentwise ⟨2ρ_G−2ρ_M,μ⟩; omission of it changes the weight degrees.

Proof: Use VI.7.13 for landing, degrees and transitivity. Off the collision diagonals the assertion is Künneth and blockwise hyperbolic localization.

**Sources:** [FS](#source-fs), Proposition VI.9.6 p230; VI.7.13 pp223–224; [Zhu](#source-zhu), Proposition 2.36 and the following paragraph, p454.

**Prerequisites:** [Semi-infinite strata and constant terms](#semi-infinite-orbits-and-hyperbolic-localization); [Satake category](#satake-category-and-fibre-functor); [Fusion product and ordinary symmetry](#fusion-product-and-sign-rule); [CoCartesian finite-set functoriality](#finite-set-functoriality-and-constant-terms); [Restriction across collision diagonals](#disjoint-leg-factorization-and-full-faithfulness); `RG:RG2.5`; [Verdier duality of Satake objects](#satake-verdier-duality); [Cohomology](#satake-fibre-functor).

<a id="fusion-verdier-duality"></a>

**Fusion and Verdier duality** (`fusionVerdierComparison`). The inversion/reversal sw* is symmetric monoidal for fusion and F^I sw* ≅ F^I. Verdier duality D is a contravariant symmetric monoidal involution, D sw* ≅ sw* D and F^I D ≅ (F^I)^∨. The internal tensor dual of A is sw*D(A). These identifications retain their evaluation, coevaluation and finite-set coherence data; sw* itself need not be identity.

Proof: VI.8.2 supplies convolution duals before fusion; VI.7.12 supplies F(D A)=F(A)^∨.

Checks: A torus weight μ is inverted by sw* and internal dual, with the corresponding dual local system. The PGL2 minuscule case distinguishes a symmetric Verdier pairing from the alternating SL2 pairing used in VI.12.

**Sources:** [FS](#source-fs), Corollary VI.9.5 pp229–230; VI.8.2 pp225–226.

**Prerequisites:** [Fusion product and ordinary symmetry](#fusion-product-and-sign-rule); [Closure of Satake under convolution](#convolution-preserves-satake-and-dualizability); [Satake category](#satake-category-and-fibre-functor); `mathlib:CategoryTheory.LeftRigidCategory`; [Verdier duality of Satake objects](#satake-verdier-duality); [Duals of Satake objects](#satake-rigidity).


## GS4. Reconstruction and generic reductivity

### Bounded representability and the coordinate Hopf algebra

Verify bounded adjunctions and all three F-split coequalizer conditions, then apply the MC.6 reconstruction theorem. Dualize the fibre of each bounded generator before forming the filtered coordinate coalgebra. Coefficient limits and tensor products must preserve its Hopf operations.

<a id="tannakian-left-adjoint"></a>

**Bounded left adjoints** (`boundedLeftAdjoint`). Let W_i⊂X_*(T)^+ be a finite downward-closed Galois-stable bound for each leg and C_W⊂Sat^I its full bounded-support category. The restriction F_W:C_W→Rep_{W_E^I}^{fp}(Λ) has a left adjoint L_W. Put X_W=L_W(1). For each finite projective Weil representation V, L_W(V)≅X_W⊗V (the LocSys action), naturally in V and the bounds. For product bounds, X_{W•} is the fusion product of the singleton X_{W_i}. These are Satake generators, not their dual coordinate coalgebras.

Proof: Reduce to Λ killed by ℓ^c and single-leg bounds using fusion. On the perverse category apply the adjoint functor theorem to total cohomology.

API:

- `boundedLeftAdjoint`: The functor L_W left adjoint to F_W.
- `boundedLeftAdjunction`: Hom(L_W V,A) ≅ Hom(V,F_W A), naturally in V and A, with triangle identities.
- `boundedGenerator`: X_W=L_W(1) in the bounded Satake category.
- `boundedLeftAdjoint_tensor`: L_W(V) ≅ X_W⊗V, coherently for the LocSys action.
- `boundedGenerator_fusion`: For product bounds the generator is the fusion of singleton generators.
- `boundedGenerator_enlarge`: For W⊂W′, representability gives X_W′→X_W after the bounded objects are included in Satake. The dual fibre map is (F X_W)^∨→(F X_W′)^∨, the forward arrow in the coordinate-coalgebra diagram.

Tests:

- `test_generator_zeroBound`: For a bound containing only weight zero, the generator is the unit with fibre Λ.
- `test_generator_productBound`: Singleton generators fuse to the product-bound generator, preserving adjunction maps.
- `test_generator_dualOrientation`: H_W=(F_W X_W)∨. For W⊂W′, H_W→H_W′ is dual to X_W′→X_W.

**Sources:** [FS](#source-fs), Proposition VI.10.1 pp230–232.

**Prerequisites:** [Weil realization of total cohomology](#drinfeld-fibre-realization); [Satake category](#satake-category-and-fibre-functor); [Fusion product and ordinary symmetry](#fusion-product-and-sign-rule); [Generic Schubert bounds](#schubert-bounds-and-properness); `EDS:E5:presentability/presentable-categories`; `mathlib:CategoryTheory.Adjunction`; [Standard and costandard objects](#standard-costandard-objects); [Rational parity and integral torsion bounds](#standard-costandard-torsion-bound); [Cohomology](#satake-fibre-functor).

<a id="relative-tannaka-hypotheses"></a>

**Relative Tannaka hypotheses for Satake** (`relativeTannakaHypotheses`). With A=Rep_{W_E^I}^{fp}(Λ), C=Sat^I_G(Λ), corrected tensor and F^I, verify the hypotheses of MC.6 relative reconstruction: A is rigid symmetric, C is symmetric A-linear, F is strong symmetric A-linear and conservative, C admits coequalizers of F-split pairs and F reflects and preserves these coequalizers, and bounded full subcategories form a filtered cover stable under the A-action and those coequalizers, with restricted F represented by X_W. Sat^I over a general ring is not asserted to be an abelian category.

Proof: F-split diagrams are split after total cohomology. VI.7.10 constructs the relevant kernel/cokernel Satake objects when fibres split or are direct summands, so their coequalizers remain flat perverse and their fibres give the split quotient. Bounds remain bounded under those coequalizers and the LocSys action; enlargement makes the cover filtered. Apply the bounded adjunction to produce the finite-piece monad. Check preservation as well as reflection for the executable MC adapter; the source leaves preservation implicit, so preservation is a separate proof obligation.

Checks: The relative base A retains all Weil local systems; it is not replaced by Vect or assumed semisimple. A nonsplit exact sequence of finite projective coefficient modules is not treated as an unrestricted cokernel construction in Satake.

**Sources:** [FS](#source-fs), VI.10.2–10.3 pp232–235; VI.7.10 pp222–223.

**Prerequisites:** [Bounded left adjoints](#tannakian-left-adjoint); [Fusion product and ordinary symmetry](#fusion-product-and-sign-rule); [Fusion and Verdier duality](#fusion-verdier-duality); [Satake category](#satake-category-and-fibre-functor); [Closure of Satake under convolution](#convolution-preserves-satake-and-dualizability); `MC:MC.6/relative-finite-piece-reconstruction`; `MC:MC.6/relative-coalgebra-assembly`; `MC:MC.6/relative-bialgebra-reconstruction`; `MC:MC.6/relative-rigid-antipode`; `mathlib:CategoryTheory.Monad.HasCoequalizerOfIsSplitPair`; `mathlib:CategoryTheory.Monad.PreservesColimitOfIsSplitPair`; `mathlib:CategoryTheory.Monad.ReflectsColimitOfIsSplitPair`; [Cohomology](#satake-fibre-functor).

<a id="geometric-coordinate-hopf-algebra"></a>

**Geometric Satake coordinate Hopf algebra** (`satakeCoordinateHopf`). Apply the imported MC.6 relative reconstruction to Satake. In Ind(A), define H^I_Λ=colim_W (F_W X_W)^∨. It has a canonical commutative bialgebra structure from tensor products and an antipode from Satake rigidity. The comparison is a symmetric equivalence Sat^I_G(Λ)≃Comod_{A,underlying A}(H^I_Λ). Forgetting W_E^I gives an ordinary flat coordinate Hopf algebra and hence an affine flat group scheme G^∨,I_Λ. This reconstructs H from the Satake category; the baseline known-Hopf tensorAutFunctor is only a compatibility comparison once H is constructed.

Proof: Use the four exact MC.6 results for finite-piece reconstruction, filtered coalgebra assembly, multiplication and antipode. Their abstract constructions belong to MC.6. Each dual fibre is finite projective; its filtered colimit is flat. Tensor compatibility yields commutativity and unit/counit; rigidity supplies the antipode equations. The comparison restricts to comodules whose underlying object lies in A, precisely retaining finite projectivity and continuous Weil action. Compare with the existing known-Hopf reconstruction only after extending to a field where its hypotheses hold. Apply the corrected VI.10.2 wording: obtain a bialgebra first, then an antipode on H under rigidity; do not apply an inverse to the base category A.

API:

- `satakeCoordinateHopf`: H^I_Λ is the filtered colimit of dual bounded-generator fibres, with its commutative Hopf structure.
- `satakeCoaction`: Every A has its functorial H-coaction on F^I(A).
- `satakeComoduleEquivalence`: The comparison is a symmetric equivalence with H-comodules whose underlying object is in A.
- `satakeCoordinateHopf_tensor`: Tensor of coactions uses the Hopf multiplication, and the unit coaction uses its unit.
- `satakeCoordinateHopf_antipode`: The coaction on the internal dual is obtained using the antipode; both antipode identities hold.

Tests:

- `test_hopf_trivialGroup`: For the trivial G, H=Λ and the geometric affine group is the trivial group.
- `test_hopf_torus`: For split T, H=Λ[X_*(T)], with Δ(e^μ)=e^μ⊗e^μ and counit(e^μ)=1.
- `test_hopf_torusAntipode`: e^μ maps to e^(−μ); identity fails for nonzero G_m weights.


**Sources:** [FS](#source-fs), Propositions VI.10.2–VI.10.3 pp232–235.

**Prerequisites:** [Relative Tannaka hypotheses for Satake](#relative-tannaka-hypotheses); `MC:MC.6/relative-coalgebra-assembly`; `MC:MC.6/relative-bialgebra-reconstruction`; `MC:MC.6/relative-rigid-antipode`; `EDS:E5:presentability/ind-completion`; `mathlib:HopfAlgebra`; `mathlib:Bialgebra`; `tauceti:TauCeti.AffineGroupSchemeCat`; `tauceti:TauCeti.Tannaka.tensorAutFunctor`; `tauceti:TauCeti.Tannaka.pointsFunctorIsoTensorAutFunctor`; `mathlib:CategoryTheory.Limits.HasColimit`.

<a id="multileg-and-coefficient-reconstruction"></a>

**Multileg and coefficient reconstruction** (`multilegCoefficientReconstruction`). There are canonical Hopf isomorphisms H^I_Λ≅⊗_{i∈I}H^{i}_Λ and H^I_Λ⊗_ΛΛ′≅H^I_{Λ′} for the source coefficient changes. They commute with leg permutations, fusion/collision maps, comultiplication, counit and antipode. First work modulo ℓ^c, assemble compatible levels to construct H_{Z_ℓ} and its affine flat group, and recover torsion coefficient rings by base change. Prime-to-p finite coefficient decompositions are assembled componentwise. This is an ℓ-adic reconstruction theorem, not an integral decomposition theorem.

Proof: The product formula for X_W in VI.10.1 gives the dual tensor formula on finite pieces; pass to filtered colimits.

**Sources:** [FS](#source-fs), VI.10.3 pp234–235; VI.11.1 proof p235.

**Prerequisites:** [Bounded left adjoints](#tannakian-left-adjoint); [Coordinate Hopf algebra](#geometric-coordinate-hopf-algebra); [CoCartesian finite-set functoriality](#finite-set-functoriality-and-constant-terms); [Satake category](#satake-category-and-fibre-functor); `mathlib:Module.Flat`; [Rational parity and integral torsion bounds](#standard-costandard-torsion-bound); [Cohomology](#satake-fibre-functor).

### Geometric rational semisimplicity and Witt Tannaka

Forget arithmetic Weil data before applying geometric rational semisimplicity. Establish finite type and connectedness before using the finite-type reductivity criterion. Transport fusion to the Witt category over an algebraic closure of a finite field.

<a id="rational-semisimplicity"></a>

**Geometric rational semisimplicity** (`rationalSemisimplicity`). After forgetting Weil descent and taking a geometric splitting fibre, the rational Satake category is the direct sum over dominant μ of copies of finite-dimensional Q_ℓ-vector spaces generated by the simple IC_μ. For each bounded object the sum is finite. Convolution of the IC objects is semisimple. EDC.7 is applied on finite-type proper models/resolutions of bounded Witt Schubert perfections over an algebraic closure of a finite field and transported through perfection and the integral-family comparison. No semisimplicity of Weil representations, integral Satake objects or mod-ℓ Satake objects follows.

Proof: Use VI.6.7 to transport geometric Satake to the Witt fibre. Equivariance and connected Schubert stabilizers make simple equivariant local systems constant, so simples are IC_μ.

**Sources:** [FS](#source-fs), VI.7.5 pp219–221; VI.11.1 proof pp235–236; [Zhu](#source-zhu), Lemma 2.1 p430 and Proposition 2.2 p432; context pp430–432.

**Prerequisites:** [One-leg ULA special/generic comparison](#integral-family-comparison); [Generic Schubert bounds](#schubert-bounds-and-properness); [Relative perverse t-structure](#relative-perverse-t-structure); [Satake category](#satake-category-and-fibre-functor); [Fusion product and ordinary symmetry](#fusion-product-and-sign-rule); `EDC:EDC.7`; [Rational parity and integral torsion bounds](#standard-costandard-torsion-bound); [One-leg Satake equivalence](#one-leg-satake-comparison); [Perfect models and étale realization](#perfect-model-and-etale-comparison).

<a id="generic-fibre-reductivity"></a>

**Reductivity of the generic Satake group** (`genericFibreReductivity`). The geometric generic fibre G^∨_{Q_ℓ} is a connected reductive group of finite type. Finite dominant-monoid generators give a tensor generator (including its dual), so MC.6/DM 2.20 gives finite type. For every nontrivial IC highest weight the highest weights nμ in tensor powers grow, ruling out a nontrivial finite tensor hull; MC.6/DM 2.22 gives connectedness. Having established finite type and connectedness, use geometric semisimplicity and the characteristic-zero reductivity criterion from the existing ReductiveGroups owner. DM 2.23 also expresses the semisimplicity criterion as proreductivity; no additional general pro-group theorem is assigned to the upstream finite-type stage.

Proof: Choose finite generators for dominant weights, and use the highest-weight constituent IC_{μ+ν} of convolution to generate all simples by tensor operations/subquotients.

Checks: For G a split torus the group is its dual torus, not a semisimple group. Semisimplicity alone would allow disconnected or infinite proreductive groups; the preceding two recognition steps are necessary.

**Sources:** [FS](#source-fs), VI.11.1 proof pp235–236; [DM](#source-dm), Proposition 2.20, Corollary 2.22 and Proposition 2.23 pp24–27; [Zhu](#source-zhu), §2.5 p454, first paragraph.

**Prerequisites:** [Geometric rational semisimplicity](#rational-semisimplicity); [Coordinate Hopf algebra](#geometric-coordinate-hopf-algebra); `MC:MC.6/tannaka-finiteness-recognition`; `MC:MC.6/tannaka-connectedness-recognition`; `tauceti:TauCetiRoadmap/ReductiveGroups#layer-6-reductive-and-semisimple-groups`; `RG:RG2.5`; `tauceti:TauCeti.reductiveAffineGroupSchemeProperty`.

<a id="witt-rational-tannakian-category"></a>

**Rational Witt Satake category as a neutral Tannakian category** (`wittRationalTannakianCategory`). Let Sat^Witt_G be Zhu's category P_{L⁺G}(Gr_G) of L⁺G-equivariant perverse Q̄_ℓ-sheaves with bounded support on the Witt vector affine Grassmannian of G over k, with convolution ⋆, unit IC_0 and total cohomology H*. (i) The one-leg comparison over Spd k identifies Sat^Witt_G, compatibly with ⋆ and H*, with the Q̄_ℓ-linear idempotent completion of the rationalization Sat_G(Hck_{Spd k}, Z_ℓ) ⊗ Q̄_ℓ (Hom groups tensored with Q̄_ℓ). (ii) Transporting the parity-corrected fusion symmetry and the Satake duals through (i) makes Sat^Witt_G a semisimple rigid symmetric monoidal abelian category with End(IC_0) = Q̄_ℓ, and H* an exact faithful symmetric monoidal functor to finite-dimensional Q̄_ℓ-vector spaces with the ordinary flip; thus (Sat^Witt_G, H*) is a neutral Tannakian category. (iii) Its Tannakian group Aut^⊗(H*) is canonically the base change to Q̄_ℓ of the generic fibre of the Satake group of Spd k, and so is a connected reductive group of finite type. The monoidal structure on H* is the one transported from fusion; it is not identified with the structure of Zhu's Proposition 2.20.

Hypotheses: E is a finite extension of Q_p with residue field F_q; k is an algebraic closure of F_q; O = W(k) ⊗_{W(F_q)} O_E, the integers of the completed maximal unramified extension of E, which is totally ramified over W(k). G is a split connected reductive group over O_E, and also denotes its base change to O. ℓ ≠ p, and Q̄_ℓ is the union of the finite extensions of Q_ℓ. Zhu allows any algebraically closed k and any finite totally ramified F over W(k)[1/p]. For k an algebraic closure of F_p every such F is the completed maximal unramified extension of a finite extension E of Q_p (finite extensions of the completion of the henselian field Q_p^ur come from finite extensions of Q_p^ur), and every reductive group over the strictly henselian ring O is split, so the comparison route covers Zhu's setting for this k. For a larger algebraically closed k it is not covered here (proof obligation "Zhu's equivalence outside the FS comparison").

Proof: Zhu's ring W_O(R) = W(R) ⊗_{W(k)} O equals W(R) ⊗_{W(F_q)} O_E, so his Gr_G is the Witt vector affine Grassmannian of G over k. Over Spd k the local Hecke stack has the Witt Grassmannian as its underlying diamond, and Scholze's full embedding of étale sheaves on perfect schemes identifies its perverse objects with Zhu's L⁺G-equivariant perverse sheaves (FS p219). Compatibility with convolution, the unit and duals comes from the one-leg comparison result, and with total cohomology from the Satake cohomology functor.

**Sources:** [Zhu](#source-zhu), §2 opening p429; §2.1.1 p430; §2.5 p454, first paragraph; [FS](#source-fs), VI.7 p219 after the proof of Proposition VI.7.4; Remark I.2.14 p17.

**Prerequisites:** [One-leg Satake equivalence](#one-leg-satake-comparison); [One-leg ULA special/generic comparison](#integral-family-comparison); `AC:L0/rational-constructible-coefficients`; [Cohomology](#satake-fibre-functor); [Duals of Satake objects](#satake-rigidity); [Fusion product and ordinary symmetry](#fusion-product-and-sign-rule); [Geometric rational semisimplicity](#rational-semisimplicity); [Reductivity of the generic Satake group](#generic-fibre-reductivity); [Coefficient reconstruction](#multileg-and-coefficient-reconstruction); `MC:MC.6/neutral-tannaka-reconstruction`; [Rational parity and integral torsion bounds](#standard-costandard-torsion-bound).


## GS4. Integral identification, normalization and functoriality

### Torus, rank one and the integral recovery

The generic rank-one calculation identifies the root datum. Integral identification additionally needs the all-prime special-fibre image argument. At characteristic two, highest weights do not exclude N(T); the modular top-cycle comparison and tilting invariants below must establish that exclusion.

<a id="torus-and-rank-one-identification"></a>

**Torus and rank-one identification** (`torusRankOneIdentification`). For a split torus T, Sat_T is the category of finitely supported X_*(T)-graded finite projective Weil representations and G^∨_T is its dual torus. Constant terms give a closed immersion of this torus into G^∨_G. For G=PGL₂ the minuscule Schubert variety is P¹, its fibre is Z_ℓ⊕Z_ℓ(-1) with torus weights ±1, and the generic fibre G^∨_{Q_ℓ} is SL(Q_ℓ⊕Q_ℓ(-1)) with geometric root line Q_ℓ(1). The integral and special-fibre statement is the separate result rank-one-integral-identification. For general semisimple rank one recover the central/component grading by the diagonalizable group with character group π₁(G), which can have torsion.

Proof: The torus calculation is the character grading and group-algebra Hopf computation. For each top Schubert weight its rank-one weight quotient gives the closed torus immersion.

Checks: For G=G_m the weight n gives the character z↦z^n. For G=PGL₂ the generic group is SL₂, not PGL₂: the minuscule representation is two-dimensional with weights ±1. For G=PGL₂ the component group Z/2 corresponds to μ₂, which is diagonalizable and not a torus.

**Sources:** [FS](#source-fs), VI.11.1 proof pp235–237; [Zhu](#source-zhu), §2.5 p454, second paragraph.

**Prerequisites:** [Symmetric constant terms](#symmetric-constant-term); [Fusion and Verdier duality](#fusion-verdier-duality); [Coefficient reconstruction](#multileg-and-coefficient-reconstruction); [Reductivity of the generic Satake group](#generic-fibre-reductivity); `RG:RG2.5`; `tauceti:TauCetiRoadmap/ReductiveGroups#layer-9-pinned-chevalleydemazure-group-schemes-over-ℤ`; `mathlib:RootPairing`.

<a id="rank-one-integral-identification"></a>

**Integral rank-one identification** (`rankOneIntegralIdentification`). For G = PGL₂ and every ℓ ≠ p, the representation on the fibre Z_ℓ⊕Z_ℓ(-1) of the minuscule object is an isomorphism G^∨_{Z_ℓ} ≅ SL(Z_ℓ⊕Z_ℓ(-1)). Its special fibre G^∨_{F_ℓ} → SL₂ is surjective. The image H contains the diagonal torus T and its irreducibles are separated by highest weights in Z≥0; for ℓ odd this forces H = SL₂ (VI.11.2). For ℓ = 2 these properties leave the case that the reduced subgroup of H is the normalizer N(T), with H inside a Frobenius preimage of N(T). That case is excluded because Hom(1, B₁^{⋆n}) over F₂ has the characteristic-zero dimension for every n, while a Frobenius preimage of N(T) has more invariants in a suitable V^{⊗n}. For a split G of semisimple rank one the integral identification follows through G → G_ad ≅ PGL₂ and the component grading. The characteristic-two invariant-count route is a specified replacement: it uses the strengthened LP3 and GS2:correspondences dependencies, and its geometric identification remains the named rank-one special-fibre proof obligation.

Proof: Reduce G^∨ modulo ℓ and work after faithfully flat extension to an algebraic closure k of F_ℓ; surjectivity of the special-fibre map descends. Let H be the image of G^∨_k in SL₂. Every irreducible representation of G^∨_k is a simple Satake object B_μ of highest weight μ, so the irreducibles of H are separated by highest weights in Z≥0. Replace H by its image H′ under a high power r of the Frobenius isogeny: H′ is reduced, contains T and is a quotient of H, so its irreducibles pull back to irreducibles of H with highest weights multiplied by ℓ^r; and H′ = SL₂ forces H = SL₂ by dimension. The identity component of the smooth group H′ is T, a Borel or SL₂ by the structure theory of SL₂. T and the Borels have irreducibles of negative highest weight; if H′° = T then H′ ⊂ N(T). For ℓ odd the sign character of N(T) is a second irreducible of highest weight 0, so H′ = SL₂. For ℓ = 2, if H′ = N(T), then H lies in H_a, the preimage of N(T) under the a-th Frobenius power, for some a ≥ 0. Put n = 6·2^a − 2. The SL₂ tilting factorization gives T(n) ≅ A ⊗ T(4)^{[a]}, where A = T(2^{a+1} − 2). For a ≥ 1 the Steinberg-square description A ≅ St_a ⊗ St_a and self-duality identify A^{G_a} with End_{G_a}(St_a) = k; the resulting line has trivial SL₂ action. For a = 0 use A = T(0) directly. Hence T(n)^{G_a} ≅ T(4)^{[a]} and T(n)^{H_a} ≅ T(4)^{N(T)}. The character of T(4) is the sum of the characters of ∇(4) and ∇(2): its weight-zero space has dimension two, so the involution w has a nonzero fixed vector in characteristic two, but T(4)^{SL₂} = 0 because its good filtration has no ∇(0). Thus T(n)^{SL₂} = 0 as well. The highest-weight summand T(n) of the tilting module V^{⊗n} supplies extra H-invariants. For V^{⊗n} the ∇(0)-multiplicity is the characteristic-zero trivial multiplicity. The Steinberg-kernel and good-filtration facts are explicit LP3 obligations, not consequences of a prime-to-ℓ generation theorem. Require the following coefficient-independent geometric calculation from GS2:correspondences, strengthening rational semismallness. For even n, the n-step minuscule PGL₂ convolution space is a smooth iterated (perfected) P¹ bundle of dimension n, its proper convolution map is semismall, and the base-point fibre has dimension at most n/2. Proper duality identifies Hom(1, B₁^{⋆n}) with its degree-n Borel–Moore homology, up to the harmless Tate twist. Top-dimensional cycles give a free coefficient module with basis the n/2-dimensional irreducible components, so the F₂ dimension equals the Q_ℓ dimension. Transport this identification through the one-leg comparison and use the rational rank-one calculation for the latter dimension. Since the reconstructed group acts through H, this contradicts the extra invariants of the preceding step and gives H = SL₂. This source-to-supplier adapter remains the explicit rank-one proof obligation; Zhu Proposition 2.3 provides the semismall dimension bound, not the asserted modular Hom identification. The map G^∨_{Z_ℓ} → SL₂ is an isomorphism on generic fibres and surjective on special fibres, so on coordinate rings it is injective modulo ℓ and an isomorphism after inverting ℓ; the flat-module lemma VI.11.3 makes it an isomorphism. For semisimple rank one use G → G_ad ≅ PGL₂ and refine the component grading.

Checks: The normalizer of the diagonal torus in SL₂ over F₂, and its preimage under the Frobenius isogeny, both have irreducibles of highest weights 0, 1, 2, …, each once; torus containment and injectivity of highest weights cannot tell them from SL₂ at ℓ = 2. For a = 0 the count is n = 4: (V^{⊗4})^{N(T)} is three-dimensional (w permutes the six weight-zero basis tensors freely), against two SL₂-invariants and two characteristic-zero invariants. A map of flat Z_ℓ-modules that is injective modulo ℓ and an isomorphism after inverting ℓ is an isomorphism; injectivity modulo ℓ alone is not enough.

**Sources:** [FS](#source-fs), VI.11.1 proof pp236–237; Lemmas VI.11.2–VI.11.3 p237; [DH](#source-dh), §1, Lemma 1.1 p3 and Lemma 1.4 p4; §5 p18, Steinberg-square discussion; [Zhu](#source-zhu), Proposition 2.3 and Remark 2.4 p432; §2.1 pp431–432.

**Prerequisites:** [Torus and rank one](#torus-and-rank-one-identification); [Coefficient reconstruction](#multileg-and-coefficient-reconstruction); [Coordinate Hopf algebra](#geometric-coordinate-hopf-algebra); [Fusion product and ordinary symmetry](#fusion-product-and-sign-rule); [Ambient Hecke convolution](#convolution-diagram); `tauceti:TauCetiRoadmap/ReductiveGroups#layer-3-subgroups-quotients-components`; `tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory`; `LP:LP3`; `mathlib:Module.Flat`; `GeometricSatakeAndFusion:GS2:correspondences`; [One-leg Satake equivalence](#one-leg-satake-comparison).

<a id="generic-root-datum"></a>

**Weight torus and generic root datum** (`genericRootDatum`). Under the torus inclusion, weight-functor grading identifies X^*(T^∨)=X_*(T). The stabilizer of the cohomological grading is the maximal torus and the weight filtration defines a Borel. The symmetric constant-term maps for minimal Levis identify each simple coroot of G with a simple root of G^∨ and each simple root with its coroot; their Weyl reflections agree. Convex-hull bounds for weights of IC_μ exclude additional roots. Thus G^∨_{Q_ℓ} has the dual root datum and its generic pinning has root line Q_ℓ(1).

Proof: Use the weight grading and highest-weight line to identify the torus and chosen positive filtration.

**Sources:** [FS](#source-fs), VI.11.1 proof pp237–238; [Zhu](#source-zhu), §2.5 pp454–455, after Proposition 2.36.

**Prerequisites:** [Torus and rank one](#torus-and-rank-one-identification); [Symmetric constant terms](#symmetric-constant-term); [Reductivity of the generic Satake group](#generic-fibre-reductivity); [Semi-infinite strata and constant terms](#semi-infinite-orbits-and-hyperbolic-localization); `RG:RG2.5`; `tauceti:TauCetiRoadmap/ReductiveGroups#layer-9-pinned-chevalleydemazure-group-schemes-over-ℤ`.

<a id="integral-recovery-and-adjoint-reduction"></a>

**Integral recovery and the adjoint reduction** (`integralRecovery`). The generic dual identification extends to an isomorphism G^∨_{Z_ℓ}≅Ĝ_{Z_ℓ} for every ℓ≠p. Over the completed maximal unramified extension, the dual torus and rank-one Levi integral images generate Ĝ(Z̆_ℓ); this maximal bounded subgroup preserves a lattice in every finite-dimensional generic representation. The associated finite-type images recover the integral model via the RG2.3 Prasad–Yu closed-immersion criterion and VI.11.3 flat-module injection. At ℓ=2 first perform this step for G_ad, whose dual is simply connected, and then recover the original G from its component/central grading. One cannot apply Prasad–Yu directly to an arbitrary dual group in characteristic two.

Proof: Use integral CT Levi maps and the dual torus to obtain the full hyperspecial/maximal bounded subgroup; include the torus separately for semisimple rank zero. Import the generation/Iwasawa result from RG2.4 and integral-points topology from RG2.0. Extend a generic faithful representation using a preserved lattice. The map from Ĝ to its finite-type schematic image is generically a closed immersion. PY applies if ℓ≠2 or the generic fibre over an algebraic closure has no normal algebraic subgroup isomorphic to SO_{2n+1}; simple connectedness suffices. For G_ad this exception is absent. Surjectivity on integral points and the flat-module lemma force equality of coordinate rings. Reconstruct arbitrary G by refining the component grading, as in the rank-one/central argument.

Checks: The theorem includes ℓ=2 when p≠2 and includes groups whose dual has torsion fundamental group. The torus case does not rely on a nonexistent rank-one Levi. Generic equality by itself would also allow defective integral models; this proof uses integral points and the closed-immersion theorem.

**Sources:** [FS](#source-fs), VI.11.1 proof pp238–239; Lemma VI.11.4 p238; [PY](#source-py), Corollary 1.3 pp2–3; proof §5.4 p12.

**Prerequisites:** [Generic root datum](#generic-root-datum); [Torus and rank one](#torus-and-rank-one-identification); [Integral rank-one identification](#rank-one-integral-identification); [Coefficient reconstruction](#multileg-and-coefficient-reconstruction); `RG:RG2.3`; `RG:RG2.0`; `RG:RG2.4`; `tauceti:TauCetiRoadmap/ReductiveGroups#layer-9-pinned-chevalleydemazure-group-schemes-over-ℤ`; `mathlib:Module.Flat`.

<a id="dual-group-identification"></a>

**Canonical pinned dual identification** (`dualGroupIdentification`). There is a canonical W_E-equivariant isomorphism G^∨_Λ≅Ĝ_Λ^{geom} for the prime-to-p torsion and compatible ℓ-adic coefficients above. The geometric pinning identifies each simple root line with Λ(1); it carries the cyclotomic Weil action as well as the action on the pinned dual root datum. The isomorphism is independent of a chosen splitting pinning of G and descends from a finite Galois splitting extension to nonsplit G. It is an integral theorem and uses no exclusion on the order of π₁(Ĝ).

Proof: Initially identify split pinned groups by the integral torus/rank-one calculation. Vary the pinning over its flag/pinning parameter family.

**Sources:** [FS](#source-fs), Theorem VI.11.1 p235 and canonical-pinning/descent proof pp238–239.

**Prerequisites:** [Integral recovery and the adjoint reduction](#integral-recovery-and-adjoint-reduction); [Symmetric constant terms](#symmetric-constant-term); [Weil realization of total cohomology](#drinfeld-fibre-realization); `RG:RG2.5`; `VS:VS1`.

### Rational Witt and normalized integral equivalences

The rational Witt theorem uses the generic identification. The integral theorem incorporates the half Tate character into the Weil semidirect product. Levi naturality has a torus cocycle correction determined by the two normalizations.

<a id="witt-rational-satake-equivalence"></a>

**Rational Witt vector geometric Satake equivalence** (`wittRationalSatakeEquivalence`). In the setting of the rational Witt Tannakian category, let Ĝ be the split dual group over Q̄_ℓ with the dual Borel B̂ ⊃ T̂ of its pinned dual root datum. There is an equivalence of Q̄_ℓ-linear symmetric monoidal categories S: Sat^Witt_G → Rep_{Q̄_ℓ}(Ĝ) onto finite-dimensional algebraic representations, with an isomorphism of tensor functors H* ≅ (forget ∘ S). Under S: (a) the weight functor CT = ⊕_λ CT_λ, viewed as a functor to Sat^Witt_T, has a unique monoidal structure for which the isomorphism H*_T ∘ CT ≅ H* is monoidal; it is then symmetric and corresponds to restriction to T̂, CT_λ(A) being the λ-weight space of S(A); (b) the filtration of H* by semi-infinite orbits corresponds to the B̂-stable filtration by weights; (c) IC_μ corresponds to the irreducible representation V_μ of highest weight μ, so dim CT_λ(IC_μ) = dim V_μ(λ); (d) for a torus, S is the grading equivalence with Rep(T̂). This is Zhu's Theorem 0.3, with Corollary 2.22 and §2.5, for the monoidal structure on H* transported from fusion; its agreement with the structure of Zhu's Proposition 2.20 is not asserted.

Hypotheses: E is a finite extension of Q_p with residue field F_q; k is an algebraic closure of F_q; O = W(k) ⊗_{W(F_q)} O_E, the integers of the completed maximal unramified extension of E, which is totally ramified over W(k). G is a split connected reductive group over O_E, and also denotes its base change to O. ℓ ≠ p, and Q̄_ℓ is the union of the finite extensions of Q_ℓ. Zhu allows any algebraically closed k and any finite totally ramified F over W(k)[1/p]. For k an algebraic closure of F_p every such F is the completed maximal unramified extension of a finite extension E of Q_p (finite extensions of the completion of the henselian field Q_p^ur come from finite extensions of Q_p^ur), and every reductive group over the strictly henselian ring O is split, so the comparison route covers Zhu's setting for this k. For a larger algebraically closed k it is not covered here (proof obligation "Zhu's equivalence outside the FS comparison"). Dominance on coweights uses nonnegative integer combinations of positive coroots; Rep_{Q̄_ℓ}(Ĝ) means algebraic representations on finite-dimensional Q̄_ℓ-vector spaces, with no Weil action.

Proof: The generic root datum result identifies the root datum of the Tannakian group of the rational Witt category with the dual root datum, with its torus, Borel and simple root lines; the isomorphism theorem for pinned split groups gives Aut^⊗(H*) ≅ Ĝ over Q̄_ℓ. Neutral Tannaka reconstruction turns this into S with forget ∘ S ≅ H*. Only the generic fibre is used: the integral rank-one identification, integral recovery and the ℓ = 2 input are not prerequisites. For (a): transport the symmetric constant term for B through the one-leg comparison and to Q̄_ℓ; it commutes with the fibre functors. Uniqueness: H*_T is faithful, so the monoidal structure on CT is determined by the monoidal isomorphism H*_T ∘ CT ≅ H*. Symmetry: the commutativity constraints on both sides are detected by H*, as in the uniqueness part of Zhu's Proposition 2.21. The torus case identifies Rep(T̂) with graded spaces, so CT is restriction to T̂. For (b) and (c): the stabilizer of the cohomological filtration is B̂ by the generic root datum result. The weights of IC_μ lie in the convex hull of Wμ and μ occurs once, since S_μ ∩ Gr_{≤μ} is irreducible of dimension ⟨2ρ, μ⟩ by the Mirković–Vilonen count; so S(IC_μ) is the irreducible module of highest weight μ by the characteristic-zero highest-weight classification. For (b): the semi-infinite filtration is split by the weight functors (Zhu Corollary 2.10, with the weight-filtration argument stated here, or the symmetric constant-term result, through F ≅ F_T ∘ CT_B[deg]), so by (a) it corresponds to the sums of the weight spaces V(λ′) over λ′ ≥ λ, which are B̂-stable because the root groups of B̂ raise weights by positive coroots of G. Zhu's own route to the same identification (torus case, Proposition 2.36 by torus-equivariant cohomology, then the maximal torus and Borel argument of Mirković–Vilonen §7) uses his monoidal structure on H* and his Gelfand commutativity constraint (§§2.3–2.4). That independent construction belongs to GeometricSatakeAndFusionPartII; the equivalence here uses the fusion construction.

Checks: For a split torus T, S is the equivalence between X_*(T)-graded spaces and representations of T̂, with CT the identity. For G = PGL₂ the minuscule object goes to the standard representation of SL₂, with CT_{±μ} one-dimensional. For G = GL_n and μ = (1,0,…,0) the closed Schubert variety is P^{n−1}; S(IC_μ) is the standard representation, with the n coordinate weights each of multiplicity one. With the Koszul-signed symmetry instead of the parity-corrected one, the reconstruction would give a supergroup, not Ĝ.

**Sources:** [Zhu](#source-zhu), Theorem 0.3 p408 ; Corollary 2.22 p444; §2.5 pp454–455; §0.5 p412; [FS](#source-fs), Remark I.2.14 p17; VI introduction pp188–189.

**Prerequisites:** [Rational Witt category](#witt-rational-tannakian-category); [Generic root datum](#generic-root-datum); [Torus and rank one](#torus-and-rank-one-identification); [Symmetric constant terms](#symmetric-constant-term); [One-leg Satake equivalence](#one-leg-satake-comparison); [MV intersections](#semi-infinite-intersections-and-mv-cycles); [Rational special-fibre weights](#rational-weight-concentration); `MC:MC.6/neutral-tannaka-reconstruction`; `RG:RG2.5`; `LP:LP3`; `tauceti:TauCetiRoadmap/ReductiveGroups#layer-9-pinned-chevalleydemazure-group-schemes-over-ℤ`.

<a id="normalized-satake-equivalence"></a>

**Normalized integral Satake equivalence** (`normalizedSatakeEquivalence`). Choose r∈Λ× with r²=q and the associated half Tate local system. Let χ_Tate be the Weil character of the geometric root line Λ(1) under IV.7.3 and κ its chosen square root. The half twist on a sheaf stalk has geometric Frobenius eigenvalue r^{-1}; identifying that stalk convention with κ under Drinfeld realization requires the explicit convention comparison. Put t_G(w)=(2ρ̂_G)(κ(w)) in Ĝ (projected to Ĝ_ad for conjugation). The geometric action is Ad(t_G(w)) composed with the usual pinned action. The semidirect comparison (g,w)↦(g t_G(w),w) identifies the geometrically twisted semidirect group with the pinned one. Combining it with reconstruction gives Sat^I_G(Λ)≃Rep^{fp,cont}_Λ((Ĝ⋊W_E)^I). Equivalently an algebraic representation of (Ĝ⋊Q)^I, for a finite quotient Q through which the pinned action factors, gives its normalized Satake object; Q is not substituted for all continuous Weil representations.

Proof: Use the root-line action in VI.11.1 to express geometric versus pinned action through the adjoint cocharacter 2ρ̂, without requiring ρ̂ itself to be a cocharacter of Ĝ. The identity t(wv)=t(w)·w(t(v)) verifies the semidirect multiplication comparison. Tensor and dual compatibility follow from the Hopf comparison and corrected fusion. Transport the chosen half twist and Frobenius convention through the Drinfeld equivalence. The precise stalk-action versus parameter-action orientation must be verified through the supplier interface.

API:

- `normalizedSatakeEquivalence`: The strong symmetric equivalence with continuous finite-projective representations of the usual pinned Weil semidirect group.
- `normalizedSatakeObject`: The inverse equivalence applied to a representation V of (Ĝ⋊Q)^I.
- `normalizedSatake_fibre`: The underlying fibre is V with the specified half-Tate normalization, compatibly with Weil action.
- `normalizedSatake_tensor`: S_{V⊗W} ≅ S_V*S_W and S_1 ≅ unit.
- `normalizedSatake_dual`: S_{V∨} is the internal dual sw*D(S_V).
- `normalizationCocycle`: t_G(w)=(2ρ̂_G)(κ(w)); the cocycle identity gives the semidirect comparison.

Tests:

- `test_normalized_torus`: For T=G_m, weight n is the point object on component n, with no ρ twist.
- `test_normalized_pgl2`: The SL₂ standard representation gives Λ[1](1/2) on the PGL₂ minuscule P¹, with eigenvalues r⁻¹,r.
- `test_normalized_rootChoice`: Replacing r by −r changes odd-component half twists by −1.


**Sources:** [FS](#source-fs), Theorem VI.0.2 p190; VI.11.1 p235; IX.2 p321.

**Prerequisites:** [Pinned dual group](#dual-group-identification); [Coordinate Hopf algebra](#geometric-coordinate-hopf-algebra); [Coefficient reconstruction](#multileg-and-coefficient-reconstruction); [Weil realization of total cohomology](#drinfeld-fibre-realization); [Fusion and Verdier duality](#fusion-verdier-duality); `RG:RG2.5`; `mathlib:CategoryTheory.Functor.Monoidal`; `mathlib:Representation`.

<a id="levi-naturality"></a>

**Levi naturality and normalization** (`leviNaturality`). For P with Levi M, CT_P[deg_P] intertwines geometric Satake with restriction along M̂^{geom}→Ĝ^{geom}. Under the chosen normalized semidirect comparisons, the map from the pinned M-group to the pinned G-group is (m,w)↦(ι(m)t_M(w)^{-1}t_G(w),w). Here t_G/t_M=(2ρ̂_G−2ρ̂_M)(κ(w)) centralizes M̂. Nested Levis multiply these correction cocycles and their degree shifts add. Thus this is a naturality theorem with a specified Weil correction, not unqualified restriction along the untwisted inclusion.

Proof: Transport the geometric CT map through the two explicit semidirect comparison isomorphisms; multiply the two cocycles in the common torus.

**Sources:** [FS](#source-fs), VI.9.6 p230; VI.11.1 pp238–240; IX.7.1 p334.

**Prerequisites:** [Normalized equivalence](#normalized-satake-equivalence); [Symmetric constant terms](#symmetric-constant-term); [Generic root datum](#generic-root-datum); `RG:RG2.5`.

### Group maps, products, restriction of scalars and inversion

Track component gradings for adjoint-isomorphism maps and the permutation of conjugate factors for Weil restriction. Induction enters through the geometric correspondence, not as an arbitrary strong monoidal functor. Inversion retains its canonical inner sign.

<a id="adjoint-isomorphism-naturality"></a>

**Naturality for adjoint-isomorphism maps** (`adjointIsomorphismNaturality`). For f:G′→G inducing an isomorphism on adjoint groups, componentwise pushforward of the corresponding bounded Grassmannian sheaves intertwines normalized Satake with restriction along the dual map Ĝ→Ĝ′. Component refinements, central characters, Weyl actions, tensor constraints, half twists and finite-set collisions commute with this comparison. This includes central isogenies and the adjoint reduction used for integral recovery; no inverse equivalence for a general central isogeny is asserted.

Proof: The map of Grassmannians is a componentwise isomorphism; its essential change is the map of component gradings. Pushforward corresponds to forgetting/refining the appropriate dual central character.

**Sources:** [FS](#source-fs), VI.11.1 proof pp237–239; IX.6.1 pp330–331.

**Prerequisites:** [Normalized equivalence](#normalized-satake-equivalence); [Torus and rank one](#torus-and-rank-one-identification); [CoCartesian finite-set functoriality](#finite-set-functoriality-and-constant-terms); `RG:RG2.5`; [Loop spaces](#loop-groups-and-local-hecke); [Beilinson–Drinfeld Grassmannian](#grassmannian); [Generic Schubert bounds](#schubert-bounds-and-properness).

<a id="product-naturality"></a>

**Product naturality** (`productNaturality`). For G=G₁×G₂ the external product of Grassmannian sheaves and normalized Satake identify Ĝ with Ĝ₁×Ĝ₂ and carry V₁⊠V₂ to S_{V₁}⊠S_{V₂}. Tensor, fibre, root pinning, Weil action and all finite-set operations agree. This is a statement for external products and their induced categorical comparison, not a claim every representation is itself an external tensor product.

Proof: The loop/torsor and bounded Schubert constructions split as products; Künneth splits total cohomology and constant terms.

**Sources:** [FS](#source-fs), IX.6.2 p331; VI.10.3 pp234–235.

**Prerequisites:** [Normalized equivalence](#normalized-satake-equivalence); [CoCartesian finite-set functoriality](#finite-set-functoriality-and-constant-terms); `RG:RG2.5`; [Loop spaces](#loop-groups-and-local-hecke); [Beilinson–Drinfeld Grassmannian](#grassmannian); [Generic Schubert bounds](#schubert-bounds-and-properness).

<a id="weil-restriction-naturality"></a>

**Weil restriction naturality** (`weilRestrictionNaturality`). For a finite separable E′/E and G=Res_{E′/E}G′, the dual pinned group is the product of conjugates of Ĝ′ indexed by embeddings E′→Ē, with its permutation Weil action. After pullback to the E′ divisor base, the closed Grassmannian immersion for the chosen embedding and proper pushforward implement the representation procedure: project to Ĝ′, inflate from Ĝ′⋊W_{E′} to Ĝ⋊W_{E′}, then induce to Ĝ⋊W_E. This comparison is compatible with total cohomology, tensor/collision coherences and the two field-specific half twists; it is not an equivalence replacing W_E by W_{E′} without induction.

Proof: Import the group-scheme Weil restriction and its pinned dual permutation datum. Use the pullback of the divisor leg base and the chosen-embedding closed Grassmannian immersion. The proper pushforward is finite-index induction on Weil representations by the Drinfeld realization, matching IX.6.3. Track residue degree f via q_{E′}=q_E^f and compatible half-root choices. Construct the finite-set/tensor comparisons through the geometric correspondences, not by claiming induction is strong monoidal on arbitrary representations; its compatibility uses the particular Hecke/factorization diagram.

Checks: For E′=E the construction is identity. For a quadratic induced torus the two geometric character factors are permuted by W_E; forgetting that permutation fails. Half roots must satisfy r_{E′}=r_E^f when compatible normalization is claimed.

**Sources:** [FS](#source-fs), IX.6.3 pp331–332.

**Prerequisites:** [Normalized equivalence](#normalized-satake-equivalence); [CoCartesian finite-set functoriality](#finite-set-functoriality-and-constant-terms); [Loop spaces](#loop-groups-and-local-hecke); `RG:RG2.5`; `RG:RG2.0a`; [Beilinson–Drinfeld Grassmannian](#grassmannian); [Generic Schubert bounds](#schubert-bounds-and-properness).

<a id="chevalley-involution"></a>

**Chevalley involution with its inner sign** (`chevalleyInvolution`). Under canonical dual identification, sw* acts by Ad(ρ̂(-1))∘θ on Ĝ, where θ is the pinned Chevalley involution with lattice action μ↦−w₀μ and ρ̂(-1) is evaluated in the adjoint dual torus. It commutes with the geometric Weil action. Internal dual is sw*D, not sw* alone. The inner correction affects the canonical tensor/fibre comparison although it disappears after quotienting dual parameters by conjugacy.

Proof: Reduce via adjoint-isomorphism maps to the simply connected dual and then by rank-one constant terms to PGL₂.

Checks: For PGL₂ the root-line sign is -1, so omitting ρ̂(-1) gives the wrong fibre comparison when 2 is invertible. For a torus w₀=1 and θ inverts characters; for coefficients of characteristic two the inner signs reduce to one.

**Sources:** [FS](#source-fs), Proposition VI.12.1 and proof pp239–241.

**Prerequisites:** [Pinned dual group](#dual-group-identification); [Normalized equivalence](#normalized-satake-equivalence); [Fusion and Verdier duality](#fusion-verdier-duality); [Symmetric constant terms](#symmetric-constant-term); [Torus and rank one](#torus-and-rank-one-identification); `tauceti:TauCetiRoadmap/ReductiveGroups#layer-9-pinned-chevalleydemazure-group-schemes-over-ℤ`.

### Extension to perfect representation complexes

Apply the all-prime relative classifying-stack base-change and stable completion interfaces. The resulting functor lands in the stable idempotent closure of representation kernels; that containment does not establish full faithfulness or equality with the entire closure.

<a id="enhanced-perfect-satake-extension"></a>

**Perfect-complex Satake extension** (`perfectSatakeFunctor`). Fix ℓ≠p, a finite quotient Q of W_E through which the pinned action on Ĝ factors, and a Z_ℓ[r]-algebra Λ with r²=q. Compose normalized Satake on finite projective representations of (Ĝ⋊Q)^I with A↦D(A)^∨, using Verdier duality relative to Hck^I_G→[(Div¹)^I/L⁺G]. This is an exact Rep_Λ(Q^I)-linear monoidal functor into the enhanced local Hecke convolution category D■(Hck^I_G,Λ). Using LP3 highest-weight base change and LP4 the universal stable completion of the finite-projective exact representation category, extend it uniquely to a Perf(BQ^I_Λ)-linear exact monoidal functor Perf(B(Ĝ⋊Q)^I_Λ)→D■(Hck^I_G,Λ), coherent in I. Its fusion comparisons give symmetry on the Satake image. Its values lie in the stable idempotent closure of these Satake kernels. Equality with that closure, full faithfulness, and an equivalence with the whole enhanced category are not supplied by this extension theorem.

Proof: First define the exact representation functor over Z_ℓ[r] and compose with relative Verdier dual followed by internal dual. The enhanced target convolution uses pullback, tensor and π♮, which have the required infinity-category coherence. Import the relative highest-weight base-change equivalence Perf(B(Ĝ⋊Q)^I_{Z_ℓ[r]}) ⊗_{Perf(BQ^I_{Z_ℓ[r]})} Perf(BQ^I_Λ) ≅ Perf(B(Ĝ⋊Q)^I_Λ). Import the free stable/idempotent completion universal property for exact finite-projective representations, then extend the kernel functor and its finite-set comparisons uniquely. The general all-prime LP3/LP4 inputs are required; restricted parameter-stack generation is insufficient. The free stable/idempotent completion gives containment of the image in the stable idempotent closure of the representation kernels. It does not lift arbitrary enhanced morphisms or idempotents, so it does not prove equality of that closure with the essential image.

API:

- `perfectSatakeFunctor`: The exact Perf(BQ^I)-linear monoidal functor on Perf(B(Ĝ⋊Q)^I).
- `perfectSatake_onRepresentation`: On a finite-projective representation V its value is D(S_V)^∨ in local enhanced convolution.
- `perfectSatake_baseChange`: Scalar extension Λ→Λ′ commutes with the functor through the specified relative Perf base-change equivalence.
- `perfectSatake_exact`: The extension preserves zero objects, cofibres, shifts and retracts.
- `perfectSatake_finiteSets`: The extension of all collision, permutation and unit comparisons has the same composition coherences.
- `perfectSatake_unique`: Restriction along the representation embedding identifies the space of exact linear monoidal extensions with that of exact linear monoidal representation functors. A specified coherent isomorphism of restriction functors extends uniquely in this sense; agreement of object values alone is insufficient.

Tests:

- `test_perfect_unit`: The trivial representation gives the convolution unit.
- `test_perfect_shift`: V[1] maps to D(S_V)∨[1].
- `test_perfect_badPrimeAllowed`: For G=SL₂ and ℓ=2≠p, dual PGL₂ has π₁ of order two; the extension still applies.


**Sources:** [FS](#source-fs), IX.2 p321.

**Prerequisites:** [Normalized equivalence](#normalized-satake-equivalence); [CoCartesian finite-set functoriality](#finite-set-functoriality-and-constant-terms); [Fusion and Verdier duality](#fusion-verdier-duality); `LP:LP3`; `LP:LP4`; `EDS:E5:abstract/stable-infinity-category`; `EDS:E5:abstract/exact-functors`; `EDS:E5:abstract/idempotent-completion`; `EDS:E5:abstract/symmetric-monoidal-infinity-category`; `VS:VS3`; `DSO:S6`.


## GS4. Frobenius traces and classical spherical Satake

### Normalized traces, convolution and constant terms

Use Frobenius-equivariant finite-type models and the existing constructible trace formula. The component sign cancels the perverse-shift sign. Normalize both Haar measures, then compare weight coefficients with the already constructed spherical transform. Prove the additional Frobenius/relative-weight descent in the unramified nonsplit case.

<a id="normalized-frobenius-function"></a>

**Normalized Frobenius function** (`normalizedTraceFunction`). Assume G is unramified with a reductive O_E-model and hyperspecial K=G(O_E), and work rationally over a field L containing Q_ℓ and a chosen r with r²=q. A bounded Satake object A with a specified Frobenius descent structure is represented on its finite-type special-fibre model. For homogeneous support parity ε(A), define τ_A(g)=(-1)^{ε(A)} Σ_i(-1)^i Tr(Frob_q;H^i(A_{ḡ})); add this over even/odd summands. Geometric Frobenius acts on L(1) by q^{-1}; for the explicit IC formulas use the canonical Frobenius descent of the constant sheaf on the open Schubert stratum, and the sheaf IC_μ is normalized as j_{!*}L[d_μ](d_μ/2), d_μ=⟨2ρ,μ⟩, using r^{-d_μ} for the half twist. The function is K-biinvariant with bounded double-coset support. A geometric object without Frobenius descent has no specified trace function.

Proof: Use the finite-type special-fibre model and Frobenius-equivariant constructible realization, rather than counting points of an arbitrary diamond.

API:

- `normalizedTraceFunction`: The parity-corrected alternating geometric Frobenius stalk trace of a Frobenius-descended Satake object.
- `normalizedTrace_add`: Direct sums add trace functions, with parity correction applied separately to the two component summands.
- `normalizedTrace_halfTwist`: For any integer d, twisting the specified descent by (d/2) multiplies the geometric Frobenius trace by r^{-d}.
- `normalizedTrace_biinvariant`: Values are constant on K-double cosets and vanish outside finitely many bounded relative positions.
- `normalizedTrace_minuscule`: For a minuscule μ with canonical constant-sheaf IC Frobenius descent, τ_{IC_μ}=r^{-d_μ}1_{Kμ(π)K}; scaling the descent scales this function.

Tests:

- `test_trace_unit`: With canonical descent, τ_unit=1_K with coefficient +1.
- `test_trace_torusWeight`: For G_m, weight n and canonical descent, τ=1_{πⁿO_E×}.
- `test_trace_oddMinuscule`: For PGL₂, d=1 and canonical IC Frobenius descent, τ=r⁻¹1_{Kμ(π)K}; the raw trace has the opposite sign.


**Sources:** [Zhu](#source-zhu), §2.2 pp434–436, equations (2.2.7)–(2.2.10); [Gross](#source-gross), §3 pp6–8, (3.3), (3.4), (3.6), (3.13); §8 pp15–16 for choices of normalization.

**Prerequisites:** [Satake support parity](#support-parity); [One-leg ULA special/generic comparison](#integral-family-comparison); [Normalized equivalence](#normalized-satake-equivalence); `SF:SF.2`; `SR:SR.4`; [Perfect models and étale realization](#perfect-model-and-etale-comparison).

<a id="trace-convolution"></a>

**Frobenius trace and convolution** (`traceConvolution`). Normalize Haar measure on G(E) by vol(K)=1. For Frobenius-descended rational Satake objects, τ_{A*B}=τ_A*τ_B, where the right side is spherical Hecke convolution with this measure; unit maps to 1_K. The same assertion holds for the existing convolution via its fusion comparison. This is additive on the Grothendieck group of the exact Frobenius-descended category, not an equivalence between all Weil sheaves and arbitrary functions.

Proof: On the finite-type bounded convolution correspondence use Künneth for stalk tensor traces and the proper/compact-support Frobenius trace formula for pushforward. The rational point sum matches double-coset convolution with vol(K)=1.

**Sources:** [Zhu](#source-zhu), §2.1 pp430–433 and §2.2 pp434–436; [Gross](#source-gross), §2–§3 pp3–7, measure convention quoted in §3.

**Prerequisites:** [Normalized Frobenius function](#normalized-frobenius-function); [Fusion product and ordinary symmetry](#fusion-product-and-sign-rule); [Ambient Hecke convolution](#convolution-diagram); `SF:SF.2`; `SR:SR.4`; [Perfect models and étale realization](#perfect-model-and-etale-comparison).

<a id="trace-constant-term"></a>

**Frobenius trace and normalized constant terms** (`traceConstantTerm`). In the split case choose B=TN and dn on N(E) with vol(N(O_E))=1. The classical transform imported from SR.4 is S(f)(t)=δ_B(t)^{1/2}∫_N f(tn)dn, where δ_B(λ(π))^{1/2}=q^{-⟨ρ,λ⟩}. For a Frobenius-descended normalized IC object, S(τ_A) is the weight-by-weight Frobenius character of its normalized cohomology fibre, with the shifted constant-term degree ⟨2ρ,λ⟩ and the matching half Tate normalization included. Here normalized fibre means the weight fibre of the transported normalized dual representation: the geometric cohomological Weil twist must be undone; it is not the unmodified ungraded total-cohomology trace. The corresponding statement for a Levi uses deg_P and the difference ρ_G−ρ_M. For unramified nonsplit G descend this formula using the relative Weyl/Frobenius datum supplied by SR.4; the split integral over N is not copied verbatim with absolute weights.

Proof: The compact-support trace formula on each semi-infinite weight intersection turns CT into the N-integral. Cohomological degree shift gives (-1)^{deg}, and the normalized half twist and Haar modulus give q^{-⟨ρ,λ⟩}. Apply Zhu (2.2.7)–(2.2.10) to the IC weight calculation. Track ordinary character rather than a supercharacter using the parity correction. For nonsplit unramified groups use the Frobenius-equivariant model and relative SR.4 transform; the exact descent/source adapter is an additional proof obligation.

Checks: For a split torus N=1 and δ=1, so the transform is identity on weight indicators. For a split minuscule μ, the coefficient of each extremal weight matches the normalized representation character; omitting the half twist inserts q^{⟨ρ,μ⟩}.

**Sources:** [Gross](#source-gross), §3 pp6–8, equations (3.4), (3.5), (3.6); [Zhu](#source-zhu), §2.2 pp434–436, equations (2.2.7)–(2.2.10).

**Prerequisites:** [Normalized Frobenius function](#normalized-frobenius-function); [Symmetric constant terms](#symmetric-constant-term); [Levi naturality and normalization](#levi-naturality); `SF:SF.2`; `SR:SR.4`; `RG:RG2.5`.

<a id="classical-satake-comparison"></a>

**Classical and geometric Satake comparison** (`classicalSatakeComparison`). For the unramified/hyperspecial finite-field setting, the diagram from Frobenius-descended rational Satake objects to spherical Hecke functions by τ and to normalized dual representations by Satake commutes with the SR.4 spherical transform and Frobenius character on the dual torus. In the split IC basis with its canonical constant-sheaf Frobenius descent, S(τ_{IC_μ})=χ_μ and S(1_{Kμ(π)K})=q^{⟨ρ,μ⟩}χ_μ plus lower dominant characters; for minuscule μ the lower terms vanish. The nonsplit statement uses the appropriate Frobenius-twisted/relative character datum of SR.4. Both constructions precede this comparison; none of integral reconstruction, rational reductivity, SR.4 or fusion depends on it.

Proof: Use the normalized trace/constant-term equality to identify all weight coefficients with the dual character, then apply the already constructed SR.4 isomorphism. The IC leading term is r^{-d_μ} times the top double-coset indicator, so the triangular comparison agrees with Gross (3.9)–(3.13) and Zhu (2.2.7)–(2.2.10). Descend the commuting diagram with Frobenius and the pinned action in the unramified nonsplit case. The nonsplit Frobenius/relative-weight comparison is an additional proof obligation; Gross supplies the split calculation.

Checks: For G_m and weight n both paths give z^n. For PGL₂ minuscule μ, S(r^{-1}1_{Kμ(π)K}) is the SL₂ standard character z+z^{-1}. An unnormalized odd perverse trace would give its negative and fails the comparison.

**Sources:** [Gross](#source-gross), §3 pp7–8, Proposition 3.6 and (3.13); [Zhu](#source-zhu), §2.2 pp434–436, (2.2.7)–(2.2.10).

**Prerequisites:** [Normalized equivalence](#normalized-satake-equivalence); [Frobenius trace and convolution](#trace-convolution); [Frobenius trace and normalized constant terms](#trace-constant-term); [Geometric rational semisimplicity](#rational-semisimplicity); `SR:SR.4`.

## Sources and editions

Page numbers in the result references are printed pages except where explicitly labelled PDF pages. The editions below determine the theorem numbering. The mathematical statements above incorporate the stated coefficient, descent, rank-one and model qualifications.

<a id="source-fs"></a>

**FS.** Laurent Fargues, Peter Scholze, [Geometrization of the local Langlands correspondence](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf). Author-hosted 356-page PDF; PDF page = printed page.

<a id="source-bs"></a>

**BS.** Bhargav Bhatt, Peter Scholze, [Projectivity of the Witt vector affine Grassmannian](https://arxiv.org/abs/1507.06490). arXiv:1507.06490v3, 61-page PDF; PDF page = printed page.

<a id="source-sw"></a>

**SW.** Peter Scholze, Jared Weinstein, [Berkeley Lectures on p-adic Geometry](https://www.math.uni-bonn.de/people/scholze/Berkeley.pdf). Author-hosted Berkeley Lectures PDF dated March 27, 2020; PDF page = printed page + 10.

<a id="source-zhu"></a>

**Zhu.** Xinwen Zhu, [Affine Grassmannians and the geometric Satake in mixed characteristic](https://annals.math.princeton.edu/wp-content/uploads/annals-v185-n2-p02-p.pdf). Published Annals 185 (2017), pp. 403–492; PDF page = printed page − 402.

<a id="source-cs"></a>

**CS.** Ana Caraiani, Peter Scholze, [On the generic part of the cohomology of compact unitary Shimura varieties](https://annals.math.princeton.edu/wp-content/uploads/annals-v186-n3-p01-p.pdf). Published Annals 186 (2017); PDF page = printed page − 648.

<a id="source-glx"></a>

**GLX.** Ian Gleason, Dong Gyu Lim, Yujie Xu, [The connected components of affine Deligne–Lusztig varieties](https://link.springer.com/content/pdf/10.1007/s00222-025-01386-1.pdf). Published Inventiones 243 (2026), pp. 805–861; PDF page = printed page − 804.

<a id="source-vh"></a>

**vH.** Pol van Hoften, [Mod p points on Shimura varieties of parahoric level](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/EC6F7AD8C8B489FEB8FC4D64485ABE1D/S2050508624000222a.pdf/mod_p_points_on_shimura_varieties_of_parahoric_level.pdf). Published Cambridge PDF, PDF pages used as locators.

<a id="source-he"></a>

**He.** Xuhua He, [Cordial elements and dimensions of affine Deligne–Lusztig varieties](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/5A27DBF48CAEF6DA56A313061848574C/S205050862100010Xa.pdf/cordial-elements-and-dimensions-of-affine-delignelusztig-varieties.pdf). Published Forum of Mathematics Pi 9 (2021), e9; PDF page = printed page.

<a id="source-gross"></a>

**Gross.** Benedict H. Gross, [On the Satake isomorphism](https://people.math.harvard.edu/~gross/preprints/sat.pdf). Author preprint, 17 pages; printed and physical pages agree.

<a id="source-py"></a>

**PY.** Gopal Prasad and Jiu-Kang Yu, [On quasi-reductive group schemes](https://math.stanford.edu/~conrad/papers/qrg.pdf). Author-hosted preprint: Corollary 1.3, proof §5.4 p12. FS calls the published result Corollary 5.2; the editions have different numbering.

<a id="source-dm"></a>

**DM.** Pierre Deligne and James S. Milne, [Tannakian categories](https://www.math.columbia.edu/~dejong/tannakian/Deligne-Milne-Tannakian-Categories.pdf). Author-hosted notes revised 15 August 2012; statements numbered 2.20, 2.22, 2.23; pp24–27.

<a id="source-dh"></a>

**DH.** Stephen Doty and Anne Henke, [Decomposition of tensor products of modular irreducibles for SL2](https://arxiv.org/pdf/math/0205186). arXiv:math/0205186v1, 24-page PDF; header dated 16 May 2002, title page dated 28 May 2022; physical and printed pages agree.
