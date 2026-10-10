# Isocrystals, vector bundles and Banach–Colmez spaces

The Fargues–Fontaine curve turns Frobenius modules into vector bundles and turns their sections and first cohomology into geometric objects. This roadmap develops that passage for a nonarchimedean local coefficient field: finite isocrystals and their slope blocks, analytic bundles and geometric Harder–Narasimhan theory, algebraization and classification, Banach–Colmez spaces, and variation over perfectoid bases. Its main exports are the classification of bundles at a geometric point, relative slope filtrations and local-system comparisons, and the properness and smoothness results for Banach–Colmez constructions used in the geometry of Bun_G.

The geometric classification is a bijection on isomorphism classes of finite isocrystals and bundles after choosing the constant-field embedding. It does not identify all morphisms: a map between different slopes can exist on the curve when the corresponding isocrystal map is zero. Families retain their descent data and need separate theorems; their bundles are not classified by one global direct sum of standard blocks.

## Scope and neighbouring roadmaps

The relative curve, its coefficient rings and its sites enter through the following interfaces. A reference such as `RelativeFarguesFontaine:RF0/ramified-witt-universal-property` names a specific target in that roadmap; references to a whole layer mean its stated interface. The prerequisites alongside each target below specify the exact use.

- **Relative Fargues–Fontaine** supplies RF0 ramified Witt coefficients, analytic annuli and their normalized Frobenius; RF1 the analytic quotient and the KL relative schematic curve; RF2 untilt divisors and completed local period rings; RF3 the rank-one twists, homogeneous section ring and partial homogeneous charts. This roadmap constructs the general isocrystal-to-bundle functor, proves that the charts cover, and establishes GAGA, degree and classification. A partial chart map is not the global algebraization theorem.
- **Perfectoid Spaces** supplies tilting, untilting, affinoid approximation and the finite étale comparison. **Diamonds and v-Stacks**, **Diamond Étale Cohomology**, and **Diamond Six Operations** supply the v/pro-étale sites, locally profinite torsor descent, locally spatial representability, properness and cohomological smoothness. The general contracting-action criterion below uses spectral topology; its Banach–Colmez application is the specialization developed here.
- **Finite Flat Groups and Integral p-adic Hodge Theory**, layers R07.1–R07.2, supplies Lubin–Tate groups and the normalized crystalline Dieudonné Hom comparison. **p-adic Hodge Theory**, layers R06.1–R06.2, supplies the period-ring functors and the admissible semistable representation input. The geometric universal cover and its section comparison belong here. Local reciprocity uses the arithmetic Artin map supplied by Tau Ceti's **Class Field Theory**; Lubin–Tate theory uses the integral p-adic Hodge prerequisites above.
- **Scheme and Stack Foundations**, layers SF.0–SF.1, supplies the generic coherent/finite-projective and torsion-pair tilt machinery, trace adjunctions and effective finite Galois descent. **Adic Étale Geometry:A1** supplies the analytic affine-line diamond comparison, with perfected analytic affine lines in equal characteristic. **p-adic Differential Equations and Rigid Cohomology:RD.2** supplies the special/generic polygon comparison over perfect analytic residue fields. Curve-specific arguments use these results without constructing parallel foundations.
- Tau Ceti's **Algebraic Vector Bundles**, layers L0A–L0C, supplies schematic finite locally free sheaves, rank, pullback, tensor, dual and determinant. Its current library category `TauCeti.AlgebraicGeometry.FiniteLocallyFreeSheaf` supplies the schematic specialization of `CurveBundle`; its generic infrastructure is imported. The analytic curve carrier, annular descent and analytic/schematic comparison remain the curve-specific work here.
- Tau Ceti's **Local Fields and Ramification** supplies local fields, unramified extensions and arithmetic Frobenius; **Reductive Groups, Part II:RG2.0.4** supplies their completed maximal unramified extension, extended Frobenius and fixed field. The ramified Witt comparison uses RF0. **Class Field Theory**, Layer 5, supplies cyclic algebras and the local Brauer invariant. **Semisimple Algebras** supplies the algebraic endomorphism and matrix algebra infrastructure. The sign relating the invariant to the chosen slope convention is a theorem here.
- **Reductive Groups**, Layer 1, supplies the field-valued representation/comodule dictionary; **Reductive Groups, Part II:RG2.3.1, RG2.3.7** supplies smooth affine integral models and Lang's theorem. The integral group-torsor target below includes the required integral tensor-fibre-functor reconstruction, using [SW][SW], Theorems 19.5.1–19.5.2, pp. 178–180. This reconstruction is stronger than the field-valued dictionary.
- **v-Stack Sheaves and Lisse Categories:VS1** consumes the theorem that finite étale curve algebras are constant, and owns the divisor-to-Weil map and reciprocity comparison. The degree-one section/divisor identification below can be constructed before that arithmetic comparison. The Class Field Theory Layer 9 reciprocity comparison applies to finite extensions of Q_p; an equal-characteristic use requires its own arithmetic input.
- **Bun_G**, local shtukas and geometric Langlands consume the bundle and Banach–Colmez results; G-isocrystals, the moduli stack and its sheaf categories belong to those roadmaps. The tensor isocrystal category supplies the underlying objects of the filtered G-isocrystal construction in [GLX][GLX], §5.1, pp. 31–32. **Vector Bundles and Isocrystals, Part II** owns the later period-valued functor h(W)=Hom_VS(W,B_dR), its Ext correction and rank/height theorem. This roadmap provides the category, curvature and Hom-vanishing prerequisites.

## Conventions

Fix a nonarchimedean local field E with residue field F_q, uniformizer π and algebraic closure k of F_q. Write L=breve E. In mixed characteristic L=W_{O_E}(k)[1/π]; in equal characteristic L=k((π)). The specified automorphism σ is arithmetic q-Frobenius and fixes E and π. Objects of Isoc_E are finite-dimensional L-vector spaces with bijective σ-semilinear Frobenius. Their morphisms are L-linear intertwining maps, with E-linear Hom spaces. Arbitrary L-scalar multiplication need not preserve the intertwining equation.

The block D(s,r), for r>0, cycles through a basis and multiplies the wrap by π^s. Its isocrystal slope is s/r. For coprime d,h with h>0, the standard bundle O(d/h) is the image of D(−d,h); its rank is h and its degree is d. The functor reverses slopes. The corresponding division algebra D_{d/h} has arithmetic invariant d/h modulo Z and E-dimension h². An isocrystal of slope a therefore has endomorphism invariant −a. Standard rational bundles can be defined over an F_q-base, while the functor on arbitrary isocrystals requires a specified k-structure on the base.

A bundle is a structure-sheaf module with one local-generator family that is both finite and free. It is not an arbitrary locally free sheaf. On a connected geometric curve, degree is the integer Picard degree of its determinant; slope is degree divided by positive rank. The zero bundle has rank and degree zero, the empty HN filtration and no slope. HN polygons use ranks as horizontal lengths and decreasing slopes: they are concave upper polygons. The KL lower polygon convention reverses the order: on a rank-n component, P_KL(x)=deg(V)−P_FS(n−x). The KL slope attached to a φ^a eigenvalue p^b is −b/a; the untilt line has slope 1/a in that normalization.

A geometric base field C is complete, algebraically closed and perfectoid of characteristic p. A closed point x of the curve determines its own untilt C_x^♯; the completed local ring is its period DVR, and for E=Q_p it is B_dR⁺(C_x^♯). A chosen parameter t_x need not be the parameter at another point. For a general perfectoid S, rank and geometric degree are locally constant on appropriate components; statements about slopes mean statements about every geometric fibre unless a single point is explicitly specified.

Cohomological degrees are used throughout. The complex [E₁→E₀] places E₁ in degree −1 and E₀ in degree 0. Its Banach–Colmez object is H⁰ of derived global sections, not the cokernel of a map on ordinary sections. Frobenius cohomology is E-linear, even though the underlying coefficient module is over L. The sheaf underline E has locally constant sections; on a disjoint union of two nonempty connected bases these sections are E².

Projectivization means the v-sheaf quotient of the complement of the zero section by underline E×. The π^Z quotient is an intermediate construction. Absolute spatiality and a morphism's representability in spatial diamonds are separate properties: the intermediate absolute quotient can fail quasiseparatedness while its structure morphism is relatively representable in spatial diamonds.

For the classical sympathetic-algebra category, take E=Q_p, choose C as the completion of an algebraic closure of a complete discretely valued characteristic-zero K with countable perfect residue field, and fix the point ∞ with residue field C and parameter t. Sympathetic algebras are connected spectral C-Banach algebras with p-divisible unit neighbourhood, faithful evaluation on C-valued spectral points, and a dense C-linear subspace with countable basis. These separability assumptions are retained in all targets below involving the CN sympathetic-algebra realization. The abstract pro-étale category and SW diamond realization have their own stated scope for arbitrary algebraically closed complete C/Q_p.

## Library starting point

Use Mathlib at `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti at `f790474821cf4256814db967cb154e7af3d0c369`. The following infrastructure supplies the carriers and generic operations; the curve-specific results are the targets of this roadmap.

- [`WittVector.FractionRing.frobenius`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/WittVector/Isocrystal.lean), [`WittVector.Isocrystal`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/WittVector/Isocrystal.lean), [`WittVector.IsocrystalHom`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/WittVector/Isocrystal.lean) and [`WittVector.IsocrystalEquiv`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/WittVector/Isocrystal.lean) supply the p-Frobenius coefficient automorphism and intertwining maps over Witt fraction fields. `WittVector.Isocrystal` itself imposes no finite-dimensionality condition. [`WittVector.StandardOneDimIsocrystal`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/WittVector/Isocrystal.lean) has Frobenius p^mσ, and [`WittVector.isocrystal_classification`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/WittVector/Isocrystal.lean) assumes finrank=1 over an algebraically closed characteristic-p field. Higher-rank rational classification and general E need the constructions below.
- [`AlgebraicGeometry.Scheme.Modules`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/AlgebraicGeometry/Modules/Sheaf.lean) and [`SheafOfModules.LocalGeneratorsData.IsLocallyFreeData`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Category/ModuleCat/Sheaf/LocallyFree.lean) supply module sheaves and local free presentations. [`SheafOfModules.LocalGeneratorsData.IsFiniteType`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Category/ModuleCat/Sheaf/Generators.lean) makes each generator index finite. Tau Ceti's [`SheafOfModules.LocalGeneratorsData.IsLocallyFreeData.isFinitePresentation`](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Algebra/Category/ModuleCat/Sheaf/FinitePresentation.lean) uses both conditions on the same family. [`TauCeti.AlgebraicGeometry.InvertibleSheaf`](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/AlgebraicGeometry/LineBundle/Basic.lean) is the invertible-sheaf category; [`TauCeti.AlgebraicGeometry.LineBundleClass`](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/AlgebraicGeometry/LineBundle/Class.lean) has a tensor-product commutative monoid of isomorphism classes at this version. [`CommRing.Pic`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/PicardGroup.lean) is the Picard group of a ring, not the Picard computation for this curve.
- [`TauCeti.CSA.of`](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Algebra/BrauerGroup/Basic.lean) bundles an algebra already known to be finite-dimensional, central and simple. [`TauCeti.BrauerGroup.mk_end`](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Algebra/BrauerGroup/Group.lean) gives the split class of End_K(V) for nonzero finite-dimensional V, and [`TauCeti.BrauerGroup.baseChange_mk`](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Algebra/BrauerGroup/BaseChange.lean) identifies scalar extension of classes. Neither constructs the slope cyclic algebra or its arithmetic invariant.
- [`CategoryTheory.Sheaf`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/CategoryTheory/Sites/Sheaf.lean), [`ModuleCat`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Category/ModuleCat/Basic.lean), [`CategoryTheory.Abelian`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/CategoryTheory/Abelian/Basic.lean), [`CategoryTheory.Equivalence`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/CategoryTheory/Equivalence.lean), [`DerivedCategory`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Homology/DerivedCategory/Basic.lean), [`CategoryTheory.ShortComplex.ShortExact`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Homology/ShortComplex/ShortExact.lean) and [`CategoryTheory.ShortComplex.homology`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Homology/ShortComplex/Homology.lean) supply sheaf categories, module-valued functors, equivalences, exactness and genuine categorical homology. The derived category localizes integer cochain complexes at quasi-isomorphisms; it does not provide the curve's derived sections or the tilted coherent heart by itself. [`Submodule`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Module/Submodule/Defs.lean), [`NormedAlgebra`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Analysis/Normed/Module/Basic.lean) and [`Module.finrank`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/Dimension/Finrank.lean) supply lattice inclusions, normed algebra carriers and dimensions under the finite hypotheses.
- [`SpectralSpace`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Topology/Spectral/Basic.lean) and [`Specializes`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Topology/Defs/Filter.lean) supply spectral topology and the neighbourhood-filter specialization relation. [`TauCeti.ValuationSpectrum.spectralSpace_spa_of_pairOfDefinition`](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/AlgebraicGeometry/AdicSpace/Spa/Spectral.lean) proves spectrality of Spa for a topological coefficient ring with a specified pair of definition and subring of integral elements. Tautness, ordered generalizations and the contraction assumptions in the quotient theorem remain substantive hypotheses.

The current Tau Ceti library additionally supplies [`FiniteLocallyFreeSheaf`](https://github.com/TauCetiProject/TauCeti/blob/a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039/TauCeti/AlgebraicGeometry/VectorBundle/FiniteLocallyFree.lean), its free sheaves and pullbacks, and [`pullbackId` and `pullbackComp`](https://github.com/TauCetiProject/TauCeti/blob/a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039/TauCeti/AlgebraicGeometry/VectorBundle/Functoriality.lean). [`SheafOfModules.isFiniteLocallyFree_iff_exists_isLocallyFreeData_isFiniteType`](https://github.com/TauCetiProject/TauCeti/blob/a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039/TauCeti/Algebra/Category/ModuleCat/Sheaf/FiniteLocallyFree.lean) identifies the finite local-basis witness with the native property. These are imports from Algebraic Vector Bundles; the modules postdate the executable baseline above.

[Suggested.lean](Suggested.lean) suggests names and signatures for the algebraic, categorical and numerical components, with `sorry` proofs. Its contract indexes distinguish these components from explicitly omitted signatures and examples, giving their complete mathematical contracts and missing supplier interfaces. Geometric exactness, category equivalences, period invariants and openness require the actual curve, functors and fibre polygons described here. An arbitrary short complex, category or numerical profile does not supply those hypotheses.

## Construction order

The displayed layers organize the exports. Within them, the dependency order is finer:

1. Construct finite isocrystals, the early bundle carrier, annular descent, the Frobenius cohomology complex and v-descent.
2. Construct the basic Lubin–Tate cover, the degree-one untilt sequence and the section/divisor identification in VB3. Use them for standard twist cohomology and the independent geometric chart-cover argument in VB1. The later Weil/reciprocity comparison is a separate use of VS1.
3. Establish the regular geometric curve, Picard degree and geometric HN theory. Prove positive generation, the global Proj map and relative GAGA, then geometric classification. The geometric chart-cover proof precedes general GAGA; ordinary Banach–Colmez properness uses positive generation without classification.
4. Prove ordinary projectivized properness, then family HN semicontinuity and pro-étale splitting in VB4. These supply the positive presentations and relative cohomology needed for general two-term Banach–Colmez geometry in VB3.
5. Develop integral/pure model comparisons, relative ampleness and the classical Banach–Colmez category with its coherent-heart equivalence and curvature calculus.

Each target gives its mathematical specification, its required API or examples where applicable, and its source and prerequisites. All API statements inherit the target's hypotheses and the conventions above. The examples include degenerate cases and counterexamples so that definitions can be checked against their intended meaning.

## Layer VB0 — Finite isocrystals and division algebras

### Coefficient category and rational blocks

<a id="isocrystal-category-and-standard-block"></a>

#### Finite isocrystals over the completed maximal unramified coefficient field

Fix a nonarchimedean local field E, residue field F_q, uniformizer π and L=breve E. In mixed characteristic L=W_{O_E}(bar F_q)[1/π]; in equal characteristic L=bar F_q((π)). Let σ be the lift of q-power arithmetic Frobenius fixing E and π. An E-isocrystal is a finite-dimensional L-vector space D with a bijective σ-semilinear Φ. Morphisms are L-linear maps f with fΦ_D=Φ_D′f. This category retains E, σ and the coefficient embedding; the coefficient field alone does not determine it.

**API.**

- `FiniteIsocrystal`: A finite L-module with a σ-semilinear equivalence.
- `FiniteIsocrystal.Hom`: The E-vector subspace of L-linear maps intertwining the two Frobenius equivalences; scalars are restricted through the specified σ-fixed E embedding, not arbitrary L-scalars.
- `FiniteIsocrystal.Hom.ext`: Intertwining morphisms agree iff their underlying functions agree.
- `FiniteIsocrystal.category`: Identity and composition are inherited from linear maps; the category is E-linear abelian.
- `FiniteIsocrystal.toWitt`: For E=Q_p and σ=p-Frobenius, forget finiteness to the existing WittVector.Isocrystal class; arrows and isomorphisms agree.
- `FiniteIsocrystal.coeffFrobenius`: Return the specified σ together with the E-coefficient embedding; do not infer it from L.

**Examples and checks.**

- `finiteIsocrystal_zero`: The zero module has rank 0 and an invertible semilinear zero-to-zero map.
- `finiteIsocrystal_witt`: For Q_p the finite subcategory embeds fully faithfully into WittVector.IsocrystalHom and IsocrystalEquiv.
- `finiteIsocrystal_requires_bijective`: The zero Frobenius map on nonzero L is not an isocrystal.
- `finiteIsocrystal_unramified_frobenius`: For the unramified degree-two E′, the coefficient automorphism is σ², not σ.

**Sources:** [FF][FF], 8.2.3, Definition 8.2.5, printed p. 236.

**Prerequisites:** `tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-2-unramified-extensions-and-frobenius`; `tauceti:TauCetiRoadmap/ReductiveGroupsPartII:RG2.0.4` for the completion and extended arithmetic Frobenius; `RelativeFarguesFontaine:RF0/ramified-witt-universal-property`; `mathlib:WittVector.FractionRing.frobenius`; `mathlib:WittVector.Isocrystal`; `mathlib:WittVector.IsocrystalHom`; `mathlib:WittVector.IsocrystalEquiv`.

<a id="rational-standard-block"></a>

#### Rational standard Frobenius blocks

For s∈Z and r>0, define D(s,r)=L^r with Φ(e_i)=e_{i+1} for i<r−1 and Φ(e_{r−1})=π^s e_0, applying σ to coefficients. Then Φ^r=π^sσ^r and its isocrystal slope is s/r. The coprime pair gives the simple block. FF M(d,h) is D(−d,h); its bundle is O(d/h), rank h and degree d.

**API.**

- `SlopeBlock`: D(s,r), with r>0 and π≠0.
- `SlopeBlock.frobenius_basis`: Evaluate Φ on the cyclic basis, including the π^s wraparound.
- `SlopeBlock.iterate`: Φ^r=π^sσ^r, with σ^r acting coefficientwise.
- `SlopeBlock.rank`: The L-rank is r.
- `SlopeBlock.slope`: The rational isocrystal slope is s/r.
- `SlopeBlock.rankOneWitt`: At E=Q_p, r=1, D(s,1) identifies with StandardOneDimIsocrystal s.

**Examples and checks.**

- `slopeBlock_half`: D(1,2) has rank 2 and isocrystal slope 1/2.
- `slopeBlock_wraparound`: On D(−1,2), Φ²(e_0)=π^{-1}e_0, ruling out a coefficient-linear or unsigned shift.
- `slopeBlock_rankOne`: D(−2,1) is the pinned rank-one block with exponent −2.
- `slopeBlock_not_simple`: D(2,2) has slope 1 and is not simple: it is two copies of D(1,1).

**Sources:** [FF][FF], 8.2.3 before Proposition 8.2.6, p. 237; [Ked][Ked], Definition 4.1.1, printed p. 487.

**Prerequisites:** [Finite isocrystals over the completed maximal unramified coefficient field](#isocrystal-category-and-standard-block); `mathlib:WittVector.StandardOneDimIsocrystal`.

<a id="dieudonne-manin-isocrystals"></a>

#### Dieudonné–Manin classification of finite isocrystals

Over L with algebraically closed residue field bar F_q, every finite E-isocrystal is a finite direct sum of coprime D(s,r); the multiset of rational slopes with block multiplicities is unique. The coprime blocks are simple, Hom between distinct slopes is zero, and every isocrystal short exact sequence splits. This asserts no analogous classification over an arbitrary perfect residue field without descent data. The proof must establish the eigenvector calculation used in Ked §4.3, Lemma 4.3.3, and a full equal-characteristic argument over k((π)); the rank-one Witt theorem and Lurie’s statement do not supply those proofs.

**Sources:** [Ked][Ked], 4.5.3–4.5.8, pp. 497–499; [Lurie][Lurie], Theorem 6, p. 2.

**Prerequisites:** [Rational standard Frobenius blocks](#rational-standard-block); `mathlib:WittVector.isocrystal_classification`.

<a id="tensor-and-dual-slopes"></a>

#### Tensor and dual calculus for isocrystals

Finite isocrystals form a rigid exact E-linear tensor category. Tensor Frobenius is Φ_D⊗Φ_D′ and dual Frobenius is ℓ↦σ∘ℓ∘Φ_D^{-1}. Tensor slopes are pairwise sums, dual slopes are negatives. If a,b have reduced denominators h_a,h_b,h_{a+b}, then D_a⊗D_b≅D_{a+b}^{⊕h_a h_b/h_{a+b}}.

**Sources:** [Ked][Ked], Definition 3.1.5 and Lemma 4.1.2, pp. 478, 487; [FF][FF], Proposition 8.2.6, p. 237.

**Prerequisites:** [Finite isocrystals over the completed maximal unramified coefficient field](#isocrystal-category-and-standard-block); [Rational standard Frobenius blocks](#rational-standard-block); [Dieudonné–Manin classification of finite isocrystals](#dieudonne-manin-isocrystals).

### Endomorphisms and arithmetic invariants

<a id="endomorphism-division-algebra"></a>

#### Division endomorphisms of a simple isocrystal

For coprime (s,r), End_Φ(D(s,r)) is a central division algebra over E of dimension r². With E_r/E unramified degree r and arithmetic σ, it has presentation ⊕_{i=0}^{r−1}E_r Π^i, Π^r=π^{−s}, Πx=σ(x)Π. The arithmetic Brauer invariant is determined by the sign comparison below; the stable-bundle endomorphism identification belongs to the classification layer.

**Sources:** [FF][FF], Definition 8.2.7 and Proposition 8.2.8, pp. 237–238.

**Prerequisites:** [Rational standard Frobenius blocks](#rational-standard-block); [Dieudonné–Manin classification of finite isocrystals](#dieudonne-manin-isocrystals); `tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-2-unramified-extensions-and-frobenius`.

<a id="slope-division-algebra"></a>

#### Slope-labelled cyclic algebra

For bundle slope λ=d/h in lowest terms, h>0, set D_λ=Cyc(E_h/E, arithmetic σ, π^d), a central division algebra with Π^h=π^d and Πx=σ(x)Π. Specialize the cyclic algebra construction of Class Field Theory to these slope parameters and identify it with End_Φ(D(−d,h)).

**API.**

- `SlopeDivisionAlgebra`: The cyclic algebra D_λ for the reduced pair of λ.
- `SlopeDivisionAlgebra.generator`: The element Π with Π^h=π^d.
- `SlopeDivisionAlgebra.commutation`: Πx=σ(x)Π for x∈E_h; specify arithmetic Frobenius.
- `SlopeDivisionAlgebra.basis`: E-basis obtained from an E-basis of E_h times Π^i, 0≤i<h.
- `SlopeDivisionAlgebra.isocrystalEnd`: E-algebra equivalence with End_Φ(D(−d,h)).

**Examples and checks.**

- `slopeDivision_integer`: D_3≅E because the reduced denominator is one.
- `slopeDivision_half`: D_{1/2} has dimension 4 and Π²=π.
- `slopeDivision_negative`: D_{−1/3} uses Π³=π^{−1}, not π, and has invariant −1/3.
- `slopeDivision_end`: D_{1/3}≅End_Φ(D(−1,3)), not End_Φ(D(1,3)).

**Sources:** [FF][FF], Definition 8.2.7, p. 237.

**Prerequisites:** [Division endomorphisms of a simple isocrystal](#endomorphism-division-algebra); `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-5-local-coefficients-the-brauer-group-the-local-invariant-and-duality`; `tauceti:TauCeti.CSA.of`.

<a id="brauer-invariant-sign"></a>

#### Arithmetic Brauer invariant and slope normalization

Under the algebraic-to-cohomological Brauer comparison and the arithmetic local invariant inv_E:Br(E)≃Q/Z, inv_E[D_λ]=λ mod Z. Restriction to finite E′/E multiplies this invariant by [E′:E]; the opposite algebra negates it. This fixes the choice Πx=σ(x)Π with arithmetic, not geometric, Frobenius.

**Sources:** [FF][FF], Definition 8.2.7, p. 237.

**Prerequisites:** [Slope-labelled cyclic algebra](#slope-division-algebra); `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-5-local-coefficients-the-brauer-group-the-local-invariant-and-duality`; `tauceti:TauCeti.BrauerGroup.baseChange_mk`; `tauceti:TauCeti.BrauerGroup.mk_end`.

### Coefficient extension and descent

Finite separable coefficient extension needs both tensor–restriction adjunctions. The perfect trace pairing supplies the reverse adjunction without dividing by the extension degree; the same trace formalism will transfer classification maps on the finite coefficient cover.

<a id="scalar-extension-adjunction"></a>

#### Coefficient extension and induction adjunction

For finite separable E′/E of residue degree f, ramification degree e and total degree n=ef, identify the coefficient fields compatibly. Pull D to D⊗_{L_E}L_E′ with Frobenius Φ^f⊗σ_E′; induction is the f cyclic conjugate copies of restriction of scalars, with wraparound given by Φ′. Pull and induction are adjoint in both directions: Hom(Pull D,D′)≅Hom(D,Ind D′) and Hom(Ind D′,D)≅Hom(D′,Pull D). The reverse adjunction uses the perfect separable trace pairing and the identification of finite cyclic induction with coinduction; no division by n is required. Pull preserves rank and scales slopes by n; induction multiplies rank by n and divides isoclinic slopes by n. At the bundle stage they compare to pullback/pushforward along the finite étale coefficient curve map, with its two trace adjunctions.

**Sources:** [FF][FF], 8.2.3 after Proposition 8.2.8, p. 238; [SW][SW], Theorem 13.5.7, proof, printed p. 114 (PDF p. 124).

**Prerequisites:** [Finite isocrystals over the completed maximal unramified coefficient field](#isocrystal-category-and-standard-block); [Dieudonné–Manin classification of finite isocrystals](#dieudonne-manin-isocrystals); `tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-2-unramified-extensions-and-frobenius`; `SchemeAndStackFoundations:SF.1`.

<a id="finite-galois-descent"></a>

#### Finite Galois descent of isocrystals

Let L′/L be finite Galois and let σ′ be a coefficient automorphism extending σ. Finite L-vector spaces with bijective σ-semilinear Φ are equivalent to finite L′-vector spaces with bijective σ′-semilinear Φ′ and a semilinear Galois descent action ρ satisfying Φ′ρ_g=ρ_{σ′gσ′^{-1}}Φ′ for every g∈Gal(L′/L). The descended module is the invariant module and Φ′ restricts to a bijective σ-semilinear Φ. Ordinary commutation with each ρ_g is sufficient only when σ′ centralizes the Galois group. This is module descent with Frobenius, not classification over arbitrary perfect residue fields.

**Sources:** [FF][FF], 8.2.3, Definition 8.2.5, printed p. 236; [Ked][Ked], 4.5.7–4.5.8, pp. 498–499.

**Prerequisites:** [Finite isocrystals over the completed maximal unramified coefficient field](#isocrystal-category-and-standard-block); `SchemeAndStackFoundations:SF.1`.

## Layer VB1 — Analytic bundles and geometric slope theory

### Bundles, annuli and derived cohomology

Start with finite local trivializations and Frobenius descent. The analytic equivalence is constructed on annuli before Proj; a global étale integral model is stronger than purity at every geometric point.

<a id="finite-locally-free-bundles"></a>

#### Finite locally free bundles on the curve

For X_S imported from RF1, Bun(X_S) is the category of structure-sheaf modules admitting a covering with finite free trivializations. The same local generator data must be finite and locally free. Schematic bundles specialize Tau Ceti's `FiniteLocallyFreeSheaf` to the schematic curve; the native finite local-basis characterization supplies the paired witness. Analytic bundles use the R3 coherent-sheaf carrier. Pullback, tensor, dual, determinants and exact sequences are transported from these suppliers. Finite rank is required even though the locally free predicate alone allows infinite ranks. The new obligations are the analytic FF specialization and its comparison with this existing schematic category.

**API.**

- `CurveBundle`: A structure-sheaf module with a single finite locally free local generator witness.
- `CurveBundle.ofFree`: The free sheaf of finite rank n.
- `CurveBundle.ext`: Bundle morphisms are equal iff the underlying sheaf morphisms are equal.
- `CurveBundle.pullback`: Pullback along curve-base change, with identity and composition isomorphisms.
- `CurveBundle.tensorDual`: Tensor, unit, dual and evaluation from the structure-sheaf module category.
- `CurveBundle.finitePresentation`: Apply the pinned finite-presentation theorem to the same finite locally free witness.

**Examples and checks.**

- `curveBundle_zero`: The free sheaf on the empty family is a bundle of rank 0.
- `curveBundle_free_two`: O_X⊕O_X is a bundle of rank 2.
- `curveBundle_not_infinite`: On a nonempty geometric curve, a free sheaf on an infinite constant basis is not finite locally free; test its nonzero residue-field stalk. The nonempty hypothesis excludes the empty scheme, where the zero sheaf admits every vacuous presentation.
- `curveBundle_schematic`: For a scheme, forgetting CurveBundle returns its Scheme.Modules object with the pinned finite locally free data.

**Sources:** [FS][FS], II.2 preamble and Proposition II.2.1, pp. 57–58.

**Prerequisites:** `RelativeFarguesFontaine:RF1/frobenius-quotient-and-presentation`; `AdicSpacesPartII:R3/locally-free-sheaf`; `AdicSpacesPartII:R3/sheafy-tate-acyclicity-and-kiehl-gluing`; `SchemeAndStackFoundations:SF.0`; `tauceti:TauCetiRoadmap/AlgebraicVectorBundles` L0A–L0C and its current `FiniteLocallyFreeSheaf` interface; `mathlib:AlgebraicGeometry.Scheme.Modules`; `mathlib:SheafOfModules.LocalGeneratorsData.IsLocallyFreeData`; `mathlib:SheafOfModules.LocalGeneratorsData.IsFiniteType`; `tauceti:SheafOfModules.LocalGeneratorsData.IsLocallyFreeData.isFinitePresentation`.

<a id="annular-frobenius-descent"></a>

#### Annular Frobenius descent for bundles

For affinoid perfectoid S of characteristic p over F_q, finite locally free bundles on X_S are equivalent, exactly and tensorially, to finite projective bundles on the RF0 closed annuli with compatible overlap identifications and bijective Frobenius identification under radius rescaling. Restriction to a fundamental annular range and Frobenius translates gives the inverse. Cohomology on Y_S is acyclic in positive degrees by sousperfectoid annular acyclicity and dense restriction maps.

**Sources:** [FS][FS], II.2 preamble, p. 57; [CS][CS], 3.3.4, p. 683.

**Prerequisites:** [Finite locally free bundles on the curve](#finite-locally-free-bundles); `RelativeFarguesFontaine:RF0/ramified-witt-universal-property`; `RelativeFarguesFontaine:RF0:annuli/radius-function-and-rational-annuli`; `RelativeFarguesFontaine:RF1/frobenius-quotient-and-presentation`; `AdicSpacesPartII:R3/locally-free-sheaf`; `AdicSpacesPartII:R3/sheafy-tate-acyclicity-and-kiehl-gluing`; `DiamondsAndVStacks:D0/cech-to-derived-comparison`; `RelativeFarguesFontaine:RF0:annuli/stein-exhaustion-and-higher-acyclicity`.

<a id="tilted-robba-ring"></a>

#### Relative tilted Robba ring from curve annuli

For perfectoid affinoid S=Spa(R,R⁺) in characteristic p, define the relative tilted Robba ring R̃_R as colim_{r>0} lim_{s→0} Γ(Y_{S,[s,r]},O). At fixed r the inverse limit has its Fréchet seminorms, and the union carries the corresponding LF topology. Frobenius rescales radii by q. For E=Q_p its absolute specialization agrees with CS17 3.2.10, and its relative form is the ring used in 3.3.4; general E uses the coefficient-compatible RF0 annuli. Absolute field R gives a Bézout ring; no such assertion is made for every affinoid R.

**API.**

- `TiltedRobba`: The annular inverse-limit/filtered-union ring.
- `TiltedRobba.restrict`: Cofinal radius restriction maps, compatible with composition.
- `TiltedRobba.frobenius`: Coefficient-semilinear ring automorphism with radius rescaling q.
- `TiltedRobba.seminorm`: The family of annular seminorms on fixed-radius Fréchet pieces.
- `TiltedRobba.compareCS`: For E=Q_p identify the ring, Frobenius and topology with CS17 3.2.10.

**Examples and checks.**

- `tiltedRobba_cofinal`: Using s_j→0 in a fixed r inverse limit produces the same ring and topology.
- `tiltedRobba_zero_section`: The zero compatible annular family has all seminorms zero.
- `tiltedRobba_frobenius_radius`: At Q_p, Frobenius moves the outer radius r to r/p in the CS convention.
- `tiltedRobba_not_algebraic_union`: Replacing the fixed-r inverse limit by an algebraic union loses compatible sections defined on all sufficiently small inner radii.

**Sources:** [CS][CS], Definition 3.2.10 and Theorems 3.2.13, 3.3.4, pp. 681–683.

**Prerequisites:** `RelativeFarguesFontaine:RF0/ramified-witt-universal-property`; `RelativeFarguesFontaine:RF0:annuli/radius-function-and-rational-annuli`; [Annular Frobenius descent for bundles](#annular-frobenius-descent).

<a id="robba-frobenius-modules"></a>

#### Finite projective Frobenius modules and integral models

A Robba Frobenius module is a finite projective R̃_R-module M with a semilinear Frobenius whose linearization φ* M→M is an isomorphism. A globally étale model is a finite locally free module over the integral Robba ring whose linearized Frobenius is invertible and whose scalar extension is M. This defines the global model predicate needed in KL 8.8.7; equivalence with pointwise purity or local systems is not included here and remains VB4-owned.

**API.**

- `RobbaPhiModule`: Finite projective M with invertible Frobenius linearization.
- `RobbaPhiModule.Hom`: R̃-linear maps commuting with Frobenius.
- `RobbaPhiModule.baseChange`: Base change of modules and linearizations under coefficient-compatible perfectoid maps.
- `RobbaPhiModule.GlobalEtaleModel`: An integral finite locally free model and Frobenius identification.
- `RobbaPhiModule.isGloballyEtale`: Existence of such a global model; independent of presentation.

**Examples and checks.**

- `robbaPhi_trivial`: The rank-one ring with its own Frobenius has its evident integral étale model.
- `robbaPhi_noninvertible`: Zero linearization on a nonzero free module is excluded.
- `robbaPhi_finite_projective`: Over an absolute field the module is free by the field Bézout theorem, while its definition remains finite projective.
- `robbaPhi_unit_lattice`: A rank-one Frobenius multiplier that is an integral unit preserves an invertible rank-one integral model.

**Sources:** [CS][CS], Definition before Theorem 3.3.4, p. 683 (absolute case before 3.2.13, p. 681); [KL][KL], 7.3.4–7.3.5, pp. 148–149.

**Prerequisites:** [Relative tilted Robba ring from curve annuli](#tilted-robba-ring); `AdicSpacesPartII:R3/locally-free-sheaf`; `AdicSpacesPartII:R3/sheafy-tate-acyclicity-and-kiehl-gluing`.

<a id="robba-bundle-equivalence"></a>

#### Exact tensor equivalence of Robba modules and curve bundles

For affinoid perfectoid characteristic-p S, RobbaPhiModule(R̃_S)≃Bun(X_S) is an exact tensor equivalence, commuting with base change and duals. Spread a finite presentation to sufficiently small annuli, extend across Frobenius translates, then descend to X_S. Its inverse takes compatible annular sections. For Q_p this is CS17 3.3.4. The general-E coefficient comparison requires the normalized RF0 coefficient interface; this analytic equivalence does not require Proj/GAGA.

**Sources:** [CS][CS], Theorem 3.3.4, p. 683; [KL][KL], 6.3.12, p. 141.

**Prerequisites:** [Finite projective Frobenius modules and integral models](#robba-frobenius-modules); [Annular Frobenius descent for bundles](#annular-frobenius-descent).

<a id="frobenius-two-term-cohomology"></a>

#### Two-term Frobenius complex for curve cohomology

For a bundle V descended from M on Y_S, derived global sections on X_S identify with the homotopy fiber of φ−1 on RΓ(Y_S,M). Annular Stein acyclicity reduces this to [Γ(Y_S,M) →^{φ−1} Γ(Y_S,M)] in degrees 0 and 1. H⁰ is the kernel, H¹ the cokernel and H^i=0 for i>1. The differential is E-linear, not L-linear; negative shifted complexes are interpreted by hypercohomology, never by a bare cokernel definition of Banach–Colmez spaces.

**API.**

- `FrobeniusComplex`: The E-linear two-term complex in degrees 0 and 1.
- `FrobeniusComplex.differential`: The differential sends x to φ(x)−x.
- `FrobeniusComplex.H0`: H⁰=ker(φ−1).
- `FrobeniusComplex.H1`: H¹=coker(φ−1).
- `FrobeniusComplex.map`: A Frobenius-equivariant bundle morphism induces a cochain map.
- `FrobeniusComplex.compareDerived`: Canonical quasi-isomorphism with RΓ(X_S,V), compatible with pullback.

**Examples and checks.**

- `frobeniusComplex_zero`: For the zero module both terms and both cohomology groups vanish.
- `frobeniusComplex_identity`: For φ=id on a nonzero E-vector space the differential is zero, so H⁰ and H¹ both equal that space.
- `frobeniusComplex_kernel`: H⁰ consists precisely of φ-fixed vectors, not all vectors.
- `frobeniusComplex_degree`: The cokernel occupies degree 1, and cannot represent H⁰(V) for an arbitrary V.

**Sources:** [FS][FS], II.2 preamble, p. 57.

**Prerequisites:** [Annular Frobenius descent for bundles](#annular-frobenius-descent); `DiamondsAndVStacks:D0/cech-to-derived-comparison`; `RelativeFarguesFontaine:RF0:annuli/stein-exhaustion-and-higher-acyclicity`.

<a id="v-descent-for-bundles-and-cohomology"></a>

#### V-descent of bundles and their derived cohomology

On Perf/F_q, S↦Bun(X_S) is a v-stack. For any perfectoid S and V∈Bun(X_S), T↦RΓ(X_T,V_T) on Perf/S is a derived v-sheaf. In the affinoid case this follows after completed tensoring with the perfectoid completed coefficient extension E_∞, where closed annuli become affinoid perfectoid, and descending the finite projective module data. Both arrows and effective objects descend.

**Sources:** [FS][FS], Proposition II.2.1, pp. 57–58.

**Prerequisites:** [Annular Frobenius descent for bundles](#annular-frobenius-descent); [Two-term Frobenius complex for curve cohomology](#frobenius-two-term-cohomology); `DiamondsAndVStacks:D2/higher-v-acyclicity`; `DiamondsAndVStacks:D2/v-descent-of-functions`; `SchemeAndStackFoundations:SF.1`.

<a id="isocrystal-to-bundle-functor"></a>

#### The exact tensor isocrystal-to-bundle functor

Fix k=bar F_q and its coefficient inclusion in L=breve E. For perfectoid S/k with the specified k-structure, define E_S(D) by descending D⊗_L O_{Y_S} along Φ_D⊗φ_Y. It is an exact tensor functor from finite E-isocrystals to Bun(X_S), compatible with duals, k-compatible base change and finite coefficient pull/induction. For any perfectoid S/F_q, define the standard O_{X_S}(d/h) directly by descending the cyclic rank-h Frobenius matrix with wrap coefficient π^{−d}; this needs no chosen k-embedding. After base change to k it agrees with E_S(D(−d,h)). Its rank is h, O(n) agrees with RF3 rank-one twists, and O(λ)∨=O(−λ). Geometric degree d is a later consequence of degree-rank-slope-and-HN-formalism, not an input to this construction. No relative classification is asserted.

For the general finite-isocrystal functor, S is over the fixed k=bar F_q so that L embeds in O_{Y_S}. The standard cyclic bundles alone are defined over F_q.

**API.**

- `bundleOfIsocrystal`: For S over the fixed k=bar F_q, the analytic Frobenius-descended bundle E_S(D), retaining the coefficient embedding.
- `bundleOfIsocrystal.map`: Descend an intertwining linear map; preserve identity and composition.
- `bundleOfIsocrystal.tensorDual`: Exact tensor structure and dual compatibility.
- `standardBundle`: For S/F_q, descend the cyclic matrix for (−d,h); over k compare with E_S(D(−d,h)).
- `standardBundle.integerTwist`: O(n) identifies with RF3 rank-one twists, with their tensor laws.
- `standardBundle.baseChange`: Perfectoid pullback preserves the cyclic standard bundle; general E_S(D) pullback retains the chosen k-embedding. At a geometric point, coefficient pullback multiplies λ by [E′:E], as proved with degree and scalar extension.

**Examples and checks.**

- `standardBundle_zero`: O(0) is the tensor unit of rank 1, rather than the rank-zero bundle.
- `standardBundle_half_sign`: Over geometric C/k, D(1,2) maps to O(−1/2), rank 2; the degree −1 check belongs after geometric degree is constructed.
- `standardBundle_integer`: D(−2,1) maps to the RF3 twist O(2).
- `standardBundle_tensor_half`: Over geometric C/k, O(1/2)⊗O(1/2)≅O(1)^{⊕4}; rank 4 detects omission of the tensor multiplicity.

**Sources:** [FS][FS], II.2 preamble, p. 58; [FF][FF], Proposition 8.2.6 and Remark 8.2.9, pp. 237–238.

**Prerequisites:** [Finite isocrystals over the completed maximal unramified coefficient field](#isocrystal-category-and-standard-block); [Rational standard Frobenius blocks](#rational-standard-block); [Tensor and dual calculus for isocrystals](#tensor-and-dual-slopes); [Coefficient extension and induction adjunction](#scalar-extension-adjunction); [Annular Frobenius descent for bundles](#annular-frobenius-descent); [V-descent of bundles and their derived cohomology](#v-descent-for-bundles-and-cohomology); `RelativeFarguesFontaine:RF3/isocrystal-line-bundles-and-sign`.

### Standard twist cohomology

This target uses the early Lubin–Tate and fundamental-sequence targets of VB3 together with Frobenius cohomology. Its early basic construction excludes the later divisor-to-Weil comparison, family HN splitting and general two-term representability.

<a id="cohomology-of-twists"></a>

#### Slope-sensitive cohomology of standard bundles

For λ<0, H⁰(X_S,O(λ))=0 and the v-sheaf H¹(O(λ)) is locally spatial, partially proper and cohomologically smooth. For λ=0, the degree-zero v-sheaf is constant E and the pro-étale sheafification of degree-one cohomology is zero; RΓ_proét(S,E)≃RΓ(X_S,O). For λ>0 and affinoid S, H¹(X_S,O(λ))=0; its H⁰ v-sheaf is locally spatial, partially proper and cohomologically smooth. After base change to the fixed algebraically closed k, the positive H⁰ v-sheaf is a d-dimensional perfectoid open ball in mixed characteristic only for 0<λ=d/h≤[E:Q_p]; in equal characteristic every positive λ has this description. Nonaffinoid global H¹ vanishing is not asserted. The negative λ=−1 presentation is (A¹_{S♯})^diamond/E on an untilt cover.

**Sources:** [FS][FS], Proposition II.2.5 and proof, pp. 62–64.

**Prerequisites:** [The exact tensor isocrystal-to-bundle functor](#isocrystal-to-bundle-functor); [Two-term Frobenius complex for curve cohomology](#frobenius-two-term-cohomology); [V-descent of bundles and their derived cohomology](#v-descent-for-bundles-and-cohomology); [Lubin–Tate universal cover and sections of O(1)](#lubin-tate-universal-cover); [The fundamental untilt sequence and degree-one divisors](#fundamental-exact-sequence); [Coefficient extension and induction adjunction](#scalar-extension-adjunction).

### The geometric curve and its local rings

At a geometric point, prove coverage by homogeneous opens directly: classical points are untilts, and degree-one Lubin–Tate sections produce the necessary divisors. Use two distinct divisor points to cover the curve. Only then pass to the regular schematic curve; general relative GAGA is not an input to this argument.

<a id="classical-points-and-principal-ideal-domains"></a>

#### Classical points and annular Dedekind rings

For complete algebraically closed perfectoid C/F_q and a connected affinoid U=Spa(B,B⁺) in Y_C, Spm(B) identifies with the classical points of U, whose residue fields are untilts of C over E. B is a PID. On X_C, classical points are Frobenius orbits and affinoid chart rings are Dedekind domains; their PID upgrade is obtained from geometric Picard degree, rather than assumed as an early analytic input.

**Sources:** [FS][FS], Proposition II.1.11, Corollary II.1.12 and Definition/Proposition II.1.22, pp. 53–57.

**Prerequisites:** `RelativeFarguesFontaine:RF0/ramified-witt-universal-property`; `RelativeFarguesFontaine:RF0:annuli/radius-function-and-rational-annuli`; `RelativeFarguesFontaine:RF1/frobenius-quotient-and-presentation`; `PerfectoidQuotients:Q4`; `AdicSpacesPartII:R3/locally-free-sheaf`; `AdicSpacesPartII:R3/sheafy-tate-acyclicity-and-kiehl-gluing`.

<a id="geometric-point-chart-cover"></a>

#### Elementary algebraization at a geometric point

For complete algebraically closed perfectoid C, RF3 supplies P_C=⊕_{n≥0}Γ(X_C,O(n)) and chart maps on nonvanishing loci. Prove these loci cover X_C using the classical-point description and the Lubin–Tate degree-one divisor sections, then glue a global locally ringed spectral map α_C:X_C→Proj(P_C). It identifies finite locally free bundles on the geometric curve with their schematic counterparts by chartwise finite-projective comparison. This geometric-point construction precedes the general-S ampleness/GAGA theorem; it is not imported from that theorem.

**API.**

- `geometricCurveMap`: The global map α_C formed from the proved geometric-point covering.
- `geometricCurveMap.chart`: On D(f), the map is the RF3 map to D_+(f).
- `geometricCurveMap.compatible`: The chart maps agree on D(fg) under homogeneous localization.
- `geometricBundleAlgebraization`: Exact tensor equivalence of analytic and schematic finite locally free bundles at C.
- `geometricCurveMap.closedPoints`: Classical points map bijectively to schematic closed points.

**Examples and checks.**

- `geometricCurveMap_nonvanishing`: A nonzero divisor section is nonvanishing at every nonclassical point.
- `geometricCurveMap_separates`: The section vanishing at x cannot alone define a chart containing x; use a section with a distinct zero divisor.
- `geometricCurveMap_overlap`: The maps for f and g agree on D(fg).

**Sources:** [FS][FS], Proof of Proposition II.2.9, p. 68; [FS][FS], Proposition II.2.7, pp. 66–67.

**Prerequisites:** [Classical points and annular Dedekind rings](#classical-points-and-principal-ideal-domains); `RelativeFarguesFontaine:RF3/isocrystal-line-bundles-and-sign`; `RelativeFarguesFontaine:RF3/graded-algebra-and-algebraic-curve-map`; [Slope-sensitive cohomology of standard bundles](#cohomology-of-twists); [Lubin–Tate universal cover and sections of O(1)](#lubin-tate-universal-cover); `AdicSpacesPartII:R3/locally-free-sheaf`; `AdicSpacesPartII:R3/sheafy-tate-acyclicity-and-kiehl-gluing`; `SchemeAndStackFoundations:SF.0`.

<a id="schematic-curve-at-a-geometric-point"></a>

#### Regular noetherian geometric curve and PID complements

For complete algebraically closed perfectoid C, X_C^alg=Proj(P_C) is connected, regular, noetherian and one-dimensional. Classical points correspond bijectively to its closed points; for every classical x the complement of x in X_C^alg is affine with PID coordinate ring. Degree-one untilt divisor sections cut out Spec(C♯) and their nonvanishing complements give these charts.

**Sources:** [FS][FS], Proposition II.2.9 and proof, p. 68.

**Prerequisites:** [Elementary algebraization at a geometric point](#geometric-point-chart-cover); [Classical points and annular Dedekind rings](#classical-points-and-principal-ideal-domains); [Slope-sensitive cohomology of standard bundles](#cohomology-of-twists); `SchemeAndStackFoundations:SF.0`.

<a id="completed-local-ring-comparison"></a>

#### Untilts and completed local rings

At a classical point x of the geometric curve, identify the completed local ring with the RF2 untilt period DVR, whose residue field is C_x♯. At E=Q_p this is B_dR⁺(C_x♯). A uniformizer t_x depends on a choice of generator; neither its equality with a global t nor the equality of every untilt with a fixed C♯ is asserted.

**Sources:** [CN (arXiv)][CN-arXiv], §3.2.1, p. 14.

**Prerequisites:** [Regular noetherian geometric curve and PID complements](#schematic-curve-at-a-geometric-point); `RelativeFarguesFontaine:RF2:untilts/BdR-completion-and-filtration`.

<a id="picard-degree"></a>

#### Picard group of the geometric curve

At complete algebraically closed C, the map Z→Pic(X_C), n↦[O(n)], is an isomorphism of groups. Every classical point has divisor class [O(1)]. Use the existing invertible-sheaf and line-bundle-class carriers, adding dual inverses and the curve-specific integer classification; a commutative monoid of classes in the baseline is not already this Picard computation.

**Sources:** [FS][FS], Proposition II.2.10 and proof, p. 68.

**Prerequisites:** [Regular noetherian geometric curve and PID complements](#schematic-curve-at-a-geometric-point); [Elementary algebraization at a geometric point](#geometric-point-chart-cover); [The exact tensor isocrystal-to-bundle functor](#isocrystal-to-bundle-functor); `tauceti:TauCeti.AlgebraicGeometry.InvertibleSheaf`; `tauceti:TauCeti.AlgebraicGeometry.LineBundleClass`; `mathlib:CommRing.Pic`.

### Degree, saturation and Harder–Narasimhan theory

Degree bounds for subbundles of each rank and the saturation axioms establish HN existence before classification. Construct meromorphic trivializations with bounded finite divisor poles, and derive the degree upper bounds by exterior powers; this argument must not assume general relative positive generation. Filtration pieces are saturated, slopes decrease strictly, and rank lengths determine the concave polygon.

<a id="degree-rank-slope-and-HN-formalism"></a>

#### Rank, determinant degree and rational slope

For V∈Bun(X_C), rank(V) is its finite locally constant rank, constant on connected X_C. Set deg(V)=PicDegree(det V)∈Z and μ(V)=deg(V)/rank(V)∈Q only for V≠0. Rank and degree are additive in bundle short exact sequences; deg(V⊗W)=rank(W)deg(V)+rank(V)deg(W), deg(V∨)=−deg(V). For O(d/h) in reduced form, rank=h and degree=d. No global degree function on arbitrary perfectoid S is asserted; VB4 uses geometric fibers.

**API.**

- `bundleRank`: Constant finite rank on X_C.
- `bundleDegree`: Integer Picard degree of the determinant.
- `bundleSlope`: Rational degree/rank for a nonzero bundle.
- `bundleDegree.exact`: Degree and rank add in short exact sequences.
- `bundleDegree.tensorDual`: Tensor determinant formula and dual sign.
- `bundleDegree.standard`: For λ=d/h reduced, rank O(λ)=h and degree O(λ)=d.

**Examples and checks.**

- `bundleDegree_zero`: Rank and degree of the zero bundle are both zero; slope is undefined.
- `bundleDegree_half`: O(1/2) has (rank,degree,slope)=(2,1,1/2).
- `bundleDegree_dual`: O(1/2)∨ has rank 2, degree −1 and slope −1/2.
- `bundleDegree_directSum`: O(1)⊕O(−1) has rank 2 and degree 0, although its HN slopes are 1 and −1.

**Sources:** [FS][FS], After Proposition II.2.10, pp. 68–69; [FF][FF], 5.5.1, pp. 162–163 (rank/degree axioms p. 162; Definition 5.5.1 p. 163).

**Prerequisites:** [Finite locally free bundles on the curve](#finite-locally-free-bundles); [Picard group of the geometric curve](#picard-degree); [Tensor and dual calculus for isocrystals](#tensor-and-dual-slopes); [The exact tensor isocrystal-to-bundle functor](#isocrystal-to-bundle-functor); `SchemeAndStackFoundations:SF.0`.

<a id="saturation-and-torsion-degree"></a>

#### Saturation and torsion degree on the geometric curve

For a coherent subsheaf F of a geometric bundle V, its saturation F^sat is the inverse image of the torsion subsheaf of V/F, so V/F^sat is torsion free and locally free on the regular one-dimensional curve. A torsion coherent sheaf T has degree ∑_x length_{O_x}(T_x)deg(x), with deg(x)=1 at a classical point. A generic-fiber isomorphism F→G of bundles satisfies deg(F)≤deg(G), with equality iff it is an isomorphism. This gives the strict-subobject and degree-monotonicity HN axioms.

**API.**

- `bundleSaturation`: The saturated inverse image inside V.
- `bundleSaturation.universal`: Smallest saturated subsheaf containing F; its quotient is torsion free.
- `bundleSaturation.idempotent`: Saturating an already saturated subsheaf does nothing.
- `torsionDegree`: Finite sum of local DVR lengths times point degree.
- `torsionDegree.exact`: Torsion degree is additive in short exact sequences.
- `genericIso_degree`: Generic bundle injection has nonnegative degree defect, zero precisely for an isomorphism.

**Examples and checks.**

- `saturation_zero`: The zero subbundle of a torsion-free bundle is saturated.
- `saturation_divisor`: The image O(−1)⊂O cut out by one classical point saturates to O, with torsion degree 1.
- `torsionDegree_length_two`: O_x/(t_x²) has degree 2, not degree 1.
- `saturation_not_same_rank`: Equal generic rank does not make O(−1)→O an isomorphism; its degree defect is positive.

**Sources:** [FF][FF], 5.5.2.1, printed p. 164; generic-isomorphism axioms in 5.5.1, p. 162.

**Prerequisites:** [Regular noetherian geometric curve and PID complements](#schematic-curve-at-a-geometric-point); [Untilts and completed local rings](#completed-local-ring-comparison); [Rank, determinant degree and rational slope](#degree-rank-slope-and-HN-formalism); `SchemeAndStackFoundations:SF.0`.

<a id="geometric-semistability"></a>

#### Stable and semistable geometric bundles

A nonzero bundle V on X_C is semistable if every proper nonzero saturated subbundle F has μ(F)≤μ(V), and stable if the inequality is strict. Checking all coherent subsheaves of smaller positive rank is equivalent after saturation. The zero bundle is admitted into each fixed-slope subcategory separately, but has no slope and is not called stable.

**API.**

- `BundleSemistable`: Nonzero V and the weak inequalities for proper saturated subbundles.
- `BundleStable`: Nonzero V and the strict inequalities.
- `BundleStable.semistable`: Stable implies semistable.
- `BundleSemistable.iso`: Stability and semistability are invariant under bundle isomorphisms.
- `BundleSemistable.saturation`: Equivalent test using coherent subsheaves of smaller positive rank.

**Examples and checks.**

- `bundleSemistable_line`: Every line bundle is stable: there is no proper positive-rank saturated subbundle.
- `bundleSemistable_equal_sum`: O⊕O is semistable of slope 0 but is not stable.
- `bundleSemistable_unequal_sum`: O(1)⊕O(−1) is not semistable: O(1) has slope 1>0.
- `bundleStable_zero`: The zero bundle is not stable and is never assigned a finite slope.

**Sources:** [FS][FS], Before Example II.2.11, p. 69; [FF][FF], Definition 5.5.5 and Proposition 5.5.6, p. 164.

**Prerequisites:** [Rank, determinant degree and rational slope](#degree-rank-slope-and-HN-formalism); [Saturation and torsion degree on the geometric curve](#saturation-and-torsion-degree).

<a id="harder-narasimhan-filtration"></a>

#### Harder–Narasimhan filtration of geometric bundles

Every bundle V on X_C has a unique finite exhaustive filtration by saturated subbundles with nonzero semistable graded pieces of strictly decreasing rational slopes. Write V^{≥λ} for the decreasing threshold filtration; it is functorial and invariant under isomorphism. The zero bundle has the empty filtration. Existence uses the HN axioms, including boundedness of degrees of subbundles of each rank; it does not use the geometric classification theorem.

**API.**

- `HNFiltration`: The unique saturated finite decreasing-slope filtration.
- `HNFiltration.threshold`: V^{≥λ} for a rational threshold λ.
- `HNFiltration.graded`: Semistable graded bundles and their ranks and degrees.
- `HNFiltration.unique`: Every filtration satisfying these properties equals the canonical one.
- `HNFiltration.functorial`: Every bundle morphism preserves each threshold piece.
- `HNFiltration.semistable`: A nonzero bundle is semistable iff it has one HN slope.

**Examples and checks.**

- `hnFiltration_zero`: The zero bundle has no nonzero HN graded pieces.
- `hnFiltration_two_slopes`: O(1)⊕O(−1) has descending HN slopes 1,−1 and rank-one pieces.
- `hnFiltration_equal_slopes`: O⊕O has one slope-zero piece of rank 2, rather than two strictly decreasing equal slopes.
- `hnFiltration_threshold`: For O(1)⊕O(−1), the threshold ≥0 is O(1).

**Sources:** [FS][FS], Proposition II.2.12, p. 69; [FF][FF], 5.5.1–5.5.4, pp. 162–164.

**Prerequisites:** [Stable and semistable geometric bundles](#geometric-semistability); [Saturation and torsion degree on the geometric curve](#saturation-and-torsion-degree); [Rank, determinant degree and rational slope](#degree-rank-slope-and-HN-formalism); [Regular noetherian geometric curve and PID complements](#schematic-curve-at-a-geometric-point); [Slope-sensitive cohomology of standard bundles](#cohomology-of-twists).

<a id="harder-narasimhan-polygon"></a>

#### Rank-normalized Harder–Narasimhan polygon

For HN graded pieces with ranks r_i and slopes λ_1>…>λ_m, the HN polygon is the concave piecewise-linear function on [0,rank V] starting at (0,0), with segment length r_i and slope λ_i. It ends at (rank V,deg V). For V=0 it is the single point (0,0). Use rank lengths, not one unit per simple block.

**API.**

- `HNPolygon`: The rational piecewise-linear polygon from HN graded data.
- `HNPolygon.vertices`: Cumulative rank and degree vertices.
- `HNPolygon.endpoint`: Endpoint (rank V,deg V).
- `HNPolygon.concave`: The polygon has decreasing segment slopes.
- `HNPolygon.directSum`: Direct sum merges the descending slope multisets, weighted by ranks.

**Examples and checks.**

- `hnPolygon_zero`: The zero polygon has only (0,0).
- `hnPolygon_half`: For O(1/2) the endpoint is (2,1), not (1,1/2).
- `hnPolygon_split`: For O(1)⊕O(−1), vertices are (0,0),(1,1),(2,0).
- `hnPolygon_not_slope_only`: The polygon of O(1)⊕O(−1) is not the horizontal rank-two degree-zero segment.

**Sources:** [FF][FF], Theorem 5.5.3, p. 163.

**Prerequisites:** [Harder–Narasimhan filtration of geometric bundles](#harder-narasimhan-filtration).

## Layer VB2:ampleness — Positive generation and algebraization

### Positive twists and the global schematic comparison

The generation proof separates the two half-annuli and uses the corrected contraction bounds of KL §§6.2.2–6.2.4. A general-E proof transports these bounds through the normalized π/q coefficient comparison. Construct invertible large-degree shifts first, then recover the degree-one line from consecutive powers. These inputs give the global map and the bundle GAGA equivalence.

<a id="quantitative-global-generation"></a>

#### Global generation and vanishing after positive twists

For affinoid perfectoid S/F_q and V∈Bun(X_S), there is n_0 such that for every n≥n_0, V(n) is generated by finitely many global sections and H^i(X_S,V(n))=0 for all i>0. The bound depends on V and the chosen affinoid S. On a general perfectoid base the assertion is local on S; no uniform global bound is asserted. The quantitative proof uses the two half-annulus contraction estimates of KL6.2.2–6.2.4, not the defective estimate (II.2.1) in FS.

**Sources:** [FS][FS], Theorem II.2.6 and proof, pp. 64–66; [KL][KL], Propositions 6.2.2–6.2.4 and Remark 6.2.5, pp. 136–137.

**Prerequisites:** [Exact tensor equivalence of Robba modules and curve bundles](#robba-bundle-equivalence); [Two-term Frobenius complex for curve cohomology](#frobenius-two-term-cohomology); [Slope-sensitive cohomology of standard bundles](#cohomology-of-twists); `KTheoryLowDegrees:Z.1`; `RelativeFarguesFontaine:RF3/isocrystal-line-bundles-and-sign`; `RelativeFarguesFontaine:RF3/graded-algebra-and-algebraic-curve-map`; `AdicSpacesPartII:R3/locally-free-sheaf`; `AdicSpacesPartII:R3/sheafy-tate-acyclicity-and-kiehl-gluing`.

<a id="global-proj-map-and-twists"></a>

#### Global Proj map and compatible schematic twists

For affinoid perfectoid S, set X_S^alg=Proj(P_S) using the RF3 graded ring. Apply GG to prove the homogeneous nonvanishing loci cover X_S, then glue the RF3 chart maps to α_S:X_S→X_S^alg. For sufficiently large positive m, construct invertible O_alg(m) with pullback O(m) and compatible multiplication; use consecutive large powers to define O_alg(1) and all integer tensor powers. Do not assume the naive Proj shift sheaf in degree one is already invertible for an arbitrary graded ring.

**API.**

- `curveProjMap`: Global α_S after homogeneous chart coverage.
- `curveProjMap.chart`: Its restriction is the RF3 homogeneous localization chart map.
- `algebraicTwist`: Invertible O_alg(n), obtained from compatible sufficiently large shifts.
- `algebraicTwist.pullback`: α_S*O_alg(n)≅O(n).
- `algebraicTwist.add`: O_alg(n+m)≅O_alg(n)⊗O_alg(m), coherently.
- `algebraicTwist.largeShift`: For large n it agrees with the Proj graded shift sheaf.

**Examples and checks.**

- `algebraicTwist_zero`: O_alg(0) is the structure-sheaf tensor unit.
- `algebraicTwist_consecutive`: O_alg(a+1)⊗O_alg(a)∨ pulls back to O(1).
- `algebraicTwist_inverse`: O_alg(−1) is the dual of O_alg(1).
- `curveProjMap_coverage`: A map on the union of D(f) is not called curveProjMap before the union is proved to be X_S.

**Sources:** [FS][FS], Proposition II.2.7, pp. 66–67.

**Prerequisites:** [Global generation and vanishing after positive twists](#quantitative-global-generation); `RelativeFarguesFontaine:RF3/isocrystal-line-bundles-and-sign`; `RelativeFarguesFontaine:RF3/graded-algebra-and-algebraic-curve-map`; `SchemeAndStackFoundations:SF.0`; [Finite locally free bundles on the curve](#finite-locally-free-bundles).

<a id="gaga-equivalence"></a>

#### GAGA for the relative schematic curve

Let X be a locally ringed spectral space with line bundle O(1) such that every finite locally free V has V(n) globally generated and H^i(X,V(n))=0 for all i>0 and all sufficiently large n. The homogeneous chart maps define a global α:X→Proj⊕Γ(X,O(n)); pullback gives an exact tensor equivalence of finite locally free bundles and comparison isomorphisms on all bundle cohomology. Apply this to X_S for affinoid perfectoid S via GG and GMap. No coherent-sheaf equivalence on arbitrary nonnoetherian S is inferred from this bundle statement.

**Sources:** [FS][FS], Proposition II.2.7 and proof, pp. 66–67.

**Prerequisites:** [Global generation and vanishing after positive twists](#quantitative-global-generation); [Global Proj map and compatible schematic twists](#global-proj-map-and-twists); [Finite locally free bundles on the curve](#finite-locally-free-bundles); `SchemeAndStackFoundations:SF.0`; `DiamondsAndVStacks:D0/cech-to-derived-comparison`.

<a id="independence-of-positive-twist"></a>

#### Independence of the ample line bundle

Two line bundles satisfying the axiomatic generation/vanishing hypotheses on the same X yield canonically isomorphic Proj schemes, with the same locally ringed map from X and the same finite locally free equivalence. The identification is functorial and obeys the cocycle law for three choices. No arbitrary choice of line bundle without these hypotheses is included.

**Sources:** [FS][FS], Remark II.2.8, p. 67; [KL][KL], 8.8.8–8.8.9, p. 182.

**Prerequisites:** [GAGA for the relative schematic curve](#gaga-equivalence); [Global Proj map and compatible schematic twists](#global-proj-map-and-twists); `SchemeAndStackFoundations:SF.0`; [Affine nonvanishing loci of ample line sections](#ample-section-affineness).

### Robba topology, coherent modules and group actions

<a id="prufer-and-coherent-correspondence"></a>

#### Prüfer charts and coherent Frobenius correspondence

For an absolute analytic characteristic-p field F in the KL setting, every positive homogeneous chart ring P_F[f^{-1}]_0 is Prüfer. Coherent sheaves on Proj(P_F) correspond to finitely presented R̃_F-modules with invertible Frobenius linearization. Finite locally free objects correspond to finite projective Frobenius modules. The claim is absolute; Prüfer or Bézout hypotheses are not silently imposed on arbitrary relative bases.

**Sources:** [KL][KL], Definition 6.3.5, Lemma 6.3.6 and Theorem 6.3.14, pp. 138–142 (Theorem 6.3.14 printed p. 142).

**Prerequisites:** [Relative tilted Robba ring from curve annuli](#tilted-robba-ring); [Finite projective Frobenius modules and integral models](#robba-frobenius-modules); [GAGA for the relative schematic curve](#gaga-equivalence); `RelativeFarguesFontaine:RF0/ramified-witt-universal-property`; `RelativeFarguesFontaine:RF0:annuli/radius-function-and-rational-annuli`; `SchemeAndStackFoundations:SF.0`.

<a id="norms-on-twisted-invariants"></a>

#### Norm topology on twisted Frobenius invariants

For a finite projective tilted Robba Frobenius module M and each fixed integer n, the space Γ_n(M)=ker(φ−π^n) has a canonical Banach topology from a sufficiently small annular radius. Its induced norms at admissible radii and from finite projective presentations are equivalent. This is a separate assertion for each n; no uniform norm-equivalence constant over all n is asserted.

**API.**

- `TwistedInvariant`: The kernel of φ−π^n as an E-vector space.
- `TwistedInvariant.norm`: Banach topology at a fixed n from any admissible annular norm.
- `TwistedInvariant.radiusEquiv`: Different sufficiently small radii induce equivalent norms.
- `TwistedInvariant.map`: Intertwining module maps act continuously on Γ_n.
- `TwistedInvariant.presentationIndependent`: The topological vector space is independent of projective presentation.

**Examples and checks.**

- `twistedInvariant_zero`: For M=0 the invariant Banach space is zero.
- `twistedInvariant_n_zero`: At n=0 the space is ker(φ−1).
- `twistedInvariant_change_radius`: Two admissible radii induce the same open subsets of Γ_n.
- `twistedInvariant_not_exact_norm`: Rescaling the chosen module norm changes its numeric values but leaves the invariant topology unchanged.
- `twistedInvariant_sign`: On the rank-one module with φ=π·id, π≠0 and π²≠1, Γ_1 is the whole space while ker(φ−π^{-1}) is zero. This detects the sign mismatch in KL6.3.17.

**Sources:** [KL][KL], Lemma 6.3.17, p. 142.

**Prerequisites:** [Finite projective Frobenius modules and integral models](#robba-frobenius-modules); [Relative tilted Robba ring from curve annuli](#tilted-robba-ring); [Exact tensor equivalence of Robba modules and curve bundles](#robba-bundle-equivalence).

<a id="continuous-frobenius-group-actions"></a>

#### Continuous profinite actions on Frobenius modules

Let a profinite group G act by continuous E-algebra automorphisms on every fixed-radius Fréchet piece of R̃_R and commute with Frobenius; in particular it fixes E and π. A semilinear G-action on M is LF-continuous if its action map is continuous for the annular LF topology. This is equivalent to continuity of G on every Γ_n(M) with its fixed-n Banach topology. Actions commute with Frobenius and preserve the specified ring action, hence act E-linearly on each invariant space.

**API.**

- `ContinuousPhiAction`: Frobenius-commuting semilinear G-action, whose coefficient action fixes E, with a jointly LF-continuous action map.
- `ContinuousPhiAction.restrictInvariants`: Continuous E-linear action on Γ_n for each n.
- `ContinuousPhiAction.invariantCriterion`: LF continuity iff every twisted-invariant action is continuous.
- `ContinuousPhiAction.baseChange`: Continuous scalar extension along an E-algebra map compatible with the coefficient actions and Frobenius preserves the action.

**Examples and checks.**

- `continuousPhiAction_trivial`: The trivial group action is continuous and commutes with φ.
- `continuousPhiAction_all_weights`: The criterion quantifies over all integers n, including negative and zero twists.
- `continuousPhiAction_finite`: A finite discrete group acting by continuous semilinear automorphisms yields a continuous action.
- `continuousPhiAction_requires_commutation`: A continuous module action that does not commute with φ does not restrict to the invariant spaces and is excluded.

**Sources:** [KL][KL], Definition 6.3.18, printed p. 143.

**Prerequisites:** [Norm topology on twisted Frobenius invariants](#norms-on-twisted-invariants); [Finite projective Frobenius modules and integral models](#robba-frobenius-modules); [Relative tilted Robba ring from curve annuli](#tilted-robba-ring); [Global generation and vanishing after positive twists](#quantitative-global-generation).

### Tensor ampleness and its criteria

Tensor global ampleness tests every finite-type quasi-coherent sheaf. Rational-local ampleness is local on the perfectoid base. The cohomological criterion must produce a power independent of the integer test twist before applying the power criterion; thresholds for an arbitrary test sheaf can still depend on that sheaf.

<a id="two-affine-cover-cohomological-dimension"></a>

#### Two affine charts and cohomological dimension one

In the relative KL setting choose a fixed analytic coefficient field L and two homogeneous sections f_1,f_2 of the same positive degree whose images generate the unit ideal in the tilted Robba ring. Their D_+(f_i) cover Proj(P_R), each is affine and their intersection is affine. Every quasi-coherent sheaf G has H^i=0 for i>1; Čech cohomology on this two-open cover computes H⁰ and H¹. The degree-one normalization is the one used by KL 8.8.

**Sources:** [KL][KL], Remark 8.7.6 and Theorem 8.7.7, printed p. 178.

**Prerequisites:** [Global generation and vanishing after positive twists](#quantitative-global-generation); [Global Proj map and compatible schematic twists](#global-proj-map-and-twists); `SchemeAndStackFoundations:SF.0`; `DiamondsAndVStacks:D0/cech-to-derived-comparison`; [Relative tilted Robba ring from curve annuli](#tilted-robba-ring).

<a id="tensor-global-ampleness"></a>

#### Tensor global ampleness and rational-local ampleness

For a finite locally free F on X_S^alg, GloballyAmple(F) means: for every finite-type quasi-coherent G, there exists N(G) such that F^{⊗n}⊗G is globally generated by finitely many sections for all n≥N(G). Ample(F) means this on a strong rational covering of the perfectoid base. This is KL’s tensor-power bundle notion, not an unproved equivalence with projective-bundle ampleness or with pointwise positive slopes.

**API.**

- `BundleGloballyAmple`: ∀ finite-type G, eventually every F^{⊗n}⊗G is finitely globally generated.
- `BundleAmple`: Global ampleness after a strong rational cover of S.
- `BundleGloballyAmple.iso`: The predicates are invariant under bundle isomorphism.
- `BundleGloballyAmple.tensorPower`: Positive powers preserve and detect the predicate.
- `BundleAmple.refine`: A refinement of the witnessing strong rational cover is also a witness.

**Examples and checks.**

- `bundleAmple_positive_line`: O(1) is globally ample.
- `bundleAmple_unit_fails`: O is not globally ample: tensor with O(−1) has no global sections on the geometric curve.
- `bundleAmple_zero`: Under the tensor-power definition the zero bundle is globally ample: for n≥1 its tensor power times every G is zero, generated by the empty finite family. No positive-rank hypothesis is added.
- `bundleAmple_threshold`: For O(1) tested against O(−m), a generation bound grows with m; a common threshold for all m is not required.

**Sources:** [KL][KL], Definition 8.8.2, printed p. 180.

**Prerequisites:** [Finite locally free bundles on the curve](#finite-locally-free-bundles); [Global Proj map and compatible schematic twists](#global-proj-map-and-twists); `SchemeAndStackFoundations:SF.0`; [Two affine charts and cohomological dimension one](#two-affine-cover-cohomological-dimension).

<a id="ampleness-power-criterion"></a>

#### Power criterion for tensor global ampleness

For every positive integer m, F is globally ample iff F^{⊗m} is globally ample, with the same statement for rational-local ampleness. The test sheaf remains every finite-type quasi-coherent G.

**Sources:** [KL][KL], Lemma 8.8.3, printed p. 180.

**Prerequisites:** [Tensor global ampleness and rational-local ampleness](#tensor-global-ampleness).

<a id="positive-lines-and-finite-type-presentations"></a>

#### Positive line ampleness and finite-type presentations

For every integer e>0, O_alg(e) is globally ample. Every finite-type quasi-coherent G on X_S^alg is a quotient of a finite sum of integer twists O_alg(e_i). On each of the two affine charts take finitely many local generators and multiply by sufficiently high powers of its homogeneous section to extend them globally; use both charts and a common maximum exponent.

**Sources:** [KL][KL], Lemma 8.8.4 (statement p. 180, proof p. 181) and Corollary 8.8.5, p. 181.

**Prerequisites:** [Global generation and vanishing after positive twists](#quantitative-global-generation); [Two affine charts and cohomological dimension one](#two-affine-cover-cohomological-dimension); [Global Proj map and compatible schematic twists](#global-proj-map-and-twists); [Tensor global ampleness and rational-local ampleness](#tensor-global-ampleness); `SchemeAndStackFoundations:SF.0`; [Power criterion for tensor global ampleness](#ampleness-power-criterion).

<a id="cohomological-ampleness-criterion"></a>

#### Cohomological criterion for tensor global ampleness

For a bundle F on X_S^alg the following are equivalent: (a) F is globally ample; (b) for every finite-type quasi-coherent G, H¹(F^{⊗n}⊗G)=0 for all sufficiently large n; (c) for every e∈Z, H¹(F^{⊗n}(e))=0 for all sufficiently large n. Thresholds may depend on G or e. The implication (c)⇒(a) must produce one positive power independently of e, then apply the power criterion.

**Sources:** [KL][KL], Proposition 8.8.6 and proof, pp. 181–182.

**Prerequisites:** [Tensor global ampleness and rational-local ampleness](#tensor-global-ampleness); [Power criterion for tensor global ampleness](#ampleness-power-criterion); [Positive line ampleness and finite-type presentations](#positive-lines-and-finite-type-presentations); [Two affine charts and cohomological dimension one](#two-affine-cover-cohomological-dimension); [Slope-sensitive cohomology of standard bundles](#cohomology-of-twists); [GAGA for the relative schematic curve](#gaga-equivalence).

<a id="globally-etale-positive-ampleness"></a>

#### Positive twists of globally étale bundles

In the KL coefficient setting, if F corresponds to a Robba Frobenius module with a global finite locally free étale integral model, then for every integer n>0, H¹(F(n))=0 and F(n) is globally ample. The global model hypothesis is stronger than pointwise purity. General-E specialization requires the normalized RF0 comparison; no converse to this theorem is asserted.

**Sources:** [KL][KL], Corollary 8.8.7, p. 182.

**Prerequisites:** [Finite projective Frobenius modules and integral models](#robba-frobenius-modules); [Exact tensor equivalence of Robba modules and curve bundles](#robba-bundle-equivalence); [Cohomological criterion for tensor global ampleness](#cohomological-ampleness-criterion); [Slope-sensitive cohomology of standard bundles](#cohomology-of-twists); [GAGA for the relative schematic curve](#gaga-equivalence).

<a id="ample-section-affineness"></a>

#### Affine nonvanishing loci of ample line sections

If L is a globally ample line bundle on X_S^alg and s∈Γ(L), the open nonvanishing locus D(s) is affine, including the empty case. Its coordinate ring is the degree-zero localization of ⊕_{n≥0}Γ(L^{⊗n}) at s. This yields intrinsic Proj reconstruction and the canonical independence comparison for ample choices.

**Sources:** [KL][KL], Lemma 8.8.8 and Corollary 8.8.9, p. 182.

**Prerequisites:** [Tensor global ampleness and rational-local ampleness](#tensor-global-ampleness); [Cohomological criterion for tensor global ampleness](#cohomological-ampleness-criterion); [Two affine charts and cohomological dimension one](#two-affine-cover-cohomological-dimension); `SchemeAndStackFoundations:SF.0`.

## Layer VB2:classification — Geometric classification and its consequences

### Stable blocks, fixed-slope categories and base change

<a id="standard-bundle-stability"></a>

#### Stability of rational standard bundles

For every λ=d/h in lowest terms, O_{X_C}(λ) is stable of rank h, degree d and slope λ. If a saturated subbundle F has rank r<h and degree s, then s/r≤λ by the wedge/H⁰ argument; equality would force h|r and is impossible.

**Sources:** [FS][FS], Example II.2.11 and proof, p. 69.

**Prerequisites:** [The exact tensor isocrystal-to-bundle functor](#isocrystal-to-bundle-functor); [Rank, determinant degree and rational slope](#degree-rank-slope-and-HN-formalism); [Stable and semistable geometric bundles](#geometric-semistability); [Slope-sensitive cohomology of standard bundles](#cohomology-of-twists); [Tensor and dual calculus for isocrystals](#tensor-and-dual-slopes).

<a id="fixed-slope-abelian-category"></a>

#### Fixed-slope abelian finite-length category

For each λ∈Q, semistable bundles of slope λ together with the zero bundle form an E-linear abelian finite-length category. Its simple objects are the stable bundles. Kernels and cokernels inside this category are saturated bundle kernels and quotients; a nonzero map between stable equal-slope objects is an isomorphism. This statement precedes classification and does not yet identify all simple objects with O(λ).

**Sources:** [FF][FF], Theorem 5.5.4 and Proposition 5.5.6, pp. 163–164.

**Prerequisites:** [Stable and semistable geometric bundles](#geometric-semistability); [Harder–Narasimhan filtration of geometric bundles](#harder-narasimhan-filtration); [Saturation and torsion degree on the geometric curve](#saturation-and-torsion-degree).

<a id="HN-filtration-base-change"></a>

#### Base change of the geometric HN filtration

For an extension of complete algebraically closed perfectoid fields C⊂C′, the pullback of every threshold HN piece is the corresponding threshold piece on X_C′. For finite separable E′/E of degree n, the finite coefficient curve map f satisfies (f*V)^{≥λ}=f*(V^{≥λ/n}); ranks are preserved and degrees/slopes multiply by n. In particular f*O(1)=O(n). These are geometric-field and coefficient changes with different normalizations.

**Sources:** [FS][FS], Proposition II.2.13 and proof, pp. 69–70.

**Prerequisites:** [Harder–Narasimhan filtration of geometric bundles](#harder-narasimhan-filtration); [V-descent of bundles and their derived cohomology](#v-descent-for-bundles-and-cohomology); [Coefficient extension and induction adjunction](#scalar-extension-adjunction); [Rank, determinant degree and rational slope](#degree-rank-slope-and-HN-formalism); [Fixed-slope abelian finite-length category](#fixed-slope-abelian-category); [The exact tensor isocrystal-to-bundle functor](#isocrystal-to-bundle-functor).

### Classification and Hom/Ext calculations

The key extension lemma supplies a nonzero section after a geometric field extension. For general E it uses the affine-line diamond comparison: in equal characteristic use the perfected analytic line and convergent additive series. The equation g(πX)=πg(X) eliminates all exponents except one. To descend a classification map across a finite coefficient cover, use the reverse finite étale trace adjunction Hom(O(s),f*V)≃Hom(f*O(s),V), then the standard-block induction formula. The endomorphism theorem on a single simple block does not assert full faithfulness between distinct slopes.

<a id="key-extension-lemma"></a>

#### Nonzero sections of the key rank-one extension

Let C be complete algebraically closed and let 0→O(−1)→V→O(1/n)→0 be a bundle extension on X_C, n≥1. After an extension C′/C of complete algebraically closed perfectoid fields, H⁰(X_C′,V)≠0. The proof applies in both mixed and equal characteristic and does not require a prior claim that the negative Banach–Colmez quotient is nonperfectoid in equal characteristic.

**Sources:** [FS][FS], Lemma II.2.15 and proof, pp. 71–72.

**Prerequisites:** [Slope-sensitive cohomology of standard bundles](#cohomology-of-twists); [Two-term Frobenius complex for curve cohomology](#frobenius-two-term-cohomology); [V-descent of bundles and their derived cohomology](#v-descent-for-bundles-and-cohomology); [The fundamental untilt sequence and degree-one divisors](#fundamental-exact-sequence); `AdicEtaleGeometry:A1`.

<a id="dieudonne-manin-classification-of-bundles"></a>

#### Geometric classification of vector bundles

For complete algebraically closed perfectoid C/F_q, every bundle on X_C is a finite direct sum of O(λ), uniquely up to permutation of reduced rational slopes and multiplicities. The HN filtration splits, and every semistable slope-λ bundle is O(λ)^{⊕m}. After choosing the embedding k=bar F_q→C, the finite-isocrystal functor induces a bijection on isomorphism classes in this geometric setting, but is not fully faithful on all morphisms and is not asserted to classify relative bundles on arbitrary S.

**Sources:** [FS][FS], Theorem II.2.14 and proof, pp. 70–72; [FF][FF], Theorem 8.2.10, pp. 238–239.

**Prerequisites:** [Dieudonné–Manin classification of finite isocrystals](#dieudonne-manin-isocrystals); [The exact tensor isocrystal-to-bundle functor](#isocrystal-to-bundle-functor); [Stability of rational standard bundles](#standard-bundle-stability); [Fixed-slope abelian finite-length category](#fixed-slope-abelian-category); [Harder–Narasimhan filtration of geometric bundles](#harder-narasimhan-filtration); [Base change of the geometric HN filtration](#HN-filtration-base-change); [Nonzero sections of the key rank-one extension](#key-extension-lemma); [Slope-sensitive cohomology of standard bundles](#cohomology-of-twists); [Coefficient extension and induction adjunction](#scalar-extension-adjunction); `DiamondsAndVStacks:D3/locally-profinite-torsors`; [Global generation and vanishing after positive twists](#quantitative-global-generation).

<a id="hom-and-ext-calculus"></a>

#### Hom and extension calculus for geometric bundles

For geometric standard bundles on X_C^alg, compute Ext in the abelian category of structure-sheaf modules (equivalently QCoh for these finite locally free inputs), with Ext¹ also classifying bundle extensions. Hom(O(λ),O(μ))=H⁰(O(λ)∨⊗O(μ)) vanishes for λ>μ, and Ext¹(O(λ),O(μ))=H¹(O(λ)∨⊗O(μ)) vanishes for λ≤μ. The tensor decomposes into h_λh_μ/h_{μ−λ} copies of O(μ−λ). Ext^i between these bundles vanishes for i>1. Equal-slope End(O(λ)) need not be E when its denominator exceeds one.

**Sources:** [FF][FF], Proposition 5.6.23(4)–(5), statement p. 181; proof p. 183.

**Prerequisites:** [Geometric classification of vector bundles](#dieudonne-manin-classification-of-bundles); [Slope-sensitive cohomology of standard bundles](#cohomology-of-twists); [Tensor and dual calculus for isocrystals](#tensor-and-dual-slopes); [Two-term Frobenius complex for curve cohomology](#frobenius-two-term-cohomology); `SchemeAndStackFoundations:SF.0`; [GAGA for the relative schematic curve](#gaga-equivalence); [Two affine charts and cohomological dimension one](#two-affine-cover-cohomological-dimension).

<a id="bundle-endomorphism-comparison"></a>

#### Stable-bundle division endomorphism comparison

The natural E-algebra map End_Φ(D(−d,h))→End_{X_C}(O(d/h)) is an isomorphism for each reduced rational slope. Both identify with D_{d/h}, of dimension h² and invariant d/h mod Z. This full endomorphism comparison on one simple block coexists with the failure of full faithfulness between different slopes.

**Sources:** [FF][FF], Proposition 8.2.8 and proof, pp. 237–238.

**Prerequisites:** [Division endomorphisms of a simple isocrystal](#endomorphism-division-algebra); [Slope-labelled cyclic algebra](#slope-division-algebra); [Arithmetic Brauer invariant and slope normalization](#brauer-invariant-sign); [The exact tensor isocrystal-to-bundle functor](#isocrystal-to-bundle-functor); [Hom and extension calculus for geometric bundles](#hom-and-ext-calculus).

### Coherent sheaves and finite étale algebras

The torsion decomposition uses the DVRs at closed points and a noncanonical splitting. The finite étale algebra theorem exports coefficient-field covers to VS1; the later Weil-map and reciprocity constructions remain there.

<a id="coherent-sheaf-classification"></a>

#### Coherent sheaves on the geometric curve

Every coherent sheaf F on X_C^alg is, noncanonically, a direct sum T⊕V with T its torsion subsheaf and V a finite sum of O(λ). T has finite support at closed untilt points and each local piece is a finite sum of O_x/(t_x^{n_j}), n_j>0. The torsion-free quotient is locally free because the curve is regular and one-dimensional; the split is not claimed canonical. This specializes CN Theorem 3.9(iii) at E=Q_p and applies to the general-E geometric curve using its DVR charts.

**Sources:** [CN (arXiv)][CN-arXiv], §3.2.3, Theorem 3.9(iii), pp. 14–15.

**Prerequisites:** [Regular noetherian geometric curve and PID complements](#schematic-curve-at-a-geometric-point); [Untilts and completed local rings](#completed-local-ring-comparison); [Saturation and torsion degree on the geometric curve](#saturation-and-torsion-degree); [Geometric classification of vector bundles](#dieudonne-manin-classification-of-bundles); [Hom and extension calculus for geometric bundles](#hom-and-ext-calculus); `SchemeAndStackFoundations:SF.0`.

<a id="finite-etale-constant-algebras"></a>

#### Geometric simple connectivity via finite étale algebras

For complete algebraically closed perfectoid C, every finite étale O_{X_C}-algebra B is canonically O_{X_C}⊗_E A with A=H⁰(X_C,B) a finite étale E-algebra. Thus finite étale covers of X_C are exactly coefficient-field covers; after base change to an algebraic closure of E they split. The statement is not that X_C has no nontrivial covers over nonalgebraically closed E. Export this theorem to VStackSheavesAndLisseCategories:VS1 for its divisor and Weil-map construction.

**Sources:** [FF][FF], Theorem 8.6.1 and proof, pp. 248–249; [SW][SW], Theorem 13.5.7 and proof, printed p. 114 (PDF p. 124).

**Prerequisites:** [Geometric classification of vector bundles](#dieudonne-manin-classification-of-bundles); [Hom and extension calculus for geometric bundles](#hom-and-ext-calculus); [Rank, determinant degree and rational slope](#degree-rank-slope-and-HN-formalism); [GAGA for the relative schematic curve](#gaga-equivalence); `SchemeAndStackFoundations:SF.0`; `AdicSpacesPartII:R3/etale-iff-trace-pairing-perfect`.

## Layer VB3 — Banach–Colmez spaces

### Basic section sheaves, Lubin–Tate geometry and projectivization

These are the early geometric constructions used in VB1. The crystalline φ=π Hom comparison is an explicit input from R07.2; the full-faithfulness statement of SW13 alone does not prove that comparison. Separate the degree-one sequence and section/divisor quotient from its later arithmetic torsor comparison.

<a id="banach-colmez-space-definition"></a>

#### Banach–Colmez section and hypercohomology sheaves

For a perfectoid S/F_q and a bundle E on X_S, BC(E)(T)=H⁰(X_T,E_T). If E has only negative geometric slopes, BCneg(E)(T)=H¹(X_T,E_T). For a complex [E₁→E₀] in COHOMOLOGICAL degrees −1,0 with H⁰(X_T,E₁,T)=0 for EVERY T/S, BCcomplex(T)=H⁰ RΓ(X_T,[E₁→E₀]_T), the degree-zero hypercohomology v-sheaf. No representability is assumed. FS calls these homological degrees [0,1].

S belongs to Perf_Fq; coefficients are the fixed local field E with uniformizer π. Derived v-descent is imported from the bundle and cohomology theory of VB1–VB2; the universal H⁰ vanishing prevents negative cohomology of the section complex.

**API.**

- `BC`: The v-sheaf T↦H⁰(X_T,E_T).
- `BCneg`: For universally negative slopes, T↦H¹(X_T,E_T).
- `BCcomplex`: Degree-zero hypercohomology of [E₁→E₀] in degrees −1,0, with universal H⁰(E₁) vanishing.
- `BC.module`: BC(E), BCneg(E) and BCcomplex are sheaves of E-modules on Perf_S, E acting through O_{X_T}, and BC.map is E-linear. This scalar action is the one BCProjectivization divides out.
- `BC.map`: A bundle or complex map induces the corresponding E-linear map of v-sheaves; identity and composition are preserved.
- `BC.exactSequence`: A short exact sequence 0→E′→E→E″→0 of bundles gives an exact sequence of E-module v-sheaves 0→BC(E′)→BC(E)→BC(E″)→H¹(E′)→H¹(E)→H¹(E″)→0 (Prop. II.2.1 and the two-term complex); for [E₁→E₀] with E₁ universally negative it gives 0→BC(E₀)→BCcomplex→BCneg(E₁)→H¹(E₀).
- `BC.baseChange`: For U→S, restriction of BCcomplex on Perf_U is BCcomplex of the pulled-back complex.
- `BC.directSum`: BCcomplex(K⊕L)≅BCcomplex(K)⊕BCcomplex(L) in the abelian category of E-module v-sheaves.

**Examples and checks.**

- `BCtest.zero`: The zero complex has zero BC v-sheaf.
- `BCtest.single`: BCcomplex([0→E])=BC(E) and BCcomplex([E→0])=BCneg(E) when E is negative.
- `BCtest.constantSections`: For S the disjoint union of two geometric points, BC(O)(S)=E², not E; BC(O) is the constant SHEAF underline E.
- `BCtest.hypercohomology`: For [O(−1)→0] over a geometric point, BCcomplex=H¹(O(−1))≠0 although the cokernel of the map of H⁰ groups is zero.

**Sources:** [FS][FS], Definition I.3.5, p. 19; two-term definition after II.2.1, p. 58; [FS][FS], Two-term definition after Proposition II.2.1, p. 58.

**Prerequisites:** [Finite locally free bundles on the curve](#finite-locally-free-bundles); [Two-term Frobenius complex for curve cohomology](#frobenius-two-term-cohomology); [V-descent of bundles and their derived cohomology](#v-descent-for-bundles-and-cohomology); `mathlib:CategoryTheory.Sheaf`; `mathlib:CategoryTheory.ShortComplex.homology`.

<a id="lubin-tate-universal-cover"></a>

#### Lubin–Tate universal cover and sections of O(1)

Let S = Spa(R,R^+) be affinoid perfectoid over F_q with untilt S^sharp over E, and let O_{X_S}(1) correspond to D(−1,1), with Frobenius π^{-1}σ after extending coefficients to L. For x in R^{circ circ}, the series sum over i in Z of pi^i [x^{q^{-i}}] defines a natural isomorphism G-tilde(R^{sharp+}) = R^{circ circ} -> H^0(X_S, O(1)) = H^0(Y_S, O_{Y_S})^{phi = pi}, and the evaluation map H^0(X_S,O(1)) -> R^sharp at S^sharp is the logarithm map log_G : G-tilde(R^{sharp+}) -> G(R^{sharp+}) -> R^sharp.

G = G_LT is the Lubin-Tate formal O_E-module over O_E-breve, normalized by M = W_{O_E}(k) with F = sigma/pi in Dieudonne theory (with the SW20 renormalisation dividing F by p and base changing along W(k) tensor_{Z_p} O_E -> W_{O_E}(k)); under this normalisation G is already defined over O_E. G-tilde = inverse limit of G along multiplication by pi, isomorphic to Spf O_E[[X-tilde^{1/p^infty}]]; for pi-adically complete A one has G-tilde(A) = G-tilde(A/pi) = Hom_{O_E}(E/O_E, G(A/pi))[1/pi] = the topologically nilpotent elements of A^flat. The equal-characteristic case is a direct power-series computation with the condition r_i = r_{i+1}^q. In mixed characteristic, construct the normalized crystalline comparison B^{φ=π}_{R,[1,∞]}≃Hom_{O_E}(E/O_E,G(R^{♯+}/π))[1/π] using R07.2. The SW13 full-faithfulness input applies after isogenies to f-semiperfect rings: Frobenius is surjective and its inverse limit has a finitely generated ideal of definition. Its integral version requires a quotient S/J with S perfect and J regular. Full faithfulness alone does not identify this Hom space with the displayed eigenspace. For compatibility with the explicit formula, SW13 Lemma 3.5.1 identifies the map G-tilde(R) -> M(G)(S)[1/p] coming from Dieudonne theory agrees with q log, proved by functoriality reduction to G = Q_p/Z_p. For the universal-cover shape use SW13 Proposition 3.1.3(iii): if R is perfect of characteristic p, G connected and Lie G free of dimension d, then G-tilde = Spf R[[X_1^{1/p^infty}, ..., X_d^{1/p^infty}]].

**Sources:** [FS][FS], Proposition II.2.2, p. 60; [SW13][SW13], Theorem A, p. 3; [SW13][SW13], Proposition 3.1.3(iii), p. 22; [SW13][SW13], Lemma 3.5.1, p. 29.

**Prerequisites:** [Banach–Colmez section and hypercohomology sheaves](#banach-colmez-space-definition); [Annular Frobenius descent for bundles](#annular-frobenius-descent); [Two-term Frobenius complex for curve cohomology](#frobenius-two-term-cohomology); [V-descent of bundles and their derived cohomology](#v-descent-for-bundles-and-cohomology); `RelativeFarguesFontaine:RF2:untilts/primitive-untilt-correspondence`; `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1`; `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.2`; `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-8-separate-arithmetic-local-existence-and-the-local-class-field-correspondence`.

<a id="fundamental-exact-sequence"></a>

#### The fundamental untilt sequence and degree-one divisors

For any perfectoid S with untilt S^sharp over E_infty, the above construction gives an exact sequence 0 -> O_{X_S} -> O_{X_S}(1) -> O_{S^sharp} -> 0 of O_{X_S}-modules. Consequently there is a well-defined map BC(O(1)) minus {0} -> Div^1 sending a nonzero section f to V(f), and it descends to an isomorphism (BC(O(1)) minus {0})/E^times = Div^1. The scalar E×-torsor is the Lubin–Tate Tate-module torsor; its comparison with the divisor-to-Weil-group map imports VS1 and arithmetic local reciprocity, rather than reproving class field theory.

For II.2.3 the untilt S^sharp must be over E_infty (the completion of the union of the Lubin-Tate level fields E_n), not merely over E; this is what supplies the canonical nonzero section. The check that the map O_{X_S} -> I(1) is an isomorphism is done on geometric points. The vanishing locus computation identifies the zeroes of the logarithm on G-tilde^ad_E minus {0} with the disjoint union over n of Spa E_n, each a simple zero. Corollary II.2.4 uses BC(O(1)) = Spd F_q[[X^{1/p^infty}]], so BC(O(1)) minus {0} = Spa F_q((X^{1/p^infty})) = Spd E_infty, and the map to Div^1 is Spd E_infty -> Spd E -> Spd E/phi^Z, a quotient first by O_E^times and then by pi^Z.

**Sources:** [FS][FS], Propositions II.2.3–II.2.4, pp. 60–61.

**Prerequisites:** [Lubin–Tate universal cover and sections of O(1)](#lubin-tate-universal-cover); [Finite locally free bundles on the curve](#finite-locally-free-bundles); `RelativeFarguesFontaine:RF2:untilts/closed-cartier-divisor-norm-estimate`; `RelativeFarguesFontaine:RF2:untilts/div1-moduli-and-properness`; `VStackSheavesAndLisseCategories:VS1`.

<a id="scalar-projectivization"></a>

#### Scalar projectivization

For an E-module BC v-sheaf W over S, define W× as the complement of its zero section and PBC(W)=W×/underline E×, the v-sheaf quotient of the scalar action. The quotient map is an E×-torsor on this punctured locus. Representability and properness are separate theorems. Apply to both section and two-term hypercohomology objects.

W is an E-module v-sheaf; the zero section is closed in the locally spatial cases where complement is used.

**API.**

- `BCProjectivization`: The v-sheaf quotient of punctured W by scalar E×.
- `BCProjectivization.torsor`: W×→PBC(W) is an underline E× torsor.
- `BCProjectivization.lift`: An E×-invariant map W×→Z descends uniquely to PBC(W).
- `BCProjectivization.baseChange`: Perfectoid base change commutes with scalar projectivization.

**Examples and checks.**

- `BCProjectivizationTest.zero`: PBC(0) is empty.
- `BCProjectivizationTest.line`: PBC(underline E)=S.
- `BCProjectivizationTest.unitTwist`: PBC(BC(O(1)))≅Div¹, with the fundamental scalar torsor.
- `BCProjectivizationTest.absolute`: Punctured BC(O(d)) is spatial while its π^Z-quotient is not quasiseparated; ordinary properness does not imply total absolute spatiality.

**Sources:** [FS][FS], Propositions II.2.16 and II.3.5, pp. 72,80.

**Prerequisites:** [Banach–Colmez section and hypercohomology sheaves](#banach-colmez-space-definition); `DiamondsAndVStacks:D0/groupoid-quotients-and-two-fibre-products`; `DiamondsAndVStacks:D5/relative-representability`.

### Ordinary projectivized properness

Ordinary section-sheaf properness uses positive generation and the contracting-action criterion. The application must show that a finite collection of untilt evaluations jointly detects vanishing and gives common contraction and negative-orbit escape bounds on each quasicompact open. It precedes and supplies family HN semicontinuity; it does not consume geometric bundle classification. Dualizing a presentation of the dual bundle produces E→O(n)^m with n>0, retaining the sign needed for positive twist geometry.

<a id="contracting-action-lemma"></a>

#### Quotients by contracting automorphisms

Suppose X is locally spectral and taut, and the generalizations of each point are linearly ordered by specialization. An automorphism γ has a spectral fixed locus X₀. Assume that for every x∈X and every open neighborhood U of X₀, γⁿ(x) lies in U for all sufficiently large n, and that the negative orbit of every point outside X₀ eventually avoids each quasicompact open of X. Then X₀ is closed. On its complement, the γ^Z-action is free and totally discontinuous: its action map (X∖X₀)×Z→(X∖X₀)² is a closed immersion. The orbit space (X∖X₀)/γ^Z is spectral.

X taut locally spectral; generalization sets totally ordered chains (automatic for locally spatial diamonds by ECD Prop. 11.19, and tautness holds if X is partially proper over a spatial diamond by ECD Prop. 18.10). X_0 must be a spectral space, and both convergence conditions (i) and (ii) are needed. Total discontinuity is in the strong sense: the action map (X minus X_0) x Z -> (X minus X_0) x (X minus X_0) is a closed immersion.

**Sources:** [FS][FS], Lemma II.2.17, pp. 72–74.

**Prerequisites:** `mathlib:SpectralSpace`; `mathlib:Specializes`; `DiamondsAndVStacks:D0/locally-spectral-space`; `tauceti:TauCeti.ValuationSpectrum.spectralSpace_spa_of_pairOfDefinition`; `DiamondEtaleCohomology:C4`.

<a id="properness-of-projectivized-BC"></a>

#### Ordinary Banach–Colmez properness

For a bundle E on X_S with S perfectoid over F_q, its section v-sheaf BC(E)(T)=H⁰(X_T,E_T) is a locally spatial diamond and is partially proper over S. Removing its zero section and taking the E^×-quotient yields a locally spatial diamond proper over S. Ampleness in II.2.6 and positive-twist geometry in II.2.5(iii) supply the proof without the bundle classification theorem.

S may be assumed qcqs for the second part. The presentation 0 -> E -> O_{X_S}(n)^m -> O_{X_S}(n')^{m'} is obtained by applying Thm. II.2.6 to E^dual and dualising, with n, n' > 0 - the positivity of n, n' is what lets II.2.5(iii) apply. It suffices to treat (BC(E) minus {0})/pi^Z because the O_E^times-action is free, so ECD Proposition 11.24 (last part) applies. The contracting-action criterion is checked by formally reducing to BC(O_{X_S}(n)^m) and then to A^1_{S^sharp} by evaluating sections at a collection of untilts.

**Sources:** [FS][FS], Proposition II.2.16, p. 72.

**Prerequisites:** [Banach–Colmez section and hypercohomology sheaves](#banach-colmez-space-definition); [Global generation and vanishing after positive twists](#quantitative-global-generation); [Slope-sensitive cohomology of standard bundles](#cohomology-of-twists); [Quotients by contracting automorphisms](#contracting-action-lemma); `DiamondsAndVStacks:D5/relative-representability`; `DiamondEtaleCohomology:C4`; [Scalar projectivization](#scalar-projectivization).

### Positive presentations and general two-term geometry

For these targets first use the family results of VB4: constant-polygon splitting, the local-system comparison and relative cohomology vanishings. Small-slope middle bundles and kernels must be fibrewise semistable; average degree/rank alone does not meet the hypothesis.

<a id="positive-slope-resolution"></a>

#### Small-slope resolutions of positive bundles

If all geometric slopes of a bundle E are ≥1/r, r≥1, then analytically locally on S there is 0→O^m→F→E→0 with F fibrewise semistable of SLOPE 1/r. On a constant-rank n, degree d component, rank(F)=dr and m=dr−n. This extends FS II.3.1’s geometric construction via II.3.3(i). Rank-zero E is treated separately.

r is a positive integer; standard O(1/r) has rank r and degree 1. Analytic-local existence is distinguished from the strict-positive étale-local presentation in the next target.

**Sources:** [FS][FS], Proposition II.3.1, pp. 75–76; Corollary II.3.3(i), p. 78.

**Prerequisites:** [Relative HN filtration and pro-étale splitting](#relative-HN-filtration-and-proetale-splitting); [Hom and extension calculus for geometric bundles](#hom-and-ext-calculus); [Geometric classification of vector bundles](#dieudonne-manin-classification-of-bundles); [Global generation and vanishing after positive twists](#quantitative-global-generation); [Slope-sensitive cohomology of standard bundles](#cohomology-of-twists); [The fundamental untilt sequence and degree-one divisors](#fundamental-exact-sequence); [Upper semicontinuity of geometric HN polygons](#semicontinuity-of-HN-polygon).

<a id="strict-positive-etale-presentations"></a>

#### Étale positive-slope presentations

Let S∈Perf_Fq, E a bundle on X_S and r≥1. (a) If all HN slopes of E at all geometric points are >1/r, then étale locally on S, for some m≥0, there is 0→G→O(1/r)^m→E→0 with G fibrewise SEMISTABLE of slope 0 (FS II.3.2, II.3.3(iii)). (b) If all slopes are ≥1/r, then locally on S there is 0→O(1/(2r))^m→F→E′→0 with F fibrewise semistable of slope 1/r and E a direct summand of E′ (II.3.3(ii)). (c) If all slopes are >1/r, then étale locally on S there is 0→G→O(1/r)^m→E′→0 with G fibrewise semistable of slope 1/(2r) and E a direct summand of E′ (II.3.3(iv)). Claims (b) and (c) retain E′. On a component where E has constant degree d, the sequence in (a) forces m=d, since O(1/r) has rank r and degree 1 (the degree normalization corrects the printed m=dr). Fibrewise semistability, not merely degree zero, is what the subsequent separatedness and pro-étale trivialization arguments use.

r≥1; finite constant ranks and degrees after passing to components. The analytic and étale topologies in the three assertions are distinct.

**Sources:** [FS][FS], Corollary II.3.3(i)–(iv), pp. 78–79; II.3.2 proof, pp. 76–78.

**Prerequisites:** [Small-slope resolutions of positive bundles](#positive-slope-resolution); [Relative HN filtration and pro-étale splitting](#relative-HN-filtration-and-proetale-splitting); [Annular Frobenius descent for bundles](#annular-frobenius-descent); [Base change of the geometric HN filtration](#HN-filtration-base-change); [Slope-sensitive cohomology of standard bundles](#cohomology-of-twists); [Ordinary Banach–Colmez properness](#properness-of-projectivized-BC); [Geometric classification of vector bundles](#dieudonne-manin-classification-of-bundles); [Upper semicontinuity of geometric HN polygons](#semicontinuity-of-HN-polygon).

<a id="families-of-banach-colmez-spaces"></a>

#### Two-term Banach–Colmez geometry

For [E₁→E₀] in degrees −1,0, with E₁ negative at every geometric point of S, BCcomplex is a locally spatial diamond partially proper over S; its punctured E×-quotient is locally spatial and proper over S. If E₀ is everywhere strictly positive, BCcomplex→S is cohomologically smooth. In this positive range, 0→BC(E₀)→BCcomplex→BCneg(E₁)→0 is exact as E-module v-sheaves. Neither unpunctured absolute spatiality nor perfectoid representability is asserted.

E_1 must have only NEGATIVE slopes at all geometric points; this is what makes H^0(X_T,E_1) = 0 (Prop. II.3.4(i)) so that the two-term complex has a well-defined H_0. Part (iii) additionally requires all slopes of E_0 to be POSITIVE. All assertions are etale-local, in fact v-local, on S. The reduction replaces [E_1 -> E_0] by a quasi-isomorphic [E'_1 -> O_{X_S}(-d)^m] obtained from a surjection O_{X_S}(-d)^m -> E_0 with d > 0 given by Thm. II.2.6; E'_1 still has only negative slopes. Separatedness of BC(O_{X_S}(-d)^m[1]) from Prop. II.2.5(i) is used to reduce (i) and (ii) to BC(E'_1[1]).

**Sources:** [FS][FS], Proposition II.3.5, pp. 79–81.

**Prerequisites:** [Banach–Colmez section and hypercohomology sheaves](#banach-colmez-space-definition); [Small-slope resolutions of positive bundles](#positive-slope-resolution); [Relative HN filtration and pro-étale splitting](#relative-HN-filtration-and-proetale-splitting); [Slope-sensitive cohomology of standard bundles](#cohomology-of-twists); [Global generation and vanishing after positive twists](#quantitative-global-generation); [Quotients by contracting automorphisms](#contracting-action-lemma); `DiamondSixOperations:S4`; `DiamondSixOperations:S5`; `DiamondsAndVStacks:D5/relative-representability`; [Étale positive-slope presentations](#strict-positive-etale-presentations); [Slope-dependent cohomology vanishing](#relative-cohomology-vanishing); [Scalar projectivization](#scalar-projectivization).

<a id="positive-range-dimension"></a>

#### Dimension in the positive range

For bundles E₀,E₁ with E₀ everywhere positive and E₁ everywhere negative, the cohomologically smooth relative BCcomplex([E₁→E₀]) has locally constant dimension deg(E₀)−deg(E₁), componentwise. In particular a positive bundle E has BC dimension deg(E); a negative bundle has shifted BC dimension −deg(E). Geometrically these are the first entries of the BC Dimension; height is rank(E₀)−rank(E₁). Slope-zero section sheaves are locally profinite of dimension zero via the E-local-system equivalence.

Use the canonical geometric degree and fixed coefficient field E. Diamond relative dimension is the cohomologically smooth dimension, not the rank or height; the numeric Dimension comparison is classical Q_p over fixed C.

**Sources:** [FS][FS], Definition I.3.5 and examples, p. 19; II.3.5, pp. 79–81; [CN (author copy)][CN-author], Example 3.3 and §3.2.5, pp. 13,16.

**Prerequisites:** [Two-term Banach–Colmez geometry](#families-of-banach-colmez-spaces); [Small-slope resolutions of positive bundles](#positive-slope-resolution); [Étale positive-slope presentations](#strict-positive-etale-presentations); [Slope-zero bundles and E-local systems](#slope-zero-local-systems); [Slope-sensitive cohomology of standard bundles](#cohomology-of-twists); [Dimensions of standard Banach–Colmez spaces](#standard-dimension-examples); `DiamondSixOperations:S5`.

### Absolute spaces, divisors and negative examples

Work on Perf_k and distinguish punctured absolute spatiality from relative spatial representability. The spatiality arguments use two precise diamond inputs: a surjective qcqs cohomologically smooth map from a spatial diamond to a small v-sheaf makes the target spatial; a covering family of locally closed generalizing spatial-diamond sub-v-sheaves makes a spatial v-sheaf a spatial diamond. Both the covering and generalizing hypotheses belong to the input. Determinant trivializations in the negative examples determine SL₁(D) and SL₂(E), rather than the larger full automorphism groups.

<a id="absolute-BC-spatiality"></a>

#### Absolute Banach–Colmez spaces of isocrystals of one sign

On the absolute site Perf_k, with k an algebraic closure of F_q, take a nonzero isocrystal D whose slopes all have the same strict sign. If they are negative, put W=BC(E(D)); if positive, put W=BC(E(D)[1]). These choices reflect the reversal of slopes under E. The open punctured sheaf W∖{0} is a spatial diamond and is cohomologically smooth over the absolute base. The map (W∖{0})/E^×→∗ is proper, cohomologically smooth, and representable in spatial diamonds. This relative representability condition does not make every absolute total quotient spatial: for positive d the π^Z-quotient of punctured BC(O(d)) fails quasiseparatedness.

D has slopes of a single sign; mixed-sign isocrystals are not covered by this statement. One works on Perf_k with k algebraically closed. The proof of (i) chooses, by Dieudonne-Manin, a basis in which phi is E-rational and U = phi^N is diagonal with entries powers of pi for some N > 0 - i.e. D is DECENT in the sense of Rapoport-Zink Definition 1.8. Since U = φ^N and BC(D) (resp. BC(D[1])) is already defined on Perf_Fq, the action of U agrees with that of Frob^N. The hypotheses of Lemma II.2.17 are checked for U^{-1} (resp. U) after base change to Spa F_q((t^{1/p^∞})), because that lemma needs a spatial base; the quotient statement is translated back using that the absolute Frobenius acts trivially on topological spaces. Surjectivity of the sum map is checked on geometric points using Prop. II.2.9 (every element of P_d is a product of elements of P_1).

**Sources:** [FS][FS], Proposition II.3.7, pp. 82–83.

**Prerequisites:** [Two-term Banach–Colmez geometry](#families-of-banach-colmez-spaces); [Dieudonné–Manin classification of finite isocrystals](#dieudonne-manin-isocrystals); `DiamondsAndVStacks:D5/spatial-v-sheaf-criterion`; `DiamondsAndVStacks:D5/relative-representability`; `DiamondSixOperations:S4`; `DiamondSixOperations:S5`; [Effective divisors and projective sections](#divisor-section-comparison); `DiamondsAndVStacks:D5`; [Quotients by contracting automorphisms](#contracting-action-lemma); [Relative HN filtration and pro-étale splitting](#relative-HN-filtration-and-proetale-splitting); `DiamondsAndVStacks:D3/locally-profinite-torsors`.

<a id="divisor-section-comparison"></a>

#### Effective divisors and projective sections

For d≥1, the already owned absolute divisor v-sheaf Div^d of degree-d relative Cartier divisors is (BC(O(d))∖{0})/E^×. It is proper over ∗, representable in spatial diamonds and cohomologically smooth. The sum map (Div¹)^d→Div^d is a quasi-pro-étale cover identifying Div^d=(Div¹)^d/Σ_d as v-sheaves; in particular Div^d is a diamond (ECD Propositions 11.4, 11.6).

Absolute curve over k=bar F_q; coefficient field E as in FS; d positive integral.

**Sources:** [FS][FS], Proposition II.3.6, pp. 81–82.

**Prerequisites:** [The fundamental untilt sequence and degree-one divisors](#fundamental-exact-sequence); [Ordinary Banach–Colmez properness](#properness-of-projectivized-BC); `RelativeFarguesFontaine:RF2:integral-divisors/div-d-moduli-v-sheaf`; `DiamondsAndVStacks:D5/spatial-v-sheaf-criterion`; `DiamondsAndVStacks:D5`; `DiamondSixOperations:S5`; [Relative HN filtration and pro-étale splitting](#relative-HN-filtration-and-proetale-splitting); [Regular noetherian geometric curve and PID complements](#schematic-curve-at-a-geometric-point); [Slope-sensitive cohomology of standard bundles](#cohomology-of-twists); `DiamondsAndVStacks:D3/locally-profinite-torsors`.

<a id="punctured-absolute-quotients"></a>

#### Punctured absolute spaces and scalar quotients

For d≥1 on Perf_k, punctured BC(O(d)) is a spatial diamond. Write Q=(BC(O(d))∖{0})/π^Z. Although Q is not quasiseparated, Q→∗ is representable in spatial diamonds. The full scalar quotient identifies with Div^d, and Div^d→∗ is both proper and representable in spatial diamonds. For equal-characteristic E, punctured positive absolute spaces, corresponding to negative isocrystal slopes, are perfectoid; the negative absolute spaces are spatial diamonds. For p-adic E the relative space BC(O_{X_C}(−1)[1]) cannot be perfectoid, by the argument of FS II.2.15. The corresponding equal-characteristic assertion is left unresolved in footnote 5 of that source.

Use punctured spaces throughout; absolute spatiality and relative spatial representability are different assertions.

**Sources:** [FS][FS], Remarks II.3.10–II.3.11, pp. 83–84; [FS][FS], Proof of Lemma II.2.15 and footnote 5, p. 71.

**Prerequisites:** [Absolute Banach–Colmez spaces of isocrystals of one sign](#absolute-BC-spatiality); [Effective divisors and projective sections](#divisor-section-comparison); `DiamondsAndVStacks:D5/relative-representability`; `DiamondsAndVStacks:D5`; [Slope-sensitive cohomology of standard bundles](#cohomology-of-twists).

<a id="negative-quaternion-example"></a>

#### Quaternion presentation of negative Banach–Colmez space

Over Perf_k, the absolute punctured BC(O(−1)[1])∖{0} classifies extensions 0→O(−1)→E→O→0 that are non-split fiberwise; geometrically E≅O(−1/2). It identifies with (BC(O(1/2))∖{0})/SL₁(D), where D is the quaternion division algebra over E (invariant 1/2) and SL₁(D) its reduced-norm-one group. After base change to Spa C with a chosen untilt C♯/E, BC(O(−1)[1])×_k Spa C≅(A¹_{C♯})^♢/E and the punctured space becomes (Ω_{C♯})^♢/E with Ω = A¹_E∖E = P¹_E∖P¹(E). The latter description uses the untilt and is not an identification with a perfectoid quotient space.

The nonzero extension has fixed determinant; the acting group is SL₁(D), not D×.

**Sources:** [FS][FS], Example II.3.12, p. 84.

**Prerequisites:** [Geometric classification of vector bundles](#dieudonne-manin-classification-of-bundles); [Hom and extension calculus for geometric bundles](#hom-and-ext-calculus); [Stable-bundle division endomorphism comparison](#bundle-endomorphism-comparison); [Arithmetic Brauer invariant and slope normalization](#brauer-invariant-sign); [The fundamental untilt sequence and degree-one divisors](#fundamental-exact-sequence); [Absolute Banach–Colmez spaces of isocrystals of one sign](#absolute-BC-spatiality); [Relative HN filtration and pro-étale splitting](#relative-HN-filtration-and-proetale-splitting); `DiamondsAndVStacks:D3/locally-profinite-torsors`.

<a id="negative-sl2-example"></a>

#### SL₂ presentation of negative Banach–Colmez space

Over Perf_k, the absolute punctured BC(O(−2)[1])∖{0}≅U/SL₂(E), where U⊂(BC(O(1))∖{0})² is the open locus of pairs of sections that are fiberwise nonzero and E-linearly independent, U=(BC(O(1))∖{0})²∖(E^××1).Δ. The corresponding extension 0→O(−1)→O²→O(1)→0 is specified by a surjection and its determinant trivialization; changing the determinant-preserving basis gives SL₂(E), not GL₂(E).

Nonzero extension class; determinant fixed.

**Sources:** [FS][FS], Example II.3.13, p. 85.

**Prerequisites:** [Lubin–Tate universal cover and sections of O(1)](#lubin-tate-universal-cover); [The fundamental untilt sequence and degree-one divisors](#fundamental-exact-sequence); [Geometric classification of vector bundles](#dieudonne-manin-classification-of-bundles); [Hom and extension calculus for geometric bundles](#hom-and-ext-calculus); [Absolute Banach–Colmez spaces of isocrystals of one sign](#absolute-BC-spatiality); [Relative HN filtration and pro-étale splitting](#relative-HN-filtration-and-proetale-splitting); `DiamondsAndVStacks:D3/locally-profinite-torsors`.

### Sympathetic algebras and the classical category

The sympathetic-algebra targets in this subsection use the fixed-C, countable-residue-field hypotheses in the conventions. The abstract pro-étale category has the separately stated arbitrary-complete-algebraically-closed-C scope.

<a id="sympathetic-vector-spaces"></a>

#### Sympathetic Vector Spaces

Use the category of connected spectral C-Banach algebras whose p-power map is onto the open unit neighborhood of 1. CN further require faithful evaluation on C-valued spectral points and a dense C-linear subspace with a countable basis. Write O_Λ for the unit ball. These extra requirements exclude the spherical-closure example in footnote 6 and permit the Hahn–Banach arguments under the standing countability assumption. A sympathetic Vector Space is a covariant functor from this category to Q_p-vector spaces. Exactness means exactness after evaluation at each algebra Λ.

**API.**

- `SympatheticVS`: A covariant functor from the stated sympathetic C-Banach algebras to ModuleCat Q_p.
- `SympatheticVS.constant`: The constant functor of a finite-dimensional Q_p vector space.
- `SympatheticVS.additive`: V_d evaluates to Λ^d and maps by the C-algebra homomorphism in every coordinate.
- `SympatheticVS.exact`: A short complex is short exact iff its evaluated ModuleCat complex is short exact at every Λ.
- `SympatheticVS.periodTargets`: The source period Rings BdR⁺ and BdR and the quotients B_m are VS targets via the R06.1 period-functor construction.

**Examples and checks.**

- `SympatheticVSTest.constants`: The constant Q_p functor evaluates to Q_p at C, whereas V₁ evaluates to C.
- `SympatheticVSTest.zero`: V₀ is the zero functor.
- `SympatheticVSTest.finiteSum`: V_{d+e}≅V_d⊕V_e coordinatewise.
- `SympatheticVSTest.evaluation`: The C-valued spectrum-injectivity condition excludes the spherical-closure example singled out by footnote 6; p-root surjectivity alone is insufficient.

**Sources:** [CN (author copy)][CN-author], §3.1.1 with footnote 6, p. 12.

**Prerequisites:** `mathlib:NormedAlgebra`; `mathlib:ModuleCat`.

<a id="banach-colmez-presentations"></a>

#### Finite-Dimensional Banach–Colmez presentations

A sympathetic Vector Space W admits a finite Banach–Colmez presentation when some Y fits into 0→V₁→Y→V_d→0 and 0→V₂→Y→W→0, where V_d(Λ)=Λ^d and V₁,V₂ are constant finite-dimensional Q_p spaces. Such W is a BC object. The presentation assigns dim(W)=d and ht(W)=dim_Qp(V₁)−dim_Qp(V₂), so Dimension is the pair (dim,ht). Independence of these integers from Y and the two sequences is the separate Dimension theorem.

**API.**

- `BCPresentation`: Y and exact 0→V₁→Y→V_d→0, 0→V₂→Y→W→0 with finite Q_p spaces V₁,V₂.
- `BCPresentation.dim`: The natural number d.
- `BCPresentation.height`: The integer finrank_Qp(V₁)−finrank_Qp(V₂).
- `BCPresentation.dimension`: The pair (d,height) is independent of the presentation by DimensionAbelian.
- `BCPresentation.stabilize`: Adding the same finite Q_p vector space to Y,V₁,V₂ gives another presentation of W and the same Dimension.

**Examples and checks.**

- `BCPresentationTest.additive`: The tautological presentation of V_d has Dimension (d,0).
- `BCPresentationTest.constant`: A finite Q_p vector space of dimension h has Dimension (0,h).
- `BCPresentationTest.quotient`: The cokernel V₁/Q_p of a nonzero Q_p→V₁ map has Dimension (1,−1).
- `BCPresentationTest.stabilize`: Increasing both finite Q_p dimensions by one leaves height unchanged.

**Sources:** [CN (author copy)][CN-author], §3.1.1, pp. 12–13.

**Prerequisites:** [Sympathetic Vector Spaces](#sympathetic-vector-spaces); `mathlib:CategoryTheory.ShortComplex.ShortExact`; `mathlib:Module.finrank`.

<a id="exact-banach-points"></a>

#### Exact faithful Banach realization

Evaluation at C is faithful on BC objects. Evaluation at any sympathetic algebra Λ gives a Q_p-Banach space; BC morphisms evaluate to continuous strict linear maps, and BC short exact sequences evaluate to strict short exact sequences. Nonetheless, the topology of W(C) alone cannot recover Dimension: C and C⊕Q_p have isomorphic topological Q_p-vector spaces but different BC Dimensions.

**Sources:** [CN (author copy)][CN-author], Remark 3.1, p. 13; [FF][FF], §8.4.1, main text pp. 245–247.

**Prerequisites:** [Finite-Dimensional Banach–Colmez presentations](#banach-colmez-presentations); [Dimension and the abelian BC category](#dimension-abelian).

<a id="dimension-abelian"></a>

#### Dimension and the abelian BC category

BC is an abelian category. The presentation invariant Dim=(dim,ht) is well defined and additive in short exact sequences. In particular, any BC map f has BC kernel, image and cokernel, with Dim(W₁)=Dim(ker f)+Dim(im f) and Dim(W₂)=Dim(im f)+Dim(coker f). A zero-dimensional object has nonnegative height. If W is built from an increasing filtration with V₁ as every successive quotient, each BC subobject of W also has nonnegative height.

**Sources:** [CN (author copy)][CN-author], Proposition 3.2, p. 13; [FF][FF], Preface, Theorem 2.12(i)–(ii), printed pp. 16–17.

**Prerequisites:** [Le Bras equivalence](#le-bras-equivalence); [Finite-Dimensional Banach–Colmez presentations](#banach-colmez-presentations); `mathlib:CategoryTheory.Abelian`.

<a id="standard-dimension-examples"></a>

#### Dimensions of standard Banach–Colmez spaces

For integers h≥1, d∈Z and m≥1, the period objects B_m=B⁺_dR/t^m and U_{h,d} belong to BC. Their Dimensions are Dim(B_m)=(m,0), Dim(U_{h,d})=(d,h) for d≥0, and Dim(U_{h,d})=(−d,−h) for d<0. In particular U_{1,0}=Q_p has Dimension (0,1); the zero-slope case is retained in the nonnegative branch.

**Sources:** [CN (author copy)][CN-author], Example 3.3, p. 13.

**Prerequisites:** [Dimension and the abelian BC category](#dimension-abelian); [Slope-sensitive cohomology of standard bundles](#cohomology-of-twists); [The fundamental untilt sequence and degree-one divisors](#fundamental-exact-sequence); `RelativeFarguesFontaine:RF2:untilts/BdR-completion-and-filtration`.

<a id="abstract-banach-colmez-category"></a>

#### Abstract Banach–Colmez category

For fixed C/Q_p algebraically closed and complete, BC is the smallest strictly full abelian subcategory of sheaves of Q_p-modules on Perf_C,proét, stable under extensions and containing underline Q_p and the additive untilt sheaf G_a. Equivalently close these generators under finite biproducts, kernels and cokernels of morphisms BETWEEN BC objects, extensions and isomorphisms. Do not require closure under every ambient subobject.

The untilt additive sheaf is over Perf_C; Frobenius coefficients are Q_p here.

**API.**

- `AbstractBC`: The generated abelian extension-closed strictly full subcategory of Q_p-module sheaves containing Q_p and G_a.
- `AbstractBC.rational`: The constant sheaf Q_p is a member.
- `AbstractBC.additive`: The untilt additive sheaf G_a is a member.
- `AbstractBC.kernelCokernel`: Kernels and cokernels of maps between member objects remain members, computed in the ambient abelian sheaf category.
- `AbstractBC.extension`: A short exact extension of two members is a member.
- `AbstractBC.leBras`: Degree-zero hypercohomology induces the exact equivalence with BCTiltedHeart; sympathetic values agree with the presentation realization.

**Examples and checks.**

- `AbstractBCTest.generators`: The two generators are Q_p and G_a, with Dimensions (0,1) and (1,0).
- `AbstractBCTest.zero`: The zero sheaf is in AbstractBC.
- `AbstractBCTest.quotient`: The cokernel G_a/Q_p belongs and is BC(O(−1)[1]) after choosing ∞.
- `AbstractBCTest.points`: C and C⊕Q_p are isomorphic as topological Q_p-vector spaces but their BC Dimensions (1,0) and (1,1) differ.

**Sources:** [SW][SW], Definition 15.2.1, book p. 133; [SW][SW], Theorem 15.2.12, book p. 139.

**Prerequisites:** `mathlib:CategoryTheory.Sheaf`; `mathlib:CategoryTheory.Abelian`; `DiamondsAndVStacks:D6/etale-site-comparison`; `DiamondsAndVStacks:D3`.

### Curvature, the tilted coherent heart and HN invariants

For the sympathetic-algebra realizations, retain the fixed-C/countability hypotheses in the conventions. Generic torsion-pair tilt machinery belongs to SF.0; the torsion pair here is determined by the curve slopes. The Le Bras equivalence requires a construction of hypercohomology full faithfulness and the comparison with sympathetic evaluation; supplying an abstract equivalence parameter does not prove these comparisons. The HN slope of a nonzero standard BC block is −1/λ; U₀=Q_p has slope −∞. Curvature also remembers whether torsion is supported at the chosen point ∞, so it is not determined just by the numerical BC slope zero.

<a id="curvature"></a>

#### Curvature

Use five curvature classes for W∈BC. Positive curvature means Hom(W,V₁)=0; nonnegative curvature means Hom(W,BdR⁺)=0. Curvature zero, also called affine, means a finite successive extension of V₁. Negative curvature means that W embeds in BdR^d for some d, equivalently in (BdR⁺)^d. Nonpositive curvature means an embedding into a B⁺_dR-Module, interpreted as a period Vector Space with a B⁺_dR action. The distinctions between strict and weak signs are part of the definition.

**API.**

- `BCCurvature.positive`: Hom_VS(W,V₁)=0.
- `BCCurvature.nonnegative`: Hom_VS(W,BdR⁺)=0.
- `BCCurvature.affine`: A finite filtration with V₁ quotients.
- `BCCurvature.negative`: An injection into (BdR⁺)^d for some finite d, equivalently BdR^d.
- `BCCurvature.nonpositive`: An injection into a VS carrying a BdR⁺-Module structure.
- `BCCurvature.iso`: Every curvature predicate is invariant under BC isomorphism.

**Examples and checks.**

- `BCCurvatureTest.rational`: Q_p has strict negative curvature and height one.
- `BCCurvatureTest.affine`: V₁ has curvature zero and height zero.
- `BCCurvatureTest.shifted`: H¹(O(−1)) has positive curvature and height −1.
- `BCCurvatureTest.otherPoint`: At x≠∞, U₁/Q_p t_x has height zero and positive curvature but not curvature zero.
- `BCCurvatureTest.zero`: The zero object satisfies all five predicates; strict height inequalities require nonzero objects.

**Sources:** [CN (author copy)][CN-author], Definition 3.5, p. 13.

**Prerequisites:** [Sympathetic Vector Spaces](#sympathetic-vector-spaces); [Finite-Dimensional Banach–Colmez presentations](#banach-colmez-presentations); `RelativeFarguesFontaine:RF2:untilts/BdR-completion-and-filtration`; `PadicHodgeTheory:R06.1`.

<a id="curvature-hom-orthogonality"></a>

#### Curvature orthogonality

Hom_BC(W,W′) vanishes for either of the following curvature pairs: (>0,≤0) or (≥0,<0). The classes of nonpositive and of strictly negative curvature are each preserved under VS subobjects. Dually, nonnegative and strictly positive curvature are each preserved under VS quotients.

**Sources:** [CN (author copy)][CN-author], Remark 3.6, p. 13.

**Prerequisites:** [Curvature](#curvature); [Curvature and HN support](#curvature-hn-characterisation).

<a id="tilted-coherent-heart"></a>

#### The tilted coherent heart

Coh⁻_X is the full subcategory of Dᵇ(Coh_X) with cohomology only in degrees −1 and 0, H^{−1} of negative slopes and H⁰ of nonnegative slopes INCLUDING torsion sheaves. It is the torsion-pair tilt heart, hence abelian. Objects split noncanonically as H⁰⊕H^{−1}[1] because the curve has cohomological dimension one. For such a zero-differential representative BC(F)=H⁰(X,H⁰F)⊕H¹(X,H^{−1}F), noncanonically; general morphisms include Ext¹(H⁰F,H^{−1}G).

**API.**

- `BCTiltedHeart`: Objects K∈Dᵇ(Coh_X) with HⁱK=0 except i=−1,0, H^{-1} negative and H⁰ nonnegative including torsion.
- `BCTiltedHeart.positive`: A coherent sheaf of nonnegative slopes enters in degree zero.
- `BCTiltedHeart.negative`: A negative bundle enters with shift [1].
- `BCTiltedHeart.split`: K is isomorphic to H⁰K⊕H^{-1}K[1], noncanonically, using Ext²=0 on the curve.
- `BCTiltedHeart.homMatrix`: Morphisms between these decompositions have diagonal Hom and off-diagonal Ext¹(E₀,F₋₁).

**Examples and checks.**

- `BCTiltedHeartTest.positive`: O(1) in degree zero belongs to the heart.
- `BCTiltedHeartTest.negative`: O(−1)[1] belongs, while O(−1) in degree zero does not.
- `BCTiltedHeartTest.torsion`: The torsion skyscraper at any untilt point belongs in degree zero.
- `BCTiltedHeartTest.shift`: O[1] is excluded, since its H^{-1} has slope zero rather than negative.

**Sources:** [CN (author copy)][CN-author], §3.2.4, p. 15.

**Prerequisites:** `mathlib:DerivedCategory`; `SchemeAndStackFoundations:SF.0`; [Rank, determinant degree and rational slope](#degree-rank-slope-and-HN-formalism); [Coherent sheaves on the geometric curve](#coherent-sheaf-classification); [Two affine charts and cohomological dimension one](#two-affine-cover-cohomological-dimension).

<a id="le-bras-equivalence"></a>

#### Le Bras equivalence

The functor BC realises an equivalence of categories Coh^-_X ≃ BC. In its pro-étale sheaf realization every BC object is a diamond (SW Theorem 15.2.12); no perfectoid representability is inferred.

**Sources:** [CN (author copy)][CN-author], Theorem 3.12, p. 15.

**Prerequisites:** [Banach–Colmez section and hypercohomology sheaves](#banach-colmez-space-definition); [The tilted coherent heart](#tilted-coherent-heart); [Hom and extension calculus for geometric bundles](#hom-and-ext-calculus); [Slope-sensitive cohomology of standard bundles](#cohomology-of-twists); [Finite-Dimensional Banach–Colmez presentations](#banach-colmez-presentations); `DiamondsAndVStacks:D3`; [Abstract Banach–Colmez category](#abstract-banach-colmez-category); [Two-term Banach–Colmez geometry](#families-of-banach-colmez-spaces); `mathlib:CategoryTheory.Equivalence`.

<a id="bc-hn-invariants"></a>

#### Banach–Colmez HN invariants

On the tilted coherent heart, assign rk⁻([E₋₁→E₀])=deg(E₀)−deg(E₋₁) and deg⁻([E₋₁→E₀])=rk(E₋₁)−rk(E₀). Under Le Bras these become dim and −ht, defining the BC HN structure. A nonzero torsion object has slope zero. Write W_{≥λ},W_{>λ} for the HN pieces and W_{>−∞}=∪_λW_{≥λ}. For reduced λ=d/h with h>0, let U_λ=U_{h,d}; scaling the pair by e≥1 gives e copies. For λ≥0 use H⁰(O(λ)), and for λ<0 use H¹(O(λ)), equivalently BC(O(λ)[1]). For λ≠0 the standard block has rk⁻=sign(λ)d, deg⁻=−sign(λ)h and µ⁻=−1/λ. The boundary U₀=Q_p instead has rk⁻=0, deg⁻=−1 and µ⁻=−∞; the zero object has no HN slopes. The reciprocal-slope formula requires λ≠0; U₀ is handled separately.

**API.**

- `BCHNInvariants`: BC rank=dim, BC degree=−ht, with the zero object assigned no slope.
- `BCHNInvariants.fromHeart`: For E₋₁[1]⊕E₀, rank=deg E₀−deg E₋₁ and degree=rank E₋₁−rank E₀.
- `BCHNInvariants.slope`: For positive dimension use −ht/dim; a nonzero dimension-zero object has slope −∞.
- `BCHNInvariants.standard`: For a nonzero standard curve slope λ, BC slope of U_λ is −1/λ.
- `BCHNInvariants.additive`: Rank and degree add in a BC short exact sequence; slope does not simply add.

**Examples and checks.**

- `BCHNInvariantsTest.rational`: Q_p has rank zero, degree −1 and slope −∞.
- `BCHNInvariantsTest.affine`: V₁ has rank one, degree zero and slope zero.
- `BCHNInvariantsTest.inversion`: U_{2,1} has BC rank one, degree −2 and slope −2, while O(1/2) has curve rank two and degree one.
- `BCHNInvariantsTest.negative`: U_{1,−1}=H¹(O(−1)) has BC rank one, degree one and slope one.
- `BCHNInvariantsTest.zero`: The zero object has BC rank and degree zero and no slope; it is not assigned the slope −∞ of a nonzero finite Q_p space.

**Sources:** [CN (author copy)][CN-author], §3.2.5, p. 16.

**Prerequisites:** [Dimension and the abelian BC category](#dimension-abelian); [Le Bras equivalence](#le-bras-equivalence); [Rank, determinant degree and rational slope](#degree-rank-slope-and-HN-formalism).

<a id="bc-hn-decomposition"></a>

#### HN decomposition and connected components

The object U₀=Q_p has BC slope −∞. The diamond realization of W identifies its identity component with W_{>−∞} and its component quotient W_{−∞} with the maximal étale quotient, a finite-dimensional Q_p-space. The BC HN filtration admits a noncanonical splitting. Consequently W≅(⊕_i U_{−1/λ_i})⊕(⊕_x H⁰(X,F_x)), where λ_i∈Q∪{−∞} are nonzero and the torsion sheaves F_x have finite support. Each U_{−1/λ_i} has BC slope λ_i; each nonzero torsion summand has BC slope 0. These are precisely the slopes of W. In the hypercohomology sequence of §3.2.4, the H¹(X,E_{−1}) term is the positive-slope HN subobject of BC([E_{−1}→E₀]).

**Sources:** [CN (author copy)][CN-author], Remark 3.13 and (3.14), p. 16.

**Prerequisites:** [Banach–Colmez HN invariants](#bc-hn-invariants); [Coherent sheaves on the geometric curve](#coherent-sheaf-classification); [Le Bras equivalence](#le-bras-equivalence); `DiamondsAndVStacks:D5/relative-representability`.

<a id="canonical-curvature-filtration"></a>

#### Canonical curvature filtration

The canonical curvature filtration of a BC object W is uniquely specified by W_{>0}⊂W_{≥0}⊂W: the subobject has curvature >0, the middle quotient has curvature 0, and the final quotient has curvature <0. Define W_{>0}=∩_{m≥1, f:W→B_m}ker f and W_{≥0}=∩_{f:W→B_dR}ker f. The HN description verifies the middle quotient condition. Set W_{≤0}=W/W_{>0} and W_{=0}=W_{≥0}/W_{>0}; they are respectively the maximal nonpositive-curvature quotient and its maximal affine subobject. In the decomposition (3.14), W_{>0} consists of the U_{−1/λ_i} with λ_i>0 together with all H⁰(X,F_x) for x≠∞; W_{≤0} consists of the U_{−1/λ_i} with λ_i<0 and H⁰(X,F_∞). Thus W_{<0}=⊕_{λ_i<0}U_{−1/λ_i} and W_{=0}=H⁰(X,F_∞). Strictly negative curvature is equivalent to strictly negative BC HN slopes; strictly positive BC HN slopes imply positive curvature. This is Plût’s filtration, described through Le Bras’s HN equivalence.

**API.**

- `BCCanonicalFiltration`: Subobjects W_{>0}≤W_{≥0}≤W with positive, affine and negative graded pieces.
- `BCCanonicalFiltration.positive`: W_{>0} is the intersection of kernels of all W→B_m.
- `BCCanonicalFiltration.nonnegative`: W_{≥0} is the intersection of kernels of all W→BdR.
- `BCCanonicalFiltration.map`: Every BC map preserves these subobjects.
- `BCCanonicalFiltration.nonpositiveQuotient`: Every map from W to a nonpositive-curvature BC factors uniquely through W/W_{>0}.
- `BCCanonicalFiltration.affinePart`: W_{≥0}/W_{>0} is the maximal affine subobject of W/W_{>0}.

**Examples and checks.**

- `BCCanonicalFiltrationTest.rational`: For Q_p, W_{>0}=W_{≥0}=0.
- `BCCanonicalFiltrationTest.affine`: For V₁, W_{>0}=0 and W_{≥0}=W.
- `BCCanonicalFiltrationTest.positive`: For H¹(O(−1)), W_{>0}=W_{≥0}=W.
- `BCCanonicalFiltrationTest.otherPoint`: For torsion at x≠∞, W_{>0}=W despite BC HN slope zero; HN cut at zero alone is insufficient.

**Sources:** [CN (author copy)][CN-author], Proposition 3.7 and Remark 3.8, pp. 13–14; [CN (author copy)][CN-author], §3.2.8, p. 18.

**Prerequisites:** [Curvature](#curvature); [HN decomposition and connected components](#bc-hn-decomposition); [Artinian property of BC](#artinian-bc); [VS Hom vanishing from torsion period modules](#torsion-vs-hom-vanishing).

<a id="euler-poincare-height"></a>

#### Euler–Poincaré height formula

For every coherent sheaf F on the geometric curve, ht(H⁰(X,F))−ht(H¹(X,F))=rk(F). For a standard block O(λ), where λ=d/h is reduced with h>0, the difference is h. Additivity and coherent-sheaf classification extend this calculation from standard blocks to all F; torsion has rank and Euler height zero.

**Sources:** [CN (author copy)][CN-author], Remark 3.11, p. 15.

**Prerequisites:** [Dimensions of standard Banach–Colmez spaces](#standard-dimension-examples); [Coherent sheaves on the geometric curve](#coherent-sheaf-classification).

<a id="artinian-bc"></a>

#### Artinian property of BC

Every descending chain W₀ ⊇ W₁ ⊇ ⋯ of BC subobjects stabilizes. In the dimension-height argument, dim(W_n) first becomes constant; the quotients W_N/W_n then have dimension zero and come from the maximal finite Q_p quotient of W_N, so their heights are bounded and eventually constant. A second argument reduces via a presentation to V_d and inducts on d: a proper subobject of V₁ is finite-dimensional over Q_p. The latter argument also proves the artinian property for almost C-representations.

**Sources:** [CN (author copy)][CN-author], Remark 3.15, p. 16.

**Prerequisites:** [HN decomposition and connected components](#bc-hn-decomposition); [Dimension and the abelian BC category](#dimension-abelian).

<a id="embedding-height-bound"></a>

#### Height bound for non-affine additive subobjects

For a NONZERO sub-BC W⊂V_N which contains no subobject isomorphic to V₁, dim(W)<ht(W); all its BC HN slopes are <−1. The zero object has no slopes but does not satisfy the strict numerical inequality. Include finite Q_p summands (slope −∞) in the proof.

**Sources:** [CN (author copy)][CN-author], Lemma 3.16, pp. 16–17.

**Prerequisites:** [HN decomposition and connected components](#bc-hn-decomposition); [Dimension and the abelian BC category](#dimension-abelian); [Banach–Colmez morphism calculus](#bc-morphism-calculus).

<a id="bc-morphism-calculus"></a>

#### Banach–Colmez morphism calculus

For zero-map tilted-heart representatives E₋₁[1]⊕E₀ and F₋₁[1]⊕F₀, BC morphisms are triangular matrices with diagonal Hom(E₋₁,F₋₁), Hom(E₀,F₀) and off-diagonal Ext¹(E₀,F₋₁). End_BC(U_λ)=End(O(λ))=D_λ. For λ=d/h≥0 in lowest terms Hom_BC(U_λ,V₁) has C-dimension h with basis θ∘φ^i, 0≤i<h. Tensor multiplicities and Brauer signs are those of the standard-bundle tensor and endomorphism calculations above; the Hom formula retains the denominator multiplicity.

**Sources:** [CN (author copy)][CN-author], §3.2.4 and §3.2.6, pp. 15,17.

**Prerequisites:** [Le Bras equivalence](#le-bras-equivalence); [Stable-bundle division endomorphism comparison](#bundle-endomorphism-comparison); [Arithmetic Brauer invariant and slope normalization](#brauer-invariant-sign); [Hom and extension calculus for geometric bundles](#hom-and-ext-calculus); `RelativeFarguesFontaine:RF2:untilts/BdR-completion-and-filtration`.

### Period modules and curvature calculus

These targets use the same fixed-C/countability hypotheses. Period modules are functors on sympathetic algebras: Λ↦M⊗_{B_dR⁺}B_dR⁺(Λ). The Hom-vanishing theorem concerns arbitrary VS natural maps, so its proof must establish a uniform t-denominator bound on their images; period-linearity is not a hypothesis.

<a id="torsion-point-realization"></a>

#### Torsion at an untilt point

At a closed untilt point x, torsion coherent sheaves supported at x are equivalent to finite-length B⁺_dR(C_x)-modules via global sections. The indecomposable modules are B_m(C_x)=B⁺_dR(C_x)/t_x^m, m≥1. The divisor sequence 0→O→O(m)→i_{x,*}B_m(C_x)→0 has first map t_x^m; H¹(O)=0 therefore identifies the BC realization with U_m/Q_p t_x^m. Its endomorphism ring is B_m(C_x), giving C_x when m=1. For x≠∞ its Hom to V₁ vanishes because the supports are disjoint. At the chosen point ∞, write t_x=t; a finite-length module M is realized by the functor Λ↦M⊗_{B⁺_dR}B⁺_dR(Λ), rather than an extension of scalars from a ring to itself.

**Sources:** [CN (author copy)][CN-author], §3.2.7, pp. 17–18.

**Prerequisites:** [Le Bras equivalence](#le-bras-equivalence); [The fundamental untilt sequence and degree-one divisors](#fundamental-exact-sequence); [Untilts and completed local rings](#completed-local-ring-comparison); [Coherent sheaves on the geometric curve](#coherent-sheaf-classification).

<a id="affine-finite-length-equivalence"></a>

#### Curvature-zero finite-length modules

Finite-length modules over the ring B⁺_dR form a category equivalent to the curvature-zero full subcategory of BC. The realization of M is the period Vector Space Λ↦M⊗_{B⁺_dR}B⁺_dR(Λ), using the period-ring functor on sympathetic algebras; this is not a scalar extension of the ring to itself.

**Sources:** [CN (author copy)][CN-author], Proposition 3.17, p. 18.

**Prerequisites:** [Torsion at an untilt point](#torsion-point-realization); [Curvature](#curvature).

<a id="torsion-vs-hom-vanishing"></a>

#### VS Hom vanishing from torsion period modules

The curvature-zero BC category is closed under kernels and cokernels of its morphisms. Let W be a BC object carrying a B⁺_dR-Module structure with t^rW=0 for some r≥1. Then every VS natural map W→B⁺_dR or W→B_dR is zero. The BC hypothesis permits the finite-length realization used in Corollary 3.18. For B⁺_dR, compare maps to all B⁺_dR/t^k and take their inverse limit, obtaining Hom into a torsion-free module. For B_dR, the remaining bounded-image argument must place each arbitrary VS map inside t^{-N}B⁺_dR for some N; this requires a bounded-image lemma for arbitrary natural maps. The maps are not assumed period-linear.

**Sources:** [CN (author copy)][CN-author], Corollary 3.18, p. 18.

**Prerequisites:** [Curvature-zero finite-length modules](#affine-finite-length-equivalence); [Banach–Colmez morphism calculus](#bc-morphism-calculus); `PadicHodgeTheory:R06.1`.

<a id="curvature-hn-characterisation"></a>

#### Curvature and HN support

A BC object has curvature <0 exactly when it is H⁰(X,E) for a vector bundle E with nonnegative curve slopes. Curvature ≤0 permits, in addition, a torsion coherent summand supported at ∞ in E. Both curvature classes are stable under extensions within BC.

**Sources:** [CN (author copy)][CN-author], §3.2.8 and Corollary 3.19, p. 18.

**Prerequisites:** [Curvature](#curvature); [HN decomposition and connected components](#bc-hn-decomposition); [Torsion at an untilt point](#torsion-point-realization); [VS Hom vanishing from torsion period modules](#torsion-vs-hom-vanishing).

<a id="curvature-height-signs"></a>

#### Height signs from curvature

Curvature zero implies height zero; NONZERO strictly negative-curvature BC objects have strictly positive height; positive-curvature objects have height ≤0. A nonzero torsion object at x≠∞ has height zero and strictly positive curvature, so ≤ cannot be strengthened to <.

**Sources:** [CN (author copy)][CN-author], Corollary 3.20 and footnote 9, p. 18.

**Prerequisites:** [Curvature and HN support](#curvature-hn-characterisation); [Dimensions of standard Banach–Colmez spaces](#standard-dimension-examples).

<a id="curvature-subquotients"></a>

#### Curvature subobjects and quotients

Negative/nonpositive curvature is preserved by sub-BCs; positive/nonnegative curvature is preserved by quotients. A height-zero subobject of a nonpositive-curvature object has curvature zero. The printed dual quotient assertion is false: a height-zero quotient of a nonnegative-curvature BC has HN slope zero (torsion support), and has curvature zero if and only if its support is at ∞.

**Sources:** [CN (author copy)][CN-author], Corollary 3.21, p. 18; corrected (iv).

**Prerequisites:** [Curvature and HN support](#curvature-hn-characterisation); [Dimension and the abelian BC category](#dimension-abelian).

<a id="torsion-subobjects-height"></a>

#### Height of torsion period subobjects

For any BC inclusion U⊂W with W a torsion B⁺_dR-Module, ht(U) is nonnegative. Equality holds precisely when U is itself a torsion B⁺_dR-Module. An alternative to HN theory is induction on the length of W: subobjects of V₁ are V₁ or finite-dimensional Q_p-spaces, and the period-module class is extension closed. With Proposition 2.5, the same induction applies to almost C-representations.

**Sources:** [CN (author copy)][CN-author], Remark 3.22, p. 19.

**Prerequisites:** [Curvature subobjects and quotients](#curvature-subquotients); [Curvature-zero finite-length modules](#affine-finite-length-equivalence).

<a id="generating-image-cokernel"></a>

#### Cokernel of a generating period-module image

Suppose f : W₁ → W₂ is a BC morphism, W₂ is a finite-length BdR⁺-module, and the BdR⁺-span of im(f) equals W₂. Any nonzero BC cokernel of f has positive curvature and negative height. After quotienting W₁ by ker(f), represent f by a coherent map F₁ → F₂ on X with H¹(F_i)=0 and F₂ supported at ∞. Generation implies surjectivity of this coherent map, while injectivity on BC sections gives H⁰(ker(F₁ → F₂))=0. Its cohomology sequence identifies the BC cokernel with H¹ of that kernel. A nonzero cokernel excludes the torsion case, where the BdR⁺-linear map would already be surjective on sections; the kernel is therefore a nonzero bundle with strictly negative slopes. Its H¹ has the asserted curvature and height.

**Sources:** [CN (author copy)][CN-author], Proposition 3.23, p. 19.

**Prerequisites:** [Curvature and HN support](#curvature-hn-characterisation); [Euler–Poincaré height formula](#euler-poincare-height); [Le Bras equivalence](#le-bras-equivalence).

<a id="nonpositive-curvature-extensions"></a>

#### Nonpositive curvature extension criterion

A BC object W has curvature ≤0 exactly when it admits a BC short exact sequence 0→V→W→M→0 with V finite-dimensional over Q_p and M affine (curvature 0). For existence, decompose W into torsion at ∞ and U_{d_i/h_i} with d_i/h_i≥0; their fundamental sequences 0→Q_p^{h_i}→U_{d_i/h_i}→B_{d_i}→0 give V=⊕_i Q_p^{h_i}. The reverse implication follows from extension stability in CN Corollary 3.19(ii).

**Sources:** [CN (author copy)][CN-author], Lemma 3.24, p. 19.

**Prerequisites:** [Curvature and HN support](#curvature-hn-characterisation); [The fundamental untilt sequence and degree-one divisors](#fundamental-exact-sequence); [Dimensions of standard Banach–Colmez spaces](#standard-dimension-examples).

### A semistable period-space example

This application retains the supercuspidal representation hypotheses and the L-action. A dimension calculation alone does not establish the one-dimensional multiplicity statement.

<a id="semistable-period-example"></a>

#### Dimension of the semistable period space

For the supercuspidal rank-two slope-1/2 L-(φ,N,G_F)-module M of CDN §2.1.2, X_st⁺(M)=(B_cris⁺⊗M)^{φ=p} is a positive Banach–Colmez space of L-Dimension ([L:Q_p],2). The one-dimensional multiplicity conclusion of Lemma 2.7 also uses the admissibility/p-adic Hodge representation input; it is not deduced from Dimension for an arbitrary rank-two module.

Retain the paper’s supercuspidal hypothesis, coefficient action, and normalization of L-Dimension. No extension to arbitrary rank-two M or a new local-Langlands theorem is claimed.

**Sources:** [CDN][CDN], §2.1.2, Proposition 2.5 and Lemma 2.7, author preprint pp. 21–23.

**Prerequisites:** [Dimensions of standard Banach–Colmez spaces](#standard-dimension-examples); [Dimension and the abelian BC category](#dimension-abelian); [Two-term Banach–Colmez geometry](#families-of-banach-colmez-spaces); `PadicHodgeTheory:R06.2`.

## Layer VB4 — Families, pure models and local systems

### Geometric family filtrations and cohomology

The upper polygon convention is the one of VB1. Proper projectivized ordinary BC spaces detect the closed loci where an exterior-power section exists. The relative HN filtration descends globally on a constant-polygon locus; its splitting and block trivializations require a pro-étale cover.

<a id="semicontinuity-of-HN-polygon"></a>

#### Upper semicontinuity of geometric HN polygons

For a constant-rank n bundle E on X_S, the concave HN polygon, horizontal coordinate rank and decreasing slopes repeated with their ranks, is upper semicontinuous on |S|: for every x∈[0,n] its ordinate is upper semicontinuous. Rank and total degree are locally constant. This is FS II.2.19(i), including equal-characteristic coefficient fields. The polygon is the UPPER boundary of the convex hull of the exterior-power section points; do not replace it by KL’s convex lower polygon.

S is perfectoid over F_q; rank n is constant on the component considered. Geometric-point values are invariant under extension of the complete algebraically closed field.

**Sources:** [FS][FS], Theorem II.2.19(i) and proof, p. 74.

**Prerequisites:** [Ordinary Banach–Colmez properness](#properness-of-projectivized-BC); [Rank-normalized Harder–Narasimhan polygon](#harder-narasimhan-polygon); [Rank, determinant degree and rational slope](#degree-rank-slope-and-HN-formalism); [Slope-sensitive cohomology of standard bundles](#cohomology-of-twists); [Geometric classification of vector bundles](#dieudonne-manin-classification-of-bundles); [Base change of the geometric HN filtration](#HN-filtration-base-change).

<a id="relative-HN-filtration-and-proetale-splitting"></a>

#### Relative HN filtration and pro-étale splitting

Assume the HN polygon of E is constant on S. Then there exists a global separated exhaustive decreasing Harder-Narasimhan filtration E^{>= lambda} in E specialising to the HN filtration at each point; and after replacing S by a PRO-ETALE cover the filtration can be split, with isomorphisms E^lambda = O_{X_S}(lambda)^{n_lambda} for integers n_lambda >= 0.

S is perfectoid over F_q, the bundle has constant rank and constant geometric HN polygon. Splitting is PRO-ÉTALE local; it is not asserted étale local or globally split.

**Sources:** [FS][FS], Theorem II.2.19(ii) and proof, pp. 74–75.

**Prerequisites:** [Upper semicontinuity of geometric HN polygons](#semicontinuity-of-HN-polygon); [Ordinary Banach–Colmez properness](#properness-of-projectivized-BC); [Geometric classification of vector bundles](#dieudonne-manin-classification-of-bundles); [Hom and extension calculus for geometric bundles](#hom-and-ext-calculus); `DiamondsAndVStacks:D3/locally-profinite-torsors`; `DiamondEtaleCohomology:C4`; [Slope-sensitive cohomology of standard bundles](#cohomology-of-twists); [V-descent of bundles and their derived cohomology](#v-descent-for-bundles-and-cohomology).

<a id="slope-zero-local-systems"></a>

#### Slope-zero bundles and E-local systems

There is an exact tensor equivalence between finite-rank pro-étale E-local systems on S and vector bundles on X_S whose EVERY geometric HN slope is zero, via L↦L⊗_E O_X. The quasi-inverse is T↦H⁰(X_T,E_T); it commutes with perfectoid base change and coefficient extension with its normalized Frobenius. Locally constant rank is handled componentwise. Total degree zero alone does not suffice.

Every geometric fibre is semistable of slope zero. On each component of locally constant rank its HN polygon is therefore the fixed zero polygon. Fibrewise triviality does not trivialize the descent datum globally. Full faithfulness is proved by pro-étale descent, reducing to L trivial, and then by Prop. II.2.5(ii): H⁰(X_S,O)=underline E(S), the locally constant E-valued functions on |S|, and RΓ(X_S,O)=RΓ_proét(S,E). Essential surjectivity is Thm. II.2.19(ii) applied with a single slope 0. A local system is not the same as a globally trivial bundle: the descent datum is the content.

**Sources:** [FS][FS], Corollary II.2.20, p. 75.

**Prerequisites:** [Relative HN filtration and pro-étale splitting](#relative-HN-filtration-and-proetale-splitting); [Two-term Frobenius complex for curve cohomology](#frobenius-two-term-cohomology); `DiamondsAndVStacks:D3/locally-profinite-torsors`; `mathlib:CategoryTheory.Equivalence`; [Slope-sensitive cohomology of standard bundles](#cohomology-of-twists).

<a id="relative-cohomology-vanishing"></a>

#### Slope-dependent cohomology vanishing

For a bundle E on X_S: everywhere negative slopes imply H⁰(X_S,E)=0, universally after perfectoid base change; everywhere nonnegative slopes imply H¹(X_S,E)=0 after some pro-étale cover of S; everywhere positive slopes imply an étale cover S′→S such that H¹(X_T,E_T)=0 for EVERY affinoid perfectoid T/S′. The second assertion is local vanishing of cohomology, not vanishing on every original S.

S∈Perf_Fq; slope assertions hold at all geometric points.

**Sources:** [FS][FS], Proposition II.3.4(i)–(iii), p. 79.

**Prerequisites:** [Banach–Colmez section and hypercohomology sheaves](#banach-colmez-space-definition); [Relative HN filtration and pro-étale splitting](#relative-HN-filtration-and-proetale-splitting); [Small-slope resolutions of positive bundles](#positive-slope-resolution); [Étale positive-slope presentations](#strict-positive-etale-presentations); [Slope-sensitive cohomology of standard bundles](#cohomology-of-twists); [V-descent of bundles and their derived cohomology](#v-descent-for-bundles-and-cohomology).

### Pure models and annular approximation

KL Hypotheses 5.0.1 and 6.0.1: R is a perfect uniform Banach F_p-algebra over an analytic field; a≥1 and q=p^a. Ring/sheaf, full/bounded Robba and integral coefficients are kept distinct. All targets in this and the next three subsections use these hypotheses.

<a id="annular-basis-approximation"></a>

#### Annular basis approximation

For a φ^a-module M over ℛ̃_R, write M_r for its radius-r model. A basis of the annular restriction M_[r/q,r] extends as a basis of M_r if its Frobenius matrix is invertible over ℛ̃_R^{r/q} (Lemma 7.1.1). For the quantitative version (Lemma 7.1.2), fix h≥0 and D=diag(p^{d₁},…,p^{d_n}), with integer exponents satisfying |d_i−d_j|≤h. Suppose the annular basis e_i has Frobenius matrix F over ℛ̃_R^{[r/q,r/q]} and λ(α^{r/q})(FD−I)<p^{−h}. There is a change-of-basis matrix U with v_j=Σ_i U_ij e_i giving a basis of M_r; its Frobenius matrix F′ satisfies F′D−I∈p Mat_n(ℛ̃_R^{int,r/q}). The bounds on this change are λ(α^{r/q})(U−I)<p^{−h} and λ(α^r)(D⁻¹UD−I)<p^{−h}.

**Sources:** [KL][KL], §7.1, Lemmas 7.1.1–7.1.2, pp. 145–146.

**Prerequisites:** [Annular Frobenius descent for bundles](#annular-frobenius-descent); [Relative tilted Robba ring from curve annuli](#tilted-robba-ring).

<a id="pure-models"></a>

#### Pure models and purity loci

Choose integers c,d with d>0 and a|d. For a φ^a-module M, let A₀=W(R) when M has ℰ̃_R coefficients, and A₀=ℛ̃^int_R for bounded or full Robba coefficients. A (c,d)-pure model is an A₀-submodule M₀⊂M satisfying three conditions: there exist a finitely generated A₀-submodule N₀⊂M and n≥0 with p^nM₀⊂N₀ and p^nN₀⊂M₀; extension from A₀ to the coefficient ring identifies M₀ with M; and the Frobenius on M restricts to an isomorphism (p^cφ^d)^*M₀≅M₀. Thus boundedness means commensurability with a finitely generated submodule, and the required stability is under φ^d after inverting p, without imposing φ^a-stability at this point (Remark 7.3.2). Such a model implies pointwise slope c/d. The adjectives free and locally free refer to finite free and finite locally free A₀-modules; finite presentation implies local freeness. A local model at β is a model after rational localization R→R′ through a neighborhood of β. Lemma 7.3.3 equates existence of free and locally free local models, and for bounded Robba coefficients allows this existence test after extension to ℰ̃_R. Define purity of slope s at β by existence of a locally free local model with c/d=s; for nonzero rank s=μ(M,β), while rank zero is pure of every slope. Purity means this condition at every β; compactness then gives finitely many local models. Étaleness is slope-zero purity, and an étale model has c=0. Global purity requires a locally free model over the original base. Distinguish five properties: (a) global purity; (b) existence of a pure model; (c) purity; (d) existence of local pure models; (e) pointwise purity. For ℰ̃_R and ℛ̃^bd_R, properties (b),(c),(d),(e) are equivalent, whereas (a) is stronger. For ℛ̃_R, the equivalent properties are (c),(d),(e), with (b) stronger and (a) stronger still. KL Corollaries 7.3.9 and 8.5.14 supply the equivalences. Examples 8.5.17 and 8.5.18 distinguish the global conditions, with the stronger bounded-ring interpretation of the nodal example requiring its own patching argument. Extension from ℛ̃^bd_R to ℛ̃_R does not detect purity over the bounded coefficient ring.

**API.**

- `PureModel`: A bounded integral submodule generating the ambient Frobenius module, with p^cφ^d linearization invertible.
- `PureModel.lattice`: The integral lattice is a Submodule of the restricted-scalars module, with its actual inclusion.
- `PureModel.baseChange`: Rational localization transports the pure model, its boundedness and its Frobenius isomorphism.
- `PureModel.etale`: A (0,d)-pure model is an étale model; globally pure means a globally finite locally free such model.
- `PureModel.fibreSlope`: On a nonzero fibre a (c,d)-pure model forces the Robba slope c/d, with p^cφ^d=1 on a trivializing basis.

**Examples and checks.**

- `PureModelTest.unit`: The trivial φ-module with unit integral lattice is (0,a)-pure.
- `PureModelTest.zero`: The zero module is pure of every slope; it has no distinguished numeric slope.
- `PureModelTest.scaled`: A rank-one action φ^d=p^{−c} with standard lattice is (c,d)-pure, detecting the sign of p^c.
- `PureModelTest.localNotGlobal`: The perfected Tate-curve local system with p monodromy is locally étale but has no global integral étale model.

**Sources:** [KL][KL], §7.3, Definitions 7.3.1 and 7.3.4, Lemma 7.3.3 and Remarks 7.3.2, 7.3.5, 7.3.11, pp. 147–152.

**Prerequisites:** [Finite projective Frobenius modules and integral models](#robba-frobenius-modules); [Relative tilted Robba ring from curve annuli](#tilted-robba-ring); `mathlib:Submodule`.

<a id="pure-model-trivialization"></a>

#### Pro-étale trivialization of pure models

If a φ^a-module M over ℰ̃_R (resp. ℛ̃^bd_R, ℛ̃_R) has a free (c,d)-pure model M_0, there is an R-algebra S, the completed direct limit of faithfully finite étale R-subalgebras, such that M_0 ⊗ W(S) (resp. M_0 ⊗ ℛ̃^int_S) has a basis fixed by p^cφ^d.

**Sources:** [KL][KL], §7.3, Proposition 7.3.6, p. 149.

**Prerequisites:** [Pure models and purity loci](#pure-models).

<a id="purity-openness"></a>

#### Openness and pointwise detection of purity

Take a φ^a-module M over ℛ̃_R with nonzero rank at every point, and β in its pure locus. For integers c,d with d>0 divisible by a and c/d=μ(M,β), a (c,d)-pure model of the fibre over ℛ̃_{ℋ(β)} spreads to a free pure model on a rational neighborhood of β with the same parameters. For arbitrary rank, this implies openness of both purity and étaleness on ℳ(R), equivalence of pointwise and local purity (and of pointwise and local étaleness), and detection of purity at β by the existence of a local pure model without a local-freeness assumption.

**Sources:** [KL][KL], §7.3, Theorem 7.3.7 and Corollaries 7.3.8–7.3.10, pp. 150–151.

**Prerequisites:** [Annular basis approximation](#annular-basis-approximation); [Pure models and purity loci](#pure-models).

<a id="diagonal-gauge-normal-form"></a>

#### Diagonal Frobenius gauge normal form

For a φ^a-module over ℛ̃^bd_R, suppose its chosen Frobenius matrix is AD, with D diagonal, D_ii∈p^Z, and A−I∈p Mat(ℛ̃^int_R). One can find an R-algebra S formed as a union of faithfully finite étale R-subalgebras and U∈GL_n(W(S)), U≡I mod p, satisfying U⁻¹ADφ^a(U)=D. Completion of this union is unnecessary. At every β, the generic slope multiset is {−v_p(D_ii)/a}_i.

**Sources:** [KL][KL], §7.4, Lemma 7.4.4, pp. 152–153.

**Prerequisites:** [Annular basis approximation](#annular-basis-approximation).

### Robba polygons and constant vertices

Use the same KL hypotheses as above. The lower convex Robba polygon is related to the upper geometric HN polygon by the convention stated earlier. The special/generic polygon input is over perfect analytic residue fields; it is supplied by RD.2 with that generality.

<a id="robba-polygon-semicontinuity"></a>

#### Robba slope-polygon semicontinuity

For any φ^a-module M over ℛ̃_R, β ↦ the slope polygon of M ⊗ ℛ̃_{ℋ(β)} is lower semicontinuous on ℳ(R): where the rank is constant, for each x ∈ [0, rank M] the y-coordinate of the polygon at x is a lower semicontinuous function of β, and it is locally constant at x = rank M.

**Sources:** [KL][KL], §7.4, Theorem 7.4.5, p. 153.

**Prerequisites:** [Annular basis approximation](#annular-basis-approximation); [Diagonal Frobenius gauge normal form](#diagonal-gauge-normal-form); [Pure models and purity loci](#pure-models); `PadicDifferentialEquationsAndRigidCohomology:RD.2/special-polygon-above-generic`; [Geometric classification of vector bundles](#dieudonne-manin-classification-of-bundles); [Exact tensor equivalence of Robba modules and curve bundles](#robba-bundle-equivalence); [Base change of the geometric HN filtration](#HN-filtration-base-change).

<a id="bounded-polygons-dense-locus"></a>

#### Bounded polygons and dense constant loci

For any φ^a-module M over ℛ̃_R, the slope polygons of M at the points of ℳ(R) are bounded above and below (all slopes are at least −N/a for N as in Proposition 6.2.4, and the sum of the slopes is continuous). Hence the polygon takes finitely many values locally, and there is an open dense U ⊆ ℳ(R) on which it is locally constant.

**Sources:** [KL][KL], §7.4, Proposition 7.4.6 and Corollary 7.4.7, pp. 153–154.

**Prerequisites:** [Global generation and vanishing after positive twists](#quantitative-global-generation); [Robba slope-polygon semicontinuity](#robba-polygon-semicontinuity).

<a id="constant-vertex-submodule"></a>

#### Submodule at a constant polygon vertex

(7.4.8) Let A be an n × n matrix over ℛ̃^int_R invertible over ℛ̃^bd_R, x_1, …, x_n ∈ ℛ̃^bd_R, and y_1, …, y_n ∈ ℰ̃_R with y_i − x_i = Σ_j A_{ij}φ^a(y_j). Then all y_i lie in ℛ̃^bd_R iff their images lie in ℛ̃^bd_{ℋ(β)} for every β ∈ ℳ(R). (7.4.9) Let M over ℛ̃_R have constant rank n and slopes μ_1(M,β) ≥ ⋯ ≥ μ_n(M,β) at β. If for some m ∈ {1, …, n−1} and all β we have μ_m(M,β) > μ_{m+1}(M,β) and μ_1 + ⋯ + μ_m constant, there is a unique φ^a-submodule N of rank m with M/N a φ^a-module such that at every β the slopes of N are μ_1, …, μ_m and those of M/N are μ_{m+1}, …, μ_n.

**Sources:** [KL][KL], §7.4, Lemma 7.4.8 and Theorem 7.4.9, pp. 154–155.

**Prerequisites:** [Robba slope-polygon semicontinuity](#robba-polygon-semicontinuity); [Pure models and purity loci](#pure-models); `PadicDifferentialEquationsAndRigidCohomology:RD.2/coincident-polygons-common-filtration`; [Diagonal Frobenius gauge normal form](#diagonal-gauge-normal-form).

<a id="robba-constant-polygon-filtration"></a>

#### Robba filtration on a constant-polygon locus

If the slope polygon of a φ^a-module M over ℛ̃_R is constant on ℳ(R), there is a unique filtration 0 = M_0 ⊂ ⋯ ⊂ M_l = M by φ^a-submodules whose quotients are φ^a-modules pure of constant slope with μ(M_1/M_0) > ⋯ > μ(M_l/M_{l−1}).

**Sources:** [KL][KL], §7.4, Corollary 7.4.10, p. 155.

**Prerequisites:** [Submodule at a constant polygon vertex](#constant-vertex-submodule); [Openness and pointwise detection of purity](#purity-openness).

<a id="negative-frobenius-cohomology-detection"></a>

#### Pointwise detection of negative Frobenius cohomology

If M over ℛ̃_R has everywhere negative slopes, then H^0_{φ^a}(M) = 0, H^0_{φ^a}(M ⊗ ℛ̃_{ℋ(β)}) = 0 for all β ∈ ℳ(R), and H^1_{φ^a}(M) → ∏_β H^1_{φ^a}(M ⊗ ℛ̃_{ℋ(β)}) is injective. For any M this applies to M(n) for n small enough (by Proposition 7.4.6); the injectivity also holds for n large, since then H^1_{φ^a}(M(n)) = 0 by Proposition 6.2.2.

**Sources:** [KL][KL], §7.4, Corollary 7.4.11 and Remark 7.4.12, pp. 155–156.

**Prerequisites:** [Two-term Frobenius complex for curve cohomology](#frobenius-two-term-cohomology); [Robba filtration on a constant-polygon locus](#robba-constant-polygon-filtration); [Submodule at a constant polygon vertex](#constant-vertex-submodule); [Exact tensor equivalence of Robba modules and curve bundles](#robba-bundle-equivalence); [Slope-sensitive cohomology of standard bundles](#cohomology-of-twists).

### Ring/sheaf comparisons and local purity

Use the same KL hypotheses. For the two-out-of-three theorem add KL Hypothesis 8.6.1. Global lattices, arbitrary bounded models, local models and pointwise purity remain separate notions. The Tate-curve p-monodromy example separates them. The stronger bounded-ring interpretation of the separate nodal example requires a patching argument and is not inferred just from the sheaf example.

<a id="ring-sheaf-frobenius-comparison"></a>

#### Ring and sheaf Frobenius-module comparison

Let (R, R⁺) be a perfect uniform adic Banach algebra over 𝔽_p and X = Spa(R, R⁺). For ∗ ∈ {ℰ̃, ℛ̃^bd, ℛ̃}, the natural functor from φ^d-modules over ∗_R to φ^d-modules over the sheaf ∗_X (called local φ^d-modules over ∗_R) is fully faithful (Theorem 5.3.3). For ∗ = ℛ̃ it is an equivalence of categories (Corollary 6.3.13); for ∗ = ℰ̃ and ∗ = ℛ̃^bd it is not (Example 8.5.17). A φ^d-module over ∗_R is pure (resp. étale) if and only if the corresponding φ^d-module over ∗_X is.

**Sources:** [KL][KL], §8.5, Remark 8.5.10, p. 172 (arXiv 1301.0792v5).

**Prerequisites:** [Exact tensor equivalence of Robba modules and curve bundles](#robba-bundle-equivalence); [Pure models and purity loci](#pure-models).

<a id="adic-purity-loci"></a>

#### Adic pure and étale loci

For a φ^d-module M on ℛ̃_X, where X is perfect uniform over F_{p^d}, purity and étaleness define open subspaces of X. If X lies over an analytic field, these opens are partially proper in the sense of KL Definition 8.2.11. When X is taut, both subspaces are taut as well, by Lemma 8.2.12. The loci concern the module M, rather than its coefficient sheaf.

**Sources:** [KL][KL], §8.5, Lemma 8.5.11, p. 173 (arXiv 1301.0792v5).

**Prerequisites:** [Openness and pointwise detection of purity](#purity-openness).

<a id="local-global-purity-counterexamples"></a>

#### Local purity without global pure models

KL constructs a rational local system with p-monodromy by identifying the two boundary circles of a punctured annulus over K=F_p((q)), |q|=ω<1. Its affinoid algebra is B=K{ω²/T,T,U/ω^{−2}}/(U(T−q)−1); the boundaries have algebras B₁=K{ω²/T,T/ω²} and B₂=K{1/T,T}. Substitution T↦q²T identifies B₁ with B₂, in that direction, and gives an affinoid chart in the Tate curve of parameter q² over K. Identify one boundary generator with p times the other and pass to completed perfections R,S,S₁,S₂ of A,B,B₁,B₂. The resulting Q_p local system cannot come from an étale module over ℰ̃_R or ℛ̃^bd_R: a putative invariant section would satisfy x₂=pσ_q(x₁), hence belong to every p^mW(S) and vanish. It does come from an étale full Robba module and from étale ℰ̃_X and ℛ̃^bd_X sheaves on X=Spa(R,R°). Thus sheaf descent does not imply descent to the bounded coefficient rings, and the full Robba module has no étale model. The separate nodal example 8.5.18 gives locally étale sheaves without a global étale lattice. A bounded-ring realization of the separate nodal example additionally requires a patching theorem; the sheaf example alone does not give that realization.

**Sources:** [KL][KL], §8.5, Examples 8.5.17–8.5.18, pp. 174–175 (arXiv 1301.0792v5).

**Prerequisites:** [Ring and sheaf Frobenius-module comparison](#ring-sheaf-frobenius-comparison); [Pure modules and twisted local systems](#pure-modules-local-systems).

<a id="pure-two-out-of-three"></a>

#### Pure modules in short exact sequences

Under KL Hypothesis 8.6.1, (c,d)-purity has the two-out-of-three property for 0→M₁→M→M₂→0 in φ-modules over ℛ̃_R: purity of any pair among M₁,M,M₂ forces purity of the remaining term.

**Sources:** [KL][KL], §8.6, Lemma 8.6.3, p. 176 (arXiv 1301.0792v5).

**Prerequisites:** [Pointwise purity over all three coefficient rings](#all-rings-pointwise-purity).

### Twisted and integral local systems

Use the KL hypotheses for pure-module statements. The twisted local-system definition fixes arithmetic Frobenius and an unramified coefficient extension. Integral comparisons involve actual lattices; after taking isogenies they give globally pure models, while rational local systems may have no global integral lattice.

<a id="twisted-local-systems"></a>

#### Twisted rational local systems

For c∈Z and d>0, a (c,d)-Q_p local system is an étale local system of finite-dimensional Q_{p^d}-vector spaces equipped with a Frobenius-semilinear automorphism τ such that p^c τ^d=1. Scheme-side isogeny (c,d)-Z_p local systems carry the same data on an isogeny Z_{p^d} local system. The categories for proportional pairs (c,d) are naturally equivalent, not literally equal.

Q_{p^d}/Q_p unramified; τ acts semilinearly for arithmetic Frobenius. Étale rational local systems need not admit a global integral lattice.

**API.**

- `TwistedLocalSystem`: Finite-rank Q_{p^d} étale local system with arithmetic-Frobenius-semilinear τ and p^cτ^d=1.
- `TwistedLocalSystem.frobenius`: The specified semilinear automorphism τ, with its coefficient Frobenius.
- `TwistedLocalSystem.iterate`: For every section v, p^c τ^d(v)=v.
- `TwistedLocalSystem.pullback`: Pullback transports τ and its equation; identities and composition agree.
- `TwistedLocalSystem.reindex`: Pairs of positive denominator with the same c/d give naturally equivalent categories by unramified scalar extension/descent.

**Examples and checks.**

- `TwistedLocalSystemTest.zeroSlope`: At (0,1), τ=1 and the object is an ordinary Q_p local system.
- `TwistedLocalSystemTest.nonzeroTwist`: For c≠0,d=1, τ=1 on a nonzero Q_p line fails p^cτ=1.
- `TwistedLocalSystemTest.reindex`: The categories for (1,2) and (2,4) are equivalent; the coefficient fields and underlying vector-space ranks are not literally identical.

**Sources:** [KL][KL], Definition 8.5.7, p. 172.

**Prerequisites:** `DiamondsAndVStacks:D3`; `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-5-local-coefficients-the-brauer-group-the-local-invariant-and-duality`; `mathlib:ModuleCat`.

<a id="integral-frobenius-local-systems"></a>

#### Integral Frobenius and local-system comparison

For a perfect uniform adic Banach pair over F_{p^d}, étale Z_{p^d} local systems on Spec(R), on its inverse-perfecting complete subring, and on the corresponding untilt agree with φ^d-modules over W(R) and the integral relative Robba ring; the ring functor is scalar extension. The equivalence globalizes to perfectoid X and its tilt/inverse perfection. Over an algebraically closed complete C/Q_p, φ-modules over the integral Robba ring and W(C♭) agree with finite free Z_p modules (SW12.3.4). Taking isogenies yields globally pure models, not all rational étale local systems.

KL Theorems 8.5.3–8.5.6, with integral finite projective modules. The absolute SW12.3.4 is restricted to E=Q_p and C algebraically closed.

**Sources:** [KL][KL], Theorems 8.5.3–8.5.6, pp. 169–171; [SW][SW], Theorem 12.3.4, book p. 104.

**Prerequisites:** [Pro-étale trivialization of pure models](#pure-model-trivialization); [Twisted rational local systems](#twisted-local-systems); `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.2`; `PerfectoidSpaces:P3`.

<a id="pure-modules-local-systems"></a>

#### Pure modules and twisted local systems

Fix c∈Z and a perfectoid space X over Q_{p^d}, with characteristic-p partner X′ over F_{p^d}. Twisted étale (c,d)-Q_p-local systems on X, on X′, and on any adic X₀′ with inverse perfection X′ give equivalent categories. Each is also equivalent to the category of (c,d)-pure φ-modules for any of the three coefficient sheaves ℰ̃_{X′}, ℛ̃^bd_{X′}, or ℛ̃_{X′}. These are sheaf-coefficient equivalences; they do not assert descent to the corresponding global coefficient rings.

**Sources:** [KL][KL], §8.5, Theorem 8.5.12, p. 173 (arXiv 1301.0792v5).

**Prerequisites:** [Pure models and purity loci](#pure-models); [Pro-étale trivialization of pure models](#pure-model-trivialization); [Ring and sheaf Frobenius-module comparison](#ring-sheaf-frobenius-comparison); [Twisted rational local systems](#twisted-local-systems); [Integral Frobenius and local-system comparison](#integral-frobenius-local-systems); `mathlib:CategoryTheory.Equivalence`.

<a id="purity-denominator-independence"></a>

#### Independence of purity denominator

Let X be perfect uniform over F_{p^d}, and use any of the coefficient sheaves ℰ̃_X, ℛ̃^bd_X, ℛ̃_X for a φ^d-module M. At a fixed point x, purity with slope s is independent of the presentation of s: it is equivalent to (c′,d′)-purity at x for all integers c′,d′ satisfying d′>0, d|d′, and c′/d′=s.

**Sources:** [KL][KL], §8.5, Corollary 8.5.13, p. 173 (arXiv 1301.0792v5).

**Prerequisites:** [Pure modules and twisted local systems](#pure-modules-local-systems).

<a id="all-rings-pointwise-purity"></a>

#### Pointwise purity over all three coefficient rings

Let (R, R⁺) be as in Hypothesis 5.0.1 (a perfect uniform adic Banach algebra over 𝔽_p that is a Banach algebra over an analytic field) and M a φ^d-module over ℰ̃_R, ℛ̃^bd_R or ℛ̃_R. If M is pointwise pure (M ⊗ ℋ(β) is pure for every β ∈ ℳ(R)), then M is pure (it admits a locally free local pure model at every β ∈ ℳ(R)).

**Sources:** [KL][KL], §8.5, Corollary 8.5.14, p. 173 (arXiv 1301.0792v5).

**Prerequisites:** [Openness and pointwise detection of purity](#purity-openness); [Pure modules and twisted local systems](#pure-modules-local-systems).

<a id="surjective-purity-descent"></a>

#### Surjective descent and detection of purity

Consider a bounded map (R,R⁺)→(S,S⁺) between perfect uniform adic Banach F_{p^d}-algebras, with surjective induced map of adic spectra. For a local φ^d-module M, purity is equivalent to purity after scalar extension from R to S, for each of ℰ̃, bounded Robba, and full Robba coefficients. For full Robba sheaves, KL Corollary 8.5.16 gives the analogous equivalence under any surjective map of perfectoid adic spaces.

**Sources:** [KL][KL], §8.5, Corollaries 8.5.15–8.5.16, p. 174 (arXiv 1301.0792v5).

**Prerequisites:** [Pointwise purity over all three coefficient rings](#all-rings-pointwise-purity).

### Pointwise and relative ampleness

KL Hypothesis 8.7.1: mixed characteristic, perfectoid untilt over Q_p, q=p^a. All targets in this subsection additionally use the KL perfect-uniform analytic-base hypotheses above. The KL pair/space comparisons are Theorems 3.6.5 and 8.3.5; thus these ampleness results do not automatically extend to every general-E curve.

<a id="pointwise-ampleness"></a>

#### Pointwise ampleness

In the setting of KL Hypothesis 8.7.1, take an integer a≥1 and q=p^a, a perfectoid adic Banach pair (A,A⁺) over Q_p with associated perfect uniform characteristic-p pair (R,R⁺), and a perfectoid space X/Q_p with its corresponding characteristic-p space X′. The pair and space comparisons are KL Theorems 3.6.5 and 8.3.5. For F on Proj(P_R), use the fibrewise HN polygon as its slope-polygon function on ℳ(R); compose with the retraction for its interpretation on Spa(R,R⁺). Via Theorem 6.3.12 and Remark 4.2.18, this agrees with the polygon of the associated Robba φ^a-module. Define the pointwise ample locus by strict positivity of every fibre slope. Theorem 7.4.5 makes this locus open. Call F pointwise ample when the locus is all of ℳ(R).

**API.**

- `PointwiseAmple`: At β the predicate that all slopes of the fibre polygon are strictly positive.
- `PointwiseAmple.isOpen`: The set of β∈ℳ(R) at which F is pointwise ample is open (KL Theorem 7.4.5), and so is its preimage in Spa(R,R⁺) under the retraction.
- `PointwiseAmple.pullback`: The predicate is preserved under residue-field extension and perfectoid pullback.
- `PointwiseAmple.tensor`: Tensor products of positive fibres are positive, with slopes added with their multiplicities.
- `PointwiseAmple.projComparison`: The predicate agrees for a Proj bundle and its full Robba module under the Robba–bundle equivalence.

**Examples and checks.**

- `PointwiseAmpleTest.positive`: O(1) is pointwise ample.
- `PointwiseAmpleTest.unit`: O is not pointwise ample: its slope is zero.
- `PointwiseAmpleTest.mixed`: O(2)⊕O(−1) has positive total degree but is not pointwise ample.
- `PointwiseAmpleTest.zero`: The zero bundle satisfies the every-slope predicate vacuously; it has no positive rank or numerical slope.

**Sources:** [KL][KL], §8.8, Definition 8.8.10, pp. 182–183 (arXiv 1301.0792v5).

**Prerequisites:** [Rank-normalized Harder–Narasimhan polygon](#harder-narasimhan-polygon); [Tensor global ampleness and rational-local ampleness](#tensor-global-ampleness); [Robba slope-polygon semicontinuity](#robba-polygon-semicontinuity).

<a id="positive-tensor-domination"></a>

#### Positive tensor powers dominate a bundle

In the setting of KL Hypothesis 8.7.1, take an integer a≥1 and q=p^a, a perfectoid adic Banach pair (A,A⁺) over Q_p with associated perfect uniform characteristic-p pair (R,R⁺), and a perfectoid space X/Q_p with its corresponding characteristic-p space X′. The pair and space comparisons are KL Theorems 3.6.5 and 8.3.5. Suppose F on Proj(P_R) is pointwise ample and G is any bundle there. Tensor powers of F eventually dominate G: some integer n₀ has F^{⊗n}⊗G pointwise ample for every n≥n₀.

**Sources:** [KL][KL], §8.8, Lemma 8.8.11 and its proof, p. 183 (arXiv 1301.0792v5).

**Prerequisites:** [Bounded polygons and dense constant loci](#bounded-polygons-dense-locus); [Pointwise ampleness](#pointwise-ampleness).

<a id="geometric-positive-generation"></a>

#### Positive bundles on the geometric Proj curve

In the setting of KL Hypothesis 8.7.1, take an integer a≥1 and q=p^a, a perfectoid adic Banach pair (A,A⁺) over Q_p with associated perfect uniform characteristic-p pair (R,R⁺), and a perfectoid space X/Q_p with its corresponding characteristic-p space X′. The pair and space comparisons are KL Theorems 3.6.5 and 8.3.5. If R=L is an analytic field and F on Proj(P_L) is ample, then H¹(Proj(P_L),F)=0 and the evaluation map from its global sections generates F. Both claims use the analytic-field hypothesis of KL Lemma 8.8.12.

**Sources:** [KL][KL], §8.8, Lemma 8.8.12(a)–(b) and its proof, p. 183 (arXiv 1301.0792v5).

**Prerequisites:** [Slope-sensitive cohomology of standard bundles](#cohomology-of-twists); [GAGA for the relative schematic curve](#gaga-equivalence); [Pointwise ampleness](#pointwise-ampleness); [Tensor global ampleness and rational-local ampleness](#tensor-global-ampleness); [Positive twists of globally étale bundles](#globally-etale-positive-ampleness); [Global generation and vanishing after positive twists](#quantitative-global-generation); [Geometric classification of vector bundles](#dieudonne-manin-classification-of-bundles).

<a id="nonnegative-extension"></a>

#### Nonnegative extension by a negative twist

In the setting of KL Hypothesis 8.7.1, take an integer a≥1 and q=p^a, a perfectoid adic Banach pair (A,A⁺) over Q_p with associated perfect uniform characteristic-p pair (R,R⁺), and a perfectoid space X/Q_p with its corresponding characteristic-p space X′. The pair and space comparisons are KL Theorems 3.6.5 and 8.3.5. Suppose that at a chosen β∈ℳ(R), the slopes of F on Proj(P_R) are nonnegative and at least one is positive. F admits a vector-bundle extension 0→O(−1)→G→F→0 for which every slope of G at β remains nonnegative.

**Sources:** [KL][KL], §8.8, Lemma 8.8.13 and its proof, pp. 183–185 (arXiv 1301.0792v5).

**Prerequisites:** [Robba slope-polygon semicontinuity](#robba-polygon-semicontinuity); [Positive bundles on the geometric Proj curve](#geometric-positive-generation).

<a id="etale-at-point-resolution"></a>

#### Resolution by an étale-at-a-point bundle

In the setting of KL Hypothesis 8.7.1, take an integer a≥1 and q=p^a, a perfectoid adic Banach pair (A,A⁺) over Q_p with associated perfect uniform characteristic-p pair (R,R⁺), and a perfectoid space X/Q_p with its corresponding characteristic-p space X′. The pair and space comparisons are KL Theorems 3.6.5 and 8.3.5. When the slopes of F on Proj(P_R) at a chosen β∈ℳ(R) are nonnegative, there are bundles H,G and an exact sequence 0→H→G→F→0 with G étale at β.

**Sources:** [KL][KL], §8.8, Corollary 8.8.14, p. 185 (arXiv 1301.0792v5).

**Prerequisites:** [Nonnegative extension by a negative twist](#nonnegative-extension); [Openness and pointwise detection of purity](#purity-openness).

<a id="ample-iff-pointwise"></a>

#### Ampleness and positive fibre slopes

Under Hypothesis 8.7.1 (a ≥ 1 an integer, q = p^a; (A, A⁺) a perfectoid adic Banach algebra over ℚ_p and (R, R⁺) the perfect uniform adic Banach algebra over 𝔽_p corresponding to it by Theorem 3.6.5; X a perfectoid adic space over ℚ_p and X′ the perfect uniform adic space over 𝔽_p corresponding to it by Theorem 8.3.5), a vector bundle F on Proj(P_R) is ample if and only if it is pointwise ample (all its slopes at every β ∈ ℳ(R) are positive).

**Sources:** [KL][KL], §8.8, Theorem 8.8.15 and Remark 8.8.16, p. 185 (arXiv 1301.0792v5).

**Prerequisites:** [Tensor global ampleness and rational-local ampleness](#tensor-global-ampleness); [Positive tensor powers dominate a bundle](#positive-tensor-domination); [Resolution by an étale-at-a-point bundle](#etale-at-point-resolution); [Pointwise ampleness](#pointwise-ampleness); [Positive twists of globally étale bundles](#globally-etale-positive-ampleness); [Power criterion for tensor global ampleness](#ampleness-power-criterion); [Openness and pointwise detection of purity](#purity-openness).

<a id="relative-ampleness"></a>

#### Ampleness on the relative curve

In the setting of KL Hypothesis 8.7.1, take an integer a≥1 and q=p^a, a perfectoid adic Banach pair (A,A⁺) over Q_p with associated perfect uniform characteristic-p pair (R,R⁺), and a perfectoid space X/Q_p with its corresponding characteristic-p space X′. The pair and space comparisons are KL Theorems 3.6.5 and 8.3.5. For a bundle F on FF_X, define ampleness by testing every affinoid map f:Spa(A,A⁺)→X: under the comparison of Theorem 8.7.7, the pullback bundle on FF_R must yield an ample bundle on Proj(P_R). This is equivalent to positivity of all slopes at every point of X. In particular, on an affinoid base the Proj and analytic-curve notions agree. Ampleness descends under surjective maps of perfectoid bases and is local on the base. Its locus is open, including on the real quotient: an ample fibre over ℋ(x) extends over a partially proper open neighborhood of x.

**API.**

- `RelativeAmple`: A bundle on FF_X is ample if all perfectoid affinoid pullbacks are ample in the already owned Proj sense.
- `RelativeAmple.fibreCriterion`: Relative ampleness is equivalent to every geometric fibre slope being strictly positive.
- `RelativeAmple.pullback`: Perfectoid pullback preserves ampleness.
- `RelativeAmple.surjectiveDescent`: A bundle is ample iff its pullback along a surjective perfectoid map is ample.
- `RelativeAmple.openLocus`: The ample locus is a partially proper open subset on a base over an analytic field.

**Examples and checks.**

- `RelativeAmpleTest.affinoid`: On an affinoid perfectoid untilt, relative ampleness agrees with the Proj ampleness of VB2.
- `RelativeAmpleTest.untiltLine`: The untilt divisor line L_X is relatively ample; in KL normalization its slope is 1/a.
- `RelativeAmpleTest.unit`: The unit bundle is not relatively ample on a nonempty base.

**Sources:** [KL][KL], §8.8, Definition 8.8.17, pp. 185–186 (arXiv 1301.0792v5).

**Prerequisites:** `RelativeFarguesFontaine:RF1`; [Tensor global ampleness and rational-local ampleness](#tensor-global-ampleness); [Ampleness and positive fibre slopes](#ample-iff-pointwise).

<a id="untilt-positive-line"></a>

#### The positive line of an untilt

Under Hypothesis 8.7.1 (a ≥ 1 an integer, q = p^a; (A, A⁺) a perfectoid adic Banach algebra over ℚ_p and (R, R⁺) the perfect uniform adic Banach algebra over 𝔽_p corresponding to it by Theorem 3.6.5; X a perfectoid adic space over ℚ_p and X′ the perfect uniform adic space over 𝔽_p corresponding to it by Theorem 8.3.5) with X = Spa(A, A⁺), write z = [z̄] + p z_1. Let M be the φ^a-module over ℛ̃_R free on one generator v with φ^a(v) = z_1^{−1} z v; it is globally étale. The convergent product u = ∏_{n≥0} φ^{an}(1 + p^{−1} z_1^{−1}[z̄]) ∈ ℛ̃⁺_R satisfies φ^a(u) = p z_1 z^{−1} u in ℛ̃_R, so uv defines an inclusion ℛ̃_R → M(1) of φ^a-modules, and M(1) is the φ^a-module corresponding to L_X. Hence the φ^a-module corresponding to L_X is globally pure of slope 1/a, i.e. globally (1, a)-pure (with the φ^a-normalized slope rather than the printed unnormalized slope 1).

**Sources:** [KL][KL], §8.8, Lemma 8.8.19 and its proof, p. 186 (arXiv 1301.0792v5).

**Prerequisites:** `RelativeFarguesFontaine:RF2:untilts/closed-cartier-divisor-norm-estimate`; [Pure models and purity loci](#pure-models); [Ampleness on the relative curve](#relative-ampleness).

### The integral boundary and group torsors

Fix an affinoid characteristic-p perfectoid S=Spa(R,R⁺), a pseudouniformizer ϖ and r>0. Keep the characteristic-p boundary in Y_[0,r](S), and use the SW inverse-Frobenius pullback convention. The group theorem needs a smooth affine Z_p-model with connected fibres and the integral tensor-functor dictionary.

<a id="integral-boundary-realization"></a>

#### Integral boundary realization

For S∈Perf, finite free Z_p local systems on S_proét are equivalent to φ^{-1}-modules on Y_[0,r](S), including the characteristic-p boundary. Restriction to Y_(0,r] realizes the rationalized local system L[1/p], which has all Newton slopes zero. This distinguishes integral lattices at the boundary from a slope-zero bundle on the open curve.

Use an affinoid characteristic-p perfectoid base S=Spa(R,R⁺). Choose and fix a pseudouniformizer ϖ∈R for the construction of the SW space Y_[0,r](S). r>0; the integral period space and φ^{-1} pullback conventions are those of SW Lecture 22. Finite rank is locally constant; no boundary deletion in the integral comparison.

**Sources:** [SW][SW], Proposition 22.3.2, book p. 209.

**Prerequisites:** [Integral Frobenius and local-system comparison](#integral-frobenius-local-systems); [Slope-zero bundles and E-local systems](#slope-zero-local-systems); `RelativeFarguesFontaine:RF0:integral-Y`; `DiamondsAndVStacks:D3/locally-profinite-torsors`.

<a id="integral-group-torsors"></a>

#### Integral group torsors and Frobenius

For a smooth affine group scheme G/Z_p with connected fibres, pro-étale G(Z_p)-torsors on S are equivalent to φ^{-1}-G-torsors on Y_[0,r](S). For G=GL_n this is the integral local-system equivalence. Connectedness of fibres and the integral boundary are retained; extensions requiring a parahoric model are not inferred from this theorem.

Use an affinoid characteristic-p perfectoid base S=Spa(R,R⁺). Choose and fix a pseudouniformizer ϖ∈R for the construction of the SW space Y_[0,r](S). S perfectoid; r>0; smooth affine integral model with connected fibres.

For the reduction from G to GL_n, construct the exact tensor category Rep_{Z_p}(G) of algebraic representations on finite free Z_p-modules. Prove that G-torsors on a Z_p-scheme are equivalent to exact tensor functors from this category to vector bundles; for a smooth G over an analytic sousperfectoid Z_p-space, prove the corresponding étale equivalence. The reconstruction extends the functor to the coordinate Hopf algebra by filtered colimits and recovers the torsor from its faithfully flat algebra. Apply this to the integral local-system equivalence, then use connected fibres and Lang's lemma to identify the fibre functor pro-étale locally with the forgetful functor. These are ingredients of the integral torsor target, rather than consequences of the field-valued dictionary.

**Sources:** [SW][SW], Proposition 22.6.1, book p. 213; Theorems 19.5.1–19.5.2, book pp. 178–180.

**Prerequisites:** [Integral boundary realization](#integral-boundary-realization); `tauceti:TauCetiRoadmap/ReductiveGroups#layer-1-representations--comodules`; `tauceti:TauCetiRoadmap/ReductiveGroupsPartII:RG2.3.1` for smooth affine integral models and `RG2.3.7` for Lang's theorem; `RelativeFarguesFontaine:RF0:integral-Y`; `DiamondsAndVStacks:D3/locally-profinite-torsors`.

## Sources and pagination

All statements above are mathematical targets expressed in the conventions of this roadmap. Source references identify the result being used or the argument supporting it; a derived generalization still requires the additional prerequisites stated with the target. Page numbers refer to the editions below, not to a publisher version with different pagination.

- **FS** — Laurent Fargues; Peter Scholze, [Geometrization of the local Langlands correspondence](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf). Author-hosted 356-page PDF; printed page equals PDF page.
- **FF** — Laurent Fargues; Jean-Marc Fontaine; preface Pierre Colmez, [Courbes et fibrés vectoriels en théorie de Hodge p-adique](https://webusers.imj-prg.fr/~laurent.fargues/Courbe_fichier_principal.pdf). Author-hosted 404-page version of Astérisque 406 (2018). Main-text pagination restarts after the preface; citations use printed main-text pages.
- **KL** — Kiran S. Kedlaya; Ruochuan Liu, [Relative p-adic Hodge theory: Foundations](https://arxiv.org/pdf/1301.0792v5). arXiv:1301.0792v5, 210 PDF pages; locators use the printed preprint pagination.
- **CS** — Ana Caraiani; Peter Scholze, [On the generic part of the cohomology of compact unitary Shimura varieties](https://annals.math.princeton.edu/wp-content/uploads/annals-v186-n3-p01-p.pdf). Publisher PDF, Annals of Mathematics 186 (2017), pp. 649–766; citations use printed pages.
- **CN (arXiv)** — Pierre Colmez; Wiesława Nizioł, [On the cohomology of p-adic analytic spaces, II: the C_st-conjecture](https://arxiv.org/pdf/2108.12785v4). arXiv:2108.12785v4, 25 November 2024; used for the coherent-sheaf citation.
- **SW** — Peter Scholze; Jared Weinstein, [Berkeley Lectures on p-adic Geometry](https://people.mpim-bonn.mpg.de/scholze/Berkeley.pdf). Author-hosted 260-page PDF; PDF page = printed page + 10 (Theorem 13.5.7 printed p. 114 is PDF p. 124).
- **Ked** — Kiran S. Kedlaya, [Slope filtrations revisited](https://ems.press/content/serial-article-files/25974). Documenta Mathematica 10 (2005), 447–525; citations use journal pagination.
- **Lurie** — Jacob Lurie, [Lecture 26: Isocrystals](https://www.math.ias.edu/~lurie/205notes/Lecture26-Isocrystals.pdf). Three-page lecture note; statement source, not a full proof of Dieudonné–Manin.
- **GLX** — Ian Gleason; Dong Gyu Lim; Yujie Xu, [The connected components of affine Deligne–Lusztig varieties](https://arxiv.org/pdf/2208.07195v3). arXiv:2208.07195v3, 10 November 2025, 56 pages.
- **CN (author copy)** — Colmez and Nizioł, [On the cohomology of p-adic analytic spaces, II: the C_st-conjecture](https://webusers.imj-prg.fr/~wieslawa.niziol/CN5.pdf). Public author preprint CN5.pdf; used for the sympathetic-algebra and curvature targets. These locators refer to this author copy.
- **CDN** — Colmez, Dospinescu and Nizioł, [Cohomologie p-adique de la tour de Drinfeld: le cas de la dimension 1](https://webusers.imj-prg.fr/~wieslawa.niziol/GPW5.pdf). Author preprint GPW5.pdf; its pagination differs from the published paper.
- **SW13** — Scholze and Weinstein, [Moduli of p-divisible groups](https://arxiv.org/pdf/1211.6357v2). arXiv:1211.6357v2; Theorem A is used only with its full-faithfulness hypotheses.

[FF]: https://webusers.imj-prg.fr/~laurent.fargues/Courbe_fichier_principal.pdf
[Ked]: https://ems.press/content/serial-article-files/25974
[Lurie]: https://www.math.ias.edu/~lurie/205notes/Lecture26-Isocrystals.pdf
[GLX]: https://arxiv.org/pdf/2208.07195v3
[SW]: https://people.mpim-bonn.mpg.de/scholze/Berkeley.pdf
[FS]: https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf
[CS]: https://annals.math.princeton.edu/wp-content/uploads/annals-v186-n3-p01-p.pdf
[KL]: https://arxiv.org/pdf/1301.0792v5
[CN-arXiv]: https://arxiv.org/pdf/2108.12785v4
[SW13]: https://arxiv.org/pdf/1211.6357v2
[CN-author]: https://webusers.imj-prg.fr/~wieslawa.niziol/CN5.pdf
[CDN]: https://webusers.imj-prg.fr/~wieslawa.niziol/GPW5.pdf
