# Geometric Satake: reconstruction, Weil action and trace comparison

**Summary.** Starting from the ULA flat-perverse Satake category and its fusion
fibre functor, reconstruct a flat affine group, recognize its geometric rational
fibre, and identify its integral model with the pinned Langlands dual. Keep the
geometric Weil action visible until its half-Tate correction has been specified.
The resulting finite-projective representation equivalence supplies perfect
Hecke kernels. In the unramified hyperspecial setting, a separate finite-model
Frobenius trace construction agrees with the existing spherical Satake transform.
The trace theorem is downstream of both constructions.

## Conventions and boundaries

Let E be a nonarchimedean local field, with residue field F_q of characteristic p,
and let G/E be connected reductive. Fix a prime ℓ≠p. A torsion coefficient ring is
killed by an integer prime to p; the ℓ-adic version is assembled through compatible
reductions. Objects in the integral Satake category have bounded Schubert support,
are universally locally acyclic over their leg base, and are flat perverse. Their
cohomology fibres are finite projective with continuous Weil action. No assertion
about all perverse sheaves, all derived sheaves, or arithmetic semisimplicity is
included in these conventions.

For a finite leg set I write Sat_G^I(Λ) for this category, with the parity-corrected
fusion tensor. Its total cohomology F^I lands in continuous finite-projective
representations of W_E^I. The finite quotient Q used to describe the pinned action
on the dual group does not replace W_E in this fibre category. Internal duality is
inversion of modifications composed with Verdier duality; inversion alone is a
different tensor operation.

For the trace comparison G is unramified and a reductive O_E-model is fixed, with
K=G(O_E). Use geometric Frobenius. It acts on L(1) by q^−1 and on the chosen
half-Tate stalk by r^−1, where r²=q. Set vol(K)=1 and vol(N(O_E))=1. Positive
valuation sends λ(π) to λ, and the modulus factor is
δ_B(λ(π))^(1/2)=r^−⟨2ρ,λ⟩. These conventions determine every scalar below.
The identification with the Drinfeld-transported root-line character is a separate
specified obligation; the sign of the parameter cocycle is not inferred from a
stalk convention.

The independent inputs have the following owners.

| Input | Owner and exact scope |
| --- | --- |
| Relative Tannaka reconstruction | MotivesAndAlgebraicCycles:MC.6, finite-piece/coalgebra/bialgebra/antipode chain; its general theorem is independent of motives |
| Finite type and connectedness | MC.6 recognition nodes, Deligne–Milne2.20 and2.22, in characteristic zero |
| Reductivity from semisimplicity | Existing ReductiveGroups Layer6, after finite type and connectedness |
| Integral extension, Prasad–Yu and root generation | Current ReductiveGroupsPartII §RG2.3.1 and §RG2.4 |
| Integral dual group and pinned data | Current ReductiveGroupsPartII §RG2.5 and ReductiveGroups Layer9 |
| Tilting modules and highest-weight foundations | LanglandsParameterStacks:LP3; exact extra interfaces below |
| Classifying-stack perfect completion | LP3/LP4, all ℓ≠p, distinct from good-prime parameter-stack generation |
| Geometric six operations and top cycles | EDC.1/EDC.2, imported by exact node IDs |
| Spherical transform and twisted invariant algebra | Current SmoothRepresentationsOfLocalGroups SR4.1 |
| Finite-field trace theorem | SchemeAndStackFoundations:SF.2, integrating its assigned point-counting input |

The 24 GS4 target identifiers already owned by the GS3 plan are retained as
imports. Their contracts, APIs and checks are stated below for a self-contained
reader. The 17 companion nodes refine proof interfaces or add explicitly named
normalization checks. They do not create a second owner for those endpoints.
Every statement is a planning target, with implementation status unchecked.

The order of mathematical dependencies is reconstruction → geometric rational
recognition → integral identification → normalized functoriality → perfect
kernels. The classical trace square follows the normalized theorem and SR4.
There is no return edge from that square into reconstruction, fusion, SR4 or the
geometric decomposition theorem. At the layer level the reconstruction prefix
should occupy the previously proposed GS4:reconstruction sublayer; the stable
node IDs remain unchanged.

## Bounded reconstruction

Use the four MC.6 nodes `relative-finite-piece-reconstruction`,
`relative-coalgebra-assembly`, `relative-bialgebra-reconstruction` and
`relative-rigid-antipode`. GS4 verifies their geometric hypotheses rather than
proving their general categorical conclusions again. In particular it must
produce the coequalizers required by Beck; the integral Satake category is not
assumed abelian.


<a id="tannakian-left-adjoint"></a>

### Bounded left adjoints

**Identifier:** `GeometricSatakeAndFusion:GS4:integral-dual-group/tannakian-left-adjoint`. Imported construction; stable owner: the GS3 plan.

Let W_i⊂X_*(T)^+ be a finite downward-closed Galois-stable bound for each leg and C_W⊂Sat^I its full bounded-support category. The restriction F_W:C_W→Rep_{W_E^I}^{fp}(Λ) has a left adjoint L_W. Put X_W=L_W(1). For each finite projective Weil representation V, L_W(V)≅X_W⊗V (the LocSys action), naturally in V and the bounds. For product bounds, X_{W•} is the fusion product of the singleton X_{W_i}. These are Satake generators, not their dual coordinate coalgebras.

**Hypotheses.**

- E is a nonarchimedean local field with residue field F_q of characteristic p; G/E is connected reductive.

- For torsion coefficients Λ is killed by an integer prime to p. The ℓ-adic extension uses a fixed prime ℓ ≠ p and its compatible reductions.

- Satake objects have bounded support, are universally locally acyclic over the leg base, and are flat perverse; representation objects have finite projective coefficient modules.

**Uses.**

- FS VI.10.2–10.3: The dual fibres of bounded representing objects form the relative coordinate Hopf algebra.

- MC.6 relative-finite-piece-reconstruction: Provides the precise representing objects required by the single-owner abstract criterion.

**API.**

- `TauCeti.GeometricSatake.boundedLeftAdjoint` (constructor): The functor L_W left adjoint to F_W.

- `TauCeti.GeometricSatake.boundedLeftAdjunction` (universal-property): Hom(L_W V,A) ≅ Hom(V,F_W A), naturally in V and A, with triangle identities.

- `TauCeti.GeometricSatake.boundedGenerator` (data): X_W=L_W(1) in the bounded Satake category.

- `TauCeti.GeometricSatake.boundedLeftAdjoint_tensor` (compatibility): L_W(V) ≅ X_W⊗V, coherently for the LocSys action.

- `TauCeti.GeometricSatake.boundedGenerator_fusion` (compatibility): For product bounds the generator is the fusion of singleton generators.

- `TauCeti.GeometricSatake.boundedGenerator_enlarge` (functoriality): For W⊂W′, representability gives X_W′→X_W after the bounded objects are included in Satake. The dual fibre map is (F X_W)^∨→(F X_W′)^∨, the forward arrow in the coordinate-coalgebra diagram.

**Checks.**

- `TauCeti.GeometricSatake.test_generator_zeroBound` (degenerate): For a bound containing only weight zero, the generator is the unit with fibre Λ.

- `TauCeti.GeometricSatake.test_generator_productBound` (compatibility): Two singleton generators fuse to the generator for their product bound, including its adjunction map.

- `TauCeti.GeometricSatake.test_generator_dualOrientation` (non-example): The finite-piece coordinate coalgebra is (F_W X_W)^∨, not F_W X_W. For W⊂W′ its transition map points (F X_W)^∨→(F X_W′)^∨, opposite to X_W′→X_W.

**Proof plan.**

Use the companion proof contracts below: [Bounded projectives and coefficient lifting](#bounded-standard-filtration). These give the current argument and explicitly replace the earlier proof outline; the endpoint keeps its original identifier.

**Acceptance.**

- For the zero-weight bound X_W is the unit.

- Enlarging bounds gives compatible representing maps; it does not assert a single finite object represents the unbounded functor.

**Direct prerequisites.** `GeometricSatakeAndFusion:GS3:fusion/drinfeld-fibre-realization`, `GeometricSatakeAndFusion:GS2:correspondences/satake-category-and-fibre-functor`, `GeometricSatakeAndFusion:GS3:fusion/fusion-product-and-sign-rule`, `GeometricSatakeAndFusion:GS0:loop-geometry/schubert-bounds-and-properness`, `EnhancedDerivedSheaves:E5:presentability/presentable-categories`, `mathlib:CategoryTheory.Adjunction`, `GeometricSatakeAndFusion:GS1/standard-costandard-objects`, `GeometricSatakeAndFusion:GS1/standard-costandard-torsion-bound`, `GeometricSatakeAndFusion:GS2:correspondences/satake-fibre-functor`.

**Sources.** [FS], Proposition VI.10.1 pp230–232: The bounded left adjunction, LocSys linearity, fusion of generators and coefficient control.

**Proof refinements here.** [Bounded projectives and coefficient lifting](#bounded-standard-filtration).



<a id="bounded-standard-filtration"></a>

### Bounded projectives and coefficient lifting

**Identifier:** `GeometricSatakeAndFusion:GS4:integral-dual-group/bounded-standard-filtration`. Companion theorem.

**Refines:** `GeometricSatakeAndFusion:GS4:integral-dual-group/tannakian-left-adjoint`.

For Λ=Z/ℓ^c and a finite downward-closed bound W, the perverse representing object P_W for the restricted geometric total-cohomology functor has a finite filtration with standard subquotients Δ_μ tensored with finite free Λ-modules. Thus P_W is ULA flat perverse and represents the restriction to Satake. Under Λ→Λ′ among the source coefficient rings its representing maps base change, so the bounded adjunction and its finite-projective fibres commute with coefficients. The multileg generator is the fusion product of the single-leg generators.

**Hypotheses.**

- E is a nonarchimedean local field of residue characteristic p, G/E is connected reductive and ℓ≠p.

- For reconstruction use bounded-support ULA flat-perverse Satake objects, the parity-corrected fusion tensor and total cohomology; finite-projective continuous Weil fibres.

- Torsion coefficients are killed by an integer prime to p. ℓ-adic coefficients are obtained through compatible reductions; rational assertions are explicitly geometric.

**Proof plan.**

1. For a maximal μ in W, adjunction against ∇_μ identifies the free coefficient module on its stratum. Self-injectivity of Z/ℓ^c makes the dual coefficient module free. Remove the maximal stratum and use induction on W.

2. The potential kernel K in the standard extension is killed by a uniform ℓ^a from the standard-to-costandard comparison. Repeat the construction over Z/ℓ^(c+a). The transition K′→K is zero by the torsion bound and flat standard term, while coefficient reduction makes it surjective. Hence K=0; this supplies the standard filtration without an integral decomposition theorem.

3. The stratum calculation and representing maps commute with reduction, so uniqueness of adjoints gives the coefficient comparison. Over disjoint legs tensor the adjunctions, then use the full-faithful ULA extension to obtain the multileg assertion.

**Acceptance.**

- W={0} gives the tensor unit and L(V)=V.

- The uniform exponent a is chosen before c; allowing an exponent depending on c would not prove the lifting argument.

- No assertion that arbitrary integral perverse sheaves are semisimple is used.

**Direct prerequisites.** `GeometricSatakeAndFusion:GS1/standard-costandard-objects`, `GeometricSatakeAndFusion:GS1/standard-costandard-torsion-bound`, `GeometricSatakeAndFusion:GS1/relative-perverse-t-structure`, `GeometricSatakeAndFusion:GS3:fusion/disjoint-leg-factorization-and-full-faithfulness`.

**Sources.** [FS], VI.10.1 pp230–232; VI.7.5 pp219–220: The representability proof supplies the maximal-stratum induction and the coefficient-lifting argument.



<a id="relative-tannaka-hypotheses"></a>

### Relative Tannaka hypotheses for Satake

**Identifier:** `GeometricSatakeAndFusion:GS4:integral-dual-group/relative-tannaka-hypotheses`. Imported theorem; stable owner: the GS3 plan.

With A=Rep_{W_E^I}^{fp}(Λ), C=Sat^I_G(Λ), corrected tensor and F^I, verify the hypotheses of MC.6 relative reconstruction: A is rigid symmetric, C is symmetric A-linear, F is strong symmetric A-linear and conservative, C admits coequalizers of F-split pairs and F reflects and preserves these coequalizers, and bounded full subcategories form a filtered cover stable under the A-action and those coequalizers, with restricted F represented by X_W. Sat^I over a general ring is not asserted to be an abelian category.

**Hypotheses.**

- E is a nonarchimedean local field with residue field F_q of characteristic p; G/E is connected reductive.

- For torsion coefficients Λ is killed by an integer prime to p. The ℓ-adic extension uses a fixed prime ℓ ≠ p and its compatible reductions.

- Satake objects have bounded support, are universally locally acyclic over the leg base, and are flat perverse; representation objects have finite projective coefficient modules.

**Proof plan.**

Use the companion proof contracts below: [Split coequalizers for relative reconstruction](#split-coequalizer-adapter). These give the current argument and explicitly replace the earlier proof outline; the endpoint keeps its original identifier.

**Acceptance.**

- The relative base A retains all Weil local systems; it is not replaced by Vect or assumed semisimple.

- A nonsplit exact sequence of finite projective coefficient modules is not treated as an unrestricted cokernel construction in Satake.

**Direct prerequisites.** `GeometricSatakeAndFusion:GS4:integral-dual-group/tannakian-left-adjoint`, `GeometricSatakeAndFusion:GS3:fusion/fusion-product-and-sign-rule`, `GeometricSatakeAndFusion:GS3:fusion/fusion-verdier-duality`, `GeometricSatakeAndFusion:GS2:correspondences/satake-category-and-fibre-functor`, `GeometricSatakeAndFusion:GS2:Satake-closure/convolution-preserves-satake-and-dualizability`, `MotivesAndAlgebraicCycles:MC.6/relative-finite-piece-reconstruction`, `MotivesAndAlgebraicCycles:MC.6/relative-coalgebra-assembly`, `MotivesAndAlgebraicCycles:MC.6/relative-bialgebra-reconstruction`, `MotivesAndAlgebraicCycles:MC.6/relative-rigid-antipode`, `mathlib:CategoryTheory.Monad.HasCoequalizerOfIsSplitPair`, `mathlib:CategoryTheory.Monad.PreservesColimitOfIsSplitPair`, `mathlib:CategoryTheory.Monad.ReflectsColimitOfIsSplitPair`, `GeometricSatakeAndFusion:GS2:correspondences/satake-fibre-functor`.

**Sources.** [FS], VI.10.2–10.3 pp232–235; VI.7.10 pp222–223: Matches the abstract MC chain and identifies the preservation hypothesis needing verification.

**Proof refinements here.** [Split coequalizers for relative reconstruction](#split-coequalizer-adapter).



<a id="split-coequalizer-adapter"></a>

### Split coequalizers for relative reconstruction

**Identifier:** `GeometricSatakeAndFusion:GS4:integral-dual-group/split-coequalizer-adapter`. Companion comparison.

**Refines:** `GeometricSatakeAndFusion:GS4:integral-dual-group/relative-tannaka-hypotheses`.

For an F-split parallel pair u,v:A⇉B in Satake, form f=u−v in the ambient perverse heart. Its fibre cokernel is a direct summand of F(B) and is finite projective. VI.7.10 therefore constructs Q=coker(f) in the ULA flat-perverse subcategory. B→Q is the coequalizer there, F carries it to the split coequalizer, and F reflects such colimit cocones. Consequently the exact MC.6 relative reconstruction hypotheses are satisfied on each enlarged support bound.

**Hypotheses.**

- E is a nonarchimedean local field of residue characteristic p, G/E is connected reductive and ℓ≠p.

- For reconstruction use bounded-support ULA flat-perverse Satake objects, the parity-corrected fusion tensor and total cohomology; finite-projective continuous Weil fibres.

- Torsion coefficients are killed by an integer prime to p. ℓ-adic coefficients are obtained through compatible reductions; rational assertions are explicitly geometric.

**Proof plan.**

1. Use the F-split fork to split the fibre quotient and its image; apply VI.7.10 to the cokernel. A quotient of a bounded-support object has that support bound, and its finite-projective fibre gives the requisite flatness.

2. The Satake category is a full subcategory of the perverse category, so the ambient cokernel universal property restricts to it. Exactness of total cohomology identifies its fibre with the split quotient, establishing preservation.

3. Given any candidate cocone whose F-image is the coequalizer, compare it with Q. The induced map becomes an isomorphism under F; conservativity makes it an isomorphism in Satake, establishing reflection. This is the preservation-and-reflection input of Beck, not mere reflection of isomorphisms alone.

**Acceptance.**

- A split epimorphism has its usual quotient.

- An arbitrary perverse cokernel with nonprojective fibre is outside the assertion.

- Compare the three separate pinned Beck classes rather than claiming they are interchangeable.

**Direct prerequisites.** `GeometricSatakeAndFusion:GS4:integral-dual-group/bounded-standard-filtration`, `GeometricSatakeAndFusion:GS2:correspondences/satake-fibre-functor`, `MotivesAndAlgebraicCycles:MC.6/relative-finite-piece-reconstruction`, `mathlib:CategoryTheory.Monad.HasCoequalizerOfIsSplitPair`, `mathlib:CategoryTheory.Monad.PreservesColimitOfIsSplitPair`, `mathlib:CategoryTheory.Monad.ReflectsColimitOfIsSplitPair`.

**Sources.** [FS], VI.7.10 p222; VI.10.2 pp232–234: The direct-summand criterion supplies the categorical coequalizers; the relative reconstruction theorem consumes them.



<a id="geometric-coordinate-hopf-algebra"></a>

### Geometric Satake coordinate Hopf algebra

**Identifier:** `GeometricSatakeAndFusion:GS4:integral-dual-group/geometric-coordinate-hopf-algebra`. Imported construction; stable owner: the GS3 plan.

Apply the imported MC.6 relative reconstruction to Satake. In Ind(A), define H^I_Λ=colim_W (F_W X_W)^∨. It has a canonical commutative bialgebra structure from tensor products and an antipode from Satake rigidity. The comparison is a symmetric equivalence Sat^I_G(Λ)≃Comod_{A,underlying A}(H^I_Λ). Forgetting W_E^I gives an ordinary flat coordinate Hopf algebra and hence an affine flat group scheme G^∨,I_Λ. This reconstructs H from the Satake category; the baseline known-Hopf tensorAutFunctor is only a compatibility comparison once H is constructed.

**Hypotheses.**

- E is a nonarchimedean local field with residue field F_q of characteristic p; G/E is connected reductive.

- For torsion coefficients Λ is killed by an integer prime to p. The ℓ-adic extension uses a fixed prime ℓ ≠ p and its compatible reductions.

- Satake objects have bounded support, are universally locally acyclic over the leg base, and are flat perverse; representation objects have finite projective coefficient modules.

**Uses.**

- FS VI.11.1: The affine group whose geometric fibre and integral model must be identified.

- Normalized Satake equivalence: Comodule reconstruction supplies the finite-projective representation category before pinned identification.

**API.**

- `TauCeti.GeometricSatake.satakeCoordinateHopf` (constructor): H^I_Λ is the filtered colimit of dual bounded-generator fibres, with its commutative Hopf structure.

- `TauCeti.GeometricSatake.satakeCoaction` (data): Every A has its functorial H-coaction on F^I(A).

- `TauCeti.GeometricSatake.satakeComoduleEquivalence` (equivalence): The comparison is a symmetric equivalence with H-comodules whose underlying object is in A.

- `TauCeti.GeometricSatake.satakeCoordinateHopf_tensor` (structure): Tensor of coactions uses the Hopf multiplication, and the unit coaction uses its unit.

- `TauCeti.GeometricSatake.satakeCoordinateHopf_antipode` (compatibility): The coaction on the internal dual is obtained using the antipode; both antipode identities hold.

**Checks.**

- `TauCeti.GeometricSatake.test_hopf_trivialGroup` (degenerate): For the trivial G, H=Λ and the geometric affine group is the trivial group.

- `TauCeti.GeometricSatake.test_hopf_torus` (computation): For split T, H=Λ[X_*(T)], with Δ(e^μ)=e^μ⊗e^μ and counit(e^μ)=1.

- `TauCeti.GeometricSatake.test_hopf_torusAntipode` (computation): The torus antipode sends e^μ to e^{-μ}; using the identity antipode fails for a nonzero G_m weight.

**Proof plan.**

1. Use the four exact MC.6 nodes for finite-piece reconstruction, filtered coalgebra assembly, multiplication and antipode. Do not replan those abstract theorems here.

2. Each dual fibre is finite projective; its filtered colimit is flat. Tensor compatibility yields commutativity and unit/counit; rigidity supplies the antipode equations.

3. The comparison restricts to comodules whose underlying object lies in A, precisely retaining finite projectivity and continuous Weil action. Compare with the existing known-Hopf reconstruction only after extending to a field where its hypotheses hold.

4. Apply the corrected VI.10.2 wording: obtain a bialgebra first, then an antipode on H under rigidity; do not apply an inverse to the base category A. See the known source slips recorded below.

**Acceptance.**

- Weight-zero bounds contribute the coefficient unit; a split torus gives Λ[X_*(T)].

- The antipode restricts to e^μ↦e^{-μ} for a torus.

- The group over Λ is affine flat; finite type and reductivity require separate arguments.

**Direct prerequisites.** `GeometricSatakeAndFusion:GS4:integral-dual-group/relative-tannaka-hypotheses`, `MotivesAndAlgebraicCycles:MC.6/relative-coalgebra-assembly`, `MotivesAndAlgebraicCycles:MC.6/relative-bialgebra-reconstruction`, `MotivesAndAlgebraicCycles:MC.6/relative-rigid-antipode`, `EnhancedDerivedSheaves:E5:presentability/ind-completion`, `mathlib:HopfAlgebra`, `mathlib:Bialgebra`, `tauceti:TauCeti.AffineGroupSchemeCat`, `tauceti:TauCeti.Tannaka.tensorAutFunctor`, `tauceti:TauCeti.Tannaka.pointsFunctorIsoTensorAutFunctor`, `mathlib:CategoryTheory.Limits.HasColimit`.

**Sources.** [FS], Propositions VI.10.2–VI.10.3 pp232–235: Relative reconstruction and its application; the coordinate object uses the dual of the bounded represented fibre.



<a id="multileg-and-coefficient-reconstruction"></a>

### Multileg and coefficient reconstruction

**Identifier:** `GeometricSatakeAndFusion:GS4:integral-dual-group/multileg-and-coefficient-reconstruction`. Imported theorem; stable owner: the GS3 plan.

There are canonical Hopf isomorphisms H^I_Λ≅⊗_{i∈I}H^{i}_Λ and H^I_Λ⊗_ΛΛ′≅H^I_{Λ′} for the source coefficient changes. They commute with leg permutations, fusion/collision maps, comultiplication, counit and antipode. First work modulo ℓ^c, assemble compatible levels to construct H_{Z_ℓ} and its affine flat group, and recover torsion coefficient rings by base change. Prime-to-p finite coefficient decompositions are assembled componentwise. This is an ℓ-adic reconstruction theorem, not an integral decomposition theorem.

**Hypotheses.**

- E is a nonarchimedean local field with residue field F_q of characteristic p; G/E is connected reductive.

- For torsion coefficients Λ is killed by an integer prime to p. The ℓ-adic extension uses a fixed prime ℓ ≠ p and its compatible reductions.

- Satake objects have bounded support, are universally locally acyclic over the leg base, and are flat perverse; representation objects have finite projective coefficient modules.

**Proof plan.**

Use the companion proof contracts below: [Finite pieces in adic reconstruction](#adic-coordinate-pieces). These give the current argument and explicitly replace the earlier proof outline; the endpoint keeps its original identifier.

**Acceptance.**

- For I=∅ the empty tensor is Λ.

- For I={1,2}, interchanging factors is the ordinary Hopf flip after the parity correction.

- Reduction of the Z_ℓ group modulo ℓ^c equals the directly reconstructed group, for every c≥1.

**Direct prerequisites.** `GeometricSatakeAndFusion:GS4:integral-dual-group/tannakian-left-adjoint`, `GeometricSatakeAndFusion:GS4:integral-dual-group/geometric-coordinate-hopf-algebra`, `GeometricSatakeAndFusion:GS3:fusion/finite-set-functoriality-and-constant-terms`, `GeometricSatakeAndFusion:GS2:correspondences/satake-category-and-fibre-functor`, `mathlib:Module.Flat`, `GeometricSatakeAndFusion:GS1/standard-costandard-torsion-bound`, `GeometricSatakeAndFusion:GS2:correspondences/satake-fibre-functor`.

**Sources.** [FS], VI.10.3 pp234–235; VI.11.1 proof p235: The product statement, coefficient compatibility and reduction to the ℓ-adic group are stated and used here.

**Proof refinements here.** [Finite pieces in adic reconstruction](#adic-coordinate-pieces).



<a id="adic-coordinate-pieces"></a>

### Finite pieces in adic reconstruction

**Identifier:** `GeometricSatakeAndFusion:GS4:integral-dual-group/adic-coordinate-pieces`. Companion comparison.

**Refines:** `GeometricSatakeAndFusion:GS4:integral-dual-group/multileg-and-coefficient-reconstruction`.

Write the Satake coordinate algebra as the filtered colimit of dual bounded fibres. For a fixed bound W the compatible finite-free systems (F_W X_W)^∨ over Z/ℓ^c lift to a finite-free Z_ℓ-module with the compatible structure maps. Construct the algebraic Hopf algebra over Z_ℓ by taking the filtered colimit of these lifted pieces, with tensor operations defined after enlarging bounds. Its reduction and rationalization give the reconstructed coefficient Hopf algebras. The algebraic coordinate ring is not defined as the unqualified inverse limit of the whole torsion coordinate rings.

**Hypotheses.**

- E is a nonarchimedean local field of residue characteristic p, G/E is connected reductive and ℓ≠p.

- For reconstruction use bounded-support ULA flat-perverse Satake objects, the parity-corrected fusion tensor and total cohomology; finite-projective continuous Weil fibres.

- Torsion coefficients are killed by an integer prime to p. ℓ-adic coefficients are obtained through compatible reductions; rational assertions are explicitly geometric.

**Proof plan.**

1. Use the bounded coefficient adjunction comparison before dualizing. Fixed finite rank and compatible basis lifting identify each piece with the inverse limit of its reductions.

2. For multiplication choose a common enlarged tensor-support bound, lift the finite-piece maps, and check identities modulo every ℓ^c. Finite-free separatedness proves the identities integrally. Pass to the filtered colimit only after this step.

3. Reduction commutes with filtered colimits and finite-projective duals. Tensor products handle the finite leg set; prime-to-p torsion rings decompose by CRT. Flatness follows from the filtered colimit of finite-free modules.

**Acceptance.**

- For a torus recover Z_ℓ[X_*(T)] with finite Laurent sums.

- The ℓ-adic completion of Z_ℓ[x,x^−1] contains convergent infinite Laurent sums; it is not substituted for the algebraic torus coordinate ring.

- The empty leg set gives the coefficient ring with the unit Hopf structure.

**Direct prerequisites.** `GeometricSatakeAndFusion:GS4:integral-dual-group/geometric-coordinate-hopf-algebra`, `GeometricSatakeAndFusion:GS4:integral-dual-group/bounded-standard-filtration`, `MotivesAndAlgebraicCycles:MC.6/relative-coalgebra-assembly`, `MotivesAndAlgebraicCycles:MC.6/relative-bialgebra-reconstruction`, `MotivesAndAlgebraicCycles:MC.6/relative-rigid-antipode`, `mathlib:Module.Flat`, `mathlib:HopfAlgebra`, `mathlib:Bialgebra`.

**Sources.** [FS], VI.10.3 pp234–235: The coefficient and leg compatibilities are applied at the bounded representing objects, keeping the resulting group algebraic.



The dualization in H=colim_W(F_W X_W)^∨ matters: X_W is a representing
Satake object, not a coordinate coalgebra. Likewise, taking inverse limits of the
whole torsion coordinate algebra would complete the affine group and change the
object being reconstructed. The finite-piece construction is the algebraic one.

## Geometric rational recognition

Apply rational decomposition only on the finite-type proper models/resolutions
of bounded Witt Schubert spaces over an algebraic closure of a finite field.
Transport through perfection and the integral-family comparison. This is the
late EDC.7 input; it is not used to construct the early Schubert geometry or to
prove EDC.7 itself. The rational category in this section forgets Weil descent.


<a id="rational-semisimplicity"></a>

### Geometric rational semisimplicity

**Identifier:** `GeometricSatakeAndFusion:GS4:rational-reductivity/rational-semisimplicity`. Imported theorem; stable owner: the GS3 plan.

After forgetting Weil descent and taking a geometric splitting fibre, the rational Satake category is the direct sum over dominant μ of copies of finite-dimensional Q_ℓ-vector spaces generated by the simple IC_μ. For each bounded object the sum is finite. Convolution of the IC objects is semisimple. EDC.7 is applied on finite-type proper models/resolutions of bounded Witt Schubert perfections over an algebraic closure of a finite field and transported through perfection and the integral-family comparison. No semisimplicity of Weil representations, integral Satake objects or mod-ℓ Satake objects follows.

**Hypotheses.**

- E is a nonarchimedean local field with residue field F_q of characteristic p; G/E is connected reductive.

- For torsion coefficients Λ is killed by an integer prime to p. The ℓ-adic extension uses a fixed prime ℓ ≠ p and its compatible reductions.

- Satake objects have bounded support, are universally locally acyclic over the leg base, and are flat perverse; representation objects have finite projective coefficient modules.

**Proof plan.**

1. Use VI.6.7 to transport geometric Satake to the Witt fibre. Equivariance and connected Schubert stabilizers make simple equivariant local systems constant, so simples are IC_μ.

2. Import the rational decomposition theorem on proper finite-type models, using Demazure/affine-flag parity and the IC boundary bounds in VI.7.5. Zhu Lemma 2.1 and Proposition 2.2 give the rational mixed-characteristic semisimple calculation.

3. Transport the resulting splitting through perfection and the ULA comparison. Preserve geometric/Weil distinction throughout.

**Acceptance.**

- The minuscule PGL2 object is the shifted constant sheaf on P¹ and is geometrically simple.

- Nontrivial unipotent continuous Weil actions can give nonsplit local systems even over Q_ℓ; these do not contradict geometric semisimplicity.

**Direct prerequisites.** `GeometricSatakeAndFusion:GS1/integral-family-comparison`, `GeometricSatakeAndFusion:GS0:loop-geometry/schubert-bounds-and-properness`, `GeometricSatakeAndFusion:GS1/relative-perverse-t-structure`, `GeometricSatakeAndFusion:GS2:correspondences/satake-category-and-fibre-functor`, `GeometricSatakeAndFusion:GS3:fusion/fusion-product-and-sign-rule`, `EtaleDualityAndPerverseSheaves:EDC.7`, `GeometricSatakeAndFusion:GS1/standard-costandard-torsion-bound`, `GeometricSatakeAndFusion:GS2:Satake-closure/one-leg-satake-comparison`, `GeometricSatakeAndFusion:GS0:Witt-geometry/perfect-model-and-etale-comparison`.

**Sources.** [FS], VI.7.5 pp219–221; VI.11.1 proof pp235–236: The geometric rational IC splitting used to recognize the generic group. [Zhu], Lemma 2.1 p430 and Proposition 2.2 p432; context pp430–432: Independent rational Witt-fibre calculation, with scheme decomposition as an imported input.



<a id="generic-fibre-reductivity"></a>

### Reductivity of the generic Satake group

**Identifier:** `GeometricSatakeAndFusion:GS4:rational-reductivity/generic-fibre-reductivity`. Imported theorem; stable owner: the GS3 plan.

The geometric generic fibre G^∨_{Q_ℓ} is a connected reductive group of finite type. Finite dominant-monoid generators give a tensor generator (including its dual), so MC.6/DM 2.20 gives finite type. For every nontrivial IC highest weight the highest weights nμ in tensor powers grow, ruling out a nontrivial finite tensor hull; MC.6/DM 2.22 gives connectedness. Having established finite type and connectedness, use geometric semisimplicity and the characteristic-zero reductivity criterion from the existing ReductiveGroups owner. DM 2.23 also expresses the semisimplicity criterion as proreductivity; no additional general pro-group theorem is assigned to the upstream finite-type stage.

**Hypotheses.**

- E is a nonarchimedean local field with residue field F_q of characteristic p; G/E is connected reductive.

- For torsion coefficients Λ is killed by an integer prime to p. The ℓ-adic extension uses a fixed prime ℓ ≠ p and its compatible reductions.

- Satake objects have bounded support, are universally locally acyclic over the leg base, and are flat perverse; representation objects have finite projective coefficient modules.

**Proof plan.**

Use the companion proof contracts below: [Geometric finite-type and connectedness tests](#geometric-rational-recognition). These give the current argument and explicitly replace the earlier proof outline; the endpoint keeps its original identifier.

**Acceptance.**

- For G a split torus the group is its dual torus, not a semisimple group.

- Semisimplicity alone would allow disconnected or infinite proreductive groups; the preceding two recognition steps are necessary.

**Direct prerequisites.** `GeometricSatakeAndFusion:GS4:rational-reductivity/rational-semisimplicity`, `GeometricSatakeAndFusion:GS4:integral-dual-group/geometric-coordinate-hopf-algebra`, `MotivesAndAlgebraicCycles:MC.6/tannaka-finiteness-recognition`, `MotivesAndAlgebraicCycles:MC.6/tannaka-connectedness-recognition`, `tauceti:TauCetiRoadmap/ReductiveGroups#layer-6-reductive-and-semisimple-groups`, `ReductiveGroupsPartII:RG2.5`, `tauceti:TauCeti.reductiveAffineGroupSchemeProperty`.

**Sources.** [FS], VI.11.1 proof pp235–236: Source proof separates finite type, connectedness and reductivity. [DM], Proposition 2.20, Corollary 2.22 and Proposition 2.23 pp24–27: General criteria are imported from their single owners, and used with characteristic zero. [Zhu], §2.5 p454, first paragraph: For the rational Witt category Zhu obtains a connected reductive Tannakian group by the same finite-type, connectedness and semisimplicity argument; the rational Witt node below identifies his group with this generic fibre.

**Proof refinements here.** [Geometric finite-type and connectedness tests](#geometric-rational-recognition).



<a id="geometric-rational-recognition"></a>

### Geometric finite-type and connectedness tests

**Identifier:** `GeometricSatakeAndFusion:GS4:rational-reductivity/geometric-rational-recognition`. Companion comparison.

**Refines:** `GeometricSatakeAndFusion:GS4:rational-reductivity/generic-fibre-reductivity`.

On a geometric splitting fibre, the rational Satake category is semisimple with simples IC_μ indexed by dominant coweights. Finite generators of the dominant monoid and their duals tensor-generate this category under subquotients, so its Tannakian group is finite type. Any nontrivial simple has nonzero highest weight μ and tensor powers with distinct highest weights nμ, so it cannot generate a finite tensor subcategory. In characteristic zero the connectedness criterion therefore makes the group connected. The existing characteristic-zero reductive/linearly-reductive theorem then makes this finite-type group reductive. This concerns the geometric group, after forgetting Weil descent.

**Hypotheses.**

- E is a nonarchimedean local field of residue characteristic p, G/E is connected reductive and ℓ≠p.

- For reconstruction use bounded-support ULA flat-perverse Satake objects, the parity-corrected fusion tensor and total cohomology; finite-projective continuous Weil fibres.

- Torsion coefficients are killed by an integer prime to p. ℓ-adic coefficients are obtained through compatible reductions; rational assertions are explicitly geometric.

**Proof plan.**

1. The highest-weight constituent of IC_μ⋆IC_ν is IC_(μ+ν). A finite generating set for the rational polyhedral dominant monoid therefore reaches every simple; adjoining duals gives the required tensor generator for DM2.20.

2. For every nonunit simple, nμ grows in the torsion-free coweight lattice. The characteristic-zero finite-hull test DM2.22 rules out a nontrivial finite quotient of the reconstructed group. Apply this only after the MC.6 recognition hypotheses are checked.

3. Import the finite-type characteristic-zero reductivity criterion of ReductiveGroups Layer6. A nontrivial unipotent arithmetic Frobenius action on a constant multiplicity space is not ruled out by geometric semisimplicity.

**Acceptance.**

- For G a torus, the simples are its lattice characters and the reconstructed group is the connected dual torus.

- A two-dimensional trivial geometric object may have a unipotent Frobenius matrix; arithmetic semisimplicity is not a conclusion.

- Do not apply the characteristic-zero connectedness or reductivity tests to a mod-ℓ fibre.

**Direct prerequisites.** `GeometricSatakeAndFusion:GS4:rational-reductivity/rational-semisimplicity`, `GeometricSatakeAndFusion:GS4:integral-dual-group/geometric-coordinate-hopf-algebra`, `MotivesAndAlgebraicCycles:MC.6/tannaka-finiteness-recognition`, `MotivesAndAlgebraicCycles:MC.6/tannaka-connectedness-recognition`, `ReductiveGroupsPartII:RG2.5`, `tauceti:TauCetiRoadmap/ReductiveGroups#layer-6-reductive-and-semisimple-groups`.

**Sources.** [FS], VI.11.1 pp235–236: The geometric semisimple category gives finite type, connectedness and reductivity before integral recovery. [DM], §2, Proposition2.20 pp24–25, Corollary2.22 p26, Proposition2.23 pp26–27: The general recognition theorems are imported from MC.6; this node verifies their Satake hypotheses.



<a id="witt-rational-tannakian-category"></a>

### Rational Witt Satake category as a neutral Tannakian category

**Identifier:** `GeometricSatakeAndFusion:GS4:rational-reductivity/witt-rational-tannakian-category`. Imported comparison; stable owner: the GS3 plan.

Let Sat^Witt_G be Zhu's category P_{L⁺G}(Gr_G) of L⁺G-equivariant perverse Q̄_ℓ-sheaves with bounded support on the Witt vector affine Grassmannian of G over k, with convolution ⋆, unit IC_0 and total cohomology H*. (i) The one-leg comparison over Spd k identifies Sat^Witt_G, compatibly with ⋆ and H*, with the Q̄_ℓ-linear idempotent completion of the rationalization Sat_G(Hck_{Spd k}, Z_ℓ) ⊗ Q̄_ℓ (Hom groups tensored with Q̄_ℓ). (ii) Transporting the parity-corrected fusion symmetry and the Satake duals through (i) makes Sat^Witt_G a semisimple rigid symmetric monoidal abelian category with End(IC_0) = Q̄_ℓ, and H* an exact faithful symmetric monoidal functor to finite-dimensional Q̄_ℓ-vector spaces with the ordinary flip; thus (Sat^Witt_G, H*) is a neutral Tannakian category. (iii) Its Tannakian group Aut^⊗(H*) is canonically the base change to Q̄_ℓ of the generic fibre of the Satake group of Spd k, and so is a connected reductive group of finite type. The monoidal structure on H* is the one transported from fusion; it is not identified with the structure of Zhu's Proposition 2.20.

**Hypotheses.**

- E is a finite extension of Q_p with residue field F_q; k is an algebraic closure of F_q; O = W(k) ⊗_{W(F_q)} O_E, the integers of the completed maximal unramified extension of E, which is totally ramified over W(k).

- G is a split connected reductive group over O_E, and also denotes its base change to O. ℓ ≠ p, and Q̄_ℓ is the union of the finite extensions of Q_ℓ.

- Zhu allows any algebraically closed k and any finite totally ramified F over W(k)[1/p]. For k an algebraic closure of F_p every such F is the completed maximal unramified extension of a finite extension E of Q_p (finite extensions of the completion of the henselian field Q_p^ur come from finite extensions of Q_p^ur), and every reductive group over the strictly henselian ring O is split, so the comparison route covers Zhu's setting for this k. For a larger algebraically closed k it is not covered here (gap "Zhu's equivalence outside the FS comparison").

**Proof plan.**

1. Zhu's ring W_O(R) = W(R) ⊗_{W(k)} O equals W(R) ⊗_{W(F_q)} O_E, so his Gr_G is the Witt vector affine Grassmannian of G over k. Over Spd k the local Hecke stack has the Witt Grassmannian as its underlying diamond, and Scholze's full embedding of étale sheaves on perfect schemes identifies its perverse objects with Zhu's L⁺G-equivariant perverse sheaves (FS p219). Compatibility with convolution, the unit and duals comes from the one-leg comparison node, and with total cohomology from the Satake cohomology functor.

2. Pass to rational coefficients through the rational lattice category, whose Hom groups are the integral Hom groups tensored with Q_ℓ; the perverse t-structure passes to this localisation, so rationalised Satake objects are perverse and their Hom groups in the heart are the integral ones tensored with Q_ℓ. Then pass to Q̄_ℓ as a colimit over finite extensions. Every simple IC_μ is in the image: the rational standard object of μ has simple top IC_μ and no maps to objects supported on smaller strata, so by geometric semisimplicity it equals IC_μ.

3. Transport the corrected fusion braiding, the unit and the Satake duals sw*D through (i). Semisimplicity and End(IC_0) = Q̄_ℓ come from geometric rational semisimplicity; exactness and faithfulness of H* from the Satake fibre functor. Apply neutral Tannaka reconstruction.

4. The bounded left adjoints commute with change of coefficients, so the coordinate Hopf algebra of (Sat^Witt_G, H*) is the scalar extension of the integral Satake Hopf algebra of Spd k. Its group is the generic fibre of the integral Satake group, which is connected reductive by the generic reductivity node. Zhu reaches the same conclusion through the argument of Mirković–Vilonen §7 applied to his own constraint; that route belongs to the Part II design.

**Acceptance.**

- For a split torus T: Gr_T is discrete with points X_*(T); an object of Sat^Witt_T is a finitely supported family (V_λ) of finite-dimensional Q̄_ℓ-spaces, H* sends it to ⊕_λ V_λ, and Aut^⊗(H*) = T̂.

- For G = PGL₂ the minuscule object is Q̄_ℓ[1] on P¹, and H* of it is two-dimensional, in degrees −1 and 1.

- Without the parity correction two odd objects would be exchanged with a Koszul sign under H*, and the reconstruction would be a super-Tannakian category rather than a neutral Tannakian one.

**Direct prerequisites.** `GeometricSatakeAndFusion:GS2:Satake-closure/one-leg-satake-comparison`, `GeometricSatakeAndFusion:GS1/integral-family-comparison`, `AdicCoefficientsAndComparisons:L0/rational-constructible-coefficients`, `GeometricSatakeAndFusion:GS2:correspondences/satake-fibre-functor`, `GeometricSatakeAndFusion:GS2:Satake-closure/satake-rigidity`, `GeometricSatakeAndFusion:GS3:fusion/fusion-product-and-sign-rule`, `GeometricSatakeAndFusion:GS4:rational-reductivity/rational-semisimplicity`, `GeometricSatakeAndFusion:GS4:rational-reductivity/generic-fibre-reductivity`, `GeometricSatakeAndFusion:GS4:integral-dual-group/multileg-and-coefficient-reconstruction`, `MotivesAndAlgebraicCycles:MC.6/neutral-tannaka-reconstruction`, `GeometricSatakeAndFusion:GS1/standard-costandard-torsion-bound`.

**Sources.** [Zhu], §2 opening p429; §2.1.1 p430; §2.5 p454, first paragraph: Standing hypotheses (k algebraically closed, G connected reductive over O), the definition of the Satake category as a colimit over bounded pieces, and the statement that it is a neutral Tannakian category with fibre functor H* whose group is connected reductive. [FS], VI.7 p219 after the proof of Proposition VI.7.4; Remark I.2.14 p17: Identifies perverse sheaves on the local Hecke stack over Spd k with Zhu's equivariant perverse sheaves on the Witt Grassmannian, and notes that the degeneration gives a new proof of Zhu's theorem.



For the Witt comparison, k is an algebraic closure of F_q, E is a finite
extension of Q_p and O=W(k)⊗_(W(F_q))O_E. G is split over this strictly henselian
coefficient trait. Rationalizing the integral Satake category means tensoring
Hom groups with Q̄_ℓ and taking the Q̄_ℓ-linear idempotent completion; the
symmetric structure on H* is transported from fusion. Zhu's arbitrary
algebraically closed k and independently constructed monoidal constraint are
covered by the separate rational Gelfand-proof continuation brief, not silently
identified with this comparison.

## Integral dual group and normalized functoriality

Torus weights and the minuscule PGL₂ calculation identify the geometric generic
root datum. Integral recovery requires a special-fibre argument as well. At
ℓ=2 the highest-weight uniqueness condition in FS VI.11.2 admits N(T), so the
extra invariant calculation below is part of the integral proof.


<a id="torus-and-rank-one-identification"></a>

### Torus and rank-one identification

**Identifier:** `GeometricSatakeAndFusion:GS4:integral-dual-group/torus-and-rank-one-identification`. Imported theorem; stable owner: the GS3 plan.

For a split torus T, Sat_T is the category of finitely supported X_*(T)-graded finite projective Weil representations and G^∨_T is its dual torus. Constant terms give a closed immersion of this torus into G^∨_G. For G=PGL₂ the minuscule Schubert variety is P¹, its fibre is Z_ℓ⊕Z_ℓ(-1) with torus weights ±1, and the generic fibre G^∨_{Q_ℓ} is SL(Q_ℓ⊕Q_ℓ(-1)) with geometric root line Q_ℓ(1). The integral and special-fibre statement is the separate node rank-one-integral-identification. For general semisimple rank one recover the central/component grading by the diagonalizable group with character group π₁(G), which can have torsion.

**Hypotheses.**

- E is a nonarchimedean local field with residue field F_q of characteristic p; G/E is connected reductive.

- For torsion coefficients Λ is killed by an integer prime to p. The ℓ-adic extension uses a fixed prime ℓ ≠ p and its compatible reductions.

- Satake objects have bounded support, are universally locally acyclic over the leg base, and are flat perverse; representation objects have finite projective coefficient modules.

**Proof plan.**

1. The torus calculation is the character grading and group-algebra Hopf computation. For each top Schubert weight its rank-one weight quotient gives the closed torus immersion.

2. For PGL₂ use H⁰/H² of P¹, evaluation and determinant: the torus acts with weights ±1, so G^∨ maps to SL(Z_ℓ⊕Z_ℓ(-1)). The generic fibre is connected reductive of rank one, the minuscule object tensor-generates, so this representation is faithful, and the group is not a torus because the representation is irreducible of dimension two. So G^∨_{Q_ℓ} → SL₂ is a closed immersion of a three-dimensional connected group, hence an isomorphism, with geometric root pinning.

3. The map to G_ad is componentwise an isomorphism on Grassmannians; refinement of π₁(G_ad)-grading to π₁(G)-grading recovers the central diagonalizable factor.

**Acceptance.**

- For G=G_m the weight n gives the character z↦z^n.

- For G=PGL₂ the generic group is SL₂, not PGL₂: the minuscule representation is two-dimensional with weights ±1.

- For G=PGL₂ the component group Z/2 corresponds to μ₂, which is diagonalizable and not a torus.

**Direct prerequisites.** `GeometricSatakeAndFusion:GS3:fusion/symmetric-constant-term`, `GeometricSatakeAndFusion:GS3:fusion/fusion-verdier-duality`, `GeometricSatakeAndFusion:GS4:integral-dual-group/multileg-and-coefficient-reconstruction`, `GeometricSatakeAndFusion:GS4:rational-reductivity/generic-fibre-reductivity`, `ReductiveGroupsPartII:RG2.5`, `tauceti:TauCetiRoadmap/ReductiveGroups#layer-9-pinned-chevalleydemazure-group-schemes-over-ℤ`, `mathlib:RootPairing`.

**Sources.** [FS], VI.11.1 proof pp235–237: Torus case and generic rank-one calculation; the component-grading statement uses source issue E25. [Zhu], §2.5 p454, second paragraph: The rational Witt torus case: the Grassmannian of a torus is the discrete set of coweights, its Satake category is graded vector spaces and the Tannakian group is the dual torus.



<a id="rank-one-integral-identification"></a>

### Integral rank-one identification

**Identifier:** `GeometricSatakeAndFusion:GS4:integral-dual-group/rank-one-integral-identification`. Imported theorem; stable owner: the GS3 plan.

For G = PGL₂ and every ℓ ≠ p, the representation on the fibre Z_ℓ⊕Z_ℓ(-1) of the minuscule object is an isomorphism G^∨_{Z_ℓ} ≅ SL(Z_ℓ⊕Z_ℓ(-1)). Its special fibre G^∨_{F_ℓ} → SL₂ is surjective. The image H contains the diagonal torus T and its irreducibles are separated by highest weights in Z≥0; for ℓ odd this forces H = SL₂ (VI.11.2). For ℓ = 2 these properties leave the case that the reduced subgroup of H is the normalizer N(T), with H inside a Frobenius preimage of N(T). That case is excluded because Hom(1, B₁^{⋆n}) over F₂ has the characteristic-zero dimension for every n, while a Frobenius preimage of N(T) has more invariants in a suitable V^{⊗n}. For a split G of semisimple rank one the integral identification follows through G → G_ad ≅ PGL₂ and the component grading. The characteristic-two route uses the derived top-cycle identification below. The remaining GS4-G1 obligation is the precise LP3 representation-theoretic interface and the GS2 smooth semismall geometry interface; a modular Hom formula is not assumed from GS2.

**Hypotheses.**

- E is a nonarchimedean local field with residue field F_q of characteristic p; G/E is connected reductive.

- For torsion coefficients Λ is killed by an integer prime to p. The ℓ-adic extension uses a fixed prime ℓ ≠ p and its compatible reductions.

- Satake objects have bounded support, are universally locally acyclic over the leg base, and are flat perverse; representation objects have finite projective coefficient modules.

**Proof plan.**

Use the companion proof contracts below: [Minuscule fibres and integral invariant ranks](#minuscule-tensor-invariants), [Characteristic-two rank-one repair](#characteristic-two-image-test). These give the current argument and explicitly replace the earlier proof outline; the endpoint keeps its original identifier.

**Acceptance.**

- The normalizer of the diagonal torus in SL₂ over F₂, and its preimage under the Frobenius isogeny, both have irreducibles of highest weights 0, 1, 2, …, each once; torus containment and injectivity of highest weights cannot tell them from SL₂ at ℓ = 2.

- For a = 0 the count is n = 4: (V^{⊗4})^{N(T)} is three-dimensional (w permutes the six weight-zero basis tensors freely), against two SL₂-invariants and two characteristic-zero invariants.

- A map of flat Z_ℓ-modules that is injective modulo ℓ and an isomorphism after inverting ℓ is an isomorphism; injectivity modulo ℓ alone is not enough.

**Direct prerequisites.** `GeometricSatakeAndFusion:GS4:integral-dual-group/torus-and-rank-one-identification`, `GeometricSatakeAndFusion:GS4:integral-dual-group/multileg-and-coefficient-reconstruction`, `GeometricSatakeAndFusion:GS4:integral-dual-group/geometric-coordinate-hopf-algebra`, `GeometricSatakeAndFusion:GS3:fusion/fusion-product-and-sign-rule`, `GeometricSatakeAndFusion:GS2:correspondences/convolution-diagram`, `tauceti:TauCetiRoadmap/ReductiveGroups#layer-3-subgroups-quotients-components`, `tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory`, `LanglandsParameterStacks:LP3`, `mathlib:Module.Flat`, `GeometricSatakeAndFusion:GS2:correspondences`, `GeometricSatakeAndFusion:GS2:Satake-closure/one-leg-satake-comparison`.

**Sources.** [FS], VI.11.1 proof pp236–237; Lemmas VI.11.2–VI.11.3 p237: Source special-fibre image argument and flat-module lift; the false ℓ = 2 case of Lemma VI.11.2 needs the proposed replacement in source issue E32 with its recorded supplier gap. [DH], §1, Lemma 1.1 p3 and Lemma 1.4 p4; §5 p18, Steinberg-square discussion: Supplies the small-tilting characters and twisted factorization used in the proposed characteristic-two repair. The kernel-invariant and Hom-count conclusions are derived steps with explicit supplier obligations, not stated theorems of this paper. [Zhu], Proposition 2.3 and Remark 2.4 p432; §2.1 pp431–432: Supplies semismallness of the bounded convolution map and the rational top-cycle multiplicity calculation. Its rational statements are not cited as a modular decomposition theorem.

**Proof refinements here.** [Minuscule fibres and integral invariant ranks](#minuscule-tensor-invariants), [Characteristic-two rank-one repair](#characteristic-two-image-test).



<a id="minuscule-tensor-invariants"></a>

### Minuscule fibres and integral invariant ranks

**Identifier:** `GeometricSatakeAndFusion:GS4:integral-dual-group/minuscule-tensor-invariants`. Companion theorem.

**Refines:** `GeometricSatakeAndFusion:GS4:integral-dual-group/rank-one-integral-identification`.

For G=PGL₂ split over an algebraic closure of F_p and n=2d, let f:Y_n→Gr be the n-fold minuscule convolution, Z_n=f^−1(1), and B₁ the minuscule Satake object. If Y_n is the smooth perfected iterated P¹-bundle of dimension n and f is proper semismall, then Hom(1,B₁^{⋆n}) is canonically BM_n(Z_n,Λ)(−d). This module is free with basis the d-dimensional irreducible components of the reduced fibre. Its rank is independent of ℓ and equals the characteristic-zero invariant multiplicity in the n-fold tensor power of the SL₂ standard module. For odd n the Hom group is zero by the component grading.

**Hypotheses.**

- E is a nonarchimedean local field of residue characteristic p, G/E is connected reductive and ℓ≠p.

- For reconstruction use bounded-support ULA flat-perverse Satake objects, the parity-corrected fusion tensor and total cohomology; finite-projective continuous Weil fibres.

- Torsion coefficients are killed by an integer prime to p. ℓ-adic coefficients are obtained through compatible reductions; rational assertions are explicitly geometric.

**Proof plan.**

1. The geometric GS2 input is only smoothness, properness and the semismall dimension bound; no modular decomposition theorem or modular Hom formula is assumed. Work on compatible finite-type deperfections and then transport étale cohomology through perfection.

2. Write B₁^{⋆n}=Rf_*Λ[n](d). Proper base change for exceptional pullback and smooth duality give Hom(δ₀,Rf_*Λ[n](d))=H^n(Z_n,i_Y^!Λ)(d). With K_Z=i_Y^!Λ[2n](n), this is H^−n(Z_n,K_Z)(−d)=BM_n(Z_n,Λ)(−d). Equivariance adds no extra morphisms for these objects by the existing connected-loop equivariance comparison.

3. Semismallness gives dim Z_n≤d. Duality and top compact cohomology identify its top Borel–Moore group with a free module on its d-dimensional components (after the displayed twist). There is no torsion contribution from smaller strata. Passing between Q_ℓ and F_ℓ preserves the rank.

4. Over Q_ℓ use the already geometric generic PGL₂→SL₂ identification to identify this rank with dim(V^{⊗n})^{SL₂}. This uses the generic result, not the integral rank-one statement being repaired.

**Acceptance.**

- n=0 gives rank1.

- n=2 gives rank1, the alternating SL₂ tensor.

- n=4 gives rank2 and n=6 gives rank5; these Catalan values remain the same in characteristic two.

- Odd n lies in the nonneutral component and gives no unit morphisms.

**Direct prerequisites.** `GeometricSatakeAndFusion:GS2:correspondences/convolution-diagram`, `GeometricSatakeAndFusion:GS0:Witt-geometry/perfect-model-and-etale-comparison`, `GeometricSatakeAndFusion:GS2:Satake-closure/one-leg-satake-comparison`, `EtaleDualityAndPerverseSheaves:EDC.1:biduality/dualizing-complex-of-smooth-scheme`, `EtaleDualityAndPerverseSheaves:EDC.1:biduality/constructible-biduality`, `EtaleDualityAndPerverseSheaves:EDC.1:adjoint/sheafified-adjunction`, `EtaleDualityAndPerverseSheaves:EDC.2:trace-purity/top-degree-compact-cohomology`, `GeometricSatakeAndFusion:GS4:integral-dual-group/torus-and-rank-one-identification`, `GeometricSatakeAndFusion:GS2:correspondences`.

**Sources.** [FS], VI.11 pp236–237, rank-one reduction; VI.7.3 p219: The rank-one proof needs an all-coefficient invariant test; connected equivariance makes the nonequivariant Hom calculation applicable. [Zhu], Proposition2.3 and Remark2.4 p432: The convolution dimension theorem supplies the geometric semismall input. The modular Hom identification is the duality argument given here, not a claim of Zhu's rational decomposition theorem.



<a id="characteristic-two-image-test"></a>

### Characteristic-two rank-one repair

**Identifier:** `GeometricSatakeAndFusion:GS4:integral-dual-group/characteristic-two-image-test`. Companion theorem.

**Refines:** `GeometricSatakeAndFusion:GS4:integral-dual-group/rank-one-integral-identification`.

Let k be algebraically closed of characteristic two and H⊂SL₂ a closed subgroup scheme containing the diagonal torus. Suppose its irreducibles are uniquely indexed by their nonnegative highest weights and, for the standard module V, dim(V^{⊗n})^H equals the characteristic-zero SL₂ invariant multiplicity for every n. Then H=SL₂. In particular these strengthened hypotheses, supplied by the preceding geometric invariant calculation, repair the characteristic-two use of FS VI.11.2 in the integral PGL₂ identification. The highest-weight condition alone is insufficient.

**Hypotheses.**

- E is a nonarchimedean local field of residue characteristic p, G/E is connected reductive and ℓ≠p.

- For reconstruction use bounded-support ULA flat-perverse Satake objects, the parity-corrected fusion tensor and total cohomology; finite-projective continuous Weil fibres.

- Torsion coefficients are killed by an integer prime to p. ℓ-adic coefficients are obtained through compatible reductions; rational assertions are explicitly geometric.

**Proof plan.**

1. After a high Frobenius image H becomes reduced. Its identity component contains the torus, so is the torus, a Borel or SL₂. Negative highest-weight characters exclude the torus and Borel cases unless the reduced image is N(T). If the reduced image is SL₂, dimension and closedness imply H=SL₂. Otherwise H⊂H_a=(F^a)^−1N(T) for some a≥0.

2. Put n=6·2^a−2. The requested LP3 tilting identities give T(n)=A⊗T(4)^[a], with A=T(2^{a+1}−2)=St_a⊗St_a for a≥1 and A=k for a=0. The Steinberg module is self-dual and absolutely irreducible on the a-th Frobenius kernel, so A^{G_a}=k with trivial residual SL₂ action. Therefore T(n)^{H_a}=T(4)^{N(T)}.

3. T(4) has good-filtration character ∇(4)+∇(2). It has no SL₂ invariants, since the ∇(0)-multiplicity is zero, but its torus-zero-weight space has dimension2. The Weyl element is an involution in characteristic two, hence has a nonzero fixed vector there. Thus T(4)^{N(T)}≠0.

4. V^{⊗n} is tilting and contains T(n) as a highest-weight direct summand. On all other summands H_a-invariant dimensions are at least SL₂-invariant dimensions, while on T(n) they are strictly greater. Good-filtration theory makes the SL₂ invariant dimension of V^{⊗n} the characteristic-zero trivial multiplicity. This contradicts the geometric rank calculation because H⊂H_a.

5. The precise tilting, kernel and subgroup-classification interfaces are requests to their owners; the characteristic-two repair remains a recorded gap until those contracts are supplied. No prime-to-ℓ Donkin theorem is used for this purpose.

**Acceptance.**

- N(T) in characteristic two satisfies the simple highest-weight uniqueness condition but fails the tensor invariant test at n=4.

- For a=1 use n=10, A=T(2)=St₁⊗St₁; for a=0 use n=4 directly.

- The corresponding odd-characteristic normalizer has a nontrivial sign character of highest weight0 and already fails highest-weight uniqueness.

**Direct prerequisites.** `GeometricSatakeAndFusion:GS4:integral-dual-group/minuscule-tensor-invariants`, `LanglandsParameterStacks:LP3`, `ReductiveGroupsPartII:RG2.5`.

**Sources.** [FS], LemmaVI.11.2 p237 and the PGL₂ proof pp236–237: The printed characteristic-two highest-weight inference fails for the torus normalizer; tensor invariants provide the strengthened criterion. [DH], Lemmas1.1 and1.4 pp3–4; Steinberg-square calculation p18: These give the SL₂ tilting factorization and the character of T(4). [Jantzen], II.3.16–3.19 pp197–200; II.4.16–4.21 pp210–213; II.E.2,E.5–E.7 pp458–462: Steinberg kernel irreducibility, good-filtration invariant dimensions and tilting direct-summand/tensor properties supply the requested modular representation input.



#### Worked invariant calculation

In characteristic two the normalizer N(T) acts on the standard module V with
weights ±1. The zero-weight basis of V^⊗4 is indexed by the six subsets of size2
of {1,2,3,4}. The Weyl involution takes each subset to its complement. There are
three orbits, so dim(V^⊗4)^N(T)=3. The SL₂-invariant dimension is2, the
coefficient of ∇(0) in its good filtration. Thus the invariant test detects the
normalizer even though its irreducible highest weights look like those of SL₂.
For a Frobenius preimage H_a the same discrepancy is exposed in the highest-weight
tilting summand of V^⊗(6·2^a−2).

The geometric calculation uses top cycles, not a modular decomposition theorem.
For n=2d, smooth duality gives K_Z=i_Y^!Λ[2n](n); therefore
Hom(δ₀,Rf_*Λ[n](d))=BM_n(Z,Λ)(−d). Semismallness puts this in top degree.
The d-dimensional components provide a basis and the twist cancels their Tate
weight. This is why the rank survives coefficient reduction.


<a id="generic-root-datum"></a>

### Weight torus and generic root datum

**Identifier:** `GeometricSatakeAndFusion:GS4:integral-dual-group/generic-root-datum`. Imported theorem; stable owner: the GS3 plan.

Under the torus inclusion, weight-functor grading identifies X^*(T^∨)=X_*(T). The stabilizer of the cohomological grading is the maximal torus and the weight filtration defines a Borel. The symmetric constant-term maps for minimal Levis identify each simple coroot of G with a simple root of G^∨ and each simple root with its coroot; their Weyl reflections agree. Convex-hull bounds for weights of IC_μ exclude additional roots. Thus G^∨_{Q_ℓ} has the dual root datum and its generic pinning has root line Q_ℓ(1).

**Hypotheses.**

- E is a nonarchimedean local field with residue field F_q of characteristic p; G/E is connected reductive.

- For torsion coefficients Λ is killed by an integer prime to p. The ℓ-adic extension uses a fixed prime ℓ ≠ p and its compatible reductions.

- Satake objects have bounded support, are universally locally acyclic over the leg base, and are flat perverse; representation objects have finite projective coefficient modules.

**Proof plan.**

1. Use the weight grading and highest-weight line to identify the torus and chosen positive filtration.

2. Insert the already identified rank-one Levi groups via CT and compare the common torus; this gives roots, coroots and simple reflections.

3. The possible weight set in each representation is contained in the convex hull of the Weyl orbit of μ. An additional root would violate these rank-one reflection/weight bounds. Apply the pinned classification from the upstream reductive-group roadmap.

**Acceptance.**

- In type A₁ the root character is twice the standard SL₂ weight, rather than the standard weight.

- For a torus there are no roots and the entire group is the weight torus.

**Direct prerequisites.** `GeometricSatakeAndFusion:GS4:integral-dual-group/torus-and-rank-one-identification`, `GeometricSatakeAndFusion:GS3:fusion/symmetric-constant-term`, `GeometricSatakeAndFusion:GS4:rational-reductivity/generic-fibre-reductivity`, `GeometricSatakeAndFusion:GS1/semi-infinite-orbits-and-hyperbolic-localization`, `ReductiveGroupsPartII:RG2.5`, `tauceti:TauCetiRoadmap/ReductiveGroups#layer-9-pinned-chevalleydemazure-group-schemes-over-ℤ`.

**Sources.** [FS], VI.11.1 proof pp237–238: The rank-one Levi and weight-bound argument identifies the complete generic root datum. [Zhu], §2.5 pp454–455, after Proposition 2.36: Rational Witt version: the dual torus is a maximal torus of the Tannakian group, the filtration on H* defines a Borel containing it, and the group is the dual group by the argument of Mirković–Vilonen §7.



<a id="integral-recovery-and-adjoint-reduction"></a>

### Integral recovery and the adjoint reduction

**Identifier:** `GeometricSatakeAndFusion:GS4:integral-dual-group/integral-recovery-and-adjoint-reduction`. Imported theorem; stable owner: the GS3 plan.

After base change to the completed maximal unramified ℓ-adic DVR O, the generic identification G^∨_K≅Ĝ_K and the integral torus and rank-one maps identify G^∨_O with the split Chevalley group Ĝ_O. First prove this for G_ad, whose dual has simply connected derived group. For a general G recover the central information by the π₁(G)-grading and its diagonalizable group, which may have torsion. This uses the existing RG2.3 extension principle and general Prasad–Yu criterion and RG2.4 integral-point generation, not a new lattice-existence theorem.

**Hypotheses.**

- E is a nonarchimedean local field with residue field F_q of characteristic p; G/E is connected reductive.

- For torsion coefficients Λ is killed by an integer prime to p. The ℓ-adic extension uses a fixed prime ℓ ≠ p and its compatible reductions.

- Satake objects have bounded support, are universally locally acyclic over the leg base, and are flat perverse; representation objects have finite projective coefficient modules.

**Proof plan.**

Use the companion proof contracts below: [Recovering the integral Chevalley model](#integral-model-recovery). These give the current argument and explicitly replace the earlier proof outline; the endpoint keeps its original identifier.

**Acceptance.**

- The torus must be included among the integral-point generators in semisimple rank zero.

- At ℓ=2 a generic odd orthogonal factor is a real exception to the closed-immersion criterion; it is not suppressed.

- The lattice comes from a Satake object; no arbitrary maximal bounded subgroup assertion is needed.

**Direct prerequisites.** `GeometricSatakeAndFusion:GS4:integral-dual-group/generic-root-datum`, `GeometricSatakeAndFusion:GS4:integral-dual-group/torus-and-rank-one-identification`, `GeometricSatakeAndFusion:GS4:integral-dual-group/rank-one-integral-identification`, `GeometricSatakeAndFusion:GS4:integral-dual-group/multileg-and-coefficient-reconstruction`, `ReductiveGroupsPartII:RG2.3`, `ReductiveGroupsPartII:RG2.0`, `ReductiveGroupsPartII:RG2.4`, `tauceti:TauCetiRoadmap/ReductiveGroups#layer-9-pinned-chevalleydemazure-group-schemes-over-ℤ`, `mathlib:Module.Flat`.

**Sources.** [FS], VI.11.1 proof pp238–239; Lemma VI.11.4 p238: Source integral recovery, exception and reduction to the adjoint case. [PY], Corollary 1.3 pp2–3; proof §5.4 p12: The general criterion is requested from RG2.3, not owned by this application.

**Proof refinements here.** [Recovering the integral Chevalley model](#integral-model-recovery).



<a id="integral-model-recovery"></a>

### Recovering the integral Chevalley model

**Identifier:** `GeometricSatakeAndFusion:GS4:integral-dual-group/integral-model-recovery`. Companion comparison.

**Refines:** `GeometricSatakeAndFusion:GS4:integral-dual-group/integral-recovery-and-adjoint-reduction`.

After base change to the completed maximal unramified ℓ-adic DVR O, the generic identification G^∨_K≅Ĝ_K and the integral torus and rank-one maps identify G^∨_O with the split Chevalley group Ĝ_O. First prove this for G_ad, whose dual has simply connected derived group. For a general G recover the central information by the π₁(G)-grading and its diagonalizable group, which may have torsion. This uses the existing RG2.3 extension principle and general Prasad–Yu criterion and RG2.4 integral-point generation, not a new lattice-existence theorem.

**Hypotheses.**

- E is a nonarchimedean local field of residue characteristic p, G/E is connected reductive and ℓ≠p.

- For reconstruction use bounded-support ULA flat-perverse Satake objects, the parity-corrected fusion tensor and total cohomology; finite-projective continuous Weil fibres.

- Torsion coefficients are killed by an integer prime to p. ℓ-adic coefficients are obtained through compatible reductions; rational assertions are explicitly geometric.

**Proof plan.**

1. The integral torus and simple rank-one Levi images contain the generators of Ĝ(O), hence Ĝ(O)⊂G^∨(O). Choose a generic faithful representation coming from a Satake object and retain its existing finite-free Satake lattice F(A). The point inclusion already makes this lattice Ĝ(O)-stable.

2. The smooth-group extension principle extends Ĝ_K→GL(F(A)_K) over O. Prasad–Yu makes it a closed immersion when ℓ≠2 or Ĝ_K has no geometric normal SO_(2m+1) subgroup. Apply first to the dual of G_ad, whose simply connected derived group satisfies this exception at ℓ=2.

3. Now G^∨→GL(F(A)) factors through the closed subgroup Ĝ: equations of Ĝ vanish on its generic fibre and O[G^∨] is flat. Every point of the smooth Ĝ_k lifts to O; the integral-point inclusion lifts it further to G^∨(O). Density of these points in the reduced Ĝ_k makes O[Ĝ_k]→O[G^∨_k] injective.

4. Apply the flat-module saturation criterion to the coordinate map, which is generically an isomorphism and injective modulo ℓ, to get the integral isomorphism. Faithfully flat descent returns to Z_ℓ. Recover general G from G_ad and the refined component grading; D(π₁(G)) is diagonalizable, not automatically a torus.

**Acceptance.**

- The torus must be included among the integral-point generators in semisimple rank zero.

- At ℓ=2 a generic odd orthogonal factor is a real exception to the closed-immersion criterion; it is not suppressed.

- The lattice comes from a Satake object; no arbitrary maximal bounded subgroup assertion is needed.

**Direct prerequisites.** `GeometricSatakeAndFusion:GS4:integral-dual-group/generic-root-datum`, `GeometricSatakeAndFusion:GS4:integral-dual-group/characteristic-two-image-test`, `GeometricSatakeAndFusion:GS4:integral-dual-group/torus-and-rank-one-identification`, `ReductiveGroupsPartII:RG2.3`, `ReductiveGroupsPartII:RG2.4`, `ReductiveGroupsPartII:RG2.5`, `GeometricSatakeAndFusion:GS4:integral-dual-group/flat-module-saturation`.

**Sources.** [FS], VI.11.1 pp237–239; LemmasVI.11.3–11.4 pp237–238: The integral recovery uses the integral-point inclusion, the closed-immersion criterion and the flat coordinate comparison. [PY], Corollary1.3 p2; proof §5.4 p12; published Corollary5.2: The source criterion has the residue-characteristic-two odd-orthogonal exception. Its general statement is already planned in the current upstream RG2.3 README.



<a id="flat-module-saturation"></a>

### Flat-module saturation criterion

**Identifier:** `GeometricSatakeAndFusion:GS4:integral-dual-group/flat-module-saturation`. Companion theorem.

Let R be a commutative ring, π∈R and f:M→N a linear map. Suppose multiplication by π is injective on M and N, f becomes an isomorphism after inverting π, and the induced map M/πM→N/πN is injective. Then f is an isomorphism, without finite-generation assumptions. In particular this applies to flat modules over a DVR with uniformizer π. An executable equivalent hypothesis for localization surjectivity is that every y has π^n y=f(x) for some n and x, and localization injectivity says f(x)=0 implies π^n x=0 for some n.

**Hypotheses.**

- E is a nonarchimedean local field of residue characteristic p, G/E is connected reductive and ℓ≠p.

- For reconstruction use bounded-support ULA flat-perverse Satake objects, the parity-corrected fusion tensor and total cohomology; finite-projective continuous Weil fibres.

- Torsion coefficients are killed by an integer prime to p. ℓ-adic coefficients are obtained through compatible reductions; rational assertions are explicitly geometric.

**Proof plan.**

1. Localization injectivity and π-torsion-freeness of M give injectivity of f.

2. For y choose n minimal with π^n y=f(x). If n>0, reduction modulo π makes x divisible by π. Divide x=πz and cancel π in N to get π^(n−1)y=f(z), contradicting minimality. Hence n=0 and f is surjective.

**Acceptance.**

- No Nakayama lemma or finite generation occurs.

- The inclusion πR→R over a DVR is generically an isomorphism but fails injectivity modulo π, so is correctly excluded.

- The conclusion is false if the π-torsion-free hypotheses are dropped; R→R⊕R/πR is a generic isomorphism and injective modulo π but is not surjective.

**Direct prerequisites.** `mathlib:LinearMap`, `mathlib:Module.Flat`.

**Sources.** [FS], LemmaVI.11.3 p237: The source proves the DVR flat-module case by saturation. The π-torsion-free formulation isolates exactly the elementary cancellation argument.



#### Worked coordinate comparison

The coordinate map used after Prasad–Yu is O[Ĝ]→O[G^∨]. Both modules are flat,
the generic-fibre map is an isomorphism and the special-fibre map is injective.
For y in the target choose the least n with ℓ^n y=f(x). If n>0, injectivity modulo
ℓ writes x=ℓz; cancellation in the flat target lowers n. Thus n=0. This argument
works for the possibly infinitely generated coordinate algebra. Applying Nakayama
to that algebra without a finiteness hypothesis would not replace it.

The representation lattice already comes from the Satake fibre. Once the integral
point inclusion is proved, the smooth extension principle applies to this lattice;
no separate invariant-lattice theorem is required. The general current RG2.3
README criterion is the import, since its compact Suggested endpoint only states
the residue-characteristic-not-two case.


<a id="dual-group-identification"></a>

### Canonical pinned dual identification

**Identifier:** `GeometricSatakeAndFusion:GS4:integral-dual-group/dual-group-identification`. Imported theorem; stable owner: the GS3 plan.

There is a canonical W_E-equivariant isomorphism G^∨_Λ≅Ĝ_Λ^{geom} for the prime-to-p torsion and compatible ℓ-adic coefficients above. The geometric pinning identifies each simple root line with Λ(1); it carries the cyclotomic Weil action as well as the action on the pinned dual root datum. The isomorphism is independent of a chosen splitting pinning of G and descends from a finite Galois splitting extension to nonsplit G. It is an integral theorem and uses no exclusion on the order of π₁(Ĝ).

**Hypotheses.**

- E is a nonarchimedean local field with residue field F_q of characteristic p; G/E is connected reductive.

- For torsion coefficients Λ is killed by an integer prime to p. The ℓ-adic extension uses a fixed prime ℓ ≠ p and its compatible reductions.

- Satake objects have bounded support, are universally locally acyclic over the leg base, and are flat perverse; representation objects have finite projective coefficient modules.

**Proof plan.**

Use the companion proof contracts below: [Descent of the geometric pinning](#geometric-pinning-descent). These give the current argument and explicitly replace the earlier proof outline; the endpoint keeps its original identifier.

**Acceptance.**

- For PGL₂, arithmetic action on the dual root vector is cyclotomic, even when the pinned root datum has trivial action.

- For nonsplit tori this recovers the dual character lattice with its actual Weil action.

**Direct prerequisites.** `GeometricSatakeAndFusion:GS4:integral-dual-group/integral-recovery-and-adjoint-reduction`, `GeometricSatakeAndFusion:GS3:fusion/symmetric-constant-term`, `GeometricSatakeAndFusion:GS3:fusion/drinfeld-fibre-realization`, `ReductiveGroupsPartII:RG2.5`, `VStackSheavesAndLisseCategories:VS1`.

**Sources.** [FS], Theorem VI.11.1 p235 and canonical-pinning/descent proof pp238–239: Canonical integral identification with the geometrically twisted dual, including pinning independence and descent.

**Proof refinements here.** [Descent of the geometric pinning](#geometric-pinning-descent).



<a id="geometric-pinning-descent"></a>

### Descent of the geometric pinning

**Identifier:** `GeometricSatakeAndFusion:GS4:integral-dual-group/geometric-pinning-descent`. Companion comparison.

**Refines:** `GeometricSatakeAndFusion:GS4:integral-dual-group/dual-group-identification`.

The geometric generic identification and its integral recovery carry a canonical dual Cartan, Borel and simple-root lines on the divisor base. On the PGL₂ minuscule fibre the geometric simple-root line is Hom(H²(P¹),H⁰(P¹))=Z_ℓ(1). Transport by simple-Levi constant terms gives every root line; varying the auxiliary Borel and splitting extension descends the same pinned dual group with its geometric Weil action. A chosen square root of the transported Tate character identifies these root lines with the standard pinning.

**Hypotheses.**

- E is a nonarchimedean local field of residue characteristic p, G/E is connected reductive and ℓ≠p.

- For reconstruction use bounded-support ULA flat-perverse Satake objects, the parity-corrected fusion tensor and total cohomology; finite-projective continuous Weil fibres.

- Torsion coefficients are killed by an integer prime to p. ℓ-adic coefficients are obtained through compatible reductions; rational assertions are explicitly geometric.

**Proof plan.**

1. The cohomological grading and the weight filtration recover Cartan and Borel intrinsically. The rank-one cohomology calculation fixes the root line, including its Tate character.

2. Over the flag variety vary the Borel; its geometric simple connectedness makes the locally constant pinning data independent of that variation. Simple-Levi constant terms commute with this smooth base change.

3. Use the full-faithful locally constant Drinfeld realization, and then finite Galois descent through a splitting field, to descend the root-line data. Keep the root-line character intrinsic until the stalk-versus-parameter orientation is fixed.

**Acceptance.**

- For a torus there are no root-line choices.

- For PGL₂ the root line is Λ(1), whereas H²(P¹)=Λ(−1).

- A choice of half Tate identifies pinning torsors; it is not a claim of a canonical square root of q.

**Direct prerequisites.** `GeometricSatakeAndFusion:GS4:integral-dual-group/generic-root-datum`, `GeometricSatakeAndFusion:GS4:integral-dual-group/integral-model-recovery`, `GeometricSatakeAndFusion:GS4:integral-dual-group/torus-and-rank-one-identification`, `GeometricSatakeAndFusion:GS3:fusion/symmetric-constant-term`, `GeometricSatakeAndFusion:GS3:fusion/drinfeld-fibre-realization`, `ReductiveGroupsPartII:RG2.5`, `VStackSheavesAndLisseCategories:VS1`.

**Sources.** [FS], VI.11.1 pp236–239; IV.7 pp164–166: The pinning is built from rank-one root lines and descended through the locally constant realization.



<a id="witt-rational-satake-equivalence"></a>

### Rational Witt vector geometric Satake equivalence

**Identifier:** `GeometricSatakeAndFusion:GS4:integral-dual-group/witt-rational-satake-equivalence`. Imported theorem; stable owner: the GS3 plan.

In the setting of the rational Witt Tannakian category, let Ĝ be the split dual group over Q̄_ℓ with the dual Borel B̂ ⊃ T̂ of its pinned dual root datum. There is an equivalence of Q̄_ℓ-linear symmetric monoidal categories S: Sat^Witt_G → Rep_{Q̄_ℓ}(Ĝ) onto finite-dimensional algebraic representations, with an isomorphism of tensor functors H* ≅ (forget ∘ S). Under S: (a) the weight functor CT = ⊕_λ CT_λ, viewed as a functor to Sat^Witt_T, has a unique monoidal structure for which the isomorphism H*_T ∘ CT ≅ H* is monoidal; it is then symmetric and corresponds to restriction to T̂, CT_λ(A) being the λ-weight space of S(A); (b) the filtration of H* by semi-infinite orbits corresponds to the B̂-stable filtration by weights; (c) IC_μ corresponds to the irreducible representation V_μ of highest weight μ, so dim CT_λ(IC_μ) = dim V_μ(λ); (d) for a torus, S is the grading equivalence with Rep(T̂). This is Zhu's Theorem 0.3, with Corollary 2.22 and §2.5, for the monoidal structure on H* transported from fusion; its agreement with the structure of Zhu's Proposition 2.20 is not asserted.

**Hypotheses.**

- E is a finite extension of Q_p with residue field F_q; k is an algebraic closure of F_q; O = W(k) ⊗_{W(F_q)} O_E, the integers of the completed maximal unramified extension of E, which is totally ramified over W(k).

- G is a split connected reductive group over O_E, and also denotes its base change to O. ℓ ≠ p, and Q̄_ℓ is the union of the finite extensions of Q_ℓ.

- Zhu allows any algebraically closed k and any finite totally ramified F over W(k)[1/p]. For k an algebraic closure of F_p every such F is the completed maximal unramified extension of a finite extension E of Q_p (finite extensions of the completion of the henselian field Q_p^ur come from finite extensions of Q_p^ur), and every reductive group over the strictly henselian ring O is split, so the comparison route covers Zhu's setting for this k. For a larger algebraically closed k it is not covered here (gap "Zhu's equivalence outside the FS comparison").

- Dominance on coweights uses nonnegative integer combinations of positive coroots (source issue E1); Rep_{Q̄_ℓ}(Ĝ) means algebraic representations on finite-dimensional Q̄_ℓ-vector spaces, with no Weil action.

**Proof plan.**

1. The generic root datum node identifies the root datum of the Tannakian group of the rational Witt category with the dual root datum, with its torus, Borel and simple root lines; the isomorphism theorem for pinned split groups gives Aut^⊗(H*) ≅ Ĝ over Q̄_ℓ. Neutral Tannaka reconstruction turns this into S with forget ∘ S ≅ H*. Only the generic fibre is used: the integral rank-one identification, integral recovery and the ℓ = 2 input are not prerequisites.

2. For (a): transport the symmetric constant term for B through the one-leg comparison and to Q̄_ℓ; it commutes with the fibre functors. Uniqueness: H*_T is faithful, so the monoidal structure on CT is determined by the monoidal isomorphism H*_T ∘ CT ≅ H*. Symmetry: the commutativity constraints on both sides are detected by H*, as in the uniqueness part of Zhu's Proposition 2.21. The torus case identifies Rep(T̂) with graded spaces, so CT is restriction to T̂.

3. For (b) and (c): the stabilizer of the cohomological filtration is B̂ by the generic root datum node. The weights of IC_μ lie in the convex hull of Wμ and μ occurs once, since S_μ ∩ Gr_{≤μ} is irreducible of dimension ⟨2ρ, μ⟩ by the Mirković–Vilonen count; so S(IC_μ) is the irreducible module of highest weight μ by the characteristic-zero highest-weight classification. For (b): the semi-infinite filtration is split by the weight functors (Zhu Corollary 2.10, with its proof as corrected in source issue E10, or the symmetric constant-term node, through F ≅ F_T ∘ CT_B[deg]), so by (a) it corresponds to the sums of the weight spaces V(λ′) over λ′ ≥ λ, which are B̂-stable because the root groups of B̂ raise weights by positive coroots of G.

4. Zhu's own route to the same identification (torus case, Proposition 2.36 by torus-equivariant cohomology, then the maximal torus and Borel argument of Mirković–Vilonen §7) uses his monoidal structure on H* and his Gelfand commutativity constraint (§§2.3–2.4). That proof is routed to the Part II design and is not used here.

**Acceptance.**

- For a split torus T, S is the equivalence between X_*(T)-graded spaces and representations of T̂, with CT the identity.

- For G = PGL₂ the minuscule object goes to the standard representation of SL₂, with CT_{±μ} one-dimensional.

- For G = GL_n and μ = (1,0,…,0) the closed Schubert variety is P^{n−1}; S(IC_μ) is the standard representation, with the n coordinate weights each of multiplicity one.

- With the Koszul-signed symmetry instead of the parity-corrected one, the reconstruction would give a supergroup, not Ĝ.

**Direct prerequisites.** `GeometricSatakeAndFusion:GS4:rational-reductivity/witt-rational-tannakian-category`, `GeometricSatakeAndFusion:GS4:integral-dual-group/generic-root-datum`, `GeometricSatakeAndFusion:GS4:integral-dual-group/torus-and-rank-one-identification`, `GeometricSatakeAndFusion:GS3:fusion/symmetric-constant-term`, `GeometricSatakeAndFusion:GS2:Satake-closure/one-leg-satake-comparison`, `GeometricSatakeAndFusion:GS0:Witt-geometry/semi-infinite-intersections-and-MV-cycles`, `GeometricSatakeAndFusion:GS1/rational-weight-concentration`, `MotivesAndAlgebraicCycles:MC.6/neutral-tannaka-reconstruction`, `ReductiveGroupsPartII:RG2.5`, `LanglandsParameterStacks:LP3`, `tauceti:TauCetiRoadmap/ReductiveGroups#layer-9-pinned-chevalleydemazure-group-schemes-over-ℤ`.

**Sources.** [Zhu], Theorem 0.3 p408 (with source issue E33); Corollary 2.22 p444; §2.5 pp454–455; §0.5 p412: The mixed characteristic geometric Satake equivalence with Q̄_ℓ coefficients, its symmetric monoidal form, the identification with the dual group through the torus case, the tensor constant term and the Borel, and the notation Ĝ ⊃ B̂ ⊃ T̂, V_μ, V_μ(λ). [FS], Remark I.2.14 p17; VI introduction pp188–189: Fargues and Scholze note that their theorem, through the Witt degeneration, reproves Zhu's equivalence, and that the Satake categories over Spd O_C, Spd C and Spd k agree.



<a id="normalized-satake-equivalence"></a>

### Normalized integral Satake equivalence

**Identifier:** `GeometricSatakeAndFusion:GS4:integral-dual-group/normalized-satake-equivalence`. Imported construction; stable owner: the GS3 plan.

Choose r∈Λ× with r²=q and the associated half Tate local system. Let χ_Tate be the Weil character of the geometric root line Λ(1) under IV.7.3 and κ its chosen square root. The half twist on a sheaf stalk has geometric Frobenius eigenvalue r^{-1}; identifying that stalk convention with κ under Drinfeld realization is the recorded convention obligation. Put t_G(w)=(2ρ̂_G)(κ(w)) in Ĝ (projected to Ĝ_ad for conjugation). The geometric action is Ad(t_G(w)) composed with the usual pinned action. The semidirect comparison (g,w)↦(g t_G(w),w) identifies the geometrically twisted semidirect group with the pinned one. Combining it with reconstruction gives Sat^I_G(Λ)≃Rep^{fp,cont}_Λ((Ĝ⋊W_E)^I). Equivalently an algebraic representation of (Ĝ⋊Q)^I, for a finite quotient Q through which the pinned action factors, gives its normalized Satake object; Q is not substituted for all continuous Weil representations.

**Hypotheses.**

- E is a nonarchimedean local field with residue field F_q of characteristic p; G/E is connected reductive.

- For torsion coefficients Λ is killed by an integer prime to p. The ℓ-adic extension uses a fixed prime ℓ ≠ p and its compatible reductions.

- Satake objects have bounded support, are universally locally acyclic over the leg base, and are flat perverse; representation objects have finite projective coefficient modules.

**Uses.**

- HeckeStacksAndLocalShtukas:HS1: Uses normalized kernels indexed by finite projective representations.

- ExcursionOperatorsAndSpectralAction:ES6–ES7: Requires a finite-set coherent pinned Weil convention, including chosen half twists.

**API.**

- `TauCeti.GeometricSatake.normalizedSatakeEquivalence` (equivalence): The strong symmetric equivalence with continuous finite-projective representations of the usual pinned Weil semidirect group.

- `TauCeti.GeometricSatake.normalizedSatakeObject` (constructor): The inverse equivalence applied to a representation V of (Ĝ⋊Q)^I.

- `TauCeti.GeometricSatake.normalizedSatake_fibre` (compatibility): The underlying fibre is V with the specified half-Tate normalization, compatibly with Weil action.

- `TauCeti.GeometricSatake.normalizedSatake_tensor` (compatibility): S_{V⊗W} ≅ S_V*S_W and S_1 ≅ unit.

- `TauCeti.GeometricSatake.normalizedSatake_dual` (compatibility): S_{V∨} is the internal dual sw*D(S_V).

- `TauCeti.GeometricSatake.normalizationCocycle` (data): t_G(w)=(2ρ̂_G)(κ(w)); the cocycle identity gives the semidirect comparison.

**Checks.**

- `TauCeti.GeometricSatake.test_normalized_torus` (computation): For T=G_m, weight n is the point object on component n, with no ρ twist.

- `TauCeti.GeometricSatake.test_normalized_pgl2` (computation): For the standard SL₂ representation its PGL₂ Satake sheaf is Λ[1](1/2) on P¹, with Frobenius eigenvalues r^{-1},r.

- `TauCeti.GeometricSatake.test_normalized_rootChoice` (non-example): Changing the chosen square root from r to -r multiplies an odd component by -1; it does not leave all normalized objects canonically fixed.

**Proof plan.**

Use the companion proof contracts below: [The normalization cocycle](#normalization-cocycle-test). These give the current argument and explicitly replace the earlier proof outline; the endpoint keeps its original identifier.

**Acceptance.**

- For PGL₂ the normalized minuscule object is IC(P¹)=Λ[1](1/2) and its two Frobenius eigenvalues are r^{-1},r.

- For a torus 2ρ̂=0, so normalization leaves its weight characters unchanged.

- Changing r to -r changes the odd-component half twists by the central parity element (2ρ̂)(-1).

**Direct prerequisites.** `GeometricSatakeAndFusion:GS4:integral-dual-group/dual-group-identification`, `GeometricSatakeAndFusion:GS4:integral-dual-group/geometric-coordinate-hopf-algebra`, `GeometricSatakeAndFusion:GS4:integral-dual-group/multileg-and-coefficient-reconstruction`, `GeometricSatakeAndFusion:GS3:fusion/drinfeld-fibre-realization`, `GeometricSatakeAndFusion:GS3:fusion/fusion-verdier-duality`, `ReductiveGroupsPartII:RG2.5`, `mathlib:CategoryTheory.Functor.Monoidal`, `mathlib:Representation`.

**Sources.** [FS], Theorem VI.0.2 p190; VI.11.1 p235; IX.2 p321: The source normalizes the geometric action using a chosen square root and exports finite-projective representations.

**Proof refinements here.** [The normalization cocycle](#normalization-cocycle-test).



<a id="normalization-cocycle-test"></a>

### The normalization cocycle

**Identifier:** `GeometricSatakeAndFusion:GS4:integral-dual-group/normalization-cocycle-test`. Companion construction.

**Refines:** `GeometricSatakeAndFusion:GS4:integral-dual-group/normalized-satake-equivalence`.

Let σ:W→Aut(Ĝ) be the pinned action and let t:W→Ĝ be a continuous σ-cocycle lifting the adjoint grading cocycle: t(wv)=t(w)σ_w(t(v)). Put α_w=Ad(t(w))σ_w. The normalized comparison is the group isomorphism Ĝ⋊_αW→Ĝ⋊_σW, (g,w)↦(g t(w),w), with inverse (h,w)↦(h t(w)^−1,w). Thus if Φ(w) is the geometric Weil operator and ρ is its Ĝ representation, the pinned operator is Ψ(w)=ρ(t(w))^−1Φ(w). In Satake t=(2ρ̂)(κ), where κ is the square root of the transported root-line Tate character. Identifying κ(Frob_geom) with a scalar stalk convention remains the named Drinfeld orientation obligation.

**Hypotheses.**

- E is a nonarchimedean local field of residue characteristic p, G/E is connected reductive and ℓ≠p.

- For reconstruction use bounded-support ULA flat-perverse Satake objects, the parity-corrected fusion tensor and total cohomology; finite-projective continuous Weil fibres.

- Torsion coefficients are killed by an integer prime to p. ℓ-adic coefficients are obtained through compatible reductions; rational assertions are explicitly geometric.

**Uses.**

- FS VI.11 normalized equivalence and IX.7: Transports geometric Weil actions to pinned L-group representations before naturality comparisons.

- Classical Frobenius comparison: Distinguishes the corrected operator Ψ from unmodified geometric cohomology.

**API.**

- `TauCeti.GeometricSatake.GS4.normalizationCocycleIso` (constructor): The displayed isomorphism on the two semidirect products, with inverse and continuity.

- `TauCeti.GeometricSatake.GS4.normalizationCocycleIso_mul` (compatibility): The two products agree using precisely t(wv)=t(w)σ_w(t(v)); no commutativity of Ĝ is assumed.

- `TauCeti.GeometricSatake.GS4.normalizedWeilOperator` (data): Ψ(w)=ρ(t(w))^−1Φ(w), satisfying Ψ(w)ρ(g)Ψ(w)^−1=ρ(σ_w(g)).

- `TauCeti.GeometricSatake.GS4.normalization_change_halfTate` (functoriality): If κ′=εκ for a quadratic character ε, the two comparisons differ by the central cocycle (2ρ̂)(ε).

- `TauCeti.GeometricSatake.GS4.normalizationCocycleIso_overWeil` (projection): Projection to W is unchanged; the W-section generally is changed.

**Checks.**

- `TauCeti.GeometricSatake.GS4.test_normalization_trivial` (degenerate): For κ=1 and α=σ, the comparison is the identity.

- `TauCeti.GeometricSatake.GS4.test_normalization_central` (computation): For Ĝ=G_m and trivial σ, (1,w) maps to (t(w),w), even though Ad(t(w)) is trivial.

- `TauCeti.GeometricSatake.GS4.test_normalization_rankOne` (compatibility): For t(w)=diag(a,a^−1), conjugation sends the upper simple-root matrix E₁₂ to a²E₁₂ and the pinned operator is diag(a^−1,a)Φ(w).

- `TauCeti.GeometricSatake.GS4.test_normalization_conjugation` (non-example): For a noncentral t, sending (1,w) to (1,w) while correcting only g by conjugation does not intertwine the two actions.

**Proof plan.**

1. The cocycle equation makes α an action. Multiply two elements on both semidirect-product sides and use t(wv)=t(w)σ_w(t(v)) to verify the displayed map.

2. The inverse is right multiplication by t(w)^−1, not conjugation by its adjoint image. Pull a geometric representation through this inverse to obtain Ψ=ρ(t)^−1Φ.

3. The grading cocharacter 2ρ̂ and a chosen square root κ provide a lift; changing κ by a quadratic character changes t by a central cocycle. This algebraic correction is valid before identifying the Drinfeld action with geometric-Frobenius stalk action.

**Acceptance.**

- For t=1 the map is the identity.

- On the central torus, a nontrivial central t still changes the W-section; conjugation would miss this change.

- The formula with Ad(t(w)^−1)g generally fails the semidirect-product multiplication test.

**Direct prerequisites.** `GeometricSatakeAndFusion:GS4:integral-dual-group/geometric-pinning-descent`, `ReductiveGroupsPartII:RG2.5`, `GeometricSatakeAndFusion:GS3:fusion/drinfeld-fibre-realization`, `VStackSheavesAndLisseCategories:VS1`.

**Sources.** [ZhuIntro], Lemma5.5.7 pp76–77 (arXivv2): The corrected semidirect comparison is multiplication by the lifted cocycle. [RZ], PropositionA.6 p446 and CorollaryA.8 p447: A.6 supplies the grading twist; the conjugation formula of A.8 is corrected by the later lemma.



#### Multiplication and the Weil section

Write the geometric semidirect product using α_w=Ad(t(w))σ_w. For two elements,
its first coordinate is g t(w)σ_w(h)t(w)^−1. Right multiplication by t(wv)
changes this to g t(w)σ_w(h t(v)), exactly the product of the two normalized
first coordinates. This verifies the formula without commutativity. On the
other hand, a nontrivial central cocycle still sends (1,w) to (t(w),w), while
conjugation fixes that section. The distinction already matters for a dual torus.


<a id="levi-naturality"></a>

### Levi naturality and normalization

**Identifier:** `GeometricSatakeAndFusion:GS4:integral-dual-group/levi-naturality`. Imported theorem; stable owner: the GS3 plan.

For P with Levi M, CT_P[deg_P] intertwines geometric Satake with restriction along M̂^{geom}→Ĝ^{geom}. Under the chosen normalized semidirect comparisons, the map from the pinned M-group to the pinned G-group is (m,w)↦(ι(m)t_M(w)^{-1}t_G(w),w). Here t_G/t_M=(2ρ̂_G−2ρ̂_M)(κ(w)) centralizes M̂. Nested Levis multiply these correction cocycles and their degree shifts add. Thus this is a naturality theorem with a specified Weil correction, not unqualified restriction along the untwisted inclusion.

**Hypotheses.**

- E is a nonarchimedean local field with residue field F_q of characteristic p; G/E is connected reductive.

- For torsion coefficients Λ is killed by an integer prime to p. The ℓ-adic extension uses a fixed prime ℓ ≠ p and its compatible reductions.

- Satake objects have bounded support, are universally locally acyclic over the leg base, and are flat perverse; representation objects have finite projective coefficient modules.

**Proof plan.**

Use the companion proof contracts below: [Levi transport of the half-Tate correction](#levi-half-tate-transport). These give the current argument and explicitly replace the earlier proof outline; the endpoint keeps its original identifier.

**Acceptance.**

- For M=G the correction is one and CT is identity.

- For a three-step Levi chain the intermediate half-sum cancels and gives the direct correction.

**Direct prerequisites.** `GeometricSatakeAndFusion:GS4:integral-dual-group/normalized-satake-equivalence`, `GeometricSatakeAndFusion:GS3:fusion/symmetric-constant-term`, `GeometricSatakeAndFusion:GS4:integral-dual-group/generic-root-datum`, `ReductiveGroupsPartII:RG2.5`.

**Sources.** [FS], VI.9.6 p230; VI.11.1 pp238–240; IX.7.1 p334: Geometric CT is natural; the source explicitly displays the correction in its parameter convention.

**Proof refinements here.** [Levi transport of the half-Tate correction](#levi-half-tate-transport).



<a id="levi-half-tate-transport"></a>

### Levi transport of the half-Tate correction

**Identifier:** `GeometricSatakeAndFusion:GS4:integral-dual-group/levi-half-tate-transport`. Companion comparison.

**Refines:** `GeometricSatakeAndFusion:GS4:integral-dual-group/levi-naturality`.

For a parabolic P with Levi M, compare the geometric normalized constant term with restriction of pinned dual representations. The discrepancy between G and M normalizations is the central M-dual cocycle (2ρ_G−2ρ_M)(κ(w)); in the FS parameter convention IX.7.1 the displayed cocycle is (2ρ_G−2ρ_M)(r)^{|w|}, with |Frob_geom|=1 and r²=q. The diagram commutes after the specified cocycle twist, including repeated Levi inclusions. The identification of the transported κ with this parameter convention is an explicit remaining obligation, rather than an assumed equality with the stalk half-Tate eigenvalue r^−1.

**Hypotheses.**

- E is a nonarchimedean local field of residue characteristic p, G/E is connected reductive and ℓ≠p.

- For reconstruction use bounded-support ULA flat-perverse Satake objects, the parity-corrected fusion tensor and total cohomology; finite-projective continuous Weil fibres.

- Torsion coefficients are killed by an integer prime to p. ℓ-adic coefficients are obtained through compatible reductions; rational assertions are explicitly geometric.

**Proof plan.**

1. Apply the geometric constant-term tensor comparison before normalization. Subtract the two grading cocharacters to compute the relative cocycle, which centralizes ĤM.

2. Use the corrected semidirect isomorphism, not a conjugation formula, to transport both Weil operators. Under nested Levi inclusions the differences of 2ρ add, so the twists compose.

3. Record the positive exponent in IX.7.1 explicitly. A Drinfeld pullback/action-versus-stalk dictionary must account for it before identifying the same diagram with finite-field stalk traces.

**Acceptance.**

- M=G gives the trivial cocycle.

- For GL₂ and its diagonal torus the relative cocharacter evaluates as diag(r,r^−1) in the stated FS parameter convention.

- For L⊂M⊂G, the G/L cocycle is the product of the G/M and M/L cocycles.

**Direct prerequisites.** `GeometricSatakeAndFusion:GS4:integral-dual-group/normalization-cocycle-test`, `GeometricSatakeAndFusion:GS3:fusion/finite-set-functoriality-and-constant-terms`, `GeometricSatakeAndFusion:GS3:fusion/symmetric-constant-term`, `ReductiveGroupsPartII:RG2.5`, `VStackSheavesAndLisseCategories:VS1`.

**Sources.** [FS], VI.9.6 p230; IX.7.1 p334: The symmetric constant term is the geometric input, and IX.7.1 fixes the sign of the parameter-side Levi cocycle.



<a id="adjoint-isomorphism-naturality"></a>

### Naturality for adjoint-isomorphism maps

**Identifier:** `GeometricSatakeAndFusion:GS4:integral-dual-group/adjoint-isomorphism-naturality`. Imported theorem; stable owner: the GS3 plan.

For f:G′→G inducing an isomorphism on adjoint groups, componentwise pushforward of the corresponding bounded Grassmannian sheaves intertwines normalized Satake with restriction along the dual map Ĝ→Ĝ′. Component refinements, central characters, Weyl actions, tensor constraints, half twists and finite-set collisions commute with this comparison. This includes central isogenies and the adjoint reduction used for integral recovery; no inverse equivalence for a general central isogeny is asserted.

**Hypotheses.**

- E is a nonarchimedean local field with residue field F_q of characteristic p; G/E is connected reductive.

- For torsion coefficients Λ is killed by an integer prime to p. The ℓ-adic extension uses a fixed prime ℓ ≠ p and its compatible reductions.

- Satake objects have bounded support, are universally locally acyclic over the leg base, and are flat perverse; representation objects have finite projective coefficient modules.

**Proof plan.**

1. The map of Grassmannians is a componentwise isomorphism; its essential change is the map of component gradings. Pushforward corresponds to forgetting/refining the appropriate dual central character.

2. The common adjoint root system identifies the half-sum cocycles, so normalizations commute with the dual map. Prove tensor and finite-set comparisons on disjoint loci and extend uniquely.

**Acceptance.**

- For SL₂→PGL₂, component/central-character information distinguishes the two representation categories.

- For an isomorphism f the comparison reduces to the usual pullback identification.

**Direct prerequisites.** `GeometricSatakeAndFusion:GS4:integral-dual-group/normalized-satake-equivalence`, `GeometricSatakeAndFusion:GS4:integral-dual-group/torus-and-rank-one-identification`, `GeometricSatakeAndFusion:GS3:fusion/finite-set-functoriality-and-constant-terms`, `ReductiveGroupsPartII:RG2.5`, `GeometricSatakeAndFusion:GS0:loop-geometry/loop-groups-and-local-hecke`, `GeometricSatakeAndFusion:GS0:loop-geometry/grassmannian`, `GeometricSatakeAndFusion:GS0:loop-geometry/schubert-bounds-and-properness`.

**Sources.** [FS], VI.11.1 proof pp237–239; IX.6.1 pp330–331: The source uses exactly this Satake naturality to compare the global Hecke kernels.



<a id="product-naturality"></a>

### Product naturality

**Identifier:** `GeometricSatakeAndFusion:GS4:integral-dual-group/product-naturality`. Imported theorem; stable owner: the GS3 plan.

For G=G₁×G₂ the external product of Grassmannian sheaves and normalized Satake identify Ĝ with Ĝ₁×Ĝ₂ and carry V₁⊠V₂ to S_{V₁}⊠S_{V₂}. Tensor, fibre, root pinning, Weil action and all finite-set operations agree. This is a statement for external products and their induced categorical comparison, not a claim every representation is itself an external tensor product.

**Hypotheses.**

- E is a nonarchimedean local field with residue field F_q of characteristic p; G/E is connected reductive.

- For torsion coefficients Λ is killed by an integer prime to p. The ℓ-adic extension uses a fixed prime ℓ ≠ p and its compatible reductions.

- Satake objects have bounded support, are universally locally acyclic over the leg base, and are flat perverse; representation objects have finite projective coefficient modules.

**Proof plan.**

1. The loop/torsor and bounded Schubert constructions split as products; Künneth splits total cohomology and constant terms.

2. The Hopf reconstruction and root pinning split, and 2ρ̂ is the pair of half-sum cocharacters. Verify comparisons on exterior product generators and retain the coherent tensor data.

**Acceptance.**

- The product with the trivial group recovers the same Satake functor.

- For G_m×G_m the weight (a,b) is the exterior product of the two point objects.

**Direct prerequisites.** `GeometricSatakeAndFusion:GS4:integral-dual-group/normalized-satake-equivalence`, `GeometricSatakeAndFusion:GS3:fusion/finite-set-functoriality-and-constant-terms`, `ReductiveGroupsPartII:RG2.5`, `GeometricSatakeAndFusion:GS0:loop-geometry/loop-groups-and-local-hecke`, `GeometricSatakeAndFusion:GS0:loop-geometry/grassmannian`, `GeometricSatakeAndFusion:GS0:loop-geometry/schubert-bounds-and-properness`.

**Sources.** [FS], IX.6.2 p331; VI.10.3 pp234–235: Gives the product compatibility; the local comparison follows from product geometry and Hopf reconstruction.



<a id="weil-restriction-naturality"></a>

### Weil restriction naturality

**Identifier:** `GeometricSatakeAndFusion:GS4:integral-dual-group/weil-restriction-naturality`. Imported theorem; stable owner: the GS3 plan.

For a finite separable E′/E and G=Res_{E′/E}G′, the dual pinned group is the product of conjugates of Ĝ′ indexed by embeddings E′→Ē, with its permutation Weil action. After pullback to the E′ divisor base, the closed Grassmannian immersion for the chosen embedding and proper pushforward implement the representation procedure: project to Ĝ′, inflate from Ĝ′⋊W_{E′} to Ĝ⋊W_{E′}, then induce to Ĝ⋊W_E. This comparison is compatible with total cohomology, tensor/collision coherences and the two field-specific half twists; it is not an equivalence replacing W_E by W_{E′} without induction.

**Hypotheses.**

- E is a nonarchimedean local field with residue field F_q of characteristic p; G/E is connected reductive.

- For torsion coefficients Λ is killed by an integer prime to p. The ℓ-adic extension uses a fixed prime ℓ ≠ p and its compatible reductions.

- Satake objects have bounded support, are universally locally acyclic over the leg base, and are flat perverse; representation objects have finite projective coefficient modules.

**Proof plan.**

Use the companion proof contracts below: [Weil restriction and finite-index induction](#weil-restriction-field-adapter). These give the current argument and explicitly replace the earlier proof outline; the endpoint keeps its original identifier.

**Acceptance.**

- For E′=E the construction is identity.

- For a quadratic induced torus the two geometric character factors are permuted by W_E; forgetting that permutation fails.

- Half roots must satisfy r_{E′}=r_E^f when compatible normalization is claimed.

**Direct prerequisites.** `GeometricSatakeAndFusion:GS4:integral-dual-group/normalized-satake-equivalence`, `GeometricSatakeAndFusion:GS3:fusion/finite-set-functoriality-and-constant-terms`, `GeometricSatakeAndFusion:GS0:loop-geometry/loop-groups-and-local-hecke`, `ReductiveGroupsPartII:RG2.5`, `ReductiveGroupsPartII:RG2.0a`, `GeometricSatakeAndFusion:GS0:loop-geometry/grassmannian`, `GeometricSatakeAndFusion:GS0:loop-geometry/schubert-bounds-and-properness`.

**Sources.** [FS], IX.6.3 pp331–332: Precise chosen-embedding inflation/induction and its geometric divisor/Grassmannian map.

**Proof refinements here.** [Weil restriction and finite-index induction](#weil-restriction-field-adapter).



<a id="weil-restriction-field-adapter"></a>

### Weil restriction and finite-index induction

**Identifier:** `GeometricSatakeAndFusion:GS4:integral-dual-group/weil-restriction-field-adapter`. Companion comparison.

**Refines:** `GeometricSatakeAndFusion:GS4:integral-dual-group/weil-restriction-naturality`.

For a finite extension E′/E and G=Res_(E′/E)G′ choose an embedding E′→Ē. The pinned dual group is the product of conjugate copies of Ĝ′, with W_E permuting them. On the selected W_E′ factor, pullback to Div¹_E′ followed by the closed Grassmannian immersion and divisor pushforward corresponds to inflation along Ĝ⋊W_E′→Ĝ′⋊W_E′ and then finite-index induction to Ĝ⋊W_E. This is compatible with conjugating the chosen embedding, base change of legs, and the projection formula. Induction itself is not a strong monoidal functor. If f is the residue degree, q′=q^f and use r′=r^f.

**Hypotheses.**

- E is a nonarchimedean local field of residue characteristic p, G/E is connected reductive and ℓ≠p.

- For reconstruction use bounded-support ULA flat-perverse Satake objects, the parity-corrected fusion tensor and total cohomology; finite-projective continuous Weil fibres.

- Torsion coefficients are killed by an integer prime to p. ℓ-adic coefficients are obtained through compatible reductions; rational assertions are explicitly geometric.

**Proof plan.**

1. Fix the embedding before writing the projection onto a dual factor. The decomposition over Ē identifies the selected Grassmannian as a closed subspace; pull the leg divisor to E′ and apply the source pushforward.

2. The Weil finite-index pushforward is induction of the inflated representation. Check equivariance on every conjugate factor; another embedding conjugates both descriptions. The finite-set comparison is assembled factor by factor.

3. Use the projection formula Ind(U⊗Res V)=Ind(U)⊗V and the Mackey restriction formula. The dimension of Ind(1) is [E′:E], so there is no unqualified strong monoidal induction claim.

4. The degree of geometric Frobenius on W_E′ restricts to f times the E degree, giving r′=r^f. The full conjugate product still has [E′:E] factors; do not replace this degree by only the residue degree in ramified extensions.

**Acceptance.**

- For E′=E the diagram is the identity.

- A quadratic extension gives a two-factor dual product and induction of the trivial line has dimension2, whereas its tensor square has dimension4.

- A totally ramified quadratic extension has f=1 and r′=r but still two conjugate factors.

**Direct prerequisites.** `GeometricSatakeAndFusion:GS4:integral-dual-group/normalization-cocycle-test`, `GeometricSatakeAndFusion:GS4:integral-dual-group/multileg-and-coefficient-reconstruction`, `GeometricSatakeAndFusion:GS0:loop-geometry/ordered-leg-base-change`, `GeometricSatakeAndFusion:GS3:fusion/finite-set-functoriality-and-constant-terms`, `ReductiveGroupsPartII:RG2.0a`, `ReductiveGroupsPartII:RG2.5`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-9-the-local-weil-group`.

**Sources.** [FS], IX.6.3 pp331–332: The source compares divisor pullback/pushforward with inflation and induction after choosing an embedding.



<a id="chevalley-involution"></a>

### Chevalley involution with its inner sign

**Identifier:** `GeometricSatakeAndFusion:GS4:integral-dual-group/chevalley-involution`. Imported theorem; stable owner: the GS3 plan.

Under canonical dual identification, sw* acts by Ad(ρ̂(-1))∘θ on Ĝ, where θ is the pinned Chevalley involution with lattice action μ↦−w₀μ and ρ̂(-1) is evaluated in the adjoint dual torus. It commutes with the geometric Weil action. Internal dual is sw*D, not sw* alone. The inner correction affects the canonical tensor/fibre comparison although it disappears after quotienting dual parameters by conjugacy.

**Hypotheses.**

- E is a nonarchimedean local field with residue field F_q of characteristic p; G/E is connected reductive.

- For torsion coefficients Λ is killed by an integer prime to p. The ℓ-adic extension uses a fixed prime ℓ ≠ p and its compatible reductions.

- Satake objects have bounded support, are universally locally acyclic over the leg base, and are flat perverse; representation objects have finite projective coefficient modules.

**Proof plan.**

1. Reduce via adjoint-isomorphism maps to the simply connected dual and then by rank-one constant terms to PGL₂.

2. Compare the symmetric Verdier pairing on Λ[1](1/2) with the alternating invariant pairing on the SL₂ standard representation. Their ratio acts diagonally as (u,-u), so each simple-root line is multiplied by -1.

3. An automorphism preserving torus/filtration is torus-inner; these rank-one signs identify it with ρ̂(-1). Reassemble using the root datum and canonical pinning.

**Acceptance.**

- For PGL₂ the root-line sign is -1, so omitting ρ̂(-1) gives the wrong fibre comparison when 2 is invertible.

- For a torus w₀=1 and θ inverts characters; for coefficients of characteristic two the inner signs reduce to one.

**Direct prerequisites.** `GeometricSatakeAndFusion:GS4:integral-dual-group/dual-group-identification`, `GeometricSatakeAndFusion:GS4:integral-dual-group/normalized-satake-equivalence`, `GeometricSatakeAndFusion:GS3:fusion/fusion-verdier-duality`, `GeometricSatakeAndFusion:GS3:fusion/symmetric-constant-term`, `GeometricSatakeAndFusion:GS4:integral-dual-group/torus-and-rank-one-identification`, `tauceti:TauCetiRoadmap/ReductiveGroups#layer-9-pinned-chevalleydemazure-group-schemes-over-ℤ`.

**Sources.** [FS], Proposition VI.12.1 and proof pp239–241: Includes the rank-one pairing computation and the essential inner sign.



<a id="enhanced-perfect-satake-extension"></a>

### Perfect-complex Satake extension

**Identifier:** `GeometricSatakeAndFusion:GS4:integral-dual-group/enhanced-perfect-satake-extension`. Imported construction; stable owner: the GS3 plan.

Fix ℓ≠p, a finite quotient Q of W_E through which the pinned action on Ĝ factors, and a Z_ℓ[r]-algebra Λ with r²=q. Compose normalized Satake on finite projective representations of (Ĝ⋊Q)^I with A↦D(A)^∨, using Verdier duality relative to Hck^I_G→[(Div¹)^I/L⁺G]. This is an exact Rep_Λ(Q^I)-linear monoidal functor into the enhanced local Hecke convolution category D■(Hck^I_G,Λ). Using LP3 highest-weight base change and LP4 the universal stable completion of the finite-projective exact representation category, extend it uniquely to a Perf(BQ^I_Λ)-linear exact monoidal functor Perf(B(Ĝ⋊Q)^I_Λ)→D■(Hck^I_G,Λ), coherent in I. Its fusion comparisons give symmetry on the Satake image. Its values lie in the stable idempotent closure of these Satake kernels. Equality with that closure, full faithfulness, and an equivalence with the whole enhanced category are not supplied by this extension theorem.

**Hypotheses.**

- E is a nonarchimedean local field with residue field F_q of characteristic p; G/E is connected reductive.

- For torsion coefficients Λ is killed by an integer prime to p. The ℓ-adic extension uses a fixed prime ℓ ≠ p and its compatible reductions.

- Satake objects have bounded support, are universally locally acyclic over the leg base, and are flat perverse; representation objects have finite projective coefficient modules.

**Uses.**

- HeckeStacksAndLocalShtukas:HS1: Imports this local enhanced kernel functor, then constructs the global Hecke action; it does not own the extension.

- FS IX.2: Scalar extension and stable exactness are used before applying global Hecke correspondences.

**API.**

- `TauCeti.GeometricSatake.perfectSatakeFunctor` (constructor): The exact Perf(BQ^I)-linear monoidal functor on Perf(B(Ĝ⋊Q)^I).

- `TauCeti.GeometricSatake.perfectSatake_onRepresentation` (compatibility): On a finite-projective representation V its value is D(S_V)^∨ in local enhanced convolution.

- `TauCeti.GeometricSatake.perfectSatake_baseChange` (functoriality): Scalar extension Λ→Λ′ commutes with the functor through the specified relative Perf base-change equivalence.

- `TauCeti.GeometricSatake.perfectSatake_exact` (structure): The extension preserves zero objects, cofibres, shifts and retracts.

- `TauCeti.GeometricSatake.perfectSatake_finiteSets` (compatibility): The extension of all collision, permutation and unit comparisons has the same composition coherences.

- `TauCeti.GeometricSatake.perfectSatake_unique` (universal-property): Restriction along the representation embedding identifies the space of exact linear monoidal extensions with that of exact linear monoidal representation functors. A specified coherent isomorphism of restriction functors extends uniquely in this sense; agreement of object values alone is insufficient.

**Checks.**

- `TauCeti.GeometricSatake.test_perfect_unit` (degenerate): The trivial representation gives the convolution unit.

- `TauCeti.GeometricSatake.test_perfect_shift` (compatibility): V[1] gives D(S_V)^∨[1]; it is not represented by an unrelated perverse object in degree zero.

- `TauCeti.GeometricSatake.test_perfect_badPrimeAllowed` (non-example): For G=SL₂ and ℓ=2≠p, whose dual PGL₂ has π₁ of order two, this extension remains in scope; no π₁ invertibility predicate is imposed.

**Proof plan.**

Use the companion proof contracts below: [All-prime perfect Satake kernels](#perfect-kernel-extension-contract). These give the current argument and explicitly replace the earlier proof outline; the endpoint keeps its original identifier.

**Acceptance.**

- A degree-zero finite projective V goes to D(S_V)^∨ with the specified relative duality.

- The coefficient unit maps to the convolution unit and a shift V[1] maps to the kernel shift.

- The statement holds at ℓ dividing π₁(Ĝ) torsion or |Q|; it uses none of the spectral-action exclusions.

**Direct prerequisites.** `GeometricSatakeAndFusion:GS4:integral-dual-group/normalized-satake-equivalence`, `GeometricSatakeAndFusion:GS3:fusion/finite-set-functoriality-and-constant-terms`, `GeometricSatakeAndFusion:GS3:fusion/fusion-verdier-duality`, `LanglandsParameterStacks:LP3`, `LanglandsParameterStacks:LP4`, `EnhancedDerivedSheaves:E5:abstract/stable-infinity-category`, `EnhancedDerivedSheaves:E5:abstract/exact-functors`, `EnhancedDerivedSheaves:E5:abstract/idempotent-completion`, `EnhancedDerivedSheaves:E5:abstract/symmetric-monoidal-infinity-category`, `VStackSheavesAndLisseCategories:VS3`, `DiamondSixOperations:S6`.

**Sources.** [FS], IX.2 p321: Exact relative Perf base change and stable completion used to export the local Satake kernel functor.

**Proof refinements here.** [All-prime perfect Satake kernels](#perfect-kernel-extension-contract).



<a id="perfect-kernel-extension-contract"></a>

### All-prime perfect Satake kernels

**Identifier:** `GeometricSatakeAndFusion:GS4:integral-dual-group/perfect-kernel-extension-contract`. Companion comparison.

**Refines:** `GeometricSatakeAndFusion:GS4:integral-dual-group/enhanced-perfect-satake-extension`.

For every ℓ≠p, R=Z_ℓ[r], finite pinned-action quotient Q and R-algebra Λ, the exact finite-projective representation Satake functor on H=(Ĝ⋊Q)^I, composed with relative Verdier duality and internal dual, extends to a Perf(BQ^I_Λ)-linear exact monoidal functor Perf(BH_Λ)→D■(Hck^I_G,Λ). The required foundational inputs are the relative classifying-stack base-change equivalence and the derived stable idempotent completion of the exact representation category, supplied by LP3/LP4. They must hold without inverting |Q| or π₁(Ĝ)_tors. GS4 owns this kernel application and HS1 consumes it. The conclusion is not full faithfulness or an equivalence with all enhanced sheaves.

**Hypotheses.**

- E is a nonarchimedean local field of residue characteristic p, G/E is connected reductive and ℓ≠p.

- For reconstruction use bounded-support ULA flat-perverse Satake objects, the parity-corrected fusion tensor and total cohomology; finite-projective continuous Weil fibres.

- Torsion coefficients are killed by an integer prime to p. ℓ-adic coefficients are obtained through compatible reductions; rational assertions are explicitly geometric.

**Proof plan.**

1. Over R form the exact Rep(Q^I)-linear kernel functor A↦D(A)^∨, with Verdier dual relative to Hck→[(Div¹)^I/L⁺G]. Its convolution target uses the enhanced pullback, tensor and π♮ operations and their finite-set coherence.

2. Import Perf(BH_R)⊗_(Perf(BQ_R^I))Perf(BQ_Λ^I)≃Perf(BH_Λ). This is a relative base change over BQ, not an invalid assertion that invariants under a modular finite group are exact.

3. Use the universal property of the derived stable idempotent completion of the finite-projective exact representation category, including its exact-sequence relations. Extend the linear monoidal functor and finite-set compatibilities by that universal property.

4. Retain an explicit gap: the current LP3/LP4 nodes about good-prime parameter stacks and restricted Donkin subgroups do not state these all-prime classifying-stack inputs. The enhanced target must also supply the stated relative duality/π♮ coherence.

**Acceptance.**

- I empty gives the coefficient action and unit kernel.

- Q=1 gives the split dual classifying-stack base-change theorem.

- ℓ dividing |Q| is included; a proof that averages over Q is invalid.

- An arbitrary enhanced endomorphism of a Satake kernel need not lift to the representation source; no essential-image equality follows.

**Direct prerequisites.** `GeometricSatakeAndFusion:GS4:integral-dual-group/normalized-satake-equivalence`, `GeometricSatakeAndFusion:GS4:integral-dual-group/multileg-and-coefficient-reconstruction`, `GeometricSatakeAndFusion:GS3:fusion/fusion-verdier-duality`, `GeometricSatakeAndFusion:GS3:fusion/finite-set-functoriality-and-constant-terms`, `LanglandsParameterStacks:LP3`, `LanglandsParameterStacks:LP4`, `VStackSheavesAndLisseCategories:VS2`, `VStackSheavesAndLisseCategories:VS2/completed-ula-solid-duality`, `VStackSheavesAndLisseCategories:VS2/relative-solid-homology`, `VStackSheavesAndLisseCategories:VS2/solid-four-operations`.

**Sources.** [FS], IX.2 p321, before DefinitionIX.2.1; IX.2.1–2.3 pp321–323: The perfect extension uses integral highest-weight base change and the free derived stable extension, before the Hecke applications.



The perfect extension is an application of integral representation theory for
ordinary classifying stacks. It is not the good-prime theorem for a stack of
Langlands parameters. In particular the finite component group Q need not have
order prime to ℓ. Exact-sequence relations in the representation category and
the relative Perf(BQ)-linear structure must be retained. A free category on the
objects alone would not give this universal property.

## Frobenius functions and spherical comparison

A geometric Satake object has no specified function until a Frobenius descent
operator has been chosen on a compatible finite-type model. An arithmetic
multiplicity space can carry a nontrivial Jordan block, or a continuous scalar
character of infinite order. Neither is excluded by geometric semisimplicity.

For a homogeneous support component ε define its function by the alternating
stalk trace multiplied by (−1)^ε, and add the two parity components. This keeps
the ordinary character rather than the supercharacter. The choice r used in the
half-Tate stalk is recorded independently of an embedding into C; ZhuIntro's
negative-square-root convention is translated through this explicit parity
factor.


<a id="normalized-frobenius-function"></a>

### Normalized Frobenius function

**Identifier:** `GeometricSatakeAndFusion:GS4:classical-Satake-comparison/normalized-frobenius-function`. Imported definition; stable owner: the GS3 plan.

Assume G is unramified with a reductive O_E-model and hyperspecial K=G(O_E), and work rationally over a field L containing Q_ℓ and a chosen r with r²=q. A bounded Satake object A with a specified Frobenius descent structure is represented on its finite-type special-fibre model. For homogeneous support parity ε(A), define τ_A(g)=(-1)^{ε(A)} Σ_i(-1)^i Tr(Frob_q;H^i(A_{ḡ})); add this over even/odd summands. Geometric Frobenius acts on L(1) by q^{-1}; for the explicit IC formulas use the canonical Frobenius descent of the constant sheaf on the open Schubert stratum, and the sheaf IC_μ is normalized as j_{!*}L[d_μ](d_μ/2), d_μ=⟨2ρ,μ⟩, using r^{-d_μ} for the half twist. The function is K-biinvariant with bounded double-coset support. A geometric object without Frobenius descent has no specified trace function.

**Hypotheses.**

- E is a nonarchimedean local field with residue field F_q of characteristic p; G/E is connected reductive.

- For torsion coefficients Λ is killed by an integer prime to p. The ℓ-adic extension uses a fixed prime ℓ ≠ p and its compatible reductions.

- Satake objects have bounded support, are universally locally acyclic over the leg base, and are flat perverse; representation objects have finite projective coefficient modules.

**Uses.**

- Classical Satake comparison: Compares the constructed geometric equivalence with the classical SR.4 transform using fixed normalization.

- Gross (3.13): Checks the leading/minuscule coefficient rather than equating IC basis functions with unscaled double-coset indicators.

**API.**

- `TauCeti.GeometricSatake.normalizedTraceFunction` (constructor): The parity-corrected alternating geometric Frobenius stalk trace of a Frobenius-descended Satake object.

- `TauCeti.GeometricSatake.normalizedTrace_add` (simp): Direct sums add trace functions, with parity correction applied separately to the two component summands.

- `TauCeti.GeometricSatake.normalizedTrace_halfTwist` (compatibility): For any integer d, twisting the specified descent by (d/2) multiplies the geometric Frobenius trace by r^{-d}.

- `TauCeti.GeometricSatake.normalizedTrace_biinvariant` (characterisation): Values are constant on K-double cosets and vanish outside finitely many bounded relative positions.

- `TauCeti.GeometricSatake.normalizedTrace_minuscule` (example): For a minuscule μ with canonical constant-sheaf IC Frobenius descent, τ_{IC_μ}=r^{-d_μ}1_{Kμ(π)K}; scaling the descent scales this function.

**Checks.**

- `TauCeti.GeometricSatake.test_trace_unit` (degenerate): τ_unit=1_K with coefficient +1. Use the canonical constant-sheaf/IC Frobenius descent.

- `TauCeti.GeometricSatake.test_trace_torusWeight` (computation): For G_m and weight n, τ is 1_{π^n O_E^×}. Use the canonical constant-sheaf/IC Frobenius descent.

- `TauCeti.GeometricSatake.test_trace_oddMinuscule` (non-example): For split PGL₂ and its minuscule d=1, τ=r^{-1}1_{Kμ(π)K}, whereas the raw alternating trace is -r^{-1}1_{Kμ(π)K}. Use the canonical constant-sheaf/IC Frobenius descent.

**Proof plan.**

1. Use the finite-type special-fibre model and Frobenius-equivariant constructible realization, rather than counting points of an arbitrary diamond.

2. Compute alternating stalk trace, multiply by the component parity, and use hyperspecial loop equivariance for K-biinvariance and bounded Schubert support for compact support.

3. The half twist supplies r^{-d_μ}, and the perverse shift supplies (-1)^{d_μ}; the parity factor cancels the latter.

**Acceptance.**

- The zero-weight object gives the characteristic function of K.

- For a split torus weight μ the function is the characteristic function of μ(π)K.

- For odd minuscule d, the uncorrected alternating trace is negative; the normalized function has leading coefficient r^{-d}.

- These formulas use the canonical constant-sheaf/IC Frobenius descent; scaling that descent scales the trace.

**Direct prerequisites.** `GeometricSatakeAndFusion:GS3:fusion/support-parity`, `GeometricSatakeAndFusion:GS1/integral-family-comparison`, `GeometricSatakeAndFusion:GS4:integral-dual-group/normalized-satake-equivalence`, `SchemeAndStackFoundations:SF.2`, `SmoothRepresentationsOfLocalGroups:SR.4`, `GeometricSatakeAndFusion:GS0:Witt-geometry/perfect-model-and-etale-comparison`.

**Sources.** [Zhu], §2.2 pp434–436, equations (2.2.7)–(2.2.10): Relates IC weight cohomology to the spherical transform, with rational coefficients. [Gross], §3 pp6–8, (3.3), (3.4), (3.6), (3.13); §8 pp15–16 for choices of normalization: Modulus/half-root and minuscule coefficients; the packet separately tracks the perverse parity sign. Section 8 distinguishes central parameter normalizations.



<a id="trace-scalar-conventions"></a>

### Parity and half-Tate scalars

**Identifier:** `GeometricSatakeAndFusion:GS4:classical-Satake-comparison/trace-scalar-conventions`. Companion definition.

For a commutative coefficient ring R define s_R(d)=1 when the integer d is even and −1 when it is odd. For a unit r define h_r(d)=r^(−d), the half-Tate scalar in degree d. For a finite set J of cohomological degrees and scalar stalk traces a_i, put T_R(ε,J,a)=s_R(ε)·Σ_(i∈J)s_R(i)a_i. For an actual stalk the finite sum runs over its cohomology, ε is its support parity and a_i is its geometric-Frobenius trace. The half twist of IC_μ in dimension d_μ multiplies its open-stratum trace by h_r(d_μ). These scalar operations do not construct sheaves or assert Frobenius descent.

**Hypotheses.**

- E is a nonarchimedean local field of residue characteristic p, G/E is connected reductive and ℓ≠p.

- For reconstruction use bounded-support ULA flat-perverse Satake objects, the parity-corrected fusion tensor and total cohomology; finite-projective continuous Weil fibres.

- Torsion coefficients are killed by an integer prime to p. ℓ-adic coefficients are obtained through compatible reductions; rational assertions are explicitly geometric.

**Uses.**

- Frobenius functions and convolution: Separates the support-parity correction from the alternating stalk trace.

- IC leading term and normalized constant term: Pins the half-Tate and cohomological degree scalars before comparing with Haar normalization.

**API.**

- `TauCeti.GeometricSatake.GS4.paritySign` (constructor): s_R(d)=1 for Even d and −1 otherwise, for every integer d.

- `TauCeti.GeometricSatake.GS4.paritySign_zero` (simp): s_R(0)=1.

- `TauCeti.GeometricSatake.GS4.paritySign_add` (compatibility): s_R(a+b)=s_R(a)s_R(b).

- `TauCeti.GeometricSatake.GS4.halfTateFactor` (constructor): h_r(d) is the value of the unit r^(−d).

- `TauCeti.GeometricSatake.GS4.halfTateFactor_add` (relation): h_r(a+b)=h_r(a)h_r(b).

- `TauCeti.GeometricSatake.GS4.normalizedStalkTrace` (constructor): T_R(ε,J,a)=s_R(ε)Σ_(i∈J)s_R(i)a_i.

- `TauCeti.GeometricSatake.GS4.normalizedStalkTrace_singleton` (simp): T_R(ε,{i},a)=s_R(ε)s_R(i)a_i.

- `TauCeti.GeometricSatake.GS4.normalizedStalkTrace_add` (functoriality): For the same ε,J, T_R(ε,J,a+b)=T_R(ε,J,a)+T_R(ε,J,b).

- `TauCeti.GeometricSatake.GS4.normalizedStalkTrace_scale` (compatibility): For c∈R, T_R(ε,J,c·a)=c T_R(ε,J,a).

**Checks.**

- `TauCeti.GeometricSatake.GS4.test_parity_zero` (degenerate): s_Z(0)=1.

- `TauCeti.GeometricSatake.GS4.test_parity_one` (computation): s_Z(1)=−1.

- `TauCeti.GeometricSatake.GS4.test_parity_negative` (computation): s_Z(−1)=−1.

- `TauCeti.GeometricSatake.GS4.test_halfTate_zero` (degenerate): h_r(0)=1 for every unit r.

- `TauCeti.GeometricSatake.GS4.test_halfTate_one` (computation): h_r(1)=r^−1.

- `TauCeti.GeometricSatake.GS4.test_halfTate_negative` (computation): h_r(−1)=r.

- `TauCeti.GeometricSatake.GS4.test_trace_empty` (degenerate): T_R(ε,∅,a)=0.

- `TauCeti.GeometricSatake.GS4.test_trace_IC` (computation): T_R(d,{−d},i↦h_r(d))=h_r(d).

- `TauCeti.GeometricSatake.GS4.test_trace_twoDegrees` (computation): T_Z(1,{0,1},i↦if i=0 then2 else3)=1.

- `TauCeti.GeometricSatake.GS4.test_trace_unit` (compatibility): T_R(0,{0},i↦1)=1, the unit stalk trace.

**Proof plan.**

1. Use integer parity, including negative cohomological degrees; finite sums make the formula meaningful in every commutative ring.

2. Evenness is additive modulo two, so support parity adds under tensor/convolution and the correction multiplies. Powers of the unit r define negative as well as positive half-Tate degrees.

3. For IC_μ=j_!*R[d](d/2), the open stalk lies in degree −d. Its cohomological sign is s_R(−d)=s_R(d); multiplying the support sign cancels it and leaves r^(−d).

**Acceptance.**

- The IC leading coefficient is r^(−d), including odd d.

- Changing r to −r changes this coefficient by (−1)^d.

- In characteristic two the two signs coincide, while the half-Tate scalar still matters.

**Direct prerequisites.** `mathlib:Even`, `mathlib:Units`, `GeometricSatakeAndFusion:GS4:classical-Satake-comparison/normalized-frobenius-function`, `GeometricSatakeAndFusion:GS3:fusion/support-parity`.

**Sources.** [FS], VI.9.4–9.6 pp228–230: Support parity is the sign correction for the ordinary symmetric fibre functor. [ZhuIntro], §5.6 pp82–84, Lemma5.6.1 and Theorem5.6.3: The sheaf-function comparison needs compatible shift and square-root conventions; this explicit parity convention replaces the source's negative square-root realization. [Gross], §§3–4 pp6–9: The resulting positive leading factor matches the normalized classical transform.



<a id="trace-convolution"></a>

### Frobenius trace and convolution

**Identifier:** `GeometricSatakeAndFusion:GS4:classical-Satake-comparison/trace-convolution`. Imported theorem; stable owner: the GS3 plan.

Normalize Haar measure on G(E) by vol(K)=1. For Frobenius-descended rational Satake objects, τ_{A*B}=τ_A*τ_B, where the right side is spherical Hecke convolution with this measure; unit maps to 1_K. The same assertion holds for the existing convolution via its fusion comparison. This is additive on the Grothendieck group of the exact Frobenius-descended category, not an equivalence between all Weil sheaves and arbitrary functions.

**Hypotheses.**

- E is a nonarchimedean local field with residue field F_q of characteristic p; G/E is connected reductive.

- For torsion coefficients Λ is killed by an integer prime to p. The ℓ-adic extension uses a fixed prime ℓ ≠ p and its compatible reductions.

- Satake objects have bounded support, are universally locally acyclic over the leg base, and are flat perverse; representation objects have finite projective coefficient modules.

**Proof plan.**

Use the companion proof contracts below: [Frobenius on bounded perfect models](#finite-model-trace-adapter). These give the current argument and explicitly replace the earlier proof outline; the endpoint keeps its original identifier.

**Acceptance.**

- For a torus, the two weight indicator functions convolve to the sum-weight indicator.

- Rescaling Haar measure would change the product and destroy the unit test.

**Direct prerequisites.** `GeometricSatakeAndFusion:GS4:classical-Satake-comparison/normalized-frobenius-function`, `GeometricSatakeAndFusion:GS3:fusion/fusion-product-and-sign-rule`, `GeometricSatakeAndFusion:GS2:correspondences/convolution-diagram`, `SchemeAndStackFoundations:SF.2`, `SmoothRepresentationsOfLocalGroups:SR.4`, `GeometricSatakeAndFusion:GS0:Witt-geometry/perfect-model-and-etale-comparison`.

**Sources.** [Zhu], §2.1 pp430–433 and §2.2 pp434–436: Convolution is proper bounded pushforward, and the trace comparison uses this geometric construction. [Gross], §2–§3 pp3–7, measure convention quoted in §3: The imported classical transform uses a specified compact-subgroup Haar normalization; no new transform is constructed here.

**Proof refinements here.** [Frobenius on bounded perfect models](#finite-model-trace-adapter).



<a id="finite-model-trace-adapter"></a>

### Frobenius on bounded perfect models

**Identifier:** `GeometricSatakeAndFusion:GS4:classical-Satake-comparison/finite-model-trace-adapter`. Companion comparison.

**Refines:** `GeometricSatakeAndFusion:GS4:classical-Satake-comparison/trace-convolution`.

A trace realization for an unramified hyperspecial Satake object consists of a bounded finite-type special-fibre model with explicit Frobenius descent, and compatible realizations of its bounded convolution and constant-term correspondences. Require trace exchange for proper/compactly supported pushforward, tensor, and the Frobenius-equivariant perfection equivalences, with the stated Haar normalization. Given that data, the parity-normalized stalk trace is well-defined under compatible changes of realization, sends the unit to 1_K, and sends convolution to Hecke convolution. A model related only by an unspecified Frobenius power is not enough to define the same Frob_q trace.

**Hypotheses.**

- E is a nonarchimedean local field of residue characteristic p, G/E is connected reductive and ℓ≠p.

- For reconstruction use bounded-support ULA flat-perverse Satake objects, the parity-corrected fusion tensor and total cohomology; finite-projective continuous Weil fibres.

- Torsion coefficients are killed by an integer prime to p. ℓ-adic coefficients are obtained through compatible reductions; rational assertions are explicitly geometric.

**Proof plan.**

1. Use the explicit finite model and the exact Frobenius operator, rather than rational-point counting on an arbitrary diamond or a bare perfection. Require every comparison used in changing the model to intertwine that operator.

2. Künneth makes stalk tensor traces multiply. The compact-support trace formula for the finite-type convolution fibre turns pushforward into the finite sum matching Hecke convolution with vol(K)=1. Support parities add.

3. For a Frobenius-stable semi-infinite weight λ, apply the same trace exchange to its finite-type intersection and constant-term correspondence. The remaining model/Frobenius compatibility and the exact trace-formula supplier adapter are recorded as a gap, not supplied by the model-existence statement alone.

**Acceptance.**

- A unit model is a point with Frobenius1 and yields 1_K.

- Scaling the descent operator by a scalar a scales its trace function by a.

- Replacing Frob_q by Frob_q^m changes an eigenvalue a to a^m, so an unspecified Frobenius power does not preserve trace.

**Direct prerequisites.** `GeometricSatakeAndFusion:GS4:classical-Satake-comparison/trace-scalar-conventions`, `GeometricSatakeAndFusion:GS0:Witt-geometry/perfect-model-and-etale-comparison`, `GeometricSatakeAndFusion:GS0:Witt-geometry`, `SchemeAndStackFoundations:SF.2`, `GeometricSatakeAndFusion:GS2:correspondences/convolution-diagram`.

**Sources.** [ZhuIntro], Lemma5.6.1 pp82–83: For ordinary finite-field Grassmannians the trace dictionary exchanges convolution and function multiplication. [Zhu], §2.1 pp429–432; AppendixA on perfect spaces: Perfect finite models provide geometric realizations; an explicit Frobenius-equivariant trace adapter is additional to their existence. [FS], VI.7.1–7.5 pp218–220: The Witt fibre comparison transports étale/perverse geometry, and must be enhanced by the stated Frobenius trace data for this application.



<a id="trace-constant-term"></a>

### Frobenius trace and normalized constant terms

**Identifier:** `GeometricSatakeAndFusion:GS4:classical-Satake-comparison/trace-constant-term`. Imported theorem; stable owner: the GS3 plan.

In the split case choose B=TN and dn on N(E) with vol(N(O_E))=1. The classical transform imported from SR.4 is S(f)(t)=δ_B(t)^{1/2}∫_N f(tn)dn, where δ_B(λ(π))^{1/2}=q^{-⟨ρ,λ⟩}. For a Frobenius-descended normalized IC object, S(τ_A) is the weight-by-weight Frobenius character of its normalized cohomology fibre, with the shifted constant-term degree ⟨2ρ,λ⟩ and the matching half Tate normalization included. Here normalized fibre means the weight fibre of the transported normalized dual representation: the geometric cohomological Weil twist must be undone; it is not the unmodified ungraded total-cohomology trace. The corresponding statement for a Levi uses deg_P and the difference ρ_G−ρ_M. For unramified nonsplit G descend this formula using the relative Weyl/Frobenius datum supplied by SR.4; the split integral over N is not copied verbatim with absolute weights.

**Hypotheses.**

- E is a nonarchimedean local field with residue field F_q of characteristic p; G/E is connected reductive.

- For torsion coefficients Λ is killed by an integer prime to p. The ℓ-adic extension uses a fixed prime ℓ ≠ p and its compatible reductions.

- Satake objects have bounded support, are universally locally acyclic over the leg base, and are flat perverse; representation objects have finite projective coefficient modules.

**Proof plan.**

Use the companion proof contracts below: [The geometric and spherical comparison square](#spherical-comparison-square). These give the current argument and explicitly replace the earlier proof outline; the endpoint keeps its original identifier.

**Acceptance.**

- For a split torus N=1 and δ=1, so the transform is identity on weight indicators.

- For a split minuscule μ, the coefficient of each extremal weight matches the normalized representation character; omitting the half twist inserts q^{⟨ρ,μ⟩}.

**Direct prerequisites.** `GeometricSatakeAndFusion:GS4:classical-Satake-comparison/normalized-frobenius-function`, `GeometricSatakeAndFusion:GS3:fusion/symmetric-constant-term`, `GeometricSatakeAndFusion:GS4:integral-dual-group/levi-naturality`, `SchemeAndStackFoundations:SF.2`, `SmoothRepresentationsOfLocalGroups:SR.4`, `ReductiveGroupsPartII:RG2.5`.

**Sources.** [Gross], §3 pp6–8, equations (3.4), (3.5), (3.6): Exact classical modulus and transform conventions. [Zhu], §2.2 pp434–436, equations (2.2.7)–(2.2.10): The rational IC/weight calculation underlying classical comparison, not a construction of integral fusion.

**Proof refinements here.** [The geometric and spherical comparison square](#spherical-comparison-square).



<a id="frobenius-fixed-weight-trace"></a>

### Twisted Frobenius character

**Identifier:** `GeometricSatakeAndFusion:GS4:classical-Satake-comparison/frobenius-fixed-weight-trace`. Companion definition.

Let L be a characteristic-zero coefficient field, Ĝ/L split pinned, σ a finite-order pinned automorphism and (V,ρ,Ψ) a finite-dimensional representation with Ψρ(g)Ψ^−1=ρ(σ(g)). For the ĤT-weight decomposition V=⊕_λ V_λ define ch_σ(V,Ψ)=Σ_(σλ=λ)Tr(Ψ|V_λ)e^λ in L[X^*(ĤT)^σ]. It is the restriction of the regular function gσ↦Tr(ρ(g)Ψ) on the Frobenius component. Under the existing SR4 restriction isomorphism this is a W_rel-invariant function on ĤT/(1−σ)ĤT. Nonfixed weight orbits contribute zero; no averaging or division by the order of σ occurs.

**Hypotheses.**

- E is a nonarchimedean local field of residue characteristic p, G/E is connected reductive and ℓ≠p.

- For reconstruction use bounded-support ULA flat-perverse Satake objects, the parity-corrected fusion tensor and total cohomology; finite-projective continuous Weil fibres.

- Torsion coefficients are killed by an integer prime to p. ℓ-adic coefficients are obtained through compatible reductions; rational assertions are explicitly geometric.

**Uses.**

- Unramified nonsplit classical Satake comparison: Makes the Frobenius character an explicit polynomial on the correct fixed lattice.

- SR4 Frobenius-component invariant algebra: Applies the already constructed restriction isomorphism to actual dual representations.

**API.**

- `TauCeti.GeometricSatake.GS4.twistedFrobeniusCharacter` (constructor): The finite sum over fixed weights with trace coefficients.

- `TauCeti.GeometricSatake.GS4.twistedFrobeniusCharacter_eval` (characterisation): At t, it equals Tr(ρ(t)Ψ); nonfixed weight blocks have trace0.

- `TauCeti.GeometricSatake.GS4.twistedFrobeniusCharacter_add` (functoriality): The character of a direct sum is the sum of the characters.

- `TauCeti.GeometricSatake.GS4.twistedFrobeniusCharacter_tensor` (compatibility): With Ψ_(V⊗W)=Ψ_V⊗Ψ_W, the character is the product in the SR4 target algebra.

- `TauCeti.GeometricSatake.GS4.twistedFrobeniusCharacter_scale` (compatibility): Replacing Ψ by aΨ scales the character by a.

- `TauCeti.GeometricSatake.GS4.twistedFrobeniusCharacter_split` (equivalence): For σ=1, Ψ=1 this is the ordinary character of V.

**Checks.**

- `TauCeti.GeometricSatake.GS4.test_twisted_unit` (degenerate): The trivial representation with Ψ=1 has character1.

- `TauCeti.GeometricSatake.GS4.test_twisted_splitSL2` (compatibility): For the standard SL₂ module with σ=1 and Ψ=1, obtain z+z^−1.

- `TauCeti.GeometricSatake.GS4.test_twisted_swappedWeights` (computation): For Ĝ=G_m², σ exchanging coordinates and V with weights (1,0),(0,1), Ψ exchanging their lines, the twisted character is0, not X₁+X₂.

- `TauCeti.GeometricSatake.GS4.test_twisted_scalar` (computation): A one-dimensional fixed weight λ with Ψ=a gives a e^λ, even for a of infinite multiplicative order.

- `TauCeti.GeometricSatake.GS4.test_twisted_inversion` (non-example): For G_m with σ inversion, V of weights ±1 and Ψ swapping them, the fixed lattice is0 and the trace polynomial is0.

**Proof plan.**

1. For t∈ĤT, ρ(t)Ψ sends V_λ to V_(σλ). Its block trace is zero on every nontrivial σ-orbit, and on a fixed weight it is λ(t)Tr(Ψ|V_λ). This gives the displayed group-algebra polynomial.

2. Conjugacy invariance of the trace makes it descend through the twisted torus quotient. The existing SR4 Frobenius-component restriction theorem supplies W_rel invariance and the target algebra; GS4 does not reprove that invariant-ring theorem.

3. Trace on a direct sum adds; trace on a tensor product multiplies. Hence the construction is additive and multiplicative for compatible intertwining operators, whether or not Ψ is semisimple or has finite order.

**Acceptance.**

- The exponent lattice is the fixed lattice, not the coinvariant lattice.

- An orbit of length greater than one has zero trace, not the sum of its weight dimensions.

- Finite order of σ does not imply finite order of Ψ.

**Direct prerequisites.** `SmoothRepresentationsOfLocalGroups:SR.4`, `ReductiveGroupsPartII:RG2.5`, `GeometricSatakeAndFusion:GS4:integral-dual-group/normalization-cocycle-test`.

**Sources.** [RZ], A.11–A.13 pp448–449: The Frobenius-component character square motivates this restriction. The finite-image/pure-zero identification in A.9 and A.12 is not used. [ZhuIntro], §5.5 pp75–77; Theorem5.6.3 pp83–84: Pinned normalization supplies the appropriate intertwiner; the character comparison is downstream of Satake.



<a id="classical-satake-comparison"></a>

### Classical and geometric Satake comparison

**Identifier:** `GeometricSatakeAndFusion:GS4:classical-Satake-comparison/classical-satake-comparison`. Imported theorem; stable owner: the GS3 plan.

For the unramified/hyperspecial finite-field setting, the diagram from Frobenius-descended rational Satake objects to spherical Hecke functions by τ and to normalized dual representations by Satake commutes with the SR.4 spherical transform and Frobenius character on the dual torus. In the split IC basis with its canonical constant-sheaf Frobenius descent, S(τ_{IC_μ})=χ_μ and S(1_{Kμ(π)K})=q^{⟨ρ,μ⟩}χ_μ plus lower dominant characters; for minuscule μ the lower terms vanish. The nonsplit statement uses the appropriate Frobenius-twisted/relative character datum of SR.4. Both constructions precede this comparison; none of integral reconstruction, rational reductivity, SR.4 or fusion depends on it.

**Hypotheses.**

- E is a nonarchimedean local field with residue field F_q of characteristic p; G/E is connected reductive.

- For torsion coefficients Λ is killed by an integer prime to p. The ℓ-adic extension uses a fixed prime ℓ ≠ p and its compatible reductions.

- Satake objects have bounded support, are universally locally acyclic over the leg base, and are flat perverse; representation objects have finite projective coefficient modules.

**Proof plan.**

Use the companion proof contracts below: [The geometric and spherical comparison square](#spherical-comparison-square). These give the current argument and explicitly replace the earlier proof outline; the endpoint keeps its original identifier.

**Acceptance.**

- For G_m and weight n both paths give z^n.

- For PGL₂ minuscule μ, S(r^{-1}1_{Kμ(π)K}) is the SL₂ standard character z+z^{-1}.

- An unnormalized odd perverse trace would give its negative and fails the comparison.

**Direct prerequisites.** `GeometricSatakeAndFusion:GS4:integral-dual-group/normalized-satake-equivalence`, `GeometricSatakeAndFusion:GS4:classical-Satake-comparison/trace-convolution`, `GeometricSatakeAndFusion:GS4:classical-Satake-comparison/trace-constant-term`, `GeometricSatakeAndFusion:GS4:rational-reductivity/rational-semisimplicity`, `SmoothRepresentationsOfLocalGroups:SR.4`.

**Sources.** [Gross], §3 pp7–8, Proposition 3.6 and (3.13): The triangular and minuscule classical formulas. [Zhu], §2.2 pp434–436, (2.2.7)–(2.2.10): The geometric IC character comparison provides the downstream rational bridge.

**Proof refinements here.** [The geometric and spherical comparison square](#spherical-comparison-square).



<a id="spherical-comparison-square"></a>

### The geometric and spherical comparison square

**Identifier:** `GeometricSatakeAndFusion:GS4:classical-Satake-comparison/spherical-comparison-square`. Companion comparison.

**Refines:** `GeometricSatakeAndFusion:GS4:classical-Satake-comparison/trace-constant-term`, `GeometricSatakeAndFusion:GS4:classical-Satake-comparison/classical-satake-comparison`.

Let G/E be unramified, K hyperspecial and L contain a chosen unit r with r²=q. Use geometric Frobenius, vol(K)=vol(N(O_E))=1, positive valuations λ(π), and the SR4 transform S(f)(λ)=r^(−⟨2ρ,λ⟩)∫_N f(λ(π)n)dn. Given the finite-model trace adapter and the Drinfeld/parameter orientation adapter, S(τ_A)=ch_σ(V_A,Ψ_A) for every Frobenius-descended rational Satake object A, with Ψ_A its pinned normalized Weil operator. In the split IC basis with canonical open-stratum descent this is the ordinary highest-weight character χ_μ. It is a downstream comparison of the two existing constructions.

**Hypotheses.**

- E is a nonarchimedean local field of residue characteristic p, G/E is connected reductive and ℓ≠p.

- For reconstruction use bounded-support ULA flat-perverse Satake objects, the parity-corrected fusion tensor and total cohomology; finite-projective continuous Weil fibres.

- Torsion coefficients are killed by an integer prime to p. ℓ-adic coefficients are obtained through compatible reductions; rational assertions are explicitly geometric.

**Proof plan.**

1. For a σ-fixed coweight λ put k=⟨2ρ,λ⟩. The constant-term weight space is H_c^k(S_λ,A)(k/2); if Φ_λ is the operator before this last twist, its normalized trace is r^(−k)Tr(Φ_λ). Support parity ε≡k modulo2 cancels the compact-support cohomological sign, and the scalar r^(−k) matches the Haar modulus.

2. The finite-model trace formula identifies that trace with the λ coefficient of S(τ_A). The orientation adapter identifies this normalized weight operator with the pinned Ψ_A. Nonfixed weights are permuted by Frobenius and contribute zero; the fixed-weight formula therefore proves the nonsplit equality without an absolute-weight orbit sum.

3. SR4 already constructs the normalized spherical transform, its invariant target and Frobenius-component restriction. Import its injectivity/isomorphism to get the comparison square; do not use the comparison as an input to SR4 or to dual reconstruction.

4. For split IC_μ, purity and the canonical constant-sheaf descent yield the normalized weight multiplicities and hence χ_μ. Its leading stalk coefficient is r^(−d_μ). Thus S(1_(KμK))=r^(d_μ)χ_μ plus lower dominant characters, with no lower terms for minuscule μ.

**Acceptance.**

- For a split torus, the delta function at λ(π) maps to e^λ.

- For GL₂ and μ=(1,0), the raw transform of the minuscule indicator is qX₁+X₂ and the normalized transform is r(X₁+X₂); τ_IC=r^−1 times that indicator gives X₁+X₂.

- For PGL₂ minuscule P¹, the positive/negative weight trace scalars before the last constant-term twist are r,r^−1. The matching twists r^−1,r give normalized coefficients1,1.

- For the nonsplit swapped-weight test, the permuted pair contributes0.

- Scaling Frobenius descent by a scales both sides; the equality is not restricted to finite-image or arithmetically semisimple descent.

**Direct prerequisites.** `GeometricSatakeAndFusion:GS4:classical-Satake-comparison/finite-model-trace-adapter`, `GeometricSatakeAndFusion:GS4:classical-Satake-comparison/frobenius-fixed-weight-trace`, `GeometricSatakeAndFusion:GS4:classical-Satake-comparison/trace-scalar-conventions`, `GeometricSatakeAndFusion:GS4:integral-dual-group/levi-half-tate-transport`, `GeometricSatakeAndFusion:GS4:integral-dual-group/normalized-satake-equivalence`, `GeometricSatakeAndFusion:GS1/semi-infinite-orbits-and-hyperbolic-localization`, `GeometricSatakeAndFusion:GS3:fusion/symmetric-constant-term`, `SmoothRepresentationsOfLocalGroups:SR.4`, `SchemeAndStackFoundations:SF.2`.

**Sources.** [Gross], §3 equations(3.9)–(3.13), pp6–8; §4 pp8–9: The split transform normalization and IC triangular basis agree with the displayed leading coefficient. [ZhuIntro], §5.6 Lemma5.6.1 and Theorem5.6.3 pp82–84: The finite-field convolution and weight-trace argument is used with an explicit parity/root convention. [RZ], LemmaA.13 and the constant-term square p449: The nonsplit Frobenius-component square motivates the fixed-weight argument; it is not used as a mixed-characteristic trace-model theorem.



### Worked normalization checks

For split GL₂, the minuscule orbit has dimension1. The normalized IC stalk on
its open stratum is L[1](1/2). Its alternating trace is −r^−1; the odd support
correction gives τ_IC=r^−1 times the double-coset indicator. The raw constant
term of the indicator is qX₁+X₂. Multiplying its two coefficients by the
respective modulus factors gives r(X₁+X₂), and applying the leading scalar
r^−1 yields the standard dual character X₁+X₂.

For minuscule PGL₂ the two semi-infinite intersections are A¹ and a point. In
positive constant-term degree1 the compactly supported Frobenius scalar is
q·r^−1=r; its final half twist contributes r^−1. In degree−1 the scalar is
r^−1 and the final twist is r. Both normalized weight coefficients are1.
This checks the finite-field trace normalization. Identifying that convention
with the FS Drinfeld/pinned parameter convention still requires GS4-G2.

For an unramified nonsplit torus obtained by restriction of scalars from an
unramified quadratic extension, the dual torus is G_m² with the swap action.
A representation with weights (1,0) and (0,1), whose Frobenius exchanges those
lines, has trace0 on every element of the Frobenius component. It contributes
neither an orbit dimension2 nor the polynomial X₁+X₂. The fixed lattice is
{(n,n)}, so the quotient dual torus has that character lattice. This is the
SR4 torus-character dictionary used in the nonsplit square.

The character identity uses all explicit Frobenius intertwiners. For example,
α=(3+4i)/5 is a 3-adic unit in Q̄₃, has all complex conjugates of absolute value1,
and is not a root of unity. A one-dimensional representation with this
Frobenius eigenvalue is continuous and pure of weight zero, yet has infinite
image. The finite-quotient category and the category of all semisimple pure-zero
objects must therefore remain distinct. This is the trivial-group test for the
broader identification in RZ A.9/A.12; the trace comparison above does not use it.

## Supplier contracts and remaining obligations

Each contract below is imported from its existing owner. A contract already in
the read-only current upstream main is recorded as such; the requests for a
stronger interface are stated separately. No second foundational reconstruction,
classical transform or general trace formula is introduced here.


### ReductiveGroupsPartII:RG2.3

**Contract.** Current upstream README §RG2.3.1: extension-principle and reductive-closed-immersion-criterion. Over a strictly henselian DVR, a generic homomorphism out of a smooth affine group extends when it carries integral points to integral points. The general Prasad–Yu closed-immersion theorem retains the residue-characteristic-two/no-geometric-normal-SO_(2m+1) exception. The README supplies the general criterion; the narrower Suggested lemma only covers char κ≠2. Import the README theorem, never extrapolate that Lean signature.

**Availability.** provided by current upstream plan.

**Consumers.** `GeometricSatakeAndFusion:GS4:integral-dual-group/integral-model-recovery`.

### ReductiveGroupsPartII:RG2.4

**Contract.** Current upstream README §RG2.4 hyperspecial-generation: split Chevalley O-points are generated by the torus and root subgroups, equivalently the torus and simple rank-one Levi O-points. Include the torus in rank zero. No maximal-bounded/lattice-existence refinement is requested.

**Availability.** provided by current upstream plan.

**Consumers.** `GeometricSatakeAndFusion:GS4:integral-dual-group/integral-model-recovery`.

### ReductiveGroupsPartII:RG2.5

**Contract.** Current upstream README §RG2.5: pinned integral dual group and root datum, simple Levi and central-isogeny maps, Galois action, grading cocharacter, geometric central/component grading and product/Weil-restriction data. Import highest-weight convex-hull and rank-one closed subgroup structure through the existing reductive-group representation owner; do not introduce a second reconstruction theorem.

**Availability.** provided by current upstream plan.

**Consumers.** `GeometricSatakeAndFusion:GS4:rational-reductivity/geometric-rational-recognition`, `GeometricSatakeAndFusion:GS4:integral-dual-group/characteristic-two-image-test`, `GeometricSatakeAndFusion:GS4:integral-dual-group/integral-model-recovery`, `GeometricSatakeAndFusion:GS4:integral-dual-group/geometric-pinning-descent`, `GeometricSatakeAndFusion:GS4:integral-dual-group/normalization-cocycle-test`, `GeometricSatakeAndFusion:GS4:integral-dual-group/levi-half-tate-transport`, `GeometricSatakeAndFusion:GS4:integral-dual-group/weil-restriction-field-adapter`, `GeometricSatakeAndFusion:GS4:classical-Satake-comparison/frobenius-fixed-weight-trace`.

### ReductiveGroupsPartII:RG2.0a

**Contract.** Finite separable Weil restriction has the product over embeddings after algebraic-closure base change, with the Galois permutation action. This is the existing upstream rational-point/Weil-restriction contract.

**Availability.** provided by current upstream plan.

**Consumers.** `GeometricSatakeAndFusion:GS4:integral-dual-group/weil-restriction-field-adapter`.

### tauceti:TauCetiRoadmap/ReductiveGroups#layer-6-reductive-and-semisimple-groups

**Contract.** For a connected finite-type affine group over a characteristic-zero field, semisimplicity of finite-dimensional representations is equivalent to reductivity. Finite type and connectedness are first supplied by MC.6 recognition; no infinite pro-group theorem is attributed to this layer.

**Availability.** provided by existing upstream plan.

**Consumers.** `GeometricSatakeAndFusion:GS4:rational-reductivity/geometric-rational-recognition`.

### tauceti:TauCetiRoadmap/ClassFieldTheory#layer-9-the-local-weil-group

**Contract.** Use the existing local Weil group, continuous finite-projective representations, finite-extension inclusion W_E′⊂W_E and degree convention |Frob_geom|=1. The inclusion has residue degree f and q′=q^f. GS4’s separate field adapter proves the divisor pullback/pushforward comparison with restriction and finite-index induction; no Satake geometry is attributed to ClassFieldTheory.

**Availability.** provided by existing upstream plan.

**Consumers.** `GeometricSatakeAndFusion:GS4:integral-dual-group/weil-restriction-field-adapter`.

### LanglandsParameterStacks:LP3

**Contract.** Two exact additional interfaces are needed. (1) In characteristic two for SL₂, the tilting factorization T(6·2^a−2)=T(2^{a+1}−2)⊗T(4)^[a], Steinberg-square/kernel invariant identity, good-filtration invariant multiplicities, tensor closure and highest-weight direct summand of V^{⊗n}. (2) For every ℓ≠p and R=Z_ℓ[r], relative base change Perf(B(Ĝ⋊Q)^I_R)⊗_(Perf(BQ_R^I))Perf(BQ_Λ^I)≃Perf(B(Ĝ⋊Q)^I_Λ) for every R-algebra Λ. Neither interface follows from prime-to-ℓ Donkin or parameter-stack generation; do not invert |Q| or π₁(Ĝ)_tors.

**Availability.** refinement needed.

**Consumers.** `GeometricSatakeAndFusion:GS4:integral-dual-group/characteristic-two-image-test`, `GeometricSatakeAndFusion:GS4:integral-dual-group/perfect-kernel-extension-contract`.

### LanglandsParameterStacks:LP4

**Contract.** For H=(Ĝ⋊Q)^I over the stated coefficient rings, Perf(BH) is the derived stable idempotent completion of its exact category of finite-projective representations, with exact-sequence relations and the universal property for exact Perf(BQ^I)-linear monoidal functors. Retain multileg/exterior-product coherence for all ℓ≠p. This is an ordinary classifying-stack input, not the restricted parameter-stack Perf theorem.

**Availability.** refinement needed.

**Consumers.** `GeometricSatakeAndFusion:GS4:integral-dual-group/perfect-kernel-extension-contract`.

### VStackSheavesAndLisseCategories:VS1

**Contract.** Identify the transported root-line Tate character in the locally constant perfect Drinfeld equivalence IV.7.3, with its action on a geometric divisor fibre and its operator on representation parameters. Match the stalk half twist Frob_geom↦r^−1 with the positive parameter cocycle (2ρ_G−2ρ_M)(r)^{|w|} of IX.7.1, documenting any inverse/contravariant action and Borel convention. This is not an equivalence on all D_et.

**Availability.** refinement needed.

**Consumers.** `GeometricSatakeAndFusion:GS4:integral-dual-group/geometric-pinning-descent`, `GeometricSatakeAndFusion:GS4:integral-dual-group/normalization-cocycle-test`, `GeometricSatakeAndFusion:GS4:integral-dual-group/levi-half-tate-transport`.

### VStackSheavesAndLisseCategories:VS2

**Contract.** Extend the imported completed-ULA solid-duality, relative-solid-homology and four-operation comparisons to the Λ-linear enhanced convolution target of IX.2, with arbitrary R-algebra coefficient extension, relative D(A)^∨, π♮ composition and finite-set coherence on the bounded Satake kernels. The existing completed-duality statement has a specified completed prime-to-p coefficient scope; expose the coefficient-extension adapter rather than silently enlarging it.

**Availability.** refinement needed.

**Consumers.** `GeometricSatakeAndFusion:GS4:integral-dual-group/perfect-kernel-extension-contract`.

### SchemeAndStackFoundations:SF.2

**Contract.** Integrate the already assigned finite-field constructible trace-formula input (SF.2 points to CohomologicalPointCounting/PR196) with proper/compact-support pushforward, Künneth and stalk traces on the bounded finite-type Witt models. Specify Frob_q, Λ(1) eigenvalue q^−1, and Frobenius-equivariant perfection/model changes. The current upstream checkout has no CohomologicalPointCounting folder, so its unverified module signatures are not baseline citations here. Do not replan a general trace theorem.

**Availability.** refinement needed.

**Consumers.** `GeometricSatakeAndFusion:GS4:classical-Satake-comparison/finite-model-trace-adapter`, `GeometricSatakeAndFusion:GS4:classical-Satake-comparison/spherical-comparison-square`.

### SmoothRepresentationsOfLocalGroups:SR.4

**Contract.** Current upstream README SR4.1: spherical algebra with vol(K)=1, transform δ_B^1/2∫_N with vol(N(O))=1, positive valuation λ(π) and δ_B^1/2=r^−⟨2ρ,λ⟩. Import satake-isomorphism, torus-character-dictionary and frobenius-component-invariants: target L[X_*(T)^σ]^(W_abs^σ), equivalently invariant functions on ĤT/(1−σ)ĤT. GS4 adds only the geometric trace comparison.

**Availability.** provided by current upstream plan.

**Consumers.** `GeometricSatakeAndFusion:GS4:classical-Satake-comparison/frobenius-fixed-weight-trace`, `GeometricSatakeAndFusion:GS4:classical-Satake-comparison/spherical-comparison-square`.

### GeometricSatakeAndFusion:GS0:Witt-geometry

**Contract.** Supply bounded finite-type models and convolution/constant-term models with specified Frob_q descent, whose étale equivalences intertwine that exact Frobenius rather than only a power. The existing perfect-model node supplies the underlying geometry; this is its arithmetic trace adapter, used only downstream.

**Availability.** refinement needed.

**Consumers.** `GeometricSatakeAndFusion:GS4:classical-Satake-comparison/finite-model-trace-adapter`.

### GeometricSatakeAndFusion:GS2:correspondences

**Contract.** For every n, the n-step PGL₂ minuscule convolution source is a smooth perfected iterated P¹-bundle of dimension n, its map is proper semismall and the base-point fibre has dimension≤n/2. Supply these geometric facts with compatible finite-type models. GS4 derives the modular Hom-to-top-Borel–Moore identification itself from EDC duality; no modular decomposition or modular Hom formula is requested from GS2.

**Availability.** refinement needed.

**Consumers.** `GeometricSatakeAndFusion:GS4:integral-dual-group/minuscule-tensor-invariants`.

### Open mathematical obligations

These five obligations delimit the plan's proof closure. Every target is
represented by an imported endpoint or a companion node and its prerequisites.
The planning pass covers all four stages; none is called dependency-closed.
Formalizing the missing geometric carriers is the purpose of the roadmap, not
an extra mathematical hypothesis hidden in a suggested signature.


**GS4-G1 — Characteristic-two rank-one supplier interfaces.** The invariant-count repair is derived in minuscule-tensor-invariants and characteristic-two-image-test. LP3 must export the stated tilting/Frobenius-kernel identities, and GS2 must expose the smooth semismall minuscule convolution input with its finite models. Existing weaker nodes do not yet certify these exact interfaces. This is not the false highest-weight-only LemmaVI.11.2.

Consumers: `GeometricSatakeAndFusion:GS4:integral-dual-group/characteristic-two-image-test`, `GeometricSatakeAndFusion:GS4:integral-dual-group/integral-model-recovery`, `GeometricSatakeAndFusion:GS4:integral-dual-group/dual-group-identification`.

**GS4-G2 — Drinfeld stalk and parameter orientation.** The corrected cocycle multiplication is established algebraically, but an exact dictionary between the transported geometric root-line character, stalk Frob_q and FS IX.7.1 positive parameter exponent is still required from VS1. Identify the inverse-action/Borel convention explicitly; do not set κ(Frob)=r^−1 and assert both conventions agree without calculation.

Consumers: `GeometricSatakeAndFusion:GS4:integral-dual-group/normalization-cocycle-test`, `GeometricSatakeAndFusion:GS4:integral-dual-group/levi-half-tate-transport`, `GeometricSatakeAndFusion:GS4:classical-Satake-comparison/spherical-comparison-square`, `GeometricSatakeAndFusion:GS4:integral-dual-group/normalized-satake-equivalence`.

**GS4-G3 — All-prime perfect and enhanced coefficient adapters.** LP3/LP4 must supply the all-ℓ≠p relative classifying-stack base change and derived exact-representation completion, and VS2 must expose relative duality/π♮ coherence after arbitrary stated coefficient extension. Existing restricted parameter-stack theorems and completed-coefficient kernels are insufficient.

Consumers: `GeometricSatakeAndFusion:GS4:integral-dual-group/perfect-kernel-extension-contract`, `GeometricSatakeAndFusion:GS4:integral-dual-group/enhanced-perfect-satake-extension`.

**GS4-G4 — Finite-model Frobenius trace handoff.** GS0 and SF.2 must jointly provide the exact Frobenius-equivariant bounded models and trace exchange specified above, including unramified nonsplit constant-term diagrams. RZ A.13 is an equal-characteristic pattern, not this mixed-characteristic model theorem. The comparison theorem explicitly retains this hypothesis.

Consumers: `GeometricSatakeAndFusion:GS4:classical-Satake-comparison/finite-model-trace-adapter`, `GeometricSatakeAndFusion:GS4:classical-Satake-comparison/spherical-comparison-square`, `GeometricSatakeAndFusion:GS4:classical-Satake-comparison/normalized-frobenius-function`, `GeometricSatakeAndFusion:GS4:classical-Satake-comparison/classical-satake-comparison`.

**GS4-G5 — Larger Witt base fields and Zhu’s own tensor constraint.** The imported FS comparison gives the rational Witt equivalence over an algebraic closure of a finite field, with the H* tensor constraint transported from fusion. It does not identify Zhu’s independently constructed monoidal constraint or cover every algebraically closed k. The accepted PartII design now routes the 29 rational Gelfand-proof items to the separate GeometricSatakeAndFusionPartIIRationalGelfandProof brief; no completed proof nodes of that continuation exist. That owner must provide its equivalence at full generality or a base-field/constraint comparison. It is not an input into the FS integral theorem.

Consumers: `GeometricSatakeAndFusion:GS4:rational-reductivity/witt-rational-tannakian-category`, `GeometricSatakeAndFusion:GS4:integral-dual-group/witt-rational-satake-equivalence`.

| Stage | Coverage | Remaining |
| --- | --- | --- |

| `GeometricSatakeAndFusion:GS4` | planned | GS4-G1: exact characteristic-two suppliers; GS4-G2: Drinfeld orientation; GS4-G3: all-prime Perf/enhanced adapters; GS4-G4: finite-model Frobenius trace; GS4-G5: independent rational Witt continuation |

| `GeometricSatakeAndFusion:GS4:classical-Satake-comparison` | planned | GS4-G2: normalization dictionary needed for the pinned representation square; GS4-G4: Frobenius-equivariant model and trace handoff |

| `GeometricSatakeAndFusion:GS4:integral-dual-group` | planned | GS4-G1: tilting and minuscule geometry supplier interfaces; GS4-G2: normalization orientation; GS4-G3: all-prime perfect extension inputs; GS4-G5: full Zhu variant beyond the FS comparison |

| `GeometricSatakeAndFusion:GS4:rational-reductivity` | planned | GS4-G5: larger algebraically closed Witt base fields and independent tensor constraint; the geometric FS generic-fibre recognition has no new mathematical gap |

### Atlas landmarks

Keep the existing ten GS4 planets under their original node identifiers. Add
“Twisted Frobenius character” in the classical comparison layer. This gives six
planets in integral-dual-group, two in rational-reductivity and three in
classical-Satake-comparison. Proof adapters are not additional integral planets.


- Satake coordinate Hopf algebra: `GeometricSatakeAndFusion:GS4:integral-dual-group/geometric-coordinate-hopf-algebra`.

- Geometric Satake semisimplicity: `GeometricSatakeAndFusion:GS4:rational-reductivity/rational-semisimplicity`.

- Generic Satake reductivity: `GeometricSatakeAndFusion:GS4:rational-reductivity/generic-fibre-reductivity`.

- Pinned geometric dual group: `GeometricSatakeAndFusion:GS4:integral-dual-group/dual-group-identification`.

- Witt vector geometric Satake: `GeometricSatakeAndFusion:GS4:integral-dual-group/witt-rational-satake-equivalence`.

- Normalized Satake equivalence: `GeometricSatakeAndFusion:GS4:integral-dual-group/normalized-satake-equivalence`.

- Chevalley involution: `GeometricSatakeAndFusion:GS4:integral-dual-group/chevalley-involution`.

- Perfect Satake kernels: `GeometricSatakeAndFusion:GS4:integral-dual-group/enhanced-perfect-satake-extension`.

- Normalized Frobenius function: `GeometricSatakeAndFusion:GS4:classical-Satake-comparison/normalized-frobenius-function`.

- Classical Satake comparison: `GeometricSatakeAndFusion:GS4:classical-Satake-comparison/classical-satake-comparison`.

- Twisted Frobenius character: `GeometricSatakeAndFusion:GS4:classical-Satake-comparison/frobenius-fixed-weight-trace`.

## Source versions and corrections

All statements and proof plans above are written in mathematical prose; the
locators identify what was read. Public PDFs were checked on 19 October 2026.
The Jantzen reference was read in the maintainer-cleared copy in place. Its
contents and file were not copied. Earlier corrected source findings E25–E35
remain owned by the GS3 plan; their corrected contracts are imported here.


### [FS] Geometrization of the local Langlands correspondence

Laurent Fargues; Peter Scholze. arXiv:2102.13459v4, 27 November 2024; author PDF, 356 pages.

Public text: [Geometrization of the local Langlands correspondence](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf).

Read: IV.7 pp164–166; VI.7.5–7.10 pp219–222; VI.9.6–12 pp230–241; IX.2 p321; IX.6 pp330–332; IX.7 p334.

SHA-256: `9ab9efbd0df251bfa3b610d1d1d88a8dfb1bdf7c397bd04f4c277280d98ae905`.

### [Zhu] Affine Grassmannians and the geometric Satake in mixed characteristic

Xinwen Zhu. Annals of Mathematics 185 (2017), 403–492; published PDF.

Public text: [Affine Grassmannians and the geometric Satake in mixed characteristic](https://annals.math.princeton.edu/wp-content/uploads/annals-v185-n2-p02-p.pdf).

Read: §2.1 pp429–432: semisimplicity and semismallness; §2.2 pp433–437: weights; §2.5 pp454–455: rational group identification.

SHA-256: `5d50b415048f3a5ad14bccf1c8da83fc5a680fcf13b60911ca269daa474431a7`.

### [Gross] On the Satake isomorphism

Benedict H. Gross. Author preprint, 17 pages; published in Galois Representations in Arithmetic Algebraic Geometry (1998), 223–237.

Public text: [On the Satake isomorphism](https://people.math.harvard.edu/~gross/preprints/sat.pdf).

Read: §3 pp6–8: Haar normalization and triangular transform; §4 pp8–9: IC basis.

SHA-256: `9bd0077b2057edd32885e46fd38872f423a4d45fef6bec0aa181af32dee062b3`.

### [DM] Tannakian categories

Pierre Deligne; James S. Milne. Milne revised author text, 2012; original in LNM900 (1982).

Public text: [Tannakian categories](https://www.math.columbia.edu/~dejong/tannakian/Deligne-Milne-Tannakian-Categories.pdf).

Read: §2 pp24–27, Proposition2.20, Corollary2.22, Proposition2.23.

SHA-256: `48f8af5249081217fc4a806414a764d9d69d66eff9092ddd8e2cf0ea078579e8`.

### [PY] On quasi-reductive group schemes

Gopal Prasad; Jiu-Kang Yu; appendix by Brian Conrad. Author preprint, Corollary1.3; published J. Algebraic Geometry15 (2006), 507–549, Corollary5.2.

Public text: [On quasi-reductive group schemes](https://math.stanford.edu/~conrad/papers/qrg.pdf).

Read: Corollary1.3 p2; §5.4 p12.

SHA-256: `138d931a21fa522d97449c77acf429918826b1ef649be940d4721d616a1fc73b`.

### [DH] Decomposition of tensor products of modular irreducibles for SL2

Stephen Doty; Anne Henke. arXiv:math/0205186v1, 2002; author preprint.

Public text: [Decomposition of tensor products of modular irreducibles for SL2](https://arxiv.org/pdf/math/0205186).

Read: Lemmas1.1 and1.4 pp3–4; Steinberg-square example p18.

SHA-256: `8fb52434afec7149a85783fbc791f17cb2f7c539312bc3aec94a14ada10f4d6f`.

### [ZhuIntro] An introduction to affine Grassmannians and the geometric Satake equivalence

Xinwen Zhu. arXiv:1603.05593v2, 4 April 2016; 86-page preprint, not the typeset Park City volume.

Public text: [An introduction to affine Grassmannians and the geometric Satake equivalence](https://arxiv.org/pdf/1603.05593).

Read: §5.5 pp75–77, especially Lemmas5.5.5 and5.5.7; §5.6 pp82–84, Lemma5.6.1 and Theorem5.6.3.

SHA-256: `86fbada481347c63634167801b34d0865c3bbf682d5d20c0513b36feab7fa1a9`.

### [RZ] Construction of the full Langlands dual group via the geometric Satake correspondence

Timo Richarz; Xinwen Zhu. Appendix to Zhu, The geometric Satake correspondence for ramified groups, Ann. Sci. ENS48 (2015), 409–451; published PDF.

Public text: [Construction of the full Langlands dual group via the geometric Satake correspondence](https://numdam.org/item/10.24033/asens.2248.pdf).

Read: Appendix pp444–449, especially A.6, A.8–A.13; compared with arXiv:1107.5762v3 pp30–34.

SHA-256: `0ee015b56f201e6a5a87b46f3ebbbfe2a09656e2997598429d6cb9340a4b3b7b`.

### [Jantzen] Representations of algebraic groups

Jens Carsten Jantzen. Second edition, AMS Mathematical Surveys and Monographs107 (2003); maintainer-cleared copy read in place.

Read: II.3.16–3.19 pp197–200: Steinberg kernel and self-duality; II.4.16–4.21 pp210–213: good-filtration invariants and tensor products; II.E.1–E.7 pp457–462: tilting modules, summands and tensor products.

### GeometricSatakeAndFusion/E36 — error

**Version and locator.** [RZ], Published CorollaryA.8 p447; compared with arXiv:1107.5762v3 p32.

**Source claim, in our words.** The proposed isomorphism between algebraic and geometric semidirect products changes g by adjoint conjugation depending on γ and preserves the section (1,γ).

**Correction.** After a lifted grading cocycle t, use (g,w)↦(g t(w),w) from geometric to pinned semidirect products, and (h,w)↦(h t(w)^−1,w) in the other direction. The source’s adjoint image need not lift before a half-Tate choice.

**Check.** A group map preserving both the normal subgroup and W-section would have to intertwine the two actions directly. The displayed conjugation does not satisfy that product condition in general. The lifted cocycle multiplication does: expand the product and use t(wv)=t(w)σ_w(t(v)).

**Extent and prior correction.** Affects a stated result. Corrected formula in Zhu, An introduction to affine Grassmannians, arXiv:1603.05593v2, Lemma5.5.7 pp76–77. This later preprint was read; no claim to collation of its typeset volume..

**Search for corrections.**

- 2026-10-19: read the published ENS Appendix pp446–449 at Numdam and the arXivv3 appendix.

- 2026-10-19: read ZhuIntro arXivv2 §5.5, including its multiplication formula; checked the arXiv version histories.

- 2026-10-19: bounded title/CorollaryA.8/erratum queries and Numdam article listing; no separate correction notice located.

### GeometricSatakeAndFusion/E37 — error

**Version and locator.** [RZ], Published RemarkA.9(i) p447, RemarkA.9(ii) and TheoremA.12 p448; compared with arXiv:1107.5762v3 pp32–33.

**Source claim, in our words.** Over a finite field the finite-quotient representation subcategory is identified with all semisimple representations pure of weight zero, and that identification is used to describe the perverse-sheaf category in A.12.

**Correction.** Retain the finite-image condition in the finite-quotient formulation, or allow arbitrary continuous Frobenius intertwiners in the larger weight-zero formulation and enlarge the representation target accordingly. The classical comparison here uses explicit Frobenius operators and their traces without either identification.

**Check.** For G=1, take ℓ=3 and α=(3+4i)/5 in Q̄₃. It is a 3-adic unit, so geometric Frobenius↦α extends continuously from Z to Gal(F̄_q/F_q) for q of characteristic≠3. Both complex conjugates have absolute value1, so this one-dimensional representation is semisimple and pure of weight zero. But α has monic minimal polynomial x²−(6/5)x+1 and is not an algebraic integer, hence not a root of unity. Its image is infinite. Thus it is not in the finite-quotient subcategory already for the trivial group.

**Extent and prior correction.** Affects a stated result. new.

**Search for corrections.**

- 2026-10-19: read the published Numdam Appendix pp447–449 and compared arXiv:1107.5762v3; both contain the identification.

- 2026-10-19: Numdam article page and arXiv version listing; no separate correction listed in the opened records.

- 2026-10-19: bounded queries for Richarz/Zhu AppendixA, RemarkA.9, pure weight zero, finite image and erratum; no correction of this point located. The Richarz erratum for a different IMRN paper is not evidence about this appendix.

- 2026-10-19: screened the atlas source-issue register for this appendix and finite-image/purity identification; no matching entry found. This is a bounded search, not a claim about unpublished correspondence.

## Library boundary and suggested signatures

The checked baseline is Mathlib082e2d37e8b0463410cdb532e111cd43d5a66174 and
TauCetif790474821cf4256814db967cb154e7af3d0c369. The current library and
TauCetiRoadmap main were also screened read-only to avoid planning completed or
already planned mathematics. In particular, known-Hopf Tannaka reconstruction
is a comparison after constructing the coordinate Hopf algebra. It does not
supply the relative existence theorem for an arbitrary Satake category.


- `tauceti:TauCeti.Tannaka.tensorAutFunctor`, TauCeti/Algebra/AlgebraicGroup/Representation/Tannaka/GroupFunctor.lean: For a given bialgebra H (a semiring) over a commutative ring R, tensor automorphisms of scalar extension on finitely generated H-comodules. Commutativity of H is not required here. Does not construct H from an arbitrary tensor category.

- `tauceti:TauCeti.Tannaka.pointsFunctorIsoTensorAutFunctor`, TauCeti/Algebra/AlgebraicGroup/Representation/Tannaka/GroupFunctor.lean: Over a field k and a given commutative Hopf algebra H, identifies its points functor with the tensor automorphisms of scalar extension. This is a comparison after reconstruction, not the relative integral existence theorem.

- `mathlib:HopfAlgebra`, Mathlib/RingTheory/HopfAlgebra/Basic.lean: An antipode on a bialgebra satisfying the two convolution inverse identities; commutativity is an additional algebra hypothesis.

- `mathlib:Bialgebra`, Mathlib/RingTheory/Bialgebra/Basic.lean: Compatible algebra and coalgebra structures on a semiring/module; the underlying coordinate algebra, not the representing object F(L1) before dualization.

- `tauceti:TauCeti.AffineGroupSchemeCat`, TauCeti/AlgebraicGeometry/AffineGroupScheme/Basic.lean: Affine group objects over Spec of a commutative ring; usable for the integral reconstructed group.

- `tauceti:TauCeti.ReductiveAffineGroupSchemeCat`, TauCeti/AlgebraicGeometry/AffineGroupScheme/Reductive.lean: Finite-type reductive affine group schemes over a field; usable for the generic fibre, not a definition over Z_ℓ.

- `mathlib:Module.Flat`, Mathlib/RingTheory/Flat/Basic.lean: Injectivity of tensor maps for finitely generated submodules, with the standard injective-map characterization.

- `mathlib:CategoryTheory.Monad.HasCoequalizerOfIsSplitPair`, Mathlib/CategoryTheory/Monad/Monadicity.lean: For every F-split parallel pair, its coequalizer exists in the source category.

- `mathlib:CategoryTheory.Monad.PreservesColimitOfIsSplitPair`, Mathlib/CategoryTheory/Monad/Monadicity.lean: F preserves coequalizers of every F-split parallel pair.

- `mathlib:CategoryTheory.Monad.ReflectsColimitOfIsSplitPair`, Mathlib/CategoryTheory/Monad/Monadicity.lean: F reflects coequalizers of every F-split parallel pair.

- `tauceti:TauCeti.reductiveAffineGroupSchemeProperty`, TauCeti/AlgebraicGeometry/AffineGroupScheme/Reductive.lean: Object property on finite-type affine group schemes over a field, transported from the reductive coordinate Hopf-algebra property.

- `mathlib:Even`, Mathlib/Algebra/Group/Even.lean: Even d means d=a+a; the additive declaration generated from IsSquare, specialized here to integers.

- `mathlib:Units`, Mathlib/Algebra/Group/Units/Defs.lean: A monoid element together with a two-sided inverse; integer powers of units permit every half-Tate degree.

- `mathlib:LinearMap`, Mathlib/Algebra/Module/LinearMap/Defs.lean: Bundled semilinear maps; identity ring homomorphism specializes to the linear maps used by the flat-module test.

The suggested file retains only scalar definitions with real bodies over
existing rings and their basic API/checks, plus the flat-module saturation
endpoint and the cocycle multiplication identity over actual groups. The full
normalization isomorphism, twisted character construction and every geometric,
Hopf-object, perfect-stack and enhanced-kernel target remain in this document
with their complete APIs and checks. No arbitrary category or proposition is
used as a substitute for their carriers.

The generated additive declaration Even is present in the pinned source via
IsSquare's additive transport; the declaration index does not list generated
names exhaustively. Its source and ambient variables were read directly. The
suggested file elaborates with this declaration.
