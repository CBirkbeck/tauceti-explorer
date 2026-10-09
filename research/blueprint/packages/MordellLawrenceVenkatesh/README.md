# The Mordell conjecture after Lawrence and Venkatesh

The goal is a proof that a smooth projective geometrically connected curve of genus at least two over a number field has finitely many rational points, following Lawrence and Venkatesh's use of p-adic period maps. The intermediate arithmetic result concerns rational points on the base of an abelian-by-finite family. The construction supplying that family is the Kodaira–Parshin family of reduced Pryms of singly branched affine-group covers. A second application gives the S-unit theorem through a cyclic variant of the Legendre family.

A rational point determines a p-adic Galois representation. Good reduction and a fixed residue disk identify its crystalline realization with a fixed vector space and fixed semilinear Frobenius, while its Hodge filtration varies. Isomorphic representations constrain the filtration to a Frobenius-centralizer orbit. Global finiteness of semisimple representations therefore supplies finitely many such orbits. Their dimensions are smaller than the period variety once a local field factor has sufficiently large degree. Complex monodromy, transported through common algebraic power series, makes the p-adic period image Zariski dense. On a curve, the inverse image of each resulting proper closed subset is finite by Strassmann's theorem.

Two further arguments make this applicable to every rational point of a high-genus curve. Purity at a friendly place, together with general position for Lagrangians, controls the failure of simplicity. Counting short Frobenius orbits in the finite étale parameter fibre guarantees a sufficiently large local factor. The topological heart of the construction proves that point-pushing has dense image in a product of symplectic groups. Lifted Dehn twists provide transvections, and curves that distinguish covers prevent diagonal identifications between factors. These mechanisms, rather than a retelling of the paper's sections, determine the layers below.

## Scope and neighboring directions

This roadmap specializes general cohomology and comparison theories to degree one of polarized abelian schemes. It imports period rings, admissibility and comparison isomorphisms from `PadicHodgeTheory`, `CrystallineCohomology` and `CohomologyComparisons`; it does not construct those theories again. `AbelianSchemesAndArithmeticModuli` supplies abelian schemes, duality, polarizations and their de Rham–Betti realizations. The exact interfaces, including their field and coefficient hypotheses, are listed after the layers.

Generic algebraic-group geometry belongs to `TauCetiRoadmap/ReductiveGroups`. Its Part II direction supplies abstract subgroup closures, orbit dimensions, symplectic normal-subgroup structure and arbitrary-form Lie comparisons. The graph criterion and the unbalanced-unipotent applications here build on those results and on the square-zero Lie generation theorem owned by `LefschetzPencilsAndVanishingCycles:LPV.5`. A connectedness theorem for coordinate symplectic groups is already in Tau Ceti; its arbitrary-form use requires a symplectic-basis comparison.

The surface material in LV.5 specifies the compact-surface and mapping-class interfaces needed here and belongs to `TauCetiRoadmap/GeometricTopology`, Part II. Surface fibrations, asphericity, singular homology, duality and branched rational transfer belong to `TauCetiRoadmap/AlgebraicTopology`, including its Part II extension to branched covers. The Aff(q)-specific normal form, liftable curves and product monodromy argument remain the local applications. An oriented surface is actual topological manifold data; classification, genus, homology and perfectness are consequences of that data.

`InverseGaloisAndArithmeticFundamentalGroups` supplies the arithmetic/geometric fundamental-group sequences and finite-cover comparisons used to descend the Hurwitz construction. Its curve Riemann-existence and algebraically closed base-change interfaces extend that owner. `ComplexComparisonPartII` supplies the analytic local-ring and normalization comparisons. `TauCetiRoadmap/JacobianChallenge` supplies relative Picard/Jacobian geometry, with its Part II direction handling the relative canonical polarization and homology form for families without a section. The relative endomorphism-kernel component theorem extends `AbelianSchemesAndArithmeticModuli`.

Scheme spreading, smooth formal coordinates, normalization finiteness and scheme dimensions extend `SchemeAndStackFoundations`. Grassmannian representability and the isotropic and finite-étale-stability loci extend `AlgebraicModuliForArithmeticGeometry`. Continuous finite induction extends `ArithmeticGaloisRepresentations`; local de Rham character and induction formulas extend `PadicHodgeTheory`; global purity under finite induction extends `WeightsInEtaleCohomology`. These extensions carry the general interfaces; the present layers assemble their family-specific comparisons.

The S-unit statement is shared with `DiophantineApproximationAndTranscendence:DT.2`, and the rational-point finiteness statement is shared with `HeightsRationalPointsAndObstructions:RP.4`. The intended declarations are single mathematical statements with distinct proof routes. The Lawrence–Venkatesh proof does not depend on the Parshin/Shafarevich proof route or conversely. The finite-extension Strassmann interface extends the theorem owned by `ArithmeticDynamics:DY.6/strassmann-theorem`.

The scope is the one-dimensional S-unit and Mordell arguments. Higher-dimensional Ax–Schanuel, hypersurface and unlikely-intersection arguments from the later part of Lawrence–Venkatesh are separate directions. No effectiveness or computable bound for the rational-point set is asserted.

## Conventions and common settings

- A number field `K` has a specified embedding `ι : K → ℂ` whenever complex comparison is used. `S` is finite and contains the archimedean places; `𝒪_S` denotes its ring of S-integers. Finite places are identified with nonzero primes in the ring of integers.
- Write `q_v` for the residue-field cardinality and `K_v` for the completion. Arithmetic Frobenius acts on a finite residue field by `x ↦ x^{q_v}`. Global cohomological Weil weights are measured using geometric Frobenius. Consequently `ℚ_p(n)` has Weil weight `−2n`; the arithmetic Frobenius multiplier on the finite-coefficient H¹ pairing is `q_v⁻¹`.
- Galois representations are continuous and finite-dimensional over `ℚ_p` when p-adic arithmetic is in view. Abstract characteristic-zero representation lemmas explicitly say so. For good reduction outside `S`, the fixed ramification set for p-adic cohomology is `T = S ∪ {places above p}`. Crystalline at p does not mean unramified at p.
- Filtrations are decreasing and indexed by integers, exhaustive and separated with finitely many jumps. Set `t_H(D) = Σ_j j dim gr^j D`; divide by `dim D` only for nonzero `D`. The filtration jump of `D_dR(ℚ_p(n))` is `−n`. The covariant realization is `D_cris(V) = (V ⊗ B_cris)^{G_K}`.
- For a finite étale algebra `E/k`, a rank-d submodule means rank d on every field component. Total k-dimension does not replace this condition. The total fibre of an abelian-by-finite family is a disjoint union of abelian varieties; it is distinct from their product or their Weil restriction.
- A symplectic form is alternating and nondegenerate. Lagrangian linear algebra is valid in every characteristic unless a theorem states characteristic zero. Put `T_v^r(x) = x + r ω(v,x)v`. For oriented topological homology use the intersection pairing `î(x,b)` in the order written: a positive Dehn twist acts by `x ↦ x + î(x,b)b`. Thus a liftable-curve action `x ↦ x + q î(x,ẽ)ẽ` is `T_{ẽ}^{−q}` when `ω = î`.
- `Aff(q)` acts on the prime field `𝔽_q` by `x ↦ ax+b`, with `a ≠ 0`, and multiplication is composition. Centrelessness and the self-normalizer statement below concern prime q at least three.
- Mathlib's fundamental-group multiplication is `p*q = q.trans p`: traverse q and then p. Forward transport has `T_{p*q}=T_p T_q`. Backward transport is the homomorphism `μ : π₁^op → GL`, `μ(op δ)=T_δ⁻¹`. The left deck action by prepending δ uses this opposite group. The forward and backward images are equal, hence define the same algebraic monodromy subgroup.
- Surjection symmetries use `γ·φ = φ ∘ Ad(γ)⁻¹` and `φ·h = Ad(h⁻¹) ∘ φ`. The stabilizer in `Γ × G^op` is `h⁻¹=φ(γ)`. All covering, point-pushing and Hurwitz comparisons retain these choices.

**Period setting P.** Fix a number field K and ι, a good model `𝒳 → 𝒴′ → 𝒴` over `𝒪_S` of a polarized abelian-by-finite family `X → Y′ →π Y`, relative dimension d, with π finite étale of degree n. The base Y is smooth geometrically connected of dimension m. Choose `v ∉ S`, with `K_v/ℚ_p` unramified and `p>2`, and `y₀ ∈ 𝒴(𝒪_S)`. Put `E₀ = Γ(π⁻¹(y₀),𝒪)`, `V = H¹_dR(X_{y₀}/K)` (free of rank 2d over E₀), polarization form ω₀, `H = LGr_{E₀}(V,ω₀)`, and `h₀=F¹V`. Base changes to K_v and ℂ are denoted by subscripts v and ℂ. The residue disk `Ω_v(y₀)` has coordinates in `(p𝒪_v)^m`. A good model includes locally free Hodge terms, an integral Gauss–Manin connection and polarization of invertible degree.

**Arithmetic curve setting Q.** In P take Y smooth projective geometrically connected, m=1, d≥1, a proper good model of Y, and full monodromy relative to ι. Choose a friendly v outside S, with odd residue characteristic lying below no place of S. Properness gives `Y(K)=𝒴(𝒪_S)`. For a closed parameter point y′ above y and a place w above v, write `ρ_{y′}=H¹_et(X_{y′,K̄},ℚ_p)` and `ρ_{y′,w}` for its local restriction. The finite étale local factors `K(y′)_w` are unramified over K_v.

**Affine-cover setting C.** Let Y be a closed oriented surface of genus g≥2, y a marked point, and q≥3 a prime. A singly ramified Aff(q)-cover is a connected degree-q cover of `Y∖{y}` with full affine monodromy and nontrivial peripheral image, compactified to `π:Z→Y`. Write `Z₁,…,Z_N` for its isomorphism classes. The common mapping-class stabilizer and its point-pushing inverse image are denoted `Mod(Y∖{y})′` and `π₁(Y,y)′`. Their monodromy maps are constructed in LV.9.

Targets have short theorem numbers `LV.i.j` and descriptive labels `LV.i/name`. Prerequisite lists use the theorem numbers. In prerequisite lists, `Mathlib:` and `TauCeti:` name declarations at the commits below; other labels name roadmap layers and their stated interfaces. General supplier interfaces are specified explicitly after LV.11. These are mathematical prerequisites to prove, rather than axioms included in the data of a family or a surface.

## Reusable library interfaces

The reference commits are Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. The following inventory identifies the reusable carriers and statements. It does not infer a geometric, arithmetic or continuity comparison from the existence of a carrier.

Important distinctions include the quotient-rank convention in `Module.Grassmannian`, the algebraic character of `Rep.mackeyDecomposition`, and the fact that `Scheme.Hom.normalization` defines a scheme without supplying the required finiteness and smoothness statements. The local spreading lemma is a morphism-from-stalk statement, not the entire theorem on spreading a polarized family. `Matrix.SL2.transvection_induction` is over a field, whereas integral symplectic generation in surface topology is a separate input. The fixed-field centralizer is an F-algebra; σ need not commute with all E-scalars.

| Upstream layer label | Exact roadmap layer |
| --- | --- |
| `AlgebraicCurves/12` | `TauCetiRoadmap/AlgebraicCurves#layer-12-the-dictionary--function-fields--curves-and-the-comparison-contracts` |
| `AlgebraicTopology/1` | `TauCetiRoadmap/AlgebraicTopology#stage-1-van-kampen-through-the-fundamental-groupoid` |
| `AlgebraicTopology/2` | `TauCetiRoadmap/AlgebraicTopology#stage-2-relative-singular-chains-and-homology` |
| `AlgebraicTopology/3` | `TauCetiRoadmap/AlgebraicTopology#stage-3-subdivision-excision-and-mayer--vietoris` |
| `AlgebraicTopology/4` | `TauCetiRoadmap/AlgebraicTopology#stage-4-cw-pairs-cellular-homology-and-cofibrations` |
| `AlgebraicTopology/5` | `TauCetiRoadmap/AlgebraicTopology#stage-5-bundles-covers-products-and-finite-cover-descent` |
| `AlgebraicTopology/6` | `TauCetiRoadmap/AlgebraicTopology#stage-6-cohomology-products-and-manifold-duality` |
| `AlgebraicTopology/8` | `TauCetiRoadmap/AlgebraicTopology#stage-8-relative-homotopy-hurewicz-and-whitehead` |
| `Chebotarev/10` | `TauCetiRoadmap/Chebotarev#layer-10-dirichlet-density-chebotarev` |
| `ClassFieldTheory/11` | `TauCetiRoadmap/ClassFieldTheory#layer-11-the-global-class-formation-and-global-artin-reciprocity` |
| `ClassFieldTheory/7` | `TauCetiRoadmap/ClassFieldTheory#layer-7-the-absolute-local-artin-map-its-normalizations-and-conductors` |
| `GeometricTopology/1` | `TauCetiRoadmap/GeometricTopology#layer-1-manifold-library-buildout-general-dimension-general-structure-group` |
| `JacobianChallenge/B` | `TauCetiRoadmap/JacobianChallenge#layer-b-coherent-cohomology-over-k-genus-riemannroch-serre-duality` |
| `JacobianChallenge/D` | `TauCetiRoadmap/JacobianChallenge#layer-d-the-relative-picard-functor-and-the-jacobian-scheme` |
| `LocalFieldsRamification/2` | `TauCetiRoadmap/LocalFieldsRamification#layer-2-unramified-extensions-and-frobenius` |
| `ReductiveGroups/2` | `TauCetiRoadmap/ReductiveGroups#layer-2-lie-algebra-and-the-adjoint-representation` |
| `ReductiveGroups/3` | `TauCetiRoadmap/ReductiveGroups#layer-3-subgroups-quotients-components` |
| `ReductiveGroups/6` | `TauCetiRoadmap/ReductiveGroups#layer-6-reductive-and-semisimple-groups` |
| `ReductiveGroups/7` | `TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory` |
| `UniversalCovers/2` | `TauCetiRoadmap/UniversalCovers#stage-2-lifting-criterion-and-galois-correspondence` |

Some interfaces need particular care when they are reused. The remaining library prerequisites are named at their consuming sections.

| Library declaration | Reused scope |
| --- | --- |
| `Mathlib:AlgebraicGeometry.Scheme.Hom.normalization` | The relative normalization of Y in X for a morphism f : X ⟶ Y. |
| `Mathlib:AlgebraicGeometry.spread_out_of_isGermInjective` | A morphism of stalks Spec 𝒪_{X,x} → Spec 𝒪_{Y,y} over S spreads out to an open neighbourhood of x when Y is locally of finite type and X is germ-injective at x. |
| `Mathlib:Field.exists_primitive_element` | Primitive element theorem for finite separable extensions: some α has F⟮α⟯ = ⊤. |
| `Mathlib:FixedPoints.finrank_eq_card` | For a finite group G acting faithfully on a field F, [F : F^G] = \|G\|. |
| `Mathlib:Ideal.quotientInfRingEquivPiQuotient` | Chinese remainder theorem: for pairwise coprime ideals f i, R ⧸ ⨅ f i ≃+* Π R ⧸ f i. |
| `Mathlib:IsCoveringMap.existsUnique_continuousMap_lifts` | A continuous map f:A→X from a simply-connected, locally path-connected space lifts uniquely through a covering p:E→X after fixing a₀∈A and e₀∈E with p(e₀)=f(a₀). Used on the simply-connected complex period neighbourhood, not as unrestricted lifting on arbitrary domains. |
| `Mathlib:IsGalois.of_fixed_field` | Artin: for a finite group G acting on a field E, the extension E/E^G is Galois. |
| `Mathlib:IsSemisimpleRing.exists_algEquiv_pi_matrix_divisionRing` | Wedderburn–Artin: a semisimple algebra is a finite product of matrix algebras over division algebras. |
| `Mathlib:LieAlgebra.IsSimple` | A Lie algebra is simple: its only ideals are ⊥ and ⊤ and it is not abelian. |
| `Mathlib:Matrix.SL2.transvection_induction` | Every element of SL(2, F) over a field is a product of elementary transvections (induction principle). Its coefficients are a field; it is not integral symplectic generation. |
| `Mathlib:Module.Flat.ker_lTensor_eq` | For flat M, the kernel of the base change of a linear map f is the base change of ker f. |
| `Mathlib:Module.Grassmannian` | G(k, M; R): submodules N of an R-module M with M ⧸ N finite projective of constant rank k (EGA quotient convention). |
| `Mathlib:Module.Grassmannian.functor` | The Grassmannian functor A ↦ G(k, A ⊗[R] M; A) on commutative R-algebras, with base change of submodules. |
| `Mathlib:cyclotomicCharacter` | The p-adic cyclotomic character (L ≃+* L) →* ℤ_[p]ˣ. Its target is the p-adic unit group; prime-to-p finite roots of unity require the separate finite-character interface. |
| `TauCeti:IsCyclotomicExtension.galEquivProd` | For L/K Galois (number fields), M = L(μ_m) and m coprime to \|disc L\|: Gal(M/K) ≃* Gal(L/K) × (ZMod m)ˣ by restriction and the cyclotomic character. |
| `TauCeti:NumberField.Chebotarev.frobeniusPrimeSet` | The set of primes of K unramified in L whose Artin symbol is a given conjugacy class C. |
| `TauCeti:NumberField.Chebotarev.mem_frobeniusPrimeSet_galEquivProd_symm_iff` | For 𝔭 unramified in M = L(μ_m) with 𝔭 ∤ m: 𝔭 lies in the Frobenius fibre of the class of galEquivProd⁻¹(σ, τ) iff it lies in the fibre of [σ] over L and N𝔭 ≡ τ mod m. |
| `TauCeti:NumberField.artinSymbol` | The Frobenius conjugacy class in Gal(L/K) of a prime 𝔭 of 𝓞_K unramified in L. |
| `TauCeti:Rep.mackeyDecomposition` | Mackey decomposition Res_K Ind_H A ≅ ⊕ over double cosets of the induced restricted representations, for subgroups H, K of any group. This is algebraic Rep, without continuity; the topological finite-index comparison is separately requested from R01.1. |
| `TauCeti:TauCeti.BilinForm.isometryGroup` | The subgroup of linear automorphisms preserving a bilinear form B (Sp(V, ω) when B = ω is alternating nondegenerate). |
| `TauCeti:TauCeti.CoveringSpace.monodromyEquivalence` | Covering spaces of a path-connected, locally path-connected, semilocally simply connected space ≌ functors from the fundamental groupoid to types. |
| `TauCeti:TauCeti.LocalCoefficientSystem.monodromyRepresentation` | The monodromy representation of a local coefficient system at a base point. |
| `TauCeti:TauCeti.Symplectic.geometricallyConnectedCommHopfAlgProperty_coordinateHopfAlgebra` | The symplectic group scheme Sp_{2m} is geometrically connected over every field. |
| `TauCeti:TauCeti.nonempty_linearEquiv_of_finrank_linearMap_eq` | Over a finite-dimensional semisimple algebra, finite modules with equal Hom-dimensions from every simple left ideal are isomorphic. |
| `Mathlib:IsCoveringMap.liftHomotopy` | For a covering p:E→X, a continuous H:I×A→X and a continuous initial lift f:A→E, construct a continuous lift with the given initial value; no simply-connected-domain hypothesis. |
| `Mathlib:FundamentalGroup.mul_def` | p*q=q.trans p: fundamental-group multiplication traverses q before p. |
| `Mathlib:LinearEquiv.transvection` | For a ring R and R-module V, a dual form f and vector v with f(v)=0 give the linear equivalence x↦x+f(x)v, with inverse x↦x−f(x)v. |

## LV.0 — Semilinear centralizers, the affine group Aff(q) and symplectic monodromy lemmas

Inputs for this layer: `Mathlib:Field.exists_primitive_element`, `Mathlib:Ideal.quotientInfRingEquivPiQuotient`, `Mathlib:IsGalois.of_fixed_field`, `Mathlib:FixedPoints.finrank_eq_card`, `Mathlib:Module.finrank_baseChange`, `Mathlib:Module.Flat.ker_lTensor_eq`, `LocalFieldsRamification/2`, `SchemeAndStackFoundations:SF.0`, `Mathlib:ZMod.card_units_eq_totient`, `Mathlib:AffineEquiv`, `Mathlib:CharacterModule`, `Mathlib:CharacterModule.dual_surjective_of_injective`, `Mathlib:AddChar.card_eq`, `Mathlib:LinearMap.BilinForm.finrank_orthogonal`, `Mathlib:LinearMap.transvection`, `TauCeti:TauCeti.BilinForm.isometryGroup`, `Mathlib:LinearEquiv.transvection`, `ReductiveGroups/3`, `Mathlib:Matrix.SL2.transvection_induction`, `ReductiveGroups/7`, `LefschetzPencilsAndVanishingCycles:LPV.5`, `Mathlib:LieAlgebra.IsSimple`, `TauCeti:TauCeti.Symplectic.geometricallyConnectedCommHopfAlgProperty_coordinateHopfAlgebra`, `TauCeti:LinearMap.GeneralLinearGroup.IsUnipotent`, `Mathlib:LieAlgebra.Symplectic.sp`, `ReductiveGroups/2`, `ReductiveGroups/6`. Dependencies within this roadmap are given at each target.

### Splitting and Frobenius centralizers

Split the coefficient algebra first, so the semilinear operator permutes equal-dimensional factors. Commuting endomorphisms descend over the fixed field. This is why a local extension of large degree increases the period dimension without increasing the Frobenius-centralizer bound by the same factor.

**LV.0.1 — Splitting of a finite separable extension after base change to a splitting field** (`LV.0/galois-tensor-splitting`). Let E/F be a finite separable field extension and Ω a field containing F over which the minimal polynomial of a primitive element of E splits (for instance an algebraically closed field containing F). Let Σ = Hom_F(E, Ω). The Ω-algebra map E ⊗_F Ω → Ω^Σ, e ⊗ x ↦ (τ(e)x)_{τ∈Σ}, is an isomorphism.

Source: [lv2020](#source-lv2020), §2.1, proof of Lemma 2.1, p. 9. Uses: layer inputs.

**LV.0.2 — Idempotent decomposition of a module over a split étale algebra** (`LV.0/galois-module-splitting`). For a finite set I, a commutative field Ω and any module M over Ω^I, multiplication by the coordinate idempotents gives a natural Ω-linear equivalence M ≃ ⊕ᵢ eᵢM. Applied to E ⊗_F Ω ≃ Ω^Hom_F(E,Ω), eτM is exactly the simultaneous eigenspace (e ⊗ 1)m = τ(e)m. No finite-dimensionality of M is required.

Source: [lv2020](#source-lv2020), §2.1, proof of Lemma 2.1, p. 9. Uses: layer inputs; `LV.0.1`.

**LV.0.3 — The centralizer of a semilinear automorphism** (`LV.0/semilinear-centralizer`). For a field automorphism σ of E and a bijective σ-semilinear φ on finite-dimensional V/E, set Z(φ)={f∈End_E(V):fφ=φf}. This is an algebra over F=E^σ, with units Z(φ)∩GL_E(V).

The API should expose:

| Name | Mathematical contract |
| --- | --- |
| `semilinearCentralizer` | Z(φ) as an F-subalgebra of End_E(V), F = fixedField σ. |
| `mem_semilinearCentralizer` | f ∈ Z(φ) ↔ f ∘ φ = φ ∘ f. |
| `semilinearCentralizer_le_pow` | Z(φ) ⊆ Z(φ^n) for every n ≥ 1 (φ^n is σ^n-semilinear). |
| `units_semilinearCentralizer` | Z(φ)^× = {g ∈ GL_E(V) : gφ = φg}; it acts on subspaces of V and on filtrations preserving the φ-stable structure. |
| `semilinearCentralizer_linear` | When σ = id, Z(φ) is the usual centralizer of the linear map φ (Mathlib Subalgebra.centralizer). |
| `semilinearCentralizer_conj` | For an E-linear iso u : V ≅ W, u Z(φ) u⁻¹ = Z(uφu⁻¹). |
| `semilinearCentralizer_scalar` | If φ = σ ⊗ 1 on E ⊗_F V₀ then Z(φ) = End_F(V₀) ⊗ 1. |
| `semilinearCentralizer_fixedScalar` | For a base field F fixed pointwise by σ, scalar multiplication by every a∈F commutes with φ. |

Unit tests:

- For V=E and φ=σ, multiplication by a belongs to Z(φ) iff σ(a)=a.
- For σ=id and φ=id on E², Z(φ)=M₂(E).
- For E=ℂ over ℝ and φ=complex conjugation on E, multiplication by i is not in Z(φ), while multiplication by 1 is. The same obstruction occurs in ℚ(i).

Source: [lv2020](#source-lv2020), §2.1, Lemma 2.1, p. 9. Uses: layer inputs.

**LV.0.4 — Dimension of the centralizer of a semilinear automorphism** (`LV.0/semilinear-centralizer-finrank`). Let σ be an automorphism of the field E of finite order e with fixed field F, V an E-vector space of dimension d and φ a σ-semilinear bijection of V. Then dim_F Z(φ) = dim_E Z(φ^e), where φ^e is E-linear; in particular dim_F Z(φ) ≤ d².

Source: [lv2020](#source-lv2020), §2.1, Lemma 2.1 and proof, p. 9; [lv2020](#source-lv2020), §2.1, proof of Lemma 2.1, p. 9. Uses: layer inputs; `LV.0.1`, `LV.0.3`, `LV.0.2`.

**LV.0.5 — Frobenius centralizers over unramified extensions of a p-adic field** (`LV.0/semilinear-centralizer-unramified`). Let K_v/ℚ_p be finite unramified of degree f_v, L/K_v finite unramified of degree r, and σ_L the arithmetic Frobenius of L over ℚ_p. Let V be an L-vector space of dimension n and φ a σ_L-semilinear bijection. Then Z(φ) ⊆ Z(φ^{f_v}); the latter is a K_v-subalgebra of End_L(V) with dim_{K_v} Z(φ^{f_v}) = dim_L Z(φ^{f_v r}) ≤ n²; its unit group is the group of K_v-points of the K_v-group scheme of units of this K_v-algebra, a smooth connected affine group of dimension dim_{K_v} Z(φ^{f_v}).

Source: [lv2020](#source-lv2020), §6, proof of Lemma 6.2, p. 31. Uses: layer inputs; `LV.0.4`.

### Affine symmetries and finite counting

The prime-field affine action makes both peripheral surjection counts and lifted-twist cycle types explicit. The finite pairing estimate later bounds short Frobenius orbits, while the minimal-subrepresentation lemma supplies the half-dimensional threshold in the Hodge argument.

**LV.0.6 — The affine group Aff(q) of a prime field** (`LV.0/affine-group`). For prime q≥3, reuse AffineEquiv over 𝔽_q to define Aff(q)≅𝔽_q⁺⋊𝔽_qˣ. Its faithful permutation action is x↦ax+b. The surjective linear-part map λ(a,b)=a has translation kernel; H_q=𝔽_qˣ is the stabilizer of zero.

The API should expose:

| Name | Mathematical contract |
| --- | --- |
| `affineGroup` | Aff(q) as a subgroup of Equiv.Perm (ZMod q). |
| `affineGroup.mk` | For a ∈ (ZMod q)ˣ and b ∈ ZMod q, the element x ↦ ax + b; mk a b = mk a' b' ↔ a = a' ∧ b = b'. |
| `affineGroup.mulEquivSemidirect` | Aff(q) ≃* Multiplicative (ZMod q) ⋊ (ZMod q)ˣ with the scaling action. |
| `affineGroup.linearPart` | The surjective homomorphism λ : Aff(q) →* (ZMod q)ˣ, λ(mk a b) = a. |
| `affineGroup.ker_linearPart` | ker λ = the translations {mk 1 b}, a normal subgroup isomorphic to ZMod q. |
| `affineGroup.mk_mul_mk` | mk a b * mk a' b' = mk (a a') (a b' + b); (mk a b)⁻¹ = mk a⁻¹ (−a⁻¹ b). |
| `affineGroup.card` | \|Aff(q)\| = q(q − 1). |
| `affineGroup.stabilizer_zero` | The stabilizer of 0 is H_q = {mk a 0} ≃* (ZMod q)ˣ; its index is q and Aff(q) acts on 𝔽_q ≅ Aff(q)/H_q. |
| `affineGroup.commutator_eq` | [mk a b, mk a' b'] = mk 1 (b(1 − a') − b'(1 − a)); the commutator subgroup is the translation subgroup. |
| `affineGroup.isPretransitive` | Aff(q) acts transitively on 𝔽_q: for every x,y there is g with g(x)=y. |
| `affineGroup.example_three` | Aff(3) = Equiv.Perm (ZMod 3). |
| `affineGroup.mulEquivAffineEquiv` | The permutation image Aff(q) is canonically isomorphic as a group to (ZMod q) ≃ᵃ[ZMod q] (ZMod q), preserving evaluation, the linear part and translations. |
| `affineGroup.existsUnique_pair` | For distinct x₁,x₂ and distinct y₁,y₂ in 𝔽_q, there is a unique g∈Aff(q) with g(x₁)=y₁ and g(x₂)=y₂ (sharp two-transitivity). |

Unit tests:

- In Aff(5), (2,1)(3,4)=(1,4), with (a,b) acting by x↦ax+b.
- The identity is (1,0) and (a,b)⁻¹=(a⁻¹,−a⁻¹b).
- The action on 𝔽₃ identifies Aff(3) with Sym(𝔽₃), of cardinality 6.

Source: [lv2020](#source-lv2020), §2.6, p. 14. Uses: layer inputs.

**LV.0.7 — Cycle types of elements of Aff(q)** (`LV.0/affine-group-cycle-type`). Let q ≥ 3 be prime and g = (x ↦ ax + b) ∈ Aff(q). If a ≠ 1, then g has exactly one fixed point and all its other cycles have length ord(a), the order of a in 𝔽_q^×. If a = 1 and b ≠ 0, g is a q-cycle. If g = 1 all cycles are fixed points. In particular the cycle type of g in Sym(𝔽_q) determines whether λ(g) = 1, and when λ(g) ≠ 1 it determines ord(λ(g)).

Source: [lv2020](#source-lv2020), §8.3, p. 42. Uses: layer inputs; `LV.0.6`.

**LV.0.8 — Aff(q) is centre-free, has trivial centralizer and is self-normalizing in Sym(𝔽_q)** (`LV.0/affine-group-centralizer`). For a prime q ≥ 3: (a) the centralizer of Aff(q) in Sym(𝔽_q) is trivial; in particular Aff(q) has trivial centre; (b) the normalizer of Aff(q) in Sym(𝔽_q) is Aff(q). Consequently, for a group Γ, two surjections Γ → Aff(q) are conjugate under Sym(𝔽_q) (as transitive actions on 𝔽_q with image Aff(q)) if and only if they are conjugate under Aff(q), and a surjection Γ → Aff(q) has trivial stabilizer under conjugation by Aff(q).

Source: [lv2020](#source-lv2020), §8.2, footnote 5, p. 39; [lv2020](#source-lv2020), §8.2.1, p. 40. Uses: layer inputs; `LV.0.6`.

**LV.0.9 — The commutator-product map on Aff(q)^{2s}** (`LV.0/commutator-product-map`). For prime q≥3 and s≥1, let f:Aff(q)^{2s}→𝔽_q⁺ be the product of commutators [x,y]=xyx⁻¹y⁻¹, and Λ its componentwise linear parts. On f≠0, a tuple generates Aff(q) iff its linear parts generate 𝔽_qˣ. The generating tuples with f≠0 map onto all generating multiplicative tuples, with every fibre of size q^{2s−1}(q−1).

Source: [lv2020](#source-lv2020), §2.6, Lemma 2.11, p. 14; [lv2020](#source-lv2020), §2.6, proof of Lemma 2.11, p. 14. Uses: layer inputs; `LV.0.6`.

**LV.0.10 — Counting generating tuples of ℤ/N** (`LV.0/generating-tuples-card`). For integers N ≥ 1 and k ≥ 2, the number of k-tuples (y₁, …, y_k) ∈ (ℤ/N)^k whose entries generate ℤ/N as a group is J_k(N) = N^k ∏_{ℓ | N prime} (1 − ℓ^{−k}), and J_k(N) ≥ N^k/2.

Source: [lv2020](#source-lv2020), §5, proof of Theorem 5.4, p. 28. Uses: layer inputs.

**LV.0.11 — Isotropic subgroups for a perfect pairing on a finite abelian group** (`LV.0/isotropic-subgroup-card`). Let A be a finite abelian group and ⟨·,·⟩ : A × A → ℚ/ℤ a biadditive pairing that is perfect in the sense that a ↦ ⟨·, a⟩ is a bijection from A to its character module Hom(A, ℚ/ℤ). If B ≤ A satisfies ⟨B, B⟩ = 0 then |B|² ≤ |A|. No symmetry of the pairing is assumed. (A pairing with values in ℤ/N ⊂ ℚ/ℤ, or in a cyclic group μ_N^∨ ≅ ℤ/N after a choice of generator, is a special case.)

Source: [lv2020](#source-lv2020), §5, proof of Theorem 5.4, p. 28. Uses: layer inputs.

**LV.0.12 — Minimal subrepresentations of a representation with an invariant form up to similitude** (`LV.0/minimal-subrepresentation-half`). Let G be a group, k a field, V a finite-dimensional k-linear representation of G and B a nondegenerate bilinear form on V that is symmetric or alternating, with B(gx, gy) = χ(g)B(x, y) for a character χ : G → k^×. If V is not irreducible and W ⊆ V is a nonzero subrepresentation of minimal dimension, then dim W ≤ dim V / 2.

Source: [lv2020](#source-lv2020), §6, proof of Lemma 6.1, p. 32. Uses: layer inputs.

### Transvections and product generation

Powers of a nontrivial transvection yield its entire one-parameter root subgroup. Pairwise nonzero intersections propagate this through a spanning graph. Goursat then reduces product density to excluding graphs between pairs of factors; different ranks of unipotent fixed spaces give the required obstruction.

**LV.0.13 — Symplectic transvections** (`LV.0/symplectic-transvection`). On a finite-dimensional symplectic space (V,ω) over a characteristic-zero field, put T_v^r(x)=x+rω(v,x)v and T_v=T_v¹. This is the existing transvection applied to rω(v,−), which vanishes on v.

The API should expose:

| Name | Mathematical contract |
| --- | --- |
| `symplecticTransvection` | T_v^r ∈ Sp(V, ω) (as an element of TauCeti.BilinForm.isometryGroup ω). |
| `symplecticTransvection_apply` | T_v^r x = x + r⟨v, x⟩ v. |
| `symplecticTransvection_add` | T_v^r T_v^s = T_v^{r+s}; T_v^0 = 1; (T_v^r)⁻¹ = T_v^{−r}. |
| `symplecticTransvection_smul` | T_{cv}^r = T_v^{c² r}. |
| `conj_symplecticTransvection` | g T_v^r g⁻¹ = T_{gv}^r for g ∈ Sp(V, ω). |
| `isUnipotent_symplecticTransvection` | T_v^r is unipotent: (T_v^r − 1)² = 0. |
| `fixedPoints_symplecticTransvection` | For v ≠ 0 and r ≠ 0 the fixed space of T_v^r is v^⊥, of codimension 1, and the image of T_v^r − 1 is k·v. |
| `eq_symplecticTransvection_of_codim_one` | A unipotent element of Sp(V, ω) whose fixed space has codimension 1 equals T_v^r for some v ≠ 0, r ≠ 0. |
| `symplecticTransvection_eq_transvection` | T_v^r = LinearMap.transvection (r • ω v) v. |
| `symplecticTransvection_sl2` | On (k², det) the transvections T_e^r, T_f^r are the elementary matrices of SL(2, k). |

Unit tests:

- For ω(e,f)=1, T_e^2(f)=f+2e and T_e^2(e)=e.
- T_0^r=id and T_v^0=id.
- As a linear map, T_v^r equals LinearMap.transvection (r • ω(v,·)) v; its inverse is T_v^(−r).

Source: [lv2020](#source-lv2020), §2.7, (2.4), p. 15. Uses: layer inputs.

**LV.0.14 — The Zariski closure of the powers of a transvection** (`LV.0/zariski-closure-transvection-powers`). Let (V, ω) be symplectic over a field k of characteristic zero and v ∈ V nonzero. The Zariski closure in Sp(V) of the cyclic group {T_v^n : n ∈ ℤ} is the one-parameter unipotent subgroup U_v = {T_v^r : r ∈ k}, the image of the closed immersion 𝔾_a → Sp(V), r ↦ T_v^r. More generally the Zariski closure of {T_v^{nr₀} : n ∈ ℤ} is U_v for every r₀ ≠ 0.

Source: [lv2020](#source-lv2020), §2.7, proof of Lemma 2.13, p. 15. Uses: layer inputs; `LV.0.13`.

**LV.0.15 — Two transvections with nonzero pairing** (`LV.0/transvection-pair-closure`). Let (V, ω) be symplectic over a field k of characteristic zero and v₁, v₂ ∈ V linearly independent with ⟨v₁, v₂⟩ ≠ 0. The Zariski closure of the subgroup generated by T_{v₁} and T_{v₂} contains T_v^r for every v ∈ span(v₁, v₂) and every r ∈ k; in fact it contains the subgroup Sp(P) × 1 of Sp(V) for P = span(v₁, v₂), acting trivially on P^⊥.

Source: [lv2020](#source-lv2020), §2.7, Lemma 2.13, p. 15. Uses: layer inputs; `LV.0.14`.

**LV.0.16 — Transvections along a connected intersection graph** (`LV.0/transvection-graph-closure`). Let (V, ω) be symplectic over a field k of characteristic zero and S ⊆ V a finite set of vectors. Form the graph on S with an edge between v, v' when ⟨v, v'⟩ ≠ 0. If this graph is connected then the Zariski closure of the subgroup generated by {T_v : v ∈ S} contains T_w for every w in the span of S. If moreover S spans V, the closure is Sp(V).

Source: [lv2020](#source-lv2020), §2.7, Lemma 2.14, p. 15. Uses: layer inputs; `LV.0.15`.

**LV.0.17 — Two-factor Goursat dichotomy for simple Lie algebras** (`LV.0/two-factor-lie-goursat`). Let k be a field and s,t nonabelian simple k-Lie algebras. If h ≤ s × t projects surjectively to both factors, either h = s × t or h is the graph of a k-Lie equivalence s ≃ t.

Source: [lv2020](#source-lv2020), §2.7, discussion and Lemma 2.12, p. 14. Uses: layer inputs.

**LV.0.18 — Ideals in a finite product of nonabelian simple Lie algebras** (`LV.0/ideals-of-simple-products`). If (sᵢ)ᵢ∈I is a finite family of nonabelian simple k-Lie algebras, every ideal in ∏ᵢ sᵢ is the product of a subset of the factors.

Source: [lv2020](#source-lv2020), §2.7, discussion and Lemma 2.12, p. 14. Uses: layer inputs.

**LV.0.19 — Goursat's lemma for simple Lie algebras (Ribet)** (`LV.0/lie-algebra-goursat`). Let 𝔤₁, …, 𝔤_N be simple Lie algebras over a field k and 𝔥 ⊆ 𝔤₁ × ⋯ × 𝔤_N a Lie subalgebra whose projection to 𝔤_i × 𝔤_j is surjective for every pair i < j (and to each 𝔤_i when N = 1). Then 𝔥 = 𝔤₁ × ⋯ × 𝔤_N.

Source: [lv2020](#source-lv2020), §2.7, before Lemma 2.12, p. 14. Uses: layer inputs; `LV.0.17`, `LV.0.18`.

**LV.0.20 — A closed subgroup of Sp(V) × Sp(V) with surjective projections and an unbalanced unipotent pair** (`LV.0/symplectic-pair-lemma`). Let k be an algebraically closed field of characteristic zero, (V, ω) symplectic of dimension ≥ 2 and G ⊆ Sp(V) × Sp(V) a Zariski-closed subgroup whose projections π₁, π₂ to both factors are surjective. If some g ∈ G has π₁(g), π₂(g) unipotent with fixed spaces of different dimensions, then Lie(G) = 𝔰𝔭(V) × 𝔰𝔭(V) and G = Sp(V) × Sp(V).

Source: [lv2020](#source-lv2020), §2.7, Lemma 2.12, p. 14–15. Uses: layer inputs; `LV.0.19`, `LV.0.17`.

**LV.0.21 — Zariski-closed subgroups of Sp(V)^N** (`LV.0/symplectic-goursat`). Let k be a field of characteristic zero, (V, ω) a symplectic space of dimension ≥ 2 and G ⊆ Sp(V)^N a Zariski-closed subgroup such that (i) each projection π_i : G → Sp(V) is surjective and (ii) for all i ≠ j there is g ∈ G with π_i(g), π_j(g) unipotent with fixed spaces of different dimensions. Then G = Sp(V)^N.

Source: [lv2020](#source-lv2020), §2.7, Lemma 2.12, p. 14–15. Uses: layer inputs; `LV.0.20`, `LV.0.19`.

Named milestones: Semilinear centralizer, Affine group, Symplectic transvection.

## LV.1 — Galois representations: Faltings's finiteness lemma, friendly places and purity of Hodge weights

Inputs for this layer: `TauCeti:TauCeti.nonempty_linearEquiv_of_finrank_linearMap_eq`, `Mathlib:IsSemisimpleRing.exists_algEquiv_pi_matrix_divisionRing`, `Mathlib:Representation`, `Mathlib:Representation.asModule`, `FaltingsFinitenessAndIsogenyTheorems:R28.1/hermite-minkowski-finiteness-of-extensions-unramified-outside-S`, `ArithmeticGaloisRepresentations:R01.1`, `Mathlib:IsArithFrobAt`, `TauCeti:NumberField.artinSymbol`, `Mathlib:Submodule.le_of_le_smul_of_le_jacobson_bot`, `Chebotarev/10`, `Mathlib:Polynomial.coeff_le_of_roots_le`, `WeightsInEtaleCohomology:R34.1`, `DeligneWeightsAndPurity:DWP.0`, `Mathlib:NumberField.IsCMField`, `Mathlib:NumberField.IsCMField.complexEmbedding_complexConj`, `Mathlib:NumberField.maximalRealSubfield`, `Mathlib:InfiniteGalois.fixedField_fixingSubgroup`, `Mathlib:InfiniteGalois.fixingSubgroup_fixedField`, `PadicHodgeTheory:R06.2`, `Mathlib:cyclotomicCharacter`, `ClassFieldTheory/7`, `Mathlib:NumberField.Units.dirichletUnitTheorem.unitLattice_span_eq_top`, `Mathlib:NumberField.Units.logEmbedding`, `Mathlib:Set.unit`, `ClassFieldTheory/11`, `TauCeti:Rep.mackeyDecomposition`, `NeronModelsAndSemistableAbelianVarieties:R11.5`, `ArithmeticGaloisRepresentations:R01.6`, `DeligneWeightsAndPurity:DWP.1`, `PadicHodgeTheory:R06.6`, `AbelianSchemesAndArithmeticModuli:A3`, `SchemeAndStackFoundations:SF.3`. Dependencies within this roadmap are given at each target.

### Finite Frobenius data and semisimple representations

The trace criterion applies to the finite-dimensional image algebra, rather than assuming that the entire group algebra is finite-dimensional. A finite collection of Frobenius tests reduces the global representation problem to finitely many bounded integral polynomials.

**LV.1.1 — Semisimple representations in characteristic zero are determined by their traces** (`LV.1/trace-determines-semisimple`). Let G be a group, k a field of characteristic zero and V, W finite-dimensional semisimple k-linear representations of G with tr(g | V) = tr(g | W) for every g ∈ G. Then V ≅ W as representations.

Source: [deligne-bourbaki-616](#source-deligne-bourbaki-616), §3, proof of Théorème 3.1, p. 17 (numdam file). Uses: layer inputs.

**LV.1.2 — A finite set of Frobenius traces determines a representation (Faltings–Deligne)** (`LV.1/frobenius-test-set`). Let K be a number field, T a finite set of finite places of K, p a prime and d ≥ 1. There is a finite set T' of finite places of K, disjoint from T, with the following property: if ρ₁, ρ₂ : G_K → GL_d(ℚ_p) are continuous representations unramified outside T such that tr ρ₁(Frob_v) = tr ρ₂(Frob_v) for all v ∈ T', then tr ρ₁ = tr ρ₂ on G_K; if moreover ρ₁ and ρ₂ are semisimple, then ρ₁ ≅ ρ₂.

Source: [deligne-bourbaki-616](#source-deligne-bourbaki-616), §3, proof of Théorème 3.1, pp. 17–18 (numdam file); [faltings-1983](#source-faltings-1983), §5, proof of Satz 5, pp. 362–363; [lv2020](#source-lv2020), §2.3, proof of Lemma 2.3, p. 10. Uses: layer inputs; `LV.1.1`.

**LV.1.3 — Finiteness of integer Weil polynomials of fixed degree and weight** (`LV.1/weil-polynomials-finite`). For a real number q > 1 and integers d ≥ 0 and w, the set of monic P ∈ ℤ[X] of degree d all of whose complex roots have absolute value q^{w/2} is finite.

Source: [faltings-1983](#source-faltings-1983), §5, proof of Satz 5, p. 362. Uses: layer inputs.

**LV.1.4 — Faltings's finiteness lemma** (`LV.1/faltings-finiteness`). Let K be a number field, T a finite set of finite places of K, p a prime and w, d ≥ 0 integers. Up to isomorphism there are only finitely many semisimple continuous representations ρ : G_K → GL_d(ℚ_p) that are unramified outside T, pure of weight w outside T and have integral Frobenius polynomials outside T. (LV state the lemma with 'unramified outside S' for a set S not containing the places above p, while applying it to p-adic cohomology; the correct and intended hypothesis allows T to contain the places above p.)

Source: [lv2020](#source-lv2020), §2.3, Lemma 2.3, p. 9. Uses: layer inputs; `LV.1.2`, `LV.1.3`.

### CM fields and friendly places

The largest CM-or-totally-real subfield organizes the possible infinity types of global characters. Inertness in its CM quadratic extension forces the locally visible exponents to coincide at a friendly place.

**LV.1.5 — CM or totally real fields via complex conjugations** (`LV.1/cm-or-totally-real-criterion`). Fix an algebraic closure ℚ̄ and let C ⊆ Gal(ℚ̄/ℚ) be the set of complex conjugations (the automorphisms ι⁻¹ ∘ conj ∘ ι for embeddings ι : ℚ̄ → ℂ). A number field F ⊆ ℚ̄ is totally real or CM if and only if c₁c₂ fixes F pointwise for all c₁, c₂ ∈ C. In that case there is an automorphism s_F of F with s_F² = 1 and c ∘ τ = τ ∘ s_F for every c ∈ C and every embedding τ : F → ℚ̄; s_F = 1 iff F is totally real, and s_F is the complex conjugation of F when F is CM.

Source: [milne-cm](#source-milne-cm), Chapter I, Proposition 1.4 and Remark 1.6, p. 10; [milne-cm](#source-milne-cm), Chapter I, Remark 1.6, p. 10. Uses: layer inputs.

**LV.1.6 — The largest CM-or-totally-real subfield of a number field** (`LV.1/largest-cm-subfield`). For K⊆ℚ̄, let C be all complex conjugations, H the closed subgroup generated by products c₁c₂ and H⁺ that generated by C. Set E_K=K∩ℚ̄^H and E_K⁺=K∩ℚ̄^{H⁺}. These are respectively the largest CM-or-totally-real subfield and the largest totally real subfield. The relative degree [E_K:E_K⁺] is at most two; E_K is CM exactly when K contains a CM field.

The API should expose:

| Name | Mathematical contract |
| --- | --- |
| `largestCMSubfield` | E_K as an IntermediateField ℚ K. |
| `largestTotallyRealSubfield` | E_K⁺, equal to Mathlib's maximalRealSubfield K. |
| `largestTotallyRealSubfield_eq_maximalRealSubfield` | E_K⁺ = NumberField.maximalRealSubfield K as subfields of K. |
| `le_largestCMSubfield_iff` | A subfield F ≤ K satisfies F ≤ E_K iff F is totally real or CM. |
| `isCMField_largestCMSubfield_iff` | IsCMField E_K ↔ K has a CM subfield ↔ E_K ≠ E_K⁺. |
| `finrank_largestCMSubfield_div` | [E_K : E_K⁺] ∈ {1, 2}. |
| `largestCMSubfield_map` | For a field isomorphism σ : K ≃ K', σ(E_K) = E_{K'}. |
| `embeddings_eq_on_largestCMSubfield_iff` | Two embeddings τ, τ' : K → ℚ̄ agree on E_K iff τ' = hτ for some h in the closure H. |
| `largestCMSubfield_cyclotomic` | E_{ℚ(ζ_n)} = ℚ(ζ_n) for n ≥ 3; E_{ℚ(2^{1/3})} = ℚ. |

Unit tests:

- For every CM number field K, E_K=K; in particular this applies to ℚ(i,√2).
- For every totally real number field K, E_K=K and E_K⁺=K.
- If [K:ℚ]=3 and K is not totally real, E_K=ℚ; this distinguishes ℚ(real cube root of 2) from a totally real cubic field.

Source: [milne-cm](#source-milne-cm), Chapter I, Remark 1.7, pp. 10–11; [milne-cm](#source-milne-cm), Chapter I, Corollary 1.5, p. 10. Uses: layer inputs; `LV.1.5`.

**LV.1.7 — Friendly places** (`LV.1/friendly-place`). A finite place v of K is friendly if it is unramified over ℚ and, when E_K is CM, its restriction to E_K⁺ is inert in E_K. When K has no CM subfield only the unramifiedness condition remains.

The API should expose:

| Name | Mathematical contract |
| --- | --- |
| `IsFriendly` | The predicate on HeightOneSpectrum (𝓞 K). |
| `IsFriendly.isUnramified` | A friendly place is unramified over ℚ. |
| `isFriendly_iff_of_not_hasCMSubfield` | If K has no CM subfield, IsFriendly v ↔ v is unramified over ℚ. |
| `isFriendly_iff_exists_decomposition` | IsFriendly v ↔ v unramified over ℚ ∧ (E_K CM → ∃ δ in the decomposition group at v with δ acting on E_K as its complex conjugation). |
| `isFriendly_of_frobenius` | If Frob_℘ ∈ Gal(K'/ℚ) (K' Galois over ℚ containing K) restricts to the nontrivial automorphism of E_K over E_K⁺, then the place of K below ℘ is friendly when unramified over ℚ (used with Chebotarev in LV.11). |
| `isFriendly_map` | Friendliness is preserved by isomorphisms of number fields. |
| `isFriendly_rat` | Over ℚ every prime is friendly; over ℚ(i) exactly the primes above p ≡ 3 mod 4. |

Unit tests:

- For K=ℚ(i), the place above 3 is friendly, while either place above 5 is not.
- Every unramified finite place of a number field with no CM subfield is friendly.
- The ramified place above 2 of ℚ(i) is not friendly.

Source: [lv2020](#source-lv2020), §2.4, Definition 2.7, p. 12. Uses: layer inputs; `LV.1.6`.

**LV.1.8 — Functions on embeddings with constant conjugate sum factor through the largest CM subfield (Artin–Weil)** (`LV.1/infinity-type-factorization`). Let K ⊆ ℚ̄ be a number field, w ∈ ℤ and m : Hom(K, ℚ̄) → ℤ with m(c ∘ τ) + m(τ) = w for all τ and all complex conjugations c ∈ C. Then m(τ) depends only on τ|_{E_K}. If K has no CM subfield then m(τ) = w/2 for all τ; in particular w is even.

Source: [milne-cm](#source-milne-cm), Chapter I, Infinity types, proof of Proposition 4.9, pp. 37–38; [milne-cm](#source-milne-cm), Chapter I, Infinity types, proof of Proposition 4.9, p. 38; [lv2020](#source-lv2020), §2.4, before the proof of Lemma 2.8, p. 12. Uses: layer inputs; `LV.1.6`.

**LV.1.9 — At a friendly place a place-constant function with the conjugation relation takes the value w/2** (`LV.1/friendly-exponent-half`). Let K ⊆ ℚ̄ be a number field, p a prime, ι_p : ℚ̄ → ℚ̄_p an embedding, and for each τ ∈ Hom(K, ℚ̄) let v(τ) be the place of K above p induced by ι_p ∘ τ. Let m : Hom(K, ℚ̄) → ℤ satisfy m(c∘τ) + m(τ) = w for all c ∈ C and τ, and assume m(τ) depends only on v(τ). Then for every friendly place v above p, m(τ) = w/2 whenever v(τ) = v.

Source: [lv2020](#source-lv2020), §2.4, proof of Lemma 2.8, pp. 12–13. Uses: layer inputs; `LV.1.8`, `LV.1.7`, `LV.1.5`.

### Hodge numbers of characters and induced representations

Apply local algebraicity to determinants to convert purity into an average Hodge weight. Finite induction then adds those weights over all places above v with their local-degree multiplicities. Keep the full integer-indexed filtration: positive-jump truncation would lose the determinant and Tate-twist identities.

**LV.1.10 — De Rham ℚ_p-valued characters are locally algebraic** (`LV.1/de-rham-character-locally-algebraic`). Let F/ℚ_p be a finite extension and ψ : G_F → ℚ_p^× a continuous character that is de Rham, and let k ∈ ℤ be the unique filtration jump of the one-dimensional F-space D_dR(ψ). Then ψ·χ_cyc^{k} has finite image on the inertia group I_F; equivalently, ψ ∘ Art_F agrees with u ↦ N_{F/ℚ_p}(u)^{k} on an open subgroup of 𝒪_F^×. (With the conventions of this roadmap, D_dR(ℚ_p(n)) has its jump at −n and χ_cyc(Art_F(u)) = N_{F/ℚ_p}(u)^{-1}.)

Source: [brinon-conrad](#source-brinon-conrad), Example 6.3.1 and Proposition 6.3.2, p. 76; [brinon-conrad](#source-brinon-conrad), Theorem 2.2.7, p. 15; [lv2020](#source-lv2020), §2.4, p. 12. Uses: layer inputs.

**LV.1.11 — Global purity forces the conjugation relation on Hodge–Tate exponents** (`LV.1/pure-character-conjugation-relation`). Let K be a number field, p a prime, ι_p : ℚ̄ → ℚ̄_p an embedding, and η : G_K → ℚ_p^× a continuous character that is unramified outside a finite set T of finite places containing those above p, pure of weight w outside T, and de Rham at every place v' | p with filtration jump k_{v'}. For τ ∈ Hom(K, ℚ̄) put m(τ) := k_{v(τ)}. Then m(c ∘ τ) + m(τ) = w for every complex conjugation c ∈ C and every τ.

Source: [lv2020](#source-lv2020), §2.4, proof of Lemma 2.8, p. 12. Uses: layer inputs; `LV.1.10`.

**LV.1.12 — Pure characters at friendly places** (`LV.1/pure-character-friendly`). Let v be a friendly place of the number field K above p and η : G_K → ℚ_p^× a continuous character, unramified outside a finite set, pure of weight w outside that set, and de Rham at every place above p. Then w is even, the filtration jump of D_dR(η|_{G_{K_v}}) is w/2, and η ∘ Art_{K_v} agrees with N_{K_v/ℚ_p}^{w/2} on an open subgroup of 𝒪_{K_v}^×. (LV state η²|_{K_v^×} = χ·Norm^w on all of K_v^×; on a uniformizer this fails already for η = χ_cyc^{−1} over ℚ, and only the restriction to units, which is what LV use, is asserted here.)

Source: [lv2020](#source-lv2020), §2.4, Lemma 2.8, p. 12; [lv2020](#source-lv2020), §2.4, after Lemma 2.8, p. 12. Uses: layer inputs; `LV.1.11`, `LV.1.9`, `LV.1.10`.

**LV.1.13 — The weight of a filtration** (`LV.1/filtration-weight`). For nonzero finite-dimensional D with a finite exhaustive separated decreasing integer-indexed filtration, define weight_F(D)=t_H(D)/dim D, where t_H(D)=Σ_j j dim gr^jD. Retain negative jumps as well as positive ones.

The API should expose:

| Name | Mathematical contract |
| --- | --- |
| `filtrationWeight` | weight_F(D) = t_H(D)/dim D for a nonzero filtered vector space. |
| `filtrationWeight_eq` | weight_F(D) · dim D = Σ_j j dim gr^j D. |
| `filtrationWeight_det` | t_H(det D) = t_H(D), so the jump of det D is dim D · weight_F(D). |
| `filtrationWeight_directSum` | weight_F(D ⊕ D') = (dim D weight_F(D) + dim D' weight_F(D'))/(dim D + dim D'). |
| `filtrationWeight_restrictScalars` | For F'/F finite and D an F'-filtered space viewed over F, t_H over F is [F':F] times t_H over F', so the weight is unchanged. |
| `filtrationWeight_sub_quotient` | t_H is additive on strict short exact sequences. |
| `filtrationWeight_twist` | Shifting the filtration by n adds n to the weight. |
| `filtrationWeight_example` | A two-step filtration with dim F¹ = a on a space of dimension n has weight a/n. |

Unit tests:

- A two-dimensional filtration with jumps 0 and 1 has weight 1/2.
- A one-dimensional ℚ-vector space with its only filtration jump at 0 has filtration weight 0.
- A one-dimensional filtration with jump −1 has weight −1; after direct sum with a line of jump 1 the weight is 0.

Source: [lv2020](#source-lv2020), §2.5, (2.2), p. 13; [brinon-conrad](#source-brinon-conrad), Definition 8.1.1, p. 102. Uses: layer inputs.

**LV.1.14 — Hodge weight of a pure representation at a friendly place** (`LV.1/hodge-weight-pure-representation`). Let K be a number field, v a friendly place above p, and V a continuous representation of G_K on a nonzero finite-dimensional ℚ_p-vector space that is unramified outside a finite set, pure of weight w outside it, and de Rham (for instance crystalline) at every place above p. Then the weight of the Hodge filtration on D_dR(V|_{G_{K_v}}) equals w/2.

Source: [lv2020](#source-lv2020), §2.5, Lemma 2.9 and proof, p. 13. Uses: layer inputs; `LV.1.12`, `LV.1.13`.

**LV.1.15 — D_dR of an induced representation at a place** (`LV.1/de-rham-of-induced`). Let L/K be a finite extension of number fields, v a place of K above p, and ρ a continuous representation of G_L on a finite-dimensional ℚ_p-space that is de Rham at every place u of L above v. Then Ind_{G_L}^{G_K} ρ restricted to G_{K_v} is de Rham and D_dR,K_v(Ind ρ|_{G_{K_v}}) ≅ ⊕_{u|v} D_dR,L_u(ρ|_{G_{L_u}}) as filtered K_v-vector spaces (each summand viewed over K_v by restriction of scalars).

Source: [lv2020](#source-lv2020), §2.5, proof of Lemma 2.10, p. 14. Uses: layer inputs.

**LV.1.16 — Hodge weights summed over places above a friendly place** (`LV.1/hodge-weight-sum-over-places`). Let L/K be a finite extension of number fields, v a friendly place of K above p, and ρ : G_L → GL_n(ℚ_p), with n > 0, continuous, finitely ramified, pure of weight w outside a finite set and de Rham at every place of L above p. Let a_u(ρ) be the weight of the Hodge filtration of D_dR(ρ|_{G_{L_u}}). Then Σ_{u|v} [L_u : K_v]·a_u(ρ) = [L : K]·w/2.

Source: [lv2020](#source-lv2020), §2.5, Lemma 2.10, p. 13–14. Uses: layer inputs; `LV.1.14`, `LV.1.15`.

**LV.1.17 — The Galois representation on H¹ of an abelian variety** (`LV.1/abelian-variety-cohomology-properties`). For an abelian variety A/L with good reduction outside finite S_A, ρ_A=H¹_et(A_L̄,ℚ_p)=V_p(A)* has dimension 2dim A and is unramified outside T=S_A∪{u|p}. At u∉T its geometric-Frobenius polynomial equals the reduced abelian variety's integral Frobenius polynomial, pure of weight one. At good-reduction u|p it is crystalline. A polarization gives a perfect alternating G_L-pairing to ℚ_p(−1).

Source: [lv2020](#source-lv2020), §6, proof of Proposition 5.3, p. 29–30; [lv2020](#source-lv2020), §6, proof of Lemma 6.1, p. 32. Uses: layer inputs.

Named milestones: Faltings’s finiteness lemma, Largest CM subfield, Friendly place, Weight of a filtration.

## LV.2 — Abelian-by-finite families, good models and Gauss–Manin transport on residue disks

Inputs for this layer: `AbelianSchemesAndArithmeticModuli:A1`, `AbelianSchemesAndArithmeticModuli:A2`, `Mathlib:AlgebraicGeometry.IsFinite`, `Mathlib:AlgebraicGeometry.Etale`, `Mathlib:AlgebraicGeometry.IsProper`, `Mathlib:AlgebraicGeometry.Smooth`, `AbelianSchemesAndArithmeticModuli:A4`, `Mathlib:Set.integer`, `Mathlib:AlgebraicGeometry.IsProper.eq_valuativeCriterion`, `SchemeAndStackFoundations:SF.0`, `Mathlib:AlgebraicGeometry.spread_out_of_isGermInjective`, `Mathlib:MvPowerSeries`, `LocalFieldsRamification/2`, `Mathlib:Nat.factorization_factorial_le_div_pred`, `Mathlib:MvPowerSeries.IsRestricted`, `Mathlib:HasFPowerSeriesOnBall`, `Mathlib:FormalMultilinearSeries.radius`, `ComplexComparisonPartII:C5`, `AbelianSchemesAndArithmeticModuli:A5`, `Mathlib:AnalyticOnNhd.eqOn_of_preconnected_of_eventuallyEq`, `TauCeti:TauCeti.LocalCoefficientSystem.monodromyRepresentation`, `CrystallineCohomology:CR.1`, `CrystallineCohomology:CR.2`, `CrystallineCohomology:CR.3:Frobenius-isogeny`, `CrystallineCohomology:CR.7`. Dependencies within this roadmap are given at each target.

### Families, integral models and cohomology

Finite étale pushforward puts the fibre algebra, H¹ and the Hodge subbundle on one base. The connection preserves the algebra action and polarization. Inverting the polarization degree in the model is necessary for an integral perfect pairing.

**LV.2.1 — Abelian-by-finite families** (`LV.2/abelian-by-finite-family`). Over an arbitrary base B, an abelian-by-finite family is X→f Y′→π Y with π finite étale and f a polarized abelian scheme of constant dimension d. The composite is smooth proper of dimension d. At y, E_y=Γ(π⁻¹(y),𝒪) is finite étale over κ(y), and X_y is naturally an E_y-scheme; π=id recovers a polarized abelian scheme.

The API should expose:

| Name | Mathematical contract |
| --- | --- |
| `AbelianByFiniteFamily` | The structure (Y', π, X, f, e, λ) over a B-scheme Y. |
| `AbelianByFiniteFamily.relDim` | The relative dimension d of f. |
| `AbelianByFiniteFamily.total` | The composite π ∘ f : X → Y, smooth and proper of relative dimension d. |
| `AbelianByFiniteFamily.baseChange` | Pullback along Y₁ → Y and along B₁ → B, with base change of π, f and λ; compatible with composition and identity. |
| `AbelianByFiniteFamily.fibreAlgebra` | E_y = Γ(π^{-1}(y), 𝒪), a finite étale κ(y)-algebra whose factors are the residue fields of the points of Y' over y. |
| `AbelianByFiniteFamily.fibre` | The fibre X_y as an E_y-scheme; over each point y' of π^{-1}(y) it is the polarized abelian variety X_{y'} over κ(y'). |
| `AbelianByFiniteFamily.ofAbelianScheme` | A polarized abelian scheme over Y is an abelian-by-finite family with π = id. |
| `AbelianByFiniteFamily.restrictScalars` | The total space as a smooth proper Y-scheme, forgetting the factorization. |

Unit tests:

- For π=id_Y, the construction associated to a polarized abelian scheme has fibre algebra κ(y).
- For Y′=Y⊔Y and two dimension-d abelian schemes, the fibre algebra is κ(y)×κ(y), and the total fibre is their disjoint union, not their product.
- Pulling back along id_Y gives an isomorphic abelian-by-finite family, preserving its polarization and factorization.

Source: [lv2020](#source-lv2020), §5, Definition 5.1, p. 25. Uses: layer inputs.

**LV.2.2 — Good models over rings of S-integers** (`LV.2/good-model`). For a smooth K-variety Y and finite S containing infinity, a good model is a polarized abelian-by-finite family over 𝒪_S recovering X→Y′→Y. Its base is smooth finite type, and proper when Y is proper. Require locally free Hodge terms and quotient commuting with base change, an integral extension of the Gauss–Manin connection, and invertible polarization degree. Nonproper bases are allowed.

The API should expose:

| Name | Mathematical contract |
| --- | --- |
| `IsGoodModel` | The predicate that an abelian-by-finite family over 𝒪_S is a good model of a family over K. |
| `IsGoodModel.baseChange` | A good model over 𝒪_S gives a good model over 𝒪_{S'} for S ⊆ S'. |
| `IsGoodModel.integralPoints` | If Y is proper, every K-point of Y extends uniquely to an 𝒪-point of 𝒴. |
| `IsGoodModel.fibre_goodReduction` | For y ∈ 𝒴(𝒪) and y' over y, X_{y'} has good reduction at every place of K(y') not above S, and K(y')/K is unramified outside S. |
| `IsGoodModel.deRham_locallyFree` | H¹_dR(𝒳/𝒴') and F¹ are locally free with locally free quotient. |
| `IsGoodModel.of_polarizedAbelianScheme` | The case π = id. |

Unit tests:

- The principally polarized Legendre family over ℤ[1/2][t,1/(t(1−t))] satisfies the good-model conditions.
- A good model over 𝒪_S remains a good model after enlarging S.
- Multiplying a principal polarization by p makes its integral de Rham pairing nonperfect at p; the strengthened good-model convention requires p to be inverted.

Source: [lv2020](#source-lv2020), §5, Definition 5.1, p. 25; [lv2020](#source-lv2020), §3.1, p. 15. Uses: layer inputs; `LV.2.1`.

**LV.2.3 — Existence of good models after enlarging S** (`LV.2/good-model-exists`). Let X → Y' → Y be an abelian-by-finite family over a smooth (respectively smooth proper) K-variety Y. There is a finite set S of places of K such that the family has a good model over 𝒪_S with 𝒴 smooth (respectively smooth and proper) over 𝒪_S. Any two good models become isomorphic over 𝒪_{S'} for some finite S' ⊇ S.

Source: [lv2020](#source-lv2020), §3.1, p. 15. Uses: layer inputs; `LV.2.2`.

**LV.2.4 — The de Rham bundle of an abelian-by-finite family** (`LV.2/de-rham-bundle`). For a good model, put ℰ=π_*𝒪_{𝒴′} and ℋ=π_*H¹_dR(𝒳/𝒴′). Then ℋ is free locally of ℰ-rank 2d, with Lagrangian F¹ of rank d and locally free quotient. The perfect alternating ℰ-pairing and integrable connection satisfy ∇(ex)=d_ℰ(e)x+e∇x and d_ℰω(x,x′)=ω(∇x,x′)+ω(x,∇x′). Pullback to any 𝒪_S-algebra-valued point identifies this data with fibre de Rham cohomology, compatibly with total-family cohomology.

The API should expose:

| Name | Mathematical contract |
| --- | --- |
| `deRhamBundle` | ℋ as a locally free ℰ-module of rank 2d on 𝒴. |
| `deRhamBundle.hodge` | The Hodge sub-bundle F¹ℋ of ℰ-rank d. |
| `deRhamBundle.pairing` | The ℰ-bilinear perfect alternating pairing with F¹ℋ Lagrangian. |
| `deRhamBundle.gaussManin` | The integrable connection ∇ with the ℰ-Leibniz rule and horizontal pairing. |
| `deRhamBundle.fibreEquiv` | y^*ℋ ≃ H¹_dR(X_y/R) as E_y-modules with filtration and pairing. |
| `deRhamBundle.fibreDecomp` | Over a field L ⊇ K, H¹_dR(X_y/L) = ∏ over the factors of E_y ⊗ L of the de Rham cohomology of the corresponding abelian varieties (LV (6.2)). |
| `deRhamBundle.baseChange` | Compatibility with base change of the family and with restriction to open subschemes of 𝒴. |
| `deRhamBundle.eq_gaussManin_total` | ∇ is the Gauss–Manin connection of the smooth proper morphism 𝒳 → 𝒴 on H¹_dR(𝒳/𝒴) = ℋ. |
| `deRhamBundle.legendre` | For the Legendre family, the basis dx/y, x dx/y and its connection matrix. |

Unit tests:

- For a constant elliptic scheme A×𝒴, ℋ has rank 2, F¹ rank 1, and its connection is d in a constant frame.
- For a disjoint union over Y′=Y⊔Y, ℋ and F¹ split into the corresponding two summands, with componentwise pairing.
- For a polarization of degree divisible by p, its integral pairing at p must not be declared perfect without the added unit-degree hypothesis.

Source: [lv2020](#source-lv2020), §6, proof of Proposition 5.3, p. 29; [lv2020](#source-lv2020), §4.3, proof of Lemma 4.2, p. 22. Uses: layer inputs; `LV.2.2`.

### Residue coordinates and horizontal differential equations

Formal horizontality has a unique normalized solution. Factorial denominators control its p-adic convergence, while a complex majorant gives convergence near the same algebraic base point. These two analytic solutions are obtained from one formal solution.

**LV.2.5 — Residue disks and their coordinates** (`LV.2/residue-disk`). For smooth finite-type 𝒴/𝒪_S of relative dimension m, unramified K_v/ℚ_p with v∉S, and y₀∈𝒴(𝒪_v), let Ω_v(y₀) be the integral points with reduction ȳ₀. Parameters along y₀ give completed ring 𝒪_v[[z₁,…,z_m]] and Ω_v≅(p𝒪_v)^m. Parameters and coefficients descend to 𝒪_(v) when y₀ does; this descent is required for common K-series.

The API should expose:

| Name | Mathematical contract |
| --- | --- |
| `residueDisk` | Ω_v(y₀) as a subset of 𝒴(𝒪_v). |
| `residueDisk.coords` | The bijection z : Ω_v(y₀) ≃ (p𝒪_v)^m attached to a system of parameters. |
| `residueDisk.coords_germ` | Taylor expansion in coordinates based at an 𝒪_v-section has coefficients in 𝒪_v. For an 𝒪_(v)-section and parameters defined there, the coefficients lie in 𝒪_(v). |
| `residueDisk.mem_iff` | y ∈ Ω_v(y₀) ↔ y and y₀ have the same reduction. |
| `residueDisk.coords_change` | Two systems of parameters differ by an 𝒪_v-analytic isomorphism given by power series in 𝒪_v[[z]]. |
| `residueDisk.finiteEtale` | Over the completed disk a finite étale cover splits into disks over finite unramified 𝒪_v-algebras. Its 𝒪_v-points over Ω_v are exactly the sections from residue-degree-one factors; a degree > 1 field factor contributes points only after unramified base change. |
| `residueDisk.cover` | 𝒴(𝒪_v) is the finite disjoint union of the residue disks of its points; if 𝒴 is proper, Y(K_v) = 𝒴(𝒪_v). |
| `residueDisk.affineLine` | The residue disks of 𝔸¹(ℤ_p) are the cosets of pℤ_p. |

Unit tests:

- On 𝔸¹ over ℤ₅, Ω₅(2)=2+5ℤ₅ and t↦t−2 identifies it with 5ℤ₅.
- On Spec ℤ₅ the residue disk is a singleton, matching the zero-dimensional coordinate space.
- Spec 𝒪_L→Spec ℤ₅ for the unramified quadratic extension L/ℚ₅ has no ℤ₅-valued point; its two geometric points are not two ℤ₅-sections.

Source: [lv2020](#source-lv2020), §3.3, pp. 16–17. Uses: layer inputs.

**LV.2.6 — Formal horizontal sections of an integrable connection with integral coefficients** (`LV.2/formal-horizontal-sections`). Let R be a subring of a field K of characteristic zero, r ≥ 1, and A_1, …, A_m ∈ M_r(R[[z_1, …, z_m]]) satisfying the integrability condition ∂_k A_l − ∂_l A_k + [A_k, A_l] = 0. There is a unique Φ ∈ GL_r(K[[z]]) with Φ(0) = 1 and ∂_k Φ = −A_k Φ for all k. Writing Φ = Σ_α Φ_α z^α, one has α!·Φ_α ∈ M_r(R) for every multi-index α, where α! = ∏ α_i!; the same holds for Φ^{-1}, which solves ∂_k Ψ = Ψ A_k.

Source: [lv2020](#source-lv2020), §3.3, (3.6) and the following paragraph, pp. 16–17. Uses: layer inputs.

**LV.2.7 — p-adic convergence of formal horizontal sections on the residue disk** (`LV.2/horizontal-sections-padic-convergence`). In the setting of the formal-solution lemma, let R = 𝒪_(v) ⊆ K for a finite place v with K_v/ℚ_p unramified and p > 2. Then Φ and Φ^{-1} converge absolutely for z ∈ K_v^m with |z_i|_v < |p|_v^{1/(p−1)}. More precisely the series x ↦ Φ(p x) has coefficients p^{|α|}Φ_α ∈ M_r(𝒪_v) tending to zero, so it is a restricted power series over 𝒪_v in x ∈ 𝒪_v^m; in particular Φ(z) ∈ GL_r(𝒪_v) and Φ(z) ≡ 1 mod p for z ∈ (p𝒪_v)^m.

Source: [lv2020](#source-lv2020), §3.3, p. 17. Uses: layer inputs; `LV.2.6`.

**LV.2.8 — Complex convergence of formal horizontal sections (majorants)** (`LV.2/horizontal-sections-complex-convergence`). In the setting of the formal-solution lemma, let ι : K → ℂ be an embedding and suppose that the entries of the ι-images of all A_k converge on a polydisk around 0. Then ι(Φ) converges on a polydisk around 0 and is the holomorphic fundamental solution there: ∂_k ι(Φ) = −ι(A_k) ι(Φ), ι(Φ)(0) = 1.

Source: [lv2020](#source-lv2020), §3.3, p. 17. Uses: layer inputs; `LV.2.6`.

### Transport and crystalline Frobenius

Transport identifies the ambient cohomology, algebra and pairing; the Hodge filtration is allowed to vary. The crystalline Taylor comparison identifies the p-adic transport with the Frobenius-compatible comparison between lifts of the same special-fibre point.

**LV.2.9 — p-adic Gauss–Manin transport on a residue disk** (`LV.2/gauss-manin-transport-padic`). For a good model, v∉S unramified over ℚ_p, p>2 and y₀∈𝒴(𝒪_v), evaluate the normalized horizontal solution at y∈Ω_v to obtain T_v(y):ℋ_{y₀}≃ℋ_y over 𝒪_v. This is independent of frame and parameters, starts at identity, identifies the étale algebras, preserves their polarization forms and satisfies T(y₀,y″)=T(y′,y″)T(y₀,y′).

The API should expose:

| Name | Mathematical contract |
| --- | --- |
| `gaussManinTransport` | T_v(y) : ℋ_{y₀} ≃ ℋ_y for y ∈ Ω_v(y₀). |
| `gaussManinTransport_self` | T_v(y₀) = id. |
| `gaussManinTransport_trans` | Transitivity T_v(y'') = T_{y'}(y'') ∘ T_v(y') for y', y'' in one disk. |
| `gaussManinTransport_algebra` | The integral transport is a ring isomorphism 𝓔_{y₀} ≃ 𝓔_y, and T_v(y) is semilinear over it; after inverting p it identifies the local étale K_v-algebras. |
| `gaussManinTransport_pairing` | ⟨T_v(y)x, T_v(y)x'⟩ = T_ℰ(⟨x, x'⟩). |
| `gaussManinTransport_matrix` | In a basis near ȳ₀, the matrix of T_v(y) is Φ(z(y)), with entries restricted power series in z/p. |
| `gaussManinTransport_indep` | T_v(y) does not depend on the basis or on the parameters. |
| `gaussManinTransport_pairs` | For K-rational y and y₀, the local-factor bijection becomes the bijection of pairs (y′,w) over (y,v) with K(y′)_w ≅ K(y₀′)_{w₀}. For general local points use the factors of 𝓔_y[1/p]. |
| `gaussManinTransport_constant` | For a constant family T_v(y) = id. |

Unit tests:

- For a constant family, T_{y₀,y}=id in the constant frame.
- T_{y₁,y₂}∘T_{y₀,y₁}=T_{y₀,y₂}, and T_{y,y₀}=T_{y₀,y}⁻¹ within a residue disk.
- Transport need not carry F¹ at y₀ to F¹ at y; that stronger condition would make the nonconstant Legendre period map constant.

Source: [lv2020](#source-lv2020), §3.3, (3.7), p. 17; [lv2020](#source-lv2020), §6, (6.3)–(6.6), p. 30. Uses: layer inputs; `LV.2.4`, `LV.2.5`, `LV.2.7`.

**LV.2.10 — Complex Gauss–Manin transport and Betti parallel transport** (`LV.2/gauss-manin-transport-complex`). For ι:K→ℂ and a contractible neighborhood Ω_ℂ of y₀, horizontal sections give T_ℂ(y):ℋ^an_{y₀}≃ℋ^an_y. De Rham–Betti comparison makes this local-system parallel transport, preserving algebra and pairing. With K-rational y₀ and K-defined coordinates and frames, its matrix is ι(Φ)(z(y)).

The API should expose:

| Name | Mathematical contract |
| --- | --- |
| `gaussManinTransportComplex` | T_ℂ(y) for y in a contractible neighbourhood of y₀. |
| `gaussManinTransportComplex_eq_parallel` | T_ℂ(y) is Betti parallel transport under the de Rham–Betti comparison. |
| `gaussManinTransportComplex_series` | For a K-rational base point with coordinates and frame over K, the matrix near that point is ι(Φ)(z(y)). For an arbitrary complex point use the corresponding complex formal solution. |
| `gaussManinTransportComplex_trans` | Transitivity along paths in Ω_ℂ. |
| `gaussManinTransportComplex_pairing` | Compatibility with the polarization and the ℰ-structure. |
| `gaussManinTransportComplex_monodromy` | Analytic continuation along a loop γ at y₀ gives forward Betti transport T_γ=μ(op γ)⁻¹, where LV.3 uses backward transport on π₁^op. |
| `gaussManinTransportComplex_legendre` | The Legendre family's period matrix. |

Unit tests:

- Constant families have identity transport in a constant frame.
- On a contractible chart, de Rham transport equals Betti parallel transport under comparison.
- Continuation around a standard puncture of the Legendre base has nontrivial unipotent monodromy, so it is not identity transport around every loop.

Source: [lv2020](#source-lv2020), §3.3, (3.8), p. 17; [lv2020](#source-lv2020), §3.2, p. 16. Uses: layer inputs; `LV.2.4`, `LV.2.8`.

**LV.2.11 — Crystalline Frobenius on the de Rham cohomology of the fibres and its compatibility with Gauss–Manin transport** (`LV.2/crystalline-frobenius-on-fibres`). For the unramified p-adic good model with p>2, Berthelot–Ogus comparison transports H¹_cris(X_ȳ/W(k_v))[1/p] Frobenius to bijective φ_y on V_y=ℋ_y[1/p]. It is arithmetic-Frobenius-semilinear on K_v and each field factor of E_y=ℰ_y[1/p]. In a residue disk T_v(y)φ_{y₀}=φ_yT_v(y). For rational y the factors are K(y′)_w over (y,v).

The API should expose:

| Name | Mathematical contract |
| --- | --- |
| `crystallineFrobenius` | φ_y on ℋ_y ⊗ K_v for y ∈ 𝒴(𝒪_v). |
| `crystallineFrobenius_semilinear` | φ_y(a x)=σ(a)φ_y(x) for a∈K_v, and φ_y(e x)=Frob(e)φ_y(x) for e∈E_y=𝓔_y[1/p]. |
| `crystallineFrobenius_bijective` | φ_y is bijective. |
| `crystallineFrobenius_transport` | T_v(y) ∘ φ_{y₀} = φ_y ∘ T_v(y) for y in the disk of y₀. |
| `crystallineFrobenius_factor` | On a factor L_i of E_y=𝓔_y[1/p], φ_y is crystalline Frobenius semilinear over arithmetic Frobenius of L_i/ℚ_p. For rational y, L_i=K(y′)_w. |
| `crystallineFrobenius_pairing` | ⟨φx, φx'⟩ = p·Frob⟨x, x'⟩ for the polarization pairing. |
| `crystallineFrobenius_example` | Ordinary and supersingular elliptic curves. |

Unit tests:

- For H¹ of y²=x³−x over ℚ₃, crystalline Frobenius has characteristic polynomial X²+3.
- The polarization pairing satisfies ω(φx,φy)=p·Frob(ω(x,y)), not equality without the factor p.
- Over an unramified quadratic extension, φ(a x)=σ(a)φ(x); for σ(a)≠a and x≠0 it is not linear over that extension.

Source: [lv2020](#source-lv2020), §3.3, (3.9), p. 17; [lv2020](#source-lv2020), §3.3, p. 17; [berthelot-ogus](#source-berthelot-ogus), §7, Corollary 7.4, p. 7.4. Uses: layer inputs; `LV.2.9`, `LV.2.4`.

Named milestones: Abelian-by-finite family, Good model, Gauss–Manin transport, Crystalline Frobenius.

## LV.3 — Lagrangian period varieties and the complex and p-adic period maps

Inputs for this layer: `Mathlib:LinearMap.BilinForm.IsAlt`, `Mathlib:LinearMap.BilinForm.Nondegenerate`, `Mathlib:LinearMap.BilinForm.orthogonal`, `Mathlib:LinearMap.BilinForm.finrank_orthogonal`, `TauCeti:TauCeti.BilinForm.isometryGroup`, `Mathlib:Module.Grassmannian`, `Mathlib:Module.Grassmannian.functor`, `AlgebraicModuliForArithmeticGeometry:R09.1`, `SchemeAndStackFoundations:SF.0`, `Mathlib:AlgebraicGeometry.IsIntegral`, `Mathlib:IrreducibleSpace`, `Mathlib:AlgebraicGeometry.Etale`, `AbelianSchemesAndArithmeticModuli:A5`, `ComplexComparisonPartII:C5`, `TauCeti:TauCeti.LocalCoefficientSystem.monodromyRepresentation`, `Mathlib:IsCoveringMap.monodromyPerm`, `ReductiveGroups/3`, `UniversalCovers/2`, `Mathlib:FundamentalGroup.mul_def`, `ComplexComparisonPartII:C0`, `TauCeti:TauCeti.UniversalCover`, `Mathlib:IsCoveringMap.existsUnique_continuousMap_lifts`, `Mathlib:Nat.factorization_factorial_le_div_pred`, `Mathlib:MvPowerSeries.IsRestricted`, `Mathlib:MvPowerSeries`, `ComplexComparisonPartII:C4`, `Mathlib:AnalyticOnNhd.eqOn_of_preconnected_of_eventuallyEq`, `Mathlib:HasFPowerSeriesAt.apply_eq_zero`, `Mathlib:MvPolynomial.funext`, `Mathlib:HasFPowerSeriesOnBall`, `Mathlib:Module.Flat.ker_lTensor_eq`, `Mathlib:MvPolynomial.vanishingIdeal`, `Mathlib:MvPolynomial.zeroLocus`, `Mathlib:PowerSeries.IsRestricted`, `ArithmeticDynamics:DY.6/strassmann-theorem`, `Mathlib:MvPowerSeries.IsRestricted.subring`. Dependencies within this roadmap are given at each target.

### Lagrangian charts and the period variety

Use the Grassmannian submodule functor with isotropy and componentwise rank conditions. Symmetric graph charts give dimension d(d+1)/2 per field component. Splitting the finite étale algebra then identifies the period variety with a product of Lagrangian Grassmannians.

**LV.3.1 — Dimension criterion for Lagrangians** (`LV.3/isotropic-dimension`). Every isotropic subspace L of a 2d-dimensional symplectic space has dimension at most d. It is Lagrangian (L=L^⊥) exactly when its dimension is d.

Source: [lv2020](#source-lv2020), §6, Lemma 6.4, p. 33. Uses: layer inputs.

**LV.3.2 — Adapted symplectic bases** (`LV.3/lagrangian-symplectic-basis`). Every basis of a Lagrangian L in a finite-dimensional symplectic space extends to a symplectic basis (e_i,f_i); the span of the f_i is a Lagrangian complement. This holds in every characteristic.

Source: [lv2020](#source-lv2020), §6, Lemma 6.4, p. 33. Uses: layer inputs; `LV.3.1`.

**LV.3.3 — Transitivity on Lagrangian subspaces** (`LV.3/lagrangian-transitivity`). Sp(V,ω)(k) acts transitively on the Lagrangian subspaces of V.

Source: [lv2020](#source-lv2020), §6, Lemma 6.4, p. 33. Uses: layer inputs; `LV.3.2`, `LV.3.1`.

**LV.3.4 — Symmetric graph charts** (`LV.3/lagrangian-transverse-chart`). For complementary Lagrangians L,L′, the Lagrangians transverse to L′ are uniquely the graphs of maps S:L→L′ such that ω(x,Sy)=ω(y,Sx). In an adapted symplectic basis these are symmetric matrices.

Source: [lv2020](#source-lv2020), §6, Lemma 6.4, p. 33. Uses: layer inputs; `LV.3.2`, `LV.3.1`.

**LV.3.5 — Arnold chart cover** (`LV.3/arnold-chart-cover`). In a symplectic basis (e_i,f_i), put Λ_I=span(e_i:i∈I;f_j:j∉I). Every Lagrangian is transverse to some Λ_I.

Source: [lv2020](#source-lv2020), §6, Lemma 6.4, p. 33. Uses: layer inputs; `LV.3.2`, `LV.3.1`.

**LV.3.6 — The Lagrangian Grassmannian** (`LV.3/lagrangian-grassmannian`). For symplectic V/k of dimension 2d, define LGr(V,ω)(A) by isotropy inside the existing Grassmannian of rank-d locally free quotients of A⊗V. It is a closed represented subscheme, with field points the Lagrangian subspaces, Sp-action and restricted Plücker embedding. A chart transverse to L′ is the affine space of symmetric maps L→L′≅L*.

The API should expose:

| Name | Mathematical contract |
| --- | --- |
| `LagrangianGrassmannian` | LGr(V, ω) as a closed subscheme of Gr(V, d) representing the isotropic-submodule subfunctor. |
| `LagrangianGrassmannian.functor` | The subfunctor A ↦ {W ∈ G(d, A ⊗ V; A) : ω_A(W, W) = 0} of Module.Grassmannian.functor. |
| `LagrangianGrassmannian.mem_points_iff` | For a field k' ⊇ k, the k'-points are the Lagrangian subspaces of V ⊗ k'. |
| `LagrangianGrassmannian.chart` | For a Lagrangian L' with complement L, the open subscheme U_{L'} ≅ 𝔸(Sym(L → L')) of Lagrangians transverse to L'. |
| `LagrangianGrassmannian.chart_cover` | For a symplectic basis, the 2^d charts U_{Λ_I} cover LGr(V, ω). |
| `LagrangianGrassmannian.plucker` | The closed immersion LGr(V, ω) → ℙ(∧^d V) restricted from the Plücker embedding. |
| `LagrangianGrassmannian.action` | The action of Sp(V, ω) on LGr(V, ω) induced by g ↦ (W ↦ gW). |
| `LagrangianGrassmannian.baseChange` | LGr(V, ω) ⊗ k' = LGr(V ⊗ k', ω ⊗ k') for a field extension k'/k. |
| `LagrangianGrassmannian.dimOne` | For d = 1, LGr(V, ω) = ℙ(V). |

Unit tests:

- For a symplectic plane over k, LGr is ℙ¹_k.
- For V=0, LGr is Spec k, with its unique zero submodule.
- In a standard four-dimensional symplectic space, span(e₁,f₁) has half dimension but is not a point of LGr, since ω(e₁,f₁)=1.

Source: [lv2020](#source-lv2020), §6, Lemma 6.4, p. 33; [lv2020](#source-lv2020), §6, proof of Lemma 6.4, p. 33. Uses: layer inputs; `LV.3.2`, `LV.3.1`, `LV.3.3`, `LV.3.4`, `LV.3.5`.

**LV.3.7 — The Lagrangian Grassmannian is smooth, projective and geometrically irreducible of dimension d(d+1)/2** (`LV.3/lagrangian-grassmannian-geometry`). For (V, ω) as in the Lagrangian Grassmannian definition, LGr(V, ω) is smooth and projective over k, geometrically irreducible, of dimension d(d+1)/2, and Sp(V, ω)(k̄) acts transitively on LGr(V, ω)(k̄). Consequently every Zariski-closed subset of LGr(V, ω)_{k'} (k' ⊇ k a field) other than the whole space has dimension < d(d+1)/2, and a set of k'-points is Zariski dense if and only if no nonzero homogeneous polynomial in the Plücker coordinates that is nonzero on LGr vanishes on it.

Source: [lv2020](#source-lv2020), §6, proof of Lemma 6.2, p. 31. Uses: layer inputs; `LV.3.6`, `LV.3.2`, `LV.3.1`, `LV.3.3`, `LV.3.4`, `LV.3.5`.

**LV.3.8 — The Lagrangian period variety of a symplectic module over a finite étale algebra** (`LV.3/lagrangian-period-variety`). For finite étale E/k, free rank-2d V/E and perfect alternating E-form ω, define LGr_E(V,ω)(A) by isotropic E⊗_kA-submodules L⊆V⊗_kA with quotient locally free of componentwise rank d. It is the componentwise-rank-d part of the E-stable closed locus in LGr(V,tr_{E/k}ω), equivalently Res^E_kLGr(V,ω). The trace form is symplectic on the k-space of dimension 2d[E:k].

The API should expose:

| Name | Mathematical contract |
| --- | --- |
| `periodVariety` | LGr_E(V, ω) as a closed subscheme of LGr(V, tr ∘ ω). |
| `periodVariety.mem_iff` | W ∈ LGr_E(V, ω)(A) ↔ W is an E ⊗ A-submodule, (A ⊗ V)/W locally free of rank d[E:k], and ω_A(W, W) = 0. |
| `periodVariety.mem_points_iff_free` | Over a field k' ⊇ k the points are the free rank-d (E ⊗ k')-submodules isotropic for ω. |
| `periodVariety.traceForm` | ω_tr = tr_{E/k} ∘ ω, nondegenerate and alternating. |
| `periodVariety.baseChange` | LGr_E(V, ω) ⊗ k' = LGr_{E⊗k'}(V ⊗ k', ω ⊗ k'). |
| `periodVariety.prodEquiv` | For E = E₁ × E₂ (so V = V₁ × V₂), LGr_E(V, ω) ≅ LGr_{E₁}(V₁, ω₁) × LGr_{E₂}(V₂, ω₂), the projections sending W to e_i W. |
| `periodVariety.semilinearAction` | The group of k-linear automorphisms g of V for which some s ∈ Aut_k(E) satisfies g(ex) = s(e)g(x) and ω(gx, gy) = s(ω(x, y)) acts on LGr_E(V, ω); it contains the E-linear symplectic group Sp_E(V, ω). |
| `periodVariety.plucker` | The Plücker embedding LGr_E(V, ω) → ℙ(∧^{d[E:k]} V) restricted from LGr(V, ω_tr). |
| `periodVariety.stableGrassmannian` | Gr_E(V,d) is the componentwise rank-d part of the E-stable locus in Gr_k(V,d[E:k]): over A require the quotient to be finite locally free of rank d over E⊗_k A. This is Res_{E/k} Gr_E(V,d), not the whole stable locus; it contains LGr_E(V,ω), and GL_E(V) acts on it. |
| `periodVariety.dimOne` | For d = 1 every E-line is isotropic and LGr_E(V, ω) is the variety of free rank-one E-submodules (LV §4.3). |

Unit tests:

- For E=k the period variety equals LGr(V,ω).
- For E=k×k and V=E² with the standard form, the period variety is ℙ¹×ℙ¹ and has dimension 2.
- For E=k×k and V=E², W=k²×0 is E-stable with half the total k-dimension but has component ranks (2,0); it is not a rank-one E-point of the ambient Weil-restricted Grassmannian.

Source: [lv2020](#source-lv2020), §6, proof of Proposition 5.3, p. 29. Uses: layer inputs; `LV.3.6`, `LV.0.1`.

**LV.3.9 — Geometry of the period variety** (`LV.3/lagrangian-period-variety-splitting`). For E,V,ω above and a splitting field k′, write Σ=Hom_k(E,k′), E⊗k′=k′^Σ and V⊗k′=⊕V_τ. Then LGr_E(V,ω)⊗k′≅∏_τLGr(V_τ,ω_τ), with dim V_τ=2d. It is smooth projective geometrically irreducible of dimension [E:k]d(d+1)/2 and the split product Sp acts transitively. Projection to a factor algebra is surjective, has a section through a chosen point and preserves dense images. At d=1 the split variety is (ℙ¹)^Σ.

Source: [lv2020](#source-lv2020), §6, p. 30; [lv2020](#source-lv2020), §4.3, p. 23. Uses: layer inputs; `LV.3.8`, `LV.3.7`, `LV.0.1`, `LV.0.2`.

### Monodromy and the two period maps

Trivialize the cohomology by forward horizontal transport and pull the Hodge subspace back by its inverse. Algebraic Plücker coordinates in an adapted Hodge frame give the common power series. On the universal cover the same construction is equivariant for backward monodromy.

**LV.3.10 — The algebraic monodromy group of an abelian-by-finite family and full monodromy** (`LV.3/algebraic-monodromy-group`). For a polarized abelian-by-finite family over smooth connected complex Y, let V_B=⊕_{y′|y₀}H¹_B(X_{y′},ℚ). Backward transport gives μ:π₁(Y,y₀)^op→GL(V_B), and Γ is its Zariski closure over ℂ. It permutes factors by inverse covering monodromy and preserves Σω_{y′}. Full monodromy means Γ contains ∏_{y′|y₀}Sp(H¹_B(X_{y′},ℂ),ω_{y′}). For K-families use ι-base change and de Rham–Betti comparison with (V_ℂ,E₀⊗ℂ,ω₀).

The API should expose:

| Name | Mathematical contract |
| --- | --- |
| `monodromyRep` | μ : π₁(Y(ℂ), y₀)^op →* GL(V_B), μ(op δ)=T_δ⁻¹. It is the inverse/opposite wrapper of the pinned forward local-system representation; its image equals the image of forward transport. |
| `algebraicMonodromyGroup` | Γ, the Zariski closure of the image of μ in GL(V_B ⊗ ℂ). |
| `HasFullMonodromy` | The predicate Γ ⊇ ∏_{y'} Sp(H¹_B(X_{y'}), ω_{y'}). |
| `algebraicMonodromyGroup_le_normalizer` | Γ normalizes ℂ^{π^{-1}(y₀)} ⊆ End(V_B ⊗ ℂ) and preserves Σ_{y'} ω_{y'}; hence Γ acts on H_ℂ = LGr_{E₀⊗ℂ}(V_ℂ). |
| `hasFullMonodromy_iff_basepoint` | Full monodromy does not depend on y₀ ∈ Y(ℂ). |
| `algebraicMonodromyGroup_deRham` | Under the de Rham–Betti comparison V_B ⊗ ℂ ≅ V_ℂ the summands correspond to the factors of E₀ ⊗_ι ℂ and ω_{y'} to the components of ω₀. |
| `HasFullMonodromy.orbit_eq` | If the family has full monodromy then Γ·h = H_ℂ(ℂ) for every h ∈ H_ℂ(ℂ) (transitivity on the period variety). |
| `hasFullMonodromy_legendre` | The Legendre family has full monodromy; a constant family does not. |

Unit tests:

- The Legendre family has algebraic monodromy SL₂, though its integral image omits −I.
- A constant positive-dimensional polarized family has algebraic monodromy 1 and fails full monodromy.
- A change of base point conjugates the monodromy group by parallel transport and preserves the full-monodromy predicate.
- For noncommuting forward transports A=[[1,1],[0,1]] and B=[[1,0],[1,1]], T_{p*q}⁻¹=B⁻¹A⁻¹ differs from A⁻¹B⁻¹. Backward transport is multiplicative on π₁^op; treating it as a homomorphism on the ordinary Mathlib π₁ fails this test.

Source: [lv2020](#source-lv2020), §3.2, (3.5), p. 16; [lv2020](#source-lv2020), §5, (5.1), p. 25. Uses: layer inputs; `LV.2.1`, `LV.2.10`.

**LV.3.11 — The p-adic period map on a residue disk** (`LV.3/padic-period-map`). In P define Φ_v(y)=T_v(y)⁻¹F¹ℋ_y in H(K_v). It sends y₀ to h₀. Transport identifies (V_v,φ_{y₀},Φ_v(y)) with (ℋ_y⊗K_v,φ_y,F¹ℋ_y⊗K_v), semilinearly over the transported étale-algebra isomorphism.

The API should expose:

| Name | Mathematical contract |
| --- | --- |
| `padicPeriodMap` | Φ_v : Ω_v → H(K_v), y ↦ T_v(y)⁻¹(F¹ℋ_y ⊗ K_v). |
| `padicPeriodMap_base` | Φ_v(y₀) = h₀. |
| `padicPeriodMap_mem` | Φ_v(y) is an (E₀ ⊗ K_v)-stable Lagrangian subspace of V_v. |
| `padicPeriodMap_transport` | T_v(y) : (V_v, φ_{y₀}, Φ_v(y)) ≅ (ℋ_y ⊗ K_v, φ_y, F¹) as filtered φ-modules, semilinear over E₀ ⊗ K_v ≅ E_y ⊗ K_v. |
| `padicPeriodMap_rebase` | For y₁ ∈ Ω_v the period map based at y₁ is Φ_v^{y₁}(y) = T_v(y₁)(Φ_v^{y₀}(y)), since T_{y₁,y} = T_{y₀,y} ∘ T_{y₀,y₁}^{−1}. |
| `padicPeriodMap_constant` | A constant family has constant period map. |

Unit tests:

- For a constant family Φ_v(y)=F¹V for every y in the disk.
- At y₀, Φ_v(y₀)=F¹V; at a new base y₁, Φ_v^{y₁}(y)=T_{y₀,y₁}(Φ_v^{y₀}(y)).
- For Legendre and a good odd residue characteristic, Φ_v is not constant on a residue disk.

Source: [lv2020](#source-lv2020), §3.4, p. 18; [lv2020](#source-lv2020), §6, proof of Proposition 5.3, p. 29. Uses: layer inputs; `LV.2.9`, `LV.2.11`, `LV.2.4`, `LV.2.5`, `LV.3.8`.

**LV.3.12 — The complex period map and its equivariant continuation to the universal cover** (`LV.3/complex-period-map`). In P, on a connected simply connected neighborhood Ω_ℂ of y₀, put Φ_ℂ(y)=T_ℂ(y)⁻¹F¹ℋ_y. On the universal cover extend this as Φ̃([γ])=T_γ⁻¹F¹ℋ_{γ(1)}. It is holomorphic, sends the chosen lift of y₀ to h₀, agrees with the local map on that sheet and satisfies Φ̃(opδ·x)=μ(opδ)Φ̃(x) for the prepending deck action.

The API should expose:

| Name | Mathematical contract |
| --- | --- |
| `complexPeriodMap` | Φ_ℂ : Ω_ℂ → H_ℂ(ℂ). |
| `complexPeriodMap.lift` | Φ̃ : Ỹ → H_ℂ(ℂ) on the universal cover. |
| `complexPeriodMap.lift_base` | Φ̃(ỹ₀) = h₀. |
| `complexPeriodMap.lift_equivariant` | Φ̃(op δ·x)=μ(op δ)·Φ̃(x), with the opposite-group left deck action by prepending δ. |
| `complexPeriodMap.lift_holomorphic` | Φ̃ is holomorphic in Plücker charts. |
| `complexPeriodMap.lift_eq` | Φ̃ = Φ_ℂ ∘ q on the sheet over Ω_ℂ containing ỹ₀. |
| `complexPeriodMap.mem` | Φ̃ takes values in H_ℂ(ℂ), the (E₀ ⊗ ℂ)-stable Lagrangians. |
| `complexPeriodMap.legendre` | The Legendre period map on the upper half-plane. |

Unit tests:

- For a constant family the lifted period map is constant.
- On the sheet through the chosen lift of y₀, the universal-cover map equals the chart period map composed with the covering projection.
- The Legendre period map is nonconstant; its projective deck action factors through Γ(2)/{±I}, so replacing the action by the trivial action fails.

Source: [lv2020](#source-lv2020), §3.4, p. 18. Uses: layer inputs; `LV.2.10`, `LV.3.10`, `LV.3.8`, `LV.2.8`.

**LV.3.13 — The complex and p-adic period maps are given by one tuple of power series over K** (`LV.3/period-maps-common-series`). In P choose K-defined coordinates and a Hodge-adapted frame of ℋ, r=2dn. Let B_I be the maximal minors of the first dn columns of Φ⁻¹, with I₀={1,…,dn}. Then α!B_{I,α}∈𝒪_(v), B_I(px) are restricted integral series, and B_{I₀}(px)≡1 mod p. These are Plücker coordinates of Φ_v; their ι-images converge on a complex coordinate polydisk and give Φ_ℂ there. At zero B_I=δ_{I,I₀}.

Source: [lv2020](#source-lv2020), §3.3, p. 16; [lv2020](#source-lv2020), §1.2, p. 3. Uses: layer inputs; `LV.3.11`, `LV.3.12`, `LV.2.6`, `LV.2.7`, `LV.2.8`, `LV.2.9`, `LV.2.10`.

### Zariski density and finite intersections

Analytic continuation puts the monodromy orbit inside the complex period closure. Vanishing of a convergent series is equivalent to formal vanishing, so both closures descend from one homogeneous ideal over K. On a curve a polynomial detecting a proper closed subset becomes a nonzero restricted one-variable series, to which the finite-extension Strassmann theorem applies.

**LV.3.14 — The Zariski closure of the complex period image contains the monodromy orbit** (`LV.3/complex-period-closure-contains-orbit`). In setting P, assume Y(ℂ) is connected, and let U ⊆ Ω_ℂ be a nonempty open subset. Then Γ·h₀ ⊆ Z for every Zariski-closed subset Z ⊆ H_ℂ containing Φ_ℂ(U); that is, Γ·h₀ is contained in the Zariski closure of Φ_ℂ(U). If the family has full monodromy, Φ_ℂ(U) is Zariski dense in H_ℂ.

Source: [lv2020](#source-lv2020), §3.4, Lemma 3.1, p. 18; [lv2020](#source-lv2020), §3.4, proof of Lemma 3.1, p. 18. Uses: layer inputs; `LV.3.12`, `LV.3.10`, `LV.3.9`.

**LV.3.15 — A power series vanishing on an open polydisk is zero** (`LV.3/convergent-series-vanishing`). Let F be ℂ or a complete nontrivially nonarchimedean valued field of characteristic zero, and let f ∈ F[[z_1, …, z_m]] converge absolutely on U = {z ∈ F^m : |z_i| < ε} for some ε > 0. If f(z) = 0 for all z ∈ U, then f = 0.

Source: [lv2020](#source-lv2020), §3.4, proof of Lemma 3.2, p. 19. Uses: layer inputs.

**LV.3.16 — Complex and v-adic Zariski closures of a power-series map descend to one K-subscheme** (`LV.3/power-series-zariski-closure`). For a number field K, embedding ι and finite v, let B₀,…,B_N∈K[[z₁,…,z_m]] converge absolutely without common zeros on positive-radius p-adic and complex polydisks. The homogeneous relations Q(B)=0 generate a prime homogeneous ideal I⊆K[x₀,…,x_N]. Its integral projective zero locus base-changes to both image Zariski closures; these are integral of equal dimension.

Source: [lv2020](#source-lv2020), §3.4, Lemma 3.2, p. 18; [lv2020](#source-lv2020), §3.4, proof of Lemma 3.2, p. 19. Uses: layer inputs; `LV.3.15`.

**LV.3.17 — Zariski closure of the p-adic period image and density under full monodromy** (`LV.3/padic-period-image-dense`). In P with Y(ℂ) connected, one integral closed K-subscheme Z⊆H base-changes to the p-adic period-image closure and the complex local period-image closure. The latter contains Γh₀, so the p-adic closure has dimension at least dim closure(Γh₀). Full monodromy gives Z=H and density after every finite-étale factor projection.

Source: [lv2020](#source-lv2020), §3.4, Lemma 3.3, p. 19; [lv2020](#source-lv2020), §6, proof of Proposition 5.3, p. 29. Uses: layer inputs; `LV.3.16`, `LV.3.13`, `LV.3.14`, `LV.3.9`, `LV.3.10`.

**LV.3.18 — Finite-extension Strassmann adapter for residue disks** (`LV.3/strassmann`). Let F be a finite extension of ℚ_p with its complete nonarchimedean absolute value with valuation ring 𝒪_F, and f = Σ_{n≥0} a_n x^n ∈ F[[x]] with a_n → 0 and not all a_n zero. Let N(f) be the largest n with |a_n| = max_k |a_k|. Then f has at most N(f) zeros in 𝒪_F. In particular a nonzero restricted power series over 𝒪_F has finitely many zeros in 𝒪_F.

Source: [conrad-strassmann](#source-conrad-strassmann), Theorem 4.1 and proof, PDF pp. 6–8. Uses: layer inputs.

**LV.3.19 — On a curve, the p-adic period map meets a closed subset not containing its image in finitely many points** (`LV.3/padic-period-preimage-finite`). In P with m=1, every closed Z′⊆H_v failing to contain Φ_v(Ω_v) has finite inverse image. For connected Y(ℂ), dim Z′<dim closure(Φ_v(Ω_v)) suffices; full monodromy makes the closure H_v. For any finite-étale factor projection pr₁ to H₁, the same conclusion holds when dim B₁<dim closure(pr₁Φ_v(Ω_v)); that closure is H₁ under full monodromy.

Source: [lv2020](#source-lv2020), §3.4, after Lemma 3.3, p. 19; [lv2020](#source-lv2020), §1.2, p. 3. Uses: layer inputs; `LV.3.17`, `LV.3.18`, `LV.3.13`, `LV.3.9`.

Named milestones: Lagrangian Grassmannian, Lagrangian period variety, Full monodromy, p-adic period map, Complex period map.

## LV.4 — Crystalline comparison on residue disks and the finiteness criterion

Inputs for this layer: `CohomologyComparisons:CP.2/crystalline-comparison-over-discretely-valued-base`, `PadicHodgeTheory:R06.2`, `PadicHodgeTheory:R06.5`, `PadicHodgeTheory:R06.6`, `CrystallineCohomology:CR.2`, `SchemeAndStackFoundations:SF.2`, `LocalFieldsRamification/2`, `SchemeAndStackFoundations:SF.0`, `ReductiveGroups/3`, `NeronModelsAndSemistableAbelianVarieties:R11.5`. Dependencies within this roadmap are given at each target.

### Reading a representation from the period filtration

Crystalline comparison identifies each local degree-one étale representation with the corresponding de Rham factor and Hodge filtration. Transport moves this triple to a fixed local field and vector space throughout a residue disk.

**LV.4.1 — The fibre representations are crystalline with the de Rham cohomology of the fibre as filtered φ-module** (`LV.4/fibre-representation-crystalline`). In P let y∈Y(K)∩Ω_v, y′∈π⁻¹(y) closed, and w|v in K(y′). The point y extends over some 𝒪_{S_y}, S_y⊇S excluding v; take S_y=S for integral y. The abelian variety X_{y′} has good reduction outside places over S_y. For L=K(y′)_w, unramified over K_v, set ρ_{y′,w}=H¹_et(X_{y′,K̄},ℚ_p)|_{G_L}. It is crystalline, with covariant filtered comparison D_cris(ρ_{y′,w})≅(H¹_dR(X_{y′}⊗L/L),φ_{y′,w},F¹). Frobenius comes from the special fibre via Berthelot–Ogus; the filtration has jumps 0,1. The comparison is functorial and respects polarizations.

Source: [lv2020](#source-lv2020), §3.5, p. 19; [brinon-conrad](#source-brinon-conrad), §9.1, Proposition 9.1.9, p. 133. Uses: layer inputs; `LV.2.2`, `LV.2.11`, `LV.1.17`.

**LV.4.2 — The filtered φ-module of a fibre read off from the period map** (`LV.4/fibre-filtered-phi-transport`). In P let y∈Y(K)∩Ω_v, y′∈π⁻¹(y) be closed and w|v. Transport (y′,w) over (y,v) to (y₀′,w₀), with field isomorphism τ:K(y′)_w≅L₀. Let V₀,φ₀ be that base factor and pr₀:H_v→H₀=LGr_{L₀}(V₀,ω₀). Then pr₀Φ_v(y)=T_v(y)⁻¹F¹H¹_dR(X_{y′}⊗K(y′)_w/K(y′)_w); transporting D_cris(ρ_{y′,w}) along τ gives (V₀,φ₀,pr₀Φ_v(y)).

Source: [lv2020](#source-lv2020), §6, (6.7), p. 30; [lv2020](#source-lv2020), §6, proof of Lemma 6.2, p. 31; [lv2020](#source-lv2020), §3.5, p. 19. Uses: layer inputs; `LV.4.1`, `LV.3.11`, `LV.3.8`, `LV.2.9`, `LV.2.11`.

### Small Frobenius orbits in a large period space

The group of units of the centralizer acts on the stable Grassmannian. Its orbit closure has dimension at most the centralizer dimension, even if it does not preserve the polarization. Intersect with the Lagrangian period variety and compare with the closure of the period image; this gives the residue-disk finiteness criterion.

**LV.4.3 — Filtrations with isomorphic filtered φ-modules form a Frobenius-centralizer orbit of bounded dimension** (`LV.4/filtered-phi-orbit`). For finite unramified ℚ_p⊆K_v⊆L, f_v=[K_v:ℚ_p], bijective σ_L-semilinear φ on W/L and equal-dimensional F,F′⊆W, the two-step filtered φ-modules are isomorphic iff F′=gF for g∈Z(φ)ˣ. Put A=Z(φ^{f_v}); it is a K_v-algebra of dimension ≤(dim_LW)². Its unit group acts on the L-stable Grassmannian and contains Z(φ)ˣ. Orbit closures, and finite unions of them, have dimension ≤dim_{K_v}A.

Source: [lv2020](#source-lv2020), §3.5, proof of Proposition 3.4, pp. 19–20; [lv2020](#source-lv2020), §6, proof of Lemma 6.2, p. 31; [brinon-conrad](#source-brinon-conrad), §7.3, Definition 7.3.4, p. 98. Uses: layer inputs; `LV.0.3`, `LV.0.5`, `LV.3.8`.

**LV.4.4 — Finiteness criterion on a residue disk of a curve** (`LV.4/finiteness-criterion`). In P take m=1 and d≥1. Fix a transported local factor L₀=K(y₀′)_{w₀}, its (V₀,φ₀), and period projection pr₀ to H₀. Write Z₀=closure(pr₀Φ_v(Ω_v)) and c=dim_{K_v}Z(φ₀^{f_v})≤4d². A set 𝒮⊆Y(K)∩Ω_v is finite if its corresponding local pairs (K(y′)_w,ρ_{y′,w}) have finitely many isomorphism classes and c<dim Z₀. Pair isomorphisms include the field isomorphism. If Y(ℂ) is connected and monodromy full, dim Z₀=[L₀:K_v]d(d+1)/2, so local degree ≥8 suffices.

Source: [lv2020](#source-lv2020), §3.5, proof of Proposition 3.4, p. 20; [lv2020](#source-lv2020), §6, proof of Lemma 6.2, p. 31. Uses: layer inputs; `LV.4.2`, `LV.4.3`, `LV.3.19`, `LV.3.17`, `LV.3.9`, `LV.0.5`, `LV.2.9`.

**LV.4.5 — Fibres with good reduction and semisimple Galois representation** (`LV.4/proposition-3-4`). In setting P, assume n = 1 (π = id, so X → Y is a polarized abelian scheme, E₀ = K and H = LGr(V, ω₀)), m = 1 and Y(ℂ) connected, and write ρ_y = H¹_et(X_y ×_K K̄, ℚ_p). If dim_{K_v} Z(φ_{y₀}^{f_v}) < dim_ℂ(Γ·h₀) (LV (3.13)), then the set {y ∈ 𝒴(𝒪) : y ≡ y₀ mod v, ρ_y semisimple} is finite.

Source: [lv2020](#source-lv2020), §3.5, Proposition 3.4, pp. 19–20; [lv2020](#source-lv2020), §3.5, proof of Proposition 3.4, p. 20; [lv2020](#source-lv2020), §1.3, p. 4. Uses: layer inputs; `LV.4.4`, `LV.1.4`, `LV.1.17`, `LV.3.17`.

Named milestones: Period-map finiteness criterion.

## LV.5 — Surfaces, mapping class groups and families of branched covers

Inputs for this layer: `GeometricTopology/1`, `AlgebraicTopology/4`, `AlgebraicTopology/6`, `TauCeti:TauCeti.CoveringSpace.monodromyEquivalence`, `UniversalCovers/2`, `AlgebraicTopology/2`, `AlgebraicTopology/8`, `Mathlib:FundamentalGroup.mul_def`, `AlgebraicTopology/1`, `Mathlib:IsCoveringMap.monodromyPerm`, `Mathlib:IsCoveringMap.liftHomotopy`, `TauCeti:TauCeti.LocalCoefficientSystem.monodromyRepresentation`. Dependencies within this roadmap are given at each target.

### Topological carriers, homology and curves

Build the topological surface before attaching its genus or homology. Polygon classification and cellular homology give handle and peripheral bases. The intersection radical remembers boundary and puncture classes, and disappears only in the stated closed or single-peripheral cases.

**LV.5.1 — Surfaces with boundary and punctures** (`LV.5/surface`). A surface is Σ∖P with Σ a compact connected oriented Hausdorff second-countable topological 2-manifold with boundary and P a finite interior set. Charts, topology and orientation are data; classification and homology are subsequent results.

The API should expose:

| Name | Mathematical contract |
| --- | --- |
| `Surface` | A surface as a punctured compact connected oriented 2-manifold with boundary. |
| `Surface.numPunctures` | The number n of punctures. |
| `Surface.cut` | The surface S_α obtained by cutting along a simple closed curve or proper arc, with its gluing map (GeometricTopology Layer 1). |
| `Surface.examples` | Closed surfaces, the thrice- and four-times-punctured spheres, the torus with one boundary circle. |

Unit tests:

- The compact annulus with P empty is a surface carrier with two boundary components.
- Removing one interior point from an oriented compact torus gives the once-punctured torus with its induced orientation.
- The real projective plane admits no orientation and is excluded.

Source: [lv2020](#source-lv2020), §8.1, p. 39; [farb-margalit](#source-farb-margalit), §1.1, p. 18. Uses: layer inputs.

**LV.5.2 — Classification of compact surfaces** (`LV.5/surface-classification`). Every closed connected orientable surface is homeomorphic to the connected sum of a sphere with g ≥ 0 tori, for a unique g; every compact connected orientable surface is obtained from a closed one by removing b ≥ 0 open disks with disjoint closures, and the pair (g, b) determines it up to homeomorphism. Consequently two surfaces (in the sense defined above) are homeomorphic by an orientation-preserving homeomorphism if and only if they have the same type (g, b, n).

Source: [farb-margalit](#source-farb-margalit), §1.1, Theorem 1.1, p. 18; [gallier-xu](#source-gallier-xu), Lemma 6.1 and Theorem 6.1, pp. 92–98; Appendix E, Theorem E.3, pp. 161–163. Uses: layer inputs; `LV.5.1`.

**LV.5.3 — Homology, type and intersection form of an oriented surface** (`LV.5/surface-homology`). For an oriented surface Σ ∖ P of type (g,b,n), χ = 2−2g−b−n. If b+n=0, H₁(−;ℤ) ≃ ℤ^(2g); otherwise H₁ ≃ ℤ^(2g+b+n−1). The intersection form has a standard unimodular symplectic rank-2g summand and a radical of rank max(b+n−1,0); in particular it is perfect when b+n≤1.

The API should expose:

| Name | Mathematical contract |
| --- | --- |
| `Surface.genus` | The genus g. |
| `Surface.numBoundary` | The number b of boundary circles. |
| `Surface.eulerChar_eq` | χ(S) = 2 − 2g − b − n, computed from singular homology. |
| `Surface.intersectionForm` | The algebraic intersection form î on H₁(S; ℤ), alternating. |
| `Surface.intersectionForm_perfect` | î is perfect when b + n ≤ 1. |

Source: [farb-margalit](#source-farb-margalit), §1.1, Theorem 1.1, p. 18. Uses: layer inputs; `LV.5.1`, `LV.5.2`.

**LV.5.4 — Oriented simple closed curves** (`LV.5/simple-closed-curve`). An oriented simple curve is an embedding S¹→int(S), modulo ambient isotopy and oriented reparameterization, with the induced integral homology class. It separates when its complement disconnects. Essentiality and nonperipherality are separate predicates.

The API should expose:

| Name | Mathematical contract |
| --- | --- |
| `SimpleClosedCurve` | The oriented embedding/isotopy quotient, without an essentialness condition. |
| `SimpleClosedCurve.homologyClass` | The induced oriented integral H₁ class. |
| `SimpleClosedCurve.IsSeparating` | The complement of the image is disconnected. |
| `SimpleClosedCurve.reverse` | Reverse the parameter orientation; the homology class changes sign and separation is unchanged. |
| `SimpleClosedCurve.map` | Map by an orientation-preserving homeomorphism, compatibly with H₁ and separation. |
| `SimpleClosedCurve.cut` | Use the topological collar to cut along the image, recording its boundary and gluing data. |

Unit tests:

- A horizontal circle on the oriented torus is nonseparating and represents a primitive H₁ class.
- The boundary of a small disk is a separating simple closed curve with homology class zero; it is inessential, not excluded from the carrier.
- A figure-eight immersion is not an embedding and does not define a simple closed curve.

Source: [lv2020](#source-lv2020), §8.3, p. 42. Uses: layer inputs; `LV.5.1`, `LV.5.3`.

**LV.5.5 — Change of coordinates for simple closed curves** (`LV.5/change-of-coordinates`). On an oriented surface, boundary- and puncture-fixing orientation-preserving homeomorphisms act transitively on nonseparating curves, and on ordered curve pairs meeting once with a prescribed oriented intersection sign. Every nonseparating curve has such a partner. On a closed genus-g surface, geometric symplectic curve bases exist and all are related by homeomorphisms.

Source: [farb-margalit](#source-farb-margalit), §1.3.2, printed p. 40 (PDF p. 50). Uses: layer inputs; `LV.5.2`, `LV.5.6`, `LV.5.4`.

### Mapping classes, twists and point-pushing

The isotopy quotient fixes boundary circles pointwise and permits permutation of unmarked punctures. Annular twists give the integral transvection formula. Point-pushing is constructed by isotopy extension with the pinned multiplication convention, and the Birman sequence relates it to the forgetful map.

**LV.5.6 — The mapping class group** (`LV.5/mapping-class-group`). Mod(S) is the isotopy quotient of orientation-preserving homeomorphisms fixing ∂S pointwise, with boundary-fixed isotopies; unmarked punctures may be permuted. Mod(S*) fixes an additional interior mark x. The quotient acts on integral H₁ preserving intersection, on curve isotopy classes and through Out(π₁S) on finite-cover classes.

The API should expose:

| Name | Mathematical contract |
| --- | --- |
| `MappingClassGroup` | Mod(S) = Homeo⁺(S, ∂S)/isotopy rel ∂S. |
| `MappingClassGroup.marked` | Mod(S*) for a marked interior point x. |
| `MappingClassGroup.homologyRep` | Ψ : Mod(S) → Aut(H₁(S; ℤ), î). |
| `MappingClassGroup.actCurves` | The action on isotopy classes of simple closed curves. |
| `MappingClassGroup.actCovers` | The action on isomorphism classes of finite coverings of S via Out(π₁ S). |
| `MappingClassGroup.forget` | Forget : Mod(S*) → Mod(S), filling in the marked point; surjective. |
| `MappingClassGroup.examples` | Mod(D²) = 1 (Alexander lemma) and Mod(annulus) = ℤ. |

Unit tests:

- The boundary-fixed mapping class group of a disk is trivial.
- The boundary-fixed mapping class group of an annulus is ℤ, with its Dehn twist corresponding to 1.
- The mapping class group of the three-punctured sphere allowing permutations is Sym(3); its pure subgroup is trivial. These two groups must not be identified.

Source: [farb-margalit](#source-farb-margalit), §2.1, printed p. 46 (PDF p. 56); [farb-margalit](#source-farb-margalit), §1.3.2, printed p. 40 (PDF p. 50). Uses: layer inputs; `LV.5.1`, `LV.5.2`, `LV.5.3`.

**LV.5.7 — Dehn twists** (`LV.5/dehn-twist`). A positive annular twist (θ,t)↦(θ+2πt,t), extended by identity, defines T_a∈Mod(S) for a simple-curve isotopy class a. Its class is independent of the annulus, conjugates under homeomorphisms, commutes with twists on disjoint curves and is trivial for disk- or once-punctured-disk boundaries.

The API should expose:

| Name | Mathematical contract |
| --- | --- |
| `dehnTwist` | T_a ∈ Mod(S) for an isotopy class a of simple closed curves. |
| `dehnTwist_conj` | f T_a f⁻¹ = T_{f(a)}. |
| `dehnTwist_commute` | T_a T_b = T_b T_a when a and b are disjoint. |
| `dehnTwist_eq_one` | T_a = 1 if a bounds a disk or a once-punctured disk. |
| `dehnTwist_support` | T_α is supported in any prescribed regular neighbourhood of α. |
| `multitwist` | ∏ T_{e_i}^{m_i} for pairwise disjoint curves e_i. |
| `dehnTwist_torus` | The twists about the two standard curves of the torus. |

Unit tests:

- A twist about a curve bounding a disk or a once-punctured disk is identity in Mod(S).
- A twist about the core of the annulus is not identity when both boundary circles are fixed pointwise.
- For f orientation-preserving, T_{f(a)}=f T_a f⁻¹, whereas reversing the surface orientation changes the twist direction.

Source: [farb-margalit](#source-farb-margalit), §3.1.1, p. 68. Uses: layer inputs; `LV.5.6`, `LV.5.1`, `LV.5.3`, `LV.5.4`.

**LV.5.8 — Action of Dehn twists and multitwists on homology** (`LV.5/dehn-twist-homology`). Let S be a surface and b an oriented simple closed curve. For every x ∈ H₁(S; ℤ) and k ∈ ℤ, Ψ(T_b^k)(x) = x + k·î(x, b)·[b]. Consequently, for pairwise disjoint oriented simple closed curves e_1, …, e_r and integers m_i, the multitwist ∏ T_{e_i}^{m_i} acts by x ↦ x + Σ_i m_i î(x, e_i)[e_i]; in particular it is unipotent, and it is the identity on the î-orthogonal of span{[e_i]}.

Source: [farb-margalit](#source-farb-margalit), §6.3, Proposition 6.3, p. 176. Uses: layer inputs; `LV.5.7`, `LV.5.1`, `LV.5.5`, `LV.5.3`, `LV.5.4`.

**LV.5.9 — Primitive homology classes are represented by simple closed curves** (`LV.5/primitive-classes-simple`). Let g ≥ 1. A nonzero class of H₁(S_g; ℤ) is represented by an oriented simple closed curve if and only if it is primitive; a simple closed curve is nonseparating if and only if its class is nonzero, and then its class is primitive. The same holds on a closed surface with one puncture or with one boundary circle (where H₁ is identified with that of the closed surface), and every class of H₁ is a sum of classes of simple closed curves.

Source: [farb-margalit](#source-farb-margalit), §6.2, Proposition 6.2, p. 173. Uses: layer inputs; `LV.5.5`, `LV.5.8`, `LV.5.1`, `LV.5.3`, `LV.5.4`.

**LV.5.10 — The point-pushing homomorphism** (`LV.5/point-push`). Extend a based loop α of an interior mark x to a boundary-fixed isotopy φ_t, and set Push(α)=[φ₁]∈Mod(S*). This is homotopy invariant and gives a homomorphism with the pinned path convention. Its image lies in ker Forget and its π₁ action is conjugation by α.

The API should expose:

| Name | Mathematical contract |
| --- | --- |
| `pointPush` | Push : π₁(S, x) →* Mod(S*). |
| `pointPush_apply` | Push(α) is the class of the end map of any isotopy extending the motion of x along α. |
| `forget_pointPush` | Forget (Push α) = 1. |
| `pointPush_action` | With Mathlib multiplication p*q=q.trans p, endpoint point-pushing acts on based loops by γ ↦ α*γ*α⁻¹; equivalently the path α⁻¹ followed by γ followed by α. |
| `pointPush_homology` | Push(α) acts trivially on H₁(S) and on H₁(S ∖ {x}) when S is closed. |
| `pointPush_torus` | On the torus Push is trivial. |

Unit tests:

- The constant loop pushes to identity.
- Every loop on the torus pushes to identity in its once-marked mapping class group, using the translation isotopy.
- On a closed genus-two surface, pushing a nontrivial simple loop gives a nontrivial mapping class in the forgetful kernel, although its action on H₁ is identity.

Source: [farb-margalit](#source-farb-margalit), §4.2, Theorem 4.6, p. 102. Uses: layer inputs; `LV.5.6`, `LV.5.7`.

**LV.5.11 — The Birman exact sequence and pushes of simple loops** (`LV.5/birman-exact-sequence`). Let S be a surface with χ(S) < 0 and x an interior point. Then 1 → π₁(S, x) → Mod(S*) → Mod(S) → 1 (Push, then Forget) is exact. For a simple loop α at x, Push([α]) = T_a T_b⁻¹, where a and b are the simple closed curves in S ∖ {x} obtained by pushing α off itself to the left and to the right; a and b are nonseparating in S ∖ {x} if and only if α is nonseparating in S.

Source: [farb-margalit](#source-farb-margalit), §4.2, Theorem 4.6, p. 102; [farb-margalit](#source-farb-margalit), §4.2, Fact 4.7, p. 103; [farb-margalit](#source-farb-margalit), §4.2, p. 104. Uses: layer inputs; `LV.5.10`, `LV.5.6`, `LV.5.7`.

**LV.5.12 — Capping boundary circles and forgetting points are surjective on mapping class groups** (`LV.5/capping-surjective`). Let S be a surface and S' the surface obtained by capping a boundary circle β with a once-marked disk. Then 1 → ⟨T_β⟩ → Mod(S) → Mod(S', p) → 1 is exact (Mod(S', p) fixing the marked point p). Consequently, capping all boundary circles with disks induces a surjection Mod(S) → Mod(Ŝ) onto the mapping class group of the capped surface, compatible with the maps on H₁.

Source: [farb-margalit](#source-farb-margalit), §3.6.2, Proposition 3.19, p. 89. Uses: layer inputs; `LV.5.6`, `LV.5.11`.

**LV.5.13 — Surjectivity of the symplectic representation** (`LV.5/symplectic-representation-surjective`). For g ≥ 1 the symplectic representation Ψ : Mod(S_g) → Sp(2g, ℤ) is surjective.

Source: [farb-margalit](#source-farb-margalit), §6.3, Theorem 6.4, p. 177. Uses: layer inputs; `LV.5.8`, `LV.5.9`, `LV.5.5`.

### Configurations and lifted twists

The two-point configuration fibration describes a moving branch point. Its normal fibre subgroup carries the peripheral conjugacy class. Covering-space lifting then realizes monodromy by lifts of point-pushes, with uniqueness governed by the deck centralizer.

**LV.5.14 — The configuration fibration of a surface and its fundamental groups** (`LV.5/fadell-neuwirth-sequence`). For connected oriented boundaryless S, projection F(S)→S onto the second coordinate is a locally trivial bundle with fibre S∖{y}. The π₁ sequence π₁(S∖{y₀})→π₁F(S)→π₁S→1 is exact, and configuration conjugation preserves the peripheral conjugacy class. For closed genus g≥1 the first map is injective; the punctured group is free on 2g handle generators with peripheral product of commutators, and H₁(S∖{y₀})→H₁S is an isomorphism.

Source: [lv2020](#source-lv2020), §7.3, proof of Lemma 7.4, p. 38; [lv2020](#source-lv2020), §5, p. 26. Uses: layer inputs; `LV.5.2`, `LV.5.1`, `LV.5.3`.

**LV.5.15 — Lifting powers of Dehn twists to finite coverings** (`LV.5/covering-dehn-twist-lift`). For a connected finite surface cover, let Cov(e) have order n_e and cycle lengths d₁,…,d_k over a simple curve e. Its lifts e_i have degrees d_i and ∏_iT_{e_i}^{n_e/d_i} lifts T_e^{n_e}. A trivial monodromy centralizer makes this lift unique. The same formula extends over compactified branched covers for twists away from punctures.

Source: [lv2020](#source-lv2020), §8.3, p. 42. Uses: layer inputs; `LV.5.7`, `LV.5.6`, `LV.5.4`.

**LV.5.16 — Monodromy of families of branched covers over configuration spaces** (`LV.5/configuration-family-monodromy`). For closed oriented Σ, finite B and S=Σ∖B with χ(S)≤−1, a finite cover of F(S) compactifies fibrewise to a locally trivial bundle over S. Along γ∈π₁(S,y₀), its monodromy is a lift of the marked homeomorphism representing Push(γ), fixing B∪{y₀}. Thus its integral H₁ action is lifted point-pushing. A trivial deck centralizer makes the lift unique; generally choices differ by deck transformations.

Source: [lv2020](#source-lv2020), §8.2.3, p. 41; [farb-margalit](#source-farb-margalit), §4.2, Theorem 4.6, p. 102. Uses: layer inputs; `LV.5.14`, `LV.5.11`, `LV.5.15`.

Named milestones: Surface, Mapping class group, Dehn twist, Point-pushing map.

## LV.6 — The S-unit theorem

Inputs for this layer: `Mathlib:Set.integer`, `Mathlib:Set.unit`, `FaltingsFinitenessAndIsogenyTheorems:R28.1/hermite-minkowski-finiteness-of-extensions-unramified-outside-S`, `Mathlib:isCyclic_of_isSplittingField_X_pow_sub_C`, `Mathlib:autEquivZmod`, `Mathlib:autEquivRootsOfUnity`, `Mathlib:StandardEtalePair`, `Mathlib:Polynomial.separable_X_pow_sub_C_unit`, `LocalFieldsRamification/2`, `TauCeti:NumberField.artinSymbol`, `TauCeti:NumberField.exists_isArithFrobAt`, `TauCeti:NumberField.Chebotarev.frobeniusPrimeSet`, `Chebotarev/10`, `AbelianSchemesAndArithmeticModuli:A1`, `AbelianSchemesAndArithmeticModuli:A2`, `AbelianSchemesAndArithmeticModuli:A4`, `Mathlib:WeierstrassCurve`, `Mathlib:WeierstrassCurve.IsElliptic`, `Mathlib:WeierstrassCurve.j`, `AbelianSchemesAndArithmeticModuli:A5`, `ComplexComparisonPartII:C5`, `TauCeti:LinearMap.GeneralLinearGroup.IsUnipotent`, `ReductiveGroups/3`, `ReductiveGroups/6`, `UniversalCovers/2`, `PadicHodgeTheory:R06.2`, `WeightsInEtaleCohomology:R34.1`, `ComplexComparisonPartII:C4`. Dependencies within this roadmap are given at each target.

### Arithmetic reductions and the cyclic Legendre family

Adjoin eighth roots of unity and reduce to nonsquares. The associated Kummer extensions have fixed cyclic degree and are unramified outside a fixed set. An inert auxiliary place turns each such extension into one large local field factor of the Legendre variant.

**LV.6.1 — Reductions for the S-unit equation** (`LV.6/s-unit-reductions`). Let U(K,S)={t∈𝒪_Sˣ:1−t∈𝒪_Sˣ}. Finite extension and enlargement above S embed this set into U(K′,S′), so assume μ₈⊆K and 2 inverted. If m≥8 is the largest power of two dividing |μ(K)| and U₁ is the nonsquare subset, then U⊆⋃_{0≤j≤log₂m}{s^{2^j}:s∈U₁}. Finiteness of U₁ implies finiteness of U.

Source: [lv2020](#source-lv2020), §4.1, p. 20. Uses: layer inputs.

**LV.6.2 — The Kummer fields of non-square S-unit solutions** (`LV.6/kummer-cyclic-field`). Assume μ₈⊆K, let m≥8 be the largest power of two dividing |μ(K)|, and let S contain the places above 2. Use the nonsquare set U₁ from LV.6.1. For t ∈ U₁: (a) the class of t in K^×/K^{×m} has order exactly m; (b) X^m − t is irreducible over K and L_t := K[X]/(X^m − t) is a cyclic extension of K of degree m, unramified at every finite place outside S; (c) the fields L_t (t ∈ U₁) fall into finitely many isomorphism classes, so U₁ = U_{1,L_1} ∪ ⋯ ∪ U_{1,L_r} with U_{1,L} := {t ∈ U₁ : L_t ≅ L}.

Source: [lv2020](#source-lv2020), §4.1, pp. 20–21; [lv2020](#source-lv2020), §4.1, p. 21. Uses: layer inputs; `LV.6.1`.

**LV.6.3 — An auxiliary place inert in a cyclic extension** (`LV.6/inert-auxiliary-place`). Let L/K be a cyclic extension of number fields, S a finite set of places of K and T a finite set of places. There is a finite place v ∉ S ∪ T, unramified in L, whose Frobenius generates Gal(L/K), whose residue characteristic p is odd, unramified in K and not below any place of S. For such v, L ⊗_K K_v is a field, unramified of degree [L : K] over K_v, and K_v/ℚ_p is unramified.

Source: [lv2020](#source-lv2020), §4.1, p. 21. Uses: layer inputs.

**LV.6.4 — The Legendre family and its cyclic variant** (`LV.6/legendre-family`). Over a ring 𝒪 with 2 invertible, use Y=Spec𝒪[t,1/(t(1−t))] and y²=x(x−1)(x−t). Its unit discriminant 16t²(t−1)² makes it an elliptic abelian scheme, with j=2⁸(t²−t+1)³/(t²(t−1)²). For m a power of two, Y′=Spec𝒪[u,1/(u(1−u^m))]→Y, t=u^m, is finite étale of degree m. Use the Legendre curve with parameter u over Y′. This is a good abelian-by-finite model over 𝒪_S with 2 inverted; at t₀ its algebra is K[u]/(u^m−t₀) and its geometric fibres are the curves E_u for u^m=t₀.

The API should expose:

| Name | Mathematical contract |
| --- | --- |
| `legendreCurve` | The Weierstrass curve y² = x(x − 1)(x − t) over 𝒪[t, 1/(t(1−t))]. |
| `legendreCurve.isElliptic` | Its discriminant 16t²(t − 1)² is a unit when 2 is. |
| `legendreCurve.j_eq` | j = 2⁸(t² − t + 1)³/(t²(t − 1)²). |
| `legendreVariant` | The abelian-by-finite family X → 𝒴' → 𝒴 with π(u) = u^m. |
| `legendreVariant.isGoodModel` | It is a good model over 𝒪_S when S contains the places above 2. |
| `legendreVariant.fibreAlgebra` | E_{t₀} = K[u]/(u^m − t₀). |
| `legendreVariant.analytic` | Over ℂ, the total space of X over 𝒴'(ℂ) = ℂ ∖ ({0} ∪ μ_m) is the restriction of the Legendre family over ℂ ∖ {0, 1}. |
| `legendreCurve.j_one_seven_two_eight` | j(−1) = j(2) = j(1/2) = 1728. |

Unit tests:

- The Legendre coefficients have Δ=16t²(t−1)² and j=256(t²−t+1)³/(t²(t−1)²).
- For m=2, t₀=4 over ℚ, the finite étale fibre algebra is ℚ×ℚ and the two curves are E₂ and E_{−2}.
- At t=0 or t=1, Δ=0, so the Legendre equation does not define an elliptic fibre.

Source: [lv2020](#source-lv2020), §4.2, p. 21. Uses: layer inputs; `LV.2.1`, `LV.2.2`.

### Monodromy, generic simplicity and the S-unit conclusion

The puncture loops give nontrivial powers of transvections. For the variant, surjective factor projections and isolated factor unipotents force full product monodromy. A rank-one subrepresentation and the sum of Hodge weights control exceptional reducible fibres. Apply LV.4 to the remaining fibres and sum over finitely many residue classes.

**LV.6.5 — Monodromy of the Legendre family** (`LV.6/legendre-monodromy`). At λ₀∈(0,1), let γ₀,γ₁ be positive loops reached along the real interval around 0,1 in ℂ∖{0,1}. There are integral a,b with î(a,b)=±1 and loop actions ε₀T_a^{2s₀}, ε₁T_b^{2s₁}, ε_i,s_i∈{±1}, using T_c(x)=x+î(x,c)c. Squaring gives nontrivial T_a^{4s₀},T_b^{4s₁}. The algebraic closure is SL₂=Sp₂, also for every subgroup containing positive powers of both loops.

Source: [lv2020](#source-lv2020), §4.4, proof of Lemma 4.3, p. 24; [farb-margalit](#source-farb-margalit), §4.2, Fact 4.7, p. 103. Uses: layer inputs; `LV.6.4`, `LV.5.16`, `LV.5.11`, `LV.5.15`, `LV.5.8`, `LV.5.9`, `LV.0.14`, `LV.0.15`, `LV.3.10`.

**LV.6.6 — A closed subgroup of a product of SL₂'s with surjective projections and factorwise unipotents is everything** (`LV.6/closed-subgroup-with-factor-unipotents`). Let k be an algebraically closed field of characteristic zero, V_1, …, V_r two-dimensional k-vector spaces and H ⊆ ∏_j SL(V_j) a Zariski-closed subgroup such that (i) each projection pr_j(H) is SL(V_j), and (ii) for each j, H contains an element whose j-th component is a nontrivial unipotent and whose other components are 1. Then H = ∏_j SL(V_j).

Source: [lv2020](#source-lv2020), §4.4, proof of Lemma 4.3, p. 24. Uses: layer inputs.

**LV.6.7 — Big monodromy for the cyclic variant of the Legendre family** (`LV.6/variant-family-full-monodromy`). For every m ≥ 1, the family over ℂ ∖ {0, 1} whose fibre over t is ⊔_{z^m = t} E_z (the analytification of X → Y' → Y of the Legendre variant) has full monodromy: for t₀ ∈ ℂ ∖ {0, 1}, the Zariski closure of the monodromy on ⊕_{z^m = t₀} H¹_B(E_z, ℚ) contains ∏_z SL(H¹_B(E_z, ℂ)).

Source: [lv2020](#source-lv2020), §4.3, Lemma 4.3, p. 21; [lv2020](#source-lv2020), §4.4, proof of Lemma 4.3, p. 24. Uses: layer inputs; `LV.6.5`, `LV.6.6`, `LV.6.4`, `LV.3.10`.

**LV.6.8 — Generic simplicity of the Legendre curves** (`LV.6/legendre-generic-simplicity`). Let L be a number field and p > 2 a prime unramified in L. There are only finitely many z ∈ L such that z and 1 − z are units at every place of L above p and H¹_et(E_{z, L̄}, ℚ_p) (equivalently V_p(E_z)) is reducible as a G_L-representation.

Source: [lv2020](#source-lv2020), §4.3, Lemma 4.4, p. 22; [lv2020](#source-lv2020), §4.4, proof of Lemma 4.4, p. 24. Uses: layer inputs; `LV.6.4`, `LV.6.5`, `LV.1.16`, `LV.1.7`, `LV.1.17`, `LV.4.1`, `LV.3.11`, `LV.3.19`, `LV.2.9`.

**LV.6.9 — Finiteness in a residue disk** (`LV.6/s-unit-residue-disk-finite`). Assume μ_8 ⊆ K and that S contains the places above 2; let m be the 2-part of #μ(K), L a cyclic extension of K of degree m, v a finite place as in the auxiliary-place lemma (v ∉ S, Frob_v generates Gal(L/K), p = char k_v odd and unramified in K, no place of S above p), and t₀ ∈ 𝒪_S. Then {t ∈ U_{1,L} : t ≡ t₀ mod v} is finite.

Source: [lv2020](#source-lv2020), §4.1, Lemma 4.2, p. 21; [lv2020](#source-lv2020), §4.3, proof of Lemma 4.2, p. 22; [lv2020](#source-lv2020), §4.3, proof of Lemma 4.2, p. 23. Uses: layer inputs; `LV.6.8`, `LV.6.7`, `LV.6.4`, `LV.6.2`, `LV.6.3`, `LV.4.4`, `LV.1.4`, `LV.1.17`, `LV.0.5`.

**LV.6.10 — The S-unit theorem** (`LV.6/s-unit-theorem`). For a number field K and a finite set S of places containing the archimedean ones, U(K, S) := {t ∈ 𝒪_S^× : 1 − t ∈ 𝒪_S^×} is finite.

Source: [lv2020](#source-lv2020), §4, Theorem 4.1, p. 20; [lv2020](#source-lv2020), §4, p. 20. Uses: layer inputs; `LV.6.1`, `LV.6.2`, `LV.6.3`, `LV.6.9`.

Named milestones: Legendre family, Full monodromy of the cyclic Legendre family, Generic simplicity of Legendre curves, S-unit theorem.

## LV.7 — Rational points on the base of an abelian-by-finite family

Inputs for this layer: `Mathlib:IsArithFrobAt`, `TauCeti:NumberField.exists_isArithFrobAt`, `LocalFieldsRamification/2`, `AlgebraicModuliForArithmeticGeometry:R09.1`, `SchemeAndStackFoundations:SF.0`, `PadicHodgeTheory:R06.2`, `WeightsInEtaleCohomology:R34.1`, `ComplexComparisonPartII:C4`, `FaltingsFinitenessAndIsogenyTheorems:R28.1/hermite-minkowski-finiteness-of-extensions-unramified-outside-S`, `NeronModelsAndSemistableAbelianVarieties:R11.5`. Dependencies within this roadmap are given at each target.

### Large local factors and general position

The small-orbit proportion is weighted by geometric points, equivalently by local degrees. General position for at least five Lagrangians gives a proper bad locus for a Frobenius-stable proper subspace meeting every Hodge filtration in at least half its dimension.

**LV.7.1 — The proportion of small Frobenius orbits** (`LV.7/size-v`). For a nonempty finite continuous G_K-set E unramified at v, define size_v(E) as the fraction of points in arithmetic Frobenius orbits of length <8. This is independent of Frobenius representative; for finite étale Z use E=Z(K̄). An equivariant map with constant fibre size satisfies size_v(E)≤size_v(E′).

The API should expose:

| Name | Mathematical contract |
| --- | --- |
| `sizeV` | size_v(E) ∈ ℚ for a nonempty finite G_K-set unramified at v. |
| `sizeV_indep` | Independence of the place above v and of the Frobenius. |
| `sizeV_le_of_fibres` | size_v(E) ≤ size_v(E') for an equivariant map with fibres of constant cardinality. |
| `sizeV_mem_Icc` | 0 ≤ size_v(E) ≤ 1. |
| `sizeV_scheme` | size_v of a finite étale K-scheme through its K̄-points. |
| `sizeV_eq_places` | For Z = Spec E with E finite étale and unramified at v: size_v(Z) = Σ_{[E_w : K_v] < 8} [E_w : K_v] / [E : K], the sum over the factors E_w of E ⊗_K K_v. |
| `sizeV_cycle` | A single k-cycle: size 1 if k < 8, else 0. |

Unit tests:

- A single 7-cycle has size_v=1; a single 8-cycle has size_v=0.
- A disjoint union of one fixed point and one 8-cycle has size_v=1/9, not 1/2.
- An 8-cycle mapping to a singleton is equivariant with constant fibre size and gives 0≤1 in the monotonicity inequality.

Source: [lv2020](#source-lv2020), §5, Definition 5.2, p. 25; [lv2020](#source-lv2020), §5, (5.3), p. 25. Uses: layer inputs.

**LV.7.2 — Frobenius orbits on geometric points are the places above v** (`LV.7/frobenius-orbits-places`). Let E be a finite étale K-algebra unramified at the finite place v, and fix a place v̄ of K̄ above v. The ⟨Frob_v⟩-orbits on Hom_K(E, K̄) are in bijection with the factors E_w of E ⊗_K K_v (the pairs (i, w) with E = ∏ E_i and w a place of E_i above v), the orbit of (i, w) having [E_w : K_v] elements; in particular Σ_w [E_w : K_v] = [E : K].

Source: [lv2020](#source-lv2020), §6, proof of Lemma 6.1, p. 32; [lv2020](#source-lv2020), §6, (6.1), p. 30. Uses: layer inputs; `LV.0.1`.

**LV.7.3 — General position for tuples of Lagrangians** (`LV.7/lagrangian-general-position`). Let (V, ω) be a symplectic space of dimension 2d ≥ 2 over a field k of characteristic zero and r ≥ 5. Let E_r ⊆ LGr(V, ω)^r be the set of tuples (F_1, …, F_r) of Lagrangians (over k̄) for which some subspace 0 ≠ W ≠ V satisfies dim(F_j ∩ W) ≥ dim(W)/2 for all j. Then E_r is Zariski closed and E_r ≠ LGr(V, ω)^r; in particular dim E_r < r·d(d+1)/2.

Source: [lv2020](#source-lv2020), §6, Lemma 6.4, p. 33; [lv2020](#source-lv2020), §6, proof of Lemma 6.4, p. 33; [lv2020](#source-lv2020), §6, proof of Lemma 6.4, p. 34. Uses: layer inputs; `LV.3.6`, `LV.3.7`, `LV.3.2`, `LV.3.1`, `LV.3.3`, `LV.3.4`, `LV.3.5`.

**LV.7.4 — Lagrangians meeting a Frobenius-stable subspace in half its dimension** (`LV.7/frobenius-stable-lagrangian-avoidance`). Let K_v be a field of characteristic zero, L_w/K_v a cyclic extension of degree r ≥ 5 with generator σ_w, (V, ω) a symplectic L_w-space of dimension 2d, and φ : V → V a bijective σ_w-semilinear map that is a similitude: ω(φx, φy) = c·σ_w(ω(x, y)) for some c ∈ K_v^×. Let H_w := LGr_{L_w}(V, ω), a K_v-variety of dimension r·d(d+1)/2. There is a Zariski-closed B_w ⊂ H_w with dim B_w < dim H_w such that every Lagrangian L_w-subspace F ∈ H_w(K_v) for which some φ-stable L_w-subspace 0 ≠ W ≠ V satisfies dim_{L_w}(F ∩ W) ≥ dim_{L_w}(W)/2 lies in B_w(K_v).

Source: [lv2020](#source-lv2020), §6, Lemma 6.3, p. 33; [lv2020](#source-lv2020), §6, proof of Lemma 6.3, p. 33. Uses: layer inputs; `LV.7.3`, `LV.3.9`, `LV.0.1`, `LV.2.11`.

### Purity, variation and rational-point finiteness

Choose minimal nonzero subrepresentations on bad fibres and average their Hodge weights over the places. The small-orbit inequality forces a large-degree factor meeting the half-dimensional threshold. Density and Strassmann make bad fibres finite; the centralizer estimate and global representation finiteness then handle the simple fibres.

**LV.7.5 — Bad points produce a Frobenius-stable subspace with large Hodge filtration (Sublemma in LV §6)** (`LV.7/generic-simplicity-sublemma`). In setting Q, let y ∈ Y(K) with size_v(π^{-1}(y)) < 1/(d + 1) be bad: for every (y', w) over (y, v) with [K(y')_w : K_v] ≥ 8, ρ_{y'} is not simple. Then some (y', w) over (y, v) with [K(y')_w : K_v] ≥ 8 has a φ-stable K(y')_w-subspace 0 ≠ W^dR ≠ H¹_dR(X_{y'}/K(y')_w) with dim F¹W^dR ≥ dim(W^dR)/2, where F¹W^dR = W^dR ∩ F¹. The relative dimension is positive (d≥1).

Source: [lv2020](#source-lv2020), §6, proof of Lemma 6.1, p. 31; [lv2020](#source-lv2020), §6, proof of Lemma 6.1, p. 32. Uses: layer inputs; `LV.7.1`, `LV.7.2`, `LV.1.16`, `LV.1.7`, `LV.1.17`, `LV.0.12`, `LV.4.1`.

**LV.7.6 — Generic simplicity along the family** (`LV.7/generic-simplicity-family`). In setting Q, let y₀ ∈ Y(K) with size_v(π^{-1}(y₀)) < 1/(d + 1) and Ω_v = Ω_v(y₀). There is a finite set F of points y ∈ Ω_v ∩ Y(K) with size_v(π^{-1}(y)) < 1/(d + 1) such that every other such y has a pair (y', w) over (y, v) with [K(y')_w : K_v] ≥ 8 and ρ_{y'} simple. The relative dimension is positive (d≥1).

Source: [lv2020](#source-lv2020), §6, Lemma 6.1, p. 30; [lv2020](#source-lv2020), §6, proof of Lemma 6.1, p. 32. Uses: layer inputs; `LV.7.5`, `LV.7.4`, `LV.4.2`, `LV.3.19`, `LV.3.17`, `LV.2.11`.

**LV.7.7 — Galois representations really vary in the family** (`LV.7/representations-vary`). In setting Q, let y₀ ∈ Y(K) and Ω_v = Ω_v(y₀). Fix a finite extension K'_v/K_v with [K'_v : K_v] ≥ 8 and a representation ρ₀ of G_{K'_v}. Only finitely many y ∈ Ω_v ∩ Y(K) admit a pair (y', w) over (y, v) with (K(y')_w, ρ_{y',w}) ≅ (K'_v, ρ₀). The relative dimension is positive (d≥1).

Source: [lv2020](#source-lv2020), §6, Lemma 6.2, p. 31. Uses: layer inputs; `LV.4.4`, `LV.3.17`, `LV.0.5`.

**LV.7.8 — Rational points on the base of an abelian-by-finite family** (`LV.7/proposition-5-3`). In setting Q, Y(K)* := {y ∈ Y(K) : size_v(π^{-1}(y)) < 1/(d + 1)} is finite. The relative dimension is positive (d≥1).

Source: [lv2020](#source-lv2020), §5, Proposition 5.3, p. 26; [lv2020](#source-lv2020), §6, p. 31. Uses: layer inputs; `LV.7.6`, `LV.7.7`, `LV.7.1`, `LV.1.4`, `LV.1.17`, `LV.2.2`, `LV.2.5`.

Named milestones: Proportion of small Frobenius orbits, Finiteness for abelian-by-finite families.

## LV.8 — Hurwitz spaces of singly ramified covers and the Kodaira–Parshin family

Inputs for this layer: `ComplexComparisonPartII:C4`, `ComplexComparisonPartII:C5`, `SchemeAndStackFoundations:SF.3`, `JacobianChallenge/B`, `AlgebraicCurves/12`, `ComplexComparisonPartII:C0`, `ComplexComparisonPartII:C2`, `InverseGaloisAndArithmeticFundamentalGroups:IG.3`, `TauCeti:TauCeti.CoveringSpace.monodromyEquivalence`, `Mathlib:AlgebraicGeometry.Scheme.Hom.normalization`, `Mathlib:CommAlgCat.FiniteEtale`, `UniversalCovers/2`, `InverseGaloisAndArithmeticFundamentalGroups:IG.0`, `InverseGaloisAndArithmeticFundamentalGroups:IG.1`, `Mathlib:CategoryTheory.PreGaloisCategory.IsFundamentalGroup`, `TauCeti:TauCeti.FiniteCoveringSpace.instProfiniteCompletionIsFundamentalGroup`, `SchemeAndStackFoundations:SF.0`, `AlgebraicModuliForArithmeticGeometry:A0-extension`, `AbelianSchemesAndArithmeticModuli:A1`, `AbelianSchemesAndArithmeticModuli:A2`, `JacobianChallenge/D`, `AbelianSchemesAndArithmeticModuli:A5`, `AlgebraicTopology/6`, `AlgebraicTopology/5`, `EtaleDualityAndPerverseSheaves:EDC.2`. Dependencies within this roadmap are given at each target.

### Surjections and the complex Hurwitz construction

The parameter fibre is a finite set of centre-free G-surjections modulo conjugacy. Extend the fibre-subgroup action uniquely to the configuration group, construct its covering, and compactify along the branch graph. The parameter cover may be disconnected; each relative curve fibre is connected.

**LV.8.1 — The complex points of a curve form a closed surface of the same genus** (`LV.8/curve-topological-genus`). Let Y be a smooth projective geometrically connected curve of genus g over a subfield K ⊆ ℂ. Then Y(ℂ) is a connected closed orientable surface of genus g; for y ∈ Y(ℂ), π₁(Y(ℂ) ∖ {y}) is free of rank 2g with the peripheral class as in LV.5, and H₁(Y(ℂ); ℤ) ≅ ℤ^{2g}.

Source: [lv2020](#source-lv2020), §5, p. 26. Uses: layer inputs; `LV.5.2`, `LV.5.14`.

**LV.8.2 — Surjections nontrivial on a peripheral class and their symmetries** (`LV.8/singly-ramified-surjections`). For a group Γ, centre-free finite G and conjugation-stable c⊆Γ, let S(Γ,c,G) consist of surjections nontrivial on every element of c, continuous in the profinite case. The commuting actions γ·φ=φ∘Ad(γ)⁻¹ and φ·h=Ad(h⁻¹)∘φ have free G-action and trivial Γ-action on S/G. The stabilizer in Γ×G^op is h⁻¹=φ(γ) and determines φ.

The API should expose:

| Name | Mathematical contract |
| --- | --- |
| `singlyRamifiedSurjections` | S(Γ, c, G) as a set of (continuous) surjective homomorphisms nontrivial on c. |
| `singlyRamifiedSurjections.actLeft` | The Γ-action γ·φ = φ ∘ Ad(γ)⁻¹. |
| `singlyRamifiedSurjections.actRight` | The G-action φ·h = Ad(h⁻¹) ∘ φ, free when Z(G) = 1. |
| `singlyRamifiedSurjections.quotient` | S(Γ, c, G)/G, the conjugacy classes, with trivial Γ-action. |
| `singlyRamifiedSurjections.stabilizer_eq` | Stab_{Γ × G^op}(φ) = {(γ, φ(γ)⁻¹)}. |
| `singlyRamifiedSurjections.comap` | For a surjection Γ → Γ̄ through which the Γ-action factors, S(Γ̄, c̄, G) = S(Γ, c, G). |
| `singlyRamifiedSurjections.aff3` | The Aff(3) count 810/135. |

Unit tests:

- For Γ free of rank 4, c its product-of-commutators peripheral class and G=Aff(3), |S|=810 and |S/G|=135.
- For c containing the identity, S is empty.
- If the target has nontrivial centre, its conjugation action on surjections is not free; that case is excluded from the free-action conclusion.

Source: [lv2020](#source-lv2020), §7.3, proof of Lemma 7.4, p. 38. Uses: layer inputs; `LV.0.8`, `LV.0.9`.

**LV.8.3 — Unique extension of the action to an overgroup** (`LV.8/surjection-action-extension`). In the setting of singly ramified surjections, let Γ̃ ⊇ Γ̄ be a group containing a normal subgroup Γ̄ through which the Γ-action on S = S(Γ, c, G) factors (via a surjection Γ → Γ̄ with image c̄ of c), and suppose conjugation by Γ̃ preserves c̄. Then every φ ∈ S factors through Γ̄, and γ̃·φ := φ ∘ Ad(γ̃)⁻¹|_{Γ̄} defines an action of Γ̃ on S commuting with G and extending the Γ̄-action. It is the only such action: any action of Γ̃ on S commuting with G and extending the Γ̄-action is given by this formula.

Source: [lv2020](#source-lv2020), §7.3, proof of Lemma 7.4, p. 38. Uses: layer inputs; `LV.8.2`.

**LV.8.4 — The complex Hurwitz space of G-covers branched at one point** (`LV.8/hurwitz-cover-complex`). Let Y/K⊂ℂ be smooth projective geometrically connected of genus ≥2 and G finite centre-free. The configuration-group extension of S(π₁(Y(ℂ)∖{y₀}),c,G) produces a G-cover of F(Y), whose quotient is pulled back from a finite parameter cover Y′→Y. Riemann existence algebraizes both. Normalize Y′×Y in the torsor to obtain smooth projective Z with finite G-map and smooth proper curve map Z→Y′. It is branched along the parameter graph, locally (z,w)↦(z,w^n). Each fibre is the connected G-cover classified by its parameter; Y′ itself may be disconnected or empty.

The API should expose:

| Name | Mathematical contract |
| --- | --- |
| `hurwitzComplex` | The complex curve Y' with e : Y' → Y and the G-covering Z → Y' × Y. |
| `hurwitzComplex.fibre` | e⁻¹(y) ≃ S(y) naturally in y. |
| `hurwitzComplex.torsor` | Z → Y' × Y is a G-torsor off the graph Γ_e. |
| `hurwitzComplex.localForm` | Near Γ_e, Z → Y' × Y is (z, w) ↦ (z, wⁿ). |
| `hurwitzComplex.relativeCurve` | Z → Y' is smooth and proper, with fibre Z_{y'} the G-cover branched at e(y'). |
| `hurwitzComplex.configuration` | Z° is the covering of the configuration space attached to S(Γ, c, G); its monodromy is described by LV.5. |
| `hurwitzComplex.aff3` | Degree 135 for Aff(3) and g = 2. |

Unit tests:

- For g=2 and G=Aff(3), Y′→Y has degree 135.
- For G=1 (centre-free), S is empty and Y′ is empty; no branched cover is manufactured.
- Off the graph of Y′→Y, the constructed map is a G-torsor; at the graph its local model is (z,w)↦(z,w^n) with n>1 for the nontrivial peripheral image.

Source: [lv2020](#source-lv2020), §7.3, p. 36; [lv2020](#source-lv2020), §7.3, p. 37; [sga1](#source-sga1), Exposé XII, Théorème 5.1, p. 251. Uses: layer inputs; `LV.8.3`, `LV.8.1`, `LV.5.14`.

### Arithmetic descent and reduced Pryms

The arithmetic outer action and peripheral inertia give the unique descended Hurwitz cover. Subgroup averaging in the rational group algebra singles out the reduced Prym summand. Its relative identity-component kernel and polarization compare with primitive homology of the degree-q quotient cover.

**LV.8.5 — Descent of the Hurwitz covering to K** (`LV.8/hurwitz-descent`). For the preceding Y and centre-free G, the complex Hurwitz G-cover of Y²∖Δ descends uniquely over K. Its G-quotient extends uniquely over Y² as Y′_K×Y→Y×Y for finite étale Y′_K→Y, recovering Y′ over ℂ. At rational y, the geometric étale-surjection quotient S(y), with its outer Galois action, identifies equivariantly with the parameter fibre.

Source: [lv2020](#source-lv2020), §7.3, Lemma 7.4, p. 37; [lv2020](#source-lv2020), §7.3, proof of Lemma 7.4, p. 38; [lv2020](#source-lv2020), §7.3, proof of Lemma 7.4, p. 39. Uses: layer inputs; `LV.8.3`, `LV.8.4`, `LV.5.14`.

**LV.8.6 — Hurwitz spaces of G-covers branched at one point** (`LV.8/hurwitz-space`). For smooth projective geometrically connected genus-≥2 Y/K⊂ℂ and centre-free finite G, construct finite étale Y′→Y and smooth proper Z→Y′ with G-map Z→Y′×Y. The geometric parameter fibre is the conjugacy quotient of peripheral-nontrivial geometric π₁-surjections, equivariantly for rational y. Away from the graph this map is a G-torsor; each curve fibre is connected and ramifies exactly over its parameter point. Y′ may be disconnected or empty.

Source: [lv2020](#source-lv2020), §7.1, Proposition 7.1, p. 34; [lv2020](#source-lv2020), §7.1, Proposition 7.1, p. 35; [lv2020](#source-lv2020), §7.3, p. 37. Uses: layer inputs; `LV.8.5`, `LV.8.4`.

**LV.8.7 — The idempotents e, e′ and e″ of ℚ[Aff(q)]** (`LV.8/affine-group-idempotents`). For a prime q ≥ 3, G = Aff(q) and H = H_q the stabilizer of 0, let e_H := (1/#H) Σ_{h∈H} h and e_G := (1/#G) Σ_{g∈G} g in ℚ[G], e := e_H − e_G, e' := 1 − e and e'' := #G·e' ∈ ℤ[G]. Then e_H, e_G, e, e' are idempotents, e_G e_H = e_H e_G = e_G, and all four are fixed by the anti-involution g ↦ g⁻¹. For every ℚ[G]-module M: e·M = M^H ∩ ker(e_G), which is a complement of M^G in M^H, and ker(e'' : M → M) = e·M.

Source: [lv2020](#source-lv2020), §7.2, p. 36. Uses: layer inputs; `LV.0.6`.

**LV.8.8 — The reduced relative Prym of a family of Aff(q)-covers** (`LV.8/reduced-prym`). For prime q≥3, reduced finite-type characteristic-zero B and a smooth proper geometrically connected curve Z/B with Aff(q)-action, put P=Pic⁰_{Z/B}. For the integral endomorphism e″ of the preceding idempotent construction, assume constant fibre kernel dimension. Then X=(ker e″)° is an abelian subscheme with restricted polarization and fibre (ker e″_b)°. The G-action may be taken by pushforward, since the averaging idempotents are invariant under inversion.

The API should expose:

| Name | Mathematical contract |
| --- | --- |
| `reducedPrym` | X := (ker e'')° ⊆ Pic⁰_{Z/B} for a relative curve with Aff(q)-action and constant kernel dimension. |
| `reducedPrym.isAbelianScheme` | X is an abelian scheme over B. |
| `reducedPrym.polarization` | The restriction of the principal polarization of Pic⁰. |
| `reducedPrym.fibre` | X_b = (ker e''_b)° for every point b. |
| `reducedPrym.baseChange` | Formation of X commutes with base change on B. |
| `reducedPrym.dim` | The relative dimension of X over a base whose complex fibres are singly ramified Aff(q)-covers of a genus-g curve is (2g − 1)(q − 1)/2. |
| `reducedPrym.example` | q = 3, g = 2: relative dimension 3. |

Unit tests:

- For singly branched Aff(3)-covers of a genus-two curve, the reduced Prym has dimension 3.
- If G acts trivially on Pic⁰, e=e_H−e_G=0, so e′′=|G| and the connected kernel is the zero abelian scheme.
- After base change to a geometric point b, the reduced Prym is (ker e′′_b)°, with the polarization restricted from Pic⁰; the polarization is not automatically principal.

Source: [lv2020](#source-lv2020), §7.2, p. 36; [lv2020](#source-lv2020), §7.2, p. 35. Uses: layer inputs; `LV.8.7`.

**LV.8.9 — Homology of the reduced Prym is the primitive homology of the degree-q cover** (`LV.8/reduced-prym-homology`). For a connected singly branched Aff(q)-Galois cover Z→Y of compact Riemann surfaces, with translation inertia and g(Y)=g, set C′=Z/H_q. Inside H₁(Pic⁰Z,ℚ)=H₁(Z,ℚ), the reduced Prym has H₁=eH₁(Z). Pushforward Z→C′ identifies it with H₁^Pr(C′,Y), scaling intersection by q−1. The restricted Riemann form agrees up to sign. Primitive dimension is (2g−1)(q−1), Prym dimension half that, naturally under G-compatible covering homeomorphisms.

Source: [lv2020](#source-lv2020), §8.2.3, p. 41; [lv2020](#source-lv2020), §7.2, p. 35. Uses: layer inputs; `LV.8.8`, `LV.8.7`, `LV.8.1`.

### The family and its finite arithmetic fibre map

For Aff(q), all these constructions assemble into a polarized abelian-by-finite family of dimension (2g−1)(q−1)/2. The linear-part map on surjections yields the finite-coefficient H¹ map with constant fibre cardinality used in the short-orbit bound.

**LV.8.10 — The Kodaira–Parshin family** (`LV.8/kodaira-parshin-family`). For smooth projective geometrically connected genus-g≥2 Y/K and prime q≥3, take its Aff(q) Hurwitz family and reduced Prym X_q→Y′_q→Y. It is abelian-by-finite of dimension d_q=(2g−1)(q−1)/2 and admits a proper-base good model after enlarging S. Above y∈Y(K), its finite parameter fibre is the G_K-set of affine-conjugacy classes of geometric peripheral-nontrivial surjections.

The API should expose:

| Name | Mathematical contract |
| --- | --- |
| `kodairaParshinCurves` | Z_q → Y'_q → Y. |
| `kodairaParshin` | X_q → Y'_q → Y as an abelian-by-finite family. |
| `kodairaParshin.relDim` | d_q = (g − 1/2)(q − 1), i.e. 2d_q = (2g − 1)(q − 1). |
| `kodairaParshin.exists_goodModel` | A good model over some 𝒪_S with 𝒴 proper. |
| `kodairaParshin.fibreEquiv` | π⁻¹(y)(K̄) ≃ conjugacy classes of surjections π₁^geom(Y ∖ y) → Aff(q) nontrivial at y, G_K-equivariantly for y ∈ Y(K). |
| `kodairaParshin.fibreHomology` | H₁(X_{q,y'}(ℂ), ℚ) ≅ H₁^Pr(Z_{q,y'} ×^{Aff(q)} 𝔽_q, Y(ℂ); ℚ). |
| `kodairaParshin.example` | q = 3, g = 2: d = 3, fibre of size 135. |

Unit tests:

- For g=2 and q=3, relative dimension is 3 and the parameter fibre has 135 points.
- For g=2 and q=107, relative dimension is 159.
- The associated degree-q curve and the Aff(q)-Galois curve have different degrees, q and q(q−1); the reduced Prym uses the degree-q quotient, not the full Prym of the Galois curve.

Source: [lv2020](#source-lv2020), §7.1, Definition 7.2, p. 35; [lv2020](#source-lv2020), §7.2, Definition 7.3, p. 36; [lv2020](#source-lv2020), §5, p. 26. Uses: layer inputs; `LV.8.6`, `LV.8.8`, `LV.8.9`, `LV.0.8`, `LV.2.1`, `LV.2.3`.

**LV.8.11 — The map from Kodaira–Parshin fibres to H¹(Y, ℤ/(q − 1))** (`LV.8/kodaira-parshin-fibre-map`). Let y ∈ Y(K), N = q − 1, and fix a generator of 𝔽_q^× to identify λ : Aff(q) → 𝔽_q^× with a surjection onto ℤ/N. Composition with λ defines a G_K-equivariant map ψ : π⁻¹(y)(K̄) → M := H¹_et(Y_{K̄}, ℤ/N) = Hom(π₁^geom(Y_{K̄}), ℤ/N). In coordinates given by a standard generating system of the free group π₁(Y(ℂ) ∖ {y}) (M ≅ (ℤ/N)^{2g}), the image Υ of ψ is the set of 2g-tuples whose entries generate ℤ/N, and every fibre of ψ over Υ has q^{2g−2} elements. In particular #π⁻¹(y) = q^{2g−2}·J_{2g}(N).

Source: [lv2020](#source-lv2020), §5, p. 26; [lv2020](#source-lv2020), §5, proof of Theorem 5.4, p. 27. Uses: layer inputs; `LV.8.10`, `LV.8.1`, `LV.0.9`, `LV.0.10`, `LV.0.8`.

Named milestones: Hurwitz cover, Hurwitz spaces of singly branched covers, Reduced relative Prym, Kodaira–Parshin family.

## LV.9 — Aff(q)-covers of surfaces: primitive homology, lifted monodromy and normal form

Inputs for this layer: `UniversalCovers/2`, `AlgebraicTopology/5`, `AlgebraicTopology/6`, `TauCeti:TauCeti.BilinForm.isometryGroup`, `AlgebraicTopology/4`, `GeometricTopology/1`, `AlgebraicTopology/1`, `Mathlib:Subgroup.closure_mul_image_eq`. Dependencies within this roadmap are given at each target.

### Covers, primitive homology and lifted monodromy

The compactified degree-q cover has a rational transfer complement. Deck-centrelessness makes stabilizing mapping classes lift uniquely. Intersecting the finitely many stabilizers gives a normal finite-index subgroup on which all primitive representations are defined.

**LV.9.1 — Aff(q)-covers and singly ramified Aff(q)-covers** (`LV.9/affine-cover`). For a surface with possible boundary and punctures, an Aff(q)-cover is connected of degree q with labelled monodromy image Aff(q), q≥3 prime. Its class Cov:π₁→Aff(q), up to affine conjugacy, classifies covers; free-loop cycle types are invariant. In C, peripheral nontriviality gives a q-cycle, one point over y and genus gq−(q−1)/2 after compactification. There are finitely many classes, acted on by Mod(Y∖{y}).

The API should expose:

| Name | Mathematical contract |
| --- | --- |
| `AffineCover` | An Aff(q)-cover of a surface with its monodromy class Cov. |
| `AffineCover.cov` | Cov : π₁(Y, y₀) → Aff(q) up to conjugacy. |
| `AffineCover.iso_iff` | Z₁ ≅ Z₂ over Y ↔ Cov₁ and Cov₂ are Aff(q)-conjugate. |
| `AffineCover.cycleType` | The cycle type of Cov(η), a partition of q, for loops η. |
| `SinglyRamified` | Singly ramified Aff(q)-covers of (Y, y) and their compactifications. |
| `SinglyRamified.genus` | g(Z) = gq − (q − 1)/2. |
| `SinglyRamified.finite` | Finitely many isomorphism classes Z_1, …, Z_N. |
| `SinglyRamified.modAction` | The action of Mod(Y ∖ {y}) on {Z_1, …, Z_N}. |
| `SinglyRamified.example` | q = 3, g = 2: N = 135, genus 5. |

Unit tests:

- For q=3 and g=2 there are 135 singly ramified isomorphism classes, each compactified source of genus 5.
- A connected cyclic degree-3 cover with monodromy C₃ is not an Aff(3)-cover, despite being transitive.
- A trivial disconnected degree-q covering is not an Aff(q)-cover.

Source: [lv2020](#source-lv2020), §8.2, p. 39. Uses: layer inputs; `LV.5.6`, `LV.5.14`, `LV.0.8`, `LV.0.7`.

**LV.9.2 — Primitive homology of a covering** (`LV.9/primitive-homology`). For a positive-degree finite possibly branched cover π:Z→Y of closed oriented surfaces, orientation-preserving away from branching, with possibly disconnected Z, set H₁^Pr(Z,Y)=ker(π_*:H₁(Z;ℚ)→H₁(Y;ℚ)). Use the existing linear-map kernel; transfer supplies its geometric comparisons.

The API should expose:

| Name | Mathematical contract |
| --- | --- |
| `primitiveHomology` | H₁^Pr(Z, Y) = ker(π_* : H₁(Z; ℚ) → H₁(Y; ℚ)). |
| `transfer` | π^* : H₁(Y; ℚ) → H₁(Z; ℚ) with π_*π^* = q. |
| `isCompl_primitiveHomology` | H₁(Z) = π^*H₁(Y) ⊕ H₁^Pr(Z, Y), with projection x ↦ x − q⁻¹π^*π_*x. |
| `primitiveHomology_eq_orthogonal` | H₁^Pr(Z, Y) = (π^*H₁(Y))^⊥. |
| `primitiveHomology.symplectic` | The restricted intersection form is nondegenerate and alternating. |
| `primitiveHomology.equivariant` | A lift of a homeomorphism of Y preserves π^*H₁(Y) and H₁^Pr. |
| `primitiveHomology.finrank` | dim H₁^Pr = 2g(Z) − 2g(Y). |
| `primitiveHomology.trivialCover` | The sum-zero subspace for a trivial cover. |

Unit tests:

- For the identity covering, primitive homology is zero and the primitive projection is zero.
- For the trivial disconnected double cover, primitive homology consists of pairs (x,−x), with intersection form twice the form on the base.
- For a singly ramified Aff(3)-cover of a genus-two surface, primitive homology has dimension 6, and the projection x↦x−(1/3)π*π_*x kills the transfer image.

Source: [lv2020](#source-lv2020), §8.2, p. 39; [lv2020](#source-lv2020), §8.2, pp. 39–40. Uses: layer inputs; `LV.9.1`.

**LV.9.3 — Transfer complement and symplectic primitive homology** (`LV.9/primitive-homology-decomposition`). For an orientation-preserving positive-degree q finite cover of closed oriented surfaces, possibly branched with disconnected source, rational transfer satisfies π_*π*=q, ⟨π*a,π*b⟩=q⟨a,b⟩ and ⟨π*a,x⟩=⟨a,π_*x⟩. Thus H₁Z=π*H₁Y⊕H₁^Pr(Z,Y) orthogonally; primitive projection is x−q⁻¹π*π_*x and its restricted form is symplectic. Covering homeomorphisms preserve the splitting.

Source: [lv2020](#source-lv2020), §8.2, p. 39; [lv2020](#source-lv2020), §8.2, pp. 39–40. Uses: layer inputs; `LV.9.1`, `LV.5.1`, `LV.5.3`, `LV.9.2`.

**LV.9.4 — Lifted mapping classes and the monodromy maps** (`LV.9/lifted-monodromy`). In C, the stabilizer Mod(Y∖{y})_Z lifts uniquely to Mod(Z) and acts symplectically on primitive homology, because the affine deck centralizer is trivial. Intersect all stabilizers to obtain normal finite-index Mod(Y∖{y})′ and Mon into ∏_iSp(H₁^Pr(Z_i,Y)). Its point-pushing inverse image π₁(Y,y)′ is normal finite index; Mon∘Push is defined there. A stabilizing point-push lift acts trivially on π*H₁(Y).

The API should expose:

| Name | Mathematical contract |
| --- | --- |
| `liftMappingClass` | Mod(Y ∖ {y})_Z →* Mod(Z), f ↦ f̃. |
| `liftMappingClass_unique` | f̃ is the only mapping class of Z covering f. |
| `monodromyMap` | Mon_Z : Mod(Y ∖ {y})_Z →* Sp(H₁^Pr(Z, Y)). |
| `stabilizerAll` | Mod(Y ∖ {y})' = ⋂ Mod(Y ∖ {y})_{Z_i}, normal of finite index. |
| `pushSubgroup` | π₁(Y, y)' = Push⁻¹(Mod(Y ∖ {y})'), normal of finite index. |
| `monodromyMap.prod` | Mon : Mod(Y ∖ {y})' → ∏_i Sp(H₁^Pr(Z_i, Y)). |
| `monodromyMap_push_transfer` | Lifts of point-pushes act trivially on π^*H₁(Y). |
| `monodromyMap_twist` | Mon_Z(T_e^{n_e}) is the multitwist ∏ T_{e_i}^{n_e/d_i} on homology. |
| `monodromyMap.example` | q = 3, g = 2: 135 factors. |

Unit tests:

- Lifting the identity gives the identity mapping class and identity linear monodromy.
- For q=3 and g=2, the product monodromy has 135 factors, each acting on a six-dimensional primitive space.
- The lift of a point-push acts trivially on the transfer summand π*H₁(Y), while it can act nontrivially on primitive homology.

Source: [lv2020](#source-lv2020), §8.2.1, p. 40; [lv2020](#source-lv2020), §8.2.2, p. 40. Uses: layer inputs; `LV.9.1`, `LV.9.2`, `LV.5.11`, `LV.5.15`, `LV.5.16`, `LV.0.8`, `LV.9.3`.

### Liftable curves and ranks of twists

For a nonseparating curve the independent preimage classes give rank k−1, where k is the number of affine permutation cycles. A generating linear part gives precisely two lifts and a single primitive transvection. Retain the negative exponent required by the order of the intersection pairing.

**LV.9.5 — Classes of the preimage circles** (`LV.9/preimage-classes-independent`). In setting C, let Z be a singly ramified Aff(q)-cover and e ⊂ Y ∖ {y} a nonseparating simple closed curve whose preimage consists of the circles e_1, …, e_k (of degrees d_i). Then [e_1], …, [e_k] are linearly independent in H₁(Z; ℚ); their span meets π^*H₁(Y) in ℚ·π^*[e] = ℚ·Σ_i[e_i], and its projection to H₁^Pr(Z, Y) has dimension k − 1. Consequently Mon_Z(T_e^{n_e}) − 1 has rank exactly k − 1 on H₁^Pr(Z, Y), and so does Mon_Z(T_e^{M}) − 1 for every positive multiple M of n_e.

Source: [lv2020](#source-lv2020), §8.3, Lemma 8.2, p. 42; [lv2020](#source-lv2020), §8.3, proof of Lemma 8.2, p. 42. Uses: layer inputs; `LV.9.4`, `LV.9.2`, `LV.5.15`, `LV.5.8`, `LV.5.5`, `LV.5.14`, `LV.5.4`, `LV.9.3`.

**LV.9.6 — The rank of a lifted twist detects the cycle type** (`LV.9/twist-rank-detects-cycle-type`). In setting C, let e ⊂ Y ∖ {y} be a nonseparating simple closed curve and M a positive multiple of n_e. Then the rank of Mon_Z(T_e^M) − 1 on H₁^Pr(Z, Y) equals k − 1, where k is the number of cycles of Cov(e), and k determines the cycle type of Cov(e): k = q for the identity, k = 1 for a q-cycle, and k = 1 + (q − 1)/r for an element with nontrivial linear part of order r.

Source: [lv2020](#source-lv2020), §8.3, Lemma 8.3, p. 42. Uses: layer inputs; `LV.9.5`, `LV.0.7`.

**LV.9.7 — Liftable curves and their transvections** (`LV.9/liftable-curve`). In C, a simple curve e⊂Y∖{y} is liftable for Z when λ(Cov(e)) generates 𝔽_qˣ.

The API should expose:

| Name | Mathematical contract |
| --- | --- |
| `IsLiftable` | λ(Cov(e)) generates 𝔽_q^×. |
| `IsLiftable.nonseparating` | Liftable curves are nonseparating. |
| `IsLiftable.liftPlus` | The degree-one lift e⁺. |
| `IsLiftable.primitiveClass` | ẽ ∈ H₁^Pr(Z, Y), nonzero. |
| `IsLiftable.mon_twist` | With ω equal to the topological intersection pairing, Mon_Z(T_e^{q−1}) = T_{ẽ}^{−q} in the LV.0 convention T_v^r(x)=x+rω(v,x)v. Equivalently the actual action is x↦x+qω(x,ẽ)ẽ. |
| `IsLiftable.inner_eq` | Ã·B̃ = A⁺·B⁺ − q⁻¹ A·B. |
| `IsLiftable.example` | Aff(3) and a reflection monodromy. |

Unit tests:

- For q=3, reflection monodromy x↦−x+b is liftable, with one degree-one lift and one degree-two lift.
- A nonzero translation has linear part 1 and is not liftable for q≥3.
- For a liftable curve e, T_e^(q−1) acts on primitive homology by x↦x+q·î(x,ẽ)ẽ; the exponent on the base twist is q−1, not q.

Source: [lv2020](#source-lv2020), §8.3, p. 42; [lv2020](#source-lv2020), §8.3, p. 43. Uses: layer inputs; `LV.9.1`, `LV.5.4`, `LV.0.7`.

**LV.9.8 — Liftable-curve monodromy and primitive intersection** (`LV.9/liftable-curve-transvection`). In setting C, a simple closed curve e ⊂ Y ∖ {y} is liftable for Z if λ(Cov(e)) generates 𝔽_q^×. Then e is nonseparating, Cov(e) has cycle type (1, q − 1), the preimage of e is e⁺ ⊔ e⁻ with e⁺ of degree 1 and e⁻ of degree q − 1, and ẽ := the projection of [e⁺] to H₁^Pr(Z, Y) is nonzero. Mon_Z(T_e^{q−1}) is the symplectic transvection x ↦ x + q⟨x, ẽ⟩ẽ of H₁^Pr(Z, Y), and for liftable curves A, B one has Ã·B̃ = A⁺·B⁺ − q⁻¹ A·B (LV (8.6)).

Source: [lv2020](#source-lv2020), §8.3, p. 42; [lv2020](#source-lv2020), §8.3, p. 43. Uses: layer inputs; `LV.9.5`, `LV.9.2`, `LV.9.4`, `LV.0.13`, `LV.0.7`, `LV.5.4`, `LV.9.3`, `LV.9.7`.

### Putting a cover in normal form

Integral symplectic realization on a two-boundary surface and a primitive integral lift first remove the linear-part monodromy from the spare handles. A second cut concentrates the translation monodromy on the torus piece. Explicit curves there supply the fixed-point labels and the spanning lifts used in the next layer.

**LV.9.9 — Mapping classes of a surface with two boundary circles realize Sp(V, b)** (`LV.9/boundary-fixing-symplectic-surjective`). For compact genus-h≥1 W with two boundary circles, H₁(W;ℤ) has rank 2h+1 and intersection radical ℤb. Mod(W) surjects onto form-preserving automorphisms fixing b. Hence it is transitive on relative classes ℓ∈H₁(W,∂W)≅Hom(H₁W,ℤ) with ℓ(b)=1, each represented by a simple joining arc. If simple-curve classes v,u satisfy ⟨v,u⟩=1, every v+kb, k∈ℤ, also has a simple representative.

Source: [lv2020](#source-lv2020), §8.4, Lemma 8.4, p. 44; [lv2020](#source-lv2020), §8.4, proof of Lemma 8.4, p. 44; [lv2020](#source-lv2020), §8.4, p. 44. Uses: layer inputs; `LV.5.12`, `LV.5.13`, `LV.5.8`, `LV.5.9`, `LV.5.5`.

**LV.9.10 — Primitive integral lift of a cyclic quotient** (`LV.9/primitive-integral-lift`). Let r≥2 and N≥1. Every surjective homomorphism ℤ^r → ℤ/N has a lift ℤ^r → ℤ that is surjective (a primitive integral covector).

Source: [lv2020](#source-lv2020), §8.4, p. 43. Uses: layer inputs.

**LV.9.11 — Normal form of a singly ramified Aff(q)-cover** (`LV.9/affine-cover-normal-form`). In C decompose Y into one-boundary genus-(g−1) S° and a one-boundary torus T° containing y. Arrange the cover trivial on S° and on the gluing boundary. For standard punctured-torus generators β₁,β₂ crossing the respective cutting curves once, conjugate Cov(β₁) to x↦cx with c generating 𝔽_qˣ and Cov(β₂) to x↦x+1. Cov then factors through collapse of S° to the capped punctured torus.

Source: [lv2020](#source-lv2020), §8.4, p. 43; [lv2020](#source-lv2020), §8.4, p. 45; [lv2020](#source-lv2020), §8.4, Proposition 8.5, p. 45. Uses: layer inputs; `LV.9.1`, `LV.9.9`, `LV.5.9`, `LV.5.1`, `LV.5.5`, `LV.5.14`, `LV.0.6`, `LV.5.3`, `LV.9.10`.

**LV.9.12 — Curves on the torus part of the normal form** (`LV.9/normal-form-curves`). In setting C, in the normal form, fix p ∈ ∂T°, a labelling of the fibre over p by 𝔽_q with Cov(β₁) = (x ↦ cx), Cov(β₂) = (x ↦ x + 1). There are simple closed curves γ_j (0 ≤ j ≤ q) on T° ∖ {y}, based at p and meeting ∂T° only at p, such that: (i) λ(Cov(γ_j)) = c for all j; (ii) Cov(γ_j) fixes exactly j modulo q (for j = q: fixes 0); (iii) the classes of the degree-one lifts γ_j⁺ span H₁ of the restricted cover T̃° modulo the homology of its boundary; (iv) all γ_j have the same germs at p.

Source: [lv2020](#source-lv2020), §8.6, Lemma 8.11, p. 48; [lv2020](#source-lv2020), §8.6, proof of Lemma 8.11, p. 49; [lv2020](#source-lv2020), §8.6, proof of Lemma 8.11, p. 50. Uses: layer inputs; `LV.9.11`, `LV.5.7`, `LV.5.15`, `LV.5.4`.

Named milestones: Affine cover, Primitive homology, Lifted monodromy, Liftable curve, Normal form of affine covers.

## LV.10 — The monodromy theorem for Kodaira–Parshin families

Inputs for this layer: `TauCeti:LinearMap.GeneralLinearGroup.IsUnipotent`, `AlgebraicTopology/1`, `AlgebraicTopology/3`, `TauCeti:TauCeti.Symplectic.geometricallyConnectedCommHopfAlgProperty_coordinateHopfAlgebra`, `ReductiveGroups/3`, `ReductiveGroups/6`, `AbelianSchemesAndArithmeticModuli:A5`, `ComplexComparisonPartII:C5`. Dependencies within this roadmap are given at each target.

### Separating factors and generating one symplectic group

Normal forms produce a nontrivial unipotent in every point-pushing factor and a simple curve distinguishing every pair of covers. The liftable curve system combines signed primitive representatives on spare handles with torus curves. Large intersections connect its spanning graph, so transvection generation gives density on each factor.

**LV.10.1 — Point-pushing acts non-centrally on each factor** (`LV.10/push-monodromy-noncentral`). In setting C, for every i, the image of π₁(Y, y)' under Mon_{Z_i} ∘ Push is not contained in the centre {±1} of Sp(H₁^Pr(Z_i, Y)); more precisely it contains a nontrivial unipotent element.

Source: [lv2020](#source-lv2020), §8.5, Lemma 8.6, p. 46; [lv2020](#source-lv2020), §8.5, proof of Lemma 8.6, p. 46; [farb-margalit](#source-farb-margalit), §4.2, Fact 4.7, p. 103. Uses: layer inputs; `LV.9.11`, `LV.9.4`, `LV.9.5`, `LV.9.2`, `LV.5.11`, `LV.5.15`, `LV.5.8`, `LV.5.5`, `LV.9.3`.

**LV.10.2 — Distinct covers are distinguished by the cycle type along a simple closed curve** (`LV.10/covers-distinguished-by-curve`). In setting C, for non-isomorphic Z₁, Z₂ among the Z_i there is a nonseparating simple closed curve η ⊂ Y ∖ {y} such that Cov₁(η) and Cov₂(η) have different cycle types.

Source: [lv2020](#source-lv2020), §8.5, Lemma 8.8, p. 47; [lv2020](#source-lv2020), §8.5, proof of Lemma 8.8, p. 47. Uses: layer inputs; `LV.9.11`, `LV.9.9`, `LV.9.1`, `LV.5.9`, `LV.5.7`, `LV.5.5`, `LV.0.7`, `LV.5.4`.

**LV.10.3 — Signed primitive lattice representatives affinely span** (`LV.10/signed-primitive-spanning`). Let r≥2. Choose one signed representative ε(v)v from each pair {v,−v} of primitive vectors of ℤ^r. The differences of these representatives span ℚ^r.

Source: [lv2020](#source-lv2020), §8.5, Lemma 8.10, p. 48; application in §8.6, pp. 50–51. Uses: layer inputs.

**LV.10.4 — Primitive vectors avoiding two intersection constraints** (`LV.10/primitive-intersection-avoidance`). On ℤ^r with r≥2, let ℓ₁,ℓ₂ be nonzero rational linear forms. For every bound B there is a primitive integral vector w with |ℓ₁(w)|>B and |ℓ₂(w)|>B.

Source: [lv2020](#source-lv2020), §8.5, Lemma 8.10, p. 48; application in §8.6, pp. 50–51. Uses: layer inputs.

**LV.10.5 — A connected spanning system of liftable curves** (`LV.10/liftable-curve-system`). In setting C, for a singly ramified Aff(q)-cover Z there are liftable curves A_1, …, A_M on Y ∖ {y} such that (a) the classes Ã_s span H₁^Pr(Z, Y), and (b) the graph with an edge between A_s and A_t whenever Ã_s·Ã_t ≠ 0 is connected.

Source: [lv2020](#source-lv2020), §8.5, Lemma 8.10, p. 48; [lv2020](#source-lv2020), §8.6, p. 50; [lv2020](#source-lv2020), §8.6, p. 51. Uses: layer inputs; `LV.9.12`, `LV.9.11`, `LV.9.7`, `LV.9.2`, `LV.5.9`, `LV.10.3`, `LV.10.4`, `LV.9.3`, `LV.9.8`.

**LV.10.6 — Zariski density on one factor** (`LV.10/lifted-monodromy-dense-factor`). In setting C, for each i, the image of Mon_{Z_i} : Mod(Y ∖ {y})_{Z_i} → Sp(H₁^Pr(Z_i, Y)) is Zariski dense, and so is the image of every finite-index subgroup, in particular of Mod(Y ∖ {y})'.

Source: [lv2020](#source-lv2020), §8.5, Lemma 8.9, p. 47. Uses: layer inputs; `LV.10.5`, `LV.9.7`, `LV.9.4`, `LV.0.14`, `LV.0.16`, `LV.9.8`.

### Product density and the geometric family

Different cycle types yield different fixed-space codimensions, excluding pairwise diagonal graphs in Goursat. The closure of the point-pushing image is normal in the full product and noncentral in every factor, hence equals that product. The reduced-Prym homology comparison translates this topological theorem into full monodromy of the algebraic family.

**LV.10.7 — Zariski density on the product** (`LV.10/lifted-monodromy-dense-product`). In setting C, the image of Mon : Mod(Y ∖ {y})' → ∏_i Sp(H₁^Pr(Z_i, Y)) is Zariski dense.

Source: [lv2020](#source-lv2020), §8.5, Lemma 8.7, p. 46. Uses: layer inputs; `LV.10.6`, `LV.10.2`, `LV.9.6`, `LV.9.4`, `LV.0.21`.

**LV.10.8 — Closed normal subgroups of products of symplectic groups** (`LV.10/normal-subgroups-of-symplectic-products`). Let k be an algebraically closed field of characteristic zero, (V_i, ω_i) (1 ≤ i ≤ N) symplectic spaces of dimension ≥ 2 and H ⊆ ∏_i Sp(V_i) a Zariski-closed normal subgroup whose projection to each factor is not contained in the centre {±1}. Then H = ∏_i Sp(V_i).

Source: [lv2020](#source-lv2020), §8.5, p. 46. Uses: layer inputs.

**LV.10.9 — Zariski density of the point-pushing monodromy** (`LV.10/push-monodromy-dense`). In setting C, the map Mon ∘ Push : π₁(Y, y)' → ∏_{i=1}^N Sp(H₁^Pr(Z_i, Y)) has Zariski-dense image.

Source: [lv2020](#source-lv2020), §8.2.2, Theorem 8.1, p. 41. Uses: layer inputs; `LV.10.1`, `LV.10.7`, `LV.10.8`, `LV.9.4`, `LV.5.11`.

**LV.10.10 — The Kodaira–Parshin family has full monodromy** (`LV.10/kodaira-parshin-full-monodromy`). Let Y be a smooth projective geometrically connected curve of genus g ≥ 2 over a number field K ⊂ ℂ and q ≥ 3 a prime. The Kodaira–Parshin family X_q → Y'_q → Y has full monodromy: for y ∈ Y(ℂ), the Zariski closure of the monodromy of π₁(Y(ℂ), y) on H¹_B(X_{q,y}(ℂ), ℚ) = ⊕_{y' ↦ y} H¹_B(X_{q,y'}(ℂ), ℚ) contains ∏_{y'} Sp(H¹_B(X_{q,y'}(ℂ)), ω_{y'}).

Source: [lv2020](#source-lv2020), §8.2.3, p. 41; [lv2020](#source-lv2020), §5, p. 26. Uses: layer inputs; `LV.10.9`, `LV.8.10`, `LV.8.6`, `LV.8.4`, `LV.8.9`, `LV.8.1`, `LV.9.1`, `LV.9.4`, `LV.5.16`, `LV.3.10`.

Named milestones: Point-pushing monodromy theorem, Full monodromy of Kodaira–Parshin families.

## LV.11 — Faltings's theorem after Lawrence and Venkatesh

Inputs for this layer: `Mathlib:Nat.forall_exists_prime_gt_and_eq_mod`, `Mathlib:NumberField.not_dvd_discr_iff_isUnramifiedIn`, `Mathlib:NumberField.exists_not_isUnramifiedIn`, `Mathlib:IsCyclotomicExtension.Rat.ramificationIdx_eq_of_not_dvd`, `TauCeti:IsCyclotomicExtension.Rat.prime_dvd_of_dvd_natAbs_discr`, `TauCeti:IsCyclotomicExtension.galEquivProd`, `Mathlib:ZMod.card_units_eq_totient`, `LocalFieldsRamification/2`, `TauCeti:NumberField.Chebotarev.mem_frobeniusPrimeSet_galEquivProd_symm_iff`, `TauCeti:AlgHom.IsArithFrobAt.autToPow_eq_absNorm`, `Mathlib:Ideal.quotientInfRingEquivPiQuotient`, `Mathlib:IsArithFrobAt`, `TauCeti:NumberField.exists_isArithFrobAt`, `Chebotarev/10`, `EtaleDualityAndPerverseSheaves:EDC.2`, `InverseGaloisAndArithmeticFundamentalGroups:IG.1`, `SchemeAndStackFoundations:SF.2`, `Mathlib:CharacterModule`, `ComplexComparisonPartII:C4`. Dependencies within this roadmap are given at each target.

### Auxiliary arithmetic choices

Choose q by an arithmetic progression avoiding small and discriminant primes in q−1. The cyclotomic compositum then separates the CM-conjugation requirement from the primitive-root congruences. Chebotarev supplies a friendly place satisfying both and avoiding the complete finite exceptional set.

**LV.11.1 — Choice of the prime q** (`LV.11/admissible-prime`). Let K be a number field with Galois closure K' over ℚ, g ≥ 2 and B > 0. There is a prime q > B such that: (i) 4 ∤ q − 1, and no odd prime ℓ < 8[K : ℚ] divides q − 1; (ii) no odd prime dividing q − 1 divides disc(K); consequently, writing q − 1 = 2m' (m' odd), ℚ(ζ_{q−1}) = ℚ(ζ_{m'}), K' ∩ ℚ(ζ_{q−1}) = ℚ and Gal(K'(ζ_{m'})/ℚ) ≅ Gal(K'/ℚ) × (ℤ/m')^× ≅ Gal(K'/ℚ) × (ℤ/(q − 1))^×; (iii) 8·2^{g+1}/(q − 1)^g < 1/((g − 1/2)(q − 1) + 1).

Source: [lv2020](#source-lv2020), §5, proof of Theorem 5.4, p. 26. Uses: layer inputs.

**LV.11.2 — Choice of the friendly place v** (`LV.11/friendly-auxiliary-place`). Let K and q be as in the lemma on the choice of q (admissible-prime) and T a finite set of places of K. There is a finite place v ∉ T of K such that: (a) v is friendly; (b) its residue characteristic p is odd, unramified in K and lies below no place of T; (c) (q_v, q − 1) = 1; (d) for every odd prime r | q − 1, the class of q_v in (ℤ/r)^× has order at least 8.

Source: [lv2020](#source-lv2020), §5, proof of Theorem 5.4, p. 27. Uses: layer inputs; `LV.11.1`, `LV.1.7`, `LV.1.6`.

### Pairing bounds and the Mordell conclusion

The Frobenius-fixed subgroup for each exponent 1 through 7 becomes isotropic on the odd part of the finite-coefficient H¹ module. Pairing cardinality bounds control its size. Constant fibres of the Hurwitz linear-part map and the generating-tuple count convert this into the uniform short-orbit inequality, so LV.7 applies to every rational point.

**LV.11.3 — The Weil pairing on H¹(Y, ℤ/(q − 1)) and the Frobenius at v** (`LV.11/weil-pairing-frobenius`). Let Y be a smooth projective geometrically connected curve of genus g over K with good reduction outside a finite set S of places, N ≥ 2, and v ∉ S a finite place with (q_v, N) = 1. Then M := H¹_et(Y_{K̄}, ℤ/N) is free of rank 2g over ℤ/N and unramified at v, it carries a perfect alternating G_K-equivariant pairing ⟨·,·⟩ : M × M → μ_N^∨ := Hom(μ_N, ℤ/N), and the Frobenius T := Frob_v satisfies ⟨Tm₁, Tm₂⟩ = q_v⁻¹⟨m₁, m₂⟩.

Source: [lv2020](#source-lv2020), §5, proof of Theorem 5.4, p. 27. Uses: layer inputs; `LV.8.1`.

**LV.11.4 — Few elements lie in small Frobenius orbits** (`LV.11/small-orbit-count`). Let N = 2m' with m' odd, M a free ℤ/N-module of rank 2g with a perfect alternating pairing into a cyclic group C ≅ ℤ/N, and T an automorphism of M with ⟨Tm₁, Tm₂⟩ = u⟨m₁, m₂⟩ for a unit u ∈ (ℤ/N)^× such that u^i ≢ 1 mod r for every prime r | m' and 1 ≤ i ≤ 7. Then |ker(T^i − 1)| ≤ 2^g N^g for 1 ≤ i ≤ 7, and at most 7·2^g N^g ≤ 8·2^g N^g elements of M lie in T-orbits with fewer than 8 elements.

Source: [lv2020](#source-lv2020), §5, proof of Theorem 5.4, p. 27; [lv2020](#source-lv2020), §5, proof of Theorem 5.4, p. 28. Uses: layer inputs; `LV.0.11`.

**LV.11.5 — The size bound** (`LV.11/size-bound`). Let Y be a smooth projective geometrically connected curve of genus g ≥ 2 over K, q an admissible prime, X_q → Y'_q → Y the Kodaira–Parshin family with a good model over 𝒪_S (𝒴 proper), and v ∉ S a place satisfying (b)–(d) of the friendly-place lemma for T ⊇ S. Then size_v(π⁻¹(y)) < 1/(d_q + 1) for every y ∈ Y(K).

Source: [lv2020](#source-lv2020), §5, (5.4), p. 26; [lv2020](#source-lv2020), §5, proof of Theorem 5.4, p. 27. Uses: layer inputs; `LV.11.4`, `LV.11.3`, `LV.11.1`, `LV.11.2`, `LV.8.11`, `LV.8.10`, `LV.7.1`, `LV.0.10`.

**LV.11.6 — Faltings's theorem** (`LV.11/faltings-theorem`). Let K be a number field and Y a smooth projective geometrically connected curve over K of genus g ≥ 2. Then Y(K) is finite.

Source: [lv2020](#source-lv2020), §5, Theorem 5.4, p. 26; [lv2020](#source-lv2020), §5, proof of Theorem 5.4, p. 26. Uses: layer inputs; `LV.11.5`, `LV.11.1`, `LV.11.2`, `LV.7.8`, `LV.10.10`, `LV.8.10`, `LV.2.3`.

Named milestones: Faltings’s theorem.

## Interfaces supplied by neighboring roadmaps

Each entry below states the general input needed by the consuming layers. The named owner supplies its existing theory together with the indicated Part II extension where the interface goes beyond that theory. The local theorems above give the applications. A declaration for an underlying space, representation or morphism is reused independently of the additional comparison theorem.

The finite ramification set, continuity of induction, componentwise rank, invertibility of coefficients and polarization degree, and orientation of transfer are part of these contracts. They must be retained in their eventual Lean signatures.

### `ReductiveGroups/3`

Over an algebraically closed characteristic-zero field, construct closed subgroup schemes, quotients and identity components. Compare the closure of an abstract subgroup with images and normalizers; finite-index subgroups have the same closure identity component. Nontrivial additive one-parameter subgroups are generated densely by their integral powers. Supply orbit morphisms, closed transporters and dim(orbit closure)≤dim(group). Used in `LV.0`, `LV.10`, `LV.3`, `LV.4`, `LV.6`.

### `ReductiveGroups/2`

For smooth affine algebraic groups, Lie commutes with finite products and the differential of a smooth surjection is onto. In characteristic zero, a connected closed subgroup with the same Lie algebra as the ambient connected group is the whole group. Used in `LV.0`.

### `ReductiveGroups/6`

For an algebraically closed characteristic-zero field and symplectic V of dimension at least two, Sp(V) has centre {±1}, and every proper closed normal subgroup is central. Use the existing coordinate-group connectedness theorem through a symplectic-basis comparison. Used in `LV.0`, `LV.10`, `LV.6`.

### `ReductiveGroups/7`

Compare arbitrary-form symplectic Lie algebras and root groups with their coordinate forms. In characteristic zero, sp(V) is nonabelian simple, every Lie automorphism is Ad(h) for h∈Sp(V), and symplectic transvections generate Sp(V). Used in `LV.0`.

### `LocalFieldsRamification/2`

If ℚ_p⊆K⊆L are finite unramified extensions, arithmetic Frobenius generates Gal(L/ℚ_p), and its [K:ℚ_p]-th power generates Gal(L/K) with fixed field K. Identify 𝒪_K=W(k_K), with |p|=p⁻¹. A monic polynomial over a local integer ring with separable reduction defines a product of unramified extensions. For unramified v in a number-field extension L/K, Frobenius order r gives [L:K]/r places of degree r. Compare geometric points of a finite étale algebra with these local embeddings and decomposition actions. Unramified local composita remain unramified; deduce the corresponding Galois-closure statement using completions of conjugates. Used in `LV.0`, `LV.11`, `LV.2`, `LV.4`, `LV.6`, `LV.7`.

### `ArithmeticGaloisRepresentations:R01.1`

Continuous finite-dimensional p-adic representations have stable integral lattices. Supply induction from open subgroups, continuous Mackey decomposition for closed D and open H, and semisimplicity upon restriction to a finite-index normal subgroup in characteristic zero. Compare this with the existing algebraic Rep decomposition. Used in `LV.1`.

### `WeightsInEtaleCohomology:R34.1`

For continuous ρ of G_K and finite T, define purity using geometric Frobenius eigenvalues of complex absolute value q_v^{w/2}, and define integral characteristic polynomials separately. Track subquotients, sums, determinants, tensor products, Tate twists, finite restriction and finite induction; induction enlarges T by ramified places. Duality negates weights and ℚ_p(n) has weight −2n. Purity survives duality; integrality need not. The other listed operations preserve integrality under their usual integral-polynomial hypotheses. Import Weil-number arithmetic from DWP.0. Used in `LV.1`, `LV.6`, `LV.7`.

### `DeligneWeightsAndPurity:DWP.0`

Define algebraic Weil q-numbers of integral weight w by absolute value q^{w/2} at every complex embedding. Products add weights, inverses negate them, and conjugation preserves them. Used in `LV.1`.

### `Chebotarev/10`

For finite Galois L/K, a conjugacy class and a finite excluded set, give infinitely many unramified primes with that Artin class. For M/ℚ and a specified element, select a prime above p realizing that arithmetic Frobenius element. Used in `LV.1`, `LV.11`, `LV.6`.

### `ClassFieldTheory/11`

For a finitely ramified continuous ℚ_p-valued character of G_K, global reciprocity gives an idele-class character trivial on principal ideles. At an unramified finite place its uniformizer value is the arithmetic Frobenius value; at a p-place it is local restriction composed with local Artin. At infinity it is trivial on the identity component. Used in `LV.1`.

### `ClassFieldTheory/7`

For finite F/ℚ_p, local Artin sends 𝒪_Fˣ onto abelianized inertia and satisfies χ_cyc(Art_F(u))=N_{F/ℚ_p}(u)⁻¹ on units. Used in `LV.1`.

### `PadicHodgeTheory:R06.2`

Supply exact tensor de Rham functors with strict integer-indexed filtrations, duals, determinants and Hodge–Tate comparison. Local Tate–Sen invariants imply local algebraicity of de Rham ℚ_p-valued characters. D_dR of finite induction is filtered restriction of scalars; unramified induction preserves crystallinity. For unramified F, MF^φ_F has bijective σ-semilinear φ and exhaustive separated decreasing filtrations; D_cris is covariant and respects field-isomorphism transport. A crystalline subrepresentation has the induced filtration, and weak admissibility gives t_N(D)=t_H(D), t_N(D′)≥t_H(D′) for φ-stable D′. Here t_N is the valuation of det φ in an F-basis. Used in `LV.1`, `LV.4`, `LV.6`, `LV.7`.

### `ArithmeticGaloisRepresentations:R01.6`

For an abelian variety with good reduction at u∤p, V_p is unramified and its Frobenius polynomial is the integral degree-2dim(A) polynomial of the reduced abelian variety, independent of p. Used in `LV.1`.

### `NeronModelsAndSemistableAbelianVarieties:R11.5`

Néron–Ogg–Shafarevich gives unramified V_p at good-reduction u of residue characteristic different from p. Used in `LV.1`, `LV.4`, `LV.7`.

### `DeligneWeightsAndPurity:DWP.1`

The Frobenius polynomial of an abelian variety over 𝔽_q has all complex roots of absolute value q^{1/2}. Used in `LV.1`.

### `PadicHodgeTheory:R06.6`

Good reduction of an abelian variety over finite F/ℚ_p makes V_p and its dual H¹_et crystalline. Used in `LV.1`, `LV.4`.

### `AbelianSchemesAndArithmeticModuli:A3`

A polarization in characteristic different from p gives a perfect alternating equivariant pairing on V_p with values in ℚ_p(1), and on H¹_et with values in ℚ_p(−1). Used in `LV.1`.

### `SchemeAndStackFoundations:SF.3`

For an abelian variety in characteristic different from p, identify H¹_et with Hom(V_p,ℚ_p), naturally in homomorphisms and pairings. For smooth proper curves, supply the absolute and relative degree-one Hodge exact sequence with base change. Used in `LV.1`, `LV.8`.

### `AbelianSchemesAndArithmeticModuli:A1`

Abelian schemes over arbitrary bases are smooth proper group schemes with geometrically connected fibres; supply dimension, homomorphisms and base change. A Weierstrass equation with unit discriminant over Spec R gives an elliptic abelian scheme and its principal polarization. Over a reduced finite-type characteristic-zero base, a relative endomorphism of constant kernel dimension has a smooth kernel whose identity component is an abelian scheme commuting with base change; include representability and openness of that component. Used in `LV.2`, `LV.6`, `LV.8`.

### `AbelianSchemesAndArithmeticModuli:A2`

Supply dual abelian schemes and positive polarization homomorphisms, their base change, and the polarization of relative Jacobians. Used in `LV.2`, `LV.6`, `LV.8`.

### `AbelianSchemesAndArithmeticModuli:A4`

For an abelian scheme of dimension d over a smooth 𝒪_S-base, H¹_dR has rank 2d and Hodge terms of rank d, all locally free and commuting with arbitrary base change. The integral Gauss–Manin connection is integrable. A polarization of invertible degree gives a perfect alternating horizontal pairing with Lagrangian F¹, compatible with base change and complex comparison. Used in `LV.2`, `LV.6`.

### `AbelianSchemesAndArithmeticModuli:A5`

For complex abelian schemes, Ehresmann gives integral Betti local systems and de Rham–Betti comparison identifies them with horizontal sections. For an endomorphism of V/Λ, H₁((ker ε)°,ℚ)=ker(ε on Λ⊗ℚ). Restricted polarizations correspond to restricted Riemann forms. Used in `LV.10`, `LV.2`, `LV.3`, `LV.6`, `LV.8`.

### `ComplexComparisonPartII:C5`

For smooth proper complex algebraic morphisms, relative algebraic de Rham–Betti comparison identifies the analytic Gauss–Manin horizontal sections with R^qf_*ℂ. In particular, a projective curve of genus g has degree-one Betti and de Rham dimension 2g. Used in `LV.10`, `LV.2`, `LV.3`, `LV.6`, `LV.8`.

### `CrystallineCohomology:CR.1`

Crystals on a smooth k-scheme correspond on a p-adic formal lift to modules with integrable quasi-nilpotent connection. Between sections with equal reduction, the comparison is the connection's Taylor series. For unramified bases and p>2, (p) has topologically nilpotent divided powers giving convergence. Used in `LV.2`.

### `CrystallineCohomology:CR.2`

For a smooth proper lift 𝔛/W(k), compare H^q_cris(X₀/W(k)) with H^q_dR(𝔛/W(k)), naturally in the lift (Berthelot–Ogus, Corollary 7.4). Used in `LV.2`, `LV.4`.

### `CrystallineCohomology:CR.3:Frobenius-isogeny`

For smooth proper X₀ over perfect k, crystalline Frobenius is Witt-semilinear and respects functoriality and cup products. Its linearization becomes invertible after inverting p; integral torsion-freeness is unnecessary. Used in `LV.2`.

### `CrystallineCohomology:CR.7`

For smooth proper formal g over W(k), assume H^q_dR is locally free and commutes with base change. Then R^qg_cris*𝒪 is the crystal of its Gauss–Manin connection. Its value at a W(k′)-point is the special fibre's crystalline cohomology, compatibly with Frobenius. Used in `LV.2`.

### `SchemeAndStackFoundations:SF.0`

Supply finite-presentation schemes, products, smooth/étale/proper morphisms and base change. Spread out finite-presentation group laws, finite étale maps and abelian-scheme properties after enlarging S. Smooth sections over an unramified DVR give completed local rings 𝒪_v[[z]] and residue disks (p𝒪_v)^m. Supply finite-type dimensions, product and scalar-extension dimensions, overlapping-open irreducibility, strict dimension decrease for proper closed subsets of irreducible schemes, and image-closure bounds. Finite surjections preserve dimensions and closedness. For finite-dimensional characteristic-zero K-algebras A, Aˣ is the smooth geometrically connected principal open det(L_a)≠0 of dimension dim_K A, with regular multiplication and inversion. Normalization in finite separable function-field extensions is finite for excellent finite-type schemes and commutes with characteristic-zero field extension, including component decomposition. Used in `LV.0`, `LV.2`, `LV.3`, `LV.4`, `LV.7`, `LV.8`.

### `AlgebraicModuliForArithmeticGeometry:R09.1`

Represent Grassmannians and flags, with Plücker embeddings and base change. Endomorphism-stability and isotropy define closed loci; rank conditions on intersections are closed and Grassmannian projections proper. For a rank-2d module over a finite étale algebra, impose rank d on every component. Symmetric matrices give base-change-compatible Lagrangian charts. Used in `LV.3`, `LV.7`.

### `UniversalCovers/2`

Classify possibly disconnected covers of connected, locally path-connected, semilocally simply connected spaces by π₁-sets. Pullback of local systems to the universal cover is constant. Use the opposite-group wrapper for the left deck action by prepending paths and backward transport; the forward image is the same subgroup. A base homeomorphism lifts to a connected cover precisely when its outer action preserves the monodromy conjugacy class; two lifts differ by a deck transformation. Used in `LV.3`, `LV.5`, `LV.6`, `LV.8`, `LV.9`.

### `ComplexComparisonPartII:C0`

Compare algebraic and analytic local rings faithfully flatly, including their completions. Regular parameters become holomorphic coordinates and regular functions their convergent Taylor series. Relative normalization in finite covers commutes with analytification; the local-ring comparison reflects normality and smoothness in characteristic zero. Used in `LV.3`, `LV.8`.

### `ComplexComparisonPartII:C4`

The analytification of a smooth geometrically connected curve over a subfield of ℂ is connected, including complements of finitely many points in projective curves. Used in `LV.11`, `LV.3`, `LV.6`, `LV.7`, `LV.8`.

### `PadicHodgeTheory:R06.5`

For smooth proper 𝔛/W(k), k perfect, with generic fibre X/K, identify D_cris(H^i_et(X_K̄,ℚ_p)) with H^i_dR(X/K), equipped with transported crystalline Frobenius and the Hodge filtration. Respect functoriality and cup products and compare rigid and algebraic generic-fibre étale cohomology. Degree one for abelian schemes suffices here. Used in `LV.4`.

### `SchemeAndStackFoundations:SF.2`

For proper X/K and compatible separable closures under L/K, étale cohomology base change is a G_L-equivariant isomorphism. Proper-smooth base change with ℤ/N, N invertible, makes degree-one finite-coefficient cohomology unramified at good reduction away from N. Used in `LV.11`, `LV.4`.

### `GeometricTopology/1`

Supply smooth gluing, collars and isotopy extension, together with Jordan–Schönflies, finite triangulation of compact topological surfaces with boundary, tame embedded curves, cutting and regluing. Motion of a marked interior point extends to an isotopy fixed near the boundary. Evaluation Homeo⁺(S,∂S)→int(S) is locally trivial with the marked-point homeomorphism group as fibre. Used in `LV.5`, `LV.9`.

### `AlgebraicTopology/1`

Supply based van Kampen for open sets with path-connected intersection, free groups for finite wedges of circles, and the comparison for surfaces cut along separating circles. Used in `LV.10`, `LV.5`, `LV.9`.

### `AlgebraicTopology/2`

Integral singular chains and homology with local coefficients carry basepoint-change and monodromy. After surface classification, assemble the handle/peripheral CW basis and intersection radical. Used in `LV.5`.

### `AlgebraicTopology/4`

Cellular homology computes the orientable 4g-gon model and finite graphs. Graph cycles with disjoint edge supports are independent. Used in `LV.5`, `LV.9`.

### `AlgebraicTopology/6`

Poincaré–Lefschetz duality gives the intersection form on compact oriented surfaces, perfect in the closed case and invariant under orientation-preserving homeomorphisms. Retain H₁(W;ℤ)≅Hom(H₁(W,∂W;ℤ),ℤ) for boundary surfaces. Used in `LV.5`, `LV.8`, `LV.9`.

### `AlgebraicTopology/8`

Supply relative homotopy, Hurewicz and Whitehead comparisons, the bundle-to-Serre-fibration bridge and fibration homotopy sequence. Positive-genus compact surfaces are aspherical. Injection of π₁ of the fibre uses vanishing π₂ of the base. Used in `LV.5`.

### `JacobianChallenge/B`

For smooth proper geometrically connected curves, genus is dim H¹(𝒪), and Serre duality gives h⁰(ω)=g. In characteristic zero ω=Ω¹. Used in `LV.8`.

### `ComplexComparisonPartII:C2`

Projective GAGA compares coherent sheaves and finite morphisms, with their normalizations, on smooth projective complex varieties. Used in `LV.8`.

### `InverseGaloisAndArithmeticFundamentalGroups:IG.3`

For punctured complex curves, finite étale Riemann existence is an equivalence compatible with pointed monodromy and branch-cycle compactification (SGA 1 XII 5.1). Algebraically closed base change in characteristic zero compares K̄ and ℂ cover categories (XIII §4). Used in `LV.8`.

### `InverseGaloisAndArithmeticFundamentalGroups:IG.0`

Finite étale covers of connected pointed schemes are finite continuous π₁^et-sets, functorially; at Spec K this is Galois correspondence. Used in `LV.8`.

### `InverseGaloisAndArithmeticFundamentalGroups:IG.1`

Supply arithmetic/geometric π₁^et exact sequences and puncture inertia. Peripheral inertia transforms cyclotomically up to conjugacy. For finite abelian A, identify H¹_et(−,A) with Hom_cont(π₁^et,A), compatibly with topological comparison. Used in `LV.11`, `LV.8`.

### `JacobianChallenge/D`

Relative Picard representability and properness supply the Jacobian. For smooth proper geometrically connected Z/B over a reduced finite-type characteristic-zero base, Pic⁰ is an abelian scheme with canonical principal polarization, automorphism functoriality and base change. Over ℂ identify its integral H₁ with the curve's H₁, matching the Riemann and intersection forms. The existing pointed absolute properness and theta interfaces lie respectively in JacobianChallenge/D and /E. Used in `LV.8`.

### `AlgebraicModuliForArithmeticGeometry:A0-extension`

Represent the relative degree-zero Picard functor of a smooth proper geometrically connected curve by a smooth proper group scheme, with the dual-abelian-scheme comparison. Used in `LV.8`.

### `AlgebraicTopology/5`

Rational transfer for regular finite unbranched covers satisfies p_*p^*=|H| and p^*p_*=Σh_*, hence identifies invariants with base homology. Extend rational transfer to branched surface covers by filling peripheral cycles; retain degree and intersection projection formulas, regular norm identity and compatibility with maps. Used in `LV.8`, `LV.9`.

### `EtaleDualityAndPerverseSheaves:EDC.2`

For smooth proper genus-g curves with N invertible, H¹_et(ℤ/N) is free of rank 2g with a perfect alternating pairing valued in Hom(μ_N,ℤ/N), including even N. Compare étale trace/cup product with the Jacobian Weil pairing. Used in `LV.11`, `LV.8`.

### `AlgebraicTopology/3`

Supply the signed Mayer–Vietoris sequence for decomposition of a surface along finitely many disjoint circles. Used in `LV.10`.

### `AlgebraicCurves/12`

For the smooth proper geometrically connected model of a separably generated function field, identify function-field genus with dim H¹(𝒪), importing JacobianChallenge/A–B. Used in `LV.8`.

### `LefschetzPencilsAndVanishingCycles:LPV.5`

In characteristic zero, an irreducibly acting symplectic Lie algebra generated by rank-one square-zero operators x↦ω(δ,x)δ equals sp(V) (Deligne, Weil I 5.11). Supply coefficient-field and base-change forms; use this linear theorem for the local graph criterion. Used in `LV.0`.

The general contracts also include the following proof-level comparisons. Surface classification needs Jordan–Schönflies disk extension, finite triangulation, boundary collars, and homeomorphisms realizing polygon subdivisions. Point-pushing and forgetting need centrelessness in negative Euler characteristic, control of the identity component of the boundary-fixed homeomorphism group, and forgetting surjectivity for arbitrary finite sets of marked points. These are GeometricTopology Part II interfaces; the fibration homotopy sequence and positive-genus asphericity come from AlgebraicTopology Part II.

The trace proof in LV.1 needs the faithful finite-dimensional image-algebra/Jacobson-radical bridge and primitive central idempotents. Rational subgroup averaging is shared representation infrastructure: `e_H²=e_H`, `e_Ge_H=e_G=e_He_G`, and `|G|(1−e_H+e_G)` is integral. The relative Prym then additionally needs the kernel-component and branched-transfer comparisons above. Its restricted polarization need not be principal.

For the distinguishing-curve argument in LV.10, give an explicit disjoint-arc model on the punctured torus and the spare handle. Check boundary endpoint order, the collapse words `β₂` and `β₁β₂β₁⁻¹`, intersection number one and nonseparating homology. Twisting the first arc system about the second realizes every required exponent; a drawing of one exponent is insufficient. The lattice lemmas and their rank-at-least-two hypotheses are stated in LV.9–10.

Compare smooth embedded circles used in the geometric constructions with the topological ambient-isotopy quotient, using compatible smoothing. Prove isotopy invariance of homology class, separation and collar cutting. For Legendre, compare the explicit positive complex loops with endpoint point-pushing and the oriented annular twist to determine the signs `ε_i,s_i`; the density argument uses only the signed nontrivial powers stated in LV.6.

## Worked arithmetic and geometric checks

The smallest affine example is q=3, so Aff(3) is S₃. For genus two there are 810 peripheral-nontrivial surjections from the free group of rank four and 135 classes modulo affine conjugacy. Their degree-three compactified covers have genus five, primitive rational homology dimension six and reduced Prym dimension three. Thus product monodromy has 135 factors Sp₆. This simultaneously checks the conjugacy quotient, ramification genus formula and distinction between the degree-q quotient and the degree-q(q−1) Galois cover.

For a trivial disconnected double cover, primitive homology consists of `(x,−x)` and the induced intersection form is twice the base form. For a connected cyclic degree-three cover the monodromy is only C₃, so it does not qualify as an Aff(3)-cover. These examples test transfer on disconnected sources and the full-monodromy requirement on the covering carrier.

For E=k×k and V=E² with the standard E-form, the period variety is ℙ¹×ℙ¹. The E-stable subspace k²×0 has the right total dimension but component ranks (2,0), and is excluded from the rank-one E-Grassmannian. A symplectic plane gives ℙ¹, and the zero symplectic space gives Spec k. These tests fix both the rank and zero-dimensional conventions.

A seven-cycle contributes completely to size_v; an eight-cycle contributes nothing. One fixed point together with one eight-cycle gives size_v=1/9. This is a geometric-point proportion, so averaging over two local factors without their degree weights is incorrect. For an eight-cycle mapping to a singleton, the constant-fibre inequality reads 0≤1.

For K=ℚ and genus two, q=107 satisfies the auxiliary-prime inequalities: q−1=106=2·53, d_q=159 and `64/106² < 1/160`. A prime p≡2 modulo 53 can provide the required order at the odd factor; p=373 is a numerical example only when it also avoids the chosen bad-reduction and ramification set. For N=106, the fixed-space estimate is `|ker(T^i−1)|≤4·106²` for 1≤i≤7. None of these examples substitutes for avoidance of the entire finite exceptional set.

For the Tate line ℚ_p(1), t_H=−1. The direct sum of jumps −1 and +1 has t_H=0; retaining only positive jumps would give the wrong answer. For a pure representation of weight one at a friendly place, the mean Hodge weight is 1/2. At K=ℚ(i), the prime 3 is friendly, 5 is split and not friendly, and 2 is excluded by ramification. Local reciprocity identities used to prove these weight formulas are identities on an open subgroup of units, with cyclotomic normalization `χ_cyc(Art_F(u))=N(u)⁻¹`.

## Suggested Lean statements

[Suggested.lean](Suggested.lean) contains concrete Mathlib expressions for affine equivalences, semilinear centralizers, symplectic transvections, CM subfields, finite Hodge filtrations, permutation short-orbit size, surjection actions, primitive linear-map kernels, the Legendre equation and lattice lemmas. Its header distinguishes these declarations from the mathematical catalogue of interfaces requiring neighboring roadmap objects. A `sorry` proves no theorem; these statements are proposals for names and signatures.

The README specifies the complete mathematical interfaces. Some comparisons in the suggested file require fixed-field descent, the Tau Ceti isometry-group adapter, finite-place and continuity data, scheme/cohomology carriers or analytic transport before they can be expressed as Lean declarations. The catalogue names those interfaces explicitly. In particular, the affine prototype includes the concrete group map, kernel membership and commutator formula, while the complete API also requires surjectivity of the linear-part map, translation-subgroup normality, the stabilizer/coset comparison and derived-subgroup equality. Those requirements are the theorems stated above, not assumptions attached to the carrier.

## Sources

All mathematical statements above are paraphrases or formal formulations. Page locators refer to the specified public edition, with printed and PDF page numbers distinguished where they differ.

<a id="source-lv2020"></a>

**[lv2020]** Brian Lawrence; Akshay Venkatesh. [Diophantine problems and p-adic period mappings](https://arxiv.org/pdf/1807.02721v3). arXiv:1807.02721v3 (25 October 2019), 76 pp.; published Invent. Math. 221 (2020), 893–999, doi:10.1007/s00222-020-00966-7. Locators are to the arXiv v3 pagination.

<a id="source-brinon-conrad"></a>

**[brinon-conrad]** Olivier Brinon; Brian Conrad. [CMI summer school notes on p-adic Hodge theory (preliminary version)](https://math.stanford.edu/~conrad/papers/notes.pdf). Preliminary version (2009), 290 pp.

<a id="source-farb-margalit"></a>

**[farb-margalit]** Benson Farb; Dan Margalit. [A primer on mapping class groups](https://pagine.dm.unipi.it/~a019210/Farb%20Magalit_Primer%20on%20Teichmuller%20theory.pdf). Version 5.0 (the authors' freely distributed version, 509 pp.; published by Princeton University Press, 2012). Page numbers are the printed ones.

<a id="source-milne-cm"></a>

**[milne-cm]** J. S. Milne. [Complex Multiplication](https://www.jmilne.org/math/CourseNotes/CM.pdf). Course notes (version posted at jmilne.org, accessed 2026-09-16).

<a id="source-sga1"></a>

**[sga1]** A. Grothendieck; M. Raynaud. [Revêtements étales et groupe fondamental (SGA 1)](https://arxiv.org/pdf/math/0206203). Updated edition, arXiv:math/0206203 (Documents Mathématiques 3, SMF 2003).

<a id="source-deligne-bourbaki-616"></a>

**[deligne-bourbaki-616]** Pierre Deligne. [Preuve des conjectures de Tate et de Shafarevitch (d'après G. Faltings)](http://www.numdam.org/item/SB_1983-1984__26__25_0.pdf). Séminaire Bourbaki, exposé 616 (1983/84), Astérisque 121–122 (1985).

<a id="source-faltings-1983"></a>

**[faltings-1983]** Gerd Faltings. [Endlichkeitssätze für abelsche Varietäten über Zahlkörpern](https://math.uchicago.edu/~drinfeld/Deligne%27s_conjecture_Manin_conf/Faltings_argument/Faltings.pdf). Invent. Math. 73 (1983), 349–366.

<a id="source-conrad-strassmann"></a>

**[conrad-strassmann]** Keith Conrad. [Strassmann's theorem and an application](https://kconrad.math.uconn.edu/blurbs/gradnumthy/strassmannapplication.pdf). Expository note (version posted on the author's web page, accessed 2026-09-16).

<a id="source-berthelot-ogus"></a>

**[berthelot-ogus]** Pierre Berthelot; Arthur Ogus. [Notes on Crystalline Cohomology](https://math.bu.edu/people/yangzhe/BO_Crystalline.pdf). Princeton University Press / University of Tokyo Press, 1978.

<a id="source-gallier-xu"></a>

**[gallier-xu]** Jean Gallier; Dianna Xu. [A Guide to the Classification Theorem for Compact Surfaces](https://www.cis.upenn.edu/~jean/surfclassif-root.pdf). Springer, Geometry and Computing 9 (2013), author-hosted full text; printed page locators.
