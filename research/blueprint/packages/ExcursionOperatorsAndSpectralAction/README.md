# Roadmap: excursion operators and the spectral action

**Summary.** This roadmap builds the spectral side of the geometrization of the local Langlands correspondence of Fargues–Scholze on the lisse category `D_lis(Bun_G, Λ)` of the stack of `G`-bundles on the Fargues–Fontaine curve. From the coherent family of Hecke operators it constructs the enhanced Bernstein centre, the excursion operators and their algebra action, the finite-ramification theorem and the decomposition of compact objects by connected components of the stack of L-parameters, and the map from functions on that stack to the centre (Fargues–Scholze, §§IX.1–IX.5). It proves the two universal theorems of Fargues–Scholze, Chapter X: over a field of characteristic zero, and integrally when `ℓ` does not divide the order of the torsion of `π₁(Ĝ)`, coherent Hecke data on a stable category are the same as a compactly supported action of perfect complexes on the stack of L-parameters (Theorems X.0.1 and X.1.1, Proposition X.3.1). It attaches to every Schur-irreducible object, and to every irreducible smooth representation of every `G_b(E)`, a continuous semisimple L-parameter for every coefficient field of characteristic different from `p` (Definition/Proposition IX.4.1), and proves the expected properties of this assignment: compatibility with isogenies, products, Weil restriction, tori, central characters, twisting, duality and parabolic induction (§§IX.6–IX.7). It ends with the agreement of the assignment with the classical local Langlands correspondence for `GL_n` over every nonarchimedean local field (Theorem IX.7.4), whose equal-characteristic half rests on the Laumon–Rapoport–Stuhler construction through `D`-elliptic sheaves and on Hausberger's uniformization. We want it because the semisimple parameter of Fargues–Scholze, its Bernstein-centre form and the spectral action are the coefficients that the integral and modular local Langlands programme, the stability results of the continuation `ExcursionOperatorsAndSpectralActionPartII`, and the torsion-vanishing and local–global compatibility roadmaps consume, and because the categorical constructions (centres of stable categories, excursion actions, central support, universal actions of mapping stacks) are needed nowhere else in this form.

The roadmap has fifteen layers. **ES0** defines the enhanced centre of a stable category and the excursion operators on `Bun_G`, and **ES0:classical-center** compares the centre with the Bernstein centre of smooth representations. **ES1:finite-ramification** proves the finite-ramification theorem, constructs the excursion action on each finite-wild piece and decomposes compact objects by components; **ES1:spectral-center** builds the spectral centre map under the centre-order condition. **ES2** and **ES3** prove the rational and integral universal action theorems and construct the spectral actions on `Bun_G`. **ES5** constructs the semisimple parameters. **ES6:functoriality** proves their functoriality. **ES7:parabolic** computes the centre maps from Newton strata and the compatibility with parabolic induction. **ES4** develops central support, localization, duality of the centre and the elliptic components, and **ES6:duality** proves the compatibility of parameters with duals. **ES7:GLn-comparison**, **ES7:function-field-automorphic** and **ES7:equal-characteristic** supply the two realizations of `GL_n` supercuspidals by tower cohomology and the trace argument, and **ES7** concludes classical agreement over every local field.

## Scope and ownership

This roadmap owns: the enhanced centre `π₀ End(id)` of a `Λ`-linear stable ∞-category and its map to the centre of the homotopy category; the excursion operators of the Hecke family of `Bun_G` and the action of the excursion algebra on the enhanced centre of each finite-wild compact Hecke category; the finite-wild Hecke subcategories, the finite-ramification theorem for compact lisse objects (Proposition IX.5.1), the decomposition of compact objects by connected components of the parameter stack, and the comparisons between discretizations and between finite-wild pieces; the spectral, geometric and Hecke-compatible centres and the spectral centre map (Theorem IX.5.2) with its compatibilities and its excursion-only variant; the comparison with the Bernstein centre of smooth representations and its characteristic-zero block form; compactly supported actions, the Hecke family attached to the universal parameter, the rational universal action theorem and its colimit inputs, the rational and integral spectral actions on `Bun_G`, the integral universal action on the sifted approximation, its free-group and discrete-group computations, their compatibilities and coefficient changes, and the Whittaker sheaf; reduced central support, its behaviour under exact operations and coefficient change, central localization, duality of the centre, excursions on local shtuka cohomology, elliptic parameters, their components and the basic decomposition of an elliptic component; Schur irreducibility in condensed algebras, the scalar excursion character, the continuous semisimple parameter of a Schur sheaf and of an irreducible smooth representation of `G_b(E)`, its independence of the stratum extension, isomorphism invariance and coefficient transport; the functoriality of centres and parameters (maps inducing isomorphisms of adjoint groups, products, Weil restriction, tori, central characters, twisting, z-embeddings and central pushouts) and their compatibility with Bernstein–Zelevinsky and smooth duals; the stratum maps `Ψ_G^b`, the twisted Levi inclusion, their factorization and the compatibility with unnormalized and normalized parabolic induction; and the classical agreement theorem for `GL_n` in both characteristics with the equal-characteristic tower realization it requires (maximal-order data, the compact division-algebra quotient and its trace formula, Euler–Poincaré functions, local selectors, the selected globalization and inner-form transfer, `D`-elliptic sheaves, their level moduli and Hecke correspondences, special formal `O_D`-modules, uniformization, the fundamental local representation, the corrected Kaiser chain lemma, the selected middle cohomology, the independent equal-characteristic correspondence, the Hochschild–Serre degeneration and the Drinfeld–Carayol realization).

It leaves to other roadmaps:

- **LanglandsParameterStacks.** LP0 owns crossed cocycles, condensed L-parameters with relatively discrete coefficients, finite wild ramification and discrete Weil models with their unique continuous extension (LP0.1–LP0.4). LP1 owns the parameter stacks, their clopen finite-wild pieces, Weil cohomology with its Euler characteristic, local Tate duality and the cotangent complex (LP1.1–LP1.10). LP2e owns coarse quotients, the finite free-group index, the excursion algebra `Exc(Γ, Ĝ)` of a discrete group over `Q` with its universal relations and its torsion-free continuous characters, categorical Hecke data, abstract excursion data and matrix coefficients, and the abstract centre map `Exc(Γ, Ĝ) → π₀ End(id_C)` of an arbitrary categorical Hecke datum (LP2e.7–LP2e.15). LP2c owns semisimple parameters, reconstruction from pseudocharacters with prescribed projection, continuity, and the parameter of an object with scalar endomorphisms for an abstract discrete-group datum (Corollary VIII.4.3; LP2c.5, LP2c.8). LP2i owns the integral invariant comparison at good primes (LP2i.1–LP2i.3). LP3 owns good filtrations and the sifted mapping approximations, including the integral approximation `F♮` that ES3 uses (LP3.18). LP4 owns the universal representation bundles, perfect generation and the module comparison (LP4.1–LP4.3). Here those constructions are specialized to the Hecke family of `Bun_G` and to the enhanced centre; the abstract statements are cited, never restated.
- **HeckeStacksAndLocalShtukas.** HS0–HS3 own the Hecke stacks, the Hecke action on lisse sheaves with its condensed enrichment and Weil descent (HS1.8, HS1.9), local shtuka towers and their cohomology (HS2, HS3); HS4 owns the coherent finite-set Hecke family, creation and annihilation, and the Hecke diagrams for adjoint-isomorphism maps, products, Weil restriction and Levi constant terms (HS4.1–HS4.7). Their spectral consequences are here.
- **VStackSheavesAndLisseCategories.** VS3 owns the lisse categories and their coefficient comparisons; VS4 owns the classifying-stack description of Newton strata, the left adjoint `π_{b♮} q_b^*` of stratum restriction and compact generation of `D_lis(Bun_G, Λ)` (VS4.2–VS4.4); VS5 owns Bernstein–Zelevinsky duality and the Künneth formula on `Bun_G` (VS5.1–VS5.3).
- **GeometricSatakeAndFusion, GS4.** The pinned dual group, the normalized integral Satake equivalence and its naturality for adjoint-isomorphism maps, products, Levi subgroups and Weil restriction, and the Chevalley involution with its inner sign (*Group maps, products, restriction of scalars and inversion*; *Levi naturality and normalization*).
- **BunGAndNewtonStrata.** The stack `Bun_G`, the Kottwitz set, pure inner twisting, `σ`-centralizers, basic classes and the abelianized classes (Layers 0–4; §0.7, §1.13, §1.19, §1.36, §1.40, §1.44).
- **SmoothRepresentationsOfLocalGroups.** The smooth category over any ring and its centre (SR.0.4 *smooth-centre*), the `Λ`-linear Bernstein centre through Hecke corners and its `ℓ`-adic separatedness (SR.1.3 *bernstein-centre-corners*, *l-adic-separatedness*), the derived smooth category and its dg enhancement (SR.0:derived-extension), smooth and compact induction, Jacquet functors, normalized parabolic induction, contragredients and Whittaker functionals (SR.2), and the complex Bernstein decomposition and centre (SR.3). The Λ-linear Bernstein centre is defined there; here it receives maps.
- **EnhancedDerivedSheaves, E5.** Stable monoidal ∞-categories, monadicity, Ind-completion and its universal property, presentable tensor products and module base change, Verdier quotients, sifted colimits and animation (E5:abstract, E5:presentability, E5:animation).
- **ReductiveGroupsPartII.** Locally profinite rational points and congruence subgroups (RG2.0), `π₁`, z-extensions and the Kottwitz homomorphism (RG2.1.5), buildings (RG2.2), parahoric subgroups (RG2.3), and the pinned dual and L-group with its standard Levi subgroups (RG2.5).
- **EndoscopicTransferAndUnitaryTraceComparison, ET.6 and ET.6a.** The classical local Langlands and Jacquet–Langlands correspondences for `GL_n` over a `p`-adic field and the cohomology of the Lubin–Tate and Drinfeld towers with its comparison to Hecke fibres. They are imported for the characteristic-zero half of ES7.
- **ArithmeticGaloisRepresentations, FunctionFieldArithmetic and the cohomological suppliers.** Brauer–Nesbitt for traces (R01.1), Weil–Deligne representations and Frobenius semisimplification (R01.2) and the recognition of lisse sheaves on curves (R01.5); function-field completions, adeles and full equal-characteristic local reciprocity (FA.2, FA.4), automorphic representations of function fields (FA.6); étale duality and Lefschetz–Verdier traces (EtaleDualityAndPerverseSheaves EDC.2, EDC.8); weights (DeligneWeightsAndPurity DWP.5, DWP.7); Huber's compact support (ClassicalAdicEtaleCohomology H3); moduli of sheaves (AlgebraicModuliForArithmeticGeometry R09); elliptic sheaves (DrinfeldModulesAndTModules DM.7); spectral decomposition on compact quotients (AutomorphicSpectralTheory AS.0); adelic groups and Haar measures (AdelicAlgebraicGroups AA.0, AA.1). Real Euler–Poincaré functions and pseudo-coefficients are AutomorphicSpectralTheory AS.6.18–AS.6.19; the Euler–Poincaré function on the building of `GL_d` over an equal-characteristic local field is built here.
- **Tau Ceti.** The local Weil group, its topology, its inertia sequence and the arithmetic Artin map are TauCetiRoadmap ClassFieldTheory, Layer 9, whose reciprocity isomorphism `Kˣ ≃ W_K^ab` is stated for finite extensions of `ℚ_p`; its equal-characteristic counterpart is FunctionFieldArithmetic FA.4. Wild inertia and the tame quotient are TauCetiRoadmap LocalFieldsRamification, Layer 4.

The roadmap does not prove the categorical local Langlands conjecture (Fargues–Scholze, Conjectures X.1.4 and X.3.5), the description of elliptic packets (Conjecture X.2.2), injectivity or the stable image of the Bernstein-centre map (Fargues–Scholze, §I.9), the nilpotent monodromy part of any correspondence, or any full integral or modular Weil–Deligne correspondence. Stability of the centre map and its applications are `ExcursionOperatorsAndSpectralActionPartII`. Global excursion operators for function fields are `GlobalShtukasAndFunctionFieldLanglands`, GS.5.

## Conventions

Let `E` be a nonarchimedean local field of either characteristic, with residue field of cardinality `q = p^f`, and fix a prime `ℓ ≠ p` and a square root `√q`. Coefficient rings `Λ` are `ℤ_ℓ[√q]`-algebras, so `p` is a unit in `Λ`; the integral action of ES3 takes `Λ` to be the ring of integers of a finite extension of `ℚ_ℓ(√q)`. Half Tate twists and the normalized Satake equivalence use the chosen `√q`; for an extension `E′/E` of residue degree `f′` the square root is `(√q)^{f′}`.

`G` is a connected reductive group over `E`, and `Ĝ` is its pinned split dual group over `ℤ_ℓ`. The Weil group `W_E` acts on `Ĝ` by pinned automorphisms through a finite quotient `W_E → Q`; L-parameters are sections into `Ĝ ⋊ Q` lifting this map, and their first coordinates are crossed cocycles, `c(γδ) = c(γ) · γ(c(δ))`, with conjugation `(h · c)(γ) = h c(γ) γ(h)⁻¹`. Nonsplit statements use this twisted conjugation throughout; for a split group it is ordinary conjugation. `Z¹(W_E, Ĝ)_Λ` is the scheme of cocycles with relatively discrete condensed coefficients (LP0.2), a union of open and closed affine pieces `Z¹(W_E/P, Ĝ)_Λ` over subgroups `P` open in wild inertia and normal in `W_E` (LP1.2); the parameter stack is `[Z¹(W_E, Ĝ)_Λ/Ĝ]`. A dense discrete subgroup `W ⊂ W_E/P` generated by a Frobenius and a tame generator is a discretization.

Frobenius is geometric. The degree `deg : W_E → ℤ` sends a geometric Frobenius to `1`. Geometric reciprocity is `rec_geom(x) = Art(x⁻¹)` for the arithmetic Artin map `Art` of ClassFieldTheory Layer 9, so it sends a uniformizer to a geometric Frobenius. Witness: an unramified character `χ` of `Eˣ` with `χ(ϖ) = a` has parameter sending geometric Frobenius to `a`; with the arithmetic convention the value would be `a⁻¹`.

`D = D_lis(Bun_G, Λ)` and `D^ω` is its subcategory of compact objects. Categories, functor categories and mapping objects are enhanced (stable ∞-categories in the sense of EnhancedDerivedSheaves E5) unless they are called ordinary; `hC` is the homotopy category of `C`. Mapping objects out of compact objects carry the relatively discrete condensed enrichment of HS1.8. For a finite set `I` and `V ∈ Rep_Λ((Ĝ ⋊ Q)^I)`, `T_V` is the normalized Hecke operator of HS1 and HS4, with values in `W_E^I`-equivariant objects. The objects `G_b`, `i_b : Bun_G^b → Bun_G`, the open stratum `j = i_1` and the stratum extension `L_b = π_{b♮} q_b^*` (left adjoint to `i_b^*`, Fargues–Scholze, Proposition VII.7.2) are those of BunGAndNewtonStrata and VS4; `♮` is relative homology, not an ordinary pushforward.

Centres. `Z_enh(C) = π₀ End(id_C)` is the enhanced centre of a stable category (ES0.1); `CatCenter(hC)` is Mathlib's centre of its homotopy category. `Z_geom(G, Λ) = Z_enh(D)`; `Z_spec(G, Λ) = Γ([Z¹(W_E, Ĝ)_Λ/Ĝ], O)`; `Z(G(E), Λ)` is the centre of the category of smooth `Λ[G(E)]`-modules (SR.0.4). `Exc(W, Ĝ)` is the excursion algebra of LP2e.9.

Two coefficient conditions occur and are kept apart.

- **The centre-order condition**: `|π₀Z(G)|` is invertible in `Λ` (Fargues–Scholze, Theorem IX.5.2, p. 329). It is needed for maps out of `Z_spec`; without it the excursion algebra is used instead.
- **The good-prime condition**: `ℓ ∤ |π₁(Ĝ)_tors|` (Theorems VIII.5.1, p. 293, and X.0.1, p. 339). It is needed for the integral spectral action and for the integral invariant comparison of LP2i.

Since `π₁(Ĝ)` is the character group of `Z(G)`, the two numbers differ only by powers of `p`, so for a `ℤ_ℓ[√q]`-algebra in which `ℓ` is not invertible the two conditions are equivalent; over a `ℚ_ℓ`-algebra the first is automatic and the second is not needed. They remain hypotheses of different theorems. Witness: for `G = SL₂` and `ℓ = 2`, `π₀Z(G) = μ₂` and `π₁(PGL₂) = ℤ/2`, so over `ℤ₂[√q]` both fail, while over `ℚ₂(√q)` the spectral centre map and the rational action exist.

| Construction | Coefficients |
| --- | --- |
| Excursion operators, finite ramification, component idempotents, semisimple parameters | any `ℤ_ℓ[√q]`-algebra; algebraically closed fields of characteristic `≠ p` for parameters |
| Spectral centre map `Z_spec → Z_geom` | additionally the centre-order condition |
| Rational spectral action | any field over `ℚ_ℓ(√q)`, every `ℓ ≠ p` |
| Integral universal action on the approximation `F♮` | a DVR, no condition on `ℓ` |
| Integral spectral action on `Perf([Z¹/Ĝ])` | ring of integers of a finite extension of `ℚ_ℓ(√q)` and the good-prime condition |

Semisimple parameters follow LP2e.5: a parameter into `Ĝ(L) ⋊ Q` is semisimple when every parabolic of the L-group containing its image has a Levi subgroup containing it; this is not elementwise semisimplicity, and uniqueness is up to `Ĝ(L)`-conjugacy. Continuity of a parameter means a map of condensed sets into the relatively discrete coefficient object (LP0.2).

Induction. `Ind_P^G` is unnormalized smooth induction; normalized induction is `i_P^G τ = Ind_P^G(δ_P^{1/2} τ)` with `δ_P(m) = |det(Ad(m)|Lie U_P)|_E`. For a Levi `M` with dual `M̂ ⊂ Ĝ`, the twisted Levi inclusion sends a cocycle `φ` to `w ↦ t^{deg w} j(φ(w))` with `t = (2ρ_Ĝ − 2ρ_M̂)(√q)`. Witness: for the upper Borel of `GL₂`, `t = diag(√q, 1/√q)`, so the unnormalized principal series of the trivial character has parameter sending geometric Frobenius to `diag(√q, 1/√q)`, while the normalized principal series `i_B^G(1)` has parameter `1 ⊕ 1`.

Slopes. The bundle `E_b` of a basic class follows BunGAndNewtonStrata: for `GL_n` the class with `E_b = O(−1/n)` has `G_b = D^×` for the division algebra `D` of invariant `1/n`.

## Exact supplier contracts

Each target names its prerequisites. The interfaces below distinguish statements in the named supplier layers from additional statements needed at the boundaries. An additional interface is an unsupplied prerequisite until a named supplier target provides it; writing its contract does not supply its proof or establish the dependency order.

**Unresolved prerequisites.** SR.0.4 defines admissibility but SR.3a and SR.3 give complex representation theory, whereas ES5.5–ES5.6 require every algebraically closed coefficient field of characteristic different from `p`. LP3.0 gives highest-weight theory over a field, whereas ES3.2–ES3.3 require integral stable generation. WC.2 supplies a smooth proper constant-coefficient equation, whereas ES7:equal-characteristic.17 needs constructible coefficients and local constants. The named extensions below specify these missing inputs and their ownership; they are requested interfaces, not supplied theorems. The additional contracts and their delivery order also remain prerequisites. ES7:equal-characteristic.22 separately distinguishes the explicit two-tower comparison from the remaining equivariant Hecke-fibre comparison.

### From Mathlib

- `CategoryTheory.CatCenter`, `CatCenter.app`, `CatCenter.naturality`, `CatCenter.mul_app`, `Linear.toCatCenter` and `CatCenter.localizationRingHom`: the ordinary centre of a category, its evaluation, its scalars and its transport along a localization; ordinary centres are always this carrier.
- `CategoryTheory.Functor.FullyFaithful`, `CategoryTheory.Adjunction`, `CategoryTheory.Pretriangulated`, `Pretriangulated.Triangle.yoneda_exact₂`, `shiftFunctor`, `Limits.biprod`: the homotopy-category shadow of the stable operations.
- `Condensed`, `AlgCat`, `CategoryTheory.IsIso`: condensed algebras and invertibility of a scalar unit.
- `PrimeSpectrum.zeroLocus`, `zeroLocus_mul`, `zeroLocus_inf`, `zeroLocus_radical`, `zeroLocus_span`, `zeroLocus_subset_zeroLocus_iff`, `PrimeSpectrum.comap`, `preimage_comap_zeroLocus`, `Ideal.map`, `RingHom.ker`, `Module.Flat`, `Module.Flat.lTensor_exact`, `LinearMap.toSpanSingleton`, `DualNumber`, `TrivSqZeroExt.fstHom`: the commutative algebra of reduced support.
- `Representation`, `Representation.dual`, `Representation.leftRegular`, `Representation.IntertwiningMap`, `Representation.ind`, `coevaluation`, `contractRight`, `LinearMap.trace`, `MonoidAlgebra` with `mapDomainRingHom` and `mapRingHom`: representations, two-leg contractions and regular modules.
- `IsFreeGroup`, `subgroupIsFreeOfIsFree`, `Subgroup.fg_of_index_ne_zero`, `IsAlgClosed.exists_pow_nat_eq`, `AddCommGrpCat.injective_of_divisible`, `CategoryTheory.Injective.factorThru`: free subgroups of finite index and extension of characters into a divisible group.
- `MeasureTheory.Measure.haar`, `MeasureTheory.Measure.modularCharacter`, `Algebra.IsCentral`, `Submodule.IsLattice`, `Module.Invertible`, `CategoryTheory.Abelian.Ext`: Haar measures, central algebras, lattices, invertible modules and Ext.

### From Tau Ceti

- `TauCeti.IsSmoothDiscrete` and `TauCeti.SmoothDiscreteTopRep` (module `TauCeti.RepresentationTheory.Homological.ContCohomology.SmoothDiscrete`): smooth representations as discrete continuous representations.
- `TauCeti.Cocharacter.parabolic` and `TauCeti.Cocharacter.levi` (module `TauCeti.Algebra.AlgebraicGroup.Dynamic.Parabolic`): the dynamic parabolic and Levi of a cocharacter, used for the increasingly unstable sequence and parabolic induction.
- `TauCeti.ClassFieldTheory.Formation` (module `TauCeti.NumberTheory.ClassFieldTheory.Formation.Basic`): class formations, the carrier behind reciprocity for tori.
- TauCetiRoadmap ClassFieldTheory, Layer 9: the local Weil group `W_K`, its Weil topology, the inertia sequence, finite-extension transfer, and in mixed characteristic `Kˣ ≃ W_K^ab` onto the topological abelianization. TauCetiRoadmap LocalFieldsRamification, Layer 4: wild inertia, its cofinal open normal subgroups and the tame quotient.

### From LanglandsParameterStacks

Consumed as stated: LP0.1–LP0.4, LP1.2, LP1.3, LP1.7, LP1.9, LP1.10, LP2e.5–LP2e.15, LP2c.3–LP2c.5, LP2c.8, LP2i.1–LP2i.3, LP3.18, LP4.1–LP4.3. LP2c.3–LP2c.5 include reconstruction and continuity in positive coefficient characteristic; no characteristic-zero Reynolds argument is substituted for that case. In addition:

| Interface | Used by |
| --- | --- |
| LP0: `finite_wild_tensor_refinement`, refining a cutoff for a tensor generator to all legs of one coherent Hecke family; the geometric compactness input remains ES1:finite-ramification.2 | ES1:finite-ramification.2 |
| LP0: `central_torus_lift_ratio`, for a Weil-equivariant quotient `1 → Ĉ → Ĝ⁺ → Ĝ → 1` and algebraically closed `L` of characteristic different from `p`: lift a conjugating element along the surjection on `L`-points, align the projected parameters, and express the ratio of two existing continuous lifts as a continuous crossed cocycle in `Ĉ`, compatibly with torus reciprocity; this asserts no existence of a lift of an arbitrary parameter | ES6:functoriality.11 |
| LP1: `finite_wild_perf_coefficients`, the derived scalar-extension equivalence on each finite-wild parameter quotient for a DVR `Λ` satisfying the good-prime hypothesis and `B` a finite extension DVR, `Λ/ℓ`, or `Λ[1/ℓ]`; quotient formation is derived and the comparison is compatible with LP4.2's representation generators | ES3.9, ES4.3 |
| LP3: `integral_highest_weight_ext`, `perf_classifying_stable_envelope_DVR` and `perf_classifying_highest_weight_filtration_DVR`, stated below; `pro_reductive_representation_generation` over a characteristic-zero field, using finite-dimensional representations that factor through a reductive quotient and exact invariants | ES2.3, ES2.4, ES3.2–ES3.4 |
| LP4: `affine_quotient_ind_modules_char_zero`: for affine `X` with an action of a pro-reductive group `G` over a characteristic-zero field, `Ind Perf([X/G]) ≃ O(X)-Mod(Ind Perf(BG))`, naturally in equivariant affine maps, using representation bundles as compact generators; this is the affine-quotient form of LP4.3 | ES2.3 |

For `finite_wild_perf_coefficients`, prove the comparison first on the representation-generated module presentation, using derived base change of the cocycle algebra and the integral tensor identities below, and then establish generation of the whole perfect category in the stated coefficient range. LP4.2's DVR and algebraically closed residue-field cases do not alone supply every case: descent and generation over the nonreduced ring `Λ/ℓ` for ramified `Λ` must be justified. The abstract invariant-ring comparison of LP2i.2 alone is insufficient. The source for these categorical comparisons is Fargues–Scholze, X.1, pp. 340–343, and X.3, pp. 348–350; the tensor-generator argument belongs to IX.1, pp. 320–321, and the central lift ratio to IX.6, pp. 332–333, using the elementary crossed-cocycle calculation.

**Checks.**

- For a trivial group, scalar extension is `Perf(Λ) ⊗_Λ B ≃ Perf(B)`; a two-term complex `[Λ —ℓ→ Λ]` must be changed by derived tensor product.
- For ramification index greater than one, `Λ/ℓ` has nilpotents. Replacing it by its residue field changes both the coefficient ring and this comparison. An excluded good-prime case is not certified by the integral representation-generation argument.
- For two aligned lifts `c,c′`, `a_w = c′_w c_w⁻¹` satisfies `a_{uv} = a_u · u(a_v)` because the kernel is central. For a nontrivial Weil action on the torus this need not be an ordinary homomorphism; neither lift is manufactured by this calculation.
- For `G = 1`, the affine-quotient identity is `QCoh(X) ≃ O(X)-Mod`. For a pro-reductive `G`, each finite representation factors through a reductive quotient; the claim does not replace a pro-group by one fixed finite quotient for every representation.
- A cutoff must control the tensor generator and its dual, be normal in the full Weil group, and survive finite intersections. An arbitrary collection of independently chosen cutoffs does not itself give one coherent quotient.

### From HeckeStacksAndLocalShtukas

Consumed as stated: HS0.2, HS0.6, HS1.2, HS1.5, HS1.7–HS1.10, HS2.2, HS3.4, HS3.6–HS3.8, HS3.10 `heckeBetweenStrata` (basic-source comparison and Hom adjunction), HS4.1–HS4.6. The additional HS1 requests are `pro_p_equivariant_inflation`: enhanced full faithfulness of pullback from `(W_E/P)^I`-equivariant objects to `W_E^I`-equivariant objects for `P` open in wild inertia and normal in `W_E`, over every `ℤ_ℓ[√q]`-algebra, using continuous pro-`p` averaging; `normalized_hecke_kernel_coefficients`: comparison of normalized kernels, creation, annihilation and Weil descent for every derived coefficient map preserving `√q`; and `admissible_condensed_hom`: over an algebraically closed field `L` of characteristic different from `p`, the condensed mapping-object comparison for admissible smooth representations from their finite-dimensional pro-`p` fixed vectors, preserving the scalar unit without compactness (ES1:finite-ramification.1–.2, ES1:spectral-center.2, ES3.8–ES3.9, ES5.5; Fargues–Scholze, IX.1, pp. 320–321, IX.2, pp. 321–324, and IX.5, pp. 327–328). Abstract group cohomology with a discretized pro-`p` group does not supply the continuous averaging argument.

**Checks.**

- For a finite `p`-quotient of order `p^a`, the averaging idempotent is `p^(−a) Σ_g g`. Its square is itself because `p` is invertible, including over `F̄₂` when `p ≠ 2`; coefficient characteristic `p` is outside the contract.
- Reduction with torsion in a kernel uses derived tensor product. The two composites defining creation followed by annihilation must commute with the comparison, rather than merely the underlying sheaves.
- A scalar character has a unit-preserving condensed endomorphism comparison. Two copies have matrix endomorphisms and fail the Schur conclusion. Finite-dimensional fixed vectors are used even when the representation is not compact as a derived object.

### From VStackSheavesAndLisseCategories

Consumed as stated: VS1, VS3.2, VS3.3, VS4.2–VS4.4, VS5.1–VS5.3. The additional requests are `lisse_category_coefficients` in VS3: `D_lis(Bun_G,Λ) ⊗_Λ B ≃ D_lis(Bun_G,B)` for a coefficient DVR `Λ` and `B` a finite extension DVR, `Λ/ℓ`, or `Λ[1/ℓ]`, with compact generators carried to their coefficient changes and the derived comparisons on their mapping objects (ES3.9); `condensed_stratum_adjunction` in VS4: the existing fully faithful left adjoint `L_b` and its invertible unit identify condensed mapping objects and scalar units for all smooth representations, including noncompact ones; a right extension is used only on a domain where it preserves lisse objects and restriction gives its retraction (ES5.4–ES5.6); and `condensed_BZ_center` in VS5: the enhanced anti-equivalence on the stated Bernstein–Zelevinsky duality domain induces the involution on central transformations, with the condensed scalar-endomorphism comparison whenever both an object and its dual are Schur (ES4.5, ES6:duality). The last request does not extend biduality from the actual duality domain to all noncompact objects (Fargues–Scholze, VII.6–VII.7, pp. 268–276, IX.4–IX.5, pp. 327–330).

**Checks.**

- On the trivial-group component, coefficient change is the scalar-extension identity for modules, including derived reduction of `[Λ —ℓ→ Λ]`.
- The adjunction unit identifies endomorphisms of a scalar character with endomorphisms of its left extension and preserves `1`; full faithfulness on ordinary global Hom alone does not prove the condensed assertion.
- A noncompact irreducible admissible representation is allowed in the stratum comparison. It is not thereby asserted to be in the biduality domain. For a torus character, actual duality takes the character to its inverse; for `ξ ≠ ξ⁻¹` this is a nontrivial test of the centre involution.

### From GeometricSatakeAndFusion

GS4:integral-dual-group: the pinned dual group with its semidirect action and normalized representation categories (*Canonical pinned dual identification*, *Normalized integral Satake equivalence*), naturality for adjoint-isomorphism maps, products, Weil restriction and Levi subgroups (*Group maps, products, restriction of scalars and inversion*; *Levi naturality and normalization*), and the Chevalley involution: the switch of Satake factors acts as `Ad(ρ̂(−1)) ∘ θ` (*Chevalley involution with its inner sign*).

### From EnhancedDerivedSheaves

E5:abstract.4–.5 (stable monoidal categories, Barr–Beck–Lurie), E5:presentability.1–.3 (Ind-completion and its universal property, presentable tensor products and module base change, Verdier quotients) and E5:animation.1 (sifted colimits and animation). The additional requests are `enhanced_endofunctor_center`: the enhanced exact endofunctor category with the `E₂` endomorphisms of its unit and commutative `π₀`, and the anima of coherent finite-set actions (ES0.1, ES2–ES3); `animated_module_colimits`: compact module categories for the sifted diagram of animated coordinate algebras in `Ind Perf(BĤ)` of Fargues–Scholze Proposition X.3.4, pp. 349–350 (ES3.5); `central_telescope_mappings`: for compact `A`, mappings from `A` into central localization are the telescope of the mappings under multiplication by the central function (ES4.4); and `compact_endomorphism_base_change`: for a compactly generated presentable `R`-linear stable category `C`, compact `A ∈ C`, and `R → B`, the comparison `RHom_{C ⊗_R B}(A_B,A_B) ≃ RHom_C(A,A) ⊗_R^L B`, preserving identities, and its degree-zero specialization when `B` is flat over `R` (ES4.3). The compactness and flatness assumptions are retained separately: neither follows from compatibility of central actions alone (Fargues–Scholze, IX.5, pp. 328–329, X.1, pp. 340–343, X.3, pp. 348–350).

**Checks.**

- In `Perf(R)`, the derived endomorphisms of the unit are `R`, whose scalar extension is `B`. For a nonflat map, a derived comparison does not imply an underived formula for degree-zero endomorphisms.
- On the unit of `Perf(R)`, localization at `f` is the colimit of `R —f→ R —f→ …`. For `f = 1` it is `R`; for `f = 0` it is zero. Thus vanishing after localization corresponds to support in `V(f)`, not its complement.
- The zero category has zero centre; `Perf(R) × Perf(R)` has two independent central scalars. Endomorphisms of one selected object do not define the whole centre.
- For a constant animated-algebra diagram the compact module category is unchanged. A group relation must be imposed by the animated colimit rather than by replacing it with the ordinary quotient of coordinate rings (ES3.5).

### From SmoothRepresentationsOfLocalGroups

SR.0.2, SR.0.4 *smooth-centre* and *coefficient-change*, SR.1.3 *bernstein-centre-corners* and *l-adic-separatedness*, SR.0:derived-extension.1–.2, SR.2.1 *smooth-induction*, *compact-induction* and *frobenius-reciprocity*, SR.2.2 *modulus-character*, *parabolic-induction* and *induced-contragredient*, SR.2.3 *whittaker-functionals*, SR.3.1–SR.3.2. In addition, for every algebraically closed field `L` of characteristic different from `p` and every connected reductive `G` over every nonarchimedean `E`: irreducible smooth `L`-representations are admissible with scalar endomorphism ring; finitely generated admissible representations have finite length; and for a closed normal subgroup `H ⊂ G(E)` with compact quotient, smooth induction from `H` is right adjoint to restriction, preserves admissibility, and every irreducible admissible `τ` of `H` is a quotient of the restriction of an irreducible admissible representation of `G(E)` (Vignéras 2023, §§4–5, pp. 337–340; Henniart–Vignéras 2025, §2.2.4(2), p. 236). The complex statements of SR.3a do not supply these (ES5.5, ES5.6, ES6:functoriality.11, ES6:duality.2).

The required coefficient-general continuation has the following targets. They extend the existing SR theory; the unitary and Fell-topology scope of SmoothRepresentationsOfLocalGroupsPartII does not supply them.

- `irreducible_smooth_admissible_ne_p`: for every connected reductive `G/E` and algebraically closed `L` with `char L ≠ p`, every irreducible smooth `L`-representation is admissible. `admissible_irreducible_scalar_end` then identifies its endomorphism algebra with `L`, by evaluating on a nonzero finite-dimensional space of pro-`p` fixed vectors and using an eigenvector, without an uncountability assumption (Vignéras, §4, pp. 337–338). ES5.5 supplies the further condensed comparison, using HS1 and VS4.
- `fg_admissible_finite_length_ne_p`: over every field of characteristic different from `p`, a finitely generated admissible smooth representation of `G(E)` has finite length (Vignéras, §5, p. 340). For the support argument also use finite length of parabolic induction of finite-length admissible representations (§5, p. 339). The latter has its classical characteristic-different-from-`p` proof; these inputs must not be obtained from second adjointness proved using the geometric excursion action that they will support.
- `supercuspidal_support_exists_ne_p`: over algebraically closed `L` as above, every irreducible representation is a subquotient of normalized induction from an irreducible supercuspidal representation of a Levi. Only existence is required. Use finite length of parabolic induction and induction in semisimple rank; a merely cuspidal representation need not be supercuspidal in positive coefficient characteristic. `admissible_smooth_dual_ne_p` gives exactness of smooth duality on admissible representations, the bidual isomorphism and irreducibility of the dual of an irreducible, from perfect pairings on finite-dimensional pro-`p` fixed vectors. These are the coefficient-general support and duality inputs of ES6:duality.2 (Vignéras, §§4–5, pp. 337–340; Fargues–Scholze, proof of Proposition IX.5.3, pp. 329–330).
- `closed_cocompact_irreducible_lift_ne_p`: for a closed normal `H ⊂ G(E)` with compact quotient and an irreducible admissible smooth `H`-representation `τ`, there is an irreducible admissible `Π` of `G(E)` and an `H`-equivariant surjection `Π|_H → τ`. Prove admissibility of `Ind_H^{G(E)} τ` using the finite set `H\G(E)/K` for each compact open `K`; its invariant summands are the finite-dimensional `τ^{H ∩ gKg⁻¹}`. A cyclic subrepresentation is admissible and has finite length by the preceding target, hence has an irreducible subrepresentation `Π`. The right-adjoint Frobenius isomorphism turns this inclusion into a nonzero, hence surjective, map to `τ` (Henniart–Vignéras, §2.2.4(2), p. 236; Vignéras, §5, p. 340). No openness or finite index of `H`, and no finite generation of the whole induced representation, is assumed.

**Checks.**

- A one-dimensional character of a torus is admissible and has scalar endomorphisms. The zero representation is admissible and has length zero, but is not irreducible.
- The scalar-endomorphism argument applies over the countable field `F̄_ℓ`, including `ℓ = 2`; it uses `char L ≠ p`, not a good-prime bound for `G`.
- For `G = G_m`, `K = O_Eˣ`, the smooth representation `c-Ind_K^{Eˣ} L ≃ L[t,t⁻¹]` is cyclic and has infinite length, as witnessed by the strictly descending ideals `(t−1)ⁿ`. Its `K`-invariants are infinite-dimensional, so it is not admissible. This tests the admissibility hypothesis while retaining finite generation.
- For `H = G(E)` the lift is `Π = τ`. A closed infinite-index cocompact subgroup still has finitely many `H\G(E)/K` for each open `K`; this does not make `G(E)/H` finite.
- Cuspidality and supercuspidality are distinct in the modular range. The support target must allow a cuspidal representation that is a subquotient of a proper parabolic induction.

### Integral highest-weight generation beyond LP3.0

The requested LanglandsParameterStacks continuation owns the following strengthening of its field-valued highest-weight theory; EnhancedDerivedSheaves supplies the stable envelope and Verdier quotients. Fix a DVR `R`, a split reductive `H/R`, a Borel and maximal torus, and the corresponding dominant weights. Write `Rep_R^fr(H)` for finite free algebraic representations, with exact sequences those exact on underlying `R`-modules. There is no restriction on the residue characteristic or on the fundamental group of `H`.

- `integral_highest_weight_ext`: for dominant `λ, μ` and `i ≥ 0`, the Weyl and induced lattices `Δ_λ`, `∇_λ` are finite free and commute with base change, and `Ext_H^i(Δ_λ, ∇_μ)` is `R` for `i = 0, λ = μ` and zero otherwise. For a finite saturated set `Ω` of dominant weights, the truncated coordinate coalgebra is finite free, commutes with base change, and has the corresponding good `H × H` filtration. Use Jantzen, II.B.4, pp. 412–413, II.B.7–B.8, pp. 414–415, and II.B.9, pp. 415–416. The last result tests good filtrations of finite free lattices on all residue fields; reduction alone is not a proof of the categorical statement below.
- `perf_classifying_stable_envelope_DVR`: the canonical exact functor induces an equivalence `Idem(Dᵇ_exact(Rep_R^fr(H))) ≃ Perf(BH)`, and hence exact monoidal functors on the representation category extend, with their coherent universal property, to exact monoidal functors on `Perf(BH)`. Prove the derived comparison, full faithfulness on derived mapping objects and generation, rather than only a list of generators in a Grothendieck group. Resolve finite weight truncations by lattices using the preceding target and pass to their filtered union (Fargues–Scholze, Proposition X.3.1 and its reduction to X.1.1, pp. 348–349).
- `perf_classifying_highest_weight_filtration_DVR`: the finite saturated weight subcategories of `Perf(BH)` admit finite highest-weight filtrations with successive Verdier pieces equivalent to `Perf(R)`; their filtered union generates `Perf(BH)` under retracts. The filtration is compatible with external tensor products and product highest weights. Deduce the equivalence `Perf(BH₁) ⊗_{Perf(R)} Perf(BH₂) → Perf(B(H₁ × H₂))` for split reductive `H₁,H₂/R`, and in particular all finite powers of `H` (Fargues–Scholze, Proposition X.3.2, p. 349). This is a filtration of a stable category, not a claim that each representation has a good filtration or splits as a sum of highest-weight modules.

**Checks.**

- For `H = 1`, these are `Idem(Dᵇ_exact(Free_R^fin)) ≃ Perf(R)` and its tensor-unit identity.
- For `H = G_m`, a finite set of weights gives a finite sum of copies of `Perf(R)`; every perfect object involves finitely many weights.
- The complex `[R —ϖ→ R]` of trivial representations is retained and has nonzero torsion cohomology. Inverting `ϖ` loses this object and cannot prove the integral comparison.
- For `SL₂` over a DVR of residue characteristic `2`, no semisimplicity or good-filtration assertion about every module is allowed. The Ext pairing is between `Δ_λ` and `∇_μ`, not between arbitrary pairs of irreducibles.

### Constructible curve duality and equal-characteristic local constants

WC.2's determinant algebra is used with a requested WeilConjectures continuation `constructible_curve_functional_equation`. Let `X/F_q` be a smooth projective geometrically connected curve, `ℓ ≠ p`, and `K ∈ Dᵇ_c(X, Q̄_ℓ)`. For geometric Frobenius `F`, set `L(X,K,T) = det(1 − TF | RΓ(X̄,K))⁻¹`, `χ(K) = χ(RΓ(X̄,K))` and `ε(X,K) = det(−F | RΓ(X̄,K))⁻¹`, with alternating determinants. Prove

```text
L(X,K,T) = ε(X,K) T^(−χ(K)) L(X,D_X K,T⁻¹).
```

Here `D_X K = RHom(K,Q̄_ℓ(1)[2])`. The proof uses EDC.2 and EDC.8 for the perfect Frobenius-equivariant Verdier pairing, followed by WC.2's determinant reciprocity; the coefficients and the boundary terms are the added input (Laumon, §3.1.1, Theorem 3.1.1.1, p. 178, and equations 3.1.1.3–3.1.1.5, p. 179). For `j:U → X` open and lisse `F_U`, take `K = j_!F_U`: the dual is `Rj_*F_U^∨(1)[2]`. Thus compactly supported cohomology on one side pairs with ordinary cohomology on the other. The completed Euler product uses `K = j_*F_U` instead and must keep its boundary stalk factors; these two equations are not interchangeable.

ArithmeticGaloisRepresentations §2.7 owns local Weil–Deligne constants. Its requested equal-characteristic extension `equal_char_local_epsilon` supplies Laumon's local constants for an equal-characteristic-`p` henselian trait with finite residue field, a constructible complex, a nonzero meromorphic differential `ω`, and a fixed nontrivial additive character of `F_p`; finite extensions use the induced trace character. Include multiplicativity in distinguished triangles, the punctual determinant factor, induction for complexes of generic rank zero, and the rank-one reciprocity normalization (Laumon, Theorem 3.1.5.4, p. 186). For nonzero generic rank the induction formula has the corresponding correction factor; the rank-zero induction axiom cannot be silently used without that hypothesis. In the associated Haar convention the ring of integers has volume `1` (§3.1.5.8, p. 187); conversion to a self-dual measure requires its explicit conductor factor. Distinguish `ε(T,j_*V,ω)` from `ε₀(T,V,ω) = ε(T,j_!V,ω)`: it is the latter that is multiplicative on every short exact sequence of generic representations (§3.1.5.7, p. 187).

The requested WeilConjectures continuation `curve_epsilon_product`, consuming those local constants, states

```text
ε(X,K) = q^((1−g) rank(K)) ∏_{x∈|X|} ε(X_(x),K|_(X_(x)),ω|_(X_(x))).
```

The generic rank is alternating, `g` is the genus, all but finitely many local terms are `1`, and the product is independent of the nonzero rational differential `ω` (Laumon, Theorem 3.2.1.1, p. 187, and §3.2.1.3, p. 188). For a connected curve with `c` geometric components the source has `q^(c(1−g) rank(K))`; the displayed target assumes geometric connectedness. No global zeta-integral or Tate-thesis functional-equation target is involved. ES7:equal-characteristic.17 consumes these three named extensions, not an enlarged meaning of WC.2.

**Checks.**

- For `K = 0`, `L = ε = 1` and `χ = rank = 0`.
- For the constant sheaf on `P¹`, `L = 1/((1−T)(1−qT))`, `χ = 2` and `ε = q⁻¹`. The two Frobenius eigenvalues `1,q` fix the inverse alternating determinant.
- For `U = A¹`, constant rank one gives `L_c(U,T) = 1/(1−qT)`, `χ_c = 1` and `ε_c = −q⁻¹`; the dual side is `L(U,Q̄_ℓ,q⁻¹T⁻¹) = 1/(1−q⁻¹T⁻¹)`. Multiplying it by `−q⁻¹T⁻¹` recovers `L_c`. Substituting `L_c` on both sides fails.
- For `U = G_m`, the eigenvalues on `H_c¹,H_c²` are `1,q`: `L_c = (1−T)/(1−qT)`, `χ_c = 0` and `ε_c = q⁻¹`. Ordinary cohomology gives the reciprocal factor before `T ↦ q⁻¹T⁻¹`.
- A rank-zero complex supported at a closed point still contributes its punctual epsilon determinant. Omitting boundary stalks loses this contribution even though its generic rank vanishes.

### From BunGAndNewtonStrata, RelativeFarguesFontaine and ReductiveGroupsPartII

BunGAndNewtonStrata Layers 0–4 are consumed in their existing ranges. In particular, §1.36 already supplies `B(T) ≃ π₁(T)_Γ` for every nonarchimedean `E` and §1.44 already supplies `B(G)_basic → B(G_ad)_basic ≃ H¹(E,G_ad)` surjectivity when `Z(G)` is a torus, including equal characteristic. These are not additional requests; §1.40 instead concerns abelianization over `p`-adic `E`. ReductiveGroupsPartII RG2.0, RG2.1.5, RG2.2, RG2.3 and RG2.5 are consumed in their existing ranges. The following requests name the extra geometry. They apply over every nonarchimedean `E`, including characteristic `p`; the stronger z-embedding assertion of ES6:functoriality.10 remains `p`-adic.

| Owner and target | Exact additional interface and consumers |
| --- | --- |
| BunG §0.7: `basic_inner_twist_hecke` | For basic `b`, the pure inner-twist equivalence on bundles identifies the two Hecke correspondences, their bounded kernels and descent, preserving their two projections. Used by ES7:parabolic.4; Fargues–Scholze, Corollary III.4.3, p. 101, and IX.7.2, p. 335. |
| BunG Layer 4: `bounded_hecke_hn_preservation` | Fix a bounded Hecke type and the strictly dominant central cocharacter of the chosen Levi. There exists `N₀` such that for `N ≥ N₀` every self-modification of `E_{b_N}` of that type preserves its canonical HN reduction. `N₀` depends on the bound. Used by ES7:parabolic.5; Fargues–Scholze, proof of IX.7.2, pp. 335–336. |
| BunG with HS4.3: `central_pushout_stratum_square` | For the central pushout `G → G⁺`, identify the rational-point homomorphisms of the corresponding twisted centralizers on each stratum lying above the target stratum, and the analogous Levi homomorphisms. Restriction of the plain Hecke pullback is restriction of smooth representations along these homomorphisms. Include every preimage stratum and preserve the `2ρ` normalization. Used by ES7:parabolic.4; its centralizer calculation and induction-detection proof are specified there. |
| RelativeFarguesFontaine: `rank_one_LT_frame` | The punctured Banach–Colmez space of `O(1)` is the `Eˣ`-torsor `Isom(O(−1),O(−D))` over `Div¹`; identify its height-one Lubin–Tate cover and compute the uniformizer descent on this frame. This is coefficient-free; ES6:functoriality.6 converts it to associated-representation transport. Fargues–Scholze, II.2.2–II.2.4, pp. 60–61; Fargues, Proposition 2.16 and Remark 2.17, pp. 9–11, Proposition 3.3, p. 13. |
| RG2 continuation after RG2.5: `multiplicative_center_pushout`, `closed_cocompact_rational_image` | Embed a multiplicative-type centre into a torus, construct `(G × T)/Z`, its torus quotient and dual exact sequence, and prove that `i(G(E))T(E)` is closed normal with compact abelian quotient. Use the induced-torus resolutions already owned by current RG2.1.5, together with the dual maps of RG2.5; the extra requests concern the pushout and rational image used by ES6:functoriality.11. Henniart–Vignéras, Lemma 3.1 and Proposition 3.3, pp. 238–240, with the corrections under *Source corrections*. Rational surjectivity and finite index are not conclusions. |

**Checks.**

- For the trivial torus the Kottwitz set has one element. For `G_m` it is `ℤ`, so retaining only the neutral component fails.
- The identity inner twist and identity central pushout give identity diagrams. A general pushout does not identify the whole inverse image with one stratum.
- For `SL_p → GL_p` over `F_q((t))`, the centre `μ_p` is nonsmooth and the quotient of rational points by the image and centre can be infinite compact. The closed-cocompact statement and the induction argument still apply.
- In the HN assertion the Hecke bound is fixed before choosing `N₀`; increasing modification bounds cannot be tested with one universal `N₀`.
- Rank one has no Satake shift or half twist. The computed frame and character witnesses of ES6:functoriality.6 fix its reciprocity sign.

### From the classical and function-field suppliers

EndoscopicTransferAndUnitaryTraceComparison ET.6 and ET.6a (classical correspondences for `GL_n` over `p`-adic fields and the tower–Hecke comparison: Scholze–Weinstein, Theorem 24.2.5, p. 227, for `E = ℚ_p` and Corollary 24.3.5, p. 231, for the EL data of `Res_{E/ℚ_p} GL_n` and of `D` in general). ArithmeticGaloisRepresentations R01.1 *brauer-nesbitt-traces*, R01.2 *weil-deligne-representation* and *frobenius-semisimplification* (with its arithmetic Frobenius converted to the geometric one used here), R01.5 *curve-recognition-from-an-open-subset*, and the requested §2.7 target `equal_char_local_epsilon`. FunctionFieldArithmetic FA.2, FA.4 (*local-abelian-existence*, global reciprocity), FA.6, with the algebraic descent of automorphic representations from `ℂ` to `Q̄_ℓ` and finite coefficient fields. AdelicAlgebraicGroups AA.0 *restricted-haar-product* and AA.1 for function fields. AutomorphicSpectralTheory AS.0. AlgebraicModuliForArithmeticGeometry R09.2, R09.4–R09.6. DrinfeldModulesAndTModules DM.7. EtaleDualityAndPerverseSheaves EDC.2 (with *adic-and-rational-poincare-duality*) and EDC.8 (correspondences, their composition, push-forward and traces, the Lefschetz–Verdier formula). ClassicalAdicEtaleCohomology H3 *proper-support-direct-image* and *berkovich-derived-duality-interface*. DeligneWeightsAndPurity DWP.5 *local-monodromy-purity*, DWP.7. WeilConjectures WC.2 for determinant algebra, with the requested continuation targets `constructible_curve_functional_equation` and `curve_epsilon_product` above (ES7:equal-characteristic.17). ArithmeticGaloisDuality R02.2 *first-quadrant-spectral-sequence*. SchemeAndStackFoundations SF.0, SF.2, SF.3. HeckeStacksAndLocalShtukas HS2 in equal characteristic, with formal `O`-modules and their deformation theory over `F_q[[t]]` (ES7:equal-characteristic.5–.6).

### Order of supplier interfaces

Each row uses only the earlier rows and the established lower foundations; independent entries in one row may be developed separately.

| Order | Interfaces and their dependencies | First consumers |
| --- | --- | --- |
| A | Existing library and roadmap algebra, continuous groups, reductive groups, six operations, enhanced stable categories and curve duality; SR's elementary smooth induction and coefficient-general representation targets above; AGrep local epsilon constants | Abstract suppliers in B and C |
| B | Existing SR6.1–SR6.3 abstract finite-wild cocycles and excursions, then LP0–LP2; LP3's integral highest-weight targets from algebraic representation theory and E5 stable envelopes; WC's constructible functional equation and epsilon product from EDC and AGrep | LP3–LP4; ES1; ES3; ES7:equal-characteristic.17 |
| C | Relative FF, vector bundles and BunG geometry, then VS3–VS4's category and stratum comparisons; GS4 and HS1/HS4's coherent Hecke family; LP3–LP4's generation and coefficient comparisons | ES0–ES3 and ES5 |
| D | ES0 and ES1 excursion operators, then ES5 and ES6:functoriality; BunG's bounded HN and central-pushout comparisons with HS4, then ES7:parabolic; VS5 duality and E5 localization give ES4 and ES6:duality | Parameter properties and classical comparison |
| E | Equal-characteristic formal-module geometry and ES7's independent classical correspondence, then the two-operation bridge of ES7:equal-characteristic.22 using the generic HS2/HS3 interfaces; combine with the trace argument | ES7:equal-characteristic.23 and ES7 |

Current TauCetiRoadmap SR6.1–SR6.3 already owns the abstract cocycle/excursion construction. It is an input to LP, not a request to reconstruct it in ES. Its later geometric applications do not supply the early coefficient-general representation results. The equal-characteristic classical comparison in row E is also not a prerequisite for generic HS1/HS4 in row C. Treating either entire roadmap as one inseparable prerequisite would reintroduce a cycle.

## How to read the build

The layers are built in the order ES0, ES0:classical-center, ES1:finite-ramification, ES1:spectral-center, ES2, ES3, ES5, ES6:functoriality, ES7:parabolic, ES4, ES6:duality, ES7:GLn-comparison, ES7:function-field-automorphic, ES7:equal-characteristic, ES7. The numbering of a layer records its subject; the order records its dependencies. ES0 and ES1:finite-ramification work over every `ℤ_ℓ[√q]`-algebra and never use a spectral action. ES1:spectral-center adds the centre-order condition. ES2 and ES3 build the spectral actions and are used afterwards only by ES4's coefficient-change and support statements. ES5 reconstructs parameters directly from the global excursion operators of ES0.3 and their condensed scalar families, so the parameters exist for every coefficient field of characteristic different from `p`. ES6:functoriality and ES7:parabolic compute those parameters; ES4 comes after ES7:parabolic because the basic decomposition of an elliptic component uses the stratum factorization, and ES6:duality comes after ES4 because its Bernstein–Zelevinsky statement uses the duality of the centre (ES4.5) and its smooth-dual statement uses parabolic induction. The three ES7 realization layers are independent of one another up to the shared trace theorem of ES7:GLn-comparison; ES7 joins the two characteristics. Prerequisites are cited by layer and subsection, as ES1:finite-ramification.2 or ES5.3.

## Layer ES0: the enhanced centre and excursion operators on `Bun_G`

The centre of a stable category is the degree-zero part of the endomorphisms of its identity functor, computed in the enhanced functor category; it maps to Mathlib's centre of the homotopy category, and no general isomorphism between the two is asserted. The excursion operators are the specialization of the abstract excursion data of LP2e.13 to the normalized Hecke family of `Bun_G`. Their algebra action needs the finite-wild categories of the next layer but one and is constructed there.

### ES0.1 The enhanced centre

For a `Λ`-linear stable ∞-category `C`, small and idempotent complete, or presentable and compactly generated with a specified subcategory of compact objects, define `enhancedCenter C = Z_enh(C) = π₀ Map_{Fun^ex_Λ(C, C)}(id_C, id_C)`. Addition comes from stability and multiplication from composition; the `E₂`-structure on the endomorphisms of the unit of the monoidal category `Fun^ex_Λ(C, C)` (interchange of composition and horizontal composition) makes `π₀` a commutative `Λ`-algebra. When `C` is condensed enriched (as `D_lis(Bun_G, Λ)` is, HS1.8), keep the induced condensed endomorphism algebra as well. For `D_lis`, identify the centre of the compact objects with that of `Ind(D^ω)` by extending natural transformations along the universal property of Ind. Prove `enhancedCenter_eval` (each object `X` receives a `Λ`-algebra map `Z_enh(C) → π₀ End_C(X)`), `enhancedCenter_scalars` (a scalar `λ ∈ Λ` evaluates to `λ · id_X`), `enhancedCenter_naturality` (for `u : X → Y`, `u ∘ z_X = z_Y ∘ u`, with the coherent naturality inherited from `z`) and `enhancedCenter_ind` (restriction from colimit-preserving natural endomorphisms of `Ind(C)` to `C` is an equivalence of mapping objects, hence of centres) (Fargues–Scholze, §IX.1, pp. 320–321; §IX.5, p. 328; Theorem VIII.4.1, p. 291). *Needs:* EnhancedDerivedSheaves E5:abstract.4, E5:presentability.1 (*The universal property of Ind*); HS1.8; Mathlib `CategoryTheory.CatCenter`, `CatCenter.app`, `CatCenter.naturality`, `Linear.toCatCenter`.

**Checks.**

- The scalar `λ ∈ Λ` evaluates on every `X` to `λ · id_X`.
- The zero stable category has zero centre.
- For `C = Perf(A)` with `A` an ordinary commutative `Λ`-algebra, `Z_enh(C)` is `A` acting by multiplication (Hochschild cohomology in degree zero), and evaluation at `A` is that identification.
- For `C = Perf(k) × Perf(k)` the centre is `k × k`, while the object `(k, 0)` has endomorphism ring `k`: the centre is not the endomorphism ring of one object.

### ES0.2 Comparison with the centre of the homotopy category

Prove `enhanced_to_homotopy_center`: taking components of an enhanced central transformation gives a natural `Λ`-algebra map `Z_enh(C) → CatCenter(hC)` that commutes with the scalar maps from `Λ` and with evaluation at objects. No injectivity or surjectivity is asserted for a general stable `C`; every later comparison with an ordinary centre goes through this map (Fargues–Scholze, §IX.5, p. 328; Mathlib `CategoryTheory.Center.Basic` and `Center.Linear`). *Needs:* ES0.1; Mathlib `CatCenter`, `CatCenter.app`, `CatCenter.naturality`, `Linear.toCatCenter`.

**Checks.**

- The map sends the scalar `λ` to `λ · id` and commutes with evaluation at every object.
- The map is not asserted to be injective or surjective; the comparison with the smooth Bernstein centre uses it only through restriction to a heart (ES0:classical-center.1).

### ES0.3 Excursion operators on `Bun_G`

Let `E`, `G`, `Ĝ`, `Q` and `Λ` be as in the conventions, with the square root `√q` fixed in `Λ`. An excursion datum is `D = (I, V, α, β, (γ_i)_{i∈I})` with `I` finite, `V ∈ Rep_Λ((Ĝ ⋊ Q)^I)`, `α : 1 → V|_Δ` and `β : V|_Δ → 1` invariant under the diagonal `Ĝ` (arbitrary such maps, not necessarily a unit and counit), and `γ_i ∈ W_E` (LP2e.13). Construct `bunExcursionOperator`: for `A ∈ D` the operator `S_D(A)` is the composite `A = T_1(A) → T_V(A) → T_V(A) → T_1(A) = A` of `T_α`, the action of `(γ_i)` from the `W_E^I`-equivariant structure of `T_V(A)`, and `T_β`, using the fusion identifications of HS4.1 and `T_1 = id`. Creation and annihilation are kept natural at the enhanced level, so `S_D` is a coherent natural endomorphism of the identity of `D`, an element of `Z_enh(D)`. Prove `bunExcursionOperator_app` (the component on `A` is `T_β(A) ∘ (γ_i) ∘ T_α(A)` with the stated unit identifications), `bunExcursionOperator_naturality` (for `u : A → B`, `S_D(B) ∘ u = u ∘ S_D(A)`), `bunExcursionOperator_function` (data with the same matrix coefficient and the same tuple induce the same operator, by LP2e.14) and `bunExcursionOperator_fusion` (pulling legs together along `I → J` agrees with fusion and with the reindexing relation of LP2e.14) (Fargues–Scholze, Definition VIII.4.2, pp. 291–292; §IX.2, pp. 321–324). Only this specialization is owned here. *Needs:* LP2e.13, LP2e.14, LP2e.15; HS4.1; HS1.8; EnhancedDerivedSheaves E5:abstract; ES0.1.

**Checks.**

- For `V = 1` and `α = β = id` the operator is the identity for every tuple.
- If every `γ_i = 1` then `S_D = T_{β∘α}`; for the coevaluation and evaluation of a duality pair this is `dim(V) · id`, not the identity.
- For `Ĝ = GL_n`, `V = Std ⊠ Std^∨` with its tautological creation and annihilation, the scalar attached to a parameter `φ` is `tr(φ(γ₁) φ(γ₂)⁻¹)` (made precise in ES7:GLn-comparison.2).
- For a nonsplit torus the cocycle equation is `φ(uv) = φ(u) · u(φ(v))`; the construction uses twisted conjugation, and a definition by ordinary conjugation fails this check.

### Examples

For `G = G_m` the Hecke operator of the standard character changes the degree of a line bundle by one, and the two-leg excursion operator for `Std ⊠ Std^∨` with tuple `(γ, 1)` acts on the regular module `Λ[Eˣ/K]` in every degree by translation by `rec_geom⁻¹(γ)` (ES6:functoriality.6).

### Dependencies

LanglandsParameterStacks LP2e; HeckeStacksAndLocalShtukas HS1, HS4; EnhancedDerivedSheaves E5:abstract, E5:presentability; Mathlib `CatCenter`.

## Layer ES0:classical-center: the smooth Bernstein centre

The open stratum `Bun_G^1` is the classifying stack of `G(E)`, and `j_!` embeds the derived category of smooth representations fully faithfully. Restricting enhanced central elements along it gives the comparison with the Bernstein centre of SR.0.4 over the same coefficients; the complex block description is a separate comparison through a chosen field isomorphism, used by no characteristic-`ℓ` statement.

### ES0:classical-center.1 Restriction to the smooth Bernstein centre

Prove `map_to_the_classical_bernstein_center`. Let `j_! : D(G(E), Λ) → D_lis(Bun_G, Λ)` be the fully faithful stratum embedding of VS4.2–VS4.3 (the case `b = 1` of `L_b`). Restrict an enhanced central element to the essential image of `j_!`, transport it to the enhanced derived smooth category by full faithfulness on mapping objects, take `π₀`, and evaluate on smooth representations in degree zero; this gives a `Λ`-algebra map `Z_geom(G, Λ) → Z(G(E), Λ)` to the centre of the abelian category of smooth `Λ[G(E)]`-modules. The last step uses that the identity transformation is t-exact and SR.0.4's centre; no comparison between the enhanced and homotopy centres beyond ES0.2 is used, and the coefficient hypothesis is that of SR.0.4 and SR.1.3 (a cofinal family of compact open subgroups of invertible pro-order, here pro-`p` subgroups) (Fargues–Scholze, §IX.5, p. 329; Proposition VII.7.2, pp. 272–273). The general stratum maps `Ψ_G^b` are ES7:parabolic.1. *Needs:* ES0.1; ES0.2; VS4.2; VS4.3; SR.0:derived-extension; SR.0.4 *smooth-centre*; SR.1.3 *bernstein-centre-corners*.

**Checks.**

- For `G = 1` both centres are `Λ` and the map is the identity.
- The map sends a scalar `λ` to `λ`, and needs no block decomposition.
- The endomorphism ring of `c-Ind_K^{G(E)} Λ` is the Hecke algebra `H(G(E), K; Λ)`, which is noncommutative in general; the map lands in the centre, and its image in `H(G(E), K; Λ)` is central.

### ES0:classical-center.2 The characteristic-zero block comparison

Prove `complex_block_comparison`. Choose an abstract field isomorphism `ι : Q̄_ℓ ≃ ℂ`. Scalar extension along `ι` is an equivalence of categories of smooth representations, with quasi-inverse given by `ι⁻¹` (SR.0.4 *coefficient-change*), and conjugation of natural transformations by it is an isomorphism of centres `Z(G(E), Q̄_ℓ) ≃ Z(G(E), ℂ)` compatible with evaluation. Composing the `Q̄_ℓ`-valued map of ES0:classical-center.1 with it gives the blockwise action on SR.3's Bernstein decomposition. The comparison depends on `ι`; an abstract field isomorphism transports no topology, so neither the condensed Weil continuity nor any `ℓ`-independence passes through it (Fargues–Scholze, §IX.5, p. 329; SR.3.2). *Needs:* ES0:classical-center.1; SR.3.2 *bernstein-decomposition*, *bernstein-centre-blocks*; SR.0.4 *coefficient-change*.

**Checks.**

- A scalar `λ` acts on every block by `ι(λ)`.
- Composing with a different isomorphism `ι′ = ι ∘ τ`, `τ ∈ Aut(Q̄_ℓ)`, changes the comparison by `τ`; for `τ` discontinuous the composite is not continuous in the coefficient topology.

### Examples

For `G = G_m` and `Λ = Q̄_ℓ`, `Z(G(E), Λ)` is the completed group algebra `lim_K Λ[Eˣ/K]` (SR.1.3); the map of ES0:classical-center.1 sends a central element to its action on the regular representations `Λ[Eˣ/K]`.

### Dependencies

ES0; VStackSheavesAndLisseCategories VS4; SmoothRepresentationsOfLocalGroups SR.0.4, SR.0:derived-extension, SR.1.3, SR.3.

## Layer ES1:finite-ramification: finite wild ramification, the excursion action and components

A compact lisse object sees only a finite quotient of wild inertia, uniformly in all Hecke operators (Proposition IX.5.1). On the finite-wild compact categories this defines, the excursion algebra of a discretization acts through the enhanced centre, continuously in the Weil variables, and its idempotents split compact objects by the connected components of the parameter stack. Everything in this layer holds over every `ℤ_ℓ[√q]`-algebra with `ℓ ≠ p`; the good-prime and centre-order conditions play no role.

### ES1:finite-ramification.1 Finite-wild Hecke subcategories

Let `P` be a subgroup open in wild inertia, normal in `W_E` and contained in the kernel of `W_E → Q` (an eligible subgroup). Define `finiteWildCategory P = D^P` as the full subcategory of `D^ω` of compact objects `A` such that for every finite set `I` and every `V ∈ Rep_Λ((Ĝ ⋊ Q)^I)` the `W_E^I`-equivariant object `T_V(A)` lies in the essential image of the pullback from `(W_E/P)^I`-equivariant objects. The pullback is fully faithful because `P^I` is pro-`p` and has vanishing `Λ`-homology; the condition is imposed in the enhanced equivariant category, with its homotopies. Prove `finiteWild_mem` (membership is simultaneous descent of all `T_V(A)` through `(W_E/P)^I`), `finiteWild_inclusion` (for `P′ ⊂ P` the inclusion `D^P ⊂ D^{P′}` is exact and fully faithful), `finiteWild_stable` (`D^P` is closed under zero, shifts, cofibres and retracts, since each essential image is stable and idempotent complete) and `finiteWild_refine_comp` (the inclusions for `P″ ⊂ P′ ⊂ P` compose) (Fargues–Scholze, §IX.5, pp. 327–328). *Needs:* HS4.1; HS1.8; HS1 (pro-`p` equivariant full faithfulness, supplier contract); EnhancedDerivedSheaves E5:abstract, E5:presentability; VS4.4.

**Checks.**

- The zero object lies in `D^P` for every eligible `P`.
- If `P` acts trivially on `T_V(A)` for a single tensor generator `V` of one leg, then `A ∈ D^P`, by the tensor and exterior-product argument of ES1:finite-ramification.2.
- For a nontrivial finite wild quotient `F` of `W_E` acting on its regular representation over coefficients in which `p` is invertible, an element of `P` with nontrivial image in `F` acts nontrivially, so an object whose Hecke family contains this action does not lie in `D^P`.

### ES1:finite-ramification.2 Uniform finite wild ramification

Prove the finite-ramification theorem `uniform_wild_subgroup`: for every compact `A ∈ D_lis(Bun_G, Λ)` there is an eligible `P` (depending on `A`) such that `A ∈ D^P`, that is, for every finite `I` and every `V ∈ Rep_Λ((Ĝ ⋊ Q)^I)`, `T_V(A)` descends to a `(W_E/P)^I`-equivariant object. The quantifiers are: for every compact `A` there exists `P` working for all `I` and `V`. Proof: by full faithfulness of quotient-equivariant pullback, it suffices to make `P` act trivially; choose a tensor generator of `Rep(Ĝ ⋊ Q)`; the relatively discrete condensed endomorphism algebra of the compact object `T_V(A)` has the image of inertia inside the automorphisms of a finite `ℤ_ℓ`-module, a locally pro-`ℓ` group, so the pro-`p` group `P` has finite image and can be shrunk to act trivially; fusion identifies the leg actions, and closure under duals, subquotients, extensions, exterior tensor products and reindexing reaches every `V`; finally replace `P` by its normal core and intersect with the kernel of `W_E → Q` (Fargues–Scholze, Proposition IX.5.1, pp. 327–328). The coefficient hypothesis is `ℓ ≠ p` only. *Needs:* ES1:finite-ramification.1; HS4.1; HS1.8; HS1; VS4.4; LP0.3 (with the LP0 tensor-refinement contract); EnhancedDerivedSheaves E5:abstract.

**Checks.**

- For `A = j_!(c-Ind_K^{G(E)} Λ)` with `K` pro-`p`, the theorem gives a cutoff `P_K`; it depends on `K`, and no single `P` serves all levels.
- A noncompact direct sum `⊕_n j_!(c-Ind_{K_n}^{G(E)} Λ)` over levels `K_n` shrinking to `1` need not have a common `P`: the theorem is about compact objects only.
- The hypothesis is `ℓ ≠ p`, not the good-prime condition: the statement holds for `G = SL₂` and `ℓ = 2`.

### ES1:finite-ramification.3 The excursion algebra acts on finite-wild pieces

Let `W` be a discretization of `W_E/P`. Prove `excursion_algebra_to_bernstein_center`: the Hecke family restricted to `W` is a categorical Hecke datum on `D^P` in the sense of LP2e.12, and the abstract centre map of LP2e.15 gives a natural `Λ`-algebra map `Exc(W, Ĝ) ⊗ Λ → Z_enh(D^P)`, `f_{D,γ} ↦ [S_D]`, whose composite with ES0.2 is the ordinary centre map of Theorem VIII.4.1. The relations of the excursion algebra hold in `π₀` because the comparisons of HS4.1 are coherent equivalences of enhanced natural transformations; no strict equality of enhanced morphisms, no action of `Perf` of the parameter stack and no good-prime hypothesis is used. For a noninjective map of leg sets the reindexing square in the proof of Theorem VIII.4.1 commutes and is not cartesian; only commutativity is used (*Source corrections*) (Fargues–Scholze, Theorem VIII.4.1 and its proof, pp. 291–293; §IX.5, p. 328). *Needs:* ES0.1; ES0.2; ES0.3; ES1:finite-ramification.1; LP2e.9, LP2e.10, LP2e.12, LP2e.15; HS4.1; EnhancedDerivedSheaves E5:abstract.

**Checks.**

- The map is additive, multiplicative and unital on the generators of LP2e.10.
- For the fold map `{1, 2} → {1}` the relation is the HS4.1 fusion diagram, not a separately assumed identity.
- At `ℓ = 2` for `G = SL₂` the map exists; no isomorphism of the excursion algebra with an invariant ring is asserted there.

### ES1:finite-ramification.4 Condensed continuity of excursions

Prove `continuity_of_excursion_evaluations`: for compact `A ∈ D^P` and a fixed finite set of legs and invariant coefficient, the map `(W_E/P)^I → π₀ End(A)` sending `(γ_i)` to the creation–Weil–annihilation operator is a map of condensed sets on the completed quotient `W_E/P`, not only on the dense subgroup `W`. Hence evaluation through a Schur scalar identification is continuous. The full excursion algebra need not be independent of the discretization at bad primes (ES1:finite-ramification.5) (Fargues–Scholze, Proposition IX.1.2, pp. 320–321; Proposition IX.5.1, pp. 327–328; Proposition VIII.3.7, pp. 288–290). *Needs:* ES0.3; ES1:finite-ramification.2; HS1.8; HS1.9; LP2e.11.

**Checks.**

- The trivial representation gives the constant map with value `id_A`.
- For a nonsplit torus the continuity is with respect to the twisted action of `W_E` through `Q`.
- The evaluation determines a scalar family, not a preferred representative of a parameter.

### ES1:finite-ramification.5 Comparison of discretizations

Prove `discretisation_of_the_weil_group`: two discretizations `W, W′ ⊂ W_E/P` give canonically identified cocycle schemes, by restriction and unique continuous extension (LP0.4). Their excursion evaluations on flat relatively discrete targets agree through the `ℓ`-torsion-free quotient of `Exc`, which is independent of the discretization (LP2e.11). Under the good-prime condition, or after inverting `ℓ`, `Exc` itself is the invariant ring (LP2i.3) and the comparison is an isomorphism of algebras; at other primes only the torsion-free quotient, the component idempotents (through the universal homeomorphism of LP2e.9) and the condensed operator evaluations of ES1:finite-ramification.4 are intrinsic (Fargues–Scholze, Proposition VIII.3.7, pp. 288–290, and the remark following it, p. 289; §IX.5, p. 328). *Needs:* LP0.4; LP2e.9; LP2e.11; LP2i.3; ES1:finite-ramification.3.

**Checks.**

- Changing the Frobenius or the tame generator composes through the intrinsic cocycle functor of LP0.4.
- For `Ĝ = G_m` the comparison is an isomorphism at every `ℓ ≠ p`.
- For `Ĝ = PGL_ℓ` the comparison is asserted only on the torsion-free quotient.

### ES1:finite-ramification.6 Component decomposition

Prove `component_decomposition`. The idempotents of the coordinate ring of the finite-wild piece `Z¹(W_E/P, Ĝ)_Λ // Ĝ` correspond to idempotents of `Exc(W, Ĝ) ⊗ Λ` through the universal homeomorphism of LP2e.9, and act on `D^P` through ES1:finite-ramification.3. Splitting them in the idempotent-complete category gives `D^P = ⊕_c D^c` over `π₀ Z¹(W_E/P, Ĝ)_Λ`; taking the union over `P` (ES1:finite-ramification.7) gives a direct sum decomposition `D^ω = ⊕_c D^{ω,c}` over the connected components `c` of the parameter stack, and `Ind(D^ω) = D` is the product of the `Ind(D^{ω,c})`. Every compact object has finitely many nonzero components, an object of the Ind-category may have infinitely many, and a Schur object (ES5.1) has exactly one (Fargues–Scholze, §IX.5, pp. 328–329). No isomorphism of the excursion algebra with an invariant ring is needed for the idempotents. *Needs:* ES1:finite-ramification.2; ES1:finite-ramification.3; LP2e.9; LP1.2; EnhancedDerivedSheaves E5:presentability.1; ES1:finite-ramification.1.

**Checks.**

- The idempotents are ring idempotents of clopen components, not characteristic functions of arbitrary subsets of points.
- A compact object has finite support among components, and `⊕_c A_c` over infinitely many components is an Ind-object outside `D^ω`.
- At `ℓ = 2` and `G = SL₂` the decomposition exists although the excursion algebra and the invariant ring may differ by nilpotents.

### ES1:finite-ramification.7 Compatibility of finite-wild centres

Prove `center_on_finite_wild_pieces`: for eligible `P′ ⊂ P` the inclusion `D^P ⊂ D^{P′}` intertwines the excursion maps of ES1:finite-ramification.3 through restriction of the universal parameter and of the discretizations; under the centre-order condition it also intertwines the actions of the coordinate rings of the finite-wild pieces. The component summands therefore glue independently of choices. Every compact object is evaluated on some `D^P`; no single `P` serves all objects of the Ind-category (Fargues–Scholze, §IX.5, pp. 328–329; Proposition VIII.3.7, pp. 288–290). *Needs:* ES1:finite-ramification.2; ES1:finite-ramification.3; ES1:finite-ramification.6; LP2e.11; LP2i.3.

**Checks.**

- The transition for `P = P′` is the identity, and for `P″ ⊂ P′ ⊂ P` the transitions compose.
- At a prime excluded by the centre-order condition only the excursion and idempotent statements are asserted.

### Examples

For `G = G_m`, the finite-wild piece of the parameter stack for `P` is `Spec Λ[Eˣ/H] × BG_m`, where `H ⊂ 1 + 𝔪_E` is the image of `P` under `rec_geom⁻¹`. For `Λ = W(F̄_ℓ)[√q]` its connected components are indexed by the characters of the prime-to-`ℓ` part of the finite group `O_Eˣ/H` (the factor `Λ[t, t⁻¹]` from the valuation is connected), and the compact object `j_!(c-Ind_K^{Eˣ} Λ)` with `K ⊃ H` has nonzero components exactly for the characters trivial on `K`.

### Dependencies

ES0; LanglandsParameterStacks LP0, LP1, LP2e, LP2i; HeckeStacksAndLocalShtukas HS1, HS4; VStackSheavesAndLisseCategories VS4; EnhancedDerivedSheaves E5.

## Layer ES1:spectral-center: spectral centres and the spectral centre map

Under the centre-order condition, the invariant-coordinate comparison of LP2i turns the excursion action into an action of the global functions on the parameter stack, landing in the Hecke-compatible part of the centre (Theorem IX.5.2). Without it the excursion algebra still acts, and every field-valued statement about parameters uses that action.

### ES1:spectral-center.1 Spectral, geometric and Hecke-compatible centres

Write `Z_spec(G, Λ) = Γ([Z¹(W_E, Ĝ)_Λ/Ĝ], O)` for the ring of global functions on the parameter stack (the inverse limit over finite-wild pieces, LP1.2; the infinite union is not one affine scheme) and `Z_geom(G, Λ) = Z_enh(D_lis(Bun_G, Λ))`. Define `heckeCenter = Z_geom,Hecke(G, Λ)` as the subalgebra of central elements `z` with `z_{T_V(A)} = T_V(z_A)` for every finite `I`, every `V` and every `A`; the general geometric centre need not satisfy this. Prove `heckeCenter_mem` (the displayed characterization), `heckeCenter_inclusion` (the inclusion into `Z_geom` is an injective `Λ`-algebra map), `heckeCenter_scalars` (scalars of `Λ` are Hecke-compatible, as every `T_V` is `Λ`-linear) and `heckeCenter_comp` (compatibility with two functors gives compatibility with their composite) (Fargues–Scholze, §IX.5, pp. 328–329). In `Suggested.lean`, `heckeCompatibleCentre` is the same condition for a family of additive endofunctors of an ordinary preadditive category. *Needs:* ES0.1; LP1.2; LP2i.1; HS4.1; Mathlib `CatCenter`, `Linear.toCatCenter`.

**Checks.**

- For the family consisting of the identity functor only, the Hecke-compatible centre is the whole centre.
- For `C = Perf(k) × Perf(k)` and the functor exchanging the factors, the centre is `k × k` and the Hecke-compatible centre is the diagonal `k`.
- A scalar `λ` acts by `λ · id` before and after every `Λ`-linear `T_V`.

### ES1:spectral-center.2 The spectral centre map

Assume the centre-order condition. Prove `spectral_to_geometric_center_map`: there is a natural `Λ`-algebra map `Z_spec(G, Λ) → Z_geom,Hecke(G, Λ) ⊂ Z_geom(G, Λ)`, compatible with the component decomposition, which on each compact `A` factors through the coordinate ring of a single finite-wild piece. On each `D^P` it is the excursion map of ES1:finite-ramification.3 composed with the invariant-coordinate comparison `Exc(W, Ĝ) ⊗ Λ ≅ O(Z¹(W, Ĝ)_Λ)^Ĝ`: under the centre-order condition either `ℓ ∤ |π₀Z(G)|`, which is the good-prime condition, and the integral comparison with its base change applies (LP2i.1–LP2i.2, Theorem VIII.3.6), or `ℓ` divides `|π₀Z(G)|` and is then invertible in `Λ`, and the comparison after inverting `ℓ` applies (LP2i.3); the pieces glue by ES1:finite-ramification.6–.7; the Hecke compatibility holds because inserting a Hecke kernel commutes with the creation–Weil–annihilation composite (Fargues–Scholze, Theorem IX.5.2, p. 329). The finite-ramification statement is the factorization on compact objects; no finite-type assertion about the whole stack is made. The stratum composites `Ψ_G^b` are ES7:parabolic.1. *Needs:* ES1:spectral-center.1; ES1:finite-ramification.3; ES1:finite-ramification.6; ES1:finite-ramification.7; LP2i.1; LP2i.2; LP2i.3; HS4.1; GS4:integral-dual-group (the relation between `π₀Z(G)` and the dual root datum).

**Checks.**

- The constant function `1` maps to the identity, and the indicator of a component to its idempotent.
- `z_{T_V(A)} = T_V(z_A)` for the image `z` of every function.
- For `G = GL_n` the condition holds for every `ℓ`; for `G = SL₂` and `Λ = ℤ₂[√q]` it fails and only ES1:spectral-center.4 applies.

### ES1:spectral-center.3 Excursion and centre maps under change of data

Prove `excursion_change_of_data`: for every map of `ℤ_ℓ[√q]`-algebras `Λ → Λ′`, the derived scalar extension of the excursion operator of ES0.3 is the operator obtained by extending its creation map, normalized Hecke kernel, Weil action and annihilation map. The comparison is natural in `A`, coherent for successive coefficient changes, and compatible with stratum restriction and finite-set maps. No flatness or centre-order hypothesis is required: compare the three maps of the composite using HS1.10, retaining their continuous Weil structures. Evaluation on the finite-wild categories agrees with ES1:finite-ramification.3 wherever a common cutoff is chosen. Prove `center_change_of_data` as its consequence when both coefficient rings satisfy the centre-order condition: the actions of `Z_spec` agree through the coefficient map of LP0.1. Refining `Q` to a finite quotient inducing the same pinned action gives the same operator and centre diagrams, and the finite-wild transitions are those of ES1:finite-ramification.7. These are comparison squares; an isomorphism of invariant rings under base change requires the separate hypotheses of LP2i.2 (Fargues–Scholze, Definition VIII.4.2, pp. 291–293, and proof of Theorem IX.7.2, p. 335; HS1.10 for derived coefficient change; Theorem IX.5.2, p. 329, for the centre consequence). *Needs:* ES0.3; HS1.10; HS4.1; LP2e.14; LP0.1; ES1:finite-ramification.3, ES1:finite-ramification.7; ES1:spectral-center.2 and LP2i.1 for the centre consequence only.

**Checks.**

- The identity coefficient map gives the identity comparison, and two successive changes compose.
- For `Λ = ℤ_ℓ[√q] → Q̄_ℓ` the centre square commutes, with no assertion that invariants commute with this base change beyond LP2i.2.
- For `G = SL₂`, `ℓ = 2` and `ℤ₂[√q] → F̄₂`, the excursion operators still commute with derived coefficient change; no spectral-centre map is needed.

### ES1:spectral-center.4 Excursions at excluded primes

Prove `excursion_algebra_without_the_coefficient_condition`: without the centre-order condition, the excursion action of ES1:finite-ramification.3 on each `D^P` and its component idempotents remain, compatible under shrinking `P`, and no map `Z_spec → Z_geom` is asserted by this route. These operators are all that the Schur parameter theorem of ES5 and the operator-level diagrams of ES6:functoriality use (Fargues–Scholze, introduction to §IX.6, p. 330). *Needs:* ES1:finite-ramification.3; ES1:finite-ramification.6; LP2e.9.

**Checks.**

- At `G = SL₂`, `ℓ = 2`, the excursion route and ES5 are available.
- The universal homeomorphism of LP2e.9 is not promoted to an algebra isomorphism.

### Examples

For `G = PGL₂` the centre-order condition is empty, and the spectral centre map exists over `ℤ_ℓ[√q]` for every `ℓ ≠ p`; for `G = SL₂` it exists over `ℤ_ℓ[√q]` exactly for odd `ℓ`, and over `ℚ_ℓ(√q)` for every `ℓ`.

### Dependencies

ES0; ES1:finite-ramification; LanglandsParameterStacks LP0, LP1, LP2e, LP2i; HeckeStacksAndLocalShtukas HS1, HS4; GeometricSatakeAndFusion GS4.

## Layer ES2: the rational spectral action

Over a field of characteristic zero, coherent finite-set Hecke data on a small stable category are the same as an action of perfect complexes on the mapping stack `Map_{BQ}(S, B(Ĝ ⋊ Q))`, for every anima `S` over `BQ` (Theorem X.1.1). Applied to a discretization of a finite-wild quotient of `W_E`, and glued over finite-wild pieces, this constructs the spectral action on `D_lis(Bun_G, L)^ω`. The action exists for every `ℓ ≠ p`; it does not by itself give any equivalence of categories.

### ES2.1 Compactly supported actions

An action of `Perf([Z¹(W_E, Ĝ)_Λ/Ĝ])` on a small stable category `C` is compactly supported if for each `X ∈ C` the orbit functor `M ↦ M ∗ X` factors, up to coherent equivalence, through restriction to `Perf([Z¹(W_E/P, Ĝ)_Λ/Ĝ])` for some eligible `P` depending on `X` (`compactlySupportedAction`). This is a property of the action and of its orbit functors, not the choice of one `P` for the whole category; it uses the open and closed exhaustion of LP1.2. Prove `compactAction_factor` (for each `X` there are `P`, an exact orbit functor on the `P`-piece and an equivalence of its composite with the given orbit functor), `compactAction_refine` (a factorization through `P` gives one through every smaller eligible `P′`) and `compactAction_finite_sum` (finitely many orbit functors have a common refined cutoff, which serves their direct sum) (Fargues–Scholze, opening of Chapter X, p. 339). *Needs:* LP1.2; EnhancedDerivedSheaves E5:abstract, E5:presentability.

**Checks.**

- The orbit functor of the zero object factors through every piece.
- An action pulled back from a single finite-wild piece is compactly supported.
- For the direct sum of copies of `Perf(k)` indexed by parameters of unbounded wild conductor, each object of finite support has a cutoff, no single cutoff serves every object, and objects of the Ind-category may have none.

### ES2.2 The Hecke family of the universal parameter

Let `H` be reductive over a field `L` of characteristic zero with an action of a finite group `Q`, and `S → BQ` an anima. Construct `universalHeckeFamily`: evaluation `S × Map_{BQ}(S, B(H ⋊ Q)) → B(H ⋊ Q)` gives, functorially in finite sets `I` (as a map of total spaces of coCartesian fibrations over `Fin`), exact `Rep_L(Q^I)`-linear monoidal functors `Rep_L((H ⋊ Q)^I) → Perf(Map_{BQ}(S, B(H ⋊ Q)))^{S^I}`; composing with an action gives its coherent Hecke family. Prove `universalHecke_eval` (at a point `(s, ρ)` the bundle of `V` is `V` evaluated at `ρ(s)`), `universalHecke_unit` (the trivial representation gives the unit family), `universalHecke_fusion` (compatibility with tensoring legs along maps of finite sets) and `universalHecke_pullback` (for `S′ → S` over `BQ`, restriction of the universal parameter carries one family to the other) (Fargues–Scholze, Theorem X.1.1 and its setup, pp. 340–342). The mapping stack and its `Perf` are the derived constructions of LP1.7, and the representation bundles are those of LP4.1. *Needs:* LP1.7; LP4.1; EnhancedDerivedSheaves E5:abstract; GS4:integral-dual-group.

**Checks.**

- The empty leg set gives the tensor unit.
- For `Q = 1` and `S` a point, the family is the tautological representation bundle on `BH`.
- For `S = BF₁` with generator mapping to `σ ∈ Q`, the family on `[H/H]_σ` has generator acting on `V` by `hσ`, with `H` acting by `σ`-twisted conjugation.

### ES2.3 Tensor products for pushouts of affine quotients

Let `G` be a pro-reductive affine group over a field `L` of characteristic zero acting on affine derived `L`-schemes `X₀, X₁, X₂` with equivariant maps `X₁ → X₀ ← X₂`. Prove `pushout_of_affine_quotients`: the natural symmetric monoidal functor `Perf(X₁/G) ⊗_{Perf(X₀/G)} Perf(X₂/G) → Perf((X₁ ×^R_{X₀} X₂)/G)` is an equivalence, the tensor product being the pushout among `L`-linear symmetric monoidal small idempotent-complete stable ∞-categories. Proof: pass to Ind and to modules over the equivariant coordinate algebras in `Ind Perf(BG)` (LP4.3 in its affine-quotient form, a contract), compute the relative tensor product by the derived tensor product of algebras (E5:presentability.2), and identify compact objects by generation by representations and exactness of invariants in characteristic zero (Fargues–Scholze, proof of Lemma X.1.2, p. 343). *Needs:* EnhancedDerivedSheaves E5:abstract.5, E5:presentability.2; LP1.7; LP4.3; LP3 (characteristic-zero generation, contract).

**Checks.**

- For `G = 1` this is `Perf(A₁) ⊗_{Perf(A₀)} Perf(A₂) ≃ Perf(A₁ ⊗^L_{A₀} A₂)`.
- For `X_i = Spec L` the comparison is the unit equivalence.

### ES2.4 Colimits of perfect complexes on rational mapping stacks

Prove `mapping_stack_commutes_with_sifted_colimits`: under the hypotheses of ES2.2, `F(S) = Perf(Map_{BQ}(S, B(H ⋊ Q)))` preserves sifted colimits in `S` as a functor to `L`-linear small idempotent-complete stable ∞-categories, and all colimits as a functor to symmetric monoidal such categories. Reduce to the untwisted case by the `Q`-torsor description, write the mapping stacks as inverse limits of affine quotients by pro-reductive groups, compare `Perf` with the filtered colimit using generation by representations and vanishing of higher cohomology of pro-reductive groups, and treat finite coproducts and pushouts by ES2.3 (Fargues–Scholze, Lemma X.1.2, pp. 342–343). The two targets and their two colimit statements are distinct, and no integral analogue for actual `Perf` of a mapping stack is asserted (that fails; ES3 uses an approximation). *Needs:* ES2.3; LP1.7; LP3; EnhancedDerivedSheaves E5:presentability.

**Checks.**

- For `H = 1`, `F(S) = Perf(L)` for every `S`.
- For a DVR the corresponding statement for actual `Perf` fails, which is why ES3 works with `F♮`.

### ES2.5 The rational universal action theorem

Prove `universal_action_theorem` (Fargues–Scholze, Theorem X.1.1, pp. 341–342, with Lemma X.1.2): for `H`, `Q` as in ES2.2, every anima `S` over `BQ` and every small idempotent-complete stable `L`-linear `C`, the anima of `L`-linear actions of `Perf(Map_{BQ}(S, B(H ⋊ Q)))` on `C` is equivalent to the anima of coherent finite-set families of exact `Rep_L(Q^I)`-linear monoidal functors `Rep_L((H ⋊ Q)^I) → End_L(C)^{S^I}`; the forward map composes with the universal family of ES2.2, and both composites are equivalent to the identity as maps of anima, not only on isomorphism classes. Proof: both sides send sifted colimits in `S` to limits (ES2.4); reduce to finite `S` and trivialize the `Q`-torsor, so that `Perf(BH^S)` is generated by representations; in characteristic zero the representation category is semisimple, and Yoneda identifies monoidal functors out of `Rep(H^S)` with actions; recover the unit, tensor, finite-set and higher coherences from the universal property and descend along the `Q`-torsor. *Needs:* ES2.2; ES2.4; EnhancedDerivedSheaves E5:abstract, E5:presentability; LP1.7.

**Checks.**

- For `S` a point both sides are `Rep_L(H)`-module structures on `C`.
- For `S = BF₁` and a nontrivial `σ ∈ Q`, the actions are those of `Perf([H/H]_σ)` with twisted conjugation.
- No integral statement follows by inverting `ℓ`.

### ES2.6 The rational spectral action on `Bun_G`

Prove `spectral_action_rational`: for every field `L` over `ℚ_ℓ(√q)`, with no condition relating `ℓ` and `π₁(Ĝ)`, the Hecke family of HS4.1 gives a natural compactly supported `L`-linear action of `Perf([Z¹(W_E, Ĝ)_L/Ĝ])` on `D_lis(Bun_G, L)^ω`, uniquely characterized as coherent data by the requirement that its composite with the universal representation bundles is the Hecke action. Proof: for each compact `A` use ES1:finite-ramification.2 and restrict the Hecke family to a discretization `W ⊂ W_E/P`; apply ES2.5 with `S = BW`, identifying the mapping stack with `[Z¹(W, Ĝ)_L/Ĝ]` (LP0.4, LP1.7); glue over finite-wild pieces by uniqueness and the clopen transitions; the orbit of `A` factors through its cutoff (Fargues–Scholze, Corollary X.1.3, p. 343). The existence of the action does not give full faithfulness of the action functor or any categorical correspondence. *Needs:* ES2.5; ES2.1; ES1:finite-ramification.2; LP0.4; LP1.7; LP4.2; HS4.1.

**Checks.**

- The unit representation acts as the identity and a torus character acts through the universal character.
- For a direct sum of two compacts the common refined cutoff of ES2.1 is used.

### ES2.7 Agreement of the action with the spectral centre map

Prove `degree_zero_center_agreement`: in the rational range, the map from global functions on the parameter stack to `Z_enh(D_lis)` induced by ES2.6 equals the map of ES1:spectral-center.2. On every finite-wild piece, the action of each universal invariant matrix coefficient is its creation–Weil–annihilation operator, because pulling representation bundles back along universal evaluation recovers exactly the normalized Hecke operators with the chosen `√q`; LP2e.14 then identifies the algebra maps, and the comparison glues and extends to Ind by ES0.1 (Fargues–Scholze, Corollary X.1.3, p. 343, and Theorem IX.5.2, p. 329). *Needs:* ES2.6; ES2.2; ES1:spectral-center.2; LP2e.14; LP2i.1; HS4.1; ES0.1.

**Checks.**

- Scalars and component idempotents have the same images under both maps.
- Changing `√q` to `−√q` changes the Hecke operators by the unramified sign character on the components of odd `⟨2ρ, μ⟩` and changes both maps compatibly.

### ES2.8 The Whittaker sheaf

For quasi-split `G` with a Whittaker datum `(B, U, ψ)` (SR.2.3), construct `whittakerSheaf`: `W_ψ = j_!(c-Ind_{U(E)}^{G(E)} ψ)` in `D_lis(Bun_G, Λ)`, supported on the open stratum, over coefficients containing the values of `ψ` (the source uses `Q̄_ℓ`, and `O_L[1/|π₀Z(G)|]` in the integral setting). Compact induction from the closed subgroup `U(E)` means support compact modulo `U(E)` (SR.2.1), not induction from an open subgroup. Prove `whittakerSheaf_restrict` (restriction to `Bun_G^1` is `c-Ind_{U(E)}^{G(E)} ψ`), `whittakerSheaf_support` (restriction to the complement of the open stratum is zero), `whittakerSheaf_datum_iso` (an isomorphism of Whittaker data gives an isomorphism of sheaves through the corresponding intertwiner) and `whittakerSheaf_ind_action` (the colimit-preserving extension of the spectral action acts on `W_ψ`; no compactness of `W_ψ` is needed) (Fargues–Scholze, §X.1, pp. 343–346; §X.3, p. 350). The construction asserts neither compactness nor any equivalence of categories. *Needs:* SR.2.1 *compact-induction*; SR.2.3 *whittaker-functionals*; SR.0.2; VS4.2; VS4.3; EnhancedDerivedSheaves E5:presentability; ES2.6.

**Checks.**

- For a torus `T`, `U = 1` and `ψ = 1`, `W_ψ` is the extension by zero of the regular representation `c-Ind_1^{T(E)} Λ`, not of the trivial character.
- For `G = 1`, `W_ψ` is the constant rank-one object on the single stratum.
- `j^* W_ψ` is SR.2.1's compact induction with its right-translation convention.

### Examples

For `G = G_m` over `L = Q̄_ℓ`, `[Z¹(W_E, G_m)_L/G_m] = Z¹(W_E, G_m)_L × BG_m`, and `D_lis(Bun_{G_m}, L)^ω = ⊕_{d∈ℤ} D(Eˣ, L)^ω` over the degree `d`. Functions on `Z¹(W_E, G_m)_L`, that is on continuous characters of `Eˣ`, act on each degree through the Bernstein centre of `Eˣ` (ES6:functoriality.7), and the line bundle of weight `n` on `BG_m` acts by the Hecke operator of `Std^{⊗n}`, which shifts the degree by `n`.

### Dependencies

ES0; ES1:finite-ramification; ES1:spectral-center; LanglandsParameterStacks LP0, LP1, LP2e, LP2i, LP3, LP4; HeckeStacksAndLocalShtukas HS4; VStackSheavesAndLisseCategories VS4; SmoothRepresentationsOfLocalGroups SR.0, SR.2; GeometricSatakeAndFusion GS4; EnhancedDerivedSheaves E5.

## Layer ES3: the integral spectral action

Integrally, actual perfect complexes on mapping stacks do not commute with colimits, so the universal theorem is proved for the sifted-colimit approximation `F♮` of LP3.18, computed for free and discrete groups, and compared with the parameter stack under the good-prime condition by the generation theorem of LP4 (Fargues–Scholze, §X.3).

### ES3.1 Universal evaluation on the integral approximation

Let `R` be a DVR, `H` split reductive over `R` with an action of a finite `Q`. For an anima `S` over `BQ`, `F♮(S)` is the sifted-colimit-preserving extension to anima over `BQ` of `S ↦ Perf(Map_{BQ}(S, B(H ⋊ Q)))` on finite sets with `Q`-torsors, with its comparison `κ_S : F♮(S) → F(S)` (LP3.18; it is a categorical approximation, not a new mapping scheme, and need not equal `F(S)` integrally). Construct `perfApprox_evaluation`: the universal evaluation families, built as in ES2.2 but over `R` on finite sets with `Q`-torsors (where the mapping stacks are classifying stacks of products of copies of `H`), extend by animation to coherent finite-set families `Rep_R((H ⋊ Q)^I) → F♮(S)^{S^I}` compatible with `κ`, and recover the finite-set families (Fargues–Scholze, §X.3, pp. 348–349). *Needs:* LP3.18; LP4.1; EnhancedDerivedSheaves E5:abstract, E5:presentability, E5:animation.1.

**Checks.**

- At the empty anima, `F♮` is `Perf(R)` and the family is the unit.
- For `Q = 1` and `S` a point, `κ_S` identifies `F♮(S)` with `Perf(BH)` and the family is the tautological one.
- After scalar extension to a field of characteristic zero, `κ` is an equivalence by ES2.4 and the family is that of ES2.2.

### ES3.2 The integral universal action on the approximation

Prove `integral_universal_action` (Fargues–Scholze, Proposition X.3.1, pp. 348–349): for `R`, `H`, `Q`, `S` as in ES3.1 and a small idempotent-complete stable `R`-linear `C`, the anima of `R`-linear actions of `F♮(S)` on `C` is equivalent to the anima of coherent finite-set families of exact `Rep_R(Q^I)`-linear monoidal functors `Rep_R((H ⋊ Q)^I) → End_R(C)^{S^I}`, through ES3.1. No good-prime condition enters. Proof: on finite `Q`-torsor sets repeat ES2.5, using that `Perf(BH)` is freely generated as a stable category by the exact category of representations (LP3 `perf_classifying_stable_envelope_DVR`); animate both sides, since mapping into `C` turns sifted colimits into limits. `F♮` is not to be replaced by actual `Perf` before the comparison of ES3.6. *Needs:* ES3.1; LP3.18; requested LP3 `perf_classifying_stable_envelope_DVR`; EnhancedDerivedSheaves E5:abstract, E5:presentability.

**Checks.**

- For `S` a point and for the empty leg set the statement reduces to `Rep_R(H)`-module structures and to the unit.
- For `R = ℤ_ℓ` and `ℓ` dividing `|π₁(H)_tors|` the approximation still has this universal property.

### ES3.3 Colimits of the integral approximation

Prove `approximation_commutes_with_colimits` (Fargues–Scholze, Proposition X.3.2, p. 349): `F♮` preserves all colimits, as a functor from anima over `BQ` to `R`-linear symmetric monoidal small idempotent-complete stable ∞-categories. Besides its defining sifted colimits, this needs the finite coproduct identity `Perf(BH^{S₁}) ⊗_{Perf(R)} Perf(BH^{S₂}) ≃ Perf(BH^{S₁ ⊔ S₂})`, which is proved here from the filtration of `Perf(BH)` by highest weights, whose graded pieces are copies of `Perf(R)` (requested LP3 `perf_classifying_highest_weight_filtration_DVR`), without inverting `ℓ`. *Needs:* ES3.1; LP3.18; requested LP3 `perf_classifying_highest_weight_filtration_DVR`; EnhancedDerivedSheaves E5:presentability.2, E5:animation.1.

**Checks.**

- For `H = 1` the functor is constantly `Perf(R)`, the initial `R`-linear symmetric monoidal category.
- The argument works over `ℤ_ℓ` with no condition on `ℓ`.

### ES3.4 The free-group case

Prove `free_group_case` (Fargues–Scholze, Proposition X.3.3, pp. 349–350): for `S = BF_n → BQ` with generators mapping to `σ_1, …, σ_n ∈ Q`, the actual mapping stack is `[H^n/H]` with `h · (g_i) = (h g_i σ_i(h)⁻¹)`, `F♮(BF_n)` is the category of compact modules over `O(H^n)` in `Ind Perf(BH)` with this twisted action, and `κ_{BF_n}` is fully faithful with image the thick idempotent-complete subcategory generated by `Rep_R(H)`. Write `BF_n` as a colimit of circles and apply ES3.3; for one circle compute the relative tensor product of `Perf(BH)` over `Perf(BH²)` along the diagonal and the twisted diagonal by Barr–Beck–Lurie; take products over the generators. Whether this image is all of actual `Perf` is the generation question of LP4.2, not part of this statement. This differs from LP3.19 by working over a DVR rather than an algebraically closed field of characteristic `ℓ`. *Needs:* ES3.3; EnhancedDerivedSheaves E5:abstract.5, E5:presentability.2; LP3; LP1.7.

**Checks.**

- For `n = 0` the result is `Perf(BH)`.
- For `n = 1` and `σ₁ ≠ 1` the conjugation is twisted by `σ₁`.
- Full faithfulness of `κ` here is not full faithfulness of any action functor on `Bun_G`.

### ES3.5 The discrete-group module presentation

Prove `discrete_group_presentation` (Fargues–Scholze, Proposition X.3.4, p. 350): for a discrete group `Γ → Q`, present `BΓ` as the sifted colimit of `BF_n` over maps `F_n → Γ` in anima over `BQ` (the index of LP2e.7, including rank zero and all word maps); then `F♮(BΓ)` is the category of compact modules over `colim_{F_n → Γ} O(H^n)` in `Ind Perf(BH)`, with the twists induced by `Γ → Q`. The colimit is taken among animated equivariant algebras; the degree-zero colimit of invariant rings does not replace it. The step from ES3.4 and ES3.3 to compact modules over the colimit algebra is the E5:presentability contract for sifted diagrams of animated coordinate algebras. *Needs:* ES3.4; ES3.3; LP2e.7; EnhancedDerivedSheaves E5:presentability, E5:animation.1.

**Checks.**

- For `Γ = F_n` this is ES3.4.
- For a group with a nontrivial relation the animated colimit keeps the derived information that the degree-zero quotient loses.

### ES3.6 The integral discrete-group comparison

Let `Λ` be the ring of integers of a finite extension of `ℚ_ℓ(√q)` and assume the good-prime condition. Prove `discrete_integral_spectral_action` (Fargues–Scholze, Theorem X.0.2, p. 340, and the end of §X.3, p. 350): for a discretization `W` of `W_E/P` with its map to `Q`, `κ_{BW}` identifies `F♮(BW)` with `Perf([Z¹(W, Ĝ)_Λ/Ĝ])`; consequently the action anima of that `Perf` on `C` is the anima of coherent finite-set Hecke data for `W`. The colimit algebra of ES3.5 is LP4.3's cocycle algebra, and LP4.2's generation identifies all of `Perf`, not only the representation-generated part; this is the one step that uses the good-prime condition, and it is proved without inverting `ℓ`. *Needs:* ES3.5; ES3.2; LP4.2; LP4.3; LP2i.1; LP0.4.

**Checks.**

- For `Ĝ = G_m` the hypothesis holds for every `ℓ ≠ p`.
- For `Ĝ = PGL_ℓ` the comparison is not asserted: over `F̄_ℓ` and `W = ℤ` the unit skyscraper of LP4.2 is not generated by representations.

### ES3.7 The integral spectral action on `Bun_G`

Prove `integral_spectral_action` (Fargues–Scholze, Theorem X.0.1, pp. 339–340, and the end of §X.3, p. 350): with `Λ` as in ES3.6 and the good-prime condition, for every small idempotent-complete stable `Λ`-linear `C`, endowed with the relatively discrete condensed enrichment induced by its `Λ`-linear mapping objects, the anima of compactly supported actions of `Perf([Z¹(W_E, Ĝ)_Λ/Ĝ])` on `C` is equivalent to the anima of coherent continuous `W_E^I`-equivariant finite-set Hecke data on `C`. Applied to the Hecke family of HS4.1 on `C = D_lis(Bun_G, Λ)^ω`, it constructs the integral spectral action. The rational version over fields above `ℚ_ℓ(√q)` holds for every `ℓ ≠ p` (ES2.6). Proof: factor each compact Hecke orbit through a finite-wild quotient by the argument of ES1:finite-ramification.2 (for general `C`, prove the same factorization in its induced relatively discrete enrichment: on a tensor generator the image of compact inertia lies in a finite `ℤ_ℓ`-submodule of its endomorphism algebra, and a sufficiently small pro-`p` subgroup acts trivially; Fargues–Scholze, p. 340), choose a discretization and apply ES3.6, glue over finite-wild pieces by intrinsic restriction and extension of cocycles and coherent uniqueness, and specialize to the normalized Hecke family. *Needs:* ES3.6; ES2.1; ES1:finite-ramification.2; LP0.4; LP4.2; HS4.1; EnhancedDerivedSheaves E5:abstract.

**Checks.**

- Rationalizing the integral action gives the action of ES2.6, by uniqueness for the same Hecke family.
- At a prime excluded by the good-prime condition, the approximation action of ES3.2 and the excursion operators remain, and this comparison is not asserted.

### ES3.8 Compatibilities of the integral action

Prove `action_change_of_data`: for the integral action, extensions of DVR coefficient rings satisfying the hypotheses of ES3.6, refinements of the finite quotient `Q`, and shrinking of finite-wild cutoffs induce comparison functors, and whenever the base-change functors for `Perf` of the parameter stack (LP1, LP4.1) and for the Hecke kernels (HS1.10) are supplied, the two actions are coherently equivalent, because their universal representation families coincide; the comparisons satisfy identity, composition and pairwise commutation, and the induced action of degree-zero functions agrees with ES1:spectral-center.2 under the centre-order condition (Fargues–Scholze, Theorem X.0.1, pp. 339–340; Proposition X.3.1, pp. 348–349). The comparison is through the integral universal evaluation of ES3.1 and LP4.1; the characteristic-zero family of ES2.2 is not an integral input. No unrestricted commutation of `Perf` with scalar extension is asserted. *Needs:* ES3.7; ES3.2; ES3.1; ES1:spectral-center.2; LP2i.1; LP4.1; LP4.2; HS4.1.

**Checks.**

- The identity extension, a tower of two extensions, and changing `Q` before or after shrinking `P` give the same comparisons.
- The comparison of centres keeps the centre-order condition as a separate hypothesis.

### ES3.9 Derived reduction and rationalization

Prove `derived_reduction_and_rationalization`: given the integral action and a coefficient map `Λ → B`, if the pullback `Perf([Z¹_Λ/Ĝ]) → Perf([Z¹_B/Ĝ])` exhibits the target as the scalar extension (requested LP1 `finite_wild_perf_coefficients`), then tensoring the action gives a `B`-linear action on `C_B = C ⊗_Λ B` inducing the scalar-extended Hecke family. This covers rationalization, where uniqueness in ES2.6 identifies the result, and, conditional on the requested derived comparisons, `B = Λ/ℓ`. Identifying `C_B` with `D_lis(Bun_G, B)` uses requested VS3 `lisse_category_coefficients` and HS1 `normalized_hecke_kernel_coefficients`; this is not a new instance of Theorem X.0.1 for arbitrary `B` (Fargues–Scholze, Theorem X.0.1, pp. 339–340; §IX.2, pp. 321–322). Tensor products are derived; ordinary reduction is not substituted for derived reduction. *Needs:* ES3.8; ES2.6; EnhancedDerivedSheaves E5:presentability.2; LP1.7; VS3.3; HS1.10; requested LP1 `finite_wild_perf_coefficients`, VS3 `lisse_category_coefficients` and HS1 `normalized_hecke_kernel_coefficients`.

**Checks.**

- For `B = Λ[1/ℓ]` the induced action is the rational action of ES2.6.
- For `B = Λ/ℓ` the derived tensor product `Λ/ℓ ⊗^L_Λ −` is used; an argument with the underived quotient fails on objects with `ℓ`-torsion.

### Examples

For `G = PGL₂` the dual `SL₂` has trivial `π₁`, so the integral action exists for every `ℓ ≠ p`; for `G = SL₂` and `ℓ = 2` only the rational action of ES2.6 and the approximation action of ES3.2 exist.

### Dependencies

ES1:finite-ramification; ES1:spectral-center; ES2; LanglandsParameterStacks LP0, LP1, LP2e, LP2i, LP3, LP4; HeckeStacksAndLocalShtukas HS1, HS4; VStackSheavesAndLisseCategories VS3; EnhancedDerivedSheaves E5.

## Layer ES5: Schur objects and their semisimple parameters

An object of `D_lis(Bun_G, L)` whose condensed endomorphism algebra is the scalars receives a continuous semisimple L-parameter, characterized by its excursion operators (Definition/Proposition IX.4.1). Irreducible smooth representations of every `G_b(E)` give such objects through the stratum extension. The construction uses the global excursion operators of ES0.3 and their condensed scalar families, so it works over every algebraically closed `ℤ_ℓ[√q]`-field, in characteristic `0` or `ℓ`, with no good-prime or centre-order condition. The abstract statement for a discrete group acting on an ordinary or stable category (Corollary VIII.4.3) is LP2c.8.

### ES5.1 Schur irreducibility

Let `L` be an algebraically closed `ℤ_ℓ[√q]`-field with its relatively discrete condensed structure, and for `A ∈ D_lis(Bun_G, L)` let `End(A)` be the condensed algebra of degree-zero endomorphisms (from the enrichment of HS1.8 for compact `A`, and the induced enrichment in general). Define `IsSchurIrreducible A`: the scalar unit `L → End(A)` is an isomorphism of condensed `L`-algebras. An abstract isomorphism `End(A)(*) ≅ L` of global sections does not suffice. Prove `IsSchurIrreducible.scalarIso` (inverting the unit gives the canonical isomorphism), `IsSchurIrreducible.scalar_unique` (over every profinite test object `S`, each endomorphism section is the image of exactly one scalar section), `IsSchurIrreducible.sections_bijective`, `IsSchurIrreducible.iso_invariant` (a scalar-preserving isomorphism of endomorphism algebras preserves and reflects the condition) and `IsSchurIrreducible.shift` (shifts preserve it, through the canonical unit-preserving isomorphism of endomorphism algebras) (Fargues–Scholze, Definition/Proposition IX.4.1, p. 327; Proposition IX.1.2, pp. 320–321). In `Suggested.lean`, `IsSchurIrreducible` is invertibility of a given morphism in `Condensed (AlgCat L)`. *Needs:* HS1.8; Mathlib `Condensed`, `AlgCat`, `CategoryTheory.IsIso`.

**Checks.**

- The identity unit of the scalar algebra is Schur.
- The zero object is not Schur: its endomorphism algebra has `0 = 1`, while `L` does not.
- A unit that fails to be bijective on the sections over one test object is not Schur, whatever holds on global sections.

### ES5.2 The scalar excursion character

For any Schur `A`, construct `excursionCharacter`: evaluate the global excursion operators of ES0.3 on `A` and apply the inverse scalar unit. The abstract relations of LP2e.10 and LP2e.15, applied to the abstract group underlying `W_E` with its prescribed projection to `Q`, give an `L`-algebra map `χ_A : Exc(W_E^disc, Ĝ) ⊗ L → L`. Here `W_E^disc` denotes that underlying abstract group, not a dense discretization of a finite-wild quotient. Retain the original continuous Weil action to obtain the family `Θ_n : Inv_n → Map(W_E^n, L)` for `n ≥ 1`, where `Inv_n = O((Ĝ ⋊ Q)^n // Ĝ)` is linear over `O(Q^n)` through `W_E → Q`. For `g : [m] → [n]` the reindexing relation reads `Θ_n(g^* f)(γ) = Θ_m(f)(γ ∘ g)`, and for ordered fibre multiplication `μ_g : (Ĝ ⋊ Q)^m → (Ĝ ⋊ Q)^n`, `m_g : W_E^m → W_E^n` (the product, in order, of the entries in each fibre of `g`) the multiplication relation reads `Θ_m(μ_g^* f)(γ) = Θ_n(f)(m_g γ)`, with empty fibres contributing the identity. The family is a family of maps of condensed sets on `W_E^n`. Use the integral excursion algebra and its relations (LP2e.10); its torsion-free universal property applies only to flat targets and is not used for a field of characteristic `ℓ`. Inversion is the relation obtained by inserting an inverse pair. Prove `excursionCharacter.apply` (on a coefficient `x`, `χ_A(x)` is the scalar of its operator), `excursionCharacter.scalar_linear` (scalars of `L` are fixed and `Θ_n` is `O(Q^n)`-linear with the prescribed evaluation), `excursionCharacter.family`, `excursionCharacter.pullback`, `excursionCharacter.multiplication`, `excursionCharacter.condensed` (an operator family in the condensed endomorphism algebra has exactly one scalar family whose image under the unit is that family) and `excursionCharacter.ext` (characters agreeing on generating coefficients are equal) (Fargues–Scholze, Proposition VIII.3.7, pp. 288–289; proof of Proposition VIII.3.8, p. 290; Definition/Proposition IX.4.1, p. 327). In `Suggested.lean`, `excursionCharacter` is the degree-zero composite with `excursionCharacter_spec` as its defining identity. *Needs:* ES5.1; ES0.3; LP2e.9, LP2e.10, LP2e.15; HS1.5; HS1.8; HS4.1; Mathlib `AlgHom`.

**Checks.**

- The unit coefficient has value `1`.
- An inverse pair, identified with the identity coefficient by the universal relations, has the same value as the identity coefficient.
- If two ordered-word coefficients have different operators, their values differ: an extraction that forgets the order of the legs fails this.
- The construction applies to a noncompact Schur object without choosing a common finite-wild cutoff for its Hecke family. For compact `A ∈ D^P`, restriction to a discretization of `W_E/P` agrees with ES1:finite-ramification.3.

### ES5.3 The continuous parameter of a Schur sheaf

Prove `parameter_of_a_schur_irreducible_sheaf` (Fargues–Scholze, Definition/Proposition IX.4.1, p. 327): for every algebraically closed `ℤ_ℓ[√q]`-field `L` and every Schur `A ∈ D_lis(Bun_G, L)`, with no compactness, good-prime or centre-order hypothesis, there is exactly one `Ĝ(L)`-conjugacy class of continuous semisimple parameters `φ_A : W_E → Ĝ(L) ⋊ Q` lifting `W_E → Q` such that for every excursion datum `(I, V, α, β, (γ_i))` the creation–Weil–annihilation endomorphism of `A` is the scalar `β ∘ V((φ_A(γ_i))_i) ∘ α`. Proof: the family of ES5.2 satisfies the two relations and the prescribed projection; the classification of LP2c.5 (all three clauses of Proposition VIII.3.8: semisimple conjugacy classes, points of the coarse quotient and condensed character families) gives `φ_A`, the finite-anchor argument in the proof of Proposition VIII.3.8 gives continuity in characteristic `ℓ` (in characteristic zero Lafforgue's Proposition 11.7 and Lemma 11.10 is the model; its Reynolds-operator step is not used in characteristic `ℓ`), and injectivity of the classification gives uniqueness (Fargues–Scholze, proof of Proposition VIII.3.8, p. 290; Lafforgue 2018, Proposition 11.7 and Lemma 11.10, pp. 143–147). The objectwise statement for discrete groups is LP2c.8. The output is a semisimple parameter: it carries no monodromy operator and no packet. *Needs:* ES5.2; LP2c.5 (with the LP2c contract); LP2c.8; LP0.2.

**Checks.**

- The reconstruction uses simultaneous invariants of tuples; traces of single elements do not determine a parameter for general `Ĝ`.
- For `G = 1` and `Q = 1` every Schur object is `L` up to shift and its parameter is the trivial one.
- For `G = G_m` the parameter of the Schur object `j_!(χ)` of a smooth character `χ` is `χ ∘ rec_geom⁻¹` (ES6:functoriality.7).

### ES5.4 Independence of the stratum extension

Prove `stratum_centre_embedding_independence`: let `R = i_b^*` and let `e_!` and `e_*` be enriched fully faithful left and right extensions along the stratum, with `e_! ⊣ R ⊣ e_*` and retractions `R e_! ≅ id ≅ R e_*`. The canonical comparison `τ : e_! → e_* R e_! ≅ e_*` restricts to the identity, so for every natural endomorphism `z` of the identity of `D_lis(Bun_G, L)`, naturality along `τ` gives `R(z_{e_! X}) = R(z_{e_* X})` after the retractions. The same argument compares any two extensions carrying such a retraction comparison; hence all eligible extensions give the same restricted centre action, the same excursion character and the same parameter. The comparison of the restrictions must be the specified invertible retraction (full faithfulness of two unrelated functors does not suffice), and the enriched comparison keeps the condensed scalars; the existence and lisse preservation of the right extension are the VS4 contract (Fargues–Scholze, Definition IX.7.1 and the paragraph before it, p. 334). In `Suggested.lean` this is `stratum_centre_embedding_independence`, stated for ordinary categories. *Needs:* ES5.1; VS4.2; VS4.3; LP2c.5; Mathlib `CatCenter`, `Adjunction`.

**Checks.**

- For the open stratum, `j_!` and its eligible right extension give the same action.
- Pullback to a nonbasic stratum is not asserted to commute with all Hecke operators.

### ES5.5 Condensed Schur irreducibility of smooth representations

Prove `condensed_schur_from_admissibility`: let `L` be algebraically closed of characteristic different from `p` and `π` an irreducible smooth `L`-representation of `G_b(E)`, admissible by the requested SR target `irreducible_smooth_admissible_ne_p`. Then `L → End_{G_b(E)}(π)` is an isomorphism of abstract `L`-algebras and, through the relatively discrete dictionary between representations and sheaves with its enriched mapping objects, of condensed algebras; its image under the enriched stratum extension `L_b` is Schur. Proof: choose a nonzero vector fixed by an open pro-`p` subgroup `K`; `π^K` is finite dimensional and generates `π`; an equivariant endomorphism has an eigenvalue on `π^K`, and its difference with that scalar has nonzero invariant kernel, hence vanishes; for a condensed family of endomorphisms evaluate on the vector inside the finite-dimensional relatively discrete `π^K` and extract the scalar by a linear coordinate, which is a morphism of condensed algebras inverse to the unit by the HS1 contract; transport through `L_b`, whose unit preserves scalars (VS4 contract). The argument works for the countable field `F̄_ℓ`, where no uncountability shortcut exists; compactness of `π` is not assumed (Fargues–Scholze, Definition/Proposition IX.4.1 and Definition IX.7.1, pp. 327, 334). *Needs:* ES5.1; SR.0.4 *admissible*; requested SR `irreducible_smooth_admissible_ne_p`, `admissible_irreducible_scalar_end`; SR.2.1; VS4.2; VS4.3; VS4.4; HS1.8; Tau Ceti `TauCeti.IsSmoothDiscrete`, `TauCeti.SmoothDiscreteTopRep`; Mathlib `Representation.IntertwiningMap`.

**Checks.**

- The trivial one-dimensional representation is Schur, by the same argument and not by compactness.
- A field of characteristic zero over `ℤ_ℓ` contains `ℚ_ℓ` and is uncountable; `F̄_ℓ` is countable, and the eigenvector argument is the one that covers it.

### ES5.6 The parameter of an irreducible smooth representation

For `b ∈ B(G)` and irreducible smooth `π` of `G_b(E)` over `L`, construct `parameterOfRepresentation`: under VS4's equivalence `D(G_b(E), L) ≃ D_lis(Bun_G^b, L)` and the fully faithful left adjoint `L_b = π_{b♮} q_b^*` of `i_b^*` with `i_b^* L_b = id` (Proposition VII.7.2), `L_b(π)` is Schur by ES5.5, and `φ_{G,b,π} = φ_{L_b(π)}` is a conjugacy class of parameters; for `b = 1`, `L_1 = j_!` and write `φ_π`. Prove `parameterOfRepresentation.eval` (the invariant character of the parameter is the excursion character of `π`), `parameterOfRepresentation.defining_identity` (each excursion operator acts on `π` by its scalar), `parameterOfRepresentation.embedding_independent` (eligible extensions with equal restricted centre action give the same class, by ES5.4), `parameterOfRepresentation.iso_invariant` and `parameterOfRepresentation.at_basepoint` (Fargues–Scholze, Proposition VII.7.2, pp. 272–273; Definition IX.7.1, p. 334). `♮` is relative homology, not a shriek functor. *Needs:* ES5.5; ES5.3; ES5.4; VS4.2; VS4.3; VS4.4; SR.0.2; Mathlib `Representation.IntertwiningMap`.

**Checks.**

- At `b = 1` the parameter is the reconstruction of the excursion character restricted along `j_!`.
- Two eligible extensions with the same restricted centre action give the same class.
- For `G = 1`, `Q = 1` and the one-dimensional `L`, the parameter is the unique section into the trivial dual group.

### ES5.7 Isomorphism invariance and coefficient transport

Prove `invariance_and_coefficient_transport`: isomorphic Schur sheaves, and isomorphic irreducible smooth representations, have the same parameter class. If `L → L′` is an extension of algebraically closed coefficient fields, the unrestricted operator comparison `excursion_change_of_data` of ES1:spectral-center.3 is used, and `A_{L′}` is again Schur, then `φ_{A_{L′}}` is the image of `φ_A`; for representations impose the same hypotheses after extension. This is a comparison under those hypotheses; preservation of Schur irreducibility by scalar extension is not asserted (Fargues–Scholze, Definition/Proposition IX.4.1, p. 327). *Needs:* ES5.3; ES5.6; ES5.4; ES1:spectral-center.3; LP0.1.

**Checks.**

- The identity extension gives the original parameter, and two successive extensions compose.
- No step uses commutation of arbitrary base change with invariant rings.

### Examples

For `G = GL₁` and a smooth character `χ` of `Eˣ` over `F̄_ℓ`, `j_!(χ)` is Schur and its parameter is the character `χ ∘ rec_geom⁻¹` of `W_E`. For `G = GL₂` and the trivial representation over `Q̄_ℓ`, the parameter sends geometric Frobenius to `diag(√q, 1/√q)` up to conjugacy and has no monodromy; the Steinberg representation has the same semisimple parameter (ES7:parabolic.8).

### Dependencies

ES1:finite-ramification; ES1:spectral-center; LanglandsParameterStacks LP0, LP2c, LP2e; HeckeStacksAndLocalShtukas HS1; VStackSheavesAndLisseCategories VS4; SmoothRepresentationsOfLocalGroups SR.0, SR.2.

## Layer ES6:functoriality: functoriality of centres and parameters

The parameters of ES5 are compatible with maps inducing isomorphisms of adjoint groups, with products and with Weil restriction; for tori they are the parameters of local class field theory with the geometric normalization; they recover central characters (for every connected reductive group over every local field) and twisting by characters of the abelianization. Every statement is first an identity of excursion operators, then a statement about centres under the centre-order condition, then a statement about parameters on Schur objects for every `ℓ ≠ p`.

### ES6:functoriality.1 The coefficient policy

Prove `coefficient_policy_for_the_functorial_diagrams`: every centre diagram in this layer uses the map `Z_spec(G, Λ) → Z_geom(G, Λ)` of ES1:spectral-center.2 under the centre-order condition for every group in the diagram; without it, the spectral centres are replaced by the integral excursion algebras and the excursion operators are compared directly (ES1:spectral-center.4). Evaluating either form on Schur objects over `L` gives the field-valued parameter statements for every `ℓ ≠ p`; the good-prime condition of ES3 is never used (Fargues–Scholze, introduction to §IX.6, p. 330). *Needs:* ES1:spectral-center.2; ES1:spectral-center.4; ES1:finite-ramification.3.

**Checks.**

- For `G = SL₂` and `L = F̄₂` the parameter statements hold through operators, with no centre map.
- No inverse of `|π₀Z(G)|` appears in the extraction of scalars.

### ES6:functoriality.2 Maps inducing isomorphisms of adjoint groups

Prove `isogenies` (Fargues–Scholze, Theorem IX.6.1 and its proof, pp. 330–331): let `f : G′ → G` induce an isomorphism of adjoint groups, `f̂ : Ĝ → Ĝ′` the dual map and `π : Bun_{G′} → Bun_G`. For every `A`, the action of `Z_spec(G′)` on `π^*A` is the pullback of the action of `Z_spec(G)` along the map of functions induced by `f̂`. Before evaluating scalars compare the kernels: for a representation `V′` of `(Ĝ′ ⋊ Q)^I` and `V = f̂^* V′`, HS4.3 gives `π_{H♮} S′_{V′} ≃ h₁^* π_♮ Λ ⊗ S′_V` and hence `(π × id)_♮ T_{V′}(π^*A) ≃ T_V(A ⊗ π_♮ Λ)`, natural in `V′` and `I`; together with `T_{V′}(π^*A) ≃ (π × id)^* T_V(A)` (HS4.3) this transports excursion operators. Any Schur constituent of `π^*A` (a subquotient in an eligible heart, or a summand with inherited scalar central action) has parameter `f̂ ∘ φ_A`. For an irreducible smooth `G(E)`-representation `Π`, the restriction of `π^* j_! Π` to the neutral stratum of `Bun_{G′}` is the restriction of `Π` along `f` on rational points (VS4.2; other strata may lie over `Bun_G^1`), and any irreducible quotient `π′` of `Π|_{G′(E)}` has `φ_{π′} = f̂ ∘ φ_Π`. Neither `π^*A` nor the restriction is required to be irreducible. Use the correct direction of the group map and its dual (*Source corrections*). *Needs:* ES6:functoriality.1; ES5.3; ES5.6; HS4.3; HS1.2; GS4:integral-dual-group (*Naturality for adjoint-isomorphism maps*); ES1:spectral-center.2; VS4.2.

**Checks.**

- The identity map gives the identity comparison.
- Multiplication `Z × G → G` for a central torus `Z` induces an isomorphism of adjoint groups, while the inclusion `Z → G` alone does not.
- An irreducible quotient of a reducible restriction suffices; a single-stratum description of the whole inverse image is not used.

### ES6:functoriality.3 Products

Prove `products` (Fargues–Scholze, Proposition IX.6.2 and its proof, p. 331): for `G = G₁ × G₂`, `Bun_G = Bun_{G₁} × Bun_{G₂}`, the exterior-product map `Z_spec(G₁) ⊗_Λ Z_spec(G₂) → Z_spec(G)` is defined by pullback and multiplication, and the square with `Z_geom(G₁) ⊗ Z_geom(G₂) → Z_geom(G)` commutes; the tensor product of geometric centres need not be the whole geometric centre. Over the common divisor base of the legs, product kernels of external products are external products of kernels (HS4.4); check on external Satake generators, use the product of excursion coefficients of LP2e.9 on finite-wild pieces, and use the compact exterior generators of the Künneth theorem of VS5.3. The global spectral arrow is a ring map, with no assertion that the ordinary tensor product commutes with the inverse limits defining `Z_spec` (*Source corrections*). For Schur `A_i ∈ D_lis(Bun_{G_i}, L)` and a Schur constituent of `A₁ ⊠ A₂` with inherited scalar action, the parameter is `(φ_{A₁}, φ_{A₂})` with the common projection to `Q`. *Needs:* ES6:functoriality.1; ES5.3; HS4.4; GS4:integral-dual-group (*Product naturality*); VS5.3; LP2e.9; Mathlib `TensorProduct`.

**Checks.**

- For `G_m × G_m` the two characters are recovered separately.
- The second factor of the geometric tensor product is the centre for `G₂`, and the `A_i` live on `Bun_{G_i}` (*Source corrections*).
- The legs vary over one common divisor base, not independently.
- Over `Q̄_ℓ`, let `G₁ = G₂ = G_m` and index parameter components by the infinitely many smooth characters of `O_Eˣ`. After evaluating both unramified coordinates at `1`, the function equal to `1` on pairs of equal characters and `0` on unequal pairs is an infinite-rank diagonal matrix. Every element of the ordinary tensor product evaluates to a finite sum of rank-one matrices, so the global spectral arrow is not surjective. The named boundary target `infinite_diagonal_not_finite_separable_sum` in `Suggested.lean` records the rank obstruction over `ℚ`; its proof restricts to `n + 1` rows and columns against a proposed sum of `n` separated functions.

### ES6:functoriality.4 Weil restriction and the nonabelian Shapiro comparison

Prove `weil_restriction` (Fargues–Scholze, Proposition IX.6.3 and its proof, pp. 331–332): let `E′/E` be finite separable, fix an embedding of `E′` into a separable closure of `E` and the resulting `W_{E′} ⊂ W_E`, and let `G = Res_{E′/E} G′`. There are compatible identifications of `Bun_G` with `Bun_{G′}`, of parameter stacks, and of excursion algebras, and the centre square commutes. Choose an open subgroup `P` of wild inertia of `W_E`, normal in `W_E` and contained in `W_{E′}`, and put `W′ = W ∩ (W_{E′}/P)`. The parameter of `G′` is the projection to the chosen dual factor of the restriction to `W_{E′}` of the parameter of `G`; equivalently its Shapiro class is the parameter of `G`. Proof: identify bundles by restriction of scalars (BunGAndNewtonStrata §0.3); prove the nonabelian Shapiro comparison on cocycles, using the coinduced group of functions `f(hx) = h(f(x))` with `W` acting by right translation, evaluation at `1`, and for chosen coset representatives `x = h_x r_x` the inverse `a(w)(x) = h_x(c(h_x⁻¹ h_{xw}))`, whose cocycle law telescopes and whose change of representatives is a coboundary; for each `F_n → W` apply it to `F_n ×_W W′`, a free group (`subgroupIsFreeOfIsFree`) of finite index, hence finitely generated (`Subgroup.fg_of_index_ne_zero`), so no Schreier rank formula is needed; inflate a representation of `Ĝ′ ⋊ W_{E′}` through the projection and induce to `Ĝ ⋊ W_E`, realized by the pushforward along the closed Hecke immersion over `Div′ → Div` (HS4.5). The extension is separable; the projection depends on the embedding, and another choice gives the conjugate comparison; if `E′` has residue degree `f′` its square root is `(√q)^{f′}`, while the leg map has degree `[E′ : E]`. This is not the abelian Shapiro lemma. *Needs:* ES6:functoriality.1; ES5.3; LP0.1; HS4.5; GS4:integral-dual-group (*Weil restriction naturality*); BunGAndNewtonStrata §0.3; Mathlib `IsFreeGroup`, `subgroupIsFreeOfIsFree`, `Subgroup.fg_of_index_ne_zero`.

**Checks.**

- For `E′ = E` the comparison is the identity.
- Different coset representatives give canonically equivalent Shapiro data.
- `P` must be normal in `W_E`, not merely open in `W_{E′}`.

### ES6:functoriality.5 The spectral centre of a torus

Prove `tori_spectral_center` (Fargues–Scholze, proof of Proposition IX.6.4, p. 333): for an `E`-torus `T`, local reciprocity gives a natural isomorphism `Z_spec(T, Λ) ≅ R_T = lim_K Λ[T(E)/K]` over open compact subgroups `K` (pro-`p` ones are cofinal); the quotients `T(E)/K` are discrete and need not be finite (for `T = G_m`, `K = O_Eˣ` gives `ℤ`). The geometric category is `∏_{b ∈ B(T)} D(T(E), Λ)` with `B(T) = π₁(T)_Γ` (BunGAndNewtonStrata §1.36), and `Z_geom(T, Λ) = ∏_{b} R_T` through SR.1.3's description of the centre by Hecke corners, which for an abelian group are group algebras of quotients; the complex Bernstein-block theorem is not used. On points over algebraically closed `L` this includes the natural bijection between continuous crossed cocycles `W_E → T̂(L)` modulo coboundaries and smooth characters `T(E) → Lˣ`, with geometric reciprocity, functorial for every homomorphism of tori, and for arbitrary nonsplit tori, not only Frobenius values. Proof: resolve `T` by induced tori (ReductiveGroupsPartII, contract), reduce by ES6:functoriality.2–.4 to `G_m`, and apply full local reciprocity, including wild `p`-primary characters in equal characteristic (ClassFieldTheory Layer 9 in mixed characteristic, FunctionFieldArithmetic FA.4 in equal characteristic), to the continuous cocycle–character functor of LP0.2. *Needs:* ES6:functoriality.2; ES6:functoriality.3; ES6:functoriality.4; SR.1.3; BunGAndNewtonStrata §1.36; LP0.2; TauCetiRoadmap ClassFieldTheory Layer 9; FunctionFieldArithmetic FA.4; ReductiveGroupsPartII RG2.5; Tau Ceti `TauCeti.ClassFieldTheory.Formation`; Mathlib `MonoidAlgebra`.

**Checks.**

- For `G_m` the unramified quotient contributes `Λ[t, t⁻¹]`.
- Norm compatibility for an induced torus, and restriction to an open `K`, are compatible with the isomorphism.
- For a quotient of tori `T → C`, a continuous crossed cocycle into `Ĉ` gives a smooth character `χ_C`, and its image in `T̂` gives `χ_C ∘ (T(E) → C(E))`, even when `T(E) → C(E)` is not surjective.

### ES6:functoriality.6 The two-leg torus operator with universal coefficients

Prove `torus_two_leg_calculation` (Fargues–Scholze, proof of Proposition IX.6.5, p. 333, expanded): let `Λ` be any `ℤ_ℓ[√q]`-algebra and `K ⊂ Eˣ` any open compact pro-`p` subgroup; put `A_K = Eˣ/K` and `M_K = Λ[A_K]` with left regular action. Let `rec_geom(x) = Art(x⁻¹)` and `u(γ) = rec_geom⁻¹(γ^ab)`, `γ^ab` the image in the topological abelianization (the quotient by the closure of the commutator subgroup). On the sheaf of `M_K` in every physical line-bundle degree `d`, the excursion operator with two legs, `Std ⊠ Std^∨` and tautological creation and annihilation, is left translation `[x] ↦ [u(γ₁) u(γ₂)⁻¹ x]`, on the module itself, naturally in `Λ` and compatibly with the quotient maps for smaller `K`; for a smooth character `χ` over `L` the scalar specialization is `χ(u(γ₁) u(γ₂)⁻¹)`. Proof outline: at fixed output `M = O(d+1)` the `Std` input is `M(−D) ⊂ M`, with source-frame torsor `P_D = Isom(O(−1), O(−D))` (after twisting by `O(d+1)`), dual to the trivialization torsor of `O(D) → O(1)` (Fargues–Scholze, §§VI.1.6–VI.1.9, pp. 193–194, §§VI.2.2–VI.2.4, pp. 197–198; Fargues, Remark 2.17, pp. 10–11); a nonzero `f ∈ H⁰(O(1))` with divisor `D` defines the frame `q_f`, with `q_{af} = a q_f`, so the punctured Banach–Colmez space of `O(1)` is `P_D` with its scaling action, and associated-representation descent `(q a, v) ∼ (q, ρ(a) v)` makes transport of `q` to `q a` act by `ρ(a)`; the height-one Lubin–Tate comparison identifies this cover with the universal cover over `Div¹` (Fargues–Scholze, §§II.2.2–II.2.4, pp. 60–61), Frobenius descent by `π` and its inverse on the residue-Frobenius cover make arithmetic Frobenius transport the frame by `π⁻¹`, and inertia `τ` transports it by `χ_LT(τ)` with `Art⁻¹(τ) = χ_LT(τ)⁻¹` (Fargues, Proposition 2.16, pp. 9–10; proof of Proposition 3.3, p. 13), which determines `u`; the torus Satake kernel has no shift or twist (`2ρ = 0`), `Std` raises the physical degree by one carrying `ρ(u(γ))` and `Std^∨` lowers it carrying the inverse, and fusion with the creation–annihilation triangles of HS4.2 gives `ρ(u(γ₁) u(γ₂)⁻¹)` with no extra scalar; finally take `ρ` the left regular representation on `Λ[Eˣ/K]` and extend by `Λ`-linearity. Physical degree `d` means `O(d)`, whose Kottwitz label has the opposite sign (Fargues–Scholze, §III.2, p. 91). The frame convention and the associated-representation convention change together. *Needs:* ES6:functoriality.5; RelativeFarguesFontaine (rank-one twists, with the Lubin–Tate cover contract); HS1.2; HS0.2; HS4.1; HS4.2; GS4:integral-dual-group (*Normalized integral Satake equivalence*); TauCetiRoadmap ClassFieldTheory Layer 9; Mathlib `Representation.leftRegular`, `MonoidAlgebra`, `MonoidAlgebra.mapDomainRingHom`, `MonoidAlgebra.mapRingHom`.

**Checks.**

- For every `Λ` and `d`, the diagonal `γ₁ = γ₂` acts as the identity on `M_K`, and exchanging the legs gives the inverse translation.
- For an unramified `χ` with `χ(ϖ) = a`, geometric Frobenius at the first leg gives `a`; the arithmetic convention would give `a⁻¹`, and a nontrivial valuation basis vector distinguishes the two.
- For `Λ = F_ℓ[ε]/(ε²)`, the vector `ε[1]` is nonzero and is translated with its coefficient intact, although every map to a field kills `ε`: the identity is on the module, not on field-valued characters.
- The identity is compatible with `Λ[Eˣ/K′] → Λ[Eˣ/K]` for `K′ ⊂ K` and with every coefficient map; `A_K` is infinite.

### ES6:functoriality.7 The diagonal torus centre map

Prove `tori_diagonal_embedding` (Fargues–Scholze, Proposition IX.6.5, p. 333): under ES6:functoriality.5, the map `Z_spec(T, Λ) → Z_geom(T, Λ) = ∏_{b ∈ B(T)} R_T` sends `r` to the constant tuple `(r)_b`. Consequently, on every stratum, the parameter of a smooth character is its torus parameter with the geometric normalization. This is an equality of centre actions and their coordinates, including nilpotents, not an agreement on characters. The centre of a torus is connected, so the centre-order condition is automatic. Proof: reduce to `G_m` through induced tori and ES6:functoriality.2–.4; for `G_m` evaluate on the compact generator `M_K` in degree `d` (its stratum is open and closed, so its extension is compact by VS4.4); by ES1:finite-ramification.2 the action factors through a finite-wild piece, refined so that the reciprocity image `H` of `P` lies in `K`; that piece has coordinate algebra `Λ[Eˣ/H]` (full reciprocity, trivial conjugation), the excursion presentation is an isomorphism for a torus, and by ES6:functoriality.6 the datum `(γ, 1)` acts by `[u(γ)]`, so the whole finite-piece action is the quotient `Λ[Eˣ/H] → Λ[Eˣ/K]`; a central element acts on the regular module by multiplication, faithfully (`r · [1] = r`), so this determines the `K`-coordinate in degree `d`, compatibly in `K` and independently of `d`. Factorization through a finite-wild piece is used before generation; no density statement in the completed ring replaces it. *Needs:* ES6:functoriality.5; ES6:functoriality.6; ES6:functoriality.2; ES6:functoriality.3; ES6:functoriality.4; ES1:spectral-center.2; ES1:finite-ramification.2; BunGAndNewtonStrata §1.36; VS4.4; LP2e.9; SR.1.3.

**Checks.**

- For `G_m`, `B(T) = ℤ`, and every degree receives the same `r`.
- The full centre action is checked, not only its values on characters, which miss integral nilpotents.

### ES6:functoriality.8 Central characters for a smooth connected centre

Prove `central_characters_and_twisting` (Fargues–Scholze, closing paragraph of §IX.6, p. 333): if the scheme-theoretic centre `Z = Z(G)` is smooth and connected, it is a torus, and for irreducible smooth `π` with central character `ω_π`, the composite of `φ_π` with the dual map `Ĝ → Ẑ` is the parameter of `ω_π`. The map inducing an isomorphism of adjoint groups is multiplication `Z × G → G`, not the inclusion `Z → G`; pull `π` back along it, identify the scalar central action with `ω_π ⊠ π`, and apply ES6:functoriality.2, ES6:functoriality.3 and ES6:functoriality.7, cancelling the unchanged `G`-coordinate. In positive characteristic, connectedness alone is not enough: `Z(SL_p) = μ_p` is connected and not smooth, and is treated in ES6:functoriality.11. This does not use ES7:parabolic. *Needs:* ES5.6; ES6:functoriality.2; ES6:functoriality.3; ES6:functoriality.7; GS4:integral-dual-group (*Naturality for adjoint-isomorphism maps*); ReductiveGroupsPartII RG2.5.

**Checks.**

- For `G = T` this is ES6:functoriality.7.
- The dual central projection is used, not a restriction of the parameter to the centre of `G`.
- `SL_p` over `F_q((t))` does not satisfy the hypothesis although `μ_p` is connected.

### ES6:functoriality.9 Twisting by characters of the abelianization

Prove `twisting_by_abelianized_characters` (Fargues–Scholze, closing paragraph of §IX.6, p. 333): let `a : G → D = G/G_der` and `χ` a smooth `Lˣ`-valued character of `D(E)`. For irreducible smooth `π`, `φ_{π ⊗ (χ ∘ a)}` is `φ_π` multiplied by the central cocycle `â ∘ φ_χ`, where `D̂` maps centrally to `Ĝ`; only the cocycle parts are multiplied, keeping the common Weil projection. Equivalently it is the product parameter composed with the dual of the graph `G → G × D`, `g ↦ (g, a(g))`, to which ES6:functoriality.2 applies; centrality gives the cocycle identity. *Needs:* ES6:functoriality.8; ES6:functoriality.2; ES6:functoriality.3; ES6:functoriality.7; LP0.1; ReductiveGroupsPartII RG2.5.

**Checks.**

- The trivial character leaves the parameter unchanged.
- Successive twists multiply the central cocycles.
- The Weil components are not multiplied.

### ES6:functoriality.10 Pseudo-z-embeddings and z-embeddings

Over a `p`-adic field `F`, define `ZEmbedding`: a pseudo-z-embedding is an injective morphism `G → G_z` of connected reductive groups with `C = G_z/G` a torus, `H¹(F, C) = 1` and `H¹(F, Z(G)) → H¹(F, Z(G_z))` bijective; it is a z-embedding when moreover `Z(G_z)` is connected and `C` is induced. Kaletha constructs one by embedding the diagonalizable centre in a torus `T` with induced quotient and the same `H¹`, and putting `G_z = (G × T)/Z` (Kaletha 2018, Definition 5.1 and Proposition 5.2, arXiv v2 p. 17; Definition 5.1 is on p. 78 of the journal version). This injective object is not a z-extension (a surjection with induced-torus kernel and simply connected derived group). Prove `ZEmbedding.ofMaps`, `ZEmbedding.quotient_inclusion` (`C` is trivial on `G`), `ZEmbedding.central_lift` (every `c ∈ C(F)` lifts to `Z(G_z)(F)`, from injectivity on centre `H¹`), `ZEmbedding.rational_factorization` (`G_z(F) = Z(G_z)(F) · G(F)`) and `ZEmbedding.extend_representation`: a smooth character `ω` of the closed subgroup `Z(G)(F)` of `T(F) = Z(G_z)(F)` extends to a smooth character `ω_z` (choose a compact open `U ⊂ T(F)` with `U ∩ Z(G)(F) ⊂ ker ω`, extend from `Z(G)(F)U/U` to the discrete group `T(F)/U` by divisibility of `Lˣ` for algebraically closed `L` of any characteristic (`IsAlgClosed.exists_pow_nat_eq`, `AddCommGrpCat.injective_of_divisible`, `Injective.factorThru`), and inflate), and `π_z(z · g) = ω_z(z) π(g)` is a well-defined smooth irreducible representation of `G_z(F)` restricting to `π`, smoothness coming from openness of `T(F) × G(F) → G_z(F)` (Kaletha 2018, Fact 5.5 and the following paragraph, arXiv v2 p. 19, JEMS p. 80). The citation is `p`-adic; no equal-characteristic existence is asserted. *Needs:* ReductiveGroupsPartII RG2.5; SR.2.1; TauCetiRoadmap ClassFieldTheory Layer 9; Mathlib `MonoidHom`, `Subgroup`, `IsAlgClosed.exists_pow_nat_eq`, `AddCommGrpCat.injective_of_divisible`, `CategoryTheory.Injective.factorThru`.

**Checks.**

- For a group with connected centre the identity, with trivial quotient, is a z-embedding.
- For connected-centre `G` and induced `C`, `G → G × C` with projection to `C` is a z-embedding with central lifts `(1, c)`.
- A torus quotient for which `Z(G_z)(F) → C(F)` is not surjective is not a pseudo-z-embedding; `SL_n → GL_n` is not a z-embedding over a `p`-adic field since the centre `H¹` map is not bijective.
- The extension `ω_z` is a choice; only pseudo-z-embeddings are asserted to compose (Kaletha, Fact 5.4).

### ES6:functoriality.11 Central characters over every local field

Prove `z_embedding_central_character_comparison`: for every connected reductive `G` over every nonarchimedean `E`, every algebraically closed `L` of characteristic different from `p` and every irreducible smooth `π`, the parameter `φ_π` determines the central character `ω_π` on `Z(E)`, `Z` the multiplicative-type centre. Embed `Z` in a torus `T` (from a surjection of a permutation lattice onto `X^*(Z)` over a finite Galois splitting extension; its kernel is a lattice, and duality gives `Z ⊂ T` with torus quotient `C`) and form the central pushout `G⁺ = (G × T)/Z`, connected reductive with centre `T`, `G⁺/G = C` and unchanged adjoint group (ReductiveGroupsPartII, contract). There is an irreducible admissible `Π` of `G⁺(E)` whose restriction to `G(E)` has `π` as a quotient; `φ_Π` projects to `φ_π`, and the torus character given by its central dual projection restricts on `Z(E)` to `ω_π`. The restriction depends only on `φ_π`, not on `T`, `Π` or the lift. This is weaker than a pseudo-z-embedding: no centre `H¹` bijection, no rational factorization of `G⁺(E)`, no openness of `H` and no surjectivity of `T(E) → C(E)` is needed, and it assigns no torus parameter to a nonsmooth or disconnected centre. Proof: let `H = i(G(E)) T(E)`, the rational image of `G × T → G⁺`, closed and normal with compact abelian quotient (Henniart–Vignéras 2025, Lemma 3.1 and Proposition 3.3, pp. 238–240, with the corrections under *Source corrections*); `G(E) × T(E) → H` is open by the open-mapping argument for σ-compact locally compact groups; extend `ω_π` to a smooth `ω_T` as in ES6:functoriality.10 and put `τ(t · i(g)) = ω_T(t) π(g)` on `H`, smooth, irreducible and admissible; `Ind_H^{G⁺} τ` is nonzero and admissible by finiteness of `H\G⁺(E)/K`, a cyclic subrepresentation has finite length (`fg_admissible_finite_length_ne_p`) and contains an irreducible `Π`, and the right-adjoint Frobenius isomorphism of `closed_cocompact_irreducible_lift_ne_p` gives `Π|_H ↠ τ`, hence `Π|_{G(E)} ↠ π` (Henniart–Vignéras 2025, §2.2.4(2), p. 236; Vignéras 2023, §5, p. 340); transport excursion operators along `i` (HS4.3, ES6:functoriality.2), restrict to the neutral stratum, and use that central operators commute with the surjection, so `î ∘ φ_Π = φ_π`; apply ES6:functoriality.8 to `Π`; two lifts of `φ_π` to `Ĝ⁺(L)` differ by a continuous crossed cocycle in `Ĉ` (LP0 contract), whose reciprocal character composed with `T(E) → C(E)` is trivial on `Z(E)`; and two choices `T₁, T₂` are compared through `T₁₂ = (T₁ × T₂)/Z` and the pushout `G₁₂`. Over a `p`-adic field the z-embedding of ES6:functoriality.10 is the stronger special case. Over `E = F_q((t))`, `H¹_fppf(E, μ_p) = Eˣ/(Eˣ)^p` is infinite while torus `H¹` is finite (Conrad, Proposition 4.1.7(i), p. 22), so no full `H¹` transfer exists for this centre; the argument above does not need one. *Needs:* ES6:functoriality.8; ES6:functoriality.5; ES6:functoriality.2; ES6:functoriality.10; ES5.6; ReductiveGroupsPartII RG2.5 (with the central-pushout and rational-image contract); SR.2.1; requested SR `closed_cocompact_irreducible_lift_ne_p`, `fg_admissible_finite_length_ne_p`; LP0.2; LP2e.5; VS4.2; HS4.3; Mathlib `IsAlgClosed.exists_pow_nat_eq`, `AddCommGrpCat.injective_of_divisible`, `CategoryTheory.Injective.factorThru`.

**Checks.**

- For a smooth connected centre the identity pushout recovers ES6:functoriality.8.
- For `SL_p` in characteristic `p`, `SL_p → GL_p`: `H` can be a proper nonopen subgroup, `μ_p(E)` is trivial and the comparison holds.
- For `SL_{pr}` in characteristic `p` with `r > 1` prime to `p`, the pushout to `GL_{pr}` treats the nonsmooth `μ_p` and the disconnected `μ_r` together and recovers the character on `μ_r(E)`.
- A surjective intertwiner passes a central scalar from `Π` to `π`; a nonzero map that is not equivariant does not.
- For a nonsplit quotient torus the difference of two lifts is a crossed cocycle, not a homomorphism.

### Examples

For `G = GL_n` the centre is `G_m`, and ES6:functoriality.8 says `det ∘ φ_π` is the parameter of the central character. For `G = SL₂` over `ℚ_p` with `p` odd, `Z = μ₂`, and ES6:functoriality.11 through `SL₂ → GL₂` recovers `ω_π(−1)` from `φ_π`.

### Dependencies

ES1:finite-ramification; ES1:spectral-center; ES5; LanglandsParameterStacks LP0, LP2e; HeckeStacksAndLocalShtukas HS0, HS1, HS4; GeometricSatakeAndFusion GS4; VStackSheavesAndLisseCategories VS4, VS5; BunGAndNewtonStrata; RelativeFarguesFontaine; SmoothRepresentationsOfLocalGroups SR.1, SR.2; ReductiveGroupsPartII RG2.5; FunctionFieldArithmetic FA.4; TauCetiRoadmap ClassFieldTheory Layer 9.

## Layer ES7:parabolic: Newton strata and parabolic induction

Restricting the centre to a Newton stratum gives a map `Ψ_G^b` to the Bernstein centre of `G_b(E)`, and it factors through the centre of `G_b` along the Levi inclusion of dual groups twisted by `(2ρ_Ĝ − 2ρ_M̂)(√q)^{deg}` (Theorem IX.7.2). The parabolic-induction compatibility follows (Corollary IX.7.3), and with the torus normalization of ES6:functoriality it becomes the ordinary Levi inclusion for normalized induction.

### ES7:parabolic.1 Stratum maps

For a `ℤ_ℓ[√q]`-algebra `Λ` and `b ∈ B(G)`, define `PsiGb`: restrict the geometric centre along the fully faithful embedding `D(G_b(E), Λ) ≃ D_lis(Bun_G^b, Λ) → D_lis(Bun_G, Λ)` given by `L_b` (VS4.2–VS4.3; not an unrestricted shriek functor on lisse categories) and compose with ES1:spectral-center.2, giving `Ψ_G^b : Z_spec(G, Λ) → Z(G_b(E), Λ)`; at `b = 1` the embedding is `j_!` and `Ψ_G = Ψ_G^1` is ES0:classical-center.1 composed with ES1:spectral-center.2. The spectral form needs the centre-order condition for `G` (the order of `π₀Z(G)`, equivalently the torsion of `π₁(Ĝ)`, not `π₀Z(Ĝ)`); the excursion form `PsiGb.excursion` (from ES1:spectral-center.4) has no condition. Provide `restrictCentre` (for a fully faithful additive `F : A → B`, the ring map `Z(B) → Z(A)`, `z ↦ (X ↦ F⁻¹(z_{F X}))`, with `restrictCentre_app : F((restrictCentre z)_X) = z_{F X}`), `PsiGb.basepoint` (`Ψ_G^1 = Ψ_G`) and `PsiGb.embedding_independent` (eligible embeddings give the same action, by ES5.4) (Fargues–Scholze, Definition IX.7.1, p. 334; Theorem IX.5.2, p. 329; Theorem VIII.3.6, p. 288). In `Suggested.lean`, `restrictCentre` and `restrictCentre_comp` are stated for ordinary categories. *Needs:* ES1:spectral-center.2; ES1:spectral-center.4; ES0:classical-center.1; ES5.4; VS4.2; VS4.3; SR.1.3; BunGAndNewtonStrata §1.13; Mathlib `CatCenter`, `Functor.FullyFaithful`, `Adjunction`.

**Checks.**

- At `b = 1` the general restriction is `j_!`'s map.
- The spectral constant `1` acts as the identity on every smooth representation; the maps preserve addition and multiplication.
- For a group with `ℓ` dividing `|π₀Z(G)|` the excursion form still gives a central action, without the spectral-centre identification.

### ES7:parabolic.2 The twisted Levi inclusion

Let `M̂ = Ĝ_b ⊂ Ĝ` be the dual Levi with pinned inclusion `j`, `deg : W_E → ℤ` with geometric Frobenius `↦ 1`, and `t = (2ρ_Ĝ − 2ρ_M̂)(√q)`, evaluated in a `ℤ_ℓ[√q]`-algebra `A` (where `√q` is a unit). Define `cocycleMap` (`twistedLeviCocycle` in `Suggested.lean`): `c_φ(w) = t^{deg w} j(φ(w))`, with the usual pinned Weil actions on both sides. The cocharacter difference is Weil-invariant and central in `M̂`, so `t` is invariant and centralizes `j(M̂)`; with equivariance of `j` this proves the cocycle identity. Prove `cocycleMap.isCocycle` (`c_φ(wv) = c_φ(w) · w(c_φ(v))` and `c_φ(1) = 1`), `cocycleMap.degree_zero` (`c_φ(w) = j(φ(w))` when `deg w = 0`), `cocycleMap.basicCase` (`M̂ = Ĝ` gives `j ∘ φ`), `cocycleMap.conjugation` (conjugating `φ` by `m` conjugates `c_φ` by `j(m)`; base change in `A` commutes with the map) and continuity on finite-inertia charts (LP0.1); the map induces pullback of invariant functions (Fargues–Scholze, §IX.7.1, p. 334). *Needs:* LP0.1; LP0.2; ReductiveGroupsPartII RG2.5; GS4:integral-dual-group (*Levi naturality and normalization*, *Canonical pinned dual identification*); BunGAndNewtonStrata §1.13; Mathlib `MonoidHom`, `RootPairing`, `MulAut`.

**Checks.**

- For a basic stratum `t = 1` and the map is `j ∘ φ`.
- For the upper Borel of `GL₂` and trivial `φ`, the value at geometric Frobenius is `diag(√q, 1/√q)`.
- On inertia (degree zero) the twist is `1`.

### ES7:parabolic.3 Reduction to universal and torsion coefficients

Prove `coefficient_reduction`: to prove the stratum factorization or the induction square for arbitrary `Λ`, prove it over `ℤ_ℓ[√q]`, reduce modulo `ℓ^r`, use `ℓ`-adic separatedness of the integral Bernstein centre `lim_K Z(e_K H_Λ e_K)` over cofinal pro-`p` subgroups (SR.1.3, for `Λ = ℤ_ℓ[√q]` only, not for a field or arbitrary torsion coefficients), and pass to `Λ` by the scalar-extension compatibility of excursion operators `S_D ⊗_Λ Λ′ = S_{D ⊗ Λ′}` with derived tensor products on sheaves, for every map of `ℤ_ℓ[√q]`-algebras, nonflat ones included, and compatibly with stratum restriction; that compatibility is the unrestricted operator statement `excursion_change_of_data` of ES1:spectral-center.3, which compares creation, Weil action and annihilation one at a time. Replace spectral functions by excursion generators when the centre-order condition fails (Fargues–Scholze, proof of Theorem IX.7.2, p. 335). *Needs:* ES7:parabolic.1; ES1:spectral-center.3; ES1:spectral-center.4; SR.1.3 *l-adic-separatedness*; VS3.3; VS4.4; Mathlib `MonoidAlgebra`, `Module.End`.

**Checks.**

- Separatedness is never applied to a field or to arbitrary torsion `Λ`.
- Equality modulo every `ℓ^r` gives equality over `ℤ_ℓ[√q]`, and the base-change compatibility is a separate step, not a consequence of the existence of an excursion action.

### ES7:parabolic.4 The basic case and reduction to a quasi-split group

Prove `basic_case_and_quasisplit_reduction` (Fargues–Scholze, proof of Theorem IX.7.2, p. 335): for basic `b` the triangle follows from the Hecke-equivariant pure inner twisting `Bun_G ≃ Bun_{G_b}` (BunGAndNewtonStrata §0.7 with HS0.6; Hecke equivariance is part of the BunGAndNewtonStrata contract). For general `G` over every nonarchimedean `E`, embed its multiplicative-type centre `Z` in a torus `T` and use the central pushout `i : G → G⁺ = (G × T)/Z` of ES6:functoriality.11. Its centre is `T` and its adjoint group is unchanged. For `b⁺ = i(b)`, prove `central_pushout_stratum_square`: the map on the reductive automorphism groups is the closed embedding `G_b → G⁺_{b⁺} = (G_b × T)/Z`; under VS4.2, restriction of the pullback of a stratum extension from `b⁺` to `b` is restriction of smooth representations along this embedding. This follows by applying the centralizer and inner-twist construction of BunGAndNewtonStrata §1.13 to the central pushout. It does not require `B(G) → B(G⁺)` to be injective, or the whole inverse image of the stratum to be one stratum.

Restrictions from `G⁺_{b⁺}(E)` detect central actions on all smooth representations of `G_b(E)`: SR.2.1's `SmoothRep.indEval` gives a surjection `Res_H^J Ind_H^J V → V` for every closed subgroup `H` of a locally profinite `J` and every smooth `V`, over any coefficient ring. Concretely, for `v ∈ V` choose compact open `K ⊂ J` with `H ∩ K` fixing `v`; the function `f(hk) = h v` on the clopen set `HK`, zero elsewhere, belongs to smooth induction and evaluates to `v`. Central natural transformations descend along this surjection, so equality on all restricted representations implies equality on every `V`; neither admissibility nor an irreducible lift is needed. Apply HS4.3 and ES6:functoriality.2 to compare the excursion actions on the two stratum extensions. The corresponding Levi is `M⁺ = (M × T)/Z`; the dual maps carry the twisted Levi inclusion for `M⁺ ⊂ G⁺` to that for `M ⊂ G`, because the root systems and `2ρ` differences agree. These two squares transfer the stratum triangle from `G⁺` to `G`.

For the toral-centre group `G⁺`, choose basic `b₀` with `G⁺_{b₀}` quasi-split by surjectivity of basic classes onto `H¹(E, G⁺_ad)` for connected centre (Kottwitz 2014, Proposition 10.4, p. 50, with the bridge to `H¹` from BunGAndNewtonStrata §1.44), and twist. Over a `p`-adic field, ES6:functoriality.10 also gives the stronger z-embedding route, with `G′_{b′}(E) = Z(G′)(E) · G_b(E)`. No such rational factorization is used in characteristic `p`: for `SL_p` the obstruction is the infinite group `Eˣ/(Eˣ)^p` (*Source corrections*). *Needs:* ES7:parabolic.1; ES7:parabolic.2; ES7:parabolic.3; ES6:functoriality.2; ES6:functoriality.10–.11; BunGAndNewtonStrata §0.7, §1.13, §1.19, §1.44, Layer 2; ReductiveGroupsPartII central-pushout contract; SR.2.1 *smooth-induction* (`SmoothRep.indEval`); VS4.2; HS0.6; HS4.3.

**Checks.**

- At basic `b` the statement is pure-inner-form invariance.
- For `G = SL_p` over `F_q((t))`, use `G⁺ = GL_p`: although the map from its centre to the quotient on rational points is not surjective, evaluation from smooth induction still detects the action on every smooth `SL_p(E)`-representation.
- For `H = J`, the evaluating function is `f(h) = h v` and evaluation is the identity under `Ind_J^J V ≅ V`.
- For a closed subgroup of infinite index, `HK` still has compact image in `H\J`; its indicator construction uses neither a finite index nor division by that index, so it remains valid for torsion coefficients.

### ES7:parabolic.5 Increasing instability at a fixed parabolic

Prove `increasingly_unstable_sequence` (Fargues–Scholze, proof of Theorem IX.7.2, pp. 335–336): for quasi-split `G` with a fixed Borel and `b` with canonical parabolic `P_b`, choose a cocharacter `μ` central in the Levi with dynamic parabolic `P_b` (Tau Ceti `TauCeti.Cocharacter.parabolic`, `TauCeti.Cocharacter.levi`) and put `b_N = b μ(π)^N`. Then `G_{b_N} = G_b`, the stratum maps for `b` and `b_N` agree (the unique modification of type `Nμ` between the two strata transports the same representation, and HS4.1 transports central actions), and for each fixed bounded Hecke type `V`, every self-modification of `E_{b_N}` of type `V` preserves its Harder–Narasimhan reduction to `P_b` for `N` large, by the bounded-modification slope estimate of BunGAndNewtonStrata Layer 4. `N` is chosen after `V`. *Needs:* ES7:parabolic.2; ES7:parabolic.1; BunGAndNewtonStrata Layers 1 and 4; HS4.1; HS2.2; GS4:integral-dual-group (*Normalized integral Satake equivalence*); Tau Ceti `TauCeti.Cocharacter.parabolic`, `TauCeti.Cocharacter.levi`.

**Checks.**

- No single `N` serves all Hecke types.
- For `b` basic, `P_b = G` and the sequence is constant up to central twist.

### ES7:parabolic.6 Factorization of the stratum maps

Prove `constant_term_computation` (Fargues–Scholze, Theorem IX.7.2 and its proof, pp. 335–337): for every `b ∈ B(G)`, `Ψ_G^b = Ψ_{G_b} ∘ c_b^*`, where `c_b^*` is pullback along the twisted Levi inclusion of ES7:parabolic.2; spectral centres are used when `|π₀Z(G)|` and `|π₀Z(G_b)|` are invertible, excursion algebras otherwise. Proof: reduce coefficients and groups (ES7:parabolic.3–.4), replace `b` by `b_N` (ES7:parabolic.5), and use the Harder–Narasimhan-preserving Hecke diagram through `P` and its Levi `M`, with `G_b = M_{b_M}` for basic `b_M`. By base change (VS1) and GS4's constant-term naturality, the kernel restricted to the stratum is `CT_P(S_V)` with dual Levi restriction, the cyclotomic twist and the shift `[deg_P]`. HS4.6 measures the first bundle relative to the second and switches the kernel; its opposite-parabolic twist has to be combined with the character of `G_b(E)` on `Rπ_!Λ` in `B_N = Rπ_! A′_N`, and the combined effect computed on the original representation is the positive twisted inclusion of ES7:parabolic.2; this computation is part of the target, and cancelling the degree-zero shift alone is not enough. Creation and annihilation meet only the degree-zero component, where the shift disappears, and every excursion generator is compared. *Needs:* ES7:parabolic.1–.5; HS4.1; HS4.6; VS1.4; VS4.3; GS4:integral-dual-group (*Levi naturality and normalization*); Mathlib `CategoryTheory.MonoidalCategory`.

**Checks.**

- For basic `b` the factorization is untwisted.
- For the nonbasic torus stratum of `GL₂` the Frobenius factor is `diag(√q, 1/√q)`.

### ES7:parabolic.7 Unnormalized parabolic induction

Prove `parabolic_induction` (Fargues–Scholze, Corollary IX.7.3 and its proof, pp. 337–338): for a parabolic `P ⊂ G` with Levi `M` and a smooth `M(E)`-representation `σ` over `Λ`, the spectral or excursion action on the unnormalized `Ind_P^G σ` is induced through the twisted Levi pullback from the action on `σ`. If `Λ = L` is an algebraically closed field, `σ` is irreducible and `π` is an irreducible subquotient of `Ind_P^G σ`, then `φ_π` is conjugate to `c_M ∘ φ_σ`. In the proof take `b = μ(π_E⁻¹)` for a cocharacter `μ` with dynamic parabolic `P`; for `σ = c-Ind_K^{M(E)} Λ` the sheaf `A` on `Bun_G^b` satisfies `T_{μ⁻¹}(A)|_{Bun_G^1} ≅ Ind_P^G σ (−d/2)[−d]` with `d = ⟨2ρ, μ⟩`, the modification space being `G(E)/P(E)` of exact type `μ`; reduce to compactly induced pro-`p` generators (ES7:parabolic.3), and combine Hecke–excursion commutation with ES7:parabolic.6 and ES5.6. *Needs:* ES7:parabolic.6; ES5.6; SR.2.2 *parabolic-induction*; SR.1.3; HS4.1; HS2.2; Tau Ceti `TauCeti.Cocharacter.parabolic`.

**Checks.**

- For `P = G` the twist and `d` vanish.
- The inverse cocharacter and the negative shift go together; reversing both without changing the stratum is wrong.

### ES7:parabolic.8 Normalized induction and the cyclotomic twist

Prove `normalised_induction_dictionary`: with `i_P^G τ = Ind_P^G(δ_P^{1/2} τ)`, `δ_P(m) = |det(Ad(m)|Lie U_P)|_E` and geometric reciprocity, the twist by `δ_P^{1/2}` has torus parameter the cocycle `c⁻¹`, where `c(w) = (2ρ_Ĝ − 2ρ_M̂)(√q)^{deg w}`; indeed `δ_P^{1/2}(λ(ϖ)) = (√q)^{−⟨2ρ_N, λ⟩}`, dual to `(2ρ_Ĝ − 2ρ_M̂)(√q)⁻¹` at geometric Frobenius. Hence `c · φ_{δ_P^{1/2} τ} = j ∘ φ_τ`, and normalized induction uses the ordinary Levi inclusion: for an irreducible subquotient `π` of `i_P^G τ`, `φ_π ≅ j ∘ φ_τ`. The geometric `(−d/2)[−d]` of ES7:parabolic.7 is a normalization of Satake sheaves, not a second modulus factor (Fargues–Scholze, Corollary IX.7.3, p. 337, with §IX.7.1, p. 334; the dictionary is derived here from ES6:functoriality.9). For nonsplit groups the comparison of the modulus character of SR.2.2 with relative roots, the Satake Weil action and geometric reciprocity is part of this target; Mathlib's `MeasureTheory.Measure.modularCharacter` is the modular character of a group, not this statement. *Needs:* ES7:parabolic.7; ES6:functoriality.9; SR.2.2 *modulus-character*, *parabolic-induction*; ReductiveGroupsPartII RG2.5; GS4:integral-dual-group (*Levi naturality and normalization*); Mathlib `MeasureTheory.Measure.modularCharacter`.

**Checks.**

- For the upper Borel of `GL₂`, `δ_B(diag(a, d)) = |a/d|`, and the normalized principal series of the trivial character has parameter `1 ⊕ 1`.
- The unnormalized principal series of the trivial character has Frobenius `diag(√q, 1/√q)`.
- The source shift is `(−d/2)[−d]`, not `(+d/2)[+d]`.

### Examples

For `G = GL₂`, `B` the upper Borel and `χ₁ ⊗ χ₂` a character of the torus, every irreducible subquotient `π` of `i_B^G(χ₁ ⊗ χ₂)` has `φ_π = φ_{χ₁} ⊕ φ_{χ₂}`; the trivial representation and the Steinberg representation are the two constituents of `i_B^G(|·|^{−1/2} ⊗ |·|^{1/2})` and share the semisimple parameter sending geometric Frobenius to `diag(√q, 1/√q)` up to conjugacy, which does not see their different monodromy.

### Dependencies

ES0:classical-center; ES1:spectral-center; ES5; ES6:functoriality; HeckeStacksAndLocalShtukas HS0, HS2, HS4; VStackSheavesAndLisseCategories VS1, VS3, VS4; GeometricSatakeAndFusion GS4; BunGAndNewtonStrata; SmoothRepresentationsOfLocalGroups SR.1, SR.2; ReductiveGroupsPartII RG2.5; Tau Ceti `TauCeti.Cocharacter`.

## Layer ES4: central support, duality, local shtukas and elliptic components

The spectral centre map gives every compact object a reduced support in the spectrum of the coordinate ring of a finite-wild piece, with the expected behaviour under triangles, coefficient change and localization at a function. The centre map is compatible with Bernstein–Zelevinsky duality and the Chevalley involution, the excursion operators act on the cohomology of local shtuka spaces compatibly with both group actions, and the component of an elliptic parameter is supported on basic strata. None of this is used by ES5.

### ES4.1 Finite-wild central support

Under the centre-order condition, for compact `A` with eligible cutoff `P`, let `R_P = Γ([Z¹(W_E/P, Ĝ)_Λ/Ĝ], O)` act through ES1:spectral-center.2. Define `centralSupport`: `Ann_P(A) = {f ∈ R_P : f_A = 0 in π₀ End(A)}` and `Supp_P(A) = V(Ann_P(A)) ⊂ Spec R_P`. This is reduced support on the affine invariant quotient: it is neither support in the derived stack nor nilpotent singular support. A smaller cutoff compares supports through the open and closed embedding of pieces and ES1:finite-ramification.7; without the centre-order condition the same construction on the excursion algebra gives a support with the same underlying points through the universal homeomorphism. Prove `centralAnnihilator_mem` (`f ∈ Ann(A)` iff `f_A = 0`), `centralSupport_mem` (`x ∈ Supp(A)` iff `Ann(A) ⊂ x`), `centralSupport_iso`, `centralSupport_of_faithful_action` (a faithful evaluated action has full support) and `centralSupport_idempotent` (for an idempotent `e`, the support of the `e`-summand lies where `e = 1` and that of the `(1 − e)`-summand where `e = 0`) (Fargues–Scholze, §IX.5, pp. 328–329, for the centre action; the support is defined here from Mathlib's `PrimeSpectrum.zeroLocus`). In `Suggested.lean`, `centerEvaluation`, `centralAnnihilator` and `centralSupport` are defined for any ring map into the centre of a preadditive category. *Needs:* ES1:spectral-center.2; ES1:finite-ramification.7; Mathlib `Ideal`, `PrimeSpectrum`, `PrimeSpectrum.zeroLocus`, `PrimeSpectrum.mem_zeroLocus`, `RingHom.ker`, `ModuleCat.of`, `DualNumber`, `TrivSqZeroExt.fstHom`.

**Checks.**

- The zero object has annihilator `R_P` and empty support.
- For `C = Perf(R_P)` with its scalar action, `R_P` itself has annihilator `0` and full support (`centralSupport_free`).
- For `R = k[ε]/(ε²)` acting on `Perf(k)` through `R → k`, the compact object `k` has annihilator `(ε)` and full underlying support: support forgets the nilpotent thickening (`centralSupport_nilpotent`; `k` is not a perfect `R`-module and is not used as one).

### ES4.2 Support under exact operations

Prove `support_exact_operations`: for a fixed central action of `R_P`, support is invariant under isomorphism and shifts, the support of a finite direct sum is the union, a retract has support contained in that of its source, and for a distinguished triangle `A → B → C → A[1]`, `Supp(B) ⊂ Supp(A) ∪ Supp(C)`, with the rotated variants. Algebraically `Ann(A) · Ann(C) ⊂ Ann(B)`; the intersection `Ann(A) ∩ Ann(C)` need not annihilate `B`. Proof: if `f` kills `A`, naturality makes `A → B` followed by `f_B` zero, so `f_B` factors through `B → C` by the exactness of `Hom(B, −)` on the triangle (`Pretriangulated.Triangle.yoneda_exact₂`); if `g` kills `C` then `g_B f_B = 0`; pass to zero loci by `zeroLocus_mul` and use biproduct projections for sums; the rotations use that the central components commute with the shift functors, which is a hypothesis on the homotopy category (naturality alone does not give it) (Fargues–Scholze, §IX.5, p. 329). *Needs:* ES4.1; EnhancedDerivedSheaves E5:abstract; Mathlib `PrimeSpectrum.zeroLocus_mul`, `PrimeSpectrum.zeroLocus_inf`, `CategoryTheory.Pretriangulated`, `Pretriangulated.Triangle`, `Pretriangulated.Triangle.yoneda_exact₂`, `CategoryTheory.shiftFunctor`, `Limits.biprod`.

**Checks.**

- The triangle `k → R → k → k[1]` in `D(R)` for `R = k[ε]/(ε²)`: `ε` kills both ends and not the middle, while `ε²` kills the middle.
- Zero objects and finite direct sums behave as stated; two endpoints of empty support force an empty middle support.

### ES4.3 Support under coefficient change

Prove `support_coefficient_change`: for compatible central actions along `R → S` and an exact scalar-extension functor `A ↦ A_S`, the ideal `Ann_R(A) S` kills `A_S`, so `Supp_S(A_S)` lies in the inverse image of `Supp_R(A)` (`support_compatible_functor` in `Suggested.lean`). If `S` is flat over `R` and the degree-zero comparison `End(A) ⊗_R S → End(A_S)` is an `S`-linear isomorphism carrying `1 ⊗ id_A` to `id_{A_S}`, then `Ann_S(A_S) = Ann_R(A) S` and the supports are equal. Proof: write evaluation `R → End(A)` as `LinearMap.toSpanSingleton` at `id_A`, whose kernel is `Ann_R(A)`; flatness preserves the kernel (`Module.Flat.lTensor_exact`); identify `S ⊗_R R` with `S` and the tensor evaluation with `s ↦ s · id_{A_S}`; conclude by `PrimeSpectrum.preimage_comap_zeroLocus` and `zeroLocus_span` (Fargues–Scholze, Theorem IX.5.2, p. 329, and Theorem X.0.1, pp. 339–340, for the actions; Stacks Project, Tag 00H9, for flatness). In the nonflat derived case only the containment is asserted, and for geometric `A` the endomorphism comparison is the E5 and VS3 contract. *Needs:* ES4.1; ES1:spectral-center.3; ES3.9; EnhancedDerivedSheaves E5:presentability; Mathlib `PrimeSpectrum.comap`, `Module.Flat`, `Module.Flat.lTensor_exact`, `LinearMap.toSpanSingleton`, `Ideal.map`, `PrimeSpectrum.preimage_comap_zeroLocus`, `PrimeSpectrum.zeroLocus_span`, `ZMod`.

**Checks.**

- Over the flat identity map of `ℤ`, the module `ℤ` and the zero module have annihilators `0` and `ℤ`, although the zero functor intertwines the actions: compatible functors give no endomorphism comparison (`support_coefficient_change_requires_End_comparison`).
- Along `ℤ → ℤ/2`, `ℚ` becomes `0`, the endomorphism comparison exists and preserves the identity, and the annihilator grows from `0` to the unit ideal: flatness cannot be dropped (`support_coefficient_change_requires_flatness`).
- Reduction modulo `ℓ` is not asserted to preserve supports merely because the categorical action is exact.

### ES4.4 Central localization

Prove `central_localization`: for a small idempotent-complete stable `R`-linear category `C` and `f ∈ R`, localize `Ind(C)` at the telescope of multiplication by `f` and take compact objects, with idempotent completion. A compact `A` maps to zero iff `f^n · id_A = 0` for some `n`, equivalently `Supp_R(A) ⊂ V(f)`; the localized action makes `f` invertible; for an idempotent `e` the localization is the `e`-summand of ES1:finite-ramification.6. The telescope and its mapping formula (`Hom(A, A[f⁻¹])` is the `f`-directed colimit for compact `A`) are built from Ind-completion and Verdier localization (E5 contract); the radical criterion is `PrimeSpectrum.zeroLocus_subset_zeroLocus_iff` (`centralSupport_subset_principal_iff` in `Suggested.lean`). Arbitrary closed substacks are not identified with categories of sheaves on them (Fargues–Scholze, §IX.5, pp. 328–329, and opening of Chapter X, p. 339, for the idempotent case). *Needs:* ES4.1; ES4.2; ES1:finite-ramification.6; EnhancedDerivedSheaves E5:presentability.1, E5:presentability.3; Mathlib `PrimeSpectrum.zeroLocus_radical`, `PrimeSpectrum.zeroLocus_subset_zeroLocus_iff`, `CatCenter.localizationRingHom`.

**Checks.**

- For `C = Perf(R)` the localization is `Perf(R[f⁻¹])`.
- For `f = 1` nothing is killed; for `f = 0` everything is.
- An idempotent gives the two component factors.

### ES4.5 Duality of the centre and the Chevalley involution

Prove `duality_and_the_chevalley_involution` (Fargues–Scholze, Proposition IX.5.3, pp. 329–330; Proposition VI.12.1, pp. 239–241; Proposition VII.7.6, pp. 274–275): under the centre-order condition, Bernstein–Zelevinsky duality on compact lisse objects (VS5, with its biduality and coefficient range) induces an involution `D_geom` of the geometric centre, the pinned Chevalley involution induces `D_spec` on `Z_spec`, and `D_geom ∘ (Z_spec → Z_geom) = (Z_spec → Z_geom) ∘ D_spec`. Pull creation, annihilation and the Weil action through duality; the Satake switch is Chevalley up to the inner automorphism `Ad(ρ̂(−1))` (GS4), which is kept until the passage to the conjugation quotient, where it disappears; conclude on invariant generators (LP2e.14). The compatibility of parameters with smooth duals is ES6:duality.2. *Needs:* ES1:spectral-center.2; ES0.3; VS5.1; VS5.3; GS4:integral-dual-group (*Chevalley involution with its inner sign*); LP2e.14.

**Checks.**

- For `GL_n` the involution on parameters is the contragredient.
- The inner correction is kept before the quotient.
- No isomorphism between the enhanced and homotopy centres is used.

### ES4.6 Excursions on local shtuka cohomology

Prove `local_shtuka_excursion_compatibility` (Fargues–Scholze, Proposition IX.3.2, pp. 326–327; §I.9, pp. 35–36): identify the cohomology of the local shtuka tower with `i_b^* T_V(j_! c-Ind_K^{G(E)} Λ)` with its normalization (HS3.4), for `K` pro-`p` so that it is compact (HS3.6). Transported through this identification, the excursion operators commute at each level with the smooth `G_b(E)`-action (naturality, then restriction to the stratum), commute with the `G(E)`-action on the colimit over levels through the transition correspondences (HS3.7), multiply as the excursion algebra, and keep HS3's Weil continuity. No single finite-wild cutoff is asserted for the noncompact colimit over levels. *Needs:* ES0.3; ES1:finite-ramification.3; ES1:finite-ramification.2; HS3.4; HS3.6; HS3.7; HS4.1; VS4.2.

**Checks.**

- The trivial Hecke representation gives the identity at every level, and the level transitions for pro-`p` `K′ ⊂ K` commute with the operators.
- The `G_b(E)`-action is at fixed level, the `G(E)`-action on the colimit.

### ES4.7 Elliptic parameters

For an algebraically closed field `L` of characteristic zero, define `ellipticParameter`: a continuous parameter `φ` with the prescribed projection is elliptic if it is semisimple (LP2e.5, not merely Frobenius-semisimple) and `S_φ / Z(Ĝ)^Γ` is finite, where `S_φ` is the `Ĝ`-centralizer of the twisted parameter, a group scheme, and `Z(Ĝ)^Γ` the Weil-fixed centre. Unramified central twists still move `φ` within its component; that the twists fill the component is ES4.8. Prove `ellipticParameter_iff`, `ellipticParameter_conjugate` and `ellipticParameter_central_twist` (Fargues–Scholze, Definition X.2.1, p. 346). *Needs:* LP2e.5; LP2e.6; LP1.7; GS4:integral-dual-group.

**Checks.**

- For a torus `S_φ = Ĝ^Γ`, so every parameter is elliptic.
- For split `GL₂` and the trivial parameter, `S_φ/Z(Ĝ) = PGL₂` is positive dimensional, so it is not elliptic.
- For `GL_n`, an irreducible Weil representation is elliptic, and a reducible semisimple one is not.

### ES4.8 The component of an elliptic parameter

Prove `elliptic_parameter_component` (Fargues–Scholze, Definition X.2.1 and the following paragraph with its footnote, p. 346, continued on p. 347): for elliptic `φ` over `Q̄_ℓ`, its unramified central twists form the connected component `C_φ` of the parameter stack; the corresponding clopen idempotent defines the summand `D_lis^{C_φ}` on which it acts as the identity; and if `Z(Ĝ)^Γ` is finite then `C_φ = [*/S_φ]`, a point with stabilizer, not a point with its inertia forgotten. Proof: the tangent complex is `RΓ(W_E, ad φ)[1]` (LP1.10); semisimplicity and finiteness give `H⁰(W_E, ad φ) = Lie(Z(Ĝ)^Γ)`; by local Tate duality (LP1.9), `H²` vanishes once `H⁰(W_E, (ad φ)^*(1)) = 0`, which is proved here (ellipticity alone is not that statement); the Euler characteristic of LP1.3 then gives `dim H¹ = dim H⁰`; the tangent map of unramified central twists is compared with `H¹`, and it is proved that their image is the whole connected component, not only a formally open neighbourhood; the stabilizer is kept in the quotient; ES1:finite-ramification.6 and its excursion-only form give the summand. *Needs:* ES4.7; LP1.3; LP1.9; LP1.10; ES1:finite-ramification.6; LP2e.9.

**Checks.**

- For irreducible `φ` of `GL_n` the scalar unramified-twist direction is kept.
- When the fixed centre is finite the component is `[*/S_φ]`.

### ES4.9 Basic decomposition of an elliptic component

Prove `basic_decomposition_of_an_elliptic_component` (Fargues–Scholze, §X.2, pp. 346–348): for elliptic `φ` and `A ∈ D_lis^{C_φ}`, the restriction of `A` to every nonbasic stratum vanishes, because a nonbasic stratum forces the parameter through a proper Levi (ES7:parabolic.6), contradicting ellipticity; so the compact category decomposes over basic `b` (VS4.4), and its smooth representations lie in supercuspidal Bernstein components (ES7:parabolic.7). If `Z(Ĝ)^Γ` is finite, the component category is the direct sum of copies of `Perf(Q̄_ℓ)` indexed by basic `b` and supercuspidal `π` of `G_b(E)` with parameter `φ`, by the Ext computation in discrete supercuspidal blocks (SR.3.2 *cuspidal-splitting*). This structural description does not identify the indexing set with irreducible representations of `S_φ` (Conjecture X.2.2). *Needs:* ES4.8; ES7:parabolic.6; ES7:parabolic.7; VS4.4; VS4.2; SR.3.2.

**Checks.**

- The indexing set is not identified with `Irr(S_φ)`.
- In the finite-centre case the automorphism groups of parameters are kept.

### Examples

For `G = GL₁` every parameter is elliptic, and since every class in `B(G_m)` is basic, ES4.9 says nothing beyond ES4.8. For `G = GL₂` and an irreducible two-dimensional `φ`, the summand `D_lis^{C_φ}` lives on the basic strata, where `G_b` is `GL₂` or `D^×` (the quaternion division algebra) according to the parity of the Kottwitz invariant, and its smooth representations there are supercuspidal representations of `GL₂(E)` and representations of `D^×` with parameter in `C_φ`.

### Dependencies

ES0; ES1:finite-ramification; ES1:spectral-center; ES3; ES7:parabolic; LanglandsParameterStacks LP1, LP2e; HeckeStacksAndLocalShtukas HS3, HS4; VStackSheavesAndLisseCategories VS4, VS5; GeometricSatakeAndFusion GS4; SmoothRepresentationsOfLocalGroups SR.3; EnhancedDerivedSheaves E5.

## Layer ES6:duality: duals of representations

### ES6:duality.1 Bernstein–Zelevinsky duals

Prove `bernstein_zelevinsky_duals` (Fargues–Scholze, proof of Proposition IX.5.3, p. 330; proof of Proposition VI.12.1, p. 241): the spectral-to-geometric centre map intertwines the involution of `Z_spec` induced by the pinned Chevalley involution `θ` with the involution of `Z_geom` induced by Bernstein–Zelevinsky duality (ES4.5). If `A` and `D_BZ(A)` are Schur and the duality is defined in the required category, `φ_{D_BZ A} = θ ∘ φ_A` up to `Ĝ`-conjugacy; a Schur cohomological constituent with inherited scalar central action has the same parameter. Under duality creation and annihilation are exchanged and the Weil action passes through the Satake switch, which is `Ad(ρ̂(−1)) ∘ θ` and pulls back invariant coefficients by `θ` after the conjugation quotient; uniqueness of the scalar character concludes. On irreducible smooth representations the classical Bernstein–Zelevinsky comparison with its shifts is used; the dual complex is not assumed to be a representation in degree zero. Use the coefficient policy (ES6:functoriality.1) for the centre square and the excursion form for arbitrary `L`. *Needs:* ES6:functoriality.1; ES5.3; ES1:spectral-center.2; ES4.5; GS4:integral-dual-group (*Chevalley involution with its inner sign*); HS1.5; HS1.7; VS5.1; VS5.3 (with the VS5 contract).

**Checks.**

- For a torus, `θ` is inversion and dual characters invert.
- The compact Bernstein–Zelevinsky dual may carry a shift and is not identified with the smooth dual without the classical comparison.

### ES6:duality.2 Smooth contragredients

Prove `smooth_duals` (Fargues–Scholze, Proposition IX.5.3 and its proof, pp. 329–330): for every irreducible smooth `L`-representation `π` of `G(E)`, with `L` algebraically closed of characteristic different from `p`, the smooth contragredient `π^∨` is irreducible and `φ_{π^∨} = θ ∘ φ_π` up to `Ĝ`-conjugacy. For supercuspidal `π` this is ES6:duality.1 with its shift. In general realize `π` as an irreducible subquotient of a parabolic induction from a supercuspidal `σ` (requested SR `supercuspidal_support_exists_ne_p`), take smooth duals using `admissible_smooth_dual_ne_p` and the contragredient of induction (SR.2.2 *induced-contragredient*, with the opposite parabolic and the modulus factor), and apply ES7:parabolic.7–.8 on both sides with the Chevalley compatibility of twisted Levi inclusions. This statement comes after ES7:parabolic; the functoriality targets of ES6:functoriality never use it. *Needs:* ES6:duality.1; ES5.7; ES7:parabolic.7; ES7:parabolic.8; SR.2.2; requested SR `supercuspidal_support_exists_ne_p`, `admissible_smooth_dual_ne_p`; ES1:spectral-center.2; VS5.1.

**Checks.**

- For a character of `G_m`, `φ_{χ⁻¹} = φ_χ⁻¹`.
- The argument covers every irreducible subquotient, not only a socle or cosocle.

### Dependencies

ES1:spectral-center; ES4; ES5; ES6:functoriality; ES7:parabolic; GeometricSatakeAndFusion GS4; HeckeStacksAndLocalShtukas HS1; VStackSheavesAndLisseCategories VS5; SmoothRepresentationsOfLocalGroups SR.2, SR.3.

## Layer ES7:GLn-comparison: the two-leg trace and characteristic zero

For `GL_n`, the parameter of a supercuspidal representation is computed by realizing two Hecke operations on its Jacquet–Langlands transfer through the cohomology of the Lubin–Tate and Drinfeld towers: the two-leg excursion operator is then a trace, and traces determine semisimple representations in characteristic zero (proof of Theorem IX.7.4). The trace theorem is characteristic-free; the tower input is ET.6a in characteristic zero and ES7:equal-characteristic.22 in characteristic `p`.

### ES7:GLn-comparison.1 The two-tower realization in characteristic zero

Let `E` be a finite extension of `ℚ_p`, coefficients `Q̄_ℓ`, `π` a supercuspidal representation of `GL_n(E)` with classical parameter `ρ_π` (ET.6), `D` the division algebra of invariant `1/n`, `σ = JL(π)` and `b` the basic class with `E_b = O(−1/n)`. Prove `two_tower_realisation` (Fargues–Scholze, proof of Theorem IX.7.4, p. 338): for the sheaf `B` of `σ` on the `b`-stratum, `T_Std(B)` restricted to the open stratum is `π ⊗ ρ_π`, and the second operation, for `Std^∨`, returns `σ ⊗ ρ_π^∨` on the `b`-stratum; hence the two-leg composite restricted to `b` is `σ ⊗ ρ_π ⊗ ρ_π^∨` with its two independent Weil actions, the usual shift `[n − 1]` and twist `((n − 1)/2)` being absorbed in the Satake normalization. The cohomology of the towers and the comparison of towers with Hecke fibres are ET.6a (Scholze–Weinstein, Theorem 24.2.5 for `E = ℚ_p`, Corollary 24.3.5 for the EL data of `Res_{E/ℚ_p} GL_n` and of `D` in general, with the identification of `Res_{E/ℚ_p} GL_n`-shtukas with `GL_n/E`-shtukas at all levels and compatibly with the three actions), and HS3.4 is the Hecke-cohomology interface. *Needs:* ET.6; ET.6a; HS3.4; HS4.1; VS4.2; BunGAndNewtonStrata §1.13; GS4:integral-dual-group (*Normalized integral Satake equivalence*); Mathlib `Representation`.

**Checks.**

- The two Weil factors act on `ρ_π` and on `ρ_π^∨` separately.
- For `n = 1` all shifts and half twists vanish.

### ES7:GLn-comparison.2 Two-leg excursions compute traces

Prove `two_leg_excursion_is_trace`: let `k` be a field of characteristic zero and `ρ` a representation of `W_E` of finite dimension `n > 0`. If the two-operation realization of `B` is `σ ⊗ ρ ⊗ ρ^∨` with creation `α = a · (id_σ ⊗ coev)` and annihilation `β = b · (id_σ ⊗ ev)`, then the excursion operator at `(γ₁, γ₂)` is `ab · tr(ρ(γ₁ γ₂⁻¹))`; its value at `(1, 1)` is the constant excursion function `n`, so `ab · n = n` and `ab = 1`. In the geometric applications `k = Q̄_ℓ`, `End_{D^×}(σ) = k` and `End_{W_E}(ρ) = k`, and creation and annihilation are equivariant for `D^×` and the diagonal `W_E`, which gives the scalar forms by Schur's lemma; irreducibility over an arbitrary characteristic-zero field would not give these endomorphism rings. The two Weil factors act between creation and annihilation; coevaluation is invariant only under the diagonal (Fargues–Scholze, proof of Theorem IX.7.4, p. 338). In `Suggested.lean`, `two_leg_excursion_is_trace` states the linear-algebra identity `contractRight ∘ (ρ(g) ⊗ ρ^∨(h)) ∘ coevaluation = tr ρ(g h⁻¹)`. *Needs:* HS4.1; HS4.2; ES0.3; SR.3 (scalar endomorphisms over `Q̄_ℓ`, with the SR contract); Mathlib `Representation`, `Representation.dual`, `coevaluation`, `contractRight`, `LinearMap.trace`.

**Checks.**

- At `(γ, γ)` the value is `n`.
- For `n = 1` and a character `χ` the value is `χ(γ₁)/χ(γ₂)`.
- In characteristic `ℓ` with `ℓ | n` the identity `ab · n = n` does not give `ab = 1`; characteristic zero is used.
- For a nontrivial character `χ`, coevaluation transforms under `(γ₁, γ₂)` by `χ(γ₁)/χ(γ₂)`; it is invariant only under the diagonal.

### ES7:GLn-comparison.3 Traces determine the semisimple parameter

Prove `trace_determines_semisimplification`: finite-dimensional semisimple characteristic-zero representations of `W_E` with equal traces are isomorphic, as continuous representations when both are continuous. This is ArithmeticGaloisRepresentations R01.1 (*brauer-nesbitt-traces*, stated for any group with `d!` invertible) applied to `W_E`, fed with the traces `tr ρ(γ)` from ES7:GLn-comparison.2 at `(γ, 1)` (Fargues–Scholze, proof of Theorem IX.7.4, p. 338). *Needs:* R01.1; Mathlib `LinearMap.trace`, `Representation`.

**Checks.**

- A representation with nontrivial monodromy has the same traces as its semisimplification: `N` is not determined.

### ES7:GLn-comparison.4 Supercuspidal agreement in characteristic zero

Prove `supercuspidal_agreement`: for `E` of characteristic zero and `π` an irreducible supercuspidal `Q̄_ℓ`-representation of `GL_n(E)`, `φ_π ≅ ρ_π`. ES7:GLn-comparison.2–.3 applied to ES7:GLn-comparison.1 identify the parameter of `σ = JL(π)` on the basic stratum with `ρ_π`; the sheaf of `π` on the open stratum is a direct summand of `T_Std(B)` after forgetting the Weil action, and Hecke compatibility of excursion operators transports the parameter to `π` (Fargues–Scholze, proof of Theorem IX.7.4, p. 338). *Needs:* ES7:GLn-comparison.1; ES7:GLn-comparison.2; ES7:GLn-comparison.3; ES5.6; HS3.4; HS4.1; VS4.2.

**Checks.**

- Selecting `π` requires forgetting the Weil action; no invariant vector of the irreducible `ρ_π` is used.

### ES7:GLn-comparison.5 Agreement for every irreducible in characteristic zero

Prove `all_irreducible_representations` (Fargues–Scholze, Theorem IX.7.4 and the first line of its proof, p. 338): for `E` of characteristic zero and every irreducible smooth `Q̄_ℓ`-representation `π` of `GL_n(E)`, `φ_π` is the semisimplification of the Weil part of the classical Weil–Deligne parameter of `π` (ET.6). Write `π` as a subquotient of the normalized induction of a supercuspidal representation of a Levi (SR.3.1); ES7:parabolic.8 computes `φ_π` with the ordinary Levi inclusion, and the classical correspondence satisfies the same rule on segments. This is agreement of semisimple Weil parameters; the monodromy operator is not identified. *Needs:* ES7:GLn-comparison.4; ES7:parabolic.8; ES5.6; SR.3.1; ET.6; R01.2 *weil-deligne-representation*, *frobenius-semisimplification*.

**Checks.**

- The trivial and Steinberg representations have the same semisimple parameter, with different `N`.

### Dependencies

ES0; ES5; ES7:parabolic; EndoscopicTransferAndUnitaryTraceComparison ET.6, ET.6a; HeckeStacksAndLocalShtukas HS3, HS4; VStackSheavesAndLisseCategories VS4; ArithmeticGaloisRepresentations R01.1, R01.2; SmoothRepresentationsOfLocalGroups SR.3.

## Layer ES7:function-field-automorphic: division algebras over function fields

Equal-characteristic towers are realized through `D`-elliptic sheaves, whose cohomology is computed by a trace formula on a compact division-algebra quotient. This layer supplies the automorphic side: maximal-order data, compactness and discrete spectrum, the kernel trace formula, the Euler–Poincaré function at the place `∞` and supercuspidal selectors, the simple trace comparison with `GL_d`, the selected globalization and the selected inner-form transfer of Laumon–Rapoport–Stuhler, §§13 and 15. Throughout, `X` is a smooth projective geometrically connected curve over `F_q` with function field `F`, and `∞` a rational place.

### ES7:function-field-automorphic.1 Maximal-order data

Define `DOrder`: for `d ≥ 1` and a central simple `F`-algebra `D` of dimension `d²`, a locally free `O_X`-algebra `𝒟` with generic fibre `D` whose completions `𝒟_x` are maximal `O_x`-orders (maximal by inclusion among `O_x`-orders, the finite `O_x`-lattices containing `1` and closed under multiplication), together with the ramification set `R = {x : D_x not split}` and, at `x ∉ R`, chosen identifications `(D_x, 𝒟_x) ≅ (M_d(F_x), M_d(O_x))`. The data impose no split-place condition; the `D`-elliptic consumers choose `∞ ∉ R`. The order sheaf is part of the data; its existence by gluing local maximal orders is proved here. Prove `DOrder.local`, `DOrder.split_equiv`, `DOrder.change_lattice` (changing a split lattice by `g` conjugates the order by `g`), `DOrder.ramification` and `DOrder.units_isCompactOpen` (each `𝒟_x^×` is compact open in `D_x^×`, equal to `GL_d(O_x)` at split places) (Hausberger 2005, §1.1, p. 1291). *Needs:* FunctionFieldArithmetic FA.2; AdelicAlgebraicGroups AA.1 (for function fields); ReductiveGroupsPartII RG2.0; SchemeAndStackFoundations SF.0, SF.2 *sheaf-algebra*, SF.3; Mathlib `AlgebraicGeometry.Scheme`, `Module.Free`, `Algebra.IsCentral`, `Submodule.IsLattice`.

**Checks.**

- For `D = F`, `𝒟 = O_X` and every local maximal order is `O_x`.
- For the standard lattice `O_x^d` the order is `M_d(O_x)`, with units `GL_d(O_x)`.
- `diag(π_x, 1, …, 1)` lies in the split order and is invertible over `F_x` but is not a unit of the order.

### ES7:function-field-automorphic.2 Compactness of the division-algebra quotient

Prove `division_quotient_compactness`: for a central division algebra `D` over `F` (including the inner form `D̄` ramified at `∞`), `D^×(F)` is discrete in `D^×(A_F)`, the quotient is compact modulo `A_F^×`, and after dividing by the central lattice `π_∞^ℤ` with a compatible central-character quotient, `D^×(F) \ D^×(A_F)/π_∞^ℤ` is compact; at finite level the quotient is compact with finite stabilizers, and the whole adelic quotient is not finite as a set. Proof: anisotropy of `PGL₁(D)` and reduction theory over function fields, with compactness of the degree-zero idele class group (FA.2) (Laumon–Rapoport–Stuhler, §13.3, p. 291; their assertion of finiteness of `F^×\A^×/π_∞^ℤ` is corrected to compactness, *Source corrections*). *Needs:* ES7:function-field-automorphic.1; FunctionFieldArithmetic FA.2, FA.6; AdelicAlgebraicGroups AA.0 *restricted-haar-product*, AA.1; ReductiveGroupsPartII RG2.0.

**Checks.**

- For `d = 1` this is compactness of the idele class group after the degree lattice.
- For `d > 1` the analogous `GL_d` quotient is not compact modulo the centre.

### ES7:function-field-automorphic.3 Discrete spectrum

Prove `discrete_spectrum`: for a unitary central character trivial on the degree lattice, `L²` of the compact quotient is a Hilbert sum of irreducible admissible automorphic `Π` with finite multiplicities `m(Π)`; its smooth `K`-finite vectors form the space of automorphic forms; each `Π = ⊗′_v Π_v` with spherical vectors at almost all places; and at a fixed compact open level the space of automorphic forms is finite dimensional (an infinite tower of levels is not). The Hilbert decomposition over `ℂ` is AutomorphicSpectralTheory AS.0; the restricted tensor product and the descent of algebraic automorphic representations from `ℂ` to `Q̄_ℓ` are FunctionFieldArithmetic FA.6 with SR.3's coefficient comparison (Laumon–Rapoport–Stuhler, §13.3, p. 291). *Needs:* ES7:function-field-automorphic.2; AS.0; SR.3; FA.6; SR.0.2.

**Checks.**

- At fixed `K`, traces are finite sums; summing over the whole tower without a convergence statement is not used.

### ES7:function-field-automorphic.4 The kernel trace formula

Prove `kernel_trace_identity` (Laumon–Rapoport–Stuhler, §13.5, p. 291): for a locally constant `f`, compactly supported modulo `π_∞^ℤ` and bi-invariant under a compact open `K`, with compatible Haar measures on `D^×(A)`, on centralizers and on `π_∞^ℤ` (AA.0), convolution has finite rank on the `K`-invariant automorphic forms, with locally finite kernel `K_f(x, y) = Σ_{γ ∈ D^×(F)} f(x⁻¹ γ y)`, and `Σ_Π m(Π) tr Π(f) = Σ_{[γ]} vol(D_γ^×(F) \ D_γ^×(A)/π_∞^ℤ) O_γ(f)`. Absolute integrability comes from compactness and local finiteness at level `K`. *Needs:* ES7:function-field-automorphic.2; ES7:function-field-automorphic.3; AA.0 *restricted-haar-product*; SR.1.1.

**Checks.**

- Rescaling a Haar measure rescales the convolution function inversely.
- The identity term contributes the quotient volume times `f(1)`.

### ES7:function-field-automorphic.5 The Euler–Poincaré function

At `∞` identify `D_∞^×` with `GL_d(F_∞)`, `F_∞` of characteristic `p`. For simple roots `Δ` and `I ⊂ Δ`, let `P_I` be the normalizer of the facet of type `I`, `P_I⁰` its compact parahoric and `χ_I` the orientation character of `P_I` extended by zero. Construct `EulerPoincareFunction`: `f_∞ = Σ_{I ⊂ Δ} (−1)^{|Δ∖I|} χ_I / ((|Δ∖I| + 1) vol(P_I⁰))`, for a Haar measure on `GL_d(F_∞)/F_∞^×`; it descends to `PGL_d(F_∞)` with compact support. It is a finite alternating sum of oriented facet-normalizer functions; the normalizer is distinguished from the pointwise fixer. Prove `EulerPoincareFunction.central` (invariance under `F_∞^×`), `EulerPoincareFunction.haar_rescale` (`a · dh` replaces `f_∞` by `a⁻¹ f_∞`) and `EulerPoincareFunction.support` (support modulo the centre in the union of facet normalizers) (Laumon–Rapoport–Stuhler, §13.1, p. 290). The real Euler–Poincaré functions of AutomorphicSpectralTheory AS.6.19 are a different construction. *Needs:* ReductiveGroupsPartII RG2.2, RG2.3; SR.1.1; ES7:function-field-automorphic.1; Mathlib `MeasureTheory.Measure.haar`.

**Checks.**

- For `d = 1` the building is a point and `f_∞` is the normalized constant on `GL₁(F_∞)/F_∞^×`.
- Doubling the Haar measure halves `f_∞` and leaves `tr π(f_∞)` unchanged.
- In the tree of `GL₂`, an element of the edge normalizer exchanging its two vertices has orientation sign `−1`.

### ES7:function-field-automorphic.6 Orbital integrals of the Euler–Poincaré function

Prove `euler_poincare_orbital_integrals` (Laumon–Rapoport–Stuhler, Theorem 13.2(i), p. 290): for regular nonelliptic `γ ∈ GL_d(F_∞)`, `O_γ(f_∞) = 0`; for regular elliptic `γ` matching `γ̄` in `D̄_∞^×` (the division algebra of invariant `1/d`) and `f̄_∞ = 1/vol(D̄_∞^×/π_∞^ℤ)`, `O_γ(f_∞) = ε_∞(γ̄) O_γ̄(f̄_∞)` with transferred centralizer measures and the Kottwitz sign. The proof is the Euler-characteristic computation on the building, tracking orientations (Laumon's §5 and Kottwitz's Theorem 2′, as cited by LRS). *Needs:* ES7:function-field-automorphic.5; ReductiveGroupsPartII RG2.2; Mathlib `MeasureTheory.Measure.haar`.

**Checks.**

- A split regular element has orbital integral `0`.

### ES7:function-field-automorphic.7 Character traces of the Euler–Poincaré function

Prove `euler_poincare_character_traces` (Laumon–Rapoport–Stuhler, Theorem 13.2(ii), p. 290): for an irreducible unitary representation of `GL_d(F_∞)` trivial on `π_∞^ℤ`, `tr π(f_∞) = 0` except for the trivial representation (trace `1`) and the Steinberg representation (trace `(−1)^{d−1}`); a nontrivial central character gives `0` by central invariance. In characteristic `p` the proof of LRS 13.2(ii), through the building resolution, is used; its cited characteristic-zero hypothesis does not enter that proof. *Needs:* ES7:function-field-automorphic.5; SR.3; ReductiveGroupsPartII RG2.2.

**Checks.**

- For `d = 2` the Steinberg trace is `−1`.

### ES7:function-field-automorphic.8 Supercuspidal selectors

For a supercuspidal characteristic-zero representation `π` of `GL_d(K)` with fixed unitary central character and a compact open `K₀` with `π^{K₀} ≠ 0`, put `e_{K₀} = 1_{K₀}/vol(K₀)` for the chosen Haar measure, so `π(e_{K₀})` is the projector onto `π^{K₀}`. Construct `CuspidalSelector`: the matrix-coefficient map `φ(A)(g) = tr(π(g⁻¹) A)` on finite-rank smooth endomorphisms satisfies `π ∘ φ = c ≠ 0` (Schur orthogonality for compactly supported modulo the centre matrix coefficients), and `f_π = c⁻¹ φ(π(e_{K₀}))` acts by `π(e_{K₀})` on `π` and by `0` on every other irreducible admissible representation with the same central character; average over `K₀` on both sides. Prove `CuspidalSelector.value_one` (`f_π(1) = c⁻¹ dim π^{K₀} ≠ 0`), `CuspidalSelector.trace` and `CuspidalSelector.support` (compact modulo the centre) (Laumon–Rapoport–Stuhler, proof of Lemma 15.10, pp. 314–315). It is not the indicator of `K₀`. *Needs:* SR.1.1; SR.3; Mathlib `MeasureTheory.Measure.haar`.

**Checks.**

- For `dim π^{K₀} = 1` and `c = 1`, `f_π(1) = 1`.
- Its central translation law is the inverse of the fixed central character in the convolution convention.
- The normalized indicator `e_{K₀}` acts on every representation with `K₀`-invariants, whereas `f_π` kills the other supercuspidals.
- If `vol(K₀) = a ≠ 1`, the unnormalized indicator has trace `a · dim π^{K₀}`; division by `a` is needed for the displayed formula for `f_π(1)`.

### ES7:function-field-automorphic.9 The local transfer identity in equal characteristic

Prove `local_character_identity`: for a supercuspidal `π` of `GL_d(K)` over a nonarchimedean local field `K` of any characteristic and its local Jacquet–Langlands transfer `JL(π)` to the division algebra of invariant `1/d`, matching regular elliptic `g` and `h` (same characteristic polynomial) satisfy `Θ_π(g) = (−1)^{d−1} Θ_{JL(π)}(h)`; Haar measures are matched when the character identity is turned into an identity of test functions and orbital integrals. In equal characteristic this is Badulescu's theorem, as quoted in Hausberger 2005, Theorem 9.1, pp. 1333–1334; it is independent of the global Galois construction, and nonelliptic transfer is not asserted. *Needs:* SR.3; ReductiveGroupsPartII RG2.0; Mathlib `MeasureTheory.Measure.haar`.

**Checks.**

- For `d = 2` the elliptic sign is `−1`.
- No number-field trace formula is used.

### ES7:function-field-automorphic.10 The simple trace comparison

Prove `simple_trace_comparison` (Laumon–Rapoport–Stuhler, proof of Lemma 15.10, p. 315, and Lemma 15.11, p. 316): compare the trace formula of ES7:function-field-automorphic.4 for `D` with the simple cuspidal trace formula of Deligne–Kazhdan for `GL_d`, for factorizable test functions with a supercuspidal selector at an auxiliary split place, an elliptic-regular support condition at a further place, `f_∞` at `∞`, and matching functions at the ramified places (ES7:function-field-automorphic.9), all with a fixed compatible central character: the elliptic orbital sides agree with the transfer signs, and the supercuspidal place kills the proper-parabolic terms. This selected identity isolates the prescribed global constituents; it is not a general invariant trace formula or a general global Jacquet–Langlands correspondence. The Deligne–Kazhdan simple trace formula and Henniart's comparison (quoted by LRS 15.11 from Henniart's appendix A.4) are proved as part of this target. *Needs:* ES7:function-field-automorphic.4; ES7:function-field-automorphic.6; ES7:function-field-automorphic.7; ES7:function-field-automorphic.8; ES7:function-field-automorphic.9; FA.6; SR.3.

**Checks.**

- Without the auxiliary supercuspidal selector the comparison fails.

### ES7:function-field-automorphic.11 Globalization with prescribed cuspidal places

Prove `globalisation` (Laumon–Rapoport–Stuhler, Lemma 15.10 and its proof, pp. 314–316): for distinct places `x₀ = o` and `x₁ = o′`, the rational place `∞`, and a supercuspidal `π` of `GL_d(F_o)` with finite-order central character, choose `x₂ ∉ {o, o′, ∞}`; there is a cuspidal automorphic `Π̃` of `GL_d(A_F)` with `Π̃_o = π`, `Π̃_∞ = St`, `Π̃_{o′}` and `Π̃_{x₂}` supercuspidal, for a compatible global central character, with a further place `x₃` carrying an elliptic-regular test function. Choose selectors at `o, o′, x₂` with nonzero value at `1` and `f_∞` at `∞`, an elliptic rational conjugacy class by the local germ argument and weak approximation, and levels so that one geometric term survives; nonvanishing of the spectral side gives `Π̃`, and global cuspidality excludes the trivial component at `∞`. No general globalization is needed. *Needs:* ES7:function-field-automorphic.10; ES7:function-field-automorphic.7; ES7:function-field-automorphic.8; FA.6; SR.3.

**Checks.**

- The Steinberg component at `∞` comes from excluding the trivial one by cuspidality.
- The central character is global, not chosen place by place.

### ES7:function-field-automorphic.12 The selected inner-form transfer

Prove `jacquet_langlands_transfer`: for `D` with invariants `1/d` at `o`, `−1/d` at `o′` and `0` elsewhere, the globalization `Π̃` of ES7:function-field-automorphic.11 transfers to a unique automorphic `Π` of `D^×(A)` with `Π_v = Π̃_v` at split places and `Π_v = JL(Π̃_v)` at `o, o′`, of multiplicity one. The sufficient condition used is that `Π̃` is essentially square-integrable at the ramified places and supercuspidal at an auxiliary place `v ∉ S`, `S` a finite set outside which `D` splits (Hausberger 2005, Lemmas 10.2–10.3 and Theorem 10.4(2), p. 1340, where the page image has `v ∉ S`; Laumon–Rapoport–Stuhler, Lemma 15.11, p. 316, whose letters `Π` and `Π̃` are exchanged here). Only this selected transfer is used in ES7:equal-characteristic. *Needs:* ES7:function-field-automorphic.11; ES7:function-field-automorphic.10; ES7:function-field-automorphic.9; FA.6.

**Checks.**

- Being supercuspidal only at a ramified place does not meet the auxiliary hypothesis.
- Multiplicity one is asserted only for the selected image.

### Dependencies

FunctionFieldArithmetic FA.2, FA.6; AdelicAlgebraicGroups AA.0, AA.1; AutomorphicSpectralTheory AS.0; ReductiveGroupsPartII RG2.0, RG2.2, RG2.3; SmoothRepresentationsOfLocalGroups SR.0, SR.1, SR.3; SchemeAndStackFoundations SF.0, SF.2, SF.3.

## Layer ES7:equal-characteristic: `D`-elliptic sheaves and the equal-characteristic tower

Laumon–Rapoport–Stuhler construct the local Langlands correspondence for `GL_d` over `K = F_q((t))` from the cohomology of moduli of `D`-elliptic sheaves; Hausberger uniformizes these varieties at a place where `D` is a division algebra by Drinfeld's covers and proves the Drinfeld–Carayol realization of supercuspidals in the cohomology of the Drinfeld tower. This layer builds that route, corrected where the sources need it (*Source corrections*), and transports it to the equal-characteristic Hecke fibres, so that the trace argument of ES7:GLn-comparison applies.

### ES7:equal-characteristic.1 `D`-elliptic sheaves

With order data `(D, 𝒟)` split at the rational `∞` (ES7:function-field-automorphic.1), define `DEllipticSheaf` over an `F_q`-scheme `S`, with `τ = (id_X × Frob_S)^*`: a chain of right `𝒟`-modules `E_i` on `X × S`, locally free of rank `d²` over `O`, with injections `j_i : E_i → E_{i+1}` and `t_i : τE_i → E_{i+1}` making the squares commute, `E_{i+d} = E_i(∞ × S)` with the `d`-fold `j` the canonical inclusion, `E_i / j_{i−1}E_{i−1} = (Γ_∞)_* A_i` and `E_i / t_{i−1}(τE_{i−1}) = (Γ_z)_* B_i` for locally free rank-`d` `A_i, B_i` and a zero `z : S → X ∖ ({∞} ∪ R)`, normalized by `0 ≤ χ(E_0|_{X × s}) < d`; morphisms are `𝒟`-linear chain isomorphisms commuting with `j` and `t`. The normalization is equivalent to the unnormalized stack modulo index shift. For `D = M_d(F)` the Morita equivalence identifies these with Drinfeld's elliptic sheaves of DrinfeldModulesAndTModules DM.7; that case is not rebuilt. Prove `DEllipticSheaf.zero`, `DEllipticSheaf.period`, `DEllipticSheaf.ext`, `DEllipticSheaf.pullback` and `DEllipticSheaf.matrix_case` (Hausberger 2005, Definition 1.1, pp. 1292–1293). *Needs:* ES7:function-field-automorphic.1; AlgebraicModuliForArithmeticGeometry R09.4; DM.7; SchemeAndStackFoundations SF.0, SF.2 *sheaf-algebra*, SF.3; Mathlib `AlgebraicGeometry.Scheme`, `Module.Free`.

**Checks.**

- For `d = 2` each `E_i` has `O`-rank `4` and the pole and zero cokernels have rank `2` on `S`.
- Over `S = Spec F_{q²}`, `τ` twists the coefficients of `S` by the `q`-Frobenius and fixes `X`.
- For `D = M_d(F)` the Morita functor gives DM.7's rank-`d` elliptic sheaf, with its `j`, `t` and zero.

### ES7:equal-characteristic.2 Level structures

Define `DEllipticLevel`: for a nonempty finite closed `I ⊂ X ∖ {∞}` disjoint from `z(S)`, the restrictions `E_i|_{I × S}` are identified by `j` and written `E_I`; a level-`I` structure is a right `𝒟_I`-linear isomorphism `ι : 𝒟_I ⊗ O_S ≅ E_I` with `t ∘ τι = ι` under the canonical Frobenius identification of the trivial module. Prove `DEllipticLevel.restrict` (reduction modulo `I` for `I ⊂ I′`), `DEllipticLevel.pullback` and `DEllipticLevel.unitAction`: the finite group `(𝒟 ⊗ O_I)^×` acts by `ι · g = ι ∘ L_g` with `L_g(x) = gx`, which is right-`𝒟_I`-linear and preserves the Frobenius condition because `g` is `τ`-fixed; right multiplication by a noncentral `g` is not `𝒟_I`-linear (Hausberger 2005, §1.3, p. 1293). *Needs:* ES7:equal-characteristic.1; R09.4; Mathlib `CategoryTheory.Functor`.

**Checks.**

- In rank one over a field, replacing a compatible trivialization by a scalar `a` keeps compatibility exactly when `a^q = a`.
- For `I ⊂ I′ ⊂ I″` restriction from `I″` to `I` is the composite of the two restrictions.
- If the zero meets `I`, `t` need not be invertible on `I`, so that case is excluded.
- In `M₂(F₃)`, `g = diag(1, 2)` and `x = E₁₂`: `x g = 2E₁₂` while `g x = E₁₂`, so right multiplication is not a right-module map and left multiplication is used.

### ES7:equal-characteristic.3 Level moduli

Construct `DEllipticModuli` (Hausberger 2005, Theorem 6.1 with its proof and Theorem 6.4, pp. 1311–1313; Laumon–Rapoport–Stuhler, Theorems 4.1, 5.1, 6.1 and Corollary 6.2, pp. 236, 241, 246): for a nonempty level `I`, normalized `D`-elliptic sheaves with level `I` are represented by `E_{X,D,I}` over `U = X ∖ ({∞} ∪ I ∪ R)`, smooth of pure relative dimension `d − 1` and quasi-projective, and projective when `D` is a division algebra; the normalization equals the quotient of the LRS stack by the index shift. At the distinguished ramified place `o`, for levels disjoint from `o`, special `D`-elliptic sheaves are represented by Hausberger's projective extension over `U ∪ {o}`, not smooth at `o`; levels containing `o` are used only on the generic fibre. The proof uses the moduli of chain bundles and the one-step Hecke diagram with Frobenius transversality, and the complete Quot and Hecke transversality and boundary properness arguments of LRS §§4–6 are part of this target. Prove `DEllipticModuli.points`, `DEllipticModuli.level_map`, `DEllipticModuli.dimension` and `DEllipticModuli.projective`. *Needs:* ES7:equal-characteristic.1; ES7:equal-characteristic.2; AlgebraicModuliForArithmeticGeometry R09.2, R09.5, R09.6; Mathlib `AlgebraicGeometry.Scheme`.

**Checks.**

- At `d = 1` the zero morphism is smooth of relative dimension `0`.
- Choosing `χ(E_0) ∈ [0, d)` gives the same moduli as the quotient of the unnormalized stack by index shift.
- A level containing `o` is not given the formal extension asserted for levels away from `o`.

### ES7:equal-characteristic.4 Frobenius and Hecke correspondences

Construct `DEllipticHecke`: the right action of `D^×(A_F^∞)` on the tower is by finite correspondences between refined levels (an element that does not normalize `K_I` is a correspondence through a smaller level, not an automorphism of `E_I`); at a place of good reduction for a fixed level, geometric Frobenius commutes with the spherical Hecke correspondences; the left action on cohomology is by pullback and pushforward with the inverse of the right-action convention. Prove `DEllipticHecke.mul`, `DEllipticHecke.frobenius` and `DEllipticHecke.level` (Hausberger 2005, §6.3, pp. 1315–1316, and §10.1, p. 1338). *Needs:* ES7:equal-characteristic.3; AdelicAlgebraicGroups AA.1; SR.1.1; EtaleDualityAndPerverseSheaves EDC.8 (*correspondence-composition*, *correspondence-pushforward*).

**Checks.**

- The element `1` gives the identity at every level.
- The product law of the left action on cohomology matches the inversion of the right action.
- The spherical normalization at good places matches LRS 14.9.

### ES7:equal-characteristic.5 Special formal `O_D`-modules

Let `K = F_q((t))`, `D_K` the division algebra of invariant `1/d`, `O_D` its maximal order and `O_d` the integers of the unramified extension of degree `d`. Define `SpecialFormalODModule` over an `O`-algebra `B` in which a power of the uniformizer vanishes: a smooth formal `O`-module `H` with an `O_D`-action such that `Lie H` is an invertible `O_d ⊗_O B`-module; in the moduli problem it has `O`-height `d²` and dimension `d`. Over a splitting base each eigenspace of `O_d` on `Lie H` has rank one; total dimension `d` does not imply this. Prove `SpecialFormalODModule.lie`, `SpecialFormalODModule.baseChange` and `SpecialFormalODModule.dimension` (Hausberger 2005, Definition 3.1, p. 1302). The formal `O`-modules over `F_q[[t]]` and their deformation theory are the HS2 contract. *Needs:* ES7:function-field-automorphic.1; R09.6; HS2 (equal characteristic, contract); Mathlib `Module.Invertible`.

**Checks.**

- For `d = 1` specialness is a one-dimensional formal `O`-module.
- For `d = 2` over a splitting base the two eigenspaces have rank one each.
- A two-dimensional tangent module on which `O₂` acts through one embedding only is not special.

### ES7:equal-characteristic.6 The special deformation space

Prove `special_formal_modules` (Hausberger 2005, Theorems 3.4, 7.2 and 7.4, §§7.2–7.3, pp. 1303, 1317–1319): height-`d²` special formal `O_D`-modules over an algebraically closed residue field are `O_D`-isogenous, with `End⁰_D(Φ) = M_d(K)` for a framing `Φ`; pairs `(H, ρ)` with `ρ : Φ → H` a height-zero quasi-isogeny modulo the uniformizer are represented by `Ω̂^d ⊗̂_O Ô^nr`; `GL_d(K)` acts by changing the framing, through the Drinfeld action and Frobenius descent determined by the valuation of the determinant; and `D_K^×` acts only through `g ↦ Frob^{−v(Nrd g)}` on `Ô^nr`, so `O_D^×` acts trivially on the formal scheme and nontrivially only on the covers `Σ_n` (Hausberger, Propositions 7.5–7.6). The representability theorem of Drinfeld and Genestier in equal characteristic is part of this target. *Needs:* ES7:equal-characteristic.5; R09.6; HS2 (equal characteristic, contract).

**Checks.**

- At `d = 1`, `Ω` has dimension zero.

### ES7:equal-characteristic.7 Uniformization of `D`-elliptic varieties

Prove `uniformisation` (Hausberger 2005, §8.1, pp. 1319–1321, Theorem 8.1, p. 1321, and Theorem 8.3, p. 1323): for `D` with `inv_o(D) = 1/d`, `inv_{o′}(D) = −1/d`, `inv_∞(D) = 0`, let `D̄` have `inv_o(D̄) = 0`, `inv_∞(D̄) = 1/d` and the other invariants of `D`; for a level `I` away from `∞` and `o` put `Z_I = D̄^×(F) \ D̄^×(A^∞)/K_I^{∞,o}` with `D̄_o^× ≅ GL_d(F_o)`. The formal completion of the extended `E_I` along `o` is `((Ω̂^d ⊗̂ Ô_o^nr) × Z_I)/GL_d(F_o)`; at Drinfeld level `n` at `o` the generic analytic fibre is `(Σ_n^d × Z_{I^o})/GL_d(F_o)` with Weil descent (Theorem 8.3 uses restriction of scalars over `F_o`, and §§9.2 and 10 use the `ℤ`-indexed coproduct `Res′` for cohomology). These identifications commute with level restriction, the Hecke action away from `o` and `D_o^×`; no formal model with level at `o` is asserted. *Needs:* ES7:equal-characteristic.3; ES7:equal-characteristic.6; ES7:equal-characteristic.4; ES7:function-field-automorphic.1; ES7:function-field-automorphic.2; HS2; R09.6.

**Checks.**

- `D` and `D̄` are split at different places.
- The double-coset factor uses `D̄`; replacing it by `D` changes the statement.

### ES7:equal-characteristic.8 The fundamental local representation

For `ℓ ≠ p`, define `FundamentalLocalRepresentation`: `Res′ Σ_n^d = ⊔_{r ∈ ℤ} Σ_n^d ⊗_{K̂^nr, φ_q^r} K̂^nr` with its Weil descent (not the ordinary restriction of scalars along the infinite unramified extension), `U_d^i = colim_n H_c^i((Res′ Σ_n^d)_{K̄}, Q̄_ℓ)`, the fundamental representation being the case `i = d − 1`, with commuting actions of `GL_d(K)`, `D_K^×` and `W_K`. A component has stabilizer `P_d = {(g, b, w) : det(g) Nrd(b) Cl(w)⁻¹ ∈ O_Kˣ}`, with `Cl` sending geometric Frobenius to a uniformizer, and `U_d^i = c-Ind_{P_d}^{GL_d(K) × D_K^× × W_K} colim_n H_c^i(Σ_n^d)`. For finite-order `ξ`, `U_d^i(ξ)` is the largest quotient on which the centre of `GL_d(K)` acts by `ξ`. Prove `FundamentalLocalRepresentation.threeActions`, `FundamentalLocalRepresentation.compactInduction`, `FundamentalLocalRepresentation.centralQuotient` and `FundamentalLocalRepresentation.level` (Hausberger 2005, §§9.2–9.3 and Definition 9.3, pp. 1335–1337). *Needs:* ES7:equal-characteristic.6; ES7:equal-characteristic.7; SR.2.1; LP0.2; ClassicalAdicEtaleCohomology H3 *proper-support-direct-image*; Mathlib `Representation`, `DirectSum`, `Representation.ind`.

**Checks.**

- For `d = 2` the fundamental representation is in degree `1`.
- An element with `v(det g) = 1` stabilizes a component together with `w` with `v(Cl(w)) = 1` and `b = 1`: the stabilizer condition involves all three valuations.
- A compactly supported class on `Res′` has finitely many components in its support; all `ℤ`-indexed components occur.

### ES7:equal-characteristic.9 Finiteness of the local cohomology

Prove `local_cohomology_finiteness` (Hausberger 2005, Proposition 10.6(i), p. 1341): for `0 ≤ j ≤ 2(d − 1)` and finite cover level `n`, `H_c^j((Res′ Σ_n^d)_{K̄}, Q̄_ℓ)` is a smooth `GL_d(K) × D_K^×`-module of finite type over `GL_d(K)` with continuous Weil action on compact-open invariants, by Berkovich finiteness and a locally finite covering by translates of compact domains. Admissibility of the whole quotient `U_d^i(ξ)` is a further input (Boyer, Faltings) that the supercuspidal identity does not use; finite type is not admissibility (Hausberger 2005, Proposition 9.4 and the remark there, p. 1337). *Needs:* ES7:equal-characteristic.8; SR.3; ClassicalAdicEtaleCohomology H3; Tau Ceti `TauCeti.IsSmoothDiscrete`.

**Checks.**

- Finite type over `GL_d(K)` is not admissibility: `c-Ind_{K₀}^{GL_d(K)} Q̄_ℓ` for a compact open `K₀` is generated by one vector, and its `K₀`-invariants, the Hecke algebra `H(GL_d(K), K₀)`, are infinite dimensional.

### ES7:equal-characteristic.10 Global cohomology and automorphic isotypes

Prove `global_cohomology` (Hausberger 2005, Theorem 10.1 and its setup, pp. 1338–1339; Laumon–Rapoport–Stuhler, §§14.1–14.2 and Theorem 14.9, pp. 294, 297–298): for division `D` and level `I`, `H_I^i = H^i(E_{I, F̄}, Q̄_ℓ)` for `0 ≤ i ≤ 2(d − 1)` is finite dimensional with continuous Galois action; `H^i = colim_I H_I^i` carries commuting `D^×(A^∞)` and Galois actions with finite-dimensional `K_I`-invariants; and the semisimplified tower decomposes as `⊕ Π^∞ ⊗ V_Π^i` over automorphic `Π` with `Π_∞` trivial or Steinberg. The whole tower cohomology is not finite dimensional. Concentration in one degree and multiplicity one are only asserted for the selected transfer image (ES7:equal-characteristic.16). *Needs:* ES7:equal-characteristic.3; ES7:equal-characteristic.4; ES7:function-field-automorphic.3; EtaleDualityAndPerverseSheaves EDC.2; DeligneWeightsAndPurity DWP.7; SR.3; Mathlib `Representation`, `DirectSum`.

**Checks.**

- The colimit over levels is not finite dimensional; only its `K_I`-invariants are.

### ES7:equal-characteristic.11 The geometric and automorphic trace identity

Prove `geometric_automorphic_trace` (Laumon–Rapoport–Stuhler, Proposition 13.6, p. 291, and Theorem 14.9(ii), p. 297): for a good place `o`, `r ≥ 1` and a level-compatible Hecke test function away from `o`, the alternating trace of `Frob_o^r` composed with the correspondence on cohomology is `Σ_Π m(Π) tr Π(f_∞ f_{o,r} f^{∞,o})`, with `f_∞` the Euler–Poincaré function; by ES7:function-field-automorphic.7 the coefficients are `1` for `Π_∞` trivial and `(−1)^{d−1}` for Steinberg; for a Steinberg isotype and almost all `o` (outside a finite set containing `∞`, the bad places and the places where `Π_o` is ramified) the alternating trace is `(−1)^{d−1} m(Π) q_o^{r(d−1)/2} Σ_{j=1}^d z_j(Π_o)^r`. This is an alternating statement, before concentration. The proof uses the correspondence trace formula of EDC.8 with the isolation and large-power bounds of LRS §§11–12, the kernel formula and the orbital transfer, and at unramified places the spherical Satake polynomial with its `q_o^{(d−1)/2}` normalization. *Needs:* ES7:equal-characteristic.10; ES7:function-field-automorphic.4; ES7:function-field-automorphic.6; ES7:function-field-automorphic.7; ES7:equal-characteristic.4; FA.6; EDC.8 (*correspondence-trace*, *lefschetz-verdier-formula*).

**Checks.**

- For `d = 2` the alternating Steinberg sign is `−1`, which the sign of the middle degree cancels.

### ES7:equal-characteristic.12 Pairing dual automorphic isotypes

Prove `dual_isotypic_pairing`: at finite proper level, Poincaré duality in dimension `d − 1` pairs `H^i[Π]` with `H^{2(d−1)−i}[Π^∨](d − 1)`, that is `(H^i[Π])^∨ ≅ H^{2(d−1)−i}[Π^∨](d − 1)`, with the inverse central character, the Hecke adjoint being the inverse correspondence. There is no identification with the `Π`-isotype unless a compatible self-duality is given; the self-duality asserted at LRS p. 300 and §14.16 is replaced by this pairing (Kaiser's erratum, opening paragraph and the correction of Corollary 14.11, p. 1). *Needs:* ES7:equal-characteristic.10; ES7:equal-characteristic.4; EDC.2 *adic-and-rational-poincare-duality*; EDC.8 *similitude-reciprocal-charpoly*.

**Checks.**

- For a rank-one Hecke character that is not self-dual, the paired component has the inverse character.

### ES7:equal-characteristic.13 The corrected local factor duality

Prove `kaiser_erratum`: in Laumon–Rapoport–Stuhler, Corollary 14.11, the second local factor `L_x(V^•_{Π^∞}, q_x^{−d} T⁻¹)` is replaced by `L_x((V^•_{Π^∞})^∨, q_x^{−1} T⁻¹)` in the statement and in the proof, for `Π` with `Π_∞ ≅ St_d` and a good place `x`; both the dual and the exponent change, the pairing is that of ES7:equal-characteristic.12, and the general proof of LRS 14.12 uses the amended Lemma 14.14′ and Proposition 14.17′ (Kaiser's erratum, correction of Corollary 14.11, p. 1). The route of ES7:equal-characteristic.16 does not use the unpublished argument with an invariant ample class. *Needs:* ES7:equal-characteristic.12; EDC.8 *similitude-reciprocal-charpoly*.

**Checks.**

- Changing only `V` to `V^∨` and keeping `q_x^{−d}` is not the correction.

### ES7:equal-characteristic.14 The corrected graded chain lemma

Prove `kaiser_graded_chain_lemma` (Kaiser's erratum, Lemma 14.14′ and its proof, pp. 1–2): let `d ≥ 1`, `m, m′ ≥ 0` with `m′ | m`, and `V^•` a pure graded Frobenius-semisimple `ℓ`-adic representation of the Weil group at `∞` in degrees `0, …, 2d − 2` (LRS 14.13). Suppose `L_∞(V^•, T) / L_∞((V^•)^∨, q_∞⁻¹ T⁻¹) ~ ((1 − q_∞^{−d} T⁻¹)/(1 − T))^m`, where `~` means equal orders of zero or pole at `T = q_∞^n` for every `n ∈ ℤ` (a nonzero Laurent monomial factor, as in the corrected 14.11(iii), is allowed), and each `L_∞(V^i, T)⁻¹` is an `m′`-th power in `1 + T Q̄_ℓ[T]`. Then `V` has a direct summand `⊕_{a ∈ A} W_a`, `W_a = [⊕_{j=0}^s σ⁰(St_{i_j})(−i_0 − ⋯ − i_{j−1})]^{m′}` with positive `i_j` summing to `d` and `m = |A| m′`; the term `σ⁰(St_i)(−j)` lies in degree `i + 2j − 1`. Self-duality and integrality are not hypotheses. Proof: extract an indecomposable `σ⁰(St_i)` from the root `1` of the local factor, using the classification of Frobenius-semisimple indecomposables `r₀ ⊗ Sp(n)` and the local weight–monodromy theorem (DWP.5), with purity fixing its degree; the `m′`-power condition gives `m′` copies and the ratio forces the next Tate-shifted term; continue until the lengths sum to `d`, take a complement and induct. The Weil–Deligne representations of R01.2 are normalized by arithmetic Frobenius and are converted to the geometric normalization used here. The misprinted numerator `1 − q_∞^{−d} T` of LRS (14.13)–(14.14) is `1 − q_∞^{−d} T⁻¹` (*Source corrections*). *Needs:* ES7:equal-characteristic.13; LP0.2; R01.2 *weil-deligne-representation*, *frobenius-semisimplification*; DWP.5 *local-monodromy-purity*.

**Checks.**

- At `d = 1` the chain is `σ⁰(St₁)` in degree `0`.
- The conclusion is a direct summand; further summands with trivial `L`-factor are not excluded.

### ES7:equal-characteristic.15 The corrected automorphic graded chain

Prove `kaiser_graded_chain_proposition` (Kaiser's erratum, Proposition 14.17′, p. 1): for automorphic `Π` with `Π_∞ ≅ St_d`, the graded isotypic representation `V^•_{Π^∞}` of LRS 14.17, restricted to the decomposition group at `∞`, satisfies `(V^•_{Π^∞})^{Frob-ss} ≅ [⊕_{j=0}^s σ⁰(St_{i_j})(−i_0 − ⋯ − i_{j−1})]^{m(Π)}` with positive `i_j` summing to `d`, the terms lying in degrees `i_j + 2(i_0 + ⋯ + i_{j−1}) − 1`. Apply ES7:equal-characteristic.14 with `m′ = m(Π)`, after supplying the graded weight, monodromy and `L`-factor inputs of LRS 14.13–14.17. This chain statement replaces the alternatives of LRS 14.17; it is not yet concentration in the middle degree. *Needs:* ES7:equal-characteristic.14; ES7:equal-characteristic.11; ES7:equal-characteristic.10; DWP.7; R01.2; DWP.5.

**Checks.**

- A chain with several parts is not identified with `St_d` in the middle degree.

### ES7:equal-characteristic.16 Selected middle cohomology

Prove `selected_isotypic_cohomology` (Laumon–Rapoport–Stuhler, Theorem 15.12 and the remark following it, pp. 316–317; Hausberger 2005, Proposition 10.5, p. 1341): for `Π` in the selected transfer image of ES7:function-field-automorphic.12, `V_Π^i = 0` for `i ≠ d − 1`, `dim V_Π^{d−1} = d` and `m(Π) = 1`; at a good `o` the Frobenius trace is `q_o^{r(d−1)/2} Σ_j z_j(Π̃_o)^r`; and `Σ(Π) = V_Π^{d−1}((d − 1)/2)` is the selected global Galois representation. The split good local components of `Π̃` are generic, and the remark after LRS 14.12 (cited in LRS 15.12) proves concentration from the strict Satake bound for unitary generic representations and purity; Chebotarev identifies `Σ(Π)` (R01.5). No concentration is asserted for arbitrary division-algebra isotypes. *Needs:* ES7:function-field-automorphic.12; ES7:equal-characteristic.11; ES7:equal-characteristic.13; DWP.7; SR.3; FA.4; FA.6; R01.5 *curve-recognition-from-an-open-subset*.

**Checks.**

- For `d = 1` the selected representation is in degree `0` and has dimension `1`.
- Purity alone is not used to deduce semisimplicity of Frobenius.

### ES7:equal-characteristic.17 Independence of the selected globalization

Prove `local_correspondence_independence` (Laumon–Rapoport–Stuhler, Proposition 15.13 and Corollary 15.14, pp. 317–318): for supercuspidal `π` of `GL_d(K)` with finite-order central character, the semisimple restrictions `Σ(Π)|_{W_K}` over the selected globalizations `Π` of one fixed global setup (curve, `x₀ = o`, `x₁ = o′`, `∞` and `D`) are isomorphic, independently of `Π` and of the auxiliary place `x₂`; their determinants match the central character, contragredients and finite-order twists correspond, and Rankin–Selberg local factors of pairs agree with the factors of tensor products, for the same nontrivial additive character and geometric reciprocity. Independence of the curve and of `o′` is not asserted. Proof: match determinants and twists through Frobenius data and Chebotarev (FA.4); compare global functional equations for selected pairs and control local zeros and poles by purity, using `constructible_curve_functional_equation` and `curve_epsilon_product`, with the `j_!` and `j_*` boundary conventions and ArithmeticGaloisRepresentations §2.7's `equal_char_local_epsilon` specified above (Laumon, §3.1.1, pp. 178–179, Theorem 3.1.5.4, p. 186, and Theorem 3.2.1.1, p. 187); conclude by Henniart's uniqueness of local constants (Theorems 4.1, 4.4 and 4.5, as quoted by LRS), whose proof is part of this target. *Needs:* ES7:equal-characteristic.16; FA.4; FA.6; LP0.2; WeilConjectures WC.2; requested WeilConjectures `constructible_curve_functional_equation`, `curve_epsilon_product`; requested ArithmeticGaloisRepresentations §2.7 `equal_char_local_epsilon`; SR.3; R01.5.

**Checks.**

- For `d = 1` the statement is local class field theory.

### ES7:equal-characteristic.18 The equal-characteristic local correspondence

Prove `classical_local_correspondence` (Hausberger 2005, Theorem 9.2, pp. 1334–1335): `π ↦ σ_d(π) = Σ(Π)|_{W_K}` is a bijection between supercuspidal representations of `GL_d(K)` with finite-order central character and irreducible continuous `d`-dimensional `ℓ`-adic Weil representations with finite-order determinant, compatible with central characters, twists by characters of finite order (of `Kˣ`, not of `GL_d`), contragredients and local constants of pairs. Injectivity and the compatibilities are ES7:equal-characteristic.17; surjectivity is Henniart's numerical local Langlands theorem in its finite-order and conductor range (LRS 15.17–15.20), proved as part of this target, not deduced from the excursion parameter. Extend to arbitrary central characters and all irreducibles by unramified twists and the segment classification with the normalization of SR.2.2. The full Weil–Deligne correspondence is used only through its semisimple Weil restriction. *Needs:* ES7:equal-characteristic.17; SR.3; LP0.2; R01.2; FA.4; R01.5.

**Checks.**

- No step uses ES5 or ES7:GLn-comparison.

### ES7:equal-characteristic.19 Hochschild–Serre for the uniformized quotient

Prove `geometric_hochschild_serre` (Hausberger 2005, Proposition 10.6(ii), p. 1341, Corollary 10.7 and Remark 10.8, p. 1342, and Proposition A.12, pp. 1364–1365): for the uniformized finite-level quotient at `o` and `0 ≤ j ≤ 2(d − 1)`, there is a convergent spectral sequence `E₂^{i,j} = Ext^i_{GL_d(K), sm}(H_c^{2(d−1)−j}((Res′ Σ_n^d)_{K̄}, Q̄_ℓ)(d − 1), A_{D̄}^{∞, level}) ⇒ H^{i+j}(E_{I, K̄}, Q̄_ℓ)`, where `A_{D̄}^{∞, level}` is the space of automorphic forms on the double-coset space `Z_{I^o}` of ES7:equal-characteristic.7, trivial at `∞`; it is compatible with levels, with the action of `D` away from `o`, with `D_o^×` and with `W_K`, including the transpose-inverse conventions of Hausberger's Remark 10.8. The derived construction for a locally profinite group acting properly discontinuously on a Berkovich space with finite stabilizers, its compact-support duality in dimension `d − 1`, and the comparison of analytic and étale cohomology are proved here; ArithmeticGaloisDuality R02.2 supplies the first-quadrant spectral sequence. *Needs:* ES7:equal-characteristic.7; ES7:equal-characteristic.8; ES7:equal-characteristic.9; ES7:function-field-automorphic.3; SR.2.1; R02.2 *first-quadrant-spectral-sequence*; ClassicalAdicEtaleCohomology H3 (*proper-support-direct-image*, *berkovich-derived-duality-interface*); Mathlib `CategoryTheory.Abelian.Ext`.

**Checks.**

- The duality twist is `d − 1` and the compact-support degree is `2(d − 1) − j`.

### ES7:equal-characteristic.20 Cuspidal degeneration

Prove `hochschild_serre_and_degeneration` (Hausberger 2005, Lemmas 10.14–10.15, Remark 10.16 and Proposition 10.17, pp. 1353–1356): for a selected global transfer with supercuspidal component at `o`, its multiplicity in `E₂^{i,j}` vanishes for `i > 0`, so the selected cuspidal part degenerates and `E₂^{0,j}[Π^{∞,o}] ≅ (H_o^j)^{ss}[Π^{∞,o}]` with its `D_o^×` and Weil actions. Restrict `π_o` to `GL_d(K)^0 = {g : v(det g) = 0}`, where its compactly supported matrix coefficients make it injective in the smooth characteristic-zero category, and kill higher Ext by compact induction and Frobenius reciprocity from the component stabilizer. The isotypic lift is proved by splitting the surjection on semisimple isotypic summands, replacing Hausberger's zero-kernel assertion in the proof of Lemma 10.15, which is false (*Source corrections*). Multiplicities are tracked through the spectral sequence: ES7:equal-characteristic.16 gives zero outside the middle degree and one simple constituent `JL(π_o) ⊗ σ_d(π_o)` with multiplicity one in the middle degree, which with the degeneration gives the isomorphism (equality of multiplicities alone would not). *Needs:* ES7:equal-characteristic.19; ES7:equal-characteristic.9; ES7:equal-characteristic.16; SR.2.1; SR.3; Mathlib `CategoryTheory.Injective`.

**Checks.**

- The degeneration is for the selected cuspidal part, not for arbitrary automorphic constituents.

### ES7:equal-characteristic.21 The Drinfeld–Carayol realization

Prove `drinfeld_carayol` (Hausberger 2005, §9.3 and Theorem 9.5, p. 1337, with the proof in §10.4, pp. 1356–1357): for `ξ : Kˣ → Q̄_ℓˣ` of finite order and supercuspidal `π` of `GL_d(K)` with central character `ξ`, the `π`-isotypic part of `U_d^i(ξ)` vanishes for `i ≠ d − 1`, and `Hom_{GL_d(K)}(π, U_d^{d−1}(ξ)) ≅ JL(π) ⊗ (σ_d(π) ⊗ |·|^{(1−d)/2})` compatibly with `D_K^× × W_K`. Choose the selected globalization and transfer, compare the middle isotype with the Hom term of the spectral sequence and with `σ_d`, and pass through the colimits over levels and the central quotient. For the Hom duality in the category with fixed central character use semisimple-block lifting and the subgroup `Z(K) · GL_d(K)^0`, which has index `d` (its determinant valuations are `dℤ`), with induction, restriction and averaging in characteristic zero; Hausberger's assertion that `GL_d(K)` is generated by its centre and `GL_d(K)^0` is false for `d > 1` (*Source corrections*). Extension to all central characters uses twisting; the non-supercuspidal Carayol–Harris statement is not a target. *Needs:* ES7:equal-characteristic.20; ES7:equal-characteristic.8; ES7:equal-characteristic.18; ES7:function-field-automorphic.9; ES7:equal-characteristic.16; SR.3.

**Checks.**

- For `d = 1` the twist is trivial.
- For `d = 2`, `diag(ϖ, 1)` has determinant valuation `1` and does not lie in `Z(K) · GL_2(K)^0`.

### ES7:equal-characteristic.22 The equal-characteristic Hecke-fibre realization

Prove `hecke_fibre_transport` for every `K = F_q((ϖ))`, `d ≥ 1`, `ℓ ≠ p` and supercuspidal `π` over `Q̄_ℓ`. Put `r = d − 1`, `σ = JL(π)` and `E_b = O(−1/d)`. For a degree-one divisor `D`, the framed modification space has points `u : E_b ↪ O^d` with cokernel a line on `D`; its reverse correspondence uses the same modification with the two projections exchanged. The required comparison must identify these families, with both framings, with the equal-characteristic towers, and identify their two normalized operations as

```text
i_1^* T_Std(i_b! σ) ≃ π ⊗ ρ_π,
i_b^* T_Std∨(i_1! π) ≃ σ ⊗ ρ_π^∨.
```

Here the first is the extension supported on the basic stratum, and the first operation has support on `Bun^1`: an upper modification of `O(−1/d)` of length one has degree zero and is `O^d` (Fargues–Scholze, proof of IX.7.4, p. 338). Both operations use `[r](r/2)` from normalized Satake. The two Weil actions remain independent after composition, giving `σ ⊗ ρ_π ⊗ ρ_π^∨`; creation and annihilation use only their diagonal. *Needs:* ES7:equal-characteristic.21; ES7:equal-characteristic.6–.7; HS2 (equal characteristic); HS3.10 `heckeBetweenStrata.basicTwist` and `heckeBetweenStrata.homAdjunction`; HS3.8; HS4.1; GS4:integral-dual-group (*Normalized integral Satake equivalence*); EDC.2 and H3 duality. The following identifies the established tower map and the further comparison still required; neither is replaced by a multiplicity formula.

**The established coordinate map.** Use the contravariant coordinate module `M_X = Hom_{F_q}(X,Ĝ_a)` of a formal `O`-module, with its `σ`-linear map and its level and quasi-isogeny trivializations (Genestier–Lafforgue, Proposition 2.1.1, pp. 11–12). This is a functor on families, not just on geometric points. Their normalized coordinates `T_X` and `T_Y`, and the companion matrix `P` of the framing isocrystal, satisfy

```text
T_X Pᵗ = τ(T_X),             P T_Y = τ(T_Y),
T_X = T_Yᵗ,
(γ,δ) T_X = γ_z^(−t) T_X δ_zᵗ,
(γ,δ) T_Y = δ_z T_Y γ_z⁻¹.
```

The subscript `z` denotes the source's coordinate-module realization; `γ_z^(−t)` means `(γ_z⁻¹)ᵗ`. The Weil descent maps are `T_X ↦ T_X Pᵗ` and `T_Y ↦ P T_Y`, respectively (Genestier–Lafforgue, Remarks 2.2.4, p. 17, and 2.3.7, pp. 30–31). Transposing the second equation and the second action gives the first equations exactly. Existence and inverse gluing on families use their Theorem 1.5.3 and the construction in §§4–5, not just this matrix identity. The theorem identifies the completed infinite-level formal spaces after the specified `ϖ`-adification on the Lubin–Tate side, compatibly with `(GL_d(K) × D_K^×)/K^×` and Weil descent (p. 10). It is not an isomorphism between finite levels; the stabilizer obstruction is explained in §1.5, p. 8.

The actions being compared are explicit. On Lubin–Tate data `(X,ρ,η)`, `γ ∈ GL_d(O)` changes level by `η ↦ η γ⁻¹`; general `γ` uses the quotient by `η(γ′⁻¹ O^d/O^d)`, choosing `γ′ = ϖ^m γ` integral, and changes the framing by the quotient composed with `ρ ϖ^(−m)`. The division-algebra action is `ρ ↦ ρ δ⁻¹` (§1.3, pp. 4–5). On Drinfeld data `(Y,ρ,η)`, `γ` changes the framing by `ρ γᵗ`; if `δ ∈ Π^m O_D^×`, change `Y` to `Y(Π^(−m) • Π^m)`, the framing to `Y(Π^(−m)) ρ γᵗ` and the level by right multiplication by `Π^(−m)δ` (§1.4, pp. 6–7). Both descent data are arithmetic-`q`-semilinear with framing `ρ τ⁻¹`. The source's Drinfeld `GL_d` action differs from the usual one by `γ ↦ γ^(−t)` (Remark 1.4.2, p. 7). Passing between arbitrary-height data with descent and height-zero data also changes the component formulas; the footnote there explicitly prevents identifying those formulas unchanged.

**Cohomology and the remaining Hecke map.** Boyer's deformation spaces (Propositions 2.1.2–2.1.3, p. 581), actions (Proposition 2.3.2 and Definition 2.4.1, pp. 583–584) and Theorem 3.2.4, p. 586, concern ordinary nearby-cycle cohomology. In his conventions its supercuspidal factor is `π ⊗ JL(π)^∨ ⊗ σ_d(π)|·|^(−r/2)`. Hausberger's Theorem 9.5, p. 1337, concerns compactly supported cohomology with division-algebra central character `ξ` instead of Boyer's `ξ⁻¹`. To compare them, first transport the height components and the group actions just specified. Then use the equivariant finite-level Poincaré pairing, with normalized trace compatible with changes of level:

```text
RΓ(M_LT^(0),Λ)[2r](r) ≃ RΓ_c(M_LT^(0),Λ)^∨.
```

Dat, Lemma 3.5.13, p. 27 of the author manuscript, constructs this pairing for `Λ = Z/ℓ^n` or `Q_ℓ` in the category retaining the indicated discrete division-algebra and Weil actions. The trace at level `n` has factor `[H₁:H_n]⁻¹`; it cannot be omitted. Rational coefficients and finite coefficient-field extension suffice here. Duality reverses all representation factors, not just the division-algebra factor. Distinguish `Hom_J(σ,C)` from the contracted tensor product of a right `J`-module with `σ`; changing one to the other introduces `σ^∨` (Dat, §4, p. 28). Nor is `w ↦ w⁻¹` an automorphism of a nonabelian Weil group: an inverse action must arise from the specified right action or a dual, with its variance checked.

What remains is the equivariant map from these tower families to the **basic-framed** modification space above, together with its inverse/gluing or cohomological comparison, and the resulting two displayed functor identities. A concrete construction to establish is `basic_frame_coordinate_descent`: use `T_X = S_X R_X⁻¹`, where `S_X` is the compatible full level structure and `R_X` the coordinate realization of the quasi-isogeny. Prove convergence on the relative punctured-disc charts, identify its Frobenius equation with a map of the framed vector bundles, and prove that the determinant has the one prescribed divisor on the quotient curve. Recover the local shtuka from the resulting modified Frobenius module; check the variance of both framings, including the opposite division algebra from the contravariant coordinate functor. The matrix equation alone proves none of these analytic or inverse assertions. The appropriate local-shtuka inputs are Hartl–Viehmann's modification of a σ-bundle (Definition 4.9 and its construction, p. 19), their Drinfeld and Lubin–Tate examples (6.14–6.15, pp. 33–34), and their Hecke/J_b-equivariant rational Tate-module period construction (Theorem 8.1(c), p. 45). This last theorem does not state the required Fargues–Fontaine comparison with Weil descent.

Li-Huerta's Theorem 4.9, p. 28, identifies formal and analytic local shtukas with **trivial** framing; Proposition 4.15, p. 31, gives their map to Fargues–Fontaine modifications, Theorem 4.16, p. 32, its cohomological comparison, and Lemma 4.17, pp. 32–33, the partial-Frobenius square. That trivial-to-trivial result cannot simply be used for `b` here. Fargues–Scholze IX.3, pp. 324–325, starts its classical tower identification over `Q_p`. Its `Ri_b*` Hom formula must be used with the duality conversion of HS3.8, not with an asserted equality `Ri_b* = i_b!`; HS3.10 already supplies the abstract basic-source comparison and its adjunction. The missing assertions here concern the classical equal-characteristic identification of the basic-framed space and the resulting action conversion. The explicit Genestier–Lafforgue map identifies the two classical towers only.

**Checks.**

- Transposition sends `(δ_z T_Y γ_z⁻¹)ᵗ` to `γ_z^(−t) T_X δ_zᵗ` and sends `(P T_Y)ᵗ` to `T_X Pᵗ`. Thus it preserves descent without inventing a Weil contragredient.
- For `d = 1` and finite-order `ξ ≠ ξ⁻¹`, Boyer's division-algebra character `ξ⁻¹` differs from Hausberger's `ξ`. Identity transport fails. Rank one has no shift or half twist, and the final two-operation action must be `ξ ⊗ ρ_ξ(w₁)/ρ_ξ(w₂)` with the geometric reciprocity of ES6:functoriality.6.
- For `d = 2`, `[1](1/2)` sends middle cohomology with scalar factor `q^(1/2)` to degree zero with factor `1`. Duality before normalization has shift `[2](1)`, so a single `[1](1/2)` cannot replace the Poincaré pairing.
- For two Weil variables with rank-one eigenvalues `a,b`, the contraction is `a/b`. Identifying the variables in advance loses this test; forgetting the dual gives `ab` instead.
- At finite levels the two towers have different stabilizers for their level and framing groups. The completed infinite-level map is necessary even though both towers have relative dimension `r`.

### ES7:equal-characteristic.23 Classical agreement in equal characteristic

Prove `equal_characteristic_agreement` (Fargues–Scholze, Theorem IX.7.4 and its proof, p. 338): for `E` of characteristic `p` and every irreducible smooth `Q̄_ℓ`-representation `π` of `GL_n(E)`, `φ_π` is the semisimplification of the Weil part of the classical parameter of `π` (ES7:equal-characteristic.18, extended to all irreducibles by twists and segments). For supercuspidal `π`, ES7:equal-characteristic.22 gives `T_V(B)|_{Bun^b} ≅ σ ⊗ ρ_π ⊗ ρ_π^∨` for `σ = JL(π)`, ES7:GLn-comparison.2–.3 identify the parameter of `σ` on the basic stratum, and the direct-summand argument of ES7:GLn-comparison.4 transports it to `π`; the general case follows by ES7:parabolic.8 as in ES7:GLn-comparison.5. The monodromy operator is not identified. *Needs:* ES7:equal-characteristic.22; ES7:equal-characteristic.18; ES7:GLn-comparison.2; ES7:GLn-comparison.3; ES7:parabolic.8; ES5.6; HS3.4; HS4.1; VS4.2; SR.3; R01.2 *frobenius-semisimplification*.

**Checks.**

- For `n = 1` this is local class field theory with the geometric normalization.
- The trivial and Steinberg representations of `GL₂(E)` have the same semisimple parameter, Frobenius `↦ diag(q^{1/2}, q^{−1/2})`, and different monodromy.

### Dependencies

ES5; ES7:parabolic; ES7:GLn-comparison; ES7:function-field-automorphic; HeckeStacksAndLocalShtukas HS2, HS3, HS4; AlgebraicModuliForArithmeticGeometry R09; DrinfeldModulesAndTModules DM.7; EtaleDualityAndPerverseSheaves EDC.2, EDC.8; ClassicalAdicEtaleCohomology H3; DeligneWeightsAndPurity DWP.5, DWP.7; WeilConjectures WC.2; ArithmeticGaloisDuality R02.2; ArithmeticGaloisRepresentations R01.2, R01.5; FunctionFieldArithmetic FA.4, FA.6; SmoothRepresentationsOfLocalGroups SR.2, SR.3; SchemeAndStackFoundations SF.0, SF.2, SF.3; LanglandsParameterStacks LP0.

## Layer ES7: classical agreement over every local field

### ES7.1 Agreement for every local field

Prove `agreement_for_every_local_field` (Fargues–Scholze, Theorem IX.7.4, p. 338): for every nonarchimedean local field `E`, every `ℓ ≠ p` and every irreducible smooth `Q̄_ℓ`-representation `π` of `GL_n(E)`, the parameter `φ_π` of ES5.6 is the semisimplification of the Weil part of the classical parameter of `π`. Split by the characteristic of `E`: ES7:GLn-comparison.5 in characteristic zero and ES7:equal-characteristic.23 in characteristic `p`; both use the same trace theorem and the same normalized-induction step. *Needs:* ES7:GLn-comparison.5; ES7:equal-characteristic.23; ES5.6.

**Checks.**

- No integral or modular full correspondence and no monodromy operator is claimed.

### ES7.2 The classical Bernstein-centre comparison

Prove `classical_centre_agreement` (Fargues–Scholze, the paragraph after Theorem IX.7.4, p. 338): for `GL_n` over `Q̄_ℓ`, the map `Ψ_{GL_n}` of ES7:parabolic.1 has the same values on every irreducible as the map defined by the classical parameters, and since the characteristic-zero Bernstein centre is separated by its values on irreducibles (SR.3.2), the two maps are equal. The map `Ψ_{GL_n}` over `ℤ_ℓ[√q]` exists as a map to the integral Bernstein centre (SR.1.3); this is not a claim that integral or mod-`ℓ` representations have a classical Weil–Deligne correspondence. *Needs:* ES7.1; ES7:parabolic.1; SR.1.3; SR.3.2.

**Checks.**

- The integral output is a ring map into a centre, with no reconstructed monodromy.

### Dependencies

ES5; ES7:parabolic; ES7:GLn-comparison; ES7:equal-characteristic; SmoothRepresentationsOfLocalGroups SR.1, SR.3.

## Worked examples

**The torus `G_m`.** Here `Ĝ = G_m`, `Q = 1`, every class in `B(G_m) = ℤ` is basic and `D_lis(Bun_{G_m}, Λ) = ∏_{d ∈ ℤ} D(Eˣ, Λ)`. The centre-order and good-prime conditions hold for every `ℓ ≠ p`. The excursion operator of `Std ⊠ Std^∨` with tuple `(γ₁, γ₂)` acts on `Λ[Eˣ/K]` in every degree by translation by `u(γ₁) u(γ₂)⁻¹`, `u = rec_geom⁻¹ ∘ (−)^ab` (ES6:functoriality.6), the spectral centre `lim_K Λ[Eˣ/K]` acts diagonally on all degrees (ES6:functoriality.7), and the parameter of a smooth character `χ` over `L` is `χ ∘ u`; an unramified `χ` with `χ(ϖ) = a` has parameter sending geometric Frobenius to `a` (ES5.3, ES5.6). The rational spectral action is multiplication by functions on the character variety together with the degree shift by the weights of `BG_m` (ES2.6), and the integral action exists for every `ℓ ≠ p` (ES3.7).

**`SL₂` at `ℓ = 2`.** Here `Ĝ = PGL₂`, `π₀Z(G) = μ₂` and `π₁(Ĝ) = ℤ/2`. Over `Λ = ℤ₂[√q]` the excursion action, finite ramification, the component decomposition and the parameters of all irreducible smooth representations over `F̄₂` and `Q̄₂` exist (ES1:finite-ramification, ES5), but the spectral centre map (ES1:spectral-center.2) and the integral spectral action on `Perf([Z¹/Ĝ])` (ES3.7) are not asserted; the approximation action of ES3.2 exists. Over `ℚ₂(√q)` both the spectral centre map and the rational action exist. The central character of an irreducible `π` of `SL₂(E)` is recovered from `φ_π` through the pushout `SL₂ → GL₂` (ES6:functoriality.11), also when `E = F_q((t))` with `q` odd.

**`GL₂` principal series.** For the upper Borel `B` and a character `χ₁ ⊗ χ₂`, every irreducible subquotient of `i_B^G(χ₁ ⊗ χ₂)` has parameter `φ_{χ₁} ⊕ φ_{χ₂}` (ES7:parabolic.8); the unnormalized `Ind_B^G(1)` has parameter `diag(√q, 1/√q)` at geometric Frobenius through the twisted Levi inclusion (ES7:parabolic.2, ES7:parabolic.7). Both constituents, trivial and Steinberg, have this semisimple parameter, and the classical correspondence distinguishes them only by monodromy (ES7.1).

## Source corrections

The following corrections to the sources are used above. Page numbers refer to the editions listed under *References*.

- **Fargues–Scholze, Proposition IX.6.2, p. 331.** The displayed product arrow on spectral centres is used here as the canonical map. With the convention `Z_spec = Γ([Z¹/Ĝ], O)` over the full, nonquasicompact parameter stack, it need not be an isomorphism for the ordinary tensor product: the infinite diagonal function for `G_m × G_m` in ES6:functoriality.3 is a counterexample. The operator comparison and the product formula for parameters use finite-wild pieces and remain targets.

- **Fargues–Scholze, proof of Theorem VIII.4.1, p. 292.** The reindexing square for a map of finite sets is called cartesian; it commutes but need not be cartesian. With `H = Q = 1`, `W = C₂`, `C = Vect_L` with the trivial family and the fold map `{1, 2} → {1}`, the square has `L` and its diagonal restriction `Map(W², L) → Map(W, L)`; over `F₂` the pullback has eight elements and the source two. The fusion argument only uses commutativity (ES1:finite-ramification.3). Only the author-hosted text was available for this passage.
- **Fargues–Scholze, Proposition IX.6.2, p. 331.** In the displayed tensor product of geometric centres the second factor is the centre for `G₂`, and in the parameter statement `A_i` lies in `D_lis(Bun_{G_i}, L)` (ES6:functoriality.3).
- **Fargues–Scholze, proof of Theorem IX.6.1, p. 331.** The prose reverses the group morphism: it is `G′ → G`, with dual `Ĝ → Ĝ′`, as in the displayed maps (ES6:functoriality.2).
- **Fargues–Scholze, closing paragraph of §IX.6, p. 333.** The cited construction of Kaletha, §5, is an injective z-embedding into a group with connected centre over a `p`-adic field, not a surjective z-extension (ES6:functoriality.10).
- **Fargues–Scholze, Proposition VII.7.10, p. 276.** The compact exterior-product clause is about `D_lis(Bun_G, Λ)`; the word étale is carried over from Proposition V.7.2 (ES6:functoriality.3).
- **Fargues–Scholze, proof of Theorem IX.7.2, p. 335.** The reduction to quasi-split groups through a z-embedding is justified over `p`-adic fields. In characteristic `p`, for `G = SL_p`, no embedding into a group with toral centre and torus quotient `C` has `Z(G′)(E) → C(E)` surjective, because the cokernel is the kernel of `H¹_fppf(E, μ_p) → H¹(E, Z(G′))` and `H¹_fppf(E, μ_p) = Eˣ/(Eˣ)^p` is infinite while the torus cohomology is finite (ES7:parabolic.4).
- **Henniart–Vignéras 2025, proof of Proposition 3.3, pp. 239–240.** The cokernel of a surjective map of split tori on rational points is compact, not finite: over `F_q((t))` the `p`-th power map of `G_m` has infinite cokernel `Eˣ/(Eˣ)^p`. The full inverse image of a maximal split torus need not be split (`G_m × A → G_m` with `A` anisotropic); choose a maximal split torus in it mapping onto the target torus and a minimal parabolic. In the opening paragraph the commutator is of `x` and `y`, the image `f(H)` is a subgroup of the target, and the quotient is `G/f(H)`. Proposition 3.3 itself stands (ES6:functoriality.11).
- **Henniart–Vignéras 2025, formula (4-1), p. 240.** The infinite branch of the square-class formula is the characteristic-two case, and the finite branch in residue characteristic two is `2 + [F : ℚ₂]`: for the unramified quadratic extension of `ℚ₂` the square classes have dimension `4`, not `3`. Nothing here uses this formula.
- **Laumon–Rapoport–Stuhler, Corollary 14.11, p. 299, its proof, and §14.16, p. 306.** Poincaré duality pairs the `Π`-isotype with the `Π^∨`-isotype; it gives no self-duality. Kaiser's erratum replaces the second local factor by `L_x((V^•)^∨, q_x⁻¹ T⁻¹)` and amends Lemma 14.14 and Proposition 14.17 (ES7:equal-characteristic.12–.15).
- **Laumon–Rapoport–Stuhler, §13.3, p. 291.** The coset space `F^× \ A^× / ϖ_∞^ℤ` is compact, not finite: it is an extension of a finite group by the compact infinite group of degree-zero idele classes (ES7:function-field-automorphic.2).
- **Laumon–Rapoport–Stuhler, (14.13) and Lemma 14.14, p. 302.** The numerator factor is `1 − q_∞^{−d} T⁻¹`, as in (14.16) and in Kaiser's Lemma 14.14′; and in (14.16), p. 306, the identity being specialized is Corollary 14.11(iii), not (14.10)(ii) (ES7:equal-characteristic.14).
- **Hausberger 2005.** In Theorem 9.2(ii), p. 1335, the twisting character is a finite-order character of `Kˣ`; in Lemma 10.2, pp. 1339–1340, the chosen supercuspidal is a representation of `GL_d(K)`; in §10.2, p. 1340, the representation of dimension `d` is the middle-degree `V^{d−1}`; in §7.2, p. 1317, the isogeny classification is Théorème 3.4. In the proof of Lemma 10.15, p. 1354, the assertion `ker(u) ∩ im(p_{π′}) = 0` for a surjection `u` commuting with isotypic projectors is false (for the trivial group, `u : V ⊕ V → V` the first projection); split the surjection on semisimple isotypic summands instead (ES7:equal-characteristic.20). In §10.4, p. 1357, `GL_d(K)` is not generated by its centre and `GL_d(K)^0`: their product is the index-`d` subgroup of determinant valuation in `dℤ`, and the projectivity statement is transferred by finite-index induction and averaging in characteristic zero (ES7:equal-characteristic.21).

## Downstream consumers

- **ExcursionOperatorsAndSpectralActionPartII** uses the stratum maps and the parameters (ES5, ES7:parabolic) to prove stability of the Fargues–Scholze centre map and its inner-form comparisons.
- **IgusaVarietiesAndTorsionConcentration** uses the integral action and central support (ES3, ES4), the parameters with their functoriality and duality (ES5, ES6:functoriality, ES6:duality), parabolic compatibility (ES7:parabolic) and the `GL_n` comparison (ES7:GLn-comparison).
- **ModularityAndLanglandsExtensions** uses the semisimple parameters (ES5).
- **GlobalShtukasAndFunctionFieldLanglandsPartII** uses the parameters, their functoriality and parabolic compatibility (ES5, ES6:functoriality, ES7:parabolic) for local–global compatibility over function fields.
- **SmoothRepresentationsOfLocalGroupsPartII** uses the parameters and parabolic compatibility (ES5, ES7:parabolic).

## References

- **[FS]** Laurent Fargues and Peter Scholze, *Geometrization of the local Langlands correspondence*, [author-hosted PDF](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), 356 pages, the text of arXiv:2102.13459v4; printed and PDF page numbers coincide. Published as Astérisque 466 (2026). All locators refer to the author-hosted text.
- **[SW]** Peter Scholze and Jared Weinstein, *Berkeley Lectures on p-adic Geometry*, [author copy](https://people.mpim-bonn.mpg.de/scholze/Berkeley.pdf) of 27 March 2020.
- **[Laf]** Vincent Lafforgue, *Chtoucas pour les groupes réductifs et paramétrisation de Langlands globale*, J. Amer. Math. Soc. 31 (2018), 719–891; [arXiv:1209.5352v10](https://arxiv.org/pdf/1209.5352v10), whose pages are cited.
- **[Kal]** Tasho Kaletha, *Rigid inner forms vs isocrystals*, J. Eur. Math. Soc. 20 (2018), 61–101; [arXiv:1502.00650v2](https://arxiv.org/pdf/1502.00650v2). Pages are given for the arXiv version, and for the journal version where stated.
- **[Far]** Laurent Fargues, *Simple connexité des fibres d’une application d’Abel–Jacobi et corps de classe local*, Ann. Sci. Éc. Norm. Supér. (4) 53 (2020), 89–124; [author copy](https://webusers.imj-prg.fr/~laurent.fargues/cdc.pdf), whose numbering and pages are cited.
- **[Kot]** Robert E. Kottwitz, *B(G) for all local and global fields*, [arXiv:1401.5728](https://arxiv.org/pdf/1401.5728).
- **[Con]** Brian Conrad, *Finiteness theorems for algebraic groups over function fields*, [author manuscript](https://math.stanford.edu/~conrad/papers/cosetfinite.pdf), printed pages.
- **[HV]** Guy Henniart and Marie-France Vignéras, *Representations of SL₂(F)*, Pacific J. Math. 335 (2025), 229–286, [open access](https://msp.org/pjm/2025/335-2/pjm-v335-n2-p02-s.pdf); arXiv:2404.11188v2.
- **[Vig]** Marie-France Vignéras, *Representations of p-adic groups over commutative rings*, Proceedings of the ICM 2022, vol. 1 (2023), 332–374, [EMS Press](https://ems.press/content/book-chapter-files/33125).
- **[LRS]** Gérard Laumon, Michael Rapoport and Ulrich Stuhler, *D-elliptic sheaves and the Langlands correspondence*, Invent. Math. 113 (1993), 217–338, [GDZ scan](https://gdz.sub.uni-goettingen.de/download/pdf/PPN356556735_0113/LOG_0019.pdf) (printed page = PDF page + 215).
- **[Kai]** Christian Kaiser, *Errata for [LRS]*, two pages, [author-hosted](https://www.math.uni-bonn.de/people/rapoport/myalggeom/preprints/ErratumvonChrKaiser.pdf).
- **[Hau]** Thomas Hausberger, *Uniformisation des variétés de Laumon–Rapoport–Stuhler et conjecture de Drinfeld–Carayol*, Ann. Inst. Fourier 55 (2005), 1285–1371, [journal PDF](https://aif.centre-mersenne.org/item/AIF_2005__55_4_1285_0.pdf).
- **[Boy]** Pascal Boyer, *Mauvaise réduction des variétés de Drinfeld et correspondance de Langlands locale*, Invent. Math. 138 (1999), 573–629, [author-hosted journal PDF](https://www.math.univ-paris13.fr/~boyer/recherche/invent-these.pdf), printed pages.
- **[Jan]** Jens Carsten Jantzen, *Representations of Algebraic Groups*, second edition, Mathematical Surveys and Monographs 107, AMS (2003); Part II, Appendix B, printed pages.
- **[Lau]** Gérard Laumon, *Transformation de Fourier, constantes d’équations fonctionnelles et conjecture de Weil*, Publ. Math. IHÉS 65 (1987), 131–210, [journal PDF](https://www.numdam.org/item/PMIHES_1987__65__131_0.pdf); printed pages.
- **[GL]** Alain Genestier and Vincent Lafforgue, *L’isomorphisme des deux tours : une autre approche en égales caractéristiques*, in *L’isomorphisme entre les tours de Lubin–Tate et de Drinfeld*, Progress in Mathematics 262 (2008), 327–406; [author manuscript](https://vlafforg.perso.math.cnrs.fr/files/faltings.pdf), whose section numbers and 68-page pagination are used here.
- **[HaV]** Urs Hartl and Eva Viehmann, *The generic fibre of moduli spaces of bounded local G-shtukas*, [arXiv:1712.07936](https://arxiv.org/pdf/1712.07936), whose pages are used here.
- **[Dat]** Jean-François Dat, *Théorie de Lubin–Tate non-abélienne et représentations elliptiques*, Invent. Math. 169 (2007), 75–152; [author manuscript](https://webusers.imj-prg.fr/~jean-francois.dat/recherche/publis/LT.pdf), whose section numbers and pages are used here.
- **[LH]** Siyan Daniel Li-Huerta, *Local-global compatibility over function fields*, [author manuscript](https://math.mit.edu/~sdlh/papers/gl_fs.pdf), whose pages are used here.
- **[Stacks]** The Stacks Project, [Tag 00H9](https://stacks.math.columbia.edu/tag/00H9) (flat modules).
- Sources cited through the works above, for the statements named at their targets: Deligne–Kazhdan's simple trace formula and Henniart's comparison (cited by [LRS], §15); Badulescu's local Jacquet–Langlands character identity (cited by [Hau], Theorem 9.1); Laumon's and Kottwitz's Euler–Poincaré computations (cited by [LRS], Theorem 13.2).
