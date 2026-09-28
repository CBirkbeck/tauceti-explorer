import Mathlib.RingTheory.PolynomialLaw.Basic
import Mathlib.LinearAlgebra.Matrix.Determinant.Basic
import Mathlib.RingTheory.TensorProduct.Basic
import Mathlib.RingTheory.MatrixAlgebra
import Mathlib.Algebra.Polynomial.Monic
import Mathlib.Algebra.MonoidAlgebra.Basic
import Mathlib.GroupTheory.Perm.Cycle.Factors
import Mathlib.GroupTheory.Perm.Sign
import Mathlib.LinearAlgebra.Matrix.Charpoly.Basic
import Mathlib.LinearAlgebra.Matrix.Trace

/-!
# Suggested Lean forms: polynomial laws and determinants (IntegralHeckeAndGaloisDeterminants, IHG.0)

**Standard note.** This file is not the roadmap and it is not exhaustive. The roadmap document
(`IntegralHeckeAndGaloisDeterminants`) is definitive. The statements below suggest Lean forms,
so that contributors and reviewers converge on names and signatures. Every proof of a new
declaration is `sorry`; nothing here claims to be formalised.

Pinned baseline: Mathlib `082e2d3`, Tau Ceti `f790474`.

## Conventions

* Polynomial laws are Mathlib's `PolynomialLaw` (`M →ₚₗ[A] N`); coefficient algebras `S` live in
  the universe of `A`, as in `PolynomialLaw.toFun'`.
* A determinant of dimension `d` on an `A`-algebra `R` (Chenevier) is a structure bundling a law
  `R →ₚₗ[A] A` with homogeneity of degree `d` and multiplicativity after every scalar extension.
* The characteristic polynomial is `D_{A[t]}(t - x)`, transported along `A[t] ⊗_A A ≅ A[t]`.
* Pseudocharacters use the explicit cycle expansion `T^σ` (one factor per cycle, fixed points
  included).
* Injectivity of `D ↦ Tr` is stated with `d! ∈ Aˣ`, which Chenevier's Proposition 1.27 omits
  (source issue E1).
-/

universe u

open TensorProduct Polynomial

noncomputable section

namespace TauCeti

variable {A : Type u} [CommRing A]

namespace PolynomialLaw

variable {M N : Type*} [AddCommGroup M] [Module A M] [AddCommGroup N] [Module A N]

/-- **`IHG.0/homogeneous-polynomial-law`**. `f` is homogeneous of degree `n`:
`f_S(s • x) = s ^ n • f_S(x)` for every commutative `A`-algebra `S`. -/
def IsHomogeneousOfDegree (n : ℕ) (f : M →ₚₗ[A] N) : Prop :=
  ∀ (S : Type u) [CommRing S] [Algebra A S] (s : S) (x : S ⊗[A] M),
    f.toFun' S (s • x) = s ^ n • f.toFun' S x

variable {R B : Type*} [Ring R] [Algebra A R] [Ring B] [Algebra A B]

/-- **`IHG.0/multiplicative-polynomial-law`**. `f` sends `1` to `1` and products to products after
every scalar extension to a commutative `A`-algebra. -/
def IsMultiplicative (f : R →ₚₗ[A] B) : Prop :=
  ∀ (S : Type u) [CommRing S] [Algebra A S],
    f.toFun' S 1 = 1 ∧ ∀ x y : S ⊗[A] R, f.toFun' S (x * y) = f.toFun' S x * f.toFun' S y

/-- API: the zero law is homogeneous of every degree. -/
theorem isHomogeneousOfDegree_zero (n : ℕ) : IsHomogeneousOfDegree n (0 : M →ₚₗ[A] N) := sorry

/-- API: homogeneous laws of degree `n` are closed under addition. -/
theorem IsHomogeneousOfDegree.add {n : ℕ} {f g : M →ₚₗ[A] N} (hf : IsHomogeneousOfDegree n f)
    (hg : IsHomogeneousOfDegree n g) : IsHomogeneousOfDegree n (f + g) := sorry

/-- API: composition multiplies degrees. -/
theorem IsHomogeneousOfDegree.comp {P : Type*} [AddCommGroup P] [Module A P] {m n : ℕ}
    {g : N →ₚₗ[A] P} {f : M →ₚₗ[A] N} (hg : IsHomogeneousOfDegree m g)
    (hf : IsHomogeneousOfDegree n f) : IsHomogeneousOfDegree (m * n) (g.comp f) := sorry

/-- API (Chenevier, Example 1.2(i)): degree-one laws are the base changes of linear maps. -/
theorem isHomogeneousOfDegree_one_iff (f : M →ₚₗ[A] N) :
    IsHomogeneousOfDegree 1 f ↔ ∃ ℓ : M →ₗ[A] N, ∀ (S : Type u) [CommRing S] [Algebra A S]
      (x : S ⊗[A] M), f.toFun' S x = ℓ.lTensor S x := sorry

/-- API: the identity law is multiplicative. -/
theorem isMultiplicative_id : IsMultiplicative (PolynomialLaw.id : R →ₚₗ[A] R) := sorry

/-- API: multiplicative laws compose. -/
theorem IsMultiplicative.comp {C : Type*} [Ring C] [Algebra A C] {g : B →ₚₗ[A] C}
    {f : R →ₚₗ[A] B} (hg : IsMultiplicative g) (hf : IsMultiplicative f) :
    IsMultiplicative (g.comp f) := sorry

end PolynomialLaw

/-- **`IHG.0/determinant`** (Chenevier, §1.5). A `d`-dimensional `A`-valued determinant on an
`A`-algebra `R`: a multiplicative `A`-polynomial law `R → A`, homogeneous of degree `d`. -/
structure Determinant (A : Type u) [CommRing A] (R : Type*) [Ring R] [Algebra A R] (d : ℕ) where
  /-- The underlying polynomial law. -/
  toLaw : R →ₚₗ[A] A
  isHomogeneous : PolynomialLaw.IsHomogeneousOfDegree d toLaw
  isMultiplicative : PolynomialLaw.IsMultiplicative toLaw

namespace Determinant

variable {R : Type*} [Ring R] [Algebra A R] {d : ℕ}

/-- The value `D(x) ∈ A`. -/
def eval (D : Determinant A R d) (x : R) : A := D.toLaw.ground x

/-- **`IHG.0/characteristic-polynomial`**. `χ(x, t) := D_{A[t]}(t - x)`. -/
def charpoly (D : Determinant A R d) (x : R) : A[X] :=
  Algebra.TensorProduct.rid A A A[X] (D.toLaw.toFun' A[X] ((X : A[X]) ⊗ₜ[A] (1 : R) - 1 ⊗ₜ[A] x))

/-- The trace `Λ₁ = -(coefficient of t^{d-1})`. -/
def trace (D : Determinant A R d) (x : R) : A := -(D.charpoly x).coeff (d - 1)

/-- API: `D` is multiplicative on `R`. -/
theorem eval_mul (D : Determinant A R d) (x y : R) : D.eval (x * y) = D.eval x * D.eval y := sorry

/-- API: `D(1) = 1`. -/
theorem eval_one (D : Determinant A R d) : D.eval 1 = 1 := sorry

/-- API: `D(a x) = a ^ d D(x)`. -/
theorem eval_smul (D : Determinant A R d) (a : A) (x : R) : D.eval (a • x) = a ^ d * D.eval x :=
  sorry

/-- API: units go to units. -/
theorem isUnit_eval (D : Determinant A R d) {x : R} (hx : IsUnit x) : IsUnit (D.eval x) := sorry

/-- API: `χ(x, t)` is monic of degree `d`. -/
theorem charpoly_monic (D : Determinant A R d) (x : R) : (D.charpoly x).Monic := sorry

theorem charpoly_natDegree [Nontrivial A] (D : Determinant A R d) (x : R) :
    (D.charpoly x).natDegree = d := sorry

/-- API: the constant coefficient is `(-1)^d D(x)`. -/
theorem charpoly_coeff_zero (D : Determinant A R d) (x : R) :
    (D.charpoly x).coeff 0 = (-1) ^ d * D.eval x := sorry

/-- API: the trace is `A`-linear. -/
def traceLinear (D : Determinant A R d) : R →ₗ[A] A where
  toFun := D.trace
  map_add' := sorry
  map_smul' := sorry

/-- API: `Tr(1) = d`. -/
theorem trace_one (D : Determinant A R d) : D.trace 1 = d := sorry

/-- **`IHG.0/determinant-one-add-mul-comm`** (Chenevier, Lemma 1.12(i)). -/
theorem eval_one_add_mul_comm (D : Determinant A R d) (r r' : R) :
    D.eval (1 + r * r') = D.eval (1 + r' * r) := sorry

/-- **`IHG.0/determinant-of-matrix-representation`**. `det ∘ ρ` for an `A`-algebra map
`ρ : R → M_d(A)`. -/
def ofMatrix (ρ : R →ₐ[A] Matrix (Fin d) (Fin d) A) : Determinant A R d := sorry

theorem eval_ofMatrix (ρ : R →ₐ[A] Matrix (Fin d) (Fin d) A) (x : R) :
    (ofMatrix ρ).eval x = (ρ x).det := sorry

theorem trace_ofMatrix (ρ : R →ₐ[A] Matrix (Fin d) (Fin d) A) (x : R) :
    (ofMatrix ρ).trace x = (ρ x).trace := sorry

theorem charpoly_ofMatrix (ρ : R →ₐ[A] Matrix (Fin d) (Fin d) A) (x : R) :
    (ofMatrix ρ).charpoly x = Matrix.charpoly (ρ x) := sorry

/-- API: conjugate representations have the same determinant. -/
theorem ofMatrix_conj (ρ : R →ₐ[A] Matrix (Fin d) (Fin d) A) (P : (Matrix (Fin d) (Fin d) A)ˣ)
    (ρ' : R →ₐ[A] Matrix (Fin d) (Fin d) A) (h : ∀ x, ρ' x = P * ρ x * P⁻¹) :
    ofMatrix ρ' = ofMatrix ρ := sorry

/-- **`IHG.0/determinant-direct-sum`**. The product of determinants of dimensions `d₁` and `d₂`
is a determinant of dimension `d₁ + d₂` (the direct sum). -/
def mul {d₁ d₂ : ℕ} (D₁ : Determinant A R d₁) (D₂ : Determinant A R d₂) :
    Determinant A R (d₁ + d₂) := sorry

theorem eval_mul_det {d₁ d₂ : ℕ} (D₁ : Determinant A R d₁) (D₂ : Determinant A R d₂) (x : R) :
    (D₁.mul D₂).eval x = D₁.eval x * D₂.eval x := sorry

theorem trace_mul_det {d₁ d₂ : ℕ} (D₁ : Determinant A R d₁) (D₂ : Determinant A R d₂) (x : R) :
    (D₁.mul D₂).trace x = D₁.trace x + D₂.trace x := sorry

theorem charpoly_mul_det {d₁ d₂ : ℕ} (D₁ : Determinant A R d₁) (D₂ : Determinant A R d₂)
    (x : R) : (D₁.mul D₂).charpoly x = D₁.charpoly x * D₂.charpoly x := sorry

/-- **`IHG.0/determinant-restriction`**. Pull back along an `A`-algebra map (for instance
`A[H] → A[G]` for a subgroup `H ≤ G`). -/
def comap {R' : Type*} [Ring R'] [Algebra A R'] (φ : R' →ₐ[A] R) (D : Determinant A R d) :
    Determinant A R' d := sorry

theorem eval_comap {R' : Type*} [Ring R'] [Algebra A R'] (φ : R' →ₐ[A] R)
    (D : Determinant A R d) (x : R') : (D.comap φ).eval x = D.eval (φ x) := sorry

theorem comap_id (D : Determinant A R d) : D.comap (AlgHom.id A R) = D := sorry

theorem comap_comp {R' R'' : Type*} [Ring R'] [Algebra A R'] [Ring R''] [Algebra A R'']
    (ψ : R' →ₐ[A] R) (φ : R'' →ₐ[A] R') (D : Determinant A R d) :
    D.comap (ψ.comp φ) = (D.comap ψ).comap φ := sorry

/-- **`IHG.0/determinant-base-change`**. Scalar extension to a commutative `A`-algebra `S`. -/
def baseChange (D : Determinant A R d) (S : Type u) [CommRing S] [Algebra A S] :
    Determinant S (S ⊗[A] R) d := sorry

theorem eval_baseChange_tmul (D : Determinant A R d) (S : Type u) [CommRing S] [Algebra A S]
    (x : R) : (D.baseChange S).eval (1 ⊗ₜ x) = algebraMap A S (D.eval x) := sorry

theorem charpoly_baseChange_tmul (D : Determinant A R d) (S : Type u) [CommRing S]
    [Algebra A S] (x : R) :
    (D.baseChange S).charpoly (1 ⊗ₜ x) = (D.charpoly x).map (algebraMap A S) := sorry

theorem trace_baseChange_tmul (D : Determinant A R d) (S : Type u) [CommRing S] [Algebra A S]
    (x : R) : (D.baseChange S).trace (1 ⊗ₜ x) = algebraMap A S (D.trace x) := sorry

/-- **`IHG.0/determinant-dimension-one`**. One-dimensional determinants are `A`-algebra maps
`R → A`. -/
def dimOneEquiv : Determinant A R 1 ≃ (R →ₐ[A] A) := sorry

end Determinant

section Pseudocharacter

variable {R : Type*} [Ring R] [Algebra A R]

/-- The product of `x` along the cycle of `σ` through `i`, starting at `i`:
`x_i * x_{σ i} * ⋯`. -/
def cycleProduct {n : ℕ} (σ : Equiv.Perm (Fin n)) (x : Fin n → R) (i : Fin n) : R :=
  ((List.range (Function.minimalPeriod σ i)).map fun k ↦ x ((σ ^ k) i)).prod

/-- `T^σ(x) = ∏_{cycles c of σ} T(product of x along c)`, one factor per cycle (its least
element), fixed points included. -/
def cycleTerm {n : ℕ} (T : R → A) (σ : Equiv.Perm (Fin n)) (x : Fin n → R) : A :=
  ∏ i ∈ Finset.univ.filter (fun i ↦ ∀ j, σ.SameCycle i j → i ≤ j), T (cycleProduct σ x i)

/-- **`IHG.0/pseudocharacter`**. A `d`-dimensional pseudocharacter: an `A`-linear central
`T : R → A` with `T(1) = d` and the pseudocharacter identity
`∑_{σ ∈ S_{d+1}} sgn(σ) T^σ(x₁, …, x_{d+1}) = 0`. -/
def IsPseudocharacter (d : ℕ) (T : R →ₗ[A] A) : Prop :=
  T 1 = d ∧ (∀ x y : R, T (x * y) = T (y * x)) ∧
    ∀ x : Fin (d + 1) → R,
      ∑ σ : Equiv.Perm (Fin (d + 1)), (Equiv.Perm.sign σ : ℤ) • cycleTerm T σ x = 0

/-- **`IHG.0/trace-pseudocharacter`** (Chenevier, Lemma 1.12(iii)). -/
theorem Determinant.isPseudocharacter_trace {d : ℕ} (D : Determinant A R d) :
    IsPseudocharacter d D.traceLinear := sorry

/-- **`IHG.0/determinant-trace-injective`** (Chenevier, Proposition 1.27, with the hypothesis
`d! ∈ Aˣ` its proof uses; source issue E1). -/
theorem Determinant.injective_trace {d : ℕ} (hd : IsUnit (d.factorial : A)) :
    Function.Injective (fun D : Determinant A R d ↦ D.traceLinear) := sorry

/-- **`IHG.0/determinant-trace-bijective-rational`** (Chenevier, Proposition 1.27). Over a
`ℚ`-algebra every pseudocharacter is the trace of a unique determinant. -/
theorem Determinant.exists_unique_trace_eq [Algebra ℚ A] {d : ℕ} (T : R →ₗ[A] A)
    (hT : IsPseudocharacter d T) : ∃! D : Determinant A R d, D.traceLinear = T := sorry

/-- **`IHG.0/determinant-trace-bijective-small`** (Chenevier, Proposition 1.29). The same when
`(2d)!` is invertible, or `d = 2` and `2` is invertible. -/
theorem Determinant.exists_unique_trace_eq_of_isUnit {d : ℕ}
    (hd : IsUnit ((2 * d).factorial : A) ∨ (d = 2 ∧ IsUnit (2 : A))) (T : R →ₗ[A] A)
    (hT : IsPseudocharacter d T) : ∃! D : Determinant A R d, D.traceLinear = T := sorry

end Pseudocharacter

section DimensionTwo

variable (G : Type*) [Group G]

/-- **`IHG.0/determinant-dimension-two`** (Chenevier, Lemma 1.9). Two-dimensional determinants on
a group are pairs `(T, D)` with `D : G → Aˣ` a homomorphism, `T(1) = 2`, `T(gh) = T(hg)` and
`D(g) T(g⁻¹h) - T(g) T(h) + T(gh) = 0`. -/
def dimTwoEquiv : Determinant A (MonoidAlgebra A G) 2 ≃
    {p : (G →* Aˣ) × (G → A) // p.2 1 = 2 ∧ (∀ g h, p.2 (g * h) = p.2 (h * g)) ∧
      ∀ g h, (p.1 g : A) * p.2 (g⁻¹ * h) - p.2 g * p.2 h + p.2 (g * h) = 0} := sorry

end DimensionTwo

namespace SuggestedTest

open TauCeti TauCeti.PolynomialLaw

variable {A : Type u} [CommRing A]

/-- The identity law is homogeneous of degree one. -/
example : IsHomogeneousOfDegree 1 (PolynomialLaw.id : A →ₚₗ[A] A) := sorry

/-- Chenevier, Example 1.2(iii): over `𝔽_p`, a law homogeneous of degree `p + 1` vanishes on
`𝔽_p`-points without being zero (`XY^p - X^pY`). -/
example (p : ℕ) [Fact p.Prime] : ∃ P : (Fin 2 → ZMod p) →ₚₗ[ZMod p] ZMod p,
    IsHomogeneousOfDegree (p + 1) P ∧ P.ground = 0 ∧ P ≠ 0 := sorry

/-- A degree-one law that is not multiplicative: twice the identity. -/
example [Nontrivial A] [NoZeroDivisors A] [CharZero A] :
    ¬ IsMultiplicative ((2 : A) • (PolynomialLaw.id : A →ₚₗ[A] A)) := sorry

/-- The matrix determinant is a determinant of dimension `d`. -/
example (d : ℕ) (M : Matrix (Fin d) (Fin d) A) :
    (Determinant.ofMatrix (AlgHom.id A (Matrix (Fin d) (Fin d) A))).eval M = M.det := sorry

/-- A determinant of dimension zero is constant `1`. -/
example {R : Type*} [Ring R] [Algebra A R] (D : Determinant A R 0) (x : R) : D.eval x = 1 := sorry

/-- `χ(1, t) = (t - 1)^d`. -/
example {R : Type*} [Ring R] [Algebra A R] {d : ℕ} (D : Determinant A R d) :
    D.charpoly 1 = (X - 1) ^ d := sorry

/-- The trace does not determine the determinant in characteristic `p ≤ d` (source issue E1): over
`(ℤ/p)[X]`, the determinants of `Y ↦ 1·I_p` and `Y ↦ X·I_p` on `A[Y]` have the same trace `0`. -/
example (p : ℕ) [Fact p.Prime] : ∃ D₁ D₂ : Determinant (Polynomial (ZMod p))
    (Polynomial (Polynomial (ZMod p))) p, D₁.traceLinear = D₂.traceLinear ∧ D₁ ≠ D₂ := sorry

/-- The matrix trace is a `d`-dimensional pseudocharacter. -/
example (d : ℕ) : IsPseudocharacter d (Matrix.traceLinearMap (Fin d) A A) := sorry

/-- The trace of `M₂(ℚ)` is not a one-dimensional pseudocharacter. -/
example : ¬ IsPseudocharacter 1 (Matrix.traceLinearMap (Fin 2) ℚ ℚ) := sorry

/-- The identity character of `ℚ` is a one-dimensional pseudocharacter. -/
example : IsPseudocharacter 1 (LinearMap.id : ℚ →ₗ[ℚ] ℚ) := sorry

end SuggestedTest

end TauCeti
