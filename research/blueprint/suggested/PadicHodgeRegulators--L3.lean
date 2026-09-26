/-!
This file is not the roadmap and is not exhaustive. The roadmap document is
 definitive. These signatures suggest Lean forms so contributors and reviewers
 converge on names and interfaces. The mathematical specification is the document.

PARTIAL PROTOTYPE, NOT COMPILED. Mathlib 082e2d3; Tau Ceti f790474.
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

noncomputable section
open scoped BigOperators
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

variable [IsDomain R]
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
lemma singleConstraintBasisExists [IsDomain R]
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
-- Explicit hypotheses, including the domain instance, prevent automatic binder
-- inference from dropping conditions absent from the basis-valued result type.
def constraintBasis [IsDomain R] (J : Finset (Fin m)) (t : R) (x : Fin m → E)
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
theorem constraintBasis_determinant [IsDomain R]
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

/-!
Arithmetic continuation: use the precise supplier requests in the packet.
Instantiate ev/kernel/division on bounded power series, construct LLZ's good
Wach basis and the actual 1−phi map, and identify the image by the regulator
 determinant theorem before using the constraint-image lemmas. Then prove the
integral lower inclusion and finite cokernel. Rodrigues Jacinto's open-character-
domain theorem remains a separate source decomposition.
-/
end TauCeti.PadicHodgeRegulators
