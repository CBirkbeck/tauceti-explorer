# Modularity and modular parametrisations of elliptic curves over ℚ — blueprint

This blueprint covers stages R29.1–R29.6. After the first checkpoint, **all six are source-decomposed** for the content
the accepted restructuring RS-06 keeps in this roadmap: the application to an arbitrary E/ℚ.

The general theory is imported from its owners:
- **FaltingsFinitenessAndIsogenyTheorems R28.4/R28.6:** End, Hom, isogeny finiteness and the isogeny criterion.
- **ArithmeticGaloisRepresentations R01.4–R01.6:** oddness, Frobenius recognition, Tate modules and conductors.
- **ClassicalSerreModularity R27.6:** Serre's conjecture.
- **AlgebraicModularFormsAndSerreWeights R15.4–R15.5:** the weight recipe and Deligne–Serre lifting.
- **AutomorphicGaloisRepresentations R19.4, R19.6:** local–global compatibility and the Tate module of A_f.
- **ModularCurvesPartII R14.5–R14.6:** A_f, the cusp and Abel–Jacobi.
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
- p ≤ 5;
- p ∣ N;
- p ∣ v_ℓ(j_E) for some ℓ ∥ N;
- degrees of ℚ-rational cyclic p-isogenies.

It is finite by R28.6.

*API.*
- `exceptionalPrimes_finite`.
- `irreducible_of_not_mem`.
- `goodReduction_of_not_mem`.

*Unit tests.*
- 11a1, with 5, 11 ∈ Σ.
- 2, 3, 5 ∈ Σ always.
- y² = x³ − x (CM, N = 32): Σ is finite.

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
- **`newform-of-E`** (definition; planet "The newform F_E"). F_E initially has a level M_E dividing N;
  uniqueness across these levels is imported from **Tau Ceti ModularForms Layer 5**, not re-proved here.
  The supplier compares two normalized newforms agreeing at almost all primes outside N, and concludes
  equality of levels and forms. R29.4 separately proves M_E = N.
  - *Unit tests.*
    - 11a1.
    - Isogeny invariance.
    - Quadratic twists.
    - At level 22, the level-11 form f gives oldforms f(z), f(2z), and there is no new part.
      An arbitrary old eigenform at ambient level 22 must not be treated as a newform of level 22.
- **`rational-coefficient-field`:** all coefficients of F_E are in ℤ, by conjugation and the imported
  Layer 5 prime-agreement theorem. The fixed-level library theorem has a stronger all-good-indices
  hypothesis and alone does not justify this use.

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

- **`modularity-theorem`** (planet "Modularity of elliptic curves over ℚ"): the three equivalent formulations.
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

## Confirmed ownership fix (issue #5045, 2 October 2026)

Removed the application-roadmap node `R29.3/strong-multiplicity-one-across-levels`.
Its owner is the existing Tau Ceti stage
`tauceti:TauCetiRoadmap/ModularForms#layer-5-strong-multiplicity-one-and-the-eigenform-characterization`.
The three consumers `newform-of-E`, `rational-coefficient-field` and `modularity-theorem`
now name that supplier as a prerequisite, and a request states the precise weight-two,
trivial-character specialization. The finite set of primes dividing the nonzero conductor N
bridges agreement outside N to the supplier's agreement at almost all primes outside MM′.

The Layer 4 request keeps finiteness, bad-prime factors and the oldform input needed by
the preserved level-11/22 acceptance example. It no longer asks Layer 4 for the eigenspace
argument that was used to reconstruct the Layer 5 theorem. The suggested file records
`eq_of_eigenvalue_eq_across_levels` as an imported contract with explicit nonzero levels,
trivial characters and good-prime agreement; it is a comment, not an elaborated local theorem.

There are now 20 local nodes and 17 supplier requests. The packet remains partial because
those imports are open; the historical accepted review does not certify this revision.
The [fixes report](../redteam/RT-BP-EllipticCurveModularity.fixes.md) records the scope and checks.
Only the finding explicitly listed in issue #5045 is addressed here; findings /2–/5 in the
broader verification remain separate follow-up work. No Lean compilation was run: this
change touches only a comment in the suggested file, and no existing build at the pins
was available in the audited baseline checkout.
