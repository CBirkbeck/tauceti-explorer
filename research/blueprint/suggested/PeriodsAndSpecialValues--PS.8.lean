import Mathlib.RingTheory.PowerSeries.Exp
import Mathlib.RingTheory.PowerSeries.Substitution
import Mathlib.RingTheory.PowerSeries.Inverse
import Mathlib.RingTheory.PowerSeries.Derivative
import Mathlib.Analysis.SpecialFunctions.OrdinaryHypergeometric
import Mathlib.Analysis.SpecialFunctions.Gamma.Beta
import Mathlib.Analysis.Complex.PhragmenLindelof
import Mathlib.MeasureTheory.Integral.IntervalIntegral.Basic
import Mathlib.NumberTheory.LSeries.HurwitzZetaValues
import Mathlib.LinearAlgebra.Matrix.Determinant.Basic
import Mathlib.LinearAlgebra.Matrix.Notation
import Mathlib.LinearAlgebra.LinearIndependent.Defs
import Mathlib.RingTheory.Ideal.Quotient.Defs
import Mathlib.Algebra.Category.ModuleCat.Basic
import Mathlib.AlgebraicGeometry.Scheme
import TauCeti.LinearAlgebra.TensorCoalgebra.Coaugmented

/-!
This file is not the roadmap and is not exhaustive. The roadmap document
PeriodsAndSpecialValues--PS.8.md is definitive. These statements suggest Lean
forms so contributors and reviewers converge on names and signatures.
All proofs are placeholders; elaboration establishes no mathematical result.

PS.8 geometry and PS.9 motivic constructions depend on supplier APIs absent
from the pinned library. Their core data have typed signatures below. Missing
conditions are identified explicitly in comments, never represented by dummy
Prop fields. In particular the geometric cohomology, overconvergent-complex,
crystalline and mixed-Tate t-structure conditions must be supplied from the
reader before these forms become implementation declarations. G1–G4 are open;
G5 records the current IntegralLattices supplier's missing atlas catalogue link.
The geometric API names whose complete signatures need those objects are
listed at their target. Core numerical/formal/combinatorial examples are explicit;
tests that need absent supplier objects are identified at their target.
-/

noncomputable section
open scoped BigOperators TensorProduct
open CategoryTheory
namespace TauCeti.PeriodsAndSpecialValues

-- PS.8: polynomial data, including the corrected geometric rescaling.
def quartic_pencil (t : ℂ) (x : Fin 4 → ℂ) : ℂ :=
  (∑ i, x i ^ 4) - 4 * t * ∏ i, x i
lemma quartic_polynomial (t : ℂ) (x : Fin 4 → ℂ) :
    quartic_pencil t x = (∑ i, x i ^ 4) - 4 * t * ∏ i, x i := by sorry
-- quartic_group: the order-16 product-one μ₄ quotient; its relative action type
-- is supplied by the geometry owner. quartic_resolution is its resolved scheme.
def quartic_resolution : AlgebraicGeometry.Scheme := by sorry
-- quartic_group and the isomorphism-away-from-six-A₃-sections condition on
-- quartic_resolution have no substitute Prop field in this prototype.
-- quartic_resolution is also the projection API named in the packet.
-- quartic_fermat_test
example (x : Fin 4 → ℂ) : quartic_pencil 0 x = ∑ i, x i ^ 4 := by sorry
def quarticGradient (t : ℂ) (x : Fin 4 → ℂ) (i : Fin 4) : ℂ :=
  4*x i^3 - 4*t*∏ j ∈ Finset.univ.erase i, x j
-- quartic_singular_test: the polynomial and all four partials vanish at this
-- nonzero point; interpreting it as projective singularity uses the supplier.
example : quartic_pencil 1 (fun _ => 1) = 0 ∧
    ∀ i, quarticGradient 1 (fun _ => 1) i = 0 := by sorry
-- quartic_zero_test
example : (0 : ℂ) ^ 4 ≠ 1 := by sorry

def quartic_residue (t : ℂ) (z : Fin 3 → ℂ) : ℂ :=
  2 * Real.pi * Complex.I / (4 * z 2 ^ 3 - 4 * t * z 0 * z 1)
lemma quartic_residue_local (t : ℂ) (z : Fin 3 → ℂ) :
    quartic_residue t z = 2 * Real.pi * Complex.I /
      (4 * z 2 ^ 3 - 4 * t * z 0 * z 1) := by sorry
-- quartic_residue_invariant and quartic_residue_period: full signatures require
-- relative differential forms, the quotient pullback and tube integration.
-- The expression above is their local coefficient, only on the smooth chart.
-- quartic_residue_factor_test
example (z : Fin 3 → ℂ) :
    quartic_residue 0 z = 2 * Real.pi * Complex.I / (4 * z 2 ^ 3) := by sorry
-- quartic_residue_invariance_test: concrete product-one diagonal action on
-- this chart; the global descended-form condition is still the supplier's.
example (t : ℂ) (z : Fin 3 → ℂ) : quartic_residue t
    ![Complex.I*z 0, -Complex.I*z 1, z 2] = quartic_residue t z := by sorry
-- quartic_residue_chart_test
example : 4 * (0 : ℂ) ^ 3 - 4 * 0 * 0 * 0 = 0 := by sorry

-- quartic_picard_fuchs: geometric Gauss–Manin annihilation needs C5's objects.
-- The coefficient check for the corrected D_t ∘ multiplication by 1/t is exact.
def quarticPulledOperatorCoefficients (t : ℂ) : Fin 4 → ℂ :=
  ![-3 / (32 * t ^ 4), (6 / t ^ 3 - t) / 64,
    -3 * (t ^ 4 + 1) / (64 * t ^ 2), (1 - t ^ 4) / (64 * t)]
lemma quartic_pulled_constant_coefficient (t : ℂ) (ht : t ≠ 0) :
    quarticPulledOperatorCoefficients t 0 = -3 / (32 * t ^ 4) := by sorry

def quartic_lattice : Matrix (Fin 3) (Fin 3) ℤ :=
  !![4,0,0; 0,0,1; 0,1,0]
lemma quartic_gram : quartic_lattice.det = -4 := by sorry
def quartic_period_line (p : ℂ) : Fin 3 → ℂ := ![p,-1,2*p^2]
-- quartic_marking_transport: omitted integral local-system transport signature,
-- with its pairing and path-composition conditions, pending PS.0's interface.
-- Import current IntegralLattices 5H/6A for the K3 marking: its ambient lattice
-- is even unimodular of signature (3,19). Hartmann's generic Theorem 4.12 omits
-- ambient unimodularity (E3); the selected K3 application meets it.
-- quartic_gram_test
example : quartic_lattice 0 0 = 4 ∧ quartic_lattice 1 2 = 1 ∧
    quartic_lattice 1 1 = 0 ∧ quartic_lattice 2 2 = 0 := by sorry
-- quartic_isotropic_test
example (p : ℂ) : 4 * p ^ 2 + 2 * (-1) * (2 * p ^ 2) = 0 := by sorry
-- quartic_discriminant_test
example : quartic_lattice.det ≠ 1 ∧ quartic_lattice.det ≠ -1 := by sorry

def quarticMonodromy (i : Fin 5) : Matrix (Fin 3) (Fin 3) ℤ :=
  ![!![1,0,0;0,0,1;0,1,0], !![5,1,-3;-12,-2,9;4,1,-2],
    !![17,6,-6;-24,-8,9;24,9,-8], !![5,3,-1;-4,-2,1;12,9,-2],
    !![1,4,0;0,1,0;-16,-32,1]] i
-- Full quartic_monodromy theorem also identifies these with transport along
-- the five marked based loops; that local-system condition is omitted here.
theorem quartic_monodromy (i : Fin 5) :
    (quarticMonodromy i).transpose * quartic_lattice * quarticMonodromy i =
      quartic_lattice := by sorry
example : quarticMonodromy 4 * quarticMonodromy 3 * quarticMonodromy 2 *
    quarticMonodromy 1 * quarticMonodromy 0 = 1 := by sorry
example : (quarticMonodromy 4 - 1)^3 = 0 ∧
    (quarticMonodromy 4 - 1)^2 ≠ 0 := by sorry

def harmonic (n r : ℕ) : ℚ := ∑ j ∈ Finset.range n, 1 / ((j+1 : ℕ) : ℚ)^r
def quarticA (n : ℕ) : ℚ := (Nat.factorial (4*n) : ℚ) / (Nat.factorial n : ℚ)^4
def quarticG (n : ℕ) : ℚ := 4 * quarticA n * (harmonic (4*n) 1 - harmonic n 1)
def quarticH (n : ℕ) : ℚ := quarticA n *
  (16 * (harmonic (4*n) 1 - harmonic n 1)^2 -
   16 * harmonic (4*n) 2 + 4 * harmonic n 2)
def quartic_frobenius_series : Fin 3 → PowerSeries ℚ :=
  ![PowerSeries.mk quarticA, PowerSeries.mk quarticG, PowerSeries.mk quarticH]
lemma quartic_coefficient_recurrence (n : ℕ) (hn : 1 ≤ n) :
    (n : ℚ)^3 * quarticA n =
      4 * (4*(n : ℚ)-3) * (4*(n : ℚ)-2) * (4*(n : ℚ)-1) * quarticA (n-1) := by sorry
-- quartic_frobenius_analytic: conversion of these coefficient series to the
-- logarithmic basis on 0<|z|<1/256 awaits a shared analytic solution API.
lemma quartic_frobenius_initial :
    quarticA 0 = 1 ∧ quarticG 0 = 0 ∧ quarticH 0 = 0 := by sorry
-- quartic_coefficients_test
example : quarticA 1 = 24 ∧ quarticA 2 = 2520 ∧ quarticA 3 = 369600 := by sorry
-- quartic_log_coefficient_test
example : quarticG 1 = 104 ∧ quarticG 2 = 12276 := by sorry
-- quartic_empty_harmonic_test
example (r : ℕ) : harmonic 0 r = 0 ∧ quarticG 0 = 0 ∧ quarticH 0 = 0 := by sorry

-- quartic_symmetric_square: the full analytic theorem additionally identifies
-- the power-series sum on |256z|<1 with 2F1(1/8,3/8;1;256z)^2.
def quarticW0 (z : ℂ) : ℂ := ∑' n : ℕ, (quarticA n : ℂ) * z^n
theorem quartic_symmetric_square (z : ℂ) (hz : ‖256*z‖ < 1) :
    quarticW0 z = (ordinaryHypergeometric (𝕂 := ℂ) (𝔸 := ℂ) (1/8 : ℂ) (3/8) 1 (256*z))^2 := by sorry

def quartic_mirror_coordinate : PowerSeries ℚ := PowerSeries.X *
  (PowerSeries.exp ℚ).subst
    ((quartic_frobenius_series 1) * (quartic_frobenius_series 0)⁻¹)
lemma quartic_mirror_initial :
    quartic_mirror_coordinate.coeff 0 = 0 ∧ quartic_mirror_coordinate.coeff 1 = 1 := by sorry
def quarticInverse : PowerSeries ℚ :=
  quartic_mirror_coordinate.substInvOfIsUnit (by sorry)
lemma quartic_mirror_inverse :
    quartic_mirror_coordinate.subst quarticInverse = PowerSeries.X ∧
      quarticInverse.subst quartic_mirror_coordinate = PowerSeries.X := by sorry
-- quartic_mirror_period: the marked geometric period comparison, including
-- both monodromy normalizations, requires the PS.0/C5 local-system interface.
-- quartic_mirror_coefficients_test
example : quartic_mirror_coordinate.coeff 1 = 1 ∧
    quartic_mirror_coordinate.coeff 2 = 104 ∧ quartic_mirror_coordinate.coeff 3 = 15188 ∧
    quartic_mirror_coordinate.coeff 4 = 2585184 := by sorry
-- quartic_inverse_coefficients_test
example : quarticInverse.coeff 1 = 1 ∧ quarticInverse.coeff 2 = -104 ∧
    quarticInverse.coeff 3 = 6444 ∧ quarticInverse.coeff 4 = -311744 := by sorry
-- quartic_scaling_test
example (t : ℂ) : t⁻¹^4 = 256 * (4*t)⁻¹^4 := by sorry

def quarticModularPolynomial {R : Type*} [CommRing R] (x y : R) : R :=
  -x^2+x*y-432*x^2*y-207*x*y^2-62208*x^2*y^2-y^3+3456*x*y^3-2985984*x^2*y^3
-- quartic_modular_relation: the input x must be the classical normalized 1/j.
-- Its analytic Schwarzian condition is supplied by the modular-curve request.
-- quartic_modular_relation: omitted until the supplier's actual normalized
-- inverse-j object and Schwarzian equation are available. No assumption equal
-- to the conclusion is used as a substitute for that theorem.
theorem quartic_integrality (n : ℕ) :
    (∃ a : ℤ, quarticInverse.coeff n = a) ∧
    (∃ a : ℤ, quartic_mirror_coordinate.coeff n = a) := by sorry

-- Corrected local-continuation core; the branch/path identification is omitted.
def quarticU1 (t : ℂ) : ℂ :=
  Complex.Gamma (1/8) ^ 2 / Complex.Gamma (1/2) *
    ordinaryHypergeometric (𝕂 := ℂ) (𝔸 := ℂ) (1/8 : ℂ) (1/8) (1/2) (1-t^4)
def quarticU2 (t : ℂ) : ℂ :=
  Complex.Gamma (5/8) ^ 2 / Complex.Gamma (3/2) * (t^4-1)^(1/2 : ℂ) *
    ordinaryHypergeometric (𝕂 := ℂ) (𝔸 := ℂ) (5/8 : ℂ) (5/8) (3/2) (1-t^4)
-- The real-parameter local ratio at s=1 is pulled by s=-i*t to the marked
-- gamma_1 chart at t=i, with the real log fixed at t=i*sqrt(2). The based
-- gamma_4 chart at t=1 instead has reflection in the centred coordinate p-1.
-- These are distinct based continuations (E4), despite t^4=s^4.
theorem quartic_local_continuation (u v : ℂ) (huv : u+v ≠ 0) (huv' : u-v ≠ 0) :
    (Complex.I / (Real.sqrt 2 : ℂ) * (u-v)/(u+v)) =
      -1 / (2 * (Complex.I / (Real.sqrt 2 : ℂ) * (u+v)/(u-v))) := by sorry
example (p : ℂ) (hp : p ≠ 1) :
    1 - 1 / (2 * (p-1)) = (3-2*p)/(2-2*p) := by
  field_simp
  ring

-- Quintic data. The geometric family and invariant cohomology are the reader's
-- targets; core polynomial/companion data below do not claim an integral lattice.
def quintic_pencil {K : Type*} [CommRing K] (l : K) (x : Fin 5 → K) : K :=
  l * ∑ i, x i^5 + ∏ i, x i
lemma quintic_polynomial {K : Type*} [CommRing K] (l : K) (x : Fin 5 → K) :
    quintic_pencil l x = l * ∑ i, x i^5 + ∏ i, x i := by sorry
-- quintic_invariant_projector and quintic_smooth_locus: geometric signatures
-- require the finite group action and smooth cohomology; omitted, not weakened.
-- quintic_zero_test
example {K : Type*} [CommRing K] (x : Fin 5 → K) :
    quintic_pencil 0 x = ∏ i, x i := by sorry
-- quintic_rank_test: invariant/full H3 ranks 4/204 need the cohomology supplier.
-- quintic_group_test
example : 5^3 = (125 : ℕ) := by sorry

def quintic_formal_connection (l : ℚ) : Matrix (Fin 4) (Fin 4) ℚ :=
  let g := 5^5*l^5/(1+5^5*l^5)
  !![0,0,0,-24*g; 1,0,0,-50*g; 0,1,0,-35*g; 0,0,1,-10*g]
lemma quintic_connection_matrix (l : ℚ) :
    quintic_formal_connection l 0 3 = -24 * (5^5*l^5/(1+5^5*l^5)) := by sorry
lemma quintic_boundary_residue : quintic_formal_connection 0 =
    !![0,0,0,0; 1,0,0,0; 0,1,0,0; 0,0,1,0] := by sorry
def quintic_pairing {K : Type*} [CommRing K] (Y : K) : Matrix (Fin 4) (Fin 4) K :=
  !![0,0,0,Y;0,0,-Y,0;0,Y,0,0;-Y,0,0,0]
-- Full quintic_pairing API asserts flatness and Y=Y0/(1+5^5*l^5) in cohomology.
-- quintic_nilpotence_test
example : (quintic_formal_connection 0)^4 = 0 ∧
    (quintic_formal_connection 0)^3 ≠ 0 := by sorry
-- quintic_pairing_sign_test
example (Y : ℚ) : quintic_pairing Y 0 3 = Y ∧ quintic_pairing Y 1 2 = -Y := by sorry
-- quintic_denominator_test
example : 1 + 5^5 * (-1/5 : ℚ)^5 = 0 := by sorry

def dworkB (p n : ℕ) : ℚ :=
  PowerSeries.coeff n ((PowerSeries.exp ℚ).subst
    (PowerSeries.X + PowerSeries.C (1/(p : ℚ)) * PowerSeries.X^p))
structure DworkSums (p : ℕ) (K : Type*) [NormedField K] [Algebra ℚ K] where
  sigma0 : K
  sigma2 : K
  sum0 : HasSum (fun n : ℕ => algebraMap ℚ K (dworkB p (n+1) * Nat.factorial n)) sigma0
  sum2 : HasSum (fun n : ℕ => algebraMap ℚ K (dworkB p (n+3) * Nat.factorial (n+2) *
    ∑ i ∈ Finset.range (n+2), ∑ j ∈ Finset.range i,
      1 / ((i+1 : ℚ)*(j+1)))) sigma2
-- These fields are the actual summability statements, rather than placeholders.
def dwork_coefficients {K : Type*} [NormedField K] [Algebra ℚ K]
    (p : ℕ) (s : DworkSums p K) : K := s.sigma2 - s.sigma0^3/6
lemma dwork_coefficient_recurrence (p n : ℕ) (hp : 0 < p) (hn : 0 < n) :
    (n : ℚ) * dworkB p n = dworkB p (n-1) + if p ≤ n then dworkB p (n-p) else 0 := by sorry
lemma dwork_delta {K : Type*} [NormedField K] [Algebra ℚ K] (p : ℕ) (s : DworkSums p K) :
    dwork_coefficients p s = s.sigma2-s.sigma0^3/6 := by sorry
-- dwork_monomial_reduction: exact cohomological pairing/class signature awaits
-- the twisted-complex comparison. Its full convolution is in the reader.
-- dwork_initial_test
example (p : ℕ) (hp : 3 ≤ p) :
    dworkB p 0 = 1 ∧ dworkB p 1 = 1 ∧ dworkB p 2 = 1/2 := by sorry
-- dwork_low_degree_test
example (p n : ℕ) (h : n < p) : dworkB p n = 1/(Nat.factorial n : ℚ) := by sorry
-- dwork_threshold_test
example (p : ℕ) (hp : 2 ≤ p) :
    dworkB p p = 1/(Nat.factorial p : ℚ) + 1/(p : ℚ) := by sorry

-- Boundary form of the normalized operator; overconvergent chain-map signature
-- and its descent to H are omitted until the specific cohomology objects exist.
def quintic_dwork_frobenius {K : Type*} [NormedField K] [Algebra ℚ K]
    (p : ℕ) (s : DworkSums p K) : Matrix (Fin 4) (Fin 4) K :=
  let pK := (p : K)
  !![pK^3,0,0,0; 0,pK^2,0,0; 0,0,pK,0; pK^3*24/25*dwork_coefficients p s,0,0,1]
def quintic_frobenius_raw {K : Type*} [NormedField K] [Algebra ℚ K]
    (p : ℕ) (s : DworkSums p K) : Matrix (Fin 4) (Fin 4) K :=
  (p : K)^2 • quintic_dwork_frobenius p s
lemma quintic_frobenius_horizontal {K : Type*} [NormedField K] [Algebra ℚ K]
    (p : ℕ) (s : DworkSums p K) :
    (quintic_formal_connection 0).map (algebraMap ℚ K) * quintic_dwork_frobenius p s =
      (p : K) • (quintic_dwork_frobenius p s *
        (quintic_formal_connection 0).map (algebraMap ℚ K)) := by sorry
lemma quintic_frobenius_pairing {K : Type*} [NormedField K] [Algebra ℚ K]
    (p : ℕ) (s : DworkSums p K) (Y : K) :
    (quintic_dwork_frobenius p s).transpose * quintic_pairing Y *
      quintic_dwork_frobenius p s = (p : K)^3 • quintic_pairing Y := by sorry
-- quintic_frobenius_scale_test
example {K : Type*} [NormedField K] [Algebra ℚ K] (p : ℕ) (s : DworkSums p K) :
    quintic_frobenius_raw p s = (p : K)^2 • quintic_dwork_frobenius p s := by sorry
-- quintic_frobenius_parameter_test: full σ-semilinearity λ↦λ^p requires the
-- family operator; this is not asserted of the constant boundary matrix.
-- quintic_frobenius_pairing_test
example {K : Type*} [NormedField K] [Algebra ℚ K] (p : ℕ) (s : DworkSums p K) :
    (quintic_dwork_frobenius p s).transpose * quintic_pairing (1 : K) *
      quintic_dwork_frobenius p s = (p : K)^3 • quintic_pairing (1 : K) := by sorry
-- Matrix computation theorem: identification with normalized cohomological
-- Frobenius is precisely the omitted comparison premise from G1/G2.
theorem quintic_boundary_matrix {K : Type*} [NormedField K] [Algebra ℚ K]
    (p : ℕ) (s : DworkSums p K) :
    quintic_dwork_frobenius p s 3 0 = (p : K)^3 * 24/25 * dwork_coefficients p s := by sorry
-- quintic_crystalline_comparison: omitted, since no proved integral/log model
-- and no Dwork-to-crystalline map is available. G1 records all missing inputs.

-- PS.9: all series-valued MZVs take an admissible index as their argument.
def PositiveIndex (k : List ℕ) : Prop := ∀ n ∈ k, 0 < n
def Admissible (k : List ℕ) : Prop := PositiveIndex k ∧
  match k with | [] => True | n::_ => 2 ≤ n
abbrev AdmissibleIndex := {k : List ℕ // Admissible k}
def indexWeight (k : List ℕ) : ℕ := k.sum
def DescendingTuple (k : List ℕ) :=
  {n : Fin k.length → ℕ // (∀ i, 0 < n i) ∧ ∀ i j, i < j → n j < n i}
def mzvTerm (k : List ℕ) (n : DescendingTuple k) : ℝ :=
  ∏ i : Fin k.length, 1 / (n.val i : ℝ) ^ k.get i
def mzv_indices (k : AdmissibleIndex) : ℝ := ∑' n : DescendingTuple k.val, mzvTerm k.val n
def indexDepth (k : List ℕ) : ℕ := k.length
lemma mzv_weight_depth (k : List ℕ) : indexWeight k = k.sum ∧ indexDepth k = k.length := by sorry
lemma mzv_convergence (k : List ℕ) (hk : PositiveIndex k) :
    Summable (mzvTerm k) ↔ Admissible k := by sorry
lemma mzv_depth_one (n : ℕ) (hn : 2 ≤ n) :
    mzv_indices ⟨[n], by sorry⟩ = (riemannZeta (n : ℂ)).re := by sorry
-- mzv_empty_test
example : mzv_indices ⟨[], by sorry⟩ = 1 ∧ indexWeight [] = 0 := by sorry
-- mzv_two_test
example : mzv_indices ⟨[2], by sorry⟩ = Real.pi^2/6 := by sorry
-- mzv_one_test
example : ¬ Admissible [1] ∧ ¬ Summable (mzvTerm [1]) := by sorry

abbrev Words := List Bool →₀ ℚ
abbrev IndexWords := List ℕ →₀ ℚ
def mzv_encode (k : List ℕ) : List Bool := k.flatMap (fun n => List.replicate (n-1) false ++ [true])
def shuffleWord (u v : List Bool) : Words := by sorry
def stuffleWord (u v : List ℕ) : IndexWords := by sorry
def shuffleProduct : Words →ₗ[ℚ] Words →ₗ[ℚ] Words := by sorry
def stuffleProduct : IndexWords →ₗ[ℚ] IndexWords →ₗ[ℚ] IndexWords := by sorry
def word_products := (shuffleProduct, stuffleProduct)
lemma mzv_word_products (a b : Bool) (u v : List Bool) :
    shuffleWord (a::u) (b::v) =
      (shuffleWord u (b::v)).mapDomain (List.cons a) +
      (shuffleWord (a::u) v).mapDomain (List.cons b) := by sorry
lemma mzv_stuffle_recursion (a b : ℕ) (u v : List ℕ) :
    stuffleWord (a::u) (b::v) =
      (stuffleWord u (b::v)).mapDomain (List.cons a) +
      (stuffleWord (a::u) v).mapDomain (List.cons b) +
      (stuffleWord u v).mapDomain (List.cons (a+b)) := by sorry
lemma mzv_word_units (u : List Bool) (k : List ℕ) :
    shuffleWord [] u = Finsupp.single u 1 ∧
    stuffleWord [] k = Finsupp.single k 1 := by sorry
def mzv_tensor_words : Words ≃ₗ[ℚ] TauCeti.TensorWords ℚ (Bool →₀ ℚ) := by sorry
-- The full equivalence API also preserves length and all-cut deconcatenation.
-- mzv_shuffle_test
example : shuffleWord [false,true] [false,true] =
    Finsupp.single [false,false,true,true] 4 + Finsupp.single [false,true,false,true] 2 := by sorry
-- mzv_stuffle_test
example : stuffleWord [2] [2] = Finsupp.single [2,2] 2 + Finsupp.single [4] 1 := by sorry
-- mzv_encoding_test
example : mzv_encode [2,1] = [false,true,true] ∧ Admissible [2,1] := by sorry

def kernel (c : Bool) (t : ℝ) : ℝ := if c then 1/(1-t) else 1/t
def iterated_integrals (a b : ℝ) : List Bool → ℝ
  | [] => 1
  | c::u => ∫ t in a..b, kernel c t * iterated_integrals a t u
lemma mzv_iterated_recursion (a b : ℝ) (c : Bool) (u : List Bool) :
    iterated_integrals a b (c::u) = ∫ t in a..b, kernel c t * iterated_integrals a t u := by sorry
lemma mzv_iterated_sum (k : AdmissibleIndex) :
    Filter.Tendsto (fun ab : ℝ × ℝ => iterated_integrals ab.1 ab.2 (mzv_encode k.val))
      ((nhdsWithin 0 (Set.Ioi 0)) ×ˢ (nhdsWithin 1 (Set.Iio 1)))
      (nhds (mzv_indices k)) := by sorry
-- mzv_iterated_polylog: omitted named compatibility signature until the
-- Polylogarithms:P.1 supplier's Li_n object is available; no duplicate definition.
-- mzv_iterated_empty_test
example (a : ℝ) : iterated_integrals a a [] = 1 := by sorry
-- mzv_iterated_zeta_test: the same joint-endpoint limit as mzv_iterated_sum,
-- at [3] and [2,1], has the two specified convergent zeta values.
example :
    Filter.Tendsto (fun ab : ℝ × ℝ => iterated_integrals ab.1 ab.2 [false,false,true])
      ((nhdsWithin 0 (Set.Ioi 0)) ×ˢ (nhdsWithin 1 (Set.Iio 1)))
      (nhds (mzv_indices ⟨[3], by sorry⟩)) ∧
    Filter.Tendsto (fun ab : ℝ × ℝ => iterated_integrals ab.1 ab.2 [false,true,true])
      ((nhdsWithin 0 (Set.Ioi 0)) ×ˢ (nhdsWithin 1 (Set.Iio 1)))
      (nhds (mzv_indices ⟨[2,1], by sorry⟩)) := by sorry
-- mzv_iterated_divergence_test
example (L : ℝ) : ¬ Filter.Tendsto (fun b : ℝ => -Real.log (1-b))
    (nhdsWithin 1 (Set.Iio 1)) (nhds L) := by sorry

def zeta2 : ℝ := mzv_indices ⟨[2], by sorry⟩
def zeta3 : ℝ := mzv_indices ⟨[3], by sorry⟩
def zeta4 : ℝ := mzv_indices ⟨[4], by sorry⟩
def zeta21 : ℝ := mzv_indices ⟨[2,1], by sorry⟩
def zeta22 : ℝ := mzv_indices ⟨[2,2], by sorry⟩
def zeta31 : ℝ := mzv_indices ⟨[3,1], by sorry⟩
theorem convergent_double_shuffle :
    zeta2^2 = 4*zeta31+2*zeta22 ∧ zeta2^2 = 2*zeta22+zeta4 := by sorry

-- false chooses stuffle, true chooses shuffle; values are polynomials in T.
def H1 : Submodule ℚ Words := Submodule.span ℚ
  {x | ∃ w : List Bool, (w = [] ∨ w.getLast? = some true) ∧ x = Finsupp.single w 1}
-- Each wrapper carries its own multiplication on the same coordinate module.
structure RegularizationWords (s : Bool) where
  coords : H1
instance (s : Bool) : CommRing (RegularizationWords s) := by sorry
instance (s : Bool) : Algebra ℚ (RegularizationWords s) := by sorry
def regularizationWord (s : Bool) (w : List Bool)
    (hw : w = [] ∨ w.getLast? = some true) : RegularizationWords s :=
  ⟨⟨Finsupp.single w 1, by sorry⟩⟩
def regularizationCoordinate (s : Bool) (w : List Bool) : RegularizationWords s :=
  if hw : w = [] ∨ w.getLast? = some true then regularizationWord s w hw else 0
lemma regularization_shuffle_product (u v : List Bool)
    (hu : u = [] ∨ u.getLast? = some true)
    (hv : v = [] ∨ v.getLast? = some true) :
    regularizationWord true u hu * regularizationWord true v hv =
      (shuffleWord u v).sum (fun w a => a •
        regularizationCoordinate true w) := by sorry
lemma regularization_stuffle_product (k l : List ℕ)
    (hk : PositiveIndex k) (hl : PositiveIndex l) :
    regularizationWord false (mzv_encode k) (by sorry) *
      regularizationWord false (mzv_encode l) (by sorry) =
      (stuffleWord k l).sum (fun w a => a •
        regularizationWord false (mzv_encode w) (by sorry)) := by sorry
def regularizationMap (s : Bool) : RegularizationWords s →ₐ[ℚ] Polynomial ℝ := by sorry
def polynomial_regularizations (s : Bool) (w : List Bool) : Polynomial ℝ := by sorry
lemma regularization_map_word (s : Bool) (w : List Bool)
    (hw : w = [] ∨ w.getLast? = some true) :
    regularizationMap s (regularizationWord s w hw) = polynomial_regularizations s w := by sorry
lemma mzv_regularization_admissible (s : Bool) (k : AdmissibleIndex) :
    polynomial_regularizations s (mzv_encode k.val) = Polynomial.C (mzv_indices k) := by sorry
lemma mzv_regularization_y (s : Bool) :
    polynomial_regularizations s [true] = Polynomial.X ∧
      polynomial_regularizations s [] = 1 := by sorry
lemma mzv_regularization_unique (s : Bool)
    (f : RegularizationWords s →ₐ[ℚ] Polynomial ℝ)
    (hadm : ∀ k : AdmissibleIndex, f (regularizationWord s (mzv_encode k.val)
      (by sorry)) = Polynomial.C (mzv_indices k))
    (hy : f (regularizationWord s [true] (by sorry)) = Polynomial.X) :
    f = regularizationMap s := by sorry
-- mzv_regularization_empty_test
example (s : Bool) : polynomial_regularizations s [] = 1 := by sorry
-- mzv_regularization_two_ones_test
example : polynomial_regularizations false [true,true] =
    Polynomial.C (1/2) * (Polynomial.X^2-Polynomial.C zeta2) ∧
    polynomial_regularizations true [true,true] = Polynomial.C (1/2) * Polynomial.X^2 := by sorry
-- mzv_regularization_leading_test
example : polynomial_regularizations false (mzv_encode [1,2]) =
    Polynomial.C zeta2 * Polynomial.X - Polynomial.C zeta21 - Polynomial.C zeta3 ∧
    polynomial_regularizations true (mzv_encode [1,2]) =
    Polynomial.C zeta2 * Polynomial.X - 2 * Polynomial.C zeta21 := by sorry

def regularizationA : PowerSeries ℝ := (PowerSeries.exp ℝ).subst
  (PowerSeries.mk (fun n => if 2 ≤ n then (-1 : ℝ)^n * (riemannZeta (n : ℂ)).re/n else 0))
def regularization_operator : Polynomial ℝ ≃ₗ[ℝ] Polynomial ℝ := by sorry
lemma mzv_rho_monomial (m : ℕ) : regularization_operator (Polynomial.X^m) =
    ∑ k ∈ Finset.range (m+1), Polynomial.C
      ((Nat.factorial m : ℝ)/(Nat.factorial (m-k) : ℝ)*regularizationA.coeff k) *
      Polynomial.X^(m-k) := by sorry
lemma mzv_rho_generating :
    PowerSeries.mk (fun n => (1/(Nat.factorial n : ℝ)) •
      regularization_operator (Polynomial.X^n)) =
    (regularizationA.map Polynomial.C) *
      PowerSeries.mk (fun n => (1/(Nat.factorial n : ℝ)) • (Polynomial.X : Polynomial ℝ)^n) := by sorry
lemma mzv_rho_inverse (f : Polynomial ℝ) :
    regularization_operator.symm (regularization_operator f) = f := by sorry
-- mzv_rho_one_test
example : regularization_operator 1 = 1 ∧ regularization_operator Polynomial.X = Polynomial.X := by sorry
-- mzv_rho_square_test
example : regularization_operator (Polynomial.X^2) = Polynomial.X^2+Polynomial.C zeta2 := by sorry
-- mzv_rho_cube_test
example : regularization_operator (Polynomial.X^3) =
    Polynomial.X^3+3*Polynomial.C zeta2*Polynomial.X-2*Polynomial.C zeta3 := by sorry

theorem regularized_double_shuffle (w : List Bool) (hw : w = [] ∨ w.getLast? = some true) :
    polynomial_regularizations true w = regularization_operator (polynomial_regularizations false w) := by sorry
example : zeta21 = zeta3 := by sorry

-- This is the specific heart over Z. Its ambient DMT(Q), t-structure,
-- unramifiedness criterion and exact tensor structure are omitted conditions
-- until MC.4's category interfaces exist. The names below represent actual data.
def mixed_tate_z : Type := by sorry
instance : Category mixed_tate_z := by sorry
def mtz_tate (n : ℤ) : mixed_tate_z := by sorry
def mtz_weight_fibre : mixed_tate_z ⥤ ModuleCat ℚ := by sorry
-- Grade-n fibre data: ω_n(M)=Hom(Q(n),gr^W_{-2n}M).
def mtzGrade (n : ℤ) : mixed_tate_z ⥤ ModuleCat ℚ := by sorry
def MixedTateQ : Type := by sorry
def mtzInclusion : mixed_tate_z → MixedTateQ := by sorry
def kummerTwo : MixedTateQ := by sorry
-- mtz_unramified: omitted adjacent-weight/Kummer Ext condition, described in
-- the reader, not modeled by a Prop-valued field.
-- mtz_unit_test
example : Nonempty (((mtzGrade 0).obj (mtz_tate 0)) ≃ₗ[ℚ] ℚ) := by sorry
-- mtz_tate_test
example : Nonempty (((mtzGrade 1).obj (mtz_tate 1)) ≃ₗ[ℚ] ℚ) ∧
    Module.finrank ℚ ((mtzGrade 0).obj (mtz_tate 1)) = 0 := by sorry
-- mtz_kummer_test: Kummer(2) is an object of MT(Q), outside the inclusion image.
example : kummerTwo ∉ Set.range mtzInclusion := by sorry
-- mixed_tate_galois: MC.6 reconstructs the group; Ext dimensions and the free
-- graded Lie algebra are omitted here pending the specific Tate Ext objects.

-- Path coordinates reuse TensorWords. Generic groupoids are NC.2's imports.
def motivic_path_torsor : Type := by sorry
-- mzv_path_word_coordinates and mzv_path_betti_comparison: full algebra and
-- realization signatures require NC.2/MC.4/MC.6. Their objects are not redefined.
def mzv_path_composition : TauCeti.TensorWords ℚ (Bool →₀ ℚ) →ₗ[ℚ]
    TauCeti.TensorWords ℚ (Bool →₀ ℚ) ⊗[ℚ] TauCeti.TensorWords ℚ (Bool →₀ ℚ) :=
  TauCeti.TensorWords.deconcatenation ℚ (Bool →₀ ℚ)
def pathEvaluation : Words →ₗ[ℚ] ℝ := by sorry
def wordDeconcatenation : Words →ₗ[ℚ] Words ⊗[ℚ] Words := by sorry
-- mzv_path_empty_test
example : pathEvaluation (Finsupp.single [] 1) = 1 := by sorry
-- mzv_path_cut_test
example : wordDeconcatenation (Finsupp.single [false,true] 1) =
    (Finsupp.single [] 1 : Words) ⊗ₜ[ℚ] (Finsupp.single [false,true] 1 : Words) +
    (Finsupp.single [false] 1 : Words) ⊗ₜ[ℚ] (Finsupp.single [true] 1 : Words) +
    (Finsupp.single [false,true] 1 : Words) ⊗ₜ[ℚ] (Finsupp.single [] 1 : Words) := by sorry
-- mzv_path_tangent_test: the affine chart is P1 minus {0,1,infinity}; the
-- full tangential groupoid condition is still omitted.
example : (0 : ℚ) ∉ {x : ℚ | x ≠ 0 ∧ x ≠ 1} ∧
    (1 : ℚ) ∉ {x : ℚ | x ≠ 0 ∧ x ≠ 1} := by sorry

-- A wrapper changes multiplication, while retaining the Finsupp module data.
structure ShuffleAlgebra where
  coords : Words
instance : CommRing ShuffleAlgebra := by sorry
instance : Algebra ℚ ShuffleAlgebra := by sorry
def shuffleCoordinateEquiv : ShuffleAlgebra ≃ₗ[ℚ] Words := by sorry
def wordCoordinate (w : List Bool) : ShuffleAlgebra := ⟨Finsupp.single w 1⟩
def gradeProjection (n : ℕ) (s : ShuffleAlgebra) : ShuffleAlgebra :=
  ⟨s.coords.filter (fun w => w.length = n)⟩
def FullUnipotentAlgebra : Type := by sorry
instance : CommRing FullUnipotentAlgebra := by sorry
instance : Algebra ℚ FullUnipotentAlgebra := by sorry
def fullPathCoaction : ShuffleAlgebra →ₐ[ℚ] FullUnipotentAlgebra ⊗[ℚ] ShuffleAlgebra := by sorry
def straightPathEvaluation : ShuffleAlgebra →ₐ[ℚ] ℝ := by sorry
def GradedIdeal (J : Ideal ShuffleAlgebra) : Prop :=
  ∀ s ∈ J, ∀ n, gradeProjection n s ∈ J
def StableIdeal (J : Ideal ShuffleAlgebra) : Prop := ∀ s ∈ J,
  fullPathCoaction s ∈ Submodule.span ℚ
    {v | ∃ a : FullUnipotentAlgebra, ∃ t : ShuffleAlgebra, t ∈ J ∧ v = a ⊗ₜ[ℚ] t}
def motivicIdeal : Ideal ShuffleAlgebra := sSup
  {J | GradedIdeal J ∧ StableIdeal J ∧ ∀ s ∈ J, straightPathEvaluation s = 0}
def motivic_mzv_algebra := ShuffleAlgebra ⧸ motivicIdeal
abbrev MZVH := ShuffleAlgebra ⧸ motivicIdeal
def motivicWord (w : List Bool) : MZVH := Ideal.Quotient.mk motivicIdeal (wordCoordinate w)
def motivicZeta (k : List ℕ) : MZVH := motivicWord (mzv_encode k).reverse
def mzv_motivic_period : MZVH →ₐ[ℚ] ℝ := by sorry
lemma mzv_motivic_shuffle (u v : List Bool) :
    motivicWord u * motivicWord v =
      (shuffleWord u v).sum (fun w a => a • motivicWord w) := by sorry
lemma mzv_motivic_ideal (J : Ideal ShuffleAlgebra) (hg : GradedIdeal J)
    (hs : StableIdeal J) (hp : ∀ s ∈ J, straightPathEvaluation s = 0) : J ≤ motivicIdeal := by sorry
lemma motivicPeriodZeta (k : AdmissibleIndex) :
    mzv_motivic_period (motivicZeta k.val) = mzv_indices k := by sorry
-- mzv_motivic_empty_test
example : motivicZeta [] = 1 ∧ mzv_motivic_period 1 = 1 := by sorry
-- mzv_motivic_two_test
example : motivicZeta [2] ≠ 0 := by sorry
-- mzv_motivic_reverse_test
example : motivicZeta [2,1] = motivicWord [true,true,false] := by sorry

def MotivicA : Type := by sorry
instance : CommRing MotivicA := by sorry
instance : Algebra ℚ MotivicA := by sorry
def motivicProjection : MZVH →ₐ[ℚ] MotivicA := by sorry
def motivic_coaction : MZVH →ₐ[ℚ] MotivicA ⊗[ℚ] MZVH := by sorry
-- mzv_coaction_cuts: the full subsequence signature needs endpoint-labelled
-- iterated integrals in the motivic groupoid, absent from the supplier baseline.
lemma mzv_coaction_algebra (x y : MZVH) :
    motivic_coaction (x*y) = motivic_coaction x * motivic_coaction y := by sorry
-- Full mzv_coaction_algebra includes the coassociative/counit conditions on A.
lemma mzv_coaction_tate : motivicProjection (motivicZeta [2]) = 0 ∧
    motivic_coaction (motivicZeta [2]) = (1 : MotivicA) ⊗ₜ[ℚ] motivicZeta [2] := by sorry
-- mzv_coaction_unit_test
example : motivic_coaction 1 = (1 : MotivicA) ⊗ₜ[ℚ] (1 : MZVH) := by sorry
-- mzv_coaction_two_test
example : motivic_coaction (motivicZeta [2]) = (1 : MotivicA) ⊗ₜ[ℚ] motivicZeta [2] := by sorry
-- mzv_coaction_three_test
example : motivic_coaction (motivicZeta [3]) = (1 : MotivicA) ⊗ₜ[ℚ] motivicZeta [3] +
    motivicProjection (motivicZeta [3]) ⊗ₜ[ℚ] (1 : MZVH) := by sorry

def motivicWeight (N : ℕ) : Submodule ℚ MZVH := by sorry
def mzvDimension : ℕ → ℕ
  | 0 => 1 | 1 => 0 | 2 => 1 | n+3 => mzvDimension (n+1) + mzvDimension n
abbrev OddLetter := {n : ℕ // Odd n ∧ 3 ≤ n}
-- Coordinates are an f₂ exponent and an odd word; multiplication is the
-- tensor product of the polynomial product and odd-word shuffle product.
structure FAlphabet where
  coords : (ℕ × List OddLetter) →₀ ℚ
instance : CommRing FAlphabet := by sorry
instance : Algebra ℚ FAlphabet := by sorry
def fTwo : FAlphabet := ⟨Finsupp.single (1, []) 1⟩
def fAlphabetWeight (N : ℕ) : Submodule ℚ FAlphabet := by sorry
-- motivic_f_alphabet: its graded comodule compatibility also requires MC.6's
-- free-group coordinate comparison and the noncanonical generator choices.
def motivic_f_alphabet : MZVH →ₐ[ℚ] FAlphabet := by sorry
lemma motivic_f_alphabet_embedding : Function.Injective motivic_f_alphabet ∧
    motivic_f_alphabet (motivicZeta [2]) = fTwo := by sorry
lemma motivic_f_alphabet_graded (N : ℕ) :
    Submodule.map motivic_f_alphabet.toLinearMap (motivicWeight N) ≤ fAlphabetWeight N := by sorry
theorem motivic_dimension_bound (N : ℕ) :
    Module.finrank ℚ (motivicWeight N) ≤ mzvDimension N := by sorry
-- The indecomposable module is graded A₊/A₊². Identifying these data with that
-- quotient and with the projected cut coaction requires the supplier's Hopf API.
def MotivicIndecomposables (r : ℕ) : Type := by sorry
instance (r : ℕ) : AddCommGroup (MotivicIndecomposables r) := by sorry
instance (r : ℕ) : Module ℚ (MotivicIndecomposables r) := by sorry
def motivicDerivation (r N : ℕ) : motivicWeight N →ₗ[ℚ]
    MotivicIndecomposables r ⊗[ℚ] motivicWeight (N-r) := by sorry
theorem coaction_derivation_kernel (N : ℕ) (hN : 2 ≤ N) :
    {x : MZVH | ∃ hx : x ∈ motivicWeight N,
      ∀ r, Odd r → 3 ≤ r → r < N → motivicDerivation r N ⟨x,hx⟩ = 0} =
      (Submodule.span ℚ {motivicZeta [N]} : Set MZVH) := by sorry
theorem motivic_double_shuffle :
    (motivicZeta [2])^2 = 2*motivicZeta [2,2] + motivicZeta [4] ∧
    (motivicZeta [2])^2 = 4*motivicZeta [3,1] + 2*motivicZeta [2,2] := by sorry
-- The generic convergent stuffle identity needs the frame-preserving comparison
-- G3. Brown Lemma 3.8 uses no additional divergent-stuffle extension.
lemma motivic_convergent_stuffle (u v : AdmissibleIndex) :
    motivicZeta u.val * motivicZeta v.val =
      (stuffleWord u.val v.val).sum (fun w a => a • motivicZeta w) := by sorry

def zagier_coefficients (a b r : ℕ) : ℚ :=
  2 * (-1 : ℚ)^r * ((Nat.choose (2*r) (2*b+2) : ℚ) -
    (1-1/(2 : ℚ)^(2*r)) * (Nat.choose (2*r) (2*a+1) : ℚ))
lemma zagier_coefficient_formula (a b r : ℕ) : zagier_coefficients a b r =
  2 * (-1 : ℚ)^r * ((Nat.choose (2*r) (2*b+2) : ℚ) -
    (1-1/(2 : ℚ)^(2*r)) * (Nat.choose (2*r) (2*a+1) : ℚ)) := by sorry
def zagierAscendingCoefficient (a b r : ℕ) : ℚ :=
  2 * (-1 : ℚ)^r * ((Nat.choose (2*r) (2*a+2) : ℚ) -
    (1-1/(2 : ℚ)^(2*r)) * (Nat.choose (2*r) (2*b+1) : ℚ))
lemma zagier_coefficient_reversal (a b r : ℕ) :
    zagier_coefficients a b r = zagierAscendingCoefficient b a r := by sorry
lemma zagier_coefficient_dyadic (a b r : ℕ) :
    ∃ m : ℤ, ∃ k : ℕ, zagier_coefficients a b r = (m : ℚ)/(2 : ℚ)^k := by sorry
-- zagier_three_test
example : zagier_coefficients 0 0 1 = 1 := by sorry
-- zagier_two_three_test
example : zagier_coefficients 1 0 1 = -2 ∧ zagier_coefficients 1 0 2 = 9/2 := by sorry
-- zagier_three_two_test
example : zagier_coefficients 0 1 1 = 3 ∧ zagier_coefficients 0 1 2 = -11/2 := by sorry

def oneThree (a b : ℕ) : List ℕ := List.replicate a 2 ++ [3] ++ List.replicate b 2
-- Brown's ζ₁ is a shuffle-regularized leading-zero integral I(0;0(10)^n;1).
-- It is not the motivic value of an index list with an extra divergent 1.
def motivicShiftedAllTwos (n : ℕ) : MZVH :=
  motivicWord (false :: (List.replicate n [true,false]).flatten)
lemma motivic_shifted_all_twos_shuffle (n : ℕ) (hn : 1 ≤ n) :
    motivicShiftedAllTwos n = (-2 : ℚ) •
      ∑ i ∈ Finset.range n, motivicZeta (oneThree (n-1-i) i) := by sorry
lemma motivic_shifted_all_twos_stuffle (n : ℕ) (hn : 1 ≤ n) :
    motivicShiftedAllTwos n =
      ∑ i ∈ Finset.range n, (2 * (-1 : ℚ)^(i+1)) •
        (motivicZeta [2*(i+1)+1] * motivicZeta (List.replicate (n-1-i) 2)) := by sorry
example : motivicShiftedAllTwos 1 = (-2 : ℚ) • motivicZeta [3] := by sorry
example : motivicShiftedAllTwos 2 =
    (-2 : ℚ) • (motivicZeta [3] * motivicZeta [2]) +
      (2 : ℚ) • motivicZeta [5] := by sorry
theorem zagier_evaluation (a b : ℕ) : mzv_indices ⟨oneThree a b, by sorry⟩ =
    ∑ r ∈ Finset.range (a+b+1), (zagier_coefficients a b (r+1) : ℝ) *
      mzv_indices ⟨[2*(r+1)+1], by sorry⟩ *
      mzv_indices ⟨List.replicate (a+b-r) 2, by sorry⟩ := by sorry
theorem motivic_zagier_evaluation (a b : ℕ) : motivicZeta (oneThree a b) =
    ∑ r ∈ Finset.range (a+b+1), zagier_coefficients a b (r+1) •
      (motivicZeta [2*(r+1)+1] * motivicZeta (List.replicate (a+b-r) 2)) := by sorry

def IsHoffman (k : List ℕ) : Prop := ∀ n ∈ k, n = 2 ∨ n = 3
def hoffmanLevel (k : List ℕ) : ℕ := k.count 3
def HoffmanWords (N l : ℕ) := {k : List ℕ // IsHoffman k ∧ indexWeight k = N ∧ hoffmanLevel k = l}
def HoffmanWeightWords (N : ℕ) := {k : List ℕ // IsHoffman k ∧ indexWeight k = N}
instance (N l : ℕ) : Fintype (HoffmanWords N l) := by sorry
instance (N l : ℕ) : DecidableEq (HoffmanWords N l) := Classical.decEq _
instance (N : ℕ) : Fintype (HoffmanWeightWords N) := by sorry
def hoffman_level (N l : ℕ) : Submodule ℚ MZVH := Submodule.span ℚ
  {x | ∃ k : List ℕ, IsHoffman k ∧ indexWeight k = N ∧ hoffmanLevel k ≤ l ∧ x = motivicZeta k}
lemma hoffman_level_span (N l : ℕ) : hoffman_level N l ≤ hoffman_level N (l+1) := by sorry
lemma hoffman_level_cardinality (m l : ℕ) :
    Fintype.card (HoffmanWords (2*m+3*l) l) = Nat.choose (m+l) l := by sorry
lemma hoffman_level_derivation (N l r : ℕ) (hl : 1 ≤ l)
    (hr : Odd r) (hr3 : 3 ≤ r) (hrN : r ≤ N)
    (x : motivicWeight N) (hx : x.val ∈ hoffman_level N l) :
    (TensorProduct.map (LinearMap.id : MotivicIndecomposables r →ₗ[ℚ]
      MotivicIndecomposables r) (motivicWeight (N-r)).subtype)
      (motivicDerivation r N x) ∈ Submodule.span ℚ
        {v | ∃ a : MotivicIndecomposables r, ∃ b : MZVH,
          b ∈ hoffman_level (N-r) (l-1) ∧ v = a ⊗ₜ[ℚ] b} := by sorry
-- Level lowering follows from parity of the contiguous cuts (Brown Lemma 5.5),
-- before evaluating their coefficients using the motivic one-three formula.
-- hoffman_empty_test
example : Fintype.card (HoffmanWords 0 0) = 1 ∧ hoffman_level 0 0 = Submodule.span ℚ {1} := by sorry
-- hoffman_weight_five_test
example : Fintype.card (HoffmanWords 5 1) = 2 := by sorry
-- hoffman_weight_six_test
example : Fintype.card (HoffmanWords 6 0) = 1 ∧ Fintype.card (HoffmanWords 6 2) = 1 ∧
    Fintype.card (HoffmanWords 6 1) = 0 := by sorry

def HoffmanTargets (N l : ℕ) :=
  Σ r : {r : ℕ // Odd r ∧ 3 ≤ r ∧ r ≤ N}, HoffmanWords (N-r.val) (l-1)
instance (N l : ℕ) : Fintype (HoffmanTargets N l) := by sorry
-- Source words index rows and target pairs index columns, as in Brown Def. 5.9.
-- Coefficients come from the actual level-lowering cuts; no independence is used.
def hoffman_cut_coefficients (N l : ℕ) :
    Matrix (HoffmanWords N l) (HoffmanTargets N l) ℚ := by sorry
-- Delete the descending prefix 2^k3. The inverse prepends it to the target word.
def hoffmanTargetEquiv (N l : ℕ) (hl : 1 ≤ l) :
    HoffmanWords N l ≃ HoffmanTargets N l := by sorry
lemma hoffman_matrix_prefix (N l k : ℕ) (hl : 1 ≤ l)
    (w : HoffmanWords N l) (u : List ℕ)
    (hw : w.val = List.replicate k 2 ++ [3] ++ u) :
    (hoffmanTargetEquiv N l hl w).1.val = 2*k+3 ∧
      (hoffmanTargetEquiv N l hl w).2.val = u := by sorry
def hoffman_cut_matrix (N l : ℕ) (hl : 1 ≤ l) :
    Matrix (HoffmanWords N l) (HoffmanWords N l) ℚ :=
  fun w w' => hoffman_cut_coefficients N l w (hoffmanTargetEquiv N l hl w')
-- hoffman_matrix_entry: the full cut-coefficient formula needs endpoint-labelled
-- D_r and the shifted-all-two integral identity. G3 supplies convergent stuffle
-- in this presentation. The matrix is not defined by its later invertibility.
lemma hoffman_matrix_square (N l : ℕ) (hl : 1 ≤ l) :
    Fintype.card (HoffmanWords N l) = Fintype.card (HoffmanTargets N l) := by sorry
-- hoffman_matrix_leading: the exact ordered/rescaled entry conditions are
-- omitted until the cut formula and rational 2-adic valuation API are linked.
-- hoffman_matrix_empty_target_test
example : hoffman_cut_matrix 3 1 (by decide) = 1 := by sorry
def hoffmanFiveRows : Fin 2 → HoffmanWords 5 1 :=
  ![⟨[3,2], by sorry⟩, ⟨[2,3], by sorry⟩]
def hoffmanFiveColumns : Fin 2 → HoffmanTargets 5 1 :=
  ![⟨⟨3, by decide⟩, ⟨[2], by sorry⟩⟩,
    ⟨⟨5, by decide⟩, ⟨[], by sorry⟩⟩]
-- hoffman_matrix_weight_five_test
example : (hoffman_cut_coefficients 5 1).submatrix hoffmanFiveRows hoffmanFiveColumns =
    !![3, -11/2; -2, 9/2] := by sorry
-- This rational arithmetic check has no motivic or placeholder matrix premise.
example : (!![zagier_coefficients 0 1 1, zagier_coefficients 0 1 2;
    zagier_coefficients 1 0 1, zagier_coefficients 1 0 2] :
      Matrix (Fin 2) (Fin 2) ℚ).det = 5/2 := by
  norm_num [zagier_coefficients, Matrix.det_fin_two, Nat.choose]
-- The square reindexing's columns correspond to [3,2] and [2,3] in this order.
example : hoffmanTargetEquiv 5 1 (by decide) (hoffmanFiveRows 0) = hoffmanFiveColumns 0 ∧
    hoffmanTargetEquiv 5 1 (by decide) (hoffmanFiveRows 1) = hoffmanFiveColumns 1 := by sorry
-- hoffman_matrix_reversal_test
example (k : ℕ) : (3 :: List.replicate k 2).reverse = List.replicate k 2 ++ [3] := by sorry

theorem hoffman_matrix_invertible (N l : ℕ) (hN : 3 ≤ N) (hl : 1 ≤ l) :
    (hoffman_cut_matrix N l hl).det ≠ 0 := by sorry
theorem hoffman_motivic_basis (N : ℕ) :
    LinearIndependent ℚ (fun k : HoffmanWeightWords N => motivicZeta k.val) ∧
    Submodule.span ℚ (Set.range (fun k : HoffmanWeightWords N => motivicZeta k.val)) =
      motivicWeight N := by sorry
theorem numerical_spanning (k : AdmissibleIndex) : mzv_indices k ∈
    Submodule.span ℚ (Set.range (fun w : HoffmanWeightWords (indexWeight k.val) =>
      mzv_indices ⟨w.val, by sorry⟩)) := by sorry
-- The full numerical_spanning target also transports arbitrary MT(Z) periods
-- through PS.2's Tate localization. That period-torsor interface is omitted.

end TauCeti.PeriodsAndSpecialValues
