import TauCeti.FieldTheory.FunctionField.ConstantField
import TauCeti.FieldTheory.FunctionField.RiemannRoch.ClassNumber
import TauCeti.FieldTheory.FunctionField.Differential.CanonicalDivisor
import TauCeti.FieldTheory.FunctionField.Differential.RatFunc
import TauCeti.FieldTheory.FunctionField.Place.RatFunc.Basic
import Mathlib.Topology.Algebra.RestrictedProduct.Units
import Mathlib.Topology.Algebra.RestrictedProduct.TopologicalSpace
import Mathlib.Topology.Algebra.Valued.WithVal
import Mathlib.MeasureTheory.Measure.Haar.Basic
import Mathlib.MeasureTheory.Integral.Bochner.Basic
import Mathlib.Topology.LocallyConstant.Basic
import Mathlib.Algebra.Group.AddChar
import Mathlib.RingTheory.WittVector.Truncated
import Mathlib.RingTheory.WittVector.Frobenius
import Mathlib.RingTheory.LaurentSeries
import Mathlib.RingTheory.FormalGroup.Basic
import Mathlib.FieldTheory.IsAlgClosed.AlgebraicClosure
import Mathlib.FieldTheory.Galois.Basic
import Mathlib.LinearAlgebra.Matrix.Determinant.Basic
import Mathlib.RingTheory.PowerSeries.Basic
import Mathlib.Data.ZMod.Basic
import Mathlib.LinearAlgebra.TensorProduct.Tower
import Mathlib.RingTheory.Flat.Basic
import Mathlib.Analysis.SpecialFunctions.Pow.Complex
import Mathlib.Topology.Algebra.InfiniteSum.Ring
import Mathlib.GroupTheory.QuotientGroup.Basic
import Mathlib.Topology.Algebra.Group.Quotient
import Mathlib.LinearAlgebra.Matrix.GeneralLinearGroup.Defs
import Mathlib.LinearAlgebra.Matrix.Trace
import Mathlib.RingTheory.Ideal.Quotient.Basic

/-!
This file is not the roadmap and is not exhaustive. The roadmap document is definitive.
These statements suggest Lean forms so contributors and reviewers converge on names and
signatures. They are plans, not implementations; all implementation statuses remain unchecked.

The reader FunctionFieldArithmetic.md gives the complete mathematical hypotheses and sources.
The pinned libraries have no full curve/Picard, global reciprocity, reductive adelic quotient,
or unitary Eisenstein interfaces. At those boundaries the signatures below state the available
carrier and formula; the missing condition is explicitly described beside the declaration.
Such signatures must NOT be used as unconditional theorems. No missing condition is represented
by a proposition-valued dummy field. Genuine basis/algorithm certificates have proof fields.
Generic restricted products and native divisor/Riemann–Roch objects are imported, not replanned.
-/

noncomputable section
set_option maxHeartbeats 800000
open scoped BigOperators WithZero TensorProduct
open TauCeti AlgebraicGeometry Polynomial MeasureTheory

namespace FunctionFieldArithmetic

instance primeFive : Fact (Nat.Prime 5) := ⟨by decide⟩

section Curves
variable (k K : Type*) [Field k] [Field K] [Algebra k K]

/-- FA.0: the curve dictionary/base-change comparison is omitted until AC.12 is available.
This is its finite-exact-constant-field part on the native intermediate-field carrier. -/
theorem finite_exact_base [Finite k] (hK : IsFunctionField k K) :
    Finite (algebraicClosure k K) ∧
    IsIntegrallyClosedIn (algebraicClosure k K) K := by sorry

/-- The degree sign comparison; absolute values and the Artin convention are in the reader. -/
theorem degree_conventions (D : Divisor k K) :
    -(Divisor.degree D) = -∑ v ∈ D.support, D v * (v.degree : ℤ) := by sorry

/-- Omitted: J must be the rational points of the imported ordinary Picard variety of the
smooth projective curve of K with exact constants. No rational point on the curve is chosen. -/
theorem rational_picard_comparison [Finite k] (hK : IsFunctionField k K)
    (hex : IsIntegrallyClosedIn k K) (J : Type*) [AddCommGroup J] :
    Nonempty ((Divisor.degreeClass hK).ker ≃+ J) := by sorry

/-- A genuine certificate for a basis of the native L(D). -/
structure RRBasisCertificate (D : Divisor k K) where
  size : ℕ
  vectors : Fin size → K
  membership : ∀ i, vectors i ∈ riemannRochSpace D
  independent : LinearIndependent k vectors
  spanning : Submodule.span k (Set.range vectors) = riemannRochSpace D

namespace RRBasisCertificate
variable {k K} {D : Divisor k K}
theorem size_eq_dim (c : RRBasisCertificate k K D) :
    c.size = Module.finrank k (riemannRochSpace D) := by sorry

def coordinates (c : RRBasisCertificate k K D) :
    riemannRochSpace D ≃ₗ[k] (Fin c.size → k) := by sorry

def principal_transport (hK : IsFunctionField k K) (c : RRBasisCertificate k K D)
    (f : Kˣ) : RRBasisCertificate k K (D - Divisor.principal hK f) := by sorry

theorem negative_empty (hK : IsFunctionField k K) (hD : Divisor.degree D < 0) :
    ∃ c : RRBasisCertificate k K D, c.size = 0 := by sorry

theorem zero_constants (hK : IsFunctionField k K) (hex : IsIntegrallyClosedIn k K) :
    ∃ c : RRBasisCertificate k K 0, c.size = 1 ∧ ∀ i, c.vectors i = 1 := by sorry

theorem repeated_one_rejected :
    ¬ LinearIndependent k (fun _ : Fin 2 => (1 : K)) := by sorry

example (hK : IsFunctionField k K) (hD : Divisor.degree D < 0) :
    ∃ c : RRBasisCertificate k K D, c.size = 0 := by sorry
example (hK : IsFunctionField k K) (hex : IsIntegrallyClosedIn k K) :
    ∃ c : RRBasisCertificate k K 0, c.size = 1 ∧ ∀ i, c.vectors i = 1 := by sorry
example : ¬ LinearIndependent k (fun _ : Fin 2 => (1 : K)) := by sorry
end RRBasisCertificate

/-- Omitted: the finite-field encoding, two verified integral bases, and polynomial-module
algorithm. This return type is the required certificate, not a replacement definition of L(D).
An implementable version takes those encodings and verifies them before constructing it. -/
def RRComputation (hK : IsFunctionField k K) (D : Divisor k K) :
    RRBasisCertificate k K D := by sorry

namespace RRComputation
variable {k K}
theorem sound (hK : IsFunctionField k K) (D : Divisor k K) :
    Submodule.span k (Set.range (RRComputation k K hK D).vectors) =
      riemannRochSpace D := by sorry
/-- Prototype certificate existence only; executable termination requires the omitted encoding. -/
theorem complete (hK : IsFunctionField k K) (D : Divisor k K) :
    Nonempty (RRBasisCertificate k K D) := by sorry

def chart_independent {D : Divisor k K} (c d : RRBasisCertificate k K D) :
    (Fin c.size → k) ≃ₗ[k] (Fin d.size → k) := by sorry

theorem p1_degree_two (hK : IsFunctionField k (RatFunc k)) :
    let D : Divisor k (RatFunc k) := 2 • WeilDivisor.ofPoint (Place.infty k)
    ∃ c : RRBasisCertificate k (RatFunc k) D,
      c.size = 3 ∧ Set.range c.vectors = {1, RatFunc.X, RatFunc.X ^ 2} := by sorry

theorem negative_degree (hK : IsFunctionField k K) (D : Divisor k K)
    (hD : Divisor.degree D < 0) : (RRComputation k K hK D).size = 0 := by sorry
/-- Normalization is tested by the actual ring-integrality predicate. A finite integral basis
must span the integral closure; merely spanning the supplied order is insufficient. -/
theorem singular_basis_rejected :
    let S := Algebra.adjoin (ZMod 5)
      ({Polynomial.X ^ 2, Polynomial.X ^ 3} : Set (Polynomial (ZMod 5)))
    IsIntegral S (Polynomial.X : Polynomial (ZMod 5)) ∧ Polynomial.X ∉ S := by sorry
example (hK : IsFunctionField k (RatFunc k)) :
    let D : Divisor k (RatFunc k) := 2 • WeilDivisor.ofPoint (Place.infty k)
    ∃ c : RRBasisCertificate k (RatFunc k) D,
      c.size = 3 ∧ Set.range c.vectors = {1, RatFunc.X, RatFunc.X ^ 2} := by sorry
example (hK : IsFunctionField k K) (D : Divisor k K) (hD : Divisor.degree D < 0) :
    (RRComputation k K hK D).size = 0 := by sorry
/-- Omitted finite presentation: the cusp order k[t²,t³] omits its integral element t. -/
example : Polynomial.X ∉ Algebra.adjoin (ZMod 5)
    ({Polynomial.X ^ 2, Polynomial.X ^ 3} : Set (Polynomial (ZMod 5))) := by sorry
end RRComputation

abbrev CompletedPlace (v : Place k K) := v.valuation.Completion

def localIntegers (v : Place k K) : Subring (CompletedPlace k K v) :=
  (Valued.v : Valuation (CompletedPlace k K v) ℤᵐ⁰).integer

def completionEmbedding (v : Place k K) : K →+* CompletedPlace k K v := by sorry

/-- All projective places, including the infinity places of every affine presentation. -/
abbrev FullAdeles := RestrictedProduct (fun v : Place k K => CompletedPlace k K v)
  (fun v => (localIntegers k K v : Set (CompletedPlace k K v))) Filter.cofinite

namespace FullAdeles
variable {k K}
def diagonal (hK : IsFunctionField k K) : K →+* FullAdeles k K := by sorry

def integral : Subring (FullAdeles k K) := by sorry

theorem integral_iff (a : FullAdeles k K) :
    a ∈ integral ↔ ∀ v, a v ∈ localIntegers k K v := by sorry

def repartitionMap : repartitionSpace k K →+ FullAdeles k K := by sorry

theorem repartition_dense : DenseRange (repartitionMap (k := k) (K := K)) := by sorry

theorem p1_infinity_present :
    ∃ a : FullAdeles k (RatFunc k), a (Place.infty k) ≠ 0 ∧
      ∀ v, v ≠ Place.infty k → a v = 0 := by sorry

theorem finite_support (a : ∀ v : Place k K, CompletedPlace k K v)
    (ha : {v | a v ≠ 0}.Finite) : ∃ b : FullAdeles k K, ∀ v, b v = a v := by sorry

theorem diagonal_product (hK : IsFunctionField k K) (x y : K) :
    diagonal hK (x * y) = diagonal hK x * diagonal hK y := by sorry
example : ∃ a : FullAdeles k (RatFunc k), a (Place.infty k) ≠ 0 ∧
    ∀ v, v ≠ Place.infty k → a v = 0 := by sorry
example (a : ∀ v : Place k K, CompletedPlace k K v)
    (ha : {v | a v ≠ 0}.Finite) : ∃ b : FullAdeles k K, ∀ v, b v = a v := by sorry
example (hK : IsFunctionField k K) (x y : K) :
    diagonal hK (x * y) = diagonal hK x * diagonal hK y := by sorry
end FullAdeles

/-- Integral units almost everywhere: both the value and inverse must be integral. -/
abbrev FullIdeles := RestrictedProduct (fun v : Place k K => (CompletedPlace k K v)ˣ)
  (fun v => ((Submonoid.ofClass (localIntegers k K v)).units :
    Set (CompletedPlace k K v)ˣ)) Filter.cofinite

instance fullIdelesCommGroup : CommGroup (FullIdeles k K) := inferInstance

namespace FullIdeles
variable {k K}
def units_equiv : FullIdeles k K ≃* (FullAdeles k K)ˣ :=
  (RestrictedProduct.unitsEquiv (fun v : Place k K => CompletedPlace k K v)).symm

def divisor : FullIdeles k K →* Multiplicative (Divisor k K) := by sorry

def diagonal (hK : IsFunctionField k K) : Kˣ →* FullIdeles k K := by sorry

/-- Single-place idele with specified local unit. -/
def atPlace (v : Place k K) (u : (CompletedPlace k K v)ˣ) : FullIdeles k K := by sorry

theorem uniformizer_degree (v : Place k K) (u : (CompletedPlace k K v)ˣ)
    (hu : Valued.v (u : CompletedPlace k K v) = WithZero.exp (-1 : ℤ)) :
    -Divisor.degree (Multiplicative.toAdd (divisor (atPlace v u))) = -(v.degree : ℤ) := by sorry

theorem principal_degree_zero (hK : IsFunctionField k K) (f : Kˣ) :
    Divisor.degree (Multiplicative.toAdd (divisor (diagonal hK f))) = 0 := by sorry

theorem inverse_integrality (a : ∀ v : Place k K, (CompletedPlace k K v)ˣ) :
    (∃ b : FullIdeles k K, ∀ v, b v = a v) ↔
      ∀ᶠ v in Filter.cofinite,
        (a v : CompletedPlace k K v) ∈ localIntegers k K v ∧
        ((a v)⁻¹ : (CompletedPlace k K v)ˣ).val ∈ localIntegers k K v := by sorry
example (v : Place k K) (u : (CompletedPlace k K v)ˣ)
    (hu : Valued.v (u : CompletedPlace k K v) = WithZero.exp (-1 : ℤ)) :
    -Divisor.degree (Multiplicative.toAdd (divisor (atPlace v u))) = -(v.degree : ℤ) := by sorry
example (hK : IsFunctionField k K) (f : Kˣ) :
    Divisor.degree (Multiplicative.toAdd (divisor (diagonal hK f))) = 0 := by sorry
example (a : ∀ v : Place k K, (CompletedPlace k K v)ˣ)
    (ha : ¬ ∀ᶠ v in Filter.cofinite, ((a v)⁻¹ : (CompletedPlace k K v)ˣ).val ∈
      localIntegers k K v) : ¬ ∃ b : FullIdeles k K, ∀ v, b v = a v := by sorry
end FullIdeles

abbrev IdeleClass (hK : IsFunctionField k K) :=
  FullIdeles k K ⧸ (FullIdeles.diagonal hK).range

instance ideleClassCommGroup (hK : IsFunctionField k K) : CommGroup (IdeleClass k K hK) :=
  QuotientGroup.Quotient.commGroup (FullIdeles.diagonal hK).range
namespace IdeleClass
variable {k K}
def yuDegree (hK : IsFunctionField k K) : IdeleClass k K hK →* Multiplicative ℤ := by sorry
end IdeleClass

/-- The topological compactness statements and divisor-class comparison are in the reader. -/
theorem idele_divisor_exact_sequence (hK : IsFunctionField k K) :
    Function.Surjective (FullIdeles.divisor (k := k) (K := K)) := by sorry

/-- Discrete and cocompact diagonal; cocompactness is represented by a compact set of translates
because the quotient-topology instance is not yet imported from the planned additive adapter. -/
theorem additive_diagonal_lattice [Finite k] (hK : IsFunctionField k K) :
    IsDiscrete (Set.range (FullAdeles.diagonal hK)) ∧
    ∃ S : Set (FullAdeles k K), IsCompact S ∧
      ∀ a, ∃ x : K, ∃ b ∈ S, a = FullAdeles.diagonal hK x + b := by sorry

abbrev WeilDifferential := ↥(weilDifferentialSpace k K)

/-- This extends the native local component continuously, with values in the finite constants.
The local k-algebra completion instance is not at the pin, hence an additive map is prototyped. -/
def CompletedResidue (ω : WeilDifferential k K) (v : Place k K) :
    CompletedPlace k K v →+ k := by sorry

namespace CompletedResidue
variable {k K}
/-- Comparison to the pinned local component, not an arbitrary proposed residue value. -/
theorem on_field (ω : WeilDifferential k K) (v : Place k K) (x : K) :
    CompletedResidue k K ω v (completionEmbedding k K v x) =
      repartitionDualComponent ω.val v x := by sorry

theorem diagonal_zero (hK : IsFunctionField k K) (ω : WeilDifferential k K) (x : K) :
    ∃ S : Finset (Place k K),
      (∀ v, v ∉ S → CompletedResidue k K ω v (completionEmbedding k K v x) = 0) ∧
      ∑ v ∈ S, CompletedResidue k K ω v (completionEmbedding k K v x) = 0 := by sorry
/-- The exponent a is ord_v(ω). Omitted: that equation, the explicit local ideal, and
nontriviality of the trace character at the next lattice. The reader states both halves. -/
theorem conductor (ω : WeilDifferential k K) (v : Place k K) (ψ : AddChar k ℂ)
    (a : ℤ) (x : CompletedPlace k K v)
    (hx : Valued.v x ≤ WithZero.exp a) : ψ (CompletedResidue k K ω v x) = 1 := by sorry

def zeroPlace : Place k (RatFunc k) := Place.adicOfIrreducible (irreducible_X_sub_C (0 : k))
def dt : WeilDifferential k (RatFunc k) :=
  ⟨ratFuncWeilDifferential k, ratFuncWeilDifferential_mem k⟩

theorem simple_pole : CompletedResidue k (RatFunc k) (dt (k := k)) (zeroPlace (k := k))
    (completionEmbedding k (RatFunc k) (zeroPlace (k := k)) RatFunc.X⁻¹) = 1 := by sorry

theorem regular_zero (x : CompletedPlace k (RatFunc k) (zeroPlace (k := k)))
    (hx : x ∈ localIntegers k (RatFunc k) (zeroPlace (k := k))) :
    CompletedResidue k (RatFunc k) (dt (k := k)) (zeroPlace (k := k)) x = 0 := by sorry

theorem global_cancel :
    CompletedResidue k (RatFunc k) (dt (k := k)) (zeroPlace (k := k))
      (completionEmbedding k (RatFunc k) (zeroPlace (k := k)) RatFunc.X⁻¹) +
    CompletedResidue k (RatFunc k) (dt (k := k)) (Place.infty k)
      (completionEmbedding k (RatFunc k) (Place.infty k) RatFunc.X⁻¹) = 0 := by sorry
example : CompletedResidue k (RatFunc k) (dt (k := k)) (zeroPlace (k := k))
    (completionEmbedding k (RatFunc k) (zeroPlace (k := k)) RatFunc.X⁻¹) = 1 := by sorry
example (x : CompletedPlace k (RatFunc k) (zeroPlace (k := k)))
    (hx : x ∈ localIntegers k (RatFunc k) (zeroPlace (k := k))) :
    CompletedResidue k (RatFunc k) (dt (k := k)) (zeroPlace (k := k)) x = 0 := by sorry
example :
    CompletedResidue k (RatFunc k) (dt (k := k)) (zeroPlace (k := k))
      (completionEmbedding k (RatFunc k) (zeroPlace (k := k)) RatFunc.X⁻¹) +
    CompletedResidue k (RatFunc k) (dt (k := k)) (Place.infty k)
      (completionEmbedding k (RatFunc k) (Place.infty k) RatFunc.X⁻¹) = 0 := by sorry
end CompletedResidue

/-- ψ is the nontrivial finite-field trace character fixed in the reader. -/
def DifferentialCharacter (ω : WeilDifferential k K) (ψ : AddChar k ℂ) :
    AddChar (FullAdeles k K) ℂ := by sorry

namespace DifferentialCharacter
variable {k K}
theorem add (ω : WeilDifferential k K) (ψ : AddChar k ℂ) (a b : FullAdeles k K) :
    DifferentialCharacter k K ω ψ (a + b) =
      DifferentialCharacter k K ω ψ a * DifferentialCharacter k K ω ψ b := by sorry

theorem annihilator_diagonal [Finite k] (hK : IsFunctionField k K)
    (hex : IsIntegrallyClosedIn k K) (ω : WeilDifferential k K) (hω : ω ≠ 0)
    (ψ : AddChar k ℂ) (hψ : ψ ≠ 1) (a : FullAdeles k K) :
    (∀ x : K, DifferentialCharacter k K ω ψ (a * FullAdeles.diagonal hK x) = 1) ↔
      a ∈ Set.range (FullAdeles.diagonal hK) := by sorry

def multiplyDifferential (hK : IsFunctionField k K) (f : K) (ω : WeilDifferential k K) :
    WeilDifferential k K := weilDifferentialSpaceMul hK f ω

theorem change_differential (hK : IsFunctionField k K) (ω : WeilDifferential k K)
    (ψ : AddChar k ℂ) (f : Kˣ) (a : FullAdeles k K) :
    DifferentialCharacter k K (multiplyDifferential hK f ω) ψ a =
      DifferentialCharacter k K ω ψ (FullAdeles.diagonal hK f * a) := by sorry

theorem zero_one (ω : WeilDifferential k K) (ψ : AddChar k ℂ) :
    DifferentialCharacter k K ω ψ 0 = 1 := by sorry
/-- s has X⁻¹ at zero and zero elsewhere; those coordinate conditions are stated explicitly. -/
theorem p1_residue (ψ : AddChar k ℂ) (s : FullAdeles k (RatFunc k))
    (h0 : s (CompletedResidue.zeroPlace (k := k)) = completionEmbedding k (RatFunc k)
      (CompletedResidue.zeroPlace (k := k)) RatFunc.X⁻¹)
    (hv : ∀ v, v ≠ CompletedResidue.zeroPlace (k := k) → s v = 0) :
    DifferentialCharacter k (RatFunc k) (CompletedResidue.dt (k := k)) ψ s = ψ 1 := by sorry

theorem nonprime_trace_kernel [Finite k] (p : ℕ) [Fact p.Prime] [CharP k p]
    (h : p < Nat.card k) (ψ : AddChar k ℂ) : ¬ Function.Injective ψ := by sorry
example (ω : WeilDifferential k K) (ψ : AddChar k ℂ) :
    DifferentialCharacter k K ω ψ 0 = 1 := by sorry
example (ψ : AddChar k ℂ) (s : FullAdeles k (RatFunc k))
    (h0 : s (CompletedResidue.zeroPlace (k := k)) = completionEmbedding k (RatFunc k)
      (CompletedResidue.zeroPlace (k := k)) RatFunc.X⁻¹)
    (hv : ∀ v, v ≠ CompletedResidue.zeroPlace (k := k) → s v = 0) :
    DifferentialCharacter k (RatFunc k) (CompletedResidue.dt (k := k)) ψ s = ψ 1 := by sorry
example [Finite k] (p : ℕ) [Fact p.Prime] [CharP k p] (h : p < Nat.card k)
    (ψ : AddChar k ℂ) : ¬ Function.Injective ψ := by sorry
end DifferentialCharacter

local instance constantsTopology : TopologicalSpace k := ⊥
local instance adeleMeasurable : MeasurableSpace (FullAdeles k K) := borel _

/-- Existence and the Fourier inversion normalization are specified in FA.2. -/
def SelfDualHaar (ω : WeilDifferential k K) (ψ : AddChar k ℂ) :
    Measure (FullAdeles k K) := by sorry

def completedLattice (D : Divisor k K) : Set (FullAdeles k K) :=
  {a | ∀ v, Valued.v (a v) ≤ WithZero.exp (D v)}

namespace SelfDualHaar
variable {k K}
theorem integral_volume [Finite k] (hK : IsFunctionField k K)
    (hex : IsIntegrallyClosedIn k K) (ω : WeilDifferential k K) (hω : ω ≠ 0)
    (ψ : AddChar k ℂ) (hψ : ψ ≠ 1) :
    SelfDualHaar k K ω ψ (↑(FullAdeles.integral (k := k) (K := K)) : Set (FullAdeles k K)) =
      ENNReal.ofReal ((Nat.card k : ℝ) ^ (1 - (genus k K : ℤ))) := by sorry

theorem divisor_volume [Finite k] (hK : IsFunctionField k K)
    (hex : IsIntegrallyClosedIn k K) (ω : WeilDifferential k K) (hω : ω ≠ 0)
    (ψ : AddChar k ℂ) (hψ : ψ ≠ 1) (D : Divisor k K) :
    SelfDualHaar k K ω ψ (completedLattice k K D) =
      ENNReal.ofReal ((Nat.card k : ℝ) ^ (Divisor.degree D + 1 - (genus k K : ℤ))) := by sorry

theorem change_differential (hK : IsFunctionField k K) (ω : WeilDifferential k K)
    (hω : ω ≠ 0) (ψ : AddChar k ℂ) (hψ : ψ ≠ 1) (f : Kˣ) :
    SelfDualHaar k K (DifferentialCharacter.multiplyDifferential hK f ω) ψ =
      SelfDualHaar k K ω ψ := by sorry

theorem p1_integral [Finite k] (ψ : AddChar k ℂ) (hψ : ψ ≠ 1) :
    SelfDualHaar k (RatFunc k) (CompletedResidue.dt (k := k)) ψ
      (↑(FullAdeles.integral (k := k) (K := RatFunc k)) : Set (FullAdeles k (RatFunc k))) = Nat.card k := by sorry
/-- Scalar local-volume test, whose O_v normalization is imported from AA.0. -/
theorem local_order_two (Q : ℝ) (hQ : 0 < Q) : Q ^ (-(2 : ℝ) / 2) = Q⁻¹ := by sorry

theorem principal_change (hK : IsFunctionField k (RatFunc k))
    (ψ : AddChar k ℂ) (hψ : ψ ≠ 1) (t : (RatFunc k)ˣ) :
    SelfDualHaar k (RatFunc k) (DifferentialCharacter.multiplyDifferential hK t
      (CompletedResidue.dt (k := k))) ψ =
      SelfDualHaar k (RatFunc k) (CompletedResidue.dt (k := k)) ψ := by sorry
example [Finite k] (ψ : AddChar k ℂ) (hψ : ψ ≠ 1) :
    SelfDualHaar k (RatFunc k) (CompletedResidue.dt (k := k)) ψ
      (↑(FullAdeles.integral (k := k) (K := RatFunc k)) : Set (FullAdeles k (RatFunc k))) = Nat.card k := by sorry
example (Q : ℝ) (hQ : 0 < Q) : Q ^ (-(2 : ℝ) / 2) = Q⁻¹ := by sorry
example (hK : IsFunctionField k (RatFunc k)) (ψ : AddChar k ℂ) (hψ : ψ ≠ 1)
    (t : (RatFunc k)ˣ) :
    SelfDualHaar k (RatFunc k) (DifferentialCharacter.multiplyDifferential hK t
      (CompletedResidue.dt (k := k))) ψ =
      SelfDualHaar k (RatFunc k) (CompletedResidue.dt (k := k)) ψ := by sorry
end SelfDualHaar

/-- Omitted locally constant compact support interface: BS is the actual subtype below. -/
abbrev BruhatSchwartz := {f : LocallyConstant (FullAdeles k K) ℂ // HasCompactSupport f}

def Fourier (ω : WeilDifferential k K) (ψ : AddChar k ℂ)
    (f : BruhatSchwartz k K) (b : FullAdeles k K) : ℂ :=
  ∫ a, f.val a * DifferentialCharacter k K ω ψ (a * b) ∂SelfDualHaar k K ω ψ

theorem adelic_poisson [Finite k] (hK : IsFunctionField k K)
    (hex : IsIntegrallyClosedIn k K) (ω : WeilDifferential k K) (hω : ω ≠ 0)
    (ψ : AddChar k ℂ) (hψ : ψ ≠ 1) (f : BruhatSchwartz k K) :
    ∑' x : K, f.val (FullAdeles.diagonal hK x) =
      ∑' x : K, Fourier k K ω ψ f (FullAdeles.diagonal hK x) := by sorry
end Curves

section Witt
variable (p n : ℕ) [Fact p.Prime] (F : Type*) [Field F] [CharP F p]

/-- Imported ramification/different theory is not restated. This prototype fixes separation
from inseparable maps: ASW equations have derivative −1 in their length-one equation. -/
theorem ramification_import_contract :
    Polynomial.derivative (X ^ p - X : F[X]) = -1 := by sorry

namespace ASW
/-- Descended Witt Frobenius minus the identity, for native Witt addition. -/
def wp : TruncatedWittVector p n F →+ TruncatedWittVector p n F := by sorry
end ASW

abbrev ASW := TruncatedWittVector p n F ⧸ (ASW.wp p n F).range

namespace ASW
variable {p n F}
/-- Attached subfield generated by a solution, in one fixed algebraic closure. -/
def extension (c : ASW p n F) : IntermediateField F (AlgebraicClosure F) := by sorry

theorem order_degree (c : ASW p n F) :
    Module.finrank F (extension c) = addOrderOf c := by sorry

theorem same_field (a b : ASW p n F) :
    extension a = extension b ↔ AddSubgroup.zmultiples a = AddSubgroup.zmultiples b := by sorry

/-- For a place completion, use its canonical ring embedding here; no injectivity is claimed. -/
def completion {E : Type*} [Field E] [CharP E p] (i : F →+* E) :
    ASW p n F →+ ASW p n E := by sorry

theorem length_zero : Subsingleton (ASW p 0 F) := by sorry

theorem coboundary_trivial (b : TruncatedWittVector p n F) :
    (QuotientAddGroup.mk ((wp p n F) b) : ASW p n F) = 0 := by sorry

theorem unit_multiple (c : ASW p n F) (u : ℤ) (hu : IsCoprime u (p ^ n : ℤ)) :
    extension (u • c) = extension c := by sorry
example : Subsingleton (ASW p 0 F) := by sorry
example (b : TruncatedWittVector p n F) :
    (QuotientAddGroup.mk ((wp p n F) b) : ASW p n F) = 0 := by sorry
example (c : ASW p n F) (u : ℤ) (hu : IsCoprime u (p ^ n : ℤ)) :
    extension (u • c) = extension c := by sorry
end ASW
end Witt

section ReducedWitt
variable (p n : ℕ) [Fact p.Prime] (k : Type*) [Field k] [CharP k p]

/-- Finite-length specialization of the reduced local representative. β and the uniformizer
are choices outside this structure; the constant part is its Z/p^n coefficient on β. -/
structure ReducedWittData where
  constant : ZMod (p ^ n)
  poles : ℕ →₀ TruncatedWittVector p n k
  positive : ∀ i ∈ poles.support, 0 < i
  primeToP : ∀ i ∈ poles.support, ¬ p ∣ i

namespace ReducedWittData
variable {p n k}
/-- Omitted: β has nonzero finite-field trace. T is the native Laurent-series parameter. -/
def «class» (β : k) (d : ReducedWittData p n k) : ASW p n (LaurentSeries k) := by sorry

/-- The p-adic divisibility depth is capped at n; zero has depth n. -/
def pDepth (c : TruncatedWittVector p n k) : ℕ := by sorry

def conductor (d : ReducedWittData p n k) : ℕ := by
  classical
  exact if d.poles = 0 then 0 else
    1 + d.poles.support.sup (fun i => i * p ^ (n - 1 - pDepth (d.poles i)))

/-- Omitted: k is finite, n>0, and Tr(β)≠0; the latter uses the FF trace interface. -/
theorem unique [Finite k] (hn : 0 < n) (β : k)
    (d e : ReducedWittData p n k) (h : d.class β = e.class β) : d = e := by sorry

theorem constant_unramified (d : ReducedWittData p n k) (hd : d.poles = 0) :
    d.conductor = 0 := by sorry

theorem one_pole (m : ℕ) (hm : 0 < m) (hp : ¬ p ∣ m)
    (c : TruncatedWittVector p 1 k) (hc : c ≠ 0)
    (d : ReducedWittData p 1 k) (hd : d.poles = Finsupp.single m c) :
    d.conductor = m + 1 := by sorry

theorem length_two (m : ℕ) (hm : 0 < m) (hp : ¬ p ∣ m)
    (c : TruncatedWittVector p 2 k) (hc : c ≠ 0)
    (d : ReducedWittData p 2 k) (hd : d.poles = Finsupp.single m c) :
    (pDepth c = 1 → d.conductor = m + 1) ∧
    (pDepth c = 0 → d.conductor = p * m + 1) := by sorry
example (d : ReducedWittData p n k) (hd : d.poles = 0) : d.conductor = 0 := by sorry
example (m : ℕ) (hm : 0 < m) (hp : ¬ p ∣ m) (c : TruncatedWittVector p 1 k)
    (hc : c ≠ 0) (d : ReducedWittData p 1 k) (hd : d.poles = Finsupp.single m c) :
    d.conductor = m + 1 := by sorry
example (m : ℕ) (hm : 0 < m) (hp : ¬ p ∣ m) (c : TruncatedWittVector p 2 k)
    (hc : c ≠ 0) (d : ReducedWittData p 2 k) (hd : d.poles = Finsupp.single m c) :
    (pDepth c = 1 → d.conductor = m + 1) ∧
    (pDepth c = 0 → d.conductor = p * m + 1) := by sorry
end ReducedWittData
end ReducedWitt

/-- FA.3 polynomial model x=1/t: one point above x=∞ and three above x=0;
other x give no F3 point. This exchanges the t=0 and t=∞ fibers.
The Hurwitz genus and resulting zeta numerator are stated in the reader, not encoded here. -/
theorem wild_cover_example :
    Nat.card {xy : ZMod 3 × ZMod 3 | xy.2 ^ 3 - xy.2 = xy.1 ^ 2} + 1 = 4 := by sorry

section LocalExistence
variable (k : Type*) [Field k] [Finite k]

/-- Equal-characteristic Lubin–Tate specialization, with O=k[[T]] and f=TX+X^Q.
The commutative law is a native FormalGroup, not a predicate standing in for a law. -/
def EqualCharLT : FormalGroup (PowerSeries k) := by sorry

namespace EqualCharLT
variable {k}
/-- The named API contains the commutativity condition on the actual law. -/
theorem formalGroup : (EqualCharLT k).IsComm := by sorry

def torsionField (m : ℕ) : IntermediateField (LaurentSeries k)
    (AlgebraicClosure (LaurentSeries k)) := by sorry

theorem torsion_degree (m : ℕ) (hm : 0 < m) :
    Module.finrank (LaurentSeries k) (torsionField (k := k) m) =
      (Nat.card k - 1) * Nat.card k ^ (m - 1) := by sorry

/-- Omitted topological/formal-point evaluation interface; this quotient is the actual ring.
The torsion action, not just group order, fixes the intended equivalence. -/
def torsion_galois (m : ℕ) (hm : 0 < m) :
    ((torsionField (k := k) m) ≃ₐ[LaurentSeries k] (torsionField (k := k) m)) ≃*
      (PowerSeries k ⧸ Ideal.span ({PowerSeries.X ^ m} : Set (PowerSeries k)))ˣ := by sorry

theorem first_layer :
    Module.finrank (LaurentSeries k) (torsionField (k := k) 1) = Nat.card k - 1 := by sorry

theorem binary_first_layer :
    Module.finrank (LaurentSeries (ZMod 2)) (torsionField (k := ZMod 2) 1) = 1 ∧
    Module.finrank (LaurentSeries (ZMod 2)) (torsionField (k := ZMod 2) 2) = 2 := by sorry

theorem p_primary_growth (m : ℕ) (hm : 2 ≤ m) :
    Nat.card k ∣ Module.finrank (LaurentSeries k) (torsionField (k := k) m) := by sorry
example : Module.finrank (LaurentSeries k) (torsionField (k := k) 1) = Nat.card k - 1 := by sorry
example :
    Module.finrank (LaurentSeries (ZMod 2)) (torsionField (k := ZMod 2) 1) = 1 ∧
    Module.finrank (LaurentSeries (ZMod 2)) (torsionField (k := ZMod 2) 2) = 2 := by sorry
example (m : ℕ) (hm : 2 ≤ m) :
    Nat.card k ∣ Module.finrank (LaurentSeries k) (torsionField (k := k) m) := by sorry
end EqualCharLT

/-- Norm subgroup in the multiplicative group, not a Prop-valued stand-in for an extension. -/
def localNormSubgroup (E : IntermediateField (LaurentSeries k)
    (AlgebraicClosure (LaurentSeries k))) : Subgroup (LaurentSeries k)ˣ := by sorry

/-- Topology of the norm groups and the existence/classification comparison are not yet native.
Omitted: H is open. The finite-index, Galois and abelian conditions are explicit. -/
theorem local_abelian_existence (H : Subgroup (LaurentSeries k)ˣ)
    (hH : Finite ((LaurentSeries k)ˣ ⧸ H)) :
    ∃ E : IntermediateField (LaurentSeries k) (AlgebraicClosure (LaurentSeries k)),
      FiniteDimensional (LaurentSeries k) E ∧ IsGalois (LaurentSeries k) E ∧
      (∀ σ τ : E ≃ₐ[LaurentSeries k] E, σ * τ = τ * σ) ∧ localNormSubgroup k E = H := by sorry

/-- Omitted Artin action and Schmid–Witt residue-symbol interfaces. The comparison is an
actual character on local units attached to an ASW class, not a claimed generic CFT.8 result. -/
def schmidWittCharacter (p n : ℕ) [Fact p.Prime] [CharP k p]
    (c : ASW p n (LaurentSeries k)) : (LaurentSeries k)ˣ →* Multiplicative (ZMod (p ^ n)) := by sorry

theorem schmid_witt_artin_comparison (p n : ℕ) [Fact p.Prime] [CharP k p]
    (c : ASW p n (LaurentSeries k)) :
    (schmidWittCharacter k p n c).ker = localNormSubgroup k (ASW.extension c) := by sorry
end LocalExistence

section GlobalExistence
variable (k K : Type*) [Field k] [Finite k] [Field K] [Algebra k K]
variable (hK : IsFunctionField k K)

/-- Field norm on projective idele classes. Existence and locality of this map are FA.4 targets. -/
def globalNormSubgroup (E : IntermediateField K (AlgebraicClosure K)) :
    Subgroup (IdeleClass k K hK) := by sorry

/-- Prototype cyclic norm-index consequence of the class formation. Omitted: E/K cyclic;
Tate cohomology/formation data are imported from CFT.1–CFT.4, and Milne A.7–A.11 verifies their
function-field hypotheses independently of the geometric existence theorem. -/
theorem function_field_class_formation (E : IntermediateField K (AlgebraicClosure K))
    [FiniteDimensional K E] [IsGalois K E] :
    Nat.card (IdeleClass k K hK ⧸ globalNormSubgroup k K hK E) = Module.finrank K E := by sorry

/-- Omitted: the Artin normalization/mapping on unramified uniformizers; E/K is abelian. -/
def global_artin_norm_isomorphism (E : IntermediateField K (AlgebraicClosure K))
    [FiniteDimensional K E] [IsGalois K E] :
    (IdeleClass k K hK ⧸ globalNormSubgroup k K hK E) ≃* (E ≃ₐ[K] E) := by sorry

/-- FA.5, placed here to exhibit the acyclic dependency: exact constants and the all-extension
Weil estimate, not FA.4 existence, supply the degree-one divisor. -/
theorem schmidt_degree_one (hex : IsIntegrallyClosedIn k K) :
    ∃ D : Divisor k K, Divisor.degree D = 1 := by sorry

/-- For m effective, this is ∏U_v^{m_v}, with U_v^0=O_v×. -/
def rayUnits (m : Divisor k K) : Subgroup (FullIdeles k K) := by sorry

abbrev RayClass (m : Divisor k K) :=
  FullIdeles k K ⧸ ((FullIdeles.diagonal hK).range ⊔ rayUnits k K m)

instance rayClassCommGroup (m : Divisor k K) : CommGroup (RayClass k K hK m) :=
  QuotientGroup.Quotient.commGroup ((FullIdeles.diagonal hK).range ⊔ rayUnits k K m)

namespace RayClass
variable {k K hK}
def degree (m : Divisor k K) (hm : 0 ≤ m) : RayClass k K hK m →* Multiplicative ℤ := by sorry

/-- Omitted: Jm is the k-points of the generalized Picard group for m. -/
theorem degree_exact (hex : IsIntegrallyClosedIn k K) (m : Divisor k K) (hm : 0 ≤ m)
    (Jm : Type*) [CommGroup Jm] :
    Nonempty (Jm ≃* (degree (hK := hK) m hm).ker) ∧ Function.Surjective (degree (hK := hK) m hm) := by sorry

def modulus_map (m m' : Divisor k K) (hm : 0 ≤ m) (hle : m ≤ m') :
    RayClass k K hK m' →* RayClass k K hK m := by sorry

theorem finite_quotient (hex : IsIntegrallyClosedIn k K) (m : Divisor k K) (hm : 0 ≤ m)
    (r : ℕ) (hr : 0 < r) (a : RayClass k K hK m)
    (ha : Multiplicative.toAdd (degree m hm a) = r) :
    Finite (RayClass k K hK m ⧸ Subgroup.zpowers a) := by sorry

def p1_zero (h : IsFunctionField k (RatFunc k)) :
    RayClass k (RatFunc k) h 0 ≃* Multiplicative ℤ := by sorry

theorem degree_not_finite (hex : IsIntegrallyClosedIn k K) :
    ¬ Finite (RayClass k K hK 0) := by sorry

/-- Constant-only quotient is the degree character modulo r, separate from geometric rays. -/
def constants_degree_r (r : ℕ) (hr : 0 < r) :
    (Multiplicative ℤ ⧸ Subgroup.zpowers (Multiplicative.ofAdd (r : ℤ))) ≃*
      Multiplicative (ZMod r) := by sorry
example (h : IsFunctionField k (RatFunc k)) :
    Nonempty (RayClass k (RatFunc k) h 0 ≃* Multiplicative ℤ) := by sorry
example (hex : IsIntegrallyClosedIn k K) : ¬ Finite (RayClass k K hK 0) := by sorry
example (r : ℕ) (hr : 0 < r) :
    Nonempty ((Multiplicative ℤ ⧸ Subgroup.zpowers (Multiplicative.ofAdd (r : ℤ))) ≃*
      Multiplicative (ZMod r)) := by sorry
end RayClass

/-- Omitted: H is open in the actual idele-class topology. The geometric Lang-ray existence
proof is the explicitly recorded GEO-RAY boundary, not assumed from ADT Appendix A. -/
theorem global_abelian_existence (hex : IsIntegrallyClosedIn k K)
    (H : Subgroup (IdeleClass k K hK)) (hH : Finite (IdeleClass k K hK ⧸ H)) :
    ∃ E : IntermediateField K (AlgebraicClosure K),
      FiniteDimensional K E ∧ IsGalois K E ∧
      (∀ σ τ : E ≃ₐ[K] E, σ * τ = τ * σ) ∧ globalNormSubgroup k K hK E = H := by sorry

/-- Finite quotient compatibility suggests the profinite completion isomorphism. Omitted:
GalAb is the maximal abelian Galois group, and the inverse limit runs over all open finite-index
subgroups. A plain discrete idele class group is never claimed isomorphic to that profinite group. -/
def profinite_reciprocity (GalAb : Type*) [CommGroup GalAb]
    (ι : Type*) (H : ι → Subgroup (IdeleClass k K hK))
    (limit : Subgroup (∀ i, IdeleClass k K hK ⧸ H i)) : limit ≃* GalAb := by sorry
end GlobalExistence

section Zeta
variable (k K : Type*) [Field k] [Field K] [Algebra k K]

/-- Coefficients count effective projective divisors. Native finiteness makes them finite. -/
def CurveZeta : PowerSeries ℤ :=
  PowerSeries.mk (fun n => (Nat.card {D : Divisor k K // 0 ≤ D ∧ Divisor.degree D = n} : ℤ))

/-- Extension-field point counts reconstructed from closed-point degrees. -/
def curvePointCount (r : ℕ) : ℕ :=
  ∑ d ∈ r.divisors, d * Nat.card {v : Place k K // v.degree = d}

/-- Product of the geometric series at the places of degree ≤N, truncated after N.
The finite-place enumerator is a supplier interface, so its implementation is omitted. -/
def truncatedEulerProduct (_k _K : Type*) (N : ℕ) : Polynomial ℤ := by sorry

namespace CurveZeta
variable {k K}
theorem euler [Finite k] (hK : IsFunctionField k K) (N j : ℕ) (hj : j ≤ N) :
    PowerSeries.coeff j (CurveZeta k K) = (truncatedEulerProduct k K N).coeff j := by sorry

/-- Equivalent to the formal logarithmic coefficient N_r/r, without an analytic logarithm. -/
theorem log_counts [Finite k] (hK : IsFunctionField k K) (r : ℕ) (hr : 0 < r) :
    (r : ℤ) * PowerSeries.coeff r (CurveZeta k K) =
      ∑ i ∈ Finset.range r, (curvePointCount k K (i + 1) : ℤ) *
        PowerSeries.coeff (r - i - 1) (CurveZeta k K) := by sorry

/-- Omitted: K1 is the constant-extension function field over k1. -/
theorem constant_extension (k1 K1 : Type*) [Field k1] [Field K1] [Algebra k1 K1]
    (s r : ℕ) (hs : 0 < s) (hr : 0 < r) :
    curvePointCount k1 K1 r = curvePointCount k K (s * r) := by sorry

theorem p1 [Finite k] :
    (CurveZeta k (RatFunc k)) *
      ((1 - PowerSeries.X) * (1 - PowerSeries.C (Nat.card k : ℤ) * PowerSeries.X)) = 1 := by sorry

theorem degree_two (q : ℤ) :
    PowerSeries.coeff 1 (PowerSeries.mk (fun n => if 2 ∣ n then (1 : ℤ) else 0)) = 0 ∧
    PowerSeries.coeff 2 (PowerSeries.mk (fun n => if 2 ∣ n then (1 : ℤ) else 0)) = 1 := by sorry

theorem zero_coefficient : PowerSeries.coeff 0 (CurveZeta k K) = 1 := by sorry
example [Finite k] :
    CurveZeta k (RatFunc k) *
      ((1 - PowerSeries.X) * (1 - PowerSeries.C (Nat.card k : ℤ) * PowerSeries.X)) = 1 := by sorry
example :
    PowerSeries.coeff 1 (PowerSeries.mk (fun n => if 2 ∣ n then (1 : ℤ) else 0)) = 0 ∧
    PowerSeries.coeff 2 (PowerSeries.mk (fun n => if 2 ∣ n then (1 : ℤ) else 0)) = 1 := by sorry
example : PowerSeries.coeff 0 (CurveZeta k K) = 1 := by sorry
end CurveZeta

/-- RR supplies rationality/functional equation; the Weil root bound is a separate WC.5 import. -/
theorem riemann_roch_zeta_rationality [Finite k] (hK : IsFunctionField k K)
    (hex : IsIntegrallyClosedIn k K) :
    ∃ P : Polynomial ℤ, P.coeff 0 = 1 ∧ P.natDegree = 2 * genus k K ∧
      CurveZeta k K * ((1 - PowerSeries.X) *
        (1 - PowerSeries.C (Nat.card k : ℤ) * PowerSeries.X)) = (P : PowerSeries ℤ) ∧
      ∀ j ≤ genus k K,
        P.coeff (2 * genus k K - j) = (Nat.card k : ℤ) ^ (genus k K - j) * P.coeff j := by sorry
end Zeta

section Artin
variable (A : Type*) [Field A]

/-- M is the matrix of geometric Frobenius on the ACTUAL inertia-invariant subspace.
Omitted: the representation-to-matrix adapter; no averaging projector is assumed. -/
def ArtinFactor (d n : ℕ) (M : Matrix (Fin n) (Fin n) A) : Polynomial A :=
  Matrix.det ((1 : Matrix (Fin n) (Fin n) (Polynomial A)) -
    (X ^ d : Polynomial A) • M.map (Polynomial.C : A → Polynomial A))

namespace ArtinFactor
variable {A}
/-- Any two lifts differ by inertia and hence induce the same matrix on invariants. -/
theorem lift_independent (d n : ℕ) (M M' : Matrix (Fin n) (Fin n) A) (h : M = M') :
    ArtinFactor A d n M = ArtinFactor A d n M' := by sorry

theorem direct_sum (d n m : ℕ) (M : Matrix (Fin n) (Fin n) A)
    (N : Matrix (Fin m) (Fin m) A) :
    Matrix.det ((1 : Matrix (Fin n ⊕ Fin m) (Fin n ⊕ Fin m) (Polynomial A)) -
      (X ^ d : Polynomial A) • (Matrix.fromBlocks M 0 0 N).map (Polynomial.C : A → Polynomial A)) =
      ArtinFactor A d n M * ArtinFactor A d m N := by sorry
/-- Inertia triviality makes the invariant-subspace inclusion an isomorphism. -/
theorem unramified (d n : ℕ) (M : Matrix (Fin n) (Fin n) A) :
    ArtinFactor A d n M = Matrix.det ((1 : Matrix (Fin n) (Fin n) (Polynomial A)) -
    (X ^ d : Polynomial A) • M.map (Polynomial.C : A → Polynomial A)) := by sorry

theorem trivial_rank_one (d : ℕ) : ArtinFactor A d 1 1 = 1 - X ^ d := by sorry

theorem no_invariants (d : ℕ) : ArtinFactor A d 0 1 = 1 := by sorry

/-- A characteristic-three order-three unipotent action has a one-dimensional invariant kernel.
Its group order is zero in the coefficients, so dividing the group sum is invalid. -/
theorem modular_inertia :
    (∀ v : Fin 2 → ZMod 3, (!![1, 1; 0, 1] : Matrix (Fin 2) (Fin 2) (ZMod 3)).mulVec v = v ↔
      v 1 = 0) ∧ (3 : ZMod 3) = 0 := by sorry
example (d : ℕ) : ArtinFactor A d 1 1 = 1 - X ^ d := by sorry
example (d : ℕ) : ArtinFactor A d 0 1 = 1 := by sorry
example :
    (∀ v : Fin 2 → ZMod 3, (!![1, 1; 0, 1] : Matrix (Fin 2) (Fin 2) (ZMod 3)).mulVec v = v ↔
      v 1 = 0) ∧ (3 : ZMod 3) = 0 := by sorry
end ArtinFactor

/-- Omitted: finite coefficient field A has characteristic ℓ≠p; L is the Euler product of
j_*ρ on the proper curve, and M_i are geometric-Frobenius matrices on H^i_et(Xbar,j_*ρ).
This uses the EDC.8 torsion trace comparison, including H0/H2, without a characteristic-zero lift. -/
theorem torsion_trace_comparison (L : RatFunc A) (n0 n1 n2 : ℕ)
    (M0 : Matrix (Fin n0) (Fin n0) A) (M1 : Matrix (Fin n1) (Fin n1) A)
    (M2 : Matrix (Fin n2) (Fin n2) A) :
    L = algebraMap (Polynomial A) (RatFunc A) (ArtinFactor A 1 n1 M1) /
      (algebraMap (Polynomial A) (RatFunc A) (ArtinFactor A 1 n0 M0) *
        algebraMap (Polynomial A) (RatFunc A) (ArtinFactor A 1 n2 M2)) := by sorry
end Artin

/-- Omitted: πC(r) counts unramified degree-r places of the specified finite Galois cover,
N is its geometric subgroup, C is one class in the rth constant Frobenius coset, gM/gX its
normalized genera, and R is the sum of ramified degrees. This explicit bound, including its
constant-degree restriction, is proved from Kosters' twists plus the independent all-r Weil bound. -/
theorem degree_sensitive_chebotarev (q h N C gM gX R r πC : ℕ)
    (hq : 1 < q) (hN : 0 < N) (hr : 0 < r) :
    |(r * πC : ℝ) - (C : ℝ) / N * ((q : ℝ) ^ r + 1)| ≤
      (2 * gM + r * (1 + 2 * gX) : ℝ) * (q : ℝ) ^ ((r : ℝ) / 2) + r + R := by sorry

/-- Omitted: PiGroup is the curve's étale fundamental group, E a characteristic-zero ℓ-adic field
with ℓ≠p, the two representations are continuous and semisimple, and S comprises Frobenius
classes outside a finite set. Equality of characteristic polynomials can be represented by
trace equality once characteristic-zero semisimplicity is available. -/
theorem frobenius_semisimple_determination (PiGroup E : Type*) [Group PiGroup] [Field E]
    (n : ℕ) (ρ σ : PiGroup →* Matrix.GeneralLinearGroup (Fin n) E)
    (S : Set PiGroup) (h : ∀ x ∈ S, Matrix.trace (ρ x).val = Matrix.trace (σ x).val) :
    ∃ a : Matrix.GeneralLinearGroup (Fin n) E, ∀ x, σ x = a * ρ x * a⁻¹ := by sorry

section Automorphic
variable (R G : Type*) [CommRing R] [Group G]

/-- Omitted arithmetic interfaces: G=the adelic points of the specified native reductive group,
Γ=its rational points, U=compact open, Ξ=a full central degree lattice, χ descends on Γ∩Ξ.
The defining equivariance equations are actual equations in the function module. -/
def AutomorphicFunctions (Γ U Ξ : Subgroup G) (χ : Ξ →* Rˣ) : Submodule R (G → R) where
  carrier := {f | (∀ γ : Γ, ∀ g, f (γ * g) = f g) ∧
    (∀ u : U, ∀ g, f (g * u) = f g) ∧
    (∀ z : Ξ, ∀ g, f (z * g) = (χ z : R) * f g)}
  zero_mem' := by sorry
  add_mem' := by sorry
  smul_mem' := by sorry

namespace AutomorphicFunctions
variable {R G} (Γ U Ξ : Subgroup G) (χ : Ξ →* Rˣ)
def eval (g : G) : AutomorphicFunctions R G Γ U Ξ χ →ₗ[R] R := by sorry

def level_change (U' : Subgroup G) (h : U' ≤ U) :
    AutomorphicFunctions R G Γ U Ξ χ →ₗ[R] AutomorphicFunctions R G Γ U' Ξ χ := by sorry

/-- Trivial central-character GL₁ comparison; nontrivial characters use equivariant functions
on the same quotient rather than all functions on it. -/
def gl1 {k K : Type*} [Field k] [Field K] [Algebra k K] (hK : IsFunctionField k K)
    (U Ξ : Subgroup (FullIdeles k K)) :
    AutomorphicFunctions R (FullIdeles k K) (FullIdeles.diagonal hK).range U Ξ 1 ≃ₗ[R]
      ((FullIdeles k K ⧸ ((FullIdeles.diagonal hK).range ⊔ U ⊔ Ξ)) → R) := by sorry

theorem gl1_degree {k K : Type*} [Field k] [Finite k] [Field K] [Algebra k K]
    (hK : IsFunctionField k K) (hex : IsIntegrallyClosedIn k K) :
    ¬ Finite (RayClass k K hK 0) := by sorry

theorem p1_degree_mod_r {k : Type*} [Field k] [Finite k]
    (hK : IsFunctionField k (RatFunc k)) (r : ℕ) (hr : 0 < r)
    (a : RayClass k (RatFunc k) hK 0)
    (ha : Multiplicative.toAdd (RayClass.degree (hK := hK) 0 le_rfl a) = r) :
    Nat.card (RayClass k (RatFunc k) hK 0 ⧸ Subgroup.zpowers a) = r := by sorry

theorem incompatible_character (z : Ξ) (hz : (z : G) ∈ Γ) (hχ : IsUnit ((χ z : R) - 1)) :
    AutomorphicFunctions R G Γ U Ξ χ = ⊥ := by sorry
/-- Over a field, χ(z)≠1 is enough; over a ring, χ(z)−1 must act injectively. -/
example {R G : Type*} [Field R] [Group G] (Γ U Ξ : Subgroup G) (χ : Ξ →* Rˣ)
    (z : Ξ) (hz : (z : G) ∈ Γ) (hχ : χ z ≠ 1) :
    AutomorphicFunctions R G Γ U Ξ χ = ⊥ := by sorry
example {k K : Type*} [Field k] [Finite k] [Field K] [Algebra k K]
    (hK : IsFunctionField k K) (hex : IsIntegrallyClosedIn k K) :
    ¬ Finite (RayClass k K hK 0) := by sorry
example {k : Type*} [Field k] [Finite k] (hK : IsFunctionField k (RatFunc k))
    (r : ℕ) (hr : 0 < r) (a : RayClass k (RatFunc k) hK 0)
    (ha : Multiplicative.toAdd (RayClass.degree (hK := hK) 0 le_rfl a) = r) :
    Nat.card (RayClass k (RatFunc k) hK 0 ⧸ Subgroup.zpowers a) = r := by sorry
end AutomorphicFunctions
end Automorphic

section Cusp
variable (R M N ι : Type*) [CommRing R] [AddCommGroup M] [Module R M]
  [AddCommGroup N] [Module R N]

/-- ι indexes ALL proper rational parabolics, and CT is their mass-one finite-average map.
The supplier correspondence from parabolics/unipotent quotients to these maps is omitted. -/
def CuspFunctions (CT : ι → M →ₗ[R] N) : Submodule R M := ⨅ i, (CT i).ker

namespace CuspFunctions
variable {R M N ι}
def constantTerm (B : Type*) [Fintype B] [Invertible (Fintype.card B : R)] :
    (B → R) →ₗ[R] R := by sorry

theorem mem_iff (CT : ι → M →ₗ[R] N) (f : M) :
    f ∈ CuspFunctions R M N ι CT ↔ ∀ i, CT i f = 0 := by sorry

def flat_base_change [Finite ι] (S : Type*) [CommRing S] [Algebra R S] [Module.Flat R S]
    (CT : ι → M →ₗ[R] N) :
    (S ⊗[R] CuspFunctions R M N ι CT) ≃ₗ[S]
      CuspFunctions S (S ⊗[R] M) (S ⊗[R] N) ι (fun i => (CT i).baseChange S) := by sorry

theorem torus (CT : Empty → M →ₗ[R] N) : CuspFunctions R M N Empty CT = ⊤ := by sorry

theorem constant_gl2 (B : Type*) [Fintype B] [Nonempty B]
    [Invertible (Fintype.card B : R)] : constantTerm (R := R) B (fun _ => 1) = 1 := by sorry

theorem average_refinement (B C : Type*) [Fintype B] [Fintype C]
    [Invertible (Fintype.card B : R)] [Invertible (Fintype.card (B × C) : R)]
    (f : B → R) : constantTerm (R := R) (B × C) (fun bc => f bc.1) =
      constantTerm (R := R) B f := by sorry
example (CT : Empty → M →ₗ[R] N) : CuspFunctions R M N Empty CT = ⊤ := by sorry
example (B : Type*) [Fintype B] [Nonempty B] [Invertible (Fintype.card B : R)] :
    constantTerm (R := R) B (fun _ => 1) = 1 := by sorry
example (B C : Type*) [Fintype B] [Fintype C]
    [Invertible (Fintype.card B : R)] [Invertible (Fintype.card (B × C) : R)] (f : B → R) :
    constantTerm (R := R) (B × C) (fun bc => f bc.1) = constantTerm (R := R) B f := by sorry
end CuspFunctions
end Cusp

/-- Omitted arithmetic hypotheses: XU is the level double-coset set for a split semisimple group,
S is the kernel of all proper constant terms. In the reductive extension every central degree
is bounded/quotiented. This expresses the common finite support theorem, stronger than merely
finite dimension. RG-RED is the recorded nonsplit extension boundary. -/
theorem harder_cuspidal_support (XU : Type*) (S : Submodule ℂ (XU → ℂ)) :
    ∃ Z : Finset XU, ∀ f : S, ∀ x, x ∉ Z → f.val x = 0 := by sorry

/-- Omitted: S is the fixed-level cusp submodule of the specified arithmetic quotient with the
common support bound, and R is the stated Noetherian Z[1/p] coefficient model. Tensor comparison
is the CuspFunctions.flat_base_change API, not an assertion for nonflat base change. -/
theorem integral_coefficient_model (R XU : Type*) [CommRing R] [IsNoetherianRing R]
    (S : Submodule R (XU → R)) : Module.Finite R S := by sorry

/-- Omitted: H is the imported integral spherical Hecke algebra with vol(Uv)=1; its local
convolution action is the arithmetic double-coset action on the fixed-level cusp module M.
The normalized Satake/Frobenius comparison additionally chooses qv^(1/2). -/
def function_field_hecke_satake (R H M : Type*) [CommRing R] [Ring H] [Algebra R H]
    [AddCommGroup M] [Module R M] : H →ₐ[R] Module.End R M := by sorry

/-- Omitted: G=GL_n(A_K), S=the irreducible everywhere-spherical cusp representation and φ a
spherical vector. deg is Yu's determinant degree. The full Whittaker reconstruction proof and
scalar-idele correction are specified in the reader; the zero vector is explicitly excluded. -/
theorem yu_degree_zero_nonvanishing (G : Type*) [Group G] (deg : G →* Multiplicative ℤ)
    (φ : G → ℂ) (hφ : φ ≠ 0) : ∃ g, deg g = 1 ∧ φ g ≠ 0 := by sorry

/-- Divisibility of C× extends the unramified character on Pic(X) to Pic(X'). The quadratic
kernel calculation uses FYZ Remark 2.1 and EDC.2; the geometric conditions on Pic/Pic' and f
are omitted until their supplier interfaces exist. -/
theorem unitary_unramified_inducing_character (Pic Pic' : Type*) [CommGroup Pic] [CommGroup Pic']
    (f : Pic →* Pic') (η : Pic →* ℂˣ) (n : ℕ) (hη : f.ker ≤ (η ^ n).ker) :
    ∃ χ : Pic' →* ℂˣ, χ.comp f = η ^ n := by sorry

section Eisenstein
variable (G : Type*) [Group G]

/-- Omitted: G=H_n(A), Γ=H_n(F), P=the rational Siegel parabolic embedded in G,
Φ_s is the unramified section of χ|det|^{s+n/2}. The indexing set is P(F)\H_n(F), with Γ inside the adelic group. Mathlib calls
these right cosets because the parabolic acts by multiplication on the left.
No group structure is imposed on a parabolic coset set. Convergence/continuation belong to AS.1/2. -/
def SiegelEisenstein (Γ : Subgroup G) (P : Subgroup Γ)
    (representative : Quotient (QuotientGroup.rightRel P) → Γ)
    (Φ : ℂ → G → ℂ) (g : G) (s : ℂ) : ℂ :=
  ∑' γ : Quotient (QuotientGroup.rightRel P), Φ s ((representative γ : G) * g)

namespace SiegelEisenstein
variable {G}
/-- Omitted: Φ is the UNIQUE normalized spherical section of the specified induction. -/
theorem section_one (Φ : ℂ → G → ℂ) (s : ℂ) : Φ s 1 = 1 := by sorry
/-- m is m(α)n(b), c=χ(det α), a=|det α|_(F'), with the positive relative adelic norm. -/
theorem parabolic_transform (Φ : ℂ → G → ℂ) (n : ℕ) (m g : G)
    (c : ℂˣ) (a : ℝ) (ha : 0 < a) (s : ℂ) :
    Φ s (m * g) = (c : ℂ) * (a : ℂ) ^ (s + (n : ℂ) / 2) * Φ s g := by sorry
/-- Omitted: γ is rational, representative is a section of the quotient, Φ satisfies its
parabolic transformation and the series converges, or the identity is meromorphically continued. -/
theorem left_rational_invariant (Γ : Subgroup G) (P : Subgroup Γ)
    (representative : Quotient (QuotientGroup.rightRel P) → Γ)
    (Φ : ℂ → G → ℂ) (γ : Γ) (g : G) (s : ℂ) :
    SiegelEisenstein G Γ P representative Φ ((γ : G) * g) s =
      SiegelEisenstein G Γ P representative Φ g s := by sorry

theorem normalized_scalar (Φ : ℂ → G → ℂ) (s c : ℂ)
    (hΦ : Φ s 1 = 1) (hc : c ≠ 1) : c * Φ s 1 ≠ 1 := by sorry
/-- Omitted: u is in the Siegel unipotent radical and Φ is the normalized section. -/
theorem unipotent (Φ : ℂ → G → ℂ) (s : ℂ) (u : G) : Φ s u = 1 := by sorry

theorem center_exponent (a : ℝ) (ha : 1 < a) (n : ℕ) (hn : 0 < n) :
    a ^ ((n : ℝ) / 2) ≠ a ^ (0 : ℝ) := by sorry
example (Φ : ℂ → G → ℂ) (s c : ℂ) (hΦ : Φ s 1 = 1) (hc : c ≠ 1) :
    c * Φ s 1 ≠ 1 := by sorry
example (Φ : ℂ → G → ℂ) (s : ℂ) (u : G) : Φ s u = 1 := by sorry
example (a : ℝ) (ha : 1 < a) (n : ℕ) (hn : 0 < n) : a ^ ((n : ℝ) / 2) ≠ a ^ (0 : ℝ) := by sorry
end SiegelEisenstein
end Eisenstein

section Hermitian
variable (n : ℕ) (N : Type*) [AddCommGroup N] [MeasurableSpace N]

/-- N is the ACTUAL compact unipotent quotient with volume-one measure; E is the restriction
of the Eisenstein series, Ψ the signed differential-valued Hermitian residue character.
The unitary-matrix/scheme interfaces relating these inputs to T are omitted. -/
def HermitianFourier (μ : Measure N) (E : N → ℂ) (Ψ : AddChar N ℂ) : ℂ :=
  ∫ b, E b * Ψ b ∂μ

namespace HermitianFourier
variable {n N}
/-- Omitted: H is Herm_n(F,ω), Characters is the continuous character subgroup of N,
and N=N_n(F)\N_n(A), paired by the signed global residue of matrix trace. -/
def dual (H : Type*) [AddCommGroup H] (Characters : Subgroup (AddChar N ℂ)) :
    H ≃+ Additive Characters := by sorry

/-- ET is E_T(m(α)g,s), ET' is E_(αbar^t T α)(g,s), c=χ(det αbar), a=|det α|. -/
theorem levi_covariance (ET ET' : ℂ) (c : ℂˣ) (a : ℝ) (ha : 0 < a) (s : ℂ) :
    ET = (c : ℂ)⁻¹ * (a : ℂ) ^ (-s + (n : ℂ) / 2) * ET' := by sorry
/-- Omitted: ET is the nonsingular coefficient, W are its local Whittaker functions at s.
A tprod is used for the convergent-region product; meromorphic continuation is in AS.2. -/
theorem nonsingular_product (q : ℝ) (hq : 1 < q) (g : ℕ) (ET : ℂ)
    (ι : Type*) (W : ι → ℂ) :
    ET = (q : ℂ) ^ (-(n : ℂ) ^ 2 * ((g : ℂ) - 1)) * ∏' v, W v := by sorry

theorem genus_one_factor (q : ℝ) (hq : 0 < q) :
    q ^ (-(n : ℤ) ^ 2 * ((1 : ℤ) - 1)) = 1 := by sorry

theorem p1_factor (q : ℝ) (hq : 0 < q) :
    q ^ (-(n : ℤ) ^ 2 * ((0 : ℤ) - 1)) = q ^ (n ^ 2) := by sorry

/-- A zero Gram matrix of positive rank is singular: the nonsingular theorem cannot apply. -/
theorem singular_boundary (hn : 0 < n) : Matrix.det (0 : Matrix (Fin n) (Fin n) ℂ) = 0 := by sorry
example (q : ℝ) (hq : 0 < q) : q ^ (-(n : ℤ) ^ 2 * ((1 : ℤ) - 1)) = 1 := by sorry
example (q : ℝ) (hq : 0 < q) : q ^ (-(n : ℤ) ^ 2 * ((0 : ℤ) - 1)) = q ^ (n ^ 2) := by sorry
example (hn : 0 < n) : Matrix.det (0 : Matrix (Fin n) (Fin n) ℂ) = 0 := by sorry
end HermitianFourier

/-- Omitted: Den is the imported inert-or-split normalized Siegel polynomial of the actual
integral Hermitian lattice, W its normalized local Whittaker function, η the splitting sign,
and the local Weil representation has source rank n+2j at s=j. -/
theorem unitary_whittaker_density_comparison (q : ℝ) (hq : 1 < q) (η : ℂ)
    (Den : Polynomial ℂ) (W : ℂ → ℂ) (s : ℂ) :
    W s = (∏ i ∈ Finset.range n, (1 - η ^ (i + 1) * (q : ℂ) ^ (-(i + 1 : ℂ) - 2 * s))) *
      Den.eval ((q : ℂ) ^ (-2 * s)) := by sorry

/-- Omitted: d=deg E for the bundle on X', e=deg ω_X; a:E→σ*Hom(E,ω_X') is injective Hermitian,
c=χ(det E), Den is the finite product with substitutions X^{d_v}, L is the global normalizer,
and ET is the normalized regular coefficient at that datum. This is the FYZ Theorem 2.8 formula;
ordinary duals and unweighted products are excluded by the reader's exact conditions. -/
theorem fyz_regular_global_coefficient (q : ℝ) (hq : 1 < q) (d e : ℤ)
    (c : ℂˣ) (Den : Polynomial ℂ) (L ET : ℂ → ℂ) (s : ℂ) :
    ET s = (c : ℂ) * (q : ℂ) ^ (-(d : ℂ) * (s - (n : ℂ) / 2) - (n : ℂ)^2 * (e : ℂ) / 2) *
      (L s)⁻¹ * Den.eval ((q : ℂ) ^ (-2 * s)) := by sorry
end Hermitian

section Certificates
variable (k K : Type*) [Field k] [Finite k] [Field K] [Algebra k K]

/-- Omitted executable encoding: verified separating presentation, normalized finite/infinite
integral bases, FF.3 factorization certificates and the place-to-presentation adapter.
The output carrier is the native finite set of places, including infinity. -/
def PlaceEnumeration (hK : IsFunctionField k K) (B : ℕ) : Finset (Place k K) := by sorry

namespace PlaceEnumeration
variable {k K}
local instance placeDecidableEq : DecidableEq (Place k (RatFunc k)) := Classical.decEq _
theorem sound (hK : IsFunctionField k K) (B : ℕ) (v : Place k K)
    (hv : v ∈ PlaceEnumeration k K hK B) : v.degree ≤ B := by sorry

theorem complete (hK : IsFunctionField k K) (B : ℕ) (v : Place k K)
    (hv : v.degree ≤ B) : v ∈ PlaceEnumeration k K hK B := by sorry

/-- The encoded divisor records the certified place, rather than its possibly singular center. -/
def encodedDivisor (data : List (Place k K × ℤ)) : Divisor k K :=
  (data.map fun vn => Finsupp.single vn.1 vn.2).sum

theorem divisor_arithmetic (xs ys : List (Place k K × ℤ)) :
    encodedDivisor (xs ++ ys) = encodedDivisor xs + encodedDivisor ys := by sorry

theorem p1_degree_one (hK : IsFunctionField k (RatFunc k)) :
    (PlaceEnumeration k (RatFunc k) hK 1).card = Nat.card k + 1 := by sorry

theorem infinity_required (hK : IsFunctionField k (RatFunc k)) :
    ((PlaceEnumeration k (RatFunc k) hK 1).erase (Place.infty k)).card = Nat.card k := by sorry

/-- Parametrization x=u²−1,y=u(u²−1) of y²=x²(x+1) over F5: u=±1 give different places
above its node (0,0). The center adapter is omitted; these are the actual normalized valuations. -/
theorem singular_branches :
    let vpos : Place (ZMod 5) (RatFunc (ZMod 5)) :=
      Place.adicOfIrreducible (irreducible_X_sub_C (1 : ZMod 5))
    let vneg : Place (ZMod 5) (RatFunc (ZMod 5)) :=
      Place.adicOfIrreducible (irreducible_X_sub_C (-1 : ZMod 5))
    vpos ≠ vneg ∧ vpos.ord (RatFunc.X ^ 2 - 1) > 0 ∧ vneg.ord (RatFunc.X ^ 2 - 1) > 0 := by sorry
example (hK : IsFunctionField k (RatFunc k)) :
    (PlaceEnumeration k (RatFunc k) hK 1).card = Nat.card k + 1 := by sorry
example (hK : IsFunctionField k (RatFunc k)) :
    ((PlaceEnumeration k (RatFunc k) hK 1).erase (Place.infty k)).card = Nat.card k := by sorry
example :
    let vpos : Place (ZMod 5) (RatFunc (ZMod 5)) :=
      Place.adicOfIrreducible (irreducible_X_sub_C (1 : ZMod 5))
    let vneg : Place (ZMod 5) (RatFunc (ZMod 5)) :=
      Place.adicOfIrreducible (irreducible_X_sub_C (-1 : ZMod 5))
    vpos ≠ vneg ∧ vpos.ord (RatFunc.X ^ 2 - 1) > 0 ∧ vneg.ord (RatFunc.X ^ 2 - 1) > 0 := by sorry
end PlaceEnumeration

/-- The character is actual data; proof fields certify its conductor, not missing mathematical
notions. Executable finite ray relations and local-unit evaluations require FA.7's encoding.
The choice of degree-one class is separate from its geometric conductor. -/
structure RayCharacterCertificate (hK : IsFunctionField k K) where
  character : IdeleClass k K hK →* ℂˣ
  modulus : Divisor k K
  effective : 0 ≤ modulus
  localTrivial : ∀ a : FullIdeles k K, a ∈ rayUnits k K modulus →
    character (QuotientGroup.mk a) = 1
  minimal : ∀ m : Divisor k K, 0 ≤ m →
    (∀ a : FullIdeles k K, a ∈ rayUnits k K m → character (QuotientGroup.mk a) = 1) →
      modulus ≤ m
  degreeClass : IdeleClass k K hK
  degreeOne : IdeleClass.yuDegree hK degreeClass = Multiplicative.ofAdd 1

namespace RayCharacterCertificate
variable {k K} {hK : IsFunctionField k K}
/-- Omitted: native quotient topology adapter. Continuity follows from the open ray-unit kernel. -/
theorem sound (c : RayCharacterCertificate k K hK) : Continuous c.character := by sorry

theorem conductor_minimal (c : RayCharacterCertificate k K hK) (m : Divisor k K)
    (hm : 0 ≤ m)
    (h : ∀ a : FullIdeles k K, a ∈ rayUnits k K m → c.character (QuotientGroup.mk a) = 1) :
    c.modulus ≤ m := by sorry

theorem degree_value (c d : RayCharacterCertificate k K hK)
    (h0 : ∀ a ∈ (IdeleClass.yuDegree hK).ker, c.character a = d.character a)
    (h1 : c.character c.degreeClass = d.character c.degreeClass) :
    c.character = d.character := by sorry

theorem trivial (c : RayCharacterCertificate k K hK) (hc : c.character = 1) :
    c.modulus = 0 ∧ c.character c.degreeClass = 1 := by sorry

/-- χ is a nontrivial constant-field character: it factors through the discrete degree map. -/
theorem constant_extension (c : RayCharacterCertificate k K hK)
    (θ : Multiplicative ℤ →* ℂˣ) (hθ : θ (Multiplicative.ofAdd 1) ≠ 1)
    (hc : c.character = θ.comp (IdeleClass.yuDegree hK)) :
    c.modulus = 0 ∧ c.character c.degreeClass ≠ 1 := by sorry

/-- Omitted: c is the faithful Artin character of y^p−y=t^(-m), p∤m, via FA.4. -/
theorem wild_one_pole (p m : ℕ) [Fact p.Prime] [CharP k p]
    (hK : IsFunctionField k (RatFunc k)) (hm : 0 < m) (hp : ¬ p ∣ m)
    (c : RayCharacterCertificate k (RatFunc k) hK) :
    c.modulus = (m + 1 : ℤ) • WeilDivisor.ofPoint (CompletedResidue.zeroPlace (k := k)) := by sorry
example (c : RayCharacterCertificate k K hK) (hc : c.character = 1) :
    c.modulus = 0 ∧ c.character c.degreeClass = 1 := by sorry
example (c : RayCharacterCertificate k K hK) (θ : Multiplicative ℤ →* ℂˣ)
    (hθ : θ (Multiplicative.ofAdd 1) ≠ 1) (hc : c.character = θ.comp (IdeleClass.yuDegree hK)) :
    c.modulus = 0 ∧ c.character c.degreeClass ≠ 1 := by sorry
example (p m : ℕ) [Fact p.Prime] [CharP k p] (hK : IsFunctionField k (RatFunc k))
    (hm : 0 < m) (hp : ¬ p ∣ m) (c : RayCharacterCertificate k (RatFunc k) hK) :
    c.modulus = (m + 1 : ℤ) • WeilDivisor.ofPoint (CompletedResidue.zeroPlace (k := k)) := by sorry
end RayCharacterCertificate

/-- Residue field AND uniformizer are specified, not just an abstract isomorphism of fields.
Omitted: coefficient-section verification and the topological AlgEquiv comparison, until AC.5. -/
structure CompletionCertificate (v : Place k K) where
  parameter : CompletedPlace k K v
  parameterValue : Valued.v parameter = WithZero.exp (-1 : ℤ)
  seriesEquiv : CompletedPlace k K v ≃+* LaurentSeries v.ResidueField
  parameterToT : seriesEquiv parameter = HahnSeries.single 1 1

namespace CompletionCertificate
variable {k K} {v : Place k K}
theorem uniformizer (c : CompletionCertificate k K v) :
    c.seriesEquiv c.parameter = HahnSeries.single 1 1 := by sorry

/-- Omitted canonical Laurent valuation adapter: the order is the series' integer order. -/
theorem valuation (c : CompletionCertificate k K v) (x : CompletedPlace k K v) (hx : x ≠ 0) :
    Valued.v x = WithZero.exp (-(c.seriesEquiv x).order) := by sorry

def change_parameter (c d : CompletionCertificate k K v) :
    LaurentSeries v.ResidueField ≃+* LaurentSeries v.ResidueField :=
  c.seriesEquiv.symm.trans d.seriesEquiv

theorem p1_zero :
    ∃ c : CompletionCertificate k (RatFunc k) (CompletedResidue.zeroPlace (k := k)),
      c.parameter = completionEmbedding k (RatFunc k) (CompletedResidue.zeroPlace (k := k))
        RatFunc.X := by sorry

theorem p1_infinity :
    ∃ c : CompletionCertificate k (RatFunc k) (Place.infty k),
      c.parameter = completionEmbedding k (RatFunc k) (Place.infty k) RatFunc.X⁻¹ := by sorry

theorem global_not_local :
    ¬ Function.Surjective (completionEmbedding k (RatFunc k) (CompletedResidue.zeroPlace (k := k))) := by sorry
example : ∃ c : CompletionCertificate k (RatFunc k) (CompletedResidue.zeroPlace (k := k)),
    c.parameter = completionEmbedding k (RatFunc k) (CompletedResidue.zeroPlace (k := k)) RatFunc.X := by sorry
example : ∃ c : CompletionCertificate k (RatFunc k) (Place.infty k),
    c.parameter = completionEmbedding k (RatFunc k) (Place.infty k) RatFunc.X⁻¹ := by sorry
example :
    ¬ Function.Surjective (completionEmbedding k (RatFunc k) (CompletedResidue.zeroPlace (k := k))) := by sorry
end CompletionCertificate
end Certificates

/-- q and g are the exact field cardinality and curve genus; N_r are COMPLETE certified counts.
The recurrence is the first-g Newton identity from log Z, and reciprocity fills the second half.
The proof-bearing certificate verifies these identities; it does not certify Weil bounds alone. -/
structure LPolynomialCertificate (q g : ℕ) (N : ℕ → ℕ) where
  P : Polynomial ℤ
  constantOne : P.coeff 0 = 1
  degreeBound : P.natDegree ≤ 2 * g
  reciprocal : ∀ j ≤ g, P.coeff (2 * g - j) = (q : ℤ) ^ (g - j) * P.coeff j
  newton : ∀ r, 0 < r → r ≤ g →
    (r : ℤ) * P.coeff r =
      -∑ i ∈ Finset.range r, ((q : ℤ) ^ (i + 1) + 1 - (N (i + 1) : ℤ)) * P.coeff (r - i - 1)

namespace LPolynomialCertificate
theorem sound {k K : Type*} [Field k] [Finite k] [Field K] [Algebra k K]
    (hK : IsFunctionField k K) (hex : IsIntegrallyClosedIn k K)
    (c : LPolynomialCertificate (Nat.card k) (genus k K) (curvePointCount k K)) :
    CurveZeta k K * ((1 - PowerSeries.X) *
      (1 - PowerSeries.C (Nat.card k : ℤ) * PowerSeries.X)) = (c.P : PowerSeries ℤ) := by sorry

theorem unique {q g : ℕ} {N : ℕ → ℕ} (c d : LPolynomialCertificate q g N) : c.P = d.P := by sorry

/-- Omitted actual curve condition: N is its complete all-extension count sequence. Purely formal
first-g identities alone do not guarantee that N_sr comes from a curve or that the new certificate
exists; actual verified extension-field point counts are required by FF.3. -/
def constant_extension (q g s : ℕ) (hs : 0 < s) (N : ℕ → ℕ)
    (c : LPolynomialCertificate q g N) :
    LPolynomialCertificate (q ^ s) g (fun r => N (s * r)) := by sorry

def genusZeroCertificate (q : ℕ) : LPolynomialCertificate q 0 (fun r => q ^ r + 1) := by sorry

theorem genus_zero (q : ℕ) : (genusZeroCertificate q).P = 1 := by sorry

/-- Verified first count of the actual affine Weierstrass equation, including its infinity point. -/
theorem elliptic_five :
    Nat.card {xy : ZMod 5 × ZMod 5 // xy.2 ^ 2 = xy.1 ^ 3 + xy.1 + 1} + 1 = 9 ∧
    ∃ c : LPolynomialCertificate 5 1 (fun r => if r = 1 then 9 else 0),
      c.P = 1 + C 3 * X + C 5 * X ^ 2 := by sorry

theorem bad_elliptic_count :
    ¬ ∃ c : LPolynomialCertificate 5 1 (fun r => if r = 1 then 8 else 0),
      c.P = 1 + C 3 * X + C 5 * X ^ 2 := by sorry
example (q : ℕ) : (genusZeroCertificate q).P = 1 := by sorry
example :
    Nat.card {xy : ZMod 5 × ZMod 5 // xy.2 ^ 2 = xy.1 ^ 3 + xy.1 + 1} + 1 = 9 ∧
    ∃ c : LPolynomialCertificate 5 1 (fun r => if r = 1 then 9 else 0),
      c.P = 1 + C 3 * X + C 5 * X ^ 2 := by sorry
example :
    ¬ ∃ c : LPolynomialCertificate 5 1 (fun r => if r = 1 then 8 else 0),
      c.P = 1 + C 3 * X + C 5 * X ^ 2 := by sorry
end LPolynomialCertificate

/-- Arithmetic verification examples, whose inputs/cost model are stated completely in FA.7.
This signature only records the four numerator polynomials. It does not claim running-time
verification or that the certificates' construction has been implemented. -/
theorem explicit_cost_and_examples :
    let P0 : Polynomial ℤ := 1
    let P1 : Polynomial ℤ := 1 + C 3 * X + C 5 * X ^ 2
    let P2 : Polynomial ℤ := 1 + C 3 * X ^ 2
    let P3 : Polynomial ℤ := 1 + X + C 25 * X ^ 2
    P0.natDegree = 0 ∧ P1.natDegree = 2 ∧ P2.natDegree = 2 ∧ P3.natDegree = 2 := by sorry

end FunctionFieldArithmetic
