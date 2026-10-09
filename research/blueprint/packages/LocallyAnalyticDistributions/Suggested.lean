import Mathlib
import TauCeti.RingTheory.Polynomial.Resultant.AdjoinRoot

/-!
# Locally analytic distributions, growth and character spaces: representative target signatures

The mathematical roadmap is `README.md`. This file records definitions and theorem signatures which
can be stated against the pinned Mathlib and Tau Ceti APIs, together with the unit tests of the
roadmap's definitions as `example`s. It is not an exhaustive list of the results in any layer, and
the README is definitive where the two differ.

The file makes the following design choices explicit. Complete continuity over a Banach algebra `A`
is approximation in operator norm by maps whose image lies in a finitely generated `A`-submodule,
not finite `K`-rank; it is not identified with Mathlib's `IsCompactOperator`. Coefficient spaces are
Mathlib's `ZeroAtInftyContinuousMap` on a discrete index type, with input index first and output
index second. Entire series are power series restricted at every radius, with the Fréchet topology
of all Gauss norms; the Fredholm series is `det (1 - T u)` with constant coefficient `1`. Banach
stages of analytic functions and their duals are typed on these coefficient spaces; the global
compact-type inductive limit, its strong dual, completed projective tensor products and the
analytic character spaces are stated in the README and are absent here (see the closing comment).
-/

namespace TauCetiRoadmap.LocallyAnalyticDistributions

noncomputable section
open Filter
open scoped Topology ZeroAtInfty
/-! ## Layer 4: analytic families, Fredholm theory and finite-slope complexes — operator theory

The operator-theoretic half of Layer 4 (§4.1–§4.12 of the README) comes first because the Layer 0–3
signatures below reuse its coefficient spaces. -/

namespace Huber
variable {A M N : Type*} [NormedCommRing A]
  [NormedAddCommGroup M] [Module A M] [NormedAddCommGroup N] [Module A N]
/-- Complete continuity of a continuous `A`-linear map: approximation in operator norm by maps whose
range is a finitely generated `A`-submodule. This is the predicate of AdicSpacesPartII R3 stated over
a normed commutative ring; the two agree on affinoid algebras (README §4.1). -/
def IsCompletelyContinuous (f : M →L[A] N) : Prop :=
  ∀ ε : ℝ, 0 < ε → ∃ g : M →L[A] N,
    (LinearMap.range g.toLinearMap).FG ∧ ∀ x : M, ‖f x - g x‖ ≤ ε * ‖x‖
end Huber

namespace NonarchimedeanFredholm
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
  Huber.IsCompletelyContinuous f

include hNoeth in
/-- Finite ambient image versus finitely generated range: Noetherianity makes the conventions agree. -/
theorem hasFiniteAImage_iff_range_fg (f : M →L[A] N) :
    HasFiniteAImage f ↔ (LinearMap.range f.toLinearMap).FG := by sorry

include hNoeth in
/-- The containing-submodule convention of Buzzard equals the imported predicate. -/
theorem isCompletelyContinuous_iff_containing_finite (f : M →L[A] N) :
    IsCompletelyContinuous f ↔ ∀ ε : ℝ, 0 < ε → ∃ g : M →L[A] N,
      HasFiniteAImage g ∧ ∀ x : M, ‖f x - g x‖ ≤ ε * ‖x‖ := by sorry

include hNoeth in
/-- Strict norm approximation by finite-image maps: use the K-operator norm. -/
theorem isCompletelyContinuous_iff_norm_approximation (f : M →L[A] N) :
    IsCompletelyContinuous f ↔ ∀ ε : ℝ, 0 < ε → ∃ g : M →L[A] N,
      HasFiniteAImage g ∧ ‖(f - g).restrictScalars K‖ < ε := by sorry

include K in
/-- Complete continuity of the identity detects finite generation: neither ONability nor (Pr) is required. -/
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
/-- A continuous map whose image lies in a finitely generated A-submodule is completely continuous.
Part of the API of the target *Complete continuity in the Banach algebra convention*. -/
theorem finiteImage_isCompletelyContinuous (f : M →L[A] N)
    (hf : HasFiniteAImage f) : IsCompletelyContinuous f := by sorry

include K hNoeth in
/-- Composition with a bounded A-linear map on either side preserves complete continuity. Part of the
API of the target *Complete continuity in the Banach algebra convention*. -/
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

/-- Bounded coefficient action on c0: transfer the existing bounded-function sup norm. -/
theorem c0_norm_smul_le {I : Type*} [TopologicalSpace I]
    (a : A) (x : C₀(I, A)) : ‖a • x‖ ≤ ‖a‖ * ‖x‖ := by sorry

/-- Pointwise scalar multiplication is jointly continuous for the sup norm. -/
instance c0ContinuousSMul {I : Type*} [TopologicalSpace I] :
    ContinuousSMul A C₀(I, A) := by sorry

section Coordinates
variable {I : Type w} [TopologicalSpace I] [DiscreteTopology I] [DecidableEq I]

/-- Helpers use the existing C0 carrier, not a competing sequence space. -/
def c0Single (i : I) (a : A) : C₀(I, A) := by sorry
/-- Finite coordinate truncation. For a finite T⊆I, the existing helper π_T is the native continuous
A-linear endomorphism of c_A(I) that retains coordinates in T and sets every other coordinate to
zero. Its value is the finite sum Σ_{j∈T}x_j e_j; the carrier remains the native C0 space.
(Source: Buzzard, §2, pp.7–12 for coordinates; §3, full manuscript p.22.) -/
def coordinateProjection (S : Finset I) : C₀(I, A) →L[A] C₀(I, A) := by sorry

/-- Finite coordinate projections have norm at most one in an ON chart. Part of the API of the target
*Orthonormalizable and potentially orthonormalizable modules*. -/
theorem coordinateProjection_norm_le (S : Finset I) (x : C₀(I, A)) :
    ‖coordinateProjection S x‖ ≤ ‖x‖ := by sorry

def c0Lift
    (hM : ∀ x y : M, ‖x + y‖ ≤ max ‖x‖ ‖y‖)
    (hAM : ∀ (a : A) (x : M), ‖a • x‖ ≤ ‖a‖ * ‖x‖)
    (m : I → M) (hm : ∃ C : ℝ, ∀ i, ‖m i‖ ≤ C) : C₀(I, A) →L[A] M := by sorry

variable (hM : ∀ x y : M, ‖x + y‖ ≤ max ‖x‖ ‖y‖)
variable (hAM : ∀ (a : A) (x : M), ‖a • x‖ ≤ ‖a‖ * ‖x‖)

/-- The value on x is the unconditional sum of x_i m_i. Part of the API of the target *Bounded-family
extension from c0*. -/
theorem c0Lift_apply (m : I → M) (hm : ∃ C : ℝ, ∀ i, ‖m i‖ ≤ C)
    (x : C₀(I, A)) : c0Lift hM hAM m hm x = ∑' i, x i • m i := by sorry

/-- c0Lift(m)(e_i)=m_i. Part of the API of the target *Bounded-family extension from c0*. -/
theorem c0Lift_single (m : I → M) (hm : ∃ C : ℝ, ∀ i, ‖m i‖ ≤ C)
    (i : I) : c0Lift hM hAM m hm (c0Single i (1 : A)) = m i := by sorry

/-- Any continuous A-linear map with these basis values equals c0Lift(m). Part of the API of the
target *Bounded-family extension from c0*. -/
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
/-- Coordinates identify M with existing c_A(I) and reconstruct elements by unconditional summation.
Part of the API of the target *Orthonormalizable and potentially orthonormalizable modules*. -/
theorem orthonormalization_coordinates (e : M ≃L[A] C₀(I, A)) (x : M) :
    x = ∑' i, e x i • e.symm (c0Single i (1 : A)) := by sorry
-- Test scalar_empty: the zero-index norm remains zero.
example (a : A) (x : C₀(Fin 0, A)) : ‖a • x‖ = 0 := by sorry
-- Test scalar_single: the coefficient action uses the ring norm.
example (i : I) (a b : A) : a • c0Single i b = c0Single i (a * b) := by sorry

end Coordinates

/-- Finite coordinates detect a finite submodule: the algebraic part of Buzzard Lemma 2.3(a). -/
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
/-- Potential ONability is ONability after a two-sided bounded change of norm. Part of the API of the
target *Orthonormalizable and potentially orthonormalizable modules*. -/
theorem potentiallyON_iff_equivalentNorm : PotentiallyONable A M ↔
    ∃ (I : Type v) (t : TopologicalSpace I),
      letI : TopologicalSpace I := t
      DiscreteTopology I ∧ ∃ (e : M ≃ₗ[A] C₀(I, A)) (c C : ℝ),
        0 < c ∧ 0 < C ∧ ∀ x, c * ‖x‖ ≤ ‖e x‖ ∧ ‖e x‖ ≤ C * ‖x‖ := by sorry

/-- Potentially ONable modules have (Pr). Part of the API of the target *Property (Pr)*. -/
theorem hasPr_of_potentiallyON (h : PotentiallyONable A M) : HasPr A M := by sorry

/-- A continuous direct summand of a (Pr) module has (Pr). Part of the API of the target *Property
(Pr)*. -/
theorem hasPr_retract (h : HasPr A N) (i : M →L[A] N) (r : N →L[A] M)
    (hri : r.comp i = ContinuousLinearMap.id A M) : HasPr A M := by sorry

/-- (Pr) is equivalent to a continuous retraction from some c_A(I). Part of the API of the target
*Property (Pr)*. -/
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

/-- Membership is coefficient decay at every positive radius. Part of the API of the target *Entire
power series over A*. -/
theorem mem_entireSeries (f : PowerSeries A) :
    f ∈ entireSeries A ↔ IsEntire f := by sorry

/-- Evaluation at a is a ring homomorphism given by the convergent coefficient sum. Part of the API of
the target *Entire power series over A*. -/
def entire_eval (f : PowerSeries A) (a : A) : A := ∑' n : ℕ, f.coeff n * a^n


/- L4 Hasse calculus: native power series, with no characteristic assumption. -/
section HasseFormal
variable {B : Type*} [Semiring B]

/-- Hasse derivatives of formal power series: coefficient n is choose(n+s,s) times coefficient n+s. -/
def hasseSeries (s : ℕ) (f : PowerSeries B) : PowerSeries B := by sorry

/-- Coefficient n is choose(n+s,s) times coefficient n+s. Part of the API of the target *Hasse
derivatives of formal power series*. -/
theorem hasseSeries_coeff (s n : ℕ) (f : PowerSeries B) :
    (hasseSeries s f).coeff n = (n+s).choose s • f.coeff (n+s) := by sorry
/-- Delta_0 f=f. Part of the API of the target *Hasse derivatives of formal power series*. -/
theorem hasseSeries_zero (f : PowerSeries B) : hasseSeries 0 f = f := by sorry
/-- Delta_s(f+g)=Delta_s f+Delta_s g. Part of the API of the target *Hasse derivatives of formal power
series*. -/
theorem hasseSeries_add (s : ℕ) (f g : PowerSeries B) :
    hasseSeries s (f+g) = hasseSeries s f + hasseSeries s g := by sorry
/-- Delta_s(b f)=b Delta_s f, including noncommutative B. Part of the API of the target *Hasse
derivatives of formal power series*. -/
theorem hasseSeries_smul (s : ℕ) (b : B) (f : PowerSeries B) :
    hasseSeries s (b • f) = b • hasseSeries s f := by sorry

/-- Polynomial and series Hasse derivatives agree: reuse the pinned polynomial construction. -/
theorem hasseSeries_polynomial (s : ℕ) (p : Polynomial B) :
    hasseSeries s (p : PowerSeries B) =
      (Polynomial.hasseDeriv s p : PowerSeries B) := by sorry

/-- Hasse product formula for power series: valid also for a noncommutative coefficient semiring. -/
theorem hasseSeries_mul (s : ℕ) (f g : PowerSeries B) :
    hasseSeries s (f*g) = ∑ ij ∈ Finset.HasAntidiagonal.antidiagonal s,
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

/-- Hasse coefficient radius bound: ordinary norm bound, independent of ultrametricity. -/
theorem hasseSeries_norm_bound {B : Type*} [NormedRing B]
    (f : PowerSeries B) (s n : ℕ) (R : ℝ) (hR : 0 < R) :
    ‖(hasseSeries s f).coeff n‖ * R^n ≤
      (R^s)⁻¹ * (‖f.coeff (n+s)‖ * (2*R)^(n+s)) := by sorry

/-- Hasse derivatives preserve entireness: the coefficient ring can be the native K-operator ring. -/
theorem hasseSeries_entire {B : Type*} [NormedRing B]
    (f : PowerSeries B)
    (hf : ∀ R : ℝ, 0 < R → Tendsto (fun n : ℕ => ‖f.coeff n‖ * R^n)
      atTop (𝓝 0)) (s : ℕ) (R : ℝ) (hR : 0 < R) :
    Tendsto (fun n : ℕ => ‖(hasseSeries s f).coeff n‖ * R^n)
      atTop (𝓝 0) := by sorry

include hCompleteA in
/-- Roots of an entire series with unit constant are units: the displayed tail is the actual two-sided inverse. -/
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

/-- norm(eval_a(c))<=sup_n norm(c_n) R^n for R>=norm(a), R>0. Part of the API of the target *Entire
power series over A*. -/
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
/-- The n-th coefficient is the signed principal-minor sum. Part of the API of the target *Fredholm
determinant in an orthonormal chart*. -/
theorem fredholmSeries_coeff (f : C₀(I, A) →L[A] C₀(I, A))
    (hf : IsCompletelyContinuous f) (n : ℕ) :
    (fredholmSeries f hf).coeff n = (-1 : A)^n *
      ∑' S : {S : Finset I // S.card = n},
        Matrix.det (fun i j : ↥S.val => operatorEntry f i j) := by sorry

include K hA hNoeth in
/-- The constant coefficient is one. Part of the API of the target *Fredholm determinant in an
orthonormal chart*. -/
theorem fredholmSeries_constant (f : C₀(I, A) →L[A] C₀(I, A))
    (hf : IsCompletelyContinuous f) : (fredholmSeries f hf).coeff 0 = 1 := by sorry

include K hA hNoeth in
/-- The minor-tail-estimate proves decay at every positive real radius. Part of the API of the target
*Fredholm determinant in an orthonormal chart*. -/
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
/-- P_u=P_{iur} for every continuous splitting ri=1. Part of the API of the target *Fredholm
determinant on a (Pr) module*. -/
theorem fredholmSeriesPr_split
    {I : Type w} [TopologicalSpace I] [DiscreteTopology I] [DecidableEq I]
    (f : M →L[A] M) (hp : HasPr A M) (hf : IsCompletelyContinuous f)
    (i : M →L[A] C₀(I, A)) (r : C₀(I, A) →L[A] M)
    (hri : r.comp i = ContinuousLinearMap.id A M)
    (hl : IsCompletelyContinuous (i.comp (f.comp r))) :
    fredholmSeriesPr f hp hf = fredholmSeries (i.comp (f.comp r)) hl := by sorry

include K hA hNoeth in
/-- For an ONable module the (Pr) determinant agrees with the principal-minor determinant. Part of the
API of the target *Fredholm determinant on a (Pr) module*. -/
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

/-- v_(n+1)=c_(n+1) 1+u v_n, with v_0=1. Part of the API of the target *Fredholm resolvent series*. -/
theorem resolventCoeff_succ (f : M →L[A] M) (hp : HasPr A M)
    (hf : IsCompletelyContinuous f) (n : ℕ) :
    resolventCoeff f hp hf (n+1) =
      (fredholmSeriesPr f hp hf).coeff (n+1) • ContinuousLinearMap.id A M +
        f.comp (resolventCoeff f hp hf n) := by sorry

include hA hNoeth in
/-- For every R>0, norm(v_n) R^n tends to zero. Part of the API of the target *Fredholm resolvent
series*. -/
theorem resolvent_entire (f : M →L[A] M) (hp : HasPr A M)
    (hf : IsCompletelyContinuous f) (R : ℝ) (hR : 0 < R) :
    Tendsto (fun n => ‖(resolventCoeff f hp hf n).restrictScalars K‖ * R^n)
      atTop (𝓝 0) := by sorry

def resolventAt (f : M →L[A] M) (hp : HasPr A M)
    (hf : IsCompletelyContinuous f) (a : A) : M →L[A] M := by sorry

include K hA hNoeth in
/-- Both left and right multiplication by 1-Tu give P_u(T) times the identity. Part of the API of the
target *Fredholm resolvent series*. -/
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

/-- Evaluated Hasse derivatives of the resolvent. Use a bounded, not necessarily contractive, A-action.
The sum is formed in the complete normed K-endomorphisms; its limit is A-linear. -/
def resolventHasseAt (f : M →L[A] M) (hp : HasPr A M)
    (hf : IsCompletelyContinuous f) (a : A) (s : ℕ) : M →L[A] M := by sorry

include hA hNoeth hCompleteA hCompleteM in
/-- The binomially weighted resolvent coefficient sequence has this sum in the native K-operator norm,
with the explicit bounded-action hypothesis. Part of the API of the target *Evaluated Hasse
derivatives of the resolvent*. -/
theorem resolventHasseAt_hasSum (f : M →L[A] M) (hp : HasPr A M)
    (hf : IsCompletelyContinuous f)
    (hbound : ∃ C : ℝ, 0 < C ∧ ∀ (b : A) (x : M), ‖b • x‖ ≤ C * ‖b‖ * ‖x‖)
    (a : A) (s : ℕ) :
    HasSum (fun n : ℕ => (n+s).choose s •
      ((a^n) • (resolventCoeff f hp hf (n+s)).restrictScalars K))
      ((resolventHasseAt f hp hf a s).restrictScalars K) := by sorry

include K hA hNoeth hCompleteA hCompleteM in
/-- Hasse order zero agrees with the existing resolventAt. Part of the API of the target *Evaluated
Hasse derivatives of the resolvent*. -/
theorem resolventHasseAt_zero (f : M →L[A] M) (hp : HasPr A M)
    (hf : IsCompletelyContinuous f)
    (hbound : ∃ C : ℝ, 0 < C ∧ ∀ (b : A) (x : M), ‖b • x‖ ≤ C * ‖b‖ * ‖x‖)
    (a : A) : resolventHasseAt f hp hf a 0 = resolventAt f hp hf a := by sorry

include K hA hNoeth hCompleteA hCompleteM in
/-- At a=0 the value is exactly v_s. Part of the API of the target *Evaluated Hasse derivatives of the
resolvent*. -/
theorem resolventHasseAt_at_zero (f : M →L[A] M) (hp : HasPr A M)
    (hf : IsCompletelyContinuous f) (s : ℕ) :
    resolventHasseAt f hp hf 0 s = resolventCoeff f hp hf s := by sorry

include K hA hNoeth hCompleteA hCompleteM in
/-- Evaluated Hasse resolvent recurrence, preserving both multiplication orders. -/
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
/-- Hasse resolvent values lie in the polynomial closure: closure in the existing K-operator norm. -/
theorem resolventHasseAt_mem_closure (f : M →L[A] M) (hp : HasPr A M)
    (hf : IsCompletelyContinuous f)
    (hbound : ∃ C : ℝ, 0 < C ∧ ∀ (b : A) (x : M), ‖b • x‖ ≤ C * ‖b‖ * ‖x‖)
    (a : A) (s : ℕ) :
    (resolventHasseAt f hp hf a s).restrictScalars K ∈
      closure {g : M →L[K] M | ∃ p : Polynomial A,
        g = ∑ i ∈ p.support, p.coeff i • (f.restrictScalars K)^i} := by sorry

include K hA hNoeth hCompleteA hCompleteM in
/-- Hasse resolvent values commute: all the values commute, even at distinct points. -/
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

/-- Explicit Hasse Riesz projector. E projects onto the nilpotent summand.
The positive Hasse coefficient is a unit of A; no inverse of a nonunit is used. -/
def rieszRootProjector (f : M →L[A] M) (hp : HasPr A M)
    (hf : IsCompletelyContinuous f) (a : A) (h : ℕ) (c : Aˣ) : M →L[A] M := by sorry

/-- Equality with 1-((1-au)(c^(-1)z_h))^h on the existing continuous-linear-map carrier. Part of the
API of the target *Explicit Hasse Riesz projector*. -/
theorem rieszRootProjector_formula (f : M →L[A] M) (hp : HasPr A M)
    (hf : IsCompletelyContinuous f) (a : A) (h : ℕ) (c : Aˣ) :
    rieszRootProjector f hp hf a h c = 1 -
      ((ContinuousLinearMap.id A M - a • f) *
        ((↑(c⁻¹) : A) • resolventHasseAt f hp hf a h))^h := by sorry

/-- For h=0 the projector is zero for every a and chosen unit c. Part of the API of the target
*Explicit Hasse Riesz projector*. -/
theorem rieszRootProjector_zero_order (f : M →L[A] M) (hp : HasPr A M)
    (hf : IsCompletelyContinuous f) (a : A) (c : Aˣ) :
    rieszRootProjector f hp hf a 0 c = 0 := by sorry

include K hA hNoeth hCompleteA hCompleteM in
/-- Lower Hasse resolvent annihilation: induction on the actual evaluated recurrence. -/
theorem resolventHasseAt_lower_annihilation (f : M →L[A] M) (hp : HasPr A M) (hf : IsCompletelyContinuous f)
    (hbound : ∃ C : ℝ, 0 < C ∧ ∀ (b : A) (x : M), ‖b • x‖ ≤ C * ‖b‖ * ‖x‖)
    (a : A) (h : ℕ) (c : Aˣ)
    (hlower : ∀ s < h, entire_eval (hasseSeries s (fredholmSeriesPr f hp hf)) a = 0)
    (hc : entire_eval (hasseSeries h (fredholmSeriesPr f hp hf)) a = (c : A)) :
    ∀ s < h, (ContinuousLinearMap.id A M - a • f)^(s+1) * resolventHasseAt f hp hf a s = 0 := by sorry

include K hA hNoeth hCompleteA hCompleteM in
/-- Normalized Hasse resolvent identity; order zero uses the original resolvent identity. -/
theorem resolventHasseAt_normalized_annihilation (f : M →L[A] M) (hp : HasPr A M) (hf : IsCompletelyContinuous f)
    (hbound : ∃ C : ℝ, 0 < C ∧ ∀ (b : A) (x : M), ‖b • x‖ ≤ C * ‖b‖ * ‖x‖)
    (a : A) (h : ℕ) (c : Aˣ)
    (hlower : ∀ s < h, entire_eval (hasseSeries s (fredholmSeriesPr f hp hf)) a = 0)
    (hc : entire_eval (hasseSeries h (fredholmSeriesPr f hp hf)) a = (c : A)) :
    Commute (ContinuousLinearMap.id A M - a • f) ((↑(c⁻¹) : A) • resolventHasseAt f hp hf a h) ∧
    (ContinuousLinearMap.id A M - a • f)^h * (1 - (ContinuousLinearMap.id A M - a • f) * ((↑(c⁻¹) : A) • resolventHasseAt f hp hf a h)) = 0 := by sorry

include K hA hNoeth hCompleteA hCompleteM in
/-- Idempotence of the Hasse projector. -/
theorem rieszRootProjector_idempotent (f : M →L[A] M) (hp : HasPr A M) (hf : IsCompletelyContinuous f)
    (hbound : ∃ C : ℝ, 0 < C ∧ ∀ (b : A) (x : M), ‖b • x‖ ≤ C * ‖b‖ * ‖x‖)
    (a : A) (h : ℕ) (c : Aˣ)
    (hlower : ∀ s < h, entire_eval (hasseSeries s (fredholmSeriesPr f hp hf)) a = 0)
    (hc : entire_eval (hasseSeries h (fredholmSeriesPr f hp hf)) a = (c : A)) :
    IsIdempotentElem (rieszRootProjector f hp hf a h c) := by sorry

include K hA hNoeth hCompleteA hCompleteM in
/-- Canonical kernel and image summands: the exact exponent h is retained. -/
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
/-- Topological Riesz decomposition: native topological complement, no finite-rank conclusion. -/
theorem rieszRootProjector_topological_split (f : M →L[A] M) (hp : HasPr A M) (hf : IsCompletelyContinuous f)
    (hbound : ∃ C : ℝ, 0 < C ∧ ∀ (b : A) (x : M), ‖b • x‖ ≤ C * ‖b‖ * ‖x‖)
    (a : A) (h : ℕ) (c : Aˣ)
    (hlower : ∀ s < h, entire_eval (hasseSeries s (fredholmSeriesPr f hp hf)) a = 0)
    (hc : entire_eval (hasseSeries h (fredholmSeriesPr f hp hf)) a = (c : A)) :
    Submodule.IsTopCompl ((ContinuousLinearMap.id A M - a • f)^h).ker ((ContinuousLinearMap.id A M - a • f)^h).range ∧
    IsClosed (((ContinuousLinearMap.id A M - a • f)^h).ker : Set M) ∧ IsClosed (((ContinuousLinearMap.id A M - a • f)^h).range : Set M) := by sorry

include K hA hNoeth hCompleteA hCompleteM in
/-- Inverse on the regular Riesz summand: restrictions of these existing continuous maps are mutual inverses. -/
theorem rieszRootProjector_regular_inverse (f : M →L[A] M) (hp : HasPr A M) (hf : IsCompletelyContinuous f)
    (hbound : ∃ C : ℝ, 0 < C ∧ ∀ (b : A) (x : M), ‖b • x‖ ≤ C * ‖b‖ * ‖x‖)
    (a : A) (h : ℕ) (c : Aˣ)
    (hlower : ∀ s < h, entire_eval (hasseSeries s (fredholmSeriesPr f hp hf)) a = 0)
    (hc : entire_eval (hasseSeries h (fredholmSeriesPr f hp hf)) a = (c : A)) :
    Set.MapsTo (ContinuousLinearMap.id A M - a • f) (((ContinuousLinearMap.id A M - a • f)^h).range : Set M) (((ContinuousLinearMap.id A M - a • f)^h).range : Set M) ∧
    Set.MapsTo ((↑(c⁻¹) : A) • resolventHasseAt f hp hf a h) (((ContinuousLinearMap.id A M - a • f)^h).range : Set M) (((ContinuousLinearMap.id A M - a • f)^h).range : Set M) ∧
    ∀ x ∈ ((ContinuousLinearMap.id A M - a • f)^h).range, (ContinuousLinearMap.id A M - a • f) (((↑(c⁻¹) : A) • resolventHasseAt f hp hf a h) x) = x ∧ ((↑(c⁻¹) : A) • resolventHasseAt f hp hf a h) ((ContinuousLinearMap.id A M - a • f) x) = x := by sorry

include K hA hNoeth hCompleteA hCompleteM in
/-- Polynomial closure of Riesz projectors: operator-norm closure of the actual A-polynomials in f. -/
theorem rieszRootProjector_mem_closure (f : M →L[A] M) (hp : HasPr A M) (hf : IsCompletelyContinuous f)
    (hbound : ∃ C : ℝ, 0 < C ∧ ∀ (b : A) (x : M), ‖b • x‖ ≤ C * ‖b‖ * ‖x‖)
    (a : A) (h : ℕ) (c : Aˣ)
    (hlower : ∀ s < h, entire_eval (hasseSeries s (fredholmSeriesPr f hp hf)) a = 0)
    (hc : entire_eval (hasseSeries h (fredholmSeriesPr f hp hf)) a = (c : A)) :
    (rieszRootProjector f hp hf a h c).restrictScalars K ∈
      closure {g : M →L[K] M | ∃ p : Polynomial A,
        g = ∑ i ∈ p.support, p.coeff i • (f.restrictScalars K)^i} := by sorry

include K hA hNoeth hCompleteA hCompleteM in
/-- Stability under commuting operators: every continuous A-linear operator commuting with f preserves both summands. -/
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

end NonarchimedeanFredholm

/-!
Adjugate estimates and finite-coordinate passage to the Fredholm resolvent.
Intermediate sequences satisfy the algebraic recurrence explicitly; no hypothesis
assumes the analytic bound or entireness being proved. Matrices are input-first.
-/
namespace NonarchimedeanFredholm
open scoped _root_.Matrix
universe u v w
variable {K A : Type u}
variable [NontriviallyNormedField K] [CompleteSpace K]
variable [NormedCommRing A] [NormOneClass A] [Nontrivial A]
variable [NormedAlgebra K A] [CompleteSpace A] [IsNoetherianRing A]
variable {I : Type w} [TopologicalSpace I] [DiscreteTopology I] [DecidableEq I]

 /-- Evaluation of a finite coordinate projection. For T finite, x∈c_A(I) and j∈I, (π_T x)_j=x_j when
 j∈T, and (π_T x)_j=0 otherwise. (Source: Serre, §6, Proposition10 and Lemma3(a)–(c), printed78–79
 ; full fresh reading and printed79 page image checked on27 September2026.) -/
 theorem coordinateProjection_apply (T : Finset I) (x : C₀(I,A)) (j : I) :
    coordinateProjection T x j = if j ∈ T then x j else 0 := by sorry

/-- π_∅=0 as a native continuous A-linear map. Part of the API of the target *Finite coordinate
truncation*. -/
theorem coordinateProjection_empty :
    coordinateProjection (A := A) (∅ : Finset I) = 0 := by sorry

/-- π_T composed with π_S is π_(T∩S); hence each finite projection is idempotent. Part of the API of
the target *Finite coordinate truncation*. -/
theorem coordinateProjection_inter (T S : Finset I) :
    (coordinateProjection (A := A) T).comp (coordinateProjection S) =
      coordinateProjection (T ∩ S) := by sorry

/-- π_T(a e_j)=a e_j if j∈T, and zero if j∉T. Part of the API of the target *Finite coordinate
truncation*. -/
theorem coordinateProjection_single (T : Finset I) (j : I) (a : A) :
    coordinateProjection T (c0Single j a) = if j ∈ T then c0Single j a else 0 := by sorry

-- already appears above and is promoted with the same statement and hypotheses.

 /-- Operator bound from the coordinate vectors. For a continuous A-linear f:c_A(I)→c_A(I) and C≥0,
 ‖f‖_K≤C if and only if ‖f(e_i)‖≤C for every i∈I. (Source: Serre, §6, Proposition10 and
 Lemma3(a)–(c), printed78–79 ; full fresh reading and printed79 page image checked on27
 September2026.) -/
 theorem c0_operator_norm_le_iff
    (hA : ∀ x y : A, ‖x+y‖ ≤ max ‖x‖ ‖y‖)
    (f : C₀(I,A) →L[A] C₀(I,A)) (C : ℝ) (hC : 0 ≤ C) :
    ‖f.restrictScalars K‖ ≤ C ↔ ∀ i, ‖f (c0Single i (1 : A))‖ ≤ C := by sorry

 /-- Coefficients of the finite adjugate. For a d×d matrix D over A, put H(T)=I−TD, c_n=coeff_n det(H),
 and B_n=(coeff_n adj(H)_ij)_ij. Then B₀=I and B_(n+1)=c_(n+1)I+B_nD. This order is compatible with
 the input-first operator convention. (Source: Serre, §6, Proposition10 and Lemma3(a)–(c),
 printed78–79 ; full fresh reading and printed79 page image checked on27 September2026.) -/
 theorem finite_adjugate_recurrence {d : ℕ} (D : Matrix (Fin d) (Fin d) A) (n : ℕ) :
    (fun i j : Fin d => ((Matrix.adjugate (1 - (Polynomial.X : Polynomial A) • D.map (Polynomial.C : A →+* Polynomial A))) i j).coeff 0) =
      (1 : Matrix (Fin d) (Fin d) A) ∧
    (fun i j : Fin d => ((Matrix.adjugate (1 - (Polynomial.X : Polynomial A) • D.map (Polynomial.C : A →+* Polynomial A))) i j).coeff (n+1)) =
      ((Matrix.det (1 - (Polynomial.X : Polynomial A) • D.map (Polynomial.C : A →+* Polynomial A))).coeff (n+1)) • (1 : Matrix (Fin d) (Fin d) A) +
        Matrix.of (fun i j : Fin d => ((Matrix.adjugate (1 - (Polynomial.X : Polynomial A) • D.map (Polynomial.C : A →+* Polynomial A))) i j).coeff n) * D := by sorry

 /-- Distinct-column bound for adjugate coefficients. Let D be a d×d matrix, b_j≥0 with ‖D_ij‖≤b_j, n≥0
 and C≥0. Assume ∏_{j∈S}b_j≤C for every n-element subset S of its column index set. Every
 coefficient of degree n of every entry of adj(I−TD) then has norm at most C. (Source: Serre, §6,
 Proposition10 and Lemma3(a)–(c), printed78–79 ; full fresh reading and printed79 page image
 checked on27 September2026.) -/
 theorem finite_adjugate_coeff_bound {d : ℕ}
    (hA : ∀ x y : A, ‖x+y‖ ≤ max ‖x‖ ‖y‖)
    (D : Matrix (Fin d) (Fin d) A) (b : Fin d → ℝ)
    (hb0 : ∀ j, 0 ≤ b j) (hb : ∀ i j, ‖D i j‖ ≤ b j)
    (n : ℕ) (C : ℝ) (hC : 0 ≤ C)
    (hprod : ∀ S : Finset (Fin d), S.card = n → ∏ j ∈ S, b j ≤ C) (i j : Fin d) :
    ‖((Matrix.adjugate (1 - (Polynomial.X : Polynomial A) • D.map (Polynomial.C : A →+* Polynomial A))) i j).coeff n‖ ≤ C := by sorry

 /-- Resolvent recurrence on finite coordinates. Let u:c_A(I)→c_A(I) be completely continuous, with
 output support in a finite J. Let V₀=I and V_(n+1)=c_(n+1)(u)I+uV_n, where c_n(u) are the actual
 Fredholm coefficients. For every finite L⊇J, the entries of V_n between coordinates i,j∈L equal
 the degree-n coefficients of adj(I−T D_L), where D_L=(u_ij)_(i,j∈L). (Source: Serre, §6,
 Proposition10 and Lemma3(a)–(c), printed78–79 ; full fresh reading and printed79 page image
 checked on27 September2026.) -/
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

 /-- Resolvent bound for finite output support. Suppose u has output support in finite J. Let b_j≥0
 bound its output-column norms, fix n≥0 and C≥0, and assume every product of n distinct b_j is at
 most C. Then ‖V_n‖_K≤C. (Source: Serre, §6, Proposition10 and Lemma3(a)–(c), printed78–79 ; full
 fresh reading and printed79 page image checked on27 September2026.) -/
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

 /-- Continuity of the finite recurrence. Let α carry any filter l. Suppose u_α→u in K-operator norm on
 c_A(I), and c_(α,n)→c_n in A for each n. Define sequences V_(α,n) and V_n by initial identity and
 V_(α,n+1)=c_(α,n+1)I+u_αV_(α,n), respectively V_(n+1)=c_(n+1)I+uV_n. For every fixed n,
 V_(α,n)→V_n in K-operator norm. (Source: Serre, §6, Proposition10 and Lemma3(a)–(c), printed78–79
 ; full fresh reading and printed79 page image checked on27 September2026.) -/
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

 /-- Adjugate bound for the Fredholm resolvent. Let u be completely continuous on c_A(I), and let b_j≥0
 bound its output-column norms. For n≥0 and C≥0, if every product of n distinct b_j is at most C,
 then ‖V_n‖_K≤C. (Source: Serre, §6, Proposition10 and Lemma3(a)–(c), printed78–79 ; full fresh
 reading and printed79 page image checked on27 September2026.) -/
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

 /-- Entire tail estimate for resolvent coefficients. Let b_j≥0 bound the output-column norms of
 completely continuous u and satisfy b_j≤L. Fix R>0, 0<q<1 and finite T with Rb_j≤q off T. Put
 m=|T| and B=max(1,RL). Then ‖V_n‖_K Rⁿ≤B^m q^(max(n−m,0)) for every n≥0. (Source: Serre, §6,
 Proposition10 and Lemma3(a)–(c), printed78–79 ; full fresh reading and printed79 page image
 checked on27 September2026.) -/
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

 /-- Compression of the coefficient recurrence. Let i:M→c_A(I) and r:c_A(I)→M be native continuous
 A-linear maps with ri=I. For u:M→M put U=iur. For any scalar sequence c_n, suppose V₀=I_M,
 W₀=I_c0, V_(n+1)=c_(n+1)I_M+uV_n and W_(n+1)=c_(n+1)I_c0+UW_n. Then rW_n i=V_n for every n.
 (Source: Serre, §6, Proposition10 and Lemma3(a)–(c), printed78–79 ; full fresh reading and
 printed79 page image checked on27 September2026.) -/
 theorem recurrence_retraction (f : M →L[A] M)
    (i : M →L[A] C₀(I,A)) (r : C₀(I,A) →L[A] M)
    (hri : r.comp i = ContinuousLinearMap.id A M) (c : ℕ → A)
    (V : ℕ → M →L[A] M) (W : ℕ → C₀(I,A) →L[A] C₀(I,A))
    (hV0 : V 0 = ContinuousLinearMap.id A _) (hW0 : W 0 = ContinuousLinearMap.id A _)
    (hV : ∀ n, V (n+1) = c (n+1) • ContinuousLinearMap.id A _ + f.comp (V n))
    (hW : ∀ n, W (n+1) = c (n+1) • ContinuousLinearMap.id A _ +
      (i.comp (f.comp r)).comp (W n)) (n : ℕ) :
    r.comp ((W n).comp i) = V n := by sorry

 /-- Entireness of the recurrence on a projective Banach module. Let M have (Pr), u:M→M be completely
 continuous, and c_n be its actual summand Fredholm coefficients. For any V₀=I and
 V_(n+1)=c_(n+1)I+uV_n, and every R>0, ‖V_n‖_K Rⁿ tends to zero. (Source: Serre, §6, Proposition10
 and Lemma3(a)–(c), printed78–79 ; full fresh reading and printed79 page image checked on27
 September2026; Buzzard, §2, pp.7–12 for coordinates; §3, full manuscript p.22.) -/
 theorem resolvent_recurrence_entire
    (hA : ∀ x y : A, ‖x+y‖ ≤ max ‖x‖ ‖y‖)
    (f : M →L[A] M) (hp : HasPr A M) (hf : IsCompletelyContinuous f)
    (V : ℕ → M →L[A] M) (hV0 : V 0 = ContinuousLinearMap.id A _)
    (hV : ∀ n, V (n+1) = (fredholmSeriesPr f hp hf).coeff (n+1) •
      ContinuousLinearMap.id A _ + f.comp (V n)) (R : ℝ) (hR : 0 < R) :
    Tendsto (fun n => ‖(V n).restrictScalars K‖ * R^n) atTop (𝓝 0) := by sorry

-- The constructor's initial-coefficient API, used to instantiate the estimates.
/-- The initial coefficient v₀ is the identity endomorphism on the actual module M. Part of the API of
the target *Fredholm resolvent series*. -/
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
end NonarchimedeanFredholm

/-! Riesz finite generation and projectivity. The geometric statements need only
continuous A-scalar multiplication; no unit hypothesis on the root parameter.
This section extends the existing native kernel and (Pr) interfaces. -/
namespace NonarchimedeanFredholm
section RieszFiniteness
universe u v
variable {A : Type u} {M : Type v} [NormedCommRing A]
  [NormedAddCommGroup M] [Module A M] [ContinuousSMul A M]

/-- Finite geometric factor for the root operator. -/
theorem riesz_geometric_factor (u : M →L[A] M) (a : A) (h : ℕ) :
    let B := a • ∑ j ∈ Finset.range h, (1-a • u)^j
    u * B = 1-(1-a • u)^h ∧ B * u = 1-(1-a • u)^h := by sorry

/-- Continuous inverse on the root kernel. Its inverse is the finite geometric sum. -/
def rieszKernelOperatorEquiv (u : M →L[A] M) (a : A) (h : ℕ) :
    ((1-a • u)^h).ker ≃L[A] ((1-a • u)^h).ker := by sorry

/-- For x∈N the image under the equivalence, viewed in M, is u(x). Part of the API of the target
*Continuous inverse on the root kernel*. -/
theorem rieszKernelOperatorEquiv_apply (u : M →L[A] M) (a : A) (h : ℕ)
    (x : ((1-a • u)^h).ker) :
    (rieszKernelOperatorEquiv u a h x : M) = u x := by sorry

/-- For x∈N the inverse image, viewed in M, is B(x). Part of the API of the target *Continuous inverse
on the root kernel*. -/
theorem rieszKernelOperatorEquiv_symm_apply (u : M →L[A] M) (a : A) (h : ℕ)
    (x : ((1-a • u)^h).ker) :
    ((rieszKernelOperatorEquiv u a h).symm x : M) =
      (a • ∑ j ∈ Finset.range h, (1-a • u)^j) x := by sorry

/-- Composing the equivalence with the native inclusion i equals u composed with i, as continuous
A-linear maps N→M. Part of the API of the target *Continuous inverse on the root kernel*. -/
theorem rieszKernelOperatorEquiv_subtype (u : M →L[A] M) (a : A) (h : ℕ) :
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

/-- Property (Pr) of the complemented root kernel. No Fredholm hypotheses are needed for this retraction. -/
theorem riesz_kernel_hasPr (u : M →L[A] M) (a : A) (h : ℕ)
    (F : Submodule A M) (ht : Submodule.IsTopCompl ((1-a • u)^h).ker F)
    (hp : HasPr A M) : HasPr A ((1-a • u)^h).ker := by sorry

variable {K : Type u} [NontriviallyNormedField K] [CompleteSpace K]
  [NormOneClass A] [Nontrivial A] [NormedAlgebra K A] [CompleteSpace A]
  [hNoeth : IsNoetherianRing A] [NormedSpace K M] [IsScalarTower K A M]
  [CompleteSpace M]

/-- Finite-image approximation of the root identity. The approximant need not preserve the kernel. -/
theorem riesz_compressed_approximation (u α : M →L[A] M) (a : A) (h : ℕ)
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
/-- Complete continuity of the root identity. -/
theorem riesz_kernel_identity_completelyContinuous (u : M →L[A] M) (a : A) (h : ℕ)
    (F : Submodule A M) (ht : Submodule.IsTopCompl ((1-a • u)^h).ker F)
    (hu : IsCompletelyContinuous u) :
    IsCompletelyContinuous (ContinuousLinearMap.id A ((1-a • u)^h).ker) := by sorry

include K hNoeth in
/-- Finite generation of the root kernel: completeness of the native closed kernel is automatic. -/
theorem riesz_kernel_finite (u : M →L[A] M) (a : A) (h : ℕ)
    (F : Submodule A M) (ht : Submodule.IsTopCompl ((1-a • u)^h).ker F)
    (hu : IsCompletelyContinuous u) : Module.Finite A ((1-a • u)^h).ker := by sorry

include K hNoeth in
/-- The target Finite (Pr) modules are algebraically projective. Canonical finite-module topology remains a gap. -/
theorem projective_of_finite_hasPr [Module.Finite A M] (hp : HasPr A M) :
    Module.Projective A M := by sorry

include K hNoeth in
/-- Projectivity of the finite root kernel; no constant-rank conclusion is asserted here. -/
theorem riesz_kernel_projective (u : M →L[A] M) (a : A) (h : ℕ)
    (F : Submodule A M) (ht : Submodule.IsTopCompl ((1-a • u)^h).ker F)
    (hu : IsCompletelyContinuous u) (hp : HasPr A M) :
    Module.Projective A ((1-a • u)^h).ker := by sorry

end RieszFiniteness
end NonarchimedeanFredholm

/-! Fredholm coefficients: finite bounds and cofinite summability.
These signatures specify the arguments; their proof placeholders claim no implementation.
-/
namespace NonarchimedeanFredholm
noncomputable section
open Filter Topology
open scoped BigOperators

section FiniteCoefficientBounds
variable {A I : Type*} [NormedCommRing A] [NormOneClass A]

/-- Ultrametric perturbation of a finite product. Let S be a finite set, f,g:S→A, C≥1 and δ≥0. If
norm(f_i),norm(g_i)≤C and norm(f_i−g_i)≤δ for every i, then norm(product f_i−product g_i)≤δ
C^max(card S−1,0). (Source: Serre, Proposition 8 proof, printed p. 77 (PDF p. 10).) -/
theorem ultrametric_product_perturbation
    (hA : ∀ x y : A, ‖x + y‖ ≤ max ‖x‖ ‖y‖)
    (S : Finset I) (f g : I → A) (C δ : ℝ)
    (hC : 1 ≤ C) (hδ : 0 ≤ δ)
    (hf : ∀ i ∈ S, ‖f i‖ ≤ C) (hg : ∀ i ∈ S, ‖g i‖ ≤ C)
    (hd : ∀ i ∈ S, ‖f i - g i‖ ≤ δ) :
    ‖(∏ i ∈ S, f i) - ∏ i ∈ S, g i‖ ≤ δ * C^(S.card-1) := by sorry

/-- Determinant bound by distinct output columns. For a square matrix D indexed by a finite type J,
let b_j≥0 satisfy norm(D_ij)≤b_j for all i,j. Then norm(det D)≤product_{j in J} b_j, including J
empty. (Source: Serre, Proposition 7(a,b), printed pp. 75–76 (PDF pp. 8–9).) -/
theorem ultrametric_determinant_bound [Fintype I] [DecidableEq I]
    (hA : ∀ x y : A, ‖x + y‖ ≤ max ‖x‖ ‖y‖)
    (D : Matrix I I A) (b : I → ℝ) (hb : ∀ j, 0 ≤ b j)
    (hD : ∀ i j, ‖D i j‖ ≤ b j) : ‖D.det‖ ≤ ∏ j, b j := by sorry

/-- Uniform finite determinant perturbation. Let D,E be square matrices on a finite type J, C≥1 and
δ≥0. If every entry of D and E has norm at most C and every corresponding difference has norm at
most δ, then norm(det D−det E)≤δ C^max(card J−1,0). (Source: Serre, Proposition 8 proof, printed
p. 77 (PDF p. 10).) -/
theorem ultrametric_determinant_perturbation [Fintype I] [DecidableEq I]
    (hA : ∀ x y : A, ‖x + y‖ ≤ max ‖x‖ ‖y‖)
    (D E : Matrix I I A) (C δ : ℝ) (hC : 1 ≤ C) (hδ : 0 ≤ δ)
    (hD : ∀ i j, ‖D i j‖ ≤ C) (hE : ∀ i j, ‖E i j‖ ≤ C)
    (hDE : ∀ i j, ‖D i j - E i j‖ ≤ δ) :
    ‖D.det - E.det‖ ≤ δ * C^(Fintype.card I-1) := by sorry

/-- Cofinite decay of fixed-degree principal minors. Let I be any index type and a:I×I→A. Suppose
norm(a_ij)≤b_j, where b_j≥0 is bounded and tends to zero along the cofinite filter on I. For every
n≥0 the family det(a_ij) indexed by the finite subsets S of I with card S=n tends to zero along
the cofinite filter on that family of subsets. (Source: Buzzard, Definition following Proposition
2.4, manuscript p. 12.) -/
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

/-- Finite exceptional-set product estimate. Let S,T be finite subsets of an arbitrary set I. Let
b:I→R satisfy 0≤b_j≤B with B≥1, and suppose b_j≤q outside T where 0≤q≤1. Then product_{j in S}
b_j≤B^card(T) q^max(card(S)−card(T),0). (Source: Serre, Proposition 7(b), printed p. 76 (PDF p.
9).) -/
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

include K in
/-- Determinant of a finite-coordinate operator. If u(c_A(I)) is contained in the coordinate submodule
A^S for a finite S, then P_u is the ordinary characteristic polynomial det(1-T u|A^S). (Source:
Buzzard, Lemma 2.5(b), pp. 12-13.) -/
theorem finite_coordinate_determinant
    (hA : ∀ x y : A, ‖x + y‖ ≤ max ‖x‖ ‖y‖)
    (f : C₀(I, A) →L[A] C₀(I, A)) (hf : IsCompletelyContinuous f)
    (S : Finset I) (hS : ∀ x j, j ∉ S → f x j = 0) :
    fredholmSeries f hf = polynomialSeries (Matrix.det
      (1 + (Polynomial.X : Polynomial A) •
        Matrix.map (-(fun i j : ↥S => operatorEntry f i j)) Polynomial.C)) := by sorry
end FiniteOutputComparison
end
end NonarchimedeanFredholm

/- Entire division by a linear factor. All nontrivial sum identities require
entireness; the total native coefficient construction makes no convergence
claim for arbitrary formal series. No Noetherian or field hypothesis is used. -/
namespace NonarchimedeanFredholm
variable {A : Type*} [NormedCommRing A] [NormOneClass A] [CompleteSpace A]

/-- Summability of every evaluated coefficient tail: m=0 includes the evaluation series. -/
theorem entire_tail_summable (f : PowerSeries A) (hf : IsEntire f) (a : A) (m : ℕ) :
    Summable (fun k : ℕ => f.coeff (m+k) * a^k) := by sorry

/-- Tail quotient for division by a linear factor: native formal-series constructor. -/
def entireLinearQuotient (a : A) (f : PowerSeries A) : PowerSeries A :=
  PowerSeries.mk (fun n => ∑' k : ℕ, f.coeff (n+1+k) * a^k)

/-- Coefficient formula for the tail quotient: promoted data API. -/
theorem entireLinearQuotient_coeff (a : A) (f : PowerSeries A) (n : ℕ) :
    (entireLinearQuotient a f).coeff n = ∑' k : ℕ, f.coeff (n+1+k) * a^k := by sorry

/-- Q_a(0)=0. Part of the API of the target *Tail quotient for division by a linear factor*. -/
theorem entireLinearQuotient_zero (a : A) :
    entireLinearQuotient a (0 : PowerSeries A) = 0 := by sorry

/-- For entire F,G, Q_a(F+G)=Q_a(F)+Q_a(G). Part of the API of the target *Tail quotient for division
by a linear factor*. -/
theorem entireLinearQuotient_add (a : A) (f g : PowerSeries A)
    (hf : IsEntire f) (hg : IsEntire g) :
    entireLinearQuotient a (f+g) = entireLinearQuotient a f + entireLinearQuotient a g := by sorry

/-- For entire F and any b in A, Q_a(bF)=b Q_a(F). Part of the API of the target *Tail quotient for
division by a linear factor*. -/
theorem entireLinearQuotient_C_mul (a b : A) (f : PowerSeries A) (hf : IsEntire f) :
    entireLinearQuotient a (PowerSeries.C b * f) =
      PowerSeries.C b * entireLinearQuotient a f := by sorry

/-- Q_a(b)=0 for any constant b. Part of the API of the target *Tail quotient for division by a linear
factor*. -/
theorem entireLinearQuotient_C (a b : A) :
    entireLinearQuotient a (PowerSeries.C b) = 0 := by sorry

/-- Q_0(F) is the native shifted series with coefficient c_(n+1), for every formal F. Part of the API
of the target *Tail quotient for division by a linear factor*. -/
theorem entireLinearQuotient_at_zero (f : PowerSeries A) :
    entireLinearQuotient 0 f = PowerSeries.mk (fun n => f.coeff (n+1)) := by sorry

/-- Recurrence for linear-quotient coefficients. -/
theorem entireLinearQuotient_recurrence (a : A) (f : PowerSeries A) (hf : IsEntire f) (n : ℕ) :
    (entireLinearQuotient a f).coeff n =
      f.coeff (n+1) + a * (entireLinearQuotient a f).coeff (n+1) := by sorry

/-- Ultrametric bound for each quotient coefficient: no summability assertion is hidden in the bound. -/
theorem entireLinearQuotient_bound
    (hA : ∀ x y : A, ‖x+y‖ ≤ max ‖x‖ ‖y‖)
    (a : A) (f : PowerSeries A) (S M : ℝ) (hS : 0 < S) (ha : ‖a‖ ≤ S)
    (hM : 0 ≤ M) (hb : ∀ m : ℕ, ‖f.coeff m‖ * S^m ≤ M) (n : ℕ) :
    ‖(entireLinearQuotient a f).coeff n‖ ≤ M / S^(n+1) := by sorry

/-- Entireness of the linear quotient. -/
theorem entireLinearQuotient_entire
    (hA : ∀ x y : A, ‖x+y‖ ≤ max ‖x‖ ‖y‖)
    (a : A) (f : PowerSeries A) (hf : IsEntire f) :
    IsEntire (entireLinearQuotient a f) := by sorry

/-- Division identity with evaluation as remainder. -/
theorem entire_linear_division (a : A) (f : PowerSeries A) (hf : IsEntire f) :
    f = (PowerSeries.X - PowerSeries.C a) * entireLinearQuotient a f +
      PowerSeries.C (entire_eval f a) := by sorry

/-- An entire linear product cannot be a nonzero constant: the entire hypothesis is essential. -/
theorem entire_linear_product_constant (a b : A) (f : PowerSeries A) (hf : IsEntire f)
    (h : (PowerSeries.X - PowerSeries.C a) * f = PowerSeries.C b) :
    f = 0 ∧ b = 0 := by sorry

/-- Uniqueness of the entire quotient and constant remainder. -/
theorem entire_linear_division_unique (a b c : A) (f g h : PowerSeries A)
    (hg : IsEntire g) (hh : IsEntire h)
    (hb : f = (PowerSeries.X - PowerSeries.C a) * g + PowerSeries.C b)
    (hc : f = (PowerSeries.X - PowerSeries.C a) * h + PowerSeries.C c) :
    g = h ∧ b = c := by sorry

/-- Native polynomials are entire: promoted existing polynomial test. -/
theorem polynomialSeries_entire (P : Polynomial A) : IsEntire (polynomialSeries P) := by sorry

/-- Agreement with native monic polynomial division. -/
theorem entireLinearQuotient_polynomial
    (hA : ∀ x y : A, ‖x+y‖ ≤ max ‖x‖ ‖y‖) (a : A) (P : Polynomial A) :
    entireLinearQuotient a (polynomialSeries P) =
      polynomialSeries (P /ₘ (Polynomial.X - Polynomial.C a)) := by sorry

/-- Roots and linear factors in the entire-series ring. -/
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
end NonarchimedeanFredholm

/-! General monic entire division, using the native inverse of the polynomial
reversal and native truncation. This refines the existing entire-division node.
All signatures are plans, including the required convergence hypotheses. -/
namespace NonarchimedeanFredholm
noncomputable section
variable {A : Type*} [NormedCommRing A] [NormOneClass A] [CompleteSpace A] [Nontrivial A]

/-- Exponential bound for the reciprocal reversal. For every k≥0, norm(b_k)≤C^k. (Source: Coleman,
Appendix A3, printed434: quotient-algebra interpretation and proof of LemmaA3.5;
published432–435.) -/
theorem monic_reciprocal_coeff_bound
    (hA : ∀ x y : A, ‖x+y‖ ≤ max ‖x‖ ‖y‖)
    (Q : Polynomial A) (hQ : Q.Monic) (C : ℝ) (hC : 1 ≤ C)
    (hb : ∀ i : ℕ, ‖Q.reverse.coeff i‖ ≤ C^i) (k : ℕ) :
    ‖(PowerSeries.invOfUnit (Q.reverse : PowerSeries A) 1).coeff k‖ ≤ C^k := sorry
/-- Convergence of reciprocal-weighted entire tails. For every entire F and every m≥0, the series
Σ_(k≥0) coeff_(m+k)(F)b_k is summable. (Source: Coleman, Appendix A3, printed434: quotient-algebra
interpretation and proof of LemmaA3.5; published432–435.) -/
theorem monic_reciprocal_tail_summable
    (hA : ∀ x y : A, ‖x+y‖ ≤ max ‖x‖ ‖y‖)
    (Q : Polynomial A) (hQ : Q.Monic) (F : PowerSeries A) (hF : IsEntire F) (m : ℕ) :
    Summable (fun k : ℕ => F.coeff (m+k) *
      (PowerSeries.invOfUnit (Q.reverse : PowerSeries A) 1).coeff k) := sorry

/-- Reciprocal-tail quotient by a monic polynomial. For native formal F, define S_Q(F) by coefficient
s_n=Σ_(k≥0) coeff_(n+d+k)(F)b_k using the total native infinite sum. Analytic interpretation and
linear laws are asserted for entire inputs. (Source: Coleman, Appendix A3, printed434:
quotient-algebra interpretation and proof of LemmaA3.5; published432–435.) -/
def entireMonicQuotient (Q : Polynomial A) (F : PowerSeries A) : PowerSeries A := sorry
/-- S_Q(0)=0. Part of the API of the target *Reciprocal-tail quotient by a monic polynomial*. -/
theorem entireMonicQuotient_zero (Q : Polynomial A) :
    entireMonicQuotient Q 0 = (0 : PowerSeries A) := sorry
/-- For entire F,G and monic Q, S_Q(F+G)=S_Q(F)+S_Q(G). Part of the API of the target *Reciprocal-tail
quotient by a monic polynomial*. -/
theorem entireMonicQuotient_add
    (hA : ∀ x y : A, ‖x+y‖ ≤ max ‖x‖ ‖y‖)
    (Q : Polynomial A) (hQ : Q.Monic) (F G : PowerSeries A)
    (hF : IsEntire F) (hG : IsEntire G) :
    entireMonicQuotient Q (F+G) = entireMonicQuotient Q F + entireMonicQuotient Q G := sorry
/-- For entire F and monic Q, S_Q(cF)=cS_Q(F) for every c∈A. Part of the API of the target
*Reciprocal-tail quotient by a monic polynomial*. -/
theorem entireMonicQuotient_C_mul
    (hA : ∀ x y : A, ‖x+y‖ ≤ max ‖x‖ ‖y‖)
    (Q : Polynomial A) (hQ : Q.Monic) (F : PowerSeries A) (hF : IsEntire F) (c : A) :
    entireMonicQuotient Q (PowerSeries.C c * F) =
      PowerSeries.C c * entireMonicQuotient Q F := sorry
/-- Coefficients of the monic tail quotient. For every formal F,
coeff_n(S_Q(F))=Σ_(k≥0)coeff_(n+d+k)(F)b_k. For entire F and monic Q this sum converges. (Source:
Coleman, Appendix A3, printed434: quotient-algebra interpretation and proof of LemmaA3.5;
published432–435.) -/
theorem entireMonicQuotient_coeff (Q : Polynomial A) (F : PowerSeries A) (n : ℕ) :
    (entireMonicQuotient Q F).coeff n = ∑' k : ℕ, F.coeff (n+Q.natDegree+k) *
      (PowerSeries.invOfUnit (Q.reverse : PowerSeries A) 1).coeff k := sorry
/-- Weighted bound for the monic quotient. If S≥C, M≥0 and norm(coeff_j(F))S^j≤M for every j, then
norm(coeff_n(S_Q(F)))≤M/S^(n+d). (Source: Coleman, Appendix A3, printed434: quotient-algebra
interpretation and proof of LemmaA3.5; published432–435.) -/
theorem entireMonicQuotient_bound
    (hA : ∀ x y : A, ‖x+y‖ ≤ max ‖x‖ ‖y‖)
    (Q : Polynomial A) (hQ : Q.Monic) (C S M : ℝ) (hC : 1 ≤ C) (hS : C ≤ S)
    (hQb : ∀ i : ℕ, ‖Q.reverse.coeff i‖ ≤ C^i) (hM : 0 ≤ M)
    (F : PowerSeries A) (hF : ∀ j : ℕ, ‖F.coeff j‖ * S^j ≤ M) (n : ℕ) :
    ‖(entireMonicQuotient Q F).coeff n‖ ≤ M / S^(n+Q.natDegree) := sorry
/-- Entireness of the monic quotient. If F is entire and Q monic, then S_Q(F) is entire. (Source:
Coleman, Appendix A3, printed434: quotient-algebra interpretation and proof of LemmaA3.5;
published432–435.) -/
theorem entireMonicQuotient_entire
    (hA : ∀ x y : A, ‖x+y‖ ≤ max ‖x‖ ‖y‖)
    (Q : Polynomial A) (hQ : Q.Monic) (F : PowerSeries A) (hF : IsEntire F) :
    IsEntire (entireMonicQuotient Q F) := sorry
/-- The monic quotient coefficient recurrence. For entire F and every n≥0,
coeff_(n+d)(F)=s_n+Σ_(i<d)coeff_i(Q)s_(n+d-i). (Source: Coleman, Appendix A3, printed434:
quotient-algebra interpretation and proof of LemmaA3.5; published432–435.) -/
theorem entireMonicQuotient_recurrence
    (hA : ∀ x y : A, ‖x+y‖ ≤ max ‖x‖ ‖y‖)
    (Q : Polynomial A) (hQ : Q.Monic) (F : PowerSeries A) (hF : IsEntire F) (n : ℕ) :
    F.coeff (n+Q.natDegree) = (entireMonicQuotient Q F).coeff n +
      ∑ i ∈ Finset.range Q.natDegree,
        Q.coeff i * (entireMonicQuotient Q F).coeff (n+Q.natDegree-i) := sorry
/-- The native polynomial remainder. For entire F, let R be the native degree-d truncation of F-Q
S_Q(F). Then F=Q S_Q(F)+R in A[[T]] and degree(R)<d. (Source: Coleman, Appendix A3, printed434:
quotient-algebra interpretation and proof of LemmaA3.5; published432–435.) -/
theorem entireMonicQuotient_division
    (hA : ∀ x y : A, ‖x+y‖ ≤ max ‖x‖ ‖y‖)
    (Q : Polynomial A) (hQ : Q.Monic) (F : PowerSeries A) (hF : IsEntire F) :
    let R := PowerSeries.trunc Q.natDegree
      (F - (Q : PowerSeries A) * entireMonicQuotient Q F)
    F = (Q : PowerSeries A) * entireMonicQuotient Q F + (R : PowerSeries A) ∧
      R.degree < (Q.natDegree : WithBot ℕ) := sorry
/-- A monic entire product cannot lower degree. If H is entire, R is a polynomial of degree less than
d and QH=R in A[[T]], then H=0 and R=0. (Source: Coleman, Appendix A3, printed434:
quotient-algebra interpretation and proof of LemmaA3.5; published432–435.) -/
theorem entire_monic_product_low_degree
    (hA : ∀ x y : A, ‖x+y‖ ≤ max ‖x‖ ‖y‖)
    (Q : Polynomial A) (hQ : Q.Monic) (H : PowerSeries A) (hH : IsEntire H)
    (R : Polynomial A) (hR : R.degree < (Q.natDegree : WithBot ℕ))
    (h : (Q : PowerSeries A) * H = (R : PowerSeries A)) : H = 0 ∧ R = 0 := sorry
/-- Uniqueness of monic entire division. If F=QG+R=QH+S, G,H are entire and polynomial R,S have degree
less than d, then G=H and R=S. (Source: Coleman, Appendix A3, printed434: quotient-algebra
interpretation and proof of LemmaA3.5; published432–435.) -/
theorem entire_monic_division_unique
    (hA : ∀ x y : A, ‖x+y‖ ≤ max ‖x‖ ‖y‖)
    (Q : Polynomial A) (hQ : Q.Monic) (F G H : PowerSeries A)
    (hG : IsEntire G) (hH : IsEntire H) (R S : Polynomial A)
    (hR : R.degree < (Q.natDegree : WithBot ℕ))
    (hS : S.degree < (Q.natDegree : WithBot ℕ))
    (hFG : F = (Q : PowerSeries A) * G + (R : PowerSeries A))
    (hFH : F = (Q : PowerSeries A) * H + (S : PowerSeries A)) : G = H ∧ R = S := sorry
/-- Compatibility with native polynomial division. For every polynomial P, S_Q(P)=P divByMonic Q under
native polynomial inclusion, and the constructed native truncation remainder equals P modByMonic
Q. (Source: Coleman, Appendix A3, printed434: quotient-algebra interpretation and proof of
LemmaA3.5; published432–435.) -/
theorem entireMonicQuotient_polynomial
    (hA : ∀ x y : A, ‖x+y‖ ≤ max ‖x‖ ‖y‖)
    (Q : Polynomial A) (hQ : Q.Monic) (P : Polynomial A) :
    entireMonicQuotient Q (P : PowerSeries A) = ((P /ₘ Q : Polynomial A) : PowerSeries A) ∧
    PowerSeries.trunc Q.natDegree
      ((P : PowerSeries A) - (Q : PowerSeries A) * entireMonicQuotient Q (P : PowerSeries A)) =
      P %ₘ Q := sorry
/-- Compatibility with the existing linear tail quotient. For every a∈A and entire F, S_(T-a)(F)
equals the existing entireLinearQuotient(a,F). (Source: Coleman, Appendix A3, printed434:
quotient-algebra interpretation and proof of LemmaA3.5; published432–435.) -/
theorem entireMonicQuotient_linear
    (hA : ∀ x y : A, ‖x+y‖ ≤ max ‖x‖ ‖y‖)
    (a : A) (F : PowerSeries A) (hF : IsEntire F) :
    entireMonicQuotient (Polynomial.X - Polynomial.C a) F = entireLinearQuotient a F := sorry
/-- Division of entire series by a monic polynomial. For monic Q in A[T] of degree d and P in A{{T}},
there are unique S in A{{T}} and R in A[T] with degree R<d and P=QS+R; for Q=1, R=0. (Source:
Coleman, Appendix A3, division preceding Lemmas A3.5 and A3.7; Coleman, printed434, norm
interpretation and proof of LemmaA3.5.) -/
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
end NonarchimedeanFredholm

/-!
Entire quotient and resultant comparison. The native finite algebra is AdjoinRoot;
no new polynomial quotient, basis, norm or generic determinant criterion is planned.
-/
namespace NonarchimedeanFredholm
variable {A : Type*} [NormedCommRing A] [NormOneClass A]

/-- Polynomial inclusion in the entire-series ring: bundle the existing polynomial inclusion. -/
def entirePolynomial : Polynomial A →+* entireSeries A := by sorry

/-- The underlying formal series of i(P) is polynomialSeries(P), equal to the native polynomial
coercion. Part of the API of the target *Polynomial inclusion in the entire-series ring*. -/
theorem entirePolynomial_coe (P : Polynomial A) :
    (entirePolynomial P : PowerSeries A) = polynomialSeries P := by sorry

/-- The ring homomorphism i is injective. Part of the API of the target *Polynomial inclusion in the
entire-series ring*. -/
theorem entirePolynomial_injective : Function.Injective (entirePolynomial (A := A)) := by sorry

/-- The underlying formal series of i(C(a)) is PowerSeries.C(a). Part of the API of the target
*Polynomial inclusion in the entire-series ring*. -/
theorem entirePolynomial_C (a : A) :
    (entirePolynomial (Polynomial.C a) : PowerSeries A) = PowerSeries.C a := by sorry

/-- Polynomial divisibility detected inside entire series: analytic division creates no polynomial factors. -/
theorem entirePolynomial_dvd_iff [CompleteSpace A] [Nontrivial A]
    (hA : ∀ x y : A, ‖x+y‖ ≤ max ‖x‖ ‖y‖)
    (Q P : Polynomial A) (hQ : Q.Monic) :
    entirePolynomial Q ∣ entirePolynomial P ↔ Q ∣ P := by sorry

/-- Entire series in the native monic quotient: monic division into the actual native finite algebra. -/
def entireAdjoinRoot [CompleteSpace A] [Nontrivial A]
    (hA : ∀ x y : A, ‖x+y‖ ≤ max ‖x‖ ‖y‖)
    (Q : Polynomial A) (hQ : Q.Monic) : entireSeries A →+* AdjoinRoot Q := by sorry

/-- rho_Q(i(P))=AdjoinRoot.mk Q P for every native polynomial P. Part of the API of the target *Entire
series in the native monic quotient*. -/
theorem entireAdjoinRoot_polynomial [CompleteSpace A] [Nontrivial A]
    (hA : ∀ x y : A, ‖x+y‖ ≤ max ‖x‖ ‖y‖)
    (Q P : Polynomial A) (hQ : Q.Monic) :
    entireAdjoinRoot hA Q hQ (entirePolynomial P) = AdjoinRoot.mk Q P := by sorry

/-- If F=i(Q)G+i(R) with G entire and R any polynomial, rho_Q(F)=AdjoinRoot.mk Q R; no degree bound on
R is required. Part of the API of the target *Entire series in the native monic quotient*. -/
theorem entireAdjoinRoot_of_decomposition [CompleteSpace A] [Nontrivial A]
    (hA : ∀ x y : A, ‖x+y‖ ≤ max ‖x‖ ‖y‖)
    (Q R : Polynomial A) (hQ : Q.Monic) (F G : entireSeries A)
    (h : F = entirePolynomial Q * G + entirePolynomial R) :
    entireAdjoinRoot hA Q hQ F = AdjoinRoot.mk Q R := by sorry

/-- Kernel of analytic reduction modulo a monic polynomial. -/
theorem entireAdjoinRoot_eq_zero_iff [CompleteSpace A] [Nontrivial A]
    (hA : ∀ x y : A, ‖x+y‖ ≤ max ‖x‖ ‖y‖)
    (Q : Polynomial A) (hQ : Q.Monic) (F : entireSeries A) :
    entireAdjoinRoot hA Q hQ F = 0 ↔ entirePolynomial Q ∣ F := by sorry

/-- Polynomial representatives lift every quotient class. -/
theorem entireAdjoinRoot_surjective [CompleteSpace A] [Nontrivial A]
    (hA : ∀ x y : A, ‖x+y‖ ≤ max ‖x‖ ‖y‖)
    (Q : Polynomial A) (hQ : Q.Monic) :
    Function.Surjective (entireAdjoinRoot hA Q hQ) := by sorry

/-- Linear analytic reduction is convergent evaluation: uses the existing evaluated-tail division. -/
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

/-- Res(Q,F)=Algebra.norm A (rho_Q(F)) in the native monic quotient. Part of the API of the target
*Resultant of a monic polynomial and an entire series*. -/
theorem entireResultant_norm [CompleteSpace A] [Nontrivial A]
    (hA : ∀ x y : A, ‖x+y‖ ≤ max ‖x‖ ‖y‖)
    (Q : Polynomial A) (hQ : Q.Monic) (F : entireSeries A) :
    entireResultant hA Q hQ F F.property =
      Algebra.norm A (entireAdjoinRoot hA Q hQ F) := by sorry

/-- The resultant depends only on P modulo Q. Part of the API of the target *Resultant of a monic
polynomial and an entire series*. -/
theorem entireResultant_remainder [CompleteSpace A] [Nontrivial A]
    (hA : ∀ x y : A, ‖x+y‖ ≤ max ‖x‖ ‖y‖)
    (Q : Polynomial A) (hQ : Q.Monic) (f g s : PowerSeries A)
    (hf : IsEntire f) (hg : IsEntire g) (hs : IsEntire s)
    (h : f = polynomialSeries Q * s + g) :
    entireResultant hA Q hQ f hf = entireResultant hA Q hQ g hg := by sorry

/-- Res(Q,P1 P2)=Res(Q,P1) Res(Q,P2). Part of the API of the target *Resultant of a monic polynomial
and an entire series*. -/
theorem entireResultant_mul [CompleteSpace A] [Nontrivial A]
    (hA : ∀ x y : A, ‖x+y‖ ≤ max ‖x‖ ‖y‖)
    (Q : Polynomial A) (hQ : Q.Monic) (f g : PowerSeries A)
    (hf : IsEntire f) (hg : IsEntire g) (hfg : IsEntire (f*g)) :
    entireResultant hA Q hQ (f*g) hfg =
      entireResultant hA Q hQ f hf * entireResultant hA Q hQ g hg := by sorry

/-- Res(T-a,P)=P(a). Part of the API of the target *Resultant of a monic polynomial and an entire
series*. -/
theorem entireResultant_linear [CompleteSpace A] [Nontrivial A]
    (hA : ∀ x y : A, ‖x+y‖ ≤ max ‖x‖ ‖y‖) (a : A)
    (f : PowerSeries A) (hf : IsEntire f) (hq : (Polynomial.X - Polynomial.C a).Monic) :
    entireResultant hA (Polynomial.X - Polynomial.C a) hq f hf = entire_eval f a := by sorry

/-- Entire resultant agrees with the native polynomial resultant: native Tau Ceti norm-resultant comparison. -/
theorem entireResultant_polynomial [CompleteSpace A] [Nontrivial A]
    (hA : ∀ x y : A, ‖x+y‖ ≤ max ‖x‖ ‖y‖)
    (Q P : Polynomial A) (hQ : Q.Monic) :
    entireResultant hA Q hQ (polynomialSeries P) (polynomialSeries_entire P) =
      Q.resultant P Q.natDegree P.natDegree := by sorry

/-- Bounded polynomial coefficient in the resultant Bezout identity: the coefficient of F is a bounded-degree polynomial. -/
theorem entireResultant_bezout [CompleteSpace A] [Nontrivial A]
    (hA : ∀ x y : A, ‖x+y‖ ≤ max ‖x‖ ‖y‖)
    (Q : Polynomial A) (hQ : Q.Monic) (F : entireSeries A) :
    ∃ G : entireSeries A, ∃ H : Polynomial A, H.degree < (Q.natDegree : WithBot ℕ) ∧
      entirePolynomial (Polynomial.C
        (entireResultant hA Q hQ F F.property)) =
        entirePolynomial Q * G + entirePolynomial H * F := by sorry

/-- The target Resultant detects analytic coprimality now has its full analytic statement. -/
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
end NonarchimedeanFredholm

/-! Finite polynomial stage of the spectral transform (L4).
The explicit bounds retain zero roots under specialization. The infinite-series
limit and Fredholm operator comparison remain separate roadmap obligations. -/
namespace NonarchimedeanFredholm
noncomputable section
open Polynomial
variable {A S : Type*} [CommRing A] [CommRing S]
/-- Monic reversal of a normalized polynomial. If A is nontrivial, Q_n is monic of degree exactly n,
even when degree(P)<n. (Source: Coleman, Appendix A3, printed434–436: finite definition of D(B,P),
LemmaA3.8 and TheoremA3.9; complete printed432–436 freshly read27 September2026.) -/
theorem spectralReversal_monic [Nontrivial A] (P : A[X]) (n : ℕ)
    (hP : P.coeff 0 = 1) (hn : P.natDegree ≤ n) :
    (P.reflect n).Monic ∧ (P.reflect n).natDegree = n := sorry

/-- The finite polynomial spectral transform. Define D_(n,m)(B,P) as the native resultant over A[T] of
Q_n(Y), with its coefficients included as constants, and K_B(T,Y)=1−T B(Y), with degree bounds
n,m. Its value is a native polynomial in T. The expression is total; its spectral interpretation
uses the stated degree bounds and P(0)=1. (Source: Coleman, Appendix A3, printed434–436: finite
definition of D(B,P), LemmaA3.8 and TheoremA3.9; complete printed432–436 freshly read27
September2026.) -/
def polynomialSpectralResultant (n m : ℕ) (B P : A[X]) : A[X] := sorry
/-- The value is the native bounded resultant over A[T] of the mapped reversal and1−T B(Y), with the
two displayed bounds. Part of the API of the target *The finite polynomial spectral transform*. -/
theorem polynomialSpectralResultant_def (n m : ℕ) (B P : A[X]) :
    polynomialSpectralResultant n m B P =
      Polynomial.resultant ((P.reflect n).map Polynomial.C)
        (1-Polynomial.C Polynomial.X * B.map Polynomial.C) n m := sorry
/-- Evaluation at t is the bounded resultant Res(Q_n,1−tB); promoted. Part of the API of the target
*The finite polynomial spectral transform*. -/
theorem polynomialSpectralResultant_eval (n m : ℕ) (B P : A[X]) (t : A) :
    (polynomialSpectralResultant n m B P).eval t =
      Polynomial.resultant (P.reflect n) (1-Polynomial.C t*B) n m := sorry
/-- For P(0)=1 the constant coefficient is1; promoted. Part of the API of the target *The finite
polynomial spectral transform*. -/
theorem polynomialSpectralResultant_constantCoeff (n m : ℕ) (B P : A[X])
    (hP : P.coeff 0 = 1) : (polynomialSpectralResultant n m B P).coeff 0 = 1 := sorry
/-- For B=0 and m=0 the value is1, with any P and n. Part of the API of the target *The finite
polynomial spectral transform*. -/
theorem polynomialSpectralResultant_zero (n : ℕ) (P : A[X]) :
    polynomialSpectralResultant n 0 0 P = 1 := sorry
/-- For P=1 and n=0 the value is1, for any B and m. Part of the API of the target *The finite
polynomial spectral transform*. -/
theorem polynomialSpectralResultant_oneInput (m : ℕ) (B : A[X]) :
    polynomialSpectralResultant 0 m B 1 = 1 := sorry
/-- Independence of the auxiliary degree bound. For any m≥degree(B),
D_(n,m)(B,P)=D_(n,degree(B))(B,P). (Source: Coleman, Appendix A3, printed434–436: finite
definition of D(B,P), LemmaA3.8 and TheoremA3.9; complete printed432–436 freshly read27
September2026.) -/
theorem polynomialSpectralResultant_rightBound (n m : ℕ) (B P : A[X])
    (hP : P.coeff 0 = 1) (hn : P.natDegree ≤ n) (hm : B.natDegree ≤ m) :
    polynomialSpectralResultant n m B P =
      polynomialSpectralResultant n B.natDegree B P := sorry
/-- For P=1−aY,n=1 the value is1−B(a)T; promoted. Part of the API of the target *The finite polynomial
spectral transform*. -/
theorem polynomialSpectralResultant_linear (m : ℕ) (B : A[X]) (a : A)
    (hm : B.natDegree ≤ m) :
    polynomialSpectralResultant 1 m B (1-Polynomial.C a*Polynomial.X) =
      1-Polynomial.C (B.eval a)*Polynomial.X := sorry
/-- Multiplication in P adds its two degree bounds and multiplies D; promoted. Part of the API of the
target *The finite polynomial spectral transform*. -/
theorem polynomialSpectralResultant_mul (n k m : ℕ) (B P Q : A[X])
    (hP : P.coeff 0 = 1) (hQ : Q.coeff 0 = 1)
    (hn : P.natDegree ≤ n) (hk : Q.natDegree ≤ k) (hm : B.natDegree ≤ m) :
    polynomialSpectralResultant (n+k) m B (P*Q) =
      polynomialSpectralResultant n m B P * polynomialSpectralResultant k m B Q := sorry
/-- Increasing n by one multiplies D by1−B(0)T; promoted. Part of the API of the target *The finite
polynomial spectral transform*. -/
theorem polynomialSpectralResultant_padding (n m : ℕ) (B P : A[X])
    (hP : P.coeff 0 = 1) (hn : P.natDegree ≤ n) (hm : B.natDegree ≤ m) :
    polynomialSpectralResultant (n+1) m B P =
      polynomialSpectralResultant n m B P * (1-Polynomial.C (B.coeff 0)*Polynomial.X) := sorry
/-- Stability when the operator series vanishes at zero. If B(0)=0, then D_(n+k,m)(B,P)=D_(n,m)(B,P)
for every k≥0. Hence any two valid bounds on degree(P) give the same transform. (Source: Coleman,
Appendix A3, printed434–436: finite definition of D(B,P), LemmaA3.8 and TheoremA3.9; complete
printed432–436 freshly read27 September2026.) -/
theorem polynomialSpectralResultant_stable (n k m : ℕ) (B P : A[X])
    (hP : P.coeff 0 = 1) (hn : P.natDegree ≤ n) (hm : B.natDegree ≤ m)
    (hB : B.coeff 0 = 0) : polynomialSpectralResultant (n+k) m B P =
      polynomialSpectralResultant n m B P := sorry
/-- Fixed-bound construction commutes with every coefficient ring map; promoted. Part of the API of
the target *The finite polynomial spectral transform*. -/
theorem polynomialSpectralResultant_map (f : A →+* S) (n m : ℕ) (B P : A[X]) :
    (polynomialSpectralResultant n m B P).map f =
      polynomialSpectralResultant n m (B.map f) (P.map f) := sorry
/-- The value is a native finite-quotient algebra norm; promoted. Part of the API of the target *The
finite polynomial spectral transform*. -/
theorem polynomialSpectralResultant_norm (n m : ℕ) (B P : A[X])
    (hP : P.coeff 0 = 1) (hn : P.natDegree ≤ n) (hm : B.natDegree ≤ m) :
    polynomialSpectralResultant n m B P = Algebra.norm A[X]
      (AdjoinRoot.mk ((P.reflect n).map Polynomial.C)
        (1-Polynomial.C Polynomial.X * B.map Polynomial.C)) := sorry
/-- The finite root-product formula. For a finite index set I, arbitrary elements a_i∈A and
m≥degree(B), D_(|I|,m)(B,∏_i(1−a_iY))=∏_i(1−B(a_i)T). Repetitions and zero a_i are allowed.
(Source: Coleman, Appendix A3, printed434–436: finite definition of D(B,P), LemmaA3.8 and
TheoremA3.9; complete printed432–436 freshly read27 September2026.) -/
theorem polynomialSpectralResultant_split {ι : Type*} (s : Finset ι) (a : ι → A)
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
end NonarchimedeanFredholm

/-! Finite triangular characteristic comparison.  -/
section FiniteSpectralCharacteristic
open Polynomial _root_.Matrix
variable {R S ι : Type*} [CommRing R] [CommRing S] [Fintype ι] [DecidableEq ι]
variable [LinearOrder ι]

/-- Fixed-rank reflection of the characteristic series. -/
theorem Matrix.reflect_charpolyRev (M : Matrix ι ι R) :
    M.charpolyRev.reflect (Fintype.card ι) = M.charpoly := by sorry

/-- Degree bound for the characteristic series. -/
theorem Matrix.charpolyRev_natDegree_le (M : Matrix ι ι R) :
    M.charpolyRev.natDegree ≤ Fintype.card ι := by sorry

/-- Scalar extension of the characteristic series. -/
theorem Matrix.charpolyRev_map (f : R →+* S) (M : Matrix ι ι R) :
    (M.map f).charpolyRev = M.charpolyRev.map f := by sorry

/-- Similarity invariance of the characteristic series. -/
theorem Matrix.charpolyRev_units_conj (u : (Matrix ι ι R)ˣ) (M : Matrix ι ι R) :
    (u.val * M * u.val⁻¹).charpolyRev = M.charpolyRev := by sorry

/-- Diagonal entries of a triangular product. -/
theorem Matrix.IsUpperTriangular.mul_apply_diag {M N : Matrix ι ι R}
    (hM : M.IsUpperTriangular) (hN : N.IsUpperTriangular) (i : ι) :
    (M*N) i i = M i i * N i i := by sorry

/-- Polynomial evaluation preserves upper triangularity. -/
theorem Matrix.IsUpperTriangular.aeval {M : Matrix ι ι R} (hM : M.IsUpperTriangular) (B : R[X]) :
    (Polynomial.aeval M B).IsUpperTriangular := by sorry

/-- The diagonal of a polynomial in a triangular matrix. -/
theorem Matrix.IsUpperTriangular.aeval_apply_diag {M : Matrix ι ι R} (hM : M.IsUpperTriangular)
    (B : R[X]) (i : ι) : (Polynomial.aeval M B) i i = B.eval (M i i) := by sorry

/-- Characteristic factors of a triangular matrix. -/
theorem Matrix.charpolyRev_of_isUpperTriangular {M : Matrix ι ι R} (hM : M.IsUpperTriangular) :
    M.charpolyRev = ∏ i, (1-C (M i i)*X) := by sorry

/-- Finite spectral mapping for triangular matrices. -/
theorem NonarchimedeanFredholm.polynomialSpectralResultant_charpolyRev_of_isUpperTriangular {M : Matrix ι ι R} (hM : M.IsUpperTriangular)
    (m : ℕ) (B : R[X]) (hm : B.natDegree ≤ m) :
    NonarchimedeanFredholm.polynomialSpectralResultant (Fintype.card ι) m B M.charpolyRev = (Polynomial.aeval M B).charpolyRev := by sorry

/-- Similarity commutes with polynomial calculus. -/
theorem Matrix.aeval_units_conj (u : (Matrix ι ι R)ˣ) (M : Matrix ι ι R) (B : R[X]) :
    Polynomial.aeval (u.val*M*u.val⁻¹) B = u.val * Polynomial.aeval M B * u.val⁻¹ := by sorry

/-- Scalar extension of matrix polynomial calculus. -/
theorem Matrix.aeval_map (f : R →+* S) (M : Matrix ι ι R) (B : R[X]) :
    (Polynomial.aeval M B).map f = Polynomial.aeval (M.map f) (B.map f) := by sorry

/-- Spectral mapping from a triangularizing similarity. -/
theorem NonarchimedeanFredholm.polynomialSpectralResultant_charpolyRev_of_conj (M : Matrix ι ι R) (u : (Matrix ι ι R)ˣ)
    (h : (u.val*M*u.val⁻¹).IsUpperTriangular) (m : ℕ) (B : R[X])
    (hm : B.natDegree ≤ m) :
    NonarchimedeanFredholm.polynomialSpectralResultant (Fintype.card ι) m B M.charpolyRev = (Polynomial.aeval M B).charpolyRev := by sorry

/-- Faithful descent of finite spectral mapping. -/
theorem NonarchimedeanFredholm.polynomialSpectralResultant_charpolyRev_of_faithful (f : R →+* S) (hf : Function.Injective f)
    (M : Matrix ι ι R) (u : (Matrix ι ι S)ˣ)
    (h : (u.val*(M.map f)*u.val⁻¹).IsUpperTriangular) (m : ℕ) (B : R[X])
    (hm : B.natDegree ≤ m) :
    NonarchimedeanFredholm.polynomialSpectralResultant (Fintype.card ι) m B M.charpolyRev = (Polynomial.aeval M B).charpolyRev := by sorry

-- CharacteristicTests.empty_matrix
example : NonarchimedeanFredholm.polynomialSpectralResultant 0 0 (1 : ℤ[X])
    (0 : Matrix (Fin 0) (Fin 0) ℤ).charpolyRev = 1 := by sorry

-- CharacteristicTests.constant_operator
example : NonarchimedeanFredholm.polynomialSpectralResultant 2 0 (1 : ℤ[X])
    (0 : Matrix (Fin 2) (Fin 2) ℤ).charpolyRev = (1-X)^2 := by sorry

-- CharacteristicTests.jordan_transform
example : NonarchimedeanFredholm.polynomialSpectralResultant 2 2 (X+X^2 : (ZMod 8)[X])
    (!![2,1;0,2] : Matrix (Fin 2) (Fin 2) (ZMod 8)).charpolyRev =
      1+C 4*X+C 4*X^2 := by sorry

-- CharacteristicTests.jordan_aeval
example : aeval (!![2,1;0,2] : Matrix (Fin 2) (Fin 2) (ZMod 8))
    (X+X^2 : (ZMod 8)[X]) = !![6,5;0,6] := by sorry

end FiniteSpectralCharacteristic

/-! Universal finite characteristic comparison. 
The native polynomial and matrix carriers are used throughout. The local
notations abbreviate types only; no alternative generic-matrix carrier is defined.
TauCeti's discriminant lemmas are proof-plan dependencies, not stubbed here. -/
namespace NonarchimedeanFredholm
noncomputable section
open Polynomial _root_.Matrix
local notation "C[" m "]" => MvPolynomial (Fin (m+1)) ℤ
local notation "U[" n "," m "]" => MvPolynomial (Fin n × Fin n) (C[m])

/-- Universal polynomial coefficients. Define B_(N,m)(Y)=Σ_(i=0)^m b_iY^i in U_(N,m)[Y], using
coefficient inclusion from C_m and native Polynomial.ofFn of length m+1. (Source: Coleman,
Appendix A3, printed 435–436, finite definition of D and finite-operator step in Theorem A3.9.) -/
def spectralUniversalPolynomial (n m : ℕ) : (U[n,m])[X] := sorry
/-- The polynomial is native ofFn of length m+1 with coefficient vector i↦b_i included into U_(N,m).
Part of the API of the target *Universal polynomial coefficients*. -/
theorem spectralUniversalPolynomial_def (n m : ℕ) :
    spectralUniversalPolynomial n m =
      Polynomial.ofFn (m+1) (fun i => MvPolynomial.C (MvPolynomial.X i)) := sorry
/-- Its coefficient at i≤m is the included variable b_i. Part of the API of the target *Universal
polynomial coefficients*. -/
theorem spectralUniversalPolynomial_coeff (n m : ℕ) (i : Fin (m+1)) :
    (spectralUniversalPolynomial n m).coeff i.val =
      MvPolynomial.C (MvPolynomial.X i) := sorry
/-- Its natural degree is at most m; promoted as spectral-universal-degree. Part of the API of the
target *Universal polynomial coefficients*. -/
theorem spectralUniversalPolynomial_natDegree_le (n m : ℕ) :
    (spectralUniversalPolynomial n m).natDegree ≤ m := sorry

variable {R S : Type*} [CommRing R] [CommRing S]
/-- Simultaneous coefficient and matrix specialization. For a commutative ring R, a matrix M on Fin N
and any B∈R[Y], define the ring homomorphism σ_(m,M,B):U_(N,m)→R by b_i↦coeff_i(B), xᵢⱼ↦Mᵢⱼ and
the canonical integer map. This map is defined without a degree bound on B. (Source: Coleman,
Appendix A3, printed 435–436, finite definition of D and finite-operator step in Theorem A3.9.) -/
def spectralSpecialization {n : ℕ} (m : ℕ) (M : Matrix (Fin n) (Fin n) R)
    (B : R[X]) : U[n,m] →+* R := sorry
/-- The homomorphism is the nested native eval₂Hom with integer coefficients, the first m+1
coefficients of B, and the entries of M. Part of the API of the target *Simultaneous coefficient
and matrix specialization*. -/
theorem spectralSpecialization_def {n : ℕ} (m : ℕ) (M : Matrix (Fin n) (Fin n) R)
    (B : R[X]) : spectralSpecialization m M B =
      MvPolynomial.eval₂Hom
        (MvPolynomial.eval₂Hom (Int.castRingHom R) (fun i : Fin (m+1) => B.coeff i.val))
        (fun ij => M ij.1 ij.2) := sorry
/-- The image of xᵢⱼ is Mᵢⱼ. Part of the API of the target *Simultaneous coefficient and matrix
specialization*. -/
theorem spectralSpecialization_entry {n : ℕ} (m : ℕ) (M : Matrix (Fin n) (Fin n) R)
    (B : R[X]) (i j : Fin n) :
    spectralSpecialization m M B (MvPolynomial.X (i,j)) = M i j := sorry
/-- The image of the included b_i is coeff_i(B) for i≤m. Part of the API of the target *Simultaneous
coefficient and matrix specialization*. -/
theorem spectralSpecialization_coefficient {n : ℕ} (m : ℕ)
    (M : Matrix (Fin n) (Fin n) R) (B : R[X]) (i : Fin (m+1)) :
    spectralSpecialization m M B (MvPolynomial.C (MvPolynomial.X i)) = B.coeff i.val := sorry
/-- Composition with f:R→S equals specialization at the entrywise mapped matrix and coefficientwise
mapped polynomial; identity and successive composition follow. Part of the API of the target
*Simultaneous coefficient and matrix specialization*. -/
theorem spectralSpecialization_comp {n : ℕ} (m : ℕ) (M : Matrix (Fin n) (Fin n) R)
    (B : R[X]) (f : R →+* S) :
    f.comp (spectralSpecialization m M B) =
      spectralSpecialization m (M.map f) (B.map f) := sorry
/-- Entrywise specialization of native G is M; promoted. Part of the API of the target *Simultaneous
coefficient and matrix specialization*. -/
theorem spectralSpecialization_matrix {n : ℕ} (m : ℕ)
    (M : Matrix (Fin n) (Fin n) R) (B : R[X]) :
    (Matrix.mvPolynomialX (Fin n) (Fin n) (C[m])).map (spectralSpecialization m M B) = M := sorry
/-- If natural degree(B)≤m, specialization of B_(N,m) is B; promoted. Part of the API of the target
*Simultaneous coefficient and matrix specialization*. -/
theorem spectralSpecialization_polynomial {n : ℕ} (m : ℕ)
    (M : Matrix (Fin n) (Fin n) R) (B : R[X]) (hm : B.natDegree ≤ m) :
    (spectralUniversalPolynomial n m).map (spectralSpecialization m M B) = B := sorry

/-- Nonzero discriminant of the generic matrix. The discriminant of the characteristic polynomial of G
over U_(N,m) is nonzero. (Source: Coleman, Appendix A3, printed 435–436, finite definition of D
and finite-operator step in Theorem A3.9.) -/
theorem spectralGeneric_discr_ne_zero (n m : ℕ) :
    (Matrix.mvPolynomialX (Fin n) (Fin n) (C[m])).charpoly.discr ≠ 0 := sorry
/-- Generic separability in a faithful field extension. For a field K and an injective ring
homomorphism f:U_(N,m)→K, the characteristic polynomial of f(G) is separable over K. (Source:
Coleman, Appendix A3, printed 435–436, finite definition of D and finite-operator step in Theorem
A3.9.) -/
theorem spectralGeneric_separable {K : Type*} [Field K] (n m : ℕ)
    (f : U[n,m] →+* K) (hf : Function.Injective f) :
    ((Matrix.mvPolynomialX (Fin n) (Fin n) (C[m])).map f).charpoly.Separable := sorry
end
end NonarchimedeanFredholm

namespace Matrix
noncomputable section
open Polynomial
variable {K : Type*} [Field K] {n : ℕ}
/-- Numbering distinct characteristic roots. Let M be an N×N matrix over a field K. If its
characteristic polynomial is separable and splits over K, there is an injective function r:Fin N→K
whose values are roots of that polynomial. (Source: Coleman, Appendix A3, printed 435–436, finite
definition of D and finite-operator step in Theorem A3.9.) -/
theorem exists_injective_roots_charpoly (M : Matrix (Fin n) (Fin n) K)
    (hsep : M.charpoly.Separable) (hsplit : M.charpoly.Splits) :
    ∃ r : Fin n → K, Function.Injective r ∧ ∀ i, M.charpoly.IsRoot (r i) := sorry
/-- An eigenbasis from distinct characteristic roots. For an N×N matrix M over a field K and an
injective function r:Fin N→K whose values are characteristic roots, there exists a native basis b
of K^N indexed by Fin N satisfying M b_i=r_i b_i for every i. (Source: Coleman, Appendix A3,
printed 435–436, finite definition of D and finite-operator step in Theorem A3.9.) -/
theorem exists_eigenbasis_of_injective_roots (M : Matrix (Fin n) (Fin n) K)
    (r : Fin n → K) (hr : Function.Injective r) (hroot : ∀ i, M.charpoly.IsRoot (r i)) :
    ∃ b : Module.Basis (Fin n) K (Fin n → K), ∀ i, M.mulVec (b i) = r i • b i := sorry
/-- Diagonal similarity from an eigenbasis. Given a native basis b of K^N and scalars r_i with M
b_i=r_i b_i, there is a matrix unit U such that UMU⁻¹ is the diagonal matrix with entries r_i.
(Source: Coleman, Appendix A3, printed 435–436, finite definition of D and finite-operator step in
Theorem A3.9.) -/
theorem exists_units_conj_diagonal_of_eigenbasis (M : Matrix (Fin n) (Fin n) K)
    (r : Fin n → K) (b : Module.Basis (Fin n) K (Fin n → K))
    (hb : ∀ i, M.mulVec (b i) = r i • b i) :
    ∃ u : (Matrix (Fin n) (Fin n) K)ˣ, u.val * M * u.val⁻¹ = Matrix.diagonal r := sorry
end
end Matrix

namespace NonarchimedeanFredholm
noncomputable section
open Polynomial _root_.Matrix
local notation "C[" m "]" => MvPolynomial (Fin (m+1)) ℤ
local notation "U[" n "," m "]" => MvPolynomial (Fin n × Fin n) (C[m])
/-- The universal finite spectral identity. Over U_(N,m), D_(N,m)(B_(N,m),P_G)=P_(B_(N,m)(G)).
(Source: Coleman, Appendix A3, printed 435–436, finite definition of D and finite-operator step in
Theorem A3.9.) -/
theorem polynomialSpectralResultant_generic (n m : ℕ) :
    polynomialSpectralResultant n m (spectralUniversalPolynomial n m)
      (Matrix.mvPolynomialX (Fin n) (Fin n) (C[m])).charpolyRev =
    (Polynomial.aeval (Matrix.mvPolynomialX (Fin n) (Fin n) (C[m]))
      (spectralUniversalPolynomial n m)).charpolyRev := sorry
/-- Finite spectral mapping over any coefficient ring. For every commutative ring R, every N×N matrix
M, and every B∈R[Y] with natural degree at most m, D_(N,m)(B,P_M)=P_(B(M)). (Source: Coleman,
Appendix A3, printed 435–436, finite definition of D and finite-operator step in Theorem A3.9.) -/
theorem polynomialSpectralResultant_charpolyRev_fin {R : Type*} [CommRing R] {n : ℕ}
    (M : Matrix (Fin n) (Fin n) R) (m : ℕ) (B : R[X]) (hm : B.natDegree ≤ m) :
    polynomialSpectralResultant n m B M.charpolyRev = (Polynomial.aeval M B).charpolyRev := sorry
end
end NonarchimedeanFredholm

namespace Matrix
noncomputable section
open Polynomial
variable {R ι κ : Type*} [CommRing R] [Fintype ι] [DecidableEq ι]
  [Fintype κ] [DecidableEq κ]
/-- Reindexing a characteristic series. For a bijection e:I→J between finite index types, P_(reindex_e
M)=P_M. (Source: Coleman, Appendix A3, printed 435–436, finite definition of D and finite-operator
step in Theorem A3.9.) -/
theorem charpolyRev_reindex (e : ι ≃ κ) (M : Matrix ι ι R) :
    (Matrix.reindex e e M).charpolyRev = M.charpolyRev := sorry
/-- Reindexing polynomial matrix calculus. Reindexing B(M) along e:I→J equals B(reindex_e M). (Source:
Coleman, Appendix A3, printed 435–436, finite definition of D and finite-operator step in Theorem
A3.9.) -/
theorem aeval_reindex (e : ι ≃ κ) (M : Matrix ι ι R) (B : R[X]) :
    Matrix.reindex e e (Polynomial.aeval M B) =
      Polynomial.aeval (Matrix.reindex e e M) B := sorry
end
end Matrix

namespace NonarchimedeanFredholm
noncomputable section
open Polynomial _root_.Matrix
variable {R ι : Type*} [CommRing R] [Fintype ι] [DecidableEq ι]
/-- Finite characteristic spectral mapping. For a finite square matrix M over any commutative ring R
and B∈R[Y] of natural degree at most m, D_(|I|,m)(B,P_M)=P_(B(M)). The index set need not have an
order, and B(0) may be nonzero. (Source: Coleman, Appendix A3, printed 435–436, finite definition
of D and finite-operator step in Theorem A3.9.) -/
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
end NonarchimedeanFredholm

/-! Reciprocal resultants and the scalar truncation limit in Coleman A3.8(11).
The full entire spectral transform is a separate remaining target.
-/
namespace NonarchimedeanFredholm
section ReciprocalResultants
variable {R : Type*} [CommRing R]
/-- Simultaneous reflection of the Sylvester matrix. Reindex both axes of Sylvester(f,g;m,n) by the
global reversal of Fin(m+n), followed by the canonical cast to Fin(n+m). The result is
Sylvester(reflect_n(g),reflect_m(f);n,m). (Source: Coleman, Appendix A3, printed434–435: resultant
norm interpretation, reciprocity(9), and the full proof of LemmaA3.8(11). Complete.) -/
theorem sylvester_reflect_swap (f g : Polynomial R) (m n : ℕ) :
    (Polynomial.sylvester f g m n).reindex
        ((Fin.revPerm : Equiv.Perm (Fin (m+n))).trans (finCongr (Nat.add_comm m n)))
        ((Fin.revPerm : Equiv.Perm (Fin (m+n))).trans (finCongr (Nat.add_comm m n))) =
      Polynomial.sylvester (g.reflect n) (f.reflect m) n m := by sorry
/-- Reciprocal resultant with swapped factors. Res(reflect_m(f),reflect_n(g);m,n)=Res(g,f;n,m).
(Source: Coleman, Appendix A3, printed434–435: resultant norm interpretation, reciprocity(9), and
the full proof of LemmaA3.8(11). Complete.) -/
theorem resultant_reflect_swap (f g : Polynomial R) (m n : ℕ) :
    Polynomial.resultant (f.reflect m) (g.reflect n) m n =
      Polynomial.resultant g f n m := by sorry
/-- Finite reciprocal spectral evaluation. For monic Q of degree d and P.natDegree≤n,
D_(n,d)(1−Q.reverse,P)(1)=Res(Q,P;d,P.natDegree). (Source: Coleman, Appendix A3, printed434–435:
resultant norm interpretation, reciprocity(9), and the full proof of LemmaA3.8(11). Complete.) -/
theorem polynomialSpectralResultant_one_sub_reverse_eval
    (Q P : Polynomial R) (hQ : Q.Monic) (n : ℕ) (hP : P.natDegree ≤ n) :
    (polynomialSpectralResultant n Q.natDegree (1-Q.reverse) P).eval 1 =
      Polynomial.resultant Q P Q.natDegree P.natDegree := by sorry
/-- A fixed-size resultant of the monic remainder. For monic Q of degree d and every polynomial P,
Res(Q,P;d,P.natDegree)=Res(Q,P modByMonic Q;d,d). (Source: Coleman, Appendix A3, printed434–435:
resultant norm interpretation, reciprocity(9), and the full proof of LemmaA3.8(11). Complete.) -/
theorem resultant_modByMonic_fixedBound (Q P : Polynomial R) (hQ : Q.Monic) :
    Polynomial.resultant Q P Q.natDegree P.natDegree =
      Polynomial.resultant Q (P %ₘ Q) Q.natDegree Q.natDegree := by sorry
end ReciprocalResultants

section ResultantCoordinates
variable {R : Type*} [CommRing R] [TopologicalSpace R] [IsTopologicalRing R] [DecidableEq R]
/-- Continuity of a fixed coefficient resultant. For fixed Q and m,n, the function
v↦Res(Q,Polynomial.ofFn(n+1,v);m,n) from the native finite product R^(n+1) to R is continuous.
(Source: Coleman, Appendix A3, printed434–435: resultant norm interpretation, reciprocity(9), and
the full proof of LemmaA3.8(11). Complete.) -/
theorem continuous_resultant_ofFn (Q : Polynomial R) (m n : ℕ) :
    Continuous (fun v : Fin (n+1) → R =>
      Polynomial.resultant Q (Polynomial.ofFn (n+1) v) m n) := by sorry
end ResultantCoordinates

section EntireResultantLimit
variable {A : Type*} [NormedCommRing A] [NormOneClass A] [CompleteSpace A] [Nontrivial A]
variable (hA : ∀ x y : A, ‖x+y‖ ≤ max ‖x‖ ‖y‖)
/-- Truncation limit of each monic quotient coefficient. For every k≥0, coeff_k(S_Q(F_n)) converges to
coeff_k(S_Q(F)) as n tends to infinity. (Source: Coleman, Appendix A3, printed434–435: resultant
norm interpretation, reciprocity(9), and the full proof of LemmaA3.8(11). Complete.) -/
theorem tendsto_entireMonicQuotient_trunc_coeff
    (Q : Polynomial A) (hQ : Q.Monic) (F : PowerSeries A) (hF : IsEntire F) (k : ℕ) :
    Tendsto (fun n : ℕ => (entireMonicQuotient Q
      ((PowerSeries.trunc (n+1) F : Polynomial A) : PowerSeries A)).coeff k)
      atTop (𝓝 ((entireMonicQuotient Q F).coeff k)) := by sorry
/-- Truncation limit of each monic remainder coefficient. For every k≥0, coeff_k(F_n modByMonic Q)
converges to coeff_k(R_Q(F)). (Source: Coleman, Appendix A3, printed434–435: resultant norm
interpretation, reciprocity(9), and the full proof of LemmaA3.8(11). Complete.) -/
theorem tendsto_modByMonic_trunc_coeff
    (Q : Polynomial A) (hQ : Q.Monic) (F : PowerSeries A) (hF : IsEntire F) (k : ℕ) :
    Tendsto (fun n : ℕ => ((PowerSeries.trunc (n+1) F) %ₘ Q).coeff k)
      atTop (𝓝 ((PowerSeries.trunc Q.natDegree
        (F-(Q : PowerSeries A)*entireMonicQuotient Q F)).coeff k)) := by sorry

/-- Entire resultant as a limit of polynomial resultants. Res(Q,F_n;d,F_n.natDegree) converges to the
existing entire resultant Res(Q,F). (Source: Coleman, Appendix A3, printed434–435: resultant norm
interpretation, reciprocity(9), and the full proof of LemmaA3.8(11). Complete.) -/
theorem tendsto_resultant_trunc
    (Q : Polynomial A) (hQ : Q.Monic) (F : PowerSeries A) (hF : IsEntire F) :
    Tendsto (fun n : ℕ => Polynomial.resultant Q (PowerSeries.trunc (n+1) F)
      Q.natDegree (PowerSeries.trunc (n+1) F).natDegree)
      atTop (𝓝 (entireResultant hA Q hQ F hF)) := by sorry
/-- Scalar spectral limit with a fixed reciprocal polynomial. D_(n,d)(1−Q.reverse,F_n)(1) converges to
Res(Q,F). (Source: Coleman, Appendix A3, printed434–435: resultant norm interpretation,
reciprocity(9), and the full proof of LemmaA3.8(11). Complete.) -/
theorem tendsto_spectral_one_sub_reverse_eval
    (Q : Polynomial A) (hQ : Q.Monic) (F : PowerSeries A) (hF : IsEntire F) :
    Tendsto (fun n : ℕ => (polynomialSpectralResultant n Q.natDegree
      (1-Q.reverse) (PowerSeries.trunc (n+1) F)).eval 1)
      atTop (𝓝 (entireResultant hA Q hQ F hF)) := by sorry

/-- The normalized scalar limit in Coleman A3.8. Assume F(0)=1 and let B=1−Q.reverse and
B_n=trunc(n+1,B). Then D_(n,n)(B_n,F_n)(1) converges to Res(Q,F). (Source: Coleman, Appendix A3,
printed434–435: resultant norm interpretation, reciprocity(9), and the full proof of
LemmaA3.8(11). Complete.) -/
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
end NonarchimedeanFredholm

/-! Entire Gauss convergence on the existing native power-series carrier.
The general spectral transform still requires its own coefficient estimates. -/
noncomputable section
open Filter
open scoped Topology
namespace NonarchimedeanFredholm
variable {A : Type*} [NormedCommRing A]
local notation "G" => PowerSeries.gaussNorm (norm : A → ℝ)

/-- Entire series and native restrictedness. F is entire if and only if it is native IsRestricted at
every positive real radius. (Source: Coleman, Appendix A3, complete published printed 432–436 ;
entire coefficient decay on 432, division on 434, spectral truncation limit and Lemma A3.8 on
435.) -/
theorem isEntire_iff_forall_isRestricted (F : PowerSeries A) :
    IsEntire F ↔ ∀ R : ℝ, 0 < R → F.IsRestricted R := by sorry

/-- The native Gauss norm comparison. For every real R and every power series F, the preceding
gaussSize R F equals the native G_R(F). (Source: Coleman, Appendix A3, complete published printed
432–436 ; entire coefficient decay on 432, division on 434, spectral truncation limit and Lemma
A3.8 on 435.) -/
theorem gaussSize_eq_gaussNorm (R : ℝ) (F : PowerSeries A) :
    gaussSize R F = G R F := by sorry

/-- Two-radius truncation estimate. If 0<R≤S and F has native HasGaussNorm at S, then
G_R(F−trunc_N(F))≤G_S(F)(R/S)^N for every N≥0. (Source: Coleman, Appendix A3, complete published
printed 432–436 ; entire coefficient decay on 432, division on 434, spectral truncation limit and
Lemma A3.8 on 435.) -/
theorem gaussNorm_sub_trunc_le (F : PowerSeries A) (N : ℕ) (R S : ℝ)
    (hR : 0 < R) (hRS : R ≤ S) (hF : F.HasGaussNorm norm S) :
    G R (F - (PowerSeries.trunc N F : PowerSeries A)) ≤
      G S F * (R/S)^N := by sorry

/-- Entire truncations converge at every radius. If F is entire and R>0, then G_R(F−trunc_N(F)) tends
to zero as N tends to infinity. (Source: Coleman, Appendix A3, complete published printed 432–436
; entire coefficient decay on 432, division on 434, spectral truncation limit and Lemma A3.8 on
435.) -/
theorem tendsto_gaussNorm_sub_trunc (F : PowerSeries A) (hF : IsEntire F)
    (R : ℝ) (hR : 0 < R) :
    Tendsto (fun N : ℕ => G R (F - (PowerSeries.trunc N F : PowerSeries A)))
      atTop (𝓝 0) := by sorry

/-- Entire coefficient limits under radius bounds. Let F_i be a sequence of entire series and f a
formal power series. Assume every coefficient of F_i converges to that of f, and for every S>0
there is C_S≥0 with G_S(F_i)≤C_S for all i. Then f is entire. (Source: Coleman, Appendix A3,
complete published printed 432–436 ; entire coefficient decay on 432, division on 434, spectral
truncation limit and Lemma A3.8 on 435.) -/
theorem isEntire_of_coeff_tendsto_of_gauss_bounded
    (F : ℕ → PowerSeries A) (hF : ∀ i, IsEntire (F i)) (f : PowerSeries A)
    (hlim : ∀ k, Tendsto (fun i => (F i).coeff k) atTop (𝓝 (f.coeff k)))
    (hbd : ∀ S : ℝ, 0 < S → ∃ C : ℝ, 0 ≤ C ∧ ∀ i, G S (F i) ≤ C) :
    IsEntire f := by sorry

/-- Bounded coefficient limits converge in Gauss norms. Under the preceding coefficient-limit and
every-radius uniform-bound hypotheses, if A is ultrametric, then G_R(F_i−f) tends to zero for each
R>0. (Source: Coleman, Appendix A3, complete published printed 432–436 ; entire coefficient decay
on 432, division on 434, spectral truncation limit and Lemma A3.8 on 435.) -/
theorem tendsto_gaussNorm_of_coeff_tendsto_of_gauss_bounded
    (hA : ∀ x y : A, ‖x+y‖ ≤ max ‖x‖ ‖y‖)
    (F : ℕ → PowerSeries A) (hF : ∀ i, IsEntire (F i)) (f : PowerSeries A)
    (hlim : ∀ k, Tendsto (fun i => (F i).coeff k) atTop (𝓝 (f.coeff k)))
    (hbd : ∀ S : ℝ, 0 < S → ∃ C : ℝ, 0 ≤ C ∧ ∀ i, G S (F i) ≤ C)
    (R : ℝ) (hR : 0 < R) :
    Tendsto (fun i => G R (F i - f)) atTop (𝓝 0) := by sorry

/-- Radius bounds for a Gauss-Cauchy sequence. Let F_i be entire and R>0. If for every epsilon>0 there
is N with G_R(F_i−F_j)<epsilon for all i,j≥N, then G_R(F_i) has a common nonnegative upper bound.
(Source: Coleman, Appendix A3, complete published printed 432–436 ; entire coefficient decay on
432, division on 434, spectral truncation limit and Lemma A3.8 on 435.) -/
theorem gauss_bounded_of_cauchy
    (hA : ∀ x y : A, ‖x+y‖ ≤ max ‖x‖ ‖y‖)
    (F : ℕ → PowerSeries A) (hF : ∀ i, IsEntire (F i)) (R : ℝ) (hR : 0 < R)
    (hC : ∀ ε : ℝ, 0 < ε → ∃ N : ℕ, ∀ i ≥ N, ∀ j ≥ N, G R (F i - F j) < ε) :
    ∃ C : ℝ, 0 ≤ C ∧ ∀ i, G R (F i) ≤ C := by sorry

/-- Unique entire limit of Gauss-Cauchy sequences. Assume A is complete and ultrametric. A sequence
F_i of entire series that is Cauchy in every native Gauss norm has a unique formal series f which
is entire and satisfies G_R(F_i−f)→0 for every R>0. (Source: Coleman, Appendix A3, complete
published printed 432–436 ; entire coefficient decay on 432, division on 434, spectral truncation
limit and Lemma A3.8 on 435.) -/
theorem existsUnique_entire_gauss_limit [CompleteSpace A]
    (hA : ∀ x y : A, ‖x+y‖ ≤ max ‖x‖ ‖y‖)
    (F : ℕ → PowerSeries A) (hF : ∀ i, IsEntire (F i))
    (hC : ∀ R : ℝ, 0 < R → ∀ ε : ℝ, 0 < ε →
      ∃ N : ℕ, ∀ i ≥ N, ∀ j ≥ N, G R (F i - F j) < ε) :
    ∃! f : PowerSeries A, IsEntire f ∧ ∀ R : ℝ, 0 < R →
      Tendsto (fun i => G R (F i - f)) atTop (𝓝 0) := by sorry

/-- Uniform evaluation of a Gauss limit. Assume A is complete and ultrametric. For any filter l and
family F_i of entire series, any entire f and R>0, G_R(F_i−f)→0 along l implies uniform
convergence of entire_eval(F_i,a) to entire_eval(f,a) on the native closed ball ‖a‖≤R. (Source:
Coleman, Appendix A3, complete published printed 432–436 ; entire coefficient decay on 432,
division on 434, spectral truncation limit and Lemma A3.8 on 435.) -/
theorem tendstoUniformlyOn_entire_eval_of_gauss [CompleteSpace A]
    (hA : ∀ x y : A, ‖x+y‖ ≤ max ‖x‖ ‖y‖)
    {ι : Type*} (l : Filter ι) (F : ι → PowerSeries A) (hF : ∀ i, IsEntire (F i))
    (f : PowerSeries A) (hf : IsEntire f) (R : ℝ) (hR : 0 < R)
    (hlim : Tendsto (fun i => G R (F i - f)) l (𝓝 0)) :
    TendstoUniformlyOn (fun i a => entire_eval (F i) a) (entire_eval f) l
      {a : A | ‖a‖ ≤ R} := by sorry

/-- Multiplication of Gauss limits. In an ultrametric A, if entire F_i→f and H_i→h in the native Gauss
norm at a fixed R>0, then F_iH_i→fh in that same Gauss norm. (Source: Coleman, Appendix A3,
complete published printed 432–436 ; entire coefficient decay on 432, division on 434, spectral
truncation limit and Lemma A3.8 on 435.) -/
theorem tendsto_gaussNorm_mul
    (hA : ∀ x y : A, ‖x+y‖ ≤ max ‖x‖ ‖y‖)
    (F H : ℕ → PowerSeries A) (hF : ∀ i, IsEntire (F i)) (hH : ∀ i, IsEntire (H i))
    (f h : PowerSeries A) (hf : IsEntire f) (hh : IsEntire h) (R : ℝ) (hR : 0 < R)
    (hFlim : Tendsto (fun i => G R (F i - f)) atTop (𝓝 0))
    (hHlim : Tendsto (fun i => G R (H i - h)) atTop (𝓝 0)) :
    Tendsto (fun i => G R (F i * H i - f*h)) atTop (𝓝 0) := by sorry

/-- A radius bound for entire monic division. Let Q be monic of degree d. If 1≤C≤S, 0<R≤S and
‖coeff_i(Q.reverse)‖≤C^i for every i, then every entire F satisfies G_R(S_Q(F))≤G_S(F)/S^d, where
S_Q is the existing entireMonicQuotient. (Source: Coleman, Appendix A3, complete published printed
432–436 ; entire coefficient decay on 432, division on 434, spectral truncation limit and Lemma
A3.8 on 435.) -/
theorem gaussNorm_entireMonicQuotient_le [NormOneClass A] [CompleteSpace A] [Nontrivial A]
    (hA : ∀ x y : A, ‖x+y‖ ≤ max ‖x‖ ‖y‖)
    (Q : Polynomial A) (hQ : Q.Monic) (C R S : ℝ) (hC : 1 ≤ C)
    (hCS : C ≤ S) (hR : 0 < R) (hRS : R ≤ S)
    (hQb : ∀ i : ℕ, ‖Q.reverse.coeff i‖ ≤ C^i)
    (F : PowerSeries A) (hF : IsEntire F) :
    G R (entireMonicQuotient Q F) ≤ G S F / S^Q.natDegree := by sorry

/-- Continuity of entire monic division in Gauss radii. For fixed monic Q, if entire F_i→f in every
Gauss radius, then S_Q(F_i)→S_Q(f) in every Gauss radius. (Source: Coleman, Appendix A3, complete
published printed 432–436 ; entire coefficient decay on 432, division on 434, spectral truncation
limit and Lemma A3.8 on 435.) -/
theorem tendsto_gaussNorm_entireMonicQuotient [NormOneClass A] [CompleteSpace A] [Nontrivial A]
    (hA : ∀ x y : A, ‖x+y‖ ≤ max ‖x‖ ‖y‖)
    (Q : Polynomial A) (hQ : Q.Monic) (F : ℕ → PowerSeries A)
    (hF : ∀ i, IsEntire (F i)) (f : PowerSeries A) (hf : IsEntire f)
    (hlim : ∀ S : ℝ, 0 < S → Tendsto (fun i => G S (F i - f)) atTop (𝓝 0))
    (R : ℝ) (hR : 0 < R) :
    Tendsto (fun i => G R (entireMonicQuotient Q (F i) - entireMonicQuotient Q f))
      atTop (𝓝 0) := by sorry
end NonarchimedeanFredholm

namespace EntireGaussTests
open NonarchimedeanFredholm
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
namespace NonarchimedeanFredholm
section FiniteSpectralCoordinates
variable {R : Type*} [CommRing R]
/-- Reduction of the functional polynomial at fixed characteristic rank. If P(0)=1, natDegree(P)≤n and
natDegree(B)≤m, then D_(n,m)(B,P)=D_(n,n)(B modByMonic reflect_n(P),P). (Source: Coleman, Appendix
A3, published435: definition of D and LemmaA3.8; full published435–436 freshly read28
September2026, with preceding full432–436 reading retained.) -/
theorem polynomialSpectralResultant_modByMonic (n m : ℕ) (B P : Polynomial R)
    (hP : P.coeff 0 = 1) (hn : P.natDegree ≤ n) (hm : B.natDegree ≤ m) :
    polynomialSpectralResultant n m B P =
      polynomialSpectralResultant n n (B %ₘ P.reflect n) P := sorry
/-- The finite spectral output has degree at most its rank. For any B,P and any n,m,
natDegree(D_(n,m)(B,P))≤n. (Source: Coleman, Appendix A3, published435: definition of D and
LemmaA3.8; full published435–436 freshly read28 September2026, with preceding full432–436 reading
retained.) -/
theorem polynomialSpectralResultant_natDegree_le (n m : ℕ) (B P : Polynomial R) :
    (polynomialSpectralResultant n m B P).natDegree ≤ n := sorry
/-- Continuity of finite spectral coefficients. Over a topological commutative ring R, fix n,m,k and
P. The kth coefficient of D_(n,m)(ofFn_(m+1)(b),P) is continuous as a function of b∈R^(m+1).
(Source: Coleman, Appendix A3, published435: definition of D and LemmaA3.8; full published435–436
freshly read28 September2026, with preceding full432–436 reading retained.) -/
theorem continuous_polynomialSpectralResultant_coeff [TopologicalSpace R]
    [IsTopologicalRing R] [DecidableEq R] (n m k : ℕ) (P : Polynomial R) :
    Continuous (fun b : Fin (m+1) → R =>
      (polynomialSpectralResultant n m (Polynomial.ofFn (m+1) b) P).coeff k) := sorry
end FiniteSpectralCoordinates

section BoundedDegreeGauss
variable {A : Type*} [NormedCommRing A]
/-- Gauss convergence of bounded-degree coefficient limits. For any filter l, polynomials F_i and f
over a normed commutative ring with all natural degrees≤d, and coefficientwise F_i→f along l, one
has G_R(F_i−f)→0 for every R>0. (Source: Coleman, Appendix A3, published435: definition of D and
LemmaA3.8; full published435–436 freshly read28 September2026, with preceding full432–436 reading
retained.) -/
theorem tendsto_gaussNorm_of_bounded_degree {ι : Type*} (l : Filter ι)
    (F : ι → Polynomial A) (f : Polynomial A) (d : ℕ)
    (hF : ∀ i, (F i).natDegree ≤ d) (hf : f.natDegree ≤ d)
    (hlim : ∀ k, Tendsto (fun i => (F i).coeff k) l (𝓝 (f.coeff k)))
    (R : ℝ) (hR : 0 < R) :
    Tendsto (fun i => PowerSeries.gaussNorm norm R ((F i-f : Polynomial A) : PowerSeries A))
      l (𝓝 0) := sorry

/-- Spectral transform with entire functional input and fixed polynomial input. Define
E_n(B,P)=D_(n,n)(R_(Q_n)(B),P), a native polynomial, using the existing entire monic remainder and
Q_n=reflect_n(P). (Source: Coleman, Appendix A3, published435: definition of D and LemmaA3.8; full
published435–436 freshly read28 September2026, with preceding full432–436 reading retained.) -/
def entirePolynomialSpectral (n : ℕ) (B : PowerSeries A) (P : Polynomial A) : Polynomial A := sorry
/-- The value is D_(n,n) of trunc_n(B−Q_n S_(Q_n)(B)) and P. Part of the API of the target *Spectral
transform with entire functional input and fixed polynomial input*. -/
theorem entirePolynomialSpectral_def (n : ℕ) (B : PowerSeries A) (P : Polynomial A) :
    entirePolynomialSpectral n B P = polynomialSpectralResultant n n
      (PowerSeries.trunc n (B - (P.reflect n : PowerSeries A) * entireMonicQuotient (P.reflect n) B)) P := sorry
/-- For P(0)=1, the output constant coefficient is1. Part of the API of the target *Spectral transform
with entire functional input and fixed polynomial input*. -/
theorem entirePolynomialSpectral_constantCoeff (n : ℕ) (B : PowerSeries A)
    (P : Polynomial A) (hP : P.coeff 0 = 1) :
    (entirePolynomialSpectral n B P).coeff 0 = 1 := sorry
/-- For normalized P of degree at most n, E_n(0,P)=1. Part of the API of the target *Spectral
transform with entire functional input and fixed polynomial input*. -/
theorem entirePolynomialSpectral_zero (n : ℕ) (P : Polynomial A)
    (hP : P.coeff 0 = 1) (hn : P.natDegree ≤ n) :
    entirePolynomialSpectral n 0 P = 1 := sorry
end BoundedDegreeGauss

section EntireFixedCharacteristic
variable {A : Type*} [NormedCommRing A] [hNormOne : NormOneClass A]
  [hComplete : CompleteSpace A] [hNontrivial : Nontrivial A]
variable (hA : ∀ x y : A, ‖x+y‖ ≤ max ‖x‖ ‖y‖)
include hA hNormOne hComplete hNontrivial

/-- Agreement with the polynomial spectral construction. For polynomial B with natDegree(B)≤m,
E_n(B,P)=D_(n,m)(B,P). (Source: Coleman, Appendix A3, published435: definition of D and LemmaA3.8;
full published435–436 freshly read28 September2026, with preceding full432–436 reading retained.) -/
theorem entirePolynomialSpectral_polynomial (n m : ℕ) (B P : Polynomial A)
    (hP : P.coeff 0 = 1) (hn : P.natDegree ≤ n) (hm : B.natDegree ≤ m) :
    entirePolynomialSpectral n (B : PowerSeries A) P = polynomialSpectralResultant n m B P := sorry
/-- Coefficient limits at fixed characteristic rank. For every k, coeff_k D_(n,N)(trunc_(N+1)(B),P)
tends to coeff_k E_n(B,P) as N→∞. (Source: Coleman, Appendix A3, published435: definition of D and
LemmaA3.8; full published435–436 freshly read28 September2026, with preceding full432–436 reading
retained.) -/
theorem tendsto_spectral_fixed_polynomial_coeff (n : ℕ) (B : PowerSeries A)
    (hB : IsEntire B) (P : Polynomial A) (hP : P.coeff 0 = 1) (hn : P.natDegree ≤ n) (k : ℕ) :
    Tendsto (fun N : ℕ => (polynomialSpectralResultant n N (PowerSeries.trunc (N+1) B) P).coeff k)
      atTop (𝓝 ((entirePolynomialSpectral n B P).coeff k)) := sorry
/-- All-radius Gauss convergence at fixed characteristic rank. For every R>0,
G_R(D_(n,N)(trunc_(N+1)(B),P)−E_n(B,P)) tends to0. (Source: Coleman, Appendix A3, published435:
definition of D and LemmaA3.8; full published435–436 freshly read28 September2026, with preceding
full432–436 reading retained.) -/
theorem tendsto_spectral_fixed_polynomial_gauss (n : ℕ) (B : PowerSeries A)
    (hB : IsEntire B) (P : Polynomial A) (hP : P.coeff 0 = 1) (hn : P.natDegree ≤ n)
    (R : ℝ) (hR : 0 < R) :
    Tendsto (fun N : ℕ => PowerSeries.gaussNorm norm R
      ((polynomialSpectralResultant n N (PowerSeries.trunc (N+1) B) P -
        entirePolynomialSpectral n B P : Polynomial A) : PowerSeries A)) atTop (𝓝 0) := sorry
/-- Simultaneous truncation convergence for polynomial characteristic input. If also B(0)=0, the
simultaneous D_(N,N)(trunc_(N+1)(B),trunc_(N+1)(P)) converges in every G_R to
E_(natDegree(P))(B,P). (Source: Coleman, Appendix A3, published435: definition of D and LemmaA3.8;
full published435–436 freshly read28 September2026, with preceding full432–436 reading retained.) -/
theorem tendsto_spectral_simultaneous_fixed_polynomial_gauss
    (B : PowerSeries A) (hB : IsEntire B) (hB0 : B.coeff 0 = 0)
    (P : Polynomial A) (hP : P.coeff 0 = 1) (R : ℝ) (hR : 0 < R) :
    Tendsto (fun N : ℕ => PowerSeries.gaussNorm norm R
      ((polynomialSpectralResultant N N (PowerSeries.trunc (N+1) B)
        (PowerSeries.trunc (N+1) (P : PowerSeries A)) -
        entirePolynomialSpectral P.natDegree B P : Polynomial A) : PowerSeries A)) atTop (𝓝 0) := sorry
/-- The exact zero-root padding law for entire functional input. E_(n+1)(B,P)=E_n(B,P)(1−B(0)T).
(Source: Coleman, Appendix A3, published435: definition of D and LemmaA3.8; full published435–436
freshly read28 September2026, with preceding full432–436 reading retained.) -/
theorem entirePolynomialSpectral_padding (n : ℕ) (B : PowerSeries A) (hB : IsEntire B)
    (P : Polynomial A) (hP : P.coeff 0 = 1) (hn : P.natDegree ≤ n) :
    entirePolynomialSpectral (n+1) B P = entirePolynomialSpectral n B P *
      (1 - Polynomial.C (B.coeff 0) * Polynomial.X) := sorry
/-- Factor products for polynomial characteristic inputs. If Q is also normalized with natDegree(Q)≤k,
then E_(n+k)(B,PQ)=E_n(B,P)E_k(B,Q). (Source: Coleman, Appendix A3, published435: definition of D
and LemmaA3.8; full published435–436 freshly read28 September2026, with preceding full432–436
reading retained.) -/
theorem entirePolynomialSpectral_mul (n k : ℕ) (B : PowerSeries A) (hB : IsEntire B)
    (P Q : Polynomial A) (hP : P.coeff 0 = 1) (hQ : Q.coeff 0 = 1)
    (hn : P.natDegree ≤ n) (hk : Q.natDegree ≤ k) :
    entirePolynomialSpectral (n+k) B (P*Q) =
      entirePolynomialSpectral n B P * entirePolynomialSpectral k B Q := sorry
/-- Linear characteristic input evaluates the entire function. For a∈A, E_1(B,1−aT)=1−B(a)T, with the
preceding actual entire evaluation. (Source: Coleman, Appendix A3, published435: definition of D
and LemmaA3.8; full published435–436 freshly read28 September2026, with preceding full432–436
reading retained.) -/
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
end NonarchimedeanFredholm
end

/-!
## L0–L2: locally analytic functions, the Amice transform and order-r distributions

Signatures (comment only; the objects are Colmez's `LA_h`, `D(ℤ_p, L)`, `C^r` and `D_r`):

```
/-- Locally analytic functions of fixed radius. For h ∈ ℕ, LA_h(ℤ_p, L) is the space of φ : ℤ_p → L
whose restriction to each a + p^hℤ_p is the restriction of some φ_{a,h} ∈ An(B(a, h), L), with
v_{LA_h}(φ) = inf_a v_{B(a,h)}(φ_{a,h}) (the infimum may be taken over any set of representatives
of ℤ_p/p^h). It is an L-Banach space with orthonormal basis e_{h,n}(x) = 1_{n+p^hℤ_p}(x)·((x +
i(n))/p^h)^{m(n)} (n = (m(n) + 1)p^h − i(n), 1 ≤ i(n) ≤ p^h), LA_h(ℤ_p, L) = L ⊗̂_{ℚ_p} LA_h(ℤ_p,
ℚ_p), and the inclusions LA_h ⊂ LA_{h+1} are continuous of norm ≤ 1. Since ℤ_p is compact, every
locally analytic function lies in some LA_h, and LA(ℤ_p, L) = lim→_h LA_h(ℤ_p, L) carries the
locally convex inductive-limit topology. (Source: Colmez, §I.4.2, Remark I.4.4, Lemma I.4.5,
Corollary I.4.6, pp. 14–15; RJW, Definition 3.40 and the description of C^{n−an}, p. 24.) -/
def LAh (h : ℕ) : Type _            -- LA_h(ℤ_p, L), Banach with v_{LA_h}
/-- LA(ℤ_p, L) = lim→ LA_h with the inductive-limit topology. Part of the API of the target *Locally
analytic functions of fixed radius*. -/
def LA : Type _ := lim→ LAh          -- inductive-limit (compact type) topology
/-- D(ℤ_p, L), the continuous dual of LA(ℤ_p, L). Part of the API of the target *Locally analytic
distributions*. -/
def Dist : Type _ := LA →L[L] L      -- Fréchet dual = lim← (LAh h)′
theorem amice_mahler_basis (h : ℕ) : IsOrthonormalBasis (fun n ↦ ((n / p ^ h)! : L) • binomial n)
/-- The Amice transform of distributions. For μ ∈ D(ℤ_p, L) let A_μ(T) = ∫(1 + T)^x μ(x) = Σ_n T^n
∫C(x, n)μ ∈ L⟦T⟧. Then μ ↦ A_μ is an isomorphism of Fréchet spaces from D(ℤ_p, L) onto R⁺, the
power series converging on the open unit disc v_p(T) > 0 with the valuations v_{B(0,u_h)}, u_h =
1/((p − 1)p^h). Precisely, v_{B(0,u_h)}(A_μ) ≥ v_{LA_h}(μ) ≥ v_{B(0,u_{h+1})}(A_μ) − 1. Moreover
∫(1 + z)^x μ = A_μ(z) for v_p(z) > 0, and on bounded measures A_μ is the bounded Amice (Mahler)
transform, so D ⊃ M corresponds to R⁺ ⊃ 𝒪_L⟦T⟧ ⊗ L. (Source: Colmez, Lemma II.2.1 and Theorem
II.2.2, p. 30; RJW, Theorem 3.43 and (3.12), p. 25.) -/
def amice : Dist ≃L[L] OpenDiscFunctions L   -- μ ↦ Σ Tⁿ ∫ C(x, n) μ
/-- Distributions of order r (admissible distributions). For r ≥ 0, a distribution μ ∈ D(ℤ_p, L) has
order r (is r-admissible, or h-admissible with h = r) if it extends continuously to C^r(ℤ_p, L);
D_r(ℤ_p, L) = C^r(ℤ_p, L)′. The following are equivalent: (a) μ ∈ D_r; (b) the Amice transform A_μ
= Σ b_nT^n has v_p(b_n) + rℓ(n) bounded below (A_μ ∈ R⁺_r); (c) inf_h(v_{B(0,u_h)}(A_μ) + rh) >
−∞; (d) v_{D_r}(μ) = inf_n(v_{LA_n}(μ) + rn) > −∞, i.e. ‖μ‖_{LA_n} = O(p^{rn}) (on the ball of
radius p^{−n}); (e) there is C with v_p(∫_{a+p^nℤ_p}((x − a)/p^n)^k μ) ≥ C − rn for all a ∈ ℤ_p,
k, n. The valuations of (b)–(e) are equivalent to v′_{D_r}, and μ ↦ A_μ is an isometry (D_r,
v′_{D_r}) ≅ (R⁺_r, v_r). Orders add under products of transforms and under convolution. (Source:
Colmez, §II.1, Lemma II.1.1, §II.3.1, Proposition II.3.1, Theorem II.3.2(i), Proposition II.3.3,
pp. 29–34.) -/
def DistOrder (r : ℝ≥0) : Submodule L Dist   -- extends continuously to C^r
theorem amice_velu_vishik (r : ℝ≥0) (N : ℕ∞) (hN : ⌊r⌋₊ ≤ N) (μ : LocPoly N →ₗ[L] L)
    (hμ : ∃ C, ∀ a k n, k ≤ N → C - r * n ≤ v (μ (ballMonomial a n k))) :
    ∃! μ' ∈ DistOrder r, ∀ f, μ' f = μ f
```
-/

/-! ## Layer 0: analytic Banach stages, locally analytic functions and their strong duals (one variable) -/

namespace LocallyAnalytic.SuggestedTest

/-- Amice's theorem on Mahler coefficients: `v_3((3²)!) = (3² − 1)/(3 − 1) = 4`, the size of `C(x, 9)` in `LA₀`. -/
example : Nat.factorial 9 % 3 ^ 4 = 0 ∧ Nat.factorial 9 % 3 ^ 5 ≠ 0 := by
  norm_num [Nat.factorial]

/-- The Amice–Vélu–Vishik extension and uniqueness theorem: `d^{N+1}δ₀` kills every polynomial of degree `≤ N`, so uniqueness fails at
`r = N + 1`. -/
example (P : Polynomial ℚ) (N : ℕ) (h : P.natDegree ≤ N) :
    Polynomial.derivative^[N + 1] P = 0 :=
  Polynomial.iterate_derivative_eq_zero (by omega)

/-- Order zero is bounded measures: the Haar distribution `μ(a + pⁿℤ_p) = p^{−n}` is additive over the `p`
sub-balls. -/
example (p : ℚ) (hp : p ≠ 0) (n : ℕ) : (p ^ n)⁻¹ = p * (p ^ (n + 1))⁻¹ := by
  field_simp
  ring

end LocallyAnalytic.SuggestedTest

/-! Mellin transforms of bounded measures on a finite-character component (README §3.1–§3.2),
and series on the open disc (§1.2).  -/
noncomputable section
open Filter
open scoped Topology AbstractMeasure
/-! ## Layer 1: the unbounded Amice transform — series on the open disc (§1.2);
## Layer 3: character spaces and Mellin transforms — component and branch Mellin (§3.1–§3.2) -/

namespace Mellin
variable {p : ℕ} [Fact p.Prime]
variable {K : Type*} [NontriviallyNormedField K] [CompleteSpace K]
  [Algebra ℤ_[p] K] [IsBoundedSMul ℤ_[p] K] [IsUltrametricDist K]

-- The predicate uses native radius-restricted series; it is not a new carrier.
def OnOpenDisc (F : PowerSeries K) : Prop :=
  ∀ R : ℝ, 0 < R → R < 1 → PowerSeries.IsRestricted R F

-- Evaluation is the native scalar-series sum, not a second construction.
abbrev evalOpen (F : PowerSeries K) (t : K) : K :=
  FormalMultilinearSeries.ofScalarsSum (fun n => F.coeff n) t
theorem evalOpen_def (F : PowerSeries K) (t : K) :
    evalOpen F t = ∑' n : ℕ, F.coeff n * t ^ n := by sorry
theorem evalOpen_zero (F : PowerSeries K) : evalOpen F 0 = F.coeff 0 := by sorry
theorem evalOpen_C (a t : K) : evalOpen (PowerSeries.C a) t = a := by sorry
theorem evalOpen_X (t : K) : evalOpen PowerSeries.X t = t := by sorry
theorem evalOpen_add (F H : PowerSeries K) (hF : OnOpenDisc F) (hH : OnOpenDisc H)
    (t : K) (ht : ‖t‖ < 1) : evalOpen (F + H) t = evalOpen F t + evalOpen H t := by sorry
theorem evalOpen_smul (F : PowerSeries K) (hF : OnOpenDisc F) (a t : K) (ht : ‖t‖ < 1) :
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

/-- Open-disc series and the native analytic radius. For an open-disc series F, the native scalar
formal multilinear series ofScalars(K,coeff(F)) has radius at least 1. E(F,t) is therefore the sum
of this native analytic series on ||t||<1. This is an adapter between two existing library
encodings, not a second definition of summation or of analyticity. (Source: Colmez, §II.2, Lemma
II.2.1 and Theorem II.2.2 with proofs, author PDF p. 30.) -/
theorem openDisc_native_radius (F : PowerSeries K) (hF : OnOpenDisc F) :
    (1 : ENNReal) ≤ (FormalMultilinearSeries.ofScalars K (fun n => F.coeff n)).radius := by sorry

/-- Summability inside the open disc. For every open-disc series F and t∈K with ||t||<1, the series
Σ_n a_n t^n is summable in K. (Source: Colmez, §II.2, Lemma II.2.1 and Theorem II.2.2 with proofs,
author PDF p. 30.) -/
theorem openDisc_summable (F : PowerSeries K) (hF : OnOpenDisc F)
    (t : K) (ht : ‖t‖ < 1) : Summable (fun n : ℕ => F.coeff n * t ^ n) := by sorry
/-- Uniform geometric tails on a smaller disc. Let 0<R<S<1, M≥0, and ||a_n||S^n≤M for every n. For
||t||≤R and N≥0, ||E(F,t)−Σ_{n<N}a_n t^n||≤M(R/S)^N. Thus truncations converge uniformly on the
closed radius-R disc; this is a coefficient estimate, with no compactness assumption on that disc.
(Source: Colmez, §II.2, Lemma II.2.1 and Theorem II.2.2 with proofs, author PDF p. 30.) -/
theorem evalOpen_tail_bound (F : PowerSeries K) (hF : OnOpenDisc F) (R S M : ℝ)
    (hR : 0 < R) (hRS : R < S) (hS : S < 1) (hM : 0 ≤ M)
    (hb : ∀ n : ℕ, ‖F.coeff n‖ * S^n ≤ M) (t : K) (ht : ‖t‖ ≤ R) (N : ℕ) :
    ‖evalOpen F t - ∑ n ∈ Finset.range N, F.coeff n * t^n‖ ≤ M * (R/S)^N := by sorry
/-- Analytic evaluation of an open-disc series. For every open-disc series F, the function E(F,−):K→K
is analytic at every t with ||t||<1, using Mathlib’s AnalyticOnNhd. This does not identify an
arbitrary function on C_p-valued points with a rigid analytic function. (Source: Colmez, §II.2,
Lemma II.2.1 and Theorem II.2.2 with proofs, author PDF p. 30.) -/
theorem analyticOnNhd_evalOpen (F : PowerSeries K) (hF : OnOpenDisc F) :
    AnalyticOnNhd K (evalOpen F) {t : K | ‖t‖ < 1} := by sorry
/-- Evaluation preserves products inside the disc. For open-disc series F,H and ||t||<1,
E(FH,t)=E(F,t)E(H,t). The corresponding additivity and scalar-linearity follow from summability.
(Source: Colmez, §II.2, Lemma II.2.1 and Theorem II.2.2 with proofs, author PDF p. 30.) -/
theorem evalOpen_mul (F H : PowerSeries K) (hF : OnOpenDisc F) (hH : OnOpenDisc H)
    (t : K) (ht : ‖t‖ < 1) : evalOpen (F * H) t = evalOpen F t * evalOpen H t := by sorry
/-- Evaluation commutes with an isometric coefficient extension. For an isometric field homomorphism
φ:K→K′ into a complete ultrametric field, an open-disc series F and ||t||<1,
E(map(φ,F),φ(t))=φ(E(F,t)). The coefficient map is the native PowerSeries.map; no arbitrary
C_p-point function or completed distribution-family object is introduced. (Source: Colmez, §II.2,
Lemma II.2.1 and Theorem II.2.2 with proofs, author PDF p. 30.) -/
theorem evalOpen_map {L : Type*} [NontriviallyNormedField L] [CompleteSpace L]
    [IsUltrametricDist L] (φ : K →+* L) (hφ : Isometry φ)
    (F : PowerSeries K) (hF : OnOpenDisc F) (t : K) (ht : ‖t‖ < 1) :
    evalOpen (PowerSeries.map φ F) (φ t) = φ (evalOpen F t) := by sorry

section Components
variable {G Δ : Type*} [TopologicalSpace G] [CompactSpace G]
  [Fintype Δ] [TopologicalSpace Δ] [DiscreteTopology Δ]
/-- Mellin series on a finite-character component. Let G be compact and let H:G≃Δ×Z_p be an imported
character chart, Δ a finite discrete set. Let ν:Δ→K be the finite-character value function (the
formula also makes sense for any ν). For a native bounded measure μ on G define
F_{μ,ν,H}(T)=Σ_{n≥0} μ(g↦ν(H(g)_Δ) binom(H(g)_Z,n)) T^n. Multiplication uses K, with the native
algebra map Z_p→K on binomial values. This is the Mellin series adapter on the imported component;
it does not construct Δ, H, the character functor or its representing space. (Source: RJW, Remark
3.47, pp. 25–26; §5.3, pp. 34–35 (formula immediately before Remark 5.22).) -/
def componentMellin (H : G ≃ₜ Δ × ℤ_[p]) (ν : Δ → K)
    (μ : AbstractMeasure G K K) : PowerSeries K := by sorry
/-- The nth coefficient is μ(ν∘H_Δ times binom(H_Z,n)). Part of the API of the target *Mellin series
on a finite-character component*. -/
theorem componentMellin_coeff (H : G ≃ₜ Δ × ℤ_[p]) (ν : Δ → K)
    (μ : AbstractMeasure G K K) (n : ℕ) :
    (componentMellin H ν μ).coeff n = μ ⟨fun g =>
      ν (H g).1 * algebraMap ℤ_[p] K (mahler n (H g).2), by fun_prop⟩ := by sorry
/-- F_{μ+η,ν,H}=F_{μ,ν,H}+F_{η,ν,H}. Part of the API of the target *Mellin series on a
finite-character component*. -/
theorem componentMellin_add (H : G ≃ₜ Δ × ℤ_[p]) (ν : Δ → K)
    (μ η : AbstractMeasure G K K) :
    componentMellin H ν (μ+η) = componentMellin H ν μ + componentMellin H ν η := by sorry
/-- F_{aμ,ν,H}=aF_{μ,ν,H}. Part of the API of the target *Mellin series on a finite-character
component*. -/
theorem componentMellin_smul (H : G ≃ₜ Δ × ℤ_[p]) (ν : Δ → K)
    (a : K) (μ : AbstractMeasure G K K) :
    componentMellin H ν (a • μ) = a • componentMellin H ν μ := by sorry
/-- F_{δ_g,ν,H}=ν(H_Δg)Σ_n binom(H_Zg,n)T^n. Part of the API of the target *Mellin series on a
finite-character component*. -/
theorem componentMellin_dirac (H : G ≃ₜ Δ × ℤ_[p]) (ν : Δ → K) (g : G) :
    componentMellin H ν (AbstractMeasure.dirac K g) =
      PowerSeries.mk (fun n => ν (H g).1 * algebraMap ℤ_[p] K (mahler n (H g).2)) := by sorry
/-- coeff_0 F=μ(ν∘H_Δ). Part of the API of the target *Mellin series on a finite-character component*. -/
theorem componentMellin_mass (H : G ≃ₜ Δ × ℤ_[p]) (ν : Δ → K)
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
/-- Bounded component Mellin coefficients. Under the component-Mellin hypotheses, if C≥0 and
||ν(δ)||≤C for every δ, then ||coeff_n F_{μ,ν,H}||≤||μ||C for every n, where ||μ|| is the native
continuous-linear-functional operator norm. For finite characters in a splitting field one may
take C=1. (Source: RJW, Remark 3.47, pp. 25–26; §5.3, pp. 34–35 (formula immediately before Remark
5.22).) -/
theorem componentMellin_coeff_bound (H : G ≃ₜ Δ × ℤ_[p]) (ν : Δ → K)
    (μ : AbstractMeasure G K K) (C : ℝ) (hC : 0 ≤ C) (hν : ∀ δ, ‖ν δ‖ ≤ C) (n : ℕ) :
    ‖(componentMellin H ν μ).coeff n‖ ≤ ‖AbstractMeasure.toCLMEquiv μ‖ * C := by sorry
/-- Bounded component series are analytic on the disc. For every μ,ν,H as above, the component series
is open-disc analytic and has uniformly bounded coefficients. It is therefore a bounded rigid
function when transported to the imported component. This forward comparison does not by itself
prove that every bounded rigid function comes from a measure. (Source: RJW, Remark 3.47, pp.
25–26; §5.3, pp. 34–35 (formula immediately before Remark 5.22).) -/
theorem componentMellin_onOpenDisc (H : G ≃ₜ Δ × ℤ_[p]) (ν : Δ → K)
    (μ : AbstractMeasure G K K) : OnOpenDisc (componentMellin H ν μ) := by sorry
/-- Character evaluation equals the component Mellin value. For ||t||<1 let κ_t:Z_p→K be the native
additive character with κ_t(1)=1+t. Then E(F_{μ,ν,H},t)=μ(g↦ν(H_Δg)κ_t(H_Zg)). If H is a group
chart and ν a finite character, its right side is the scalar character integral on the imported
component. The statement uses continuous maps and genuine coefficient-field points. (Source: RJW,
Remark 3.47, pp. 25–26; §5.3, pp. 34–35 (formula immediately before Remark 5.22); Colmez, §II.2,
Lemma II.2.1 and Theorem II.2.2 with proofs, author PDF p. 30.) -/
theorem componentMellin_eval (H : G ≃ₜ Δ × ℤ_[p]) (ν : Δ → K)
    (μ : AbstractMeasure G K K) (t : K) (ht : ‖t‖ < 1) :
    evalOpen (componentMellin H ν μ) t = μ ⟨fun g => ν (H g).1 *
      PadicInt.addChar_of_value_at_one t
        (tendsto_pow_atTop_nhds_zero_iff_norm_lt_one.mpr ht) (H g).2, by fun_prop⟩ := by sorry
end Components

/-- Mellin branches in an arithmetic parameter. For an open-disc series F, q∈K with ||q||<1, and
s∈Z_p, put B_{F,q}(s)=E(F,κ_q(s)−1), using the native κ_q(1)=1+q. In the standard odd-prime unit
chart, γ=1+p, q=γ−1, and ν=ω^i, this is Mel_{μ,i}(s)=∫ω(x)^i〈x〉^s dμ. At p=2 the imported chart is
{±1}×(1+4Z_2), with γ=5; the odd-prime chart is not used there. (Source: RJW, Remark 3.47, pp.
25–26; §5.3, pp. 34–35 (formula immediately before Remark 5.22).) -/
def branchMellin (F : PowerSeries K) (q : K) (hq : ‖q‖ < 1) (s : ℤ_[p]) : K :=
    evalOpen F (PadicInt.addChar_of_value_at_one q
      (tendsto_pow_atTop_nhds_zero_iff_norm_lt_one.mpr hq) s - 1)
/-- B_{F,q}(s)=E(F,κ_q(s)−1). Part of the API of the target *Mellin branches in an arithmetic
parameter*. -/
theorem branchMellin_def (F : PowerSeries K) (q : K) (hq : ‖q‖ < 1) (s : ℤ_[p]) :
    branchMellin F q hq s = evalOpen F (PadicInt.addChar_of_value_at_one q
      (tendsto_pow_atTop_nhds_zero_iff_norm_lt_one.mpr hq) s - 1) := by sorry
/-- B_{F,q}(0)=coeff_0 F. Part of the API of the target *Mellin branches in an arithmetic parameter*. -/
theorem branchMellin_zero (F : PowerSeries K) (q : K) (hq : ‖q‖ < 1) :
    branchMellin (p := p) F q hq 0 = F.coeff 0 := by sorry
/-- B_{F,q}(1)=E(F,q). Part of the API of the target *Mellin branches in an arithmetic parameter*. -/
theorem branchMellin_one (F : PowerSeries K) (q : K) (hq : ‖q‖ < 1) :
    branchMellin (p := p) F q hq 1 = evalOpen F q := by sorry
/-- B_{F+H,q}(s)=B_{F,q}(s)+B_{H,q}(s) for two open-disc series. Part of the API of the target *Mellin
branches in an arithmetic parameter*. -/
theorem branchMellin_add (F H : PowerSeries K) (hF : OnOpenDisc F) (hH : OnOpenDisc H)
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
/-- Arithmetic branches stay inside the character disc. For q∈K with ||q||<1 and s∈Z_p,
||κ_q(s)−1||≤||q||<1. (Source: Colmez, §II.2, Lemma II.2.1 and Theorem II.2.2 with proofs, author
PDF p. 30.) -/
theorem branchCoordinate_norm_le (q : K) (hq : ‖q‖ < 1) (s : ℤ_[p]) :
    ‖PadicInt.addChar_of_value_at_one q
      (tendsto_pow_atTop_nhds_zero_iff_norm_lt_one.mpr hq) s - 1‖ ≤ ‖q‖ := by sorry
/-- Mellin evaluation at integral weights. For n≥0, B_{F,q}(n)=E(F,(1+q)^n−1). This pins integral
specialization of a branch independently of arithmetic L-value interpolation. In the canonical
unit chart, recovering x^k additionally requires the finite character ν=ω^i with k≡i modulo p−1
for odd p, and the corresponding parity branch at p=2; those coordinate comparisons are a
remaining supplier interface. (Source: RJW, Remark 3.47, pp. 25–26; §5.3, pp. 34–35 (formula
immediately before Remark 5.22).) -/
theorem branchMellin_nat (F : PowerSeries K) (q : K) (hq : ‖q‖ < 1) (n : ℕ) :
    branchMellin F q hq (n : ℤ_[p]) = evalOpen F ((1+q)^n-1) := by sorry

/-- Mellin evaluation on a clearing-factor domain. For open-disc numerator F and denominator D define
Q_{F,D}(t)=E(F,t)/E(D,t) only as a meromorphic chart expression. All evaluation theorems require
||t||<1 and E(D,t)≠0. For a pseudomeasure λ imported from PMIA L3 and a genuine clearing numerator
μ=([a]−[1])λ, F is the component Mellin series of μ and D represents κ_t(a)−1. A quotient’s total
value at a zero denominator has no meromorphic meaning; no extension of the pseudomeasure’s value
is asserted there. (Source: RJW, Remark 3.47, pp. 25–26; §5.3, pp. 34–35 (formula immediately
before Remark 5.22).) -/
def quotientMellin (F D : PowerSeries K) (t : K) : K := evalOpen F t / evalOpen D t
/-- Q_{F,D}(t)=E(F,t)/E(D,t); meaningful use is guarded by the nonvanishing condition. Part of the API
of the target *Mellin evaluation on a clearing-factor domain*. -/
theorem quotientMellin_def (F D : PowerSeries K) (t : K) :
    quotientMellin F D t = evalOpen F t / evalOpen D t := by sorry
/-- E(D,t)Q_{F,D}(t)=E(F,t) when E(D,t)≠0. Part of the API of the target *Mellin evaluation on a
clearing-factor domain*. -/
theorem quotientMellin_clear (F D : PowerSeries K) (t : K) (hD : evalOpen D t ≠ 0) :
    evalOpen D t * quotientMellin F D t = evalOpen F t := by sorry
/-- Q_{F,1}(t)=E(F,t). Part of the API of the target *Mellin evaluation on a clearing-factor domain*. -/
theorem quotientMellin_one (F : PowerSeries K) (t : K) :
    quotientMellin F 1 t = evalOpen F t := by sorry
/-- A zero numerator yields zero on every admissible domain. Part of the API of the target *Mellin
evaluation on a clearing-factor domain*. -/
theorem quotientMellin_zero (D : PowerSeries K) (t : K) : quotientMellin 0 D t = 0 := by sorry
-- QuotientMellinTests.no_denominator
example (F : PowerSeries K) (t : K) : quotientMellin F 1 t = evalOpen F t := by sorry
-- QuotientMellinTests.simple_pole
example (t : K) (ht : t ≠ 0) : quotientMellin 1 PowerSeries.X t = t⁻¹ := by sorry
-- QuotientMellinTests.removable_on_punctured_disc
example (t : K) (ht : t ≠ 0) : quotientMellin PowerSeries.X PowerSeries.X t = 1 := by sorry
-- QuotientMellinTests.trivial_character_excluded
example : evalOpen (PowerSeries.X : PowerSeries K) 0 = 0 := by sorry
/-- Agreement of Mellin clearing expressions. If F,D,F′,D′ are open-disc series with FD′=F′D, then
Q_{F,D}(t)=Q_{F′,D′}(t) at every ||t||<1 for which both denominator values are nonzero. Applied to
the algebraic clearing compatibility imported from PMIA L3 this proves independence on chart
overlaps; it does not construct a total-fraction-ring character homomorphism. (Source: RJW, Remark
3.47, pp. 25–26; §5.3, pp. 34–35 (formula immediately before Remark 5.22).) -/
theorem quotientMellin_independent (F D F' D' : PowerSeries K)
    (hF : OnOpenDisc F) (hD : OnOpenDisc D) (hF' : OnOpenDisc F') (hD' : OnOpenDisc D')
    (h : F*D'=F'*D) (t : K) (ht : ‖t‖ < 1)
    (hDt : evalOpen D t ≠ 0) (hD't : evalOpen D' t ≠ 0) :
    quotientMellin F D t = quotientMellin F' D' t := by sorry
end Mellin

end

/-!
Coefficient and cochain signatures of the analytic layers.
Global LA strong-dual and analytic sheaf signatures remain explicitly omitted
below. All maps here use their actual native carrier and hypotheses.
-/
/-! ## Layer 0 (§0.3), Layer 1 (§1.3), Layer 2 (§2.2) and Layer 4 (§4.13–§4.15): charts, transposes,
rectangular growth, coefficient actions and Banach complexes -/

namespace AnalyticDistributions
open scoped ZeroAtInfty
open CategoryTheory

section Coefficients
variable {K : Type*} [NontriviallyNormedField K]
variable {I : Type*} [TopologicalSpace I] [DiscreteTopology I]

/-- Analytic functions on finitely many polydiscs. For a finite clopen chart set S and coordinates
z∈Z_p^d, the radius-h analytic stage is the finite product over S of restricted power series in
normalized coordinates (z−a)/p^h. Coefficients tend to zero outside finite subsets of N^d; the
norm is the maximum coefficient norm. Its coefficient model is native c₀(S×N^d,K). The chart
realization, rather than a second power-series carrier, identifies this with actual functions.
(Source: Schneider–Teitelbaum, §1, Lemmas 1.1–1.2 and Proposition 1.4, printed pp. 3–6.) -/
abbrev analyticStage (I : Type*) [TopologicalSpace I] (K : Type*)
    [NormedAddCommGroup K] := C₀(I,K)
/-- Equality is coefficientwise equality. Part of the API of the target *Analytic functions on
finitely many polydiscs*. -/
theorem analyticStage_ext (f g : analyticStage I K) (h : ∀ i, f i = g i) : f = g := by sorry
/-- A monomial on one chart has its specified single coefficient. Part of the API of the target
*Analytic functions on finitely many polydiscs*. -/
theorem analyticStage_single [DecidableEq I] (i j : I) (a : K) :
    NonarchimedeanFredholm.c0Single i a j = if j=i then a else 0 := by sorry
-- AnalyticDistributionTests.analyticStage_point
example : Nonempty (analyticStage PUnit K ≃ₗᵢ[K] K) := by sorry
-- AnalyticDistributionTests.analyticStage_empty
example : Subsingleton (analyticStage (Fin 0) K) := by sorry
-- AnalyticDistributionTests.analyticStage_geometric_excluded
example : ¬ ∃ f : analyticStage ℕ K, ∀ n, f n = 1 := by sorry

variable {A : Type*} [NormedCommRing A]
/-- The native c₀ coefficient module over A. Part of the API of the target *Affinoid-valued analytic
stages*. -/
abbrev affinoidAnalyticStage (I : Type*) [TopologicalSpace I] (A : Type*)
    [NormedAddCommGroup A] := C₀(I,A)
/-- Coefficient equality determines a section. Part of the API of the target *Affinoid-valued analytic
stages*. -/
theorem affinoidAnalyticStage_ext (f g : affinoidAnalyticStage I A)
    (h : ∀ i, f i = g i) : f = g := by sorry
/-- The chosen lattice is exactly the norm≤1 coefficient families. Part of the API of the target
*Affinoid-valued analytic stages*. -/
theorem affinoidAnalyticStage_integral (f : affinoidAnalyticStage I A) :
    ‖f‖ ≤ 1 ↔ ∀ i, ‖f i‖ ≤ 1 := by sorry
-- AnalyticDistributionTests.affinoidStage_scalar
example : affinoidAnalyticStage I K = analyticStage I K := by sorry
-- AnalyticDistributionTests.affinoidStage_point
example [NormedAlgebra K A] : Nonempty (affinoidAnalyticStage PUnit A ≃ₗᵢ[K] A) := by sorry
-- AnalyticDistributionTests.affinoidStage_empty
example : Subsingleton (affinoidAnalyticStage (Fin 0) A) := by sorry

/-- The continuous A-linear dual of the analytic coefficient stage. Part of the API of the target
*Affinoid-valued Banach-stage distributions*. -/
abbrev affinoidDistributionStage (I : Type*) [TopologicalSpace I] (A : Type*)
    [NormedCommRing A] := affinoidAnalyticStage I A →L[A] A
/-- A stage distribution evaluates an analytic function in A. Part of the API of the target
*Affinoid-valued Banach-stage distributions*. -/
theorem affinoidDistributionStage_apply (μ : affinoidDistributionStage I A)
    (a : A) (f : affinoidAnalyticStage I A) : μ (a • f) = a * μ f := by sorry
/-- Equality on every basis coefficient determines the functional. Part of the API of the target
*Affinoid-valued Banach-stage distributions*. -/
theorem affinoidDistributionStage_ext [CompleteSpace A] [DecidableEq I]
    (μ ν : affinoidDistributionStage I A)
    (h : ∀ i, μ (NonarchimedeanFredholm.c0Single i (1:A)) =
      ν (NonarchimedeanFredholm.c0Single i (1:A))) : μ = ν := by sorry
-- AnalyticDistributionTests.distributionStage_point
example [NormedAlgebra K A] : Nonempty (affinoidDistributionStage PUnit A ≃ₗ[K] A) := by sorry
-- AnalyticDistributionTests.distributionStage_zero
example [NormedAlgebra K A] :
    ‖(0 : affinoidDistributionStage I A).restrictScalars K‖ = 0 := by sorry
-- AnalyticDistributionTests.distributionStage_bounded_not_c0
example [CompleteSpace K] : ∃ μ : affinoidDistributionStage ℕ K,
    (∀ n, μ (NonarchimedeanFredholm.c0Single n (1:K)) = 1) ∧
    ¬ ∃ f : C₀(ℕ,K), ∀ n, f n = 1 := by sorry

variable [NormedAlgebra K A]
/-- The stage-dual norm unit ball. Part of the API of the target *Integral distribution lattices*. -/
def familyIntegralLattice : Set (affinoidDistributionStage I A) :=
    {μ | ‖μ.restrictScalars K‖ ≤ 1}
/-- Membership is the norm bound ≤1. Part of the API of the target *Integral distribution lattices*. -/
theorem familyIntegralLattice_mem (μ : affinoidDistributionStage I A) :
    μ ∈ familyIntegralLattice (K:=K) ↔ ‖μ.restrictScalars K‖ ≤ 1 := by sorry
/-- A₀ scalar multiplication preserves the lattice. Part of the API of the target *Integral
distribution lattices*. -/
theorem familyIntegralLattice_smul (a : A) (ha : ‖a‖ ≤ 1)
    (μ : affinoidDistributionStage I A) (hμ : μ ∈ familyIntegralLattice (K:=K)) :
    a • μ ∈ familyIntegralLattice (K:=K) := by sorry
-- AnalyticDistributionTests.integralLattice_zero
example : (0 : affinoidDistributionStage I A) ∈ familyIntegralLattice (K:=K) := by sorry
-- AnalyticDistributionTests.integralLattice_point
example [NormOneClass A] (a : A) (μ : affinoidDistributionStage PUnit A)
    (hμ : ∀ f, μ f = a * f PUnit.unit) :
    μ ∈ familyIntegralLattice (K:=K) ↔ ‖a‖ ≤ 1 := by sorry
-- AnalyticDistributionTests.integralLattice_boundary
example (a : K) (ha : 1 < ‖a‖) (μ : affinoidDistributionStage PUnit K)
    (hμ : ∀ f, μ f = a * f PUnit.unit) :
    μ ∉ familyIntegralLattice (K:=K) := by sorry
end Coefficients

section Transposes
variable {K E F H : Type*} [NontriviallyNormedField K]
    [NormedAddCommGroup E] [NormedSpace K E]
    [NormedAddCommGroup F] [NormedSpace K F]
    [NormedAddCommGroup H] [NormedSpace K H]
/-- Pushforward of analytic distributions. For an analytic map f:X→Y of compact p-adic manifolds,
define f_*μ by (f_*μ)(g)=μ(g∘f). This is a continuous K-linear map D(X,K)→D(Y,K) for the strong
dual topologies. (Source: Colmez, §II.4, printed pp. 34–37.) -/
def distributionPushforward (P : F →L[K] E) (μ : E →L[K] K) : F →L[K] K := μ.comp P
/-- Evaluation is μ applied to pullback. Part of the API of the target *Pushforward of analytic
distributions*. -/
theorem distributionPushforward_apply (P : F →L[K] E) (μ : E →L[K] K) (f : F) :
    distributionPushforward P μ f = μ (P f) := by sorry
/-- (g∘f)_*=g_*∘f_*. Part of the API of the target *Pushforward of analytic distributions*. -/
theorem distributionPushforward_comp (P : F →L[K] E) (Q : H →L[K] F) (μ : E →L[K] K) :
    distributionPushforward (P.comp Q) μ =
      distributionPushforward Q (distributionPushforward P μ) := by sorry
-- AnalyticDistributionTests.pushforward_identity
example (μ : E →L[K] K) : distributionPushforward (ContinuousLinearMap.id K E) μ = μ := by sorry
-- AnalyticDistributionTests.pushforward_zero
example (P : F →L[K] E) : distributionPushforward P (0 : E →L[K] K) = 0 := by sorry
-- AnalyticDistributionTests.pushforward_constant
example (P : F →L[K] E) (ev : F →L[K] K) (e : E)
    (hP : ∀ f, P f = ev f • e) (μ : E →L[K] K) :
    distributionPushforward P μ = μ e • ev := by sorry
end Transposes

section Multipliers
variable {K R : Type*} [NontriviallyNormedField K] [NormedCommRing R] [NormedAlgebra K R]
-- Exact bounded-algebra transpose. The global LF analytic multiplication is omitted.
/-- Transpose multiplication on analytic test functions. Part of the API of the target *Multiplication
by an analytic function*. -/
def distributionMultiply (g : R) (μ : R →L[K] K) : R →L[K] K :=
    μ.comp (ContinuousLinearMap.mul K R g)
/-- (gμ)(f)=μ(gf). Part of the API of the target *Multiplication by an analytic function*. -/
theorem distributionMultiply_apply (g f : R) (μ : R →L[K] K) :
    distributionMultiply g μ f = μ (g*f) := by sorry
/-- Successive multiplications multiply their analytic factors. Part of the API of the target
*Multiplication by an analytic function*. -/
theorem distributionMultiply_assoc (g h : R) (μ : R →L[K] K) :
    distributionMultiply (g*h) μ = distributionMultiply g (distributionMultiply h μ) := by sorry
-- AnalyticDistributionTests.multiply_one
example (μ : R →L[K] K) : distributionMultiply 1 μ = μ := by sorry
-- AnalyticDistributionTests.multiply_atom
example (ev : R →L[K] K) (hm : ∀ g f, ev (g*f) = ev g * ev f) (g : R) :
    distributionMultiply g ev = ev g • ev := by sorry
-- AnalyticDistributionTests.multiply_bounded
-- Native bounded-measure compatibility on a finite space is the exact common domain.
example {G : Type*} [Fintype G] [DecidableEq G] (g f : G → K) (μ : (G → K) →L[K] K) :
    distributionMultiply g μ f = μ (fun x => g x * f x) := by sorry
end Multipliers

section FiniteConvolution
variable {K G : Type*} [NontriviallyNormedField K] [Group G] [Fintype G] [DecidableEq G]
-- Finite-group specialization; the full compact analytic tensor signature is omitted.
def pointDistribution (a : G) : (G → K) →L[K] K := by sorry
theorem pointDistribution_apply (a : G) (f : G → K) : pointDistribution a f = f a := by sorry
/-- Push forward the tensor distribution along group multiplication. Part of the API of the target
*Convolution by iterated analytic evaluation*. -/
def distributionConvolution (mu1 μ : (G → K) →L[K] K) : (G → K) →L[K] K := by sorry
/-- Its value is the specified iterated integral. Part of the API of the target *Convolution by
iterated analytic evaluation*. -/
theorem distributionConvolution_apply (mu1 μ : (G → K) →L[K] K) (f : G → K) :
    distributionConvolution mu1 μ f = μ (fun y => mu1 (fun x => f (x*y))) := by sorry
/-- Convolution is associative. Part of the API of the target *Convolution by iterated analytic
evaluation*. -/
theorem distributionConvolution_assoc (mu1 μ ν : (G → K) →L[K] K) :
    distributionConvolution (distributionConvolution mu1 μ) ν =
      distributionConvolution mu1 (distributionConvolution μ ν) := by sorry
-- AnalyticDistributionTests.convolution_atoms
example (a b : G) : distributionConvolution (pointDistribution (K:=K) a) (pointDistribution b) =
    pointDistribution (a*b) := by sorry
-- AnalyticDistributionTests.convolution_unit
example (μ : (G → K) →L[K] K) : distributionConvolution (pointDistribution 1) μ = μ := by sorry
-- AnalyticDistributionTests.convolution_bounded
example (w z f : G → K) (mu1 μ : (G → K) →L[K] K)
    (hmu1 : ∀ f, mu1 f = ∑ x, w x * f x) (hμ : ∀ f, μ f = ∑ y, z y * f y) :
    distributionConvolution mu1 μ f = ∑ y, ∑ x, z y * w x * f (x*y) := by sorry
end FiniteConvolution

section Rectangles
variable {p : ℕ} [Fact p.Prime]
variable {K : Type*} [NontriviallyNormedField K]
variable {g : ℕ}
def padicBox (a : Fin g → ℤ_[p]) (m : Fin g → ℕ) : Set (Fin g → ℤ_[p]) :=
    {x | ∀ i, x i - a i ∈ Ideal.span ({(p : ℤ_[p]) ^ m i} : Set ℤ_[p])}
theorem padicBox_isClopen (a : Fin g → ℤ_[p]) (m : Fin g → ℕ) : IsClopen (padicBox a m) := by sorry
def boxIndicator (a : Fin g → ℤ_[p]) (m : Fin g → ℕ) : LocallyConstant (Fin g → ℤ_[p]) K :=
    LocallyConstant.charFn K (padicBox_isClopen a m)
/-- The displayed uniform bound on all rectangular cosets. Part of the API of the target *Rectangular
growth for a locally constant functional*. -/
def RectangularGrowth (μ : LocallyConstant (Fin g → ℤ_[p]) K →ₗ[K] K)
    (r : Fin g → ℝ) : Prop :=
    ∃ C : ℝ, 0 ≤ C ∧ ∀ a m, ‖μ (boxIndicator a m)‖ ≤ C * (p : ℝ) ^ (∑ i, r i * (m i : ℝ))
/-- Increasing each component r_i preserves the bound. Part of the API of the target *Rectangular
growth for a locally constant functional*. -/
theorem rectangularGrowth_mono (μ : LocallyConstant (Fin g → ℤ_[p]) K →ₗ[K] K)
    (r s : Fin g → ℝ) (h : ∀ i, r i ≤ s i) (hμ : RectangularGrowth μ r) :
    RectangularGrowth μ s := by sorry
/-- A sum of two bounded-growth functionals has the same growth order with a larger constant. Part of
the API of the target *Rectangular growth for a locally constant functional*. -/
theorem rectangularGrowth_add (μ ν : LocallyConstant (Fin g → ℤ_[p]) K →ₗ[K] K)
    (r : Fin g → ℝ) (hμ : RectangularGrowth μ r) (hν : RectangularGrowth ν r) :
    RectangularGrowth (μ+ν) r := by sorry
-- AnalyticDistributionTests.rectangularGrowth_dirac
example (a : Fin g → ℤ_[p]) (r : Fin g → ℝ) (hr : ∀ i, 0 ≤ r i) :
    RectangularGrowth (LocallyConstant.evalₗ K a) r := by sorry
-- AnalyticDistributionTests.rectangularGrowth_zero
example (r : Fin g → ℝ) :
    RectangularGrowth (0 : LocallyConstant (Fin g → ℤ_[p]) K →ₗ[K] K) r := by sorry
-- AnalyticDistributionTests.rectangularGrowth_refinement
example (μ : LocallyConstant (Fin g → ℤ_[p]) K →ₗ[K] K)
    (a : Fin g → ℤ_[p]) (m : Fin g → ℕ) (i : Fin g) :
    μ (boxIndicator a m) = ∑ j : Fin p,
      μ (boxIndicator (Function.update a i (a i + (j.val : ℤ_[p]) * (p : ℤ_[p]) ^ m i))
        (Function.update m i (m i + 1))) := by sorry
end Rectangles

section CoefficientActions
variable {A E : Type*} [NormedCommRing A] [NormedAddCommGroup E] [Module A E]
-- The supplied pullback and multiplier are the exact fixed-stage maps.
/-- Compose a bounded analytic pullback with a bounded analytic multiplier. Part of the API of the
target *Universal-character coefficient action*. -/
def coefficientAction (P M : E →L[A] E) (μ : E →L[A] A) : E →L[A] A := μ.comp (M.comp P)
/-- (U_σμ)(f)=μ(j_σ(f∘φ_σ)). Part of the API of the target *Universal-character coefficient action*. -/
theorem coefficientAction_apply (P M : E →L[A] E) (μ : E →L[A] A) (f : E) :
    coefficientAction P M μ f = μ (M (P f)) := by sorry
/-- U_σU_τ=U_(στ) from R_τR_σ=R_(στ). Part of the API of the target *Universal-character coefficient
action*. -/
theorem coefficientAction_comp (Pσ Mσ Pτ Mτ Pστ Mστ : E →L[A] E)
    (hcocycle : (Mτ.comp Pτ).comp (Mσ.comp Pσ) = Mστ.comp Pστ) (μ : E →L[A] A) :
    coefficientAction Pσ Mσ (coefficientAction Pτ Mτ μ) = coefficientAction Pστ Mστ μ := by sorry
-- AnalyticDistributionTests.coefficientAction_identity
example (μ : E →L[A] A) :
    coefficientAction (ContinuousLinearMap.id A E) (ContinuousLinearMap.id A E) μ = μ := by sorry
-- AnalyticDistributionTests.coefficientAction_dirac
example (evx evφ : E →L[A] A) (j : A) (P M : E →L[A] E)
    (h : ∀ f, evx (M (P f)) = j * evφ f) : coefficientAction P M evx = j • evφ := by sorry
-- AnalyticDistributionTests.coefficientAction_specialization
-- Exact evaluation compatibility; scalar-tensor specialization is explicitly omitted.
example {B : Type*} [NormedCommRing B] (η : A →+* B) (P M : E →L[A] E)
    (μ : E →L[A] A) (f : E) : η (coefficientAction P M μ f) = η (μ (M (P f))) := by sorry
end CoefficientActions

section Complexes
variable {K A : Type*} [NontriviallyNormedField K] [NormedCommRing A]
    [NormedAlgebra K A]
variable (C : CochainComplex (ModuleCat A) ℤ) (E : ℤ → Type*)
variable [∀ i, NormedAddCommGroup (E i)] [∀ i, Module A (E i)]
variable (e : ∀ i, C.X i ≃ₗ[A] E i)
-- The norms live on explicitly identified native modules. This avoids changing
-- the additive group instance already bundled in ModuleCat.
/-- Degreewise Banach/(Pr), continuous differentials and finite support. Part of the API of the target
*Bounded complexes of projective Banach modules*. -/
def IsProjectiveBanachComplex : Prop :=
    (∀ i, IsUltrametricDist (E i)) ∧
    (∀ i (k : K) (x : E i), ‖(algebraMap K A k) • x‖ = ‖k‖ * ‖x‖) ∧
    (∀ i, ∃ c : ℝ, 0 ≤ c ∧ ∀ (a : A) (x : E i), ‖a • x‖ ≤ c * ‖a‖ * ‖x‖) ∧
    (∀ i, CompleteSpace (E i)) ∧ (∀ i, ContinuousSMul A (E i)) ∧
    (∀ i j, Continuous (fun x : E i => e j (C.d i j ((e i).symm x)))) ∧
    (∃ a b : ℤ, ∀ i : ℤ, i < a ∨ b < i → Subsingleton (E i)) ∧
    ∀ i, NonarchimedeanFredholm.HasPr A (E i)
/-- The zero complex satisfies these conditions. Part of the API of the target *Bounded complexes of
projective Banach modules*. -/
theorem projectiveBanachComplex_zero (hz : ∀ i, Subsingleton (E i)) :
    IsProjectiveBanachComplex (K := K) C E e := by sorry
/-- Degree shifts transport the norms, differentials and finite support. Part of the API of the target
*Bounded complexes of projective Banach modules*. -/
theorem projectiveBanachComplex_shift (n : ℤ)
    (D : CochainComplex (ModuleCat A) ℤ) (e' : ∀ i, D.X i ≃ₗ[A] E (i+n))
    (ε : A) (hd : ∀ i j (x : E (i+n)),
      e' j (D.d i j ((e' i).symm x)) = ε • e (j+n) (C.d (i+n) (j+n) ((e (i+n)).symm x)))
    (hC : IsProjectiveBanachComplex (K := K) C E e) :
    IsProjectiveBanachComplex (K := K) D (fun i => E (i+n)) e' := by sorry
-- AnalyticDistributionTests.banachComplex_one_degree
example (n : ℤ) [CompleteSpace (E n)] [ContinuousSMul A (E n)]
    (hu : IsUltrametricDist (E n))
    (hk : ∀ (k : K) (x : E n), ‖(algebraMap K A k) • x‖ = ‖k‖ * ‖x‖)
    (ha : ∃ c : ℝ, 0 ≤ c ∧ ∀ (a : A) (x : E n), ‖a • x‖ ≤ c * ‖a‖ * ‖x‖)
    (hother : ∀ i, i ≠ n → Subsingleton (E i))
    (hp : NonarchimedeanFredholm.HasPr A (E n)) :
    IsProjectiveBanachComplex (K := K) C E e := by sorry
-- AnalyticDistributionTests.banachComplex_infinite_rank
example [CompleteSpace A] [Nontrivial A] [IsNoetherianRing A]
    (hu : IsUltrametricDist (E 0))
    (hk : ∀ (k : K) (x : E 0), ‖(algebraMap K A k) • x‖ = ‖k‖ * ‖x‖)
    (ha : ∃ c : ℝ, 0 ≤ c ∧ ∀ (a : A) (x : E 0), ‖a • x‖ ≤ c * ‖a‖ * ‖x‖)
    (hother : ∀ i, i ≠ 0 → Subsingleton (E i)) (e0 : E 0 ≃L[A] C₀(ℕ,A)) :
    IsProjectiveBanachComplex (K := K) C E e ∧ ¬ Module.Finite A (E 0) := by sorry
-- AnalyticDistributionTests.banachComplex_differential
example [CompleteSpace A]
    (hu : ∀ i : ℤ, i = 0 ∨ i = 1 → IsUltrametricDist (E i))
    (hk : ∀ i : ℤ, i = 0 ∨ i = 1 → ∀ (k : K) (x : E i),
      ‖(algebraMap K A k) • x‖ = ‖k‖ * ‖x‖)
    (ha : ∀ i : ℤ, i = 0 ∨ i = 1 → ∃ c : ℝ, 0 ≤ c ∧
      ∀ (a : A) (x : E i), ‖a • x‖ ≤ c * ‖a‖ * ‖x‖)
    (hother : ∀ i, i ≠ 0 ∧ i ≠ 1 → Subsingleton (E i))
    (a0 : E 0 ≃L[A] A) (a1 : E 1 ≃L[A] A)
    (hd : ∀ x : E 0, a1 (e 1 (C.d 0 1 ((e 0).symm x))) = a0 x) :
    IsProjectiveBanachComplex (K := K) C E e ∧
      Function.Bijective (fun x : E 0 => e 1 (C.d 0 1 ((e 0).symm x))) := by sorry
def degreeCLM (U : C ⟶ C) (i : ℤ)
    (hc : Continuous (fun x : E i => e i (U.f i ((e i).symm x)))) : E i →L[A] E i :=
    ⟨(e i).toLinearMap.comp ((U.f i).hom.comp (e i).symm.toLinearMap), hc⟩
/-- Every continuous degree map has finite A-image approximants. Part of the API of the target
*Degreewise completely continuous representatives*. -/
def DegreewiseCompletelyContinuous (U : C ⟶ C) : Prop :=
    ∀ i, ∃ hc : Continuous (fun x : E i => e i (U.f i ((e i).symm x))),
      Huber.IsCompletelyContinuous (degreeCLM C E e U i hc)
/-- The zero cochain endomorphism is compact in every degree. Part of the API of the target
*Degreewise completely continuous representatives*. -/
theorem degreewiseCompletelyContinuous_zero : DegreewiseCompletelyContinuous C E e 0 := by sorry
/-- Sums of two such representatives have the same property. Part of the API of the target *Degreewise
completely continuous representatives*. -/
theorem degreewiseCompletelyContinuous_add (U V : C ⟶ C)
    (hU : DegreewiseCompletelyContinuous C E e U) (hV : DegreewiseCompletelyContinuous C E e V) :
    DegreewiseCompletelyContinuous C E e (U+V) := by sorry
-- AnalyticDistributionTests.complexCompact_one_degree
example (n : ℤ) (hother : ∀ i, i ≠ n → Subsingleton (E i)) (U : C ⟶ C) :
    DegreewiseCompletelyContinuous C E e U ↔
      ∃ hc : Continuous (fun x : E n => e n (U.f n ((e n).symm x))),
        Huber.IsCompletelyContinuous (degreeCLM C E e U n hc) := by sorry
-- AnalyticDistributionTests.complexCompact_finite_free
example (U : C ⟶ C) [∀ i, Module.Finite A (E i)]
    (hc : ∀ i, Continuous (fun x : E i => e i (U.f i ((e i).symm x)))) :
    DegreewiseCompletelyContinuous C E e U := by sorry
-- Native Homotopy with continuity of all transported components.
/-- There exists a continuous homotopic degreewise compact representative. Part of the API of the
target *Compactness of a homotopy endomorphism*. -/
def CompactHomotopyEndomorphism (U : C ⟶ C) : Prop :=
    ∃ V : C ⟶ C, DegreewiseCompletelyContinuous C E e V ∧
      ∃ H : Homotopy U V, ∀ i j,
        Continuous (fun x : E i => e j (H.hom i j ((e i).symm x)))
/-- A degreewise compact representative determines a compact class. Part of the API of the target
*Compactness of a homotopy endomorphism*. -/
theorem compactHomotopyEndomorphism_of_rep (U : C ⟶ C)
    (hU : DegreewiseCompletelyContinuous C E e U) : CompactHomotopyEndomorphism C E e U := by sorry
/-- Continuous homotopic endomorphisms have the same compactness property. Part of the API of the
target *Compactness of a homotopy endomorphism*. -/
theorem compactHomotopyEndomorphism_homotopy (U V : C ⟶ C) (H : Homotopy U V)
    (hc : ∀ i j, Continuous (fun x : E i => e j (H.hom i j ((e i).symm x)))) :
    CompactHomotopyEndomorphism C E e U ↔ CompactHomotopyEndomorphism C E e V := by sorry
-- AnalyticDistributionTests.homotopyCompact_zero
example : CompactHomotopyEndomorphism C E e 0 := by sorry
-- AnalyticDistributionTests.homotopyCompact_one_degree
example (n : ℤ) (hother : ∀ i, i ≠ n → Subsingleton (E i)) (U : C ⟶ C) :
    CompactHomotopyEndomorphism C E e U ↔ DegreewiseCompletelyContinuous C E e U := by sorry
-- AnalyticDistributionTests.homotopyCompact_contractible
example (H : Homotopy (𝟙 C) 0)
    (hc : ∀ i j, Continuous (fun x : E i => e j (H.hom i j ((e i).symm x)))) :
    CompactHomotopyEndomorphism C E e (𝟙 C) := by sorry
end Complexes

section CharacteristicProducts
variable {K A : Type*} [NontriviallyNormedField K] [CompleteSpace K]
    [NormedCommRing A] [NormOneClass A] [Nontrivial A] [NormedAlgebra K A]
    [CompleteSpace A] [IsNoetherianRing A]
variable {ι : Type*} [Fintype ι]
variable (E : ι → Type*) [∀ i, NormedAddCommGroup (E i)] [∀ i, NormedSpace K (E i)]
    [∀ i, Module A (E i)] [∀ i, IsScalarTower K A (E i)]
    [∀ i, ContinuousSMul A (E i)] [∀ i, CompleteSpace (E i)]
-- Exact finite-support degree product. Cochain data is supplied by the preceding predicates.
/-- Finite product of the chosen degree determinants. Part of the API of the target *Characteristic
series of a compact complex representative*. -/
def complexFredholmProduct (U : ∀ i, E i →L[A] E i)
    (hp : ∀ i, NonarchimedeanFredholm.HasPr A (E i))
    (hc : ∀ i, Huber.IsCompletelyContinuous (U i)) : PowerSeries A :=
    ∏ i, NonarchimedeanFredholm.fredholmSeriesPr (U i) (hp i) (hc i)
/-- Its constant coefficient is 1. Part of the API of the target *Characteristic series of a compact
complex representative*. -/
theorem complexFredholmProduct_coeff_zero (U : ∀ i, E i →L[A] E i)
    (hp : ∀ i, NonarchimedeanFredholm.HasPr A (E i))
    (hc : ∀ i, Huber.IsCompletelyContinuous (U i)) :
    (complexFredholmProduct E U hp hc).coeff 0 = 1 := by sorry
-- AnalyticDistributionTests.complexProduct_single
example (i : ι) (U : E i →L[A] E i)
    (hp : NonarchimedeanFredholm.HasPr A (E i))
    (hc : Huber.IsCompletelyContinuous U) :
    complexFredholmProduct (fun _ : PUnit => E i) (fun _ => U) (fun _ => hp) (fun _ => hc) =
      NonarchimedeanFredholm.fredholmSeriesPr U hp hc := by sorry
/-- Adding zero degrees leaves the product unchanged. Part of the API of the target *Characteristic
series of a compact complex representative*. -/
theorem complexFredholmProduct_enlarge [DecidableEq ι] (j : ι)
    (U : ∀ i, E i →L[A] E i)
    (hp : ∀ i, NonarchimedeanFredholm.HasPr A (E i))
    (hc : ∀ i, Huber.IsCompletelyContinuous (U i)) (hj : U j = 0) :
    complexFredholmProduct E U hp hc = ∏ i ∈ Finset.univ.erase j,
      NonarchimedeanFredholm.fredholmSeriesPr (U i) (hp i) (hc i) := by sorry
-- AnalyticDistributionTests.complexProduct_empty
example : complexFredholmProduct (fun _ : Fin 0 => A) (fun _ => 0)
    (fun i => Fin.elim0 i) (fun i => Fin.elim0 i) = (1 : PowerSeries A) := by sorry
-- AnalyticDistributionTests.complexProduct_acyclic
-- These are the two degree operators on [A --1→ A]; the product is nonalternating.
example (a : A) (hp : NonarchimedeanFredholm.HasPr A A)
    (hc : Huber.IsCompletelyContinuous (a • ContinuousLinearMap.id A A)) :
    complexFredholmProduct (fun _ : Fin 2 => A)
      (fun _ => a • ContinuousLinearMap.id A A) (fun _ => hp) (fun _ => hc) =
      (1-PowerSeries.C a * PowerSeries.X)^2 := by sorry
end CharacteristicProducts
section StageFactorizations
variable {A : Type*} [NormedCommRing A]
variable (V : ℕ → Type*) [∀ n, NormedAddCommGroup (V n)] [∀ n, Module A (V n)]
/-- Compact transitions t_n and bounded a_n with U_n=t_na_n and U_{n+1}=a_nt_n. Part of the API of the
target *Compact factorization on Fréchet presentations*. -/
def CompactStageFactorization (t : ∀ n, V (n+1) →L[A] V n) (U : ∀ n, V n →L[A] V n) : Prop :=
    (∀ n, Huber.IsCompletelyContinuous (t n)) ∧
      ∃ a : ∀ n, V n →L[A] V (n+1), ∀ n,
        (t n).comp (a n) = U n ∧ (a n).comp (t n) = U (n+1)
/-- Compact transitions with zero stage operators admit a_n=0. Part of the API of the target *Compact
factorization on Fréchet presentations*. -/
theorem compactStageFactorization_zero (t : ∀ n, V (n+1) →L[A] V n)
    (ht : ∀ n, Huber.IsCompletelyContinuous (t n)) :
    CompactStageFactorization V t (fun _ => 0) := by sorry
/-- The factorization implies U_n t_n=t_n U_{n+1}. Part of the API of the target *Compact
factorization on Fréchet presentations*. -/
theorem compactStageFactorization_compatible (t : ∀ n, V (n+1) →L[A] V n)
    (U : ∀ n, V n →L[A] V n) (h : CompactStageFactorization V t U) (n : ℕ) :
    (U n).comp (t n) = (t n).comp (U (n+1)) := by sorry
-- AnalyticDistributionTests.frechetFactor_zero
example (t : ∀ n, V (n+1) →L[A] V n)
    (ht : ∀ n, Huber.IsCompletelyContinuous (t n)) :
    CompactStageFactorization V t (fun _ => 0) := by sorry
-- AnalyticDistributionTests.frechetFactor_finite
example (a : A) : CompactStageFactorization (fun _ : ℕ => A)
    (fun _ => ContinuousLinearMap.id A A) (fun _ => a • ContinuousLinearMap.id A A) := by sorry
end StageFactorizations
section InfiniteIdentityTests
variable {K : Type*} [NontriviallyNormedField K]
-- AnalyticDistributionTests.complexCompact_missing_degree
example : ¬ Huber.IsCompletelyContinuous (ContinuousLinearMap.id K C₀(ℕ,K)) := by sorry
-- AnalyticDistributionTests.frechetFactor_noncompact
example : ¬ CompactStageFactorization (fun _ : ℕ => C₀(ℕ,K))
    (fun _ => ContinuousLinearMap.id K C₀(ℕ,K)) (fun _ => 0) := by sorry
end InfiniteIdentityTests
end AnalyticDistributions

/-!
The README states the following targets, which cannot be typed at the pinned APIs because their
carriers (the compact-type inductive limit of the Banach stages and its strong dual, the completed
projective tensor product of Banach spaces, the left-heart extension groups, the analytic character
spaces and the derived finite-slope window) are not in the libraries: the disc and stage carriers
`discAnalytic`, `LAh`, `LA` and `Dist` with their Gauss valuations and the maps `measureToDist`;
the three-space theorems of §0.2 and the Hahn–Banach theorem; the chart pullback, chart independence,
completed analytic tensor and strong-duality statements of §0.3; the unbounded Amice transform and
its operator dictionary on the global carrier (§1.1, §1.4), the non-splitting theorems (§1.5);
`Cr`, `DistOrder`, the Amice–Vélu–Vishik theorem, the anisotropic function space and the rectangular
and multidegree extension theorems (§2.1–§2.2); the distribution Mellin transform
`distributionMellin` and its Fréchet isomorphism, coefficient extension and adic comparison (§3.3,
§3.4); the dual scalar-extension map, the Tate-algebra and formal-series compactness theorems, the
finite-slope perfect complex and its homotopy invariance, the Euler-characteristic local constancy
and the Fréchet finite-slope theorem (§4.13–§4.15).
-/

end

end TauCetiRoadmap.LocallyAnalyticDistributions
