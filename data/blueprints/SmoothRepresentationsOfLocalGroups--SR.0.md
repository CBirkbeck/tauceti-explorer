# Smooth representations of local groups, part SR.0: smooth categories, Hecke algebras, induction, admissibility and second adjointness

This part covers the stages SR.0, SR.0:abelian-category, SR.0:derived-extension, SR.1, SR.2, SR.2a, SR.3 and SR.3a of SmoothRepresentationsOfLocalGroups. It covers the smooth representation theory of a locally profinite group over an arbitrary coefficient ring, from the definition of smoothness to the Bernstein decomposition, the Langlands classification and second adjointness over ℂ. Spherical representations and the Satake isomorphism (SR.4), integral families for GL_n (SR.5) and the late integral finiteness and second adjointness (SR.6) are the other parts of the roadmap. Every declaration below is a planned target. None is claimed to exist in Tau Ceti, except the baseline declarations listed as such.

The baseline is Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369` with Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`. Every cited baseline declaration was read at that commit. The layers are written in their dependency order, which the section on layer order explains.

## Scope and boundaries

- **In scope.** Locally profinite groups and their compact open subgroups; smooth representations over any commutative ring; invariants, averaging and admissibility; the smooth dual; the categorical and Λ-linear Bernstein centre; the derived category with K-injective resolutions, dg enhancement and derived invariants; Hecke algebras by convolution and by permutation modules, and their comparison with the double-coset ring; idempotented algebras and nondegenerate modules; Iwahori decompositions, positive Hecke homomorphisms, the Iwahori–Matsumoto and Bernstein presentations; smooth and compact induction, Frobenius reciprocity, Mackey theory, Jacquet modules, parabolic induction, first adjointness, the geometric lemma, Casselman's pairing and the canonical lifting; cuspidal theory, Harish-Chandra compactness, admissibility of irreducibles, uniform admissibility; cuspidal support, the Bernstein decomposition and centre, temperedness, the Langlands classification and the Iwahori block; stabilisation, Jacquet duality and second adjointness over ℂ.
- **Imported.** Profinite discrete modules, their canonical carrier, coinduction and continuous cohomology (Tau Ceti ProfiniteCohomology Layers 0, 1, 7, 10 and 12); supernatural orders and pro-p groups (ProfiniteProPGroups Layer 1); algebraic induction in stages and the Mackey decomposition (RepresentationTheory/InductionRestriction Layers 0 and 3); the double-coset Hecke ring (ModularForms Layer 2); split reductive structure theory (ReductiveGroups Layer 7); topologies on rational points, relative root data, parahoric and congruence subgroups and the Iwasawa, Cartan and Iwahori–Bruhat decompositions (ReductiveGroupsPartII RG2.0, RG2.1, RG2.3, RG2.4).
- **Not here.** The Satake transform and spherical comparison z ↦ e_K z (SR.4); derivatives, co-Whittaker modules and integral GL_n families (SR.5); integral centre finiteness and integral second adjointness (SR.6); the ∞-categorical enhancement and the comparison with étale sheaves on [∗/G] (EnhancedDerivedSheaves and the V-stack roadmaps); the Plancherel theorem and Harish-Chandra's classification of tempered representations; Bushnell–Kutzko types beyond the Iwahori case.

## Conventions that change the mathematics

**Groups.** G is a locally profinite group: a Hausdorff topological group in which the compact open subgroups form a basis of neighbourhoods of 1. For a locally compact totally disconnected group this is van Dantzig's theorem (`van-dantzig`); Mathlib's `NonarchimedeanGroup` supplies open subgroups but not their compactness. Reductive statements concern G = 𝐆(F) for a connected reductive 𝐆 over a nonarchimedean local field F with residue cardinality q, topologised by ReductiveGroupsPartII RG2.0. Unit tests for reductive groups are stated for GL_n(ℚ_p), realised as the units of the matrix ring.

**Coefficients.** A is any commutative ring. Results that need averaging assume a cofinal family of compact open subgroups of pro-order invertible in A. For a locally pro-p group p ∈ Aˣ suffices; it is necessary if G is non-discrete. A discrete group always has the good compact open subgroup {1}. Results that do not need it, such as the permutation-module Hecke algebra, Frobenius reciprocity for compact induction and right exactness of Jacquet modules, are stated over every A, including F_p for p-adic G. Normalised parabolic induction and Jacquet functors need a chosen q^{1/2} ∈ Aˣ; unnormalised versions are always available. SR.3a, SR.3 and SR.2a are over ℂ. The Λ-linear centre uses Λ with p ∈ Λˣ, for instance ℤ_ℓ[√q] with ℓ ≠ p.

**Measures and modulus.** An A-valued Haar measure is a finitely additive left-invariant function on compact open subsets. It is normalised by μ(U₀) = 1 on a compact open subgroup U₀ of invertible pro-order. The modulus δ_P of a parabolic P = MN is the factor by which conjugation by p scales a Haar measure of N: δ_P(p) = |det Ad(p)|_{Lie N}|_F, so δ_B(diag(p, 1)) = p⁻¹ in GL_2(ℚ_p). It equals Mathlib's `modularCharacter` of P, and δ_{P̄} = δ_P⁻¹ on M. Normalised induction is i_P σ = Ind_P^G(δ_P^{1/2} ⊗ σ) and normalised Jacquet is r_P V = δ_P^{−1/2} ⊗ V_N.

**Hecke algebras.** H(G, U; A) is the algebra of finitely supported functions on U\G/U with the matrix product of G-invariant kernels on G/U × G/U. It acts on V^U on the right by v * h = Σ_{Ug ∈ U\G} h(U, gU) g⁻¹ v. When μ(U) is a unit it equals the corner e_U H(G, A) e_U of the convolution algebra. The double coset [UgU] has degree #(UgU/U).

**Adjunctions.** First adjointness is r_P ⊣ i_P (Jacquet functor left adjoint to induction, along the same parabolic). Second adjointness is i_P ⊣ r_{P̄}, along the opposite parabolic. Frobenius reciprocity for compact induction from an open subgroup is c-Ind ⊣ Res; for smooth induction from a closed subgroup it is Res ⊣ Ind.

**Centres.** The centre of a category is Mathlib's `CatCenter`, End of the identity functor. The Bernstein centre over ℂ is the centre of SmoothRep ℂ G. Fargues–Scholze define the Λ-linear Bernstein centre as π₀End of the identity of the enhanced D(G, Λ). The ordinary smooth centre has the corner-limit formula; comparison with the enhanced centre is an explicit gap. The unenhanced triangulated CatCenter is not substituted for π₀End(id).

## Existing library at the baseline

| Declaration | Kind | What it provides |
|---|---|---|
| `mathlib:NonarchimedeanGroup` | class | A topological group in which every neighbourhood of 1 contains an open subgroup (extends IsTopologicalGroup). |
| `mathlib:IsTopologicalGroup.exist_openSubgroup_sub_clopen_nhds_of_one` | theorem | In a compact topological group every clopen neighbourhood of 1 contains an open subgroup. |
| `mathlib:OpenSubgroup` | structure | Open subgroups of a topological group, with their lattice structure; open subgroups are closed. |
| `mathlib:Representation` | abbrev | A representation of a monoid G on a k-module V is a monoid homomorphism G →* (V →ₗ[k] V). |
| `mathlib:Representation.stabilizer` | def | The stabiliser subgroup {g | ρ g v = v} of a vector v, with stabilizer_zero, le_stabilizer_add/smul/sum and IntertwiningMap.stabilizer_le. |
| `mathlib:Representation.invariants` | def | For CommRing k and a group G, the k-submodule {v | ∀ g, ρ g v = v}; subgroup invariants are the invariants of the restriction ρ.comp S.subtype. |
| `mathlib:Representation.dual` | def | The full algebraic dual representation (dual ρ) g f = f ∘ ρ g⁻¹ of a group representation over a commutative semiring. |
| `mathlib:Representation.ofMulAction` | def | The permutation representation of G on k[H] = H →₀ k for a G-set H, with ofMulAction_single. |
| `mathlib:Rep` | structure | The bundled category of k-linear representations of G (objects (V, ρ), morphisms intertwining maps); abelian for a ring k. |
| `mathlib:Rep.res` | abbrev | Restriction of representations along a monoid homomorphism f : H →* G, with Rep.res_map_exact. |
| `mathlib:Rep.ofQuotient` | abbrev | Inflation: the representation of G ⧸ S obtained from a representation of G trivial on the normal subgroup S, with Rep.resOfQuotientIso. |
| `mathlib:CategoryTheory.ObjectProperty.FullSubcategory` | structure | The full subcategory on the objects satisfying a property, with its inclusion functor ι. |
| `mathlib:CategoryTheory.ObjectProperty.IsClosedUnderKernels` | class | Kernels of morphisms between objects with the property again have it; the full subcategory then has kernels. |
| `mathlib:CategoryTheory.ObjectProperty.IsClosedUnderCokernels` | class | Cokernels of morphisms between objects with the property again have it; the full subcategory then has cokernels. |
| `mathlib:CategoryTheory.ObjectProperty.IsClosedUnderColimitsOfShape` | class | Closure of an object property under colimits of a given shape; the full subcategory then has those colimits, created by the inclusion. |
| `mathlib:CategoryTheory.Coreflective` | class | A fully faithful functor equipped with a right adjoint (a coreflective subcategory). |
| `mathlib:CategoryTheory.CatCenter` | abbrev | The centre End(𝟭 C) of a category, with app, ext, naturality and mul_app; its multiplication is commutative (IsMulCommutative instance). |
| `mathlib:CategoryTheory.Linear.toCatCenter` | def | For an R-linear preadditive category, the ring homomorphism R →+* CatCenter C, a ↦ a • 𝟙. |
| `tauceti:TauCeti.IsSmoothDiscrete` | structure | For X : TopRep R G, the underlying module is discrete and every point stabiliser {g | X.ρ g x = x} is open; stated for any topological monoid G. |
| `tauceti:TauCeti.SmoothDiscreteTopRep` | abbrev | The full subcategory of TopRep R G on the smooth discrete objects (no limits, no abelian structure). |
| `tauceti:TauCeti.isSmoothDiscrete_iff_continuousSMul` | theorem | For a topological group G and an object with discrete underlying module, smooth discreteness is equivalent to joint continuity ContinuousSMul G X.V. |
| `tauceti:TauCeti.discreteRepEquivSmoothTopRep` | def | An equivalence between bundled discrete G-modules with continuous action and SmoothDiscreteTopRep R G, for a topological group G. |
| `tauceti:TauCeti.iSup_fixedPoints_openNormal_eq_top` | theorem | For a compact totally disconnected group G and a discrete G-module M with continuous action, ⨆ over open normal U of M^U is ⊤ (profinite case only). |
| `tauceti:TauCeti.directed_fixedPoints_addSubgroup` | theorem | The fixed-point subgroups M^U, U running over open normal subgroups, form a directed family. |
| `tauceti:Representation.baseChange` | def | The base change A ⊗[R] V of a representation along an algebra R → A, as a representation over A. |
| `mathlib:Representation.averageMap` | def | For a finite group whose order is invertible in k, the averaging projector onto the invariants (isProj_averageMap). |
| `mathlib:MonoidAlgebra` | def | The monoid algebra k[G] of finitely supported functions with convolution; Representation.asModule makes a representation a k[G]-module. |
| `mathlib:Representation.asModule` | def | The type synonym of V carrying the Module k[G] structure induced by a representation (CommSemiring k). |
| `tauceti:TauCeti.profiniteOrder` | def | The supernatural order of a topological group: at each prime, the supremum of the valuations of the orders of its finite continuous quotients. |
| `tauceti:TauCeti.ofNat_card_quotient_le_profiniteOrder` | theorem | The order of each finite quotient by an open normal subgroup divides profiniteOrder G. |
| `tauceti:TauCeti.IsProP` | def | A topological group is pro-p when every quotient by an open normal subgroup is a p-group. |
| `mathlib:CategoryTheory.IsGrothendieckAbelian` | class | Grothendieck abelian category: locally small, filtered colimits exist and are exact (AB5), and there is a separator. |
| `mathlib:CategoryTheory.IsGrothendieckAbelian.enoughInjectives` | instance | A Grothendieck abelian category has enough injectives. |
| `mathlib:CategoryTheory.IsGrothendieckAbelian.hasExt` | instance | A Grothendieck abelian category has Ext groups (HasExt). |
| `mathlib:HasDerivedCategory` | abbrev | A chosen localisation of cochain complexes at quasi-isomorphisms (HasDerivedCategory.standard provides one in a larger universe). |
| `mathlib:DerivedCategory` | def | The unbounded derived category of an abelian category with HasDerivedCategory, triangulated, with localisation functor Q. |
| `mathlib:DerivedCategory.singleFunctor` | abbrev | The functor placing an object in a single degree of the derived category. |
| `mathlib:DerivedCategory.Plus` | abbrev | The bounded-below derived category, as the full subcategory of the canonical t-structure. |
| `mathlib:CategoryTheory.Functor.rightDerivedFunctorPlus` | def | For an additive functor between abelian categories with enough injectives on the source, its right derived functor on bounded-below derived categories. |
| `mathlib:CategoryTheory.Abelian.Ext` | def | Ext groups Ext^n(X, Y) as shifted morphisms in the derived category, with Yoneda composition. |
| `mathlib:CochainComplex.HomComplex` | def | The Hom cochain complex between two cochain complexes in a preadditive category (the dg Hom). |
| `mathlib:CochainComplex.IsKInjective` | class | A complex L is K-injective if every map from an acyclic complex to L is null-homotopic. |
| `mathlib:CochainComplex.isKInjective_of_injective` | lemma | A bounded-below complex of injective objects is K-injective. |
| `mathlib:CochainComplex.HomComplex.CohomologyClass.equivOfIsKInjective` | def | For K-injective L, cohomology classes of the Hom complex into L are morphisms in the derived category. |
| `mathlib:CategoryTheory.Injective.injective_of_adjoint` | theorem | A right adjoint whose left adjoint preserves monomorphisms preserves injective objects. |
| `mathlib:Rep.indResAdjunction` | def | Algebraic induction along a group homomorphism is left adjoint to restriction: indFunctor k φ ⊣ resFunctor φ. |
| `mathlib:continuousCohomology` | abbrev | Continuous group cohomology H^n_cont(G, A) of an object A of TopRep k G, as the homology of the homogeneous continuous cochain complex. |
| `mathlib:Rep.invariantsFunctor` | def | The functor Rep k G ⥤ ModuleCat k sending A to A^G, additive and k-linear. |
| `mathlib:LocallyConstant` | structure | Locally constant functions X → Y between a topological space and a type, with their algebraic structure when Y has one. |
| `mathlib:CompactlySupportedContinuousMap` | structure | Continuous maps with compact support C_c(α, β), with their module structure. |
| `mathlib:TopologicalSpace.CompactOpens` | structure | Compact open subsets of a topological space, a lattice under union and intersection. |
| `mathlib:MeasureTheory.Measure.haarMeasure` | def | The left Haar measure on a locally compact group normalised to give a chosen positive compact set measure one. |
| `mathlib:IsHeckeTriple` | class | Compatibility of a submonoid Δ and subgroups H₁, H₂ (both in Δ, commensurable, Δ in the commensurator) making double cosets H₁\Δ/H₂ finite unions of left cosets. |
| `mathlib:HeckeCoset` | def | Double cosets H₁gH₂ of elements g of Δ, the basis of the Hecke coset module. |
| `mathlib:HeckeCosetModule` | def | Finitely supported Z-valued functions on the double cosets H₁\Δ/H₂. |
| `mathlib:HeckeRing` | abbrev | The Hecke ring 𝕋 Δ H Z: the diagonal Hecke coset module, whose product is developed in Tau Ceti. |
| `tauceti:HeckeCosetModule.structureConstants` | def | Shimura's multiplicities m(D₁, D₂; D) counting left cosets, the structure constants of the double-coset product. |
| `tauceti:HeckeCosetModule.mul` | def | The convolution product of Hecke coset modules HeckeCosetModule Δ H₁ H₂ × HeckeCosetModule Δ H₂ H₃ → HeckeCosetModule Δ H₁ H₃ over a semiring. |
| `tauceti:HeckeCosetModule.single_mul_single` | lemma | The product of two basis double cosets is Σ_D m(D₁, D₂; D) D with Shimura's multiplicities. |
| `tauceti:HeckeCosetModule.mul_assoc` | theorem | Associativity of the double-coset product for Hecke triples. |
| `tauceti:HeckeCosetModule.instRingHeckeRing` | instance | The Hecke ring 𝕋 Δ H R of a Hecke pair is a ring over any ring R (no averaging or invertibility hypotheses). |
| `tauceti:HeckeRing.GLn.polynomialRingEquivTwo` | def | Shimura's Theorem 3.20 for n = 2: for p prime, the p-local part of the classical double-coset ring of GL_2 is the polynomial ring ℤ[X₁, X₂] on T(1, p) and T(p, p). |
| `mathlib:Representation.coind` | def | Algebraic coinduction: all functions f : H → A with f(φ g * h) = ρ g (f h), with action by right translation. |
| `mathlib:Rep.resCoindAdjunction` | abbrev | Restriction is left adjoint to algebraic coinduction: resFunctor φ ⊣ coindFunctor k φ. |
| `mathlib:Rep.ind` | abbrev | Algebraic induction (k[H] ⊗ A)_G along a group homomorphism φ : G →* H, as an object of Rep k H. |
| `mathlib:Representation.Coinvariants` | def | The coinvariants V ⧸ span{ρ g x − x} of a representation, with mk, lift and map. |
| `mathlib:Rep.coinvariantsFunctor` | def | The coinvariants functor Rep k G ⥤ ModuleCat k, left adjoint to the trivial-representation functor (coinvariantsAdjunction). |
| `mathlib:MeasureTheory.Measure.modularCharacter` | def | The modular character G →* ℝ≥0 of a locally compact group, g ↦ μ(· g⁻¹)/μ for a left Haar measure μ (independent of μ). |
| `tauceti:TauCeti.Rep.indFunctorCompIso` | def | Induction in stages for algebraic induction: indFunctor k φ ⋙ indFunctor k ψ ≅ indFunctor k (ψ.comp φ). |
| `tauceti:TauCeti.indTrivialIso` | def | Rep.ind H.subtype of the trivial representation is isomorphic to the permutation representation k[G ⧸ H]. |
| `tauceti:Rep.mackeyDecomposition` | def | Mackey decomposition res_K ind_H A ≅ ⊕ over K\G/H of Ind_{K ∩ sHs⁻¹}^K (res A), for algebraic induction over arbitrary subgroups. |
| `tauceti:TauCeti.indProjection` | def | The projection formula Ind_φ(X ⊗ Res_φ Y) ≅ Ind_φ X ⊗ Y for algebraic induction. |
| `mathlib:Module.End.instDivisionRing` | instance | The endomorphism ring of a simple module is a division ring (Schur's lemma). |
| `mathlib:Transcendental.linearIndependent_sub_inv` | theorem | For x transcendental over F, the elements (x − a)⁻¹ (a ∈ F) are F-linearly independent: the input of the countable-dimension Schur lemma. |
| `mathlib:Module.Finite.toModuleEnd_moduleEnd_surjective` | theorem | Jacobson density for a module finite over its endomorphism ring: the map to the double centraliser is surjective (Burnside's theorem for finite-dimensional simple modules over an algebraically closed field). |
| `mathlib:CategoryTheory.Simple` | class | An object is simple when each monomorphism into it is an isomorphism exactly when that morphism is nonzero. |
| `mathlib:Unitization` | structure | The A-unitization of a non-unital A-algebra H has underlying A × H, with a new unit; its ideal inclusion H supplies the A-linear module carrier. |
| `mathlib:Rep.quotientToCoinvariantsFunctor` | def | For a normal subgroup N of a group G, takes a G-representation to the G/N-representation on its N-coinvariants. Smoothness and exactness are separate planned assertions. |
| `mathlib:Rep.quotientToInvariantsFunctor` | def | For a normal subgroup N of G, takes N-invariants with their induced G/N-action; its right derived functor retains the quotient-group action. |
| `mathlib:Representation.tprod` | def | The tensor-product representation acts on V ⊗_A W through the tensor product of the two action maps. Smoothness is an additional planned assertion. |
| `mathlib:MonoidAlgebra.mapDomainRingHom` | def | A monoid homomorphism induces a ring homomorphism on monoid algebras by mapping basis indices. |
| `mathlib:Module.compHom` | abbrev | Restricts an existing module action along a ring homomorphism. The centre subtype map gives the precise scalar action for finiteness over a Hecke centre. |
| `mathlib:CategoryTheory.Abelian.Ext.comp` | def | Given Ext classes of degrees a and b, composition is the second class after the first, in degree a+b. This fixes the derived-Hecke opposite convention. |

## Layer order and stage coverage

The layers depend on one another in the order SR.0:abelian-category → SR.1 → SR.0:derived-extension → SR.2 → SR.3a → SR.3 → SR.2a. The position of SR.2a after SR.3a and SR.3 is forced by the mathematics. Bernstein's stabilisation theorem, the only complete public route to second adjointness for a general reductive group, uses uniform admissibility, the Bernstein decomposition, noetherianity and generic irreducibility. Bezrukavnikov–Kazhdan's geometric proof uses noetherianity of Hecke algebras. Uniform admissibility needs only cuspidal theory and first adjointness, and the Bernstein centre is proved by Bernstein–Deligne without second adjointness. Cuspidal theory, Harish-Chandra compactness and admissibility of irreducibles are planned in SR.3a and realise SR.3 as well.

- **SR.0: planned.** SR.0 is the compatibility name of SR.0:abelian-category (REV-RS-21): its nodes realise both ids and nothing further is planned under SR.0 alone.
- **SR.0:abelian-category: planned.** Topological smooth representations on topological modules beyond the profinite comparison of PC1 (only the algebraic carrier is planned). Instantiate the GL₂ compact-open invariant test with the requested Cartan representatives and GL₂(ℤ_p) subgroup, listed in the omission ledger.
- **SR.0:derived-extension: planned.** Complete the equivariant K-flat replacement, tensor totalisation and derived internal-Hom construction (recorded gap). The ∞-categorical enhancement and comparison with sheaves on [*/G] are supplied by EnhancedDerivedSheaves:E1 and the V-stack roadmaps; this part owns the dg model and ordinary derived functors. Instantiate the double-coset derived-Hecke product with ProfiniteCohomology Layers 10 and 12 and prove compatibility with the chosen Yoneda opposite convention.
- **SR.1: planned.** Prove the general positive Levi Hecke embedding by transfer of Levi structure constants (recorded gap); the normaliser/torus product is the stated special case. Construct the enhanced degree-zero centre comparison with the ordinary corner centre (recorded gap). Use the requested ReductiveGroupsPartII parabolic, Iwahori and root-data carriers to instantiate the named signatures in the omission ledger. The spherical comparison and integral spherical presentations are SR.4 targets.
- **SR.2: planned.** Supply multiplicity one and Rodier heredity for general quasi-split groups and the degenerate Whittaker inputs (recorded gaps). Specify the smooth equivariant l-sheaf category, its compactly supported sections and equivariance, then instantiate the sheaf and Mackey signatures listed in the omission ledger. Instantiate parabolic induction, generic root characters, Jacquet normalisations and Casselman statements with the requested reductive supplier carriers.
- **SR.2a: planned.** Instantiate stabilisation, canonical lifting, Jacquet duality and second-adjunction unit/counit with the requested parabolic-pair and positive-cone carriers. The integral (ℓ ≠ p) second adjointness is supplied by SR.6 and compares with this complex-coefficient adjunction.
- **SR.3: planned.** Supply Harish-Chandra’s classification of tempered representations and the Schwartz/tempered projectivity input (recorded gaps). Instantiate cuspidal-data, inertial-class, affine-torus and quotient-variety carriers, and the associated block, centre, Langlands and Steinberg signatures in the omission ledger.
- **SR.3a: planned.** Use the requested rational-point, Levi, Cartan-cone and congruence-subgroup carriers to extend the concrete GL_n(ℚ_p) signatures to general reductive G(F) and instantiate the remaining cuspidal signatures in the omission ledger.

## Declaration plan

Each block is one planned declaration. Prerequisites are direct edges: nodes of this part, baseline declarations (`mathlib:` or `tauceti:`), and stages of other roadmaps, each with a supplier request below. Unit tests are named statements that a wrong definition fails.

### SR.0:abelian-category (also SR.0). The smooth category and its basic API

Smooth representations of a locally profinite group G on modules over an arbitrary commutative ring A. The carrier is the full subcategory of Mathlib's `Rep A G` on the representations all of whose vectors have open stabilisers. It is abelian, closed under colimits, and coreflective: the smooth vectors form the right adjoint of the inclusion, which gives limits. Invariants V^U under a compact open subgroup U are defined for every A. They are cut out by an averaging idempotent, and form an exact functor, exactly when U has pro-order invertible in A. For a non-discrete locally pro-p group over F_p no such U exists, and the theory continues without averaging. Admissibility, finiteness conditions, smooth characters, the smooth contragredient, change of coefficients and the categorical centre complete the basic API. The unqualified stage SR.0 is this layer under its compatibility name; its nodes realise both ids.

**Planets of this layer:** Smooth representations (`is-smooth`); Category of smooth representations (`smooth-rep-category`); Compact open invariants (`compact-open-invariants`); Admissible representations (`admissible`); Smooth contragredient (`smooth-dual`); Centre of the smooth category (`smooth-centre`).

#### Compact open subgroups form a neighbourhood basis

**Identifier:** `SmoothRepresentationsOfLocalGroups:SR.0:abelian-category/van-dantzig`. **Kind:** theorem. **Proposed name:** `TauCeti.exists_compactOpenSubgroup_le`. **Module:** `TauCeti/RepresentationTheory/Smooth/Basic`. **Realises:** `SR.0`, `SR.0:abelian-category`.

Let G be a Hausdorff topological group. The following are equivalent: (a) G is locally compact and totally disconnected; (b) G is locally compact and NonarchimedeanGroup (every neighbourhood of 1 contains an open subgroup); (c) every neighbourhood of 1 contains a compact open subgroup. Such a G is called locally profinite (an l-group). In that case every open subgroup contained in a compact neighbourhood of 1 is compact, every compact open subgroup is profinite, and the compact open subgroups contained in a given one form a cofinal directed family under reverse inclusion.

**Hypotheses.** G a Hausdorff topological group (Group, TopologicalSpace, IsTopologicalGroup, T2Space).

**Construction or proof.**
1. (c) ⇒ (b) and (c) ⇒ (a): a compact open subgroup is a compact neighbourhood; a basis of clopen subgroups makes G totally disconnected.
2. (b) ⇒ (c): choose a compact neighbourhood C of 1 and an open subgroup U ⊆ int C; U is closed (OpenSubgroup.isClosed), hence compact.
3. (a) ⇒ (c) (van Dantzig): a locally compact totally disconnected Hausdorff space has a basis of compact open sets; take a compact open W ∋ 1 inside the given neighbourhood. Run the argument of Mathlib's compact case (exist_openSubgroup_sub_clopen_nhds_of_one): by compactness of W there is a symmetric open T ∋ 1 with W·T ⊆ W, and the subgroup generated by T lies in W, is open, hence compact.
4. Profiniteness of a compact open subgroup: compact, Hausdorff and totally disconnected.

**Direct prerequisites.** `mathlib:NonarchimedeanGroup`, `mathlib:IsTopologicalGroup.exist_openSubgroup_sub_clopen_nhds_of_one`, `mathlib:OpenSubgroup`.

**Acceptance checks.**

- GL_n(ℚ_p) is locally profinite with basis the congruence subgroups 1 + p^k M_n(ℤ_p), k ≥ 1 (ReductiveGroupsPartII:RG2.0 supplies the topology on G(E)).
- ℝ is locally compact but not totally disconnected and has no compact open subgroup: the equivalence fails without total disconnectedness.
- ℚ_p with the discrete topology is locally profinite with basis {0}.

**Sources.** `BERNSTEIN92`, Ch. I §1.1, Definition 1, p. 7: Defines l-spaces and l-groups; an l-group is a Hausdorff group whose identity has a basis of compact open subgroups, and the F-points of an algebraic group are asserted to be l-groups. `BZ76`, Ch. I §1, 1.1–1.6, p. 6: Introduces l-spaces as Hausdorff locally compact totally disconnected spaces and l-groups as those with a basis of compact open subgroups at the identity.

#### Smooth representations

**Identifier:** `SmoothRepresentationsOfLocalGroups:SR.0:abelian-category/is-smooth`. **Kind:** definition. **Proposed name:** `TauCeti.Representation.IsSmooth`. **Module:** `TauCeti/RepresentationTheory/Smooth/Basic`. **Realises:** `SR.0`, `SR.0:abelian-category`.

Let G be a topological group, A a commutative ring and ρ : Representation A G V a representation on an A-module V (no topology on V). The representation is smooth if for every v ∈ V the stabiliser {g ∈ G | ρ g v = v} is open in G. For a locally profinite G this is equivalent to: every v is fixed by some compact open subgroup, i.e. V = ⋃_U V^U over compact open U.

**Hypotheses.** G a topological group (IsTopologicalGroup); A a commutative ring; V an A-module.

**Construction or proof.**
1. Define IsSmooth ρ as ∀ v, IsOpen (ρ.stabilizer v : Set G).
2. The equivalence with the union description uses that an open subgroup contains a compact open subgroup (van-dantzig) and conversely that a compact open subgroup is open.

**Direct prerequisites.** `SmoothRepresentationsOfLocalGroups:SR.0:abelian-category/van-dantzig`, `mathlib:Representation`, `mathlib:Representation.stabilizer`, `mathlib:Representation.ofMulAction`, `tauceti:TauCeti.IsSmoothDiscrete`.

**API.**

- `TauCeti.Representation.IsSmooth` (data): IsSmooth ρ :⇔ ∀ v, IsOpen {g | ρ g v = v}.
- `TauCeti.Representation.isSmooth_iff_exists_openSubgroup` (characterisation): For a NonarchimedeanGroup G: smooth iff every v is fixed by some open subgroup; for a locally profinite G: iff every v is fixed by some compact open subgroup.
- `TauCeti.Representation.IsSmooth.subrepresentation` (relation): A subrepresentation of a smooth representation is smooth.
- `TauCeti.Representation.IsSmooth.quotient` (relation): A quotient representation of a smooth representation is smooth.
- `TauCeti.Representation.IsSmooth.directSum` (relation): Arbitrary direct sums and filtered colimits of smooth representations are smooth (a vector lies in finitely many summands).
- `TauCeti.Representation.IsSmooth.tprod` (relation): The tensor product over A of two smooth representations is smooth.
- `TauCeti.Representation.IsSmooth.comp_continuous` (functoriality): Restriction along a continuous homomorphism H →* G preserves smoothness; inflation along a continuous open surjection G → G/N preserves smoothness.
- `TauCeti.Representation.isSmooth_ofMulAction_quotient` (example): A[G ⧸ U] is smooth when U is open.
- `TauCeti.Representation.isSmooth_iff_isSmoothDiscrete` (compatibility): For A with the discrete topology, IsSmooth ρ ↔ TauCeti.IsSmoothDiscrete of the object of TopRep A G with discrete underlying module.

**Unit tests.**

- `TauCeti.Representation.isSmooth_trivial` (degenerate): The trivial representation of any topological group on any A-module is smooth.
- `TauCeti.Representation.not_isSmooth_leftRegular` (non-example): For G = ℤ_p (additive, p-adic topology) and A = ℤ, the left regular representation on ℤ[ℤ_p] is not smooth.
- `TauCeti.Representation.isSmooth_ofMulAction_zmod` (computation): For G = ℤ_p and U = p^n ℤ_p, the permutation representation ℤ[ℤ_p ⧸ U] is smooth and every vector is fixed by U.
- `TauCeti.Representation.isSmooth_of_discreteTopology` (degenerate): If G carries the discrete topology every representation is smooth.
- `TauCeti.Representation.isSmooth_iff_isSmoothDiscrete_test` (compatibility): For ZMod 3 acting trivially on itself, IsSmooth holds and agrees with TauCeti.IsSmoothDiscrete; for (ZMod 3)ˣ with the indiscrete topology acting by multiplication both fail (TauCeti.not_isSmoothDiscrete_ofDiscreteModule_units_zmod).

**Acceptance checks.**

- The trivial representation is smooth; the permutation representation A[G/U] = Representation.ofMulAction A G (G ⧸ U) is smooth for every open subgroup U.
- The left regular representation on A[G] (finitely supported functions) is not smooth when G is not discrete: a nonzero finitely supported function has finite support, which an infinite open subgroup cannot stabilise.
- For G discrete every representation is smooth.

**Uses.** Casselman, Introduction to admissible representations, §0 condition (a) and §2.1: smoothness of an admissible representation: every vector has open isotropy. Bernstein 1992, Ch. I Definition 2, p. 7: smooth vectors V^sm and smooth representations. Atobe–Kondo–Yasuda 2022, Notation p. 6 and §6.1, p. 31: smooth complex representations of GL_n(F), with exactness of π ↦ π^K used for the newform theory. Kaletha 2016, §5.1 p. 31 and §5.4 (arXiv v5): irreducible admissible representations of rigid inner twists, used as a standard notion in the p-adic conjecture. ExcursionOperatorsAndSpectralAction:ES5: irreducible smooth representations with arbitrary coefficients to which a parameter is attached. CompletedCohomologyPartII:CC.1: the smooth group action on torsion colimits of completed cohomology. GL2AutomorphicRepresentationsAndTransfer:R16.1: the generic carrier specialised to GL_2.

**Sources.** `BERNSTEIN92`, Ch. I Definition 2 and Proposition 1, p. 7: Defines a smooth vector as one with open stabiliser and shows the smooth vectors form a G-stable subspace. `CASSELMAN95`, §0, condition (a), p. 2; §2.1: An admissible representation is in particular smooth: every vector has an open isotropy subgroup. `BZ76`, Ch. I §2, 2.1–2.5, p. 15: Defines algebraic (smooth) representations of l-groups by openness of stabilisers.

**Atlas planet:** Smooth representations.

#### Smooth vectors and the smooth part functor

**Identifier:** `SmoothRepresentationsOfLocalGroups:SR.0:abelian-category/smooth-vectors`. **Kind:** construction. **Proposed name:** `TauCeti.Representation.smoothVectors`. **Module:** `TauCeti/RepresentationTheory/Smooth/Basic`. **Realises:** `SR.0`, `SR.0:abelian-category`.

For a topological group G and any representation ρ : Representation A G V, the smooth vectors V^∞ = {v ∈ V | the stabiliser of v is open} form a subrepresentation, and V^∞ = ⋃_U V^U over compact open U when G is locally profinite. The assignment V ↦ V^∞ is a functor smoothPart : Rep A G ⥤ SmoothRep A G which is right adjoint to the inclusion ι : SmoothRep A G ⥤ Rep A G; the counit ι(V^∞) → V is the inclusion and is an isomorphism exactly when V is smooth, so SmoothRep A G is a coreflective full subcategory of Rep A G.

**Hypotheses.** G a topological group; A a commutative ring.

**Construction or proof.**
1. Closure of V^∞ under addition and scalars: Stab(v + w) ⊇ Stab v ∩ Stab w and Stab(a v) ⊇ Stab v (Representation.le_stabilizer_add, le_stabilizer_smul); an intersection of two open subgroups is open.
2. G-stability: Stab(ρ g v) = g Stab(v) g⁻¹, open because conjugation is a homeomorphism.
3. A G-map f : W → V with W smooth lands in V^∞ because Stab(f w) ⊇ Stab(w) (IntertwiningMap.stabilizer_le); this is the universal property, giving the adjunction ι ⊣ smoothPart with unit an isomorphism.
4. As a right adjoint, smoothPart preserves limits, so products in SmoothRep A G are smooth parts of products in Rep A G.

**Direct prerequisites.** `SmoothRepresentationsOfLocalGroups:SR.0:abelian-category/is-smooth`, `mathlib:Representation.stabilizer`, `mathlib:Rep`, `mathlib:CategoryTheory.Coreflective`.

**API.**

- `TauCeti.Representation.smoothVectors` (data): The subrepresentation V^∞ of a representation of a topological group.
- `TauCeti.Representation.mem_smoothVectors_iff` (characterisation): v ∈ V^∞ ↔ IsOpen (stabiliser of v); for locally profinite G ↔ ∃ compact open U, v ∈ V^U.
- `TauCeti.Representation.smoothVectors_isSmooth` (relation): The restriction of ρ to V^∞ is smooth.
- `TauCeti.Representation.smoothVectors_eq_top_iff` (characterisation): V^∞ = ⊤ iff ρ is smooth.
- `TauCeti.SmoothRep.smoothPart` (functoriality): The functor Rep A G ⥤ SmoothRep A G, V ↦ V^∞, on morphisms by restriction.
- `TauCeti.SmoothRep.smoothPartAdjunction` (universal-property): ι ⊣ smoothPart, natural in both variables; Hom_G(W, V^∞) = Hom_G(W, V) for W smooth.
- `TauCeti.SmoothRep.coreflective` (instance): The inclusion ι is Coreflective (fully faithful with right adjoint smoothPart).
- `TauCeti.SmoothRep.smoothPart_preservesLimits` (relation): smoothPart preserves all limits; products in SmoothRep A G are smooth parts of products of representations.

**Unit tests.**

- `TauCeti.Representation.smoothVectors_product_ne_top` (non-example): For G = ℤ_p, the product over n of ℤ[ℤ_p ⧸ p^n ℤ_p] is not smooth: the family of basepoints is not a smooth vector.
- `TauCeti.Representation.smoothVectors_leftRegular_eq_bot` (computation): For G = ℤ_p and A = ℤ the smooth vectors of the left regular representation on ℤ[ℤ_p] are 0.
- `TauCeti.Representation.smoothVectors_of_discreteTopology` (degenerate): For G discrete, V^∞ = ⊤ for every representation.
- `TauCeti.Representation.smoothVectors_functions_eq_locallyConstant` (computation): For G = ℤ_p acting on all functions ℤ_p → ℤ by translation, the smooth vectors are exactly the locally constant functions.

**Acceptance checks.**

- (∏_{n≥1} ℤ[ℤ_p ⧸ p^n ℤ_p])^∞ is a proper subrepresentation of the product: the vector (δ_{0 mod p^n})_n has stabiliser ⋂ p^n ℤ_p = {0}, which is not open.
- For G discrete smoothPart is the identity functor.
- The smooth part of the full algebraic dual Representation.dual of a smooth representation is the smooth contragredient (node smooth-dual).

**Uses.** Bernstein 1992, Ch. I §1.1, Proposition 1, p. 7: smooth vectors form a G-invariant subspace. Bernstein 1992, Ch. I §3.2, p. 16: the induced representation is the smooth part of the full space of H-equivariant functions. Bernstein 1987, §1.1: products in the nondegenerate module category are nondegenerate parts of set-theoretic products. MetaplecticAutomorphicForms:MP.0: smooth vectors of the Schrödinger and Weil representations. SmoothRepresentationsOfLocalGroups:SR.0:abelian-category/smooth-dual: the smooth contragredient is the smooth part of the algebraic dual. SmoothRepresentationsOfLocalGroups:SR.2/smooth-induction: smooth induction is the smooth part of algebraic coinduction.

**Sources.** `BERNSTEIN92`, Ch. I §1.1, Definition 2 and Proposition 1, p. 7: Defines V^sm, the vectors with open stabiliser, and states that V^sm is a G-invariant subspace. `BERNSTEIN87`, §1.1, p. 3: For an idempotented algebra, every module contains a maximal nondegenerate submodule, and products in the nondegenerate category are the nondegenerate parts of products.

#### The category of smooth representations

**Identifier:** `SmoothRepresentationsOfLocalGroups:SR.0:abelian-category/smooth-rep-category`. **Kind:** definition. **Proposed name:** `TauCeti.SmoothRep`. **Module:** `TauCeti/RepresentationTheory/Smooth/Basic`. **Realises:** `SR.0`, `SR.0:abelian-category`.

For a commutative ring A and a topological group G, SmoothRep A G is the full subcategory of Mathlib's Rep A G on the smooth representations: ObjectProperty.FullSubcategory of the property 'ρ is smooth'. Morphisms are A-linear G-equivariant maps. It is A-linear, has all colimits (computed in Rep A G) and all limits (smooth parts of limits in Rep A G), and is abelian (node smooth-rep-abelian).

**Hypotheses.** A a commutative ring; G a topological group (locally profinite for the invariant-theoretic API).

**Construction or proof.**
1. Take the full subcategory of Rep A G on IsSmooth; the inclusion is fully faithful.
2. Colimits: IsSmooth is closed under arbitrary colimits in Rep A G (a colimit is a quotient of a direct sum), so the subcategory has colimits created by the inclusion.
3. Limits: apply smoothPart to the limit in Rep A G (smooth-vectors).

**Direct prerequisites.** `SmoothRepresentationsOfLocalGroups:SR.0:abelian-category/is-smooth`, `SmoothRepresentationsOfLocalGroups:SR.0:abelian-category/smooth-vectors`, `mathlib:Rep`, `mathlib:CategoryTheory.ObjectProperty.FullSubcategory`, `mathlib:CategoryTheory.ObjectProperty.IsClosedUnderColimitsOfShape`, `mathlib:Rep.res`, `mathlib:Rep.ofQuotient`.

**API.**

- `TauCeti.SmoothRep` (data): SmoothRep A G := ObjectProperty.FullSubcategory (fun V : Rep A G ↦ IsSmooth V.ρ).
- `TauCeti.SmoothRep.ι` (projection): The fully faithful inclusion SmoothRep A G ⥤ Rep A G.
- `TauCeti.SmoothRep.of` (constructor): Bundles a smooth representation ρ with a proof of smoothness as an object.
- `TauCeti.SmoothRep.hom_ext` (extensionality): Two morphisms are equal iff their underlying A-linear maps are equal.
- `TauCeti.SmoothRep.instLinear` (instance): SmoothRep A G is A-linear.
- `TauCeti.SmoothRep.instHasColimits` (instance): SmoothRep A G has all colimits and ι preserves them.
- `TauCeti.SmoothRep.instHasLimits` (instance): SmoothRep A G has all limits, given by smoothPart of the limit in Rep A G.
- `TauCeti.SmoothRep.res` (functoriality): Restriction along a continuous group homomorphism H → G as a functor SmoothRep A G ⥤ SmoothRep A H, exact, with resId and resComp.
- `TauCeti.SmoothRep.inflation` (functoriality): For a closed normal subgroup N with G → G/N open (quotient topology), inflation SmoothRep A (G ⧸ N) ⥤ SmoothRep A G, fully faithful and exact.

**Unit tests.**

- `TauCeti.SmoothRep.equivalence_of_discrete` (degenerate): For G with the discrete topology, ι is an equivalence SmoothRep A G ≌ Rep A G.
- `TauCeti.SmoothRep.end_trivial` (computation): The endomorphism algebra of the trivial object A of SmoothRep A G is A.
- `TauCeti.SmoothRep.not_closed_under_extensions` (non-example): For G = ℤ_p and A = ℚ, a non-continuous ℚ-linear map ℚ_p → ℚ defines an extension of the trivial representation by itself in Rep ℚ ℤ_p whose middle term is not smooth: SmoothRep is not a Serre subcategory of Rep.
- `TauCeti.SmoothRep.res_of_open_equiv` (compatibility): For an open subgroup U ≤ G, res U of the permutation module A[G/V] (V ≤ U open) is a direct sum of permutation modules A[U/(U ∩ gVg⁻¹)] over the double cosets U\G/V (Tau Ceti's Mackey decomposition for algebraic induction).

**Acceptance checks.**

- Hom-modules are the A-modules of intertwining maps; End of the trivial representation A is A.
- For G finite discrete SmoothRep A G is Rep A G, hence equivalent to modules over A[G] (Rep.equivalenceModuleMonoidAlgebra).
- Infinite products in SmoothRep A G differ from those in Rep A G (smooth-vectors acceptance).

**Uses.** Bernstein 1992, Ch. I §2, p. 11: M(G), the category of smooth representations of an l-group. Bernstein–Zelevinsky 1976, Ch. I §2, 2.1: Alg G, the category of algebraic representations. ExcursionOperatorsAndSpectralAction:ES0: the category whose centre is the classical Bernstein centre. HeckeStacksAndLocalShtukas:HS3: smooth representations of J_b(E) and G(E) over Z_ℓ-algebras. VStackSheavesAndLisseCategories:VS4: the abelian smooth category on the discrete continuous carrier. PadicLocalLanglandsForGL2Qp:R30.2: the smooth mod-p category of GL_2(Q_p) over F_p-algebras, without Hecke averaging. CompletedCohomologyPartII:CC.1: smooth group actions on torsion colimits. ArithmeticLocallySymmetricSpaces:ALS.3: smooth G^S × K_S-representations over R as in Caraiani–Newton §2.1.

**Sources.** `BERNSTEIN92`, Ch. I §2, p. 11: M(G) denotes the category of smooth representations of an l-group G. `BZ76`, Ch. I §2, 2.1–2.5, p. 15: The category of algebraic representations of an l-group and its admissible objects.

**Atlas planet:** Category of smooth representations.

#### Smooth representations form an abelian category

**Identifier:** `SmoothRepresentationsOfLocalGroups:SR.0:abelian-category/smooth-rep-abelian`. **Kind:** theorem. **Proposed name:** `TauCeti.SmoothRep.instAbelian`. **Module:** `TauCeti/RepresentationTheory/Smooth/Basic`. **Realises:** `SR.0`, `SR.0:abelian-category`.

For a commutative ring A and a topological group G, the property 'smooth' on Rep A G contains 0 and is closed under kernels, cokernels, subobjects, quotients, finite products, arbitrary direct sums and filtered colimits. Consequently SmoothRep A G is an abelian category, the inclusion into Rep A G is exact and preserves all colimits, kernels and cokernels are computed on underlying A-modules, and a morphism is a monomorphism (epimorphism) iff it is injective (surjective). It is not closed under extensions in Rep A G.

**Hypotheses.** A a commutative ring; G a topological group.

**Construction or proof.**
1. Subobjects and quotients: for W ⊆ V, Stab_W(w) = Stab_V(w); for V → V/W, Stab(v + W) ⊇ Stab(v).
2. Finite products and sums: Stab(v,w) = Stab v ∩ Stab w.
3. Kernels and cokernels in Rep A G of maps between smooth objects are a subobject and a quotient, hence smooth: IsClosedUnderKernels and IsClosedUnderCokernels.
4. Apply Mathlib's Abelian instance for full subcategories closed under kernels, cokernels and finite products containing zero (Mathlib/CategoryTheory/Abelian/Subcategory.lean).
5. Filtered colimits and direct sums: a vector of a colimit is the image of a vector in one term, whose stabiliser is open.
6. Mono/epi: Rep.mono_iff_injective, Rep.epi_iff_surjective transported through the fully faithful exact inclusion.

**Direct prerequisites.** `SmoothRepresentationsOfLocalGroups:SR.0:abelian-category/smooth-rep-category`, `mathlib:CategoryTheory.ObjectProperty.IsClosedUnderKernels`, `mathlib:CategoryTheory.ObjectProperty.IsClosedUnderCokernels`, `mathlib:CategoryTheory.ObjectProperty.IsClosedUnderColimitsOfShape`.

**Acceptance checks.**

- The kernel of the augmentation ℤ[ℤ_p ⧸ p ℤ_p] → ℤ is the smooth subrepresentation of sum-zero functions.
- The non-example of smooth-rep-category (non-continuous extension of trivial by trivial for ℤ_p over ℚ) shows closure under extensions fails, so Ext¹ in SmoothRep differs from Ext¹ in Rep.
- Filtered colimit: ⋃_n ℤ[ℤ_p ⧸ p^n ℤ_p]^{(·)} along the pullback maps is smooth.

**Sources.** `BERNSTEIN87`, §1.1, p. 3: The nondegenerate module category of an idempotented algebra is abelian with exact filtered direct limits and arbitrary products. `BERNSTEIN92`, Ch. I §2.1, Theorem 2, p. 12: Smooth representations of an l-group form a category equivalent to nondegenerate modules over the Hecke algebra; with Ch. I §1.2, Definition 4, this is the abelian category M(H(G)).

#### Smooth representations as discrete continuous representations

**Identifier:** `SmoothRepresentationsOfLocalGroups:SR.0:abelian-category/smooth-discrete-comparison`. **Kind:** comparison. **Proposed name:** `TauCeti.SmoothRep.equivSmoothDiscreteTopRep`. **Module:** `TauCeti/RepresentationTheory/Smooth/Basic`. **Realises:** `SR.0`, `SR.0:abelian-category`.

Give A the discrete topology. Sending a smooth representation (V, ρ) to the object of TopRep A G with the discrete topology on V defines an equivalence between SmoothRep A G and Tau Ceti's SmoothDiscreteTopRep A G (objects of TopRep A G with discrete underlying module and open point stabilisers), compatible with forgetting to A-modules. On a discrete module, smoothness is equivalent to joint continuity of G × V → V (TauCeti.isSmoothDiscrete_iff_continuousSMul). Under this equivalence the closure of smooth objects under subobjects, quotients, finite products and restriction along continuous homomorphisms, proved for SmoothDiscreteTopRep by ProfiniteCohomology Layer 1, matches the closure statements of smooth-rep-abelian; nothing is re-proved on the TopRep side.

**Hypotheses.** A a commutative ring with the discrete topology; G a topological group.

**Construction or proof.**
1. On objects: V ↦ TopRep.of ρ with the discrete topology on V; every A-linear map between discrete modules is continuous, so morphisms correspond bijectively.
2. Essential surjectivity: an object of SmoothDiscreteTopRep has discrete underlying module and open stabilisers by definition (TauCeti.IsSmoothDiscrete).
3. Joint continuity: TauCeti.isSmoothDiscrete_iff_continuousSMul.
4. The equivalence is compatible with Tau Ceti's discreteRepEquivSmoothTopRep.

**Direct prerequisites.** `SmoothRepresentationsOfLocalGroups:SR.0:abelian-category/smooth-rep-category`, `tauceti:TauCeti.IsSmoothDiscrete`, `tauceti:TauCeti.SmoothDiscreteTopRep`, `tauceti:TauCeti.isSmoothDiscrete_iff_continuousSMul`, `tauceti:TauCeti.discreteRepEquivSmoothTopRep`, `tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-1-the-canonical-carrier-and-its-functoriality`.

**Acceptance checks.**

- For G profinite the composite with the discrete-module dictionary of ProfiniteCohomology Layer 1 sends a discrete G-module to its smooth representation.
- The object (ZMod 3)ˣ acting on ZMod 3 with the indiscrete group topology is excluded on both sides (not_isSmoothDiscrete_ofDiscreteModule_units_zmod).
- Morphisms on both sides agree as A-modules for the trivial representations A and A².

**Sources.** `BERNSTEIN92`, Ch. I §1.3, Important Example and Fact, p. 10: Smooth representations correspond to equivariant sheaves on a point, and the resulting representation is smooth because germs are constant on compact open subgroups. `BZ76`, Ch. I §2, 2.1, p. 15: Algebraic representations are those in which stabilisers are open, the condition used for discrete modules.

#### Invariants under compact open subgroups

**Identifier:** `SmoothRepresentationsOfLocalGroups:SR.0:abelian-category/compact-open-invariants`. **Kind:** construction. **Proposed name:** `TauCeti.SmoothRep.invariantsFunctor`. **Module:** `TauCeti/RepresentationTheory/Smooth/Basic`. **Realises:** `SR.0`, `SR.0:abelian-category`.

For a locally profinite G, a commutative ring A and a compact open subgroup U ≤ G, the U-invariants of a smooth representation V are Mathlib's invariants of the restriction, V^U = (ρ.comp U.subtype).invariants, an A-submodule of V. This gives an A-linear functor invariantsFunctor U : SmoothRep A G ⥤ ModuleCat A, left exact. It satisfies: restriction V^U ≤ V^{U'} for U' ≤ U; conjugation ρ(g) : V^U ≅ V^{gUg⁻¹}; for U' ≤ U open normal, V^U = (V^{U'})^{U/U'}; and the union description: V is smooth iff V = ⨆_U V^U, the supremum running over any neighbourhood basis of 1 consisting of compact open subgroups, and that family is directed. This extends Tau Ceti's profinite exhaustion iSup_fixedPoints_openNormal_eq_top (ProfiniteCohomology Layer 0) from open normal subgroups of a profinite group to the compact open subgroups of a locally profinite group.

**Hypotheses.** G locally profinite; A a commutative ring; U a compact open subgroup.

**Construction or proof.**
1. Define V^U by restriction to U and Mathlib's Representation.invariants; functoriality: a G-map sends U-fixed vectors to U-fixed vectors.
2. Left exactness: invariantsFunctor U = res U ⋙ Rep.invariantsFunctor, a composite of an exact functor and a right adjoint (Rep.invariantsAdjunction).
3. Conjugation: ρ(u') ρ(g) v = ρ(g) ρ(g⁻¹u'g) v.
4. Union description: a smooth v has open stabiliser, which contains a member of any basis of compact open subgroups (van-dantzig); conversely V^U ⊆ V^∞ since U is open. Directedness: U ∩ U' contains a basis member.
5. Compatibility with the profinite statement: when G is compact, open normal subgroups are cofinal among compact open subgroups (normal core of finite index), so the two suprema agree.

**Direct prerequisites.** `SmoothRepresentationsOfLocalGroups:SR.0:abelian-category/smooth-rep-category`, `SmoothRepresentationsOfLocalGroups:SR.0:abelian-category/van-dantzig`, `mathlib:Representation.invariants`, `tauceti:TauCeti.iSup_fixedPoints_openNormal_eq_top`, `tauceti:TauCeti.directed_fixedPoints_addSubgroup`, `tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-0-discrete-modules-and-continuous-sections`, `ReductiveGroupsPartII:RG2.4` (GL₂ unit tests).

**API.**

- `TauCeti.SmoothRep.invariants` (data): V^U as an A-submodule of V for a compact open (or any) subgroup U.
- `TauCeti.SmoothRep.invariantsFunctor` (functoriality): The A-linear functor V ↦ V^U, SmoothRep A G ⥤ ModuleCat A, with its action on morphisms by restriction.
- `TauCeti.SmoothRep.invariants_antitone` (relation): U' ≤ U implies V^U ≤ V^{U'}.
- `TauCeti.SmoothRep.invariants_conj` (relation): ρ(g) maps V^U isomorphically onto V^{gUg⁻¹}.
- `TauCeti.SmoothRep.iSup_invariants_eq_top` (characterisation): For a locally profinite G and a smooth V, ⨆ over compact open U of V^U = ⊤; conversely this equality implies smoothness.
- `TauCeti.SmoothRep.directed_invariants` (relation): The family U ↦ V^U over compact open subgroups is directed.
- `TauCeti.SmoothRep.invariantsFunctor_preservesFiniteLimits` (relation): invariantsFunctor U is left exact.
- `TauCeti.SmoothRep.invariants_eq_fixedPoints` (compatibility): For G compact and U open normal, V^U equals Tau Ceti's FixedPoints.addSubgroup U V used by ProfiniteCohomology Layer 0.

**Unit tests.**

- `TauCeti.SmoothRep.invariants_permutation_gl2` (computation): For G = GL_2(ℚ_p) and U = GL_2(ℤ_p), the U-invariants of ℤ[G/U] are free on the double cosets of diag(p^a,p^b), a ≥ b.
- `TauCeti.SmoothRep.invariants_top_of_trivial` (degenerate): For the trivial representation, V^U = V for every U.
- `TauCeti.SmoothRep.invariants_not_exact_fp` (non-example): For G = ℤ/p (discrete) and A = F_p, the U = G invariants of F_p[G] → F_p (augmentation) are not surjective: invariantsFunctor is not right exact without invertibility of |U|.
- `TauCeti.SmoothRep.iSup_invariants_compat_profinite` (compatibility): For G = ℤ_p the supremum over compact open subgroups equals the supremum over open normal subgroups of Tau Ceti's iSup_fixedPoints_openNormal_eq_top.

**Acceptance checks.**

- For G = GL_2(ℚ_p), U = GL_2(ℤ_p) and V = ℂ[G/U], V^U is the free ℂ-module on the double cosets U\G/U, indexed by diag(p^a, p^b), a ≥ b.
- For U = G compact open and V = A[G/U'] with U' open normal, V^G = A·(sum of cosets).
- For a smooth representation of ℤ_p, V = ⋃_n V^{p^n ℤ_p}.

**Uses.** Casselman 1995, §0 condition (b); §2.1: admissibility is finite dimensionality of V^K. Bernstein 1992, Ch. I Proposition 6(1), p. 14: V^K = π(e_K)V and (Ṽ)^K = (V^K)*. Atobe–Kondo–Yasuda 2022, §5.1, Proposition 5.2, p. 28: Mackey decomposition of K_{n,[M]}-invariants of induced representations in the newform theory. Treumann–Venkatesh 2016, §2.10: the Hecke module V^K. IgusaVarietiesAndTorsionConcentration:IG.1: exact smooth invariants of compact pro-p groups for p ≠ ℓ. VStackSheavesAndLisseCategories:VS4: exact open pro-p invariants in prime-to-p coefficients. SmoothRepresentationsOfLocalGroups:SR.1/permutation-hecke-algebra: Hom_G(A[G/U], V) ≅ V^U is the module on which double-coset operators act.

**Sources.** `BERNSTEIN92`, Ch. I §2.2, Proposition 6(1) and its proof, p. 14: For a compact open K, V^K = π(e_K)V and the contragredient satisfies (Ṽ)^K = (V^K)*. `CASSELMAN95`, §0 (b), p. 2: Admissibility is defined by finite dimensionality of V^K for every open subgroup K, presupposing the invariant subspaces.

**Atlas planet:** Compact open invariants.

#### Profinite groups of invertible pro-order

**Identifier:** `SmoothRepresentationsOfLocalGroups:SR.0:abelian-category/unit-pro-order`. **Kind:** definition. **Proposed name:** `TauCeti.HasUnitProOrder`. **Module:** `TauCeti/RepresentationTheory/Smooth/Basic`. **Realises:** `SR.0`, `SR.0:abelian-category`.

Let U be a profinite group and A a commutative ring. U has pro-order invertible in A if for every open subgroup U' ≤ U the index [U : U'] (finite, U being compact) is a unit of A; equivalently every prime in the support of the supernatural order of U (ProfiniteProPGroups Layer 1) is a unit in A. A locally profinite group G has a cofinal family of compact open subgroups of invertible pro-order in A if every neighbourhood of 1 contains such a subgroup; for a locally pro-p group (some compact open subgroup is pro-p) p ∈ A^× suffices. The converse holds if G is non-discrete: then every open pro-p subgroup is nontrivial and has a finite quotient of order divisible by p. A discrete group has the cofinal compact open subgroup {1} over every A.

**Hypotheses.** U a compact (profinite) group; A a commutative ring.

**Construction or proof.**
1. Indices of open subgroups of a compact group are finite.
2. Equivalence with the supernatural formulation: the supernatural order is the lcm of the orders of finite quotients, and every index of an open subgroup divides it (ProfiniteProPGroups Layer 1, Lagrange and agreement with Subgroup.index).
3. Open subgroups of a pro-p group have p-power index, so invertibility of p suffices. A nontrivial profinite pro-p group has an open normal subgroup of index p. For the converse concerning a locally pro-p G, assume G non-discrete; intersect any good compact open subgroup with a fixed pro-p one, obtaining a nontrivial open pro-p subgroup. Discrete groups are the exception.

**Direct prerequisites.** `SmoothRepresentationsOfLocalGroups:SR.0:abelian-category/van-dantzig`, `mathlib:OpenSubgroup`, `tauceti:TauCeti.profiniteOrder`, `tauceti:TauCeti.ofNat_card_quotient_le_profiniteOrder`, `tauceti:TauCeti.IsProP`, `tauceti:TauCetiRoadmap/ProfiniteProPGroups#layer-1-supernatural-order-and-index`.

**API.**

- `TauCeti.HasUnitProOrder` (data): HasUnitProOrder A U :⇔ ∀ U' : OpenSubgroup U, IsUnit (U'.index : A).
- `TauCeti.HasUnitProOrder.of_le` (relation): Inherited by closed (in particular open) subgroups.
- `TauCeti.HasUnitProOrder.of_isProP` (constructor): A pro-p group (Tau Ceti's IsProP p U) has invertible pro-order in any A with IsUnit (p : A).
- `TauCeti.HasUnitProOrder.map` (functoriality): Inherited along ring homomorphisms A → B.
- `TauCeti.hasUnitProOrder_iff_profiniteOrder` (compatibility): Equivalent to invertibility of every prime p with TauCeti.profiniteOrder U p ≠ 0 (the supernatural order of ProfiniteProPGroups Layer 1).
- `TauCeti.HasCofinalUnitProOrder` (data): For locally profinite G: every neighbourhood of 1 contains a compact open subgroup U with HasUnitProOrder A U.

**Unit tests.**

- `TauCeti.hasUnitProOrder_padicInt_iff` (computation): HasUnitProOrder A ℤ_p ↔ IsUnit (p : A) (for A nonzero).
- `TauCeti.hasUnitProOrder_finite_iff` (computation): For a finite discrete group U, HasUnitProOrder A U ↔ IsUnit (Nat.card U : A).
- `TauCeti.hasUnitProOrder_trivial` (degenerate): The trivial group has invertible pro-order in every A.
- `TauCeti.not_hasUnitProOrder_padicInt_zmod_p` (non-example): ℤ_p does not have invertible pro-order in F_p.

**Acceptance checks.**

- ℤ_p has invertible pro-order in ℤ[1/p] and in F_ℓ (ℓ ≠ p), not in ℤ or F_p.
- A finite group of order n has invertible pro-order in A iff n is a unit of A.
- GL_2(ℚ_p) has a cofinal family of pro-p compact open subgroups (1 + p^k M_2(ℤ_p), k ≥ 1), so the hypothesis holds over any ℤ[1/p]-algebra, while GL_2(ℤ_p) itself does not have invertible pro-order in ℤ[1/p] (its finite quotient GL_2(F_p) has prime factors other than p).

**Uses.** SmoothRepresentationsOfLocalGroups:SR.0:abelian-category/averaging-projector: the averaging operator over U is defined when the indices of open subgroups are units. SmoothRepresentationsOfLocalGroups:SR.1/a-valued-haar-measure: existence of an A-valued Haar measure normalised on such a U. SmoothRepresentationsOfLocalGroups:SR.1/hecke-module-equivalence: the hypothesis of the smooth/nondegenerate-module equivalence. HeckeStacksAndLocalShtukas:HS3: averaging by [K : K']⁻¹ for pro-p K over Λ with p invertible. He 2018, §1.2: normalisation of Haar measures in ℤ[1/p] using a pro-p Iwahori subgroup.

**Sources.** `BERNSTEIN87`, §1.3, p. 4: Uses normalised Haar measures e_K on compact open subgroups, which require the indices of their open subgroups to be invertible. `HE18`, §1.2, pp. 6–7: Normalises Haar measure with values in ℤ[1/p] using a pro-p compact open subgroup, so that volumes of smaller compact opens are p-power fractions.

#### The averaging projector onto U-invariants

**Identifier:** `SmoothRepresentationsOfLocalGroups:SR.0:abelian-category/averaging-projector`. **Kind:** construction. **Proposed name:** `TauCeti.SmoothRep.averaging`. **Module:** `TauCeti/RepresentationTheory/Smooth/Basic`. **Realises:** `SR.0`, `SR.0:abelian-category`.

Let U be a compact open subgroup of a locally profinite G with pro-order invertible in A, and V a smooth A[G]-module. For v ∈ V choose an open normal subgroup U' ≤ U fixing v and set e_U v = [U : U']⁻¹ Σ_{u ∈ U/U'} ρ(u) v. This is independent of U', A-linear, natural in V, idempotent, has image V^U and commutes with every U-equivariant map; it extends Mathlib's Representation.averageMap from finite groups. For U' ≤ U, e_U e_{U'} = e_{U'} e_U = e_U. Its kernel is the span of {ρ(u)v − v : u ∈ U}.

**Hypotheses.** G locally profinite; A commutative; U compact open with HasUnitProOrder A U; V smooth.

**Construction or proof.**
1. Independence: for U'' ≤ U' both fixing v, the sum over U/U'' is [U' : U''] times the sum over U/U', and the indices are units.
2. Image in V^U: left translation by u ∈ U permutes U/U'. Idempotence and V^U ⊆ image: e_U v = v for v ∈ V^U.
3. Kernel: v − e_U v = [U:U']⁻¹ Σ (v − ρ(u)v) lies in the span of the ρ(u)v − v, and e_U kills each ρ(u)v − v.
4. For the finite group U/U' acting on V^{U'} this is Mathlib's averageMap.

**Direct prerequisites.** `SmoothRepresentationsOfLocalGroups:SR.0:abelian-category/compact-open-invariants`, `SmoothRepresentationsOfLocalGroups:SR.0:abelian-category/unit-pro-order`, `mathlib:Representation.averageMap`.

**API.**

- `TauCeti.SmoothRep.averaging` (data): e_U : V →ₗ[A] V for a smooth V and U with HasUnitProOrder A U.
- `TauCeti.SmoothRep.averaging_apply` (simp): e_U v = [U:U']⁻¹ Σ_{u∈U/U'} ρ u v for any open normal U' ≤ U fixing v.
- `TauCeti.SmoothRep.averaging_idem` (relation): e_U ∘ e_U = e_U.
- `TauCeti.SmoothRep.range_averaging` (characterisation): range e_U = V^U.
- `TauCeti.SmoothRep.ker_averaging` (characterisation): ker e_U = span{ρ u v − v}.
- `TauCeti.SmoothRep.averaging_naturality` (functoriality): f ∘ e_U = e_U ∘ f for every U-equivariant A-linear f between smooth representations.
- `TauCeti.SmoothRep.averaging_comp_of_le` (relation): e_U ∘ e_{U'} = e_{U'} ∘ e_U = e_U for U' ≤ U.
- `TauCeti.SmoothRep.averaging_eq_averageMap` (compatibility): On V^{U'} with U' open normal in U, e_U is Mathlib's Representation.averageMap of the finite group U/U'.

**Unit tests.**

- `TauCeti.SmoothRep.averaging_sign` (computation): For U = ℤ/2 acting by −1 on ℤ[1/2], e_U = 0.
- `TauCeti.SmoothRep.averaging_trivial` (degenerate): On the trivial representation e_U = id.
- `TauCeti.SmoothRep.averaging_eq_averageMap_test` (compatibility): For G finite discrete and U = G with |G| invertible, e_G = Representation.averageMap.
- `TauCeti.SmoothRep.averaging_requires_unit` (non-example): For U = ℤ/p over F_p no A-linear idempotent onto V^U commuting with U exists on F_p[U] (the invariants F_p·N are not a direct summand as an F_p[U]-module).

**Acceptance checks.**

- For U = ℤ/2 (G discrete) acting by sign on A = ℤ[1/2], e_U = 0 on the sign representation and the identity on the trivial one.
- Over F_p with U = ℤ/p the operator is undefined: the construction requires HasUnitProOrder.
- For V = A[G/U'] with U' ≤ U open normal, e_U(δ_{gU'}) = [U:U']⁻¹ Σ_{u} δ_{ugU'}.

**Uses.** SmoothRepresentationsOfLocalGroups:SR.0:abelian-category/invariants-exact: exactness of U-invariants. SmoothRepresentationsOfLocalGroups:SR.1/hecke-idempotent: the action of the Hecke idempotent e_U on smooth modules. SmoothRepresentationsOfLocalGroups:SR.0:abelian-category/smooth-dual: (Ṽ)^U = (V^U)* via e_U. Bernstein 1992, Ch. I §3.3, Proposition 10(2), p. 17: coinvariants of a compact group are identified with invariants through e_G.

**Sources.** `BERNSTEIN92`, Ch. I §2.1, p. 11 and Proposition 6(1), p. 14: e_Γ, the normalised Haar measure of a compact open subgroup Γ, is an idempotent of the Hecke algebra and V^K = π(e_K)V. `CASSELMAN95`, §1 (Preparation), discussion of P_K: The projection onto K-fixed vectors given by integration over K against normalised Haar measure.

#### Exactness of invariants for invertible pro-order

**Identifier:** `SmoothRepresentationsOfLocalGroups:SR.0:abelian-category/invariants-exact`. **Kind:** theorem. **Proposed name:** `TauCeti.SmoothRep.invariantsFunctor_exact`. **Module:** `TauCeti/RepresentationTheory/Smooth/Basic`. **Realises:** `SR.0`, `SR.0:abelian-category`.

If U is a compact open subgroup of a locally profinite G with pro-order invertible in A, then invariantsFunctor U : SmoothRep A G ⥤ ModuleCat A is exact, commutes with arbitrary direct sums and filtered colimits, and V^U is a natural direct summand of V as an A[U]-module. Without the hypothesis exactness fails: for U = ℤ/p and A = F_p the U-invariants of F_p[U] → F_p are not surjective.

**Hypotheses.** G locally profinite; A commutative; U compact open with HasUnitProOrder A U.

**Construction or proof.**
1. Right exactness: given a surjection V → W and w ∈ W^U, lift to v ∈ V; then e_U v ∈ V^U maps to e_U w = w by naturality of e_U.
2. Left exactness: invariantsFunctor U is a right adjoint composite (compact-open-invariants).
3. Direct sums and filtered colimits: each vector lies in a finite stage, and taking U-invariants commutes with directed unions of submodules.
4. Direct summand: V = V^U ⊕ ker e_U.

**Direct prerequisites.** `SmoothRepresentationsOfLocalGroups:SR.0:abelian-category/averaging-projector`, `SmoothRepresentationsOfLocalGroups:SR.0:abelian-category/compact-open-invariants`, `SmoothRepresentationsOfLocalGroups:SR.0:abelian-category/smooth-rep-abelian`.

**Acceptance checks.**

- Over ℂ every compact open subgroup has invertible pro-order, so V ↦ V^U is exact on complex smooth representations (Bernstein 1992 Ch. I §3.3).
- Over ℤ[1/p] and G = GL_2(ℚ_p) the functor is exact for every pro-p congruence subgroup 1 + p^k M_2(ℤ_p), k ≥ 1; for U = GL_2(ℤ_p) the hypothesis also needs every prime dividing |GL_2(F_p)| = (p²−1)(p²−p) to be a unit.
- Non-example over F_p as in the statement.

**Sources.** `BERNSTEIN92`, Ch. I §3.3, Proposition 10(2) and its proof, p. 17: For compact G the coinvariants functor is exact because e_G identifies V^G with V_G, and invariants are exact. `FS21`, Ch. V §1, proof of Theorem V.1.1, p. 170: For a pro-p group and Λ killed by an integer prime to p there is no higher continuous cohomology, so taking invariants under a pro-p open subgroup is exact.

#### Admissible representations

**Identifier:** `SmoothRepresentationsOfLocalGroups:SR.0:abelian-category/admissible`. **Kind:** definition. **Proposed name:** `TauCeti.Representation.IsAdmissible`. **Module:** `TauCeti/RepresentationTheory/Smooth/Basic`. **Realises:** `SR.0`, `SR.0:abelian-category`.

A smooth representation V of a locally profinite group G over a commutative ring A is admissible if for every compact open subgroup U the A-module V^U is finitely generated. Over a field this says dim V^U < ∞ (Casselman's definition). It suffices to check a neighbourhood basis if A is noetherian, since V^U is a submodule of V^{U'} for U' ≤ U. Over a general ring it suffices instead to assume every compact open U has invertible pro-order; averaging over that U makes V^U a direct summand of V^{U'}. Cofinal good subgroups alone do not justify this direct-summand argument for a larger bad U. Finite direct sums of admissible representations are admissible; over a noetherian A subrepresentations are admissible; quotients are admissible when invariants are exact (invariants-exact).

**Hypotheses.** G locally profinite; A a commutative ring; V smooth.

**Construction or proof.**
1. Define IsAdmissible ρ :⇔ IsSmooth ρ ∧ ∀ U compact open, Module.Finite A (V^U).
2. Basis criterion: over noetherian A, V^U embeds into the finite module V^{U'} for a smaller basis subgroup U'. Alternatively, if the larger U has invertible pro-order, e_U retracts V^{U'} onto V^U; use this for every compact open U.
3. Subrepresentations: W^U ⊆ V^U is a submodule of a finitely generated module over a noetherian ring.
4. Quotients: (V/W)^U = V^U/W^U by exactness, a quotient of a finitely generated module.

**Direct prerequisites.** `SmoothRepresentationsOfLocalGroups:SR.0:abelian-category/compact-open-invariants`, `SmoothRepresentationsOfLocalGroups:SR.0:abelian-category/averaging-projector`, `SmoothRepresentationsOfLocalGroups:SR.0:abelian-category/invariants-exact`.

**API.**

- `TauCeti.Representation.IsAdmissible` (data): IsAdmissible ρ :⇔ IsSmooth ρ ∧ ∀ U compact open, Module.Finite A (V^U).
- `TauCeti.Representation.isAdmissible_iff_basis` (characterisation): Over a noetherian A, it suffices to check the compact open U in any neighbourhood basis. Over arbitrary A the alternative basis criterion requires HasUnitProOrder A U for every compact open U, including those outside the chosen basis.
- `TauCeti.Representation.IsAdmissible.subrepresentation` (relation): Over a noetherian A, subrepresentations of admissible representations are admissible.
- `TauCeti.Representation.IsAdmissible.quotient` (relation): Quotients of admissible representations are admissible when every compact open subgroup has invertible pro-order.
- `TauCeti.Representation.IsAdmissible.prod` (relation): Finite direct sums of admissible representations are admissible.
- `TauCeti.Representation.IsAdmissible.baseChange` (functoriality): Admissibility is preserved by base change A → B when the coefficient-change map on invariants is an isomorphism (coefficient-change).
- `TauCeti.Representation.isAdmissible_iff_finiteDimensional` (characterisation): Over a field k, admissible iff every V^U is finite-dimensional.
- `TauCeti.Representation.isAdmissible_of_finite` (example): Finite-dimensional smooth representations over a field are admissible.

**Unit tests.**

- `TauCeti.Representation.isAdmissible_quotient_compact` (computation): For G = ℤ_p and A = ℚ, ℚ[ℤ_p ⧸ p^n ℤ_p] is admissible with (·)^{ℤ_p} of dimension 1.
- `TauCeti.Representation.not_isAdmissible_cInd_qp` (non-example): For G = ℚ_p and A = ℚ, ℚ[ℚ_p ⧸ ℤ_p] is smooth but not admissible.
- `TauCeti.Representation.isAdmissible_zero` (degenerate): The zero representation is admissible.
- `TauCeti.Representation.isAdmissible_iff_casselman` (compatibility): Over ℂ, IsAdmissible agrees with Casselman's definition: smooth and dim_ℂ V^K < ∞ for every open compact K.

**Acceptance checks.**

- For G compact and U' ≤ G open normal, A[G/U'] is admissible: A[G/U']^U is finite free on the finitely many U-orbit sums in G/U'.
- For G = ℚ_p (non-compact), c-Ind_{ℤ_p}^{ℚ_p} 1 = A[ℚ_p/ℤ_p] is not admissible over a field: its ℤ_p-invariants have infinite dimension.
- A smooth character is admissible; an infinite direct sum of copies of the trivial representation is not.

**Uses.** Casselman 1995, §0 (b), §2: the admissible representations of p-adic reductive groups studied throughout. Bernstein 1992, Ch. I Definition 9 and Proposition 7, p. 14: admissibility and reflexivity V ≅ Ṽ̃. Treumann–Venkatesh 2016, §6.1: admissible k-representations of G_v and σ-fixed representations for the Brauer homomorphism. Kaletha 2016, §5.1 p. 31 and §5.4 (arXiv v5): irreducible admissible complex representations and their Harish-Chandra characters in the p-adic conjecture. AutomorphicFormsOnReductiveGroups:AF.2: admissibility of local components for Flath's factorisation. AutomorphicGaloisRepresentationsPartII:AG2.0: smooth admissible characteristic-zero representations of the adelic tower. ExcursionOperatorsAndSpectralAction:ES7:function-field-automorphic: admissibility of the automorphic space of a compact division-algebra quotient. SmoothRepresentationsOfLocalGroups:SR.3a/admissibility-of-irreducibles: every irreducible complex smooth representation of a reductive p-adic group is admissible.

**Sources.** `CASSELMAN95`, §0, conditions (a)–(b), p. 2: A complex admissible representation is smooth with finite-dimensional K-fixed spaces for every open subgroup K. `BERNSTEIN92`, Ch. I Definition 9, p. 14: Admissible means V^K finite dimensional for every open compact K. `TV16`, §6.1, first two paragraphs, p. 201 (published; arXiv v1 p. 19): Irreducible smooth representations of G_v over k = F̄_p, at a place of residue characteristic different from p, are taken admissible: finite-dimensional invariants under every compact open subgroup of G_v (printed as subgroups of G).

**Atlas planet:** Admissible representations.

#### Finitely generated and locally admissible representations

**Identifier:** `SmoothRepresentationsOfLocalGroups:SR.0:abelian-category/finiteness-conditions`. **Kind:** definition. **Proposed name:** `TauCeti.Representation.IsLocallyAdmissible`. **Module:** `TauCeti/RepresentationTheory/Smooth/Basic`. **Realises:** `SR.0`, `SR.0:abelian-category`.

Two finiteness conditions are kept separate from admissibility. A smooth representation V is finitely generated if ρ.asModule is a finitely generated A[G]-module (Mathlib's Module.Finite over MonoidAlgebra A G). V is locally admissible if every v ∈ V generates an admissible subrepresentation A[G]·v. Admissible ⇒ locally admissible over a noetherian A; finitely generated and locally admissible ⇒ admissible over a noetherian A when every compact open subgroup has invertible pro-order; neither admissibility nor finite generation implies the other.

**Hypotheses.** G locally profinite; A a commutative (noetherian, for the comparison statements) ring.

**Construction or proof.**
1. Finite generation reuses Module.Finite (MonoidAlgebra A G) ρ.asModule; no new predicate.
2. Admissible ⇒ locally admissible over noetherian A: subrepresentations of admissible representations are admissible (admissible API).
3. Finitely generated and locally admissible ⇒ admissible when A is noetherian and the compact open subgroups have invertible pro-order: V = Σ_{i≤n} A[G]v_i is a quotient of the admissible ⊕_i A[G]v_i, and quotients of admissible representations are admissible because invariants are exact (invariants-exact).

**Direct prerequisites.** `SmoothRepresentationsOfLocalGroups:SR.0:abelian-category/admissible`, `mathlib:MonoidAlgebra`, `mathlib:Representation.asModule`.

**API.**

- `TauCeti.Representation.IsLocallyAdmissible` (data): Every vector generates an admissible subrepresentation.
- `TauCeti.Representation.IsAdmissible.isLocallyAdmissible` (relation): Admissible ⇒ locally admissible over a noetherian ring.
- `TauCeti.Representation.isAdmissible_of_fg_of_locallyAdmissible` (relation): Finitely generated and locally admissible ⇒ admissible over a noetherian ring with invertible pro-orders.
- `TauCeti.Representation.fg_iff_module_finite` (characterisation): Finite generation is Module.Finite (MonoidAlgebra A G) ρ.asModule; equivalently V is a quotient of ⊕_{i≤n} A[G/U_i] for compact open U_i.
- `TauCeti.Representation.IsLocallyAdmissible.subrepresentation` (relation): Over noetherian A, subrepresentations of locally admissible representations are locally admissible. Quotients have this property when every compact open subgroup has invertible pro-order.

**Unit tests.**

- `TauCeti.Representation.fg_not_admissible` (non-example): ℚ[ℚ_p ⧸ ℤ_p] is finitely generated and not admissible.
- `TauCeti.Representation.admissible_not_fg` (non-example): Over ℂ, the direct sum of one character of ℤ_p of exact conductor p^(n+1) for each n ≥ 0 is admissible but is not finitely generated.
- `TauCeti.Representation.isLocallyAdmissible_trivial` (degenerate): The rank-one trivial representation on A is locally admissible and finitely generated.
- `TauCeti.Representation.fg_iff_quotient_permutation` (characterisation): A smooth representation is finitely generated iff it is a quotient of a finite direct sum of permutation modules A[G/U] with U compact open.

**Acceptance checks.**

- A[G/U] for G = ℚ_p, U = ℤ_p is finitely generated (by one coset) but not admissible.
- Over ℂ, choose one character of ℤ_p of exact conductor p^n for every n ≥ 1. Their direct sum is admissible (only finitely many are trivial on any fixed open subgroup) but is not finitely generated.
- For G compact every smooth representation over a field with invertible pro-order is locally admissible.

**Uses.** Calegari–Geraghty 2018, Definition 9.11 and §9.2.2 (arXiv v2): the category 𝒞 of locally admissible smooth representations over O/ϖ^k. Bernstein 1992, Ch. II Definition 16, p. 36: cuspidal means quasi-cuspidal and finitely generated. HeckeStacksAndLocalShtukas:HS3: finitely generated admissible representations have finite length (via SR.3). SmoothRepresentationsOfLocalGroups:SR.3/finite-length: finitely generated admissible complex representations have finite length.

**Sources.** `CG18`, arXiv v2 §9.2.1, Definition 9.11, p. 91; §9.2.2, first paragraph, p. 94: Defines the category 𝒞 of locally admissible smooth representations of GL_n(F_x) over O/ϖ^k (ℓ ≠ x) used for the level-raising argument; admissibility and local admissibility are used without separate definition. `BERNSTEIN92`, Ch. II Definition 16, p. 36: Finitely generated quasi-cuspidal representations are called cuspidal, so finite generation is a separate hypothesis.

#### Smooth characters and twists

**Identifier:** `SmoothRepresentationsOfLocalGroups:SR.0:abelian-category/smooth-character`. **Kind:** definition. **Proposed name:** `TauCeti.IsSmoothCharacter`. **Module:** `TauCeti/RepresentationTheory/Smooth/Basic`. **Realises:** `SR.0`, `SR.0:abelian-category`.

A smooth character of G with values in A is a group homomorphism χ : G →* Aˣ whose kernel is open; equivalently the rank-one representation A(χ) is smooth, equivalently χ is continuous for the discrete topology on Aˣ. Twisting V ↦ V ⊗ χ (same module, action χ(g)ρ(g)) is an exact autoequivalence of SmoothRep A G, with inverse twisting by χ⁻¹, compatible with invariants under compact open subgroups contained in ker χ.

**Hypotheses.** G a topological group; A a commutative ring.

**Construction or proof.**
1. Smoothness of A(χ) is openness of ker χ, the stabiliser of every nonzero vector when A is a domain and of 1 in general.
2. Twisting commutes with morphisms and preserves stabilisers up to intersecting with ker χ, an open subgroup.

**Direct prerequisites.** `SmoothRepresentationsOfLocalGroups:SR.0:abelian-category/is-smooth`, `SmoothRepresentationsOfLocalGroups:SR.0:abelian-category/smooth-rep-category`.

**API.**

- `TauCeti.IsSmoothCharacter` (data): IsSmoothCharacter χ :⇔ IsOpen (χ.ker : Set G).
- `TauCeti.SmoothRep.ofCharacter` (constructor): The smooth rank-one representation A(χ).
- `TauCeti.SmoothRep.twist` (functoriality): The exact autoequivalence V ↦ V ⊗ χ with twist χ ∘ twist χ⁻¹ ≅ id and twist (χψ) ≅ twist χ ∘ twist ψ.
- `TauCeti.IsSmoothCharacter.mul` (relation): The product of two smooth characters is smooth; apply the same open-kernel argument to inverses.
- `TauCeti.SmoothRep.invariants_twist` (compatibility): (V ⊗ χ)^U = V^U for U ≤ ker χ.

**Unit tests.**

- `TauCeti.isSmoothCharacter_unramified` (computation): x ↦ t^{v_p(x)} on ℚ_p^× is a smooth character for any t ∈ Aˣ.
- `TauCeti.isSmoothCharacter_one` (degenerate): The trivial character is smooth and twisting by it is the identity.
- `TauCeti.not_isSmoothCharacter_padicIdentity` (non-example): The identity character on (ℚ_p)^× is not smooth; continuity into its p-adic target does not imply an open kernel.
- `TauCeti.SmoothRep.twist_ofCharacter` (compatibility): A(χ) ⊗ ψ = A(χψ).

**Acceptance checks.**

- For G = ℚ_p^× the unramified characters x ↦ t^{v(x)}, t ∈ A^×, are smooth (its kernel contains the open subgroup ℤ_p^×).
- The character ℚ_p^× → ℝ_{>0}^× ⊂ ℂ^×, x ↦ |x|^s, is smooth for every complex s.
- The identity character (ℚ_p)^× → (ℚ_p)^× is continuous for the p-adic topology but is not smooth: its kernel {1} is not open.

**Uses.** SmoothRepresentationsOfLocalGroups:SR.2/modulus-character: the modulus character δ_P and its square root are smooth characters of P. SmoothRepresentationsOfLocalGroups:SR.3/unramified-characters: unramified characters of a Levi subgroup and the twisting action on supercuspidal supports. Ding 2025, §3.1.1, pp. 33–34: generic smooth characters of T(K) and the smooth principal series. Treumann–Venkatesh 2016, §2.9: unramified characters of a torus.

**Sources.** `BZ76`, Ch. I §2, 2.16, p. 20: Tensor products of algebraic representations, in particular twists by characters. `BERNSTEIN92`, Ch. II §3, Definition 18, p. 43: Unramified characters Ψ(G) = Hom(G/G°, ℂ^×) of a reductive group, which act on representations by twisting.

#### The smooth contragredient

**Identifier:** `SmoothRepresentationsOfLocalGroups:SR.0:abelian-category/smooth-dual`. **Kind:** construction. **Proposed name:** `TauCeti.SmoothRep.smoothDual`. **Module:** `TauCeti/RepresentationTheory/Smooth/Basic`. **Realises:** `SR.0`, `SR.0:abelian-category`.

For a smooth representation (ρ, V) over A, the smooth dual (contragredient) is Ṽ = (Hom_A(V, A))^∞, the smooth part of Mathlib's algebraic dual representation Representation.dual ((g·λ)(v) = λ(ρ(g)⁻¹ v)). This is a contravariant A-linear functor SmoothRep A G ⥤ (SmoothRep A G)ᵒᵖ with: (1) Hom_G(V, W̃) ≅ Hom_G(W, Ṽ) naturally (both are the G-invariant bilinear pairings V × W → A); (2) a natural evaluation map V → Ṽ̃; (3) when U has invertible pro-order, (Ṽ)^U = Hom_A(V^U, A) via e_U; (4) over a field k in which all compact open subgroups have invertible pro-order, V ↦ Ṽ is exact and V → Ṽ̃ is injective, and it is an isomorphism iff V is admissible.

**Hypotheses.** G locally profinite; A commutative; for (3)–(4) invertible pro-orders, and for (4) A = k a field.

**Construction or proof.**
1. Ṽ := smoothPart of the dual representation; functoriality by transposition.
2. (1): a G-map V → W̃ is a G-invariant pairing V × W → A, smooth automatically in each variable; symmetric in V, W.
3. (3): a smooth functional fixed by U satisfies λ = λ ∘ e_U, so it is determined by its restriction to V^U, and every functional on V^U extends by λ ∘ e_U.
4. (4): exactness of duality on finite-dimensional pieces V^U and of U-invariants; V → Ṽ̃ restricted to V^U is the map into the double dual of V^U, an isomorphism iff dim V^U < ∞.

**Direct prerequisites.** `SmoothRepresentationsOfLocalGroups:SR.0:abelian-category/smooth-vectors`, `SmoothRepresentationsOfLocalGroups:SR.0:abelian-category/averaging-projector`, `SmoothRepresentationsOfLocalGroups:SR.0:abelian-category/admissible`, `mathlib:Representation.dual`.

**API.**

- `TauCeti.SmoothRep.smoothDual` (data): Ṽ := smoothPart (Representation.dual ρ).
- `TauCeti.SmoothRep.smoothDualFunctor` (functoriality): The contravariant A-linear functor V ↦ Ṽ.
- `TauCeti.SmoothRep.homSmoothDualEquiv` (universal-property): Hom_G(V, W̃) ≃ₗ[A] Hom_G(W, Ṽ), natural in V and W.
- `TauCeti.SmoothRep.toDoubleDual` (data): The natural map V → Ṽ̃.
- `TauCeti.SmoothRep.invariants_smoothDual` (characterisation): (Ṽ)^U ≃ Hom_A(V^U, A) when HasUnitProOrder A U.
- `TauCeti.SmoothRep.toDoubleDual_bijective_iff` (characterisation): Over a field with invertible pro-orders, V → Ṽ̃ is bijective iff V is admissible.
- `TauCeti.SmoothRep.smoothDual_exact` (relation): Over a field with invertible pro-orders, smooth duality is exact.
- `TauCeti.SmoothRep.smoothDual_eq_dual` (compatibility): For G discrete finite with invertible order, Ṽ = Representation.dual ρ.

**Unit tests.**

- `TauCeti.SmoothRep.smoothDual_character` (computation): The smooth dual of A(χ) is A(χ⁻¹).
- `TauCeti.SmoothRep.smoothDual_zero` (degenerate): The smooth dual of 0 is 0.
- `TauCeti.SmoothRep.toDoubleDual_not_surjective` (non-example): For G = ℚ_p, k = ℚ and V = ℚ[ℚ_p/ℤ_p], V → Ṽ̃ is not surjective.
- `TauCeti.SmoothRep.smoothDual_eq_dual_test` (compatibility): For G = ℤ/2 discrete and k = ℚ, the smooth dual of the sign representation is Representation.dual of it.

**Acceptance checks.**

- For a smooth character χ, the smooth dual of A(χ) is A(χ⁻¹).
- For G compact, k = ℂ and V finite dimensional, Ṽ is Mathlib's Representation.dual.
- For G = ℚ_p and V = ℂ[ℚ_p/ℤ_p] (not admissible), V → Ṽ̃ is injective but not surjective.

**Uses.** Bernstein 1992, Ch. I Definition 8, Proposition 6 and Proposition 7, p. 14: contragredient, adjunction-type identity, and V ≅ Ṽ̃ iff admissible. Casselman 1995, §2.1 and (3.1.2): the contragredient of i_P σ is i_P σ̃. Fargues–Scholze 2021, Ch. V §1, Corollary V.1.4: the smooth dual (V*)^sm and its derived version. SmoothRepresentationsOfLocalGroups:SR.2/induced-contragredient: contragredient of compact and parabolic induction. SmoothRepresentationsOfLocalGroups:SR.2a/jacquet-duality: the Jacquet module of the contragredient for the opposite parabolic. HeckeStacksAndLocalShtukas:HS3: smooth dual of admissible complexes (derived version in SR.0:derived-extension).

**Sources.** `BERNSTEIN92`, Ch. I §2.2, Definition 8, Proposition 6, Proposition 7, Lemma 5, p. 14: Defines Ṽ as the smooth part of V*, proves (Ṽ)^K = (V^K)*, Hom_G(V, W̃) = Hom_G(W, Ṽ) and V ↪ Ṽ̃, with equality exactly for admissible V. `BZ76`, Ch. I §2, 2.13–2.15, p. 19: The contragredient representation of an algebraic representation and its basic properties. `FS21`, Ch. V §1, Corollary V.1.4: The smooth dual (V*)^sm of a smooth representation and its derived functor on D(G, Λ).

**Atlas planet:** Smooth contragredient.

#### Change of coefficients

**Identifier:** `SmoothRepresentationsOfLocalGroups:SR.0:abelian-category/coefficient-change`. **Kind:** construction. **Proposed name:** `TauCeti.SmoothRep.baseChange`. **Module:** `TauCeti/RepresentationTheory/Smooth/Basic`. **Realises:** `SR.0`, `SR.0:abelian-category`.

For a homomorphism of commutative rings A → B, base change V ↦ B ⊗_A V (Tau Ceti's Representation.baseChange) preserves smoothness and defines an additive functor SmoothRep A G ⥤ SmoothRep B G, left adjoint to restriction of scalars SmoothRep B G ⥤ SmoothRep A G. For a compact open U there is a natural B-linear map B ⊗_A V^U → (B ⊗_A V)^U. It is an isomorphism if B is flat over A or if U has pro-order invertible in A; it is not an isomorphism in general. A ring automorphism σ of A (for instance σ ∈ Aut(ℂ)) gives the σ-twist V ↦ A ⊗_{A,σ} V, an autoequivalence preserving admissibility and irreducibility.

**Hypotheses.** A → B a homomorphism of commutative rings; G locally profinite.

**Construction or proof.**
1. Smoothness: the stabiliser of b ⊗ v contains that of v; sums of such tensors have open stabilisers.
2. Adjunction: Hom_B(B ⊗_A V, W) = Hom_A(V, W) restricted to G-maps.
3. Invariants: V^U is the directed union over open normal U' ≤ U of the kernels of the finitely many maps ρ(u) − 1 (u ∈ U/U') on V^{U'}; flat base change preserves finite kernels and commutes with directed unions. With invertible pro-order, V^U = e_U V is a direct summand, preserved by every base change.
4. Failure: U = ℤ/2 acting by −1 on A = ℤ, B = F_2: V^U = 0 while (F_2 ⊗ V)^U = F_2.

**Direct prerequisites.** `SmoothRepresentationsOfLocalGroups:SR.0:abelian-category/smooth-rep-category`, `SmoothRepresentationsOfLocalGroups:SR.0:abelian-category/averaging-projector`, `tauceti:Representation.baseChange`.

**API.**

- `TauCeti.SmoothRep.baseChange` (functoriality): The functor SmoothRep A G ⥤ SmoothRep B G, V ↦ B ⊗_A V, with baseChange_id and baseChange_comp.
- `TauCeti.SmoothRep.restrictScalars` (functoriality): Restriction of scalars SmoothRep B G ⥤ SmoothRep A G.
- `TauCeti.SmoothRep.baseChangeAdjunction` (universal-property): baseChange ⊣ restrictScalars.
- `TauCeti.SmoothRep.baseChangeInvariants` (data): The natural map B ⊗_A V^U → (B ⊗_A V)^U.
- `TauCeti.SmoothRep.baseChangeInvariants_bijective_of_flat` (relation): An isomorphism when B is flat over A.
- `TauCeti.SmoothRep.baseChangeInvariants_bijective_of_unit` (relation): An isomorphism when HasUnitProOrder A U.
- `TauCeti.SmoothRep.twistRingAut` (functoriality): The σ-twist for a ring automorphism σ of A, preserving admissibility and irreducibility.
- `TauCeti.SmoothRep.baseChange_eq_representation_baseChange` (compatibility): On underlying representations, baseChange is Tau Ceti's Representation.baseChange.

**Unit tests.**

- `TauCeti.SmoothRep.baseChangeInvariants_sign_not_surjective` (non-example): For U = ℤ/2 acting by sign on ℤ and B = F_2 the map 0 → F_2 is not surjective.
- `TauCeti.SmoothRep.baseChange_id` (degenerate): Base change along the identity is naturally the identity functor.
- `TauCeti.SmoothRep.baseChangeInvariants_permutation` (computation): For V = A[G/U'] and U compact open, B ⊗ V^U → (B ⊗ V)^U is an isomorphism (both free on the U-orbits of G/U').
- `TauCeti.SmoothRep.baseChange_compat_test` (compatibility): The underlying representation of baseChange A B V is Representation.baseChange.

**Acceptance checks.**

- The sign character of ℤ/2 over ℤ → F_2 gives the non-isomorphism 0 → F_2 on invariants.
- Over ℤ[1/2] → F_3 the same example gives an isomorphism (both sides 0).
- For σ complex conjugation on ℂ, the σ-twist of an unramified character x ↦ t^{v(x)} is x ↦ t̄^{v(x)}.

**Uses.** AutomorphicFormsOnReductiveGroups:AF.4: the Aut(ℂ)-twist of smooth representations and fields of rationality. AutomorphicCongruences:L3: the natural map V^U ⊗_A B → (V ⊗_A B)^U, not an unconditional isomorphism. ExcursionOperatorsAndSpectralAction:ES0: scalar transport along a chosen field isomorphism Q̄_ℓ ≅ ℂ. SmoothRepresentationsOfLocalGroups:SR.1/bernstein-centre-corners: coefficient-change maps of the Λ-linear centre.

**Sources.** `BERNSTEIN87`, §2.0, Generalization, p. 9: For a commutative algebra B, smooth (G, B)-modules and the decomposition M(G, B) = ∏ M(Θ, B). `BERNSTEIN92`, Ch. III §3.3, p. 67: Smooth (G, B)-modules over a commutative noetherian B and B-admissibility (invariants finitely generated over B).

#### The centre of the smooth category

**Identifier:** `SmoothRepresentationsOfLocalGroups:SR.0:abelian-category/smooth-centre`. **Kind:** definition. **Proposed name:** `TauCeti.SmoothCentre`. **Module:** `TauCeti/RepresentationTheory/Smooth/Basic`. **Realises:** `SR.0`, `SR.0:abelian-category`.

The centre of the smooth category is Z(G, A) := CatCenter (SmoothRep A G) = End(𝟭), the commutative ring of natural endomorphisms of the identity functor (Mathlib's CatCenter). An element z acts on every smooth V by a G-endomorphism z_V commuting with all morphisms. There is a ring map A → Z(G, A) (Linear.toCatCenter); z_V restricts to subobjects and passes to quotients; Z(G, A) acts on Hom_G(V, W) and on Ext groups compatibly from both sides. For abelian G with a cofinal family of compact open subgroups of invertible pro-order, Z(G, A) ≅ lim_U A[G/U].

**Hypotheses.** A commutative; G a topological group (locally profinite for the description by corners).

**Construction or proof.**
1. Take Mathlib's CatCenter of the abelian category SmoothRep A G; commutativity is IsMulCommutative (CatCenter C).
2. Restriction to subobjects: naturality applied to the inclusion; to quotients: naturality applied to the projection.
3. Abelian G: Z(G, A) acts on each generator A[G/U] by an element of End_G(A[G/U]) = A[G/U] (commutative), compatible along U' ≤ U; conversely an element of lim_U A[G/U] acts on every smooth module through its U-components. The description for general G by Hecke corners is SR.1's bernstein-centre-corners.

**Direct prerequisites.** `SmoothRepresentationsOfLocalGroups:SR.0:abelian-category/smooth-rep-abelian`, `mathlib:CategoryTheory.CatCenter`, `mathlib:CategoryTheory.Linear.toCatCenter`; `mathlib:MonoidAlgebra.mapDomainRingHom`.

**API.**

- `TauCeti.SmoothCentre` (data): SmoothCentre A G := CatCenter (SmoothRep A G).
- `TauCeti.SmoothCentre.app` (projection): The action z_V ∈ End_G(V).
- `TauCeti.SmoothCentre.naturality` (relation): f ∘ z_V = z_W ∘ f for every G-map f : V → W.
- `TauCeti.SmoothCentre.ext` (extensionality): z = z' iff z_V = z'_V for all V (equivalently for all V in a generating family, e.g. the A[G/U]).
- `TauCeti.SmoothCentre.algebraMap` (constructor): The ring map A → SmoothCentre A G (Linear.toCatCenter).
- `TauCeti.SmoothCentre.instCommRing` (instance): A commutative ring structure (multiplication commutative by IsMulCommutative (CatCenter C)).
- `TauCeti.SmoothCentre.equivLimitOfCommutative` (characterisation): For abelian G with HasCofinalUnitProOrder: SmoothCentre A G ≅ lim_U A[G/U].

**Unit tests.**

- `TauCeti.SmoothCentre.trivialGroup` (degenerate): For G trivial, SmoothCentre A G ≅ A.
- `TauCeti.SmoothCentre.finite_eq_center` (compatibility): For G finite discrete, SmoothCentre A G ≅ the centre of A[G] (Mathlib Subring.center of MonoidAlgebra).
- `TauCeti.SmoothCentre.int_discrete` (computation): For G = ℤ discrete, the category centre is the commutative group algebra A[ℤ], hence the Laurent polynomial ring over A.
- `TauCeti.SmoothCentre.padicInt_ne_groupRing` (non-example): For G = ℤ_p and A = ℚ(μ_{p^∞}), the map ℚ(μ_{p^∞})[ℤ_p] → SmoothCentre is not surjective (the idempotent of a single character is central but not in the group ring).

**Acceptance checks.**

- For G trivial, Z(G, A) = A.
- For G finite discrete and A = ℂ, Z(G, ℂ) is the centre of ℂ[G], of dimension the number of conjugacy classes.
- For G = ℤ_p and A = ℂ, Z = lim_n ℂ[ℤ/p^n] = ∏ over smooth characters of ℂ, which is strictly larger than the image of ℂ[ℤ_p].

**Uses.** Bernstein 1987, §1.8: the central algebra Z(M) = End(Id_M) of an abelian category and its identification for idempotented rings. ExcursionOperatorsAndSpectralAction:ES0:classical-center: the ordinary centre on the correct coefficient category, whose definition needs no complex Bernstein decomposition. ExcursionOperatorsAndSpectralAction:ES7:parabolic: target of Ψ_G via its Hecke-corner description (SR.1). SmoothRepresentationsOfLocalGroups:SR.1/bernstein-centre-corners: the Λ-linear Bernstein centre as an inverse limit of centres of Hecke corners. SmoothRepresentationsOfLocalGroups:SR.3/bernstein-centre-blocks: the complex block description of the same centre.

**Sources.** `BERNSTEIN87`, §1.8, p. 8: Defines the central algebra Z(M) = End(Id_M) and identifies it, for an idempotented ring H, with the bimodule endomorphisms of H. `BERNSTEIN92`, Ch. III §4.2, p. 72: The centre of the category of smooth representations, studied block by block.

**Atlas planet:** Centre of the smooth category.

### SR.1. Hecke algebras over rings

Hecke algebras over a coefficient ring, in two models. The first is convolution of locally constant compactly supported functions against an A-valued Haar measure, which exists when some compact open subgroup has invertible pro-order. The second is the endomorphism ring of the permutation module A[G/U], which exists over every A, including F_p for p-adic G. Both models agree with the double-coset Hecke ring of Mathlib and Tau Ceti and act on invariants. With a cofinal family of compact open subgroups of invertible pro-order, smooth representations are the nondegenerate modules over H(G, A), and irreducibles with U-fixed vectors correspond to simple modules over the corner e_U H e_U. The Λ-linear Bernstein centre is π₀End of the identity of D(G, Λ), and it equals the limit of the centres of the Hecke corners. Over ℤ_ℓ[√q] it is ℓ-adically separated. Iwahori decompositions and the positive Hecke homomorphism from a Levi subgroup are proved here, with applications at pro-p Iwahori level and at GSp_4 Klingen level. The layer ends with the Iwahori–Matsumoto and Bernstein presentations and the centre of the Iwahori–Hecke algebra.

**Planets of this layer:** Hecke algebra of a locally profinite group (`convolution-algebra`); Hecke algebras of compact open level (`permutation-hecke-algebra`); Smooth representations as Hecke modules (`hecke-module-equivalence`); Λ-linear Bernstein centre (`bernstein-centre-corners`); Positive Hecke monoid homomorphism (`positive-hecke-homomorphism`); Iwahori–Matsumoto presentation (`iwahori-matsumoto`).

#### Locally constant compactly supported functions

**Identifier:** `SmoothRepresentationsOfLocalGroups:SR.1/locally-constant-compact-support`. **Kind:** definition. **Proposed name:** `TauCeti.LocallyConstantCompact`. **Module:** `TauCeti/RepresentationTheory/Smooth/Hecke`.

For an l-space X (Hausdorff, locally compact, totally disconnected) and an A-module M, C_c^∞(X, M) is the A-module of locally constant functions f : X → M with compact support (Mathlib's LocallyConstant with compact support; when M carries the discrete topology this is Mathlib's CompactlySupportedContinuousMap X M). It is spanned by the functions 1_K·m for K compact open and m ∈ M; every f is a finite sum Σ m_i 1_{K_i} with the K_i pairwise disjoint compact open, and any two such presentations have a common refinement. For X = G a locally profinite group, every f ∈ C_c^∞(G, M) is left and right invariant under some compact open subgroup, and C_c^∞(G, M)^{right-U} ≅ finitely supported functions on G/U.

**Hypotheses.** X an l-space; M an A-module; for the group statements G locally profinite.

**Construction or proof.**
1. Compact support and local constancy give a finite cover of supp f by compact open sets on which f is constant; refine to a disjoint cover using a basis of compact open sets (Bernstein 1992 Ch. I Lemma 1(2)).
2. Common refinement: intersect the two finite disjoint covers.
3. Uniform invariance on a group: each of finitely many compact open K_i is a finite union of left (and right) cosets of a small compact open subgroup (van-dantzig).
4. Cosheaf presentation: refine the supports of a family summing to zero to a common finite disjoint compact open partition subordinate to the cover; the relations among the pieces are differences of the same function placed in two members of the cover.

**Direct prerequisites.** `SmoothRepresentationsOfLocalGroups:SR.0:abelian-category/van-dantzig`, `mathlib:LocallyConstant`, `mathlib:CompactlySupportedContinuousMap`, `mathlib:TopologicalSpace.CompactOpens`.

**API.**

- `TauCeti.LocallyConstantCompact` (data): C_c^∞(X, M): locally constant f : X → M with compact support, as an A-module.
- `TauCeti.LocallyConstantCompact.coeFn` (coercion): Coercion to functions X → M, injective.
- `TauCeti.LocallyConstantCompact.ext` (extensionality): f = g iff f x = g x for all x.
- `TauCeti.LocallyConstantCompact.indicator` (constructor): 1_K · m for K a compact open subset and m ∈ M.
- `TauCeti.LocallyConstantCompact.span_indicator` (characterisation): C_c^∞(X, M) is spanned by the 1_K · m.
- `TauCeti.LocallyConstantCompact.exists_disjoint_presentation` (characterisation): Every f is Σ m_i 1_{K_i} with pairwise disjoint compact open K_i; two presentations have a common refinement (finite clopen refinement).
- `TauCeti.LocallyConstantCompact.exists_rightStable` (characterisation): Every compact open U ⊆ G is right-stable under some compact open subgroup K (UK = U); hence every clopen subset of G is admissible: its intersection with each compact open set is right-stable under some compact open subgroup.
- `TauCeti.LocallyConstantCompact.cosheaf` (other): For an open cover (U_i) of X, ⊕_{i,j} C_c^∞(U_i ∩ U_j, M) → ⊕_i C_c^∞(U_i, M) → C_c^∞(X, M) → 0 is exact (extension by zero; surjectivity and exactness in the middle from the finite clopen refinement).
- `TauCeti.LocallyConstantCompact.translate` (functoriality): Left and right translation actions of G on C_c^∞(G, M), both smooth representations.
- `TauCeti.LocallyConstantCompact.exists_biinvariant` (relation): Every f ∈ C_c^∞(G, M) is bi-invariant under some compact open subgroup.
- `TauCeti.LocallyConstantCompact.equivFinsuppQuotient` (equivalence): Right-U-invariant elements of C_c^∞(G, M) ≃ (G ⧸ U →₀ M), equivariantly for left translation.
- `TauCeti.LocallyConstantCompact.tensorEquiv` (equivalence): C_c^∞(X × Y, A) ≃ C_c^∞(X, A) ⊗_A C_c^∞(Y, A).
- `TauCeti.LocallyConstantCompact.equivCompactlySupported` (compatibility): For M with the discrete topology, C_c^∞(X, M) ≃ Mathlib's CompactlySupportedContinuousMap X M.

**Unit tests.**

- `TauCeti.LocallyConstantCompact.finite_eq_pi` (computation): For X = Fin 3 discrete, C_c^∞(X, ℤ) ≃ Fin 3 → ℤ.
- `TauCeti.LocallyConstantCompact.empty` (degenerate): For X empty, C_c^∞(X, M) = 0.
- `TauCeti.LocallyConstantCompact.real_eq_zero` (non-example): For X = ℝ with its usual topology, every locally constant compactly supported f : ℝ → ℤ is 0.
- `TauCeti.LocallyConstantCompact.compat_discrete` (compatibility): For X = ℤ_p and M = ℤ with the discrete topology, C_c^∞(X, ℤ) agrees with CompactlySupportedContinuousMap ℤ_p ℤ.

**Acceptance checks.**

- For X finite discrete, C_c^∞(X, A) = A^X.
- For X = ℤ_p, C_c^∞(X, ℤ) = locally constant functions = ⋃_n functions on ℤ/p^n.
- For X = ℝ (not totally disconnected) the only locally constant compactly supported function is 0, so the definition is only used for l-spaces.

**Uses.** SmoothRepresentationsOfLocalGroups:SR.1/convolution-algebra: the underlying module of the Hecke algebra H(G, A). AutomorphicLFunctionsAndLocalFactors:AL.0: the single generic carrier of Schwartz–Bruhat functions on a local field, with function coercion, linear operations and translations. AutomorphicFormsOnReductiveGroups:AF.0: finite-place factors of adelic test functions. He 2018, §1.2 and §6.3–6.4: compact test functions, the finite clopen refinement and the cosheaf presentation used for cocentres. SmoothRepresentationsOfLocalGroups:SR.2/l-sheaf-model: compactly supported sections of l-sheaves generalise C_c^∞(X, M).

**Sources.** `BERNSTEIN92`, Ch. I §1.1 Lemma 1 and §1.2, pp. 7–8: Defines S(X), the locally constant compactly supported functions on an l-space, and the disjoint compact open refinement of covers of compact sets. `BZ76`, Ch. I §1, 1.7–1.12, p. 7: Distributions on l-spaces and the space S(X) of locally constant compactly supported functions. `HE18`, §1.2, p. 7; §3.2, p. 14: H = lim_K H(G, K): every test function is bi-invariant at some compact open level; a compact open set is right-stable under some compact open subgroup, so clopen sets are admissible in Grothendieck's sense.

#### The open–closed exact sequence

**Identifier:** `SmoothRepresentationsOfLocalGroups:SR.1/open-closed-sequence`. **Kind:** theorem. **Proposed name:** `TauCeti.LocallyConstantCompact.shortExact_open_closed`. **Module:** `TauCeti/RepresentationTheory/Smooth/Hecke`.

For an l-space X, an open subset U and its closed complement Z = X ∖ U, extension by zero and restriction give a short exact sequence of A-modules 0 → C_c^∞(U, M) → C_c^∞(X, M) → C_c^∞(Z, M) → 0. If a locally profinite group acts continuously on X preserving U, the sequence is one of smooth representations. Iterating along a finite filtration of X by open subsets gives the filtration used in the Mackey and geometric lemmas.

**Hypotheses.** X an l-space; U ⊆ X open; M an A-module.

**Construction or proof.**
1. Injectivity of extension by zero is clear; exactness in the middle: a function vanishing on Z has compact support in U.
2. Surjectivity: f ∈ C_c^∞(Z, M) is constant on the pieces of a finite open cover of its support; refine to disjoint compact open subsets of X (Bernstein 1992 Ch. I Lemma 1(2)) and extend by the same constants.

**Direct prerequisites.** `SmoothRepresentationsOfLocalGroups:SR.1/locally-constant-compact-support`.

**Acceptance checks.**

- For X = ℙ¹(ℚ_p), U = ℚ_p and Z = {∞}: 0 → C_c^∞(ℚ_p) → C^∞(ℙ¹(ℚ_p)) → A → 0, the sequence underlying the Steinberg representation of GL_2(ℚ_p).
- For U = X the sequence is 0 → C_c^∞(X) → C_c^∞(X) → 0 → 0.
- For X finite discrete it is the splitting A^X = A^U ⊕ A^Z.

**Sources.** `BERNSTEIN92`, Ch. I §1.2, Proposition 2, p. 8: The exact sequence 0 → S(U) → S(X) → S(Z) → 0 for U open with complement Z, with proof by disjoint refinement. `BZ76`, Ch. I §1, 1.8, p. 7: Exactness of the sequence of locally constant compactly supported functions for an open subset and its complement.

#### Haar measures with values in a ring

**Identifier:** `SmoothRepresentationsOfLocalGroups:SR.1/a-valued-haar-measure`. **Kind:** definition. **Proposed name:** `TauCeti.HaarMeasureWithValues`. **Module:** `TauCeti/RepresentationTheory/Smooth/Hecke`.

Let G be locally profinite and A a commutative ring. An A-valued (left) Haar measure is a function μ : {compact open subsets of G} → A that is finitely additive on disjoint unions and left invariant, μ(gK) = μ(K). If U₀ is a compact open subgroup of pro-order invertible in A, there is a unique such μ with μ(U₀) = 1, given by μ(gU) = [U₀ : U]⁻¹ for open subgroups U ≤ U₀; then every compact open subgroup U has μ(U) = [U : U ∩ U₀]·[U₀ : U ∩ U₀]⁻¹, and μ(U) is a unit exactly when U has invertible pro-order. For a locally pro-p G and a pro-p U₀, μ takes values in ℤ[1/p]·μ(U₀) and is the base change of the ℤ[1/p]-valued measure. For A = ℝ, μ(K) = haar(K)/haar(U₀) with Mathlib's haarMeasure.

**Hypotheses.** G locally profinite; A commutative; U₀ compact open with HasUnitProOrder A U₀ (for existence).

**Construction or proof.**
1. Uniqueness: every compact open set is a finite disjoint union of left cosets of a small open subgroup U ≤ U₀ (locally-constant-compact-support), and [U₀ : U] μ(U) = μ(U₀).
2. Existence and independence of the subdivision: refining U to U' ≤ U multiplies the count of cosets by [U : U'] and divides each mass by the same unit.
3. Comparison with Mathlib: the real Haar measure restricted to compact open sets is finitely additive and left invariant, hence a scalar multiple of μ by uniqueness.

**Direct prerequisites.** `SmoothRepresentationsOfLocalGroups:SR.1/locally-constant-compact-support`, `SmoothRepresentationsOfLocalGroups:SR.0:abelian-category/unit-pro-order`, `mathlib:MeasureTheory.Measure.haarMeasure`.

**API.**

- `TauCeti.HaarMeasureWithValues` (data): Finitely additive, left-invariant A-valued functions on compact open subsets.
- `TauCeti.HaarMeasureWithValues.normalized` (constructor): The unique measure with μ(U₀) = 1 for U₀ of invertible pro-order.
- `TauCeti.HaarMeasureWithValues.ext` (extensionality): Two measures agreeing on one compact open subgroup U₀ of invertible pro-order agree.
- `TauCeti.HaarMeasureWithValues.apply_subgroup` (simp): μ(U) = [U : U ∩ U₀]·[U₀ : U ∩ U₀]⁻¹ for the normalised measure.
- `TauCeti.HaarMeasureWithValues.isUnit_apply_iff` (characterisation): μ(U) ∈ Aˣ iff HasUnitProOrder A U (for the normalised measure).
- `TauCeti.HaarMeasureWithValues.map` (functoriality): Base change along a ring homomorphism A → B; the normalised measure over ℤ[1/p] base-changes to the normalised measure over any ℤ[1/p]-algebra.
- `TauCeti.HaarMeasureWithValues.modularCharacter` (data): Δ_μ : G → Aˣ is determined by μ(Kg⁻¹) = Δ_μ(g)μ(K) when μ takes unit values on a basis of subgroups. Thus μ(Kg) = Δ_μ(g)⁻¹μ(K), agreeing with Mathlib’s modularCharacter convention. The image in Aˣ can lose information; Δ_μ = 1 does not characterise real unimodularity in positive characteristic.
- `TauCeti.HaarMeasureWithValues.eq_haarMeasure` (compatibility): For A = ℝ, μ(K) = (haarMeasure K₀ K)/(haarMeasure K₀ U₀) for compact open K.

**Unit tests.**

- `TauCeti.HaarMeasureWithValues.padic_apply` (computation): For G = ℚ_p, U₀ = ℤ_p over ℤ[1/p], μ(p^n ℤ_p) = p^{−n} for all n ∈ ℤ.
- `TauCeti.HaarMeasureWithValues.finite_counting` (degenerate): For G finite discrete normalised at {1}, μ(K) = |K|.
- `TauCeti.HaarMeasureWithValues.no_fp_measure` (non-example): There is no F_p-valued Haar measure on ℤ_p with μ(ℤ_p) = 1.
- `TauCeti.HaarMeasureWithValues.real_compat` (compatibility): For G = ℚ_p, A = ℝ, μ(p^n ℤ_p) equals Mathlib's Haar measure normalised on ℤ_p.

**Acceptance checks.**

- G = ℚ_p, U₀ = ℤ_p, A = ℤ[1/p]: μ(p^n ℤ_p) = p^{−n} and μ(p^{−n}ℤ_p) = p^n.
- G finite discrete, U₀ = {1}: μ is the counting measure.
- For G = ℤ_p and A = F_p there is no F_p-valued Haar measure with μ(ℤ_p) = 1, since μ(ℤ_p) = p·μ(pℤ_p) = 0.

**Uses.** SmoothRepresentationsOfLocalGroups:SR.1/integration: finite-sum integration of locally constant compactly supported functions. SmoothRepresentationsOfLocalGroups:SR.1/convolution-algebra: the convolution product. SmoothRepresentationsOfLocalGroups:SR.2/modulus-character: the A-valued modular character Δ(g) = μ(gUg⁻¹)/μ(U). He 2018, §1.2, pp. 6–7: integral normalised Haar integration in ℤ[1/p] via a pro-p Iwahori subgroup, and its base change. GL2AutomorphicRepresentationsAndTransfer:R16.1: Haar measures on GL_2(F) and the distinction between 1_I and the normalised e_K.

**Sources.** `HE18`, §1.2, pp. 6–7: Normalises the Haar measure so that a pro-p Iwahori subgroup has volume one, whence volumes of compact open sets lie in ℤ[1/p], and uses its base change to other coefficient rings. `BZ76`, Ch. I §1, 1.18–1.19, p. 10: Existence and uniqueness of Haar measure on an l-group, defined on locally constant compactly supported functions. `BERNSTEIN92`, Ch. I §2.1, Proposition 5, p. 11: Multiplication by a Haar measure identifies S(G) with the Hecke algebra H(G).

#### Finite-sum integration

**Identifier:** `SmoothRepresentationsOfLocalGroups:SR.1/integration`. **Kind:** construction. **Proposed name:** `TauCeti.LocallyConstantCompact.integral`. **Module:** `TauCeti/RepresentationTheory/Smooth/Hecke`.

For an A-valued Haar measure μ on G and an A-module M, integration ∫ : C_c^∞(G, M) → M is the A-linear map ∫ f dμ = Σ_{gU} μ(gU) f(g), summed over the finitely many left cosets of a compact open subgroup U such that f is right U-invariant (when μ(gU) is defined, e.g. U ≤ U₀). It is independent of U, left invariant, satisfies ∫ 1_K m = μ(K) m, commutes with A-linear maps M → M', and with base change. The same formula defines integration of locally constant compactly supported functions on G × G and gives Fubini.

**Hypotheses.** G locally profinite; μ an A-valued Haar measure (normalised on U₀ of invertible pro-order); M an A-module.

**Construction or proof.**
1. Independence of U: passing to U' ≤ U splits each coset into [U : U'] cosets of mass μ(U)/[U:U'].
2. Left invariance from μ(hgU) = μ(gU).
3. Fubini: both iterated integrals equal the finite sum over cosets of a product subgroup.

**Direct prerequisites.** `SmoothRepresentationsOfLocalGroups:SR.1/a-valued-haar-measure`, `SmoothRepresentationsOfLocalGroups:SR.1/locally-constant-compact-support`.

**API.**

- `TauCeti.LocallyConstantCompact.integral` (data): ∫ : C_c^∞(G, M) →ₗ[A] M for an A-valued Haar measure.
- `TauCeti.LocallyConstantCompact.integral_indicator` (simp): ∫ 1_K · m = μ(K) · m.
- `TauCeti.LocallyConstantCompact.integral_translate` (relation): Left invariance ∫ f(g·) = ∫ f.
- `TauCeti.LocallyConstantCompact.integral_map` (functoriality): ∫ (φ ∘ f) = φ(∫ f) for A-linear φ : M → M'.
- `TauCeti.LocallyConstantCompact.integral_prod` (relation): Fubini for C_c^∞(G × G, M).
- `TauCeti.LocallyConstantCompact.integral_baseChange` (compatibility): Integration commutes with base change along A → B.

**Unit tests.**

- `TauCeti.LocallyConstantCompact.integral_padic` (computation): ∫_{ℚ_p} 1_{p^n ℤ_p} = p^{−n} over ℤ[1/p].
- `TauCeti.LocallyConstantCompact.integral_zero` (degenerate): ∫ 0 = 0.
- `TauCeti.LocallyConstantCompact.integral_finite_sum` (compatibility): For G finite discrete and counting measure, ∫ f = Σ_g f g (Finset.sum).
- `TauCeti.LocallyConstantCompact.integral_right_invariant_unimodular` (characterisation): For a unimodular G, ∫ f(·g) = ∫ f.

**Acceptance checks.**

- ∫_{ℚ_p} 1_{p^n ℤ_p} dμ = p^{−n} for μ normalised on ℤ_p.
- For G finite discrete with counting measure, ∫ f = Σ_g f(g).
- Integration is not defined over F_p for G = ℤ_p normalised on ℤ_p (no such μ).

**Uses.** SmoothRepresentationsOfLocalGroups:SR.1/convolution-algebra: the convolution product (f₁ * f₂)(x) = ∫ f₁(y) f₂(y⁻¹x) dμ(y). SmoothRepresentationsOfLocalGroups:SR.1/hecke-module-equivalence: the action f·v = ∫ f(g) ρ(g) v dμ(g) of the Hecke algebra on a smooth representation. SmoothRepresentationsOfLocalGroups:SR.2/induced-contragredient: invariant integration on H\G used for the contragredient of induction. He 2018, §§1.2–1.3: finite-sum integration with arbitrary module coefficients.

**Sources.** `BZ76`, Ch. I §1, 1.18–1.21, pp. 10–11: Haar measure as an invariant functional on S(G) and on factor spaces.

#### The Hecke algebra of a locally profinite group

**Identifier:** `SmoothRepresentationsOfLocalGroups:SR.1/convolution-algebra`. **Kind:** construction. **Proposed name:** `TauCeti.HeckeAlgebra`. **Module:** `TauCeti/RepresentationTheory/Smooth/Hecke`.

For an A-valued Haar measure μ on G, the Hecke algebra H(G, A) = C_c^∞(G, A) with convolution (f₁ * f₂)(x) = ∫ f₁(y) f₂(y⁻¹x) dμ(y) is an associative A-algebra, without unit unless G is discrete. Convolution has supp(f₁ * f₂) ⊆ supp f₁ · supp f₂; if f₁ is left U-invariant so is f₁ * f₂, and if f₂ is right U-invariant so is f₁ * f₂; 1_U * 1_U = μ(U) 1_U for a compact open subgroup U. The map f ↦ f^∨, f^∨(g) = f(g⁻¹)Δ(g⁻¹), is an anti-automorphism (Δ the modular character of μ; Δ = 1 for unimodular G). The algebra acts on every smooth representation by f·v = ∫ f(g) ρ(g) v dμ(g). Changing μ to cμ rescales the product; base change H(G, A) ⊗_A B ≅ H(G, B).

**Hypotheses.** G locally profinite; μ an A-valued Haar measure normalised on a compact open U₀ of invertible pro-order.

**Construction or proof.**
1. The integrand y ↦ f₁(y) f₂(y⁻¹x) is locally constant with compact support for each x, and the result is locally constant and compactly supported (He 2018, H17).
2. Associativity: Fubini for the double integral (integration).
3. Anti-automorphism: substitute y ↦ y⁻¹ and use μ(K⁻¹) = ∫ 1_K Δ⁻¹.
4. Module structure on smooth V: the integrand g ↦ f(g) ρ(g) v is locally constant with compact support; associativity again by Fubini.

**Direct prerequisites.** `SmoothRepresentationsOfLocalGroups:SR.1/integration`, `SmoothRepresentationsOfLocalGroups:SR.1/a-valued-haar-measure`, `SmoothRepresentationsOfLocalGroups:SR.0:abelian-category/smooth-rep-category`.

**API.**

- `TauCeti.HeckeAlgebra` (data): H(G, A) := C_c^∞(G, A) with convolution for a fixed A-valued Haar measure.
- `TauCeti.HeckeAlgebra.instNonUnitalRing` (instance): An associative non-unital A-algebra.
- `TauCeti.HeckeAlgebra.mul_apply` (simp): (f₁ * f₂)(x) = ∫ f₁(y) f₂(y⁻¹x) dμ(y).
- `TauCeti.HeckeAlgebra.support_mul_subset` (relation): supp(f₁ * f₂) ⊆ supp f₁ · supp f₂.
- `TauCeti.HeckeAlgebra.indicator_mul_indicator` (simp): 1_U * 1_U = μ(U) 1_U for a compact open subgroup U.
- `TauCeti.HeckeAlgebra.involution` (other): f ↦ f^∨, f^∨(g) = f(g⁻¹)Δ(g⁻¹), an anti-automorphism; for unimodular G simply f(g⁻¹).
- `TauCeti.HeckeAlgebra.smul` (data): The action f·v = ∫ f(g) ρ(g) v dμ(g) on a smooth representation, natural in V.
- `TauCeti.HeckeAlgebra.baseChangeEquiv` (functoriality): B ⊗_A H(G,A) ≃ H(G,B) for the pushed-forward Haar measure, B-linearly and multiplicatively; pure tensors satisfy (b ⊗ f)(b′ ⊗ f′) ↦ (b b′) times the image of f*f′.
- `TauCeti.HeckeAlgebra.equivMonoidAlgebra` (compatibility): For G finite discrete with counting measure, H(G, A) ≃ MonoidAlgebra A G as algebras.
- `TauCeti.HeckeAlgebra.withCentralCharacter` (other): For a closed central subgroup Z and a smooth character ω of Z, the variant of functions compactly supported modulo Z with f(zg) = ω(z)⁻¹f(g), with the same convolution over G/Z.

**Unit tests.**

- `TauCeti.HeckeAlgebra.finite_compat` (compatibility): For G = ZMod 3 discrete with counting measure, H(G, ℤ) ≃ ℤ[ZMod 3].
- `TauCeti.HeckeAlgebra.indicator_padic` (computation): In H(ℚ_p, ℤ[1/p]) normalised on ℤ_p, 1_{pℤ_p} * 1_{pℤ_p} = p⁻¹ • 1_{pℤ_p}.
- `TauCeti.HeckeAlgebra.no_one` (non-example): H(ℚ_p, ℚ) has no multiplicative identity.
- `TauCeti.HeckeAlgebra.trivial_group` (degenerate): For G trivial, H(G, A) ≃ A.

**Acceptance checks.**

- For G finite discrete with counting measure, H(G, A) is the group algebra A[G] (Mathlib's MonoidAlgebra).
- 1_U * 1_U = μ(U) 1_U; for U = ℤ_p in ℚ_p over ℤ[1/p], 1_{pℤ_p} * 1_{pℤ_p} = p⁻¹ 1_{pℤ_p}.
- H(G, A) has no unit when G is not discrete: a unit would be a delta function, which is not locally constant.

**Uses.** Bernstein 1992, Ch. I §2.1, Definition 7, Theorem 2: the Hecke algebra H(G) and the equivalence of smooth representations with nondegenerate H(G)-modules. AutomorphicFormsOnReductiveGroups:AF.0: C_c^∞(G(F_v)) with convolution for the finite factors of adelic test functions. AutomorphicSpectralTheory:AS.4: complex finite Hecke convolution and its integrated unitary action. GL2AutomorphicRepresentationsAndTransfer:R16.1: the C_c^∞ Hecke convolution carrier and its compact-mod-centre variant. IgusaVarietiesAndTorsionConcentration:IG.3: smooth representations of J_b(ℚ_p) as nondegenerate modules over C_c(J_b(ℚ_p), F_ℓ). He 2018, §1.2–1.3 and Proposition 13: integral convolution, support and level bounds, associativity and base change.

**Sources.** `BERNSTEIN92`, Ch. I §2.1, Definition 7, Proposition 5 and Theorem 2, pp. 11–12: The Hecke algebra of compactly supported locally constant distributions, its identification with S(G) via Haar measure, and its action on smooth representations. `HE18`, §1.2, pp. 6–7, formula (a); §1.3, p. 7: Defines the convolution of ℤ[1/p]-valued compactly supported locally constant functions against the Haar measure normalised on the pro-p Iwahori, computes products of indicators of compact open sets stable under a pro-p subgroup by formula (a), and sets H_R := H ⊗ R. `BZ76`, Ch. I §1, 1.22–1.30, p. 12: Convolution of distributions on an l-group and the Hecke algebra H(G).

**Atlas planet:** Hecke algebra of a locally profinite group.

#### Normalised idempotents

**Identifier:** `SmoothRepresentationsOfLocalGroups:SR.1/hecke-idempotent`. **Kind:** definition. **Proposed name:** `TauCeti.HeckeAlgebra.idempotent`. **Module:** `TauCeti/RepresentationTheory/Smooth/Hecke`.

For a compact open subgroup U with μ(U) ∈ Aˣ (equivalently, for the normalised measure, U of invertible pro-order), e_U := μ(U)⁻¹ 1_U ∈ H(G, A) is an idempotent. It acts on every smooth V as the averaging projector of SR.0, so e_U V = V^U. For U' ≤ U, e_U * e_{U'} = e_{U'} * e_U = e_U. f is left (right) U-invariant iff e_U * f = f (f * e_U = f). If such U are cofinal, H(G, A) = ⋃_U e_U * H(G, A) * e_U, and e_U H e_U is a unital algebra with unit e_U. Normalised idempotents are defined exactly when the volume is a unit; without this only 1_U (with 1_U * 1_U = μ(U) 1_U) is available.

**Hypotheses.** G locally profinite; μ an A-valued Haar measure; U compact open with μ(U) ∈ Aˣ.

**Construction or proof.**
1. e_U * e_U = μ(U)⁻² (1_U * 1_U) = e_U by convolution-algebra.
2. Action: e_U·v = μ(U)⁻¹ Σ_{u ∈ U/U'} μ(U') ρ(u) v = [U:U']⁻¹ Σ ρ(u) v, the averaging projector.
3. Invariance criterion: e_U * f (x) = μ(U)⁻¹ ∫_U f(u⁻¹x) du.

**Direct prerequisites.** `SmoothRepresentationsOfLocalGroups:SR.1/convolution-algebra`, `SmoothRepresentationsOfLocalGroups:SR.0:abelian-category/averaging-projector`.

**API.**

- `TauCeti.HeckeAlgebra.idempotent` (data): e_U := μ(U)⁻¹ • 1_U for μ(U) a unit.
- `TauCeti.HeckeAlgebra.idempotent_mul_self` (simp): e_U * e_U = e_U.
- `TauCeti.HeckeAlgebra.idempotent_mul_of_le` (relation): e_U * e_{U'} = e_{U'} * e_U = e_U for U' ≤ U.
- `TauCeti.HeckeAlgebra.idempotent_mul_eq_iff` (characterisation): e_U * f = f iff f is left U-invariant; f * e_U = f iff right U-invariant.
- `TauCeti.HeckeAlgebra.idempotent_smul` (compatibility): e_U acts on a smooth V as SR.0's averaging projector; e_U·V = V^U.
- `TauCeti.HeckeAlgebra.isLocallyUnital` (relation): If units-volume subgroups are cofinal, H(G, A) is locally unital with local units e_U.

**Unit tests.**

- `TauCeti.HeckeAlgebra.idempotent_finite` (compatibility): For G = ZMod 2 discrete and A = ℤ[1/2], e_G = (1/2)(δ_0 + δ_1).
- `TauCeti.HeckeAlgebra.idempotent_padic` (computation): In H(ℚ_p, ℤ[1/p]) normalised on ℤ_p, e_{pℤ_p} = p • 1_{pℤ_p}.
- `TauCeti.HeckeAlgebra.idempotent_top` (degenerate): For G compact open in itself and U = G of invertible pro-order, e_G * f = (∫ f) e_G.
- `TauCeti.HeckeAlgebra.no_idempotent_fp` (non-example): In H(ℤ_p, F_p) there is no normalised idempotent supported on ℤ_p (no F_p-valued measure with μ(ℤ_p) a unit).

**Acceptance checks.**

- For G = GL_2(ℚ_p), U = 1 + pM_2(ℤ_p) over ℤ[1/p], e_U exists; for U = GL_2(ℤ_p) it needs in addition the primes dividing (p − 1)(p² − 1) to be units, since [GL_2(ℤ_p) : 1 + pM_2(ℤ_p)] = |GL_2(F_p)| = p(p − 1)(p² − 1).
- For G finite discrete and U = G with |G| ∈ Aˣ, e_G is the central idempotent (1/|G|) Σ g of A[G].
- For G = ℤ_p over F_p no normalised idempotent e_{ℤ_p} exists.

**Uses.** AutomorphicFormsOnReductiveGroups:AF.0: the idempotents e_K = vol(K)⁻¹1_K and H(G//K) = e_K C_c^∞ e_K. GL2AutomorphicRepresentationsAndTransfer:R16.1: 1_I and the normalised e_K kept distinct. Fargues–Scholze 2021, Definition IX.0.2: the transition maps z ↦ z e_K between centres of Hecke corners. SmoothRepresentationsOfLocalGroups:SR.1/hecke-module-equivalence: the local units of the locally unital Hecke algebra. He 2018, §1.2 (H20): cofinal pro-p local units after normalisation in ℤ[1/p].

**Sources.** `BERNSTEIN92`, Ch. I §2.1, p. 11 and proof of Theorem 2(1), p. 12: e_Γ, the normalised Haar measure of a compact open subgroup, is an idempotent; e_K is the unit of H_K = e_K H(G) e_K and H(G) = ⋃ H_K. `BERNSTEIN87`, §1.3, p. 4: The normalised Haar measures e_K are idempotents, cofinal in the idempotents of H(G), so H(G) = lim H_K(G). `FS21`, Definition I.9.2(i), p. 34: Hecke algebras Λ[K\G(E)/K] of pro-p level K, where [K : K'] is a power of p, invertible in Λ.

#### Compact open subgroups form Hecke pairs

**Identifier:** `SmoothRepresentationsOfLocalGroups:SR.1/hecke-triple-compact-open`. **Kind:** theorem. **Proposed name:** `TauCeti.isHeckeTriple_compactOpen`. **Module:** `TauCeti/RepresentationTheory/Smooth/Hecke`.

Let G be locally profinite and U₁, U₂ compact open subgroups. Then U₁ and U₂ are commensurable and every g ∈ G commensurates them, so IsHeckeTriple (⊤ : Submonoid G) U₁ U₂ holds (Mathlib). Consequently every double coset U₁gU₂ is a finite disjoint union of left cosets hU₂ and of right cosets U₁h, with #(U₁gU₂/U₂) = [U₁ : U₁ ∩ gU₂g⁻¹]; for an open submonoid Δ ⊆ G containing U₁ and U₂ the triple (Δ, U₁, U₂) is a Hecke triple as well.

**Hypotheses.** G locally profinite; U₁, U₂ compact open; Δ a submonoid containing U₁ ∪ U₂.

**Construction or proof.**
1. U₁ ∩ U₂ is open in the compact groups U₁ and U₂, hence of finite index in both: commensurable.
2. For g ∈ G, gU₂g⁻¹ is compact open, so commensurable with U₂: every g lies in the commensurator.
3. Count of cosets: U₁gU₂/U₂ ≅ U₁/(U₁ ∩ gU₂g⁻¹) (orbit–stabiliser).

**Direct prerequisites.** `SmoothRepresentationsOfLocalGroups:SR.0:abelian-category/van-dantzig`, `mathlib:IsHeckeTriple`, `mathlib:OpenSubgroup`.

**Acceptance checks.**

- For G = GL_2(ℚ_p), U = GL_2(ℤ_p), g = diag(p, 1): UgU/U has p + 1 elements.
- For U normal in G, UgU = gU is a single coset.
- For U compact open and g ∈ U, UgU = U.

**Sources.** `BERNSTEIN92`, Ch. II §1.1, Lemmas 12–14, p. 28: For K compact open, the elements a(g) = e_K E_g e_K depend only on KgK and form a basis of H_K(G) as g runs over K\G/K. `TV16`, §2.10, pp. 187–188 (published): For K open compact, Fun_G(G/K × G/K) is identified with finitely supported functions on K\G/K.

#### Hecke algebras of permutation modules

**Identifier:** `SmoothRepresentationsOfLocalGroups:SR.1/permutation-hecke-algebra`. **Kind:** construction. **Proposed name:** `TauCeti.HeckeAlgebraLevel`. **Module:** `TauCeti/RepresentationTheory/Smooth/Hecke`.

Let S be a discrete G-set with compact open stabilisers and A a commutative ring. Fun_G(S × S, A) is the A-module of functions h : S × S → A invariant under the diagonal G-action whose support is a finite union of G-orbits, with product (h₁ * h₂)(x, z) = Σ_y h₁(x, y) h₂(y, z) (a finite sum). It acts on the permutation module A[S] on the left by h * s = Σ_t h(t, s) t, and when S has finitely many orbits this identifies Fun_G(S × S, A) with End_G(A[S]). For S = G/U (U compact open) this is the Hecke algebra H(G, U; A) of finitely supported functions on U\G/U, with basis the double cosets [UgU]. It is defined over every A, including F_p for p-adic G: no measure or averaging is used. Through V^U = Hom_G(A[G/U], V), V^U is a right H(G, U; A)-module, explicitly v * h = Σ_{Ug ∈ U\G} h(U, gU) ρ(g)⁻¹ v (the summand depends only on Ug, and only finitely many are nonzero). For U' ≤ U the inclusion V^U ⊆ V^{U'} and the trace tr_{U/U'}(v) = Σ_{u ∈ U/U'} ρ(u) v are induced by the G-maps A[G/U'] → A[G/U], gU' ↦ gU, and A[G/U] → A[G/U'], gU ↦ Σ_{u ∈ U/U'} guU'; tr ∘ incl = [U : U'], and for U' normal in U, incl ∘ tr = Σ_{u ∈ U/U'} ρ(u). The anti-involution [UgU] ↦ [Ug⁻¹U] identifies H(G, U; A) with its opposite.

**Hypotheses.** G locally profinite; A commutative; S a discrete G-set with compact open stabilisers; U' ≤ U compact open.

**Construction or proof.**
1. Finiteness of the sum: for fixed x, the y with h₁(x, y) ≠ 0 lie in finitely many orbits of the compact open stabiliser of x on S, each finite.
2. End_G(A[S]) ≅ Fun_G(S × S, A): an endomorphism is determined by its matrix coefficients, which are G-invariant; finiteness of orbits ensures the support condition.
3. S = G/U: G-orbits on G/U × G/U are the double cosets U\G/U via (U, gU) (Treumann–Venkatesh §2.10).
4. Right module structure on V^U via composition in Hom_G(A[G/U], V), with the explicit formula of Treumann–Venkatesh (2.10.2) summed over U\G rather than G/U (the printed sum over G/U is not well defined).
5. Level change: compose with the two G-maps between permutation modules; the composite A[G/U] → A[G/U'] → A[G/U] is multiplication by [U : U'].

**Direct prerequisites.** `SmoothRepresentationsOfLocalGroups:SR.1/hecke-triple-compact-open`, `SmoothRepresentationsOfLocalGroups:SR.0:abelian-category/compact-open-invariants`, `mathlib:Representation.ofMulAction`, `ReductiveGroupsPartII:RG2.4` (GL₂ unit tests).

**API.**

- `TauCeti.FunG` (data): Fun_G(S × S, A) with the matrix product.
- `TauCeti.FunG.actPermutation` (data): The left action on A[S], h * s = Σ_t h(t, s) t.
- `TauCeti.FunG.equivEnd` (equivalence): For S with finitely many G-orbits, Fun_G(S × S, A) ≃ End_G(A[S]) as A-algebras.
- `TauCeti.HeckeAlgebraLevel` (data): H(G,U;A) uses the existing HeckeRing multiplication; its kernel model is Fun_G(G/U × G/U,A), with [UgU] represented by h(U,gU) = 1. The comparison identifies H with End_G(A[G/U]) using inverse representatives on the permutation basis.
- `TauCeti.HeckeAlgebraLevel.doubleCoset` (constructor): The basis element [UgU].
- `TauCeti.HeckeAlgebraLevel.basis` (characterisation): {[UgU]} over U\G/U is an A-basis.
- `TauCeti.SmoothRep.invariantsHeckeModule` (data): The right H(G, U; A)-module structure on V^U, v * h = Σ_{Ug ∈ U\G} h(U, gU) ρ(g)⁻¹ v.
- `TauCeti.SmoothRep.invariantsHeckeModule_natural` (functoriality): G-maps V → W induce H(G, U; A)-linear maps V^U → W^U.
- `TauCeti.SmoothRep.traceLevel` (data): tr_{U/U'} : V^{U'} → V^U, v ↦ Σ_{u ∈ U/U'} ρ(u) v, with tr ∘ incl = [U : U'] and transitivity for U'' ≤ U' ≤ U.
- `TauCeti.HeckeAlgebraLevel.opposite` (other): The anti-involution [UgU] ↦ [Ug⁻¹U], an isomorphism H(G, U; A) ≃ H(G, U; A)ᵐᵒᵖ.
- `TauCeti.HeckeAlgebraLevel.baseChange` (functoriality): H(G,U;A) ⊗_A B ≃ H(G,U;B), with multiplication carried to multiplication; on pure tensors b ⊗ h the coefficients are mapped to B and multiplied by b.

**Unit tests.**

- `TauCeti.HeckeAlgebraLevel.gl2_tp_card` (computation): For G = GL_2(ℚ_p), U = GL_2(ℤ_p), [U diag(p,1) U] is the sum of p + 1 left cosets.
- `TauCeti.HeckeAlgebraLevel.normal_eq_groupAlgebra` (degenerate): For U normal in G, H(G, U; A) ≃ MonoidAlgebra A (G ⧸ U).
- `TauCeti.SmoothRep.traceLevel_comp_incl` (characterisation): tr_{U/U'} ∘ incl = [U : U'] • id on V^U.
- `TauCeti.HeckeAlgebraLevel.fp_defined` (non-example): For G = ℚ_p and U = ℤ_p, H(G, U; F_p) ≅ F_p[ℚ_p/ℤ_p] is defined although there is no F_p-valued Haar measure normalised on ℤ_p, so no convolution model over F_p exists.

**Acceptance checks.**

- For G = GL_2(ℚ_p), U = GL_2(ℤ_p): T_p = [U diag(p,1) U] acts on V^U by v ↦ Σ over the p + 1 cosets, over any ring, including F_p.
- For U normal in G, H(G, U; A) ≅ A[G/U] (group algebra).
- tr_{U/U'} ∘ incl = [U : U'] on V^U; for U = ℤ_p, U' = pℤ_p over F_p this is 0, so V^U is not a direct summand of V^{U'} through these maps.

**Uses.** Treumann–Venkatesh 2016, §2.10: Fun_G(S × S) and the right H(G, K)-modules V^K and k[X/K], with characteristic p coefficients. ModularForms (Tau Ceti) Layer 2: the classical double-coset ring acting on forms; spherical Hecke algebras of GL_n are instances. HeckeStacksAndLocalShtukas:HS3: Hecke algebra of level K as End of compact induction, restriction and corestriction between levels. IgusaVarietiesAndTorsionConcentration:IG.5: the opposite anti-involution [KgK] ↦ [Kg⁻¹K]. ArithmeticLocallySymmetricSpaces:ALS.3: the Hecke action on invariants of smooth representations. Calegari–Geraghty 2018, §9.2.1 (arXiv v2), p. 92: the double-coset operator V = V_{ϖ_x} on invariants over O/ϖ^k. SmoothRepresentationsOfLocalGroups:SR.0:derived-extension/derived-hecke-algebra: the degree-zero part of the derived Hecke algebra.

**Sources.** `TV16`, §2.10, (2.10.1)–(2.10.3), pp. 187–188 (published; arXiv v1 §2.10): Defines Fun_G(S × S) for a discrete G-set with compact stabilisers, its product and an action on k[S] (a left action only in the form h * s = Σ_t h(t, s) t), its identification with End_G(k[S]) for finitely many orbits, H(G, K) for S = G/K, the anti-involution KgK ↔ Kg⁻¹K, and the right action on V^K. `BERNSTEIN92`, Ch. II §1.1, Lemmas 12–14, p. 28: The double-coset elements a(g) form a basis of H_K(G). `VENKATESH19`, §4.1–4.3, equations (47)–(48), pp. 36–37: H_I = End_{SG}(S[G/I]) is anti-isomorphic to functions on I\G/I, and the bimodules H_IK, H_KI are functions on double cosets.

**Atlas planet:** Hecke algebras of compact open level.

#### Comparison with the double-coset Hecke ring

**Identifier:** `SmoothRepresentationsOfLocalGroups:SR.1/hecke-ring-comparison`. **Kind:** comparison. **Proposed name:** `TauCeti.HeckeAlgebraLevel.equivHeckeRing`. **Module:** `TauCeti/RepresentationTheory/Smooth/Hecke`.

For a compact open subgroup U of a locally profinite G, the Hecke algebra H(G, U; A) of permutation-hecke-algebra is isomorphic, as an A-algebra, to the double-coset Hecke ring 𝕋 (⊤) U A of Mathlib/Tau Ceti (HeckeRing with Shimura's product HeckeCosetModule.mul), via [UgU] ↦ the double coset of g; the structure constants agree with Shimura's multiplicities m(D₁, D₂; D). If μ is an A-valued Haar measure with μ(U) = 1, then U-bi-invariant functions in H(G, A) form the subalgebra e_U * H(G, A) * e_U = 1_U * H(G, A) * 1_U, and 1_{UgU} ↦ [UgU] is an algebra isomorphism onto H(G, U; A); the convolution 1_{UgU} * 1_{UhU} = Σ_D m(UgU, UhU; D) 1_D is a finite integral sum. The comparison is compatible with base change and with the action on invariants, and no second double-coset multiplication is introduced.

**Hypotheses.** G locally profinite; U compact open; A commutative; μ(U) = 1 for the convolution statement (U of invertible pro-order for e_U).

**Construction or proof.**
1. Both products are computed by counting: (1_{UgU} * 1_{UhU})(x) = μ-mass of {y ∈ UgU : y⁻¹x ∈ UhU} = #{left U-cosets yU ⊆ UgU with x ∈ yUhU}, which is Shimura's multiplicity (HeckeCosetModule.single_mul_single).
2. Fun_G(G/U × G/U) product (2.10.1) sums over intermediate cosets yU, the same count.
3. Associativity on either side transports (HeckeCosetModule.mul_assoc); the ring instance is HeckeCosetModule.instRingHeckeRing.
4. Base change: the structure constants are integers.

**Direct prerequisites.** `SmoothRepresentationsOfLocalGroups:SR.1/permutation-hecke-algebra`, `SmoothRepresentationsOfLocalGroups:SR.1/convolution-algebra`, `SmoothRepresentationsOfLocalGroups:SR.1/hecke-idempotent`, `mathlib:HeckeRing`, `mathlib:HeckeCosetModule`, `tauceti:HeckeCosetModule.mul`, `tauceti:HeckeCosetModule.single_mul_single`, `tauceti:HeckeCosetModule.mul_assoc`, `tauceti:HeckeCosetModule.instRingHeckeRing`, `tauceti:HeckeCosetModule.structureConstants`, `tauceti:TauCetiRoadmap/ModularForms#layer-2-hecke-operators-and-the-hecke-algebra`.

**Acceptance checks.**

- For G = GL_2(ℚ_p), U = GL_2(ℤ_p): [U diag(p,1) U]² = [U diag(p²,1) U] + (p+1)[U diag(p,p) U] in both models.
- For U normal, both are the group algebra A[G/U].
- Over F_p the double-coset ring exists while e_U need not.
- If μ(K) = 0 in R (μ normalised on the pro-p Iwahori I′ and K = I with the order of the finite torus divisible by char R), the convolution product on K-bi-invariant functions is identically zero, while the double-coset ring H(G, K; R) is not: the comparison must use the normalisation μ(K) = 1.

**Uses.** ArithmeticLocallySymmetricSpaces:ALS.3: identification of the ℤ-valued Hecke algebra of compactly supported U-biinvariant functions (vol(U) = 1) with the double-coset Hecke ring, compatibly with base change. He 2018, §1.2 (H6): compact-level comparison with the existing Hecke ring and its Haar scalar. ModularForms (Tau Ceti) Layer 2(a′): the GL_n(ℚ_p) double-coset algebra on which Satake theory begins.

**Sources.** `HE18`, §1.2, p. 7, formula (a); §4.1, p. 15: The level-K Hecke algebra H(G, K) of K-bi-invariant functions is free on the indicators 1_{KgK}, and products of such indicators are μ(K) times integral combinations of indicators; H(G, K) ⊗ R is unital exactly when μ(K) is a unit. `BERNSTEIN92`, Ch. II §1.1, Lemmas 12–14, p. 28: Multiplication of the basis a(g) of H_K(G) is governed by products of double cosets. `ACC23`, §2.1.9, pp. 913–914: Hecke algebras H(Δ, U) over ℤ of an open submonoid with basis the double cosets [UmU].

#### Idempotented algebras and nondegenerate modules

**Identifier:** `SmoothRepresentationsOfLocalGroups:SR.1/locally-unital-algebra`. **Kind:** definition. **Proposed name:** `TauCeti.NondegMod`. **Module:** `TauCeti/RepresentationTheory/Smooth/Hecke`.

An A-algebra H (not necessarily unital) is idempotented (locally unital) if every finite subset {x_i} admits an idempotent e with e x_i = x_i = x_i e; then H = ⋃_e eHe. A left H-module M is nondegenerate if HM = M, equivalently M = ⋃_e eM. A-linear H-modules are represented by modules over the A-unitization A ⊕ H, whose adjoined unit acts as the identity; H acts through the ideal summand. The nondegenerate modules form a full abelian subcategory NondegMod H of these modules, closed under subquotients, direct sums and filtered colimits, with projective generators He (Hom_H(He, M) = eM), products given by nondegenerate parts of products, and a centre identified with the bimodule endomorphisms of H.

**Hypotheses.** A commutative; H an idempotented A-algebra.

**Construction or proof.**
1. Abelian: kernels and cokernels of maps of nondegenerate modules are nondegenerate (eM ⊆ M).
2. Projective generators: Hom_H(He, M) = eM is exact in M; every m lies in some eM.
3. Centre: an endomorphism of the identity is determined by its value on the generators He, giving a bimodule endomorphism of H (Bernstein 1987 §1.8).

**Direct prerequisites.** `mathlib:CategoryTheory.CatCenter`; `mathlib:Unitization`.

**API.**

- `TauCeti.IsIdempotented` (data): Every finite subset is fixed on both sides by an idempotent.
- `TauCeti.NondegMod` (data): The full subcategory of ModuleCat(Unitization A H) on modules with HM = M; the A-linear H-action is the restriction along h ↦ (0,h).
- `TauCeti.NondegMod.instAbelian` (instance): NondegMod H is abelian with exact filtered colimits.
- `TauCeti.NondegMod.homProjEquiv` (characterisation): Hom_H(He, M) ≃ eM; He is a finitely generated projective object.
- `TauCeti.NondegMod.nondegPart` (functoriality): The right adjoint M ↦ HM to the inclusion into all H-modules; products are nondegenerate parts of products.
- `TauCeti.NondegMod.centreEquiv` (characterisation): CatCenter (NondegMod H) ≃ the H-bimodule endomorphisms of H; for unital H, the centre of H.
- `TauCeti.NondegMod.equivOfUnital` (compatibility): For unital H, NondegMod H ≌ ModuleCat H.

**Unit tests.**

- `TauCeti.NondegMod.unital_equiv` (degenerate): For H = A (unital), NondegMod H ≌ ModuleCat A.
- `TauCeti.IsIdempotented.directSum` (computation): ⊕_{n ∈ ℕ} A with componentwise product is idempotented, and ∏_n A is not a nondegenerate module.
- `TauCeti.IsIdempotented.not_zeroMul` (non-example): A with the zero multiplication is not idempotented (for A ≠ 0).
- `TauCeti.NondegMod.centre_unital` (compatibility): For H = Matrix (Fin 2) (Fin 2) A the centre of NondegMod H is A (Subring.center).

**Acceptance checks.**

- A unital algebra is idempotented; its nondegenerate modules are its unital modules.
- H = ⊕_{n ∈ ℕ} A with componentwise product is idempotented, with nondegenerate modules = ⊕-decomposed families; the module ∏_n A is degenerate.
- H = A with zero multiplication is not idempotented.

**Uses.** Bernstein 1987, §§1.1–1.8: idempotented rings, nondegenerate modules, projective generators He, Jordan–Hölder content, splittings and the central algebra. Bernstein 1992, Ch. I §1.2, Definition 4: idempotented algebras and the category M(H). SmoothRepresentationsOfLocalGroups:SR.1/hecke-module-equivalence: smooth representations as nondegenerate modules over the Hecke algebra. SmoothRepresentationsOfLocalGroups:SR.3/bernstein-decomposition: decompositions of M(H) correspond to decompositions of H into two-sided ideals.

**Sources.** `BERNSTEIN87`, §1.1–1.2 and §1.8, pp. 3–4 and 8: Idempotented rings, nondegenerate modules, their abelian category with products and enough projectives and injectives, and the central algebra as bimodule endomorphisms of H. `BERNSTEIN92`, Ch. I §1.2, Definition 4, p. 9; §2.2, Theorem 3, p. 13: Idempotented algebras and nondegenerate modules; M(H) has enough projectives He.

#### Smooth representations as nondegenerate Hecke modules

**Identifier:** `SmoothRepresentationsOfLocalGroups:SR.1/hecke-module-equivalence`. **Kind:** theorem. **Proposed name:** `TauCeti.SmoothRep.equivNondegMod`. **Module:** `TauCeti/RepresentationTheory/Smooth/Hecke`.

Let G be locally profinite and A a commutative ring such that G has a cofinal family of compact open subgroups of pro-order invertible in A, and fix an A-valued Haar measure normalised on one of them. Then H(G, A) is idempotented with local units e_U, and V ↦ (V, f·v = ∫ f(g) ρ(g) v dμ) is an equivalence of categories SmoothRep A G ≌ NondegMod H(G, A), with V^U = e_U·V. The inverse sends M to M with g·m = (δ_g * e_U)·m for m ∈ e_U M, where δ_g * e_U = μ(U)⁻¹ 1_{gU}. The equivalence is A-linear, compatible with base change, and preserves the centre. It does not extend to coefficient rings in which the pro-orders are not invertible (e.g. F_p-representations of a p-adic group): there SmoothRep is used directly, with the integral operators of permutation-hecke-algebra.

**Hypotheses.** G locally profinite; HasCofinalUnitProOrder A G; μ normalised on a member of the family.

**Construction or proof.**
1. H(G, A) is idempotented: every f is bi-invariant under some U of the family (locally-constant-compact-support), so e_U f = f = f e_U.
2. Nondegeneracy: v fixed by U satisfies e_U v = v.
3. The G-action on a nondegenerate module is well defined by Bernstein's Lemma 4 (operators commuting with the right H-action extend to nondegenerate modules).
4. Fully faithful and essentially surjective by the two constructions being mutually inverse.

**Direct prerequisites.** `SmoothRepresentationsOfLocalGroups:SR.1/convolution-algebra`, `SmoothRepresentationsOfLocalGroups:SR.1/hecke-idempotent`, `SmoothRepresentationsOfLocalGroups:SR.1/locally-unital-algebra`, `SmoothRepresentationsOfLocalGroups:SR.0:abelian-category/smooth-rep-category`, `SmoothRepresentationsOfLocalGroups:SR.0:abelian-category/unit-pro-order`.

**Acceptance checks.**

- For G finite discrete with |G| ∈ Aˣ this is Rep A G ≌ Mod A[G].
- For G = ℚ_p over ℂ, the trivial representation corresponds to H(ℚ_p, ℂ) acting through f ↦ ∫ f.
- For G = ℤ_p over F_p the hypothesis fails and there is no F_p-valued Haar measure normalised on ℤ_p, so the statement does not apply.

**Sources.** `BERNSTEIN92`, Ch. I §2.1, Theorem 2 and Lemma 4, pp. 12–13: H(G) is idempotented, smooth G-modules are nondegenerate H(G)-modules, and this is an equivalence of categories (complex coefficients). `BERNSTEIN87`, §1.3, p. 4: M(H(G)) is identified with the category of smooth G-modules. `BZ76`, Ch. I §2, 2.6–2.8, p. 16: Algebraic representations of G correspond to nondegenerate H(G)-modules.

**Atlas planet:** Smooth representations as Hecke modules.

#### Hecke corners and irreducible representations

**Identifier:** `SmoothRepresentationsOfLocalGroups:SR.1/corner-irreducibles`. **Kind:** theorem. **Proposed name:** `TauCeti.SmoothRep.invariants_simple_iff`. **Module:** `TauCeti/RepresentationTheory/Smooth/Hecke`.

Let U be a compact open subgroup with μ(U) ∈ Aˣ. The functor V ↦ V^U = e_U V from SmoothRep A G to right (or, through the anti-involution, left) H(G, U; A)-modules is exact and has a left adjoint M ↦ H(G, A)e_U ⊗_{e_U H e_U} M = c-Ind_U^G A ⊗_{H(G,U)} M; the counit identifies e_U of the adjoint with M. Over a field A = k: V irreducible implies V^U is 0 or a simple H(G, U; k)-module; every simple H(G, U; k)-module arises from a unique (up to isomorphism) irreducible smooth V with V^U ≠ 0; and two irreducibles with nonzero U-invariants are isomorphic iff their U-invariants are isomorphic H(G, U; k)-modules. If U splits the category (the subcategory generated by U-invariants is a direct factor), V ↦ V^U is an equivalence between that factor and H(G, U; k)-modules.

**Hypotheses.** G locally profinite; U compact open with μ(U) a unit (A a field for the irreducibility statements).

**Construction or proof.**
1. Exactness: averaging (invariants-exact).
2. Adjunction: Hom_G(He_U ⊗ M, V) = Hom_{e_U H e_U}(M, e_U V).
3. Irreducibility and the bijection: Bernstein 1992 Ch. I Lemma 7 — for w₁, w₂ ∈ V^U pick h with h w₁ = w₂, then e_U h e_U w₁ = w₂; a simple M gives the irreducible quotient of H ⊗ M with U-invariants M.
4. Splitting: when U splits M(G), the subcategory generated by U-invariants is equivalent to modules over e_U H e_U (Bernstein 1987 §1.7–1.8 and §3.1).

**Direct prerequisites.** `SmoothRepresentationsOfLocalGroups:SR.1/hecke-module-equivalence`, `SmoothRepresentationsOfLocalGroups:SR.1/permutation-hecke-algebra`, `SmoothRepresentationsOfLocalGroups:SR.0:abelian-category/invariants-exact`; `mathlib:CategoryTheory.Simple`.

**Acceptance checks.**

- For G = GL_2(ℚ_p), U = GL_2(ℤ_p), irreducible spherical representations correspond to characters of the commutative H(G, U; ℂ).
- For G compact and U open normal, irreducible V with V^U ≠ 0 correspond to irreducible representations of G/U, and H(G, U) = ℂ[G/U].
- The maximal compact GL_2(ℤ_p) does not split M(GL_2(ℚ_p)): the trivial and Steinberg representations lie in the same Bernstein component but only the trivial one has spherical vectors.

**Sources.** `BERNSTEIN92`, Ch. I §4.2, Lemma 7, p. 19: W is irreducible iff each W^K is zero or an irreducible H_K-module; every irreducible H_K-module arises from a unique irreducible W. `BERNSTEIN87`, §1.7–1.8, pp. 7–8; §3.1, p. 15; §3.2 Examples, p. 17: For an idempotent e splitting the category, E ↦ eE is an equivalence onto modules over eHe; congruence and Iwahori subgroups split M(G), the maximal compact subgroup does not.

#### The Λ-linear Bernstein centre via Hecke corners

**Identifier:** `SmoothRepresentationsOfLocalGroups:SR.1/bernstein-centre-corners`. **Kind:** theorem. **Proposed name:** `TauCeti.SmoothCentre.equivLimCornerCentre`. **Module:** `TauCeti/RepresentationTheory/Smooth/Hecke`.

Let G be locally profinite with a cofinal family 𝒦 of compact open subgroups of pro-order invertible in the commutative ring Λ (for G locally pro-p: the open pro-p subgroups, with p ∈ Λˣ). Restricting z ∈ Z(G, Λ) = CatCenter(SmoothRep Λ G) (SR.0 smooth-centre) to the generators Λ[G/K] gives Z(G, Λ) ≅ lim_{K ∈ 𝒦} Z(H(G, K; Λ)), the transition map for K' ≤ K being z ↦ e_K z (Z(H(G,K'; Λ)) → Z(H(G,K; Λ))). The isomorphism is compatible with coefficient change: for Λ → Λ' there is a natural ring map Z(G, Λ) → Z(G, Λ') induced by Z(H(G,K;Λ)) ⊗ Λ' → Z(H(G,K;Λ')). For G abelian, Z(G, Λ) ≅ lim_K Λ[G/K]. Fargues–Scholze Definition I.9.2 identifies the same corner limit with π₀End(id) of the enhanced Λ-linear derived category. The present generator argument proves the ordinary centre formula. The enhanced comparison is a separate gap, and is not asserted for the unenhanced triangulated CatCenter(D(G,Λ)).

**Hypotheses.** G locally profinite; Λ commutative with HasCofinalUnitProOrder Λ G.

**Construction or proof.**
1. End_G(Λ[G/K]) ≅ H(G,K;Λ) in the SR.1 matrix convention. Each Λ[G/K] is projective because K has invertible pro-order, and the family over the cofinal basis generates SmoothRep. One individual K need not split the category.
2. An element of the centre gives, on each Λ[G/K], an endomorphism commuting with all endomorphisms, i.e. an element of Z(H(G, K; Λ)); compatibility with the maps Λ[G/K'] ⇄ Λ[G/K] gives the transition maps z ↦ e_K z.
3. Conversely a compatible family acts on every smooth V = ⋃_K e_K V via the corners, naturally (Bernstein 1987 §1.8: the centre of M(H) is the bimodule endomorphisms of H, and H = ⋃ e_K H e_K).
4. Abelian case: H(G, K; Λ) = Λ[G/K] is commutative.

**Direct prerequisites.** `SmoothRepresentationsOfLocalGroups:SR.0:abelian-category/smooth-centre`, `SmoothRepresentationsOfLocalGroups:SR.1/permutation-hecke-algebra`, `SmoothRepresentationsOfLocalGroups:SR.1/hecke-idempotent`, `SmoothRepresentationsOfLocalGroups:SR.1/hecke-module-equivalence`, `SmoothRepresentationsOfLocalGroups:SR.1/locally-unital-algebra`.

**API.**

- `TauCeti.SmoothCentre.equivLimCornerCentre` (equivalence): SmoothCentre Λ G ≃+* lim_{K ∈ 𝒦} Subring.center (HeckeAlgebraLevel G K Λ).
- `TauCeti.SmoothCentre.cornerCentreTransition` (data): For K' ≤ K in 𝒦, z ↦ e_K z : Z(H(G,K';Λ)) → Z(H(G,K;Λ)).
- `TauCeti.SmoothCentre.coeffChange` (functoriality): The ring map Z(G, Λ) → Z(G, Λ') for Λ → Λ', compatible with the actions on base-changed representations.
- `TauCeti.SmoothCentre.equivLimGroupRing` (characterisation): For G abelian, Z(G, Λ) ≃ lim_K Λ[G/K].
- `TauCeti.SmoothCentre.app_permutation` (simp): The action of z on Λ[G/K] is right multiplication by its K-component.

**Acceptance checks.**

- For G = ℤ_p and Λ = F_ℓ (ℓ ≠ p), Z = lim_n F_ℓ[ℤ/p^n].
- For G finite discrete with |G| ∈ Λˣ, 𝒦 can be {1} and Z(G, Λ) = Z(Λ[G]).
- For G = T(E) a split torus, Z(T(E), Λ) = lim_K Λ[T(E)/K] (Fargues–Scholze §IX.6.4).

**Uses.** Fargues–Scholze 2021, Definition I.9.2(i) and Definition IX.0.2(i): the Bernstein centre Z(G(E), Λ) = π₀End(id) = lim_K Z(Λ[K\G(E)/K]) over open pro-p K. ExcursionOperatorsAndSpectralAction:ES0:classical-center: the abelian Λ-linear centre to which the enhanced degree-zero centre is compared. ExcursionOperatorsAndSpectralAction:ES7:parabolic: target of Ψ_G and Ψ_G^b, with coefficient reduction. ExcursionOperatorsAndSpectralAction:ES6:functoriality: the torus case Z(T(E), Λ) = lim_K Λ[T(E)/K]. Ding 2025, §3.1.2, proof of Proposition 3.3(2), p. 36; §3.2.2, p. 57: the Bernstein centre of a principal-series component, its completion at π_sm(φ) and the maps J_w with their tangent maps.

**Sources.** `FS21`, Definition I.9.2(i), p. 34; Definition IX.0.2(i), p. 318; §IX.6.4, p. 333: Defines the Bernstein centre of G(E) over Λ as π₀End of the identity of D(G(E), Λ) and equates it, without proof, with the inverse limit of the centres of the Hecke algebras of open pro-p level; in the torus case it is lim_K Λ[T(E)/K]. `BERNSTEIN87`, §1.8, p. 8: For an idempotented ring the centre of the module category is the ring of bimodule endomorphisms of H; with a finitely generated projective generator P it is the centre of End(P).

**Atlas planet:** Λ-linear Bernstein centre.

#### ℓ-adic separatedness of the Bernstein centre

**Identifier:** `SmoothRepresentationsOfLocalGroups:SR.1/l-adic-separatedness`. **Kind:** theorem. **Proposed name:** `TauCeti.SmoothCentre.ladic_separated`. **Module:** `TauCeti/RepresentationTheory/Smooth/Hecke`.

Let Λ be a noetherian ℓ-adically separated domain in which the pro-orders of a cofinal family 𝒦 of compact open subgroups are invertible (for example Λ = ℤ_ℓ[√q] with ℓ ≠ p and 𝒦 the pro-p subgroups of a p-adic group). Then each Hecke algebra H(G, K; Λ) and its centre are ℓ-adically separated, and so is Z(G, Λ) ≅ lim_K Z(H(G, K; Λ)): ⋂_n ℓ^n Z(G, Λ) = 0. In particular two elements of Z(G, Λ) agreeing modulo ℓ^n for every n are equal.

**Hypotheses.** Λ = ℤ_ℓ[√q] (or any noetherian ℓ-adically separated domain); ℓ ≠ p; 𝒦 the open pro-p subgroups of a locally pro-p group G.

**Construction or proof.**
1. H(G, K; Λ) is free over Λ on the double cosets K\G/K (permutation-hecke-algebra), hence ℓ-adically separated because Λ is.
2. Submodules of separated modules are separated: Z(H(G,K;Λ)) is separated.
3. An element of ℓ^n · lim_K Z_K has each component in ℓ^n Z_K; so ⋂_n ℓ^n lim_K Z_K ⊆ lim_K ⋂_n ℓ^n Z_K = 0.

**Direct prerequisites.** `SmoothRepresentationsOfLocalGroups:SR.1/bernstein-centre-corners`, `SmoothRepresentationsOfLocalGroups:SR.1/permutation-hecke-algebra`.

**Acceptance checks.**

- For G = ℤ_p and Λ = ℤ_ℓ, Z = lim_n ℤ_ℓ[ℤ/p^n] is ℓ-adically separated.
- Over Λ = ℚ_ℓ the statement is vacuous (ℓ is a unit).
- For the noetherian ring Λ = ℤ_ℓ × ℚ_ℓ, ⋂_n ℓ^n Λ = 0 × ℚ_ℓ ≠ 0, so separatedness of Λ is needed: Z(G, Λ) ⊇ Λ is not separated.

**Sources.** `FS21`, proof of Theorem IX.7.2, p. 335; proof of Corollary IX.7.3, p. 337: Reduces statements about the Bernstein centre over ℤ_ℓ[√q] to ℓ-power torsion coefficients using that lim_K Z(Λ[K\G_b(E)/K]) is ℓ-adically separated for Λ = ℤ_ℓ[√q]; the separatedness is used without proof.

#### Iwahori decompositions and positive elements

**Identifier:** `SmoothRepresentationsOfLocalGroups:SR.1/iwahori-decomposition`. **Kind:** definition. **Proposed name:** `TauCeti.HasIwahoriDecomposition`. **Module:** `TauCeti/RepresentationTheory/Smooth/Hecke`.

Let P = M ⋉ N and P̄ = M ⋉ N̄ be closed subgroups of a locally profinite G with P ∩ N̄ = 1 and N̄MN open in G (a parabolic pair, as for opposite parabolic subgroups of a reductive group, supplied by Tau Ceti ReductiveGroups Layer 7 and ReductiveGroupsPartII RG2.3). A compact open subgroup U has an Iwahori decomposition with respect to (P, P̄) if multiplication U_{N̄} × U_M × U_N → U is bijective, where U_X = U ∩ X. An element m ∈ M is U-positive if m U_N m⁻¹ ⊆ U_N and m⁻¹ U_{N̄} m ⊆ U_{N̄}; the U-positive elements form a monoid Δ_M⁺ containing U_M, and Δ⁺ := U_N Δ_M⁺ U_{N̄}. A central z ∈ Z(M) ∩ Δ_M⁺ is strongly positive if for all compact open H₁, H₂ ⊆ N there is n ≥ 0 with z^n H₁ z^{−n} ⊆ H₂, and for all compact open K₁, K₂ ⊆ N̄ there is n ≥ 0 with z^{−n} K₁ z^n ⊆ K₂ (so ⋃_n z^{−n} U_N z^n = N and ⋃_n z^n U_{N̄} z^{−n} = N̄).

**Hypotheses.** G locally profinite; P = MN, P̄ = MN̄ closed subgroups forming a parabolic pair; U compact open.

**Construction or proof.**
1. Δ_M⁺ is closed under products: (mm')U_N(mm')⁻¹ ⊆ m U_N m⁻¹ ⊆ U_N and similarly for N̄.
2. Existence of arbitrarily small U with Iwahori decompositions with respect to every standard parabolic, and of strongly positive central elements, for reductive G: Bruhat's theorem (ReductiveGroupsPartII RG2.3), Bernstein 1987 §5.1–5.2.

**Direct prerequisites.** `SmoothRepresentationsOfLocalGroups:SR.0:abelian-category/van-dantzig`, `tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory`, `ReductiveGroupsPartII:RG2.3`.

**API.**

- `TauCeti.HasIwahoriDecomposition` (data): U = U_{N̄} U_M U_N with bijective multiplication, for a parabolic pair (P, P̄).
- `TauCeti.positiveMonoid` (data): Δ_M⁺ := {m ∈ M | m U_N m⁻¹ ⊆ U_N, m⁻¹ U_{N̄} m ⊆ U_{N̄}} as a Submonoid M.
- `TauCeti.IsStronglyPositive` (data): Central z ∈ Δ_M⁺ contracting N under conjugation by z and N̄ under z⁻¹, in the sense of the statement.
- `TauCeti.HasIwahoriDecomposition.mul_mem_iff` (characterisation): Every u ∈ U is uniquely ū m n with ū ∈ U_{N̄}, m ∈ U_M, n ∈ U_N, and also uniquely n m ū.
- `TauCeti.positiveMonoid.mul_mem` (relation): Δ_M⁺ is a submonoid containing U_M.
- `TauCeti.IsStronglyPositive.iUnion_conj` (characterisation): ⋃_n z^{−n} U_N z^n = N and ⋃_n z^n U_{N̄} z^{−n} = N̄.
- `TauCeti.HasIwahoriDecomposition.conj` (functoriality): Conjugation by g ∈ G transports Iwahori decompositions with respect to (P, P̄) to (gPg⁻¹, gP̄g⁻¹).

**Unit tests.**

- `TauCeti.HasIwahoriDecomposition.gl2_iwahori` (computation): The Iwahori subgroup of GL_2(ℚ_p) has an Iwahori decomposition with respect to the upper and lower Borels.
- `TauCeti.not_hasIwahoriDecomposition_gl2_maximal` (non-example): GL_2(ℤ_p) has no Iwahori decomposition with respect to (B, B̄).
- `TauCeti.IsStronglyPositive.gl2_diag` (computation): diag(p, 1) is strongly positive for (B, B̄) and the Iwahori subgroup.
- `TauCeti.HasIwahoriDecomposition.trivial_parabolic` (degenerate): With P = G, every compact open U has an Iwahori decomposition and positiveMonoid = ⊤.

**Acceptance checks.**

- G = GL_2(ℚ_p), B upper triangular, I the Iwahori subgroup (upper triangular mod p): I = (I ∩ N̄)(I ∩ T)(I ∩ N), and z = diag(p, 1) is strongly positive (z n(x) z⁻¹ = n(px)).
- For U = GL_2(ℤ_p) and B, U has no Iwahori decomposition: the element (0 1; 1 0) ∈ U does not lie in N̄(ℤ_p)T(ℤ_p)N(ℤ_p).
- For P = G (N = N̄ = 1) every U has a trivial Iwahori decomposition and Δ_M⁺ = G.

**Uses.** Allen et al. 2023, §2.1.9: U-positive elements Δ_M, Δ = U_N Δ_M U_{N̄}, strongly positive elements; the map t of Lemma 2.1.12. Bernstein 1987, §5.1–5.2: subgroups in good position with respect to (P, P̄), dominant and strictly dominant elements. Bernstein 1992, Ch. II Propositions 14, 15, 18: Iwahori factorisation of congruence subgroups of GL(n) and contraction by dominant elements. Boxer–Pilloni 2026, §1.3.4 and §3.1: K_p with an Iwahori decomposition relative to B and the monoid T⁺(ℚ_p). SmoothRepresentationsOfLocalGroups:SR.2/jacquet-invariants: Jacquet's lemma for invariants under U with an Iwahori decomposition. SmoothRepresentationsOfLocalGroups:SR.2a/stabilization: the stabilisation theorem for strongly positive elements.

**Sources.** `ACC23`, §2.1.9, pp. 913–914: Defines U-positive elements and strongly positive elements for U with an Iwahori decomposition relative to P = MN. `BERNSTEIN87`, §5.1–5.2, pp. 19–20: Subgroups in good position K = K₋K₀K₊ with respect to a parabolic pair, dominant and strictly dominant elements, and the existence of arbitrarily small such K. `BERNSTEIN92`, Ch. II §1.1, Propositions 14–15, p. 30; §1.2, Proposition 18, p. 32: For GL(n), congruence subgroups factor as K₊K_{M₀}K₋ and dominant diagonal elements contract K₊ and expand K₋.

#### The positive Hecke monoid homomorphism

**Identifier:** `SmoothRepresentationsOfLocalGroups:SR.1/positive-hecke-homomorphism`. **Kind:** theorem. **Proposed name:** `TauCeti.positiveHeckeHom`. **Module:** `TauCeti/RepresentationTheory/Smooth/Hecke`.

Let U have an Iwahori decomposition with respect to (P, P̄) and let H(Δ_M⁺, U_M) ⊆ H(M, U_M) and H(Δ⁺, U) ⊆ H(G, U) be the ℤ-spans of the double cosets [U_M m U_M] (m ∈ Δ_M⁺) and [U δ U] (δ ∈ Δ⁺). Then: (1) for m, m' ∈ Δ_M⁺, U m U m' U = U m U_M m' U; if m and m' also normalise U_M, this becomes U m m' U and [U m U][U m' U] = [U m m' U] in H(G, U; ℤ); (2) the ℤ-linear map t : H(Δ_M⁺, U_M) → H(Δ⁺, U), [U_M m U_M] ↦ [U m U], is an injective ring homomorphism; (3) with 𝒮 = r_M ∘ r_P the restriction–integration map, t ∘ 𝒮 and 𝒮 ∘ t multiply [U m U], resp. [U_M m U_M], by |δ_P(m)|⁻¹ = #(U_N / m U_N m⁻¹). In particular the span of {[U m U] : m in a commutative submonoid of Δ_M⁺ that normalises U_M} is a commutative subalgebra of H(G, U; ℤ). For M = T a maximal torus of a split group, U = K_p with an Iwahori decomposition relative to (B, B̄) and T⁺ the monoid of t with t U_{K_p} t⁻¹ ⊆ U_{K_p} and t⁻¹ Ū_{K_p} t ⊆ Ū_{K_p}, t ↦ [K_p t K_p] is an algebra homomorphism ℤ[T⁺/T_{K_p}] → H(G, K_p; ℤ). The two contraction conditions are needed: the product decomposition alone does not make t ↦ [K_p t K_p] multiplicative.

**Hypotheses.** G locally profinite; (P, P̄) a parabolic pair; U compact open with an Iwahori decomposition.

**Construction or proof.**
1. Positivity gives U m U m' U = U m U_M m' U (Allen et al. Lemma 2.1.10). The middle U_M cannot be discarded for an arbitrary Levi. If m,m' normalise U_M, double-coset counting gives coefficient one and the single-coset product.
2. For the general t, transfer the Levi structure constants using both Iwahori factorisations, retaining the U_M double-coset multiplicities. Allen et al. Lemma 2.1.12 cites Bushnell–Kutzko Corollary 6.12 instead of supplying this calculation. A complete proof of that transfer is an explicit gap; the torus/normaliser calculation does not close it.
3. (3) direct computation of r_M ∘ r_P on [U m U] (Allen et al. §2.1.9).
4. Torus case: the contraction conditions defining T⁺ say exactly that T⁺ ⊆ Δ_T⁺; dominance of the valuation of t gives them for the standard depth-n Iwahori subgroups, not for an arbitrary K_p with an Iwahori decomposition.

**Direct prerequisites.** `SmoothRepresentationsOfLocalGroups:SR.1/iwahori-decomposition`, `SmoothRepresentationsOfLocalGroups:SR.1/permutation-hecke-algebra`, `SmoothRepresentationsOfLocalGroups:SR.1/hecke-ring-comparison`.

**API.**

- `TauCeti.positiveHeckeHom` (data): t : H(Δ_M⁺, U_M; ℤ) →+* H(Δ⁺, U; ℤ), [U_M m U_M] ↦ [U m U].
- `TauCeti.positiveHeckeHom_injective` (relation): t is injective.
- `TauCeti.doubleCoset_mul_of_positive` (simp): For m,m' ∈ Δ_M⁺ that normalise U_M, [U m U][U m' U] = [U m m' U]. Without the normaliser hypothesis use the Levi structure constants via positiveHeckeHom, not a single-coset formula.
- `TauCeti.positiveHeckeHom_comp_restrict` (relation): t ∘ 𝒮 = |δ_P|⁻¹ · and 𝒮 ∘ t = |δ_P|⁻¹ · on basis elements.

**Acceptance checks.**

- GL_2(ℚ_p), Iwahori I, z = diag(p,1): [I z I]^n = [I z^n I] (the U_p operator is multiplicative).
- GL_n(ℚ_p), congruence K = 1 + p^i M_n(ℤ_p), λ dominant diagonal: a(λμ) = a(λ)a(μ) (Bernstein 1992 Theorem 9(2)).
- For non-positive m the product [UmU][Um⁻¹U] ≠ [UU] in general (for GL_2, z and z⁻¹ at Iwahori level: [IzI][Iz⁻¹I] has p terms).

**Uses.** Allen et al. 2023, Lemmas 2.1.12–2.1.13 and §2.2.5: moving Hecke operators between Levi and ambient levels. Boxer–Pilloni 2026, §1.3.4: Hecke operators at p from an Iwahori decomposition, multiplicative on T⁺(ℚ_p). Bernstein 1992, Ch. II §1.1 Theorem 9(2): the commutative subalgebra C = span{a(λ) : λ ∈ Λ⁺}. SmoothRepresentationsOfLocalGroups:SR.3a/hecke-algebra-decomposition: the commutative subalgebra C in H_K = H₀CH₀. IntegralHeckeAndGaloisDeterminantsPartII:IHR.2: Allen et al. Lemmas 2.1.12–2.1.13 in integral form. PotentialAutomorphyInfrastructure:PA.0: positive-monoid Hecke algebras over O/ϖ^m.

**Sources.** `ACC23`, §2.1.9, Lemma 2.1.12 and the following paragraph, p. 914: For U with an Iwahori decomposition, t([U_M m U_M]) = [U m U] is an algebra homomorphism (citing Bushnell–Kutzko Cor. 6.12), injective, with t∘𝒮 and 𝒮∘t given by |δ_P(m)|⁻¹. `BERNSTEIN87`, §5.1, pp. 19–20: For K in good position and a, b dominant, K a K b K = K ab K, so h(ab) = h(a)h(b). `BERNSTEIN92`, Ch. II §1.1, Theorem 9 and its proof, pp. 29–30: For GL(n) and a congruence subgroup, a(λμ) = a(λ)a(μ) for dominant λ, μ, so C = span{a(λ)} is a commutative finitely generated algebra. `BP26`, §1.3.4, p. 3; §3.1, p. 34: For K_p with an Iwahori decomposition relative to B, t ↦ [K_p t K_p] is stated to be an algebra morphism ℤ[T⁺(ℚ_p)/T_{K_p}] → C_c(K_p\G(ℚ_p)/K_p, ℤ); the contraction hypotheses t U_{K_p} t⁻¹ ⊆ U_{K_p}, t⁻¹ Ū_{K_p} t ⊆ Ū_{K_p} are needed and hold for the depth-n Iwahori levels K_{p,n}, n ≥ 1, used in §4.2.

**Atlas planet:** Positive Hecke monoid homomorphism.

#### Localisation at a strongly positive element

**Identifier:** `SmoothRepresentationsOfLocalGroups:SR.1/strongly-positive-localisation`. **Kind:** theorem. **Proposed name:** `TauCeti.positiveHeckeHom_localization`. **Module:** `TauCeti/RepresentationTheory/Smooth/Hecke`.

In the setting of positive-hecke-homomorphism let z ∈ Z(M) be strongly positive. Then [U_M z U_M] is central and invertible in H(M, U_M; ℤ), every [U_M m U_M] times a power of [U_M z U_M] lies in H(Δ_M⁺, U_M), and H(Δ_M⁺, U_M)[[U_M z U_M]⁻¹] = H(M, U_M; ℤ). If R is a ring in which q (the residue cardinality, so that |δ_P|⁻¹ is a power of q) is a unit and [UzU] is invertible in H(G, U) ⊗ R, then t ⊗ R and 𝒮 ⊗ R extend uniquely to algebra isomorphisms between H(M, U_M) ⊗ R and (H(Δ⁺, U) ⊗ R)[[UzU]⁻¹], inverse to each other up to the twist by |δ_P|.

**Hypotheses.** As in positive-hecke-homomorphism; z strongly positive central in M; R a ring with q ∈ Rˣ and [UzU] invertible in H(G,U) ⊗ R.

**Construction or proof.**
1. z central in M: [U_M z U_M] has inverse [U_M z⁻¹ U_M]; strong positivity gives z^n m ∈ Δ_M⁺ for n ≫ 0.
2. Localisation: universal property of localisation applied to t and 𝒮, using 𝒮([UzU]) = |δ_P(z)|⁻¹[U_M z U_M] and invertibility of q.

**Direct prerequisites.** `SmoothRepresentationsOfLocalGroups:SR.1/positive-hecke-homomorphism`.

**Acceptance checks.**

- GL_2(ℚ_p), Iwahori I, B upper triangular: z = diag(p^a, p^b) with a > b is strongly positive, and (H(Δ⁺, I) ⊗ ℤ[1/p])[[I z I]⁻¹] ≅ H(T, T(ℤ_p)) ⊗ ℤ[1/p] = ℤ[1/p][X_*(T)].
- Without q invertible, 𝒮 does not extend: |δ_P(z)|⁻¹ = q^k must be inverted.
- For M = G the statement is trivial (U_N = U_{N̄} = 1).

**Sources.** `ACC23`, §2.1.9, Lemma 2.1.13, p. 915: Centrality and invertibility of [U_M z U_M], H(Δ_M, U_M)[[U_M z U_M]⁻¹] = H(M(F), U_M), and the extension of t ⊗ R and 𝒮 ⊗ R to isomorphisms when q ∈ Rˣ and [UzU] is invertible.

#### The torus inside the pro-p Iwahori Hecke algebra

**Identifier:** `SmoothRepresentationsOfLocalGroups:SR.1/pro-iwahori-torus`. **Kind:** application. **Proposed name:** `TauCeti.proIwahoriTorusHom`. **Module:** `TauCeti/RepresentationTheory/Smooth/Hecke`.

Let G be a split reductive group over the ring of integers O_v of a nonarchimedean local field F_v with residue field k(v) of characteristic p, B = TU a Borel, Iw(v) and Iw₁(v) the preimages of B(k(v)) and U(k(v)) under G(O_v) → G(k(v)), O a ring containing q_v^{1/2}, and H₁ = O[Iw₁(v)\G(F_v)/Iw₁(v)]. For x, y in the positive monoid T(F_v)⁺ = {t : α(t) ∈ O_v for every simple root α}, [Iw₁ x Iw₁][Iw₁ y Iw₁] = [Iw₁ xy Iw₁], and [Iw₁ x Iw₁] is a unit of H₁[1/p] (of H₁ when p is invertible in O). Writing t = x y⁻¹ with x, y positive, t ↦ δ_B^{1/2}(t)[Iw₁ x Iw₁][Iw₁ y Iw₁]⁻¹ is a well-defined homomorphism T(F_v) → (H₁[1/p])ˣ with kernel T(O_v)₁ = ker(T(O_v) → T(k(v))); the Iwahori analogue embeds O[X_*(T)] ⊗ O[1/p] into O[Iw(v)\G(F_v)/Iw(v)][1/p].

**Hypotheses.** G split reductive over O_v; O ∋ q_v^{1/2}; Iw₁(v) the pro-p Iwahori subgroup.

**Construction or proof.**
1. Iw₁(v) has an Iwahori decomposition with respect to (B, B̄) (ReductiveGroupsPartII RG2.3), and T(F_v)⁺ lies in the positive monoid: positive-hecke-homomorphism gives multiplicativity.
2. Invertibility after inverting p: strongly-positive-localisation for a strongly positive central cocharacter, together with the Iwahori–Matsumoto relations (iwahori-matsumoto) where each T_s is invertible once q is.

**Direct prerequisites.** `SmoothRepresentationsOfLocalGroups:SR.1/positive-hecke-homomorphism`, `SmoothRepresentationsOfLocalGroups:SR.1/strongly-positive-localisation`, `SmoothRepresentationsOfLocalGroups:SR.1/iwahori-matsumoto`, `ReductiveGroupsPartII:RG2.3`.

**Acceptance checks.**

- GL_2(ℚ_p): x = diag(p, 1) gives [Iw₁ x Iw₁] = U_p-type operator, invertible in H₁[1/p].
- The kernel of T(F_v) → (H₁[1/p])ˣ is exactly T(O_v)₁, not T(O_v): characters of T(k(v)) survive at pro-p Iwahori level.
- For v ∤ p (p invertible in O) the elements are already invertible in H₁.

**Sources.** `BCGP21`, §2.4.1, Proposition 2.4.2 and the following paragraph; the paragraph after Proposition 2.4.4 (arXiv v3 pp. 20–21; PMIHÉS 134, pp. 174–176): Multiplicativity of the pro-v Iwahori double cosets on T(F_v)⁺, their invertibility in H₁[1/p] (and in H₁ when v ∤ p), the δ_B^{1/2}-twisted homomorphism T(F_v) → (H₁[1/p])^× with kernel T(O_{F_v})₁, and the Iwahori analogue E[X_*(T)] ↪ H[1/p].

#### The positive Klingen Hecke algebra of GSp_4

**Identifier:** `SmoothRepresentationsOfLocalGroups:SR.1/klingen-positive-hecke`. **Kind:** application. **Proposed name:** `TauCeti.klingenPositiveHecke_isPolynomial`. **Module:** `TauCeti/RepresentationTheory/Smooth/Hecke`.

Let ℓ be a prime, J = (0 A; −A 0) with A the 2 × 2 antidiagonal matrix of ones, GSp_4(ℚ_ℓ) = {g ∈ GL_4(ℚ_ℓ) : gᵀ J g = ν(g) J, ν(g) ∈ ℚ_ℓ^×}, and Kli(ℓ) ⊆ GSp_4(ℤ_ℓ) the Klingen parahoric, the elements whose reduction mod ℓ stabilises the line F_ℓ e₁. Let U₀ = [Kli ℓ·1 Kli], U₁ = [Kli diag(ℓ², ℓ, ℓ, 1) Kli] and U₂ = [Kli diag(ℓ, ℓ, 1, 1) Kli] in H(GSp_4(ℚ_ℓ), Kli(ℓ); ℤ). Then U₀, U₁, U₂ commute and the ring map ℤ[X₀, X₁, X₂] → H(GSp_4(ℚ_ℓ), Kli(ℓ); ℤ), X_i ↦ U_i, is injective: the subring H⁺_Kli they generate is a polynomial ring in U₀, U₁, U₂.

**Hypotheses.** ℓ prime; GSp_4 for the antidiagonal form J; Kli(ℓ) the Klingen parahoric.

**Construction or proof.**
1. Kli(ℓ) has an Iwahori decomposition N_Kli(ℤ_ℓ) · M_Kli(ℤ_ℓ) · N̄_Kli(ℓℤ_ℓ) with respect to the Klingen parabolic P_Kli = M_Kli N_Kli (stabiliser of the line ⟨e₁⟩) and its opposite, with M_Kli ≅ G_m × GL_2, (λ, A) ↦ diag(λ, A, det A / λ).
2. The three elements ℓ·1 ↔ (ℓ, ℓ·1), diag(ℓ², ℓ, ℓ, 1) ↔ (ℓ², ℓ·1) and diag(ℓ, ℓ, 1, 1) ↔ (ℓ, diag(ℓ, 1)) contract N_Kli(ℤ_ℓ) and expand N̄_Kli(ℓℤ_ℓ) (the ℓ-adic valuations of the roots of N_Kli on them are (0, 0, 0), (1, 1, 2) and (0, 1, 1)), as do all monomials in them; so positive-hecke-homomorphism gives an injective ring map t from the positive part of H(M_Kli, M_Kli(ℤ_ℓ); ℤ) sending λS, λ²S and λT to U₀, U₁ and U₂, where λ = [ℓ] on G_m, S = [ℓ·1] and T = [diag(ℓ, 1)] on GL_2.
3. H(M_Kli, M_Kli(ℤ_ℓ); ℤ) = ℤ[λ^{±1}] ⊗ H(GL_2(ℚ_ℓ), GL_2(ℤ_ℓ); ℤ), and in the second factor S^m T^c = [diag(ℓ^{m+c}, ℓ^m)] + (a combination of [diag(ℓ^{m+c−i}, ℓ^{m+i})], 0 < i ≤ c/2), so the S^m T^c are linearly independent by triangularity in the elementary divisors; this is the argument of Shimura's rank-two presentation of the ℓ-local classical Hecke ring, which Tau Ceti proves.
4. U₀^a U₁^b U₂^c ↦ λ^{a+2b+c} S^{a+b} T^c; distinct (a, b, c) give distinct monomials, which are linearly independent, so the U-monomials are linearly independent by injectivity of t.

**Direct prerequisites.** `SmoothRepresentationsOfLocalGroups:SR.1/positive-hecke-homomorphism`, `SmoothRepresentationsOfLocalGroups:SR.1/iwahori-decomposition`, `SmoothRepresentationsOfLocalGroups:SR.1/hecke-ring-comparison`, `tauceti:HeckeRing.GLn.polynomialRingEquivTwo`, `tauceti:TauCetiRoadmap/ModularForms#layer-2-hecke-operators-and-the-hecke-algebra`.

**Acceptance checks.**

- deg U₂ = #(Kli diag(ℓ,ℓ,1,1) Kli / Kli) = ℓ²(ℓ + 1) and deg U₁ = ℓ⁴, and deg(U₂²) = ℓ⁴(ℓ + 1)² = deg[Kli t² Kli] + (ℓ + 1) deg U₁ with t = diag(ℓ, ℓ, 1, 1).
- U₀ is not invertible in H⁺_Kli although [Kli ℓ⁻¹ Kli] is its inverse in the full Hecke algebra.
- On the Klingen invariants of a generic spherical representation, the eigenvalues of (U₀, U₁, U₂) form the four Weyl conjugates of (ℓ⁻³αδ, ℓ⁻¹αβ, α + β) (Pilloni Proposition 5.1.5.1; borel-casselman-invariants and jacquet-invariants).

**Sources.** `PILLONI20`, §5.1.2, p. 20; §5.1.4, p. 21 (author copy): Defines the Klingen parabolic as the stabiliser of ⟨e₁⟩, the Klingen parahoric Kli(ℓ), the operators U_{Kli(ℓ),0}, U_{Kli(ℓ),1}, U_{Kli(ℓ),2}, and asserts without proof that the subalgebra H⁺_{Kli(ℓ)} they generate is polynomial; the proof here goes through the positive Levi map. `CG20`, §1.3, pp. 4–5 (arXiv v1): Iwahori and Klingen parahoric operators of GSp_4 at p with the reverse indexing of U_{•,1} and U_{•,2}, and the dimension chain 8 = 2·4 for unramified generic representations.

#### The Iwahori–Matsumoto presentation

**Identifier:** `SmoothRepresentationsOfLocalGroups:SR.1/iwahori-matsumoto`. **Kind:** theorem. **Proposed name:** `TauCeti.IwahoriHecke.iwahoriMatsumoto`. **Module:** `TauCeti/RepresentationTheory/Smooth/IwahoriHecke`.

Let G be a split connected reductive group over a nonarchimedean local field F with residue cardinality q, I an Iwahori subgroup, and W̃ = N_G(T)(F)/T(O_F) the extended affine Weyl group, W̃ = W_aff ⋊ Ω with W_aff a Coxeter group on the simple affine reflections S_aff and Ω the length-zero elements. Then G = ⊔_{w ∈ W̃} IwI, [IwI : I] = q^{ℓ(w)}, and H(G, I; ℤ) is free over ℤ on T_w = [IwI] (w ∈ W̃) with: T_w T_{w'} = T_{ww'} when ℓ(ww') = ℓ(w) + ℓ(w'); (T_s − q)(T_s + 1) = 0 for s ∈ S_aff; T_ω T_w = T_{ωw} for ω ∈ Ω. These relations (quadratic, braid and length-zero) present H(G, I; ℤ) ≅ ℤ[Ω] ⊗̃ H_aff. Base change gives H(G, I; A) for every A; each T_w is invertible once q ∈ Aˣ; if q = 1 in A then H(G, I; A) ≅ A[W̃].

**Hypotheses.** G split connected reductive over F (Chevalley group); I Iwahori; A any commutative ring.

**Construction or proof.**
1. Iwahori–Bruhat decomposition and the index formula (ReductiveGroupsPartII RG2.4; Iwahori–Matsumoto Theorem 2.16 and Proposition 3.2).
2. Tits-system multiplication of double cosets: I s I · I w I = I sw I if ℓ(sw) > ℓ(w), and I s I · I w I = I w I ∪ I sw I if ℓ(sw) < ℓ(w) (Iwahori–Matsumoto Proposition 2.8); the coset counts of hecke-ring-comparison then give the quadratic relation.
3. Presentation: Matsumoto's lemma on reduced words and Iwahori–Matsumoto Theorem 3.5 / Proposition 3.8.
4. q = 1: the quadratic relation becomes T_s² = 1 and the braid relations present A[W̃].

**Direct prerequisites.** `SmoothRepresentationsOfLocalGroups:SR.1/hecke-ring-comparison`, `SmoothRepresentationsOfLocalGroups:SR.1/permutation-hecke-algebra`, `ReductiveGroupsPartII:RG2.4`, `ReductiveGroupsPartII:RG2.3`, `tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory`.

**Acceptance checks.**

- GL_2(ℚ_p): W̃ = ℤ² ⋊ S_2, S_aff = {s₀, s₁}, Ω generated by ω = (0 1; p 0); T_{s}² = (p − 1)T_s + p.
- Over A = ℤ/ℓ^r with p ≡ 1 mod ℓ^r, H(GL_n(ℚ_p), I; A) ≅ A[ℤ^n ⋊ S_n] (Venkatesh 2019 (50)).
- T_s is not invertible in H(G, I; F_p) when p = q: T_s(T_s + 1) = 0 there.
- At the deeper congruence Iwahori levels I_n (n ≥ 1) length additivity persists: 1_{I_n g I_n} · 1_{I_n g′ I_n} = μ(I_n) 1_{I_n gg′ I_n} for g ∈ IwI, g′ ∈ Iw′I with ℓ(ww′) = ℓ(w) + ℓ(w′) (He 2018 Proposition 13).

**Sources.** `IM65`, §2, Theorem 2.16, p. 36 and Proposition 2.8, p. 33; §3, Proposition 3.2, Theorem 3.3, Proposition 3.4, Theorem 3.5, Proposition 3.8, pp. 44–47: Iwahori–Bruhat decomposition of a Chevalley group over its extended affine Weyl group, index q^{λ(σ)}, generation of ℋ(G, B) along reduced words, the quadratic and braid relations, the presentation of the affine part over ℤ and ℋ(G, B) ≅ ℤ[Ω] ⊗̃ ℋ(G′B, B). `HKP03`, §1.2, p. 2; §7.1–7.2, pp. 19–20: The Iwahori–Hecke algebra C_c(I\G/I) with basis T_x = 1_{IxI} over W̃ and the Iwahori–Matsumoto relations with respect to the Bruhat order. `VENKATESH19`, §4.1, equation (50), p. 37: For q_v ≡ 1 in S, the Iwahori–Hecke algebra is isomorphic to S[W̃]. `HE18`, Proposition 13, p. 16, proof §4.4, p. 18: For length-additive w, w′ in the Iwahori–Weyl group, g ∈ IẇI, g′ ∈ Iẇ′I and the congruence Iwahori subgroups I_n, 1_{I_n g I_n} · 1_{I_n g′ I_n} = μ(I_n) 1_{I_n gg′ I_n}.

**Atlas planet:** Iwahori–Matsumoto presentation.

#### The Bernstein presentation

**Identifier:** `SmoothRepresentationsOfLocalGroups:SR.1/bernstein-presentation`. **Kind:** theorem. **Proposed name:** `TauCeti.IwahoriHecke.bernsteinPresentation`. **Module:** `TauCeti/RepresentationTheory/Smooth/IwahoriHecke`.

In the setting of iwahori-matsumoto let A be a ring containing an inverse square root q^{−1/2} of q. For a dominant cocharacter λ set θ_λ = q^{−ℓ(λ)/2} T_{λ(ϖ)}, and θ_{λ−μ} = θ_λ θ_μ⁻¹ for λ, μ dominant. Then λ ↦ θ_λ is a well-defined injective algebra homomorphism A[X_*(T)] → H(G, I; A); multiplication gives an A-module isomorphism A[X_*(T)] ⊗_A H(K, I; A) ≅ H(G, I; A), where H(K, I; A) is the finite Hecke algebra of K = G(O_F), with basis T_w (w ∈ W); and for a simple reflection s = s_α ∈ W the Bernstein relation T_s θ_λ − θ_{s(λ)} T_s = (q − 1)(θ_λ − θ_{s(λ)})/(1 − θ_{−α^∨}) holds (the right side lies in A[X_*(T)]). The same holds for the generic affine Hecke algebra over ℤ[v, v⁻¹], which specialises to H(G, I; A) by v ↦ q^{1/2}.

**Hypotheses.** G split connected reductive; A ∋ q^{±1/2}.

**Construction or proof.**
1. θ_λ θ_μ = θ_{λ+μ} for dominant λ, μ by length additivity ℓ(λ + μ) = ℓ(λ) + ℓ(μ) (iwahori-matsumoto; Lusztig 1989 1.4(g), Lemma 3.4).
2. Basis T_w θ_λ (w ∈ W, λ ∈ X_*(T)): triangularity with respect to the Iwahori–Matsumoto basis (Lusztig 1989 Proposition 3.7; Haines–Kottwitz–Prasad Lemma 1.7.1).
3. Bernstein relation: Lusztig 1989 Proposition 3.6 (generic), Haines–Kottwitz–Prasad (1.15.2) via intertwiners.

**Direct prerequisites.** `SmoothRepresentationsOfLocalGroups:SR.1/iwahori-matsumoto`, `SmoothRepresentationsOfLocalGroups:SR.1/positive-hecke-homomorphism`.

**Acceptance checks.**

- GL_2: θ_{(1,0)} = q^{−1/2} T_{diag(p,1)} and θ_{(1,1)} = T_{diag(p,p)} central.
- q = 1 specialisation: θ_λ = T_λ and the Bernstein relation becomes T_s θ_λ = θ_{s(λ)} T_s, giving A[X_*(T) ⋊ W].
- Without q^{1/2} in A only the unnormalised elements T_{λ(ϖ)} (λ dominant) are available; they are multiplicative on the dominant cone but θ_λ for non-dominant λ needs q^{−1}.

**Sources.** `LUSZTIG89`, §3, 3.2–3.7, pp. 607–609: Definition of the affine Hecke algebra over 𝒜 = ℤ[v, v⁻¹], the elements θ_x, the algebra isomorphism 𝒜[X] → 𝒪, the Bernstein relation (Proposition 3.6) and the bases T_wθ_x and θ_xT_w (Proposition 3.7). `HKP03`, Lemma 1.7.1 and Remark 1.7.2, p. 4; (1.15.2), p. 9: Bernstein's decomposition H = Θ(R)·H₀ with Θ_λ = q^{⟨ρ, −λ₁+λ₂⟩}T_{π^{λ₁}}T_{π^{λ₂}}⁻¹, and Bernstein's relation.

#### The centre of the Iwahori–Hecke algebra

**Identifier:** `SmoothRepresentationsOfLocalGroups:SR.1/iwahori-hecke-centre`. **Kind:** theorem. **Proposed name:** `TauCeti.IwahoriHecke.center_eq_invariants`. **Module:** `TauCeti/RepresentationTheory/Smooth/IwahoriHecke`.

With A ∋ q^{±1/2} a domain (or any ring after base change from ℤ[v, v⁻¹]), the centre of H(G, I; A) is θ(A[X_*(T)])^W = θ(A[X_*(T)]^W), free over A on the orbit sums z_λ = Σ_{μ ∈ Wλ} θ_μ for λ dominant. H(G, I; A) is free of rank |W| over θ(A[X_*(T)]), which is finite over the centre, so H(G, I; A) is a finitely generated module over its centre. For q = 1 in A the centre of A[X_*(T) ⋊ W] is again A[X_*(T)]^W, W acting faithfully on X_*(T). The comparison of this centre with the spherical Hecke algebra (z ↦ e_K z, the Satake isomorphism) is an SR.4 target, not part of this node.

**Hypotheses.** G split; A ∋ q^{±1/2}.

**Construction or proof.**
1. A[X_*(T)]^W is central: Lusztig 1989 Corollary 3.10 (θ_x + θ_{s(x)} commutes with T_s) and induction on orbits.
2. Equality: Lusztig 1989 Proposition 3.11 (generic algebra, by specialisation v → 1 to ℂ[W̃]), Haines–Kottwitz–Prasad Lemma 2.3.1 over ℂ.

**Direct prerequisites.** `SmoothRepresentationsOfLocalGroups:SR.1/bernstein-presentation`.

**Acceptance checks.**

- GL_2: the centre is generated by θ_{(1,0)} + θ_{(0,1)} and θ_{(1,1)}^{±1}.
- For G = T a split torus, H(T, T(O); A) = A[X_*(T)] is commutative and equals its centre.
- The element θ_{(1,0)} alone is not central in H(GL_2(ℚ_p), I; A).

**Sources.** `LUSZTIG89`, §3, Proposition 3.11 and 3.12, p. 610: The centre of the affine Hecke algebra is free with basis z_M = Σ_{x∈M} θ_x over W₀-orbits M, i.e. it is 𝒪^{W₀}. `HKP03`, Lemmas 2.1.1 and 2.3.1, pp. 9–10: R^W lies in the centre of H, and the centre of H is R^W, for R = ℂ[X_*(A)]. `VENKATESH19`, §4.3, p. 38: Z := S[X_*]^W maps isomorphically onto the centre of H_I when q_v ≡ 1 in S.

### SR.0:derived-extension. The derived smooth category

The smooth category is Grothendieck abelian. It therefore has enough injectives, K-injective resolutions of unbounded complexes and an unbounded derived category, and the Hom complexes into K-injective complexes give its dg enhancement. Derived invariants of a compact open subgroup compute continuous cohomology. For G locally pro-p and Λ killed by an integer prime to p, the compact inductions c-Ind_K Λ from pro-p subgroups K are compact generators. The layer also gives derived smooth duality, vanishing of Ext between representations on which the centre acts through different characters, and the derived Hecke algebra Ext^*(A[G/K], A[G/K]). It follows SR.1, because the derived Hecke algebra extends the permutation-module Hecke algebra.

**Planets of this layer:** Derived category of smooth representations (`derived-smooth-category`); Compact generators c-Ind_K Λ (`compact-generation`); Derived Hecke algebra (`derived-hecke-algebra`).

#### The smooth category is a Grothendieck category

**Identifier:** `SmoothRepresentationsOfLocalGroups:SR.0:derived-extension/grothendieck-abelian`. **Kind:** theorem. **Proposed name:** `TauCeti.SmoothRep.instIsGrothendieckAbelian`. **Module:** `TauCeti/RepresentationTheory/Smooth/Derived`.

Let G be locally profinite and A a commutative ring. SmoothRep A G is a Grothendieck abelian category: filtered colimits exist and are exact (AB5), and ⊕_{U ∈ 𝒰} A[G/U] is a generator for any neighbourhood basis 𝒰 of compact open subgroups, because Hom_G(A[G/U], V) ≅ V^U and V = ⋃ V^U. Hence SmoothRep A G has enough injectives, Ext groups and a derived category (Mathlib). For a compact open U the restriction functor SmoothRep A G ⥤ SmoothRep A U preserves injective objects, since its left adjoint, algebraic induction A[G] ⊗_{A[U]} −, is exact and preserves smoothness.

**Hypotheses.** G locally profinite; A a commutative ring; U compact open.

**Construction or proof.**
1. AB5: filtered colimits in SmoothRep A G are computed in A-modules (smooth-rep-abelian), where they are exact.
2. Generator: Hom_G(A[G/U], V) ≅ V^U (Frobenius reciprocity for the open subgroup U: Rep.indResAdjunction together with Tau Ceti's indTrivialIso A[G/U] ≅ Ind_U^G A and the invariants adjunction); a nonzero V has V^U ≠ 0 for some U ∈ 𝒰 by the union description.
3. Apply IsGrothendieckAbelian.enoughInjectives and IsGrothendieckAbelian.hasExt; HasDerivedCategory.standard gives the derived category.
4. Restriction to U has the exact left adjoint Rep.ind U.subtype, which sends smooth U-representations to smooth G-representations (a vector g ⊗ v is fixed by g Stab(v) g⁻¹); Injective.injective_of_adjoint.

**Direct prerequisites.** `SmoothRepresentationsOfLocalGroups:SR.0:abelian-category/smooth-rep-abelian`, `SmoothRepresentationsOfLocalGroups:SR.0:abelian-category/compact-open-invariants`, `mathlib:CategoryTheory.IsGrothendieckAbelian`, `mathlib:CategoryTheory.IsGrothendieckAbelian.enoughInjectives`, `mathlib:CategoryTheory.IsGrothendieckAbelian.hasExt`, `mathlib:HasDerivedCategory`, `mathlib:Rep.indResAdjunction`, `tauceti:TauCeti.indTrivialIso`, `mathlib:CategoryTheory.Injective.injective_of_adjoint`.

**Acceptance checks.**

- For G finite discrete this recovers Rep A G ≌ Mod(A[G]) with generator A[G].
- For G = ℤ_p and A = F_ℓ (ℓ ≠ p) every object of SmoothRep is injective (the category is semisimple), while for A = F_p the trivial representation is not injective (Ext¹(F_p, F_p) = Hom_cont(ℤ_p, F_p) ≠ 0).
- The trivial representation of ℤ_p over F_p embeds in the injective object of locally constant functions ℤ_p → F_p with the translation action (smooth coinduction from the trivial subgroup).

**Sources.** `BERNSTEIN87`, §1.1–1.2, pp. 3–4: The nondegenerate module category of an idempotented ring has exact filtered direct limits, the projective generators He, and enough injectives I(e, U). `BERNSTEIN92`, Ch. I §2.2, Theorem 3, p. 13: The category of nondegenerate modules over an idempotented algebra has enough projectives, generated by the modules He. `CG18`, arXiv v2 §9.2.1, Lemma 9.14, p. 92: The category 𝒞 has enough injectives, and the U(x)-invariants of an injective object are acyclic.

#### The derived category of smooth representations

**Identifier:** `SmoothRepresentationsOfLocalGroups:SR.0:derived-extension/derived-smooth-category`. **Kind:** definition. **Proposed name:** `TauCeti.SmoothRep.DerivedCat`. **Module:** `TauCeti/RepresentationTheory/Smooth/Derived`.

D(G, A) := DerivedCategory (SmoothRep A G), the unbounded derived category of the Grothendieck abelian category of smooth representations, with its bounded-below part D⁺(G, A) = DerivedCategory.Plus, localisation functor Q, the fully faithful embedding of SmoothRep A G in degree 0, and Ext^n_G(V, W) = Hom_{D(G,A)}(V, W[n]) (Mathlib's Abelian.Ext). For G finite discrete D(G, A) ≃ D(A[G]); for an open subgroup U, restriction and algebraic induction are exact and induce an adjunction on derived categories.

**Hypotheses.** G locally profinite; A a commutative ring; a universe large enough for HasDerivedCategory.standard.

**Construction or proof.**
1. Use grothendieck-abelian and Mathlib's derived category of an abelian category.
2. Exact functors (restriction, induction from open subgroups, inflation, base change along flat A → B) extend to D by Functor.mapDerivedCategory.

**Direct prerequisites.** `SmoothRepresentationsOfLocalGroups:SR.0:derived-extension/grothendieck-abelian`, `mathlib:DerivedCategory`, `mathlib:DerivedCategory.Plus`, `mathlib:DerivedCategory.singleFunctor`, `mathlib:CategoryTheory.Abelian.Ext`.

**API.**

- `TauCeti.SmoothRep.DerivedCat` (data): D(G, A) := DerivedCategory (SmoothRep A G), triangulated.
- `TauCeti.SmoothRep.DerivedCatPlus` (data): The bounded-below part D⁺(G, A).
- `TauCeti.SmoothRep.singleFunctor_fullyFaithful` (relation): SmoothRep A G embeds fully faithfully in degree 0 (heart of the canonical t-structure).
- `TauCeti.SmoothRep.ext` (data): Ext^n_G(V, W) as Abelian.Ext in SmoothRep A G, with Yoneda composition and long exact sequences.
- `TauCeti.SmoothRep.ext_zero` (simp): Ext⁰_G(V, W) ≃ Hom_G(V, W) (Ext.addEquiv₀).
- `TauCeti.SmoothRep.resDerived` (functoriality): Restriction to an open subgroup U and algebraic induction extend to an adjunction D(U, A) ⇄ D(G, A).
- `TauCeti.SmoothRep.inflationDerived` (functoriality): Inflation from G/N for N closed normal extends to derived categories.

**Unit tests.**

- `TauCeti.SmoothRep.ext_one_padicInt_fp` (computation): Ext¹ of the trivial representation of ℤ_p over F_p with itself is one-dimensional.
- `TauCeti.SmoothRep.ext_pos_padicInt_fl` (computation): For ℓ ≠ p, Ext^i of smooth F_ℓ-representations of ℤ_p vanishes for i > 0.
- `TauCeti.SmoothRep.ext_zero_test` (degenerate): Ext⁰ of the trivial representation with itself is A.
- `TauCeti.SmoothRep.derived_discrete_compat` (compatibility): For G finite discrete, Ext^n in SmoothRep A G agrees with Ext^n in Rep A G (Rep.equivalenceModuleMonoidAlgebra).

**Acceptance checks.**

- Ext⁰_G(V, W) = Hom_G(V, W).
- For G = ℤ_p: Ext¹_{SmoothRep F_p ℤ_p}(F_p, F_p) ≅ Hom_cont(ℤ_p, F_p) ≅ F_p, while Ext^i_{SmoothRep F_ℓ ℤ_p}(F_ℓ, F_ℓ) = 0 for i > 0 and ℓ ≠ p.
- For G discrete Ext^n_G agrees with Ext^n over A[G].

**Uses.** Fargues–Scholze 2021, Ch. V §1, Theorem V.1.1: D(G, Λ), the derived category of smooth representations of a locally pro-p group, which FS identify with D_ét([∗/G], Λ) in Ch. V. ArithmeticLocallySymmetricSpaces:ALS.3: D⁺_sm with U-invariants and its derived functor (Caraiani–Newton §2.1). HeckeStacksAndLocalShtukas:HS3: finite-level and colimit cohomology complexes as objects of the derived smooth category. VStackSheavesAndLisseCategories:VS4: the derived smooth category compared with sheaves on classifying stacks. ExcursionOperatorsAndSpectralAction:ES0: the derived smooth category and its heart. AutomorphicGaloisRepresentationsPartII:AG2.0: derived smooth Ext and level-colimit compatibility. Venkatesh 2019, §2.2: Ext groups in the category of smooth S[G]-modules define the derived Hecke algebra.

**Sources.** `FS21`, Ch. V §1, Theorem V.1.1, p. 168: For G locally pro-p and Λ killed by an integer prime to p, D(G, Λ) is the derived category of smooth representations of G on Λ-modules, which FS identify with D_ét([∗/G], Λ) in Ch. V. `VENKATESH19`, §2.1–2.2, pp. 15–16: Works in the category of smooth S[G]-modules and its Ext groups to define the derived Hecke algebra.

**Atlas planet:** Derived category of smooth representations.

#### Derived invariants and continuous cohomology

**Identifier:** `SmoothRepresentationsOfLocalGroups:SR.0:derived-extension/derived-invariants`. **Kind:** construction. **Proposed name:** `TauCeti.SmoothRep.derivedInvariants`. **Module:** `TauCeti/RepresentationTheory/Smooth/Derived`.

For a compact open subgroup U, RΓ(U, −) : D⁺(G, A) → D⁺(A) is the right derived functor of invariantsFunctor U (Mathlib's rightDerivedFunctorPlus), naturally isomorphic to RHom_G(A[G/U], −). Its cohomology on a smooth V is the continuous cohomology of the profinite group U with coefficients in the discrete module V: H^i(RΓ(U, V)) ≅ H^i_cont(U, V) (Mathlib's continuousCohomology, ProfiniteCohomology Layer 10). It commutes with filtered colimits. If U has pro-order invertible in A, RΓ(U, −) = Γ(U, −) (no higher cohomology). For a closed normal subgroup N of U, RΓ(U, −) ≅ RΓ(U/N, RΓ(N, −)).

**Hypotheses.** G locally profinite; A commutative; U compact open; N ⊴ U closed.

**Construction or proof.**
1. Derived functor: grothendieck-abelian gives enough injectives; apply Functor.rightDerivedFunctorPlus to invariantsFunctor U.
2. RΓ(U, −) ≅ RHom(A[G/U], −): invariantsFunctor U ≅ Hom_G(A[G/U], −) (grothendieck-abelian).
3. Comparison with continuous cohomology: restriction to U preserves injectives (grothendieck-abelian), so R^iΓ(U, V) is computed in SmoothRep A U; there both sides are universal δ-functors effaceable by the injectives Map_cont(U, I) (coinduced modules, ProfiniteCohomology Layer 7) and agree in degree 0 (continuousCohomologyZeroIso).
4. Filtered colimits: continuous cohomology of a profinite group with discrete coefficients is the colimit of the cohomology of the finite quotients U/U' (ProfiniteCohomology Layer 4), which commutes with filtered colimits.
5. Invertible pro-order: invariants-exact.
6. Composition: Γ(U, −) = Γ(U/N, −) ∘ Γ(N, −), and Γ(N, −) : SmoothRep A U → SmoothRep A (U/N) is right adjoint to the exact inflation, hence preserves injectives.

**Direct prerequisites.** `SmoothRepresentationsOfLocalGroups:SR.0:derived-extension/grothendieck-abelian`, `SmoothRepresentationsOfLocalGroups:SR.0:derived-extension/derived-smooth-category`, `SmoothRepresentationsOfLocalGroups:SR.0:abelian-category/invariants-exact`, `mathlib:CategoryTheory.Functor.rightDerivedFunctorPlus`, `mathlib:Rep.invariantsFunctor`, `mathlib:continuousCohomology`, `tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-7-coinduced-modules-and-shapiros-lemma`, `tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-10-continuous-cohomology-in-all-degrees`; `mathlib:Rep.quotientToInvariantsFunctor`.

**API.**

- `TauCeti.SmoothRep.derivedInvariants` (data): RΓ(U, −) : D⁺(G, A) ⥤ D⁺(A), the right derived functor of invariantsFunctor U.
- `TauCeti.SmoothRep.derivedInvariants_iso_rHom` (characterisation): RΓ(U, −) ≅ RHom_G(A[G/U], −).
- `TauCeti.SmoothRep.homology_derivedInvariants_iso_continuousCohomology` (compatibility): H^i(RΓ(U, V)) ≅ H^i_cont(U, V) for smooth V (V given the discrete topology), naturally in V.
- `TauCeti.SmoothRep.res_preserves_injective` (relation): Restriction to a compact open U preserves injective objects.
- `TauCeti.SmoothRep.derivedInvariants_of_unit` (relation): If HasUnitProOrder A U then R^iΓ(U, −) = 0 for i > 0.
- `TauCeti.SmoothRep.derivedInvariants_filteredColimit` (relation): R^iΓ(U, −) commutes with filtered colimits.
- `TauCeti.SmoothRep.derivedInvariants_comp_normal` (relation): For N ⊴ U closed, RΓ(U, −) ≅ RΓ(U/N, −) ∘ RΓ(N, −) on D⁺ (Hochschild–Serre).
- `TauCeti.SmoothRep.derivedInvariants_zero` (simp): H⁰(RΓ(U, V)) ≅ V^U.

**Unit tests.**

- `TauCeti.SmoothRep.derivedInvariants_padicInt_fp` (computation): For G = U = ℤ_p and A = F_p: H¹(RΓ(U, F_p)) ≅ F_p, H²(RΓ(U, F_p)) = 0.
- `TauCeti.SmoothRep.derivedInvariants_trivial_group` (degenerate): For U trivial (G discrete), RΓ(U, V) = V.
- `TauCeti.SmoothRep.derivedInvariants_unit_test` (compatibility): For U = ℤ/3 discrete and A = ℤ[1/3], RΓ(U, V) = V^U for all V, matching Representation.averageMap.
- `TauCeti.SmoothRep.derivedInvariants_not_exact` (non-example): For U = ℤ/p and A = F_p, H¹(RΓ(U, F_p)) ≠ 0, so U-invariants are not exact.

**Acceptance checks.**

- H¹(RΓ(ℤ_p, F_p)) = F_p and H^i(RΓ(ℤ_p, F_p)) = 0 for i ≥ 2.
- For U pro-p and p invertible in A, RΓ(U, V) = V^U in degree 0.
- H⁰(RΓ(U, V)) = V^U for every V.

**Uses.** Calegari–Geraghty 2018, Lemma 9.14 and Remark 9.15 (arXiv v2 §9.2.1): derived functors of invariants on the category 𝒞 are group cohomology; invariants of injectives are acyclic. Venkatesh 2019, §2.5: derived invariants on which the derived Hecke algebra acts. ArithmeticLocallySymmetricSpaces:ALS.3: U-invariants and its derived functor in the topological set-up of Caraiani–Newton §2.1. CrystallineLocalGlobalCompatibilityCM:CL.3: derived invariants for smooth semidirect products compose. IgusaVarietiesAndTorsionConcentration:IG.1: derived continuous invariants for general compact opens. HeckeStacksAndLocalShtukas:HS3: the exact functor of K-invariants for pro-p K and its derived form commuting with filtered colimits.

**Sources.** `CG18`, arXiv v2 §9.2.1, Lemma 9.14 and Remark 9.15, p. 92: Invariants of injectives in 𝒞 are acyclic, and the derived functors of invariants on 𝒞 are group cohomology. `VENKATESH19`, §2.5, equations (26)–(27), pp. 18–19: Derived invariants of a smooth S[G]-module under U as Ext from S[G/U], on which the derived Hecke algebra acts. `FS21`, Ch. V §1, proof of Theorem V.1.1, p. 170: For a pro-p group and coefficients killed by an integer prime to p there is no higher continuous cohomology, so RΓ is V ↦ V^G.

#### K-injective resolutions in Grothendieck categories

**Identifier:** `SmoothRepresentationsOfLocalGroups:SR.0:derived-extension/k-injective-resolutions`. **Kind:** theorem. **Proposed name:** `CategoryTheory.IsGrothendieckAbelian.exists_kInjective_resolution`. **Module:** `TauCeti/Algebra/Homology/KInjectiveResolution`.

In a Grothendieck abelian category 𝒜 every (unbounded) cochain complex X admits a quasi-isomorphism X → I to a K-injective complex I (Mathlib's CochainComplex.IsKInjective). Consequently every additive functor F : 𝒜 → ℬ has a total right derived functor RF : D(𝒜) → D(ℬ) computed by K-injective resolutions, and RHom(X, Y) := HomComplex(X, I_Y) computes Hom_{D(𝒜)}(X, Y[n]) in degree n. Applied to 𝒜 = SmoothRep A G this gives unbounded derived invariants RΓ(U, −) : D(G, A) → D(A) and derived Hom complexes.

**Hypotheses.** 𝒜 a Grothendieck abelian category (Mathlib's IsGrothendieckAbelian).

**Construction or proof.**
1. Follow Stacks Theorem 19.12.6 (Tag 079P): choose a cardinal controlling a generator and small acyclic complexes. Successively enlarge a complex by injective quasi-isomorphisms to make terms injective and annihilate maps from those acyclic test complexes. Take exact filtered colimits at limit ordinals; a sufficiently large cofinality ensures K-injectivity. This is a transfinite construction, not an unjustified homotopy-limit argument.
2. Hom into a K-injective complex is computed in the homotopy category (CohomologyClass.equivOfIsKInjective).
3. Derived functors: apply F to a functorial K-injective resolution; independence of choices by uniqueness up to homotopy.

**Direct prerequisites.** `mathlib:CategoryTheory.IsGrothendieckAbelian`, `mathlib:CochainComplex.IsKInjective`, `mathlib:CochainComplex.isKInjective_of_injective`, `mathlib:CochainComplex.HomComplex`, `mathlib:CochainComplex.HomComplex.CohomologyClass.equivOfIsKInjective`.

**Acceptance checks.**

- For bounded-below complexes the K-injective resolution can be a complex of injectives, recovering rightDerivedFunctorPlus.
- For 𝒜 = modules over a ring this is Spaltenstein's theorem.
- For 𝒜 = SmoothRep F_ℓ ℤ_p (ℓ ≠ p, semisimple) every complex is K-injective.

**Sources.** `STACKS`, Tag 079P (Derived categories, K-injective resolutions in Grothendieck abelian categories): Every complex of a Grothendieck abelian category has a quasi-isomorphism to a K-injective complex. `STACKS`, Tag 070Y (Derived categories, Section 13.31: K-injective complexes): K-injective complexes compute Hom in the derived category and give total right derived functors.

#### The dg enhancement of the derived smooth category

**Identifier:** `SmoothRepresentationsOfLocalGroups:SR.0:derived-extension/dg-enhancement`. **Kind:** construction. **Proposed name:** `TauCeti.SmoothRep.rHom`. **Module:** `TauCeti/RepresentationTheory/Smooth/Derived`.

The derived smooth category is enhanced by the dg category whose objects are K-injective complexes of smooth representations and whose Hom complexes are Mathlib's CochainComplex.HomComplex. Its homotopy category is equivalent to D(G, A). For complexes V, W of smooth representations, RHom_G(V, W) := HomComplex(V, I_W) with I_W a K-injective resolution is a complex of A-modules, functorial in both variables up to homotopy, with H^n RHom_G(V, W) = Hom_{D(G,A)}(V, W[n]). The forgetful functor to complexes of A-modules, restriction to open subgroups, derived invariants and derived tensor products over A are dg functors or are computed by K-flat/K-injective replacements in this model. The tensor and internal-Hom adjunction remain conditional on the equivariant K-flat construction in the gaps list.

**Hypotheses.** G locally profinite; A a commutative ring.

**Construction or proof.**
1. Objects and Hom complexes from k-injective-resolutions applied to SmoothRep A G.
2. Equivalence with D(G, A): every complex is quasi-isomorphic to a K-injective one, and maps into K-injectives are computed up to homotopy.
3. Hom complexes into a K-injective replacement give derived Hom. A-linear products and differentials lift the baseline AddCommGrpCat-valued HomComplex to ModuleCat A. Total tensor products require their Koszul signs and direct-sum totalisation; equivariant K-flat replacements are a separate missing input recorded below, not a consequence of K-injective resolution alone.

**Direct prerequisites.** `SmoothRepresentationsOfLocalGroups:SR.0:derived-extension/k-injective-resolutions`, `SmoothRepresentationsOfLocalGroups:SR.0:derived-extension/derived-smooth-category`, `SmoothRepresentationsOfLocalGroups:SR.0:derived-extension/derived-invariants`, `mathlib:CochainComplex.HomComplex`; `mathlib:Representation.tprod`.

**API.**

- `TauCeti.SmoothRep.rHom` (data): RHom_G(V, W) as a complex of A-modules, via HomComplex into a K-injective resolution.
- `TauCeti.SmoothRep.homology_rHom` (characterisation): H^n RHom_G(V, W) ≅ Hom_{D(G,A)}(V, W[n]).
- `TauCeti.SmoothRep.rHom_functorial` (functoriality): RHom_G is functorial in both variables on D(G, A), contravariant in the first.
- `TauCeti.SmoothRep.rHom_permutation` (characterisation): RHom_G(A[G/U], W) ≅ RΓ(U, W) for U compact open.
- `TauCeti.SmoothRep.derivedTensor` (data): The derived tensor product over A of complexes of smooth representations (diagonal action), via K-flat replacement.
- `TauCeti.SmoothRep.rHom_tensor_adjunction` (universal-property): RHom_G(B ⊗^L V, W) ≅ RHom_G(B, RHom_A(V, W)^sm), the derived version of the tensor–Hom adjunction.

**Unit tests.**

- `TauCeti.SmoothRep.homology_rHom_zero` (degenerate): H⁰ RHom_G(A, A) = A for the trivial representation of any G.
- `TauCeti.SmoothRep.rHom_padicInt_fp` (computation): For G = ℤ_p and A = F_p, H¹ RHom_G(F_p, F_p) = F_p.
- `TauCeti.SmoothRep.rHom_discrete_compat` (compatibility): For G finite discrete, RHom_G agrees with RHom over A[G] after Rep.equivalenceModuleMonoidAlgebra.
- `TauCeti.SmoothRep.rHom_semisimple` (computation): For G = ℤ_p and A = F_ℓ (ℓ ≠ p), representations V and W placed in degree zero satisfy H^n RHom_G(V, W) = 0 for n ≠ 0. This does not assert vanishing for arbitrary shifted complexes.

**Acceptance checks.**

- H⁰ RHom_G(V, W) = Hom_G(V, W) for V, W in degree 0.
- RHom_G(A[G/U], W) ≃ RΓ(U, W) (derived-invariants).
- For G discrete finite this is the usual dg model of D(A[G]).

**Uses.** VStackSheavesAndLisseCategories:VS4: an enhancement of the smooth derived category with derived invariants. ExcursionOperatorsAndSpectralAction:ES0: the enhanced derived smooth category, whose degree-zero centre is compared with the abelian centre. HeckeStacksAndLocalShtukas:HS3: derived Hom of smooth representations. Fargues–Scholze 2021, Ch. V §1, Corollary V.1.4: the adjunction Hom(B, (A*)^sm) = Hom(B ⊗^L A, Λ) used to identify smooth duality.

**Sources.** `STACKS`, Tag 070Y and Tag 079P: K-injective complexes and their existence in Grothendieck abelian categories give the Hom complexes computing derived Hom. `FS21`, Ch. V §1, Corollary V.1.4 and its proof, pp. 170–171: Uses the derived tensor product of smooth representations and the adjunction for (A*)^sm on D(G, Λ). `STACKS`, Section 20.26, Definition 20.26.2 (Tag 06Y9), Lemmas 20.26.11–12 (Tags 079T, 06YF); chapter PDF pp. 55–57, version ed88ff78 (14 Jul 2026): Defines K-flatness through acyclic total tensor products and constructs non-equivariant flat replacements. The smooth equivariant version is an explicit gap in this packet.

#### Compact induction from pro-p subgroups generates the derived category

**Identifier:** `SmoothRepresentationsOfLocalGroups:SR.0:derived-extension/compact-generation`. **Kind:** theorem. **Proposed name:** `TauCeti.SmoothRep.isCompact_permutation`. **Module:** `TauCeti/RepresentationTheory/Smooth/Derived`.

Let G be locally profinite with a cofinal family 𝒦 of compact open subgroups of pro-order invertible in A (for a locally pro-p group: p ∈ A^×). For K ∈ 𝒦 the permutation module A[G/K] = c-Ind_K^G A is projective in SmoothRep A G, RHom_G(A[G/K], V) = V^K, and A[G/K] is a compact object of D(G, A) (Hom out of it commutes with arbitrary direct sums). The family {A[G/K]}_{K ∈ 𝒦} generates D(G, A): a complex V with V^K acyclic for all K ∈ 𝒦 is 0. Hence D(G, A) is compactly generated, and the thick subcategory generated by these objects consists of compact objects (for Λ a ℤ_ℓ-algebra with ℓ ≠ p it is exactly the compact objects, as Fargues–Scholze state).

**Hypotheses.** G locally profinite with HasCofinalUnitProOrder A G.

**Construction or proof.**
1. Projectivity: Hom_G(A[G/K], −) = (−)^K is exact (invariants-exact).
2. RHom: derived-invariants with invertible pro-order.
3. Compactness: (−)^K commutes with direct sums (invariants-exact), and the derived Hom out of a projective object is computed termwise.
4. Generation: if V^K is acyclic for all K ∈ 𝒦 then H^n(V)^K = 0 by exactness, so H^n(V) = ⋃_K H^n(V)^K = 0.
5. Compact objects equal the thick closure: Neeman's theorem for compactly generated triangulated categories.

**Direct prerequisites.** `SmoothRepresentationsOfLocalGroups:SR.0:derived-extension/derived-invariants`, `SmoothRepresentationsOfLocalGroups:SR.0:derived-extension/k-injective-resolutions`, `SmoothRepresentationsOfLocalGroups:SR.0:abelian-category/invariants-exact`, `SmoothRepresentationsOfLocalGroups:SR.0:abelian-category/unit-pro-order`.

**Acceptance checks.**

- For G = ℤ_p and A = F_ℓ (ℓ ≠ p) the objects F_ℓ[ℤ_p/p^nℤ_p] are compact projective generators.
- For G = ℤ_p and A = F_p the trivial representation is not projective (Ext¹ ≠ 0), so the hypothesis cannot be dropped.
- For G = GL_2(ℚ_p) and A = ℤ[1/p] the congruence subgroups 1 + p^k M_2(ℤ_p) (k ≥ 1) form such a family.

**Sources.** `FS21`, Ch. I §5, Theorem I.5.1(iii), p. 24: Compactness in D(G_b(E), Λ) is equivalent to lying in the thick triangulated subcategory generated by c-Ind_K Λ, K running over open pro-p subgroups. `BERNSTEIN87`, §1.2, p. 3: The modules He for idempotents e are finitely generated projective objects and form a system of projective generators.

**Atlas planet:** Compact generators c-Ind_K Λ.

#### Derived smooth duality and admissible complexes

**Identifier:** `SmoothRepresentationsOfLocalGroups:SR.0:derived-extension/derived-smooth-dual`. **Kind:** construction. **Proposed name:** `TauCeti.SmoothRep.derivedSmoothDual`. **Module:** `TauCeti/RepresentationTheory/Smooth/Derived`.

On D(G, A) the derived smooth dual is the right derived functor of the left exact functor V ↦ (V*)^sm = smooth part of Hom_A(V, A): 𝔻(V) := R((−)*)^sm (V), characterised by Hom_{D(G,A)}(B, 𝔻(V)) ≅ Hom_{D(G,A)}(B ⊗^L_A V, A) for all B. A complex V is admissible if V^K is a perfect complex of A-modules for every K in a cofinal family of compact open subgroups of invertible pro-order. For such K, 𝔻(V)^K ≅ RHom_A(V^K, A); hence the dual of an admissible complex is admissible, and the natural map V → 𝔻𝔻(V) is an isomorphism for admissible V.

**Hypotheses.** G locally profinite with HasCofinalUnitProOrder A G (e.g. locally pro-p and p ∈ A^×).

**Construction or proof.**
1. Construct the derived internal Hom against the unit A using a K-flat replacement of the contravariant argument and a suitable injective model of the target; apply the derived smooth-part functor. Replacing V by a K-injective complex alone does not derive the contravariant functor Hom_A(V,A). The equivariant tensor/internal-Hom construction is an explicit gap.
2. Adjunction: in degree 0, Hom_G(B, (V*)^sm) = Hom_G(B ⊗_A V, A) (smooth-dual (1)); derive both sides.
3. Invariants: for K of invertible pro-order, (V*)^K = Hom_A(V^K, A) (smooth-dual (3)); deriving gives 𝔻(V)^K ≅ RHom_A(V^K, A).
4. Reflexivity: for a perfect complex P of A-modules, P → RHom_A(RHom_A(P, A), A) is an isomorphism; apply at every level K and use generation (compact-generation).

**Direct prerequisites.** `SmoothRepresentationsOfLocalGroups:SR.0:abelian-category/smooth-dual`, `SmoothRepresentationsOfLocalGroups:SR.0:derived-extension/dg-enhancement`, `SmoothRepresentationsOfLocalGroups:SR.0:derived-extension/compact-generation`, `SmoothRepresentationsOfLocalGroups:SR.0:derived-extension/k-injective-resolutions`.

**API.**

- `TauCeti.SmoothRep.derivedSmoothDual` (data): 𝔻 : D(G, A)ᵒᵖ ⥤ D(G, A), the derived functor of V ↦ (V*)^sm.
- `TauCeti.SmoothRep.hom_derivedSmoothDual` (universal-property): Hom(B, 𝔻V) ≅ Hom(B ⊗^L_A V, A), natural in B and V.
- `TauCeti.SmoothRep.IsAdmissibleComplex` (data): RΓ(K,V) is perfect over A for every compact open K of invertible pro-order; equivalently this can be checked on a cofinal basis of such K, since averaging makes each larger good-K complex a direct summand.
- `TauCeti.SmoothRep.invariants_derivedSmoothDual` (characterisation): 𝔻(V)^K ≅ RHom_A(V^K, A) for K of invertible pro-order.
- `TauCeti.SmoothRep.IsAdmissibleComplex.derivedSmoothDual` (relation): The dual of an admissible complex is admissible.
- `TauCeti.SmoothRep.toDoubleDual_isIso` (relation): V → 𝔻𝔻V is an isomorphism for admissible V.
- `TauCeti.SmoothRep.derivedSmoothDual_heart` (compatibility): On an admissible representation over a field in degree 0, 𝔻V is the smooth contragredient Ṽ in degree 0.

**Unit tests.**

- `TauCeti.SmoothRep.derivedSmoothDual_character` (computation): 𝔻(A(χ)) ≅ A(χ⁻¹) in degree 0.
- `TauCeti.SmoothRep.derivedSmoothDual_zero` (degenerate): 𝔻(0) = 0.
- `TauCeti.SmoothRep.not_isAdmissibleComplex_cInd` (non-example): For G = ℚ_p and A = F_ℓ (ℓ ≠ p), F_ℓ[ℚ_p/ℤ_p] in degree 0 is not an admissible complex.
- `TauCeti.SmoothRep.derivedSmoothDual_compat_smoothDual` (compatibility): For G = ℤ_p, A = F_ℓ (ℓ ≠ p) and V finite, 𝔻V agrees with the smooth contragredient of smooth-dual.

**Acceptance checks.**

- For V = A(χ) a smooth character in degree 0, 𝔻(V) = A(χ⁻¹).
- For V = A[G/K] with G non-compact, V is not admissible and 𝔻(V) is the space of all functions on G/K (non-smooth part removed), not A[G/K].
- Over a field k with invertible pro-orders, an admissible representation in degree 0 has 𝔻(V) = Ṽ in degree 0.

**Uses.** Fargues–Scholze 2021, Ch. V §1, Corollary V.1.4: smooth duality on D(G, Λ) corresponds to RHom_Λ(−, Λ) on [∗/G]. Fargues–Scholze 2021, Theorem I.5.1(v): admissible complexes: K-invariants perfect for all pro-p K; universally locally acyclic sheaves. HeckeStacksAndLocalShtukas:HS3: admissible complexes are reflexive and their smooth duals are admissible. IgusaVarietiesAndTorsionConcentration:IG.7: reflexive smooth duality for a bounded admissible complex. VStackSheavesAndLisseCategories:VS5: Verdier biduality and reflexivity on strata.

**Sources.** `FS21`, Ch. V §1, Corollary V.1.4 and proof, pp. 170–171: For G locally pro-p and Λ killed by an integer prime to p, the derived functor of the left-exact smooth duality V ↦ (V*)^sm on D(G, Λ) corresponds to RHom_Λ(−, Λ) on [∗/G]; its proof uses the adjunction Hom(B, (A*)^sm) = Hom(B ⊗^L A, Λ). `FS21`, Ch. I §5, Theorem I.5.1(v), p. 25: An object is admissible when its K-invariants are perfect for all pro-p open subgroups K. `STACKS`, Section 20.26, Definition 20.26.2 (Tag 06Y9), Lemmas 20.26.11–12 (Tags 079T, 06YF); chapter PDF pp. 55–57, version ed88ff78 (14 Jul 2026): Defines K-flatness through acyclic total tensor products and constructs non-equivariant flat replacements. The smooth equivariant version is an explicit gap in this packet.

#### Central characters separate Ext groups

**Identifier:** `SmoothRepresentationsOfLocalGroups:SR.0:derived-extension/central-ext-vanishing`. **Kind:** theorem. **Proposed name:** `TauCeti.SmoothRep.ext_eq_zero_of_centre`. **Module:** `TauCeti/RepresentationTheory/Smooth/Derived`.

Let z ∈ Z(G, A) (smooth-centre) act on smooth V by a scalar a and on W by a scalar b. Then (a − b) annihilates Ext^n_G(V, W) for every n; in particular if a − b ∈ A^× all Ext^n_G(V, W) vanish. For an abelian locally profinite group T and smooth characters χ, χ' with χ(t) − χ'(t) ∈ A^× for some t ∈ T, Ext^n_T(A(χ), A(χ')) = 0 for all n ≥ 0.

**Hypotheses.** G locally profinite; A commutative.

**Construction or proof.**
1. The centre acts on Ext^n_G(V, W) = Hom_D(V, W[n]) through V and through W, and the two actions agree because z is a natural transformation of the identity extended to the derived category.
2. Hence (a − b) acts as 0.
3. For T abelian, translation by t defines an element of the centre acting by χ(t) and χ'(t).

**Direct prerequisites.** `SmoothRepresentationsOfLocalGroups:SR.0:abelian-category/smooth-centre`, `SmoothRepresentationsOfLocalGroups:SR.0:derived-extension/derived-smooth-category`.

**Acceptance checks.**

- For T = ℚ_p^× and unramified characters χ ≠ χ' over a field, all Ext groups vanish.
- For χ = χ' the hypothesis fails and Ext¹_T(χ, χ) ≠ 0 for T = ℤ (discrete) over a field.
- Over A = ℤ_ℓ with χ ≡ χ' mod ℓ, χ(t) − χ'(t) ∈ ℓℤ_ℓ is not a unit and Ext can be nonzero ℓ-torsion.

**Sources.** `CG18`, arXiv v2 §9.2.1, proof of Lemma 9.12, p. 91: Uses that Ext^i(χ^v, χ^w) = 0 for all i when the Weyl conjugates χ^v, χ^w of the residual torus character are distinct (distinct reductions modulo ϖ). `BERNSTEIN87`, §1.5 and §1.8, pp. 5–8: Splittings of the category and the central algebra Z(M) = End(Id); categories attached to disjoint sets of irreducibles are orthogonal.

#### The derived Hecke algebra

**Identifier:** `SmoothRepresentationsOfLocalGroups:SR.0:derived-extension/derived-hecke-algebra`. **Kind:** construction. **Proposed name:** `TauCeti.SmoothRep.derivedHecke`. **Module:** `TauCeti/RepresentationTheory/Smooth/Derived`.

For a compact open U ≤ G and a commutative ring S, the derived Hecke algebra is the graded S-algebra H*(G, U; S) := Ext*_{SmoothRep S G}(S[G/U], S[G/U]) with product α · β = β after α under Yoneda composition (the opposite of the usual endomorphism-ring convention). It acts on the derived invariants H*(U, V) = Ext*_G(S[G/U], V) of every smooth V. Its degree-zero part is End_G(S[G/U])ᵒᵖ, hence H(G,U;S)ᵒᵖ in the SR.1 matrix convention. The inversion anti-isomorphism identifies it with H(G,U;S) if the basis convention is reversed explicitly. Shapiro's lemma gives the invariant-function model H*(G, U; S) ≅ ⊕_{x ∈ U\G/U} H*(U ∩ xUx⁻¹, S) as graded S-modules, with product given by restriction, conjugation and corestriction along double cosets (the double-coset model). More generally, for compact open U₁, U₂ the derived bimodules Ext*(S[G/U₁], S[G/U₂]) make H*(G, U₁) and H*(G, U₂) act compatibly, as for the derived Iwahori–Hecke algebra and its spherical bimodules.

**Hypotheses.** G locally profinite; S a commutative ring; U, U₁, U₂ compact open.

**Construction or proof.**
1. Ext groups exist (grothendieck-abelian); Yoneda composition makes Ext*(X, X) a graded ring.
2. Shapiro: Ext*_G(S[G/U], W) ≅ H*(U, W) (derived-invariants); for W = S[G/U] = ⊕ over U-orbits on G/U, the orbit of xU is S[U/(U ∩ xUx⁻¹)], whose U-cohomology is H*(U ∩ xUx⁻¹, S).
3. Products: compute the Yoneda product on the U-orbit decomposition, giving sums over double cosets of restriction, conjugation by x and corestriction (Venkatesh §2.4 and Appendix A).
4. Degree zero: the Ext⁰ identification is additive and respects α · β = β after α, giving End_G(S[G/U])ᵒᵖ. SR.1 identifies the matrix Hecke algebra with End_G(S[G/U]); inversion of double cosets gives the opposite comparison.

**Direct prerequisites.** `SmoothRepresentationsOfLocalGroups:SR.0:derived-extension/derived-invariants`, `SmoothRepresentationsOfLocalGroups:SR.0:derived-extension/grothendieck-abelian`, `SmoothRepresentationsOfLocalGroups:SR.1/permutation-hecke-algebra`, `mathlib:CategoryTheory.Abelian.Ext`; `mathlib:CategoryTheory.Abelian.Ext.comp`, `tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-10-continuous-cohomology-in-all-degrees`, `tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-12-the-graded-cup-product-in-all-degrees`.

**API.**

- `TauCeti.SmoothRep.derivedHecke` (data): H*(G,U;S) := Ext*_G(S[G/U],S[G/U]); α · β is β after α, with the Koszul grading.
- `TauCeti.SmoothRep.derivedHecke_zero` (simp): The degree-zero ring is End_G(S[G/U])ᵒᵖ ≅ H(G,U;S)ᵒᵖ in the matrix convention of SR.1.
- `TauCeti.SmoothRep.derivedHeckeAction` (data): The graded action of H*(G, U; S) on H*(U, V) = Ext*_G(S[G/U], V), natural in V.
- `TauCeti.SmoothRep.derivedHecke_equiv_doubleCoset` (characterisation): H*(G, U; S) ≅ ⊕_{x ∈ U\G/U} H*(U ∩ xUx⁻¹, S) as graded S-modules (Shapiro).
- `TauCeti.SmoothRep.derivedHecke_mul_doubleCoset` (relation): The product in the double-coset model is a sum over double cosets of restriction, conjugation and corestriction (Venkatesh §2.4, (25)).
- `TauCeti.SmoothRep.derivedBimodule` (data): Ext*_G(S[G/U₁],S[G/U₂]) has the left H*(G,U₁) action by precomposition and the right H*(G,U₂) action by postcomposition for the stated Yoneda product; at U₁ = U₂ it is derivedHecke.
- `TauCeti.SmoothRep.derivedHecke_of_unit` (relation): If HasUnitProOrder S U the derived Hecke algebra is concentrated in degree 0.

**Unit tests.**

- `TauCeti.SmoothRep.derivedHecke_padicInt` (computation): For G = U = ℤ_p and S = F_p, H¹(G, U; F_p) ≅ F_p and H^i = 0 for i ≥ 2.
- `TauCeti.SmoothRep.derivedHecke_unit_degree_zero` (degenerate): For U of invertible pro-order in S, H^i(G, U; S) = 0 for i > 0.
- `TauCeti.SmoothRep.derivedHecke_zero_compat` (compatibility): H⁰(G,U;S) ≅ H(G,U;S)ᵒᵖ, where H is the double-coset Hecke ring of SR.1 with its matrix convention. Inversion gives a second identification with H and must not silently change the chosen basis.
- `TauCeti.SmoothRep.derivedHecke_normal` (computation): For G = ℤ_p × D with D discrete and S = F_p, degree n identifies as an S-module with S[D] ⊗_S H^n_cont(ℤ_p,S). The graded product uses the stated Yoneda opposite convention. A non-split normal extension also requires conjugation and extension cocycles.

**Acceptance checks.**

- For S = F_p and G = U = ℤ_p, H*(G, U; F_p) = H*(ℤ_p, F_p), the exterior algebra on one class of degree 1.
- If U has invertible pro-order in S, H*(G, U; S) is concentrated in degree 0 and equals the Hecke algebra.
- For G = GL_n(ℚ_v), U = GL_n(ℤ_v) and S = ℤ/ℓ^r with q_v ≡ 1 mod ℓ^r, the degree-zero part is the spherical Hecke algebra over S.

**Uses.** Venkatesh 2019, §2.2, Definition 2.2: the local derived Hecke algebra. Venkatesh 2019, §§2.3–2.4 and Appendix A: the invariant-function and double-coset models and their identification. Venkatesh 2019, §4.6: derived Iwahori–Hecke algebra and derived bimodules. ArithmeticLocallySymmetricSpacesPartII: the global derived Hecke algebra as a product of local ones acting on cohomology of arithmetic groups.

**Sources.** `VENKATESH19`, §2.2, Definition 2.2 and equation (21), p. 16: Defines the local derived Hecke algebra as the Ext algebra of S[G/U] in the category of smooth S[G]-modules. `VENKATESH19`, §2.3, equations (22)–(24), pp. 16–17; §2.4, equation (25), pp. 17–18: Describes the invariant-function and double-coset models of the derived Hecke algebra and its product. `VENKATESH19`, Appendix A, §§A.1–A.11 and Lemma A.10, pp. 104–112: Identifies the different models of the derived Hecke algebra. `VENKATESH19`, §4.6, p. 40: The derived Iwahori–Hecke algebra and the derived bimodules between Iwahori and spherical level.

**Atlas planet:** Derived Hecke algebra.

### SR.2. Induction, compact induction and Jacquet functors

Smooth induction from a closed subgroup, and compact induction with support compact modulo the subgroup. The layer gives Frobenius reciprocity in both directions (for open subgroups, compact induction is Mathlib's algebraic induction), exactness when the relevant pro-orders are invertible, induction in stages, invariants of induced representations, the l-sheaf model on H\G and the Mackey filtration. For a parabolic pair P = MN it gives the modulus character, the Jacquet module and its exactness, normalised parabolic induction, first adjointness, contragredients of induced representations and the geometric lemma. It closes with Jacquet modules of principal series, Casselman's pairing, Jacquet's lemma on invariants with the canonical lifting, Iwahori invariants as Jacquet-module invariants, and Whittaker functionals.

**Planets of this layer:** Smooth and compact induction (`smooth-induction`); Jacquet functor (`jacquet-module`); Normalised parabolic induction (`parabolic-induction`); Geometric lemma (`geometric-lemma`); Casselman's pairing (`casselman-pairing`); Canonical lifting (`jacquet-invariants`).

#### Smooth induction from a closed subgroup

**Identifier:** `SmoothRepresentationsOfLocalGroups:SR.2/smooth-induction`. **Kind:** construction. **Proposed name:** `TauCeti.SmoothRep.ind`. **Module:** `TauCeti/RepresentationTheory/Smooth/Induction`.

Let H be a closed subgroup of a locally profinite G and (σ, W) a smooth representation of H over A. Ind_H^G σ is the space of functions f : G → W with f(hg) = σ(h) f(g) (h ∈ H) that are right invariant under some compact open subgroup of G, with G acting by right translation. Equivalently it is the smooth part (SR.0 smooth-vectors) of Mathlib's algebraic coinduction Representation.coind along H ↪ G. It is an A-linear functor SmoothRep A H ⥤ SmoothRep A G (unnormalised: no modulus character).

**Hypotheses.** G locally profinite; H ≤ G closed; A commutative.

**Construction or proof.**
1. The defining conditions are A-linear and stable under right translation; right local constancy is smoothness.
2. Comparison with coinduction: Representation.coind consists of all functions with the equivariance f(hg) = σ(h)f(g) (after inverting the convention), and the smooth vectors are those right invariant under an open subgroup.

**Direct prerequisites.** `SmoothRepresentationsOfLocalGroups:SR.0:abelian-category/smooth-vectors`, `SmoothRepresentationsOfLocalGroups:SR.0:abelian-category/smooth-rep-category`, `mathlib:Representation.coind`.

**API.**

- `TauCeti.SmoothRep.ind` (data): Ind_H^G σ: right-smooth f : G → W with f(hg) = σ(h)f(g), right translation action.
- `TauCeti.SmoothRep.indFunctor` (functoriality): The A-linear functor SmoothRep A H ⥤ SmoothRep A G, with map_id and map_comp.
- `TauCeti.SmoothRep.ind_apply_mul` (simp): f(hg) = σ(h) f(g) and (g'·f)(g) = f(g g').
- `TauCeti.SmoothRep.indEval` (projection): Evaluation at 1, an H-map Ind_H^G σ → σ; surjective; nonzero on every nonzero G-subrepresentation.
- `TauCeti.SmoothRep.ind_eq_smoothVectors_coind` (compatibility): Ind_H^G σ is the smooth part of Mathlib's Representation.coind along H.subtype.
- `TauCeti.SmoothRep.ind_twist` (relation): Ind_H^G(σ ⊗ χ|_H) ≅ (Ind_H^G σ) ⊗ χ for a smooth character χ of G.

**Unit tests.**

- `TauCeti.SmoothRep.ind_self` (degenerate): Ind_G^G σ ≅ σ.
- `TauCeti.SmoothRep.ind_bot_padicInt` (computation): For G = ℤ_p and H = ⊥, Ind_H^G A ≅ LocallyConstant ℤ_p A with translation.
- `TauCeti.SmoothRep.ind_ne_coind` (non-example): For G = ℤ_p, H = ⊥ and A = ℤ, Ind_H^G ℤ ≠ coind (the characteristic function of a non-open set is in coind but not smooth).
- `TauCeti.SmoothRep.ind_borel_gl2` (computation): For G = GL_2(ℚ_p) and H = B, Ind_B^G 1 ≅ locally constant functions on ℙ¹(ℚ_p).

**Acceptance checks.**

- For H = G, Ind_G^G σ ≅ σ via f ↦ f(1).
- For H = {1} and G = ℤ_p, Ind σ is the space of locally constant functions ℤ_p → W.
- For G = GL_2(ℚ_p) and H = B, Ind_B^G 1 is the space C^∞(B\G) = C^∞(ℙ¹(ℚ_p)) of locally constant functions on the projective line.

**Uses.** Casselman 1995, §2.4: smooth and compact induction from a closed subgroup with Frobenius reciprocity. Bernstein 1992, Ch. I §3.2: Ind as the smooth part of H-equivariant functions, right adjoint to restriction. Pan 2026, §5.1.9: the ordinary part of completed cohomology as a smooth induction from the Borel subgroup of GL_2(ℚ_p). IgusaVarietiesAndTorsionConcentration:IG.1: unnormalised smooth parabolic induction for J_b(ℚ_p) × G(𝔸_f^p). PotentialAutomorphyInfrastructure:PA.2: exact smooth parabolic induction preserving injectives with coefficients O/ϖ^m. SmoothRepresentationsOfLocalGroups:SR.2/parabolic-induction: normalised parabolic induction is Ind_P^G of the twisted inflation.

**Sources.** `CASSELMAN95`, §2.4, definitions and Theorem 2.4.1(a)–(c), p. 26: Defines unnormalised Ind_H^G σ and c-Ind_H^G σ for closed H, shows they are smooth and that evaluation at 1 is a surjective H-map nonzero on every nonzero G-subspace. `BERNSTEIN92`, Ch. I §3.2 Claim, p. 16: Ind_H^G V is the smooth part of {f : G → V | f(hg) = ρ(h)f(g)} with right translation, right adjoint to restriction. `BZ77`, §1.8(a), p. 444: Induction from a closed subgroup (with characters and modulus factors) and its compact version.

**Atlas planet:** Smooth and compact induction.

#### Compact induction

**Identifier:** `SmoothRepresentationsOfLocalGroups:SR.2/compact-induction`. **Kind:** construction. **Proposed name:** `TauCeti.SmoothRep.cInd`. **Module:** `TauCeti/RepresentationTheory/Smooth/Induction`.

For H closed in G and σ smooth on H, c-Ind_H^G σ ⊆ Ind_H^G σ is the subrepresentation of functions whose support is compact modulo H (has compact image in H\G). If H\G is compact, c-Ind = Ind. If H is open, f ↦ Σ_{gH ∈ G/H} g ⊗ f(g⁻¹) identifies c-Ind_H^G σ with Mathlib's algebraic induction Rep.ind along H.subtype (A[G] ⊗_{A[H]} σ); in particular c-Ind_U^G A = A[G/U] for a compact open U (Tau Ceti's indTrivialIso), and c-Ind_U^G A is generated by the characteristic function of U.

**Hypotheses.** G locally profinite; H closed (open for the algebraic comparison); A commutative.

**Construction or proof.**
1. Support condition preserved by right translation and by sums.
2. Compact quotient: every support is compact modulo H.
3. Open H: functions compactly supported modulo H are finite sums of functions supported on single cosets Hg, matching the basis g ⊗ w of A[G] ⊗_{A[H]} W.

**Direct prerequisites.** `SmoothRepresentationsOfLocalGroups:SR.2/smooth-induction`, `mathlib:Rep.ind`, `tauceti:TauCeti.indTrivialIso`.

**API.**

- `TauCeti.SmoothRep.cInd` (data): c-Ind_H^G σ ⊆ Ind_H^G σ: support compact modulo H.
- `TauCeti.SmoothRep.cIndFunctor` (functoriality): The A-linear functor SmoothRep A H ⥤ SmoothRep A G.
- `TauCeti.SmoothRep.cInd_eq_ind_of_compact` (relation): If H\G is compact, c-Ind_H^G = Ind_H^G.
- `TauCeti.SmoothRep.cIndIsoInd` (compatibility): For H open, c-Ind_H^G σ ≅ Rep.ind H.subtype σ (Mathlib's algebraic induction), naturally in σ.
- `TauCeti.SmoothRep.cInd_trivial_eq_permutation` (example): c-Ind_U^G A ≅ A[G/U] for U open (via Tau Ceti's indTrivialIso).
- `TauCeti.SmoothRep.cInd_mem_iff_support` (characterisation): f ∈ c-Ind iff f ∈ Ind and the image of supp f in H\G is compact.

**Unit tests.**

- `TauCeti.SmoothRep.cInd_padic` (computation): c-Ind_{ℤ_p}^{ℚ_p} A ≅ A[ℚ_p ⧸ ℤ_p].
- `TauCeti.SmoothRep.cInd_self` (degenerate): c-Ind_G^G σ ≅ σ.
- `TauCeti.SmoothRep.cInd_ne_ind` (non-example): For G = ℚ_p and H = {0}, the constant function 1 lies in Ind but not in c-Ind.
- `TauCeti.SmoothRep.cInd_open_compat` (compatibility): For G = ZMod 4 (discrete) and H = {0, 2}, c-Ind_H^G agrees with Rep.ind H.subtype.

**Acceptance checks.**

- c-Ind_{ℤ_p}^{ℚ_p} 1 = A[ℚ_p/ℤ_p].
- For G = GL_2(ℚ_p) and H = Z·GL_2(ℤ_p) (open, compact mod centre), c-Ind_H^G of an inflated cuspidal representation of GL_2(F_p) is a depth-zero supercuspidal representation.
- For H = B in GL_2(ℚ_p), c-Ind_B^G = Ind_B^G since B\G = ℙ¹(ℚ_p) is compact.

**Uses.** Casselman 1995, §2.4 and Theorem 2.4.2: compact induction and its contragredient. HeckeStacksAndLocalShtukas:HS3: c-Ind_K^H Λ from open K with Hom_H(c-Ind_K Λ, ρ) = ρ^K. ExcursionOperatorsAndSpectralAction:ES2: compact induction from the closed unipotent U(E) of a generic character. VStackSheavesAndLisseCategories:VS4: c-Ind_K Λ for open pro-p K. SmoothRepresentationsOfLocalGroups:SR.0:derived-extension/compact-generation: the compact generators c-Ind_K^G Λ. SmoothRepresentationsOfLocalGroups:SR.3/cuspidal-representations: compact induction from open compact-mod-centre subgroups produces cuspidal representations.

**Sources.** `CASSELMAN95`, §2.4, p. 26; Theorem 2.4.1(d): c-Ind_H^G σ is the subspace of compactly supported functions modulo H; when H\G is compact and σ admissible, Ind = c-Ind. `BERNSTEIN92`, Ch. I §3.2 and Proposition 9(1),(3), pp. 16–17: ind ⊆ Ind, with equality when H\G is compact. `BZ76`, Ch. I §2, 2.21–2.27, p. 21: Induced and compactly induced representations of l-groups.

#### Frobenius reciprocity for smooth induction

**Identifier:** `SmoothRepresentationsOfLocalGroups:SR.2/frobenius-reciprocity`. **Kind:** theorem. **Proposed name:** `TauCeti.SmoothRep.indResAdjunction`. **Module:** `TauCeti/RepresentationTheory/Smooth/Induction`.

For H closed in G, a smooth G-representation π and a smooth H-representation σ over any commutative A, composition with evaluation at 1 gives a natural isomorphism Hom_G(π, Ind_H^G σ) ≅ Hom_H(π|_H, σ): smooth induction is right adjoint to restriction. For H open, compact induction is left adjoint to restriction, Hom_G(c-Ind_H^G σ, π) ≅ Hom_H(σ, π|_H), and under compact-induction's comparison this is Mathlib's Rep.indResAdjunction; in particular Hom_G(A[G/U], π) ≅ π^U. For H closed but not open, c-Ind_H^G is not in general left adjoint to restriction.

**Hypotheses.** G locally profinite; H closed (open for the second adjunction); A commutative.

**Construction or proof.**
1. Given φ : π → σ, set Φ(v)(g) = φ(π(g)v); smoothness of v makes Φ(v) right-smooth; Φ is G-equivariant; inverse by evaluation at 1.
2. For H open: restriction to functions supported on H identifies c-Ind with A[G] ⊗_{A[H]} σ; transport Mathlib's indResAdjunction.
3. Hom_G(A[G/U], π) = Hom_U(A, π) = π^U.

**Direct prerequisites.** `SmoothRepresentationsOfLocalGroups:SR.2/smooth-induction`, `SmoothRepresentationsOfLocalGroups:SR.2/compact-induction`, `mathlib:Rep.indResAdjunction`.

**Acceptance checks.**

- For π = Ind_H^G σ the counit is evaluation at 1.
- For H = U compact open and σ trivial: Hom_G(A[G/U], π) ≅ π^U.
- For H = {0} in G = ℚ_p (closed, not open) and A = ℂ: Hom_G(c-Ind_{0}^{ℚ_p} ℂ, ℂ) ≠ Hom_{0}(ℂ, ℂ) = ℂ fails in the expected form — the invariant functionals on C_c^∞(ℚ_p) are the Haar integrals, one-dimensional but not via evaluation, illustrating the modulus-twisted form of induced-contragredient.

**Sources.** `CASSELMAN95`, Theorem 2.4.1(e), p. 26: Composition with evaluation at 1 identifies Hom_G(V, Ind σ) with Hom_H(V, U) for every smooth V. `BZ77`, §1.9(b), p. 445: The localisation functor r_{U,θ} is left adjoint to I_{U,θ}; for U = {e} this is Frobenius reciprocity for Ind. `BZ76`, Ch. I §2, 2.28–2.29, p. 23: Frobenius duality for induced and compactly induced representations.

#### Exactness of induction

**Identifier:** `SmoothRepresentationsOfLocalGroups:SR.2/induction-exactness`. **Kind:** theorem. **Proposed name:** `TauCeti.SmoothRep.cIndFunctor_exact`. **Module:** `TauCeti/RepresentationTheory/Smooth/Induction`.

For H closed in G and any commutative A: (a) c-Ind_H^G is exact; (b) Ind_H^G is exact if H\G is compact; (c) Ind_H^G is exact when every compact open subgroup of H has invertible pro-order in A (e.g. complex coefficients). In general Ind_H^G is left exact (as a right adjoint) and preserves products, and c-Ind_H^G preserves direct sums. For H\G compact both preserve admissibility.

**Hypotheses.** G locally profinite; H closed; A commutative (with the stated extra hypotheses).

**Construction or proof.**
1. (a): a function in c-Ind_H^G σ' is determined on finitely many double cosets H x K; on each, the values are a locally constant function on x K with the H ∩ xKx⁻¹-equivariance; since the compact group x⁻¹Hx ∩ K has a continuous section K → (x⁻¹Hx ∩ K)\K, a lift is obtained pointwise from a lift of f(x) in σ and is locally constant because σ is smooth.
2. (b): (a) with Ind = c-Ind.
3. (c): with invertible pro-orders one lifts f(x) ∈ σ'^{H ∩ xKx⁻¹} to σ^{H ∩ xKx⁻¹} by averaging, uniformly in x.
4. Admissibility: (Ind σ)^K ≅ ⊕_{x ∈ H\G/K} σ^{H ∩ xKx⁻¹} (induced-invariants), a finite sum when H\G is compact.

**Direct prerequisites.** `SmoothRepresentationsOfLocalGroups:SR.2/compact-induction`, `SmoothRepresentationsOfLocalGroups:SR.2/induced-invariants`, `SmoothRepresentationsOfLocalGroups:SR.0:abelian-category/invariants-exact`, `tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-0-discrete-modules-and-continuous-sections`.

**Acceptance checks.**

- Over ℂ, Ind_B^G and c-Ind_B^G = Ind_B^G are exact (Casselman 2.4.4; Bernstein 1992 Proposition 9(2)).
- c-Ind_U^G is exact for U open over any A (it is A[G] ⊗_{A[U]} −, with A[G] free over A[U]).
- Over F_p, c-Ind_{GL_2(ℤ_p)}^{GL_2(ℚ_p)} is exact although GL_2(ℤ_p)-invariants are not.

**Sources.** `BZ77`, §1.9(a),(e), p. 445: The induction functors I_{U,θ} and i_{U,θ} are exact; when G is compact modulo P they coincide and preserve admissibility (complex coefficients). `CASSELMAN95`, Proposition 2.4.4, p. 28: Ind preserves injections and surjections, so σ ⇝ Ind σ is exact (complex coefficients). `BERNSTEIN92`, Ch. I Proposition 9(2),(4), pp. 16–17: ind and Ind are exact, and for compact H\G induction preserves admissibility.

#### Induction in stages

**Identifier:** `SmoothRepresentationsOfLocalGroups:SR.2/induction-in-stages`. **Kind:** theorem. **Proposed name:** `TauCeti.SmoothRep.indIndIso`. **Module:** `TauCeti/RepresentationTheory/Smooth/Induction`.

For closed subgroups K ≤ H ≤ G there are natural isomorphisms Ind_H^G ∘ Ind_K^H ≅ Ind_K^G and c-Ind_H^G ∘ c-Ind_K^H ≅ c-Ind_K^G, given by f ↦ (g ↦ f(g)(1)). For open subgroups the compact version agrees, under compact-induction's comparison, with Tau Ceti's transitivity of algebraic induction (indFunctorCompIso, InductionRestriction Layer 0), and the projection formula c-Ind_H^G(σ ⊗ π|_H) ≅ c-Ind_H^G σ ⊗ π holds (Tau Ceti's indProjection for open H).

**Hypotheses.** G locally profinite; K ≤ H ≤ G closed; A commutative.

**Construction or proof.**
1. The map F ↦ (g ↦ F(g)(1)) and its inverse f ↦ (g ↦ (h ↦ f(hg))) preserve equivariance and smoothness; compact supports correspond because K\G → H\G is proper on supports.
2. Open case: both sides are algebraic induction; compare with indFunctorCompIso.
3. Projection formula: f ⊗ v ↦ (g ↦ f(g) ⊗ π(g)v).

**Direct prerequisites.** `SmoothRepresentationsOfLocalGroups:SR.2/smooth-induction`, `SmoothRepresentationsOfLocalGroups:SR.2/compact-induction`, `tauceti:TauCeti.Rep.indFunctorCompIso`, `tauceti:TauCeti.indProjection`, `tauceti:TauCetiRoadmap/RepresentationTheory/InductionRestriction#layer-0-the-functorial-core----transitivity-and-the-projection-formula`.

**Acceptance checks.**

- Normalised parabolic induction in stages i_P^G ∘ i_{Q∩M}^M ≅ i_Q^G (parabolic-induction).
- For K = H the isomorphism is the identity.
- For G finite discrete, it is transitivity of induction of representations of finite groups.

**Sources.** `CASSELMAN95`, Proposition 2.4.5, p. 28: Ind_{H₂}^G σ ≅ Ind_{H₁}^G(Ind_{H₂}^{H₁} σ) for closed H₂ ⊆ H₁. `BZ77`, §1.9(c), p. 445: Induction in stages for the induction functors I and i.

#### Invariants of induced representations

**Identifier:** `SmoothRepresentationsOfLocalGroups:SR.2/induced-invariants`. **Kind:** theorem. **Proposed name:** `TauCeti.SmoothRep.invariants_ind_equiv`. **Module:** `TauCeti/RepresentationTheory/Smooth/Induction`.

For H closed, σ smooth on H and K compact open in G, evaluation at representatives gives (Ind_H^G σ)^K ≅ ∏_{x ∈ H\G/K} σ^{H ∩ xKx⁻¹} and (c-Ind_H^G σ)^K ≅ ⊕_{x ∈ H\G/K} σ^{H ∩ xKx⁻¹}. In particular, if G = H K then (Ind_H^G σ)^K ≅ σ^{H ∩ K}; and for a parabolic P = MN and K with an Iwahori decomposition, (Ind_P^G σ)^K ≅ ⊕_{x ∈ P\G/K} σ^{pr_M(P ∩ xKx⁻¹)} (M-components, N acting trivially).

**Hypotheses.** G locally profinite; H closed; K compact open; A commutative.

**Construction or proof.**
1. A right K-invariant f is determined by its values on representatives x of H\G/K, and f(x) is fixed by H ∩ xKx⁻¹ because f(hx) = σ(h)f(x) and hx = xk.
2. Conversely any such family defines f on each double coset H x K consistently.
3. Compact support modulo H means finitely many double cosets in the support.

**Direct prerequisites.** `SmoothRepresentationsOfLocalGroups:SR.2/smooth-induction`, `SmoothRepresentationsOfLocalGroups:SR.2/compact-induction`, `SmoothRepresentationsOfLocalGroups:SR.0:abelian-category/compact-open-invariants`, `ReductiveGroupsPartII:RG2.4`.

**Acceptance checks.**

- GL_2(ℚ_p), unramified χ: dim (i_B χ)^{GL_2(ℤ_p)} = 1 (Iwasawa G = B GL_2(ℤ_p)), and dim (i_B χ)^{I} = |W| = 2 for the Iwahori I.
- GSp_4(ℚ_ℓ), unramified generic principal series: dim π^{Kli(ℓ)} = 4 = |W/W_{Kli}| and dim π^{Iw} = 8 = 2 dim π^{Kli} = 8 dim π^{Sph}.
- Ramified χ (nontrivial on T(ℤ_p)): (i_B χ)^{GL_2(ℤ_p)} = 0.

**Uses.** ArithmeticLocallySymmetricSpaces:ALS.4: V = Ind_P^G W ⇒ V^U ≅ W^{U_P} for G = PU, to identify boundary strata Hecke-equivariantly. Bernstein 1987, §2.3(vii): K-invariant vectors of induced modules as a finite sum of invariants of compact open subgroups of M. Calegari–Geraghty 2018, proof of Theorem 9.16 (arXiv v2 §9.2.1, p. 93): parahoric invariants of n-Ind_B^G of a character. Pilloni 2020, Proposition 5.1.5.1: dimension of Klingen invariants of a generic spherical representation of GSp_4. Calegari–Geraghty 2020, §1.3: Iwahori, Klingen and spherical fixed vectors of unramified representations of GSp_4.

**Sources.** `BERNSTEIN87`, §2.3(vii), Lemma, p. 11: For a standard parabolic pair and representatives g_i of P\G/K, E^K ≅ ⊕_i V^{Γ_i} with Γ_i = pr_{P→M}(P ∩ g_iKg_i⁻¹). `BERNSTEIN92`, Ch. I Proposition 9(4) and proof, pp. 16–17: An element of L(V)^K is determined by its values on representatives of H\G/K, each fixed by H ∩ g_iKg_i⁻¹. `PILLONI20`, §5.1.5, Proposition 5.1.5.1, p. 22: For a generic spherical representation of GSp_4(ℚ_ℓ), the Klingen invariants are four-dimensional with U-eigenvalues forming a Weyl orbit. `CG20`, §1.3 (Recent developments), pp. 4–5 (arXiv v1): For the unramified generic local components in question, dim Π^Iw = 8 = 2 dim Π^Kli = 8 dim Π^Sph, 8 being the order of the Weyl group of GSp_4.

#### Induced representations as sections over H\G

**Identifier:** `SmoothRepresentationsOfLocalGroups:SR.2/l-sheaf-model`. **Kind:** construction. **Proposed name:** `TauCeti.SmoothRep.indSheaf`. **Module:** `TauCeti/RepresentationTheory/Smooth/Induction`.

For H closed in G and σ smooth on H, there is a G-equivariant sheaf 𝓕_σ of A-modules on the l-space X = H\G (an l-sheaf: stalk σ at the base point) such that Ind_H^G σ is its space of smooth sections and c-Ind_H^G σ its space of compactly supported sections. For an open G'-stable (for G' ≤ G closed) subset Y ⊆ X with closed complement Z, restriction gives a short exact sequence of G'-representations 0 → Γ_c(Y, 𝓕_σ) → c-Ind_H^G σ → Γ_c(Z, 𝓕_σ) → 0. The functor σ ↦ 𝓕_σ is an equivalence between smooth H-representations and G-equivariant l-sheaves on H\G.

**Hypotheses.** G locally profinite and countable at infinity; H closed; A commutative.

**Construction or proof.**
1. Define 𝓕_σ(V) for V ⊆ X open as the smooth functions on the preimage of V with the H-equivariance; stalk at H·1 is σ.
2. Exact sequence: open-closed-sequence applied to the sheaf (Bernstein 1992 Ch. I Proposition 4(2); BZ77 5.11).
3. Equivalence with equivariant l-sheaves: BZ77 5.14.

**Direct prerequisites.** `SmoothRepresentationsOfLocalGroups:SR.2/smooth-induction`, `SmoothRepresentationsOfLocalGroups:SR.2/compact-induction`, `SmoothRepresentationsOfLocalGroups:SR.1/open-closed-sequence`, `SmoothRepresentationsOfLocalGroups:SR.1/locally-constant-compact-support`.

**API.**

- `TauCeti.SmoothRep.indSheaf` (data): The G-equivariant l-sheaf 𝓕_σ on H\G.
- `TauCeti.SmoothRep.ind_equiv_sections` (equivalence): Ind_H^G σ ≃ smooth sections, c-Ind_H^G σ ≃ compactly supported sections.
- `TauCeti.SmoothRep.cInd_shortExact_open` (relation): For Y ⊆ H\G open and G'-stable: 0 → Γ_c(Y) → c-Ind → Γ_c(Z) → 0 exact.
- `TauCeti.SmoothRep.indSheafEquiv` (equivalence): σ ↦ 𝓕_σ is an equivalence SmoothRep A H ≌ G-equivariant l-sheaves on H\G (G countable at infinity).
- `TauCeti.SmoothRep.indSheaf_stalk` (simp): The stalk of 𝓕_σ at the base point is σ.

**Unit tests.**

- `TauCeti.SmoothRep.indSheaf_point` (degenerate): For H = G, sections over the point are σ.
- `TauCeti.SmoothRep.cInd_shortExact_gl2` (computation): For GL_2(ℚ_p), B and Y = big cell: the kernel term is C_c^∞(ℚ_p, A) twisted by χ, the quotient is one-dimensional.
- `TauCeti.SmoothRep.indSheaf_trivial_subgroup` (compatibility): For H = ⊥, compactly supported sections are C_c^∞(G, W) of SR.1.
- `TauCeti.SmoothRep.indSheaf_not_open_sections` (non-example): Sections over Z = {∞} are not a subrepresentation of i_B χ but a quotient: the sequence does not split as B-representations for χ = δ_B^{1/2}.

**Acceptance checks.**

- G = GL_2(ℚ_p), H = B, X = ℙ¹(ℚ_p), Y = ℚ_p (the big cell), Z = {∞}: 0 → C_c^∞(ℚ_p, χ) → i_B χ → χ' → 0 as B-representations, the sequence behind the Jacquet module of a principal series.
- For H = G, X is a point and 𝓕_σ = σ.
- For H = {1}, 𝓕 is the constant sheaf and c-Ind = C_c^∞(G, W).

**Uses.** Pan 2026, §5.1.9: the ordinary part as smooth induction from B to GL_2(ℚ_p), realised on the rational points of the flag variety. SmoothRepresentationsOfLocalGroups:SR.2/mackey-filtration: the open–closed filtration by orbits. SmoothRepresentationsOfLocalGroups:SR.2/geometric-lemma: the orbit filtration of r_Q ∘ i_P. SmoothRepresentationsOfLocalGroups:SR.2a/second-adjunction-unit: the open orbit of P̄ on P\G gives the unit of the second adjunction.

**Sources.** `BZ77`, §5.10–5.14, pp. 463–465: l-sheaves and nondegenerate S(X)-modules, the exact sequence for an open subset, and the equivalence of smooth P-representations with G-equivariant l-sheaves on P\G, compactly supported sections giving compact induction. `BERNSTEIN92`, Ch. I §1.3, Theorem 1, Propositions 3–4, pp. 9–10; §3.2, p. 16: Sheaves on l-spaces as nondegenerate S(X)-modules, exactness of π_! and the open–closed sequences; Ind as sections of a G-equivariant sheaf on H\G. `CASSELMAN95`, §6.1 and Lemma 6.1.1, pp. 52–53: Induced representations as compactly supported locally constant sections of an associated bundle, and the exact sequence for an H-stable closed subvariety. `PAN26`, §5.1.9, p. 54: The ordinary sheaf H¹_ord as a smooth induction from the Borel subgroup of GL_2(ℚ_p), realised on ℙ¹(ℚ_p).

#### The Mackey filtration

**Identifier:** `SmoothRepresentationsOfLocalGroups:SR.2/mackey-filtration`. **Kind:** theorem. **Proposed name:** `TauCeti.SmoothRep.mackeyFiltration`. **Module:** `TauCeti/RepresentationTheory/Smooth/Induction`.

Let H, Q be closed subgroups of G such that Q has finitely many orbits on X = H\G, each locally closed, numbered Z₁, …, Z_k so that Y_i = Z₁ ∪ … ∪ Z_i is open. Then the restriction to Q of c-Ind_H^G σ has a Q-stable filtration 0 = F₀ ⊆ F₁ ⊆ … ⊆ F_k with F_i/F_{i−1} ≅ c-Ind_{Q ∩ x_i⁻¹Hx_i}^Q (x_i⁻¹ · σ), x_i ∈ G a representative of Z_i. For H, Q open (in particular G finite) this is the Mackey decomposition, a direct sum (Tau Ceti's Rep.mackeyDecomposition).

**Hypotheses.** G locally profinite, countable at infinity; H, Q closed; finitely many locally closed Q-orbits on H\G.

**Construction or proof.**
1. Apply l-sheaf-model to the filtration Y₁ ⊆ … ⊆ Y_k of X by open Q-stable subsets.
2. Compactly supported sections over the orbit Z_i ≅ (Q ∩ x_i⁻¹Hx_i)\Q form the compact induction from the stabiliser.

**Direct prerequisites.** `SmoothRepresentationsOfLocalGroups:SR.2/l-sheaf-model`, `tauceti:Rep.mackeyDecomposition`, `tauceti:TauCetiRoadmap/RepresentationTheory/InductionRestriction#layer-3-the-mackey-decomposition-formula`.

**Acceptance checks.**

- GL_2, H = Q = B: two orbits (the big cell, open, and the point, closed); F₁ = C_c^∞(big cell) ≅ c-Ind_T^B(wχ) and F₂/F₁ ≅ χ.
- H open: all orbits open and the filtration splits (Mackey decomposition).
- Q = G: one orbit, F₁ = c-Ind_H^G σ.

**Sources.** `BZ77`, §5.1–5.2, pp. 459–460; §5.10–5.14: Under conditions (1)–(4), the composite of a localisation functor and compact induction is glued from the functors attached to the Q-orbits on P\G, ordered so that partial unions are open. `CASSELMAN95`, Propositions 6.3.1–6.3.2, p. 56: The Bruhat filtration of i_{P_Θ}^G σ by P_Ω-stable subspaces with graded pieces compact inductions from x⁻¹P_Θx ∩ P_Ω.

#### The modulus character and its square root

**Identifier:** `SmoothRepresentationsOfLocalGroups:SR.2/modulus-character`. **Kind:** definition. **Proposed name:** `TauCeti.modulusCharacter`. **Module:** `TauCeti/RepresentationTheory/Smooth/Jacquet`.

For a closed subgroup N of G normalised by m ∈ G, the module mod_N(m) is the factor by which conjugation u ↦ m u m⁻¹ scales a Haar measure of N; for a compact open N₀ ⊆ N it is [mN₀m⁻¹ : mN₀m⁻¹ ∩ N₀]/[N₀ : mN₀m⁻¹ ∩ N₀] ∈ ℚ_{>0}. For a parabolic pair P = M ⋉ N of a reductive group over F with residue cardinality q, δ_P := mod_N : P → q^ℤ ⊆ ℤ[1/q]^×, trivial on N, equals |det(Ad(p)|Lie N)|_F and equals Mathlib's modular character of P (μ(E p⁻¹)/μ(E) for a left Haar measure μ of P). As a smooth character it has values in any A ∋ q⁻¹. A square root δ_P^{1/2} : P → Aˣ is fixed by choosing q^{1/2} ∈ Aˣ, which is a choice of coefficients, not part of the group data.

**Hypotheses.** G locally profinite; P = M ⋉ N closed with N a union of compact open subgroups; A ∋ q^{−1} (and q^{±1/2} for the square root).

**Construction or proof.**
1. Independence of N₀: two compact open subgroups of N are commensurable, and the index ratio is multiplicative.
2. Character: mod_N(mm') = mod_N(m) mod_N(m').
3. Comparison with the determinant: for a unipotent group N with a filtration by root subgroups, conjugation acts on N₀-volumes by |det Ad|.
4. Comparison with Mathlib: the left Haar measure of P = M ⋉ N is dm·dn, and right translation by m⁻¹ scales it by mod_N(m) (M unimodular).

**Direct prerequisites.** `SmoothRepresentationsOfLocalGroups:SR.1/a-valued-haar-measure`, `SmoothRepresentationsOfLocalGroups:SR.0:abelian-category/smooth-character`, `mathlib:MeasureTheory.Measure.modularCharacter`, `tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory`.

**API.**

- `TauCeti.modulus` (data): mod_N : normaliser of N → ℚ_{>0}, defined by index ratios of compact open subgroups of N.
- `TauCeti.modulus_mul` (simp): mod_N(mm') = mod_N(m) mod_N(m').
- `TauCeti.modulus_eq_index` (characterisation): mod_N(m) = [mN₀m⁻¹ : N₀] when mN₀m⁻¹ ⊇ N₀.
- `TauCeti.modulusCharacter` (data): δ_P : P →* Aˣ for A ∋ q⁻¹, trivial on N; IsSmoothCharacter δ_P.
- `TauCeti.modulusCharacter_eq_modularCharacter` (compatibility): (δ_P(p) : ℝ) = MeasureTheory.Measure.modularCharacter p for the locally compact group P.
- `TauCeti.sqrtModulusCharacter` (data): δ_P^{1/2} : P →* Aˣ determined by a chosen q^{1/2} ∈ Aˣ, with (δ_P^{1/2})² = δ_P.
- `TauCeti.modulusCharacter_opposite` (relation): δ_{P̄} = δ_P⁻¹ on M.

**Unit tests.**

- `TauCeti.modulusCharacter_gl2_borel` (computation): For GL_2(ℚ_p) and B upper triangular, δ_B(diag(a,d)) = |a/d|_p.
- `TauCeti.modulusCharacter_trivial_parabolic` (degenerate): For P = G (N = 1), δ_P = 1.
- `TauCeti.modulusCharacter_eq_modularCharacter_test` (compatibility): For P = B ⊆ GL_2(ℚ_p), δ_B equals Mathlib's modularCharacter of B (as an ℝ≥0-valued character).
- `TauCeti.modulusCharacter_ne_one_on_center_free` (non-example): δ_B is not trivial on T: δ_B(diag(p,1)) ≠ 1, so B is not unimodular.

**Acceptance checks.**

- GL_2, B upper triangular: δ_B(diag(a, d)) = |a/d|, so δ_B(diag(p, 1)) = p⁻¹.
- δ_G = 1 (N trivial) and δ_P is trivial on N and on compact subgroups.
- The two choices ±q^{1/2} give square roots differing by the unramified quadratic character m ↦ (−1)^{v(det)}-type sign; normalised induction depends on the choice.

**Uses.** SmoothRepresentationsOfLocalGroups:SR.2/parabolic-induction: normalised induction i_P σ = Ind_P^G(σ ⊗ δ_P^{1/2}). SmoothRepresentationsOfLocalGroups:SR.2/jacquet-module: normalised Jacquet functor r_P = δ_P^{−1/2} ⊗ (−)_N. Casselman 1995, §1.5 and Lemma 1.5.1: δ_P and meas(K₀aK₀) = δ_P⁻¹(a) meas(K₀) for a contracting N. ExcursionOperatorsAndSpectralAction:ES7:parabolic: δ_P(m) = |det Ad(m)|_{Lie U_P}| in i_P τ = Ind_P(δ_P^{1/2}τ). Allen et al. 2023, §2.1.9: |δ_P(m)|⁻¹ = #(U_N/mU_Nm⁻¹) in t ∘ 𝒮.

**Sources.** `CASSELMAN95`, §1.5 and Lemma 1.5.1, p. 16: δ_P(p) = |det Ad_n(p)| and meas(K₀aK₀) = δ_P⁻¹(a) meas(K₀) for a ∈ A⁻ when K₀ has an Iwahori factorisation. `BZ77`, §1.7, pp. 443–444: The module mod_U(g) of the automorphism u ↦ gug⁻¹ of a closed subgroup U normalised by g, and the module Δ_G = mod_G⁻¹ of a group. `HKP03`, §1.4, p. 2: q^{−⟨ρ,μ⟩} = δ_B(π^μ)^{1/2}, δ_B(a) being the absolute value of det Ad(a) on Lie N.

#### The Jacquet module

**Identifier:** `SmoothRepresentationsOfLocalGroups:SR.2/jacquet-module`. **Kind:** construction. **Proposed name:** `TauCeti.SmoothRep.jacquetFunctor`. **Module:** `TauCeti/RepresentationTheory/Smooth/Jacquet`.

Let P = M ⋉ N be closed subgroups of G (N normal in P). For a smooth P-representation (in particular the restriction of a G-representation) V, the Jacquet module V_N = V/V(N), V(N) = span{ρ(n)v − v : n ∈ N, v ∈ V}, is Mathlib's coinvariants (Representation.Coinvariants of the restriction to N) with the induced smooth M-action; this is the unnormalised Jacquet functor (−)_N : SmoothRep A G ⥤ SmoothRep A M. The normalised Jacquet functor is r_P(V) = δ_P^{−1/2} ⊗ V_N (given q^{1/2} ∈ Aˣ). (−)_N is right exact over any A, commutes with direct sums, colimits and base change, satisfies transitivity (V_{N₂})_{N₁ ∩ M₂} ≅ V_{N₁} for P₁ ⊆ P₂, and sends finitely generated G-representations to finitely generated M-representations when G = P K₀ with K₀ compact.

**Hypotheses.** G locally profinite; P = M ⋉ N closed; A commutative (q^{±1/2} ∈ A for r_P).

**Construction or proof.**
1. Coinvariants of the restriction to N; M normalises N, so V(N) is M-stable and M acts on V_N; smoothness is inherited by quotients.
2. Right exactness and colimits: coinvariants are a left adjoint (Rep.coinvariantsAdjunction).
3. Finite generation: G = P K₀ with K₀ compact open, and V generated by finitely many vectors is generated over P by their K₀-translates, finitely many modulo a smaller open subgroup.

**Direct prerequisites.** `SmoothRepresentationsOfLocalGroups:SR.0:abelian-category/smooth-rep-category`, `SmoothRepresentationsOfLocalGroups:SR.2/modulus-character`, `mathlib:Representation.Coinvariants`, `mathlib:Rep.coinvariantsFunctor`; `mathlib:Rep.quotientToCoinvariantsFunctor`.

**API.**

- `TauCeti.SmoothRep.jacquet` (data): V_N := Representation.Coinvariants of the restriction of V to N, with its M-action.
- `TauCeti.SmoothRep.jacquetFunctor` (functoriality): (−)_N : SmoothRep A G ⥤ SmoothRep A M, A-linear, right exact, preserving colimits.
- `TauCeti.SmoothRep.normalizedJacquet` (data): r_P(V) := δ_P^{−1/2} ⊗ V_N.
- `TauCeti.SmoothRep.jacquet_mk_surjective` (projection): The projection V → V_N is an M-equivariant surjection with kernel V(N).
- `TauCeti.SmoothRep.jacquet_lift` (universal-property): Hom_M(V_N, W) ≃ Hom_P(V, infl W) for W an M-representation with N acting trivially.
- `TauCeti.SmoothRep.jacquet_trans` (relation): Transitivity for P₁ ⊆ P₂: (V_{N₂})_{N₁ ∩ M₂} ≅ V_{N₁}, and r_{P₁∩M₂}^{M₂} ∘ r_{P₂} ≅ r_{P₁}.
- `TauCeti.SmoothRep.jacquet_fg` (relation): If G = P K₀ with K₀ compact, V finitely generated ⇒ V_N finitely generated.
- `TauCeti.SmoothRep.jacquet_baseChange` (functoriality): (B ⊗_A V)_N ≅ B ⊗_A V_N.
- `TauCeti.SmoothRep.jacquet_eq_coinvariants` (compatibility): The underlying A-module of V_N is Mathlib's Representation.Coinvariants of ρ restricted to N.

**Unit tests.**

- `TauCeti.SmoothRep.jacquet_trivial_gl2` (computation): For G = GL_2(ℚ_p), the Jacquet module of the trivial representation along N is the trivial character of T.
- `TauCeti.SmoothRep.jacquet_N_trivial` (degenerate): If N = ⊥ then V_N ≅ V.
- `TauCeti.SmoothRep.jacquet_eq_coinvariants_test` (compatibility): For G finite discrete and N a subgroup, V_N is Representation.Coinvariants (ρ.comp N.subtype).
- `TauCeti.SmoothRep.jacquet_not_left_exact_fp` (non-example): For P = N = ℤ_p (M trivial) and A = F_p, (−)_N is not left exact: the augmentation ideal I ⊆ F_p[ℤ/p] has I_N = F_p mapping to 0 in (F_p[ℤ/p])_N.

**Acceptance checks.**

- For the trivial representation of GL_2(ℚ_p), 1_N = 1 and r_B(1) = δ_B^{−1/2}.
- For N = 1, V_N = V and r_P = id.
- For a cuspidal representation of GL_2(ℚ_p), V_N = 0 while V ≠ 0.

**Uses.** Casselman 1995, §3.2–3.3: V_N, Jacquet's lemma and admissibility/finite generation of V_N. Bernstein–Zelevinsky 1977, §1.8(b) and §2.3: the normalised localisation functor r_{U,θ} and r_{M,G}. Atobe–Kondo–Yasuda 2022, §8.5, p. 51: unnormalised Jacquet modules of representations of GL_n. GL2AutomorphicRepresentationsAndTransfer:R16.2: Jacquet models of GL_2 principal series. PotentialAutomorphyInfrastructurePartII: Jacquet module along N_n of GL_n(K) and Frobenius reciprocity. SmoothRepresentationsOfLocalGroups:SR.3/cuspidal-representations: cuspidality is vanishing of all proper Jacquet modules.

**Sources.** `CASSELMAN95`, §3.2, pp. 33–34; Theorem 3.3.1, p. 35; §4.4, p. 45: Defines V(N) and V_N with its universal property, shows V_N is finitely generated (resp. admissible) when V is, and records transitivity for P₁ ⊆ P₂. `BZ77`, §1.8(b), pp. 444–445; §2.3, p. 446: The normalised localisation functor r_{U,θ}(E) = E/E(U,θ) with M acting through mod_U^{−1/2}, and r_{M,G} for reductive G. `BERNSTEIN92`, Ch. I §3.3 and Proposition 10, p. 17; Ch. II §1.2, Jacquet functors and Proposition 19(2),(4), pp. 32–34: Coinvariants J_G(V) = V/V(G), right exactness, the Jacquet functor r_{M,G}(V) = J_U(V) as an M-module, transitivity and preservation of finite generation.

**Atlas planet:** Jacquet functor.

#### Jacquet's lemma and exactness of the Jacquet functor

**Identifier:** `SmoothRepresentationsOfLocalGroups:SR.2/jacquet-lemma`. **Kind:** theorem. **Proposed name:** `TauCeti.SmoothRep.jacquetFunctor_exact`. **Module:** `TauCeti/RepresentationTheory/Smooth/Jacquet`.

Let N be a union of an increasing sequence of compact open subgroups N₀ ⊆ N₁ ⊆ … each of pro-order invertible in A (e.g. N the unipotent radical of a parabolic of a p-adic group and p ∈ Aˣ). For every smooth N-representation V: V(N) = ⋃_i ker(e_{N_i}) = {v : ∫_{N_i} ρ(n)v dn = 0 for some i}, and (−)_N is exact. In characteristic-p coefficients for a pro-p N the functor is right exact but not left exact; no characteristic-p exactness is asserted.

**Hypotheses.** N = ⋃ N_i an increasing union of compact open subgroups with HasUnitProOrder A N_i.

**Construction or proof.**
1. v − e_{N_i} v ∈ V(N_i) ⊆ V(N); conversely ρ(n)v − v is killed by e_{N_i} once n ∈ N_i.
2. Exactness: (−)_N = colim_i (−)_{N_i} and each (−)_{N_i} ≅ (−)^{N_i} via e_{N_i} is exact (invariants-exact); filtered colimits are exact.

**Direct prerequisites.** `SmoothRepresentationsOfLocalGroups:SR.2/jacquet-module`, `SmoothRepresentationsOfLocalGroups:SR.0:abelian-category/averaging-projector`, `SmoothRepresentationsOfLocalGroups:SR.0:abelian-category/invariants-exact`.

**Acceptance checks.**

- For N = ℚ_p acting on C_c^∞(ℚ_p, ℂ) by translation, V(N) = {f : ∫ f = 0} and V_N ≅ ℂ via the integral.
- For N compact pro-p and A = F_p, exactness fails (jacquet-module non-example).
- Over ℂ every unipotent radical satisfies the hypothesis.

**Sources.** `CASSELMAN95`, Proposition 3.2.1, p. 33; Corollary 3.2.2 and Proposition 3.2.3, p. 34: V(N) is both the span of π(n)v − v and the union of the V(N₀) = {v : ∫_{N₀} π(n)v dn = 0}; the Jacquet functor is exact on smooth N-spaces. `BERNSTEIN92`, Ch. I Proposition 10(2)–(3), p. 17; Ch. II Proposition 17, p. 31: Coinvariants are exact for compact groups and for increasing unions of compact groups; ⋃ ker e_{U_i} = V(U). `BZ77`, §1.9(a), p. 445: r_{U,θ} is exact when U is a limit of compact subgroups.

#### Normalised parabolic induction

**Identifier:** `SmoothRepresentationsOfLocalGroups:SR.2/parabolic-induction`. **Kind:** construction. **Proposed name:** `TauCeti.SmoothRep.parabolicInd`. **Module:** `TauCeti/RepresentationTheory/Smooth/Jacquet`.

For a parabolic subgroup P = M ⋉ N of a reductive p-adic group G (or a parabolic pair in a locally profinite G with P\G compact) and A ∋ q^{±1/2}, normalised parabolic induction is i_P^G σ := Ind_P^G(δ_P^{1/2} ⊗ infl_M^P σ), an exact functor SmoothRep A M ⥤ SmoothRep A G (P\G is compact, so Ind = c-Ind). Unnormalised induction Ind_P^G ∘ infl is available over every A. It satisfies transitivity i_P^G ∘ i_{Q ∩ M}^M ≅ i_Q^G for Q ⊆ P, preserves admissibility and finite generation, and is compatible with twisting by unramified characters of M and with base change.

**Hypotheses.** G reductive over F (or locally profinite with P\G compact); P = M ⋉ N parabolic; A ∋ q^{±1/2} for normalised induction.

**Construction or proof.**
1. Composite of inflation, twisting by δ_P^{1/2} and smooth induction.
2. Exactness and admissibility: induction-exactness (b) with P\G compact (Iwasawa decomposition G = P K₀, ReductiveGroupsPartII RG2.4).
3. Transitivity: induction-in-stages and δ_Q = δ_P · δ_{Q∩M}^M on Q.

**Direct prerequisites.** `SmoothRepresentationsOfLocalGroups:SR.2/smooth-induction`, `SmoothRepresentationsOfLocalGroups:SR.2/modulus-character`, `SmoothRepresentationsOfLocalGroups:SR.2/induction-exactness`, `SmoothRepresentationsOfLocalGroups:SR.2/induction-in-stages`, `ReductiveGroupsPartII:RG2.4`, `tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory`.

**API.**

- `TauCeti.SmoothRep.parabolicInd` (data): i_P^G σ := Ind_P^G(δ_P^{1/2} ⊗ infl σ).
- `TauCeti.SmoothRep.unnormalizedParabolicInd` (data): Ind_P^G ∘ infl, over any A.
- `TauCeti.SmoothRep.parabolicInd_exact` (relation): i_P^G is exact (any A ∋ q^{±1/2}).
- `TauCeti.SmoothRep.parabolicInd_trans` (relation): i_P^G ∘ i_{Q∩M}^M ≅ i_Q^G for parabolics Q ⊆ P.
- `TauCeti.SmoothRep.parabolicInd_admissible` (relation): i_P^G preserves admissibility and finite generation.
- `TauCeti.SmoothRep.parabolicInd_twist` (relation): i_P^G(σ ⊗ χ|_M) ≅ i_P^G σ ⊗ χ for a smooth character χ of G.
- `TauCeti.SmoothRep.parabolicInd_eq_unnormalized` (compatibility): i_P^G σ = Ind_P^G(δ_P^{1/2}σ); the two conventions differ by the twist δ_P^{1/2}.

**Unit tests.**

- `TauCeti.SmoothRep.parabolicInd_gl2_apply` (computation): For GL_2(ℚ_p), f ∈ i_B(χ₁ ⊗ χ₂) satisfies f((a b; 0 d)g) = χ₁(a)χ₂(d)|a/d|^{1/2} f(g).
- `TauCeti.SmoothRep.parabolicInd_self` (degenerate): i_G^G σ ≅ σ.
- `TauCeti.SmoothRep.trivial_sub_parabolicInd` (computation): The trivial representation of GL_2(ℚ_p) embeds in i_B(δ_B^{−1/2}).
- `TauCeti.SmoothRep.parabolicInd_not_unnormalized` (non-example): i_B 1 ≠ Ind_B^G 1 for GL_2(ℚ_p): the latter contains the trivial representation, the former does not.

**Acceptance checks.**

- GL_2: i_B(χ₁ ⊗ χ₂) consists of f with f((a b; 0 d) g) = χ₁(a)χ₂(d)|a/d|^{1/2} f(g).
- i_B(δ_B^{−1/2}) contains the trivial representation, with quotient the Steinberg representation.
- For P = G, i_G^G = id.

**Uses.** Casselman 1995, §3.1: i_P^G σ = Ind_P^G(σδ_P^{1/2}), admissible for admissible σ. Bernstein–Zelevinsky 1977, §2.3: i_{G,M}, exact, transitive, compatible with contragredients. Atobe–Kondo–Yasuda 2022, §2.1, p. 7; §5.1, p. 28: normalised parabolic induction π₁ × ⋯ × π_r for GL_n. Ding 2025, §3.1.1, pp. 33–34: generic smooth characters of T(K), the modulus character and the smooth principal series I_sm(φ) of GL_n(K). AutomorphicLFunctionsAndLocalFactors:AL.3: normalised induction with the specified modulus square root and block tensor realisation. AutomorphicSpectralTheory:AS.2: local normalised induction and induction in stages for intertwining operators. ExcursionOperatorsAndSpectralAction:ES7:parabolic: the dictionary between unnormalised and normalised induction.

**Sources.** `CASSELMAN95`, §3.1, p. 32: Normalised induction i_P^G σ = Ind_P^G(σδ_P^{1/2}), admissible for admissible σ; restriction to K via Iwasawa. `BZ77`, §2.3, Proposition, p. 446: i_{G,M} and r_{M,G} are exact, transitive, r is left adjoint to i, i commutes with contragredients, and both preserve admissibility. `BERNSTEIN92`, Ch. II Theorem 10 and Proposition 19, pp. 33–34; Ch. III §1.1, p. 51: Parabolic induction i_{G,M}, its properties, and the normalisation by δ^{1/2}.

**Atlas planet:** Normalised parabolic induction.

#### First adjointness

**Identifier:** `SmoothRepresentationsOfLocalGroups:SR.2/first-adjointness`. **Kind:** theorem. **Proposed name:** `TauCeti.SmoothRep.jacquetParabolicIndAdjunction`. **Module:** `TauCeti/RepresentationTheory/Smooth/Jacquet`.

For a parabolic P = M ⋉ N, a smooth G-representation V and a smooth M-representation σ over A: Hom_G(V, Ind_P^G infl σ) ≅ Hom_M(V_N, σ), and in normalised form Hom_G(V, i_P^G σ) ≅ Hom_M(r_P V, σ) (A ∋ q^{±1/2}): the Jacquet functor r_P is left adjoint to i_P^G. Consequently i_P^G preserves injectives when r_P is exact, and r_P preserves projectives when i_P is exact.

**Hypotheses.** P = M ⋉ N closed in G; A commutative (q^{±1/2} ∈ A for the normalised form).

**Construction or proof.**
1. Frobenius reciprocity: Hom_G(V, Ind_P^G infl σ) ≅ Hom_P(V, infl σ).
2. N acts trivially on infl σ, so P-maps V → infl σ factor through V_N (jacquet-module universal property).
3. Normalised form: twist by δ_P^{1/2}.

**Direct prerequisites.** `SmoothRepresentationsOfLocalGroups:SR.2/frobenius-reciprocity`, `SmoothRepresentationsOfLocalGroups:SR.2/jacquet-module`, `SmoothRepresentationsOfLocalGroups:SR.2/parabolic-induction`.

**Acceptance checks.**

- Hom_G(1, i_B(δ_B^{−1/2})) ≅ Hom_T(δ_B^{−1/2}, δ_B^{−1/2}) = ℂ for GL_2(ℚ_p).
- For P = G, it is the identity adjunction.
- If V is cuspidal (r_P V = 0 for proper P), Hom_G(V, i_P σ) = 0 for all proper P and σ.

**Sources.** `CASSELMAN95`, Theorem 3.2.4, p. 34: Hom_G(V, i_P^G σ) ≅ Hom_M(V_N, σδ_P^{1/2}) for smooth V and σ. `BZ77`, §2.3(b), p. 446: r_{M,G} is left adjoint to i_{G,M}. `BERNSTEIN92`, Ch. II Theorem 10, p. 33: r_{M,G} has right adjoint i_{G,M} = ind_P^G of the inflation, proved by Frobenius reciprocity and triviality of the U-action.

#### Contragredients of induced representations

**Identifier:** `SmoothRepresentationsOfLocalGroups:SR.2/induced-contragredient`. **Kind:** theorem. **Proposed name:** `TauCeti.SmoothRep.smoothDual_parabolicInd`. **Module:** `TauCeti/RepresentationTheory/Smooth/Jacquet`.

For H closed in a unimodular G, σ smooth on H over a field k in which the compact open subgroups have invertible pro-order (e.g. k = ℂ): (c-Ind_H^G σ)~ ≅ Ind_H^G(σ̃ ⊗ δ_H), δ_H the modulus character of H, via the G-invariant functional on c-Ind_H^G δ_H given by integration over H\G. For a parabolic P = M ⋉ N (P\G compact): (i_P^G σ)~ ≅ i_P^G σ̃ naturally in σ (normalised induction is compatible with smooth duality), and the pairing i_P σ × i_P σ̃ → k is f ⊗ f' ↦ ∮_{P\G} ⟨f, f'⟩.

**Hypotheses.** G unimodular locally profinite; H closed; k a field with invertible pro-orders (char 0 suffices); for i_P: k ∋ q^{±1/2}.

**Construction or proof.**
1. Invariant integration: the functionals on c-Ind_H^G δ_H invariant under G form a line, spanned by ∮_{H\G} (Haines–Kottwitz–Prasad 1.9; Casselman 2.4.3).
2. The pairing c-Ind σ × Ind(σ̃ δ_H) → k, (f, f') ↦ ∮ ⟨f, f'⟩, identifies Ind(σ̃δ_H) with the smooth dual (Casselman 2.4.2).
3. Parabolic case: δ_P^{1/2} · δ_P^{1/2} = δ_P absorbs the modulus, and c-Ind = Ind.

**Direct prerequisites.** `SmoothRepresentationsOfLocalGroups:SR.2/compact-induction`, `SmoothRepresentationsOfLocalGroups:SR.2/parabolic-induction`, `SmoothRepresentationsOfLocalGroups:SR.0:abelian-category/smooth-dual`, `SmoothRepresentationsOfLocalGroups:SR.1/integration`, `SmoothRepresentationsOfLocalGroups:SR.2/modulus-character`.

**Acceptance checks.**

- GL_2: (i_B(χ₁ ⊗ χ₂))~ ≅ i_B(χ₁⁻¹ ⊗ χ₂⁻¹).
- For H open (δ_H = 1 on the compact part), (c-Ind_H^G σ)~ ≅ Ind_H^G σ̃.
- Unnormalised: (Ind_B^G 1)~ ≅ Ind_B^G δ_B ≠ Ind_B^G 1, so the normalisation is what makes induction self-dual.

**Sources.** `CASSELMAN95`, Theorem 2.4.2 and Corollary 2.4.3, pp. 27–28; Proposition 3.1.2, p. 32: For G unimodular and H closed, the contragredient of c-Ind_H^G σ is Ind_H^G(σ̃δ_H); the contragredient of i_P^G σ is i_P^G σ̃. `BZ77`, §1.9(d), p. 445; §2.3(d), p. 446: The contragredient of compact induction is induction of the contragredient with modulus characters; i_{G,M} commutes with contragredients. `HKP03`, §1.9, p. 4: The G-invariant functionals on i_B^G(δ_B^{1/2}) form a line spanned by ∮_{B\G}, used to pair i_B(χ) with i_B(χ⁻¹).

#### The geometric lemma

**Identifier:** `SmoothRepresentationsOfLocalGroups:SR.2/geometric-lemma`. **Kind:** theorem. **Proposed name:** `TauCeti.SmoothRep.geometricLemma`. **Module:** `TauCeti/RepresentationTheory/Smooth/Jacquet`.

Let G be a connected reductive group over F, P = MN and Q = LV standard parabolic subgroups, W the Weyl group and W^{M,L} the set of minimal-length representatives of W_L\W/W_M. For every smooth σ of M (complex coefficients, or any A ∋ q^{±1/2} with p ∈ Aˣ), r_Q ∘ i_P (σ) has a filtration, natural in σ, whose graded pieces are F_w(σ) = i^L_{L ∩ wPw⁻¹}(w · r^M_{M ∩ w⁻¹Qw}(σ)), w ∈ W^{M,L}, in an order compatible with the closure order on the double cosets PwQ (open orbits give subfunctors, closed orbits quotients). More generally, for an l-group G with closed subgroups P = MU, Q = NV satisfying Bernstein–Zelevinsky's conditions (finitely many Q-orbits on P\G, U and V unions of compact subgroups, decomposability), r_{V} ∘ i_{U} is glued from functors indexed by the Q-orbits on P\G.

**Hypotheses.** G reductive over F; P, Q standard parabolics; σ smooth over ℂ (or over A with p ∈ Aˣ and q^{±1/2} ∈ A, where exactness of r is available).

**Construction or proof.**
1. Bruhat decomposition P\G/Q ≅ W_M\W/W_L with W^{M,L} as representatives (Tau Ceti ReductiveGroups Layer 7; Casselman Proposition 1.3.1; Bernstein–Zelevinsky 1977 Lemma 2.11).
2. Mackey filtration of i_P σ restricted to Q by Q-orbits (mackey-filtration).
3. Jacquet module of each piece c-Ind_{Q ∩ w⁻¹Pw}^Q: (c-Ind_{Q'}^Q τ)_V ≅ c-Ind of the coinvariants with a modulus twist (Casselman Proposition 6.2.1), and exactness of r_Q (jacquet-lemma).
4. Identify the twist: the normalisations cancel (Bernstein–Zelevinsky 1977 §6.4).

**Direct prerequisites.** `SmoothRepresentationsOfLocalGroups:SR.2/mackey-filtration`, `SmoothRepresentationsOfLocalGroups:SR.2/jacquet-lemma`, `SmoothRepresentationsOfLocalGroups:SR.2/parabolic-induction`, `SmoothRepresentationsOfLocalGroups:SR.2/l-sheaf-model`, `tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory`, `ReductiveGroupsPartII:RG2.4`.

**Acceptance checks.**

- P = Q = B in GL_2: two pieces, χ and wχ (principal-series-jacquet).
- P = G: r_Q ∘ i_G = r_Q, one piece.
- σ cuspidal and M, L not associate: r_Q i_P σ has no cuspidal subquotient (Bernstein–Zelevinsky 1977 Corollary 2.13(b)).

**Sources.** `BZ77`, Lemma 2.11 and Geometrical Lemma 2.12, p. 448; Theorem 5.2 with conditions 5.1(1)–(4), pp. 459–460; §6.4, pp. 468–469: For reductive G the functor r_{N,G} ∘ i_{G,M} is glued from i_{N,N'} ∘ w ∘ r_{M',M}, w ∈ W^{M,N}; in general r ∘ i is glued from functors attached to the Q-orbits on P\G under axioms (1)–(4). `CASSELMAN95`, Proposition 6.2.1, p. 53; Propositions 6.3.1–6.3.3 and Theorem 6.3.5, pp. 56–59: Jacquet modules of compact inductions and the Bruhat filtration giving the geometric lemma for absolutely cuspidal σ. `BERNSTEIN92`, Ch. III §1.2, Basic geometric lemma, pp. 53–55: The filtration of r_{M,G} ∘ i_{G,M} by orbits of P on P\G, the closed orbit giving a quotient and the open orbit a sub.

**Atlas planet:** Geometric lemma.

#### Jacquet modules of principal series

**Identifier:** `SmoothRepresentationsOfLocalGroups:SR.2/principal-series-jacquet`. **Kind:** theorem. **Proposed name:** `TauCeti.SmoothRep.jacquet_principalSeries`. **Module:** `TauCeti/RepresentationTheory/Smooth/Jacquet`.

Let B = TU be a minimal parabolic (Borel, for split G) and χ a smooth character of T over ℂ. Then r_B(i_B χ) has a filtration with graded pieces the Weyl conjugates wχ (w ∈ W), so its semisimplification is ⊕_{w ∈ W} wχ; if χ is regular (wχ ≠ χ for w ≠ 1) the filtration splits. Consequently every irreducible subquotient π of i_B χ has r_B(π) ≠ 0, its semisimplified Jacquet module is a sub-sum of ⊕ wχ, and π embeds in i_B(wχ) for some w; i_B χ has length ≤ |W|.

**Hypotheses.** G reductive over F with minimal parabolic B = TU; χ a smooth character of T; complex coefficients.

**Construction or proof.**
1. geometric-lemma with P = Q = B: every σ on T is cuspidal for T, and the pieces are i^T_T(w r^T_T χ) = wχ.
2. Regular χ: the pieces have distinct central characters of T, so central-ext-vanishing splits the filtration.
3. Embedding: first-adjointness applied to a quotient character of r_B(π).

**Direct prerequisites.** `SmoothRepresentationsOfLocalGroups:SR.2/geometric-lemma`, `SmoothRepresentationsOfLocalGroups:SR.2/first-adjointness`, `SmoothRepresentationsOfLocalGroups:SR.0:derived-extension/central-ext-vanishing`.

**Acceptance checks.**

- GL_2: r_B(i_B(χ₁ ⊗ χ₂))^{ss} = (χ₁ ⊗ χ₂) ⊕ (χ₂ ⊗ χ₁).
- For T = G (no proper parabolic), r_B i_B χ = χ.
- For χ = δ_B^{−1/2} on GL_2, r_B(1) = δ_B^{−1/2} and r_B(St) = δ_B^{1/2}: the two constituents split the two Weyl conjugates.

**Sources.** `BZ77`, Corollary 2.13(c), p. 449: If σ is quasicuspidal and M ~ N, r_{N,G} i_{G,M}(σ) is glued from the w(σ); for the minimal Levi this gives the Weyl translates. `CASSELMAN95`, Corollary 6.3.9, p. 60; Proposition 6.4.1, p. 61: The semisimplified Jacquet module of a principal series is the sum of Weyl translates; length ≤ |W|; split for regular σ. `BCGP21`, Proposition 2.4.4 (arXiv v3 p. 21): The semisimplified Jacquet module of n-Ind_B^G χ is the sum of the Weyl conjugates of χ.

#### Casselman's pairing for admissible representations

**Identifier:** `SmoothRepresentationsOfLocalGroups:SR.2/casselman-pairing`. **Kind:** theorem. **Proposed name:** `TauCeti.SmoothRep.casselmanPairing`. **Module:** `TauCeti/RepresentationTheory/Smooth/Jacquet`.

Let V be an admissible complex representation of a reductive p-adic G, P = MN a parabolic with opposite P̄ = MN̄. There is a unique bilinear pairing ⟨ , ⟩_N : V_N × (Ṽ)_{N̄} → ℂ such that for v ∈ V, ṽ ∈ Ṽ with images u, ũ there is ε > 0 with ⟨π(a)v, ṽ⟩ = ⟨π_N(a)u, ũ⟩_N for all a in the ε-contracting part A⁻(ε) of the split centre of M. It is M-invariant and nondegenerate, so (V_N)~ ≅ (Ṽ)_{N̄} and, normalised, r_{P̄}(Ṽ) ≅ (r_P V)~. This is the compatibility of Jacquet functors with smooth duality on admissible representations; the extension to all smooth representations is jacquet-duality (SR.2a).

**Hypotheses.** G reductive over F; V admissible over ℂ; P, P̄ opposite parabolics.

**Construction or proof.**
1. Canonical liftings V_N^{M₀} ≅ V^{K₀}_{A⁻} and Ṽ_{N̄}^{M₀} ≅ Ṽ^{K₀}_{A⁺} (jacquet-invariants), pairing the lifts (Casselman Lemma 4.2.1–4.2.2).
2. Asymptotic characterisation and uniqueness (Casselman Proposition 4.2.3).
3. M-invariance and nondegeneracy (Casselman Theorem 4.2.4); δ_{P̄} = δ_P⁻¹ on M gives the normalised form.

**Direct prerequisites.** `SmoothRepresentationsOfLocalGroups:SR.2/jacquet-invariants`, `SmoothRepresentationsOfLocalGroups:SR.0:abelian-category/smooth-dual`, `SmoothRepresentationsOfLocalGroups:SR.2/jacquet-module`, `SmoothRepresentationsOfLocalGroups:SR.2/modulus-character`.

**Acceptance checks.**

- For V = i_B χ on GL_2, (V_N)~ and Ṽ_{N̄} both have constituents χ⁻¹ and (wχ)⁻¹ (up to the modulus twist).
- For P = G the pairing is the canonical pairing V × Ṽ → ℂ.
- For cuspidal V both sides vanish.

**Sources.** `CASSELMAN95`, Lemmas 4.2.1–4.2.2, Proposition 4.2.3, Theorem 4.2.4 and Corollary 4.2.5, pp. 40–42: The canonical pairing of V_N with Ṽ_{N⁻} via canonical lifts, its asymptotic characterisation, M-invariance and nondegeneracy, so (V_N)~ ≅ Ṽ_{N⁻} for admissible V. `BERNSTEIN92`, Ch. III §3.2, Lemma 31 and Theorem 21, pp. 63–66: r_{M,G}(σ̃) ≅ (r̄_{M,G}σ)~ via a unique nondegenerate M-equivariant pairing characterised by matrix-coefficient asymptotics (for all smooth σ, using stabilisation).

**Atlas planet:** Casselman's pairing.

#### Jacquet's lemma on invariants and canonical lifting

**Identifier:** `SmoothRepresentationsOfLocalGroups:SR.2/jacquet-invariants`. **Kind:** theorem. **Proposed name:** `TauCeti.SmoothRep.invariants_jacquet_surjective`. **Module:** `TauCeti/RepresentationTheory/Smooth/Jacquet`.

Let K₀ be a compact open subgroup with an Iwahori decomposition K₀ = N̄₀M₀N₀ with respect to (P, P̄), V an admissible representation over ℂ (or over a field with invertible pro-orders). Then: (1) the projection V^{K₀} → (V_N)^{M₀} is surjective; (2) for a ∈ M contracting N (a N₀ a⁻¹ ⊆ N₀, a ∈ A⁻), the Hecke operator [K₀aK₀] on V^{K₀} lifts δ_P(a)⁻¹ π_N(a) on V_N, i.e. projection intertwines [K₀aK₀] with δ_P⁻¹(a) a; (3) for a sufficiently contracting, the subspaces V^{K₀}_a = [K₀aK₀] V^{K₀} are all equal to a space V^{K₀}_{A⁻} on which every [K₀aK₀] (a ∈ A⁻) is invertible, and the projection V^{K₀}_{A⁻} → (V_N)^{M₀} is an isomorphism (its inverse is Casselman's canonical lifting); the kernel of the projection is the generalised null space of [K₀aK₀]. Over a ring R with p ∈ Rˣ the same surjectivity holds for all smooth V once [K₀aK₀] is invertible in H(G, K₀) ⊗ R (Bushnell–Kutzko).

**Hypotheses.** G reductive over F; K₀ compact open with an Iwahori decomposition; V admissible over ℂ (general smooth V in jacquet-lemma-smooth of SR.2a).

**Construction or proof.**
1. (1) Jacquet's first lemma: averaging over K₀ equals averaging over N₀ on M₀N̄₀-fixed vectors; push a finite-dimensional subspace of V_N^{M₀} into the image by a contracting a (Casselman 3.3.3–3.3.4).
2. (2) [K₀aK₀] = δ_P⁻¹(a) e_{K₀} π(a) on V^{K₀} by the index formula meas(K₀aK₀) = δ_P⁻¹(a) (Casselman Lemma 1.5.1, 4.1.1).
3. (3) Jacquet's second lemma and finite-dimensionality of V^{K₀} (Casselman 4.1.2, 4.1.4, 4.1.6–4.1.7).

**Direct prerequisites.** `SmoothRepresentationsOfLocalGroups:SR.2/jacquet-module`, `SmoothRepresentationsOfLocalGroups:SR.2/jacquet-lemma`, `SmoothRepresentationsOfLocalGroups:SR.1/iwahori-decomposition`, `SmoothRepresentationsOfLocalGroups:SR.1/positive-hecke-homomorphism`, `SmoothRepresentationsOfLocalGroups:SR.2/modulus-character`, `SmoothRepresentationsOfLocalGroups:SR.0:abelian-category/admissible`.

**Acceptance checks.**

- For V = i_B χ on GL_2 and K₀ = Iwahori: V^I (dimension 2) → (V_N)^{T(ℤ_p)} (dimension 2) is an isomorphism and U_p = [I diag(p,1) I] acts by p^{1/2}χ₁(p), p^{1/2}χ₂(p) on the two lines.
- For V the trivial representation of GL_2: V^I → V_N is an isomorphism, U_p acting by δ_B⁻¹(diag(p,1)) = p.
- For V cuspidal, V^{K₀} is the generalised null space of [K₀aK₀].

**Uses.** Boxer–Pilloni 2026, §4.1 and Lemma 4.1.5: Casselman's canonical lifting identifying K_p-invariants with T_{K_p}-invariants of the Jacquet module on the part where T⁺ acts invertibly. Clozel–Thorne 2017, Lemma 2.1: invariants of B and P through Jacquet modules (Casselman). PotentialAutomorphyInfrastructurePartII: Casselman's comparison between Iwahori invariants and torus invariants of the Jacquet module, with [IαI] corresponding to δ_B⁻¹(α)α. IntegralHeckeAndGaloisDeterminantsPartII:IHR.2: Jacquet's lemma in Bushnell–Kutzko form for U with an Iwahori decomposition and an invertible strongly positive [UzU].

**Sources.** `CASSELMAN95`, Theorems 3.3.3–3.3.4, p. 35; Lemma 4.1.1, Theorem 4.1.2, Propositions 4.1.4 and 4.1.6, Lemma 4.1.7, pp. 38–40: Surjectivity of V^{K₀} → V_N^{M₀} for admissible V, the Hecke operators of contracting a lifting π_N(a), and the stable image V^{K₀}_{A⁻} mapping isomorphically onto V_N^{M₀} (canonical lifting). `VIGNERAS98`, §II.9 Lemma and §II.10.1, pp. 20–21: Over R with p invertible: surjectivity for admissible V over a field, and injectivity when 1_{KaK} is right invertible for a strictly negative a. `BP26`, §1.3.4, p. 3; p. 43: Uses Casselman's canonical lifting (Lemma 4.1.5 and §4.1 of Casselman) to identify K_p-invariants with T_{K_p}-invariants of the ordinary Jacquet module.

**Atlas planet:** Canonical lifting.

#### Iwahori invariants and the Jacquet module

**Identifier:** `SmoothRepresentationsOfLocalGroups:SR.2/borel-casselman-invariants`. **Kind:** theorem. **Proposed name:** `TauCeti.SmoothRep.iwahoriInvariants_equiv_jacquet`. **Module:** `TauCeti/RepresentationTheory/Smooth/Jacquet`.

Let G be connected reductive over F with minimal parabolic P = MN, B an Iwahori subgroup in good position (B = N̄₀M₀N₀) and V an admissible complex representation. Then the projection V → V_N induces an isomorphism V^B ≅ (V_N)^{M₀}, and for m in the contracting cone M⁻ the operator [BmB] on V^B corresponds to meas(BmB)·π_N(m) = δ_P(m)⁻¹ π_N(m). For split G and the pro-p Iwahori Iw₁ the same holds with (V_N)^{T(O)₁} and the normalised Jacquet module, compatibly with the action of T(F) on H(G, Iw₁)[1/p] (pro-iwahori-torus).

**Hypotheses.** G connected reductive over F; B Iwahori; V admissible over ℂ (or Ē).

**Construction or proof.**
1. Surjectivity: jacquet-invariants (1).
2. Injectivity: elements of V^B ∩ V(N) are killed by [BmB] for m sufficiently contracting, while [BmB] is invertible on V^B because it is a product of Iwahori–Matsumoto generators T_s, each invertible (iwahori-matsumoto) (Borel 1976 Lemma 4.7; Casselman 1980 Proposition 2.4).
3. Hecke compatibility: jacquet-invariants (2) (Casselman 1980 Proposition 2.5).

**Direct prerequisites.** `SmoothRepresentationsOfLocalGroups:SR.2/jacquet-invariants`, `SmoothRepresentationsOfLocalGroups:SR.1/iwahori-matsumoto`, `SmoothRepresentationsOfLocalGroups:SR.1/pro-iwahori-torus`, `ReductiveGroupsPartII:RG2.3`.

**Acceptance checks.**

- V = i_B χ, χ unramified on GL_n: V^B has dimension |W| = n! matching dim V_N.
- V the Steinberg representation of GL_2: V^B is one-dimensional, the unnormalised Jacquet module V_N is the single character δ_B of T, and U_p = [B diag(p,1) B] acts on V^B by δ_B⁻¹(diag(p,1))·δ_B(diag(p,1)) = 1.
- V cuspidal: V^B = 0 (V_N = 0).

**Uses.** Boxer–Calegari–Gee–Pilloni 2021, Proposition 2.4.3: π^{Iw₁(v)} ≅ (π_U)^{T(O)₁} for smooth admissible π, used for constituents of tame and unramified principal series. Calegari–Geraghty 2020, proof of Theorem 6.13: an irreducible representation with Iwahori-fixed vectors is a subquotient of an unramified principal series. Clozel–Thorne 2017, Lemma 2.1 and proofs of Theorem 2.5 and Proposition 2.6: Borel–Casselman for Iwahori-spherical representations and Hecke modules. SmoothRepresentationsOfLocalGroups:SR.3/borel-casselman-block: the Iwahori block is equivalent to modules over H(G, B).

**Sources.** `CASSELMAN80`, §2, Propositions 2.3–2.5, pp. 395–396: For admissible V the projection V^B → V_N^{M₀} is an isomorphism (injectivity due to Borel), and ch_{BmB} acts as meas(BmB)π_N(m) for m in the contracting cone. `BOREL76`, §4.6–4.7, pp. 247–248; §5.9 Remark (1), pp. 254–255: For semisimple G and admissible V, V^B ≅ (V_N)^{M₀}; the Hecke action of e_a corresponds to the torus action twisted by q_a = |δ_P(a)|⁻¹. `BCGP21`, Proposition 2.4.3 (arXiv v3 pp. 20–21): For split G and smooth admissible π, π^{Iw₁(v)} ≅ (π_U)^{T(O)₁} for the normalised Jacquet module, citing Casselman 4.1.1 and 4.1.4. `CT17`, Lemma 2.1, accepted manuscript p. 6: Casselman's comparison of invariants under B and P with invariants of Jacquet modules.

#### Generic characters and Whittaker functionals

**Identifier:** `SmoothRepresentationsOfLocalGroups:SR.2/whittaker-functionals`. **Kind:** definition. **Proposed name:** `TauCeti.SmoothRep.whittakerFunctionals`. **Module:** `TauCeti/RepresentationTheory/Smooth/Jacquet`.

Let G be quasi-split over F with Borel B = TU and ψ : U → Aˣ a smooth character that is generic (nontrivial on every simple root subgroup and trivial on the derived subgroup [U, U]). A Whittaker functional on a smooth representation V is an element of Hom_U(V, ψ); by Frobenius reciprocity Hom_U(V, ψ) ≅ Hom_G(V, Ind_U^G ψ), and V is ψ-generic if this is nonzero. The Gelfand–Graev representation is c-Ind_U^G ψ. Whittaker data (B, ψ) are acted on by T(F) and conjugation, and genericity depends only on the T(F)-orbit of ψ; the twisted Jacquet module V_{U,ψ} = V/span{ρ(u)v − ψ(u)v} is dual to Whittaker functionals. Uniqueness of Whittaker models is not part of this node.

**Hypotheses.** G quasi-split over F; ψ a generic smooth character of U; A a field (ℂ for the classical theory).

**Construction or proof.**
1. Frobenius reciprocity (frobenius-reciprocity) for the closed subgroup U.
2. Twisted coinvariants: the universal property of V_{U,ψ} (Bernstein–Zelevinsky's r_{U,θ} with θ = ψ).
3. T(F)-conjugation: t·ψ(u) = ψ(t⁻¹ut) permutes generic characters; Hom_U(V, t·ψ) ≅ Hom_U(V, ψ) via ρ(t).

**Direct prerequisites.** `SmoothRepresentationsOfLocalGroups:SR.2/smooth-induction`, `SmoothRepresentationsOfLocalGroups:SR.2/compact-induction`, `SmoothRepresentationsOfLocalGroups:SR.2/frobenius-reciprocity`, `SmoothRepresentationsOfLocalGroups:SR.2/jacquet-module`, `tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory`.

**API.**

- `TauCeti.IsGenericCharacter` (data): ψ : U →* Aˣ smooth, nontrivial on each simple root subgroup, trivial on [U, U].
- `TauCeti.SmoothRep.whittakerFunctionals` (data): Hom_U(V, ψ) for a smooth G-representation V.
- `TauCeti.SmoothRep.whittakerFunctionals_equiv_hom_ind` (universal-property): Hom_U(V, ψ) ≃ Hom_G(V, Ind_U^G ψ).
- `TauCeti.SmoothRep.twistedJacquet` (data): V_{U,ψ} := V/span{ρ(u)v − ψ(u)v}, with (V_{U,ψ})* ≃ Hom_U(V, ψ).
- `TauCeti.SmoothRep.IsGeneric` (data): Hom_U(V, ψ) ≠ 0.
- `TauCeti.SmoothRep.isGeneric_conj` (relation): Genericity depends only on the T(F)-orbit of ψ.
- `TauCeti.SmoothRep.gelfandGraev` (constructor): c-Ind_U^G ψ.

**Unit tests.**

- `TauCeti.SmoothRep.isGeneric_principalSeries_gl2` (computation): For GL_2(ℚ_p) and any smooth χ, i_B χ is ψ-generic.
- `TauCeti.SmoothRep.not_isGeneric_trivial_gl2` (non-example): The trivial representation of GL_2(ℚ_p) is not generic.
- `TauCeti.SmoothRep.whittaker_torus` (degenerate): For G = T (U = ⊥), Hom_U(V, ψ) = Hom_A(V, A).
- `TauCeti.SmoothRep.twistedJacquet_one` (compatibility): For ψ = 1, V_{U,1} is the Jacquet module V_U of jacquet-module.

**Acceptance checks.**

- GL_2: ψ(n(x)) = ψ₀(x) for a nontrivial additive character ψ₀ of F; i_B χ is generic for every χ, the trivial representation is not.
- For G = T a torus (U trivial), the only Whittaker datum is trivial and every nonzero representation is generic, Whittaker functionals being all linear forms.
- The degenerate character ψ = 1 is not generic: Hom_U(V, 1) = (V_U)* is the dual of the Jacquet module.

**Uses.** Gan–Savin 2023, §1, §§3.1–3.4, §11.1: Whittaker data and generic representations of G_2 and PGSp_6, used without reference. ExcursionOperatorsAndSpectralAction:ES2: the Whittaker datum (B, U, ψ), generic character and compact induction from U(E). SmoothRepresentationsOfLocalGroups:SR.5: Whittaker functionals and co-Whittaker modules for GL_n over Helm's coefficient rings. Bernstein–Zelevinsky 1976, §5.16–5.17: Whittaker models of representations of GL_n.

**Sources.** `BZ77`, §1.8(b), pp. 444–445: The θ-localisation r_{U,θ}(E) = E/E(U, θ) for a character θ of U, of which the twisted Jacquet module is the case θ = ψ. `BZ76`, Ch. III §5, 5.16–5.17, p. 50: Whittaker models of nondegenerate representations of GL(n, F). `GS23`, §1, p. 3; §§3.1–3.4, pp. 9–12; §11.1, p. 34 (arXiv v1): Whittaker data, generic representations and uniqueness of Whittaker models for the exceptional groups considered, used without reference.

### SR.3a. Early uniform admissibility

Complex representation theory before the Bernstein centre. Compact representations split off, and cuspidality is equivalent to compactness of matrix coefficients modulo the centre (Harish-Chandra). Every irreducible embeds in a parabolic induction of a cuspidal (Jacquet), and irreducibles are admissible. The decomposition H_K = H₀ C H₀ of a congruence-level Hecke algebra, with C commutative and finitely generated, together with the dimension bound for simple modules over an algebra containing a commutative subalgebra, gives uniform admissibility: dim V^K ≤ c(G, K) for every irreducible V. Hence only finitely many cuspidal components have K-fixed vectors. Nothing here uses the centre theorem of SR.3.

**Planets of this layer:** Cuspidal representations (`cuspidal-representations`); Harish-Chandra's compactness theorem (`harish-chandra-compactness`); Admissibility of irreducible representations (`admissibility-of-irreducibles`); Hecke algebra decomposition (`hecke-algebra-decomposition`); Uniform admissibility (`uniform-admissibility`).

#### Compact representations

**Identifier:** `SmoothRepresentationsOfLocalGroups:SR.3a/compact-representations`. **Kind:** theorem. **Proposed name:** `TauCeti.SmoothRep.compact_splits`. **Module:** `TauCeti/RepresentationTheory/Smooth/Admissibility`. **Realises:** `SR.3a`, `SR.3`.

Let G be unimodular, locally profinite and countable at infinity, with complex coefficients. A smooth V is compact if for every v and compact open K the function g ↦ e_K π(g⁻¹) v has compact support; equivalently all matrix coefficients ⟨ṽ, π(g⁻¹)v⟩ are compactly supported. Then: a finitely generated compact representation is admissible; an irreducible compact W has a nonzero formal degree d(W) and a central idempotent-type element E_{W,K} ∈ H(G) acting by the identity on W^K and by 0 on every irreducible not isomorphic to W; consequently {W} splits SmoothRep ℂ G: every smooth V is V_W ⊕ V_W^⊥ with V_W a direct sum of copies of W and no subquotient of V_W^⊥ isomorphic to W. In particular W is projective and injective, and the subcategory of compact representations is semisimple.

**Hypotheses.** G unimodular, locally profinite, countable at infinity; complex coefficients.

**Construction or proof.**
1. Compact ⇔ compactly supported matrix coefficients (Bernstein 1992 Theorem 6).
2. Finitely generated compact ⇒ admissible: V^K is spanned by finitely many e_K π(g)ξ_i (Proposition 11).
3. Schur's lemma (admissibility) and the G × G-map H(G) → W ⊗ W̃ give the formal degree, nonzero by the separation lemma (Propositions 12–13).
4. The elements E_{W,K} = d(W)⁻¹ m(φ(e_K)) split every V (Theorem 8).

**Direct prerequisites.** `SmoothRepresentationsOfLocalGroups:SR.1/hecke-module-equivalence`, `SmoothRepresentationsOfLocalGroups:SR.1/corner-irreducibles`, `SmoothRepresentationsOfLocalGroups:SR.0:abelian-category/smooth-dual`, `SmoothRepresentationsOfLocalGroups:SR.0:abelian-category/admissible`.

**Acceptance checks.**

- G compact: every smooth representation is compact, and the theorem is the semisimplicity of smooth representations of a profinite group over ℂ.
- An irreducible supercuspidal representation of SL_2(ℚ_p) (compact centre) is compact, projective and injective.
- The trivial representation of SL_2(ℚ_p) is not compact (constant matrix coefficient).

**Sources.** `BERNSTEIN92`, Ch. I §5, Definition 12, Theorem 6, Proposition 11, Theorem 7, Propositions 12–13, Theorem 8, pp. 22–26: Compact representations, their compactly supported matrix coefficients, admissibility of finitely generated ones, the formal degree, and the splitting of the category by an irreducible compact representation, which is completely reducible. `BZ76`, Ch. I §2, 2.38–2.44, pp. 26–28: Finite (compact) representations of a unimodular l-group: admissibility, central idempotents and the splitting E = E_ω ⊕ E_ω^⊥. `GS23`, §1, p. 4; proof of Proposition 5.3, p. 18 (arXiv v1): Uses without reference that, for groups with compact centre, the cuspidal part of a smooth representation is semisimple.

#### Cuspidal representations

**Identifier:** `SmoothRepresentationsOfLocalGroups:SR.3a/cuspidal-representations`. **Kind:** definition. **Proposed name:** `TauCeti.SmoothRep.IsQuasiCuspidal`. **Module:** `TauCeti/RepresentationTheory/Smooth/Admissibility`. **Realises:** `SR.3a`, `SR.3`.

Let G be the F-points of a connected reductive group over a nonarchimedean local field F (topology from ReductiveGroupsPartII RG2.0) and V a smooth complex representation. V is quasi-cuspidal if r_P(V) = 0 (equivalently V_N = 0) for every proper parabolic subgroup P = MN of G defined over F; it suffices to check maximal standard parabolics. V is cuspidal if it is quasi-cuspidal and finitely generated. For complex coefficients an irreducible cuspidal representation is called supercuspidal; quasi-cuspidal representations are closed under subquotients, direct sums and twists by characters, and V is quasi-cuspidal iff Hom_G(V, i_P σ) = 0 for all proper P and all σ.

**Hypotheses.** G reductive over F; complex coefficients (the definition makes sense for any A).

**Construction or proof.**
1. Definition via vanishing Jacquet modules; maximal parabolics suffice by transitivity of Jacquet functors.
2. Closure properties: exactness of r_P (jacquet-lemma) and twisting compatibility.
3. Hom criterion: first-adjointness.

**Direct prerequisites.** `SmoothRepresentationsOfLocalGroups:SR.2/jacquet-module`, `SmoothRepresentationsOfLocalGroups:SR.2/jacquet-lemma`, `SmoothRepresentationsOfLocalGroups:SR.2/first-adjointness`, `SmoothRepresentationsOfLocalGroups:SR.2/parabolic-induction`, `ReductiveGroupsPartII:RG2.0`, `tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory`.

**API.**

- `TauCeti.SmoothRep.IsQuasiCuspidal` (data): ∀ proper parabolic P = MN, V_N = 0.
- `TauCeti.SmoothRep.IsCuspidal` (data): Quasi-cuspidal and finitely generated.
- `TauCeti.SmoothRep.isQuasiCuspidal_iff_maximal` (characterisation): It suffices to check maximal standard parabolics.
- `TauCeti.SmoothRep.isQuasiCuspidal_iff_hom` (characterisation): V is quasi-cuspidal iff Hom_G(V, i_P σ) = 0 for all proper P and smooth σ.
- `TauCeti.SmoothRep.IsQuasiCuspidal.quotient` (relation): Closed under subrepresentations, quotients, direct sums and twists.
- `TauCeti.SmoothRep.isQuasiCuspidal_iff_compact_mod_centre` (characterisation): Matrix-coefficient criterion (harish-chandra-compactness).

**Unit tests.**

- `TauCeti.SmoothRep.isQuasiCuspidal_torus` (degenerate): Every smooth representation of a torus T(F) is quasi-cuspidal.
- `TauCeti.SmoothRep.not_isQuasiCuspidal_principalSeries` (non-example): For GL_2(ℚ_p) and any smooth χ, i_B χ is not quasi-cuspidal.
- `TauCeti.SmoothRep.isCuspidal_depthZero_gl2` (computation): The compact induction from ℚ_p^× GL_2(ℤ_p) of an inflated cuspidal representation of GL_2(F_p) is irreducible and cuspidal.
- `TauCeti.SmoothRep.not_isQuasiCuspidal_trivial` (non-example): The trivial representation of GL_2(ℚ_p) is not quasi-cuspidal (its Jacquet module along N is the trivial character).

**Acceptance checks.**

- Every smooth representation of a torus, or of an anisotropic group, is quasi-cuspidal.
- For GL_2(ℚ_p), principal series i_B χ are not quasi-cuspidal (r_B ≠ 0).
- c-Ind_{ℚ_p^× GL_2(ℤ_p)}^{GL_2(ℚ_p)} of the inflation of a cuspidal representation of GL_2(F_p) (central character extended) is supercuspidal.

**Uses.** Casselman 1995, §5: absolutely cuspidal representations, their compact matrix coefficients and projectivity. Bernstein 1992, Ch. II Definitions 14 and 16: quasi-cuspidal and cuspidal representations. Gan–Savin 2023, §1: splitting of the cuspidal part of a theta lift. SmoothRepresentationsOfLocalGroups:SR.3/cuspidal-support: the cuspidal support of an irreducible representation. GL2AutomorphicRepresentationsAndTransfer:R16.2: compact-mod-centre supercuspidal matrix coefficients of GL_2. ExcursionOperatorsAndSpectralAction:ES7:parabolic: supercuspidal support and compact matrix coefficients over Q̄_ℓ.

**Sources.** `CASSELMAN95`, §5.1, definition and Proposition 5.1.1, p. 46: An admissible representation is absolutely cuspidal if V_N = 0 for every proper parabolic, equivalently it has no nonzero maps into proper parabolic inductions. `BERNSTEIN92`, Ch. II Definitions 14 and 16, pp. 34 and 36: Quasi-cuspidal: r_{M,G}V = 0 for proper standard Levis; cuspidal: quasi-cuspidal and finitely generated. `BZ76`, Ch. II §3, 3.18, p. 34: Quasi-cuspidal and cuspidal representations of products of general linear groups.

**Atlas planet:** Cuspidal representations.

#### Harish-Chandra's compactness theorem

**Identifier:** `SmoothRepresentationsOfLocalGroups:SR.3a/harish-chandra-compactness`. **Kind:** theorem. **Proposed name:** `TauCeti.SmoothRep.isQuasiCuspidal_iff_compact_mod_centre`. **Module:** `TauCeti/RepresentationTheory/Smooth/Admissibility`. **Realises:** `SR.3a`, `SR.3`.

For G reductive over F and a smooth complex representation V, the following are equivalent: (1) V is quasi-cuspidal; (2) for every v ∈ V and compact open K, g ↦ e_K π(g⁻¹) v has support compact modulo the centre Z(G); (3) the restriction of V to G° (the subgroup generated by compact subgroups, open with compact centre) is compact. For admissible V this is equivalent to all matrix coefficients being compactly supported modulo Z(G), and to the same property for Ṽ. Consequently every irreducible cuspidal representation is admissible.

**Hypotheses.** G reductive over F; complex coefficients.

**Construction or proof.**
1. Cartan decomposition G = K₀ Λ⁺ K₀ and a congruence subgroup K with an Iwahori decomposition (ReductiveGroupsPartII RG2.4, RG2.3).
2. For dominant λ: V^K ∩ ⋃_n ker a(λⁿ) = V(U_λ) ∩ V^K (Jacquet's lemma with contraction), so quasi-cuspidality bounds the support of λ ↦ a(λ)ξ on Λ⁺ modulo the centre.
3. Restriction to G°: G°/(Z ∩ G°) is compact-mod-centre free, giving compactness.
4. Irreducible cuspidal ⇒ admissible: V|_{G°} is finitely generated (Z G° has finite index and Z acts by scalars by Schur), compact, hence admissible (compact-representations).

**Direct prerequisites.** `SmoothRepresentationsOfLocalGroups:SR.3a/cuspidal-representations`, `SmoothRepresentationsOfLocalGroups:SR.3a/compact-representations`, `SmoothRepresentationsOfLocalGroups:SR.2/jacquet-invariants`, `SmoothRepresentationsOfLocalGroups:SR.1/positive-hecke-homomorphism`, `ReductiveGroupsPartII:RG2.4`, `ReductiveGroupsPartII:RG2.3`.

**Acceptance checks.**

- For a torus every representation is quasi-cuspidal and G° = T(O) compact.
- The trivial representation of SL_2(ℚ_p) has non-compact matrix coefficients and is not quasi-cuspidal.
- Supercuspidal representations of GL_2(ℚ_p) have matrix coefficients compactly supported modulo the centre ℚ_p^×.

**Sources.** `BERNSTEIN92`, Ch. II §1.3, Theorem 11 and Harish-Chandra's Theorem, pp. 34–36; Corollary, pp. 36–37; Ch. II §2.2, p. 42: Quasi-cuspidal ⇔ compact modulo centre; for G° quasi-cuspidal ⇔ compact; irreducible cuspidal representations are admissible; general reductive G as for GL(n). `CASSELMAN95`, Theorem 5.2.1, p. 46; Theorem 5.3.1, pp. 48–49: Absolutely cuspidal admissible representations have matrix coefficients compactly supported modulo Z, and conversely; the property is shared by the contragredient. `BZ76`, Ch. II §3, 3.21, pp. 34–35: For products of general linear groups: quasi-cuspidal ⇔ matrix coefficients finite modulo the centre ⇔ π|_{G°} finite.

**Atlas planet:** Harish-Chandra's compactness theorem.

#### Jacquet's subrepresentation theorem

**Identifier:** `SmoothRepresentationsOfLocalGroups:SR.3a/jacquet-subrepresentation`. **Kind:** theorem. **Proposed name:** `TauCeti.SmoothRep.exists_embedding_parabolicInd_cuspidal`. **Module:** `TauCeti/RepresentationTheory/Smooth/Admissibility`. **Realises:** `SR.3a`, `SR.3`.

Every irreducible smooth complex representation V of G embeds into i_P σ for some parabolic P = MN and some irreducible cuspidal representation σ of M. One may take M minimal among standard Levi subgroups with r_P V ≠ 0, and σ any irreducible quotient of r_P V.

**Hypotheses.** G reductive over F; complex coefficients; V irreducible.

**Construction or proof.**
1. Choose P = MN minimal with r_P V ≠ 0; by transitivity r_{Q∩M}^M r_P V = r_Q V = 0 for Q ⊊ P, so r_P V is quasi-cuspidal.
2. r_P V is finitely generated (jacquet-module, Iwasawa decomposition), so it has an irreducible quotient σ, which is cuspidal.
3. First adjointness turns r_P V ↠ σ into a nonzero map V → i_P σ, injective as V is irreducible.

**Direct prerequisites.** `SmoothRepresentationsOfLocalGroups:SR.3a/cuspidal-representations`, `SmoothRepresentationsOfLocalGroups:SR.2/first-adjointness`, `SmoothRepresentationsOfLocalGroups:SR.2/jacquet-module`.

**Acceptance checks.**

- The trivial representation of GL_2(ℚ_p) embeds in i_B(δ_B^{−1/2}).
- A supercuspidal V: P = G and σ = V.
- The Steinberg representation of GL_2(ℚ_p) embeds in i_B(δ_B^{1/2}).

**Sources.** `BERNSTEIN92`, Ch. II §1.3, Lemma 17, p. 37: Every irreducible W embeds in i_{G,M}(E) with E irreducible cuspidal, using minimality of M, finite generation and first adjointness only. `CASSELMAN95`, Theorem 5.1.2, p. 46: Every irreducible admissible representation embeds in i_P^G σ with σ irreducible absolutely cuspidal. `BZ76`, Ch. II §3, 3.19 and 3.27, pp. 34 and 36: Every irreducible representation of a product of general linear groups embeds in a parabolic induction of an irreducible quasi-cuspidal.

#### Irreducible representations are admissible

**Identifier:** `SmoothRepresentationsOfLocalGroups:SR.3a/admissibility-of-irreducibles`. **Kind:** theorem. **Proposed name:** `TauCeti.SmoothRep.isAdmissible_of_irreducible`. **Module:** `TauCeti/RepresentationTheory/Smooth/Admissibility`. **Realises:** `SR.3a`, `SR.3`.

Every irreducible smooth complex representation V of G(F) is admissible: dim V^K < ∞ for every compact open K. Consequently (Schur) End_G(V) = ℂ, V has a central character ω_V : Z(G) → ℂ^×, Ṽ is irreducible and V ≅ Ṽ̃, and V^K is a simple H(G, K; ℂ)-module or 0. Classification of irreducibles is not used. Schur's lemma End_G(V) = ℂ also holds for any irreducible smooth V of a locally profinite group countable at infinity by the countable-dimension argument.

**Hypotheses.** G reductive over F; complex coefficients; V irreducible smooth.

**Construction or proof.**
1. Embed V ↪ i_P σ with σ irreducible cuspidal (jacquet-subrepresentation).
2. σ is admissible (harish-chandra-compactness), and i_P preserves admissibility (parabolic-induction); subrepresentations of admissible representations over a field are admissible.
3. Schur: End_G(V) is a division algebra of countable dimension over ℂ (V is countably generated), hence ℂ, because otherwise a transcendental element x would give uncountably many linearly independent (x − a)⁻¹.
4. Contragredient: admissible + irreducible ⇒ Ṽ irreducible (smooth-dual).

**Direct prerequisites.** `SmoothRepresentationsOfLocalGroups:SR.3a/jacquet-subrepresentation`, `SmoothRepresentationsOfLocalGroups:SR.3a/harish-chandra-compactness`, `SmoothRepresentationsOfLocalGroups:SR.2/parabolic-induction`, `SmoothRepresentationsOfLocalGroups:SR.0:abelian-category/admissible`, `SmoothRepresentationsOfLocalGroups:SR.0:abelian-category/smooth-dual`, `SmoothRepresentationsOfLocalGroups:SR.1/corner-irreducibles`, `mathlib:Module.End.instDivisionRing`, `mathlib:Transcendental.linearIndependent_sub_inv`; `mathlib:CategoryTheory.Simple`.

**Acceptance checks.**

- For GL_1 = ℚ_p^×, irreducible smooth representations are characters.
- dim i_B(χ)^{GL_2(ℤ_p)} ≤ 1 for GL_2.
- The statement fails for non-smooth irreducible representations: ℂ[ℚ_p] with left translation is not smooth.

**Sources.** `BERNSTEIN92`, Ch. II §1.3, Theorem 12, p. 37; Theorem 15, p. 43; Ch. I §4.2, Schur's Lemma and Lemma 8, pp. 19–20: Every irreducible representation is admissible, proved by embedding into an induction of an irreducible cuspidal; Schur's lemma via countable dimension. `BZ76`, Ch. II §3, 3.25, pp. 35–36; Ch. I §2, 2.11, p. 18: Admissibility of irreducible representations of products of general linear groups and Schur's lemma. `CASSELMAN95`, Propositions 2.1.10–2.1.13, p. 22: For admissible representations: π ≅ π̃̃, exactness of the contragredient, and π irreducible iff π̃ is.

**Atlas planet:** Admissibility of irreducible representations.

#### The Hecke algebra decomposition

**Identifier:** `SmoothRepresentationsOfLocalGroups:SR.3a/hecke-algebra-decomposition`. **Kind:** theorem. **Proposed name:** `TauCeti.SmoothRep.heckeAlgebra_decomposition`. **Module:** `TauCeti/RepresentationTheory/Smooth/Admissibility`.

Let G be reductive over F, K₀ a special maximal compact subgroup and K ⊆ K₀ a congruence subgroup normal in K₀ with an Iwahori decomposition with respect to every standard parabolic (Bruhat). Let Λ⁺ be the dominant part of the lattice of a maximal split torus (with a finite set of representatives of Λ/Λ⁺-type corrections). Then H(G, K; ℂ) = H₀ · D · C · H₀ where H₀ = H(K₀, K) and D are finite-dimensional subspaces spanned by double-coset elements, and C = span{[KλK] : λ ∈ Λ⁺} is a commutative subalgebra, finitely generated as an algebra. In particular H(G, K) is a finite sum Σ u_i C v_j.

**Hypotheses.** G reductive over F; K a congruence subgroup in good position (ReductiveGroupsPartII RG2.3); Cartan decomposition (RG2.4).

**Construction or proof.**
1. Cartan decomposition G = K₀ Λ⁺ K₀ and K₀ = ⋃ x_i K (finite), so G = ⋃ K x_i λ x_j K and [K x_i λ x_j K] = [K x_i K][KλK][K x_j K] since K₀ normalises K.
2. Commutativity and multiplicativity of λ ↦ [KλK] on Λ⁺: positive-hecke-homomorphism (λ dominant is K-positive).
3. Finite generation: Λ⁺ is a finitely generated monoid (Gordan).

**Direct prerequisites.** `SmoothRepresentationsOfLocalGroups:SR.1/positive-hecke-homomorphism`, `SmoothRepresentationsOfLocalGroups:SR.1/iwahori-decomposition`, `SmoothRepresentationsOfLocalGroups:SR.1/permutation-hecke-algebra`, `ReductiveGroupsPartII:RG2.4`, `ReductiveGroupsPartII:RG2.3`.

**Acceptance checks.**

- GL_n, K = 1 + ϖ^i M_n(O): C = span{a(diag(ϖ^{l₁},…,ϖ^{l_n})) : l₁ ≥ … ≥ l_n} with a(λμ) = a(λ)a(μ).
- For G = T a torus, H(T, K) = ℂ[T/K] = C itself.
- C is commutative but in general not central, so H(G, K) is generated over C 'in the middle' rather than as a C-module (Bernstein 1992, remark after Theorem 9).

**Sources.** `BERNSTEIN92`, Ch. II §1.1, Theorem 9, p. 29, and its proof, pp. 29–30; Ch. II §2.1, Theorem 13, p. 42: H_K(G) = H₀CH₀ with C commutative and finitely generated for GL(n) and congruence K; for general reductive G, H_K(G) = H₀DCH₀ with C commutative. `BZ76`, Ch. II §4, 4.9, p. 39: For GL-products and congruence N, the elements γ̄_i * δ̄ * γ̄_j span 𝓗_N and the δ̄ for dominant diagonal δ multiply, spanning a commutative algebra generated by finitely many elements. `BD84`, §2.1 c), p. 16: For P minimal and good K, the [K][a][K], a ∈ A⁺, span a commutative finitely generated subalgebra B with H(G, K) a finite sum of uBv.

**Atlas planet:** Hecke algebra decomposition.

#### Dimension bound for commutative subalgebras

**Identifier:** `SmoothRepresentationsOfLocalGroups:SR.3a/commutative-subalgebra-bound`. **Kind:** theorem. **Proposed name:** `TauCeti.finrank_commSubalgebra_le`. **Module:** `TauCeti/RepresentationTheory/Smooth/Admissibility`.

Let V be an m-dimensional complex vector space and R ⊆ End(V) a commutative subalgebra generated (with 1) by l elements. Then dim R ≤ m^{2 − 2^{1−l}}.

**Hypotheses.** V finite-dimensional over ℂ (any algebraically closed field); R commutative, generated by l elements.

**Construction or proof.**
1. Decompose V into joint generalised eigenspaces of the generators; R is the product of its images on them, reducing to commuting nilpotent generators a_i − λ_i.
2. With 𝒥 the (nilpotent) ideal generated by the nilpotent generators, filter V by 𝒥^k V and bound dim R by induction on l and m.

**Acceptance checks.**

- l = 1: dim ℂ[a] ≤ m = m^{2 − 1}.
- Commutativity is needed: End(V) is generated by two elements and has dimension m² > m^{3/2} for m ≥ 2.
- For m = 1 every bound gives 1; Bernstein records the sharper bound dim R ≤ m + l as a conjecture.

**Sources.** `BZ76`, Ch. II §4, 4.10 and proof 4.12, pp. 39–40: A commutative subalgebra of End V generated by l elements has dimension at most m^{2 − 2^{1−l}}. `BERNSTEIN92`, Ch. II §1.4, Proposition 20, p. 38: States the bound dim C ≤ m^{2 − 1/2^{l−1}} and refers to [BZ0] for the proof; the bound m + l is recorded as a conjecture.

#### Uniform admissibility

**Identifier:** `SmoothRepresentationsOfLocalGroups:SR.3a/uniform-admissibility`. **Kind:** theorem. **Proposed name:** `TauCeti.SmoothRep.uniform_admissibility`. **Module:** `TauCeti/RepresentationTheory/Smooth/Admissibility`.

Let G be reductive over F and K a compact open subgroup. There is a constant c(G, K) such that dim_ℂ V^K ≤ c(G, K) for every irreducible smooth complex representation V; equivalently every simple H(G, K; ℂ)-module has dimension ≤ c(G, K). One can take c = d^{2^l} where H(G, K) = Σ_{i,j ≤ d} u_i C v_j with C commutative generated by l elements. The bound is uniform in V, not merely finiteness for each V. It is not asserted for characteristic-p coefficients or for integral coefficient rings.

**Hypotheses.** G reductive over F; K compact open (reduce to a congruence subgroup in good position: V^K ⊆ V^{K'} for K' ⊆ K); complex coefficients.

**Construction or proof.**
1. V^K is a simple H(G, K)-module (corner-irreducibles), finite-dimensional by admissibility-of-irreducibles; let k = dim V^K.
2. Burnside: ρ(H(G, K)) = End(V^K), so k² = dim ρ(H) ≤ d² dim ρ(C) by hecke-algebra-decomposition.
3. ρ(C) ⊆ End(V^K) is commutative generated by l elements: dim ρ(C) ≤ k^{2 − 2^{1−l}} (commutative-subalgebra-bound).
4. Hence k^{2^{1−l}} ≤ d², i.e. k ≤ d^{2^l}.

**Direct prerequisites.** `SmoothRepresentationsOfLocalGroups:SR.3a/admissibility-of-irreducibles`, `SmoothRepresentationsOfLocalGroups:SR.3a/hecke-algebra-decomposition`, `SmoothRepresentationsOfLocalGroups:SR.3a/commutative-subalgebra-bound`, `SmoothRepresentationsOfLocalGroups:SR.1/corner-irreducibles`, `mathlib:Module.Finite.toModuleEnd_moduleEnd_surjective`.

**Acceptance checks.**

- For G = T a torus and any K, c(T, K) = 1 works (irreducibles are characters).
- For GL_2(ℚ_p) and K = GL_2(ℤ_p), every irreducible has dim V^K ≤ 1.
- The bound concerns irreducible V only: a direct sum of N copies of a spherical representation of GL_2(ℚ_p) has GL_2(ℤ_p)-invariants of dimension N.

**Uses.** AutomorphicSpectralTheory:AS.4: spectral finiteness at fixed group and level. SmoothRepresentationsOfLocalGroups:SR.2a/stabilization: the stabilisation exponent is bounded by c(G, K). SmoothRepresentationsOfLocalGroups:SR.3a/finitely-many-cuspidals: uniform support of matrix coefficients of cuspidals at level K.

**Sources.** `BERNSTEIN92`, Ch. II §1.4, Uniform Admissibility Theorem and its proof, pp. 37–38; Ch. II §2.2, p. 43: dim V^K ≤ c(G, K) for every irreducible V, proved from H_K = H₀CH₀, Proposition 20, Burnside's theorem and finite-dimensionality from Theorem 12; general reductive G as for GL(n). `BZ76`, Ch. II §4, 4.7–4.11, pp. 39–40: Uniform bound s(G, N) for irreducible 𝓗_N-modules of GL-products, proved by Burnside and the commutative-subalgebra bound, after 4.6 = 3.25 gives finite-dimensionality.

**Atlas planet:** Uniform admissibility.

#### Finitely many cuspidal components at fixed level

**Identifier:** `SmoothRepresentationsOfLocalGroups:SR.3a/finitely-many-cuspidals`. **Kind:** theorem. **Proposed name:** `TauCeti.SmoothRep.finite_cuspidal_components_at_level`. **Module:** `TauCeti/RepresentationTheory/Smooth/Admissibility`. **Realises:** `SR.3a`, `SR.3`.

Let K be a compact open subgroup of G. There is a subset Ω(G, K) ⊆ G° compact such that every K-bi-invariant matrix coefficient g ↦ e_K π(g⁻¹)ξ of every irreducible cuspidal representation of G° is supported in Ω(G, K). Consequently only finitely many isomorphism classes of irreducible cuspidal representations of G° have nonzero K-fixed vectors, and only finitely many cuspidal components of G (unramified-twist classes of irreducible cuspidals) have K-fixed vectors.

**Hypotheses.** G reductive over F; K compact open; complex coefficients.

**Construction or proof.**
1. Compactness of cuspidals of G°: λ ↦ a(λ)ξ has finite support on the strict cone Λ⁺°, and the vanishing order is controlled by dim W^K ≤ c(G, K) (uniform-admissibility): a(λ^k) kills W^K for k ≥ c.
2. Matrix coefficients of pairwise non-isomorphic irreducibles are linearly independent functions supported in Ω(G, K), whose space of K-bi-invariant functions is finite-dimensional.

**Direct prerequisites.** `SmoothRepresentationsOfLocalGroups:SR.3a/uniform-admissibility`, `SmoothRepresentationsOfLocalGroups:SR.3a/harish-chandra-compactness`, `SmoothRepresentationsOfLocalGroups:SR.3a/compact-representations`.

**Acceptance checks.**

- For G = GL_1, G° = O^× and the cuspidal components with K-fixed vectors are the characters of O^×/K: finitely many.
- For GL_2(ℚ_p) and K = GL_2(ℤ_p) there are no cuspidal components with K-fixed vectors.
- Without uniform admissibility the supports could grow with the representation; the finiteness is uniform in the cuspidal.

**Sources.** `BERNSTEIN92`, Ch. II §1.4, Proposition 21, Corollary and Lemma 18, pp. 38–39; Ch. II §2.2, Theorem 16 and Corollary, p. 43: Uniform compact support Ω(G, K) of K-level matrix coefficients of irreducible cuspidals of G°, deduced from uniform admissibility, and finiteness of the irreducible cuspidals of G° with K-fixed vectors. `BZ76`, Ch. II §4, 4.14–4.16, p. 41: G has only finitely many irreducible cuspidal representations with a given central character and nonzero N-fixed vectors.

### SR.3. Admissible complex representations

Admissible complex representations of a reductive p-adic group. The layer covers unramified characters, cuspidal support, finite length of parabolic inductions, generic irreducibility, and Bernstein components and the splitting of cuspidal components. The Bernstein decomposition follows, then noetherianity, the centre as regular functions on the Bernstein variety, finiteness of Hecke algebras over the centre, the universal unramified twist and the compatibilities of the centre. On the analytic side it gives square-integrable and tempered representations, Casselman's criterion and the Langlands classification. It ends with the Iwahori block, the Steinberg representation and isotypic quotients of the regular representation. The centre is proved by the Bernstein–Deligne route, which does not use second adjointness.

**Planets of this layer:** Cuspidal support (`cuspidal-support`); Bernstein decomposition (`bernstein-decomposition`); Bernstein centre (`bernstein-centre-blocks`); Square-integrable and tempered representations (`square-integrable-tempered`); Langlands classification (`langlands-classification`); Iwahori block (Borel–Casselman) (`borel-casselman-block`).

#### Unramified characters and the group G°

**Identifier:** `SmoothRepresentationsOfLocalGroups:SR.3/unramified-characters`. **Kind:** definition. **Proposed name:** `TauCeti.SmoothRep.unramifiedCharacters`. **Module:** `TauCeti/RepresentationTheory/Smooth/Bernstein`.

For G reductive over F let G° be the subgroup generated by all compact subgroups; it is open and normal, G/G° = Λ(G) is a lattice of rank equal to the split rank of the centre, and Z(G)G° has finite index. An unramified character of G is a smooth character trivial on G°; they form the complex algebraic torus Ψ(G) = Hom(Λ(G), ℂ^×), with coordinate ring ℂ[Λ(G)]. Ψ(G) acts on irreducible representations by twisting. For a Levi M this gives Ψ(M), which acts on cuspidal representations of M.

**Hypotheses.** G reductive over F (ReductiveGroupsPartII RG2.0–RG2.1); complex coefficients.

**Construction or proof.**
1. G° = ⋂_χ ker |χ| over rational characters χ of G (standard); the quotient embeds in Hom(X*(G)_F, ℤ) with finite cokernel.
2. Ψ(G) = Hom(Λ(G), ℂ^×) ≅ (ℂ^×)^r is a torus; twisting preserves smoothness and irreducibility.

**Direct prerequisites.** `SmoothRepresentationsOfLocalGroups:SR.0:abelian-category/smooth-character`, `ReductiveGroupsPartII:RG2.0`, `ReductiveGroupsPartII:RG2.1`.

**API.**

- `TauCeti.SmoothRep.compactlyGeneratedSubgroup` (data): G° as an open normal subgroup.
- `TauCeti.SmoothRep.unramifiedCharacters` (data): Ψ(G) = Hom(G/G°, ℂ^×), a complex torus with coordinate ring ℂ[G/G°].
- `TauCeti.SmoothRep.unramifiedCharacters_isSmoothCharacter` (relation): Every element of Ψ(G) is a smooth character.
- `TauCeti.SmoothRep.finiteIndex_center_mul` (relation): Z(G)G° has finite index in G.
- `TauCeti.SmoothRep.twistUnramified` (functoriality): The action of Ψ(G) on SmoothRep ℂ G by twisting.

**Unit tests.**

- `TauCeti.SmoothRep.unramifiedCharacters_gl1` (computation): For G = ℚ_p^×, Ψ(G) ≅ ℂ^× via χ ↦ χ(p).
- `TauCeti.SmoothRep.unramifiedCharacters_sl2` (degenerate): For SL_2(ℚ_p), G° = G and Ψ(G) is trivial.
- `TauCeti.SmoothRep.not_unramified_ramified` (non-example): A character of ℚ_p^× nontrivial on ℤ_p^× is smooth but not unramified.
- `TauCeti.SmoothRep.unramified_eq_isSmoothCharacter_trivial_on` (compatibility): An unramified character is a smooth character (SR.0 smooth-character) trivial on G°.

**Acceptance checks.**

- GL_n: G° = {g : det g ∈ O^×}, Λ(G) ≅ ℤ via v ∘ det, Ψ(G) = {|det|^s} ≅ ℂ^×.
- SL_2: G° = G and Ψ(G) is trivial.
- For a split torus T ≅ (F^×)^r, T° = T(O) and Ψ(T) = (ℂ^×)^r.

**Uses.** SmoothRepresentationsOfLocalGroups:SR.3/bernstein-components: inertial classes are unramified-twist orbits of cuspidal data. SmoothRepresentationsOfLocalGroups:SR.3/universal-unramified-twist: the universal unramified twist over ℂ[Λ(M)]. Bernstein 1992, Ch. II §3: relations between G and G°, cuspidal components D = Ψ(G)·ρ.

**Sources.** `BERNSTEIN92`, Ch. II §2.1, Proposition 22, p. 39; Ch. II §3, Definition 18, p. 43: G° generated by compact subgroups is open normal with compact centre, G/G° is a lattice, Z G° has finite index; unramified characters Ψ(G) = Hom(Λ(G), ℂ^×). `BERNSTEIN87`, §2.2 (*), p. 9: The open normal subgroup G⁰ with G/G⁰ a lattice and the group Ψ(G) of unramified characters.

#### Cuspidal support

**Identifier:** `SmoothRepresentationsOfLocalGroups:SR.3/cuspidal-support`. **Kind:** definition. **Proposed name:** `TauCeti.SmoothRep.cuspidalSupport`. **Module:** `TauCeti/RepresentationTheory/Smooth/Bernstein`.

A cuspidal datum of G is a pair (M, σ) of a Levi subgroup M (of a parabolic of G) and an irreducible cuspidal representation σ of M, up to G-conjugacy. Every irreducible V is a subquotient of i_P σ for some cuspidal datum (M, σ) (jacquet-subrepresentation), and the datum is unique up to G-conjugacy: the cuspidal support scs(V). Each cuspidal datum is the support of finitely many irreducibles, namely the irreducible subquotients of i_P σ, independent of the parabolic P with Levi M; every irreducible subquotient of i_P σ embeds into i_P(wσ) for some w ∈ W(M) = N_G(M)/M.

**Hypotheses.** G reductive over F; complex coefficients.

**Construction or proof.**
1. Existence: jacquet-subrepresentation.
2. Uniqueness: if V is a subquotient of i_P σ and of i_Q τ, then r applied along the minimal Levi gives, by the geometric lemma, that τ is a constituent of w r(σ) for some w; since σ, τ are cuspidal this forces (L, τ) = w(M, σ) (Bernstein 1992 Theorem 18; Casselman Theorem 6.3.6; Bernstein–Zelevinsky 1977 Theorem 2.9).
3. Finiteness: i_P σ has finite length (finite-length).

**Direct prerequisites.** `SmoothRepresentationsOfLocalGroups:SR.3a/jacquet-subrepresentation`, `SmoothRepresentationsOfLocalGroups:SR.3a/cuspidal-representations`, `SmoothRepresentationsOfLocalGroups:SR.2/geometric-lemma`, `SmoothRepresentationsOfLocalGroups:SR.3/finite-length`.

**API.**

- `TauCeti.SmoothRep.CuspidalDatum` (data): Pairs (M, σ) with M a Levi and σ irreducible cuspidal, modulo G-conjugacy.
- `TauCeti.SmoothRep.cuspidalSupport` (data): scs : Irr G → CuspidalDatum G.
- `TauCeti.SmoothRep.cuspidalSupport_spec` (characterisation): V is a subquotient of i_P σ iff scs(V) = [M, σ].
- `TauCeti.SmoothRep.cuspidalSupport_unique` (relation): Uniqueness up to G-conjugacy.
- `TauCeti.SmoothRep.cuspidalSupport_fiber_finite` (relation): Each fibre of scs is finite.
- `TauCeti.SmoothRep.embedding_weyl_translate` (relation): Every irreducible subquotient of i_P σ embeds in i_P(wσ) for some w ∈ W(M).

**Unit tests.**

- `TauCeti.SmoothRep.cuspidalSupport_trivial_gl2` (computation): scs(1_{GL_2(ℚ_p)}) = [T, |·|^{−1/2} ⊗ |·|^{1/2}].
- `TauCeti.SmoothRep.cuspidalSupport_supercuspidal` (degenerate): scs(V) = [G, V] for V irreducible cuspidal.
- `TauCeti.SmoothRep.cuspidalSupport_steinberg_gl2` (computation): The Steinberg representation of GL_2(ℚ_p) has the same cuspidal support as the trivial representation.
- `TauCeti.SmoothRep.cuspidalSupport_ne_twist` (non-example): For GL_2(ℚ_p), i_B(1 ⊗ 1) and i_B(|·| ⊗ 1) have different cuspidal supports.

**Acceptance checks.**

- GL_2: the constituents of i_B(χ₁ ⊗ χ₂) have support (T, χ₁ ⊗ χ₂) up to swapping; the trivial representation has support (T, |·|^{−1/2} ⊗ |·|^{1/2}).
- A supercuspidal V has support (G, V).
- Supports are taken up to conjugacy, not up to unramified twist: i_B(χ ⊗ χ) and i_B(χ|·| ⊗ χ) have different supports but the same inertial class.

**Uses.** Calegari–Geraghty 2020, proof of Theorem 6.13: a representation with Iwahori-fixed vectors is a subquotient of an unramified principal series. IntegralHeckeAndGaloisDeterminantsPartII:IHR.2: constituents of n-Ind χ embed in n-Ind(wχ ⊗ η) for some w and unramified η. ExcursionOperatorsAndSpectralAction:ES7:parabolic: supercuspidal support and GL_n segment classification. Ding 2025, §3.1: the Bernstein component of a generic principal series. SmoothRepresentationsOfLocalGroups:SR.3/bernstein-components: inertial support = supercuspidal support up to unramified twist.

**Sources.** `BERNSTEIN92`, Ch. III §2.1, Definition 22, Theorem 18, Lemma 25 and Corollary, Proposition 30, pp. 55–56: Cuspidal data, uniqueness up to association of the cuspidal datum of an irreducible representation, and finiteness of the fibres of the cuspidal-support map. `CASSELMAN95`, Theorem 6.3.6, p. 59; Corollaries 6.3.7 and 7.2.2, pp. 59, 68: Uniqueness of the cuspidal support up to W-conjugacy; every constituent of i_{P_Θ}σ embeds in a Weyl translate induced from the same parabolic. `BZ77`, §2.5 and Theorems 2.8–2.9, pp. 446–448: Jacquet's subrepresentation theorem and uniqueness of the cuspidal data of an irreducible representation up to association.

**Atlas planet:** Cuspidal support.

#### Finite length

**Identifier:** `SmoothRepresentationsOfLocalGroups:SR.3/finite-length`. **Kind:** theorem. **Proposed name:** `TauCeti.SmoothRep.finiteLength_parabolicInd`. **Module:** `TauCeti/RepresentationTheory/Smooth/Bernstein`.

(1) If σ is an admissible representation of finite length of a Levi M, then i_P σ has finite length; for σ irreducible cuspidal its length is at most |W(M)|. (2) Every finitely generated admissible complex representation of G has finite length (Howe). (3) A smooth V all of whose irreducible subquotients are non-cuspidal has finite length if r_P V has finite length for every maximal standard parabolic P; length(V) ≤ Σ_P length(r_P V).

**Hypotheses.** G reductive over F; complex coefficients.

**Construction or proof.**
1. (1) Geometric lemma: r_Q i_P σ has a filtration by Weyl translates; each irreducible subquotient of i_P σ has nonzero Jacquet module along P (cuspidal-support), so length ≤ length of r_P i_P σ (Casselman 6.3.7–6.3.8, 7.2.3).
2. (2) Induction on semisimple rank: the kernel of V → ⊕_P i_P(V_N) over maximal P is cuspidal admissible, hence a finite sum of irreducible cuspidals (compact-representations); the image has finite length by (1) (Casselman 6.3.10).
3. (3) Each irreducible non-cuspidal subquotient contributes to some r_P with P maximal, and r_P is exact (Gan–Savin §14.2 criterion).

**Direct prerequisites.** `SmoothRepresentationsOfLocalGroups:SR.2/geometric-lemma`, `SmoothRepresentationsOfLocalGroups:SR.3a/compact-representations`, `SmoothRepresentationsOfLocalGroups:SR.3a/harish-chandra-compactness`, `SmoothRepresentationsOfLocalGroups:SR.2/jacquet-module`, `SmoothRepresentationsOfLocalGroups:SR.2/parabolic-induction`.

**Acceptance checks.**

- GL_2: i_B χ has length 1 or 2.
- A finitely generated admissible representation of a torus is finite-dimensional.
- Admissibility is needed in (2): c-Ind_{GL_2(ℤ_p)}^{GL_2(ℚ_p)} 1 is finitely generated and of infinite length.

**Sources.** `CASSELMAN95`, Corollaries 6.3.7–6.3.8, pp. 59–60; Theorem 6.3.10, pp. 60–61; Corollary 7.2.3, p. 68: Finite length of i_P σ for admissible σ of finite length, finite length of finitely generated admissible representations, and length ≤ |W(Θ, Θ)| for cuspidal σ. `GS23`, §14.2, p. 49, and proof of Proposition 14.2, p. 51 (arXiv v1): Reduces finite length of the non-cuspidal part to finite length of its Jacquet modules along maximal parabolics.

#### Generic irreducibility of induced representations

**Identifier:** `SmoothRepresentationsOfLocalGroups:SR.3/generic-irreducibility`. **Kind:** theorem. **Proposed name:** `TauCeti.SmoothRep.parabolicInd_irreducible_generic`. **Module:** `TauCeti/RepresentationTheory/Smooth/Bernstein`.

Let σ be an irreducible cuspidal (more generally discrete series) representation of a Levi M and P = MN. For ψ in a nonempty Zariski-open subset of the torus Ψ(M), i_P(ψσ) is irreducible. In particular every element z of the centre acts on i_P(ψσ) by a scalar z(ψσ), and ψ ↦ z(ψσ) is a regular function on Ψ(M).

**Hypotheses.** G reductive over F; complex coefficients; σ irreducible cuspidal (or square-integrable) on M.

**Construction or proof.**
1. For unitary ψσ not fixed by non-trivial elements of W(M), i_P(ψσ) is irreducible (intertwining operators and unitarity; Bernstein 1992 Ch. IV §1.2; Konno 2003 §4).
2. The reducibility locus is Zariski-closed in Ψ(M) (rationality of intertwining operators), so its complement is open and nonempty.
3. Scalar action of the centre: Schur's lemma on the irreducible members and Zariski density.

**Direct prerequisites.** `SmoothRepresentationsOfLocalGroups:SR.3/unramified-characters`, `SmoothRepresentationsOfLocalGroups:SR.2/parabolic-induction`, `SmoothRepresentationsOfLocalGroups:SR.3a/admissibility-of-irreducibles`, `SmoothRepresentationsOfLocalGroups:SR.3/finite-length`.

**Acceptance checks.**

- GL_2, M = T, σ = 1: i_B(ψ) is irreducible unless ψ₁/ψ₂ = |·|^{±1}.
- M = G: i_G σ = σ is irreducible for all ψ.
- The open set can be proper: i_B(|·|^{1/2} ⊗ |·|^{−1/2}) is reducible.

**Sources.** `BERNSTEIN92`, Ch. III §3.3, Lemma 35, p. 69; Ch. IV §1.2 (Theorem 27): For almost all unramified ψ, Π_ψ = i_{G,N}(ψρ) is irreducible, proved with unitary structures. `KONNO03`, §4.2, Corollary 4.3, pp. 405–407: Parabolic inductions of discrete series representations are irreducible on a Zariski-open subset of the variety of unramified twists. `BD84`, Proposition 2.11, p. 21: An element of the centre of a block acts on i_P(π) (π in a cuspidal component) by a scalar depending regularly on π, using generic irreducibility.

#### Inertial classes and Bernstein components

**Identifier:** `SmoothRepresentationsOfLocalGroups:SR.3/bernstein-components`. **Kind:** definition. **Proposed name:** `TauCeti.SmoothRep.InertialClass`. **Module:** `TauCeti/RepresentationTheory/Smooth/Bernstein`.

Two cuspidal data (M, σ), (M', σ') are inertially equivalent if there are g ∈ G and ψ ∈ Ψ(M') with gMg⁻¹ = M' and gσ ≅ ψσ'. The inertial classes s = [M, σ]_G form the set B(G). For s = [M, σ] the cuspidal component D = Ψ(M)·σ ⊆ Irr_cusp(M) is a quotient of the torus Ψ(M) by the finite stabiliser of σ, and W_s = W(M, D) = {w ∈ N_G(M)/M : wD = D}. The variety of cuspidal data Ω(G) = ⊔_s D_s/W_s, and the inertial support of an irreducible V is the class of its cuspidal support. The full subcategory Rep_s(G) consists of smooth V all of whose irreducible subquotients have inertial support s.

**Hypotheses.** G reductive over F; complex coefficients.

**Construction or proof.**
1. Ψ(M) acts on cuspidal representations of M with finite stabilisers (Bernstein 1992 Lemma 21).
2. Ω(G) is an algebraic variety, a disjoint union of the quotients D/W(M, D) (Bernstein 1992 Proposition 31).

**Direct prerequisites.** `SmoothRepresentationsOfLocalGroups:SR.3/cuspidal-support`, `SmoothRepresentationsOfLocalGroups:SR.3/unramified-characters`.

**API.**

- `TauCeti.SmoothRep.InertialClass` (data): B(G): cuspidal data modulo G-conjugacy and unramified twist.
- `TauCeti.SmoothRep.inertialSupport` (data): Irr G → B(G), the class of the cuspidal support.
- `TauCeti.SmoothRep.cuspidalComponent` (data): D_s = Ψ(M)·σ with its structure of a quotient torus.
- `TauCeti.SmoothRep.bernsteinWeylGroup` (data): W_s = W(M, D), finite.
- `TauCeti.SmoothRep.blockSubcategory` (data): Rep_s(G): smooth representations whose irreducible subquotients all have inertial support s.
- `TauCeti.SmoothRep.varietyCuspidalData` (data): Ω(G) = ⊔_s D_s/W_s.

**Unit tests.**

- `TauCeti.SmoothRep.inertialClass_gl1` (computation): For ℚ_p^×, inertial classes correspond to characters of ℤ_p^×.
- `TauCeti.SmoothRep.inertialSupport_trivial_steinberg` (computation): The trivial and Steinberg representations of GL_2(ℚ_p) have the same inertial support [T, 1].
- `TauCeti.SmoothRep.bernsteinWeylGroup_supercuspidal` (degenerate): For s = [G, σ], W_s is trivial.
- `TauCeti.SmoothRep.inertialSupport_ne_ramified` (non-example): i_B(χ ⊗ 1) with χ ramified on ℤ_p^× is not in the unramified block [T, 1].

**Acceptance checks.**

- G = GL_1: B(G) = characters of O^× = ℤ_p^×-characters; each D is ℂ^×.
- GL_2: the unramified principal series block s = [T, 1] has D = (ℂ^×)² and W_s = S_2.
- A supercuspidal σ of G gives s = [G, σ] with D = Ψ(G)σ and W_s trivial.

**Uses.** AutomorphicGaloisRepresentationsPartII:AG2.0: Bernstein components and type idempotents. GL2AutomorphicRepresentationsAndTransfer:R16.2: Bernstein inertial equivalence and typical K-types. Ding 2025, §3.1.2 and §3.2.2: the Bernstein component of π_sm(φ) and the maps J_w. SmoothRepresentationsOfLocalGroups:SR.3/bernstein-decomposition: the category splits along inertial classes.

**Sources.** `BERNSTEIN92`, Ch. II §3, Lemma 21 and Definition 19, p. 44; Ch. III §2.1, Definition 22, Proposition 31, Lemma 27, pp. 55–57: Cuspidal components, the variety Ω(G) of cuspidal data and its connected components D/W(M, D). `BD84`, §2.6 and Proposition 2.10, pp. 19–20: The pairs (L, D) of a Levi and a cuspidal component, up to conjugacy, index the summands of the category.

#### Splitting off cuspidal components

**Identifier:** `SmoothRepresentationsOfLocalGroups:SR.3/cuspidal-splitting`. **Kind:** theorem. **Proposed name:** `TauCeti.SmoothRep.cuspidalComponent_splits`. **Module:** `TauCeti/RepresentationTheory/Smooth/Bernstein`.

Each cuspidal component D of G (an unramified-twist class of irreducible cuspidal representations) splits SmoothRep ℂ G, and so does the set of all irreducible cuspidals: SmoothRep ℂ G = M_cusp × M_ind with M_cusp = ∏_D M(D). For D = Ψ(G)ρ, Π(D) = c-Ind_{G°}^G(ρ|_{G°}) ≅ ℂ[Λ(G)] ⊗ ρ is a finitely generated projective generator of M(D), and M(D) is equivalent to modules over End(Π(D))ᵒᵖ, a twisted group algebra of the finite stabiliser of ρ over ℂ[Ψ(G)].

**Hypotheses.** G reductive over F; complex coefficients.

**Construction or proof.**
1. ρ|_{G°} is compact (harish-chandra-compactness), so its irreducible summands split M(G°) (compact-representations); the splitting is G-invariant.
2. Infinitely many components: finitely many have K-fixed vectors (finitely-many-cuspidals), so the splittings at each level are compatible.
3. Π(D) is projective by Frobenius reciprocity for the open subgroup G° and semisimplicity of M(G°)-components; it generates M(D) since every object of M(D) restricted to G° is a sum of constituents of ρ|_{G°}.

**Direct prerequisites.** `SmoothRepresentationsOfLocalGroups:SR.3a/finitely-many-cuspidals`, `SmoothRepresentationsOfLocalGroups:SR.3a/compact-representations`, `SmoothRepresentationsOfLocalGroups:SR.3a/harish-chandra-compactness`, `SmoothRepresentationsOfLocalGroups:SR.3/unramified-characters`, `SmoothRepresentationsOfLocalGroups:SR.2/compact-induction`, `SmoothRepresentationsOfLocalGroups:SR.2/frobenius-reciprocity`, `SmoothRepresentationsOfLocalGroups:SR.1/locally-unital-algebra`.

**Acceptance checks.**

- G = GL_1: D = {characters with fixed restriction to ℤ_p^×}, M(D) ≃ ℂ[t, t⁻¹]-modules.
- For a supercuspidal of SL_2(ℚ_p) (compact centre), M(D) is semisimple with one simple object.
- For GL_2(ℚ_p) and D = Ψ(G)σ (σ supercuspidal), M(D) ≃ ℂ[t, t⁻¹]-modules when σ has trivial stabiliser.

**Sources.** `BERNSTEIN92`, Ch. II §3, Proposition 26, Theorem 17 and Corollary, Proposition 27, Lemma 22, Proposition 28, pp. 44–49: Each cuspidal component splits M(G); the irreducible cuspidals split M(G) (via uniform admissibility); Π(D) = ind_{G°}^G(ρ|G°) is a finitely generated projective generator and M(D) is modules over a twisted group algebra over ℂ[Ψ(G)]. `BERNSTEIN87`, §2.1–2.2, pp. 9–10; §4.1, p. 17: Separation of compactly supported modules and of cuspidal components; Π(D) is a finitely generated projective generator of M(D) with End(Π(D)) = ⊕ F·a_γ. `CASSELMAN95`, Theorem 5.4.1, Proposition 5.4.2, pp. 49–50: Absolutely cuspidal ω-representations are projective and injective in the category with fixed central character, and direct sums of irreducible cuspidals.

#### The Bernstein decomposition

**Identifier:** `SmoothRepresentationsOfLocalGroups:SR.3/bernstein-decomposition`. **Kind:** theorem. **Proposed name:** `TauCeti.SmoothRep.bernsteinDecomposition`. **Module:** `TauCeti/RepresentationTheory/Smooth/Bernstein`.

SmoothRep ℂ G is the product of the full subcategories Rep_s(G) over the inertial classes s ∈ B(G): every smooth V decomposes uniquely as V = ⊕_s V_s with V_s ∈ Rep_s(G), naturally in V, and Hom between different blocks vanishes. For each compact open K only finitely many s have Rep_s(G)^K ≠ 0. The cuspidal blocks are those of cuspidal-splitting.

**Hypotheses.** G reductive over F; complex coefficients.

**Construction or proof.**
1. Every V embeds in ⊕_M i_P(r_P(V)_cusp) (first adjointness, faithfulness of the system of cuspidal parts of Jacquet modules) — Bernstein 1992 Lemma 29.
2. i_P of an object of M(D) has all irreducible subquotients with inertial support [M, D] (geometric lemma and cuspidal-splitting).
3. Splitting of a subobject of a split object (Bernstein 1987 §1.5 lemma); finiteness at level K: (i_P W)^K ≅ ⊕_{P\G/K} W^{K'} and finitely-many-cuspidals.
4. No second adjointness is used.

**Direct prerequisites.** `SmoothRepresentationsOfLocalGroups:SR.3/bernstein-components`, `SmoothRepresentationsOfLocalGroups:SR.3/cuspidal-splitting`, `SmoothRepresentationsOfLocalGroups:SR.2/geometric-lemma`, `SmoothRepresentationsOfLocalGroups:SR.2/first-adjointness`, `SmoothRepresentationsOfLocalGroups:SR.2/induced-invariants`, `SmoothRepresentationsOfLocalGroups:SR.3a/finitely-many-cuspidals`.

**Acceptance checks.**

- GL_1: SmoothRep ℂ ℚ_p^× = ∏ over characters of ℤ_p^× of ℂ[t, t⁻¹]-modules.
- GL_2(ℚ_p): the trivial, Steinberg and unramified principal series all lie in the block [T, 1].
- Blocks are not closed under twisting by ramified characters.

**Sources.** `BERNSTEIN92`, Ch. III §2.2, Decomposition Theorem, Lemma 28 and Lemma 29, pp. 58–59: Each component Irr_Ω splits M(G), M(G) = ∏_Ω M(Ω), proved via the embedding into induced cuspidal parts and the cuspidal splitting, without second adjointness. `BD84`, Proposition 2.10, p. 20: The category of smooth representations is the direct sum over (L, D) up to conjugacy of the subcategories (Alg G)_{(L,D)}. `BERNSTEIN87`, §2, Decomposition theorem and §2.5, pp. 8–13: Decomposition M(G) = ∏_Θ M(Θ) over connected components of infinitesimal characters, with finitely many components visible at each level.

**Atlas planet:** Bernstein decomposition.

#### Noetherianity

**Identifier:** `SmoothRepresentationsOfLocalGroups:SR.3/noetherian`. **Kind:** theorem. **Proposed name:** `TauCeti.SmoothRep.isNoetherian_of_fg`. **Module:** `TauCeti/RepresentationTheory/Smooth/Bernstein`.

SmoothRep ℂ G is locally noetherian: every subrepresentation of a finitely generated smooth representation is finitely generated. The functors i_P and r_P preserve finite generation, and finitely generated representations are admissible over the Bernstein centre (their K-invariants are finitely generated Z(G)-modules).

**Hypotheses.** G reductive over F; complex coefficients.

**Construction or proof.**
1. M(D) ≃ modules over a ring finite over the noetherian ℂ[Ψ(M)] (cuspidal-splitting).
2. The exact faithful functor V ↦ (r_P(V)_cusp)_M preserves finite generation and lands in noetherian categories (Bernstein 1992 Proposition 32; Bernstein 1987 §4.2).
3. i_P preserves finite generation (Bernstein 1992 Proposition 33).
4. Z(G)-admissibility of finitely generated representations: Bernstein–Deligne Proposition 3.3.

**Direct prerequisites.** `SmoothRepresentationsOfLocalGroups:SR.3/cuspidal-splitting`, `SmoothRepresentationsOfLocalGroups:SR.3/bernstein-decomposition`, `SmoothRepresentationsOfLocalGroups:SR.2/jacquet-module`, `SmoothRepresentationsOfLocalGroups:SR.2/parabolic-induction`.

**Acceptance checks.**

- For a torus, smooth representations of T(F) are modules over ℂ[T/T°]-twisted group algebras, noetherian.
- c-Ind_K^G 1 is finitely generated, hence noetherian.
- Noetherianity fails for non-smooth modules over ℂ[G].

**Sources.** `BERNSTEIN92`, Ch. III §2.2, Lemma 29, Propositions 32–33, pp. 59–61: M(G) is noetherian and r, i preserve finite generation, via the cuspidal splitting (no second adjointness). `BERNSTEIN87`, §4.1–4.2, pp. 17–19: Structure of M(D) and local noetherianity of M(G); r and i preserve finite generation. `BD84`, Proposition 3.3 and Variante 3.3.1, pp. 26–27: Every finitely generated representation is admissible over the centre.

#### The Bernstein centre

**Identifier:** `SmoothRepresentationsOfLocalGroups:SR.3/bernstein-centre-blocks`. **Kind:** theorem. **Proposed name:** `TauCeti.SmoothRep.bernsteinCentreEquiv`. **Module:** `TauCeti/RepresentationTheory/Smooth/Bernstein`.

The centre Z(G) = CatCenter(SmoothRep ℂ G) of SR.0 is the product over inertial classes of the centres Z_s of the blocks, and Z_s ≅ ℂ[D_s]^{W_s}, the ring of W_s-invariant regular functions on the cuspidal component D_s; hence Z(G) is the ring of regular functions on Ω(G) = ⊔_s D_s/W_s. An element z acts on every i_P(π), π ∈ D_s, by the scalar z(π), and on every irreducible V by z(scs V). The action on every object is the SR.0 action; on the generators ℂ[G/K] it is the SR.1 description Z(G) ≅ lim_K Z(H(G, K)).

**Hypotheses.** G reductive over F; complex coefficients.

**Construction or proof.**
1. Scalar action on i_P(π) and regularity in π: generic-irreducibility and Bernstein–Deligne Proposition 2.11; W_s-invariance (2.12).
2. Injectivity and surjectivity of Z_s → ℂ[D_s]^{W_s}: Bernstein–Deligne Theorem 2.13 via the embedding W ↪ ⊕_P i_P[(r_P W)(D)] (2.14.1), without second adjointness.
3. Compatibility with the corner description: restrict to the projective generators ℂ[G/K] (bernstein-centre-corners).

**Direct prerequisites.** `SmoothRepresentationsOfLocalGroups:SR.0:abelian-category/smooth-centre`, `SmoothRepresentationsOfLocalGroups:SR.3/bernstein-decomposition`, `SmoothRepresentationsOfLocalGroups:SR.3/generic-irreducibility`, `SmoothRepresentationsOfLocalGroups:SR.3/bernstein-components`, `SmoothRepresentationsOfLocalGroups:SR.1/bernstein-centre-corners`.

**Acceptance checks.**

- GL_1: Z = ∏_{χ ∈ (ℤ_p^×)^∧} ℂ[t, t⁻¹].
- GL_2, block [T, 1]: Z_s = ℂ[t₁^{±1}, t₂^{±1}]^{S_2}, acting on i_B(χ₁ ⊗ χ₂) by evaluation at (χ₁(p), χ₂(p)).
- For a supercuspidal block of SL_2(ℚ_p), Z_s = ℂ.

**Uses.** ExcursionOperatorsAndSpectralAction:ES0:classical-center: the complex Bernstein block description compared with the classical centre. AutomorphicGaloisRepresentationsPartII:AG2.0: Bernstein centre and local trace functions. Ding 2025, §3.2.2: completion of the Bernstein centre at π_sm(φ) and the maps J_w.

**Sources.** `BD84`, Proposition 1.15, p. 11; Proposition 2.11, p. 21; Théorème 2.13, p. 22: The centre of a cuspidal-component category is the ring of regular functions on the component; z acts on i_P(π) by a scalar regular in π; the centre of M(G) is the ring of regular functions on ⊔ D/W(L, D). `BERNSTEIN92`, Ch. III §4.2, Theorem 24, pp. 73–74; Remark, p. 75: Center(M(Ω)) = regular functions on Ω and Ω(G) = Spec Z(G); this proof uses the projective generator i(Π(D)), i.e. second adjointness. `BERNSTEIN87`, §1.8, p. 8: The centre of an abelian category as End(Id) and its identification with the centre of End of a projective generator.

**Atlas planet:** Bernstein centre.

#### Finiteness of Hecke algebras over the centre

**Identifier:** `SmoothRepresentationsOfLocalGroups:SR.3/finite-type-corners`. **Kind:** theorem. **Proposed name:** `TauCeti.SmoothRep.heckeLevel_finite_over_centre`. **Module:** `TauCeti/RepresentationTheory/Smooth/Bernstein`.

For every compact open K: (1) only finitely many inertial classes s have blocks with nonzero K-invariants; (2) every finitely generated smooth representation is Z(G)-admissible; (3) H(G, K; ℂ) is a finitely generated module over the image of Z(G), so it is finite over its own centre, which is a finitely generated ℂ-algebra; (4) for each s, the corner e_K H e_K restricted to Rep_s(G) is a finite module over Z_s. Coefficient specialisation: for ψ ∈ D_s, the specialisation of the universal family at ψ recovers i_P(ψσ).

**Hypotheses.** G reductive over F; complex coefficients.

**Construction or proof.**
1. (1): (i_P W)^K ≅ ⊕_{P\G/K} W^{K'_L}, so a block contributes only if a cuspidal component of a Levi has fixed vectors at a level determined by K; finitely-many-cuspidals applied to each of the finitely many standard Levis (Bernstein–Deligne §3.2).
2. (2): cuspidal case from Π(D) = ℂ[Λ] ⊗ ρ, general case by embedding into induced and induction preserving admissibility (Bernstein–Deligne Proposition 3.3).
3. (3), (4): apply (2) to ℂ[G/K] (Bernstein–Deligne Corollaire 3.4).

**Direct prerequisites.** `SmoothRepresentationsOfLocalGroups:SR.3/bernstein-centre-blocks`, `SmoothRepresentationsOfLocalGroups:SR.3/noetherian`, `SmoothRepresentationsOfLocalGroups:SR.2/induced-invariants`, `SmoothRepresentationsOfLocalGroups:SR.3a/finitely-many-cuspidals`; `mathlib:Module.compHom`.

**Acceptance checks.**

- GL_2(ℚ_p), K = I Iwahori: only the block [T, 1] meets K-invariants, and H(G, I) is finite over its centre ℂ[X_*(T)]^{S_2} (Iwahori–Hecke algebra, rank 4 over the centre).
- G = GL_1, K = 1 + pℤ_p: finitely many characters of ℤ_p^× trivial on K.
- The full Hecke algebra H(G) is not finite over Z(G) (infinitely many blocks).

**Sources.** `BD84`, §3.2, p. 25; Proposition 3.3, p. 26; Corollaire 3.4, p. 27: A finite-type representation meets finitely many blocks; finite-type representations are Z(G)-admissible; H(G, K) is a module of finite type over Z(G) and its centre is a finitely generated ℂ-algebra. `BERNSTEIN87`, §2.5, p. 13: For each compact open K only finitely many components have K-invariants.

#### The universal unramified twist

**Identifier:** `SmoothRepresentationsOfLocalGroups:SR.3/universal-unramified-twist`. **Kind:** construction. **Proposed name:** `TauCeti.SmoothRep.universalUnramifiedTwist`. **Module:** `TauCeti/RepresentationTheory/Smooth/Bernstein`.

For a parabolic P = MN and a smooth σ of M, let ℂ[Λ(M)] = ℂ[M/M°] with the tautological unramified character χ_univ : M → ℂ[Λ(M)]^×. The universal twist i_P(σ ⊗ χ_univ) is a smooth (G, ℂ[Λ(M)])-module, and for every ψ ∈ Ψ(M), specialisation at ψ gives i_P(σ ⊗ χ_univ) ⊗_{ℂ[Λ(M)], ψ} ℂ ≅ i_P(σ ⊗ ψ). If σ is admissible, its K-invariants are finitely generated projective ℂ[Λ(M)]-modules (free for the unramified principal series), compatibly with specialisation. For σ cuspidal and P = G this is Π(D) of cuspidal-splitting; for the unramified principal series it is c-Ind_{T(O)N}^G 1.

**Hypotheses.** G reductive over F; complex coefficients (any A ∋ q^{±1/2} for the construction).

**Construction or proof.**
1. Normalised induction of σ ⊗ χ_univ as a ℂ[Λ(M)]-module.
2. Specialisation commutes with i_P because i_P is exact and the twisting is through the free module ℂ[Λ(M)].
3. K-invariants: induced-invariants gives ⊕_{P\G/K} (σ ⊗ χ_univ)^{K'} and each summand is σ^{K'_M} ⊗ ℂ[Λ(M)] up to finite-index corrections.

**Direct prerequisites.** `SmoothRepresentationsOfLocalGroups:SR.3/unramified-characters`, `SmoothRepresentationsOfLocalGroups:SR.2/parabolic-induction`, `SmoothRepresentationsOfLocalGroups:SR.2/induced-invariants`, `SmoothRepresentationsOfLocalGroups:SR.0:abelian-category/coefficient-change`.

**API.**

- `TauCeti.SmoothRep.universalUnramifiedTwist` (data): i_P(σ ⊗ χ_univ) as a smooth (G, ℂ[Λ(M)])-module.
- `TauCeti.SmoothRep.universalUnramifiedTwist_specialize` (characterisation): Specialisation at ψ is i_P(σ ⊗ ψ).
- `TauCeti.SmoothRep.universalUnramifiedTwist_invariants_projective` (relation): For σ admissible, K-invariants are finitely generated projective over ℂ[Λ(M)].
- `TauCeti.SmoothRep.universalUnramifiedTwist_principal` (example): For M = T and σ = 1: i_B(χ_univ) ≅ c-Ind_{T(O)N}^G 1.

**Unit tests.**

- `TauCeti.SmoothRep.universalUnramifiedTwist_gl1` (computation): For G = M = ℚ_p^× and σ = 1, the universal twist is ℂ[t^{±1}] with p acting by t.
- `TauCeti.SmoothRep.universalUnramifiedTwist_trivial_levi` (degenerate): For M = M° (for instance M = G = SL_2(ℚ_p), where Λ(M) = 0), ℂ[Λ(M)] = ℂ and the universal twist is i_P σ itself.
- `TauCeti.SmoothRep.universalUnramifiedTwist_iwahori_free` (compatibility): For split G, (i_B χ_univ)^I is free of rank one over H(G, I) (Haines–Kottwitz–Prasad Lemma 1.6.1).
- `TauCeti.SmoothRep.universalUnramifiedTwist_special_reducible` (non-example): For GL_2, the specialisation at ψ = |·|^{1/2} ⊗ |·|^{−1/2} is reducible.

**Acceptance checks.**

- GL_1: ℂ[ℚ_p^×/ℤ_p^×] ≅ ℂ[t^{±1}] with g acting by t^{v(g)}; specialisation at t = a gives the unramified character with value a at p.
- Unramified principal series of a split group: i_B(χ_univ) ≅ c-Ind_{T(O)N}^G 1 (Haines–Kottwitz–Prasad 1.5) and its I-invariants are a free rank-one module over H(G, I).
- Specialising at a non-generic ψ gives a reducible representation although the family is generically irreducible.

**Uses.** IntegralHeckeAndGaloisDeterminantsPartII:IHR.2: the universal unramified twist n-Ind(χ ⊗ χ_u), its U-invariants finite free with specialisation isomorphisms. SmoothRepresentationsOfLocalGroups:SR.2a/stabilization: Π = i_P(Π(D)) is admissible over ℂ[Ψ(M)] in the stabilisation argument. Vignéras 1998, §III.1: the canonical map from the universal unramified twist to the product of its specialisations.

**Sources.** `HKP03`, §1.5, (1.5.1)–(1.5.2), p. 2; Lemma 1.6.1, p. 3: C_c^∞(A_O N\G) is the normalised induction of the universal unramified character with values in ℂ[X_*(A)], and its I-fixed vectors are free of rank one over H. `BERNSTEIN87`, §4.1, p. 17: Π(D) = F ⊗ ρ with F the regular functions on Ψ(G), specialising to the twists of ρ. `VIGNERAS98`, §III.1, Proposition, p. 25: The universal unramified twist i_{G,Q}(π ⊗ χ_un) and its map to the product of specialisations.

#### Compatibilities of the Bernstein centre

**Identifier:** `SmoothRepresentationsOfLocalGroups:SR.3/centre-compatibilities`. **Kind:** theorem. **Proposed name:** `TauCeti.SmoothRep.bernsteinCentre_conj_eq_id`. **Module:** `TauCeti/RepresentationTheory/Smooth/Bernstein`.

(1) Inner automorphisms act trivially on Z(G): for g ∈ G the autoequivalence V ↦ V^{Int g} is isomorphic to the identity via ρ(g), so the induced automorphism of Z(G) is the identity; an isomorphism of groups G ≅ G' induces Z(G) ≅ Z(G') depending only on its G'(F)-conjugacy class. (2) For G = G₁ × G₂, B(G) = B(G₁) × B(G₂) and Z_{(s₁,s₂)} ≅ Z_{s₁} ⊗ Z_{s₂}, so Z(G) = ∏_{s₁,s₂} Z_{s₁} ⊗ Z_{s₂}; irreducibles of G₁ × G₂ are external tensor products.

**Hypotheses.** G, G₁, G₂ reductive over F; complex coefficients.

**Construction or proof.**
1. (1) ρ(g) : V → V^{Int g} is natural in V; a natural transformation of the identity commutes with it.
2. (2) Levi subgroups, cuspidal representations and unramified characters of a product are products; D_{(s₁,s₂)} = D_{s₁} × D_{s₂} and W_{(s₁,s₂)} = W_{s₁} × W_{s₂}; bernstein-centre-blocks.

**Direct prerequisites.** `SmoothRepresentationsOfLocalGroups:SR.3/bernstein-centre-blocks`, `SmoothRepresentationsOfLocalGroups:SR.3/bernstein-components`, `SmoothRepresentationsOfLocalGroups:SR.0:abelian-category/smooth-centre`.

**Acceptance checks.**

- Conjugation by an element of GL_2(ℚ_p) acts trivially on Z(GL_2).
- Z(GL_1 × GL_1) = Z(GL_1) ⊗̂ Z(GL_1) blockwise.
- An outer automorphism (e.g. g ↦ ᵗg⁻¹ on GL_2) acts nontrivially on Z(GL_2), sending a block to that of the contragredient.

**Sources.** `BD84`, Théorème 2.13, p. 22: The centre as functions on ⊔ D/W(L, D), from which compatibility with products and conjugation follows. `BERNSTEIN92`, Ch. III §2.1, Proposition 31, pp. 56–57; Ch. III §4.2, Theorem 24, p. 73: Ω(G) as the variety of cuspidal data and the centre as its ring of regular functions.

#### Square-integrable and tempered representations

**Identifier:** `SmoothRepresentationsOfLocalGroups:SR.3/square-integrable-tempered`. **Kind:** definition. **Proposed name:** `TauCeti.SmoothRep.IsTempered`. **Module:** `TauCeti/RepresentationTheory/Smooth/Bernstein`.

Let V be an admissible complex representation of G with central character ω. V is square-integrable modulo the centre (discrete series) if ω is unitary and every matrix coefficient g ↦ ⟨ṽ, π(g)v⟩ has |c|² integrable on G/Z(G) (with Mathlib's Lp and the quotient Haar measure); V is tempered if ω is unitary and every matrix coefficient lies in L^{2+ε}(G/Z) for all ε > 0. Equivalently (Casselman's criterion) in terms of the exponents: the central characters χ of A_M on the Jacquet modules r_P(V) satisfy |χ(a)| < 1 (resp. ≤ 1) on the strictly negative cone. An irreducible square-integrable V is unitary and has a formal degree.

**Hypotheses.** G reductive over F; V admissible complex with central character.

**Construction or proof.**
1. Definition by matrix coefficients; independence of the vectors for irreducible V (one nonzero square-integrable coefficient suffices).
2. Unitarity of irreducible square-integrable representations (Casselman Proposition 2.5.4; Bernstein 1992 Proposition 39).

**Direct prerequisites.** `SmoothRepresentationsOfLocalGroups:SR.3a/admissibility-of-irreducibles`, `SmoothRepresentationsOfLocalGroups:SR.3a/harish-chandra-compactness`, `SmoothRepresentationsOfLocalGroups:SR.2/jacquet-module`, `SmoothRepresentationsOfLocalGroups:SR.0:abelian-category/smooth-dual`, `mathlib:MeasureTheory.Measure.haarMeasure`.

**API.**

- `TauCeti.SmoothRep.IsSquareIntegrable` (data): Unitary central character and matrix coefficients in L²(G/Z).
- `TauCeti.SmoothRep.IsTempered` (data): Unitary central character and matrix coefficients in L^{2+ε}(G/Z) for every ε > 0.
- `TauCeti.SmoothRep.centralExponents` (data): The characters of the split centre A_M occurring in r_P(V).
- `TauCeti.SmoothRep.IsSquareIntegrable.isTempered` (relation): Square-integrable ⇒ tempered.
- `TauCeti.SmoothRep.IsSquareIntegrable.unitary` (relation): An irreducible square-integrable representation is unitarisable.
- `TauCeti.SmoothRep.isSquareIntegrable_of_cuspidal` (relation): A cuspidal representation with unitary central character is square-integrable.

**Unit tests.**

- `TauCeti.SmoothRep.isSquareIntegrable_steinberg_gl2` (computation): The Steinberg representation of GL_2(ℚ_p) is square-integrable modulo the centre.
- `TauCeti.SmoothRep.isTempered_unitary_principal` (computation): i_B(χ₁ ⊗ χ₂) with χ_i unitary is tempered.
- `TauCeti.SmoothRep.not_isTempered_trivial` (non-example): The trivial representation of GL_2(ℚ_p) is not tempered.
- `TauCeti.SmoothRep.isSquareIntegrable_compact` (degenerate): For G compact every irreducible representation is square-integrable.

**Acceptance checks.**

- Supercuspidal representations with unitary central character are square-integrable.
- The Steinberg representation of GL_2(ℚ_p) is square-integrable modulo the centre.
- Unitary unramified principal series of GL_2(ℚ_p) are tempered but not square-integrable; the trivial representation is neither.

**Uses.** Kaletha 2016, §5.1 p. 31 and §5.4 (arXiv v5): tempered and essentially square-integrable representations, used without definition, in the tempered L-packet conjecture. Gan–Savin 2023, §3.4 and §13.2: tempered and discrete series representations of G_2 and PGSp_6. AutomorphicSpectralTheory:AS.2: tempered representations and Harish-Chandra estimates. MetaplecticAutomorphicForms:MP.3: supercuspidal and tempered interfaces. SmoothRepresentationsOfLocalGroups:SR.3/langlands-classification: tempered representations are the building blocks of the Langlands classification.

**Sources.** `CASSELMAN95`, §2.5, definition and Propositions 2.5.3–2.5.4, pp. 28–29; §4.4, pp. 44–45: Square-integrability modulo Z by matrix coefficients, sufficiency of one coefficient for irreducibles, unitarity, and the central characters (exponents) of Jacquet modules. `BERNSTEIN92`, Ch. IV §2.1, Definitions 29–30, pp. 88–89; §2.3, Definition 31 and Proposition 44, p. 92: Central exponents, square-integrability and temperedness by exponents; irreducible tempered representations are unitary. `KALETHA16`, §5.1, p. 31; §5.4, pp. 41–44 (arXiv v5): Uses irreducible admissible, tempered and essentially square-integrable representations as standard notions, without definition, to state the tempered L-packet conjecture; no definition is given there.

**Atlas planet:** Square-integrable and tempered representations.

#### Casselman's criterion

**Identifier:** `SmoothRepresentationsOfLocalGroups:SR.3/casselman-criterion`. **Kind:** theorem. **Proposed name:** `TauCeti.SmoothRep.isSquareIntegrable_iff_exponents`. **Module:** `TauCeti/RepresentationTheory/Smooth/Bernstein`.

An admissible complex representation V of finite length with unitary central character is square-integrable modulo the centre iff for every standard parabolic P = MN and every central exponent χ of r_P(V) (normalised Jacquet module) one has |χ(a)| < 1 for all a in the strictly negative part of A_M modulo A_G; it is tempered iff |χ(a)| ≤ 1 there. It suffices to check the parabolics associate to the cuspidal support.

**Hypotheses.** G reductive over F; V admissible of finite length with unitary central character.

**Construction or proof.**
1. Asymptotics of matrix coefficients: ⟨ṽ, π(a)v⟩ = ⟨ũ, π_N(a)u⟩_N for a sufficiently contracting (casselman-pairing).
2. Decomposition G = Γ A⁻ Γ and volume growth δ_P⁻¹(a) of K a K (Casselman Lemma 1.5.1): the L² norm over A⁻ converges iff the exponents twisted by δ^{−1/2} have absolute value < 1.

**Direct prerequisites.** `SmoothRepresentationsOfLocalGroups:SR.3/square-integrable-tempered`, `SmoothRepresentationsOfLocalGroups:SR.2/casselman-pairing`, `SmoothRepresentationsOfLocalGroups:SR.2/modulus-character`, `ReductiveGroupsPartII:RG2.4`.

**Acceptance checks.**

- Steinberg of GL_2: r_B(St) = δ_B^{1/2}, whose value at a = diag(p, 1) (contracting) is |p|^{1/2} < 1: square-integrable.
- Trivial representation of GL_2: r_B(1) = δ_B^{−1/2}, value p^{1/2} > 1: not tempered.
- Supercuspidals have no proper exponents and are square-integrable.

**Sources.** `CASSELMAN95`, Theorem 4.4.6, p. 45; Theorem 6.5.1, pp. 64–65: Square-integrability of an admissible ω-representation iff the central characters with respect to standard parabolics satisfy |χδ_∅^{−1/2}(a)| < 1 on the negative chambers; refined to parabolics associate to the cuspidal support. `BERNSTEIN92`, Ch. IV §2.2, Propositions 42–43, pp. 89–92: Square-integrability modulo centre iff all central exponents of r_{M,G}(π) are strictly negative modulo centre (finite length, unitary central character).

#### The Langlands classification

**Identifier:** `SmoothRepresentationsOfLocalGroups:SR.3/langlands-classification`. **Kind:** theorem. **Proposed name:** `TauCeti.SmoothRep.langlandsClassification`. **Module:** `TauCeti/RepresentationTheory/Smooth/Bernstein`.

(1) Every irreducible tempered representation is a direct summand of i_P σ for a parabolic P = MN and a square-integrable σ of M, unique up to conjugacy. (2) For a standard parabolic P = MN, an irreducible tempered τ of M and ν in the open positive chamber a_P^{*,+} (|χ_ν| = q^{⟨ν, H_M⟩}), the standard module i_P(τ ⊗ χ_ν) has a unique irreducible quotient J_P(τ, ν) (the Langlands quotient). Every irreducible admissible V is isomorphic to some J_P(τ, ν), and the triple (P, τ, ν) is unique up to W-conjugacy. V is tempered iff P = G and ν = 0.

**Hypotheses.** G reductive over F of any characteristic; complex coefficients.

**Construction or proof.**
1. Exponents of an irreducible V: choose the maximal real part λ of the exponents of the Jacquet modules along the opposite parabolics, giving P and ν (Konno 2003 §3.3).
2. Frobenius reciprocity and Casselman duality give V as a quotient of i_P(τ ⊗ χ_ν), with τ tempered by Casselman's criterion.
3. Uniqueness and the unique-quotient property from Langlands' growth lemma on matrix coefficients of standard modules (Konno 2003 §3.1–3.3).
4. (1) is Harish-Chandra's classification of tempered representations (Konno Proposition 2.2, citing Waldspurger).

**Direct prerequisites.** `SmoothRepresentationsOfLocalGroups:SR.3/casselman-criterion`, `SmoothRepresentationsOfLocalGroups:SR.3/square-integrable-tempered`, `SmoothRepresentationsOfLocalGroups:SR.2/casselman-pairing`, `SmoothRepresentationsOfLocalGroups:SR.2/first-adjointness`, `SmoothRepresentationsOfLocalGroups:SR.3/finite-length`.

**Acceptance checks.**

- GL_2: the trivial representation is J_B(1, ν) with ν = ρ (δ_B^{1/2}).
- Tempered representations: P = G, ν = 0.
- For GL_2, i_B(|·|^{1/2} ⊗ |·|^{−1/2}) = i_B(δ_B^{1/2}) has Langlands quotient the trivial representation, and its unique irreducible subrepresentation is the Steinberg representation.

**Uses.** Gan–Savin 2023, §3.4 and §13.2: non-tempered irreducibles of G_2 and PGSp_6 as Langlands quotients. AutomorphicSpectralTheory:AS.2: the nonarchimedean Langlands classification for intertwining operators.

**Sources.** `KONNO03`, Theorem 3.5, p. 396; Proposition 2.2, p. 390; §3.1–3.3: A complete proof of the Langlands classification for connected reductive p-adic groups following Langlands' real argument and Bernstein's infinitesimal characters; the weak classification of tempered representations as summands of inductions of discrete series. `BERNSTEIN92`, Ch. IV §2.3, Langlands Classification and Corollary, p. 93: States the Langlands classification without proof, and that the standard modules form a basis of the Grothendieck group. `GS23`, §3.4, p. 12; §13.2, pp. 41–42 (arXiv v1): Uses the Langlands classification and Harish-Chandra's classification of tempered representations without reference.

**Atlas planet:** Langlands classification.

#### The Iwahori block

**Identifier:** `SmoothRepresentationsOfLocalGroups:SR.3/borel-casselman-block`. **Kind:** theorem. **Proposed name:** `TauCeti.SmoothRep.iwahoriBlockEquiv`. **Module:** `TauCeti/RepresentationTheory/Smooth/Bernstein`.

Let G be connected reductive over F (split, or more generally with an Iwahori subgroup I in good position) and complex coefficients. The Iwahori subgroup splits SmoothRep ℂ G: the full subcategory of representations generated by their I-fixed vectors is the block of the unramified principal series [T, 1] (T a minimal Levi), and V ↦ V^I is an equivalence between this block and the category of modules over H(G, I; ℂ). An irreducible V has V^I ≠ 0 iff V is a subquotient (equivalently a subrepresentation) of an unramified principal series i_B χ. For admissible V generated by V^I, V^I is a finite-dimensional H(G, I)-module and the subcategory is closed under subobjects.

**Hypotheses.** G connected reductive over F; I an Iwahori subgroup; complex coefficients.

**Construction or proof.**
1. V^I ≅ (V_N)^{T(O)} (borel-casselman-invariants): V^I ≠ 0 iff r_B V has an unramified constituent, iff V is a subquotient of an unramified principal series (first adjointness).
2. I satisfies Bernstein's splitting conditions (I ⊂ U_I M_I Ū_I and condition (I) via representatives of W = K₀/I), so I splits M(G) and S_I is the single component [T, 1] (Bernstein 1987 §3.2).
3. Splitting idempotent: V ↦ V^I = e_I V is an equivalence onto H(G, I)-modules (corner-irreducibles; Borel 1976 Theorem 4.10 and Corollary 4.11 for admissible modules).

**Direct prerequisites.** `SmoothRepresentationsOfLocalGroups:SR.2/borel-casselman-invariants`, `SmoothRepresentationsOfLocalGroups:SR.1/corner-irreducibles`, `SmoothRepresentationsOfLocalGroups:SR.3/bernstein-decomposition`, `SmoothRepresentationsOfLocalGroups:SR.1/iwahori-matsumoto`, `SmoothRepresentationsOfLocalGroups:SR.2/first-adjointness`.

**Acceptance checks.**

- GL_2(ℚ_p): trivial, Steinberg and unramified principal series have nonzero I-invariants; supercuspidals and ramified principal series do not.
- For a torus T, I = T(O) and the block is ℂ[T/T(O)]-modules.
- GL_2(ℤ_p) does not split M(GL_2(ℚ_p)): the Steinberg representation has no spherical vectors but lies in the same block as the trivial representation.

**Sources.** `BOREL76`, §4, Theorem 4.10 and Corollary 4.11, pp. 249–250: For semisimple G and finite-dimensional H(G, B)-modules, I(E) ≅ P(E), irreducible iff E is, exactness, and V ↦ V^B is an equivalence onto admissible modules generated by B-fixed vectors, closed under subobjects. `BERNSTEIN87`, §3.1–3.2 and Example (2), pp. 15–17: Conditions for a compact open subgroup to split M(G); the Iwahori subgroup splits it, S_I is one component, and E ↦ E^I is an equivalence with H_I-modules. `CASSELMAN80`, §2, Propositions 2.3–2.6, pp. 395–396: V^B ≅ V_N^{M₀} for admissible V and the consequences for unramified principal series. `CG20`, §6.3, proof of Theorem 6.13 (arXiv v1): Uses without citation that an irreducible representation with Iwahori-fixed vectors is a subquotient of an unramified principal series. `CT17`, proof of Theorem 2.5, p. 10, and §2.3, first paragraph, p. 12: Uses the Borel–Casselman correspondence between Iwahori-spherical representations and H(G, I)-modules.

**Atlas planet:** Iwahori block (Borel–Casselman).

#### The Steinberg representation

**Identifier:** `SmoothRepresentationsOfLocalGroups:SR.3/steinberg`. **Kind:** definition. **Proposed name:** `TauCeti.SmoothRep.steinberg`. **Module:** `TauCeti/RepresentationTheory/Smooth/Bernstein`.

For a split reductive G with Borel B, the Steinberg representation is St_G = C^∞(B\G)/Σ_{B ⊊ P} C^∞(P\G), the quotient of the smooth functions on the flag variety by the sum of those pulled back from the partial flag varieties of the parabolics strictly containing B. It is irreducible, square-integrable modulo the centre, its normalised Jacquet module along B is δ_B^{1/2} and its Iwahori invariants are one-dimensional. For GL_2: 0 → 1 → Ind_B^G 1 → St → 0 (unnormalised), i.e. St is the irreducible subrepresentation of i_B(δ_B^{1/2}).

**Hypotheses.** G split connected reductive over F; complex coefficients.

**Construction or proof.**
1. Irreducibility and the Jacquet module: Casselman §8 (Lemma 8.1.1 and Theorem 8.1.3).
2. Square-integrability: casselman-criterion with exponent δ_B^{1/2}.

**Direct prerequisites.** `SmoothRepresentationsOfLocalGroups:SR.2/smooth-induction`, `SmoothRepresentationsOfLocalGroups:SR.2/parabolic-induction`, `SmoothRepresentationsOfLocalGroups:SR.2/principal-series-jacquet`, `SmoothRepresentationsOfLocalGroups:SR.3/square-integrable-tempered`, `tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory`.

**API.**

- `TauCeti.SmoothRep.steinberg` (data): St_G := C^∞(B\G)/Σ_{B ⊊ P} C^∞(P\G).
- `TauCeti.SmoothRep.steinberg_irreducible` (relation): St_G is irreducible.
- `TauCeti.SmoothRep.jacquet_steinberg` (characterisation): r_B(St_G) ≅ δ_B^{1/2}.
- `TauCeti.SmoothRep.steinberg_isSquareIntegrable` (relation): St_G is square-integrable modulo the centre.
- `TauCeti.SmoothRep.steinberg_iwahori` (example): dim St_G^I = 1 and St_G^{K₀} = 0.

**Unit tests.**

- `TauCeti.SmoothRep.steinberg_gl2_exact` (computation): For GL_2(ℚ_p): 0 → 1 → Ind_B^G 1 → St → 0 is exact.
- `TauCeti.SmoothRep.steinberg_torus` (degenerate): For G = T a split torus, St_T is the trivial representation.
- `TauCeti.SmoothRep.steinberg_ne_trivial` (non-example): For GL_2(ℚ_p), St ≇ 1 (r_B differ).
- `TauCeti.SmoothRep.steinberg_spherical_zero` (computation): St^{GL_2(ℤ_p)} = 0 for GL_2(ℚ_p).

**Acceptance checks.**

- GL_2(ℚ_p): St^{GL_2(ℤ_p)} = 0, dim St^I = 1.
- G = T a torus: St_T is the trivial character.
- St ≠ 1 for GL_2: their Jacquet modules δ_B^{1/2} and δ_B^{−1/2} differ.

**Uses.** Gan–Savin 2023, §3.1, Proposition 3.1(ii) (arXiv v1): St_{G_2} as the unique irreducible submodule of I_P(3/2, st). Roadmap acceptance tests: check a GL_2 principal series, the Steinberg representation and a compact induction. PotentialAutomorphyInfrastructurePartII: the Jacquet module of the Steinberg representation (Casselman Lemma 8.1.2).

**Sources.** `CASSELMAN95`, §8, Lemmas 8.1.1–8.1.2 and Theorem 8.1.3, p. 70: The Steinberg representation as the quotient of C^∞(P_∅\G) by the sum over larger parabolics, its Jacquet module and square-integrability. `GS23`, §3.1, Proposition 3.1(ii), p. 9 (arXiv v1): St_{G_2} occurs as the unique irreducible submodule of a normalised induced representation, used without a definition.

#### Isotypic quotients of the regular representation

**Identifier:** `SmoothRepresentationsOfLocalGroups:SR.3/isotypic-quotient-regular`. **Kind:** theorem. **Proposed name:** `TauCeti.SmoothRep.isotypicQuotient_regular`. **Module:** `TauCeti/RepresentationTheory/Smooth/Bernstein`.

Let σ be an irreducible admissible smooth complex representation of a locally profinite G (in particular an irreducible representation of reductive G(F)). The map C_c^∞(G) → End(σ)^∞ = σ ⊗ σ̃, f ↦ σ(f), is surjective and G × G-equivariant (left and right translation), and the maximal σ-isotypic quotient of C_c^∞(G) for the right translation action is σ̃ ⊗ σ (σ̃ for the left action). For σ compact (e.g. cuspidal with compact centre) the map splits and C_c^∞(G) = (σ ⊗ σ̃) ⊕ (complement), giving the formal degree.

**Hypotheses.** G reductive over F (σ admissible suffices); complex coefficients.

**Construction or proof.**
1. Surjectivity at each level K: Jacobson density for the simple e_K H e_K-module σ^K (finite-dimensional by admissibility-of-irreducibles).
2. Equivariance: σ(L_g R_h f) = σ(g)σ(f)σ(h)⁻¹.
3. Every G-map C_c^∞(G) → σ factors through f ↦ σ(f̌)v, so the kernel is the intersection of kernels and the quotient is σ̃ ⊗ σ (Bernstein 1992 Lemma 10 and Proposition 12 in the compact case).

**Direct prerequisites.** `SmoothRepresentationsOfLocalGroups:SR.3a/admissibility-of-irreducibles`, `SmoothRepresentationsOfLocalGroups:SR.1/hecke-module-equivalence`, `SmoothRepresentationsOfLocalGroups:SR.1/corner-irreducibles`, `SmoothRepresentationsOfLocalGroups:SR.3a/compact-representations`.

**Acceptance checks.**

- G finite: ℂ[G] → End(σ) is the projection onto the σ-isotypic block of Artin–Wedderburn.
- G = ℚ_p^×, σ a character: the σ-isotypic quotient of C_c^∞(ℚ_p^×) for translation is one-dimensional, f ↦ ∫ f σ.
- For σ non-admissible (G non-reductive) surjectivity can fail; the statement uses admissibility.

**Sources.** `BERNSTEIN92`, Ch. I §5.2, Proposition 12 and Lemma 10, pp. 23–24: For an irreducible compact W, the natural G × G-map S(G) ≅ H(G) → W ⊗ W̃ and the isomorphism W ⊗ W̃ ≅ End(W)^sm. `GS23`, proof of Lemma 13.2, p. 41; proof of Lemma 13.8, p. 48; §14.2, p. 49 (arXiv v1): Uses that the maximal σ-isotypic quotient of C_c(GL_2) is σ^∨ ⊗ σ.

### SR.2a. Second adjointness in characteristic zero

Second adjointness over ℂ by Bernstein's route. A strictly dominant central element of a Levi acts on the K-invariants of any smooth representation, and its action stabilises: a power splits V^K into a nilpotent part and an invertible part, with exponent bounded by the uniform admissibility constant. From this come Jacquet's lemma and Jacquet duality without admissibility, the unit and counit of the adjunction, and second adjointness: i_P is left adjoint to r_{P̄}, along the opposite parabolic. The stabilisation proof uses uniform admissibility (SR.3a) and the Bernstein decomposition, noetherianity and generic irreducibility (SR.3), so this layer follows both.

**Planets of this layer:** Stabilization theorem (`stabilization`); Jacquet modules of contragredients (`jacquet-duality`); Second adjointness (`second-adjointness`).

#### Bernstein's stabilisation theorem

**Identifier:** `SmoothRepresentationsOfLocalGroups:SR.2a/stabilization`. **Kind:** theorem. **Proposed name:** `TauCeti.SmoothRep.stabilization`. **Module:** `TauCeti/RepresentationTheory/Smooth/SecondAdjointness`.

Let G be reductive over F, (P, P̄) a parabolic pair with Levi M, K a compact open subgroup in good position (K = K₋K_MK₊ with respect to (P, P̄)) and a ∈ Z(M) strictly dominant with respect to (P, P̄, K); put h = [KaK] ∈ H(G, K; ℂ). Then for every smooth complex representation V (no admissibility assumed) and every n ≥ c(G, K), the uniform-admissibility constant: V^K = ker hⁿ ⊕ im hⁿ, h acts invertibly on V^K_* := im hⁿ, and V^K_0 := ker hⁿ, V^K_* do not depend on n or on a. Moreover V^K_0 = V^K ∩ ker e_C and V^K_* = e_K e_{C̄} V for sufficiently large compact open C ⊆ N, C̄ ⊆ N̄, and the projection V^K → (V_N)^{K_M} has kernel V^K_0 and restricts to an isomorphism V^K_* ≅ (V_N)^{K_M}.

**Hypotheses.** G reductive over F; complex coefficients; K in good position; a strictly dominant central in M.

**Construction or proof.**
1. Localisation: (V_N)^{K_M} with the action of a is the localisation of (V^K, h) for every smooth V (Bernstein 1987 Proposition 5.2; Bernstein 1992 (⋆) and Proposition 24).
2. Stable modules (V = ker ⊕ im, invertible on im) form an abelian category closed under sums, kernels and cokernels.
3. Irreducibles are h^c-stable by uniform admissibility (dim V^K ≤ c).
4. For Π = i_P(Π(D)) (universal-unramified-twist over ℂ[Ψ(M)]), Π and r(Π) are ℂ[Ψ]-admissible (geometric lemma), so Π^K is eventually stable (noetherian lemma); the exponent is ≤ c by generic-irreducibility and uniform admissibility.
5. Every i_P(L) with L in a cuspidal block of M: present L as a cokernel of a map between products of copies of Π(D); i_P commutes with products (it is a right adjoint), so i_P(L) is a cokernel of a map between stable modules.
6. General V: by the Bernstein decomposition assume V lies in one block; the adjunction unit V → ⊕_N i_{P_N}(r_{P_N}(V)_cusp) is injective by first adjointness and the cuspidal-support argument (Bernstein 1992 Lemma 29(3)); embedding the cokernel the same way exhibits V as a kernel of a map between stable modules (Bernstein 1992 proof of Theorem 22, pp. 69–70; Bernstein 1987 §5.3).

**Direct prerequisites.** `SmoothRepresentationsOfLocalGroups:SR.3a/uniform-admissibility`, `SmoothRepresentationsOfLocalGroups:SR.3/bernstein-decomposition`, `SmoothRepresentationsOfLocalGroups:SR.3/cuspidal-splitting`, `SmoothRepresentationsOfLocalGroups:SR.3/universal-unramified-twist`, `SmoothRepresentationsOfLocalGroups:SR.3/generic-irreducibility`, `SmoothRepresentationsOfLocalGroups:SR.3/noetherian`, `SmoothRepresentationsOfLocalGroups:SR.2/geometric-lemma`, `SmoothRepresentationsOfLocalGroups:SR.2/jacquet-invariants`, `SmoothRepresentationsOfLocalGroups:SR.1/iwahori-decomposition`, `SmoothRepresentationsOfLocalGroups:SR.1/positive-hecke-homomorphism`.

**Acceptance checks.**

- For admissible V this recovers Casselman's stable image V^K_{A⁻} (jacquet-invariants).
- GL_2, K = Iwahori, a = diag(p, 1), V = i_B χ: h = U_p is invertible on V^I (both eigenvalues nonzero), V^I_0 = 0.
- For V cuspidal, V^K_* = 0 and V^K = V^K_0: hⁿ kills V^K for n ≥ c.

**Sources.** `BERNSTEIN87`, §5.1–5.3, pp. 19–23; §5.4 Remark 1, pp. 23–24: Good position, dominant elements, the localisation property of E^K with respect to h, and the stabilisation theorem for every G-module with exponent the uniform-admissibility constant; equivalently stabilisation of the ideals h^n H_K. `BERNSTEIN92`, Ch. III §3.2, Stabilization Theorem and Jacquet's Lemma (Final Version), pp. 64–65; §3.3, Lemmas 32–35 and Theorem 22, pp. 67–70: Stabilisation of a(λⁿ) on V^K for n ≥ c(G, K) for any smooth V, proved with uniform admissibility, generic irreducibility and the decomposition theorem.

**Atlas planet:** Stabilization theorem.

#### Jacquet's lemma for all smooth representations

**Identifier:** `SmoothRepresentationsOfLocalGroups:SR.2a/jacquet-lemma-smooth`. **Kind:** theorem. **Proposed name:** `TauCeti.SmoothRep.invariants_jacquet_surjective_of_smooth`. **Module:** `TauCeti/RepresentationTheory/Smooth/SecondAdjointness`.

For every smooth complex representation V of G and K, P = MN in good position, the projection V^K → (V_N)^{K_M} is surjective, and it has a natural section (Bernstein's canonical lifting) identifying (V_N)^{K_M} with the direct summand V^K_* of V^K, functorially in V. The section is independent of the strictly dominant element used to define it, and compatible with shrinking K.

**Hypotheses.** G reductive over F; complex coefficients; K in good position with respect to (P, P̄).

**Construction or proof.**
1. Each element of (V_N)^{K_M} is mapped into the image of V^K by a large power of the invertible action of a (localisation property).
2. By stabilisation the image of V^K is the stable part V^K_*, on which a is invertible; hence the projection is onto and V^K_* ≅ (V_N)^{K_M}.
3. Independence of a: stabilization (ii) describes V^K_* by idempotents e_K e_{C̄}.

**Direct prerequisites.** `SmoothRepresentationsOfLocalGroups:SR.2a/stabilization`, `SmoothRepresentationsOfLocalGroups:SR.2/jacquet-invariants`.

**Acceptance checks.**

- For admissible V it is Casselman's Theorem 3.3.3 with canonical lifting 4.1.6.
- For V = c-Ind_K^G 1 (not admissible) and P = B in GL_2, the projection V^I → (V_N)^{T(ℤ_p)} is still surjective.
- The statement is about complex coefficients; over a ring R with p ∈ Rˣ the analogue needs invertibility of [KaK] (Vignéras §II.9).

**Sources.** `BERNSTEIN92`, Ch. III §3.2, Jacquet's Lemma (Final Version), p. 65: For any smooth V the natural map V^K → J_U(V)^{K_M} is onto and has a natural inverse, J_U(V)^{K_M} being a functorial direct summand of V^K. `BERNSTEIN87`, §5.3(iii), p. 21: E^K_0 = ker A_K and A_K : E^K_* → (E_U)^{Γ} is an isomorphism for every G-module E. `BD84`, Proposition 3.5.2, pp. 27–28: For K with [K] = [K∩U]*[K∩L]*[K∩Ū], V^K → (V_U)^{K∩L} is surjective for every representation V, deduced from the centre theory.

#### Jacquet modules of contragredients

**Identifier:** `SmoothRepresentationsOfLocalGroups:SR.2a/jacquet-duality`. **Kind:** theorem. **Proposed name:** `TauCeti.SmoothRep.jacquet_smoothDual_opposite`. **Module:** `TauCeti/RepresentationTheory/Smooth/SecondAdjointness`.

For every smooth complex representation V of G and opposite parabolics P = MN, P̄ = MN̄ there is a unique nondegenerate M-equivariant pairing (Ṽ)_{N̄} × V_N → ℂ such that for ṽ ∈ Ṽ, v ∈ V and a strictly dominant central a, ⟨ṽ, π(aⁱ)v⟩ = ⟨p̄(ṽ), π_N(aⁱ)p(v)⟩ for i ≫ 0. It identifies (Ṽ)_{N̄} with the full smooth contragredient of V_N; with normalised functors (using δ_{P̄} = δ_P⁻¹ on M): r_{P̄}(Ṽ) ≅ (r_P V)~ naturally in V. For admissible V this is Casselman's pairing (casselman-pairing).

**Hypotheses.** G reductive over F; complex coefficients; V smooth (not necessarily admissible).

**Construction or proof.**
1. Apply stabilization to (P, P̄) for V and to (P̄, P) for Ṽ: V^K = V^K_0 ⊕ V^K_*, Ṽ^K = Ṽ^K_0 ⊕ Ṽ^K_*, with Ṽ^K_* = (V^K_*)* because (V^K)* = (V^K_0)* ⊕ (V^K_*)*.
2. Pair the stable parts through jacquet-lemma-smooth; independence of K and a; M-equivariance by taking a central in M.
3. Normalisation: δ_P^{1/2} ⊗ δ_{P̄}^{1/2} is canonically trivial on M.

**Direct prerequisites.** `SmoothRepresentationsOfLocalGroups:SR.2a/stabilization`, `SmoothRepresentationsOfLocalGroups:SR.2a/jacquet-lemma-smooth`, `SmoothRepresentationsOfLocalGroups:SR.0:abelian-category/smooth-dual`, `SmoothRepresentationsOfLocalGroups:SR.2/casselman-pairing`, `SmoothRepresentationsOfLocalGroups:SR.2/modulus-character`.

**Acceptance checks.**

- For V = i_B χ on GL_2: r_{B̄}(i_B χ^{−1}) ≅ (r_B i_B χ)~ as T-representations.
- For P = G it is the canonical pairing Ṽ × V → ℂ.
- For V = ℂ[G/K] (non-admissible), the theorem still applies, unlike Casselman's version.

**Sources.** `BERNSTEIN87`, §0.2 Theorem, p. 2; §6.1 Theorem and Corollary, p. 25; §6.2, pp. 25–26: There is a unique pairing of Ẽ_Ū with E_U characterised by asymptotics of matrix coefficients, for any smooth E, giving (r_{MG}(ρ))~ ≅ r̄_{MG}(ρ̃). `BERNSTEIN92`, Ch. III §3.2, Theorem 21 and Lemma 31, pp. 63–66: r̄_{M,G}(σ̃) ≅ (r_{M,G}σ)~ for every smooth σ, via the unique nondegenerate M-equivariant pairing with the stated asymptotics.

**Atlas planet:** Jacquet modules of contragredients.

#### Unit and counit of the second adjunction

**Identifier:** `SmoothRepresentationsOfLocalGroups:SR.2a/second-adjunction-unit`. **Kind:** construction. **Proposed name:** `TauCeti.SmoothRep.secondAdjunctionUnit`. **Module:** `TauCeti/RepresentationTheory/Smooth/SecondAdjointness`.

For opposite parabolics P = MN and P̄ = MN̄ and complex coefficients, the unit of the second adjunction is the natural embedding η_τ : τ ↪ r_{P̄}(i_P τ) given by the open orbit P·P̄ of P̄ on P\G: functions in i_P τ supported in the big cell P N̄ form the bottom piece of the geometric-lemma filtration of r_{P̄} i_P, isomorphic to τ. The counit ε_π : i_P(r_{P̄} π) → π is the map corresponding, under the Hom isomorphism of second-adjointness, to the identity of r_{P̄} π; explicitly it is described by Bezrukavnikov–Kazhdan's asymptotic (co-specialisation) map. The triangle identities r_{P̄}(ε) ∘ η_{r_{P̄}} = id and ε_{i_P} ∘ i_P(η) = id hold, and the unit agrees with the geometric-lemma map of Bernstein's β.

**Hypotheses.** G reductive over F; complex coefficients; Haar measures on N and N̄ fixed to normalise η.

**Construction or proof.**
1. Unit: the open P̄-orbit gives a subfunctor of r_{P̄} ∘ i_P isomorphic to the identity (geometric-lemma; Bernstein 1992 p. 61; Bernstein 1987 remark pp. 28–29, where the unit is written explicitly on the big cell and normalised by Haar measures on U and Ū).
2. Counit and triangle identities: from the natural Hom isomorphism (second-adjointness), or geometrically from the map B of Bezrukavnikov–Kazhdan §§5–6.
3. Agreement of the abstract isomorphism with β: compare the pairings on the filtration pieces (Bernstein 1992 'Important comment on Theorem 20').

**Direct prerequisites.** `SmoothRepresentationsOfLocalGroups:SR.2/geometric-lemma`, `SmoothRepresentationsOfLocalGroups:SR.2/l-sheaf-model`, `SmoothRepresentationsOfLocalGroups:SR.2/parabolic-induction`, `SmoothRepresentationsOfLocalGroups:SR.2/jacquet-module`.

**API.**

- `TauCeti.SmoothRep.secondAdjunctionUnit` (data): η : 𝟭 ⟶ i_P ⋙ r_{P̄}, the big-cell embedding.
- `TauCeti.SmoothRep.secondAdjunctionCounit` (data): ε : r_{P̄} ⋙ i_P ⟶ 𝟭.
- `TauCeti.SmoothRep.secondAdjunction_left_triangle` (relation): r_{P̄}(ε_π) ∘ η_{r_{P̄}π} = id.
- `TauCeti.SmoothRep.secondAdjunction_right_triangle` (relation): ε_{i_P τ} ∘ i_P(η_τ) = id.
- `TauCeti.SmoothRep.secondAdjunctionUnit_eq_geometricLemma` (compatibility): η is the open-orbit piece of the geometric-lemma filtration of r_{P̄} ∘ i_P.

**Unit tests.**

- `TauCeti.SmoothRep.secondAdjunctionUnit_gl2` (computation): For GL_2 and τ = χ, η_χ identifies χ with the subrepresentation of r_{B̄}(i_B χ) coming from functions supported on B N̄.
- `TauCeti.SmoothRep.secondAdjunctionUnit_trivial_parabolic` (degenerate): For P = G, η and ε are identities.
- `TauCeti.SmoothRep.secondAdjunctionUnit_injective` (characterisation): η_τ is injective for every τ.
- `TauCeti.SmoothRep.firstAdjunctionUnit_ne_second` (non-example): The unit of the first adjunction r_P ⊣ i_P is π → i_P(r_P π) (closed orbit, a quotient piece), not η: the two adjunctions use opposite parabolics.

**Acceptance checks.**

- GL_2, τ = χ a character of T: η_χ : χ ↪ r_{B̄}(i_B χ) is the inclusion of the piece supported on the big cell, the other constituent being wχ.
- P = G: η = id and ε = id.
- For cuspidal τ and P ≠ G the unit is still an embedding; r_{B̄}(i_B τ) is glued from τ and its Weyl conjugates.

**Uses.** SmoothRepresentationsOfLocalGroups:SR.2a/second-adjointness: the natural transformations whose triangle identities give the adjunction. AutomorphicSpectralTheory:AS.2: intertwiners and the second adjunction for meromorphic continuation. Bezrukavnikov–Kazhdan 2015, §6: the adjunction maps and the second adjointness via the map B.

**Sources.** `BERNSTEIN92`, Ch. III §3.1, p. 61; Important Comment on Theorem 20, pp. 66–67: The open P̄-orbit on X = P\G gives a trivial subfunctor of r̄ ∘ i and hence the map β; the abstract isomorphism coincides with β. `BERNSTEIN87`, Remark, pp. 28–29: The unit α : V → r̄_{MG} i_{GM} V written explicitly on the big cell and identified with the open-cell piece of the composition filtration. `BK15`, §6.2–6.3, Theorem 6.3, pp. 22–23: Adjunction maps between the identity and the composites, built from the map B, satisfying both triangle identities.

#### Second adjointness

**Identifier:** `SmoothRepresentationsOfLocalGroups:SR.2a/second-adjointness`. **Kind:** theorem. **Proposed name:** `TauCeti.SmoothRep.secondAdjunction`. **Module:** `TauCeti/RepresentationTheory/Smooth/SecondAdjointness`.

For a connected reductive group G over a nonarchimedean local field F, opposite parabolics P = MN and P̄ = MN̄, and complex coefficients: normalised parabolic induction i_P is left adjoint to the normalised Jacquet functor r_{P̄} along the opposite parabolic, Hom_G(i_P τ, π) ≅ Hom_M(τ, r_{P̄} π) naturally in τ and π, with unit and counit those of second-adjunction-unit. This is separate from the first adjunction r_P ⊣ i_P. Consequences: r_{P̄} commutes with arbitrary products; i_P preserves projective objects; for admissible π, Hom_G(i_P τ, π̃) ≅ Hom_M(τ, (r_P π)~), compatibly with Casselman's pairing. In unnormalised terms the right adjoint of Ind_P^G ∘ infl is δ_P⁻¹ ⊗ (−)_{N̄}.

**Hypotheses.** G connected reductive over F; complex coefficients.

**Construction or proof.**
1. Equivalent to jacquet-duality: Hom_G(i_P τ, σ̃) = Hom_G(σ, (i_P τ)~) = Hom_G(σ, i_P τ̃) = Hom_M(r_P σ, τ̃) = Hom_M(τ, (r_P σ)~) = Hom_M(τ, r_{P̄} σ̃), using smooth-dual, induced-contragredient and first-adjointness.
2. This gives the isomorphism for π of the form σ̃; for general π use the exact sequence 0 → π → π̃̃ → (π̃̃/π)~~ and the five lemma (Bernstein 1992 p. 63, correcting the printed sequence).
3. Naturality and identification with the unit: second-adjunction-unit.
4. Products: r_{P̄} is a right adjoint; projectives: i_P has an exact right adjoint.

**Direct prerequisites.** `SmoothRepresentationsOfLocalGroups:SR.2a/jacquet-duality`, `SmoothRepresentationsOfLocalGroups:SR.2a/second-adjunction-unit`, `SmoothRepresentationsOfLocalGroups:SR.2/induced-contragredient`, `SmoothRepresentationsOfLocalGroups:SR.2/first-adjointness`, `SmoothRepresentationsOfLocalGroups:SR.0:abelian-category/smooth-dual`.

**Acceptance checks.**

- GL_2, P = B: Hom_G(i_B χ, i_B χ) ≅ Hom_T(χ, r_{B̄} i_B χ), which is ℂ for regular χ.
- Hom_G(i_B(δ_B^{1/2}), 1) ≅ Hom_T(δ_B^{1/2}, r_{B̄}(1)) = Hom_T(δ_B^{1/2}, δ_{B̄}^{−1/2}) = ℂ (δ_{B̄} = δ_B⁻¹ on T): the trivial representation is a quotient of i_B(δ_B^{1/2}).
- With the same parabolic P instead of P̄ the statement is false: Hom_G(i_B(δ_B^{1/2}), 1) ≠ 0 while Hom_T(δ_B^{1/2}, r_B(1)) = Hom_T(δ_B^{1/2}, δ_B^{−1/2}) = 0.

**Uses.** AutomorphicSpectralTheory:AS.2: intertwining operators and meromorphic continuation. Gan–Savin 2023, proof of Lemma 5.6, p. 19: Ext out of an induced representation computed through the opposite Jacquet module. SmoothRepresentationsOfLocalGroups:SR.3/bernstein-centre-blocks: the alternative proof of the centre theorem via projective generators i_P(Π(D)) (Bernstein 1992 Theorem 24).

**Sources.** `BERNSTEIN87`, §0.1 Main theorem, p. 1; §6.5 Theorem, p. 27: i_{GM} is canonically left adjoint to r̄_{MG} for every parabolic pair. `BERNSTEIN92`, Ch. III §3.1 Theorem 19, p. 61; §3.2 Theorem 20 and Claim, pp. 62–63; Corollaries, p. 62: i_{G,M} is left adjoint to r̄_{M,G}; equivalence with Theorem 21; r̄ commutes with products and i maps projectives to projectives. `BK15`, Theorem 6.3, pp. 22–23: A geometric proof of second adjointness through the wonderful compactification, using finiteness properties of Hecke algebras.

**Atlas planet:** Second adjointness.

## Supplier requests

- **`tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-0-discrete-modules-and-continuous-sections`.** For a profinite group, a module is discrete exactly when it is the union of the fixed points of the open normal subgroups (TauCeti.iSup_fixedPoints_openNormal_eq_top), with the predicate TauCeti.IsSmoothDiscrete; SR.0 extends this exhaustion from profinite to locally profinite groups through compact open subgroups. Needed by `SR.0:abelian-category/compact-open-invariants`, `SR.2/induction-exactness`.
- **`tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-1-the-canonical-carrier-and-its-functoriality`.** The canonical carrier SmoothDiscreteTopRep of discrete modules and the equivalence discreteRepEquivSmoothTopRep with smooth topological modules, to compare SR.0's algebraic smooth category with it for profinite G. Needed by `SR.0:abelian-category/smooth-discrete-comparison`.
- **`tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-7-coinduced-modules-and-shapiros-lemma`.** Coinduced discrete modules of a profinite group and Shapiro's lemma, used to compute the derived invariants of a compact open subgroup on coinduced smooth representations. Needed by `SR.0:derived-extension/derived-invariants`.
- **`tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-10-continuous-cohomology-in-all-degrees`.** Continuous cohomology H^n(K, M) of a profinite group K with discrete coefficients in all degrees, with its long exact sequences and its identification with the right derived functors of K-invariants on discrete modules. For the derived-Hecke double-coset product also supply all-degree restriction, conjugation, Shapiro and open-subgroup corestriction, with transitivity, Mackey and derived-invariant compatibilities. Needed by `SR.0:derived-extension/derived-invariants`.
- **`tauceti:TauCetiRoadmap/ProfiniteProPGroups#layer-1-supernatural-order-and-index`.** The supernatural order of a profinite group (TauCeti.profiniteOrder), the divisibility of finite indices [K : K'] into it (ofNat_card_quotient_le_profiniteOrder) and pro-p groups (IsProP), used to define compact open subgroups of pro-order invertible in A. Needed by `SR.0:abelian-category/unit-pro-order`.
- **`tauceti:TauCetiRoadmap/RepresentationTheory/InductionRestriction#layer-0-the-functorial-core----transitivity-and-the-projection-formula`.** Transitivity of induction for representations of groups (Rep.indFunctorCompIso), applied to open subgroups to give induction in stages for compact induction. Needed by `SR.2/induction-in-stages`.
- **`tauceti:TauCetiRoadmap/RepresentationTheory/InductionRestriction#layer-3-the-mackey-decomposition-formula`.** The Mackey decomposition of a restricted induced representation over double cosets (Rep.mackeyDecomposition), applied to open subgroups of a locally profinite group. Needed by `SR.2/mackey-filtration`.
- **`tauceti:TauCetiRoadmap/ModularForms#layer-2-hecke-operators-and-the-hecke-algebra`.** The abstract double-coset Hecke ring of a Hecke pair with Shimura's product (HeckeCosetModule.mul, its associativity, the ring instance and structure constants) and Shimura's rank-two polynomial presentation of the p-local GL_2 ring. Needed by `SR.1/hecke-ring-comparison`, `SR.1/klingen-positive-hecke`.
- **`tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory`.** For a split connected reductive group over a field: root datum, Borel and parabolic subgroups with Levi decompositions P = MN and opposite parabolics, the Weyl group, and the Bruhat decomposition. Needed by `SR.1/iwahori-decomposition`, `SR.1/iwahori-matsumoto`, `SR.2/modulus-character`, `SR.2/parabolic-induction`, `SR.2/geometric-lemma`, `SR.2/whittaker-functionals`, `SR.3a/cuspidal-representations`, `SR.3/steinberg`.
- **`ReductiveGroupsPartII:RG2.0`.** For a connected reductive group G over a nonarchimedean local field F, the topology on G(F) making it a locally profinite (second countable, unimodular-if-reductive) group, with closed subgroups P(F), M(F), N(F) for parabolic subgroups, and the open subgroup generated by compact subgroups. Needed by `SR.3a/cuspidal-representations`, `SR.3/unramified-characters`.
- **`ReductiveGroupsPartII:RG2.1`.** The maximal split torus A_G of the centre and the lattice X_*(A_G) used to describe G(F)/G(F)° and the unramified characters of G(F). Needed by `SR.3/unramified-characters`.
- **`ReductiveGroupsPartII:RG2.3`.** Parahoric, Iwahori, pro-p Iwahori and congruence subgroups K_n of G(F), with Iwahori factorisations K = (K ∩ N)(K ∩ M)(K ∩ N̄) for every parabolic pair (P, P̄) containing the reference torus, and a neighbourhood basis of 1 consisting of such subgroups that are normal in a maximal compact one. Needed by `SR.1/iwahori-decomposition`, `SR.1/pro-iwahori-torus`, `SR.1/iwahori-matsumoto`, `SR.2/borel-casselman-invariants`, `SR.3a/harish-chandra-compactness`, `SR.3a/hecke-algebra-decomposition`.
- **`ReductiveGroupsPartII:RG2.4`.** The Iwasawa decomposition G = P K₀ for a special maximal compact K₀, the Cartan decomposition G = K₀ A⁺ K₀ with the dominant cone, the Iwahori–Bruhat decomposition G = ⊔ I w I over the extended affine Weyl group, and finiteness of P\G/K for compact open K. Needed by `SR.1/iwahori-matsumoto`, `SR.2/induced-invariants`, `SR.2/parabolic-induction`, `SR.2/geometric-lemma`, `SR.3a/harish-chandra-compactness`, `SR.3a/hecke-algebra-decomposition`, `SR.3/casselman-criterion`.

- **`ProfiniteCohomology`, Layer 12.** The all-degree continuous cup product for a continuous equivariant coefficient pairing, with its restriction, conjugation and corestriction projection formulas. The derived-Hecke double-coset product consumes this interface; SR.0 proves agreement with Yoneda composition under its derived-invariants comparison and does not re-plan cup products. Needed by `SR.0:derived-extension/derived-hecke-algebra`.

## Gaps

### Uniqueness of Whittaker models and Rodier heredity for general quasi-split groups

whittaker-functionals defines generic representations and proves the GL_2 case; multiplicity one of Whittaker functionals for irreducible representations of a general quasi-split G (Gelfand–Kazhdan, Shalika) and the heredity of genericity under parabolic induction (Rodier) are not proved in the sources read. Gan–Savin use both for exceptional groups without proof. A source with a complete proof must be read before these are planned. Needed by `SR.2/whittaker-functionals`.

### Harish-Chandra's classification of tempered representations

Konno's proof of the Langlands classification takes as input Harish-Chandra's result that every irreducible tempered representation is a direct summand of a representation unitarily induced from a discrete series (Waldspurger 2003, Proposition III.4.1); its proof uses the Plancherel theory, which no stage in scope plans. langlands-classification is planned modulo this input. Needed by `SR.3/langlands-classification`.

### Projectivity of discrete series in the tempered category

Discrete series are projective and injective in the category of tempered representations (Meyer's Schwartz-algebra method); no Schwartz algebra or tempered category is planned here, and no source with a complete proof was read. Needed by `SR.3/square-integrable-tempered`.

### Degenerate Whittaker models and wave-front sets

Mœglin–Waldspurger degenerate Whittaker models, used by Gan–Savin for the exceptional groups, are not planned; the source was not read. Needed by `SR.2/whittaker-functionals`.

### Bushnell's localisation proof of second adjointness and the Bushnell–Kutzko Hecke-algebra embeddings

Bushnell (J. London Math. Soc. 63 (2001)) was not obtained in a public copy, and Bushnell–Kutzko 1998 (Allen et al. [BK98, Cor. 6.12]) was not read. The normaliser/torus single-coset calculation is planned, but a proof of the general positive Levi Hecke embedding by transfer of structure constants remains missing. Second adjointness follows Bernstein’s route; neither unread source is claimed as read proof support. Needed by `SR.1/positive-hecke-homomorphism`, `SR.2a/second-adjointness`.

### Equivariant K-flat replacements and derived tensor/internal Hom

The pinned libraries contain neither total tensor products of smooth complexes nor equivariant K-flat replacement. Stacks Section 20.26 (Tag 06Y7) supplies the non-equivariant definition and tensor criterion. The suggested file states concrete smooth tensor complexes, direct-sum totalisation, the acyclic-tensor K-flat predicate, replacement data and the derived internal-Hom adjunction. A complete equivariant construction and proof that replacements remain smooth are still missing; K-injective resolutions alone do not provide them. Needed by `SR.0:derived-extension/dg-enhancement`, `SR.0:derived-extension/derived-smooth-dual`.

### Enhanced degree-zero Bernstein centre comparison

The ordinary SmoothRep centre is planned as a compatible family of corner centres. To identify this with Fargues–Scholze’s π₀End(id), construct the dg/enhanced natural transformation object and prove that restriction to the heart induces an isomorphism in degree zero. The unenhanced triangulated CatCenter can have additional transformations and is not used as a substitute. This is the remaining early-owner input for RT-AREA-geomlanglands/9 and the higher ES0 comparison. Needed by `SR.1/bernstein-centre-corners`.

## Restructuring proposals

- **rescope (SmoothRepresentationsOfLocalGroups).** The atlas orders SR.2 → SR.2a → SR.3a → SR.3. The sources prove second adjointness only after uniform admissibility and the Bernstein decomposition: Bernstein's stabilisation theorem (Bernstein 1992 Ch. III §3.3, Theorem 22, pp. 67–70; Bernstein 1987 §5.3) uses uniform admissibility, the decomposition theorem, the noetherian lemma and generic irreducibility; Bezrukavnikov–Kazhdan (arXiv v4, §5.1) use noetherianity of Hecke algebras; Dat (2009, p. 2) proves second adjointness only for minimal parabolics, GL_n, classical groups and rank-one groups, and says Bushnell's proof also relies on noetherianity. Uniform admissibility itself needs only cuspidal theory and first adjointness (Bernstein–Zelevinsky 1976 §§3–4, 4.7–4.11; Bernstein 1992 Ch. II §1.4, pp. 37–38), and the Bernstein centre and finiteness are proved without second adjointness (Bernstein–Deligne 1984 Theorem 2.13, Proposition 3.3 and Corollary 3.4). No public source gives a route to SR.2a that avoids SR.3a and SR.3. The packet also adds two edges between the early layers: SR.1 → SR.0:derived-extension (the derived Hecke algebra uses the permutation-module Hecke algebra) and SR.0:derived-extension → SR.2 (the Jacquet module of a regular principal series splits by vanishing of Ext between distinct central characters). Proposal: Order the layers SR.0:abelian-category → SR.1 → SR.0:derived-extension → SR.2 → SR.3a → SR.3 → SR.2a: SR.3a depends on SR.2 (replacing SR.2a → SR.3a), and SR.2a depends on SR.3a and SR.3 (replacing nothing; SR.3 does not use SR.2a). Cuspidal theory, the Harish-Chandra compactness theorem and admissibility of irreducibles sit in SR.3a, whose nodes realise both SR.3a and SR.3. SR.3's consumers (AF.2, ET.6, R16.2, ES0:classical-center) are unaffected; SR.2a's consumer AS.2 now sits after SR.3, which it already uses.
- **rescope (SmoothRepresentationsOfLocalGroups, EnhancedDerivedSheaves).** REV-RS-21 lists EnhancedDerivedSheaves:E1 (tier 4) as a supplier of SR.0:derived-extension, which is tier 2 in the bottom-up order. The derived category of smooth representations, K-injective resolutions in a Grothendieck abelian category, the dg (Hom-complex) enhancement on K-injectives and derived invariants need only Mathlib's DerivedCategory, HomComplex and Grothendieck-category API. Proposal: SR.0:derived-extension plans these here (nodes grothendieck-abelian, derived-smooth-category, k-injective-resolutions, dg-enhancement, derived-invariants) and drops the E1 supplier edge; EnhancedDerivedSheaves:E1 may compare its ∞-categorical enhancement with this dg enhancement downstream.

## Mistakes in the sources

The nodes use the corrected statements below.

- **SmoothRepresentationsOfLocalGroups/E1** (error; `TV16`, §2.10, p. 187 (published); arXiv v1 p. 8 (identical)). The source says: The action of Fun_G(S × S) on the permutation module k[S] is given by sending s to the sum over t of h(s, t) t. Correction: For the matrix product (2.10.1) this is a right action; the left action identifying Fun_G(S × S) with End_G(k[S]) sends s to the sum over t of h(t, s) t. Reason: View h as an S × S matrix: (2.10.1) is matrix multiplication, so h₁(h₂ s) computed with the printed formula equals (h₂ h₁) s. Affects: nothing.
- **SmoothRepresentationsOfLocalGroups/E2** (error; `TV16`, §2.10, (2.10.2), p. 188 (published); arXiv v1 p. 8 (identical)). The source says: For v ∈ V^K the right action of h ∈ H(G, K) is a sum over gK ∈ G/K of h(K, gK) times g⁻¹ v. Correction: The sum must run over Kg ∈ K\G: v * h = Σ_{Kg ∈ K\G} h(K, gK) g⁻¹ v. Reason: Replacing g by gk leaves h(K, gK) unchanged but changes g⁻¹v to k⁻¹g⁻¹v, which differs from g⁻¹v in general; replacing g by kg changes neither factor. Affects: nothing.
- **SmoothRepresentationsOfLocalGroups/E3** (misprint; `TV16`, §6.1, second paragraph, p. 201 (published); arXiv v1 p. 19). The source says: Admissibility asks for finite-dimensional invariants under every compact open subgroup of G. Correction: The subgroups are compact open subgroups of G_v. Reason: The representations are of G_v, the local group at v. Affects: nothing.
- **SmoothRepresentationsOfLocalGroups/E4** (error; `CT17`, §2.1, p. 7 (author manuscript of 10 Dec 2015)). The source says: The quadratic relation of the Iwahori–Hecke algebra is written (T_s − 1)(T_s + q) = 0, and the presentation over ℤ uses the braid group. Correction: The relation is (T_s − q)(T_s + 1) = 0, and over ℤ the presentation uses the braid monoid (T_s is not invertible over ℤ). Reason: The index character T_s ↦ q = [I s I : I] is a ring homomorphism H(G, I; ℤ) → ℤ; it kills (T_s − q)(T_s + 1) but not (T_s − 1)(T_s + q), and it sends T_s to the non-unit q. Affects: nothing.
- **SmoothRepresentationsOfLocalGroups/E5** (misprint; `CG18`, Remark 9.15, p. 92 (arXiv v2)). The source says: The group U(x) = 1 + ϖ_x M_n(O_x) is called pro-p. Correction: U(x) is pro-ℓ, ℓ being the residue characteristic of x, which differs from p. Reason: U(x) is an inverse limit of finite ℓ-groups (1 + ϖ^i M_n)/(1 + ϖ^{i+1} M_n) ≅ M_n(k_x). Affects: nothing.
- **SmoothRepresentationsOfLocalGroups/E6** (gap; `BP26`, §1.3.4, p. 3 (author copy)). The source says: For K_p with an Iwahori decomposition, t ↦ [K_p t K_p] on the dominant monoid T⁺ is said to be an algebra map to the integral Hecke algebra. Correction: The map is multiplicative when each t ∈ T⁺ satisfies t U_{K_p} t⁻¹ ⊆ U_{K_p} and t⁻¹ Ū_{K_p} t ⊆ Ū_{K_p}; these hold for the depth-n Iwahori levels with n ≥ 1 used in §4.2 but not for every K_p with a product decomposition. Reason: With the inclusions, K t K = U_K t K with cosets indexed by U_K / t U_K t⁻¹, and degrees multiply. Without them: in GSp_4(ℚ_p) (upper-triangular B, antidiagonal form) let K be the preimage in GSp_4(ℤ_p) of the subgroup {u_12 = u_23} of U(F_p); K has a bijective product decomposition U_K × T(1 + pℤ_p) × Ū(pℤ_p), t = diag(p², p, p, 1) is dominant, and deg[K t^m K] = p^{4m+1}, so deg[KtK]² = p^{10} ≠ p⁹ = deg[Kt²K]; as the degree is a ring homomorphism, [KtK]² ≠ [Kt²K]. The cause is that t scales u_12 by p and fixes u_23, so t U_K t⁻¹ ⊄ U_K. Affects: a stated result.
- **SmoothRepresentationsOfLocalGroups/E7** (misprint; `PILLONI20`, §5.1.5, pp. 21–22 (author copy)). The source says: The local facts on GSp_4 are cited four times to reference [24] (Gan–Takeda), and the parameters are normalised by αβ = γδ. Correction: The citations are to [25] (Genestier–Tilouine, Astérisque 302), and the normalisation is αδ = βγ. Reason: The cited page numbers lie in Genestier–Tilouine's page range and Calegari–Geraghty cite Genestier–Tilouine Prop. 3.2.3 for the same fact; the Weyl-orbit description of Proposition 5.1.5.1 and Lemma 5.1.5.1 use αδ as the W-invariant product. Affects: nothing.
- **SmoothRepresentationsOfLocalGroups/E8** (misprint; `BCGP21`, §2.4.1, p. 20 (arXiv v3); p. 174 (published)). The source says: Iw(v) and Iw₁(v) are defined as kernels of reduction maps to B(k(v)) and U(k(v)). Correction: They are the preimages of B(k(v)) and U(k(v)) under G(O_v) → G(k(v)). Reason: A kernel of reduction is the principal congruence subgroup; the following text uses the Iwahori and pro-v Iwahori subgroups. Affects: nothing.
- **SmoothRepresentationsOfLocalGroups/E9** (misprint; `BERNSTEIN92`, Ch. II §1.2, Proposition 19(1), p. 33). The source says: r_{M,G} is said to be right adjoint to i_{G,M}. Correction: r_{M,G} is left adjoint to i_{G,M} (Frobenius reciprocity, Theorem 10). Reason: Hom_G(V, i_{G,M} W) ≅ Hom_M(r_{M,G} V, W) is first adjointness as proved in the text. Affects: nothing.
- **SmoothRepresentationsOfLocalGroups/E10** (error; `BERNSTEIN92`, Ch. I §3.2, Proposition 9(2) and Remark 2, pp. 16–17). The source says: Exactness of Ind is deduced from exactness of compactly supported push-forward in the sheaf model on H\G, which the remark identifies with Ind. Correction: The compactly supported push-forward models ind (compact induction), not Ind; exactness of Ind needs its own argument (through K-invariants and a section of G → H\G). Reason: For H\G non-compact, functions in Ind need not have compact support modulo H, so they are not sections with compact support. Affects: the proof.
- **SmoothRepresentationsOfLocalGroups/E11** (gap; `BERNSTEIN92`, Ch. I §2.2, Theorem 4, p. 14). The source says: The smooth category (printed M(H)) has enough injectives; the proof first reduces to irreducible X and then uses admissibility of irreducibles (proved only in Chapter II). Correction: M(G) is meant. The reduction is unjustified and unnecessary: for any X choose an epimorphism P ↠ X̃ from a projective; then X ↪ X̃̃ ↪ P̃ (Proposition 6(3), and the smooth dual of a surjection is injective), and P̃ is injective by Lemma 5. No admissibility is needed. Reason: An embedding of every object into an injective is not implied by the irreducible case: a smooth representation need not have an irreducible subrepresentation, so no reduction to irreducibles is available. Affects: the proof.
- **SmoothRepresentationsOfLocalGroups/E12** (misprint; `BERNSTEIN92`, Ch. II §1.4, proof of uniform admissibility, p. 38). The source says: The proof asserts k ≤ ∞ for the dimension k of an irreducible H_K-module. Correction: k < ∞ (Theorem 12). Reason: Burnside's theorem, applied next, needs a finite-dimensional module. Affects: nothing.
- **SmoothRepresentationsOfLocalGroups/E13** (misprint; `BERNSTEIN92`, Ch. I §5.1, Theorem 7, p. 23). The source says: For an irreducible compact W the splitting is written with JH(M_W) contained in {X}. Correction: JH(M_W) ⊆ {W}. Reason: X does not occur in the statement; M_W is the subcategory of sums of copies of W. Affects: nothing.
- **SmoothRepresentationsOfLocalGroups/E14** (error; `BERNSTEIN92`, Ch. III §3.2, proof of Theorem 20 from Theorem 21, p. 63). The source says: The reduction to representations of the form σ̃ uses π ↪ π₁ = π̃̃ ↪ π₂ = π̃̃₁ and the five lemma. Correction: The five lemma needs an exact sequence 0 → π → π₁ → π₂; take π₂ the double contragredient of π₁/π. The text itself calls the step unsatisfying; also τ is a representation of M, not of G. Reason: With π₂ = π̃̃₁ the composite π → π₂ is injective, not zero, so the sequence is not exact at π₁. Affects: the proof.
- **SmoothRepresentationsOfLocalGroups/E15** (error; `BERNSTEIN92`, Ch. IV §4, Theorem 29 and Proposition 46, pp. 97–99). The source says: The resolution of the trivial module from the building uses induced modules Ind from simplex stabilisers, and the cohomological dimension is bounded by the rank. Correction: The terms are compact inductions c-Ind from the compact open stabilisers; for groups with non-compact centre the bound uses the extended building and the split rank including the centre. Reason: For compact open K with G/K infinite, Ind_K^G 1 is the space of all functions on G/K, of uncountable dimension, while a finitely generated smooth representation has countable dimension; c-Ind_K^G is the finitely generated projective object. Affects: the proof.
- **SmoothRepresentationsOfLocalGroups/E16** (misprint; `BZ77`, §2.12, p. 448). The source says: The composite functor is written r_{G,N} ∘ i_{G,M}. Correction: r_{N,G} ∘ i_{G,M}, with the notation of §2.3 (r_{N,G} from G-modules to N-modules). Reason: The sentence before the statement names the composition of r_{N,G} and i_{G,M}. Affects: nothing.
- **SmoothRepresentationsOfLocalGroups/E17** (misprint; `BZ76`, §4.12, step (2), p. 40 (English translation)). The source says: The ideal 𝒥 generated by a₁, …, a_l is called a power of ℛ. Correction: 𝒥 is nilpotent (the a_i are commuting nilpotent elements), giving the finite filtration V ⊇ 𝒥V ⊇ 𝒥²V ⊇ … ⊇ 0. Reason: The argument only uses that some power of 𝒥 is zero. Affects: nothing.
- **SmoothRepresentationsOfLocalGroups/E18** (misprint; `CASSELMAN95`, Theorem 6.3.5, p. 59). The source says: The statement of the geometric lemma for the Jacquet module of an induced representation omits a modulus factor. Correction: The factor δ_Ω^{1/2} appearing in Corollary 6.3.4(b) and in the proof of 6.3.6 belongs in the statement; the proof of 6.3.6 also writes M_Θ for M_Ω twice. Reason: Normalised induction and Jacquet functors require the factor for the filtration pieces to be normalised inductions of Weyl conjugates; comparing with 6.3.4(b) on the same page. Affects: nothing.
- **SmoothRepresentationsOfLocalGroups/E19** (error; `CASSELMAN95`, proof of Proposition 9.2.3, p. 73). The source says: A quadratic relation ch²_{BaB} − (q − 1)ch_{BaB} − q ch_B = 0 is asserted for a in the negative chamber. Correction: The relation holds for the simple reflections (ch_{BwB}), not for ch_{BaB} with a ∈ A⁻ ∖ A(O); invertibility of π(ch_{BaB}) follows instead from the Iwahori–Matsumoto factorisation into simple-reflection and length-zero elements. Reason: For SL_2 and a = diag(η, η⁻¹) one has meas(BaB) = q², and integrating the relation gives q⁴ − (q − 1)q² − q ≠ 0. Affects: the proof.
- **SmoothRepresentationsOfLocalGroups/E20** (misprint; `CASSELMAN95`, proof of Proposition 5.3.1, p. 49). The source says: Parts (a) and (b) are said to follow from Theorem 4.2.3. Correction: The needed input is the non-degeneracy 4.2.4 / Corollary 4.2.5, (V_N)~ ≅ Ṽ_{N⁻}; 4.2.3 characterises the pairing. Reason: 4.2.3 is a characterisation of ⟨ , ⟩_N, not a non-degeneracy statement. Affects: nothing.
- **SmoothRepresentationsOfLocalGroups/E21** (misprint; `CASSELMAN80`, Proposition 2.5, p. 396). The source says: The statement is made for arbitrary v ∈ V and ends with the Jacquet-module action on v. Correction: It is for v ∈ V^B, ending with π_N(m) applied to the image u of v in V_N. Reason: The proof begins with v ∈ V^B, and π_N acts on V_N, not on V. Affects: nothing.
- **SmoothRepresentationsOfLocalGroups/E22** (misprint; `GS23`, proof of Lemma 5.6, p. 19 (arXiv v1)). The source says: The Ext computation out of an induced representation uses the Jacquet module r_P. Correction: Second adjointness gives the opposite Jacquet module r_{P̄}. Reason: Second adjointness makes i_P left adjoint to the opposite Jacquet functor r_{P̄}; the first adjunction r_P ⊣ i_P computes maps into, not out of, i_P. Affects: nothing.
- **SmoothRepresentationsOfLocalGroups/E23** (misprint; `HE18`, proof of Lemma 16, p. 18 (published); arXiv v3 p. 14). The source says: The count of cosets obtained from Lemma 15 is written for the Iwahori double coset I ṡ I / I. Correction: It is I_n ṡ I_n / I_n, the congruence-level double coset. Reason: The preceding line computes the I_n-level count, Lemma 15 concerns I_n-double cosets, and the conclusion drawn is #(I_n ṡ I_n / I_n) = q^{ℓ(s)}. Affects: nothing.
- **SmoothRepresentationsOfLocalGroups/E24** (gap; `FS21`, Definition I.9.2(i), p. 34, and Definition IX.0.2, p. 318 (arXiv v4)). The source says: The Bernstein centre over Λ, defined as π₀End of the identity functor, is equated with the inverse limit over pro-p K of the centres of Λ[K\G/K]. Correction: The identification needs that D(G, Λ) is generated by the c-Ind_K Λ, that the corner categories are equivalent to modules over e_K H e_K, and that restriction between levels is compatible; the ordinary corner formula is planned in bernstein-centre-corners; comparison with the enhanced π₀End(id) is a recorded gap. Reason: No proof or reference is given at either place. Affects: nothing.
- **SmoothRepresentationsOfLocalGroups/E25** (gap; `FS21`, proof of Theorem IX.7.2, p. 335, and of Corollary IX.7.3, p. 337 (arXiv v4)). The source says: The Bernstein centre over Λ = ℤ_ℓ[√q] is treated as ℓ-adically separated, reducing to torsion coefficients. Correction: Separatedness follows from freeness of each Hecke algebra Λ[K\G/K] over Λ; the packet proves it (l-adic-separatedness). Reason: The property is used without proof. Affects: nothing.

- **SmoothRepresentationsOfLocalGroups/E26** (misprint; `STACKS`, Lemma 20.26.7 (Tag 0G6U), proof, displayed tensor sequence; chapter PDF Lemma 26.7, p. 56, version ed88ff78 (14 Jul 2026)). In the proof, all three terms of the tensor-totalisation short exact sequence have the first complex as their second tensor factor. Correction: The second and third terms use the second and third complexes respectively; tensoring the given sequence gives totalisations in the order K₁, K₂, K₃. Reason: Termwise flatness of the third complex preserves the original short exact sequence under tensoring; repeating K₁ does not express that sequence. The intended long-exact-cohomology argument is unchanged. Affects: nothing. No correction was found in the official HTML comments, chapter PDF or project search.

## References

- **`CASSELMAN95`**: W. Casselman, *Introduction to the theory of admissible representations of p-adic reductive groups*. Draft of 1 May 1995 (revised by the Séminaire Paul Sally, 1992–93); author's web copy; printed page = PDF page. https://personal.math.ubc.ca/~cass/research/pdf/p-adic-book.pdf
- **`BERNSTEIN92`**: J. Bernstein, *Representations of p-adic groups (lectures at Harvard University, Fall 1992, written by K. E. Rumelhart)*. Unpublished draft notes; author's web copy; printed page = PDF page; compared with the second TeX build of the same notes on the author's page. https://www.math.tau.ac.il/~bernstei/Publication_list/publication_texts/Bernst_Lecture_p-adic_repr.pdf
- **`BERNSTEIN87`**: J. Bernstein, *Second adjointness for representations of reductive p-adic groups*. Unpublished manuscript (1987), TeX copy from the author's page; printed page = PDF page. https://www.math.tau.ac.il/~bernstei/Unpublished_texts/unpublished_texts/Bernstein87-second-adj-from-chicago.pdf
- **`BD84`**: J. N. Bernstein (rédigé par P. Deligne), *Le « centre » de Bernstein*. In: Représentations des groupes réductifs sur un corps local, Travaux en cours, Hermann, Paris, 1984, 1–32; scan on J. Bernstein's page (image only). https://www.math.tau.ac.il/~bernstei/Publication_list/publication_texts/Bern_Center.pdf
- **`BZ76`**: I. N. Bernstein, A. V. Zelevinsky, *Representations of the group GL(n, F) where F is a non-archimedean local field*. Russian Math. Surveys 31:3 (1976), 1–68 (English translation); copy from J. Bernstein's page; printed page = PDF page. https://www.math.tau.ac.il/~bernstei/Publication_list/publication_texts/B-Zel-RepsGL-Usp.pdf
- **`BZ77`**: I. N. Bernstein, A. V. Zelevinsky, *Induced representations of reductive p-adic groups. I*. Ann. Sci. École Norm. Sup. (4) 10 (1977), 441–472 (Numdam); printed page = PDF page + 439. http://archive.numdam.org/article/ASENS_1977_4_10_4_441_0.pdf
- **`BOREL76`**: A. Borel, *Admissible representations of a semi-simple group over a local field with vectors fixed under an Iwahori subgroup*. Invent. Math. 35 (1976), 233–259 (GDZ scan with OCR); printed page = PDF page + 231. https://gdz.sub.uni-goettingen.de/download/pdf/PPN356556735_0035/LOG_0029.pdf
- **`CASSELMAN80`**: W. Casselman, *The unramified principal series of p-adic groups I. The spherical function*. Compositio Math. 40 (1980), 387–406 (Numdam); printed page = PDF page + 385. http://archive.numdam.org/article/CM_1980__40_3_387_0.pdf
- **`IM65`**: N. Iwahori, H. Matsumoto, *On some Bruhat decomposition and the structure of the Hecke rings of p-adic Chevalley groups*. Publ. Math. IHÉS 25 (1965), 5–48 (Numdam); printed page = PDF page + 3. http://archive.numdam.org/article/PMIHES_1965__25__5_0.pdf
- **`HKP03`**: T. J. Haines, R. E. Kottwitz, A. Prasad, *Iwahori–Hecke algebras*. arXiv:math/0309168v3 (published J. Ramanujan Math. Soc. 25 (2010), not compared); printed page = PDF page. https://arxiv.org/pdf/math/0309168
- **`LUSZTIG89`**: G. Lusztig, *Affine Hecke algebras and their graded version*. J. Amer. Math. Soc. 2 (1989), 599–635; printed page = PDF page + 598. https://www.ams.org/journals/jams/1989-02-03/S0894-0347-1989-0991016-9/S0894-0347-1989-0991016-9.pdf
- **`VIGNERAS98`**: M.-F. Vignéras, *Induced R-representations of p-adic reductive groups*. Author's preprint of Selecta Math. (N.S.) 4 (1998), 549–623; preprint pagination (printed = PDF), which differs from the journal's. https://perso.imj-prg.fr/mariefrance-vigneras/wp-content/uploads/vigneras-pub/sealu98.pdf
- **`DAT09`**: J.-F. Dat, *Finitude pour les représentations lisses de groupes p-adiques*. arXiv:math/0607405v1 (preprint of J. Inst. Math. Jussieu 8 (2009), not compared); printed page = PDF page. https://arxiv.org/pdf/math/0607405
- **`BK15`**: R. Bezrukavnikov, D. Kazhdan (with an appendix by Y. Varshavsky, R. Bezrukavnikov and D. Kazhdan), *Geometry of second adjointness for p-adic groups*. arXiv:1112.6340v4 (published Represent. Theory 19 (2015), not compared); printed page = PDF page. https://arxiv.org/pdf/1112.6340v4
- **`KONNO03`**: T. Konno, *A note on the Langlands classification and irreducibility of induced representations of p-adic groups*. Kyushu J. Math. 57 (2003), 383–409 (J-STAGE, open access); printed page = PDF page + 382. https://www.jstage.jst.go.jp/article/kyushujm/57/2/57_2_383/_pdf
- **`FS21`**: L. Fargues, P. Scholze, *Geometrization of the local Langlands correspondence*. arXiv:2102.13459v4 (27 Nov 2024); printed page = PDF page. https://arxiv.org/pdf/2102.13459v4
- **`TV16`**: A. Treumann, A. Venkatesh, *Functoriality, Smith theory, and the Brauer homomorphism*. Ann. of Math. 183 (2016), 177–228 (published, read); arXiv:1407.2346v1 compared at every cited place. https://annals.math.princeton.edu/wp-content/uploads/annals-v183-n1-p04-p.pdf
- **`VENKATESH19`**: A. Venkatesh, *Derived Hecke algebra and cohomology of arithmetic groups*. Forum Math. Pi 7 (2019), e7 (published, read; page numbers are the published ones); arXiv:1608.07234v3 compared. https://www.cambridge.org/core/services/aop-cambridge-core/content/view/S2050508619000064
- **`HE18`**: X. He, *Cocenters of p-adic groups, I: Newton decomposition*. Forum Math. Pi 6 (2018), e2 (published, read; numbering and pages are the published ones); arXiv:1610.04791v3 compared. https://www.cambridge.org/core/services/aop-cambridge-core/content/view/803823BBCAD2701B79B7C5C7BF72C1B5/S205050861800001Xa.pdf/cocenters_of_p_adic_groups_i_newton_decomposition.pdf
- **`ACC23`**: P. B. Allen, F. Calegari, A. Caraiani, T. Gee, D. Helm, B. V. Le Hung, J. Newton, P. Scholze, R. Taylor, J. A. Thorne, *Potential automorphy over CM fields*. Ann. of Math. 197 (2023), 897–1113: author PDF with the journal pagination; arXiv:1812.09999v2 compared. https://www.math.uchicago.edu/~fcale/papers/Ramanujan.pdf
- **`BCGP21`**: G. Boxer, F. Calegari, T. Gee, V. Pilloni, *Abelian surfaces over totally real fields are potentially modular*. arXiv:1812.09269v3 (latest version), read; Publ. Math. IHÉS 134 (2021), 153–501, compared at §2.4. https://arxiv.org/pdf/1812.09269v3
- **`BP26`**: G. Boxer, V. Pilloni, *Higher Hida theory for Siegel modular forms*. Author copy, 65 pp. (the published Invent. Math. version, doi:10.1007/s00222-025-01393-2, was not read; not on arXiv); printed page = PDF page. https://www.imo.universite-paris-saclay.fr/~pilloni/higherhidaSiegel.pdf
- **`PILLONI20`**: V. Pilloni, *Higher coherent cohomology and p-adic modular forms of singular weights*. Author copy, 113 pp., listed by the author as the Duke Math. J. 169 (2020) paper (published version not read); printed page = PDF page. https://www.imo.universite-paris-saclay.fr/~pilloni/complexhidatheorygsp4.pdf
- **`CG18`**: F. Calegari, D. Geraghty, *Modularity lifting beyond the Taylor–Wiles method*. arXiv:1207.4224v2 (16 Jul 2017; latest version), whose §9.2.1 is the published §9.4.1 (Invent. Math. 211 (2018), not read). https://arxiv.org/pdf/1207.4224v2
- **`CG20`**: F. Calegari, D. Geraghty, *Minimal modularity lifting for nonregular symplectic representations*. arXiv:1907.08691v1 (only version; published Duke Math. J. 169 (2020), not read). https://arxiv.org/pdf/1907.08691v1
- **`CT17`**: L. Clozel, J. A. Thorne, *Level-raising and symmetric power functoriality, III*. Author manuscript dated 10 Dec 2015 (accepted version of Duke Math. J. 166 (2017), 325–402; published version not compared). https://www.dpmms.cam.ac.uk/~jat58/lrspiii.pdf
- **`GS23`**: W. T. Gan, G. Savin, *Howe duality and dichotomy for exceptional theta correspondences*. arXiv:2102.00372v1 (only version; published Invent. Math. 232 (2023), not read). https://arxiv.org/pdf/2102.00372v1
- **`KALETHA16`**: T. Kaletha, *Rigid inner forms of real and p-adic groups*. arXiv:1304.3292v5 (9 Feb 2015; published Ann. of Math. 184 (2016), not compared). https://arxiv.org/pdf/1304.3292v5
- **`PAN26`**: L. Pan, *On locally analytic vectors of the completed cohomology of modular curves II*. arXiv:2209.06366v1 (14 Sep 2022). https://arxiv.org/pdf/2209.06366v1
- **`STACKS`**: The Stacks project authors, *The Stacks project*. Online, read 2026-10-09. https://stacks.math.columbia.edu

## Suggested signatures and proof boundaries

The suggested file checks the early category, invariants, Haar and Hecke constructions, induction, normal-subgroup coinvariants, derived Hom, tensor and dual signatures against the pinned libraries. It uses the existing Hecke ring and the A-unitization carrier for nondegenerate modules. Its concrete general-linear-group signatures cover admissibility, uniform bounds, noetherianity and finiteness over the Hecke centre. Admitted signatures are planning data and claim no implementation.

The omission ledger names each remaining declaration, API item and test whose condition or carrier cannot yet be stated at the pins. General reductive statements require the requested parabolic-pair, relative root-data, Iwahori, positive-cone and cuspidal-data interfaces; the sheaf statements require smooth equivariance and compactly supported sections, beyond a plain sheaf on a topological space. The double-coset product requires the restriction, conjugation, cup-product and corestriction interfaces from ProfiniteCohomology Layers 10 and 12, named in the requests. These entries are comments, not elaborated examples. They are explicit refinements in the stage coverage records; no arbitrary proposition stands in for a missing condition.

Equivariant K-flat replacement and the enhanced degree-zero centre comparison remain proof gaps. The general positive Levi homomorphism also requires the structure-constant transfer not proved in Allen et al. Lemma 2.1.12. Its normaliser and torus formula has the smaller stated hypotheses. The stage order preserves these proof boundaries rather than making second adjointness a prerequisite of the Bernstein centre.
