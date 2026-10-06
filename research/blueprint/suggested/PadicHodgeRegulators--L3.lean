/-
This file is not the roadmap and is not exhaustive. The roadmap document is
 definitive. These signatures suggest Lean forms so contributors and reviewers
 converge on names and interfaces. The mathematical specification is the document.

COMPLETE TARGET-LEVEL PLAN, PARTIAL ARITHMETIC PROTOTYPE.
Mathlib 082e2d3; Tau Ceti f790474. Algebra checked with lean-check.
Every statement remains unproved; arithmetic contracts below are comments
until the genuine supplier carriers exist, under the roadmap public contract.
This file does not construct period rings, Wach modules, Iwasawa cohomology,
Mellin transforms, or a p-adic regulator. It states the algebraic LLZ core against
actual algebra maps, matrices, submodules, and coordinate equivalences. The
arithmetic instantiations are precise gaps in the packet, not placeholder fields.

Row coefficient vectors multiply matrices on the right. A new column of basis
vectors n' = U n changes the coefficient row by U inverse.
-/

import Mathlib.LinearAlgebra.Lagrange
import Mathlib.LinearAlgebra.Basis.VectorSpace
import Mathlib.LinearAlgebra.Matrix.ToLin
import Mathlib.LinearAlgebra.Matrix.Determinant.Basic
import Mathlib.LinearAlgebra.FiniteDimensional.Basic
import Mathlib.RingTheory.LocalRing.MaximalIdeal.Defs
import Mathlib.NumberTheory.Padics.MahlerBasis
import Mathlib.LinearAlgebra.TensorProduct.Basic

noncomputable section
open scoped BigOperators TensorProduct
open Matrix Polynomial Module

namespace TauCeti.PadicHodgeRegulators

section Euler
variable {E : Type*} [Field E] {d : ℕ}

-- PadicHodgeRegulators:L3/quadratic-frobenius-inverse
def quadraticFrobeniusInverse (a b : E) (Φ : Matrix (Fin d) (Fin d) E) :
    Matrix (Fin d) (Fin d) E := -b⁻¹ • (Φ + a • 1)

lemma quadraticFrobeniusInverse_formula (a b : E) (Φ : Matrix (Fin d) (Fin d) E) :
    quadraticFrobeniusInverse a b Φ = -b⁻¹ • (Φ + a • 1) := by sorry

-- PadicHodgeRegulators:L3/quadratic-frobenius-inverse-spec
lemma quadraticFrobeniusInverse_spec (a b : E) (Φ : Matrix (Fin d) (Fin d) E)
    (h : Φ * Φ + a • Φ + b • 1 = 0) (hb : b ≠ 0) :
    Φ * quadraticFrobeniusInverse a b Φ = 1 ∧
      quadraticFrobeniusInverse a b Φ * Φ = 1 := by sorry

lemma quadraticFrobeniusInverse_map {E' : Type*} [Field E'] (σ : E →+* E')
    (a b : E) (Φ : Matrix (Fin d) (Fin d) E) :
    (quadraticFrobeniusInverse a b Φ).map σ =
      quadraticFrobeniusInverse (σ a) (σ b) (Φ.map σ) := by sorry

-- TEST frobenius_scalar_two
example : quadraticFrobeniusInverse (-5 : ℚ) 6 (fun _ _ : Fin 1 => 2) =
    (fun _ _ : Fin 1 => (1 / 2 : ℚ)) := by sorry
-- TEST frobenius_scalar_minus_one
example : quadraticFrobeniusInverse (0 : ℚ) (-1) (fun _ _ : Fin 1 => -1) =
    (fun _ _ : Fin 1 => (-1 : ℚ)) := by sorry
-- TEST frobenius_singular_excluded
example : (0 : Matrix (Fin 1) (Fin 1) ℚ) * quadraticFrobeniusInverse 0 0 0 ≠ 1 := by sorry

-- PadicHodgeRegulators:L3/quadratic-euler-inverse
def quadraticEulerInverse (a b : E) (Φ : Matrix (Fin d) (Fin d) E) :
    Matrix (Fin d) (Fin d) E := (1 + a + b)⁻¹ • (Φ + (1 + a) • 1)

lemma quadraticEulerInverse_formula (a b : E) (Φ : Matrix (Fin d) (Fin d) E) :
    quadraticEulerInverse a b Φ = (1 + a + b)⁻¹ • (Φ + (1 + a) • 1) := by sorry

-- PadicHodgeRegulators:L3/quadratic-euler-inverse-spec
lemma quadraticEulerInverse_spec (a b : E) (Φ : Matrix (Fin d) (Fin d) E)
    (h : Φ * Φ + a • Φ + b • 1 = 0) (hs : 1 + a + b ≠ 0) :
    (1 - Φ) * quadraticEulerInverse a b Φ = 1 ∧
      quadraticEulerInverse a b Φ * (1 - Φ) = 1 := by sorry

lemma quadraticEulerInverse_map {E' : Type*} [Field E'] (σ : E →+* E')
    (a b : E) (Φ : Matrix (Fin d) (Fin d) E) :
    (quadraticEulerInverse a b Φ).map σ =
      quadraticEulerInverse (σ a) (σ b) (Φ.map σ) := by sorry

-- TEST euler_scalar_two
example : quadraticEulerInverse (-5 : ℚ) 6 (fun _ _ : Fin 1 => 2) =
    (fun _ _ : Fin 1 => (-1 : ℚ)) := by sorry
-- TEST euler_scalar_zero
example : quadraticEulerInverse (0 : ℚ) 0 (0 : Matrix (Fin 1) (Fin 1) ℚ) = 1 := by sorry
-- TEST euler_singular_excluded
example : (1 - (1 : Matrix (Fin 1) (Fin 1) ℚ)) * quadraticEulerInverse (-3) 2 1 ≠ 1 := by sorry

-- PadicHodgeRegulators:L3/quadratic-euler-product
theorem quadraticEulerProduct (p a b : E) (Φ : Matrix (Fin d) (Fin d) E)
    (h : Φ * Φ + a • Φ + b • 1 = 0) (hp : p ≠ 0) (hb : b ≠ 0)
    (hs : 1 + a + b ≠ 0) :
    quadraticEulerInverse a b Φ * (1 - p⁻¹ • quadraticFrobeniusInverse a b Φ) =
      (p * b * (1 + a + b))⁻¹ •
        ((1 + a + p * b) • Φ + (a * (1 + a + p * b) + b * (p - 1)) • 1) := by sorry
end Euler

section Constraints
variable {E R : Type*} [Field E] [CommRing R] [Algebra E R]
variable {d m : ℕ}

-- PadicHodgeRegulators:L4/evaluation-constraints
def evaluationConstraints (J : Finset (Fin m)) (ev : Fin m → R →ₐ[E] E)
    (V : Fin m → Submodule E (Fin d → E)) : Submodule R (Fin d → R) where
  carrier := {F | ∀ j ∈ J, (fun k => ev j (F k)) ∈ V j}
  zero_mem' := by sorry
  add_mem' := by sorry
  smul_mem' := by sorry

lemma evaluationConstraints_mem (J : Finset (Fin m)) (ev : Fin m → R →ₐ[E] E)
    (V : Fin m → Submodule E (Fin d → E)) (F : Fin d → R) :
    F ∈ evaluationConstraints J ev V ↔ ∀ j ∈ J, (fun k => ev j (F k)) ∈ V j := by sorry

lemma evaluationConstraints_empty (ev : Fin m → R →ₐ[E] E)
    (V : Fin m → Submodule E (Fin d → E)) : evaluationConstraints ∅ ev V = ⊤ := by sorry

lemma evaluationConstraints_antitone (J J' : Finset (Fin m)) (h : J ⊆ J')
    (ev : Fin m → R →ₐ[E] E) (V : Fin m → Submodule E (Fin d → E)) :
    evaluationConstraints J' ev V ≤ evaluationConstraints J ev V := by sorry

-- TEST constraints_none
example (ev : Fin 0 → R →ₐ[E] E) (V : Fin 0 → Submodule E (Fin d → E)) :
    evaluationConstraints Finset.univ ev V = ⊤ := by sorry
-- TEST constraints_zero_at_zero: real polynomial evaluation, not a chosen zero map.
example :
    (fun _ : Fin 1 => (1 : ℚ[X])) ∉
      evaluationConstraints {0} (fun _ : Fin 1 => Polynomial.aeval (0 : ℚ))
        (fun _ => (⊥ : Submodule ℚ (Fin 1 → ℚ))) ∧
    (fun _ : Fin 1 => (X : ℚ[X])) ∈
      evaluationConstraints {0} (fun _ : Fin 1 => Polynomial.aeval (0 : ℚ))
        (fun _ => (⊥ : Submodule ℚ (Fin 1 → ℚ))) := by sorry
-- TEST constraints_diagonal
example :
    (![1,1] : Fin 2 → ℚ[X]) ∈
      evaluationConstraints {0} (fun _ : Fin 1 => Polynomial.aeval (0 : ℚ))
        (fun _ => Submodule.span ℚ {(![1,1] : Fin 2 → ℚ)}) ∧
    (![1,0] : Fin 2 → ℚ[X]) ∉
      evaluationConstraints {0} (fun _ : Fin 1 => Polynomial.aeval (0 : ℚ))
        (fun _ => Submodule.span ℚ {(![1,1] : Fin 2 → ℚ)}) := by sorry

-- PadicHodgeRegulators:L4/transported-specialization
def transportedSpecialization (V : Submodule E (Fin d → E))
    (C : Matrix (Fin d) (Fin d) E) : Submodule E (Fin d → E) :=
  V.comap ((Matrix.vecMulBilin E E).flip C)

lemma transportedSpecialization_mem (V : Submodule E (Fin d → E))
    (C : Matrix (Fin d) (Fin d) E) (v : Fin d → E) :
    v ∈ transportedSpecialization V C ↔ v ᵥ* C ∈ V := by sorry

lemma transportedSpecialization_one (V : Submodule E (Fin d → E)) :
    transportedSpecialization V 1 = V := by sorry

lemma transportedSpecialization_comp (V : Submodule E (Fin d → E))
    (C D : Matrix (Fin d) (Fin d) E) :
    transportedSpecialization (transportedSpecialization V C) D =
      transportedSpecialization V (D * C) := by sorry

-- TEST transport_identity
example (V : Submodule E (Fin d → E)) : transportedSpecialization V 1 = V := by sorry
-- TEST transport_shear
example : transportedSpecialization (Submodule.span ℚ {(![1,0] : Fin 2 → ℚ)})
    (!![1,1;0,1] : Matrix (Fin 2) (Fin 2) ℚ) =
    Submodule.span ℚ {(![1,-1] : Fin 2 → ℚ)} := by sorry
-- TEST transport_singular
example : transportedSpecialization (⊥ : Submodule ℚ (Fin 2 → ℚ)) 0 = ⊤ := by sorry

-- PadicHodgeRegulators:L4/transport-dimension
lemma transportedSpecialization_finrank (V : Submodule E (Fin d → E))
    (C : (Matrix (Fin d) (Fin d) E)ˣ) :
    (∃ e : transportedSpecialization V (C : Matrix (Fin d) (Fin d) E) ≃ₗ[E] V,
      ∀ v, (e v : Fin d → E) = (v : Fin d → E) ᵥ* (C : Matrix (Fin d) (Fin d) E)) ∧
    Module.finrank E (transportedSpecialization V (C : Matrix (Fin d) (Fin d) E)) =
      Module.finrank E V := by sorry

variable [domain : IsDomain R]
variable (J : Finset (Fin m)) (t : R) (x : Fin m → E)
variable (ev : Fin m → R →ₐ[E] E) (V : Fin m → Submodule E (Fin d → E))
variable (hx : Function.Injective x) (hev : ∀ j, ev j t = x j)
variable (hq : ∀ j, t - algebraMap E R (x j) ≠ 0)
variable (hker : ∀ j f, ev j f = 0 ↔ t - algebraMap E R (x j) ∣ f)

-- PadicHodgeRegulators:L4/scalar-multiple-zeros
lemma divisibleByEvaluationProduct (hx : Function.Injective x) (hev : ∀ j, ev j t = x j)
    (hq : ∀ j, t - algebraMap E R (x j) ≠ 0)
    (hker : ∀ j f, ev j f = 0 ↔ t - algebraMap E R (x j) ∣ f) (f : R) :
    (∀ j ∈ J, ev j f = 0) ↔ (∏ j ∈ J, (t - algebraMap E R (x j))) ∣ f := by sorry

-- PadicHodgeRegulators:L4/single-constraint-basis
lemma singleConstraintBasisExists
    (hx : Function.Injective x) (hev : ∀ j, ev j t = x j)
    (hq : ∀ j, t - algebraMap E R (x j) ≠ 0)
    (hker : ∀ j f, ev j f = 0 ↔ t - algebraMap E R (x j) ∣ f) (j : Fin m) :
    ∃ b : Module.Basis (Fin d) R (evaluationConstraints {j} ev V),
      ∃ C : (Matrix (Fin d) (Fin d) E)ˣ,
        (∀ v : Fin d → E, v ∈ V j ↔
          ∀ k : Fin d, Module.finrank E (V j) ≤ k.val →
            (v ᵥ* (↑C⁻¹ : Matrix (Fin d) (Fin d) E)) k = 0) ∧
        (fun i k => (b i : Fin d → R) k) =
          Matrix.diagonal (fun i : Fin d =>
            if i.val < Module.finrank E (V j) then 1 else t - algebraMap E R (x j)) *
            (↑C : Matrix (Fin d) (Fin d) E).map (algebraMap E R) := by sorry

-- PadicHodgeRegulators:L4/unused-point-invertibility
lemma constraintBasisEvaluationInvertible (hx : Function.Injective x)
    (hev : ∀ j, ev j t = x j) (B : Matrix (Fin d) (Fin d) R)
    (ε : Rˣ) (n : Fin m → ℕ)
    (hdet : B.det = (ε : R) * ∏ i ∈ J, (t - algebraMap E R (x i)) ^ n i)
    (j : Fin m) (hj : j ∉ J) : IsUnit (B.map (ev j)) := by sorry

-- PadicHodgeRegulators:L4/constraint-basis
-- Include the section domain hypothesis even though it is absent from the result type.
include domain in
def constraintBasis (J : Finset (Fin m)) (t : R) (x : Fin m → E)
    (ev : Fin m → R →ₐ[E] E) (V : Fin m → Submodule E (Fin d → E))
    (hx : Function.Injective x) (hev : ∀ j, ev j t = x j)
    (hq : ∀ j, t - algebraMap E R (x j) ≠ 0)
    (hker : ∀ j f, ev j f = 0 ↔ t - algebraMap E R (x j) ∣ f) :
    Module.Basis (Fin d) R (evaluationConstraints J ev V) := by sorry

lemma constraintBasis_rows_mem (i : Fin d) :
    ((constraintBasis J t x ev V hx hev hq hker i) : Fin d → R) ∈
      evaluationConstraints J ev V := by sorry

lemma constraintBasis_expansion (F : evaluationConstraints J ev V) :
    ∃! c : Fin d → R,
      ∑ i, c i • constraintBasis J t x ev V hx hev hq hker i = F := by sorry

-- PadicHodgeRegulators:L4/constraint-determinant
theorem constraintBasis_determinant
    (hx : Function.Injective x) (hev : ∀ j, ev j t = x j)
    (hq : ∀ j, t - algebraMap E R (x j) ≠ 0)
    (hker : ∀ j f, ev j f = 0 ↔ t - algebraMap E R (x j) ∣ f)
    (b : Module.Basis (Fin d) R (evaluationConstraints J ev V)) :
    Associated (Matrix.det (fun i k => (b i : Fin d → R) k))
      (∏ j ∈ J, (t - algebraMap E R (x j)) ^ (d - Module.finrank E (V j))) := by sorry

-- TEST basis_single_zero_condition
example : Function.Injective (fun f : ℚ[X] => X * f) ∧
    (∀ f : ℚ[X], f.eval 0 = 0 ↔ ∃ g, f = X * g) := by sorry
-- TEST basis_two_zero_conditions
example (f : ℚ[X]) : (f.eval 0 = 0 ∧ f.eval 5 = 0) ↔
    ∃! g : ℚ[X], f = (X * (X - C 5)) * g := by sorry
-- TEST basis_two_coordinates
example (F G : ℚ[X]) : (G.eval 0 = 0 ∧ F.eval 5 = 0) ↔
    ∃! c : Fin 2 → ℚ[X], F = c 0 * (X - C 5) ∧ G = c 1 * X := by sorry

attribute [local instance] Classical.propDecidable

-- PadicHodgeRegulators:L4/projection-generator
def projectionGenerator (k : Fin d) : R := by
  classical
  exact ∏ j ∈ J.filter (fun j => ∀ v ∈ V j, v k = 0), (t - algebraMap E R (x j))

lemma projectionGenerator_formula (k : Fin d) :
    projectionGenerator J t x V k =
      ∏ j ∈ J.filter (fun j => ∀ v ∈ V j, v k = 0), (t - algebraMap E R (x j)) := by
  classical
  sorry

lemma projectionGenerator_empty (k : Fin d)
    (h : ∀ j ∈ J, ∃ v ∈ V j, v k ≠ 0) : projectionGenerator J t x V k = 1 := by sorry

lemma projectionGenerator_eval (hx : Function.Injective x) (hev : ∀ j, ev j t = x j)
    (k : Fin d) (j : Fin m) (hj : j ∈ J) :
    ev j (projectionGenerator J t x V k) = 0 ↔ ∀ v ∈ V j, v k = 0 := by sorry

-- TEST projection_no_constraints
example (k : Fin d) : projectionGenerator (R := R) ∅ t x V k = 1 := by sorry
-- TEST projection_all_zero
example : projectionGenerator (R := ℚ[X]) Finset.univ X (![0,5] : Fin 2 → ℚ)
    (fun _ => (⊥ : Submodule ℚ (Fin 1 → ℚ))) 0 = X * (X - C 5) := by sorry
-- TEST projection_mixed
example :
    let V : Fin 2 → Submodule ℚ (Fin 2 → ℚ) :=
      ![Submodule.span ℚ {![(1:ℚ),0]}, Submodule.span ℚ {![0,(1:ℚ)]}]
    projectionGenerator (R := ℚ[X]) Finset.univ X (![0,5] : Fin 2 → ℚ) V 0 = X - C 5 ∧
    projectionGenerator (R := ℚ[X]) Finset.univ X (![0,5] : Fin 2 → ℚ) V 1 = X := by sorry

-- PadicHodgeRegulators:L4/projection-witness
def projectionWitness (J : Finset (Fin m)) (t : R) (x : Fin m → E)
    (ev : Fin m → R →ₐ[E] E) (V : Fin m → Submodule E (Fin d → E))
    (hx : Function.Injective x) (hev : ∀ j, ev j t = x j)
    (hq : ∀ j, t - algebraMap E R (x j) ≠ 0)
    (hker : ∀ j f, ev j f = 0 ↔ t - algebraMap E R (x j) ∣ f) (k : Fin d) :
    evaluationConstraints J ev V := by sorry

lemma projectionWitness_coordinate (k : Fin d) :
    (projectionWitness J t x ev V hx hev hq hker k : Fin d → R) k =
      projectionGenerator J t x V k := by sorry

lemma projectionWitness_mem (k : Fin d) :
    (projectionWitness J t x ev V hx hev hq hker k : Fin d → R) ∈
      evaluationConstraints J ev V := by sorry

lemma projectionWitness_multiples (k : Fin d) (r : R) :
    let F : Fin d → R := projectionWitness J t x ev V hx hev hq hker k
    r • F ∈ evaluationConstraints J ev V ∧ (r • F) k = r * projectionGenerator J t x V k := by sorry

-- TEST witness_empty
example (k : Fin d) : ∃ F ∈ evaluationConstraints ∅ ev V, F k = 1 := by sorry
-- TEST witness_diagonal
example : ∃ F ∈ evaluationConstraints {0} (fun _ : Fin 1 => Polynomial.aeval (0 : ℚ))
    (fun _ => Submodule.span ℚ {(![1,1] : Fin 2 → ℚ)}), F 0 = (1 : ℚ[X]) := by sorry
-- TEST witness_integral_denominators (rational computation)
example : Lagrange.interpolate Finset.univ (![0,5] : Fin 2 → ℚ) (![0,1] : Fin 2 → ℚ) =
    C (1 / 5 : ℚ) * X := by sorry

-- PadicHodgeRegulators:L4/coordinate-image
theorem coordinateImage_eq (hx : Function.Injective x) (hev : ∀ j, ev j t = x j)
    (hq : ∀ j, t - algebraMap E R (x j) ≠ 0)
    (hker : ∀ j f, ev j f = 0 ↔ t - algebraMap E R (x j) ∣ f) (k : Fin d) :
    {r : R | ∃ F ∈ evaluationConstraints J ev V, F k = r} =
      {r : R | projectionGenerator J t x V k ∣ r} := by sorry
end Constraints

section Coordinates
variable {R A H W Y : Type*} [CommRing R] [CommRing A] [Algebra R A]
variable [AddCommGroup H] [Module R H] [AddCommGroup W] [Module R W]
variable [AddCommGroup Y] [Module A Y] [Module R Y] [IsScalarTower R A Y]
variable {d : ℕ}

-- PadicHodgeRegulators:L4/coleman-coordinates
def colemanCoordinates (f : H →ₗ[R] W) (e : W ≃ₗ[R] (Fin d → R)) :
    H →ₗ[R] (Fin d → R) := e.toLinearMap.comp f

lemma colemanCoordinates_apply (f : H →ₗ[R] W) (e : W ≃ₗ[R] (Fin d → R)) (z : H) :
    colemanCoordinates f e z = e (f z) := by sorry

-- PadicHodgeRegulators:L4/coleman-reconstruction
lemma colemanCoordinates_reconstruct (f : H →ₗ[R] W) (e : W ≃ₗ[R] (Fin d → R)) (z : H) :
    e.symm (colemanCoordinates f e z) = f z := by sorry

lemma colemanCoordinates_precomp {H' : Type*} [AddCommGroup H'] [Module R H']
    (f : H →ₗ[R] W) (e : W ≃ₗ[R] (Fin d → R)) (g : H' →ₗ[R] H) :
    colemanCoordinates (f.comp g) e = (colemanCoordinates f e).comp g := by sorry

-- TEST coleman_zero
example (e : W ≃ₗ[R] (Fin d → R)) : colemanCoordinates (0 : H →ₗ[R] W) e = 0 := by sorry
-- TEST coleman_standard
example : colemanCoordinates (LinearMap.id : (Fin d → R) →ₗ[R] (Fin d → R))
    (LinearEquiv.refl R (Fin d → R)) = LinearMap.id := by sorry
-- TEST coleman_shear_inverse
example : (![1,0] : Fin 2 → ℚ) ᵥ* (!![1,-1;0,1] : Matrix (Fin 2) (Fin 2) ℚ) = ![1,-1] ∧
    (![1,0] : Fin 2 → ℚ) ᵥ* (!![1,1;0,1] : Matrix (Fin 2) (Fin 2) ℚ) ≠ ![1,-1] := by sorry

-- PadicHodgeRegulators:L4/logarithmic-matrix
def logarithmicMatrix (e : W ≃ₗ[R] (Fin d → R)) (b : Y ≃ₗ[A] (Fin d → A))
    (j : W →ₗ[R] Y) : Matrix (Fin d) (Fin d) A :=
  fun i k => b (j (e.symm (Pi.single i 1))) k

lemma logarithmicMatrix_entry (e : W ≃ₗ[R] (Fin d → R))
    (b : Y ≃ₗ[A] (Fin d → A)) (j : W →ₗ[R] Y) (i k : Fin d) :
    logarithmicMatrix e b j i k = b (j (e.symm (Pi.single i 1))) k := by sorry

-- PadicHodgeRegulators:L4/matrix-expansion
lemma logarithmicMatrix_expansion (e : W ≃ₗ[R] (Fin d → R))
    (b : Y ≃ₗ[A] (Fin d → A)) (j : W →ₗ[R] Y) (w : W) :
    b (j w) = (fun i => algebraMap R A (e w i)) ᵥ* logarithmicMatrix e b j := by sorry

lemma logarithmicMatrix_zero (e : W ≃ₗ[R] (Fin d → R)) (b : Y ≃ₗ[A] (Fin d → A)) :
    logarithmicMatrix e b (0 : W →ₗ[R] Y) = 0 := by sorry

-- TEST matrix_identity
example : logarithmicMatrix (LinearEquiv.refl R (Fin d → R))
    (LinearEquiv.refl R (Fin d → R)) LinearMap.id = 1 := by sorry
-- TEST matrix_non_diagonal
example : logarithmicMatrix (LinearEquiv.refl ℚ (Fin 2 → ℚ))
    (LinearEquiv.refl ℚ (Fin 2 → ℚ))
    ((Matrix.vecMulBilin ℚ ℚ).flip (!![1,2;3,4] : Matrix (Fin 2) (Fin 2) ℚ)) =
      !![1,2;3,4] := by sorry
-- TEST matrix_singular_inclusion
example : (logarithmicMatrix (LinearEquiv.refl ℚ (Fin 2 → ℚ))
    (LinearEquiv.refl ℚ (Fin 2 → ℚ))
    ((Matrix.vecMulBilin ℚ ℚ).flip (!![1,0;0,0] : Matrix (Fin 2) (Fin 2) ℚ))).det = 0 := by sorry

-- PadicHodgeRegulators:L4/regulator-coordinate-decomposition
theorem regulatorCoordinateDecomposition (f : H →ₗ[R] W) (e : W ≃ₗ[R] (Fin d → R))
    (b : Y ≃ₗ[A] (Fin d → A)) (j : W →ₗ[R] Y) (z : H) :
    b (j (f z)) = (fun i => algebraMap R A (colemanCoordinates f e z i)) ᵥ*
      logarithmicMatrix e b j := by sorry

-- PadicHodgeRegulators:L4/constant-basis-covariance
-- hU and hB specify changes between actual coordinate equivalences;
-- equivalently the columns of basis vectors satisfy n'=Un and nu'=Bnu.
theorem constantBasisCovariance
    (e e' : W ≃ₗ[R] (Fin d → R)) (b b' : Y ≃ₗ[A] (Fin d → A))
    (j : W →ₗ[R] Y) (U : (Matrix (Fin d) (Fin d) R)ˣ)
    (B : (Matrix (Fin d) (Fin d) A)ˣ)
    (hU : ∀ w, e w = e' w ᵥ* (↑U : Matrix (Fin d) (Fin d) R))
    (hB : ∀ y, b y = b' y ᵥ* (↑B : Matrix (Fin d) (Fin d) A)) :
    (∀ w, e' w = e w ᵥ* (↑U⁻¹ : Matrix (Fin d) (Fin d) R)) ∧
    logarithmicMatrix e' b' j =
      (↑U : Matrix (Fin d) (Fin d) R).map (algebraMap R A) *
        logarithmicMatrix e b j * (↑B⁻¹ : Matrix (Fin d) (Fin d) A) ∧
    (∀ w, (fun i => algebraMap R A (e' w i)) ᵥ* logarithmicMatrix e' b' j =
      ((fun i => algebraMap R A (e w i)) ᵥ* logarithmicMatrix e b j) ᵥ*
        (↑B⁻¹ : Matrix (Fin d) (Fin d) A)) := by sorry
end Coordinates

section Shear
variable {R : Type*} [CommRing R]

-- PadicHodgeRegulators:L4/shear-matrix
def shearMatrix (e1 e2 : R) : Matrix (Fin 2) (Fin 2) R := !![1,e2;e1,1]

lemma shearMatrix_action (e1 e2 F G : R) :
    (![F,G] : Fin 2 → R) ᵥ* shearMatrix e1 e2 = ![F + e1 * G, G + e2 * F] := by sorry

lemma shearMatrix_det (e1 e2 : R) : (shearMatrix e1 e2).det = 1 - e1 * e2 := by sorry

lemma shearMatrix_unit (e1 e2 : R) (h : IsUnit (1 - e1 * e2)) :
    IsUnit (shearMatrix e1 e2) := by sorry

-- TEST shear_identity
example : shearMatrix (0 : R) 0 = 1 := by sorry
-- TEST shear_order
example : (![7,11] : Fin 2 → ℤ) ᵥ* shearMatrix 2 3 = ![29,32] := by sorry

variable {E : Type*} [Field E]
-- PadicHodgeRegulators:L4/shear-specialization-lines
lemma shearSpecializationLines (e1 e2 F G r : E) (hdet : 1 - e1 * e2 ≠ 0) :
    (F = 0 ↔ F + e1 * G = e1 * (G + e2 * F)) ∧
    (G = 0 ↔ G + e2 * F = e2 * (F + e1 * G)) ∧
    (F = r * G ↔ (1 + e2 * r) * (F + e1 * G) = (e1 + r) * (G + e2 * F)) := by sorry

-- PadicHodgeRegulators:L4/integral-shear-choice
theorem integralShearChoice {O : Type*} [CommRing O] [IsDomain O] [IsLocalRing O]
    (ι : O →+* E) (hi : Function.Injective ι)
    (hinf : Set.Infinite (IsLocalRing.maximalIdeal O : Set O)) (rs : Finset E) :
    ∃ e1 e2 : O, e1 ≠ 0 ∧ e2 ≠ 0 ∧
      e1 ∈ IsLocalRing.maximalIdeal O ∧ e2 ∈ IsLocalRing.maximalIdeal O ∧
      (∀ r ∈ rs, ι e1 + r ≠ 0 ∧ 1 + ι e2 * r ≠ 0) ∧
      IsUnit (shearMatrix e1 e2) := by sorry

-- PadicHodgeRegulators:L4/sheared-coordinate-surjectivity
theorem shearedCoordinateSurjectivity {O R : Type*} [CommRing O] [IsDomain O]
    [IsLocalRing O] [CommRing R] [Algebra E R] [IsDomain R]
    (ι : O →+* E) (hi : Function.Injective ι)
    (hinf : Set.Infinite (IsLocalRing.maximalIdeal O : Set O))
    {m : ℕ} (J : Finset (Fin m)) (t : R) (x : Fin m → E)
    (ev : Fin m → R →ₐ[E] E) (V : Fin m → Submodule E (Fin 2 → E))
    (hx : Function.Injective x) (hev : ∀ j, ev j t = x j)
    (hq : ∀ j, t - algebraMap E R (x j) ≠ 0)
    (hker : ∀ j f, ev j f = 0 ↔ t - algebraMap E R (x j) ∣ f)
    (hline : ∀ j ∈ J, Module.finrank E (V j) = 1) :
    ∃ U : (Matrix (Fin 2) (Fin 2) O)ˣ,
      ∀ k : Fin 2, ∀ r : R, ∃ F ∈ evaluationConstraints J ev V,
        (F ᵥ* (↑U : Matrix (Fin 2) (Fin 2) O).map
          ((algebraMap E R).comp ι)) k = r := by sorry
end Shear

section IntegralTests
local instance : Fact (Nat.Prime 5) := ⟨by decide⟩
-- TEST shear_nonunit_determinant
example : (shearMatrix (1 : ℤ_[5]) (-4)).det = 5 ∧
    (5 : ℤ_[5]) ≠ 0 ∧ ¬ IsUnit (shearMatrix (1 : ℤ_[5]) (-4)) := by sorry
-- Additional half of TEST witness_integral_denominators.
example : ¬ ∃ f : Polynomial ℤ_[5], f.eval 0 = 0 ∧ f.eval 5 = 1 := by sorry
-- The proper ideal (5,X) becomes full after rationalization; no unqualified
-- integral-surjectivity theorem is asserted by this file.
end IntegralTests

section GammaFactor
-- PadicHodgeRegulators:L3/gamma-leading-factor
def gammaLeadingFactor (j : ℤ) : ℚ :=
  if 0 ≤ j then (j.toNat.factorial : ℚ)
  else (-1 : ℚ) ^ (-j - 1).toNat / ((-j - 1).toNat.factorial : ℚ)

lemma gammaLeadingFactor_nonneg (n : ℕ) :
    gammaLeadingFactor n = (n.factorial : ℚ) := by sorry
lemma gammaLeadingFactor_neg (n : ℕ) :
    gammaLeadingFactor (-(n : ℤ) - 1) = (-1 : ℚ)^n / (n.factorial : ℚ) := by sorry
lemma gammaLeadingFactor_ne_zero (j : ℤ) : gammaLeadingFactor j ≠ 0 := by sorry
-- TEST gamma_zero
example : gammaLeadingFactor 0 = 1 := by sorry
-- TEST gamma_minus_two
example : gammaLeadingFactor (-2) = -1 := by sorry
-- TEST gamma_minus_three
example : gammaLeadingFactor (-3) = 1 / 2 := by sorry
end GammaFactor

section ScalarProjection
variable {E H C Z : Type*} [Field E] [CommRing H] [Algebra E H]
  [AddCommGroup C] [Module E C] [AddCommGroup Z] [Module E Z]

-- PadicHodgeRegulators:L3/scalar-projection
-- This is the actual tensor projection given an already constructed vector map L.
-- It neither asserts nor packages the existence of an arithmetic regulator.
def scalarRegulator (L : Z →ₗ[E] H ⊗[E] C) (ell : C →ₗ[E] E) : Z →ₗ[E] H :=
  (TensorProduct.rid E H).toLinearMap ∘ₗ
    (TensorProduct.map (LinearMap.id : H →ₗ[E] H) ell) ∘ₗ L
lemma scalarRegulator_apply (L : Z →ₗ[E] H ⊗[E] C) (ell : C →ₗ[E] E) (z : Z) :
    scalarRegulator L ell z =
      TensorProduct.rid E H (TensorProduct.map (LinearMap.id : H →ₗ[E] H) ell (L z)) := by sorry
lemma scalarRegulator_add_functional (L : Z →ₗ[E] H ⊗[E] C)
    (ell1 ell2 : C →ₗ[E] E) :
    scalarRegulator L (ell1 + ell2) = scalarRegulator L ell1 + scalarRegulator L ell2 := by sorry
-- TEST scalar_zero_functional
example (L : Z →ₗ[E] H ⊗[E] C) : scalarRegulator L 0 = 0 := by sorry
-- TEST scalar_period_scaling
example (L : Z →ₗ[E] H ⊗[E] C) (ell : C →ₗ[E] E) :
    scalarRegulator L ((2 : E) • ell) = (2 : E) • scalarRegulator L ell := by sorry
-- TEST scalar_ordered_projection: use an actual pure tensor, not an arbitrary map.
example : TensorProduct.rid ℚ ℚ
    (TensorProduct.map (LinearMap.id : ℚ →ₗ[ℚ] ℚ)
      (LinearMap.proj (0 : Fin 2) : (Fin 2 → ℚ) →ₗ[ℚ] ℚ)
      ((1 : ℚ) ⊗ₜ[ℚ] (![2,3] : Fin 2 → ℚ))) = 2 ∧
    TensorProduct.rid ℚ ℚ
    (TensorProduct.map (LinearMap.id : ℚ →ₗ[ℚ] ℚ)
      (LinearMap.proj (1 : Fin 2) : (Fin 2 → ℚ) →ₗ[ℚ] ℚ)
      ((1 : ℚ) ⊗ₜ[ℚ] (![2,3] : Fin 2 → ℚ))) = 3 := by sorry
end ScalarProjection

section Refinement
variable {E C : Type*} [Field E] [AddCommGroup C] [Module E C]
  [FiniteDimensional E C]
-- PadicHodgeRegulators:L4/noncritical-refinement
-- Phi and Fil are the actual linear/filtered realization once supplied.
-- This predicate is explicitly the flag/dimension condition, not a placeholder Prop.
def noncriticalRefinement (d : ℕ) (Phi : C →ₗ[E] C)
    (Fil : ℤ → Submodule E C) (Y : Fin (d+1) → Submodule E C) : Prop :=
  Module.finrank E C = d ∧ Antitone Fil ∧
  Y 0 = ⊥ ∧ Y ⟨d, Nat.lt_succ_self d⟩ = ⊤ ∧ Monotone Y ∧
  (∀ i, Module.finrank E (Y i) = i.val) ∧
  (∀ i, Y i ≤ (Y i).comap Phi) ∧
  (∀ i j, Module.finrank E (Y i ⊓ Fil j : Submodule E C) = Module.finrank E (Fil j) + i.val - d)
lemma noncriticalRefinement_flag (d : ℕ) (Phi : C →ₗ[E] C)
    (Fil : ℤ → Submodule E C) (Y : Fin (d+1) → Submodule E C)
    (h : noncriticalRefinement d Phi Fil Y) :
    ∀ i, Module.finrank E (Y i) = i.val ∧ Y i ≤ (Y i).comap Phi := by sorry
lemma noncriticalRefinement_weights (d : ℕ) (Phi : C →ₗ[E] C)
    (Fil : ℤ → Submodule E C) (Y : Fin (d+1) → Submodule E C)
    (h : noncriticalRefinement d Phi Fil Y) :
    ∀ i j, Module.finrank E (Y i ⊓ Fil j : Submodule E C) = Module.finrank E (Fil j) + i.val - d := by sorry
-- TEST refinement_rank_one
example : noncriticalRefinement (E := ℚ) 1
    (LinearMap.id : (Fin 1 → ℚ) →ₗ[ℚ] (Fin 1 → ℚ))
    (fun j => if j ≤ 0 then ⊤ else ⊥)
    (fun i => if i.val = 0 then ⊥ else ⊤) := by sorry
-- TEST refinement_wrong_line
example : ¬ noncriticalRefinement (E := ℚ) 2
    (LinearMap.id : (Fin 2 → ℚ) →ₗ[ℚ] (Fin 2 → ℚ))
    (fun j => if j ≤ 0 then ⊤ else if j ≤ 2 then
      Submodule.span ℚ {(![0,1] : Fin 2 → ℚ)} else ⊥)
    (fun i => if i.val = 0 then ⊥ else if i.val = 1 then
      Submodule.span ℚ {(![0,1] : Fin 2 → ℚ)} else ⊤) := by sorry
-- TEST refinement_scalar_phi
example : noncriticalRefinement (E := ℚ) 2
    (LinearMap.id : (Fin 2 → ℚ) →ₗ[ℚ] (Fin 2 → ℚ))
    (fun j => if j ≤ 0 then ⊤ else if j ≤ 2 then
      Submodule.span ℚ {(![0,1] : Fin 2 → ℚ)} else ⊥)
    (fun i => if i.val = 0 then ⊥ else if i.val = 1 then
      Submodule.span ℚ {(![1,0] : Fin 2 → ℚ)} else ⊤) := by sorry
end Refinement

section SignedKernel
variable {R Z : Type*} [CommRing R] [AddCommGroup Z] [Module R Z] {d : ℕ}
-- PadicHodgeRegulators:L4/signed-local-condition
-- An actual supplied map Col is required. This definition only takes its kernel.
def signedColemanLocalCondition (Col : Z →ₗ[R] (Fin d → R)) (j : Fin d) :
    Submodule R Z := (LinearMap.proj j ∘ₗ Col).ker
lemma signedColemanLocalCondition_mem (Col : Z →ₗ[R] (Fin d → R)) (j : Fin d) (z : Z) :
    z ∈ signedColemanLocalCondition Col j ↔ Col z j = 0 := by sorry
lemma signedColemanLocalCondition_closed [TopologicalSpace R] [T2Space R]
    [TopologicalSpace Z] (Col : Z →ₗ[R] (Fin d → R)) (j : Fin d)
    (h : Continuous (fun z => Col z j)) :
    IsClosed (signedColemanLocalCondition Col j : Set Z) := by sorry
lemma signedColemanLocalCondition_covariance
    (Col Col' : Z →ₗ[R] (Fin d → R)) (Uinv : Matrix (Fin d) (Fin d) R)
    (h : ∀ z, Col' z = Col z ᵥ* Uinv) (j : Fin d) (z : Z) :
    z ∈ signedColemanLocalCondition Col' j ↔ (Col z ᵥ* Uinv) j = 0 := by sorry
-- TEST signed_zero
example (Col : Z →ₗ[R] (Fin d → R)) (j : Fin d) :
    (0 : Z) ∈ signedColemanLocalCondition Col j := by sorry
-- TEST signed_basis_mix
example : (![1,0] : Fin 2 → ℚ) ∈ signedColemanLocalCondition
    (LinearMap.id : (Fin 2 → ℚ) →ₗ[ℚ] (Fin 2 → ℚ)) 1 ∧
    (![1,0] : Fin 2 → ℚ) ∉ signedColemanLocalCondition
    (LinearMap.pi (fun j : Fin 2 => if j = 0 then (LinearMap.proj (0 : Fin 2) : (Fin 2 → ℚ) →ₗ[ℚ] ℚ)
      else (LinearMap.proj (0 : Fin 2) : (Fin 2 → ℚ) →ₗ[ℚ] ℚ) + LinearMap.proj (1 : Fin 2)) : (Fin 2 → ℚ) →ₗ[ℚ] (Fin 2 → ℚ)) 1 := by sorry
-- TEST signed_scalar_basis
example (Col : Z →ₗ[R] (Fin d → R)) (j : Fin d) (c : Rˣ) :
    signedColemanLocalCondition ((c : R) • Col) j = signedColemanLocalCondition Col j := by sorry
end SignedKernel

section FurtherAlgebraTests
-- Denominator-free interpolation does not determine the output when B=0.
example : let p : ℚ := 5
  let phi : ℚ := p⁻¹
  let A := 1 - phi
  let B := 1 - p⁻¹ * phi⁻¹
  B = 0 ∧ A ≠ 0 ∧ B * (0 : ℚ) = B * 1 := by sorry
-- E303: ordered quotient functional in the weight-two example.
example : (5 - 1 : ℚ) * 1 - (2 - 0) * 2 = 0 ∧
    (2 - 0 : ℚ) * 1 - (5 - 1) * 2 ≠ 0 := by sorry
-- A forward shear on coordinates requires an inverse shear on basis vectors.
example : (![1,0] : Fin 2 → ℚ) ᵥ* !![1,1;0,1] = ![1,1] ∧
    (!![1,1;0,1] : Matrix (Fin 2) (Fin 2) ℚ) * !![1,-1;0,1] = 1 := by sorry
end FurtherAlgebraTests

/-
Arithmetic interface boundary (all statements in this block are comments).

The pinned libraries lack the genuine D_cris, D_dR, N(T), N_rig(D), H_Iw and
unbounded analytic distribution carriers required below. These contracts name
actual mathematical domains and maps. They must become Lean signatures only
after their supplier API is elaborated. There are no Prop-valued stand-ins,
chosen maps asserted to be regulators, or examples of True in their place.
The definitive hypotheses, proof routes, and exact source versions are in the
packet/document. This is why elaboration of this file is algebraic validation.
-/

/-
PadicHodgeRegulators:L3/gamma-leading-factor
Native algebraic declaration above; arithmetic specialization contract:
For j in Z define Gamma*(1+j)=j! if j>=0 and (-1)^(-j-1)/(-j-1)! if j<=-1, as a nonzero rational number, then map it into E. This is the leading Laurent coefficient of the classical Gamma function; it is not the p-adic Gamma function.
Hypotheses: E has characteristic zero.
Proposed lemma gammaLeadingFactor_nonneg: For n in N its value at j=n is n!.
Proposed lemma gammaLeadingFactor_neg: Its value at j=-n-1 is (-1)^n/n!.
Proposed lemma gammaLeadingFactor_ne_zero: It is nonzero for every integral j.
Proposed example -- TEST gamma_zero
At j=0 the factor is 1.
Proposed example -- TEST gamma_minus_two
At j=-2 it is -1.
Proposed example -- TEST gamma_minus_three
At j=-3 it is 1/2, not 2.
-/

/-
PadicHodgeRegulators:L3/logarithmic-factors
Proposed declaration contract: logarithmicFactors (p, E, chosen gamma) : logarithmic factors ell_i, lambda_k, delta_i and n_k in the actual H_E(Gamma_1) algebra.
In each H_E(Gamma_1) component set ell_i=log(1+X)/log(chi(gamma))-i for i in Z, lambda_k=product_(0<=i<k) ell_i for k>=0, and delta_i=ell_i/(X+1-chi(gamma)^i). The apparent pole of delta_i is removable at x_i=chi(gamma)^i-1; its value there is 1/(chi(gamma)^i log(chi(gamma))). Put n_k=log(chi(gamma))^k lambda_k/product_(0<=i<k)(X-x_i).
Hypotheses: p is odd; E/Q_p is finite; G=Delta times Gamma_1; HT(E(1))=+1; roots zeta_(p^n), Tate bases e_j and a generator gamma are fixed compatibly.
Proposed lemma ellFactor_eval_weight: ell_i(chi^j eta)=j-i for any finite-order eta on Gamma_1.
Proposed lemma lambdaFactor_succ: lambda_(k+1)=lambda_k ell_k, lambda_0=1.
Proposed lemma deltaFactor_cleared: (X-x_i)delta_i=ell_i, including the removable point.
Proposed lemma ellFactor_generator: log(gamma)/log(chi(gamma)) is independent of the chosen topological generator under the group-algebra change of variable.
Proposed example -- TEST ell_at_zero
ell_0 at the trivial character is 0, whereas ell_1 there is -1.
Proposed example -- TEST delta_at_node
delta_0 at X=0 is 1/log(chi(gamma)), not zero or an undefined inverse.
Proposed example -- TEST lambda_empty
lambda_0=n_0=1; lambda_2 at chi^3 is 6.
-/

/-
PadicHodgeRegulators:L3/crystalline-regulator
Proposed declaration contract: crystallineRegulator (V crystalline, nonnegative weights, no trivial quotient) : H_Iw^1(Q_p,V) →ₗ[Lambda_E] H_E(G) ⊗[E] D_cris(V).
Define L_V=(Mellin_inverse tensor 1) composed with (1-phi) composed with h_Iw^(-1), from H^1_Iw(Q_p,V) to H_E(G) tensor_E D_cris(V). Here h_Iw:N(V)^(psi=1)~=H^1_Iw is the actual PG/L2 comparison, and the Wach embedding takes (1-phi)x into (B_rig^+)^(psi=0) tensor D_cris(V). This is a Lambda_E-linear continuous map; its analytic scalar extension is H_E-linear.
Hypotheses: p is odd; E/Q_p is finite; G=Delta times Gamma_1; HT(E(1))=+1; roots zeta_(p^n), Tate bases e_j and a generator gamma are fixed compatibly. V is E-linear crystalline with nonnegative weights r_1<=...<=r_d and no trivial quotient; T is a G_Qp-stable O_E-lattice. Lambda_E=O_E[[G]][1/varpi], H_E is the locally analytic distribution algebra, with convolution.
Proposed lemma crystallineRegulator_apply: Mellin(L_V(z))=(1-phi)h_Iw^(-1)(z) in the specified period module.
Proposed lemma crystallineRegulator_linear: L_V(a z+b w)=a L_V(z)+b L_V(w) for a,b in Lambda_E, acting by convolution.
Proposed lemma crystallineRegulator_ext: The Mellin identity determines the map uniquely.
Proposed lemma crystallineRegulator_coefficient: The map commutes with finite coefficient extension using the supplier comparison squares.
Proposed example -- TEST regulator_zero
The zero Iwasawa class has zero regulator.
Proposed example -- TEST regulator_phi_fixed
An actual phi-fixed psi-one class is killed by 1-phi; for E(1) this kills the Kummer Tate tower.
Proposed example -- TEST regulator_composition_order
In the finite linear-map model h(x)=2x, boundary(x)=3x, Mellin_inverse(x)=5x, L(2)=15; using h instead of h inverse would give 60.
-/

/-
PadicHodgeRegulators:L3/big-exponential-obstruction
Proposed declaration contract: bigExponentialObstruction (V crystalline, h >= 1 with Fil^(-h) full) : (B_rig^+)^(psi=0) ⊗ D_cris(V) → direct_sum_(k=0..h) D_cris(V)/image(1-p^k phi)(k).
For h>=1 with Fil^(-h)D_cris(V)=D_cris(V), define Delta_h on (B_rig^+)^(psi=0) tensor D_cris(V) by the derivative values partial^k f(0) modulo (1-p^k phi)D_cris(V), 0<=k<=h, with their k twists. The admissible source is ker Delta_h. The kernel of 1-phi on the psi-one period module is direct_sum_(0<=k<=h)t^k D_cris(V)^(phi=p^(-k)).
Hypotheses: p is odd; E/Q_p is finite; G=Delta times Gamma_1; HT(E(1))=+1; roots zeta_(p^n), Tate bases e_j and a generator gamma are fixed compatibly. V is crystalline; h>=1 and Fil^(-h)D_cris(V)=D_cris(V).
Proposed lemma bigExponentialObstruction_mem: f is admissible iff partial^k f(0) lies in image(1-p^k phi) for every indicated k.
Proposed lemma bigExponentialObstruction_nonsingular: If all these Euler maps are invertible, Delta_h=0 and its kernel is the whole source.
Proposed lemma bigExponentialObstruction_lift: An admissible f has a psi-one lift y with (1-phi)y=f; any two lifts differ in the displayed kernel.
Proposed example -- TEST obstruction_phi_one
For rank-one phi=1, k=0 forces f(0)=0, so a nonzero constant derivative is inadmissible.
Proposed example -- TEST obstruction_nonsingular
For phi=2 over Q_5 and h=1, both 1-2 and 1-10 are invertible; no derivative obstruction remains.
Proposed example -- TEST obstruction_lift_nonunique
At phi=1 two lifts differing by a constant have the same boundary; no unique inverse is inferred.
-/

/-
PadicHodgeRegulators:L3/big-exponential
Proposed declaration contract: bigExponential (V,h) : ker Delta_h → H_E ⊗[Lambda_E] H_Iw^1(Q_p,V)/V^(H_Qp); unquotiented only under the recorded no-E(h) hypothesis.
For admissible f in ker Delta_h choose a psi-one lift y with (1-phi)y=f and define Omega_(V,h)(f)=nabla_(h-1)...nabla_0(y), with nabla_i=t partial-i. Its value is well-defined in D_rig^+(V)^(psi=1)/V^(H_Qp). If D_cris(V)^(phi=p^(-h))=0 (in particular no E(h) subrepresentation), the unquotiented value is well-defined. Map to H_E tensor_Lambda H^1_Iw using the established comparison.
Hypotheses: p is odd; E/Q_p is finite; G=Delta times Gamma_1; HT(E(1))=+1; roots zeta_(p^n), Tate bases e_j and a generator gamma are fixed compatibly. V crystalline; h>=1 with Fil^(-h) full; the source is ker Delta_h, not an arbitrary period vector.
Proposed lemma bigExponential_lift: Every valid lift gives the stated differential product in the quotient.
Proposed lemma bigExponential_linear: Omega_(V,h) is H_E-linear in the specified Mellin convention.
Proposed lemma bigExponential_no_tate: If no E(h) lies in V, the differential lift is independent in the unquotiented psi-one module.
Proposed lemma bigExponential_h_succ: nabla_h Omega_(V,h)=Omega_(V,h+1) with the natural obstruction-source comparison.
Proposed example -- TEST bigexp_zero
Omega_(V,h)(0)=0 in the quotient.
Proposed example -- TEST bigexp_kernel_killed
For a lift difference t^k v with 0<=k<h, the differential product is zero.
Proposed example -- TEST bigexp_top_kernel
For k=h the product is h! t^h v, nonzero before passing to invariants; the quotient cannot be dropped.
-/

/-
PadicHodgeRegulators:L3/auxiliary-h-comparison
Proposed theorem bigExponential_regulator (on its authentic supplier carriers):
Under the nonnegative, no-trivial-quotient hypotheses and the nonsingular Euler assumptions of LLZ4.5, over Frac(H_E) one has Omega_(V,h) L_V(z)=lambda_h z after identifying its Mellin source, for any admitted h>=1. Omega_(V,h+1)=ell_h Omega_(V,h); twisting sends Omega_(V,h)(f) tensor e_j to Omega_(V(j),h+j)(partial^(-j)f tensor t^(-j)e_j), on the common domain. Thus the intrinsic L_V is independent of h.
Hypotheses: p is odd; E/Q_p is finite; G=Delta times Gamma_1; HT(E(1))=+1; roots zeta_(p^n), Tate bases e_j and a generator gamma are fixed compatibly. V is E-linear crystalline with nonnegative weights r_1<=...<=r_d and no trivial quotient; T is a G_Qp-stable O_E-lattice. Lambda_E=O_E[[G]][1/varpi], H_E is the locally analytic distribution algebra, with convolution. No eigenvalue of phi on D_cris(V) belongs to p^Z. A noncritical refinement exists after a finite coefficient extension when elementary divisors are invoked. Choose h>=max(1,r_d); interpret equalities in the analytic scalar extension and its localization.
-/

/-
PadicHodgeRegulators:L3/meromorphic-twist-extension
Proposed declaration contract: meromorphicRegulator (V crystalline of arbitrary weights) : H_Iw^1(Q_p,V) → Frac(H_E) ⊗[E] D_cris(V).
For arbitrary E-linear crystalline V choose m>>0 so V(m) has nonnegative weights and no trivial quotient. Define L_V(z)=(ell_-1...ell_-m)^(-1) Tw_(chi^m)(L_(V(m))(z tensor e_m)) tensor t^m e_-m. The value lies in the total fraction algebra of H_E(G), component by component; it is independent of m. No general H_E-valued assertion follows without proving cancellation of these factors.
Hypotheses: p is odd; E/Q_p is finite; G=Delta times Gamma_1; HT(E(1))=+1; roots zeta_(p^n), Tate bases e_j and a generator gamma are fixed compatibly. V crystalline; use an admitted m and the actual twist comparison maps.
Proposed lemma meromorphicRegulator_choice: The value is independent of every admitted twist m.
Proposed lemma meromorphicRegulator_cleared: Multiplication by ell_-1...ell_-m gives the stated twisted positive-range map.
Proposed lemma meromorphicRegulator_positive: For V in the intrinsic range it equals L_V after localization.
Proposed example -- TEST twist_extension_identity
An admitted m=0 recovers the intrinsic positive-range regulator.
Proposed example -- TEST twist_extension_one_step
The m=1 and m=2 formulas agree by the one-step ell_-2 relation.
Proposed example -- TEST twist_extension_pole_control
In a scalar analytic model a nonzero numerator at the zero of ell_-1 gives a pole, so localization alone is not an H-valued result.
-/

/-
PadicHodgeRegulators:L3/ramified-interpolation
Proposed theorem crystallineRegulator_ramified (on its authentic supplier carriers):
Let eta=chi^j omega, j in Z, omega finite order of conductor p^n, n>=1; extend coefficients to contain omega. Write z_(eta,0) for the actual specialization in H^1(Q_p,V(eta^(-1))). Then L_V(z)(eta)=Gamma*(1+j) tau(omega)^(-1) p^(n(1+j)) phi^n (B_(j)(z_(eta,0)) tensor t^(-j)e_j), with the finite-character de Rham descent understood. B_j=exp*_(Q_p,V(eta^(-1))*(1)) for j>=0 and the Bloch–Kato logarithm on the finite part for j<=-1. The log is the inverse of exp only on its isomorphism range; source condition (dagger) supplies the finite-part class for this formula.
Hypotheses: p is odd; E/Q_p is finite; G=Delta times Gamma_1; HT(E(1))=+1; roots zeta_(p^n), Tate bases e_j and a generator gamma are fixed compatibly. V is E-linear crystalline with nonnegative weights r_1<=...<=r_d and no trivial quotient; T is a G_Qp-stable O_E-lattice. Lambda_E=O_E[[G]][1/varpi], H_E is the locally analytic distribution algebra, with convolution. z lies in the analytic Wach psi-one image (dagger of LZ AppendixB); in particular every z in the stated intrinsic range does. The Gauss sum uses the chosen roots and omega, not omega inverse.
-/

/-
PadicHodgeRegulators:L3/unramified-interpolation
Proposed theorem crystallineRegulator_unramified (on its authentic supplier carriers):
For eta=chi^j and j in Z put A_j=1-p^j phi and B_j=1-p^(-1-j)phi^(-1) on D_cris(V). If B_j is invertible then L_V(z)(chi^j)=Gamma*(1+j) A_j B_j^(-1) b_j(z_(chi^j,0)), where b_j is the exp*/log value with its Tate descent from the preceding theorem. No invertibility of A_j is required for this direction.
Hypotheses: p is odd; E/Q_p is finite; G=Delta times Gamma_1; HT(E(1))=+1; roots zeta_(p^n), Tate bases e_j and a generator gamma are fixed compatibly. V is E-linear crystalline with nonnegative weights r_1<=...<=r_d and no trivial quotient; T is a G_Qp-stable O_E-lattice. Lambda_E=O_E[[G]][1/varpi], H_E is the locally analytic distribution algebra, with convolution. The same Wach-image condition (dagger) holds; B_j is bijective; for the negative range retain the actual finite-class logarithm domain.
-/

/-
PadicHodgeRegulators:L3/singular-euler-specialization
Proposed theorem crystallineRegulator_singular (on its authentic supplier carriers):
For every integral j under (dagger), with no Euler invertibility assumption, B_j L_V(z)(chi^j)=Gamma*(1+j) A_j b_j(z_(chi^j,0)). More precisely, if u_j is the constant coefficient of partial^j h_Iw^(-1)(z) after Tate descent, the unsimplified identities are L_V(z)(chi^j)=A_j u_j and B_j u_j=Gamma*(1+j)b_j. They determine a relation, including the image of A_j(ker B_j); replacing B_j^(-1) by a total inverse is not a formula. For the big-exponential inverse keep ker Delta_h and the invariant quotient.
Hypotheses: p is odd; E/Q_p is finite; G=Delta times Gamma_1; HT(E(1))=+1; roots zeta_(p^n), Tate bases e_j and a generator gamma are fixed compatibly. V is E-linear crystalline with nonnegative weights r_1<=...<=r_d and no trivial quotient; T is a G_Qp-stable O_E-lattice. Lambda_E=O_E[[G]][1/varpi], H_E is the locally analytic distribution algebra, with convolution. Use b_j and the negative-weight log on precisely the domains in ramified-interpolation.
-/

/-
PadicHodgeRegulators:L3/growth
Proposed theorem crystallineRegulator_growth (on its authentic supplier carriers):
Let W subset D_cris(V) be phi-stable and h>=0. If every phi eigenvalue on Q=D_cris(V)/W has v_p(alpha)>=-h, the projection of L_V(z) to Q belongs to distributions of order h on the cyclotomic group, with the LAD C^h-dual convention. In particular take h=max(0,-min v_p(alpha)). State the seminorm bound on each finite-character component; no universal bounded (order zero) assertion is made.
Hypotheses: p is odd; E/Q_p is finite; G=Delta times Gamma_1; HT(E(1))=+1; roots zeta_(p^n), Tate bases e_j and a generator gamma are fixed compatibly. V is E-linear crystalline with nonnegative weights r_1<=...<=r_d and no trivial quotient; T is a G_Qp-stable O_E-lattice. Lambda_E=O_E[[G]][1/varpi], H_E is the locally analytic distribution algebra, with convolution. W is phi-stable; h is a nonnegative real number and the slope bound holds on Q.
-/

/-
PadicHodgeRegulators:L3/naturality-and-lattice
Proposed theorem crystallineRegulator_naturality (on its authentic supplier carriers):
For finite E extensions and equivariant morphisms of crystalline representations in the intrinsic range, L commutes with the actual D_cris and Iwasawa comparison maps. For a G-stable T its image lies in the Mellin inverse of (phi*N(T))^(psi=0) embedded in the analytic period target. It need not lie in Lambda_O tensor an arbitrary D_cris lattice. Changing gamma only changes X by (1+X)^a-1; changing roots zeta to sigma_a zeta multiplies the regulator distribution by [sigma_a]^(-1). These assertions compose and respect identities.
Hypotheses: p is odd; E/Q_p is finite; G=Delta times Gamma_1; HT(E(1))=+1; roots zeta_(p^n), Tate bases e_j and a generator gamma are fixed compatibly. V is E-linear crystalline with nonnegative weights r_1<=...<=r_d and no trivial quotient; T is a G_Qp-stable O_E-lattice. Lambda_E=O_E[[G]][1/varpi], H_E is the locally analytic distribution algebra, with convolution. For lattice statements use an integral good psi-zero basis; coefficient extension is finite and flat, and all cohomological base-change hypotheses are supplied by L2.
-/

/-
PadicHodgeRegulators:L3/explicit-reciprocity
Proposed theorem crystallineRegulator_reciprocity (on its authentic supplier carriers):
With the crystalline pairing extended linearly in the first and via iota(g)=g^-1 in the second variable, [L_V(x),L_(V*(1))(y)]_cris=-sigma_-1 ell_0 <x,y>_Iw in the total fraction algebra of H_E(G). sigma_-1 is the inertia element with chi=-1; the dual regulator uses the admitted meromorphic twist extension. Equivalently Berger II.16 states (-1)^h <Omega_(V,h)(f),[-1]Omega_(V*(1),1-h)(g)>=-[f,iota(g)].
Hypotheses: p is odd; E/Q_p is finite; G=Delta times Gamma_1; HT(E(1))=+1; roots zeta_(p^n), Tate bases e_j and a generator gamma are fixed compatibly. V crystalline; x,y are actual Iwasawa classes and the pairings are the L2/L1 local-duality pairings with these normalizations.
-/

/-
PadicHodgeRegulators:L3/regulator-determinant
Proposed theorem crystallineRegulator_determinant (on its authentic supplier carriers):
Under NC, for each Delta component the determinant ideal of the H_E-linear scalar extension of L_V, with actual rank-d Iwasawa source, is generated up to H_E-unit by product_(i=0..r_d-1) ell_i^(d-n_i), where n_i=dim_E Fil^(-i)D_cris(V)=#{j:r_j<=i}. The determinant is an ideal in the analytic algebra, not a chosen equality of basis determinants.
Hypotheses: p is odd; E/Q_p is finite; G=Delta times Gamma_1; HT(E(1))=+1; roots zeta_(p^n), Tate bases e_j and a generator gamma are fixed compatibly. V is E-linear crystalline with nonnegative weights r_1<=...<=r_d and no trivial quotient; T is a G_Qp-stable O_E-lattice. Lambda_E=O_E[[G]][1/varpi], H_E is the locally analytic distribution algebra, with convolution. No eigenvalue of phi on D_cris(V) belongs to p^Z. A noncritical refinement exists after a finite coefficient extension when elementary divisors are invoked.
-/

/-
PadicHodgeRegulators:L3/scalar-projection
Native algebraic declaration above; arithmetic specialization contract:
Given an explicitly chosen E-linear functional ell:D_cris(V)->E, define scalarRegulator_(V,ell)=(1 tensor ell) L_V. A differential or refinement supplies ell only after its pairing and period normalization are proved. The vector regulator is canonical with its cyclotomic choices; this scalar projection is not chosen from V alone.
Hypotheses: p is odd; E/Q_p is finite; G=Delta times Gamma_1; HT(E(1))=+1; roots zeta_(p^n), Tate bases e_j and a generator gamma are fixed compatibly. V is E-linear crystalline with nonnegative weights r_1<=...<=r_d and no trivial quotient; T is a G_Qp-stable O_E-lattice. Lambda_E=O_E[[G]][1/varpi], H_E is the locally analytic distribution algebra, with convolution. ell is specified, including every period scalar when it is derived from a geometric differential.
Proposed lemma scalarRegulator_apply: The output is (1 tensor ell)(L_V(z)).
Proposed lemma scalarRegulator_add_functional: Projection for ell1+ell2 is the sum of the two projections; scaling ell scales the output.
Proposed lemma scalarRegulator_base_change: Finite coefficient extension commutes after transporting ell.
Proposed lemma scalarRegulator_growth: The vector seminorm bound gives the projected bound times the functional norm; a stronger eigenline bound needs the specified phi-stable quotient.
Proposed example -- TEST scalar_zero_functional
The zero functional gives the zero map.
Proposed example -- TEST scalar_ordered_projection
For vector (2,3), first projection gives 2 and second gives 3.
Proposed example -- TEST scalar_period_scaling
Replacing a functional by twice itself doubles every value; it cannot be silently treated as the same normalized scalar regulator.
-/

/-
PadicHodgeRegulators:L3/tate-coleman-comparison
Proposed theorem tateRegulator_coleman (on its authentic supplier carriers):
For V=E(1), d=t^-1 e_1 and principal norm-compatible cyclotomic units u, the actual Kummer map satisfies L_(E(1))(kappa_Iw(u))=ell_0 Col_0(u) tensor d=-ell_0 Col(u) tensor d. Col_0 is exactly the raw ColemanPowerSeries composite and Col=-Col_0. Equivalently Mellin(Col_0(u))=(1-phi/p)log(f_u) and partial of this equals (1-phi)Delta(f_u). On psi-zero partial inverse is multiplication by x^-1 under Amice; no integration constant is chosen. The regulator kills the Tate-root tower and the coefficient-extended fundamental Coleman sequence gives the moment cokernel.
Hypotheses: p is odd; E/Q_p is finite; G=Delta times Gamma_1; HT(E(1))=+1; roots zeta_(p^n), Tate bases e_j and a generator gamma are fixed compatibly. V=E(1), u lies in the actual principal inverse-limit unit module; use the same roots, norm operator, Kummer cocycle and Tate basis.
-/

/-
PadicHodgeRegulators:L3/rubin-coleman-map
Proposed declaration contract: rubinColemanMap (A ordinary or multiplicative elliptic curve, omega_A) : H^1_(infty,s)(Q_p,T_p A) →ₗ[Lambda] Lambda.
For an elliptic curve A/Q with good ordinary or multiplicative reduction at odd p, T=T_p A, let alpha in Z_p^times be the ordinary root and beta=p/alpha. In split multiplicative reduction set (alpha,beta)=(1,p), in nonsplit (-1,-p). On the actual inverse-corestriction singular quotients H^1_(infty,s)(Q_p,T) define Col_infty into Lambda(Z_p-extension) with its injection and Rubin III.5.14 normalization. For nontrivial finite chi of conductor p^k its value is alpha^-k tau(chi) sum_(g in G_n)chi(g)^-1 exp*_(omega_A)(g z_n). At chi=1 it is (1-alpha^-1)(1-beta^-1)^-1 exp*_(omega_A)(z_0).
Hypotheses: p is odd; A has the stated reduction; use Rubin cyclotomic Z_p-extension indexing Q_n and compatible p-power roots. omega_A is the specified Neron differential; local finite quotients and integral H^1_s are inherited from L1/Selmer.
Proposed lemma rubinColemanMap_specialization: Finite-character values are exactly the displayed Gauss-sum/differential formulas.
Proposed lemma rubinColemanMap_injective: Its kernel on the singular inverse-limit module is zero.
Proposed lemma rubinColemanMap_linear: It is Lambda-linear on that actual source.
Proposed lemma rubinColemanMap_period: Rescaling the differential by c rescales its scalar dual-exponential coordinate by c^-1, and hence the map by c^-1.
Proposed example -- TEST rubin_zero
Col_infty(0)=0.
Proposed example -- TEST rubin_split_trivial
At split multiplicative alpha=1 the trivial specialization is zero.
Proposed example -- TEST rubin_nonsplit_trivial
At p=5 and alpha=-1,beta=-5 the trivial Euler multiplier is 5/3, so it is not automatically zero.
-/

/-
PadicHodgeRegulators:L4/good-wach-basis
Proposed theorem exists_goodWachBasis (on its authentic supplier carriers):
For a crystalline V and G-stable T, each integral Wach basis n_i^0 admits a replacement n_i congruent n_i^0 mod pi such that b_i=(1+pi)phi(n_i) is a Lambda_O(G)-basis of (phi*N(T))^(psi=0). Rationally every E-basis nu_i of D_cris(V) has such a lift n_i mod pi. Analytically H_E tensor_Lambda (phi*N(V))^(psi=0) is (phi*N_rig(V))^(psi=0), and these b_i form its H_E-basis. This is an existence theorem, not a statement about all Wach bases.
Hypotheses: p is odd; E/Q_p is finite; G=Delta times Gamma_1; HT(E(1))=+1; roots zeta_(p^n), Tate bases e_j and a generator gamma are fixed compatibly. V crystalline; T stable; for the analytic closure argument use finite free modules with their canonical Frechet topology.
-/

/-
PadicHodgeRegulators:L4/noncritical-refinement
Proposed declaration contract: noncriticalRefinement (D_cris(V), phi, induced filtration) : full phi-stable flag with the exact filtration dimension equalities.
A refinement is a full phi-stable flag 0=Y_0 subset Y_1 subset ... subset Y_d=D_cris(V), dim Y_i=i. It is noncritical if each Y_i has the i smallest filtration weights in LLZ’s positive representation convention (weights -s_1>=...>=-s_d with 0<=s_1<=...<=s_d); Equivalently dim Fil^j(Y_i)=max(0,dim Fil^j(D_cris(V))-d+i), for every j, with multiplicities retained. On W=V(m) nonnegative weights are r_1<=...<=r_d with s_i=m-r_(d+1-i). Existence after finite E extension is a separate hypothesis.
Hypotheses: V is crystalline, initially with nonpositive weights -s_i. Repeated weights are allowed.
Proposed lemma noncriticalRefinement_flag: Every step is phi-stable and has dimension i.
Proposed lemma noncriticalRefinement_weights: The induced filtration on Y_i has weights -s_1,...,-s_i.
Proposed lemma noncriticalRefinement_extension: Finite field extension transports a noncritical flag and its filtration dimensions.
Proposed example -- TEST refinement_rank_one
The unique flag of a rank-one filtered phi module is noncritical.
Proposed example -- TEST refinement_wrong_line
For weights 0,-2 with Fil^1 the second eigenline, the flag starting in that line is critical in the LLZ positive convention.
Proposed example -- TEST refinement_scalar_phi
With scalar phi any flag is stable, but only flags with the required filtration dimensions are noncritical.
-/

/-
PadicHodgeRegulators:L4/refinement-saturated-flag
Proposed theorem wachFlag_comparison (on its authentic supplier carriers):
For a noncritical refinement of a positive V, put mathcalY_i=B_rig^+ tensor Y_i and X_i=N_rig(V) intersect mathcalY_i[(t/pi)^(-1)]. Then X_i is saturated, rank i, and has weights -s_1,...,-s_i. For m>=s_d put A_i=pi^-m X_i e_m and B_i=t^-m mathcalY_i e_m. B_i is the saturation of A_i; A_d/A_(i-1) embeds in B_d/B_(i-1), with quotient annihilated by (t/pi)^(m-s_i). Passing to phi* and psi-zero gives cyclic successive quotients Btilde_i/(Btilde_(i-1)+Atilde_i) with exact annihilator n_(m-s_i); n_(m-s_i) annihilates the remaining quotient.
Hypotheses: p is odd; E/Q_p is finite; G=Delta times Gamma_1; HT(E(1))=+1; roots zeta_(p^n), Tate bases e_j and a generator gamma are fixed compatibly. Use the noncritical flag and m>=s_d; all intersections are in the same localized period module.
-/

/-
PadicHodgeRegulators:L4/logarithmic-elementary-divisors
Proposed theorem logarithmicMatrix_elementaryDivisors (on its authentic supplier carriers):
For W with nonnegative weights r_1<=...<=r_d admitting a noncritical refinement after finite coefficient extension, the H_E(Gamma_1) elementary divisors of (B_rig^+)^(psi=0) tensor D_cris(W)/(phi*N_rig(W))^(psi=0), and hence of the row-oriented logarithmic matrix M, are n_(r_1),...,n_(r_d). Consequently det M is associated to their product. In particular M(x_i) is invertible for x_i=chi(gamma)^i-1, 0<=i<r_d, since n_r has a removable nonzero value there.
Hypotheses: p is odd; E/Q_p is finite; G=Delta times Gamma_1; HT(E(1))=+1; roots zeta_(p^n), Tate bases e_j and a generator gamma are fixed compatibly. V is E-linear crystalline with nonnegative weights r_1<=...<=r_d and no trivial quotient; T is a G_Qp-stable O_E-lattice. Lambda_E=O_E[[G]][1/varpi], H_E is the locally analytic distribution algebra, with convolution. The refinement hypothesis holds after finite extension; work componentwise in H_E, with its actual elementary-divisor theorem.
-/

/-
PadicHodgeRegulators:L4/specialization-subspaces
Proposed declaration contract: colemanSpecializationSubspaces (V, eta, chosen good basis, i in 0..r_d-1) : E-subspace of row E^d, using V_(i,eta) M(x_i)^(-1).
Under NC define V_(i,eta) in D_cris(V) as (1-p^i phi)(1-p^(-1-i)phi^-1)^(-1) Fil^(-i) if eta=chi_0^i, and phi Fil^(-i) otherwise, for 0<=i<r_d. Identify D_cris with row coordinates through the chosen ordered nu basis. The constraint on Coleman rows is W_(i,eta)={v in E^d: v M(x_i) belongs to V_(i,eta)}=V_(i,eta) M(x_i)^(-1). It has codimension d-dim Fil^(-i).
Hypotheses: p is odd; E/Q_p is finite; G=Delta times Gamma_1; HT(E(1))=+1; roots zeta_(p^n), Tate bases e_j and a generator gamma are fixed compatibly. V is E-linear crystalline with nonnegative weights r_1<=...<=r_d and no trivial quotient; T is a G_Qp-stable O_E-lattice. Lambda_E=O_E[[G]][1/varpi], H_E is the locally analytic distribution algebra, with convolution. No eigenvalue of phi on D_cris(V) belongs to p^Z. A noncritical refinement exists after a finite coefficient extension when elementary divisors are invoked.
Proposed lemma colemanSpecializationSubspaces_mem: v is in W_(i,eta) iff v M(x_i) is in V_(i,eta).
Proposed lemma colemanSpecializationSubspaces_codim: codim W_(i,eta)=d-dim Fil^(-i).
Proposed lemma colemanSpecializationSubspaces_covariance: If M becomes U M B^-1 then W becomes W U^-1, with the period subspace transported by B^-1.
Proposed example -- TEST specialization_transport
For V=span(1,0) and M=[[0,1],[1,0]], W=span(0,1), so the first Coleman coordinate is forced zero.
Proposed example -- TEST specialization_full_filtration
If Fil^(-i) is full and both Euler maps invertible then W=E^d.
Proposed example -- TEST specialization_singular_exclusion
A phi eigenvalue p^-1 at i=0 violates NC and forbids using the displayed inverse.
-/

/-
PadicHodgeRegulators:L4/actual-coleman-image
Proposed theorem colemanMap_image (on its authentic supplier carriers):
Under NC, in each eta component the image of the actual Col:N(V)^(psi=1)->Lambda_E(Gamma_1)^d is exactly S={F:F(x_i) belongs to W_(i,eta),0<=i<r_d}. Its determinant ideal is product_i(X-x_i)^(d-n_i). Each coordinate image equals product_(i: W_(i,eta) subset {v:v_j=0})(X-x_i) Lambda_E. The kernel of 1-phi is zero under the excluded Frobenius eigenvalues, giving a bounded Lambda_E exact sequence with quotient direct_sum_i E^d/W_(i,eta), with Gamma action evaluated at x_i. Analytic scalar extension gives the corresponding H_E exact sequence.
Hypotheses: p is odd; E/Q_p is finite; G=Delta times Gamma_1; HT(E(1))=+1; roots zeta_(p^n), Tate bases e_j and a generator gamma are fixed compatibly. V is E-linear crystalline with nonnegative weights r_1<=...<=r_d and no trivial quotient; T is a G_Qp-stable O_E-lattice. Lambda_E=O_E[[G]][1/varpi], H_E is the locally analytic distribution algebra, with convolution. No eigenvalue of phi on D_cris(V) belongs to p^Z. A noncritical refinement exists after a finite coefficient extension when elementary divisors are invoked.
-/

/-
PadicHodgeRegulators:L4/regulator-elementary-divisors
Proposed theorem crystallineRegulator_elementaryDivisors (on its authentic supplier carriers):
Under NC the H_E(G)-module cokernel of the H_E-linear extension of the actual L_V has elementary divisors lambda_(r_1),...,lambda_(r_d). These are analytic cokernel invariants, not bounded Coleman coordinate images. For each component the determinant specializes to the L3 formula.
Hypotheses: p is odd; E/Q_p is finite; G=Delta times Gamma_1; HT(E(1))=+1; roots zeta_(p^n), Tate bases e_j and a generator gamma are fixed compatibly. V is E-linear crystalline with nonnegative weights r_1<=...<=r_d and no trivial quotient; T is a G_Qp-stable O_E-lattice. Lambda_E=O_E[[G]][1/varpi], H_E is the locally analytic distribution algebra, with convolution. No eigenvalue of phi on D_cris(V) belongs to p^Z. A noncritical refinement exists after a finite coefficient extension when elementary divisors are invoked.
-/

/-
PadicHodgeRegulators:L4/modular-specialization
Proposed theorem modularColeman_specialization (on its authentic supplier carriers):
For the nonordinary modular representation V=V_(fbar)(k-1) in LLZ Section1C6 (p odd, weight k>=2, p not dividing N, coefficient E containing eigenvalues, source Frobenius exclusions), use the prescribed ordered bases and M(0)=[[0,p^(k-1)],[-1,a_p]]. Then at the trivial Delta component (1-a_p+p^(k-2)) Col_2(z)(0)=p^(k-2)(p-1) Col_1(z)(0); at nontrivial eta, Col_2(z)^eta(0)=0. For k=2 the quotient functional on the ordered pair (Col_1,Col_2) is rho(g,h)=(p-1)g(0)-(2-a_p)h(0), valued in E. Its kernel is the actual rational image, and it is surjective when the coefficients are not both zero.
Hypotheses: p is odd; E/Q_p is finite; G=Delta times Gamma_1; HT(E(1))=+1; roots zeta_(p^n), Tate bases e_j and a generator gamma are fixed compatibly. f and V have LLZ1C6 hypotheses; phi has no eigenvalue in p^Z and the refinement input for image equality holds. The period/Frobenius comparison for the modular form is a proved external dependency.
-/

/-
PadicHodgeRegulators:L4/integral-image-index
Proposed theorem integralColemanImage_finite (on its authentic supplier carriers):
In the modular range of LLZ5.10 let X_j^eta be the rational coordinate generator and X_k=product_(i=0..k-2)(X-chi(gamma)^i+1). For the prescribed integral good basis, X_k Lambda_O subset Im Col_j^eta subset X_j^eta Lambda_O, and X_j^eta Lambda_O/Im Col_j^eta has finite O_E length, hence is pseudo-null over O_E[[X]]. After the integral shear of Proposition5.11 all X_j^eta become 1, so each coordinate cokernel is finite; integral surjectivity is not asserted.
Hypotheses: p is odd; E/Q_p is finite; G=Delta times Gamma_1; HT(E(1))=+1; roots zeta_(p^n), Tate bases e_j and a generator gamma are fixed compatibly. Use the actual modular lattice and good basis of LLZ Section5; supply the integral lower inclusion for that lattice, including any extra (C),(D) restrictions required by the proof in LLZ2010.
-/

/-
PadicHodgeRegulators:L4/signed-local-condition
Proposed declaration contract: signedColemanLocalCondition (V,T,chosen good basis,j) : closed Lambda_O-submodule ker Col_j of the actual H_Iw^1(Q_p,T).
For a specified actual good integral Wach basis and coordinate j, export the closed Lambda_O-submodule ker Col_j of H^1_Iw(Q_p,T) via the proved h_Iw comparison. Its Tate-orthogonal local condition on the dual torsion representation is owned by ModularIwasawaMainConjectures. Under basis n prime=U n its row maps become Col prime=Col U^-1; the new kernel need not equal the old kernel. A basis or named signed normalization is part of the input.
Hypotheses: p is odd; E/Q_p is finite; G=Delta times Gamma_1; HT(E(1))=+1; roots zeta_(p^n), Tate bases e_j and a generator gamma are fixed compatibly. V is E-linear crystalline with nonnegative weights r_1<=...<=r_d and no trivial quotient; T is a G_Qp-stable O_E-lattice. Lambda_E=O_E[[G]][1/varpi], H_E is the locally analytic distribution algebra, with convolution. The h_Iw lattice comparison and chosen integral good basis are specified; continuity gives the closed kernel.
Proposed lemma signedColemanLocalCondition_mem: A class lies in the condition iff its specified Col_j value is zero.
Proposed lemma signedColemanLocalCondition_closed: The kernel is a closed Lambda_O submodule.
Proposed lemma signedColemanLocalCondition_covariance: Its transported description is {z:(Col(z) U^-1)_j=0}.
Proposed example -- TEST signed_zero
The zero class lies in every condition.
Proposed example -- TEST signed_basis_mix
For Col(z)=(1,0) and U^-1=[[1,1],[0,1]], the second new coordinate is 1, so the second condition changes.
Proposed example -- TEST signed_scalar_basis
Multiplying a coordinate by an O_E unit leaves its kernel unchanged; a noninvertible operation is not a basis change.
-/

/-
PadicHodgeRegulators:L4/derham-character-domain
Proposed declaration contract: deRhamCharacterDomain (D de Rham, admitted localization threshold) : admissible open U_D in the actual character weight space.
Let D be a de Rham (phi,Gamma)-module over R_E, Delta=N_rig(D) its differential module, and m(Delta) an overconvergence/localization threshold. On a torsion weight component write a character kappa by z_kappa=kappa(exp(q)), q=p for odd p and q=4 for p=2. If the torsion components differ set v_p(z_kappa-z_eta)=-infinity. For a primitive finite character eta of conductor p^c set B(eta,N)={kappa:v_p(z_kappa-z_eta)>p^(N-c)}. Choose the source threshold N(D); put U_D=union_(c>m(Delta)) B(eta,N(D)). Choices give admissible domains with compatible restriction, not a maximal canonical domain or all weight space. N(D) can be bounded in terms of the conductor of an extension where D becomes semistable.
Hypotheses: E/Q_p finite; D is de Rham; the locally analytic character space is the actual PMIA weight space. Localization and Robba norms are provided by PHT/PG.
Proposed lemma deRhamCharacterDomain_mem: Membership is existence of an admitted primitive eta with the stated coordinate valuation inequality.
Proposed lemma deRhamCharacterDomain_open: U_D is an admissible open of character space.
Proposed lemma deRhamCharacterDomain_restrict: Two valid threshold choices define compatible restrictions of the same regulator on their common admitted domain.
Proposed example -- TEST domain_center
Each admitted eta has infinite valuation difference from itself and lies in its ball.
Proposed example -- TEST domain_wrong_torsion
A character on another torsion component has valuation difference -infinity and lies outside this ball.
Proposed example -- TEST domain_threshold
A character with valuation difference exactly p^(N-c) is excluded by the strict inequality; the trivial character is not supplied by a high-conductor center argument.
-/

/-
PadicHodgeRegulators:L4/analytic-differential-powers
Proposed declaration contract: analyticDifferentialPower (Delta=N_rig(D), kappa in an admitted affinoid) : continuous E-linear operator on Delta^(psi=0), from the proved convergent binomial series.
On Delta^(psi=0), for a sufficiently small weight affinoid and N large define kappa(partial) by the convergent series sum_(i in (Z/p^N)^times) sum_(j>=0) binom(omega_kappa,j) kappa(i) i^-j (1+T)^i p^(Nj) phi^N(partial^j z_i), where z_i=psi^N((1+T)^(-i)z). The value is independent of large N and representatives and is rigid analytic in kappa; for kappa=x^k, k in Z, it equals partial^k on psi-zero (negative powers use its inverse there).
Hypotheses: Delta=N_rig(D) is the genuine differential Robba module; partial=nabla/t and psi/phi satisfy the source relations. Restrict to a weight affinoid and annulus where RJ PropositionI.13 proves convergence.
Proposed lemma analyticDifferentialPower_integer: At x^k the operator is partial^k for every integer k.
Proposed lemma analyticDifferentialPower_linear: It is E-linear in z and analytic in kappa on the specified affinoid.
Proposed lemma analyticDifferentialPower_choices: Changing N or residue representatives preserves the value on the common annulus.
Proposed example -- TEST differential_weight_zero
At k=0 the operator is the identity on psi-zero.
Proposed example -- TEST differential_weight_one
At k=1 it is partial, not t partial.
Proposed example -- TEST differential_inverse
At k=-1, partial composed with the operator is identity on psi-zero; no inverse is asserted on all Delta.
-/

/-
PadicHodgeRegulators:L4/derham-regulator
Proposed declaration contract: deRhamRegulator (D de Rham, z in N_rig(D)^(psi=1)) : rigid analytic section U_D → D_dR(D).
For z in Delta^(psi=1), define Lambda_(D,z)(eta kappa)=G(eta)^(-1) sum_(a in (Z/p^m)^times) eta(a) sigma_a [phi^(-m) kappa(partial)(1-phi)z]_0, for m sufficiently large and the admitted high-conductor ball. The constant term is taken in E_m tensor D_dR(D) after localization; the sum descends to D_dR(D). These definitions glue to a rigid analytic D_dR(D)-valued function on U_D. For positive-weight D and z in D^(psi=1), use its actual inclusion in Delta; an Iwasawa version is through the proved PG.5/L2 map.
Hypotheses: D is de Rham; use the actual Delta, localization embeddings, q coordinates and Gauss periods G(eta)=sum eta(a) zeta_(p^c)^a. On each ball retain the threshold needed for its analytic powers.
Proposed lemma deRhamRegulator_formula: Its value on an admitted ball is the displayed localized constant-term Gauss sum.
Proposed lemma deRhamRegulator_linear: It is E-linear in z; the Gamma action induces the source character-equivariance convention.
Proposed lemma deRhamRegulator_descent: Its finite-level expression descends to D_dR(D) and is independent of a larger localization level.
Proposed lemma deRhamRegulator_restrict: Two admitted thresholds give equal functions on their common domain.
Proposed example -- TEST derham_zero
The zero psi-one vector gives the zero analytic function.
Proposed example -- TEST derham_phi_fixed
A psi-one vector fixed by phi is killed by 1-phi and gives zero.
Proposed example -- TEST derham_period_normalization
Replacing G(eta) by G(eta)^-1 would multiply the expression by G(eta)^2; the stated denominator is essential.
-/

/-
PadicHodgeRegulators:L4/derham-interpolation-growth
Proposed theorem deRhamRegulator_interpolation (on its authentic supplier carriers):
For D with nonnegative Hodge–Tate weights, z in D^(psi=1), and eta x^j in U_D with eta primitive of conductor p^n, RJ I.27 gives Lambda_(D,z)(eta x^j)=Gamma*(j+1) p^(n(j+1)) exp*(integral_G eta chi^(-j) mu_z) tensor e_(eta,-j)^(dR,dual) for j>=0, and the analogous exp^(-1) value for j sufficiently negative that the indicated Bloch–Kato exponential is bijective. Gauss bases are e_(eta,j)^dR=G(eta)t^-j e_(eta,j), dual=G(eta)^-1 t^j e_(eta^-1,-j). For general z in Delta use TheoremI.15 after nabla_h, with Gamma*(j-h+1) and j>=h or j sufficiently negative. Its growth statement is the local Robba annulus convergence estimate of LemmaI.17; it is not a global finite-order distribution bound.
Hypotheses: D is de Rham; positivity and z in D^(psi=1) are required for I.27. Negative j belongs to the proved isomorphism range, not every j<0. All characters lie in the admitted open.
-/

/-
PadicHodgeRegulators:L4/crystalline-derham-comparison
Proposed theorem deRhamRegulator_crystalline (on its authentic supplier carriers):
For any crystalline de Rham D and z in N_rig(D)^(psi=1), Rodrigues Jacinto TheoremI.15/CorollaryI.29 assert that Lambda_(D,z) extends from U_D to the entire weight space. In the explicitly computed subcase with strictly negative phi slopes and an eigenbasis after finite coefficient extension, write z=sum A_lambda_i tensor e_i, phi(e_i)=alpha_i e_i and psi(lambda_i)=alpha_i lambda_i. PropositionI.28 identifies its value at ramified eta x^j, j>0, with sum_i alpha_i^-n (integral_Zp^times eta^-1 x^j lambda_i)e_i. This analytic integral expression gives the global extension in that subcase. The broader crystalline extension requires a proof of the reductions beyond that subcase; it is recorded as a gap, rather than deleting the source’s general target. On the common L3 range, the comparison to the LLZ/LZ regulator is a map-level equality after explicitly converting the Amice/Mellin, inverse finite-character and Gauss/Tate period conventions.
Hypotheses: D crystalline de Rham; z in the authentic differential module psi-one source. For the explicit I.28 formula additionally assume strictly negative phi slopes and a genuine eigenbasis, not just that eigenvalues lie in E. For the LLZ/LZ comparison retain their nonnegative/no-trivial-quotient range.
-/

/-
PadicHodgeRegulators:L4/split-multiplicative-augmentation
Proposed theorem rubinColemanMap_augmentation (on its authentic supplier carriers):
For an elliptic curve A with split multiplicative reduction at odd p, the actual Col_infty:H^1_(infty,s)(Q_p,T_p A)->Lambda is injective and its image is contained in the augmentation ideal ker(Lambda->Z_p). This is containment, not image equality or an exceptional-zero derivative formula.
Hypotheses: Use the source, differential, roots, indexing and lattice of rubinColemanMap. Split multiplicative reduction gives alpha=1,beta=p.
-/

end TauCeti.PadicHodgeRegulators
