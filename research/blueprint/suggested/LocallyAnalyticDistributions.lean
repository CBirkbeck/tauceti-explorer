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

/-- Bundling of the API item entire_eval. -/
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

/- Monic polynomial and entire-series hypotheses are actual propositions. -/
def entireResultant (Q : Polynomial A) (hQ : Q.Monic)
    (f : PowerSeries A) (hf : IsEntire f) : A := by sorry

theorem entireResultant_remainder (Q : Polynomial A) (hQ : Q.Monic)
    (f g s : PowerSeries A) (hf : IsEntire f) (hg : IsEntire g)
    (hs : IsEntire s) (h : f = polynomialSeries Q * s + g) :
    entireResultant Q hQ f hf = entireResultant Q hQ g hg := by sorry

theorem entireResultant_mul (Q : Polynomial A) (hQ : Q.Monic)
    (f g : PowerSeries A) (hf : IsEntire f) (hg : IsEntire g)
    (hfg : IsEntire (f*g)) :
    entireResultant Q hQ (f*g) hfg =
      entireResultant Q hQ f hf * entireResultant Q hQ g hg := by sorry

theorem entireResultant_linear (a : A) (f : PowerSeries A) (hf : IsEntire f)
    (hq : (Polynomial.X - Polynomial.C a).Monic) :
    entireResultant (Polynomial.X - Polynomial.C a) hq f hf = entire_eval f a := by sorry

-- Unit test: constant_divisor, including f=0.
example (f : PowerSeries A) (hf : IsEntire f) (hq : (1 : Polynomial A).Monic) :
    entireResultant 1 hq f hf = 1 := by sorry
-- Unit test: linear_evaluation.
example (a b : A) (hq : (Polynomial.X - Polynomial.C a).Monic)
    (hf : IsEntire (1 - PowerSeries.C b * PowerSeries.X)) :
    entireResultant (Polynomial.X - Polynomial.C a) hq
      (1 - PowerSeries.C b * PowerSeries.X) hf = 1 - b*a := by sorry
-- Unit test: common_factor.
example (Q : Polynomial A) (hQ : Q.Monic) (hd : 0 < Q.natDegree)
    (hf : IsEntire (polynomialSeries Q)) :
    entireResultant Q hQ (polynomialSeries Q) hf = 0 := by sorry

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
