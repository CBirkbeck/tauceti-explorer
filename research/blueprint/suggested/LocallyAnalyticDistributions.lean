import Mathlib.Analysis.Analytic.ChangeOrigin
import Mathlib.Analysis.Analytic.OfScalars
import Mathlib.NumberTheory.Padics.Measure.AmiceTransform
import Mathlib.Algebra.Polynomial.Derivative
import Mathlib.Tactic.NormNum
import Mathlib.Tactic.FieldSimp
import Mathlib.Tactic.Ring
import Mathlib.RingTheory.PowerSeries.GaussNorm
import Mathlib.RingTheory.PowerSeries.Restricted
import Mathlib.Topology.MetricSpace.Cauchy
import Mathlib.Topology.Instances.Matrix
import Mathlib.Data.Fin.Rev
import Mathlib.Algebra.Polynomial.OfFn
import Mathlib.LinearAlgebra.Matrix.MvPolynomial
import Mathlib.FieldTheory.Separable
import Mathlib.LinearAlgebra.Matrix.Basis
import Mathlib.Algebra.Polynomial.Reverse
import Mathlib.Algebra.Polynomial.BigOperators
import TauCeti.RingTheory.Polynomial.Resultant.AdjoinRoot
import Mathlib.Algebra.Polynomial.Reverse
import Mathlib.RingTheory.PowerSeries.Inverse
import Mathlib.Algebra.Polynomial.Div
import Mathlib.LinearAlgebra.Matrix.Charpoly.Coeff
import Mathlib.Analysis.Normed.Group.Ultra
import Mathlib.Topology.Algebra.Module.ContinuousLinearMap.Restrict
import Mathlib.Algebra.Module.Projective
import Mathlib.LinearAlgebra.Matrix.Adjugate
import Mathlib.Topology.ContinuousMap.ZeroAtInfty
import Mathlib.Topology.Algebra.InfiniteSum.Nonarchimedean
import Mathlib.Analysis.Normed.Operator.Banach
import Mathlib.LinearAlgebra.Matrix.Determinant.Basic
import Mathlib.RingTheory.PowerSeries.Trunc
import Mathlib.Algebra.Polynomial.HasseDeriv
import Mathlib.Data.Nat.Choose.Bounds
import Mathlib.Data.ZMod.Basic
import Mathlib.RingTheory.Noetherian.Basic
import Mathlib.LinearAlgebra.FreeModule.Basic
import Mathlib.Algebra.Ring.GeomSum
import Mathlib.Topology.Algebra.Module.Complement

/-!
This file is not the roadmap and is not exhaustive. The roadmap document is
definitive. These statements suggest Lean forms so contributors and reviewers
can converge on names and signatures. Proofs below are intentionally `sorry`.

PARTIAL PROTOTYPE. Baseline: mathlib 082e2d3, Tau Ceti f790474.
Checked with Lean 4.34.0-rc2; only proof-placeholder warnings are expected.
No theorem is encoded as a Prop-valued placeholder. Unavailable signatures
are listed at the end. Compilation checks signatures, not their proofs.
-/

noncomputable section
open Filter
open scoped Topology ZeroAtInfty
/- Supplier signature stub, AdicSpacesPartII:R3/completely-continuous-map.
The mathematical affinoid-to-Noetherian extension is an explicit request.
Replace this stub by the supplier import when it is implemented. -/
namespace TauCeti.Huber
variable {A M N : Type*} [NormedCommRing A]
  [NormedAddCommGroup M] [Module A M] [NormedAddCommGroup N] [Module A N]
def IsCompletelyContinuous (f : M →L[A] N) : Prop :=
  ∀ ε : ℝ, 0 < ε → ∃ g : M →L[A] N,
    (LinearMap.range g.toLinearMap).FG ∧ ∀ x : M, ‖f x - g x‖ ≤ ε * ‖x‖
end TauCeti.Huber

namespace TauCeti.NonarchimedeanFredholm
universe u v w

variable {K A : Type u}
variable [NontriviallyNormedField K] [CompleteSpace K]
variable [NormedCommRing A] [NormOneClass A] [hNontrivialA : Nontrivial A]
variable [NormedAlgebra K A] [hCompleteA : CompleteSpace A] [hNoeth : IsNoetherianRing A]
variable {M N P : Type v}
variable [NormedAddCommGroup M] [NormedSpace K M] [Module A M]
variable [IsScalarTower K A M] [ContinuousSMul A M] [hCompleteM : CompleteSpace M]
variable [NormedAddCommGroup N] [NormedSpace K N] [Module A N]
variable [IsScalarTower K A N] [ContinuousSMul A N] [CompleteSpace N]
variable [NormedAddCommGroup P] [NormedSpace K P] [Module A P]
variable [IsScalarTower K A P] [ContinuousSMul A P] [CompleteSpace P]

/-- A is a ring, not a field. This is finite A-image, not finite K-rank. -/
def HasFiniteAImage (f : M →L[A] N) : Prop :=
  ∃ Q : Submodule A N, Q.FG ∧ LinearMap.range f.toLinearMap ≤ Q

/-- Import the supplier predicate; no second complete-continuity carrier. -/
abbrev IsCompletelyContinuous (f : M →L[A] N) : Prop :=
  TauCeti.Huber.IsCompletelyContinuous f

include hNoeth in
/-- L4/finite-image-range-comparison: Noetherianity makes the conventions agree. -/
theorem hasFiniteAImage_iff_range_fg (f : M →L[A] N) :
    HasFiniteAImage f ↔ (LinearMap.range f.toLinearMap).FG := by sorry

include hNoeth in
/-- The containing-submodule convention of Buzzard equals the imported predicate. -/
theorem isCompletelyContinuous_iff_containing_finite (f : M →L[A] N) :
    IsCompletelyContinuous f ↔ ∀ ε : ℝ, 0 < ε → ∃ g : M →L[A] N,
      HasFiniteAImage g ∧ ∀ x : M, ‖f x - g x‖ ≤ ε * ‖x‖ := by sorry

include hNoeth in
/-- L4/completely-continuous-norm-approximation: use the K-operator norm. -/
theorem isCompletelyContinuous_iff_norm_approximation (f : M →L[A] N) :
    IsCompletelyContinuous f ↔ ∀ ε : ℝ, 0 < ε → ∃ g : M →L[A] N,
      HasFiniteAImage g ∧ ‖(f - g).restrictScalars K‖ < ε := by sorry

include K in
/-- L4/compact-identity-finite: neither ONability nor (Pr) is required. -/
theorem completelyContinuous_id_iff_finite :
    IsCompletelyContinuous (ContinuousLinearMap.id A M) ↔ Module.Finite A M := by sorry

-- Test finite_identity_zero: the zero module is included.
example : IsCompletelyContinuous (ContinuousLinearMap.id A (Fin 0 → A)) := by sorry

-- Test finite_identity_finite: all endomorphisms of a finite A-module are admitted.
example [Module.Finite A M] (f : M →L[A] M) : IsCompletelyContinuous f := by sorry

-- Test finite_identity_infinite: the obstruction is finite A-generation.
include K in
example (h : ¬ Module.Finite A M) :
    ¬ IsCompletelyContinuous (ContinuousLinearMap.id A M) := by sorry

-- Test approximation_zero_radius_boundary: strict error zero is impossible.
example (f : M →L[A] N) :
    ¬ ∃ g : M →L[A] N, ‖(f - g).restrictScalars K‖ < 0 := by sorry

include hNoeth in
theorem finiteImage_isCompletelyContinuous (f : M →L[A] N)
    (hf : HasFiniteAImage f) : IsCompletelyContinuous f := by sorry

include K hNoeth in
theorem isCompletelyContinuous_comp (f : M →L[A] N) (g : N →L[A] P)
    (h : IsCompletelyContinuous f ∨ IsCompletelyContinuous g) :
    IsCompletelyContinuous (g.comp f) := by sorry

include hNoeth in
/-- The closure is in K-operator norm, retaining the A-linearity condition. -/
theorem isClosed_completelyContinuous :
    {f : M →L[K] N | ∃ g : M →L[A] N,
        g.restrictScalars K = f ∧ IsCompletelyContinuous g} =
      closure {f : M →L[K] N | ∃ g : M →L[A] N,
        g.restrictScalars K = f ∧ HasFiniteAImage g} := by sorry

-- Unit test: identity_on_A, even when A has infinite K-dimension.
example : IsCompletelyContinuous (ContinuousLinearMap.id A A) := by sorry

/-- L4/c0-scalar-bound: transfer the existing bounded-function sup norm. -/
theorem c0_norm_smul_le {I : Type*} [TopologicalSpace I]
    (a : A) (x : C₀(I, A)) : ‖a • x‖ ≤ ‖a‖ * ‖x‖ := by sorry

/-- Pointwise scalar multiplication is jointly continuous for the sup norm. -/
instance c0ContinuousSMul {I : Type*} [TopologicalSpace I] :
    ContinuousSMul A C₀(I, A) := by sorry

section Coordinates
variable {I : Type w} [TopologicalSpace I] [DiscreteTopology I] [DecidableEq I]

/-- Helpers use the existing C0 carrier, not a competing sequence space. -/
def c0Single (i : I) (a : A) : C₀(I, A) := by sorry
def coordinateProjection (S : Finset I) : C₀(I, A) →L[A] C₀(I, A) := by sorry

theorem coordinateProjection_norm_le (S : Finset I) (x : C₀(I, A)) :
    ‖coordinateProjection S x‖ ≤ ‖x‖ := by sorry

def c0Lift
    (hM : ∀ x y : M, ‖x + y‖ ≤ max ‖x‖ ‖y‖)
    (hAM : ∀ (a : A) (x : M), ‖a • x‖ ≤ ‖a‖ * ‖x‖)
    (m : I → M) (hm : ∃ C : ℝ, ∀ i, ‖m i‖ ≤ C) : C₀(I, A) →L[A] M := by sorry

variable (hM : ∀ x y : M, ‖x + y‖ ≤ max ‖x‖ ‖y‖)
variable (hAM : ∀ (a : A) (x : M), ‖a • x‖ ≤ ‖a‖ * ‖x‖)

theorem c0Lift_apply (m : I → M) (hm : ∃ C : ℝ, ∀ i, ‖m i‖ ≤ C)
    (x : C₀(I, A)) : c0Lift hM hAM m hm x = ∑' i, x i • m i := by sorry

theorem c0Lift_single (m : I → M) (hm : ∃ C : ℝ, ∀ i, ‖m i‖ ≤ C)
    (i : I) : c0Lift hM hAM m hm (c0Single i (1 : A)) = m i := by sorry

theorem c0Lift_unique (m : I → M) (hm : ∃ C : ℝ, ∀ i, ‖m i‖ ≤ C)
    (f : C₀(I, A) →L[A] M) (hf : ∀ i, f (c0Single i (1 : A)) = m i) :
    f = c0Lift hM hAM m hm := by sorry

-- Unit test: zero_family.
example (hm : ∃ C : ℝ, ∀ i : I, ‖(0 : M)‖ ≤ C) :
    c0Lift hM hAM (fun _ : I => (0 : M)) hm = 0 := by sorry

-- Unit test: basis_family.
example (h : ∀ x y : C₀(I, A), ‖x + y‖ ≤ max ‖x‖ ‖y‖)
    (ha : ∀ (a : A) (x : C₀(I, A)), ‖a • x‖ ≤ ‖a‖ * ‖x‖)
    (hb : ∃ C : ℝ, ∀ i : I, ‖c0Single i (1 : A)‖ ≤ C) :
    c0Lift h ha (fun i : I => c0Single i (1 : A)) hb =
      ContinuousLinearMap.id A C₀(I, A) := by sorry

include K in
theorem orthonormalization_coordinates (e : M ≃L[A] C₀(I, A)) (x : M) :
    x = ∑' i, e x i • e.symm (c0Single i (1 : A)) := by sorry
-- Test scalar_empty: the zero-index norm remains zero.
example (a : A) (x : C₀(Fin 0, A)) : ‖a • x‖ = 0 := by sorry
-- Test scalar_single: the coefficient action uses the ring norm.
example (i : I) (a b : A) : a • c0Single i b = c0Single i (a * b) := by sorry

end Coordinates

/-- L4/finite-coordinate-detection: the algebraic part of Buzzard Lemma 2.3(a). -/
theorem finite_coordinate_detection {B : Type*} [CommRing B] [IsNoetherianRing B]
    {J : Type*} (Q : Submodule B (J → B)) (hQ : Q.FG) :
    ∃ S : Finset J, ∀ x ∈ Q, ∀ y ∈ Q, (∀ j ∈ S, x j = y j) → x = y := by sorry

-- Test coordinate_empty_submodule: no coordinate is needed for the zero submodule.
example {J : Type*} (x y : J → A) (hx : x ∈ (⊥ : Submodule A (J → A)))
    (hy : y ∈ (⊥ : Submodule A (J → A))) : x = y := by sorry

-- Test coordinate_product_ring: no domain or freeness hypothesis is needed.
example (x : ℕ → K × K)
    (hx : x ∈ Submodule.span (K × K) ({fun _ : ℕ => (1, 0)} : Set (ℕ → K × K)))
    (h0 : x 0 = 0) : x = 0 := by sorry

-- Test coordinate_single_omitted: omitting its support cannot detect a basis vector.
example {J : Type*} [DecidableEq J] (j : J) (S : Finset J) (hj : j ∉ S) :
    (∀ i ∈ S, (Pi.single j (1 : A) : J → A) i = 0) ∧ (Pi.single j (1 : A) : J → A) ≠ 0 := by sorry


/-- Chart-existence predicates, not bundles of assumed analytic theorems. -/
def PotentiallyONable (A : Type u) (M : Type v) [NormedCommRing A]
    [NormedAddCommGroup M] [Module A M] : Prop :=
  ∃ (I : Type v) (t : TopologicalSpace I),
    letI : TopologicalSpace I := t
    DiscreteTopology I ∧ Nonempty (M ≃L[A] C₀(I, A))

def HasPr (A : Type u) (M : Type v) [NormedCommRing A]
    [NormedAddCommGroup M] [Module A M] : Prop :=
  ∃ (I : Type v) (t : TopologicalSpace I),
    letI : TopologicalSpace I := t
    DiscreteTopology I ∧ ∃ (i : M →L[A] C₀(I, A)) (r : C₀(I, A) →L[A] M),
      r.comp i = ContinuousLinearMap.id A M

include K in
theorem potentiallyON_iff_equivalentNorm : PotentiallyONable A M ↔
    ∃ (I : Type v) (t : TopologicalSpace I),
      letI : TopologicalSpace I := t
      DiscreteTopology I ∧ ∃ (e : M ≃ₗ[A] C₀(I, A)) (c C : ℝ),
        0 < c ∧ 0 < C ∧ ∀ x, c * ‖x‖ ≤ ‖e x‖ ∧ ‖e x‖ ≤ C * ‖x‖ := by sorry

theorem hasPr_of_potentiallyON (h : PotentiallyONable A M) : HasPr A M := by sorry

theorem hasPr_retract (h : HasPr A N) (i : M →L[A] N) (r : N →L[A] M)
    (hri : r.comp i = ContinuousLinearMap.id A M) : HasPr A M := by sorry

theorem hasPr_iff_split_c0 : HasPr A M ↔
    ∃ (I : Type v) (t : TopologicalSpace I),
      letI : TopologicalSpace I := t
      DiscreteTopology I ∧ ∃ (i : M →L[A] C₀(I, A)) (r : C₀(I, A) →L[A] M),
        r.comp i = ContinuousLinearMap.id A M := by sorry

-- Unit tests: empty_basis, finite_basis, zero_hasPr, finite_free_hasPr.
example (x : C₀(Fin 0, A)) : x = 0 := by sorry
example (n : ℕ) : Nonempty (C₀(Fin n, A) ≃L[A] (Fin n → A)) := by sorry
example : HasPr A C₀(Fin 0, A) := by sorry
example (n : ℕ) : HasPr A (Fin n → A) := by sorry

-- Unit test: potential_not_isometric, on a genuine normed module with the stated rescaled norm.
example (c : ℝ) (hc : 0 < c) (hcvalue : ∀ a : K, ‖a‖ ≠ c)
    (e : M ≃ₗ[K] K) (he : ∀ x : M, ‖x‖ = c * ‖e x‖) :
    PotentiallyONable K M ∧ ¬ Nonempty (M ≃ₗᵢ[K] K) := by sorry

-- Unit test: projective_not_free, using the actual submodule eA of K × K.
example : let E := Submodule.span (K × K) ({(1, 0)} : Set (K × K))
    HasPr (K × K) E ∧ ¬ Module.Free (K × K) E := by sorry

-- Unit test: identity_on_infinite_c0.
include K in
example (hA : ∀ x y : A, ‖x + y‖ ≤ max ‖x‖ ‖y‖) :
    ¬ IsCompletelyContinuous (ContinuousLinearMap.id A C₀(ℕ, A)) := by sorry

-- Unit test: unbounded_family.
example (ρ : K) (hρ : 0 < ‖ρ‖) (hρ' : ‖ρ‖ < 1) :
    ¬ ∃ f : C₀(ℕ, K) →L[K] K,
      ∀ n, f (c0Single n (1 : K)) = (ρ⁻¹)^n := by sorry

def diagonalOperator (a : ℕ → A) (ha : ∃ C : ℝ, ∀ n, ‖a n‖ ≤ C) :
    C₀(ℕ, A) →L[A] C₀(ℕ, A) := by sorry

-- Unit test: decaying_diagonal.
example (ρ : K) (hρ : 0 < ‖ρ‖) (hρ' : ‖ρ‖ < 1)
    (hb : ∃ C : ℝ, ∀ n, ‖algebraMap K A (ρ^n)‖ ≤ C) :
    IsCompletelyContinuous (diagonalOperator (fun n => algebraMap K A (ρ^n)) hb) := by sorry

/- Entire series: all positive radii, not just radii below one. -/
def IsEntire (f : PowerSeries A) : Prop :=
  ∀ R : ℝ, 0 < R → Tendsto (fun n : ℕ => ‖f.coeff n‖ * R^n) atTop (𝓝 0)

def entireSeries (A : Type u) [NormedCommRing A] : Subring (PowerSeries A) where
  carrier := {f | ∀ R : ℝ, 0 < R →
    Tendsto (fun n : ℕ => ‖f.coeff n‖ * R^n) atTop (𝓝 0)}
  zero_mem' := by sorry
  one_mem' := by sorry
  add_mem' := by sorry
  mul_mem' := by sorry
  neg_mem' := by sorry

theorem mem_entireSeries (f : PowerSeries A) :
    f ∈ entireSeries A ↔ IsEntire f := by sorry

def entire_eval (f : PowerSeries A) (a : A) : A := ∑' n : ℕ, f.coeff n * a^n


/- L4 Hasse calculus: native power series, with no characteristic assumption. -/
section HasseFormal
variable {B : Type*} [Semiring B]

/-- L4/hasse-series: coefficient n is choose(n+s,s) times coefficient n+s. -/
def hasseSeries (s : ℕ) (f : PowerSeries B) : PowerSeries B := by sorry

theorem hasseSeries_coeff (s n : ℕ) (f : PowerSeries B) :
    (hasseSeries s f).coeff n = (n+s).choose s • f.coeff (n+s) := by sorry
theorem hasseSeries_zero (f : PowerSeries B) : hasseSeries 0 f = f := by sorry
theorem hasseSeries_add (s : ℕ) (f g : PowerSeries B) :
    hasseSeries s (f+g) = hasseSeries s f + hasseSeries s g := by sorry
theorem hasseSeries_smul (s : ℕ) (b : B) (f : PowerSeries B) :
    hasseSeries s (b • f) = b • hasseSeries s f := by sorry

/-- L4/hasse-polynomial-comparison: reuse the pinned polynomial construction. -/
theorem hasseSeries_polynomial (s : ℕ) (p : Polynomial B) :
    hasseSeries s (p : PowerSeries B) =
      (Polynomial.hasseDeriv s p : PowerSeries B) := by sorry

/-- L4/hasse-product: valid also for a noncommutative coefficient semiring. -/
theorem hasseSeries_mul (s : ℕ) (f g : PowerSeries B) :
    hasseSeries s (f*g) = ∑ ij ∈ Finset.antidiagonal s,
      hasseSeries ij.1 f * hasseSeries ij.2 g := by sorry

-- Test hasse_order_zero.
example (f : PowerSeries B) : hasseSeries 0 f = f := by sorry
-- Test hasse_degree_boundary.
example (s d : ℕ) (b : B) (h : d < s) :
    hasseSeries s (PowerSeries.monomial d b) = 0 := by sorry
-- Test hasse_top_monomial.
example (s : ℕ) (b : B) :
    hasseSeries s (PowerSeries.monomial s b) = PowerSeries.C b := by sorry
-- Test hasse_characteristic_two: no inverse factorial is allowed.
example : hasseSeries 2 (PowerSeries.monomial 2 (1 : ZMod 2)) = 1 ∧
    Polynomial.derivative (Polynomial.derivative
      ((Polynomial.X : Polynomial (ZMod 2))^2)) = 0 := by sorry
end HasseFormal

/-- L4/hasse-coefficient-bound: ordinary norm bound, independent of ultrametricity. -/
theorem hasseSeries_norm_bound {B : Type*} [NormedRing B]
    (f : PowerSeries B) (s n : ℕ) (R : ℝ) (hR : 0 < R) :
    ‖(hasseSeries s f).coeff n‖ * R^n ≤
      (R^s)⁻¹ * (‖f.coeff (n+s)‖ * (2*R)^(n+s)) := by sorry

/-- L4/hasse-entire: the coefficient ring can be the native K-operator ring. -/
theorem hasseSeries_entire {B : Type*} [NormedRing B]
    (f : PowerSeries B)
    (hf : ∀ R : ℝ, 0 < R → Tendsto (fun n : ℕ => ‖f.coeff n‖ * R^n)
      atTop (𝓝 0)) (s : ℕ) (R : ℝ) (hR : 0 < R) :
    Tendsto (fun n : ℕ => ‖(hasseSeries s f).coeff n‖ * R^n)
      atTop (𝓝 0) := by sorry

include hCompleteA in
/-- L4/entire-root-unit: the displayed tail is the actual two-sided inverse. -/
theorem entire_root_isUnit (f : PowerSeries A) (hf : IsEntire f)
    (h0 : f.coeff 0 = 1) (a : A) (ha : entire_eval f a = 0) :
    IsUnit a ∧ a * (-(∑' n : ℕ, f.coeff (n+1) * a^n)) = 1 ∧
      (-(∑' n : ℕ, f.coeff (n+1) * a^n)) * a = 1 := by sorry

-- Test root_nonunit_constant: dropping the unit constant gives a false statement.
include hNontrivialA in
example : entire_eval (PowerSeries.X : PowerSeries A) 0 = 0 ∧
    ¬ IsUnit (0 : A) := by sorry

def gaussSize (R : ℝ) (f : PowerSeries A) : ℝ :=
  sSup (Set.range (fun n : ℕ => ‖f.coeff n‖ * R^n))

theorem entire_eval_bound
    (hA : ∀ x y : A, ‖x + y‖ ≤ max ‖x‖ ‖y‖)
    (f : PowerSeries A) (hf : IsEntire f) (a : A) (R : ℝ)
    (hR : 0 < R) (ha : ‖a‖ ≤ R) : ‖entire_eval f a‖ ≤ gaussSize R f := by sorry

include hCompleteA in
/-- Bundling of the API item entire_eval; coefficient sums converge in A. -/
def entireEvalHom (hA : ∀ x y : A, ‖x + y‖ ≤ max ‖x‖ ‖y‖) (a : A) :
    entireSeries A →+* A := by sorry

def polynomialSeries (Q : Polynomial A) : PowerSeries A :=
  Q.eval₂ PowerSeries.C PowerSeries.X

-- Unit tests: polynomials_are_entire, superexponential_coefficients,
-- geometric_nonexample. These do not assume the membership being tested.
example (Q : Polynomial A) : IsEntire (polynomialSeries Q) := by sorry
example (ρ : K) (hρ : 0 < ‖ρ‖) (hρ' : ‖ρ‖ < 1) :
    IsEntire (PowerSeries.mk (fun n : ℕ => ρ^(n*n))) := by sorry
example : ¬ IsEntire (PowerSeries.mk (fun _ : ℕ => (1 : A))) := by sorry

section FredholmON
variable {I : Type w} [TopologicalSpace I] [DiscreteTopology I] [DecidableEq I]
variable (hA : ∀ x y : A, ‖x + y‖ ≤ max ‖x‖ ‖y‖)

def operatorEntry (f : C₀(I, A) →L[A] C₀(I, A)) (i j : I) : A :=
  f (c0Single i (1 : A)) j

def columnSize (f : C₀(I, A) →L[A] C₀(I, A)) (j : I) : ℝ :=
  sSup (Set.range (fun i : I => ‖operatorEntry f i j‖))

/-- Formal minor series; analytic assertions below explicitly include hA. -/
def fredholmSeries (f : C₀(I, A) →L[A] C₀(I, A))
    (hf : IsCompletelyContinuous f) : PowerSeries A := by sorry

include K hA hNoeth in
theorem fredholmSeries_coeff (f : C₀(I, A) →L[A] C₀(I, A))
    (hf : IsCompletelyContinuous f) (n : ℕ) :
    (fredholmSeries f hf).coeff n = (-1 : A)^n *
      ∑' S : {S : Finset I // S.card = n},
        Matrix.det (fun i j : ↥S.val => operatorEntry f i j) := by sorry

include K hA hNoeth in
theorem fredholmSeries_constant (f : C₀(I, A) →L[A] C₀(I, A))
    (hf : IsCompletelyContinuous f) : (fredholmSeries f hf).coeff 0 = 1 := by sorry

include K hA hNoeth in
theorem fredholmSeries_isEntire (f : C₀(I, A) →L[A] C₀(I, A))
    (hf : IsCompletelyContinuous f) : IsEntire (fredholmSeries f hf) := by sorry

include K hA hNoeth in
theorem minor_tail_estimate (f : C₀(I, A) →L[A] C₀(I, A))
    (hf : IsCompletelyContinuous f) (b : I → ℝ)
    (hb0 : ∀ j, 0 ≤ b j) (hb : ∀ j, columnSize f j ≤ b j)
    (L : ℝ) (hL : ∀ j, b j ≤ L) (R q : ℝ)
    (hR : 0 < R) (hq : 0 < q) (hq' : q < 1)
    (T : Finset I) (hT : ∀ j, j ∉ T → R * b j ≤ q) (n : ℕ) :
    ‖(fredholmSeries f hf).coeff n‖ * R^n ≤
      (max 1 (R*L))^T.card * q^(n-T.card) := by sorry

include hA hNoeth in
theorem coefficient_continuity (f g : C₀(I, A) →L[A] C₀(I, A))
    (hf : IsCompletelyContinuous f) (hg : IsCompletelyContinuous g)
    (C : ℝ) (hC : 1 ≤ C)
    (hfC : ‖f.restrictScalars K‖ ≤ C) (hgC : ‖g.restrictScalars K‖ ≤ C)
    (n : ℕ) (hn : 1 ≤ n) :
    ‖(fredholmSeries f hf).coeff n - (fredholmSeries g hg).coeff n‖ ≤
      ‖(f-g).restrictScalars K‖ * C^(n-1) := by sorry

include hA hNoeth in
theorem gauss_convergence
    (f : ℕ → C₀(I, A) →L[A] C₀(I, A)) (g : C₀(I, A) →L[A] C₀(I, A))
    (hf : ∀ n, IsCompletelyContinuous (f n)) (hg : IsCompletelyContinuous g)
    (hfg : Tendsto (fun n => (f n).restrictScalars K) atTop (𝓝 (g.restrictScalars K)))
    (b : I → ℝ) (hb : Tendsto b cofinite (𝓝 0))
    (hb0 : ∀ j, 0 ≤ b j) (hbd : ∃ C : ℝ, ∀ j, b j ≤ C)
    (hfb : ∀ n j, columnSize (f n) j ≤ b j) (hgb : ∀ j, columnSize g j ≤ b j)
    (R : ℝ) (hR : 0 < R) :
    Tendsto (fun n => gaussSize R (fredholmSeries (f n) (hf n) - fredholmSeries g hg))
      atTop (𝓝 0) := by sorry

include K hA hNoeth in
theorem evaluated_product_on (f g : C₀(I, A) →L[A] C₀(I, A))
    (hf : IsCompletelyContinuous f) (hg : IsCompletelyContinuous g)
    (hw : IsCompletelyContinuous (f + g - f.comp g)) :
    entire_eval (fredholmSeries (f+g-f.comp g) hw) 1 =
      entire_eval (fredholmSeries f hf) 1 * entire_eval (fredholmSeries g hg) 1 := by sorry

-- Unit test: zero_operator.
include K hA hNoeth in
example (h0 : IsCompletelyContinuous (0 : C₀(I, A) →L[A] C₀(I, A))) :
    fredholmSeries (0 : C₀(I, A) →L[A] C₀(I, A)) h0 = 1 := by sorry
end FredholmON

/-- Finite matrices act in the input-first convention, on existing C0. -/
def finiteMatrixOperator {n : ℕ} (D : Matrix (Fin n) (Fin n) A) :
    C₀(Fin n, A) →L[A] C₀(Fin n, A) := by sorry

def nilpotentTwo : Matrix (Fin 2) (Fin 2) A :=
  fun i j => if i = 0 ∧ j = 1 then 1 else 0

def diagonalTwo (a b : A) : Matrix (Fin 2) (Fin 2) A :=
  fun i j => if i = j then (if i = 0 then a else b) else 0

-- Unit test: rank_one_scalar.
include K in
example (hA : ∀ x y : A, ‖x + y‖ ≤ max ‖x‖ ‖y‖) (a : A)
    (h : IsCompletelyContinuous (a • ContinuousLinearMap.id A C₀(Fin 1, A))) :
    fredholmSeries (a • ContinuousLinearMap.id A C₀(Fin 1, A)) h =
      1 - PowerSeries.C a * PowerSeries.X := by sorry

-- Unit test: nonzero_nilpotent. Finite-image witnesses use the finite free range.
include K in
example (hA : ∀ x y : A, ‖x + y‖ ≤ max ‖x‖ ‖y‖)
    (h : IsCompletelyContinuous (finiteMatrixOperator (nilpotentTwo (A := A)))) :
    fredholmSeries (finiteMatrixOperator (nilpotentTwo (A := A))) h = 1 := by sorry

-- Test whole_series_product_nonexample: no whole-series product rule.
example : (1 - PowerSeries.X : PowerSeries A) ≠
    (1 - PowerSeries.X) * (1 - PowerSeries.X) := by sorry

section FredholmPr
variable (hA : ∀ x y : A, ‖x + y‖ ≤ max ‖x‖ ‖y‖)

def fredholmSeriesPr (f : M →L[A] M) (hp : HasPr A M)
    (hf : IsCompletelyContinuous f) : PowerSeries A := by sorry

include K hA hNoeth in
theorem fredholmSeriesPr_split
    {I : Type w} [TopologicalSpace I] [DiscreteTopology I] [DecidableEq I]
    (f : M →L[A] M) (hp : HasPr A M) (hf : IsCompletelyContinuous f)
    (i : M →L[A] C₀(I, A)) (r : C₀(I, A) →L[A] M)
    (hri : r.comp i = ContinuousLinearMap.id A M)
    (hl : IsCompletelyContinuous (i.comp (f.comp r))) :
    fredholmSeriesPr f hp hf = fredholmSeries (i.comp (f.comp r)) hl := by sorry

include K hA hNoeth in
theorem fredholmSeriesPr_agrees_ON
    {I : Type w} [TopologicalSpace I] [DiscreteTopology I] [DecidableEq I]
    (f : C₀(I, A) →L[A] C₀(I, A)) (hp : HasPr A C₀(I, A))
    (hf : IsCompletelyContinuous f) :
    fredholmSeriesPr f hp hf = fredholmSeries f hf := by sorry

include K hA hNoeth in
theorem evaluated_product_pr (f g : M →L[A] M) (hp : HasPr A M)
    (hf : IsCompletelyContinuous f) (hg : IsCompletelyContinuous g)
    (hw : IsCompletelyContinuous (f+g-f.comp g)) :
    entire_eval (fredholmSeriesPr (f+g-f.comp g) hp hw) 1 =
      entire_eval (fredholmSeriesPr f hp hf) 1 *
      entire_eval (fredholmSeriesPr g hp hg) 1 := by sorry

-- Unit test: pr_zero_operator.
include K hA hNoeth in
example (hp : HasPr A M) (h0 : IsCompletelyContinuous (0 : M →L[A] M)) :
    fredholmSeriesPr (0 : M →L[A] M) hp h0 = 1 := by sorry

-- Unit test: add_zero_complement, in its stronger two-splittings form.
include K hA hNoeth in
example {I J : Type w} [TopologicalSpace I] [DiscreteTopology I] [DecidableEq I]
    [TopologicalSpace J] [DiscreteTopology J] [DecidableEq J]
    (f : M →L[A] M) (hp : HasPr A M) (hf : IsCompletelyContinuous f)
    (i : M →L[A] C₀(I, A)) (r : C₀(I, A) →L[A] M)
    (i' : M →L[A] C₀(J, A)) (r' : C₀(J, A) →L[A] M)
    (hri : r.comp i = ContinuousLinearMap.id A M)
    (hri' : r'.comp i' = ContinuousLinearMap.id A M)
    (h : IsCompletelyContinuous (i.comp (f.comp r)))
    (h' : IsCompletelyContinuous (i'.comp (f.comp r'))) :
    fredholmSeries (i.comp (f.comp r)) h =
      fredholmSeries (i'.comp (f.comp r')) h' := by sorry

def resolventCoeff (f : M →L[A] M) (hp : HasPr A M)
    (hf : IsCompletelyContinuous f) : ℕ → (M →L[A] M) := by sorry

theorem resolventCoeff_succ (f : M →L[A] M) (hp : HasPr A M)
    (hf : IsCompletelyContinuous f) (n : ℕ) :
    resolventCoeff f hp hf (n+1) =
      (fredholmSeriesPr f hp hf).coeff (n+1) • ContinuousLinearMap.id A M +
        f.comp (resolventCoeff f hp hf n) := by sorry

include hA hNoeth in
theorem resolvent_entire (f : M →L[A] M) (hp : HasPr A M)
    (hf : IsCompletelyContinuous f) (R : ℝ) (hR : 0 < R) :
    Tendsto (fun n => ‖(resolventCoeff f hp hf n).restrictScalars K‖ * R^n)
      atTop (𝓝 0) := by sorry

def resolventAt (f : M →L[A] M) (hp : HasPr A M)
    (hf : IsCompletelyContinuous f) (a : A) : M →L[A] M := by sorry

include K hA hNoeth in
theorem resolvent_identity (f : M →L[A] M) (hp : HasPr A M)
    (hf : IsCompletelyContinuous f) (a : A) :
    (ContinuousLinearMap.id A M - a • f).comp (resolventAt f hp hf a) =
      entire_eval (fredholmSeriesPr f hp hf) a • ContinuousLinearMap.id A M ∧
    (resolventAt f hp hf a).comp (ContinuousLinearMap.id A M - a • f) =
      entire_eval (fredholmSeriesPr f hp hf) a • ContinuousLinearMap.id A M := by sorry

-- Unit test: rank_one_resolvent.
include K hA hNoeth in
example (a t : A) (hp : HasPr A A)
    (h : IsCompletelyContinuous (a • ContinuousLinearMap.id A A)) :
    resolventAt (a • ContinuousLinearMap.id A A) hp h t =
      ContinuousLinearMap.id A A := by sorry

-- Unit test: diagonal_two.
include K hA hNoeth in
example (a b t : A) (hp : HasPr A C₀(Fin 2, A))
    (h : IsCompletelyContinuous (finiteMatrixOperator (diagonalTwo a b))) :
    resolventAt (finiteMatrixOperator (diagonalTwo a b)) hp h t =
      finiteMatrixOperator (diagonalTwo (1-b*t) (1-a*t)) := by sorry

-- Unit test: nilpotent_two.
include K hA hNoeth in
example (t : A) (hp : HasPr A C₀(Fin 2, A))
    (h : IsCompletelyContinuous (finiteMatrixOperator (nilpotentTwo (A := A)))) :
    resolventAt (finiteMatrixOperator (nilpotentTwo (A := A))) hp h t =
      ContinuousLinearMap.id A C₀(Fin 2, A) +
        t • finiteMatrixOperator (nilpotentTwo (A := A)) := by sorry
-- Unit test: variable_rank_projective. The leading coefficient is not a unit.
example (hK : ∀ x y : K, ‖x + y‖ ≤ max ‖x‖ ‖y‖) :
    let E := Submodule.span (K × K) ({(1, 0)} : Set (K × K))
    ∃ (hp : HasPr (K × K) E)
      (hf : IsCompletelyContinuous (ContinuousLinearMap.id (K × K) E)),
      fredholmSeriesPr (ContinuousLinearMap.id (K × K) E) hp hf =
        1 - PowerSeries.C (1, 0) * PowerSeries.X ∧ ¬ IsUnit ((1, 0) : K × K) := by sorry

/-- L4/resolvent-hasse-evaluation. Use a bounded, not necessarily contractive, A-action.
The sum is formed in the complete normed K-endomorphisms; its limit is A-linear. -/
def resolventHasseAt (f : M →L[A] M) (hp : HasPr A M)
    (hf : IsCompletelyContinuous f) (a : A) (s : ℕ) : M →L[A] M := by sorry

include hA hNoeth hCompleteA hCompleteM in
theorem resolventHasseAt_hasSum (f : M →L[A] M) (hp : HasPr A M)
    (hf : IsCompletelyContinuous f)
    (hbound : ∃ C : ℝ, 0 < C ∧ ∀ (b : A) (x : M), ‖b • x‖ ≤ C * ‖b‖ * ‖x‖)
    (a : A) (s : ℕ) :
    HasSum (fun n : ℕ => (n+s).choose s •
      ((a^n) • (resolventCoeff f hp hf (n+s)).restrictScalars K))
      ((resolventHasseAt f hp hf a s).restrictScalars K) := by sorry

include K hA hNoeth hCompleteA hCompleteM in
theorem resolventHasseAt_zero (f : M →L[A] M) (hp : HasPr A M)
    (hf : IsCompletelyContinuous f)
    (hbound : ∃ C : ℝ, 0 < C ∧ ∀ (b : A) (x : M), ‖b • x‖ ≤ C * ‖b‖ * ‖x‖)
    (a : A) : resolventHasseAt f hp hf a 0 = resolventAt f hp hf a := by sorry

include K hA hNoeth hCompleteA hCompleteM in
theorem resolventHasseAt_at_zero (f : M →L[A] M) (hp : HasPr A M)
    (hf : IsCompletelyContinuous f) (s : ℕ) :
    resolventHasseAt f hp hf 0 s = resolventCoeff f hp hf s := by sorry

include K hA hNoeth hCompleteA hCompleteM in
/-- L4/evaluated-hasse-resolvent, preserving both multiplication orders. -/
theorem resolventHasseAt_succ (f : M →L[A] M) (hp : HasPr A M)
    (hf : IsCompletelyContinuous f)
    (hbound : ∃ C : ℝ, 0 < C ∧ ∀ (b : A) (x : M), ‖b • x‖ ≤ C * ‖b‖ * ‖x‖)
    (a : A) (s : ℕ) :
    (ContinuousLinearMap.id A M - a • f).comp (resolventHasseAt f hp hf a (s+1)) -
        f.comp (resolventHasseAt f hp hf a s) =
      entire_eval (hasseSeries (s+1) (fredholmSeriesPr f hp hf)) a •
        ContinuousLinearMap.id A M ∧
    (resolventHasseAt f hp hf a (s+1)).comp (ContinuousLinearMap.id A M - a • f) -
        (resolventHasseAt f hp hf a s).comp f =
      entire_eval (hasseSeries (s+1) (fredholmSeriesPr f hp hf)) a •
        ContinuousLinearMap.id A M := by sorry

include hA hNoeth hCompleteA hCompleteM in
/-- L4/hasse-polynomial-closure: closure in the existing K-operator norm. -/
theorem resolventHasseAt_mem_closure (f : M →L[A] M) (hp : HasPr A M)
    (hf : IsCompletelyContinuous f)
    (hbound : ∃ C : ℝ, 0 < C ∧ ∀ (b : A) (x : M), ‖b • x‖ ≤ C * ‖b‖ * ‖x‖)
    (a : A) (s : ℕ) :
    (resolventHasseAt f hp hf a s).restrictScalars K ∈
      closure {g : M →L[K] M | ∃ p : Polynomial A,
        g = ∑ i ∈ p.support, p.coeff i • (f.restrictScalars K)^i} := by sorry

include K hA hNoeth hCompleteA hCompleteM in
/-- L4/hasse-resolvent-commutation: all the values commute, even at distinct points. -/
theorem resolventHasseAt_commute (f : M →L[A] M) (hp : HasPr A M)
    (hf : IsCompletelyContinuous f)
    (hbound : ∃ C : ℝ, 0 < C ∧ ∀ (b : A) (x : M), ‖b • x‖ ≤ C * ‖b‖ * ‖x‖)
    (a b : A) (s t : ℕ) :
    Commute (resolventHasseAt f hp hf a s) f ∧
      Commute (resolventHasseAt f hp hf a s) (resolventHasseAt f hp hf b t) := by sorry

-- Test hasse_scalar_resolvent: positive Hasse order of the identity numerator vanishes.
include K hA hNoeth hCompleteA hCompleteM in
example (a t : A) (hp : HasPr A A)
    (h : IsCompletelyContinuous (a • ContinuousLinearMap.id A A)) :
    resolventHasseAt (a • ContinuousLinearMap.id A A) hp h t 1 = 0 := by sorry

-- Test hasse_diagonal_resolvent: the coefficient on each axis uses the other eigenvalue.
include K hA hNoeth hCompleteA hCompleteM in
example (a b t : A) (hp : HasPr A C₀(Fin 2, A))
    (h : IsCompletelyContinuous (finiteMatrixOperator (diagonalTwo a b))) :
    resolventHasseAt (finiteMatrixOperator (diagonalTwo a b)) hp h t 1 =
      finiteMatrixOperator (diagonalTwo (-b) (-a)) := by sorry

-- Test hasse_nilpotent_resolvent: determinant one does not make the derivative zero.
include K hA hNoeth hCompleteA hCompleteM in
example (t : A) (hp : HasPr A C₀(Fin 2, A))
    (h : IsCompletelyContinuous (finiteMatrixOperator (nilpotentTwo (A := A)))) :
    resolventHasseAt (finiteMatrixOperator (nilpotentTwo (A := A))) hp h t 1 =
      finiteMatrixOperator (nilpotentTwo (A := A)) := by sorry

/-- L4/riesz-projector-formula. E projects onto the nilpotent summand.
The positive Hasse coefficient is a unit of A; no inverse of a nonunit is used. -/
def rieszRootProjector (f : M →L[A] M) (hp : HasPr A M)
    (hf : IsCompletelyContinuous f) (a : A) (h : ℕ) (c : Aˣ) : M →L[A] M := by sorry

theorem rieszRootProjector_formula (f : M →L[A] M) (hp : HasPr A M)
    (hf : IsCompletelyContinuous f) (a : A) (h : ℕ) (c : Aˣ) :
    rieszRootProjector f hp hf a h c = 1 -
      ((ContinuousLinearMap.id A M - a • f) *
        ((↑(c⁻¹) : A) • resolventHasseAt f hp hf a h))^h := by sorry

theorem rieszRootProjector_zero_order (f : M →L[A] M) (hp : HasPr A M)
    (hf : IsCompletelyContinuous f) (a : A) (c : Aˣ) :
    rieszRootProjector f hp hf a 0 c = 0 := by sorry

include K hA hNoeth hCompleteA hCompleteM in
/-- L4/hasse-lower-annihilation: induction on the actual evaluated recurrence. -/
theorem resolventHasseAt_lower_annihilation (f : M →L[A] M) (hp : HasPr A M) (hf : IsCompletelyContinuous f)
    (hbound : ∃ C : ℝ, 0 < C ∧ ∀ (b : A) (x : M), ‖b • x‖ ≤ C * ‖b‖ * ‖x‖)
    (a : A) (h : ℕ) (c : Aˣ)
    (hlower : ∀ s < h, entire_eval (hasseSeries s (fredholmSeriesPr f hp hf)) a = 0)
    (hc : entire_eval (hasseSeries h (fredholmSeriesPr f hp hf)) a = (c : A)) :
    ∀ s < h, (ContinuousLinearMap.id A M - a • f)^(s+1) * resolventHasseAt f hp hf a s = 0 := by sorry

include K hA hNoeth hCompleteA hCompleteM in
/-- L4/hasse-normalized-annihilation; order zero uses the original resolvent identity. -/
theorem resolventHasseAt_normalized_annihilation (f : M →L[A] M) (hp : HasPr A M) (hf : IsCompletelyContinuous f)
    (hbound : ∃ C : ℝ, 0 < C ∧ ∀ (b : A) (x : M), ‖b • x‖ ≤ C * ‖b‖ * ‖x‖)
    (a : A) (h : ℕ) (c : Aˣ)
    (hlower : ∀ s < h, entire_eval (hasseSeries s (fredholmSeriesPr f hp hf)) a = 0)
    (hc : entire_eval (hasseSeries h (fredholmSeriesPr f hp hf)) a = (c : A)) :
    Commute (ContinuousLinearMap.id A M - a • f) ((↑(c⁻¹) : A) • resolventHasseAt f hp hf a h) ∧
    (ContinuousLinearMap.id A M - a • f)^h * (1 - (ContinuousLinearMap.id A M - a • f) * ((↑(c⁻¹) : A) • resolventHasseAt f hp hf a h)) = 0 := by sorry

include K hA hNoeth hCompleteA hCompleteM in
/-- L4/riesz-projector-idempotence. -/
theorem rieszRootProjector_idempotent (f : M →L[A] M) (hp : HasPr A M) (hf : IsCompletelyContinuous f)
    (hbound : ∃ C : ℝ, 0 < C ∧ ∀ (b : A) (x : M), ‖b • x‖ ≤ C * ‖b‖ * ‖x‖)
    (a : A) (h : ℕ) (c : Aˣ)
    (hlower : ∀ s < h, entire_eval (hasseSeries s (fredholmSeriesPr f hp hf)) a = 0)
    (hc : entire_eval (hasseSeries h (fredholmSeriesPr f hp hf)) a = (c : A)) :
    IsIdempotentElem (rieszRootProjector f hp hf a h c) := by sorry

include K hA hNoeth hCompleteA hCompleteM in
/-- L4/riesz-kernel-image: the exact exponent h is retained. -/
theorem rieszRootProjector_range_ker (f : M →L[A] M) (hp : HasPr A M) (hf : IsCompletelyContinuous f)
    (hbound : ∃ C : ℝ, 0 < C ∧ ∀ (b : A) (x : M), ‖b • x‖ ≤ C * ‖b‖ * ‖x‖)
    (a : A) (h : ℕ) (c : Aˣ)
    (hlower : ∀ s < h, entire_eval (hasseSeries s (fredholmSeriesPr f hp hf)) a = 0)
    (hc : entire_eval (hasseSeries h (fredholmSeriesPr f hp hf)) a = (c : A)) :
    (rieszRootProjector f hp hf a h c).range = ((ContinuousLinearMap.id A M - a • f)^h).ker ∧
    (rieszRootProjector f hp hf a h c).ker = ((ContinuousLinearMap.id A M - a • f)^h).range := by sorry

include K hA hNoeth hCompleteA hCompleteM in
/-- API: the image is precisely the generalized zero space. -/
theorem rieszRootProjector_fixed_iff (f : M →L[A] M) (hp : HasPr A M) (hf : IsCompletelyContinuous f)
    (hbound : ∃ C : ℝ, 0 < C ∧ ∀ (b : A) (x : M), ‖b • x‖ ≤ C * ‖b‖ * ‖x‖)
    (a : A) (h : ℕ) (c : Aˣ)
    (hlower : ∀ s < h, entire_eval (hasseSeries s (fredholmSeriesPr f hp hf)) a = 0)
    (hc : entire_eval (hasseSeries h (fredholmSeriesPr f hp hf)) a = (c : A)) (x : M) :
    rieszRootProjector f hp hf a h c x = x ↔ ((ContinuousLinearMap.id A M - a • f)^h) x = 0 := by sorry

include K hA hNoeth hCompleteA hCompleteM in
/-- L4/riesz-topological-splitting: native topological complement, no finite-rank conclusion. -/
theorem rieszRootProjector_topological_split (f : M →L[A] M) (hp : HasPr A M) (hf : IsCompletelyContinuous f)
    (hbound : ∃ C : ℝ, 0 < C ∧ ∀ (b : A) (x : M), ‖b • x‖ ≤ C * ‖b‖ * ‖x‖)
    (a : A) (h : ℕ) (c : Aˣ)
    (hlower : ∀ s < h, entire_eval (hasseSeries s (fredholmSeriesPr f hp hf)) a = 0)
    (hc : entire_eval (hasseSeries h (fredholmSeriesPr f hp hf)) a = (c : A)) :
    Submodule.IsTopCompl ((ContinuousLinearMap.id A M - a • f)^h).ker ((ContinuousLinearMap.id A M - a • f)^h).range ∧
    IsClosed (((ContinuousLinearMap.id A M - a • f)^h).ker : Set M) ∧ IsClosed (((ContinuousLinearMap.id A M - a • f)^h).range : Set M) := by sorry

include K hA hNoeth hCompleteA hCompleteM in
/-- L4/riesz-regular-inverse: restrictions of these existing continuous maps are mutual inverses. -/
theorem rieszRootProjector_regular_inverse (f : M →L[A] M) (hp : HasPr A M) (hf : IsCompletelyContinuous f)
    (hbound : ∃ C : ℝ, 0 < C ∧ ∀ (b : A) (x : M), ‖b • x‖ ≤ C * ‖b‖ * ‖x‖)
    (a : A) (h : ℕ) (c : Aˣ)
    (hlower : ∀ s < h, entire_eval (hasseSeries s (fredholmSeriesPr f hp hf)) a = 0)
    (hc : entire_eval (hasseSeries h (fredholmSeriesPr f hp hf)) a = (c : A)) :
    Set.MapsTo (ContinuousLinearMap.id A M - a • f) (((ContinuousLinearMap.id A M - a • f)^h).range : Set M) (((ContinuousLinearMap.id A M - a • f)^h).range : Set M) ∧
    Set.MapsTo ((↑(c⁻¹) : A) • resolventHasseAt f hp hf a h) (((ContinuousLinearMap.id A M - a • f)^h).range : Set M) (((ContinuousLinearMap.id A M - a • f)^h).range : Set M) ∧
    ∀ x ∈ ((ContinuousLinearMap.id A M - a • f)^h).range, (ContinuousLinearMap.id A M - a • f) (((↑(c⁻¹) : A) • resolventHasseAt f hp hf a h) x) = x ∧ ((↑(c⁻¹) : A) • resolventHasseAt f hp hf a h) ((ContinuousLinearMap.id A M - a • f) x) = x := by sorry

include K hA hNoeth hCompleteA hCompleteM in
/-- L4/riesz-projector-closure: operator-norm closure of the actual A-polynomials in f. -/
theorem rieszRootProjector_mem_closure (f : M →L[A] M) (hp : HasPr A M) (hf : IsCompletelyContinuous f)
    (hbound : ∃ C : ℝ, 0 < C ∧ ∀ (b : A) (x : M), ‖b • x‖ ≤ C * ‖b‖ * ‖x‖)
    (a : A) (h : ℕ) (c : Aˣ)
    (hlower : ∀ s < h, entire_eval (hasseSeries s (fredholmSeriesPr f hp hf)) a = 0)
    (hc : entire_eval (hasseSeries h (fredholmSeriesPr f hp hf)) a = (c : A)) :
    (rieszRootProjector f hp hf a h c).restrictScalars K ∈
      closure {g : M →L[K] M | ∃ p : Polynomial A,
        g = ∑ i ∈ p.support, p.coeff i • (f.restrictScalars K)^i} := by sorry

include K hA hNoeth hCompleteA hCompleteM in
/-- L4/riesz-commuting-stability: every continuous A-linear operator commuting with f preserves both summands. -/
theorem rieszRootProjector_commute (f : M →L[A] M) (hp : HasPr A M) (hf : IsCompletelyContinuous f)
    (hbound : ∃ C : ℝ, 0 < C ∧ ∀ (b : A) (x : M), ‖b • x‖ ≤ C * ‖b‖ * ‖x‖)
    (a : A) (h : ℕ) (c : Aˣ)
    (hlower : ∀ s < h, entire_eval (hasseSeries s (fredholmSeriesPr f hp hf)) a = 0)
    (hc : entire_eval (hasseSeries h (fredholmSeriesPr f hp hf)) a = (c : A)) (t : M →L[A] M) (ht : Commute f t) :
    Commute (rieszRootProjector f hp hf a h c) t := by sorry

include K hA hNoeth hCompleteA hCompleteM in
/-- API: compatibility with the existing native continuous projection. -/
theorem rieszRootProjector_eq_projectionL (f : M →L[A] M) (hp : HasPr A M) (hf : IsCompletelyContinuous f)
    (hbound : ∃ C : ℝ, 0 < C ∧ ∀ (b : A) (x : M), ‖b • x‖ ≤ C * ‖b‖ * ‖x‖)
    (a : A) (h : ℕ) (c : Aˣ)
    (hlower : ∀ s < h, entire_eval (hasseSeries s (fredholmSeriesPr f hp hf)) a = 0)
    (hc : entire_eval (hasseSeries h (fredholmSeriesPr f hp hf)) a = (c : A)) :
    ∃ ht : Submodule.IsTopCompl ((ContinuousLinearMap.id A M - a • f)^h).ker ((ContinuousLinearMap.id A M - a • f)^h).range,
    rieszRootProjector f hp hf a h c = (((ContinuousLinearMap.id A M - a • f)^h).ker).projectionL ((ContinuousLinearMap.id A M - a • f)^h).range ht := by sorry

-- Test riesz_order_zero: the empty root space is zero, for every endomorphism.
example (f : M →L[A] M) (hp : HasPr A M) (hf : IsCompletelyContinuous f)
    (a : A) (c : Aˣ) : rieszRootProjector f hp hf a 0 c = 0 := by sorry

-- Test riesz_scalar_root: the root projection on the identity line is the identity.
include K hA hNoeth hCompleteA in
example (hp : HasPr A A) (hf : IsCompletelyContinuous (ContinuousLinearMap.id A A)) :
    rieszRootProjector (ContinuousLinearMap.id A A) hp hf 1 1 (-1) = 1 := by sorry

-- Test riesz_diagonal_root: select the first axis, not its regular complement.
include K hA hNoeth hCompleteA in
example (hp : HasPr A C₀(Fin 2, A))
    (hf : IsCompletelyContinuous (finiteMatrixOperator (diagonalTwo (1:A) 0))) :
    rieszRootProjector (finiteMatrixOperator (diagonalTwo (1:A) 0)) hp hf 1 1 (-1) =
      finiteMatrixOperator (diagonalTwo (1:A) 0) := by sorry

-- Test riesz_jordan_root: generalized eigenspace, not ordinary eigenspace.
include K hA hNoeth hCompleteA in
example (hp : HasPr A C₀(Fin 2, A))
    (hf : IsCompletelyContinuous (1 + finiteMatrixOperator (nilpotentTwo (A:=A)))) :
    rieszRootProjector (1 + finiteMatrixOperator (nilpotentTwo (A:=A))) hp hf 1 2 1 = 1 ∧
      (1 - (1 + finiteMatrixOperator (nilpotentTwo (A:=A))) : C₀(Fin 2,A) →L[A] C₀(Fin 2,A)) ≠ 0 := by sorry

end FredholmPr

/- Explicit transcription worklist (not substituted by Prop placeholders):

* API fredholmSeriesPr_baseChange: select/audit the completed tensor carrier and
  universal property; retain a continuous, not necessarily contractive, A -> B.
* Riesz/slope signatures need finite-projective determinant, fibre rank and
  the spectral-resultant interfaces. The adjugate estimate and Hasse evaluation signatures are now explicit. Do not weaken to a Prop field, pointwise eigenspaces, assumed
  constant rank or just power-annihilation by Q*(u).
* Remaining signatures: finite-module topology and detection norm bounds, completed base change,
  lifting characterization, finite projectivity, direct-sum determinant, entire
  division and the spectral-resultant invertibility criterion.
* On elaboration check every remaining carrier, instance and helper definition
  against the packet. In particular supply the coordinate values of c0Single,
  projections, diagonalOperator and finiteMatrixOperator; no implementation is
  claimed by their current value-valued proof holes.

The analytic Fredholm theorems explicitly include hA rather than relying on an
unused section variable. The scope remains partial. All 27 inherited packet tests are Lean examples;
the completed-tensor base-change API is still omitted for the stated reason.
-/
end TauCeti.NonarchimedeanFredholm

/-!
Adjugate estimates and finite-coordinate passage to the Fredholm resolvent.
Intermediate sequences satisfy the algebraic recurrence explicitly; no hypothesis
assumes the analytic bound or entireness being proved. Matrices are input-first.
-/
namespace TauCeti.NonarchimedeanFredholm
open scoped Matrix
universe u v w
variable {K A : Type u}
variable [NontriviallyNormedField K] [CompleteSpace K]
variable [NormedCommRing A] [NormOneClass A] [Nontrivial A]
variable [NormedAlgebra K A] [CompleteSpace A] [IsNoetherianRing A]
variable {I : Type w} [TopologicalSpace I] [DiscreteTopology I] [DecidableEq I]

-- L4/finite-coordinate-projection: the existing helper is now a packet construction.
-- L4/finite-coordinate-projection-evaluation
 theorem coordinateProjection_apply (T : Finset I) (x : C₀(I,A)) (j : I) :
    coordinateProjection T x j = if j ∈ T then x j else 0 := by sorry

theorem coordinateProjection_empty :
    coordinateProjection (A := A) (∅ : Finset I) = 0 := by sorry

theorem coordinateProjection_inter (T S : Finset I) :
    (coordinateProjection (A := A) T).comp (coordinateProjection S) =
      coordinateProjection (T ∩ S) := by sorry

theorem coordinateProjection_single (T : Finset I) (j : I) (a : A) :
    coordinateProjection T (c0Single j a) = if j ∈ T then c0Single j a else 0 := by sorry

-- L4/finite-coordinate-projection-bound: signature coordinateProjection_norm_le
-- already appears above and is promoted with the same statement and hypotheses.

-- L4/c0-operator-norm-criterion
 theorem c0_operator_norm_le_iff
    (hA : ∀ x y : A, ‖x+y‖ ≤ max ‖x‖ ‖y‖)
    (f : C₀(I,A) →L[A] C₀(I,A)) (C : ℝ) (hC : 0 ≤ C) :
    ‖f.restrictScalars K‖ ≤ C ↔ ∀ i, ‖f (c0Single i (1 : A))‖ ≤ C := by sorry

-- L4/finite-adjugate-recurrence
 theorem finite_adjugate_recurrence {d : ℕ} (D : Matrix (Fin d) (Fin d) A) (n : ℕ) :
    (fun i j : Fin d => ((Matrix.adjugate (1 - (Polynomial.X : Polynomial A) • D.map (Polynomial.C : A →+* Polynomial A))) i j).coeff 0) =
      (1 : Matrix (Fin d) (Fin d) A) ∧
    (fun i j : Fin d => ((Matrix.adjugate (1 - (Polynomial.X : Polynomial A) • D.map (Polynomial.C : A →+* Polynomial A))) i j).coeff (n+1)) =
      ((Matrix.det (1 - (Polynomial.X : Polynomial A) • D.map (Polynomial.C : A →+* Polynomial A))).coeff (n+1)) • (1 : Matrix (Fin d) (Fin d) A) +
        Matrix.of (fun i j : Fin d => ((Matrix.adjugate (1 - (Polynomial.X : Polynomial A) • D.map (Polynomial.C : A →+* Polynomial A))) i j).coeff n) * D := by sorry

-- L4/finite-adjugate-coefficient-bound
 theorem finite_adjugate_coeff_bound {d : ℕ}
    (hA : ∀ x y : A, ‖x+y‖ ≤ max ‖x‖ ‖y‖)
    (D : Matrix (Fin d) (Fin d) A) (b : Fin d → ℝ)
    (hb0 : ∀ j, 0 ≤ b j) (hb : ∀ i j, ‖D i j‖ ≤ b j)
    (n : ℕ) (C : ℝ) (hC : 0 ≤ C)
    (hprod : ∀ S : Finset (Fin d), S.card = n → ∏ j ∈ S, b j ≤ C) (i j : Fin d) :
    ‖((Matrix.adjugate (1 - (Polynomial.X : Polynomial A) • D.map (Polynomial.C : A →+* Polynomial A))) i j).coeff n‖ ≤ C := by sorry

-- L4/finite-coordinate-resolvent-comparison
 theorem finite_coordinate_resolvent_comparison
    (hA : ∀ x y : A, ‖x+y‖ ≤ max ‖x‖ ‖y‖)
    (f : C₀(I,A) →L[A] C₀(I,A)) (hf : IsCompletelyContinuous f)
    (V : ℕ → C₀(I,A) →L[A] C₀(I,A)) (hV0 : V 0 = ContinuousLinearMap.id A _)
    (hV : ∀ n, V (n+1) = (fredholmSeries f hf).coeff (n+1) •
      ContinuousLinearMap.id A _ + f.comp (V n))
    (J L : Finset I) (hJL : J ⊆ L)
    (hJ : ∀ i j, j ∉ J → operatorEntry f i j = 0) (n : ℕ) (i j : ↥L) :
    operatorEntry (V n) i j =
      ((Matrix.adjugate (1 - (Polynomial.X : Polynomial A) •
        (fun a b : ↥L => Polynomial.C (operatorEntry f a b)))) i j).coeff n := by sorry

-- L4/finite-output-resolvent-bound
 theorem finite_output_resolvent_bound
    (hA : ∀ x y : A, ‖x+y‖ ≤ max ‖x‖ ‖y‖)
    (f : C₀(I,A) →L[A] C₀(I,A)) (hf : IsCompletelyContinuous f)
    (V : ℕ → C₀(I,A) →L[A] C₀(I,A)) (hV0 : V 0 = ContinuousLinearMap.id A _)
    (hV : ∀ n, V (n+1) = (fredholmSeries f hf).coeff (n+1) •
      ContinuousLinearMap.id A _ + f.comp (V n))
    (J : Finset I) (hJ : ∀ i j, j ∉ J → operatorEntry f i j = 0)
    (b : I → ℝ) (hb0 : ∀ j, 0 ≤ b j) (hb : ∀ j, columnSize f j ≤ b j)
    (n : ℕ) (C : ℝ) (hC : 0 ≤ C)
    (hprod : ∀ S : Finset I, S.card = n → ∏ j ∈ S, b j ≤ C) :
    ‖(V n).restrictScalars K‖ ≤ C := by sorry

-- L4/resolvent-coefficient-continuity: arbitrary filters include finite-subset nets.
 theorem recurrence_coefficient_tendsto {ι : Type*} (l : Filter ι)
    (f : ι → C₀(I,A) →L[A] C₀(I,A)) (g : C₀(I,A) →L[A] C₀(I,A))
    (c : ι → ℕ → A) (d : ℕ → A)
    (V : ι → ℕ → C₀(I,A) →L[A] C₀(I,A)) (W : ℕ → C₀(I,A) →L[A] C₀(I,A))
    (hV0 : ∀ i, V i 0 = ContinuousLinearMap.id A _)
    (hW0 : W 0 = ContinuousLinearMap.id A _)
    (hV : ∀ i n, V i (n+1) = c i (n+1) • ContinuousLinearMap.id A _ + (f i).comp (V i n))
    (hW : ∀ n, W (n+1) = d (n+1) • ContinuousLinearMap.id A _ + g.comp (W n))
    (hf : Tendsto (fun i => (f i).restrictScalars K) l (𝓝 (g.restrictScalars K)))
    (hc : ∀ n, Tendsto (fun i => c i n) l (𝓝 (d n))) (n : ℕ) :
    Tendsto (fun i => (V i n).restrictScalars K) l (𝓝 ((W n).restrictScalars K)) := by sorry

-- L4/resolvent-coefficient-bound
 theorem resolvent_recurrence_norm_bound
    (hA : ∀ x y : A, ‖x+y‖ ≤ max ‖x‖ ‖y‖)
    (f : C₀(I,A) →L[A] C₀(I,A)) (hf : IsCompletelyContinuous f)
    (V : ℕ → C₀(I,A) →L[A] C₀(I,A)) (hV0 : V 0 = ContinuousLinearMap.id A _)
    (hV : ∀ n, V (n+1) = (fredholmSeries f hf).coeff (n+1) •
      ContinuousLinearMap.id A _ + f.comp (V n))
    (b : I → ℝ) (hb0 : ∀ j, 0 ≤ b j) (hb : ∀ j, columnSize f j ≤ b j)
    (n : ℕ) (C : ℝ) (hC : 0 ≤ C)
    (hprod : ∀ S : Finset I, S.card = n → ∏ j ∈ S, b j ≤ C) :
    ‖(V n).restrictScalars K‖ ≤ C := by sorry

-- L4/resolvent-tail-bound
 theorem resolvent_recurrence_tail_bound
    (hA : ∀ x y : A, ‖x+y‖ ≤ max ‖x‖ ‖y‖)
    (f : C₀(I,A) →L[A] C₀(I,A)) (hf : IsCompletelyContinuous f)
    (V : ℕ → C₀(I,A) →L[A] C₀(I,A)) (hV0 : V 0 = ContinuousLinearMap.id A _)
    (hV : ∀ n, V (n+1) = (fredholmSeries f hf).coeff (n+1) •
      ContinuousLinearMap.id A _ + f.comp (V n))
    (b : I → ℝ) (hb0 : ∀ j, 0 ≤ b j) (hb : ∀ j, columnSize f j ≤ b j)
    (L : ℝ) (hL : ∀ j, b j ≤ L) (R q : ℝ)
    (hR : 0 < R) (hq : 0 < q) (hq' : q < 1)
    (T : Finset I) (hT : ∀ j, j ∉ T → R*b j ≤ q) (n : ℕ) :
    ‖(V n).restrictScalars K‖ * R^n ≤
      (max 1 (R*L))^T.card * q^(n-T.card) := by sorry

variable {M : Type v} [NormedAddCommGroup M] [NormedSpace K M]
variable [Module A M] [IsScalarTower K A M] [ContinuousSMul A M] [CompleteSpace M]

-- L4/resolvent-retraction-comparison
 theorem recurrence_retraction (f : M →L[A] M)
    (i : M →L[A] C₀(I,A)) (r : C₀(I,A) →L[A] M)
    (hri : r.comp i = ContinuousLinearMap.id A M) (c : ℕ → A)
    (V : ℕ → M →L[A] M) (W : ℕ → C₀(I,A) →L[A] C₀(I,A))
    (hV0 : V 0 = ContinuousLinearMap.id A _) (hW0 : W 0 = ContinuousLinearMap.id A _)
    (hV : ∀ n, V (n+1) = c (n+1) • ContinuousLinearMap.id A _ + f.comp (V n))
    (hW : ∀ n, W (n+1) = c (n+1) • ContinuousLinearMap.id A _ +
      (i.comp (f.comp r)).comp (W n)) (n : ℕ) :
    r.comp ((W n).comp i) = V n := by sorry

-- L4/resolvent-recurrence-entire
 theorem resolvent_recurrence_entire
    (hA : ∀ x y : A, ‖x+y‖ ≤ max ‖x‖ ‖y‖)
    (f : M →L[A] M) (hp : HasPr A M) (hf : IsCompletelyContinuous f)
    (V : ℕ → M →L[A] M) (hV0 : V 0 = ContinuousLinearMap.id A _)
    (hV : ∀ n, V (n+1) = (fredholmSeriesPr f hp hf).coeff (n+1) •
      ContinuousLinearMap.id A _ + f.comp (V n)) (R : ℝ) (hR : 0 < R) :
    Tendsto (fun n => ‖(V n).restrictScalars K‖ * R^n) atTop (𝓝 0) := by sorry

-- The constructor's initial-coefficient API, used to instantiate the estimates.
theorem resolventCoeff_zero (f : M →L[A] M) (hp : HasPr A M)
    (hf : IsCompletelyContinuous f) : resolventCoeff f hp hf 0 = ContinuousLinearMap.id A M := by sorry

-- Test projection_empty_support.
example (x : C₀(I,A)) : coordinateProjection (∅ : Finset I) x = 0 := by sorry
-- Test projection_selected_coordinate.
example (j : I) (a : A) : coordinateProjection {j} (c0Single j a) = c0Single j a := by sorry
-- Test projection_rejected_coordinate.
example (i j : I) (a : A) (h : i ≠ j) : coordinateProjection {i} (c0Single j a) = 0 := by sorry

-- Test adjugate_rank_one.
example (a : A) :
    Matrix.adjugate (1 - (Polynomial.X : Polynomial A) • (fun _ _ : Fin 1 => Polynomial.C a)) = 1 := by sorry
-- Test adjugate_diagonal_two.
example (a b : A) :
    Matrix.adjugate (1 - (Polynomial.X : Polynomial A) • (diagonalTwo a b).map (Polynomial.C : A →+* Polynomial A)) =
      (fun i j : Fin 2 => if i=j then
        if i=0 then 1-Polynomial.C b*(Polynomial.X : Polynomial A) else 1-Polynomial.C a*(Polynomial.X : Polynomial A) else 0) := by sorry
-- Test adjugate_nilpotent_two.
example : Matrix.adjugate (1 - (Polynomial.X : Polynomial A) • (nilpotentTwo (A := A)).map (Polynomial.C : A →+* Polynomial A)) =
    1 + (Polynomial.X : Polynomial A) • (nilpotentTwo (A := A)).map (Polynomial.C : A →+* Polynomial A) := by sorry
-- Test finite_output_support_is_not_enough_for_input.
example (a : A) :
    ((Matrix.adjugate (1 - (Polynomial.X : Polynomial A) • (diagonalTwo a 0).map (Polynomial.C : A →+* Polynomial A))) 1 1).coeff 1 = -a ∧
    ((Matrix.adjugate (1 - (Polynomial.X : Polynomial A) • (diagonalTwo a 0).map (Polynomial.C : A →+* Polynomial A))) 0 0).coeff 1 = 0 := by sorry
end TauCeti.NonarchimedeanFredholm

/-! Riesz finite generation and projectivity. The geometric statements need only
continuous A-scalar multiplication; no unit hypothesis on the root parameter.
This section extends the existing native kernel and (Pr) interfaces. -/
namespace TauCeti.NonarchimedeanFredholm
section RieszFiniteness
universe u v
variable {A : Type u} {M : Type v} [NormedCommRing A]
  [NormedAddCommGroup M] [Module A M] [ContinuousSMul A M]

/-- L4/riesz-geometric-factor. -/
lemma riesz_geometric_factor (u : M →L[A] M) (a : A) (h : ℕ) :
    let B := a • ∑ j ∈ Finset.range h, (1-a • u)^j
    u * B = 1-(1-a • u)^h ∧ B * u = 1-(1-a • u)^h := by sorry

/-- L4/riesz-kernel-operator-equiv. Its inverse is the finite geometric sum. -/
def rieszKernelOperatorEquiv (u : M →L[A] M) (a : A) (h : ℕ) :
    ((1-a • u)^h).ker ≃L[A] ((1-a • u)^h).ker := by sorry

lemma rieszKernelOperatorEquiv_apply (u : M →L[A] M) (a : A) (h : ℕ)
    (x : ((1-a • u)^h).ker) :
    (rieszKernelOperatorEquiv u a h x : M) = u x := by sorry

lemma rieszKernelOperatorEquiv_symm_apply (u : M →L[A] M) (a : A) (h : ℕ)
    (x : ((1-a • u)^h).ker) :
    ((rieszKernelOperatorEquiv u a h).symm x : M) =
      (a • ∑ j ∈ Finset.range h, (1-a • u)^j) x := by sorry

lemma rieszKernelOperatorEquiv_subtype (u : M →L[A] M) (a : A) (h : ℕ) :
    ((1-a • u)^h).ker.subtypeL.comp (rieszKernelOperatorEquiv u a h).toContinuousLinearMap =
      u.comp ((1-a • u)^h).ker.subtypeL := by sorry

-- Test riesz_inverse_order_zero.
example (u : M →L[A] M) (a : A) (x : ((1-a • u)^0).ker) :
    (x : M) = 0 ∧ rieszKernelOperatorEquiv u a 0 x = 0 := by sorry

-- Test riesz_inverse_zero_parameter.
example (u : M →L[A] M) (h : ℕ) (x : ((1-(0:A) • u)^h).ker) :
    (x : M) = 0 ∧ (rieszKernelOperatorEquiv u 0 h).symm x = 0 := by sorry

-- Test riesz_inverse_identity.
example (h : ℕ) (x : ((1-(1:A) • (1 : M →L[A] M))^h).ker) :
    rieszKernelOperatorEquiv (1 : M →L[A] M) 1 h x = x ∧
    (rieszKernelOperatorEquiv (1 : M →L[A] M) 1 h).symm x = x := by sorry

-- Test riesz_inverse_jordan: a nontrivial inverse, even in characteristic two.
example (j : M →L[A] M) (hj : j^2 = 0)
    (x : ((1-(1:A) • (1+j))^2).ker) :
    ((rieszKernelOperatorEquiv (1+j) 1 2).symm x : M) = (1-j) x := by sorry

/-- L4/riesz-kernel-pr. No Fredholm hypotheses are needed for this retraction. -/
lemma riesz_kernel_hasPr (u : M →L[A] M) (a : A) (h : ℕ)
    (F : Submodule A M) (ht : Submodule.IsTopCompl ((1-a • u)^h).ker F)
    (hp : HasPr A M) : HasPr A ((1-a • u)^h).ker := by sorry

variable {K : Type u} [NontriviallyNormedField K] [CompleteSpace K]
  [NormOneClass A] [Nontrivial A] [NormedAlgebra K A] [CompleteSpace A]
  [hNoeth : IsNoetherianRing A] [NormedSpace K M] [IsScalarTower K A M]
  [CompleteSpace M]

/-- L4/riesz-compressed-approximation. The approximant need not preserve the kernel. -/
lemma riesz_compressed_approximation (u α : M →L[A] M) (a : A) (h : ℕ)
    (F : Submodule A M) (ht : Submodule.IsTopCompl ((1-a • u)^h).ker F)
    (hα : HasFiniteAImage α) :
    let N := ((1-a • u)^h).ker
    let B := a • ∑ j ∈ Finset.range h, (1-a • u)^j
    let l := (N.projectionOntoL F ht).comp B
    let β := l.comp (α.comp N.subtypeL)
    HasFiniteAImage β ∧
      ‖(ContinuousLinearMap.id A N - β).restrictScalars K‖ ≤
      (‖l.restrictScalars K‖ * ‖N.subtypeL.restrictScalars K‖) *
        ‖(u-α).restrictScalars K‖ := by sorry

include K hNoeth in
/-- L4/riesz-kernel-compact-identity. -/
lemma riesz_kernel_identity_completelyContinuous (u : M →L[A] M) (a : A) (h : ℕ)
    (F : Submodule A M) (ht : Submodule.IsTopCompl ((1-a • u)^h).ker F)
    (hu : IsCompletelyContinuous u) :
    IsCompletelyContinuous (ContinuousLinearMap.id A ((1-a • u)^h).ker) := by sorry

include K hNoeth in
/-- L4/riesz-kernel-finite: completeness of the native closed kernel is automatic. -/
theorem riesz_kernel_finite (u : M →L[A] M) (a : A) (h : ℕ)
    (F : Submodule A M) (ht : Submodule.IsTopCompl ((1-a • u)^h).ker F)
    (hu : IsCompletelyContinuous u) : Module.Finite A ((1-a • u)^h).ker := by sorry

include K hNoeth in
/-- Existing L4/finite-pr-projective. Canonical finite-module topology remains a gap. -/
theorem projective_of_finite_hasPr [Module.Finite A M] (hp : HasPr A M) :
    Module.Projective A M := by sorry

include K hNoeth in
/-- L4/riesz-kernel-projective; no constant-rank conclusion is asserted here. -/
theorem riesz_kernel_projective (u : M →L[A] M) (a : A) (h : ℕ)
    (F : Submodule A M) (ht : Submodule.IsTopCompl ((1-a • u)^h).ker F)
    (hu : IsCompletelyContinuous u) (hp : HasPr A M) :
    Module.Projective A ((1-a • u)^h).ker := by sorry

end RieszFiniteness
end TauCeti.NonarchimedeanFredholm

/-! Fredholm coefficients: finite bounds and cofinite summability.
These signatures specify the arguments; their proof placeholders claim no implementation.
-/
namespace TauCeti.NonarchimedeanFredholm
noncomputable section
open Filter Topology
open scoped BigOperators

section FiniteCoefficientBounds
variable {A I : Type*} [NormedCommRing A] [NormOneClass A]

-- L4/ultrametric-product-perturbation
theorem ultrametric_product_perturbation
    (hA : ∀ x y : A, ‖x + y‖ ≤ max ‖x‖ ‖y‖)
    (S : Finset I) (f g : I → A) (C δ : ℝ)
    (hC : 1 ≤ C) (hδ : 0 ≤ δ)
    (hf : ∀ i ∈ S, ‖f i‖ ≤ C) (hg : ∀ i ∈ S, ‖g i‖ ≤ C)
    (hd : ∀ i ∈ S, ‖f i - g i‖ ≤ δ) :
    ‖(∏ i ∈ S, f i) - ∏ i ∈ S, g i‖ ≤ δ * C^(S.card-1) := by sorry

-- L4/ultrametric-determinant-bound
theorem ultrametric_determinant_bound [Fintype I] [DecidableEq I]
    (hA : ∀ x y : A, ‖x + y‖ ≤ max ‖x‖ ‖y‖)
    (D : Matrix I I A) (b : I → ℝ) (hb : ∀ j, 0 ≤ b j)
    (hD : ∀ i j, ‖D i j‖ ≤ b j) : ‖D.det‖ ≤ ∏ j, b j := by sorry

-- L4/ultrametric-determinant-perturbation
theorem ultrametric_determinant_perturbation [Fintype I] [DecidableEq I]
    (hA : ∀ x y : A, ‖x + y‖ ≤ max ‖x‖ ‖y‖)
    (D E : Matrix I I A) (C δ : ℝ) (hC : 1 ≤ C) (hδ : 0 ≤ δ)
    (hD : ∀ i j, ‖D i j‖ ≤ C) (hE : ∀ i j, ‖E i j‖ ≤ C)
    (hDE : ∀ i j, ‖D i j - E i j‖ ≤ δ) :
    ‖D.det - E.det‖ ≤ δ * C^(Fintype.card I-1) := by sorry

-- L4/fixed-degree-minors-null: no countability, Noetherianity or completeness here.
theorem fixed_degree_minors_null [DecidableEq I]
    (hA : ∀ x y : A, ‖x + y‖ ≤ max ‖x‖ ‖y‖)
    (a : I → I → A) (b : I → ℝ) (hb0 : ∀ j, 0 ≤ b j)
    (hb : Tendsto b cofinite (𝓝 0)) (hbd : ∃ C : ℝ, ∀ j, b j ≤ C)
    (ha : ∀ i j, ‖a i j‖ ≤ b j) (n : ℕ) :
    Tendsto (fun S : {S : Finset I // S.card = n} =>
      Matrix.det (fun i j : ↥S.val => a i j)) cofinite (𝓝 0) := by sorry

-- Test native_finite_coefficient_formula: supplied by Mathlib for the existing comparison.
-- This is a native reference example, not another planned declaration.
example [Fintype I] [DecidableEq I] (D : Matrix I I A) (k : ℕ) :
    (Matrix.det (1 + (Polynomial.X : Polynomial A) • D.map Polynomial.C)).coeff k =
      ∑ S ∈ Finset.univ.powersetCard k,
        (D.submatrix (Subtype.val : S → I) (Subtype.val : S → I)).det := by sorry

-- Tests product_empty_difference, singleton_determinant_bound, determinant_empty_bound.
example (C δ : ℝ) (hC : 1 ≤ C) (hδ : 0 ≤ δ) (f g : I → A) :
    ‖(∏ i ∈ (∅ : Finset I), f i) - ∏ i ∈ (∅ : Finset I), g i‖ ≤ δ := by sorry
example (a : A) (b : ℝ) (hb : ‖a‖ ≤ b) :
    ‖Matrix.det (fun _ _ : Fin 1 => a)‖ ≤ b := by sorry
example : ‖(1 : Matrix (Fin 0) (Fin 0) A).det‖ = 1 := by sorry
end FiniteCoefficientBounds

-- L4/distinct-column-product-tail: the real combinatorics used before the infinite sum.
theorem distinct_column_product_tail {I : Type*} [DecidableEq I]
    (S T : Finset I) (b : I → ℝ) (B q : ℝ)
    (hB : 1 ≤ B) (hq : 0 ≤ q) (hq' : q ≤ 1)
    (hb0 : ∀ j, 0 ≤ b j) (hb : ∀ j, b j ≤ B)
    (hT : ∀ j, j ∉ T → b j ≤ q) :
    (∏ j ∈ S, b j) ≤ B^T.card * q^(S.card-T.card) := by sorry

section FiniteOutputComparison
variable {K A I : Type*}
variable [NontriviallyNormedField K] [CompleteSpace K]
variable [NormedCommRing A] [NormOneClass A] [Nontrivial A]
variable [NormedAlgebra K A] [CompleteSpace A] [IsNoetherianRing A]
variable [TopologicalSpace I] [DiscreteTopology I] [DecidableEq I]

-- Existing L4/finite-coordinate-determinant, now with its full typed conclusion.
include K in
theorem finite_coordinate_determinant
    (hA : ∀ x y : A, ‖x + y‖ ≤ max ‖x‖ ‖y‖)
    (f : C₀(I, A) →L[A] C₀(I, A)) (hf : IsCompletelyContinuous f)
    (S : Finset I) (hS : ∀ x j, j ∉ S → f x j = 0) :
    fredholmSeries f hf = polynomialSeries (Matrix.det
      (1 + (Polynomial.X : Polynomial A) •
        Matrix.map (-(fun i j : ↥S => operatorEntry f i j)) Polynomial.C)) := by sorry
end FiniteOutputComparison
end
end TauCeti.NonarchimedeanFredholm

/- Entire division by a linear factor. All nontrivial sum identities require
entireness; the total native coefficient construction makes no convergence
claim for arbitrary formal series. No Noetherian or field hypothesis is used. -/
namespace TauCeti.NonarchimedeanFredholm
variable {A : Type*} [NormedCommRing A] [NormOneClass A] [CompleteSpace A]

/-- L4/entire-tail-summable: m=0 includes the evaluation series. -/
theorem entire_tail_summable (f : PowerSeries A) (hf : IsEntire f) (a : A) (m : ℕ) :
    Summable (fun k : ℕ => f.coeff (m+k) * a^k) := by sorry

/-- L4/entire-linear-quotient: native formal-series constructor. -/
def entireLinearQuotient (a : A) (f : PowerSeries A) : PowerSeries A :=
  PowerSeries.mk (fun n => ∑' k : ℕ, f.coeff (n+1+k) * a^k)

/-- L4/entire-linear-quotient-coeff: promoted data API. -/
theorem entireLinearQuotient_coeff (a : A) (f : PowerSeries A) (n : ℕ) :
    (entireLinearQuotient a f).coeff n = ∑' k : ℕ, f.coeff (n+1+k) * a^k := by sorry

theorem entireLinearQuotient_zero (a : A) :
    entireLinearQuotient a (0 : PowerSeries A) = 0 := by sorry

theorem entireLinearQuotient_add (a : A) (f g : PowerSeries A)
    (hf : IsEntire f) (hg : IsEntire g) :
    entireLinearQuotient a (f+g) = entireLinearQuotient a f + entireLinearQuotient a g := by sorry

theorem entireLinearQuotient_C_mul (a b : A) (f : PowerSeries A) (hf : IsEntire f) :
    entireLinearQuotient a (PowerSeries.C b * f) =
      PowerSeries.C b * entireLinearQuotient a f := by sorry

theorem entireLinearQuotient_C (a b : A) :
    entireLinearQuotient a (PowerSeries.C b) = 0 := by sorry

theorem entireLinearQuotient_at_zero (f : PowerSeries A) :
    entireLinearQuotient 0 f = PowerSeries.mk (fun n => f.coeff (n+1)) := by sorry

/-- L4/entire-linear-quotient-recurrence. -/
theorem entireLinearQuotient_recurrence (a : A) (f : PowerSeries A) (hf : IsEntire f) (n : ℕ) :
    (entireLinearQuotient a f).coeff n =
      f.coeff (n+1) + a * (entireLinearQuotient a f).coeff (n+1) := by sorry

/-- L4/entire-linear-quotient-bound: no summability assertion is hidden in the bound. -/
theorem entireLinearQuotient_bound
    (hA : ∀ x y : A, ‖x+y‖ ≤ max ‖x‖ ‖y‖)
    (a : A) (f : PowerSeries A) (S M : ℝ) (hS : 0 < S) (ha : ‖a‖ ≤ S)
    (hM : 0 ≤ M) (hb : ∀ m : ℕ, ‖f.coeff m‖ * S^m ≤ M) (n : ℕ) :
    ‖(entireLinearQuotient a f).coeff n‖ ≤ M / S^(n+1) := by sorry

/-- L4/entire-linear-quotient-entire. -/
theorem entireLinearQuotient_entire
    (hA : ∀ x y : A, ‖x+y‖ ≤ max ‖x‖ ‖y‖)
    (a : A) (f : PowerSeries A) (hf : IsEntire f) :
    IsEntire (entireLinearQuotient a f) := by sorry

/-- L4/entire-linear-division. -/
theorem entire_linear_division (a : A) (f : PowerSeries A) (hf : IsEntire f) :
    f = (PowerSeries.X - PowerSeries.C a) * entireLinearQuotient a f +
      PowerSeries.C (entire_eval f a) := by sorry

/-- L4/entire-linear-product-constant: the entire hypothesis is essential. -/
theorem entire_linear_product_constant (a b : A) (f : PowerSeries A) (hf : IsEntire f)
    (h : (PowerSeries.X - PowerSeries.C a) * f = PowerSeries.C b) :
    f = 0 ∧ b = 0 := by sorry

/-- L4/entire-linear-division-unique. -/
theorem entire_linear_division_unique (a b c : A) (f g h : PowerSeries A)
    (hg : IsEntire g) (hh : IsEntire h)
    (hb : f = (PowerSeries.X - PowerSeries.C a) * g + PowerSeries.C b)
    (hc : f = (PowerSeries.X - PowerSeries.C a) * h + PowerSeries.C c) :
    g = h ∧ b = c := by sorry

/-- L4/polynomial-series-entire: promoted existing polynomial test. -/
theorem polynomialSeries_entire (P : Polynomial A) : IsEntire (polynomialSeries P) := by sorry

/-- L4/entire-linear-quotient-polynomial. -/
theorem entireLinearQuotient_polynomial
    (hA : ∀ x y : A, ‖x+y‖ ≤ max ‖x‖ ‖y‖) (a : A) (P : Polynomial A) :
    entireLinearQuotient a (polynomialSeries P) =
      polynomialSeries (P /ₘ (Polynomial.X - Polynomial.C a)) := by sorry

/-- L4/entire-linear-root-factor. -/
theorem entire_root_iff_linear_factor
    (hA : ∀ x y : A, ‖x+y‖ ≤ max ‖x‖ ‖y‖) (a : A) (f : PowerSeries A) (hf : IsEntire f) :
    entire_eval f a = 0 ↔ ∃ g : PowerSeries A, IsEntire g ∧
      f = (PowerSeries.X - PowerSeries.C a) * g := by sorry

-- Test linear_quotient_constant.
example (a b : A) : entireLinearQuotient a (PowerSeries.C b) = 0 := by sorry
-- Test linear_quotient_quadratic: distinguishes sign and tail index.
example (a : A) : entireLinearQuotient a (PowerSeries.X^2 : PowerSeries A) =
    PowerSeries.X + PowerSeries.C a := by sorry
-- Test linear_quotient_zero_shift: native shift rather than a second divX object.
example (f : PowerSeries A) : entireLinearQuotient 0 f =
    PowerSeries.mk (fun n => f.coeff (n+1)) := by sorry
-- Test linear_quotient_native_polynomial.
example (hA : ∀ x y : A, ‖x+y‖ ≤ max ‖x‖ ‖y‖) (a : A) (P : Polynomial A) :
    entireLinearQuotient a (polynomialSeries P) =
      polynomialSeries (P /ₘ (Polynomial.X - Polynomial.C a)) := by sorry
-- Test linear_quotient_zero_divisor: coefficients need not be reduced.
example (e : A) (he : e^2 = 0) :
    entireLinearQuotient e (PowerSeries.C e * PowerSeries.X^2) =
      PowerSeries.C e * PowerSeries.X := by sorry
-- Test linear_entire_uniqueness_boundary: formal series alone do not suffice.
example (a : A) :
    (1 - PowerSeries.C a * PowerSeries.X) * PowerSeries.mk (fun n : ℕ => a^n) = 1 := by sorry
end TauCeti.NonarchimedeanFredholm

/-! General monic entire division, using the native inverse of the polynomial
reversal and native truncation. This refines the existing entire-division node.
All signatures are plans, including the required convergence hypotheses. -/
namespace TauCeti.NonarchimedeanFredholm
noncomputable section
variable {A : Type*} [NormedCommRing A] [NormOneClass A] [CompleteSpace A] [Nontrivial A]

lemma monic_reciprocal_coeff_bound
    (hA : ∀ x y : A, ‖x+y‖ ≤ max ‖x‖ ‖y‖)
    (Q : Polynomial A) (hQ : Q.Monic) (C : ℝ) (hC : 1 ≤ C)
    (hb : ∀ i : ℕ, ‖Q.reverse.coeff i‖ ≤ C^i) (k : ℕ) :
    ‖(PowerSeries.invOfUnit (Q.reverse : PowerSeries A) 1).coeff k‖ ≤ C^k := sorry
lemma monic_reciprocal_tail_summable
    (hA : ∀ x y : A, ‖x+y‖ ≤ max ‖x‖ ‖y‖)
    (Q : Polynomial A) (hQ : Q.Monic) (F : PowerSeries A) (hF : IsEntire F) (m : ℕ) :
    Summable (fun k : ℕ => F.coeff (m+k) *
      (PowerSeries.invOfUnit (Q.reverse : PowerSeries A) 1).coeff k) := sorry

def entireMonicQuotient (Q : Polynomial A) (F : PowerSeries A) : PowerSeries A := sorry
lemma entireMonicQuotient_zero (Q : Polynomial A) :
    entireMonicQuotient Q 0 = (0 : PowerSeries A) := sorry
lemma entireMonicQuotient_add
    (hA : ∀ x y : A, ‖x+y‖ ≤ max ‖x‖ ‖y‖)
    (Q : Polynomial A) (hQ : Q.Monic) (F G : PowerSeries A)
    (hF : IsEntire F) (hG : IsEntire G) :
    entireMonicQuotient Q (F+G) = entireMonicQuotient Q F + entireMonicQuotient Q G := sorry
lemma entireMonicQuotient_C_mul
    (hA : ∀ x y : A, ‖x+y‖ ≤ max ‖x‖ ‖y‖)
    (Q : Polynomial A) (hQ : Q.Monic) (F : PowerSeries A) (hF : IsEntire F) (c : A) :
    entireMonicQuotient Q (PowerSeries.C c * F) =
      PowerSeries.C c * entireMonicQuotient Q F := sorry
lemma entireMonicQuotient_coeff (Q : Polynomial A) (F : PowerSeries A) (n : ℕ) :
    (entireMonicQuotient Q F).coeff n = ∑' k : ℕ, F.coeff (n+Q.natDegree+k) *
      (PowerSeries.invOfUnit (Q.reverse : PowerSeries A) 1).coeff k := sorry
lemma entireMonicQuotient_bound
    (hA : ∀ x y : A, ‖x+y‖ ≤ max ‖x‖ ‖y‖)
    (Q : Polynomial A) (hQ : Q.Monic) (C S M : ℝ) (hC : 1 ≤ C) (hS : C ≤ S)
    (hQb : ∀ i : ℕ, ‖Q.reverse.coeff i‖ ≤ C^i) (hM : 0 ≤ M)
    (F : PowerSeries A) (hF : ∀ j : ℕ, ‖F.coeff j‖ * S^j ≤ M) (n : ℕ) :
    ‖(entireMonicQuotient Q F).coeff n‖ ≤ M / S^(n+Q.natDegree) := sorry
lemma entireMonicQuotient_entire
    (hA : ∀ x y : A, ‖x+y‖ ≤ max ‖x‖ ‖y‖)
    (Q : Polynomial A) (hQ : Q.Monic) (F : PowerSeries A) (hF : IsEntire F) :
    IsEntire (entireMonicQuotient Q F) := sorry
lemma entireMonicQuotient_recurrence
    (hA : ∀ x y : A, ‖x+y‖ ≤ max ‖x‖ ‖y‖)
    (Q : Polynomial A) (hQ : Q.Monic) (F : PowerSeries A) (hF : IsEntire F) (n : ℕ) :
    F.coeff (n+Q.natDegree) = (entireMonicQuotient Q F).coeff n +
      ∑ i ∈ Finset.range Q.natDegree,
        Q.coeff i * (entireMonicQuotient Q F).coeff (n+Q.natDegree-i) := sorry
theorem entireMonicQuotient_division
    (hA : ∀ x y : A, ‖x+y‖ ≤ max ‖x‖ ‖y‖)
    (Q : Polynomial A) (hQ : Q.Monic) (F : PowerSeries A) (hF : IsEntire F) :
    let R := PowerSeries.trunc Q.natDegree
      (F - (Q : PowerSeries A) * entireMonicQuotient Q F)
    F = (Q : PowerSeries A) * entireMonicQuotient Q F + (R : PowerSeries A) ∧
      R.degree < (Q.natDegree : WithBot ℕ) := sorry
lemma entire_monic_product_low_degree
    (hA : ∀ x y : A, ‖x+y‖ ≤ max ‖x‖ ‖y‖)
    (Q : Polynomial A) (hQ : Q.Monic) (H : PowerSeries A) (hH : IsEntire H)
    (R : Polynomial A) (hR : R.degree < (Q.natDegree : WithBot ℕ))
    (h : (Q : PowerSeries A) * H = (R : PowerSeries A)) : H = 0 ∧ R = 0 := sorry
theorem entire_monic_division_unique
    (hA : ∀ x y : A, ‖x+y‖ ≤ max ‖x‖ ‖y‖)
    (Q : Polynomial A) (hQ : Q.Monic) (F G H : PowerSeries A)
    (hG : IsEntire G) (hH : IsEntire H) (R S : Polynomial A)
    (hR : R.degree < (Q.natDegree : WithBot ℕ))
    (hS : S.degree < (Q.natDegree : WithBot ℕ))
    (hFG : F = (Q : PowerSeries A) * G + (R : PowerSeries A))
    (hFH : F = (Q : PowerSeries A) * H + (S : PowerSeries A)) : G = H ∧ R = S := sorry
lemma entireMonicQuotient_polynomial
    (hA : ∀ x y : A, ‖x+y‖ ≤ max ‖x‖ ‖y‖)
    (Q : Polynomial A) (hQ : Q.Monic) (P : Polynomial A) :
    entireMonicQuotient Q (P : PowerSeries A) = ((P /ₘ Q : Polynomial A) : PowerSeries A) ∧
    PowerSeries.trunc Q.natDegree
      ((P : PowerSeries A) - (Q : PowerSeries A) * entireMonicQuotient Q (P : PowerSeries A)) =
      P %ₘ Q := sorry
lemma entireMonicQuotient_linear
    (hA : ∀ x y : A, ‖x+y‖ ≤ max ‖x‖ ‖y‖)
    (a : A) (F : PowerSeries A) (hF : IsEntire F) :
    entireMonicQuotient (Polynomial.X - Polynomial.C a) F = entireLinearQuotient a F := sorry
-- Retained L4/entire-division node, now decomposed through the preceding lemmas.
theorem entire_monic_division_existsUnique
    (hA : ∀ x y : A, ‖x+y‖ ≤ max ‖x‖ ‖y‖)
    (Q : Polynomial A) (hQ : Q.Monic) (F : PowerSeries A) (hF : IsEntire F) :
    ∃! qr : PowerSeries A × Polynomial A,
      IsEntire qr.1 ∧ qr.2.degree < (Q.natDegree : WithBot ℕ) ∧
      F = (Q : PowerSeries A) * qr.1 + (qr.2 : PowerSeries A) := sorry

-- Test monic_quotient_one.
example (F : PowerSeries A) : entireMonicQuotient 1 F = F := sorry
-- Test monic_quotient_power_shift.
example (d : ℕ) (F : PowerSeries A) :
    entireMonicQuotient (Polynomial.X^d) F = PowerSeries.mk (fun n => F.coeff (n+d)) := sorry
-- Test monic_quotient_quadratic.
example (a b : A) :
    entireMonicQuotient (Polynomial.X^2 + Polynomial.C a * Polynomial.X + Polynomial.C b)
      (PowerSeries.X^3) = PowerSeries.X - PowerSeries.C a := sorry
-- Test monic_quotient_nilpotent.
example (e : A) (he : e^2 = 0) :
    entireMonicQuotient (Polynomial.X^2 - Polynomial.C e) (PowerSeries.X^4) =
      PowerSeries.X^2 + PowerSeries.C e ∧
    PowerSeries.trunc 2 (PowerSeries.X^4 -
      ((Polynomial.X^2 - Polynomial.C e : Polynomial A) : PowerSeries A) *
      entireMonicQuotient (Polynomial.X^2 - Polynomial.C e) (PowerSeries.X^4)) = 0 := sorry
end
end TauCeti.NonarchimedeanFredholm

/-!
Entire quotient and resultant comparison. The native finite algebra is AdjoinRoot;
no new polynomial quotient, basis, norm or generic determinant criterion is planned.
-/
namespace TauCeti.NonarchimedeanFredholm
variable {A : Type*} [NormedCommRing A] [NormOneClass A]

/-- L4/entire-polynomial-inclusion: bundle the existing polynomial inclusion. -/
def entirePolynomial : Polynomial A →+* entireSeries A := by sorry

theorem entirePolynomial_coe (P : Polynomial A) :
    (entirePolynomial P : PowerSeries A) = polynomialSeries P := by sorry

theorem entirePolynomial_injective : Function.Injective (entirePolynomial (A := A)) := by sorry

theorem entirePolynomial_C (a : A) :
    (entirePolynomial (Polynomial.C a) : PowerSeries A) = PowerSeries.C a := by sorry

/-- L4/entire-polynomial-divisibility: analytic division creates no polynomial factors. -/
theorem entirePolynomial_dvd_iff [CompleteSpace A] [Nontrivial A]
    (hA : ∀ x y : A, ‖x+y‖ ≤ max ‖x‖ ‖y‖)
    (Q P : Polynomial A) (hQ : Q.Monic) :
    entirePolynomial Q ∣ entirePolynomial P ↔ Q ∣ P := by sorry

/-- L4/entire-quotient-class: monic division into the actual native finite algebra. -/
def entireAdjoinRoot [CompleteSpace A] [Nontrivial A]
    (hA : ∀ x y : A, ‖x+y‖ ≤ max ‖x‖ ‖y‖)
    (Q : Polynomial A) (hQ : Q.Monic) : entireSeries A →+* AdjoinRoot Q := by sorry

theorem entireAdjoinRoot_polynomial [CompleteSpace A] [Nontrivial A]
    (hA : ∀ x y : A, ‖x+y‖ ≤ max ‖x‖ ‖y‖)
    (Q P : Polynomial A) (hQ : Q.Monic) :
    entireAdjoinRoot hA Q hQ (entirePolynomial P) = AdjoinRoot.mk Q P := by sorry

theorem entireAdjoinRoot_of_decomposition [CompleteSpace A] [Nontrivial A]
    (hA : ∀ x y : A, ‖x+y‖ ≤ max ‖x‖ ‖y‖)
    (Q R : Polynomial A) (hQ : Q.Monic) (F G : entireSeries A)
    (h : F = entirePolynomial Q * G + entirePolynomial R) :
    entireAdjoinRoot hA Q hQ F = AdjoinRoot.mk Q R := by sorry

/-- L4/entire-quotient-class-kernel. -/
theorem entireAdjoinRoot_eq_zero_iff [CompleteSpace A] [Nontrivial A]
    (hA : ∀ x y : A, ‖x+y‖ ≤ max ‖x‖ ‖y‖)
    (Q : Polynomial A) (hQ : Q.Monic) (F : entireSeries A) :
    entireAdjoinRoot hA Q hQ F = 0 ↔ entirePolynomial Q ∣ F := by sorry

/-- L4/entire-quotient-class-surjective. -/
theorem entireAdjoinRoot_surjective [CompleteSpace A] [Nontrivial A]
    (hA : ∀ x y : A, ‖x+y‖ ≤ max ‖x‖ ‖y‖)
    (Q : Polynomial A) (hQ : Q.Monic) :
    Function.Surjective (entireAdjoinRoot hA Q hQ) := by sorry

/-- L4/entire-quotient-class-linear: uses the existing evaluated-tail division. -/
theorem entireAdjoinRoot_linear [CompleteSpace A] [Nontrivial A]
    (hA : ∀ x y : A, ‖x+y‖ ≤ max ‖x‖ ‖y‖) (a : A) (F : entireSeries A) :
    entireAdjoinRoot hA (Polynomial.X - Polynomial.C a) (Polynomial.monic_X_sub_C a) F =
      AdjoinRoot.of (Polynomial.X - Polynomial.C a) (entire_eval F a) := by sorry

/- The existing resultant definition is moved here to use this actual quotient
   map and to state its complete/ultrametric hypotheses explicitly. -/
def entireResultant [CompleteSpace A] [Nontrivial A]
    (hA : ∀ x y : A, ‖x+y‖ ≤ max ‖x‖ ‖y‖)
    (Q : Polynomial A) (hQ : Q.Monic)
    (f : PowerSeries A) (hf : IsEntire f) : A := by sorry

theorem entireResultant_norm [CompleteSpace A] [Nontrivial A]
    (hA : ∀ x y : A, ‖x+y‖ ≤ max ‖x‖ ‖y‖)
    (Q : Polynomial A) (hQ : Q.Monic) (F : entireSeries A) :
    entireResultant hA Q hQ F F.property =
      Algebra.norm A (entireAdjoinRoot hA Q hQ F) := by sorry

theorem entireResultant_remainder [CompleteSpace A] [Nontrivial A]
    (hA : ∀ x y : A, ‖x+y‖ ≤ max ‖x‖ ‖y‖)
    (Q : Polynomial A) (hQ : Q.Monic) (f g s : PowerSeries A)
    (hf : IsEntire f) (hg : IsEntire g) (hs : IsEntire s)
    (h : f = polynomialSeries Q * s + g) :
    entireResultant hA Q hQ f hf = entireResultant hA Q hQ g hg := by sorry

theorem entireResultant_mul [CompleteSpace A] [Nontrivial A]
    (hA : ∀ x y : A, ‖x+y‖ ≤ max ‖x‖ ‖y‖)
    (Q : Polynomial A) (hQ : Q.Monic) (f g : PowerSeries A)
    (hf : IsEntire f) (hg : IsEntire g) (hfg : IsEntire (f*g)) :
    entireResultant hA Q hQ (f*g) hfg =
      entireResultant hA Q hQ f hf * entireResultant hA Q hQ g hg := by sorry

theorem entireResultant_linear [CompleteSpace A] [Nontrivial A]
    (hA : ∀ x y : A, ‖x+y‖ ≤ max ‖x‖ ‖y‖) (a : A)
    (f : PowerSeries A) (hf : IsEntire f) (hq : (Polynomial.X - Polynomial.C a).Monic) :
    entireResultant hA (Polynomial.X - Polynomial.C a) hq f hf = entire_eval f a := by sorry

/-- L4/entire-resultant-polynomial: native Tau Ceti norm-resultant comparison. -/
theorem entireResultant_polynomial [CompleteSpace A] [Nontrivial A]
    (hA : ∀ x y : A, ‖x+y‖ ≤ max ‖x‖ ‖y‖)
    (Q P : Polynomial A) (hQ : Q.Monic) :
    entireResultant hA Q hQ (polynomialSeries P) (polynomialSeries_entire P) =
      Q.resultant P Q.natDegree P.natDegree := by sorry

/-- L4/entire-resultant-bezout: the coefficient of F is a bounded-degree polynomial. -/
theorem entireResultant_bezout [CompleteSpace A] [Nontrivial A]
    (hA : ∀ x y : A, ‖x+y‖ ≤ max ‖x‖ ‖y‖)
    (Q : Polynomial A) (hQ : Q.Monic) (F : entireSeries A) :
    ∃ G : entireSeries A, ∃ H : Polynomial A, H.degree < (Q.natDegree : WithBot ℕ) ∧
      entirePolynomial (Polynomial.C
        (entireResultant hA Q hQ F F.property)) =
        entirePolynomial Q * G + entirePolynomial H * F := by sorry

/-- Existing L4/resultant-unit now has its full analytic statement. -/
theorem entireResultant_isUnit_iff [CompleteSpace A] [Nontrivial A]
    (hA : ∀ x y : A, ‖x+y‖ ≤ max ‖x‖ ‖y‖)
    (Q : Polynomial A) (hQ : Q.Monic) (F : entireSeries A) :
    IsUnit (entireResultant hA Q hQ F F.property) ↔
      IsCoprime (entirePolynomial Q) F := by sorry

-- Test entire_polynomial_zero.
example : entirePolynomial (0 : Polynomial A) = 0 := by sorry
-- Test entire_polynomial_square.
example : (entirePolynomial (Polynomial.X^2 : Polynomial A) : PowerSeries A) =
    PowerSeries.X^2 := by sorry
-- Test entire_polynomial_native_injective.
example (P S : Polynomial A) : entirePolynomial P = entirePolynomial S ↔ P = S := by sorry

section Tests
variable [CompleteSpace A] [Nontrivial A] (hA : ∀ x y : A, ‖x+y‖ ≤ max ‖x‖ ‖y‖)
-- Test quotient_constant_divisor: the target is the zero ring, not A.
example (F : entireSeries A) : entireAdjoinRoot hA 1 (Polynomial.monic_one) F = 0 := by sorry
-- Test quotient_nilpotent_square.
example : entireAdjoinRoot hA (Polynomial.X^2) (Polynomial.monic_X_pow 2)
    (entirePolynomial (Polynomial.X^2)) = 0 := by sorry
-- Test quotient_nilpotent_generator_nonzero.
example : entireAdjoinRoot hA (Polynomial.X^2) (Polynomial.monic_X_pow 2)
    (entirePolynomial Polynomial.X) ≠ 0 := by sorry
-- Test quotient_native_remainder.
example (Q P : Polynomial A) (hQ : Q.Monic) :
    entireAdjoinRoot hA Q hQ (entirePolynomial P) = AdjoinRoot.mk Q (P %ₘ Q) := by sorry
-- Existing test constant_divisor, including f=0.
example (f : PowerSeries A) (hf : IsEntire f) :
    entireResultant hA 1 (Polynomial.monic_one) f hf = 1 := by sorry
-- Existing test linear_evaluation.
example (a b : A) (hf : IsEntire (1 - PowerSeries.C b * PowerSeries.X)) :
    entireResultant hA (Polynomial.X - Polynomial.C a) (Polynomial.monic_X_sub_C a)
      (1 - PowerSeries.C b * PowerSeries.X) hf = 1-b*a := by sorry
-- Existing test common_factor.
example (Q : Polynomial A) (hQ : Q.Monic) (hd : 0 < Q.natDegree) :
    entireResultant hA Q hQ (polynomialSeries Q) (polynomialSeries_entire Q) = 0 := by sorry
-- Test resultant_nilpotent_linear: handles a nonreduced quotient and coefficients.
example (a b : A) :
    entireResultant hA (Polynomial.X^2) (Polynomial.monic_X_pow 2)
      (polynomialSeries (Polynomial.C a + Polynomial.C b * Polynomial.X))
      (polynomialSeries_entire _) = a^2 := by sorry
end Tests
end TauCeti.NonarchimedeanFredholm

/-! Finite polynomial stage of the spectral transform (L4).
The explicit bounds retain zero roots under specialization. The infinite-series
limit and Fredholm operator comparison remain separate roadmap obligations. -/
namespace TauCeti.NonarchimedeanFredholm
noncomputable section
open Polynomial
variable {A S : Type*} [CommRing A] [CommRing S]
lemma spectralReversal_monic [Nontrivial A] (P : A[X]) (n : ℕ)
    (hP : P.coeff 0 = 1) (hn : P.natDegree ≤ n) :
    (P.reflect n).Monic ∧ (P.reflect n).natDegree = n := sorry

def polynomialSpectralResultant (n m : ℕ) (B P : A[X]) : A[X] := sorry
lemma polynomialSpectralResultant_def (n m : ℕ) (B P : A[X]) :
    polynomialSpectralResultant n m B P =
      Polynomial.resultant ((P.reflect n).map Polynomial.C)
        (1-Polynomial.C Polynomial.X * B.map Polynomial.C) n m := sorry
lemma polynomialSpectralResultant_eval (n m : ℕ) (B P : A[X]) (t : A) :
    (polynomialSpectralResultant n m B P).eval t =
      Polynomial.resultant (P.reflect n) (1-Polynomial.C t*B) n m := sorry
lemma polynomialSpectralResultant_constantCoeff (n m : ℕ) (B P : A[X])
    (hP : P.coeff 0 = 1) : (polynomialSpectralResultant n m B P).coeff 0 = 1 := sorry
lemma polynomialSpectralResultant_zero (n : ℕ) (P : A[X]) :
    polynomialSpectralResultant n 0 0 P = 1 := sorry
lemma polynomialSpectralResultant_oneInput (m : ℕ) (B : A[X]) :
    polynomialSpectralResultant 0 m B 1 = 1 := sorry
lemma polynomialSpectralResultant_rightBound (n m : ℕ) (B P : A[X])
    (hP : P.coeff 0 = 1) (hn : P.natDegree ≤ n) (hm : B.natDegree ≤ m) :
    polynomialSpectralResultant n m B P =
      polynomialSpectralResultant n B.natDegree B P := sorry
lemma polynomialSpectralResultant_linear (m : ℕ) (B : A[X]) (a : A)
    (hm : B.natDegree ≤ m) :
    polynomialSpectralResultant 1 m B (1-Polynomial.C a*Polynomial.X) =
      1-Polynomial.C (B.eval a)*Polynomial.X := sorry
lemma polynomialSpectralResultant_mul (n k m : ℕ) (B P Q : A[X])
    (hP : P.coeff 0 = 1) (hQ : Q.coeff 0 = 1)
    (hn : P.natDegree ≤ n) (hk : Q.natDegree ≤ k) (hm : B.natDegree ≤ m) :
    polynomialSpectralResultant (n+k) m B (P*Q) =
      polynomialSpectralResultant n m B P * polynomialSpectralResultant k m B Q := sorry
lemma polynomialSpectralResultant_padding (n m : ℕ) (B P : A[X])
    (hP : P.coeff 0 = 1) (hn : P.natDegree ≤ n) (hm : B.natDegree ≤ m) :
    polynomialSpectralResultant (n+1) m B P =
      polynomialSpectralResultant n m B P * (1-Polynomial.C (B.coeff 0)*Polynomial.X) := sorry
lemma polynomialSpectralResultant_stable (n k m : ℕ) (B P : A[X])
    (hP : P.coeff 0 = 1) (hn : P.natDegree ≤ n) (hm : B.natDegree ≤ m)
    (hB : B.coeff 0 = 0) : polynomialSpectralResultant (n+k) m B P =
      polynomialSpectralResultant n m B P := sorry
lemma polynomialSpectralResultant_map (f : A →+* S) (n m : ℕ) (B P : A[X]) :
    (polynomialSpectralResultant n m B P).map f =
      polynomialSpectralResultant n m (B.map f) (P.map f) := sorry
lemma polynomialSpectralResultant_norm (n m : ℕ) (B P : A[X])
    (hP : P.coeff 0 = 1) (hn : P.natDegree ≤ n) (hm : B.natDegree ≤ m) :
    polynomialSpectralResultant n m B P = Algebra.norm A[X]
      (AdjoinRoot.mk ((P.reflect n).map Polynomial.C)
        (1-Polynomial.C Polynomial.X * B.map Polynomial.C)) := sorry
lemma polynomialSpectralResultant_split {ι : Type*} (s : Finset ι) (a : ι → A)
    (m : ℕ) (B : A[X]) (hm : B.natDegree ≤ m) :
    polynomialSpectralResultant s.card m B (∏ i ∈ s, (1-Polynomial.C (a i)*Polynomial.X)) =
      ∏ i ∈ s, (1-Polynomial.C (B.eval (a i))*Polynomial.X) := sorry

-- SpectralTests.rank_zero
example : polynomialSpectralResultant 0 0 (1 : ℤ[X]) 1 = 1 := sorry
-- SpectralTests.nonzero_constant_padding
example : polynomialSpectralResultant 1 0 (1 : ℤ[X]) 1 = 1-Polynomial.X ∧
    polynomialSpectralResultant 0 0 (1 : ℤ[X]) 1 = 1 := sorry
-- SpectralTests.nilpotent_linear
example : polynomialSpectralResultant 1 2 (Polynomial.X^2 : (ZMod 4)[X])
    (1-Polynomial.C 2*Polynomial.X) = 1 := sorry
-- SpectralTests.repeated_root
example : polynomialSpectralResultant 2 2 (Polynomial.X+Polynomial.X^2 : (ZMod 8)[X])
    ((1-Polynomial.C 2*Polynomial.X)^2) =
      1+Polynomial.C 4*Polynomial.X+Polynomial.C 4*Polynomial.X^2 := sorry
end
end TauCeti.NonarchimedeanFredholm

/-! Finite triangular characteristic comparison. Every body is a proposed signature. -/
section FiniteSpectralCharacteristic
open Polynomial Matrix
variable {R S ι : Type*} [CommRing R] [CommRing S] [Fintype ι] [DecidableEq ι]
variable [LinearOrder ι]

/-- Fixed-rank reflection of the characteristic series. -/
lemma Matrix.reflect_charpolyRev (M : Matrix ι ι R) :
    M.charpolyRev.reflect (Fintype.card ι) = M.charpoly := by sorry

/-- Degree bound for the characteristic series. -/
lemma Matrix.charpolyRev_natDegree_le (M : Matrix ι ι R) :
    M.charpolyRev.natDegree ≤ Fintype.card ι := by sorry

/-- Scalar extension of the characteristic series. -/
lemma Matrix.charpolyRev_map (f : R →+* S) (M : Matrix ι ι R) :
    (M.map f).charpolyRev = M.charpolyRev.map f := by sorry

/-- Similarity invariance of the characteristic series. -/
lemma Matrix.charpolyRev_units_conj (u : (Matrix ι ι R)ˣ) (M : Matrix ι ι R) :
    (u.val * M * u.val⁻¹).charpolyRev = M.charpolyRev := by sorry

/-- Diagonal entries of a triangular product. -/
lemma Matrix.IsUpperTriangular.mul_apply_diag {M N : Matrix ι ι R}
    (hM : M.IsUpperTriangular) (hN : N.IsUpperTriangular) (i : ι) :
    (M*N) i i = M i i * N i i := by sorry

/-- Polynomial evaluation preserves upper triangularity. -/
lemma Matrix.IsUpperTriangular.aeval {M : Matrix ι ι R} (hM : M.IsUpperTriangular) (B : R[X]) :
    (Polynomial.aeval M B).IsUpperTriangular := by sorry

/-- The diagonal of a polynomial in a triangular matrix. -/
lemma Matrix.IsUpperTriangular.aeval_apply_diag {M : Matrix ι ι R} (hM : M.IsUpperTriangular)
    (B : R[X]) (i : ι) : (Polynomial.aeval M B) i i = B.eval (M i i) := by sorry

/-- Characteristic factors of a triangular matrix. -/
lemma Matrix.charpolyRev_of_isUpperTriangular {M : Matrix ι ι R} (hM : M.IsUpperTriangular) :
    M.charpolyRev = ∏ i, (1-C (M i i)*X) := by sorry

/-- Finite spectral mapping for triangular matrices. -/
lemma TauCeti.NonarchimedeanFredholm.polynomialSpectralResultant_charpolyRev_of_isUpperTriangular {M : Matrix ι ι R} (hM : M.IsUpperTriangular)
    (m : ℕ) (B : R[X]) (hm : B.natDegree ≤ m) :
    TauCeti.NonarchimedeanFredholm.polynomialSpectralResultant (Fintype.card ι) m B M.charpolyRev = (Polynomial.aeval M B).charpolyRev := by sorry

/-- Similarity commutes with polynomial calculus. -/
lemma Matrix.aeval_units_conj (u : (Matrix ι ι R)ˣ) (M : Matrix ι ι R) (B : R[X]) :
    Polynomial.aeval (u.val*M*u.val⁻¹) B = u.val * Polynomial.aeval M B * u.val⁻¹ := by sorry

/-- Scalar extension of matrix polynomial calculus. -/
lemma Matrix.aeval_map (f : R →+* S) (M : Matrix ι ι R) (B : R[X]) :
    (Polynomial.aeval M B).map f = Polynomial.aeval (M.map f) (B.map f) := by sorry

/-- Spectral mapping from a triangularizing similarity. -/
lemma TauCeti.NonarchimedeanFredholm.polynomialSpectralResultant_charpolyRev_of_conj (M : Matrix ι ι R) (u : (Matrix ι ι R)ˣ)
    (h : (u.val*M*u.val⁻¹).IsUpperTriangular) (m : ℕ) (B : R[X])
    (hm : B.natDegree ≤ m) :
    TauCeti.NonarchimedeanFredholm.polynomialSpectralResultant (Fintype.card ι) m B M.charpolyRev = (Polynomial.aeval M B).charpolyRev := by sorry

/-- Faithful descent of finite spectral mapping. -/
lemma TauCeti.NonarchimedeanFredholm.polynomialSpectralResultant_charpolyRev_of_faithful (f : R →+* S) (hf : Function.Injective f)
    (M : Matrix ι ι R) (u : (Matrix ι ι S)ˣ)
    (h : (u.val*(M.map f)*u.val⁻¹).IsUpperTriangular) (m : ℕ) (B : R[X])
    (hm : B.natDegree ≤ m) :
    TauCeti.NonarchimedeanFredholm.polynomialSpectralResultant (Fintype.card ι) m B M.charpolyRev = (Polynomial.aeval M B).charpolyRev := by sorry

-- CharacteristicTests.empty_matrix
example : TauCeti.NonarchimedeanFredholm.polynomialSpectralResultant 0 0 (1 : ℤ[X])
    (0 : Matrix (Fin 0) (Fin 0) ℤ).charpolyRev = 1 := by sorry

-- CharacteristicTests.constant_operator
example : TauCeti.NonarchimedeanFredholm.polynomialSpectralResultant 2 0 (1 : ℤ[X])
    (0 : Matrix (Fin 2) (Fin 2) ℤ).charpolyRev = (1-X)^2 := by sorry

-- CharacteristicTests.jordan_transform
example : TauCeti.NonarchimedeanFredholm.polynomialSpectralResultant 2 2 (X+X^2 : (ZMod 8)[X])
    (!![2,1;0,2] : Matrix (Fin 2) (Fin 2) (ZMod 8)).charpolyRev =
      1+C 4*X+C 4*X^2 := by sorry

-- CharacteristicTests.jordan_aeval
example : aeval (!![2,1;0,2] : Matrix (Fin 2) (Fin 2) (ZMod 8))
    (X+X^2 : (ZMod 8)[X]) = !![6,5;0,6] := by sorry

end FiniteSpectralCharacteristic

/-! Universal finite characteristic comparison. These are unchecked signatures.
The native polynomial and matrix carriers are used throughout. The local
notations abbreviate types only; no alternative generic-matrix carrier is defined.
TauCeti's discriminant lemmas are proof-plan dependencies, not stubbed here. -/
namespace TauCeti.NonarchimedeanFredholm
noncomputable section
open Polynomial Matrix
local notation "C[" m "]" => MvPolynomial (Fin (m+1)) ℤ
local notation "U[" n "," m "]" => MvPolynomial (Fin n × Fin n) (C[m])

def spectralUniversalPolynomial (n m : ℕ) : (U[n,m])[X] := sorry
lemma spectralUniversalPolynomial_def (n m : ℕ) :
    spectralUniversalPolynomial n m =
      Polynomial.ofFn (m+1) (fun i => MvPolynomial.C (MvPolynomial.X i)) := sorry
lemma spectralUniversalPolynomial_coeff (n m : ℕ) (i : Fin (m+1)) :
    (spectralUniversalPolynomial n m).coeff i.val =
      MvPolynomial.C (MvPolynomial.X i) := sorry
lemma spectralUniversalPolynomial_natDegree_le (n m : ℕ) :
    (spectralUniversalPolynomial n m).natDegree ≤ m := sorry

variable {R S : Type*} [CommRing R] [CommRing S]
def spectralSpecialization {n : ℕ} (m : ℕ) (M : Matrix (Fin n) (Fin n) R)
    (B : R[X]) : U[n,m] →+* R := sorry
lemma spectralSpecialization_def {n : ℕ} (m : ℕ) (M : Matrix (Fin n) (Fin n) R)
    (B : R[X]) : spectralSpecialization m M B =
      MvPolynomial.eval₂Hom
        (MvPolynomial.eval₂Hom (Int.castRingHom R) (fun i : Fin (m+1) => B.coeff i.val))
        (fun ij => M ij.1 ij.2) := sorry
lemma spectralSpecialization_entry {n : ℕ} (m : ℕ) (M : Matrix (Fin n) (Fin n) R)
    (B : R[X]) (i j : Fin n) :
    spectralSpecialization m M B (MvPolynomial.X (i,j)) = M i j := sorry
lemma spectralSpecialization_coefficient {n : ℕ} (m : ℕ)
    (M : Matrix (Fin n) (Fin n) R) (B : R[X]) (i : Fin (m+1)) :
    spectralSpecialization m M B (MvPolynomial.C (MvPolynomial.X i)) = B.coeff i.val := sorry
lemma spectralSpecialization_comp {n : ℕ} (m : ℕ) (M : Matrix (Fin n) (Fin n) R)
    (B : R[X]) (f : R →+* S) :
    f.comp (spectralSpecialization m M B) =
      spectralSpecialization m (M.map f) (B.map f) := sorry
lemma spectralSpecialization_matrix {n : ℕ} (m : ℕ)
    (M : Matrix (Fin n) (Fin n) R) (B : R[X]) :
    (Matrix.mvPolynomialX (Fin n) (Fin n) (C[m])).map (spectralSpecialization m M B) = M := sorry
lemma spectralSpecialization_polynomial {n : ℕ} (m : ℕ)
    (M : Matrix (Fin n) (Fin n) R) (B : R[X]) (hm : B.natDegree ≤ m) :
    (spectralUniversalPolynomial n m).map (spectralSpecialization m M B) = B := sorry

lemma spectralGeneric_discr_ne_zero (n m : ℕ) :
    (Matrix.mvPolynomialX (Fin n) (Fin n) (C[m])).charpoly.discr ≠ 0 := sorry
lemma spectralGeneric_separable {K : Type*} [Field K] (n m : ℕ)
    (f : U[n,m] →+* K) (hf : Function.Injective f) :
    ((Matrix.mvPolynomialX (Fin n) (Fin n) (C[m])).map f).charpoly.Separable := sorry
end
end TauCeti.NonarchimedeanFredholm

namespace Matrix
noncomputable section
open Polynomial
variable {K : Type*} [Field K] {n : ℕ}
lemma exists_injective_roots_charpoly (M : Matrix (Fin n) (Fin n) K)
    (hsep : M.charpoly.Separable) (hsplit : M.charpoly.Splits) :
    ∃ r : Fin n → K, Function.Injective r ∧ ∀ i, M.charpoly.IsRoot (r i) := sorry
lemma exists_eigenbasis_of_injective_roots (M : Matrix (Fin n) (Fin n) K)
    (r : Fin n → K) (hr : Function.Injective r) (hroot : ∀ i, M.charpoly.IsRoot (r i)) :
    ∃ b : Module.Basis (Fin n) K (Fin n → K), ∀ i, M.mulVec (b i) = r i • b i := sorry
lemma exists_units_conj_diagonal_of_eigenbasis (M : Matrix (Fin n) (Fin n) K)
    (r : Fin n → K) (b : Module.Basis (Fin n) K (Fin n → K))
    (hb : ∀ i, M.mulVec (b i) = r i • b i) :
    ∃ u : (Matrix (Fin n) (Fin n) K)ˣ, u.val * M * u.val⁻¹ = Matrix.diagonal r := sorry
end
end Matrix

namespace TauCeti.NonarchimedeanFredholm
noncomputable section
open Polynomial Matrix
local notation "C[" m "]" => MvPolynomial (Fin (m+1)) ℤ
local notation "U[" n "," m "]" => MvPolynomial (Fin n × Fin n) (C[m])
lemma polynomialSpectralResultant_generic (n m : ℕ) :
    polynomialSpectralResultant n m (spectralUniversalPolynomial n m)
      (Matrix.mvPolynomialX (Fin n) (Fin n) (C[m])).charpolyRev =
    (Polynomial.aeval (Matrix.mvPolynomialX (Fin n) (Fin n) (C[m]))
      (spectralUniversalPolynomial n m)).charpolyRev := sorry
lemma polynomialSpectralResultant_charpolyRev_fin {R : Type*} [CommRing R] {n : ℕ}
    (M : Matrix (Fin n) (Fin n) R) (m : ℕ) (B : R[X]) (hm : B.natDegree ≤ m) :
    polynomialSpectralResultant n m B M.charpolyRev = (Polynomial.aeval M B).charpolyRev := sorry
end
end TauCeti.NonarchimedeanFredholm

namespace Matrix
noncomputable section
open Polynomial
variable {R ι κ : Type*} [CommRing R] [Fintype ι] [DecidableEq ι]
  [Fintype κ] [DecidableEq κ]
lemma charpolyRev_reindex (e : ι ≃ κ) (M : Matrix ι ι R) :
    (Matrix.reindex e e M).charpolyRev = M.charpolyRev := sorry
lemma aeval_reindex (e : ι ≃ κ) (M : Matrix ι ι R) (B : R[X]) :
    Matrix.reindex e e (Polynomial.aeval M B) =
      Polynomial.aeval (Matrix.reindex e e M) B := sorry
end
end Matrix

namespace TauCeti.NonarchimedeanFredholm
noncomputable section
open Polynomial Matrix
variable {R ι : Type*} [CommRing R] [Fintype ι] [DecidableEq ι]
theorem polynomialSpectralResultant_charpolyRev (M : Matrix ι ι R)
    (m : ℕ) (B : R[X]) (hm : B.natDegree ≤ m) :
    polynomialSpectralResultant (Fintype.card ι) m B M.charpolyRev =
      (Polynomial.aeval M B).charpolyRev := sorry

-- UniversalTests.constant: the coefficient variable survives when m=0.
example : spectralUniversalPolynomial 2 0 =
    Polynomial.C (MvPolynomial.C (MvPolynomial.X (0 : Fin 1))) := sorry
-- UniversalTests.high_coefficient: fixed bound controls coefficients.
example : (spectralUniversalPolynomial 2 1).coeff 2 = 0 := sorry
-- UniversalTests.empty_matrix: n=0 does not remove the coefficient variables.
example : (spectralUniversalPolynomial 0 1).coeff 1 =
    MvPolynomial.C (MvPolynomial.X (1 : Fin 2)) := sorry
-- SpecializationTests.entry: a matrix entry is distinct from a polynomial coefficient.
example : spectralSpecialization 1 (!![2,1;2,2] : Matrix (Fin 2) (Fin 2) (ZMod 8))
    (Polynomial.C 3 + Polynomial.C 5 * Polynomial.X) (MvPolynomial.X (0,1)) = 1 := sorry
-- SpecializationTests.coefficient: nested variables have the specified coefficient image.
example : spectralSpecialization 1 (!![2,1;2,2] : Matrix (Fin 2) (Fin 2) (ZMod 8))
    (Polynomial.C 3 + Polynomial.C 5 * Polynomial.X)
    (MvPolynomial.C (MvPolynomial.X (1 : Fin 2))) = 5 := sorry
-- SpecializationTests.empty: no matrix variables does not force a zero polynomial.
example : (spectralUniversalPolynomial 0 1).map
    (spectralSpecialization 1 (0 : Matrix (Fin 0) (Fin 0) ℤ) (Polynomial.X+1)) = Polynomial.X+1 := sorry
-- SpecializationTests.noninjective: the map to a nonreduced ring is not a field embedding.
example : spectralSpecialization 0 (0 : Matrix (Fin 1) (Fin 1) (ZMod 8)) 0 8 = 0 := sorry
-- UniversalComparisonTests.dense_nilpotent: repeated characteristic roots are allowed.
example : polynomialSpectralResultant 2 2 (Polynomial.X+Polynomial.X^2)
    (!![2,1;2,2] : Matrix (Fin 2) (Fin 2) (ZMod 8)).charpolyRev =
    1+Polynomial.C 6*Polynomial.X^2 := sorry
-- UniversalComparisonTests.constant: fixed matrix rank survives a constant input.
example : polynomialSpectralResultant 2 0 (Polynomial.C 2)
    (0 : Matrix (Fin 2) (Fin 2) (ZMod 8)).charpolyRev =
    1+Polynomial.C 4*Polynomial.X+Polynomial.C 4*Polynomial.X^2 := sorry
-- UniversalComparisonTests.empty: the empty characteristic series is one.
example : polynomialSpectralResultant 0 0 (1 : ℤ[X])
    (0 : Matrix (Fin 0) (Fin 0) ℤ).charpolyRev = 1 := sorry
-- UniversalComparisonTests.zero_ring: nontriviality is absent from the final theorem.
example (M : Matrix (Fin 2) (Fin 2) (ZMod 1)) :
    polynomialSpectralResultant 2 1 Polynomial.X M.charpolyRev = M.charpolyRev := sorry
end
end TauCeti.NonarchimedeanFredholm

/-! Reciprocal resultants and the scalar truncation limit in Coleman A3.8(11).
The full entire spectral transform is a separate remaining target.
-/
namespace TauCeti.NonarchimedeanFredholm
section ReciprocalResultants
variable {R : Type*} [CommRing R]
lemma sylvester_reflect_swap (f g : Polynomial R) (m n : ℕ) :
    (Polynomial.sylvester f g m n).reindex
        ((Fin.revPerm : Equiv.Perm (Fin (m+n))).trans (finCongr (Nat.add_comm m n)))
        ((Fin.revPerm : Equiv.Perm (Fin (m+n))).trans (finCongr (Nat.add_comm m n))) =
      Polynomial.sylvester (g.reflect n) (f.reflect m) n m := by sorry
lemma resultant_reflect_swap (f g : Polynomial R) (m n : ℕ) :
    Polynomial.resultant (f.reflect m) (g.reflect n) m n =
      Polynomial.resultant g f n m := by sorry
lemma polynomialSpectralResultant_one_sub_reverse_eval
    (Q P : Polynomial R) (hQ : Q.Monic) (n : ℕ) (hP : P.natDegree ≤ n) :
    (polynomialSpectralResultant n Q.natDegree (1-Q.reverse) P).eval 1 =
      Polynomial.resultant Q P Q.natDegree P.natDegree := by sorry
lemma resultant_modByMonic_fixedBound (Q P : Polynomial R) (hQ : Q.Monic) :
    Polynomial.resultant Q P Q.natDegree P.natDegree =
      Polynomial.resultant Q (P %ₘ Q) Q.natDegree Q.natDegree := by sorry
end ReciprocalResultants

section ResultantCoordinates
variable {R : Type*} [CommRing R] [TopologicalSpace R] [IsTopologicalRing R] [DecidableEq R]
lemma continuous_resultant_ofFn (Q : Polynomial R) (m n : ℕ) :
    Continuous (fun v : Fin (n+1) → R =>
      Polynomial.resultant Q (Polynomial.ofFn (n+1) v) m n) := by sorry
end ResultantCoordinates

section EntireResultantLimit
variable {A : Type*} [NormedCommRing A] [NormOneClass A] [CompleteSpace A] [Nontrivial A]
variable (hA : ∀ x y : A, ‖x+y‖ ≤ max ‖x‖ ‖y‖)
lemma tendsto_entireMonicQuotient_trunc_coeff
    (Q : Polynomial A) (hQ : Q.Monic) (F : PowerSeries A) (hF : IsEntire F) (k : ℕ) :
    Tendsto (fun n : ℕ => (entireMonicQuotient Q
      ((PowerSeries.trunc (n+1) F : Polynomial A) : PowerSeries A)).coeff k)
      atTop (𝓝 ((entireMonicQuotient Q F).coeff k)) := by sorry
lemma tendsto_modByMonic_trunc_coeff
    (Q : Polynomial A) (hQ : Q.Monic) (F : PowerSeries A) (hF : IsEntire F) (k : ℕ) :
    Tendsto (fun n : ℕ => ((PowerSeries.trunc (n+1) F) %ₘ Q).coeff k)
      atTop (𝓝 ((PowerSeries.trunc Q.natDegree
        (F-(Q : PowerSeries A)*entireMonicQuotient Q F)).coeff k)) := by sorry

theorem tendsto_resultant_trunc
    (Q : Polynomial A) (hQ : Q.Monic) (F : PowerSeries A) (hF : IsEntire F) :
    Tendsto (fun n : ℕ => Polynomial.resultant Q (PowerSeries.trunc (n+1) F)
      Q.natDegree (PowerSeries.trunc (n+1) F).natDegree)
      atTop (𝓝 (entireResultant hA Q hQ F hF)) := by sorry
lemma tendsto_spectral_one_sub_reverse_eval
    (Q : Polynomial A) (hQ : Q.Monic) (F : PowerSeries A) (hF : IsEntire F) :
    Tendsto (fun n : ℕ => (polynomialSpectralResultant n Q.natDegree
      (1-Q.reverse) (PowerSeries.trunc (n+1) F)).eval 1)
      atTop (𝓝 (entireResultant hA Q hQ F hF)) := by sorry

theorem tendsto_spectral_simultaneous_trunc_eval
    (Q : Polynomial A) (hQ : Q.Monic) (F : PowerSeries A) (hF : IsEntire F)
    (hF0 : F.coeff 0 = 1) :
    Tendsto (fun n : ℕ => (polynomialSpectralResultant n n
      (PowerSeries.trunc (n+1) ((1-Q.reverse : Polynomial A) : PowerSeries A))
      (PowerSeries.trunc (n+1) F)).eval 1)
      atTop (𝓝 (entireResultant hA Q hQ F hF)) := by sorry
end EntireResultantLimit

-- ReciprocalLimitTests.unit_divisor: the empty resultant is one.
example (n : ℕ) (P : Polynomial ℤ) :
    (polynomialSpectralResultant n 0 0 P).eval 1 = 1 := by sorry
-- ReciprocalLimitTests.linear_sign: the reciprocal/swap signs cancel.
example : (polynomialSpectralResultant 1 1 (Polynomial.C 3*Polynomial.X)
    (1-Polynomial.C 2*Polynomial.X : Polynomial ℤ)).eval 1 = -5 := by sorry
-- ReciprocalLimitTests.padding: retain the chosen rank even above actual degree.
example : (polynomialSpectralResultant 5 1 (Polynomial.C 2*Polynomial.X)
    (1+Polynomial.X^2 : Polynomial (ZMod 8))).eval 1 = 5 := by sorry
-- ReciprocalLimitTests.unnormalized: the auxiliary bound matters without P(0)=1.
example : (polynomialSpectralResultant 0 2 0 (Polynomial.C 2 : Polynomial ℤ)).eval 1 = 4 ∧
    (polynomialSpectralResultant 0 0 0 (Polynomial.C 2 : Polynomial ℤ)).eval 1 = 1 := by sorry
-- ReciprocalLimitTests.zero_polynomial: a positive-degree divisor gives zero.
example : Polynomial.resultant (Polynomial.X : Polynomial ℤ) 0 1 0 = 0 := by sorry
section LimitTests
variable {A : Type*} [NormedCommRing A] [NormOneClass A] [CompleteSpace A] [Nontrivial A]
variable (hA : ∀ x y : A, ‖x+y‖ ≤ max ‖x‖ ‖y‖)
-- ReciprocalLimitTests.quotient_one: degree zero causes no analytic exception.
example (F : PowerSeries A) (hF : IsEntire F) (k : ℕ) :
    Tendsto (fun n : ℕ => (entireMonicQuotient (1 : Polynomial A)
      ((PowerSeries.trunc (n+1) F : Polynomial A) : PowerSeries A)).coeff k)
      atTop (𝓝 (F.coeff k)) := by sorry
-- ReciprocalLimitTests.linear_limit: fixed-polynomial scalar limit is ordinary evaluation.
example (a : A) (F : PowerSeries A) (hF : IsEntire F) :
    Tendsto (fun n : ℕ => (polynomialSpectralResultant n 1
      (Polynomial.C a*Polynomial.X) (PowerSeries.trunc (n+1) F)).eval 1)
      atTop (𝓝 (entire_eval F a)) := by sorry
-- ReciprocalLimitTests.constant_entire: both truncations stabilize, including n=0.
example (Q : Polynomial A) (hQ : Q.Monic) :
    Tendsto (fun n : ℕ => (polynomialSpectralResultant n n
      (PowerSeries.trunc (n+1) ((1-Q.reverse : Polynomial A) : PowerSeries A)) 1).eval 1)
      atTop (𝓝 (1 : A)) := by sorry
end LimitTests
end TauCeti.NonarchimedeanFredholm

/-! Entire Gauss convergence on the existing native power-series carrier.
The general spectral transform still requires its own coefficient estimates. -/
noncomputable section
open Filter
open scoped Topology
namespace TauCeti.NonarchimedeanFredholm
variable {A : Type*} [NormedCommRing A]
local notation "G" => PowerSeries.gaussNorm (norm : A → ℝ)

lemma isEntire_iff_forall_isRestricted (F : PowerSeries A) :
    IsEntire F ↔ ∀ R : ℝ, 0 < R → F.IsRestricted R := by sorry

lemma gaussSize_eq_gaussNorm (R : ℝ) (F : PowerSeries A) :
    gaussSize R F = G R F := by sorry

lemma gaussNorm_sub_trunc_le (F : PowerSeries A) (N : ℕ) (R S : ℝ)
    (hR : 0 < R) (hRS : R ≤ S) (hF : F.HasGaussNorm norm S) :
    G R (F - (PowerSeries.trunc N F : PowerSeries A)) ≤
      G S F * (R/S)^N := by sorry

lemma tendsto_gaussNorm_sub_trunc (F : PowerSeries A) (hF : IsEntire F)
    (R : ℝ) (hR : 0 < R) :
    Tendsto (fun N : ℕ => G R (F - (PowerSeries.trunc N F : PowerSeries A)))
      atTop (𝓝 0) := by sorry

lemma isEntire_of_coeff_tendsto_of_gauss_bounded
    (F : ℕ → PowerSeries A) (hF : ∀ i, IsEntire (F i)) (f : PowerSeries A)
    (hlim : ∀ k, Tendsto (fun i => (F i).coeff k) atTop (𝓝 (f.coeff k)))
    (hbd : ∀ S : ℝ, 0 < S → ∃ C : ℝ, 0 ≤ C ∧ ∀ i, G S (F i) ≤ C) :
    IsEntire f := by sorry

theorem tendsto_gaussNorm_of_coeff_tendsto_of_gauss_bounded
    (hA : ∀ x y : A, ‖x+y‖ ≤ max ‖x‖ ‖y‖)
    (F : ℕ → PowerSeries A) (hF : ∀ i, IsEntire (F i)) (f : PowerSeries A)
    (hlim : ∀ k, Tendsto (fun i => (F i).coeff k) atTop (𝓝 (f.coeff k)))
    (hbd : ∀ S : ℝ, 0 < S → ∃ C : ℝ, 0 ≤ C ∧ ∀ i, G S (F i) ≤ C)
    (R : ℝ) (hR : 0 < R) :
    Tendsto (fun i => G R (F i - f)) atTop (𝓝 0) := by sorry

lemma gauss_bounded_of_cauchy
    (hA : ∀ x y : A, ‖x+y‖ ≤ max ‖x‖ ‖y‖)
    (F : ℕ → PowerSeries A) (hF : ∀ i, IsEntire (F i)) (R : ℝ) (hR : 0 < R)
    (hC : ∀ ε : ℝ, 0 < ε → ∃ N : ℕ, ∀ i ≥ N, ∀ j ≥ N, G R (F i - F j) < ε) :
    ∃ C : ℝ, 0 ≤ C ∧ ∀ i, G R (F i) ≤ C := by sorry

theorem existsUnique_entire_gauss_limit [CompleteSpace A]
    (hA : ∀ x y : A, ‖x+y‖ ≤ max ‖x‖ ‖y‖)
    (F : ℕ → PowerSeries A) (hF : ∀ i, IsEntire (F i))
    (hC : ∀ R : ℝ, 0 < R → ∀ ε : ℝ, 0 < ε →
      ∃ N : ℕ, ∀ i ≥ N, ∀ j ≥ N, G R (F i - F j) < ε) :
    ∃! f : PowerSeries A, IsEntire f ∧ ∀ R : ℝ, 0 < R →
      Tendsto (fun i => G R (F i - f)) atTop (𝓝 0) := by sorry

theorem tendstoUniformlyOn_entire_eval_of_gauss [CompleteSpace A]
    (hA : ∀ x y : A, ‖x+y‖ ≤ max ‖x‖ ‖y‖)
    {ι : Type*} (l : Filter ι) (F : ι → PowerSeries A) (hF : ∀ i, IsEntire (F i))
    (f : PowerSeries A) (hf : IsEntire f) (R : ℝ) (hR : 0 < R)
    (hlim : Tendsto (fun i => G R (F i - f)) l (𝓝 0)) :
    TendstoUniformlyOn (fun i a => entire_eval (F i) a) (entire_eval f) l
      {a : A | ‖a‖ ≤ R} := by sorry

lemma tendsto_gaussNorm_mul
    (hA : ∀ x y : A, ‖x+y‖ ≤ max ‖x‖ ‖y‖)
    (F H : ℕ → PowerSeries A) (hF : ∀ i, IsEntire (F i)) (hH : ∀ i, IsEntire (H i))
    (f h : PowerSeries A) (hf : IsEntire f) (hh : IsEntire h) (R : ℝ) (hR : 0 < R)
    (hFlim : Tendsto (fun i => G R (F i - f)) atTop (𝓝 0))
    (hHlim : Tendsto (fun i => G R (H i - h)) atTop (𝓝 0)) :
    Tendsto (fun i => G R (F i * H i - f*h)) atTop (𝓝 0) := by sorry

lemma gaussNorm_entireMonicQuotient_le [NormOneClass A] [CompleteSpace A] [Nontrivial A]
    (hA : ∀ x y : A, ‖x+y‖ ≤ max ‖x‖ ‖y‖)
    (Q : Polynomial A) (hQ : Q.Monic) (C R S : ℝ) (hC : 1 ≤ C)
    (hCS : C ≤ S) (hR : 0 < R) (hRS : R ≤ S)
    (hQb : ∀ i : ℕ, ‖Q.reverse.coeff i‖ ≤ C^i)
    (F : PowerSeries A) (hF : IsEntire F) :
    G R (entireMonicQuotient Q F) ≤ G S F / S^Q.natDegree := by sorry

lemma tendsto_gaussNorm_entireMonicQuotient [NormOneClass A] [CompleteSpace A] [Nontrivial A]
    (hA : ∀ x y : A, ‖x+y‖ ≤ max ‖x‖ ‖y‖)
    (Q : Polynomial A) (hQ : Q.Monic) (F : ℕ → PowerSeries A)
    (hF : ∀ i, IsEntire (F i)) (f : PowerSeries A) (hf : IsEntire f)
    (hlim : ∀ S : ℝ, 0 < S → Tendsto (fun i => G S (F i - f)) atTop (𝓝 0))
    (R : ℝ) (hR : 0 < R) :
    Tendsto (fun i => G R (entireMonicQuotient Q (F i) - entireMonicQuotient Q f))
      atTop (𝓝 0) := by sorry
end TauCeti.NonarchimedeanFredholm

namespace EntireGaussTests
open TauCeti.NonarchimedeanFredholm
variable {A : Type*} [NormedCommRing A]
-- EntireGaussTests.native_polynomial
example (R : ℝ) (P : Polynomial A) :
    gaussSize R (polynomialSeries P) = PowerSeries.gaussNorm norm R (P : PowerSeries A) := by sorry
-- EntireGaussTests.tail_boundary
example (a : A) (N : ℕ) (R : ℝ) (hR : 0 < R) :
    PowerSeries.gaussNorm norm R (PowerSeries.monomial N a -
      (PowerSeries.trunc N (PowerSeries.monomial N a) : PowerSeries A)) = ‖a‖*R^N := by sorry
-- EntireGaussTests.zero_truncation
example (F : PowerSeries A) (R : ℝ) :
    PowerSeries.gaussNorm norm R (F - (PowerSeries.trunc 0 F : PowerSeries A)) =
      PowerSeries.gaussNorm norm R F := by sorry
-- EntireGaussTests.moving_monomials
example [NormOneClass A] :
    (∀ k : ℕ, Tendsto (fun N : ℕ => (PowerSeries.monomial N (1 : A)).coeff k) atTop (𝓝 0)) ∧
    (∀ N : ℕ, PowerSeries.gaussNorm norm 1 (PowerSeries.monomial N (1 : A)) = 1) ∧
    (∀ N : ℕ, entire_eval (PowerSeries.monomial N (1 : A)) 1 = 1) := by sorry
-- EntireGaussTests.radius_loss
example [NormOneClass A] (N : ℕ) :
    PowerSeries.gaussNorm norm (1/2 : ℝ) (PowerSeries.monomial N (1 : A)) = (1/2 : ℝ)^N ∧
    PowerSeries.gaussNorm norm 2 (PowerSeries.monomial N (1 : A)) = (2 : ℝ)^N := by sorry
-- EntireGaussTests.nilpotent_product
example (e : A) (he : e^2 = 0) (hne : e ≠ 0) (R : ℝ) (hR : 0 < R) :
    let f := PowerSeries.monomial 1 e
    PowerSeries.gaussNorm norm R (f*f) = 0 ∧
      0 < PowerSeries.gaussNorm norm R f * PowerSeries.gaussNorm norm R f := by sorry
-- EntireGaussTests.quotient_identity
example [NormOneClass A] [CompleteSpace A] [Nontrivial A]
    (hA : ∀ x y : A, ‖x+y‖ ≤ max ‖x‖ ‖y‖) (F : PowerSeries A) (hF : IsEntire F) :
    entireMonicQuotient 1 F = F := by sorry
-- EntireGaussTests.uniform_truncation_evaluation
example [CompleteSpace A] (hA : ∀ x y : A, ‖x+y‖ ≤ max ‖x‖ ‖y‖)
    (F : PowerSeries A) (hF : IsEntire F) (R : ℝ) (hR : 0 < R) :
    TendstoUniformlyOn (fun N a => entire_eval (PowerSeries.trunc N F : PowerSeries A) a)
      (entire_eval F) atTop {a : A | ‖a‖ ≤ R} := by sorry
end EntireGaussTests
end

/-! Entire functional input with a fixed polynomial characteristic input.
The rank is explicit. General entire characteristic input still needs uniform estimates. -/
noncomputable section
open Filter
open scoped Topology
namespace TauCeti.NonarchimedeanFredholm
section FiniteSpectralCoordinates
variable {R : Type*} [CommRing R]
lemma polynomialSpectralResultant_modByMonic (n m : ℕ) (B P : Polynomial R)
    (hP : P.coeff 0 = 1) (hn : P.natDegree ≤ n) (hm : B.natDegree ≤ m) :
    polynomialSpectralResultant n m B P =
      polynomialSpectralResultant n n (B %ₘ P.reflect n) P := sorry
lemma polynomialSpectralResultant_natDegree_le (n m : ℕ) (B P : Polynomial R) :
    (polynomialSpectralResultant n m B P).natDegree ≤ n := sorry
lemma continuous_polynomialSpectralResultant_coeff [TopologicalSpace R]
    [IsTopologicalRing R] [DecidableEq R] (n m k : ℕ) (P : Polynomial R) :
    Continuous (fun b : Fin (m+1) → R =>
      (polynomialSpectralResultant n m (Polynomial.ofFn (m+1) b) P).coeff k) := sorry
end FiniteSpectralCoordinates

section BoundedDegreeGauss
variable {A : Type*} [NormedCommRing A]
lemma tendsto_gaussNorm_of_bounded_degree {ι : Type*} (l : Filter ι)
    (F : ι → Polynomial A) (f : Polynomial A) (d : ℕ)
    (hF : ∀ i, (F i).natDegree ≤ d) (hf : f.natDegree ≤ d)
    (hlim : ∀ k, Tendsto (fun i => (F i).coeff k) l (𝓝 (f.coeff k)))
    (R : ℝ) (hR : 0 < R) :
    Tendsto (fun i => PowerSeries.gaussNorm norm R ((F i-f : Polynomial A) : PowerSeries A))
      l (𝓝 0) := sorry

def entirePolynomialSpectral (n : ℕ) (B : PowerSeries A) (P : Polynomial A) : Polynomial A := sorry
lemma entirePolynomialSpectral_def (n : ℕ) (B : PowerSeries A) (P : Polynomial A) :
    entirePolynomialSpectral n B P = polynomialSpectralResultant n n
      (PowerSeries.trunc n (B - (P.reflect n : PowerSeries A) * entireMonicQuotient (P.reflect n) B)) P := sorry
lemma entirePolynomialSpectral_constantCoeff (n : ℕ) (B : PowerSeries A)
    (P : Polynomial A) (hP : P.coeff 0 = 1) :
    (entirePolynomialSpectral n B P).coeff 0 = 1 := sorry
lemma entirePolynomialSpectral_zero (n : ℕ) (P : Polynomial A)
    (hP : P.coeff 0 = 1) (hn : P.natDegree ≤ n) :
    entirePolynomialSpectral n 0 P = 1 := sorry
end BoundedDegreeGauss

section EntireFixedCharacteristic
variable {A : Type*} [NormedCommRing A] [hNormOne : NormOneClass A]
  [hComplete : CompleteSpace A] [hNontrivial : Nontrivial A]
variable (hA : ∀ x y : A, ‖x+y‖ ≤ max ‖x‖ ‖y‖)
include hA hNormOne hComplete hNontrivial

lemma entirePolynomialSpectral_polynomial (n m : ℕ) (B P : Polynomial A)
    (hP : P.coeff 0 = 1) (hn : P.natDegree ≤ n) (hm : B.natDegree ≤ m) :
    entirePolynomialSpectral n (B : PowerSeries A) P = polynomialSpectralResultant n m B P := sorry
lemma tendsto_spectral_fixed_polynomial_coeff (n : ℕ) (B : PowerSeries A)
    (hB : IsEntire B) (P : Polynomial A) (hP : P.coeff 0 = 1) (hn : P.natDegree ≤ n) (k : ℕ) :
    Tendsto (fun N : ℕ => (polynomialSpectralResultant n N (PowerSeries.trunc (N+1) B) P).coeff k)
      atTop (𝓝 ((entirePolynomialSpectral n B P).coeff k)) := sorry
theorem tendsto_spectral_fixed_polynomial_gauss (n : ℕ) (B : PowerSeries A)
    (hB : IsEntire B) (P : Polynomial A) (hP : P.coeff 0 = 1) (hn : P.natDegree ≤ n)
    (R : ℝ) (hR : 0 < R) :
    Tendsto (fun N : ℕ => PowerSeries.gaussNorm norm R
      ((polynomialSpectralResultant n N (PowerSeries.trunc (N+1) B) P -
        entirePolynomialSpectral n B P : Polynomial A) : PowerSeries A)) atTop (𝓝 0) := sorry
theorem tendsto_spectral_simultaneous_fixed_polynomial_gauss
    (B : PowerSeries A) (hB : IsEntire B) (hB0 : B.coeff 0 = 0)
    (P : Polynomial A) (hP : P.coeff 0 = 1) (R : ℝ) (hR : 0 < R) :
    Tendsto (fun N : ℕ => PowerSeries.gaussNorm norm R
      ((polynomialSpectralResultant N N (PowerSeries.trunc (N+1) B)
        (PowerSeries.trunc (N+1) (P : PowerSeries A)) -
        entirePolynomialSpectral P.natDegree B P : Polynomial A) : PowerSeries A)) atTop (𝓝 0) := sorry
lemma entirePolynomialSpectral_padding (n : ℕ) (B : PowerSeries A) (hB : IsEntire B)
    (P : Polynomial A) (hP : P.coeff 0 = 1) (hn : P.natDegree ≤ n) :
    entirePolynomialSpectral (n+1) B P = entirePolynomialSpectral n B P *
      (1 - Polynomial.C (B.coeff 0) * Polynomial.X) := sorry
theorem entirePolynomialSpectral_mul (n k : ℕ) (B : PowerSeries A) (hB : IsEntire B)
    (P Q : Polynomial A) (hP : P.coeff 0 = 1) (hQ : Q.coeff 0 = 1)
    (hn : P.natDegree ≤ n) (hk : Q.natDegree ≤ k) :
    entirePolynomialSpectral (n+k) B (P*Q) =
      entirePolynomialSpectral n B P * entirePolynomialSpectral k B Q := sorry
theorem entirePolynomialSpectral_linear (B : PowerSeries A) (hB : IsEntire B) (a : A) :
    entirePolynomialSpectral 1 B (1-Polynomial.C a*Polynomial.X) =
      1-Polynomial.C (entire_eval B a)*Polynomial.X := sorry

-- FixedSpectralTests.empty_rank
example (B : PowerSeries A) : entirePolynomialSpectral 0 B 1 = 1 := sorry
-- FixedSpectralTests.zero_function
example (n : ℕ) (P : Polynomial A) (hP : P.coeff 0 = 1) (hn : P.natDegree ≤ n) :
    entirePolynomialSpectral n 0 P = 1 := sorry
-- FixedSpectralTests.constant_padding
example (c : A) : entirePolynomialSpectral 2 (PowerSeries.C c) 1 =
    (1-Polynomial.C c*Polynomial.X)^2 := sorry
-- FixedSpectralTests.linear_value
example (B : PowerSeries A) (hB : IsEntire B) (a : A) :
    entirePolynomialSpectral 1 B (1-Polynomial.C a*Polynomial.X) =
      1-Polynomial.C (entire_eval B a)*Polynomial.X := sorry
-- FixedSpectralTests.nilpotent_coefficients
example (e : A) (he : e^2 = 0) :
    entirePolynomialSpectral 2 (PowerSeries.X : PowerSeries A)
      (1-Polynomial.C e*Polynomial.X^2) = 1-Polynomial.C e*Polynomial.X^2 := sorry
-- FixedSpectralTests.unit_input_zero_constant
example (n : ℕ) (B : PowerSeries A) (hB : IsEntire B) (hB0 : B.coeff 0 = 0) :
    entirePolynomialSpectral n B 1 = 1 := sorry
end EntireFixedCharacteristic
end TauCeti.NonarchimedeanFredholm
end

/-!
## L0–L2: locally analytic functions, the Amice transform and order-r distributions

Signatures (comment only; the objects are Colmez's `LA_h`, `D(ℤ_p, L)`, `C^r` and `D_r`):

```
-- L0/locally-analytic-radius, locally-analytic-distributions
def LAh (h : ℕ) : Type _            -- LA_h(ℤ_p, L), Banach with v_{LA_h}
def LA : Type _ := lim→ LAh          -- inductive-limit (compact type) topology
def Dist : Type _ := LA →L[L] L      -- Fréchet dual = lim← (LAh h)′
theorem amice_mahler_basis (h : ℕ) : IsOrthonormalBasis (fun n ↦ ((n / p ^ h)! : L) • binomial n)
-- L1/amice-transform
def amice : Dist ≃L[L] OpenDiscFunctions L   -- μ ↦ Σ Tⁿ ∫ C(x, n) μ
-- L2/order-r-distributions, amice-velu-vishik
def DistOrder (r : ℝ≥0) : Submodule L Dist   -- extends continuously to C^r
theorem amice_velu_vishik (r : ℝ≥0) (N : ℕ∞) (hN : ⌊r⌋₊ ≤ N) (μ : LocPoly N →ₗ[L] L)
    (hμ : ∃ C, ∀ a k n, k ≤ N → C - r * n ≤ v (μ (ballMonomial a n k))) :
    ∃! μ' ∈ DistOrder r, ∀ f, μ' f = μ f
```
-/

namespace TauCeti.LocallyAnalytic.SuggestedTest

/-- `L0/amice-mahler-basis`: `v_3((3²)!) = (3² − 1)/(3 − 1) = 4`, the size of `C(x, 9)` in `LA₀`. -/
example : Nat.factorial 9 % 3 ^ 4 = 0 ∧ Nat.factorial 9 % 3 ^ 5 ≠ 0 := by
  norm_num [Nat.factorial]

/-- `L2/amice-velu-vishik`: `d^{N+1}δ₀` kills every polynomial of degree `≤ N`, so uniqueness fails at
`r = N + 1`. -/
example (P : Polynomial ℚ) (N : ℕ) (h : P.natDegree ≤ N) :
    Polynomial.derivative^[N + 1] P = 0 :=
  Polynomial.iterate_derivative_eq_zero (by omega)

/-- `L2/order-zero-measures`: the Haar distribution `μ(a + pⁿℤ_p) = p^{−n}` is additive over the `p`
sub-balls. -/
example (p : ℚ) (hp : p ≠ 0) (n : ℕ) : (p ^ n)⁻¹ = p * (p ^ (n + 1))⁻¹ := by
  field_simp
  ring

end TauCeti.LocallyAnalytic.SuggestedTest

/-! Scalar Mellin checkpoint, Codex codex-yAUVaO (2026-10-05).
Only the newly added L1/L3 adapters are represented below; existing signatures remain above.
All signatures and tests with omitted proofs remain unchecked plans. -/
noncomputable section
open Filter
open scoped Topology AbstractMeasure
namespace TauCeti.Mellin
variable {p : ℕ} [Fact p.Prime]
variable {K : Type*} [NontriviallyNormedField K] [CompleteSpace K]
  [Algebra ℤ_[p] K] [IsBoundedSMul ℤ_[p] K] [IsUltrametricDist K]

-- The predicate uses native radius-restricted series; it is not a new carrier.
def OnOpenDisc (F : PowerSeries K) : Prop :=
  ∀ R : ℝ, 0 < R → R < 1 → PowerSeries.IsRestricted R F

-- Evaluation is the native scalar-series sum, not a second construction.
abbrev evalOpen (F : PowerSeries K) (t : K) : K :=
  FormalMultilinearSeries.ofScalarsSum (fun n => F.coeff n) t
lemma evalOpen_def (F : PowerSeries K) (t : K) :
    evalOpen F t = ∑' n : ℕ, F.coeff n * t ^ n := by sorry
lemma evalOpen_zero (F : PowerSeries K) : evalOpen F 0 = F.coeff 0 := by sorry
lemma evalOpen_C (a t : K) : evalOpen (PowerSeries.C a) t = a := by sorry
lemma evalOpen_X (t : K) : evalOpen PowerSeries.X t = t := by sorry
lemma evalOpen_add (F H : PowerSeries K) (hF : OnOpenDisc F) (hH : OnOpenDisc H)
    (t : K) (ht : ‖t‖ < 1) : evalOpen (F + H) t = evalOpen F t + evalOpen H t := by sorry
lemma evalOpen_smul (F : PowerSeries K) (hF : OnOpenDisc F) (a t : K) (ht : ‖t‖ < 1) :
    evalOpen (a • F) t = a * evalOpen F t := by sorry
-- MellinEvalTests.zero_series
example (t : K) : evalOpen 0 t = 0 := by sorry
-- MellinEvalTests.linear
example (a b t : K) : evalOpen (PowerSeries.C a + PowerSeries.C b * PowerSeries.X) t =
    a + b*t := by sorry
-- MellinEvalTests.geometric
example (t : K) (ht : ‖t‖ < 1) : evalOpen (PowerSeries.mk (fun _ => (1 : K))) t =
    (1-t)⁻¹ := by sorry
-- MellinEvalTests.boundary
example : ¬ Summable (fun _ : ℕ => (1 : K)) := by sorry

-- L1/open-disc-native-radius
lemma openDisc_native_radius (F : PowerSeries K) (hF : OnOpenDisc F) :
    (1 : ENNReal) ≤ (FormalMultilinearSeries.ofScalars K (fun n => F.coeff n)).radius := by sorry

-- L1/open-disc-summability
lemma openDisc_summable (F : PowerSeries K) (hF : OnOpenDisc F)
    (t : K) (ht : ‖t‖ < 1) : Summable (fun n : ℕ => F.coeff n * t ^ n) := by sorry
-- L1/open-disc-uniform-tail
lemma evalOpen_tail_bound (F : PowerSeries K) (hF : OnOpenDisc F) (R S M : ℝ)
    (hR : 0 < R) (hRS : R < S) (hS : S < 1) (hM : 0 ≤ M)
    (hb : ∀ n : ℕ, ‖F.coeff n‖ * S^n ≤ M) (t : K) (ht : ‖t‖ ≤ R) (N : ℕ) :
    ‖evalOpen F t - ∑ n ∈ Finset.range N, F.coeff n * t^n‖ ≤ M * (R/S)^N := by sorry
-- L1/open-disc-evaluation-analytic
theorem analyticOnNhd_evalOpen (F : PowerSeries K) (hF : OnOpenDisc F) :
    AnalyticOnNhd K (evalOpen F) {t : K | ‖t‖ < 1} := by sorry
-- L1/open-disc-evaluation-mul
lemma evalOpen_mul (F H : PowerSeries K) (hF : OnOpenDisc F) (hH : OnOpenDisc H)
    (t : K) (ht : ‖t‖ < 1) : evalOpen (F * H) t = evalOpen F t * evalOpen H t := by sorry
-- L1/open-disc-evaluation-map
lemma evalOpen_map {L : Type*} [NontriviallyNormedField L] [CompleteSpace L]
    [IsUltrametricDist L] (φ : K →+* L) (hφ : Isometry φ)
    (F : PowerSeries K) (hF : OnOpenDisc F) (t : K) (ht : ‖t‖ < 1) :
    evalOpen (PowerSeries.map φ F) (φ t) = φ (evalOpen F t) := by sorry

section Components
variable {G Δ : Type*} [TopologicalSpace G] [CompactSpace G]
  [Fintype Δ] [TopologicalSpace Δ] [DiscreteTopology Δ]
-- L3/finite-character-component-mellin: H is an imported chart, ν an imported finite character.
def componentMellin (H : G ≃ₜ Δ × ℤ_[p]) (ν : Δ → K)
    (μ : AbstractMeasure G K K) : PowerSeries K := by sorry
lemma componentMellin_coeff (H : G ≃ₜ Δ × ℤ_[p]) (ν : Δ → K)
    (μ : AbstractMeasure G K K) (n : ℕ) :
    (componentMellin H ν μ).coeff n = μ ⟨fun g =>
      ν (H g).1 * algebraMap ℤ_[p] K (mahler n (H g).2), by fun_prop⟩ := by sorry
lemma componentMellin_add (H : G ≃ₜ Δ × ℤ_[p]) (ν : Δ → K)
    (μ η : AbstractMeasure G K K) :
    componentMellin H ν (μ+η) = componentMellin H ν μ + componentMellin H ν η := by sorry
lemma componentMellin_smul (H : G ≃ₜ Δ × ℤ_[p]) (ν : Δ → K)
    (a : K) (μ : AbstractMeasure G K K) :
    componentMellin H ν (a • μ) = a • componentMellin H ν μ := by sorry
lemma componentMellin_dirac (H : G ≃ₜ Δ × ℤ_[p]) (ν : Δ → K) (g : G) :
    componentMellin H ν (AbstractMeasure.dirac K g) =
      PowerSeries.mk (fun n => ν (H g).1 * algebraMap ℤ_[p] K (mahler n (H g).2)) := by sorry
lemma componentMellin_mass (H : G ≃ₜ Δ × ℤ_[p]) (ν : Δ → K)
    (μ : AbstractMeasure G K K) :
    (componentMellin H ν μ).coeff 0 = μ ⟨fun g => ν (H g).1, by fun_prop⟩ := by sorry
-- ComponentMellinTests.zero
example (H : G ≃ₜ Δ × ℤ_[p]) (ν : Δ → K) : componentMellin H ν 0 = 0 := by sorry
-- ComponentMellinTests.finite_atom
example (H : G ≃ₜ Δ × ℤ_[p]) (ν : Δ → K) (δ : Δ) :
    componentMellin H ν (AbstractMeasure.dirac K (H.symm (δ,0))) =
      PowerSeries.C (ν δ) := by sorry
-- ComponentMellinTests.generator_atom
example (H : G ≃ₜ Δ × ℤ_[p]) (ν : Δ → K) (δ : Δ) :
    componentMellin H ν (AbstractMeasure.dirac K (H.symm (δ,1))) =
      PowerSeries.C (ν δ) * (1+PowerSeries.X) := by sorry
-- ComponentMellinTests.native_amice
example (μ : AbstractMeasure ℤ_[p] K K) :
    componentMellin (Homeomorph.uniqueProd PUnit ℤ_[p]).symm (fun _ => (1 : K)) μ =
      μ.amiceTransform := by sorry
-- L3/component-mellin-coefficient-bound
lemma componentMellin_coeff_bound (H : G ≃ₜ Δ × ℤ_[p]) (ν : Δ → K)
    (μ : AbstractMeasure G K K) (C : ℝ) (hC : 0 ≤ C) (hν : ∀ δ, ‖ν δ‖ ≤ C) (n : ℕ) :
    ‖(componentMellin H ν μ).coeff n‖ ≤ ‖AbstractMeasure.toCLMEquiv μ‖ * C := by sorry
-- L3/component-mellin-open-disc
theorem componentMellin_onOpenDisc (H : G ≃ₜ Δ × ℤ_[p]) (ν : Δ → K)
    (μ : AbstractMeasure G K K) : OnOpenDisc (componentMellin H ν μ) := by sorry
-- L3/component-mellin-evaluation
theorem componentMellin_eval (H : G ≃ₜ Δ × ℤ_[p]) (ν : Δ → K)
    (μ : AbstractMeasure G K K) (t : K) (ht : ‖t‖ < 1) :
    evalOpen (componentMellin H ν μ) t = μ ⟨fun g => ν (H g).1 *
      PadicInt.addChar_of_value_at_one t
        (tendsto_pow_atTop_nhds_zero_iff_norm_lt_one.mpr ht) (H g).2, by fun_prop⟩ := by sorry
end Components

-- L3/branch-mellin
def branchMellin (F : PowerSeries K) (q : K) (hq : ‖q‖ < 1) (s : ℤ_[p]) : K :=
    evalOpen F (PadicInt.addChar_of_value_at_one q
      (tendsto_pow_atTop_nhds_zero_iff_norm_lt_one.mpr hq) s - 1)
lemma branchMellin_def (F : PowerSeries K) (q : K) (hq : ‖q‖ < 1) (s : ℤ_[p]) :
    branchMellin F q hq s = evalOpen F (PadicInt.addChar_of_value_at_one q
      (tendsto_pow_atTop_nhds_zero_iff_norm_lt_one.mpr hq) s - 1) := by sorry
lemma branchMellin_zero (F : PowerSeries K) (q : K) (hq : ‖q‖ < 1) :
    branchMellin (p := p) F q hq 0 = F.coeff 0 := by sorry
lemma branchMellin_one (F : PowerSeries K) (q : K) (hq : ‖q‖ < 1) :
    branchMellin (p := p) F q hq 1 = evalOpen F q := by sorry
lemma branchMellin_add (F H : PowerSeries K) (hF : OnOpenDisc F) (hH : OnOpenDisc H)
    (q : K) (hq : ‖q‖ < 1) (s : ℤ_[p]) :
    branchMellin (F+H) q hq s = branchMellin F q hq s + branchMellin H q hq s := by sorry
-- BranchMellinTests.zero
example (q : K) (hq : ‖q‖ < 1) (s : ℤ_[p]) : branchMellin 0 q hq s = 0 := by sorry
-- BranchMellinTests.constant
example (a q : K) (hq : ‖q‖ < 1) (s : ℤ_[p]) :
    branchMellin (PowerSeries.C a) q hq s = a := by sorry
-- BranchMellinTests.linear_at_one
example (q : K) (hq : ‖q‖ < 1) : branchMellin (p := p) PowerSeries.X q hq 1 = q := by sorry
-- BranchMellinTests.generator_at_zero
example (q : K) (hq : ‖q‖ < 1) : branchMellin (p := p) (1+PowerSeries.X) q hq 0 = 1 := by sorry
-- L3/branch-coordinate-domain
lemma branchCoordinate_norm_le (q : K) (hq : ‖q‖ < 1) (s : ℤ_[p]) :
    ‖PadicInt.addChar_of_value_at_one q
      (tendsto_pow_atTop_nhds_zero_iff_norm_lt_one.mpr hq) s - 1‖ ≤ ‖q‖ := by sorry
-- L3/branch-integer-evaluation
lemma branchMellin_nat (F : PowerSeries K) (q : K) (hq : ‖q‖ < 1) (n : ℕ) :
    branchMellin F q hq (n : ℤ_[p]) = evalOpen F ((1+q)^n-1) := by sorry

-- L3/meromorphic-mellin-clearing: domain is guarded at the point of use.
def quotientMellin (F D : PowerSeries K) (t : K) : K := evalOpen F t / evalOpen D t
lemma quotientMellin_def (F D : PowerSeries K) (t : K) :
    quotientMellin F D t = evalOpen F t / evalOpen D t := by sorry
lemma quotientMellin_clear (F D : PowerSeries K) (t : K) (hD : evalOpen D t ≠ 0) :
    evalOpen D t * quotientMellin F D t = evalOpen F t := by sorry
lemma quotientMellin_one (F : PowerSeries K) (t : K) :
    quotientMellin F 1 t = evalOpen F t := by sorry
lemma quotientMellin_zero (D : PowerSeries K) (t : K) : quotientMellin 0 D t = 0 := by sorry
-- QuotientMellinTests.no_denominator
example (F : PowerSeries K) (t : K) : quotientMellin F 1 t = evalOpen F t := by sorry
-- QuotientMellinTests.simple_pole
example (t : K) (ht : t ≠ 0) : quotientMellin 1 PowerSeries.X t = t⁻¹ := by sorry
-- QuotientMellinTests.removable_on_punctured_disc
example (t : K) (ht : t ≠ 0) : quotientMellin PowerSeries.X PowerSeries.X t = 1 := by sorry
-- QuotientMellinTests.trivial_character_excluded
example : evalOpen (PowerSeries.X : PowerSeries K) 0 = 0 := by sorry
-- L3/meromorphic-clearing-independence
lemma quotientMellin_independent (F D F' D' : PowerSeries K)
    (hF : OnOpenDisc F) (hD : OnOpenDisc D) (hF' : OnOpenDisc F') (hD' : OnOpenDisc D')
    (h : F*D'=F'*D) (t : K) (ht : ‖t‖ < 1)
    (hDt : evalOpen D t ≠ 0) (hD't : evalOpen D' t ≠ 0) :
    quotientMellin F D t = quotientMellin F' D' t := by sorry
end TauCeti.Mellin

end
