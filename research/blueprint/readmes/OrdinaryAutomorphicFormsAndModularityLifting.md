# Ordinary automorphic forms and ordinary modularity lifting

This roadmap constructs the arithmetic ordinary Hecke and Galois families needed for rank-two modularity lifting over totally real fields. Its targets include the residually reducible Skinner–Wiles route, the distinguished residually irreducible route, and ordinary lifts of modular residual representations with specified weights or local components. The resulting interfaces supply ordinary cases of modularity lifting and potential modularity. The arithmetic targets below are specifications; none is an implementation claim.

The ordinary projector, weight Iwasawa algebra and general Hida control theorem come from PadicFamilies and PadicMeasuresIwasawaAlgebras. Definite quaternionic forms and their Hecke correspondences come from HilbertModularVarietiesAndShimuraCurves. Local lifting rings come from LocalGaloisDeformationRings, and generic patching and connectedness from DeformationAndDerivedPatchingAlgebra. This roadmap proves the arithmetic compatibility statements and applies those inputs. It owns the rank-two ordinary seed and lift interfaces in R21.6; their higher-rank consumers must import them here, rather than become prerequisites of their own supplier.

The local crystalline-to-ordinary calculation, including the weight-p+1 endpoint, belongs to PadicHodgeTheory R06.4. Its Wach-module and (φ,Γ)-module ingredients belong to PhiGammaModulesAndIwasawaCohomology. R21.5 imports the criterion and retains the global p=3 modularity argument. Washington’s distinct-prime cyclotomic class-group bound belongs to IntegralIwasawaTheory L4, and the p-adic unit-rank bound belongs to DiophantineApproximationAndTranscendence DT.3.

## Conventions and scope

Fix a totally real number field F, an odd prime p, a finite extension K/ℚ_p with ring of integers 𝒪, uniformizer ϖ and residue field k, and write G_F for the absolute Galois group. In the definite quaternionic construction, d=[F:ℚ] is even and D/F is ramified at every infinite place. The form module H⁰(X(U),A) is the module of A-valued functions on the finite double-coset set X(U)=D×∖G^D(𝔸_f)/U. A pairing weighted by inverse stabilizer orders requires these orders to be units in its coefficient ring; passing to a field is not a proof of integral perfection. At sufficiently deep p-power level the stabilizers are trivial.

An ordinary local representation carries a specified stable line and an unramified quotient; nearly ordinary allows the precise finite inertial character in the target. Distinctness of the two residual characters on a decomposition group is a separate hypothesis. A residual pseudorepresentation with two different characters does not automatically supply an integral family representation or a saturated line.

The Skinner–Wiles normalization has determinant ψε^{k−1} in weight k. BLGG, Newton–Thorne and BCGP use the dual normalization, in which weight zero corresponds to Hodge–Tate weights {0,1} and determinant ε⁻¹ when the central character is trivial. Their weight change to {0,2} has determinant ε⁻²ω, with ω the Teichmüller lift of the residual cyclotomic character. Keep the normalization attached to each target; identify dual conventions only through an explicit comparison. In the BCGP inertia hypothesis, an extension of ε̄⁻¹ by 1 means a stable line with character 1 and quotient character ε̄⁻¹.

There are two weight algebras in the permissible localization: Λ′_𝒪 before the finite weight-coordinate change, and Λ_𝒪 after it. The change has rank p^{Σr_j}. Weight and central-character variables retain their individual actions. A Hecke algebra being finite and torsion-free over weight space does not imply it is free or Gorenstein. Freeness statements carry their stabilizer and module hypotheses.

The irreducible Skinner–Wiles proof needs particular care in the dihedral case. The printed argument uses a minus-rank bound which fails for CM inducing fields. The restricted route, the original-scope target and the missing correction are all recorded below; the gap does not assert that the final lifting theorem is false. The independence result concerns the residually reducible Skinner–Wiles route. BLGG and Newton–Thorne start from residual modularity, so that result does not turn their lifts into initial cases for Serre’s conjecture.

## Layers and library boundary

| Layer | Arithmetic targets | Imported foundations |
| --- | --- | --- |
| R21.1 | Quaternionic ordinary parts, pairings, traces and dual towers | PadicFamilies L0a; PadicMeasuresIwasawaAlgebras; Hilbert geometry R18.3 |
| R21.2 | Permissible localizations, auxiliary-level modules, arithmetic control and Hilbert weight change | PadicFamilies L5; transfer R17.3; Deligne–Ribet L-functions |
| R21.3 | Ordinary family representations, pseudo-deformations, tangent conditions and determinant/flag comparisons | Global deformation rings; local rings L7–L8; arithmetic duality |
| R21.4 | Arithmetic patching, pro-modularity and localized R=T | Generic patching R03.3–R03.6; Selmer duality; auxiliary-prime selection |
| R21.5 | Skinner–Wiles lifting and the global small-prime branches | Solvable transfer R17.4; p-adic Hodge R06.4; class-group and unit-rank bounds |
| R21.6 | Family specialization and BLGG/BCGP/Newton–Thorne ordinary lifts | The preceding arithmetic layers and exact local-component contracts |

At the pinned baseline Mathlib 082e2d3 and Tau Ceti f790474, the declarations below provide algebraic carriers and predicates, rather than the arithmetic control and modularity results. Their actual statements were checked. A search of the pinned and current Tau Ceti arithmetic sources, the nine roadmaps newer than the atlas snapshot, and the current LocalGaloisGroups and ProfiniteArithmetic documents found no declaration supplying the ordinary lifting or Hilbert control targets here. Existing quaternion algebras, adelic carriers, general linear groups and modular/Hecke infrastructure are reused through their owners. The search does not assert that all modular-form infrastructure is absent.

- **mathlib:Module.Free** (Mathlib/LinearAlgebra/FreeModule/Basic.lean): A module with an existing basis (existenceBasis); this is the freeness predicate, not arithmetic freeness of an ordinary module.
- **mathlib:Module.Finite** (Mathlib/RingTheory/Finiteness/Defs.lean): Finite generation of the top submodule (fg_top); arithmetic Hecke finiteness still needs a theorem.
- **mathlib:MvPowerSeries** (Mathlib/RingTheory/MvPowerSeries/Basic.lean): Coefficient functions on finitely supported exponent vectors, σ →₀ ℕ; no analytic Iwasawa group-algebra comparison is supplied.
- **mathlib:IsLocalRing** (Mathlib/RingTheory/LocalRing/Defs.lean): A nontrivial commutative semiring with the local unit condition for a+b=1; completeness and Noetherianity are separate.
- **mathlib:IsIdempotentElem** (Mathlib/Algebra/Group/Idempotent.lean): The equation a*a=a; no construction or convergence of the ordinary projector.
- **mathlib:Fintype.prod_fiberwise** (Mathlib/Algebra/BigOperators/Group/Finset/Basic.lean): For finite source/target and commutative monoid coefficients, the product over fibres equals the total product; its generated additive statement is Fintype.sum_fiberwise.
- **mathlib:ZMod.pow_totient** (Mathlib/FieldTheory/Finite/Basic.lean): For x a unit of ZMod n, x^(Nat.totient n)=1; the theorem does not apply to nonunits.
- **mathlib:IsDedekindDomain.FiniteAdeleRing** (Mathlib/RingTheory/DedekindDomain/FiniteAdeleRing.lean): The restricted product over height-one primes of the adic completions of the fraction field, with their integral lattices; use the existing restricted-product infrastructure.
- **mathlib:NumberField.IsTotallyReal** (Mathlib/NumberTheory/NumberField/InfinitePlace/TotallyRealComplex.lean): Every infinite place is real; parity and arithmetic splitting are additional hypotheses.
- **mathlib:QuaternionAlgebra** (Mathlib/Algebra/Quaternion.lean): The four-component algebra with its specified parameters and multiplication; ramification classification and the chosen definite arithmetic quaternion algebra are additional inputs.
- **mathlib:CharacterModule** (Mathlib/Algebra/Module/CharacterModule.lean): Additive maps A → AddCircle (1:ℚ); this is not the continuous 𝒪-linear dual into K/𝒪 used for Hida towers.
- **mathlib:Matrix.GeneralLinearGroup** (Mathlib/LinearAlgebra/Matrix/GeneralLinearGroup/Defs.lean): Units of the finite square matrix semiring, for a finite decidable index; adelic automorphic quotients and their topology are additional inputs.

The suggested Lean file states only objects available over existing carriers: a weighted finite-set pairing, a fiber trace, their two endpoint identities, and arithmetic sanity checks. It does not introduce placeholder carriers for the targets below.

## R21.1. Iwasawa algebras and ordinary projectors

The generic finite/profinite projector is imported. These targets instantiate it on actual quaternionic modules, fix the Hecke adjoint, and make trace and duality compatible with the p-power tower.

### Skinner–Wiles' exponent gives the factorial projector

**Target:** `OrdinaryAutomorphicFormsAndModularityLifting:R21.1/projector-exponent-comparison` (lemma).

Let A be an 𝒪-algebra that is a finite 𝒪-module and t ∈ A. Let m be divisible by [k_i : F_p] for every residue field k_i of the commutative finite 𝒪-algebra 𝒪[t]. Then lim_{n→∞} t^{p^n(p^m − 1)} exists in A and equals the ordinary idempotent e_t = lim_n t^{n!} of PadicFamilies L0a. In particular Skinner–Wiles' operator e = lim_n T₀(p)^{p^n(p^m−1)} is L0a's ordinary projector of T₀(p).

**Hypotheses and conventions.**

- 𝒪 complete with finite residue field; A finite over 𝒪 (so 𝒪[t] is a finite product of complete local rings).

**Construction or proof route.**

1. 𝒪[t] = ∏_i 𝒪[t]_{m_i}, each factor complete local with residue field k_i ⊆ F_{p^m}.
2. If t is a unit in the i-th factor, t^{p^m−1} ∈ 1 + m_i, and (1 + x)^{p^n} ∈ 1 + m_i^{n+1} for x ∈ m_i since p ∈ m_i; so t^{p^n(p^m−1)} → 1 there. If t ∈ m_i, t^N → 0.
3. The limit is therefore the idempotent of the factors where t is a unit, which is e_t by L0a's characterisation (t invertible on e_tA, topologically nilpotent on (1 − e_t)A).

**Checks.**

- No second projector API is built: SW's exponent is compared with L0a's n!.

**Direct prerequisites:** `PadicFamilies:L0a/ordinary-idempotent-finite-algebra`; `PadicFamilies:L0a/finite-ordinary-projector`; `mathlib:IsIdempotentElem`; `mathlib:ZMod.pow_totient`.

**Sources.**

- [Residually reducible representations and modular forms](http://www.numdam.org/item/PMIHES_1999__89__5_0.pdf), §3.2, p. 32 (Numdam PDF page 29; printed page = PDF page + 3). The operator e = lim T₀(p)^{p^n(p^m−1)} in the second definition of T_k(U_a, 𝒪).

### Hida's ordinary projector on definite quaternionic forms

**Target:** `OrdinaryAutomorphicFormsAndModularityLifting:R21.1/quaternionic-ordinary-projector` (construction).

F is a totally real field of even degree d, p an odd prime, D/F the quaternion algebra ramified exactly at the infinite places, X(U) = D^×\G^D(A_f)/U and H⁰(X(U), R) the R-valued functions on it (HilbertModularVarietiesAndShimuraCurves R18.3), for open compact U ⊆ GL₂(𝒪_F ⊗ Ẑ) with U_v = GL₂(𝒪_{F,v}) for v | p; U_a = U ∩ U(p^a), U⁰_a = U ∩ U₀(p^a). 𝒪 is the ring of integers of a finite extension K of ℚ_p with uniformiser π and residue field k. Let T₀(p) = [U_a (1 0; 0 ϖ_p) U_a] on H⁰(X(U_a), R), ϖ_p the finite idele with a uniformiser at each v | p and 1 elsewhere. For every 𝒪-module R that is finite as a set, e := lim_n T₀(p)^{p^n(p^m−1)} (m sufficiently divisible) is L0a's ordinary projector of T₀(p); for R = 𝒪 it is L0a's adic projector on the finite free module H⁰(X(U_a), 𝒪), and for R = K/𝒪 = colim 𝒪/πⁿ it is the colimit of the finite projectors. e is an idempotent in End_𝒪(H⁰(X(U_a), R)) commuting with the Hecke algebra T(U_a, 𝒪) generated by T₀(p), T₀(p_i) (i = 1, …, t), G(U_a) and T(ℓ), S(ℓ) for ℓ ∤ p with U_ℓ = GL₂(𝒪_{F,ℓ}); it commutes with change of coefficients R → R′ and with the level-change maps (pullback and trace) between U_b and U_a, b ≥ a.

**Hypotheses and conventions.**

- [F : ℚ] even, so that D exists (a quaternion algebra is ramified at an even number of places).
- U_v = GL₂(𝒪_{F,v}) for v | p; the Hecke operators are those of R18.3.

**Uses.**

- `OrdinaryAutomorphicFormsAndModularityLifting:R21.1/quaternionic-nearly-ordinary-hecke-algebra`: T₂(U_a, 𝒪) = eT(U_a, 𝒪).
- `OrdinaryAutomorphicFormsAndModularityLifting:R21.1/ordinary-towers-duality`: the ordinary towers H_∞, M_∞.
- `PadicFamilies:L5`: the totally real control theorems are stated for these ordinary parts.

**API.**

- `TauCeti.OrdinaryModularity.ordinaryProjector` (constructor): e on H⁰(X(U_a), R) for R finite, 𝒪 or K/𝒪.
- `TauCeti.OrdinaryModularity.ordinaryProjector_isIdempotentElem` (characterisation): e² = e.
- `TauCeti.OrdinaryModularity.ordinaryProjector_eq_factorial` (compatibility): e agrees with PadicFamilies L0a's lim T₀(p)^{n!}.
- `TauCeti.OrdinaryModularity.ordinaryProjector_comm_hecke` (characterisation): e commutes with every element of T(U_a, 𝒪).
- `TauCeti.OrdinaryModularity.ordinaryProjector_pullback` (compatibility): e commutes with pullback H⁰(X(U_a)) → H⁰(X(U_b)).
- `TauCeti.OrdinaryModularity.ordinaryProjector_trace` (compatibility): e commutes with tr(U_b, U_a).

**Unit tests.**

- **ordinaryProjector_residue_field** (example): For R = k and a line on which T₀(p) acts by u ∈ F_{p^m}^×, e acts by 1, since u^{p^m−1} = 1; if T₀(p) acts nilpotently, e acts by 0.
- **ordinaryProjector_norm_forms** (example): e kills the norm-factoring functions I^D(U_a, ℤ) ⊗ R (ordinary-part-kills-norm-forms).
- **ordinaryProjector_level_one_icosian** (example): F = ℚ(√5), D = (−1, −1)_F (unramified at all finite places), U = GL₂(𝒪_F ⊗ Ẑ): the icosian maximal order has class number one, so X(U) is one point and H⁰(X(U), 𝒪) = 𝒪 consists of norm-factoring functions; its cuspidal quotient is 0, matching S₂(GL₂(𝒪_F ⊗ Ẑ)) = 0 for ℚ(√5).
- **ordinaryProjector_not_over_K** (example): Non-example: over K the powers T₀(p)^{p^n(p^m−1)} need not converge in End_K(H⁰(X(U_a), K)) with the discrete topology; e is defined on the lattice and extended.

**Construction or proof route.**

1. For R finite apply L0a/finite-ordinary-projector to T₀(p); by projector-exponent-comparison SW's exponent gives the same idempotent.
2. For R = 𝒪, H⁰(X(U_a), 𝒪) is finite free (R18.3); apply L0a/adic-instance. For R = K/𝒪 take the colimit over 𝒪/πⁿ, using naturality for the inclusions.
3. Commutation with Hecke operators, coefficient change, pullback and trace: these maps commute with T₀(p) (R18.3 and ordinary-trace-compatibility), so L0a/ordinary-projector-natural applies.

**Checks.**

- The projector is defined on integral or torsion coefficients and extended K-linearly, never by a limit in End_K.
- Level change is compatible with e in both directions (pullback and trace).

**Direct prerequisites:** `OrdinaryAutomorphicFormsAndModularityLifting:R21.1/projector-exponent-comparison`; `PadicFamilies:L0a/adic-instance`; `PadicFamilies:L0a/finite-ordinary-projector`; `PadicFamilies:L0a/ordinary-projector-natural`; `HilbertModularVarietiesAndShimuraCurves:R18.3`; `mathlib:IsIdempotentElem`; `mathlib:QuaternionAlgebra`.

**Sources.**

- [Residually reducible representations and modular forms](http://www.numdam.org/item/PMIHES_1999__89__5_0.pdf), §3.2, p. 34 (Numdam PDF page 31; printed page = PDF page + 3). The operator e on H⁰(X(U), R) for an 𝒪-module R.
- [Residually reducible representations and modular forms](http://www.numdam.org/item/PMIHES_1999__89__5_0.pdf), §3.2, p. 33 (Numdam PDF page 30; printed page = PDF page + 3). The quaternionic setting introduced for the Λ-adic theory.

### The ordinary projector kills norm-factoring forms

**Target:** `OrdinaryAutomorphicFormsAndModularityLifting:R21.1/ordinary-part-kills-norm-forms` (lemma).

Let I^D(U_a, ℤ) ⊆ H⁰(X(U_a), ℤ) be the functions factoring through the reduced norm ν_D : G^D(A_f)/U_a → A_f^×/ν_D(U_a), for a ≥ 1. Then e annihilates I^D(U_a, ℤ) ⊗ R for every 𝒪-module R.

**Hypotheses and conventions.**

- a ≥ 1, so that U_{a,v} is pro-p at each v | p.

**Construction or proof route.**

1. For f = h ∘ ν_D and g = (1 0; 0 ϖ_p), T₀(p)f(x) = Σ_i f(x g_i) over U_a g U_a = ⊔ g_i U_a, and ν_D(x g_i) ≡ ν_D(x)ν_D(ϖ_p) mod ν_D(U_a) for all i.
2. So T₀(p)f = N·(f translated by ν_D(ϖ_p)) with N = [U_a : U_a ∩ gU_ag^{−1}], a positive power of p.
3. Hence T₀(p) is topologically nilpotent on I^D(U_a, ℤ) ⊗ R and e = lim T₀(p)^{p^n(p^m−1)} is 0 there.

**Checks.**

- Only the cuspidal quotient S^D(U_a) = H⁰/I^D survives the projector; the Jacquet–Langlands comparison is on S^D.

**Direct prerequisites:** `OrdinaryAutomorphicFormsAndModularityLifting:R21.1/quaternionic-ordinary-projector`; `HilbertModularVarietiesAndShimuraCurves:R18.3`.

**Sources.**

- [Residually reducible representations and modular forms](http://www.numdam.org/item/PMIHES_1999__89__5_0.pdf), §3.2, p. 34 (Numdam PDF page 31; printed page = PDF page + 3). e annihilates I^D(U_a, ℤ) ⊗ R.

### The nearly ordinary Hecke algebra T_∞(U, 𝒪)

**Target:** `OrdinaryAutomorphicFormsAndModularityLifting:R21.1/quaternionic-nearly-ordinary-hecke-algebra` (construction).

F is a totally real field of even degree d, p an odd prime, D/F the quaternion algebra ramified exactly at the infinite places, X(U) = D^×\G^D(A_f)/U and H⁰(X(U), R) the R-valued functions on it (HilbertModularVarietiesAndShimuraCurves R18.3), for open compact U ⊆ GL₂(𝒪_F ⊗ Ẑ) with U_v = GL₂(𝒪_{F,v}) for v | p; U_a = U ∩ U(p^a), U⁰_a = U ∩ U₀(p^a). 𝒪 is the ring of integers of a finite extension K of ℚ_p with uniformiser π and residue field k. T(U_a, 𝒪) ⊆ End_𝒪(H⁰(X(U_a), 𝒪)) is generated over 𝒪 by T₀(p), T₀(p_i), G(U_a), T(ℓ) and S(ℓ) (ℓ ∤ p, U_ℓ maximal), and T₂(U_a, 𝒪) := eT(U_a, 𝒪), the image of T(U_a, 𝒪) in End_𝒪(eH⁰(X(U_a), 𝒪)). By the Jacquet–Langlands–Shimizu isomorphism S^D(U) ≅ S₂(U) this is Skinner–Wiles' eT*₂(U_a, 𝒪). The maps T₂(U_b, 𝒪) → T₂(U_a, 𝒪) (b ≥ a) are surjective, and T_∞(U, 𝒪) := lim_a T₂(U_a, 𝒪). With G(U) = lim_a G(U_a) ≅ (𝒪_F ⊗ ℤ_p)^× × Z(U) there is a continuous 𝒪[[G(U)]] → T_∞(U, 𝒪), and T_∞(U, 𝒪) is an algebra over Λ′_𝒪 = 𝒪[[X_1, …, X_{δ_F}, Y^{(1)}_1, …, Y^{(t)}_{d_t}]] via X_i ↦ S_{x_i} − 1 and Y^{(i)}_j ↦ T_{y^{(i)}_j} − 1, where the x_i generate a maximal ℤ_p-free summand of Z(U) and the y^{(i)}_j a free summand of rank d_i of 𝒰_{v_i}.

**Hypotheses and conventions.**

- [F : ℚ] even; G(U_a) ≅ (𝒪_F/p^a)^× × Z(U_a) via (a b; c d) ↦ (∏_{v|p}(a^{−1}d)_v, a).

**Uses.**

- `OrdinaryAutomorphicFormsAndModularityLifting:R21.2/permissible-maximal-ideal`: maximal ideals of T_∞(U, 𝒪).
- `OrdinaryAutomorphicFormsAndModularityLifting:R21.2/nearly-ordinary-hecke-algebra-comparison`: comparison with the definition by v-good lines.
- `PadicFamilies:L5`: finiteness and control over Λ′_𝒪 (Skinner–Wiles Corollary 3.4, Proposition 3.7).

**API.**

- `TauCeti.OrdinaryModularity.quaternionicHeckeAlgebra` (constructor): T(U_a, 𝒪) ⊆ End_𝒪(H⁰(X(U_a), 𝒪)).
- `TauCeti.OrdinaryModularity.nearlyOrdinaryHeckeAlgebra` (constructor): T₂(U_a, 𝒪) = eT(U_a, 𝒪).
- `TauCeti.OrdinaryModularity.nearlyOrdinaryHeckeAlgebra.transition_surjective` (characterisation): T₂(U_b, 𝒪) → T₂(U_a, 𝒪) is onto.
- `TauCeti.OrdinaryModularity.hidaHeckeAlgebra` (constructor): T_∞(U, 𝒪) = lim_a T₂(U_a, 𝒪).
- `TauCeti.OrdinaryModularity.hidaHeckeAlgebra.groupRingHom` (constructor): 𝒪[[G(U)]] → T_∞(U, 𝒪).
- `TauCeti.OrdinaryModularity.hidaHeckeAlgebra.lambdaAlgebra` (constructor): The Λ′_𝒪-algebra structure X_i ↦ S_{x_i} − 1, Y ↦ T_y − 1.

**Unit tests.**

- **nearlyOrdinaryHeckeAlgebra_commutative** (example): T₂(U_a, 𝒪) is commutative and finite over 𝒪.
- **nearlyOrdinaryHeckeAlgebra_icosian** (example): F = ℚ(√5), U = GL₂(𝒪_F ⊗ Ẑ), level a = 0: X(U) is one point, the cuspidal part is 0 and T₂ acts through the Eisenstein (norm) quotient, which e kills once a ≥ 1.
- **transition_sends_generators** (example): The transition map sends T₀(p) ↦ T₀(p), T₀(p_i) ↦ T₀(p_i) and g ∈ G(U_b) to its image in G(U_a).
- **lambdaAlgebra_diamond** (example): S_{x} for x ∈ Z(U) of finite order acts through a finite quotient; the X_i see only the ℤ_p-free part.

**Construction or proof route.**

1. The generators commute (R18.3), so T(U_a, 𝒪) is a commutative finite 𝒪-algebra; e ∈ T(U_a, 𝒪) by projector-exponent-comparison, and eT(U_a, 𝒪) acts faithfully on eH⁰(X(U_a), 𝒪).
2. The comparison with forms on GL₂ is R17.3 on S^D = H⁰/I^D, which e sees entirely (ordinary-part-kills-norm-forms).
3. Pullback H⁰(X(U_a)) → H⁰(X(U_b)) is Hecke-equivariant (G(U_b) → G(U_a)), so restriction of operators gives T₂(U_b, 𝒪) → T₂(U_a, 𝒪), surjective because generators map to generators.
4. The group elements give compatible maps 𝒪[G(U_a)] → T₂(U_a, 𝒪), hence 𝒪[[G(U)]] → T_∞(U, 𝒪) (the completed group ring of PadicMeasuresIwasawaAlgebras L1).

**Checks.**

- Λ′_𝒪 has δ_F variables X_i for the ℤ_p-free part of Z(U) and d = Σ d_i variables Y for the torus at p, after the choices of x_i and y^{(i)}_j; no variable is attached to the class group.

**Direct prerequisites:** `OrdinaryAutomorphicFormsAndModularityLifting:R21.1/quaternionic-ordinary-projector`; `OrdinaryAutomorphicFormsAndModularityLifting:R21.1/ordinary-part-kills-norm-forms`; `HilbertModularVarietiesAndShimuraCurves:R18.3`; `GL2AutomorphicRepresentationsAndTransfer:R17.3`; `PadicMeasuresIwasawaAlgebras:L1/convolution-algebra`; `mathlib:IsDedekindDomain.FiniteAdeleRing`; `mathlib:Matrix.GeneralLinearGroup`; `mathlib:MvPowerSeries`; `PadicFamilies:L5/totally-real-weight-algebra`.

**Sources.**

- [Residually reducible representations and modular forms](http://www.numdam.org/item/PMIHES_1999__89__5_0.pdf), §3.2, p. 32 (Numdam PDF page 29; printed page = PDF page + 3). The two definitions of T₂(U_a, 𝒪).
- [Residually reducible representations and modular forms](http://www.numdam.org/item/PMIHES_1999__89__5_0.pdf), §3.2, p. 33 (Numdam PDF page 30; printed page = PDF page + 3). The Jacquet–Langlands–Shimizu comparison used to pass to D.

### The stabiliser-weighted pairing and Hecke adjoints

**Target:** `OrdinaryAutomorphicFormsAndModularityLifting:R21.1/ordinary-hecke-adjoint-pairing` (construction).

For open compact U put Ū = U/(U ∩ F^×) and, for x ∈ G^D(A_f), c_U(x) = #{u ∈ Ū : xu = x} in D^×\G^D(A_f). For an 𝒪-algebra R in which every c_U(x) is invertible, ⟨f, g⟩_U = Σ_{x ∈ X(U)} c_U(x)^{−1} f(x)g(x) is a perfect R-bilinear pairing on H⁰(X(U), R), and f ↦ ⟨f, ·⟩_U is an isomorphism H⁰(X(U), R) ≅ Hom_R(H⁰(X(U), R), R) functorial in R. It satisfies ⟨[UgU]f, h⟩_U = ⟨f, [Ug^{−1}U]h⟩_U for g ∈ G^D(A_f), so every t ∈ T(U_a, 𝒪) has an adjoint t⁺, and t ↦ t⁺ is an 𝒪-algebra isomorphism T(U_a, 𝒪) ≅ T⁺(U_a, 𝒪). Writing H⁰(X(U_a), R)⁺ for H⁰ with t acting by t⁺, the pairing induces a perfect pairing of T₂(U_a, 𝒪)-modules eH⁰(X(U_a), R) × eH⁰(X(U_a), R)⁺ → R.

**Hypotheses and conventions.**

- Every c_U(x) invertible in R (automatic for R an 𝒪-algebra once a is large, R18.3).

**Uses.**

- `OrdinaryAutomorphicFormsAndModularityLifting:R21.1/ordinary-towers-duality`: M_∞ as the Pontryagin dual of H_∞.
- `OrdinaryAutomorphicFormsAndModularityLifting:R21.2/permissible-localisation-finite`: equal ranks of M_∞(U)_m and M⁺_∞(U)_m.

**API.**

- `TauCeti.OrdinaryModularity.stabiliserCount` (constructor): c_U(x) = #Stab_Ū(x).
- `TauCeti.OrdinaryModularity.quaternionicPairing` (constructor): ⟨f, g⟩_U = Σ c_U(x)^{−1} f(x)g(x).
- `TauCeti.OrdinaryModularity.quaternionicPairing_perfect` (characterisation): H⁰ ≅ Hom_R(H⁰, R) when all c_U(x) are units.
- `TauCeti.OrdinaryModularity.quaternionicPairing_hecke_adjoint` (characterisation): ⟨[UgU]f, h⟩ = ⟨f, [Ug^{−1}U]h⟩.
- `TauCeti.OrdinaryModularity.heckeAdjoint` (constructor): t ↦ t⁺, an isomorphism T(U_a, 𝒪) ≅ T⁺(U_a, 𝒪).
- `TauCeti.OrdinaryModularity.ordinaryPairing_perfect` (characterisation): eH⁰ × eH⁰⁺ → R is perfect.

**Unit tests.**

- **quaternionicPairing_free** (example): If Ū acts freely (all c_U(x) = 1), ⟨f, g⟩ = Σ f(x)g(x) and the Gram matrix in the basis of point indicators is the identity.
- **quaternionicPairing_one_point** (example): X(U) one point with stabiliser order c: ⟨f, g⟩ = c^{−1}fg, perfect iff c is a unit in R; over 𝒪 with p | c the pairing is not defined.
- **heckeAdjoint_central** (example): For central g = z ∈ A_f^×, [UzU] is translation by z and its adjoint is translation by z^{−1}.

**Construction or proof route.**

1. c_U(x) is the order of the finite stabiliser of x (D^× discrete, Ū compact modulo the centre).
2. Adjointness: expand both sides over the single cosets of UgU and Ug^{−1}U and change variables; the weights c_U account for the non-free points.
3. e⁺ is the adjoint idempotent; eH⁰ and (1 − e⁺)H⁰ are orthogonal, so the pairing restricts to a perfect pairing between eH⁰ and e⁺H⁰ = eH⁰(X(U_a), R)⁺.

**Checks.**

- The pairing is not Hecke-equivariant; only the twisted module H⁰(·)⁺ is paired.

**Direct prerequisites:** `OrdinaryAutomorphicFormsAndModularityLifting:R21.1/quaternionic-nearly-ordinary-hecke-algebra`; `HilbertModularVarietiesAndShimuraCurves:R18.3`.

**Sources.**

- [Residually reducible representations and modular forms](http://www.numdam.org/item/PMIHES_1999__89__5_0.pdf), §3.2, p. 34 (Numdam PDF page 31; printed page = PDF page + 3). The adjointness formula and the twisted module H⁰(X(U_a), R)⁺.

### Trace maps between levels

**Target:** `OrdinaryAutomorphicFormsAndModularityLifting:R21.1/ordinary-trace-compatibility` (lemma).

For V ⊆ U open compact and Ū = ⊔_i V̄x_i, tr(V, U) : H⁰(X(V), R) → H⁰(X(U), R), tr(V, U)f(x) = Σ_i f(x x_i^{−1}). For V = U_b, U = U_a (b ≥ a) it is independent of the coset representatives and commutes with t and t⁺ for t ∈ T₂(U_b, 𝒪) (acting on level U_a through the transition map), hence with e; and whenever both pairings are defined, ⟨f, tr(V, U)h⟩_U = ⟨f|_V, h⟩_V for f ∈ H⁰(X(U), R) and h ∈ H⁰(X(V), R): restriction and trace are adjoint.

**Hypotheses and conventions.**

- b ≥ a (U_b is normal in U_a, so the representatives can be chosen in U_a and the sum is well defined).

**API.**

- `TauCeti.OrdinaryModularity.traceAlong` (constructor): For a finite map π:Y→X and additive coefficients, traceAlong(π,g)(x)=∑_{π(y)=x}g(y). This is the unweighted finite-set shadow; the arithmetic trace also counts stabilizer multiplicities.
- `TauCeti.OrdinaryModularity.traceAlong_id` (simp): For π=id_X, traceAlong(π,g)=g.
- `TauCeti.OrdinaryModularity.sum_comp_mul_eq_sum_mul_traceAlong` (compatibility): For commutative semiring coefficients, ∑_y f(πy)g(y)=∑_x f(x)traceAlong(π,g)(x).

**Unit tests.**

- **trace_singleton_two_preimages** (example): If Y=Fin 2, X is a singleton and g=(2,3), the trace at the single point is 5; it is a sum, not an average.
- **trace_empty_fibre** (example): For π:Unit→Fin 2 with π(*)=0 and g(*)=7, the trace at 1 is 0.
- **trace_identity** (example): For π=id on a finite type, every fibre is a singleton and the trace is g.
- **trace_empty_source** (example): An empty source gives the zero function on every finite target.

**Construction or proof route.**

1. Independence: U_b is normal in U_a and f is right U_b-invariant.
2. Hecke compatibility: T₀(p), T₀(p_i), T(ℓ), S(ℓ) and G(U_b) commute with right translation by U_a/U_b.
3. Adjunction: split the sum over X(V) along the fibres of X(V) → X(U); the stabiliser weights match (c_V(y) sums to c_U(x)·#fibre).

**Checks.**

- The traces are the transition maps of M_∞; the pullbacks are those of H_∞.

**Direct prerequisites:** `OrdinaryAutomorphicFormsAndModularityLifting:R21.1/ordinary-hecke-adjoint-pairing`; `HilbertModularVarietiesAndShimuraCurves:R18.3`; `mathlib:Fintype.prod_fiberwise`.

**Sources.**

- [Residually reducible representations and modular forms](http://www.numdam.org/item/PMIHES_1999__89__5_0.pdf), §3.2, p. 35 (Numdam PDF page 32; printed page = PDF page + 3). The trace map tr(V, U) and its compatibilities.

### The ordinary part does not grow in Γ₀(p^a)-level

**Target:** `OrdinaryAutomorphicFormsAndModularityLifting:R21.1/ordinary-level-independence` (lemma).

For a ≥ 2, U⁰_a (1 0; 0 ϖ_p) U⁰_a = U⁰_a (1 0; 0 ϖ_p) U⁰_{a−1}; hence T₀(p) maps H⁰(X(U⁰_a), K/𝒪) into H⁰(X(U⁰_{a−1}), K/𝒪) and eH⁰(X(U⁰_a), K/𝒪) = eH⁰(X(U⁰_1), K/𝒪). Moreover H⁰(X(U⁰_a), K/𝒪) = H⁰(X(U_a), K/𝒪)^{G(U_a)}.

**Hypotheses and conventions.**

- a ≥ 2; U⁰_a = U ∩ U₀(p^a).

**Construction or proof route.**

1. U⁰_{a−1} = N⁻(p^{a−1})U⁰_a with N⁻(c) = {(1 0; x 1) : x ∈ c}, and g(1 0; x 1) = (1 0; ϖx 1)g for g = (1 0; 0 ϖ).
2. So gU⁰_{a−1} = N⁻(p^a)gU⁰_a ⊆ U⁰_a g U⁰_a, giving the double-coset identity and the level drop of T₀(p).
3. e is a limit of powers of T₀(p), so its image lies in level U⁰_{a−1}, and by induction in level U⁰_1.

**Checks.**

- The identity fails for a = 1 (U⁰_0 = U is not N⁻·U⁰_1).

**Direct prerequisites:** `OrdinaryAutomorphicFormsAndModularityLifting:R21.1/quaternionic-ordinary-projector`; `HilbertModularVarietiesAndShimuraCurves:R18.3`.

**Sources.**

- [Residually reducible representations and modular forms](http://www.numdam.org/item/PMIHES_1999__89__5_0.pdf), §3.2, proof of Proposition 3.3, p. 36 (Numdam PDF page 33; printed page = PDF page + 3). The level drop eH⁰(X(U⁰_a), K/𝒪) = eH⁰(X(U⁰_1), K/𝒪).

### Pontryagin duality for the ordinary quaternionic towers

**Target:** `OrdinaryAutomorphicFormsAndModularityLifting:R21.1/ordinary-towers-duality` (theorem).

Put H_∞(U) = lim→_a eH⁰(X(U_a), K/𝒪) and H⁺_∞(U) = lim→_a eH⁰(X(U_a), K/𝒪)⁺ along pullbacks, and M_∞(U) = lim←_a eH⁰(X(U_a), 𝒪)⁺, M⁺_∞(U) = lim←_a eH⁰(X(U_a), 𝒪) along the traces tr(U_b, U_a). These are T_∞(U, 𝒪)-modules, and since c_{U_a}(x) = 1 for all x once a is large, the pairings give T_∞(U, 𝒪)-isomorphisms M_∞(U) ≅ Hom_𝒪(H_∞(U), K/𝒪) and M⁺_∞(U) ≅ Hom_𝒪(H⁺_∞(U), K/𝒪).

**Hypotheses and conventions.**

- c_{U_a}(x) = 1 for all x ∈ X(U_a) for a large (R18.3 stabilisers).

**Uses.**

- `OrdinaryAutomorphicFormsAndModularityLifting:R21.2/permissible-localisation-finite`: freeness of M_∞(U)_m.
- `OrdinaryAutomorphicFormsAndModularityLifting:R21.2/auxiliary-level-freeness`: Δ_w-freeness and coinvariants.
- `PadicFamilies:L5`: Hida's freeness of M_∞(U) over Λ′_𝒪 (Skinner–Wiles Proposition 3.3).

**Construction or proof route.**

1. For large a the ordinary pairing identifies eH⁰(X(U_a), 𝒪)⁺ with Hom_𝒪(eH⁰(X(U_a), 𝒪), 𝒪), compatibly with trace and restriction (ordinary-trace-compatibility).
2. For L finite free, Hom_𝒪(L, 𝒪) ≅ Hom_𝒪(L ⊗ K/𝒪, K/𝒪), and eH⁰(X(U_a), K/𝒪) = eH⁰(X(U_a), 𝒪) ⊗ K/𝒪.
3. Hom_𝒪(−, K/𝒪) turns the colimit H_∞ into the limit, giving M_∞(U) ≅ Hom_𝒪(H_∞(U), K/𝒪); likewise for ⁺.

**Checks.**

- The duality is between M_∞ (twisted action) and H_∞ (untwisted); do not drop the ⁺.
- Skinner–Wiles write H⁺_∞(U_a) for the limit H⁺_∞(U) (E2).

**Direct prerequisites:** `OrdinaryAutomorphicFormsAndModularityLifting:R21.1/ordinary-hecke-adjoint-pairing`; `OrdinaryAutomorphicFormsAndModularityLifting:R21.1/ordinary-trace-compatibility`; `OrdinaryAutomorphicFormsAndModularityLifting:R21.1/quaternionic-nearly-ordinary-hecke-algebra`; `HilbertModularVarietiesAndShimuraCurves:R18.3`; `PadicFamilies:L5`.

**Sources.**

- [Residually reducible representations and modular forms](http://www.numdam.org/item/PMIHES_1999__89__5_0.pdf), §3.2, p. 35 (Numdam PDF page 32; printed page = PDF page + 3). The definitions of M_∞, M⁺_∞ and their identification with Pontryagin duals, just before Proposition 3.3.

## R21.2. Hida control and finite flatness

The imported Hilbert Hida theorem is used with its actual integral weight algebra and local characters. Permissible Eisenstein localization and the arithmetic weight-change application are the extra work here.

### Nearly ordinary automorphic representations

**Target:** `OrdinaryAutomorphicFormsAndModularityLifting:R21.2/nearly-ordinary-representations` (definition).

Let k = Σ_τ k_ττ with every k_τ ≥ 2, π ∈ Π_k(U_a) a cuspidal automorphic representation of GL₂(A_F) of weight k with V_π^{U_a} ≠ 0, and v | p with prime p_v. A line in V_{π,v}^{U_{a,v}} on which T₀(p_v) acts through an element of F̄ that is a unit in the ring of integers of Q̄_p is unique if it exists; it is called v-good. A v-good line exists iff π_v is a principal series π(η_v|·|_v^{−1/2}, ξ_v|·|_v^{−1/2}) or a special representation π(ξ_v|·|_v^{−1/2}, ξ_v|·|_v^{1/2}) with λ_v^{−v}ξ_v(λ_v^{−1}) a p-adic unit (λ_v the uniformiser used in T₀(p_v)). π is nearly ordinary if a v-good line exists for every v | p, and ordinary if moreover ξ_v is unramified for every v | p; a newform is (nearly) ordinary if its automorphic representation is. Π^{n.o.}_k(U_a) ⊆ Π_k(U_a) is the set of nearly ordinary π (Skinner–Wiles write Π^ord_k(U_a)).

**Hypotheses and conventions.**

- F totally real of any degree (the definition does not need the quaternion algebra); v = (v_τ) with m + 2v ∈ ℤt, m = k − 2t, as in Skinner–Wiles §3.1.

**Uses.**

- `OrdinaryAutomorphicFormsAndModularityLifting:R21.2/nearly-ordinary-hecke-algebra-comparison`: eV_π = v-good lines.
- `OrdinaryAutomorphicFormsAndModularityLifting:R21.2/eisenstein-ideal-existence`: the p-stabilised newform f₂ spans v-good lines.

**API.**

- `TauCeti.OrdinaryModularity.IsVGoodLine` (data): A T₀(p_v)-stable line with p-adic unit eigenvalue.
- `TauCeti.OrdinaryModularity.IsNearlyOrdinary` (data): A v-good line exists for every v | p.
- `TauCeti.OrdinaryModularity.IsOrdinary` (data): Nearly ordinary with ξ_v unramified for every v | p.
- `TauCeti.OrdinaryModularity.vGoodLine_unique` (characterisation): At most one v-good line.
- `TauCeti.OrdinaryModularity.isNearlyOrdinary_twist` (compatibility): Nearly ordinarity is preserved by twisting by finite characters.

**Unit tests.**

- **isOrdinary_X0_11** (example): F = ℚ, weight 2: the newform of X₀(11) has a₃ = −1, a unit, so it is ordinary at 3; a₂ = −2 is not a 2-adic unit, so it is not ordinary at 2.
- **isNearlyOrdinary_not_ordinary** (example): The twist of an ordinary π by a finite character ramified at v | p is nearly ordinary but not ordinary.
- **supercuspidal_not_nearlyOrdinary** (example): If π_v is supercuspidal, T₀(p_v) has no unit eigenvalue on V_{π,v}^{U_{a,v}}, so π is not nearly ordinary.
- **vGoodLine_unique_product** (example): Two unit eigenvalues cannot both occur: the product of the two T₀(p_v)-eigenvalues of a principal series has positive valuation for k_τ ≥ 2.

**Construction or proof route.**

1. Uniqueness and the criterion are Hida's classification of unit U_p-eigenlines ([H3, Corollary 2.2]) on the local newform theory of R16.6.

**Checks.**

- Keep 'nearly ordinary' (ξ_v arbitrary) and 'ordinary' (ξ_v unramified) apart: twisting by a character ramified at v | p preserves the first but not the second.

**Direct prerequisites:** `GL2AutomorphicRepresentationsAndTransfer:R16.6`; `mathlib:NumberField.IsTotallyReal`.

**Sources.**

- [Residually reducible representations and modular forms](http://www.numdam.org/item/PMIHES_1999__89__5_0.pdf), §3.2, p. 31 (Numdam PDF page 28; printed page = PDF page + 3). The v-good line and nearly ordinary representations.

### The two definitions of the nearly ordinary Hecke algebra

**Target:** `OrdinaryAutomorphicFormsAndModularityLifting:R21.2/nearly-ordinary-hecke-algebra-comparison` (comparison).

For parallel k and U_v = GL₂(𝒪_{F,v}) (v | p): let S*_k(U_a) be spanned by vectors w(π) = ⊗_v w(π, v) with w(π, v) spanning the v-good line, π ∈ Π^{n.o.}_k(U_a), and T_k(U_a) ⊆ End(S*_k(U_a)) the ℤ_p-algebra generated by the Hecke operators. Then T_k(U_a) is finite, flat, commutative and reduced, T_k(U_a) ↪ ∏_{π ∈ Π^{n.o.}_k(U_a)} Q̄_p, and T_k(U_a) ⊗ 𝒪 = eT*_k(U_a, 𝒪), since eV_π^{U_a} = 0 for π ∉ Π^{n.o.}_k(U_a) and eV_π^{U_a} = {⊗x_v : x_v spans a v-good line for every v | p} otherwise. For k = 2 this is T₂(U_a, 𝒪) of R21.1, and 𝒪-algebra maps λ : T_∞(U, 𝒪) → Q̄_p whose restrictions to Z(U) and to (𝒪_F ⊗ ℤ_p)^× have finite order factor through some T₂(U_a, 𝒪) and correspond to π ∈ ⋃_a Π^{n.o.}_2(U_a) with an eigenvector in the v-good lines.

**Hypotheses and conventions.**

- Parallel weight for the comparison with e; general weights through Hida's control (Skinner–Wiles Proposition 3.7, requested from PadicFamilies L5).

**Construction or proof route.**

1. e acts on V_π^{U_a} = ⊗_v V_{π,v}^{U_{a,v}} factor by factor at v | p; on each factor it is the projector onto the unit-eigenvalue line of T₀(p_v), which is the v-good line or 0.
2. Reducedness and the injection come from the semisimplicity of the Hecke action on S*_k with one-dimensional eigenspaces w(π).
3. A weight-two λ with finite-order restrictions factors through a finite level by the definition of T_∞ and corresponds to the unique π whose v-good vector has those eigenvalues.

**Checks.**

- The comparison is between the same classical newform on GL₂ and on D (through R21.1's Jacquet–Langlands step); the Galois family is compared in R21.3.

**Direct prerequisites:** `OrdinaryAutomorphicFormsAndModularityLifting:R21.2/nearly-ordinary-representations`; `OrdinaryAutomorphicFormsAndModularityLifting:R21.1/quaternionic-nearly-ordinary-hecke-algebra`; `OrdinaryAutomorphicFormsAndModularityLifting:R21.1/quaternionic-ordinary-projector`; `GL2AutomorphicRepresentationsAndTransfer:R16.6`; `PadicFamilies:L5`.

**Sources.**

- [Residually reducible representations and modular forms](http://www.numdam.org/item/PMIHES_1999__89__5_0.pdf), §3.2, p. 31 (Numdam PDF page 28; printed page = PDF page + 3). The first definition of T_k(U_a).
- [Residually reducible representations and modular forms](http://www.numdam.org/item/PMIHES_1999__89__5_0.pdf), §3.2, p. 32 (Numdam PDF page 29; printed page = PDF page + 3). Agreement of the two definitions.
- [Residually reducible representations and modular forms](http://www.numdam.org/item/PMIHES_1999__89__5_0.pdf), §3.2, p. 37 (Numdam PDF page 34; printed page = PDF page + 3). Weight-two arithmetic homomorphisms and nearly ordinary representations.

### Permissible (Eisenstein) maximal ideals

**Target:** `OrdinaryAutomorphicFormsAndModularityLifting:R21.2/permissible-maximal-ideal` (definition).

Let k be a finite field of characteristic p and χ : Gal(F̄/F) → k^× a character with χ|_{D_{v_i}} ≠ 1 for every v_i | p and χ(c_j) = −1 for every complex conjugation c_j; let 𝒪 have residue field k, χ̃ the Teichmüller lift and ω the Teichmüller character. A maximal ideal m of T_∞(U, 𝒪) is permissible if (3.9): m ∩ 𝒪[[G(U)]] is the maximal ideal of the character G(U) → Z(U) --χω^{−1}--> k; m contains T₀(p_i) − 1 for i = 1, …, t; and m contains T(ℓ) − 1 − χ̃(Frob_ℓ) for every ℓ ∤ p with U_ℓ = GL₂(𝒪_{F,ℓ}). The same conditions define permissible maximal ideals of T₂(U_a, 𝒪), and each determines one of T_∞(U, 𝒪).

**Hypotheses and conventions.**

- p odd; F of even degree (T_∞ is built from D); χ totally odd and p-distinguished (χ|_{D_v} ≠ 1 at every v | p).

**Uses.**

- `OrdinaryAutomorphicFormsAndModularityLifting:R21.2/eisenstein-ideal-existence`: existence from the p-adic L-function.
- `OrdinaryAutomorphicFormsAndModularityLifting:R21.2/permissible-localisation-finite`: the localisation T_∞(U, 𝒪)_m.
- `OrdinaryAutomorphicFormsAndModularityLifting:R21.3`: ρ̄_m ≅ χ ⊕ 1 and the pseudo-deformation of type (𝒪, Σ).

**API.**

- `TauCeti.OrdinaryModularity.IsPermissible` (data): The three conditions (3.9) on a maximal ideal of T_∞(U, 𝒪).
- `TauCeti.OrdinaryModularity.IsPermissible.ofLevel` (constructor): A permissible ideal of T₂(U_a, 𝒪) gives one of T_∞(U, 𝒪).
- `TauCeti.OrdinaryModularity.IsPermissible.T0_sub_one_mem` (characterisation): T₀(p_i) − 1 ∈ m.
- `TauCeti.OrdinaryModularity.IsPermissible.T_sub_mem` (characterisation): T(ℓ) − 1 − χ̃(Frob_ℓ) ∈ m.

**Unit tests.**

- **permissible_ramanujan_691** (example): Degree-one analogue (outside the even-degree hypothesis): p = 691, χ = ω^{11}; Ramanujan's congruence τ(ℓ) ≡ 1 + ℓ^{11} mod 691 is the weight-12 form of the condition T(ℓ) ≡ 1 + χ(Frob_ℓ).
- **permissible_distinguished_fails** (example): If χ|_{D_v} = 1 at some v | p (e.g. χ unramified with χ(Frob_v) = 1), χ ⊕ 1 is not p-distinguished and the definition is not made.
- **permissible_weight_two_twist** (example): The weight-two Eisenstein series E₂(1, ψ), ψ = χω^{−1}, has T(ℓ)-eigenvalue 1 + ψ(ℓ)Nm(ℓ) ≡ 1 + χ(Frob_ℓ) mod π, since Nm(ℓ) ≡ ω(Frob_ℓ); using ψ in place of χ in (3.9) would be wrong.

**Construction or proof route.**

1. Skinner–Wiles' first definition replaces the third condition by ρ̄_m ≅ χ ⊕ 1 for the residual pseudo-representation; the two agree by Chebotarev and Brauer–Nesbitt once R21.3 supplies ρ̄_m (p > 2).

**Checks.**

- Uniqueness of a permissible ideal and the value of S(ℓ) mod m use det ρ̄_m = χ; they are proved in R21.3/permissible-residual-comparison, not from (3.9) alone.

**Direct prerequisites:** `OrdinaryAutomorphicFormsAndModularityLifting:R21.1/quaternionic-nearly-ordinary-hecke-algebra`.

**Sources.**

- [Residually reducible representations and modular forms](http://www.numdam.org/item/PMIHES_1999__89__5_0.pdf), §3.2, p. 41 (Numdam PDF page 38; printed page = PDF page + 3). The first definition, with ρ̄_m ≅ χ ⊕ 1.
- [Residually reducible representations and modular forms](http://www.numdam.org/item/PMIHES_1999__89__5_0.pdf), §3.4, p. 46 (Numdam PDF page 43; printed page = PDF page + 3). The Hecke-theoretic definition (3.9).

### Existence of permissible maximal ideals

**Target:** `OrdinaryAutomorphicFormsAndModularityLifting:R21.2/eisenstein-ideal-existence` (theorem).

Let n be the prime-to-p part of the conductor of χω^{−1}; for ℓ | n let ℓ^{r(ℓ)} ∥ n and Δ_ℓ be the Sylow p-subgroup of (𝒪_F/ℓ^{r(ℓ)})^×. Let U^χ = ∏_ℓ U^χ_ℓ with U^χ_ℓ = {(a b; c d) ∈ GL₂(𝒪_{F,ℓ}) : c ∈ ℓ^{r(ℓ)}, a mod ℓ^{r(ℓ)} ∈ Δ_ℓ} for ℓ | n and GL₂(𝒪_{F,ℓ}) otherwise, and let L_p(F, s, χω) be the Deligne–Ribet p-adic L-function. If ord_π(L_p(F, −1, χω)) > 0, then some T₂(U^χ_a, 𝒪), and hence T_∞(U^χ, 𝒪), has a permissible maximal ideal.

**Hypotheses and conventions.**

- F of even degree; χ totally odd and p-distinguished, as in permissible-maximal-ideal.

**Construction or proof route.**

1. Put ψ = χω^{−1}. The Eisenstein series E_n(φ₁, φ₂) ∈ M_n(pn, ψ) with Dirichlet series L(F, s, φ₁)L(F, s − n + 1, φ₂) span a complement of S_n(n, ψ), and a_i(E_n(1, ψ), 0) = 2^{−d}L(F, 1 − n, ψ)Nm(t_i)^{n/2} (3.10) (AutomorphicPadicLFunctions L3).
2. With f = ord_p(ε(γ) − 1), choose n = 2 + p^f(p − 1)m so large that Chai's form g ∈ M_n(np, ψ) ∩ M_n(np, 𝒪) with a_i(g, 0) = 2^{−d}Nm(t_i)^{n/2} (3.11) exists; the p-adic L-function gives ord_π(L(F, 1 − n, ψ)) > 0, so E₀ = E_n(1, ψ) is integral and f₀ = L(F, 1 − n, ψ)g − E₀ has all constant terms 0.
3. E₁ = eE₀ is the eigenform with Dirichlet series ζ_F(s)L^{(p)}(s − n + 1, ψ); for its idempotent ε₀, the Eisenstein part of ε₀f₀ is a combination of E_n(λ, λ^{−1}ψ) with zero constant terms, hence 0 (Wiles [W3, Prop. 1.6]).
4. So F₁ = ε₀ef₀ is a cusp form with F₁ ≡ E₁ ≢ 0 mod π, giving an ordinary newform f₁ congruent to E₁ at the Dirichlet coefficients.
5. Wiles' Λ-adic forms ([W2, Theorem 1.4.1], PadicFamilies L5) give a weight-two p-stabilised newform f₂ ∈ S₂(np^a, ψ) with the same congruence; it spans v-good lines (nearly-ordinary-hecke-algebra-comparison), and its maximal ideal satisfies (3.9).
6. Local–global compatibility at ℓ | n ([W2, Theorem 2.1.3] or (3.3); AutomorphicGaloisRepresentations R19.4) puts π_{f₂} in Π^{n.o.}_2(U^χ_a).

**Checks.**

- The hypothesis is on the p-adic L-value at s = −1; the congruence is built in weight n ≡ 2 mod (p − 1)p^f and moved to weight 2 by Hida theory, not by a weight-two construction.
- The maximal ideal lives at level U^χ (Γ₀-type at n with Δ-reduced diagonal), not at U₁(n).

**Direct prerequisites:** `OrdinaryAutomorphicFormsAndModularityLifting:R21.2/permissible-maximal-ideal`; `OrdinaryAutomorphicFormsAndModularityLifting:R21.2/nearly-ordinary-hecke-algebra-comparison`; `OrdinaryAutomorphicFormsAndModularityLifting:R21.1/quaternionic-ordinary-projector`; `AutomorphicPadicLFunctions:L3`; `PadicFamilies:L5`; `AutomorphicGaloisRepresentations:R19.4`; `GL2AutomorphicRepresentationsAndTransfer:R16.6`.

**Sources.**

- [Residually reducible representations and modular forms](http://www.numdam.org/item/PMIHES_1999__89__5_0.pdf), §3.4, p. 46 (Numdam PDF page 43; printed page = PDF page + 3). Proposition 3.18 and its set-up.
- [Residually reducible representations and modular forms](http://www.numdam.org/item/PMIHES_1999__89__5_0.pdf), §3.4, proof of Proposition 3.18, p. 47 (Numdam PDF page 44; printed page = PDF page + 3). Chai's form with prescribed constant terms.
- [Residually reducible representations and modular forms](http://www.numdam.org/item/PMIHES_1999__89__5_0.pdf), §3.4, proof of Proposition 3.18, p. 48 (Numdam PDF page 45; printed page = PDF page + 3). The final level check at U^χ.

### The weight algebra at a permissible maximal ideal

**Target:** `OrdinaryAutomorphicFormsAndModularityLifting:R21.2/permissible-weight-algebra` (construction).

Let m be a permissible maximal ideal of T_∞(U, 𝒪) and γ_1, …, γ_{δ_F} ∈ Gal(F̄/F), r_1, …, r_{δ_F} as in Skinner–Wiles §2.5 (the γ_j generate a free summand G₀ of Gal(L₀/F) and the γ_j^{p^{r_j}} generate I₀, with images x_j ∈ Z(U)). Let D : Gal(F̄/F) → T_∞(U, 𝒪)_m^× be the continuous character given by the central action composed with reciprocity, times ε; so D(Frob_ℓ) = S(ℓ)Nm(ℓ) for ℓ ∤ np and D(x) = S_xε(x) on Z(U) (Skinner–Wiles' det ρ^mod_m). Then T_∞(U, 𝒪)_m is an algebra over Λ_𝒪 = 𝒪[[T_1, …, T_{δ_F}, Y^{(i)}_j]] via 1 + Y^{(i)}_j ↦ T_{y^{(i)}_j} and 1 + T_j ↦ D(γ_j), and the map Λ′_𝒪 → Λ_𝒪, 1 + X_j ↦ (1 + T_j)^{p^{r_j}}ε(γ_j^{−p^{r_j}}), Y ↦ Y, is compatible with the Λ′_𝒪-structure of R21.1 and makes Λ_𝒪 a free Λ′_𝒪-module of rank p^{Σ_j r_j}.

**Hypotheses and conventions.**

- m permissible; the choices of γ_j, r_j and y^{(i)}_j of Skinner–Wiles §2.5.

**Uses.**

- `OrdinaryAutomorphicFormsAndModularityLifting:R21.2/permissible-localisation-finite`: Lemma 3.10 over Λ_𝒪.
- `OrdinaryAutomorphicFormsAndModularityLifting:R21.3`: the Λ_𝒪-algebra structure of the pseudo-deformation rings (Skinner–Wiles §2.5).

**API.**

- `TauCeti.OrdinaryModularity.centralDeterminant` (constructor): D : Gal(F̄/F) → T_∞(U, 𝒪)_m^×.
- `TauCeti.OrdinaryModularity.centralDeterminant_frob` (characterisation): D(Frob_ℓ) = S(ℓ)Nm(ℓ) for ℓ ∤ np.
- `TauCeti.OrdinaryModularity.permissibleLambdaAlgebra` (constructor): The Λ_𝒪-algebra structure on T_∞(U, 𝒪)_m.
- `TauCeti.OrdinaryModularity.lambdaPrimeToLambda_free` (characterisation): Λ_𝒪 is free of rank p^{Σ r_j} over Λ′_𝒪.

**Unit tests.**

- **lambdaPrimeToLambda_rank_one_variable** (example): δ_F = 1, r_1 = 1: 𝒪[[T]] over 𝒪[[X]] with 1 + X ↦ u(1 + T)^p has basis 1, T, …, T^{p−1}, rank p (not r_1 = 1).
- **lambdaPrimeToLambda_r_zero** (example): If every r_j = 0, Λ′_𝒪 → Λ_𝒪 is an isomorphism.
- **centralDeterminant_on_Z** (example): On x ∈ Z(U), D(x) = S_xε(x), recovering the X-structure of R21.1.

**Construction or proof route.**

1. The centre A_f^× acts on H⁰(X(U_a), 𝒪) through the finite group A_f^×/F^×(U_a ∩ A_f^×); with class field theory and ε this gives D, continuous in the limit over a; at Frob_ℓ it is translation by ϖ_ℓ times Nm(ℓ).
2. Compatibility: D(γ_j^{p^{r_j}}) = D(x_j) = S_{x_j}ε(x_j), i.e. S_{x_j} = (1 + T_j)^{p^{r_j}}ε(γ_j^{−p^{r_j}}).
3. Freeness: ε(γ_j^{−p^{r_j}}) ∈ 1 + pℤ_p, so u(1 + T)^{p^r} − 1 is a unit times a distinguished polynomial of degree p^r; Weierstrass division gives the basis T^i, 0 ≤ i < p^r, in each variable.

**Checks.**

- The rank is p^{Σ r_j}; Skinner–Wiles print Σ r_j (E1). Only freeness and finiteness are used.

**Direct prerequisites:** `OrdinaryAutomorphicFormsAndModularityLifting:R21.2/permissible-maximal-ideal`; `OrdinaryAutomorphicFormsAndModularityLifting:R21.1/quaternionic-nearly-ordinary-hecke-algebra`; `mathlib:MvPowerSeries`; `mathlib:Module.Free`.

**Sources.**

- [Residually reducible representations and modular forms](http://www.numdam.org/item/PMIHES_1999__89__5_0.pdf), §3.2, p. 41 (Numdam PDF page 38; printed page = PDF page + 3). The Λ_𝒪-structure at a permissible m and the map Λ′_𝒪 → Λ_𝒪, just before Lemma 3.10.

### Finiteness and freeness at a permissible maximal ideal

**Target:** `OrdinaryAutomorphicFormsAndModularityLifting:R21.2/permissible-localisation-finite` (theorem).

If m is a permissible maximal ideal of T_∞(U, 𝒪), then (i) T_∞(U, 𝒪)_m is a torsion-free finite Λ_𝒪-algebra; (ii) if every element of U/(U ∩ F^×) acts on D^×\G^D(A_f) without fixed points, M_∞(U)_m and M⁺_∞(U)_m are free Λ_𝒪-modules of equal rank.

**Hypotheses and conventions.**

- m permissible; for (ii) the fixed-point-free hypothesis of Skinner–Wiles Proposition 3.3.

**Construction or proof route.**

1. T_∞(U, 𝒪) is finite and torsion-free over Λ′_𝒪 and semilocal complete (Skinner–Wiles Corollary 3.4, from PadicFamilies L5), so T_∞(U, 𝒪)_m is a direct factor, finite over Λ′_𝒪 and hence over Λ_𝒪.
2. Torsion-freeness over Λ_𝒪: if λt = 0 with 0 ≠ λ ∈ Λ_𝒪, the norm N(λ) ∈ Λ′_𝒪 is nonzero and kills t.
3. M_∞(U) is free over Λ′_𝒪 (Proposition 3.3, PadicFamilies L5); M_∞(U)_m is a direct summand, so free over Λ′_𝒪; a finite Λ_𝒪-module free over Λ′_𝒪 has depth dim Λ_𝒪, so it is free over the regular local ring Λ_𝒪 (Auslander–Buchsbaum).
4. Equal ranks: the ordinary pairing makes the m-parts of eH⁰(X(U_a), 𝒪) and eH⁰(X(U_a), 𝒪)⁺ mutually 𝒪-dual.

**Checks.**

- T_∞(U, 𝒪)_m is only torsion-free and finite over Λ_𝒪; flatness is not asserted. Freeness is proved for M_∞(U)_m and M⁺_∞(U)_m under the fixed-point-free hypothesis.

**Direct prerequisites:** `OrdinaryAutomorphicFormsAndModularityLifting:R21.2/permissible-weight-algebra`; `OrdinaryAutomorphicFormsAndModularityLifting:R21.1/ordinary-towers-duality`; `OrdinaryAutomorphicFormsAndModularityLifting:R21.1/ordinary-hecke-adjoint-pairing`; `PadicFamilies:L5`; `mathlib:Module.Free`; `mathlib:Module.Finite`; `mathlib:IsLocalRing`.

**Sources.**

- [Residually reducible representations and modular forms](http://www.numdam.org/item/PMIHES_1999__89__5_0.pdf), §3.2, Lemma 3.10, p. 41 (Numdam PDF page 38; printed page = PDF page + 3). Lemma 3.10.

### Freeness over an auxiliary Δ_w-group

**Target:** `OrdinaryAutomorphicFormsAndModularityLifting:R21.2/auxiliary-level-freeness` (theorem).

Let w ∤ p be a place with U_w = GL₂(𝒪_{F,w}), Δ_w the Sylow p-subgroup of (𝒪_F/ℓ_w)^× and Δ′_w a complement; U′_w = {(a b; c d) ∈ GL₂(𝒪_{F,w}) : c ∈ ℓ_w}, U″_w = {(a b; c d) ∈ U′_w : ad^{−1} mod ℓ_w ∈ Δ′_w}, U′ = U′_w∏_{v≠w}U_v and U″ = U″_w∏_{v≠w}U_v. Then U′_a/U″_a ≅ Δ_w via (a b; c d) ↦ the image of (ad^{−1})_w (3.12); Δ_w acts on H⁰(X(U″_a), R) commuting with G(U″_a), T₀(p_i), T(ℓ) and S(ℓ) (ℓ ∤ pw), compatibly in a, and H⁰(X(U″_a), R)^{Δ_w} = H⁰(X(U′_a), R) (3.13). If every element of U′/(F^× ∩ U′) acts on D^×\G^D(A_f) without fixed points, then (i) M_∞(U″) and M⁺_∞(U″) are free Λ′_𝒪[[Δ_w]]-modules, and (ii) M_∞(U″)_{Δ_w} = M_∞(U′) and M⁺_∞(U″)_{Δ_w} = M⁺_∞(U′).

**Hypotheses and conventions.**

- w ∤ p with U_w maximal; the fixed-point-free hypothesis is at level U′.

**Construction or proof route.**

1. (3.12) and (3.13) are statements about the quaternionic sets and their change of level (R18.3).
2. #H⁰(X(U″_a), 𝒪/πⁿ)_{Δ_w} = #H⁰(X(U″_a), 𝒪/πⁿ)^{Δ_w} = #H⁰(X(U′_a), 𝒪/πⁿ), and the hypothesis gives #X(U″_a) = #Δ_w·#X(U′_a).
3. So H⁰(X(U″_a), 𝒪/πⁿ) is free over the local ring 𝒪/πⁿ[Δ_w]: its minimal number of generators is #X(U′_a) and its order is #(𝒪/πⁿ[Δ_w])^{#X(U′_a)}.
4. Pass to ordinary parts (e commutes with Δ_w) and to the limit with Proposition 3.3 (PadicFamilies L5).

**Checks.**

- Freeness over the auxiliary group Δ_w and finite flatness over weight space are separate statements; this one needs the fixed-point-free hypothesis at level U′.

**Direct prerequisites:** `OrdinaryAutomorphicFormsAndModularityLifting:R21.1/ordinary-towers-duality`; `OrdinaryAutomorphicFormsAndModularityLifting:R21.1/quaternionic-ordinary-projector`; `HilbertModularVarietiesAndShimuraCurves:R18.3`; `PadicFamilies:L5`; `mathlib:Module.Free`; `mathlib:IsLocalRing`.

**Sources.**

- [Residually reducible representations and modular forms](http://www.numdam.org/item/PMIHES_1999__89__5_0.pdf), §3.5, Lemma 3.19, p. 49 (Numdam PDF page 46; printed page = PDF page + 3). Lemma 3.19 and (3.12)–(3.13).
- [Residually reducible representations and modular forms](http://www.numdam.org/item/PMIHES_1999__89__5_0.pdf), §3.5, proof of Lemma 3.19, p. 50 (Numdam PDF page 47; printed page = PDF page + 3). The counting argument.

### Characteristic-p primes at auxiliary level come from level U′

**Target:** `OrdinaryAutomorphicFormsAndModularityLifting:R21.2/characteristic-p-primes-auxiliary` (theorem).

(Proposition 3.20.) With w, U′, U″ as in auxiliary-level-freeness (no hypothesis on U′/(U′ ∩ F^×)), let 𝔭 ⊆ T_∞(U″, 𝒪) be a prime with p ∈ 𝔭, det ρ_𝔭 = χ, ρ_𝔭|_{D_v} ≅ (ψ_1 *; 0 ψ_2) with (ψ_1/ψ_2)|_{I_v} of infinite order for some v | p, and ρ_𝔭 irreducible but not dihedral. Then 𝔭 is the inverse image of a prime of T_∞(U′, 𝒪).

**Hypotheses and conventions.**

- F of even degree; ρ_𝔭 is the representation over the residue field of 𝔭 (R21.3/hida-family-representation).

**Construction or proof route.**

1. Choose σ ∈ I_w with ω(σ) = 1, det ρ_𝔭(σ) = 1 and ρ_𝔭(σ) of infinite order, and (non-dihedral) τ with ω(τ) ≠ 1 and ρ_𝔭(σ^{n_0}τ) of infinite order; Chebotarev gives ℓ ∤ 6 unramified with Frob_ℓ close to σ^{n_0}τ.
2. At V′ = U′ ∩ U(ℓ), V″ = U″ ∩ U(ℓ) the action is free (R18.3), so M_∞(V″) is free over Λ′_𝒪[[Δ_w]] and M_∞(V″)_{Δ_w} = M_∞(V′) (auxiliary-level-freeness); since 𝔭 ⊇ (δ − 1 : δ ∈ Δ_w) in the ring T generated by Δ_w and T_∞(V″, 𝒪), T_∞(V″)/𝔭 = T_∞(V′)/im 𝔭.
3. The minimal prime Q ⊆ 𝔭_2 of T_∞(V′) is unramified at ℓ (types A and C are excluded by the choice of ℓ), so it comes from T_∞(U′) by level-type-control.

**Checks.**

- No freeness hypothesis at level U′ is needed: the auxiliary prime ℓ supplies it.

**Direct prerequisites:** `OrdinaryAutomorphicFormsAndModularityLifting:R21.2/auxiliary-level-freeness`; `OrdinaryAutomorphicFormsAndModularityLifting:R21.3/hida-family-representation`; `OrdinaryAutomorphicFormsAndModularityLifting:R21.3/ramification-types`; `OrdinaryAutomorphicFormsAndModularityLifting:R21.3/level-type-control`; `HilbertModularVarietiesAndShimuraCurves:R18.3`.

**Sources.**

- [Residually reducible representations and modular forms](http://www.numdam.org/item/PMIHES_1999__89__5_0.pdf), §3.5, Proposition 3.20, p. 50 (Numdam PDF page 47; printed page = PDF page + 3). Proposition 3.20.
- [Residually reducible representations and modular forms](http://www.numdam.org/item/PMIHES_1999__89__5_0.pdf), §3.5, proof of Proposition 3.20, p. 51 (Numdam PDF page 48; printed page = PDF page + 3). The end of the proof.

### The trace at tame inertia acts through δ_w + δ_w^{−1}

**Target:** `OrdinaryAutomorphicFormsAndModularityLifting:R21.2/auxiliary-trace-identity` (lemma).

(Lemma 3.21, Remark 3.22.) Assume T_∞(U, 𝒪) has a permissible maximal ideal m and χ(Frob_w) = 1 = ω(Frob_w). Let σ_w ∈ I_w generate the p-part of tame inertia, identified with an element of 𝒪_{F,w}^× by local reciprocity; δ_w = (σ_w 0; 0 1) generates Δ_w through (3.12). Then trace ρ^mod(σ_w) ∈ T_∞(U″, 𝒪)_m acts on M_∞(U″)_m as δ_w + δ_w^{−1}; so δ_w + δ_w^{−1} lies in T_∞(U″, 𝒪)_m, compatibly with change of U.

**Hypotheses and conventions.**

- χ(Frob_w) = 1 = ω(Frob_w).

**Construction or proof route.**

1. On a T_∞(U″)-eigenspace V ⊆ eH⁰(X(U″_a), 𝒪)_m ⊗ Q̄_p, π_w is not supercuspidal (that would force type C and χ(Frob_w) = −1).
2. If π_w is special, μ_1 is unramified and δ_w acts by 1; if principal series π(μ_1, μ_2) with μ_1μ_2 unramified, δ_w acts by μ_1(σ_w) or μ_1^{−1}(σ_w).
3. By (3.3), ρ_P(σ_w) = (μ_1(σ_w) *; 0 μ_1^{−1}(σ_w)), so trace ρ_P(σ_w) = δ_w + δ_w^{−1} on V.

**Checks.**

- The identity is on M_∞(U″)_m, where both T_∞(U″)_m and Δ_w act.

**Direct prerequisites:** `OrdinaryAutomorphicFormsAndModularityLifting:R21.2/auxiliary-level-freeness`; `OrdinaryAutomorphicFormsAndModularityLifting:R21.3/hecke-pseudo-representation`; `GL2AutomorphicRepresentationsAndTransfer:R17.3`; `AutomorphicGaloisRepresentations:R19.4`.

**Sources.**

- [Residually reducible representations and modular forms](http://www.numdam.org/item/PMIHES_1999__89__5_0.pdf), §3.5, Lemma 3.21, p. 51 (Numdam PDF page 48; printed page = PDF page + 3). Lemma 3.21 and Remark 3.22.

### The Hecke rings T_{𝒟_Q}, T^min_{𝒟_Q} and modules M_{𝒟_Q}

**Target:** `OrdinaryAutomorphicFormsAndModularityLifting:R21.2/deformation-hecke-rings` (construction).

Assume L_p(F, −1, χω) is integral but not a unit, so permissible ideals exist (eisenstein-ideal-existence). For an augmented datum 𝒟_Q = (𝒪, Σ, c, ℳ)_Q with r(w) given by ℓ_w^{r(w)} ∥ cond(χ_w^{−1}), put U_{𝒟_Q} = ∏_w U_{𝒟_Q,w} with U_{𝒟_Q,w} = GL₂(𝒪_{F,w}) for w ∉ (Σ∖𝒫) ∪ Q; {c, a − 1 ∈ ℓ_w^{max(2, r(w)+1)}} for w ∈ Σ∖(𝒫 ∪ ℳ); {c ∈ ℓ_w^{max(1, r(w))}, a mod ℓ_w^{max(1, r(w))} ∈ Δ_w} for w ∈ ℳ; {c ∈ ℓ_w, ad^{−1} mod ℓ_w ∈ Δ′_w} for w ∈ Q. Then T_{𝒟_Q} = T_∞(U_{𝒟_Q}, 𝒪)_m with the pseudo-deformation ρ^mod_{𝒟_Q} of type 𝒟^ps_Q and surjections π_𝒟 : R_{𝒟^ps} ↠ T_𝒟, π_{𝒟_Q} : R_{𝒟^ps_Q} ↠ T_{𝒟_Q}; T^min_{𝒟_Q} = T_{𝒟_Q}/∩_{q ∈ ℳ^min(𝒟_Q)} q, where ℳ^min(𝒟_Q) (nonempty) is the set of minimal primes q with (χ̃^{−1}det ρ_q)|_{N_Σ} trivial; M_{𝒟_Q} = M_∞(U^min_{𝒟_Q})_m for the level U^min_{𝒟_Q} of Skinner–Wiles p. 55; π^min_𝒟 : R_{𝒟^ps} → T^min_𝒟.

**Hypotheses and conventions.**

- F of even degree; L_p(F, −1, χω) integral and not a unit.

**Uses.**

- `OrdinaryAutomorphicFormsAndModularityLifting:R21.4/pro-modular-prime`: π_𝒟 : R_{𝒟^ps} ↠ T_𝒟.
- `OrdinaryAutomorphicFormsAndModularityLifting:R21.5`: the patching modules M_{𝒟_Q} (Skinner–Wiles §5).

**API.**

- `TauCeti.OrdinaryModularity.deformationLevel` (constructor): U_{𝒟_Q} ⊆ GL₂(𝒪_F ⊗ Ẑ).
- `TauCeti.OrdinaryModularity.deformationHeckeRing` (constructor): T_{𝒟_Q} = T_∞(U_{𝒟_Q}, 𝒪)_m.
- `TauCeti.OrdinaryModularity.pseudoToDeformationHecke` (constructor): π_{𝒟_Q} : R_{𝒟^ps_Q} ↠ T_{𝒟_Q}.
- `TauCeti.OrdinaryModularity.minimalHeckeRing` (constructor): T^min_{𝒟_Q}.
- `TauCeti.OrdinaryModularity.minimalPrimes_nonempty` (characterisation): ℳ^min(𝒟_Q) ≠ ∅.
- `TauCeti.OrdinaryModularity.deformationHeckeModule` (constructor): M_{𝒟_Q} = M_∞(U^min_{𝒟_Q})_m.

**Unit tests.**

- **deformationLevel_unramified** (example): For w ∉ (Σ∖𝒫) ∪ Q the level is maximal, so T(ℓ_w) and S(ℓ_w) are available.
- **deformationLevel_Q** (example): At w ∈ Q the level is U″_w of Lemma 3.19, so Δ_w acts on M_{𝒟_Q}.
- **minimalHeckeRing_twist** (example): Twisting by Φ with Φ² = Θ moves any minimal prime into ℳ^min.

**Construction or proof route.**

1. ρ^mod_{𝒟_Q} is of type 𝒟^ps_Q because of the level at Q (det unramified there) and Σ.
2. ℳ^min ≠ ∅: write det ρ^mod = Θ·Ψ·χ̃ with Ψ trivial on N_𝒟 and Θ trivial on the free part M_𝒟, choose Φ² = Θ, and use Lemma 3.17 to twist any q to q_Φ with ρ_{q_Φ} ≅ ρ_q ⊗ Φ^{−1}, which is minimal.

**Checks.**

- χ̃^{−1}det ρ_q (not det ρ_q) is the character restricted to N_Σ.
- The levels depend on the datum through r(w), Q and ℳ; M_{𝒟_Q} uses the auxiliary level U^min, not U_{𝒟_Q}.

**Direct prerequisites:** `OrdinaryAutomorphicFormsAndModularityLifting:R21.2/eisenstein-ideal-existence`; `OrdinaryAutomorphicFormsAndModularityLifting:R21.3/hecke-pseudo-representation`; `OrdinaryAutomorphicFormsAndModularityLifting:R21.3/hecke-generation`; `OrdinaryAutomorphicFormsAndModularityLifting:R21.3/family-twisting`; `OrdinaryAutomorphicFormsAndModularityLifting:R21.3/deformation-of-type`.

**Sources.**

- [Residually reducible representations and modular forms](http://www.numdam.org/item/PMIHES_1999__89__5_0.pdf), §3.6, p. 52 (Numdam PDF page 49; printed page = PDF page + 3). §3.6: U_{𝒟_Q}, T_{𝒟_Q}, T^min.

### T_{𝒟_Q} ≅ T^min_{𝒟_Q} ⊗ 𝒪[N_𝒟]

**Target:** `OrdinaryAutomorphicFormsAndModularityLifting:R21.2/minimal-hecke-ring-decomposition` (theorem).

(Proposition 3.23, Corollary 3.24, Lemma 3.25.) The splitting field L_Θ of Θ has Gal(L_Θ/F) ≅ N_𝒟, and there is an isomorphism of Λ_𝒪-algebras T^min_{𝒟_Q} ⊗_𝒪 𝒪[N_𝒟] ≅ T_{𝒟_Q} with T(ℓ) ⊗ n ↦ T(ℓ)·Φ(Frob_ℓ^{−1}·n) and S(ℓ) ⊗ n ↦ S(ℓ)·Θ(Frob_ℓ^{−1}·n). Hence T^min_{𝒟_Q} is a finite, torsion-free Λ_𝒪-algebra, and δ_w + δ_w^{−1} ∈ T^min_{𝒟_Q} maps to δ_w + δ_w^{−1} ∈ T_{𝒟_Q}.

**Construction or proof route.**

1. Gal(L_Θ/F) ≅ N_𝒟: for a character ξ of N_𝒟, Lemma 3.17 gives P_ξ with ρ_{P_ξ} ≅ ρ_P ⊗ ξ, so ξ² = Θ mod P_ξ; as ξ² ranges over all characters (odd order), Θ|_{N_𝒟} is injective.
2. For q ∈ ℳ^min and ξ ∈ X(𝒟), Lemma 3.17 gives τ(q, ξ) : T_{𝒟_Q} → R(q, ξ) (3.14) and φ(q, ξ) : T^min ⊗ 𝒪[N_𝒟] → R(q, ξ) (3.15); ℳ′ = {q_ξ} = ℳ(𝒟_Q).
3. τ = ∏τ(q, ξ) and φ = ∏φ(q, ξ) have the same image, which gives the isomorphism.

**Checks.**

- The twist is by Φ (a square root of Θ) on T(ℓ) and by Θ on S(ℓ).

**Direct prerequisites:** `OrdinaryAutomorphicFormsAndModularityLifting:R21.2/deformation-hecke-rings`; `OrdinaryAutomorphicFormsAndModularityLifting:R21.3/family-twisting`; `OrdinaryAutomorphicFormsAndModularityLifting:R21.2/auxiliary-trace-identity`; `OrdinaryAutomorphicFormsAndModularityLifting:R21.2/permissible-localisation-finite`.

**Sources.**

- [Residually reducible representations and modular forms](http://www.numdam.org/item/PMIHES_1999__89__5_0.pdf), §3.6, p. 54 (Numdam PDF page 51; printed page = PDF page + 3). Gal(L_Θ/F) ≅ N_𝒟, (3.14)–(3.15).
- [Residually reducible representations and modular forms](http://www.numdam.org/item/PMIHES_1999__89__5_0.pdf), §3.6, Proposition 3.23, p. 55 (Numdam PDF page 52; printed page = PDF page + 3). Proposition 3.23, Corollary 3.24, Lemma 3.25 and M_{𝒟_Q}.

### Duality between M_∞ and M⁺_∞ over Λ

**Target:** `OrdinaryAutomorphicFormsAndModularityLifting:R21.2/hecke-module-duality` (theorem).

(§3.7.) If U/(U ∩ F^×) acts freely on D^×\G^D(A_f): for each a, Hom_{𝒪[[G(U)]]}(M⁺_∞(U), 𝒪[[G(U_a)]]) = Hom_𝒪(eH⁰(X(U_a), 𝒪), 𝒪) = eH⁰(X(U_a), 𝒪)⁺ (λ_a, via the trace 𝒪[[G(U_a)]] → 𝒪 and the pairing), compatibly with tr(U_b, U_a); hence λ_∞ : Hom_{𝒪[[G(U)]]}(M⁺_∞(U), 𝒪[[G(U)]]) ≅ M_∞(U) and β_∞(U) : Hom_{Λ′_𝒪}(M⁺_∞(U), Λ′_𝒪) ≅ M_∞(U), natural for maps compatible with G(U) → G(V). At a prime 𝔭 of T_∞(U, 𝒪) with P = Λ′_𝒪 ∩ 𝔭, M̂_∞(U)_𝔭 ≅ Hom_{Λ̂′_P}(M̂⁺_∞(U)_𝔭, Λ̂′_P) (3.16); at a permissible m, M_∞(U)_m ≅ Hom_{Λ_𝒪}(M⁺_∞(U)_m, Λ_𝒪) (3.17).

**Hypotheses and conventions.**

- Free action of U/(U ∩ F^×) on D^×\G^D(A_f).

**Construction or proof route.**

1. λ_a: under free action M⁺_∞(U) ⊗_{𝒪[[G(U)]]} 𝒪[G(U_a)] = eH⁰(X(U_a), 𝒪); Frobenius reciprocity for the finite group G(U_a) identifies Hom_{𝒪[G]}(M, 𝒪[G]) with Hom_𝒪(M, 𝒪) through the coefficient of the identity; the pairing does the rest (R21.1).
2. 𝒪[[G(U)]] = Λ′_𝒪[Z_0] with Z_0 finite, and Hom over Λ′_𝒪 and over 𝒪[[G(U)]] agree through the trace (again Frobenius reciprocity), giving β_∞.
3. (3.17): M_∞(U)_m, M⁺_∞(U)_m are free over Λ_𝒪 (Lemma 3.10) and Λ_𝒪 is free over Λ′_𝒪, so the trace Λ_𝒪 → Λ′_𝒪 identifies the two Hom's.

**Checks.**

- Skinner–Wiles open §3.7 by quoting Proposition 3.3 for freeness over 𝒪[[G(U)]]; that rank statement is not justified (PadicFamilies E11), but the identifications above use only Frobenius reciprocity and Λ′_𝒪-freeness.

**Direct prerequisites:** `OrdinaryAutomorphicFormsAndModularityLifting:R21.1/ordinary-towers-duality`; `OrdinaryAutomorphicFormsAndModularityLifting:R21.1/ordinary-hecke-adjoint-pairing`; `OrdinaryAutomorphicFormsAndModularityLifting:R21.1/ordinary-trace-compatibility`; `OrdinaryAutomorphicFormsAndModularityLifting:R21.2/permissible-localisation-finite`; `PadicFamilies:L5/hida-freeness`.

**Sources.**

- [Residually reducible representations and modular forms](http://www.numdam.org/item/PMIHES_1999__89__5_0.pdf), §3.7, p. 56 (Numdam PDF page 53; printed page = PDF page + 3). λ_a, λ_∞, β_∞.
- [Residually reducible representations and modular forms](http://www.numdam.org/item/PMIHES_1999__89__5_0.pdf), §3.7, (3.17), p. 57 (Numdam PDF page 54; printed page = PDF page + 3). (3.16)–(3.17).

### Ihara's lemma for definite quaternionic forms

**Target:** `OrdinaryAutomorphicFormsAndModularityLifting:R21.2/ihara-lemma-quaternionic` (theorem).

(Lemma 3.26.) Let U = ∏U_w with U_0(𝔫) ⊇ U ⊇ U(𝔫), w ∤ p with U_w = GL₂(𝒪_{F,w}), ℓ = ℓ_w, λ = λ^{(ℓ)}, V = U ∩ U_0(ℓ), (αf)(g) = f(g(1 0; 0 λ)) and ξ_1 : H⁰(X(U), R)² → H⁰(X(V), R), (f, g) ↦ f + αg (R an 𝒪-module). Then ker ξ_1 is annihilated by [U(1 0; 0 λ^{(q)})U] − 1 − Nm(q) for every prime q of F splitting completely in the ray class field of conductor 𝔫·∞.

**Hypotheses and conventions.**

- q splits completely in the ray class field of conductor 𝔫∞.

**Construction or proof route.**

1. For (f_1, f_2) ∈ ker ξ_1, f_1(gu) = f_1(g) for u ∈ δ^{−1}GL₂(𝒪_{F,w})δ, δ = diag(1, λ^{−1}); as SL₂(𝒪_{F,w}) and its δ-conjugate generate SL₂(F_w), f_1(gu) = f_1(g) for u ∈ U·SL₂(F_w) (3.18) (Diamond–Taylor, Lemma 2, generalised).
2. q has a totally positive generator π ≡ 1 mod 𝔫; by Eichler's norm theorem there is δ_0 ∈ D^× with ν_D(δ_0) = π, and strong approximation for the norm-one group G^D_1 (with G^D_1(F_w) = SL₂(F_w)) gives f_1(gγ) = f_1(g) for ν_D(γ) = π^{−1} (3.19) (both requested from R18.3).
3. U(1 0; 0 λ^{(q)})U is a union of Nm(q) + 1 cosets Ug_i with ν_D(g_i) = π, so the operator acts on f_1 by 1 + Nm(q).

**Checks.**

- This is the Ihara-type statement at a place w ∤ p for definite quaternion algebras; the annihilator is Eisenstein-type.

**Direct prerequisites:** `HilbertModularVarietiesAndShimuraCurves:R18.3`; `mathlib:QuaternionAlgebra`.

**Sources.**

- [Residually reducible representations and modular forms](http://www.numdam.org/item/PMIHES_1999__89__5_0.pdf), §3.8, Lemma 3.26, p. 57 (Numdam PDF page 54; printed page = PDF page + 3). Lemma 3.26 (the text layer reads 'lhara').
- [Residually reducible representations and modular forms](http://www.numdam.org/item/PMIHES_1999__89__5_0.pdf), §3.8, proof of Lemma 3.26, p. 58 (Numdam PDF page 55; printed page = PDF page + 3). The proof.

### Exactness at deeper Γ₁(ℓ^r)-level and the three-copy Ihara lemma

**Target:** `OrdinaryAutomorphicFormsAndModularityLifting:R21.2/ihara-exact-sequence` (lemma).

(Lemmas 3.27–3.28.) With U^{(r)} = U ∩ U_1(ℓ^r), for r ≥ 1 the sequence H⁰(X(U^{(r−1)}), R) --δ--> H⁰(X(U^{(r)}), R)² --γ--> H⁰(X(U^{(r+1)}), R), δ(f) = (f, −αf), γ(f_1, f_2) = αf_1 + f_2, is exact; and the kernel of ξ : H⁰(X(U), R)³ → H⁰(X(U^{(2)}), R), ξ(f_1, f_2, f_3) = f_1 + αf_2 + α²f_3, is annihilated by [U(1 0; 0 λ^{(r)})U] − 1 − Nm(r) for every prime r splitting completely in the ray class field of conductor 𝔫∞.

**Hypotheses and conventions.**

- r ≥ 1.

**Construction or proof route.**

1. Lemma 3.27: if αf_1 = −f_2 then f_1 = −α^{−1}f_2 is invariant under U′ = {a − 1 ∈ ℓ^r, c ∈ ℓ^{r−1}, b ∈ ℓ}, and U^{(r)} and U′ generate U^{(r−1)}.
2. Lemma 3.28: factor ξ through H⁰(X(U), R)⁴ → H⁰(X(U^{(1)}), R)² → H⁰(X(U^{(2)}), R) and apply Lemmas 3.26 and 3.27.

**Checks.**

- Lemma 3.27 is used only through the three-copy statement of Lemma 3.28, in the level-raising arguments of §8.

**Direct prerequisites:** `OrdinaryAutomorphicFormsAndModularityLifting:R21.2/ihara-lemma-quaternionic`.

**Sources.**

- [Residually reducible representations and modular forms](http://www.numdam.org/item/PMIHES_1999__89__5_0.pdf), §3.8, Lemmas 3.27–3.28, p. 59 (Numdam PDF page 56; printed page = PDF page + 3). Lemma 3.28.
- [Residually reducible representations and modular forms](http://www.numdam.org/item/PMIHES_1999__89__5_0.pdf), §3.8, Lemma 3.27, p. 58 (Numdam PDF page 55; printed page = PDF page + 3). Lemma 3.27 follows on this page.

### No level raising at a non-Eisenstein auxiliary prime

**Target:** `OrdinaryAutomorphicFormsAndModularityLifting:R21.2/level-raising-congruence-modules` (theorem).

(Lemma 3.29.) Let (𝔫, p) = 1, 𝔭 ⊆ T_∞(U, 𝒪) a prime with p ∈ 𝔭, ρ_𝔭 irreducible and not dihedral, contained in a permissible m; let ℓ ∤ 𝔫p with p ∤ Nm(ℓ) − 1 and the ratio of the eigenvalues of ρ_𝔭(Frob_ℓ) not Nm(ℓ)^{±1}; U^{(0)} = U ∩ U_0(ℓ), U^{(1)} = U ∩ U_1(ℓ). Then (i) T_∞(U^{(1)}, 𝒪)_𝔭 ≅ T_∞(U^{(0)}, 𝒪)_𝔭 ≅ T_∞(U, 𝒪)_𝔭; (ii) M̂_∞(U^{(1)})_𝔭 ≅ M̂_∞(U^{(0)})_𝔭 ≅ M̂_∞(U)_𝔭² and M̂⁺_∞(U^{(1)})_𝔭 ≅ M̂⁺_∞(U^{(0)})_𝔭 ≅ M̂⁺_∞(U)_𝔭² as T̂_∞(U^{(1)}, 𝒪)_𝔭-modules.

**Hypotheses and conventions.**

- The three conditions on ℓ; ρ_𝔭 irreducible and not dihedral.

**Construction or proof route.**

1. (i): the surjections of Corollary 3.12 are isomorphisms after localisation because every minimal prime of T_∞(U^{(1)})_m in 𝔭 has ρ_Q unramified at ℓ (the eigenvalue condition), hence comes from level U (Proposition 3.14).
2. (ii): with ξ = lim ξ_a : M⁺_∞(U)² → M⁺_∞(U^{(1)}) and I = ker(T_∞(U^{(0)}) → T_∞(U)), Jacquet–Langlands and newform theory give eH⁰(X(U_a), K)[I_a] = im(ξ_a ⊗ K) (3.21); the snake lemma embeds the cokernel C into a quotient of lim ker(ξ_a ⊗ K/𝒪).
3. Lemma 3.26 and Chebotarev over the ray class fields F_a make trace ρ_m(σ) − 1 − ε(σ) kill C_m for σ ∈ Gal(F′/F_∞); if C_𝔭 ≠ 0, ρ_𝔭 would be reducible or dihedral. So M⁺_∞(U)²_𝔭 ≅ M⁺_∞(U^{(0)})[I]_𝔭 (3.20), whence (3.22), and M⁺_∞(U^{(0)}) = M⁺_∞(U^{(1)})[S(ℓ) − 1] gives (3.23).

**Checks.**

- The hypothesis on ρ_𝔭(Frob_ℓ) is what prevents level raising at ℓ; without it T_∞(U^{(0)})_𝔭 can be larger.

**Direct prerequisites:** `OrdinaryAutomorphicFormsAndModularityLifting:R21.2/ihara-lemma-quaternionic`; `OrdinaryAutomorphicFormsAndModularityLifting:R21.3/level-type-control`; `OrdinaryAutomorphicFormsAndModularityLifting:R21.3/hecke-generation`; `GL2AutomorphicRepresentationsAndTransfer:R17.3`.

**Sources.**

- [Residually reducible representations and modular forms](http://www.numdam.org/item/PMIHES_1999__89__5_0.pdf), §3.8, Lemma 3.29, p. 59 (Numdam PDF page 56; printed page = PDF page + 3). Lemma 3.29.
- [Residually reducible representations and modular forms](http://www.numdam.org/item/PMIHES_1999__89__5_0.pdf), §3.8, proof of Lemma 3.29, p. 61 (Numdam PDF page 58; printed page = PDF page + 3). The Chebotarev step and (3.22)–(3.23).

### Hilbert Hida weight change with fixed residual determinant

**Target:** `OrdinaryAutomorphicFormsAndModularityLifting:R21.2/hilbert-ordinary-weight-change` (theorem).

Let F be totally real, p ≥ 5, and π a regular algebraic cuspidal GL₂(A_F)-representation of weight 0, with det r_π = ε⁻¹, and with π_v an unramified Steinberg twist for every v | p. There is a specialization π_H of a Hilbert Hida family through π whose associated representation remains ordinary, has labelled Hodge–Tate weights {0,2} at every p-adic embedding, reduces to r̄_π, and has determinant ε⁻²ω, where ω is the Teichmüller lift of ε̄. In particular this supplies a local ordinary lift of r̄_π|G_{F_v} with those weights and determinant for each v | p. This assertion does not preserve all the away-from-p components by itself.

**Hypotheses and conventions.**

- Use HT(ε) = −1; weight 0 for GL₂ means weights {0,1}.
- Take the tame character branch matching ε⁻²ω. Its reduction is ε̄⁻¹, so the determinant agrees with r̄_π.
- Use the Hilbert Hida control theorem with the level and coefficient extensions needed by π; do not assume a new p-distinguishedness hypothesis absent from Newton–Thorne’s local-lift argument.

**Construction or proof route.**

1. The Steinberg weight-zero local factors are ordinary by Newton–Thorne Lemma 2.6.
2. Import the Hilbert family and arithmetic specialization from PadicFamilies L5 and specialize at weights {0,2} on the compatible tame-character branch.
3. Use the ordinary family’s Galois representation to read off the local lifts, their determinant and their common residual representation.

**Checks.**

- Check (ε⁻²ω) mod p = ε̄⁻¹; merely choosing weight three without the tame character would change the residual determinant.
- The Hida specialization supplies local inputs; the Steinberg condition at v₀ and other away-from-p components require a separate global lifting step.

**Direct prerequisites:** `PadicFamilies:L5`; `AutomorphicGaloisRepresentations:R19.2`; `OrdinaryAutomorphicFormsAndModularityLifting:R21.2/nearly-ordinary-representations`.

**Sources.**

- [Symmetric power functoriality for Hilbert modular forms](https://arxiv.org/pdf/2212.03595v2), Lemma 2.6, PDF p. 12; proof of Lemma 3.1, PDF pp. 13–14 (arXiv:2212.03595v2). The Hida specialization supplies the ordinary local lifts.

### Arithmetic control at a permissible Eisenstein localization

**Target:** `OrdinaryAutomorphicFormsAndModularityLifting:R21.2/nearly-ordinary-arithmetic-control` (comparison).

Let F have even degree, p odd, χ totally odd with χ|D_v ≠ 1 at all v|p, and m a permissible maximal ideal at the specified tame level. For an arithmetic character λ of T_∞(U,𝒪)_m whose central character is ψε^μ, μ ≥ 0, and whose torus character at p has finite order, Hida control identifies its Hecke eigensystem with a nearly ordinary cuspidal newform of parallel weight (μ+2)t, with the prescribed tame characters and v-good lines. The family’s Galois pseudo-representation specializes to that newform’s trace and determinant. The local algebra is finite and torsion-free over Λ_𝒪; with the fixed-point-free stabilizer hypothesis the two ordinary modules are finite free of equal rank. This supplies the permissible Eisenstein localization, not a claim that its Λ-adic Hecke algebra is flat. The finite classical weight Hecke algebra is finite flat over the coefficient DVR as in nearly-ordinary-hecke-algebra-comparison.

**Hypotheses and conventions.**

- Use the exact permissible character and tame level of permissible-maximal-ideal and eisenstein-ideal-existence.
- Freeness of the modules requires the fixed-point-free action at the level in question; small stabilizer denominators cannot be ignored.

**Construction or proof route.**

1. Localize the imported Hida control theorem at m and evaluate at the specified arithmetic character.
2. Use the v-good-line Hecke comparison to identify the newform and all unramified Hecke eigenvalues.
3. Specialize the pseudo-representation using its Frobenius trace/determinant formulas, and apply permissible-localisation-finite for the integral module and algebra statements.

**Checks.**

- The distinguishedness is χ|D_v ≠ 1, not a claim that the residual characters differ on inertia.
- Keep finite classical flatness, Λ-torsion-freeness of the algebra and Λ-freeness of the modules distinct.

**Direct prerequisites:** `OrdinaryAutomorphicFormsAndModularityLifting:R21.2/permissible-localisation-finite`; `OrdinaryAutomorphicFormsAndModularityLifting:R21.2/nearly-ordinary-hecke-algebra-comparison`; `OrdinaryAutomorphicFormsAndModularityLifting:R21.3/hecke-pseudo-representation`; `PadicFamilies:L5/hida-control-nearly-ordinary`.

**Sources.**

- [Residually reducible representations and modular forms](http://www.numdam.org/item/PMIHES_1999__89__5_0.pdf), §3.2, Proposition 3.7, Corollary 3.9, Lemma 3.10, pp. 36–41; §3.3, (3.4)–(3.6), pp. 39–40. Arithmetic control, permissible localization and Galois specialization.

## R21.3. Ordinary Galois and deformation families

The reducible and irreducible residual problems retain their different representability hypotheses. Local conditions distinguish a chosen ordinary flag, fixed determinant and fixed inertial quotient. The Hecke-family tangent map enters the same local deformation condition before any R=T assertion.

### Skinner–Wiles deformation data and the residual extension ρ_c

**Target:** `OrdinaryAutomorphicFormsAndModularityLifting:R21.3/deformation-datum` (definition).

F is totally real of degree d, p odd, v_1, …, v_t the places above p with decomposition and inertia groups D_i ⊇ I_i and local degrees d_i, z_1, …, z_d the chosen complex conjugations, and χ : Gal(F̄/F) → k₀^× a character of a finite field of characteristic p with χ|_{D_i} ≠ 1 for every i and χ(z_j) = −1 for every j. A deformation datum is 𝒟 = (𝒪, Σ, c, ℳ): 𝒪 the ring of integers of a local field with finite residue field k ⊇ k₀; Σ a finite set of finite places containing those where χ ramifies and 𝒫 = {v_1, …, v_t}; a class 0 ≠ c ∈ H_Σ(F, k) := ker(H¹(F_Σ/F, k(χ^{−1})) → ⊕_i H¹(D_i, k(χ^{−1}))) (c is admissible); and ℳ ⊆ Σ∖𝒫 a set of places at each of which c is ramified or χ|_{I_v} ≠ 1. Through H¹(F_Σ/F, k(χ^{−1})) ≅ H¹(F_Σ/F(χ), k(χ^{−1}))^{Gal(F(χ)/F)} the class c gives a unique ρ_c : Gal(F_Σ/F) → GL₂(k), ρ_c = (1 *; 0 χ), with ρ_c(z_1) = diag(1, −1) and ρ_c(σ) = (1 c(σ); 0 1) for σ ∈ Gal(F_Σ/F(χ)); for admissible c, ρ_c|_{D_i} ≅ diag(1, χ).

**Hypotheses and conventions.**

- χ|_{D_i} ≠ 1 at every v_i | p (p-distinguished) and χ totally odd.

**Uses.**

- `OrdinaryAutomorphicFormsAndModularityLifting:R21.3/deformation-of-type`: the residual representation ρ_c.
- `OrdinaryAutomorphicFormsAndModularityLifting:R21.4`: the rings R_𝒟 attached to every admissible c (Skinner–Wiles §4).

**API.**

- `TauCeti.OrdinaryModularity.DeformationDatum` (structure): (𝒪, Σ, c, ℳ) with c admissible and ℳ ⊆ Σ∖𝒫.
- `TauCeti.OrdinaryModularity.admissibleClasses` (constructor): H_Σ(F, k) = ker(res to ⊕ H¹(D_i, k(χ^{−1}))).
- `TauCeti.OrdinaryModularity.residualExtension` (constructor): ρ_c = (1 *; 0 χ).
- `TauCeti.OrdinaryModularity.residualExtension_schur` (characterisation): End_{k[G]}(ρ_c) = k for c ≠ 0.
- `TauCeti.OrdinaryModularity.residualExtension_local_split` (characterisation): ρ_c|_{D_i} ≅ diag(1, χ) for admissible c.

**Unit tests.**

- **residualExtension_zero_excluded** (example): c = 0 gives the split 1 ⊕ χ, which is not Schur and is excluded from deformation data.
- **residualExtension_complex_conjugation** (example): ρ_c(z_1) = diag(1, −1) since χ(z_1) = −1.
- **deformationDatum_ribet_691** (example): F = ℚ, p = 691, χ = ω¹¹: take Ribet’s nonzero class coming from an unramified extension of ℚ(ζ₆₉₁). Its local restriction is unramified, and H¹_unr(D₆₉₁,k(ω⁻¹¹)) = H¹(D₆₉₁/I₆₉₁,k(ω⁻¹¹)^I₆₉₁) = 0 because the inertia invariants vanish. Thus the class is admissible; ramification of ω⁻¹¹ alone would not make all local H¹ vanish.

**Construction or proof route.**

1. ρ_c is nonsplit because c ≠ 0; as χ ≠ 1 its centraliser is the scalars, so ρ_c is Schur (the hypothesis of GlobalGaloisDeformations R04.2/universal-deformation-ring).
2. Admissibility kills the restriction of c to D_i, and χ|_{D_i} ≠ 1 splits the local extension.

**Checks.**

- ρ_c is reducible but not split: the absolutely irreducible representability theorem is never used.

**Direct prerequisites:** `GlobalGaloisDeformations:R04.1/strict-deformation-functor`.

**Sources.**

- [Residually reducible representations and modular forms](http://www.numdam.org/item/PMIHES_1999__89__5_0.pdf), §2.1, p. 9 (Numdam PDF page 6; printed page = PDF page + 3). The deformation datum, (2.1) and ρ_c.

### Nearly ordinary deformations of type 𝒟 and the ring R_𝒟

**Target:** `OrdinaryAutomorphicFormsAndModularityLifting:R21.3/deformation-of-type` (construction).

A deformation of ρ_c is a complete local Noetherian ring A with residue field k and a strict equivalence class of continuous ρ : Gal(F̄/F) → GL₂(A) lifting ρ_c. It is of type 𝒟 if A is an 𝒪-algebra, ρ is unramified outside Σ and ∞, ρ|_{D_i} ≅ (ψ^{(i)}_1 *; 0 ψ^{(i)}_2) with χ = ψ^{(i)}_1 mod m_A for each i, and ρ|_{I_w} ≅ (1 *; 0 χ̃) for each w ∈ ℳ (χ̃ the Teichmüller lift). There is a universal deformation of type 𝒟, ρ_𝒟 : Gal(F_Σ/F) → GL₂(R_𝒟). For Q a finite set of places disjoint from Σ, type 𝒟_Q adds ramification at Q with det ρ unramified at Q, giving R_{𝒟_Q}; a deformation is 𝒟_Q-minimal if χ̃^{−1}det ρ is trivial on the torsion N_Σ of Gal(L_Σ/F), and R_{𝒟_Q} ≅ R^min_{𝒟_Q} ⊗_𝒪 𝒪[N_Σ] with ρ_{𝒟_Q} ≅ ρ^min_{𝒟_Q} ⊗ Ψ_Σ.

**Hypotheses and conventions.**

- ρ_c Schur; Gal(F_Σ/F) satisfies Mazur's Φ_p (GlobalGaloisDeformations R04.2).

**Uses.**

- `OrdinaryAutomorphicFormsAndModularityLifting:R21.3/global-presentation-bound`: the presentation of R_𝒟.
- `OrdinaryAutomorphicFormsAndModularityLifting:R21.3/pseudo-to-deformation-map`: r_𝒟 : R_{𝒟^ps} → R_𝒟.
- `OrdinaryAutomorphicFormsAndModularityLifting:R21.4`: pro-modularity of R_𝒟 (Skinner–Wiles §4).

**API.**

- `TauCeti.OrdinaryModularity.IsOfType` (data): The four conditions of type 𝒟.
- `TauCeti.OrdinaryModularity.universalRing` (constructor): R_𝒟 with ρ_𝒟.
- `TauCeti.OrdinaryModularity.universalRing_represents` (universal-property): R_𝒟 pro-represents deformations of type 𝒟.
- `TauCeti.OrdinaryModularity.universalRingAux` (constructor): R_{𝒟_Q} for Q disjoint from Σ.
- `TauCeti.OrdinaryModularity.universalRingMin` (constructor): R^min_{𝒟_Q} and R_{𝒟_Q} ≅ R^min_{𝒟_Q} ⊗ 𝒪[N_Σ].

**Unit tests.**

- **isOfType_residual** (example): ρ_c over k is of type 𝒟 (the point m_{R_𝒟}).
- **isOfType_wrong_order** (example): A lift with ρ|_{D_i} ≅ (ψ_1 *; 0 ψ_2) but ψ_2 ≡ χ (the unit character as sub) is not of type 𝒟.
- **isOfType_restriction** (example): For F′/F permissible for 𝒟, restriction sends type 𝒟 to type 𝒟′ (Remark 2.1).
- **universalRingMin_twist** (example): Twisting by a character of N_Σ (odd order) moves between the components of R_{𝒟_Q} ≅ R^min ⊗ 𝒪[N_Σ].

**Construction or proof route.**

1. The conditions are deformation conditions (stable under the Schlessinger fibre products); R04.2 gives representability for Schur ρ_c.
2. The nearly ordinary condition at v_i is the ordered-flag condition with the χ-line as sub (LocalGaloisDeformationRings L8, requested).
3. Minimal twist: N_Σ is a finite p-group with p odd, so every character of it is a square; ρ^min ⊗ Ψ_Σ with Ψ_Σ : Gal(L_Σ/F) ↠ N_Σ is universal for type 𝒟_Q (Skinner–Wiles §2.3).

**Checks.**

- Skinner–Wiles write 'det ρ is trivial on N_Σ'; since det ρ ≡ χ, the condition is on χ̃^{−1}det ρ.
- The determinant is not fixed: R_𝒟 carries the Λ_𝒪-variables of deformation-iwasawa-algebra.

**Direct prerequisites:** `OrdinaryAutomorphicFormsAndModularityLifting:R21.3/deformation-datum`; `GlobalGaloisDeformations:R04.2/universal-deformation-ring`; `GlobalGaloisDeformations:R04.2/phi-p-global`; `LocalGaloisDeformationRings:L8`.

**Sources.**

- [Residually reducible representations and modular forms](http://www.numdam.org/item/PMIHES_1999__89__5_0.pdf), §2.1, p. 10 (Numdam PDF page 7; printed page = PDF page + 3). Deformations of type 𝒟 and R_𝒟.
- [Residually reducible representations and modular forms](http://www.numdam.org/item/PMIHES_1999__89__5_0.pdf), §2.3, p. 18 (Numdam PDF page 15; printed page = PDF page + 3). Types 𝒟_Q, minimal deformations and R_{𝒟_Q} ≅ R^min ⊗ 𝒪[N_Σ].

### Extensions permissible for a deformation datum

**Target:** `OrdinaryAutomorphicFormsAndModularityLifting:R21.3/permissible-extension` (definition).

A totally real finite F′/F is permissible for 𝒟 if ρ_c|_{Gal(F̄/F′)} is nonsplit; for v ∈ ℳ with χ|_{I_v} ≠ 1, χ|_{I_w} ≠ 1 at every w | v of F′; for v ∈ ℳ with ρ_c|_{I_v} ≠ 1 but χ|_{I_v} = 1, ρ_c|_{I_w} ≠ 1 at every w | v; and χ|_{D_w} ≠ 1 at every w | p of F′. Then 𝒟′ = (𝒪, Σ′, c, ℳ′) (places above Σ and ℳ) is a deformation datum for F′, and restriction sends deformations of type 𝒟 to type 𝒟′ (Remark 2.1).

**Hypotheses and conventions.**

- F′ totally real, so χ stays totally odd.

**Uses.**

- `OrdinaryAutomorphicFormsAndModularityLifting:R21.5`: base change in the proofs of Theorems A and B (Skinner–Wiles §4.6).

**API.**

- `TauCeti.OrdinaryModularity.IsPermissibleExtension` (data): The four conditions on F′/F.
- `TauCeti.OrdinaryModularity.DeformationDatum.baseChange` (constructor): 𝒟 ↦ 𝒟′ for permissible F′.
- `TauCeti.OrdinaryModularity.isOfType_baseChange` (compatibility): Restriction of a type-𝒟 deformation is of type 𝒟′.

**Unit tests.**

- **permissible_self** (example): F′ = F is permissible for 𝒟.
- **permissible_split_fails** (example): If F′ ⊇ the field cut out by ρ_c, ρ_c|_{Gal(F̄/F′)} is trivial, hence split, so F′ is not permissible.
- **permissible_distinguished_fails** (example): If χ|_{D_w} = 1 at some w | p of F′ (e.g. F′ ⊇ F(χ) with v_i split completely), F′ is not permissible.

**Construction or proof route.**

1. Each condition preserves one clause of the definition of a deformation datum or of type 𝒟 after restriction.

**Checks.**

- Skinner–Wiles use base change to permissible F′ to make the reducible locus of large codimension (§4); the choice of F′ depends on Σ.

**Direct prerequisites:** `OrdinaryAutomorphicFormsAndModularityLifting:R21.3/deformation-datum`; `OrdinaryAutomorphicFormsAndModularityLifting:R21.3/deformation-of-type`; `GlobalGaloisDeformations:R04.1/restriction-of-deformations`.

**Sources.**

- [Residually reducible representations and modular forms](http://www.numdam.org/item/PMIHES_1999__89__5_0.pdf), §2.1, p. 10 (Numdam PDF page 7; printed page = PDF page + 3). Permissible extensions and Remark 2.1.

### The presentation of R_𝒟 and its dimension bound

**Target:** `OrdinaryAutomorphicFormsAndModularityLifting:R21.3/global-presentation-bound` (theorem).

For every deformation datum 𝒟 there are integers g, r with R_𝒟 ≅ 𝒪[[x_1, …, x_g]]/(f_1, …, f_r) and g − r ≥ d + δ_F − 2t − 3·#ℳ, where δ_F is the ℤ_p-rank of the Galois group of the maximal abelian pro-p extension of F unramified outside p (Skinner–Wiles Proposition 2.4). Hence every component of R_𝒟 has dimension ≥ 1 + d + δ_F − 2t − 3·#ℳ.

**Hypotheses and conventions.**

- ρ_c is Schur; the split residual local nearly ordinary versal rings are imported from LocalGaloisDeformationRings L7/residually-split-nearly-ordinary-ring (SW99 Lemma 2.2 and Corollary 2.3).

**Construction or proof route.**

1. Auxiliary type: deformations with det ρ = χ̃, unramified outside Σ, with universal ring R^aux_𝒟 ≅ 𝒪[[x_1, …, x_{g′}]]/(f_1, …, f_{r′}), g′ = h¹(F_Σ/F, ad⁰ρ_c), r′ ≤ h²(F_Σ/F, ad⁰ρ_c) (Mazur's presentation, GlobalGaloisDeformations R04.3).
2. At each v_i, R^{(i)}_ord is a quotient of the versal ring R^{(i)} by d_i + ε_i ≤ d_i + 2 elements (Corollary 2.3); the images J of these kernels in R^aux_𝒟 are generated by Σ_i(d_i + 2) = d + 2t elements (2.4).
3. Removing the determinant condition: R_{𝒟′} ≅ R^aux_𝒟/J ⊗̂_𝒪 𝒪[[Gal(L(Σ)/F)]] for 𝒟′ = (𝒪, Σ, c, ∅) (2.5) (R04.2/fixed-determinant-rings with n = 2, p ∤ 2), and 𝒪[[Gal(L(Σ)/F)]] ≅ 𝒪[[x_1, …, x_{δ_F}, y_1, …, y_s]]/(g_1, …, g_s) (2.6), s = dim_k H¹(D-free part) as in (2.2).
4. The ℳ-conditions: I = ker(R_{𝒟′} ↠ R_𝒟) is generated by a_v − 1, d_v − 1, c_v at a generator τ_v of tame p-inertia, 3·#ℳ elements (2.7).
5. Hence g = g′ + s + δ_F and r = r′ + s + d + 2t + 3·#ℳ; the global Euler characteristic formula for ad⁰ρ_c (ArithmeticGaloisDuality R02.3), with ρ_c odd, gives g′ − r′ ≥ 2d, whence the bound.

**Checks.**

- The bound is on g − r for this particular presentation; dimension ≥ 1 + (g − r) follows because R_𝒟 is a quotient of a regular ring of dimension g + 1 by r elements.

**Direct prerequisites:** `OrdinaryAutomorphicFormsAndModularityLifting:R21.3/deformation-of-type`; `GlobalGaloisDeformations:R04.2/fixed-determinant-rings`; `GlobalGaloisDeformations:R04.3`; `LocalGaloisDeformationRings:L7/residually-split-nearly-ordinary-ring`; `ArithmeticGaloisDuality:R02.3`; `PadicFamilies:L5/totally-real-weight-algebra`.

**Sources.**

- [Residually reducible representations and modular forms](http://www.numdam.org/item/PMIHES_1999__89__5_0.pdf), §2.1, p. 13 (Numdam PDF page 10; printed page = PDF page + 3). Proposition 2.4.
- [Residually reducible representations and modular forms](http://www.numdam.org/item/PMIHES_1999__89__5_0.pdf), §2.1, proof of Proposition 2.4, p. 14 (Numdam PDF page 11; printed page = PDF page + 3). The auxiliary presentation and the count.

### R_𝒟 is topologically generated by matrix entries

**Target:** `OrdinaryAutomorphicFormsAndModularityLifting:R21.3/matrix-entry-subring` (lemma).

Fix a basis for ρ_𝒟 and let R′ ⊆ R_𝒟 be the 𝒪-subalgebra generated by the matrix entries a_σ, b_σ, c_σ, d_σ, m′ = m_𝒟 ∩ R′, R_1 = R′_{m′} and R̂_1 its completion. Then R̂_1 → R_𝒟 is surjective (Lemma 2.5). If 𝔭 ⊊ R_𝒟 is not maximal and 𝔭_1 = R_1 ∩ 𝔭, then dim R_1/𝔭_1 ≥ 1 (Lemma 2.6).

**Construction or proof route.**

1. Lemma 2.5: ρ_1 over R̂_1 composes to ρ_𝒟; universality gives R_𝒟 → R̂_1/m_1 with kernel m_𝒟, so m_1R_𝒟 = m_𝒟 and dim_k R_𝒟/m_1R_𝒟 = 1; then R_𝒟 is generated as an R̂_1-module by one element (Matsumura, Theorem 8.4).
2. Lemma 2.6: if 𝔭_1 were maximal, 𝔭 would contain a uniformiser and ρ_𝒟 mod 𝔭 would have entries in k, so by universality 𝔭 = m_𝒟.

**Checks.**

- Used in Proposition 2.11 to compare R_{𝒟_Q} with the pseudo-deformation ring.

**Direct prerequisites:** `OrdinaryAutomorphicFormsAndModularityLifting:R21.3/deformation-of-type`.

**Sources.**

- [Residually reducible representations and modular forms](http://www.numdam.org/item/PMIHES_1999__89__5_0.pdf), §2.1, p. 15 (Numdam PDF page 12; printed page = PDF page + 3). Lemmas 2.5 and 2.6.

### Types A, B, B′ and C at a place w ∤ p

**Target:** `OrdinaryAutomorphicFormsAndModularityLifting:R21.3/ramification-types` (definition).

For a field 𝒦 and ρ : Gal(F̄/F) → GL₂(𝒦) ramified at w ∤ p: type A if ρ|_{I_w} ≅ (1 *; 0 1) with * ≠ 0; type B if ρ|_{I_w} ≅ diag(φ, 1) with φ a finite character; type B′ if ρ|_{I_w} ≅ diag(φ, φ^{−1}) with φ finite; type C if ρ|_{D_w} = Ind_{F_{w²}}^{F_w} ψ for the unramified quadratic F_{w²}/F_w and ψ with ψ|_{I_w} ≠ ψ^{Frob_w}|_{I_w}, ψ|_{I_w} of p-power order and det ρ|_{D_w} of order prime to p. Type C occurs only in characteristic 0.

**Hypotheses and conventions.**

- w ∤ p; 𝒦 a field.

**Uses.**

- `OrdinaryAutomorphicFormsAndModularityLifting:R21.3/level-type-control`: the level of a minimal prime by type.

**API.**

- `TauCeti.OrdinaryModularity.RamificationType` (data): The types A, B, B′, C at w.
- `TauCeti.OrdinaryModularity.ramificationType_of_pseudo` (compatibility): The type of ρ_Q is inherited by ρ_P for P ∈ 𝒳(Q) (proof of Proposition 3.14).
- `TauCeti.OrdinaryModularity.typeC_charZero` (characterisation): Type C forces characteristic 0.

**Unit tests.**

- **typeA_steinberg** (example): The ℓ-adic representation of an elliptic curve with split multiplicative reduction at w is of type A there.
- **typeB_character** (example): A principal series π(μ, 1) with μ tamely ramified gives type B.
- **typeC_charZero_example** (example): In characteristic p a character of p-power order is trivial (there are no nontrivial p-power roots of unity), so ψ|_{I_w} = 1 = ψ^{Frob}|_{I_w} and type C cannot occur.

**Construction or proof route.**

1. The four shapes are the possibilities used later; they are not claimed to be exhaustive.

**Checks.**

- The types are properties of a representation over a field (ρ_Q over Frac(T/Q), or a residue field), not of a pseudo-representation.

**Direct prerequisites:** `OrdinaryAutomorphicFormsAndModularityLifting:R21.3/deformation-datum`.

**Sources.**

- [Residually reducible representations and modular forms](http://www.numdam.org/item/PMIHES_1999__89__5_0.pdf), §2.3, p. 19 (Numdam PDF page 16; printed page = PDF page + 3). Types A, B, B′ and C (the text layer reads the last 'Type C' as 'Type G').

### Wiles pseudo-representations and pseudo-deformations

**Target:** `OrdinaryAutomorphicFormsAndModularityLifting:R21.3/pseudo-representation` (definition).

A (2-dimensional) pseudo-representation of Gal(F̄/F) into a topological ring A is ρ = {a, d, x} with continuous a, d : Gal(F̄/F) → A and x : Gal(F̄/F)² → A such that a(στ) = a(σ)a(τ) + x(σ, τ); d(στ) = d(σ)d(τ) + x(τ, σ); x(σ, τ)x(α, β) = x(σ, β)x(α, τ); x(στ, αβ) = a(σ)a(β)x(τ, α) + a(β)d(τ)x(σ, α) + a(σ)d(α)x(τ, β) + d(τ)d(α)x(σ, β); a(1) = 1 = d(1); a(z_1) = 1 = −d(z_1); and x(σ, g) = 0 = x(g, σ) for g ∈ {1, z_1}. Its trace is a + d and its determinant is a(σ)d(σ) − x(σ, σ). A representation with ρ(z_1) = diag(1, −1), ρ(σ) = (a_σ b_σ; c_σ d_σ), gives {a_σ, d_σ, b_σc_τ}. ρ_0 = {1, χ, 0} is the pseudo-representation of 1 ⊕ χ; a pseudo-deformation is (A, ρ) with A complete local Noetherian with residue field k and ρ mod m_A = ρ_0; a pseudo-datum 𝒟^ps = (𝒪, Σ) asks A to be an 𝒪-algebra and ρ to factor through Gal(F_Σ/F); type 𝒟^ps_Q adds places Q with det ρ unramified at Q.

**Hypotheses and conventions.**

- p odd; the complex conjugation z_1 normalises the basis.

**Uses.**

- `OrdinaryAutomorphicFormsAndModularityLifting:R21.3/universal-pseudo-deformation`: the functor F_{𝒟^ps}.
- `OrdinaryAutomorphicFormsAndModularityLifting:R21.3/hecke-pseudo-representation`: the pseudo-representation into T_∞(U, 𝒪)_m.

**API.**

- `TauCeti.OrdinaryModularity.PseudoRep` (structure): {a, d, x} with the seven identities.
- `TauCeti.OrdinaryModularity.PseudoRep.trace` (constructor): a + d.
- `TauCeti.OrdinaryModularity.PseudoRep.det` (constructor): a(σ)d(σ) − x(σ, σ).
- `TauCeti.OrdinaryModularity.PseudoRep.ofRep` (constructor): {a_σ, d_σ, b_σc_τ} for ρ with ρ(z_1) = diag(1, −1).
- `TauCeti.OrdinaryModularity.PseudoRep.ofRep_conj_diagonal` (characterisation): Diagonal conjugation does not change ofRep.
- `TauCeti.OrdinaryModularity.PseudoRep.trace_isPseudocharacter` (compatibility): The trace is an IHG.0 pseudocharacter of dimension 2.

**Unit tests.**

- **pseudoRep_ofRep_identity** (example): For 2×2 matrices, b_{στ}c_{αβ} = (a_σb_τ + b_σd_τ)(c_αa_β + d_αc_β) expands to the fourth identity.
- **pseudoRep_residual** (example): ρ_c and ρ_{c′} have the same pseudo-representation ρ_0 = {1, χ, 0}, since x = bc vanishes when c-entries are 0.
- **pseudoRep_det_of_rep** (example): For ρ = (a b; c d), det of ofRep ρ is a_σd_σ − b_σc_σ = det ρ(σ).
- **pseudoRep_diagonal_conj** (example): Conjugating by diag(u, 1) scales b by u and c by u^{−1}, leaving b_σc_τ fixed.

**Construction or proof route.**

1. The identities for {a_σ, d_σ, b_σc_τ} expand the matrix product (checked in the Lean file).
2. The trace a + d is a 2-dimensional pseudocharacter (IntegralHeckeAndGaloisDeterminants IHG.0), 2 being invertible.

**Checks.**

- This is the Wiles (generalized-matrix) formalism of the source, not the determinant formalism; the comparison with IHG.0 is only through the trace and determinant.
- Every ρ_c, c ∈ H¹(F_Σ/F, k(χ^{−1})), has pseudo-representation ρ_0: the pseudo-deformation ring forgets c.

**Direct prerequisites:** `OrdinaryAutomorphicFormsAndModularityLifting:R21.3/deformation-datum`; `IntegralHeckeAndGaloisDeterminants:IHG.0/pseudocharacter`.

**Sources.**

- [Residually reducible representations and modular forms](http://www.numdam.org/item/PMIHES_1999__89__5_0.pdf), §2.4, p. 19 (Numdam PDF page 16; printed page = PDF page + 3). The axioms, trace, determinant and pseudo-deformations.
- [Residually reducible representations and modular forms](http://www.numdam.org/item/PMIHES_1999__89__5_0.pdf), §2.4, p. 21 (Numdam PDF page 18; printed page = PDF page + 3). Pseudo-data of type 𝒟^ps_Q.

### The universal pseudo-deformation ring

**Target:** `OrdinaryAutomorphicFormsAndModularityLifting:R21.3/universal-pseudo-deformation` (theorem).

The functor F_{𝒟^ps} of pseudo-deformations of type 𝒟^ps on complete local Noetherian 𝒪-algebras with residue field k satisfies Schlessinger's criteria; its tangent space has #F_{𝒟^ps}(k[ε]) = (#k)^r with r ≤ 4·#Gal(F(χ)/F) + 2(dim_k H¹(F_Σ/F(χ), k))² + 4 (Lemma 2.10). Hence there is a universal pseudo-deformation (R_{𝒟^ps}, ρ_{𝒟^ps}), and likewise R_{𝒟^ps_Q}.

**Hypotheses and conventions.**

- k finite; Gal(F_Σ/F(χ)) has finite abelianised p-quotient (class field theory).

**Construction or proof route.**

1. Schlessinger's (H1)–(H3) hold as for representations (DeformationAndDerivedPatchingAlgebra R03.2); only finiteness of the tangent space needs proof.
2. Over k[ε], a = 1 + εa_1, d = χ + εd_1, x = εx_1; restrictions to G_χ = Gal(F_Σ/F(χ)) give a_1|, d_1| ∈ Hom(G_χ, k) and x_1|_{G_χ×G_χ} ∈ Hom(G_χ, Hom(G_χ, k)), bounded by (#k)^{s² + 2s}.
3. The remaining data are cocycles vanishing on G_χ or constants on cosets of G_χ, giving the bound (#k)^{s² + 4s + 4·#Gal(F(χ)/F)} ≤ (#k)^{4·#Gal(F(χ)/F) + 2s² + 4}, since s² + 4s ≤ 2s² + 4.

**Checks.**

- The stated bound is weaker than the one the proof gives; both suffice.

**Direct prerequisites:** `OrdinaryAutomorphicFormsAndModularityLifting:R21.3/pseudo-representation`; `DeformationAndDerivedPatchingAlgebra:R03.2`.

**Sources.**

- [Residually reducible representations and modular forms](http://www.numdam.org/item/PMIHES_1999__89__5_0.pdf), §2.4, Lemma 2.10, p. 20 (Numdam PDF page 17; printed page = PDF page + 3). Lemma 2.10.

### From pseudo-deformation rings to deformation rings

**Target:** `OrdinaryAutomorphicFormsAndModularityLifting:R21.3/pseudo-to-deformation-map` (construction).

For every deformation ρ of some ρ_c over an 𝒪-algebra A, the pseudo-representation associated to ρ in a basis with ρ(z_1) = diag(1, −1) is well defined (bases differ by diagonal conjugation) and of type (𝒪, Σ). Hence for a deformation datum 𝒟 with 𝒟^ps = (𝒪, Σ) there is a unique r_𝒟 : R_{𝒟^ps} → R_𝒟 inducing the pseudo-deformation of ρ_𝒟, and likewise r_{𝒟_Q} : R_{𝒟^ps_Q} → R_{𝒟_Q} and r^min_𝒟 : R_{𝒟^ps} → R^min_𝒟.

**Uses.**

- `OrdinaryAutomorphicFormsAndModularityLifting:R21.3/pseudo-deformation-localisation`: the comparison at one-dimensional primes.

**API.**

- `TauCeti.OrdinaryModularity.pseudoToDeformation` (constructor): r_𝒟 : R_{𝒟^ps} → R_𝒟.
- `TauCeti.OrdinaryModularity.pseudoToDeformation_unique` (universal-property): The unique map inducing ρ_𝒟's pseudo-deformation.
- `TauCeti.OrdinaryModularity.pseudoToDeformation_aux` (constructor): r_{𝒟_Q} and r^min_𝒟.

**Unit tests.**

- **pseudoToDeformation_residual** (example): Modulo maximal ideals r_𝒟 is the identity of k.
- **pseudoToDeformation_basis** (example): Changing the basis of ρ_𝒟 by diag(u, 1) does not change r_𝒟.
- **pseudoToDeformation_not_onto** (example): Two data 𝒟, 𝒟′ with different c share R_{𝒟^ps}, so r_𝒟 cannot detect c.

**Construction or proof route.**

1. Two bases with ρ(z_1) = diag(1, −1) differ by a diagonal matrix, which fixes a_σ, d_σ and b_σc_τ; universality of R_{𝒟^ps} gives r_𝒟.

**Checks.**

- r_𝒟 is not surjective in general: the pseudo-deformation ring does not see the extension class c.

**Direct prerequisites:** `OrdinaryAutomorphicFormsAndModularityLifting:R21.3/universal-pseudo-deformation`; `OrdinaryAutomorphicFormsAndModularityLifting:R21.3/deformation-of-type`.

**Sources.**

- [Residually reducible representations and modular forms](http://www.numdam.org/item/PMIHES_1999__89__5_0.pdf), §2.4, p. 21 (Numdam PDF page 18; printed page = PDF page + 3). The maps r_𝒟, r_{𝒟_Q} and r^min_𝒟.

### Localising at irreducible one-dimensional primes

**Target:** `OrdinaryAutomorphicFormsAndModularityLifting:R21.3/pseudo-deformation-localisation` (theorem).

If 𝔭 ⊆ R_{𝒟_Q} is a one-dimensional prime with ρ_{𝒟_Q} mod 𝔭 irreducible and 𝔭^ps = r_{𝒟_Q}^{−1}(𝔭), then R̂_{𝒟^ps_Q, 𝔭^ps} → R̂_{𝒟_Q, 𝔭} is surjective (Proposition 2.11). Consequently, for any prime Q ⊆ R_𝒟 with ρ_𝒟 mod Q irreducible and Q^ps = r_𝒟^{−1}(Q), dim R_{𝒟^ps}/Q^ps ≥ dim R_𝒟/Q, with equality if Q has dimension one (Corollary 2.12).

**Construction or proof route.**

1. A = R_{𝒟_Q}/𝔭 is finite over A^ps = R^ps/𝔭^ps (A/m^psA is Artinian), so both have dimension one.
2. Irreducibility gives τ_0 with c_{τ_0} ∉ r(𝔭^ps); with ρ(σ_0) = (* u; * *), u a unit, the b_σ lie in the image after localising, so R′_{𝔭′} is the image of R^ps localised (R′ the subring generated by im r and the b_σ).
3. With Lemma 2.5, 𝔭^psR_{𝒟_Q,𝔭} = 𝔭R_{𝒟_Q,𝔭} and all residue fields agree, so the completed map is onto (Matsumura, Theorem 8.4).
4. Corollary 2.12 by induction on dimension through a one-dimensional 𝔭 ⊇ Q with ρ mod 𝔭 irreducible.

**Checks.**

- Irreducibility of ρ mod 𝔭 is essential: at reducible primes the pseudo-deformation ring loses the extension data.

**Direct prerequisites:** `OrdinaryAutomorphicFormsAndModularityLifting:R21.3/pseudo-to-deformation-map`; `OrdinaryAutomorphicFormsAndModularityLifting:R21.3/matrix-entry-subring`.

**Sources.**

- [Residually reducible representations and modular forms](http://www.numdam.org/item/PMIHES_1999__89__5_0.pdf), §2.4, Proposition 2.11, p. 21 (Numdam PDF page 18; printed page = PDF page + 3). Proposition 2.11.
- [Residually reducible representations and modular forms](http://www.numdam.org/item/PMIHES_1999__89__5_0.pdf), §2.4, Corollary 2.12, p. 22 (Numdam PDF page 19; printed page = PDF page + 3). Corollary 2.12.

### Lattices with nonsplit reduction and their extension classes

**Target:** `OrdinaryAutomorphicFormsAndModularityLifting:R21.3/lattice-reduction-lemma` (lemma).

Let A be a complete DVR with residue field k, K = Frac A, and ρ : Gal(F_Σ/F) → GL₂(K) irreducible with reduction (ρ̄^ss) 1 ⊕ χ. (i) There is a stable lattice L with ρ̄_L(σ) = (1 b_σ; 0 χ(σ)) nonsplit with scalar centraliser. (ii) For two such lattices the classes σ ↦ χ(σ)^{−1}b_i(σ) in H¹(F_Σ/F, k(χ^{−1})) are nonzero scalar multiples (Lemma 2.13). Consequently, if (A, φ) is a pseudo-deformation of ρ_0 unramified outside Σ with x not identically zero, there are 0 ≠ c ∈ H¹(F_Σ/F, k(χ^{−1})) and a deformation ρ_φ of ρ_c with pseudo-deformation φ, c unique up to a scalar (Corollary 2.14).

**Hypotheses and conventions.**

- A a complete DVR with residue field k.

**Construction or proof route.**

1. (i) In a basis with ρ(z_1) = diag(1, −1) rescale by diag(λ^{−n}, 1), n = min ord_λ(b_σ) < ∞ (irreducibility).
2. (ii) The change of lattice commutes with diag(1, −1), so is diag(1, a); unit entries force ord(a) = 0.
3. Corollary 2.14: ρ(σ) = (a(σ) x(σ, τ_0)/x(σ_0, τ_0); x(σ_0, σ) d(σ)) with ord x(σ_0, τ_0) minimal is an irreducible representation with pseudo-representation φ; apply the lemma.

**Checks.**

- The extension class is determined only up to a scalar.

**Direct prerequisites:** `OrdinaryAutomorphicFormsAndModularityLifting:R21.3/pseudo-representation`.

**Sources.**

- [Residually reducible representations and modular forms](http://www.numdam.org/item/PMIHES_1999__89__5_0.pdf), §2.4, Lemma 2.13, p. 23 (Numdam PDF page 20; printed page = PDF page + 3). Lemma 2.13 and Corollary 2.14.

### Lifting pseudo-deformations at one-dimensional primes

**Target:** `OrdinaryAutomorphicFormsAndModularityLifting:R21.3/pseudo-deformation-lifting` (theorem).

(Proposition 2.15.) Let (R, ρ) be a pseudo-deformation of type (𝒪, Σ), 𝔭 ⊆ R a prime of dimension one with x(σ, τ) mod 𝔭 not identically zero, and k′ the residue field of the integral closure of R/𝔭. There are 0 ≠ c ∈ H¹(F_Σ/F, k′(χ^{−1})), unique up to a scalar, a local complete Noetherian 𝒪-domain R⁺ with residue field k′ and dim R⁺ = dim R, a local 𝒪-algebra map R ↪ R⁺, a dimension-one prime 𝔭⁺ ⊆ R⁺ over 𝔭, and a deformation ρ⁺ : Gal(F_Σ/F) → GL₂(R⁺) of ρ_c whose pseudo-deformation is induced from ρ. If moreover ℳ, Q ⊆ Σ satisfy (2.8) and ρ⁺ ⊗ ℒ (ℒ = Frac R⁺) satisfies (2.9), then ρ⁺ is of type 𝒟_Q for 𝒟 = (𝒪′, Σ∖Q, c, ℳ), 𝒪′ = 𝒪 ⊗_{W(k)} W(k′).

**Hypotheses and conventions.**

- (2.8): ℳ ⊆ Σ∖𝒫 are places where ρ_c ramifies and Q ⊆ Σ∖(𝒫 ∪ ℳ) places where it is unramified. (2.9): the nearly ordinary shape at every v_i, the shape (1 *; 0 χ̃) on I_w for w ∈ ℳ, and det unramified on Q.

**Construction or proof route.**

1. Corollary 2.14 gives c and ρ_𝔭 over the normalisation A of R/𝔭.
2. Blow up: R′ = R[α/β] with α/β a uniformiser of A, then R* = R′[i_1/i, …, i_r/i] with i an x(σ, τ) of minimal valuation; complete at the preimage of m_A and pass to a quotient by a minimal prime q⁺ (going down, Matsumura Theorem 9.5) to get a domain R⁺ with dim R⁺ = dim R.
3. In R⁺ the ideal IR⁺ = (i), i = x(σ_0, τ_0), and ρ⁺(σ) = (a(σ) x(σ, τ_0)/i; x(σ_0, σ) d(σ)) is a deformation of some ρ_{c′}; reduction mod 𝔭⁺ and Corollary 2.14 give c′ = c up to scalar.

**Checks.**

- R⁺ is a new ring over R, not a quotient: pseudo-deformations are lifted after a finite birational modification.

**Direct prerequisites:** `OrdinaryAutomorphicFormsAndModularityLifting:R21.3/lattice-reduction-lemma`; `OrdinaryAutomorphicFormsAndModularityLifting:R21.3/deformation-of-type`.

**Sources.**

- [Residually reducible representations and modular forms](http://www.numdam.org/item/PMIHES_1999__89__5_0.pdf), §2.4, p. 24 (Numdam PDF page 21; printed page = PDF page + 3). The construction of R⁺ and ρ⁺.
- [Residually reducible representations and modular forms](http://www.numdam.org/item/PMIHES_1999__89__5_0.pdf), §2.4, p. 25 (Numdam PDF page 22; printed page = PDF page + 3). Proposition 2.15.

### The Λ_𝒪-algebra structures on deformation rings

**Target:** `OrdinaryAutomorphicFormsAndModularityLifting:R21.3/deformation-iwasawa-algebra` (construction).

Let L_0 be the maximal abelian pro-p extension of F unramified outside 𝒫, I ⊆ Gal(L_0/F) generated by the images of the I_i, I_0 ⊆ I a maximal free ℤ_p-summand (rank δ_F), G_0 ⊇ I_0 a free summand of rank δ_F with generators the images of γ_1, …, γ_{δ_F} ∈ Gal(F̄/F) such that γ_i^{p^{r_i}} generate I_0, and y^{(i)}_1, …, y^{(i)}_{d_i} ∈ U_i generating a free summand of rank d_i. Λ_𝒪 = 𝒪[[T_1, …, T_{δ_F}, Y^{(i)}_j]] acts on R_𝒟 and R_{𝒟_Q} by T_i ↦ det ρ_𝒟(γ_i) − 1 and Y^{(i)}_j ↦ ψ^{(i)}_2(y^{(i)}_j) − 1, and on R_{𝒟^ps} by T_i ↦ det ρ^ps(γ_i) − 1 and Y^{(i)}_j ↦ (trace ρ^ps(g_iσ^{(i)}_j) − α_i trace ρ^ps(σ^{(i)}_j))/(β_i − α_i) − 1, where χ(g_i) ≠ 1 and α_i, β_i are the roots of X² − trace ρ^ps(g_i)X + det ρ^ps(g_i) with α_i ≡ χ(g_i). These are compatible with r_𝒟, with R_{𝒟′} ↠ R_𝒟 for Σ ⊆ Σ′, ℳ′ ⊆ ℳ, and with R_{𝒟^ps_2} → R_{𝒟^ps_1} for Σ_2 ⊇ Σ_1.

**Hypotheses and conventions.**

- χ(g_i) ≠ 1 makes the roots distinct and β_i − α_i a unit (Hensel).

**Uses.**

- `OrdinaryAutomorphicFormsAndModularityLifting:R21.3/hecke-pseudo-representation`: (3.6) is a map of Λ_𝒪-algebras.
- `OrdinaryAutomorphicFormsAndModularityLifting:R21.4`: pro-modularity over Λ_𝒪.

**API.**

- `TauCeti.OrdinaryModularity.deformationLambdaAlgebra` (constructor): The Λ_𝒪-algebra structure on R_𝒟 and R_{𝒟_Q}.
- `TauCeti.OrdinaryModularity.pseudoLambdaAlgebra` (constructor): The Λ_𝒪-algebra structure on R_{𝒟^ps}.
- `TauCeti.OrdinaryModularity.pseudoToDeformation_lambda` (compatibility): r_𝒟 is Λ_𝒪-linear.
- `TauCeti.OrdinaryModularity.lambdaAlgebra_levelChange` (compatibility): The transition maps are Λ_𝒪-linear.

**Unit tests.**

- **pseudoLambda_upper_triangular** (example): For ρ = (u *; 0 w) on D_i and g with eigenvalues α (upper) and β (lower): (tr(gσ) − α tr σ)/(β − α) = w(σ) (checked in the Lean file).
- **lambdaAlgebra_rank_zero** (example): If every r_i = 0, the γ_i themselves generate I_0.
- **lambdaAlgebra_residual** (example): Modulo m every T_i and Y^{(i)}_j maps to 0.

**Construction or proof route.**

1. With ρ|_{D_i} upper triangular with diagonal (ψ_1χ̃, ψ_2) and g_i eigenvalues α_i = ψ_1χ̃(g_i), β_i = ψ_2(g_i), trace(g_iσ) − α_i trace(σ) = (β_i − α_i)ψ_2(σ) for σ ∈ D_i, so the two structures agree through r_𝒟.

**Checks.**

- The T-variables use det(γ_i), the Y-variables the unramified-quotient character ψ_2; they match the Hecke side (R21.2/permissible-weight-algebra: 1 + T_j ↦ D(γ_j), 1 + Y ↦ T_y).

**Direct prerequisites:** `OrdinaryAutomorphicFormsAndModularityLifting:R21.3/pseudo-to-deformation-map`; `PadicFamilies:L5/totally-real-weight-algebra`; `mathlib:MvPowerSeries`.

**Sources.**

- [Residually reducible representations and modular forms](http://www.numdam.org/item/PMIHES_1999__89__5_0.pdf), §2.5, p. 26 (Numdam PDF page 23; printed page = PDF page + 3). The Λ_𝒪-structures of §2.5.

### Hida's Galois representation over the nearly ordinary Hecke algebra

**Target:** `OrdinaryAutomorphicFormsAndModularityLifting:R21.3/hida-family-representation` (construction).

Let F have even degree and Q a prime of T_∞(U, 𝒪), R = T_∞(U, 𝒪)/Q, L = Frac R. There is a continuous semisimple ρ_Q : Gal(F̄/F) → GL₂(L̄) with (3.4): (i) ρ_Q(z_1) = diag(1, −1); (ii) ρ_Q unramified at ℓ ∤ 𝔫p; (iii) trace ρ_Q(Frob_ℓ) = T(ℓ) mod Q; (iv) det ρ_Q(Frob_ℓ) = S(ℓ)Nm(ℓ) mod Q; (v) det ρ_Q(x) = S_xε(x) mod Q for x ∈ Z(U); (vi) ρ_Q|_{D_i} ≅ (ψ^{(i)}_1 *; 0 ψ^{(i)}_2) with ψ^{(i)}_2(y) = T_y mod Q for y ∈ 𝒪_{F,v_i}^× and ψ^{(i)}_2(λ_{𝔭_i}^{(𝔭_i)}) = T_0(𝔭_i) mod Q. Its pseudo-representation takes values in R.

**Hypotheses and conventions.**

- [F : ℚ] even; 𝔫 the product of the ℓ with U_ℓ ≠ GL₂(𝒪_{F,ℓ}).

**Uses.**

- `OrdinaryAutomorphicFormsAndModularityLifting:R21.3/hecke-pseudo-representation`: patching over minimal primes.
- `OrdinaryAutomorphicFormsAndModularityLifting:R21.3/level-type-control`: the type of ρ_Q at w ∤ p.
- `PadicFamilies:L4`: the ordinary big Galois representation (RS-08).

**API.**

- `TauCeti.OrdinaryModularity.hidaGaloisRep` (constructor): ρ_Q : Gal(F̄/F) → GL₂(L̄) for a prime Q of T_∞(U, 𝒪).
- `TauCeti.OrdinaryModularity.hidaGaloisRep_trace` (characterisation): trace ρ_Q(Frob_ℓ) = T(ℓ) mod Q.
- `TauCeti.OrdinaryModularity.hidaGaloisRep_det` (characterisation): det ρ_Q(Frob_ℓ) = S(ℓ)Nm(ℓ), det ρ_Q(x) = S_xε(x).
- `TauCeti.OrdinaryModularity.hidaGaloisRep_nearlyOrdinary` (characterisation): The shape (vi) at each v_i.
- `TauCeti.OrdinaryModularity.hidaGaloisRep_specialise` (compatibility): At an algebraic prime of weight 2 it is Wiles' ρ_π.

**Unit tests.**

- **hidaGaloisRep_complex_conj** (example): ρ_Q(z_1) = diag(1, −1): trace 0, determinant −1.
- **hidaGaloisRep_weight_two** (example): At an algebraic prime of weight 2 with λ of π, trace ρ_Q(Frob_ℓ) = λ(T(ℓ)).
- **hidaGaloisRep_ordinary_line** (example): The quotient character ψ_2 is the one with ψ_2(y) = T_y; it reduces to 1 modulo a permissible m.

**Construction or proof route.**

1. For ordinary π, Wiles' ρ_π with (3.2) (AutomorphicGaloisRepresentations R19.2); for nearly ordinary π twist to an ordinary π ⊗ ψ; local–global compatibility π_v ≅ π_v(ρ_π) (3.3) (R19.4).
2. Q algebraic of weight 2: ρ_Q = ρ_π for the π of any λ ∈ ℋ(Q).
3. Q minimal: glue the ρ_P over the dense set 𝒳(Q) (PadicFamilies L5/algebraic-primes-dense) as in Wiles [W2, Theorem 2.2.1].
4. (vi) for minimal Q: the semisimplification of ρ_Q|_{D_i} is ψ_1 ⊕ ψ_2 with ψ_2(y) = T_y; if ψ_1|_{I} ≠ ψ_2|_{I} choose τ_0 separating them and the dense 𝒴 ⊆ 𝒳(Q); at P ∈ 𝒵 the conjugated ρ′_Q is integral with nonsplit reduction, which forces the sub-character to be ψ_1; then ψ_2(λ) = T_0(𝔭_i) as in [W2, Lemma 2.2.4].
5. Non-minimal Q′ ⊆ Q: reduce the pseudo-representation of ρ_Q; (vi) by choosing a basis adapted to ψ_1 ≢ ψ_2 mod Q′.

**Checks.**

- ρ_Q is only semisimple over L̄; integrality is for its pseudo-representation. Do not assert a representation over T_∞(U, 𝒪) or its localisation in the residually reducible case.

**Direct prerequisites:** `AutomorphicGaloisRepresentations:R19.2`; `AutomorphicGaloisRepresentations:R19.4`; `PadicFamilies:L5/algebraic-primes-dense`; `PadicFamilies:L5/hida-hecke-finite`; `OrdinaryAutomorphicFormsAndModularityLifting:R21.3/pseudo-representation`; `OrdinaryAutomorphicFormsAndModularityLifting:R21.2/nearly-ordinary-hecke-algebra-comparison`.

**Sources.**

- [Residually reducible representations and modular forms](http://www.numdam.org/item/PMIHES_1999__89__5_0.pdf), §3.3, p. 38 (Numdam PDF page 35; printed page = PDF page + 3). (3.2).
- [Residually reducible representations and modular forms](http://www.numdam.org/item/PMIHES_1999__89__5_0.pdf), §3.3, p. 39 (Numdam PDF page 36; printed page = PDF page + 3). (3.4) and the existence proof.
- [Residually reducible representations and modular forms](http://www.numdam.org/item/PMIHES_1999__89__5_0.pdf), §3.3, p. 40 (Numdam PDF page 37; printed page = PDF page + 3). The proof of (3.4)(vi).

### The pseudo-representation into T_∞(U, 𝒪)_m and the map R_{𝒟^ps} → T

**Target:** `OrdinaryAutomorphicFormsAndModularityLifting:R21.3/hecke-pseudo-representation` (construction).

For a maximal ideal m of T_∞(U, 𝒪), patching the pseudo-representations of the ρ_Q over the minimal primes Q ⊆ m gives a pseudo-representation ρ^mod_m into T_∞(U, 𝒪)_m (3.5): unramified at ℓ ∤ 𝔫p, with trace ρ^mod_m(Frob_ℓ) = T(ℓ) and det ρ^mod_m(Frob_ℓ) = S(ℓ)Nm(ℓ). If m is permissible, ρ^mod_m is a pseudo-deformation of type 𝒟^ps = (𝒪, Σ), Σ the places with U_v ≠ GL₂(𝒪_{F,v}) together with 𝒫, giving (3.6) R_{𝒟^ps} → T_∞(U, 𝒪)_m, a map of Λ_𝒪-algebras.

**Hypotheses and conventions.**

- T_∞(U, 𝒪) reduced (it embeds in a product of fields by R21.2's comparison).

**Uses.**

- `OrdinaryAutomorphicFormsAndModularityLifting:R21.3/hecke-generation`: surjectivity of (3.6).
- `OrdinaryAutomorphicFormsAndModularityLifting:R21.4`: pro-modularity: primes of R_𝒟 through R_{𝒟^ps} → T.

**API.**

- `TauCeti.OrdinaryModularity.heckePseudoRep` (constructor): ρ^mod_m into T_∞(U, 𝒪)_m.
- `TauCeti.OrdinaryModularity.heckePseudoRep_trace` (characterisation): trace ρ^mod_m(Frob_ℓ) = T(ℓ).
- `TauCeti.OrdinaryModularity.pseudoToHecke` (constructor): (3.6) R_{𝒟^ps} → T_∞(U, 𝒪)_m for permissible m.
- `TauCeti.OrdinaryModularity.pseudoToHecke_lambda` (compatibility): (3.6) is Λ_𝒪-linear.

**Unit tests.**

- **heckePseudoRep_residual** (example): For permissible m, ρ^mod_m mod m = {1, χ, 0}.
- **heckePseudoRep_specialise** (example): Composing with T_∞(U, 𝒪)_m → T_∞/Q gives the pseudo-representation of ρ_Q.
- **pseudoToHecke_det** (example): (3.6) sends det ρ^ps(Frob_ℓ) to S(ℓ)Nm(ℓ).

**Construction or proof route.**

1. T_∞(U, 𝒪)_m ↪ ∏_{Q ⊆ m minimal} T_∞/Q (reduced), and the functions a, d, x of the ρ_Q land in the image because their values are determined by traces, which lie in T_∞(U, 𝒪)_m.
2. Permissibility makes the residual pseudo-representation ρ_0 = {1, χ, 0}.
3. The Λ_𝒪-structures agree: det ρ^mod_m(γ_j) = D(γ_j) and ψ_2(y) = T_y (R21.2/permissible-weight-algebra).

**Checks.**

- This is a pseudo-representation, not a representation, into T_∞(U, 𝒪)_m.

**Direct prerequisites:** `OrdinaryAutomorphicFormsAndModularityLifting:R21.3/hida-family-representation`; `OrdinaryAutomorphicFormsAndModularityLifting:R21.3/universal-pseudo-deformation`; `OrdinaryAutomorphicFormsAndModularityLifting:R21.3/deformation-iwasawa-algebra`; `OrdinaryAutomorphicFormsAndModularityLifting:R21.2/permissible-maximal-ideal`; `OrdinaryAutomorphicFormsAndModularityLifting:R21.2/permissible-weight-algebra`.

**Sources.**

- [Residually reducible representations and modular forms](http://www.numdam.org/item/PMIHES_1999__89__5_0.pdf), §3.3, p. 41 (Numdam PDF page 38; printed page = PDF page + 3). (3.5).
- [Residually reducible representations and modular forms](http://www.numdam.org/item/PMIHES_1999__89__5_0.pdf), §3.3, p. 41 (Numdam PDF page 38; printed page = PDF page + 3). (3.6).

### Permissible ideals are those with residual representation χ ⊕ 1

**Target:** `OrdinaryAutomorphicFormsAndModularityLifting:R21.3/permissible-residual-comparison` (lemma).

A maximal ideal m of T_∞(U, 𝒪) satisfies (3.9) (R21.2/permissible-maximal-ideal) iff m ∩ 𝒪[[G(U)]] is the ideal of G(U) → Z(U) --χω^{−1}--> k, T_0(𝔭_i) − 1 ∈ m for all i, and the residual pseudo-representation of ρ^mod_m is χ ⊕ 1. There is at most one permissible maximal ideal, and modulo it S(ℓ) ≡ χω^{−1}(Frob_ℓ) for ℓ ∤ 𝔫p.

**Hypotheses and conventions.**

- p odd, so 2-dimensional semisimple representations over k̄ are determined by traces and determinants.

**Construction or proof route.**

1. (3.9) gives trace ≡ 1 + χ on Frobenii; the first condition gives det ≡ χ (S(ℓ)Nm(ℓ) ≡ χω^{−1}(ℓ)ω(ℓ)); Chebotarev and Brauer–Nesbitt give ρ̄^ss ≅ χ ⊕ 1. The converse reads traces off.
2. Uniqueness: T_∞(U, 𝒪)_m is generated over Λ_𝒪 by T(ℓ), S(ℓ) (hecke-generation), whose residues are now fixed.

**Checks.**

- This closes the deferral in R21.2/permissible-maximal-ideal.

**Direct prerequisites:** `OrdinaryAutomorphicFormsAndModularityLifting:R21.3/hecke-pseudo-representation`; `OrdinaryAutomorphicFormsAndModularityLifting:R21.2/permissible-maximal-ideal`.

**Sources.**

- [Residually reducible representations and modular forms](http://www.numdam.org/item/PMIHES_1999__89__5_0.pdf), §3.3, p. 41 (Numdam PDF page 38; printed page = PDF page + 3). The first definition and uniqueness.

### Generation of T_m by Hecke operators and surjectivity of R_{𝒟^ps} → T_m

**Target:** `OrdinaryAutomorphicFormsAndModularityLifting:R21.3/hecke-generation` (theorem).

Let m be a permissible maximal ideal of T_∞(U, 𝒪) and S a finite set of primes containing those with U_ℓ ≠ GL₂(𝒪_{F,ℓ}). Then T_∞(U, 𝒪)_m is generated over Λ_𝒪 by {T(ℓ), S(ℓ) : ℓ ∉ S} (Lemma 3.11). Hence for V ⊆ U the map T_∞(V, 𝒪)_m → T_∞(U, 𝒪)_m is surjective (Corollary 3.12) and (3.6) R_{𝒟^ps} → T_∞(U, 𝒪)_m is surjective (Corollary 3.13).

**Hypotheses and conventions.**

- m permissible.

**Construction or proof route.**

1. T^S (the Λ_𝒪-subalgebra generated by T(ℓ), S(ℓ), ℓ ∉ S) is local complete; by Chebotarev and continuity it contains trace ρ^mod(σ) and det ρ^mod(σ) for all σ.
2. With g_i ∈ D_i, χ(g_i) ≠ 1, and α_i ≡ 1, β_i the roots of X² − trace ρ^mod(g_i)X + det ρ^mod(g_i) in T^S (Hensel): T_y = (β_i − α_i)^{−1}(β_i trace ρ^mod(σ_y) − trace ρ^mod(g_iσ_y)) and T_0(𝔭_i) = (β_i − α_i)^{−1}(β_i trace ρ^mod(τ_i) − trace ρ^mod(g_iτ_i)) lie in T^S; the source omits the inverse (E3).
3. These identities are checked at each ρ_Q (Q minimal) with (3.4)(vi), T_∞(U, 𝒪)_m being reduced.
4. Corollaries: generators of T_∞(U, 𝒪)_m come from level V and from R_{𝒟^ps} (trace and determinant of ρ^ps).

**Checks.**

- β_i − α_i ≡ χ(g_i) − 1 is a unit, so the corrected formula is legitimate in T^S.

**Direct prerequisites:** `OrdinaryAutomorphicFormsAndModularityLifting:R21.3/hecke-pseudo-representation`; `OrdinaryAutomorphicFormsAndModularityLifting:R21.3/deformation-iwasawa-algebra`.

**Sources.**

- [Residually reducible representations and modular forms](http://www.numdam.org/item/PMIHES_1999__89__5_0.pdf), §3.3, proof of Lemma 3.11, p. 42 (Numdam PDF page 39; printed page = PDF page + 3). Lemma 3.11's formulas for T_y and T_0(𝔭_i).
- [Residually reducible representations and modular forms](http://www.numdam.org/item/PMIHES_1999__89__5_0.pdf), §3.3, Lemma 3.11, p. 41 (Numdam PDF page 38; printed page = PDF page + 3). Lemma 3.11 follows (3.6) on this page.

### The level of a minimal prime is controlled by its local type

**Target:** `OrdinaryAutomorphicFormsAndModularityLifting:R21.3/level-type-control` (theorem).

(Proposition 3.14.) Let w ∤ p and U_w ⊇ {(a b; c d) : c, a − 1 ∈ ℓ_w^s} for some s. Each minimal prime Q of T_∞(U, 𝒪) descends to a prime at an enlarged level V containing U, with the following local-level conditions: (i) V_w ⊇ GL₂(𝒪_{F,w}) if ρ_Q is unramified at w; (ii) V ⊇ {c ∈ ℓ_w, a mod ℓ_w ∈ Δ_w} if ρ_Q is of type A; (iii) V ⊇ {a − 1, c ∈ ℓ_w^r} if of type B, ℓ_w^r the conductor of det ρ_Q|_{I_w}; (iv) V ⊇ {a − 1, c ∈ ℓ_w²} if of type C. (Proposition 3.15.) If ρ_Q|_{I_w} ≅ diag(φ, φ^{−1}) with φ of p-power order and U′ = ∏_{v≠w}U_v × U′_w, U′_w = {c ∈ ℓ_w, ad^{−1} mod ℓ_w ∈ Δ′_w}, there is a minimal Q′ ⊆ T_∞(U′, 𝒪) with ρ_{Q′} ≅ ρ_Q and the same inverse image in T_∞(U ∩ U′, 𝒪).

**Hypotheses and conventions.**

- w ∤ p; Δ_w the Sylow p-subgroup of (𝒪_F/ℓ_w)^× and Δ′_w a complement.

**Construction or proof route.**

1. ρ_P for P ∈ 𝒳(Q) has the same type as ρ_Q at w (through the pseudo-representation and irreducibility of ρ_P).
2. By Corollary 3.9 (PadicFamilies L5) it suffices that some λ ∈ ℋ(P) factors through level V, i.e. π ∈ Π^{n.o.}_2(V).
3. Local–global compatibility (3.3) and newform theory give a vector at w fixed by the required subgroup (Carayol's π_v ≅ π(σ_v), generalised in [W2]).
4. Proposition 3.15: ρ_P|_{I_w} ≅ diag(φ′, φ′^{−1}) with p-power order; π_w is principal series π(μ_1, μ_2) and a twisted new vector is U′_w-fixed.

**Checks.**

- The subgroups depend on the type; type B′ is handled by Proposition 3.15, not 3.14.

**Direct prerequisites:** `OrdinaryAutomorphicFormsAndModularityLifting:R21.3/hida-family-representation`; `OrdinaryAutomorphicFormsAndModularityLifting:R21.3/ramification-types`; `PadicFamilies:L5/algebraic-primes-dense`; `AutomorphicGaloisRepresentations:R19.4`.

**Sources.**

- [Residually reducible representations and modular forms](http://www.numdam.org/item/PMIHES_1999__89__5_0.pdf), §3.3, p. 42 (Numdam PDF page 39; printed page = PDF page + 3). Proposition 3.14.
- [Residually reducible representations and modular forms](http://www.numdam.org/item/PMIHES_1999__89__5_0.pdf), §3.3, p. 43 (Numdam PDF page 40; printed page = PDF page + 3). Proposition 3.15.

### Constraints on inertia characters at auxiliary levels

**Target:** `OrdinaryAutomorphicFormsAndModularityLifting:R21.3/inertia-character-constraints` (lemma).

(Lemma 3.16.) Let w ∤ p, Q a minimal prime and U_w ⊇ {c ∈ ℓ_w^r, a mod ℓ_w^r ∈ Δ_w}, r ≥ 1. (i) If ρ_Q|_{I_w} ≅ diag(φ_1, φφ_2) with φ_1, φ_2 of p-power order and φ nontrivial of order prime to p with conductor ℓ_w^r, then φ_1 and φ_2 are trivial. (ii) If ρ_Q|_{D_w} ≅ (εφ *; 0 φ) and (Nm(w) − 1, p) = 1, then φ|_{I_w} has finite order prime to p, and φ|_{I_w} = 1 if r = 1.

**Hypotheses and conventions.**

- w ∤ p; r ≥ 1.

**Construction or proof route.**

1. Reduce the characters modulo P ∈ 𝒳(Q) (orders are preserved) and compare conductors: (3.3) gives cond(π_w) = cond(φ_Pφ_{2,P})cond(φ_{1,P}), while the fixed vector gives cond(π_w) | ℓ_w^r and a central character of order prime to p on I_w.
2. (ii) cond(π_w) = max(ℓ_w, cond(φ_P)²) and the central character on I_w is φ_P².

**Checks.**

- Used to bound the Galois side at the auxiliary levels of §3.6.

**Direct prerequisites:** `OrdinaryAutomorphicFormsAndModularityLifting:R21.3/hida-family-representation`; `AutomorphicGaloisRepresentations:R19.4`.

**Sources.**

- [Residually reducible representations and modular forms](http://www.numdam.org/item/PMIHES_1999__89__5_0.pdf), §3.3, p. 44 (Numdam PDF page 41; printed page = PDF page + 3). Lemma 3.16.

### Twisting Hida families by finite characters

**Target:** `OrdinaryAutomorphicFormsAndModularityLifting:R21.3/family-twisting` (lemma).

(Lemma 3.17.) Let Q ⊆ 𝔭 be primes of T_∞(U, 𝒪) with Q minimal, R ⊆ L̄ a finite integral extension of T_∞(U, 𝒪)/Q and Ψ : Gal(F̄/F) → R^× of finite order. There are primes Q′ ⊆ 𝔭′ of T_∞(U ∩ U_1(cond^{(p)}(Ψ)²), 𝒪) with Q′ minimal, ρ_{Q′} ≅ ρ_Q ⊗ Ψ and ρ_{𝔭′} ≅ ρ_𝔭 ⊗ Ψ, cond^{(p)} the prime-to-p conductor.

**Hypotheses and conventions.**

- Ψ of finite order.

**Construction or proof route.**

1. For each P over 𝒳(Q), π ⊗ Ψ_P ∈ Π^{n.o.}_2(V_b) gives τ_P : T_∞(V, 𝒪) → R/P with (3.7): T(ℓ) ↦ T(ℓ)Ψ_P(Frob_ℓ), S(ℓ) ↦ S(ℓ)Ψ_P²(Frob_ℓ), S_x ↦ S_xΨ_P²(x), T_y ↦ T_yΨ_P(y), and T_0(𝔭_i) ↦ T_0(𝔭_i)Ψ_P(λ^{(𝔭_i)}_{𝔭_i}) (the source prints the inverse, E4).
2. The product map lands in the diagonal image of R, giving τ : T_∞(V, 𝒪) → R with (3.8); Q′ = ker τ is minimal by dimension, and 𝔭′ is the kernel through R/𝔭_1.

**Checks.**

- Twisting changes the level only at the prime-to-p conductor of Ψ (squared).

**Direct prerequisites:** `OrdinaryAutomorphicFormsAndModularityLifting:R21.3/hida-family-representation`; `OrdinaryAutomorphicFormsAndModularityLifting:R21.2/nearly-ordinary-hecke-algebra-comparison`.

**Sources.**

- [Residually reducible representations and modular forms](http://www.numdam.org/item/PMIHES_1999__89__5_0.pdf), §3.3, Lemma 3.17, p. 45 (Numdam PDF page 42; printed page = PDF page + 3). Lemma 3.17 and (3.7).

### Dimension of the reducible and diagonal loci

**Target:** `OrdinaryAutomorphicFormsAndModularityLifting:R21.3/reducible-locus-dimension` (lemma).

(Lemmas 2.7–2.9.) With R^red_𝒟 = R_𝒟/I (I generated by the lower-left entries c_σ in a basis with ρ_𝒟(z_1) = diag(1, −1)) the universal reducible deformation ring: dim R^red_𝒟 ≤ 1 + 2δ_F + dim_k H_Σ(F, k); if q ⊆ R_𝒟 contains p, ρ_𝒟 mod q is reducible and its determinant has finite order, then dim R_𝒟/q ≤ δ_F + dim_k H_Σ(F, k). For the universal diagonal deformation (φ_1 0; 0 φ_2) of 1 ⊕ χ of type (𝒪, Σ), dim R^diag ≤ 1 + 2δ_F, and ≤ δ_F modulo a prime containing p with det of finite order.

**Construction or proof route.**

1. Write G = Gal(L(Σ)(χ)/F) ≅ Δ × Γ × ℤ_p^{δ_F} (Γ a finite p-group) and A = ℤ_p[[G]]; reducible deformations factor through the maximal abelian pro-p extension M of L(Σ)(χ) unramified outside Σ∖𝒫 on which Δ acts through χ^{−1}.
2. H = Gal(M/L(Σ)(χ)) is an A-module generated by m = dim_k H_Σ(F, k) elements; a presentation 𝔞 → ⊕Ae_i ↠ H with e_m ↦ an element with ρ_c = (1 u; 0 1), u ≠ 0, gives the explicit universal reducible deformation over B ⊗̂ A_2 (Skinner–Wiles p. 17), from which the dimension bounds are read.

**Checks.**

- These bounds are what make the reducible locus of small codimension after the base changes of §4.6.

**Direct prerequisites:** `OrdinaryAutomorphicFormsAndModularityLifting:R21.3/deformation-of-type`; `OrdinaryAutomorphicFormsAndModularityLifting:R21.3/global-presentation-bound`; `PadicFamilies:L5/totally-real-weight-algebra`.

**Sources.**

- [Residually reducible representations and modular forms](http://www.numdam.org/item/PMIHES_1999__89__5_0.pdf), §2.2, p. 15 (Numdam PDF page 12; printed page = PDF page + 3). §2.2 opening (the text layer reads ρ_c as 'p,').
- [Residually reducible representations and modular forms](http://www.numdam.org/item/PMIHES_1999__89__5_0.pdf), §2.2, Lemmas 2.7–2.9, p. 17 (Numdam PDF page 14; printed page = PDF page + 3). Lemmas 2.7–2.9.

### Deformation data for an absolutely irreducible nearly ordinary ρ₀

**Target:** `OrdinaryAutomorphicFormsAndModularityLifting:R21.3/irreducible-deformation-datum` (definition).

Let F be totally real of degree d, p odd, v_1, …, v_t the places above p with decomposition groups D_i, and k finite of characteristic p. A residual representation ρ₀ : Gal(F̄/F) → GL₂(k) satisfies (2.1) if (i) ρ₀ is absolutely irreducible; (ii) det ρ₀(z_i) = −1 for every complex conjugation z_i; (iii) ρ₀|_{D_i} ≅ (χ^{(i)}_1 *; 0 χ^{(i)}_2) with χ^{(i)}_1 ≠ χ^{(i)}_2 for every i (the extension may be nonsplit; when it splits a labelling is fixed); (iv) if ρ₀ is ramified at v ∤ p∞ then ρ₀|_{D_v} ≅ (1 *; 0 ω^{−1}). A deformation datum is 𝒟 = (𝒪, Σ, ℳ): 𝒪 the integers of a local field with residue field k, Σ a finite set of finite places containing 𝒫 = {v_1, …, v_t} and the places where ρ₀ ramifies, and ℳ ⊆ Σ ∖ 𝒫 a set of places where ρ₀ ramifies; Σ₀ = 𝒫 ∪ {ramified places}, ℳ₀ = Σ₀ ∖ 𝒫 and 𝒟₀ = (𝒪, Σ₀, ℳ₀) is the minimal datum. A deformation ρ : Gal(F̄/F) → GL₂(A) is of type 𝒟 if A is an 𝒪-algebra, ρ is unramified outside Σ and ∞, ρ|_{D_i} ≅ (ψ^{(i)}_1 *; 0 ψ^{(i)}_2) with ψ^{(i)}_1 ≡ χ^{(i)}_1 mod m_A, and ρ|_{I_w} ≅ (1 *; 0 1) for w ∈ ℳ. The universal deformation of type 𝒟 is ρ_𝒟 : Gal(F_Σ/F) → GL₂(R_𝒟). For Q disjoint from Σ, type 𝒟_Q allows ramification at Q with det ρ unramified there, giving R_{𝒟_Q}; 𝒟_Q-minimality (det ρ trivial on the torsion N_Σ of Gal(L_Σ/F)) gives R^min_{𝒟_Q}, and (2.2) R_{𝒟_Q} ≅ R^min_{𝒟_Q} ⊗_𝒪 𝒪[N_Σ], ρ_{𝒟_Q} ≅ ρ^min_{𝒟_Q} ⊗ Ψ_Σ. For Σ ⊆ Σ′ and ℳ′ ⊆ ℳ the natural map R_{𝒟′} ↠ R_𝒟 is a map of Λ_𝒪-algebras (the Λ_𝒪-structure of R21.3/deformation-iwasawa-algebra, with T_i ↦ det ρ_𝒟(γ_i) − 1 and Y^{(i)}_j ↦ ψ^{(i)}_2(y^{(i)}_j) − 1).

**Hypotheses and conventions.**

- p odd; ω is the mod-p cyclotomic character, unramified at v ∤ p, so (iv) gives ρ₀|_{I_v} ≅ (1 *; 0 1) and the ℳ-condition lifts it
- unlike R21.3/deformation-datum there is no extension class c and no residual χ ⊕ 1: ρ₀ is fixed and absolutely irreducible, and ρ₀|_{D_i} may be nonsplit

**Uses.**

- `OrdinaryAutomorphicFormsAndModularityLifting:R21.3/irreducible-presentation-bound`: the presentation of R_𝒟 (Proposition 2.1).
- `OrdinaryAutomorphicFormsAndModularityLifting:R21.3/irreducible-hecke-surjection`: ρ^mod_{𝒟_Q} is of type 𝒟_Q (Proposition 3.4).
- `OrdinaryAutomorphicFormsAndModularityLifting:R21.4/irreducible-pro-modularity`: every prime of R_𝒟 is pro-modular (Proposition 4.1).
- `OrdinaryAutomorphicFormsAndModularityLifting:R21.5/nearly-ordinary-irreducible-lifting`: ρ|_{G_L} is of type 𝒟_L = (𝒪, Σ_L, ∅).

**API.**

- `TauCeti.OrdinaryModularity.IrreducibleResidual` (structure): ρ₀ with the conditions (2.1)(i)–(iv) and the labelling χ^{(i)}_1, χ^{(i)}_2.
- `TauCeti.OrdinaryModularity.IrreducibleDatum` (structure): 𝒟 = (𝒪, Σ, ℳ), with 𝒟₀ = (𝒪, Σ₀, ℳ₀).
- `TauCeti.OrdinaryModularity.IsOfIrreducibleType` (data): The conditions of type 𝒟 (and 𝒟_Q) on a lift.
- `TauCeti.OrdinaryModularity.irreducibleUniversalRing` (constructor): R_𝒟 with ρ_𝒟.
- `TauCeti.OrdinaryModularity.irreducibleUniversalRing_represents` (universal-property): R_𝒟 pro-represents deformations of type 𝒟.
- `TauCeti.OrdinaryModularity.irreducibleUniversalRing_min` (equivalence): (2.2): R_{𝒟_Q} ≅ R^min_{𝒟_Q} ⊗_𝒪 𝒪[N_Σ].

**Unit tests.**

- **isOfIrreducibleType_residual** (example): ρ₀ over k is of type 𝒟.
- **isOfIrreducibleType_wrong_sub** (example): For ρ₀|_{D_i} nonsplit, a lift whose D_i-stable line reduces to the χ^{(i)}_2-line does not exist; for ρ₀|_{D_i} split, the lift with the labels exchanged is not of type 𝒟.
- **irreducibleUniversalRing_shrink** (example): For Σ ⊆ Σ′ and ℳ′ ⊆ ℳ the map R_{𝒟′} ↠ R_𝒟 is surjective and Λ_𝒪-linear.
- **irreducibleResidual_dihedral_allowed** (example): An induced ρ₀ = Ind_{F′}^F ψ₀ satisfying (2.1) is allowed: (2.1) does not exclude dihedral ρ₀.

**Construction or proof route.**

1. Absolute irreducibility makes the deformation functor pro-representable (Mazur; GlobalGaloisDeformations R04.2).
2. The type-𝒟 conditions are deformation conditions: the nearly ordinary condition at v_i is the ordered-flag condition with the χ^{(i)}_1-line as sub (LocalGaloisDeformationRings L8), and ρ|_{I_w} ≅ (1 *; 0 1) is stable under fibre products.
3. Type 𝒟_Q and minimality exactly as in Skinner–Wiles 1999 §2.3 (R21.3/deformation-of-type): N_Σ is a finite p-group and p is odd, so ρ^min ⊗ Ψ_Σ is universal for type 𝒟_Q.

**Checks.**

- Check that ρ₀ itself is of type 𝒟 for every 𝒟 (the closed point of R_𝒟).
- Reuse R21.3/deformation-of-type's minimal-twist construction; only the residual data change.

**Direct prerequisites:** `OrdinaryAutomorphicFormsAndModularityLifting:R21.3/deformation-of-type`; `OrdinaryAutomorphicFormsAndModularityLifting:R21.3/deformation-iwasawa-algebra`; `GlobalGaloisDeformations:R04.2/universal-deformation-ring`; `LocalGaloisDeformationRings:L8`.

**Sources.**

- [Nearly ordinary deformations of irreducible residual representations](http://www.numdam.org/item/AFST_2001_6_10_1_185_0.pdf), §2, (2.1) and the definition of deformation data, p. 188 (Numdam PDF page 5; printed page = PDF page + 183). Conditions (2.1), deformation data and the type-𝒟 conditions (continued on p. 189).
- [Nearly ordinary deformations of irreducible residual representations](http://www.numdam.org/item/AFST_2001_6_10_1_185_0.pdf), §2, p. 189 (Numdam PDF page 6; printed page = PDF page + 183). The universal deformation ρ_𝒟 (the OCR reads [M1] as [Ml]).
- [Nearly ordinary deformations of irreducible residual representations](http://www.numdam.org/item/AFST_2001_6_10_1_185_0.pdf), §2, (2.2), p. 190 (Numdam PDF page 7; printed page = PDF page + 183). Minimal deformations and R_{𝒟_Q} ≅ R^min_{𝒟_Q} ⊗ 𝒪[N_Σ].

### The presentation of R_𝒟 for irreducible ρ₀ (Proposition 2.1)

**Target:** `OrdinaryAutomorphicFormsAndModularityLifting:R21.3/irreducible-presentation-bound` (theorem).

(Proposition 2.1.) For every deformation datum 𝒟 = (𝒪, Σ, ℳ) relative to F and ρ₀ there are integers g and r with R_𝒟 ≅ 𝒪[[x_1, …, x_g]]/(f_1, …, f_r) and g − r ≥ d + δ_F − 2t − 3·#ℳ, where δ_F is the ℤ_p-rank of the Galois group of the maximal abelian pro-p extension of F.

**Hypotheses and conventions.**

- the bound is the one of R21.3/global-presentation-bound (Skinner–Wiles 1999 Proposition 2.4)
- the local nearly ordinary rings at the v_i may come from a nonsplit ρ₀|_{D_i}; Skinner–Wiles say they are analysed as in their 1999 Corollary 2.3 (the split case), which is requested from LocalGaloisDeformationRings L8

**Construction or proof route.**

1. Skinner–Wiles omit the proof as essentially that of their 1999 Proposition 2.4: Mazur's presentation bounds g and r by h¹ and h² of ad ρ₀ with the local conditions, and the global Euler characteristic of the odd ρ₀ (ArithmeticGaloisDuality R02.3) gives the bound.
2. The only change is the universal nearly ordinary ring of ρ₀|_{D_i} when it is nonsplit (LocalGaloisDeformationRings L8), whose relative dimension enters as in the split case.

**Checks.**

- Compare with R21.3/global-presentation-bound: the same numerical bound, with the residual data of R21.3/irreducible-deformation-datum.

**Direct prerequisites:** `OrdinaryAutomorphicFormsAndModularityLifting:R21.3/irreducible-deformation-datum`; `OrdinaryAutomorphicFormsAndModularityLifting:R21.3/global-presentation-bound`; `LocalGaloisDeformationRings:L8`; `GlobalGaloisDeformations:R04.3`; `ArithmeticGaloisDuality:R02.3`.

**Sources.**

- [Nearly ordinary deformations of irreducible residual representations](http://www.numdam.org/item/AFST_2001_6_10_1_185_0.pdf), §2, Proposition 2.1, p. 189 (Numdam PDF page 6; printed page = PDF page + 183). The remark that the proof is that of Skinner–Wiles 1999 Proposition 2.4, with the nonsplit local case.
- [Nearly ordinary deformations of irreducible residual representations](http://www.numdam.org/item/AFST_2001_6_10_1_185_0.pdf), §2, Proposition 2.1, p. 189 (Numdam PDF page 6; printed page = PDF page + 183). Proposition 2.1 (the presentation and the bound are displayed below it).

### Dihedral deformations and the dimension of the dihedral locus (Lemma 2.2)

**Target:** `OrdinaryAutomorphicFormsAndModularityLifting:R21.3/dihedral-deformation-dimension` (lemma).

A deformation ρ of ρ₀ is dihedral if ρ|_{Gal(F̄/F′)} factors through an abelian quotient for some quadratic F′/F; equivalently for some abelian L/F (2.3)(i), and only if ρ₀ is dihedral (2.3)(ii), which determines F′. If ρ₀ = Ind_{F′}^F ψ₀ (2.4), with ψ₀ distinct from its conjugate ψ₀′, every dihedral deformation is Ind_{F′}^F Ψ with Ψ ≡ ψ₀. With Γ_Σ = Gal(L′_Σ/F′) (L′_Σ the maximal abelian pro-p extension of F′ unramified outside Σ), ψ the projection onto Γ_Σ and Ψ_Σ = ψ̃₀ψ : Gal(F_Σ/F′) → 𝒪[[Γ_Σ]]^×, Ind_{F′}^F Ψ_Σ is the universal dihedral deformation of type (𝒪, Σ, ℳ) when every place above p splits in F′ and ℳ = ∅, and surjects onto it otherwise. Let δ⁻_{F′} be the ℤ_p-rank of the summand of Γ_Σ on which Gal(F′/F) acts by −1. (Lemma 2.2, first inequality.) If q ⊆ R_𝒟 is a prime containing p with ρ_𝒟 mod q dihedral of finite-order determinant, then dim R_𝒟/q ≤ δ⁻_{F′}. (Second inequality.) If F′ is totally real, δ⁻_{F′} ≤ d/2. If F′ is CM, δ⁻_{F′} = d, and the bound dim R_𝒟/q ≤ d/2 printed in Lemma 2.2 fails when every place above p splits in F′ and ℳ = ∅ (source issue OrdinaryAutomorphicFormsAndModularityLifting/E11).

**Hypotheses and conventions.**

- Skinner–Wiles assert the Waldschmidt-derived bound δ⁻_{F′} ≤ d/2 without restricting the signature of F′; [Wal] is absent from their bibliography and is Skinner–Wiles 1999's [Wal] (Waldschmidt), a gap of this roadmap
- for F′ totally real the minus part of the units of F′ has ℤ-rank d, and Waldschmidt's bound (p-adic rank at least half the rank) gives δ⁻_{F′} ≤ d/2
- for F′ CM the minus part of the units is finite, while the minus part of the local units at the places above p has ℤ_p-rank d, so δ⁻_{F′} = d

**Construction or proof route.**

1. A dihedral ρ over a domain A of characteristic p with det ρ of finite order is Ind Ψ with ΨΨ′ of finite order, so Ψ = ψ̃₀·ψ⁻ with ψ⁻ factoring (up to a finite group) through the minus part of Γ_Σ.
2. R_𝒟/q is topologically generated by traces (R21.3/irreducible-trace-generation), which lie in the image of k′[[Γ_Σ⁻]]; hence dim R_𝒟/q ≤ δ⁻_{F′}.
3. Class field theory: rank Γ_Σ = [F′ : ℚ] − (p-adic rank of the units of F′) (up to the Leopoldt defect of F on the plus side); split into ± parts under Gal(F′/F).
4. Counterexample to the printed d/2 for CM F′, all v | p split, ℳ = ∅: Ind(ψ̃₀ψ⁻) over k[[Γ_Σ⁻]] is of type 𝒟 (nearly ordinary at each split v_i as Ψ|_{D_w} ⊕ Ψ|_{D_w̄}), has finite-order determinant, and its trace ring has dimension d.

**Checks.**

- The totally real case is the one Skinner–Wiles' citation covers; do not use the d/2 bound for CM F′.
- Check the CM rank count on a small case: F = ℚ, F′ imaginary quadratic, δ⁻ = 1 > 1/2.

**Direct prerequisites:** `OrdinaryAutomorphicFormsAndModularityLifting:R21.3/irreducible-deformation-datum`; `OrdinaryAutomorphicFormsAndModularityLifting:R21.3/irreducible-trace-generation`; `DiophantineApproximationAndTranscendence:DT.3`.

**Sources.**

- [Nearly ordinary deformations of irreducible residual representations](http://www.numdam.org/item/AFST_2001_6_10_1_185_0.pdf), §2, (2.3)–(2.4), p. 190 (Numdam PDF page 7; printed page = PDF page + 183). Dihedral deformations, (2.3) and (2.4).
- [Nearly ordinary deformations of irreducible residual representations](http://www.numdam.org/item/AFST_2001_6_10_1_185_0.pdf), §2, before Lemma 2.2, p. 191 (Numdam PDF page 8; printed page = PDF page + 183). The printed bound δ⁻_{F′} ≤ d/2 (source issue E11).
- [Nearly ordinary deformations of irreducible residual representations](http://www.numdam.org/item/AFST_2001_6_10_1_185_0.pdf), §2, Lemma 2.2, p. 191 (Numdam PDF page 8; printed page = PDF page + 183). Lemma 2.2.

### R_{𝒟_Q} is generated over Λ_𝒪 by traces of Frobenius (Lemma 2.3)

**Target:** `OrdinaryAutomorphicFormsAndModularityLifting:R21.3/irreducible-trace-generation` (lemma).

(Lemma 2.3.) If 𝒟_Q = (𝒪, Σ, ℳ)_Q is any augmented deformation datum and S is any finite set of places containing Σ ∪ Q, then R_{𝒟_Q} is generated as a Λ_𝒪-algebra by {trace ρ_{𝒟_Q}(Frob_ℓ) : ℓ ∉ S}.

**Hypotheses and conventions.**

- ρ₀ absolutely irreducible (2.1)(i)

**Construction or proof route.**

1. Carayol: for absolutely irreducible ρ₀ the universal deformation is defined over the closed subring generated by its traces (GlobalGaloisDeformations R04.2/carayol-trace-theorem), so the universal property forces R_{𝒟_Q} to be that subring.
2. Chebotarev: the Frobenius elements at ℓ ∉ S are dense, so their traces generate the trace ring topologically; the Λ_𝒪-structure only adds the variables T_i and Y^{(i)}_j.

**Checks.**

- This is the irreducible-residual replacement for the pseudo-representation arguments of R21.3/matrix-entry-subring; no pseudo-deformation ring is needed.

**Direct prerequisites:** `OrdinaryAutomorphicFormsAndModularityLifting:R21.3/irreducible-deformation-datum`; `GlobalGaloisDeformations:R04.2/carayol-trace-theorem`.

**Sources.**

- [Nearly ordinary deformations of irreducible residual representations](http://www.numdam.org/item/AFST_2001_6_10_1_185_0.pdf), §2, Lemma 2.3, p. 192 (Numdam PDF page 9; printed page = PDF page + 183). Lemma 2.3 and its source (Carayol).
- [Nearly ordinary deformations of irreducible residual representations](http://www.numdam.org/item/AFST_2001_6_10_1_185_0.pdf), §2, end, p. 191 (Numdam PDF page 8; printed page = PDF page + 183). The Λ_𝒪-structure on R_𝒟 and R_{𝒟_Q} (as in Skinner–Wiles 1999 §2.5).

### The Galois representation over T_∞(U, 𝒪)_m for irreducible ρ_m

**Target:** `OrdinaryAutomorphicFormsAndModularityLifting:R21.3/integral-hecke-galois-representation` (construction).

Assume (H_even): [F : ℚ] is even. For a maximal ideal m of T_∞(U, 𝒪) (R21.1/quaternionic-nearly-ordinary-hecke-algebra) there is ρ_{U,m} : Gal(F̄/F) → GL₂(T_∞(U, 𝒪)_m ⊗_{Λ′_𝒪} F_{Λ′_𝒪}) satisfying the properties (3.2) of R21.3/hida-family-representation without 'mod Q'. If the residual representation ρ_m is irreducible, then in a suitable basis ρ_{U,m} takes values in GL₂(T_∞(U, 𝒪)_m), and T_∞(U, 𝒪)_m is a Λ_𝒪-algebra through 1 + T_i ↦ det ρ_{U,m}(γ_i) and 1 + Y^{(i)}_j ↦ T_{y^{(i)}_j}, with Λ_𝒪 finite and free over Λ′_𝒪. (Lemma 3.3.) (i) For any finite S ⊇ Σ(U) (the places w with U_w ≠ GL₂(𝒪_{F,w}), together with 𝒫), T_∞(U, 𝒪)_m is generated over Λ_𝒪 by {T(ℓ) : ℓ ∉ S}; (ii) if U is sufficiently small, M_∞(U)_m and M⁺_∞(U)_m are free Λ_𝒪-modules of equal rank.

**Hypotheses and conventions.**

- (H_even) is needed for the definite quaternionic modules of R21.1
- U sufficiently small means U ⊆ U₁(ℓ_1 ⋯ ℓ_s) for unramified primes as in Skinner–Wiles 1999 Corollary 3.6

**Uses.**

- `OrdinaryAutomorphicFormsAndModularityLifting:R21.3/irreducible-permissible-hecke-rings`: ρ^mod_{𝒟_Q} is ρ_{U,m} at U = U_{𝒟_Q}.
- `OrdinaryAutomorphicFormsAndModularityLifting:R21.3/irreducible-hecke-surjection`: the Λ_𝒪-structure and trace generation (Lemma 3.3(i)).
- `OrdinaryAutomorphicFormsAndModularityLifting:R21.4/irreducible-nice-prime-r-equals-t`: freeness of M_∞(U)_m (Lemma 3.3(ii)).

**API.**

- `TauCeti.OrdinaryModularity.heckeGaloisRep` (constructor): ρ_{U,m} over T_∞(U, 𝒪)_m when ρ_m is irreducible.
- `TauCeti.OrdinaryModularity.heckeGaloisRep_trace` (characterisation): trace ρ_{U,m}(Frob_ℓ) = T(ℓ) for ℓ ∤ 𝔫p.
- `TauCeti.OrdinaryModularity.heckeGaloisRep_det` (characterisation): det ρ_{U,m}(Frob_ℓ) = S(ℓ)Nm(ℓ) and det ρ_{U,m}(x) = S_xε(x) for x ∈ Z(U).
- `TauCeti.OrdinaryModularity.heckeGaloisRep_ordinary` (characterisation): ρ_{U,m}|_{D_i} ≅ (ψ^{(i)}_1 *; 0 ψ^{(i)}_2) with ψ^{(i)}_2(y) = T_y and ψ^{(i)}_2(λ_{𝔭_i}) = T_0(𝔭_i).
- `TauCeti.OrdinaryModularity.heckeLocal_lambdaAlgebra` (instance): The Λ_𝒪-algebra structure on T_∞(U, 𝒪)_m.
- `TauCeti.OrdinaryModularity.heckeLocal_generated` (characterisation): Lemma 3.3(i): generation by T(ℓ), ℓ ∉ S.

**Unit tests.**

- **heckeGaloisRep_residual** (example): ρ_{U,m} mod m is ρ_m.
- **heckeGaloisRep_specialise** (example): At an algebraic prime P ⊇ the minimal prime, ρ_{U,m} mod P is ρ_π for the π of Proposition 3.2.
- **heckeLocal_generated_enlarge** (example): Enlarging S keeps the generation statement (fewer generators, same algebra).
- **lambda_over_lambda_prime_free** (example): Λ_𝒪 is free of rank p^{Σ r_i} over Λ′_𝒪 (compare source issue E1).

**Construction or proof route.**

1. Glue the ρ_Q of R21.3/hida-family-representation over the minimal primes Q of T_∞(U, 𝒪)_m to a representation over the total ring of fractions.
2. If ρ_m is irreducible, the traces lie in T_∞(U, 𝒪)_m and Carayol's theorem (Wiles 1995, pp. 482–483; GlobalGaloisDeformations R04.2/carayol-trace-theorem) gives an integral model.
3. Lemma 3.3(i) as Skinner–Wiles 1999 Lemma 3.11 (R21.3/hecke-generation), with traces in place of the pseudo-representation; (ii) from (i) and PadicFamilies L5/hida-freeness.

**Checks.**

- Integrality is claimed only when ρ_m is irreducible; for residually reducible m use R21.3/hecke-pseudo-representation.

**Direct prerequisites:** `OrdinaryAutomorphicFormsAndModularityLifting:R21.3/hida-family-representation`; `OrdinaryAutomorphicFormsAndModularityLifting:R21.1/quaternionic-nearly-ordinary-hecke-algebra`; `OrdinaryAutomorphicFormsAndModularityLifting:R21.3/hecke-generation`; `GlobalGaloisDeformations:R04.2/carayol-trace-theorem`; `PadicFamilies:L5/hida-freeness`; `PadicFamilies:L5/hida-hecke-finite`.

**Sources.**

- [Nearly ordinary deformations of irreducible residual representations](http://www.numdam.org/item/AFST_2001_6_10_1_185_0.pdf), §3, (H_even), p. 193 (Numdam PDF page 10; printed page = PDF page + 183). The hypothesis (H_even).
- [Nearly ordinary deformations of irreducible residual representations](http://www.numdam.org/item/AFST_2001_6_10_1_185_0.pdf), §3, before Lemma 3.3, p. 195 (Numdam PDF page 12; printed page = PDF page + 183). The integral model of ρ_{U,m} for irreducible ρ_m.
- [Nearly ordinary deformations of irreducible residual representations](http://www.numdam.org/item/AFST_2001_6_10_1_185_0.pdf), §3, Lemma 3.3, p. 195 (Numdam PDF page 12; printed page = PDF page + 183). Lemma 3.3.

### Permissible levels U_{𝒟_Q}, (H_def) and the Hecke rings T_{𝒟_Q}

**Target:** `OrdinaryAutomorphicFormsAndModularityLifting:R21.3/irreducible-permissible-hecke-rings` (construction).

A maximal ideal m of T_∞(U, 𝒪) is permissible if ρ_m ≅ ρ₀ and T_0(𝔭_i) − χ^{(i)}_2(λ_{𝔭_i}) ∈ m for 1 ≤ i ≤ t (it is then unique; the uniformisers λ_{𝔭_i} are chosen with (χ^{(i)}_1/χ^{(i)}_2)(λ_{𝔭_i}) ≠ 1). For an augmented datum 𝒟_Q = (𝒪, Σ, ℳ)_Q let U_{𝒟_Q} = ∏_{w∤∞} U_{𝒟_Q,w} with U_{𝒟_Q,w} = GL₂(𝒪_{F,w}) for w ∉ Σ ∖ 𝒫 ∪ Q; {(a b; c d) : c, a − 1 ∈ ℓ_w²} for w ∈ Σ ∖ (𝒫 ∪ ℳ); {c ∈ ℓ_w, a mod ℓ_w ∈ Δ_w} for w ∈ ℳ; and {c ∈ ℓ_w, ad^{−1} mod ℓ_w ∈ Δ′_w} for w ∈ Q, where Δ_w is the Sylow p-subgroup of (𝒪_F/ℓ_w)^× and Δ′_w a complement. (H_def): T_∞(U_{𝒟₀}, 𝒪) has a permissible maximal ideal; then so does every T_∞(U_{𝒟_Q}, 𝒪). Put T_{𝒟_Q} = T_∞(U_{𝒟_Q}, 𝒪)_m, T_𝒟 = T_{𝒟_∅}, and ρ^mod_{𝒟_Q} the representation of R21.3/integral-hecke-galois-representation in a basis with ρ^mod_{𝒟_Q} mod m = ρ₀. The T_{𝒟_Q}-modules M_{𝒟_Q}, M⁺_{𝒟_Q} are those of Skinner–Wiles 1999 after Lemma 3.25 with ℳ_c replaced by ℳ₀ and r(w) = 1 (localisations of M_∞(U^min_{𝒟_Q}), M⁺_∞(U^min_{𝒟_Q}) at m), with the commuting action of Δ_Q = ∏_{w∈Q} Δ_w, generators δ_w and σ_w ∈ I_w mapping to δ_w; T^min_{𝒟_Q} is the quotient of Skinner–Wiles 1999 §3.6 (essentially the largest reduced quotient through which R_{𝒟_Q} → T_{𝒟_Q} factors via R^min_{𝒟_Q}), with the 𝒟_Q-minimal ρ^mod_{𝒟^min_Q}.

**Hypotheses and conventions.**

- (H_even) and (H_def)

**Uses.**

- `OrdinaryAutomorphicFormsAndModularityLifting:R21.3/irreducible-hecke-surjection`: the target of r_{𝒟_Q}.
- `OrdinaryAutomorphicFormsAndModularityLifting:R21.3/irreducible-minimal-hecke-quotient`: T^min_{𝒟_Q} and M_{𝒟_Q} (Lemma 3.5).
- `OrdinaryAutomorphicFormsAndModularityLifting:R21.4/irreducible-nice-prime-r-equals-t`: the patching modules M^{(N)}_a are built from M_{𝒟_Q}.

**API.**

- `TauCeti.OrdinaryModularity.IsPermissibleIrr` (data): ρ_m ≅ ρ₀ and T_0(𝔭_i) ≡ χ^{(i)}_2(λ_{𝔭_i}).
- `TauCeti.OrdinaryModularity.permissibleIrr_unique` (characterisation): A permissible maximal ideal is unique.
- `TauCeti.OrdinaryModularity.levelOfDatum` (constructor): U_{𝒟_Q} from 𝒟_Q.
- `TauCeti.OrdinaryModularity.heckeOfDatum` (constructor): T_{𝒟_Q} = T_∞(U_{𝒟_Q}, 𝒪)_m with ρ^mod_{𝒟_Q}.
- `TauCeti.OrdinaryModularity.heckeModuleOfDatum` (constructor): M_{𝒟_Q}, M⁺_{𝒟_Q} with the Δ_Q-action.
- `TauCeti.OrdinaryModularity.heckeMinOfDatum` (constructor): T^min_{𝒟_Q} and ρ^mod_{𝒟^min_Q}.

**Unit tests.**

- **levelOfDatum_mono** (example): U_{𝒟_Q} ⊆ U_{𝒟₀} for every 𝒟_Q.
- **levelOfDatum_empty** (example): For Q = ∅ and Σ = Σ₀, ℳ = ℳ₀ the level is U_{𝒟₀}.
- **permissibleIrr_residual** (example): ρ^mod_{𝒟_Q} mod m = ρ₀ in the chosen basis.
- **delta_action_commutes** (example): The Δ_w-actions for different w ∈ Q commute with each other and with T_{𝒟_Q}.

**Construction or proof route.**

1. U_{𝒟_Q} ⊆ U_{𝒟₀}, so a permissible maximal ideal at level U_{𝒟₀} pulls back to every U_{𝒟_Q}.
2. Uniqueness of m: ρ_m ≅ ρ₀ fixes the T(ℓ) mod m, and T_0(𝔭_i) mod m is fixed as χ^{(i)}_2(λ_{𝔭_i}) (the other root χ^{(i)}_1(λ_{𝔭_i}) is distinct by the choice of λ_{𝔭_i}).
3. The modules and T^min are Skinner–Wiles 1999's (R21.2/deformation-hecke-rings) with the stated substitutions.

**Checks.**

- (H_def) is an assumption here; Theorem 5.1 obtains it after base change from Skinner–Wiles, Base change and a problem of Serre (a gap).

**Direct prerequisites:** `OrdinaryAutomorphicFormsAndModularityLifting:R21.3/integral-hecke-galois-representation`; `OrdinaryAutomorphicFormsAndModularityLifting:R21.3/irreducible-deformation-datum`; `OrdinaryAutomorphicFormsAndModularityLifting:R21.2/deformation-hecke-rings`; `OrdinaryAutomorphicFormsAndModularityLifting:R21.2/permissible-maximal-ideal`.

**Sources.**

- [Nearly ordinary deformations of irreducible residual representations](http://www.numdam.org/item/AFST_2001_6_10_1_185_0.pdf), §3, permissible maximal ideals, p. 195 (Numdam PDF page 12; printed page = PDF page + 183). Permissibility and uniqueness.
- [Nearly ordinary deformations of irreducible residual representations](http://www.numdam.org/item/AFST_2001_6_10_1_185_0.pdf), §3, U_{𝒟_Q} and (H_def), p. 196 (Numdam PDF page 13; printed page = PDF page + 183). The groups U_{𝒟_Q}, (H_def) and T_{𝒟_Q}.
- [Nearly ordinary deformations of irreducible residual representations](http://www.numdam.org/item/AFST_2001_6_10_1_185_0.pdf), §3, after Proposition 3.4, p. 197 (Numdam PDF page 14; printed page = PDF page + 183). The modules M_{𝒟_Q}, M⁺_{𝒟_Q}.
- [Nearly ordinary deformations of irreducible residual representations](http://www.numdam.org/item/AFST_2001_6_10_1_185_0.pdf), §3, T^min_{𝒟_Q}, p. 198 (Numdam PDF page 15; printed page = PDF page + 183). T^min_{𝒟_Q}.

### ρ^mod_{𝒟_Q} is of type 𝒟_Q and R_{𝒟_Q} ↠ T_{𝒟_Q} (Proposition 3.4)

**Target:** `OrdinaryAutomorphicFormsAndModularityLifting:R21.3/irreducible-hecke-surjection` (theorem).

(Proposition 3.4.) Under (H_even) and (H_def), ρ^mod_{𝒟_Q} is a deformation of ρ₀ of type 𝒟_Q, and the corresponding map r_{𝒟_Q} : R_{𝒟_Q} → T_{𝒟_Q} is a surjection of Λ_𝒪-algebras.

**Hypotheses and conventions.**

- (H_even) and (H_def); ρ₀ absolutely irreducible

**Construction or proof route.**

1. For each minimal prime P of T_{𝒟_Q} put ρ_P = ρ^mod_{𝒟_Q} mod P. det ρ_P is unramified at w ∈ Q: reduce modulo algebraic primes and use local–global compatibility (Proposition 3.2 = PadicFamilies L5/hida-control-nearly-ordinary; AutomorphicGaloisRepresentations R19.4).
2. At v_i: choose σ_i ∈ D_i mapping to λ_{𝔭_i}; in a basis with ρ_P(σ_i) = diag(α, β), α ≡ χ^{(i)}_1(λ_{𝔭_i}), (3.2)(vi) and T_0(𝔭_i) − χ^{(i)}_2(λ_{𝔭_i}) ∈ m give ρ_P|_{D_i} ≅ (ψ^{(i)}_1 *; 0 ψ^{(i)}_2) with ψ^{(i)}_2 ≡ χ^{(i)}_2.
3. At w ∈ ℳ: at algebraic points ρ_π|_{D_w} is unramified or of Type A (R21.3/ramification-types) by the level U_{𝒟_Q,w}; the argument of Skinner–Wiles 1999 Proposition 3.13 (R21.3/level-type-control) transfers this to ρ_P ⊗ L; ρ₀ ramified at w excludes unramified, so (ρ_P ⊗ L)|_{I_w} ≅ (1 *; 0 1) with * ≠ 0. For σ ∈ I_w a generator of pro-p tame inertia, (σ − 1)² kills a free rank-two R-lattice M, N = M/M[σ − 1] reduces to a one-dimensional quotient of ρ₀, so N ≅ R and M[σ − 1] ≅ R, giving ρ_P|_{I_w} ≅ (1 *; 0 1) integrally.
4. The maps r_P : R_{𝒟_Q} → T_{𝒟_Q}/P assemble to r_{𝒟_Q} : R_{𝒟_Q} → ∏_P T_{𝒟_Q}/P (3.3); its image is T_{𝒟_Q} because traces of Frobenius map to the T(ℓ) (R21.3/irreducible-trace-generation and Lemma 3.3(i)).
5. The induced representation into GL₂(T_{𝒟_Q}) agrees with ρ^mod_{𝒟_Q} modulo every minimal prime, so they are equal (T_{𝒟_Q} reduced); hence ρ^mod_{𝒟_Q} is of type 𝒟_Q.

**Checks.**

- The surjection is onto the full Hecke ring, not only onto a trace subring; compare R21.3/hecke-generation, which in the reducible case goes through pseudo-deformations.

**Direct prerequisites:** `OrdinaryAutomorphicFormsAndModularityLifting:R21.3/irreducible-permissible-hecke-rings`; `OrdinaryAutomorphicFormsAndModularityLifting:R21.3/irreducible-trace-generation`; `OrdinaryAutomorphicFormsAndModularityLifting:R21.3/level-type-control`; `OrdinaryAutomorphicFormsAndModularityLifting:R21.3/ramification-types`; `PadicFamilies:L5/hida-control-nearly-ordinary`; `AutomorphicGaloisRepresentations:R19.4`.

**Sources.**

- [Nearly ordinary deformations of irreducible residual representations](http://www.numdam.org/item/AFST_2001_6_10_1_185_0.pdf), §3, Proposition 3.2, p. 194 (Numdam PDF page 11; printed page = PDF page + 183). Proposition 3.2 (Hida), used at algebraic primes (the OCR reads Hida [H1] as [HI]).
- [Nearly ordinary deformations of irreducible residual representations](http://www.numdam.org/item/AFST_2001_6_10_1_185_0.pdf), §3, proof of Proposition 3.4, p. 196 (Numdam PDF page 13; printed page = PDF page + 183). The unramified determinant at Q.
- [Nearly ordinary deformations of irreducible residual representations](http://www.numdam.org/item/AFST_2001_6_10_1_185_0.pdf), §3, end of the proof of Proposition 3.4, p. 197 (Numdam PDF page 14; printed page = PDF page + 183). The end of the proof.

### T_{𝒟_Q} ≅ T^min_{𝒟_Q} ⊗ 𝒪[N_Σ] and the trace at auxiliary primes (Lemma 3.5)

**Target:** `OrdinaryAutomorphicFormsAndModularityLifting:R21.3/irreducible-minimal-hecke-quotient` (lemma).

(Lemma 3.5.) (i) There is an isomorphism T_{𝒟_Q} ≅ T^min_{𝒟_Q} ⊗_𝒪 𝒪[N_Σ] compatible with r_{𝒟_Q}, r^min_{𝒟_Q} and (2.2). (ii) T^min_{𝒟_Q} is a finite, reduced, torsion-free Λ_𝒪-algebra. (iii) For each w ∈ Q, trace ρ^mod_{𝒟^min_Q}(σ_w) acts on M_{𝒟_Q} and M⁺_{𝒟_Q} as δ_w + δ_w^{−1}. The map r^min_{𝒟_Q} : R^min_{𝒟_Q} → T^min_{𝒟_Q} is surjective by Proposition 3.4.

**Hypotheses and conventions.**

- (H_even) and (H_def)

**Construction or proof route.**

1. From the definition of T^min_{𝒟_Q} and the arguments of Skinner–Wiles 1999 Proposition 3.23 and Lemmas 3.21 and 3.25 (R21.2/minimal-hecke-ring-decomposition, R21.2/auxiliary-trace-identity).
2. Surjectivity of r^min from R21.3/irreducible-hecke-surjection and (2.2).

**Checks.**

- (iii) is the identity the patching argument uses to make M_{𝒟_Q} a module over 𝒪[[s_1, …, s_r]] through s_i = δ_{w_i} − 1 compatibly with t_i = trace(ρ(σ_{w_i})) − 2.

**Direct prerequisites:** `OrdinaryAutomorphicFormsAndModularityLifting:R21.3/irreducible-permissible-hecke-rings`; `OrdinaryAutomorphicFormsAndModularityLifting:R21.3/irreducible-hecke-surjection`; `OrdinaryAutomorphicFormsAndModularityLifting:R21.2/minimal-hecke-ring-decomposition`; `OrdinaryAutomorphicFormsAndModularityLifting:R21.2/auxiliary-trace-identity`.

**Sources.**

- [Nearly ordinary deformations of irreducible residual representations](http://www.numdam.org/item/AFST_2001_6_10_1_185_0.pdf), §3, Lemma 3.5, p. 198 (Numdam PDF page 15; printed page = PDF page + 183). Lemma 3.5(ii) (the OCR reads Λ_𝒪 as Ao).

### Ordinary local tangent conditions on the Hecke side

**Target:** `OrdinaryAutomorphicFormsAndModularityLifting:R21.3/ordinary-local-tangent-hecke-comparison` (theorem).

Let k have odd characteristic, V = k² with a continuous G_v-action and a chosen stable line L; write χ₁,χ₂ for the characters of L and V/L and assume χ₁ ≠ χ₂. Put b⁰ = {a ∈ ad⁰(V) : a(L) ⊆ L}. The tangent space of fixed-determinant nearly ordinary deformations, with the line allowed to lift, maps isomorphically onto ker(H¹(G_v,ad⁰(V)) → H¹(G_v,Hom(L,V/L))). If the quotient character on inertia is fixed, the tangent space is the image of ker(H¹(G_v,b⁰) → H¹(I_v,k)), where the last map is restriction followed by the action on V/L. A fixed-determinant arithmetic specialization of the ordinary Hecke-family representation factors through this local deformation condition; its tangent map therefore lands in this subspace. No equality with the Hecke tangent space is asserted before an R=T theorem.

**Hypotheses and conventions.**

- χ₁ and χ₂ are distinct as G_v-characters, not necessarily as inertia characters.
- For the fixed-inertia variant, the prescribed quotient agrees with the residual quotient; use continuous cohomology and strict equivalence.
- The Hecke specialization has the integral ordinary line and the required quotient-character inertia from the family Galois construction.
- Require an actual integral Hecke representation at this specialization (for example the absolutely irreducible residual case), or a representation obtained by the explicit pseudo-deformation lifting. The residually reducible Hecke pseudo-representation alone is not such a representation.

**Construction or proof route.**

1. The sequence 0 → b⁰ → ad⁰(V) → Hom(L,V/L) → 0 describes the first-order failure of line stability. Distinct characters give H⁰(G_v,Hom(L,V/L)) = 0, so its long cohomology sequence gives the tangent identification.
2. A first-order change of the quotient character is a k-valued cocycle. Fixing its inertia is precisely the kernel of its restriction to I_v.
3. Apply the ordinary local–global description of the Hecke family and the deformation-to-Hecke map. At auxiliary primes use the selected ramification-type tangent condition and the local duality contract instead of imposing an ordinary condition.

**Checks.**

- For a residual split pair, verify the forbidden lower-left cocycle is exactly Hom(L,V/L).
- Distinguish nearly ordinary variable-inertia deformations from ordinary fixed-inertia specializations.
- Do not apply the smoothness theorem when the residual ratio is cyclotomic; the split versal ring can have a relation.

**Direct prerequisites:** `OrdinaryAutomorphicFormsAndModularityLifting:R21.3/hida-family-representation`; `OrdinaryAutomorphicFormsAndModularityLifting:R21.3/hecke-pseudo-representation`; `OrdinaryAutomorphicFormsAndModularityLifting:R21.3/inertia-character-constraints`; `ArithmeticGaloisDuality:R02.5`; `LocalGaloisDeformationRings:L7/ordinary-condition-fixed-inertial-characters`; `OrdinaryAutomorphicFormsAndModularityLifting:R21.3/integral-hecke-galois-representation`; `OrdinaryAutomorphicFormsAndModularityLifting:R21.3/pseudo-deformation-lifting`.

**Sources.**

- [Residually reducible representations and modular forms](http://www.numdam.org/item/PMIHES_1999__89__5_0.pdf), §3.3, Lemma 3.11 and Corollary 3.13, pp. 43–45; §8.3, (8.8)–(8.10), pp. 113–114. Local conditions on the family and the Selmer tangent embedding.

### The determinant–flag comparison used by ordinary families

**Target:** `OrdinaryAutomorphicFormsAndModularityLifting:R21.3/ordinary-determinant-flag-contract` (comparison).

For the local rank-two rings of LocalGaloisDeformationRings L8, take trivial residual representation and d_v = [F_v:ℚ_p] > 4. Over the weight-space open subset U where the two universal characters are distinct, the flag-ordinary and determinant-ordinary spectra coincide inside the framed deformation spectrum. Each weight-space component is dominated by exactly one determinant-ordinary component, of dimension 5 + 3d_v; any other component lies over the equal-character locus and has dimension at most 3 + 3d_v. Ordinary family arguments may use these assertions on points and components. They do not provide an isomorphism of the nonreduced representing rings or equality of their Artinian deformation functors.

**Hypotheses and conventions.**

- Import the local definitions and comparison, including their scheme-theoretic conventions, from L8.
- The trivial residual representation and d_v > 4 are essential to this contract; it is not the p-distinguished Skinner–Wiles local setup.

**Construction or proof route.**

1. Specialize the supplier’s n-dimensional comparison to n = 2.
2. For each global family application restrict the weight map to U and record whether only a point, an underlying spectrum or a component is being compared.
3. Keep residual equal-character and nonreduced-coefficient questions outside this conclusion.

**Checks.**

- At n = 2 the degree threshold is d_v > 4, and the dimensions are 5 + 3d_v and at most 3 + 3d_v.
- A comparison over k[η]/(η²) must not be inferred from equality of spectra.

**Direct prerequisites:** `LocalGaloisDeformationRings:L8/determinant-flag-comparison`; `OrdinaryAutomorphicFormsAndModularityLifting:R21.3/deformation-iwasawa-algebra`.

**Sources.**

- [Potential automorphy over CM fields](https://arxiv.org/abs/1812.09999), §6.2, Proposition 6.2.12 and proof, pp. 1036–1037 (author PDF pp. 140–141). Local determinant/flag comparison and component dimensions.

## R21.4. Ordinary R=T and modularity lifting

The patching target is arithmetic verification and application of the algebra owner’s theorem. The ring isomorphisms are localized/completed at the primes stated below; they do not silently become unrestricted global R=T.

### Pro-modular primes and components of R_𝒟

**Target:** `OrdinaryAutomorphicFormsAndModularityLifting:R21.4/pro-modular-prime` (definition).

Let F have even degree, L_p(F, −1, χω) not a unit (so T_𝒟 exists), and 𝒟^ps = (𝒪, Σ). A prime q of R_𝒟 is pro-modular if φ_q : R_{𝒟^ps} → R_𝒟/q, the map of the pseudo-deformation of ρ_𝒟 mod q, factors through π_𝒟 : R_{𝒟^ps} ↠ T_𝒟, i.e. φ_q = θ_q ∘ π_𝒟 (4.1) for some θ_q : T_𝒟 → R_𝒟/q; then θ_q(T(ℓ)) = trace ρ_𝒟(Frob_ℓ) mod q for ℓ ∉ Σ. A deformation is pro-modular if its kernel is. If q is pro-modular so is every 𝔭 ⊇ q; a component of Spec R_𝒟 is pro-modular if its minimal prime is.

**Hypotheses and conventions.**

- F of even degree; L_p(F, −1, χω) ∈ 𝒪 not a unit.

**Uses.**

- `OrdinaryAutomorphicFormsAndModularityLifting:R21.4/pro-modularity-key-proposition`: the conclusion of Proposition 4.1.
- `OrdinaryAutomorphicFormsAndModularityLifting:R21.5`: Theorems A and B deduce modularity from pro-modularity.

**API.**

- `TauCeti.OrdinaryModularity.IsProModular` (data): φ_q factors through π_𝒟.
- `TauCeti.OrdinaryModularity.IsProModular.of_le` (characterisation): Pro-modularity passes to larger primes.
- `TauCeti.OrdinaryModularity.IsProModularComponent` (data): The minimal prime of the component is pro-modular.
- `TauCeti.OrdinaryModularity.IsProModular.trace` (characterisation): θ_q(T(ℓ)) = trace ρ_𝒟(Frob_ℓ) mod q.

**Unit tests.**

- **isProModular_maximal** (example): The maximal ideal of R_𝒟 is pro-modular: ρ_0 = {1, χ, 0} is the residual pseudo-representation of T_𝒟 at the permissible m.
- **isProModular_specialise** (example): If a minimal prime is pro-modular, every prime of its component is.
- **isProModular_not_representation** (example): Pro-modularity of q says nothing about the extension class of ρ_𝒟 mod q; two ρ_c with the same traces are both pro-modular or both not.

**Construction or proof route.**

1. Specialisation: if q ⊆ 𝔭, compose θ_q with R_𝒟/q ↠ R_𝒟/𝔭.

**Checks.**

- Pro-modularity is a statement about pseudo-deformations (traces), which is all that the Hecke side sees in the residually reducible case.

**Direct prerequisites:** `OrdinaryAutomorphicFormsAndModularityLifting:R21.2/deformation-hecke-rings`; `OrdinaryAutomorphicFormsAndModularityLifting:R21.3/pseudo-to-deformation-map`.

**Sources.**

- [Residually reducible representations and modular forms](http://www.numdam.org/item/PMIHES_1999__89__5_0.pdf), §4.1, p. 61 (Numdam PDF page 58; printed page = PDF page + 3). Pro-modular primes, (4.1).
- [Residually reducible representations and modular forms](http://www.numdam.org/item/PMIHES_1999__89__5_0.pdf), §4.1, p. 62 (Numdam PDF page 59; printed page = PDF page + 3). Specialisation and pro-modular components.

### Good pairs, nice primes and the properties (P1), (P2)

**Target:** `OrdinaryAutomorphicFormsAndModularityLifting:R21.4/good-pair-and-nice-primes` (definition).

(F, 𝒟) is good if d is even; L_p(F, −1, χω) ∈ 𝒪 ∖ 𝒪^×; d > 2 + δ_F + 8(#Σ + dim_k H_{Σ_0}(F, k)); d_{v_i} > 2 + 2t + 7(#Σ + dim_k H_{Σ_0}(F, k)) for every v_i | p; and, for w ∤ p with ρ_c|_{I_w} ≠ 1, either χ|_{I_w} ≠ 1 or χ|_{D_w} = 1. A nice deformation (§2.3) is one over a one-dimensional domain of characteristic p, of type 𝒟_c, with ψ^{(i)}_1/ψ^{(i)}_2 of infinite order at each v_i. A dimension-one prime 𝔭 of T_𝒟 is nice for 𝒟 if ρ_𝔭 is irreducible, 𝔭 comes from T_{𝒟_c}, the class c′ of Lemma 2.13 for ρ_𝔭 is a scalar multiple of c, and a conjugate of the associated ρ is a nice deformation of type (𝒪′, Σ, c, ℳ); then R_𝒟 → A gives the nice prime 𝔭_𝒟. A prime of R_𝒟 is good if ρ_𝒟 mod 𝔭 is nice, and nice if moreover it is the inverse image of a pro-modular prime of R_{𝒟_c}. (P1): for every prime 𝔭 ⊆ T_𝒟 nice for 𝒟, every Q ⊆ 𝔭_𝒟 is pro-modular. (P2): R_{𝒟_c} has a pro-modular prime whose deformation is nice.

**Hypotheses and conventions.**

- Σ_0 is the set of places where χ ramifies, with 𝒫; 𝒟_c = (𝒪, Σ_c, c, ℳ_c) as in §2.3.

**Uses.**

- `OrdinaryAutomorphicFormsAndModularityLifting:R21.4/pro-modularity-key-proposition`: the hypotheses of Proposition 4.1.
- `OrdinaryAutomorphicFormsAndModularityLifting:R21.5`: (P1) for all data (Proposition 8.4) and (P2) (Proposition 4.2).

**API.**

- `TauCeti.OrdinaryModularity.IsGoodPair` (data): The five conditions on (F, 𝒟).
- `TauCeti.OrdinaryModularity.IsNiceDeformation` (data): One-dimensional, characteristic p, type 𝒟_c, ψ_1/ψ_2 of infinite order.
- `TauCeti.OrdinaryModularity.IsNiceFor` (data): A prime of T_𝒟 nice for 𝒟.
- `TauCeti.OrdinaryModularity.PropertyP1` (data): (P1).
- `TauCeti.OrdinaryModularity.PropertyP2` (data): (P2).
- `TauCeti.OrdinaryModularity.IsGoodPair.mono` (characterisation): (F, 𝒟) good and Σ′ ⊆ Σ ⇒ (F, 𝒟′) good.

**Unit tests.**

- **isGoodPair_degree_bound** (example): d must exceed 2 + δ_F + 8(#Σ + dim H_{Σ_0}): for F = ℚ (d = 1) no datum is good, which is why §4.6 base changes to large even-degree F.
- **isGoodPair_local_degree** (example): Each d_{v_i} must exceed 2 + 2t + 7(#Σ + dim H_{Σ_0}), so p must be highly ramified or inert in F.
- **isNiceDeformation_characteristic** (example): A nice deformation lives in characteristic p: in characteristic 0 the definition does not apply.

**Construction or proof route.**

1. For 𝔭 of dimension one with ρ_𝔭 irreducible, Lemma 2.13 gives ρ over the normalisation A of T_𝒟/𝔭 deforming some ρ_{c′}; (3.4) and permissibility (T_0(𝔭_i) ≡ 1) force ρ|_{D_i} to be split or (ψ_1 *; 0 ψ_2) with ψ_2 ≡ 1, so c′ is admissible and ρ is of type (𝒪′, Σ, c′, ∅).

**Checks.**

- Goodness is preserved by shrinking Σ but not by base change; §4.6 exploits that a base change can become good.

**Direct prerequisites:** `OrdinaryAutomorphicFormsAndModularityLifting:R21.4/pro-modular-prime`; `OrdinaryAutomorphicFormsAndModularityLifting:R21.3/lattice-reduction-lemma`; `OrdinaryAutomorphicFormsAndModularityLifting:R21.3/hida-family-representation`; `OrdinaryAutomorphicFormsAndModularityLifting:R21.3/deformation-of-type`.

**Sources.**

- [Residually reducible representations and modular forms](http://www.numdam.org/item/PMIHES_1999__89__5_0.pdf), §4.2, p. 62 (Numdam PDF page 59; printed page = PDF page + 3). Good pairs.
- [Residually reducible representations and modular forms](http://www.numdam.org/item/PMIHES_1999__89__5_0.pdf), §4.2, p. 63 (Numdam PDF page 60; printed page = PDF page + 3). Nice primes and (P1).
- [Residually reducible representations and modular forms](http://www.numdam.org/item/PMIHES_1999__89__5_0.pdf), §4.2, p. 63 (Numdam PDF page 60; printed page = PDF page + 3). (P2).

### Components of A/(f_1, …, f_r) meet in large dimension

**Target:** `OrdinaryAutomorphicFormsAndModularityLifting:R21.4/raynaud-connectedness-corollary` (lemma).

(Corollary A.2.) Let A be a local Cohen–Macaulay ring of dimension d and I = (f_1, …, f_r) with r ≤ d − 2. If the set of irreducible components of Spec(A/I) is partitioned into two nonempty sets 𝒞_1 ⊔ 𝒞_2, there are C_1 ∈ 𝒞_1 and C_2 ∈ 𝒞_2 with C_1 ∩ C_2 containing a prime of dimension d − r − 1.

**Hypotheses and conventions.**

- A local Cohen–Macaulay; r ≤ d − 2.

**Construction or proof route.**

1. Proposition A.1 (Raynaud, Corollaire 4.2): Spec(A/I) ∖ {m_A} is connected (recorded as a gap).
2. Induction on d − r: for d − r = 2 this is the proposition; otherwise pick a one-dimensional 𝔭 in C′_1 ∩ C′_2 and pass to A_𝔭 (Cohen–Macaulay of dimension d − 1), where the decomposition stays nontrivial.

**Checks.**

- The linchpin of the Main Theorem: it produces pro-modular and non-pro-modular components meeting in large dimension.

**Direct prerequisites:** `mathlib:IsLocalRing`; `DeformationAndDerivedPatchingAlgebra:R03.6`.

**Sources.**

- [Residually reducible representations and modular forms](http://www.numdam.org/item/PMIHES_1999__89__5_0.pdf), Appendix A, Corollary A.2, p. 123 (Numdam PDF page 120; printed page = PDF page + 3). Proposition A.1 and Corollary A.2.
- [Residually reducible representations and modular forms](http://www.numdam.org/item/PMIHES_1999__89__5_0.pdf), Appendix A, proof of Corollary A.2, p. 123 (Numdam PDF page 120; printed page = PDF page + 3). The proof.

### The key proposition: every prime of R_𝒟 is pro-modular

**Target:** `OrdinaryAutomorphicFormsAndModularityLifting:R21.4/pro-modularity-key-proposition` (theorem).

(Proposition 4.1.) Let 𝒟 be a deformation datum for F. If (F, 𝒟) is good and (P1) and (P2) hold for 𝒟 and 𝒟_c, then every prime of R_𝒟 is pro-modular.

**Hypotheses and conventions.**

- (F, 𝒟) good; (P1) and (P2) for 𝒟 and 𝒟_c.

**Construction or proof route.**

1. Case 𝒟 = 𝒟_c, step one: a component containing a nice prime is pro-modular by (P1); with (P2) some component is.
2. Step two: if a non-pro-modular component C_2 existed, Proposition 2.4 and Corollary A.2 give C_1 pro-modular with C_1 ∩ C_2 ⊇ Q of dimension d − 2t + δ_F − 3#ℳ_c; a minimal Q_1 over (Q, p, det ρ(γ_i) − 1) has dimension ≥ d − 2t − 3#ℳ_c − 1 > 1 + δ_F + (#Σ + dim H_{Σ_0}) by (G), so ρ mod Q_1 is irreducible (Lemma 2.6 with Lemmas 2.7–2.8).
3. Q_1 is pro-modular; by Corollary 2.12 (printed 'Proposition 2.12', E5) dim T/Q^mod_1 ≥ dim R/Q_1, and T is integral over Λ_𝒪; if Q^mod_1 contained all Y^{(i)}_j then dim ≤ d − d_i, contradicting (G), so some Y^{(i)}_1 ∉ Q_1.
4. A one-dimensional 𝔭 ⊇ Q_1 avoiding c_{σ_0} and the Y^{(i)}_1 is nice (ψ_2(y_1) = 1 + Y_1 of infinite order and det = χ), hence C_2 is pro-modular by step one: contradiction.
5. General 𝒟: good primes of R_𝒟 come from nice primes of R_{𝒟_c}, so components with a good prime are pro-modular; a minimal Q with a minimal Q_2 over (Q, I_2) of dimension ≥ d − 7#Σ − 1 lies in a good prime.

**Checks.**

- The argument is dimension counting under (G); no R = T isomorphism is claimed at this stage.

**Direct prerequisites:** `OrdinaryAutomorphicFormsAndModularityLifting:R21.4/good-pair-and-nice-primes`; `OrdinaryAutomorphicFormsAndModularityLifting:R21.4/raynaud-connectedness-corollary`; `OrdinaryAutomorphicFormsAndModularityLifting:R21.3/global-presentation-bound`; `OrdinaryAutomorphicFormsAndModularityLifting:R21.3/pseudo-deformation-localisation`; `OrdinaryAutomorphicFormsAndModularityLifting:R21.3/matrix-entry-subring`; `OrdinaryAutomorphicFormsAndModularityLifting:R21.3/hecke-generation`; `OrdinaryAutomorphicFormsAndModularityLifting:R21.3/deformation-iwasawa-algebra`; `PadicFamilies:L5/hida-hecke-finite`.

**Sources.**

- [Residually reducible representations and modular forms](http://www.numdam.org/item/PMIHES_1999__89__5_0.pdf), §4.3, Proposition 4.1, p. 63 (Numdam PDF page 60; printed page = PDF page + 3). Proposition 4.1.
- [Residually reducible representations and modular forms](http://www.numdam.org/item/PMIHES_1999__89__5_0.pdf), §4.3, proof of Proposition 4.1, p. 64 (Numdam PDF page 61; printed page = PDF page + 3). The step citing Corollary 2.12 (E5).
- [Residually reducible representations and modular forms](http://www.numdam.org/item/PMIHES_1999__89__5_0.pdf), §4.3, end of the proof, p. 66 (Numdam PDF page 63; printed page = PDF page + 3). The end of the proof.

### A criterion for property (P2)

**Target:** `OrdinaryAutomorphicFormsAndModularityLifting:R21.4/p2-criterion` (theorem).

(Proposition 4.2.) Let 𝒟 = (𝒪, Σ, c, ℳ) be a deformation datum. If (F, 𝒟) is a good pair and (P1) holds for every datum (𝒪′, Σ′, c′, ℳ′) with Σ′ ⊆ Σ and 𝒪′ ⊇ 𝒪, then (P2) holds for 𝒟.

**Hypotheses and conventions.**

- (F, 𝒟) good; (P1) for all data with smaller Σ and larger 𝒪.

**Uses.**

- `OrdinaryAutomorphicFormsAndModularityLifting:R21.4/main-theorem`: (P2) for base-changed data.

**Construction or proof route.**

1. Step one: for 𝒟_0 = (𝒪′, Σ_0, c_0, ℳ_0) (Σ_0 the ramification of χ with 𝒫), T_χ = T_∞(U^χ, 𝒪)_m exists (Proposition 3.18, printed 3.14: E6); for a minimal prime Q of T_χ/(p, T_1, …, T_{δ_F}) the pseudo-representation has x ≢ 0 (otherwise a diagonal deformation, and Lemma 2.9 would give d ≤ 1 + δ_F, contradicting (G)); a one-dimensional 𝔭 ⊇ Q avoiding x(σ_0, τ_0) and the Y^{(i)}_1 gives, by Corollary 2.14, a nice pro-modular deformation of type 𝒟_0.
2. If c is a multiple of c_0 this gives (P2) for 𝒟_c. Otherwise let 𝒟_1 = (𝒪′, Σ_c, c_0, ℳ_1); (P2) for 𝒟_0 and (P1) with Proposition 4.1 make every prime of R_{𝒟_1} pro-modular.
3. Step two: cut R_{𝒟_1} by s − 2 linear conditions killing c and c_0 on generators of Gal(F_0(χ)/F(χ)) and by det ρ(γ_ℓ) − 1; by (G), (4.2) and Proposition 2.4 every minimal prime has dimension > δ_F + dim H_{Σ_c} (4.3), so ρ is irreducible there (Lemma 2.6). The reducible deformation with cocycle c_0 + cX gives a one-dimensional 𝔭; with A^tr = T_{𝒟_1}/Q^mod, a height-one P_0 ⊇ Σβ_i x(σ_i, ·) exists; Lemma 2.9 and Corollary 2.12 (printed Proposition 2.12: E5) exclude x ⊆ P_0, and (G) gives Y^{(i)}_1 ∉ P_0.
4. A one-dimensional 𝔭_1 ⊇ P_0 avoiding x(σ′, τ′) and the Y^{(i)}_1 gives ρ_1 (Corollary 2.14) with c_1 = c up to scalar, hence a deformation of type (𝒪, Σ_c, c, ∅).
5. Step three: ρ_1 is of type 𝒟_c (each w ∈ ℳ_c has χ|_{I_w} ≠ 1 or χ|_{D_w} = ω^{−1} = 1, (4.4); type B′ is impossible in characteristic p), and the prime 𝔭_2 of R_{𝒟_c} is pro-modular: Lemma 3.16, twisting (Lemma 3.17), the levels U′, U″ (4.8), Lemma 3.15 and Proposition 3.20 show 𝔭_3 comes from T_{𝒟_c}.

**Checks.**

- The proof builds a pro-modular nice prime for 𝒟_c from the Eisenstein ideal of χ; this is where the p-adic L-function hypothesis of (G) enters.

**Direct prerequisites:** `OrdinaryAutomorphicFormsAndModularityLifting:R21.4/good-pair-and-nice-primes`; `OrdinaryAutomorphicFormsAndModularityLifting:R21.4/pro-modularity-key-proposition`; `OrdinaryAutomorphicFormsAndModularityLifting:R21.2/eisenstein-ideal-existence`; `OrdinaryAutomorphicFormsAndModularityLifting:R21.3/hecke-generation`; `OrdinaryAutomorphicFormsAndModularityLifting:R21.3/lattice-reduction-lemma`; `OrdinaryAutomorphicFormsAndModularityLifting:R21.3/reducible-locus-dimension`; `OrdinaryAutomorphicFormsAndModularityLifting:R21.3/global-presentation-bound`; `OrdinaryAutomorphicFormsAndModularityLifting:R21.3/matrix-entry-subring`; `OrdinaryAutomorphicFormsAndModularityLifting:R21.3/pseudo-deformation-localisation`; `OrdinaryAutomorphicFormsAndModularityLifting:R21.3/level-type-control`; `OrdinaryAutomorphicFormsAndModularityLifting:R21.3/inertia-character-constraints`; `OrdinaryAutomorphicFormsAndModularityLifting:R21.3/family-twisting`; `OrdinaryAutomorphicFormsAndModularityLifting:R21.2/characteristic-p-primes-auxiliary`; `PadicFamilies:L5/hida-hecke-finite`.

**Sources.**

- [Residually reducible representations and modular forms](http://www.numdam.org/item/PMIHES_1999__89__5_0.pdf), §4.4, Proposition 4.2, p. 66 (Numdam PDF page 63; printed page = PDF page + 3). Proposition 4.2 and step one (E6).
- [Residually reducible representations and modular forms](http://www.numdam.org/item/PMIHES_1999__89__5_0.pdf), §4.4, proof of Proposition 4.2, p. 69 (Numdam PDF page 66; printed page = PDF page + 3). Step two (E5).
- [Residually reducible representations and modular forms](http://www.numdam.org/item/PMIHES_1999__89__5_0.pdf), §4.4, end of the proof, p. 73 (Numdam PDF page 70; printed page = PDF page + 3). Step three.

### Property (P1) holds for every deformation datum

**Target:** `OrdinaryAutomorphicFormsAndModularityLifting:R21.4/property-p1` (theorem).

(Proposition 8.4.) If F has even degree and 𝒟 is a deformation datum for F, then (P1) holds for 𝒟: for every prime 𝔭 of T_𝒟 nice for 𝒟, every prime Q ⊆ 𝔭_𝒟 of R_𝒟 is pro-modular.

**Hypotheses and conventions.**

- F of even degree.

**Construction or proof route.**

1. Let Q ⊆ 𝔭_𝒟 be minimal, ρ = ρ_𝒟 mod Q and R = R_𝒟/Q. Choose a p-power-order ψ with χ̃^{−1}det(ρ ⊗ ψ) trivial on N_Σ; the kernel Q_1 of R_𝒟 → R for ρ ⊗ ψ factors through R^min_𝒟 and lies in 𝔭_𝒟.
2. Q_1 is pro-modular by Proposition 8.1 (nice-prime-r-equals-t: R̃^min_𝒟 ≅ T̃^min_𝒟 at nice primes).
3. Lemma 3.17 twists back: cond^{(p)}(ψ) is square-free and supported on Σ∖ℳ, so U_𝒟 ⊆ U_1(cond^{(p)}(ψ)²) and ρ is pro-modular; primes contained in 𝔭_𝒟 follow.

**Checks.**

- The substance is Proposition 8.1; this node only records the reduction to the minimal case.

**Direct prerequisites:** `OrdinaryAutomorphicFormsAndModularityLifting:R21.4/good-pair-and-nice-primes`; `OrdinaryAutomorphicFormsAndModularityLifting:R21.2/deformation-hecke-rings`; `OrdinaryAutomorphicFormsAndModularityLifting:R21.3/family-twisting`; `OrdinaryAutomorphicFormsAndModularityLifting:R21.3/deformation-of-type`; `OrdinaryAutomorphicFormsAndModularityLifting:R21.4/nice-prime-r-equals-t`.

**Sources.**

- [Residually reducible representations and modular forms](http://www.numdam.org/item/PMIHES_1999__89__5_0.pdf), §8, Proposition 8.4, p. 123 (Numdam PDF page 120; printed page = PDF page + 3). Proposition 8.4 and its proof.

### Skinner–Wiles Main Theorem

**Target:** `OrdinaryAutomorphicFormsAndModularityLifting:R21.4/main-theorem` (theorem).

Let F be totally real (any degree), 𝒟 = (𝒪, Σ, c, ℳ) a deformation datum for F and ρ : Gal(F_Σ/F) → GL₂(𝒪) a deformation of type 𝒟 with ρ irreducible, det ρ = ψε^μ (μ ≥ 1, ψ of finite order) and ρ|_{D_i} ≅ (χ̃ψ^{(i)}_1 *; 0 ψ^{(i)}_2) with ψ^{(i)}_2|_{I_i} of finite order for each i. If there is a totally real L/F with (i) solvable Galois closure over F, (ii) [L : ℚ] even, (iii) L permissible for 𝒟 and (iv) (L, 𝒟_L) good, then ρ ⊗ Q̄_p is the representation of a Hilbert modular newform.

**Hypotheses and conventions.**

- The four conditions on L; ρ irreducible.

**Uses.**

- `OrdinaryAutomorphicFormsAndModularityLifting:R21.5/theorem-a`: reduction of Theorem A.
- `OrdinaryAutomorphicFormsAndModularityLifting:R21.5/theorem-b`: reduction of Theorem B.

**Construction or proof route.**

1. ρ_1 = ρ|_{Gal(F̄/L)} is of type 𝒟_L (permissibility). (P1) holds for all data over L (Proposition 8.4, L of even degree), so Propositions 4.1 and 4.2 make ρ_1 pro-modular: some λ : T_{𝒟_L} → 𝒪 induces its pseudo-representation.
2. λ satisfies the hypotheses of Proposition 3.7 (det and the local shape), giving a Hilbert newform f_1 over L with trace ρ_1(Frob_ℓ) = λ(T(ℓ)) (4.10); ρ_{f_1} (Wiles, (3.2)) has the same traces (4.11); ρ irreducible and odd makes ρ_1 irreducible, so ρ_1 ⊗ Q̄_p ≅ ρ_{f_1}.
3. Solvable base change for Hilbert modular forms ([GL]) descends f_1 to f over F with ρ_f|_{G_L} ≅ ρ_{f_1}; a finite character φ with ρ_f ⊗ φ ≅ ρ ⊗ Q̄_p finishes.

**Checks.**

- Irreducibility of the characteristic-zero ρ is assumed even though ρ̄ is reducible (roadmap check).
- The even-degree convention of §§3–4 is dropped: only L needs even degree.

**Direct prerequisites:** `OrdinaryAutomorphicFormsAndModularityLifting:R21.4/property-p1`; `OrdinaryAutomorphicFormsAndModularityLifting:R21.4/p2-criterion`; `OrdinaryAutomorphicFormsAndModularityLifting:R21.4/pro-modularity-key-proposition`; `OrdinaryAutomorphicFormsAndModularityLifting:R21.3/permissible-extension`; `PadicFamilies:L5/hida-control-nearly-ordinary`; `AutomorphicGaloisRepresentations:R19.2`; `GL2AutomorphicRepresentationsAndTransfer:R17.4`.

**Sources.**

- [Residually reducible representations and modular forms](http://www.numdam.org/item/PMIHES_1999__89__5_0.pdf), §4.5, p. 73 (Numdam PDF page 70; printed page = PDF page + 3). The Main Theorem.
- [Residually reducible representations and modular forms](http://www.numdam.org/item/PMIHES_1999__89__5_0.pdf), §4.5, proof of the Main Theorem, p. 74 (Numdam PDF page 71; printed page = PDF page + 3). The proof, (4.10)–(4.11) and base change.

### Arithmetic verification of the Skinner–Wiles patching axioms

**Target:** `OrdinaryAutomorphicFormsAndModularityLifting:R21.4/formal-patching-datum` (lemma).

For a nice prime 𝔭 of the permissible minimal nearly ordinary deformation problem 𝒟_c, the auxiliary-prime rings, trace subrings and ordinary quaternionic modules constructed in Skinner–Wiles §7 satisfy the characteristic-p formal patching axioms (5.1)–(5.11) over A = k[[T]]. The auxiliary-prime cardinality is independent of N; the presentation dimensions and T-primary tangent and trace-cokernel bounds are uniform in N and in the cutoff a; and the congruence annihilators z and x^(N) have the required nonzero, uniformly bounded T-orders.

**Hypotheses and conventions.**

- The nice-prime hypotheses of §4.2, the minimal level 𝒟_c, and the auxiliary primes of §6.
- The formal datum is imported from DeformationAndDerivedPatchingAlgebra R03.5; A has characteristic p.

**Construction or proof route.**

1. Use the auxiliary sets and the local/global tangent comparison to bound the torsion terms in the deformation rings uniformly.
2. Use quaternionic auxiliary-level freeness and the trace identity to obtain the required module ranks and coinvariants.
3. Verify (7.17)–(7.25) and the trace-ring bounds: these give (5.10) and the annihilator in (5.11), with its T-order independent of N.

**Checks.**

- Verify every uniformity assertion at the arithmetic level; proving the abstract patching theorem is the supplier’s task.
- A_N has the module action; only B_N naturally acts on the patched deformation ring.

**Direct prerequisites:** `OrdinaryAutomorphicFormsAndModularityLifting:R21.4/auxiliary-prime-sets`; `OrdinaryAutomorphicFormsAndModularityLifting:R21.4/minimum-level-surjection`; `OrdinaryAutomorphicFormsAndModularityLifting:R21.2/auxiliary-level-freeness`; `OrdinaryAutomorphicFormsAndModularityLifting:R21.2/auxiliary-trace-identity`; `ArithmeticGaloisDuality:R02.5`; `DeformationAndDerivedPatchingAlgebra:R03.5`.

**Sources.**

- [Residually reducible representations and modular forms](http://www.numdam.org/item/PMIHES_1999__89__5_0.pdf), §7, (7.17)–(7.25), pp. 101–107; §5, (5.1)–(5.11), pp. 79–81. Arithmetic verification of the imported patching axioms.

### Arithmetic consequences of Skinner–Wiles patching

**Target:** `OrdinaryAutomorphicFormsAndModularityLifting:R21.4/formal-patching-theorem` (theorem).

Apply the imported characteristic-p patching theorem to the arithmetic datum of formal-patching-datum, at a nice prime for 𝒟_c. With K = Frac(k[[T]]), the patched ring is K[[x₁,…,xₙ]] and its patched ordinary module is free. For all sufficiently large N, dim_K(R^(N)_1 ⊗ K) ≥ 2ⁿ dim_K(R^(N)_0 ⊗ K); M^(0) ⊗ K is free over R^(0) ⊗ K; and R^(0) ⊗ K is a complete intersection. These are conclusions for the arithmetic system, after inverting T.

**Hypotheses and conventions.**

- The arithmetic datum satisfies the uniform bounds and annihilator conditions supplied by formal-patching-datum.

**Construction or proof route.**

1. Import the extraction, freeness and complete-intersection theorem over k[[T]] from R03.5, together with R03.3’s commutative algebra.
2. Identify its finite-level ring and module with the minimal arithmetic deformation problem and its ordinary quaternionic module.
3. Retain the distinction between the generic-fibre conclusion and integral R=T, obtained by the following arithmetic arguments.

**Checks.**

- The conclusions are after ⊗_A K (the generic fibre over A = k[[T]]), not integral.

**Direct prerequisites:** `OrdinaryAutomorphicFormsAndModularityLifting:R21.4/formal-patching-datum`; `DeformationAndDerivedPatchingAlgebra:R03.5`; `DeformationAndDerivedPatchingAlgebra:R03.3`.

**Sources.**

- [Residually reducible representations and modular forms](http://www.numdam.org/item/PMIHES_1999__89__5_0.pdf), §5, Lemma 5.6, p. 85 (Numdam PDF page 82; printed page = PDF page + 3). R_∞, M_∞ and Lemma 5.6.
- [Residually reducible representations and modular forms](http://www.numdam.org/item/PMIHES_1999__89__5_0.pdf), §5, Remark 5.10, p. 88 (Numdam PDF page 85; printed page = PDF page + 3). Proposition 5.9 and Remark 5.10.

### Irreducibility and eigenvalue lemmas in characteristic p

**Target:** `OrdinaryAutomorphicFormsAndModularityLifting:R21.4/char-p-adjoint-irreducibility` (lemma).

(Lemmas 6.1–6.5.) Let A ≅ k[[λ]] with fraction field K and ρ : G_Σ → GL₂(A) with (6.2): ρ ⊗ K̄ irreducible and of type A, B or unramified at each w ∤ p; ρ mod λ = ρ_c; Σ ⊇ primes above p and where ρ̄ ramifies; ρ of type A or B exactly where ρ̄ is; det ρ = χ; ρ|_{D_v} ≅ (χ_1 *; 0 χ_2) with χ_1/χ_2 of infinite order for each v | p. Then W = ad⁰ρ ⊗ K̄ is irreducible (ρ ⊗ K̄ not dihedral); ρ ⊗ K̄|_{Gal(F_Σ/F⁺)} is neither reducible nor dihedral (F⁺ ⊆ F′ the real subfield of the splitting field of det ρ with μ_{p^∞}); there are σ ∈ Gal(F_Σ/F′) and σ ∈ Gal(F_Σ/F⁺) ∖ Gal(F_Σ/F′) whose ρ-eigenvalues have infinite order and lie in A; ρ ⊗ K̄ is irreducible on every finite-index normal subgroup of Gal(F_Σ/F⁺); and there is N_2 with λ^{n−(a−N_2)}𝒯_n ⊆ M for every submodule M ⊆ 𝒯_n = ad⁰ρ/λⁿ containing an m with λ^a m ≠ 0, a > N_2.

**Hypotheses and conventions.**

- (6.2)(i)–(vi); characteristic of K is p.

**Construction or proof route.**

1. Self-duality of W and the infinite-order element σ ∈ D_v force any decomposition of W to come from a quadratic character, making ρ induced; ρ|_{D_v} not split contradicts that (Lemma 6.1).
2. Lemma 6.3: finite-order eigenvalues in characteristic p on a pro-p image are 1; a unipotent τ and trace comparisons force triangularity otherwise; Hensel gives eigenvalues in A.
3. Lemma 6.5: A[G]x ⊇ λ^r ad⁰ρ with r = r(x) continuous, hence bounded.

**Checks.**

- All representations here are over a characteristic-p DVR: finite-order means p-power, and 'dihedral' is tested over K̄.

**Direct prerequisites:** `OrdinaryAutomorphicFormsAndModularityLifting:R21.3/ramification-types`; `OrdinaryAutomorphicFormsAndModularityLifting:R21.3/deformation-datum`.

**Sources.**

- [Residually reducible representations and modular forms](http://www.numdam.org/item/PMIHES_1999__89__5_0.pdf), §6, (6.1)–(6.2), p. 88 (Numdam PDF page 85; printed page = PDF page + 3). (6.1)–(6.2) and Lemma 6.1.

### Auxiliary prime sets in characteristic p

**Target:** `OrdinaryAutomorphicFormsAndModularityLifting:R21.4/auxiliary-prime-sets` (theorem).

(Proposition 6.10, with (6.3)–(6.11) and Lemmas 6.7–6.9.) With ρ as in char-p-adjoint-irreducibility and σ ∈ Gal(F_Σ/F′) whose ρ-eigenvalues lie in A and have infinite order, there is r = r(ρ) such that for every m > 0 there are infinitely many sets Q = {w_1, …, w_r} with Nm(w_i) ≡ 1 mod p^m, ρ(Frob_{w_i}) ≡ ρ(σ) mod λ^m, and lim_n H_{Σ_Q}(𝒯_n) ≅ (K/A)^r ⊕ X_{Σ_Q} with #X_{Σ_Q} < C(σ, r) independent of Q (Σ_Q = Σ_0 ∪ Q).

**Hypotheses and conventions.**

- (6.2); the Selmer groups H_Σ(𝒯_n) use L_w = ker(H¹(D_w, 𝒯_n) → H_w(𝒯_n)) with H_v the ordinary condition at v | p and H_w the type-A/B condition at ramified w ∤ p.

**Construction or proof route.**

1. Wiles' formula #H_Σ(𝒯_n)/#H*_Σ(𝒯_n) = h_∞∏h_w (6.3) ([W1, Proposition 1.6], generalised to totally real F; Poitou–Tate, ArithmeticGaloisDuality R02.4–R02.5); h_∞ ≍ #(A/λⁿ)^{2[F:ℚ]}, h_w ≍ 1 at type A/B places, h_v ≍ #(A/λⁿ)^{−2[F_v:ℚ_p]} (6.4)–(6.8), whence #H_Σ ≍ #H*_Σ·∏_{w∈Σ′}#H⁰(D_w, 𝒯_n(1)) (6.9).
2. (6.10)–(6.11) and Lemmas 6.7–6.8: the direct limits are (K/A)^r ⊕ finite.
3. Lemma 6.9 (after [W1, Proposition 1.11]): λ^{N_1} kills H¹(E_∞/F, 𝒯_n(1)) — a measure argument on the map σ ↦ lim σ^{1+p^n} with Lemma 6.4.
4. Choose primes w_j inductively by Chebotarev (GlobalGaloisDeformations R04.5) so that each kills a (K/A) summand of lim H*: after r steps lim H*_{Σ_r} is bounded, and (6.9) gives the claim.

**Checks.**

- The coefficients are the characteristic-p DVR A: R04.5's finite-coefficient Taylor–Wiles primes are used only for the Chebotarev choice; the counting is done here.

**Direct prerequisites:** `OrdinaryAutomorphicFormsAndModularityLifting:R21.4/char-p-adjoint-irreducibility`; `ArithmeticGaloisDuality:R02.4`; `ArithmeticGaloisDuality:R02.5`; `GlobalGaloisDeformations:R04.5`; `ArithmeticGaloisDuality:R02.3`.

**Sources.**

- [Residually reducible representations and modular forms](http://www.numdam.org/item/PMIHES_1999__89__5_0.pdf), §6, Lemma 6.9, p. 95 (Numdam PDF page 92; printed page = PDF page + 3). Lemma 6.9.
- [Residually reducible representations and modular forms](http://www.numdam.org/item/PMIHES_1999__89__5_0.pdf), §6, Proposition 6.10, p. 97 (Numdam PDF page 94; printed page = PDF page + 3). Proposition 6.10.

### The map ψ(𝒟, 𝔭) from deformation to Hecke rings

**Target:** `OrdinaryAutomorphicFormsAndModularityLifting:R21.4/minimum-level-surjection` (lemma).

(Lemma 7.1, Remark 7.2.) Let F have even degree, 𝒟 a deformation datum and 𝔭 ⊆ T_𝒟 nice for 𝒟 (so 𝔭 comes from T^min_𝒟; A = the normalisation of T^min_𝒟/𝔭 ≅ k′[[λ]]). With Λ̃_𝒪 = 𝒪′[[W_1, …, W_m]] finite free over Λ_𝒪 (7.2), tilded rings R̃ = R ⊗_{Λ_𝒪} Λ̃_𝒪 and localisations-completions at primes 𝔭̃ over 𝔭, there is a natural local surjection ψ(𝒟, 𝔭) : (R̃^min_𝒟)_{𝔭̃} ↠ (T̃^min_𝒟)_{𝔭̃} with trace ρ^min(Frob_ℓ) ⊗ 1 ↦ T(ℓ) ⊗ 1 and det ρ^min(Frob_ℓ) ⊗ 1 ↦ S(ℓ)Nm(ℓ) ⊗ 1 for ℓ ∉ Σ; the same holds for the auxiliary data 𝒟_Q.

**Hypotheses and conventions.**

- 𝔭 nice for 𝒟.

**Construction or proof route.**

1. For each minimal Q ⊆ 𝔭̃ and each two-dimensional prime 𝔔 of the normalisation B of T̃/Q over a regular point of Λ̃_{𝒪,P}, Proposition 2.15 lifts the pseudo-deformation to (𝒪_j, Σ, c, ℳ)-minimal deformations ρ_j, giving maps from R̃^min.
2. Injectivity of the completed products (7.4)–(7.5) and Proposition 2.11 make R̃^ps → T̂_{𝔭_i} factor through R̃^min; the image in ∏(T̃^min)_{𝔭̃}/Q is that of (T̃^min)_{𝔭̃}, giving the surjection (7.6).

**Checks.**

- There is no natural map R^min → T^min: ψ exists only after localising and completing at a nice prime.

**Direct prerequisites:** `OrdinaryAutomorphicFormsAndModularityLifting:R21.4/good-pair-and-nice-primes`; `OrdinaryAutomorphicFormsAndModularityLifting:R21.3/pseudo-deformation-lifting`; `OrdinaryAutomorphicFormsAndModularityLifting:R21.3/pseudo-deformation-localisation`; `OrdinaryAutomorphicFormsAndModularityLifting:R21.2/deformation-hecke-rings`; `OrdinaryAutomorphicFormsAndModularityLifting:R21.3/hecke-generation`.

**Sources.**

- [Residually reducible representations and modular forms](http://www.numdam.org/item/PMIHES_1999__89__5_0.pdf), §7, Remark 7.2, p. 103 (Numdam PDF page 100; printed page = PDF page + 3). Lemma 7.1 (proof ending here) and Remark 7.2.

### R = T at nice primes of minimal level

**Target:** `OrdinaryAutomorphicFormsAndModularityLifting:R21.4/minimum-level-r-equals-t` (theorem).

(Proposition 7.3.) Let F be totally real of even degree, 𝒟 = 𝒟_c and 𝔭 ⊆ T_𝒟 nice for 𝒟. Then (i) ψ(𝒟, 𝔭) : (R̃^min_𝒟)_{𝔭̃} → (T̃^min_𝒟)_{𝔭̃} is an isomorphism and (R̃^min_𝒟)_{𝔭̃} is a complete intersection over Λ̃_{𝒪,P} and reduced; (ii) M̃_{𝒟,𝔭̃} is a free (T̃^min_𝒟)_{𝔭̃}-module.

**Hypotheses and conventions.**

- F of even degree; 𝒟 = 𝒟_c (Σ = Σ_c, ℳ = ℳ_c = Σ_c ∖ 𝒫); 𝔭 nice.

**Construction or proof route.**

1. Patching data: N^{(0)} = im(M̃_𝒟 → (M̃_𝒟)_{𝔭̃}/P) (7.7); R^{(0)}, R^{tr(0)} as images in (R̃^min)_{𝔭̃}/(𝔭̃F_0, P) (7.8)–(7.9) with F_0 the Fitting ideal; for odd N the sets Q_N of Proposition 6.10 give R^{(N)}_a, R^{tr(N)}_a (7.11)–(7.13) and M^{(N)}_a (7.10), with s_i = δ_{w_i} − 1 (Lemma 3.21).
2. Verification of (5.2)–(5.11): generator bounds from dim H¹(F_{Σ∪Q}/F, ad⁰ρ_c) and Lemma 2.10; freeness (5.10vi) via Lemma 3.19 after auxiliary Γ₁(ℓ_1⋯ℓ_s)-level at primes chosen by (7.15)–(7.16) with Lemma 3.29 and Corollary 3.6; the element x^{(N)} of (5.11) built in (7.21)–(7.25).
3. Proposition 5.9 gives R^{(0)} ⊗ K a complete intersection and Proposition 5.8 makes M^{(0)} ⊗ K free; with Lemma 5.2 (R^{tr(0)} ⊗ K ≅ R^{(0)} ⊗ K) and the surjection to (T̃^min)_{𝔭̃}/P, ψ mod P is an isomorphism; freeness of M̃ over Λ̃_{𝒪,P} lifts this to ψ and gives F_0 = 0 ((7.27)–(7.28)).

**Checks.**

- Complete intersection and freeness are proved at the localisation-completion at 𝔭̃, not globally.

**Direct prerequisites:** `OrdinaryAutomorphicFormsAndModularityLifting:R21.4/minimum-level-surjection`; `OrdinaryAutomorphicFormsAndModularityLifting:R21.4/formal-patching-theorem`; `OrdinaryAutomorphicFormsAndModularityLifting:R21.4/auxiliary-prime-sets`; `OrdinaryAutomorphicFormsAndModularityLifting:R21.2/auxiliary-level-freeness`; `OrdinaryAutomorphicFormsAndModularityLifting:R21.2/auxiliary-trace-identity`; `OrdinaryAutomorphicFormsAndModularityLifting:R21.2/level-raising-congruence-modules`; `OrdinaryAutomorphicFormsAndModularityLifting:R21.2/minimal-hecke-ring-decomposition`; `OrdinaryAutomorphicFormsAndModularityLifting:R21.3/universal-pseudo-deformation`; `OrdinaryAutomorphicFormsAndModularityLifting:R21.3/global-presentation-bound`; `DeformationAndDerivedPatchingAlgebra:R03.3`.

**Sources.**

- [Residually reducible representations and modular forms](http://www.numdam.org/item/PMIHES_1999__89__5_0.pdf), §7, p. 103 (Numdam PDF page 100; printed page = PDF page + 3). (7.7)–(7.13).
- [Residually reducible representations and modular forms](http://www.numdam.org/item/PMIHES_1999__89__5_0.pdf), §7, p. 106 (Numdam PDF page 103; printed page = PDF page + 3). Verification of (5.2)–(5.11).
- [Residually reducible representations and modular forms](http://www.numdam.org/item/PMIHES_1999__89__5_0.pdf), §7, Proposition 7.3, p. 111 (Numdam PDF page 108; printed page = PDF page + 3). Proposition 7.3 and its proof.

### Congruence maps between levels

**Target:** `OrdinaryAutomorphicFormsAndModularityLifting:R21.4/level-raising-congruence-maps` (lemma).

(§8.2, Lemma 8.2 and (8.1).) For deformation data 𝒟_c = 𝒟_0 ≤ 𝒟_1 ≤ ⋯ ≤ 𝒟_n = 𝒟 (strict steps adding one place w_i, either to Σ or removing it from ℳ) and 𝔭 nice: R_i = (R̃^min_{𝒟_i})_{𝔭̃}, T_i, M_i and M⁺_i are free over Λ̃_{𝒪,P} with M_i^{2^s} ≅ Hom(M⁺_i, Λ̃_{𝒪,P})^{2^s} (Lemma 8.2); and there are T_i-maps Φ_i : M_{i−1}^{2^s r_i} → M_i^{2^s}, Φ̂_i, Ψ_i, Θ_i (r_i = 2 or 3) with Φ_i injective with Λ̃-free cokernel, Φ̂_i surjective, Θ_i∘Φ̂_i∘Φ_i∘Ψ_i = (unit·η_i *; 0 A_i) with det A_i not a zero divisor in T_0, and η_i = (q_i − 1)(T(ℓ_i)² − S(ℓ_i)(q_i + 1)²), (q_i − 1)(q_i + 1) or (q_i − 1) according as w_i ∈ Σ_i ∖ Σ_{i−1}, w_i ∈ ℳ_{i−1} with χ|_{I_{w_i}} = 1, or with χ|_{I_{w_i}} ≠ 1 (q_i = Nm(ℓ_i)).

**Hypotheses and conventions.**

- 𝔭 nice for 𝒟.

**Construction or proof route.**

1. Lemma 8.2 from Lemma 3.29 at auxiliary primes r_1, …, r_s and Proposition 3.3 with (3.17).
2. Φ_i = 2^s copies of f ↦ f + α_i g (+ α_i² h), with kernels and cokernels killed by T(ℓ) − 1 − Nm(ℓ) (Lemmas 3.26–3.28), hence trivial after localising at the non-Eisenstein 𝔭 (8.1a).
3. Explicit Ψ_i, Θ_i and the 3×3 matrix give the determinant (q_iS(ℓ_i)^{−2})^{2^s}η_i^{2^s−1} (8.1b).

**Checks.**

- η_i is the level-raising congruence factor at w_i.

**Direct prerequisites:** `OrdinaryAutomorphicFormsAndModularityLifting:R21.2/ihara-lemma-quaternionic`; `OrdinaryAutomorphicFormsAndModularityLifting:R21.2/ihara-exact-sequence`; `OrdinaryAutomorphicFormsAndModularityLifting:R21.2/level-raising-congruence-modules`; `OrdinaryAutomorphicFormsAndModularityLifting:R21.2/hecke-module-duality`; `PadicFamilies:L5/hida-freeness`.

**Sources.**

- [Residually reducible representations and modular forms](http://www.numdam.org/item/PMIHES_1999__89__5_0.pdf), §8.2, Lemma 8.2, p. 113 (Numdam PDF page 110; printed page = PDF page + 3). §8.2, Lemma 8.2 and the definition of η_i.

### R = T at nice primes (all levels)

**Target:** `OrdinaryAutomorphicFormsAndModularityLifting:R21.4/nice-prime-r-equals-t` (theorem).

(Proposition 8.1.) If 𝔭 ⊆ T_𝒟 is nice for 𝒟 (F of even degree), then ψ(𝒟, 𝔭) : (R̃^min_𝒟)_{𝔭̃} → (T̃^min_𝒟)_{𝔭̃} is an isomorphism.

**Hypotheses and conventions.**

- F of even degree; 𝔭 nice for 𝒟.

**Construction or proof route.**

1. For 𝒟 = 𝒟_c this is Proposition 7.3 (printed 'Proposition 7.2' on p. 119: E8). In general, compose the chain 𝒟_c ≤ ⋯ ≤ 𝒟 of §8.2; Lemma 8.4 cuts by a regular sequence y_1, …, y_{m−1} to a DVR C (8.3).
2. T′_0 is a reduced complete intersection over C, so ℓ_C(H_0/H_0²) = ℓ_C(C/δ(G_0)) (8.4) by de Smit–Rubin–Schoof Criterion I (R03.3).
3. The congruence maps give ℓ_C(C/(δ∘α)(G_n)) ≥ ℓ_C(C/δ(G_0)) + ℓ_C(C/δ(η)) (8.5); deformation theory gives ℓ_C(H_n/H_n²) ≤ ℓ_C(H_0/H_0²) + ℓ_C(C/δ(η)) (8.7), via Hom_C(R′_n, C ⊕ εC/λ^m) ↪ H¹(F_Σ/F, ad ρ/λ^m) (8.8) and the local count (8.10).
4. Hence ℓ_C(H_n/H_n²) ≤ ℓ_C(C/(δ∘α)(G_n)); DRS Criterion I makes R′_n → T″_n an isomorphism of complete intersections, and faithful flatness over B gives ψ(𝒟, 𝔭).

**Checks.**

- This is the 'R = T' of the paper: it holds only after localisation and completion at a nice prime, and it uses the numerical (Wiles–Lenstra–de Smit–Rubin–Schoof) criterion, not an explicit presentation.

**Direct prerequisites:** `OrdinaryAutomorphicFormsAndModularityLifting:R21.4/minimum-level-r-equals-t`; `OrdinaryAutomorphicFormsAndModularityLifting:R21.4/level-raising-congruence-maps`; `OrdinaryAutomorphicFormsAndModularityLifting:R21.4/minimum-level-surjection`; `OrdinaryAutomorphicFormsAndModularityLifting:R21.3/matrix-entry-subring`; `DeformationAndDerivedPatchingAlgebra:R03.3`; `ArithmeticGaloisDuality:R02.5`.

**Sources.**

- [Residually reducible representations and modular forms](http://www.numdam.org/item/PMIHES_1999__89__5_0.pdf), §8.4, p. 119 (Numdam PDF page 116; printed page = PDF page + 3). §8.4, (8.3).
- [Residually reducible representations and modular forms](http://www.numdam.org/item/PMIHES_1999__89__5_0.pdf), §8.4, p. 120 (Numdam PDF page 117; printed page = PDF page + 3). (8.4) and (8.5).
- [Residually reducible representations and modular forms](http://www.numdam.org/item/PMIHES_1999__89__5_0.pdf), §8.4, end of the proof, p. 122 (Numdam PDF page 119; printed page = PDF page + 3). The end of the proof.

### Good pairs, nice primes and property (P) for irreducible ρ₀

**Target:** `OrdinaryAutomorphicFormsAndModularityLifting:R21.4/irreducible-good-pair-and-nice-primes` (definition).

(F, ρ₀) is a good pair if (i) d/2 > 2 + 2t + 7·#ℳ₀, (ii) d_i > 2 + 2t + 7·#ℳ₀ for i = 1, …, t (d_i = [F_{v_i} : ℚ_p]), and (iii) (H_even) and (H_def) hold (4.1). A prime q of R_𝒟 is pro-modular if it is the inverse image under r_𝒟 of a prime of T_𝒟 (R21.4/pro-modular-prime); a deformation over a domain is pro-modular if its kernel is. A prime 𝔭 of R_𝒟 is nice for 𝒟 if (4.2): (i) 𝔭 is a dimension-one prime containing p; (ii) ρ_𝒟 mod 𝔭 is not dihedral and det ρ_𝒟 mod 𝔭 has finite order; (iii) for each v_i, (ρ_𝒟 mod 𝔭)|_{D_i} ≅ (ψ^{(i)}_1 *; 0 ψ^{(i)}_2) with ψ^{(i)}_1/ψ^{(i)}_2 of infinite order; (iv) 𝔭 is the inverse image of a prime of T_{𝒟₀}. A prime with (i)–(iii) and ρ_𝒟 mod 𝔭 of type 𝒟₀ is merely nice. Property (P) for 𝒟: if 𝔭 is nice for 𝒟, every prime q ⊆ 𝔭 is pro-modular.

**Hypotheses and conventions.**

- the good-pair inequalities depend only on (F, ρ₀), not on Σ; see source issue E14 for the bound on #Σ that Proposition 4.1's proof also needs

**Uses.**

- `OrdinaryAutomorphicFormsAndModularityLifting:R21.4/irreducible-pro-modularity`: the hypotheses of Proposition 4.1.
- `OrdinaryAutomorphicFormsAndModularityLifting:R21.4/irreducible-nice-prime-r-equals-t`: property (P) is proved at nice primes (Proposition 8.2).
- `OrdinaryAutomorphicFormsAndModularityLifting:R21.5/nearly-ordinary-irreducible-lifting`: (L, ρ₀) is made a good pair by base change.

**API.**

- `TauCeti.OrdinaryModularity.IsGoodPairIrr` (data): The conditions (4.1)(i)–(iii).
- `TauCeti.OrdinaryModularity.IsNiceIrr` (data): The conditions (4.2)(i)–(iv) for 𝒟.
- `TauCeti.OrdinaryModularity.PropertyP` (data): Property (P) for a datum.
- `TauCeti.OrdinaryModularity.isNiceIrr_proModular` (relation): A prime nice for 𝒟 is pro-modular (condition (iv)).

**Unit tests.**

- **isGoodPairIrr_base_change** (example): d_L/2 > 2 + 7·#Σ_L and d_v > 2 + 7·#Σ_L imply (4.1)(i)–(ii) for L (checked in the Lean file).
- **isNiceIrr_dimension_one** (example): A prime 𝔭 with dim(R_𝒟/𝔭)=1 is not maximal; if every irreducible component of Spec R_𝒟 has dimension at least 2, it is not minimal either. Do not confuse quotient dimension with height.
- **isNiceIrr_not_dihedral** (example): A prime whose quotient representation is dihedral is not nice, whatever its dimension.
- **merelyNice_vs_nice** (example): For the quotient R_𝒟 ↠ R_{𝒟₀}, the inverse image of a merely nice prime of R_{𝒟₀} is merely nice in R_𝒟, since the quotient rings and their representations agree. A general prime cannot be pushed through a quotient unless it contains its kernel.

**Construction or proof route.**

1. Pro-modularity of q is equivalent to a map θ_q : T_𝒟 → R_𝒟/q with θ_q ∘ r_𝒟 the reduction modulo q.

**Checks.**

- Compare with R21.4/good-pair-and-nice-primes: one property (P) replaces (P1) and (P2), and there is no p-adic L-function or class-group condition.

**Direct prerequisites:** `OrdinaryAutomorphicFormsAndModularityLifting:R21.4/pro-modular-prime`; `OrdinaryAutomorphicFormsAndModularityLifting:R21.3/irreducible-hecke-surjection`; `OrdinaryAutomorphicFormsAndModularityLifting:R21.3/dihedral-deformation-dimension`.

**Sources.**

- [Nearly ordinary deformations of irreducible residual representations](http://www.numdam.org/item/AFST_2001_6_10_1_185_0.pdf), §4, (4.1) and pro-modular primes, p. 198 (Numdam PDF page 15; printed page = PDF page + 183). Good pairs (4.1) and pro-modular primes.
- [Nearly ordinary deformations of irreducible residual representations](http://www.numdam.org/item/AFST_2001_6_10_1_185_0.pdf), §4, (4.2) and property (P), p. 199 (Numdam PDF page 16; printed page = PDF page + 183). Nice primes (4.2) and property (P).

### Every prime of R_𝒟 is pro-modular (Proposition 4.1, irreducible ρ₀)

**Target:** `OrdinaryAutomorphicFormsAndModularityLifting:R21.4/irreducible-pro-modularity` (theorem).

(Proposition 4.1.) Let (F, ρ₀) be a good pair and 𝒟 = (𝒪, Σ, ℳ) a deformation datum, and assume (a) d/2 > 2 + 2t + 7·#(Σ ∖ 𝒫) (source issue E14; for Σ = Σ₀ this is (4.1)(i)) and (b) if ρ₀ ≅ Ind_{F′}^F ψ₀ is dihedral, the dihedral deformations of type 𝒟′ with finite-order determinant have dimension at most d/2 for every 𝒟′ below (true when F′ is totally real; source issue E11). If (P) holds for every datum (𝒪, Σ′, ℳ′) with ℳ ⊆ ℳ′ and Σ′ ⊆ Σ, then every prime of R_𝒟 is pro-modular.

**Hypotheses and conventions.**

- Skinner–Wiles state the proposition without (a) and (b); their proof uses both (source issues E11 and E14)
- in the application (R21.5/nearly-ordinary-irreducible-lifting) (a) holds because L is chosen with d_L/2 > 2 + 7·#Σ_L

**Construction or proof route.**

1. 𝒟 = 𝒟₀, step one: T_{𝒟₀} is finite torsion-free over Λ_𝒪 (Lemma 3.1), so for a minimal prime Q of R = T_{𝒟₀}/(p, T_1, …, T_{δ_F}), R/Q is integral over k[[Y^{(i)}_j]] and has dimension d; by (b) ρ^mod mod Q is not dihedral, and infinitely many dimension-one primes avoiding the Y^{(i)}_1 give a prime nice for 𝒟₀ ((3.2)(vi)).
2. Step two: by (P) every component of Spec R_{𝒟₀} through a nice prime is pro-modular, so C^mod_{𝒟₀} ≠ ∅.
3. Step three: if C′ = C_{𝒟₀} ∖ C^mod_{𝒟₀} ≠ ∅, Proposition 2.1 and Corollary A.2 (R21.4/raynaud-connectedness-corollary) give C_1 ∈ C^mod, C_2 ∈ C′ meeting in Q of dimension d − 2t + δ_F − 3#ℳ₀; a minimal Q_1 over (Q, p, det ρ(γ_i) − 1) has dimension ≥ d − 2t − 3#ℳ₀ − 1 > 1 + d/2 by (4.1), so ρ mod Q_1 is not dihedral by (b); Q_1 is pro-modular; if Q^mod_1 contained all Y^{(i)}_j then d_i ≤ 2t + 3#ℳ₀ + 1, contradicting (4.1)(ii); a dimension-one 𝔭 ⊇ Q_1 avoiding the Y^{(i)}_1 is nice, so C_2 is pro-modular by step two: contradiction.
4. General 𝒟: a nice prime of R_𝒟 comes from a nice prime of R_{𝒟₀}, and composing θ with T_𝒟 ↠ T_{𝒟₀} shows it is nice for 𝒟, so (P) makes its components pro-modular. For a minimal prime Q of R_𝒟, choose τ_v and a basis at each v ∈ Σ ∖ 𝒫 and let I_2 = (p; a_v − 1, b_v − u_v, c_v, d_v − 1; det ρ_𝒟(γ_j) − 1); a minimal Q_2 over (Q, I_2) has dimension ≥ d − 2t − 3#ℳ − 4#(Σ ∖ 𝒫) ≥ d/2 + 1 by (a), so ρ mod Q_2 is not dihedral by (b), is of type 𝒟₀, and lies in a nice prime; hence Q is pro-modular.

**Checks.**

- Check each inequality in the Lean file: step three's bound from (4.1)(i), the contradiction with (4.1)(ii), and that (4.1) alone does not give the bound of the general step (E14).
- No R = T isomorphism is claimed here; that is property (P).

**Direct prerequisites:** `OrdinaryAutomorphicFormsAndModularityLifting:R21.4/irreducible-good-pair-and-nice-primes`; `OrdinaryAutomorphicFormsAndModularityLifting:R21.3/irreducible-presentation-bound`; `OrdinaryAutomorphicFormsAndModularityLifting:R21.3/dihedral-deformation-dimension`; `OrdinaryAutomorphicFormsAndModularityLifting:R21.4/raynaud-connectedness-corollary`; `OrdinaryAutomorphicFormsAndModularityLifting:R21.3/irreducible-hecke-surjection`; `PadicFamilies:L5/hida-hecke-finite`.

**Sources.**

- [Nearly ordinary deformations of irreducible residual representations](http://www.numdam.org/item/AFST_2001_6_10_1_185_0.pdf), §4, Proposition 4.1, p. 199 (Numdam PDF page 16; printed page = PDF page + 183). Proposition 4.1 and the start of its proof.
- [Nearly ordinary deformations of irreducible residual representations](http://www.numdam.org/item/AFST_2001_6_10_1_185_0.pdf), §4, proof of Proposition 4.1, step three, p. 200 (Numdam PDF page 17; printed page = PDF page + 183). The bound dim Q_1 > 1 + d/2.
- [Nearly ordinary deformations of irreducible residual representations](http://www.numdam.org/item/AFST_2001_6_10_1_185_0.pdf), §4, proof of Proposition 4.1, step three, p. 201 (Numdam PDF page 18; printed page = PDF page + 183). The contradiction with (4.1)(ii).
- [Nearly ordinary deformations of irreducible residual representations](http://www.numdam.org/item/AFST_2001_6_10_1_185_0.pdf), §4, proof of Proposition 4.1, general 𝒟, p. 202 (Numdam PDF page 19; printed page = PDF page + 183). The general step, which needs the bound on #Σ (E14).

### Selmer groups and auxiliary primes in characteristic p (Lemma 7.1, Proposition 7.2)

**Target:** `OrdinaryAutomorphicFormsAndModularityLifting:R21.4/irreducible-selmer-auxiliary-primes` (theorem).

Let ρ : G_Σ = Gal(F_Σ/F) → GL₂(A), A ≅ k[[λ]], with ρ ⊗ K̄ irreducible and not dihedral, ρ mod λ = ρ₀, Σ ⊇ 𝒫 ∪ {ramified places of ρ₀}, ρ ramified at w ∤ p exactly where ρ₀ is and then ρ|_{I_w} ≅ (1 *; 0 1), det ρ = det ρ₀, and ρ|_{D_v} ≅ (χ^{(v)}_1 *; 0 χ^{(v)}_2) with χ^{(v)}_1/χ^{(v)}_2 of infinite order for v | p. Let F′ be the splitting field of det ρ with all p-power roots of unity adjoined and F⁺ its fixed field under z_1. (Lemma 7.1.) There are σ ∈ Gal(F_Σ/F′), and σ ∈ Gal(F_Σ/F⁺) ∖ Gal(F_Σ/F′), such that the eigenvalues of ρ(σ) lie in A and have infinite order. With 𝒰 the space of ρ, the filtrations 𝒰_{1,i} at v_i and 𝒰^w_1 at ramified w ∤ p, 𝒯 = {f ∈ ad ρ : trace f = 0}, 𝒯^{ord}_{v_i}, 𝒯^w and 𝒯_n = 𝒯/λⁿ, put H_{v_i}(𝒯_n) = H¹(I_i, 𝒯_n/𝒯^{ord}_{n,i}), H_w(𝒯_n) = H¹(I_w, 𝒯_n/𝒯^w_n) (0 if ρ₀ is unramified at w), L_w = ker(H¹(D_w, 𝒯_n) → H_w(𝒯_n)) and H_Σ(𝒯_n) the classes locally in L_w for all w ∈ Σ. (Proposition 7.2.) For σ as in Lemma 7.1(i) there is r = r(ρ) such that for every m > 0 there are infinitely many Q = {w_1, …, w_r} with (i) Nm(w_i) ≡ 1 mod p^m, (ii) ρ_𝔭(Frob_{w_i}) ≡ ρ_𝔭(σ) mod λ^m, and (iii) lim_n H_{Σ_Q}(𝒯_n) ≅ (K/A)^r ⊕ X_{Σ_Q} with Σ_Q = Σ₀ ∪ Q and #X_{Σ_Q} < C(σ, r) depending only on σ and r.

**Hypotheses and conventions.**

- A is a characteristic-p discrete valuation ring; K = Frac A
- not dihedral replaces the proof of non-dihedrality needed in the reducible case

**Construction or proof route.**

1. Lemma 7.1 exactly as Skinner–Wiles 1999 Lemma 6.3 (R21.4/char-p-adjoint-irreducibility); here ρ is assumed non-dihedral from the start.
2. Proposition 7.2 exactly as Skinner–Wiles 1999 Proposition 6.10 (R21.4/auxiliary-prime-sets): Wiles' Selmer formula (ArithmeticGaloisDuality R02.4, R02.5) and Chebotarev (GlobalGaloisDeformations R04.5).

**Checks.**

- The Selmer groups use the ordinary line 𝒰_{1,i} at v_i and the unipotent line at ramified w ∤ p, matching type 𝒟₀.

**Direct prerequisites:** `OrdinaryAutomorphicFormsAndModularityLifting:R21.4/char-p-adjoint-irreducibility`; `OrdinaryAutomorphicFormsAndModularityLifting:R21.4/auxiliary-prime-sets`; `ArithmeticGaloisDuality:R02.4`; `ArithmeticGaloisDuality:R02.5`; `GlobalGaloisDeformations:R04.5`.

**Sources.**

- [Nearly ordinary deformations of irreducible residual representations](http://www.numdam.org/item/AFST_2001_6_10_1_185_0.pdf), §7, the assumptions on ρ, p. 207 (Numdam PDF page 24; printed page = PDF page + 183). The hypotheses of §7 (the OCR reads ρ as p).
- [Nearly ordinary deformations of irreducible residual representations](http://www.numdam.org/item/AFST_2001_6_10_1_185_0.pdf), §7, Lemma 7.1, p. 208 (Numdam PDF page 25; printed page = PDF page + 183). Lemma 7.1 is proved as Skinner–Wiles 1999 Lemma 6.3.
- [Nearly ordinary deformations of irreducible residual representations](http://www.numdam.org/item/AFST_2001_6_10_1_185_0.pdf), §7, Proposition 7.2, p. 209 (Numdam PDF page 26; printed page = PDF page + 183). Proposition 7.2 and its proof by reference.

### R = T at nice primes and property (P) (Propositions 8.1–8.2)

**Target:** `OrdinaryAutomorphicFormsAndModularityLifting:R21.4/irreducible-nice-prime-r-equals-t` (theorem).

Assume (H_even) and (H_def). (Proposition 8.1.) If 𝔭 ⊆ T_{𝒟₀} is nice for 𝒟₀, then (i) ψ(𝒟₀, 𝔭) : (R̃^min_{𝒟₀})_𝔭̃ → (T̃^min_{𝒟₀})_𝔭̃ is an isomorphism and (R̃^min_{𝒟₀})_𝔭̃ is a reduced complete intersection over Λ̃_{𝒪,P}; (ii) M̃_{𝒟₀,𝔭̃} is a free (T̃^min_{𝒟₀})_𝔭̃-module. Here the integral closure of T^min_𝒟/𝔭 is A ≅ k′[[λ]], finite over Λ_𝒪 = 𝒪[[z_1, …, z_m]] with z_i ↦ λ^{r_i}u_i (r_i > 0, u_1 a unit), Λ̃_𝒪 = 𝒪′[[W_1, …, W_m]] → A by W_1 ↦ λ, W_i ↦ 0, Λ_𝒪 → Λ̃_𝒪 by z_1 ↦ W_1^{r_1}ũ_1, z_i ↦ −W_i + W_1^{r_i}ũ_i, tildes denote base change to Λ̃_𝒪, 𝔭̃ a prime above 𝔭, and P = (π, W_2, …, W_m). (Proposition 8.2.) For every datum 𝒟 and every prime 𝔭 ⊆ R_𝒟 nice for 𝒟, ψ(𝒟, 𝔭) is an isomorphism and property (P) holds for 𝔭.

**Hypotheses and conventions.**

- the map ψ(𝒟, 𝔭) is Skinner–Wiles 1999's (R21.4/minimum-level-surjection) with the irreducible data

**Construction or proof route.**

1. Rings and modules: N^{(0)} = im(M̃_𝒟 → (M̃_𝒟)_𝔭̃/P) and R^{(0)} = im(R̃^min_𝒟 → (R̃^min_𝒟)_𝔭̃/(𝔭̃F_0, P)) with F_0 the Fitting ideal of (M̃_𝒟)_𝔭̃; for odd N the sets Q_N of Proposition 7.2 (R21.4/irreducible-selmer-auxiliary-primes) give M^{(N)}_a over A_a = A[[s_1, …, s_r]]/(s_i^{a+1}), s_i = δ_{w_i} − 1, and R^{(N)}_a over B_a via t_i ↦ trace(ρ_{𝒟_Q}(σ_{w_i}) − 2) ⊗ 1, with R^{(N)}_0 = R^{(0)}, M^{(0)} = ⊕_{i=1}^{2^r} N^{(0)} and M^{(N)}_0 = M^{(0)} (8.1).
2. Verify (6.2)–(6.8): the number of generators is bounded by dim_k H¹(F_{Σ∪Q}/F, ad⁰ρ₀); (6.7)(vi) from Skinner–Wiles 1999 Lemma 3.19 (R21.2/auxiliary-level-freeness) after shrinking U^min_{𝒟_Q}; d(a) = d_1(a)d_1(1) + 1; (6.5ii) from Proposition 7.2(iii) and 𝔛_Q = Hom_A((𝔭̃^min_{𝒟_Q}/(𝔭̃^min_{𝒟_Q})², P), λ^{−n}A/A) ≅ H_{Σ_Q}(𝒯_n); x^{(N)} as in Skinner–Wiles 1999 §7; Lemma 3.5(iii) (R21.3/irreducible-minimal-hecke-quotient) for compatibility of the A_a- and B_a-structures.
3. Proposition 6.1 (Skinner–Wiles 1999 Propositions 5.8–5.9 with R^{tr} = R; R21.4/formal-patching-theorem): R^{(0)} ⊗_A K is a complete intersection and M^{(0)} ⊗_A K is free over it.
4. Hence (T̃^min_{𝒟₀})_𝔭̃^s → (M̃_{𝒟₀})_𝔭̃ (8.2) is an isomorphism, (T̃^min_{𝒟₀})_𝔭̃ is free over Λ̃_{𝒪,P}, (8.3) is an isomorphism, F_0 = 0, and (R̃^min_{𝒟₀})_𝔭̃ is a complete intersection; T^min is reduced (Lemma 3.5(ii)).
5. Proposition 8.2: ψ(𝒟, 𝔭) is an isomorphism for every 𝒟 by the congruences of Skinner–Wiles 1999 §3.8 (R21.4/level-raising-congruence-maps), and property (P) follows as in their Proposition 8.4 (R21.4/property-p1).

**Checks.**

- The rings are localised and completed at 𝔭̃ and the isomorphism is after base change to Λ̃_𝒪; a formalisation must keep both, as in R21.4/nice-prime-r-equals-t.

**Direct prerequisites:** `OrdinaryAutomorphicFormsAndModularityLifting:R21.4/irreducible-selmer-auxiliary-primes`; `OrdinaryAutomorphicFormsAndModularityLifting:R21.4/formal-patching-theorem`; `OrdinaryAutomorphicFormsAndModularityLifting:R21.4/formal-patching-datum`; `OrdinaryAutomorphicFormsAndModularityLifting:R21.4/minimum-level-surjection`; `OrdinaryAutomorphicFormsAndModularityLifting:R21.4/level-raising-congruence-maps`; `OrdinaryAutomorphicFormsAndModularityLifting:R21.4/property-p1`; `OrdinaryAutomorphicFormsAndModularityLifting:R21.2/auxiliary-level-freeness`; `OrdinaryAutomorphicFormsAndModularityLifting:R21.3/irreducible-minimal-hecke-quotient`; `OrdinaryAutomorphicFormsAndModularityLifting:R21.4/irreducible-good-pair-and-nice-primes`.

**Sources.**

- [Nearly ordinary deformations of irreducible residual representations](http://www.numdam.org/item/AFST_2001_6_10_1_185_0.pdf), §6, Proposition 6.1, p. 207 (Numdam PDF page 24; printed page = PDF page + 183). Proposition 6.1 is Skinner–Wiles 1999 Propositions 5.8–5.9 with R^{tr} = R.
- [Nearly ordinary deformations of irreducible residual representations](http://www.numdam.org/item/AFST_2001_6_10_1_185_0.pdf), §8, opening, p. 209 (Numdam PDF page 26; printed page = PDF page + 183). The setting of §8.
- [Nearly ordinary deformations of irreducible residual representations](http://www.numdam.org/item/AFST_2001_6_10_1_185_0.pdf), §8, verification of (6.2)–(6.8), p. 212 (Numdam PDF page 29; printed page = PDF page + 183). The verification of the patching hypotheses.
- [Nearly ordinary deformations of irreducible residual representations](http://www.numdam.org/item/AFST_2001_6_10_1_185_0.pdf), §8, Proposition 8.1, p. 213 (Numdam PDF page 30; printed page = PDF page + 183). Proposition 8.1.
- [Nearly ordinary deformations of irreducible residual representations](http://www.numdam.org/item/AFST_2001_6_10_1_185_0.pdf), §8, Proposition 8.2, p. 214 (Numdam PDF page 31; printed page = PDF page + 183). Proposition 8.2 (the OCR reads [SW1] as [SWl]).

## R21.5. Skinner–Wiles and the small-prime cases

The residually reducible route does not require Serre modularity. The irreducible route assumes a compatible nearly ordinary modular seed and residual distinguishedness. The global p=3 case uses the imported local criterion. The original dihedral scope remains a specified target with a proof gap.

### Hypothesis H on relative class groups

**Target:** `OrdinaryAutomorphicFormsAndModularityLifting:R21.5/hypothesis-h` (definition).

Hypothesis H: there are 0 < ε < 1/4 and c(ε) > 0 such that for every totally real field K and finite set S of finite places of K there is an imaginary quadratic extension L/K with prescribed behaviour at each place of S whose relative class group has p-rank at most c(ε)·[K : ℚ]^{1−ε}.

**Hypotheses and conventions.**

- Stated for a fixed odd prime p; Theorem B assumes it for all solvable totally real extensions of F.

**Uses.**

- `OrdinaryAutomorphicFormsAndModularityLifting:R21.5/theorem-b`: controls dim H_{Σ_L}(L, k) in the tower of quadratic extensions.

**API.**

- `TauCeti.OrdinaryModularity.HypothesisH` (data): The existence of controlled imaginary quadratic extensions for all K and S.
- `TauCeti.OrdinaryModularity.HypothesisH.mono` (characterisation): Hypothesis H for F implies it for totally real extensions (it quantifies over all K).
- `TauCeti.OrdinaryModularity.HypothesisH.extension` (constructor): The imaginary quadratic L/K with prescribed local behaviour at S and relative class group of p-rank ≤ c(ε)[K : ℚ]^{1−ε}.

**Unit tests.**

- **hypothesisH_trivial_S** (example): For S = ∅ the prescribed behaviour is vacuous and only the class-group bound matters.
- **hypothesisH_exponent** (example): ε < 1/4 makes 2^{n(1−ε)} deg grow slower than 2^n deg, the degree growth of the tower in Theorem B's proof.
- **hypothesisH_uniform_constant** (example): Allowing the constant c to depend on K or S gives a weaker predicate and fails the uniform growth estimate: for degrees 2ⁿd, the normalized bound is c(ε)(2ⁿd)⁻ε with the same c(ε) for every n. Its convergence to zero is the input used by Theorem B.

**Construction or proof route.**

1. A hypothesis, not a theorem: Skinner–Wiles expect it to be easier than extending Washington's theorem to non-abelian fields.

**Checks.**

- Theorem B is conditional on Hypothesis H; nothing downstream may use Theorem B unconditionally.

**Direct prerequisites:** `OrdinaryAutomorphicFormsAndModularityLifting:R21.4/good-pair-and-nice-primes`.

**Sources.**

- [Residually reducible representations and modular forms](http://www.numdam.org/item/PMIHES_1999__89__5_0.pdf), §4.5, Hypothesis H, p. 75 (Numdam PDF page 72; printed page = PDF page + 3). Hypothesis H and its motivation.

### Skinner–Wiles Theorem A

**Target:** `OrdinaryAutomorphicFormsAndModularityLifting:R21.5/theorem-a` (theorem).

Let F be a totally real abelian extension of ℚ, p an odd prime and ρ : Gal(F̄/F) → GL₂(Q̄_p) continuous, irreducible and unramified outside finitely many places, with ρ̄^ss ≅ χ_1 ⊕ χ_2. If F(χ_1/χ_2) is abelian over ℚ, (χ_1/χ_2)(z) = −1 for every complex conjugation z, (χ_1/χ_2)|_{D_v} ≠ 1 for every v | p, ρ|_{D_v} ≅ (ψ^{(v)}_1χ̃_1 *; 0 ψ^{(v)}_2χ̃_2) with ψ^{(v)}_2 factoring through a pro-p group of F_v and ψ^{(v)}_2|_{I_v} of finite order, and det ρ = ψε^{k−1} with k ≥ 2 and ψ of finite order, then ρ is the representation of a Hilbert modular newform.

**Hypotheses and conventions.**

- F and F(χ_1/χ_2) abelian over ℚ; p odd.

**Uses.**

- `ClassicalSerreModularity:R26.1`: Khare's level-one argument (the residually reducible base case).

**Construction or proof route.**

1. ρ_1 = ρ ⊗ χ̃_2^{−1} with χ = χ_1/χ_2 is, in a suitable lattice, a deformation of type 𝒟 = (𝒪, Σ, c, ∅) for an admissible c (Lemma 2.13 and the local hypotheses); it remains to build L as in the Main Theorem.
2. Take E/F even, abelian over ℚ and permissible (E = F·E′ with E′ a real cyclic field where p splits and the primes of Σ are inert), ℓ ∤ p·#k^× odd, E_n the ℤ/ℓ^n-layer of the cyclotomic ℤ_ℓ-extension; #Σ_n, #𝒫_n stabilise (4.12), and by Washington's theorem the p-parts of the class groups of E_n(χ) and E_n stabilise (4.13) (gap).
3. Adjoin abelian p-extensions L_n/E_n ramified at a set S_n of e_n + c_n + 1 places with χ(Frob_w) = 1 and p^{e_n + c_n + 1} | Nm(w) − 1 (4.16); congruences of p-adic L-functions give L_p(L_n, −1, χω) ∈ 𝒪 ∖ 𝒪^× (4.17), and dim H_{Σ_0}(L_n, k) ≤ p^{e_n+2c_n+1}(r_n + e_n + c_n + 1) (4.18).
4. For n_0 large (4.19) and Waldschmidt's δ_L ≤ d_L/2 (gap), L = L_{n_0} satisfies (G) (4.20), so the Main Theorem applies.

**Checks.**

- The abelian hypotheses are exactly what Washington's theorem needs; for non-abelian F one uses Theorem B.

**Direct prerequisites:** `OrdinaryAutomorphicFormsAndModularityLifting:R21.4/main-theorem`; `OrdinaryAutomorphicFormsAndModularityLifting:R21.3/deformation-datum`; `OrdinaryAutomorphicFormsAndModularityLifting:R21.3/lattice-reduction-lemma`; `OrdinaryAutomorphicFormsAndModularityLifting:R21.4/good-pair-and-nice-primes`; `AutomorphicPadicLFunctions:L3`; `IntegralIwasawaTheory:L4`; `DiophantineApproximationAndTranscendence:DT.3`.

**Sources.**

- [Residually reducible representations and modular forms](http://www.numdam.org/item/PMIHES_1999__89__5_0.pdf), §4.5, Theorem A, p. 74 (Numdam PDF page 71; printed page = PDF page + 3). Theorem A.
- [Residually reducible representations and modular forms](http://www.numdam.org/item/PMIHES_1999__89__5_0.pdf), §4.6, proof of Theorem A, p. 75 (Numdam PDF page 72; printed page = PDF page + 3). The proof of Theorem A.
- [Residually reducible representations and modular forms](http://www.numdam.org/item/PMIHES_1999__89__5_0.pdf), §4.6, proof of Theorem A, p. 77 (Numdam PDF page 74; printed page = PDF page + 3). (4.17)–(4.19).

### Skinner–Wiles Theorem B (conditional on Hypothesis H)

**Target:** `OrdinaryAutomorphicFormsAndModularityLifting:R21.5/theorem-b` (theorem).

Let F be totally real and assume Hypothesis H for all solvable totally real extensions of F. Let p be odd and ρ : Gal(F̄/F) → GL₂(Q̄_p) continuous, irreducible and unramified outside finitely many places with ρ̄^ss ≅ χ_1 ⊕ χ_2. If (χ_1/χ_2)(z) = −1 for every complex conjugation z, (χ_1/χ_2)|_{D_v} has even order for every v | p, ρ|_{D_v} has the nearly ordinary shape of Theorem A with ψ^{(v)}_2 through a pro-p extension of F_v and finite order on I_v, and det ρ = ψε^{k−1} (k ≥ 2, ψ finite), then ρ is the representation of a Hilbert modular newform.

**Hypotheses and conventions.**

- Hypothesis H for all solvable totally real extensions of F.

**Construction or proof route.**

1. By base change it suffices to treat F⁺, the maximal totally real subfield of F(χ); there χ|_{D_v} ≠ 1 for v | p and χ is quadratic.
2. As in Theorem A, find a solvable permissible E of even degree with L_p(E, −1, χω) ∈ 𝒪 ∖ 𝒪^× and the ramification condition (4.21).
3. Hypothesis H gives totally imaginary quadratic characters ψ over E with prescribed local behaviour and small relative class groups; the splitting field of χψ is a totally real quadratic L_1/E, and iterating gives L_n with (4.22).
4. For n_0 as in (4.23), L = L_{n_0} satisfies (4.24) and (4.25) (with Waldschmidt's bound), so (L, 𝒟_L) is good (the proof's list says '(vi)' for condition (iv): E7).

**Checks.**

- Conditional: every consumer must carry Hypothesis H.

**Direct prerequisites:** `OrdinaryAutomorphicFormsAndModularityLifting:R21.4/main-theorem`; `OrdinaryAutomorphicFormsAndModularityLifting:R21.5/hypothesis-h`; `OrdinaryAutomorphicFormsAndModularityLifting:R21.5/theorem-a`; `GL2AutomorphicRepresentationsAndTransfer:R17.4`; `DiophantineApproximationAndTranscendence:DT.3`.

**Sources.**

- [Residually reducible representations and modular forms](http://www.numdam.org/item/PMIHES_1999__89__5_0.pdf), §4.5, Theorem B, p. 75 (Numdam PDF page 72; printed page = PDF page + 3). Theorem B.
- [Residually reducible representations and modular forms](http://www.numdam.org/item/PMIHES_1999__89__5_0.pdf), §4.6, proof of Theorem B, p. 78 (Numdam PDF page 75; printed page = PDF page + 3). The reduction to F⁺ and step (4.21).
- [Residually reducible representations and modular forms](http://www.numdam.org/item/PMIHES_1999__89__5_0.pdf), §4.6, end of the proof of Theorem B, p. 79 (Numdam PDF page 76; printed page = PDF page + 3). (4.22)–(4.25).

### Skinner–Wiles over ℚ

**Target:** `OrdinaryAutomorphicFormsAndModularityLifting:R21.5/theorem-a-over-q` (theorem).

Let p be an odd prime and ρ : G_ℚ → GL₂(ℚ̄_p) continuous, irreducible and unramified outside finitely many primes, with ρ̄^{ss} ≅ 1 ⊕ χ after a twist. If (i) χ|_{D_p} ≠ 1, (ii) ρ|_{I_p} ≅ (∗ ∗; 0 1), and (iii) det ρ = ψε^{k−1} for some k ≥ 2 and ψ of finite order, with det ρ odd, then ρ ≅ ρ_{f,λ} for a newform f of weight k. This is the theorem of Skinner–Wiles' introduction, and Theorem A with F = ℚ: ℚ is abelian, the splitting field of the character χ is abelian over ℚ, χ is odd because det ρ is, and (ii) gives the nearly ordinary shape with ψ₂^{(p)} trivial on I_p (its reduction is 1, so it factors through a pro-p group).

**Hypotheses and conventions.**

- over ℚ both abelian hypotheses of Theorem A are automatic, so no appeal to Washington's theorem beyond its abelian case, and no Hypothesis H, is needed
- (i) is p-distinguishedness; it is a hypothesis on the residual character, not on ρ
- Khare's level-one argument invokes this for residually reducible ordinary lifts; its residually irreducible degenerate case uses R21.5/nearly-ordinary-irreducible-lifting-over-q (Skinner–Wiles 2001)
- Hilbert newforms over F = ℚ are classical newforms (AutomorphicGaloisRepresentations R19.1)

**Construction or proof route.**

1. Twist so that ρ̄^{ss} = 1 ⊕ χ; check Theorem A's five hypotheses with F = ℚ, χ₁ = χ, χ₂ = 1.
2. Apply R21.5/theorem-a and identify the Hilbert newform over ℚ with a classical newform.

**Checks.**

- Check that "det ρ odd" gives χ(c) = −1 for complex conjugation c, as Theorem A requires
- Check that (ii) implies Theorem A's condition that ψ₂^{(p)} factor through a pro-p group

**Direct prerequisites:** `OrdinaryAutomorphicFormsAndModularityLifting:R21.5/theorem-a`; `AutomorphicGaloisRepresentations:R19.1/newform-rank-two-realisation`.

**Sources.**

- [Residually reducible representations and modular forms](http://www.numdam.org/item/PMIHES_1999__89__5_0.pdf), Introduction, p. 6 (Numdam PDF page 3). The ℚ-version stated in the introduction (the OCR renders ρ as p).
- [Residually reducible representations and modular forms](http://www.numdam.org/item/PMIHES_1999__89__5_0.pdf), Introduction, p. 6 (Numdam PDF page 3). Its conclusion.
- [On Serre's modularity conjecture for 2-dimensional mod p representations of Gal(Q̄/Q) unramified outside p](https://arxiv.org/pdf/math/0504080v1), Introduction, p. 3 of arXiv:math/0504080v1. Khare's use of Skinner–Wiles.

### The residually reducible p = 3 branch (Dieulefait–Pacetti Theorem 1.7)

**Target:** `OrdinaryAutomorphicFormsAndModularityLifting:R21.5/theorem-a-at-three` (theorem).

Let ρ : G_ℚ → GL₂(ℚ̄₃) be continuous, irreducible, odd and finitely ramified, with ρ̄^{ss} ≅ 1 ⊕ χ̄₃ (the mod-3 cyclotomic character), ρ|_{I₃} ≅ (∗ ∗; 0 1) and det ρ = ψχ₃^{k−1} (k ≥ 2, ψ of finite order). Then ρ is modular of weight k. This is R21.5/theorem-a-over-q at p = 3 with χ = χ̄₃: hypothesis (i), χ̄₃|_{D₃} ≠ 1, holds automatically because χ̄₃ is ramified at 3. Pan's residually reducible theorem does not cover this case: his Theorem 1.0.2 holds for every odd p, but at p = 3 it excludes exactly χ̄₁χ̄₂^{−1}|_{G_{ℚ₃}} = ω, and here χ̄₁χ̄₂^{−1} = χ̄₃^{∓1} restricts to ω on G_{ℚ₃}. Dieulefait–Pacetti quote Pan only for p ≥ 5.

**Hypotheses and conventions.**

- DP’s second hypothesis compares the local representation with the identity; the condition needed from Skinner–Wiles is nontriviality of χ̄₃ on D₃, which is automatic here (E9).
- DP Paso 6 obtains ordinarity at weights 2 and 4 from the crystalline-to-ordinary criterion imported from PadicHodgeTheory R06.4; its BLZ/Wach proof belongs to that supplier.
- GL2ModularityLifting R32.5 consumes this node for the modern proof's p = 3 branch
- Pan's p = 3 exclusion is the reason this branch still needs Skinner–Wiles; GL2ModularityLifting:R32.5/p-three-residually-reducible-branch records the same reading

**Construction or proof route.**

1. Specialise R21.5/theorem-a-over-q to p = 3, χ = χ̄₃.
2. χ̄₃ is odd and ramified at 3.
3. Check that ω² = 1 mod 3, so χ̄₁χ̄₂^{−1}|_{G_{ℚ₃}} = ω for either ordering of 1 ⊕ χ̄₃; this puts ρ outside Pan's Theorem 1.0.2.

**Checks.**

- Check χ̄₃(c) = −1 and χ̄₃|_{I₃} ≠ 1
- Check that DP's Theorem 1.7 conclusion (modular of weight k) matches
- Check that Pan's Theorem 1.0.2 excludes this ρ̄^{ss} at p = 3

**Direct prerequisites:** `OrdinaryAutomorphicFormsAndModularityLifting:R21.5/theorem-a-over-q`; `PadicHodgeTheory:R06.4`.

**Sources.**

- [A simplified proof of Serre's conjecture](https://arxiv.org/pdf/2108.07577v2), Theorem 1.7, p. 4 of arXiv:2108.07577v2. DP's statement (hypotheses begin).
- [A simplified proof of Serre's conjecture](https://arxiv.org/pdf/2108.07577v2), Proof of Theorem 1.7, p. 5. DP cite the introduction theorem of Skinner–Wiles.
- [A simplified proof of Serre's conjecture](https://arxiv.org/pdf/2108.07577v2), Paso 6, p. 14. The check DP make for the second hypothesis, unnecessary once it is read as χ̄₃|_{D₃} ≠ 1.
- [The Fontaine–Mazur conjecture in the residually reducible case](https://arxiv.org/pdf/1901.07166v2), Introduction, Theorem 1.0.2, p. 3 (arXiv v2). Pan's p = 3 exclusion (the extraction garbles χ̄₁χ̄₂^{−1} and ≠); it is exactly the case ρ̄^{ss} ≅ 1 ⊕ χ̄₃.

### Skinner–Wiles lifting for irreducible residual representations over totally real fields (Theorem 5.1)

**Target:** `OrdinaryAutomorphicFormsAndModularityLifting:R21.5/nearly-ordinary-irreducible-lifting` (theorem).

Let F be totally real, p odd, and ρ : Gal(F̄/F) → GL₂(Q̄_p) satisfy (5.1): continuous and irreducible, unramified outside a finite set Σ, det ρ(τ) = −1 for every complex conjugation τ, det ρ = ψε^μ with μ ≥ 1 and ψ of finite order, and ρ|_{D_i} ≅ (ψ^{(i)}_1 *; 0 ψ^{(i)}_2) with ψ^{(i)}_2|_{I_i} of finite order for each v_i | p. Call ρ D_i-distinguished if ρ̄^{ss}|_{D_i} ≅ (χ^{(i)}_1 *; 0 χ^{(i)}_2) with χ^{(i)}_1 ≠ χ^{(i)}_2, labelled so that χ^{(i)}_2 = ψ^{(i)}_2 mod λ; another ρ′ satisfying (5.1) is a χ₂-good lift of ρ̄^{ss} if (ρ̄′)^{ss} ≅ ρ̄^{ss} and ρ′|_{D_i} ≅ (φ^{(i)}_1 *; 0 φ^{(i)}_2) with φ^{(i)}_2 reducing to χ^{(i)}_2. (Theorem 5.1.) If (i) ρ̄^{ss} is irreducible and D_i-distinguished for all i, (ii) there is a nearly ordinary automorphic representation π₀ of GL₂/F with ρ_{π₀} a χ₂-good lift of ρ̄^{ss}, and (iii) ρ̄^{ss} is not induced from a quadratic extension F′/F with a complex place (the hypothesis the printed proof needs; source issue E11), then ρ ≅ ρ_π for an automorphic representation π.

**Hypotheses and conventions.**

- Skinner–Wiles state the theorem without (iii); their proof, through Lemma 2.2, covers a dihedral ρ̄^{ss} only when the dihedral locus has dimension at most d_L/2, which holds for F′ totally real and fails for CM F′ in which the places above p split (E11)
- ρ̄^{ss} is allowed to be reducible on Gal(F̄/F(ζ_p)): these are the cases Wiles, Diamond and Fujiwara exclude
- the base change input, Skinner–Wiles, Base change and a problem of Serre (Duke Math. J. 107 (2001)), is a gap

**Construction or proof route.**

1. Choose 𝒪, λ, k with ρ valued in GL₂(𝒪), and ρ̄^{ss} = Ind_{F′}^F ψ₀ if dihedral. By the main result of Skinner–Wiles, Base change and a problem of Serre, and hypothesis (ii), there is a totally real L/F with solvable Galois closure over F such that ρ₀ = ρ̄^{ss}|_{Gal(F̄/L)} satisfies (2.1) and (H_even), (H_def) hold for L and ρ₀.
2. Enlarge L by a large real subfield of a cyclotomic extension so that d_L/2 > 2 + 7·#Σ_L and d_v > 2 + 7·#Σ_L for v | p; then (L, ρ₀) is a good pair and Proposition 4.1's extra bound (E14) holds (checked in the Lean file).
3. ρ_1 = ρ|_{Gal(F̄/L)} is of type 𝒟_L = (𝒪, Σ_L, ∅); (P) holds by Proposition 8.2 (R21.4/irreducible-nice-prime-r-equals-t), so ρ_1 is pro-modular by Proposition 4.1 (R21.4/irreducible-pro-modularity), and the homomorphism T_{𝒟_L} → 𝒪 is algebraic.
4. Proposition 3.2 (PadicFamilies L5/hida-control-nearly-ordinary) gives ρ_1 ≅ ρ_{π_1} for a nearly ordinary π_1 of GL₂/L; solvable base change and descent (GL2AutomorphicRepresentationsAndTransfer R17.4) give π over F.

**Checks.**

- Record the hypotheses individually: p odd, (5.1)(i)–(v), D_i-distinguishedness, the χ₂-good nearly ordinary π₀, and (iii).
- This serves the requests of GL2ModularityLifting R22.1 (ordinary lifting over totally real F) and of PotentialModularityAndCompatibleSystems R23.3 (Taylor's ordinary case), with D_i-distinguishedness as an explicit hypothesis.

**Direct prerequisites:** `OrdinaryAutomorphicFormsAndModularityLifting:R21.4/irreducible-pro-modularity`; `OrdinaryAutomorphicFormsAndModularityLifting:R21.4/irreducible-nice-prime-r-equals-t`; `OrdinaryAutomorphicFormsAndModularityLifting:R21.3/irreducible-deformation-datum`; `PadicFamilies:L5/hida-control-nearly-ordinary`; `GL2AutomorphicRepresentationsAndTransfer:R17.4`; `AutomorphicGaloisRepresentations:R19.2`.

**Sources.**

- [Nearly ordinary deformations of irreducible residual representations](http://www.numdam.org/item/AFST_2001_6_10_1_185_0.pdf), §5, (5.1), p. 202 (Numdam PDF page 19; printed page = PDF page + 183). The conditions (5.1) (listed just above; the OCR reads ρ as p).
- [Nearly ordinary deformations of irreducible residual representations](http://www.numdam.org/item/AFST_2001_6_10_1_185_0.pdf), §5, proof of Theorem 5.1, p. 203 (Numdam PDF page 20; printed page = PDF page + 183). The base change to L.
- [Nearly ordinary deformations of irreducible residual representations](http://www.numdam.org/item/AFST_2001_6_10_1_185_0.pdf), §5, proof of Theorem 5.1, p. 204 (Numdam PDF page 21; printed page = PDF page + 183). d_L/2 > 2 + 7·#Σ_L and d_v > 2 + 7·#Σ_L.
- [Nearly ordinary deformations of irreducible residual representations](http://www.numdam.org/item/AFST_2001_6_10_1_185_0.pdf), §5, end of the proof of Theorem 5.1, p. 204 (Numdam PDF page 21; printed page = PDF page + 183). Descent by solvable base change.

### Skinner–Wiles over ℚ for irreducible residual representations (Theorem 5.2 and the introduction)

**Target:** `OrdinaryAutomorphicFormsAndModularityLifting:R21.5/nearly-ordinary-irreducible-lifting-over-q` (theorem).

Let p be odd and ρ : G_ℚ → GL₂(E) (E/ℚ_p finite) continuous, irreducible and unramified outside finitely many primes, with (i) ρ̄^{ss} irreducible, (ii) ρ̄^{ss}|_{D_p} ≅ (χ_1 *; 0 χ_2) with (χ_1/χ_2)|_{D_p} ≠ 1, (iii) ρ̄^{ss} modular, (iv) ρ|_{I_p} ≅ (* *; 0 1), (v) det ρ = ψε^{k−1} with k ≥ 2 and ψ of finite order, det ρ odd. If moreover ρ̄^{ss} is not induced from an imaginary quadratic field (the hypothesis (iii) of R21.5/nearly-ordinary-irreducible-lifting; source issue E11), then ρ comes from a modular form. This is the theorem of the introduction, and Theorem 5.2 (F = ℚ, (5.1), ρ̄^{ss} irreducible and D_p-distinguished, ρ̄^{ss} ≅ ρ̄^{ss}_{π₀} for some π₀). It includes the cases where ρ̄^{ss} is reducible over ℚ(ζ_p), precisely those not covered by Wiles and Diamond.

**Hypotheses and conventions.**

- Skinner–Wiles state it without the extra hypothesis; see E11 for what the printed proof covers
- Khare's level-one argument uses this theorem for residually irreducible ρ̄ with ρ̄|_{ℚ(ζ_p)} reducible; there ρ̄ is induced from ℚ(√p*), which is imaginary when p ≡ 3 mod 4, so that branch needs E11 resolved

**Construction or proof route.**

1. Hypothesis (ii) of Theorem 5.1 from modularity of ρ̄^{ss}: if p ≠ 3 or ρ̄^{ss}|_{G_{ℚ(√−3)}} is irreducible, Diamond, The refined conjecture of Serre, Theorem 6.4, gives a nearly ordinary π_1 with ρ_{π_1} a χ₂-good lift (SerreWeightAndLevelOptimisation R20.6, requested); Skinner–Wiles call the remaining cases obvious.
2. Apply R21.5/nearly-ordinary-irreducible-lifting with F = ℚ; a cuspidal π of GL₂/ℚ of weight k is a newform (AutomorphicGaloisRepresentations R19.1).

**Checks.**

- Check that the introduction's (ii)–(v) give (5.1) and D_p-distinguishedness with χ_2 the reduction of the unramified quotient.
- The characteristic-zero ρ is assumed irreducible, as in the residually reducible theorems (roadmap check).

**Direct prerequisites:** `OrdinaryAutomorphicFormsAndModularityLifting:R21.5/nearly-ordinary-irreducible-lifting`; `SerreWeightAndLevelOptimisation:R20.6`; `AutomorphicGaloisRepresentations:R19.1/newform-rank-two-realisation`.

**Sources.**

- [Nearly ordinary deformations of irreducible residual representations](http://www.numdam.org/item/AFST_2001_6_10_1_185_0.pdf), Introduction, Theorem, p. 186 (Numdam PDF page 3; printed page = PDF page + 183). The theorem of the introduction (stated on this page).
- [Nearly ordinary deformations of irreducible residual representations](http://www.numdam.org/item/AFST_2001_6_10_1_185_0.pdf), Introduction, p. 187 (Numdam PDF page 4; printed page = PDF page + 183). The cases ρ̄^{ss} reducible over ℚ(ζ_p) (the OCR reads [D1] as [Dl]).
- [Nearly ordinary deformations of irreducible residual representations](http://www.numdam.org/item/AFST_2001_6_10_1_185_0.pdf), §5, Theorem 5.2, p. 204 (Numdam PDF page 21; printed page = PDF page + 183). Theorem 5.2.
- [Nearly ordinary deformations of irreducible residual representations](http://www.numdam.org/item/AFST_2001_6_10_1_185_0.pdf), §5, proof of Theorem 5.2, p. 204 (Numdam PDF page 21; printed page = PDF page + 183). The appeal to Diamond [D2, Theorem 6.4].

### Skinner–Wiles irreducible lifting at its original scope

**Target:** `OrdinaryAutomorphicFormsAndModularityLifting:R21.5/nearly-ordinary-irreducible-lifting-full-scope` (theorem).

Under the hypotheses of nearly-ordinary-irreducible-lifting preceding its added condition (iii), the intended target is the ordinary modularity conclusion also for residual representations induced from a quadratic extension with a complex place. That is: for odd p and totally real F, a continuous irreducible odd finitely ramified ρ with det ρ = ψε^μ (μ ≥ 1, ψ finite order), nearly ordinary at every v | p with finite-order inertial quotient, absolutely irreducible p-distinguished residual representation, and a χ₂-good nearly ordinary modular residual lift, prove ρ modular without the added exclusion of the CM/mixed-signature dihedral case. This target is recorded with an unresolved proof gap; it is not supplied by the restricted theorem.

**Hypotheses and conventions.**

- Keep the distinguished quotient labels and the χ₂-good residual automorphic seed of the restricted target.
- Skinner–Wiles 2001 Theorem 5.1 states this scope; its printed dimension argument needs the correction recorded as E11.

**Construction or proof route.**

1. Use the existing restricted theorem for the non-CM/mixed dihedral cases.
2. For the excluded case replace the false universal d/2 bound by a valid nearly ordinary dihedral deformation argument. The cited Skinner 2009 correction has not been obtained, so this step is explicitly unresolved.
3. Only a corrected bound and the consequent pro-modularity argument would justify the full lifting conclusion.

**Checks.**

- Never present the restricted theorem as the full printed result.
- The CM counterexample to the dimension estimate is not a counterexample to the lifting theorem.

**Direct prerequisites:** `OrdinaryAutomorphicFormsAndModularityLifting:R21.5/nearly-ordinary-irreducible-lifting`; `OrdinaryAutomorphicFormsAndModularityLifting:R21.3/dihedral-deformation-dimension`.

**Sources.**

- [Nearly ordinary deformations of irreducible residual representations](http://www.numdam.org/item/AFST_2001_6_10_1_185_0.pdf), Theorem 5.1, pp. 202–204; Lemma 2.2, pp. 190–191. The intended irreducible ordinary lifting scope and its defective dihedral dimension input.

## R21.6. Ordinary-family outputs and independence

The outputs include family membership and precise ordinary lifts. BLGG12 prescribed-type lifting alone does not impose ordinarity: one must select ordinary local components. BLGG13’s headline theorem does not prescribe weight or determinant; the BCGP refinement records these additional conclusions. The NT component-preserving weight change requires a global argument beyond Hida specialization.

### Export: ordinary modularity over ℚ with its level

**Target:** `OrdinaryAutomorphicFormsAndModularityLifting:R21.6/exported-ordinary-modularity-over-q` (theorem).

Under the hypotheses of R21.5/theorem-a-over-q (ρ̄ reducible) or of R21.5/nearly-ordinary-irreducible-lifting-over-q (ρ̄^{ss} irreducible, Skinner–Wiles 2001) there are a newform f of weight k and a prime λ | p of its coefficient field with ρ ≅ ρ_{f,λ}. Its level N satisfies: for ℓ ≠ p, v_ℓ(N) is the Artin conductor exponent of ρ|_{G_{ℚ_ℓ}} (local-global compatibility away from p); and p ∤ N exactly when ρ|_{G_{ℚ_p}} is crystalline (compatibility at the coefficient prime). In particular, if ρ is unramified outside p and crystalline at p then f ∈ S_k(SL₂(ℤ)), which is the witness SmallRamificationAndAbelianVarietyBaseCases R25.5/ordinary-reducible-terminal-weights needs (and S_k(SL₂(ℤ)) = 0 for its weights gives the contradiction there). Consumers: ClassicalSerreModularity R26, R27.1 and R33.1, GL2ModularityLifting R32.1 and R32.5, PotentialModularityAndCompatibleSystems R23.4, and R25.5.

**Hypotheses and conventions.**

- the level statement at ℓ ≠ p is Carayol's local-global compatibility; at p it is compatibility at the coefficient prime (crystalline ⇔ p ∤ N for k ≥ 2)
- the newform is unique up to Galois conjugacy of its coefficients, by strong multiplicity one

**Construction or proof route.**

1. Existence from R21.5/theorem-a-over-q or R21.5/nearly-ordinary-irreducible-lifting-over-q.
2. Level away from p: AutomorphicGaloisRepresentations R19.4.
3. At p: R19.5.

**Checks.**

- Check the level-one case: unramified outside p and crystalline at p give N = 1
- Check that the character of f is ψ times the Teichmüller normalisation fixed by det ρ

**Direct prerequisites:** `OrdinaryAutomorphicFormsAndModularityLifting:R21.5/theorem-a-over-q`; `OrdinaryAutomorphicFormsAndModularityLifting:R21.5/nearly-ordinary-irreducible-lifting-over-q`; `AutomorphicGaloisRepresentations:R19.4/conductor-and-local-factors-classical`; `AutomorphicGaloisRepresentations:R19.5/potential-semistability-and-compatibility-at-the-coefficient-prime`; `AutomorphicGaloisRepresentations:R19.1/newform-rank-two-realisation`.

**Sources.**

- [Residually reducible representations and modular forms](http://www.numdam.org/item/PMIHES_1999__89__5_0.pdf), §4.5, Theorem A, p. 74 (Numdam PDF page 71). The conclusion that is exported.

### The ordinary theorems do not use Serre's conjecture

**Target:** `OrdinaryAutomorphicFormsAndModularityLifting:R21.6/independence-from-serre` (comparison).

For the legacy residually reducible Skinner–Wiles route only, the prerequisite closure of R21.5/theorem-a (and so of its specialisations and of the residually reducible branch of R21.6’s export) contains no node of ClassicalSerreModularity and no modularity assertion about a residually irreducible representation. Its inputs are: the nearly ordinary Hecke algebras (R21.1–R21.2, PadicFamilies); Wiles' Galois representations and Carayol's local-global compatibility (AutomorphicGaloisRepresentations R19); pseudo-representations and deformation rings (R21.3); patching (DeformationAndDerivedPatchingAlgebra R03.3–R03.6, GlobalGaloisDeformations R04.5); the Deligne–Ribet p-adic L-function (AutomorphicPadicLFunctions L3); solvable base change (GL2AutomorphicRepresentationsAndTransfer R17.4); and Washington, Waldschmidt and Raynaud (gaps). The residual representation is reducible, and its "modularity" is by an Eisenstein series, through the permissible maximal ideal (R21.2), not by Serre's conjecture. So the theorems may initialise Serre's conjecture (Khare's level one, the modern p = 3 branch) without circularity. The BLGG/NT targets explicitly start with residual modularity and use independent rank-two automorphy inputs; this independence assertion does not certify them as initial cases for Serre’s conjecture.

**Hypotheses and conventions.**

- the check is on prerequisite closures, not on the statements
- base change is used only along solvable extensions (Langlands), which does not presuppose Serre's conjecture

**Construction or proof route.**

1. Compute the prerequisite closure of R21.5/theorem-a across the packets and list its roadmaps.
2. Confirm that none is ClassicalSerreModularity and that the only residual modularity used is Eisenstein.

**Checks.**

- Check that the closure contains no node or stage of ClassicalSerreModularity
- Check that every modularity statement in the closure is for residually reducible ρ̄, or is the existence of Galois representations attached to forms

**Direct prerequisites:** `OrdinaryAutomorphicFormsAndModularityLifting:R21.5/theorem-a`; `OrdinaryAutomorphicFormsAndModularityLifting:R21.4/main-theorem`; `OrdinaryAutomorphicFormsAndModularityLifting:R21.2/eisenstein-ideal-existence`; `OrdinaryAutomorphicFormsAndModularityLifting:R21.2/permissible-maximal-ideal`; `OrdinaryAutomorphicFormsAndModularityLifting:R21.5/theorem-a-over-q`.

**Sources.**

- [Residually reducible representations and modular forms](http://www.numdam.org/item/PMIHES_1999__89__5_0.pdf), Introduction, p. 6 (Numdam PDF page 3). The irreducible case needs a Serre-type hypothesis; the reducible case does not.
- [Residually reducible representations and modular forms](http://www.numdam.org/item/PMIHES_1999__89__5_0.pdf), Introduction, p. 8 (Numdam PDF page 5). Residual modularity comes from Eisenstein congruences.

### The Galois representation of a Hida family over ℚ

**Target:** `OrdinaryAutomorphicFormsAndModularityLifting:R21.6/hida-family-galois-representation-over-q` (construction).

Let p be an odd prime (p ≥ 5 for PadicFamilies' control theorem), N prime to p, Λ = ℤ_p[[1 + pℤ_p]] with fraction field L, T_N Hida's ordinary cuspidal Hecke algebra of tame level N (PadicFamilies L0) and T^new_N its new quotient (the maximal quotient acting faithfully on the ordinary forms new at level N; requested from PadicFamilies L0). (EPW Theorem 2.3.1.) There is a continuous ρ : G_ℚ → GL₂(T^new_N ⊗_Λ L), characterised by (1) ρ unramified outside Np and (2) for ℓ ∤ Np, ρ(Frob_ℓ) has characteristic polynomial X² − T_ℓX + ⟨ℓ⟩ℓ^{−1}; moreover (3) ρ is absolutely irreducible, (4) det ρ is x ↦ ⟨x⟩x^{−1} composed with the cyclotomic character, and (5) the I_p-coinvariants of ρ are free of rank one and Frob_p acts on them by U_p. (Proposition 2.3.2.) For each minimal prime 𝔞 of T^new_N, ρ_𝔞 has tame conductor N. (Proposition 2.3.3.) At a classical height-one prime ℘, for a ρ-stable (T^new_N)_℘-lattice 𝓛 and ℓ ≠ p, 𝓛^{I_ℓ} is free, commutes with ⊗_Λ L and specialises to (𝓛/℘𝓛)^{I_ℓ}, and 𝓛/℘𝓛 carries ρ_{f_℘}. (Theorem 2.3.4.) Each maximal ideal m has a semisimple residual ρ̄_m with the same trace and determinant modulo m and ρ̄_m|_{D_p} ≅ (χ *; 0 ψ) with ψ unramified and ψ(Frob_p) = U_p mod m. (Proposition 2.3.5.) If ρ̄_m is irreducible, ρ_m has a model over (T^new_N)_m, unique up to isomorphism, whose I_p-coinvariants are free of rank one; this gives ρ̄_m its canonical p-stabilisation (Definitions 2.3.6–2.3.7).

**Hypotheses and conventions.**

- the Hecke side (T_N, T^new_N, classical height-one primes, control) is PadicFamilies L0's; this node is the Galois side, which PadicFamilies L4's RS-08 note assigns to this roadmap
- R21.3/hida-family-representation covers even-degree totally real F only (Skinner–Wiles' quaternionic towers); this is the classical family over ℚ, from Hida (Invent. Math. 85, 1986, Theorem 2.1) and Greenberg–Stevens (Theorem 2.6) as recalled by EPW
- the integral model in Proposition 2.3.5 needs ρ̄_m irreducible; in the residually reducible case only the pseudo-representation is integral

**Uses.**

- `OrdinaryAutomorphicFormsAndModularityLifting:R21.6/ordinary-newform-lies-in-a-hida-family`: the family's representation specialises to ρ_f at the point of f.
- `PadicFamilies:L1`: the family-symbol modules M^±_m of EPW §4 are built over (T_N)_m with this ρ_m (p-distinguished, ρ̄_m irreducible).
- `PadicFamilies:L4`: the ordinary big Galois representation that L4's RS-08 note imports from this roadmap, over ℚ.

**API.**

- `TauCeti.OrdinaryModularity.hidaFamilyRep` (constructor): ρ : G_ℚ → GL₂(T^new_N ⊗_Λ L).
- `TauCeti.OrdinaryModularity.hidaFamilyRep_charpoly` (characterisation): For ℓ ∤ Np, charpoly ρ(Frob_ℓ) = X² − T_ℓX + ⟨ℓ⟩ℓ^{−1}.
- `TauCeti.OrdinaryModularity.hidaFamilyRep_det` (characterisation): det ρ = ⟨·⟩(·)^{−1} ∘ cyclotomic character.
- `TauCeti.OrdinaryModularity.hidaFamilyRep_ordinary` (characterisation): The I_p-coinvariants are free of rank one with Frob_p acting by U_p.
- `TauCeti.OrdinaryModularity.hidaFamilyRep_tameConductor` (characterisation): Proposition 2.3.2: ρ_𝔞 has tame conductor N.
- `TauCeti.OrdinaryModularity.hidaFamilyRep_integral` (constructor): Proposition 2.3.5: the model ρ_m over (T^new_N)_m when ρ̄_m is irreducible.
- `TauCeti.OrdinaryModularity.hidaFamilyRep_specialise` (compatibility): At a classical ℘, the reduction of a lattice carries ρ_{f_℘}.

**Unit tests.**

- **hidaFamilyRep_weight_two_point** (example): At the weight-2 point of the family through X₀(11) at p = 5 (R21.6/required-examples-x0-11-at-five) the specialisation is ρ_{f,5}, with U_5 ↦ a_5 ≡ 1 mod 5.
- **hidaFamilyRep_det_weight** (example): At a classical ℘ of weight k and trivial character, det ρ_{f_℘} = ε^{k−1}.
- **hidaFamilyRep_reducible_residual** (example): For ρ̄_m reducible (the Eisenstein component through X₀(11) at 5), Proposition 2.3.5 does not apply; only the traces are integral.
- **hidaFamilyRep_ordinary_quotient** (example): The unramified quotient reduces to ψ with ψ(Frob_p) = U_p mod m (Theorem 2.3.4).

**Construction or proof route.**

1. Glue the ρ_{f_℘} over the Zariski-dense classical height-one primes (Hida; Greenberg–Stevens, as cited by EPW), using (3) of Theorem 2.2.2 of EPW (T^new_N ⊗ Λ_℘ is étale over Λ_℘ at classical ℘).
2. Proposition 2.3.2: compare dim V^{I_ℓ} with dim V(℘)^{I_ℓ} through the conductor formula; the determinant of ρ_𝔞(σ) − 1 on V^{J_ℓ} lies in every classical ℘ of the normalisation, hence vanishes.
3. Theorem 2.3.4: reduce an integral model over the normalisation, semisimplify and descend.
4. Proposition 2.3.5: Carayol's theorem (GlobalGaloisDeformations R04.2/carayol-trace-theorem), since the traces lie in (T^new_N)_m and ρ̄_m is irreducible.

**Checks.**

- Check (5) against the ordinarity criterion: at a classical ℘ of weight k, U_p ↦ the unit root α_p of f_℘ and the unramified quotient is the one of PadicHodgeTheory R06.4/two-dimensional-ordinarity-criterion.
- Do not claim a GL₂(T^new_N)-valued representation without an irreducibility hypothesis on ρ̄_m.

**Direct prerequisites:** `PadicFamilies:L0`; `PadicFamilies:L0/hida-control-theorem`; `PadicFamilies:L0/arithmetic-specialization`; `GlobalGaloisDeformations:R04.2/carayol-trace-theorem`; `AutomorphicGaloisRepresentations:R19.1/newform-rank-two-realisation`; `AutomorphicGaloisRepresentations:R19.4/conductor-and-local-factors-classical`.

**Sources.**

- [Variation of Iwasawa invariants in Hida families](https://arxiv.org/pdf/math/0404484v1), §2.3, Theorem 2.3.1, p. 10 (arXiv v1; printed page = PDF page). Theorem 2.3.1 and its properties (1)–(5).
- [Variation of Iwasawa invariants in Hida families](https://arxiv.org/pdf/math/0404484v1), §2.3, proof of Theorem 2.3.1, p. 10 (arXiv v1; printed page = PDF page). Hida and Greenberg–Stevens.
- [Variation of Iwasawa invariants in Hida families](https://arxiv.org/pdf/math/0404484v1), §2.3, Proposition 2.3.2, p. 11 (arXiv v1; printed page = PDF page). Proposition 2.3.2.
- [Variation of Iwasawa invariants in Hida families](https://arxiv.org/pdf/math/0404484v1), §2.3, Theorem 2.3.4, p. 12 (arXiv v1; printed page = PDF page). Theorem 2.3.4 (on p. 13).
- [Variation of Iwasawa invariants in Hida families](https://arxiv.org/pdf/math/0404484v1), §2.3, Proposition 2.3.5 and Definitions 2.3.6–2.3.7, p. 13 (arXiv v1; printed page = PDF page). The integral model over (T^new_N)_m (Carayol, EPW [2]).
- [Variation of Iwasawa invariants in Hida families](https://arxiv.org/pdf/math/0404484v1), §2.3, Definition 2.3.7, p. 13 (arXiv v1; printed page = PDF page). The canonical p-stabilisation.

### The exported ordinary newform lies in a Hida family

**Target:** `OrdinaryAutomorphicFormsAndModularityLifting:R21.6/ordinary-newform-lies-in-a-hida-family` (theorem).

Let p ≥ 5 and let f be a newform of weight k ≥ 2 and level N₀ or N₀p (p ∤ N₀) that is ordinary at p (a unit U_p- or T_p-eigenvalue root). Then f, or its unique ordinary p-stabilisation f_α, is the specialisation at a classical height-one prime of a unique primitive component 𝒦 of Hida's ordinary Hecke algebra of tame level N₀ (Hida, Corollary 3.7), and the Galois representation of R21.6/hida-family-galois-representation-over-q specialises there to ρ_{f,λ}. In particular, if ρ is exported by R21.6/exported-ordinary-modularity-over-q (under (ii) ρ|_{I_p} ≅ (∗ ∗; 0 1)), the newform f with ρ ≅ ρ_{f,λ} is ordinary at p and lies in a Hida family whose representation interpolates ρ.

**Hypotheses and conventions.**

- p ≥ 5, the range of PadicFamilies L0's control theorem
- ordinarity of f from that of ρ: an unramified quotient of ρ|_{G_{ℚ_p}} forces a unit root (PadicHodgeTheory R06.4/two-dimensional-ordinarity-criterion)
- uniqueness of 𝒦 is Hida's Corollary 3.7 (requested from PadicFamilies L0, which owns Hida families)

**Construction or proof route.**

1. EPW §2.1 (after Theorem 2.1.2): classical height-one primes of T_N of weight k correspond to Galois-conjugacy classes of p-ordinary normalised eigenforms of tame level N and weight k ≥ 2; hence f_α gives a classical prime ℘_f.
2. Hida, Corollary 3.7: an ordinary form of weight k ≥ 2 whose primitive form has conductor divisible by N₀ belongs to a unique primitive component.
3. Specialisation: R21.6/hida-family-galois-representation-over-q (Proposition 2.3.3 and the characterisation by traces).
4. For the export: ρ|_{I_p} ≅ (∗ ∗; 0 1) gives an unramified quotient, so f is ordinary by the ordinarity criterion.

**Checks.**

- Record multiplicity: a p-old f of level N₀ has two p-stabilisations and only one is ordinary.
- k = 2 is allowed for cusp forms (PadicFamilies L0/hida-control-theorem uses k ≥ 2 for cusp forms).

**Direct prerequisites:** `OrdinaryAutomorphicFormsAndModularityLifting:R21.6/hida-family-galois-representation-over-q`; `OrdinaryAutomorphicFormsAndModularityLifting:R21.6/exported-ordinary-modularity-over-q`; `PadicFamilies:L0`; `PadicFamilies:L0/arithmetic-specialization`; `PadicHodgeTheory:R06.4/two-dimensional-ordinarity-criterion`.

**Sources.**

- [Variation of Iwasawa invariants in Hida families](https://arxiv.org/pdf/math/0404484v1), §2.1, after Theorem 2.1.2, p. 8 (arXiv v1; printed page = PDF page). Every ordinary eigenform of weight ≥ 2 gives a classical point of T_N.
- [Iwasawa modules attached to congruences of cusp forms](https://www.numdam.org/item/10.24033/asens.1507.pdf), §3, Corollary 3.7, p. 253 (Numdam PDF page 24; printed page = PDF page + 229). The converse half of Corollary 3.7 (uniqueness and primitivity).

### Required example: X₀(11) at p = 5

**Target:** `OrdinaryAutomorphicFormsAndModularityLifting:R21.6/required-examples-x0-11-at-five` (application).

Let f be the normalised newform spanning S₂(Γ₀(11)) (X₀(11) has genus 1, so the Hecke algebra T is ℤ). Mazur's Eisenstein ideal 𝔍 ⊆ T (generated by 1 + w and the T_ℓ − 1 − ℓ, ℓ ≠ 11) has T/𝔍 ≅ ℤ/n with n = numerator((11 − 1)/12) = 5 (Proposition II.9.7), so a_ℓ(f) ≡ 1 + ℓ mod 5 for every prime ℓ ≠ 11. Hence: (a) a_5(f) ≡ 1 mod 5, so f is ordinary at 5 (an ordinary weight-two form); (b) ρ̄_{f,5}^{ss} ≅ 1 ⊕ ω by Chebotarev and Brauer–Nesbitt, a residual split p-distinguished representation: χ = ω is odd and ramified at 5, so χ|_{D_5} ≠ 1; (c) ρ_{f,5} is irreducible and satisfies (i)–(iii) of R21.5/theorem-a-over-q with k = 2, so that theorem applies (and returns f); (d) the reducible 1 ⊕ ε₅ also has residual 1 ⊕ ω and satisfies (i)–(iii) with k = 2 and odd determinant, but is attached to no cuspidal newform, so the irreducibility hypothesis cannot be dropped; (e) p = 5 is in the range of Hida theory, and the ordinary 5-stabilisation f_α of level 55 lies in a Hida family (R21.6/ordinary-newform-lies-in-a-hida-family) whose specialisations at weights k ≡ 2 mod 4 have trivial character; for k > 2 they are 5-old, since a form new at 5 of weight k and trivial character has a_5² = 5^{k−2}, not a unit.

**Hypotheses and conventions.**

- this is the roadmap's 'ordinary weight-two form and its arithmetic specialisations', 'residual p-distinguished split representation' and 'irreducibility of the characteristic-zero representation' checks
- the family's residual representation is reducible (Eisenstein), so only its pseudo-representation is integral (R21.6/hida-family-galois-representation-over-q, Proposition 2.3.5 does not apply)

**Construction or proof route.**

1. n = numerator(10/12) = 5 and T/𝔍 ≅ ℤ/5 (Mazur Proposition II.9.7); T = ℤ gives the congruences.
2. a_5 ≡ 1 + 5 ≡ 1: a unit, so f is 5-ordinary; the unramified quotient of ρ_{f,5}|_{G_{ℚ_5}} reduces to 1 and the sub to ω.
3. ω has order 4 on I_5, so the two residual characters differ on I_5 (checked in the Lean file).
4. 1 ⊕ ε₅ is reducible; cuspidal newforms have irreducible ρ_{f,λ} (AutomorphicGaloisRepresentations R19.1).
5. Weights: the family's character at weight k is ω^{2−k}, trivial exactly when 4 | k − 2; for f new at 5 with trivial character, a_5² = 5^{k−2} (AutomorphicGaloisRepresentations R19.4, the Steinberg local factor).

**Checks.**

- Check the numerology in the Lean file: n = 5, a_5 ≡ 1 mod 5, ω nontrivial of order 4, and 5 | a_5² for new forms of weight k > 2.

**Direct prerequisites:** `OrdinaryAutomorphicFormsAndModularityLifting:R21.5/theorem-a-over-q`; `OrdinaryAutomorphicFormsAndModularityLifting:R21.6/ordinary-newform-lies-in-a-hida-family`; `AutomorphicGaloisRepresentations:R19.1/newform-rank-two-realisation`; `AutomorphicGaloisRepresentations:R19.4/conductor-and-local-factors-classical`.

**Sources.**

- [Modular curves and the Eisenstein ideal](http://www.numdam.org/item/PMIHES_1977__47__33_0.pdf), Chapter II, Proposition 9.7 and the definition of Eisenstein primes, p. 96 (Numdam PDF page 65; printed page = PDF page + 31). T/𝔍 = ℤ/n with n = numerator((N − 1)/12).
- [Modular curves and the Eisenstein ideal](http://www.numdam.org/item/PMIHES_1977__47__33_0.pdf), Chapter II, before Proposition 9.8, p. 96 (Numdam PDF page 65; printed page = PDF page + 31). n > 1 exactly when X₀(N) has positive genus.

### Required example: when p-distinguishedness holds and when it fails

**Target:** `OrdinaryAutomorphicFormsAndModularityLifting:R21.6/required-examples-p-distinguishedness` (application).

(a) Let ρ satisfy (ii) ρ|_{I_p} ≅ (∗ ∗; 0 1) and (iii) det ρ = ψε^{k−1} of R21.5/theorem-a-over-q with ψ unramified at p and p odd. On I_p the residual sub-character is ω^{k−1} and the quotient is 1, so they differ as soon as (p − 1) ∤ (k − 1); for k even this always holds, and hypothesis (i) χ|_{D_p} ≠ 1 is automatic (this is also why Dieulefait–Pacetti's second hypothesis is automatic, source issue E9). (b) The hypothesis fails for the odd character χ_{−23} of ℚ(√−23) at p = 3: 3 splits in ℚ(√−23) because −23 ≡ 1 mod 3, so χ_{−23}|_{D_3} = 1, and R21.5/theorem-a-over-q says nothing about ρ with ρ̄^{ss} ≅ 1 ⊕ χ_{−23}. By (a), an ordinary ρ of this kind with ψ unramified at 3 would need k − 1 even. Whether such ρ exist is not asserted.

**Hypotheses and conventions.**

- (i) is a condition on the residual character only; this node checks it against the other hypotheses

**Construction or proof route.**

1. (a) ω^{k−1}|_{I_p} = 1 exactly when (p − 1) | (k − 1); p − 1 is even and k − 1 is odd for k even.
2. (b) −23 ≡ 1 mod 3 is a square, so 3 splits in ℚ(√−23) and Frob_3 ↦ 1 under χ_{−23}; χ_{−23} is unramified at 3 and odd.

**Checks.**

- Check both parity facts and the splitting of 3 in the Lean file.

**Direct prerequisites:** `OrdinaryAutomorphicFormsAndModularityLifting:R21.5/theorem-a-over-q`; `OrdinaryAutomorphicFormsAndModularityLifting:R21.5/theorem-a-at-three`.

**Sources.**

- [Residually reducible representations and modular forms](http://www.numdam.org/item/PMIHES_1999__89__5_0.pdf), Introduction, p. 6 (Numdam PDF page 3). Hypothesis (i) χ|_{D_p} ≠ 1 of the ℚ-theorem (the OCR reads ρ as p).

### Solvable ordinary automorphy seeds in rank two

**Target:** `OrdinaryAutomorphicFormsAndModularityLifting:R21.6/ordinary-weight-zero-seed` (theorem).

Let F be totally real and r̄:G_F → GL₂(F̄_l) irreducible and modular. In the first case assume l ≥ 5, r̄(G_{F(ζ_l)}) is 2-big, and [F^{ker ad r̄}(ζ_l):F^{ker ad r̄}] > 2. Then there is a finite solvable totally real L/F, linearly disjoint from F^{ker r̄}(ζ_l), such that r̄ is trivial at every l-adic decomposition group of L and is the reduction of a cuspidal regular algebraic representation of GL₂(A_L), of weight 0, unramified at all finite places, and ordinary at every l-adic place. In the second case, l ≥ 3 and r̄ = Ind_{G_M}^{G_F} θ̄ for a quadratic CM extension M/F and a character θ̄ not extending to G_F; there is such an ordinary weight-zero everywhere-unramified automorphic lift after a solvable totally real L/F linearly disjoint from MF^{ker r̄}(ζ_l). Local residual triviality in this second case is obtained by a further allowed solvable extension, rather than being part of Proposition 6.1.4’s displayed conclusion.

**Hypotheses and conventions.**

- 2-big means the residual-image cohomology and eigenvalue conditions of BLGG12 §4.1; it is not merely absolute irreducibility.
- No local reducibility of r̄ over F is assumed for an ordinary seed after base change.

**Construction or proof route.**

1. In the 2-big case use Lemma 6.1.1 to reach an everywhere-unramified nonordinary weight-zero form with trivial local reduction.
2. Use the induced-character construction of §2.1, the rank-two tensor automorphy argument of Theorem 3.5.1 and the untwisting Proposition 5.1.1; ordinary weight change and a finite deformation ring then yield a weight-zero ordinary seed. These rank-two instances move to this owner, with the missing tensor automorphy implementation recorded as a gap.
3. In the CM-induced case split l-adic places in M by solvable base change, lift the inducing character with one unramified and one cyclotomic weight, kill its finite ramification, and apply quadratic automorphic induction.

**Checks.**

- Preserve the exact avoidance field and the local-triviality distinction between the two propositions.
- The tensor automorphy input is a recorded lower-tier ownership move, not an incoming edge from PotentialAutomorphyInfrastructure.

**Direct prerequisites:** `GL2AutomorphicRepresentationsAndTransfer:R17.4`; `PadicFamilies:L5`; `GlobalGaloisDeformations:R04.3`; `GlobalGaloisDeformations:R04.5`; `LocalGaloisDeformationRings:L8`; `ArithmeticGaloisRepresentations:R01.4`; `GL2AutomorphicRepresentationsAndTransfer:R17.5`.

**Sources.**

- [Congruences between Hilbert modular forms: constructing ordinary lifts](https://www.ma.imperial.ac.uk/~tsg/Index_files/ordinaryHMF.pdf), Proposition 6.1.3 and proof, pp. 35–39; Proposition 6.1.4, pp. 39–40 (author PDF). The two ordinary seed constructions.

### BLGG prescribed-component modular lifts

**Target:** `OrdinaryAutomorphicFormsAndModularityLifting:R21.6/prescribed-type-modular-lift` (theorem).

Let l ≥ 7, F totally real, and r̄:G_F → GL₂(F̄_l) irreducible and modular. Choose a continuous ψ:G_F → Q̄_l× with εψ of finite order and ψ̄ = det r̄. Let S be a finite set of finite places containing all l-adic places and all ramification of r̄ and ψ. For every v ∈ S choose a two-dimensional inertial type τ_v with determinant (ψε)|I_v, and an irreducible component C_v of the generic fibre of the framed fixed-determinant lifting ring of type τ_v; at v | l use the potentially Barsotti–Tate ring. Assume that a lift of each specified type and determinant exists, potentially Barsotti–Tate at l; choose C_v among the resulting nonempty components. Assume [F(ζ_l):F] > 4 and r̄|G_{F(ζ_l)} absolutely irreducible. There is a continuous lift r:G_F → GL₂(Z̄_l) with det r = ψ, modular and unramified outside S, whose local point lies on C_v for every v ∈ S and has type τ_v, and which is potentially Barsotti–Tate at every v | l.

**Hypotheses and conventions.**

- All local fixed-determinant components are chosen before the global lift; choosing just an inertial type is weaker.
- The type’s determinant is (ψε)|I_v, not ψ|I_v, under the source’s Weil–Deligne normalization.
- “Absolutely irreducible” is equivalent to the source’s irreducibility because the coefficient field is algebraically closed.

**Construction or proof route.**

1. Use BLGG12 Lemma 4.4.2 to split the projective image into the 2-big case and the dihedral/A₄ cases.
2. In the former case cyclotomic degree > 4 gives the adjoint-field degree > 2 needed for Theorem 6.1.5; in the latter pass through a cyclic extension of degree 1 or 3 and use the CM-induced seed.
3. Apply the fixed-determinant component descent used in Theorem 6.1.5: local nonempty components, the ordinary seed after solvable base change and global ring finiteness produce a characteristic-zero point on the prescribed components, and modularity descends.

**Checks.**

- Retain l ≥ 7 and [F(ζ_l):F] > 4 as separate hypotheses.
- Do not infer ordinarity from arbitrary Barsotti–Tate components; select ordinary components when ordinarity is wanted.

**Direct prerequisites:** `OrdinaryAutomorphicFormsAndModularityLifting:R21.6/ordinary-weight-zero-seed`; `LocalGaloisDeformationRings:L8`; `GlobalGaloisDeformations:R04.3`; `GlobalGaloisDeformations:R04.5`; `GL2AutomorphicRepresentationsAndTransfer:R17.4`; `ArithmeticGaloisRepresentations:R01.4`.

**Sources.**

- [Congruences between Hilbert modular forms: constructing ordinary lifts](https://www.ma.imperial.ac.uk/~tsg/Index_files/ordinaryHMF.pdf), Theorem 6.1.9 and proof, pp. 44–45; Theorem 6.1.5, pp. 40–42 (author PDF). Prescribed local types, determinants, components and global ramification.
- [Symmetric power functoriality for Hilbert modular forms](https://arxiv.org/pdf/2212.03595v2), Proof of Proposition 6.1, PDF pp. 46–47 (arXiv:2212.03595v2). The auxiliary q-adic prescribed-component application.

### Ordinary weight-zero lifts for nonexceptional cyclotomic image

**Target:** `OrdinaryAutomorphicFormsAndModularityLifting:R21.6/nonexceptional-ordinary-lift` (theorem).

Let l > 2, F totally real and r̄:G_F → GL₂(F̄_l) irreducible and modular. Assume its cyclotomic restriction is absolutely irreducible, and exclude projective cyclotomic image PSL₂(F₃) when l = 3 and PSL₂(F₅) when l = 5. Then there is a finite solvable totally real L/F, linearly disjoint from F^{ker r̄}, over which r̄ has a modular ordinary weight-zero lift. If r̄|G_{F_v} is reducible for every v | l, such a lift exists already over F.

**Hypotheses and conventions.**

- By BLGG13 Proposition 2.1.1 these image conditions say exactly that the cyclotomic image is adequate in rank two.
- No p-distinguishedness, unramifiedness of F at l or cyclotomic degree > 4 is imposed.

**Construction or proof route.**

1. Use the rank-two adequacy classification rather than the stronger 2-big condition.
2. Repeat the solvable seed construction with the improved ordinary automorphy lifting input of the appendix to BLGG13 Serre weights for rank-two unitary groups. The exact automorphy input is recorded in the seed/descent gap.
3. When the local residual representations are reducible, use their ordinary local lifts and the component/global descent of Gee §3 as in BLGG13 Theorem 2.1.2(2).

**Checks.**

- Do not use the older 2-big theorem to justify the adequate case.
- The avoidance field here is F^{ker r̄}; do not silently strengthen it to the cyclotomic compositum.

**Direct prerequisites:** `ArithmeticGaloisRepresentations:R01.4`; `LocalGaloisDeformationRings:L8`; `GlobalGaloisDeformations:R04.3`; `GlobalGaloisDeformations:R04.5`; `GL2AutomorphicRepresentationsAndTransfer:R17.4`; `PadicFamilies:L5`.

**Sources.**

- [Congruences between Hilbert modular forms: constructing ordinary lifts, II](https://www.ma.imperial.ac.uk/~tsg/Index_files/ordinaryHMFpostBLGGTversion.pdf), Proposition 2.1.1, PDF p. 2; Theorem 2.1.2 and proof, PDF pp. 3–4. Adequacy classification and the two ordinary lift conclusions.

### BLGG ordinary modular lifts over totally real fields

**Target:** `OrdinaryAutomorphicFormsAndModularityLifting:R21.6/blgg-ordinary-modular-lift` (theorem).

Let l > 2, F totally real and r̄:G_F → GL₂(F̄_l) irreducible and modular, with r̄|G_{F_v} reducible at every v | l. If l = 5 and the projective image of r̄|G_{F(ζ₅)} is PSL₂(F₅), assume also that a finite solvable totally real F′/F makes r̄|G_{F′} conjugate into GL₂(F₅). Then r̄ has a modular lift r:G_F → GL₂(Q̄_l) ordinary at every v | l. The headline theorem does not itself prescribe the lift’s weight, determinant or nebentypus.

**Hypotheses and conventions.**

- Modular means the reduction of the l-adic representation of a regular algebraic automorphic GL₂ representation over F.
- Local reducibility is required; global irreducibility and modularity are hypotheses, not outputs.

**Construction or proof route.**

1. For absolutely irreducible nonexceptional cyclotomic image apply nonexceptional-ordinary-lift.
2. For projective PSL₂(F₃) use Langlands–Tunnell after solvable base change to obtain a finite-image weight-one form, then Hida weight change and component descent.
3. For projective PSL₂(F₅) use the extra GL₂(F₅) realizability hypothesis, the elliptic-curve construction of SBT97 and the 3–5 argument, followed by the component descent.
4. If the cyclotomic restriction is reducible, use Allen’s ordinary lifting argument as cited in the proof of Theorem A; this dihedral automorphy input remains an explicit gap here.

**Checks.**

- Do not drop the exceptional p = 5 realizability hypothesis.
- This is a lift construction from modular residual data, not a proof of residual modularity.

**Direct prerequisites:** `OrdinaryAutomorphicFormsAndModularityLifting:R21.6/nonexceptional-ordinary-lift`; `GL2AutomorphicRepresentationsAndTransfer:R17.4`; `PadicFamilies:L5`; `LocalGaloisDeformationRings:L8`; `GlobalGaloisDeformations:R04.5`; `ArithmeticGaloisRepresentations:R01.4`; `GL2AutomorphicRepresentationsAndTransfer:R17.5`.

**Sources.**

- [Congruences between Hilbert modular forms: constructing ordinary lifts, II](https://www.ma.imperial.ac.uk/~tsg/Index_files/ordinaryHMFpostBLGGTversion.pdf), Theorem A, PDF p. 1; Theorems 3.1.1–3.2.1 and proof of Theorem A, PDF pp. 4–5. Ordinary lift construction including the two inadequate cases and the cyclotomic-reducible branch.

### Small-prime ordinary weight-two lifts used by BCGP

**Target:** `OrdinaryAutomorphicFormsAndModularityLifting:R21.6/small-prime-ordinary-weight-two-lift` (theorem).

Let E be totally real, let p ∈ {3,5} be unramified in E, and let r̄:G_E → GL₂(F̄_p) be continuous and modular with det r̄ = ε̄⁻¹. Assume r̄|G_{E(ζ_p)} is absolutely irreducible and, at every w | p, r̄|I_w is an extension of ε̄⁻¹ by 1 (a stable line with character 1 and quotient ε̄⁻¹, in the literal extension convention). Then r̄ is the reduction of an ordinary Hilbert modular eigenform over E of parallel weight 2 and trivial nebentypus; equivalently in the dual normalization the determinant of its p-adic representation is ε⁻¹. This is the refined local-weight/determinant consequence used in BCGP, rather than the unrefined statement of BLGG13 Theorem A.

**Hypotheses and conventions.**

- Fix the local ordinary filtration compatible with the weight-two local lift. The phrase extension of ε̄⁻¹ by 1 uses 0 → 1 → V → ε̄⁻¹ → 0; if the source uses matrix order instead, translate the filtration together with its dual convention.
- No residual modularity theorem is included: BCGP proves residual modularity by other inputs before using this result.

**Construction or proof route.**

1. Since p is unramified in E, ε̄ on inertia has order p−1; the inertia characters are distinct, so the one-dimensional subspace on which inertia acts trivially is preserved by the decomposition group, giving local reducibility. Choose the weight-two ordinary local lift in the matching dual convention.
2. At p = 5 the inertia characters give a projective element of order 4, so the full projective image is not A₅. If the cyclotomic projective image is nevertheless A₅, use the rank-two image classification: after conjugation its derived subgroup is SL₂(F₅), and the full projective image is in PGL₂(F₅). A tame inertia element with eigenvalues 1 and a primitive fourth root has nonzero trace in F₅, so its scalar factor in a projectively F₅-rational matrix is in F₅; this element and SL₂(F₅) generate GL₂(F₅). Any additional scalar λ must have λ² ∈ F₅× by the determinant condition. If λ is not in F₅ then λ² is nonsquare; multiply λ by an F₅-matrix of determinant λ⁻² to produce a determinant-one element with projective image outside PSL₂(F₅), contradicting the cyclotomic image. Thus the representation is already GL₂(F₅)-valued, and the exceptional realizability condition holds with F′ = E. This image argument is part of the requested R01.4 finite-group contract.
3. Use BLGG13 for the ordinary automorphic seed, then the fixed-determinant/local-component refinement and Hida control to obtain weight 2 and det ε⁻¹ with the specified ordinary local components. BCGP Proposition 10.1.3 supplies this refined application.

**Checks.**

- Distinguish the projective image of G_E from that of G_{E(ζ₅)}.
- Check the residual inertia extension orientation against the dual Tate-module convention before using a matrix presentation.
- For F̄₅ coefficients, verify the exceptional scalar argument, including the determinant-one subgroup and the nonzero trace of the local order-four element. Excluding full A₅ alone is insufficient.

**Direct prerequisites:** `OrdinaryAutomorphicFormsAndModularityLifting:R21.6/blgg-ordinary-modular-lift`; `PadicFamilies:L5`; `LocalGaloisDeformationRings:L8`; `AutomorphicGaloisRepresentations:R19.2`; `ArithmeticGaloisRepresentations:R01.4`.

**Sources.**

- [Congruences between Hilbert modular forms: constructing ordinary lifts, II](https://www.ma.imperial.ac.uk/~tsg/Index_files/ordinaryHMFpostBLGGTversion.pdf), Theorem A, PDF p. 1; ordinary component descent in Theorem 2.1.2, PDF pp. 3–4. Existence of ordinary modular lifts.
- [Abelian surfaces over totally real fields are potentially modular](https://www.ma.imperial.ac.uk/~tsg/Index_files/abeliansurfacesmodular.pdf), Proposition 10.1.3 and proof, pp. 265–267; Theorems 10.1.4 and 10.2.6, pp. 267–268, 271–272 (author PDF). The exact ordinary weight-two/trivial-nebentypus application.

### The auxiliary-prime Steinberg lift in Newton–Thorne

**Target:** `OrdinaryAutomorphicFormsAndModularityLifting:R21.6/ordinary-steinberg-lift` (theorem).

Let p ≥ 5 and q ≥ 7 be distinct primes, E totally real, and r̄:G_E → GL₂(F̄_q) modular with det r̄ = ε̄_q⁻¹, cyclotomic restriction absolutely irreducible and [E(ζ_q):E] > 4. Suppose r̄ is unramified away from p and q, trivial at places above p and q, and ζ_q ∈ E_v at v | q. Choose v₁ ∤ pq where r̄ is trivial and the residue size is 1 modulo both p and q. Prescribe determinant ε_q⁻¹, trivial inertial type, a crystalline weight-zero component at every v | q, and a Steinberg (nonzero-monodromy) component at every v | p and at v₁; assume each chosen local component has a point lifting r̄ with this determinant. Then there is a weight-zero cuspidal π_a over E, unramified away from p v₁, with det r_{π_a,q} = ε_q⁻¹, reduction r̄, and π_{a,v} an unramified Steinberg twist at every v | p and at v₁. Its p-adic realization is ordinary at every v | p. When used in Newton–Thorne Proposition 6.1, q > 2(p+r)+2 is chosen using the given non-CM form, E is chosen disjoint from its residual/cyclotomic fields, and a finite unramified twist normalizes the determinant.

**Hypotheses and conventions.**

- At places above p the coefficient prime is q, so Steinberg is an away-from-q condition; it is not a Barsotti–Tate condition.
- At q the chosen type/component is crystalline weight zero, which makes π_a unramified there. Local nonemptiness and component conditions are part of the input.

**Construction or proof route.**

1. Use GlobalGaloisDeformations R04.5/chebotarev-selmer-selection with H=0 and the identity Frobenius class in the residual field composed with E(ζ_p), outside a finite avoidance set, to choose v₁; det r̄ = ε̄_q⁻¹ also forces its residue size to be 1 modulo q.
2. Apply prescribed-type-modular-lift at the coefficient prime q to the specified components.
3. Read the Steinberg local representations through local–global compatibility; weight-zero Steinberg factors at p are p-adically ordinary by Newton–Thorne Lemma 2.6.

**Checks.**

- Check that q, not p, is the prime to which BLGG12 is applied.
- The equivalence of symmetric-power automorphy in full Proposition 6.1 is outside this node.

**Direct prerequisites:** `OrdinaryAutomorphicFormsAndModularityLifting:R21.6/prescribed-type-modular-lift`; `LocalGaloisDeformationRings:L8`; `GlobalGaloisDeformations:R04.5/chebotarev-selmer-selection`; `AutomorphicGaloisRepresentations:R19.4`; `GL2AutomorphicRepresentationsAndTransfer:R16.6`; `ArithmeticGaloisRepresentations:R01.4`.

**Sources.**

- [Symmetric power functoriality for Hilbert modular forms](https://arxiv.org/pdf/2212.03595v2), Proof of Proposition 6.1, PDF pp. 46–47; Lemma 2.6, PDF p. 12 (arXiv:2212.03595v2). Only the q-adic ordinary/Steinberg lifting step; symmetric-power congruence transport is not owned here.
- [Congruences between Hilbert modular forms: constructing ordinary lifts](https://www.ma.imperial.ac.uk/~tsg/Index_files/ordinaryHMF.pdf), Theorem 6.1.9, pp. 44–45 (author PDF). The component-prescribed global lift.

### Newton–Thorne ordinary weight change with a Steinberg place

**Target:** `OrdinaryAutomorphicFormsAndModularityLifting:R21.6/ordinary-weight-change-prescribed-components` (theorem).

Let F be totally real, p ≥ 5, and π a weight-zero regular algebraic cuspidal GL₂(A_F)-representation with det r_π = ε⁻¹ and unramified Steinberg twists at all v | p. Suppose a place v₀ ∤ p has residue size −1 mod p and π_{v₀} is tamely dihedral of order p, the image of r̄_π contains SL₂(F_{p^a}) for a > a₀(p) ≥ 3, and π_v is potentially unramified for every v ∤ p. Then there is a RAESDC σ over F, ordinary with labelled Hodge–Tate weights {0,2}, det r_σ = ε⁻²ω and r̄_σ ≅ r̄_π, with σ_{v₀} an unramified Steinberg twist, and r_σ|G_{F_v} lying on the same local component as r_π|G_{F_v} for every v ∤ p v₀. Here a₀(p) is the large-image threshold in Newton–Thorne Lemma 2.3, not an arbitrary positive integer.

**Hypotheses and conventions.**

- Use the setup preceding Newton–Thorne Lemma 3.1, including all five local/global hypotheses.
- At v₀ it is the residual Frobenius eigenvalue ratio −1 = q_{v₀} mod p that permits the Steinberg component.

**Construction or proof route.**

1. Use hilbert-ordinary-weight-change for the ordinary local lifts of weights {0,2}.
2. Away from p v₀ keep the regular local point’s component; above p choose the ordinary crystalline component through the Hida lift; at v₀ choose a nonzero-monodromy trivial-type component.
3. Use the global dimension bound and finiteness/component automorphy descent in the rank-two setting to produce an automorphic point; the source invokes BG19 Proposition 4.2.6 and Thorne Theorems 10.2 and 9.1. This exact rank-two component input is recorded as a gap below Tier 20.

**Checks.**

- Do not replace the same-component conclusion by isomorphism of local representations.
- The local Hida weight change is an input, not the entire proof of this global assertion.

**Direct prerequisites:** `OrdinaryAutomorphicFormsAndModularityLifting:R21.2/hilbert-ordinary-weight-change`; `LocalGaloisDeformationRings:L8`; `GlobalGaloisDeformations:R04.3`; `GlobalGaloisDeformations:R04.5`; `GL2AutomorphicRepresentationsAndTransfer:R17.4`; `AutomorphicGaloisRepresentations:R19.4`; `ArithmeticGaloisRepresentations:R01.4`.

**Sources.**

- [Symmetric power functoriality for Hilbert modular forms](https://arxiv.org/pdf/2212.03595v2), §3 setup, PDF pp. 12–13; Lemma 3.1 and proof, PDF pp. 13–14 (arXiv:2212.03595v2). Global ordinary weight change with prescribed away-from-p components.

## Supplier contracts

Each contract below names the precise input still required from its existing owner. The target statements use that input under its hypotheses. The abstract result is planned once in its owner; the arithmetic specialization is part of this roadmap.

### 1. HilbertModularVarietiesAndShimuraCurves:R18.3

Definite quaternionic forms over a totally real F of even degree, for D ramified exactly at the infinite places: X(U) = D^×\G^D(A_f)/U finite; H⁰(X(U), R) = H⁰(X(U), ℤ) ⊗ R free of rank #X(U); the Hecke operators [UgU′] (T(ℓ), S(ℓ), T₀(p_v), T₀(p) and the action of G(U_a)) commuting and preserving integrality; the norm-factoring subspace I^D(U); pullback and trace between levels; stabiliser orders c_U(x) with c_{U_a}(x) = 1 for a large; free action after an auxiliary level (Skinner–Wiles Lemma 3.5 and Corollary 3.6); and finite-level freeness over 𝒪/πⁿ[Δ_w] for a fixed-point-free action. Also: Eichler's norm theorem for D (every totally positive element of F is a reduced norm) and strong approximation for the norm-one group G^D_1 at a place w where D splits (used in Skinner–Wiles Lemma 3.26).

**Used by:** `OrdinaryAutomorphicFormsAndModularityLifting:R21.1/ordinary-hecke-adjoint-pairing`; `OrdinaryAutomorphicFormsAndModularityLifting:R21.1/ordinary-level-independence`; `OrdinaryAutomorphicFormsAndModularityLifting:R21.1/ordinary-part-kills-norm-forms`; `OrdinaryAutomorphicFormsAndModularityLifting:R21.1/ordinary-towers-duality`; `OrdinaryAutomorphicFormsAndModularityLifting:R21.1/ordinary-trace-compatibility`; `OrdinaryAutomorphicFormsAndModularityLifting:R21.1/quaternionic-nearly-ordinary-hecke-algebra`; `OrdinaryAutomorphicFormsAndModularityLifting:R21.1/quaternionic-ordinary-projector`; `OrdinaryAutomorphicFormsAndModularityLifting:R21.2/auxiliary-level-freeness`; `OrdinaryAutomorphicFormsAndModularityLifting:R21.2/characteristic-p-primes-auxiliary`; `OrdinaryAutomorphicFormsAndModularityLifting:R21.2/ihara-lemma-quaternionic`.

R18.3 owns the quaternionic sets, their Hecke action, change of level and Taylor–Wiles freeness; R21.1 only applies the ordinary projector and passes to the ordinary towers.

### 2. GL2AutomorphicRepresentationsAndTransfer:R17.3

The Jacquet–Langlands–Shimizu isomorphism S^D(U) = H⁰(X(U), ℂ)/I^D(U) ≅ S₂(U), compatible with all [UgU′], for the definite quaternion algebra over an even-degree totally real field unramified at all finite places.

**Used by:** `OrdinaryAutomorphicFormsAndModularityLifting:R21.1/quaternionic-nearly-ordinary-hecke-algebra`; `OrdinaryAutomorphicFormsAndModularityLifting:R21.2/auxiliary-trace-identity`; `OrdinaryAutomorphicFormsAndModularityLifting:R21.2/level-raising-congruence-modules`.

### 3. GL2AutomorphicRepresentationsAndTransfer:R16.6

Adelic Hilbert modular forms M_k(U), S_k(U) of weight k ∈ ℤ[I] with Fourier expansions and Shimura's integrality M_k(n, A) = M_k(n, ℤ) ⊗ A; the Hecke operators T(ℓ), S(ℓ), T₀(p_v); local newform theory (dim V_{π,v}^{U_v} = 1 at unramified v) and Hida's classification of unit T₀(p_v)-eigenlines ([H3, Corollary 2.2]).

**Used by:** `OrdinaryAutomorphicFormsAndModularityLifting:R21.2/nearly-ordinary-representations`; `OrdinaryAutomorphicFormsAndModularityLifting:R21.2/nearly-ordinary-hecke-algebra-comparison`; `OrdinaryAutomorphicFormsAndModularityLifting:R21.2/eisenstein-ideal-existence`.

### 4. PadicFamilies:L5

Hida's totally real theory on the quaternionic ordinary towers of R21.1 (Skinner–Wiles §3.2): M_∞(U) and M⁺_∞(U) free over Λ′_𝒪 of rank rank_𝒪 eH⁰(X(U⁰_1), 𝒪) × #(G(U)_tors) under the fixed-point-free hypothesis (Proposition 3.3, Hida [H2, Theorem 3.8]); T_∞(U, 𝒪) finite torsion-free over Λ′_𝒪 and semilocal complete (Corollary 3.4); control in all weights (Proposition 3.7, Hida [H2, Corollary 2.5]); density of weight-two algebraic primes on each component (Lemma 3.8, Corollary 3.9); and Wiles' Λ-adic forms ([W2, Theorem 1.4.1]). For the Newton–Thorne Hilbert weight change, provide the Hilbert Hida family and its arithmetic specializations over an arbitrary totally real field (not just the even-degree definite-quaternion realization), with the tame branch giving determinant ε⁻²ω, residual constancy and ordinary local Galois shape. Handle the residue-indistinguishable case if it occurs; do not introduce an unsupported p-distinguishedness assumption. Arithmetic specializations must cover the ordinary weight-zero seed and weight-two/trivial-nebentypus refinements, with their exact determinants, local ordinary characters and compatible residual representations; p-distinguishedness may only be imposed where the source requires it.

**Used by:** `OrdinaryAutomorphicFormsAndModularityLifting:R21.2/nearly-ordinary-hecke-algebra-comparison`; `OrdinaryAutomorphicFormsAndModularityLifting:R21.2/eisenstein-ideal-existence`; `OrdinaryAutomorphicFormsAndModularityLifting:R21.2/permissible-localisation-finite`; `OrdinaryAutomorphicFormsAndModularityLifting:R21.2/auxiliary-level-freeness`; `OrdinaryAutomorphicFormsAndModularityLifting:R21.2/hilbert-ordinary-weight-change`; `OrdinaryAutomorphicFormsAndModularityLifting:R21.6/ordinary-weight-zero-seed`; `OrdinaryAutomorphicFormsAndModularityLifting:R21.6/nonexceptional-ordinary-lift`; `OrdinaryAutomorphicFormsAndModularityLifting:R21.6/blgg-ordinary-modular-lift`; `OrdinaryAutomorphicFormsAndModularityLifting:R21.6/small-prime-ordinary-weight-two-lift`.

RS-08: R21.2 imports the cuspidal totally real Hida control from PadicFamilies L5 and keeps only the additional nearly ordinary and Eisenstein statements.

### 5. AutomorphicPadicLFunctions:L3

The Deligne–Ribet p-adic L-function L_p(F, s, χω) with its interpolation of L^{(p)}(F, 1 − n, χω^{1−n}); Hilbert Eisenstein series E_n(φ₁, φ₂) of parallel weight n, spanning a complement of the cusp forms, with constant terms a_i(E_n(1, ψ), 0) = 2^{−d}L(F, 1 − n, ψ)Nm(t_i)^{n/2} (Skinner–Wiles (3.10)); Chai's integral form g with a_i(g, 0) = 2^{−d}Nm(t_i)^{n/2} for large n ≡ 2 mod (p − 1)p^f ([Ch, §4.5], (3.11)); and Wiles' vanishing of Eisenstein combinations with zero constant terms ([W3, Proposition 1.6]). Also the congruences for the Deligne–Ribet p-adic L-function under abelian p-extensions (Skinner–Wiles (4.17), citing [Co], [D-R], [Se]).

**Used by:** `OrdinaryAutomorphicFormsAndModularityLifting:R21.2/eisenstein-ideal-existence`; `OrdinaryAutomorphicFormsAndModularityLifting:R21.5/theorem-a`.

### 6. AutomorphicGaloisRepresentations:R19.4

Local–global compatibility away from p for the Galois representations of nearly ordinary Hilbert eigenforms: π_v ≅ π_v(ρ_π) for v ∤ p (Skinner–Wiles (3.3), [W2, Theorem 2.1.3]).

**Used by:** `OrdinaryAutomorphicFormsAndModularityLifting:R21.2/auxiliary-trace-identity`; `OrdinaryAutomorphicFormsAndModularityLifting:R21.2/eisenstein-ideal-existence`; `OrdinaryAutomorphicFormsAndModularityLifting:R21.3/hida-family-representation`; `OrdinaryAutomorphicFormsAndModularityLifting:R21.3/inertia-character-constraints`; `OrdinaryAutomorphicFormsAndModularityLifting:R21.3/level-type-control`.

### 7. GlobalGaloisDeformations:R04.3

Mazur's unframed presentation for a Schur residual representation with fixed determinant: R ≅ 𝒪[[x_1, …, x_{g′}]]/(f_1, …, f_{r′}) with g′ = h¹(F_Σ/F, ad⁰ρ̄) and r′ ≤ h²(F_Σ/F, ad⁰ρ̄) ([M, Proposition 2]); R04.3's framed presentation assumes absolute irreducibility.

**Used by:** `OrdinaryAutomorphicFormsAndModularityLifting:R21.3/global-presentation-bound`.

### 8. ArithmeticGaloisDuality:R02.3

Tate's global Euler characteristic formula for H^i(F_Σ/F, ad⁰ρ̄) with F totally real and ρ̄ odd, giving h¹ − h² ≥ 2d for ad⁰ρ_c.

**Used by:** `OrdinaryAutomorphicFormsAndModularityLifting:R21.3/global-presentation-bound`.

### 9. DeformationAndDerivedPatchingAlgebra:R03.2

Schlessinger's criteria (H1)–(H4) for functors on complete local Noetherian 𝒪-algebras with finite residue field, applied to the functor of pseudo-deformations.

**Used by:** `OrdinaryAutomorphicFormsAndModularityLifting:R21.3/universal-pseudo-deformation`.

### 10. AutomorphicGaloisRepresentations:R19.2

Wiles' Galois representations ρ_π for ordinary Hilbert eigenforms of parallel weight κ ≥ 2 (Skinner–Wiles (3.2), [W2]): ρ_π(z_1) = diag(1, −1), unramified outside 𝔫p, trace ρ_π(Frob_ℓ) = λ(T(ℓ)), det ρ_π(Frob_ℓ) = λ(S(ℓ))Nm(ℓ), det ρ_π(x) = λ(S_x)ε(x), and ρ_π|_{D_i} ≅ (ψ_1 *; 0 ψ_2) with ψ_2(y) = λ(T_y), ψ_2(λ_{𝔭_i}) = λ(T_0(𝔭_i)).

**Used by:** `OrdinaryAutomorphicFormsAndModularityLifting:R21.3/hida-family-representation`; `OrdinaryAutomorphicFormsAndModularityLifting:R21.4/main-theorem`.

### 11. GL2AutomorphicRepresentationsAndTransfer:R17.4

Base change and descent for Hilbert modular forms along solvable totally real extensions (Skinner–Wiles cite [GL]): given a newform f_1 over L with L/F solvable and ρ_{f_1} ≅ ρ|_{G_L} for an irreducible ρ of G_F, a newform f over F with ρ_f|_{G_L} ≅ ρ_{f_1}. Include the specified solvable totally real base changes, local splitting/unramifiedness conditions and disjointness from residual/cyclotomic avoidance fields in BLGG12 §6.1 and BLGG13 Theorem 2.1.2.

**Used by:** `OrdinaryAutomorphicFormsAndModularityLifting:R21.4/main-theorem`; `OrdinaryAutomorphicFormsAndModularityLifting:R21.5/theorem-b`; `OrdinaryAutomorphicFormsAndModularityLifting:R21.6/ordinary-weight-zero-seed`; `OrdinaryAutomorphicFormsAndModularityLifting:R21.6/prescribed-type-modular-lift`; `OrdinaryAutomorphicFormsAndModularityLifting:R21.6/nonexceptional-ordinary-lift`; `OrdinaryAutomorphicFormsAndModularityLifting:R21.6/blgg-ordinary-modular-lift`; `OrdinaryAutomorphicFormsAndModularityLifting:R21.6/ordinary-weight-change-prescribed-components`.

### 12. DeformationAndDerivedPatchingAlgebra:R03.5

Skinner–Wiles characteristic-p patching over k[[T]], including the data and all axioms (5.1)–(5.11), and the conclusions of Lemma 5.6 and Propositions 5.7–5.9. The exact required datum is: Let k be a finite field of characteristic p, A = k[[T]] with fraction field K, 𝓛 = {N} strictly increasing odd integers with 0, and n ≥ 1. A_N = A[[s_1, …, s_n]]/(s_i^{N+1}), B_N = A[[t_1, …, t_n]]/(t_i^{(N+1)/2}) ⊆ A_N via t_i ↦ (1 + s_i) + (1 + s_i)^{−1} − 2. A patching datum is: rings R^{(N)} = A[[x_1, …, x_m]]/𝔞^{(N)} (m independent of N) finite free over A with 𝔞^{(N)} ⊆ (x_i), surjections R^{(N)} ↠ R^{(0)}, B_N-algebra structures, and for odd 0 ≤ a ≤ N rings R^{(N)}_a with (5.2)–(5.5) (𝔭^{d(a)} = 0 in R^{(N)}_a, 𝔭/𝔭² ≅ Aⁿ ⊕ Tor with Tor bounded independently of N and a); trace subrings R^{tr(N)} = A[[y_1, …, y_m]]/𝔟^{(N)} with (5.6)–(5.8) (the cokernel of 𝔮/𝔮² → 𝔭/𝔭² bounded independently of N); modules M^{(N)} free over A of rank r·rank_A A_N, compatible over A_N, with quotients M^{(N)}_a satisfying (5.9)–(5.10) (in particular M^{(N)}_a ⊗ K free over A_a ⊗ K with (s_i)-coinvariants M^{(0)} ⊗ K, and z·M^{(0)} ⊆ M^{(N)}_0 for a fixed z with ord_T(z mod 𝔮^{(0)}) ≠ 0); and x^{(N)} ∈ R^{tr(N)} annihilating ker(M^{(N)}_a/(s_i) ↠ M^{(N)}_0) with ord_T(x^{(N)} mod 𝔮^{(N)}) = t independent of N (5.11).

**Used by:** `OrdinaryAutomorphicFormsAndModularityLifting:R21.4/formal-patching-datum`; `OrdinaryAutomorphicFormsAndModularityLifting:R21.4/formal-patching-theorem`.

The current R03.5 balanced/Kisin patching nodes do not supply the trace-subring, B_N-action and uniform-T-torsion variant; this is a Part II extension of the algebra owner. R21.4 verifies the arithmetic datum and applies the imported theorem only.

### 13. DeformationAndDerivedPatchingAlgebra:R03.3

Auslander–Buchsbaum; de Smit–Rubin–Schoof, Criteria for complete intersections (Compositio 1997), Lemma 4.1 and Criterion I (for a surjection R ↠ T of complete local C-algebras finite over a DVR C, with T a reduced complete intersection: R ≅ T iff ℓ_C(H_R/H_R²) ≤ ℓ_C(C/δ(G_T)), and then both are complete intersections).

**Used by:** `OrdinaryAutomorphicFormsAndModularityLifting:R21.4/formal-patching-theorem`; `OrdinaryAutomorphicFormsAndModularityLifting:R21.4/minimum-level-r-equals-t`; `OrdinaryAutomorphicFormsAndModularityLifting:R21.4/nice-prime-r-equals-t`.

### 14. GlobalGaloisDeformations:R04.5

Chebotarev selection of primes w with Nm(w) ≡ 1 mod p^m and prescribed Frobenius image in the splitting field of ρ mod λ^m together with a cohomology class, for ρ over a characteristic-p DVR A = k[[λ]] (Skinner–Wiles Proposition 6.10). Include preservation of the residual image and avoidance fields under the auxiliary constructions used for ordinary component lifting; the existing odd-Taylor–Wiles theorem’s absolute-irreducibility assumptions are not interchangeable with 2-big or adequate-image hypotheses.

**Used by:** `OrdinaryAutomorphicFormsAndModularityLifting:R21.4/auxiliary-prime-sets`; `OrdinaryAutomorphicFormsAndModularityLifting:R21.4/irreducible-selmer-auxiliary-primes`; `OrdinaryAutomorphicFormsAndModularityLifting:R21.6/ordinary-weight-zero-seed`; `OrdinaryAutomorphicFormsAndModularityLifting:R21.6/prescribed-type-modular-lift`; `OrdinaryAutomorphicFormsAndModularityLifting:R21.6/nonexceptional-ordinary-lift`; `OrdinaryAutomorphicFormsAndModularityLifting:R21.6/blgg-ordinary-modular-lift`; `OrdinaryAutomorphicFormsAndModularityLifting:R21.6/ordinary-steinberg-lift`; `OrdinaryAutomorphicFormsAndModularityLifting:R21.6/ordinary-weight-change-prescribed-components`.

### 15. ArithmeticGaloisDuality:R02.4

Wiles' Selmer-group formula #H_Σ(𝒯)/#H*_Σ(𝒯) = h_∞∏_w h_w for finite Galois modules over a totally real field ([W1, Proposition 1.6]; Poitou–Tate with the local Euler characteristic).

**Used by:** `OrdinaryAutomorphicFormsAndModularityLifting:R21.4/auxiliary-prime-sets`.

### 16. ArithmeticGaloisDuality:R02.5

Selmer groups with local conditions L_w and their duals L*_w under local duality, and the tangent-space embedding Hom(R, C ⊕ εC/λ^m) ↪ H¹(F_Σ/F, ad ρ/λ^m) with local conditions (Skinner–Wiles (8.8)–(8.10)).

**Used by:** `OrdinaryAutomorphicFormsAndModularityLifting:R21.4/auxiliary-prime-sets`; `OrdinaryAutomorphicFormsAndModularityLifting:R21.4/nice-prime-r-equals-t`.

### 17. SerreWeightAndLevelOptimisation:R20.6

Diamond, The refined conjecture of Serre (1995), Theorem 6.4, in the form Skinner–Wiles 2001 use for their Theorem 5.2: for p odd and ρ̄ : G_ℚ → GL₂(F̄_p) irreducible, modular and p-distinguished (ρ̄|_{D_p} ≅ (χ_1 *; 0 χ_2), χ_1 ≠ χ_2), with p ≠ 3 or ρ̄|_{G_{ℚ(√−3)}} irreducible, there is a nearly ordinary cuspidal π_1 of GL₂/ℚ whose p-adic representation is ordinary at p with unramified quotient reducing to χ_2 (a χ₂-good lift).

**Used by:** `OrdinaryAutomorphicFormsAndModularityLifting:R21.5/nearly-ordinary-irreducible-lifting-over-q`.

### 18. LocalGaloisDeformationRings:L8

The versal nearly ordinary deformation ring of a nonsplit ρ₀|_{D_v} ≅ (χ_1 *; 0 χ_2), χ_1 ≠ χ_2, for v | p over a totally real F, with its relative dimension over 𝒪 (Skinner–Wiles 2001 Proposition 2.1 say it is analysed as in their 1999 Corollary 2.3, the split case χ ⊕ 1).

**Used by:** `OrdinaryAutomorphicFormsAndModularityLifting:R21.3/irreducible-presentation-bound`.

### 19. PadicFamilies:L0

The Hecke side of the classical Hida family over ℚ that R21.6 builds its Galois representation on: Hida's primitive components (Iwasawa modules attached to congruences of cusp forms, Corollary 3.7: an ordinary form of weight k ≥ 2 on Γ₁(N₀p) whose primitive form has conductor divisible by N₀ belongs to a unique primitive component, with d = [𝒦 : ℒ_K] forms at each weight); the correspondence between classical height-one primes of T_N and Galois-conjugacy classes of ordinary eigenforms (EPW Theorem 2.1.2 and after); and the new quotient T^new_N (EPW Definition 2.2.1, Theorem 2.2.2: finite, reduced, torsion-free over Λ, classical primes ↔ forms of tame conductor N, étale over Λ_℘ at classical ℘).

**Used by:** `OrdinaryAutomorphicFormsAndModularityLifting:R21.6/hida-family-galois-representation-over-q`; `OrdinaryAutomorphicFormsAndModularityLifting:R21.6/ordinary-newform-lies-in-a-hida-family`.

### 20. PadicHodgeTheory:R06.4

For G_{ℚ_p}, p odd and 2 ≤ k ≤ p+1, a crystalline two-dimensional lift with weights {0,k−1} and reducible semisimplified residual representation is ordinary; include the endpoint k=p+1 of KW II Lemma 3.5(i), especially (p,k)=(3,4). This supplier owns the BLZ/Wach calculation and its PhiGamma PG.6 (and applicable PG.7) inputs.

**Used by:** `OrdinaryAutomorphicFormsAndModularityLifting:R21.5/theorem-a-at-three`.

Single-owner transfer of RT-AREA-langlands-2/17 and /31. The existing endpoint branch is a lead, but does not by itself supply the whole range.

### 21. IntegralIwasawaTheory:L4

Washington (1978), Invent. Math. 49, 87–97: for an abelian number field K and distinct primes ℓ and p, the p-primary class groups of the finite layers of the cyclotomic ℤ_ℓ-extension have bounded order. This is not Ferrero–Washington μ=0 in the ℤ_p-tower.

**Used by:** `OrdinaryAutomorphicFormsAndModularityLifting:R21.5/theorem-a`.

RT-AREA-langlands-2/32; requested edge L4 → R21.5.

### 22. DiophantineApproximationAndTranscendence:DT.3

The p-adic rank bound for units used by Skinner–Wiles 1999 (4.20), (4.24), citing Waldschmidt, Compositio Math. 40 (1980), 161–185: for a totally real degree-d field L, the rank δ_L of the relevant abelian pro-p Galois group unramified outside p is ≤ d/2. Also supply the minus-unit rank bound giving δ⁻_{F′} ≤ d/2 when F′/F is quadratic totally real. Do not apply this bound to CM F′.

**Used by:** `OrdinaryAutomorphicFormsAndModularityLifting:R21.5/theorem-a`; `OrdinaryAutomorphicFormsAndModularityLifting:R21.5/theorem-b`; `OrdinaryAutomorphicFormsAndModularityLifting:R21.3/dihedral-deformation-dimension`.

The present DT.3 logarithm statements do not give this p-adic rank theorem; extend the owner as Part II.

### 23. DeformationAndDerivedPatchingAlgebra:R03.6

Raynaud connectedness in the form SW99 Appendix A.1–A.2, pp. 121–122: for local Cohen–Macaulay A of dimension d and an ideal generated by r ≤ d−2 elements, the punctured spectrum of A/I is connected; for a partition of its irreducible components obtain an intersection prime of dimension at least d−r−1 as in A.2. The supplier’s connectedness assertion for its particular patched domain is not this general theorem.

**Used by:** `OrdinaryAutomorphicFormsAndModularityLifting:R21.4/raynaud-connectedness-corollary`.

### 24. GL2AutomorphicRepresentationsAndTransfer:R17.4

Skinner–Wiles, Base change and a problem of Serre, Duke Math. J. 107 (2001), 15–25: the solvable totally real base-change input used in SW01 Theorem 5.1, p. 203, preserving residual irreducibility and producing the χ₂-good nearly ordinary automorphic seed and conditions (2.1), (H_even), (H_def). Read the primary theorem before replacing this request by a node.

**Used by:** `OrdinaryAutomorphicFormsAndModularityLifting:R21.5/nearly-ordinary-irreducible-lifting`.

This residual-level base-change construction is additional to ordinary solvable transfer/descent; exact primary statement still a gap.

### 25. LocalGaloisDeformationRings:L8

The framed fixed-determinant local lifting rings used by BLGG12 §6.1 and NT26 Lemma 3.1: inertial types with determinant ψε, potentially Barsotti–Tate/crystalline Hodge type, generic-fibre irreducible components and their nonemptiness; ordinary components through Hida specializations; nonzero-monodromy Steinberg components when the residual Frobenius ratio equals the residue size. Include determinant-preserving weight-two ordinary liftability for the exact BCGP inertia extension convention. The generic ordinary determinant/flag spectrum comparison is not a substitute for these lifting contracts.

**Used by:** `OrdinaryAutomorphicFormsAndModularityLifting:R21.6/ordinary-weight-zero-seed`; `OrdinaryAutomorphicFormsAndModularityLifting:R21.6/prescribed-type-modular-lift`; `OrdinaryAutomorphicFormsAndModularityLifting:R21.6/nonexceptional-ordinary-lift`; `OrdinaryAutomorphicFormsAndModularityLifting:R21.6/blgg-ordinary-modular-lift`; `OrdinaryAutomorphicFormsAndModularityLifting:R21.6/small-prime-ordinary-weight-two-lift`; `OrdinaryAutomorphicFormsAndModularityLifting:R21.6/ordinary-steinberg-lift`; `OrdinaryAutomorphicFormsAndModularityLifting:R21.6/ordinary-weight-change-prescribed-components`.

### 26. ArithmeticGaloisRepresentations:R01.4

Rank-two residual image classification used in BLGG12 Lemma 4.4.2 and BLGG13 Proposition 2.1.1: 2-big/cohomological conditions, adequate image outside the l=3 PSL₂(F₃) and l=5 PSL₂(F₅) cases, passage to cyclotomic and cyclic index-3 subgroups, and projective normalizers/GL₂(F₅) realizability. Supply the proof of the latter condition needed by the stated F̄₅ BCGP refinement.

**Used by:** `OrdinaryAutomorphicFormsAndModularityLifting:R21.6/ordinary-weight-zero-seed`; `OrdinaryAutomorphicFormsAndModularityLifting:R21.6/prescribed-type-modular-lift`; `OrdinaryAutomorphicFormsAndModularityLifting:R21.6/nonexceptional-ordinary-lift`; `OrdinaryAutomorphicFormsAndModularityLifting:R21.6/blgg-ordinary-modular-lift`; `OrdinaryAutomorphicFormsAndModularityLifting:R21.6/small-prime-ordinary-weight-two-lift`; `OrdinaryAutomorphicFormsAndModularityLifting:R21.6/ordinary-steinberg-lift`; `OrdinaryAutomorphicFormsAndModularityLifting:R21.6/ordinary-weight-change-prescribed-components`.

### 27. PadicFamilies:L5

Complete-DVR compact/discrete duality needed for ordinary towers: for finite free L over a complete DVR 𝒪 with fraction field K, identify Hom_𝒪(L,𝒪) with Hom_𝒪(L⊗_𝒪 K/𝒪,K/𝒪), then identify the continuous dual of a discrete direct limit with the compact inverse limit of the finite-level duals, with compatible trace/restriction pairings and Hecke adjoints. Extend L0/hecke-duality from the rational modular-curve instance to this Hilbert/quaternionic module contract; Mathlib CharacterModule alone is not an 𝒪-linear K/𝒪 duality theorem.

**Used by:** `OrdinaryAutomorphicFormsAndModularityLifting:R21.1/ordinary-towers-duality`.

### 28. GL2AutomorphicRepresentationsAndTransfer:R17.5

Quadratic automorphic induction of algebraic characters of CM extensions, with cuspidality when the inducing character is not Galois-invariant, and residual/local compatibility as used in BLGG12 Proposition 6.1.4. Also the solvable rank-two Artin automorphy/ordinary seed input in BLGG13 Theorems 3.1.1–3.2.1 (the exceptional projective A₄/S₄ branches). R17.4 base change alone is not automorphic induction or Langlands–Tunnell.

**Used by:** `OrdinaryAutomorphicFormsAndModularityLifting:R21.6/ordinary-weight-zero-seed`; `OrdinaryAutomorphicFormsAndModularityLifting:R21.6/blgg-ordinary-modular-lift`.

### 29. GlobalGaloisDeformations:R04.3

Fixed-determinant global deformation problems with specified nonempty framed local components: the comparison of global presentation dimensions with the local lifting-ring dimensions used in BLGG12 §6.1 (Theorems 6.1.5 and 6.1.9) and the global dimension bound invoked by Newton–Thorne Lemma 3.1. Supply representability and the dimension estimate under the residual-image hypotheses stated by those applications; automorphy/finiteness of the component remains the rank-two arithmetic lifting owner’s explicit gap, not a consequence of this presentation theorem.

**Used by:** `OrdinaryAutomorphicFormsAndModularityLifting:R21.6/ordinary-weight-zero-seed`; `OrdinaryAutomorphicFormsAndModularityLifting:R21.6/prescribed-type-modular-lift`; `OrdinaryAutomorphicFormsAndModularityLifting:R21.6/nonexceptional-ordinary-lift`; `OrdinaryAutomorphicFormsAndModularityLifting:R21.6/ordinary-weight-change-prescribed-components`.

## Proof and source gaps

These are unresolved inputs, rather than strengthened hypotheses hidden inside an unconditional theorem. The targets naming them are specified, but their chains are not closed.

### Raynaud's connectedness theorem (Skinner–Wiles Proposition A.1)

The exact SW99 Appendix A.1–A.2 connectedness/dimension theorem is requested from DeformationAndDerivedPatchingAlgebra R03.6. Its primary Raynaud proof is not read; the current patched-domain result has narrower hypotheses.

**Affected targets:** `OrdinaryAutomorphicFormsAndModularityLifting:R21.4/raynaud-connectedness-corollary`.

### Washington's theorem on the non-p-part of class numbers in cyclotomic ℤ_ℓ-extensions

Primary Washington theorem not read in this pass. Its exact distinct-prime abelian cyclotomic-tower contract is requested from IntegralIwasawaTheory L4; no longer an ownerless gap.

**Affected targets:** `OrdinaryAutomorphicFormsAndModularityLifting:R21.5/theorem-a`.

### Waldschmidt's lower bound for the p-adic rank of units

The p-adic unit-rank theorem used in SW99 (4.20), (4.24) is requested as an extension of DiophantineApproximationAndTranscendence DT.3; it is not supplied by complex logarithm bounds. Its primary proof is not verified here, and it cannot justify the false CM minus-rank bound of SW01 (E11).

**Affected targets:** `OrdinaryAutomorphicFormsAndModularityLifting:R21.5/theorem-a`; `OrdinaryAutomorphicFormsAndModularityLifting:R21.5/theorem-b`; `OrdinaryAutomorphicFormsAndModularityLifting:R21.3/dihedral-deformation-dimension`.

### Primary residual-level solvable base-change theorem still unread

The Duke 2001 primary source could not be read from the public links tried. The residual-level solvable base-change input used by SW01 Theorem 5.1 is requested from GL2AutomorphicRepresentationsAndTransfer R17.4, additional to transfer/descent, with an exact-statement verification still required.

**Affected targets:** `OrdinaryAutomorphicFormsAndModularityLifting:R21.5/nearly-ordinary-irreducible-lifting`.

### Correction of the CM/mixed dihedral ordinary lifting argument

The false CM minus-rank bound E11 prevents the printed SW01 argument from proving the original scope. Skinner’s cited 2009 preprint Nearly ordinary deformations of residually dihedral representations was not obtained. The full theorem has an explicit target and this gap; the inherited restricted target is retained as a conditional planning route.

**Affected targets:** `OrdinaryAutomorphicFormsAndModularityLifting:R21.5/nearly-ordinary-irreducible-lifting-full-scope`.

### Rank-two ordinary seed and component automorphy descent below Tier 20

BLGG12 Proposition 6.1.3 uses induced characters, a rank-two tensor automorphy construction (Theorem 3.5.1) and untwisting (Proposition 5.1.1). BLGG13 uses the stronger adequate-image ordinary automorphy theorem in the unitary Serre-weight appendix, plus Allen’s dihedral case. NT26 Lemma 3.1 uses BG19’s global dimension bound and Thorne’s finiteness/automorphy lifting theorems on prescribed components. These precise rank-two instances are planned as prerequisites in this owner, but their internal automorphy proof chains are unresolved. No incoming citation to the higher PotentialModularity or PotentialAutomorphy roadmaps is introduced; those roadmaps must import this lower-rank interface once established.

**Affected targets:** `OrdinaryAutomorphicFormsAndModularityLifting:R21.6/ordinary-weight-zero-seed`; `OrdinaryAutomorphicFormsAndModularityLifting:R21.6/prescribed-type-modular-lift`; `OrdinaryAutomorphicFormsAndModularityLifting:R21.6/nonexceptional-ordinary-lift`; `OrdinaryAutomorphicFormsAndModularityLifting:R21.6/blgg-ordinary-modular-lift`; `OrdinaryAutomorphicFormsAndModularityLifting:R21.6/small-prime-ordinary-weight-two-lift`; `OrdinaryAutomorphicFormsAndModularityLifting:R21.6/ordinary-weight-change-prescribed-components`.

## Source corrections and provenance

The following inherited findings are stated in our own words. The targets use the corrected conventions and keep substantive proof gaps explicit. A finding about a preprint is scoped to that preprint; it does not silently become a finding about a published version. Independent verification of these findings is required.

### E1. misprint

**Source:** [Residually reducible representations and modular forms](http://www.numdam.org/item/PMIHES_1999__89__5_0.pdf), §3.2, paragraph before Lemma 3.10, p. 41 (Numdam PDF page 38).

**Correction:** Λ_𝒪 is a free Λ′_𝒪-module of rank p^{Σ r_j} = ∏_j p^{r_j}.

**Reason:** In each variable 1 + X ↦ u(1 + T)^{p^r} with u ∈ 1 + pℤ_p, and u(1 + T)^{p^r} − 1 is a unit times a distinguished polynomial of degree p^r, so 𝒪[[T]] is free of rank p^r over 𝒪[[X]] (Weierstrass division); the ranks multiply over the δ_F variables. Lemma 3.10 uses only that Λ_𝒪 is finite free over Λ′_𝒪, and r is not used again.

**Effect:** nothing. **Correction record:** new.

### E2. misprint

**Source:** [Residually reducible representations and modular forms](http://www.numdam.org/item/PMIHES_1999__89__5_0.pdf), §3.2, p. 35 (Numdam PDF page 32), first displayed definition.

**Correction:** H⁺_∞(U) = lim→_a eH⁰(X(U_a), K/𝒪)⁺, the analogue of H_∞(U) on p. 34.

**Reason:** The right side is a direct limit over a, so it depends on U, not on U_a; M⁺_∞(U) is later identified with the Pontryagin dual of H⁺_∞(U).

**Effect:** nothing. **Correction record:** new.

### E3. misprint

**Source:** [Residually reducible representations and modular forms](http://www.numdam.org/item/PMIHES_1999__89__5_0.pdf), §3.3, proof of Lemma 3.11, p. 42 (Numdam PDF page 39).

**Correction:** T_y = (β_i − α_i)^{−1}(β_i trace ρ^mod(σ_y) − trace ρ^mod(g_iσ_y)), and likewise for T_0(𝔭_i).

**Reason:** At a minimal prime ρ_Q|_{D_i} ≅ (ψ_1 *; 0 ψ_2) with ψ_2 ≡ 1 and ψ_1 ≡ χ modulo m, so α_i = ψ_2(g_i) and β_i = ψ_1(g_i); then β_i trace ρ(σ) − trace ρ(g_iσ) = (β_i − α_i)ψ_2(σ), and ψ_2(σ_y) = T_y by (3.4)(vi). The printed expression is (β_i − α_i)²T_y. Since β_i − α_i ≡ χ(g_i) − 1 is a unit of T^S, membership in T^S, which is all the lemma needs, is unaffected; §2.5 has the correct form (division by β_i − α_i).

**Effect:** nothing. **Correction record:** new.

### E4. misprint

**Source:** [Residually reducible representations and modular forms](http://www.numdam.org/item/PMIHES_1999__89__5_0.pdf), §3.3, proof of Lemma 3.17, (3.7), p. 45 (Numdam PDF page 42).

**Correction:** τ_P(T_0(𝔭_i)) = (T_0(𝔭_i) mod P) · Ψ_P(λ^{(𝔭_i)}_{𝔭_i}).

**Reason:** τ_P is the eigensystem of π ⊗ (Ψ_P ∘ det). T_0(𝔭_i) = (λ^{(𝔭_i)}_{𝔭_i})^{−v}[U(1 0; 0 λ^{(𝔭_i)}_{𝔭_i})U] (p. 30) and T_y = [U(1 0; 0 y)U] are both multiplied by Ψ_P of the determinant, Ψ_P(λ) and Ψ_P(y); on the Galois side ψ_2 ↦ ψ_2Ψ and (3.4)(vi) gives the same. The printed inverse is inconsistent with the line for T_y. The proof only needs some τ_P attached to π ⊗ Ψ_P, so nothing downstream changes.

**Effect:** nothing. **Correction record:** new.

### E5. misprint

**Source:** [Residually reducible representations and modular forms](http://www.numdam.org/item/PMIHES_1999__89__5_0.pdf), §4.3, proof of Proposition 4.1, p. 64 (Numdam PDF page 61).

**Correction:** Corollary 2.12.

**Reason:** §2.4 has Proposition 2.11 and Corollary 2.12; the inequality dim R^ps/Q^ps ≥ dim R_𝒟/Q is Corollary 2.12, applied through the surjection R_{𝒟^ps} ↠ T_𝒟. The same label drift recurs in the proof of Proposition 4.2: 'Lemma 2.12' on pp. 67 and 70 and 'Proposition 2.12' twice on p. 69, all meaning Corollary 2.12.

**Effect:** nothing. **Correction record:** new.

### E6. misprint

**Source:** [Residually reducible representations and modular forms](http://www.numdam.org/item/PMIHES_1999__89__5_0.pdf), §4.4, proof of Proposition 4.2, p. 66 (Numdam PDF page 63).

**Correction:** Proposition 3.18.

**Reason:** Proposition 3.14 is the level-by-type statement; the existence of a permissible maximal ideal of T_∞(U^χ, 𝒪) from ord_π L_p(F, −1, χω) > 0 is Proposition 3.18.

**Effect:** nothing. **Correction record:** new.

### E7. misprint

**Source:** [Residually reducible representations and modular forms](http://www.numdam.org/item/PMIHES_1999__89__5_0.pdf), §4.6, proof of Theorem B, p. 78 (Numdam PDF page 75).

**Correction:** (iv) is such that (L, 𝒟_L) is a good pair.

**Reason:** The four conditions of the Main Theorem are numbered (i)–(iv) (p. 73) and in the proof of Theorem A (p. 76).

**Effect:** nothing. **Correction record:** new.

### E8. misprint

**Source:** [Residually reducible representations and modular forms](http://www.numdam.org/item/PMIHES_1999__89__5_0.pdf), §8.4, p. 119 (Numdam PDF page 116).

**Correction:** Proposition 7.3.

**Reason:** 7.2 is a Remark (Lemma 7.1 holds for the auxiliary data 𝒟_Q); the freeness of M̃ and the isomorphism ψ(𝒟_c, 𝔭) are Proposition 7.3 (p. 111).

**Effect:** nothing. **Correction record:** new.

### E9. misprint

**Source:** [A simplified proof of Serre's conjecture](https://arxiv.org/pdf/2108.07577v2), Theorem 1.7, second hypothesis, p. 4 of arXiv:2108.07577v2 (on the page image), and its check in Paso 6, p. 14.

**Correction:** χ̄₃|_{D₃} ≠ 1, i.e. Skinner–Wiles' condition (i) χ|_{D_p} ≠ 1 for ρ̄^{ss} ≅ 1 ⊕ χ. It holds automatically, because χ̄₃ is ramified at 3, so the check in Paso 6 is unnecessary.

**Reason:** DP refer the proof of Theorem 1.7 to the theorem on the third PDF page of Skinner–Wiles, namely the introduction theorem (Publ. IHÉS 89, p. 6), whose hypotheses are ρ̄^{ss} ≅ 1 ⊕ χ, (i) χ|_{D_p} ≠ 1, (ii) ρ|_{I_p} ≅ (∗ ∗; 0 1), (iii) det ρ = ψε^{k−1}, odd. DP's first, third and fourth bullets are these; the second replaces (i) by a condition on ρ|_{D₃} itself, which (without a bar, as printed) holds for every ρ with Hodge–Tate weights {0, k − 1}, k ≥ 2. Theorem 1.7 as printed remains true, since its first hypothesis implies (i).

**Effect:** nothing. **Correction record:** new: present in arXiv v2; the arXiv listing records no journal reference.

### E10. misprint

**Source:** [Construction of some families of 2-dimensional crystalline representations](https://arxiv.org/pdf/math/0310275v1), Proposition 3.4 and its proof, pp. 8–9 of arXiv:math/0310275v1.

**Correction:** γ, η ∈ Γ_{ℚ_p}.

**Reason:** K is not defined anywhere in the paper; the group acting throughout (§2.2, Lemma 3.2, Proposition 3.3, Definition 3.6) is Γ_{ℚ_p} = Gal(ℚ_p(µ_{p^∞})/ℚ_p). The proof of Proposition 3.4 repeats Γ_K.

**Effect:** nothing. **Correction record:** new: present in arXiv v1; the Math. Ann. version was not obtained.

### E11. gap

**Source:** [Nearly ordinary deformations of irreducible residual representations](http://www.numdam.org/item/AFST_2001_6_10_1_185_0.pdf), §2, the sentence before Lemma 2.2 and Lemma 2.2, p. 191 (Numdam PDF page 8); its uses in the proof of Proposition 4.1, pp. 200 and 202.

**Correction:** dim R_𝒟/q ≤ δ⁻_{F′} holds, and δ⁻_{F′} ≤ d/2 holds when F′ is totally real (Waldschmidt applied to the minus part of the units of F′, which has rank d). When F′ is CM, δ⁻_{F′} = d, and the bound dim R_𝒟/q ≤ d/2 fails when every place above p splits in F′. Proposition 4.1 therefore needs, when ρ₀ is dihedral, a separate proof (or an assumption) that the dihedral locus of type 𝒟 with finite-order determinant has dimension at most d/2.

**Reason:** Affected: Lemma 2.2, and the three steps of the proof of Proposition 4.1 that use it (hence the proofs of Theorems 5.1 and 5.2), when ρ₀ is induced from a quadratic extension F′/F with a complex place. For F′ CM, the global units of F′ have the same rank d − 1 as those of F, so the minus part of the units is finite; the minus part of ∏_{w|p} 𝒪_{F′,w}^× has ℤ_p-rank d, and class field theory gives δ⁻_{F′} = d > d/2. The lemma's conclusion then fails: if every v | p splits in F′ and ℳ = ∅, Ind_{F′}^F(ψ̃₀ψ⁻), with ψ⁻ the universal character of the free part of the minus quotient of Γ_Σ, is a deformation of type 𝒟 over k[[Γ⁻]] (at each v_i it is Ψ|_{D_w} ⊕ Ψ|_{D_w̄}, nearly ordinary with the χ^{(i)}_1-part as sub). Its determinant has finite order, and its trace ring has dimension d. Such ρ₀ satisfy (2.1): for example ρ̄_{E,p}|_{G_F} for an elliptic curve E with complex multiplication by K, p ≥ 5 split in K, and a totally real F of even degree, linearly disjoint from K(E[p]), over which ρ̄_{E,p} is unramified outside p. The proof of Proposition 4.1 uses the d/2 bound three times: that ρ₁ = ρ^mod mod Q is not dihedral (step one, p. 200); that ρ mod Q₁ is not dihedral because dim Q₁ > 1 + d/2 (step three, p. 200); and that ρ mod Q₂ is not dihedral because dim Q₂ ≥ d/2 + 1 (general case, p. 202). Theorem 5.1 passes to L with ρ₀ = ρ̄^{ss}|_{G_L}, and F′L is CM when F′ is. Not examined: whether Theorems 5.1 and 5.2 fail in these cases, which are partly covered by other lifting theorems when ρ̄|_{F(ζ_p)} is irreducible. When the places above p do not split in F′, the nearly ordinary condition forces Ψ⁻ to have finite order on their decomposition groups, which should cut the dihedral locus down; the paper does not make this argument.

**Effect:** a stated result. **Correction record:** partly known: Khare–Wintenberger, Serre's modularity conjecture (I) (Invent. Math. 178 (2009)), cite C. Skinner, 'Nearly ordinary deformations of residually dihedral representations' (their [41], 'to appear'), 'which is a correction to [40]' (this paper) (preprint p. 16; also p. 3); Allen (arXiv:1301.1113) lists it as a 2009 preprint. That correction was not obtained or read, so whether it repairs Lemma 2.2 in the CM-split case was not checked; no erratum to the published paper was found.

### E12. misprint

**Source:** [Nearly ordinary deformations of irreducible residual representations](http://www.numdam.org/item/AFST_2001_6_10_1_185_0.pdf), §2, the sentence before Lemma 2.2, p. 191 (Numdam PDF page 8), and the bibliography, pp. 214–215.

**Correction:** [Wal] is not in the paper's bibliography; it is the [Wal] of Skinner–Wiles, Residually reducible representations and modular forms (Publ. Math. IHÉS 89), Waldschmidt's lower bound for the p-adic rank of units.

**Reason:** The bibliography on pp. 214–215 lists [C], [D1]–[D3], [F], [H1], [H2], [M1], [M2], [SW1], [SW2], [TW] and [W] only; the citation matches the use of [Wal] in Skinner–Wiles 1999.

**Effect:** nothing. **Correction record:** new: no erratum or corrigendum found (Numdam item page; web search, 29 September 2026).

### E13. misprint

**Source:** [Nearly ordinary deformations of irreducible residual representations](http://www.numdam.org/item/AFST_2001_6_10_1_185_0.pdf), §4, proof of Proposition 4.1, step three, p. 200 (Numdam PDF page 17).

**Correction:** #ℳ₀ and ρ_{𝒟₀}.

**Reason:** The step concerns the minimal datum 𝒟₀ = (𝒪, Σ₀, ℳ₀); 𝒟_c and ℳ_c are the notation of Skinner–Wiles 1999, which has no counterpart in this paper. The previous sentence uses #ℳ₀.

**Effect:** nothing. **Correction record:** new: no erratum or corrigendum found (Numdam item page; web search, 29 September 2026).

### E14. gap

**Source:** [Nearly ordinary deformations of irreducible residual representations](http://www.numdam.org/item/AFST_2001_6_10_1_185_0.pdf), §4, the last paragraph of the proof of Proposition 4.1, p. 202 (Numdam PDF page 19); the hypotheses (4.1), p. 198.

**Correction:** (4.1) bounds only #ℳ₀. The step needs d/2 > 2 + 2t + 7·#(Σ ∖ 𝒫) (implied by d/2 > 2 + 7·#Σ), which should be added to the hypotheses of Proposition 4.1. Theorem 5.1 chooses L with d_L/2 > 2 + 7·#Σ_L, so its proof is unaffected.

**Reason:** Affected: the proof of Proposition 4.1 for data 𝒟 with Σ larger than Σ₀; not the proof of Theorem 5.1, which imposes the needed bound. Proposition 2.1 gives every minimal prime Q of R_𝒟 dimension at least 1 + d + δ_F − 2t − 3#ℳ, and I₂ is generated by 1 + 4#(Σ ∖ 𝒫) + δ_F elements, so dim Q₂ ≥ d − 2t − 3#ℳ − 4#(Σ ∖ 𝒫). For Σ = Σ₀ this exceeds d/2 + 1 by (4.1)(i), but not in general: d = 40, t = 1 and ℳ₀ = ∅ satisfy (4.1)(i), while #Σ = 4 gives d − 7#Σ − 1 = 11 < 21 = d/2 + 1 (checked in the suggested Lean file). The corresponding good-pair condition of Skinner–Wiles 1999 involves #Σ; (4.1) here depends only on (F, ρ₀).

**Effect:** the proof. **Correction record:** new: no erratum or corrigendum found (Numdam item page; web search, 29 September 2026).

### E15. misprint

**Source:** [Nearly ordinary deformations of irreducible residual representations](http://www.numdam.org/item/AFST_2001_6_10_1_185_0.pdf), §5, after (5.1), p. 202 (Numdam PDF page 19).

**Correction:** (5.1i,ii).

**Reason:** (4.1) are the good-pair inequalities of §4; the lattice argument uses continuity and finite ramification, which are (5.1)(i)–(ii), displayed just above.

**Effect:** nothing. **Correction record:** new: no erratum or corrigendum found (Numdam item page; web search, 29 September 2026).

## Source versions read

Page locators refer to the specific version listed here. Source readings from earlier workers are retained as distinct provenance, rather than claimed as new readings.

### Residually reducible representations and modular forms

C. M. Skinner and A. J. Wiles. Publications mathématiques de l'IHÉS 89 (1999), 5–126, DOI 10.1007/BF02698855; Numdam open-access scan (123 pages, OCR text layer; printed page = PDF page + 3). The article's own title reads 'reducible'; the Numdam and Crossref records read 'reductible'.

[Source version](http://www.numdam.org/item/PMIHES_1999__89__5_0.pdf).

- 2026-09-28 (cc-39fac3, checkpoint 1): Introduction, pp. 6–9; §2.1 opening and §2.5, pp. 9 and 26–27; §3.1–3.2 in full, pp. 27–45, with Proposition 3.3, Corollary 3.4 and Lemma 3.10 read on the page images; §3.4 (Proposition 3.18 and proof), pp. 46–48; §3.5 up to Proposition 3.20, pp. 48–51; §3.6 opening, pp. 52–53. The OCR text layer is noisy; every formula used was checked on the page images.
- 2026-09-28 (cc-39fac3, checkpoint 2): §2.1 (with Lemma 2.2, Corollary 2.3, Proposition 2.4 and Lemmas 2.5–2.6), §2.3, §2.4 (Lemma 2.10 to Proposition 2.15), §2.5, pp. 9–27, read on the page images; §3.3 from (3.2) to Lemma 3.17, pp. 38–46, on the page images; §2.2 (Lemmas 2.7–2.9) skimmed only.
- 2026-09-28 (cc-39fac3, checkpoint 3): §2.2 (Lemmas 2.7–2.9), pp. 15–17; §3.5 from Lemma 3.19 to Lemma 3.21, §3.6, §3.7 and §3.8, pp. 49–61; §4.1–4.3 and the opening of §4.4, pp. 61–66; Appendix A, pp. 123–124; all on the page images.
- 2026-09-28 (cc-39fac3, checkpoint 4): §4.4 (Proposition 4.2 with proof), §4.5 (Main Theorem, Theorems A and B, Hypothesis H), §4.6 (proofs of Theorems A and B), pp. 66–79; the statements of Propositions 8.1 and 8.4 and the proof of 8.4, pp. 112–113 and 122–123; all on the page images.
- 2026-09-28 (cc-39fac3, checkpoint 5): §5 in full, §6 in full, §7 (Lemma 7.1 with proof, Remark 7.2, (7.7)–(7.16), Proposition 7.3), §8 (8.1–8.2 with Lemma 8.2 and (8.1), §8.4 with (8.3)–(8.11)), pp. 79–122, on the page images; pp. 107–110 and 115–118 (the verification of (5.10)–(5.11) and §8.3) skimmed.
- 2026-09-29 (cc-39fac3, checkpoint 6): the Introduction, pp. 5–8 (the theorem over ℚ on p. 6, checked on the page image), and §4.5 Theorem A, p. 74, on the page image.
- 2026-10-14 (codex-jCEuMc): revisited Theorems A–B, Hypothesis H and the appendix connectedness statements, and checked the inherited prerequisite contracts; the earlier worker’s page-image readings remain the source record for retained nodes.

### Construction of some families of 2-dimensional crystalline representations

Laurent Berger, Hanfeng Li and Hui June Zhu. arXiv:math/0310275v1 (17 October 2003), the preprint of Math. Ann. 329 (2004), 365–377. Locators give the arXiv page numbers

[Source version](https://arxiv.org/pdf/math/0310275v1).

- 2026-09-29 (cc-39fac3, checkpoint 6): the whole paper (§§1–5, pp. 1–12).

### A simplified proof of Serre's conjecture

Luis Victor Dieulefait and Ariel Martín Pacetti. arXiv:2108.07577v2, 3 May 2022. Locators give the arXiv version's page numbers

[Source version](https://arxiv.org/pdf/2108.07577v2).

- 2026-09-29 (cc-39fac3, checkpoint 6): Theorems 1.6–1.7 with proofs (pp. 4–5, on the page image) and Paso 6 (p. 14).

### On Serre's modularity conjecture for 2-dimensional mod p representations of Gal(Q̄/Q) unramified outside p

Chandrashekhar Khare. arXiv:math/0504080v1 (5 April 2005), published as 'Serre's modularity conjecture: the level one case', Duke Math. J. 134 (2006), 557–589. Locators give the preprint's page numbers

[Source version](https://arxiv.org/pdf/math/0504080v1).

- 2026-09-29 (cc-39fac3, checkpoint 6): §1, pp. 1–3, for the uses of Skinner–Wiles.

### Nearly ordinary deformations of irreducible residual representations

C. M. Skinner and Andrew J. Wiles. Annales de la Faculté des Sciences de Toulouse (6) 10 (2001), no. 1, 185–215; Numdam open-access scan (32 pages, OCR text layer; printed page = PDF page + 183). The OCR renders ρ as 'p' and garbles most formulas; every formula used was read on the page images.

[Source version](http://www.numdam.org/item/AFST_2001_6_10_1_185_0.pdf).

- 2026-09-29 (cc-39fac3, checkpoint 7): the whole paper, pp. 185–215, on the page images: the introduction with its Theorem; §2 ((2.1)–(2.4), Proposition 2.1, Lemmas 2.2–2.3, the Λ_𝒪-structure); §3 (Lemma 3.1, Proposition 3.2, (3.2), ρ_{U,m}, Lemma 3.3, permissible maximal ideals, U_{𝒟_Q}, (H_def), Proposition 3.4 with proof, Lemma 3.5); §4 ((4.1)–(4.3), property (P), Proposition 4.1 with proof); §5 ((5.1), Theorems 5.1–5.2 with proofs); §6 ((6.1)–(6.8), Proposition 6.1); §7 (Lemma 7.1, the Selmer groups, Proposition 7.2); §8 (the constructions, the verification of (6.2)–(6.8), Propositions 8.1–8.2); the bibliography.
- 2026-10-14 (codex-jCEuMc): revisited §4 (4.2), merely nice primes and the quotient-map direction, §5 lifting statements, and the reported dihedral bound; retained earlier full page-image reading as distinct provenance.

### Variation of Iwasawa invariants in Hida families

Matthew Emerton, Robert Pollack and Tom Weston. arXiv:math/0404484v1 (2004), 50 pages; published in Invent. Math. 163 (2006), no. 3, 523–580. Page numbers are those of the arXiv v1 PDF (printed page = PDF page).

[Source version](https://arxiv.org/pdf/math/0404484v1).

- 2026-09-29 (cc-39fac3, checkpoint 8): §2.1 (Theorem 2.1.2 and the correspondence with ordinary eigenforms), §2.2 (Definition 2.2.1, Theorem 2.2.2) and §2.3 in full (Theorem 2.3.1, Propositions 2.3.2–2.3.3, Theorem 2.3.4, Proposition 2.3.5, Definitions 2.3.6–2.3.7), pp. 7–13; the bibliography entries [2], [14], [17].

### Iwasawa modules attached to congruences of cusp forms

Haruzo Hida. Ann. Sci. École Norm. Sup. (4) 19 (1986), no. 2, 231–273, DOI 10.24033/asens.1507; Numdam open-access scan (44 pages; printed page = PDF page + 229). The OCR text layer is garbled in displayed formulas; statements were checked against the scan where OCR formulas were unreliable.

[Source version](https://www.numdam.org/item/10.24033/asens.1507.pdf).

- 2026-09-29 (cc-39fac3, checkpoint 8): §3, pp. 250–254 (the local rings of the ordinary Hecke algebra, (3.5)–(3.8), Theorems 3.5–3.6, the definition of forms belonging to a local ring, Corollary 3.7).

### Modular curves and the Eisenstein ideal

Barry Mazur. Publ. Math. IHÉS 47 (1977), 33–186; Numdam open-access scan (155 pages; printed page = PDF page + 31). The OCR text layer is noisy; statements were read on the page image.

[Source version](http://www.numdam.org/item/PMIHES_1977__47__33_0.pdf).

- 2026-09-29 (cc-39fac3, checkpoint 8): Chapter II, Propositions 9.6–9.8 and the definition of Eisenstein primes, p. 96, on the page image.

### The Fontaine–Mazur conjecture in the residually reducible case

Lue Pan. J. Amer. Math. Soc. 35 (2022); arXiv:1901.07166v2 (the latest version). The arXiv version was read; locators give its PDF pages.

[Source version](https://arxiv.org/pdf/1901.07166v2).

- 2026-09-29 (cc-fb70e5, checkpoint 9): Introduction, Theorem 1.0.2 and the paragraph after it (p. 3).

### Congruences between Hilbert modular forms: constructing ordinary lifts

Thomas Barnet-Lamb, Toby Gee and David Geraghty. Duke Math. J. 161 (2012), no. 8; author PDF with 47 numbered pages

[Source version](https://www.ma.imperial.ac.uk/~tsg/Index_files/ordinaryHMF.pdf).

- 2026-10-14: §6.1, Propositions 6.1.3–6.1.4 and their proofs, pp. 35–40; Theorem 6.1.5 and proof, pp. 40–42; Theorems 6.1.7–6.1.9, pp. 42–45; ordinary weight convention in §1.

### Congruences between Hilbert modular forms: constructing ordinary lifts, II

Thomas Barnet-Lamb, Toby Gee and David Geraghty. Math. Res. Lett. 20 (2013), no. 1, 67–72; six-page author PDF with provisional running pagination 10001–10006; locators use PDF pages

[Source version](https://www.ma.imperial.ac.uk/~tsg/Index_files/ordinaryHMFpostBLGGTversion.pdf).

- 2026-10-14: whole six-page author version; Theorem A, Proposition 2.1.1, Theorem 2.1.2, Theorems 3.1.1–3.2.1 and proof of Theorem A.

### Symmetric power functoriality for Hilbert modular forms

James Newton and Jack A. Thorne. Ann. of Math. 203 (2026), no. 1, 283–347, DOI 10.4007/annals.2026.203.1.4; read arXiv:2212.03595v2, 19 February 2025; locators are that version’s numbered PDF pages

[Source version](https://arxiv.org/pdf/2212.03595v2).

- 2026-10-14: Lemma 2.6, p. 12; §3 setup and Lemma 3.1 with its proof, pp. 12–14; Proposition 6.1 and the BLGG12 application in its proof, pp. 45–49.

### Abelian surfaces over totally real fields are potentially modular

George Boxer, Frank Calegari, Toby Gee and Vincent Pilloni. Publ. Math. IHÉS 134 (2021), 153–501; 292-page author version, arXiv:1812.09269; locators use its numbered pages

[Source version](https://www.ma.imperial.ac.uk/~tsg/Index_files/abeliansurfacesmodular.pdf).

- 2026-10-14: Proposition 10.1.3 and proof, pp. 265–267; Theorem 10.1.4 and proof, pp. 267–268; Theorem 10.2.6 and proof, pp. 271–272. Definition 7.3.1, p. 172, and the ordinary convention surrounding Lemma 7.5.26, p. 206, were checked for the inertia-extension orientation.

### Potential automorphy over CM fields

Patrick Allen, Frank Calegari, Ana Caraiani, Toby Gee, David Helm, Bao V. Le Hung, James Newton, Peter Scholze, Richard Taylor and Jack A. Thorne. Ann. of Math. 197 (2023), 897–1113; the cleared author copy carries the published running pagination

[Source version](https://arxiv.org/abs/1812.09999).

- 2026-10-14: Proposition 6.2.12 and its proof, pp. 1036–1037 (PDF pages 140–141), read directly in the cleared author copy; verified against L8/determinant-flag-comparison.
