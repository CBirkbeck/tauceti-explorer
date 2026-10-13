# Roadmap: Selmer groups and Iwasawa cohomology

**Summary.** Build compact and rational Selmer structures from continuous Galois cohomology, compare their local conditions under Tate duality, and pass to Iwasawa towers with their control and determinant formulas. The arithmetic endpoints are the cyclotomic unit dictionary, finite Bloch–Kato conditions, ordinary Selmer structure theorems and two specified parity applications. The build includes the period facts required for these conditions; general p-adic Hodge comparison theorems and analytic main conjectures belong to their respective roadmaps.

## Scope and ownership

This roadmap owns multiplicative-completion comparisons, local-condition propagation, orthogonal Selmer structures, finite-S Selmer fibres and their Iwasawa comparisons. Its period constructions supply the finite-condition prerequisites consumed by PadicHodgeRegulators. Generic discrete Selmer groups and elliptic finite-level Kummer/Sha sequences belong to TauCetiRoadmap.EllipticCurves Layer 7. The algebraic localization diagram here extends those interfaces to compact and rational modules. ArithmeticGaloisDuality supplies canonical continuous cochains, global restricted-ramification groups, local/global Tate duality and compact-support complexes. These two roadmaps form the Selmer/duality bundle.

The basic completion is Mathlib `AdicCompletion`, with its existing canonical map, `AdicCompletion.map_id`, `AdicCompletion.map_comp` and finite-module tensor theorem `AdicCompletion.ofTensorProduct_bijective_of_finite_of_isNoetherian`. The light notation `pCompletion`, `toPCompletion` and `pCompletionMap` specializes those inputs to (p)⊂ℤ without defining a new completion. TauCetiRoadmap.LocalGaloisGroups Layer 7 supplies `padicCompletionUnits`, `padicCompletionTransition`, `padicCompletionUnitsOf`, its p-adic module and the finite-p-adic-field torsion/rank results. Only the comparison with Mathlib completion and the failure of the unrestricted algebraic tensor formula are developed here.

Finite power-class finiteness is current Tau Ceti `finiteIndex_range_powMonoidHom`. Finite-level Kummer theory, including Hilbert 90, `kummerMap_surjective`, `kummerIso`, `kummerIso_res` and `kummerIso_norm`, is supplied by `TauCeti.FieldTheory.GaloisCohomology.Kummer`. The coefficient transition square is already `explicitCoeff1_kummerCoeffPow_kummerMap`, with transition `kummerCoeffPow` and surjectivity `explicitCoeff1_kummerCoeffPow_surjective`. These are inputs to the compact limit comparison. The older pinned library supplies the injective class map used by the representative signatures.

The all-degree discrete Shapiro isomorphism is current Tau Ceti `ContinuousCohomology.shapiroIsoTopRep` in `RepresentationTheory/Homological/ContCohomology/Shapiro/AllDegrees.lean`; the complete finite-type coefficient extension is the additional interface used here. Mathlib supplies `Submodule.orthogonalBilin` for pairings between different modules with an arbitrary module as target, together with `mem_orthogonalBilin`, `orthogonalBilin_antitone`, `orthogonalBilin_bot` and `orthogonalBilin_top_eq_ker`. These definitions and basic identities are inputs, rather than new targets. Current Tau Ceti’s `FiniteBilinearModule.orthogonalComplement` and its cardinality/double-complement results treat a finite bilinear module paired with itself into ℚ/ℤ. The retained finite pairing results below instead pair two independently supplied ℤ/n-modules into ℤ/n. Mathlib supplies the circle-valued `PontryaginDual`. Current Tau Ceti `instModulePadicCharacterContragredient` supplies the algebraic opposite-group-algebra action on p-adic characters; this roadmap adds its continuous p-primary and completed-Iwasawa comparisons. Hodge filtrations, opposedness, duals and Tate objects are the existing `TauCeti.Hodge` constructions. Mathlib supplies the underlying `BDeRhamPlus` and `BDeRham` carriers and Deligne Gamma functions. Their arithmetic period comparisons and the additional complex-linear Betti involution are developed here.

ClassFieldTheory owns reciprocity and class formations; GlobalNumberFields owns the S-unit theorem; LocalFieldsRamification owns local multiplicative structure and tame inertia. PadicMeasuresIwasawaAlgebras owns completed group rings, height-one commutative algebra and perfect determinants. SchemeAndStackFoundations SF.2 supplies étale sites, field Galois comparison and Galois-covering spectral sequences. The arithmetic K(π,1) comparison required here remains a separate unsupplied contract. No general ordinary-family parity theorem, Heegner-point theory or proof of a main conjecture is included.

## Conventions

Fix a prime p. For arithmetic coefficients O is the ring of integers of a finite extension E/ℚ_p, λ a uniformizer, T a finite free O-lattice with continuous Galois action, V=T⊗_O E and A=V/T. The compact Tate dual is Hom_O(T,O)(1); the discrete Tate dual is Hom_O(T,E/O)(1). They are distinct coefficient objects. Finite coefficient quotients use λ^m; a formula written over ℤ_p with p^m is specialized to O=ℤ_p unless its O-version is explicitly stated. A number field F has finite S containing its p-adic and infinite places and coefficient ramification. Local conditions use decomposition-group stability, without imposing global stability on an ordinary filtration.

Write Â=lim_m A/p^mA for additive completion, and use power quotients for multiplicative groups. This is not an unrestricted algebraic tensor product. Inverse limits of compact coefficient systems carry their inverse-limit topology. Rational Iwasawa cohomology means integral Iwasawa cohomology tensored with ℚ_p, rather than an inverse limit allowing unbounded denominators. Pontryagin corank of a cofinitely generated discrete module is the rank of its compact dual.

Cochain complexes are cohomological. The fibre of f is Cone(f)[−1]. Local Tate duality has degree two and global compact-support duality degree three. Derived global statements assume condition (P): p is odd or F has no real places. At p=2 with real places use ArithmeticGaloisDuality D7.5’s complete Tate-cochain correction in the unbounded derived category; finite Poitou–Tate modifications alone do not give this derived comparison. The displayed cyclotomic Euler-rank formulas assume p odd. Finite ordinary and nonsingular conditions retain their H⁰, inertia and Tamagawa errors.

For Λ=O[[Γ]], the induced compact coefficient action is g(ℓ⊗t)=[g]⁻¹ℓ⊗gt; ι(γ)=γ⁻¹. A k-fold Tate cup twist is semilinear for Tw_k(γ)=χ_cyc(γ)⁻ᵏγ. Arithmetic Frobenius is used in the explicitly specified Euler factors. The arithmetic determinant is det⁻¹; for a generically acyclic complex its valuation is Σ_i(−1)^i length H^i, so degrees one and two give char H²/char H¹. Positive rank needs a supplied regulator trivialization.

For L-functions ℚ_p(n) has Hodge type (n,n), real Betti involution (−1)^n and Gamma factor Γ_ℝ(s−n), so L(ℚ_p(n),s)=ζ(s−n). Its p-adic Hodge–Tate weight is −n. The native cohomological Hodge Tate index is −n. Pole orders refer to the meromorphic Gamma function (equivalently zeros of its analytic reciprocal), rather than a nonzero value of Mathlib's totalized Gamma at a pole.

## Exact supplier contracts

### From Mathlib and Tau Ceti

Use Mathlib `AdicCompletion.of`, `AdicCompletion.map`, `AdicCompletion.ofTensorProduct` and `AdicCompletion.ofTensorProduct_bijective_of_finite_of_isNoetherian`, together with `PadicInt.toZModPow`, to compare completion with quotient towers. `NumberField.Units.exist_unique_eq_mul_prod`, `NumberField.RingOfIntegers` and `IsIntegral.of_pow` supply the global-unit comparison. `CategoryTheory.Functor.isMittagLeffler_of_exists_finite_range` and finite roots-of-unity bounds supply the coefficient-limit hypothesis. `Submodule.orthogonalBilin` and `Submodule.mem_orthogonalBilin` supply annihilators of bilinear pairings. `Submodule.map_le_iff_le_comap` supplies propagation, `Module.finrank` supplies rank after rationalization and `ContinuousMonoidHom.comp` supplies continuous dual pullback. The native Kummer class maps and connecting-map naturality supply finite-level input. The native `HodgeStructureOn.hodgeNumber`, `HodgeStructureOn.finite_setOf_hodgeNumber_ne_zero`, dual and Tate/twist APIs supply archimedean carriers. `Complex.Gammaℝ`, `Complex.Gammaℂ` and their pole conventions supply the analytic normalization. `BDeRhamPlus` and `BDeRham` supply carriers, without an assumed Galois action or fixed-field theorem.

### From ArithmeticGaloisDuality R02.1

Continuous cohomology with compact coefficients T = lim T_n (ℤ_p(1) = lim μ_{p^m}; lattices T, V = T[1/p], W = V/T) on the canonical carrier, with the Milnor sequence 0 → lim^1 H^{i−1}(G, T_n) → H^i(G, T) → lim H^i(G, T_n) → 0 and its consequence H^i(G, T) = lim H^i(G, T_n) when every H^{i−1}(G, T_n) is finite (Rubin Proposition B.2.3); vanishing of lim^1 for Mittag-Leffler systems; and the maps H^1(T) → H^1(V) → H^1(W) with H^1(T) ⊗ ℚ_p ≅ H^1(V) (Rubin Proposition B.2.4). Also: the long exact sequences for 0 → T → V → W → 0 and Tate's inverse-limit theorem for H¹(K, T) = lim H¹(K, W_M), with their coefficient naturality. The general continuous-section LES must apply to the canonical topological period coefficients V⊗B_cris and V⊗B_dR, beyond compact or finite-dimensional coefficient modules. For Iwasawa cohomology: derived-limit acyclicity/exactness for compatible towers of compact finite-type R-modules via their finite coefficient quotients, with the topology and continuous maps retained. Condition (F) makes finite coefficient cohomology finite, not all lattice cohomology finite-length.

### From ArithmeticGaloisDuality R02.3

G_{F,S} for a number field F and finite S ⊇ {v | p∞}, decomposition-group localisation maps H^i(G_{F,S}, M) → H^i(F_v, M), finiteness of H^i(G_{F,S}, M) for finite M, and the Kummer sequence 0 → 𝓞_{F,S}^×/p^m → H^1(G_{F,S}, μ_{p^m}) → Pic(𝓞_{F,S})[p^m] → 0. Also: finiteness of H¹(K_Σ/K, W_M), cited as R02.3/h1-finite.

### From TauCetiRoadmap.ProfiniteCohomology Layer 9

Import the current library’s Hilbert-90/Kummer isomorphism and its restriction/norm squares (kummerMap_surjective, kummerIso, kummerIso_res, kummerIso_norm). Use their μ_(p^m) coefficient-transition squares to supply the compact-cochain comparison, together with H⁰(G_K,μ_n)=μ_n(K).

### From TauCetiRoadmap.ProfiniteCohomology Layer 5

Inflation–restriction for discrete continuous cohomology, 0 → H^1(G/H, M^H) → H^1(G, M) → H^1(H, M), and the H^1 of a procyclic group, H^1(Ẑ, C) ≅ C/(σ − 1)C by evaluation at a generator.

### From TauCetiRoadmap.LocalFieldsRamification Layer 1

For K/ℚ_ℓ finite: K^× = π^ℤ × 𝓞_K^×, 𝓞_K^× = μ_{q−1} × U^1_K, U^1_K a finitely generated ℤ_p-module when ℓ = p and pro-ℓ when ℓ ≠ p, and finiteness of K^×/(K^×)^n (Hensel). Import A(K), the multiplicative p-completion and its module from current LocalGaloisGroups Layer 7. The completion/valuation extension and the Tate–Sen calculation for C_p(i) are additional required interfaces for §§4.1 and 4.4. **Unsupplied contract.** Current LocalFieldsRamification Layer 1 treats finite local fields; it contains no C_p construction or Tate–Sen calculation. These inputs require a local construction and source-level proof decomposition before the period fixed-field targets can use them.

### From TauCetiRoadmap.GlobalNumberFields Layer 6

Dirichlet's S-unit theorem: 𝓞_{F,S}^× is finitely generated, of rank #S − 1.

### From TauCetiRoadmap.EllipticCurves Layer 7

Import the general discrete-module local-condition structure, its Selmer kernel and locally constant cohomology constructor, as well as the elliptic finite-level Selmer/Kummer/Sha exact sequences and transitions. Supply the comparison to the canonical continuous carrier on A=V/T.

### From ArithmeticGaloisDuality R02.4

Local Tate duality for V, W_M and T × W^* over finite extensions of ℚ_ℓ, ℝ and ℂ (Rubin, Theorem 4.1): perfect cup-product pairings into Φ, O/MO and D. The finite case is ClassFieldTheory's; the rational and lattice cases come through R02.1's limits. Include Poitou–Tate exactness and the restricted-product topology on local cohomology.

### From ArithmeticGaloisDuality D7

Use D7.1–D7.4's admissible compact/cofinite coefficients, derived continuous cochains, perfect-amplitude and derived local-duality maps. D7.5 supplies compact support as a localization fibre, the degree-three trace, derived Poitou–Tate duality and compact Euler characteristics under condition (P). Its target “Duality when p=2 and K has real places” supplies the complete Tate real-place correction and its duality in the unbounded derived category; ordinary global cochains are not truncated. After inverting 2 the real Tate terms vanish and the bounded rational comparison is restored. D7.6 supplies lattice/rational Poitou–Tate through adjoint finite-level transitions and the Milnor limit sequence. These contracts are used for §1.4, §2.21 and §§3.12–3.13; finite R02.4 duality alone does not supply them.

### From ArithmeticGaloisDuality R02.2

The Hochschild–Serre spectral sequence for I ⊆ G_K and Gal(K^ur/K) with ℚ_p-vector-space coefficients, in the degrees used to identify H¹(K^ur/K, H¹(I, V)) with H²(K, V) (Rubin, Corollary 3.3).

### From TauCetiRoadmap.ProfiniteCohomology Layer 11

cd_p of Gal(K^ur/K) ≅ Ẑ and of the inertia group at ℓ ≠ p is 1.

### From TauCetiRoadmap.ProfiniteCohomology Layer 12

Naturality of the cup product in the coefficients, for the compatibility of the local pairings along T → V, V^* → W^*, T ↠ W_M and W^*_M ↪ W^*. The projection formula cor(x ∪ res y) = cor(x) ∪ y, for the twisting isomorphism.

### From TauCetiRoadmap.LocalFieldsRamification Layer 4

For ℓ ≠ p, the inertia group has a unique maximal subgroup of pro-order prime to p, with quotient ℤ_p (the tame quotient). Also: H¹(I, T) is finitely generated over ℤ_p for ℓ ≠ p (Rubin Proposition B.2.7(iii)).

### From PadicMeasuresIwasawaAlgebras L1

Iwasawa algebras R⟦Γ⟧ for Γ ≅ ℤ_p^r × Δ: the isomorphism with R⟦X₁, …, X_r⟧[Δ], the involution ι and the twists Tw_k, and the regular sequence γ_i − 1 (Nekovář 8.4.1, 8.4.8.1).

### From TauCetiRoadmap.ProfiniteCohomology Layer 6

Double-coset (Mackey) form of restriction and corestriction, for the semilocal decomposition.

### From TauCetiRoadmap.ProfiniteCohomology Layer 7

Shapiro's lemma at finite level with corestriction transitions (Nekovář Lemma 8.1.5), and its double-coset form (Rubin Proposition B.4.2).

### From PadicMeasuresIwasawaAlgebras L5

Supply the perfect-complex/determinant functor, triangle multiplicativity, derived specialization and dualizing-complex conventions. Prove the signed height-one length formula under generic acyclicity. The required interface consists of these perfect-complex operations; finite generation alone is insufficient.

### From PadicMeasuresIwasawaAlgebras L4

Supply reflexivity/pseudo-null and almost-divisible dual criteria, and the dimension-two depth/Auslander–Buchsbaum implication: finitely generated torsion over O[[T]] with no finite submodule has projective dimension at most one. Use L6 quadratic presentations and their Fitting-ideal formulas to identify Fitting with characteristic.

### Required arithmetic étale comparison

The needed contract is the arithmetic K(π,1) comparison for p-primary lisse coefficients on Spec O_F[1/S], with p inverted, derived lattice coefficients and the modified real-place convention; also the stalk computation R^q j_*T=H^q(I_v,T) and its localization triangle. **Unsupplied contract.** SchemeAndStackFoundations SF.6 is an arithmetic handoff stage, without a target proving this comparison. SF.2’s field comparison does not apply to this arithmetic scheme, and an equivalence of finite étale covers alone does not imply the all-degree cohomology comparison. The exact additional arithmetic target is retained in §3.15.

### From TauCetiRoadmap.ClassFieldTheory Layer 11

Import global reciprocity, ideal-class finiteness and the abelian pro-p idèle quotient, with finite-place unit and norm/transfer compatibility; L4 constructs their Selmer/tower comparison.

### From TauCetiRoadmap.ProfiniteCohomology Layer 10

Import the already implemented all-degree discrete Shapiro map/isomorphism (TauCeti.ContinuousCohomology.shapiroMap, shapiroIso and shapiroIsoTopRep, current Shapiro/AllDegrees.lean). Supply only its complete finite-type coefficient extension and the corestriction transition square through the R02.1 coefficient-limit/compact derived-limit interface, before applying it to RΓ_Iw. Layer 7 alone supplies the low-degree discrete comparison.

### From PerfectoidSpaces and ArithmeticGaloisRepresentations

PerfectoidSpaces P1 supplies A_inf, Witt Frobenius, θ, its primitive kernel and completion/localization comparisons; P3 supplies the perfectoid structure of finite extensions needed for C_p. ArithmeticGaloisRepresentations R01.2 supplies purity and Weil–Deligne weights, including the weight −1 convention used in the bounded away-p localization theorem. These contracts do not identify Hodge–Tate signs with archimedean Hodge indices.

## How to read the build

Layer 0 establishes completion and coefficient-limit comparisons, including the procyclic criterion used by nonsingular conditions. Layer 1 treats annihilators and the parametric duality of fibres. Layer 2 constructs the Selmer diagrams and applies that duality to arithmetic cochains. Layer 3 passes to induced Iwasawa coefficients, computes control errors and determinants, then proves structure criteria under their explicit hypotheses. Layer 4 first supplies periods and finite conditions, then the archimedean criticality and cyclotomic arithmetic dictionary, and finally the specified applications. References within a layer follow this construction order; the parametric duality of Layer 1 is instantiated by the Layer 2 arithmetic fibre.

## Layer 0: Completions and coefficient limits

### 0.1 Comparison of the multiplicative completion with Mathlib adic completion

Import Mathlib AdicCompletion (p) A and its canonical map and functoriality. Identify its quotients with A/p^m A, or Aˣ/(Aˣ)^(p^m) in multiplicative notation, and identify AdicCompletion (p) ℤ with ℤ_p. Transport its module and inverse-limit topology through these identifications. The finitely generated tensor comparison is the existing ofTensorProduct theorem, not a new completion construction.

p prime; no finiteness on A for the definition. Rubin's Definition I.6.2 double-dual completion agrees with this Â for finitely generated A. No such agreement is asserted for general A: a p-divisible group has zero quotient-tower completion but can have nonzero p-primary characters. Example I.2.1 uses the inverse limit, which is the object used here.

The construction proceeds as follows. Definition: AdicCompletion (span {p}) A. ℤ_p ⊗ A ≅ Â for finitely generated A: AdicCompletion.ofTensorProduct_bijective_of_finite_of_isNoetherian over the Noetherian ring ℤ. AdicCompletion(p)ℤ ≅ ℤ_p: both are lim ℤ/p^m (PadicInt.toZModPow).

(Rubin (1999 draft), Chapter I, §2, Example 2.1, printed p. 3 (PDF p. 13); Rubin (1999 draft), Chapter I, §6.2, Definition 6.2, printed p. 14 (PDF p. 24).)

The named operations and identities are:

- `ker_toPCompletion` — ker(A → Â) = ⋂_m p^mA.
- `adicCompletion_int_equiv_padicInt` — AdicCompletion(p)ℤ ≅ ℤ_p, making Â a ℤ_p-module.

**Checks.**

- A finite group of order prime to p has Â = 0 (ℤ/2 with p = 3).
- ℤ̂ = ℤ_p: ℤ_p ⊗ ℤ → ℤ̂ is bijective.
- ℚ is p-divisible, so ℚ̂ = 0.
- For A=ℚ_p/ℤ_p, every A/p^mA is zero, so Â=0. The identity A→ℚ_p/ℤ_p is a nonzero p-primary character, and evaluation at a nonzero element gives a nonzero character double dual. Thus the double-dual and quotient-tower notions differ outside the finitely generated setting.
- For the free direct sum A=⨁_ℕ ℤ, ℤ_p ⊗ A → Â is not surjective (∑ p^i e_i is not a finite sum).
- For ℓ ≠ p, ℤ_ℓ is p-divisible, so its completion is 0 although ℤ_p ⊗_ℤ ℤ_ℓ ≠ 0.

Thus completion of Fˣ must retain its quotient tower when Fˣ is not finitely generated.

*Needs:* Mathlib `AdicCompletion`; Mathlib `AdicCompletion.of`; Mathlib `AdicCompletion.map`; Mathlib `AdicCompletion.ofTensorProduct`; Mathlib `AdicCompletion.ofTensorProduct_bijective_of_finite_of_isNoetherian`; Mathlib `PadicInt`; Mathlib `PadicInt.toZModPow`.

### 0.2 Completion of global units

For a number field F, the unit group E_F = 𝓞_F^× is finitely generated, so ℤ_p ⊗ E_F ≅ Ê_F; and the map Ê_F → (F^×)^ induced by E_F ⊆ F^× is injective, because E_F ∩ (F^×)^{p^m} = E_F^{p^m}: a p^m-th root in F of a unit is a unit.

F a number field, p prime, m ≥ 0.

Prove this as follows. E_F is finitely generated by Dirichlet's theorem (NumberField.Units.exist_unique_eq_mul_prod: every unit is torsion times a product of fundamental units); apply §0.1. If x ∈ F^× and x^{p^m} = u ∈ E_F, then x and x^{−1} are integral over 𝓞_F (IsIntegral.of_pow), so x ∈ E_F. Hence the subspace topology on E_F from the p-adic topology of F^× is its own p-adic topology, and the completion map is injective.

(Rubin (1999 draft), Chapter I, §6.2, Definition 6.2, printed p. 14 (PDF p. 24).)

The image is closed but not all of (F^×)^; the quotient (F^×)^/Ê_F involves the ideal group.

*Needs:* §0.1 (Comparison of the multiplicative completion with Mathlib adic completion); Mathlib `NumberField.Units.exist_unique_eq_mul_prod`; Mathlib `IsIntegral.of_pow`; Mathlib `NumberField.RingOfIntegers`.

### 0.3 Completion of S-units

For a number field F and a finite set S of places containing the archimedean ones, 𝓞_{F,S}^× is finitely generated, so ℤ_p ⊗ 𝓞_{F,S}^× ≅ (𝓞_{F,S}^×)^, and (𝓞_{F,S}^×)^ → (F^×)^ is injective.

S finite, containing the archimedean places.

Prove this as follows. Finite generation is Dirichlet's S-unit theorem (GlobalNumberFields Layer 6). An element of F^× whose p^m-th power is an S-unit has valuation zero outside S, so it is an S-unit; apply §0.2.

(Rubin (1999 draft), Chapter I, §6.2, Definition 6.2, printed p. 14 (PDF p. 24).)

For S = S_∞ this is §0.2.

*Needs:* §0.1 (Comparison of the multiplicative completion with Mathlib adic completion); §0.2 (Completion of global units); TauCetiRoadmap.GlobalNumberFields Layer 6.

### 0.4 Local completion and algebraic tensor comparison

Import A(K)=lim_m Kˣ/(Kˣ)^(p^m) and its p-adic module from the current LocalGaloisGroups Layer 7 suggested file, whose carrier is defined for arbitrary fields. Its free-quotient rank [K:ℚ_p]+1 requires K/ℚ_p finite; for ℓ≠p use LocalFieldsRamification Layer 1’s multiplicative decomposition instead. Identify it with the L0 Mathlib completion through their common quotient tower. For K/ℚ_ℓ finite the canonical Kˣ⊗ℤℤ_p→A(K) is surjective and not injective: valuation contributes ℤ_p; principal units contribute their p-adic completion, not their algebraic tensor product. For ℓ=p the noninjectivity includes a⊗1−1⊗a in ℤ_p⊗ℤℤ_p with a∉ℚ; for ℓ≠p the nonzero tensor of the pro-ℓ unit factor is killed by completion.

K/ℚ_ℓ finite, ℓ any prime (ℓ = p allowed).

Prove this as follows. Import the valuation/unit decomposition and A(K) from the current LocalGaloisGroups roadmap; construct the comparison through the quotient tower, without a second local completion carrier. The finite roots-of-unity factor and valuation factor are in the tensor image. For ℓ=p, multiplication ℤ_p⊗ℤℤ_p→ℤ_p is onto; for ℓ≠p multiplication by p is invertible on principal units, so their completion vanishes. Rationalize the principal-unit tensor factor to prove the asserted kernel is nonzero; the same argument embeds the ℓ=p antisymmetric tensor in ℚ_p⊗ℚℚ_p.

(Rodrigues Jacinto–Williams (arXiv v2), §10.5, (10.8), printed p. 53 (arXiv v2).)

For ℓ ≠ p, the kernel contains U^1_K ⊗ ℤ_p ≠ 0.

*Needs:* §0.1 (Comparison of the multiplicative completion with Mathlib adic completion); TauCetiRoadmap.LocalFieldsRamification Layer 1; TauCetiRoadmap.LocalGaloisGroups Layer 7.

### 0.5 Profinite topology on the local Kummer comparison

Use the current Tau Ceti theorem finiteIndex_range_powMonoidHom for K/ℚ_ℓ finite and n≥1, and the current kummerIso, to put the finite discrete topology on Kˣ/(Kˣ)^(p^m) and H¹(K,μ_(p^m)). Their compatible Kummer isomorphisms induce a homeomorphism of inverse limits. This comparison supplies the topology, not the already implemented power-class finiteness.

K/ℚ_ℓ finite; n ≥ 1.

Prove this as follows. Take finite power quotients and finite-level Kummer isomorphisms from the current library, exposed through the upstream supplier interface. Endow both towers with finite discrete topologies. Compatibility identifies the closed subsets of products defining the inverse limits. The resulting algebraic isomorphism and its inverse are continuous by the inverse-limit universal property.

(Rubin (1999 draft), Appendix B, §2, Proposition 2.7, printed p. 153 (PDF p. 163).)

For global F, F^×/(F^×)^n is infinite; this is why the global limit is not profinite.

*Needs:* Tau Ceti `TauCeti.powerClassQuotient`; TauCetiRoadmap.LocalFieldsRamification Layer 1; TauCetiRoadmap.ProfiniteCohomology Layer 9.

### 0.6 The limit Kummer map

For a field K with p invertible, κ_∞ : lim_m K^×/(K^×)^{p^m} → lim_m H^1(G_K, μ_{p^m}) is the limit of the Kummer class maps (TauCeti.kummerClassMap) along the coefficient transition square specified in Scope and ownership. It is bijective by the finite-level Kummer isomorphisms and their coefficient-transition square.

p invertible in K.

The construction proceeds as follows. Levelwise injectivity (TauCeti.kummerClassMap_injective) passes to inverse limits. Levelwise bijectivity (Hilbert 90) gives an isomorphism of inverse systems, hence of limits.

(Rodrigues Jacinto–Williams (arXiv v2), §10.5, display (10.7), printed p. 52 (arXiv v2).)

The named operations and identities are:

- `kummerLimit_injective` — κ_∞ is injective.
- `kummerLimit_bijective` — κ_∞ is bijective given Hilbert 90 at every level.
- `kummerLimit_res` — For finite separable L/K with an embedding, κ_∞ commutes with restriction and the inclusion Kˣ → Lˣ.
- `kummerLimit_cor` — κ_∞ carries the norm N_{L/K} to corestriction.
- `kummerLimit_zp_linear` — κ_∞ is ℤ_p-linear.

**Checks.**

- K separably closed: both sides are 0.
- K=ℝ, p=2, m≥1: ℝˣ/(ℝˣ)^(2^m) ≅ ℤ/2 ≅ H¹(ℤ/2,μ_(2^m)); both inverse limits are ℤ/2.
- K=𝔽_q, p∤q: both inverse limits are the p-primary part of 𝔽_qˣ, using arithmetic Frobenius and multiplication-by-p coefficient transitions.
- K = ℚ: the limit is not ℤ_p ⊗ ℚ^× (§0.1, pCompletion_free_infinite).

The limit is taken of groups; topologies are compared in §0.8.

*Needs:* Tau Ceti `explicitCoeff1_kummerCoeffPow_kummerMap` (Scope and ownership); §0.1 (Comparison of the multiplicative completion with Mathlib adic completion); Tau Ceti `TauCeti.kummerClassMap`; Tau Ceti `TauCeti.kummerClassMap_injective`; Tau Ceti `TauCeti.powerClassQuotient`; TauCetiRoadmap.ProfiniteCohomology Layer 9.

### 0.7 The system μ_{p^m}(K) is Mittag-Leffler

For any field K, the inverse system m ↦ μ_{p^m}(K) = H^0(G_K, μ_{p^m}) with the p-th power maps consists of finite groups (at most p^m elements), so it is Mittag-Leffler and lim^1_m H^0(G_K, μ_{p^m}) = 0.

K any field with p invertible.

Prove this as follows. μ_{p^m}(K) has at most p^m elements (card_rootsOfUnity). A system of finite sets is Mittag-Leffler (CategoryTheory.Functor.isMittagLeffler_of_exists_finite_range). lim^1 of a Mittag-Leffler system of groups vanishes (ArithmeticGaloisDuality R02.1).

(Rubin (1999 draft), Appendix B, §2, Proposition 2.3, printed p. 152 (PDF p. 162).)

This is the finiteness hypothesis of Rubin's Proposition B.2.3 for i = 1.

*Needs:* Mathlib `card_rootsOfUnity`; Mathlib `rootsOfUnity`; Mathlib `CategoryTheory.Functor.isMittagLeffler_of_exists_finite_range`; ArithmeticGaloisDuality R02.1 (`mittag-leffler-lim-one`).

### 0.8 The p-adic Kummer identification

For a field K with p invertible, H^1(G_K, ℤ_p(1)) ≅ lim_m K^×/(K^×)^{p^m} = (K^×)^, where ℤ_p(1) = lim μ_{p^m} is a compact coefficient module and H^1 is continuous-cochain cohomology (ArithmeticGaloisDuality R02.1). The map is H^1(G_K, ℤ_p(1)) → lim_m H^1(G_K, μ_{p^m}), an isomorphism because the Milnor term lim^1 H^0(G_K, μ_{p^m}) vanishes, followed by κ_∞^{−1}. It is an algebraic isomorphism for every K; when every K^×/(K^×)^{p^m} is finite (local fields) both sides are profinite and it is a homeomorphism. It is compatible with restriction and with corestriction versus the norm for finite separable extensions.

p invertible in K. No finite generation of K^× is assumed; the target is the completion, not K^× ⊗ ℤ_p.

Prove this as follows. Milnor sequence 0 → lim^1 H^0(G_K, μ_{p^m}) → H^1(G_K, ℤ_p(1)) → lim H^1(G_K, μ_{p^m}) → 0 (ArithmeticGaloisDuality R02.1; Rubin Proposition B.2.3). §0.7 kills the lim^1 term. §0.6 identifies the limit with (K^×)^. For local K, §0.5 makes both sides profinite, and a continuous bijection of compact Hausdorff groups is a homeomorphism.

(Rubin (1999 draft), Chapter I, §2, Example 2.1, printed p. 3 (PDF p. 13); Rubin (1999 draft), Appendix B, §2, Proposition 2.3, printed p. 152 (PDF p. 162); Rodrigues Jacinto–Williams (arXiv v2), §10.5, display (10.7), printed p. 52 (arXiv v2).)

For K = ℚ the identification holds with the completion, and ℚ^× ⊗ ℤ_p → H^1(G_ℚ, ℤ_p(1)) is not surjective.

*Needs:* §0.6 (The limit Kummer map); §0.7 (The system μ_{p^m}(K) is Mittag-Leffler); §0.5 (Profinite topology on the local Kummer comparison); ArithmeticGaloisDuality R02.1 (`milnor-sequence`); ArithmeticGaloisDuality R02.1 (`carrier-comparison`).

### 0.9 The Kummer identification for S-units

Let F be a number field and S a finite set of places containing those above p and ∞. Then H^1(G_{F,S}, ℤ_p(1)) ≅ ℤ_p ⊗ 𝓞_{F,S}^×, compatibly with restriction to finite extensions inside F_S and with corestriction versus the norm.

S ⊇ {v | p∞}, so μ_{p^m} is a G_{F,S}-module and p is an S-unit.

Prove this as follows. The Kummer sequence for G_{F,S}: 0 → 𝓞_{F,S}^×/p^m → H^1(G_{F,S}, μ_{p^m}) → Pic(𝓞_{F,S})[p^m] → 0 (ArithmeticGaloisDuality R02.3). Pass to the limit: §0.7 removes lim^1 H^0; the terms 𝓞_{F,S}^×/p^m are finite; lim_m Pic[p^m] = T_p Pic = 0 because Pic(𝓞_{F,S}) is finite. lim 𝓞_{F,S}^×/p^m = ℤ_p ⊗ 𝓞_{F,S}^× (§0.3).

(Burungale–Tian (arXiv v2), Footnote 3 to Theorem 2.1, p. 4, and §2.2.3 (arXiv v2); Rubin (1999 draft), Appendix B, §2, Proposition 2.3, printed p. 152 (PDF p. 162).)

This is the finite-level statement behind Burungale–Tian's units-kummer item; the tower limit belongs to L3.

*Needs:* §0.7 (The system μ_{p^m}(K) is Mittag-Leffler); §0.3 (Completion of S-units); ArithmeticGaloisDuality R02.1 (`milnor-sequence`); ArithmeticGaloisDuality R02.3 (`s-unit-kummer-sequence`).

### 0.10 Which inverse-limit hypotheses hold

For every field K with char K≠p, the μ_(p^m)(K) tower is finite and hence Mittag–Leffler. The H¹(K,μ_(p^m)) tower is Mittag–Leffler for every such K as well: under finite-level Kummer its transitions are the surjections Kˣ/(Kˣ)^(p^(m+1))→Kˣ/(Kˣ)^(p^m). Thus both H¹(K,ℤ_p(1)) and H²(K,ℤ_p(1)) have their ordinary inverse-limit descriptions. For G_(F,S), S⊇{p,∞}, finite H¹ gives Mittag–Leffler separately. Infinite cardinality of the full number-field H¹ does not obstruct Mittag–Leffler; surjectivity proves it.

p invertible; F a number field; S finite.

Prove this as follows. H⁰: use §0.7. H¹ for the full G_K: finite-level Kummer and kummer-level-compatibility identify transitions with surjective quotient maps. Apply the supplier Mittag–Leffler theorem, without assuming finiteness. H¹ for G_(F,S): use finite restricted-ramification cohomology. Apply the imported Milnor exact sequences in degrees one and two; other coefficient towers require their own hypotheses.

(Rubin (1999 draft), Appendix B, §2, Proposition 2.3, printed p. 152 (PDF p. 162); Rubin (1999 draft), Appendix B, §2, Proposition 2.7, printed p. 153 (PDF p. 163).)

Consumers must cite (b) or (c) before interchanging H^2 and limits.

*Needs:* §0.7 (The system μ_{p^m}(K) is Mittag-Leffler); §0.5 (Profinite topology on the local Kummer comparison); §0.9 (The Kummer identification for S-units); ArithmeticGaloisDuality R02.1 (`milnor-sequence`); Tau Ceti `explicitCoeff1_kummerCoeffPow_kummerMap` (Scope and ownership); ArithmeticGaloisDuality R02.1 (`mittag-leffler-lim-one`); §0.6 (The limit Kummer map).

### 0.11 Cup products and Shapiro under p-adic Kummer

The p-adic Kummer equivalence intertwines restriction with extension of scalars, corestriction with the field norm, and cup product with the inverse limit of the finite μ_(p^m) cup products. For a finite separable extension L/K, Shapiro followed by evaluation at the identity identifies the induced Kummer class with its L-class; composing the induced-coefficient trace with Shapiro is norm/corestriction. In particular cor(κ_L(a)∪res x)=κ_K(N_(L/K)a)∪x. The cup target is H²(K,ℤ_p(1)⊗ℤ_p M), not H²(K,M) without a twist.

char K≠p; L/K finite separable; M finite or compact finite free, with the continuous tensor product and coefficient comparison supplied by ArithmeticGaloisDuality.

Prove this as follows. Use the finite connecting-map squares and the upstream Kummer norm/restriction identities. Apply cup naturality and the projection formula at every finite coefficient level; pass through the Milnor comparison with the actual derived-limit term when it does not vanish. Use Shapiro evaluation and its trace/corestriction compatibility at finite level, then the coefficient-limit comparison. No new cup or Shapiro theory is introduced.

(Rubin (1999 draft), Appendix B §§4–5, pp. 155–158; Chapter I Example 2.1, p. 3.)

**Checks.**

- For L=K, Shapiro and the norm are the identity.
- For x=κ_K(b), the formula has the Tate-twist-two cup target.
- For a base-field a, κ_K(N a)=[L:K]κ_K(a), so replacing corestriction by restriction fails.

*Needs:* §0.8 (The p-adic Kummer identification); ArithmeticGaloisDuality R02.1 (`cochains-inverse-limit`); TauCetiRoadmap.ProfiniteCohomology Layer 7; TauCetiRoadmap.ProfiniteCohomology Layer 12.

### 0.12 Weak semisimplicity at the invariant eigenvalue

For a finite-type ℤ_p-module or finite-dimensional ℚ_p-space M with continuous action of a procyclic group Γ=Ẑ, let can:M^Γ→M_Γ be inclusion followed by quotient. M is weakly semisimple when can is an isomorphism. With a topological generator σ, this is the direct decomposition M=ker(σ−1)⊕im(σ−1); it is weaker than semisimplicity of every eigenvalue. Supply the same definition after restriction of an O-action to ℤ_p.

Γ procyclic; continuity in the natural p-adic topology; finite type for integral modules.

The construction proceeds as follows. For a topological generator σ, continuity and closedness of ker(σ−1) and im(σ−1) in a finite-type p-adic module identify invariants and continuous coinvariants with this kernel and cokernel. The decomposition is elementary linear algebra; no finite-index descent theorem is used. Define the canonical map, independent of generator. Kernel zero and surjectivity are exactly the direct decomposition. Transport through equivariant isomorphisms and direct sums.

(Liu–Tian–Xiao–Zhang–Zhu, Definition 2.1.2, p. 121.)

The named operations and identities are:

- `IsWeaklySemisimple` — can:M^Γ→M_Γ is bijective.
- `weaklySemisimple_iff_split` — Equivalent to ker(σ−1)⊕im(σ−1)=M.
- `weaklySemisimple_congr` — An equivariant module equivalence preserves the condition.
- `weaklySemisimple_sum` — Finite direct sums are weakly semisimple iff every summand is.

**Checks.**

- The trivial action is weakly semisimple, with can=id.
- The linear invariants-to-coinvariants criterion fails for σ=[[1,1],[0,1]] on ℚ²; its invariant line maps to zero. The same computation holds over ℚ_p² with the continuous procyclic unipotent action.
- The linear criterion holds for σ=[[2,1],[0,2]] on ℚ² because σ−1 is invertible, although σ is not semisimple. The same computation applies over ℚ_p for p odd.

*Needs:* §0.1 (Comparison of the multiplicative completion with Mathlib adic completion).

### 0.13 Procyclic invariants and integral lifting

For finite-type integral M with procyclic Γ: M_Γ=0 implies M^Γ=0; surjectivity of can:M^Γ→M_Γ implies bijectivity. Weak semisimplicity is preserved by equivariant subquotients and finite sums. If M is a free O-lattice, M/λM is weakly semisimple and dim_E(M⊗E)^Γ≥dim_k(M/λM)^Γ, then equality holds and M is weakly semisimple.

O the integers of E/ℚ_p; λ a uniformizer; M free for the last assertion.

Prove this as follows. For coinvariants zero, σ−1 is a surjective endomorphism of a Noetherian module, hence injective. Apply this to the image summand to prove the surjective-can criterion. Use the induced invariant/image splitting for subquotients and finite sums. Reduction bounds the invariant rank above by the residual invariant dimension; the assumed opposite inequality forces equality. Lift the invariant summand and apply Nakayama to its complement, following Lemma 2.1.5.

(Liu–Tian–Xiao–Zhang–Zhu, Lemmas 2.1.3–2.1.5, pp. 121–123.)

**Checks.**

- M=ℤ_p with σ=1+p has rational invariants zero and residual invariants one, so the dimension hypothesis fails and can is not bijective.
- The residual unipotent two-dimensional action fails the §0.12 hypothesis.
- The trivial free rank-r action satisfies both dimensions r and can=id.

*Needs:* §0.12 (Weak semisimplicity at the invariant eigenvalue).

### Examples

For ℚ with p=3, completion kills the sign and completes the free valuation lattice: lim_m ⨁_ℓ ℤ/3^m is the restricted family (a_ℓ)∈∏_ℓ ℤ₃ whose valuations tend to infinity. The family with coefficient 3^i at the ith prime has infinite support, so it lies in completion but not in ℤ₃⊗ℚ×. A 3^m-th root in ℚ of an integer unit has zero valuation at every prime and is again a unit. The same valuation argument at primes outside S gives S-unit injectivity.

For the endomorphism σ=1 on a vector space the invariant-to-coinvariant map is the identity. For the size-two unipotent Jordan block its kernel and range both contain the first basis vector, so that vector maps to zero in coinvariants and weak semisimplicity fails. For a Jordan block with eigenvalue 2 over ℚ, σ−1 is invertible and both invariant and coinvariant spaces vanish: weak semisimplicity holds although the block is not semisimple.

### Dependencies

The supplier interfaces above: ArithmeticGaloisDuality R02.1 (`carrier-comparison`); ArithmeticGaloisDuality R02.1 (`cochains-inverse-limit`); ArithmeticGaloisDuality R02.1 (`milnor-sequence`); ArithmeticGaloisDuality R02.1 (`mittag-leffler-lim-one`); ArithmeticGaloisDuality R02.3 (`s-unit-kummer-sequence`); Mathlib `AdicCompletion.map`; Mathlib `AdicCompletion.ofTensorProduct_bijective_of_finite_of_isNoetherian`; Mathlib `AdicCompletion.ofTensorProduct`; Mathlib `AdicCompletion.of`; Mathlib `AdicCompletion`; Mathlib `CategoryTheory.Functor.isMittagLeffler_of_exists_finite_range`; Mathlib `IsIntegral.of_pow`; Mathlib `NumberField.RingOfIntegers`; Mathlib `NumberField.Units.exist_unique_eq_mul_prod`; Mathlib `PadicInt.toZModPow`; Mathlib `PadicInt`; Mathlib `card_rootsOfUnity`; Mathlib `rootsOfUnity`; Tau Ceti `TauCeti.kummerClassMap_injective`; Tau Ceti `TauCeti.kummerClassMap`; Tau Ceti `TauCeti.powerClassQuotient`; TauCetiRoadmap.GlobalNumberFields Layer 6; TauCetiRoadmap.LocalFieldsRamification Layer 1; TauCetiRoadmap.LocalGaloisGroups Layer 7; TauCetiRoadmap.ProfiniteCohomology Layer 12; TauCetiRoadmap.ProfiniteCohomology Layer 7; TauCetiRoadmap.ProfiniteCohomology Layer 9.

## Layer 1: Orthogonal conditions and duality

### 1.1 Perfect pairings and dual local conditions

Let O be the ring of integers of a finite extension Φ of ℚ_p, D = Φ/O, and b : X × X′ → Y a bilinear pairing of O-modules (Y = Φ, O/MO or D). For an O-submodule F ⊆ X, write F^⊥ for its annihilator. Applied to the local Tate pairings H¹(K, A) × H¹(K, A^*) → Y for A = V, W_M, T and A^* = V^*, W^*_M, W^* (Rubin, Theorem 4.1), F^⊥ is the dual local condition F^* of Mazur–Rubin, Definition 1.6.

b bilinear; perfectness, where used, is a hypothesis of the lemma that uses it.

The additional perfect-pairing theory proceeds as follows. If b gives the specified character-dual identifications and X is finite, a finite-dimensional Φ-space, or a finitely generated O-module paired perfectly with a cofinitely generated one, then F^⊥⊥ = F: in the last case every finitely generated submodule is closed, and Pontryagin duality applies. Image and preimage: if π : X → Z and ι : Z′ → X′ are adjoint (b_Z(π x, z′) = b(x, ι z′)), then (π F)^⊥ = ι^{−1}(F^⊥); dually (π^{−1} G)^⊥ = ι(G^⊥) when b and b_Z are perfect. Counting: for X finite and b perfect, #F · #F^⊥ = #X; for Φ-spaces, dim F + dim F^⊥ = dim X. If F^⊥ = F′, then b induces a perfect pairing (X/F) × F′ → Y.

(Rubin (1999 draft), Chapter I, §4, Theorem 4.1, printed p. 8 (PDF p. 18); Mazur–Rubin (arXiv v1), §1, Definition 1.6, p. 5 (arXiv v1).)

The named operations and identities are:

- `IsPerfect` — Both curried linear maps are bijective in the algebraic prototype. The finite signature specializes to modules over ℤ/n with target ℤ/n; arithmetic continuous perfectness uses the appropriate topological dual instead.
- `orthogonal_orthogonal` — F^⊥⊥ = F for perfect pairings of finite modules, of Φ-spaces, and of finitely generated O-modules against cofinitely generated ones.
- `orthogonal_map_eq_comap` — (π F)^⊥ = ι^{−1}(F^⊥) for adjoint π, ι.
- `orthogonal_comap_eq_map` — (π^{−1} G)^⊥ = ι(G^⊥) for adjoint π, ι and perfect pairings.
- `card_mul_card_orthogonal` — #F · #F^⊥ = #X for finite X, b perfect.
- `quotientPairing_perfect` — For a perfect pairing in the finite, finite-dimensional or compact/discrete dual categories above, F^⊥=F′ induces a perfect pairing (X/F)×F′→Y, with the quotient and dual topologies retained.

**Checks.**

- For a perfect pairing, X^⊥ = 0 and 0^⊥ = X′.
- The standard pairing ℤ/p × ℤ/p → ℤ/p: 0^⊥ = ℤ/p and (ℤ/p)^⊥ = 0; the pairing on (ℤ/p)² with F the first axis gives F^⊥ the second axis.
- K = ℚ_ℓ with ℓ ≠ p and ℓ ≢ 1 (mod p): H¹(K, ℤ/p) ≅ ℤ/p is all unramified, and its orthogonal complement in H¹(K, μ_p) = K^×/K^{×p} ≅ ℤ/p is 0, which is H¹_ur(K, μ_p) = 𝒪_K^×/𝒪_K^{×p}.
- For the zero pairing F^⊥ = X′ for every F, so F^⊥⊥ = X ≠ F whenever F ≠ X.
- The pairing ℤ×ℤ→ℤ given by (x,y)↦3xy is nondegenerate, but its curried maps have image 3ℤ and are not bijective. Thus it fails `IsPerfect`.
- The unique pairing between two zero modules is perfect, including both surjectivity requirements.

Perfectness means that the curried maps identify each argument with the appropriate algebraic or continuous character dual of the other. Bilinear nondegeneracy alone is insufficient: the zero pairing has F^⊥=X′ for every F, and a nonperfect injection need not give the quotient-dual comparison.

*Needs:* Mathlib `Submodule.orthogonalBilin`; Mathlib `PontryaginDual`; Mathlib `Submodule.map_le_iff_le_comap`.

### 1.2 Compatibility of the local pairings for T, V, W and W_M

Let K be a finite extension of ℚ_ℓ, ℝ or ℂ and T a p-adic representation of G_K. The local Tate pairings of Rubin's Theorem 4.1 are compatible with the coefficient maps: for c ∈ H¹(K, T) and d ∈ H¹(K, V^*), ⟨φ(c), d⟩ = ⟨c, φ^*(d)⟩ in D, where φ : H¹(K, T) → H¹(K, V) and φ^* : H¹(K, V^*) → H¹(K, W^*); and for c ∈ H¹(K, T), d ∈ H¹(K, W^*_M), ⟨π_M(c), d⟩_M = ⟨c, ι_M(d)⟩ in O/MO ⊆ D, where π_M : T ↠ W_M = M^{−1}T/T and ι_M : W^*_M ↪ W^*.

The pairings of Rubin's Theorem 4.1, perfect by ArithmeticGaloisDuality's local duality.

Prove this as follows. Each pairing is cup product followed by the invariant map, so the identities are the naturality of the cup product in the coefficients (ProfiniteCohomology Layer 12) together with the compatibility of the invariant maps H²(K, Φ(1)) → Φ, H²(K, D(1)) → D and H²(K, O(1)/M) → O/MO with the maps O(1)/M ↪ D(1) and Φ(1) ↠ D(1). For the lattice and rational pairings, the continuous cochains and limits are those of ArithmeticGaloisDuality R02.1.

(Rubin (1999 draft), Chapter I, §4, proof of Proposition 4.3, printed p. 9 (PDF p. 19).)

Each identity uses its specified coefficient pairing and the supplier's compatible invariant maps.

*Needs:* ArithmeticGaloisDuality R02.4; ArithmeticGaloisDuality R02.1 (`continuous-section-long-exact`); TauCetiRoadmap.ProfiniteCohomology Layer 12.

### 1.3 Local conditions and derived orthogonal complements

Given actual local cochain complexes C_X,C_Y with the supplier perfect degree-two cup duality and maps U_X^+→C_X, U_Y^+→C_Y, include a chosen nullhomotopy of their cup product as orthogonality data. Put U_Y^−=Cone(U_Y^+→C_Y). The adjoint U_X^+→RHom(U_Y^−,J)[−2] defines Err_v as its cone. Derived complementarity means Err_v is acyclic; H¹-annihilation alone does not imply it. For complementary finite-free coefficient subcomplexes X^+,Y^+ under X⊗Y→J(1), the coefficient adjoint X/X^+→D_J(Y^+)(1) gives the vanishing criterion.

Bounded local conditions and coefficient finiteness/cofiniteness satisfying Nekovář 6.2.5; p=2 real places use the supplier modified complexes, or exclude real places. J is the chosen injective or dualizing coefficient complex.

The construction proceeds as follows. Form the actual cones and the chain-level adjoint using the nullhomotopy. Define the error cone and its long exact sequence; derive the comparison with ordinary H¹ annihilators only under the necessary H⁰/H² hypotheses. For elementary subcomplexes, use the supplier derived local duality and the coefficient exact triangle to identify the error with the cohomology of the coefficient adjoint cone.

(Nekovář, §§6.2.1–6.2.7, pp. 137–140; §6.7, pp. 151–154.)

The named operations and identities are:

- `LocalConditionMorphism` — A morphism U^+→C on the actual continuous cochain carrier.
- `localMinus` — The cone of U^+→C.
- `localDualError` — Cone of the cup-adjoint U_X^+→D(U_Y^−)[−2].
- `derivedComplement_iff` — Derived complementarity iff the error cone is acyclic.
- `localDualError_congr` — Compatible quasi-isomorphisms and nullhomotopies give equivalent error cones.

**Checks.**

- The zero and identity local-condition maps are derived complements under perfect local duality.
- Adding a nonzero degree-zero complex with zero map to U^+ leaves its H¹ image unchanged but changes the error cone.
- For a zero coefficient pairing on nonzero modules, H¹ cup annihilation does not produce complementary derived local conditions.

*Needs:* ArithmeticGaloisDuality D7 (`derived-local-duality`); §1.1 (Perfect pairings and dual local conditions).

### 1.4 Duality for a global mapping fibre with local conditions

Let F_X=Fib(C_global(X)⊕⊕U_X,v^+→⊕C_v(X)), and F_Y similarly, with the arrow res−i and pairings/nullhomotopies as in §1.3. Transport the ArithmeticGaloisDuality D7 global compact-support duality to a map F_X→D_J(F_Y)[−3]. Its error triangle has third vertex ⊕_v Err_v. It is an isomorphism if the local adjoints are quasi-isomorphisms, and otherwise the error cone remains in the statement. This L1 theorem is parametric in local-condition maps; L2 instantiates it, avoiding an L1→L2 dependency.

Finite S; bounded admissible complexes with the supplier’s finite/cofinite or dualizing coefficient hypotheses; condition (P): p is odd or F has no real places. Chain-level orthogonality data, not just orthogonal H¹ subspaces. For p=2 with real places this construction/theorem requires ArithmeticGaloisDuality D7.5’s modified real-place compact-support duality.

Prove this as follows. Import the compact-support triangle and its perfect degree-three duality. Use the local nullhomotopies to define the fibre pairing; use the octahedral axiom on the global and local duality triangles. Identify the remaining cone with the finite direct sum of local adjoint cones (Nekovář 6.3.4). Take cohomology for the exact error sequence.

(Nekovář, Theorem 6.3.4, pp. 142–143.)

**Checks.**

- Over a field, complementary conditions pair H^i(F_X) with H^(3−i)(F_Y), rather than degree 2−i.
- A nonacyclic Err_v is retained even if the H¹ local conditions annihilate each other.
- At p=2 with a real place, the unmodified compact-support complex is not an allowed substitution.

*Needs:* §1.3 (Local conditions and derived orthogonal complements); ArithmeticGaloisDuality D7 (`derived-global-duality`); ArithmeticGaloisDuality D7 (`compact-support-cochains`).

### 1.5 Strict ordinary and inertia ordinary annihilators

For a perfect Tate-dual pairing M×M^*(1) and saturated G_v-stable M^+⊂M, put M^−=M/M^+ and (M^*(1))^+=ann(M^+). The strict ordinary condition is im H¹(G_v,M^+) = ker(H¹(G_v,M)→H¹(G_v,M^−)); its dual is the corresponding strict ordinary condition for the dual coefficient filtration, whenever derived coefficient complements and their exact cohomology hypotheses hold. The inertia ordinary condition ker(H¹(G_v,M)→H¹(I_v,M^−)) contains it, with quotient exactly im[H¹(G_v,M)→H¹(G_v,M^−)]∩H¹_ur(G_v,M^−). Thus its annihilator is a subcondition of the strict dual, cut out by pairing with this correction. Equality requires this correction to vanish.

The quotient and dual lattice must be saturated/finite free in the compact case. Perfect local Tate pairings are imported; no assumed universal equality between strict and inertia ordinary conditions. In this derived-pairing notation M^*(1) is the coefficient-appropriate untwisted linear dual followed by the Tate twist; for a lattice paired with a discrete module the target is E/O. Rubin’s separate star notation already includes its Tate twist.

Prove this as follows. Use the long exact sequence for 0→M^+→M→M^−→0 to identify the strict image with the kernel. Use inflation–restriction for I_v to compute the difference between the two kernels. Apply §1.3 to complementary coefficients; identify the dual of the larger condition by orthogonality to the calculated correction.

(Nekovář, §6.7.1–6.7.6, pp. 151–153; §8.9.6–8.9.7, pp. 240–244.)

**Checks.**

- M^+=M gives the relaxed condition and strict dual.
- M^+=0 gives strict zero but inertia unramified; these differ when H¹_ur(M)≠0.
- For M^− trivial rational at p, H¹_ur(M^−) has dimension one, so it cannot be dropped.

*Needs:* §1.3 (Local conditions and derived orthogonal complements); ArithmeticGaloisDuality R02.1 (`continuous-section-long-exact`); ArithmeticGaloisDuality R02.2 (`compact-five-term`).

### 1.6 Nonsingular torsion classes away from p

For K/ℚ_ℓ finite with ℓ≠p and a finite O-torsion G_K-module R, define H¹_ns as the kernel of the singular map H¹(K,R)→H¹(I_K,R)^(Fr=1). This is H¹_ur and the map is surjective, by residue cohomological dimension one. The cup pairing H¹_ns(K,R)×H¹_ns(K,R^∨(1))→E/O vanishes. This assertion is annihilation, not exact complementarity for arbitrary ramified R; exactness for unramified finite modules comes from the supplier theorem.

Finite torsion R; Tate dual is Hom_O(R,E/O)(1).

Prove this as follows. Apply the inertia Hochschild–Serre edge sequence with vanishing residue H². Identify nonsingular classes with inflated residue H¹. Their cup factors through residue H² of the Tate coefficient, which vanishes. Invoke exact-annihilator theory only with its separate unramified hypotheses.

(Liu–Tian–Xiao–Zhang–Zhu, Definition 2.2.2 and Lemma 2.2.3, p. 124.)

*Needs:* ArithmeticGaloisDuality R02.2 (`hochschild-serre-spectral-sequence`); ArithmeticGaloisDuality R02.4 (`unramified-exact-annihilators`).

### Examples

Over ℤ/5 take b(x,y)=xy. The orthogonal of zero is the whole module and that of the whole module is zero. For the standard dot product on (ℤ/5)², the first coordinate line has second coordinate line as orthogonal, and double orthogonal recovers the original line. The zero bilinear pairing fails perfectness and does not recover a nonzero proper submodule by double orthogonal.

If the ordinary quotient has a one-dimensional unramified invariant with Frobenius 1, an inertia-kernel class can survive in quotient H¹. The strict image condition and Greenberg inertia condition therefore differ. The boundary H⁰ term in their comparison measures this difference. A zero complex under local duality stays zero after shift [−2]; global duality uses [−3], witnessed by the degree pairing H¹ with H².

### Dependencies

Layers 0 and the supplier interfaces above: ArithmeticGaloisDuality D7 (`compact-support-cochains`); ArithmeticGaloisDuality D7 (`derived-global-duality`); ArithmeticGaloisDuality D7 (`derived-local-duality`); ArithmeticGaloisDuality R02.1 (`continuous-section-long-exact`); ArithmeticGaloisDuality R02.2 (`compact-five-term`); ArithmeticGaloisDuality R02.2 (`hochschild-serre-spectral-sequence`); ArithmeticGaloisDuality R02.4; ArithmeticGaloisDuality R02.4 (`unramified-exact-annihilators`); Mathlib `PontryaginDual`; Mathlib `Submodule.map_le_iff_le_comap`; TauCetiRoadmap.ProfiniteCohomology Layer 12.

## Layer 2: Selmer structures and complexes

### 2.1 Compact and rational Selmer data

Extend the general discrete Selmer interface imported from Tau Ceti EllipticCurves Layer 7 to compact lattice T and rational V cohomology, and compare coefficient propagation on A=V/T with that interface. Selmer data over a commutative ring R indexed by a set of places ι: a global R-module H (for example H^1(G_{K,Σ}, M)), local R-modules H_v (for example H^1(K_v, M)), R-linear localisation maps res_v : H → H_v, and local conditions L_v ⊆ H_v (R-submodules). Modifications replace the conditions: relaxed (L_v = H_v) on a set of places, strict (L_v = 0) on a set of places.

The module-theoretic diagram admits compact and rational cohomology through ArithmeticGaloisDuality R02.1, with coefficient-change maps to A=V/T.

The construction proceeds as follows. Use the supplier’s discrete datum without introducing a second discrete carrier. Instantiate the same module-theoretic localization diagram with compact/rational cohomology and compare the maps under coefficient change.

(Mazur–Rubin (arXiv v1), §1, Definition 1.1, p. 4 (arXiv v1); Mazur–Rubin (arXiv v1), §2, Definition 2.1, p. 6 (arXiv v1).)

The named operations and identities are:

- `SelmerData.withCond` — Replace the local conditions.
- `SelmerData.relax` — Relaxed condition H_v at the places of a set B.
- `SelmerData.strict` — Strict condition 0 at the places of a set A.
- `SelmerData.selmer_strict_le_le_relax` — Sel_strict ≤ Sel ≤ Sel_relaxed.

**Checks.**

- All conditions relaxed: the Selmer module is H.
- All conditions strict: the Selmer module is ⋂_v ker res_v.
- No places: the Selmer module is H.
- Strict ≤ relaxed.

Mazur–Rubin's F^b_a(n) is withCond with strict conditions at a and relaxed ones at b; transverse conditions belong to EulerSystemsAndKolyvaginSystems:ES.1.

*Needs:* Mathlib `Submodule.map_le_iff_le_comap`; TauCetiRoadmap.EllipticCurves Layer 7.

### 2.2 Compact and rational Selmer kernel

Extend the general discrete Selmer interface imported from Tau Ceti EllipticCurves Layer 7 to compact lattice T and rational V cohomology, and compare coefficient propagation on A=V/T with that interface. For Selmer data D, Sel(D) = {c ∈ H : res_v(c) ∈ L_v for all v} = ker(H → ∏_v H_v/L_v).

For infinitely many places the product is the right target; in the Galois instance only finitely many conditions are nontrivial (Rubin's remark after Definition 5.1).

The construction proceeds as follows. Intersection of the preimages of the L_v; equality with the kernel of the product of quotient maps.

(Mazur–Rubin (arXiv v1), §2, Definition 2.1, p. 6 (arXiv v1); Rubin (1999 draft), Chapter I, §5, Definition 5.1, printed pp. 11–12 (PDF pp. 21–22).)

The named operations and identities are:

- `SelmerData.selmer` — The intersection of local-condition preimages on the supplied compact/rational diagram.
- `SelmerData.mem_selmer` — c ∈ Sel iff res_v c ∈ L_v for all v.
- `SelmerData.selmer_eq_ker` — Sel = ker(H → ∏_v H_v/L_v).
- `SelmerData.selmer_mono` — Monotone in the local conditions.

**Checks.**

- Relaxed everywhere gives H.
- Strict everywhere gives ⋂ ker res_v.
- An empty index set gives H.

Rubin's S^Σ and S_Σ are relax and strict applied to Σ.

*Needs:* §2.1 (Compact and rational Selmer data); TauCetiRoadmap.EllipticCurves Layer 7.

### 2.3 Change of local conditions

If L_v ≤ L'_v for all v, then Sel_L ⊆ Sel_{L'} and the sequence 0 → Sel_L → Sel_{L'} → ∏_v L'_v/L_v is exact.

Same global module and localisation maps for both conditions.

Prove this as follows. Monotonicity; a class of Sel_{L'} lies in Sel_L iff each res_v c lies in L_v, that is, iff its image in ∏ L'_v/L_v vanishes.

(Mazur–Rubin (arXiv v1), §2, Definition 2.3 and display (2.4), pp. 6–7 (arXiv v1).)

Mazur–Rubin (2.4) is the case L' = L relaxed at the primes dividing n/m.

*Needs:* §2.2 (Compact and rational Selmer kernel).

The algebraic signature is `SelmerData.changeConditionMap`, with `exact_change_of_conditions` identifying its kernel with the smaller Selmer module. The map is not asserted onto the product of local quotients.

### 2.4 Functoriality of Selmer modules

A map of Selmer data (R-linear f : H → H', f_v : H_v → H'_v with f_v ∘ res_v = res'_v ∘ f and f_v(L_v) ⊆ L'_v) maps Sel(D) into Sel(D').

Compatibility squares and inclusion of conditions.

Prove this as follows. Chase: res'_v(f c) = f_v(res_v c) ∈ f_v(L_v) ⊆ L'_v.

(Rubin (1999 draft), Chapter I, §5, Lemma 5.4, printed p. 12 (PDF p. 22).)

Applied to T → V → W with the propagated conditions of §2.6.

*Needs:* §2.2 (Compact and rational Selmer kernel).

### 2.5 Propagating local conditions

Along a coefficient map inducing g : H^1(K_v, X) → H^1(K_v, Y), a condition L ⊆ H^1(K_v, X) propagates forwards to g(L) (quotients T ↠ T/IT, V → W), and a condition L' ⊆ H^1(K_v, Y) propagates backwards to g^{−1}(L') (submodules T[I] ↪ T, T → V). The two form a Galois connection.

Any R-linear g.

The construction proceeds as follows. Image and preimage of submodules; Galois connection Submodule.map_le_iff_le_comap.

(Mazur–Rubin (arXiv v1), §1, Definition 1.1, p. 4 (arXiv v1).)

The named operations and identities are:

- `propagateImage` — Forward propagation g(L).
- `propagatePreimage` — Backward propagation g^{−1}(L').
- `propagate_gc` — g(L) ≤ L' ↔ L ≤ g^{−1}(L').
- `propagateImage_top` — The relaxed condition propagates forwards along a surjection to the relaxed one.
- `propagatePreimage_bot` — The strict condition propagates backwards to ker g.

**Checks.**

- Forward propagation of ⊤ along a surjection is ⊤.
- Backward propagation of ⊥ is the kernel.
- Propagation along g ∘ h is propagation along h then g.

Mazur–Rubin propagate by image to T/IT and by inverse image to T[I].

*Needs:* Mathlib `Submodule.map_le_iff_le_comap`.

### 2.6 From V to T and W; saturation

Given L_V ⊆ H^1(K_v, V), put L_T = inverse image under H^1(K_v, T) → H^1(K_v, V) and L_W = image under H^1(K_v, V) → H^1(K_v, W) (Rubin's H^1_f(K_v, T), H^1_f(K_v, W)). Then H^1(K_v, T)/L_T is torsion-free (L_T is saturated) and L_W is divisible. The integer-module signature `saturated_preimage` states the general elementary fact that the preimage of a submodule saturated for a specified nonzero integer remains saturated for that integer. The arithmetic assertion instead uses an E-linear L_V and every nonzero element of O.

T a finitely generated free ℤ_p- or O-module with continuous action, V = T[1/p], W = V/T; L_V an E-subspace (a ℚ_p-subspace for O=ℤ_p).

Prove this as follows. If n·x ∈ L_T with n ≠ 0 then n·x ↦ n·y ∈ L_V, and y ∈ L_V as L_V is an E-subspace, so x ∈ L_T. L_W is the image of a ℚ_p-vector space, hence divisible. The maps H^1(T) → H^1(V) → H^1(W) come from ArithmeticGaloisDuality R02.1.

(Rubin (1999 draft), Chapter I, §3.2, Definition 3.4, printed p. 5 (PDF p. 15); Rubin (1999 draft), Chapter I, §3.2, proof of Lemma 3.5, printed p. 6 (PDF p. 16).)

Saturation on T and divisibility on W are separate properties of the propagated conditions.

*Needs:* §2.5 (Propagating local conditions); ArithmeticGaloisDuality R02.1 (`lattice-torsion-sequence`).

### 2.7 The unramified condition

For a decomposition group G_v with inertia subgroup I_v and a G_v-module B, H^1_ur(K_v, B) = ker(H^1(G_v, B) → H^1(I_v, B)). By inflation–restriction it is the image of H^1(G_v/I_v, B^{I_v}), and for procyclic G_v/I_v generated by Fr it is B^{I_v}/(Fr − 1)B^{I_v}.

B discrete, a finitely generated ℤ_p-module, or a finite-dimensional ℚ_p-space (Rubin Lemma I.3.2).

The construction proceeds as follows. Kernel of restriction to inertia. Inflation–restriction (Tau Ceti ProfiniteCohomology Layer 5; Rubin Proposition B.2.5(i)). H^1(Ẑ, C) = C/(Fr − 1)C by evaluation at Fr (Rubin Lemma B.2.8).

(Rubin (1999 draft), Chapter I, §3.1, Definition 3.1, printed p. 4 (PDF p. 14); Rubin (1999 draft), Chapter I, §3.1, Lemma 3.2(i), printed p. 4 (PDF p. 14).)

The named operations and identities are:

- `unramified` — ker(res to inertia).
- `unramified_eq_range_inflation` — = image of inflation from G_v/I_v.
- `unramified_equiv_coinvariants` — ≅ B^{I}/(Fr − 1)B^{I}.
- `greenberg_zero` — The Greenberg condition with F^+ = 0.

**Checks.**

- B = ℤ/p with trivial action over ℚ_ℓ: H^1_ur = Hom(Gal(K^ur/K), ℤ/p) = ℤ/p.
- For K/ℚ_ℓ finite with ℓ≠p and an unramified lattice T, H¹_f(K,W)=H¹_ur(K,W) (Rubin Lemma 3.5(iv)).
- For K/ℚ_ℓ with ℓ≠p, H¹_f(K,T)/H¹_ur(K,T) ≅ (W^I/(W^I)_div)^(Fr=1); this is nonzero for a Tate curve with p-divisible Tamagawa number, so raw unramifiedness is too small.

Unramified B: H^1_ur = B/(Fr − 1)B.

*Needs:* §2.1 (Compact and rational Selmer data); ArithmeticGaloisDuality R02.2 (`compact-five-term`); TauCetiRoadmap.ProfiniteCohomology Layer 5.

### 2.8 Greenberg's local condition

For a decomposition group G_v at p with inertia I_v and a G_v-stable submodule F^+M ⊆ M, L^Gr_v = ker(H^1(G_v, M) → H^1(I_v, M/F^+M)). F^+M need only be stable under G_v, not under the global Galois group.

F^+ stable under G_v; for W = V/T use the image F^+W of F^+V.

The construction proceeds as follows. Kernel of the composite of restriction to I_v and the map induced by M → M/F^+M.

(Rodrigues Jacinto–Williams (arXiv v2), §13.5.1, Definition 13.19(1), p. 70 (arXiv v2).)

The named operations and identities are:

- `greenberg` — ker(H^1(G_v, M) → H^1(I_v, M/F^+M)).
- `greenberg_zero` — F^+ = 0 gives the unramified condition.
- `greenberg_top` — F^+ = M gives the relaxed condition.
- `unramified_le_greenberg` — H^1_ur ⊆ L^Gr.

**Checks.**

- F^+ = 0: L^Gr = H^1_ur.
- F^+ = M: L^Gr = H^1.
- For an ordinary elliptic curve, the ordinary line of V_pE is G_{ℚ_p}-stable but not G_ℚ-stable; the condition is still defined.

For M = W_n = (ℚ_p/ℤ_p)(n) over ℚ(μ_{p^∞})^+ with Fil^1 = W_n (n ≥ 1) or 0 (n ≤ 0), L^Gr is everything or the unramified condition (RJW §13.5.2).

*Needs:* §2.7 (The unramified condition); §2.1 (Compact and rational Selmer data).

### 2.9 Compact and rational Galois Selmer groups

Extend the general discrete Selmer interface imported from Tau Ceti EllipticCurves Layer 7 to compact lattice T and rational V cohomology, and compare coefficient propagation on A=V/T with that interface. For a number field K, a finite set Σ of places containing those above p∞ and the ramified primes, and a coefficient module M (discrete, compact or rational), Sel_L(K, M) is the Selmer module of the data H = H^1(G_{K,Σ}, M), H_v = H^1(K_v, M), res_v the localisation (restriction to a decomposition group), with local conditions L_v for v ∈ Σ. It equals the classes of H^1(K, M) that are unramified outside Σ and satisfy L_v at Σ (Rubin Lemma I.5.3).

Σ ⊇ {v | p∞} ∪ {ramified primes}; the conditions at v ∉ Σ are unramified.

The construction proceeds as follows. G_{K,Σ}, decomposition groups and localisation maps come from ArithmeticGaloisDuality R02.3. Rubin's Lemma I.5.3: the unramified conditions outside Σ cut out H^1(K_Σ/K, M) inside H^1(K, M).

(Mazur–Rubin (arXiv v1), §2, Definition 2.1, p. 6 (arXiv v1); Rubin (1999 draft), Chapter I, §5, Lemma 5.3, printed p. 12 (PDF p. 22).)

The named operations and identities are:

- `galoisSelmer_eq_rubin` — Sel_L(K, M) = {c ∈ H^1(K, M) : c_v ∈ L_v (v ∈ Σ), c_v unramified (v ∉ Σ)}.
- `galoisSelmer_enlarge` — Enlarging Σ with unramified conditions leaves Sel unchanged.
- `galoisSelmer_relax_eq` — Relaxed at every v ∈ Σ: Sel = H^1(G_{K,Σ}, M).
- `galoisSelmer_map` — Maps of coefficient modules with compatible conditions induce maps.

**Checks.**

- Relaxed on Σ: H^1(G_{K,Σ}, M).
- With coefficients μ_p and relaxed conditions on Σ={v|p∞}, the Selmer group is H¹(G_(K,Σ),μ_p), fitting into the S-unit/p and Pic[p] Kummer sequence. Requiring unramifiedness also at p cuts this group down.
- Strict on Σ for M with H^1(G_{K,Σ}, M) = 0 gives 0.

Enlarging Σ with unramified conditions does not change the group.

*Needs:* §2.2 (Compact and rational Selmer kernel); §2.7 (The unramified condition); ArithmeticGaloisDuality R02.3 (`restricted-ramification-group`); ArithmeticGaloisDuality R02.3 (`localisation-maps`); ArithmeticGaloisDuality R02.1 (`carrier-comparison`); TauCetiRoadmap.EllipticCurves Layer 7.

### 2.10 Pontryagin duals with the contragredient action

Extend the algebraic character-action interface to the continuous p-primary dual and completed Iwasawa action. For a discrete p-primary module M with a continuous G-action, M^∨ = Hom_cont(M, ℚ_p/ℤ_p) (Mathlib's PontryaginDual for the circle, restricted to p-primary M) with the contragredient action (g·f)(x) = f(g^{−1}x). Over a group ring ℤ_p[[Γ]] the dual is a module through the involution γ ↦ γ^{−1}.

M discrete p-primary; G acts continuously.

The construction proceeds as follows. ContinuousMonoidHom.comp with the action of g^{−1}; the left-action law uses (gh)^{−1} = h^{−1}g^{−1}. For a discrete p-primary M, every circle-valued character has p-power torsion image; identify the circle’s p-primary torsion with ℚ_p/ℤ_p. Finite cyclic p-group duality gives the finite examples, and compatible duals of ℤ/p^m give (ℚ_p/ℤ_p)^∨=ℤ_p with its inverse-limit topology. Injectivity of the divisible group ℚ_p/ℤ_p makes dualization exact on discrete p-primary modules. Compactness follows by identifying the dual with the closed character subgroup of a product of finite character groups. On finitely generated compact duals use their finite quotients to recover biduality; these are the arithmetic modules needed by corank and the closed-condition annihilator rules.

(Burungale–Tian (arXiv v2), §1.0.1 and §3.1, pp. 1 and 6 (arXiv v2).)

The named operations and identities are:

- `contragredient` — (g·f)(x) = f(g^{−1}x).
- `contragredient_mul` — The contragredient action is a left action.
- `dual_involution` — As a ℤ_p[[Γ]]-module, M^∨ is the dual twisted by the involution γ ↦ γ^{−1}.
- `dual_selmer` — Selmer maps dualise contravariantly.

**Checks.**

- (ℚ_p/ℤ_p)^∨ = ℤ_p.
- A finite module has a finite dual of the same order.
- Trivial action dualises to trivial action.
- For M=ℤ/7 and g acting by multiplication by 2 (order 3), the dual action is multiplication by 4, the inverse of 2 mod 7; direct multiplication by 2 fails.

Dualising twice returns M; (ℚ_p/ℤ_p)^∨ = ℤ_p.

*Needs:* Mathlib `PontryaginDual`; Mathlib `ContinuousMonoidHom.comp`; Mathlib `MulDistribMulAction.toMonoidHom`.

### 2.11 Coranks

For a cofinitely generated discrete ℤ_p-module M, corank_{ℤ_p} M = dim_{ℚ_p}(M^∨ ⊗_{ℤ_p} ℚ_p).

M cofinitely generated, so M^∨ is a finitely generated ℤ_p-module.

The construction proceeds as follows. Module.finrank over ℚ_p of the rationalised dual.

(Burungale–Tian (arXiv v2), §1.0.1, the exact sequence and (1.1), p. 1 (arXiv v2).)

The named operations and identities are:

- `corank` — For discrete cofinitely generated M, dim_ℚp(ℚ_p⊗_ℤp M^∨).
- `corankFromDual` — On a supplied compact dual N=M^∨, compute dim_ℚp(ℚ_p⊗_ℤp N); this is the native signature-testing adapter.
- `corankFromDual_finite` — A finite compact dual gives corank zero.
- `corankFromDual_add` — Additive on short exact sequences of finitely generated compact duals; exact Pontryagin duality gives the corresponding discrete corank formula.
- `corankFromDual_pi_padicInt` — For M=(ℚ_p/ℤ_p)^r with compact dual N=ℤ_p^r, corank M=corankFromDual N=r.

**Checks.**

- The discrete module ℚ_p/ℤ_p has corank 1, computed from its compact dual ℤ_p.
- The finite discrete module ℤ/p has corank 0, computed from its finite compact dual.
- The discrete module (ℚ_p/ℤ_p)² has corank 2, computed from its compact dual ℤ_p².

Additive in short exact sequences of cofinitely generated modules.

*Needs:* §2.10 (Pontryagin duals with the contragredient action); Mathlib `Module.finrank`.

### 2.12 Passage from finite elliptic Selmer groups to p^∞

For an elliptic curve E over a number field F and a prime p, Sel_{p^∞}(E/F) is the Galois Selmer group of M = E[p^∞] with local conditions the images of E(F_v) ⊗ ℚ_p/ℤ_p under the local Kummer maps; equivalently ker(H^1(F, E[p^∞]) → ∏_v H^1(F_v, E)[p^∞]), and the direct limit of the Sel_{p^m}. It sits in 0 → E(F) ⊗ ℚ_p/ℤ_p → Sel_{p^∞}(E/F) → Ш(E/F)[p^∞] → 0.

E/F elliptic; the finite-level Selmer groups and local Kummer maps come from Tau Ceti EllipticCurves Layer 7.

Prove this as follows. Instantiate §2.9; identify the local conditions with the Kummer images; pass to the direct limit over m.

(Burungale–Tian (arXiv v2), §1.0.1, the exact sequence and (1.1), p. 1 (arXiv v2).)

The named operations and identities are:

- `ellipticSelmerInfinity` — The direct-limit Selmer carrier with its canonical Galois-kernel comparison.
- `ellipticSelmerInfinity_kummer` — The exact sequence with Mordell–Weil tensor and Ш[p^∞].
- `ellipticSelmerInfinity_corank` — Corank equals Mordell–Weil rank plus the corank of Ш[p^∞].

**Checks.**

- A finite Mordell–Weil group has zero tensor with ℚ_p/ℤ_p, even when E(F)[p] is nonzero.
- Finite Ш[p^∞] makes Selmer corank equal to the Mordell–Weil rank; divisible Ш contributes an additional corank.
- When both E(F)⊗ℚ_p/ℤ_p and Ш[p^∞] vanish, the infinite Selmer group vanishes, even if finite-level torsion classes occur.

The Bloch–Kato comparison of these conditions on V_pE belongs to §4.26.

*Needs:* §2.9 (Compact and rational Galois Selmer groups); §2.11 (Coranks); TauCetiRoadmap.EllipticCurves Layer 7.

### 2.13 Dual Selmer structures

Extend the upstream discrete structure by orthogonal local conditions on the compact/rational adapters and their dual coefficient diagrams. A Selmer structure F on T (Mazur–Rubin, Definition 2.1) is a finite set Σ(F) of places containing the archimedean places, the places above p and the primes where T is ramified, with a local condition H¹_F(K_q, T) for each q ∈ Σ(F); its Selmer module H¹_F(K, T) is the kernel of H¹(K_{Σ(F)}/K, T) → ⊕_{q∈Σ(F)} H¹(K_q, T)/H¹_F(K_q, T). The dual Selmer structure F^* on T^* = Hom(T, μ_{p^∞}) has Σ(F^*) = Σ(F) and H¹_{F^*}(K_q, T^*) = H¹_F(K_q, T)^⊥ under the local Tate pairing (Mazur–Rubin, Definition 2.5).

T finitely generated over O with continuous G_K-action, unramified outside a finite set. Compact local conditions are closed in their natural topology (in the finite-type O case submodules are closed); coefficient biduality and perfect topological pairings are used for double orthogonals.

The construction proceeds as follows. Import the upstream discrete Selmer carrier and its finite place set; instantiate the compact/rational adapter and its localization maps. The dual conditions are §1.1 for the local Tate pairings. F^{**} = F from §1.1's double-orthogonal rule; strict and relaxed modifications swap under duality; the structure induced on T/IT is dual to the one induced on T^*[I] = (T/IT)^* by the image/preimage rule and §1.2.

(Mazur–Rubin (arXiv v1), §2, Definition 2.1, p. 6 (arXiv v1); Mazur–Rubin (arXiv v1), §2, Definition 2.5, p. 7 (arXiv v1).)

The named operations and identities are:

- `SelmerStructure` — Σ(F) with local conditions at each q ∈ Σ(F).
- `SelmerStructure.selmerModule` — H¹_F(K, T) as §2.9 for these data.
- `SelmerStructure.dual` — F^* on T^*.
- `SelmerData.dualCond` and `SelmerData.dualOf` — Local annihilators and their algebraic Selmer datum on the supplied dual global/local modules.
- `SelmerStructure.dual_dual` — F^{**} = F.
- `SelmerStructure.dual_modify` — (F^b_a)^* = (F^*)^a_b: strict at a ↔ relaxed at a (Mazur–Rubin, Definition 2.3).
- `SelmerStructure.dual_induced` — The structure induced on T/IT is dual to the one induced on T^*[I].
- `SelmerStructure.rubin_dual` — Rubin's S^Σ(K, W_M) and S_Σ(K, W^*_M) are the Selmer modules of dual structures (§2.17).

**Checks.**

- The structure relaxed at every q ∈ Σ has dual strict at every q ∈ Σ; the dual Selmer module is Ш¹_Σ(K, T^*) (ArithmeticGaloisDuality R02.4/restricted-product-cohomology).
- For T unramified at q∤p, H¹_f(K_q,T) and H¹_f(K_q,T*) are exact annihilators in their respective local cohomology groups; they are not identified as the same subgroup of one module.
- At a real place H¹(ℝ, W_M) = 0 for p odd, so every archimedean condition is 0 = its dual; for p = 2 it can be nonzero (Rubin, Remark 3.7).
- Adding a place q ∉ Σ(F) to Σ(F^*) with the relaxed condition does not give the dual structure: the dual keeps the finite condition at q.

Σ(F^*) = Σ(F); the dual conditions are orthogonal complements for the named local Tate pairing.

*Needs:* §1.1 (Perfect pairings and dual local conditions); §1.2 (Compatibility of the local pairings for T, V, W and W_M); §2.9 (Compact and rational Galois Selmer groups); §2.1 (Compact and rational Selmer data).

### 2.14 Dimensions of unramified classes

Let K/ℚ_ℓ be finite with ℓ ≠ p and V a finite-dimensional ℚ_p[G_K]-module. Then dim H¹_ur(K, V) = dim V^{G_K}, and dim H¹(K, V)/H¹_ur(K, V) = dim H²(K, V).

ℓ ≠ p.

Prove this as follows. §2.7: H¹_ur(K, V) = V^I/(Fr − 1)V^I, so 0 → V^{G_K} → V^I → V^I → H¹_ur(K, V) → 0 gives (i). I has a unique maximal subgroup I′ of pro-order prime to p with I/I′ ≅ ℤ_p (the tame quotient, LocalFieldsRamification Layer 4), so I and Gal(K^ur/K) have p-cohomological dimension 1 (ProfiniteCohomology Layer 11). Hochschild–Serre (ArithmeticGaloisDuality R02.2) gives H¹(K^ur/K, H¹(I, V)) = H²(K, V) and H¹(K, V)/H¹_ur(K, V) = H¹(I, V)^{Fr=1}; the sequence 0 → H¹/H¹_ur → H¹(I, V) → H¹(I, V) → H²(K, V) → 0 gives (ii).

(Rubin (1999 draft), Chapter I, §3.1, Corollary 3.3, printed p. 5 (PDF p. 15).)

Only for ℓ ≠ p; at ℓ = p the finite condition is chosen, not computed.

*Needs:* §2.7 (The unramified condition); ArithmeticGaloisDuality R02.2 (`hochschild-serre-spectral-sequence`); TauCetiRoadmap.LocalFieldsRamification Layer 4; TauCetiRoadmap.ProfiniteCohomology Layer 11.

### 2.15 Finite against unramified classes at bad primes

Let K/ℚ_ℓ be finite with ℓ ≠ p, H¹_f(K, V) = H¹_ur(K, V), and H¹_f(K, T), H¹_f(K, W), H¹_f(K, W_M) as in §2.6. Put 𝒲 = W^I/(W^I)_div, a finite module. (i) H¹_f(K, W) = H¹_ur(K, W)_div. (ii) H¹_ur(K, T) ⊆ H¹_f(K, T) with finite index, and H¹_s(K, T) is torsion-free. (iii) H¹_ur(K, W)/H¹_f(K, W) ≅ 𝒲/(Fr − 1)𝒲 and H¹_f(K, T)/H¹_ur(K, T) ≅ 𝒲^{Fr=1}. (iv) If T is unramified, H¹_f = H¹_ur for T and W. Moreover H¹_f(K, W_M) is the image of H¹_f(K, T), and equals H¹_ur(K, W_M) when T is unramified. At an archimedean place H¹_f(K, W) = 0, H¹_f(K, T) = H¹(K, T) and H¹_f(K, W_M) = W^{G_K}/M W^{G_K}, all zero unless K = ℝ and p = 2.

ℓ ≠ p for (i)–(iv); T a lattice.

Prove this as follows. The diagram of the rows 0 → H¹_ur(K, A) → H¹(K, A) → H¹(I, A) for A = T, V, W gives H¹_f(W) ⊆ H¹_ur(W) and H¹_ur(T) ⊆ H¹_f(T) (ArithmeticGaloisDuality R02.1's long exact sequences). The image of V^I in W^I is (W^I)_div; taking I-cohomology and Frobenius invariants of 0 → T → V → W → 0 gives 0 → 𝒲^{Fr=1} → H¹(I, T)^{Fr=1} → H¹(I, V)^{Fr=1}, and with §2.7 this gives (iii); (i), (ii) follow since 𝒲 is finite; (iv) since W^I = W is divisible when T is unramified. Image of H¹_f(K, T): the diagram H¹(K, T) → H¹(K, W_M) → H²(K, T) over H¹(K, V) → H¹(K, W) → H²(K, T) (Rubin Lemma 3.8). Archimedean: H¹(K, V) = 0 (Rubin Remark 3.7).

(Rubin (1999 draft), Chapter I, §3.2, Lemma 3.5, printed p. 6 (PDF p. 16); Rubin (1999 draft), Chapter I, §3.2, Remark 3.7, printed p. 7 (PDF p. 17).)

These terms measure the difference between the finite rational condition and its finite-coefficient reductions at bad primes.

*Needs:* §2.6 (From V to T and W; saturation); §2.7 (The unramified condition); ArithmeticGaloisDuality R02.1 (`continuous-section-long-exact`); ArithmeticGaloisDuality R02.1 (`lattice-torsion-sequence`).

### 2.16 Local duality for the finite condition on V

If K is archimedean, or nonarchimedean of residue characteristic ℓ ≠ p, then H¹_f(K, V) and H¹_f(K, V^*) are exact orthogonal complements under the local Tate pairing.

ℓ ≠ p or K archimedean.

Prove this as follows. Archimedean K: all the groups vanish. The pairing of two unramified classes factors through H²(K^ur/K, Φ(1)) = 0, as Gal(K^ur/K) has cohomological dimension 1. dim H¹_f(K, V^*) = dim H⁰(K, V^*) = dim H²(K, V) = dim H¹(K, V) − dim H¹_f(K, V), by §2.14, local duality for V (ArithmeticGaloisDuality R02.4) and §2.14 again; conclude with §1.1's dimension count.

(Rubin (1999 draft), Chapter I, §4, Proposition 4.2, printed p. 9 (PDF p. 19).)

The dimension count, not only orthogonality, is proved.

*Needs:* §2.14 (Dimensions of unramified classes); §1.1 (Perfect pairings and dual local conditions); ArithmeticGaloisDuality R02.4.

### 2.17 Local duality for the finite conditions on T and W_M

Suppose K is archimedean, or nonarchimedean of residue characteristic ℓ ≠ p, or nonarchimedean with ℓ = p and H¹_f(K, V), H¹_f(K, V^*) chosen to be orthogonal complements. Then H¹_f(K, T) and H¹_f(K, W^*) are exact orthogonal complements, and so are H¹_f(K, W_M) and H¹_f(K, W^*_M) for every nonzero M ∈ O. In particular, for T unramified and ℓ ≠ p, the unramified conditions on T and T^* are exact annihilators (Mazur–Rubin, Proposition 1.7(i)).

The case ℓ = p needs the chosen orthogonal pair H¹_f(K, V), H¹_f(K, V^*).

Prove this as follows. §1.2: ⟨φ(c), d⟩ = ⟨c, φ^*(d)⟩. By §2.16 (or the hypothesis at ℓ = p), H¹_f(K, V)^⊥ = H¹_f(K, V^*). Since H¹_f(K, W^*) = φ^*(H¹_f(K, V^*)) and H¹_f(K, T) = φ^{−1}(H¹_f(K, V)) (§2.6), §1.1's image/preimage rule gives H¹_f(K, W^*)^⊥ = H¹_f(K, T). For W_M, use T ↠ W_M and W^*_M ↪ W^* in the same way, with H¹_f(K, W_M) the image of H¹_f(K, T) (§2.15). Unramified T with ℓ ≠ p: §2.15 (iv) identifies the finite and unramified conditions; at finite level this agrees with ArithmeticGaloisDuality's unramified-exact-annihilators.

(Rubin (1999 draft), Chapter I, §4, Proposition 4.3, printed p. 9 (PDF p. 19); Mazur–Rubin (arXiv v1), §1, Proposition 1.7, p. 5 (arXiv v1).)

At ℓ = p nothing is claimed without the chosen orthogonal pair; that Bloch–Kato's subspaces for potentially semistable V are such a pair (Rubin, Remark 7.1) belongs to L4.

*Needs:* §2.16 (Local duality for the finite condition on V); §1.1 (Perfect pairings and dual local conditions); §1.2 (Compatibility of the local pairings for T, V, W and W_M); §2.15 (Finite against unramified classes at bad primes); §2.6 (From V to T and W; saturation); ArithmeticGaloisDuality R02.4 (`unramified-exact-annihilators`).

### 2.18 Selmer groups of T and W as limits

For a finite set Σ of places: (i) S^Σ(K, T) = lim_M S^Σ(K, W_M) and S_Σ(K, T) = lim_M S_Σ(K, W_M); (ii) S^Σ(K, W) = colim_M S^Σ(K, W_M) and S_Σ(K, W) = colim_M S_Σ(K, W_M); the finite and singular parts of the local cohomology commute with these limits. The map ι_M : H¹(K, W_M) → H¹(K, W) induces a surjection S^Σ(K, W_M) ↠ S^Σ(K, W)[M], which can fail for S_Σ. S^Σ(K, W_M) is finite, S^Σ(K, T) is finitely generated over O, and the Pontryagin dual of S^Σ(K, W) is finitely generated over O.

Σ finite; T a lattice unramified outside a finite set.

Prove this as follows. H¹(K, W) = colim_M H¹(K, W_M), and H¹(K, T) = lim_M H¹(K, W_M) by Tate's inverse-limit theorem (ArithmeticGaloisDuality R02.1/tate-inverse-limit; the H⁰ are finite). The local groups at level M are finite, so the finite parts and singular quotients commute with the limits (Rubin, Corollary 3.10, using §2.15's description of H¹_f(K, W_M)). ι_M(H¹(K, W_M)) = H¹(K, W)[M], and ι_M^{−1}(S^Σ(K, W)[M]) = S^Σ(K, W_M) by definition; for S_Σ the strict condition at Σ is not preserved under ι_M^{−1} (Rubin, Remark 5.5). Enlarging Σ, S^Σ(K, A) = H¹(K_Σ/K, A) (§2.9), which is finite for A = W_M (ArithmeticGaloisDuality R02.3/h1-finite); the other two statements follow by the limits.

(Rubin (1999 draft), Chapter I, §5, Proposition 5.6, printed p. 12 (PDF p. 22); Rubin (1999 draft), Chapter I, §5, Remark 5.5, printed p. 12 (PDF p. 22).)

Both the relaxed and the strict Selmer groups are covered, with the strict-condition exceptions to Rubin Lemma 5.4 retained.

*Needs:* §2.9 (Compact and rational Galois Selmer groups); §2.6 (From V to T and W; saturation); §2.15 (Finite against unramified classes at bad primes); ArithmeticGaloisDuality R02.1 (`tate-inverse-limit`); ArithmeticGaloisDuality R02.3 (`h1-finite`); Mathlib `PontryaginDual`.

### 2.19 Poitou–Tate for Selmer groups

Let K be a number field, T a p-adic representation of G_K ramified at finitely many primes, with H¹_f(K_v, V) and H¹_f(K_v, V^*) orthogonal complements at the places above p; let M ∈ O be nonzero and Σ_0 ⊆ Σ finite sets of places. (i) 0 → S^{Σ_0}(K, W_M) → S^Σ(K, W_M) → ⊕_{v∈Σ−Σ_0} H¹_s(K_v, W_M) and 0 → S_Σ(K, W^*_M) → S_{Σ_0}(K, W^*_M) → ⊕_{v∈Σ−Σ_0} H¹_f(K_v, W^*_M) are exact. (ii) The images loc^s(S^Σ(K, W_M)) and loc^f(S_{Σ_0}(K, W^*_M)) are exact orthogonal complements under Σ_{v∈Σ−Σ_0}⟨ , ⟩_v. (iii) S_{Σ_0}(K, W^*_M)/S_Σ(K, W^*_M) ≅ Hom_O(coker(loc^s_{Σ,Σ_0}), O/MO); in particular |S_{Σ_0}(K, W^*_M)| = |coker(loc^s_{Σ,Σ_0})| when S_Σ(K, W^*_M) = 0.

Orthogonal finite conditions at the places above p; Σ_0 ⊆ Σ finite.

Prove this as follows. (i) is immediate from the definitions (§2.3). For Σ containing the archimedean places, the places above p and the ramified primes, S^Σ(K, A) = H¹(K_Σ/K, A) (§2.9). The segment H¹(G_Σ, W_M) → P¹_Σ(K, W_M) → H¹(G_Σ, W^*_M)^∨ of Poitou–Tate (ArithmeticGaloisDuality R02.4/poitou-tate), §2.17 (H¹_s(W_M) is dual to H¹_f(W^*_M), by §1.1's quotient pairing) and the dual of the tautological sequence for S_Σ(K, W^*_M) splice to the exact sequence 0 → S^{Σ_0} → S^Σ → ⊕ H¹_s → S_{Σ_0}(W^*_M)^∨ → S_Σ(W^*_M)^∨ → 0, whose exactness in the centre is (ii). General Σ: take Σ′ ⊇ Σ large; the snake lemma on the diagram for Σ_0 ⊆ Σ′ and Σ ⊆ Σ′ gives the sequence for Σ_0 ⊆ Σ (the map there is (loc^f_{Σ,Σ_0})^∨). (iii) restates (ii).

(Rubin (1999 draft), Chapter I, §7, Theorem 7.3, printed p. 17 (PDF p. 27).)

Uses the global duality of ArithmeticGaloisDuality R02.4; summing local pairings alone does not prove (ii). The real places enter through ArithmeticGaloisDuality's modified groups, which agree with ordinary cohomology in degree 1.

*Needs:* §2.17 (Local duality for the finite conditions on T and W_M); §2.13 (Dual Selmer structures); §2.9 (Compact and rational Galois Selmer groups); §2.3 (Change of local conditions); §1.1 (Perfect pairings and dual local conditions); ArithmeticGaloisDuality R02.4 (`poitou-tate`); ArithmeticGaloisDuality R02.4 (`restricted-product-cohomology`).

### 2.20 Poitou–Tate for the Selmer group of W^*

With Σ_p the places above p: S(K, W^*)/S_{Σ_p}(K, W^*) ≅ Hom_O(coker(loc^s_{Σ_p}), D), where loc^s_{Σ_p} : S^{Σ_p}(K, T) → ∏_{v|p} H¹_s(K_v, T).

As in §2.19.

Prove this as follows. Apply §2.19 (iii) with Σ=Σ_p and Σ_0=∅ at each level M. By §2.18 the direct limit of S(K,W^*_M)/S_{Σ_p}(K,W^*_M) identifies with S(K,W^*)/S_{Σ_p}(K,W^*). On the lattice side use the inverse limit of S^{Σ_p}(K,W_M), which identifies with S^{Σ_p}(K,T), and the corresponding inverse limits of singular quotients. All groups at level M are finite: Hom_O(−, O/MO) turns the inverse limit of the cokernels into the direct limit of their duals (Pontryagin duality), and the inverse limit of the cokernels is the cokernel of the limit, as lim¹ of finite groups vanishes (ArithmeticGaloisDuality R02.1).

(Rubin (1999 draft), Chapter I, §7, Corollary 7.5, printed p. 19 (PDF p. 29).)

The lim¹ bookkeeping is explicit.

*Needs:* §2.19 (Poitou–Tate for Selmer groups); §2.18 (Selmer groups of T and W as limits); ArithmeticGaloisDuality R02.1 (`lim-one-six-term`); ArithmeticGaloisDuality R02.1 (`mittag-leffler-lim-one`); Mathlib `PontryaginDual`.

### 2.21 Selmer complex as a mapping fibre

For a finite set S and a bounded compact/rational/discrete coefficient complex X on the canonical continuous carrier, a complex local condition consists of actual maps i_v^+:U_v^+→C_cont(G_v,X). Define RΓ_f(F,S,X;U^+) as Cone(C_cont(G_(F,S),X)⊕⊕_v U_v^+ --res−i-->⊕_v C_cont(G_v,X))[−1]. Supply the triangles RΓ_f→RΓ_global→⊕U_v^− and RΓ_c→RΓ_f→⊕U_v^+. Strict uses U^+=0 and relaxed uses i=id. Submodules of H¹ are not by themselves a unique choice of U^+.

Actual continuous complexes and localization maps are supplier objects; finite S; use modified real local complexes at p=2 where required. The compact-support identification uses condition (P): p odd or F totally imaginary. Outside (P), use ArithmeticGaloisDuality D7.5’s modified real-place complex and duality in the unbounded derived category.

The construction proceeds as follows. Form the finite direct sums, res−i arrow and its shifted cone in Mathlib derived categories. Give chain-level maps for both triangles, and prove their naturality via cone functoriality and the octahedral axiom. For discrete X identify the continuous carrier with upstream locally constant cohomology; compare its H¹ kernel after §2.22 computes the H⁰ correction.

(Nekovář, Definitions 6.1.1–6.1.2 and triangles 6.1.3, pp. 135–136.)

The named operations and identities are:

- `selmerComplex` — Cone(res−i)[−1] on canonical continuous complexes.
- `selmerComplex_globalTriangle` — RΓ_f→RΓ_global→⊕Cone(i_v^+) is an exact triangle.
- `selmerComplex_compactTriangle` — RΓ_c→RΓ_f→⊕U_v^+ is an exact triangle.
- `selmerComplex_map` — Coefficient/field/local-condition maps and homotopies induce a fibre map, with identity and composition.
- `selmerComplex_quasiIso` — Compatible quasi-isomorphic conditions give equivalent Selmer complexes.

**Checks.**

- If every i_v=id, RΓ_f is quasi-isomorphic to RΓ_global.
- If every U_v^+=0, RΓ_f is compact-support cohomology with the same real-place convention.
- For S empty, the fibre is the global complex, without an extra shift.
- Two local conditions with equal H¹ image can give different Selmer H¹ because their H⁰ differs.

*Needs:* ArithmeticGaloisDuality D7 (`compact-support-cochains`); §1.3 (Local conditions and derived orthogonal complements); ArithmeticGaloisDuality R02.1 (`carrier-comparison`).

### 2.22 The H⁰ correction before the classical Selmer kernel

Assume H¹(U_v^+)→H¹(C_v) is injective. With L_v its image, the fibre LES gives 0→J→H¹(RΓ_f)→Sel_L→0, where J=coker[H⁰(C_global)⊕⊕H⁰(U_v^+) --res−i-->⊕H⁰(C_v)]. The right map forgets the uniquely determined local H¹ lifts. Hence H¹(RΓ_f)=Sel_L when this H⁰ arrow is onto; a sufficient hypothesis is H⁰(i_v^+) bijective for every v. Without H¹-injectivity, retain ker(⊕H¹(U_v^+)→⊕H¹(C_v)) in the kernel calculation.

Use the fibre of §2.21; no unconditional identification of fibre H¹ with the classical kernel.

Prove this as follows. Write the LES segment in degrees zero and one, including both global and local-condition H⁰. Project ker[H¹global⊕H¹U→H¹local] to H¹global. Injectivity of H¹i makes each local lift unique. Take the displayed cokernel as J. Without the injectivity hypothesis use the full LES rather than deleting its local kernel.

(Nekovář, §6.1.4, pp. 136–137.)

**Checks.**

- For global complex 0, one local complex k[0] and strict condition, Sel=0 while H¹(fibre)=k.
- For a nonzero U^+ in degree one mapping to zero, the extra local H¹ survives; H¹i injectivity fails.
- Bijective local H⁰ and injective local H¹ give the classical kernel.

*Needs:* §2.21 (Selmer complex as a mapping fibre); §2.2 (Compact and rational Selmer kernel).

### 2.23 Primitive, imprimitive and strict condition-change triangles

For local-condition maps U^+→U′^+ commuting with their maps to C_v, let D_v=Cone(U_v^+→U′_v^+). There is a triangle RΓ_f(U)→RΓ_f(U′)→⊕D_v. At H¹-submodule level L⊆L′ it gives 0→Sel_L→Sel_L′→⊕_v L′_v/L_v, exact at the first three terms, with the remaining cokernel governed by the fibre H² map and H⁰ corrections. Relaxation at Σ replaces U_v^+ by C_v and D_v by U_v^−; strict modification uses zero. Surjectivity of the displayed localization to local quotients is a separate theorem, never part of the definition of imprimitive Selmer.

Finite changed set; maps/homotopies on actual complexes. Kernel-level conclusion uses §2.22 or its correction.

Prove this as follows. Use cone functoriality and the octahedral axiom on res−i. Write the LES of the triangle and compare it with the kernel-level localization map. Record precisely which cokernel is killed by global surjectivity or dual Selmer vanishing in later applications.

(Nekovář, §6.1, pp. 135–137; §7.8, pp. 187–192.)

**Checks.**

- Identical conditions have acyclic difference and equivalent fibres.
- With global module 0 and one nonzero local quotient, Sel_L′→L′/L is not onto.
- Relaxing one place retains exactly its U_v^−, including its degree-zero terms.

*Needs:* §2.21 (Selmer complex as a mapping fibre); §2.22 (The H⁰ correction before the classical Selmer kernel); §2.3 (Change of local conditions).

### 2.24 Lattice changes with global and local errors

For stable lattices T⊂T′⊂V with finite Q=T′/T and compatible local-condition complexes, the cone of RΓ_f(T)→RΓ_f(T′) is the fibre of the global coefficient cone RΓ(Q) and the local-condition cones mapping to the local RΓ(Q). If the local conditions form exact triangles with their Q-condition, this is RΓ_f(Q); otherwise retain their discrepancy cones. For this fibre C_Q, the exact fragment H⁰_f(T′)→H⁰(C_Q)→H¹_f(T)→H¹_f(T′)→H¹(C_Q)→H²_f(T) controls the kernel and cokernel. The discrete map A=V/T→A′=V/T′ has kernel Q and has the corresponding exact triangle in the other order. Rationalization identifies both lattice complexes with the same V-complex, but finite integral errors need not vanish.

Continuous coefficient exact sequences and compatible local maps; Q finite. Saturated propagation of rational conditions does not imply local exactness on every finite quotient.

Prove this as follows. Import the cochain coefficient exact triangle for T→T′→Q. Take the diagram of localization and local-condition triangles; its fibre identifies the cone, including any nonexact local propagation. Read the LES, then invert p to eliminate Q and the finite lattice discrepancies only under the rational comparison hypotheses.

(Nekovář, §6.1.3, pp. 136–137; §8.10, pp. 249–251; Rubin (1999 draft), Chapter I, Lemma 5.4 and Remark 5.5, pp. 11–12.)

**Checks.**

- T=T′ gives Q=0 and an equivalence.
- T′=p^−1T has nonzero finite Q; integral H⁰ and H² errors cannot be removed by rational equality.
- At a bad Tamagawa prime, the raw inertia condition on Q need not equal the condition propagated from V.

*Needs:* §2.21 (Selmer complex as a mapping fibre); §2.5 (Propagating local conditions); ArithmeticGaloisDuality R02.1 (`lattice-torsion-sequence`).

### 2.25 Selmer vanishing descends under injective restriction

For a finite extension F′/F and a Selmer structure stable under restriction at every place, restriction maps Sel_F(M) to Sel_F′(M). If p∤[F′:F] for a p-primary O-module M, cor∘res=[F′:F] makes it injective. Alternatively, if M^(G_L)=0 for the Galois closure L/F of F′, inflation–restriction gives injectivity to L, hence to F′. Therefore Sel_F′(M)=0 implies Sel_F(M)=0 under either hypothesis. For M=ad⁰(r)⊗E/O, vanishing of (ad⁰ r̄)^(G_L) implies vanishing of M^(G_L) by taking the lowest nonzero λ-primary torsion level.

The local conditions must be preserved by restriction. The prime-to-p or invariant-vanishing condition is essential; arbitrary finite extensions do not suffice.

Prove this as follows. Build the semilocal restriction squares and apply the Selmer functoriality API. Prove injectivity using restriction/corestriction or the supplier five-term sequence over the Galois closure. For discrete lattice quotients, every nonzero invariant has a nonzero λ-torsion invariant after multiplying by a power of λ; conclude the residual criterion.

(Calegari–Geraghty–Harris (arXiv v1), Remark after Theorem 1.2, preprint p. 3 (published Appendix A, p. 882).)

**Checks.**

- The identity extension preserves the Selmer group and restriction is injective.
- A nonzero Hom(Gal(L/F),ℤ/p) class restricts to zero when Gal(L/F)=ℤ/p and the coefficient action is trivial.
- For p-degree extensions, the residual-invariant criterion may still give injectivity.

*Needs:* §2.4 (Functoriality of Selmer modules); ArithmeticGaloisDuality R02.2 (`finite-index-descent`); ArithmeticGaloisDuality R02.2 (`compact-five-term`).

### Examples

Let R be a field, global module R², one local module R and localization (x,y)↦y. The strict Selmer group is R×{0}, the relaxed group is R² and the change map is y, with kernel the strict group. For localization zero and local condition zero the Selmer group is all of R², rather than zero. This distinguishes a localization kernel from the local condition itself.

For a fibre Cone(f)[−1] with global and local-condition complexes zero and local cochains R in degree zero, the fibre has H¹=R although the naive kernel of degree-one localization is zero. Thus the H⁰ cokernel J in the fibre/kernel comparison cannot be discarded. In Pontryagin corank, the compact dual of ℚ_p/ℤ_p is ℤ_p and gives corank one; a finite p-primary discrete module gives corank zero.

### Dependencies

Layers 0, 1 and the supplier interfaces above: ArithmeticGaloisDuality D7 (`compact-support-cochains`); ArithmeticGaloisDuality R02.1 (`carrier-comparison`); ArithmeticGaloisDuality R02.1 (`continuous-section-long-exact`); ArithmeticGaloisDuality R02.1 (`lattice-torsion-sequence`); ArithmeticGaloisDuality R02.1 (`lim-one-six-term`); ArithmeticGaloisDuality R02.1 (`mittag-leffler-lim-one`); ArithmeticGaloisDuality R02.1 (`tate-inverse-limit`); ArithmeticGaloisDuality R02.2 (`compact-five-term`); ArithmeticGaloisDuality R02.2 (`finite-index-descent`); ArithmeticGaloisDuality R02.2 (`hochschild-serre-spectral-sequence`); ArithmeticGaloisDuality R02.3 (`h1-finite`); ArithmeticGaloisDuality R02.3 (`localisation-maps`); ArithmeticGaloisDuality R02.3 (`restricted-ramification-group`); ArithmeticGaloisDuality R02.4; ArithmeticGaloisDuality R02.4 (`poitou-tate`); ArithmeticGaloisDuality R02.4 (`restricted-product-cohomology`); ArithmeticGaloisDuality R02.4 (`unramified-exact-annihilators`); Mathlib `ContinuousMonoidHom.comp`; Mathlib `Module.finrank`; Mathlib `MulDistribMulAction.toMonoidHom`; Mathlib `PontryaginDual`; Mathlib `Submodule.map_le_iff_le_comap`; TauCetiRoadmap.EllipticCurves Layer 7; TauCetiRoadmap.LocalFieldsRamification Layer 4; TauCetiRoadmap.ProfiniteCohomology Layer 11; TauCetiRoadmap.ProfiniteCohomology Layer 5.

## Layer 3: Iwasawa cohomology, control and determinants

### 3.1 Iwasawa cohomology

Let R be a complete local noetherian ring with finite residue field of characteristic p, G a profinite group, H a closed normal subgroup, Γ = G/H, 𝒰 the open subgroups U ⊇ H, and M an ind-admissible R[G]-module; M_U = M ⊗_R R[G/U]. RΓ_Iw(G, H; M) is the complex lim_U C^•_cont(G, M_U) of R̄-modules, R̄ = R⟦Γ⟧, and H^i_Iw(G, H; M) its cohomology. There is a spectral sequence E₂^{ij} = lim^{(i)}_{U,cor} H^j_cont(U, M) ⇒ H^{i+j}_Iw(G, H; M); if M is of finite type over R and G satisfies (F) (finite cohomology of finite modules on open subgroups), then H^j_Iw(G, H; M) = lim_{U,cor} H^j_cont(U, M). If moreover 𝒰 has a cofinal chain and p^∞ divides the pro-finite order of Γ, then H⁰_Iw(G, H; M) = 0.

R complete local noetherian; M of finite type over R for the corestriction-limit description; condition (F), which G_{K,S} and local Galois groups satisfy (ArithmeticGaloisDuality R02.4/global-finiteness).

The construction proceeds as follows. The transition maps C^•_cont(G, M_V) → C^•_cont(G, M_U) are surjective, so the projective system is weakly flabby and the first hypercohomology spectral sequence for lim collapses (Jannsen); the second is the stated one, with corestriction transitions by Shapiro's lemma at finite level (ProfiniteCohomology Layer 7). For finite R-length coefficient quotients, (F) gives finite cohomology groups and vanishing higher derived limits. For finite-type complete R-coefficients the cohomology groups are compact, not necessarily finite-length: use exactness of inverse limits of compatible compact groups and the coefficient-limit spectral sequence. Do not assert a Mittag–Leffler condition for an arbitrary corestriction tower of lattices. Use the ArithmeticGaloisDuality R02.1 compact-limit interface to extend finite-level Shapiro to these complete coefficients. H⁰: M^{U_n} stabilises to N, and the corestrictions N → N are multiplication by [U_n : U_{n′}], whose p-part tends to infinity; so the limit vanishes (Rubin, Lemma B.3.2).

(Nekovář, Chapter 8, 8.3.4–8.3.5, p. 203 (Numdam PDF p. 212); Rubin (1999 draft), Appendix B, §3, Lemmas 3.1–3.2, printed p. 154 (PDF p. 164).)

The named operations and identities are:

- `iwasawaComplex` — RΓ_Iw(G, H; M) = lim_U C^•_cont(G, M_U).
- `iwasawaCohomology` — H^i_Iw(G, H; M), an R⟦Γ⟧-module.
- `iwasawaCohomology_equiv_limit` — Under (F): H^j_Iw(G, H; M) ≅ lim_{U,cor} H^j_cont(U, M) (Nekovář 8.3.5(ii)).
- `iwasawaCohomology_zero_eq_bot` — H⁰_Iw(G, H; M) = 0 when p^∞ divides #Γ (8.3.5(iii); Rubin B.3.2).
- `iwasawaCohomology_one_equiv` — lim_F H¹(F, T) = lim_n H¹(F_n, T/p^nT) along a tower (Rubin, Lemma B.3.1).
- `iwasawaCohomology_map` — Natural in M and exact on distinguished triangles.

**Checks.**

- Γ = 1: H^i_Iw(G, G; M) = H^i_cont(G, M).
- Cyclotomic ℤ_p-extension, M=ℤ_p with trivial action: every finite-level H⁰ is ℤ_p, while corestriction multiplies by p along consecutive levels and H⁰_Iw=0. Replacing these transitions by restrictions gives ℤ_p instead.
- For Kato’s j_* convention, §3.15 separately seeks the degree-one comparison with the finite-S Galois norm limit. It gives no all-degree j_*/Rj_* identification: higher inertia cohomology must be retained.
- With restriction instead of corestriction transitions, lim H⁰(F_n, ℚ_p/ℤ_p) = ℚ_p/ℤ_p ≠ 0: the transition maps are part of the definition.

H⁰_Iw = 0 is a consequence of p^∞ | #Γ, not an assumption; torsion of H²_Iw is not asserted here (see §3.4).

*Needs:* §2.9 (Compact and rational Galois Selmer groups); ArithmeticGaloisDuality R02.1 (`mittag-leffler-lim-one`); ArithmeticGaloisDuality R02.1 (`tate-inverse-limit`); ArithmeticGaloisDuality R02.4 (`global-finiteness`); ArithmeticGaloisDuality R02.1 (`cochains-inverse-limit`); TauCetiRoadmap.ProfiniteCohomology Layer 7; TauCetiRoadmap.ProfiniteCohomology Layer 10.

### 3.2 Shapiro's lemma for Iwasawa cohomology

With 𝓕_Γ(M) = lim_U M_U: for M of finite type over R there are canonical R̄[G]-isomorphisms 𝓕_Γ(M) ≅ (M ⊗_R R̄) ⟨−1⟩ and 𝓕_Γ(M)^ι ≅ (M ⊗_R R̄^ι)⟨−1⟩ ≅ (M ⊗_R R̄)⟨1⟩, where ⟨n⟩ twists the G-action by χ_Γ^n, χ_Γ : G → Γ ⊂ R̄^× the tautological character, and ι is the involution γ ↦ γ^{−1}; 𝓕_Γ(M) is of finite type over R̄. The canonical morphism C^•_cont(G, 𝓕_Γ(M)) → lim_U C^•_cont(G, M_U) is an isomorphism, so RΓ_cont(G, 𝓕_Γ(M)) ≅ RΓ_Iw(G, H; M).

M ind-admissible of finite type over R; Γ abelian, Γ ≅ Γ₀ × Δ with Γ₀ ≅ ℤ_p^r and Δ finite.

Prove this as follows. N ⊗_R R̄ = N ⊗_R lim R_U ≅ lim (N ⊗_R R_U) for N of finite type; on 𝓕_Γ(M), x ∈ R̄ acts by id ⊗ ι(x) and g ∈ G by g ⊗ χ_Γ(g), which gives the two isomorphisms (Nekovář 8.4.4.1). The two projective-limit topologies on 𝓕_Γ(M), the m̄-adic and the (U, n)-adic, coincide, because {m̄^N} and {J_U + m^n R̄} are cofinal (J_U = ker(R̄ → R[G/U])); so continuous cochains commute with the limit (8.4.4.2).

(Nekovář, Chapter 8, Proposition 8.4.4.1, p. 206 (Numdam PDF p. 215); Nekovář, Chapter 8, Proposition 8.4.4.2, p. 207 (Numdam PDF p. 216).)

The inverse action is explicit: with the tautological character the Galois action on T ⊗ Λ is g ⊗ χ_Γ(g)^{−1}, in Burungale–Tian §2; the opposite convention is 𝓕_Γ(M)^ι.

*Needs:* §3.1 (Iwasawa cohomology); ArithmeticGaloisDuality R02.1 (`carrier-comparison`); PadicMeasuresIwasawaAlgebras L1.

### 3.3 Descent and control for Iwasawa cohomology

(i) For M supported at the maximal ideal there is the Hochschild–Serre spectral sequence E₂^{ij} = H^i_cont(Γ, H^j_cont(H, M)) ⇒ H^{i+j}_cont(G, M). (ii) If Γ ≅ ℤ_p^r, then RΓ_Iw(G, H; T) ⊗^L_{R̄} R ≅ RΓ_cont(G, T), with a homological spectral sequence E²_{ij} = H_{i,cont}(Γ, H^{−j}_Iw(G, H; T)) ⇒ H^{−i−j}_cont(G, T), each term of finite type over R when G satisfies (F). If Γ ≅ ℤ_p it degenerates into 0 → H^j_Iw(G, H; T)_Γ → H^j_cont(G, T) → H^{j+1}_Iw(G, H; T)^Γ → 0; and if cd_p(G) = e < ∞ and τ_{≤n}T ≅ T, then H^{e+n}_Iw(G, H; T)_Γ ≅ H^{e+n}_cont(G, T). (iii) For a closed Γ′ ≅ ℤ_p^{r′} in Γ with preimage H′, RΓ_Iw(G, H; T) ⊗^L R⟦Γ/Γ′⟧ ≅ RΓ_Iw(G, H′; T), with the analogous spectral sequence and, for Γ′ ≅ ℤ_p, the analogous short exact sequences.

Γ ≅ ℤ_p^r (or Γ′ ≅ ℤ_p^{r′}); T a bounded-below complex of finite type over R.

Prove this as follows. (i) is ArithmeticGaloisDuality's Hochschild–Serre spectral sequence (R02.2). (ii) γ₁ − 1, …, γ_r − 1 is a regular sequence in R̄ with R̄/x ≅ R; tensoring the exact sequences 0 → R̄_{i−1} → R̄_{i−1} → R̄_i → 0 with T and applying §3.2 gives the isomorphism; the Koszul filtration gives the spectral sequence (Nekovář 8.4.8.1). For r = 1 the spectral sequence has two columns (8.4.8.2); (iii) replaces x by the generators of Γ′ (8.4.8.3–8.4.8.4).

(Nekovář, Chapter 8, Proposition 8.4.8.1, p. 214 (Numdam PDF p. 223); Nekovář, Chapter 8, Corollary 8.4.8.2 and Proposition 8.4.8.3, p. 215 (Numdam PDF p. 224).)

The control statements carry their error terms (coinvariants and invariants); no isomorphism H^j_Iw(G, H; T)_Γ ≅ H^j(G, T) is claimed in general.

*Needs:* §3.2 (Shapiro's lemma for Iwasawa cohomology); ArithmeticGaloisDuality R02.2 (`hochschild-serre-spectral-sequence`); ArithmeticGaloisDuality R02.2 (`first-quadrant-spectral-sequence`); PadicMeasuresIwasawaAlgebras L1.

### 3.4 A criterion for torsion Iwasawa cohomology

Assume Γ ≅ ℤ_p^r, G satisfies (F) and cd_p(G) < ∞. Let 𝔭 ∈ Spec(R) and 𝔭̄ ∈ Spec(R̄) its preimage under the augmentation R̄ → R. If T ∈ D^b of finite type over R has RΓ_cont(G, T)_𝔭 ≅ 0, then RΓ_cont(G, 𝓕_Γ(T))_𝔭̄ ≅ 0.

The vanishing of the specialised complex at 𝔭 is a hypothesis.

Prove this as follows. §3.3 (ii) localised at 𝔭 gives E²_{ij} = H_{i,cont}(Γ, H^{−j})_𝔭 ⇒ H^{−i−j}_cont(G, T)_𝔭 = 0, with finitely many nonzero terms. If E²_{0,j} = 0 then all E²_{i,j} = 0 (Nekovář 7.2.7 and Lemma 8.10.5); by induction on j, (H^{−j})_𝔭̄/J = 0 for the augmentation ideal J ⊆ 𝔭̄, and Nakayama's lemma gives H^{−j}_𝔭̄ = 0.

(Nekovář, Chapter 8, Proposition 8.4.8.5, p. 216 (Numdam PDF p. 225).)

This is the form in which torsion of H²_Iw and of Selmer duals is proved; it is a separate conclusion from a specialisation hypothesis, with its specialization hypothesis retained.

*Needs:* §3.3 (Descent and control for Iwasawa cohomology); §3.2 (Shapiro's lemma for Iwasawa cohomology).

### 3.5 Universal norms are unramified away from p

Let T be finitely generated over ℤ_p. (i) If K/ℚ_ℓ is finite with ℓ ≠ p and K_∞ its unramified ℤ_p-extension, every norm-compatible {c_F} ∈ lim H¹(F, T) has c_F ∈ H¹_ur(F, T). (ii) If K is a number field, K_∞/K abelian with Gal(K_∞/K) ≅ ℤ_p^d, and λ ∤ p a prime of F whose decomposition group in Gal(K_∞/K) is infinite, then (c_F)_λ ∈ H¹_ur(F_λ, T). (iii) If S contains the primes where T is ramified, those above p, those with finite decomposition group in Gal(K_∞/K) and the infinite places, then lim_F H¹(F, T) = lim_F H¹(K_S/F, T).

ℓ ≠ p in (i); d ≥ 1.

Prove this as follows. (i) 0 → H¹_ur(F, T) → H¹(F, T) → H¹(I, T)^{G_F}, with H¹(I, T) finitely generated over ℤ_p (Rubin, Proposition B.2.7(iii)); the limit of the last terms vanishes by §3.1's H⁰ statement (Lemma B.3.2). (ii) Choose F′ ⊆ F_∞ with Gal(F_∞/F′) ≅ ℤ_p undecomposed at λ̄ and apply (i); corestrict. (iii) By (ii) the restriction of c_F to each inertia group outside S vanishes, so its cocycles factor through Gal(K_S/F).

(Rubin (1999 draft), Appendix B, §3, Proposition 3.3, printed p. 154 (PDF p. 164).)

Only for primes not above p; the places above p and those that split finitely are kept in S.

*Needs:* §3.1 (Iwasawa cohomology); §2.7 (The unramified condition); ArithmeticGaloisDuality R02.3 (`restricted-ramification-group`); TauCetiRoadmap.LocalFieldsRamification Layer 4.

### 3.6 Semilocal cohomology and descent of local classes

Let K be a number field, q a prime of K, F/K finite and S the primes of F above q, with decomposition groups D_Q = g_Q^{−1} D g_Q. For a discrete G_K-module T and a D-submodule T′, H^i(F, Ind_D^{G_K}(T′)) ≅ ⊕_{Q∈S} H^i(F_Q, T′_Q); in particular H^i(G_F, Ind_D(T)) ≅ ⊕_Q H^i(F_Q, T) and H^i(G_F, Ind_D(T^I)) ≅ ⊕_Q H^i(F_Q, T^{I_Q}). For F/K finite Galois and T finitely generated over ℤ_p, restriction gives H¹(K_q, T) ≅ (⊕_{Q|q} H¹(F_Q, T))^{Gal(F/K)} if [F : K] is prime to p, and H¹(K_q, V) ≅ (⊕_{Q|q} H¹(F_Q, V))^{Gal(F/K)} always.

T discrete for the induction statements; finitely generated over ℤ_p for the descent.

Prove this as follows. D\G_K/G_F ↔ S by D g G_F ↦ g^{−1}Q₀; the double-coset form of Shapiro's lemma (Rubin, Proposition B.4.2; ProfiniteCohomology Layers 6–7) gives the decomposition. Descent: ArithmeticGaloisDuality R02.2/finite-index-descent applied to the semilocal module; for V, finite groups have no rational cohomology.

(Rubin (1999 draft), Appendix B, §5, Proposition 5.1, printed p. 157 (PDF p. 167).)

This is how infinite-level local conditions are defined: as limits of semilocal conditions, not as conditions over a 'completion' of K_∞.

*Needs:* §3.1 (Iwasawa cohomology); ArithmeticGaloisDuality R02.2 (`finite-index-descent`); TauCetiRoadmap.ProfiniteCohomology Layer 6; TauCetiRoadmap.ProfiniteCohomology Layer 7.

### 3.7 Twisting Iwasawa cohomology

For the cyclotomic Γ=Gal(ℚ(μ_(p∞))/ℚ), choose t=(ζ_(p^n))_n in ℤ_p(1), with ζ_(p^(n+1))^p=ζ_(p^n). For k∈ℤ let t^k denote the corresponding generator of ℤ_p(k), using the dual generator for negative k. This trivializes the Tate line over the infinite field, rather than over each finite layer with integral coefficients. The resulting twist isomorphism φ_k:H^q_Iw(T)≃H^q_Iw(T(k)) is O-linear and satisfies φ_k(λx)=Tw_k(λ)φ_k(x), where Tw_k(σ)=κ(σ)^−kσ. For a finite S containing p, infinity and coefficient ramification, augmentation specialization gives H¹_Iw(V)→H¹(G_(ℚ,S),V(k)), factoring through the specialization prime σ_c↦c^−k.

Cyclotomic tower; T finite free over O with continuous action; chosen compatible generators. Rational Iwasawa cohomology is H^q_Iw(T)⊗_ℤpℚ_p, retaining bounded denominators. For p=2, the degree statements use the real-place conventions already specified.

Prove this as follows. On the infinite Galois subgroup, t^k identifies the coefficient representations and their cochains. Transfer this identification to the completed induced coefficients of §3.2. At degree one, Rubin's diagonal limit identifies the construction with cup product on H¹(F_n,T/p^nT) using the invariant generator t_n^k of (ℤ/p^n)(k); reduction of t_(n+1)^k gives t_n^k. The projection formula makes these cup maps compatible with corestriction combined with coefficient reduction. There is no claim that integral lattice H⁰ roots form a corestriction-compatible system. For σ∈Γ, σt^k=κ(σ)^kt^k; thus φ_k(σx)=κ(σ)^−kσφ_k(x). The inverse uses t^−k. Apply derived augmentation control to obtain the finite-S specialization.

(Kato, Theorem 12.5(1), p. 221, the roots-of-unity cup-product isomorphism; Rubin (1999 draft), Appendix B, Lemma 3.1, printed pp. 153–154 (PDF pp. 163–164); Burungale–Tian (arXiv v2), §2.2.2, p. 4 and §3, equation (3.2), p. 6.)

**Checks.**

- For k=0 the chosen coefficient identification and Tw₀ are the identity.
- For k=1 and κ(γ)=4 over ℚ₃, φ₁(γx)=(1/4)γφ₁(x); the opposite scalar 4 fails.
- For k=−1 the dual generator is used, and φ_(−1)φ₁ is the identity; a negative tensor power of a finite root is not a definition.
- The inverse corestriction limit of finitely generated lattice H⁰ is zero in an infinite p-tower (§3.1). It cannot contain a nonzero integral Tate generator. The roots used in the diagonal degree-one construction are finite-coefficient invariant generators with coefficient-reduction compatibility.

*Needs:* §3.1 (Iwasawa cohomology); §3.2 (Shapiro's lemma for Iwasawa cohomology); §3.3 (Descent and control for Iwasawa cohomology); PadicMeasuresIwasawaAlgebras L1; TauCetiRoadmap.ProfiniteCohomology Layer 12.

### 3.8 Iwasawa Selmer complex and completed action

For Γ=Gal(F∞/F)≅ℤ_p^d, Λ=O[[Γ]], define the infinite compact Selmer complex as Rlim_n RΓ_f(F_n,T;U_n), with corestriction, and the discrete complex as colim_n RΓ_f(F_n,A;U_n), with restriction. Choose actual local maps, transition maps and their coherent comparison homotopies. Shapiro identifies the compact complex with the finite-S fibre for T_Λ=Λ⊗̂_O T on which g acts by [g]^−1⊗g. At a place v use the induced semilocal Λ-module from its decomposition subgroup Γ_v. The completed action is continuous, and the compact/discrete actions are paired contragrediently. F∞,v is never treated as a locally compact local field.

Finite S containing p, infinite places and coefficient ramification; finitely generated compatible local coefficient complexes. Nekovář condition (U): added non-p places are unramified in the tower, or their ramification errors are retained.

The construction proceeds as follows. Import completed induction, infinite Shapiro and derived coefficient limits from AGD and the completed group ring from PMIA. Form the inverse-limit diagram of L2 fibres. Identify global and semilocal vertices by Shapiro, including the inverse Γ-action. Transport the compatible local maps and homotopies; take the fibre and its continuous Λ-action. For the discrete tower use filtered restriction colimits and its Pontryagin dual.

(Nekovář, §8.5.6, p. 220; §§8.6 and 8.8, pp. 221–237.)

The named operations and identities are:

- `iwasawaSelmerComplex` — The corestriction derived inverse limit of the finite-level fibres.
- `discreteInfiniteSelmerComplex` — The restriction colimit of the discrete finite-level fibres.
- `iwasawaSelmerComplex_shapiro` — Equivalent to the induced-coefficient finite-S fibre.
- `iwasawaSelmerComplex_action` — Continuous Λ-action with inverse action on the induced factor.
- `iwasawaSelmerComplex_semilocal` — Induction from Γ_v represents the sum over all places above v.

**Checks.**

- A constant tower of relaxed conditions reduces to global Iwasawa cohomology.
- Under a generator γ, evaluation on an induced function translates by γ^−1; direct γ-translation gives the wrong Shapiro map.
- If Γ_v=1, the finite-level local sum has [Γ:Γ_n] summands; one local factor is incorrect.

*Needs:* §2.21 (Selmer complex as a mapping fibre); §3.2 (Shapiro's lemma for Iwasawa cohomology); §3.6 (Semilocal cohomology and descent of local classes); PadicMeasuresIwasawaAlgebras L1.

### 3.9 Local specialization correction complex

For a specialization Λ→R and a specified local condition i:U^+→C_v,Iw with specialized finite-level condition i_R:U_R^+→C_v,R, define E_v(R)=Cone(U^+⊗^L_ΛR→U_R^+) using the actual comparison map. When ambient global/local cochains satisfy derived base change, the cone of RΓ_f,Iw⊗^L R→RΓ_f,R is ⊕E_v(R), with the orientation determined by the condition-change triangle. Its LES records all local correction groups. An exceptional eigenvalue or finite-slope condition is encoded by the provided local map; this construction supplies no (φ,Γ)-module regulator.

A specified coherent specialization map on U^+ and ambient cochains; finite changed set.

The construction proceeds as follows. Construct the comparison arrow and its cone in the same derived category as the Selmer fibre. Use the diagram of fibres and the octahedral axiom; the ambient comparison cones are zero by hypothesis. Read the resulting LES and prove naturality under a second specialization.

(Nekovář, §6.1, pp. 135–137; §8.10, pp. 249–251.)

The named operations and identities are:

- `localSpecializationError` — Cone of the local-condition specialization map.
- `localSpecializationError_acyclic_iff` — Acyclic iff the specified local comparison is a quasi-isomorphism.
- `selmerSpecialization_errorTriangle` — The fibre comparison has the direct sum of these errors as its cone.
- `localSpecializationError_map` — Coherent specialization maps induce maps of error triangles.

**Checks.**

- Identity comparison has acyclic error.
- A failed degree-zero comparison contributes to the control LES even if local H¹ images agree.
- Nonflat U^+ must be derived-tensored; ordinary tensor can delete a Tor correction.

*Needs:* §2.23 (Primitive, imprimitive and strict condition-change triangles); §3.8 (Iwasawa Selmer complex and completed action); PadicMeasuresIwasawaAlgebras L5.

### 3.10 Derived specialization and control spectral sequence

For compatible induced local conditions with derived base-change equivalences, RΓ_f,Iw⊗^L_Λ Λ_n≃RΓ_f(F_n,T), where Λ_n=O[Γ/Γ_n]. The spectral sequence Tor_i^Λ(H^j_f,Iw,Λ_n)⇒H^(j−i)_f(F_n,T) has its natural edge maps. For Γ=ℤ_p and Λ_n=Λ/(γ^(p^n)−1), this yields 0→H^j_f,Iw/(γ^(p^n)−1)→H^j_f(F_n,T)→H^(j+1)_f,Iw[γ^(p^n)−1]→0. Local conditions without derived base change contribute the correction complex of §3.9. No unconditional specialization isomorphism is asserted.

Bounded cohomology and supplier derived-completion/base-change hypotheses. Local maps, not only their H¹ images, must commute with derived specialization.

Prove this as follows. Use infinite Shapiro for each vertex of the fibre and derived base change for the coefficient complexes. Tensor the fibre triangle, using the stated local base-change equivalences; obtain the comparison map. Use a projective resolution of Λ_n. For d=1 the two-term resolution yields the displayed short exact sequence, including the degree j+1 torsion.

(Nekovář, §8.10, especially §§8.10.1–8.10.5, pp. 249–251.)

**Checks.**

- A complex with only H²=Λ/(γ−1) contributes O to finite-level H¹.
- A complex with only a Λ-free H¹ specializes without a Tor error.
- For Γ=ℤ_p², higher Tor can survive; a universal short exact sequence is false.

*Needs:* §3.8 (Iwasawa Selmer complex and completed action); ArithmeticGaloisDuality R02.1 (`cochains-inverse-limit`); PadicMeasuresIwasawaAlgebras L5.

### 3.11 Classical restriction control with invariants and localization errors

Put H_n=H¹(G_(F_n,S),A), H∞=H¹(G_(F∞,S),A), and Q_n=⊕H¹(F_n,w,A)/L_n,w. Inflation–restriction gives ker(H_n→H∞^Γ_n)=H¹(Γ_n,A^G_(F∞,S)); its cokernel is the appropriate subgroup of H²(Γ_n,A^G_(F∞,S)). Compute local restriction by the same sequence for Γ_n,w and by the maps of inertia quotients. Let I_n=im(H_n→Q_n) and I∞,n=im(H∞^Γ_n→Q∞^Γ_n). Snake on 0→Sel→H→I→0 gives 0→ker SelRes→ker HRes→ker(I_n→I∞,n)→coker SelRes→coker HRes→coker(I_n→I∞,n)→0. Identify I-errors through the Q-errors and localization cokernels C=Q/I. Only when localization is onto at both levels may I be replaced by Q. Thus the control criterion is vanishing or boundedness of these explicitly computed invariant, inertia and C-errors. The bottom short exact row uses I∞,n; it is generally smaller than (im(H∞→Q∞))^Γ_n. Its comparison with that larger group has the H¹(Γ_n,Sel∞) error.

A is discrete p-primary; local conditions are restriction-compatible; use invariants of the exact infinite-level sequence, including H¹(Γ_n,Sel∞) when comparing its image with I∞^Γ_n. The superscript invariants does not preserve right exactness.

Prove this as follows. Apply the supplier five-term sequences globally and locally, including the decomposition subgroup and inertia maps. Use the actual image of the localization map and take invariants with their derived terms; construct the commuting short exact rows. Apply the snake lemma to those rows. Compare I with Q by their cokernel sequences; retain H¹ of the Γ-invariants functor and localization failures.

(Nekovář, §§8.10.1–8.10.5, pp. 249–251; Rubin (1999 draft), Appendix B §3, pp. 153–155.)

**Checks.**

- A^G∞=0 kills the global five-term kernel but does not by itself kill every local-condition error.
- If H=0 and Q≠0, localization is not onto and replacing I by Q in the snake sequence is invalid.
- A trivial ordinary quotient at p can have a nonzero unramified control term even when generic specialization is exact.

*Needs:* §2.4 (Functoriality of Selmer modules); §2.23 (Primitive, imprimitive and strict condition-change triangles); ArithmeticGaloisDuality R02.2 (`compact-five-term`); §3.10 (Derived specialization and control spectral sequence).

### 3.12 Iwasawa duality with the involution and local errors

For perfect coefficient duals T and T^*(1), transport L1 duality to induced coefficients. For Γ≅ℤ_p^d and the regular local ring Λ=O[[Γ]], use coefficient duality with Λ placed in degree zero and obtain RΓ_f,Iw(T)→RHom_Λ(RΓ_f,Iw(T^*(1)),Λ)^ι[−3], where ι(γ)=γ^−1. Its cone is the sum of the induced local complement errors. With elementary coefficient complements at p and the precise unramified conditions elsewhere, calculate which errors vanish and which survive (including Tamagawa terms); derived duality is an equivalence only after those errors vanish. This is compatible with finite-level specialization, global degree-three duality and local degree-two pairings.

Perfectness/dualizing coefficient hypotheses of Nekovář §8.9 and the imported AGD duality; tower condition (U); condition (P): p odd or F has no real places. The p=2 real-place version uses ArithmeticGaloisDuality D7.5’s modified compact-support construction in the unbounded derived category; no bounded integral amplitude is claimed. A height-one disappearance of an error is weaker than its integral acyclicity. Here the compact dual T^*(1) means Hom_O(T,O)(1); it is distinct from Rubin’s discrete T^*=Hom_O(T,E/O)(1). Λ is the degree-zero coefficient dualizing module in this normalization; using an absolute dualizing complex shifted by dim Λ requires the compensating shift. The displayed shift is the arithmetic degree-three normalization.

Prove this as follows. Identify compact and discrete tower duals using Shapiro and the Pontryagin involution. Apply the parametric global-fibre duality to the induced coefficients. Compute the elementary ordinary complements and the unramified local adjoint cones; retain the nonacyclic cones and apply derived control to specialize.

(Nekovář, §8.5.6, p. 220; §§8.9.6–8.9.7, pp. 240–244.)

**Checks.**

- A γ-eigencharacter c is paired with c^−1, rather than c.
- A nontrivial local Tamagawa error prevents an integral quasi-isomorphism.
- A finite Λ-error disappears at height one but must remain in the integral triangle.

*Needs:* §1.4 (Duality for a global mapping fibre with local conditions); §3.8 (Iwasawa Selmer complex and completed action); §2.10 (Pontryagin duals with the contragredient action); PadicMeasuresIwasawaAlgebras L5.

### 3.13 Finite generation, amplitude and local Euler ranks

For the cyclotomic ℤ_p-extension, p odd, finite S and finite free T, global Iwasawa cohomology is finitely generated over Λ and concentrated in degrees one and two under the standard global H⁰-vanishing hypothesis. The amplitude statement for p=2 with real places requires modified compact-support cochains and is outside these hypotheses. Its rank difference is rank_Λ H¹_Iw−rank_Λ H²_Iw=Σ_(v real) rank_O T^(c_v=−1)+Σ_(v complex) rank_O T. At a p-adic place K, rank_Λ H¹_Iw(K,T)=[K:ℚ_p]rank_O T and H²_Iw(K,T) is torsion. Global H² torsion is an additional weak-Leopoldt assertion. For arbitrary ℤ_p^d extensions the conclusion is finite generation/perfectness only with the supplier finite-resolution and local conditions, not a universal cyclotomic rank formula.

Canonical compact cochains; p odd for the displayed cyclotomic rank formulas. The p=2 real-place comparison uses ArithmeticGaloisDuality D7.5 and does not give the same bounded integral amplitude.

Prove this as follows. Use induced coefficients, finite mod-λ cohomology and compact Nakayama for finite generation. Use the supplier cohomological-dimension and H⁰ statements to establish the amplitude actually available. Apply global and local Euler characteristics after passage to finite levels and normalize by tower degree. Retain the global H² rank rather than asserting its vanishing.

(Kato, §12.2, formulas (12.2.1)–(12.2.3), p. 220; §13.8, pp. 227–229. The displayed general-number-field rank formula uses the global Euler-characteristic supplier.)

*Needs:* §3.2 (Shapiro's lemma for Iwasawa cohomology); ArithmeticGaloisDuality R02.4 (`global-finiteness`); ArithmeticGaloisDuality D7 (`compact-support-euler-characteristic`); PadicMeasuresIwasawaAlgebras L1.

### 3.14 Determinant line and its height-one characteristic divisor

For a perfect Λ-Selmer complex C, define its arithmetic determinant line 𝔇(C)=(det_Λ C)⁻¹ using the PMIA L5 determinant functor. If C⊗Frac(Λ) is acyclic, the canonical fraction-field trivialization identifies 𝔇(C) with a fractional invertible lattice whose height-one valuation is Σ_i(−1)^i length_(Λ_𝔭) H^i(C)_𝔭. Thus for cohomology only in degrees one and two its divisor is char H²/char H¹. The inverse determinant is essential for this sign convention. If generic cohomology has positive rank, determinant is a line without a canonical scalar trivialization; a regulator/leading-term trivialization is separate input. Base change and duality induce the determinant comparisons only for the corresponding perfect derived complexes.

Λ Noetherian normal domain, C perfect, torsion cohomology for the scalar divisor statement. For nonregular multi-variable coefficients request the precise perfectness rather than infer it from finite generation.

The construction proceeds as follows. Import determinant functor, exact-triangle multiplicativity and fraction-field trivialization from PMIA L5. Localize at a height-one DVR and compute the determinant of a two-term free resolution of each torsion cohomology module. Multiply with the cohomological signs and transport through specialization/duality. Record local-error determinants as factors in these comparisons.

(Nekovář, §8.9, pp. 238–244; §8.10, pp. 249–251; Kato, §12.2, pp. 220–221.)

The named operations and identities are:

- `selmerDeterminant` — The arithmetic line (det_Λ C)⁻¹ of a perfect Selmer complex, with the stated cohomological sign.
- `selmerDeterminant_triangle` — Exact triangles give multiplicative line equivalences.
- `selmerDeterminant_torsionDivisor` — The signed height-one cohomology lengths give the divisor.
- `selmerDeterminant_baseChange` — Derived base change gives the corresponding line equivalence.

**Checks.**

- An acyclic perfect complex has the unit line and zero divisor.
- For H¹=Λ/(a), H²=Λ/(b), the divisor is (b)/(a), so reversing the cohomological sign fails.
- A free nonzero H¹ prevents a canonical torsion scalar trivialization.

*Needs:* §3.8 (Iwasawa Selmer complex and completed action); PadicMeasuresIwasawaAlgebras L5; PadicMeasuresIwasawaAlgebras L4/characteristic-ideal.

### 3.15 Étale j-star and continuous cohomology comparison

Put X=Spec O_F[1/p], U=X minus the finite non-p ramification set, j:U→X, and let T be a lisse lattice on U. Construct the arithmetic K(π,1) identification RΓ_et(U,T)≅RΓ_cont(G_(F,S),T), with integral coefficients defined by derived inverse limits. **Unsupplied prerequisite.** The general finite-coefficient arithmetic comparison and its real-place modification are not targets of SchemeAndStackFoundations SF.6; its proof must be decomposed separately. Kato’s cited degree-one norm comparison alone does not prove this all-degree identification. At finite coefficient level the Leray edge sequence is 0→H¹_et(X,j_*T)→H¹(G_(F,S),T)→⊕_(v∈S,v∤p) H¹(I_v,T)^(Fr_v=1); the lattice version retains the coefficient-limit H⁰ corrections unless their Mittag–Leffler hypotheses hold. Thus j_* imposes unramified H¹ at the omitted non-p primes and no finite condition at p. In a cyclotomic norm tower whose decomposition subgroup at every such non-p prime is infinite, universal norm classes are unramified there, and inverse-corestriction H¹_et(X_n,j_*T) identifies with H¹_Iw(G_(F,S),T), under these coefficient-limit hypotheses. This assertion is in degree one: higher R^q j_* inertia terms obstruct a general j_*/Rj_* complex equivalence.

Finite S and finite ramification of T. Derived inverse-limit comparison and the actual residue extension at each omitted prime. Import the arithmetic K(π,1) comparison for p-primary lisse coefficients on Spec O_F[1/S] with p inverted (and the modified real convention), not merely the equivalence of finite étale covers with π₁-sets.

Prove this as follows. Supply the arithmetic K(π,1) comparison, including acyclicity of the arithmetic universal cover for these coefficients, before using the finite-coefficient Leray spectral sequence. Identify the stalks R^q j_*T with H^q(I_v,T), giving the displayed degree-one edge sequence. Pass to lattice coefficients by the Milnor exact sequence; retain lim¹ H⁰ until its finiteness/Mittag–Leffler hypothesis is verified. Apply §3.5 at every omitted non-p place in the cyclotomic tower. The norm-compatible global H¹ classes have zero singular localization, so the finite-level injections identify their inverse-corestriction limits. Unramified restriction colimits also vanish locally, but are a different limit.

(Kato, §§8.2 and 8.5, pp. 180–184; §12.2, pp. 220–221; Rubin (1999 draft), Appendix B, Proposition 3.3 and Corollaries 3.4–3.5, printed pp. 154–155 (PDF pp. 164–165).)

*Needs:* §3.2 (Shapiro's lemma for Iwasawa cohomology); ArithmeticGaloisDuality R02.1 (`carrier-comparison`); SchemeAndStackFoundations SF.2 (sites and Leray), plus the unsupplied arithmetic comparison above; §3.5 (Universal norms are unramified away from p).

### 3.16 Lattice independence, twists and degree-one specialization

The rationalized Iwasawa complex and its rational specializations depend only on V: finite lattice quotients disappear after inverting p. A Tate twist by k is semilinear for Tw_k(γ)=χ_cyc(γ)^−kγ on the Λ factor; specialization for V(k) is at the kernel of γ↦χ_cyc(γ)^−k with the convention of §3.7. For Γ=ℤ_p, the degree-one specialization sequence retains H²_Iw[𝔮]. If the specialized H² vanishes and the localized complex has amplitude ≤2, derived control and Nakayama kill H²_Iw,𝔮 and hence that Tor correction. The finite-level H² calculation itself retains H³_Iw[𝔮] until the amplitude theorem removes it.

Rational coefficients at specialization; a specified character convention; the vanishing assertion and amplitude are separate inputs.

Prove this as follows. Apply §2.24 and rationalization to finite quotient errors. Compute the induced coefficient action after twisting, yielding the stated automorphism and specialization prime. Apply §3.10 in degrees one and two. Use the amplitude hypothesis and Nakayama at 𝔮 for the asserted H² vanishing implication.

(Burungale–Tian (arXiv v2), Version 2, §2, p. 4; §3, pp. 5–6, equation (3.1).)

*Needs:* §2.24 (Lattice changes with global and local errors); §3.7 (Twisting Iwasawa cohomology); §3.10 (Derived specialization and control spectral sequence); §3.13 (Finite generation, amplitude and local Euler ranks).

### 3.17 Local cofreedom and an away-p Euler factor

In the CGLS anticyclotomic setting K imaginary quadratic, p odd split, Γ≅ℤ_p and Λ=ℤ_p[[Γ]], let M_θ=ℤ_p(θ)⊗Λ^∨ with action θ⊗Ψ^−1. At w∤p with finite-index decomposition subgroup, H¹(K_w,M_θ)^∨ is torsion with characteristic ideal generated by P_w(ℓ^−1γ_w), P_w(X)=det(1−Fr_w X|V_θ^I_w), using arithmetic Frobenius γ_w; its μ-invariant is zero. At w|p, θ|G_w≠1,ω implies H⁰=H²=0, restriction H¹→H¹(I_w)^G_w/I_w is an isomorphism, and H¹ is Λ-cofree rank one. For an elliptic curve satisfying Lemma 1.3.1’s good-reduction and E(K_w)[p]=0 hypotheses, the corresponding local H¹ is cofree rank two. These are the stated cases, not every representation at every place.

CGLS §1.1’s finite character and anticyclotomic tower. The mod-p trivial and cyclotomic characters are explicitly excluded in the at-p character case. θ is the Teichmüller lift of a character G_K→𝔽_pˣ with conductor supported on split primes, as in CGLS §1.1. For the non-p formula w lies above a rational split prime ℓ; then Norm(w)=ℓ and its decomposition subgroup has finite index. The elliptic specialization uses E/ℚ with the stated good ordinary p-reduction.

Prove this as follows. Compute away-p inertia/residue cohomology and identify its dual presentation by 1−ℓ^−1γ_w Fr_w. At p use local duality and the excluded characters to kill H⁰,H²; reduction gives a torsion-free free specialization. Apply Lemma 1.1.2’s compact Nakayama criterion X[γ−1]=0 and free X/(γ−1) to obtain Λ-freeness. For the elliptic case apply Lemma 1.3.1.

(Castella–Grossi–Lee–Skinner (author preprint), §1.1, Lemmas 1.1.1–1.1.2 and Proposition 1.1.3, pp. 6–7; Lemma 1.3.1, p. 10.)

**Checks.**

- The trivial residual character can have H⁰ and is excluded.
- The cyclotomic residual character can have dual H⁰ and is excluded.
- Replacing arithmetic γ_w by its inverse without changing conventions changes the displayed Euler polynomial.

*Needs:* §3.6 (Semilocal cohomology and descent of local classes); ArithmeticGaloisDuality R02.4 (`poitou-tate`); PadicMeasuresIwasawaAlgebras L4/characteristic-ideal.

### 3.18 Checkable hypotheses for ordinary Selmer structure

For Λ=O[[T]], let D=T₀⊗_ΛΛ^∨ with T₀ finite free. Then T₀* = Hom(D,μ_(p∞)) is the compact Tate dual; Greenberg’s discrete D* is T₀*⊗_ΛΛ^∨. Record RFX (T₀ reflexive), LOC2_v (T₀*/H⁰(F_v,T₀*) reflexive), LOC1_η (H⁰(F_η,T₀*)=0 at one finite η), LEO (ker[H²(global,D)→⊕H²(local,D)] Λ-cotorsion), CRK (corank H¹global=corank Sel+corank Q), and almost divisibility of the chosen local conditions (multiplication by each height-one parameter is onto except for finitely many height-one primes). Record additionally Greenberg’s alternative (a), (b) or (c): residual exclusion of μ_p as subquotient; cofree D with exclusion as quotient; or a finite η with dual H⁰ zero and Q_η divisible/coreflexive as required by the theorem. These are explicit propositions on modules and maps, not inferred from residual irreducibility alone.

Finite S; p odd for the applications here; finitely generated compact duals. In dimension two with finite residue field, pseudo-null finitely generated modules have finite length and finite cardinality. Higher-dimensional pseudo-null is not synonymous with finite. The residual module in alternatives (a),(b) is D[𝔪_Λ] as a G_(F,S)-module, and μ_p has its mod-p cyclotomic action. In alternative (c), η is finite and H⁰(F_η,T₀*)=0; the localization-surjectivity theorem requires divisible Q_η, while the no-pseudo-null theorem requires coreflexive Q_η.

The construction proceeds as follows. Define every hypothesis using the actual localization maps, reflexive duals and height-one localizations. Translate almost divisibility of a discrete module into absence of nonzero pseudo-null submodules of its compact dual. Provide proof fields only for the hypotheses a concrete representation establishes; keep LEO and CRK separate.

(Greenberg (author preprint), §2, pp. 5–11; §4.1, pp. 19–20.)

The named operations and identities are:

- `GreenbergStructureHypotheses` — The listed module and localization predicates, with the chosen alternative.
- `almostDivisible_dual` — Equivalent to the compact dual having no nonzero pseudo-null submodule.
- `greenbergHypotheses_imprimitive` — Tracks exactly which LOC1 and local divisibility hypotheses are supplied by relaxing a finite place.

**Checks.**

- The zero representation satisfies the zero-rank, local and localization predicates.
- A residual irreducibility proof supplies the residual exclusion for rank at least two, but supplies neither LEO nor CRK.
- Over O[[T₁,T₂]], Λ/(T₁,T₂) is pseudo-null and can be infinite; the finite equivalence must be restricted to dimension two.

*Needs:* §2.10 (Pontryagin duals with the contragredient action); §2.11 (Coranks); PadicMeasuresIwasawaAlgebras L4.

### 3.19 Surjectivity of global ordinary localization

Under Greenberg Proposition 2.6.3’s hypotheses D Λ-divisible, LEO, CRK and one of alternatives (a), (b), (c) of §3.18 (with Q_η divisible in (c)), the map H¹(G_(F,S),D)→Q=⊕H¹(F_v,D)/L_v is onto. Thus primitive/imprimitive change of conditions has the asserted right exact local-quotient map only under these hypotheses. For ordinary elliptic curves in the cyclotomic tower, p odd, good ordinary reduction, E(F)[p]=0 and cotorsion Selmer imply the hypotheses by Greenberg §4.4’s local/Euler computation. For general ordinary representations these hypotheses remain explicit.

The exact Proposition 2.6.3 alternative is part of the input. Residual irreducibility of rank at least two rules out a μ_p subquotient but does not replace LEO or CRK.

Prove this as follows. Apply Poitou–Tate and the localization corank equality to show its cokernel is cotorsion. Use LEO and the selected residual/local alternative to eliminate that cotorsion cokernel as in Greenberg Proposition 2.6.3. For the elliptic application compute the local quotient ranks, H⁰ and Euler rank difference; cotorsion Selmer gives CRK and the stated weak-Leopoldt condition.

(Greenberg (author preprint), Proposition 2.6.3, p. 11; §4.4, pp. 24–25.)

**Checks.**

- A cotorsion localization cokernel alone need not vanish.
- After relaxing Σ, the surjective map gives Sel^Σ/Sel≅⊕_(v∈Σ)Q_v.
- An irreducible residual rank-one cyclotomic character contains μ_p and does not satisfy alternative (a).

*Needs:* §3.18 (Checkable hypotheses for ordinary Selmer structure); §2.19 (Poitou–Tate for Selmer groups); §3.13 (Finite generation, amplitude and local Euler ranks).

### 3.20 No pseudo-null submodule of the ordinary Selmer dual

Assume RFX, LEO, LOC2 at every place, LOC1 at one finite place, local-condition almost divisibility, CRK and one of Greenberg Proposition 4.1.1’s alternatives, using coreflexive Q_η in its third alternative. Then Sel is almost divisible, and X=Sel^∨ has no nonzero pseudo-null Λ-submodule. For Λ=O[[T]] this means no nonzero finite submodule. Proposition 4.2.1 supplies the imprimitive version when the relaxed set contains a suitable finite LOC1 place. The cyclotomic ordinary elliptic case of Greenberg §4.4 follows under p odd, E(F)[p]=0, good ordinary p-reduction and cotorsion Selmer. CGLS Corollary 1.4.3 concerns its stated imprimitive anticyclotomic Selmer dual and is not a universal primitive assertion.

Finite generated X; retain all Greenberg local/global hypotheses and distinguish the primitive and imprimitive conditions.

Prove this as follows. Use the quotient diagram and almost divisibility of the local conditions to show that the Selmer kernel is almost divisible, with the selected alternative handling the exceptional cokernel. Dualize the height-one multiplication criterion to exclude every pseudo-null submodule. For the dimension-two cyclotomic algebra identify pseudo-null finite generated modules with finite modules. Verify the elliptic and stated imprimitive examples separately.

(Greenberg (author preprint), Propositions 4.1.1 and 4.2.1, pp. 19–21; §§4.3–4.4, pp. 21–25.)

**Checks.**

- The module Λ/(λ,T) is torsion but has a nonzero finite submodule; torsion does not suffice.
- The imprimitive theorem cannot be transferred to a primitive dual without controlling its local quotient.
- The stated elliptic cyclotomic hypotheses imply the no-finite-submodule conclusion.

*Needs:* §3.18 (Checkable hypotheses for ordinary Selmer structure); §3.19 (Surjectivity of global ordinary localization); PadicMeasuresIwasawaAlgebras L4.

### 3.21 Fitting equals characteristic under the structure criterion

Let Λ=O[[T]] with O a complete DVR with finite residue field, λ its uniformizer, and X a finitely generated torsion Λ-module with no nonzero finite submodule. Then depth_Λ X≥1 and pd_Λ X≤1. A finite free resolution 0→Λ^r→Λ^r→X→0 gives Fitt_Λ X=(det A)=char_Λ X as ideals. Apply this to the ordinary Selmer dual only after §3.20 and cotorsion establish the hypotheses. For modules with finite submodules or higher-dimensional Λ, equality is not asserted. This criterion is supplied to ModularIwasawaMainConjectures L1 and RankZeroOneBSD BSD.6/BSD.6a/BSD.7a.

Λ regular local of dimension two; X finitely generated torsion. The zero module uses the unit ideal convention.

Prove this as follows. The maximal-ideal torsion submodule is finite; its absence gives a nonzerodivisor on X and depth at least one. Use the dimension-two Auslander–Buchsbaum formula to obtain a projective resolution of length at most one. Local free modules and rank zero give a square presentation. Invoke PMIA quadratic presentation/Fitting and characteristic-ideal height-one formulas; identify both with its determinant.

(Greenberg (author preprint), §1, pp. 1–4; Proposition 4.1.1, pp. 19–20 (arithmetic no-pseudo-null input).)

**Checks.**

- For X=Λ/(f), f nonzero, both ideals equal (f).
- For X=Λ/(λ,T), char X=Λ but Fitt X=(λ,T); the no-finite-submodule hypothesis is necessary.
- For X=0, both ideals are Λ.
- If O=k[[λ]] with k infinite, X=Λ/(λ,T)=k has no nonzero submodule of finite cardinality, yet char X=Λ and Fitt X=(λ,T). This excludes dropping the finite-residue-field hypothesis while retaining the finite-cardinality condition. A finite-length formulation is the appropriate generalization.
- Over O=𝔽_p[[λ]], p=0, so Λ/(p,T)=O is not a finite-length counterexample. The uniformizer quotient Λ/(λ,T) is the required residue-field example.

*Needs:* §3.20 (No pseudo-null submodule of the ordinary Selmer dual); PadicMeasuresIwasawaAlgebras L6/quadratic-presentation; PadicMeasuresIwasawaAlgebras L6/fitting-quadratic; PadicMeasuresIwasawaAlgebras L4/characteristic-ideal; PadicMeasuresIwasawaAlgebras L4.

### Examples

For Λ=O[[X]] and a two-term complex with multiplication X from degree one to degree two, H¹=0 and H²=Λ/(X). Derived augmentation makes the differential zero, so finite-level H¹=O comes from H²[X], while the ordinary specialization of H¹ is zero. This fixes the direction and degree of the control correction. With arithmetic determinant det⁻¹, the same complex has scalar lattice (X), confirming the positive divisor of H²; moving the map to degrees zero and one gives (X)⁻¹.

At one cyclotomic group element γ with χ(γ)=u, φ_k(γx)=u⁻ᵏγφ_k(x), because γφ_k(x)=uᵏφ_k(γx). For k=1, u=4 over ℤ₃, the scalar is 1/4 and not 4. Contragredient duality sends a character u to u⁻¹. For the zero torsion module the characteristic and zeroth Fitting ideals are both the unit ideal. Over O[[X]], the residue-field module has characteristic ideal (1) and Fitting ideal (λ,X); its finite submodule prevents the equality theorem from applying.

### Dependencies

Layers 0, 1, 2 and the supplier interfaces above: ArithmeticGaloisDuality D7 (`compact-support-euler-characteristic`); ArithmeticGaloisDuality R02.1 (`carrier-comparison`); ArithmeticGaloisDuality R02.1 (`cochains-inverse-limit`); ArithmeticGaloisDuality R02.1 (`mittag-leffler-lim-one`); ArithmeticGaloisDuality R02.1 (`tate-inverse-limit`); ArithmeticGaloisDuality R02.2 (`compact-five-term`); ArithmeticGaloisDuality R02.2 (`finite-index-descent`); ArithmeticGaloisDuality R02.2 (`first-quadrant-spectral-sequence`); ArithmeticGaloisDuality R02.2 (`hochschild-serre-spectral-sequence`); ArithmeticGaloisDuality R02.3 (`restricted-ramification-group`); ArithmeticGaloisDuality R02.4 (`global-finiteness`); ArithmeticGaloisDuality R02.4 (`poitou-tate`); PadicMeasuresIwasawaAlgebras L1; PadicMeasuresIwasawaAlgebras L4; PadicMeasuresIwasawaAlgebras L4/characteristic-ideal; PadicMeasuresIwasawaAlgebras L5; PadicMeasuresIwasawaAlgebras L6/fitting-quadratic; PadicMeasuresIwasawaAlgebras L6/quadratic-presentation; SchemeAndStackFoundations SF.2 and the unsupplied arithmetic comparison of §3.15; TauCetiRoadmap.LocalFieldsRamification Layer 4; TauCetiRoadmap.ProfiniteCohomology Layer 10; TauCetiRoadmap.ProfiniteCohomology Layer 12; TauCetiRoadmap.ProfiniteCohomology Layer 6; TauCetiRoadmap.ProfiniteCohomology Layer 7.

## Layer 4: Finite conditions and arithmetic applications

### 4.1 The completed algebraic closure and existing de Rham period rings

Let C_p be the completion of an algebraic closure of ℚ_p with its unique extended valuation, with continuous G_K-action for each finite K/ℚ_p. Import its perfectoid tilt and A_inf=W(O_Cp^♭) and θ from PerfectoidSpaces P1. Identify Mathlib BDeRhamPlus/BDeRham with completion of A_inf[1/p] at ker θ and its localization. Give the canonical quotient B_dR^+→C_p, its complete DVR structure, and the canonical topology defined as the inverse limit of the p-adic quotient topologies (not the discrete topology on the quotients). For a compatible primitive roots-of-unity sequence ε, t=log[ε] is a uniformizer, g(t)=χ(g)t, Fil^i B_dR=t^i B_dR^+, and gr^i B_dR≃C_p(i).

Finite K/ℚ_p; algebraic closure valuation/completion imported from the local-field supplier. The ring definition is already Mathlib baseline; only these comparisons and structures are new.

Prove this as follows. Extend the valuation and Galois isometries to the algebraic-closure completion. Obtain its perfectoid structure from completed filtered finite extensions of the cyclotomic perfectoid field. Compare the lower-tier θ with Mathlib fontaineThetaInvertP and identify their adic completions by the universal property. Use the primitive kernel and first-order thickening to show t is a uniformizer; extend the action and compute its associated graded via g(t)=χ(g)t.

(Fontaine, Le corps des périodes, §§1.5.1–1.5.7, pp. 71–74.)

**Checks.**

- B_dR^+/(t)≃C_p; replacing ker θ completion by p-adic completion fails.
- g(t)=χ(g)t, so gr¹ is C_p(1), with positive Tate twist.
- The G_K action is continuous for the canonical inverse-limit topology; the t-adic topology with discrete C_p quotients is not a substitute.

*Needs:* PerfectoidSpaces P1 (`fontaine-theta-and-primitive-kernel`); PerfectoidSpaces P1 (`fontaine-theta-comparison-with-mathlib`); PerfectoidSpaces P1 (`completed-colimit-of-perfectoid-tate-rings`); PerfectoidSpaces P3 (`finite-extensions-of-perfectoid-fields`); TauCetiRoadmap.LocalFieldsRamification Layer 1.

### 4.2 Crystalline period ring and its structures

Inside A_inf[1/p], form the subring generated by A_inf and ξ^n/n!, n≥1, for a primitive generator ξ of ker θ. Its separated p-adic completion is A_cris. Define B_cris^+=A_cris[1/p], B_cris=B_cris^+[1/t]. The ring is independent of ξ and the generator of ℤ_p(1); give the Galois action, Frobenius φ extending Witt Frobenius, φ(t)=pt, θ and the injective map B_cris→B_dR. For K with residue field k, K₀=Frac W(k) embeds, φ is σ-semilinear there and commutes with G_K. The induced filtration is the intersection with Fil^i B_dR. This is the minimal period construction owned here; no geometric crystalline comparison theorem is included.

C_p, t, A_inf, θ from §4.1; canonical divided powers on (p). Mathlib already has divided powers and adic completion, but a universal divided-power envelope is not assumed available.

The construction proceeds as follows. Construct the explicit subalgebra generated by divided powers in A_inf[1/p], then use Mathlib adic completion at (p). Prove the universal p-adic PD-thickening property by lifting Teichmüller coordinates and taking the limits of p-power lifts (Fontaine 2.2.2); prove independence of ξ by binomial divided-power identities. Extend Frobenius and Galois action by continuity, compute φ(t)=pt and invert p,t. Expand elements as convergent divided-power series to prove the embedding into B_dR (Fontaine 4.1). The stronger scalar-extension injectivity K⊗K₀ B_cris→B_dR follows by restricting Fontaine Theorem 4.2.4; use that theorem for the crystalline-to-de Rham comparison.

(Fontaine, Le corps des périodes, Theorem 2.2.1 and proof, pp. 76–77; §§2.3.1–2.3.4, pp. 78–79; §4.1, pp. 83–84; Theorem 4.2.4, p. 86, proof §4.3, pp. 87–89.)

The named operations and identities are:

- `aCris` — Separated p-adic completion of the explicit PD-generated A_inf-subalgebra.
- `bCris` — Invert p and the logarithmic Tate period.
- `aCris_pdUniversal` — Initial among p-adically complete PD-thickenings of O_Cp with compatible PD on (p).
- `bCris_toBDR` — Injective Galois-compatible period map.
- `bCris_frobenius` — σ-semilinear Frobenius, commuting with G_K and sending t to pt.
- `bCris_generatorIndependent` — Changing ξ or a primitive Tate generator gives the canonical same ring.

**Checks.**

- The logarithmic period is nonzero and φ(t)=pt, not t.
- θ(t)=0 before t is inverted; θ cannot extend as a unital map B_cris→C_p.
- The period map to B_dR is injective and respects G_K; a free formal PD variable does not satisfy this comparison.

*Needs:* §4.1 (The completed algebraic closure and existing de Rham period rings); PerfectoidSpaces P1 (`witt-vectors-of-perfect-plus-ring`).

### 4.3 Fundamental period sequences with continuous sections

The following G_K-equivariant sequences are exact: 0→ℚ_p→B_cris^(φ=1)⊕B_dR^+→B_dR→0, with diagonal first map and difference last map; and 0→ℚ_p→B_cris⊕B_dR^+→B_cris⊕B_dR→0 with (x,y)↦((1−φ)x,x−y). Tensoring with a finite-dimensional continuous V gives the continuous-cohomology LES because the quotient maps admit continuous nonequivariant sections on the canonical topologies. Supply the boundary map D_dR(V)/Fil⁰→H¹(K,V) and its compatibility with coefficient/twist maps. A merely algebraically exact sequence is not enough for this LES.

Canonical period topologies; finite-dimensional V; the AGD cochain interface extended to these topological coefficients with continuous-section exactness.

Prove this as follows. Prove B_cris^(φ=1)∩B_dR^+=ℚ_p and surjectivity of 1−φ using divided-power Frobenius estimates. Use Bloch–Kato Lemma 1.17.3: logarithms of lifted roots span the successive de Rham quotients and provide the required Frobenius eigenvectors; deduce difference-map surjectivity. Construct the continuous sections as in Remark 1.18 and apply the supplier continuous-section LES after tensoring with V.

(Bloch–Kato, Proposition 1.17, Lemma 1.17.3 and Remark 1.18, pp. 340–341.)

*Needs:* §4.2 (Crystalline period ring and its structures); ArithmeticGaloisDuality R02.1 (`continuous-section-long-exact`); ArithmeticGaloisDuality R02.1.

### 4.4 Period fixed fields and dimension bounds

For finite K/ℚ_p, (B_dR^+)^G_K=B_dR^G_K=K and B_cris^G_K=K₀. The invariant comparison maps for finite-dimensional V are injective, yielding dim_K D_dR(V)≤dim_ℚp V and dim_K₀ D_cris(V)≤dim_ℚp V. For B_dR use its filtration and the Tate C_p(i) cohomology calculation; for B_cris use the divided-power expansions and Frobenius structure. These are minimal period facts moved down to L4.

Finite K; canonical topologies and embeddings. **Unsupplied prerequisite.** The C_p construction and exact twisted Tate–Sen cohomology calculation are required, but are absent from the cited LocalFieldsRamification Layer 1. Its finite-local-field results cannot supply them.

Prove this as follows. Import the Tate–Sen calculation of H⁰ and H¹(G_K,C_p(i)) with its exact range and coefficient conventions. Use the Tate C_p(i) calculation on de Rham filtration quotients and their completed limit (Fontaine Exposé II 1.5.7). For the crystalline fixed field use injectivity of K⊗K₀ B_cris→B_dR: the two copies of K₀ are precisely the intersection of the scalar copies of K and B_cris (Exposé III 5.1.2). For B_dR use the minimal-dependence argument. For B_cris transfer injectivity through the scalar extension embedding and prove regularity using Exposé III 5.1.3’s classification of Galois-stable one-dimensional period lines. Its invertibility statement, not mere injectivity, gives the dimension-equality criterion.

(Fontaine, Le corps des périodes, §1.5.7, p. 74; §4.1, pp. 83–84; Fontaine, Représentations semi-stables, Proposition 1.4.2, pp. 123–124; Proposition 5.1.2 and Lemma 5.1.3, pp. 155–156; Nizioł, §2, pp. 749–750.)

*Needs:* §4.1 (The completed algebraic closure and existing de Rham period rings); §4.2 (Crystalline period ring and its structures); TauCetiRoadmap.LocalFieldsRamification Layer 1.

### 4.5 Crystalline and de Rham realization data

For a finite-dimensional continuous G_K-representation V define D_cris(V)=(V⊗B_cris)^G_K over K₀ and D_dR(V)=(V⊗B_dR)^G_K over K, with inherited Frobenius and filtration. Define crystalline and de Rham by equality of their dimension with dim_ℚp V, together with the canonical comparison-map isomorphism formulation. Crystalline implies de Rham. Hodge–Tate weight −1 is the convention for ℚ_p(1). This p-adic realization is independent of the archimedean Hodge carrier.

Finite K/ℚ_p; continuous period tensor action and its invariants. Include the coefficient extension for E/ℚ_p by scalar restriction, not an unspecified Frobenius-linear E-action.

The construction proceeds as follows. Take invariants of the actual period tensor modules; restrict the structures and define the comparison maps. Use the period-ring regularity and fixed-field results to bound dimensions and prove equality iff the canonical comparison map is an isomorphism. Use the embedding K⊗K₀ B_cris→B_dR to prove crystalline implies de Rham and compute the Tate generators t^−n.

(Nizioł, §2, pp. 748–751; Bloch–Kato, §1, pp. 337–340.)

The named operations and identities are:

- `dCris` — Period tensor invariants over K₀.
- `dDeRham` — Period tensor invariants over K with filtration.
- `IsCrystalline` — The canonical B_cris comparison map is an isomorphism.
- `IsDeRham` — The canonical B_dR comparison map is an isomorphism.
- `crystalline_iff_dim` — Dimension equality characterizes crystalline representations.
- `crystalline_isDeRham` — Crystalline implies de Rham via the canonical embedding.

**Checks.**

- The zero representation is crystalline and de Rham with zero realization.
- D_cris(ℚ_p(n)) is generated by t^−n, Frobenius p^−n and filtration jump −n.
- For ramified K, D_cris is a K₀-space while D_dR is a K-space; identifying their scalar rings is wrong.

*Needs:* §4.2 (Crystalline period ring and its structures); §4.4 (Period fixed fields and dimension bounds).

### 4.6 Small-weight filtered Frobenius modules

For K₀/ℚ_p finite unramified, W=O_K₀ and p>2, an integral Fontaine–Laffaille object has a finite W-module M, an exhaustive separated decreasing filtration Fil^i M and σ-semilinear maps φ_i:Fil^i M→M satisfying φ_i|Fil^(i+1)=p φ_(i+1), with Σ_i im φ_i=M. In the free case each filtration step is a direct summand. Restrict to a weight interval [a,b] of width ≤p−2, and form morphisms preserving the filtration and all φ_i. Use the covariant convention of Nizioł §2; translating Fontaine–Laffaille’s contravariant Hom realization requires a dual. For torsion exactness use the abelian enlarged category with separate filtration modules and their inclusion maps, not an assertion that the entire category of all filtered modules is abelian.

K₀ unramified; small weights; integral and torsion coefficient variants distinguished. The Tate representation ℤ_p(1) has weight −1.

The construction proceeds as follows. Define the finite module, filtration, divided Frobenius maps and morphisms on native module carriers. Embed in the category of diagrams with separate filtration modules as Fontaine–Laffaille §1.11; establish exactness on strongly divisible torsion objects. Give induced direct sums, interval restriction, allowed tensor/dual operations and the scalar-forgetting convention.

(Fontaine–Laffaille, §§0.4–0.6, pp. 550–551; §1.11, pp. 558–559; §§7.12–7.15, pp. 593–594; Nizioł, §2, pp. 750–751.)

The named operations and identities are:

- `FontaineLaffailleModule` — Finite filtered W-module with compatible generating divided Frobenius maps.
- `FontaineLaffailleHom` — Filtration- and Frobenius-preserving linear maps.
- `fontaineLaffaille_sum` — Direct sums and their divided Frobenius maps.
- `fontaineLaffaille_interval` — The explicit interval support predicate.
- `fontaineLaffaille_dual` — Dual/twist shifts the interval according to the weight convention.
- `IsFreeFontaineLaffaille` — The module is free and every filtration step has a W-submodule complement. This is the free-object branch of the parameterized native prototype; Witt-ring realization is still required.

**Checks.**

- The zero module with zero filtration is an object in every allowed interval.
- The rank-one weight-zero object has Fil⁰=M, Fil¹=0 and unit Frobenius; omitting generation would admit φ₀=0.
- For interval support, a weight-zero line lies in [0,0] and [−1,1], but not [1,2]. A nonzero object cannot lie in a reversed interval a>b; the zero object can.
- The identity and zero maps are Fontaine–Laffaille morphisms. Between weight-zero rank-one objects over ℤ₃ with φ₀ multiplication by 1 and by 2, the underlying identity preserves the filtration but does not commute with Frobenius, so it is not a morphism.
- A tensor product with combined width >p−2 is not covered by the small-weight comparison theorem.
- In the free rank-one W-module, the proper filtration step pW (p nonunit) is not a direct summand. A free filtered object admitting that step fails IsFreeFontaineLaffaille, even if its underlying module is free.

*Needs:* §4.2 (Crystalline period ring and its structures).

### 4.7 Small-weight crystalline realization and extension exactness

On the small-weight category over an unramified p-adic field, the covariant period realization gives an exact fully faithful functor to finite ℤ_p-Galois modules whose essential image is the torsion crystalline representations of the specified interval. For free objects pass to the inverse limit of the mod-p^m realizations; the resulting free lattice has the same rank and its rationalization is crystalline. The reverse functor is the filtered Frobenius module inside the crystalline tensor invariants, and the two maps are canonical inverse comparisons. Tensor/dual compatibility holds only when the combined interval remains in the permitted range.

p>2; interval width ≤p−2; Nizioł’s covariant normalization. Endpoint width p−1 needs extra nilpotence/unipotence hypotheses and is outside this target.

Prove this as follows. Construct the Hom period realization and dualize to the chosen covariant convention. Reduce exactness and rank to simple residual filtered objects and solve the divided Frobenius equations in the period ring; descend from an algebraically closed residue field. Use the evaluation map and Fontaine–Laffaille §6.1 full faithfulness after excluding the endpoint; take mod-p^m limits and identify rational period invariants by §§7.15–8.5.

(Fontaine–Laffaille, Theorem 3.3 and proof §§3.5–3.11, pp. 562–565; Theorem 6.1, pp. 581–583; Propositions 7.15 and 7.17, pp. 593–594; Theorem 8.4 and Remark 8.5, pp. 595–596; Nizioł, §2, pp. 750–751.)

*Needs:* §4.6 (Small-weight filtered Frobenius modules); §4.5 (Crystalline and de Rham realization data).

### 4.8 Integral crystalline modules and nonsingular extensions

For unramified K/ℚ_p, call a finite ℤ_p-module R crystalline in [a,b] if it is a quotient R″/R′ of stable lattices in a crystalline rational representation with weights in [a,b]. A finite-type integral module is crystalline if every R/p^mR is so; for O-coefficients apply the underlying ℤ_p-module functor. If a≤0≤b, define H¹_ns(K,R) as extension classes 0→R→R_s→ℤ_p→0 whose middle term is crystalline in that interval. The extension set is an O-submodule. It is not defined by a nonexistent tensor R⊗B_cris, which would be zero for finite p-torsion R.

K unramified and coefficient weight conventions fixed; weights of ℚ_p(1) are −1. Scalar restriction precedes the crystalline test.

The construction proceeds as follows. Define the quotient-lattice and all-reductions predicates with genuine Galois representations. Use continuous Ext¹/cohomology to identify classes with extensions and pull back the crystalline extension predicate. For the submodule assertion use closure of crystalline lattice quotients under finite products and subquotients in the fixed interval: Baer sum and coefficient pushout are formed from those operations. Use the exact small-weight filtered-module category only for the comparison and finite-length calculations within its allowed interval, not to prove a general-width assertion.

(Liu–Tian–Xiao–Zhang–Zhu, Definitions 2.2.4–2.2.5, pp. 124–125.)

The named operations and identities are:

- `IsTorsionCrystalline` — Stable-lattice quotient with bounded crystalline weights.
- `IsIntegralCrystalline` — All finite p-power reductions satisfy the torsion predicate.
- `crystallineNonsingular` — Submodule of cohomology represented by crystalline extensions.
- `crystallineNonsingular_map` — Compatible coefficient maps induce the extension-class map.
- `crystallineNonsingular_scalarRestriction` — O-coefficient predicate agrees with the underlying ℤ_p predicate.

**Checks.**

- Zero is crystalline and has zero nonsingular extension group.
- ℤ/p^m(1) is crystalline in any permitted interval containing −1.
- R⊗ℚ_p B_cris=0 for finite R; using that as the definition would declare every extension finite and lose the crystalline condition.

*Needs:* §4.5 (Crystalline and de Rham realization data); §4.7 (Small-weight crystalline realization and extension exactness); ArithmeticGaloisDuality R02.1 (`continuous-section-long-exact`).

### 4.9 The Bloch–Kato local condition on T and W

For finite K/ℚ_p define H¹_f(K,V)=ker[H¹(K,V)→H¹(K,V⊗B_cris)] on the canonical continuous cochain carrier, with the period topology. Define the T-condition by inverse image and the A=V/T condition by image. Away from p use the unramified rational condition and its propagated lattice/discrete conditions; the raw unramified condition on a finite quotient may differ. Give coefficient, restriction and duality compatibility. For de Rham V, the fundamental sequences give the exponential/finiteness exact fragments; for crystalline V, 0→H⁰(K,V)→D_cris(V)→D_cris(V)⊕D_dR(V)/Fil⁰→H¹_f(K,V)→0, with x↦((1−φ)x,x mod Fil⁰). The map 1−φ is ℚ_p-linear, generally not K₀-linear. Thus dim_ℚp H¹_f=[K:ℚ_p]·dim_K(D_dR/Fil⁰)+dim_ℚp H⁰. The exact-annihilator compatibility with V*(1) uses de Rham V (Bloch–Kato Proposition 3.8). Values on ℚ_p and ℚ_p(1) are respectively unramified classes and Kummer completed-unit classes.

Finite K/ℚ_p and finite-dimensional continuous V with stable lattice T; finite-condition definition makes sense generally, the realization exact sequence is asserted with crystalline/de Rham hypotheses as specified.

The construction proceeds as follows. Use §4.2 and the AGD topological coefficient interface to form the kernel. Tensor the §4.3 with V and take the continuous-cohomology LES; identify the invariants and its finite-kernel fragment. Propagate through T→V→A, then compute Tate examples through Kummer and local units. For de Rham V, use Bloch–Kato Proposition 3.8 and local Tate duality for the exact finite-condition annihilator.

(Bloch–Kato, §3.7, Proposition 3.8, Corollary 3.8.4 and Example 3.9, pp. 352–359; Rodrigues Jacinto–Williams (arXiv v2), Definition 13.19(2), preprint p. 70.)

The named operations and identities are:

- `blochKatoCondition` — L^BK_v on W as the image of H^1_f(F_v, V).
- `blochKatoCondition_T` — The preimage on T.
- `blochKatoStructure` — The structure uses finite period conditions at p, unramified rational conditions away from p, and their image/preimage propagation on A/T. Raw finite-coefficient unramified conditions may differ.
- `blochKatoCondition_eq_propagate` — Agreement with §2.5 applied to H^1_f.

**Checks.**

- V = ℚ_p: H^1_f(F_v, ℚ_p) = H^1_ur(F_v, ℚ_p), so L^BK is the image of the unramified classes.
- V=ℚ_p(1): H¹_f(K,V) is the Kummer image of the p-completion of O_Kˣ, rationalized over ℤ_p; its ℚ_p-dimension is [K:ℚ_p].
- For K=ℚ_p, V=ℚ_p(1) and Fil⁺=V, L2 Greenberg gives all H¹(K,V) of dimension 2, while H¹_f(K,V) is the completed-unit line of dimension 1; the uniformizer class is excluded by the finite condition.
- For an unramified quadratic K/ℚ_p and V=ℚ_p(1), dim_ℚp H¹_f(K,V)=2 although dim_K D_dR(V)/Fil⁰=1; omitting [K:ℚ_p] fails.

The comparison with ordinary local conditions is the conditional defect calculation of §4.12; equality requires the specific vanishings stated there.

*Needs:* §4.5 (Crystalline and de Rham realization data); §4.3 (Fundamental period sequences with continuous sections); §2.5 (Propagating local conditions); §0.8 (The p-adic Kummer identification); ArithmeticGaloisDuality R02.1.

### 4.10 Crystalline extensions and the integral finite preimage

Let R be a finite free O-lattice over unramified K/ℚ_p, R[1/p] crystalline with weights [a,b], a≤0≤b and b−a≤p−2. Then H¹_ns(K,R) is exactly the preimage of H¹_f(K,R[1/p]) under H¹(K,R)→H¹(K,R[1/p]). The key lifting criterion is Breuil Proposition 6: a stable free lattice is rationally crystalline in the permitted interval when all its finite p-power reductions are torsion crystalline in that interval. Apply it to the middle term of the extension; width bounds and unramifiedness remain hypotheses.

The extension has a free middle term; all finite reductions must be tested. No such equivalence is asserted for arbitrary weights or ramified K.

Prove this as follows. A crystalline integral extension gives a rational crystalline extension, hence a finite rational class by the period exact sequence. For the converse represent a rational finite class by its crystalline rational extension and apply the finite-reduction lattice criterion to the integral middle term. Use the small-weight fully faithful exact realization to identify the reductions; Breuil’s limit argument gives crystalline rational middle term and the prescribed bounded weights.

(Breuil, §2.3, Proposition 6 and Remark 8, p. 465; Liu–Tian–Xiao–Zhang–Zhu, Lemma 2.2.6, p. 125.)

*Needs:* §4.8 (Integral crystalline modules and nonsingular extensions); §4.9 (The Bloch–Kato local condition on T and W); §4.7 (Small-weight crystalline realization and extension exactness).

### 4.11 Finite crystalline annihilators and the inverse different

For unramified K/ℚ_p and finite crystalline R with weights a<0≤b and b−a≤(p−2)/2, the nonsingular groups for underlying ℤ_p coefficients are exact annihilators under the finite local Tate pairing. For O-coefficients and the O-linear dual R*=Hom_O(R,E/O), the pairing of H¹_ns(K,R) with H¹_ns(K,R*(1)) takes values in d_(E/ℚp)^−1/O. Thus it vanishes when the different is the unit ideal; it need not vanish in E/O for ramified E. Do not replace this statement with exact O-linear annihilators without a separate hypothesis.

Finite R; the half-width bound allows the tensor-product crystalline calculation; dual interval is [−b−1,−a−1].

Prove this as follows. Use the crystalline extension product to factor the nonsingular cup through crystalline H², which vanishes in this range. Compare lengths of the two filtered modules and their Fil⁰ pieces, then use local Euler characteristic and Tate duality to get exact annihilators over ℤ_p (Nizioł 6.2). Apply coefficient trace. Vanishing of Tr(a·pairing) for every a∈O is precisely membership in the inverse different quotient, yielding Liu 2.2.7.

(Nizioł, Proposition 6.2 and proof, pp. 764–765; Liu–Tian–Xiao–Zhang–Zhu, Lemma 2.2.7, p. 125.)

**Checks.**

- For unramified E/ℚ_p the inverse different is O and the value is zero.
- For E=ℚ_p(√p), p odd, d is nonunit and d^−1/O is nonzero; trace-zero values need not be zero.
- Width p−2 is insufficient for the product proof; the half-width bound is essential.

*Needs:* §4.7 (Small-weight crystalline realization and extension exactness); §4.8 (Integral crystalline modules and nonsingular extensions); §1.2 (Compatibility of the local pairings for T, V, W and W_M); ArithmeticGaloisDuality R02.4 (`global-euler-characteristic`).

### 4.12 Finite versus ordinary local conditions with explicit exceptional terms

For a de Rham ordinary V with saturated G_K-stable V^+ and V^−, compare L_f=H¹_f(K,V), L_str=im H¹(K,V^+) and L_Gr=ker[H¹(K,V)→H¹(I_K,V^−)]. Use the coefficient LES, the finite-period exact sequence and L1 §1.5 to calculate L_str/(L_str∩L_f), L_f/(L_str∩L_f), and L_Gr/L_str=im H¹(K,V)→H¹(K,V^−) ∩ H¹_ur(K,V^−). The first two are measured by the kernel/cokernel of the induced finite-period maps and the H⁰ coefficient boundary; the third is the displayed unramified quotient. Under the separate vanishings H¹_f(K,V^+)=H¹(K,V^+), H¹_f(K,V^−)=0 and exactness of the finite-extension sequence, L_f=L_str; under zero unramified intersection L_str=L_Gr. Verify these conditions in each arithmetic example, retaining φ=1, Fil⁰ and H⁰ factors when they fail.

Finite K/ℚ_p; de Rham coefficient sequence and compatible finite-period complexes. No universal equality of Bloch–Kato and Greenberg conditions is assumed. Infinite-level comparison uses the limits and §3.9, not a period ring at an infinite local field.

Prove this as follows. Write the H⁰/H¹ coefficient LES and the two finite-period exact sequences as a commuting diagram. Compute the two intersections and their quotient kernels/cokernels by the snake lemma, preserving the boundary and (1−φ)/Fil⁰ maps. Combine with the inertia/unramified quotient of L1. When every displayed defect vanishes conclude equality; otherwise propagate each actual defect through T→V→A and the tower.

(Bloch–Kato, §3.7–3.8, pp. 352–359; Rodrigues Jacinto–Williams (arXiv v2), Remark 13.20, preprint p. 70; Nekovář, §6.7, pp. 151–154.)

**Checks.**

- For V=ℚ_p, V^+=0, L_str=0 but L_f=L_Gr=H¹_ur is one dimensional.
- For V=ℚ_p(1), V^+=V, L_str=L_Gr=H¹, while L_f consists of unit Kummer classes and omits the valuation line.
- In the good ordinary elliptic case, the nonexceptional unit-root eigenvalue and local Euler dimensions eliminate the finite/strict defect.

*Needs:* §4.9 (The Bloch–Kato local condition on T and W); §4.3 (Fundamental period sequences with continuous sections); §1.5 (Strict ordinary and inertia ordinary annihilators); §2.24 (Lattice changes with global and local errors); §3.9 (Local specialization correction complex).

### 4.13 Archimedean realization on the existing Hodge carrier

At a real place, extend the existing TauCeti.Hodge.HodgeStructureOn(W,ω,w), finite-dimensional over ℂ, by a ℂ-linear involution F∞ commuting with the antilinear coefficient conjugation ω and taking H^(a,w−a) to H^(w−a,a). These involutions are different data. On a diagonal piece H^(a,a), let h_a^ε be the dimension of the F∞=(-1)^(a+ε) eigenspace, ε=0,1. At a complex place use the Hodge numbers without real eigenspaces. Require an explicit comparison specifying which Hodge realization defines L(V,s); in RJW’s Tate convention V=ℚ_p(n) has archimedean type (n,n), F∞=(-1)^n and L(V,s)=ζ(s−n). The usual cohomological Tate Hodge convention must be dualized to this L-function convention.

Finite-dimensional pure Hodge realization on the actual opposed-filtration carrier. No conversion from a p-adic representation to Hodge data without comparison data.

The construction proceeds as follows. Import HodgeStructureOn, its pieces, symmetry and finite support, and add the Betti involution with its actual compatibility equations. Restrict F∞ to diagonal pieces and use the ± eigenspace decomposition in characteristic zero. Import the existing Hodge dual and Tate twist: the L-function Tate-dual Hodge carrier is H.dual.tateTwist(−1), with types (1−a,1−b). Extend it by the negative transpose of F∞; this changes the Betti involution, not the underlying Hodge dual construction. Prove the diagonal eigenspace formulas and direct-sum compatibility.

(Deligne, §5.2–5.3 and Table 5.3, pp. 328–329; Rodrigues Jacinto–Williams (arXiv v2), §13.5.3, preprint pp. 71–72.)

The named operations and identities are:

- `ArchimedeanRealization` — Existing HodgeStructureOn plus the real involution and its compatibility.
- `archRealization_diagonalMultiplicity` — The (-1)^(a+ε) eigenspace dimension on H^(a,a).
- `archRealization_sum` — Direct sum with both conjugations and summed multiplicities.
- `archRealization_tateDual` — The L-function Tate-dual types and involution.
- `archRealization_hodgeCarrier` — Projection to the existing opposed-filtration Hodge structure.
- `productConjugation` — Factorwise coefficient conjugation for the product carrier.
- `standardConjugation`, `tateHodge`, `tateArchimedean` — Native Tate-line conjugation and the weight-transported type (n,n), with the added Betti sign.
- `oppositeRealSign` — Negate the Betti involution while preserving the Hodge filtration.

**Checks.**

- Zero Hodge structure gives zero diagonal and off-diagonal multiplicities.
- Two weight-zero rank-one structures with the same Hodge filtration and opposite F∞ give different real Gamma factors.
- For ℚ_p(n) in the RJW convention, the type is (n,n) and F∞=(-1)^n; using type (−n,−n) without changing L(V,s) gives the wrong criticality.

*Needs:* §2.10 (Pontryagin duals with the contragredient action); Tau Ceti `TauCeti.Hodge.HodgeStructureOn.dual`; Tau Ceti `TauCeti.Hodge.HodgeStructureOn.finrank_dual_piece`; Tau Ceti `TauCeti.Hodge.HodgeStructureOn.tateTwist`; Tau Ceti `TauCeti.Hodge.tate`; Tau Ceti `TauCeti.Hodge.tate_hodgeNumber`.

### 4.14 Gamma factor and its integer pole order

For a real place, each off-diagonal pair (a,b),(b,a), a<b, contributes Γ_ℂ(s−a) raised to h^(a,b), and the diagonal sign ε contributes Γ_ℝ(s+ε−a) raised to h_a^ε. For a complex place each type (a,b) contributes Γ_ℂ(s−min(a,b)) with its multiplicity. Here Γ_ℝ(s)=π^(−s/2)Γ(s/2), Γ_ℂ(s)=2(2π)^−sΓ(s), already Mathlib definitions. Finite support makes the product finite. At an integer m the pole order is the sum of multiplicities of complex factors with m−min(a,b)≤0 and real factors with m+ε−a a nonpositive even integer. Compare this combinatorial order with the meromorphic continuation, using the analytic reciprocal Gamma function. Mathlib’s totalized values are zero at Gamma poles, so nonzero value is not the definition of a meromorphic pole.

ArchimedeanRealization and finite support; diagonal eigenspaces in the real case. Products and pole orders include every archimedean place.

The construction proceeds as follows. Read Hodge numbers and diagonal eigenspace dimensions from the existing carrier; form the finite list of shifted factors using Deligne Table 5.3. Use the poles and zero-free meromorphic Gamma function, or the zeros of its entire reciprocal, to identify the pole order at integers. Prove direct-sum multiplicativity, Tate-dual shift compatibility and the correspondence with Mathlib Gammaℝ/Gammaℂ off the poles.

(Deligne, §5.3 and Table 5.3, p. 329; Rodrigues Jacinto–Williams (arXiv v2), §13.5.3, preprint p. 71.)

The named operations and identities are:

- `ShiftedGamma` — Real or complex native Gamma function with its integral shift.
- `complexHodgeGammaFactors` — One complex-place factor for every Hodge type, with shift −min(a,b).
- `hodgeGammaFactors` — Finite multiset of shifted real and complex Gamma factors.
- `tateDualHodgeGammaFactors` — Compute the dual multiset from the same primal Hodge pieces and Betti signs: for a<b=w−a the dual complex shift is b−1; for a diagonal piece the real shifts are a−1 and a with their original ε=0 and ε=1 multiplicities.
- `tateDualHodgeGammaFactors_eq` — This computed list agrees up to permutation with the factors of the native Tate-dual Hodge realization equipped with the negative transpose Betti involution.
- `hodgeGammaFactor` — Product of the existing Mathlib Gamma factors off their pole set.
- `gammaPoleOrder` — Weighted integer pole count for the derived multiset.
- `gammaFactor_sum` — Direct sum multiplies factors and adds pole orders.
- `gammaPoleOrder_analytic` — Pole count equals the meromorphic order, using reciprocal Gamma at totalized zeros.

**Checks.**

- Zero realization gives product 1 and pole order 0.
- The Tate type (n,n), sign (-1)^n gives Γ_ℝ(s−n).
- Weight-zero real sign + gives Γ_ℝ(s), sign − gives Γ_ℝ(s+1); their pole orders at 0 differ.
- A real weight-one structure with h^(0,1)=h^(1,0)=1 gives Γ_ℂ(s), counted once rather than twice; its Tate dual gives the same factor.
- The dual factors of the zero realization have no positive multiplicities. The dual of the type (0,0), sign + Tate line has Γ_ℝ(s−1) and a pole at one; the dual of the type (2,2), sign + line has Γ_ℝ(s+1) and no pole there.

*Needs:* §4.13 (Archimedean realization on the existing Hodge carrier).

### 4.15 The Gamma factor, r_V and criticality

For explicit archimedean realization data attached to L(V,s), define r_V=gammaPoleOrder(V,1) from §4.14. Define Greenberg criticality by r_V=r_(V*(1))=0, using the Tate-dual Hodge types and real signs from §4.13. For ℚ_p(n), r_V is one exactly for positive odd n, and the dual is ℚ_p(1−n); consequently the critical integers are positive even n or negative odd n. At n=0 the dual factor has a pole, so n=0 is not critical. Criticality is a computed predicate, not a supplied Boolean or Gamma factor. The native representative signature calculates the second pole order through `tateDualHodgeGammaFactors`; the preceding comparison identifies it with the actual Tate-dual realization, without an independently supplied dual factor list.

A finite-dimensional Hodge realization and its comparison to the chosen L-function convention, together with the compatible Tate-dual realization.

The construction proceeds as follows. Apply Deligne’s Hodge/sign recipe and its proven integer pole count. Apply the Tate-dual transformation to compute the second order. For Tate types, the real factor gives poles at n,n−2,…; evaluate at 1 for n and 1−n to obtain the exact parity table.

(Rodrigues Jacinto–Williams (arXiv v2), §13.5.3, pp. 71–72 (arXiv v2), with Remark 13.23; published pp. 197–198.)

The named operations and identities are:

- `gammaFactor` — L_∞(V,s) computed from the explicit Hodge/sign realization by §4.14, in the chosen L-function convention.
- `poleOrderAtOne` — r_V, the order of the pole of L_∞(V, s) at s = 1.
- `tateDual` — V^∨ = Hom_cts(V, ℚ_p(1)).
- `IsGreenbergCritical` — r_V = 0 and r_{V^∨} = 0.
- `poleOrderAtOne_tateTwist` — r_{ℚ_p(n)} = 1 if n is odd and positive, 0 otherwise.
- `isGreenbergCritical_tateTwist_iff` — ℚ_p(n) is critical iff n is even and positive or odd and negative.

**Checks.**

- n = 2: r_V = r_{V^∨} = 0, so ℚ_p(2) is critical.
- n = 0: r_{ℚ_p(1)} = 1, so ℚ_p is not critical, although Theorem 13.8 is its main conjecture (Remark 13.23).
- n = 1: r_{ℚ_p(1)} = 1 (the pole of Γ(s/2 − 1/2) at s = 1).
- n = −1: critical (odd and negative).
- For −6≤n≤6, criticality agrees with the parity rule: the critical twists are −5,−3,−1,2,4,6.

This is Greenberg's Gamma-factor notion; it agrees with Deligne's criticality for Tate twists (L(ℚ_p(n), 1) = ζ(1 − n) and L(ℚ_p(n)^∨, 1) = ζ(n) both critical).

*Needs:* §4.14 (Gamma factor and its integer pole order); §4.13 (Archimedean realization on the existing Hodge carrier).

### 4.16 Class groups, p-ramified Galois groups and unit towers

For F_n=ℚ(μ_(p^n)), p odd, define Y_n as the p-primary ideal class group, identified by global reciprocity with the everywhere-unramified maximal abelian pro-p Galois group. Define X_n as the maximal abelian pro-p Galois group unramified outside p, equivalently the p-completed idèle class quotient with the local unit groups away from p killed. Let U_n,1 be principal units at p and E_n,1 the closed image of the global units in U_n,1 (intersecting with principal units). Define U∞,1,E∞,1,Y∞ by norm limits and X∞ as the corresponding p-ramified Galois group over F∞; prove its comparison with the finite-level norm/transfer system, retaining decomposition/splitting terms until the cyclotomic ramification hypotheses remove them. For complex conjugation c, use e±=(1±c)/2 to form the plus/minus parts and identify X∞^+,Y∞^+ with the groups over the real tower. A chosen closed norm-compatible unit submodule C∞,1^+⊆E∞,1^+ is parameter data here; constructing cyclotomic Euler systems belongs to its consumer.

Cyclotomic tower and p odd; closed unit images rather than algebraic unit images; global Artin reciprocity normalized with arithmetic Frobenius.

The construction proceeds as follows. Import finite-level global reciprocity, class-group identification and local unit norm maps from ClassFieldTheory and GlobalNumberFields. Construct the closed p-ramified idèle quotient, prove the finite-level exact unit/class-group sequence, and take the compatible norm limits. Compute the tower Galois action and plus/minus idempotents; prove descent to the real tower using the prime-to-p group of order two.

(Rodrigues Jacinto–Williams (arXiv v2), §13.2 and Definition 13.12, preprint pp. 65–67; Proposition 13.13 and Corollary 13.14, pp. 67–68.)

The named operations and identities are:

- `pRamifiedModule` — The maximal abelian pro-p group unramified outside p with its continuous tower action.
- `unramifiedModule` — The class-group norm limit and its unramified Galois comparison.
- `closedGlobalUnitTower` — Norm limit of the closed global-unit images in principal units.
- `arithmeticPlusMinus` — The e± decomposition for p odd.
- `arithmeticTower_reciprocity` — Global reciprocity identifies the stated idèle and Galois quotients, compatibly with norms.

**Checks.**

- A dense proper algebraic unit subgroup has the same closed image; replacing closure by raw image changes the compact quotient.
- For c=1 the minus part is zero and the plus part is the whole module.
- At p=2, division by 2 is unavailable and the e± integral direct sum is not an allowed construction.

*Needs:* TauCetiRoadmap.ClassFieldTheory Layer 11; §0.2 (Completion of global units); §3.6 (Semilocal cohomology and descent of local classes).

### 4.17 The closed-unit and class-group exact sequence

In the cyclotomic plus tower with the objects of §4.16, 0→E∞,1^+→U∞,1^+→X∞^+→Y∞^+→0 is exact. For any closed Λ-submodule C∞,1^+⊆E∞,1^+, quotienting gives 0→E∞,1^+/C∞,1^+→U∞,1^+/C∞,1^+→X∞^+→Y∞^+→0. In particular ker(X∞^+→Y∞^+)≃U∞,1^+/E∞,1^+, with the quotient in that direction. The inverse-limit surjectivity is proved from the compatible compact finite-level exact sequences, by compact inverse-limit exactness or finite-quotient limits and their derived coefficient comparison. No Mittag–Leffler assertion for the full lattice tower is made; surjectivity is not automatic for arbitrary noncompact towers. The image E_n,1 is a closure; equality with the abstract completed unit lattice requires the separate Leopoldt assertion.

p odd; actual finite-level reciprocity maps and cyclotomic ramification; C closed and contained in E. This comparison constructs no cyclotomic units.

Prove this as follows. Use finite-level global reciprocity to identify the kernel of the p-ramified-to-unramified map with local principal units modulo closed global units. Prove compatible compactness and exactness at finite level; use exactness of compatible compact inverse limits, then take plus idempotents. Alternatively justify finite-quotient Mittag–Leffler and the derived coefficient comparison, without asserting Mittag–Leffler for the entire lattice tower. Apply the quotient exact sequence for C⊆E⊆U and check the quotient orientation in the reciprocity kernel.

(Rodrigues Jacinto–Williams (arXiv v2), Proposition 13.13 and Corollary 13.14, preprint pp. 67–68 (published p. 193).)

**Checks.**

- C=0 gives the original unit/class-group sequence.
- C=E gives 0→0→U/E→X→Y→0.
- E⊆U, so U/E is defined while E/U is not; this rejects the reversed printed quotient.

*Needs:* §4.16 (Class groups, p-ramified Galois groups and unit towers); §0.7 (The system μ_{p^m}(K) is Mittag-Leffler); ArithmeticGaloisDuality R02.1 (`mittag-leffler-lim-one`).

### 4.18 Leopoldt and the strict-at-p Tate Selmer group

For a number field F and W*=ℚ_p/ℤ_p(1), choose the Selmer condition strict at every p-adic place and the propagated finite condition away from p. The resulting Selmer group is finite iff the p-adic unit localization map O_F^×⊗ℤ_p→⊕_(v|p) completed O_Fv^× has rank r₁+r₂−1 (Leopoldt). For a finite character χ of prime-to-p order, the corresponding χ-component is finite when Leopoldt holds for its splitting field; use the character idempotent only under the prime-to-p hypothesis. This is a statement/equivalence, not a proof of Leopoldt for all number fields.

Finite F; p-primary coefficient and local conditions specified. The strict p condition cannot be replaced by relaxed or the full finite unit condition.

Prove this as follows. Use global Kummer and the finite class group to write the exact unit/class-group Selmer sequence. Strictness at p cuts out the kernel of the unit localization map; its corank is precisely the Leopoldt rank defect. The remaining class-group and finite torsion terms are finite. For χ use the prime-to-p idempotent and apply the same argument to the splitting field.

(Rubin (1999 draft), Corollary I.6.4, p. 16; Remark II.2.7, p. 25.)

**Checks.**

- For ℚ the unit rank is zero and the strict Selmer group is finite.
- Relaxing p admits local unit Kummer classes and no longer expresses the same rank-defect kernel.
- If p divides the character group order, its integral averaging idempotent is unavailable.

*Needs:* §0.9 (The Kummer identification for S-units); §4.17 (The closed-unit and class-group exact sequence); §2.2 (Compact and rational Selmer kernel).

### 4.19 Local units and the cyclotomic Euler system in Iwasawa cohomology

For K_n=ℚ_p(μ_(p^n)), the completion K̂_n^×≃H¹(K_n,ℤ_p(1)) intertwines norms with corestriction and gives lim_n K̂_n^×≃H¹_Iw(ℚ_p,ℤ_p(1)). Principal-unit inclusions give U∞→H¹_Iw. Every specified norm-compatible unit sequence maps to its compatible local Kummer sequence. For an external cyclotomic-unit Euler system, localization of its norm identities must retain the Frobenius operator on the field/class, rather than replace it by the scalar coefficient action. This is the cohomological reinterpretation of RJW §10.5; constructing those Euler-system classes is an output consumer’s task.

p odd; D ≥ 1 prime to p; completions as in SelmerIwasawaCohomology L0.

Prove this as follows. Apply the local Kummer norm squares at every finite level and take the inverse limit. Restrict the comparison to principal units and prove compatibility with the completed Γ-action. Apply this map to any supplied norm-compatible sequence; for external Euler-system sequences use the actual Frobenius class action in each identity.

(Rodrigues Jacinto–Williams (arXiv v2), §10.5, (10.5)–(10.8) and Definition 10.16, pp. 52–53 (arXiv v2); published pp. 170–172.)

Coleman's map Col′ and Perrin-Riou's big logarithm, which RJW mention after (10.8), are owned by ColemanPowerSeries and PadicHodgeRegulators; they are not planned here.

*Needs:* §0.8 (The p-adic Kummer identification); §0.4 (Local completion and algebraic tensor comparison); §3.1 (Iwasawa cohomology).

### 4.20 Greenberg Selmer groups of Tate twists

Give V_n = ℚ_p(n) the filtration Fil^iℚ_p(n) = ℚ_p(n) for i ≤ n and 0 for i > n. Then L^Gr_{v_p} = H^1(K_∞^+, W_n) for n ≥ 1 and L^Gr_{v_p} = H^1_ur(K_∞^+, W_n) for n ≤ 0. Inflation–restriction gives H^1(F, W_n) = Hom_{cts,{±1}}(G_{F_∞}, W_n), and hence H^1_{L^Gr}(F, W_n) = Hom_cts(X_∞^{c=(−1)^n}, W_n) for n ≥ 1 and Hom_cts(Y_∞^{c=(−1)^n}, W_n) for n ≤ 0. Since (X_∞)^{c=1} ≅ X_∞^+, for even n > 0, H^1_{L^Gr}(F, W_n) = Hom_cts(X_∞^+, W_n), whose Pontryagin dual is X_∞^+(−n), the module X_∞^+ with its Λ(Γ^+)-action twisted by χ^{−n} (RJW §13.5.2, Example 13.22).

p odd; F_∞ = ℚ(μ_{p^∞}), F = F_∞^+ = ℚ(μ_{p^∞})^+, Gal(F_∞/F) = {1, c}; K_∞^+ = ⋃_n ℚ_p(μ_{p^n})^+ denotes the local tower, with cohomology defined by finite-level restriction colimits; χ is the cyclotomic character, T_n = ℤ_p(n), V_n = ℚ_p(n), W_n = (ℚ_p/ℤ_p)(n); X_∞ = Gal(M_∞/F_∞) and Y_∞ = Gal(L_∞/F_∞) for the maximal abelian pro-p extensions unramified outside p and everywhere unramified, with X_∞^+ = Gal(M_∞^+/F_∞^+) (§4.16).

Prove this as follows. Local condition: W_n/Fil^1W_n is 0 for n ≥ 1 and W_n for n ≤ 0, so L^Gr is everything or the unramified condition (§2.8). G_{F_∞} acts trivially on W_n, so H^1(F_∞, W_n) = Hom_cts(G_{F_∞}, W_n); since #{1, c} = 2 is prime to p, inflation–restriction gives H^1(F, W_n) = Hom_cts(G_{F_∞}, W_n)^{{1,c}}. A class is p-power torsion with abelian image, so it factors through the maximal abelian pro-p extension of F_∞; the unramified conditions away from p factor it through X_∞, and for n ≤ 0 the condition at p factors it through Y_∞. c acts on W_n by (−1)^n and X_∞ = X_∞^{c=1} ⊕ X_∞^{c=−1} (p odd), so {±1}-equivariant homomorphisms are those on the (−1)^n-eigenspace; restriction identifies X_∞^{c=1} with X_∞^+. Pontryagin duality with the contragredient action (§2.10) turns Hom_cts(X_∞^+, W_n) into X_∞^+(−n).

(Rodrigues Jacinto–Williams (arXiv v2), §13.5.2, pp. 70–71 (arXiv v2); published pp. 196–197.)

RJW write H^1_{L^Gr}(F_∞, W_n) for the group over F = F_∞^+ in steps (3)–(4), and "n ≥ 0" for n ≤ 0. The odd-n and n ≤ 0 cases give the minus part of X_∞ and the parts of Y_∞; only even n > 0 recovers X_∞^+.

*Needs:* §2.8 (Greenberg's local condition); §2.7 (The unramified condition); §2.9 (Compact and rational Galois Selmer groups); §2.10 (Pontryagin duals with the contragredient action); §2.2 (Compact and rational Selmer kernel); §4.16 (Class groups, p-ramified Galois groups and unit towers).

### 4.21 The Iwasawa–Greenberg main conjecture (as a proposition)

For a p-ordinary G_ℚ-representation V with saturated G_{ℚ_p}-stable filtration, stable global lattice T and A=V/T, explicit archimedean realization and a specified analytic p-adic L-function L_p(V) in Frac Λ(Γ^+), state Greenberg’s proposition: corank_Λ Sel_Gr(F∞^+,A)=r_V; and, if V is critical, its torsion dual has characteristic ideal (L_p(V)). If L_p(V) is only a fraction, equality is an equality of fractional ideals with the integral characteristic ideal, and hence asserts integrality of that ideal. The datum carries the normalization/interpolation hypothesis appropriate to V; no general existence theorem is asserted. Positive corank leads to a determinant/leading-term proposition with a regulator trivialization, not this rank-zero characteristic-ideal equation.

V p-ordinary at p (Greenberg filtration, stable under G_{ℚ_p}); L_p(V) is supplied data.

The construction proceeds as follows. Definitions only: (i) uses the corank (§2.11) and (ii) the characteristic ideal of a finitely generated torsion Λ(Γ^+)-module (PadicMeasuresIwasawaAlgebras L4, with the isotypic decomposition over Λ(Γ^+)).

(Rodrigues Jacinto–Williams (arXiv v2), §13.5.3, Conjecture 13.21, p. 71 (arXiv v2); published p. 197.)

The named operations and identities are:

- `PadicLFunctionDatum` — An element L_p(V) of Frac Λ(Γ^+), recorded as data with its conjectural interpolation.
- `GreenbergCorankConjecture` — Proposition (i): corank_{Λ(Γ^+)} H^1_{L^Gr}(F, W) = r_V.
- `GreenbergCharIdealConjecture` — Proposition (ii): r_V = r_{V^∨} = 0 → char(H^1_{L^Gr}(F, W)^∨) = (L_p(V)).
- `GreenbergMainConjecture` — The conjunction of (i) and (ii).
- `greenbergCharIdealConjecture_of_not_critical` — (ii) holds vacuously when V is not critical.

**Checks.**

- V = ℚ_p(n), n even > 0: (ii) is the twisted Iwasawa main conjecture (§4.22).
- V = ℚ_p: r_{V^∨} = 1, so (ii) says nothing, although Theorem 13.8 is proved (Remark 13.23).
- At the torsion ideal-comparison interface over Λ=O[[T]], X=Λ/(f) with f≠0 has characteristic ideal (f). The predicate with supplied element f is true, whereas the predicate with pf is false, since p is a nonunit. A unit multiple of f preserves the predicate. Thus supplying an element does not make the ideal assertion automatic.
- Changing the lattice preserves rationalized Iwasawa cohomology and corank. Its integral finite-coefficient tower errors need not be finite Λ-modules; a Λ/(p) error changes a height-one characteristic divisor. Do not assert integral characteristic-ideal independence without a proved error cancellation.

The rank-zero characteristic-ideal statement (ii) and any positive-rank leading-term statement are distinct propositions; only (i) and (ii) are stated. RJW state the conjecture over F = ℚ(μ_{p^∞})^+, not over the cyclotomic ℤ_p-extension used by Greenberg (their Remark 13.9).

*Needs:* §2.8 (Greenberg's local condition); §2.9 (Compact and rational Galois Selmer groups); §2.11 (Coranks); §2.10 (Pontryagin duals with the contragredient action); §4.15 (The Gamma factor, r_V and criticality); PadicMeasuresIwasawaAlgebras L4/characteristic-ideal; PadicMeasuresIwasawaAlgebras L4/character-decomposition.

### 4.22 Equivalence of the critical Tate-twist main-conjecture propositions

For n positive even, the Tate Selmer dictionary identifies its compact dual with X∞^+(−n). The specified analytic element is the corresponding nth twist of Kubota–Leopoldt. By the characteristic-ideal twist automorphism, Greenberg’s rank-zero ideal proposition for ℚ_p(n) is equivalent to the cyclotomic main-conjecture proposition char X∞^+=(the normalized zeta element). Prove the equivalence of propositions, not the cyclotomic main-conjecture theorem. Its corank assertion is equivalent to torsion of X∞^+. The n=0 case remains excluded by criticality of the Tate dual.

p odd; F_∞ = ℚ(μ_{p^∞}), F = F_∞^+ = ℚ(μ_{p^∞})^+, Gal(F_∞/F) = {1, c}; K_∞^+ denotes the finite-level local tower; χ is the cyclotomic character, T_n = ℤ_p(n), V_n = ℚ_p(n), W_n = (ℚ_p/ℤ_p)(n); X_∞ = Gal(M_∞/F_∞) and Y_∞ = Gal(L_∞/F_∞) for the maximal abelian pro-p extensions unramified outside p and everywhere unramified, with X_∞^+ = Gal(M_∞^+/F_∞^+) (§4.16).

Prove this as follows. Use the explicit plus/Tate-dual dictionary, including the contragredient Λ action. Transport the characteristic ideal along the twist automorphism and compare the supplied analytic twist. State the equivalence in both directions; the analytic main-conjecture assertion remains a conjecture.

(Rodrigues Jacinto–Williams (arXiv v2), §13.5.3, Example 13.22 and Remark 13.23, pp. 71–72 (arXiv v2); published pp. 197–198.)

The criticality parity table restricts this comparison to even positive twists; n=0 is excluded (Rodrigues Jacinto–Williams, Remark 13.23).

*Needs:* §4.20 (Greenberg Selmer groups of Tate twists); §4.15 (The Gamma factor, r_V and criticality); §4.21 (The Iwasawa–Greenberg main conjecture (as a proposition)); PadicMeasuresIwasawaAlgebras L4/characteristic-ideal; PadicMeasuresIwasawaAlgebras L4/characteristic-ideal-api-7.

### 4.23 Positive-rank determinant formulation as a separate proposition

Specify O a complete DVR with fraction field E, a perfect integral Selmer complex C, a specialization χ, a parameter u at χ, a series f(u)∈E[[u]], and r=dim_E H¹(C⊗^L_χ E)>0. A supplied nondegenerate regulator, with its normalization, must induce an actual line equivalence θ_reg:𝔇(C⊗^L_χ O)⊗E≃E; for each retained perfect local correction E_v supply the corresponding line trivialization. Let J be the product of θ_reg(𝔇(C⊗^L_χ O)) and the local-error fractional lattices, with the inverse-determinant convention of L3. Define the proposed leading-term assertion by f_k=0 for k<r, f_r≠0 and O·f_r=J. Record the regulator construction as input, not an unconstrained asserted equality. Specialization rank r is distinct from generic Λ-corank. This is an explicitly proposed arithmetic schema, not a claim that RJW Conjecture 13.21(ii) states it or that a non-torsion module has a characteristic ideal.

Perfectness, specialization, chosen parameter, analytic series and actual regulator/line maps. All determinant factors are defined before the assertion. No existence of these analytic/regulator data is asserted.

The construction proceeds as follows. Use the L3 determinant line without a canonical scalar trivialization in positive rank. Specify the regulator-induced comparison of generic determinant lines and the specialized exterior powers. Define equality of the resulting fractional lattices with the analytic leading coefficient, including order and local factors.

(Rodrigues Jacinto–Williams (arXiv v2), Conjecture 13.21(ii) and Remark 13.24, preprint pp. 71–72; Nekovář, §§8.9–8.10, pp. 238–251.)

The named operations and identities are:

- `LeadingTermData` — Actual perfect complex, parameterized analytic series, specialized rank and regulator line equivalences.
- `LeadingTermStatement` — Coefficients below r vanish, coefficient r is nonzero and its principal fractional lattice equals the defined determinant product.
- `leadingTerm_changeTrivialization` — Scaling the regulator equivalence by a∈Eˣ scales J by a; an O-unit leaves its fractional ideal unchanged.
- `leadingTerm_reparameterize` — For u′=a u plus higher terms, a∈Oˣ, the leading coefficient scales by a^−r and its fractional lattice is unchanged.

**Checks.**

- For generically acyclic C the regulator input reduces to the L3 torsion determinant convention.
- A degenerate regulator cannot give a determinant trivialization.
- Deleting a nonunit local-error determinant changes the leading-term lattice.

*Needs:* §3.14 (Determinant line and its height-one characteristic divisor); §3.9 (Local specialization correction complex); §4.21 (The Iwasawa–Greenberg main conjecture (as a proposition)).

### 4.24 Global finite Selmer reductions and conjugation

Define Sel_f(F,T) as the preimage of the rational finite Selmer group and Sel_(f,T)(F,T/λ^m) as the image of Sel_f(F,T) in finite coefficient cohomology; distinguish this global image from the Selmer kernel formed from independently propagated local conditions. For a free O-submodule S of Sel_f(F,T) whose image modulo torsion is saturated, its image S(m) is free over O/λ^m of the same rank. Its localizations lie in the nonsingular condition at unramified non-p places and at unramified p places in the small crystalline range. If c restricts to an automorphism of F, conjugation gives Sel_f(F,V)≃Sel_f(F,V^c), carrying each place to its conjugate.

Stable free lattice T; m≥1; the saturation condition is on the image in Sel_f/torsion, not merely a submodule of the torsion group. The local crystalline hypothesis is the one in §4.10.

Prove this as follows. Apply the coefficient LES and the global kernel definition to form the preimage and finite image. The map (Sel_f/torsion)/λ^m→Sel_(f,T)(T/λ^m)/image(torsion) is injective; saturation gives the stated free reduction and rank. Use §4.10 and unramified propagation for the local containment. Conjugate extension classes and localization maps to get inverse Selmer maps.

(Liu–Tian–Xiao–Zhang–Zhu, Definitions 2.4.1–2.4.2 and Lemma 2.4.3, p. 129; Lemma 2.4.5 and Proposition 2.4.6(1), p. 130.)

*Needs:* §4.9 (The Bloch–Kato local condition on T and W); §4.10 (Crystalline extensions and the integral finite preimage); §2.6 (From V to T and W; saturation); §2.15 (Finite against unramified classes at bad primes).

### 4.25 Uniform local annihilation for pure weight minus one

Let T be free over O with V=T[1/p], V^c≃V*(1) and V pure of weight −1 at every non-p finite place, in the ArithmeticGaloisRepresentations Weil–Deligne convention. For each finite set Σ there is an m_Σ depending only on T,Σ such that for every saturated S of §4.24 and every m>m_Σ, all non-p finite localizations of λ^(m_Σ)S(m) at w∈Σ are zero. At such w, purity for V and its Tate dual gives H⁰=H²=0 and the away-p Euler characteristic gives H¹(K_w,V)=0. Thus integral H¹ and torsion H² are killed by λ^m_w; the coefficient LES kills finite H¹ by λ^(2m_w). Set m_Σ=max_(w∈Σ,w∤p∞)2m_w.

Conjugate Tate self-duality and local purity are both required. No assertion at p or archimedean places.

Prove this as follows. Import the precise monodromy purity convention and prove absence of invariant eigenvalue one in the relevant monodromy-kernel pieces. Apply local Tate duality and Euler characteristic to get rational H¹ zero; use integral finiteness to bound H¹ and H² torsion. Use the coefficient LES for T→T→T/λ^m and take the stated finite maximum.

(Liu–Tian–Xiao–Zhang–Zhu, Proposition 2.4.6(2) and proof, pp. 130–131.)

*Needs:* §4.24 (Global finite Selmer reductions and conjugation); ArithmeticGaloisRepresentations R01.2/purity-of-weil-deligne-representations; ArithmeticGaloisDuality R02.4; §1.2 (Compatibility of the local pairings for T, V, W and W_M).

### 4.26 Elliptic Bloch–Kato and classical Selmer vanishing

For E/F and V=V_p E, identify H¹_f(F_v,V) with (lim_m E(F_v)/p^m E(F_v))⊗_ℤpℚ_p under Kummer at every finite place; at v∤p this space is zero, and the propagated finite condition on E[p∞] is zero; finite E[p^m] Kummer conditions can still retain Tamagawa contributions. Globally the rational finite Selmer group is (lim_m Sel_(p^m)(E/F), with multiplication-by-p coefficient transitions)⊗ℤpℚ_p, equivalently T_p Sel_(p∞)(E/F)⊗ℤpℚ_p, and H¹_f(F,V)=0 iff the classical p∞ Selmer group is finite (equivalently its ℤ_p-corank is zero). The Weil pairing gives V*(1)≃V, so its Tate-dual finite Selmer group vanishes under the same hypothesis. No finiteness of the full Tate–Shafarevich group is inferred.

Stable Tate module and upstream finite-level Kummer/Selmer exact sequences. At p the p-adic comparison for the elliptic Kummer map is part of this target, after the minimal period foundations.

Prove this as follows. Import the finite-level elliptic Kummer and Selmer/Sha sequences from EllipticCurves Layer 7. Use Bloch–Kato’s abelian-variety Kummer comparison at p and the away-p rational unramified dimension calculation; distinguish rational zero from finite torsion Kummer images. Pass to the Tate-module limit and rationalization; compact Selmer finiteness gives finite rank, so rational zero iff the discrete classical group has corank zero and hence is finite. Apply the Weil pairing for the dual.

(Bloch–Kato, Example 3.11, pp. 359–361; Burungale–Tian (arXiv v2), §3.1, preprint pp. 5–6; Skinner (author preprint), §2.2.1, preprint p. 8; Rubin (1999 draft), Chapter I, §6.4 (Abelian varieties), display (9) and Remark 6.6, printed pp. 16–17 (PDF pp. 26–27).)

**Checks.**

- Rational local finite cohomology is zero away from p, but finite p-torsion Kummer images need not be zero.
- The Weil pairing identifies the Tate dual with V, so both rational finite Selmer vanishings are obtained together.
- Corank zero implies finiteness of the p-primary Selmer group, not the full Sha group at every prime.
- The torsion discrete Sel_(p∞) tensor ℚ_p is zero regardless of corank, so it cannot be the rational finite Selmer group.

*Needs:* §2.12 (Passage from finite elliptic Selmer groups to p^∞); §4.9 (The Bloch–Kato local condition on T and W); §2.18 (Selmer groups of T and W as limits); TauCetiRoadmap.EllipticCurves Layer 7.

### 4.27 Finite-image adjoint Selmer finiteness with descent errors

Let ρ be a finite-image characteristic-zero representation over E with stable lattice, L/F its finite Galois splitting field, and A=ad⁰(ρ)⊗E/O. The finite-condition Selmer group Sel_f(F,A) is finite. Restriction maps it into the everywhere-unramified Hom of the finite p-class group of L with A; the restriction kernel is a subgroup of H¹(Gal(L/F),A), which is finite. This proves finiteness even when p divides [L:F]. A canonical quotient of the class group is not asserted: the actual target is a Galois-equivariant Hom group with finite group-cohomology errors. Under prime-to-p degree and compatible unramified propagated conditions, restriction/invariants give the sharper class-group-Hom identification.

Finite-image ρ; finite-dimensional ad⁰ and propagated rational finite conditions. Odd irreducible rank-two Artin over ℚ is the source’s worked case; modularity is not needed for the finiteness argument.

Prove this as follows. Over L the representation is trivial and its rational finite condition is unramified at every finite place, including p; restriction of propagated finite classes therefore lands in unramified discrete classes. Use global class field theory to factor those classes through Cl_L[p∞], giving a finite Hom group. Inflation–restriction gives the finite kernel: finite group cohomology of a finite-corank E/O module is finite and killed by |Gal(L/F)|. Include these errors when the degree has a p-part.

(Calegari–Geraghty–Harris (arXiv v1), §2, preprint p. 4 (published Appendix A §A.2, pp. 883–884).)

*Needs:* §4.9 (The Bloch–Kato local condition on T and W); §2.25 (Selmer vanishing descends under injective restriction); ArithmeticGaloisDuality R02.2 (`finite-index-descent`); TauCetiRoadmap.ClassFieldTheory Layer 11.

### 4.28 Ordinary modular Selmer parity over ℚ and quadratic fields

Let f be a cuspidal newform over ℚ of even weight k with trivial nebentypus, λ|p and p odd, ordinary at λ. Put V=V_λ(f)(k/2) in Nekovář’s self-dual convention. For F=ℚ or any quadratic extension of ℚ, dim_(E_λ) H¹_f(F,V) is congruent modulo two to the central analytic order of the base-change L-function. Equivalently its root number is (−1)^(dim H¹_f). In particular one-dimensional finite Selmer over ℚ forces sign −1; odd dimension over an imaginary quadratic field gives the analogous sign required by Skinner. This uses Nekovář Theorem 12.2.3 with base F₀=ℚ, trivial character χ and alternative (1), since [ℚ:ℚ] is odd; the quadratic extension is the permitted 2-abelian extension. No parity theorem for every ordinary representation is asserted.

An actual modular Galois representation with its self-dual twist and functional equation; p odd and λ-ordinary. The analytic order is finite.

Prove this as follows. Apply the rational finite Selmer and duality conventions and check the twist normalization against the central L-function. Use the quadratic character decomposition of both cohomology and L-functions; the parity defect is additive (Nekovář §§12.10.1–12.10.2). For ℚ the odd-degree alternative applies. **Unresolved proof input.** The source’s proof requires parity variation in ordinary families (§§12.7–12.8) and the rank-one Heegner/nonvanishing result (§12.10.9). These inputs still require their own construction and proof decomposition; they do not follow from the preceding Selmer structure theorems. Translate analytic parity into the root number using the self-dual functional equation.

(Nekovář, Theorem 12.2.3 and Remark 12.2.4, pp. 421–422; §§12.10.1–12.10.2, pp. 521–522; §§12.10.8–12.10.9, pp. 526–528.)

**Checks.**

- A one-dimensional ordinary modular finite Selmer group forces root number −1.
- Even finite Selmer dimension gives root number +1, without implying rank zero.
- A nonordinary λ is outside this theorem, even when the representation is self-dual.

*Needs:* §4.9 (The Bloch–Kato local condition on T and W); §1.4 (Duality for a global mapping fibre with local conditions); §2.25 (Selmer vanishing descends under injective restriction).

### 4.29 Two-primary Selmer parity for congruent-number twists

For positive squarefree n let E_n be the smooth elliptic curve n y²=x³−x, equivalently y²=x³−n²x. Then corank_(ℤ₂) Sel_(2∞)(E_n/ℚ) is even for n≡1,2,3 (mod 8) and odd for n≡5,6,7 (mod 8). The other residues are excluded by squarefreeness. This is corank of the infinite Selmer group, not dim_F₂ Sel₂, nor the Mordell–Weil rank without controlling divisible Sha. Match the two models by (X,Y)=(nx,n²y) and identify their Kummer maps. Source route: the p=2 case of Dokchitser–Dokchitser Theorem 4.19 is explicitly attributed there to Monsky; its full proof is a separate proof input. The elementary local root-number calculation supplies the congruent-number residue table.

n>0 squarefree; characteristic zero; the infinite 2-primary Selmer group and corank use the upstream elliptic carrier. No density assertion or Smith distribution theorem is part of this target.

Prove this as follows. Identify the two curve models and import their finite Selmer/Sha and Kummer systems from EllipticCurves Layer 7. Compute the local root numbers for the full rational two-torsion model, including the real and 2-adic factors; their product is +1 in residues 1,2,3 and −1 in residues 5,6,7. Apply the two-primary parity proof, keeping its divisible-Sha corank term; the cited source supplies the exact conclusion but its Monsky input needs decomposition. **Unresolved proof input.** Monsky’s two-primary argument has not been decomposed into prerequisites here; Dokchitser–Dokchitser attributes this case to reference [26] rather than proving it. The input concerns infinite Selmer corank and cannot be replaced by a computation of dim Sel₂. Use the elliptic functional equation to identify analytic-order parity with the root sign.

(Dokchitser–Dokchitser, Theorem 4.19 (= Theorem 1.4), pp. 593–594, p=2 attribution to reference [26]; Cowland Kellock–Dokchitser (arXiv v1), Theorem 3.40, p. 19, Theorem 2.3, pp. 4–5, and Appendix A, pp. 26–27, for the local root-number calculation.)

**Checks.**

- For n=1, c₄=48, c₆=0 and Δ=64. The normalized 2-adic triple is (6,∞,4), with odd part c₄′=3. Appendix A gives w₂=−1; the real factor is −1 and every odd prime is good, hence the global sign is +1. Two-primary parity then gives even infinite Selmer corank, while rational two-torsion still contributes to dim Sel₂.
- For n=5 the same normalized triple has c₄′=75≡11 (mod 16), giving w₂=+1. The factor at 5 is +1, and the real factor is −1, so the global sign is −1 and two-primary parity gives odd infinite Selmer corank. Here v₂(c₆)=∞ and the normalized c₆ term is zero; dividing by a power with infinite exponent is never used.
- n≡0,4 mod 8 is not a positive squarefree input.

*Needs:* TauCetiRoadmap.EllipticCurves Layer 7; §4.26 (Elliptic Bloch–Kato and classical Selmer vanishing).

### Examples

For the Tate line ℚ_p(n), h^(n,n)=1 and F∞=(−1)^n, hence Γ_ℝ(s−n). At s=1 its pole order is one exactly for positive odd n. Applying the same calculation to the Tate dual ℚ_p(1−n) shows that the critical twists are positive even or negative odd: n=2 and n=−1 pass, n=0 fails. Changing the real Betti sign of the type (0,0) line replaces Γ_ℝ(s) by Γ_ℝ(s+1), so the pole at zero disappears.

For the crystalline trivial representation, D_cris=K₀, t_V=D_dR/Fil⁰=0 and H⁰=ℚ_p, so dim_ℚp H¹_f=1. For ℚ_p(1), t_V has dimension one over K and H⁰=0, giving dim_ℚp H¹_f=[K:ℚ_p]. Over a general finite p-adic K this factor cannot be dropped. The unit/class sequence gives ker(X∞⁺→Y∞⁺)=U∞,1⁺/E∞,1⁺. A rank-zero unit image makes this kernel U∞,1⁺, fixing the quotient direction. The curve transformation (X,Y)=(nx,n²y) sends n y²=x³−x to Y²=X³−n²X for n≠0. In its 2-primary Selmer corank the divisible part of Sha remains; a finite Sel₂ computation does not determine that corank.

### Dependencies

Layers 0, 1, 2, 3 and the supplier interfaces above: ArithmeticGaloisDuality R02.1; ArithmeticGaloisDuality R02.1 (`continuous-section-long-exact`); ArithmeticGaloisDuality R02.1 (`mittag-leffler-lim-one`); ArithmeticGaloisDuality R02.2 (`finite-index-descent`); ArithmeticGaloisDuality R02.4; ArithmeticGaloisDuality R02.4 (`global-euler-characteristic`); ArithmeticGaloisRepresentations R01.2/purity-of-weil-deligne-representations; PadicMeasuresIwasawaAlgebras L4/character-decomposition; PadicMeasuresIwasawaAlgebras L4/characteristic-ideal; PadicMeasuresIwasawaAlgebras L4/characteristic-ideal-api-7; PerfectoidSpaces P1 (`completed-colimit-of-perfectoid-tate-rings`); PerfectoidSpaces P1 (`fontaine-theta-and-primitive-kernel`); PerfectoidSpaces P1 (`fontaine-theta-comparison-with-mathlib`); PerfectoidSpaces P1 (`witt-vectors-of-perfect-plus-ring`); PerfectoidSpaces P3 (`finite-extensions-of-perfectoid-fields`); Tau Ceti `TauCeti.Hodge.HodgeStructureOn.dual`; Tau Ceti `TauCeti.Hodge.HodgeStructureOn.finrank_dual_piece`; Tau Ceti `TauCeti.Hodge.HodgeStructureOn.tateTwist`; Tau Ceti `TauCeti.Hodge.tate_hodgeNumber`; Tau Ceti `TauCeti.Hodge.tate`; TauCetiRoadmap.ClassFieldTheory Layer 11; TauCetiRoadmap.EllipticCurves Layer 7; TauCetiRoadmap.LocalFieldsRamification Layer 1.

## Downstream consumers

EulerSystemsCyclotomicMainConjecture uses completed units, Kummer/norm compatibility and the cyclotomic Selmer dictionary. ModularIwasawaMainConjectures uses infinite Selmer complexes, corrected specialization, localization surjectivity and the Fitting/characteristic comparison. PadicHodgeRegulators uses the period and finite-condition foundations and supplies further comparison/regulator theory. RankZeroOneBSD uses the ordinary structure criteria and the specified parity consequences; analytic rank inputs remain separate. The Liu–Tian–Xiao–Zhang–Zhu applications use the general torsion-crystalline condition, its small-weight comparisons and uniform away-p bound. The Artin adjoint application uses the restriction/class-group finiteness criterion.

## References

Locators use the editions below. For Rubin's draft, PDF page is printed page plus ten; for Nekovář, plus nine. ArXiv and author-preprint pagination is stated explicitly, and differs from journal pagination.

- Karl Rubin, [Euler systems](https://swc-math.github.io/notes/files/99RubinES.pdf). Author draft of Annals of Mathematics Studies 147 (2000), 1999 Arizona Winter School; printed page = PDF page − 10.
- Barry Mazur; Karl Rubin, [Controlling Selmer groups in the higher core rank case](https://arxiv.org/abs/1312.4052v1). arXiv:1312.4052v1 (14 December 2013); published in J. Théor. Nombres Bordeaux 28 (2016).
- Joaquín Rodrigues Jacinto; Chris Williams, [An introduction to p-adic L-functions](https://arxiv.org/abs/2309.15692v2). arXiv:2309.15692v2 (19 December 2024); published in Essential Number Theory 4 (2025), 101–216. Locators use the arXiv v2 pagination unless expressly marked as published.
- Ashay A. Burungale; Ye Tian, [A rank zero p-converse to a theorem of Gross–Zagier, Kolyvagin and Rubin](https://arxiv.org/abs/2506.03465v2). arXiv:2506.03465v2 (11 October 2025); Annals of Mathematics 203 (2026).
- Jan Nekovář, [Selmer complexes](https://www.numdam.org/item/AST_2006__310__R1_0.pdf). Astérisque 310 (2006), Numdam open-access PDF (568 PDF pages; printed page = PDF page − 9).
- Y. Liu; Y. Tian; L. Xiao; W. Zhang; X. Zhu, [On the Beilinson–Bloch–Kato conjecture for Rankin–Selberg motives](https://doi.org/10.1007/s00222-021-01088-4). Inventiones Mathematicae 228 (2022), 107–375; maintainer-cleared version of record.
- Ralph Greenberg, [On the structure of Selmer groups](https://warwick.ac.uk/fac/sci/maths/people/staff/david_loeffler/jhc70/greenberg.pdf). Author preprint, 29 pages; use PDF pagination.
- F. Castella; G. Grossi; J. Lee; C. Skinner, [On the anticyclotomic Iwasawa theory of rational elliptic curves at Eisenstein primes](https://web.math.ucsb.edu/~castella/Eisenstein.pdf). Author preprint dated 10 August 2021, 34 pages; published Inventiones Mathematicae 227 (2022).
- F. Calegari; D. Geraghty; M. Harris, [Bloch–Kato conjectures for automorphic motives](https://arxiv.org/pdf/1907.08694v1). Companion appendix preprint, 10 pages, to Modularity lifting for non-regular symplectic representations, Duke Mathematical Journal 169 (2020), Appendix A.
- Christopher Skinner, [A converse to a theorem of Gross, Zagier, and Kolyvagin](https://arxiv.org/pdf/1405.7294). Author preprint; published Annals of Mathematics 191 (2020), 329–354.
- Kazuya Kato, [p-adic Hodge theory and values of zeta functions of modular forms](https://www.numdam.org/item/AST_2004__295__117_0.pdf). Astérisque 295 (2004), 117–290.
- Spencer Bloch; Kazuya Kato, [L-functions and Tamagawa numbers of motives](https://virtualmath1.stanford.edu/~conrad/BSDseminar/refs/BKTamagawa.pdf). The Grothendieck Festschrift I (1990), 333–400; freely available university seminar copy.
- Pierre Deligne, [Valeurs de fonctions L et périodes d’intégrales](https://publications.ias.edu/sites/default/files/33_Valeursde.pdf). Proc. Sympos. Pure Math. 33, Part 2 (1979), 313–346; author-hosted scan.
- Lilybelle Cowland Kellock; Vladimir Dokchitser, [Root numbers and parity phenomena](https://arxiv.org/abs/2303.07883v1). arXiv:2303.07883v1 (14 March 2023); locators use its 29-page preprint.
- Tim Dokchitser; Vladimir Dokchitser, [On the Birch–Swinnerton-Dyer quotients modulo squares](https://annals.math.princeton.edu/wp-content/uploads/annals-v172-n1-p11-p.pdf). Annals of Mathematics 172 (2010), 567–596.
- Christophe Breuil, [Une remarque sur les représentations locales p-adiques et les congruences entre formes modulaires de Hilbert](https://www.numdam.org/article/BSMF_1999__127_3_459_0.pdf). Bull. Soc. Math. France 127 (1999), 459–472.
- Wiesława Nizioł, [Cohomology of crystalline representations](https://webusers.imj-prg.fr/~wieslawa.niziol/duke1993.pdf). Duke Mathematical Journal 71 (1993), 747–791.
- Jean-Marc Fontaine, [Le corps des périodes p-adiques](https://www.numdam.org/item/AST_1994__223__59_0.pdf). Astérisque 223 (1994), 59–111.
- Jean-Marc Fontaine; Guy Laffaille, [Construction de représentations p-adiques](https://www.numdam.org/item/ASENS_1982_4_15_4_547_0.pdf). Annales scientifiques de l’École normale supérieure 15 (1982), 547–608.
- Jean-Marc Fontaine, [Représentations p-adiques semi-stables](https://www.numdam.org/item/AST_1994__223__113_0.pdf). Astérisque 223 (1994), 113–184.
