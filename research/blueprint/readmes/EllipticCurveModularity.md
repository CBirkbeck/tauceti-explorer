# Modularity and modular parametrisations of elliptic curves over ℚ — blueprint

Every elliptic curve E over ℚ is modular. This roadmap proves that statement for an arbitrary E/ℚ of conductor N and
exports it in the forms its consumers use:

- **the newform F_E:** a normalised newform of weight 2, level N and trivial character, with rational integer Fourier
  coefficients and A_p(F_E) = a_p(E) at every prime p;
- **the modular quotient:** a ℚ-isogeny from the quotient A_{F_E} of J₀(N) to E;
- **the modular parametrisation:** a nonconstant morphism φ_E : X₀(N) → E over ℚ with φ_E(∞) = O;
- **the L-function:** L(E, s) = L(F_E, s), with its analytic continuation and functional equation.

The argument is Serre's deduction of the Taniyama–Weil conjecture from the case of weight 2 and trivial character of
his modularity conjecture (*Sur les représentations modulaires de degré 2 de Gal(ℚ̄/ℚ)*, §4.6, Théorème 4). Serre's
theorem was conditional in 1987. Here it is unconditional, because the classical Serre theorem is an input
(ClassicalSerreModularity R27.6).

The blueprint covers the six layers R29.1–R29.6 with 23 declarations. It is the content that the accepted restructuring
RS-06 keeps in this roadmap: the application to a given E. The general theory is imported.

## Scope and boundaries

This roadmap plans the following and nothing else.

- The explicit finite set Σ_E of exceptional primes of E, and Serre's Lemme 5 outside it.
- The Serre witnesses g_p for p ∉ Σ_E, the passage from infinitely many congruences to one newform, and the equality
  A_ℓ = a_ℓ(E).
- The notion of a newform **attached to E**, the unique such newform F_E, and what follows for every attached
  newform: rational coefficients, the comparison of Galois representations, the exact level, every Euler factor, the
  isogeny from its modular quotient.
- The parametrisation φ_E, and the final theorem with the equivalence of its formulations.

Everything else is imported, from the layer that owns it.

| Owner | What is imported |
| --- | --- |
| FaltingsFinitenessAndIsogenyTheorems R28.6 | End_ℚ(E) = ℤ; finiteness of the isogeny class; rank-one Hom; semisimplicity of V_r(E); the Tate–Hom comparison; the isogeny criterion |
| ArithmeticGaloisRepresentations R01.4–R01.6 | odd and irreducible implies absolutely irreducible (odd p); recognition by Frobenius polynomials; the Tate module of E, its determinant, Frobenius polynomials and conductor; the residual conductor |
| FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.6 | E[p] is finite flat at a prime of good reduction |
| AlgebraicModularFormsAndSerreWeights R15.4–R15.5 | Serre's weight recipe, Proposition 4; Deligne–Serre eigenvalue lifting |
| ClassicalSerreModularity R27.6 | the classical Serre theorem, in its finite-flat weight-two form |
| AutomorphicGaloisRepresentations R19.1, R19.4, R19.6 | the λ-adic representations of a newform; local–global compatibility with conductors and bad factors; the Tate module of A_f |
| ModularCurvesPartII R14.5–R14.6 | the modular quotients of J₁(N) and J₀(N), their dimension and differentials, Tate modules of quotients, the decomposition of J₀(N′); the cusp ∞ and the Abel–Jacobi morphism |
| Tau Ceti ModularForms Layers 4, 5, 7, 8g | newforms and old/new classes; strong multiplicity one across levels; the L-function of a newform; Galois conjugates |
| Tau Ceti EllipticCurves Layer 4 | reduction types, Tate's algorithm, the Tate curve |
| Tau Ceti JacobianChallenge Layer F | the Abel–Jacobi morphism and its universal property |

Two boundaries deserve a sentence each.

- **Strong multiplicity one is not proved here.** Two newforms of different levels that agree at almost all primes are
  equal: this is a named target of Tau Ceti ModularForms Layer 5 (Miyake 4.6.19). The pinned library has the
  fixed-level theorem only. This roadmap requests the cross-level statement and uses it.
- **SerreWeightAndLevelOptimisation R20.6 is not a prerequisite.** Its export for elliptic curves assumes that E is
  modular.

Consumers: HeegnerPointEulerSystems HE.1–HE.2, GrossZagierAndArithmeticHeights GZ.8–GZ.9, EllipticRegulators ER.6–ER.7,
RankZeroOneBSD BSD.0–BSD.5 and EllipticModularityEffectiveComparisons EC.1, EC.3.

## Conventions

- **Standing data.** E is a Weierstrass curve over ℚ with Mathlib's `IsElliptic`. N is its conductor and j_E its
  j-invariant.
- **Reduction.** Good, multiplicative and additive reduction at p are Mathlib's notions for the minimal model over ℤ_p.
  For the conductor, p ∣ N means bad reduction at p, and v_p(N) = 1 means multiplicative reduction at p.
- **The coefficients of E.** a_n(E) is the n-th coefficient of Mathlib's `WeierstrassCurve.LFunction`. So
  a_ℓ(E) = ℓ + 1 − #Ẽ(F_ℓ) at a prime ℓ of good reduction, and a_ℓ(E) = 1, −1, 0 at a prime of split multiplicative,
  nonsplit multiplicative and additive reduction, as in `WeierstrassCurve.localPolynomial`.
- **Galois representations.** G_ℚ = Gal(ℚ̄/ℚ). ρ̄_{E,p} is the action on E[p], with determinant the mod-p cyclotomic
  character χ̄_p. V_r(E) is the rational r-adic Tate module. Frobenius elements are arithmetic.
- **Euler factors.** With these conventions the Euler factor at ℓ ≠ r is the characteristic polynomial of Frob_ℓ on
  the inertia coinvariants of V_r, equivalently of the geometric Frobenius on the inertia invariants of the dual. On
  the invariants of V_r itself Frob_ℓ acts by ℓ at a split multiplicative prime.
- **Newforms** are Tau Ceti's `HeckeRing.GL2.Newform`: normalised by a₁ = 1, new at their level, with a character.
  A_n(F) is the n-th Fourier coefficient at ∞.
- **Attached.** A newform F of weight 2, of any level, is attached to E when its character is trivial and
  A_ℓ(F) = a_ℓ(E) for all but finitely many primes ℓ.
- **The modular quotient** A_f of a newform f of level M and trivial character is the quotient of J₀(M). The
  supplier, ModularCurvesPartII R14.5, writes it A_f⁰ (node `trivial-character-J0`) and keeps the name A_f for the
  quotient of J₁(M) (node `modular-quotient`). The two are isogenous over ℚ, compatibly with K_f, and can differ:
  for M = 11 they are 11a1 and 11a3. Statements the suppliers make for the quotient of J₁ are carried over by this
  isogeny.
- **Divisors.** σ₀(n) is the number of positive divisors of n.

Library module: `TauCeti/NumberTheory/EllipticCurve/Modularity`, namespace `TauCeti.EllipticCurve.Modularity`.

## Layer overview

| Layer | Content | Declarations |
| --- | --- | --- |
| R29.1 | exceptional primes; the conductor of E[p]; Lemme 5 | 4 |
| R29.2 | weight two and trivial character; the Serre witnesses | 3 |
| R29.3 | pigeonhole; the norm argument; newforms attached to E; existence at level N; F_E; rational coefficients | 6 |
| R29.4 | for every attached newform: comparison of Galois representations; exact conductor; bad Euler factors | 3 |
| R29.5 | the isogeny from the modular quotient of an attached newform; the modular parametrisation | 2 |
| R29.6 | absolute irreducibility of V_r(E); the converse; the modularity theorem; L(E, s); scope | 5 |

## R29.1 — the exceptional primes and the conductor of E[p]

**Definition: the exceptional primes** (node `exceptional-primes`; planet "Exceptional primes of E"). Σ_E is the set
of primes p such that one of the following holds:

- p ≤ 5;
- p ∣ N, that is, E has bad reduction at p;
- p ∣ v_ℓ(j_E) for some prime ℓ with v_ℓ(N) = 1, that is, of multiplicative reduction;
- E has a ℚ-rational cyclic subgroup of order p: a subgroup of E(ℚ̄) of order p stable under G_ℚ, equivalently the
  kernel of a ℚ-rational isogeny of degree p.

Σ_E is finite. The first two sets are finite. The third is finite because each of the finitely many ℓ ∥ N has
v_ℓ(j_E) a fixed negative integer. The fourth is finite by R28.6: the isogeny class of E is finite up to
ℚ-isomorphism, and for each curve E′ in it Hom_ℚ(E, E′) is infinite cyclic, so the degrees of isogenies E → E′ are
d·n² and only finitely many primes occur. Mazur's theorem is not used, and curves with complex multiplication are
not excluded.

*API.*

- `exceptionalPrimes`: Σ_E as a set of primes, defined through Mathlib's reduction types.
- `HasRationalCyclicSubgroup`: the fourth clause.
- `exceptionalPrimes_finite`: Σ_E is finite.
- `irreducible_of_not_mem`: for a prime p ∉ Σ_E, E[p] is an irreducible F_p[G_ℚ]-module.
- `goodReduction_of_not_mem`: for a prime p ∉ Σ_E, E has good reduction at p; equivalently p ∤ N.

*Unit tests.* Four of them separate the clauses at the prime 7.

- `exceptionalPrimes_11a1`: for 11a1 (y² + y = x³ − x² − 10x − 20), 5 ∈ Σ_E and 11 ∈ Σ_E.
- `exceptionalPrimes_contains_small`: 2, 3, 5 ∈ Σ_E for every E.
- `exceptionalPrimes_CM`: for y² = x³ − x (32a2, CM by ℤ[i]), Σ_E is finite and 2 ∈ Σ_E.
- `exceptionalPrimes_11a1_seven`: 7 ∉ Σ_E for 11a1. Here Δ = −11⁵ and v₁₁(j) = −5; and a₃ = −1 gives Frobenius
  discriminant 3 modulo 7, a nonsquare, so there is no rational cyclic subgroup of order 7.
- `exceptionalPrimes_26b1`: 7 ∈ Σ_E for 26b1 (y² + xy + y = x³ − x² − 3x + 3). Both extra clauses hold: (1, 0) has
  order 7, and v₂(j) = −7 at the multiplicative prime 2.
- `exceptionalPrimes_valuation_only`: 7 ∈ Σ_E for 274a1 (y² + xy = x³ − 7x + 9) through the valuation clause alone:
  v₂(j) = −7, good reduction at 7, no rational cyclic subgroup of order 7.
- `exceptionalPrimes_isogeny_only`: 7 ∈ Σ_E for 162b1 (y² + xy + y = x³ − x² − 5x + 5) through the isogeny clause
  alone: the roots of x³ − 3x² + 3 are the x-coordinates of a rational cyclic subgroup of order 7, E is good at 7, and
  v₂(j) = −3 at the only multiplicative prime.

A definition that drops the isogeny clause fails the 162b1 test; one that drops the valuation clause fails the 274a1
test; one that adds primes fails the 11a1 test at 7.

**Lemma** (`residual-conductor-divides`). For every prime p, the prime-to-p Artin conductor N(ρ̄_{E,p}) divides N.
*Proof.* Fix ℓ ≠ p and compare E[p] with T_p(E). The invariants of inertia in E[p] contain the reduction of those in
T_p(E), which bounds the tame part. Wild inertia acts on T_p(E) through a finite ℓ-group, of order prime to p, so
the Swan conductors agree. The conductor exponent of V_r(E) at ℓ does not depend on r ≠ ℓ (R01.6). Serre notes that
this divisibility alone suffices for his theorem.

**Theorem** (`residual-conductor-equality`). For p ≥ 5, N(ρ̄_{E,p}) = N if and only if (a) p ∤ N and (b) p ∤ v_ℓ(j_E)
for every ℓ with v_ℓ(N) = 1. In particular N(ρ̄_{E,p}) = N for every p ∉ Σ_E.
*Proof.* (a) is necessary because the residual conductor is prime to p. At a multiplicative ℓ, E is the Tate curve up
to an unramified quadratic twist, with v_ℓ(q) = −v_ℓ(j_E), and E[p] is unramified at ℓ exactly when p ∣ v_ℓ(q)
(Tau Ceti EllipticCurves Layer 4). At an additive ℓ the inertia image is finite of order dividing 24, or a nontrivial
quadratic character times a unipotent; for p ≥ 5 the invariants of E[p] vanish as those of V_r(E) do. Serre states
the criterion for p > 5 with "on vérifie"; the argument covers p = 5 as well.
*Acceptance.* A semistable E with ℓ ∥ N, p ∣ v_ℓ(j_E) and p ∤ v_{ℓ′}(j_E) at the other bad primes has
N(ρ̄_{E,p}) = N/ℓ.

**Lemma** (`residual-irreducibility-and-the-conductor-of-E-p`; Serre's Lemme 5). det ρ̄_{E,p} = χ̄_p for every p. For
every p ∉ Σ_E, ρ̄_{E,p} is absolutely irreducible and its conductor is N.
*Proof.* The determinant is the Weil pairing (R01.6). A Galois-stable line in E[p] is a rational cyclic subgroup of
order p, which Σ_E excludes. For odd p an odd representation that is irreducible over F_p is absolutely irreducible
(R01.4). The conductor is the previous theorem. No large-image hypothesis is used.

*Dependencies.* R28.6 (nodes `finiteness-of-the-isogeny-class-of-an-elliptic-curve`,
`hom-to-an-isogenous-elliptic-curve-is-infinite-cyclic`, and the stage for End_ℚ(E) = ℤ); R01.4; R01.6; Tau Ceti
EllipticCurves Layer 4; Mathlib's `WeierstrassCurve.j`.

## R29.2 — the Serre witnesses

**Lemma** (`finite-flat-weight-two`). For p ∉ Σ_E, E[p] is the generic fibre of a finite flat group scheme over ℤ_p,
the p-torsion of the Néron model (R07.6). So ρ̄_{E,p} is finite at p, and with det ρ̄_{E,p} = χ̄_p Serre's recipe gives
weight k(ρ̄_{E,p}) = 2 (Proposition 4, R15.4) and character ε = 1 (Serre §1.3). The character is trivial directly
from the determinant, not from a nebentypus in characteristic zero.

**Construction: the Serre witnesses** (node `weight-two-and-level-N-from-the-weight-recipe`; planet
"Serre witnesses at level N"). For each prime p ∉ Σ_E there are a normalised newform g_p of weight 2, level N and
trivial character, and a prime λ_p ∣ p of the ring of algebraic integers, such that ρ̄_{g_p, λ_p} ≅ ρ̄_{E,p}.
Consequently A_ℓ(g_p) ≡ a_ℓ(E) mod λ_p for every prime ℓ ∤ Np.
*Construction.* ρ̄_{E,p} is odd, absolutely irreducible, finite at p, of determinant χ̄_p and conductor N (Lemme 5 and
the previous lemma), and p ≥ 7. The finite-flat weight-two export of the classical Serre theorem
(`ClassicalSerreModularity:R27.6/finite-flat-weight-two-export`) gives (g_p, λ_p). The level is N exactly, not a
divisor, because the conductor of ρ̄_{E,p} is N.

*API.*

- `SerreWitness`: a newform g of weight 2 and level N with a maximal ideal λ of the algebraic integers containing p.
- `serreWitness`: (g_p, λ_p) for a prime p ∉ Σ_E.
- `serreWitness_level`: weight 2, level N, trivial character.
- `serreWitness_trace`: A_ℓ(g_p) − a_ℓ(E) ∈ λ_p for every prime ℓ ∤ Np.
- `serreWitness_residual`: ρ̄_{g_p, λ_p} ≅ ρ̄_{E,p} ⊗ k_λ over the residue field of λ_p.

*Unit tests.*

- `serreWitness_11a1`: for 11a1 and p = 7 the witness is η(z)²η(11z)², the unique newform of level 11.
- `serreWitness_trace_2`: A₂(g₇) = −2 = a₂(E) for 11a1.
- `serreWitness_not_at_exceptional`: 5 ∈ Σ_{11a1} and E[5] is reducible, so no witness is requested at 5.

**Lemma** (`trivial-nebentypus-by-reduction`). Let ε be a Dirichlet character of modulus N with values in a number
field K, and λ ∣ p a prime of K. If ε ≡ 1 mod λ and p ∤ φ(N), then ε = 1. This is needed only by a route that first
produces a characteristic-zero newform of unknown nebentypus; the route above does not.
*Non-example.* N = 5, p = 2: the quadratic character of conductor 5 is nontrivial and ≡ 1 modulo every prime above 2.

*Dependencies.* R07.6 (node `abelian-scheme-torsion-finite-flat`); R15.4 (node `weight-two-iff-finite-flat-at-p`);
R27.6 (node `finite-flat-weight-two-export`); R01.6; Tau Ceti's `Newform`; Mathlib's `CuspForm`, `IsPrimitiveRoot`,
`Nat.totient`.

## R29.3 — one newform, exact coefficients

**Lemma** (`pigeonhole-infinite-fiber`). A map from an infinite set of primes to a finite set has an infinite fibre.
This is Mathlib's `Finite.exists_infinite_fiber`.

**Lemma** (`algebraic-integer-norm-vanishing`). Let K be a number field and α ∈ 𝒪_K. If for infinitely many rational
primes p some prime of 𝒪_K above p contains α, then α = 0: each such p divides the integer N_{K/ℚ}(α).

**Definition: a newform attached to E** (node `attached-newform`). A normalised newform F of weight 2, of any level
M ≥ 1, is **attached to E** when its character is trivial and A_ℓ(F) = a_ℓ(E) for all but finitely many primes ℓ.
Two newforms attached to E have the same level and are equal. The definition does not assert that an attached
newform exists.

- *Uniqueness.* Two newforms attached to E agree at all but finitely many primes. Tau Ceti ModularForms Layer 5's
  cross-level theorem, for newforms of any two levels, then gives equal levels and equal forms. The theorem compares
  newforms, not old eigenforms at an ambient level.
- *Independence.* The condition concerns almost all primes, so it does not depend on the Weierstrass model and is
  unchanged under ℚ-isogeny.
- *Existence* is not part of the definition. For every E it is the next theorem, which uses the classical Serre
  theorem; from a quotient of J₀(N′) it is the converse in R29.6, which does not.

*API.*

- `IsNewformOf`: F is attached to E.
- `IsNewformOf.unique`: two newforms attached to E have the same level and the same Fourier coefficients.
- `IsNewformOf.congr`: if a_ℓ(E) = a_ℓ(E′) for almost all ℓ, a newform is attached to E exactly when it is attached
  to E′.

*Unit tests.*

- `isNewformOf_11a1`: η(z)²η(11z)², of level 11, is attached to 11a1 and to the isogenous curve 11a3.
- `not_isNewformOf_37a1`: no newform of level 11 is attached to 37a1; already a₃(37a1) = −3 and A₃ = −1.
- `not_isNewformOf_of_char_ne_one`: a newform with nontrivial character is attached to no curve.

**Theorem** (`a-single-newform-for-infinitely-many-p-and-exact-coefficients`). There is a normalised newform F of
weight 2, trivial character and level N with A_ℓ(F) = a_ℓ(E) for every prime ℓ ∤ N. In particular a newform attached
to E exists.
*Proof.* The witnesses g_p are newforms of weight 2, trivial character and level exactly N, and the set of such
newforms is finite (Tau Ceti ModularForms Layer 4). By the pigeonhole lemma one of them, F, equals g_p for p in an
infinite set P. For ℓ ∤ N and p ∈ P ∖ {ℓ}, A_ℓ(F) − a_ℓ(E) lies in λ_p. By the norm lemma it is zero. Only the good
coefficients are compared here.
*Remark.* Serre starts from an eigenform modulo p of level N and lifts its eigenvalues by Deligne–Serre (R15.5);
that route gives a form of level dividing N, and Serre gets level N from Carayol's theorem (his Remarque 2). Here
the classical Serre theorem supplies each witness as a newform of level N, so F has level N at once. That every
newform attached to E has level N is `exact-conductor` in R29.4, proved without the classical Serre theorem.

**Definition: the newform F_E** (node `newform-of-E`; planet "The newform F_E"). F_E is the newform attached to E.
It exists and has level N, by the previous theorem; it is unique, by `attached-newform`; its Fourier coefficients are
rational integers, by `rational-coefficient-field`. Existence is the only place where F_E depends on the classical
Serre theorem: everything R29.3–R29.5 prove about F_E uses only that it is attached to E, and is stated for every
newform attached to E.

*API.*

- `newformOf`: F_E, a newform of weight 2 and level N.
- `isNewformOf_newformOf`: F_E is attached to E.
- `newformOf_coeff_prime`: A_ℓ(F_E) = a_ℓ(E) for every prime ℓ ∤ N.
- `newformOf_unique`: a newform attached to E, of any level M, has M = N and the Fourier coefficients of F_E.
- `newformOf_coeff_int`: every Fourier coefficient of F_E is a rational integer.

*Unit tests.*

- `newformOf_11a1`: for 11a1, N = 11 and F_E = η(z)²η(11z)².
- `newformOf_isogeny_invariant`: 11a1, 11a2 and 11a3 have the same F_E.
- `newformOf_twist`: for the twist E′: y² = x³ + 4x² − 160x + 1264 of 11a1 by −1,
  A_ℓ(F_{E′}) = χ₋₄(ℓ)·A_ℓ(F_E) at every prime ℓ ∤ 2·11.

*Acceptance.* At level 22 the level-11 newform f gives the oldforms f(z) and f(2z), which span S₂(Γ₀(22)); there is
no new part. F_E is a newform of level N, never an old eigenform at an ambient level.

**Theorem** (`rational-coefficient-field`). Let F be a newform attached to E, of level M. Its coefficient field is ℚ,
and all its Fourier coefficients, those at primes dividing M included, are rational integers.
*Proof.* For σ ∈ Gal(ℚ̄/ℚ) the conjugate F^σ is a newform of level M and trivial character (Tau Ceti ModularForms
Layer 8g) with A_ℓ(F^σ) = σ(a_ℓ(E)) = a_ℓ(E) for almost all ℓ. So F^σ is attached to E, and F^σ = F by Layer 5.
Every coefficient is fixed by every σ, hence rational, and it is an algebraic integer. Serre records only that the
good coefficients are integers; the bad ones follow by this argument.

*Dependencies.* R29.2; R15.5 (node `deligne-serre-eigenvalue-lifting-lemma`); Tau Ceti ModularForms Layers 4, 5, 8g;
Tau Ceti's `Newform`; Mathlib's `WeierstrassCurve.LFunction`, `Finite.exists_infinite_fiber`, `Algebra.norm`,
`Algebra.norm_eq_zero_iff`. The nodes `attached-newform` and `rational-coefficient-field` do not depend on R29.2.

## R29.4 — Galois comparison, exact conductor, bad Euler factors

Throughout, F is a newform attached to E, of level M. The three statements hold in particular for F_E. None of
them uses the Serre witnesses.

**Theorem** (`tate-module-comparison`). For every prime r, V_r(E) ≅ V_r(F) as ℚ_r[G_ℚ]-modules, where V_r(F) is the
r-adic representation of F.
*Proof.* For all but finitely many ℓ both are unramified at ℓ with Frobenius polynomial X² − a_ℓ(E)X + ℓ (R01.6 for
E; R19.1, node `newform-rank-two-realisation`, for F). Chebotarev and Brauer–Nesbitt (R01.5), which need these
polynomials only on a set of primes of density one, identify the semisimplifications. V_r(E) is semisimple
(Faltings, R28.6). V_r(F) is semisimple too: F has rational coefficients, so its modular quotient has dimension 1
(R14.5, node `modular-quotient-dimension`) and Tate module V_r(F) (R19.6, node
`weight-two-tate-module-decomposition`), semisimple by Faltings (R28.4). Ribet's irreducibility of V_r(F) is not
needed.

**Theorem** (`exact-conductor`; planet "Exact conductor"). The level M of F is the conductor N of E. In particular
the level of F_E is N.
*Proof.* The prime-to-r part of M is the Artin conductor of V_r(F) away from r (Carayol, through R19.4, node
`conductor-and-local-factors-classical`). The prime-to-r part of N is the conductor of V_r(E) away from r (R01.6).
The representations are isomorphic for every r, and two primes r give M = N. Equality of unramified traces alone
would not give this; the comparison at the bad primes, monodromy included, is used.

**Theorem** (`bad-euler-factors`). For every prime ℓ the local factor of E, Mathlib's `localPolynomial`, equals the
Euler factor 1 − A_ℓ(F)T + 𝟙_{ℓ∤N}ℓT² of F. So A_ℓ(F) = a_ℓ(E) at every ℓ ∤ N, and A_ℓ(F) = +1, −1, 0 at a prime of
split multiplicative, nonsplit multiplicative, additive reduction. Hence A_n(F) = a_n(E) for every n ≥ 1.
*Proof.* At ℓ ∤ N both representations are unramified and isomorphic, so the traces agree at every good prime, not
only at almost all. At ℓ ∣ N the local factor of E is det(1 − Frob_ℓ T) on the inertia coinvariants of V_r(E): by the
Tate curve it is 1 ∓ T at a multiplicative prime, and it is 1 at an additive prime, where the coinvariants vanish
(Tau Ceti EllipticCurves Layer 4). The same determinant for V_r(F) is 1 − A_ℓ(F)T (R19.4, the same node). The
isomorphism identifies them. The sign convention is Mathlib's: split multiplicative gives 1 − T.

*Dependencies.* `attached-newform`, `rational-coefficient-field`; R01.5; R01.6; R28.6 (node
`semisimplicity-of-the-rational-tate-module-of-an-elliptic-curve`); R28.4 (node
`semisimplicity-and-the-tate-homomorphism-comparison`); R19.1, R19.4, R19.6 and R14.5 by the nodes named above; Tau
Ceti ModularForms Layer 4; Tau Ceti EllipticCurves Layer 4; Mathlib's `WeierstrassCurve.localPolynomial`.

## R29.5 — the modular quotient and the modular parametrisation

**Theorem** (`isogeny-to-E`). Let F be a newform attached to E. The quotient A_F of J₀(N) attached to F is an
elliptic curve over ℚ, and there is a ℚ-isogeny A_F → E. In particular there is a ℚ-isogeny A_{F_E} → E.
*Proof.* F has rational coefficients and level N, so A_F is a quotient of J₀(N) itself. The quotient of J₁(N)
attached to F has dimension [K_F : ℚ] = 1 (R14.5, node `modular-quotient-dimension`) and Tate module V_r(F) (R19.6,
node `weight-two-tate-module-decomposition`); A_F is isogenous to it (R14.5, node `trivial-character-J0`). So A_F is
an elliptic curve with V_r(A_F) ≅ V_r(F) ≅ V_r(E), the last by `tate-module-comparison`. Faltings' isogeny criterion
over ℚ gives the isogeny (R28.6, node `isogeny-criterion-for-elliptic-curves`). The Serre witnesses are not used.

**Construction: the modular parametrisation** (node `modular-parametrisation`; planet "Modular parametrisation"). Fix
a ℚ-isogeny λ : A_{F_E} → E. Then φ_E : X₀(N) → E is the composite of

- the Abel–Jacobi morphism X₀(N) → J₀(N) normalised at the rational cusp ∞ (R14.6, node
  `rational-cusp-abel-jacobi`, which instantiates Tau Ceti JacobianChallenge Layer F),
- the quotient J₀(N) → A_{F_E} (R14.5, node `trivial-character-J0`),
- the isogeny λ.

It is a nonconstant morphism of curves over ℚ with φ_E(∞) = O, and φ_E^*ω_E = c·2πi F_E(z)dz for a constant
c ∈ ℚ^×, where ω_E = dx/(2y + a₁x + a₃). It depends on λ. For the optimal curve (E = A_{F_E}, λ = id) and a Néron
differential, c is Manin's constant.
*Proof.* The image of X₀(N) generates J₀(N), and J₀(N) → A_{F_E} → E is surjective, so φ_E is nonconstant (R14.5,
node `abel-jacobi-composite-nonzero`). ∞ maps to 0 in J₀(N), hence to O. The pullback of ω_E lies in the
F_E-eigenspace of the holomorphic differentials (R14.5, node `modular-quotient-differentials`). Over ℂ, φ_E is
z ↦ 2πi∫_{i∞}^z F_E(w)dw modulo the period lattice, followed by the isogeny (Cremona §2.15.1).

*API.*

- `QuotientIsogeny`: a ℚ-isogeny λ : A_F → E for a newform F attached to E, as a surjective morphism of ℚ-curves
  sending origin to origin.
- `modularParametrisation`: φ_E for a chosen λ : A_{F_E} → E.
- `modularParametrisation_cusp`: φ_E(∞) = O.
- `modularParametrisation_nonconstant`: φ_E is surjective, of positive degree.
- `modularParametrisation_pullback`: φ_E^*ω_E = c·2πi F_E(z)dz with c ∈ ℚ^×.

*Unit tests.*

- `modularParametrisation_11a1`: for 11a1 = X₀(11) and a suitable λ, φ_E is an isomorphism.
- `modularParametrisation_11a3`: for 11a3 the least degree of φ_E over all λ is 5, attained by a 5-isogeny
  11a1 → 11a3.
- `modularParametrisation_37a`: for 37a1 (y² + y = x³ − x), A_{F_E} ≅ E and deg φ_E = 2 for λ an isomorphism.

*Acceptance.* The parametrisation is a morphism over ℚ, not a divisor class. The 11a1 test separates the quotient of
J₀(11), which is 11a1, from the quotient of J₁(11), which is 11a3: with the latter no parametrisation of 11a1 is an
isomorphism.

*Dependencies.* R29.3; R29.4; R14.5, R14.6, R19.6 and R28.6 by the nodes named above; Tau Ceti JacobianChallenge
Layer F.

## R29.6 — the final theorem

**Lemma** (`absolute-irreducibility-of-the-rational-tate-module`). For every prime r, V_r(E) is an absolutely
irreducible representation of G_ℚ: the ℚ_r-span of the image of G_ℚ in End(V_r(E)) is all of End(V_r(E)), and
V_r(E) ⊗ L is irreducible for every field L ⊇ ℚ_r. Curves with complex multiplication over ℚ̄ are included.
*Proof.* The commutant of G_ℚ in End(V_r(E)) is End_ℚ(E) ⊗ ℚ_r by the Tate–Hom comparison (R28.6), and
End_ℚ(E) = ℤ (R28.6), so it is ℚ_r. V_r(E) is semisimple (R28.6), and a semisimple module whose endomorphism ring
is a field is simple. The span A of the image of G_ℚ is then an algebra with a faithful simple module, so
A ≅ M_n(D) with commutant D^op (Wedderburn); the commutant ℚ_r forces A = End(V_r(E)). After extension of scalars
the span is still everything.
*Acceptance.* For y² = x³ − x and r = 5 the restriction to G_{ℚ(i)} is a sum of two characters, and complex
conjugation exchanges the two lines. Semisimplicity alone does not give the statement.

**Theorem** (`newform-from-a-modular-quotient`; the converse). Let N′ ≥ 1 and let π : J₀(N′) → E be a surjective
homomorphism over ℚ. Then there are a divisor M of N′ and a normalised newform f of weight 2, level M and trivial
character that is attached to E. Consequently f has rational integer coefficients, its level is N, N divides N′, and
A_p(f) = a_p(E) at every prime p. The construction does not use the classical Serre theorem.

*Proof.* Fix a prime r. A_f is the quotient of J₀(M), and A_f¹ the quotient of J₁(M), of a newform f of level M.

1. V_r(π) : V_r(J₀(N′)) → V_r(E) is surjective (R14.5, node `quotient-tate-exact`).
2. J₀(N′) is ℚ-isogenous to ∏_{M ∣ N′} ∏_{[f]} (A_f)^{σ₀(N′/M)}, the inner product over the Galois orbits of
   normalised newforms of weight 2, level M and trivial character. This is requested from R14.5, whose node
   `oldform-comparison` states the analogue for one orbit in J₁. So V_r(J₀(N′)) is the corresponding direct sum of
   copies of the V_r(A_f), and V_r(π) is nonzero on one summand: there is a nonzero G_ℚ-map u : V_r(A_f) → V_r(E)
   for some newform f of level M ∣ N′.
3. V_r(A_f) ≅ V_r(A_f¹) compatibly with K_f and G_ℚ (R14.5, node `trivial-character-J0`). V_r(A_f¹) is free of rank 2
   over K_f ⊗ ℚ_r and is the sum of the λ-adic representations of f (R19.6, node
   `weight-two-tate-module-decomposition`), with Frobenius polynomial X² − A_ℓ(f)X + ℓ at ℓ ∤ Mr (R19.1, node
   `newform-rank-two-realisation`).
4. Over ℚ̄_r, V_r(A_f) splits as ⊕_σ V_{f,σ} over the embeddings σ : K_f → ℚ̄_r. Each V_{f,σ} is two-dimensional, and
   unramified at ℓ ∤ Mr with Frobenius polynomial X² − σ(A_ℓ(f))X + ℓ.
5. The restriction of u ⊗ ℚ̄_r to some V_{f,σ} is nonzero. Its target V_r(E) ⊗ ℚ̄_r is irreducible of dimension 2 by
   the lemma, so the restriction is an isomorphism.
6. Traces of Frobenius give σ(A_ℓ(f)) = a_ℓ(E) for every prime ℓ ∤ NN′r.
7. Fix an embedding ι of the algebraic closure ℚ̄ ⊂ ℂ into ℚ̄_r. Then σ = ι ∘ τ for a unique embedding
   τ : K_f → ℚ̄, and τ(A_ℓ(f)) = a_ℓ(E) for ℓ ∤ NN′r.
8. The conjugate f^τ is a newform of weight 2, level M and trivial character (Tau Ceti ModularForms Layer 8g). It
   is attached to E.
9. `rational-coefficient-field`, `exact-conductor` and `bad-euler-factors`, applied to f^τ, give integer
   coefficients, M = N, hence N ∣ N′, and all Euler factors.

No step uses the Serre witnesses, the existence theorem of R29.3 or F_E: the nodes this proof rests on are
`attached-newform`, `rational-coefficient-field`, the three theorems of R29.4 and the lemma above.

*Acceptance.*

- Level: N′ = 22 and E = 11a1 with either degeneracy map J₀(22) → J₀(11). V_r(J₀(22)) is two copies of V_r(A_f) for
  the level-11 form f, and the theorem returns f, of level 11.
- Coefficient field: N′ = 23. J₀(23) is A_f for the orbit with K_f = ℚ(√5) and A₂(f) = (−1 ± √5)/2. No embedding
  makes the traces rational, and no elliptic curve over ℚ is a quotient of J₀(23).
- Irreducibility of V_{f,σ} (Ribet, part of R19.1's node) would serve in step 5 as well.

**Theorem** (`modularity-theorem`; planet "Modularity of elliptic curves over ℚ"). Every elliptic curve E/ℚ of
conductor N is modular, in three equivalent formulations.

- (i) There is a normalised newform F of weight 2, level N and trivial character, with rational integer
  coefficients and A_p(F) = a_p(E) for all primes p.
- (ii) There is a surjective homomorphism J₀(N) → E over ℚ. So E is ℚ-isogenous to a quotient of J₀(N), and is
  itself one, as Serre notes.
- (iii) There is a nonconstant morphism X₀(N) → E over ℚ sending ∞ to O.

All three hold unconditionally. Their equivalence does not use the classical Serre theorem: for an elliptic curve
E/ℚ, the existence of a newform attached to E, of a surjective homomorphism J₀(N′) → E over ℚ for some N′ ≥ 1, and
of a nonconstant morphism X₀(N′) → E over ℚ for some N′ ≥ 1 are equivalent. The newform then has level N, the level
N′ is a multiple of N, and N′ = N is possible.

*Proof.*

- The three statements hold. `a-single-newform-for-infinitely-many-p-and-exact-coefficients` gives the newform F_E
  attached to E, of level N. (i) is `rational-coefficient-field` and `bad-euler-factors` for F_E; (ii) is
  `isogeny-to-E` composed with the quotient J₀(N) → A_{F_E}; (iii) is `modular-parametrisation`.
- An attached newform gives a quotient and a parametrisation at level N, without the classical Serre theorem. Let F
  be attached to E. It has level N (`exact-conductor`), and `isogeny-to-E` gives a ℚ-isogeny A_F → E from the
  quotient A_F of J₀(N). Composing with the quotient map gives a surjective homomorphism J₀(N) → E; composing
  further with the Abel–Jacobi morphism at ∞ gives a nonconstant morphism X₀(N) → E sending ∞ to O (R14.6, node
  `rational-cusp-abel-jacobi`; R14.5, node `abel-jacobi-composite-nonzero`).
- A parametrisation gives a quotient. Translate φ : X₀(N′) → E by −φ(∞) ∈ E(ℚ). By the universal property of the
  Abel–Jacobi morphism at ∞ it factors through a homomorphism J₀(N′) → E, which is surjective because its image
  contains φ(X₀(N′)) = E.
- A quotient gives an attached newform: `newform-from-a-modular-quotient`.

*Acceptance.* No prerequisite of R29.1–R29.5 assumes E modular. N = 22: dim V_r(J₀(22)) = 4, and the level-11
newform occurs twice; a sum with one copy per newform has dimension 2 and is wrong. 11a1 is a quotient of J₀(22),
which shows only that 11 ∣ 22.

**Theorem** (`l-function-continuation`; planet "Analytic continuation of L(E, s)"). L(E, s), Mathlib's
`WeierstrassCurve.LSeries`, equals L(F_E, s). Hence Λ(E, s) = N^{s/2}(2π)^{−s}Γ(s)L(E, s), defined for Re s > 3/2,
extends to an entire function with Λ(E, s) = w_E Λ(E, 2 − s), where w_E = ±1 is the eigenvalue of −W_N on F_E.
*Proof.* The Euler products agree factor by factor (`bad-euler-factors`). Continuation and the functional equation
of L(F_E, s) are Hecke's theorem (Tau Ceti ModularForms Layer 7). No rank or Birch–Swinnerton-Dyer statement is
made.
*Acceptance.* 11a1 has w_E = +1 and L(E, 1) ≠ 0.

**Application** (`what-theoreme-4-asserts-and-its-scope`). Serre's Théorème 4 derives the Taniyama–Weil conjecture
for E/ℚ from the case ε = 1, k = 2 of his conjecture. The companion Théorème 5 concerns abelian varieties over ℚ
with real multiplication by a totally real field of degree equal to their dimension: they are quotients of J₀(N),
N the dim-th root of the conductor. It is recorded as a separately scoped inherited target. No general modularity
of GL₂-type varieties, rank formula or Birch–Swinnerton-Dyer statement is asserted.

*Dependencies.* R29.3–R29.5; R14.5 (nodes `quotient-tate-exact`, `trivial-character-J0`,
`abel-jacobi-composite-nonzero`, and the stage for the decomposition of J₀(N′)); R14.6 (node
`rational-cusp-abel-jacobi`); R19.1 (node `newform-rank-two-realisation`); R19.6 (node
`weight-two-tate-module-decomposition`); R28.6 (nodes `tate-hom-comparison-for-elliptic-curves`,
`semisimplicity-of-the-rational-tate-module-of-an-elliptic-curve`, and the stage for End_ℚ(E) = ℤ); R01.6; Tau Ceti
ModularForms Layers 7 and 8g; Tau Ceti JacobianChallenge Layer F; Mathlib's `WeierstrassCurve.LFunction` and
`WeierstrassCurve.LSeries`.

## Acceptance tests

- **Σ_E is explicit and finite without Mazur's theorem,** and its four clauses are separated by unit tests.
- **Non-circularity.** No prerequisite assumes E modular; the classical Serre theorem enters once, in the existence
  of F_E.
- **Exact coefficients.** A_ℓ = a_ℓ(E) comes from the norm argument over infinitely many primes, not from a
  congruence at one prime.
- **Levels.** F_E has level N because the Serre witnesses are newforms of level N. That every newform attached to E
  has level N is proved from local–global compatibility with monodromy, not from unramified traces. An old eigenform
  at an ambient level is never treated as a newform of that level.
- **Old forms in the Jacobian.** A newform of level M occurs σ₀(N′/M) times in J₀(N′); the level-22 example checks
  it.
- **Bad factors** match the sign conventions of Mathlib's `localPolynomial`, and are read on inertia coinvariants.
- **The parametrisation** is a morphism over ℚ, it is nonconstant, and it comes from the quotient of J₀(N).
- **The equivalence of the three formulations** is proved without the classical Serre theorem.

## Open inputs

The packet has eleven supplier requests: to R28.6, R01.4, R01.5, R01.6 and R14.5, to Tau Ceti ModularForms Layers
4, 5, 7 and 8g, to Tau Ceti EllipticCurves Layer 4 and to Tau Ceti JacobianChallenge Layer F. Where a supplier's
blueprint has a node with the exact statement, the node is cited and no request is made: this is the case for
R07.6, R15.4, R15.5, R27.6, R19.1, R19.4, R19.6 and R14.6. Three inputs have no node.

- **End_ℚ(E) = ℤ.** RS-06 makes R28.6 its owner. The R28.6 blueprint assumes it as a hypothesis and names R29.1 as
  its source, so each of the two blueprints points at the other; it has to be planned once, by its owner. It is
  recorded as a gap. The statement is short: in characteristic zero an endomorphism over ℚ acts on the invariant
  differentials over ℚ by a rational scalar, injectively, and it is integral over ℤ.
- **The decomposition of J₀(N′) over ℚ** into the quotients A_f with multiplicities σ₀(N′/M), requested from R14.5,
  together with declaration names for the quotient of J₀(N) and its quotient map.
- **Strong multiplicity one across levels,** requested from Tau Ceti ModularForms Layer 5.

Mazur's theorem on rational isogenies of prime degree (p > 163) is an unread refinement of the finiteness of Σ_E and
is not used.

## Changes to the reviewed decomposition

The six nodes of the reviewed decomposition are carried or reassigned as follows.

- **Kept, with refined content:** `residual-irreducibility-and-the-conductor-of-E-p`,
  `weight-two-and-level-N-from-the-weight-recipe`, `a-single-newform-for-infinitely-many-p-and-exact-coefficients`,
  `what-theoreme-4-asserts-and-its-scope`.
- **Replaced by a request:** `absolute-irreducibility-from-oddness-at-odd-p` is a request to R01.4, which RS-06
  makes the owner.
- **Split:** `isogeny-from-faltings-and-exact-conductor` is R29.4 `exact-conductor` and R29.5 `isogeny-to-E`, as
  RS-06 places the isogeny in R29.5.

The decomposition's gaps are resolved by the new nodes: the bad coefficients by conjugation, the parametrisation
through R14.5–R14.6 and Cremona §2.15.1, the conductor criterion through the Tate curve, and the weight boundary at
p = 2 because Σ_E excludes p ≤ 5.

## The suggested file

`research/blueprint/suggested/EllipticCurveModularity.lean` gives a typed signature for every definition, API item
and unit test above, under the same names, and states the named theorems. Σ_E, a_n(E), "attached to E" and φ_E are
real definitions against Mathlib and Tau Ceti's `Newform`. The objects that other roadmaps own and the pinned libraries
lack (the conductor, E[p] and V_r(E) with their Galois actions, Artin conductors and Serre weights, the Galois
representations of a newform, X₀(N), J₀(N), A_f and their maps) appear in a first section of imported interfaces,
as typed stand-ins that name their owners. The cross-level strong multiplicity one of Layer 5 is stated there as an
imported contract, `eq_of_eigenvalue_eq_across_levels`.

## Sources

- **Serre,** *Sur les représentations modulaires de degré 2 de Gal(ℚ̄/ℚ)*, Duke Math. J. 54 (1987), 179–230;
  Collège de France PDF. Read §§2.8, 3.3, 4.6–4.7.
- **Faltings,** *Endlichkeitssätze für abelsche Varietäten über Zahlkörpern*, Invent. Math. 73 (1983), 349–366.
  Read Satz 3, Satz 4, Korollar 1 and Korollar 2.
- **Carayol,** *Sur les représentations l-adiques associées aux formes modulaires de Hilbert*, Ann. Sci. ÉNS 19
  (1986), 409–468; Numdam. Read 0.7 and Corollaire 0.8.
- **Deligne–Serre,** *Formes modulaires de poids 1*, Ann. Sci. ÉNS 7 (1974), 507–530; Numdam. Read Lemme 6.11.
- **Cremona,** *Algorithms for modular elliptic curves*, 2nd ed., the author's online text. Read Chapter II, §§2.6,
  2.7, 2.15.1.
