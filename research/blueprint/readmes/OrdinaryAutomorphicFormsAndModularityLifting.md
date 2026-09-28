# Ordinary automorphic forms and ordinary modularity lifting — blueprint

This blueprint covers stages R21.1–R21.6. After one checkpoint, **R21.1 and R21.2 are partial**; R21.3–R21.6 are not
yet read. The roadmap belongs to the restructured family RS-08, whose `keeps` are followed:
- R21.1 only applies the ordinary projector to actual arithmetic modules;
- R21.2 keeps the nearly ordinary and Eisenstein statements that Skinner–Wiles need beyond cuspidal Hida theory.

The source is C. M. Skinner and A. J. Wiles, *Residually reducible representations and modular forms*, Publ. Math.
IHÉS 89 (1999), 5–126, §§3.1–3.5. It is open access on Numdam as an OCR'd scan; every formula below was checked on the
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
  - **AutomorphicGaloisRepresentations R19.4:** local–global compatibility away from p.

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

## Layer R21.2: nearly ordinary and Eisenstein control (partial)

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

## Mistakes found in the sources

**E1 (misprint, reaches nothing): Skinner–Wiles §3.2, before Lemma 3.10, p. 41.** "makes Λ_𝒪 a free Λ′_𝒪-module of
rank r = Σr_j" should read rank p^{Σ r_j}. In each variable u(1 + T)^{p^r} − 1 is a unit times a distinguished
polynomial of degree p^r. Lemma 3.10 uses only finite freeness.

**E2 (misprint, reaches nothing): p. 35.** "H⁺_∞(U_a) = lim→ eH⁰(X(U_a), K/𝒪)⁺" should read H⁺_∞(U).

No erratum was found on Numdam or in the Crossref record of doi:10.1007/BF02698855.

## Remaining work

- **R21.1 is partial.** Still to do:
  - apply the projector to the modular-curve H¹ towers (ModularCurvesPartII R14.3; Hida 1986) and to the indefinite
    Hilbert and Shimura-curve cohomology (R18.4);
  - odd-degree F.
- **R21.2 is partial.** Skinner–Wiles Propositions 3.14–3.15, Lemmas 3.16–3.17, Proposition 3.20, Lemma 3.21, §3.6 and
  §3.8 use Hida's family representation ρ_Q, so they are planned with R21.3. Skinner–Wiles' nearly ordinary paper for the
  irreducible case (Toulouse 2001) is not read.
- **R21.3–R21.6 are not read:** ordinary Galois families and pseudo-deformations (Skinner–Wiles §§2–3.3), R = T and the
  patching of §§4–8, the p = 3 branch (Dieulefait–Pacetti), and Khare's use of Skinner–Wiles.

## Sources

- C. M. Skinner and A. J. Wiles, *Residually reducible representations and modular forms*, Publ. Math. IHÉS 89 (1999)
  5–126, DOI 10.1007/BF02698855 (Numdam open access).
