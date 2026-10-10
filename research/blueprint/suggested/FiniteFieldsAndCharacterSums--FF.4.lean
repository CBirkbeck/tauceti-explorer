/-
This file is not the roadmap and is not exhaustive. The roadmap document is definitive.
These statements suggest Lean forms so contributors and reviewers converge on names and
signatures. Every body is a planning placeholder, not an implementation claim.

FF.4 continuation, issue #6351. Mathlib 082e2d3; Tau Ceti f790474.
Parent-owned objects are referenced through
native carriers or small transparent notation helpers; they retain their parent IDs.
The sheaf-theoretic proof conditions without a supplied native sheaf type are omitted,
with exact contracts in the packet. They are not replaced by proposition-valued fields.
-/
import Mathlib.Algebra.SkewPolynomial.Basic
import Mathlib.Algebra.Group.Hom.Instances
import Mathlib.Algebra.RingQuot
import Mathlib.Algebra.MvPolynomial.Basic
import Mathlib.Algebra.MvPolynomial.Eval
import Mathlib.Analysis.Complex.Basic
import Mathlib.Analysis.Fourier.FiniteAbelian.Orthogonality
import Mathlib.Analysis.SpecialFunctions.Pow.Real
import Mathlib.Data.ZMod.Basic
import Mathlib.FieldTheory.Finite.GaloisField
import Mathlib.FieldTheory.Finite.Trace
import Mathlib.FieldTheory.Galois.NormalBasis
import Mathlib.InformationTheory.Hamming
import Mathlib.LinearAlgebra.BilinearForm.Orthogonal
import Mathlib.LinearAlgebra.Contraction
import Mathlib.LinearAlgebra.QuadraticForm.Basic
import Mathlib.LinearAlgebra.Matrix.ToLin
import Mathlib.LinearAlgebra.Vandermonde
import Mathlib.RingTheory.AdjoinRoot
import Mathlib.RingTheory.TwoSidedIdeal.Operations
import Mathlib.RingTheory.WittVector.Truncated
import TauCeti.InformationTheory.Coding.Basic
import TauCeti.FieldTheory.FunctionField.Place.RatFunc.Basic
import TauCeti.FieldTheory.FunctionField.RiemannRoch.Basic
import TauCeti.FieldTheory.FunctionField.Divisor.ProductFormula
import TauCeti.FieldTheory.FunctionField.Differential.LocalComponent

noncomputable section
open scoped BigOperators
open Classical
open Polynomial
namespace TauCeti.FF4

/-! ## Principal 2-units: imported Galois-ring carrier, not a second definition. -/
section PrincipalUnits
variable [Fact (Nat.Prime 2)]
-- Parent FF.4/galois-ring is this native truncated-Witt carrier.
local notation "GR" => fun n r => TruncatedWittVector 2 n (GaloisField 2 r)
theorem principalTwoUnits_card_pow_eq_one (n r k : ℕ)
    (hn : 3 ≤ n) (hr : 1 ≤ r) (hk : 1 ≤ k) (hkn : k ≤ n - 2) :
    Nat.card {u : (GR n r)ˣ //
      (∃ a : GR n r, (u : GR n r) = 1 + 2 * a) ∧ u ^ (2 ^ k) = 1} =
      2 ^ (r * k + 1) := by sorry
end PrincipalUnits

/-! ## Frobenius Ore polynomials over a commutative F_q-algebra. -/
section Ore
variable {F R : Type*} [Field F] [Fintype F] [CommRing R] [Algebra F R]
-- Actual native action; no automorphism or inverse Frobenius is required.
abbrev frobeniusAction (F : Type*) [Field F] [Fintype F] [Algebra F R] : MulSemiringAction (Multiplicative ℕ) R := by sorry
lemma frobeniusAction_smul (k : ℕ) (a : R) :
    letI := frobeniusAction (F := F) (R := R)
    (Multiplicative.ofAdd k) • a = a ^ (Fintype.card F ^ k) := by sorry
-- The subtype condition is exactly the parent Polynomial.IsLinearized support predicate.
def linearizedAddGroup : AddSubgroup R[X] :=
  { carrier := {P | ∀ j ∈ P.support, ∃ i, j = Fintype.card F ^ i}
    zero_mem' := by sorry
    add_mem' := by sorry
    neg_mem' := by sorry }
def oreToLinearized : SkewPolynomial R ≃+ linearizedAddGroup (F := F) (R := R) := by sorry
lemma oreToLinearized_monomial (i : ℕ) (a : R) :
    (oreToLinearized (F := F) (SkewPolynomial.monomial i a)).val =
      C a * X ^ (Fintype.card F ^ i) := by sorry
lemma oreToLinearized_mul (A B : SkewPolynomial R) :
    letI := frobeniusAction (F := F) (R := R)
    (oreToLinearized (F := F) (A * B)).val =
      (oreToLinearized (F := F) A).val.comp (oreToLinearized (F := F) B).val := by sorry
lemma oreToLinearized_one :
    (oreToLinearized (F := F) (1 : SkewPolynomial R)).val = X := by sorry
-- Coefficient transport is a finite-support additive map, not ordinary polynomial multiplication.
def oreCoefficientMap {S : Type*} [CommRing S] [Algebra F S] (f : R →ₐ[F] S) :
    SkewPolynomial R →+ SkewPolynomial S := by sorry
lemma oreToLinearized_natural {S : Type*} [CommRing S] [Algebra F S]
    (f : R →ₐ[F] S) (A : SkewPolynomial R) :
    (oreToLinearized (F := F) A).val.map f.toRingHom =
      (oreToLinearized (F := F) (oreCoefficientMap f A)).val := by sorry
-- Unit test ore_one_is_X.
example : (oreToLinearized (F := F) (1 : SkewPolynomial R)).val = X := by sorry
-- Unit test ore_degree_zero.
example (a : R) : (oreToLinearized (F := F) (SkewPolynomial.monomial 0 a)).val = C a * X := by sorry
end Ore
-- Unit test ore_noncommutation: the two coefficients are t² and t in F_2[t].
example :
    letI := frobeniusAction (F := ZMod 2) (R := (ZMod 2)[X])
    let τ := SkewPolynomial.monomial 1 (1 : (ZMod 2)[X])
    let t := SkewPolynomial.monomial 0 (X : (ZMod 2)[X])
    (oreToLinearized (F := ZMod 2) (τ*t)).val =
      C ((X : (ZMod 2)[X])^2) * X^2 ∧
    (oreToLinearized (F := ZMod 2) (t*τ)).val =
      C (X : (ZMod 2)[X]) * X^2 ∧ τ*t ≠ t*τ := by sorry

/-! ## Reduced coefficients and their actual composition algebra. -/
section Reduced
variable {F E : Type*} [Field F] [Fintype F] [Field E] [Fintype E] [Algebra F E]
variable [FiniteDimensional F E]
-- A newtype prevents the pointwise ring structure on functions from being substituted.
structure ReducedLinearized (F E : Type*) (n : ℕ) where
  coeff : Fin n → E
variable {n : ℕ}
instance : AddCommGroup (ReducedLinearized F E n) := by sorry
instance : Module F (ReducedLinearized F E n) := by sorry
-- These structures are for n = finrank(F,E)>0; arbitrary n has no claimed ring structure.
abbrev reducedRing (hn : n = Module.finrank F E) :
    Ring (ReducedLinearized F E n) := by sorry
abbrev reducedAlgebra (hn : n = Module.finrank F E) :
    @Algebra F (ReducedLinearized F E n) _ (reducedRing hn).toSemiring := by sorry
namespace ReducedLinearized
lemma ext (a b : ReducedLinearized F E n) (h : ∀ i, a.coeff i = b.coeff i) : a = b := by sorry
def single (i : Fin n) (a : E) : ReducedLinearized F E n := ⟨fun j => if j = i then a else 0⟩
def polynomial (a : ReducedLinearized F E n) : E[X] :=
  ∑ i : Fin n, C (a.coeff i) * X ^ (Fintype.card F ^ (i : ℕ))
lemma coeff_mul (hn : n = Module.finrank F E) (a b : ReducedLinearized F E n) (k : Fin n) :
    letI := reducedRing hn
    (a * b).coeff k = ∑ i : Fin n, ∑ j : Fin n,
      if ((i : ℕ) + (j : ℕ)) % n = (k : ℕ) then
        a.coeff i * b.coeff j ^ (Fintype.card F ^ (i : ℕ)) else 0 := by sorry
end ReducedLinearized
variable [hnFact : Fact (n = Module.finrank F E)]
local instance : Ring (ReducedLinearized F E n) := reducedRing hnFact.out
local instance : Algebra F (ReducedLinearized F E n) := reducedAlgebra hnFact.out
-- The constructor and API use the same name for the equivalence.
def reducedEvalEquiv : ReducedLinearized F E n ≃ₐ[F] Module.End F E := by sorry
lemma reducedEvalEquiv_apply (a : ReducedLinearized F E n) (x : E) :
    reducedEvalEquiv (F := F) (E := E) (n := n) a x = ∑ i : Fin n, a.coeff i * x ^ (Fintype.card F ^ (i : ℕ)) := by sorry
lemma reducedEvalEquiv_mul (a b : ReducedLinearized F E n) :
    reducedEvalEquiv (F := F) (E := E) (n := n) (a * b) = (reducedEvalEquiv (F := F) (E := E) (n := n) a).comp (reducedEvalEquiv (F := F) (E := E) (n := n) b) := by sorry
lemma reducedEvalEquiv_surjective : Function.Surjective (reducedEvalEquiv (F := F) (E := E) (n := n)) := by sorry
-- Unit test reduced_zero_coeff.
example (i : Fin n) : (0 : ReducedLinearized F E n).coeff i = 0 := by sorry
-- Unit test reduced_unit.
example (i : Fin n) : (1 : ReducedLinearized F E n).coeff i = if (i : ℕ) = 0 then 1 else 0 := by sorry
-- Unit test reduced_frobenius_order.
example (hn1 : 1 < n) : (ReducedLinearized.single ⟨1, hn1⟩ (1 : E) :
    ReducedLinearized F E n) ^ n = 1 := by sorry
-- Unit test eval_zero.
example : reducedEvalEquiv (F := F) (E := E) (n := n) (0 : ReducedLinearized F E n) = 0 := by sorry
-- Unit test eval_one.
example : reducedEvalEquiv (F := F) (E := E) (n := n) (1 : ReducedLinearized F E n) = (LinearMap.id : E →ₗ[F] E) := by sorry
-- Unit test eval_single.
example (i : Fin n) (a x : E) : reducedEvalEquiv (F := F) (E := E) (n := n) (ReducedLinearized.single i a) x =
    a * x ^ (Fintype.card F ^ (i : ℕ)) := by sorry

-- Native trace tensor coordinates, not a redeclaration of generic tensor–Hom equivalence.
def traceRankOne (α β : E) : E →ₗ[F] E := by sorry
lemma traceRankOne_apply (α β x : E) :
    traceRankOne (F := F) α β x = Algebra.trace F E (α * x) • β := by sorry
lemma traceRankOne_comp (α β γ δ : E) :
    (traceRankOne (F := F) γ δ).comp (traceRankOne (F := F) α β) =
      Algebra.trace F E (γ * β) • traceRankOne (F := F) α δ := by sorry
theorem traceTensor_coeff (α β : E) (i : Fin n) :
    ((reducedEvalEquiv (F := F) (E := E) (n := n)).symm (traceRankOne (F := F) α β)).coeff i =
      β * α ^ (Fintype.card F ^ (i : ℕ)) := by sorry

theorem linearMap_trace_basis (b : Module.Basis (Fin n) F E) (L : E →ₗ[F] E) (x : E) :
    L x = ∑ i : Fin n, Algebra.trace F E (b i * x) • L (b.traceDual i) := by sorry
lemma linearMap_trace_basis_rank (b : Module.Basis (Fin n) F E) (L : E →ₗ[F] E) :
    Module.finrank F (LinearMap.range L) =
      Module.finrank F (Submodule.span F (Set.range fun i => L (b.traceDual i))) := by sorry
theorem linearMap_trace_output_basis (b : Module.Basis (Fin n) F E) (L : E →ₗ[F] E) :
    ∃! c : Fin n → E,
      (∀ x, L x = ∑ i : Fin n, Algebra.trace F E (c i * x) • b i) ∧
      Module.finrank F (LinearMap.range L) =
        Module.finrank F (Submodule.span F (Set.range c)) := by sorry

theorem linearMap_rank_iff_trace_sum (L : E →ₗ[F] E) (k : ℕ) :
    Module.finrank F (LinearMap.range L) = k ↔
      ∃ ω θ : Fin k → E, LinearIndependent F ω ∧ LinearIndependent F θ ∧
        ∀ x, L x = ∑ j : Fin k, Algebra.trace F E (ω j * x) • θ j := by sorry

def traceBasisMap (b a : Module.Basis (Fin n) F E) : E ≃ₗ[F] E := by sorry
lemma traceBasisMap_apply (b a : Module.Basis (Fin n) F E) (x : E) :
    traceBasisMap b a x = ∑ i : Fin n, Algebra.trace F E (b i * x) • a i := by sorry
theorem traceBasis_inverse (b a : Module.Basis (Fin n) F E) (x : E) :
    (traceBasisMap b a).symm x =
      ∑ i : Fin n, Algebra.trace F E (a.traceDual i * x) • b.traceDual i := by sorry

def coeffSubalgebra (m : ℕ) : Subalgebra F (ReducedLinearized F E n) :=
  { carrier := {a | ∀ i, a.coeff i ^ (Fintype.card F ^ m) = a.coeff i}
    mul_mem' := by sorry
    add_mem' := by sorry
    algebraMap_mem' := by sorry }
lemma mem_coeffSubalgebra (m : ℕ) (a : ReducedLinearized F E n) :
    a ∈ coeffSubalgebra (F := F) (E := E) (n := n) m ↔ ∀ i, a.coeff i ^ (Fintype.card F ^ m) = a.coeff i := by sorry
lemma coeffSubalgebra_centralizer (m : ℕ) (a : ReducedLinearized F E n) :
    a ∈ coeffSubalgebra (F := F) (E := E) (n := n) m ↔ ∀ x,
      reducedEvalEquiv (F := F) (E := E) (n := n) a (x ^ (Fintype.card F ^ m)) =
        (reducedEvalEquiv (F := F) (E := E) (n := n) a x) ^ (Fintype.card F ^ m) := by sorry
lemma coeffSubalgebra_finrank (m : ℕ) (hm : 0 < m) (hmn : m ∣ n) :
    Module.finrank F (coeffSubalgebra (F := F) (E := E) (n := n) m) = n * m := by sorry
-- Unit test coeff_subalgebra_full.
example : coeffSubalgebra (F := F) (E := E) (n := n) n = ⊤ := by sorry
-- Unit test coeff_subalgebra_base.
example (a : ReducedLinearized F E n) : a ∈ coeffSubalgebra (F := F) (E := E) (n := n) 1 ↔
    ∀ i, ∃ c : F, algebraMap F E c = a.coeff i := by sorry
-- Unit test coeff_subalgebra_wrong_scalar.
example (m : ℕ) (a : E) (ha : a ^ (Fintype.card F ^ m) ≠ a) (hn0 : 0 < n) :
    ReducedLinearized.single ⟨0, hn0⟩ a ∉ coeffSubalgebra (F := F) (E := E) (n := n) m := by sorry

-- The fixed intermediate field is a native IntermediateField; the criterion fixes its carrier.
def fixedFrobeniusField (m : ℕ) : IntermediateField F E := by sorry
lemma mem_fixedFrobeniusField (m : ℕ) (a : E) :
    a ∈ fixedFrobeniusField (F := F) m ↔ a ^ (Fintype.card F ^ m) = a := by sorry
-- The two-sided ideal uses RingCon and its RingQuot carrier, not a commutative Ideal.
def cyclicOreQuotient (m : ℕ) : Type _ :=
  letI := frobeniusAction (F := F) (R := fixedFrobeniusField (F := F) (E := E) m)
  RingQuot (fun A B : SkewPolynomial (fixedFrobeniusField (F := F) (E := E) m) =>
    A - B ∈ TwoSidedIdeal.span
      {SkewPolynomial.monomial n (1 : fixedFrobeniusField (F := F) (E := E) m) - 1})
instance (m : ℕ) : Ring (cyclicOreQuotient (F := F) (E := E) (n := n) m) := by sorry
instance (m : ℕ) : Algebra F (cyclicOreQuotient (F := F) (E := E) (n := n) m) := by sorry
theorem coeffSubalgebra_skewQuotient (m : ℕ) (hm : 0 < m) (hmn : m ∣ n) :
    Nonempty (coeffSubalgebra (F := F) (E := E) (n := n) m ≃ₐ[F] cyclicOreQuotient (F := F) (E := E) (n := n) m) := by sorry

theorem normalTrace_coeff_pattern (m t : ℕ) (hm : 0 < m) (hnt : n = m * t)
    (β : E) (b : Module.Basis (Fin n) F E)
    (hb : ∀ i, b i = β ^ (Fintype.card F ^ (i : ℕ))) (L : E →ₗ[F] E) :
    (reducedEvalEquiv (F := F) (E := E) (n := n)).symm L ∈ coeffSubalgebra (F := F) (E := E) (n := n) m ↔
      ∀ (j : Fin t) (k : Fin m),
        L (b.traceDual ⟨(j : ℕ) * m + (k : ℕ), by sorry⟩) =
          (L (b.traceDual ⟨(k : ℕ), by sorry⟩)) ^ (Fintype.card F ^ ((j : ℕ) * m)) := by sorry

def blockCirculantAlgebra (m t : ℕ) : Subalgebra F
    (Matrix (Fin t × Fin m) (Fin t × Fin m) F) :=
  { carrier := {M | ∃ B : Fin t → Matrix (Fin m) (Fin m) F,
      ∀ i j k l, M (i,k) (j,l) = B ⟨((j : ℕ) + t - (i : ℕ)) % t, by sorry⟩ k l}
    mul_mem' := by sorry
    add_mem' := by sorry
    algebraMap_mem' := by sorry }
theorem coeffSubalgebra_blockCirculant (m t : ℕ) (hm : 0 < m) (ht : 0 < t)
    (hnt : n = m * t) (b : Module.Basis (Fin n) F E) (β : E)
    (hb : ∀ i, b i = β ^ (Fintype.card F ^ (i : ℕ))) :
    Nonempty (coeffSubalgebra (F := F) (E := E) (n := n) m ≃ₐ[F] blockCirculantAlgebra (F := F) m t) := by sorry
theorem coeffSubalgebra_matrixQuotient (m t : ℕ) (hm : 0 < m) (ht : 0 < t)
    (hnt : n = m * t) :
    Nonempty (coeffSubalgebra (F := F) (E := E) (n := n) m ≃ₐ[F]
      Matrix (Fin m) (Fin m) (AdjoinRoot ((X : F[X]) ^ t - 1))) := by sorry
end Reduced

/-! ## Interleaving and unnormalized trace Walsh transforms. -/
instance finiteFieldPeriodNeZero (E : Type*) [Field E] [Fintype E] :
    NeZero (Fintype.card E - 1) := ⟨by sorry⟩
section Walsh
variable {F E : Type*} [Field F] [Fintype F] [Field E] [Fintype E] [Algebra F E]
variable [FiniteDimensional F E]
local notation "N" => Fintype.card E - 1
-- Parent finite-word and trace-sequence notation; no second sequence owner.
def traceWord (α : Eˣ) (A : E) : ZMod N → F :=
  fun i => Algebra.trace F E (A * (α : E) ^ i.val)
def shiftWord {ι : Type*} {M : ℕ} [NeZero M] (t : ZMod M) (v : ZMod M → ι) : ZMod M → ι :=
  fun i => v (i + t)
def periodicCorr {M : ℕ} [NeZero M] (ψ : AddChar F ℂ)
    (b a : ZMod M → F) (t : ZMod M) : ℂ :=
  ∑ i : ZMod M, ψ (b i) * star (ψ (a (i + t)))
def traceWalsh (ψ : AddChar F ℂ) (B : E → F) (y : E) : ℂ :=
  ∑ x : E, ψ (B x) * star (ψ (Algebra.trace F E (y * x)))
lemma traceWalsh_zero_phase (ψ : AddChar F ℂ) (hψ : ψ ≠ 0) (y : E) :
    traceWalsh ψ (fun _ => 0) y = if y = 0 then Fintype.card E else 0 := by sorry
lemma traceWalsh_linear_phase (ψ : AddChar F ℂ) (hψ : ψ ≠ 0) (c y : E) :
    traceWalsh ψ (fun x => Algebra.trace F E (c * x)) y =
      if y = c then Fintype.card E else 0 := by sorry
lemma traceWalsh_parseval (ψ : AddChar F ℂ) (B : E → F) (hψ : ψ ≠ 0) :
    ∑ y : E, ‖traceWalsh ψ B y‖ ^ 2 = (Fintype.card E : ℝ) ^ 2 := by sorry
lemma traceWalsh_add_linear (ψ : AddChar F ℂ) (B : E → F) (c y : E) :
    traceWalsh ψ (fun x => B x + Algebra.trace F E (c * x)) y =
      traceWalsh ψ B (y - c) := by sorry
-- Unit test walsh_zero_at_zero.
example (ψ : AddChar F ℂ) : traceWalsh ψ (fun _ : E => 0) 0 = Fintype.card E := by sorry
-- Unit test walsh_zero_nonzero_frequency.
example (ψ : AddChar F ℂ) (hψ : ψ ≠ 0) (y : E) (hy : y ≠ 0) :
    traceWalsh ψ (fun _ => 0) y = 0 := by sorry
-- Unit test walsh_linear_peak.
example (ψ : AddChar F ℂ) (hψ : ψ ≠ 0) (c : E) :
    traceWalsh ψ (fun x => Algebra.trace F E (c * x)) c = Fintype.card E := by sorry

def IsTraceBent (ψ : AddChar F ℂ) (B : E → F) : Prop :=
  ∀ y, ‖traceWalsh ψ B y‖ = Real.sqrt (Fintype.card E)
lemma isTraceBent_iff_norm_sq (ψ : AddChar F ℂ) (B : E → F) :
    IsTraceBent ψ B ↔ ∀ y, ‖traceWalsh ψ B y‖ ^ 2 = (Fintype.card E : ℝ) := by sorry
lemma isTraceBent_add_linear (ψ : AddChar F ℂ) (B : E → F) (c : E) :
    IsTraceBent ψ (fun x => B x + Algebra.trace F E (c * x)) ↔ IsTraceBent ψ B := by sorry
lemma isTraceBent_add_constant (ψ : AddChar F ℂ) (B : E → F) (c : F) :
    IsTraceBent ψ (fun x => B x + c) ↔ IsTraceBent ψ B := by sorry
-- Unit test bent_zero_nonexample.
example (ψ : AddChar F ℂ) : ¬ IsTraceBent ψ (fun _ : E => 0) := by sorry
-- Unit test bent_linear_shift.
example (ψ : AddChar F ℂ) (B : E → F) (c : E) :
    IsTraceBent ψ B ↔ IsTraceBent ψ (fun x => B x + Algebra.trace F E (c * x)) := by sorry

theorem periodicCorr_traceWalsh (ψ : AddChar F ℂ) (B : E → F) (α : Eˣ)
    (hα : orderOf α = N) (t : ZMod N) :
    periodicCorr ψ (fun i => B ((α : E) ^ i.val)) (traceWord (F := F) α 1) t + ψ (B 0) =
      traceWalsh ψ B ((α : E) ^ t.val) := by sorry
lemma periodicCorr_traceWalsh_parseval (ψ : AddChar F ℂ) (B : E → F) (hψ : ψ ≠ 0)
    (α : Eˣ) (hα : orderOf α = N) :
    ∑ t : ZMod N, ‖periodicCorr ψ (fun i => B ((α : E) ^ i.val))
      (traceWord (F := F) α 1) t + ψ (B 0)‖ ^ 2 =
      (Fintype.card E : ℝ) ^ 2 - ‖traceWalsh ψ B 0‖ ^ 2 := by sorry
end Walsh

def binaryChar : AddChar (ZMod 2) ℂ := by sorry
lemma binaryChar_apply (x : ZMod 2) : binaryChar x = (-1 : ℂ) ^ x.val := by sorry
section BinaryBent
variable {E : Type*} [Field E] [Fintype E] [Algebra (ZMod 2) E]
variable [FiniteDimensional (ZMod 2) E]
def binaryProduct (b : Module.Basis (Fin 2) (ZMod 2) E) (x : E) : ZMod 2 :=
  b.repr x 0 * b.repr x 1
-- Unit test walsh_binary_quadratic: dual coordinates 00,01,10,11 give 2,2,2,-2.
example (b : Module.Basis (Fin 2) (ZMod 2) E) (c₀ c₁ : ZMod 2) :
    traceWalsh binaryChar (binaryProduct b) (c₀ • b.traceDual 0 + c₁ • b.traceDual 1) =
      2 * (-1 : ℂ) ^ (c₀ * c₁).val := by sorry
-- Unit test bent_binary_product.
example (b : Module.Basis (Fin 2) (ZMod 2) E) : IsTraceBent binaryChar (binaryProduct b) := by sorry
end BinaryBent

theorem isTraceBent_prime_character {p : ℕ} [Fact p.Prime]
    {E : Type*} [Field E] [Fintype E] [Algebra (ZMod p) E]
    [FiniteDimensional (ZMod p) E] (B : E → ZMod p)
    (ψ ψ' : AddChar (ZMod p) ℂ) (hψ : ψ ≠ 0) (hψ' : ψ' ≠ 0) :
    IsTraceBent ψ B ↔ IsTraceBent ψ' B := by sorry
-- The cyclotomic automorphism/conjugation transport proving this has an explicit packet gap.

section Interleaving
variable {F E K : Type*} [Field F] [Fintype F] [Field E] [Fintype E]
variable [Field K] [Fintype K] [Algebra F E] [Algebra E K] [Algebra F K]
variable [IsScalarTower F E K] [FiniteDimensional F E] [FiniteDimensional E K]
variable [FiniteDimensional F K]
theorem mSequence_interleaving (α : Kˣ) (hα : orderOf α = Fintype.card K - 1)
    (ω : K) (hω : ω ≠ 0) (β : Eˣ)
    (hβ : algebraMap E K (β : E) = (α : K) ^ ((Fintype.card K - 1) / (Fintype.card E - 1))) :
    let d := (Fintype.card K - 1) / (Fintype.card E - 1)
    (∀ (s : Fin (Fintype.card E - 1)) (t : Fin d),
      Algebra.trace F K (ω * (α : K) ^ ((s : ℕ) * d + (t : ℕ))) =
        Algebra.trace F E (Algebra.trace E K (ω * (α : K) ^ (t : ℕ)) * (β : E) ^ (s : ℕ))) ∧
    Nat.card {t : Fin d // Algebra.trace E K (ω * (α : K) ^ (t : ℕ)) = 0} =
      (Fintype.card F ^ (Module.finrank F K - Module.finrank F E) - 1) /
        (Fintype.card E - 1) := by sorry
end Interleaving

/-! ## Welch and trace-decimation families. -/
theorem welch_bound (N T : ℕ) (hN : 2 ≤ N) (hT : 1 ≤ T)
    (v : Fin N → Fin T → ℂ) (hv : ∀ u k, ‖v u k‖ = 1) (M : ℝ) (hM : 0 ≤ M)
    (hbound : ∀ u v', u ≠ v' → ‖∑ k : Fin T, v u k * star (v v' k)‖ ≤ M) :
    ((N : ℝ) - 1) * M ^ 2 ≥ (T : ℝ) * ((N : ℝ) - T) := by sorry

section Decimation
variable {F E : Type*} [Field F] [Fintype F] [Field E] [Fintype E] [Algebra F E]
variable [FiniteDimensional F E]
local notation "N" => Fintype.card E - 1
def traceDecimation (α : Eˣ) (d : ℕ) (A B : E) : ZMod N → F :=
  fun i => Algebra.trace F E (A * (α : E) ^ i.val + B * (α : E) ^ (d * i.val))
lemma traceDecimation_apply (α : Eˣ) (d : ℕ) (A B : E) (i : ZMod N) :
    traceDecimation (F := F) α d A B i =
      Algebra.trace F E (A * (α : E) ^ i.val + B * (α : E) ^ (d * i.val)) := by sorry
lemma traceDecimation_shift (α : Eˣ) (hα : orderOf α = N) (d : ℕ) (A B : E) (t : ZMod N) :
    shiftWord t (traceDecimation (F := F) α d A B) =
      traceDecimation (F := F) α d (A * (α : E) ^ t.val) (B * (α : E) ^ (d * t.val)) := by sorry
lemma traceDecimation_add (α : Eˣ) (d : ℕ) :
    ∃ L : (E × E) →ₗ[F] (ZMod N → F), ∀ A B, L (A,B) = traceDecimation α d A B := by sorry
-- Unit test decimation_zero.
example (α : Eˣ) (d : ℕ) : traceDecimation (F := F) α d 0 0 = 0 := by sorry
-- Unit test decimation_one.
example (α : Eˣ) (A B : E) :
    traceDecimation (F := F) α 1 A B = traceDecimation (F := F) α 1 (A+B) 0 := by sorry
-- Unit test decimation_trace.
example (α : Eˣ) (A : E) (d : ℕ) :
    traceDecimation (F := F) α d A 0 = traceWord (F := F) α A := by sorry

def goldRadical (H : E) (s : ℕ) : Set E :=
  {x | H * x ^ (Fintype.card F ^ s) + (H*x) ^ (Fintype.card F ^ (Module.finrank F E - s)) = 0}
theorem gold_radical_card (H : E) (hH : H ≠ 0) (s : ℕ) (hs : 0 < s)
    (hsn : s < Module.finrank F E) :
    let q := Fintype.card F
    let n := Module.finrank F E
    let g := Nat.gcd n (2*s)
    Nat.card (goldRadical (F := F) H s) =
      if (-H / H ^ (q ^ s)) ^ ((q^n - 1) / (q^g - 1)) = 1 then q^g else 1 := by sorry

def goldRepresentative (α : Eˣ) (s : ℕ) : Option E → ZMod N → F
  | none => traceDecimation α (1 + Fintype.card F ^ s) 0 1
  | some B => traceDecimation α (1 + Fintype.card F ^ s) 1 B
theorem gold_shift_distinct (α : Eˣ) (hα : orderOf α = N) (s : ℕ)
    (hs : 0 < s) (hsn : s < Module.finrank F E) (hs2 : 2*s ≠ Module.finrank F E)
    (A B : Option E) (t : ZMod N) :
    goldRepresentative (F := F) α s A = shiftWord t (goldRepresentative (F := F) α s B) → A = B := by sorry
lemma gold_full_period (α : Eˣ) (hα : orderOf α = N) (s : ℕ)
    (hs : 0 < s) (hsn : s < Module.finrank F E) (hs2 : 2*s ≠ Module.finrank F E)
    (B : E) (t : ZMod N) :
    shiftWord t (goldRepresentative (F := F) α s (some B)) =
      goldRepresentative (F := F) α s (some B) ↔ t = 0 := by sorry
end Decimation

theorem quadratic_sum_norm_sq {F V : Type*} [Field F] [Fintype F]
    [AddCommGroup V] [Module F V] [Fintype V] (Q : QuadraticForm F V)
    (ℓ : V →ₗ[F] F) (ψ : AddChar F ℂ) (hψ : ψ ≠ 0) :
    ((‖∑ x : V, ψ (Q x + ℓ x)‖ ^ 2 : ℝ) : ℂ) = (Fintype.card V : ℂ) *
      ∑ r : {r : V // ∀ y, Q.polarBilin r y = 0}, ψ (Q r + ℓ r) := by sorry

theorem gold_binary_corr_values {E : Type*} [Field E] [Fintype E] [Algebra (ZMod 2) E]
    [FiniteDimensional (ZMod 2) E] (α : Eˣ) (hα : orderOf α = Fintype.card E - 1)
    (n s : ℕ) (hn : n = Module.finrank (ZMod 2) E) (hn3 : 3 ≤ n) (hodd : Odd n)
    (hs : 0 < s) (hsn : s < n) (hcop : Nat.Coprime s n)
    (A B : Option E) (t : ZMod (Fintype.card E - 1)) (hdiag : A ≠ B ∨ t ≠ 0) :
    periodicCorr binaryChar (goldRepresentative α s A) (goldRepresentative α s B) t ∈
      ({-1, -1 + 2 ^ ((n+1)/2), -1 - 2 ^ ((n+1)/2)} : Set ℂ) := by sorry

/-! ## Small Kasami families. -/
section Kasami
variable {F E L : Type*} [Field F] [Fintype F] [Field E] [Fintype E]
variable [Field L] [Fintype L] [Algebra F E] [Algebra E L] [Algebra F L]
variable [IsScalarTower F E L] [FiniteDimensional F E] [FiniteDimensional E L]
variable [FiniteDimensional F L]
local notation "N" => Fintype.card L - 1
def kasamiSequence (α : Lˣ) (A : E) : ZMod N → F :=
  fun i => Algebra.trace F L ((α : L) ^ i.val) +
    Algebra.trace F E (A * Algebra.norm E ((α : L) ^ i.val))
lemma kasamiSequence_apply (α : Lˣ) (A : E) (i : ZMod N) :
    kasamiSequence (F := F) α A i = Algebra.trace F L ((α : L) ^ i.val) +
      Algebra.trace F E (A * Algebra.norm E ((α : L) ^ i.val)) := by sorry
lemma kasamiSequence_zero (α : Lˣ) : kasamiSequence (F := F) (E := E) α 0 = traceWord (F := F) α 1 := by sorry
lemma kasamiSequence_traceLift (α : Lˣ) (h2 : Module.finrank E L = 2)
    (A : E) (Â : L) (hÂ : Algebra.trace E L Â = A) :
    kasamiSequence (F := F) α A = traceDecimation (F := F) α (1 + Fintype.card E) 1 Â := by sorry
-- Unit test kasami_zero.
example (α : Lˣ) (i : ZMod N) :
    kasamiSequence (F := F) (E := E) α 0 i = Algebra.trace F L ((α : L) ^ i.val) := by sorry
-- Unit test kasami_lift_independent.
example (α : Lˣ) (h2 : Module.finrank E L = 2) (Â Btilde : L)
    (h : Algebra.trace E L Â = Algebra.trace E L Btilde) :
    traceDecimation (F := F) α (1 + Fintype.card E) 1 Â =
      traceDecimation (F := F) α (1 + Fintype.card E) 1 Btilde := by sorry
-- Unit test kasami_parameter_domain: the elementary case has two parameters, not four.
example (hF : Fintype.card F = 2) (h1 : Module.finrank F E = 1)
    (h2 : Module.finrank E L = 2) : Fintype.card E = 2 ∧ Fintype.card L = 4 := by sorry

theorem kasami_corr_norm (α : Lˣ) (hα : orderOf α = N) (h2 : Module.finrank E L = 2)
    (ψ : AddChar F ℂ) (hψ : ψ ≠ 0) (A B : E) (t : ZMod N) :
    let C := (α : L) ^ t.val
    let H := A - B * Algebra.norm E C
    (H ≠ 0 → ‖periodicCorr ψ (kasamiSequence α A) (kasamiSequence α B) t + 1‖ =
      (Fintype.card E : ℝ)) ∧
    (H = 0 ∧ C ≠ 1 → periodicCorr ψ (kasamiSequence α A) (kasamiSequence α B) t + 1 = 0) ∧
    (H = 0 ∧ C = 1 → periodicCorr ψ (kasamiSequence α A) (kasamiSequence α B) t + 1 =
      (Fintype.card L : ℂ)) := by sorry
lemma kasami_shift_distinct (α : Lˣ) (hα : orderOf α = N) (h2 : Module.finrank E L = 2)
    (A B : E) (t : ZMod N) :
    kasamiSequence (F := F) α A = shiftWord t (kasamiSequence (F := F) α B) ↔ A = B ∧ t = 0 := by sorry
end Kasami

/-! ## Arbitrary geometric feeds and GMW sequences. -/
section Geometric
variable {p : ℕ} [Fact p.Prime]
variable {L K : Type*} [Field L] [Fintype L] [Field K] [Fintype K]
variable [Algebra (ZMod p) L] [Algebra L K] [Algebra (ZMod p) K]
variable [IsScalarTower (ZMod p) L K] [FiniteDimensional (ZMod p) L]
variable [FiniteDimensional L K] [FiniteDimensional (ZMod p) K]
local notation "N" => Fintype.card K - 1
def geometricSequence (α : Kˣ) (f : L → ZMod p) : ZMod N → ZMod p :=
  fun i => f (Algebra.trace L K ((α : K) ^ i.val))
lemma geometricSequence_apply (α : Kˣ) (f : L → ZMod p) (i : ZMod N) :
    geometricSequence α f i = f (Algebra.trace L K ((α : K) ^ i.val)) := by sorry
lemma geometricSequence_traceFeed (α : Kˣ) :
    geometricSequence α (Algebra.trace (ZMod p) L) = traceWord (F := ZMod p) α 1 := by sorry
lemma geometricSequence_frobeniusDecimation (α : Kˣ) (f : L → ZMod p) (s : ℕ) (i : ZMod N) :
    geometricSequence α f (Fintype.card L ^ s * i) = geometricSequence α f i := by sorry
-- Unit test geometric_zero.
example (α : Kˣ) : geometricSequence α (fun _ : L => (0 : ZMod p)) = 0 := by sorry
-- Unit test geometric_trace.
example (α : Kˣ) : geometricSequence α (Algebra.trace (ZMod p) L) = traceWord (F := ZMod p) α 1 := by sorry
-- Unit test geometric_constant: shift one is a period; it is proper if N>1.
example (α : Kˣ) (c : ZMod p) :
    geometricSequence α (fun _ : L => c) = (fun _ => c) ∧
    shiftWord (1 : ZMod N) (geometricSequence α (fun _ : L => c)) =
      geometricSequence α (fun _ : L => c) := by sorry

theorem tracePair_fibre_card (C : K) (hC : C ≠ 0) (u v : L) :
    Nat.card {x : K // Algebra.trace L K x = u ∧ Algebra.trace L K (C*x) = v} =
      if h : ∃ c : L, algebraMap L K c = C then
        (if v = h.choose * u then Fintype.card L ^ (Module.finrank L K - 1) else 0)
      else Fintype.card L ^ (Module.finrank L K - 2) := by sorry

def feedImbalance (ψ : AddChar (ZMod p) ℂ) (f : L → ZMod p) : ℂ := ∑ u : L, ψ (f u)
def feedCorr (ψ : AddChar (ZMod p) ℂ) (g f : L → ZMod p) (C : L) : ℂ :=
  ∑ u : L, ψ (g u) * star (ψ (f (C*u)))
theorem geometric_corr (α : Kˣ) (hα : orderOf α = N)
    (ψ : AddChar (ZMod p) ℂ) (f g : L → ZMod p) (t : ZMod N) :
    let C := (α : K) ^ t.val
    let c₀ := ψ (g 0) * star (ψ (f 0))
    periodicCorr ψ (geometricSequence α g) (geometricSequence α f) t =
      if h : ∃ c : L, algebraMap L K c = C then
        (Fintype.card L : ℂ) ^ (Module.finrank L K - 1) * feedCorr ψ g f h.choose - c₀
      else (Fintype.card L : ℂ) ^ (Module.finrank L K - 2) *
        feedImbalance ψ g * star (feedImbalance ψ f) - c₀ := by sorry

def gmwSequence (α : Kˣ) (h : ℕ) (_hh : 1 ≤ h)
    (_hcop : Nat.Coprime h (Fintype.card L - 1)) : ZMod N → ZMod p :=
  geometricSequence α (fun u : L => Algebra.trace (ZMod p) L (u^h))
lemma gmwSequence_apply (α : Kˣ) (h : ℕ) (hh : 1 ≤ h)
    (hcop : Nat.Coprime h (Fintype.card L - 1)) (i : ZMod N) :
    gmwSequence α h hh hcop i =
      Algebra.trace (ZMod p) L ((Algebra.trace L K ((α : K)^i.val))^h) := by sorry
lemma gmwSequence_frobeniusExponent (α : Kˣ) (s : ℕ) (hh : 1 ≤ p^s)
    (hcop : Nat.Coprime (p^s) (Fintype.card L - 1)) :
    gmwSequence α (p^s) hh hcop = traceWord (F := ZMod p) α 1 := by sorry
lemma gmwFeed_zero (h : ℕ) (hh : 1 ≤ h) :
    Algebra.trace (ZMod p) L ((0 : L)^h) = 0 := by sorry
-- Unit test gmw_exponent_one.
example (α : Kˣ) (hcop : Nat.Coprime 1 (Fintype.card L - 1)) :
    gmwSequence (p := p) α 1 (by sorry) hcop = traceWord (F := ZMod p) α 1 := by sorry
-- Unit test gmw_feed_zero.
example (h : ℕ) (hh : 1 ≤ h) : Algebra.trace (ZMod p) L ((0 : L)^h) = 0 := by sorry

theorem gmw_autocorrelation (α : Kˣ) (hα : orderOf α = N) (h : ℕ) (hh : 1 ≤ h)
    (hcop : Nat.Coprime h (Fintype.card L - 1)) (ψ : AddChar (ZMod p) ℂ) (hψ : ψ ≠ 0)
    (t : ZMod N) :
    periodicCorr ψ (gmwSequence α h hh hcop) (gmwSequence α h hh hcop) t =
      if t = 0 then (N : ℂ) else -1 := by sorry
lemma gmw_exact_period (α : Kˣ) (hα : orderOf α = N) (h : ℕ) (hh : 1 ≤ h)
    (hcop : Nat.Coprime h (Fintype.card L - 1)) (t : ZMod N) :
    shiftWord t (gmwSequence (p := p) α h hh hcop) = gmwSequence (p := p) α h hh hcop ↔ t = 0 := by sorry
lemma gmw_symbol_count (α : Kˣ) (hα : orderOf α = N) (h : ℕ) (hh : 1 ≤ h)
    (hcop : Nat.Coprime h (Fintype.card L - 1)) (a : ZMod p) :
    Nat.card {i : ZMod N // gmwSequence α h hh hcop i = a} =
      Fintype.card K / p - if a = 0 then 1 else 0 := by sorry

theorem gmw_block_count (α : Kˣ) (hα : orderOf α = N) (h : ℕ) (hh : 1 ≤ h)
    (hcop : Nat.Coprime h (Fintype.card L - 1)) (j : ℕ) (hj : 1 ≤ j)
    (hjm : j ≤ Module.finrank L K) (w : Fin j → ZMod p) :
    Nat.card {i : ZMod N // ∀ k : Fin j, gmwSequence α h hh hcop (i + (k : ℕ)) = w k} =
      Fintype.card K / p^j - if w = 0 then 1 else 0 := by sorry

theorem gmw_frobenius_eq_trace (α : Kˣ) (s : ℕ) (hh : 1 ≤ p^s)
    (hcop : Nat.Coprime (p^s) (Fintype.card L - 1)) :
    gmwSequence α (p^s) hh hcop = traceWord (F := ZMod p) α 1 := by sorry
end Geometric
-- Unit test gmw_bad_exponent: coprimality cannot be removed.
example {L : Type*} [Field L] [Fintype L] [Algebra (ZMod 2) L]
    [FiniteDimensional (ZMod 2) L] (hL : Fintype.card L = 4) :
    (fun u : L => Algebra.trace (ZMod 2) L (u^3)) = 0 := by sorry

/-! ## d-form homogeneity and correlation: both permutation hypotheses are necessary. -/
section DForms
variable {L K : Type*} [Field L] [Field K] [Algebra L K]
def IsDForm (H : K → L) (d : ℕ) : Prop :=
  ∀ a : L, ∀ x : K, H (algebraMap L K a * x) = a^d * H x
lemma IsDForm.map_zero {H : K → L} {d : ℕ} (hH : IsDForm H d) (hd : 1 ≤ d) : H 0 = 0 := by sorry
lemma isDForm_trace_pow [FiniteDimensional L K] (d : ℕ) :
    IsDForm (fun x : K => Algebra.trace L K (x^d)) d := by sorry
lemma IsDForm.add {H J : K → L} {d : ℕ} (hH : IsDForm H d) (hJ : IsDForm J d) :
    IsDForm (fun x => H x + J x) d := by sorry
lemma IsDForm.mul {H J : K → L} {d e : ℕ} (hH : IsDForm H d) (hJ : IsDForm J e) :
    IsDForm (fun x => H x * J x) (d+e) := by sorry
-- Unit test dform_zero.
example (d : ℕ) : IsDForm (fun _ : K => (0 : L)) d := by sorry
-- Unit test dform_trace_linear.
example [FiniteDimensional L K] : IsDForm (Algebra.trace L K) 1 := by sorry
-- Unit test dform_constant_nonexample.
example (d : ℕ) (hd : 1 ≤ d) : ¬ IsDForm (fun _ : K => (1 : L)) d := by sorry
end DForms
-- Unit test dform_nonpermutation_degree.
example {L : Type*} [Field L] [Fintype L] (hL : Fintype.card L = 4) :
    IsDForm (fun x : L => if x = 0 then (0 : L) else 1) 3 := by sorry

section DFormCorrelation
variable {L K : Type*} [Field L] [Fintype L] [Field K] [Fintype K]
variable [Algebra (ZMod 2) L] [Algebra L K] [FiniteDimensional (ZMod 2) L]
variable [FiniteDimensional L K]
local notation "N" => Fintype.card K - 1
def dFormWord (α : Kˣ) (H : K → L) (k : ℕ) : ZMod N → ZMod 2 :=
  fun i => Algebra.trace (ZMod 2) L ((H ((α : K)^i.val))^k)
theorem dForm_corr_zero_count (α : Kˣ) (hα : orderOf α = N)
    (H₁ H₂ : K → L) (d k : ℕ) (hd : 1 ≤ d) (hk : 1 ≤ k)
    (h₁ : IsDForm H₁ d) (h₂ : IsDForm H₂ d)
    (hdcop : Nat.Coprime d (Fintype.card L - 1))
    (hkcop : Nat.Coprime k (Fintype.card L - 1)) (t : ZMod N) :
    periodicCorr binaryChar (dFormWord α H₁ k) (dFormWord α H₂ k) t =
      ((Fintype.card L : ℂ) *
        Nat.card {x : Kˣ // H₁ (x : K) + H₂ ((α : K)^t.val * (x : K)) = 0} - N) /
        ((Fintype.card L : ℂ) - 1) := by sorry
end DFormCorrelation

/-! ## Cyclic ideals, monic generators and the general BCH bound. -/
section CyclicCodes
variable {F : Type*} [Field F] {n : ℕ} [NeZero n]
def wordPolynomial (c : Fin n → F) : F[X] := ∑ i : Fin n, C (c i) * X ^ (i : ℕ)
lemma wordPolynomial_coeff (c : Fin n → F) (i : Fin n) : (wordPolynomial c).coeff i = c i := by sorry
def rightShift : (Fin n → F) →ₗ[F] (Fin n → F) :=
  { toFun := fun c i => c ⟨((i : ℕ)+n-1)%n, Nat.mod_lt _ (Nat.pos_of_ne_zero (NeZero.ne n))⟩
    map_add' := by sorry
    map_smul' := by sorry }
def cyclicWordEquiv : (Fin n → F) ≃ₗ[F] AdjoinRoot ((X : F[X])^n - 1) := by sorry
lemma cyclicWordEquiv_apply (c : Fin n → F) :
    cyclicWordEquiv c = AdjoinRoot.mk ((X : F[X])^n - 1) (wordPolynomial c) := by sorry
lemma cyclicWordEquiv_shift (c : Fin n → F) :
    cyclicWordEquiv (rightShift c) = AdjoinRoot.root ((X : F[X])^n-1) * cyclicWordEquiv c := by sorry
lemma cyclicWordEquiv_const (i : Fin n) :
    cyclicWordEquiv (Pi.single i (1 : F)) = AdjoinRoot.root ((X : F[X])^n-1) ^ (i : ℕ) := by sorry
-- Unit test cyclic_word_zero.
example : cyclicWordEquiv (0 : Fin n → F) = 0 := by sorry
-- Unit test cyclic_word_wrap.
example (hn : 1 ≤ n) : cyclicWordEquiv (F:=F) (n:=n) (rightShift (Pi.single ⟨n-1, by sorry⟩ (1 : F))) = 1 := by sorry
-- Unit test cyclic_word_n_one.
example (c : Fin 1 → F) :
    cyclicWordEquiv c = algebraMap F (AdjoinRoot ((X : F[X])^1-1)) (c 0) ∧
      Nonempty (AdjoinRoot ((X : F[X])^1-1) ≃ₐ[F] F) := by sorry
-- Unit test cyclic_word_repeated_root.
example : let z := AdjoinRoot.mk ((X : (ZMod 2)[X])^2 - 1) (X+1)
    z ≠ 0 ∧ z^2 = 0 := by sorry

def IsCyclicCode (C : TauCeti.LinearCode F (Fin n)) : Prop := ∀ c ∈ C, rightShift c ∈ C
lemma isCyclicCode_iff_shift_eq (C : TauCeti.LinearCode F (Fin n)) :
    IsCyclicCode C ↔ C.map rightShift = C := by sorry
lemma IsCyclicCode.inf {C D : TauCeti.LinearCode F (Fin n)}
    (hC : IsCyclicCode C) (hD : IsCyclicCode D) : IsCyclicCode (C ⊓ D) := by sorry
lemma IsCyclicCode.sup {C D : TauCeti.LinearCode F (Fin n)}
    (hC : IsCyclicCode C) (hD : IsCyclicCode D) : IsCyclicCode (C ⊔ D) := by sorry
-- Unit test cyclic_zero_code.
example : IsCyclicCode (⊥ : TauCeti.LinearCode F (Fin n)) := by sorry
-- Unit test cyclic_whole_code.
example : IsCyclicCode (⊤ : TauCeti.LinearCode F (Fin n)) := by sorry
-- Unit test cyclic_coordinate_nonexample.
example : ¬ IsCyclicCode (n := 3) (Submodule.span (ZMod 2)
    {Pi.single (0 : Fin 3) (1 : ZMod 2)}) := by sorry

def parityMap : (Fin n → F) →ₗ[F] F :=
  { toFun := fun c => ∑ i : Fin n, c i
    map_add' := by sorry
    map_smul' := by sorry }
-- Unit test cyclic_even_three.
example : IsCyclicCode (LinearMap.ker (parityMap (F := ZMod 2) (n := 3))) := by sorry

abbrev CyclicCode (F : Type*) [Field F] (n : ℕ) [NeZero n] :=
  {C : TauCeti.LinearCode F (Fin n) // IsCyclicCode C}
def zeroCyclicCode : CyclicCode F n := ⟨⊥, by sorry⟩
def fullCyclicCode : CyclicCode F n := ⟨⊤, by sorry⟩
def cyclicIdealEquiv : CyclicCode F n ≃o Ideal (AdjoinRoot ((X : F[X])^n-1)) := by sorry
lemma cyclicIdealEquiv_mem (C : CyclicCode F n) (c : Fin n → F) :
    cyclicWordEquiv (F := F) (n := n) c ∈ cyclicIdealEquiv C ↔ c ∈ C.val := by sorry
lemma cyclicIdealEquiv_inf (C D : CyclicCode F n) :
    cyclicIdealEquiv ⟨C.val ⊓ D.val, IsCyclicCode.inf (n := n) C.property D.property⟩ =
      cyclicIdealEquiv C ⊓ cyclicIdealEquiv D := by sorry
lemma cyclicIdealEquiv_sup (C D : CyclicCode F n) :
    cyclicIdealEquiv ⟨C.val ⊔ D.val, IsCyclicCode.sup (n := n) C.property D.property⟩ =
      cyclicIdealEquiv C ⊔ cyclicIdealEquiv D := by sorry
-- Unit test cyclic_ideal_zero.
example : cyclicIdealEquiv (zeroCyclicCode (F := F) (n := n)) = ⊥ := by sorry
-- Unit test cyclic_ideal_top.
example : cyclicIdealEquiv (fullCyclicCode (F := F) (n := n)) = ⊤ := by sorry

def evenThree : CyclicCode (ZMod 2) 3 := ⟨LinearMap.ker (parityMap (F := ZMod 2) (n := 3)), by sorry⟩
def constantWord : F →ₗ[F] (Fin n → F) :=
  { toFun := fun a _ => a
    map_add' := by sorry
    map_smul' := by sorry }
def repetitionThree : CyclicCode (ZMod 2) 3 := ⟨LinearMap.range (constantWord (F := ZMod 2) (n := 3)), by sorry⟩
-- Unit test cyclic_ideal_even_three.
example : cyclicIdealEquiv evenThree =
    Ideal.span {AdjoinRoot.mk ((X : (ZMod 2)[X])^3-1) (X+1)} := by sorry

def generatorPolynomial (C : CyclicCode F n) : F[X] := by sorry
lemma generatorPolynomial_monic (C : CyclicCode F n) : (generatorPolynomial C).Monic := by sorry
lemma generatorPolynomial_dvd (C : CyclicCode F n) : generatorPolynomial C ∣ (X : F[X])^n-1 := by sorry
lemma mem_code_iff_generator_dvd (C : CyclicCode F n) (c : Fin n → F) :
    c ∈ C.val ↔ generatorPolynomial C ∣ wordPolynomial c := by sorry
lemma generatorPolynomial_unique (C : CyclicCode F n) (g : F[X]) (hg : g.Monic)
    (hd : g ∣ (X : F[X])^n-1) (hmem : ∀ c, c ∈ C.val ↔ g ∣ wordPolynomial c) :
    g = generatorPolynomial C := by sorry
-- Unit test generator_zero.
example : generatorPolynomial (zeroCyclicCode (F := F) (n := n)) = (X : F[X])^n-1 := by sorry
-- Unit test generator_full.
example : generatorPolynomial (fullCyclicCode (F := F) (n := n)) = 1 := by sorry
-- Unit test generator_even_three.
example : generatorPolynomial evenThree = X+1 := by sorry
-- Unit test generator_repetition_three.
example : generatorPolynomial repetitionThree = X^2+X+1 := by sorry

def checkPolynomial (C : CyclicCode F n) : F[X] := ((X : F[X])^n-1) /ₘ generatorPolynomial C
lemma generator_mul_check (C : CyclicCode F n) :
    generatorPolynomial C * checkPolynomial C = (X : F[X])^n-1 := by sorry
lemma checkPolynomial_monic (C : CyclicCode F n) : (checkPolynomial C).Monic := by sorry
lemma mem_code_iff_check_annihilates (C : CyclicCode F n) (c : Fin n → F) :
    c ∈ C.val ↔ AdjoinRoot.mk ((X : F[X])^n-1) (checkPolynomial C) * cyclicWordEquiv c = 0 := by sorry
lemma checkPolynomial_coeff_zero_ne (C : CyclicCode F n) : (checkPolynomial C).coeff 0 ≠ 0 := by sorry
-- Unit test check_zero.
example : checkPolynomial (zeroCyclicCode (F := F) (n := n)) = 1 := by sorry
-- Unit test check_full.
example : checkPolynomial (fullCyclicCode (F := F) (n := n)) = (X : F[X])^n-1 := by sorry
-- Unit test check_even_three.
example : checkPolynomial evenThree = X^2+X+1 := by sorry
-- Unit test check_wrong_annihilator: multiplication by g is not a parity check.
example : let g := AdjoinRoot.mk ((X : (ZMod 2)[X])^3-1) (X+1)
    g*g = AdjoinRoot.mk ((X : (ZMod 2)[X])^3-1) (X^2+1) ∧ g*g ≠ 0 := by sorry

theorem cyclicCode_finrank (C : CyclicCode F n) :
    Module.finrank F C.val = n - (generatorPolynomial C).natDegree := by sorry
lemma cyclicCode_polynomial_basis (C : CyclicCode F n) :
    ∃ b : Module.Basis (Fin (n - (generatorPolynomial C).natDegree)) F C.val,
      ∀ i, cyclicWordEquiv (b i).val = AdjoinRoot.mk ((X : F[X])^n-1)
        (X^(i : ℕ) * generatorPolynomial C) := by sorry

-- Native bilinear orthogonal; Mathlib already supplies its finite-dimensional rank formula.
-- Generic duality is imported from AlgebraicCodingTheory Layer 2; this is its native
-- dot-product binding for the cyclic comparison, with no new ownership node.
def euclideanDual (C : TauCeti.LinearCode F (Fin n)) : TauCeti.LinearCode F (Fin n) :=
  LinearMap.BilinForm.orthogonal (dotProductBilin F F) C
lemma cyclicCode_dual_cyclic (C : CyclicCode F n) : IsCyclicCode (euclideanDual C.val) := by sorry
def cyclicDual (C : CyclicCode F n) : CyclicCode F n := ⟨euclideanDual C.val, cyclicCode_dual_cyclic C⟩
theorem cyclicCode_dual_generator (C : CyclicCode F n) :
    generatorPolynomial (cyclicDual C) =
      Polynomial.C (((checkPolynomial C).coeff 0)⁻¹) * (checkPolynomial C).reverse := by sorry

-- No coprime-characteristic assumption is needed above. Exact-order roots supply it here.
theorem cyclic_bch_bound {E : Type*} [Field E] [Algebra F E]
    (C : CyclicCode F n) (ζ : Eˣ) (hζ : orderOf ζ = n) (b δ : ℕ)
    (hδ : 2 ≤ δ) (hδn : δ ≤ n+1)
    (hroots : ∀ j : Fin (δ-1),
      (generatorPolynomial C).eval₂ (algebraMap F E) ((ζ : E)^(b+(j : ℕ))) = 0)
    (c : Fin n → F) (hc : c ∈ C.val) (hc0 : c ≠ 0) : δ ≤ hammingNorm c := by sorry
end CyclicCodes

/-! ## Native assembly bindings for parent-owned AG targets.
These declarations replace the parent's TC stand-in roles. They are not new JSON owners.
-/
namespace NativeAG
variable {k H : Type*} [Field k] [Field H] [Algebra k H]
def rationalEval (P : TauCeti.Place k H) (hP : P.degree = 1) : P.integers →ₐ[k] k :=
  { toFun := fun f => (P.residueFieldEquivOfDegreeEqOne hP).symm (IsLocalRing.residue P.integers f)
    map_zero' := by sorry
    map_one' := by sorry
    map_add' := by sorry
    map_mul' := by sorry
    commutes' := by sorry }
lemma rationalEval_ker (P : TauCeti.Place k H) (hP : P.degree = 1) :
    RingHom.ker (rationalEval P hP).toRingHom = IsLocalRing.maximalIdeal P.integers := by sorry
lemma rationalEval_surjective (P : TauCeti.Place k H) (hP : P.degree = 1) :
    Function.Surjective (rationalEval P hP) := by sorry
example (P : TauCeti.Place k H) (hP : P.degree = 1) (c : k) :
    rationalEval P hP (algebraMap k P.integers c) = c := by sorry

variable {ι : Type*} [Fintype ι]
def pointDivisor (P : ι → TauCeti.Place k H) : TauCeti.Divisor k H :=
  ∑ i : ι, AlgebraicGeometry.WeilDivisor.ofPoint (P i)
def evaluationMap (P : ι → TauCeti.Place k H) (hP : ∀ i, (P i).degree = 1)
    (G : TauCeti.Divisor k H) (hG : ∀ i, G.coeff (P i) = 0) :
    TauCeti.riemannRochSpace G →ₗ[k] (ι → k) :=
  { toFun := fun f i => rationalEval (P i) (hP i) ⟨f.val, by sorry⟩
    map_add' := by sorry
    map_smul' := by sorry }
def evaluationCode (P : ι → TauCeti.Place k H) (hP : ∀ i, (P i).degree = 1)
    (G : TauCeti.Divisor k H) (hG : ∀ i, G.coeff (P i) = 0) : TauCeti.LinearCode k ι :=
  LinearMap.range (evaluationMap P hP G hG)
lemma evaluationMap_ker (hH : TauCeti.IsFunctionField k H) (hex : IsIntegrallyClosedIn k H)
    (P : ι → TauCeti.Place k H) (hinj : Function.Injective P) (hP : ∀ i, (P i).degree = 1)
    (G : TauCeti.Divisor k H) (hG : ∀ i, G.coeff (P i) = 0) :
    LinearMap.ker (evaluationMap P hP G hG) =
      (TauCeti.riemannRochSpace (G-pointDivisor P)).comap (TauCeti.riemannRochSpace G).subtype := by sorry
lemma evaluationCode_finrank (hH : TauCeti.IsFunctionField k H) (hex : IsIntegrallyClosedIn k H)
    (P : ι → TauCeti.Place k H) (hinj : Function.Injective P) (hP : ∀ i, (P i).degree = 1)
    (G : TauCeti.Divisor k H) (hG : ∀ i, G.coeff (P i) = 0) :
    Module.finrank k (evaluationCode P hP G hG) =
      TauCeti.Divisor.dim G - TauCeti.Divisor.dim (G-pointDivisor P) := by sorry
lemma evaluationCode_goppa (hH : TauCeti.IsFunctionField k H) (hex : IsIntegrallyClosedIn k H)
    (P : ι → TauCeti.Place k H) (hinj : Function.Injective P) (hP : ∀ i, (P i).degree = 1)
    (G : TauCeti.Divisor k H) (hG : ∀ i, G.coeff (P i) = 0)
    (hdeg : TauCeti.Divisor.degree G < Fintype.card ι)
    (c : ι → k) (hc : c ∈ evaluationCode P hP G hG) (hc0 : c ≠ 0) :
    (Fintype.card ι : ℤ) - TauCeti.Divisor.degree G ≤ (hammingNorm c : ℤ) := by sorry

def residueMap (P : ι → TauCeti.Place k H) (G : TauCeti.Divisor k H) :
    TauCeti.weilDifferentialFiltration (G-pointDivisor P) →ₗ[k] (ι → k) :=
  { toFun := fun ω i => TauCeti.repartitionDualComponent ω.val (P i) 1
    map_add' := by sorry
    map_smul' := by sorry }
lemma residueCode_eq_dual (hH : TauCeti.IsFunctionField k H) (hex : IsIntegrallyClosedIn k H)
    (P : ι → TauCeti.Place k H) (hinj : Function.Injective P) (hP : ∀ i, (P i).degree = 1)
    (G : TauCeti.Divisor k H) (hG : ∀ i, G.coeff (P i) = 0) :
    LinearMap.range (residueMap P G) =
      LinearMap.BilinForm.orthogonal (dotProductBilin k k) (evaluationCode P hP G hG) := by sorry
-- Actual RatFunc places, with the native equivalence and no labelled-place replacement.
example (a b : k) (h : (TauCeti.Place.ratFuncDegreeOneEquiv k (some a)).val =
    (TauCeti.Place.ratFuncDegreeOneEquiv k (some b)).val) : a = b := by sorry
example (hintegral : (1 / RatFunc.X : RatFunc k) ∈ (TauCeti.Place.infty k).integers) :
    rationalEval (TauCeti.Place.infty k) (by sorry) ⟨1 / RatFunc.X, hintegral⟩ = 0 := by sorry
end NativeAG

/-! ## Hermitian monomial codes, using an actual finite point carrier. -/
section Hermitian
variable (p : ℕ) (K : Type*) [Field K]
def HermitianPoints : Type _ := {z : K × K // z.2^p + z.2 = z.1^(p+1)}
instance [Fintype K] : Fintype (HermitianPoints p K) := Fintype.ofEquiv {z : K × K // z.2^p + z.2 = z.1^(p+1)} (Equiv.refl _)
def hermitianMessageSpace (l : ℕ) : Submodule K (MvPolynomial (Fin 2) K) :=
  Submodule.span K {f | ∃ i j : ℕ, i ≤ p ∧ i+j ≤ l ∧
    f = (MvPolynomial.X (0 : Fin 2))^i * (MvPolynomial.X (1 : Fin 2))^j}
def hermitianEval (l : ℕ) : hermitianMessageSpace p K l →ₗ[K] (HermitianPoints p K → K) :=
  { toFun := fun f z => MvPolynomial.eval (fun i : Fin 2 => if i = 0 then z.val.1 else z.val.2) f.val
    map_add' := by sorry
    map_smul' := by sorry }
def hermitianCode (l : ℕ) : TauCeti.LinearCode K (HermitianPoints p K) :=
  LinearMap.range (hermitianEval p K l)
lemma mem_hermitianCode (l : ℕ) (c : HermitianPoints p K → K) :
    c ∈ hermitianCode p K l ↔ ∃ f : hermitianMessageSpace p K l, hermitianEval p K l f = c := by sorry
lemma hermitianCode_mono (l l' : ℕ) (h : l ≤ l') : hermitianCode p K l ≤ hermitianCode p K l' := by sorry
-- Unit test hermitian_degree_zero.
example : Module.finrank K (hermitianMessageSpace p K 0) = 1 ∧
    ∀ c, c ∈ hermitianCode p K 0 ↔ ∃ a : K, c = fun _ => a := by sorry
end Hermitian

theorem hermitianPoints_card (p : ℕ) [Fact p.Prime] (K : Type*) [Field K] [Fintype K]
    [CharP K p] (hK : Fintype.card K = p^2) : Fintype.card (HermitianPoints p K) = p^3 := by sorry

theorem hermitianMessage_finrank (p : ℕ) (K : Type*) [Field K] (l : ℕ) :
    Module.finrank K (hermitianMessageSpace p K l) =
      ∑ i ∈ Finset.range (min p l + 1), (l-i+1) := by sorry
lemma hermitianMessage_finrank_small (p : ℕ) (K : Type*) [Field K] (l : ℕ) (hl : l ≤ p) :
    Module.finrank K (hermitianMessageSpace p K l) = (l+1)*(l+2)/2 := by sorry
lemma hermitianMessage_finrank_large (p : ℕ) (K : Type*) [Field K] (l : ℕ) (hl : p-1 ≤ l) :
    Module.finrank K (hermitianMessageSpace p K l) = (l+1)*(p+1)-p*(p+1)/2 := by sorry

-- The native supplier's affine regular functions, not a fake curve carrier.
def regularAwayFrom {K H : Type*} [Field K] [Field H] [Algebra K H]
    (Pinf : TauCeti.Place K H) : Submodule K H :=
  { carrier := {f | ∀ P : TauCeti.Place K H, P ≠ Pinf → f ∈ P.integers}
    zero_mem' := by sorry
    add_mem' := by sorry
    smul_mem' := by sorry }
-- The supplier exports the coordinate-ring monomial basis as a genuine native Module.Basis.
-- Its existence, exact constants and pole orders are the AC layer-10 / Part II request.
theorem hermitianCode_eq_agCode (p : ℕ) [Fact p.Prime]
    {K H : Type*} [Field K] [Fintype K] [CharP K p] [Field H] [Algebra K H]
    (hK : Fintype.card K = p^2) (hH : TauCeti.IsFunctionField K H)
    (hex : IsIntegrallyClosedIn K H) (x y : H) (hxy : y^p+y=x^(p+1))
    (Pinf : TauCeti.Place K H) (hinfty : Pinf.degree = 1)
    (hx : Pinf.ord x = -(p : ℤ)) (hy : Pinf.ord y = -((p+1 : ℕ) : ℤ))
    (b : Module.Basis (Fin (p+1) × ℕ) K (regularAwayFrom Pinf))
    (hb : ∀ i, (b i).val = x^(i.1 : ℕ) * y^i.2)
    (P : HermitianPoints p K → TauCeti.Place K H)
    (hinj : Function.Injective P) (hP : ∀ z, (P z).degree = 1) (hPinf : ∀ z, P z ≠ Pinf)
    (hxint : ∀ z, x ∈ (P z).integers) (hyint : ∀ z, y ∈ (P z).integers)
    (hxev : ∀ z, NativeAG.rationalEval (P z) (hP z) ⟨x,hxint z⟩ = z.val.1)
    (hyev : ∀ z, NativeAG.rationalEval (P z) (hP z) ⟨y,hyint z⟩ = z.val.2) (l : ℕ) :
    hermitianCode p K l = NativeAG.evaluationCode P hP
      ((l*(p+1) : ℕ) • AlgebraicGeometry.WeilDivisor.ofPoint Pinf) (by sorry) := by sorry

-- Proof uses the native Hermitian model above; the numerical statement itself has real types.
theorem hermitianCode_parameters (p : ℕ) [Fact p.Prime] (K : Type*) [Field K] [Fintype K]
    [CharP K p] (hK : Fintype.card K = p^2) (l : ℕ) (hl : l*(p+1) < p^3) :
    Fintype.card (HermitianPoints p K) = p^3 ∧
    Module.finrank K (hermitianCode p K l) = ∑ i ∈ Finset.range (min p l+1), (l-i+1) ∧
    ∀ c ∈ hermitianCode p K l, c ≠ 0 → p^3-l*(p+1) ≤ hammingNorm c := by sorry

-- Unit test hermitian_p_two_l_one: [8,3,5].
example {K : Type*} [Field K] [Fintype K] [CharP K 2] (hK : Fintype.card K = 4) :
    Fintype.card (HermitianPoints 2 K) = 8 ∧ Module.finrank K (hermitianCode 2 K 1) = 3 := by sorry
-- Unit test hermitian_p_two_l_two: [8,6,2].
example {K : Type*} [Field K] [Fintype K] [CharP K 2] (hK : Fintype.card K = 4) :
    Fintype.card (HermitianPoints 2 K) = 8 ∧ Module.finrank K (hermitianCode 2 K 2) = 6 := by sorry
-- Unit test hermitian_noninjective_boundary: the nonzero kernel polynomial is specified.
example {K : Type*} [Field K] [Fintype K] [CharP K 2] (hK : Fintype.card K = 4) :
    ∃ f : hermitianMessageSpace 2 K 3,
      f.val = MvPolynomial.X (0 : Fin 2) * (MvPolynomial.X (1 : Fin 2))^2 +
        MvPolynomial.X (0 : Fin 2) * MvPolynomial.X (1 : Fin 2) + MvPolynomial.X (0 : Fin 2) ∧
      f ≠ 0 ∧ hermitianEval 2 K 3 f = 0 := by sorry

/-! ## The actual quadratic norm-one torus and Katz's estimate. -/
section SotoAndrade
variable {F K : Type*} [Field F] [Fintype F] [Field K] [Fintype K]
variable [Algebra F K] [FiniteDimensional F K]
def NormOneUnits (F K : Type*) [Field F] [Field K] [Algebra F K]
    [FiniteDimensional F K] : Subgroup Kˣ :=
  (Units.map (Algebra.norm F (S := K))).ker
-- Even the trivial character is extended by zero at zero.
def unitCharZero (ε : Fˣ →* ℂˣ) (x : F) : ℂ :=
  if hx : x = 0 then 0 else (ε (Units.mk0 x hx) : ℂ)
def sotoAndradeSum (ε : Fˣ →* ℂˣ) (ω : NormOneUnits F K →* ℂˣ) (t : F) : ℂ :=
  ∑ u : NormOneUnits F K, unitCharZero ε (Algebra.trace F K (u.val : K) + t) * (ω u : ℂ)
lemma normOneUnits_card (h2 : Module.finrank F K = 2) :
    Fintype.card (NormOneUnits F K) = Fintype.card F + 1 := by sorry
lemma sotoAndradeSum_trivial (t : F) :
    sotoAndradeSum (K := K) 1 1 t =
      (Fintype.card (NormOneUnits F K) : ℂ) -
        (Fintype.card {u : NormOneUnits F K // Algebra.trace F K (u.val : K) + t = 0} : ℂ) := by sorry
lemma sotoAndradeSum_inversion (h2 : Module.finrank F K = 2)
    (ε : Fˣ →* ℂˣ) (ω : NormOneUnits F K →* ℂˣ) (t : F) :
    sotoAndradeSum ε ω t = sotoAndradeSum ε ω⁻¹ t := by sorry
-- Unit test soto_trivial_zero_extension.
example (u : NormOneUnits F K) (t : F) (h : Algebra.trace F K (u.val : K) + t = 0) :
    unitCharZero (1 : Fˣ →* ℂˣ) (Algebra.trace F K (u.val : K) + t) *
      ((1 : NormOneUnits F K →* ℂˣ) u : ℂ) = 0 := by sorry
-- Unit test soto_inverse_character.
example (h2 : Module.finrank F K = 2) (ε : Fˣ →* ℂˣ)
    (ω : NormOneUnits F K →* ℂˣ) (t : F) :
    sotoAndradeSum ε ω t = sotoAndradeSum ε ω⁻¹ t := by sorry
-- The omitted proof-side hypotheses are native character sheaves, tame local monodromy,
-- compact-support Euler characteristic and weight bounds. See the supplier contracts.
theorem sotoAndrade_norm_le (h2 : Module.finrank F K = 2)
    (hodd : Odd (Fintype.card F)) (ε : Fˣ →* ℂˣ)
    (ω : NormOneUnits F K →* ℂˣ) (t : F)
    (htriv : ¬ (ε = 1 ∧ ω = 1))
    (hquad : ¬ (orderOf ε = 2 ∧ orderOf ω = 2 ∧ (t = 2 ∨ t = -2))) :
    ‖sotoAndradeSum ε ω t‖ ≤ 2 * Real.sqrt (Fintype.card F) ∧
      ((t = 2 ∨ t = -2) → ‖sotoAndradeSum ε ω t‖ ≤ Real.sqrt (Fintype.card F)) := by sorry
end SotoAndrade

-- Unit test soto_q_three_trivial.
example {K : Type*} [Field K] [Fintype K] [Algebra (ZMod 3) K]
    [FiniteDimensional (ZMod 3) K] (h2 : Module.finrank (ZMod 3) K = 2) :
    sotoAndradeSum (F := ZMod 3) (K := K) 1 1 0 = 2 := by sorry
-- Unit test soto_q_three_quadratic.
example {K : Type*} [Field K] [Fintype K] [Algebra (ZMod 3) K]
    [FiniteDimensional (ZMod 3) K] (h2 : Module.finrank (ZMod 3) K = 2)
    (ε : (ZMod 3)ˣ →* ℂˣ) (ω : NormOneUnits (ZMod 3) K →* ℂˣ)
    (hε : orderOf ε = 2) (hω : orderOf ω = 4) : sotoAndradeSum ε ω 0 = -2 := by sorry

/-! ## Bind the parent's finite upper half-plane to its character sums. -/
section Terras
variable {F K : Type*} [Field F] [Fintype F] [Field K] [Fintype K]
variable [Algebra F K] [FiniteDimensional F K]
-- Transparent coordinate helpers for the parent carrier, distance and adjacency operator.
-- They do not introduce replacement roadmap definitions or new ownership IDs.
abbrev UpperHalfPlane (F : Type*) [Field F] := F × Fˣ
def upperHalfPlaneDistance (δ : F) (z w : UpperHalfPlane F) : F :=
  ((w.1-z.1)^2 - δ*((w.2 : F)-(z.2 : F))^2) / ((w.2 : F)*(z.2 : F))
def terrasAdjacency (δ a : F) : (UpperHalfPlane F → ℂ) →ₗ[ℂ] (UpperHalfPlane F → ℂ) :=
  { toFun := fun v z => ∑ w, if upperHalfPlaneDistance δ z w = a then v w else 0
    map_add' := by sorry
    map_smul' := by sorry }
def principalSeriesSum (ε₂ χ : Fˣ →* ℂˣ) (δ a : F) : ℂ :=
  ∑ y : Fˣ, (χ y : ℂ) * unitCharZero ε₂ (a*(y : F) + δ*((y : F)-1)^2)
-- The odd-characteristic spherical normalization/exhaustiveness is a recorded gap.
-- This is the target statement, not an assertion that KUANG94 proves the chosen convention.
theorem terras_eigenvalue_character_sum (h2 : Module.finrank F K = 2)
    (hodd : Odd (Fintype.card F)) (δ a : F) (hδ : ¬ IsSquare δ)
    (ha0 : a ≠ 0) (ha4 : a ≠ 4*δ) (ε₂ : Fˣ →* ℂˣ) (hε₂ : orderOf ε₂ = 2)
    (eigenvalue : ℂ) (v : UpperHalfPlane F → ℂ) (hv : v ≠ 0) (hmean : ∑ z, v z = 0)
    (heig : terrasAdjacency δ a v = eigenvalue • v) :
    (∃ s : ℂ, (s = 1 ∨ s = -1) ∧
      ((∃ χ : Fˣ →* ℂˣ, χ ≠ 1 ∧ eigenvalue = s * principalSeriesSum ε₂ χ δ a) ∨
        (∃ ω : NormOneUnits F K →* ℂˣ, ω ≠ 1 ∧
          eigenvalue = s * sotoAndradeSum ε₂ ω (a/δ-2)))) ∧
      ‖eigenvalue‖ ≤ 2 * Real.sqrt (Fintype.card F) := by sorry
end Terras

end TauCeti.FF4
end
