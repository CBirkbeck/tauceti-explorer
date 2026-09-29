# Ordinary automorphic forms and ordinary modularity lifting — blueprint

This blueprint covers stages R21.1–R21.6. After eight checkpoints, **R21.1, R21.2 and R21.6 are source-decomposed**;
R21.3, R21.4 and R21.5 are partial. The roadmap belongs to the restructured family RS-08, whose `keeps` are followed:
- R21.1 only applies the ordinary projector to actual arithmetic modules;
- R21.2 keeps the nearly ordinary and Eisenstein statements that Skinner–Wiles need beyond cuspidal Hida theory;
- R21.3 keeps the ordinary Galois families and deformation rings, in the pseudo-representation formalism the source
  actually uses for reducible residual representations.

The source is C. M. Skinner and A. J. Wiles, *Residually reducible representations and modular forms*, Publ. Math.
IHÉS 89 (1999), 5–126, §§2–8 and Appendix A. It is open access on Numdam as an OCR'd scan; every formula below was checked on the
page images.

Checkpoint 6 adds three sources:
- Berger–Li–Zhu, *Construction of some families of 2-dimensional crystalline representations* (arXiv:math/0310275v1,
  Math. Ann. 329 (2004)), for the crystalline-to-ordinary criterion;
- Dieulefait–Pacetti (arXiv:2108.07577v2), for the p = 3 branch;
- Khare (arXiv:math/0504080v1), for how the level-one argument uses Skinner–Wiles.

Checkpoint 7 adds C. M. Skinner and A. J. Wiles, *Nearly ordinary deformations of irreducible residual
representations*, Ann. Fac. Sci. Toulouse Math. (6) 10 (2001), 185–215 (Numdam open access, read in full on the page
images). It is the residually irreducible companion of the 1999 paper. No stage owned it before; it is now planned
across R21.3–R21.5, next to the 1999 argument it adapts.

Checkpoint 8 adds three sources for the classical Hida family over ℚ and the required examples:
- Emerton–Pollack–Weston, *Variation of Iwasawa invariants in Hida families* (arXiv:math/0404484v1), §§2.1–2.3;
- Hida, *Iwasawa modules attached to congruences of cusp forms* (Ann. Sci. ÉNS 1986), Corollary 3.7;
- Mazur, *Modular curves and the Eisenstein ideal* (Publ. Math. IHÉS 47), Proposition II.9.7.

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
  - **DeformationAndDerivedPatchingAlgebra R03.2 (R21.3):** Schlessinger's criteria;
  - **LocalGaloisDeformationRings L8 (checkpoint 7):** the nearly ordinary ring of a nonsplit ρ₀|_{D_v} with distinct
    characters;
  - **SerreWeightAndLevelOptimisation R20.6 (checkpoint 7):** Diamond's Theorem 6.4 (The refined conjecture of Serre),
    a χ₂-good nearly ordinary lift of a modular p-distinguished ρ̄ over ℚ.
- **GlobalGaloisDeformations R04.2 (checkpoint 7):** Carayol's trace theorem (`carayol-trace-theorem`).

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

### Checkpoint 7: deformations and Hecke rings for irreducible ρ₀ (Skinner–Wiles 2001, §§2–3)

Library modules: `TauCeti/NumberTheory/OrdinaryModularity/IrreducibleDeformations` and `…/IrreducibleHecke`.

**Definition: deformation data for irreducible ρ₀** (node `irreducible-deformation-datum`).
- *Residual conditions (2.1):* ρ₀ absolutely irreducible and odd; ρ₀|_{D_i} ≅ (χ^{(i)}_1 *; 0 χ^{(i)}_2) with
  χ^{(i)}_1 ≠ χ^{(i)}_2, possibly nonsplit; ρ₀|_{D_v} ≅ (1 *; 0 ω^{−1}) at ramified v ∤ p.
- *Data:* 𝒟 = (𝒪, Σ, ℳ). A lift of type 𝒟 is nearly ordinary with the χ^{(i)}_1-line as sub, and unipotent on I_w for
  w ∈ ℳ. The universal ring is R_𝒟, and R_{𝒟_Q} ≅ R^min_{𝒟_Q} ⊗ 𝒪[N_Σ] (2.2) as in 1999.
- *API:* `IrreducibleResidual`, `IrreducibleDatum`, `IsOfIrreducibleType`, `irreducibleUniversalRing` with its universal
  property and the minimal twist.
- *Tests:*
  - ρ₀ is of type 𝒟;
  - a lift with the labels exchanged is not of type 𝒟;
  - shrinking (Σ, ℳ) gives a surjection;
  - dihedral ρ₀ are allowed.

**Theorem: the presentation** (node `irreducible-presentation-bound`). This is Proposition 2.1:
R_𝒟 ≅ 𝒪[[x_1, …, x_g]]/(f_1, …, f_r) with g − r ≥ d + δ_F − 2t − 3#ℳ. The proof is the 1999 one; the only new input is
the nearly ordinary ring of a nonsplit ρ₀|_{D_i}, requested from LocalGaloisDeformationRings L8.

**Lemma: dihedral deformations** (node `dihedral-deformation-dimension`). This covers (2.3)–(2.4), the universal dihedral
deformation Ind Ψ_Σ, and Lemma 2.2 with a correction. A dihedral prime q ∋ p with finite-order determinant has
dim R_𝒟/q ≤ δ⁻_{F′}.
- If F′ is totally real, δ⁻_{F′} ≤ d/2 (Waldschmidt, a gap).
- If F′ is CM, δ⁻_{F′} = d. The printed bound d/2 then fails when the places above p split in F′ (source issue E11).

**Lemma: trace generation** (node `irreducible-trace-generation`). This is Lemma 2.3: R_{𝒟_Q} is generated over Λ_𝒪 by
the traces of Frobenius (Carayol, GlobalGaloisDeformations R04.2).

**Construction: the Galois representation over T_∞(U, 𝒪)_m** (node `integral-hecke-galois-representation`).
- If ρ_m is irreducible, ρ_{U,m} takes values in GL₂(T_∞(U, 𝒪)_m), which is then a Λ_𝒪-algebra.
- Lemma 3.3: T(ℓ)-generation, and freeness of M_∞(U)_m for small U.
- This assumes (H_even).

**Construction: permissible levels and Hecke rings** (node `irreducible-permissible-hecke-rings`).
- A permissible m has ρ_m ≅ ρ₀ and T_0(𝔭_i) ≡ χ^{(i)}_2(λ_{𝔭_i}), and it is unique.
- The levels U_{𝒟_Q} have four local shapes.
- (H_def) is assumed.
- The ring T_{𝒟_Q} carries ρ^mod_{𝒟_Q}, with modules M_{𝒟_Q}, M⁺_{𝒟_Q} and the quotient T^min_{𝒟_Q}.

**Theorem: R_{𝒟_Q} ↠ T_{𝒟_Q}** (node `irreducible-hecke-surjection`). This is Proposition 3.4. The proof checks the type
at each minimal prime:
- the determinant is unramified at Q, by Proposition 3.2 and local–global compatibility;
- the ordinary shape at v_i follows from (3.2)(vi);
- at w ∈ ℳ, the lift is unipotent by the Type A argument and a lattice argument.

Trace generation then gives surjectivity.

**Lemma 3.5** (node `irreducible-minimal-hecke-quotient`). T_{𝒟_Q} ≅ T^min_{𝒟_Q} ⊗ 𝒪[N_Σ]; T^min is finite, reduced and
torsion-free over Λ_𝒪; and trace ρ(σ_w) acts on M_{𝒟_Q} as δ_w + δ_w^{−1}.

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

**Theorem: the criterion for (P2)** (node `p2-criterion`; planet). This is Proposition 4.2: if (F, 𝒟) is good and (P1)
holds for all data with smaller Σ, then (P2) holds for 𝒟. There are three steps:
1. The Eisenstein ideal of χ gives a nice pro-modular prime for 𝒟_0.
2. Linear conditions and the dimension bounds produce a deformation of ρ_c.
3. Show that deformation is of type 𝒟_c and pro-modular, via the level statements.

**Theorem: (P1)** (node `property-p1`). Proposition 8.4 reduces (P1) to Proposition 8.1 (R = T at nice primes) by
twisting.

**Definition: formal patching data** (node `formal-patching-datum`). These are the axioms (5.1)–(5.11) over A = k[[T]]:
- rings R^{(N)}_a, finite free over A, with the level algebras A_N ⊇ B_N;
- trace subrings R^{tr(N)};
- modules M^{(N)}_a, free over A_a ⊗ K;
- the element x^{(N)}.

The patching is on deformation rings. Abstract patching is imported from DeformationAndDerivedPatchingAlgebra R03.5.

**Theorem: formal patching** (node `formal-patching-theorem`; planet). This is Lemmas 5.1–5.6 and Propositions 5.7–5.9.
R_∞ = K[[x_1, …, x_n]], M_∞ is free, M^{(0)} ⊗ K ≅ (R^{(0)} ⊗ K)^e, and R^{(0)} ⊗ K is a complete intersection. The
proof uses Auslander–Buchsbaum and de Smit–Rubin–Schoof Lemma 4.1 (R03.3).

**Lemma: characteristic-p irreducibility** (node `char-p-adjoint-irreducibility`). This is Lemmas 6.1–6.5, for ρ over
A = k[[λ]]: ad⁰ρ is irreducible, and there are elements with infinite-order eigenvalues in A.

**Theorem: auxiliary primes** (node `auxiliary-prime-sets`). This is Proposition 6.10: there are sets Q of r primes with
Nm(w) ≡ 1 mod p^m, prescribed Frobenius, and lim H_{Σ_Q} ≅ (K/A)^r ⊕ bounded. The proof combines Wiles' formula (6.3),
the local estimates (6.4)–(6.9), Lemma 6.9 and Chebotarev (R04.5).

**Lemma: ψ(𝒟, 𝔭)** (node `minimum-level-surjection`). This is Lemma 7.1: a surjection (R̃^min)_{𝔭̃} ↠ (T̃^min)_{𝔭̃} at a
nice prime, through Proposition 2.15.

**Theorem: R = T at minimal level** (node `minimum-level-r-equals-t`). This is Proposition 7.3, for 𝒟 = 𝒟_c:
- ψ is an isomorphism;
- the ring is a reduced complete intersection over Λ̃_{𝒪,P};
- M̃ is free.

The §5 data are built from the Q_N of Proposition 6.10 and Lemmas 3.19, 3.21 and 3.29.

**Lemma: congruence maps** (node `level-raising-congruence-maps`). This is §8.2: Lemma 8.2 and the maps Φ_i, Φ̂_i, Ψ_i,
Θ_i with the level-raising factors η_i.

**Theorem: R = T at nice primes** (node `nice-prime-r-equals-t`; planet). This is Proposition 8.1. It is proved by
induction along 𝒟_c ≤ ⋯ ≤ 𝒟 with de Smit–Rubin–Schoof Criterion I, via (8.4), (8.5) and (8.7).

**Theorem: the Main Theorem** (node `main-theorem`; planet). Let ρ over any totally real F be irreducible, nearly
ordinary of type 𝒟, with det ρ = ψε^μ, μ ≥ 1. If ρ admits a solvable, even-degree, permissible base change L with
(L, 𝒟_L) good, then ρ is modular. The proof combines:
- Propositions 4.1, 4.2 and 8.4;
- Hida's control (Proposition 3.7);
- Wiles' ρ_π;
- solvable base change (requested from GL2AutomorphicRepresentationsAndTransfer R17.4).

### Checkpoint 7: pro-modularity and R = T for irreducible ρ₀ (Skinner–Wiles 2001, §§4, 6–8)

Library module: `TauCeti/NumberTheory/OrdinaryModularity/IrreducibleRT`.

**Definition: good pairs, nice primes, (P)** (node `irreducible-good-pair-and-nice-primes`). (F, ρ₀) is good if
d/2 > 2 + 2t + 7#ℳ₀, d_i > 2 + 2t + 7#ℳ₀, and (H_even) and (H_def) hold. Nice primes are defined by (4.2). Property (P):
every prime below a nice prime is pro-modular. One property replaces the 1999 pair (P1), (P2).

**Theorem: pro-modularity** (node `irreducible-pro-modularity`). This is Proposition 4.1, with two hypotheses its proof
needs and its statement omits:
- (a) d/2 > 2 + 2t + 7#(Σ ∖ 𝒫), a bound on Σ (source issue E14);
- (b) the dihedral locus has dimension at most d/2 (source issue E11).

The three-step proof follows the 1999 one through Corollary A.2. The Lean file checks each inequality, and that (4.1)
alone does not give the general step.

**Theorem: Selmer groups and auxiliary primes** (node `irreducible-selmer-auxiliary-primes`). This is Lemma 7.1 and
Proposition 7.2, proved exactly as the 1999 Lemma 6.3 and Proposition 6.10, with the unipotent local condition at
ramified w ∤ p.

**Theorem: R = T at nice primes** (node `irreducible-nice-prime-r-equals-t`). This is Propositions 8.1–8.2. The rings
R^{(N)}_a and modules M^{(N)}_a are built from the sets Q_N. They satisfy (6.2)–(6.8), and Proposition 6.1 (the 1999
patching theorem with R^{tr} = R) gives the complete intersection and freeness. The congruences of 1999 §3.8 give every 𝒟
and property (P).

## Layer R21.5: Skinner–Wiles' theorems (partial)

Library module: `TauCeti/NumberTheory/OrdinaryModularity/SkinnerWiles`.

**Definition: Hypothesis H** (node `hypothesis-h`). There are imaginary quadratic extensions with prescribed local
behaviour and relative class groups of p-rank ≤ c(ε)[K:ℚ]^{1−ε}. It is a hypothesis, not a theorem.

**Theorem A** (node `theorem-a`; planet). For F and F(χ_1/χ_2) abelian over ℚ, an irreducible nearly ordinary ρ with
ρ̄^ss ≅ χ_1 ⊕ χ_2, χ_1/χ_2 odd and p-distinguished, and det ρ = ψε^{k−1} is modular. The good base change is built as
follows:
- take cyclotomic ℤ_ℓ-towers;
- Washington's theorem (a gap) bounds their class groups;
- adjoin abelian p-extensions, which make L_p(L, −1, χω) a non-unit;
- Waldschmidt's bound (a gap) finishes the count.

**Theorem B** (node `theorem-b`; planet). The same for arbitrary totally real F with (χ_1/χ_2)|_{D_v} of even order,
conditional on Hypothesis H. The tower uses totally real quadratic steps.


### Checkpoint 6: the crystalline-to-ordinary criterion and the forms used downstream

Library module: `TauCeti/NumberTheory/OrdinaryModularity/CrystallineOrdinary`.

**Definition: V_{k,a_p}** (node `crystalline-family-v-k-ap`). For k ≥ 2 and a_p ∈ 𝔪_E, D_{k,a_p} = Ee₁ ⊕ Ee₂ has
φ(e₁) = p^{k−1}e₂ and φ(e₂) = −e₁ + a_pe₂, and filtration jumps 0 and k − 1 (Fil¹ = Ee₁). It is weakly admissible, and
V_{k,a_p} is the irreducible crystalline representation with D_cris(V*) = D_{k,a_p}. Every irreducible two-dimensional
crystalline V is V_{k,a_p} ⊗ η (Breuil, as recalled by BLZ).
- *API:*
  - `Dkap` (constructor) and `Dkap_weaklyAdmissible`;
  - `Vkap` (constructor);
  - `Vkap_charpoly`: X² − a_pX + p^{k−1};
  - `Vkap_classification`.
- *Tests:*
  - the matrix of φ has trace a_p and determinant p^{k−1} (checked in Lean at p = 3, k = 4);
  - V_{2,0} at p = 3 is V₃ of y² = x³ − x, a supersingular curve with a₃ = 0;
  - a unit a_p gives a reducible representation (non-example);
  - a_p = 0 gives equal slopes, and V_{k,0} is induced from ℚ_{p²}.

**Theorem** (node `blz-reduction-theorem`). BLZ Proposition 3.1 builds λ₊ and λ₋ and the integral truncation z of
p^m(λ₋/λ₊)^{k−1}. It then gives:
- P(X) and the unique G_γ(X) (Proposition 3.3);
- the Wach modules N_{k,α} with N_{k,α}/π ≅ D_{k,p^mα} (Proposition 3.7);
- Theorem 4.1: the reductions of T_{k,a_p} and T_{k,0} agree;
- Corollary 4.3(1): V̄_{k,a_p} ≅ V̄_{k,0} for k ≤ p + 1 and v_p(a_p) > 0. Here m = 0 at k = p + 1 (Remark 4.2(1)).

The (φ, Γ) inputs are requested from PhiGammaModulesAndIwasawaCohomology PG.1, PG.6 and PG.7.

**Lemma** (node `reduction-of-v-k-zero`). V̄_{k,0} = ind(ω₂^{k−1}) when (p + 1) ∤ (k − 1). It is irreducible for
2 ≤ k ≤ p + 1 and reducible at k = p + 2 (checked in Lean).

**Theorem: crystalline with reducible reduction is ordinary** (node `crystalline-reducible-reduction-is-ordinary`;
planet).
- *Statement:* for 2 ≤ k ≤ p + 1, a crystalline V with Hodge–Tate weights {0, k − 1} and reducible V̄^{ss} is ordinary,
  and p-distinguished when (p − 1) ∤ (k − 1).
- *Proof:* otherwise V = V_{k,a_p} ⊗ η with v_p(a_p) > 0, whose reduction is irreducible by BLZ.
- It is the criterion SmallRamificationAndAbelianVarietyBaseCases R25.5 requests at (3, 2), (3, 4), (5, 6), (7, 8) and
  (13, 14), and the one DP use in Paso 6.
- Low weight alone does not force ordinarity; the reducibility of the reduction is what is used.

**Theorem: Skinner–Wiles over ℚ** (node `theorem-a-over-q`; planet). This is the theorem of Skinner–Wiles'
introduction:
- *Hypotheses:* ρ irreducible, ρ̄^{ss} ≅ 1 ⊕ χ, (i) χ|_{D_p} ≠ 1, (ii) ρ|_{I_p} ≅ (∗ ∗; 0 1), (iii) det ρ = ψε^{k−1}, odd.
- *Conclusion:* ρ is modular of weight k.
- It is Theorem A with F = ℚ; both abelian hypotheses are automatic there.
- Khare quotes it for the residually reducible degenerate branches. His residually irreducible degenerate branch uses
  Skinner–Wiles 2001, planned in checkpoint 7 below.

**Theorem: the p = 3 branch** (node `theorem-a-at-three`). This is Dieulefait–Pacetti's Theorem 1.7: ρ̄^{ss} ≅ 1 ⊕ χ̄₃,
ordinary at 3. Hypothesis (i) is automatic because χ̄₃ is ramified at 3 (source issue E9). Pan's theorem (p ≥ 5) does not
cover this case.

### Checkpoint 7: Skinner–Wiles 2001, Theorems 5.1 and 5.2

**Theorem: lifting for irreducible residual representations** (node `nearly-ordinary-irreducible-lifting`; planet
"Skinner–Wiles lifting theorem (irreducible residual)"). This is Theorem 5.1 over totally real F.
- *Hypotheses:* ρ satisfies (5.1): irreducible, odd, finitely ramified, det ρ = ψε^μ, nearly ordinary at every v | p. Also
  (i) ρ̄^{ss} is irreducible and D_i-distinguished, and (ii) there is a nearly ordinary π₀ with ρ_{π₀} a χ₂-good lift.
- *Conclusion:* ρ ≅ ρ_π.
- *Proof:* base change to L by Skinner–Wiles' Duke paper (a gap), make (L, ρ₀) good, then apply Propositions 4.1 and
  8.2, Hida's Proposition 3.2 and solvable descent.
- *Extra hypothesis:* (iii) ρ̄^{ss} is not induced from a quadratic extension with a complex place. The printed proof
  does not cover that case (E11).
- It serves GL2ModularityLifting R22.1 and PotentialModularityAndCompatibleSystems R23.3.

**Theorem: over ℚ** (node `nearly-ordinary-irreducible-lifting-over-q`; planet "Skinner–Wiles over ℚ (irreducible
residual)"). This is Theorem 5.2 and the theorem of the introduction:
- *Hypotheses:* ρ̄^{ss} irreducible and modular, (χ_1/χ_2)|_{D_p} ≠ 1, ρ|_{I_p} ≅ (∗ ∗; 0 1), det ρ = ψε^{k−1} odd.
- *Conclusion:* ρ is modular.
- It covers ρ̄^{ss} reducible over ℚ(ζ_p), the cases Wiles and Diamond exclude.
- Hypothesis (ii) of Theorem 5.1 comes from Diamond's Theorem 6.4, requested from SerreWeightAndLevelOptimisation R20.6.
- With E11, it excludes ρ̄^{ss} induced from an imaginary quadratic field. Khare's branch with p ≡ 3 mod 4 (ρ̄ induced
  from ℚ(√−p)) needs E11 resolved.

## Layer R21.6: ordinary-family outputs and independence (partial)

Library module: `TauCeti/NumberTheory/OrdinaryModularity/Exports`.

**Theorem: the export with its level** (node `exported-ordinary-modularity-over-q`; planet "Ordinary modularity over ℚ,
with its level").
- *Statement:* ρ ≅ ρ_{f,λ} for a newform f of weight k. The level is the Artin conductor away from p
  (AutomorphicGaloisRepresentations R19.4), and p ∤ N exactly when ρ is crystalline at p (R19.5).
- In particular a ρ unramified outside p and crystalline at p gives f ∈ S_k(SL₂(ℤ)), the witness R25.5 needs.
- *Consumers:* ClassicalSerreModularity R26, R27.1 and R33.1, GL2ModularityLifting R32.1 and R32.5,
  PotentialModularityAndCompatibleSystems R23.4, and SmallRamificationAndAbelianVarietyBaseCases R25.5.
- Since checkpoint 7 the export also covers the residually irreducible theorem
  (`nearly-ordinary-irreducible-lifting-over-q`).

**Comparison: independence from Serre's conjecture** (node `independence-from-serre`). The prerequisite closure of
Theorem A contains no node of ClassicalSerreModularity and no residually irreducible modularity assertion. Residual
modularity is by Eisenstein congruences (R21.2). So the theorems can initialise Serre's conjecture without circularity.

### Checkpoint 8: the classical Hida family over ℚ and the required examples

Library modules: `…/HidaFamilyOverQ` and `…/Exports`.

**Construction: the Galois representation of a Hida family over ℚ** (node `hida-family-galois-representation-over-q`;
planet "Galois representations of Hida families over ℚ"). This is EPW Theorem 2.3.1. There is ρ : G_ℚ → GL₂(T^new_N ⊗_Λ L)
such that:
- ρ is unramified outside Np;
- charpoly(Frob_ℓ) = X² − T_ℓX + ⟨ℓ⟩ℓ^{−1};
- ρ is absolutely irreducible, and its determinant is ⟨·⟩(·)^{−1};
- its I_p-coinvariants are free of rank one, with Frob_p acting by U_p.

The node also includes EPW's further results:
- Proposition 2.3.2 (the tame conductor is N);
- Proposition 2.3.3 (inertia invariants specialise);
- Theorem 2.3.4 (ρ̄_m with its ordinary shape);
- Proposition 2.3.5 (the integral model when ρ̄_m is irreducible, by Carayol).

The Hecke side (T_N, T^new_N and Hida's primitive components) is requested from PadicFamilies L0, the owner of Hida
families. PadicFamilies L4's RS-08 note assigns this Galois side to the present roadmap. R21.3's
`hida-family-representation` covers only even-degree F.
- *API:* `hidaFamilyRep` with `_charpoly`, `_det`, `_ordinary`, `_tameConductor`, `_integral`, `_specialise`.
- *Tests:*
  - the weight-2 point of the X₀(11) family;
  - the determinant at weight k;
  - no integral model on the Eisenstein component;
  - the ordinary quotient.

**Theorem: the exported newform lies in a Hida family** (node `ordinary-newform-lies-in-a-hida-family`).
- For p ≥ 5, an ordinary newform of weight k ≥ 2, or its ordinary p-stabilisation, is a classical point of a unique
  primitive component (EPW §2.1; Hida Corollary 3.7).
- The family's representation specialises to ρ_{f,λ} there.
- For the export, ordinarity of f follows from ρ|_{I_p} ≅ (∗ ∗; 0 1) by the ordinarity criterion (PadicHodgeTheory R06.4).

**Application: X₀(11) at p = 5** (node `required-examples-x0-11-at-five`). Mazur's Proposition II.9.7 gives
T/𝔍 ≅ ℤ/5 with n = numerator(10/12) = 5. So a_ℓ ≡ 1 + ℓ mod 5 for ℓ ≠ 11, and:
- a_5 ≡ 1, so the form is ordinary at 5;
- ρ̄^{ss} ≅ 1 ⊕ ω is split and p-distinguished, since ω is odd and ramified;
- Theorem A over ℚ applies;
- 1 ⊕ ε₅ shows that irreducibility cannot be dropped;
- in the Hida family through f_α, the weights k ≡ 2 mod 4 have trivial character and are 5-old for k > 2.

The Lean file checks the numerology.

**Application: when p-distinguishedness holds and fails** (node `required-examples-p-distinguishedness`).
- For ψ unramified at p and k even, the residual characters differ on I_p, so (i) is automatic (compare E9).
- For χ_{−23} at p = 3, 3 splits in ℚ(√−23), so χ_{−23}|_{D_3} = 1 and Theorem A says nothing.

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
- The proof of Proposition 4.1 (p. 64) cites "Proposition 2.12" for Corollary 2.12. The same drift recurs in the proof of
  Proposition 4.2 ("Lemma 2.12", pp. 67 and 70; "Proposition 2.12", p. 69).
- The proof of Proposition 4.2 (p. 66) cites "Proposition 3.14" for Proposition 3.18 (existence of the permissible ideal).

**E8 (misprint, reaches nothing): §8.4, p. 119.** "By Proposition 7.2" should read Proposition 7.3; 7.2 is a Remark.

**E9 (misprint, reaches nothing): Dieulefait–Pacetti Theorem 1.7, p. 4.** The second hypothesis "ρ|_{D₃} ≠ (1 0; 0 1)"
transcribes Skinner–Wiles' condition (i), χ|_{D_p} ≠ 1, which DP cite as "[SW99] Theorem in the third page". For
ρ̄^{ss} ≅ 1 ⊕ χ̄₃ it holds automatically, so the check in Paso 6 ("Since Serre's weight is not 3 …") is unnecessary.

**E10 (misprint, reaches nothing): Berger–Li–Zhu Proposition 3.4, p. 8.** "γ, η ∈ Γ_K" should read Γ_{ℚ_p}; K is not
defined in the paper.

**E7 (misprint, reaches nothing): the proof of Theorem B, p. 78.** The four conditions are listed as (i), (ii), (iii),
(vi); the last should be (iv).

No erratum was found on Numdam or in the Crossref record of doi:10.1007/BF02698855.

**E11 (gap, reaches a stated result): Skinner–Wiles 2001, before Lemma 2.2, p. 191.** "By [Wal] we know that
δ⁻_{F′} ≤ d/2" holds for F′ totally real, where the minus part of the units has rank d. It fails for F′ CM:
- The minus part of the units is then finite, and the minus local units above p have rank d, so δ⁻_{F′} = d.
- If every v | p splits in F′ and ℳ = ∅, the anticyclotomic deformation Ind(ψ̃₀ψ⁻) is of type 𝒟 and has finite-order
  determinant. Its dihedral locus has dimension d, so Lemma 2.2's d/2 is false.
- The proof of Proposition 4.1 uses the d/2 bound three times: step one and step three on p. 200, and the general step
  on p. 202.

The plan assumes the bound as hypothesis (b) of Proposition 4.1 and (iii) of Theorem 5.1. Whether Theorems 5.1–5.2 fail
in these cases was not examined.

The problem is partly known. Khare–Wintenberger I (p. 16 of their preprint) cite C. Skinner, *Nearly ordinary
deformations of residually dihedral representations* ("to appear"; a 2009 preprint in Allen, arXiv:1301.1113), as "a
correction to" this paper. That correction was not obtained.

**E12 (misprint, reaches nothing): p. 191.** [Wal] is not in the bibliography (pp. 214–215). It is the [Wal] of
Skinner–Wiles 1999, Waldschmidt.

**E13 (misprint, reaches nothing): p. 200.** "#ℳ_c" and "ρ_{𝒟_c}" should read #ℳ₀ and ρ_{𝒟₀}. These are 1999 notation.

**E14 (gap, reaches the proof): Proposition 4.1, p. 202.** "the dimension of Q₂ is at least d − 7·#Σ − 1. It follows
from this and from (4.1) that the dimension of Q₂ is at least d/2 + 1." But (4.1) bounds only #ℳ₀.
- For example, d = 40, t = 1 and ℳ₀ = ∅ satisfy (4.1), while #Σ = 4 gives 11 < 21.
- The step needs d/2 > 2 + 2t + 7#(Σ ∖ 𝒫).
- Theorem 5.1 imposes d_L/2 > 2 + 7#Σ_L, so it is unaffected.

**E15 (misprint, reaches nothing): p. 202.** "As ρ satisfies (4.1i,ii)" should read (5.1i,ii).

No erratum to Skinner–Wiles 2001 was found on its Numdam page or by a web search.

## Remaining work

- **R21.1 is source-decomposed** (checkpoint 8).
  - Skinner–Wiles never use the modular-curve or indefinite Hilbert H¹ towers. The ordinary modular-curve towers are
    PadicFamilies L1's.
  - Odd-degree F never needs the Λ-adic statements: Theorem A passes to an even-degree permissible E, and the Main
    Theorem needs only L of even degree.
- **R21.2 is source-decomposed** (checkpoint 3).
- **R21.3 is partial.** The L8 determinant-versus-flag comparison is now planned in LocalGaloisDeformationRings L8, and
  is recorded here only when a consumer needs it.
- **R21.4 is partial.** Only the Raynaud gap remains. The verification of (5.10)–(5.11) and §8.3's commutative algebra
  are summarised inside the proof steps, as are Skinner–Wiles 2001's references to the 1999 §7.
- **R21.5 is partial.** Still to do:
  - Washington's and Waldschmidt's theorems (gaps);
  - Skinner–Wiles 2001 for a dihedral ρ̄^{ss} induced from a quadratic extension with a complex place (E11);
  - Skinner–Wiles, *Base change and a problem of Serre* (Duke Math. J. 107 (2001)), a gap.
- **R21.6 is source-decomposed** (checkpoint 8). The Hecke side of the ℚ family is requested from PadicFamilies L0.

## Sources

- C. M. Skinner and A. J. Wiles, *Residually reducible representations and modular forms*, Publ. Math. IHÉS 89 (1999)
  5–126, DOI 10.1007/BF02698855 (Numdam open access).
- L. Berger, H. Li and H. J. Zhu, *Construction of some families of 2-dimensional crystalline representations*, Math.
  Ann. 329 (2004), 365–377 (arXiv:math/0310275v1).
- L. V. Dieulefait and A. M. Pacetti, *A simplified proof of Serre's conjecture*, arXiv:2108.07577v2 (2022).
- C. Khare, *Serre's modularity conjecture: the level one case*, Duke Math. J. 134 (2006) (arXiv:math/0504080v1).
- C. M. Skinner and A. J. Wiles, *Nearly ordinary deformations of irreducible residual representations*, Ann. Fac. Sci.
  Toulouse Math. (6) 10 (2001), 185–215 (Numdam open access).
- M. Emerton, R. Pollack and T. Weston, *Variation of Iwasawa invariants in Hida families*, Invent. Math. 163 (2006),
  523–580 (arXiv:math/0404484v1).
- H. Hida, *Iwasawa modules attached to congruences of cusp forms*, Ann. Sci. École Norm. Sup. (4) 19 (1986), 231–273
  (Numdam open access).
- B. Mazur, *Modular curves and the Eisenstein ideal*, Publ. Math. IHÉS 47 (1977), 33–186 (Numdam open access).
