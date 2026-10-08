import Mathlib.Algebra.Algebra.Prod
import Mathlib.Algebra.Azumaya.Defs
import Mathlib.Algebra.Category.AlgCat.Basic
import Mathlib.Algebra.Category.CommAlgCat.Basic
import Mathlib.Algebra.Category.ModuleCat.Abelian
import Mathlib.Algebra.Category.ModuleCat.ChangeOfRings
import Mathlib.Algebra.Category.ModuleCat.Ext.Finite
import Mathlib.Algebra.DualNumber
import Mathlib.Algebra.Homology.DerivedCategory.Ext.Map
import Mathlib.Algebra.Homology.DerivedCategory.HomologySequence
import Mathlib.Algebra.Homology.DerivedCategory.Linear
import Mathlib.Algebra.Homology.HomotopyCategory
import Mathlib.Algebra.Module.Projective
import Mathlib.Algebra.MonoidAlgebra.Basic
import Mathlib.Algebra.Polynomial.Laurent
import Mathlib.Algebra.Polynomial.Monic
import Mathlib.Algebra.Quaternion
import Mathlib.Analysis.Normed.Field.Basic
import Mathlib.Basic.Real.Basic
import Mathlib.FieldTheory.IsAlgClosed.Basic
import Mathlib.GroupTheory.Perm.Cycle.Factors
import Mathlib.GroupTheory.Perm.Sign
import Mathlib.GroupTheory.QuotientGroup.Defs
import Mathlib.LinearAlgebra.Complex.Module
import Mathlib.LinearAlgebra.DirectSum.Finsupp
import Mathlib.LinearAlgebra.ExteriorPower.Basic
import Mathlib.LinearAlgebra.Matrix.Charpoly.Basic
import Mathlib.LinearAlgebra.Matrix.Determinant.Basic
import Mathlib.LinearAlgebra.Matrix.ToLin
import Mathlib.LinearAlgebra.Matrix.Trace
import Mathlib.LinearAlgebra.SymmetricAlgebra.Basic
import Mathlib.LinearAlgebra.TensorPower.Basic
import Mathlib.RingTheory.AdicCompletion.Algebra
import Mathlib.RingTheory.Congruence.Hom
import Mathlib.RingTheory.DiscreteValuationRing.Basic
import Mathlib.RingTheory.DividedPowerAlgebra.Init
import Mathlib.RingTheory.Finiteness.Basic
import Mathlib.RingTheory.Henselian
import Mathlib.RingTheory.Ideal.Quotient.Basic
import Mathlib.RingTheory.Ideal.Quotient.Defs
import Mathlib.RingTheory.Ideal.Quotient.Operations
import Mathlib.RingTheory.Idempotents
import Mathlib.RingTheory.LocalRing.ResidueField.Basic
import Mathlib.RingTheory.LocalRing.ResidueField.Defs
import Mathlib.RingTheory.Localization.FractionRing
import Mathlib.RingTheory.MatrixAlgebra
import Mathlib.RingTheory.MvPolynomial.Basic
import Mathlib.RingTheory.Nilpotent.Defs
import Mathlib.RingTheory.PolynomialLaw.Basic
import Mathlib.RingTheory.Regular.RegularSequence
import Mathlib.RingTheory.TensorProduct.Basic
import Mathlib.RingTheory.TensorProduct.MvPolynomial
import Mathlib.RingTheory.TwoSidedIdeal.Operations
import Mathlib.Topology.Algebra.Group.Basic
import Mathlib.Topology.Algebra.Nonarchimedean.AdicTopology
import Mathlib.Topology.Instances.Matrix
import Mathlib.Topology.MetricSpace.Ultra.Basic

/-!
# Suggested Lean forms: Integral Hecke actions, determinants and interpolation (IHG.0–IHG.6)

**Standard note.** This file is not the roadmap and it is not exhaustive. The roadmap document
(`README.md`) is definitive. The statements below suggest Lean forms,
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
  (the Newton reconstruction uses this invertibility).
-/

universe u w

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
def trace (D : Determinant A R d) (x : R) : A :=
  if d = 0 then 0 else -(D.charpoly x).coeff (d - 1)

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
`d! ∈ Aˣ` used in Newton reconstruction). -/
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

section KernelsAndCayleyHamilton

namespace PolynomialLaw

variable {M N : Type*} [AddCommGroup M] [Module A M] [AddCommGroup N] [Module A N]

/-- **`IHG.0/polynomial-law-kernel`** (Chenevier §1.17). `x ∈ Ker(P)` iff
`P_S(b ⊗ x + m) = P_S(m)` for every commutative `A`-algebra `S`, `b ∈ S`, `m ∈ S ⊗ M`. -/
def ker (f : M →ₚₗ[A] N) : Submodule A M where
  carrier := {x | ∀ (S : Type u) [CommRing S] [Algebra A S] (b : S) (m : S ⊗[A] M),
    f.toFun' S (b ⊗ₜ x + m) = f.toFun' S m}
  add_mem' := sorry
  zero_mem' := sorry
  smul_mem' := sorry

/-- `P` is faithful if its kernel is zero. -/
def IsFaithful (f : M →ₚₗ[A] N) : Prop := ker f = ⊥

/-- IHG.0/law-of-linear-map: the degree-one law of a linear map. -/
def ofLinearMap (ℓ : M →ₗ[A] N) : M →ₚₗ[A] N where
  toFun' S _ _ := ℓ.lTensor S
  isCompat' := sorry

theorem ofLinearMap_ground (ℓ : M →ₗ[A] N) : (ofLinearMap ℓ).ground = ℓ := sorry

/-- **`IHG.0/polynomial-law-factors-through-kernel`** (Chenevier, Lemma 1.18(i)). `P` factors
through `M ⧸ K` exactly when `K ≤ Ker(P)`. -/
theorem exists_factor_iff_le_ker (f : M →ₚₗ[A] N) (K : Submodule A M) :
    (∃ g : (M ⧸ K) →ₚₗ[A] N, g.comp (ofLinearMap K.mkQ) = f) ↔ K ≤ ker f := sorry

/-- **`IHG.0/kernel-quotient-faithful`** (Chenevier, Lemma 1.18(ii)). -/
theorem isFaithful_factor (f : M →ₚₗ[A] N) (g : (M ⧸ ker f) →ₚₗ[A] N)
    (hg : g.comp (ofLinearMap (ker f).mkQ) = f) : IsFaithful g := sorry

/-- **`IHG.0/kernel-base-change`** (Chenevier, Lemma 1.18(iii)). For `x ∈ Ker(P)` and every
commutative `A`-algebra `S`, the element `b ⊗ x` lies in the kernel of `P` after scalar extension
to `S`, in the sense that `P_{S'}(s' • (b ⊗ x) + m) = P_{S'}(m)` for all `S`-algebras `S'`. -/
theorem tmul_mem_ker_baseChange (f : M →ₚₗ[A] N) {x : M} (hx : x ∈ ker f) (S : Type u)
    [CommRing S] [Algebra A S] (b : S) (m : S ⊗[A] M) :
    f.toFun' S (b ⊗ₜ x + m) = f.toFun' S m := sorry

end PolynomialLaw

namespace Determinant

variable {R : Type*} [Ring R] [Algebra A R] {d : ℕ}

/-- The kernel of a determinant. -/
abbrev ker (D : Determinant A R d) : Submodule A R := PolynomialLaw.ker D.toLaw

/-- **`IHG.0/determinant-kernel-characterisation`** (Chenevier, Lemma 1.19(i)). `r ∈ Ker(D)` iff
`D_S(1 + r r') = 1` for every commutative `A`-algebra `S` and `r' ∈ S ⊗ R`, iff the same with
`r' r`. -/
theorem mem_ker_iff (D : Determinant A R d) (r : R) :
    r ∈ D.ker ↔ ∀ (S : Type u) [CommRing S] [Algebra A S] (r' : S ⊗[A] R),
      D.toLaw.toFun' S (1 + (1 ⊗ₜ r) * r') = 1 := sorry

theorem mem_ker_iff' (D : Determinant A R d) (r : R) :
    r ∈ D.ker ↔ ∀ (S : Type u) [CommRing S] [Algebra A S] (r' : S ⊗[A] R),
      D.toLaw.toFun' S (1 + r' * (1 ⊗ₜ r)) = 1 := sorry

/-- **`IHG.0/determinant-kernel-ideal`** (Chenevier, Lemma 1.19(ii)). The kernel is a two-sided
ideal; it is proper when `d > 0` and `R` is nontrivial. -/
def kerTwoSided (D : Determinant A R d) : TwoSidedIdeal R := sorry

theorem mem_kerTwoSided (D : Determinant A R d) (r : R) : r ∈ D.kerTwoSided ↔ r ∈ D.ker := sorry

theorem kerTwoSided_ne_top [Nontrivial R] (D : Determinant A R d) (hd : 0 < d) :
    D.kerTwoSided ≠ ⊤ := sorry

/-- **`IHG.0/characteristic-polynomial-law`**. The polynomial law
`χ : R → R, r ↦ r^d - Λ₁(r) r^{d-1} + ⋯ + (-1)^d Λ_d(r)`. -/
def charpolyLaw (D : Determinant A R d) : R →ₚₗ[A] R := sorry

theorem isHomogeneousOfDegree_charpolyLaw (D : Determinant A R d) :
    PolynomialLaw.IsHomogeneousOfDegree d D.charpolyLaw := sorry

/-- `χ_α(r₁, …, rₙ)`: the coefficient of `t^α` in `χ(t₁ r₁ + ⋯ + tₙ rₙ)`. -/
def chiCoeff (D : Determinant A R d) {n : ℕ} (r : Fin n → R) (α : Fin n →₀ ℕ) : R :=
  TensorProduct.finsuppScalarLeft A R (Fin n →₀ ℕ)
    ((MvPolynomial.basisMonomials (Fin n) A).repr.rTensor R
      (D.charpolyLaw.toFun' (MvPolynomial (Fin n) A)
        (∑ i, (MvPolynomial.X i : MvPolynomial (Fin n) A) ⊗ₜ[A] r i))) α

/-- **`IHG.0/cayley-hamilton-identity`** (Chenevier, Lemma 1.12(iv)). -/
theorem eval_one_add_chiCoeff_mul (D : Determinant A R d) {n : ℕ} (r₀ : R) (r : Fin n → R)
    (α : Fin n →₀ ℕ) : D.eval (1 + D.chiCoeff r α * r₀) = 1 := sorry

/-- **`IHG.1/cayley-hamilton-ideal`** (Chenevier §1.17). `CH(D)`, the two-sided ideal generated by
all `χ_α(r₁, …, rₙ)`. -/
def chIdeal (D : Determinant A R d) : TwoSidedIdeal R :=
  TwoSidedIdeal.span {c | ∃ (n : ℕ) (r : Fin n → R) (α : Fin n →₀ ℕ), c = D.chiCoeff r α}

theorem chiCoeff_mem_chIdeal (D : Determinant A R d) {n : ℕ} (r : Fin n → R) (α : Fin n →₀ ℕ) :
    D.chiCoeff r α ∈ D.chIdeal := sorry

/-- **`IHG.1/cayley-hamilton`**. `D` is Cayley–Hamilton if `CH(D) = 0`. -/
def IsCayleyHamilton (D : Determinant A R d) : Prop := D.chIdeal = ⊥

/-- API: Cayley–Hamilton iff the law `χ` vanishes identically. -/
theorem isCayleyHamilton_iff (D : Determinant A R d) :
    D.IsCayleyHamilton ↔ D.charpolyLaw = 0 := sorry

/-- **`IHG.1/cayley-hamilton-base-change`**. -/
theorem IsCayleyHamilton.baseChange {D : Determinant A R d} (hD : D.IsCayleyHamilton)
    (S : Type u) [CommRing S] [Algebra A S] : (D.baseChange S).IsCayleyHamilton := sorry

/-- **`IHG.1/cayley-hamilton-subalgebra`** (Chenevier, Example 1.20(ii)). -/
theorem IsCayleyHamilton.comap {R' : Type*} [Ring R'] [Algebra A R'] {φ : R' →ₐ[A] R}
    (hφ : Function.Injective φ) {D : Determinant A R d} (hD : D.IsCayleyHamilton) :
    (D.comap φ).IsCayleyHamilton := sorry

/-- **`IHG.1/kernel-contains-cayley-hamilton`** (Chenevier, Lemma 1.21). -/
theorem chIdeal_le_kerTwoSided (D : Determinant A R d) : D.chIdeal ≤ D.kerTwoSided := sorry

/-- **`IHG.1/faithful-cayley-hamilton`** (Chenevier, Lemma 1.21). -/
theorem IsFaithful.isCayleyHamilton {D : Determinant A R d}
    (hD : PolynomialLaw.IsFaithful D.toLaw) : D.IsCayleyHamilton := sorry

/-- **`IHG.0/determinant-coefficient-subring`**. The coefficient subring. -/
def coefficientSubring {G : Type*} [Monoid G]
    (D : Determinant A (MonoidAlgebra A G) d) : Subring A :=
  Subring.closure {a | ∃ (g : G) (i : ℕ),
    a = (D.charpoly (MonoidAlgebra.of A G g)).coeff i}

/-- Corollary 1.14: the entire law descends, not just its named coefficients.
The scalar-extension/group-algebra identification is expressed on every coefficient algebra. -/
theorem exists_restrict_coefficients {G : Type u} [Monoid G]
    (D : Determinant A (MonoidAlgebra A G) d) :
    ∃ D₀ : Determinant D.coefficientSubring (MonoidAlgebra D.coefficientSubring G) d,
      ∀ (S : Type u) [CommRing S] [Algebra A S]
        [Algebra D.coefficientSubring S] [IsScalarTower D.coefficientSubring A S]
        (φ : S ⊗[D.coefficientSubring] MonoidAlgebra D.coefficientSubring G →ₐ[S]
          S ⊗[A] MonoidAlgebra A G)
        (hφ : ∀ g : G, φ (1 ⊗ₜ MonoidAlgebra.of D.coefficientSubring G g) =
          1 ⊗ₜ MonoidAlgebra.of A G g)
        (x : S ⊗[D.coefficientSubring] MonoidAlgebra D.coefficientSubring G),
        Algebra.TensorProduct.rid D.coefficientSubring S S (D₀.toLaw.toFun' S x) =
          Algebra.TensorProduct.rid A S S (D.toLaw.toFun' S (φ x)) := sorry

end Determinant

end KernelsAndCayleyHamilton

section Continuity

variable {G : Type*} [Group G] [TopologicalSpace G] [TopologicalSpace A] {d : ℕ}

/-- **`IHG.0/continuous-determinant`** (Chenevier §2.30). A determinant on a topological group
with values in a topological ring is continuous if every coefficient `g ↦ Λ_i(g)` is continuous
(equivalent, by Amitsur's formula, to continuity of the maps `D^{[α]} : Gⁿ → A`). -/
def Determinant.IsContinuous (D : Determinant A (MonoidAlgebra A G) d) : Prop :=
  ∀ i, Continuous fun g : G ↦ (D.charpoly (MonoidAlgebra.of A G g)).coeff i

/-- **`IHG.0/continuous-determinant-dense`** (Chenevier, Example 2.31).
Two continuous determinants on a group with Hausdorff coefficients that agree on a dense subgroup
are equal. -/
theorem Determinant.eq_of_eqOn_dense [T2Space A] {D₁ D₂ : Determinant A (MonoidAlgebra A G) d}
    (h₁ : D₁.IsContinuous) (h₂ : D₂.IsContinuous) (H : Subgroup G)
    (hH : Dense (H : Set G))
    (heq : ∀ h ∈ H, D₁.charpoly (MonoidAlgebra.of A G h) = D₂.charpoly (MonoidAlgebra.of A G h)) :
    D₁ = D₂ := sorry

/-- **`IHG.0/continuous-iff-open-kernel`** (Chenevier, Lemma 2.33). For discrete `A` and a
profinite `G`, a determinant is continuous iff its kernel contains
`J(H) = ker(A[G] → A[G/H])` for some open normal subgroup `H`. -/
theorem Determinant.isContinuous_iff_exists_openNormal [DiscreteTopology A] [CompactSpace G]
    [T2Space G] [TotallyDisconnectedSpace G] [IsTopologicalGroup G]
    (D : Determinant A (MonoidAlgebra A G) d) :
    D.IsContinuous ↔ ∃ H : Subgroup G, H.Normal ∧ IsOpen (H : Set G) ∧
      ∀ g : G, ∀ h ∈ H, MonoidAlgebra.of A G g - MonoidAlgebra.of A G (g * h) ∈ D.ker := sorry

end Continuity


end TauCeti

namespace TauCeti
open CategoryTheory
universe v
variable {A : Type u} [CommRing A]

/-! The fixed-degree divided-power module reuses Mathlib's raw algebra.
`internalRing` supplies a different multiplication on this same underlying module. -/
namespace DividedPower
variable (A) (M : Type u) [AddCommGroup M] [Module A M]
/-- IHG.0/divided-power-degree. -/
def degree (d : ℕ) : Submodule A (DividedPowerAlgebra A M) :=
  Submodule.span A {x | ∃ (k : ℕ) (n : Fin k → ℕ) (m : Fin k → M),
    (∑ i, n i) = d ∧ x = ∏ i, DividedPowerAlgebra.dp A (n i) (m i)}
variable {A M}
def gamma (d : ℕ) (m : M) : degree A M d :=
  ⟨DividedPowerAlgebra.dp A d m, sorry⟩
def degree_map {N : Type u} [AddCommGroup N] [Module A N]
    (d : ℕ) (f : M →ₗ[A] N) : degree A M d →ₗ[A] degree A N d := sorry
/-- IHG.0/universal-homogeneous-law. -/
def universalLaw (d : ℕ) : M →ₚₗ[A] degree A M d := sorry
theorem universalLaw_ground (d : ℕ) (m : M) :
    (universalLaw (A := A) d).ground m = gamma d m := sorry
/-- Universal mixed evaluation; all multidegrees of total degree d occur. -/
theorem universalLaw_mixed (d k : ℕ) (s : Fin k → A) (m : Fin k → M) :
    (universalLaw d).ground (∑ i, s i • m i) =
      ⟨∑ n : Fin k → Fin (d+1), if (∑ i, (n i).val) = d then
        (∏ i, s i ^ (n i).val) • ∏ i, DividedPowerAlgebra.dp A (n i).val (m i) else 0,
        sorry⟩ := sorry
/-- IHG.0/divided-power-tensor-map. -/
def tensorMap {N : Type u} [AddCommGroup N] [Module A N] (d : ℕ) :
    degree A M d ⊗[A] degree A N d →ₗ[A] degree A (M ⊗[A] N) d := sorry
theorem tensorMap_gamma {N : Type u} [AddCommGroup N] [Module A N]
    (d : ℕ) (m : M) (n : N) : tensorMap d (gamma d m ⊗ₜ gamma d n) =
      gamma d (m ⊗ₜ[A] n) := sorry
theorem tensorMap_naturality {N M' N' : Type u}
    [AddCommGroup N] [Module A N] [AddCommGroup M'] [Module A M']
    [AddCommGroup N'] [Module A N'] (d : ℕ) (f : M →ₗ[A] M') (g : N →ₗ[A] N')
    (x : degree A M d ⊗[A] degree A N d) :
    degree_map d (TensorProduct.map f g) (tensorMap d x) =
      tensorMap d (TensorProduct.map (degree_map d f) (degree_map d g) x) := sorry
variable {R : Type u} [Ring R] [Algebra A R]
/-- IHG.0/multiplicative-law-representability. The carrier is Γᵈ(R); multiplication is internal. -/
@[instance_reducible] def internalRing (d : ℕ) : Ring (degree A R d) := sorry
attribute [instance] internalRing
@[instance_reducible] def internalAlgebra (d : ℕ) : Algebra A (degree A R d) := sorry
attribute [instance] internalAlgebra
theorem internal_mul_gamma (d : ℕ) (x y : R) :
    gamma (A := A) d x * gamma (A := A) d y = gamma (A := A) d (x*y) := sorry
def multiplicativeLawEquiv (d : ℕ) (S : Type u) [CommRing S] [Algebra A S] :
    (degree A R d →ₐ[A] S) ≃ {f : R →ₚₗ[A] S //
      PolynomialLaw.IsHomogeneousOfDegree d f ∧ PolynomialLaw.IsMultiplicative f} := sorry
end DividedPower

namespace Determinant
variable {R : Type u} [Ring R] [Algebra A R] {d : ℕ}
/-- IHG.0/determinant-coordinate-ring. -/
def coordinateRing (A : Type u) [CommRing A] (R : Type u) [Ring R] [Algebra A R]
    (d : ℕ) : CommAlgCat A := sorry
def universal (A : Type u) [CommRing A] (R : Type u) [Ring R] [Algebra A R] (d : ℕ) :
    Determinant (coordinateRing A R d) (coordinateRing A R d ⊗[A] R) d := sorry
def coordinateRingEquiv (d : ℕ) (B : Type w) [CommRing B] [Algebra A B] :
    (coordinateRing A R d →ₐ[A] B) ≃ Determinant B (B ⊗[A] R) d := sorry
def coordinateRing_baseChange (d : ℕ) (B : Type u) [CommRing B] [Algebra A B] :
    B ⊗[A] coordinateRing A R d ≃ₐ[B] coordinateRing B (B ⊗[A] R) d := sorry
/-- IHG.0/determinant-duality: inversion is an anti-involution. -/
def dual {G : Type u} [Group G] (D : Determinant A (MonoidAlgebra A G) d) :
    Determinant A (MonoidAlgebra A G) d := sorry
theorem dual_involutive {G : Type u} [Group G]
    (D : Determinant A (MonoidAlgebra A G) d) : D.dual.dual = D := sorry
theorem dual_charpoly {G : Type u} [Group G]
    (D : Determinant A (MonoidAlgebra A G) d) (g : G) (i : ℕ) (hi : i ≤ d) :
    (D.dual.charpoly (MonoidAlgebra.of A G g)).coeff i *
      (D.charpoly (MonoidAlgebra.of A G g)).coeff 0 =
      (D.charpoly (MonoidAlgebra.of A G g)).coeff (d-i) := sorry
/-- Representation duality is expressed by its transpose-inverse matrix coefficients. -/
theorem dual_ofRepresentation {G : Type u} [Group G]
    (ρ ρdual : MonoidAlgebra A G →ₐ[A] Matrix (Fin d) (Fin d) A)
    (hρ : ∀ g : G, ρdual (MonoidAlgebra.of A G g) =
      (ρ (MonoidAlgebra.of A G g⁻¹)).transpose) :
    (ofMatrix ρ).dual = ofMatrix ρdual := sorry
/-- Constant fiber rank, expressed at every field-valued point of Spec(A). -/
def HasConstantRank (V : Type u) [AddCommGroup V] [Module A V] (d : ℕ) : Prop :=
  ∀ (K : Type u) [Field K] [Algebra A K], Module.finrank K (K ⊗[A] V)=d
/-- IHG.0/finite-projective-determinant. Determinant of the top exterior power. -/
def ofFiniteProjective {V : Type u} [AddCommGroup V] [Module A V]
    [Module.Finite A V] [Module.Projective A V]
    (d : ℕ) (hRank : HasConstantRank (A := A) V d)
    (ρ : R →ₐ[A] Module.End A V) : Determinant A R d := sorry
theorem ofFiniteProjective_exterior {V : Type u} [AddCommGroup V] [Module A V]
    [Module.Finite A V] [Module.Projective A V] (d : ℕ)
    (hRank : HasConstantRank (A := A) V d)
    (ρ : R →ₐ[A] Module.End A V) (x : R) :
    exteriorPower.map d (ρ x) = (ofFiniteProjective d hRank ρ).eval x • LinearMap.id := sorry
theorem ofFiniteProjective_basis {V : Type u} [AddCommGroup V] [Module A V]
    [Module.Finite A V] [Module.Projective A V] (b : Module.Basis (Fin d) A V)
    (hRank : HasConstantRank (A := A) V d)
    (ρ : R →ₐ[A] Module.End A V) (ρmat : R →ₐ[A] Matrix (Fin d) (Fin d) A)
    (hρ : ∀ x, ρmat x = LinearMap.toMatrix b b (ρ x)) :
    ofFiniteProjective d hRank ρ = ofMatrix ρmat := sorry
theorem ofFiniteProjective_baseChange {V : Type u} [AddCommGroup V] [Module A V]
    [Module.Finite A V] [Module.Projective A V] (d : ℕ)
    (hRank : HasConstantRank (A := A) V d)
    (ρ : R →ₐ[A] Module.End A V) (B : Type u) [CommRing B] [Algebra A B]
    [Module.Finite B (B ⊗[A] V)] [Module.Projective B (B ⊗[A] V)]
    (hRankB : HasConstantRank (A := B) (B ⊗[A] V) d)
    (ρB : B ⊗[A] R →ₐ[B] Module.End B (B ⊗[A] V))
    (hρB : ∀ x, ρB (1 ⊗ₜ x) = (ρ x).lTensor B) :
    (ofFiniteProjective d hRank ρ).baseChange B = ofFiniteProjective d hRankB ρB := sorry
/-- IHG.0/azumaya-determinant: the integral reduced norm. -/
def ofAzumaya (d : ℕ) [IsAzumaya A R]
    (hd : 0 < d) (hRank : HasConstantRank (A := A) R (d*d)) : Determinant A R d := sorry
theorem ofAzumaya_split (d : ℕ) [IsAzumaya A R]
    (hd : 0 < d) (hRank : HasConstantRank (A := A) R (d*d))
    (φ : R ≃ₐ[A] Matrix (Fin d) (Fin d) A) :
    ofAzumaya d hd hRank = ofMatrix φ.toAlgHom := sorry
theorem ofAzumaya_unique (d : ℕ) [IsAzumaya A R]
    (hd : 0 < d) (hRank : HasConstantRank (A := A) R (d*d))
    (D : Determinant A R d) : D = ofAzumaya d hd hRank := sorry
end Determinant

end TauCeti

namespace TauCeti
open CategoryTheory
variable (O : Type u) [CommRing O]
/-- Coordinate pullbacks are supplied by LP3. This is an interface argument, not a
replacement group scheme. They must be the H⁰-invariant coordinate rings of Hⁿ. -/
structure InvariantCoordinateInput where
  ring : ℕ → CommAlgCat.{u} O
  reindex : ∀ {n m : ℕ}, (Fin n → Fin m) → ring n →ₐ[O] ring m
  multiply : ∀ n : ℕ, ring (n+1) →ₐ[O] ring (n+2)

variable {O}
def mergeLast {G : Type u} [Mul G] {n : ℕ} (g : Fin (n+2) → G) : Fin (n+1) → G :=
  fun i ↦ if hi : i.val < n then g ⟨i.val, by omega⟩
    else g ⟨n, by omega⟩ * g ⟨n+1, by omega⟩

/-- IHG.0/invariant-evaluation. Evaluation at point tuples, together with the two
coordinate equations needed to pull back along a representation. LP3 identifies
these data with evaluation on the actual H⁰-invariant coordinate algebras. -/
structure InvariantEvaluation {O : Type u} [CommRing O]
    (C : InvariantCoordinateInput O) (H : Type u) [Group H]
    (A : Type u) [CommRing A] [Algebra O A] where
  evaluate : ∀ n, C.ring n →ₐ[O] ((Fin n → H) → A)
  reindex_eq : ∀ {n m : ℕ} (σ : Fin n → Fin m) (f : C.ring n) (g : Fin m → H),
    evaluate m (C.reindex σ f) g = evaluate n f (g ∘ σ)
  multiply_eq : ∀ (n : ℕ) (f : C.ring (n+1)) (g : Fin (n+2) → H),
    evaluate (n+2) (C.multiply n f) g = evaluate (n+1) f (mergeLast g)

namespace InvariantEvaluation
/-- Expressible matrix version of regularity and simultaneous conjugation invariance.
The extra variables evaluate the inverse determinants. This is sufficient for the
GL₂ unipotent degeneration tests, without an invented group-scheme predicate. -/
def IsRegularMatrixInvariant {k : Type u} [Field k] [IsAlgClosed k] {d : ℕ}
    {C : InvariantCoordinateInput k}
    (E : InvariantEvaluation C (Matrix (Fin d) (Fin d) k)ˣ k) : Prop :=
  ∀ n (f : C.ring n),
    (∃ p : MvPolynomial ((Fin n × (Fin d × Fin d)) ⊕ Fin n) k,
      ∀ g : Fin n → (Matrix (Fin d) (Fin d) k)ˣ,
        E.evaluate n f g = MvPolynomial.eval
          (fun v ↦ match v with
            | Sum.inl (i,a,b) => (g i : Matrix (Fin d) (Fin d) k) a b
            | Sum.inr i => Matrix.det (↑((g i)⁻¹) : Matrix (Fin d) (Fin d) k)) p) ∧
    ∀ (P : (Matrix (Fin d) (Fin d) k)ˣ) (g : Fin n → (Matrix (Fin d) (Fin d) k)ˣ),
      E.evaluate n f (fun i ↦ P*g i*P⁻¹) = E.evaluate n f g
end InvariantEvaluation

/-- IHG.0/reductive-pseudocharacter. The group-scheme and H⁰-invariant hypotheses
on `C` are omitted; the actual reindexing and multiplication equations are retained.
Degree zero is the canonical O-valued coordinate slot. -/
structure ReductivePseudocharacter (G : Type u) [Group G]
    (C : InvariantCoordinateInput O) (A : Type u) [CommRing A] [Algebra O A] where
  theta : ∀ n : ℕ, C.ring n →ₐ[O] (Fin n → G) → A
  reindex_eq : ∀ {n m : ℕ} (σ : Fin n → Fin m) (f : C.ring n) (g : Fin m → G),
    theta m (C.reindex σ f) g = theta n f (g ∘ σ)
  multiply_eq : ∀ (n : ℕ) (f : C.ring (n+1)) (g : Fin (n+2) → G),
    theta (n+2) (C.multiply n f) g = theta (n+1) f (mergeLast g)

namespace ReductivePseudocharacter
variable {G H A B : Type u} [Group G] [Group H] [CommRing A] [Algebra O A]
    [CommRing B] [Algebra O B] (C : InvariantCoordinateInput O)
/-- Pull back compatible invariant evaluation at point tuples along ρ. -/
def ofRepresentation (ρ : G →* H)
    (evaluate : InvariantEvaluation C H A) :
    ReductivePseudocharacter G C A := sorry
theorem ofRepresentation_theta (ρ : G →* H) (evaluate : InvariantEvaluation C H A)
    (n : ℕ) (f : C.ring n) (g : Fin n → G) :
    (ofRepresentation C ρ evaluate).theta n f g = evaluate.evaluate n f (ρ ∘ g) := sorry
theorem ext (Θ Ψ : ReductivePseudocharacter G C A)
    (h : ∀ n (f : C.ring n) (g : Fin n → G), Θ.theta n f g = Ψ.theta n f g) : Θ = Ψ := sorry
def map (Θ : ReductivePseudocharacter G C A) (φ : A →ₐ[O] B) :
    ReductivePseudocharacter G C B := sorry
/-- Restriction is separate from coefficient change. -/
def restrict {G' : Type u} [Group G'] (Θ : ReductivePseudocharacter G C A) (φ : G' →* G) :
    ReductivePseudocharacter G' C A := sorry
/-- IHG.0/continuous-reductive-pseudocharacter. -/
def IsContinuous [TopologicalSpace G] [TopologicalSpace A]
    (Θ : ReductivePseudocharacter G C A) : Prop :=
  ∀ n (f : C.ring n), Continuous (Θ.theta n f)
theorem continuous_ofRepresentation [TopologicalSpace G] [TopologicalSpace H]
    [TopologicalSpace A] (ρ : G →* H) (hρ : Continuous ρ)
    (evaluate : InvariantEvaluation C H A)
    (heval : ∀ n (f : C.ring n), Continuous (evaluate.evaluate n f)) :
    (ofRepresentation C ρ evaluate).IsContinuous := sorry
theorem continuous_dense_ext [TopologicalSpace G] [TopologicalSpace A] [T2Space A]
    (Θ Ψ : ReductivePseudocharacter G C A) (hΘ : Θ.IsContinuous) (hΨ : Ψ.IsContinuous)
    (S : Subgroup G) (hS : Dense (S : Set G))
    (heq : ∀ n (f : C.ring n) (g : Fin n → S),
      Θ.theta n f (fun i ↦ g i) = Ψ.theta n f (fun i ↦ g i)) : Θ = Ψ := sorry
/-- IHG.0/reductive-pseudocharacter-kernel. -/
def kernel (Θ : ReductivePseudocharacter G C A) : Subgroup G where
  carrier := {δ | ∀ n (f : C.ring n) (g : Fin n → G) (i : Fin n),
    Θ.theta n f (Function.update g i (g i * δ)) = Θ.theta n f g}
  one_mem' := sorry
  mul_mem' := sorry
  inv_mem' := sorry
theorem kernel_mem (Θ : ReductivePseudocharacter G C A) (δ : G) :
    δ ∈ kernel C Θ ↔ ∀ n (f : C.ring n) (g : Fin n → G) (i : Fin n),
      Θ.theta n f (Function.update g i (g i * δ)) = Θ.theta n f g := sorry
instance kernel_normal (Θ : ReductivePseudocharacter G C A) : (kernel C Θ).Normal := sorry
def quotient (Θ : ReductivePseudocharacter G C A) (Δ : Subgroup G) [Δ.Normal]
    (hΔ : Δ ≤ kernel C Θ) : ReductivePseudocharacter (G ⧸ Δ) C A := sorry
/-- IHG.1/universal-reductive-pseudocharacter-ring. -/
def universalRing (G : Type u) [Group G] (C : InvariantCoordinateInput O) : CommAlgCat O := sorry
def universalRing_equiv : (universalRing G C →ₐ[O] A) ≃ ReductivePseudocharacter G C A := sorry
/-- Residual-adic completion; the ideal is supplied by the residual universal evaluation. -/
def deformationRing (m : Ideal (universalRing G C)) : CommAlgCat O := sorry
end ReductivePseudocharacter
end TauCeti

namespace TauCeti
variable {A : Type u} [CommRing A] {R : Type u} [Ring R] [Algebra A R]
/-- The actual additive corner carrier. Its unit is e, not 1_R. -/
def cornerModule (e : R) : Submodule A R where
  carrier := {x | e*x=x ∧ x*e=x}
  zero_mem' := sorry
  add_mem' := sorry
  smul_mem' := sorry
/-- Proof-indexed corner type; the unit is the supplied idempotent. -/
abbrev Corner (A : Type u) [CommRing A] (R : Type u) [Ring R] [Algebra A R]
    (e : R) (he : e*e=e) : Type u := (show IsIdempotentElem e from he).Corner
instance cornerAlgebra (e : R) (he : e*e=e) : Algebra A (Corner A R e he) := sorry
def cornerVal (e : R) (he : e*e=e) : Corner A R e he → R := Subtype.val
instance cornerCoe (e : R) (he : e*e=e) : CoeOut (Corner A R e he) R := ⟨cornerVal e he⟩
def cornerLift (e : R) (he : e*e=e) (x : R) (hx : x ∈ cornerModule (A := A) e) :
    Corner A R e he := sorry

namespace Determinant
/-- IHG.1/corner-determinant. Mathlib supplies the corner ring with unit e.
Connectedness is the absence of nontrivial idempotents in the nonzero coefficient ring.
The degree returned is the polynomial degree of D(1-e+te), never its trace. -/
def corner [Nontrivial A] {d : ℕ} (D : Determinant A R d)
    (hconnected : ∀ a : A, a*a=a → a=0 ∨ a=1) (e : R) (he : e*e=e) :
    Σ r : ℕ, Determinant A (Corner A R e he) r := sorry
theorem corner_rank [Nontrivial A] {d : ℕ} (D : Determinant A R d)
    (hconnected : ∀ a : A, a*a=a → a=0 ∨ a=1) (e : R) (he : e*e=e) :
    Algebra.TensorProduct.rid A A A[X]
      (D.toLaw.toFun' A[X] (1 ⊗ₜ[A] (1-e) + X ⊗ₜ[A] e)) =
      X ^ (corner D hconnected e he).1 := sorry
/-- Corner-complement values; scalar extensions obey the same identity. -/
theorem corner_complement [Nontrivial A] {d : ℕ} (D : Determinant A R d)
    (hconnected : ∀ a : A, a*a=a → a=0 ∨ a=1) (e : R) (he : e*e=e)
    (x y : R) (hx : x ∈ cornerModule (A := A) e)
    (hy : y ∈ cornerModule (A := A) (1-e)) :
    D.eval (x+y) = (corner D hconnected e he).2.eval (cornerLift e he x hx) *
      (corner D hconnected (1-e) (by sorry)).2.eval (cornerLift (1-e) (by sorry) y hy) := sorry
variable [IsLocalRing A]
def residual {d : ℕ} (D : Determinant A R d) :
    Determinant (IsLocalRing.ResidueField A) (IsLocalRing.ResidueField A ⊗[A] R) d := sorry
end Determinant

end TauCeti

namespace TauCeti
variable {K : Type u} [CommRing K] {R : Type u} [Ring R] [Algebra K R] {d : ℕ}
/-- Explicit invariant-subspace test; no new representation carrier is introduced. -/
def MatrixRepresentationStable (ρ : R →ₐ[K] Matrix (Fin d) (Fin d) K)
    (W : Submodule K (Fin d → K)) : Prop :=
  ∀ r x, x ∈ W → (ρ r).mulVec x ∈ W
def MatrixRepresentationIrreducible (ρ : R →ₐ[K] Matrix (Fin d) (Fin d) K) : Prop :=
  ∀ W : Submodule K (Fin d → K), MatrixRepresentationStable ρ W → W=⊥ ∨ W=⊤
def MatrixRepresentationSemisimple (ρ : R →ₐ[K] Matrix (Fin d) (Fin d) K) : Prop :=
  ∀ W : Submodule K (Fin d → K), MatrixRepresentationStable ρ W →
    ∃ W' : Submodule K (Fin d → K), MatrixRepresentationStable ρ W' ∧ IsCompl W W'
namespace Determinant
/-- IHG.1/residual-determinant-properties: these predicates apply to the residual law.
Split means all simple factors of the faithful quotient are matrices over K.
Arbitrary matrix realizability is weaker: the real regular representation of ℂ
realizes its norm but does not split its faithful quotient because its faithful quotient is the field ℂ. -/
def IsSplit (D : Determinant K R d) : Prop :=
  ∃ (s : ℕ) (size : Fin s → ℕ), (∀ i, 0 < size i) ∧
    ∃ ρ : R →ₐ[K] (∀ i : Fin s, Matrix (Fin (size i)) (Fin (size i)) K),
      Function.Surjective ρ ∧ ∀ r, ρ r = 0 ↔ r ∈ D.ker
def IsAbsolutelyIrreducible (D : Determinant K R d) : Prop :=
  0 < d ∧ ∀ (L : Type u) [Field L] [Algebra K L] [IsAlgClosed L],
    ∃ ρ : L ⊗[K] R →ₐ[L] Matrix (Fin d) (Fin d) L,
      ofMatrix ρ=D.baseChange L ∧ MatrixRepresentationIrreducible ρ
/-- Semisimple multiplicity one is detected by the commutative commutant after
algebraic closure. The signature uses every algebraically closed coefficient field. -/
def IsMultiplicityFree (D : Determinant K R d) : Prop :=
  ∀ (L : Type u) [Field L] [Algebra K L] [IsAlgClosed L],
    ∃ ρ : L ⊗[K] R →ₐ[L] Matrix (Fin d) (Fin d) L,
      ofMatrix ρ=D.baseChange L ∧ MatrixRepresentationSemisimple ρ ∧
        ∀ P Q : Matrix (Fin d) (Fin d) L,
          (∀ r, P*ρ r=ρ r*P) → (∀ r, Q*ρ r=ρ r*Q) → P*Q=Q*P
end Determinant
end TauCeti

namespace TauCeti
variable {A : Type u} [CommRing A] {R : Type u} [Ring R] [Algebra A R]
namespace GMA
/-- IHG.1/generalized-matrix-algebra. All fields are actual data or explicit equations. -/
structure Data (A : Type u) [CommRing A] (R : Type u) [Ring R] [Algebra A R]
    (s : ℕ) (size : Fin s → ℕ) where
  size_pos : ∀ i, 0 < size i
  idempotent : Fin s → R
  idem : ∀ i, idempotent i * idempotent i = idempotent i
  orthogonal : ∀ i j, i ≠ j → idempotent i * idempotent j = 0
  sum_one : ∑ i, idempotent i = 1
  diagonal : ∀ i, Corner A R (idempotent i) (idem i) ≃ₐ[A]
    Matrix (Fin (size i)) (Fin (size i)) A
  trace : R →ₗ[A] A
  trace_cyclic : ∀ x y, trace (x*y) = trace (y*x)
  trace_diagonal : ∀ i (x : Corner A R (idempotent i) (idem i)),
    trace (x : R) = Matrix.trace (diagonal i x)
variable {s : ℕ} {size : Fin s → ℕ} (E : Data A R s size)
def blockModule (i j : Fin s) : Submodule A R where
  carrier := {x | E.idempotent i*x=x ∧ x*E.idempotent j=x}
  zero_mem' := sorry
  add_mem' := sorry
  smul_mem' := sorry
def peirce : R ≃ₗ[A] (∀ i j : Fin s, blockModule E i j) := sorry
/-- Primitive diagonal matrix unit, using the positive block size. -/
def primitive (i : Fin s) : R :=
  ((E.diagonal i).symm (Matrix.single ⟨0,E.size_pos i⟩ ⟨0,E.size_pos i⟩ 1) :
    Corner A R (E.idempotent i) (E.idem i))
def entryModule (i j : Fin s) : Submodule A R where
  carrier := {x | primitive E i*x=x ∧ x*primitive E j=x}
  zero_mem' := sorry
  add_mem' := sorry
  smul_mem' := sorry
def pairing {i j k : Fin s} : entryModule E i j →ₗ[A]
    entryModule E j k →ₗ[A] entryModule E i k := sorry
theorem pairing_assoc {i j k l : Fin s} (x : entryModule E i j)
    (y : entryModule E j k) (z : entryModule E k l) :
    pairing E (pairing E x y) z = pairing E x (pairing E y z) := sorry
/-- IHG.1/gma-adapted-coordinate-ring. -/
def adaptedRing (E : Data A R s size) : CommAlgCat.{u} A := sorry
def universalAdapted : R →ₐ[A] Matrix (Σ i : Fin s, Fin (size i)) (Σ i : Fin s, Fin (size i)) (adaptedRing E) := sorry
/-- Diagonal compatibility is given by the concrete chosen block entries. -/
def adaptedRing_equiv (B : Type u) [CommRing B] [Algebra A B] :
    (adaptedRing E →ₐ[A] B) ≃
      {ρ : R →ₐ[A] Matrix (Σ i : Fin s, Fin (size i)) (Σ i : Fin s, Fin (size i)) B //
        (∀ i j k (a : Fin (size j)) (b : Fin (size k)),
          ρ (E.idempotent i) ⟨j,a⟩ ⟨k,b⟩ =
            if j=i ∧ k=i ∧ (⟨j,a⟩ : Σ t : Fin s, Fin (size t))=⟨k,b⟩ then 1 else 0) ∧
        ∀ i (x : Corner A R (E.idempotent i) (E.idem i)) (a b : Fin (size i)),
          ρ (x : R) ⟨i,a⟩ ⟨i,b⟩ = algebraMap A B (E.diagonal i x a b)} := sorry
/-- IHG.1/gma-determinant. -/
def determinant (E : Data A R s size) : Determinant A R (∑ i, size i) := sorry
theorem trace_determinant : (determinant E).traceLinear = E.trace := sorry
theorem determinant_adapted (x : R) :
    algebraMap A (adaptedRing E) ((determinant E).eval x) = (universalAdapted E x).det := sorry
/-- IHG.1/reducibility-ideal, the opposite scalar pairing ideal. -/
def reducibilityIdeal (i j : Fin s) : Ideal A :=
  Ideal.span {a | ∃ (x : entryModule E i j) (y : entryModule E j i),
    algebraMap A R a * primitive E i = (x : R)*(y : R)}
/-- Quotient entry corners must come from the same primitive matrix units. -/
theorem reducibilityIdeal_baseChange (i j : Fin s) (J : Ideal A)
    (EJ : Data (A ⧸ J) ((A ⧸ J) ⊗[A] R) s size)
    (hprimitive : ∀ k, primitive EJ k=1 ⊗ₜ[A] primitive E k) :
    (reducibilityIdeal E i j).map (Ideal.Quotient.mk J) = reducibilityIdeal EJ i j := sorry
/-- IHG.1/partition-reducibility. The labels encode the nonempty partition parts. -/
def partitionReducibilityIdeal {t : ℕ} (part : Fin s → Fin t) : Ideal A :=
  ⨆ i : Fin s, ⨆ j : Fin s, if part i ≠ part j then reducibilityIdeal E i j else ⊥

/-- IHG.1/gma-residual-dictionary. These are the actual ordered residual constituents,
with full-law product, absolute irreducibility, pairwise nonisomorphism and corner data. -/
structure ResidualData [IsLocalRing A] {s : ℕ} {size : Fin s → ℕ}
    (E : Data A R s size) where
  representation : ∀ i, IsLocalRing.ResidueField A ⊗[A] R →ₐ[IsLocalRing.ResidueField A]
    Matrix (Fin (size i)) (Fin (size i)) (IsLocalRing.ResidueField A)
  absolutelyIrreducible : ∀ i, (Determinant.ofMatrix (representation i)).IsAbsolutelyIrreducible
  distinct : ∀ i j, i ≠ j → ¬ ∃ T :
      (Fin (size j) → IsLocalRing.ResidueField A) ≃ₗ[IsLocalRing.ResidueField A]
      (Fin (size i) → IsLocalRing.ResidueField A),
    ∀ r x, T ((representation j r).mulVec x) = (representation i r).mulVec (T x)
  projectors : ∀ i j, representation i (1 ⊗ₜ[A] E.idempotent j) = if j=i then 1 else 0
  diagonal : ∀ i (x : Corner A R (E.idempotent i) (E.idem i)),
    representation i (1 ⊗ₜ[A] (x : R)) = (E.diagonal i x).map (IsLocalRing.residue A)
  factorization : ∀ (B : Type u) [CommRing B] [Algebra (IsLocalRing.ResidueField A) B]
      (x : B ⊗[IsLocalRing.ResidueField A] (IsLocalRing.ResidueField A ⊗[A] R)),
    (determinant E).residual.toLaw.toFun' B x =
      ∏ i, (Determinant.ofMatrix (representation i)).toLaw.toFun' B x

/-- The quotient coefficient map is the unique one induced by A → k. -/
def quotientResidue [IsLocalRing A] (J : Ideal A) (hJ : J ≤ IsLocalRing.maximalIdeal A) :
    (A ⧸ J) →ₐ[A] IsLocalRing.ResidueField A := sorry
/-- Canonical tensor reassociation, valid for a noncommutative R as well. -/
def quotientResidualTransport [IsLocalRing A] (J : Ideal A)
    (hJ : J ≤ IsLocalRing.maximalIdeal A) :
    letI := (quotientResidue J hJ).toRingHom.toAlgebra
    (IsLocalRing.ResidueField A ⊗[A ⧸ J] ((A ⧸ J) ⊗[A] R)) ≃ₐ[IsLocalRing.ResidueField A]
      (IsLocalRing.ResidueField A ⊗[A] R) := sorry
/-- Reduction of the entire polynomial law, not just evaluations on R. -/
def residualFactor [IsLocalRing A] (J : Ideal A) (hJ : J ≤ IsLocalRing.maximalIdeal A)
    {n : ℕ} (F : Determinant (A ⧸ J) ((A ⧸ J) ⊗[A] R) n) :
    Determinant (IsLocalRing.ResidueField A) (IsLocalRing.ResidueField A ⊗[A] R) n :=
  letI := (quotientResidue J hJ).toRingHom.toAlgebra
  (F.baseChange (IsLocalRing.ResidueField A)).comap
    (quotientResidualTransport (R := R) J hJ).symm.toAlgHom

/-- ANT20 Proposition 2.5 for a labelled nonempty partition. The reductions are
products of precisely the residual constituents in that part. -/
theorem partition_reducibility [HenselianLocalRing A]
    (res : ResidualData E) (hCH : (determinant E).IsCayleyHamilton)
    {t : ℕ} (part : Fin s → Fin t) (hpart : Function.Surjective part)
    (J : Ideal A) (hJ : J ≤ IsLocalRing.maximalIdeal A) :
    partitionReducibilityIdeal E part ≤ J ↔
      ∃! F : ∀ m : Fin t, Determinant (A ⧸ J) ((A ⧸ J) ⊗[A] R)
          (∑ i ∈ Finset.univ.filter (fun i ↦ part i=m), size i),
        (∀ (B : Type u) [CommRing B] [Algebra (A ⧸ J) B]
          (x : B ⊗[A ⧸ J] ((A ⧸ J) ⊗[A] R)),
          ((determinant E).baseChange (A ⧸ J)).toLaw.toFun' B x =
            ∏ m, (F m).toLaw.toFun' B x) ∧
        ∀ m (B : Type u) [CommRing B] [Algebra (IsLocalRing.ResidueField A) B]
          (x : B ⊗[IsLocalRing.ResidueField A] (IsLocalRing.ResidueField A ⊗[A] R)),
          (residualFactor J hJ (F m)).toLaw.toFun' B x =
            ∏ i ∈ Finset.univ.filter (fun i ↦ part i=m),
              (Determinant.ofMatrix (res.representation i)).toLaw.toFun' B x := sorry

/-- Two blocks, prescribed reductions and uniqueness are explicit (ANT20 Prop. 2.5). -/
theorem reducibilityIdeal_le_iff [HenselianLocalRing A] {size : Fin 2 → ℕ}
    (E : Data A R 2 size) (res : ResidualData E) (hCH : (determinant E).IsCayleyHamilton)
    (i j : Fin 2) (hij : i ≠ j) (J : Ideal A) (hJ : J ≤ IsLocalRing.maximalIdeal A) :
    reducibilityIdeal E i j ≤ J ↔
      ∃! pair : Determinant (A ⧸ J) ((A ⧸ J) ⊗[A] R) (size i) ×
        Determinant (A ⧸ J) ((A ⧸ J) ⊗[A] R) (size j),
        ((determinant E).baseChange (A ⧸ J)).toLaw = (pair.1.mul pair.2).toLaw ∧
        residualFactor J hJ pair.1 = Determinant.ofMatrix (res.representation i) ∧
        residualFactor J hJ pair.2 = Determinant.ofMatrix (res.representation j) := sorry

/-- IHG.1/gma-quotient-constituent. A singleton part makes its diagonal compression
multiplicative modulo the partition ideal. The residual ordering remains fixed. -/
def quotientRepresentation {t : ℕ} (part : Fin s → Fin t) (i : Fin s)
    (hi : ∀ k, part k=part i → k=i) (J : Ideal A)
    (hIP : partitionReducibilityIdeal E part ≤ J) :
    (A ⧸ J) ⊗[A] R →ₐ[A ⧸ J] Matrix (Fin (size i)) (Fin (size i)) (A ⧸ J) := sorry
theorem quotientRepresentation_apply {t : ℕ} (part : Fin s → Fin t) (i : Fin s)
    (hi : ∀ k, part k=part i → k=i) (J : Ideal A)
    (hIP : partitionReducibilityIdeal E part ≤ J) (r : R) :
    quotientRepresentation E part i hi J hIP (1 ⊗ₜ[A] r) =
      (E.diagonal i (cornerLift (E.idempotent i) (E.idem i)
        (E.idempotent i*r*E.idempotent i) (by sorry))).map (Ideal.Quotient.mk J) := sorry
/-- The vector module is restricted along the actual quotient matrix action. -/
def quotientConstituent {t : ℕ} (part : Fin s → Fin t) (i : Fin s)
    (hi : ∀ k, part k=part i → k=i) (J : Ideal A)
    (hIP : partitionReducibilityIdeal E part ≤ J) : ModuleCat.{u} ((A ⧸ J) ⊗[A] R) :=
  let action := (Matrix.toLinAlgEquiv'.toAlgHom).comp
    (quotientRepresentation E part i hi J hIP)
  letI := Module.compHom (Fin (size i) → A ⧸ J) action.toRingHom
  ModuleCat.of ((A ⧸ J) ⊗[A] R) (Fin (size i) → A ⧸ J)

/-- IHG.1/gma-extension-module. Intermediate products are killed. -/
def intermediateProducts (i j : Fin s) : Submodule A (entryModule E i j) :=
  Submodule.span A {z | ∃ k : Fin s, k ≠ i ∧ k ≠ j ∧
    ∃ (x : entryModule E i k) (y : entryModule E k j), z = pairing E x y}
def extensionModule (i j : Fin s) : ModuleCat.{u} A :=
  ModuleCat.of A (entryModule E i j ⧸ intermediateProducts E i j)
theorem extension_offDiagonal (i j k : Fin s) (hki : k ≠ i) (hkj : k ≠ j)
    (x : entryModule E i k) (y : entryModule E k j) :
    Submodule.Quotient.mk (p := intermediateProducts E i j) (pairing E x y) = 0 := sorry
def extensionModule_twoBlocks {size2 : Fin 2 → ℕ} (E : Data A R 2 size2) :
    extensionModule E 0 1 ≃ₗ[A] entryModule E 0 1 := sorry
end GMA

abbrev CHQuotient {d : ℕ} (D : Determinant A R d) := D.chIdeal.ringCon.Quotient
instance chQuotientAlgebra {d : ℕ} (D : Determinant A R d) : Algebra A (CHQuotient D) := sorry
/-- Canonical algebra map to the actual characteristic-coefficient quotient. -/
def chQuotientMap {d : ℕ} (D : Determinant A R d) : R →ₐ[A] CHQuotient D := sorry

namespace CayleyHamilton
variable {d : ℕ} {G : Type} [Group G]
/-- IHG.1/universal-cayley-hamilton-algebra. The carrier is the actual CH quotient. -/
def universalAlgebra (G : Type) [Group G] (d : ℕ) :
    AlgCat (Determinant.coordinateRing ℤ (MonoidAlgebra ℤ G) d) :=
  AlgCat.of (Determinant.coordinateRing ℤ (MonoidAlgebra ℤ G) d)
    (CHQuotient (Determinant.universal ℤ (MonoidAlgebra ℤ G) d))
def universalAlgebra_quotientMap (G : Type) [Group G] (d : ℕ) :
    MonoidAlgebra (Determinant.coordinateRing ℤ (MonoidAlgebra ℤ G) d) G →ₐ[
      Determinant.coordinateRing ℤ (MonoidAlgebra ℤ G) d] universalAlgebra G d := sorry
/-- The same explicit coefficient map determines the specialized universal law. -/
def universalSpecialization (d : ℕ) {B : Type u} [CommRing B]
    (φ : Determinant.coordinateRing ℤ (MonoidAlgebra ℤ G) d →ₐ[ℤ] B) :
    Determinant B (B ⊗[ℤ] MonoidAlgebra ℤ G) d :=
  Determinant.coordinateRingEquiv d B φ
/-- The full determinant compatibility is an explicit input to the quotient lift. -/
def universalAlgebra_lift (d : ℕ) {B : Type u} [CommRing B]
    (φ : Determinant.coordinateRing ℤ (MonoidAlgebra ℤ G) d →ₐ[ℤ] B)
    {S : Type u} [Ring S] [Algebra B S] (DS : Determinant B S d)
    (hDS : DS.IsCayleyHamilton)
    (r : B ⊗[ℤ] MonoidAlgebra ℤ G →ₐ[B] S)
    (hcompat : DS.comap r = universalSpecialization d φ) :
    letI := Algebra.compHom S φ.toRingHom
    universalAlgebra G d →ₐ[Determinant.coordinateRing ℤ (MonoidAlgebra ℤ G) d] S := sorry
/-- The compatible lift has the prescribed value on every group-algebra coefficient. -/
theorem universalAlgebra_lift_single (d : ℕ) {B : Type u} [CommRing B]
    (φ : Determinant.coordinateRing ℤ (MonoidAlgebra ℤ G) d →ₐ[ℤ] B)
    {S : Type u} [Ring S] [Algebra B S] (DS : Determinant B S d)
    (hDS : DS.IsCayleyHamilton)
    (r : B ⊗[ℤ] MonoidAlgebra ℤ G →ₐ[B] S)
    (hcompat : DS.comap r = universalSpecialization d φ) :
    letI := Algebra.compHom S φ.toRingHom
    ∀ c g, universalAlgebra_lift d φ DS hDS r hcompat
      (universalAlgebra_quotientMap G d (MonoidAlgebra.single g c)) =
        r (φ c ⊗ₜ[ℤ] MonoidAlgebra.of ℤ G g) := sorry
/-- Coefficients and group generators determine the compatible quotient map uniquely. -/
theorem universalAlgebra_lift_unique (d : ℕ) {B : Type u} [CommRing B]
    (φ : Determinant.coordinateRing ℤ (MonoidAlgebra ℤ G) d →ₐ[ℤ] B)
    {S : Type u} [Ring S] [Algebra B S] (DS : Determinant B S d)
    (hDS : DS.IsCayleyHamilton)
    (r : B ⊗[ℤ] MonoidAlgebra ℤ G →ₐ[B] S)
    (hcompat : DS.comap r = universalSpecialization d φ) :
    letI := Algebra.compHom S φ.toRingHom
    ∀ f : universalAlgebra G d →ₐ[Determinant.coordinateRing ℤ (MonoidAlgebra ℤ G) d] S,
      (∀ c g, f (universalAlgebra_quotientMap G d (MonoidAlgebra.single g c))=
        r (φ c ⊗ₜ[ℤ] MonoidAlgebra.of ℤ G g)) →
      f = universalAlgebra_lift d φ DS hDS r hcompat := sorry
/-- Scalar extension of the very same universal quotient along φ. -/
def universalAlgebra_baseChange (d : ℕ) {B : Type u} [CommRing B]
    (φ : Determinant.coordinateRing ℤ (MonoidAlgebra ℤ G) d →ₐ[ℤ] B) : AlgCat B :=
  letI := φ.toRingHom.toAlgebra
  AlgCat.of B (B ⊗[Determinant.coordinateRing ℤ (MonoidAlgebra ℤ G) d] universalAlgebra G d)
/-- Characteristic-coefficient ideals commute with arbitrary scalar extension. -/
def universalAlgebra_specializationEquiv (d : ℕ) {B : Type u} [CommRing B]
    (φ : Determinant.coordinateRing ℤ (MonoidAlgebra ℤ G) d →ₐ[ℤ] B) :
    universalAlgebra_baseChange d φ ≃ₐ[B] CHQuotient (universalSpecialization d φ) := sorry
/-- IHG.1/generic-matrix-algebra-finite: finite type, not module finite. -/
def genericRepresentationRing (D : Determinant A R d) (hD : D.IsCayleyHamilton)
    [Module.Finite A R] : CommAlgCat A := sorry
def genericRepresentation (D : Determinant A R d) (hD : D.IsCayleyHamilton)
    [Module.Finite A R] : R →ₐ[A]
      Matrix (Fin d) (Fin d) (genericRepresentationRing D hD) := sorry
def genericRepresentationRing_equiv (D : Determinant A R d) (hD : D.IsCayleyHamilton)
    [Module.Finite A R] (B : Type u) [CommRing B] [Algebra A B] :
    (genericRepresentationRing D hD →ₐ[A] B) ≃
      {ρ : B ⊗[A] R →ₐ[B] Matrix (Fin d) (Fin d) B //
        Determinant.ofMatrix ρ = D.baseChange B} := sorry
end CayleyHamilton
end TauCeti

namespace TauCeti.HeckeImage
open CategoryTheory
variable {A : Type u} [CommRing A]
local instance derivedAvailable : HasDerivedCategory.{u+1} (ModuleCat.{u} A) :=
  HasDerivedCategory.standard (ModuleCat.{u} A)
variable {H : Type u} [CommRing H] [Algebra A H]
/-- IHG.2/chain-hecke-image. -/
def chain (C : CochainComplex (ModuleCat.{u} A) ℤ) (α : H →ₐ[A] End C) : Subalgebra A (End C) := α.range
theorem mem_chain (C : CochainComplex (ModuleCat.{u} A) ℤ) (α : H →ₐ[A] End C) (t : End C) :
    t ∈ chain C α ↔ ∃ h, α h=t := sorry
def chain_quotient (C : CochainComplex (ModuleCat.{u} A) ℤ) (α : H →ₐ[A] End C) :
    (H ⧸ RingHom.ker α.toRingHom) ≃ₐ[A] chain C α := sorry
/-- IHG.2/homotopy-hecke-image. -/
def homotopy (C : HomotopyCategory (ModuleCat.{u} A) (.up ℤ)) (α : H →ₐ[A] End C) :
    Subalgebra A (End C) := α.range
theorem mem_homotopy (C : HomotopyCategory (ModuleCat.{u} A) (.up ℤ))
    (α : H →ₐ[A] End C) (t : End C) : t ∈ homotopy C α ↔ ∃ h, α h=t := sorry
def homotopy_quotient (C : HomotopyCategory (ModuleCat.{u} A) (.up ℤ)) (α : H →ₐ[A] End C) :
    (H ⧸ RingHom.ker α.toRingHom) ≃ₐ[A] homotopy C α := sorry
/-- IHG.2/derived-hecke-image. -/
def derived (C : DerivedCategory (ModuleCat.{u} A)) (α : H →ₐ[A] End C) :
    Subalgebra A (End C) := α.range
theorem mem_derived (C : DerivedCategory (ModuleCat.{u} A)) (α : H →ₐ[A] End C) (t : End C) :
    t ∈ derived C α ↔ ∃ h, α h=t := sorry
theorem derived_action_faithful (C : DerivedCategory (ModuleCat.{u} A)) (α : H →ₐ[A] End C) :
    Function.Injective (derived C α).val := sorry
/-- Actual derived cohomology action, using Mathlib's homology functor. -/
def cohomologyAction (C : DerivedCategory (ModuleCat.{u} A)) :
    End C →ₐ[A] ∀ i : ℤ, End ((DerivedCategory.homologyFunctor (ModuleCat.{u} A) i).obj C) := sorry
/-- IHG.2/cohomology-hecke-image. -/
def cohomology (C : DerivedCategory (ModuleCat.{u} A)) (α : H →ₐ[A] End C) :
    Subalgebra A (∀ i : ℤ, End ((DerivedCategory.homologyFunctor (ModuleCat.{u} A) i).obj C)) :=
  ((cohomologyAction C).comp α).range
theorem mem_cohomology (C : DerivedCategory (ModuleCat.{u} A)) (α : H →ₐ[A] End C)
    (t : ∀ i : ℤ, End ((DerivedCategory.homologyFunctor (ModuleCat.{u} A) i).obj C)) :
    t ∈ cohomology C α ↔ ∃ h, cohomologyAction C (α h)=t := sorry
def cohomology_quotient (C : DerivedCategory (ModuleCat.{u} A)) (α : H →ₐ[A] End C) :
    (H ⧸ RingHom.ker ((cohomologyAction C).comp α).toRingHom) ≃ₐ[A] cohomology C α := sorry
/-- IHG.2/ghost-ideal. -/
def ghostIdeal (C : DerivedCategory (ModuleCat.{u} A)) : TwoSidedIdeal (End C) := sorry
theorem mem_ghostIdeal (C : DerivedCategory (ModuleCat.{u} A)) (f : End C) :
    f ∈ ghostIdeal C ↔ ∀ i : ℤ, (DerivedCategory.homologyFunctor (ModuleCat.{u} A) i).map f=0 := sorry
/-- The image ideal on the commutative source algebra; this also describes J inside T_der. -/
def actionGhostKernel (C : DerivedCategory (ModuleCat.{u} A)) (α : H →ₐ[A] End C) : Ideal H :=
  RingHom.ker ((cohomologyAction C).comp α).toRingHom

instance derivedCommRing (C : DerivedCategory (ModuleCat.{u} A)) (α : H →ₐ[A] End C) :
    CommRing (derived C α) := { (inferInstance : Ring (derived C α)) with mul_comm := sorry }
def imageGhostIdeal (C : DerivedCategory (ModuleCat.{u} A)) (α : H →ₐ[A] End C) :
    Ideal (derived C α) :=
  RingHom.ker ((cohomologyAction C).comp (derived C α).val).toRingHom
def cohomologyImage_quotient (C : DerivedCategory (ModuleCat.{u} A)) (α : H →ₐ[A] End C) :
    ((derived C α) ⧸ imageGhostIdeal C α) ≃ₐ[A] cohomology C α := sorry
/-- IHG.2/hecke-localized-complex. The finite algebra/local-factor supplier selects e_m.
The signature keeps the actual idempotent rather than using an invented maximal-ideal carrier. -/
def localizedComplex (C : DerivedCategory (ModuleCat.{u} A)) (e : End C) (he : e*e=e) :
    DerivedCategory (ModuleCat.{u} A) := sorry
def localizedComplex_homology (C : DerivedCategory (ModuleCat.{u} A)) (e : End C) (he : e*e=e)
    (i : ℤ) : (DerivedCategory.homologyFunctor (ModuleCat.{u} A) i).obj (localizedComplex C e he) ≅
      ModuleCat.of A (LinearMap.range
        ((DerivedCategory.homologyFunctor (ModuleCat.{u} A) i).map e).hom) := sorry
/-- Two complementary factors; the finite multi-factor statement is obtained iteratively. -/
def localizedComplex_decomposition (C : DerivedCategory (ModuleCat.{u} A)) (e : End C) (he : e*e=e) :
    localizedComplex C e he ⊞ localizedComplex C (1-e) (by sorry) ≅ C := sorry
/-- IHG.2/localizing-operator-summand: the mapping telescope, for arbitrary operators. -/
def operatorLocalization (C : DerivedCategory (ModuleCat.{u} A)) (t : End C) :
    DerivedCategory (ModuleCat.{u} A) := sorry
/-- The actual module direct limit of an endomorphism, by its presentation. -/
def moduleTelescope (M : ModuleCat.{u} A) (t : M →ₗ[A] M) : ModuleCat.{u} A :=
  ModuleCat.of A ((ℕ →₀ M) ⧸ Submodule.span A
    {z | ∃ n x, z = Finsupp.single n x-Finsupp.single (n+1) (t x)})
def operatorLocalization_homology (C : DerivedCategory (ModuleCat.{u} A)) (t : End C) (i : ℤ) :
    (DerivedCategory.homologyFunctor (ModuleCat.{u} A) i).obj (operatorLocalization C t) ≅
      moduleTelescope ((DerivedCategory.homologyFunctor (ModuleCat.{u} A) i).obj C)
        ((DerivedCategory.homologyFunctor (ModuleCat.{u} A) i).map t).hom := sorry
/-- The selected summand is t-invertible and the complementary summand is nilpotent.
These conditions are expressible independently of the missing ordinary-localization supplier. -/
def operatorLocalization_idempotent (C : DerivedCategory (ModuleCat.{u} A)) (t e : End C)
    (he : e*e=e) (hte : t*e=e*t)
    (hinv : ∃ u : End C, u=e*u*e ∧ t*u=e ∧ u*t=e)
    (hnil : ∃ n : ℕ, 0 < n ∧ (t*(1-e))^n=0) :
    operatorLocalization C t ≅ localizedComplex C e he := sorry
end TauCeti.HeckeImage

namespace TauCeti.Spherical
local instance residueFieldStructure {T : Type u} [CommRing T] (m : Ideal T) [m.IsMaximal] :
    Field (T ⧸ m) := Ideal.Quotient.field m

variable {A : Type u} [CommRing A]
/-- IHG.3/gln-hecke-polynomial. -/
def glnPolynomial (n : ℕ) (q : A) (T : Fin (n+1) → A) : A[X] :=
  ∑ i : Fin (n+1), C ((-1)^i.val * q^(i.val*(i.val-1)/2) * T i) * X^(n-i.val)
theorem glnPolynomial_coeff (n : ℕ) (q : A) (T : Fin (n+1) → A) (i : Fin (n+1)) :
    (glnPolynomial n q T).coeff (n-i.val) = (-1)^i.val * q^(i.val*(i.val-1)/2)*T i := sorry
theorem glnPolynomial_monic (n : ℕ) (q : A) (T : Fin (n+1) → A) (hT : T 0=1) :
    (glnPolynomial n q T).Monic := sorry
/-- IHG.3/gsp4-spin-polynomial. -/
def gsp4SpinPolynomial (q T₀ T₁ T₂ : A) : A[X] :=
  X^4-C T₁*X^3+C (q*T₂+(q^3+q)*T₀)*X^2-C (q^3*T₀*T₁)*X+C (q^6*T₀^2)
theorem gsp4SpinPolynomial_constant (q T₀ T₁ T₂ : A) :
    (gsp4SpinPolynomial q T₀ T₁ T₂).coeff 0=q^6*T₀^2 := sorry
theorem gsp4SpinPolynomial_map {B : Type u} [CommRing B] (φ : A →+* B)
    (q T₀ T₁ T₂ : A) : (gsp4SpinPolynomial q T₀ T₁ T₂).map φ =
    gsp4SpinPolynomial (φ q) (φ T₀) (φ T₁) (φ T₂) := sorry
/-- IHG.3/gsp4-reversed-spin-polynomial. -/
def gsp4ReversedSpinPolynomial (q T₀ T₁ T₂ : A) : A[X] :=
  1-C T₁*X+C (q*T₂+(q^3+q)*T₀)*X^2-C (q^3*T₀*T₁)*X^3+C (q^6*T₀^2)*X^4
theorem gsp4ReversedSpinPolynomial_constant (q T₀ T₁ T₂ : A) :
    (gsp4ReversedSpinPolynomial q T₀ T₁ T₂).coeff 0=1 := sorry
/-- Coefficient form of det(1-Xr); avoids Laurent-polynomial division. -/
theorem gsp4ReversedSpinPolynomial_det (q T₀ T₁ T₂ : A)
    (r : Matrix (Fin 4) (Fin 4) A) (h : Matrix.charpoly r=gsp4SpinPolynomial q T₀ T₁ T₂) :
    (1-(r.map C)*((X : A[X]) • (1 : Matrix (Fin 4) (Fin 4) A[X])) : Matrix (Fin 4) (Fin 4) A[X]).det =
      gsp4ReversedSpinPolynomial q T₀ T₁ T₂ := sorry
/-- IHG.3/gsp4-dual-spin-polynomial, with an actual inverted central unit. -/
def gsp4DualSpinPolynomial (q : A) (T₀ : Aˣ) (T₁ T₂ : A) : A[X] :=
  X^4-C ((↑T₀⁻¹)*T₁)*X^3+C ((↑T₀⁻¹)^2*(q*T₂+(q^3+q)*↑T₀))*X^2-
    C (q^3*(↑T₀⁻¹)^2*T₁)*X+C (q^6*(↑T₀⁻¹)^2)
theorem gsp4DualSpinPolynomial_constant (q : A) (T₀ : Aˣ) (T₁ T₂ : A) :
    (gsp4DualSpinPolynomial q T₀ T₁ T₂).coeff 0=q^6*(↑T₀⁻¹)^2 := sorry
/-- Coefficient-by-coefficient identity P(X)Q(0)=X⁴Q(q³/X). -/
theorem gsp4DualSpinPolynomial_reciprocal (q : Aˣ) (T₀ : Aˣ) (T₁ T₂ : A)
    (i : ℕ) (hi : i ≤ 4) :
    (gsp4DualSpinPolynomial (q : A) T₀ T₁ T₂).coeff i * ((q : A)^6*(T₀ : A)^2) =
      (gsp4SpinPolynomial (q : A) T₀ T₁ T₂).coeff (4-i)*(q : A)^(3*(4-i)) := sorry
/-- IHG.3/galois-type-maximal-ideal. The finite residue field is explicit.
The residual semisimplicity condition is written as an invariant complement condition. -/
def IsGaloisType {T G V : Type u} [CommRing T] [Group G] [TopologicalSpace G]
    (m : Ideal T) [m.IsMaximal] [Finite (T ⧸ m)] [TopologicalSpace (T ⧸ m)] [DiscreteTopology (T ⧸ m)] (n : ℕ)
    (Frob : V → G) (P : V → (T ⧸ m)[X]) : Prop :=
  ∃ ρ : MonoidAlgebra (T ⧸ m) G →ₐ[T ⧸ m] Matrix (Fin n) (Fin n) (T ⧸ m),
    Continuous (fun g : G ↦ ρ (MonoidAlgebra.of (T ⧸ m) G g)) ∧
      MatrixRepresentationSemisimple ρ ∧
      ∀ v, Matrix.charpoly (ρ (MonoidAlgebra.of (T ⧸ m) G (Frob v)))=P v
/-- The same residue representation realizing the Frobenius polynomials is absolutely
irreducible. This remains meaningful for a prototype with an arbitrary Frobenius family. -/
def IsNonEisenstein {T G V : Type u} [CommRing T] [Group G] [TopologicalSpace G]
    (m : Ideal T) [m.IsMaximal] [Finite (T ⧸ m)] [TopologicalSpace (T ⧸ m)] [DiscreteTopology (T ⧸ m)] (n : ℕ)
    (Frob : V → G) (P : V → (T ⧸ m)[X]) : Prop :=
  ∃ ρ : MonoidAlgebra (T ⧸ m) G →ₐ[T ⧸ m] Matrix (Fin n) (Fin n) (T ⧸ m),
    Continuous (fun g : G ↦ ρ (MonoidAlgebra.of (T ⧸ m) G g)) ∧
      MatrixRepresentationSemisimple ρ ∧ (Determinant.ofMatrix ρ).IsAbsolutelyIrreducible ∧
      ∀ v, Matrix.charpoly (ρ (MonoidAlgebra.of (T ⧸ m) G (Frob v)))=P v
/-- Density of the conjugacy saturation, continuity and Hausdorff coefficients are explicit.
Equality of determinants over an algebraic closure gives the semisimple isomorphism by IHG.1. -/
theorem galoisType_unique {G V : Type u} [Group G] [TopologicalSpace G]
    {k : Type u} [Field k] [TopologicalSpace k] [T2Space k] (n : ℕ) (Frob : V → G)
    (hdense : Dense {g : G | ∃ v h, g=h*Frob v*h⁻¹})
    (D E : Determinant k (MonoidAlgebra k G) n)
    (hD : D.IsContinuous) (hE : E.IsContinuous)
    (h : ∀ v, D.charpoly (MonoidAlgebra.of k G (Frob v)) =
      E.charpoly (MonoidAlgebra.of k G (Frob v))) : D=E := sorry
end TauCeti.Spherical

namespace TauCeti
variable {A B G : Type u} [CommRing A] [CommRing B] [Group G] {d : ℕ}
namespace Determinant
/-- Group-algebra coefficient change uses its canonical scalar-extension isomorphism. -/
def mapCoefficients (D : Determinant A (MonoidAlgebra A G) d) (φ : A →+* B) :
    Determinant B (MonoidAlgebra B G) d := sorry
theorem mapCoefficients_charpoly (D : Determinant A (MonoidAlgebra A G) d)
    (φ : A →+* B) (g : G) :
    (D.mapCoefficients φ).charpoly (MonoidAlgebra.of B G g) =
      (D.charpoly (MonoidAlgebra.of A G g)).map φ := sorry
end Determinant
namespace Interpolation
variable [TopologicalSpace G]
/-- IHG.4/finite-quotient-determinant-data. -/
structure FiniteQuotientData (A : Type u) [CommRing A] (G : Type u) [Group G]
    [TopologicalSpace G] (d : ℕ) (J : ℕ → Ideal A) (hJ : Antitone J) where
  determinant : ∀ r, Determinant (A ⧸ J r) (MonoidAlgebra (A ⧸ J r) G) d
  continuous : ∀ r i, @Continuous G (A ⧸ J r) _ ⊥
    (fun g ↦ ((determinant r).charpoly (MonoidAlgebra.of (A ⧸ J r) G g)).coeff i)
  compatible : ∀ r s (hrs : r ≤ s),
    (determinant s).mapCoefficients (Ideal.Quotient.factor (hJ hrs))=determinant r
namespace FiniteQuotientData
variable {J : ℕ → Ideal A} {hJ : Antitone J} (F : FiniteQuotientData A G d J hJ)
theorem reduce (r s : ℕ) (hrs : r ≤ s) :
    (F.determinant s).mapCoefficients (Ideal.Quotient.factor (hJ hrs)) =
      F.determinant r := sorry
/-- Refinement is precomposition along the actual quotient homomorphism. -/
def refineGroup (r : ℕ) (U V : Subgroup G) [U.Normal] [V.Normal] (hVU : V ≤ U)
    (D : Determinant (A ⧸ J r) (MonoidAlgebra (A ⧸ J r) (G ⧸ U)) d) :
    Determinant (A ⧸ J r) (MonoidAlgebra (A ⧸ J r) (G ⧸ V)) d := sorry
end FiniteQuotientData
/-- Compatible elements in the quotient system, with componentwise ring structure. -/
def quotientLimit (J : ℕ → Ideal A) (hJ : Antitone J) : Subring (∀ r, A ⧸ J r) where
  carrier := {a | ∀ r s (hrs : r ≤ s), Ideal.Quotient.factor (hJ hrs) (a s)=a r}
  one_mem' := sorry
  zero_mem' := sorry
  add_mem' := sorry
  neg_mem' := sorry
  mul_mem' := sorry
/-- IHG.4/inverse-limit-determinant. The separated complete identification is an actual ring equivalence. -/
def inverseLimitDeterminant {J : ℕ → Ideal A} {hJ : Antitone J}
    (F : FiniteQuotientData A G d J hJ) (complete : A ≃+* quotientLimit J hJ)
    (hcomplete : ∀ a r, (complete a).val r=Ideal.Quotient.mk (J r) a) :
    Determinant A (MonoidAlgebra A G) d := sorry
theorem inverseLimitDeterminant_reduce {J : ℕ → Ideal A} {hJ : Antitone J}
    (F : FiniteQuotientData A G d J hJ) (complete : A ≃+* quotientLimit J hJ)
    (hcomplete : ∀ a r, (complete a).val r=Ideal.Quotient.mk (J r) a) (r : ℕ) :
    (inverseLimitDeterminant F complete hcomplete).mapCoefficients (Ideal.Quotient.mk (J r)) =
      F.determinant r := sorry
theorem inverseLimitDeterminant_unique {J : ℕ → Ideal A} {hJ : Antitone J}
    (F : FiniteQuotientData A G d J hJ) (complete : A ≃+* quotientLimit J hJ)
    (hcomplete : ∀ a r, (complete a).val r=Ideal.Quotient.mk (J r) a)
    (D : Determinant A (MonoidAlgebra A G) d)
    (hD : ∀ r, D.mapCoefficients (Ideal.Quotient.mk (J r))=F.determinant r) :
    D=inverseLimitDeterminant F complete hcomplete := sorry
/-- IHG.4/uniform-congruence-witness, for one fixed compact coefficient quotient.
Compactness and continuity make the injective coefficient map a closed embedding.
The uniform adic modulus across levels remains an input to the geometric supplier. -/
structure CongruenceWitness (A : Type u) [CommRing A] (G V : Type u) [Group G]
    [TopologicalSpace A] [CompactSpace A] [T2Space A]
    [TopologicalSpace G] [CompactSpace G] (d : ℕ) (Frob : V → G) where
  count : ℕ
  coefficient : Fin count → CommAlgCat.{u} A
  coefficientTopology : ∀ i, TopologicalSpace (coefficient i)
  coefficientT2 : ∀ i, @T2Space (coefficient i) (coefficientTopology i)
  coefficient_continuous : ∀ i, @Continuous A (coefficient i) _ (coefficientTopology i)
    (algebraMap A (coefficient i))
  classical : ∀ i, Determinant (coefficient i) (MonoidAlgebra (coefficient i) G) d
  classical_continuous : ∀ i k, @Continuous G (coefficient i) _ (coefficientTopology i)
    (fun g ↦ ((classical i).charpoly (MonoidAlgebra.of (coefficient i) G g)).coeff k)
  frobenius_dense : Dense {g : G | ∃ v h, g=h*Frob v*h⁻¹}
  injective : Function.Injective (fun a : A ↦ fun i ↦ algebraMap A (coefficient i) a)
  frobenius_mem : ∀ v k, ∃ a : A, ∀ i,
    ((classical i).charpoly (MonoidAlgebra.of (coefficient i) G (Frob v))).coeff k =
      algebraMap A (coefficient i) a
namespace CongruenceWitness
variable {V : Type u} {Frob : V → G}
variable [TopologicalSpace A] [CompactSpace A] [T2Space A] [CompactSpace G]
/-- Apply compact coefficient gluing to the conjugacy-saturated Frobenius set. -/
def determinant (W : CongruenceWitness A G V d Frob) :
    Determinant A (MonoidAlgebra A G) d := sorry
theorem determinant_continuous (W : CongruenceWitness A G V d Frob) :
    (determinant W).IsContinuous := sorry
/-- Descent is equality of polynomial laws, not only equality at Frobenius elements. -/
theorem determinant_classical (W : CongruenceWitness A G V d Frob) (i : Fin W.count) :
    (determinant W).mapCoefficients (algebraMap A (W.coefficient i))=W.classical i := sorry
/-- With levelwise witnesses, exact reductions express the required integral compatibility. -/
theorem compatible (W : CongruenceWitness A G V d Frob)
    [TopologicalSpace B] [CompactSpace B] [T2Space B]
    (φ : A →+* B) (hφ : Continuous φ) (W' : CongruenceWitness B G V d Frob)
    (h : ∀ v, ((determinant W).charpoly (MonoidAlgebra.of A G (Frob v))).map φ =
      (determinant W').charpoly (MonoidAlgebra.of B G (Frob v))) :
    (determinant W).mapCoefficients φ=determinant W' := sorry
end CongruenceWitness
end Interpolation
end TauCeti

namespace TauCeti.Fitting
variable {A : Type u} [CommRing A]
/-- IHG.6/zeroth-fitting-ideal, including infinitely many relations. -/
def zero (A : Type u) [CommRing A] (M : Type u) [AddCommGroup M] [Module A M]
    [Module.Finite A M] : Ideal A := sorry
theorem mem_of_relations {M : Type u} [AddCommGroup M] [Module A M] [Module.Finite A M]
    (n : ℕ) (π : (Fin n → A) →ₗ[A] M) (hπ : Function.Surjective π)
    (r : Matrix (Fin n) (Fin n) A) (hr : ∀ j, π (fun i ↦ r i j)=0) :
    r.det ∈ zero A M := sorry
theorem baseChange {M B : Type u} [AddCommGroup M] [Module A M] [Module.Finite A M]
    [CommRing B] [Algebra A B] [Module.Finite B (B ⊗[A] M)] :
    zero B (B ⊗[A] M) = (zero A M).map (algebraMap A B) := sorry
end TauCeti.Fitting

namespace TauCeti.IntegralRibet
variable {A B G : Type u} [CommRing A] [CommRing B] [Algebra A B] [Group G]
def characterAlg (χ : G →* Aˣ) : MonoidAlgebra A G →ₐ[A] A := sorry
/-- IHG.6/ribet-difference-modules. -/
def differenceMap (ρ : MonoidAlgebra A G →ₐ[A] Matrix (Fin 2) (Fin 2) B)
    (ψ : G →* Aˣ) : MonoidAlgebra A G →ₗ[A] Matrix (Fin 2) (Fin 2) B :=
  ρ.toLinearMap - (Algebra.linearMap A (Matrix (Fin 2) (Fin 2) B)).comp (characterAlg ψ).toLinearMap
def differenceModule (ρ : MonoidAlgebra A G →ₐ[A] Matrix (Fin 2) (Fin 2) B)
    (ψ : G →* Aˣ) : Submodule A (Matrix (Fin 2) (Fin 2) B) := (differenceMap ρ ψ).range
theorem differenceModule_generators (ρ : MonoidAlgebra A G →ₐ[A] Matrix (Fin 2) (Fin 2) B)
    (ψ : G →* Aˣ) : differenceModule ρ ψ = Submodule.span A
      {x | ∃ g : G, x = ρ (MonoidAlgebra.of A G g) - algebraMap A _ (ψ g)} := sorry
def differenceProduct (ρ : MonoidAlgebra A G →ₐ[A] Matrix (Fin 2) (Fin 2) B)
    (χ ψ : G →* Aˣ) : Submodule A (Matrix (Fin 2) (Fin 2) B) :=
  Submodule.span A {z | ∃ x ∈ differenceModule ρ χ, ∃ y ∈ differenceModule ρ ψ, z=x*y}
/-- Product containment is a separate lemma; comap implements it inside Δψ. -/
def productInside (ρ : MonoidAlgebra A G →ₐ[A] Matrix (Fin 2) (Fin 2) B)
    (χ ψ : G →* Aˣ) : Submodule A (differenceModule ρ ψ) :=
  (differenceProduct ρ χ ψ).comap (differenceModule ρ ψ).subtype
/-- IHG.6/initial-ribet-module. -/
def initialModule (ρ : MonoidAlgebra A G →ₐ[A] Matrix (Fin 2) (Fin 2) B)
    (χ ψ : G →* Aˣ) : ModuleCat.{u} A :=
  ModuleCat.of A (differenceModule ρ ψ ⧸ productInside ρ χ ψ)
def initialModule_mk (ρ : MonoidAlgebra A G →ₐ[A] Matrix (Fin 2) (Fin 2) B)
    (χ ψ : G →* Aˣ) : differenceModule ρ ψ →ₗ[A] initialModule ρ χ ψ :=
  (productInside ρ χ ψ).mkQ
def differenceClass (ρ : MonoidAlgebra A G →ₐ[A] Matrix (Fin 2) (Fin 2) B)
    (χ ψ : G →* Aˣ) (g : G) : initialModule ρ χ ψ :=
  initialModule_mk ρ χ ψ ⟨differenceMap ρ ψ (MonoidAlgebra.of A G g), sorry⟩
theorem initialModule_generators (ρ : MonoidAlgebra A G →ₐ[A] Matrix (Fin 2) (Fin 2) B)
    (χ ψ : G →* Aˣ) : Submodule.span A (Set.range (differenceClass ρ χ ψ)) = ⊤ := sorry
/-- IHG.6/canonical-ribet-cocycle. -/
def canonicalCocycle (ρ : MonoidAlgebra A G →ₐ[A] Matrix (Fin 2) (Fin 2) B)
    (χ ψ : G →* Aˣ) (g : G) : initialModule ρ χ ψ :=
  (↑(ψ g)⁻¹ : A) • differenceClass ρ χ ψ g
theorem canonicalCocycle_apply (ρ : MonoidAlgebra A G →ₐ[A] Matrix (Fin 2) (Fin 2) B)
    (χ ψ : G →* Aˣ) (g : G) :
    canonicalCocycle ρ χ ψ g = (↑(ψ g)⁻¹ : A) • differenceClass ρ χ ψ g := sorry
theorem canonicalCocycle_span (ρ : MonoidAlgebra A G →ₐ[A] Matrix (Fin 2) (Fin 2) B)
    (χ ψ : G →* Aˣ) : Submodule.span A (Set.range (canonicalCocycle ρ χ ψ))=⊤ := sorry
/-- Actual local data, with a chosen distinguished Σ place when Σ is nonempty. -/
structure LocalData (G : Type u) [Group G] where
  count : ℕ
  sigma : Finset (Fin count)
  subgroup : Fin count → Subgroup G
  inertia : Fin count → Subgroup G
  inertia_le : ∀ v, inertia v ≤ subgroup v
  distinguished : Option (Fin count)
  distinguished_mem : ∀ v, distinguished=some v → v ∈ sigma
  distinguished_exists : sigma.Nonempty → ∃ v, distinguished=some v
variable (L : LocalData G)
def extraPlaces : Finset (Fin L.count) := L.sigma.filter (fun v ↦ L.distinguished ≠ some v)
def enlargedModule (ρ : MonoidAlgebra A G →ₐ[A] Matrix (Fin 2) (Fin 2) B)
    (χ ψ : G →* Aˣ) : ModuleCat.{u} A :=
  ModuleCat.of A (initialModule ρ χ ψ × ({v // v ∈ extraPlaces L} → A))
def localRelations (ρ : MonoidAlgebra A G →ₐ[A] Matrix (Fin 2) (Fin 2) B)
    (χ ψ : G →* Aˣ) : Submodule A (enlargedModule L ρ χ ψ) :=
  Submodule.span A {z | (∃ v g, L.distinguished=some v ∧ g ∈ L.subgroup v ∧
      z=(canonicalCocycle ρ χ ψ g,0)) ∨
    (∃ (v : {v // v ∈ extraPlaces L}) (g : G), g ∈ L.subgroup v ∧
      z=(canonicalCocycle ρ χ ψ g,
        -((↑(χ g) : A)*(↑(ψ g)⁻¹ : A)-1) • Pi.single v 1)) ∨
    (∃ v g, v ∉ L.sigma ∧ g ∈ L.inertia v ∧ z=(canonicalCocycle ρ χ ψ g,0))}
/-- IHG.6/local-ribet-quotient. -/
def localModule (ρ : MonoidAlgebra A G →ₐ[A] Matrix (Fin 2) (Fin 2) B)
    (χ ψ : G →* Aˣ) : ModuleCat.{u} A :=
  ModuleCat.of A (enlargedModule L ρ χ ψ ⧸ localRelations L ρ χ ψ)
def localCocycle (ρ : MonoidAlgebra A G →ₐ[A] Matrix (Fin 2) (Fin 2) B)
    (χ ψ : G →* Aˣ) (g : G) : localModule L ρ χ ψ :=
  (localRelations L ρ χ ψ).mkQ (canonicalCocycle ρ χ ψ g,0)
def localVector (ρ : MonoidAlgebra A G →ₐ[A] Matrix (Fin 2) (Fin 2) B)
    (χ ψ : G →* Aˣ) (v : {v // v ∈ extraPlaces L}) : localModule L ρ χ ψ :=
  (localRelations L ρ χ ψ).mkQ (0,Pi.single v 1)
theorem localCocycle_restriction (ρ : MonoidAlgebra A G →ₐ[A] Matrix (Fin 2) (Fin 2) B)
    (χ ψ : G →* Aˣ) :
    (∀ v g, L.distinguished=some v → g ∈ L.subgroup v → localCocycle L ρ χ ψ g=0) ∧
    (∀ (v : {v // v ∈ extraPlaces L}) g, g ∈ L.subgroup v →
      localCocycle L ρ χ ψ g=((↑(χ g) : A)*(↑(ψ g)⁻¹ : A)-1) • localVector L ρ χ ψ v) ∧
    (∀ v g, v ∉ L.sigma → g ∈ L.inertia v → localCocycle L ρ χ ψ g=0) := sorry
theorem localModule_span (ρ : MonoidAlgebra A G →ₐ[A] Matrix (Fin 2) (Fin 2) B)
    (χ ψ : G →* Aˣ) : Submodule.span A
      (Set.range (localCocycle L ρ χ ψ) ∪ Set.range (localVector L ρ χ ψ))=⊤ := sorry
end TauCeti.IntegralRibet

namespace TauCeti.IntegralRibet
open CategoryTheory
/-- IHG.6/ribet-formal-matrix-ring. Coefficient variables remain distinct by their row indices. -/
abbrev formalRing (c n : ℕ) (triangular : Finset (Fin n)) : Type :=
  MvPolynomial (Fin c ⊕ (Fin n × Fin 2 × Fin 2)) ℤ ⧸
    Ideal.span {z : MvPolynomial (Fin c ⊕ (Fin n × Fin 2 × Fin 2)) ℤ |
      ∃ i ∈ triangular, z=MvPolynomial.X (Sum.inr (i,0,1))}
def formalMatrix (c n : ℕ) (triangular : Finset (Fin n)) (i : Fin n) :
    Matrix (Fin 2) (Fin 2) (formalRing c n triangular) :=
  fun j k ↦ Ideal.Quotient.mk _ (MvPolynomial.X (Sum.inr (i,j,k)))
/-- The coefficient variables in the formal ring; the lower Borel fixes them. -/
def formalCoefficient (c n : ℕ) (triangular : Finset (Fin n)) (i : Fin c) :
    formalRing c n triangular :=
  Ideal.Quotient.mk _ (MvPolynomial.X (Sum.inl i))
def formalRing_eval (c n : ℕ) (triangular : Finset (Fin n))
    (K : Type u) [CommRing K] (a : Fin c → K) (X : Fin n → Matrix (Fin 2) (Fin 2) K)
    (hX : ∀ i ∈ triangular, X i 0 1=0) : formalRing c n triangular →ₐ[ℤ] K := sorry
/-- Coordinate algebra of the lower Borel: x,z invertible and y unrestricted. -/
abbrev lowerBorelRing : Type :=
  MvPolynomial (Fin 5) ℤ ⧸ Ideal.span
    ({MvPolynomial.X 0*MvPolynomial.X 3-1, MvPolynomial.X 1*MvPolynomial.X 4-1} :
      Set (MvPolynomial (Fin 5) ℤ))
def formalRing_borel (c n : ℕ) (triangular : Finset (Fin n)) :
    formalRing c n triangular →ₐ[ℤ] lowerBorelRing ⊗[ℤ] formalRing c n triangular := sorry
variable {R : Type u} [CommRing R]
/-- IHG.6/ribet-relation-ideal. Rows are the selected linear, product and local matrices. -/
def relationIdeal {r : ℕ} (rows : Fin r → Matrix (Fin 2) (Fin 2) R) : Ideal R :=
  Ideal.span {z | ∃ t i j, z=rows t i j}
def upperRelationIdeal {r : ℕ} (rows : Fin r → Matrix (Fin 2) (Fin 2) R) : Ideal R :=
  Ideal.span {z | ∃ t, z=rows t 0 1}
theorem upperRelationIdeal_le {r : ℕ} (rows : Fin r → Matrix (Fin 2) (Fin 2) R) :
    upperRelationIdeal rows ≤ relationIdeal rows := sorry
/-- The actual local matrix generator, with Dστ=Aτσ. -/
def localRelationMatrix (X Y : Matrix (Fin 2) (Fin 2) R) (x y : R) :
    Matrix (Fin 2) (Fin 2) R :=
  !![X 0 1*Y 1 0-(y-Y 1 1)*(x-X 0 0), X 0 1*(y-Y 0 0)-Y 0 1*(x-X 0 0);
     X 1 0*(y-Y 1 1)-Y 1 0*(x-X 1 1), Y 0 1*X 1 0-(x-X 1 1)*(y-Y 0 0)]
/-- Universal lower-Borel conjugation, using x,z,y,x⁻¹,z⁻¹ in the coordinate ring. -/
def lowerBorelConjugate (M : Matrix (Fin 2) (Fin 2) R) :
    Matrix (Fin 2) (Fin 2) (lowerBorelRing ⊗[ℤ] R) :=
  let b : Fin 5 → lowerBorelRing ⊗[ℤ] R :=
    fun i ↦ (Ideal.Quotient.mk _ (MvPolynomial.X i) : lowerBorelRing) ⊗ₜ[ℤ] (1 : R)
  let P : Matrix (Fin 2) (Fin 2) (lowerBorelRing ⊗[ℤ] R) := !![b 0,0;b 2,b 1]
  let Pinv : Matrix (Fin 2) (Fin 2) (lowerBorelRing ⊗[ℤ] R) :=
    !![b 3,0;-(b 4*b 2*b 3),b 4]
  Pinv * M.map (Algebra.TensorProduct.includeRight : R →ₐ[ℤ] lowerBorelRing ⊗[ℤ] R) * P
/-- The selected formal relation rows transform by the adjoint action (DKSW Lemma 4.18).
This covariance, rather than an arbitrary choice of algebra map, implies stability. -/
theorem relationIdeal_stable {r : ℕ} (rows : Fin r → Matrix (Fin 2) (Fin 2) R)
    (δ : R →ₐ[ℤ] lowerBorelRing ⊗[ℤ] R)
    (hrows : ∀ t, (rows t).map δ=lowerBorelConjugate (rows t)) :
    (∀ a ∈ relationIdeal rows,
      Algebra.TensorProduct.map (AlgHom.id ℤ lowerBorelRing)
        (Ideal.Quotient.mkₐ ℤ (relationIdeal rows)) (δ a)=0) ∧
    (∀ a ∈ upperRelationIdeal rows,
      Algebra.TensorProduct.map (AlgHom.id ℤ lowerBorelRing)
        (Ideal.Quotient.mkₐ ℤ (upperRelationIdeal rows)) (δ a)=0) := sorry
/-- Noncommutative polynomial evaluation over the coefficient generators. -/
def wordEvaluation {c n : ℕ} (coefficient : Fin c → R)
    (X : Fin n → Matrix (Fin 2) (Fin 2) R) :
    FreeAlgebra ℤ (Fin c ⊕ Fin n) →ₐ[ℤ] Matrix (Fin 2) (Fin 2) R := sorry
/-- IHG.6/ribet-trace-determinant-subring. -/
def invariantSubring {c n : ℕ} (coefficient : Fin c → R)
    (X : Fin n → Matrix (Fin 2) (Fin 2) R) (triangular : Finset (Fin n)) : Subalgebra ℤ R :=
  Algebra.adjoin ℤ (Set.range coefficient ∪
    {a | ∃ f : FreeAlgebra ℤ (Fin c ⊕ Fin n), a=Matrix.trace (wordEvaluation coefficient X f)} ∪
    {a | ∃ f : FreeAlgebra ℤ (Fin c ⊕ Fin n), a=(wordEvaluation coefficient X f).det} ∪
    {a | ∃ i ∈ triangular, a=X i 1 1})
theorem trace_mem_invariantSubring {c n : ℕ} (coefficient : Fin c → R)
    (X : Fin n → Matrix (Fin 2) (Fin 2) R) (triangular : Finset (Fin n))
    (f : FreeAlgebra ℤ (Fin c ⊕ Fin n)) :
    Matrix.trace (wordEvaluation coefficient X f) ∈ invariantSubring coefficient X triangular := sorry
/-- Invariant subalgebra is the equalizer of the actual coaction and a↦1⊗a. -/
def borelInvariants (δ : R →ₐ[ℤ] lowerBorelRing ⊗[ℤ] R) : Subalgebra ℤ R where
  carrier := {a | δ a=1 ⊗ₜ[ℤ] a}
  algebraMap_mem' := sorry
  zero_mem' := sorry
  one_mem' := sorry
  add_mem' := sorry
  mul_mem' := sorry
/-- The formal ring, its generators and its conjugation coaction are fixed together. -/
theorem invariantSubring_eq_borel (c n : ℕ) (triangular : Finset (Fin n)) :
    invariantSubring (formalCoefficient c n triangular) (formalMatrix c n triangular) triangular =
      borelInvariants (formalRing_borel c n triangular) := sorry
end TauCeti.IntegralRibet

namespace TauCeti.BuchsbaumRim
open CategoryTheory
variable {A : Type u} [CommRing A] {m n : ℕ}
/-- IHG.6/buchsbaum-rim-complex. Requires 1 ≤ m ≤ n; the construction retains exterior-bar signs. -/
def moduleComplex (f : (Fin n → A) →ₗ[A] (Fin m → A)) : ChainComplex (ModuleCat.{u} A) ℕ := sorry
def moduleComplex_X_zero (f : (Fin n → A) →ₗ[A] (Fin m → A)) :
    (moduleComplex f).X 0 ≅ ModuleCat.of A (Fin m → A) := sorry
def moduleComplex_X_one (f : (Fin n → A) →ₗ[A] (Fin m → A)) :
    (moduleComplex f).X 1 ≅ ModuleCat.of A (Fin n → A) := sorry
theorem moduleComplex_d_one (f : (Fin n → A) →ₗ[A] (Fin m → A)) :
    (moduleComplex_X_one f).inv ≫ (moduleComplex f).d 1 0 ≫ (moduleComplex_X_zero f).hom =
      ModuleCat.ofHom f := sorry
/-- Standard determinant-line trivialization for a rank-two target, used to test d₂. -/
def moduleComplex_X_two_rank_two (f : (Fin n → A) →ₗ[A] (Fin 2 → A)) :
    (moduleComplex f).X 2 ≅ ModuleCat.of A (⋀[A]^3 (Fin n → A)) := sorry
/-- The supplied complex is DD.1's Koszul complex of the rank-one map. -/
def moduleComplex_rank_one (f : (Fin n → A) →ₗ[A] (Fin 1 → A))
    (koszul : ChainComplex (ModuleCat.{u} A) ℕ) : moduleComplex f ≅ koszul := sorry
/-- IHG.6/buchsbaum-rim-determinantal-complex. -/
def determinantalComplex (f : (Fin n → A) →ₗ[A] (Fin m → A)) : ChainComplex (ModuleCat.{u} A) ℕ := sorry
def determinantalComplex_X_zero (f : (Fin n → A) →ₗ[A] (Fin m → A)) :
    (determinantalComplex f).X 0 ≅ ModuleCat.of A (⋀[A]^m (Fin m → A)) := sorry
def determinantalComplex_X_one (f : (Fin n → A) →ₗ[A] (Fin m → A)) :
    (determinantalComplex f).X 1 ≅ ModuleCat.of A (⋀[A]^m (Fin n → A)) := sorry
theorem determinantalComplex_d_one (f : (Fin n → A) →ₗ[A] (Fin m → A)) :
    (determinantalComplex_X_one f).inv ≫ (determinantalComplex f).d 1 0 ≫
      (determinantalComplex_X_zero f).hom = ModuleCat.ofHom (exteriorPower.map m f) := sorry
def determinantalComplex_map {n' : ℕ}
    (f : (Fin n → A) →ₗ[A] (Fin m → A)) (f' : (Fin n' → A) →ₗ[A] (Fin m → A))
    (g : (Fin n → A) →ₗ[A] (Fin n' → A)) (hg : f'.comp g=f) :
    determinantalComplex f ⟶ determinantalComplex f' := sorry
def maximalMinorIdeal (f : (Fin n → A) →ₗ[A] (Fin m → A)) : Ideal A :=
  Ideal.span {a | ∃ j : Fin m → Fin n, Function.Injective j ∧
    a=Matrix.det (fun i k ↦ f (Pi.single (j k) 1) i)}
/-- Choosing the standard determinant basis identifies the determinant line with A. -/
def determinantalComplex_homology_zero (f : (Fin n → A) →ₗ[A] (Fin m → A)) :
    (determinantalComplex f).homology 0 ≅ ModuleCat.of A (A ⧸ maximalMinorIdeal f) := sorry
def prefixMap (f : (Fin n → A) →ₗ[A] (Fin m → A)) (k : ℕ) (hk : k ≤ n) :
    (Fin k → A) →ₗ[A] (Fin m → A) := sorry
/-- IHG.6/buchsbaum-rim-regular: every prefix, not just the full map. -/
def IsRegular (f : (Fin n → A) →ₗ[A] (Fin m → A)) : Prop :=
  ∀ k (_hmk : m ≤ k) (hkn : k ≤ n), Limits.IsZero ((moduleComplex (prefixMap f k hkn)).homology 1)
theorem IsRegular_prefix (f : (Fin n → A) →ₗ[A] (Fin m → A)) (hf : IsRegular f)
    (k : ℕ) (hmk : m ≤ k) (hkn : k ≤ n) : IsRegular (prefixMap f k hkn) := sorry
/-- The ordered row entries are the weak regular sequence; no proper-quotient condition is added. -/
theorem IsRegular_rank_one (f : (Fin n → A) →ₗ[A] (Fin 1 → A)) :
    IsRegular f ↔ RingTheory.Sequence.IsWeaklyRegular A
      ((List.finRange n).map fun i ↦ f (Pi.single i 1) 0) := sorry
end TauCeti.BuchsbaumRim

namespace TauCeti.IntegralRibet
open CategoryTheory
variable {R : Type u} [CommRing R]
/-- IHG.6/ribet-upper-relation-complex. Koszul tensor the twisted local determinant complexes.
The rational lower-Borel comodule and determinant-character twist are omitted until LP3 supplies them. -/
def upperRelationComplex {l v : ℕ} (linearRelations : Fin l → R)
    (localSize : Fin v → ℕ)
    (localMaps : ∀ t, (Fin (localSize t) → R) →ₗ[R] (Fin 2 → R)) :
    ChainComplex (ModuleCat.{u} R) ℕ := sorry
def upperRelationComplex_X_zero {l v : ℕ} (linearRelations : Fin l → R)
    (localSize : Fin v → ℕ)
    (localMaps : ∀ t, (Fin (localSize t) → R) →ₗ[R] (Fin 2 → R)) :
    (upperRelationComplex linearRelations localSize localMaps).X 0 ≅ ModuleCat.of R R := sorry
theorem upperRelationComplex_image {l v : ℕ} (linearRelations : Fin l → R)
    (localSize : Fin v → ℕ)
    (localMaps : ∀ t, (Fin (localSize t) → R) →ₗ[R] (Fin 2 → R)) :
    LinearMap.range
      (((upperRelationComplex linearRelations localSize localMaps).d 1 0 ≫
        (upperRelationComplex_X_zero linearRelations localSize localMaps).hom).hom) =
      ((Ideal.span (Set.range linearRelations) ⊔
        ⨆ t, BuchsbaumRim.maximalMinorIdeal (localMaps t)) : Submodule R R) := sorry
/-- Augmentation on degree zero, with positive degrees zero; the target is the single-object complex. -/
def upperRelationComplex_augmentation {l v : ℕ} (linearRelations : Fin l → R)
    (localSize : Fin v → ℕ)
    (localMaps : ∀ t, (Fin (localSize t) → R) →ₗ[R] (Fin 2 → R)) :
    (upperRelationComplex linearRelations localSize localMaps).X 0 →ₗ[R]
      R ⧸ (Ideal.span (Set.range linearRelations) ⊔
        ⨆ t, BuchsbaumRim.maximalMinorIdeal (localMaps t)) := sorry
/-- IHG.6/ribet-full-relation-complex. Adjoint multilinear/distinct-block tensor construction;
positive-degree exactness is not asserted. -/
def fullRelationComplex {r : ℕ} (rows : Fin r → Matrix (Fin 2) (Fin 2) R)
    (localBlock : Fin r → Option ℕ) : ChainComplex (ModuleCat.{u} R) ℕ := sorry
def fullRelationComplex_X_zero {r : ℕ} (rows : Fin r → Matrix (Fin 2) (Fin 2) R)
    (localBlock : Fin r → Option ℕ) :
    (fullRelationComplex rows localBlock).X 0 ≅ ModuleCat.of R R := sorry
theorem fullRelationComplex_image {r : ℕ} (rows : Fin r → Matrix (Fin 2) (Fin 2) R)
    (localBlock : Fin r → Option ℕ) :
    LinearMap.range (((fullRelationComplex rows localBlock).d 1 0 ≫
      (fullRelationComplex_X_zero rows localBlock).hom).hom) =
      (relationIdeal rows : Submodule R R) := sorry
/-- Rational comodule structure is omitted until LP3 supplies its carrier.
The underlying module is a finite direct sum of adjoint tensor powers. -/
theorem fullRelationComplex_terms {r : ℕ} (rows : Fin r → Matrix (Fin 2) (Fin 2) R)
    (localBlock : Fin r → Option ℕ) (k : ℕ) :
    ∃ count : ℕ, Nonempty ((fullRelationComplex rows localBlock).X k ≅
      ModuleCat.of R (Fin count → TensorPower R k (Matrix (Fin 2) (Fin 2) R))) := sorry
end TauCeti.IntegralRibet

namespace TauCeti.RoadmapTheorem
open CategoryTheory
variable {A : Type u} [CommRing A] {R : Type u} [Ring R] [Algebra A R] {d : ℕ}
local instance : HasDerivedCategory.{u+1} (ModuleCat.{u} A) :=
  HasDerivedCategory.standard (ModuleCat.{u} A)
def Supported (C : DerivedCategory (ModuleCat.{u} A)) (a b : ℤ) : Prop :=
  ∀ i : ℤ, i < a ∨ b < i → Limits.IsZero ((DerivedCategory.homologyFunctor (ModuleCat.{u} A) i).obj C)
def FiniteCohomology (C : DerivedCategory (ModuleCat.{u} A)) : Prop :=
  ∀ i : ℤ, Module.Finite A ((DerivedCategory.homologyFunctor (ModuleCat.{u} A) i).obj C)
abbrev FaithfulQuotient (D : Determinant A R d) := D.kerTwoSided.ringCon.Quotient
/-- Characteristic-polynomial integrality and the complete coefficient congruence. -/
def RibetCongruence {B G : Type u} [CommRing B] [Algebra A B] [Group G]
    (ρ : MonoidAlgebra A G →ₐ[A] Matrix (Fin 2) (Fin 2) B)
    (χ ψ : G →* Aˣ) (I : Ideal A) : Prop :=
  ∀ g : G, ∃ P : A[X],
    P.map (algebraMap A B)=Matrix.charpoly (ρ (MonoidAlgebra.of A G g)) ∧
    P.map (Ideal.Quotient.mk I)=(X-C (Ideal.Quotient.mk I (χ g)))*(X-C (Ideal.Quotient.mk I (ψ g)))
def RibetIrreducibleOn {B G k : Type u} [CommRing B] [Algebra A B] [Group G] [Field k]
    (ρ : MonoidAlgebra A G →ₐ[A] Matrix (Fin 2) (Fin 2) B) (φ : B →+* k) : Prop :=
  ∀ W : Submodule k (Fin 2 → k),
    (∀ g : G, ∀ x ∈ W, ((ρ (MonoidAlgebra.of A G g)).map φ).mulVec x ∈ W) → W=⊥ ∨ W=⊤
def genericMatrix (S : Type) (d : ℕ) (s : S) :
    Matrix (Fin d) (Fin d) (MvPolynomial (S × Fin d × Fin d) ℤ) :=
  fun i j ↦ MvPolynomial.X (s,i,j)
def matrixWordCoefficients (S : Type) (d : ℕ) :
    Subalgebra ℤ (MvPolynomial (S × Fin d × Fin d) ℤ) :=
  Algebra.adjoin ℤ {a | ∃ w : List S, ∃ k : ℕ,
    a=(Matrix.charpoly ((w.map (genericMatrix S d)).prod)).coeff k}


/-- `IntegralHeckeAndGaloisDeterminants:IHG.2/derived-hom-finite`.
Let A be a commutative noetherian ring and M,N in D(A) have finitely generated cohomology, nonzero in only finitely many degrees. The A-module Hom_D(A)(M,N) is finitely generated. No finite-projective-dimension hypothesis is imposed. -/
theorem derived_hom_finite [IsNoetherianRing A] (M N : DerivedCategory (ModuleCat.{u} A))
    (a b c e : ℤ) (hM : Supported M a b) (hN : Supported N c e)
    (hfinM : FiniteCohomology M) (hfinN : FiniteCohomology N) : Module.Finite A (M ⟶ N) := sorry

/-- `IntegralHeckeAndGaloisDeterminants:IHG.2/derived-idempotent-splitting`.
For every ring A, any idempotent e:C→C in D(A) splits: there are C_e, i:C_e→C and p:C→C_e with p∘i=1 and i∘p=e. Consequently C≅C_e⊕C_(1−e). -/
theorem derived_idempotent_splitting (C : DerivedCategory (ModuleCat.{u} A)) (e : End C) (he : e*e=e) :
    ∃ (Ce : DerivedCategory (ModuleCat.{u} A)) (i : Ce ⟶ C) (p : C ⟶ Ce), i ≫ p=𝟙 Ce ∧ p ≫ i=e := sorry

/-- `IntegralHeckeAndGaloisDeterminants:IHG.2/ghost-nilpotence`.
For a ring A and C∈D(A) with H^i(C)=0 outside [a,b], a ≤ b, every composite of b−a+1 degree-zero ghosts is zero. Hence G(C)^(b−a+1)=0, and J(C)^(b−a+1)=0 for every Hecke image. -/
theorem ghost_nilpotence (C : DerivedCategory (ModuleCat.{u} A)) (a b : ℤ) (hab : a ≤ b) (hC : Supported C a b) :
    ∀ fs : Fin ((b-a).toNat+1) → End C,
      (∀ i, fs i ∈ HeckeImage.ghostIdeal C) → (List.ofFn fs).prod=0 := sorry

/-- `IntegralHeckeAndGaloisDeterminants:IHG.2/finite-hecke-local-factors`.
Let A be a complete noetherian local ring and T a finite commutative A-algebra. T has finitely many maximal ideals, and T≅∏_mT_m. Each factor T_m is a complete noetherian local A-algebra; the projection is multiplication by a unique central idempotent e_m.

Completeness of each local factor and the identification with localization are omitted from this signature; they require the supplier localization topology interface. -/
theorem finite_hecke_local_factors [IsLocalRing A] [IsNoetherianRing A]
    [IsAdicComplete (IsLocalRing.maximalIdeal A) A]
    (T : Type u) [CommRing T] [Algebra A T] [Module.Finite A T] :
    ∃ (s : ℕ) (factor : Fin s → CommAlgCat.{u} A),
      (∀ i, IsLocalRing (factor i)) ∧ Nonempty (T ≃ₐ[A] ∀ i, factor i) := sorry

/-- `IntegralHeckeAndGaloisDeterminants:IHG.3/reciprocal-charpoly`.
For a degree-n determinant and a unit g, write P_g(X)=∑a_iX^{n−i}, a_0=1 and a_n a unit. Then P_{g^{-1}}(X)=a_n^{-1}∑_{i=0}^n a_iX^i. Equivalently it is X^nP_g(X^{-1})/P_g(0). This is the monic polynomial with inverse roots. -/
theorem reciprocal_charpoly {G : Type u} [Group G] (D : Determinant A (MonoidAlgebra A G) d)
    (g : G) (i : ℕ) (hi : i ≤ d) :
    (D.charpoly (MonoidAlgebra.of A G g⁻¹)).coeff i * (D.charpoly (MonoidAlgebra.of A G g)).coeff 0=
      (D.charpoly (MonoidAlgebra.of A G g)).coeff (d-i) := sorry

/-- `IntegralHeckeAndGaloisDeterminants:IHG.2/large-prime-hecke-completion`.
Let H be a finite torsionfree Z[1/M]-module carrying a commuting Hecke algebra T⊂End(H). Assume T_Q is a finite product of number fields acting semisimply and the relevant eigenvalue systems are integral in a common splitting order. Outside finitely many rational primes, the order has no congruences between distinct eigencharacters and is étale. After an unramified splitting coefficient extension O, the completion of the finite image at one residual eigencharacter is O. The torsionfree, semisimple and no-congruence hypotheses are retained; this is not a claim for every prime or every derived Hecke image.

Omitted: the global finite set of bad primes and the integral eigencharacter splitting theorem. The signature gives the actual completion at a residual eigencharacter once the good-prime splitting order is supplied. -/
theorem large_prime_hecke_completion (O : Type u) [CommRing O] [Algebra A O]
    [IsLocalRing O] [IsAdicComplete (IsLocalRing.maximalIdeal O) O]
    (T : Type u) [CommRing T] [Algebra A T] [Module.Finite A T]
    (s : ℕ) (split : O ⊗[A] T ≃ₐ[O] (Fin s → O)) (i : Fin s)
    (π : O ⊗[A] T →ₐ[O] O) (hπ : ∀ t, π t=split t i) :
    Nonempty (AdicCompletion (RingHom.ker ((IsLocalRing.residue O).comp π.toRingHom))
      (O ⊗[A] T) ≃ₐ[O] O) := sorry

/-- `IntegralHeckeAndGaloisDeterminants:IHG.4/frobenius-determinant-uniqueness`.
Let A be Hausdorff and D_1,D_2 continuous degree-d determinants of G_{F,S}. If all characteristic-polynomial coefficients agree on Frobenius conjugacy classes outside S, they agree on G_{F,S}, hence D_1=D_2. Use Chebotarev on every finite quotient and conjugacy invariance; a set of chosen representatives need not itself be dense before taking conjugates. -/
theorem frobenius_determinant_uniqueness {G V : Type u} [Group G] [TopologicalSpace G] [TopologicalSpace A] [T2Space A]
    (Frob : V → G) (hdense : Dense {g : G | ∃ v h, g=h*Frob v*h⁻¹})
    (D E : Determinant A (MonoidAlgebra A G) d) (hD : D.IsContinuous) (hE : E.IsContinuous)
    (h : ∀ v, D.charpoly (MonoidAlgebra.of A G (Frob v))=E.charpoly (MonoidAlgebra.of A G (Frob v))) : D=E := sorry

/-- `IntegralHeckeAndGaloisDeterminants:IHG.4/compact-determinant-gluing`.
Let G be compact, A compact Hausdorff, all A_i Hausdorff, and ι:A→∏A_i a continuous injective ring map. Let D_i be continuous degree-d determinants. If for each g in a dense subset X⊂G the tuple of characteristic polynomials lies in ι(A)[X], there is a unique continuous determinant D over A with D⊗A_i=D_i. The compact closed embedding gives integrality on all G; an injective map without closed image does not suffice. -/
theorem compact_determinant_gluing {G : Type u} [Group G] [TopologicalSpace G] [CompactSpace G]
    [TopologicalSpace A] [CompactSpace A] [T2Space A]
    (ι : Type u) (B : ι → Type u) [∀ i, CommRing (B i)] [∀ i, TopologicalSpace (B i)] [∀ i, T2Space (B i)]
    (φ : ∀ i, A →+* B i) (hinj : Function.Injective (fun a : A ↦ fun i ↦ φ i a))
    (hφ : ∀ i, Continuous (φ i))
    (D : ∀ i, Determinant (B i) (MonoidAlgebra (B i) G) d) (hD : ∀ i, (D i).IsContinuous)
    (S : Set G) (hS : Dense S)
    (hcoeff : ∀ g ∈ S, ∀ k, ∃ a : A, ∀ i,
      ((D i).charpoly (MonoidAlgebra.of (B i) G g)).coeff k=φ i a) :
    ∃! E : Determinant A (MonoidAlgebra A G) d,
      E.IsContinuous ∧ ∀ i, E.mapCoefficients (φ i)=D i := sorry

/-- `IntegralHeckeAndGaloisDeterminants:IHG.4/classical-interpolation`.
A compatible system of uniform congruence witnesses for A/J_r produces a continuous degree-d determinant over A with the prescribed Frobenius polynomials, unramified outside the fixed S. It is unique. Characteristic-zero density alone does not supply the witnesses when A is nonreduced.

The continuous adic topology and unramified Galois quotient are omitted here. The finite-quotient data are supplied by uniform congruence witnesses, never by field-point density alone. -/
theorem classical_interpolation {G : Type u} [Group G] [TopologicalSpace G]
    {J : ℕ → Ideal A} {hJ : Antitone J}
    (F : Interpolation.FiniteQuotientData A G d J hJ)
    (complete : A ≃+* Interpolation.quotientLimit J hJ)
    (hc : ∀ a r, (complete a).val r=Ideal.Quotient.mk (J r) a) :
    ∃! D : Determinant A (MonoidAlgebra A G) d,
      ∀ r, D.mapCoefficients (Ideal.Quotient.mk (J r))=F.determinant r := sorry

/-- `IntegralHeckeAndGaloisDeterminants:IHG.5/nilpotent-comparison-schema`.
Let f:T→B be a continuous homomorphism with kernel J, J^N=0, and T/J compact Hausdorff embedded in Hausdorff B. Suppose an actual continuous degree-d determinant over B is supplied and its characteristic-polynomial coefficients belong to f(T) on the dense Frobenius classes. Then it descends uniquely to T/J. The theorem concludes a determinant only in T/J; it supplies neither the geometric comparison nor a lift to T.

The topological and coefficient-integrality inputs are expressible and explicit.
The conclusion is only over T/kerφ. -/
theorem nilpotent_comparison_schema {T B G : Type u} [CommRing T] [CommRing B] [Group G]
    [TopologicalSpace G] [CompactSpace G]
    (φ : T →+* B) (n : ℕ) (hn : 0 < n) (hker : (RingHom.ker φ)^n=⊥)
    [TopologicalSpace (T ⧸ RingHom.ker φ)] [CompactSpace (T ⧸ RingHom.ker φ)]
    [T2Space (T ⧸ RingHom.ker φ)] [TopologicalSpace B] [T2Space B]
    (hφ : Continuous (RingHom.kerLift φ))
    (D : Determinant B (MonoidAlgebra B G) d) (hD : D.IsContinuous)
    (S : Set G) (hS : Dense S)
    (hcoeff : ∀ g ∈ S, ∀ k, ∃ a : T ⧸ RingHom.ker φ,
      (D.charpoly (MonoidAlgebra.of B G g)).coeff k=RingHom.kerLift φ a) :
    ∃! E : Determinant (T ⧸ RingHom.ker φ) (MonoidAlgebra (T ⧸ RingHom.ker φ) G) d,
      E.IsContinuous ∧ E.mapCoefficients (RingHom.kerLift φ)=D := sorry

/-- `IntegralHeckeAndGaloisDeterminants:IHG.5/residual-semismple-specialization`.
For a determinant over T/J and a maximal ideal m⊂T with J nilpotent, base change gives a residual determinant over T/m. Over an algebraic closure it determines a unique semisimple degree-d representation up to isomorphism, continuous with finite image when the residue field is discrete and the determinant is continuous.

Nilpotence of J implies J ≤ m. Discrete residue-field continuity and finite image are omitted from this algebraic signature. -/
theorem residual_semismple_specialization {T G k : Type u} [CommRing T] [Group G] [Field k] [IsAlgClosed k]
    (J m : Ideal T) [m.IsMaximal] (hJm : J ≤ m) [Algebra (T ⧸ m) k]
    (D : Determinant (T ⧸ J) (MonoidAlgebra (T ⧸ J) G) d) :
    ∃ ρ : MonoidAlgebra k G →ₐ[k] Matrix (Fin d) (Fin d) k,
      Determinant.ofMatrix ρ=D.mapCoefficients ((algebraMap (T ⧸ m) k).comp (Ideal.Quotient.factor hJm)) ∧
      MatrixRepresentationSemisimple ρ := sorry

/-- `IntegralHeckeAndGaloisDeterminants:IHG.5/residual-irreducible-quotient-lift`.
Let T/J be henselian local and its determinant be residually split absolutely irreducible of degree d. The Cayley–Hamilton algebra is M_d(T/J), giving a representation over T/J up to conjugation. A representation over T is not asserted, and residual reducibility does not satisfy the hypothesis. -/
theorem residual_irreducible_quotient_lift {T G : Type u} [CommRing T] [Group G] (J : Ideal T)
    [HenselianLocalRing (T ⧸ J)] (D : Determinant (T ⧸ J) (MonoidAlgebra (T ⧸ J) G) d)
    (hSplit : D.residual.IsSplit) (hIrr : D.residual.IsAbsolutelyIrreducible) :
    ∃ ρ : MonoidAlgebra (T ⧸ J) G →ₐ[T ⧸ J] Matrix (Fin d) (Fin d) (T ⧸ J),
      Determinant.ofMatrix ρ=D := sorry

/-- `IntegralHeckeAndGaloisDeterminants:IHG.6/distinct-character-ribet`.
Under Theorem 1.1’s hypotheses with χ≢ψ modulo m, choose τ with χ(τ)−ψ(τ) a unit and diagonalize ρ(τ) using its two Henselian roots. Let B be the finite T-module generated by upper-right matrix entries b(g). Then κ(g)=ψ(g)⁻¹b(g) modulo IB is a continuous cocycle, every representative generates B/IB, B is faithful and Fitt₀_T(B/IB)⊆I.

Omitted: B is the total fraction ring, generic field-factor irreducibility and the Henselian diagonalizing basis. L is the upper-entry lattice, and the cocycle is ψ(g)⁻¹b(g) in L/IL. Faithfulness belongs to L before quotient. -/
theorem distinct_character_ribet {B G : Type u} [CommRing B] [Algebra A B] [Group G]
    [IsLocalRing A] [IsNoetherianRing A] [IsReduced A]
    [IsAdicComplete (IsLocalRing.maximalIdeal A) A]
    [TopologicalSpace G] [CompactSpace G] [TopologicalSpace A] [TopologicalSpace B]
    (hAdic : IsAdic (IsLocalRing.maximalIdeal A))
    (ρ : MonoidAlgebra A G →ₐ[A] Matrix (Fin 2) (Fin 2) B)
    (hρ : Continuous (fun g : G ↦ ρ (MonoidAlgebra.of A G g)))
    (χ ψ : G →* Aˣ) (hχ : Continuous χ) (hψ : Continuous ψ)
    (I : Ideal A) (hchar : RibetCongruence ρ χ ψ I) (τ : G) (hτ : IsUnit ((↑(χ τ) : A)-(↑(ψ τ) : A))) :
    ∃ (L : ModuleCat.{u} A) (hfin : Module.Finite A L),
      letI := hfin
      Function.Injective (fun a : A ↦ (a • LinearMap.id : L →ₗ[A] L)) ∧
      Fitting.zero A (L ⧸ (I • (⊤ : Submodule A L))) ≤ I := sorry

/-- `IntegralHeckeAndGaloisDeterminants:IHG.6/weighted-fitting-containment`.
Under exactly Theorem 2.1’s hypotheses, including χ≡ψ modulo m, local triangularizations diag(η_v,ξ_v), ξ_v≡ψ on Σ, ξ_v≡χ on I_v for v∈P, and chosen σ_v∈G_v, the finite local quotient N satisfies (∏_(v∈P)(ξ_v(σ_v)−χ(σ_v)))·Fitt₀_T(N)·T̃⊆Ĩ. The containment is in T̃; local factors need not belong to T.

Omitted: injective T→Tilde, B=Frac(Tilde) is a product of local rings with principal maximal ideals and reduced field-factor irreducibility, ρ continuity, χ≡ψ mod m, chosen local triangularizations diag(η_v,ξ_v), ξ≡ψ on Σ and ξ≡χ on the specified inertias. The containment is in Tilde. -/
theorem weighted_fitting_containment {Tilde B G : Type u} [CommRing Tilde] [CommRing B] [Algebra A Tilde]
    [Algebra Tilde B] [Algebra A B] [IsScalarTower A Tilde B] [Group G]
    [IsLocalRing A] [IsNoetherianRing A] [IsNoetherianRing Tilde]
    [IsAdicComplete (IsLocalRing.maximalIdeal A) A]
    [IsAdicComplete (IsLocalRing.maximalIdeal A) Tilde]
    [TopologicalSpace G] [CompactSpace G]
    (ρ : MonoidAlgebra A G →ₐ[A] Matrix (Fin 2) (Fin 2) B)
    (χ ψ : G →* Aˣ) (Itilde : Ideal Tilde)
    (hproper : Itilde≠⊤) (hnonzero : Itilde≠⊥)
    (hchar : RibetCongruence ρ χ ψ (Itilde.comap (algebraMap A Tilde)))
    (L : IntegralRibet.LocalData G) (ξ : ∀ v, L.subgroup v →* Tildeˣ)
    (σ : ∀ v, L.subgroup v)
    [Module.Finite A (IntegralRibet.localModule L ρ χ ψ)] :
    ((Ideal.span {∏ v ∈ Finset.univ.filter (fun v ↦ v ∉ L.sigma),
      ((↑(ξ v (σ v)) : Tilde)-algebraMap A Tilde (χ (σ v)))} : Ideal Tilde) *
      (Fitting.zero A (IntegralRibet.localModule L ρ χ ψ)).map (algebraMap A Tilde)) ≤ Itilde := sorry

/-- `IntegralHeckeAndGaloisDeterminants:IHG.6/local-ribet-theorem`.
For a noetherian inclusion T⊆T̃, T local and both complete for m_T, a proper nonzero Ĩ⊆T̃, I=Ĩ∩T, K=Frac(T̃) a finite product of local rings with principal maximal ideals and reduced quotient a product of fields, a compact G and continuous ρ:G→GL₂(K), assume characteristic polynomials lie in T[X] and reduce modulo I to (X−χ)(X−ψ), χ≡ψ modulo m_T, and every reduced field-factor representation is irreducible. With the finite triangular local input of the weighted-containment theorem, there exist finite N, continuous κ and vectors y_v having all its prescribed local values, generating N together, and satisfying its weighted Fitting containment.

Omitted: the complete structural/local hypotheses listed on weighted-fitting-containment. The explicit local cocycle/vector restrictions are the existing localCocycle_restriction API, and the vector span retains the extra generators. -/
theorem local_ribet_theorem {Tilde B G : Type u} [CommRing Tilde] [CommRing B] [Algebra A Tilde]
    [Algebra Tilde B] [Algebra A B] [IsScalarTower A Tilde B] [Group G]
    [IsLocalRing A] [IsNoetherianRing A] [IsNoetherianRing Tilde]
    [IsAdicComplete (IsLocalRing.maximalIdeal A) A]
    [IsAdicComplete (IsLocalRing.maximalIdeal A) Tilde]
    [TopologicalSpace G] [CompactSpace G]
    (ρ : MonoidAlgebra A G →ₐ[A] Matrix (Fin 2) (Fin 2) B)
    (χ ψ : G →* Aˣ) (Itilde : Ideal Tilde)
    (hproper : Itilde≠⊤) (hnonzero : Itilde≠⊥)
    (hchar : RibetCongruence ρ χ ψ (Itilde.comap (algebraMap A Tilde)))
    (L : IntegralRibet.LocalData G) (ξ : ∀ v, L.subgroup v →* Tildeˣ)
    (σ : ∀ v, L.subgroup v) :
    ∃ hfin : Module.Finite A (IntegralRibet.localModule L ρ χ ψ),
      letI := hfin
      letI : TopologicalSpace (IntegralRibet.localModule L ρ χ ψ) :=
        (IsLocalRing.maximalIdeal A).adicModuleTopology (IntegralRibet.localModule L ρ χ ψ)
      Continuous (IntegralRibet.localCocycle L ρ χ ψ) ∧
        Submodule.span A (Set.range (IntegralRibet.localCocycle L ρ χ ψ) ∪
          Set.range (IntegralRibet.localVector L ρ χ ψ))=⊤ ∧
        ((Ideal.span {∏ v ∈ Finset.univ.filter (fun v ↦ v ∉ L.sigma),
          ((↑(ξ v (σ v)) : Tilde)-algebraMap A Tilde (χ (σ v)))} : Ideal Tilde) *
          (Fitting.zero A (IntegralRibet.localModule L ρ χ ψ)).map (algebraMap A Tilde)) ≤ Itilde := sorry

/-- `IntegralHeckeAndGaloisDeterminants:IHG.6/global-ribet-theorem`.
Let T be complete reduced noetherian local, I⊆T any ideal, G compact and ρ:G→GL₂(Frac(T)) continuous. Assume every characteristic polynomial lies in T[X], reduces modulo I to (X−χ(g))(X−ψ(g)) for continuous T-unit characters χ,ψ, and every field-factor representation is irreducible. Then there are a finite T-module M and a continuous class in H¹(G,M(χψ⁻¹)) for which every representative cocycle generates M, and Fitt₀_T(M)⊆I. Residual equality and residue characteristic two are allowed.

Omitted: B is the total fraction ring of A with its finite product-of-fields topology and every field-factor representation is irreducible. The actual adic topology, coincident-character case and every coboundary representative are retained. -/
theorem global_ribet_theorem {B G : Type u} [CommRing B] [Algebra A B] [Group G]
    [IsLocalRing A] [IsNoetherianRing A] [IsReduced A]
    [IsAdicComplete (IsLocalRing.maximalIdeal A) A]
    [TopologicalSpace G] [CompactSpace G] [TopologicalSpace A] [TopologicalSpace B]
    (hAdic : IsAdic (IsLocalRing.maximalIdeal A))
    (ρ : MonoidAlgebra A G →ₐ[A] Matrix (Fin 2) (Fin 2) B)
    (hρ : Continuous (fun g : G ↦ ρ (MonoidAlgebra.of A G g)))
    (χ ψ : G →* Aˣ) (hχ : Continuous χ) (hψ : Continuous ψ)
    (I : Ideal A) (hchar : RibetCongruence ρ χ ψ I) :
    ∃ (M : ModuleCat.{u} A) (hfin : Module.Finite A M),
      letI := hfin
      letI : TopologicalSpace M := (IsLocalRing.maximalIdeal A).adicModuleTopology M
      ∃ κ : G → M, Continuous κ ∧
        (∀ g h, κ (g*h)=κ g+((↑(χ g) : A)*(↑(ψ g)⁻¹ : A)) • κ h) ∧
        (∀ x : M, Submodule.span A (Set.range (fun g ↦ κ g+((↑(χ g) : A)*(↑(ψ g)⁻¹ : A)-1) • x))=⊤) ∧
        Fitting.zero A M ≤ I := sorry

/-- `IntegralHeckeAndGaloisDeterminants:IHG.0/homogeneous-law-representability`.
For all A-modules M,N and d≥0, composition with γ^univ_d is a natural A-linear equivalence Hom_A(Γ^d_A(M),N)≅{homogeneous degree-d A-polynomial laws M→N}. No flatness or projectivity of M is assumed. -/
theorem homogeneous_law_representability {M N : Type u} [AddCommGroup M] [Module A M] [AddCommGroup N] [Module A N] (d : ℕ) :
    ∃ e : (DividedPower.degree A M d →ₗ[A] N) ≃
      {P : M →ₚₗ[A] N // PolynomialLaw.IsHomogeneousOfDegree d P},
      ∀ f : DividedPower.degree A M d →ₗ[A] N,
        ∀ (S : Type u) [CommRing S] [Algebra A S] (x : S ⊗[A] M),
          (e f).val.toFun' S x = f.lTensor S ((DividedPower.universalLaw (A := A) (M := M) d).toFun' S x) := sorry

/-- `IntegralHeckeAndGaloisDeterminants:IHG.0/vaccarino-universal-matrices`.
For any set X, the determinant of the generic d×d matrices induces an isomorphism Γ^d_Z(Z{X})^ab≅E_X(d), where E_X(d) is the subring of Z[x_(a,i,j)] generated by all characteristic-polynomial coefficients of words in the generic matrices. In particular the determinant coordinate ring is torsion-free. -/
theorem vaccarino_universal_matrices (S : Type) (d : ℕ) :
    Nonempty (Determinant.coordinateRing ℤ (FreeAlgebra ℤ S) d ≃ₐ[ℤ] matrixWordCoefficients S d) := sorry

/-- `IntegralHeckeAndGaloisDeterminants:IHG.1/algebraically-closed-reconstruction`.
Let k be algebraically closed, R any k-algebra and d≥1. Every dimension-d determinant D:R→k is det∘ρ for a semisimple representation ρ:R→M_d(k), unique up to conjugacy, with kerρ=kerD. No factorial assumption is required. -/
theorem algebraically_closed_reconstruction {k R : Type u} [Field k] [IsAlgClosed k] [Ring R] [Algebra k R]
    (d : ℕ) (hd : 0 < d) (D : Determinant k R d) :
    ∃ ρ : R →ₐ[k] Matrix (Fin d) (Fin d) k,
      Determinant.ofMatrix ρ=D ∧ MatrixRepresentationSemisimple ρ ∧
      TwoSidedIdeal.comap ρ.toRingHom ⊥=D.kerTwoSided ∧
      ∀ σ : R →ₐ[k] Matrix (Fin d) (Fin d) k,
        Determinant.ofMatrix σ=D → MatrixRepresentationSemisimple σ →
        ∃ P : (Matrix (Fin d) (Fin d) k)ˣ, ∀ x, σ x=(P : Matrix (Fin d) (Fin d) k)*ρ x*((P⁻¹ : (Matrix (Fin d) (Fin d) k)ˣ) : Matrix (Fin d) (Fin d) k) := sorry

/-- `IntegralHeckeAndGaloisDeterminants:IHG.1/field-faithful-quotient`.
For any field k and dimension-d determinant, R/kerD is a finite product of matrix algebras over division rings finite over their centers, with determinant a product of reduced norms and bounded inseparable norm laws. It is finite over k under the three conditions of bounded-centers, and can fail to be finite over an arbitrary imperfect k.

The center-finiteness, reduced-norm and inseparable norm-law assertions are omitted until SemisimpleAlgebras supplies the exact central-scalar interfaces; finite dimension over k is not asserted. -/
theorem field_faithful_quotient {k R : Type u} [Field k] [Ring R] [Algebra k R]
    (d : ℕ) (hd : 0 < d) (D : Determinant k R d) :
    ∃ (s : ℕ) (division : Fin s → Type u) (inst : ∀ i, DivisionRing (division i)),
      letI := inst
      ∃ size : Fin s → ℕ, Nonempty (FaithfulQuotient D ≃+* ∀ i, Matrix (Fin (size i)) (Fin (size i)) (division i)) := sorry

/-- `IntegralHeckeAndGaloisDeterminants:IHG.1/henselian-irreducible`.
For a dimension-d Cayley–Hamilton D:R→A over henselian local A, if D̄ is split and absolutely irreducible then R≅M_d(A) and D is the matrix determinant. Applying this to R=A[G]/CH(D) reconstructs an actual G→GL_d(A). Without residual splitness a central-simple obstruction remains. -/
theorem henselian_irreducible [HenselianLocalRing A] (d : ℕ) (hd : 0 < d) (D : Determinant A R d)
    (hCH : D.IsCayleyHamilton) (hSplit : D.residual.IsSplit) (hIrr : D.residual.IsAbsolutelyIrreducible) :
    ∃ φ : R ≃ₐ[A] Matrix (Fin d) (Fin d) A, D=Determinant.ofMatrix φ.toAlgHom := sorry

/-- `IntegralHeckeAndGaloisDeterminants:IHG.1/henselian-multiplicity-free`.
For a Cayley–Hamilton D over henselian local A with split multiplicity-free D̄, its algebra and trace admit a GMA decomposition with block sizes the residual constituent dimensions. This does not make off-diagonal modules free or yield a d-dimensional free representation over A. -/
theorem henselian_multiplicity_free [HenselianLocalRing A] (D : Determinant A R d)
    (hd : 0 < d) (hCH : D.IsCayleyHamilton) (hSplit : D.residual.IsSplit) (hMF : D.residual.IsMultiplicityFree) :
    ∃ (s : ℕ) (size : Fin s → ℕ) (E : GMA.Data A R s size),
      (∑ i, size i)=d ∧ (GMA.determinant E).toLaw=D.toLaw := sorry

open scoped ModuleCat.Algebra

/-- IHG.1/gma-extension-injection. q is the chosen Cayley–Hamilton quotient;
CH(D) ⊆ ker(q) ⊆ ker(D). Both endpoints are the singleton quotient constituents.
The image is exactly the range of restriction of scalars on Ext¹. -/
theorem gma_extension_injection {S : Type u} [Ring S] [Algebra A S]
    [HenselianLocalRing A] (D : Determinant A R d)
    (q : R →ₐ[A] S) (hq : Function.Surjective q)
    (hCH : D.chIdeal ≤ TwoSidedIdeal.comap q.toRingHom ⊥)
    (hker : TwoSidedIdeal.comap q.toRingHom ⊥ ≤ D.kerTwoSided)
    {s t : ℕ} {size : Fin s → ℕ} (E : GMA.Data A S s size)
    (res : GMA.ResidualData E)
    (hD : ((GMA.determinant E).comap q).toLaw = D.toLaw)
    (part : Fin s → Fin t) (hpart : Function.Surjective part)
    (i j : Fin s) (hij : i ≠ j)
    (hi : ∀ k, part k=part i → k=i) (hj : ∀ k, part k=part j → k=j)
    (J : Ideal A) (hJ : J ≤ IsLocalRing.maximalIdeal A)
    (hIP : GMA.partitionReducibilityIdeal E part ≤ J) :
    let qJ := Algebra.TensorProduct.map (AlgHom.id (A ⧸ J) (A ⧸ J)) q
    let Mi := GMA.quotientConstituent E part i hi J hIP
    let Mj := GMA.quotientConstituent E part j hj J hIP
    let restrict := ModuleCat.restrictScalars qJ.toRingHom
    letI : CategoryTheory.Limits.PreservesFiniteLimits restrict := by sorry
    letI : CategoryTheory.Limits.PreservesFiniteColimits restrict := by sorry
    ∃ f : (GMA.extensionModule E i j →ₗ[A] A ⧸ J) →ₗ[A ⧸ J]
        CategoryTheory.Abelian.Ext (restrict.obj Mj) (restrict.obj Mi) 1,
      Function.Injective f ∧
      LinearMap.range f = LinearMap.range (restrict.mapExtLinearMap (A ⧸ J) Mj Mi 1) := sorry

/-- `IntegralHeckeAndGaloisDeterminants:IHG.1/gma-projective-cover-extensions`.
For a GMA S, M_j=SE_j is a finitely generated projective left S-module. Its quotient gives ρ_j, and applying Hom to its kernel identifies the extensions that factor through S with the functionals on E_ij. This identifies the image of gma-extension-injection, without asserting it equals all extensions over a larger R.

The projective module is the actual left ideal R E_j. Its quotient-constituent kernel calculation remains a recorded proof leaf; the Ext-image conclusion is expressed in gma_extension_injection. -/
theorem gma_projective_cover_extensions {s : ℕ} {size : Fin s → ℕ} (E : GMA.Data A R s size) (j : Fin s)
    (Mj : Type u) [AddCommGroup Mj] [Module R Mj]
    (e : Mj ≃ₗ[R] LinearMap.range
      ({ toFun := fun x : R ↦ x*GMA.primitive E j
         map_add' := sorry
         map_smul' := sorry } : R →ₗ[R] R)) :
    Module.Projective R Mj ∧ Module.Finite R Mj := sorry

/-- IHG.1/ribet-lattice. Complete DVR and fraction field with their valuation topology,
compact continuous irreducible image, integral characteristic polynomials and distinct
residual characters. The upper entry tests a nonsplit extension of ψ by χ. -/
theorem ribet_lattice {K G : Type u} [IsDomain A] [IsDiscreteValuationRing A]
    [IsAdicComplete (IsLocalRing.maximalIdeal A) A]
    [NormedField K] [IsUltrametricDist K] [CompleteSpace K] [LocallyCompactSpace K]
    [Algebra A K] [IsFractionRing A K]
    (hvaluation : ∀ x : K, x ∈ Set.range (algebraMap A K) ↔ ‖x‖ ≤ 1)
    [Group G] [TopologicalSpace G] [CompactSpace G] [T2Space G] [IsTopologicalGroup G]
    (ρ : G →* (Matrix (Fin 2) (Fin 2) K)ˣ)
    (hρ : Continuous (fun g ↦ (ρ g : Matrix (Fin 2) (Fin 2) K)))
    (hIrr : ∀ W : Submodule K (Fin 2 → K),
      (∀ g x, x ∈ W → (ρ g : Matrix (Fin 2) (Fin 2) K).mulVec x ∈ W) → W=⊥ ∨ W=⊤)
    (χ ψ : G →* (IsLocalRing.ResidueField A)ˣ) (hdistinct : χ ≠ ψ)
    (hcoeff : ∀ g, ∃ P : A[X],
      P.map (algebraMap A K)=Matrix.charpoly (ρ g : Matrix (Fin 2) (Fin 2) K) ∧
      P.map (IsLocalRing.residue A)=(X-C (χ g : IsLocalRing.ResidueField A)) *
        (X-C (ψ g : IsLocalRing.ResidueField A))) :
    ∃ (L : Submodule A (Fin 2 → K)), Module.Free A L ∧ Module.Finite A L ∧
      (∀ g x, x ∈ L → (ρ g : Matrix (Fin 2) (Fin 2) K).mulVec x ∈ L) ∧
      Submodule.span K (L : Set (Fin 2 → K))=⊤ ∧
      ∃ (b : Module.Basis (Fin 2) A L) (ρA : G →* (Matrix (Fin 2) (Fin 2) A)ˣ),
        (∀ g i, (ρ g : Matrix (Fin 2) (Fin 2) K).mulVec (b i : Fin 2 → K) =
          ∑ j, ((ρA g : Matrix (Fin 2) (Fin 2) A) j i) • (b j : Fin 2 → K)) ∧
        (∀ g, IsLocalRing.residue A ((ρA g : Matrix (Fin 2) (Fin 2) A) 1 0)=0 ∧
          IsLocalRing.residue A ((ρA g : Matrix (Fin 2) (Fin 2) A) 0 0)=(χ g : IsLocalRing.ResidueField A) ∧
          IsLocalRing.residue A ((ρA g : Matrix (Fin 2) (Fin 2) A) 1 1)=(ψ g : IsLocalRing.ResidueField A)) ∧
        ∀ v : IsLocalRing.ResidueField A, ∃ g,
          IsLocalRing.residue A ((ρA g : Matrix (Fin 2) (Fin 2) A) 0 1) ≠
            ((ψ g : IsLocalRing.ResidueField A)-(χ g : IsLocalRing.ResidueField A))*v := sorry

/-- `IntegralHeckeAndGaloisDeterminants:IHG.1/completed-cayley-hamilton-finite`.
Let G be profinite, D̄ a continuous finite-field determinant, R_D its noetherian universal pseudodeformation ring, and dim_kH¹_c(G,adρ̄_ss)<∞. Then its completed Cayley–Hamilton algebra E_D is finite over R_D, and its profinite, quotient and maximal-ideal-adic topologies agree. Residual split absolute irreducibility gives E_D≅M_d(R_D).

Omitted: E is the completed Cayley–Hamilton algebra of the continuous residual determinant on profinite G, A is its noetherian universal pseudodeformation ring, and continuous adjoint H¹ is finite dimensional. E is supplied by the completed group-algebra interface of L1; no discrete group-algebra quotient is substituted. The topology comparison and residual matrix equivalence remain in the reader.
The small-characteristic residual finiteness and the closedness of the generated
CH ideal require separate proofs; both obligations are specified in the roadmap. -/
theorem completed_cayley_hamilton_finite {E : Type u} [Ring E] [Algebra A E]
    [IsNoetherianRing A] (D : Determinant A E d) (hCH : D.IsCayleyHamilton) :
    Module.Finite A E := sorry

/-- `IntegralHeckeAndGaloisDeterminants:IHG.1/coefficient-descent`.
Let A⊂B be complete noetherian local rings with m_B∩A=m_A and common residue field. For a profinite G and continuous ρ:G→GL_d(B), assume residual absolute irreducibility and trρ(G)⊂A. Then ρ is conjugate by 1+M_d(m_B) to a representation into GL_d(A). More generally an already descended quotient modulo J allows the conjugator in 1+M_d(J).

The complete local rings, coefficient inclusion, common residue field, adic topology,
profinite source and residual absolute irreducibility are explicit. The stronger
conjugator modulo an arbitrary prescribed ideal remains a separate API item. -/
theorem coefficient_descent {B G : Type u} [CommRing B] [Algebra A B] [IsLocalRing A] [IsLocalRing B]
    [IsNoetherianRing A] [IsNoetherianRing B] [Group G]
    [IsAdicComplete (IsLocalRing.maximalIdeal A) A]
    [IsAdicComplete (IsLocalRing.maximalIdeal B) B]
    [TopologicalSpace B] (hBadic : IsAdic (IsLocalRing.maximalIdeal B))
    [TopologicalSpace G] [CompactSpace G] [T2Space G] [TotallyDisconnectedSpace G]
    [IsTopologicalGroup G]
    (hinj : Function.Injective (algebraMap A B))
    (residueEquiv : IsLocalRing.ResidueField A ≃+* IsLocalRing.ResidueField B)
    (hres : ∀ a : A, IsLocalRing.residue B (algebraMap A B a)=
      residueEquiv (IsLocalRing.residue A a))
    (ρ : MonoidAlgebra B G →ₐ[B] Matrix (Fin d) (Fin d) B)
    (hρ : Continuous (fun g : G ↦ ρ (MonoidAlgebra.of B G g)))
    (hIrr : (Determinant.ofMatrix ρ).residual.IsAbsolutelyIrreducible)
    (htrace : ∀ g : G, ∃ a : A, Matrix.trace (ρ (MonoidAlgebra.of B G g))=algebraMap A B a) :
    ∃ (ρA : MonoidAlgebra A G →ₐ[A] Matrix (Fin d) (Fin d) A)
      (P : (Matrix (Fin d) (Fin d) B)ˣ),
      (∀ i j, (P : Matrix (Fin d) (Fin d) B) i j-(1 : Matrix (Fin d) (Fin d) B) i j ∈ IsLocalRing.maximalIdeal B) ∧
      ∀ g : G, (ρA (MonoidAlgebra.of A G g)).map (algebraMap A B)=
        (P : Matrix (Fin d) (Fin d) B)*ρ (MonoidAlgebra.of B G g)*((P⁻¹ : (Matrix (Fin d) (Fin d) B)ˣ) : Matrix (Fin d) (Fin d) B) := sorry

/-- IHG.1/symplectic-coefficient-descent. Matrix equations encode the GSp carrier:
the alternating form is invertible, both coefficient rings are complete local with
common odd-characteristic residue, and the full multiplier is prescribed over A. -/
theorem symplectic_coefficient_descent {B G : Type u} [CommRing B] [Algebra A B]
    [IsLocalRing A] [IsLocalRing B] [IsNoetherianRing A] [IsNoetherianRing B]
    [IsAdicComplete (IsLocalRing.maximalIdeal A) A]
    [IsAdicComplete (IsLocalRing.maximalIdeal B) B]
    [TopologicalSpace A] [TopologicalSpace B]
    (hAadic : IsAdic (IsLocalRing.maximalIdeal A)) (hBadic : IsAdic (IsLocalRing.maximalIdeal B))
    [Group G] [TopologicalSpace G] [CompactSpace G] [T2Space G]
    [TotallyDisconnectedSpace G] [IsTopologicalGroup G]
    (hinj : Function.Injective (algebraMap A B))
    (residueEquiv : IsLocalRing.ResidueField A ≃+* IsLocalRing.ResidueField B)
    (hres : ∀ a : A, IsLocalRing.residue B (algebraMap A B a)=
      residueEquiv (IsLocalRing.residue A a))
    (p : ℕ) [CharP (IsLocalRing.ResidueField A) p] (hp : 2 < p)
    (ρ : G →* (Matrix (Fin 4) (Fin 4) B)ˣ)
    (hρ : Continuous (fun g ↦ (ρ g : Matrix (Fin 4) (Fin 4) B)))
    (hIrr : (Determinant.ofMatrix (MonoidAlgebra.lift B (Matrix (Fin 4) (Fin 4) B) G
      ((Units.coeHom _).comp ρ))).residual.IsAbsolutelyIrreducible)
    (htrace : ∀ g, ∃ a : A, Matrix.trace (ρ g : Matrix (Fin 4) (Fin 4) B)=algebraMap A B a)
    (ν : G →* Aˣ) (hν : Continuous (fun g ↦ (ν g : A)))
    (form : Matrix (Fin 4) (Fin 4) A) (hnondegenerate : IsUnit form)
    (halternating : ∀ x : Fin 4 → A, dotProduct x (form.mulVec x)=0)
    (hform : ∀ g, (ρ g : Matrix (Fin 4) (Fin 4) B).transpose *
      form.map (algebraMap A B) * (ρ g : Matrix (Fin 4) (Fin 4) B)=
      algebraMap A B (ν g) • form.map (algebraMap A B)) :
    ∃ (ρA : G →* (Matrix (Fin 4) (Fin 4) A)ˣ) (P : (Matrix (Fin 4) (Fin 4) B)ˣ),
      Continuous (fun g ↦ (ρA g : Matrix (Fin 4) (Fin 4) A)) ∧
      (∀ g, (ρA g : Matrix (Fin 4) (Fin 4) A).transpose * form *
        (ρA g : Matrix (Fin 4) (Fin 4) A)=(ν g : A) • form) ∧
      (∀ i j, (P : Matrix (Fin 4) (Fin 4) B) i j-(1 : Matrix (Fin 4) (Fin 4) B) i j ∈
        IsLocalRing.maximalIdeal B) ∧
      (∃ μ : Bˣ, (P : Matrix (Fin 4) (Fin 4) B).transpose * form.map (algebraMap A B) *
        (P : Matrix (Fin 4) (Fin 4) B)=(μ : B) • form.map (algebraMap A B)) ∧
      ∀ g, (ρA g : Matrix (Fin 4) (Fin 4) A).map (algebraMap A B)=
        (P : Matrix (Fin 4) (Fin 4) B)*(ρ g : Matrix (Fin 4) (Fin 4) B)*
          (↑(P⁻¹) : Matrix (Fin 4) (Fin 4) B) := sorry

/-- `IntegralHeckeAndGaloisDeterminants:IHG.1/brauer-nesbitt-module-recognition`.
Let A be henselian local, ρ:G→GL_d(A) have split absolutely irreducible residual representation, and M be an A[G]-module annihilated by CH(detρ). Then M≅A^d⊗_AN as an A[G]-module for N=E_11M, with G acting through ρ on the first factor.

The compatible A[G]-action, CH annihilation, residual absolute irreducibility and
G-equivariance are explicit. Identifying N as the E_11 summand remains a separate API item. -/
theorem brauer_nesbitt_module_recognition {G M : Type u} [Group G] [AddCommGroup M] [Module A M]
    [Module (MonoidAlgebra A G) M] [IsScalarTower A (MonoidAlgebra A G) M]
    [HenselianLocalRing A] (ρ : MonoidAlgebra A G →ₐ[A] Matrix (Fin d) (Fin d) A)
    (hIrr : (Determinant.ofMatrix ρ).residual.IsAbsolutelyIrreducible)
    (hCH : ∀ r ∈ (Determinant.ofMatrix ρ).chIdeal, ∀ x : M, r • x=0) :
    ∃ (N : ModuleCat.{u} A) (e : M ≃ₗ[A] ((Fin d → A) ⊗[A] N)),
      ∀ (g : G) (x : M), e (MonoidAlgebra.of A G g • x)=
        TensorProduct.map (Matrix.toLin' (ρ (MonoidAlgebra.of A G g))) LinearMap.id (e x) := sorry

/-- IHG.1/local-matrix-inner-conjugacy: local matrix algebra identifications
are conjugate by an invertible matrix over the same coefficient ring. -/
theorem local_matrix_inner_conjugacy [IsLocalRing A] (d : ℕ) (hd : 0 < d)
    (f : Matrix (Fin d) (Fin d) A ≃ₐ[A] Matrix (Fin d) (Fin d) A) :
    ∃ P : (Matrix (Fin d) (Fin d) A)ˣ, ∀ x,
      f x=(P : Matrix (Fin d) (Fin d) A)*x*(↑(P⁻¹) : Matrix (Fin d) (Fin d) A) := sorry

/-- IHG.1/compatible-local-reconstruction. Assembly from CN23's preceding corner
constructions: B is Ã and B → A is surjective. σ is the global compressed map,
localRep the local integral corner map. Their common corner basis and the generic-fiber
comparison are explicit. A local residual separator certifies the disjoint blocks. -/
theorem compatible_local_reconstruction {B S G : Type u} [CommRing B] [Algebra B A]
    [HenselianLocalRing B] [HenselianLocalRing A] [IsNoetherianRing B] [IsNoetherianRing A]
    [IsAdicComplete (IsLocalRing.maximalIdeal B) B]
    [IsAdicComplete (IsLocalRing.maximalIdeal A) A]
    [TopologicalSpace B] [TopologicalSpace A]
    (hBadic : IsAdic (IsLocalRing.maximalIdeal B)) (hAadic : IsAdic (IsLocalRing.maximalIdeal A))
    (hπ : Function.Surjective (algebraMap B A))
    [Ring S] [Algebra B S] [Group G] [TopologicalSpace G] [IsTopologicalGroup G]
    (E : GMA.Data B S 2 (fun _ ↦ d)) (res : GMA.ResidualData E)
    (r : G →* Sˣ) (H : Subgroup G)
    (separatorMap : MonoidAlgebra (IsLocalRing.ResidueField B) H →ₐ[IsLocalRing.ResidueField B]
      (IsLocalRing.ResidueField B ⊗[B] S))
    (hseparatorMap : ∀ h : H, separatorMap (MonoidAlgebra.of (IsLocalRing.ResidueField B) H h)=
      1 ⊗ₜ[B] (r h : S))
    (hseparated : ∃ x, res.representation 0 (separatorMap x)=1 ∧
      res.representation 1 (separatorMap x)=0)
    (hred : ∀ a ∈ GMA.reducibilityIdeal E 0 1, algebraMap B A a=0)
    (ρ σ : G →* (Matrix (Fin d) (Fin d) A)ˣ)
    (hIrr : (Determinant.ofMatrix (MonoidAlgebra.lift A (Matrix (Fin d) (Fin d) A) G
      ((Units.coeHom _).comp ρ))).residual.IsAbsolutelyIrreducible)
    (hdet : Determinant.ofMatrix (MonoidAlgebra.lift A (Matrix (Fin d) (Fin d) A) G
      ((Units.coeHom _).comp σ)) = Determinant.ofMatrix
        (MonoidAlgebra.lift A (Matrix (Fin d) (Fin d) A) G ((Units.coeHom _).comp ρ)))
    (hglobal : ∀ g, (σ g : Matrix (Fin d) (Fin d) A)=
      (E.diagonal 0 (cornerLift (E.idempotent 0) (E.idem 0)
        (E.idempotent 0*(r g : S)*E.idempotent 0) (by sorry))).map (algebraMap B A))
    (localRep : H →* (Matrix (Fin d) (Fin d) B)ˣ)
    (hLocalRep : Continuous (fun h ↦ (localRep h : Matrix (Fin d) (Fin d) B)))
    (hlocal : ∀ h : H, (localRep h : Matrix (Fin d) (Fin d) B)=
      E.diagonal 0 (cornerLift (E.idempotent 0) (E.idem 0)
        (E.idempotent 0*(r h : S)*E.idempotent 0) (by sorry)))
    {a : ℕ} (K : Fin a → Type u) [∀ i, Field (K i)] [∀ i, Algebra B (K i)]
    (selected : ∀ i, H →* (Matrix (Fin d) (Fin d) (K i))ˣ)
    (cornerBasis : ∀ i, (Matrix (Fin d) (Fin d) (K i))ˣ)
    (hgeneric : ∀ i h, (localRep h : Matrix (Fin d) (Fin d) B).map (algebraMap B (K i))=
      (cornerBasis i : Matrix (Fin d) (Fin d) (K i))*(selected i h : Matrix (Fin d) (Fin d) (K i))*
        (↑((cornerBasis i)⁻¹) : Matrix (Fin d) (Fin d) (K i))) :
    ∃ (lift : H →* (Matrix (Fin d) (Fin d) B)ˣ) (P : (Matrix (Fin d) (Fin d) B)ˣ),
      Continuous (fun h ↦ (lift h : Matrix (Fin d) (Fin d) B)) ∧
      (∀ h : H, (lift h : Matrix (Fin d) (Fin d) B).map (algebraMap B A)=
        (ρ h : Matrix (Fin d) (Fin d) A)) ∧
      (∀ h, (lift h : Matrix (Fin d) (Fin d) B)=
        (P : Matrix (Fin d) (Fin d) B)*(localRep h : Matrix (Fin d) (Fin d) B)*
          (↑(P⁻¹) : Matrix (Fin d) (Fin d) B)) ∧
      ∀ i, ∃ Pi : (Matrix (Fin d) (Fin d) (K i))ˣ, ∀ h,
        (lift h : Matrix (Fin d) (Fin d) B).map (algebraMap B (K i))=
          (Pi : Matrix (Fin d) (Fin d) (K i))*(selected i h : Matrix (Fin d) (Fin d) (K i))*
            (↑(Pi⁻¹) : Matrix (Fin d) (Fin d) (K i)) := sorry

/-- `IntegralHeckeAndGaloisDeterminants:IHG.1/reductive-reconstruction`.
For generalized reductive H over noetherian O, any H-pseudocharacter of Γ with values in an algebraically closed O-field k is realized by an H-completely reducible homomorphism Γ→H(k), unique up to H⁰(k)-conjugation. This uses full invariant tuples, not only the trace of a chosen linear representation.

Omitted: H is the k-points of a generalized reductive O-group, C/evaluate are its H⁰-invariant coordinates, complete reducibility and uniqueness up to H⁰-conjugacy; LP3 supplies these conditions. -/
theorem reductive_reconstruction {O G H k : Type u} [CommRing O] [Group G] [Group H] [Field k] [Algebra O k]
    (C : InvariantCoordinateInput O)
    (evaluate : InvariantEvaluation C H k) [IsAlgClosed k] (Θ : ReductivePseudocharacter G C k) :
    ∃ ρ : G →* H, ReductivePseudocharacter.ofRepresentation C ρ evaluate=Θ := sorry

/-- `IntegralHeckeAndGaloisDeterminants:IHG.1/reductive-discrete-continuity`.
For a split connected reductive H/Z, profinite Γ and algebraically closed discrete field k, a continuous H-pseudocharacter reconstructs a continuous H-completely reducible representation. It factors through a finite quotient of Γ.

Omitted: G profinite, H split connected reductive with the k-point topology, C/evaluate its invariant coordinates, and complete reducibility. -/
theorem reductive_discrete_continuity {O G H k : Type u} [CommRing O] [Group G] [Group H] [Field k] [Algebra O k]
    (C : InvariantCoordinateInput O)
    (evaluate : InvariantEvaluation C H k) [IsAlgClosed k] [TopologicalSpace G] [CompactSpace G]
    [TopologicalSpace H] [TopologicalSpace k] [DiscreteTopology k]
    (Θ : ReductivePseudocharacter G C k) (hΘ : Θ.IsContinuous) :
    ∃ ρ : G →* H, Continuous ρ ∧ ReductivePseudocharacter.ofRepresentation C ρ evaluate=Θ ∧
      (MonoidHom.range ρ : Set H).Finite := sorry

/-- `IntegralHeckeAndGaloisDeterminants:IHG.1/reductive-valued-continuity`.
For split connected reductive H/Z, profinite Γ and algebraically closed characteristic-zero field k carrying a rank-one valuation topology, continuity of the H-pseudocharacter implies continuity of its H-completely reducible realization.

Omitted: G profinite, k has a rank-one valuation topology, H is a split connected reductive group with its k-point topology, invariant coordinates and complete reducibility. -/
theorem reductive_valued_continuity {O G H k : Type u} [CommRing O] [Group G] [Group H] [Field k] [Algebra O k]
    (C : InvariantCoordinateInput O)
    (evaluate : InvariantEvaluation C H k) [IsAlgClosed k] [CharZero k] [TopologicalSpace G]
    [CompactSpace G] [TopologicalSpace H] [TopologicalSpace k]
    (Θ : ReductivePseudocharacter G C k) (hΘ : Θ.IsContinuous) :
    ∃ ρ : G →* H, Continuous ρ ∧ ReductivePseudocharacter.ofRepresentation C ρ evaluate=Θ := sorry

/-- `IntegralHeckeAndGaloisDeterminants:IHG.1/reductive-integral-model`.
For split connected reductive H/Z and continuous ρ:Γ→H(Q̄_l) with Γ profinite, a finite coefficient extension and conjugation put ρ in H(O_E). Its residual H-completely reducible semisimplification is independent up to H(F̄_l)-conjugacy of the extension and integral model.

Omitted: split connected H, continuous profinite ρ in H(Q̄_l), i ranges over finite coefficient extensions and integral i=H(O_i). Residual H-complete reducibility and integral-model independence await LP3. -/
theorem reductive_integral_model {G H : Type u} [Group G] [Group H]
    (ι : Type u) (integral : ι → Type u) [∀ i, Group (integral i)]
    (includePoints : ∀ i, integral i →* H) (ρ : G →* H) :
    ∃ (i : ι) (h : H) (ρintegral : G →* integral i), ∀ g, includePoints i (ρintegral g)=h*ρ g*h⁻¹ := sorry

/-- `IntegralHeckeAndGaloisDeterminants:IHG.1/reductive-pseudodeformation-noetherian`.
If O is complete noetherian local with finite residue field, H/O is generalized reductive, Γ is topologically finitely generated and Θ̄ is continuous over a finite field, then R_Θ̄ is noetherian.

Omitted: finite residue field, generalized reductive H, topologically finitely generated profinite G and m is the kernel of the supplied continuous finite-field residual pseudocharacter. -/
theorem reductive_pseudodeformation_noetherian {O G : Type u} [CommRing O] [IsNoetherianRing O] [IsLocalRing O]
    [IsAdicComplete (IsLocalRing.maximalIdeal O) O] [Group G]
    (C : InvariantCoordinateInput O) (m : Ideal (ReductivePseudocharacter.universalRing G C)) :
    IsNoetherianRing (ReductivePseudocharacter.deformationRing C m) := sorry

/-- `IntegralHeckeAndGaloisDeterminants:IHG.1/reductive-slice-reconstruction`.
Let H/O be split connected reductive, O a complete DVR, and ρ̄:Γ→H(k) absolutely H-completely reducible with trivial scheme-theoretic centralizer in H_ad. Under the smooth free-orbit slice hypotheses of BHKT19 Theorem 4.10, strict H_ad-deformations of ρ̄ and pseudodeformations of Θ_ρ̄ are naturally equivalent.

Omitted: O complete DVR, H split connected reductive, absolutely H-completely reducible residual representation with trivial scheme centralizer in H_ad, its smooth free-orbit slice and actual A-points. Strict H_ad-conjugacy uniqueness/naturality cannot yet be typed; the reader states the equivalence. -/
theorem reductive_slice_reconstruction {O G H A k : Type u} [CommRing O] [Group G] [Group H]
    [CommRing A] [Algebra O A] [Field k] [Algebra O k]
    (C : InvariantCoordinateInput O) (φ : A →ₐ[O] k)
    (evaluate : InvariantEvaluation C H A)
    (Θ : ReductivePseudocharacter G C A) (Θbar : ReductivePseudocharacter G C k)
    (hred : ReductivePseudocharacter.map C Θ φ=Θbar) :
    ∃ ρ : G →* H, ReductivePseudocharacter.ofRepresentation C ρ evaluate=Θ := sorry

/-- `IntegralHeckeAndGaloisDeterminants:IHG.6/borel-restriction`.
For G=GL₂/ℤ, its lower Borel B, every rational G-module V and every i≥0, restriction Hᶦ(G,V)→Hᶦ(B,V) is an isomorphism. Cohomology is derived scheme invariants, not cohomology of G(ℤ).

Omitted: CG and CB compute derived rational scheme invariants of the same rational GL₂/ℤ-module, with CB its restriction to the lower Borel. These are not complexes of abstract GL₂(ℤ)-cochains. -/
theorem borel_restriction (CG CB : CochainComplex (ModuleCat ℤ) ℤ) (restriction : CG ⟶ CB) : QuasiIso restriction := sorry

/-- `IntegralHeckeAndGaloisDeterminants:IHG.6/good-matrix-polynomials`.
For finitely many generic 2×2 matrices, ℤ[a_i,b_i,c_i,d_i] with simultaneous conjugation admits an exhaustive good filtration; every finite polynomial-degree piece has the required finite good filtration. The degree-zero center weight piece is infinite, so the full ring is not assigned a finite filtration.

The good-filtration assertion on the simultaneous-conjugation GL₂ comodule cannot yet be typed. Only the underlying exhaustive finite-degree filtration is displayed; LP3 supplies its induced-quotient predicates. -/
theorem good_matrix_polynomials (n : ℕ) :
    ∃ filtration : ℕ → Submodule ℤ (MvPolynomial (Fin n × Fin 2 × Fin 2) ℤ),
      Monotone filtration ∧ (⨆ k, filtration k)=⊤ ∧ ∀ k, Module.Finite ℤ (filtration k) := sorry

/-- `IntegralHeckeAndGaloisDeterminants:IHG.6/twisted-good-filtration-vanishing`.
For an integral good G-module W and j≥0, Hᶦ(B,W(j))=0 when i>j.

Omitted: C computes rational lower-Borel cohomology of W(j) with W an integral good GL₂-module and j≥0; the comodule and character-twist carriers belong to LP3. -/
theorem twisted_good_filtration_vanishing (j : ℕ) (C : CochainComplex (ModuleCat ℤ) ℤ) :
    ∀ i : ℕ, j < i → Limits.IsZero (C.homology i) := sorry

/-- `IntegralHeckeAndGaloisDeterminants:IHG.6/triangular-quotient-acyclicity`.
Let S=ℤ[a_i,b_i,c_i,d_i]/(b₁,…,b_k), with B conjugation, and W a ℤ-flat integral good G-module. Then W⊗ℤS is B-acyclic.

Omitted: C computes rational Borel cohomology of W⊗S, W is ℤ-flat integral good, and S is the matrix polynomial ring modulo the selected upper entries. -/
theorem triangular_quotient_acyclicity (C : CochainComplex (ModuleCat ℤ) ℤ) :
    ∀ i : ℕ, 0 < i → Limits.IsZero (C.homology i) := sorry

/-- `IntegralHeckeAndGaloisDeterminants:IHG.6/integral-matrix-invariants`.
For a ℤ-flat commutative R₀ with trivial G action, GL₂ scheme invariants in R₀[a_i,b_i,c_i,d_i] are generated over R₀ by traces and determinants of all matrices in the algebra of the generic matrices.

Omitted: C is the rational GL₂ scheme-invariant subalgebra; the general ℤ-flat trivial coefficient base and the equivalent trace/determinant-word description are in the reader. -/
theorem integral_matrix_invariants (n : ℕ) (C : Subalgebra ℤ (MvPolynomial (Fin n × Fin 2 × Fin 2) ℤ)) :
    C=Algebra.adjoin ℤ {a | ∃ w : List (Fin n), ∃ k : ℕ,
      a=(Matrix.charpoly ((w.map fun t ↦
        (fun i j ↦ MvPolynomial.X (t,i,j) : Matrix (Fin 2) (Fin 2) _)).prod)).coeff k} := sorry

/-- `IntegralHeckeAndGaloisDeterminants:IHG.6/triangular-borel-invariants`.
For the formal ring R with the chosen b_τ=0 constraints, H⁰(B,R)=A₀[d_τ], the subring specified above.

The formal ring, its coefficient/matrix generators and its lower-Borel coaction are explicit. -/
theorem triangular_borel_invariants (c n : ℕ) (triangular : Finset (Fin n)) :
    IntegralRibet.borelInvariants (IntegralRibet.formalRing_borel c n triangular) =
      IntegralRibet.invariantSubring (IntegralRibet.formalCoefficient c n triangular)
        (IntegralRibet.formalMatrix c n triangular) triangular := sorry

/-- `IntegralHeckeAndGaloisDeterminants:IHG.6/determinantal-exactness-transfer`.
For every f:Rⁿ→Rᵐ, every R-module E and j>0, if H_i(BR(f)⊗E)=0 for all i≥j, then H_i(DetBR(f)⊗E)=0 for all i≥j.

Omitted: moduleTensor and detTensor are BR(f)⊗E and DetBR(f)⊗E for the same arbitrary module E; the tensor-complex identifications await DD.1. -/
theorem determinantal_exactness_transfer {m n : ℕ} (hm : 0 < m) (hmn : m ≤ n)
    (f : (Fin n → A) →ₗ[A] (Fin m → A))
    (moduleTensor detTensor : ChainComplex (ModuleCat.{u} A) ℕ) (j : ℕ) (hj : 0 < j)
    (h : ∀ i : ℕ, j ≤ i → Limits.IsZero (moduleTensor.homology i)) :
    ∀ i : ℕ, j ≤ i → Limits.IsZero (detTensor.homology i) := sorry

/-- `IntegralHeckeAndGaloisDeterminants:IHG.6/buchsbaum-rim-exactness`.
If f is regular, then H_i(BR(f))=0 and H_i(DetBR(f))=0 for every i>0. Consequently, after a determinant-line trivialization, DetBR(f) is a finite free resolution of R/I_m(f). -/
theorem buchsbaum_rim_exactness {m n : ℕ} (hm : 0 < m) (hmn : m ≤ n)
    (f : (Fin n → A) →ₗ[A] (Fin m → A)) (hf : BuchsbaumRim.IsRegular f) :
    ∀ i : ℕ, 0 < i → Limits.IsZero ((BuchsbaumRim.moduleComplex f).homology i) ∧
      Limits.IsZero ((BuchsbaumRim.determinantalComplex f).homology i) := sorry

/-- `IntegralHeckeAndGaloisDeterminants:IHG.6/ordered-determinantal-tensor-resolution`.
For maps f_i:R^(n_i)→R^(m_i) with 1 ≤ m_i ≤ n_i, write J_i=I_(m_i)(f_i). If each f_i modulo J₁+…+J_(i−1) is regular, then the finite tensor product ⊗_i DetBR(f_i), with determinant lines trivialized, resolves R/(∑J_i).

Ordered regularity is imposed after quotienting by the preceding maximal-minor ideals.
Omitted: tensor=⊗DetBR(f_i) with determinant-line trivializations; the tensor-complex interface comes from DD.1. The rank bounds are explicit. -/
theorem ordered_determinantal_tensor_resolution (s : ℕ) (n m : Fin s → ℕ)
    (hm : ∀ i, 0 < m i) (hmn : ∀ i, m i ≤ n i)
    (f : ∀ i, (Fin (n i) → A) →ₗ[A] (Fin (m i) → A))
    (hregular : ∀ i : Fin s,
      let Jprev : Ideal A := ⨆ j : {j : Fin s // j < i}, BuchsbaumRim.maximalMinorIdeal (f j)
      let S := A ⧸ Jprev
      let fquot : (Fin (n i) → S) →ₗ[S] (Fin (m i) → S) :=
        Matrix.mulVecLin (fun k j ↦ Ideal.Quotient.mk Jprev (f i (Pi.single j 1) k))
      BuchsbaumRim.IsRegular fquot)
    (tensor : ChainComplex (ModuleCat.{u} A) ℕ) :
    Nonempty (tensor.homology 0 ≅ ModuleCat.of A (A ⧸ ⨆ i, BuchsbaumRim.maximalMinorIdeal (f i))) ∧
      ∀ k : ℕ, 0 < k → Limits.IsZero (tensor.homology k) := sorry

/-- `IntegralHeckeAndGaloisDeterminants:IHG.6/generic-two-column-regularity`.
For every commutative R₀ and n≥2, the generic map R₀[b_i,b′_i]ⁿ→R₀[b_i,b′_i]² with columns (b_i,b′_i) is regular. -/
theorem generic_two_column_regularity (n : ℕ) (hn : 2 ≤ n) :
    let S := MvPolynomial (Fin 2 × Fin n) A
    let f : (Fin n → S) →ₗ[S] (Fin 2 → S) :=
      { toFun := fun x i ↦ ∑ j, MvPolynomial.X (i,j)*x j
        map_add' := sorry
        map_smul' := sorry }
    BuchsbaumRim.IsRegular f := sorry

/-- `IntegralHeckeAndGaloisDeterminants:IHG.6/generic-linear-regularity`.
For arbitrary commutative R₀, generic m×n coefficients A_ij with m ≤ n, and c_i∈R₀[A_ij], the sequence ∑A_ijX_j−c_i is weakly regular in R₀[A_ij,X_j]. If the final quotient is nonzero it is regular in Mathlib’s stronger convention. -/
theorem generic_linear_regularity (m n : ℕ) (hmn : m ≤ n)
    (c : Fin m → MvPolynomial (Fin m × Fin n) A) :
    let S := MvPolynomial ((Fin m × Fin n) ⊕ Fin n) A
    RingTheory.Sequence.IsWeaklyRegular S ((List.finRange m).map fun i ↦
      (∑ j, MvPolynomial.X (Sum.inl (i,j))*MvPolynomial.X (Sum.inr j))-
        MvPolynomial.rename Sum.inl (c i)) := sorry

/-- `IntegralHeckeAndGaloisDeterminants:IHG.6/mixed-generic-resolution`.
Let R=R₀[b′₁,…,b′_n,b₁,…,b_(n+r),V_ij], partition {1,…,n} into blocks S_a, let f_a have columns (b_j,b′_j) for j∈S_a, and add f_(k+1)(e_i)=∑_(j ≤ n+r)V_ij b_j for i ≤ r. Then ⊗_a DetBR(f_a) resolves the quotient by the sum of their image-minor ideals, with singleton blocks interpreted as zero local ideal and omitted.

Omitted: A is the displayed mixed polynomial ring, the disjoint local blocks and generic linear rows, J is the sum of image-minor ideals and tensor is their specified determinant tensor complex. Blocks with n_i < m_i are omitted as zero ideals. -/
theorem mixed_generic_resolution (tensor : ChainComplex (ModuleCat.{u} A) ℕ) (J : Ideal A) :
    Nonempty (tensor.homology 0 ≅ ModuleCat.of A (A ⧸ J)) ∧
      ∀ k : ℕ, 0 < k → Limits.IsZero (tensor.homology k) := sorry

/-- `IntegralHeckeAndGaloisDeterminants:IHG.6/ribet-upper-complex-exact`.
The augmented upper-entry complex C→R/J′ is a finite free resolution.

Omitted: A is the formal Ribet ring and the maps are its generic linear and disjoint local blocks. Arbitrary coefficients do not satisfy this exactness claim. -/
theorem ribet_upper_complex_exact {l v : ℕ} (linear : Fin l → A) (size : Fin v → ℕ)
    (localMap : ∀ t, (Fin (size t) → A) →ₗ[A] (Fin 2 → A)) :
    ∀ k : ℕ, 0 < k → Limits.IsZero ((IntegralRibet.upperRelationComplex linear size localMap).homology k) := sorry

/-- `IntegralHeckeAndGaloisDeterminants:IHG.6/ribet-complex-comparison`.
The natural inclusions of rank-one b-entry blocks induce a B-equivariant chain map C→D whose map in degree zero is id_R and whose map on degree-one images is J′↪J. After truncating at the images, it gives the exact-to-acyclic comparison of Theorem 4.23.

Omitted: C,D are the specified upper/full relation tensor complexes and the comparison is the distinct-block inclusion, retaining the Borel comodule structure and J′→J image map. -/
theorem ribet_complex_comparison (C D : ChainComplex (ModuleCat.{u} A) ℕ)
    (eC : C.X 0 ≅ ModuleCat.of A A) (eD : D.X 0 ≅ ModuleCat.of A A) :
    ∃ f : C ⟶ D, eC.inv ≫ f.f 0 ≫ eD.hom=𝟙 _ := sorry

/-- `IntegralHeckeAndGaloisDeterminants:IHG.6/ribet-obstruction-killing`.
For every j≥1, inclusion induces the zero map Hʲ(B,J′)→Hʲ(B,J).

Omitted: these complexes compute rational lower-Borel derived invariants of the actual upper/full relation ideals, and inclusion is induced by J′⊂J. No assertion is made about group cohomology of B(ℤ). -/
theorem ribet_obstruction_killing (J'cohom Jcohom : CochainComplex (ModuleCat ℤ) ℤ)
    (inclusion : J'cohom ⟶ Jcohom) :
    ∀ j : ℕ, 0 < j → (HomologicalComplex.homologyFunctor (ModuleCat ℤ) (.up ℤ) (j : ℤ)).map inclusion=0 := sorry

/-- `IntegralHeckeAndGaloisDeterminants:IHG.6/formal-determinant-comparison`.
For every stabilized relation minor under the full local Ribet input, detE′−detE evaluates into Ĩ. Since detE′=0 and detE=(∏_(v∈P)(ξ_v(σ_v)−χ(σ_v)))detD, this gives the weighted relation-minor containment in Ĩ.

Omitted: E,E′ are the stabilized relation matrices of the full local Ribet input and the map is the formal evaluation into the coefficient overring. The local weight lies in that overring. -/
theorem formal_determinant_comparison {B : Type u} [CommRing B] [Algebra A B]
    (I : Ideal B) (n : ℕ) (E E' : Matrix (Fin n) (Fin n) A) :
    algebraMap A B (E'.det-E.det) ∈ I := sorry

end TauCeti.RoadmapTheorem

namespace TauCeti.SuggestedFixtures
open CategoryTheory
variable (A : Type u) [CommRing A]
local instance : HasDerivedCategory.{u+1} (ModuleCat.{u} A) :=
  HasDerivedCategory.standard (ModuleCat.{u} A)
def degreeZero : DerivedCategory (ModuleCat.{u} A) :=
  (DerivedCategory.singleFunctor (ModuleCat.{u} A) 0).obj (ModuleCat.of A A)
def degreeZeroChain : CochainComplex (ModuleCat.{u} A) ℤ :=
  (HomologicalComplex.single (ModuleCat.{u} A) (.up ℤ) 0).obj (ModuleCat.of A A)
def degreeZeroHomotopy : HomotopyCategory (ModuleCat.{u} A) (.up ℤ) :=
  (HomotopyCategory.quotient (ModuleCat.{u} A) (.up ℤ)).obj (degreeZeroChain A)
/-- The two-term complex A --1→ A, placed in degrees zero and one. -/
def contractible : CochainComplex (ModuleCat.{u} A) ℤ := sorry
/-- Both nonzero objects are A and the differential between them is the identity. -/
theorem contractible_spec :
  Nonempty ((contractible A).X 0 ≅ ModuleCat.of A A) ∧
  Nonempty ((contractible A).X 1 ≅ ModuleCat.of A A) ∧
  ∃ (e₀ : (contractible A).X 0 ≅ ModuleCat.of A A)
    (e₁ : (contractible A).X 1 ≅ ModuleCat.of A A),
    e₀.inv ≫ (contractible A).d 0 1 ≫ e₁.hom=𝟙 _ ∧
      ∀ i : ℤ, i≠0 → i≠1 → Limits.IsZero ((contractible A).X i) := sorry
variable {A}
def scalarRepresentation {G : Type u} [Group G] (χ : G →* Aˣ) :
    MonoidAlgebra A G →ₐ[A] Matrix (Fin 2) (Fin 2) A :=
  (Algebra.ofId A (Matrix (Fin 2) (Fin 2) A)).comp (IntegralRibet.characterAlg χ)
/-- Integral upper-unipotent representation of the additive integers. -/
def upperUnipotent : MonoidAlgebra ℤ (Multiplicative ℤ) →ₐ[ℤ] Matrix (Fin 2) (Fin 2) ℤ := sorry
theorem upperUnipotent_apply (n : ℤ) :
  upperUnipotent (MonoidAlgebra.of ℤ (Multiplicative ℤ) (Multiplicative.ofAdd n))=!![1,n;0,1] := sorry
/-- The specified basis of the initial upper-unipotent quotient. -/
def upperUnipotentInitial : IntegralRibet.initialModule upperUnipotent 1 1 ≃ₗ[ℤ] ℤ := sorry
def emptyLocal (G : Type u) [Group G] : IntegralRibet.LocalData G where
  count := 0
  sigma := ∅
  subgroup := Fin.elim0
  inertia := Fin.elim0
  inertia_le := by intro v; exact v.elim0
  distinguished := none
  distinguished_mem := by intro v; exact v.elim0
  distinguished_exists := sorry
def fullLocal (G : Type u) [Group G] : IntegralRibet.LocalData G where
  count := 1
  sigma := {0}
  subgroup := fun _ ↦ ⊤
  inertia := fun _ ↦ ⊥
  inertia_le := sorry
  distinguished := some 0
  distinguished_mem := sorry
  distinguished_exists := sorry
def extraLocal (G : Type u) [Group G] : IntegralRibet.LocalData G where
  count := 2
  sigma := Finset.univ
  subgroup := fun _ ↦ ⊥
  inertia := fun _ ↦ ⊥
  inertia_le := sorry
  distinguished := some 0
  distinguished_mem := sorry
  distinguished_exists := sorry
end TauCeti.SuggestedFixtures

namespace TauCeti.SuggestedFixtures
open CategoryTheory
variable (A : Type u) [CommRing A]
local instance : HasDerivedCategory.{u+1} (ModuleCat.{u} A) :=
  HasDerivedCategory.standard (ModuleCat.{u} A)
def scalarDerived : A →ₐ[A] End (degreeZero A) := Algebra.ofId A _
def scalarChain : A →ₐ[A] End (degreeZeroChain A) := Algebra.ofId A _
def scalarHomotopy : A →ₐ[A] End (degreeZeroHomotopy A) := Algebra.ofId A _
end TauCeti.SuggestedFixtures

namespace TauCeti.SuggestedFixtures
variable {A : Type u} [CommRing A]
/-- Constant rank-one character representation. -/
def rankOne {G : Type u} [Group G] (χ : G →* Aˣ) :
    MonoidAlgebra A G →ₐ[A] Matrix (Fin 1) (Fin 1) A :=
  (Algebra.ofId A _).comp (IntegralRibet.characterAlg χ)
end TauCeti.SuggestedFixtures

namespace TauCeti.Determinant
variable {A G : Type u} [CommRing A] [Group G] {d : ℕ}
def twist (D : Determinant A (MonoidAlgebra A G) d) (θ : G →* Aˣ) :
    Determinant A (MonoidAlgebra A G) d :=
  D.comap (MonoidAlgebra.lift A (MonoidAlgebra A G) G
    { toFun := fun g ↦ (↑(θ g) : A) • MonoidAlgebra.of A G g
      map_one' := sorry
      map_mul' := sorry })
end TauCeti.Determinant
namespace TauCeti.SuggestedFixtures
open CategoryTheory
variable (A : Type u) [CommRing A]
def matrixGMA (s : ℕ) : GMA.Data A (Matrix (Fin s) (Fin s) A) s (fun _ ↦ 1) where
  size_pos := by intro i; decide
  idempotent := fun i ↦ Matrix.single i i 1
  idem := sorry
  orthogonal := sorry
  sum_one := sorry
  diagonal := sorry
  trace := Matrix.traceLinearMap (Fin s) A A
  trace_cyclic := sorry
  trace_diagonal := sorry
def oneBlockGMA (d : ℕ) (hd : 0 < d) : GMA.Data A (Matrix (Fin d) (Fin d) A) 1 (fun _ ↦ d) where
  size_pos := fun _ ↦ hd
  idempotent := fun _ ↦ 1
  idem := sorry
  orthogonal := sorry
  sum_one := sorry
  diagonal := sorry
  trace := Matrix.traceLinearMap (Fin d) A A
  trace_cyclic := sorry
  trace_diagonal := sorry
/-- The matrix order with the indicated off-diagonal entry in J. -/
def matrixOrder (J : Ideal A) (upper : Bool) : Subalgebra A (Matrix (Fin 2) (Fin 2) A) where
  carrier := {M | (if upper then M 0 1 else M 1 0) ∈ J}
  algebraMap_mem' := sorry
  zero_mem' := sorry
  one_mem' := sorry
  add_mem' := sorry
  mul_mem' := sorry
def orderGMA (J : Ideal A) (upper : Bool) : GMA.Data A (matrixOrder A J upper) 2 (fun _ ↦ 1) where
  size_pos := by intro i; decide
  idempotent := fun i ↦ ⟨Matrix.single i i 1, sorry⟩
  idem := sorry
  orthogonal := sorry
  sum_one := sorry
  diagonal := sorry
  trace := (Matrix.traceLinearMap (Fin 2) A A).comp (matrixOrder A J upper).val.toLinearMap
  trace_cyclic := sorry
  trace_diagonal := sorry
/-- The two ordered diagonal residual constituents of the triangular algebra. -/
def triangularResidualData (k : Type u) [Field k] :
    GMA.ResidualData (orderGMA k ⊥ false) := sorry
/-- The actual rank-one quotient matrix module, with i selecting its diagonal entry. -/
def upperConstituent (k : Type u) [Field k] (i : Fin 2) :
    ModuleCat.{u} ((k ⧸ (⊥ : Ideal k)) ⊗[k] matrixOrder k ⊥ false) :=
  GMA.quotientConstituent (orderGMA k ⊥ false) id i (by simp) ⊥ (by sorry)
/-- Iwahori units act on the standard integral lattice A². -/
def iwahoriDiagonal [IsLocalRing A] (i : Fin 2) :
    (matrixOrder A (IsLocalRing.maximalIdeal A) false)ˣ →*
      (IsLocalRing.ResidueField A)ˣ where
  toFun g := Units.mk0 (IsLocalRing.residue A (g.val.val i i)) (by sorry)
  map_one' := sorry
  map_mul' := sorry
def iwahoriUpperUnipotent (J : Ideal A) : (matrixOrder A J false)ˣ where
  val := ⟨!![1,1;0,1], by sorry⟩
  inv := ⟨!![1,-1;0,1], by sorry⟩
  val_inv := by sorry
  inv_val := by sorry

/-- Actual split diagonal determinant on A×A. -/
def productDeterminant : Determinant A (A × A) 2 :=
  ((Determinant.dimOneEquiv).symm (AlgHom.fst A A A)).mul
    ((Determinant.dimOneEquiv).symm (AlgHom.snd A A A))
/-- Polynomial coaction input for the split torus; reindexing adds exponents
in each fiber and multiplication replaces the last character by two characters. -/
def torusCoordinates : InvariantCoordinateInput A where
  ring := fun n ↦ CommAlgCat.of A (MonoidAlgebra A (Multiplicative (Fin n → ℤ)))
  reindex := sorry
  multiply := sorry
def trivialCoordinates : InvariantCoordinateInput A where
  ring := fun _ ↦ CommAlgCat.of A A
  reindex := fun _ ↦ AlgHom.id A A
  multiply := fun _ ↦ AlgHom.id A A
variable {A}
def torusEquiv {G : Type u} [Group G] :
    ReductivePseudocharacter G (torusCoordinates A) A ≃ (G →* Aˣ) := sorry
/-- Invertible upper-unipotent matrices, retaining their specified coefficients. -/
def unipotentUnits (K : Type) [Field K] : Multiplicative ℤ →* (Matrix (Fin 2) (Fin 2) K)ˣ where
  toFun := fun g ↦
    { val := !![1,(g.toAdd : K);0,1]
      inv := !![1,-(g.toAdd : K);0,1]
      val_inv := sorry
      inv_val := sorry }
  map_one' := sorry
  map_mul' := sorry
end TauCeti.SuggestedFixtures

namespace TauCeti.SuggestedTest
open CategoryTheory
local instance {A : Type u} [CommRing A] : HasDerivedCategory.{u+1} (ModuleCat.{u} A) :=
  HasDerivedCategory.standard (ModuleCat.{u} A)
local instance {T : Type u} [CommRing T] (m : Ideal T) [m.IsMaximal] : Field (T ⧸ m) :=
  Ideal.Quotient.field m
variable {A : Type u} [CommRing A] {R : Type u} [Ring R] [Algebra A R] {d : ℕ}

/-- `homogeneous_id`: The identity law is homogeneous of degree 1. -/
example : PolynomialLaw.IsHomogeneousOfDegree 1 (PolynomialLaw.id : A →ₚₗ[A] A) := sorry

/-- `homogeneous_ground_zero`: Over 𝔽_p some degree-(p+1) law vanishes on 𝔽_p-points without being zero. -/
example (p : ℕ) [Fact p.Prime] : ∃ f : (Fin 2 → ZMod p) →ₚₗ[ZMod p] ZMod p, PolynomialLaw.IsHomogeneousOfDegree (p+1) f ∧ f.ground=0 ∧ f≠0 := sorry

/-- `homogeneous_zero`: The zero law is homogeneous of degree n for all n. -/
example (n : ℕ) : PolynomialLaw.IsHomogeneousOfDegree n (0 : A →ₚₗ[A] A) := sorry

/-- `multiplicative_id`: The identity law is multiplicative. -/
example : PolynomialLaw.IsMultiplicative (PolynomialLaw.id : A →ₚₗ[A] A) := sorry

/-- `multiplicative_det`: The matrix determinant law M_d(A) → A is multiplicative. -/
example (d : ℕ) : PolynomialLaw.IsMultiplicative (Determinant.ofMatrix (AlgHom.id A (Matrix (Fin d) (Fin d) A))).toLaw := sorry

/-- `multiplicative_two_smul`: 2 • id is not multiplicative over a ring of characteristic zero. -/
example [Nontrivial A] [NoZeroDivisors A] [CharZero A] : ¬ PolynomialLaw.IsMultiplicative ((2 : A) • (PolynomialLaw.id : A →ₚₗ[A] A)) := sorry

/-- `det_matrix`: eval (ofMatrix id) M = det M. -/
example (d : ℕ) (M : Matrix (Fin d) (Fin d) A) : (Determinant.ofMatrix (AlgHom.id A _)).eval M=M.det := sorry

/-- `det_dim_zero`: A determinant of dimension 0 is constant 1. -/
example (D : Determinant A R 0) (x : R) : D.eval x=1 := sorry

/-- `det_trace_not_injective`: Over (ℤ/p)[X] two different p-dimensional determinants have the same trace. -/
example (p : ℕ) [Fact p.Prime] : ∃ D E : Determinant (Polynomial (ZMod p)) (Polynomial (Polynomial (ZMod p))) p, D.traceLinear=E.traceLinear ∧ D≠E := sorry

/-- `charpoly_one`: χ(1, t) = (t − 1)^d. -/
example (D : Determinant A R d) : D.charpoly 1=(X-1)^d := sorry

/-- `charpoly_ofMatrix`: For det ∘ ρ it is Matrix.charpoly (ρ x). -/
example (ρ : R →ₐ[A] Matrix (Fin d) (Fin d) A) (x : R) : (Determinant.ofMatrix ρ).charpoly x=Matrix.charpoly (ρ x) := sorry

/-- `trace_ofMatrix`: For det ∘ ρ, Tr = matrix trace. -/
example (ρ : R →ₐ[A] Matrix (Fin d) (Fin d) A) (x : R) : (Determinant.ofMatrix ρ).trace x=Matrix.trace (ρ x) := sorry

/-- `ofMatrix_id`: ofMatrix id on M_d(A) evaluates to det. -/
example (d : ℕ) (M : Matrix (Fin d) (Fin d) A) : (Determinant.ofMatrix (AlgHom.id A _)).eval M=M.det := sorry

/-- `ofMatrix_trace`: Its trace is the matrix trace. -/
example (d : ℕ) (M : Matrix (Fin d) (Fin d) A) : (Determinant.ofMatrix (AlgHom.id A _)).trace M=Matrix.trace M := sorry

/-- `ofMatrix_block`: A block-diagonal representation gives the product determinant. -/
example (a b : A) : (Determinant.ofMatrix (AlgHom.id A (Matrix (Fin 2) (Fin 2) A))).eval !![a,0;0,b]=a*b := sorry

/-- `mul_block`: ofMatrix of a block sum is the product. -/
example (D E : Determinant A R 1) (x : R) : (D.mul E).charpoly x=D.charpoly x*E.charpoly x := sorry

/-- `mul_trace`: Traces add. -/
example {e : ℕ} (D : Determinant A R d) (E : Determinant A R e) (x : R) : (D.mul E).trace x=D.trace x+E.trace x := sorry

/-- `mul_dim_zero`: Multiplying by the dimension-0 determinant changes nothing. -/
example (D : Determinant A R d) (E : Determinant A R 0) (x : R) : (D.mul E).eval x=D.eval x := sorry

/-- `comap_id`: Restriction along the identity. -/
example (D : Determinant A R d) : D.comap (AlgHom.id A R)=D := sorry

/-- `comap_ofMatrix`: Restriction of det ∘ ρ is det ∘ (ρ ∘ φ). -/
example (ρ : R →ₐ[A] Matrix (Fin d) (Fin d) A) (φ : A →ₐ[A] R) : (Determinant.ofMatrix ρ).comap φ=Determinant.ofMatrix (ρ.comp φ) := sorry

/-- `comap_subgroup`: Restriction to a subgroup H ≤ G. -/
example {G : Type u} [Group G] (H : Subgroup G) (D : Determinant A (MonoidAlgebra A G) d) (φ : MonoidAlgebra A H →ₐ[A] MonoidAlgebra A G) (hφ : ∀ h : H, φ (MonoidAlgebra.of A H h)=MonoidAlgebra.of A G h) (h : H) : (D.comap φ).eval (MonoidAlgebra.of A H h)=D.eval (MonoidAlgebra.of A G h) := sorry

/-- `baseChange_self`: Base change to A is D. -/
example (D : Determinant A R d) (x : R) : (D.baseChange A).eval (1 ⊗ₜ[A] x)=D.eval x := sorry

/-- `baseChange_ofMatrix`: Base change of det ∘ ρ. -/
example {B : Type u} [CommRing B] [Algebra A B] (ρ : R →ₐ[A] Matrix (Fin d) (Fin d) A) (x : R) : ((Determinant.ofMatrix ρ).baseChange B).eval (1 ⊗ₜ[A] x)=algebraMap A B (Matrix.det (ρ x)) := sorry

/-- `baseChange_trans`: Transitivity. -/
example {B C : Type u} [CommRing B] [CommRing C] [Algebra A B] [Algebra B C] [Algebra A C] [IsScalarTower A B C] (D : Determinant A R d) (x : R) : ((D.baseChange B).baseChange C).eval (1 ⊗ₜ[B] (1 ⊗ₜ[A] x))=algebraMap A C (D.eval x) := sorry

/-- `pseudo_matrix_trace`: tr on M_d(A) is a d-dimensional pseudocharacter. -/
example (d : ℕ) : IsPseudocharacter d (Matrix.traceLinearMap (Fin d) A A) := sorry

/-- `pseudo_wrong_dim`: tr on M_2(ℚ) is not 1-dimensional. -/
example : ¬ IsPseudocharacter 1 (Matrix.traceLinearMap (Fin 2) ℚ ℚ) := sorry

/-- `pseudo_id`: id : ℚ → ℚ is a 1-dimensional pseudocharacter. -/
example : IsPseudocharacter 1 (LinearMap.id : ℚ →ₗ[ℚ] ℚ) := sorry

/-- `ofLinearMap_id`: ofLinearMap id is PolynomialLaw.id. -/
example : PolynomialLaw.ofLinearMap (LinearMap.id : A →ₗ[A] A)=(PolynomialLaw.id : A →ₚₗ[A] A) := sorry

/-- `ofLinearMap_ground`: Its value map is ℓ. -/
example (f : R →ₗ[A] A) : (PolynomialLaw.ofLinearMap f).ground=f := sorry

/-- `ofLinearMap_zero`: ofLinearMap 0 is the zero law. -/
example : PolynomialLaw.ofLinearMap (0 : R →ₗ[A] A)=(0 : R →ₚₗ[A] A) := sorry

/-- `ker_id`: The identity law is faithful. -/
example : PolynomialLaw.IsFaithful (PolynomialLaw.id : A →ₚₗ[A] A) := sorry

/-- `ker_zero`: The zero law has kernel everything. -/
example : PolynomialLaw.ker (0 : A →ₚₗ[A] A)=⊤ := sorry

/-- `ker_upper_triangular`: On upper-triangular 2 × 2 matrices the determinant is not faithful. -/
example [Nontrivial A] : ∃ S : Subalgebra A (Matrix (Fin 2) (Fin 2) A),
    (∀ M ∈ S, M 1 0=0) ∧
    ((Determinant.ofMatrix (AlgHom.id A _)).comap S.val).IsCayleyHamilton ∧
    ¬ PolynomialLaw.IsFaithful ((Determinant.ofMatrix (AlgHom.id A _)).comap S.val).toLaw := sorry

/-- `ker_det_matrix`: For d>0, det on M_d(A) is faithful; the d=0 matrix algebra is the zero ring. -/
example (d : ℕ) (hd : 0 < d) : PolynomialLaw.IsFaithful (Determinant.ofMatrix (AlgHom.id A (Matrix (Fin d) (Fin d) A))).toLaw := sorry

/-- `ker_dim_zero`: In dimension 0 the kernel is everything. -/
example (D : Determinant A R 0) : D.kerTwoSided=⊤ := sorry

/-- `ker_upper_triangular_ideal`: On upper-triangular matrices it is the strictly upper-triangular ideal. -/
example [Nontrivial A] : ∃ S : Subalgebra A (Matrix (Fin 2) (Fin 2) A),
    (∀ M : Matrix (Fin 2) (Fin 2) A, M ∈ S ↔ M 1 0=0) ∧
    ∀ x : S, x ∈ ((Determinant.ofMatrix (AlgHom.id A _)).comap S.val).kerTwoSided ↔ x.val 0 0=0 ∧ x.val 1 1=0 := sorry

/-- `chi_matrix`: For det on M_d(A), χ is the zero law (Cayley–Hamilton). -/
example (d : ℕ) : (Determinant.ofMatrix (AlgHom.id A (Matrix (Fin d) (Fin d) A))).charpolyLaw=0 := sorry

/-- `chi_dim_one`: In dimension one χ(r) = r − D(r). -/
example (D : Determinant A R 1) (x : R) : D.charpolyLaw.ground x=x-algebraMap A R (D.eval x) := sorry

/-- `chi_one`: χ(1) = (1 − 1)^d = 0 for d ≥ 1. -/
example (D : Determinant A R d) (hd : 0 < d) : D.charpolyLaw.ground 1=0 := sorry

/-- `continuous_discrete`: On a discrete group every determinant is continuous. -/
example {G : Type u} [Group G] [TopologicalSpace G] [DiscreteTopology G] [TopologicalSpace A] (D : Determinant A (MonoidAlgebra A G) d) : D.IsContinuous := sorry

/-- `continuous_ofMatrix`: det ∘ ρ is continuous for continuous ρ. -/
example {G : Type u} [Group G] [TopologicalSpace G] [TopologicalSpace A] [IsTopologicalRing A] (ρ : MonoidAlgebra A G →ₐ[A] Matrix (Fin d) (Fin d) A) (hρ : Continuous (fun g : G ↦ ρ (MonoidAlgebra.of A G g))) : (Determinant.ofMatrix ρ).IsContinuous := sorry

/-- `continuous_not`: A determinant of dimension one on ℤ_p with values in ℚ_p from a discontinuous character is not continuous. -/
example {G : Type u} [Group G] [TopologicalSpace G] [TopologicalSpace A] (D : Determinant A (MonoidAlgebra A G) 1) (h : ¬ Continuous (fun g : G ↦ D.eval (MonoidAlgebra.of A G g))) : ¬ D.IsContinuous := sorry

/-- `ch_matrix`: CH(det) = 0 on M_d(A). -/
example (d : ℕ) : (Determinant.ofMatrix (AlgHom.id A (Matrix (Fin d) (Fin d) A))).chIdeal=⊥ := sorry

/-- `ch_upper_triangular`: CH = 0 on upper-triangular matrices. -/
example (S : Subalgebra A (Matrix (Fin 2) (Fin 2) A)) : ((Determinant.ofMatrix (AlgHom.id A _)).comap S.val).chIdeal=⊥ := sorry

/-- `ch_dim_one`: In dimension one CH(D) is generated by the r − D(r). -/
example (D : Determinant A R 1) : D.chIdeal=TwoSidedIdeal.span {z | ∃ x : R, z=x-algebraMap A R (D.eval x)} := sorry

/-- `ch_matrix_det`: (M_d(A), det) is Cayley–Hamilton. -/
example (d : ℕ) : (Determinant.ofMatrix (AlgHom.id A (Matrix (Fin d) (Fin d) A))).IsCayleyHamilton := sorry

/-- `ch_upper_triangular_not_faithful`: Upper-triangular matrices: Cayley–Hamilton, not faithful. -/
example [Nontrivial A] : ∃ S : Subalgebra A (Matrix (Fin 2) (Fin 2) A),
    (∀ M ∈ S, M 1 0=0) ∧
    ((Determinant.ofMatrix (AlgHom.id A _)).comap S.val).IsCayleyHamilton ∧
    ¬ PolynomialLaw.IsFaithful ((Determinant.ofMatrix (AlgHom.id A _)).comap S.val).toLaw := sorry

/-- `ch_faithful`: A faithful determinant is Cayley–Hamilton. -/
example (D : Determinant A R d) (hD : PolynomialLaw.IsFaithful D.toLaw) : D.IsCayleyHamilton := sorry

/-- `derived_image_zero_object`: For C=0, the image is the zero ring. -/
example (C : DerivedCategory (ModuleCat.{u} A)) (hC : Limits.IsZero C) : Subsingleton (HeckeImage.derived C (Algebra.ofId A (End C))) := sorry

/-- `derived_image_scalar`: For C=A in degree zero and its scalar action, T_der(C)≅A. -/
example : Nonempty (HeckeImage.derived (SuggestedFixtures.degreeZero A) (SuggestedFixtures.scalarDerived A) ≃ₐ[A] A) := sorry

/-- `derived_image_kernel`: For H→A acting on A in degree zero, T_der(C)≅H/ker(H→A). -/
example {H : Type u} [CommRing H] [Algebra A H] (φ : H →ₐ[A] A) : Nonempty (HeckeImage.derived (SuggestedFixtures.degreeZero A) ((SuggestedFixtures.scalarDerived A).comp φ) ≃ₐ[A] H ⧸ RingHom.ker φ.toRingHom) := sorry

/-- `ghost_single_degree`: If C has cohomology in one degree, G(C)=0. -/
example {M : Type u} [AddCommGroup M] [Module A M] (n : ℤ) : HeckeImage.ghostIdeal ((DerivedCategory.singleFunctor (ModuleCat.{u} A) n).obj (ModuleCat.of A M))=⊥ := sorry

/-- `ghost_ext_example`: For C=(Z/p)⊕(Z/p)[−1], an off-diagonal nonzero class in Ext¹_Z(Z/p,Z/p) defines a nonzero ghost f with f²=0. -/
example (p : ℕ) [Fact p.Prime] :
    let C := (DerivedCategory.singleFunctor (ModuleCat ℤ) 0).obj (ModuleCat.of ℤ (ZMod p)) ⊞
      (DerivedCategory.singleFunctor (ModuleCat ℤ) 1).obj (ModuleCat.of ℤ (ZMod p))
    ∃ f : End C, f≠0 ∧ f∈HeckeImage.ghostIdeal C ∧ f*f=0 := sorry

/-- `ghost_kernel_image`: For a scalar action on A in degree zero, J(C)=0 and T_coh(C)=T_der(C). -/
example : HeckeImage.imageGhostIdeal (SuggestedFixtures.degreeZero A) (SuggestedFixtures.scalarDerived A)=⊥ := sorry

/-- `localized_zero`: If H^*(C)_m=0 then C_m=0. -/
example (C : DerivedCategory (ModuleCat.{u} A)) (e : End C) (he : e*e=e) (h : ∀ i : ℤ, (DerivedCategory.homologyFunctor (ModuleCat.{u} A) i).map e=0) : Limits.IsZero (HeckeImage.localizedComplex C e he) := sorry

/-- `localized_product`: For T=A×A acting diagonally on C=A⊕A in degree zero, the two summands are the two copies of A. -/
example : let C := SuggestedFixtures.degreeZero A ⊞ SuggestedFixtures.degreeZero A
    let e : End C := Limits.biprod.fst ≫ Limits.biprod.inl
    Nonempty (HeckeImage.localizedComplex C e (by sorry) ≅ SuggestedFixtures.degreeZero A) := sorry

/-- `localized_homology`: For C=M in degree zero, C_m is the usual module localization M_m in degree zero. -/
example (C : DerivedCategory (ModuleCat.{u} A)) (e : End C) (he : e*e=e) : Nonempty ((DerivedCategory.homologyFunctor (ModuleCat.{u} A) 0).obj (HeckeImage.localizedComplex C e he) ≅ ModuleCat.of A (LinearMap.range ((DerivedCategory.homologyFunctor (ModuleCat.{u} A) 0).map e).hom)) := sorry

/-- `gln_one`: For n=1 the polynomial is X−T_1. -/
example (q t : A) : Spherical.glnPolynomial 1 q ![1,t]=X-C t := sorry

/-- `gln_two`: For n=2 it is X²−T_1X+qT_2. -/
example (q s t : A) : Spherical.glnPolynomial 2 q ![1,s,t]=X^2-C s*X+C (q*t) := sorry

/-- `gln_coefficients`: A homomorphism A→B transports P coefficient by coefficient, without choosing √q. -/
example {B : Type u} [CommRing B] (φ : A →+* B) (n : ℕ) (q : A) (T : Fin (n+1) → A) : (Spherical.glnPolynomial n q T).map φ=Spherical.glnPolynomial n (φ q) (φ ∘ T) := sorry

/-- `spin_one_parameters`: For q=T_0=1,T_1=4,T_2=4, Q=(X−1)⁴. -/
example : Spherical.gsp4SpinPolynomial (1 : A) 1 4 4=(X-1)^4 := sorry

/-- `spin_constant`: The constant term is the square of q³T_0. -/
example (q t₀ t₁ t₂ : A) : (Spherical.gsp4SpinPolynomial q t₀ t₁ t₂).coeff 0=(q^3*t₀)^2 := sorry

/-- `spin_not_gln`: Its X² coefficient contains (q³+q)T_0, so it is not the GL4 polynomial with the same three symbols. -/
example : (Spherical.gsp4SpinPolynomial (2 : ℤ) 1 0 0).coeff 2=10 := sorry

/-- `dual_spin_q_one`: For q=T_0=1, P=Q. -/
example (t₁ t₂ : A) : Spherical.gsp4DualSpinPolynomial (1 : A) 1 t₁ t₂=Spherical.gsp4SpinPolynomial 1 1 t₁ t₂ := sorry

/-- `dual_spin_roots`: For roots β_j of Q, P has roots q³β_j^{-1}. -/
example {K : Type u} [Field K] (q t₀ : Kˣ) (t₁ t₂ β : K) (hβ : β≠0) (h : (Spherical.gsp4SpinPolynomial (q : K) t₀ t₁ t₂).eval β=0) : (Spherical.gsp4DualSpinPolynomial (q : K) t₀ t₁ t₂).eval ((q : K)^3/β)=0 := sorry

/-- `dual_spin_central`: If T_0 is not fixed to 1, P and Q have different X³ coefficients, −T_1/T_0 and −T_1. -/
example (q t₁ t₂ : A) (t₀ : Aˣ) : (Spherical.gsp4DualSpinPolynomial q t₀ t₁ t₂).coeff 3= -(↑t₀⁻¹ : A)*t₁ := sorry

/-- `galois_type_rank_one`: A rank-one unramified reciprocity character with T_1 values supplies a Galois-type system. -/
example {T G V : Type u} [CommRing T] [Group G] [TopologicalSpace G] (m : Ideal T) [m.IsMaximal] [Finite (T ⧸ m)] [TopologicalSpace (T ⧸ m)] [DiscreteTopology (T ⧸ m)] (χ : G →* (T ⧸ m)ˣ) (hχ : Continuous χ) (Frob : V → G) : Spherical.IsGaloisType m 1 Frob (fun v ↦ X-C ((χ (Frob v) : (T ⧸ m)ˣ) : T ⧸ m)) := sorry

/-- `galois_type_reducible`: A sum of two characters gives Galois type but fails non-Eisenstein. -/
example {T G V : Type u} [CommRing T] [Group G] [TopologicalSpace G] (m : Ideal T) [m.IsMaximal] [Finite (T ⧸ m)] [TopologicalSpace (T ⧸ m)] [DiscreteTopology (T ⧸ m)] (χ ψ : G →* (T ⧸ m)ˣ) (hχ : Continuous χ) (hψ : Continuous ψ) : Spherical.IsGaloisType m 2 (id : G → G) (fun g ↦ (X-C ((χ g : (T ⧸ m)ˣ) : T ⧸ m))*(X-C ((ψ g : (T ⧸ m)ˣ) : T ⧸ m))) ∧ ¬ Spherical.IsNonEisenstein m 2 (id : G → G) (fun g ↦ (X-C ((χ g : (T ⧸ m)ˣ) : T ⧸ m))*(X-C ((ψ g : (T ⧸ m)ˣ) : T ⧸ m))) := sorry

/-- `galois_type_twist`: A character twist preserves absolute irreducibility and scales the i-th coefficient by θ(F_v)^i. -/
example {K G : Type u} [Field K] [Group G]
    (D : Determinant K (MonoidAlgebra K G) d) (hD : D.IsAbsolutelyIrreducible)
    (θ : G →* Kˣ) (g : G) (i : ℕ) (hi : i ≤ d) :
    (D.twist θ).IsAbsolutelyIrreducible ∧
      ((D.twist θ).charpoly (MonoidAlgebra.of K G g)).coeff (d-i)=
        (↑(θ g) : K)^i*(D.charpoly (MonoidAlgebra.of K G g)).coeff (d-i) := sorry

/-- `operator_nilpotent`: If t^r=0 on C, its localization is zero. -/
example (C : DerivedCategory (ModuleCat.{u} A)) (t : End C) (r : ℕ) (ht : t^r=0) : Limits.IsZero (HeckeImage.operatorLocalization C t) := sorry

/-- `operator_unit`: If t is an automorphism, its localization is C. -/
example (C : DerivedCategory (ModuleCat.{u} A)) (t : (End C)ˣ) : Nonempty (HeckeImage.operatorLocalization C (t : End C) ≅ C) := sorry

/-- `operator_factors`: For T=A×A and t=(1,0), localization selects the first summand. -/
example : let C := SuggestedFixtures.degreeZero A ⊞ SuggestedFixtures.degreeZero A
    let e : End C := Limits.biprod.fst ≫ Limits.biprod.inl
    Nonempty (HeckeImage.operatorLocalization C e ≅ SuggestedFixtures.degreeZero A) := sorry

/-- `quotient_constant_family`: If A is finite and J_r=0, a fixed continuous determinant gives a constant compatible family. -/
example {G : Type u} [Group G] [TopologicalSpace G] {J : ℕ → Ideal A} {hJ : Antitone J} (D : Determinant A (MonoidAlgebra A G) d) (hD : ∀ r i, @Continuous G (A ⧸ J r) _ ⊥ (fun g ↦ ((D.mapCoefficients (Ideal.Quotient.mk (J r))).charpoly (MonoidAlgebra.of (A ⧸ J r) G g)).coeff i)) : ∃ F : Interpolation.FiniteQuotientData A G d J hJ, ∀ r, F.determinant r=D.mapCoefficients (Ideal.Quotient.mk (J r)) := sorry

/-- `quotient_matrix_family`: A continuous matrix representation over A gives its determinants modulo every J_r. -/
example {G : Type u} [Group G] [TopologicalSpace G] {J : ℕ → Ideal A} {hJ : Antitone J} (ρ : MonoidAlgebra A G →ₐ[A] Matrix (Fin d) (Fin d) A) (r s : ℕ) (hrs : r ≤ s) : ((Determinant.ofMatrix ρ).mapCoefficients (Ideal.Quotient.mk (J s))).mapCoefficients (Ideal.Quotient.factor (hJ hrs))=(Determinant.ofMatrix ρ).mapCoefficients (Ideal.Quotient.mk (J r)) := sorry

/-- `quotient_incompatible`: Two rank-one characters differing after reduction at one level cannot form compatible data. -/
example {G : Type u} [Group G] [TopologicalSpace G] {J : ℕ → Ideal A} {hJ : Antitone J} (F : Interpolation.FiniteQuotientData A G 1 J hJ) (r s : ℕ) (hrs : r ≤ s) (D : Determinant (A ⧸ J r) (MonoidAlgebra (A ⧸ J r) G) 1) (hD : (F.determinant s).mapCoefficients (Ideal.Quotient.factor (hJ hrs))≠D) : F.determinant r≠D := sorry

/-- `limit_rank_one`: Compatible characters G→(Z/p^r)× produce the character G→Z_p×. -/
example {G : Type u} [Group G] [TopologicalSpace G] {J : ℕ → Ideal A} {hJ : Antitone J} (F : Interpolation.FiniteQuotientData A G 1 J hJ) (complete : A ≃+* Interpolation.quotientLimit J hJ) (hc : ∀ a r, (complete a).val r=Ideal.Quotient.mk (J r) a) (g : G) (r : ℕ) : Ideal.Quotient.mk (J r) ((Interpolation.inverseLimitDeterminant F complete hc).eval (MonoidAlgebra.of A G g))=(F.determinant r).eval (MonoidAlgebra.of (A ⧸ J r) G g) := sorry

/-- `limit_nonreduced`: The construction retains nilpotent coefficients in a complete nonreduced A. -/
example {G : Type u} [Group G] [TopologicalSpace G] {J : ℕ → Ideal A} {hJ : Antitone J}
    (F : Interpolation.FiniteQuotientData A G d J hJ)
    (complete : A ≃+* Interpolation.quotientLimit J hJ)
    (hc : ∀ a r, (complete a).val r=Ideal.Quotient.mk (J r) a)
    (a : A) (ha : a^2=0) (hne : a≠0) (g : G) (i : ℕ)
    (hcoeff : ∀ r, ((F.determinant r).charpoly (MonoidAlgebra.of (A ⧸ J r) G g)).coeff i=Ideal.Quotient.mk (J r) a) :
    ((Interpolation.inverseLimitDeterminant F complete hc).charpoly (MonoidAlgebra.of A G g)).coeff i=a ∧
      ∃ r, Ideal.Quotient.mk (J r) a≠0 := sorry

/-- `limit_constant`: For a constant finite quotient system, the inverse-limit determinant is the original law. -/
example {G : Type u} [Group G] [TopologicalSpace G] {J : ℕ → Ideal A} {hJ : Antitone J} (F : Interpolation.FiniteQuotientData A G d J hJ) (complete : A ≃+* Interpolation.quotientLimit J hJ) (hc : ∀ a r, (complete a).val r=Ideal.Quotient.mk (J r) a) (D : Determinant A (MonoidAlgebra A G) d) (hD : ∀ r, D.mapCoefficients (Ideal.Quotient.mk (J r))=F.determinant r) : Interpolation.inverseLimitDeterminant F complete hc=D := sorry

/-- `congruence_single`: One classical determinant already over A/J_r gives the identity embedding witness. -/
example {G V : Type u} [Group G] [TopologicalSpace G] [CompactSpace G]
    [TopologicalSpace A] [CompactSpace A] [T2Space A]
    (Frob : V → G) (hdense : Dense {g : G | ∃ v h, g=h*Frob v*h⁻¹})
    (D : Determinant A (MonoidAlgebra A G) d) (hD : D.IsContinuous) :
    let W : Interpolation.CongruenceWitness A G V d Frob :=
      { count := 1
        coefficient := fun _ ↦ CommAlgCat.of A A
        coefficientTopology := fun _ ↦ inferInstance
        coefficientT2 := fun _ ↦ inferInstance
        coefficient_continuous := sorry
        classical := fun _ ↦ D
        classical_continuous := sorry
        frobenius_dense := hdense
        injective := sorry
        frobenius_mem := sorry }
    W.count=1 ∧ W.classical 0=D ∧ Interpolation.CongruenceWitness.determinant W=D := sorry

/-- `congruence_intersection`: Compatible systems over A/I and A/J give the intersection-quotient witness. -/
example (I J : Ideal A) :
    Function.Injective (fun a : A ⧸ (I ⊓ J) ↦
      (Ideal.Quotient.factor (inf_le_left : I ⊓ J ≤ I) a,
       Ideal.Quotient.factor (inf_le_right : I ⊓ J ≤ J) a)) := sorry

/-- `congruence_nilpotent_invisible`: All field points of k[ε]/ε² see ε as zero; they cannot certify a coefficient ε or a nilpotent perturbation integrally. -/
example {k K : Type u} [Field k] [Field K] :
    (DualNumber.eps : DualNumber k)≠0 ∧ (DualNumber.eps : DualNumber k)^2=0 ∧
      ∀ φ : DualNumber k →+* K, φ DualNumber.eps=0 := sorry

/-- `fitting_cyclic_integer`: Fitt₀_Z(Z/6Z)=(6). -/
example : Fitting.zero ℤ (ZMod 6)=Ideal.span {(6 : ℤ)} := sorry

/-- `fitting_zero_module`: Fitt₀_A(0)=A, whereas Fitt₀_A(A)=0 for A≠0. -/
example : Fitting.zero A (Fin 0 → A)=⊤ ∧ Fitting.zero A A=⊥ := sorry

/-- `fitting_not_annihilator`: For M=(Z/6Z)², Fitt₀_Z(M)=(36), strictly smaller than Ann_Z(M)=(6). -/
example : Fitting.zero ℤ (ZMod 6 × ZMod 6)=Ideal.span {(36 : ℤ)} ∧ (36 : ℤ)∈Ideal.span {(6 : ℤ)} ∧ (6 : ℤ)∉Fitting.zero ℤ (ZMod 6 × ZMod 6) := sorry

/-- `difference_scalar_zero`: If ρ(g)=ψ(g)I₂ and χ=ψ, then Δψ=0. -/
example {G : Type u} [Group G] (ψ : G →* Aˣ) : IntegralRibet.differenceModule (SuggestedFixtures.scalarRepresentation ψ) ψ=⊥ := sorry

/-- `difference_trivial_group`: For the trivial group and the trivial scalar representation, Δψ=0. -/
example : IntegralRibet.differenceModule (SuggestedFixtures.scalarRepresentation (1 : PUnit.{u+1} →* Aˣ)) 1=⊥ := sorry

/-- `difference_upper_unipotent`: For G=Z, A=B=Z and ρ(n)=[[1,n],[0,1]], χ=ψ=1, Δψ=Z E₁₂, ΔχΔψ=0. -/
example : IntegralRibet.differenceModule SuggestedFixtures.upperUnipotent 1=Submodule.span ℤ {Matrix.single (0 : Fin 2) 1 (1 : ℤ)} ∧ IntegralRibet.differenceProduct SuggestedFixtures.upperUnipotent 1 1=⊥ := sorry

/-- `ribet_cocycle_identity`: κ₀(1)=0. -/
example {B G : Type u} [CommRing B] [Algebra A B] [Group G] (ρ : MonoidAlgebra A G →ₐ[A] Matrix (Fin 2) (Fin 2) B) (χ ψ : G →* Aˣ) : IntegralRibet.canonicalCocycle ρ χ ψ 1=0 := sorry

/-- `ribet_cocycle_unipotent`: For the integral upper-unipotent representation of Z with χ=ψ=1, κ₀(n)=n in M₀≅Z. -/
example (n : ℤ) : SuggestedFixtures.upperUnipotentInitial (IntegralRibet.canonicalCocycle SuggestedFixtures.upperUnipotent 1 1 (Multiplicative.ofAdd n))=n := sorry

/-- `ribet_cocycle_twisted_product`: The underlying function satisfies the continuous cochain API’s twisted cocycle equation, with α(g), rather than α(h), multiplying κ₀(h). -/
example {B G : Type u} [CommRing B] [Algebra A B] [Group G] (ρ : MonoidAlgebra A G →ₐ[A] Matrix (Fin 2) (Fin 2) B) (χ ψ : G →* Aˣ) (g h : G) : IntegralRibet.canonicalCocycle ρ χ ψ (g*h)=IntegralRibet.canonicalCocycle ρ χ ψ g+((↑(χ g) : A)*(↑(ψ g)⁻¹ : A)) • IntegralRibet.canonicalCocycle ρ χ ψ h := sorry

/-- `local_module_empty_conditions`: For S=∅, N=M₀ and κ=κ₀. -/
example {B G : Type u} [CommRing B] [Algebra A B] [Group G] (ρ : MonoidAlgebra A G →ₐ[A] Matrix (Fin 2) (Fin 2) B) (χ ψ : G →* Aˣ) : Nonempty (IntegralRibet.localModule (SuggestedFixtures.emptyLocal G) ρ χ ψ ≃ₗ[A] IntegralRibet.initialModule ρ χ ψ) := sorry

/-- `local_module_whole_group_zero`: For Σ={v₀}, G_v₀=G and P=∅, N=0. -/
example {B G : Type u} [CommRing B] [Algebra A B] [Group G] (ρ : MonoidAlgebra A G →ₐ[A] Matrix (Fin 2) (Fin 2) B) (χ ψ : G →* Aˣ) : Limits.IsZero (IntegralRibet.localModule (SuggestedFixtures.fullLocal G) ρ χ ψ) := sorry

/-- `local_module_extra_generator`: For scalar ρ=ψI₂, χ=ψ, Σ={v₀,v₁} and both subgroups trivial, M₀=0 but N≅A y_v₁; the cocycle alone does not generate N. -/
example {G : Type u} [Group G] (ψ : G →* Aˣ) : Nonempty (IntegralRibet.localModule (SuggestedFixtures.extraLocal G) (SuggestedFixtures.scalarRepresentation ψ) ψ ψ ≃ₗ[A] A) := sorry

/-- `divided_power_degree_zero`: Γ^0_A(M)≅A, with γ₀(m)=1. -/
example {M : Type u} [AddCommGroup M] [Module A M] :
    Nonempty (DividedPower.degree A M 0 ≃ₗ[A] A) := sorry

/-- `divided_power_degree_one`: Γ^1_A(M)≅M, and γ₁ corresponds to the identity. -/
example {M : Type u} [AddCommGroup M] [Module A M] :
    ∃ e : DividedPower.degree A M 1 ≃ₗ[A] M, ∀ x, e (DividedPower.gamma 1 x)=x := sorry

/-- `divided_power_degree_two_integer`: In the full Γ_Z(Z), γ₁(1)²=2γ₂(1); γ₂(1) is a basis of Γ²_Z(Z), so the divided-power grading cannot be replaced by an ordinary polynomial grading. -/
example : DividedPowerAlgebra.dp ℤ 1 (1 : ℤ)^2=2*DividedPowerAlgebra.dp ℤ 2 (1 : ℤ) := sorry

/-- `universal_law_degree_zero`: The degree-zero law is constant 1 in Γ⁰≅A. -/
example {M : Type u} [AddCommGroup M] [Module A M] (x : M) : ((DividedPower.universalLaw (A := A) 0).ground x : DividedPowerAlgebra A M)=1 := sorry

/-- `universal_law_degree_one`: Under Γ¹≅M it is Mathlib’s identity polynomial law. -/
example {M : Type u} [AddCommGroup M] [Module A M] (e : DividedPower.degree A M 1 ≃ₗ[A] M) (he : ∀ x, e (DividedPower.gamma 1 x)=x) (x : M) : e ((DividedPower.universalLaw 1).ground x)=x := sorry

/-- `universal_law_mixed_degree_two`: The coefficient of UV in γ²(Ux+Vy) is γ₁(x)γ₁(y), with no factor 2 inserted. -/
example {M : Type u} [AddCommGroup M] [Module A M] (x y : M) : ((DividedPower.universalLaw (A := A) 2).ground (x+y) : DividedPowerAlgebra A M)=DividedPowerAlgebra.dp A 2 x+DividedPowerAlgebra.dp A 1 x*DividedPowerAlgebra.dp A 1 y+DividedPowerAlgebra.dp A 2 y := sorry

/-- `dp_tensor_degree_one`: For d=1 the map is the identity on M⊗N under Γ¹≅identity. -/
example {M N : Type u} [AddCommGroup M] [Module A M] [AddCommGroup N] [Module A N] (x : M) (y : N) : DividedPower.tensorMap 1 (DividedPower.gamma 1 x ⊗ₜ[A] DividedPower.gamma 1 y)=DividedPower.gamma 1 (x ⊗ₜ[A] y) := sorry

/-- `dp_tensor_degree_zero`: For d=0 it is A⊗_A A≅A. -/
example {M N : Type u} [AddCommGroup M] [Module A M] [AddCommGroup N] [Module A N] (x : M) (y : N) : DividedPower.tensorMap 0 (DividedPower.gamma 0 x ⊗ₜ[A] DividedPower.gamma 0 y)=DividedPower.gamma 0 (x ⊗ₜ[A] y) := sorry

/-- `dp_tensor_integer_generator`: For d=2, M=N=Z, the basis γ₂(1)⊗γ₂(1) maps to γ₂(1⊗1), with coefficient 1. -/
example : DividedPower.tensorMap 2 (DividedPower.gamma (A := ℤ) 2 (1 : ℤ) ⊗ₜ[ℤ] DividedPower.gamma (A := ℤ) 2 (1 : ℤ))=DividedPower.gamma 2 ((1 : ℤ) ⊗ₜ[ℤ] (1 : ℤ)) := sorry

/-- `internal_degree_one`: Γ¹_A(R) with its internal multiplication is R as an A-algebra. -/
example : Nonempty (DividedPower.degree A R 1 ≃ₐ[A] R) := sorry

/-- `internal_integer_degree_two`: For R=Z,d=2, γ₂(1)⋆γ₂(1)=γ₂(1); the full graded product γ₂(1)γ₂(1)=6γ₄(1) is a different operation. -/
example : DividedPower.gamma (A := ℤ) 2 (1 : ℤ)*DividedPower.gamma (A := ℤ) 2 (1 : ℤ)=DividedPower.gamma 2 (1 : ℤ) := sorry

/-- `internal_scalar_power`: For R=A the universal multiplicative law is a↦a^d and its representing algebra is A. -/
example (d : ℕ) (a b : A) : DividedPower.gamma (A := A) d a * DividedPower.gamma d b=DividedPower.gamma d (a*b) := sorry

/-- `coordinate_ring_degree_one`: Z_A(R,1)=R^ab. -/
example : Nonempty (Determinant.coordinateRing A A 1 ≃ₐ[A] A) := sorry

/-- `coordinate_ring_base_algebra`: Z_A(A,d)≅A with universal law a↦a^d. -/
example (d : ℕ) : Nonempty (Determinant.coordinateRing A A d ≃ₐ[A] A) := sorry

/-- `coordinate_ring_one_variable`: Z_A(A[t],d)≅A[e₁,…,e_d], and the universal characteristic polynomial of t is X^d−e₁X^(d−1)+…+(−1)^d e_d. -/
example (d : ℕ) : Nonempty (Determinant.coordinateRing A A[X] d ≃ₐ[A] MvPolynomial (Fin d) A) := sorry

/-- `det_dual_rank_one`: The dual of a unit character χ is χ⁻¹. -/
example {G : Type u} [Group G] (D : Determinant A (MonoidAlgebra A G) 1) (g : G) : D.dual.eval (MonoidAlgebra.of A G g)*D.eval (MonoidAlgebra.of A G g)=1 := sorry

/-- `det_dual_trivial`: The trivial d-dimensional representation is fixed by duality. -/
example {G : Type u} [Group G] (D : Determinant A (MonoidAlgebra A G) d) (hD : ∀ g, D.charpoly (MonoidAlgebra.of A G g)=(X-1)^d) : D.dual=D := sorry

/-- `det_dual_rank_two`: For a diagonal unit pair (a,b), dual characteristic polynomial is X²−(a⁻¹+b⁻¹)X+(ab)⁻¹. -/
example (a b : Aˣ) : Matrix.charpoly (!![(↑a⁻¹ : A),0;0,(↑b⁻¹ : A)] : Matrix (Fin 2) (Fin 2) A)=X^2-C ((↑a⁻¹ : A)+(↑b⁻¹ : A))*X+C ((↑a⁻¹ : A)*(↑b⁻¹ : A)) := sorry

/-- `projective_determinant_line`: On an invertible rank-one module, scalar a has determinant a. -/
example {V : Type u} [AddCommGroup V] [Module A V] [Module.Finite A V] [Module.Projective A V] (hRank : Determinant.HasConstantRank (A := A) V 1) (a : A) : (Determinant.ofFiniteProjective 1 hRank (Algebra.ofId A (Module.End A V))).eval a=a := sorry

/-- `projective_determinant_identity`: The identity endomorphism has determinant 1. -/
example {V : Type u} [AddCommGroup V] [Module A V] [Module.Finite A V] [Module.Projective A V] (hRank : Determinant.HasConstantRank (A := A) V d) (ρ : R →ₐ[A] Module.End A V) : (Determinant.ofFiniteProjective d hRank ρ).eval 1=1 := sorry

/-- `projective_determinant_free`: For V=A² and a specified basis, the determinant equals Mathlib’s Matrix.det, including the off-diagonal sign. -/
example (b : Module.Basis (Fin 2) A (Fin 2 → A)) (hRank : Determinant.HasConstantRank (A := A) (Fin 2 → A) 2) (ρ : R →ₐ[A] Module.End A (Fin 2 → A)) (x : R) : (Determinant.ofFiniteProjective 2 hRank ρ).eval x=Matrix.det (LinearMap.toMatrix b b (ρ x)) := sorry

/-- `azumaya_matrix_norm`: For R=M₂(A), the norm is ad−bc. -/
example [IsAzumaya A (Matrix (Fin 2) (Fin 2) A)] (hRank : Determinant.HasConstantRank (A := A) (Matrix (Fin 2) (Fin 2) A) 4) (a b c e : A) : (Determinant.ofAzumaya 2 (by decide) hRank).eval !![a,b;c,e]=a*e-b*c := sorry

/-- `azumaya_rank_one`: For R=A,d=1, the norm is the identity. -/
example [IsAzumaya A A] (hRank : Determinant.HasConstantRank (A := A) A 1) (a : A) : (Determinant.ofAzumaya 1 (by decide) hRank).eval a=a := sorry

/-- `azumaya_quaternion_norm`: For the Hamilton quaternion algebra over R, Nrd(a+bi+cj+dk)=a²+b²+c²+d². -/
example [IsAzumaya ℝ (Quaternion ℝ)] (hRank : Determinant.HasConstantRank (A := ℝ) (Quaternion ℝ) 4) (x : Quaternion ℝ) : (Determinant.ofAzumaya 2 (by decide) hRank).eval x=x.re^2+x.imI^2+x.imJ^2+x.imK^2 := sorry

/-- `invariant_eval_reindex_swap`: swapping two coordinates commutes with evaluation. -/
example {O H A : Type u} [CommRing O] [Group H] [CommRing A] [Algebra O A]
    (C : InvariantCoordinateInput O) (E : InvariantEvaluation C H A)
    (f : C.ring 2) (g : Fin 2 → H) :
    E.evaluate 2 (C.reindex (Equiv.swap (0 : Fin 2) 1) f) g =
      E.evaluate 2 f (g ∘ Equiv.swap (0 : Fin 2) 1) := sorry
/-- `invariant_eval_multiply_pair`: the product pullback evaluates at the product tuple. -/
example {O H A : Type u} [CommRing O] [Group H] [CommRing A] [Algebra O A]
    (C : InvariantCoordinateInput O) (E : InvariantEvaluation C H A)
    (f : C.ring 1) (g : Fin 2 → H) :
    E.evaluate 2 (C.multiply 0 f) g = E.evaluate 1 f (fun _ ↦ g 0*g 1) := sorry
/-- `invariant_eval_incompatible`: a violated reindex equation excludes compatible evaluation. -/
example {O H A : Type u} [CommRing O] [Group H] [CommRing A] [Algebra O A]
    (C : InvariantCoordinateInput O)
    (raw : ∀ n, C.ring n →ₐ[O] ((Fin n → H) → A))
    {n m : ℕ} (σ : Fin n → Fin m) (f : C.ring n) (g : Fin m → H)
    (h : raw m (C.reindex σ f) g ≠ raw n f (g ∘ σ)) :
    ¬ ∃ E : InvariantEvaluation C H A, E.evaluate = raw := sorry

/-- `h_pseudocharacter_torus`: For H=G_m, it is a unit character Γ→Aˣ. -/
example {G : Type u} [Group G] : Nonempty (ReductivePseudocharacter G (SuggestedFixtures.torusCoordinates A) A ≃ (G →* Aˣ)) := sorry

/-- `h_pseudocharacter_trivial_rep`: The trivial representation evaluates every invariant at the identity tuple. -/
example {G : Type u} [Group G] (C : InvariantCoordinateInput A) (eval : InvariantEvaluation C Aˣ A) (n : ℕ) (f : C.ring n) (g : Fin n → G) : (ReductivePseudocharacter.ofRepresentation C (1 : G →* Aˣ) eval).theta n f g=eval.evaluate n f (fun _ ↦ 1) := sorry

/-- Regular polynomial evaluation and simultaneous conjugation invariance are explicit.
`h_pseudocharacter_unipotent`: Over an algebraically closed field, the nontrivial upper-unipotent representation Z→GL₂ has the same pseudocharacter as the trivial rank-two representation; the pseudocharacter does not retain the nonsplit extension. -/
example {K : Type} [Field K] [IsAlgClosed K] (C : InvariantCoordinateInput K) (eval : InvariantEvaluation C (Matrix (Fin 2) (Fin 2) K)ˣ K) (hregular : eval.IsRegularMatrixInvariant) : ReductivePseudocharacter.ofRepresentation C (SuggestedFixtures.unipotentUnits K) eval=ReductivePseudocharacter.ofRepresentation C (1 : Multiplicative ℤ →* (Matrix (Fin 2) (Fin 2) K)ˣ) eval := sorry

/-- `h_continuous_discrete_group`: Every pseudocharacter on a discrete Γ is continuous. -/
example {G : Type u} [Group G] [TopologicalSpace G] [DiscreteTopology G] [TopologicalSpace A] (C : InvariantCoordinateInput A) (Θ : ReductivePseudocharacter G C A) : Θ.IsContinuous := sorry

/-- `h_continuous_rank_one`: For H=G_m the condition is continuity of the associated unit character. -/
example {G : Type u} [Group G] [TopologicalSpace G] [TopologicalSpace A] [IsTopologicalRing A] (Θ : ReductivePseudocharacter G (SuggestedFixtures.torusCoordinates A) A) : Θ.IsContinuous ↔ Continuous (SuggestedFixtures.torusEquiv Θ) := sorry

/-- `h_continuous_finite_quotient`: A finite-quotient representation into a discrete finite coefficient ring gives a continuous pseudocharacter on a profinite group. -/
example {G Q : Type u} [Group G] [Group Q] [TopologicalSpace G] [TopologicalSpace Q] [Finite Q] [DiscreteTopology Q] [TopologicalSpace A] (C : InvariantCoordinateInput A) (Θ : ReductivePseudocharacter Q C A) (π : G →* Q) (hπ : Continuous π) : (ReductivePseudocharacter.restrict C Θ π).IsContinuous := sorry

/-- `h_kernel_trivial_rep`: The trivial representation has ker Θ=Γ. -/
example {G : Type u} [Group G] (C : InvariantCoordinateInput A) (eval : InvariantEvaluation C Aˣ A) : ReductivePseudocharacter.kernel C (ReductivePseudocharacter.ofRepresentation C (1 : G →* Aˣ) eval)=⊤ := sorry

/-- `h_kernel_rank_one`: For H=G_m it is the kernel of the unit character. -/
example {G : Type u} [Group G] (Θ : ReductivePseudocharacter G (SuggestedFixtures.torusCoordinates A) A) : ReductivePseudocharacter.kernel (SuggestedFixtures.torusCoordinates A) Θ=(SuggestedFixtures.torusEquiv Θ).ker := sorry

/-- Regular invariant evaluation is explicit; characteristic zero makes ρ faithful.
`h_kernel_unipotent_strict`: For the upper-unipotent representation of Z in GL₂ over C, ker ρ={0} but ker Θ_ρ=Z. -/
example {K : Type} [Field K] [IsAlgClosed K] [CharZero K] (C : InvariantCoordinateInput K) (eval : InvariantEvaluation C (Matrix (Fin 2) (Fin 2) K)ˣ K) (hregular : eval.IsRegularMatrixInvariant) : (SuggestedFixtures.unipotentUnits K).ker=⊥ ∧ ReductivePseudocharacter.kernel C (ReductivePseudocharacter.ofRepresentation C (SuggestedFixtures.unipotentUnits K) eval)=⊤ := sorry

/-- `corner_matrix`: For the usual determinant on M₃(A) and e=diag(1,1,0), D_e is the 2×2 determinant. -/
example [Nontrivial A] (hconnected : ∀ a : A, a*a=a → a=0 ∨ a=1) : let D := Determinant.ofMatrix (AlgHom.id A (Matrix (Fin 3) (Fin 3) A))
    let e : Matrix (Fin 3) (Fin 3) A := Matrix.diagonal ![1,1,0]
    (D.corner hconnected e (by sorry)).1=2 ∧ ∃ φ : Corner A (Matrix (Fin 3) (Fin 3) A) e (by sorry) ≃ₐ[A] Matrix (Fin 2) (Fin 2) A,
      ∀ x, (D.corner hconnected e (by sorry)).2.eval x=(φ x).det := sorry

/-- `corner_zero`: For e=0 the corner determinant has degree zero and constant value one. -/
example [Nontrivial A] (D : Determinant A R d)
    (hconnected : ∀ a : A, a*a=a → a=0 ∨ a=1) :
    (D.corner hconnected 0 (by simp)).1=0 ∧ ∀ x, (D.corner hconnected 0 (by simp)).2.eval x=1 := sorry

/-- `corner_rank_not_trace`: Over F₂, a rank-two projection has trace zero but corner degree two. -/
example : let D := Determinant.ofMatrix (AlgHom.id (ZMod 2) (Matrix (Fin 3) (Fin 3) (ZMod 2)))
    let e : Matrix (Fin 3) (Fin 3) (ZMod 2) := Matrix.diagonal ![1,1,0]
    D.trace e=0 ∧ (D.corner (by sorry) e (by sorry)).1=2 := sorry

/-- `residual_scalar`: A one-dimensional character determinant is split and absolutely irreducible. -/
example {K G : Type u} [Field K] [Group G] (χ : G →* Kˣ) : (Determinant.ofMatrix (SuggestedFixtures.rankOne χ)).IsSplit ∧ (Determinant.ofMatrix (SuggestedFixtures.rankOne χ)).IsAbsolutelyIrreducible := sorry

/-- `residual_repeated`: χ² is split but not multiplicity-free, including in characteristic two. -/
example {K G : Type u} [Field K] [Group G] (χ : G →* Kˣ) :
    ((Determinant.ofMatrix (SuggestedFixtures.rankOne χ)).mul
      (Determinant.ofMatrix (SuggestedFixtures.rankOne χ))).IsSplit ∧
    ¬ ((Determinant.ofMatrix (SuggestedFixtures.rankOne χ)).mul
      (Determinant.ofMatrix (SuggestedFixtures.rankOne χ))).IsMultiplicityFree := sorry

/-- `residual_distinct`: χψ for two distinct k-valued characters is split multiplicity-free and reducible. -/
example {K G : Type u} [Field K] [Group G] (χ ψ : G →* Kˣ) (h : χ≠ψ) :
    ((Determinant.ofMatrix (SuggestedFixtures.rankOne χ)).mul
      (Determinant.ofMatrix (SuggestedFixtures.rankOne ψ))).IsSplit ∧
    ((Determinant.ofMatrix (SuggestedFixtures.rankOne χ)).mul
      (Determinant.ofMatrix (SuggestedFixtures.rankOne ψ))).IsMultiplicityFree ∧
    ¬ ((Determinant.ofMatrix (SuggestedFixtures.rankOne χ)).mul
      (Determinant.ofMatrix (SuggestedFixtures.rankOne ψ))).IsAbsolutelyIrreducible := sorry

/-- `residual_nonsplit_quaternion`: The Hamilton reduced norm is absolutely irreducible
over an algebraic closure but does not split over its base field R. -/
example [IsAzumaya ℝ (Quaternion ℝ)]
    (hRank : Determinant.HasConstantRank (A := ℝ) (Quaternion ℝ) 4) :
    let D := Determinant.ofAzumaya 2 (by decide) hRank
    D.IsAbsolutelyIrreducible ∧ ¬ D.IsSplit := sorry

/-- Real regular multiplication by a complex number, for the splitness regression. -/
def SuggestedFixtures.complexRegular : ℂ →ₐ[ℝ] Matrix (Fin 2) (Fin 2) ℝ where
  toFun z := !![z.re, -z.im; z.im, z.re]
  map_zero' := sorry
  map_one' := sorry
  map_add' := sorry
  map_mul' := sorry
  commutes' := sorry

/-- `residual_real_norm_not_split`: Real realizability does not split the faithful
quotient. Over ℂ the two norm constituents are distinct. -/
example : let D := Determinant.ofMatrix SuggestedFixtures.complexRegular
    (∀ z : ℂ, D.eval z = z.re^2 + z.im^2) ∧
    D.IsMultiplicityFree ∧ ¬ D.IsSplit ∧
    (∃ ρ : ℂ →ₐ[ℝ] Matrix (Fin 2) (Fin 2) ℝ, Determinant.ofMatrix ρ = D) := sorry

/-- `gma_full_matrix`: For R=M_d(A) partitioned into blocks, every A_ij=A. -/
example (s : ℕ) (i j : Fin s) : Nonempty (GMA.entryModule (SuggestedFixtures.matrixGMA A s) i j ≃ₗ[A] A) := sorry

/-- `gma_triangular`: For upper triangular 2×2 matrices, A_12=A and A_21=0. -/
example : Nonempty (GMA.entryModule (SuggestedFixtures.orderGMA A ⊥ false) 0 1 ≃ₗ[A] A) ∧ Subsingleton (GMA.entryModule (SuggestedFixtures.orderGMA A ⊥ false) 1 0) := sorry

/-- `gma_not_free_offdiagonal`: For R=[[A,J],[A,A]] with a nonprincipal ideal J, A_12=J need not be free. -/
example (J : Ideal A) (hJ : ¬ Module.Free A J) : ¬ Module.Free A (GMA.entryModule (SuggestedFixtures.orderGMA A J true) 0 1) := sorry

/-- `adapted_one_block`: For one block M_d(A), B_ad=A. -/
example (d : ℕ) (hd : 0 < d) : Nonempty (GMA.adaptedRing (SuggestedFixtures.oneBlockGMA A d hd) ≃ₐ[A] A) := sorry

/-- `adapted_two_scalar`: For the full 2×2 matrix algebra, B_ad=A[b,c]/(bc−1), with off-diagonal entries b,c. -/
example : Nonempty (GMA.adaptedRing (SuggestedFixtures.matrixGMA A 2) ≃ₐ[A] (MvPolynomial (Fin 2) A ⧸ Ideal.span {((MvPolynomial.X 0*MvPolynomial.X 1-1) : MvPolynomial (Fin 2) A)})) := sorry

/-- `adapted_triangular`: For upper triangular 2×2 matrices, B_ad=A[b] and the universal upper entry is b. -/
example : Nonempty (GMA.adaptedRing (SuggestedFixtures.orderGMA A ⊥ false) ≃ₐ[A] A[X]) := sorry

/-- `gma_det_two`: For [[a,b],[c,d]] with scalar blocks, D_E=ad−φ(b,c). -/
example (a b c e : A) : (GMA.determinant (SuggestedFixtures.matrixGMA A 2)).eval !![a,b;c,e]=a*e-b*c := sorry

/-- `gma_det_triangular`: For triangular matrices it is the product of diagonal determinants. -/
example (x : SuggestedFixtures.matrixOrder A ⊥ false) : (GMA.determinant (SuggestedFixtures.orderGMA A ⊥ false)).eval x=x.val 0 0*x.val 1 1 := sorry

/-- `gma_det_characteristic_two`: Over F₂ the determinant still detects a repeated scalar character although its trace is zero. -/
example (a : ZMod 2) : (GMA.determinant (SuggestedFixtures.matrixGMA (ZMod 2) 2)).eval (a • 1)=a^2 ∧ (GMA.determinant (SuggestedFixtures.matrixGMA (ZMod 2) 2)).trace (a • 1)=0 := sorry

/-- `reducibility_triangular`: For an upper triangular algebra the ideal is zero. -/
example : GMA.reducibilityIdeal (SuggestedFixtures.orderGMA A ⊥ false) 0 1=⊥ := sorry

/-- `reducibility_congruence`: For [[A,A],[π^rA,A]] over a DVR, I_red=(π^r). -/
example (π : A) (r : ℕ) : GMA.reducibilityIdeal (SuggestedFixtures.orderGMA A (Ideal.span {π^r}) false) 0 1=Ideal.span {π^r} := sorry

/-- `reducibility_full_matrix`: For M₂(A) the opposite pairing is the unit ideal; there is no two-block determinant factorization with two distinct residual characters. -/
example : GMA.reducibilityIdeal (SuggestedFixtures.matrixGMA A 2) 0 1=⊤ := sorry

/-- `extension_two_blocks`: With two blocks the intermediate sum is zero. -/
example {size : Fin 2 → ℕ} (E : GMA.Data A R 2 size) : GMA.intermediateProducts E 0 1=⊥ := sorry

/-- `extension_three_full`: For three scalar blocks of M₃(A), A_13/A_12A_23=0. -/
example : Limits.IsZero (GMA.extensionModule (SuggestedFixtures.matrixGMA A 3) 0 2) := sorry

/-- `extension_triangular`: For [[A,B],[0,A]], the upper extension module is B. -/
example : Nonempty (GMA.extensionModule (SuggestedFixtures.orderGMA A ⊥ false) 0 1 ≃ₗ[A] A) := sorry

/-- `universal_rank_one`: For d=1 the universal Cayley–Hamilton algebra equals the universal character ring. -/
example {G : Type} [Group G] : Nonempty (CayleyHamilton.universalAlgebra G 1 ≃+* Determinant.coordinateRing ℤ (MonoidAlgebra ℤ G) 1) := sorry

/-- `universal_trivial_group`: For G={1}, R(G,d)=Z for d≥1. -/
example (d : ℕ) (hd : 0 < d) : Nonempty (CayleyHamilton.universalAlgebra Unit d ≃+* ℤ) := sorry

/-- `universal_matrix_specialization`: the specialized universal law at φ has split,
absolutely irreducible residue, so its CH quotient is M_d(A). -/
example {G : Type} [Group G] [HenselianLocalRing A] (d : ℕ) (hd : 0 < d)
    (φ : Determinant.coordinateRing ℤ (MonoidAlgebra ℤ G) d →ₐ[ℤ] A)
    (hSplit : (CayleyHamilton.universalSpecialization d φ).residual.IsSplit)
    (hIrr : (CayleyHamilton.universalSpecialization d φ).residual.IsAbsolutelyIrreducible) :
    Nonempty (CayleyHamilton.universalAlgebra_baseChange d φ ≃ₐ[A]
      Matrix (Fin d) (Fin d) A) := sorry

/-- `reductive_universal_trivial`: For the trivial target group H, B_H^Γ=O. -/
example {G : Type u} [Group G] : Nonempty (ReductivePseudocharacter.universalRing G (SuggestedFixtures.trivialCoordinates A) ≃ₐ[A] A) := sorry

/-- `reductive_universal_rank_one`: For H=GL₁ and Γ=Z, B_H^Γ=O[t,t⁻¹]. -/
example : Nonempty (ReductivePseudocharacter.universalRing (Multiplicative ℤ) (SuggestedFixtures.torusCoordinates ℤ) ≃ₐ[ℤ] LaurentPolynomial ℤ) := sorry

/-- Omitted hypothesis: C and eval are the GL_d simultaneous-conjugation invariant coordinate input supplied by LP3.
`reductive_universal_gln`: For H=GL_d, invariant-word evaluations give the universal determinant ring via the EM23 all-ring comparison. -/
example {G : Type u} [Group G] (C : InvariantCoordinateInput A) : Nonempty (ReductivePseudocharacter.universalRing G C ≃ₐ[A] Determinant.coordinateRing A (MonoidAlgebra A G) d) := sorry

/-- `formal_ring_no_generators`: With no matrices or relation variables, R=Z. -/
example : Nonempty (IntegralRibet.formalRing 0 0 ∅ ≃ₐ[ℤ] ℤ) := sorry

/-- `formal_ring_one_free`: With one matrix and no v₀ constraint, R=Z[a,b,c,d] apart from R₀ variables. -/
example : Nonempty (IntegralRibet.formalRing 0 1 ∅ ≃ₐ[ℤ] MvPolynomial (Fin 4) ℤ) := sorry

/-- `formal_ring_triangular`: Imposing b=0 gives Z[a,c,d], whose lower-Borel torus fixes a,d and weights c. -/
example : Nonempty (IntegralRibet.formalRing 0 1 {0} ≃ₐ[ℤ] MvPolynomial (Fin 3) ℤ) := sorry

/-- `relation_empty`: With no selected relation rows or local pairs, J=J′=0. -/
example : IntegralRibet.relationIdeal (Fin.elim0 : Fin 0 → Matrix (Fin 2) (Fin 2) A)=⊥ ∧ IntegralRibet.upperRelationIdeal (Fin.elim0 : Fin 0 → Matrix (Fin 2) (Fin 2) A)=⊥ := sorry

/-- `relation_linear_row`: For ε₁X₁+ε₂X₂, J has four scalar coefficients and J′ is (ε₁b₁+ε₂b₂). -/
example (ε₁ ε₂ : A) (X Y : Matrix (Fin 2) (Fin 2) A) : IntegralRibet.upperRelationIdeal (fun _ : Fin 1 ↦ ε₁ • X+ε₂ • Y)=Ideal.span {ε₁*X 0 1+ε₂*Y 0 1} := sorry

/-- `relation_pair_sign`: B_στ=−B_τσ and D_στ=A_τσ; in characteristic two the alternating relation still has B_σσ=0. -/
example (X Y : Matrix (Fin 2) (Fin 2) A) (x y : A) : IntegralRibet.localRelationMatrix X Y x y 0 1= -IntegralRibet.localRelationMatrix Y X y x 0 1 ∧ IntegralRibet.localRelationMatrix X Y x y 1 1=IntegralRibet.localRelationMatrix Y X y x 0 0 ∧ IntegralRibet.localRelationMatrix X X x x 0 1=0 := sorry

/-- `invariant_one_matrix`: Before triangular constraints, invariants of one 2×2 matrix are generated by a+d and ad−bc. -/
example (X : Matrix (Fin 2) (Fin 2) A) : IntegralRibet.invariantSubring (Fin.elim0 : Fin 0 → A) (fun _ : Fin 1 ↦ X) ∅=Algebra.adjoin ℤ {Matrix.trace X,X.det} := sorry

/-- `invariant_triangular_matrix`: With b=0 the Borel invariants are Z[a,d]. -/
example (a c e : A) : IntegralRibet.invariantSubring (Fin.elim0 : Fin 0 → A) (fun _ : Fin 1 ↦ !![a,0;c,e]) {0}=Algebra.adjoin ℤ {a,e} := sorry

/-- `invariant_trace_insufficient`: Over F₂, scalar matrices have trace zero but determinant a²; the determinant generator cannot be omitted. -/
example (a : ZMod 2) : Matrix.trace (a • (1 : Matrix (Fin 2) (Fin 2) (ZMod 2)))=0 ∧ (a • (1 : Matrix (Fin 2) (Fin 2) (ZMod 2))).det=a^2 := sorry

/-- `br_identity`: For f=id:R²→R², the complex is the exact two-term identity complex. -/
example : ∀ i : ℕ, Limits.IsZero ((BuchsbaumRim.moduleComplex (LinearMap.id : (Fin 2 → A) →ₗ[A] (Fin 2 → A))).homology i) := sorry

/-- `br_zero_map`: For f=0:R³→R², H₁(BR(f))=R³, so it is not exact unless R is zero. -/
example : Nonempty ((BuchsbaumRim.moduleComplex (0 : (Fin 3 → A) →ₗ[A] (Fin 2 → A))).homology 1 ≅ ModuleCat.of A (Fin 3 → A)) := sorry

/-- `br_two_column_syzygy`: For columns (b_i,b′_i), d₂ on e₁∧e₂∧e₃ is r₁₂e₃+r₂₃e₁+r₃₁e₂, and f(d₂)=0. -/
example (b c : Fin 3 → A) :
    let f : (Fin 3 → A) →ₗ[A] (Fin 2 → A) :=
      { toFun := fun x i ↦ ∑ j, (if i=0 then b j else c j)*x j
        map_add' := sorry
        map_smul' := sorry }
    let z : Fin 3 → A := ![b 1*c 2-b 2*c 1,b 2*c 0-b 0*c 2,b 0*c 1-b 1*c 0]
    (BuchsbaumRim.moduleComplex_X_one f).hom.hom
      ((BuchsbaumRim.moduleComplex f).d 2 1 |>.hom
        ((BuchsbaumRim.moduleComplex_X_two_rank_two f).inv.hom
          (exteriorPower.ιMulti A 3 (fun i ↦ Pi.single i 1))))=z ∧ f z=0 := sorry

/-- `detbr_rank_one`: For m=1 it equals the usual Koszul complex, including its integral signs. -/
example (n : ℕ) (f : (Fin n → A) →ₗ[A] (Fin 1 → A)) : Nonempty (BuchsbaumRim.determinantalComplex f ≅ BuchsbaumRim.moduleComplex f) := sorry

/-- `detbr_square`: For f:R²→R², the complex is R --det(f)→ R in degrees 1,0. -/
example (f : (Fin 2 → A) →ₗ[A] (Fin 2 → A)) :
    ∃ (e₀ : (BuchsbaumRim.determinantalComplex f).X 0 ≅ ModuleCat.of A A)
      (e₁ : (BuchsbaumRim.determinantalComplex f).X 1 ≅ ModuleCat.of A A),
      e₁.inv ≫ (BuchsbaumRim.determinantalComplex f).d 1 0 ≫ e₀.hom=
        ModuleCat.ofHom (Matrix.det (fun i j ↦ f (Pi.single j 1) i) • (LinearMap.id : A →ₗ[A] A)) ∧
      ∀ k : ℕ, 2 ≤ k → Limits.IsZero ((BuchsbaumRim.determinantalComplex f).X k) := sorry

/-- `detbr_generic_two_three`: For a generic 2×3 matrix, d₁ has generators r₁₂,r₁₃,r₂₃ and d₂ has the two column syzygies; no division by 2 occurs. -/
example (f : (Fin 3 → A) →ₗ[A] (Fin 2 → A)) :
    let r : Fin 3 → A :=
      ![f (Pi.single 0 1) 0*f (Pi.single 1 1) 1-f (Pi.single 1 1) 0*f (Pi.single 0 1) 1,
        f (Pi.single 0 1) 0*f (Pi.single 2 1) 1-f (Pi.single 2 1) 0*f (Pi.single 0 1) 1,
        f (Pi.single 1 1) 0*f (Pi.single 2 1) 1-f (Pi.single 2 1) 0*f (Pi.single 1 1) 1]
    let d₁ : (Fin 3 → A) →ₗ[A] A :=
      { toFun := fun x ↦ ∑ i, r i*x i
        map_add' := sorry
        map_smul' := sorry }
    let d₂ : (Fin 2 → A) →ₗ[A] (Fin 3 → A) :=
      { toFun := fun x ↦ ∑ i, x i • ![f (Pi.single 2 1) i,-f (Pi.single 1 1) i,f (Pi.single 0 1) i]
        map_add' := sorry
        map_smul' := sorry }
    ∃ (e₀ : (BuchsbaumRim.determinantalComplex f).X 0 ≅ ModuleCat.of A A)
      (e₁ : (BuchsbaumRim.determinantalComplex f).X 1 ≅ ModuleCat.of A (Fin 3 → A))
      (e₂ : (BuchsbaumRim.determinantalComplex f).X 2 ≅ ModuleCat.of A (Fin 2 → A)),
      e₁.inv ≫ (BuchsbaumRim.determinantalComplex f).d 1 0 ≫ e₀.hom=ModuleCat.ofHom d₁ ∧
      e₂.inv ≫ (BuchsbaumRim.determinantalComplex f).d 2 1 ≫ e₁.hom=ModuleCat.ofHom d₂ ∧
      ∀ k : ℕ, 3 ≤ k → Limits.IsZero ((BuchsbaumRim.determinantalComplex f).X k) := sorry

/-- `br_regular_identity`: Every ordered identity square matrix is regular even when its cokernel is zero. -/
example (m : ℕ) : BuchsbaumRim.IsRegular (LinearMap.id : (Fin m → A) →ₗ[A] (Fin m → A)) := sorry

/-- `br_regular_square`: A square matrix is regular iff its underlying R-linear map is injective; no domain assumption is made. -/
example (m : ℕ) (f : (Fin m → A) →ₗ[A] (Fin m → A)) : BuchsbaumRim.IsRegular f ↔ Function.Injective f := sorry

/-- `br_regular_rank_one`: Multiplication by 2 on Z is regular; multiplication by 2 on Z/4 is not. -/
example : BuchsbaumRim.IsRegular (2 • (LinearMap.id : (Fin 1 → ℤ) →ₗ[ℤ] (Fin 1 → ℤ))) ∧ ¬ BuchsbaumRim.IsRegular (2 • (LinearMap.id : (Fin 1 → ZMod 4) →ₗ[ZMod 4] (Fin 1 → ZMod 4))) := sorry

/-- `upper_complex_empty`: With no selected relation generators or local pairs C=R in degree zero. -/
example : ∀ k : ℕ, 0 < k → Limits.IsZero ((IntegralRibet.upperRelationComplex (Fin.elim0 : Fin 0 → A) (Fin.elim0 : Fin 0 → ℕ) (by intro t; exact t.elim0)).X k) := sorry

/-- `upper_complex_linear`: With only one linear relation L it is the two-term Koszul complex R --L→ R. -/
example (a : A) : Nonempty ((IntegralRibet.upperRelationComplex (fun _ : Fin 1 ↦ a) (Fin.elim0 : Fin 0 → ℕ) (by intro t; exact t.elim0)).homology 0 ≅ ModuleCat.of A (A ⧸ Ideal.span {a})) := sorry

/-- `upper_complex_two_local_rows`: With two local rows and no linear relations it is R --(b₁b′₂−b₂b′₁)→ R after the determinant-line twist. -/
example (f : (Fin 2 → A) →ₗ[A] (Fin 2 → A)) : Nonempty ((IntegralRibet.upperRelationComplex (Fin.elim0 : Fin 0 → A) (fun _ : Fin 1 ↦ 2) (fun _ ↦ f)).homology 0 ≅ ModuleCat.of A (A ⧸ BuchsbaumRim.maximalMinorIdeal f)) := sorry

/-- `full_complex_empty`: Without relation blocks, D=R in degree zero and J=0. -/
example : ∀ k : ℕ, 0 < k → Limits.IsZero ((IntegralRibet.fullRelationComplex (Fin.elim0 : Fin 0 → Matrix (Fin 2) (Fin 2) A) (Fin.elim0 : Fin 0 → Option ℕ)).X k) := sorry

/-- `full_complex_one_linear`: A single matrix relation has D₁=A⊗R→R with its four entries, and no repeated-block exterior terms. -/
example (X : Matrix (Fin 2) (Fin 2) A) :
    let C := IntegralRibet.fullRelationComplex (fun _ : Fin 1 ↦ X) (fun _ ↦ none)
    let d₁ : Matrix (Fin 2) (Fin 2) A →ₗ[A] A :=
      { toFun := fun Z ↦ ∑ i, ∑ j, X i j*Z i j
        map_add' := sorry
        map_smul' := sorry }
    ∃ e₁ : C.X 1 ≅ ModuleCat.of A (Matrix (Fin 2) (Fin 2) A),
      e₁.inv ≫ C.d 1 0 ≫ (IntegralRibet.fullRelationComplex_X_zero
        (fun _ : Fin 1 ↦ X) (fun _ ↦ none)).hom=ModuleCat.ofHom d₁ ∧
      ∀ k : ℕ, 2 ≤ k → Limits.IsZero (C.X k) := sorry

/-- `full_complex_local_pair`: For two distinct local blocks the four basis wedges give all four local relation entries; wedges from one block alone are excluded. -/
example (U V : Matrix (Fin 2) (Fin 2) A) (x y : A) :
    let X := IntegralRibet.localRelationMatrix U V x y
    let C := IntegralRibet.fullRelationComplex (fun _ : Fin 1 ↦ X) (fun _ ↦ some 0)
    let d₁ : Matrix (Fin 2) (Fin 2) A →ₗ[A] A :=
      { toFun := fun Z ↦ ∑ i, ∑ j, X i j*Z i j
        map_add' := sorry
        map_smul' := sorry }
    ∃ e₁ : C.X 1 ≅ ModuleCat.of A (Matrix (Fin 2) (Fin 2) A),
      e₁.inv ≫ C.d 1 0 ≫ (IntegralRibet.fullRelationComplex_X_zero
        (fun _ : Fin 1 ↦ X) (fun _ ↦ some 0)).hom=ModuleCat.ofHom d₁ ∧
      ∀ k : ℕ, 2 ≤ k → Limits.IsZero (C.X k) := sorry

/-- `initial_scalar_zero`: For ρ=ψI₂ and χ=ψ, M₀=0. -/
example {G : Type u} [Group G] (ψ : G →* Aˣ) : Limits.IsZero (IntegralRibet.initialModule (SuggestedFixtures.scalarRepresentation ψ) ψ ψ) := sorry

/-- `initial_upper_unipotent`: For the integral upper-unipotent representation of Z and χ=ψ=1, M₀≅Z. -/
example : Nonempty (IntegralRibet.initialModule SuggestedFixtures.upperUnipotent 1 1 ≃ₗ[ℤ] ℤ) := sorry

/-- `initial_universal_quotient`: An A-linear map Δψ→L factors uniquely through M₀ iff it annihilates every product (ρ(t)−χ(t))(ρ(u)−ψ(u)). -/
example {B G L : Type u} [CommRing B] [Algebra A B] [Group G] [AddCommGroup L] [Module A L] (ρ : MonoidAlgebra A G →ₐ[A] Matrix (Fin 2) (Fin 2) B) (χ ψ : G →* Aˣ) (f : IntegralRibet.differenceModule ρ ψ →ₗ[A] L) : (∃! f₀ : IntegralRibet.initialModule ρ χ ψ →ₗ[A] L, f₀.comp (IntegralRibet.initialModule_mk ρ χ ψ)=f) ↔ IntegralRibet.productInside ρ χ ψ ≤ f.ker := sorry

/-- `chain_image_zero`: For the zero complex the chain image is the zero ring. -/
example (C : CochainComplex (ModuleCat.{u} A) ℤ) (hC : Limits.IsZero C) : Subsingleton (HeckeImage.chain C (Algebra.ofId A (End C))) := sorry

/-- `chain_image_scalar`: The scalar action on A in degree zero has image A. -/
example : Nonempty (HeckeImage.chain (SuggestedFixtures.degreeZeroChain A) (SuggestedFixtures.scalarChain A) ≃ₐ[A] A) := sorry

/-- `chain_image_contractible`: For C=(A --1→ A), the identity chain map is nonzero if A≠0 although its homotopy and cohomology images are zero. -/
example [Nontrivial A] :
    (1 : End (SuggestedFixtures.contractible A))≠0 ∧
    Limits.IsZero ((HomotopyCategory.quotient (ModuleCat.{u} A) (.up ℤ)).obj (SuggestedFixtures.contractible A)) := sorry

/-- `homotopy_image_contractible`: For a contractible complex the homotopy image is the zero ring. -/
example : Subsingleton (HeckeImage.homotopy ((HomotopyCategory.quotient (ModuleCat.{u} A) (.up ℤ)).obj (SuggestedFixtures.contractible A)) (Algebra.ofId A _)) := sorry

/-- `homotopy_image_scalar`: For A in degree zero, the scalar image is A. -/
example : Nonempty (HeckeImage.homotopy (SuggestedFixtures.degreeZeroHomotopy A) (SuggestedFixtures.scalarHomotopy A) ≃ₐ[A] A) := sorry

/-- `homotopy_image_homotopy`: Chain-homotopic actions of each h give the same homotopy-image action; equal cohomology alone does not imply this. -/
example {H : Type u} [CommRing H] [Algebra A H]
    (C : CochainComplex (ModuleCat.{u} A) ℤ) (α β : H →ₐ[A] End C)
    (h : ∀ x : H, Nonempty (Homotopy (α x) (β x))) :
    ∀ x, (HomotopyCategory.quotient (ModuleCat.{u} A) (.up ℤ)).map (α x)=
      (HomotopyCategory.quotient (ModuleCat.{u} A) (.up ℤ)).map (β x) := sorry

/-- `cohomology_image_acyclic`: Every acyclic complex has zero cohomology image. -/
example (C : DerivedCategory (ModuleCat.{u} A)) (hC : ∀ i : ℤ, Limits.IsZero ((DerivedCategory.homologyFunctor (ModuleCat.{u} A) i).obj C)) : Subsingleton (HeckeImage.cohomology C (Algebra.ofId A (End C))) := sorry

/-- `cohomology_image_scalar`: For A in degree zero the scalar image is A. -/
example : Nonempty (HeckeImage.cohomology (SuggestedFixtures.degreeZero A) (SuggestedFixtures.scalarDerived A) ≃ₐ[A] A) := sorry

/-- `cohomology_image_ghost`: The nonzero off-diagonal Ext¹ ghost in the two-degree example maps to zero in the cohomology action. -/
example (C : DerivedCategory (ModuleCat.{u} A)) (f : End C) (hf : f∈HeckeImage.ghostIdeal C) : HeckeImage.cohomologyAction C f=0 := sorry

/-- `gsp4_reverse_constant`: The coefficient of X⁰ is 1 and of X⁴ is q⁶T₀². -/
example (q t₀ t₁ t₂ : A) : (Spherical.gsp4ReversedSpinPolynomial q t₀ t₁ t₂).coeff 0=1 ∧ (Spherical.gsp4ReversedSpinPolynomial q t₀ t₁ t₂).coeff 4=q^6*t₀^2 := sorry

/-- `gsp4_reverse_indices`: Pilloni’s T_(ℓ,2) is the coefficient paired with X¹, matching CG20’s T₁. -/
example (q t₀ t₁ t₂ : A) : (Spherical.gsp4ReversedSpinPolynomial q t₀ t₁ t₂).coeff 1= -t₁ := sorry

/-- `gsp4_reverse_not_monic_inverse`: For q=2,T₀=1, the leading coefficient is 64; Q_rev is not the monic characteristic polynomial of r⁻¹. -/
example : (Spherical.gsp4ReversedSpinPolynomial (2 : ℤ) 1 0 0).coeff 4=64 ∧ ¬ (Spherical.gsp4ReversedSpinPolynomial (2 : ℤ) 1 0 0).Monic := sorry

/-- `generic_representation_degree_one`: For E=A,d=1,D=id, A_gen≅A. -/
example : Nonempty (CayleyHamilton.genericRepresentationRing ((Determinant.dimOneEquiv).symm (AlgHom.id A A)) (by sorry) ≃ₐ[A] A) := sorry

/-- `generic_representation_matrix`: For E=M_d(A),D=det, the identity representation gives a specialization A_gen→A. -/
example (d : ℕ) : Nonempty (CayleyHamilton.genericRepresentationRing (Determinant.ofMatrix (AlgHom.id A (Matrix (Fin d) (Fin d) A))) (by sorry) →ₐ[A] A) := sorry

/-- `generic_representation_not_finite_module`: For d=2 and E=A×A with D(a,b)=ab, complementary rank-one idempotent matrices vary; over a field their coordinate ring has positive dimension and is not finite as a vector space. -/
example : ¬ Module.Finite ℚ (CayleyHamilton.genericRepresentationRing (SuggestedFixtures.productDeterminant ℚ) (by sorry)) := sorry

end TauCeti.SuggestedTest

namespace TauCeti
open CategoryTheory
open scoped ModuleCat.Algebra
variable {A R : Type u} [CommRing A] [Ring R] [Algebra A R]

/-- `residual_ordered_projectors`: ordered residual constituents distinguish their
own diagonal idempotent from every other block. -/
example [IsLocalRing A] {s : ℕ} {size : Fin s → ℕ} (E : GMA.Data A R s size)
    (res : GMA.ResidualData E) (i j : Fin s) (hij : i ≠ j) :
    Matrix.charpoly (res.representation i (1 ⊗ₜ[A] E.idempotent i)) = (X-1)^(size i) ∧
    Matrix.charpoly (res.representation i (1 ⊗ₜ[A] E.idempotent j)) = X^(size i) := sorry

/-- `residual_triangular_product`: full determinant and prescribed diagonal factors
agree on triangular matrices, including the nonzero upper off-diagonal entry. -/
example {k : Type u} [Field k] (a b c : k) :
    let E := SuggestedFixtures.orderGMA k ⊥ false
    let res := SuggestedFixtures.triangularResidualData k
    let x : SuggestedFixtures.matrixOrder k ⊥ false := ⟨!![a,b;0,c], by sorry⟩
    res.representation 0 (1 ⊗ₜ[k] x) 0 0=IsLocalRing.residue k a ∧
    res.representation 1 (1 ⊗ₜ[k] x) 0 0=IsLocalRing.residue k c ∧
    (GMA.determinant E).residual.eval (1 ⊗ₜ[k] x)=IsLocalRing.residue k (a*c) := sorry

/-- `residual_repeated_rejected`: two isomorphic labelled constituents cannot be
ResidualData, even if their product has the requested total degree. -/
example [IsLocalRing A] {s : ℕ} {size : Fin s → ℕ} (E : GMA.Data A R s size)
    (res : GMA.ResidualData E) (i j : Fin s) (hij : i ≠ j)
    (T : (Fin (size j) → IsLocalRing.ResidueField A) ≃ₗ[IsLocalRing.ResidueField A]
      (Fin (size i) → IsLocalRing.ResidueField A))
    (hT : ∀ r x, T ((res.representation j r).mulVec x)=
      (res.representation i r).mulVec (T x)) : False := sorry

/-- `quotient_constituent_diagonal`: the two actual triangular constituents act by
their indicated diagonal entries, after the same coefficient quotient. -/
example (i : Fin 2) (r : SuggestedFixtures.matrixOrder A ⊥ false) :
    GMA.quotientRepresentation (SuggestedFixtures.orderGMA A ⊥ false) id i
      (by simp) ⊥ (by sorry) (1 ⊗ₜ[A] r) 0 0 =
        Ideal.Quotient.mk (⊥ : Ideal A) (r.val i i) := sorry

/-- `quotient_constituent_nonzero`: the prescribed one-dimensional constituents
cannot be replaced by zero modules. -/
example {k : Type u} [Field k] (i : Fin 2) :
    ¬ Limits.IsZero (SuggestedFixtures.upperConstituent k i) := sorry

/-- `quotient_triangular_ext_orientation`: for the upper triangular algebra the
extension of the second diagonal character by the first is one-dimensional. -/
example {k : Type u} [Field k] :
    Nonempty (Abelian.Ext (SuggestedFixtures.upperConstituent k 1)
      (SuggestedFixtures.upperConstituent k 0) 1 ≃ₗ[k] k) := sorry

/-- `reducibility_prescribed_order`: the two factors of the triangular determinant
are uniquely fixed by the ordered residual reductions, even in characteristic two. -/
example {k : Type u} [Field k] :
    let E := SuggestedFixtures.orderGMA k ⊥ false
    ∃! F : Determinant (k ⧸ (⊥ : Ideal k)) ((k ⧸ (⊥ : Ideal k)) ⊗[k]
        SuggestedFixtures.matrixOrder k ⊥ false) 1 ×
      Determinant (k ⧸ (⊥ : Ideal k)) ((k ⧸ (⊥ : Ideal k)) ⊗[k]
        SuggestedFixtures.matrixOrder k ⊥ false) 1,
      ((GMA.determinant E).baseChange (k ⧸ (⊥ : Ideal k))).toLaw=(F.1.mul F.2).toLaw ∧
      GMA.residualFactor ⊥ (by sorry) F.1=
        Determinant.ofMatrix ((SuggestedFixtures.triangularResidualData k).representation 0) ∧
      GMA.residualFactor ⊥ (by sorry) F.2=
        Determinant.ofMatrix ((SuggestedFixtures.triangularResidualData k).representation 1) := sorry

/-- `ribet_lattice_oriented_iwahori`: on the standard lattice the upper-unipotent
unit witnesses the nonsplit extension of ψ (second diagonal) by χ (first). -/
example [IsDomain A] [IsDiscreteValuationRing A]
    (hdistinct : ∃ u : Aˣ, IsLocalRing.residue A (u : A) ≠ 1) :
    let χ := SuggestedFixtures.iwahoriDiagonal A 0
    let ψ := SuggestedFixtures.iwahoriDiagonal A 1
    χ ≠ ψ ∧
    (∀ g : (SuggestedFixtures.matrixOrder A (IsLocalRing.maximalIdeal A) false)ˣ,
      IsLocalRing.residue A (g.val.val 1 0)=0) ∧
    ∀ v : IsLocalRing.ResidueField A, ∃ g :
        (SuggestedFixtures.matrixOrder A (IsLocalRing.maximalIdeal A) false)ˣ,
      IsLocalRing.residue A (g.val.val 0 1) ≠ ((ψ g : IsLocalRing.ResidueField A)-
        (χ g : IsLocalRing.ResidueField A))*v := sorry

/-- `ribet_lattice_unipotent_witness`: the witness has both diagonal characters 1
and upper entry 1, so no change of splitting can kill that upper entry. -/
example [IsLocalRing A] :
    let g := SuggestedFixtures.iwahoriUpperUnipotent A (IsLocalRing.maximalIdeal A)
    SuggestedFixtures.iwahoriDiagonal A 0 g=1 ∧
    SuggestedFixtures.iwahoriDiagonal A 1 g=1 ∧
    IsLocalRing.residue A (g.val.val 0 1)=1 := sorry

/-- `symplectic_zero_form_rejected`: the zero-form equation satisfies every
matrix representation, but zero cannot be a nondegenerate alternating form. -/
example [Nontrivial A] : ¬ IsUnit (0 : Matrix (Fin 4) (Fin 4) A) := sorry

/-- `symplectic_standard_form`: the usual J is alternating and invertible over
any coefficient ring, including characteristic two. -/
example :
    let J : Matrix (Fin 4) (Fin 4) A := !![0,0,1,0;0,0,0,1;-1,0,0,0;0,-1,0,0]
    IsUnit J ∧ ∀ x : Fin 4 → A, dotProduct x (J.mulVec x)=0 := sorry

/-- `local_quotient_identity_compatibility`: in rank one and with Ã=A, a compatible
local corner already reduces to the given global character, and identity conjugation
preserves every selected generic fiber. -/
example {G : Type u} [Group G] (H : Subgroup G)
    (ρ : G →* (Matrix (Fin 1) (Fin 1) A)ˣ) :
    ∃ localRep : H →* (Matrix (Fin 1) (Fin 1) A)ˣ,
      ∀ h : H, (localRep h : Matrix (Fin 1) (Fin 1) A).map (RingHom.id A)=
        (ρ h : Matrix (Fin 1) (Fin 1) A) := sorry

/-- `local_quotient_incompatible_character`: an arbitrary local matrix with entry 2
cannot lift the global trivial character through the identity quotient Q→Q. -/
example : (!![(2 : ℚ)].map (RingHom.id ℚ) : Matrix (Fin 1) (Fin 1) ℚ) ≠ 1 := sorry
end TauCeti
