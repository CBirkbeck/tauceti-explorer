# K2SymbolsBrauer — T.1

Independent review of the stable Steinberg, classical K2, symbol and Milnor K-theory plan. Statements and interfaces have been corrected, bundled results separated, and missing proof inputs recorded explicitly. The universal-central-extension package (existence for perfect groups, Hopf's formula, the kernel as H_2, the Recognition Theorem and naturality) is decomposed in T.1:classical and is imported by K3BlochGroups V.1 and StableHomotopyKTheory H.3; The trivial-integral quotient five-term sequence is constructed from the actual pinned bar-chain kernel and its first homology; its map-level naturality supplies Hopf's formula and its naturality without importing later spectra. All six scoped stages remain partial; Matsumoto normal forms, noncommutative matrix bridges and arithmetic computations are not source-decomposed. Nothing is formalised. Round2 FIX-RT-AREA-ktheory-1~2 expands the proof inputs described in the fix report, updates source-reading boundaries and retains precisely named supplier gaps. The revised plan awaits independent review; it is not a formalization.

FIX-RT-AREA-ktheory-1~2, issue #5541. Codex, session codex-5ebb6f, 2026-10-02. The five revised packets await independent review. Earlier review decisions are preserved as history. This document is the planning roadmap; the suggested Lean signatures remain unchecked and were not compiled.

This packet has 66 nodes, 107 API items, 73 unit-test obligations and 18 explicitly remaining gaps. A complete disposition of an assigned fix does not assert closure of the entire roadmap.

## Scope and pinned library inputs

`K2SymbolsBrauer:T.1`, `K2SymbolsBrauer:T.1:classical`, `K2SymbolsBrauer:T.1:plus`, `K2SymbolsBrauer:T.2`, `K2SymbolsBrauer:T.2:graded-map`, `K2SymbolsBrauer:T.2:symbols`

Mathlib: `082e2d37e8b0463410cdb532e111cd43d5a66174`. Tau Ceti: `f790474821cf4256814db967cb154e7af3d0c369`.

- `mathlib:PresentedGroup` — Mathlib/GroupTheory/PresentedGroup.lean. Groups by generators and relations, the carrier of the Steinberg presentation. No additional read assertion recorded.

- `mathlib:Matrix.GeneralLinearGroup.transvection` — Mathlib/LinearAlgebra/Matrix/ElementaryRowOperations.lean. A transvection as a matrix unit for a finite index type over a COMMUTATIVE ring, with the distinct-index condition. It does not supply the general associative-ring target. No additional read assertion recorded.

- `tauceti:TauCeti.transvectionUnit` — TauCeti/LinearAlgebra/Matrix/GeneralLinearGroup/Transvection.lean. Transvection unit over CommRing A with finite index type and DecidableEq; the general associative-ring bridge remains open. No additional read assertion recorded.

- `tauceti:TauCeti.commutatorElement_transvectionUnit` — TauCeti/LinearAlgebra/Matrix/GeneralLinearGroup/Transvection.lean. Only the forward chaining relation [e_ij(c),e_jl(d)]=e_il(c*d), for pairwise distinct i,j,l over CommRing A. Separate declarations supply the other cases. No additional read assertion recorded.

- `mathlib:commutatorElement` — Mathlib/Algebra/Group/Commutator.lean. The group commutator in which every Steinberg relation and every symbol is written. No additional read assertion recorded.

- `mathlib:Subgroup.center` — Mathlib/GroupTheory/Subgroup/Center.lean. The centre of a group, which Steinberg's theorem identifies with K_2. No additional read assertion recorded.

- `mathlib:Group.IsPerfect` — Mathlib/GroupTheory/IsPerfect.lean. Perfectness, the hypothesis of the Recognition Theorem. No additional read assertion recorded.

- `mathlib:GroupExtension` — Mathlib/GroupTheory/GroupExtension/Defs.lean. Group extensions; the centrality predicate this layer needs is not part of it and is added here. No additional read assertion recorded.

- `tauceti:TauCeti.FactorSet.inl_range_le_center` — TauCeti/GroupTheory/GroupExtension/Of/FactorSet.lean. That an extension built from a trivial-action factor set is central, the nearest pinned statement about central extensions. No additional read assertion recorded.

- `tauceti:TauCeti.GroupExtension.nonempty_equiv_iff_cohomologyClass_factorSet_eq` — TauCeti/GroupTheory/GroupExtension/Cohomology.lean. Equivalence iff the factor-set cohomology classes agree, for extensions inducing a FIXED action and chosen normalized sections. This is not by itself a classification of all central extensions; the trivial-action bridge must be proved. No additional read assertion recorded.

- `mathlib:groupHomology.H2` — Mathlib/RepresentationTheory/Homological/GroupHomology/LowDegree.lean. Degree-two homology of a representation A : Rep k G, as a ModuleCat k object. H2(G;Z) requires the trivial integral representation, not an omitted coefficient argument. No additional read assertion recorded.

- `mathlib:groupHomology.H1` — Mathlib/RepresentationTheory/Homological/GroupHomology/LowDegree.lean. Degree-one homology of A : Rep k G. The vanishing/perfectness comparison still needs the trivial-integral coefficient specialization and abelianization bridge. No additional read assertion recorded.

- `mathlib:groupHomology` — Mathlib/RepresentationTheory/Homological/GroupHomology/Basic.lean. Homology of the inhomogeneous chain complex of A : Rep k G; use trivial integral coefficients for the present group invariants. No additional read assertion recorded.

- `mathlib:HomotopyGroup` — Mathlib/Topology/Homotopy/HomotopyGroup.lean. Homotopy group of a pointed topological space, indexed by a finite coordinate TYPE N (use Fin n for degree n), not directly a natural-number argument. This supplies no Hurewicz theorem. No additional read assertion recorded.

- `mathlib:TensorAlgebra` — Mathlib/LinearAlgebra/TensorAlgebra/Basic.lean. The tensor algebra, the carrier of Milnor K-theory once applied to the units written additively. No additional read assertion recorded.

- `mathlib:Additive` — Mathlib/Algebra/Group/TypeTags/Basic.lean. The additive type tag turning the unit group into a module over the integers. No additional read assertion recorded.

- `mathlib:RingQuot` — Mathlib/Algebra/RingQuot.lean. The ring quotient generated by a relation. It does not export a grading or the homogeneous Steinberg ideal construction. No additional read assertion recorded.

- `mathlib:Matrix.diag2_decompose` — Mathlib/LinearAlgebra/Matrix/SpecialLinearGroup.lean. The decomposition of the two by two diagonal matrix diag(a, a inverse) as a product of six transvections, over a field: the matrix identity behind the lift h_ij(u). No additional read assertion recorded.

- `tauceti:Matrix.SpecialLinearGroup.diag2nUnit_decompose` — TauCeti/LinearAlgebra/Matrix/SpecialLinearGroup/Diagonal.lean. The same decomposition at two coordinates of a larger matrix over a commutative ring, which is the form the stable symbol needs. No additional read assertion recorded.

- `mathlib:Units` — Mathlib/Algebra/Group/Units/Defs.lean. The unit group of a ring, the source of every symbol. No additional read assertion recorded.

- `mathlib:DirectLimit` — Mathlib/Order/DirectedInverseSystem.lean. Type-level quotient of a directed system. A group structure, its homomorphism universal property and finite-representative equality must still be supplied. No additional read assertion recorded.

- `mathlib:ZMod` — Mathlib/Data/ZMod/Defs.lean. ZMod n, including ZMod 0 = Z. Useful cyclic target carriers; this is not a theorem that the multiplicative group of a finite field is cyclic. No additional read assertion recorded.

- `mathlib:NumberField.InfinitePlace.nrRealPlaces` — Mathlib/NumberTheory/NumberField/InfinitePlace/Basic.lean. The invariant r_1 in which the Bass-Tate answer for Milnor K-theory of a number field is stated. No additional read assertion recorded.

- `tauceti:TauCeti.transvectionUnit_add` — TauCeti/LinearAlgebra/Matrix/GeneralLinearGroup/Transvection.lean. Additivity e_ij(c+d)=e_ij(c)*e_ij(d), over CommRing A with finite indices and i != j. No additional read assertion recorded.

- `tauceti:TauCeti.commute_transvectionUnit` — TauCeti/LinearAlgebra/Matrix/GeneralLinearGroup/Transvection.lean. Commutativity for nonchaining index pairs i != j, k != l, j != k, l != i, over CommRing A. No additional read assertion recorded.

- `tauceti:TauCeti.commutatorElement_transvectionUnit_reverse` — TauCeti/LinearAlgebra/Matrix/GeneralLinearGroup/Transvection.lean. Reverse chaining relation [e_ij(c),e_ki(d)]=e_kj(-(d*c)), with pairwise distinct i,j,k, over CommRing A. No additional read assertion recorded.

- `mathlib:Rep.trivial` — Mathlib/RepresentationTheory/Rep/Basic.lean. Rep.trivial k G V, the trivial representation; H_n(G, Z) is groupHomology (Rep.trivial ℤ G ℤ) n, with G in Type because the homology files fix k and G in one universe. statement read at the pinned commit (Mathlib/RepresentationTheory/Rep/Basic.lean:286) by FIX-RT-AREA-ktheory-1

- `mathlib:groupHomology.H1AddEquivOfIsTrivial` — Mathlib/RepresentationTheory/Homological/GroupHomology/LowDegree.lean. For a trivial representation A, H1 A ≃+ Additive (Abelianization G) ⊗[ℤ] A; with A = Z and TensorProduct.rid this is H_1(G, Z) ≅ G_ab. statement read at the pinned commit (Mathlib/RepresentationTheory/Homological/GroupHomology/LowDegree.lean:1023) by FIX-RT-AREA-ktheory-1

- `mathlib:groupHomology.map` — Mathlib/RepresentationTheory/Homological/GroupHomology/Functoriality.lean. The map H_n(G, A) → H_n(H, B) induced by f : G →* H and φ : A ⟶ res f B; with trivial Z coefficients and φ = 𝟙 it is H_n(f; Z). statement read at the pinned commit (Mathlib/RepresentationTheory/Homological/GroupHomology/Functoriality.lean:157) by FIX-RT-AREA-ktheory-1

- `mathlib:groupHomology.H1π_comp_map` — Mathlib/RepresentationTheory/Homological/GroupHomology/Functoriality.lean. H1π A ≫ map f φ 1 = mapCycles₁ f φ ≫ H1π B: the degree-one map on classes of 1-cycles. statement read at the pinned commit (Mathlib/RepresentationTheory/Homological/GroupHomology/Functoriality.lean:387) by FIX-RT-AREA-ktheory-1

- `mathlib:groupHomology.mapIso` — Mathlib/RepresentationTheory/Homological/GroupHomology/Functoriality.lean. The isomorphism of homology groups induced by a group isomorphism and a compatible linear isomorphism of coefficients. statement read at the pinned commit (Mathlib/RepresentationTheory/Homological/GroupHomology/Functoriality.lean:193) by FIX-RT-AREA-ktheory-1

- `mathlib:groupHomologyIso` — Mathlib/RepresentationTheory/Homological/GroupHomology/Basic.lean. groupHomology A n ≅ homology of (P ⊗ A)_G for any projective resolution P of the trivial representation k; the tool for computing H_n of a free group from a length-one resolution. statement read at the pinned commit (Mathlib/RepresentationTheory/Homological/GroupHomology/Basic.lean:258) by FIX-RT-AREA-ktheory-1

- `mathlib:CategoryTheory.ProjectiveResolution` — Mathlib/CategoryTheory/Preadditive/Projective/Resolution.lean. A projective resolution: an ℕ-indexed chain complex of projectives with a quasi-isomorphism to the object in degree zero. statement read at the pinned commit (Mathlib/CategoryTheory/Preadditive/Projective/Resolution.lean:41) by FIX-RT-AREA-ktheory-1

- `mathlib:groupHomology.H1CoresCoinfOfTrivial_exact` — Mathlib/RepresentationTheory/Homological/GroupHomology/Functoriality.lean. For S normal in G acting trivially on A, the short complex H_1(S, A) → H_1(G, A) → H_1(G/S, A) of corestriction and coinflation is exact. There is no degree-two continuation (no map H_2(G/S) → H_1(S)_G). statement read at the pinned commit (Mathlib/RepresentationTheory/Homological/GroupHomology/Functoriality.lean:468) by FIX-RT-AREA-ktheory-1

- `mathlib:groupHomology.H1CoresCoinfOfTrivial_g_epi` — Mathlib/RepresentationTheory/Homological/GroupHomology/Functoriality.lean. In the same situation H_1(G, A) → H_1(G/S, A) is an epimorphism. statement read at the pinned commit (Mathlib/RepresentationTheory/Homological/GroupHomology/Functoriality.lean:460) by FIX-RT-AREA-ktheory-1

- `mathlib:TensorProduct.rid` — Mathlib/LinearAlgebra/TensorProduct/Associator.lean. M ⊗[R] R ≃ₗ[R] M, the unit isomorphism used to turn G_ab ⊗ Z into G_ab. statement read at the pinned commit (Mathlib/LinearAlgebra/TensorProduct/Associator.lean:72) by FIX-RT-AREA-ktheory-1

- `mathlib:Abelianization` — Mathlib/GroupTheory/Abelianization/Defs.lean. The abelianisation G ⧸ commutator G. statement read at the pinned commit (Mathlib/GroupTheory/Abelianization/Defs.lean:38) by FIX-RT-AREA-ktheory-1

- `mathlib:Abelianization.map` — Mathlib/GroupTheory/Abelianization/Defs.lean. The map of abelianisations induced by a group homomorphism. statement read at the pinned commit (Mathlib/GroupTheory/Abelianization/Defs.lean:123) by FIX-RT-AREA-ktheory-1

- `mathlib:Group.isPerfect_def` — Mathlib/GroupTheory/IsPerfect.lean. IsPerfect G ↔ commutator G = ⊤. statement read at the pinned commit (Mathlib/GroupTheory/IsPerfect.lean:47) by FIX-RT-AREA-ktheory-1

- `mathlib:commutator` — Mathlib/GroupTheory/Commutator/Basic.lean. The commutator subgroup ⁅⊤, ⊤⁆ of a group, normal and characteristic. statement read at the pinned commit (Mathlib/GroupTheory/Commutator/Basic.lean:450) by FIX-RT-AREA-ktheory-1

- `mathlib:Subgroup.map_commutator` — Mathlib/GroupTheory/Commutator/Basic.lean. map f ⁅H₁, H₂⁆ = ⁅map f H₁, map f H₂⁆: a surjection maps [F, F] onto [G, G]. statement read at the pinned commit (Mathlib/GroupTheory/Commutator/Basic.lean:324) by FIX-RT-AREA-ktheory-1

- `mathlib:FreeGroup` — Mathlib/GroupTheory/FreeGroup/Basic.lean. The free group on a type, the source of a free presentation. statement read at the pinned commit (Mathlib/GroupTheory/FreeGroup/Basic.lean:471) by FIX-RT-AREA-ktheory-1

- `mathlib:FreeGroup.lift` — Mathlib/GroupTheory/FreeGroup/Basic.lean. Functions α → β into a group extend uniquely to homomorphisms FreeGroup α →* β; the lifting step of the Recognition Theorem. statement read at the pinned commit (Mathlib/GroupTheory/FreeGroup/Basic.lean:678) by FIX-RT-AREA-ktheory-1

- `mathlib:FreeGroup.map` — Mathlib/GroupTheory/FreeGroup/Basic.lean. The homomorphism FreeGroup α →* FreeGroup β induced by a function α → β; it lifts a homomorphism of groups to their canonical presentations. statement read at the pinned commit (Mathlib/GroupTheory/FreeGroup/Basic.lean:756) by FIX-RT-AREA-ktheory-1

- `mathlib:IsFreeGroup` — Mathlib/GroupTheory/FreeGroup/IsFreeGroup.lean. A group admitting a free basis in its own universe. statement read at the pinned commit (Mathlib/GroupTheory/FreeGroup/IsFreeGroup.lean:84) by FIX-RT-AREA-ktheory-1

- `mathlib:subgroupIsFreeOfIsFree` — Mathlib/GroupTheory/FreeGroup/NielsenSchreier.lean. Nielsen-Schreier: a subgroup of a free group is free. statement read at the pinned commit (Mathlib/GroupTheory/FreeGroup/NielsenSchreier.lean:321) by FIX-RT-AREA-ktheory-1

- `mathlib:MonoidHom.eqLocus` — Mathlib/Algebra/Group/Subgroup/Ker.lean. The subgroup on which two homomorphisms agree; the carrier of the pullback of an extension. statement read at the pinned commit (Mathlib/Algebra/Group/Subgroup/Ker.lean:388) by FIX-RT-AREA-ktheory-1

- `mathlib:MonoidHom.ker` — Mathlib/Algebra/Group/Subgroup/Ker.lean. The kernel of a group homomorphism, the kernel of a central extension. statement read at the pinned commit (Mathlib/Algebra/Group/Subgroup/Ker.lean:238) by FIX-RT-AREA-ktheory-1

- `mathlib:groupCohomology.H2` — Mathlib/RepresentationTheory/Homological/GroupCohomology/LowDegree.lean. Second group cohomology, which classifies extensions with abelian kernel through the Tau Ceti factor sets. statement read at the pinned commit (Mathlib/RepresentationTheory/Homological/GroupCohomology/LowDegree.lean:1042) by FIX-RT-AREA-ktheory-1

- `mathlib:groupHomology.inhomogeneousChains` — Mathlib/RepresentationTheory/Homological/GroupHomology/Basic.lean. The inhomogeneous (bar) chain complex, on which 2-cycles are paired with 2-cocycles. statement read at the pinned commit (Mathlib/RepresentationTheory/Homological/GroupHomology/Basic.lean:156) by FIX-RT-AREA-ktheory-1

- `mathlib:groupHomology.d₃₂` — Mathlib/RepresentationTheory/Homological/GroupHomology/LowDegree.lean. The differential out of degree three in coordinates, whose image is the 2-boundaries. statement read at the pinned commit (Mathlib/RepresentationTheory/Homological/GroupHomology/LowDegree.lean:193) by FIX-RT-AREA-ktheory-1

- `mathlib:AddCircle` — Mathlib/Topology/Instances/AddCircle/Defs.lean. AddCircle p = 𝕜 ⧸ zmultiples p; with p = (1 : ℚ) this is Q/Z, the target of characters. statement read at the pinned commit (Mathlib/Topology/Instances/AddCircle/Defs.lean:188) by FIX-RT-AREA-ktheory-1

- `mathlib:CharacterModule` — Mathlib/Algebra/Module/CharacterModule.lean. Characters A →+ AddCircle (1 : ℚ), i.e. homomorphisms to Q/Z. statement read at the pinned commit (Mathlib/Algebra/Module/CharacterModule.lean:44) by FIX-RT-AREA-ktheory-1

- `mathlib:CharacterModule.dual_surjective_of_injective` — Mathlib/Algebra/Module/CharacterModule.lean. Characters extend along injective maps (Q/Z is injective). statement read at the pinned commit (Mathlib/Algebra/Module/CharacterModule.lean:101) by FIX-RT-AREA-ktheory-1

- `mathlib:CharacterModule.eq_zero_of_character_apply` — Mathlib/Algebra/Module/CharacterModule.lean. An element killed by every character is zero. statement read at the pinned commit (Mathlib/Algebra/Module/CharacterModule.lean:223) by FIX-RT-AREA-ktheory-1

- `tauceti:TauCeti.FactorSet.exists_cohomologyClass_eq` — TauCeti/GroupTheory/GroupExtension/Cohomology.lean. Every class of H²(G, M) is the class of a factor set (G M : Type). statement read at the pinned commit (TauCeti/GroupTheory/GroupExtension/Cohomology.lean:187) by FIX-RT-AREA-ktheory-1

- `tauceti:TauCeti.FactorSet.nonempty_splitting_iff_cohomologyClass_eq_zero` — TauCeti/GroupTheory/GroupExtension/Cohomology.lean. The extension of a factor set splits exactly when its class in H² vanishes. statement read at the pinned commit (TauCeti/GroupTheory/GroupExtension/Cohomology.lean:245) by FIX-RT-AREA-ktheory-1

- `tauceti:TauCeti.FactorSet.groupExtension` — TauCeti/GroupTheory/GroupExtension/Of/FactorSet.lean. The group extension 1 → M → E_α → G → 1 determined by a factor set. statement read at the pinned commit (TauCeti/GroupTheory/GroupExtension/Of/FactorSet.lean:257) by FIX-RT-AREA-ktheory-1

- `mathlib:groupHomology.chainsMap` — Mathlib/RepresentationTheory/Homological/GroupHomology/Functoriality.lean. The chain map on the actual inhomogeneous complex, sending a tuple to its f-image and coefficients through φ; read lines58–66. Actual statement read at Mathlib082e2d3 on2026-10-02 by FIX-RT-AREA-ktheory-1~2, Codex codex-5ebb6f.

- `mathlib:groupHomology.chainsMap_f_single` — Mathlib/RepresentationTheory/Homological/GroupHomology/Functoriality.lean. Its basis-tuple evaluation; read79–82. Actual statement read at Mathlib082e2d3 on2026-10-02 by FIX-RT-AREA-ktheory-1~2, Codex codex-5ebb6f.

- `mathlib:groupHomology.chainsMap_comp` — Mathlib/RepresentationTheory/Homological/GroupHomology/Functoriality.lean. Composition with the restriction-compatible coefficient maps; read95–101. Actual statement read at Mathlib082e2d3 on2026-10-02 by FIX-RT-AREA-ktheory-1~2, Codex codex-5ebb6f.

- `mathlib:groupHomology.chainsMap_f_map_epi` — Mathlib/RepresentationTheory/Homological/GroupHomology/Functoriality.lean. Degreewise epimorphism when f is surjective and the coefficient morphism epi; read121–125. Actual statement read at Mathlib082e2d3 on2026-10-02 by FIX-RT-AREA-ktheory-1~2, Codex codex-5ebb6f.

- `mathlib:groupHomology.d₁₀_eq_zero_of_isTrivial` — Mathlib/RepresentationTheory/Homological/GroupHomology/LowDegree.lean. The degree-one differential vanishes for a trivial representation; read138–141. Actual statement read at Mathlib082e2d3 on2026-10-02 by FIX-RT-AREA-ktheory-1~2, Codex codex-5ebb6f.

- `mathlib:groupHomology.d₂₁_single` — Mathlib/RepresentationTheory/Homological/GroupHomology/LowDegree.lean. Boundary of(a,b) with trivial coefficients is[b]−[ab]+[a]; read145–153. Actual statement read at Mathlib082e2d3 on2026-10-02 by FIX-RT-AREA-ktheory-1~2, Codex codex-5ebb6f.

- `mathlib:HomologicalComplex.eval_preservesLimit_of_hasKernel_f` — Mathlib/Algebra/Homology/HomologicalComplexKernels.lean. Evaluation preserves the kernel of a complex map whose components have kernels; read36–42. Actual statement read at Mathlib082e2d3 on2026-10-02 by FIX-RT-AREA-ktheory-1~2, Codex codex-5ebb6f.

- `mathlib:CategoryTheory.ShortComplex.ShortExact.δ` — Mathlib/Algebra/Homology/HomologySequence.lean. Connecting homomorphism for a short exact complex of complexes at adjacent degrees; read284–290. Actual statement read at Mathlib082e2d3 on2026-10-02 by FIX-RT-AREA-ktheory-1~2, Codex codex-5ebb6f.

- `mathlib:CategoryTheory.ShortComplex.ShortExact.δ_apply` — Mathlib/Algebra/Homology/ConcreteCategory.lean. A cycle lifted to the middle complex maps to the positive boundary class in the kernel complex; read103–125. Actual statement read at Mathlib082e2d3 on2026-10-02 by FIX-RT-AREA-ktheory-1~2, Codex codex-5ebb6f.

- `mathlib:CategoryTheory.ShortComplex.ShortExact.homology_exact₁` — Mathlib/Algebra/Homology/HomologySequence.lean. Exactness at kernel-complex homology after δ; read300–302. Actual statement read at Mathlib082e2d3 on2026-10-02 by FIX-RT-AREA-ktheory-1~2, Codex codex-5ebb6f.

- `mathlib:CategoryTheory.ShortComplex.ShortExact.homology_exact₂` — Mathlib/Algebra/Homology/HomologySequence.lean. Exactness at middle-complex homology; read306–318. Actual statement read at Mathlib082e2d3 on2026-10-02 by FIX-RT-AREA-ktheory-1~2, Codex codex-5ebb6f.

- `mathlib:CategoryTheory.ShortComplex.ShortExact.homology_exact₃` — Mathlib/Algebra/Homology/HomologySequence.lean. Exactness at quotient-complex homology before δ; read321–322. Actual statement read at Mathlib082e2d3 on2026-10-02 by FIX-RT-AREA-ktheory-1~2, Codex codex-5ebb6f.

- `mathlib:HomologicalComplex.HomologySequence.δ_naturality` — Mathlib/Algebra/Homology/HomologySequenceLemmas.lean. Naturality of δ for a morphism of short exact complexes; read35–60. Actual statement read at Mathlib082e2d3 on2026-10-02 by FIX-RT-AREA-ktheory-1~2, Codex codex-5ebb6f.

## Sources and actual reading coverage

### The K-book: An Introduction to Algebraic K-theory

Charles A. Weibel. Author-hosted combined draft dated 29 August 2013 (published as Graduate Studies in Mathematics 145, American Mathematical Society, 2013). Internal numbering (chapter.section.item) is quoted..

[Source](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf)

SHA-256: `a04f53c9393b20672fab2a6818279b2f9996dbc7cf74735789ed13804b058845`.

**Read scope.**

- III.5.1-III.5.5.1: the Steinberg group, K_2, Steinberg's centre theorem, universal central extensions, the Hopf formula, the Recognition Theorem and the finite-rank splitting (PDF pp. 225-228)
- III.5.10-III.5.11.1: the star product, the Steinberg symbol, the Steinberg identity, the generation theorem and the Dennis-Stein symbols (PDF pp. 233-234)
- III.6.1-III.6.1.3: Matsumoto's theorem, K_2 of a finite field, the rational function field and the torsion kernel (PDF p. 239)
- III.7.1-III.7.3.1: Milnor K-theory, its examples, the higher tame symbols and rigidity (PDF pp. 253-254)
- IV.1.20 and Ex. IV.1.9 for the comparison with homotopy K-theory (PDF pp. 281-282)
- Independent review: IV.1.7.1 and Exercise IV.1.8 (PDF pp.273,282); IV.1.10-.1 (PDF p.274); VI.4.3.2 (PDF p.490); VI.5.2.1 and VI.5.3 (PDF p.496); source edition is the author copy, not the published text.
- Independent review additional check: III.6.3 (PDF p.242) has the inverse tame-symbol convention to this roadmap; both detect {t,-1} as -1. Exercise III.7.3 (PDF p.265) explicitly states n>=2.
- FIX-RT-AREA-ktheory-1, 2026-09-30: re-fetched, SHA-256 matched; read III.5.3-III.5.5.1 (PDF pp. 226-228), Exercise III.5.7 (PDF p. 237), IV.1.7-IV.1.7.1 (PDF pp. 272-273) and Exercises IV.1.8-IV.1.9 (PDF p. 282).

### Group Cohomology (lecture notes, Universität Regensburg, Sommersemester 2019)

Clara Löh. Author-hosted lecture notes for the summer semester 2019; printed page numbers are quoted with the PDF page (printed page + 8)..

[Source](https://loeh.app.uni-regensburg.de/teaching/grouphom_ss19/lecture_notes.pdf)

SHA-256: `d4f2d819bfa85c57277db74bf749d05f03e85833c76e89eab99127f077d2cd76`.

**Read scope.**

- Theorem 1.4.1 and Corollary 1.4.6 (printed pp. 20, 23): H_1 with trivial integral coefficients is the abelianisation, and perfectness is H_1 = 0
- Theorem 1.5.1 with its proof note (printed p. 30) and Outlook 1.5.15 (printed pp. 40-41)
- Proposition 1.6.21, Remark 1.6.22 and Corollary 1.6.23 (printed pp. 55-57): the length-one free resolution over a free group and the vanishing of its homology in degrees at least two
- Theorem 3.2.12 and Remark 3.2.14 (printed pp. 123-124): the Hochschild-Serre spectral sequence and its naturality, stated without construction
- Theorem 3.2.18 with its proof (printed pp. 129-132): Hopf's formula from the Hochschild-Serre spectral sequence

### Weibel, K-book chapter III, separately hosted author chapter

Charles A. Weibel. Separately hosted author chapter downloaded 2026-09-30; checksum and chapter-PDF pagination distinguish it from the earlier combined draft..

[Source](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.III.pdf)

SHA-256: `ba1bc2d25680ab25c4baadc5ab28e39d1077dc66bb12ca4e2174b6cb55f81307`.

**Read scope.**

- PDF pp.61–62: III.7.2–7.3, global Milnor groups

### An introduction to homological algebra, Chapter6: Group Homology and Cohomology

Charles A.Weibel. Cambridge published chapter scan; DOI10.1017/CBO9781139644136.007; 56PDFpages, printed pp.160–215..

[Source](https://math.mit.edu/~hrm/palestine/weibel/06-group_homology_and_cohomology.pdf)

SHA-256: `7e44c5cb4dc6201cacca2c0fd117eaaf5e7afaa51fdef177314b4cdbe15dcf95`.

**Read scope.**

- FIX-RT-AREA-ktheory-1~2, Codex codex-5ebb6f: §6.8.1–6.8.3 printed195–196/PDF36–37 text; p.196 independently rendered as image. Printed198/PDF39 Hopf computation and printed200/PDF41 perfect Hopf-extension lemma and opening of UCE existence read as text. This revision proves only the trivial-integral-coefficient five-term sequence directly from the pinned bar complex and generic exact homology sequence; it does not claim to have decomposed the full Grothendieck spectral sequence.
- Example6.8.4 printed196, read text/image: its first sentence lacks a coefficient-triviality qualification; recorded as E-central-subgroup-coefficients. Its integral-coefficient application is unaffected.

## Declarations and proof obligations

### The Steinberg group of a ring in finite rank

`K2SymbolsBrauer:T.1/steinberg-group-finite-rank` · definition · parent `K2SymbolsBrauer:T.1:classical` · implementation unchecked

For a ring R and an integer n at least three define St_n(R) by generators x_ij(r), indexed by a pair of distinct integers i and j between one and n and an element r of R, subject to the Steinberg relations: x_ij(r) x_ij(s) = x_ij(r + s), and the commutator of x_ij(r) with x_kl(s) is trivial when j is different from k and i is different from l, is x_il(rs) when j equals k and i is different from l, and is x_kj(minus s r) when j is different from k and i equals l. The distinct-index hypotheses are part of each relation and are never dropped. No definition is given for n equal to two.

**Hypotheses.**

- R is an associative unital ring.
- n is at least three.
- i and j are distinct indices between one and n.

**Proof outline.**

1. Take the free group on the indexed generator set and quotient by the normal closure of the displayed relations, using the pinned presented-group construction.
2. State the three commutator relations with their index hypotheses. They are disjoint but deliberately do not constrain the opposite-root pair (i,j),(j,i).
3. Prove the elementary consequences: x_ij(0) is the identity and x_ij(r) inverse is x_ij(minus r).
4. Prove the universal property: a group homomorphism out of St_n(R) is the same as a family of elements satisfying the relations.
5. Use the source convention n >= 3; the unprescribed opposite-root case also occurs at higher rank and is not an explanation unique to rank two.

**Acceptance.**

- x_ij(0) is the identity.
- The opposite-root commutator is not prescribed by these relations, at any rank.
- For n at least three the group is nontrivial whenever R is.

**Prerequisites.**

- `mathlib:PresentedGroup`
- `mathlib:commutatorElement`

**Planning API.**

| Name | Role | Contract |
| --- | --- | --- |
| `Steinberg` | data | The group St_n(R) for n at least three. |
| `Steinberg.x` | constructor | The generator x_ij(r), taking the distinctness of the indices as a hypothesis. |
| `Steinberg.x_add` | relation | x_ij(r) x_ij(s) = x_ij(r + s). |
| `Steinberg.commutator` | relation | The three commutator relations, each with its index hypothesis. |
| `Steinberg.lift` | universal-property | A family satisfying the relations induces a unique homomorphism out of St_n(R). |
| `Steinberg.x_zero` | simp | x_ij(0) is the identity. |
| `Steinberg.hom_ext` | extensionality | Two homomorphisms agreeing on every generator are equal. |
| `Steinberg.map` | functoriality | Ring maps act on parameters; identity and composition are proved on generators. |

**Consumers.**

- T.1's stabilisation — the stable group is the colimit of these
- T.1's finite-rank splitting — the splitting theorem for n at least five is a statement about these groups
- T.2's symbol — the elements w_ij and h_ij, from which the symbol is built, are words in these generators

**Unit tests.**

- `x_zero` (test) — x_01(0)=1 in rank three.
- `x_inverse` (test) — x_01(r)^-1=x_01(-r).
- `forward_product` (test) — [x_01(r),x_12(s)]=x_02(r*s).
- `reverse_product_order` (test) — Over R=M_2(Z), [x_01(r),x_20(s)]=x_21(-(s*r)); choose noncommuting r=E12 and s=E21 to distinguish s*r from r*s.
- `disjoint` (test) — [x_01(r),x_02(s)]=1; the opposite-root case x_01,x_10 is not assigned this relation.

**Sources.**

- `Kbook.2013`: III.5.1 (PDF p. 225). The definition and the three relations, as displayed.

### The elementary matrices satisfy the Steinberg relations

`K2SymbolsBrauer:T.1/elementary-matrices-satisfy` · lemma · parent `K2SymbolsBrauer:T.1:classical` · implementation unchecked

For an associative unital ring R and n >= 3, elementary transvections satisfy additivity, the nonchaining commutator relation and both chaining commutator relations, with all distinct-index hypotheses as in the Steinberg presentation.

**Hypotheses.**

- R is an associative unital ring; n is at least three.

**Proof outline.**

1. For a commutative ring, cite the four separate pinned transvection lemmas and align their index hypotheses.
2. For general associative R, construct I+rE_ij as a matrix unit with inverse I-rE_ij, then multiply matrix entries for each relation, retaining product order. This general-ring bridge remains gap G-matrix; it is not proved by the commutative-ring citations.

**Acceptance.**

- Forward chaining has coefficient r*s; reverse chaining has coefficient -(s*r).
- The nonchaining case requires both j != k and i != l.
- The opposite-root commutator is not asserted trivial.

**Prerequisites.**

- `K2SymbolsBrauer:T.1/steinberg-group-finite-rank`
- `mathlib:Matrix.GeneralLinearGroup.transvection`
- `tauceti:TauCeti.transvectionUnit`
- `tauceti:TauCeti.commutatorElement_transvectionUnit`
- `tauceti:TauCeti.transvectionUnit_add`
- `tauceti:TauCeti.commute_transvectionUnit`
- `tauceti:TauCeti.commutatorElement_transvectionUnit_reverse`

**Sources.**

- `Kbook.2013`: III.5.1.2 (PDF p. 225). The observation and the resulting surjection, as displayed.

### Stabilisation and the stable Steinberg group

`K2SymbolsBrauer:T.1/stabilisation` · construction · parent `K2SymbolsBrauer:T.1:classical` · implementation unchecked

Construct the rank-increasing maps between St_n(R) from the presentation and the stable group St(R) as their group colimit. Import the finite and stable elementary groups and their embeddings from KTheoryLowDegrees:U.1; the compatible finite Steinberg maps induce St(R) -> E(R).

**Hypotheses.**

- R is an associative unital ring.

**Proof outline.**

1. Extend each generator index by the standard inclusion and use the presentation universal property.
2. Construct the group-colimit operations and universal property on the directed quotient; the cited DirectLimit is only a carrier. Gap G-colimit records the missing group API.
3. Verify compatibility with the imported elementary embeddings on generators.
4. Lift an elementary word at finite rank to prove the induced map onto E(R) is surjective; use finite-representative equality for well-definedness.
5. Prove ring-map identity and composition on finite generators.

**Acceptance.**

- The stable map is surjective onto E(R).
- A statement proved for St(R) does not follow for St_n(R): the two are kept distinct, which is the discipline the layer requires.
- The construction is functorial in the ring.

**Prerequisites.**

- `K2SymbolsBrauer:T.1/steinberg-group-finite-rank`
- `K2SymbolsBrauer:T.1:classical/to-elementary`
- `mathlib:DirectLimit`
- `KTheoryLowDegrees:U.1`

**Planning API.**

| Name | Role | Contract |
| --- | --- | --- |
| `Steinberg.stabilise` | constructor | The map from rank n to rank n plus one. |
| `StableSteinberg` | data | The colimit St(R). |
| `StableSteinberg.phi` | constructor | The surjection onto the stable elementary group. |
| `StableSteinberg.phi_surjective` | characterisation | That surjection is onto. |
| `StableSteinberg.map` | functoriality | Functoriality in the ring. |
| `StableSteinberg.lift` | universal-property | Compatible finite-rank homomorphisms induce a unique homomorphism from St(R). |
| `StableSteinberg.hom_ext` | extensionality | Homomorphisms agreeing on every finite-stage generator are equal. |

**Consumers.**

- T.1's definition of K_2 — K_2 is the kernel of the stable surjection
- K3BlochGroups V.1 — that layer's homological model is about this stable group and its superperfection
- T.1:plus — the comparison with the K-theory space is stated for the stable objects

**Unit tests.**

- `rank_three_generator` (test) — The rank-three generator x_01(2) maps to the stable generator with the same parameter.
- `relation_survives` (test) — The image of [x_01(r),x_12(s)] is x_02(r*s) after any common stabilization.
- `finite_word_lift` (test) — A stable elementary word represented at rank five is the image of the corresponding rank-five Steinberg word.

**Sources.**

- `Kbook.2013`: III.5.1.2 (PDF p. 225). The stabilisation and the stable surjection, as displayed.

### Classical K_2 of a ring

`K2SymbolsBrauer:T.1/k2-definition` · definition · parent `K2SymbolsBrauer:T.1:classical` · implementation unchecked

Define classical K2(R) as ker(phi : St(R) -> E(R)). The inclusion into St(R) is injective and its image is the kernel; the stable Steinberg map is surjective. Ring maps induce maps on these kernels.

**Hypotheses.**

- R is an associative unital ring.

**Proof outline.**

1. Take the kernel of the stable surjection.
2. Assemble the four-term exact sequence, using that E(R) is the commutator subgroup of GL(R) and that K_1(R) is the quotient, both imported.
3. Prove functoriality in the ring.
4. Record that abelianness is not part of the definition: it is Steinberg's theorem, proved next.

**Acceptance.**

- The sequence is exact at each of its four places.
- K_2 of the zero ring is trivial.
- K_2(Z) is cyclic of order two, generated by the symbol of minus one with itself; this is the acceptance test that the group is not trivially zero.

**Prerequisites.**

- `K2SymbolsBrauer:T.1/stabilisation`

**Planning API.**

| Name | Role | Contract |
| --- | --- | --- |
| `K2` | data | The group K_2(R). |
| `K2.subtype` | coercion | Its inclusion into St(R). |
| `K2.mem_iff` | characterisation | An element lies in K_2(R) exactly when its image in E(R) is trivial. |
| `K2.map` | functoriality | Functoriality in the ring. |
| `K2.ext` | extensionality | Kernel elements are equal exactly when their values in St(R) are equal. |

**Consumers.**

- T.2's symbols — every symbol is an element of this group
- T.1:plus — the comparison identifies this group with a homotopy group
- K3BlochGroups V.1 — the kernel of the universal central extension there is this group

**Unit tests.**

- `zero_ring` (test) — K_2 of the zero ring is trivial.
- `integers` (test) — K_2(Z) is cyclic of order two.
- `finite_field` (test) — K_2 of a finite field is trivial.
- `not_by_definition_abelian` (test) — Abelianness is a theorem, not part of the definition: a definition that assumes it assumes Steinberg's theorem.

**Sources.**

- `Kbook.2013`: III.5.2 (PDF p. 225). The definition and the exact sequence, as displayed.

### Steinberg's theorem: K_2 is the centre of the Steinberg group

`K2SymbolsBrauer:T.1/k2-is-centre` · theorem · parent `K2SymbolsBrauer:T.1:classical` · implementation unchecked

For every ring R the group K_2(R) is abelian; in fact it is precisely the centre of St(R).

**Hypotheses.**

- R is an associative unital ring.

**Proof outline.**

1. One inclusion: if an element is central in St(R) then its image is central in E(R), and the centre of E(R) is trivial, so the image is trivial and the element lies in K_2(R).
2. For the other inclusion take an element y of the kernel. Its commutator with every element of St(R) maps to the identity in E(R).
3. Choose n large enough that y is a word in the generators with indices below n. For each generator x_kn(s) with k below n, the Steinberg relations put the commutator of y with it inside the subgroup generated by the symbols x_in(r) with i below n.
4. That subgroup maps injectively into E(R), so the commutator is trivial and y commutes with every such generator.
5. By symmetry y commutes with every x_nk(s), hence with every x_kl(s) for k and l below n, since each such generator is a commutator of two of the previous ones. Let n grow to conclude that y is central.
6. Gap G-centre records the column-subgroup injectivity (Exercise III.5.2), stable E centre calculation (Exercise III.1.8), and word-normalization assertions. They are needed here and are not proved by a citation.

**Acceptance.**

- K_2(R) is abelian, which is what makes the four-term sequence a sequence of abelian groups at that spot.
- The centre of E(R) is trivial, which is the first half of the argument and is needed separately.
- The theorem is about the stable group: the centre of St_n(R) is a different question, treated in the finite-rank caveat.

**Prerequisites.**

- `K2SymbolsBrauer:T.1/k2-definition`
- `K2SymbolsBrauer:T.1/stabilisation`
- `mathlib:Subgroup.center`

**Sources.**

- `Kbook.2013`: III.5.2.1 (PDF p. 225). The theorem, with the proof of the source followed step by step.

### Central extensions and their equivalence

`K2SymbolsBrauer:T.1/central-extension` · definition · parent `K2SymbolsBrauer:T.1:classical` · implementation unchecked

A central extension of G by an abelian group A is a GroupExtension A G whose included kernel lies in the centre of the total group. It is split if it admits a section, equivalently if it is equivalent, with identity on A and G, to the product extension. Equivalence retains the kernel and quotient identifications.

**Hypotheses.**

- G is a group; A is an abelian group.

**Proof outline.**

1. Add the central-kernel predicate to GroupExtension; exactness identifies the image of its inclusion with the projection kernel.
2. Use the product construction and the displayed section formula to characterize splitness.
3. Use existing extension equivalences, with fixed kernel and quotient maps; no classification is asserted in this definition.

**Acceptance.**

- The split extension corresponds to the zero cohomology class.
- An extension built from a trivial-action factor set is central, which is the pinned statement.
- Equivalence is finer than isomorphism of groups: two inequivalent extensions can have isomorphic total groups.

**Prerequisites.**

- `mathlib:GroupExtension`
- `tauceti:TauCeti.FactorSet.inl_range_le_center`
- `mathlib:Subgroup.center`

**Planning API.**

| Name | Role | Contract |
| --- | --- | --- |
| `IsCentralExtension` | characterisation | The predicate that an extension is central. |
| `CentralExtension.split` | characterisation | Splitness. |
| `CentralExtension.Equiv` | structure | Equivalence of two extensions of G by A. |
| `CentralExtension.product` | constructor | The inclusion A -> A x G and projection A x G -> G form a split central extension. |
| `CentralExtension.section_equiv` | equivalence | A homomorphic section gives an extension equivalence to A x G, with formula (a,g) -> inl(a)*section(g). |

**Consumers.**

- T.1's universal central extension — the universal object is defined in this category
- T.1's Recognition Theorem — the characterisation by splitting of central extensions is stated here
- K3BlochGroups:V.1/steinberg-superperfect — superperfection of St(A) is the corollary of T.1:classical/uce-source-superperfect for this notion of central extension
- StableHomotopyKTheory:H.3/plus-pi2-universal-central-extension — π_2(BG⁺) is central in π_1 F(f), which is a central extension of P (K-book IV.1.7)

**Unit tests.**

- `product_extension` (test) — For A=C2 and G=C2, the product projection is central and split.
- `cyclic_nonsplit` (test) — The quotient C4 -> C2 modulo two is central but has no homomorphic section.
- `marked_kernel` (test) — For C9 -> C3 modulo three, kernel inclusions C3 -> C9 given by 1 -> 3 and 1 -> 6 give inequivalent extensions although both total groups are C9: a map over C3 has multiplier 1 mod 3, whereas preserving these marked kernels would require multiplier 2 mod 3.

**Sources.**

- `Kbook.2013`: III.5.3 (PDF p. 226). The definitions, as displayed.

### Universal central extensions

`K2SymbolsBrauer:T.1/universal-central-extension` · definition · parent `K2SymbolsBrauer:T.1:classical` · implementation unchecked

A universal central extension of G is a central extension from which there is a unique homomorphism over G to every other central extension of G. It is unique up to isomorphism over G when it exists.

**Hypotheses.**

- G is a group.

**Proof outline.**

1. Define the universal property in the category of central extensions of G.
2. Prove uniqueness up to isomorphism over G by the usual argument with the two composites.
3. Record that existence is not automatic; for perfect groups it is perfect-uce-exists, and a group that is not perfect has none (uce-perfect).

**Acceptance.**

- The universal object is unique up to isomorphism over G.
- A group with a nontrivial abelianisation has none, which is the next lemma.
- Existence is a theorem, not part of the definition.

**Prerequisites.**

- `K2SymbolsBrauer:T.1/central-extension`
- `K2SymbolsBrauer:T.1:classical/central-extension-hom`

**Planning API.**

| Name | Role | Contract |
| --- | --- | --- |
| `IsUniversalCentralExtension` | characterisation | The universal property. |
| `uce_unique` | characterisation | Uniqueness up to isomorphism over G. |
| `uce_hom` | constructor | The unique homomorphism to any central extension. |
| `uce_hom_unique` | characterisation | Its uniqueness. |
| `UCE.equiv_over` | equivalence | Two universal central extensions of G have a unique equivalence commuting with their projections. |

**Consumers.**

- T.1's identification of the Steinberg group — St(R) is the universal central extension of E(R)
- K3BlochGroups:V.1/steinberg-superperfect — the source of a universal central extension is superperfect (T.1:classical/uce-source-superperfect), applied to St(A) → E(A)
- T.1:plus — the comparison with H_2 runs through the universal property
- StableHomotopyKTheory:H.3/plus-pi2-universal-central-extension — π_1 of the homotopy fibre of the plus construction relative to a perfect normal subgroup P is the universal central extension of P (K-book IV.1.7)

**Unit tests.**

- `trivial_uce` (test) — The identity extension of the trivial group is universal: its unique map to any group is over the trivial quotient.
- `cyclic_obstruction` (test) — The identity C2 -> C2 is not universal; it has two different lifts to C2 x C2 -> C2, given by the zero and identity first coordinates.
- `split_target` (test) — For a universal extension X -> G and abelian A, its map to A x G -> G is (1,p(x)); perfectness forces every map X -> A to be trivial.

**Sources.**

- `Kbook.2013`: III.5.3.1 (PDF p. 227). The definition, as displayed.

### A universal central extension forces perfectness, and rigidity of maps out of a perfect extension

`K2SymbolsBrauer:T.1/uce-perfect` · lemma · parent `K2SymbolsBrauer:T.1:classical` · implementation unchecked

If p:X->G is a universal central extension, both X and G are perfect.

**Hypotheses.**

- G is a group; X and Y are central extensions of G.

**Proof outline.**

1. Compare the maps X -> G x X_ab with second coordinates zero and abelianization. They lie over G, so universality makes them equal; hence X_ab is trivial.
2. A surjective image of a perfect group is perfect, so G is perfect.

**Acceptance.**

- The two statements are what make the Recognition Theorem's proof work and are used separately.
- A perfect group can still have several central extensions; uniqueness is of the map, not of the extension.
- The first statement is the obstruction: a non-perfect group has no universal central extension at all.

**Prerequisites.**

- `K2SymbolsBrauer:T.1/universal-central-extension`
- `mathlib:Group.IsPerfect`

**Sources.**

- `Kbook.2013`: III.5.3.2 (PDF p. 227). Paraphrase of the indicated passage; checked in the author copy, not a quotation from the published edition.

### The Hopf formula and the two extensions attached to a presentation

`K2SymbolsBrauer:T.1/hopf-formula` · theorem · parent `K2SymbolsBrauer:T.1:classical` · implementation unchecked

For a presentation G = F/S with F free and S normal, H_2(G; Z) is isomorphic to (S ∩ [F, F])/[S, F], the kernel of the commutator extension [F, F]/[S, F] → [G, G]; its naturality in the presentation is hopf-formula-natural. The coefficients are the trivial integral representation, and G is a group in Type.

**Hypotheses.**

- G is a group presented as a quotient of a free group F by a normal subgroup S.

**Proof outline.**

1. Form the separate relation central extension F/[S, F] → G and its restricted commutator extension (relation-central-extension, commutator-central-extension).
2. Apply the four-term exact sequence 0 → H_2(G, Z) → S/[F, S] → F_ab → G_ab → 0 (hopf-four-term-sequence): exactness at S/[F, S] identifies H_2(G, Z) with the kernel of S/[F, S] → F/[F, F], which is (S ∩ [F, F])/[S, F].
3. For a perfect G the restricted extension is onto G and its kernel is this intersection quotient, which is how uce-kernel-h2 uses the formula.
4. The remaining input is gap G-Hopf, carried by hopf-four-term-sequence: the Hochschild-Serre low-degree sequence. The K-book states the formula without proof (citing Weibel's homological algebra book, 6.8.8, not obtained); the decomposition follows Löh, Theorem 3.2.18.

**Acceptance.**

- H_2 of a free group is zero, for any presentation.
- The larger relation-module kernel S/[S, F] need not vanish for a free quotient G. Example F = Free(a, b), G = Z, a ↦ 1 and b ↦ 0: the class of b survives, detected by the b-exponent sum.
- For perfect G the restricted commutator extension has quotient G, and its kernel is H_2(G; Z) (uce-kernel-h2).

**Prerequisites.**

- `K2SymbolsBrauer:T.1/central-extension`
- `mathlib:groupHomology.H2`
- `mathlib:groupHomology`
- `mathlib:Rep.trivial`
- `K2SymbolsBrauer:T.1:classical/relation-central-extension`
- `K2SymbolsBrauer:T.1:classical/commutator-central-extension`
- `K2SymbolsBrauer:T.1:classical/hopf-four-term-sequence`

**Sources.**

- `Kbook.2013`: III.5.3.4 and III.5.3.5 (PDF p. 227). Hopf's formula and the two extensions, as displayed.
- `Loeh.GroupCohomology.2019`: Theorem 3.2.18 (printed p. 129; PDF p. 137). The route from the four-term sequence to the formula, followed in the proof steps.

### The Recognition Theorem

`K2SymbolsBrauer:T.1/recognition-theorem` · theorem · parent `K2SymbolsBrauer:T.1:classical` · implementation unchecked

Let G be a perfect group and p : X → G a central extension (p surjective, ker p central), X in Type. The following are equivalent: (1) p is a universal central extension; (2) X is perfect and every central extension of X splits; (3) H_1(X; Z) = H_2(X; Z) = 0, that is, X is superperfect. Every perfect group has a universal central extension, the Hopf extension of any free presentation (perfect-uce-exists), and its kernel is H_2(G; Z) (uce-kernel-h2).

**Hypotheses.**

- G is a perfect group; p : X → G is surjective with ker p in the centre of X; X is a group in Type, as Mathlib's integral group homology requires.

**Proof outline.**

1. (1) ⇒ (2): X is perfect (uce-perfect) and every central extension of X splits (uce-extensions-split).
2. (2) ⇒ (3): H_1(X; Z) = 0 by h1-trivial-perfect and H_2(X; Z) = 0 by split-extensions-kill-h2.
3. (3) ⇒ (2): superperfect-extensions-split.
4. (2) ⇒ (1): split-central-extension-universal.
5. Assemble the four implications as one equivalence of three conditions; the existence and kernel statements are the separate nodes perfect-uce-exists and uce-kernel-h2, restated here for reference.
6. The composite (1) ⇒ (3) is also the named theorem uce-source-superperfect, which K3BlochGroups V.1 imports; StableHomotopyKTheory H.3 uses (3) ⇒ (1) for π_1 of the homotopy fibre of a plus construction (K-book IV.1.7).

**Acceptance.**

- For a free group the theorem is vacuous, since a free group is perfect only when trivial.
- Condition (3) is the one K3BlochGroups V.1 uses for the Steinberg group and StableHomotopyKTheory H.3 uses for π_1 of an acyclic homotopy fibre.
- Perfectness of a central-extension source alone does not imply universality; the recognition criterion also requires H_2 of that source to vanish.
- The hypotheses that p is surjective with central kernel are kept: universality is recognised on central extensions of a perfect group, not on arbitrary extensions.

**Prerequisites.**

- `K2SymbolsBrauer:T.1/uce-perfect`
- `K2SymbolsBrauer:T.1/universal-central-extension`
- `K2SymbolsBrauer:T.1:classical/uce-extensions-split`
- `K2SymbolsBrauer:T.1:classical/h1-trivial-perfect`
- `K2SymbolsBrauer:T.1:classical/split-extensions-kill-h2`
- `K2SymbolsBrauer:T.1:classical/superperfect-extensions-split`
- `K2SymbolsBrauer:T.1:classical/split-central-extension-universal`
- `K2SymbolsBrauer:T.1:classical/superperfect`
- `K2SymbolsBrauer:T.1:classical/perfect-uce-exists`
- `K2SymbolsBrauer:T.1:classical/uce-kernel-h2`
- `mathlib:groupHomology.H1`
- `mathlib:groupHomology.H2`

**Sources.**

- `Kbook.2013`: III.5.4, statement (PDF p. 227, printed p. 219). The existence statement and the extension (5.3.5).
- `Kbook.2013`: III.5.4, equivalent conditions and proof (PDF p. 228, printed p. 220). The three equivalent conditions.
- `Kbook.2013`: III.5.4, equivalent conditions and proof (PDF p. 228, printed p. 220). The source's own division of the implications, which the proof steps refine into separate nodes.

### The Steinberg group is the universal central extension of the elementary group

`K2SymbolsBrauer:T.1/steinberg-is-uce` · theorem · parent `K2SymbolsBrauer:T.1:classical` · implementation unchecked

For every ring R the stable Steinberg group St(R) is the universal central extension of E(R). Consequently K_2(R) is isomorphic to the second integral homology of E(R).

**Hypotheses.**

- R is an associative unital ring.

**Proof outline.**

1. Observe that E(R) is perfect, so the Recognition Theorem applies.
2. Prove that St(R) is a central extension of E(R), which is Steinberg's centre theorem.
3. Pull a central extension of St(R) back to St_n(R) for each n >= 5. Finite splitting gives a section; perfectness and rigidity make the sections compatible. The group-colimit universal property glues them to a section.
4. Apply split-central-extension-universal (Recognition (2) ⇒ (1)) using stable centrality, Steinberg perfectness and the glued splitting; the separate T.1:plus node makes the H2 comparison.

**Acceptance.**

- The identification of K_2 with the second homology is the statement T.1:plus starts from.
- For the ring of integers both sides are cyclic of order two.
- No finite-rank UCE conclusion is drawn without a separate centrality hypothesis.

**Prerequisites.**

- `K2SymbolsBrauer:T.1/recognition-theorem`
- `K2SymbolsBrauer:T.1/k2-is-centre`
- `K2SymbolsBrauer:T.1/finite-rank-splitting`
- `K2SymbolsBrauer:T.1:classical/steinberg-perfect`
- `KTheoryLowDegrees:U.1`
- `K2SymbolsBrauer:T.1:classical/perfect-extension-rigidity`
- `K2SymbolsBrauer:T.1:classical/stable-steinberg-perfect`
- `K2SymbolsBrauer:T.1:classical/split-central-extension-universal`

**Sources.**

- `Kbook.2013`: III.5.5 (PDF p. 228). The theorem, as displayed.

### Every central extension of the finite-rank Steinberg group splits, for n at least five

`K2SymbolsBrauer:T.1/finite-rank-splitting` · theorem · parent `K2SymbolsBrauer:T.1:classical` · implementation unchecked

For n at least five every central extension of St_n(R) splits; consequently St_n(R) is the universal central extension of E_n(R).

**Hypotheses.**

- R is an associative unital ring; n is at least five.

**Proof outline.**

1. Show first that two elements of the extension lying over generators with disjoint index conditions commute, by introducing an auxiliary index distinct from the four given ones and writing one of the two as a commutator; this is where n at least five is used.
2. Choose distinct indices and elements over three generators, and show that the commutator subgroup of the subgroup they generate is abelian.
3. Use the Hall-Witt style identity to show that the element defined as a commutator of two lifts does not depend on the intermediate index nor on the chosen lifts.
4. Prove that these elements satisfy the Steinberg relations, so that they define a homomorphism from St_n(R) to the extension splitting it.
5. Gap G-lifted-relations: expand the Hall-Witt use, independence of the auxiliary index, and additivity of lifted generators; the source leaves the last calculation to the reader. Finite-rank centrality is not deduced from splitting.

**Acceptance.**

- The bound n at least five is used in the first step and is recorded, not smoothed over.
- The splitting is by an explicit homomorphism, which is what makes the argument constructive.
- The statement does not say that the kernel of the finite-rank map is central, which is the separate caveat below.

**Prerequisites.**

- `K2SymbolsBrauer:T.1/steinberg-group-finite-rank`

**Sources.**

- `Kbook.2013`: III.5.5.1 (PDF p. 228). The proposition, with the proof of the source followed step by step.

### Conditional centrality in finite rank

`K2SymbolsBrauer:T.1/finite-rank-caveat` · lemma · parent `K2SymbolsBrauer:T.1:classical` · implementation unchecked

If the map ker(St_n(R)->E_n(R)) -> ker(St(R)->E(R)) induced by stabilization is injective, then ker(St_n(R)->E_n(R)) is central in St_n(R). This hypothesis is not asserted for arbitrary n,R.

**Hypotheses.**

- R is an associative unital ring; n is at least three.
- The stabilization map restricted to the finite-rank kernel is injective.

**Proof outline.**

1. For z in the finite kernel and x in St_n, [z,x] is again in the finite kernel.
2. Its stable image is trivial, since the stable image of z is central by Steinberg's theorem.
3. Injectivity on the kernel makes [z,x]=1, proving centrality.

**Acceptance.**

- The proof uses injectivity on the kernel, not injectivity of the entire stabilization map.
- Without the injectivity hypothesis the stable-centre theorem alone has no finite-rank conclusion.
- Together with n>=5 splitting and perfectness, this centrality hypothesis permits a finite-rank UCE conclusion.

**Prerequisites.**

- `K2SymbolsBrauer:T.1/k2-is-centre`
- `K2SymbolsBrauer:T.1:classical/to-elementary`

**Sources.**

- `Kbook.2013`: III.5.2.1 and III.5.5.2 (PDF pp. 226, 229). Paraphrase of the indicated passage; checked in the author copy, not a quotation from the published edition.

### K_2 is the second homology of the elementary group

`K2SymbolsBrauer:T.1/k2-h2-elementary` · theorem · parent `K2SymbolsBrauer:T.1:plus` · implementation unchecked

For every ring R there is an isomorphism from K_2(R) to the second integral homology of E(R), natural in R. It is the identification of the kernel of the universal central extension with the kernel given by the Hopf formula.

**Hypotheses.**

- R is an associative unital ring.

**Proof outline.**

1. Import that St(R) is the universal central extension of E(R) (steinberg-is-uce); E(R) is perfect.
2. uce-kernel-h2 applied to St(R) → E(R), with kernel K_2(R) (k2-definition), gives K_2(R) ≅ H_2(E(R), Z); the isomorphism is of kernels, compatible with the projections to E(R).
3. Naturality in the ring: for φ : R → S the functoriality map St(R) → St(S) is the lift of E(φ) (uce-lift, by uniqueness), and uce-kernel-h2-natural identifies its kernel map with H_2(E(φ); Z).
4. Gap G-natural-Hopf enters through hopf-formula-natural.

**Acceptance.**

- For the ring of integers both sides are cyclic of order two.
- The isomorphism is natural, which is what the comparison with homotopy needs.
- The identification is of kernels, not merely an abstract isomorphism of abelian groups; the acceptance test is the compatibility with the two projections.

**Prerequisites.**

- `K2SymbolsBrauer:T.1/steinberg-is-uce`
- `K2SymbolsBrauer:T.1/hopf-formula`
- `K2SymbolsBrauer:T.1/k2-definition`
- `K2SymbolsBrauer:T.1:classical/uce-kernel-h2`
- `K2SymbolsBrauer:T.1:classical/uce-lift`
- `K2SymbolsBrauer:T.1:classical/uce-kernel-h2-natural`
- `mathlib:groupHomology.H2`

**Sources.**

- `Kbook.2013`: III.5.5 (PDF p. 228). The identification, as displayed.

### K_2 is the second homotopy group of the K-theory space

`K2SymbolsBrauer:T.1/k2-pi2` · theorem · parent `K2SymbolsBrauer:T.1:plus` · implementation unchecked

For every ring R there is an isomorphism from K_2(R) to the second homotopy group of the plus construction on the classifying space of the stable general linear group, natural in R. It is obtained by combining the identification with the second homology of E(R) with the Hurewicz theorem applied to the simply connected space obtained from the plus construction.

**Hypotheses.**

- R is an associative unital ring.

**Proof outline.**

1. Import the plus construction and the K-theory space, and the fact that the plus construction on the classifying space of the stable elementary group is the universal cover of the plus construction on the classifying space of the stable general linear group.
2. That space is simply connected, and its second homotopy group is its second homology by the Hurewicz theorem.
3. Its second homology is the second homology of E(R), by the homology isomorphism the plus construction provides.
4. Compose with the identification of the previous node and prove naturality.
5. Record the division of labour: the plus construction belongs to StableHomotopyKTheory, the K-theory space to GeneralAlgebraicKTheory, and this layer supplies the explicit model they are compared with.
6. Gap G-cover-Hurewicz: H.3 promises relative plus and acyclicity, but not an implemented covering comparison or a chosen Hurewicz map. These supplier interfaces and naturality must be constructed explicitly.

**Acceptance.**

- The composite isomorphism is natural in the ring.
- For a finite field both sides are trivial.
- The Hurewicz step needs simple connectivity, which is why the elementary group, and not the general linear group, appears.

**Prerequisites.**

- `K2SymbolsBrauer:T.1/k2-h2-elementary`
- `StableHomotopyKTheory:H.3`
- `GeneralAlgebraicKTheory:K.2:plus`
- `mathlib:HomotopyGroup`
- `KTheoryLowDegrees:U.1`

**Sources.**

- `Kbook.2013`: IV.1.7.1 and Exercise IV.1.8 (PDF pp. 273, 282). Paraphrase of the indicated passage; checked in the author copy, not a quotation from the published edition.

### The star product of commuting matrices

`K2SymbolsBrauer:T.2/star-product` · construction · parent `K2SymbolsBrauer:T.2:symbols` · implementation unchecked

If two matrices of E(R) commute, lift them to St(R) and define their star product to be the commutator of the lifts, an element of K_2(R). The definition does not depend on the lifts, because two lifts differ by central elements. The star product is invariant under simultaneous conjugation by an element of GL(R), is skew-symmetric, and is bilinear.

**Hypotheses.**

- R is an associative unital ring; the two matrices lie in E(R) and commute.

**Proof outline.**

1. Choose lifts and form their commutator; the image in E(R) is trivial, so it lies in K_2(R).
2. Prove independence of the lifts: two lifts differ by central elements, which drop out of a commutator.
3. Prove conjugation invariance by lifting the block diagonal matrix built from the conjugating element and its inverse, and using that the commutator is central. The block-diagonal elementary factorization is imported from U.1; its compatible generator-level factorization is gap G-Whitehead.
4. Prove skew-symmetry and bilinearity from the commutator identities.
5. Record that the construction needs the two matrices to commute; without that hypothesis the commutator does not land in K_2(R).

**Acceptance.**

- The star product of a matrix with itself is trivial.
- It is invariant under simultaneous conjugation.
- Bilinearity holds in each variable separately, for commuting arguments.

**Prerequisites.**

- `K2SymbolsBrauer:T.1/k2-definition`
- `K2SymbolsBrauer:T.1/k2-is-centre`
- `mathlib:commutatorElement`
- `KTheoryLowDegrees:U.1`

**Planning API.**

| Name | Role | Contract |
| --- | --- | --- |
| `starProduct` | constructor | The star product of two commuting elements of E(R). |
| `starProduct_lift_indep` | characterisation | It does not depend on the chosen lifts. |
| `starProduct_conj` | relation | Invariance under simultaneous conjugation by an element of GL(R). |
| `starProduct_skew` | relation | Skew-symmetry. |
| `starProduct_mul_left` | relation | For A1,A2,B in E(R), if each Ai commutes with B then (A1*A2) star B=(A1 star B)*(A2 star B). No mutual commutation of A1 and A2 is required. |
| `starProduct_mul_right` | relation | For A commuting with B1 and B2 in E(R), A star (B1*B2)=(A star B1)*(A star B2). |

**Consumers.**

- T.2's Steinberg symbol — the symbol is the star product of two specific diagonal matrices
- T.2's Steinberg identity — the identity is proved by a computation with lifts of these matrices

**Unit tests.**

- `self` (test) — For A in E(R), A star A=1 using the same lift twice.
- `forward_vs_star` (test) — Over Z in rank three, e_01(1) and e_12(1) do not commute; their lifted commutator maps to e_02(1), so it cannot be a K2-valued star input.
- `nontrivial_diagonal` (test) — Over Z, diag(-1,-1,1) star diag(-1,1,-1) is {-1,-1}, the nontrivial K2(Z) class once T.5 supplies that computation.
- `multiply_commuting_inputs` (test) — For A1,A2 each commuting with B, the product rule holds; omit either commutation proof and the construction is ill-typed.

**Sources.**

- `Kbook.2013`: III.5 Steinberg symbols (PDF p. 233). The construction and its independence of lifts, as displayed.

### The Steinberg symbol

`K2SymbolsBrauer:T.2/steinberg-symbol` · definition · parent `K2SymbolsBrauer:T.2:symbols` · implementation unchecked

For commuting units r and s of a ring R define the Steinberg symbol as the star product of the diagonal matrix with r and r inverse at two coordinates with the diagonal matrix with s and s inverse at two coordinates chosen to overlap in exactly one index. Equivalently it is the commutator of the elements h_ij(r) and h_ik(s) of St(R), where w_ij(r) is the word x_ij(r) x_ji(minus r inverse) x_ij(r) and h_ij(r) is w_ij(r) w_ij(minus one). The symbol is skew-symmetric and bilinear.

**Hypotheses.**

- R is an associative unital ring; r and s are commuting units.

**Proof outline.**

1. Use the separately defined indexed w and h words and their elementary images.
2. For commutative rings, the pinned diagonal decompositions check the image calculation. For associative rings, multiply the explicit 2x2 word using r*r^-1=r^-1*r=1; gap G-matrix covers its matrix-unit interface.
3. Define the symbol as the star product of the two diagonal matrices, or equivalently as the commutator of h_ij(r) and h_ik(s), and prove the two agree.
4. Prove that the symbol does not depend on the choice of the three indices.
5. Deduce skew-symmetry and bilinearity from the corresponding properties of the star product.

**Acceptance.**

- The symbol of one with anything is trivial.
- Skew-symmetry and bilinearity hold.
- The symbol is defined for commuting units of any ring, not only for a field; the field case is where Matsumoto's theorem applies.

**Prerequisites.**

- `K2SymbolsBrauer:T.2/star-product`
- `K2SymbolsBrauer:T.1/steinberg-group-finite-rank`
- `K2SymbolsBrauer:T.1/stabilisation`
- `mathlib:Matrix.diag2_decompose`
- `tauceti:Matrix.SpecialLinearGroup.diag2nUnit_decompose`
- `mathlib:Units`
- `K2SymbolsBrauer:T.2:symbols/diagonal-lift-words`
- `K2SymbolsBrauer:T.2:symbols/diagonal-lift`

**Planning API.**

| Name | Role | Contract |
| --- | --- | --- |
| `steinbergSymbol` | constructor | The symbol of two commuting units. |
| `steinbergSymbol_eq_commutator` | characterisation | It is the commutator of h_ij(r) and h_ik(s). |
| `steinbergSymbol_one` | simp | The symbol with a one entry is trivial. |
| `steinbergSymbol_mul_left` | relation | Bilinearity for a pairwise commuting triple r1,r2,s of units. Over a commutative ring the commuting hypotheses are automatic. |
| `steinbergSymbol_skew` | relation | Skew-symmetry. |
| `steinbergSymbol_index_indep` | characterisation | Independence of the chosen indices. |
| `steinbergSymbol_map` | functoriality | Unital ring homomorphisms preserve the commuting-unit symbol and its indexed commutator formula. |

**Consumers.**

- T.2's Matsumoto theorem — the theorem presents K_2 of a field by these symbols
- Milnor K-theory — the degree-two Milnor symbols are identified with these
- K3BlochGroups V.5 — the decomposable class in K_3 of the rationals is built from the symbol with three minus-one entries

**Unit tests.**

- `one_entry` (test) — The symbol with a one entry is trivial.
- `minus_one_integers` (test) — For the integers the symbol of minus one with itself is the nontrivial element of K_2(Z).
- `bilinear` (test) — The product rule holds for pairwise commuting units r1,r2,s; in a commutative field it has no extra condition.
- `not_alternating_integrally` (test) — The symbol of a with itself is not trivial in general, which the next node computes.

**Sources.**

- `Kbook.2013`: III.5.10 and III.5.10.1 (PDF p. 233). The definition and the two descriptions, as displayed.

### The Steinberg identity

`K2SymbolsBrauer:T.2/steinberg-identity` · theorem · parent `K2SymbolsBrauer:T.2:symbols` · implementation unchecked

If r and 1-r are units of an associative unital ring, the Steinberg symbol {r,1-r} is 1.

**Hypotheses.**

- R is an associative unital ring; r is a unit, and for the first statement one minus r is also a unit.

**Proof outline.**

1. Prove the first statement by the explicit computation in the Steinberg group that the source performs: rewrite the product of the three w-elements using the commutation rules, and use the four identities among r and one minus r that the source lists, to obtain the w-element of the product.
2. Multiply by the w-element at minus one to obtain the multiplicativity of the h-elements when the two arguments sum to one, and deduce that the symbol vanishes.

**Acceptance.**

- Both r and 1-r must be units.
- The two entries commute because (1-r)r=r(1-r).
- No symbol with a zero entry is constructed.

**Prerequisites.**

- `K2SymbolsBrauer:T.2/steinberg-symbol`
- `K2SymbolsBrauer:T.1/steinberg-group-finite-rank`

**Sources.**

- `Kbook.2013`: III.5.10.2, III.5.10.3 and III.5.10.4 (PDF pp. 233-234). The lemma and the remark, as displayed, with the computation of the cited proof.

### Skew-symmetry, and the correct value of the symbol of a unit with itself

`K2SymbolsBrauer:T.2/symbol-consequences` · lemma · parent `K2SymbolsBrauer:T.2:symbols` · implementation unchecked

The Steinberg symbols are skew-symmetric: the symbol of a with b times the symbol of b with a is trivial. The symbol of a with itself is the symbol of a with minus one, which is an element of order dividing two; it is not trivial in general. Asserting that the symbol of a with itself vanishes integrally is an error.

**Hypotheses.**

- R is an associative unital ring; a and b are commuting units.

**Proof outline.**

1. Skew-symmetry is inherited directly from the star product, avoiding a new circular dependence on negative-unit identities.
2. From the vanishing of the symbol of a with minus a and bilinearity obtain that the symbol of a with itself is the inverse of the symbol of a with minus one.
3. Prove that the symbol of a with minus one squares to the symbol of a with one, which is trivial, so it has order dividing two; hence the symbol of a with itself equals the symbol of a with minus one.
4. Record the negative statement: skew-symmetry gives that the square of the symbol of a with itself is trivial, and nothing more.

**Acceptance.**

- For the integers the symbol of minus one with itself is the nontrivial element of K_2(Z), so the symbol of a unit with itself is not always trivial.
- For a finite field of even order the symbol of a with itself is trivial, because minus one is one there.
- Skew-symmetry holds in general and is what the alternating property of Milnor K-theory rests on.

**Prerequisites.**

- `K2SymbolsBrauer:T.2/steinberg-identity`
- `K2SymbolsBrauer:T.2/steinberg-symbol`
- `K2SymbolsBrauer:T.2:symbols/symbol-negative-unit`

**Sources.**

- `Kbook.2013`: III.6.1 (PDF p. 239). The derivation of skew-symmetry, as displayed; the value of the symbol of a unit with itself follows from the same identity.

### Steinberg symbols generate K_2 of a semilocal ring

`K2SymbolsBrauer:T.2/symbols-generate` · theorem · parent `K2SymbolsBrauer:T.2:symbols` · implementation unchecked

Steinberg symbols generate K2(R) for fields and division rings as in Milnor's cited theorem, and for COMMUTATIVE local or semilocal rings as in the Dennis-Stein extension. The latter commutativity is explicit in the prose preceding III.5.10.5.

**Hypotheses.**

- R is a field or division ring; alternatively R is a commutative local or semilocal ring.

**Proof outline.**

1. The author copy cites Milnor for fields/division rings and Dennis-Stein for commutative semilocal rings. These proofs were not obtained; this is the unresolved generation gap, not a proof step discharged by the citation.
2. Record the hypothesis: for a general ring the symbols need not generate, which is why the Dennis-Stein symbols are introduced.
3. Record the consequence used below: for a field the presentation of Matsumoto's theorem is a presentation of the whole group, not of a subgroup.

**Acceptance.**

- For a field the symbols generate, which Matsumoto's theorem then presents.
- For a general commutative ring generation is not asserted.
- The Dennis-Stein symbols are introduced precisely because of that gap.

**Prerequisites.**

- `K2SymbolsBrauer:T.2/steinberg-symbol`
- `K2SymbolsBrauer:T.1/k2-definition`

**Sources.**

- `Kbook.2013`: III.5.10.5 (PDF p. 234). The theorem and its hypotheses, as displayed.

### Matsumoto's theorem

`K2SymbolsBrauer:T.2/matsumoto` · theorem · parent `K2SymbolsBrauer:T.2:symbols` · implementation unchecked

For a field F the group K_2(F) is the abelian group generated by the Steinberg symbols of pairs of nonzero elements, subject only to bilinearity in each entry and the Steinberg identity that the symbol of x with one minus x is trivial for x different from zero and one. Equivalently, K_2(F) is the quotient of the tensor square of the multiplicative group by the subgroup generated by the elements x tensor one minus x.

**Hypotheses.**

- F is a field.

**Proof outline.**

1. State the presentation and prove that the displayed relations hold, which is the content of the symbol nodes above.
2. Gap G-Matsumoto: obtain and decompose the converse/presentation argument from an accessible original source. Milnor section 12 was not read; respecting relations and symbol generation provide only a surjection.
3. Record the reformulation as a quotient of the tensor square, which is the form Milnor K-theory generalises.
4. Deduce skew-symmetry inside the presentation, by the computation already recorded.

**Acceptance.**

- The presentation gives K_2 of a finite field trivial, which is the next node and a genuine test of the presentation.
- The reformulation as a quotient of the tensor square is the degree-two case of Milnor K-theory.
- The theorem is a presentation, not merely a surjection: the normal-form argument is what distinguishes the two, and a proof that only checks the relations is incomplete.

**Prerequisites.**

- `K2SymbolsBrauer:T.2/steinberg-symbol`
- `K2SymbolsBrauer:T.2/steinberg-identity`
- `K2SymbolsBrauer:T.2/symbols-generate`
- `K2SymbolsBrauer:T.2/symbol-consequences`

**Sources.**

- `Kbook.2013`: III.6.1 (PDF p. 239). The theorem and its reformulation, as displayed.

### K_2 of a finite field is trivial

`K2SymbolsBrauer:T.2/k2-finite-field` · theorem · parent `K2SymbolsBrauer:T.2:symbols` · implementation unchecked

For every finite field the group K_2 is trivial.

**Hypotheses.**

- F is a finite field with q elements.

**Proof outline.**

1. Reduce by Matsumoto's theorem to showing that the generator of the tensor square of the cyclic unit group dies, that is, that the symbol of a generator with itself is trivial.
2. In even characteristic use that minus one is one, so the symbol of a generator with itself is the symbol of the generator with its negative, which is trivial.
3. In odd characteristic use skew-symmetry to see that the symbol of the generator with itself squares to the trivial element, so it equals the symbol of any odd power of the generator with any other odd power.
4. Conclude by finding a non-square u for which one minus u is also a non-square: the map sending u to one minus u is an involution of the set of elements different from zero and one, which has (q minus one) halves non-squares and only (q minus three) halves squares, so such a u exists.
5. Apply the Steinberg identity at that u.
6. Gap G-finite-units: choose and verify the pinned cyclic-unit-group theorem and implement the finite counting argument; ZMod alone supplies neither.

**Acceptance.**

- The counting step is what makes the argument work and is recorded, not asserted.
- The two characteristics are treated separately.
- The conclusion feeds the Milnor K-theory examples: all higher Milnor K-groups of a finite field vanish.

**Prerequisites.**

- `K2SymbolsBrauer:T.2/matsumoto`
- `K2SymbolsBrauer:T.2/symbol-consequences`
- `mathlib:ZMod`

**Sources.**

- `Kbook.2013`: III.6.1.1 (PDF p. 239). The corollary, with the counting proof of the source.

### K_2 of a field is a direct summand of K_2 of a rational function field, and the torsion kernel

`K2SymbolsBrauer:T.2/rational-function-field` · lemma · parent `K2SymbolsBrauer:T.2:symbols` · implementation unchecked

For a field F, K2(F) -> K2(F(t)) is a split injection. The retraction sends {f,g} to {lc(f),lc(g)}, where lc(p/q)=lc(p)/lc(q).

**Hypotheses.**

- F is a field.

**Proof outline.**

1. Leading coefficients multiply and restrict to the identity on constants.
2. For a rational f, if deg(f)>0 then lc(1-f)=-lc(f), so the negative-unit relation kills the symbol.
3. If deg(f)<0, lc(1-f)=1. If deg(f)=0 and lc(f)!=1, lc(1-f)=1-lc(f) and use Steinberg. If deg(f)=0 and lc(f)=1, the first symbol entry is 1 even when cancellation changes the degree of 1-f.
4. The relations therefore descend through Matsumoto and give a retraction.

**Acceptance.**

- The map is a left inverse on constant symbols.
- The equal-degree cancellation case lc(f)=1 is handled separately.
- The conclusion is split injectivity for the specified rational function extension.

**Prerequisites.**

- `K2SymbolsBrauer:T.2/matsumoto`
- `K2SymbolsBrauer:T.2:symbols/symbol-negative-unit`

**Sources.**

- `Kbook.2013`: III.6.1.2 (PDF p. 239). Paraphrase of the indicated passage; checked in the author copy, not a quotation from the published edition.

### Milnor K-theory of a field

`K2SymbolsBrauer:T.2/milnor-k-theory` · definition · parent `K2SymbolsBrauer:T.2:symbols` · implementation unchecked

For a field F form the tensor algebra of the multiplicative group written additively, with the degree-one element attached to a nonzero x written l(x). Define the graded ring K^M of F as the quotient of that tensor algebra by the two-sided ideal generated by the homogeneous elements l(x) tensor l(one minus x) with x different from zero and one. The Milnor K-group in degree n is the degree-n part, presented by symbols that are multiplicative in each entry and vanish when two consecutive entries sum to one. Degree zero is the integers and degree one is the multiplicative group written additively.

**Hypotheses.**

- F is a field.
- All tensor products are over the integers.

**Proof outline.**

1. Form the tensor algebra of the unit group, using the additive type tag and the pinned tensor algebra.
2. Form the two-sided ideal generated by the displayed homogeneous elements and take the quotient as a graded ring, using the pinned quotient construction.
3. Prove that the quotient is graded, so that the degree-n parts are defined.
4. Prove the two low-degree identifications, degree zero and degree one.
5. Prove the presentation statement: the degree-n group is generated by the symbols subject to multiplicativity in each entry and the vanishing relation.
6. Prove functoriality in the field.
7. Gap G-graded-quotient: implement the homogeneous ideal and degree decomposition, quotient universal property and field-map action on the pinned tensor algebra. RingQuot alone carries no grading.

**Acceptance.**

- Degree zero is the integers and degree one is the unit group written additively.
- Degree two has the bilinear Steinberg presentation; comparison with classical K2 is supplied by the separate Matsumoto node and remains conditional on its gap.
- The ideal is generated by homogeneous elements of degree two, so the quotient is graded; a non-homogeneous generator would destroy the grading.

**Prerequisites.**

- `mathlib:TensorAlgebra`
- `mathlib:Additive`
- `mathlib:RingQuot`
- `mathlib:Units`

**Planning API.**

| Name | Role | Contract |
| --- | --- | --- |
| `milnorK` | data | The graded ring, and its degree-n part. |
| `milnorK.symbol` | constructor | The symbol of an n-tuple of nonzero elements. |
| `milnorK.symbol_mul` | relation | Multiplicativity in each entry. |
| `milnorK.symbol_steinberg` | relation | Vanishing when two consecutive entries sum to one. |
| `milnorK.zero` | compatibility | Degree zero is the integers. |
| `milnorK.one` | compatibility | Degree one is the unit group written additively. |
| `milnorK.map` | functoriality | Functoriality in the field. |
| `milnorK.hom_ext` | extensionality | Graded ring maps agreeing on degree-one units are equal, since products of these generate. |
| `milnorK.lift` | universal-property | A homomorphism F× -> degree-one elements of a graded target that kills every Steinberg product extends uniquely to a graded ring map. |
| `milnorK.map_id_comp` | simp | Field maps induce graded maps respecting identity and composition on every symbol. |
| `milnorK.symbol_product` | structure | Concatenating two tuples gives the product of their symbols with degree addition. |

**Consumers.**

- T.2's Matsumoto comparison — the degree-two group is identified with K_2
- HigherLocalFieldsAndHigherClassFieldTheory HL.1 — that layer assembles these groups along a residue tower and imports rather than rebuilds them
- K3BlochGroups V.2 — the degree-three group is the source of the map whose cokernel is the indecomposable K_3

**Unit tests.**

- `degree_zero_one` (test) — Degree zero is the integers and degree one is the unit group.
- `finite_field` (test) — For a finite field every degree at least two vanishes.
- `graded` (test) — The quotient is graded, because the ideal is generated in a single degree.
- `not_alternating_by_fiat` (test) — The alternating property is a theorem, proved from skew-symmetry in degree two, not an axiom.

**Sources.**

- `Kbook.2013`: III.7.1 (PDF p. 253). The definition, as displayed.

### Skew-symmetry of Milnor symbols

`K2SymbolsBrauer:T.2/milnor-alternating` · lemma · parent `K2SymbolsBrauer:T.2:symbols` · implementation unchecked

Permuting Milnor-symbol entries multiplies by the permutation sign. Repeated-entry symbols are killed by 2 but can be nonzero integrally; in characteristic two a repeated adjacent pair vanishes because {a,a}={a,-1} and -1=1.

**Hypotheses.**

- F is a field; the entries are nonzero.

**Proof outline.**

1. Use that in degree two the sum of the symbol and its transpose vanishes, which is skew-symmetry proved above.
2. Deduce that interchanging two adjacent entries of an n-tuple changes the sign, since the degree-two relation can be applied in place inside the product.
3. Extend to an arbitrary transposition and then to an arbitrary permutation by decomposing it into transpositions.
4. Record what this does not say: the symbol with a repeated entry need not vanish integrally, and equals the symbol with that entry replaced by minus one in the appropriate position.

**Acceptance.**

- A transposition changes the sign.
- A symbol with a repeated entry is two-torsion but not necessarily zero, which is the same caveat as in degree two.
- A square root of -1 is NOT sufficient for integral vanishing. In F=C(t), {t,t}={t,-1} has tame residue -1 at t=0 and is nonzero, although i belongs to F. In characteristic two it vanishes; modulo 2 it vanishes if -1 is a square.

**Prerequisites.**

- `K2SymbolsBrauer:T.2/milnor-k-theory`
- `K2SymbolsBrauer:T.2/symbol-consequences`

**Sources.**

- `Kbook.2013`: III.7.1 (PDF p. 253). The derivation, as displayed.
- `Kbook.2013`: III.6.3 (PDF p. 242). Paraphrase of the indicated passage; checked in the author copy, not a quotation from the published edition.

### Milnor K-theory of finite fields

`K2SymbolsBrauer:T.2/milnor-examples` · lemma · parent `K2SymbolsBrauer:T.2:symbols` · implementation unchecked

For a finite field Fq and n >= 2, K_n^M(Fq)=0.

**Hypotheses.**

- Fq is a finite field.
- n >= 2.

**Proof outline.**

1. K2^M(Fq)=0 by Matsumoto and the finite-field K2 calculation.
2. Every degree-n symbol is a product of its first two entries with the remaining degree-one symbols, so it is zero for n>=2.

**Acceptance.**

- K0^M(Fq)=Z is not covered.
- K1^M(Fq)=Fq× is not asserted zero.
- Degrees at least two vanish by generation from degree two.

**Prerequisites.**

- `K2SymbolsBrauer:T.2/milnor-k-theory`
- `K2SymbolsBrauer:T.2/k2-finite-field`

**Sources.**

- `Kbook.2013`: III.7.2(a) (PDF p. 253). Paraphrase of the indicated passage; checked in the author copy, not a quotation from the published edition.

### The graded map from Milnor to Quillen K-theory

`K2SymbolsBrauer:T.2/graded-map` · construction · parent `K2SymbolsBrauer:T.2:graded-map` · implementation unchecked

Construct the natural graded ring map from Milnor K-theory of a field to Quillen K-theory, determined by the products of degree-one classes. Its degree-two component is Matsumoto's isomorphism. No isomorphism is asserted in degree three or above.

**Hypotheses.**

- F is a field.

**Proof outline.**

1. Import the products on Quillen K-theory from GeneralAlgebraicKTheory.
2. Define the map on the tensor algebra by sending the degree-one element attached to a nonzero x to the class of x in K_1(F) and extending multiplicatively.
3. Prove that it kills the Steinberg elements, using the degree-two Steinberg identity in Quillen K-theory, so that it descends to Milnor K-theory.
4. Prove that the result is a map of graded rings and is natural in the field.
5. Record what is and is not asserted: degree two is an isomorphism, by Matsumoto; degree three is a map whose cokernel defines the indecomposable K_3 in K3BlochGroups V.2; no general isomorphism is claimed.
6. Gap G-product-symbol: request the actual product-symbol compatibility from IV.1.10, not only abstract K-theory products. It is needed to identify the degree-two component with the chosen classical Matsumoto map.

**Acceptance.**

- Degree one is the identity on the unit group.
- Degree two is an isomorphism.
- Degree three is injective for every field (VI.4.3.2, owned by V.2) and need not be surjective. For Q, the source is Z/2 and the target is Z/48; having real places does not imply positive Quillen K3 rank.

**Prerequisites.**

- `K2SymbolsBrauer:T.2/milnor-k-theory`
- `K2SymbolsBrauer:T.2/matsumoto`
- `GeneralAlgebraicKTheory:K.7/products-from-biexact-functors`
- `GeneralAlgebraicKTheory:K.2:plus`
- `KTheoryLowDegrees:U.3`

**Planning API.**

| Name | Role | Contract |
| --- | --- | --- |
| `milnorToQuillen` | constructor | The graded ring map. |
| `milnorToQuillen_one` | simp | Degree one is the identity on the unit group. |
| `milnorToQuillen_two` | characterisation | Under product-symbol compatibility and Matsumoto, the component K2^M(F)->Quillen K2(F) is an isomorphism. |
| `milnorToQuillen_map` | functoriality | Naturality in the field. |
| `milnorToQuillen_graded` | structure | It is a map of graded rings. |
| `milnorToQuillen_symbol` | compatibility | Each n-symbol maps to the ordered product of its n unit classes in Quillen K_n(F). |
| `milnorToQuillen_unique` | extensionality | A graded map with the same degree-one unit classes is equal by the Milnor universal property. |

**Consumers.**

- K3BlochGroups V.2 — the degree-three component is the map whose cokernel is the indecomposable K_3
- MotivicEtaleKTheory M.5 — the norm-residue theorem is about the mod-m reduction of the source of this map
- HigherLocalFieldsAndHigherClassFieldTheory HL.1 — that layer imports the graded source and the map

**Unit tests.**

- `degree_zero` (test) — The degree-zero map Z->Quillen K0(F) sends 1 to the class of the one-dimensional vector space.
- `degree_one` (test) — For F=Q, the unit 2 maps to its K1 unit class, corresponding to 2 under determinant.
- `degree_two_symbol` (test) — {a,1-a} maps to zero, and {-1,-1} maps to the classical symbol under the K2 comparison.
- `degree_three_Q` (test) — For F=Q the integral component is injective Z/2->Z/48 and is not onto; this computation is an external VI.5.2.1 test, not a new owned theorem.

**Sources.**

- `Kbook.2013`: IV.1.10.1 (PDF p. 274), III.7.1 (PDF p. 253). Paraphrase of the indicated passage; checked in the author copy, not a quotation from the published edition.
- `Kbook.2013`: VI.4.3.2 and VI.5.2.1 (PDF pp. 490, 496). Paraphrase of the indicated passage; checked in the author copy, not a quotation from the published edition.

### The degree-three component, and what consumes it

`K2SymbolsBrauer:T.2/graded-map-degree-three` · comparison · parent `K2SymbolsBrauer:T.2:graded-map` · implementation unchecked

The degree-three component K3^M(F)->Quillen K3(F) sends {a,b,c} to the ordered product of their unit classes. It is exported to the K3BlochGroups:V.2 consumer, which owns its injectivity theorem and the indecomposable cokernel; the consumer is not an incoming prerequisite for constructing this component.

**Hypotheses.**

- F is a field.

**Proof outline.**

1. Take degree three of the supplied graded comparison.
2. Evaluate on a triple using the generator formula.
3. Export the map and its convention to V.2; do not reconstruct the quotient or reverse the producer-consumer edge.

**Acceptance.**

- The component sends a Milnor symbol of three units to the product of their classes.
- For a finite field the source vanishes.
- The injectivity theorem is not proved here; it is cited to the consuming layer.

**Prerequisites.**

- `K2SymbolsBrauer:T.2/graded-map`

**Sources.**

- `Kbook.2013`: IV.1.10.1 and VI.4.3.2 (PDF pp. 274, 490). Paraphrase of the indicated passage; checked in the author copy, not a quotation from the published edition.

### The Steinberg map onto the elementary subgroup

`K2SymbolsBrauer:T.1:classical/to-elementary` · construction · parent `K2SymbolsBrauer:T.1:classical` · implementation unchecked

The generator assignment x_ij(r) -> e_ij(r) descends to a surjective homomorphism St_n(R) -> E_n(R), where E_n is the subgroup generated by elementary matrices imported from KTheoryLowDegrees:U.1.

**Hypotheses.**

- R is an associative unital ring; n is at least three.

**Proof outline.**

1. Apply the presentation lift to the separately verified elementary relations.
2. The image contains each elementary generator, so it equals the elementary subgroup by subgroup-closure induction.

**Acceptance.**

- The generator assignment x_ij(r) -> e_ij(r) descends to a surjective homomorphism St_n(R) -> E_n(R), where E_n is the subgroup generated by elementary matrices imported from KTheoryLowDegrees:U.1.

**Prerequisites.**

- `K2SymbolsBrauer:T.1/steinberg-group-finite-rank`
- `K2SymbolsBrauer:T.1/elementary-matrices-satisfy`
- `KTheoryLowDegrees:U.1`

**Planning API.**

| Name | Role | Contract |
| --- | --- | --- |
| `toElementary` | constructor | The generator assignment x_ij(r) -> e_ij(r) descends to a surjective homomorphism St_n(R) -> E_n(R), where E_n is the subgroup generated by elementary matrices imported from KTheoryLowDegrees:U.1. |
| `toElementary_x` | simp | The image of x_ij(r) is e_ij(r). |
| `toElementary_surjective` | characterisation | Every element of the generated elementary subgroup has a preimage. |
| `toElementary_map` | functoriality | The square for a unital ring homomorphism commutes on each generator. |

**Consumers.**

- K2SymbolsBrauer:T.1/stabilisation — Finite-rank homomorphisms must commute with stabilization.

**Unit tests.**

- `generator_image` (test) — x_01(2) maps to I+2E_01 over Z.
- `elementary_word` (test) — e_01(r)*e_12(s) is the image of x_01(r)*x_12(s).
- `not_whole_gl` (test) — Over Q, diag(2,1,1) has determinant 2 and is outside the image; surjectivity concerns E_3, not GL_3.

**Sources.**

- `Kbook.2013`: III.5.1.1 (PDF p. 225). Paraphrase of the indicated passage; checked in the author copy, not a quotation from the published edition.

### The classical low-degree exact sequence

`K2SymbolsBrauer:T.1:classical/k2-k1-exact` · lemma · parent `K2SymbolsBrauer:T.1:classical` · implementation unchecked

The sequence 1 -> K2(R) -> St(R) -> GL(R) -> K1(R) -> 1 is exact, using the inclusion E(R) <= GL(R) and the quotient GL(R)/E(R) imported from U.1-U.2.

**Hypotheses.**

- R is an associative unital ring.

**Proof outline.**

1. Compose the surjection St -> E with the imported subgroup inclusion.
2. Injectivity of E -> GL identifies the composite kernel with K2.
3. The image is E, which is the kernel of the imported K1 quotient; that quotient is onto.

**Acceptance.**

- The sequence 1 -> K2(R) -> St(R) -> GL(R) -> K1(R) -> 1 is exact, using the inclusion E(R) <= GL(R) and the quotient GL(R)/E(R) imported from U.1-U.2.

**Prerequisites.**

- `K2SymbolsBrauer:T.1/k2-definition`
- `KTheoryLowDegrees:U.1`
- `KTheoryLowDegrees:U.2`

**Sources.**

- `Kbook.2013`: III.5.2 (PDF p. 225). Paraphrase of the indicated passage; checked in the author copy, not a quotation from the published edition.

### Morphisms of central extensions

`K2SymbolsBrauer:T.1:classical/central-extension-hom` · definition · parent `K2SymbolsBrauer:T.1:classical` · implementation unchecked

For central extensions p:X->G and q:Y->G define a morphism over G to be a homomorphism h:X->Y with q composed with h equal to p. Such morphisms do not require a fixed map of chosen kernel groups.

**Hypotheses.**

- G is a group; A is an abelian group.

**Proof outline.**

1. Define the subtype of group homomorphisms satisfying the projection square.
2. Identity and composition follow from homomorphism identity and associativity; equality is equality of underlying homomorphisms.

**Acceptance.**

- For central extensions p:X->G and q:Y->G define a morphism over G to be a homomorphism h:X->Y with q composed with h equal to p. Such morphisms do not require a fixed map of chosen kernel groups.

**Prerequisites.**

- `K2SymbolsBrauer:T.1/central-extension`

**Planning API.**

| Name | Role | Contract |
| --- | --- | --- |
| `HomOver.mk` | constructor | A homomorphism and proof of the projection square give a morphism. |
| `HomOver.ext` | extensionality | Equality of underlying homomorphisms implies equality of morphisms. |
| `HomOver.id_comp` | simp | Identity and composition retain the projection square; unit and associativity laws hold. |

**Consumers.**

- K2SymbolsBrauer:T.1/universal-central-extension — The universal property uses maps over G, without a fixed kernel identification.

**Unit tests.**

- `identity` (test) — The identity on A x G lies over the product projection.
- `section` (test) — g -> (1,g) is a morphism from id:G->G to the split projection A x G->G.
- `reject_projection_error` (test) — For nontrivial G, the constant homomorphism G->A x G is not over id:G->G.

**Sources.**

- `Kbook.2013`: III.5.3.1 (PDF p. 226). Paraphrase of the indicated passage; checked in the author copy, not a quotation from the published edition.

### Central extensions and second cohomology

`K2SymbolsBrauer:T.1:classical/central-extension-classification` · theorem · parent `K2SymbolsBrauer:T.1:classical` · implementation unchecked

Equivalence classes of central extensions of G by a fixed abelian group A correspond to H^2(G;A) with the trivial G-action.

**Hypotheses.**

- G is a group; A is an abelian group.

**Proof outline.**

1. Specialize the pinned fixed-action factor-set equivalence theorem to the trivial action and normalized sections.
2. Gap G-classification: prove centrality is equivalent to inducing trivial action, construct sections/factor sets, and prove surjectivity and independence before asserting the full bijection.

**Acceptance.**

- Equivalence classes of central extensions of G by a fixed abelian group A correspond to H^2(G;A) with the trivial G-action.

**Prerequisites.**

- `K2SymbolsBrauer:T.1/central-extension`
- `tauceti:TauCeti.FactorSet.inl_range_le_center`
- `tauceti:TauCeti.GroupExtension.nonempty_equiv_iff_cohomologyClass_factorSet_eq`

**Sources.**

- `Kbook.2013`: III.5.3 (PDF pp. 226-227). Paraphrase of the indicated passage; checked in the author copy, not a quotation from the published edition.

### Rigidity over a central quotient

`K2SymbolsBrauer:T.1:classical/perfect-extension-rigidity` · lemma · parent `K2SymbolsBrauer:T.1:classical` · implementation unchecked

If p:X->G is surjective and X is perfect, and q:Y->G has central kernel, any two homomorphisms h,k:X->Y with qh=p=qk are equal.

**Hypotheses.**

- G is a group; X and Y are central extensions of G.

**Proof outline.**

1. The pointwise difference h(x)k(x)^-1 lies in ker(q), hence is central.
2. Centrality makes this difference a homomorphism from X to the abelian centre.
3. A homomorphism from a perfect group to an abelian group is trivial.

**Acceptance.**

- If p:X->G is surjective and X is perfect, and q:Y->G has central kernel, any two homomorphisms h,k:X->Y with qh=p=qk are equal.

**Prerequisites.**

- `K2SymbolsBrauer:T.1/central-extension`
- `K2SymbolsBrauer:T.1:classical/central-extension-hom`
- `mathlib:Group.IsPerfect`

**Sources.**

- `Kbook.2013`: III.5.3.3 (PDF p. 227). Paraphrase of the indicated passage; checked in the author copy, not a quotation from the published edition.

### The central extension from relators

`K2SymbolsBrauer:T.1:classical/relation-central-extension` · construction · parent `K2SymbolsBrauer:T.1:classical` · implementation unchecked

For any group E and normal subgroup N, the projection E/[N,E]→E/N is a central extension with kernel N/[N,E]. The earlier free-presentation case is a specialization; freeness is not used in this construction.

**Hypotheses.**

- E is an arbitrary discrete group and N normal in E; no freeness hypothesis.

**Proof outline.**

1. Since N is normal, [N,E] <= N.
2. Every class of S commutes with every class of F after quotienting by [N,E].
3. The quotient projection is onto and its kernel consists exactly of classes of N.

**Acceptance.**

- For F free and S normal, the projection F/[S,F] -> F/S is a central extension with kernel S/[S,F].

**Prerequisites.**

- `K2SymbolsBrauer:T.1/central-extension`

**Planning API.**

| Name | Role | Contract |
| --- | --- | --- |
| `relatorProjection` | constructor | The induced quotient projection E/[N,E]→E/N for any normal N in E. |
| `relatorProjection_kernel` | characterisation | Its kernel is canonically N/[N,E] and lies in the centre. |
| `relatorProjection_map` | functoriality | A map of presentations preserving relators induces a commuting map of extensions. |

**Consumers.**

- K2SymbolsBrauer:T.1/hopf-formula — Restrict to the commutator subgroup to identify the Hopf kernel.
- T.1:classical/quotient-bar-kernel-h1 — Provides the central abelian kernel N/[E,N] for any quotient map, before specializing to free presentations.

**Unit tests.**

- `no_relators` (test) — If S=1, the extension is the identity F->F and its kernel is trivial.
- `cyclic_relation` (test) — If F=Z and S=mZ with m>=2, the extension is Z->Z/m with kernel mZ, which is nontrivial.
- `redundant_generator` (test) — For Free(a,b)->Z killing b, the relation kernel is nonzero, detected by the b-exponent sum.

**Sources.**

- `Kbook.2013`: III.5.3.4 (PDF p. 227). Paraphrase of the indicated passage; checked in the author copy, not a quotation from the published edition.

### Restricting the relator extension to commutators

`K2SymbolsBrauer:T.1:classical/commutator-central-extension` · construction · parent `K2SymbolsBrauer:T.1:classical` · implementation unchecked

The restriction [F,F]/[S,F] -> [G,G] is a central extension with kernel (S intersect [F,F])/[S,F]. If G is perfect its quotient is G.

**Hypotheses.**

- G is a group presented as a quotient of a free group F by a normal subgroup S.

**Proof outline.**

1. Surjectivity F->G maps its commutator subgroup onto [G,G].
2. Intersect the relation-extension kernel with [F,F] to compute the kernel.
3. Centrality follows from the relator extension.

**Acceptance.**

- The restriction [F,F]/[S,F] -> [G,G] is a central extension with kernel (S intersect [F,F])/[S,F]. If G is perfect its quotient is G.

**Prerequisites.**

- `K2SymbolsBrauer:T.1:classical/relation-central-extension`
- `mathlib:Group.IsPerfect`

**Planning API.**

| Name | Role | Contract |
| --- | --- | --- |
| `commutatorProjection` | constructor | The restricted quotient homomorphism onto [G,G]. |
| `commutatorProjection_kernel` | characterisation | Its kernel is the intersection quotient. |
| `commutatorProjection_perfect` | compatibility | For perfect G the quotient [G,G] identifies with G, preserving the projection. |

**Consumers.**

- K2SymbolsBrauer:T.1/recognition-theorem — The perfect-quotient extension is compared with the universal extension.

**Unit tests.**

- `free_presentation` (test) — For S=1 the map [F,F]->[F,F] is the identity, with trivial kernel.
- `cyclic_quotient` (test) — For F=Z, S=mZ, its source and target commutator groups are trivial even though the larger relation kernel is mZ.
- `abelian_rank_two` (test) — For G=Z^2 presented by F(a,b) with S=[F,F], the quotient target is trivial and the kernel [F,F]/[[F,F],F] is nontrivial; detect [a,b] in the integral Heisenberg quotient.

**Sources.**

- `Kbook.2013`: III.5.3.5 (PDF p. 227). Paraphrase of the indicated passage; checked in the author copy, not a quotation from the published edition.

### Pulling a central extension back along a homomorphism

`K2SymbolsBrauer:T.1:classical/central-extension-pullback` · construction · parent `K2SymbolsBrauer:T.1:classical` · implementation unchecked

Let q : Y → G be a surjective homomorphism whose kernel lies in the centre of Y, and let f : H → G be any homomorphism. The pullback P = {(h, y) ∈ H × Y : f(h) = q(y)} is a subgroup of H × Y, and its first projection pr_H : P → H is a central extension of H: it is surjective, and its kernel {(1, y) : y ∈ ker q} is central in P and isomorphic to ker q. The second projection pr_Y : P → Y satisfies q ∘ pr_Y = f ∘ pr_H, and a pair of homomorphisms a : X → H, b : X → Y with f ∘ a = q ∘ b factors uniquely through P.

**Hypotheses.**

- G, H and Y are groups; q : Y → G is surjective and ker q is contained in the centre of Y; f : H → G is a homomorphism.

**Proof outline.**

1. P is the subgroup of H × Y on which the homomorphisms f ∘ fst and q ∘ snd agree (MonoidHom.eqLocus), so it is a group.
2. pr_H is surjective: for h in H choose y with q(y) = f(h), using that q is surjective.
3. ker pr_H = {(1, y) : q(y) = 1}. For (h', y') in P, (h', y')(1, y)(h', y')⁻¹ = (1, y'yy'⁻¹) = (1, y) because y is central in Y; so the kernel is central, and y ↦ (1, y) identifies ker q with it.
4. For a, b with f ∘ a = q ∘ b, the product homomorphism X → H × Y lands in P; it is the unique factorisation because P → H × Y is injective.

**Acceptance.**

- Along the identity of G the pullback is isomorphic over G to Y, by y ↦ (q(y), y).
- The pullback of the product projection A × G → G along f is isomorphic over H to A × H → H.
- Centrality is inherited but universality is not: along the inclusion of the trivial group the pullback is ker q → 1, which is universal only when ker q is trivial, since a universal central extension has a perfect source and ker q is abelian.

**Prerequisites.**

- `K2SymbolsBrauer:T.1/central-extension`
- `K2SymbolsBrauer:T.1:classical/central-extension-hom`
- `mathlib:MonoidHom.eqLocus`
- `mathlib:MonoidHom.ker`
- `mathlib:Subgroup.center`

**Planning API.**

| Name | Role | Contract |
| --- | --- | --- |
| `CentralExtension.pullback` | constructor | The subgroup P = {(h, y) : f(h) = q(y)} of H × Y, for q : Y → G central and surjective and f : H → G. |
| `CentralExtension.pullbackFst` | projection | pr_H : P → H; it is surjective and its kernel is central. |
| `CentralExtension.pullbackSnd` | projection | pr_Y : P → Y, with q ∘ pr_Y = f ∘ pr_H. |
| `CentralExtension.pullbackLift` | universal-property | For a : X → H and b : X → Y with f ∘ a = q ∘ b, the unique homomorphism X → P with pr_H ∘ lift = a and pr_Y ∘ lift = b. |
| `CentralExtension.pullbackKerEquiv` | characterisation | ker pr_H ≅ ker q, by y ↦ (1, y). |
| `CentralExtension.pullbackId` | compatibility | Along the identity of G the pullback is isomorphic to Y over G, by y ↦ (q(y), y). |

**Consumers.**

- K2SymbolsBrauer:T.1:classical/split-central-extension-universal — a central extension of G is pulled back along X → G, where condition (2) of the Recognition Theorem splits it (K-book III.5.4, '(2) ⇒ (1) is immediate')
- K2SymbolsBrauer:T.1:classical/uce-lift — the lift of a homomorphism of bases to universal central extensions factors through the pullback of the target extension

**Unit tests.**

- `pullback_id` (degenerate) — For f = id_G, y ↦ (q(y), y) is an isomorphism from Y onto P commuting with the projections to G.
- `pullback_trivial_subgroup` (computation) — For q : C_4 → C_2 reduction modulo two and f the inclusion of the trivial group, P ≅ C_2 and pr_H : C_2 → 1.
- `pullback_split` (characterisation) — The pullback of the product projection A × G → G along f : H → G is isomorphic over H to the product projection A × H → H.
- `pullback_noncentral` (non-example) — For q the sign map S_3 → C_2, whose kernel A_3 is not central, and f = id, the kernel of pr_H is not central in P ≅ S_3: the centrality hypothesis is used.

**Sources.**

- `Kbook.2013`: III.5.4, equivalent conditions and proof (PDF p. 228, printed p. 220). The source calls (2) ⇒ (1) immediate: a central extension Y → G is pulled back along X → G to a central extension of X, which condition (2) splits. The pullback is not displayed in the source; this node makes it a declaration.

### Composite of central extensions with perfect middle term

`K2SymbolsBrauer:T.1:classical/central-extension-comp` · lemma · parent `K2SymbolsBrauer:T.1:classical` · implementation unchecked

Let ρ : Y → X and π : X → G be surjective homomorphisms whose kernels are central in Y and in X. If X is perfect, then πρ : Y → G is surjective with central kernel.

**Hypotheses.**

- ker ρ is contained in the centre of Y and ker π in the centre of X; ρ and π are surjective.
- X is perfect.

**Proof outline.**

1. Surjectivity of πρ is the composite of two surjections.
2. For z in ker(πρ), ρ(z) is central in X, so [y, z] lies in ker ρ, which is central in Y, for every y in Y.
3. Hence y ↦ [y, z] is a homomorphism from Y to the centre of Y, since [yy', z] = [y', z][y, z] when the values are central.
4. Its target is abelian, so it kills [Y, Y]; it kills ker ρ, which is central. As X is perfect, Y = [Y, Y]·ker ρ, so the homomorphism is trivial and z is central.

**Acceptance.**

- Non-example without perfectness: D_8 → D_8/Z(D_8) ≅ (Z/2)² and (Z/2)² → Z/2 are central extensions, but the composite has kernel {1, r², s, sr²}, which contains the non-central reflection s.
- With X a universal central extension (perfect by Lemma III.5.3.2) this is the first sentence of Exercise III.5.7 as the Recognition Theorem uses it.

**Prerequisites.**

- `K2SymbolsBrauer:T.1/central-extension`
- `mathlib:Subgroup.center`
- `mathlib:Group.IsPerfect`

**Sources.**

- `Kbook.2013`: Exercise III.5.7 (PDF p. 237, printed p. 229). The first sentence, with the perfectness hypothesis the printed exercise omits: the D_8 example shows the printed statement is false without it (recorded as K3BlochGroups/E2 in the K3BlochGroups packet, where this lemma was first planned as V.1/central-extension-comp). The second sentence is uce-extensions-split.

### Central extensions of a universal central extension split

`K2SymbolsBrauer:T.1:classical/uce-extensions-split` · lemma · parent `K2SymbolsBrauer:T.1:classical` · implementation unchecked

If p : X → G is a universal central extension, then every central extension ρ : Y → X (ρ surjective with central kernel, Y in the universe of X) has a homomorphic section s : X → Y with ρ ∘ s = id_X.

**Hypotheses.**

- p : X → G is a universal central extension.
- ρ : Y → X is surjective and ker ρ lies in the centre of Y.

**Proof outline.**

1. X is perfect (K2SymbolsBrauer:T.1/uce-perfect), so p ∘ ρ : Y → G is a central extension (central-extension-comp).
2. Universality of p gives σ : X → Y with p ∘ ρ ∘ σ = p.
3. Both ρ ∘ σ and id_X are homomorphisms X → X over G from p to p, so the uniqueness clause of universality gives ρ ∘ σ = id_X; σ is the required section.

**Acceptance.**

- For X = G trivial, every central extension A → 1 is split by the trivial homomorphism.
- Universality cannot be dropped: id : C_2 → C_2 is a central extension, and the central extension C_4 → C_2 of its source does not split.

**Prerequisites.**

- `K2SymbolsBrauer:T.1/universal-central-extension`
- `K2SymbolsBrauer:T.1/uce-perfect`
- `K2SymbolsBrauer:T.1:classical/central-extension-hom`
- `K2SymbolsBrauer:T.1:classical/central-extension-comp`

**Sources.**

- `Kbook.2013`: Exercise III.5.7 (PDF p. 237, printed p. 229). The second sentence; the proof steps are the intended solution, using the first sentence with the perfectness of X that Lemma III.5.3.2 supplies.

### Split central extensions force vanishing Schur multiplier

`K2SymbolsBrauer:T.1:classical/split-extensions-kill-h2` · lemma · parent `K2SymbolsBrauer:T.1:classical` · implementation unchecked

Let G be a group in Type. If every central extension of G by the circle group T = Q/Z (AddCircle (1 : ℚ), written multiplicatively, with trivial G-action) splits, then H_2(G, Z) = 0, integral homology with trivial coefficients. More precisely, the evaluation map H²(G; T) → Hom(H_2(G, Z), T) is surjective, and H²(G; T) = 0 under the hypothesis.

**Hypotheses.**

- G is a group in Type (Mathlib's integral group homology and the Tau Ceti factor-set classification are stated there); T carries the trivial G-action.

**Proof outline.**

1. Pair inhomogeneous 2-cocycles G × G → T with 2-cycles; the pairing kills coboundaries against cycles and cocycles against boundaries, so it descends to ev : H²(G; T) → Hom(H_2(G, Z), T).
2. ev is surjective: a character φ of H_2(G, Z), composed with the projection from 2-cycles, extends along the inclusion of 2-cycles into the 2-chains G × G →₀ Z (CharacterModule.dual_surjective_of_injective) to a function f : G × G → T; f vanishes on boundaries, so it is a 2-cocycle with ev[f] = φ.
3. H²(G; T) = 0: every class is the class of a factor set (TauCeti.FactorSet.exists_cohomologyClass_eq), whose extension (TauCeti.FactorSet.groupExtension) is central because the action is trivial, hence splits by hypothesis, so its class is 0 (TauCeti.FactorSet.nonempty_splitting_iff_cohomologyClass_eq_zero).
4. So every character of H_2(G, Z) vanishes, and H_2(G, Z) = 0 by CharacterModule.eq_zero_of_character_apply.

**Acceptance.**

- For the standard Schur cover SL₂(𝔽₅) → A₅ with kernel C₂ = H₂(A₅, ℤ), push out the kernel along C₂ → ℚ/ℤ, 1 ↦ 1/2 mod ℤ. This is the central extension by ℚ/ℤ whose evaluation is the nonzero character and hence cannot split. The original C₂-extension itself does not have the coefficient group of this lemma.
- The lemma is Recognition (2) ⇒ (3) in degree two; it uses only extensions by Q/Z, not all central extensions.

**Prerequisites.**

- `K2SymbolsBrauer:T.1/central-extension`
- `mathlib:groupHomology.H2`
- `mathlib:Rep.trivial`
- `mathlib:groupCohomology.H2`
- `mathlib:groupHomology.inhomogeneousChains`
- `mathlib:groupHomology.d₃₂`
- `mathlib:AddCircle`
- `mathlib:CharacterModule`
- `mathlib:CharacterModule.dual_surjective_of_injective`
- `mathlib:CharacterModule.eq_zero_of_character_apply`
- `tauceti:TauCeti.FactorSet.exists_cohomologyClass_eq`
- `tauceti:TauCeti.FactorSet.nonempty_splitting_iff_cohomologyClass_eq_zero`
- `tauceti:TauCeti.FactorSet.groupExtension`

**Sources.**

- `Kbook.2013`: III.5.3 (PDF p. 227, printed p. 219). The classification of central extensions by H² used in the third step, with the trivial action on T.
- `Kbook.2013`: III.5.4, equivalent conditions and proof (PDF p. 228, printed p. 220). The implication (2) ⇒ (3) in degree two that this lemma supplies. First planned as K3BlochGroups:V.1/split-extensions-kill-h2 (review REV-K3BlochGroups); moved here by FIX-RT-AREA-ktheory-1.

### First integral homology is the abelianisation; vanishing is perfectness

`K2SymbolsBrauer:T.1:classical/h1-trivial-perfect` · lemma · parent `K2SymbolsBrauer:T.1:classical` · implementation unchecked

For a group G in Type, groupHomology.H1AddEquivOfIsTrivial for the trivial representation Z, followed by the unit isomorphism Additive(G_ab) ⊗_Z Z ≅ Additive(G_ab) (TensorProduct.rid), is an isomorphism H_1(G, Z) ≅ Additive(G_ab), natural in G: for f : G → H it carries groupHomology.map f to Abelianization.map f. Consequently H_1(G, Z) = 0 if and only if G is perfect.

**Hypotheses.**

- G is a group in Type; Z carries the trivial action (Rep.trivial ℤ G ℤ).

**Proof outline.**

1. Apply groupHomology.H1AddEquivOfIsTrivial to A = Rep.trivial ℤ G ℤ and compose with TensorProduct.rid ℤ.
2. Naturality: both composites send the class of the 1-cycle single g 1 to the class of f(g) (H1AddEquivOfIsTrivial_single and groupHomology.H1π_comp_map); such classes generate H_1.
3. G_ab = G/[G, G] is trivial exactly when commutator G = ⊤, which is Group.isPerfect_def.

**Acceptance.**

- H_1(Z/2, Z) ≅ Z/2 ≠ 0, and Z/2 is not perfect.
- H_1(A_5, Z) = 0 because A_5 is perfect.
- The identification uses the trivial action: with a nontrivial coefficient module H_1 is not the abelianisation.

**Prerequisites.**

- `mathlib:groupHomology.H1`
- `mathlib:groupHomology.H1AddEquivOfIsTrivial`
- `mathlib:groupHomology.map`
- `mathlib:groupHomology.H1π_comp_map`
- `mathlib:Rep.trivial`
- `mathlib:TensorProduct.rid`
- `mathlib:Abelianization`
- `mathlib:Abelianization.map`
- `mathlib:Group.IsPerfect`
- `mathlib:Group.isPerfect_def`

**Sources.**

- `Loeh.GroupCohomology.2019`: Corollary 1.4.6 (printed p. 23; PDF p. 31). The characterisation of perfectness, which is what the Recognition Theorem's H_1 = 0 means.
- `Loeh.GroupCohomology.2019`: Theorem 1.4.1 (printed p. 20; PDF p. 28). The natural isomorphism with the abelianisation; at the pin Mathlib supplies it as H1AddEquivOfIsTrivial up to the unit isomorphism of the tensor product.

### Superperfect groups

`K2SymbolsBrauer:T.1:classical/superperfect` · definition · parent `K2SymbolsBrauer:T.1:classical` · implementation unchecked

A group G in Type is superperfect if H_1(G, Z) = 0 and H_2(G, Z) = 0, where H_n(G, Z) = groupHomology (Rep.trivial ℤ G ℤ) n is Mathlib's integral group homology with trivial coefficients. Equivalently (h1-trivial-perfect), G is perfect and H_2(G, Z) = 0. This is condition (3) of the Recognition Theorem.

**Hypotheses.**

- G is a group in Type: Mathlib's group homology over ℤ puts the group in the universe of ℤ.

**Proof outline.**

1. Define the predicate as the conjunction of the two vanishing statements, each as subsingleton-ness of the ModuleCat ℤ object.
2. Prove the characterisation by perfectness with h1-trivial-perfect.
3. Prove invariance under group isomorphisms with groupHomology.mapIso.

**Acceptance.**

- The trivial group is superperfect; Z/2 and every nontrivial free group are not.
- A_5 is perfect but not superperfect, so the predicate is strictly stronger than Group.IsPerfect.

**Prerequisites.**

- `mathlib:groupHomology`
- `mathlib:Rep.trivial`
- `mathlib:groupHomology.H1`
- `mathlib:groupHomology.H2`
- `mathlib:groupHomology.mapIso`
- `mathlib:Group.IsPerfect`
- `K2SymbolsBrauer:T.1:classical/h1-trivial-perfect`

**Planning API.**

| Name | Role | Contract |
| --- | --- | --- |
| `Group.IsSuperperfect` | characterisation | The predicate H_1(G, Z) = 0 ∧ H_2(G, Z) = 0 for a group G in Type, with trivial integral coefficients. |
| `Group.isSuperperfect_iff` | characterisation | IsSuperperfect G ↔ Group.IsPerfect G ∧ H_2(G, Z) = 0. |
| `Group.IsSuperperfect.isPerfect` | compatibility | A superperfect group is perfect in Mathlib's sense (Group.IsPerfect). |
| `Group.IsSuperperfect.of_mulEquiv` | functoriality | Superperfectness is invariant under group isomorphisms. |
| `Group.IsSuperperfect.of_subsingleton` | example | The trivial group is superperfect. |

**Consumers.**

- K2SymbolsBrauer:T.1/recognition-theorem — condition (3) of Recognition Theorem III.5.4, H_1(X; Z) = H_2(X; Z) = 0
- K3BlochGroups:V.1/steinberg-superperfect — the stable Steinberg group is superperfect, which makes BSt(A)⁺ two-connected
- StableHomotopyKTheory:H.3/plus-pi2-universal-central-extension — π_1 of the acyclic homotopy fibre of a plus construction is perfect with H_2 = 0, hence the universal central extension (K-book IV.1.7)

**Unit tests.**

- `isSuperperfect_trivial` (degenerate) — The trivial group is superperfect.
- `not_isSuperperfect_cyclic` (non-example) — Z/2 is not superperfect: H_1(Z/2, Z) ≅ Z/2.
- `not_isSuperperfect_free` (non-example) — The free group on one generator is not superperfect although its H_2 vanishes (free-group-higher-homology): a definition asking only for H_2 = 0 fails this test.
- `not_isSuperperfect_alternating` (non-example) — A_5 is perfect but not superperfect (H_2(A_5, Z) ≅ Z/2): a definition asking only for perfectness fails this test.
- `isSuperperfect_iff_perfect` (compatibility) — For every group G in Type, IsSuperperfect G ↔ Group.IsPerfect G ∧ H_2(G, Z) = 0.

**Sources.**

- `Kbook.2013`: III.5.4, equivalent conditions and proof (PDF p. 228, printed p. 220). Condition (3). The source does not use the word 'superperfect'; it is the standard name for this condition and the one the consuming roadmaps use.

### The Hopf extension of a perfect group is perfect

`K2SymbolsBrauer:T.1:classical/hopf-extension-perfect` · lemma · parent `K2SymbolsBrauer:T.1:classical` · implementation unchecked

Let π : F → G be a surjective homomorphism with kernel R. If G is perfect, then F = [F, F]·R and [F, F] = [[F, F], [F, F]]·[R, F]; hence [F, F]/[R, F] is a perfect group.

**Hypotheses.**

- F is a group and π : F → G is surjective with kernel R (F need not be free).
- G is perfect.

**Proof outline.**

1. π maps [F, F] onto [G, G] = G (Subgroup.map_commutator and surjectivity), so every f in F is c·r with c in [F, F] and r in R.
2. For f = cr and f' = c'r', the commutator [f, f'] is congruent to [c, c'] modulo [R, F], because R is normal in F and its elements are central modulo [R, F].
3. Hence the commutator generators of [F, F] lie in [[F, F], [F, F]]·[R, F]; since [R, F] ⊆ [F, F], the quotient [F, F]/[R, F] equals its own commutator subgroup.

**Acceptance.**

- For F free on one generator and R = F (G trivial), [F, F]/[R, F] is trivial, hence perfect.
- Perfectness of G is needed: for F free on a, b and R = [F, F] (G = Z²), [F, F]/[[F, F], F] is a nontrivial abelian group, detected by [a, b] in the integral Heisenberg quotient, so it is not perfect.

**Prerequisites.**

- `K2SymbolsBrauer:T.1:classical/commutator-central-extension`
- `mathlib:Group.IsPerfect`
- `mathlib:commutator`
- `mathlib:Subgroup.map_commutator`

**Sources.**

- `Kbook.2013`: III.5.4, equivalent conditions and proof (PDF p. 228, printed p. 220). Lemma 5.3.3 applies only to a perfect source, here [F, F]/[R, F]; the source uses its perfectness without comment, and this node supplies it.

### Every perfect group has a universal central extension

`K2SymbolsBrauer:T.1:classical/perfect-uce-exists` · theorem · parent `K2SymbolsBrauer:T.1:classical` · implementation unchecked

Let G be a perfect group and π : F → G a surjection from a free group F = FreeGroup S, with kernel R. The restricted projection [F, F]/[R, F] → G (commutator-central-extension, whose target [G, G] is G) is a universal central extension of G. In particular every perfect group G has a universal central extension in its own universe, from the canonical presentation FreeGroup G → G.

**Hypotheses.**

- G is perfect.
- π : FreeGroup S → G is surjective with kernel R.

**Proof outline.**

1. [F, F]/[R, F] → G is surjective with central kernel (R ∩ [F, F])/[R, F] (commutator-central-extension, G perfect).
2. Given a central extension q : Y → G, choose for each generator s in S a preimage in Y of π(s); FreeGroup.lift gives h : F → Y with q ∘ h = π.
3. h(R) ⊆ ker q, which is central in Y, so h([R, F]) = 1; restrict h to [F, F] and descend to a homomorphism [F, F]/[R, F] → Y over G.
4. Uniqueness: [F, F]/[R, F] is perfect (hopf-extension-perfect) and ker q is central, so perfect-extension-rigidity allows at most one homomorphism over G.
5. For existence in general take S = G and π = FreeGroup.lift id.

**Acceptance.**

- For G trivial and S empty the universal central extension is the trivial group.
- Its kernel is the Hopf quotient (R ∩ [F, F])/[R, F], which uce-kernel-h2 identifies with H_2(G, Z).
- Perfectness of G cannot be dropped: a group that is not perfect has no universal central extension (K2SymbolsBrauer:T.1/uce-perfect).

**Prerequisites.**

- `K2SymbolsBrauer:T.1:classical/commutator-central-extension`
- `K2SymbolsBrauer:T.1:classical/relation-central-extension`
- `K2SymbolsBrauer:T.1:classical/hopf-extension-perfect`
- `K2SymbolsBrauer:T.1:classical/perfect-extension-rigidity`
- `K2SymbolsBrauer:T.1/universal-central-extension`
- `mathlib:FreeGroup`
- `mathlib:FreeGroup.lift`
- `mathlib:Group.IsPerfect`

**Sources.**

- `Kbook.2013`: III.5.4, statement (PDF p. 227, printed p. 219). The existence half of the theorem, with the extension (5.3.5).
- `Kbook.2013`: III.5.4, equivalent conditions and proof (PDF p. 228, printed p. 220). The proof, followed step by step; the perfectness that Lemma 5.3.3 needs is hopf-extension-perfect.

### Integral homology of a free group vanishes above degree one

`K2SymbolsBrauer:T.1:classical/free-group-higher-homology` · lemma · parent `K2SymbolsBrauer:T.1:classical` · implementation unchecked

Let F be a free group in Type (IsFreeGroup F; for example FreeGroup S). Then H_k(F, Z) = 0 for every k ≥ 2, with trivial integral coefficients, and H_1(F, Z) is free abelian on a basis of F.

**Hypotheses.**

- F is a group in Type with IsFreeGroup F.

**Proof outline.**

1. For F = FreeGroup S, the complex 0 → ZF^(S) → ZF → Z → 0 with e_s ↦ s − 1 followed by the augmentation is exact (Löh, Proposition 1.6.21: the image of ∂ is the augmentation ideal, and ∂ is injective by a reduced-word support argument).
2. Its two nonzero terms are free, hence projective, representations, so it is a projective resolution of Rep.trivial ℤ F ℤ of length one (CategoryTheory.ProjectiveResolution).
3. groupHomologyIso computes H_k(F, Z) as the homology of the coinvariants of this resolution, which vanishes for k ≥ 2; in degree one ∂ becomes zero after coinvariants and leaves Z^(S).
4. For a general free group transport along the isomorphism with FreeGroup of a basis (groupHomology.mapIso).

**Acceptance.**

- H_2(Z, Z) = 0 for the free group of rank one.
- H_1 of the free group on two generators is Z².
- With Nielsen-Schreier (subgroupIsFreeOfIsFree) the lemma applies to every subgroup of a free group, as Hopf's formula needs for the relator subgroup.

**Prerequisites.**

- `mathlib:groupHomology`
- `mathlib:groupHomologyIso`
- `mathlib:CategoryTheory.ProjectiveResolution`
- `mathlib:Rep.trivial`
- `mathlib:FreeGroup`
- `mathlib:IsFreeGroup`
- `mathlib:groupHomology.mapIso`

**Sources.**

- `Loeh.GroupCohomology.2019`: Corollary 1.6.23 with Proposition 1.6.21 (printed pp. 56-57; PDF pp. 64-65). The vanishing statement with the length-one free resolution of Proposition 1.6.21 that proves it; the proof steps follow Löh's.

### Hopf's four-term exact sequence

`K2SymbolsBrauer:T.1:classical/hopf-four-term-sequence` · theorem · parent `K2SymbolsBrauer:T.1:classical` · implementation unchecked

Let F be a free group in Type, N a normal subgroup and G = F/N. There is an exact sequence 0 → H_2(G, Z) → N/[F, N] → F/[F, F] → G_ab → 0 of abelian groups, in which N/[F, N] → F/[F, F] is induced by the inclusion N ⊆ F and F/[F, F] → G_ab by the projection.

**Hypotheses.**

- F is a free group in Type; N is normal in F; G = F/N; homology has trivial integral coefficients.

**Proof outline.**

1. Apply T.1:classical/hochschild-serre-integral-five-term to F→G=F/N. Since F is free, free-group-higher-homology gives H₂(F,Z)=0, making the canonical transgression injective.
2. The resulting exact sequence is 0→H₂(G,Z)→N/[F,N]→F_ab→G_ab→0. The preceding explicit bar-kernel isomorphism identifies the middle map with inclusion, and the pinned homologyMap definition identifies the final map with quotient.
3. The low-degree corestriction/coinflation exact sequence already in Mathlib is compatible with these two degree-one maps. It supplies that tail but is not used alone to assert the missing injection. Freeness of N is not required to get this five-term specialization.

**Acceptance.**

- For N = 1 the sequence reads 0 → H_2(F, Z) → 0 → F_ab → F_ab → 0, consistent with H_2(F, Z) = 0.
- For F free on a and N generated by a^m (G = Z/m): N/[F, N] = N ≅ mZ maps injectively to F_ab = Z, so H_2(Z/m, Z) = 0 and G_ab = Z/m.
- Exactness at N/[F, N] identifies H_2(G, Z) with (N ∩ [F, F])/[F, N], which is Hopf's formula.

**Prerequisites.**

- `K2SymbolsBrauer:T.1:classical/free-group-higher-homology`
- `K2SymbolsBrauer:T.1:classical/h1-trivial-perfect`
- `mathlib:groupHomology.H1CoresCoinfOfTrivial_exact`
- `mathlib:groupHomology.H1CoresCoinfOfTrivial_g_epi`
- `mathlib:groupHomology.H2`
- `mathlib:Rep.trivial`
- `K2SymbolsBrauer:T.1:classical/hochschild-serre-integral-five-term`

**Sources.**

- `Loeh.GroupCohomology.2019`: Theorem 3.2.18 (printed p. 129; PDF p. 137). The four-term sequence, with H1(N; Z)_G rewritten as N/[F, N] as Löh does at the start of the proof.
- `Loeh.GroupCohomology.2019`: Proof of Theorem 3.2.18 (printed pp. 130-131; PDF pp. 138-139). Löh gives a spectral-sequence proof using free-group vanishing. This packet instead specializes its explicitly constructed bar-kernel five-term sequence, for which only the vanishing of H₂(F,Z) is needed; no spectral sequence construction is attributed to this passage.

### The kernel of a universal central extension is the second homology

`K2SymbolsBrauer:T.1:classical/uce-kernel-h2` · theorem · parent `K2SymbolsBrauer:T.1:classical` · implementation unchecked

Let G be a perfect group in Type and p : X → G a universal central extension with X in Type. Then ker p ≅ H_2(G, Z) as abelian groups (trivial integral coefficients): the unique isomorphism over G from X to the Hopf extension [F, F]/[R, F] of the canonical presentation F = FreeGroup G → G restricts to an isomorphism of kernels, and Hopf's formula identifies the Hopf kernel (R ∩ [F, F])/[R, F] with H_2(G, Z). That the identification does not depend on the presentation is uce-kernel-h2-natural.

**Hypotheses.**

- G is a perfect group in Type; p : X → G is a universal central extension, X in Type (universality quantifies over central extensions in that universe, which contains the Hopf model FreeGroup G).

**Proof outline.**

1. perfect-uce-exists gives the Hopf universal central extension U = [F, F]/[R, F] → G.
2. Two universal central extensions of G are isomorphic over G by a unique isomorphism (UCE.equiv_over of K2SymbolsBrauer:T.1/universal-central-extension); it maps ker p onto ker(U → G).
3. ker(U → G) = (R ∩ [F, F])/[R, F] (commutator-central-extension), which is H_2(G, Z) by K2SymbolsBrauer:T.1/hopf-formula.

**Acceptance.**

- For G = E(R) and X = St(R) this is K_2(R) ≅ H_2(E(R), Z), which K2SymbolsBrauer:T.1/k2-h2-elementary consumes.
- For G trivial both sides are zero.
- The statement is about perfect groups: Z² has H_2 = Z but no universal central extension.

**Prerequisites.**

- `K2SymbolsBrauer:T.1:classical/perfect-uce-exists`
- `K2SymbolsBrauer:T.1/universal-central-extension`
- `K2SymbolsBrauer:T.1:classical/commutator-central-extension`
- `K2SymbolsBrauer:T.1/hopf-formula`
- `mathlib:groupHomology.H2`
- `mathlib:Rep.trivial`

**Sources.**

- `Kbook.2013`: III.5.4, statement (PDF p. 227, printed p. 219). The kernel of the displayed universal central extension is H_2(G; Z).
- `Kbook.2013`: Before Proposition IV.1.7 (PDF p. 272, printed p. 264). The form in which the plus-construction chapter uses the statement, for an arbitrary universal central extension of a perfect group.

### The source of a universal central extension is superperfect

`K2SymbolsBrauer:T.1:classical/uce-source-superperfect` · theorem · parent `K2SymbolsBrauer:T.1:classical` · implementation unchecked

Let p : X → G be a universal central extension of groups in Type. Then X is superperfect: H_1(X, Z) = 0 and H_2(X, Z) = 0. Only the universal property is used. This is Recognition (1) ⇒ (3).

**Hypotheses.**

- p : X → G is a universal central extension; X and G are groups in Type.

**Proof outline.**

1. X is perfect (K2SymbolsBrauer:T.1/uce-perfect, K-book Lemma III.5.3.2), so H_1(X, Z) = 0 (h1-trivial-perfect).
2. Every central extension of X splits (uce-extensions-split), in particular every central extension of X by Q/Z with trivial action.
3. split-extensions-kill-h2 gives H_2(X, Z) = 0.

**Acceptance.**

- For the Steinberg extension St(R) → E(R) (K2SymbolsBrauer:T.1/steinberg-is-uce) it gives H_1(St(R), Z) = H_2(St(R), Z) = 0, the corollary K3BlochGroups V.1 draws.
- Universality, not merely a perfect source, is used: the identity of A_5 is a central extension with perfect source, but H_2(A_5, Z) ≠ 0.
- For X = G trivial both homology groups vanish.

**Prerequisites.**

- `K2SymbolsBrauer:T.1/uce-perfect`
- `K2SymbolsBrauer:T.1:classical/uce-extensions-split`
- `K2SymbolsBrauer:T.1:classical/split-extensions-kill-h2`
- `K2SymbolsBrauer:T.1:classical/h1-trivial-perfect`
- `K2SymbolsBrauer:T.1:classical/superperfect`

**Sources.**

- `Kbook.2013`: III.5.4, equivalent conditions and proof (PDF p. 228, printed p. 220). The implication (1) ⇒ (3), by the route (1) ⇒ (2) ⇒ (3) the source indicates. First planned as K3BlochGroups:V.1/uce-superperfect; moved here by FIX-RT-AREA-ktheory-1 so that V.1 imports it.
- `Kbook.2013`: Exercise IV.1.9 (PDF p. 282, printed p. 274). The perfectness half, in the form the plus-construction exercise uses.

### A superperfect group is its own universal central extension

`K2SymbolsBrauer:T.1:classical/superperfect-extensions-split` · lemma · parent `K2SymbolsBrauer:T.1:classical` · implementation unchecked

Let X be a superperfect group in Type. Then the identity X → X is a universal central extension of X, and every central extension ρ : Y → X (Y in Type) splits. This is Recognition (3) ⇒ (2).

**Hypotheses.**

- X is a superperfect group in Type.

**Proof outline.**

1. X is perfect (h1-trivial-perfect), so perfect-uce-exists gives the universal central extension U = [F, F]/[R, F] → X for F = FreeGroup X.
2. Its kernel (R ∩ [F, F])/[R, F] (commutator-central-extension) is H_2(X, Z) = 0 by K2SymbolsBrauer:T.1/hopf-formula, so U → X is an isomorphism and the identity of X is a universal central extension.
3. For a central extension ρ : Y → X, universality of the identity gives s : X → Y with ρ ∘ s = id_X.

**Acceptance.**

- For X trivial, every central extension A → 1 is split by the trivial homomorphism.
- Both vanishing conditions are needed: Z/2 has H_2 = 0 but H_1 ≠ 0, and C_4 → Z/2 does not split; A_5 is perfect with H_2 ≠ 0, and SL_2(F_5) → A_5 does not split.

**Prerequisites.**

- `K2SymbolsBrauer:T.1:classical/superperfect`
- `K2SymbolsBrauer:T.1:classical/h1-trivial-perfect`
- `K2SymbolsBrauer:T.1:classical/perfect-uce-exists`
- `K2SymbolsBrauer:T.1:classical/commutator-central-extension`
- `K2SymbolsBrauer:T.1/hopf-formula`
- `K2SymbolsBrauer:T.1/universal-central-extension`

**Sources.**

- `Kbook.2013`: III.5.4, equivalent conditions and proof (PDF p. 228, printed p. 220). The implication (3) ⇒ (2), which the source obtains from the existence half and the identification of the kernel with H_2.

### A perfect central extension whose central extensions split is universal

`K2SymbolsBrauer:T.1:classical/split-central-extension-universal` · lemma · parent `K2SymbolsBrauer:T.1:classical` · implementation unchecked

Let p : X → G be surjective with central kernel. If X is perfect and every central extension of X splits, then p is a universal central extension of G. This is Recognition (2) ⇒ (1); no homology enters and there is no universe restriction beyond the one in the definition of universality.

**Hypotheses.**

- p : X → G is surjective and ker p lies in the centre of X.
- X is perfect, and every central extension of X (in the universe over which universality quantifies) splits.

**Proof outline.**

1. Given a central extension q : Y → G, pull it back along p (central-extension-pullback): P = X ×_G Y → X is a central extension of X.
2. By hypothesis it has a section s : X → P; then pr_Y ∘ s : X → Y satisfies q ∘ pr_Y ∘ s = p ∘ pr_X ∘ s = p, a homomorphism over G.
3. Uniqueness: X is perfect and ker q is central, so perfect-extension-rigidity.

**Acceptance.**

- The Steinberg application: St(R) is perfect and every central extension of St(R) splits (glued from finite-rank splitting), so St(R) → E(R) is universal; K2SymbolsBrauer:T.1/steinberg-is-uce uses the lemma in this form.
- Perfectness of X is needed: every central extension of a nontrivial free group F splits, but the identity of F is not universal, since F is not perfect.

**Prerequisites.**

- `K2SymbolsBrauer:T.1:classical/central-extension-pullback`
- `K2SymbolsBrauer:T.1:classical/perfect-extension-rigidity`
- `K2SymbolsBrauer:T.1:classical/central-extension-hom`
- `K2SymbolsBrauer:T.1/universal-central-extension`
- `mathlib:Group.IsPerfect`

**Sources.**

- `Kbook.2013`: III.5.4, equivalent conditions and proof (PDF p. 228, printed p. 220). The implication (2) ⇒ (1), which the source calls immediate; the proof steps make the pullback explicit.

### Lifting homomorphisms to universal central extensions

`K2SymbolsBrauer:T.1:classical/uce-lift` · construction · parent `K2SymbolsBrauer:T.1:classical` · implementation unchecked

Let p : X → G and p' : X' → G' be universal central extensions (groups in one universe) and f : G → G' a homomorphism. There is a unique homomorphism f̃ : X → X' with p' ∘ f̃ = f ∘ p. The lift of the identity of G along p itself is the identity of X, the lift of a composite is the composite of the lifts, and f̃ maps ker p into ker p', giving a homomorphism of abelian groups ker p → ker p'.

**Hypotheses.**

- p : X → G and p' : X' → G' are universal central extensions; f : G → G' is a homomorphism.

**Proof outline.**

1. Pull p' back along f: P = G ×_G' X' → G is a central extension of G (central-extension-pullback).
2. Universality of p gives a homomorphism X → P over G; compose with pr_X' to obtain f̃ with p' ∘ f̃ = f ∘ p.
3. Uniqueness: if h and k both satisfy p' ∘ h = f ∘ p = p' ∘ k, then (p, h) and (p, k) are homomorphisms X → P over G (pullback lift), equal by universality of p; so h = k.
4. Functoriality: the identity satisfies the defining equation for id_G, and lift(g) ∘ lift(f) satisfies it for g ∘ f; uniqueness gives both laws.
5. If p(x) = 1 then p'(f̃(x)) = f(1) = 1; kernels are central, hence abelian.

**Acceptance.**

- The lift of the trivial homomorphism is trivial: it maps X into the abelian group ker p', and X is perfect.
- For a ring map R → S the lift of E(R) → E(S) along the Steinberg extensions is the functoriality map St(R) → St(S), by uniqueness.
- Uniqueness needs a universal source: for id : C_2 → C_2, the identity of C_2 has two lifts to the split extension C_2 × C_2 → C_2.

**Prerequisites.**

- `K2SymbolsBrauer:T.1/universal-central-extension`
- `K2SymbolsBrauer:T.1/uce-perfect`
- `K2SymbolsBrauer:T.1:classical/central-extension-pullback`
- `K2SymbolsBrauer:T.1:classical/central-extension-hom`

**Planning API.**

| Name | Role | Contract |
| --- | --- | --- |
| `IsUniversalCentralExtension.lift` | constructor | The lift f̃ : X → X' of f : G → G' between universal central extensions p and p'. |
| `IsUniversalCentralExtension.proj_comp_lift` | universal-property | p' ∘ f̃ = f ∘ p. |
| `IsUniversalCentralExtension.lift_unique` | characterisation | Any homomorphism h : X → X' with p' ∘ h = f ∘ p equals f̃. |
| `IsUniversalCentralExtension.lift_id` | functoriality | The lift of id_G along p itself is id_X. |
| `IsUniversalCentralExtension.lift_comp` | functoriality | The lift of g ∘ f is the lift of g composed with the lift of f. |
| `IsUniversalCentralExtension.kerMap` | projection | The restriction of f̃ to kernels, a homomorphism of abelian groups ker p → ker p'. |

**Consumers.**

- K2SymbolsBrauer:T.1/k2-h2-elementary — naturality of K_2(R) ≅ H_2(E(R), Z) in the ring: St(R) → St(S) is the lift of E(R) → E(S)
- K2SymbolsBrauer:T.1:classical/uce-kernel-h2-natural — its kernel map is compared with H_2(f; Z)
- StableHomotopyKTheory:H.3/plus-pi2-universal-central-extension — the naturality in R that the node's acceptance asks to check on representatives

**Unit tests.**

- `lift_id_self` (degenerate) — For G' = G, p' = p and f = id_G, the lift is id_X.
- `lift_trivial_hom` (characterisation) — For the trivial homomorphism f : G → G', the lift is the trivial homomorphism X → X'.
- `lift_steinberg` (compatibility) — For a ring map φ : R → S, the lift of E(φ) along St(R) → E(R) and St(S) → E(S) sends x_ij(r) to x_ij(φ(r)).
- `lift_not_unique_nonuniversal` (non-example) — For the central extension id : C_2 → C_2, which is not universal, the identity of C_2 has two different lifts to the split extension C_2 × C_2 → C_2 (first coordinate trivial or the identity).

**Sources.**

- `Kbook.2013`: III.5.3.1 (PDF p. 227, printed p. 219). The universal property from which the lift is derived. The source states uniqueness up to isomorphism over G but not the lift along a homomorphism of bases or its functoriality; they are derived here through the pullback.

### Naturality of Hopf's formula

`K2SymbolsBrauer:T.1:classical/hopf-formula-natural` · theorem · parent `K2SymbolsBrauer:T.1:classical` · implementation unchecked

Let π : F → G and π' : F' → G' be surjections from free groups in Type with kernels R and R', f : G → G' a homomorphism and φ : F → F' a homomorphism with π' ∘ φ = f ∘ π. Then φ(R) ⊆ R', φ induces a homomorphism (R ∩ [F, F])/[R, F] → (R' ∩ [F', F'])/[R', F'], and under the Hopf isomorphisms of K2SymbolsBrauer:T.1/hopf-formula this homomorphism is H_2(f; Z) = groupHomology.map f (id) 2. In particular it does not depend on φ, and for f = id the Hopf isomorphisms of two presentations of G agree.

**Hypotheses.**

- F, F' are free groups in Type; π, π' are surjective with kernels R, R'; π' ∘ φ = f ∘ π; homology has trivial integral coefficients.

**Proof outline.**

1. From π' ∘ φ = f ∘ π, φ(R) ⊆ R'; then φ([R, F]) ⊆ [R', F'] and φ([F, F]) ⊆ [F', F'], so the map of Hopf quotients is defined.
2. Apply hochschild-serre-five-term-natural to the morphism of free-presentation quotients (φ,f). Its middle map sends class(r) to class(φ(r)) and its H₂ component is literally the pinned groupHomology.map f (id)2.
3. Restrict the commuting transgression square to the kernels of N/[F,N]→F_ab. The Hopf isomorphism is this injection followed by its image identification, so its naturality follows with the same fixed sign.
4. For a fixed f, the left H₂ map does not depend on φ. The transgression injections therefore force independence of the induced map on Hopf kernels.

**Acceptance.**

- For G' = G, F' = F and φ = id the induced map is the identity.
- Different lifts can differ on the larger relation module: for F free on a, b → Z (a ↦ 1, b ↦ 0) the lifts id and b ↦ b² of the identity differ on the class of b in R/[R, F] (b-exponent sums 1 and 2), but they agree on the Hopf quotient, which is zero here since H_2(Z, Z) = 0.
- It makes the kernel identification of uce-kernel-h2 independent of the presentation.

**Prerequisites.**

- `K2SymbolsBrauer:T.1/hopf-formula`
- `K2SymbolsBrauer:T.1:classical/hopf-four-term-sequence`
- `K2SymbolsBrauer:T.1:classical/relation-central-extension`
- `K2SymbolsBrauer:T.1:classical/commutator-central-extension`
- `mathlib:groupHomology.map`
- `mathlib:Rep.trivial`
- `K2SymbolsBrauer:T.1:classical/hochschild-serre-five-term-natural`

**Sources.**

- `Kbook.2013`: III.5.3.4 (PDF p. 227, printed p. 219). The source calls the two extensions natural but does not prove the naturality of the Hopf identification.
- `Loeh.GroupCohomology.2019`: Proof of Theorem 3.2.18 (printed p. 131; PDF p. 139). Löh identifies degree-one maps by spectral-sequence naturality. This packet supplies the required degree-two compatibility by the pinned connecting-map naturality and the explicit bar-kernel isomorphism; it does not claim that Löh constructs the spectral sequence here.

### Naturality of the kernel of the universal central extension

`K2SymbolsBrauer:T.1:classical/uce-kernel-h2-natural` · theorem · parent `K2SymbolsBrauer:T.1:classical` · implementation unchecked

Let f : G → G' be a homomorphism of perfect groups in Type with universal central extensions p : X → G and p' : X' → G'. Under the isomorphisms ker p ≅ H_2(G, Z) and ker p' ≅ H_2(G', Z) of uce-kernel-h2, the kernel map of the lift f̃ (uce-lift) is H_2(f; Z) = groupHomology.map f (id) 2. Taking f = id_G shows that the isomorphism of uce-kernel-h2 does not depend on the presentation used to build it.

**Hypotheses.**

- G, G' are perfect groups in Type with universal central extensions p, p'; f : G → G' is a homomorphism.

**Proof outline.**

1. Reduce to the Hopf models of the canonical presentations F = FreeGroup G → G and F' = FreeGroup G' → G': the isomorphisms over G and G' commute with the lifts, by the uniqueness clause of uce-lift.
2. φ = FreeGroup.map f satisfies π' ∘ φ = f ∘ π; the map it induces [F, F]/[R, F] → [F', F']/[R', F'] lies over f, so it is the lift by uniqueness.
3. Its restriction to kernels is the map of Hopf quotients, which is H_2(f; Z) by hopf-formula-natural.

**Acceptance.**

- For f = id_G the kernel map is the identity, whatever presentations are used.
- For a ring map R → S it gives the naturality of K_2(R) ≅ H_2(E(R), Z) that K2SymbolsBrauer:T.1/k2-h2-elementary asserts.

**Prerequisites.**

- `K2SymbolsBrauer:T.1:classical/uce-kernel-h2`
- `K2SymbolsBrauer:T.1:classical/uce-lift`
- `K2SymbolsBrauer:T.1:classical/hopf-formula-natural`
- `mathlib:FreeGroup.map`
- `mathlib:groupHomology.map`

**Sources.**

- `Kbook.2013`: Theorem III.5.5 (PDF p. 228, printed p. 220). The identification whose naturality in the ring the later chapters use; the source does not state the naturality, which is derived here from uce-lift and hopf-formula-natural.

### Perfectness of the Steinberg group

`K2SymbolsBrauer:T.1:classical/steinberg-perfect` · lemma · parent `K2SymbolsBrauer:T.1:classical` · implementation unchecked

For n >= 3, the finite-rank Steinberg group St_n(R) is perfect.

**Hypotheses.**

- R is an associative unital ring.
- n is at least three.
- i and j are distinct indices between one and n.
- n >= 3.

**Proof outline.**

1. For each x_ij(r), choose k different from i,j and use x_ij(r)=[x_ik(r),x_kj(1)].
2. The generators therefore lie in the commutator subgroup; subgroup generation gives finite perfectness.

**Acceptance.**

- For n >= 3, the finite-rank Steinberg group St_n(R) is perfect.

**Prerequisites.**

- `K2SymbolsBrauer:T.1/steinberg-group-finite-rank`
- `mathlib:Group.IsPerfect`

**Sources.**

- `Kbook.2013`: III.5.1 relations and III.5.5 (PDF pp. 225, 228). Paraphrase of the indicated passage; checked in the author copy, not a quotation from the published edition.

### Weyl lift words

`K2SymbolsBrauer:T.2:symbols/diagonal-lift-words` · definition · parent `K2SymbolsBrauer:T.2:symbols` · implementation unchecked

For i != j and a unit r, define w_ij(r)=x_ij(r)x_ji(-r^-1)x_ij(r). Its elementary image has block [[0,r],[-r^-1,0]] at coordinates i,j.

**Hypotheses.**

- R is an associative unital ring; r and s are commuting units.

**Proof outline.**

1. Evaluate the three indexed generators under the elementary map.
2. Multiply the 2x2 block using both inverse identities, retaining the reversed indices and minus sign.
3. The general associative-ring matrix-unit interface is G-matrix; commutative specialization is checked by the pinned decomposition.

**Acceptance.**

- For i != j and a unit r, define w_ij(r)=x_ij(r)x_ji(-r^-1)x_ij(r). Its elementary image has block [[0,r],[-r^-1,0]] at coordinates i,j.

**Prerequisites.**

- `K2SymbolsBrauer:T.1:classical/to-elementary`
- `K2SymbolsBrauer:T.1/stabilisation`
- `mathlib:Units`
- `mathlib:Matrix.diag2_decompose`
- `tauceti:Matrix.SpecialLinearGroup.diag2nUnit_decompose`

**Planning API.**

| Name | Role | Contract |
| --- | --- | --- |
| `w` | constructor | The indexed word w_ij(r) for i != j. |
| `w_phi` | compatibility | phi(w_ij(r)) has r,-r^-1 in the two off-diagonal positions. |
| `w_map` | functoriality | Unital ring homomorphisms preserve the indexed word and its elementary image. |

**Consumers.**

- K2SymbolsBrauer:T.2/steinberg-symbol — The symbol is the commutator of two indexed diagonal lifts sharing their first index.

**Unit tests.**

- `unit_sign` (test) — w_01(1) has block [[0,1],[-1,0]].
- `negative_unit` (test) — w_01(-1) has block [[0,-1],[1,0]].
- `indexed_inverse` (test) — Over Q, w_12(2) has off-diagonal entries 2 and -1/2 in positions (1,2),(2,1), and entry 1 at (0,0).

**Sources.**

- `Kbook.2013`: III.5.10.1 (PDF p. 233). Paraphrase of the indicated passage; checked in the author copy, not a quotation from the published edition.

### The symbol of a unit and its negative

`K2SymbolsBrauer:T.2:symbols/symbol-negative-unit` · theorem · parent `K2SymbolsBrauer:T.2:symbols` · implementation unchecked

For every unit r of an associative unital ring R, {r,-r}=1, without requiring 1-r to be invertible.

**Hypotheses.**

- R is an associative unital ring; r is a unit, and for the first statement one minus r is also a unit.

**Proof outline.**

1. First deduce the identity when 1-r is invertible by writing -r=(1-r)/(1-r^-1) and using Steinberg and bilinearity.
2. In the UNIVERSAL ring Z[t,t^-1], use injectivity on K2 into Z[t,t^-1,(1-t)^-1] to descend the identity.
3. Then specialize the Laurent polynomial ring by t -> r into R; do not require a map from the further localization into R.
4. Gap G-universal-negative: the universal localization injectivity in V.6.1.3 was not decomposed or supplied by a baseline declaration.

**Acceptance.**

- For every unit r of an associative unital ring R, {r,-r}=1, without requiring 1-r to be invertible.

**Prerequisites.**

- `K2SymbolsBrauer:T.2/steinberg-identity`
- `K2SymbolsBrauer:T.2/steinberg-symbol`

**Sources.**

- `Kbook.2013`: III.5.10.3-.4 (PDF p. 234). Paraphrase of the indicated passage; checked in the author copy, not a quotation from the published edition.

### Torsion in field-extension restriction kernels

`K2SymbolsBrauer:T.2:symbols/extension-kernel-torsion` · lemma · parent `K2SymbolsBrauer:T.2:symbols` · implementation unchecked

Proposed parent: `K2SymbolsBrauer:T.2:symbols:transfer-torsion`; maintainer integration is pending.

For every field extension F <= L, the kernel of K2(F) -> K2(L) is torsion.

**Hypotheses.**

- F is a field.

**Proof outline.**

1. Using filtered-colimit compatibility, reduce a vanishing element to a finitely generated subextension.
2. Choose a finite transcendence basis; rational restriction is injective by successive leading-coefficient splittings.
3. The remaining algebraic extension L/F is finite, so L is a finite free F-module and restriction of scalars gives the Quillen transfer K2(L) -> K2(F) (GeneralAlgebraicKTheory:K.3/transfer-maps-and-projection-formula, separable or not); by its projection formula, transfer after restriction is multiplication by the class of L in K0(F) = Z, that is by [L:F], which kills the original element.
4. Continuity is imported from the early connective ring model K.2/functorial-K-theory-of-a-ring; no negative or nonunital continuity is needed.

**Acceptance.**

- For every field extension F <= L, the kernel of K2(F) -> K2(L) is torsion.

**Prerequisites.**

- `K2SymbolsBrauer:T.2/rational-function-field`
- `GeneralAlgebraicKTheory:K.2/functorial-K-theory-of-a-ring`
- `GeneralAlgebraicKTheory:K.3/transfer-maps-and-projection-formula`

**Sources.**

- `Kbook.2013`: III.6.1.3 (PDF p. 239). Paraphrase of the indicated passage; checked in the author copy, not a quotation from the published edition.

### Milnor groups of algebraically closed fields

`K2SymbolsBrauer:T.2:symbols/milnor-algebraically-closed` · lemma · parent `K2SymbolsBrauer:T.2:symbols` · implementation unchecked

For an algebraically closed field F and n >= 2, K_n^M(F) is uniquely divisible. In degree one F× is divisible but need not be uniquely divisible; degree zero is Z.

**Hypotheses.**

- F is algebraically closed.
- n >= 2.

**Proof outline.**

1. Divisibility follows by taking roots in the first symbol entry.
2. Gap G-algclosed: decompose the no-p-torsion proof referred to Exercise III.7.3 and the degree-two norm argument III.6.4.
3. Correct the omitted degree restriction in III.7.2(b); C× has nontrivial roots of unity.

**Acceptance.**

- For an algebraically closed field F and n >= 2, K_n^M(F) is uniquely divisible. In degree one F× is divisible but need not be uniquely divisible; degree zero is Z.

**Prerequisites.**

- `K2SymbolsBrauer:T.2/milnor-k-theory`

**Sources.**

- `Kbook.2013`: III.7.2(b) and Exercise III.7.3 (PDF pp. 253, 265). Paraphrase of the indicated passage; checked in the author copy, not a quotation from the published edition.

### Milnor K-theory of the real field

`K2SymbolsBrauer:T.2:symbols/milnor-real` · lemma · parent `K2SymbolsBrauer:T.2:symbols` · implementation unchecked

For n >= 1, K_n^M(R) is Z/2 generated by {-1,...,-1}, direct sum a divisible subgroup. As a graded ring, K_*^M(R)/2 is F2[epsilon], with epsilon of degree one.

**Hypotheses.**

- n >= 1 for the group decomposition.
- The base field is R.

**Proof outline.**

1. Send a negative degree-one unit to epsilon and a positive one to zero. The Steinberg relation dies since a and 1-a cannot both be negative.
2. The all-minus-one symbol has order two and nonzero image, giving the torsion summand.
3. Gap G-real: prove the complementary divisibility by the indicated induction; degree zero is Z and is excluded from the direct-sum formula.

**Acceptance.**

- For n >= 1, K_n^M(R) is Z/2 generated by {-1,...,-1}, direct sum a divisible subgroup. As a graded ring, K_*^M(R)/2 is F2[epsilon], with epsilon of degree one.

**Prerequisites.**

- `K2SymbolsBrauer:T.2/milnor-k-theory`
- `K2SymbolsBrauer:T.2/milnor-alternating`

**Sources.**

- `Kbook.2013`: III.7.2(c) (PDF p. 253). Paraphrase of the indicated passage; checked in the author copy, not a quotation from the published edition.

### Bass-Tate calculation for number fields

`K2SymbolsBrauer:T.2:symbols/milnor-number-field` · theorem · parent `K2SymbolsBrauer:T.2:symbols` · implementation unchecked

For a number field F with r1 real embeddings and n >= 3, K_n^M(F) is (Z/2)^r1 via the symbols at its real places.

**Hypotheses.**

- F is a number field.
- n >= 3.

**Proof outline.**

1. Construct the product of the real sign maps at the real embeddings.
2. Gap G-Bass-Tate: the source cites Bass and Tate for bijectivity; the original proof was not obtained and this node does not claim to supply it.

**Acceptance.**

- For a number field F with r1 real embeddings and n >= 3, K_n^M(F) is (Z/2)^r1 via the symbols at its real places.

**Prerequisites.**

- `K2SymbolsBrauer:T.2/milnor-k-theory`
- `K2SymbolsBrauer:T.2:symbols/milnor-real`
- `mathlib:NumberField.InfinitePlace.nrRealPlaces`

**Sources.**

- `Kbook.2013`: III.7.2(d) (PDF p. 254). Paraphrase of the indicated passage; checked in the author copy, not a quotation from the published edition.
- `Kbook.III.chapter`: III.7.2(a),(d), PDF pp.61–62. Paraphrase of the inspected passage, not a quotation. The general global-field Milnor theorem is already owned here; its original Bass–Tate proof remains the existing gap.

### Bass-Tate vanishing over positive-characteristic global fields

`K2SymbolsBrauer:T.2:symbols/milnor-global-positive-characteristic` · theorem · parent `K2SymbolsBrauer:T.2:symbols` · implementation unchecked

If F has transcendence degree one over a finite field and n >= 3, K_n^M(F)=0.

**Hypotheses.**

- F has transcendence degree one over a finite field.
- n >= 3.

**Proof outline.**

1. Gap G-Bass-Tate: obtain and decompose the cited Bass-Tate argument; finite-field vanishing alone does not prove this transcendence-degree-one result.

**Acceptance.**

- If F has transcendence degree one over a finite field and n >= 3, K_n^M(F)=0.

**Prerequisites.**

- `K2SymbolsBrauer:T.2/milnor-k-theory`

**Sources.**

- `Kbook.2013`: III.7.2(a) (PDF p. 253). Paraphrase of the indicated passage; checked in the author copy, not a quotation from the published edition.
- `Kbook.III.chapter`: III.7.2(a),(d), PDF pp.61–62. Paraphrase of the inspected passage, not a quotation. The general global-field Milnor theorem is already owned here; its original Bass–Tate proof remains the existing gap.

### Diagonal lift words

`K2SymbolsBrauer:T.2:symbols/diagonal-lift` · definition · parent `K2SymbolsBrauer:T.2:symbols` · implementation unchecked

For i != j and a unit r, define h_ij(r)=w_ij(r)w_ij(-1). Its elementary image is diagonal with r,r^-1 in positions i,j.

**Hypotheses.**

- R is an associative unital ring; r and s are commuting units.

**Proof outline.**

1. Use the separately defined w word and its image.
2. Multiply the two monomial images to obtain the indexed diagonal entries.

**Acceptance.**

- For i != j and a unit r, define h_ij(r)=w_ij(r)w_ij(-1). Its elementary image is diagonal with r,r^-1 in positions i,j.

**Prerequisites.**

- `K2SymbolsBrauer:T.2:symbols/diagonal-lift-words`

**Planning API.**

| Name | Role | Contract |
| --- | --- | --- |
| `h` | constructor | For i != j and a unit r, define h_ij(r)=w_ij(r)w_ij(-1). Its elementary image is diagonal with r,r^-1 in positions i,j. |
| `h_phi` | compatibility | The image is diag(r,r^-1) on coordinates i,j. |
| `h_map` | functoriality | Ring homomorphisms preserve h_ij(r), retaining the two indices. |

**Consumers.**

- K2SymbolsBrauer:T.2/steinberg-symbol — The symbol is the commutator of two indexed diagonal lifts sharing their first index.

**Unit tests.**

- `identity_image` (test) — h_01(1) has identity elementary image.
- `inverse_parameter` (test) — Over Q, h_01(2) has diagonal image (2,1/2,1).
- `indexed_positions` (test) — Over Q, h_12(2) has diagonal image (1,2,1/2).

**Sources.**

- `Kbook.2013`: III.5.10.1 (PDF p. 233). Paraphrase of the indicated passage; checked in the author copy, not a quotation from the published edition.

### Perfectness of the stable Steinberg group

`K2SymbolsBrauer:T.1:classical/stable-steinberg-perfect` · lemma · parent `K2SymbolsBrauer:T.1:classical` · implementation unchecked

The stable Steinberg group St(R) is perfect.

**Hypotheses.**

- R is an associative unital ring.

**Proof outline.**

1. Every stable generator is the image of a finite-stage generator and thus a commutator by finite perfectness.
2. Stable generators generate the group, so its commutator subgroup is the whole group.

**Acceptance.**

- The stable Steinberg group St(R) is perfect.

**Prerequisites.**

- `K2SymbolsBrauer:T.1:classical/steinberg-perfect`
- `K2SymbolsBrauer:T.1/stabilisation`
- `mathlib:Group.IsPerfect`

**Sources.**

- `Kbook.2013`: III.5.1 relations and III.5.5 (PDF pp. 225, 228). Paraphrase of the indicated passage; checked in the author copy, not a quotation from the published edition.

### The kernel complex of a surjective group map

`K2SymbolsBrauer:T.1:classical/quotient-bar-kernel` · construction · parent `K2SymbolsBrauer:T.1:classical` · implementation unchecked

For a surjection q:E→Q of discrete groups, let C_*(E) and C_*(Q) be the pinned inhomogeneous bar complexes with trivial integral coefficients, and L(q)=ker(chainsMap(q,id)). It sits in a short exact sequence 0→L(q)→C_*(E)→C_*(Q)→0. In degree n, L(q) is the kernel of the free-abelian pushforward on E^n→Q^n, generated by [a]−[b] with q^n(a)=q^n(b). In degree0 the map is identity on Z, so L(q)_0=0.

**Hypotheses.**

- Groups are in Type at the same universe as Z, as required by the pinned groupHomology interface.
- Surjectivity of q is required for the degreewise short exactness. Coefficients are specifically trivial Z; this node does not claim arbitrary-coefficient Hochschild–Serre.

**Proof outline.**

1. Use groupHomology.chainsMap with the identity coefficient map. Its degree-n pushforward is surjective by chainsMap_f_map_epi: coordinatewise preimages lift every bar basis element.
2. Take the categorical kernel in chain complexes. Evaluation preserves this kernel by HomologicalComplex.eval_preservesLimit_of_hasKernel_f, giving the explicit degreewise description and the short exact sequence.
3. Choose one preimage in each tuple fibre. For a finitely supported integer chain in the kernel, group coefficients fibrewise: their sum in each fibre is zero. Subtract the chosen basis representative in each term to write it as a finite sum of pair differences. The only linear relations between those differences are [a]−[b]+[b]−[c]=[a]−[c] within a fibre and their additive consequences.
4. For n=0 there is a unique tuple and the coefficient map is identity, hence the degree-zero kernel vanishes. Morphisms of quotient maps induce kernel chain maps by the commuting square and chainsMap_comp.

**Acceptance.**

- A nonsurjective group map does not give the displayed short exact sequence by this proof.
- The kernel in degree0 is zero, not an extra augmentation copy of Z.

**Prerequisites.**

- `mathlib:groupHomology.inhomogeneousChains`
- `mathlib:groupHomology.chainsMap`
- `mathlib:groupHomology.chainsMap_f_map_epi`
- `mathlib:groupHomology.chainsMap_f_single`
- `mathlib:groupHomology.chainsMap_comp`
- `mathlib:HomologicalComplex.eval_preservesLimit_of_hasKernel_f`
- `mathlib:Rep.trivial`

**Planning API.**

| Name | Role | Contract |
| --- | --- | --- |
| `GroupQuotient.barKernel` | data | The kernel chain complex L(q), using trivial integral bar chains. |
| `GroupQuotient.barKernelShortComplex` | data | The kernel/inclusion/pushforward short complex of chain complexes. |
| `GroupQuotient.barKernelShortExact` | characterisation | It is short exact when q is surjective. |
| `GroupQuotient.barKernel_zero` | simp | The degree-zero object is zero. |
| `GroupQuotient.barKernel_pairGenerators` | characterisation | Degree-n kernels are generated by differences of tuples with equal quotient images. |
| `GroupQuotient.barKernel_map` | functoriality | A commuting square of quotient maps induces the canonical kernel chain map. |

**Consumers.**

- T.1:classical/hopf-four-term-sequence and hopf-formula-natural — For a surjection q:E→Q of discrete groups, let C_*(E) and C_*(Q) be the pinned inhomogeneous bar complexes with trivial integral coefficients, and L(q)=ker(chainsMap(q,id)). It sits in a short exact sequence 0→L(q)→C_*(E)→C_*(Q)→0. In degree n, L(q) is the kernel of the free-abelian pushforward on E^n→Q^n, generated by [a]−[b] with q^n(a)=q^n(b). In degree0 the map is identity on Z, so L(q)_0=0.

**Unit tests.**

- `bar_kernel_identity` (degenerate) — For q=id_E the kernel complex is zero in every degree.
- `bar_kernel_zero_degree` (degenerate) — For every surjective q, L(q)_0=0.
- `bar_kernel_tuple_difference` (computation) — [a]−[b] belongs to L(q)_n exactly when the two tuple images agree.
- `bar_kernel_nonsurjective` (non-example) — For 1→C₂ the degree-one bar pushforward misses the nonidentity basis element.

**Sources.**

- `Weibel.HA.Groups`: §6.8, Low Degree Terms6.8.3, printed p.196/PDF37; read text and image 2026-10-02. The integral trivial-coefficient five-term result. The packet gives a direct kernel-of-bar-chains proof rather than claiming that this argument is printed in the source; differential and connecting-map conventions are checked against the pinned Lean statements.

### First homology of the quotient bar kernel

`K2SymbolsBrauer:T.1:classical/quotient-bar-kernel-h1` · comparison · parent `K2SymbolsBrauer:T.1:classical` · implementation unchecked

With N=ker(q), there is a canonical isomorphism H₁(L(q))≅N/[E,N], written additively. It sends the cycle [a]−[b] with q(a)=q(b) to the class of ab⁻¹. The inverse sends n to the homology class of [n]−[1]. Under this isomorphism the map H₁(L(q))→H₁(E,Z)=E_ab is the inclusion-induced map N/[E,N]→E_ab.

**Hypotheses.**

- Use the unnormalised pinned bar differential ∂[a|b]=[b]−[ab]+[a]; no silent normalized-bar replacement.
- The quotient N/[E,N] is the central abelian kernel of relation-central-extension; trivial coefficients make ∂₁ zero.

**Proof outline.**

1. Since L₀=0, H₁(L)=L₁/im(∂₂:L₂→L₁). On fibre differences define [a]−[b]↦class(ab⁻¹). The fibre triangle relation holds because (ab⁻¹)(bc⁻¹)=ac⁻¹, so this gives a canonical homomorphism, independent of the representatives chosen to express a chain.
2. Generators of L₂ are [a|b]−[a′|b′] with q(a)=q(a′), q(b)=q(b′). Their boundaries map to class(bb′⁻¹)−class(ab(a′b′)⁻¹)+class(aa′⁻¹)=0, since ab(a′b′)⁻¹ is the product of the conjugate a(bb′⁻¹)a⁻¹ and aa′⁻¹. Thus the homomorphism descends.
3. Set v(n)=class([n]−[1]) in H₁(L). The boundary of [n|m]−[1|1] proves v(nm)=v(n)+v(m). The boundaries of [a|n]−[a|1] and [n|a]−[1|a] prove v(n)=class([an]−[a])=class([na]−[a]), giving v(ana⁻¹)=v(n). Therefore v kills [E,N] and descends to its quotient.
4. The forward composite sends v(n) to n. For q(a)=q(b), put n=ab⁻¹; the boundary of [n|b]−[1|b] identifies v(n) with class([a]−[b]). Pair generators prove the other composite identity.
5. The inclusion L₁→C₁(E) sends the inverse generator [n]−[1] to the abelianisation class n because [1] is a bar boundary. Use the pinned H1AddEquivOfIsTrivial generator formula to identify this with the actual inclusion map.

**Acceptance.**

- The quotient is by mixed commutators [E,N], not only [N,N].
- The sign is fixed by [a]−[b]↦ab⁻¹ and the pinned positive boundary ∂[a|b].
- For S₃→C₂, conjugation inverts N=C₃ and its mixed-commutator quotient is zero; abelianising N alone would incorrectly give C₃.

**Prerequisites.**

- `K2SymbolsBrauer:T.1:classical/quotient-bar-kernel`
- `K2SymbolsBrauer:T.1:classical/relation-central-extension`
- `K2SymbolsBrauer:T.1:classical/h1-trivial-perfect`
- `mathlib:groupHomology.d₂₁_single`
- `mathlib:groupHomology.d₁₀_eq_zero_of_isTrivial`
- `mathlib:groupHomology.H1AddEquivOfIsTrivial`
- `mathlib:groupHomology.H1π_comp_map`

**Sources.**

- `Weibel.HA.Groups`: §6.8, Low Degree Terms6.8.3, printed p.196/PDF37; read text and image 2026-10-02. The integral trivial-coefficient five-term result. The packet gives a direct kernel-of-bar-chains proof rather than claiming that this argument is printed in the source; differential and connecting-map conventions are checked against the pinned Lean statements.

### The integral five-term sequence of a group quotient

`K2SymbolsBrauer:T.1:classical/hochschild-serre-integral-five-term` · construction · parent `K2SymbolsBrauer:T.1:classical` · implementation unchecked

For surjective q:E→Q with N=ker(q), construct the exact sequence H₂(E,Z)→H₂(Q,Z)→ N/[E,N]→E_ab→Q_ab→0. The outside homology maps are the pinned groupHomology.map with identity integral coefficients; the middle map is the connecting map of the quotient-bar kernel short exact sequence followed by quotient-bar-kernel-h1. This owns the required discrete trivial-integral-coefficient Hochschild–Serre low-degree input in T.1:classical, before plus constructions or spectra.

**Hypotheses.**

- Use the specified actual bar kernel and its fixed H₁ isomorphism; no arbitrary carrier isomorphism is substituted.
- No claim is made here to construct the full Hochschild–Serre spectral sequence or its arbitrary-coefficient version.

**Proof outline.**

1. Apply the pinned ShortExact.δ and homology_exact₁–₃ to 0→L(q)→C(E)→C(Q)→0 in degrees2 and1. Because H₀(L(q))=0, its long exact sequence ends with a surjection H₁(E)→H₁(Q).
2. Replace H₁(L(q)) by N/[E,N] using the explicit isomorphism. Replace H₁(E),H₁(Q) by abelianisations using the pinned generator formulas. The inclusion and quotient maps agree on all bar1-generators.
3. For a 2-cycle z of C(Q), choose a 2-chain z̃ of C(E) mapping to z. Then ∂z̃ lies in L₁ and δ[z] is its class under the specified isomorphism. The pinned ShortExact.δ_apply has this positive sign. Two lifts differ by an element of L₂, so their boundaries differ by an L-boundary. If z changes by ∂w for w in C₃(Q), lift w to C₃(E) and change z̃ by its boundary; its next boundary is unchanged because ∂²=0. Any other lift again differs by L₂. Thus the map is well defined.
4. The result is the five-term sequence stated in Weibel6.8.3, proved here directly at chain level. It does not infer injectivity from freeness until the following free-presentation specialization.

**Acceptance.**

- The transgression is the canonical positive connecting map, and exactness includes the H₂(Q) term.
- For q=id_E the sequence has identity H₂ map, zero middle quotient and identity abelianisation map.

**Prerequisites.**

- `K2SymbolsBrauer:T.1:classical/quotient-bar-kernel`
- `K2SymbolsBrauer:T.1:classical/quotient-bar-kernel-h1`
- `K2SymbolsBrauer:T.1:classical/h1-trivial-perfect`
- `mathlib:CategoryTheory.ShortComplex.ShortExact.δ`
- `mathlib:CategoryTheory.ShortComplex.ShortExact.δ_apply`
- `mathlib:CategoryTheory.ShortComplex.ShortExact.homology_exact₁`
- `mathlib:CategoryTheory.ShortComplex.ShortExact.homology_exact₂`
- `mathlib:CategoryTheory.ShortComplex.ShortExact.homology_exact₃`
- `mathlib:groupHomology.map`

**Planning API.**

| Name | Role | Contract |
| --- | --- | --- |
| `GroupQuotient.transgression` | data | The specified map H₂(Q,Z)→N/[E,N] from the bar-kernel connecting map. |
| `GroupQuotient.transgression_lift` | characterisation | On a 2-cycle it is the relative class of the positive boundary of any lift. |
| `GroupQuotient.fiveTerm_exact` | relation | Exactness at H₂(Q,Z), N/[E,N] and E_ab, and surjectivity onto Q_ab. No exactness at the first term H₂(E,Z) is asserted without a preceding term. |
| `GroupQuotient.fiveTerm_maps` | compatibility | The H₂ maps and abelianisation maps are the pinned homology maps of q and inclusion. |

**Consumers.**

- T.1:classical/hopf-four-term-sequence and hopf-formula-natural — For surjective q:E→Q with N=ker(q), construct the exact sequence H₂(E,Z)→H₂(Q,Z)→δ N/[E,N]→E_ab→Q_ab→0. The outside homology maps are the pinned groupHomology.map with identity integral coefficients; the middle map is the connecting map of the quotient-bar kernel short exact sequence followed by quotient-bar-kernel-h1. This owns the required discrete trivial-integral-coefficient Hochschild–Serre low-degree input in T.1:classical, before plus constructions or spectra.

**Unit tests.**

- `five_term_identity` (degenerate) — For q=id the outside maps are identity and the middle quotient is zero.
- `five_term_abelian_extension` (computation) — For C₄→C₂ the middle quotient C₂ maps to C₄ by the element2, and the final map is reductionmod2.
- `five_term_noncentral` (non-example) — For S₃→C₂, N/[E,N]=0 although N_ab=C₃.
- `five_term_positive_sign` (computation) — For a chosen2-cycle lift the transgression uses +∂z̃, matching ShortExact.δ_apply.

**Sources.**

- `Weibel.HA.Groups`: §6.8, Low Degree Terms6.8.3, printed p.196/PDF37; read text and image 2026-10-02. The integral trivial-coefficient five-term result. The packet gives a direct kernel-of-bar-chains proof rather than claiming that this argument is printed in the source; differential and connecting-map conventions are checked against the pinned Lean statements.

### Naturality of the integral quotient five-term sequence

`K2SymbolsBrauer:T.1:classical/hochschild-serre-five-term-natural` · lemma · parent `K2SymbolsBrauer:T.1:classical` · implementation unchecked

A commuting square of surjections q:E→Q and q′:E′→Q′ with maps a:E→E′, b:Q→Q′ induces a commuting diagram of the integral five-term sequences. On H₂ it is groupHomology.map(a,id,2) and groupHomology.map(b,id,2); on N/[E,N] it sends class(n) to class(a(n)); every connecting square commutes with the fixed positive sign.

**Hypotheses.**

- The kernel inclusion a(N)⊂N′ follows from q′a=bq.
- Use actual chain maps and the canonical quotient isomorphism; no choice of free lift enters b’s H₂ map.

**Proof outline.**

1. chainsMap_comp turns the group square into a commuting bar-chain square. Its restriction gives the kernel chain map and a morphism of the short exact complexes.
2. On pair generators of L₁, the kernel-H₁ comparison sends the mapped difference [a(x)]−[a(y)] to class(a(xy⁻¹)). Thus the H₁ comparison is natural.
3. Apply the pinned HomologicalComplex.HomologySequence.δ_naturality to the short-exact-complex morphism. Together with the preceding generator calculation this gives the transgression square.
4. The H₂ components are literally HomologicalComplex.homologyMap of chainsMap, which is the definition of groupHomology.map. The H₁ components agree with abelianisation on generators by H1π_comp_map. This proves map-level compatibility and sign, not only abstract isomorphism of the terms.

**Acceptance.**

- For identity and composite quotient-square maps the induced sequence maps are identity and composite.
- Different middle lifts inducing the same b have the same H₂(Q) map and hence the same induced map of Hopf kernels.

**Prerequisites.**

- `K2SymbolsBrauer:T.1:classical/hochschild-serre-integral-five-term`
- `K2SymbolsBrauer:T.1:classical/quotient-bar-kernel-h1`
- `mathlib:groupHomology.chainsMap_comp`
- `mathlib:groupHomology.map`
- `mathlib:groupHomology.H1π_comp_map`
- `mathlib:HomologicalComplex.HomologySequence.δ_naturality`

**Sources.**

- `Weibel.HA.Groups`: §6.8, Low Degree Terms6.8.3, printed p.196/PDF37; read text and image 2026-10-02. The integral trivial-coefficient five-term result. The packet gives a direct kernel-of-bar-chains proof rather than claiming that this argument is printed in the source; differential and connecting-map conventions are checked against the pinned Lean statements.

## Remaining gaps

### G-Matsumoto: theorem stated without normal-form decomposition

The K-book states Matsumoto's theorem and refers to Milnor's 1971 book, section 12, for a self-contained proof; that book was not obtained. The node states the theorem, records that the normal-form and presentation argument is what the proof consists of, and does not pretend that checking the relations is a proof. A continuation that obtains Milnor's book should decompose that argument.

Needed by: `K2SymbolsBrauer:T.2/matsumoto`.

### Two statements are used exactly as the K-book gives them

The injectivity of the subgroup generated by the symbols x_in(r) into E(R), which the source relegates to an exercise and which the proof of Steinberg's centre theorem needs, and the generation of K_2 by symbols for semilocal rings, attributed to Milnor and to Dennis and Stein. Neither original was obtained. The Dennis-Stein symbols themselves belong to T.6 and are owned by the companion packet for the T.3 part.

Needed by: `K2SymbolsBrauer:T.1/k2-is-centre`, `K2SymbolsBrauer:T.2/symbols-generate`.

### The general form of the symbol of a unit with its negative rests on a later chapter

The statement that the symbol of r with minus r is trivial for every unit, even when one minus r is not a unit, is deduced in the source from an injectivity between K_2 of two localisations proved in its chapter five, or from a direct proof in Milnor's book. Neither is decomposed here, and the node records the dependence.

Needed by: `K2SymbolsBrauer:T.2/symbol-consequences`, `K2SymbolsBrauer:T.2:symbols/symbol-negative-unit`.

### Bass and Tate are cited for two Milnor K-theory computations

The vanishing of the Milnor K-groups in degree at least three for a global field of finite characteristic, and the isomorphism with the elementary abelian two-group of rank r_1 in degree at least three for a number field, are both attributed by the source to Bass and Tate. That paper was not obtained; the node states the results with the attribution.

Needed by: `K2SymbolsBrauer:T.2:symbols/milnor-number-field`, `K2SymbolsBrauer:T.2:symbols/milnor-global-positive-characteristic`.

### G-matrix: associative-ring elementary calculus

Pinned transvection and diagonal identities inspected are commutative-ring statements. Construct the general associative-ring matrix units and prove the three index cases, reverse product order and w/h images; reconcile U.1 ownership rather than declaring this proof complete.

Needed by: `K2SymbolsBrauer:T.1/elementary-matrices-satisfy`, `K2SymbolsBrauer:T.2/steinberg-symbol`, `K2SymbolsBrauer:T.1:classical/to-elementary`, `K2SymbolsBrauer:T.2:symbols/diagonal-lift-words`, `K2SymbolsBrauer:T.2:symbols/diagonal-lift`.

### G-colimit: group colimit and finite representatives

The cited DirectLimit is a Type quotient. Supply group operations, compatible homomorphism lift, homomorphism extensionality, finite-representative equality and the stable surjectivity proof.

Needed by: `K2SymbolsBrauer:T.1/stabilisation`, `K2SymbolsBrauer:T.1/steinberg-is-uce`.

### G-centre: stable elementary centre and column injectivity

Read and decompose Exercises III.1.8 and III.5.2 plus the column normalization used by III.5.2.1. These missing lemmas cannot be replaced by Subgroup.center.

Needed by: `K2SymbolsBrauer:T.1/k2-is-centre`.

### G-classification: trivial-action comparison

Read the fixed-action normalized-section hypotheses in the pinned Tau Ceti theorem. Supply centrality iff trivial induced action and full classification including all classes, keeping fixed kernel identifications.

Needed by: `K2SymbolsBrauer:T.1:classical/central-extension-classification`.

### G-lifted-relations: finite splitting details

For III.5.5.1, expand the Hall-Witt special case, intermediate-index independence and the omitted additive relation. Splitting over St_n alone does not prove centrality of St_n->E_n.

Needed by: `K2SymbolsBrauer:T.1/finite-rank-splitting`.

### G-cover-Hurewicz: chosen plus-cover and Hurewicz maps

The early K.2:plus and H.3 documents are the right owners, but require explicit BE-plus cover and natural Hurewicz comparison interfaces for the K2-pi2 composite.

Needed by: `K2SymbolsBrauer:T.1/k2-pi2`.

### G-Whitehead: block elementary factorization

Obtain the generator-level U.1 Whitehead block factorization diag(P,P^-1) and its compatible elementary lifts to prove GL-conjugation invariance of star products.

Needed by: `K2SymbolsBrauer:T.2/star-product`.

### G-universal-negative: Laurent-ring localization injection

The general negative-unit identity uses the universal Laurent polynomial ring and its localization, as in V.6.1.3. That proof was not decomposed; no arbitrary-ring localization-injectivity claim is made.

Needed by: `K2SymbolsBrauer:T.2:symbols/symbol-negative-unit`.

### G-finite-units: cyclicity and finite counting

The finite-field K2 proof needs a pinned cyclicity declaration for Fq× and a finite-cardinality implementation. ZMod is only a carrier.

Needed by: `K2SymbolsBrauer:T.2/k2-finite-field`.

### G-graded-quotient: homogeneous ideal and grading

Construct the Steinberg ideal as homogeneous degree-two generators and prove the quotient degree decomposition, generators, universal property and symbol functoriality. TensorAlgebra and RingQuot alone do not supply this.

Needed by: `K2SymbolsBrauer:T.2/milnor-k-theory`, `K2SymbolsBrauer:T.2/graded-map`.

### G-algclosed: unique divisibility in degrees at least two

Obtain/decompose Exercise III.7.3 and the norm argument from III.6.4; the algebraically closed computation is not valid in degrees zero and one.

Needed by: `K2SymbolsBrauer:T.2:symbols/milnor-algebraically-closed`.

### G-real: complementary divisibility

Expand the induction for the real positive-degree divisible summand; the sign map proves a nonzero Z/2 summand but not the full decomposition.

Needed by: `K2SymbolsBrauer:T.2:symbols/milnor-real`.

### G-Bass-Tate: arithmetic Milnor computations

The source attributes number-field and positive-characteristic global-field computations to Bass-Tate. These external proofs were not obtained; each result now has its own node.

Needed by: `K2SymbolsBrauer:T.2:symbols/milnor-number-field`, `K2SymbolsBrauer:T.2:symbols/milnor-global-positive-characteristic`.

### G-product-symbol: equality with the chosen classical map

Read IV.1.10-.1 and request the map-level product/symbol comparison from K.7. The product map descends by the Steinberg relation, but its degree-two isomorphism needs this compatibility and Matsumoto.

Needed by: `K2SymbolsBrauer:T.2/graded-map`, `K2SymbolsBrauer:T.2/graded-map-degree-three`.

## Requests to existing owners

- `KTheoryLowDegrees:U.1` — Finite/stable GL and elementary subgroups, stabilization embeddings, general associative-ring elementary units, E normal/perfect with trivial stable centre, and block diag(P,P^-1) elementary factorization. The existing document owns these; its current packet interfaces are still required.

- `KTheoryLowDegrees:U.2` — Classical quotient K1=GL/E with quotient map and exactness, for the separate classical K2-K1 sequence; this does not depend on late K2 comparison.

- `KTheoryLowDegrees:U.3` — For fields, the canonical unit/determinant K1 isomorphism and the unit-class map, used to specify degree one of the product comparison.

- `GeneralAlgebraicKTheory:K.2:plus` — The early ring K-space zero component BGL(R)+ with basepoint and ring-map functoriality. Do not import K.2:low-degree-comparisons, which consumes this K2 model.

- `GeneralAlgebraicKTheory:K.7` — Quillen K-theory products with degree-one Steinberg relation, equality of degree-two products with the classical symbol (IV.1.10-.1), graded functoriality, and filtered-colimit compatibility for restriction-kernel reduction.

- `StableHomotopyKTheory:H.3` — Acyclic plus construction with the relative comparison identifying BE(R)+ as the simply connected cover of BGL(R)+. The covering and Hurewicz naturality bridge is explicitly missing; the H.3 document does not assert an existing implementation.

## Stage proposals awaiting maintainer integration

### Separate the transfer corollary from elementary field symbols



Create T.2:symbols:transfer-torsion after T.2:symbols, GeneralAlgebraicKTheory K.3 and K.2:plus, and move extension-kernel-torsion there with its id unchanged. The elementary Matsumoto stage does not need Quillen transfer. The graded-map stage imports K.7:products rather than the late K.7 umbrella. Connective filtered continuity comes from the early ring model, not negative/nonunital K.7.

## Source discrepancies

### K2SymbolsBrauer/E1

III.7.2(b), author copy 2013-08-29, printed p.245 / PDF p.253

Insert n >= 2. In degree one the group is F× and is divisible but can have torsion; degree zero is Z.

Take F=C. K1^M(C)=C× contains -1 of order two, so multiplication by two is not injective; K0^M(C)=Z is not divisible.

The same author copy, Exercise III.7.3 (PDF p.265), explicitly restricts the theorem to n >= 2. A published erratum was not verified because its live URL returned 404; no novelty claim.

- https://sites.math.rutgers.edu/~weibel/Kbook.html (author source index; read 2026-09-29)
- https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.errata.pdf (linked errata; live request returned HTTP 404; cached search extract is incomplete)
- https://www.ams.org/books/gsm/145/ (publisher; HTTP 403; published text not obtained)

### K2SymbolsBrauer/E2

III.5.5.1, author copy 2013-08-29, printed p.220 / PDF p.228, final sentence of statement

The splitting proof alone supplies universality only after centrality of the map St_n(R)->E_n(R) is separately justified. Retain splitting for n>=5; state a finite-rank UCE conclusion conditionally on centrality or a verified kernel-stability hypothesis.

Recognition III.5.4 starts with a central extension. The proof in III.5.5.1 splits central extensions over St_n, but does not establish that the different map St_n->E_n has central kernel. The stable centre proof increases the rank arbitrarily and cannot by itself supply that missing finite-rank input.

No verified correction found in the accessible material; no claim is made that the conclusion is false for a specific ring, or that this observation is new.

- https://sites.math.rutgers.edu/~weibel/Kbook.html (author source index; read 2026-09-29)
- https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.errata.pdf (linked errata; live request returned HTTP 404; cached search extract is incomplete)
- https://www.ams.org/books/gsm/145/ (publisher; HTTP 403; published text not obtained)

### K2SymbolsBrauer/E-central-subgroup-coefficients

Example6.8.4, printed p.196/PDF37 of the inspected Cambridge chapter scan; hash in sourceVersions; text and image read2026-10-02.

For the asserted trivial quotient action, take A with trivial G-action (in particular A=Z, the following example’s coefficients). Centrality of H alone does not imply the statement for an arbitrary G-module A.

Take H=1, G=C₂ and A=Z with the nonidentity element acting by−1. Then H lies in the centre, but H₀(1;A)=A and its induced G/H action is multiplication by−1, which is nontrivial. The integral trivial-coefficient five-term construction in this packet meets the corrected qualification.

Novelty not established; scoped only to the inspected published chapter scan. The author’s1994-to1995 corrections were inspected at their group-homology entries and no matching correction established; the current1995 errata link could not be fetched.

- https://sites.math.rutgers.edu/~weibel/Hbook-corrections.html opened2026-10-02.
- https://www.math.rutgers.edu/~weibel/Books/Hbook.errors.edition1.pdf group-homology entries inspected2026-10-02.
- https://sites.math.rutgers.edu/~weibel/Books/Hbook.errors.edition2.pdf opened2026-10-02: retrieval failed.
- Author-site searches for6.8.4 and p.196 on2026-10-02; no matching correction established.

## Reproduce the finite relative-bar checks

This standard-library Python checks the degree-one relative bar relation matrices against N/[E,N] modulo 2, 3 and 5 for five surjections, including the noncentral S3 → C2 case. It is a finite regression check, not a proof of the integral or naturality theorem. Save and run it outside the repository; all five cases passed on 2026-10-02.

```python
"""Independent finite coefficient check of the relative bar H1 model."""
from itertools import product, permutations
import json

def subgroup(gs, mul, inv, one):
    ans={one,*gs}
    while True:
        nxt=ans|{inv(x) for x in ans}|{mul(x,y) for x in ans for y in ans}
        if nxt==ans:return ans
        ans=nxt

def rank(rows,p):
    if not rows:return 0
    a=[[x%p for x in row] for row in rows]; pivot=0
    for j in range(len(a[0])):
        k=next((i for i in range(pivot,len(a)) if a[i][j]),None)
        if k is None:continue
        a[pivot],a[k]=a[k],a[pivot]
        t=pow(a[pivot][j],-1,p);a[pivot]=[x*t%p for x in a[pivot]]
        for i in range(len(a)):
            if i!=pivot:
                t=a[i][j];a[i]=[(x-t*y)%p for x,y in zip(a[i],a[pivot])]
        pivot+=1
        if pivot==len(a):break
    return pivot

def check(name,elts,mul,inv,one,q):
    fibres={}
    for x in elts:fibres.setdefault(q(x),[]).append(x)
    reps={k:v[0] for k,v in fibres.items()}
    basis=[x for x in elts if x!=reps[q(x)]]
    tf={}
    for a,b in product(elts,repeat=2):tf.setdefault((q(a),q(b)),[]).append((a,b))
    rows=[]
    def boundary(a,b):
        v={x:0 for x in elts}
        v[b]+=1;v[mul(a,b)]-=1;v[a]+=1
        return v
    for pairs in tf.values():
        root=boundary(*pairs[0])
        for pair in pairs[1:]:
            v={x:boundary(*pair)[x]-root[x] for x in elts}
            assert all(sum(v[x] for x in fibre)==0 for fibre in fibres.values())
            rows.append([v[x] for x in basis])
    N={x for x in elts if q(x)==q(one)}
    mixed=subgroup([mul(mul(mul(a,n),inv(a)),inv(n)) for a in elts for n in N],mul,inv,one)
    assert mixed<=N
    dims={}
    for p in (2,3,5):
        np=subgroup(mixed|{power(x,p,mul,one) for x in N},mul,inv,one)
        order=len(N)//len(np);expected=0
        while order>1:
            assert order%p==0;order//=p;expected+=1
        actual=len(basis)-rank(rows,p)
        assert actual==expected,(name,p,actual,expected)
        dims[str(p)]=actual
    return {'case':name,'groupOrder':len(elts),'kernelOrder':len(N),
            'mixedCommutatorOrder':len(mixed),'L1Rank':len(basis),
            'H1ModPDims':dims,'result':'pass'}

def power(x,n,mul,one):
    y=one
    for _ in range(n):y=mul(y,x)
    return y

results=[]
for m,k in ((4,2),(3,3),(2,1)):
    results.append(check(f'C{m}->C{k}',list(range(m)),lambda a,b:(a+b)%m,
                         lambda a:(-a)%m,0,lambda a:a%k))
elts=list(permutations(range(3)));one=tuple(range(3))
def mul(a,b):return tuple(a[b[i]] for i in range(3))
def inv(a):return tuple(a.index(i) for i in range(3))
def sign(a):return sum(a[i]>a[j] for i in range(3) for j in range(i+1,3))%2
results.append(check('S3->C2',elts,mul,inv,one,sign))
elts=list(product(range(2),repeat=2))
results.append(check('C2xC2->1',elts,lambda a,b:tuple((x+y)%2 for x,y in zip(a,b)),lambda a:a,(0,0),lambda a:0))
print(json.dumps(results,indent=2))
```
