# Modularity and modular parametrisations of elliptic curves over ℚ — blueprint

This blueprint covers stages R29.1–R29.6: the application of the classical Serre theorem to an arbitrary elliptic curve E/ℚ. Its twenty nodes decompose the six stages, with sixteen open supplier requests. The packet remains partial; suggested signatures are plans, not implementations.

The general theory is imported from its owners:
- **FaltingsFinitenessAndIsogenyTheorems R28.4/R28.6:** End, Hom, isogeny finiteness and the isogeny criterion.
- **ArithmeticGaloisRepresentations R01.4–R01.6:** oddness, Frobenius recognition, Tate modules and conductors.
- **ClassicalSerreModularity R27.6:** Serre's conjecture.
- **AlgebraicModularFormsAndSerreWeights R15.4–R15.5:** the weight recipe and Deligne–Serre lifting.
- **AutomorphicGaloisRepresentations R19.4:** local–global compatibility. The existing `R19.6/weight-two-tate-module-decomposition` node supplies the Tate module of each A_f, and `R19.1/newform-rank-two-realisation` supplies absolute irreducibility of its two-dimensional scalar components.
- **ModularCurvesPartII R14.5–R14.6:** A_f, the cusp and Abel–Jacobi. The Jacobian old/new isogeny, with divisor multiplicities, is requested from R14.5 using ModularForms Layer 4.
- **Tau Ceti ModularForms Layers 4, 5, 7, 8g;** Tau Ceti EllipticCurves Layer 4; JacobianChallenge Layer F.

The argument is Serre's deduction of the Taniyama–Weil conjecture from the case ε = 1, k = 2 of his conjecture:
- **Serre,** *Sur les représentations modulaires de degré 2 de Gal(ℚ̄/ℚ)*, Duke 1987, §§2.8, 3.3, 4.6–4.7.
- **Carayol,** Ann. Sci. ÉNS 1986, Corollaire 0.8, for the exact conductor.
- **Faltings,** Invent. Math. 1983, Korollar 2, for the isogeny.
- **Deligne–Serre,** Lemme 6.11, for eigenvalue lifting.
- **Cremona,** *Algorithms for modular elliptic curves*, Chapter II, for the parametrisation.

Serre's theorem was conditional in 1987. Here it is unconditional, through R27.6.

## Purpose

Every elliptic curve E/ℚ of conductor N is modular. The roadmap exports three equivalent forms:
- the newform F_E ∈ S₂(Γ₀(N)) with rational integer coefficients and a_p(F_E) = a_p(E) for all p;
- a ℚ-isogeny from the modular quotient A_{F_E} of J₀(N) to E;
- a nonconstant parametrisation X₀(N) → E sending ∞ to O.

It also exports the analytic continuation and functional equation of L(E, s). Consumers include HeegnerPointEulerSystems
HE.1, EllipticRegulators and the BSD roadmaps.

## Conventions

- **Standing data.** E is a Weierstrass curve over ℚ with IsElliptic, of conductor N.
  - a_ℓ(E) = ℓ + 1 − #Ẽ(F_ℓ) at good ℓ.
  - The bad-prime local factors are those of Mathlib's `WeierstrassCurve.localPolynomial`: 1 − T split multiplicative,
    1 + T nonsplit, 1 additive.
- **Residual representations.** ρ̄_{E,p} is the action on E[p], with det = χ̄_p.
- **Newforms** are Tau Ceti's `HeckeRing.GL2.Newform`, normalised with a₁ = 1.
- **Non-circularity.** SerreWeightAndLevelOptimisation R20.6's elliptic export assumes E modular, so it is not a
  prerequisite.

## Milestones

Library module: `TauCeti/NumberTheory/EllipticCurve/Modularity`, namespace `TauCeti.EllipticCurve.Modularity`.

### R29.1 — residual irreducibility and conductor

**Definition: the exceptional primes** (`exceptionalPrimes`; node `exceptional-primes`; planet "Exceptional primes of
E"). Σ_E consists of:
- prime p ≤ 5;
- p ∣ N;
- p ∣ v_ℓ(j_E) for some ℓ ∥ N;
- degrees of ℚ-rational cyclic p-isogenies.

It is finite by R28.6.

*API.*
- `exceptionalPrimes_finite`.
- `irreducible_of_not_mem`: for a prime p outside Σ, E[p] is irreducible.
- `goodReduction_of_not_mem`: for a prime p outside Σ, p∤N; use a minimal local model for the equivalent reduction predicate.

*Unit tests.*
- 11a1, with 5, 11 ∈ Σ.
- 2, 3, 5 ∈ Σ always.
- `exceptionalPrimes_CM`: y² = x³ − x (CM, N = 32), with Σ finite and 2∈Σ.
- `exceptionalPrimes_11a1_seven`: **7∉Σ** for 11a1. Here Δ=−11⁵ and v₁₁(j)=−5. Counting points over F₃ gives a₃=−1, whose mod-7 Frobenius discriminant is the nonsquare 3; hence no rational cyclic 7-subgroup exists.
- `exceptionalPrimes_26b1`: **7∈Σ** for y²+xy+y=x³−x²−3x+3. The point (1,0) has order seven, and c₄=129, Δ=−2⁷·13 give v₂(j)=−7. Both substantive clauses apply; this example does not distinguish them individually.
- `exceptionalPrimes_valuation_only`: **7∈Σ** for y²+xy=x³−7x+9. Its c₄=337 and Δ=−2⁷·137 give multiplicative reduction at 2 with v₂(j)=−7; it has good reduction at 7. The trace a₃=−2 gives nonsquare discriminant 6 mod 7, excluding a rational cyclic seven-subgroup. Only the valuation clause applies.

**Lemmas and theorems:**
- `residual-conductor-divides`: N(ρ̄_{E,p}) ∣ N.
- `residual-conductor-equality`: for p ≥ 5, N(ρ̄) = N iff p ∤ N and p ∤ v_ℓ(j_E) at every ℓ ∥ N. The proof uses the
  Tate curve at multiplicative ℓ and the order-24 inertia bound at additive ℓ; Serre gives the criterion with
  "on vérifie".
- `residual-irreducibility-and-the-conductor-of-E-p` (Lemme 5): absolute irreducibility and conductor N for p ∉ Σ_E.

### R29.2 — Serre witnesses

- **`finite-flat-weight-two`:** at p ∉ Σ_E, E[p] is finite flat, so k = 2 (Serre's Proposition 4) and ε = 1 (§1.3).
- **`weight-two-and-level-N-from-the-weight-recipe`** (construction; planet "Serre witnesses at level N"). For p ∉ Σ_E,
  R27.6 gives a newform g_p of weight 2, level N and trivial character, with ρ̄_{g_p} ≅ ρ̄_{E,p}.
  - *Unit tests.*
    - E = 11a1 with p = 7: the witness is η(z)²η(11z)², and a₂ = −2.
    - No witness is requested at p = 5 ∈ Σ.
- **`trivial-nebentypus-by-reduction`:** the φ(N) route, kept distinct from the direct route det = χ̄ ⇒ ε = 1.

### R29.3 — one newform, exact coefficients

- **`pigeonhole-infinite-fiber`:** Mathlib's `Finite.exists_infinite_fiber`.
- **`algebraic-integer-norm-vanishing`:** an algebraic integer in primes above infinitely many p is zero, since p divides
  its norm.
- **`a-single-newform-for-infinitely-many-p-and-exact-coefficients`:** there is F with A_ℓ(F) = a_ℓ(E) for all ℓ ∤ N.
- **`newform-of-E`** (definition; planet "The newform F_E"). Initially F_E has a positive primitive level M_E dividing N. Uniqueness of this pair is imported from **Tau Ceti ModularForms Layer 5**, with agreement at almost all good primes. The fixed-space library theorem instead assumes agreement at all good indices outside a finite set. The cross-level theorem is not re-planned here.
  - *API:* `newformOf`, `newformOf_coeff_prime`, `newformOf_unique`, `newformOf_coeff_int`. Equality across different levels includes level equality and transport; the later exact-conductor theorem gives the level-N export.
  - *Acceptance:* at ambient level 22, the old copies f(z), f(2z) of the unique level-11 newform exhaust the two-dimensional cusp space; they do not provide a newform at level 22.
  - *Unit tests.*
    - 11a1.
    - Isogeny invariance.
    - Quadratic twists: use the primitive associate of F_E⊗χ_d; at primes away from the conductors and d the coefficient is χ_d(ℓ)a_ℓ(F_E).
- **`rational-coefficient-field`:** all coefficients of F_E are in ℤ. Galois conjugation and integrality use ModularForms Layers 8g/8; equality of the conjugates uses Layer 5 with prime agreement, including when the levels already agree.

### R29.4 — Galois comparison and exact conductor

- **`tate-module-comparison`:** V_r(E) ≅ V_r(F_E), by Chebotarev and Brauer–Nesbitt on semisimple representations.
- **`exact-conductor`** (planet "Exact conductor"): the level of F_E is N (Carayol, through R19.4).
- **`bad-euler-factors`:** every local factor agrees with Mathlib's `localPolynomial`, so A_ℓ(F_E) = +1, −1, 0 at split,
  nonsplit and additive ℓ.

### R29.5 — the modular quotient and parametrisation

- **`isogeny-to-E`:** A_{F_E} is an elliptic curve (K_{F_E} = ℚ), and Faltings' criterion gives a ℚ-isogeny
  A_{F_E} → E.
- **`modular-parametrisation`** (construction; planet "Modular parametrisation"). φ_E is the composite of Abel–Jacobi at
  ∞, the quotient to A_{F_E}, and the isogeny. It is nonconstant, and φ_E(∞) = O.
  - *Unit tests.*
    - 11a1 has degree 1.
    - 11a3 has degree 5.
    - 37a1 has degree 2.

### R29.6 — the final theorem

- **`modularity-theorem`** (planet "Modularity of elliptic curves over ℚ"): the three equivalent formulations. Translate a nonconstant parametrisation by −φ(∞) before applying the pointed Abel–Jacobi universal property.

  For the quotient-to-newform direction, the R14.5 request gives the old/new isogeny

  J₀(N) ∼ ∏_{M|N} ∏_[f] A_f^{τ(N/M)},

  where [f] ranges over Galois orbits of primitive weight-two trivial-character newforms and τ counts positive divisors. Combine it with the individual A_f comparison to obtain

  V_r(J₀(N)) ≅ ⊕_{M|N} ⊕_[f] (⊕_{λ|r} Res_{K_{f,λ}/ℚ_r} ρ_{f,λ})^{⊕τ(N/M)}.

  Choose r∤2N and extend scalars to an algebraic closure of ℚ_r. The imported rank-two realization makes each scalar summand absolutely irreducible of dimension two. A surjection onto V_r(E), also of dimension two, is nonzero on some summand and therefore is an isomorphism on that summand. This argument does not infer irreducibility from semisimplicity. Frobenius traces, Galois conjugation and Layer 5 identify the resulting primitive form with F_E; exact conductor and the bad-factor comparison finish the argument. No degree-one place of an arbitrary coefficient field is assumed.

  At N=22 there are two level-11 copies, giving Tate dimension four. For a coefficient field of degree d, restriction of scalars gives total dimension 2d independently of the splitting of r.
- **`l-function-continuation`** (planet): L(E, s) = L(F_E, s), with continuation and Λ(E, s) = w_E Λ(E, 2 − s).
- **`what-theoreme-4-asserts-and-its-scope`:** Serre's Théorème 5 (real multiplication) is recorded as a separately
  scoped target. No rank or BSD statement is made.

## Acceptance tests

- **Σ_E is explicit and finite without Mazur's theorem.** Mazur's p > 163 is a sharper, unread refinement.
- **Non-circularity.** No prerequisite assumes E modular.
- **Exact coefficients.** A_ℓ = a_ℓ comes from the norm argument, not from congruences at one prime.
- **Conductor.** The conductor equality uses local–global compatibility with monodromy, not unramified traces.
- **Bad factors** match Mathlib's `localPolynomial` sign conventions.
- **The parametrisation** is a morphism over ℚ, not a divisor class, and it is nonconstant.

## Suggested interfaces

The suggested file uses the actual pinned `HeckeRing.GL2.Newform N 2`, including `[NeZero N]` and its character. Its fixed-level `newformOf` takes an explicit hypothesis that a trivial-character level-N newform exists with prime coefficients away from N equal to the integer coefficients `E.LFunction(ℓ)`. This ties the form to E without claiming that every N is an admissible level. The initial M_E|N construction and exact-conductor must provide that proof; the conditional choice does not prove modularity. The coefficient and uniqueness APIs are actual signatures on this carrier.

All sixteen API names and fifteen test names occur. Six API entries and ten tests have actual signatures; the remaining ten API entries and five tests have precise commented contracts for the linked conductor, residual, isogeny/twist and modular-curve carriers. The two Serre witness tests are stated for a supplied trivial-character level-11 newform; they do not construct its residual comparison. The level-11 eta-product identity uses Mathlib's existing Dedekind eta. In particular, no assertion of missing newforms excuses a missing signature. Comments are not claimed to elaborate, and the remaining export work is a packet gap.

The modular parametrisation contracts specify the chosen isogeny, cusp value, nonconstancy and differential pullback under their packet names. Its degree tests fix that choice. All claims still have unchecked implementation status.

## Changes to the reviewed decomposition

The six reviewed nodes are carried or reassigned as follows.
- **Kept, with refined content:**
  - `residual-irreducibility-and-the-conductor-of-E-p`;
  - `weight-two-and-level-N-from-the-weight-recipe`;
  - `a-single-newform-for-infinitely-many-p-and-exact-coefficients`;
  - `what-theoreme-4-asserts-and-its-scope`.
- **Replaced by a request:** `absolute-irreducibility-from-oddness-at-odd-p` becomes a request to R01.4, which RS-06
  makes the owner.
- **Split:** `isogeny-from-faltings-and-exact-conductor` becomes R29.4 `exact-conductor` and R29.5 `isogeny-to-E`, as
  RS-06 places the isogeny in R29.5.

The decomposition's gaps are resolved by the new nodes, except Mazur's theorem, which is no longer needed:
- bad coefficients, by conjugation;
- the parametrisation, via R14.5–R14.6 and Cremona §2.15.1;
- the conductor criterion, via the Tate curve;
- the p = 2 weight boundary, since Σ_E excludes p ≤ 5.

## Sources

- **Serre,** Duke Math. J. 54 (1987), Collège de France PDF. Read §§2.8, 3.3, 4.6–4.7.
- **Faltings,** Invent. Math. 73 (1983). Read Korollar 2.
- **Carayol,** Ann. Sci. ÉNS 19 (1986), Numdam. Read Corollaire 0.8.
- **Deligne–Serre,** Ann. Sci. ÉNS 7 (1974), Numdam. Read Lemme 6.11.
- **Cremona,** *Algorithms for modular elliptic curves*, 2nd ed., author's online text. Read Chapter II, §§2.6, 2.15.1.

The oldclass multiplicities are in Cremona §2.7, pp. 26–27. The scalar Tate comparison and absolute irreducibility are in Darmon–Diamond–Taylor, *Fermat’s Last Theorem*, revision 9 September 2007, Lemma 1.48 and Theorem 3.1(a),(c), imported through the indicated AutomorphicGaloisRepresentations nodes.
