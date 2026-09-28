# Drinfeld modules, t-modules and characteristic-p special values — part 1 (DM.0–DM.7)

Mathlib has the ring these objects live in, but none of the objects. Since 2025 it has **skew
polynomials**, `SkewPolynomial R := SkewMonoidAlgebra R (Multiplicative ℕ)`: its multiplication
`X a = φ(a) X` reads the twist `φ` off a `MulSemiringAction (Multiplicative ℕ) R`, and its
docstring names the q-power Frobenius and Papikian's *Drinfeld Modules* as the motivating case. It
also has the q-power Frobenius of any algebra over a finite field, `FiniteField.frobeniusAlgHom`. It
does **not** have the Frobenius action that turns `SkewPolynomial L` into `L{τ}`, a τ-degree, the
evaluation of twisted polynomials as `F_q`-linear maps, **additive polynomials**, **Drinfeld
modules**, the **Carlitz module**, their **rank**, or **morphisms and isogenies** between them.
Tau Ceti has the additive group scheme `G_a` over any base, with its p-Frobenius and α_p, but
nothing attached to a Drinfeld module (AUDIT-20). This roadmap builds the theory, following
Brownawell–Papanikolas, *A rapid introduction to Drinfeld modules, t-modules, and t-motives*
(arXiv:1806.03919v1) for definitions and conventions.

This document covers part 1 of the roadmap, layers DM.0–DM.7; DM.8 (Papanikolas's Tannakian
theory) is a separate part. **This checkpoint decomposes DM.0 to declarations.** For DM.1–DM.7 it
records the targets, the sources that have been read and those still missing, and the dependencies
on other roadmaps, so that a continuation can decompose them in turn.

## Design: the twist lives in the type

```lean
/-- `ofAdd n` acts by `x ↦ x ^ (q ^ n)`. A `def`, never an instance. -/
def frobeniusAction : MulSemiringAction (Multiplicative ℕ) L := …

/-- `L{τ}`: `SkewPolynomial L` with the Frobenius twist, `τ * C a = C (a ^ q) * τ`. -/
def TwistedPolynomial (K L : Type*) … : Type _ := SkewPolynomial L
instance : Ring (TwistedPolynomial K L) :=
  letI := frobeniusAction K L; inferInstanceAs (Ring (SkewPolynomial L))
```

`K` plays the role of `F_q` throughout. Making the Frobenius a global instance on `L` would twist
every `SkewPolynomial L` in scope, including ones meant for another endomorphism or for the
p-Frobenius when q = p^m with m > 1. So the action is a `def`, and `TwistedPolynomial K L` builds
its ring structure with it as a local instance: the twist is part of the type. Everything else
reuses Mathlib's API through this definition: coefficients, `C`, `X = τ`, and the multiplication
rule `monomial_mul_monomial`.

**A Drinfeld module is a structure over a fixed characteristic map.** Following the source,
`γ : A →ₐ[F_q] L` (the source's `ι`) is fixed first, and a Drinfeld module over `(L, γ)` is an
`F_q`-algebra map `φ : A → L{τ}` with `∂ ∘ φ = γ` that is not the constant map `C ∘ γ`. Morphisms
are defined only between Drinfeld modules over the same `γ`. The source's definition allows the
constant map, since it lets the rank be any non-negative integer; the node excludes it, as Drinfeld
does and as the roadmap's "rank-r" requires.

## DM.0 — Additive polynomials and Drinfeld modules

Inputs: `FunctionFieldArithmetic:FA.1` (the ring `A`, only for the general-A rank theorem; requested). Consumers inside the roadmap: DM.1, DM.2 and DM.4, and DM.8 through the Carlitz module.

### `frobenius-action` — The q-power Frobenius action on an F_q-algebra

*construction*

For a finite field F_q and a commutative F_q-algebra L, frobeniusAction F_q L is the MulSemiringAction of the monoid Multiplicative ℕ on L in which ofAdd n acts by x ↦ x^(q^n), the n-th iterate of FiniteField.frobeniusAlgHom F_q L. It is a def, never a global instance, so that a field carrying another Multiplicative ℕ action (or a p-Frobenius) is not silently twisted.

**Hypotheses.**
- F_q a finite field with q elements; L a commutative F_q-algebra (for most results a field containing F_q).

**Construction, in steps.**
1. Set (ofAdd n) • x := (frobeniusAlgHom F_q L)^[n] x; by coe_frobeniusAlgHom this is x^(q^n).
2. The action axioms: ofAdd 0 acts trivially, and ofAdd (m + n) acts as the composite, by Function.iterate_add.
3. Each ofAdd n acts by a ring endomorphism because frobeniusAlgHom is an F_q-algebra map (its additivity is Mathlib's add_pow_expChar_pow, used inside frobeniusAlgHom).

**API.**

| name | role | statement |
|---|---|---|
| `frobeniusAction` | constructor | MulSemiringAction (Multiplicative ℕ) L with (ofAdd n) • x = x^(q^n). |
| `frobeniusAction_smul` | characterisation | (ofAdd n) • x = x ^ (q ^ n) under frobeniusAction. |
| `frobeniusAction_smul_algebraMap` | simp | (ofAdd n) • algebraMap F_q L c = algebraMap F_q L c. |
| `frobeniusAction_φ` | compatibility | SkewPolynomial.φ for this action is (frobeniusAlgHom F_q L : L →+* L). |

**Unit tests.** A wrong definition fails one of these.

- `frobeniusAction.test_one` (computation) — Under frobeniusAction, (ofAdd 1) • x = x ^ q; on F_4 over F_2, ω ↦ ω² = ω + 1.
- `frobeniusAction.test_fixes_base` (degenerate) — For L = F_q the action is trivial: every x satisfies x^q = x.
- `frobeniusAction.test_not_p_frobenius` (non-example) — For F_q = F_4 and L = F_16, (ofAdd 1) • x = x^4, not x^2: an implementation using Mathlib's p-Frobenius `frobenius L 2` fails.

**Where it is used.**
- `twisted-polynomial-ring` — The twisted polynomial ring is SkewPolynomial L with this action as the twist.
- `DrinfeldModulesAndTModules:DM.4` — Mat_d(L){τ} twists matrix entries by the same action, entrywise (§3.1).

**Acceptance tests.**
- ofAdd 1 acts by x ↦ x^q, and ofAdd n by x ↦ x^(q^n).
- Elements of F_q are fixed: c^q = c (FiniteField.pow_card).
- The action is by F_q-algebra maps, so the resulting twisted polynomial ring is an F_q-algebra.

**Dependencies.**
- Pinned libraries: `mathlib:FiniteField.frobeniusAlgHom`, `mathlib:FiniteField.coe_frobeniusAlgHom`, `mathlib:MulSemiringAction`, `mathlib:FiniteField.pow_card`

**Sources.**
- Brownawell–Papanikolas — §2.1, p. 3, table of symbols. τ as the q-power Frobenius and c^(i) = c^{q^i}. Prose verbatim from the arXiv PDF's text layer; formulas transcribed.

### `twisted-polynomial-ring` — The twisted polynomial ring L{τ}

*definition* · planet **Twisted polynomial ring**

TwistedPolynomial F_q L, written L{τ}, is Mathlib's SkewPolynomial L with the twist given by frobeniusAction: its elements are finite sums Σ a_i τ^i with a_i ∈ L, and multiplication is determined by τ · a = a^q · τ, i.e. a τ^i · b τ^j = a b^(q^i) τ^(i+j). It is an F_q-algebra (elements of F_q are central, since c^q = c) and carries the constant-coefficient ring homomorphism ∂ : L{τ} → L, the τ-degree deg_τ and the leading coefficient. The ring is noncommutative unless the Frobenius is trivial on L.

**Hypotheses.**
- F_q a finite field with q elements; L a commutative F_q-algebra (for most results a field containing F_q).
- The ring structure is built from SkewPolynomial L with frobeniusAction as a local instance, wrapped as a def so that the twist is part of the type.

**Construction, in steps.**
1. Define TwistedPolynomial F_q L := SkewPolynomial L and transport the Ring structure of SkewPolynomial L computed with frobeniusAction; define τ := SkewPolynomial.X and C := SkewPolynomial.CRingHom.
2. τ_mul_C: τ * C a = C (a^q) * τ, from SkewPolynomial.X_mul and frobeniusAction_smul.
3. The F_q-algebra structure: algebraMap c := C (algebraMap F_q L c); it is central because τ commutes with C c when c^q = c.
4. constantCoeff : L{τ} →+* L, f ↦ coeff f 0: multiplicative because the degree-0 coefficient of a τ^i · b τ^j is ab when i = j = 0 and 0 otherwise (monomial_mul_monomial).
5. natDegree and leadingCoeff through the support of the underlying SkewMonoidAlgebra, as for Polynomial.

**API.**

| name | role | statement |
|---|---|---|
| `TwistedPolynomial` | constructor | SkewPolynomial L with the frobeniusAction twist, as a def with its own Ring and Algebra F_q instances. |
| `TwistedPolynomial.τ` | constructor | The element τ = SkewPolynomial.X. |
| `TwistedPolynomial.C` | constructor | The constants L →+* L{τ}. |
| `TwistedPolynomial.τ_mul_C` | characterisation | τ * C a = C (a ^ q) * τ. |
| `TwistedPolynomial.τ_pow_mul_C` | characterisation | τ^n * C a = C (a ^ (q ^ n)) * τ^n. |
| `TwistedPolynomial.algebraMap_eq` | compatibility | algebraMap F_q L{τ} c = C (algebraMap F_q L c), and it is central. |
| `TwistedPolynomial.coeff` | data | The coefficient of τ^n. |
| `TwistedPolynomial.ext` | extensionality | Two twisted polynomials with the same coefficients are equal. |
| `TwistedPolynomial.sum_C_mul_τ_pow` | characterisation | f = Σ_{i ≤ natDegree f} C (coeff f i) * τ^i. |
| `TwistedPolynomial.natDegree` | data | The τ-degree deg_τ f (0 for f = 0). |
| `TwistedPolynomial.leadingCoeff` | data | coeff f (natDegree f). |
| `TwistedPolynomial.constantCoeff` | data | ∂ : L{τ} →+* L, f ↦ coeff f 0. |
| `TwistedPolynomial.constantCoeff_C` | simp | ∂ (C a) = a. |
| `TwistedPolynomial.constantCoeff_τ` | simp | ∂ τ = 0. |
| `TwistedPolynomial.natDegree_C_add_τ` | example | For any a, natDegree (C a + τ) = 1. |

**Unit tests.** A wrong definition fails one of these.

- `twistedPolynomial.test_noncommutative` (non-example) — Over F_2 with L = F_4 and ω² = ω + 1: τ * C ω = C (ω + 1) * τ ≠ C ω * τ. A definition with the trivial twist (Polynomial L) is commutative and fails.
- `twistedPolynomial.test_trivial_twist` (compatibility) — For L = F_q, τ * C a = C a * τ for all a, and L{τ} ≅ F_q[X] as F_q-algebras via τ ↦ X.
- `twistedPolynomial.test_constantCoeff_mul` (computation) — ∂((C a + τ) * (C b + τ)) = a b, although the product is C(ab) + C(a + b^q) τ + τ².
- `twistedPolynomial.test_zero_degree` (degenerate) — natDegree 0 = 0 and leadingCoeff 0 = 0, as for Polynomial.

**Where it is used.**
- `drinfeld-module` — A Drinfeld module is an F_q-algebra map into L{τ}; its constant coefficient is the characteristic map.
- `twisted-polynomial-eval` — Evaluation identifies L{τ} with F_q-linear endomorphisms of L and with q-polynomials.
- `DrinfeldModulesAndTModules:DM.1` — Torsion φ[a] is the kernel of the additive polynomial of φ(a) ∈ L{τ}.
- `DrinfeldModulesAndTModules:DM.2` — The exponential of a lattice satisfies exp(az) = φ(a)(exp z) with φ(a) ∈ C∞{τ}.
- `DrinfeldModulesAndTModules:DM.4` — t-modules take values in Mat_d(L){τ} = Mat_d(L{τ}).
- `DrinfeldModulesAndTModules:DM.8` — The DM.8 motive packaging uses L[t, τ] = L{τ}[t], built on this ring.

**Acceptance tests.**
- τ · a = a^q · τ, and the ring is not commutative for L = F_4 over F_2.
- For L = F_q the twist is trivial, and L{τ} is isomorphic to the commutative ring F_q[X].
- ∂ is a ring homomorphism and kills τ.

**Dependencies.**
- In this roadmap: `frobenius-action`
- Pinned libraries: `mathlib:SkewPolynomial`, `mathlib:SkewPolynomial.X`, `mathlib:SkewPolynomial.CRingHom`, `mathlib:SkewPolynomial.C`, `mathlib:SkewPolynomial.coeff`, `mathlib:SkewPolynomial.monomial_mul_monomial`, `mathlib:SkewPolynomial.X_mul`

**Sources.**
- Brownawell–Papanikolas — §2.1, p. 3, table of symbols. The ring R{τ} and its multiplication rule. Prose verbatim from the arXiv PDF's text layer; formulas transcribed.
- Brownawell–Papanikolas — §2.2, p. 3, the Carlitz module. Twisted polynomials as F_q-linear endomorphisms, used for evaluation. Prose verbatim from the arXiv PDF's text layer; formulas transcribed.

### `tau-degree-mul` — The τ-degree is additive over a domain

*theorem*

If L is a domain containing F_q and f, g ∈ L{τ} are nonzero, then deg_τ(f g) = deg_τ f + deg_τ g and leadingCoeff(f g) = leadingCoeff(f) · leadingCoeff(g)^(q^(deg_τ f)). In particular L{τ} has no zero divisors, and its units are the constants C a with a ∈ L^×.

**Hypotheses.**
- F_q a finite field with q elements; L a commutative F_q-algebra (for most results a field containing F_q).
- L a domain (so of characteristic p, with injective Frobenius).

**Proof, in steps.**
1. By monomial_mul_monomial the top coefficient of f g is lc(f) · lc(g)^(q^m), m = deg_τ f, and no other product reaches degree m + n.
2. lc(g)^(q^m) ≠ 0 because the Frobenius of a reduced ring is injective (frobenius_inj, iterated), and L is a domain.
3. Degree additivity then excludes zero divisors, and a unit u has deg_τ u + deg_τ u⁻¹ = 0, so u = C a.

**Acceptance tests.**
- deg_τ(τ · C a) = 1 for a ≠ 0.
- Over the non-reduced ring L = F_q[ε]/(ε²) the formula fails: (C ε τ)(C ε) = C (ε · ε^q) τ = 0.
- The leading coefficient is twisted: lc((C a τ)(C b τ)) = a b^q, not a b.

**Dependencies.**
- In this roadmap: `twisted-polynomial-ring`
- Pinned libraries: `mathlib:SkewPolynomial.monomial_mul_monomial`, `mathlib:frobenius_inj`

**Sources.**
- Brownawell–Papanikolas — §2.1, p. 3, table of symbols. The multiplication rule from which the leading-term formula follows; the source uses deg_τ without stating additivity. Prose verbatim from the arXiv PDF's text layer; formulas transcribed.

### `twisted-polynomial-eval` — Evaluation of twisted polynomials: F_q-linear endomorphisms and q-polynomials

*construction*

evalEnd : L{τ} →ₐ[F_q] Module.End F_q L sends Σ a_i τ^i to the F_q-linear map x ↦ Σ a_i x^(q^i), with τ ↦ frobeniusAlgHom F_q L and product ↦ composition. toPolynomial : L{τ} → L[X] sends Σ a_i τ^i to the q-polynomial Σ a_i X^(q^i), with toPolynomial(f g) = (toPolynomial f).comp (toPolynomial g), and evaluating toPolynomial f at x is evalEnd f x.

**Hypotheses.**
- F_q a finite field with q elements; L a commutative F_q-algebra (for most results a field containing F_q).

**Construction, in steps.**
1. Define evalEnd on monomials by C a · τ^i ↦ (x ↦ a · x^(q^i)); it is additive, and multiplicative because (a x^(q^i)) composed after (b x^(q^j)) is a b^(q^i) x^(q^(i+j)), matching monomial_mul_monomial.
2. F_q-linearity of each image map: (c x)^(q^i) = c^(q^i) x^(q^i) = c x^(q^i) for c ∈ F_q (pow_card).
3. Define toPolynomial coefficientwise; toPolynomial(f g) = toPolynomial f ∘ toPolynomial g by the same monomial computation together with additivity of X^(q^i) in characteristic p.
4. Over a domain, natDegree (toPolynomial f) = q^(deg_τ f) for f ≠ 0.

**API.**

| name | role | statement |
|---|---|---|
| `evalEnd` | constructor | L{τ} →ₐ[F_q] Module.End F_q L. |
| `evalEnd_apply` | characterisation | evalEnd f x = Σ_{i ≤ deg_τ f} coeff f i * x ^ (q ^ i). |
| `evalEnd_τ` | simp | evalEnd τ = (frobeniusAlgHom F_q L).toLinearMap. |
| `evalEnd_C` | simp | evalEnd (C a) = a • LinearMap.id. |
| `toPolynomial` | constructor | L{τ} → L[X], Σ a_i τ^i ↦ Σ a_i X^(q^i), as an additive map. |
| `toPolynomial_mul` | structure | toPolynomial (f * g) = (toPolynomial f).comp (toPolynomial g). |
| `eval_toPolynomial` | compatibility | (toPolynomial f).eval x = evalEnd f x. |
| `natDegree_toPolynomial` | characterisation | Over a domain, natDegree (toPolynomial f) = q ^ deg_τ f for f ≠ 0. |
| `derivative_toPolynomial` | characterisation | derivative (toPolynomial f) = Polynomial.C (constantCoeff f): the q-polynomial is separable iff ∂ f ≠ 0. |

**Unit tests.** A wrong definition fails one of these.

- `evalEnd.test_carlitz_t` (computation) — evalEnd (C θ + τ) x = θ x + x^q.
- `evalEnd.test_finite_field_kernel` (non-example) — Over L = F_q, evalEnd (τ − 1) = 0 with τ − 1 ≠ 0.
- `toPolynomial.test_composition` (computation) — toPolynomial (τ * C a) = a^q X^q = (X^q).comp (a X), and toPolynomial (C a * τ) = a X^q: the order of multiplication is the order of composition.
- `toPolynomial.test_separable` (degenerate) — derivative (toPolynomial τ) = 0: τ is purely inseparable, X^q.

**Where it is used.**
- `additive-polynomial-characterisation` — The characterisation of F_q-linear polynomials is the statement that toPolynomial is onto them.
- `drinfeld-module` — The A-module (φ, L) is L with a · x := evalEnd (φ a) x.
- `DrinfeldModulesAndTModules:DM.1` — a-torsion is the zero set of toPolynomial (φ a); its separability is governed by derivative_toPolynomial, hence by ι(a).
- `DrinfeldModulesAndTModules:DM.2` — The functional equation exp(a z) = φ(a)(exp z) evaluates φ(a) on a power series.

**Acceptance tests.**
- evalEnd τ is the q-Frobenius, and evalEnd (C a) is multiplication by a.
- Over L = F_q, evalEnd (τ − 1) = 0 although τ − 1 ≠ 0, so evalEnd is not injective for finite L.
- toPolynomial (C θ + τ) = θ X + X^q, with natDegree q.

**Dependencies.**
- In this roadmap: `twisted-polynomial-ring`
- Pinned libraries: `mathlib:Module.End`, `mathlib:FiniteField.coe_frobeniusAlgHom`, `mathlib:Polynomial.comp`, `mathlib:FiniteField.pow_card`

**Sources.**
- Brownawell–Papanikolas — §2.2, p. 3, the Carlitz module. The evaluation x ↦ Σ a_i x^{q^i}. Prose verbatim from the arXiv PDF's text layer; formulas transcribed.
- Brownawell–Papanikolas — §2.3, p. 5, Drinfeld modules. The identification of L{τ} with F_q-linear endomorphisms of the additive group. Prose verbatim from the arXiv PDF's text layer; formulas transcribed.

### `twisted-polynomial-eval-injective` — Evaluation is injective over an infinite domain

*theorem*

If L is an infinite domain containing F_q, then evalEnd : L{τ} → Module.End F_q L is injective, and so is toPolynomial (for every L). Thus over an infinite field L{τ} is exactly a ring of F_q-linear endomorphisms of L.

**Hypotheses.**
- F_q a finite field with q elements; L a commutative F_q-algebra (for most results a field containing F_q).
- For evalEnd: L an infinite domain.

**Proof, in steps.**
1. toPolynomial is injective because distinct i give distinct exponents q^i.
2. If evalEnd f = 0 then toPolynomial f has every x ∈ L as a root; L is infinite, so toPolynomial f = 0 (Polynomial.eq_zero_of_infinite_isRoot), hence f = 0.

**Acceptance tests.**
- Over L = F_q the map fails to be injective (τ − 1).
- Over the algebraic closure of F_q, which is infinite, it is injective.
- Injectivity of toPolynomial holds even for finite L.

**Dependencies.**
- In this roadmap: `twisted-polynomial-eval`
- Pinned libraries: `mathlib:Polynomial.eq_zero_of_infinite_isRoot`

**Sources.**
- Brownawell–Papanikolas — §2.3, p. 5, Drinfeld modules. The identification the theorem makes precise. Prose verbatim from the arXiv PDF's text layer; formulas transcribed.

### `additive-polynomial-characterisation` — F_q-linear polynomials are q-polynomials

*theorem* · planet **F_q-linear polynomials**

Let L be an infinite field containing F_q and P ∈ L[X]. The map x ↦ P(x) on L is F_q-linear (P(x + y) = P(x) + P(y) and P(c x) = c P(x) for all x, y ∈ L and c ∈ F_q) if and only if P = Σ_i a_i X^(q^i), i.e. P lies in the image of toPolynomial. Combined with twisted-polynomial-eval, L{τ} is isomorphic to the ring of F_q-linear polynomials under composition, which is End_{F_q}(G_a) over L.

**Hypotheses.**
- F_q a finite field with q elements; L a commutative F_q-algebra (for most results a field containing F_q).
- L an infinite field (for a finite field, x^(q^n) and x define the same map).

**Proof, in steps.**
1. If: each X^(q^i) is additive in characteristic p and F_q-homogeneous because c^(q^i) = c.
2. Only if, additivity: P(X + Y) − P(X) − P(Y) ∈ L[X, Y] vanishes on the infinite set L × L, hence is zero; comparing the coefficient of X^j Y^(n−j) gives (n choose j) a_n = 0 for 0 < j < n, so a_n ≠ 0 forces n = p^k (Lucas), and P has no constant term.
3. Only if, F_q-homogeneity: P(c X) = c P(X) as polynomials (again by infinitude of L) gives a_n (c^n − c) = 0 for all c ∈ F_q; with n = p^k and a primitive c this forces n ≡ 1 mod (q − 1), i.e. q − 1 divides p^k − 1, so n is a power of q.
4. Hence every nonzero coefficient sits in a degree q^i, and P = toPolynomial (Σ a_(q^i) τ^i).

**Acceptance tests.**
- X^p is additive but not F_q-linear when q = p² (c^p ≠ c for c ∈ F_{p²} \ F_p).
- X^q − X is F_q-linear; over L = F_q it defines the zero map although it is nonzero, which is why L must be infinite.
- A constant polynomial c ≠ 0 is not additive.

**Dependencies.**
- In this roadmap: `twisted-polynomial-eval`, `twisted-polynomial-eval-injective`
- Pinned libraries: `mathlib:Polynomial.eq_of_infinite_eval_eq`, `mathlib:FiniteField.pow_card`

**Sources.**
- Brownawell–Papanikolas — §2.3, p. 5, Drinfeld modules. The source identifies φ with a map to End_L(G_a) and takes the identification L{τ} = End_L(G_a) (F_q-linear endomorphisms) as known; its proof is not in the source (see gaps). Prose verbatim from the arXiv PDF's text layer; formulas transcribed.
- Brownawell–Papanikolas — §2.2, p. 3. The q-polynomials f(x) = Σ a_i x^{q^i}. Prose verbatim from the arXiv PDF's text layer; formulas transcribed.

### `drinfeld-module` — Drinfeld modules

*definition* · planet **Drinfeld module**

Let A be a commutative F_q-algebra and γ : A →ₐ[F_q] L an F_q-algebra map to a field L (the characteristic map, the source's ι). A Drinfeld A-module over (L, γ) is an F_q-algebra homomorphism φ : A → L{τ}, a ↦ φ_a, such that ∂(φ_a) = γ(a) for every a and φ_a ∉ C(L) for some a (φ is not the constant map C ∘ γ). The characteristic ideal is ker γ; φ has generic characteristic when γ is injective. Through evalEnd, φ makes L into an A-module (φ, L) with a · x = φ_a(x). For the roadmap's A (functions on a curve regular away from ∞, supplied by FunctionFieldArithmetic:FA.1) this is Drinfeld's definition; the structure itself needs no hypothesis on A.

**Hypotheses.**
- F_q a finite field with q elements; L a commutative F_q-algebra (for most results a field containing F_q).
- L a field; A a commutative F_q-algebra; γ : A →ₐ[F_q] L.

**Construction, in steps.**
1. Define DrinfeldModule A γ as a structure with fields toAlgHom : A →ₐ[F_q] L{τ}, constantCoeff_apply : ∀ a, ∂(φ_a) = γ a, and nonconstant : ∃ a, 0 < deg_τ φ_a.
2. Characteristic data: charIdeal := RingHom.ker γ, IsGenericChar := Function.Injective γ; both depend only on γ.
3. The module (φ, L): a type synonym Points φ := L with Module A given by a • x := evalEnd (φ_a) x; module axioms from evalEnd being an algebra map.
4. Base change along a field extension L → L' maps coefficients and preserves the axioms (deg_τ is preserved since the map is injective).

**API.**

| name | role | statement |
|---|---|---|
| `DrinfeldModule` | constructor | Structure: toAlgHom : A →ₐ[F_q] L{τ}, constantCoeff_apply, nonconstant. |
| `DrinfeldModule.instFunLike` | data | φ a := φ.toAlgHom a. |
| `DrinfeldModule.ext` | extensionality | φ = ψ if φ a = ψ a for all a. |
| `DrinfeldModule.ext_polynomial` | extensionality | For A = F_q[t], φ = ψ if φ t = ψ t. |
| `DrinfeldModule.constantCoeff_apply` | characterisation | ∂(φ a) = γ a. |
| `DrinfeldModule.map_algebraMap` | simp | φ (algebraMap F_q A c) = C (algebraMap F_q L c). |
| `DrinfeldModule.charIdeal` | data | RingHom.ker γ. |
| `DrinfeldModule.IsGenericChar` | data | Function.Injective γ. |
| `DrinfeldModule.Points` | constructor | The A-module (φ, L): L with a • x = evalEnd (φ a) x. |
| `DrinfeldModule.smul_def` | characterisation | a • x = evalEnd (φ a) x in Points φ. |
| `DrinfeldModule.baseChange` | constructor | For a field extension L → L', the Drinfeld module over (L', γ composed) with the mapped coefficients. |
| `DrinfeldModule.IsDefinedOver` | data | φ(A) ⊆ K'{τ} for a subfield K' ⊆ L. |

**Unit tests.** A wrong definition fails one of these.

- `drinfeldModule.test_constant_not_module` (non-example) — The constant map a ↦ C (γ a) satisfies ∂ ∘ φ = γ but is not a Drinfeld module: nonconstant fails. A definition that drops nonconstant accepts rank 0.
- `drinfeldModule.test_rank_two` (computation) — For A = F_q[t] and g, Δ ∈ L with Δ ≠ 0, t ↦ C θ + C g τ + C Δ τ² defines a Drinfeld module (of rank 2).
- `drinfeldModule.test_special_char` (degenerate) — For A = F_q[t] with γ(t) = 0 (characteristic ideal (t)), t ↦ τ defines a Drinfeld module whose charIdeal is (t) and which is not of generic characteristic.
- `drinfeldModule.test_constant_coeff_rigid` (non-example) — t ↦ C (θ + 1) + τ is not a Drinfeld module over γ(t) = θ: its constant coefficient is not γ(t).
- `drinfeldModule.test_points_smul` (computation) — For the Carlitz module, t • x = θ x + x^q in Points.

**Where it is used.**
- `rank` — The rank is read from the τ-degrees of the φ_a.
- `carlitz-module` — The Carlitz module is the basic example.
- `drinfeld-module-hom` — Morphisms are twisted polynomials intertwining two Drinfeld modules over the same γ.
- `DrinfeldModulesAndTModules:DM.1` — Torsion φ[a] and Tate modules are built from the A-module (φ, L).
- `DrinfeldModulesAndTModules:DM.2` — Uniformization identifies Drinfeld modules over C∞ with lattices.
- `DrinfeldModulesAndTModules:DM.3` — The moduli problem classifies Drinfeld modules of rank r with level structure.
- `DrinfeldModulesAndTModules:DM.4` — A Drinfeld module is a t-module of dimension 1 (§3.1).
- `DrinfeldModulesAndTModules:DM.6` — Taelman's class-number formula is stated for Drinfeld modules over O_K.

**Acceptance tests.**
- The Carlitz module is one; the constant map C ∘ γ is not, because of nonconstant.
- For A = F_q[t], a Drinfeld module is determined by φ_t (Polynomial.algHom_ext).
- In special characteristic (γ(t) = 0) the constant coefficient of φ_t vanishes, making every torsion polynomial inseparable at t.

**Dependencies.**
- In this roadmap: `twisted-polynomial-ring`, `twisted-polynomial-eval`
- Pinned libraries: `mathlib:RingHom.ker`, `mathlib:Polynomial.algHom_ext`

**Sources.**
- Brownawell–Papanikolas — §2.3, p. 5, the setting. A, the point ∞ and the characteristic map ι. Prose verbatim from the arXiv PDF's text layer; formulas transcribed.
- Brownawell–Papanikolas — §2.3, p. 5, the definition. The definition. The source's condition does not exclude the constant homomorphism a ↦ ι(a) (its rank would be 0, which the source's 'non-negative integer r' allows); the node follows Drinfeld and the roadmap and requires φ(A) ⊄ L. Prose verbatim from the arXiv PDF's text layer; formulas transcribed.
- Brownawell–Papanikolas — §2.3, p. 5, characteristic. Generic and special characteristic, and fields of definition. Prose verbatim from the arXiv PDF's text layer; formulas transcribed.
- Brownawell–Papanikolas — §2.3, p. 5, the module (φ, L). The A-module structure on L. Prose verbatim from the arXiv PDF's text layer; formulas transcribed.

### `rank-polynomial-ring` — Rank of a Drinfeld F_q[t]-module

*theorem*

Let φ be a Drinfeld F_q[t]-module over a field L, and r := deg_τ φ_t. Then r ≥ 1 and deg_τ φ_a = r · deg_t a for every nonzero a ∈ F_q[t]; moreover the leading coefficient of φ_a is lc(a) · lc(φ_t)^(1 + q^r + ⋯ + q^(r(deg a − 1))).

**Hypotheses.**
- F_q a finite field with q elements; L a commutative F_q-algebra (for most results a field containing F_q).
- L a field; A = F_q[t]; φ a Drinfeld A-module over some γ.

**Proof, in steps.**
1. φ_a = Σ c_i φ_t^i for a = Σ c_i t^i, since φ is an F_q-algebra map and φ(c) = C c for c ∈ F_q.
2. By tau-degree-mul, deg_τ φ_t^i = i r, and the leading coefficient of φ_t^i is the stated product; for i < deg a the terms have strictly smaller τ-degree when r ≥ 1, so the top term is c_(deg a) φ_t^(deg a).
3. r ≥ 1: if r = 0 then every φ_a = φ_(Σ c_i t^i) is a constant, contradicting nonconstant.

**Acceptance tests.**
- For the Carlitz module r = 1 and deg_τ C(a) = deg a.
- For t ↦ C θ + C g τ + C Δ τ² with Δ ≠ 0, r = 2 and deg_τ φ_(t²) = 4.
- The leading coefficient of φ_(t^n) is lc(φ_t)^((q^(rn) − 1)/(q^r − 1)), the twisted product, not lc(φ_t)^n.

**Dependencies.**
- In this roadmap: `drinfeld-module`, `tau-degree-mul`
- Pinned libraries: `mathlib:Polynomial.aeval`

**Sources.**
- Brownawell–Papanikolas — §2.3, p. 5, rank. The rank relation, for A = F_q[t] where deg(a) is the t-degree. Prose verbatim from the arXiv PDF's text layer; formulas transcribed.

### `rank-general` — Rank of a Drinfeld module for a general A

*theorem*

Let A be the ring of functions on a smooth projective geometrically irreducible curve over F_q that are regular away from an F_q-rational point ∞ (FunctionFieldArithmetic:FA.1; the source's standing assumption), and φ a Drinfeld A-module over a field L. There is a unique integer r ≥ 1 such that q^(deg_τ φ_a) = #(A/(a))^r, i.e. deg_τ φ_a = r · deg a with q^(deg a) = #(A/(a)), for every nonzero a ∈ A.

**Hypotheses.**
- F_q a finite field with q elements; L a commutative F_q-algebra (for most results a field containing F_q).
- A as supplied by FunctionFieldArithmetic:FA.1: a Dedekind domain, finitely generated over F_q, with exactly one place ∞ of its fraction field not coming from a prime of A, of degree 1; #(A/(a)) = q^(deg a) with deg a = −v_∞(a).
- L a field; φ a Drinfeld A-module.

**Proof, in steps.**
1. v(a) := −deg_τ φ_a extends, by tau-degree-mul, to a discrete valuation of Frac(A), trivial on F_q^×.
2. v(a) ≤ 0 on A, and v is nontrivial because φ is nonconstant; so v is a positive multiple of the valuation at a place where A is not integral, which is ∞ (FA.1).
3. Comparing with v_∞ = −deg gives deg_τ φ_a = r · deg a for a rational r > 0. Since ∞ has degree 1, Riemann–Roch (FA.1) gives elements of A of every large degree, in particular of two consecutive degrees d and d + 1; r d and r (d + 1) are integers, so r is.
4. Uniqueness: two such r agree on any a with deg a > 0.

**Acceptance tests.**
- For A = F_q[t] it is rank-polynomial-ring.
- For A = F_q[x, y]/(y² + y − x³ − 1) over F_2 (∞ of degree 1), deg x = 2 and deg y = 3, so deg_τ φ_x = 2r and deg_τ φ_y = 3r.
- The rank does not depend on the choice of a.

**Dependencies.**
- In this roadmap: `drinfeld-module`, `tau-degree-mul`, `rank-polynomial-ring`
- Other roadmaps: `FunctionFieldArithmetic:FA.1`
- Pinned libraries: `mathlib:Ideal.span`, `mathlib:Nat.card`

**Sources.**
- Brownawell–Papanikolas — §2.3, p. 5, rank. The statement; the source gives no proof and refers to Goss §4.5, which was not available (see gaps). Prose verbatim from the arXiv PDF's text layer; formulas transcribed.

### `rank` — The rank of a Drinfeld module

*definition* · planet **Rank of a Drinfeld module**

rank φ is the integer r of rank-general (for A = F_q[t], rank φ = deg_τ φ_t, by rank-polynomial-ring). It satisfies rank φ ≥ 1 and q^(deg_τ φ_a) = #(A/(a))^(rank φ) for nonzero a.

**Hypotheses.**
- F_q a finite field with q elements; L a commutative F_q-algebra (for most results a field containing F_q).
- A and φ as in rank-general; for A = F_q[t] no hypothesis beyond drinfeld-module.

**Construction, in steps.**
1. For A = F_q[t] define rank φ := deg_τ φ_t directly.
2. For general A define rank φ as the r of rank-general (Classical.choose of the existence statement), with its specification as the API.

**API.**

| name | role | statement |
|---|---|---|
| `DrinfeldModule.rank` | constructor | The rank r ≥ 1. |
| `DrinfeldModule.rank_pos` | structure | 1 ≤ rank φ. |
| `DrinfeldModule.natDegree_apply` | characterisation | For A = F_q[t] and a ≠ 0: deg_τ φ a = rank φ * natDegree a. |
| `DrinfeldModule.rank_eq_natDegree_X` | characterisation | For A = F_q[t]: rank φ = deg_τ φ t. |
| `DrinfeldModule.natDegree_toPolynomial_apply` | relation | natDegree (toPolynomial (φ a)) = q ^ (rank φ * natDegree a): the degree of the a-torsion polynomial. |
| `DrinfeldModule.rank_baseChange` | structure | rank (φ.baseChange L') = rank φ. |

**Unit tests.** A wrong definition fails one of these.

- `rank.test_carlitz` (computation) — rank (carlitz θ) = 1.
- `rank.test_two` (computation) — rank of t ↦ C θ + C g τ + C Δ τ² is 2 when Δ ≠ 0.
- `rank.test_top_coefficient` (non-example) — With Δ = 0 and g ≠ 0 the rank is 1, not 2: a definition counting nonzero τ-terms fails.
- `rank.test_kernel_degree` (computation) — natDegree (toPolynomial (carlitz θ (t²))) = q², the order of the t²-torsion when θ ≠ 0.

**Where it is used.**
- `isogeny-rank` — Isogenous modules have the same rank.
- `DrinfeldModulesAndTModules:DM.1` — φ[a] has order q^(r deg a) and T_λ φ is free of rank r.
- `DrinfeldModulesAndTModules:DM.2` — Rank-r Drinfeld modules over C∞ correspond to lattices of rank r.
- `DrinfeldModulesAndTModules:DM.3` — The moduli stack is indexed by the rank.

**Acceptance tests.**
- rank of the Carlitz module is 1.
- rank of t ↦ C θ + C g τ + C Δ τ² is 2 if Δ ≠ 0 and 1 if Δ = 0, g ≠ 0: it is read from the top coefficient, not the number of terms.
- rank is invariant under base change.

**Dependencies.**
- In this roadmap: `rank-polynomial-ring`, `rank-general`

**Sources.**
- Brownawell–Papanikolas — §2.3, p. 5, rank. The definition of the rank. Prose verbatim from the arXiv PDF's text layer; formulas transcribed.
- Brownawell–Papanikolas — §2.4, p. 7. The degree of φ_a(z) as a polynomial is q^{r deg a}, the kernel degree. Prose verbatim from the arXiv PDF's text layer; formulas transcribed.

### `carlitz-module` — The Carlitz module

*construction* · planet **Carlitz module**

For a field L containing F_q and θ ∈ L, the Carlitz module carlitz θ is the Drinfeld F_q[t]-module over γ = aeval θ with C(t) = θ + τ, i.e. the F_q-algebra map Polynomial.aeval (C θ + τ) : F_q[t] → L{τ}. It has rank 1, generic characteristic iff θ is transcendental over F_q, and (φ, L) is L with t · x = θ x + x^q.

**Hypotheses.**
- F_q a finite field with q elements; L a commutative F_q-algebra (for most results a field containing F_q).
- L a field; θ ∈ L; γ := Polynomial.aeval θ : F_q[t] →ₐ[F_q] L.

**Construction, in steps.**
1. Define toAlgHom := Polynomial.aeval (C θ + τ); it is an F_q-algebra map since L{τ} is an F_q-algebra.
2. ∂(C(a)) = a(θ) = γ(a): ∂ is a ring map with ∂(C θ + τ) = θ, and both sides are F_q-algebra maps agreeing on t (algHom_ext).
3. nonconstant: deg_τ C(t) = 1 (natDegree_C_add_τ).

**API.**

| name | role | statement |
|---|---|---|
| `carlitz` | constructor | The Drinfeld F_q[t]-module over aeval θ with t ↦ C θ + τ. |
| `carlitz_X` | simp | carlitz θ X = C θ + τ. |
| `carlitz_constantCoeff` | characterisation | ∂ (carlitz θ a) = aeval θ a. |
| `carlitz_rank` | characterisation | rank (carlitz θ) = 1. |
| `carlitz_leadingCoeff` | characterisation | leadingCoeff (carlitz θ a) = algebraMap F_q L (leadingCoeff a): C(a) is monic when a is. |
| `carlitz_smul_X` | example | In Points (carlitz θ), X • x = θ * x + x ^ q. |
| `carlitz_isGenericChar_iff` | characterisation | IsGenericChar (carlitz θ) ↔ θ is transcendental over F_q. |

**Unit tests.** A wrong definition fails one of these.

- `carlitz.test_t_squared` (computation) — carlitz θ (X²) = C (θ²) + C (θ + θ^q) * τ + τ².
- `carlitz.test_special_char` (degenerate) — carlitz 0 X = τ and toPolynomial (carlitz 0 X) = X^q: inseparable in characteristic (t).
- `carlitz.test_torsion_count` (computation) — For θ ≠ 0 and L algebraically closed, toPolynomial (carlitz θ X) = θ X + X^q has exactly q distinct roots (separable: derivative θ ≠ 0).
- `carlitz.test_not_minus_convention` (non-example) — For q odd, carlitz θ X ≠ C θ − τ: Carlitz's own convention θ − τ, which the source mentions, is a different module, isomorphic to carlitz θ only through C c with c^(q−1) = −1 (for q even the two coincide).

**Where it is used.**
- `DrinfeldModulesAndTModules:DM.1` — The first example of torsion: C[f] ≅ F_q[t]/(f), and the Carlitz cyclotomic fields.
- `DrinfeldModulesAndTModules:DM.2` — The Carlitz exponential exp_C and period π̃ uniformise it.
- `DrinfeldModulesAndTModules:DM.4` — Its tensor powers C^⊗n are the basic t-modules.
- `DrinfeldModulesAndTModules:DM.6` — Its zeta value and period normalisation are the acceptance test of Taelman's formula.
- `DrinfeldModulesAndTModules:DM.8` — The DM.8 packet's rank-one test and Carlitz logarithms rest on this module.

**Acceptance tests.**
- C(t²) = C(θ²) + C(θ + θ^q) τ + τ².
- For θ = 0 (special characteristic (t)), C(t) = τ and C(t)(x) = x^q: purely inseparable, a single torsion point.
- For θ ≠ 0 and L algebraically closed, C(t)(x) = θ x + x^q is separable of degree q and has exactly q roots, an F_q[t]/(t)-module.

**Dependencies.**
- In this roadmap: `drinfeld-module`, `twisted-polynomial-ring`, `twisted-polynomial-eval`, `rank-polynomial-ring`
- Pinned libraries: `mathlib:Polynomial.aeval`, `mathlib:Polynomial.aeval_X`, `mathlib:Polynomial.algHom_ext`, `mathlib:Polynomial.Separable`, `mathlib:Polynomial.card_rootSet_eq_natDegree`

**Sources.**
- Brownawell–Papanikolas — §2.2, p. 3. The definition C(t) = θ + τ. Prose verbatim from the arXiv PDF's text layer; formulas transcribed.
- Brownawell–Papanikolas — §2.2, p. 3. The module structure C(t)(x) = θx + x^q. Prose verbatim from the arXiv PDF's text layer; formulas transcribed.
- Brownawell–Papanikolas — §2.3, p. 5. Rank one, generic characteristic for ι(a) = a(θ). Prose verbatim from the arXiv PDF's text layer; formulas transcribed.
- Brownawell–Papanikolas — §2.2, p. 4, torsion. The f-torsion, used by the kernel test. Prose verbatim from the arXiv PDF's text layer; formulas transcribed.

### `drinfeld-module-hom` — Morphisms, isogenies and endomorphisms of Drinfeld modules

*definition* · planet **Morphisms and isogenies**

For Drinfeld A-modules φ, ψ over the same (L, γ), Hom(φ, ψ) := {u ∈ L{τ} : u φ_a = ψ_a u for all a ∈ A}, an F_q-subspace of L{τ} and an A-module via a · u := ψ_a u (= u φ_a); an isogeny is a nonzero u ∈ Hom(φ, ψ); End(φ) := Hom(φ, φ) is an A-algebra through a ↦ φ_a; φ ≅ ψ when some u ∈ Hom(φ, ψ) is a unit of L{τ}, i.e. u = C c with c ∈ L^× and ψ_a = c φ_a c⁻¹.

**Hypotheses.**
- F_q a finite field with q elements; L a commutative F_q-algebra (for most results a field containing F_q).
- L a field; φ, ψ Drinfeld A-modules over the same γ.

**Construction, in steps.**
1. Hom(φ, ψ) is closed under addition and F_q-scaling (F_q is central in L{τ}); composition maps Hom(ψ, χ) × Hom(φ, ψ) into Hom(φ, χ).
2. A-module: ψ_a u ∈ Hom(φ, ψ) because A is commutative, and ψ_a u = u φ_a by definition.
3. End(φ) is a subring containing φ(A), central over it, so an A-algebra.
4. Isomorphisms: by tau-degree-mul the units of L{τ} are the C c with c ∈ L^×.

**API.**

| name | role | statement |
|---|---|---|
| `DrinfeldModule.Hom` | constructor | The F_q-submodule {u \| ∀ a, u * φ a = ψ a * u} of L{τ}. |
| `DrinfeldModule.mem_Hom` | characterisation | u ∈ Hom φ ψ ↔ ∀ a, u * φ a = ψ a * u. |
| `DrinfeldModule.Hom.comp_mem` | structure | v ∈ Hom ψ χ → u ∈ Hom φ ψ → v * u ∈ Hom φ χ. |
| `DrinfeldModule.Hom.smul_mem` | structure | u ∈ Hom φ ψ → ψ a * u ∈ Hom φ ψ: the A-module structure. |
| `DrinfeldModule.End` | constructor | The subring Hom φ φ of L{τ}, an A-algebra via a ↦ φ a. |
| `DrinfeldModule.apply_mem_End` | example | φ a ∈ End φ. |
| `DrinfeldModule.IsIsogeny` | data | u ∈ Hom φ ψ ∧ u ≠ 0. |
| `DrinfeldModule.isIso_iff` | characterisation | A unit u of L{τ} lies in Hom φ ψ iff u = C c, c ≠ 0, and ψ a = C c * φ a * C c⁻¹ for all a. |

**Unit tests.** A wrong definition fails one of these.

- `hom.test_apply_mem_End` (computation) — carlitz θ a ∈ End (carlitz θ) for every a.
- `hom.test_constant_endomorphisms` (computation) — C c ∈ End (carlitz θ) iff c ^ q = c, i.e. c ∈ F_q (over a field L).
- `hom.test_different_rank_zero` (non-example) — Hom (carlitz θ) ψ = ⊥ for ψ of rank 2: a definition allowing u ∈ L{τ} with u φ_a = ψ_a u only for a ∈ F_q would contain nonzero elements.
- `hom.test_frobenius_endomorphism` (computation) — Over L = F_q with θ ∈ F_q, τ ∈ End (carlitz θ), since τ commutes with C θ when θ^q = θ: the Frobenius endomorphism of a module over a finite field.

**Where it is used.**
- `isogeny-rank` — Isogenies preserve the rank.
- `DrinfeldModulesAndTModules:DM.1` — Isogenies act on torsion and Tate modules with finite cokernel.
- `DrinfeldModulesAndTModules:DM.2` — Over C∞, Hom(φ_Λ1, φ_Λ2) = {c : c Λ1 ⊆ Λ2}.
- `DrinfeldModulesAndTModules:DM.5` — The Tate conjecture compares Hom(φ, ψ) ⊗ A_λ with Galois-equivariant maps of Tate modules.

**Acceptance tests.**
- φ_a ∈ End(φ) for every a.
- Hom(φ, ψ) = 0 when rank φ ≠ rank ψ (isogeny-rank).
- For the Carlitz module, C c ∈ End(carlitz θ) iff c^q = c, i.e. c ∈ F_q.

**Dependencies.**
- In this roadmap: `drinfeld-module`, `twisted-polynomial-ring`, `tau-degree-mul`

**Sources.**
- Brownawell–Papanikolas — §2.4, p. 7, isogenies. Hom_A and isogenies. Prose verbatim from the arXiv PDF's text layer; formulas transcribed.
- Brownawell–Papanikolas — §2.4, p. 7. Hom as an A-module, End as an A-algebra. Prose verbatim from the arXiv PDF's text layer; formulas transcribed.
- Brownawell–Papanikolas — §2.4, p. 7. Isogeny is an equivalence relation, for modules of the same rank. Prose verbatim from the arXiv PDF's text layer; formulas transcribed.

### `isogeny-rank` — Isogenous Drinfeld modules have the same rank

*theorem*

If φ, ψ are Drinfeld A-modules over the same (L, γ) with L a field, and u ∈ Hom(φ, ψ) is nonzero, then rank φ = rank ψ.

**Hypotheses.**
- F_q a finite field with q elements; L a commutative F_q-algebra (for most results a field containing F_q).
- L a field; A = F_q[t], or A as in rank-general.

**Proof, in steps.**
1. Take a nonconstant a. From u φ_a = ψ_a u and tau-degree-mul, deg_τ u + deg_τ φ_a = deg_τ ψ_a + deg_τ u.
2. So deg_τ φ_a = deg_τ ψ_a, and by the rank relation rank φ · deg a = rank ψ · deg a with deg a > 0.

**Acceptance tests.**
- Carlitz modules carlitz θ and carlitz θ' live over the same γ only when θ = θ', so the theorem compares modules over one fixed γ; for θ = θ' it gives rank 1 = rank 1.
- A rank-1 and a rank-2 module have Hom = 0.
- The theorem uses that L is a domain; over a non-reduced base the degree argument fails.

**Dependencies.**
- In this roadmap: `drinfeld-module-hom`, `tau-degree-mul`, `rank`

**Sources.**
- Brownawell–Papanikolas — §2.4, p. 7. The source restricts isogenies to lattices of the same rank; the node proves rank is forced. Prose verbatim from the arXiv PDF's text layer; formulas transcribed.
- Brownawell–Papanikolas — §2.4, p. 7. The intertwining relation used in the proof. Prose verbatim from the arXiv PDF's text layer; formulas transcribed.

### What DM.0 still needs

- Kernels as group schemes: the kernel of φ_a (and of an isogeny) as the closed subgroup scheme Spec L[X]/(toPolynomial φ_a) of G_a, with its order q^(r deg a), using Tau Ceti's affine group schemes (TauCeti.AdditiveGroup and its kernel constructions); not yet planned.
- Drinfeld modules over a general base S: line bundles E with φ : A → End(E) and invertible leading coefficients (the moduli-functor definition the stage asks for), with base change and the comparison to the field definition; not yet planned.
- The general-A rank theorem rests on FunctionFieldArithmetic:FA.1 (request) and on a proof not read in any source (gap).
- Separability of isogenies in generic characteristic (a nonzero morphism has nonzero constant coefficient) and the Frobenius isogeny τ^n in special characteristic are not yet nodes.

## DM.1 — Torsion, Tate modules and Galois actions

**Objects and theorems.** Torsion φ[a] as a finite flat group scheme of order q^(r deg a) (the degree is `natDegree_toPolynomial_apply` of DM.0), étale exactly when a ∉ charIdeal (`derivative_toPolynomial` shows separability is governed by γ(a)); for a prime λ ≠ charIdeal, the Tate module T_λ φ = lim φ[λⁿ](L^sep), free of rank r over A_λ with a continuous Galois action; and the connected local object at the characteristic prime, kept apart from separable points.

**Dependencies.** DM.0 (the Drinfeld module, rank, evalEnd), SchemeAndStackFoundations:SF.2 (finite flat and étale).

**Status in this checkpoint:** `not_read`. Torsion, finite flatness of φ[a] of degree q^(r deg a), étaleness away from the characteristic, Tate modules free of rank r with continuous Galois action, and the local object at the characteristic prime. Source route: Drinfeld's torsion theory and Rosen ch. 13, neither of which is freely readable; Brownawell–Papanikolas treats only Carlitz torsion (§2.2). Needs a public source.

## DM.2 — Analytic uniformization and lattices

**Objects and theorems.** A-lattices Λ ⊆ C∞, exp_Λ(z) = z ∏'(1 − z/λ), its F_q-linearity and the exact sequence 0 → Λ → C∞ → C∞ → 0, the Drinfeld module φ_Λ with exp_Λ(a z) = φ_Λ(a)(exp_Λ z), Hom(φ_Λ1, φ_Λ2) = {c : c Λ1 ⊆ Λ2}, Drinfeld's uniformization theorem (Theorem 2.1 of the source), and the Carlitz exponential and period π̃ = θ (−θ)^(1/(q−1)) ∏ (1 − θ^(1−q^i))⁻¹.

**Dependencies.** DM.0, FunctionFieldArithmetic:FA.2 (the completion k∞ and C∞).

**Status in this checkpoint:** `not_read`. Lattices, the exponential exp_Λ, the functional equation, Drinfeld's uniformization theorem, the Carlitz exponential and period. Brownawell–Papanikolas §2.4 (read) states these and outlines the proof of Theorem 2.1; a complete proof source (Goss ch. 4, Thakur, Rosen ch. 13) must be acquired. The DM.8 packet already requests the Carlitz exponential from DM.2.

## DM.3 — Moduli, modular forms and compactification

**Objects and theorems.** The moduli stack of rank-r Drinfeld modules with level structure, its representability and smoothness, Hecke correspondences, and Pink's Satake compactification via generalized Drinfeld modules.

**Dependencies.** DM.1, SchemeAndStackFoundations:SF.1 and SF.4.

**Status in this checkpoint:** `not_read`. Moduli stacks, level structures, Hecke correspondences and Pink's Satake compactification (arXiv:1008.0013, public) are not read.

## DM.4 — t-modules and effective t-motives

**Objects and theorems.** Anderson t-modules Φ : F_q[t] → Mat_d(L){τ} with ∂Φ(t) = θ·Id + N, N nilpotent (source §3.1, read), their motives, and Anderson's anti-equivalence between abelian t-modules and abelian t-motives.

**Dependencies.** DM.0 (Mat_d(L){τ} = Mat_d(L{τ}) uses `TwistedPolynomial` entrywise).

**Status in this checkpoint:** `not_read`. Anderson t-modules and t-motives: Brownawell–Papanikolas §3.1 (read) gives the definition over A = F_q[t]; §§3.2–4.6 and Anderson's 1986 paper (the equivalence theorem) are not read. The DM.8 packet requests the motive conventions from DM.4.

## DM.5 — Isogenies and the Tate theorem

**Objects and theorems.** The map Hom(φ, ψ) ⊗ A_λ → Hom_Gal(T_λ φ, T_λ ψ), injective in general and bijective over fields finitely generated over F_q (Taguchi).

**Dependencies.** DM.1, DM.4.

**Status in this checkpoint:** `not_read`. Taguchi's Tate conjecture for t-motives is not read.

## DM.6 — L-values, regulators and class modules

**Objects and theorems.** Taelman's class-number formula for Drinfeld modules over the integral closure of F_q[t] in a finite extension of F_q(t).

**Dependencies.** DM.2, DM.5.

**Status in this checkpoint:** `not_read`. Taelman's class-number formula (arXiv:1004.4304, public) is not read.

## DM.7 — Elliptic sheaves and shtuka realizations

**Objects and theorems.** Drinfeld's elliptic sheaves and the shtuka realisations of Drinfeld modules.

**Dependencies.** DM.0, GlobalShtukasAndFunctionFieldLanglands (packet exists).

**Status in this checkpoint:** `not_read`. Elliptic sheaves and shtuka realisations are not read; GlobalShtukasAndFunctionFieldLanglands has a packet to import from.

## Requests, gaps and sources

- **Request to `FunctionFieldArithmetic:FA.1`** (for `rank-general`): The ring A of functions on a smooth projective geometrically irreducible curve over F_q regular away from a closed point ∞, as a Dedekind domain finitely generated over F_q with #(A/(a)) = q^(deg a) for nonzero a (deg the degree at ∞), and the fact that a discrete valuation of Frac(A), trivial on F_q and ≤ 0 on A, is a positive multiple of the valuation at ∞ (∞ is the only place not coming from a prime of A). Riemann–Roch in the form: elements of A of every sufficiently large degree exist.
- **Gap — Proof of the characterisation of F_q-linear polynomials.** Brownawell–Papanikolas identify L{τ} with End_L(G_a) without proof. The node's proof (additivity forces p-power exponents by Lucas' theorem, F_q-homogeneity forces q-power exponents) is standard but was not checked against a published proof; Goss, Basic Structures §1.1 and Papikian, Drinfeld Modules ch. 3 contain one but are not freely available.
- **Gap — Proof of the rank theorem for general A.** The source states deg_τ φ(a) = r deg(a) and refers to Goss §4.5, not available here. The node's valuation-theoretic proof depends on FunctionFieldArithmetic:FA.1 facts that have no packet yet (request), and its integrality step needs checking.
- **Gap — No freely readable source for DM.1–DM.3, DM.5.** The stages' named routes (Drinfeld's 'Elliptic modules', Rosen chs. 12–13, Goss, Taguchi) are books or journal papers without public copies. Candidates to check: Pink's lecture notes and arXiv:1008.0013 (DM.3), Taelman arXiv:1004.4304 (DM.6), Anderson–Brownawell–Papanikolas arXiv:math/0207168 (DM.4, DM.8).
- **Source.** W. Dale Brownawell and Matthew A. Papanikolas, *A rapid introduction to Drinfeld modules, t-modules, and t-motives*, arXiv:1806.03919v1, 11 June 2018, the only version on arXiv (its abstract page gives no journal reference). sha256 `08b68132a113d44e588d95fbf4995f68d350f84cf212d24b716263d69272b82d`. Read in full by cc-fb70e5 on 2026-09-28: §1 (exponential functions, pp. 1–3), §2.1–2.5 (table of symbols, the Carlitz module, Drinfeld modules, Drinfeld modules and lattices, the Weierstraß–Drinfeld dictionary, pp. 3–8) and §3.1 (t-module definitions, pp. 8–9). Not read for this checkpoint: §§3.2–4.6 (tensor powers, quasi-periodic and divided-derivative t-modules, t-motives, dual t-motives, rigid analytic triviality), which serve DM.4 and DM.8.
- **Source issues.** None found in the sections read (the packet's `sourceIssues` list is empty, meaning checked and none found).
