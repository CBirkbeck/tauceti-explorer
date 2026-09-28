# Ordinary automorphic forms and ordinary modularity lifting — blueprint

This blueprint covers stages R21.1–R21.6. After three checkpoints, **R21.2 is source-decomposed**; R21.1, R21.3 and R21.4
are partial; R21.5–R21.6 are not yet read. The roadmap belongs to the restructured family RS-08, whose `keeps` are followed:
- R21.1 only applies the ordinary projector to actual arithmetic modules;
- R21.2 keeps the nearly ordinary and Eisenstein statements that Skinner–Wiles need beyond cuspidal Hida theory;
- R21.3 keeps the ordinary Galois families and deformation rings, in the pseudo-representation formalism the source
  actually uses for reducible residual representations.

The source is C. M. Skinner and A. J. Wiles, *Residually reducible representations and modular forms*, Publ. Math.
IHÉS 89 (1999), 5–126, §§2–4.3 and Appendix A. It is open access on Numdam as an OCR'd scan; every formula below was checked on the
page images.

## Purpose

Khare's level-one argument and the modern p = 3 branch of Serre's conjecture need modularity lifting theorems for
representations whose residual representation is reducible. Skinner and Wiles prove them with nearly ordinary Hecke
algebras over a totally real field F, localised at an Eisenstein ("permissible") maximal ideal. This roadmap owns that
arithmetic:
- the nearly ordinary Hecke algebra built from definite quaternionic forms;
- Eisenstein maximal ideals and their existence from a p-adic L-function;
- finiteness and freeness statements at those ideals and at auxiliary Taylor–Wiles levels;
- later (R21.3–R21.6), the ordinary Galois families, R = T, and the Skinner–Wiles theorems.

## What the libraries and other roadmaps supply

**Mathlib has:**
- quaternion algebras `QuaternionAlgebra`, finite adeles `IsDedekindDomain.FiniteAdeleRing`, totally real fields
  `NumberField.IsTotallyReal` and `Matrix.GeneralLinearGroup`;
- power series rings `MvPowerSeries`, local rings `IsLocalRing`, `Module.Free`, `Module.Finite`, idempotents
  `IsIdempotentElem`;
- character modules `CharacterModule`, the nearest notion to the Pontryagin duals Hom_𝒪(−, K/𝒪) used here;
- fibrewise sums (`Fintype.prod_fiberwise` and its additive form) and Euler's theorem `ZMod.pow_totient`.

Neither Mathlib nor Tau Ceti has definite quaternionic forms, Hilbert modular forms or Hida theory.

**Imported from other roadmaps:**
- **PadicFamilies L0a:** the finite, adic and finite-algebra ordinary projectors (nodes cited directly).
- **PadicMeasuresIwasawaAlgebras L1:** the completed group ring 𝒪[[G(U)]] (`convolution-algebra`).
- **PadicFamilies L5 (R21.3):** the weight algebra, finiteness and density of weight-two points
  (`totally-real-weight-algebra`, `hida-hecke-finite`, `algebraic-primes-dense`).
- **GlobalGaloisDeformations R04.1–R04.2 (R21.3):** strict deformations, restriction, Φ_p, representability for Schur
  residual representations and fixed-determinant rings (cited node ids).
- **IntegralHeckeAndGaloisDeterminants IHG.0 (R21.3):** pseudocharacters, compared with Wiles' pseudo-representations
  through the trace.
- **Requested:**
  - **HilbertModularVarietiesAndShimuraCurves R18.3:** the definite quaternionic sets X(U) and H⁰(X(U), R), Hecke
    operators, change of level, stabilisers, the free-action lemma (Skinner–Wiles Lemma 3.5, Corollary 3.6) and
    finite-level freeness over 𝒪/πⁿ[Δ_w];
  - **GL2AutomorphicRepresentationsAndTransfer R17.3:** Jacquet–Langlands–Shimizu, S^D(U) ≅ S₂(U);
  - **GL2AutomorphicRepresentationsAndTransfer R16.6:** adelic Hilbert modular forms, Hecke operators, local newforms and
    Hida's classification of unit U_p-eigenlines;
  - **PadicFamilies L5:** Hida's totally real control (Skinner–Wiles Proposition 3.3, Corollary 3.4, Proposition 3.7,
    Lemma 3.8) and Wiles' Λ-adic forms;
  - **AutomorphicPadicLFunctions L3:** the Deligne–Ribet p-adic L-function, Hilbert Eisenstein series and their constant
    terms, and Chai's forms with prescribed constant terms;
  - **AutomorphicGaloisRepresentations R19.4:** local–global compatibility away from p;
  - **AutomorphicGaloisRepresentations R19.2 (R21.3):** Wiles' Galois representations of ordinary Hilbert eigenforms;
  - **LocalGaloisDeformationRings L8 (R21.3):** the versal local and nearly ordinary rings of χ ⊕ 1 (Skinner–Wiles
    Lemma 2.2, Corollary 2.3);
  - **GlobalGaloisDeformations R04.3 (R21.3):** Mazur's unframed presentation for a Schur residual representation;
  - **ArithmeticGaloisDuality R02.3 (R21.3):** the global Euler characteristic formula;
  - **DeformationAndDerivedPatchingAlgebra R03.2 (R21.3):** Schlessinger's criteria.

## Conventions

- **Field and algebra.** F is totally real of even degree d and p is odd. D/F is the quaternion algebra ramified exactly
  at the infinite places; it exists because d is even.
- **Levels.** U ⊆ GL₂(𝒪_F ⊗ Ẑ) is open compact with U_v = GL₂(𝒪_{F,v}) for v | p. U_a = U ∩ U(p^a) and
  U⁰_a = U ∩ U₀(p^a).
- **Coefficients.** 𝒪 is the ring of integers of a finite K/ℚ_p, with uniformiser π and residue field k.
- **Groups at p.** G(U_a) ≅ (𝒪_F/p^a)^× × Z(U_a) via (a b; c d) ↦ (∏_{v|p}(a^{−1}d)_v, a). T_y and S_x are the operators
  of (y, 1) and (1, x) in G(U).
- **Weight algebras.**
  - Λ′_𝒪 = 𝒪[[X_1, …, X_{δ_F}, Y^{(i)}_j]] acts through X_i ↦ S_{x_i} − 1 and Y ↦ T_y − 1.
  - Λ_𝒪 = 𝒪[[T_1, …, T_{δ_F}, Y^{(i)}_j]] is used at a permissible maximal ideal.
- **Twisted modules.** H⁰(X(U_a), R)⁺ is H⁰ with t acting by its adjoint t⁺.

## Layer R21.1: the ordinary projector on quaternionic forms (partial)

Library module: `TauCeti/NumberTheory/OrdinaryModularity/QuaternionicHida`, namespace `TauCeti.OrdinaryModularity`.

**Lemma: the exponent comparison** (node `projector-exponent-comparison`). For t in a finite 𝒪-algebra and m divisible
by the residue degrees of 𝒪[t], lim t^{p^n(p^m−1)} exists and equals L0a's lim t^{n!}. On factors where t is a unit,
t^{p^m−1} ∈ 1 + m and its p^n-th powers tend to 1; elsewhere t is topologically nilpotent. So Skinner–Wiles' e is
L0a's projector and no second projector API is built.

**Construction: the ordinary projector** (node `quaternionic-ordinary-projector`; planet). e = lim T₀(p)^{p^n(p^m−1)}
on H⁰(X(U_a), R), for R finite, R = 𝒪 or R = K/𝒪. It is idempotent and commutes with the Hecke algebra, coefficient
change, pullback and trace.
- *API:* `ordinaryProjector`, `ordinaryProjector_isIdempotentElem`, `ordinaryProjector_eq_factorial`,
  `ordinaryProjector_comm_hecke`, `ordinaryProjector_pullback`, `ordinaryProjector_trace`.
- *Tests:*
  - over k, e is 1 on a line where T₀(p) is a unit and 0 where it is nilpotent;
  - e kills norm-factoring forms;
  - F = ℚ(√5) at level GL₂(𝒪_F ⊗ Ẑ): the icosian order has class number one, so X(U) is a point and the cuspidal part
    is 0, matching S₂ = 0 for ℚ(√5);
  - non-example: over K the powers need not converge, so e is defined on the lattice.

**Lemma: norm forms** (node `ordinary-part-kills-norm-forms`). On functions factoring through the reduced norm,
T₀(p) acts as a positive power of p times a translation. So e kills I^D(U_a, ℤ) ⊗ R, and only S^D = H⁰/I^D survives.

**Construction: the nearly ordinary Hecke algebra** (node `quaternionic-nearly-ordinary-hecke-algebra`; planet).
T₂(U_a, 𝒪) = eT(U_a, 𝒪), which is eT*₂(U_a, 𝒪) through Jacquet–Langlands. The transition maps are surjective, and
T_∞(U, 𝒪) = lim T₂(U_a, 𝒪) receives 𝒪[[G(U)]] and is a Λ′_𝒪-algebra.
- *API:* `quaternionicHeckeAlgebra`, `nearlyOrdinaryHeckeAlgebra`, `nearlyOrdinaryHeckeAlgebra.transition_surjective`,
  `hidaHeckeAlgebra`, `hidaHeckeAlgebra.groupRingHom`, `hidaHeckeAlgebra.lambdaAlgebra`.
- *Tests:*
  - T₂ is commutative and finite over 𝒪;
  - the icosian level-one case;
  - the transition maps send generators to generators;
  - the X_i see only the ℤ_p-free part of Z(U).

**Construction: the pairing and Hecke adjoints** (node `ordinary-hecke-adjoint-pairing`).
⟨f, g⟩_U = Σ c_U(x)^{−1}f(x)g(x), with c_U(x) the stabiliser order. It is perfect when the c_U(x) are units and satisfies
⟨[UgU]f, h⟩ = ⟨f, [Ug^{−1}U]h⟩. So t ↦ t⁺ is an isomorphism, and eH⁰ × eH⁰⁺ → R is a perfect pairing of
T₂(U_a, 𝒪)-modules.
- *API:* `stabiliserCount`, `quaternionicPairing`, `quaternionicPairing_perfect`, `quaternionicPairing_hecke_adjoint`,
  `heckeAdjoint`, `ordinaryPairing_perfect`.
- *Tests:*
  - with a free action the Gram matrix is the identity;
  - on a one-point set with stabiliser order c the pairing is perfect iff c is a unit;
  - the adjoint of a central translation is the inverse translation.

**Lemma: traces** (node `ordinary-trace-compatibility`). tr(U_b, U_a) is independent of the representatives, commutes
with t, t⁺ and e, and is adjoint to restriction: ⟨f, tr h⟩_U = ⟨f|_V, h⟩_V.

**Lemma: the Γ₀(p^a) level drop** (node `ordinary-level-independence`). For a ≥ 2,
U⁰_a(1 0; 0 ϖ)U⁰_a = U⁰_a(1 0; 0 ϖ)U⁰_{a−1}, so eH⁰(X(U⁰_a), K/𝒪) = eH⁰(X(U⁰_1), K/𝒪). The identity comes from
g(1 0; x 1) = (1 0; ϖx 1)g, and it fails for a = 1.

**Theorem: Pontryagin duality of the towers** (node `ordinary-towers-duality`; planet). H_∞ is the direct limit along
pullbacks, and M_∞ = lim eH⁰(·, 𝒪)⁺ is the inverse limit along traces. Once c_{U_a} = 1, M_∞(U) ≅ Hom_𝒪(H_∞(U), K/𝒪)
and M⁺_∞(U) ≅ Hom_𝒪(H⁺_∞(U), K/𝒪).

## Layer R21.2: nearly ordinary and Eisenstein control

Library module: `TauCeti/NumberTheory/OrdinaryModularity/Eisenstein`.

**Definition: nearly ordinary representations** (node `nearly-ordinary-representations`; planet). A v-good line is the
unique line where T₀(p_v) acts by a p-adic unit. It exists iff π_v is a principal series π(η_v|·|^{−1/2}, ξ_v|·|^{−1/2})
or a special π(ξ_v|·|^{−1/2}, ξ_v|·|^{1/2}) with λ_v^{−v}ξ_v(λ_v^{−1}) a unit. π is nearly ordinary if such a line exists
for every v | p, and ordinary if moreover every ξ_v is unramified.
- *API:* `IsVGoodLine`, `IsNearlyOrdinary`, `IsOrdinary`, `vGoodLine_unique`, `isNearlyOrdinary_twist`.
- *Tests:*
  - X₀(11) is ordinary at 3 (a₃ = −1) and not at 2 (a₂ = −2);
  - a twist ramified at p is nearly ordinary but not ordinary;
  - a supercuspidal π_v has no v-good line;
  - two unit eigenvalues cannot occur.

**Comparison: the two Hecke algebras** (node `nearly-ordinary-hecke-algebra-comparison`). The algebra generated on the
v-good vectors is finite, flat, commutative and reduced, and equals eT*_k(U_a, 𝒪) in parallel weight. In weight two it
is R21.1's T₂(U_a, 𝒪). Arithmetic points of T_∞ with finite-order restrictions to Z(U) and (𝒪_F ⊗ ℤ_p)^× correspond to
nearly ordinary π. Higher weights come from Hida's control, requested from PadicFamilies L5.

**Definition: permissible maximal ideals** (node `permissible-maximal-ideal`; planet). Let χ be totally odd with
χ|_{D_v} ≠ 1 for every v | p. A maximal ideal m of T_∞(U, 𝒪) is permissible if three conditions hold:
- m ∩ 𝒪[[G(U)]] belongs to G(U) → Z(U) --χω^{−1}--> k;
- T₀(p_i) − 1 ∈ m;
- T(ℓ) − 1 − χ̃(Frob_ℓ) ∈ m.

The equivalence with ρ̄_m ≅ χ ⊕ 1, and the uniqueness of m, use R21.3's residual pseudo-representation.
- *API:* `IsPermissible`, `IsPermissible.ofLevel`, `IsPermissible.T0_sub_one_mem`, `IsPermissible.T_sub_mem`.
- *Tests:*
  - Ramanujan's τ(ℓ) ≡ 1 + ℓ^{11} mod 691 is the degree-one, weight-12 shape of the condition;
  - χ|_{D_v} = 1 (not p-distinguished) is excluded;
  - E₂(1, χω^{−1}) has eigenvalue 1 + ψ(ℓ)Nm(ℓ) ≡ 1 + χ(Frob_ℓ), so the twist by ω^{−1} sits in the first condition, not
    the third.

**Theorem: existence** (node `eisenstein-ideal-existence`; planet). If ord_π L_p(F, −1, χω) > 0, then T₂(U^χ_a, 𝒪)
has a permissible maximal ideal for some a. The proof runs as follows:
1. Take the weight-n Eisenstein series E_n(1, χω^{−1}) with n ≡ 2 mod (p − 1)p^f.
2. Subtract L(F, 1 − n, ψ) times Chai's form to kill the constant terms.
3. The ordinary projection is a cusp form congruent to the ordinary Eisenstein series.
4. Wiles' Λ-adic forms move the congruence to weight two.
5. Local–global compatibility places it at level U^χ.

**Construction: the weight algebra at m** (node `permissible-weight-algebra`). The central action with ε gives the
character D, with D(Frob_ℓ) = S(ℓ)Nm(ℓ); this is Skinner–Wiles' det ρ^mod. It makes T_∞(U, 𝒪)_m a Λ_𝒪-algebra. The map
Λ′_𝒪 → Λ_𝒪, 1 + X_j ↦ (1 + T_j)^{p^{r_j}}ε(γ_j^{−p^{r_j}}), is compatible, and Λ_𝒪 is free of rank p^{Σ r_j} over it
(E1).
- *API:* `centralDeterminant`, `centralDeterminant_frob`, `permissibleLambdaAlgebra`, `lambdaPrimeToLambda_free`.
- *Tests:*
  - in one variable with r = 1 the rank is p;
  - r_j = 0 gives an isomorphism;
  - D(x) = S_xε(x) on Z(U).

**Theorem: finiteness and freeness at m** (node `permissible-localisation-finite`; planet). T_∞(U, 𝒪)_m is a
torsion-free finite Λ_𝒪-algebra, not asserted flat. Under the fixed-point-free hypothesis, M_∞(U)_m and M⁺_∞(U)_m are
free Λ_𝒪-modules of equal rank: they are free over Λ′_𝒪 by Proposition 3.3, and then free over the regular ring Λ_𝒪 by
Auslander–Buchsbaum.

**Theorem: auxiliary levels** (node `auxiliary-level-freeness`; planet). Take w ∤ p with the Γ₀(w)-type U′ and the
Δ_w-reduced U″. If U′/(F^× ∩ U′) acts freely, M_∞(U″) and M⁺_∞(U″) are free over Λ′_𝒪[[Δ_w]] with Δ_w-coinvariants
M_∞(U′) and M⁺_∞(U′). This is separate from finite flatness over weight space.

**Theorem: characteristic-p primes at auxiliary level** (node `characteristic-p-primes-auxiliary`). This is
Proposition 3.20. A prime 𝔭 ∋ p of T_∞(U″) comes from level U′ when three conditions hold:
- det ρ_𝔭 = χ;
- ψ_1/ψ_2 has infinite order on inertia at some v | p;
- ρ_𝔭 is irreducible and not dihedral.

The proof passes through an auxiliary prime ℓ chosen by Chebotarev.

**Lemma: the trace at tame inertia** (node `auxiliary-trace-identity`). Lemma 3.21 and Remark 3.22: trace ρ^mod(σ_w)
acts on M_∞(U″)_m as δ_w + δ_w^{−1}.

**Construction: the rings T_{𝒟_Q}** (node `deformation-hecke-rings`). This is §3.6.
- The level U_{𝒟_Q} has four local cases: unramified, Σ∖(𝒫 ∪ ℳ), ℳ and Q.
- T_{𝒟_Q} = T_∞(U_{𝒟_Q}, 𝒪)_m, and π_{𝒟_Q} : R_{𝒟^ps_Q} ↠ T_{𝒟_Q}.
- T^min_{𝒟_Q} is the quotient by the minimal primes with χ̃^{−1}det trivial on N_Σ (a nonempty set, by twisting).
- The patching modules are M_{𝒟_Q} = M_∞(U^min_{𝒟_Q})_m.
- *API:* `deformationLevel`, `deformationHeckeRing`, `pseudoToDeformationHecke`, `minimalHeckeRing`,
  `minimalPrimes_nonempty`, `deformationHeckeModule`.
- *Tests:*
  - maximal level outside (Σ∖𝒫) ∪ Q;
  - Δ_w acts at w ∈ Q;
  - twisting reaches ℳ^min.

**Theorem: T_{𝒟_Q} ≅ T^min_{𝒟_Q} ⊗ 𝒪[N_𝒟]** (node `minimal-hecke-ring-decomposition`). This is Proposition 3.23 with
Corollary 3.24 and Lemma 3.25; Gal(L_Θ/F) ≅ N_𝒟.

**Theorem: duality** (node `hecke-module-duality`). This is §3.7: λ_∞, β_∞, (3.16) and (3.17), with
M_∞(U)_m ≅ Hom_{Λ_𝒪}(M⁺_∞(U)_m, Λ_𝒪). Skinner–Wiles quote Proposition 3.3's freeness over 𝒪[[G(U)]], which is not
justified (PadicFamilies E11). The identifications need only Frobenius reciprocity and freeness over Λ′_𝒪.

**Theorem: Ihara's lemma** (node `ihara-lemma-quaternionic`; planet "Ihara's lemma for definite quaternion algebras").
This is Lemma 3.26. ker(f, g ↦ f + αg) is killed by [U(1 0; 0 λ^{(q)})U] − 1 − Nm(q). The proof follows Diamond–Taylor,
using strong approximation for the norm-one group and Eichler's norm theorem (requested from
HilbertModularVarietiesAndShimuraCurves R18.3).

**Lemma: deeper levels** (node `ihara-exact-sequence`). Lemmas 3.27–3.28.

**Theorem: no level raising at a good auxiliary prime** (node `level-raising-congruence-modules`). This is Lemma 3.29.
At ℓ with p ∤ Nm(ℓ) − 1 and eigenvalue ratio ≠ Nm(ℓ)^{±1}, the Hecke algebras at levels U, U_0(ℓ) and U_1(ℓ) agree at
𝔭, and M̂_∞(U^{(0)})_𝔭 ≅ M̂_∞(U)_𝔭².

## Layer R21.3: ordinary Galois and deformation families (partial)

Library modules: `TauCeti/NumberTheory/OrdinaryModularity/{Deformations, HidaGalois}`. The sources are Skinner–Wiles
§§2.1, 2.3–2.5 and §3.3. χ is totally odd with χ|_{D_i} ≠ 1 at every v_i | p.

**Definition: deformation data** (node `deformation-datum`). 𝒟 = (𝒪, Σ, c, ℳ) consists of the coefficients 𝒪, the
ramification set Σ ⊇ 𝒫, an admissible class 0 ≠ c ∈ H_Σ(F, k) and the places ℳ. The class c gives the nonsplit
ρ_c = (1 *; 0 χ), which is Schur but reducible.
- *API:* `DeformationDatum`, `admissibleClasses`, `residualExtension`, `residualExtension_schur`,
  `residualExtension_local_split`.
- *Tests:*
  - c = 0 is excluded;
  - ρ_c(z_1) = diag(1, −1);
  - Ribet's class for p = 691, χ = ω^{11} over ℚ is admissible.

**Construction: nearly ordinary deformations** (node `deformation-of-type`; planet "Nearly ordinary deformation ring
R_𝒟").
- Type 𝒟 asks for ramification only in Σ, the ordered flag (ψ_1 *; 0 ψ_2) with ψ_1 ≡ χ at each v_i, and the shape
  (1 *; 0 χ̃) on I_w for w ∈ ℳ.
- R_𝒟 exists by Schur representability (GlobalGaloisDeformations R04.2).
- Variants: R_{𝒟_Q} adds auxiliary primes Q, and R^min is the minimal ring, with R_{𝒟_Q} ≅ R^min_{𝒟_Q} ⊗ 𝒪[N_Σ].
- Skinner–Wiles' "det ρ trivial on N_Σ" means χ̃^{−1}det ρ.
- *API:* `IsOfType`, `universalRing`, `universalRing_represents`, `universalRingAux`, `universalRingMin`.
- *Tests:*
  - ρ_c itself is of type 𝒟;
  - the wrong flag order is not;
  - restriction to a permissible F′ gives type 𝒟′;
  - twisting moves between the N_Σ-components.

**Definition: permissible extensions** (node `permissible-extension`). These are the conditions under which 𝒟 base
changes to a totally real F′/F (Remark 2.1).
- *API:* `IsPermissibleExtension`, `DeformationDatum.baseChange`, `isOfType_baseChange`.
- *Tests:*
  - F itself is permissible;
  - a field splitting ρ_c is not;
  - a field where χ becomes trivial at some w | p is not.

**Theorem: presentation and dimension** (node `global-presentation-bound`; planet). R_𝒟 ≅ 𝒪[[x_1, …, x_g]]/(f_1, …, f_r)
with g − r ≥ d + δ_F − 2t − 3·#ℳ (Proposition 2.4). The proof has four steps:
1. Mazur's presentation of the fixed-determinant auxiliary ring.
2. d + 2t local nearly ordinary relations (Corollary 2.3, requested from LocalGaloisDeformationRings L8).
3. Tensor with 𝒪[[Gal(L(Σ)/F)]] to free the determinant.
4. Add 3·#ℳ relations at ℳ, and finish with the global Euler characteristic.

**Lemma: matrix entries** (node `matrix-entry-subring`). R_𝒟 is generated over the completed subring of matrix entries
(Lemmas 2.5–2.6).

**Definition: ramification types** (node `ramification-types`). Types A (unipotent), B (φ ⊕ 1), B′ (φ ⊕ φ^{−1}) and C
(induced from the unramified quadratic extension, characteristic 0 only).
- *API:* `RamificationType`, `ramificationType_of_pseudo`, `typeC_charZero`.
- *Tests:*
  - Tate curves give type A;
  - π(μ, 1) with μ tamely ramified gives type B;
  - type C is impossible in characteristic p.

**Definition: pseudo-representations** (node `pseudo-representation`; planet "Wiles pseudo-representation"). A
pseudo-representation is ρ = {a, d, x} satisfying Wiles' seven identities. Its trace is a + d and its determinant is
a(σ)d(σ) − x(σ, σ). A representation with ρ(z_1) = diag(1, −1) gives {a_σ, d_σ, b_σc_τ}. Pseudo-deformations are those
of ρ_0 = {1, χ, 0}, of type 𝒟^ps = (𝒪, Σ). The trace is an IHG.0 pseudocharacter.
- *API:* `PseudoRep`, `PseudoRep.trace`, `PseudoRep.det`, `PseudoRep.ofRep`, `PseudoRep.ofRep_conj_diagonal`,
  `PseudoRep.trace_isPseudocharacter`.
- *Tests:*
  - the fourth identity is the expansion of b_{στ}c_{αβ} (proved in the Lean file);
  - all ρ_c share ρ_0;
  - the determinant of ofRep is det;
  - diagonal conjugation leaves ofRep unchanged.

**Theorem: the universal pseudo-deformation ring** (node `universal-pseudo-deformation`). The functor satisfies
Schlessinger's criteria, with tangent dimension at most 4·#Gal(F(χ)/F) + 2s² + 4 (Lemma 2.10). The proof gives the
sharper bound s² + 4s + 4·#Gal(F(χ)/F).

**Construction: r_𝒟** (node `pseudo-to-deformation-map`). The map R_{𝒟^ps} → R_𝒟 is well defined because bases with
ρ(z_1) = diag(1, −1) differ diagonally. It does not see c.
- *API:* `pseudoToDeformation`, `pseudoToDeformation_unique`, `pseudoToDeformation_aux`.
- *Tests:*
  - it is the identity modulo maximal ideals;
  - it is independent of the basis;
  - it does not detect c.

**Theorem: localisation at irreducible primes** (node `pseudo-deformation-localisation`). At a one-dimensional 𝔭 with
ρ mod 𝔭 irreducible, R̂^ps_{𝔭^ps} ↠ R̂_{𝒟_Q,𝔭} (Proposition 2.11). Hence dim R^ps/Q^ps ≥ dim R_𝒟/Q (Corollary 2.12).

**Lemma: lattices** (node `lattice-reduction-lemma`). An irreducible ρ with reduction 1 ⊕ χ has a lattice with
nonsplit reduction (1 *; 0 χ), and its extension class is unique up to scalars (Lemma 2.13). Hence pseudo-deformations
over a DVR with x ≠ 0 come from deformations of some ρ_c (Corollary 2.14).

**Theorem: lifting pseudo-deformations** (node `pseudo-deformation-lifting`; planet). At a one-dimensional prime with
x ≢ 0, a pseudo-deformation (R, ρ) lifts to a deformation ρ⁺ of some ρ_c over a domain R⁺ ⊇ R of the same dimension,
built by blowing up and completing. With (2.8)–(2.9), ρ⁺ is of type 𝒟_Q (Proposition 2.15).

**Construction: Λ_𝒪-structures** (node `deformation-iwasawa-algebra`). T_i ↦ det(γ_i) − 1 and Y ↦ ψ_2(y) − 1 on R_𝒟.
On R_{𝒟^ps} the Y-variables use the roots α_i, β_i at g_i: (tr(g_iσ) − α_i tr σ)/(β_i − α_i) = ψ_2(σ). The structures
are compatible with r_𝒟 and with level change.
- *API:* `deformationLambdaAlgebra`, `pseudoLambdaAlgebra`, `pseudoToDeformation_lambda`, `lambdaAlgebra_levelChange`.
- *Tests:*
  - the upper-triangular identity (proved in the Lean file);
  - r_i = 0;
  - the variables vanish residually.

**Construction: Hida's family representation** (node `hida-family-representation`; planet). For every prime Q of
T_∞(U, 𝒪), ρ_Q : Gal(F̄/F) → GL₂(L̄) is semisimple with the properties (3.4)(i)–(vi): trace T(ℓ), determinant
S(ℓ)Nm(ℓ) and S_xε(x), and the flag at each v_i with ψ_2(y) = T_y and ψ_2(λ_{𝔭_i}) = T_0(𝔭_i). The construction:
- algebraic primes of weight 2 use Wiles' ρ_π (requested from AutomorphicGaloisRepresentations R19.2);
- minimal primes glue over the dense weight-two points;
- the flag (vi) comes from a nonsplit-reduction argument.
- *API:* `hidaGaloisRep`, `hidaGaloisRep_trace`, `hidaGaloisRep_det`, `hidaGaloisRep_nearlyOrdinary`,
  `hidaGaloisRep_specialise`.
- *Tests:*
  - ρ_Q(z_1) = diag(1, −1);
  - it specialises to ρ_π in weight two;
  - ψ_2 ≡ 1 modulo a permissible ideal.

**Construction: the pseudo-representation into T_m** (node `hecke-pseudo-representation`). ρ^mod_m is obtained by
patching over the minimal primes in m (3.5). For permissible m it gives the Λ_𝒪-algebra map
R_{𝒟^ps} → T_∞(U, 𝒪)_m (3.6).
- *API:* `heckePseudoRep`, `heckePseudoRep_trace`, `pseudoToHecke`, `pseudoToHecke_lambda`.
- *Tests:*
  - the residual pseudo-representation is {1, χ, 0};
  - specialisation gives ρ_Q;
  - the determinant is S(ℓ)Nm(ℓ).

**Lemma: permissible = residually χ ⊕ 1** (node `permissible-residual-comparison`). (3.9) is equivalent to
ρ̄_m ≅ χ ⊕ 1, and a permissible ideal is unique. This closes R21.2's deferral.

**Theorem: generation and surjectivity** (node `hecke-generation`; planet "Surjectivity of R^ps → T_m").
T_∞(U, 𝒪)_m is generated over Λ_𝒪 by T(ℓ), S(ℓ) with ℓ ∉ S (Lemma 3.11). Its proof uses
T_y = (β_i − α_i)^{−1}(β_i tr ρ(σ_y) − tr ρ(g_iσ_y)); the source omits the inverse (E3). Hence level change and (3.6)
are surjective (Corollaries 3.12–3.13).

**Theorem: level by type** (node `level-type-control`). A minimal prime comes from the level fixed by its type at w:
unramified, A, B or C (Proposition 3.14), or U′_w for type B′ with p-power φ (Proposition 3.15).

**Lemma: inertia at auxiliary levels** (node `inertia-character-constraints`). Lemma 3.16.

**Lemma: twisting** (node `family-twisting`). ρ_Q ⊗ Ψ occurs at level U ∩ U_1(cond^{(p)}(Ψ)²) (Lemma 3.17). The
twist multiplies T_0(𝔭_i) by Ψ_P(λ_{𝔭_i}); the source prints the inverse (E4).

**Lemma: the reducible locus** (node `reducible-locus-dimension`). This is Lemmas 2.7–2.9.
- dim R^red_𝒟 ≤ 1 + 2δ_F + dim H_Σ(F, k).
- Reducible primes with finite-order determinant have dimension ≤ δ_F + dim H_Σ.
- Diagonal deformations have dimension ≤ 1 + 2δ_F, or ≤ δ_F with finite-order determinant.

## Layer R21.4: pro-modularity and R = T (partial)

Library module: `TauCeti/NumberTheory/OrdinaryModularity/ProModularity`. The source is Skinner–Wiles §§4.1–4.3 and
Appendix A.

**Definition: pro-modular primes** (node `pro-modular-prime`; planet). q ⊆ R_𝒟 is pro-modular if the pseudo-deformation
map R_{𝒟^ps} → R_𝒟/q factors through T_𝒟. The property passes to larger primes and to components.
- *API:* `IsProModular`, `IsProModular.of_le`, `IsProModularComponent`, `IsProModular.trace`.
- *Tests:*
  - the maximal ideal is pro-modular;
  - pro-modularity specialises;
  - it does not see the extension class.

**Definition: good pairs and nice primes** (node `good-pair-and-nice-primes`; planet). Goodness of (F, 𝒟) has five
conditions:
- d is even;
- L_p(F, −1, χω) is a non-unit;
- d > 2 + δ_F + 8(#Σ + dim H_{Σ_0});
- d_{v_i} > 2 + 2t + 7(#Σ + dim H_{Σ_0});
- a ramification condition at w ∤ p.

The node also defines nice deformations and primes, and properties (P1) and (P2).
- *API:* `IsGoodPair`, `IsNiceDeformation`, `IsNiceFor`, `PropertyP1`, `PropertyP2`, `IsGoodPair.mono`.
- *Tests:*
  - no datum over ℚ is good;
  - the local degree bound;
  - nice deformations live in characteristic p.

**Lemma: components meet** (node `raynaud-connectedness-corollary`). This is Corollary A.2. For a local Cohen–Macaulay
ring and r ≤ d − 2 relations, two nonempty classes of components meet in a prime of dimension d − r − 1. Raynaud's
connectedness theorem (Proposition A.1) is cited without proof, and no roadmap plans it, so it is a gap.

**Theorem: the key proposition** (node `pro-modularity-key-proposition`; planet). This is Proposition 4.1. If (F, 𝒟) is
good and (P1) and (P2) hold for 𝒟 and 𝒟_c, every prime of R_𝒟 is pro-modular. The proof combines:
- dimension counting with Proposition 2.4 and Corollary A.2;
- irreducibility at large-dimensional primes (Lemmas 2.6–2.8);
- Corollary 2.12, which is printed as "Proposition 2.12" (E5);
- the Λ_𝒪-structure, to find a nice prime.

## Mistakes found in the sources

**E1 (misprint, reaches nothing): Skinner–Wiles §3.2, before Lemma 3.10, p. 41.** "makes Λ_𝒪 a free Λ′_𝒪-module of
rank r = Σr_j" should read rank p^{Σ r_j}. In each variable u(1 + T)^{p^r} − 1 is a unit times a distinguished
polynomial of degree p^r. Lemma 3.10 uses only finite freeness.

**E2 (misprint, reaches nothing): p. 35.** "H⁺_∞(U_a) = lim→ eH⁰(X(U_a), K/𝒪)⁺" should read H⁺_∞(U).

**E3 (misprint, reaches nothing): the proof of Lemma 3.11, p. 42.** "T_y = (β_i − α_i)(β_i trace ρ^mod(σ_y) −
trace ρ^mod(g_iσ_y))" should have (β_i − α_i)^{−1}, and likewise for T_0(𝔭_i). The printed expression is
(β_i − α_i)²T_y. Membership in T^S is unaffected, because β_i − α_i is a unit.

**E4 (misprint, reaches nothing): (3.7), p. 45.** "τ_P(T_0(𝔭_i)) = (T_0(𝔭_i) mod P)·Ψ_P(λ_{𝔭_i})^{−1}" should read
Ψ_P(λ_{𝔭_i}). Twisting by Ψ ∘ det multiplies [U(1 0; 0 λ)U] by Ψ(λ), exactly as the next line does for T_y.

**E5 and E6 (misprints, reach nothing): cross-references.**
- The proof of Proposition 4.1 (p. 64) cites "Proposition 2.12" for Corollary 2.12.
- The proof of Proposition 4.2 (p. 66) cites "Proposition 3.14" for Proposition 3.18 (existence of the permissible ideal).

No erratum was found on Numdam or in the Crossref record of doi:10.1007/BF02698855.

## Remaining work

- **R21.1 is partial.** Still to do:
  - apply the projector to the modular-curve H¹ towers (ModularCurvesPartII R14.3; Hida 1986) and to the indefinite
    Hilbert and Shimura-curve cohomology (R18.4);
  - odd-degree F.
- **R21.2 is source-decomposed** (checkpoint 3).
- **R21.3 is partial.** The L8 determinant-versus-flag comparison is now planned in LocalGaloisDeformationRings L8, and
  is recorded here only when a consumer needs it.
- **R21.4 is partial.** Still to do:
  - Proposition 4.2 ((P2)) and the Main Theorem (§4.5);
  - formal patching (§5, importing DeformationAndDerivedPatchingAlgebra R03.5–R03.6);
  - cohomology estimates (§6, with GlobalGaloisDeformations R04.5);
  - nice primes (§7);
  - raising the level and (P1) (§8);
  - the Raynaud gap.
- **R21.5–R21.6 are not read:** Theorems A and B (§4.6), the p = 3 branch (Dieulefait–Pacetti), and Khare's use of
  Skinner–Wiles.

## Sources

- C. M. Skinner and A. J. Wiles, *Residually reducible representations and modular forms*, Publ. Math. IHÉS 89 (1999)
  5–126, DOI 10.1007/BF02698855 (Numdam open access).
