/-
This file is not the roadmap and is not exhaustive. The roadmap document is definitive.
These statements suggest Lean forms so contributors and reviewers converge on names and
signatures. Admitted proofs are planning aids and claim no implementation.

FiniteFieldsAndCharacterSums, FF.0–FF.5. The reader carries every target, proof route, API,
test and supplier contract. This compact file states milestones on existing native carriers
and gives only light definitions with actual data. Sheaf/cohomology and algorithm-program
carriers absent at the pins remain reader targets; no opaque substitute is introduced.

Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174;
Tau Ceti f790474821cf4256814db967cb154e7af3d0c369.
-/
import Mathlib.Algebra.BigOperators.Ring.Finset
import Mathlib.Algebra.Group.Hom.Instances
import Mathlib.Algebra.LinearRecurrence
import Mathlib.Algebra.MvPolynomial.Basic
import Mathlib.Algebra.MvPolynomial.Eval
import Mathlib.Algebra.MvPolynomial.PDeriv
import Mathlib.Algebra.Polynomial.Eval.SMul
import Mathlib.Algebra.Polynomial.FieldDivision
import Mathlib.Algebra.Polynomial.Module.AEval
import Mathlib.Algebra.Polynomial.Monic
import Mathlib.Algebra.Polynomial.SpecificDegree
import Mathlib.Algebra.RingQuot
import Mathlib.Algebra.SkewPolynomial.Basic
import Mathlib.Algebra.Squarefree.Basic
import Mathlib.AlgebraicGeometry.EllipticCurve.Affine.Point
import Mathlib.AlgebraicGeometry.EllipticCurve.DivisionPolynomial.Degree
import Mathlib.AlgebraicGeometry.EllipticCurve.NormalForms
import Mathlib.Analysis.Complex.Basic
import Mathlib.Analysis.Fourier.FiniteAbelian.Orthogonality
import Mathlib.Analysis.Fourier.FiniteAbelian.PontryaginDuality
import Mathlib.Analysis.Fourier.ZMod
import Mathlib.Analysis.SpecialFunctions.Complex.CircleAddChar
import Mathlib.Analysis.SpecialFunctions.Log.Base
import Mathlib.Analysis.SpecialFunctions.Pow.Real
import Mathlib.Analysis.SpecialFunctions.Trigonometric.Basic
import Mathlib.Combinatorics.SimpleGraph.AdjMatrix
import Mathlib.Data.Fintype.Pi
import Mathlib.Data.Nat.Choose.Multinomial
import Mathlib.Data.Nat.Digits.Defs
import Mathlib.Data.Nat.Digits.Lemmas
import Mathlib.Data.Nat.Fib.Basic
import Mathlib.Data.ZMod.Basic
import Mathlib.Dynamics.PeriodicPts.Defs
import Mathlib.FieldTheory.AbsoluteGaloisGroup
import Mathlib.FieldTheory.Finite.Basic
import Mathlib.FieldTheory.Finite.Extension
import Mathlib.FieldTheory.Finite.GaloisField
import Mathlib.FieldTheory.Finite.Trace
import Mathlib.FieldTheory.Galois.Basic
import Mathlib.FieldTheory.Galois.NormalBasis
import Mathlib.FieldTheory.IntermediateField.Algebraic
import Mathlib.FieldTheory.IsAlgClosed.AlgebraicClosure
import Mathlib.FieldTheory.IsAlgClosed.Basic
import Mathlib.FieldTheory.Minpoly.Basic
import Mathlib.FieldTheory.Perfect
import Mathlib.FieldTheory.RatFunc.AsPolynomial
import Mathlib.FieldTheory.RatFunc.Basic
import Mathlib.FieldTheory.RatFunc.Degree
import Mathlib.FieldTheory.Separable
import Mathlib.GroupTheory.GroupAction.Quotient
import Mathlib.GroupTheory.SpecificGroups.Cyclic
import Mathlib.InformationTheory.Hamming
import Mathlib.LinearAlgebra.BilinearForm.Orthogonal
import Mathlib.LinearAlgebra.Contraction
import Mathlib.LinearAlgebra.Determinant
import Mathlib.LinearAlgebra.Dimension.Constructions
import Mathlib.LinearAlgebra.Eigenspace.Basic
import Mathlib.LinearAlgebra.Lagrange
import Mathlib.LinearAlgebra.Matrix.GeneralLinearGroup.Defs
import Mathlib.LinearAlgebra.Matrix.Rank
import Mathlib.LinearAlgebra.Matrix.ToLin
import Mathlib.LinearAlgebra.QuadraticForm.Basic
import Mathlib.LinearAlgebra.Vandermonde
import Mathlib.NumberTheory.ArithmeticFunction.Moebius
import Mathlib.NumberTheory.Cyclotomic.Gal
import Mathlib.NumberTheory.GaussSum
import Mathlib.NumberTheory.JacobiSum.Basic
import Mathlib.NumberTheory.LegendreSymbol.AddCharacter
import Mathlib.NumberTheory.LegendreSymbol.Complex
import Mathlib.NumberTheory.LegendreSymbol.QuadraticChar.Basic
import Mathlib.NumberTheory.MulChar.Basic
import Mathlib.NumberTheory.MulChar.Duality
import Mathlib.NumberTheory.NumberField.Cyclotomic.Ideal
import Mathlib.Probability.Distributions.Uniform
import Mathlib.Probability.ProbabilityMassFunction.Constructions
import Mathlib.Probability.ProductMeasure
import Mathlib.RingTheory.AdicCompletion.Basic
import Mathlib.RingTheory.AdjoinRoot
import Mathlib.RingTheory.Binomial
import Mathlib.RingTheory.Henselian
import Mathlib.RingTheory.KrullDimension.Basic
import Mathlib.RingTheory.LaurentSeries
import Mathlib.RingTheory.LocalRing.ResidueField.Instances
import Mathlib.RingTheory.MvPolynomial.Homogeneous
import Mathlib.RingTheory.Norm.Basic
import Mathlib.RingTheory.Norm.Defs
import Mathlib.RingTheory.Polynomial.Basic
import Mathlib.RingTheory.Polynomial.Content
import Mathlib.RingTheory.Polynomial.DegreeLT
import Mathlib.RingTheory.Polynomial.Dickson
import Mathlib.RingTheory.Polynomial.Resultant.Basic
import Mathlib.RingTheory.PowerSeries.Basic
import Mathlib.RingTheory.PowerSeries.Derivative
import Mathlib.RingTheory.Radical.Basic
import Mathlib.RingTheory.RootsOfUnity.Basic
import Mathlib.RingTheory.TensorProduct.Maps
import Mathlib.RingTheory.Trace.Basic
import Mathlib.RingTheory.TwoSidedIdeal.Operations
import Mathlib.RingTheory.UniqueFactorizationDomain.NormalizedFactors
import Mathlib.RingTheory.WittVector.Compare
import Mathlib.RingTheory.WittVector.Teichmuller
import Mathlib.RingTheory.WittVector.Truncated
import Mathlib.Tactic.NormNum
import Mathlib.Tactic.Ring
import TauCeti.FieldTheory.FunctionField.Differential.LocalComponent
import TauCeti.FieldTheory.FunctionField.Divisor.ProductFormula
import TauCeti.FieldTheory.FunctionField.Place.RatFunc.Basic
import TauCeti.FieldTheory.FunctionField.RiemannRoch.Basic
import TauCeti.InformationTheory.Coding.Basic

noncomputable section
open scoped BigOperators TensorProduct
open Polynomial
attribute [local instance] Classical.propDecidable

namespace TauCeti.FiniteFieldSums

/-! ## FF.0. Presentations and finite-field comparisons. -/
section FF0
variable {F : Type*} [Field F] [Fintype F]
noncomputable def frobResidue (f : F[X]) : ℕ → F[X]
  | 0 => X %ₘ f
  | k + 1 => (frobResidue f k) ^ Fintype.card F %ₘ f

theorem rabin_irreducible_iff_frobResidue {f : F[X]} (hf : f.Monic) (hn : 0 < f.natDegree) :
    Irreducible f ↔
      frobResidue f f.natDegree = X %ₘ f ∧
        ∀ s ∈ f.natDegree.primeFactors, IsCoprime (frobResidue f (f.natDegree / s) - X) f := by
  sorry

theorem factorization_over_extension (E : Type*) [Field E] [Algebra F E] [Finite E]
    {f : F[X]} (hf : f.Monic) (hirr : Irreducible f) :
    ∃ s : Finset E[X],
      s.card = Nat.gcd f.natDegree (Module.finrank F E) ∧
      (∀ g ∈ s, g.Monic ∧ Irreducible g ∧
        g.natDegree = f.natDegree / Nat.gcd f.natDegree (Module.finrank F E)) ∧
      ∏ g ∈ s, g = f.map (algebraMap F E) := by
  sorry

-- The explicit tensor map is a theorem target; its construction is not admitted data.
theorem tensorProduct_comparison (K L M : Type*) [Field K] [Field L] [Field M]
    [Algebra F K] [Algebra F L] [Algebra F M] [Finite K] [Finite L] [Finite M]
    (ιK : K →ₐ[F] M) (ιL : L →ₐ[F] M)
    (hM : Module.finrank F M = Nat.lcm (Module.finrank F K) (Module.finrank F L)) :
    ∃ e : K ⊗[F] L ≃ₐ[F]
      (Fin (Nat.gcd (Module.finrank F K) (Module.finrank F L)) → M),
      ∀ a b i, e (a ⊗ₜ b) i =
        (ιK a) ^ (Fintype.card F ^ (i : ℕ)) * ιL b := by sorry

-- The normality criterion is stated directly on the existing Frobenius endomorphism.
theorem normal_iff_forall_irreducible_factor (E : Type*) [Field E] [Algebra F E]
    [Finite E] (α : E) :
    LinearIndependent F (fun i : Fin (Module.finrank F E) =>
      (FiniteField.frobeniusAlgHom F E)^[i] α) ↔
      ∀ h : F[X], h.Monic → Irreducible h → h ∣ X ^ Module.finrank F E - 1 →
        aeval (FiniteField.frobeniusAlgHom F E).toLinearMap
          ((X ^ Module.finrank F E - 1) /ₘ h) α ≠ 0 := by sorry

example : frobResidue (X ^ 2 + X + 1 : (ZMod 2)[X]) 1 = X + 1 := by sorry
example (k : ℕ) : frobResidue (X : F[X]) k = 0 := by sorry
end FF0

/-! ## FF.0. Intermediate fields and elementary polynomial counts.
Legacy FF.2/FF.3 census IDs stay stable in the reader; ownership is FF.0.
These targets use finite algebra, not character-sum estimates. -/
section IntermediateFields
variable (F E : Type*) [Field F] [Fintype F] [Field E] [Algebra F E]
variable [FiniteDimensional F E]

theorem intermediateField_divisor_correspondence :
    ∃ e : IntermediateField F E ≃ {d : ℕ // d ∣ Module.finrank F E},
      (∀ K, (e K).val = Module.finrank F K) ∧
      (∀ d x, x ∈ e.symm d ↔ x ^ (Fintype.card F ^ d.val) = x) ∧
      ∀ K L, K ≤ L ↔ (e K).val ∣ (e L).val := by sorry

theorem existsUnique_intermediateField_finrank {d : ℕ} (hd : d ∣ Module.finrank F E) :
    ∃! K : IntermediateField F E, Module.finrank F K = d := by sorry

-- Divisibility is the order here: 2 ≤ 3 does not imply degree-2 containment in degree 3.
example (h : Module.finrank F E = 6) :
    ¬ ∃ K : IntermediateField F E, Module.finrank F K = 4 := by sorry
example (h : Module.finrank F E = 1) :
    ∃! K : IntermediateField F E, Module.finrank F K = 1 := by sorry
end IntermediateFields

section ElementaryCensus
variable (F : Type*) [Field F] [Fintype F] [DecidableEq F]
def monicOfDegree (n : ℕ) : Finset F[X] := by
  classical
  exact Finset.univ.image fun v : Fin n → F =>
    X ^ n + ((degreeLTEquiv F n).symm v : F[X])

def monicIrreducibles (n : ℕ) : Finset F[X] := by
  classical
  exact (monicOfDegree F n).filter Irreducible

theorem gauss_product_formula (n : ℕ) (hn : 0 < n) :
    ∏ d ∈ n.divisors, ∏ f ∈ monicIrreducibles F d, f =
      X ^ (Fintype.card F ^ n) - X := by sorry

theorem gauss_count_formula (n : ℕ) (hn : 0 < n) :
    ∑ d ∈ n.divisors, d * (monicIrreducibles F d).card = Fintype.card F ^ n := by sorry

theorem irreducible_count_bounds (n : ℕ) (hn : 0 < n) :
    (Fintype.card F : ℚ) ^ n / (2 * n) ≤ ((monicIrreducibles F n).card : ℚ) ∧
      ((monicIrreducibles F n).card : ℚ) ≤ (Fintype.card F : ℚ) ^ n / n := by sorry

theorem card_monic_prescribed_constant (n : ℕ) (b : F) :
    ((monicOfDegree F n).filter fun f => f.coeff 0 = b).card =
      if n = 0 then (if b = 1 then 1 else 0) else Fintype.card F ^ (n - 1) := by
  sorry

example : monicIrreducibles (ZMod 2) 2 = {X ^ 2 + X + 1} := by sorry
example : (monicIrreducibles (ZMod 2) 1).card = 2 := by sorry
example : monicIrreducibles (ZMod 2) 0 = ∅ := by sorry
example : ((monicOfDegree (ZMod 3) 0).filter fun f => f.coeff 0 = 0).card = 0 := by sorry
end ElementaryCensus

/-! ## FF.0. Shared linearized polynomials over commutative finite-field algebras. -/
def _root_.Polynomial.IsLinearized {K : Type*} [CommSemiring K] (q : ℕ) (L : K[X]) : Prop :=
  ∀ n ∈ L.support, ∃ i, n = q ^ i

noncomputable def _root_.Polynomial.linearizedOf {K : Type*} [CommSemiring K] (q : ℕ) (a : ℕ →₀ K) :
    K[X] :=
  a.sum fun i c => C c * X ^ (q ^ i)

section Linearized
variable {F K E : Type*} [Field F] [Fintype F] [CommRing K] [CommRing E]
variable [Algebra F K] [Algebra K E] [Algebra F E] [IsScalarTower F K E]

def _root_.Polynomial.IsLinearized.toLinearMap {L : K[X]}
    (hL : L.IsLinearized (Fintype.card F)) : E →ₗ[F] E where
  toFun x := aeval x L
  map_add' := by sorry
  map_smul' := by sorry

-- The statement has general coefficient rings; Frobenius invertibility is unnecessary.
theorem linearized_comp {L M : K[X]} (hL : L.IsLinearized (Fintype.card F))
    (hM : M.IsLinearized (Fintype.card F)) :
    (L.comp M).IsLinearized (Fintype.card F) := by sorry
end Linearized

/-! The one Ore/composition comparison is a reader construction awaiting its early FF.0 binding;
finite-field function quotients remain FF.4 targets;
there is no admitted Frobenius action or admitted ring/equivalence data here. -/

-- Distinguish a polynomial law from its values on the finite base field.
example : (X ^ 2 - X : (ZMod 2)[X]) ≠ 0 := by sorry
example (x : ZMod 2) : (X ^ 2 - X : (ZMod 2)[X]).eval x = 0 := by sorry
example : (0 : (ZMod 2)[X]).IsLinearized 2 := by sorry

/-! ## FF.1. Character conventions, Fourier transport and Gauss identities. -/
section CanonicalCharacter
variable (F : Type*) [CommRing F] [Fintype F] (p : ℕ) [Fact p.Prime]
variable [Algebra (ZMod p) F]
noncomputable def traceAddChar {R : Type*} [CommMonoid R] (ζ : R) (hζ : ζ ^ p = 1) : AddChar F R :=
  (AddChar.zmodChar p hζ).compAddMonoidHom (Algebra.trace (ZMod p) F).toAddMonoidHom

noncomputable def canonicalAddChar : AddChar F ℂ :=
  (ZMod.stdAddChar (N := p)).compAddMonoidHom (Algebra.trace (ZMod p) F).toAddMonoidHom

theorem isPrimitive_canonicalAddChar {K : Type*} [Field K] [Fintype K] [Algebra (ZMod p) K] :
    (canonicalAddChar K p).IsPrimitive := by
  sorry

theorem canonicalAddChar_eq_exp (x : F) (t : ℤ) (ht : (t : ZMod p) = Algebra.trace (ZMod p) F x) :
    canonicalAddChar F p x = Complex.exp (2 * Real.pi * Complex.I * t / p) := by
  sorry

end CanonicalCharacter
theorem bijective_mulShift_of_isPrimitive {F : Type*} [Field F] [Fintype F] {R : Type*}
    [CommRing R] [IsDomain R] {ψ : AddChar F R} (hψ : ψ.IsPrimitive) :
    Function.Bijective ψ.mulShift := by
  sorry

section CharacterLifts
variable {F : Type*} [Field F] [Fintype F]
variable (E : Type*) [Field E] [Fintype E] [Algebra F E]

def liftNorm (χ : MulChar F ℂ) : MulChar E ℂ :=
  MulChar.ofUnitHom (χ.toUnitHom.comp (Units.map (Algebra.norm F (S := E))))

def liftTrace (ψ : AddChar F ℂ) : AddChar E ℂ :=
  ψ.compAddMonoidHom (Algebra.trace F E).toAddMonoidHom

theorem hasseDavenport_lifting (χ : MulChar F ℂ) (ψ : AddChar F ℂ)
    (hψ : ψ.IsPrimitive) :
    gaussSum (liftNorm E χ) (liftTrace E ψ) =
      (-1 : ℂ) ^ (Module.finrank F E - 1) * gaussSum χ ψ ^ Module.finrank F E := by sorry
end CharacterLifts

section FourierAndProducts
variable {F : Type*} [Field F] [Fintype F]
theorem finiteField_fourier_transport (ψ : AddChar F ℂ) (hψ : ψ.IsPrimitive)
    (f g : F → ℂ) (x : F) :
    (∑ a : F, (AddChar.complexBasis F).repr f (ψ.mulShift a) * ψ (a * x) = f x) ∧
    ((Fintype.card F : ℂ)⁻¹ * ∑ y : F, f y * star (g y) =
      ∑ a : F, (AddChar.complexBasis F).repr f (ψ.mulShift a) *
        star ((AddChar.complexBasis F).repr g (ψ.mulShift a))) := by sorry

theorem mulChar_fourier_boundary (ψ : AddChar F ℂ) (hψ : ψ.IsPrimitive)
    (χ : MulChar F ℂ) (a : F) :
    (AddChar.complexBasis F).repr (fun x => χ x) (ψ.mulShift a) =
      if a = 0 then
        if χ = 1 then ((Fintype.card F : ℂ) - 1) / (Fintype.card F : ℂ) else 0
      else (Fintype.card F : ℂ)⁻¹ * (χ⁻¹) (-a) * gaussSum χ ψ := by
  classical
  sorry

theorem digit_product_distribution (p f m b : ℕ) (hp : p.Prime) (hf : 0 < f)
    (hm : 0 < m) (hdiv : m ∣ p ^ f - 1) (hb : b < (p ^ f - 1) / m) :
    let d := (p ^ f - 1) / m
    let s := fun r => (Nat.digits p r).sum
    let h := fun r => ((Nat.digits p r).map Nat.factorial).prod
    (∑ j ∈ Finset.range m, s (b + j * d) =
      s (m * b) + ∑ j ∈ Finset.Ico 1 m, s (j * d)) ∧
    ((m : ZMod p) ^ s (m * b) * ∏ j ∈ Finset.range m, (h (b + j * d) : ZMod p) =
      (h (m * b) : ZMod p) * ∏ j ∈ Finset.Ico 1 m, (h (j * d) : ZMod p)) := by sorry

theorem hasseDavenport_product (χ ρ : MulChar F ℂ) (ψ : AddChar F ℂ)
    (m : ℕ) (hm : 0 < m) (hdiv : m ∣ Fintype.card F - 1)
    (hρ : orderOf ρ = m) (hψ : ψ.IsPrimitive) :
    gaussSum (χ ^ m) ψ * ∏ j ∈ Finset.Ico 1 m, gaussSum (ρ ^ j) ψ =
      χ (m : F) ^ m * ∏ j ∈ Finset.range m, gaussSum (χ * ρ ^ j) ψ := by sorry

def projectiveEval (d : ℕ) (x : Option F) : Polynomial.degreeLT F (d + 1) →ₗ[F] F :=
  match x with
  | none => (Polynomial.lcoeff F d).comp (Polynomial.degreeLT F (d + 1)).subtype
  | some a => (Polynomial.leval a).comp (Polynomial.degreeLT F (d + 1)).subtype

theorem projectiveEval_pair_uniform (d : ℕ) (hd : 1 ≤ d) (x y : Option F) (hxy : x ≠ y) :
    Function.Surjective (fun P : Polynomial.degreeLT F (d + 1) =>
      (projectiveEval d x P, projectiveEval d y P)) ∧
    ∀ u v : F, Nat.card {P : Polynomial.degreeLT F (d + 1) //
      projectiveEval d x P = u ∧ projectiveEval d y P = v} =
      Fintype.card F ^ (d - 1) := by sorry

local instance degreeLTFintype (d : ℕ) : Fintype (Polynomial.degreeLT F (d + 1)) :=
  Fintype.ofEquiv (Fin (d + 1) → F) (Polynomial.degreeLTEquiv F (d + 1)).symm.toEquiv
theorem projectiveEval_character_correlation (d : ℕ) (hd : 1 ≤ d)
    (x y : Option F) (hxy : x ≠ y) (χ φ : MulChar F ℂ) (hχ : χ ≠ 1) :
    ∑ P : Polynomial.degreeLT F (d + 1),
      χ (projectiveEval d x P) * φ (projectiveEval d y P) = 0 := by sorry

theorem gaussSum_finiteProduct {ι : Type*} [Fintype ι] (K : ι → Type*)
    [∀ i, Field (K i)] [∀ i, Fintype (K i)]
    (χ : MulChar (∀ i, K i) ℂ) (ψ : AddChar (∀ i, K i) ℂ)
    (χi : ∀ i, MulChar (K i) ℂ) (ψi : ∀ i, AddChar (K i) ℂ)
    (hχ : ∀ x, χ x = ∏ i, χi i (x i))
    (hψ : ∀ x, ψ x = ∏ i, ψi i (x i)) :
    gaussSum χ ψ = ∏ i, gaussSum (χi i) (ψi i) := by sorry

-- Infinity reads the fixed degree-two coefficient, not the leading coefficient.
example : projectiveEval (F := ZMod 3) 2 none
    ⟨Polynomial.monomial 1 1,
      Polynomial.monomial_coe_mem_degreeLT (⟨1, by decide⟩ : Fin 3) 1⟩ = 0 := by sorry
end FourierAndProducts

/-! ## FF.2. Arithmetic forms on native carriers.
The geometric trace, conductor, family and weight statements are in the reader. -/
namespace FF2
def IsPrimitiveMulChar {R : Type*} [CommRing R] (χ : MulChar R ℂ) : Prop :=
  ∀ I : Ideal R, I ≠ ⊥ → ∃ u : Rˣ, (u : R) - 1 ∈ I ∧ χ (u : R) ≠ 1

theorem IsPrimitiveMulChar.field_iff {F : Type*} [Field F] [Fintype F]
    (χ : MulChar F ℂ) : IsPrimitiveMulChar χ ↔ χ ≠ 1 := by
  sorry

theorem IsPrimitiveMulChar.quotient_iff {R : Type*} [CommRing R] [Fintype R]
    [Nontrivial R] (χ : MulChar R ℂ) :
    IsPrimitiveMulChar χ ↔ χ ≠ 1 ∧
      ∀ I : Ideal R, I ≠ ⊥ → I ≠ ⊤ →
        ¬ ∃ f : (R ⧸ I)ˣ →* ℂˣ,
          χ.toUnitHom = f.comp (Units.map (Ideal.Quotient.mk I).toMonoidHom) := by
  sorry

theorem primitiveFiniteRingGaussNorm {R : Type*} [CommRing R] [Fintype R]
    [Nontrivial R] (χ : MulChar R ℂ) (ψ : AddChar R ℂ)
    (hχ : IsPrimitiveMulChar χ) (hψ : ψ.IsPrimitive) :
    (∀ a : R, gaussSum χ (ψ.mulShift a) = χ⁻¹ a * gaussSum χ ψ) ∧
      ‖gaussSum χ ψ‖ ^ 2 = (Fintype.card R : ℝ) ∧
      gaussSum χ ψ * gaussSum χ⁻¹ ψ⁻¹ = (Fintype.card R : ℂ) := by
  sorry

def quotientTopCoefficient {F : Type*} [Field F] (g : Polynomial F) (hg : g.Monic)
    (r : AdjoinRoot g) : F :=
  (AdjoinRoot.modByMonicHom hg r).coeff (g.natDegree - 1)

def quotientAddChar {F : Type*} [Field F] (g : Polynomial F) (hg : g.Monic)
    (ψ : AddChar F ℂ) : AddChar (AdjoinRoot g) ℂ where
  toFun r := ψ (quotientTopCoefficient g hg r)
  map_zero_eq_one' := by sorry
  map_add_eq_mul' := by sorry

theorem polynomialQuotientFrobeniusPairing {F : Type*} [Field F] [Fintype F]
    (g : Polynomial F) (hg : g.Monic) (hd : 0 < g.natDegree)
    (ψ : AddChar F ℂ) (hψ : ψ ≠ 1) :
    (∀ r : AdjoinRoot g, r ≠ 0 →
      ∃ h : AdjoinRoot g, quotientTopCoefficient g hg (r * h) ≠ 0) ∧
      (∀ j : ℕ, j ≤ g.natDegree → ∀ r : AdjoinRoot g,
        (∀ h : AdjoinRoot g,
          (AdjoinRoot.modByMonicHom hg h).degree < (j : WithBot ℕ) →
            quotientTopCoefficient g hg (r * h) = 0) ↔
          (AdjoinRoot.modByMonicHom hg r).degree <
            ((g.natDegree - j : ℕ) : WithBot ℕ)) ∧
      (quotientAddChar g hg ψ).IsPrimitive := by
  sorry

def hyperKloosterman {F : Type*} [Field F] [Fintype F]
    (ψ : AddChar F ℂ) (k : ℕ) (a : F) : ℂ :=
  ∑ x : Fin k → F, if ∏ i, x i = a then ψ (∑ i, x i) else 0

theorem hyperKloosterman.extension {F K L : Type*} [Field F] [Field K] [Field L]
    [Fintype F] [Fintype K] [Fintype L] [Algebra F K] [Algebra F L]
    [FiniteDimensional F K] [FiniteDimensional F L]
    (e : K ≃ₐ[F] L) (ψ : AddChar F ℂ) (k : ℕ) (a : K) :
    hyperKloosterman (ψ.compAddMonoidHom (Algebra.trace F L).toAddMonoidHom) k (e a) =
      hyperKloosterman (ψ.compAddMonoidHom (Algebra.trace F K).toAddMonoidHom) k a := by
  sorry

theorem hyperKloostermanBound {F : Type*} [Field F] [Fintype F]
    (ψ : AddChar F ℂ) (hψ : ψ ≠ 1) (k : ℕ) (hk : 0 < k) (a : F) (ha : a ≠ 0) :
    ‖hyperKloosterman ψ k a‖ ≤
      (k : ℝ) * (Fintype.card F : ℝ) ^ (((k - 1 : ℕ) : ℝ) / 2) := by sorry

example {F : Type*} [Field F] [Fintype F] (ψ : AddChar F ℂ) (a : F) :
    hyperKloosterman ψ 1 a = ψ a := by sorry
example {F : Type*} [Field F] [Fintype F] (ψ : AddChar F ℂ) (hψ : ψ ≠ 1) :
    hyperKloosterman ψ 2 0 = -1 := by sorry
end FF2

/-! ## FF.3. Squarefree/hyperelliptic censuses and algorithm consumers.
Executable programs/cost semantics and general point-model comparisons remain reader targets. -/
section PolynomialCounts
variable (F : Type*) [Field F] [Fintype F] [DecidableEq F]
def monicSquarefreeOfDegree (n : ℕ) : Finset F[X] := by
  classical
  exact (monicOfDegree F n).filter Squarefree

theorem existsUnique_monic_squarefree_square {f : F[X]} (hf : f.Monic) :
    ∃! hm : F[X] × F[X],
      hm.1.Monic ∧ hm.2.Monic ∧ Squarefree hm.1 ∧
      f = hm.1 * hm.2 ^ 2 ∧ f.natDegree = hm.1.natDegree + 2 * hm.2.natDegree := by
  sorry

theorem card_monicSquarefreeOfDegree (n : ℕ) :
    (monicSquarefreeOfDegree F n).card =
      if n = 0 then 1 else if n = 1 then Fintype.card F
      else Fintype.card F ^ n - Fintype.card F ^ (n - 1) := by
  sorry

def hyperellipticPolynomials (g : ℕ) : Finset F[X] := by
  classical
  exact ((Finset.univ : Finset Fˣ).product
    (monicSquarefreeOfDegree F (2 * g + 1) ∪
      monicSquarefreeOfDegree F (2 * g + 2))).image
    fun ah => C (ah.1 : F) * ah.2

theorem card_hyperellipticPolynomials (g : ℕ) :
    (hyperellipticPolynomials F g).card = (Fintype.card F - 1) *
      ((monicSquarefreeOfDegree F (2 * g + 1)).card +
        (monicSquarefreeOfDegree F (2 * g + 2)).card) ∧
    (hyperellipticPolynomials F g).card =
      if g = 0 then Fintype.card F ^ 2 * (Fintype.card F - 1)
      else (Fintype.card F - 1) *
        (Fintype.card F ^ (2 * g + 2) - Fintype.card F ^ (2 * g)) := by
  sorry

example : (monicSquarefreeOfDegree (ZMod 2) 2).card = 2 := by sorry
example : (hyperellipticPolynomials (ZMod 3) 0).card = 18 := by sorry
end PolynomialCounts

/-! ## FF.4. Reed–Solomon codes on the existing linear-code carrier. -/
section Codes
variable {F : Type*} [Field F] [DecidableEq F] {ι : Type*} [Fintype ι]
theorem exists_hammingNorm_le_singleton (C : Submodule F (ι → F)) (hk : 1 ≤ Module.finrank F C) :
    ∃ c ∈ C, c ≠ 0 ∧ hammingNorm c + Module.finrank F C ≤ Fintype.card ι + 1 := sorry

def IsMDS (C : Submodule F (ι → F)) : Prop :=
  ∀ c ∈ C, c ≠ 0 → Fintype.card ι + 1 ≤ hammingNorm c + Module.finrank F C

noncomputable def reedSolomonEncode (α : ι → F) (k : ℕ) : degreeLT F k →ₗ[F] (ι → F) :=
  (LinearMap.pi fun i => Polynomial.leval (α i)) ∘ₗ (degreeLT F k).subtype

noncomputable def reedSolomon (α : ι → F) (k : ℕ) : Submodule F (ι → F) :=
  LinearMap.range (reedSolomonEncode α k)

theorem finrank_reedSolomon {α : ι → F} (hα : Function.Injective α) {k : ℕ}
    (hk : k ≤ Fintype.card ι) : Module.finrank F (reedSolomon α k) = k := sorry

theorem isMDS_reedSolomon {α : ι → F} (hα : Function.Injective α) {k : ℕ} (hk1 : 1 ≤ k)
    (hk : k ≤ Fintype.card ι) :
    IsMDS (reedSolomon α k) ∧ ∃ c ∈ reedSolomon α k, hammingNorm c + k = Fintype.card ι + 1 := sorry

end Codes
end TauCeti.FiniteFieldSums
-- The FF.4 continuation's proposed namespace is retained for its native adapters.
namespace TauCeti.FF4
section PrincipalUnits
variable [Fact (Nat.Prime 2)]
local notation "GR" => fun n r => TruncatedWittVector 2 n (GaloisField 2 r)
theorem principalTwoUnits_card_pow_eq_one (n r k : ℕ)
    (hn : 3 ≤ n) (hr : 1 ≤ r) (hk : 1 ≤ k) (hkn : k ≤ n - 2) :
    Nat.card {u : (GR n r)ˣ //
      (∃ a : GR n r, (u : GR n r) = 1 + 2 * a) ∧ u ^ (2 ^ k) = 1} =
      2 ^ (r * k + 1) := by sorry

end PrincipalUnits
/-! ## FF.4. Trace sequences and Walsh correlation. -/
instance finiteFieldPeriodNeZero (E : Type*) [Field E] [Fintype E] :
    NeZero (Fintype.card E - 1) := ⟨by sorry⟩
section Walsh
variable {F E : Type*} [Field F] [Fintype F] [Field E] [Fintype E]
variable [Algebra F E] [FiniteDimensional F E]
local notation "N" => Fintype.card E - 1
def traceWord (α : Eˣ) (A : E) : ZMod N → F :=
  fun i => Algebra.trace F E (A * (α : E) ^ i.val)

def shiftWord {ι : Type*} {M : ℕ} [NeZero M] (t : ZMod M) (v : ZMod M → ι) : ZMod M → ι :=
  fun i => v (i + t)

def periodicCorr {M : ℕ} [NeZero M] (ψ : AddChar F ℂ)
    (b a : ZMod M → F) (t : ZMod M) : ℂ :=
  ∑ i : ZMod M, ψ (b i) * star (ψ (a (i + t)))

def traceWalsh (ψ : AddChar F ℂ) (B : E → F) (y : E) : ℂ :=
  ∑ x : E, ψ (B x) * star (ψ (Algebra.trace F E (y * x)))

def IsTraceBent (ψ : AddChar F ℂ) (B : E → F) : Prop :=
  ∀ y, ‖traceWalsh ψ B y‖ = Real.sqrt (Fintype.card E)

theorem periodicCorr_traceWalsh (ψ : AddChar F ℂ) (B : E → F) (α : Eˣ)
    (hα : orderOf α = N) (t : ZMod N) :
    periodicCorr ψ (fun i => B ((α : E) ^ i.val)) (traceWord (F := F) α 1) t + ψ (B 0) =
      traceWalsh ψ B ((α : E) ^ t.val) := by sorry

theorem bent_correlation_norm (ψ : AddChar F ℂ) (B : E → F)
    (hB : IsTraceBent ψ B) (α : Eˣ) (hα : orderOf α = N) (t : ZMod N) :
    ‖periodicCorr ψ (fun i => B ((α : E) ^ i.val))
      (traceWord (F := F) α 1) t + ψ (B 0)‖ = Real.sqrt (Fintype.card E) := by sorry
end Walsh
section Geometric
variable {p : ℕ} [Fact p.Prime]
variable {L K : Type*} [Field L] [Fintype L] [Field K] [Fintype K]
variable [Algebra (ZMod p) L] [Algebra L K] [Algebra (ZMod p) K]
variable [IsScalarTower (ZMod p) L K] [FiniteDimensional (ZMod p) L]
variable [FiniteDimensional L K] [FiniteDimensional (ZMod p) K]
local notation "N" => Fintype.card K - 1
def geometricSequence (α : Kˣ) (f : L → ZMod p) : ZMod N → ZMod p :=
  fun i => f (Algebra.trace L K ((α : K) ^ i.val))

def gmwSequence (α : Kˣ) (h : ℕ) (_hh : 1 ≤ h)
    (_hcop : Nat.Coprime h (Fintype.card L - 1)) : ZMod N → ZMod p :=
  geometricSequence α (fun u : L => Algebra.trace (ZMod p) L (u^h))

theorem gmw_autocorrelation (α : Kˣ) (hα : orderOf α = N) (h : ℕ) (hh : 1 ≤ h)
    (hcop : Nat.Coprime h (Fintype.card L - 1)) (ψ : AddChar (ZMod p) ℂ) (hψ : ψ ≠ 0)
    (t : ZMod N) :
    periodicCorr ψ (gmwSequence α h hh hcop) (gmwSequence α h hh hcop) t =
      if t = 0 then (N : ℂ) else -1 := by sorry

theorem gmw_block_count (α : Kˣ) (hα : orderOf α = N) (h : ℕ) (hh : 1 ≤ h)
    (hcop : Nat.Coprime h (Fintype.card L - 1)) (j : ℕ) (hj : 1 ≤ j)
    (hjm : j ≤ Module.finrank L K) (w : Fin j → ZMod p) :
    Nat.card {i : ZMod N // ∀ k : Fin j, gmwSequence α h hh hcop (i + (k : ℕ)) = w k} =
      Fintype.card K / p^j - if w = 0 then 1 else 0 := by sorry

end Geometric
/-! ## FF.4. Native places, Riemann–Roch spaces and AG codes. -/
namespace NativeAG
variable {k H : Type*} [Field k] [Field H] [Algebra k H]
def rationalEval (P : TauCeti.Place k H) (hP : P.degree = 1) : P.integers →ₐ[k] k :=
  { toFun := fun f => (P.residueFieldEquivOfDegreeEqOne hP).symm (IsLocalRing.residue P.integers f)
    map_zero' := by sorry
    map_one' := by sorry
    map_add' := by sorry
    map_mul' := by sorry
    commutes' := by sorry }

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

end NativeAG
/-! ## FF.4. Concrete Hermitian codes and their native curve comparison. -/
section Hermitian
variable (p : ℕ) (K : Type*) [Field K]
def HermitianPoints : Type _ := {z : K × K // z.2^p + z.2 = z.1^(p+1)}

instance [Fintype K] : Fintype (HermitianPoints p K) :=
  Fintype.ofEquiv {z : K × K // z.2 ^ p + z.2 = z.1 ^ (p+1)} (Equiv.refl _)
def hermitianMessageSpace (l : ℕ) : Submodule K (MvPolynomial (Fin 2) K) :=
  Submodule.span K {f | ∃ i j : ℕ, i ≤ p ∧ i+j ≤ l ∧
    f = (MvPolynomial.X (0 : Fin 2))^i * (MvPolynomial.X (1 : Fin 2))^j}

def hermitianEval (l : ℕ) : hermitianMessageSpace p K l →ₗ[K] (HermitianPoints p K → K) :=
  { toFun := fun f z => MvPolynomial.eval (fun i : Fin 2 => if i = 0 then z.val.1 else z.val.2) f.val
    map_add' := by sorry
    map_smul' := by sorry }

def hermitianCode (l : ℕ) : TauCeti.LinearCode K (HermitianPoints p K) :=
  LinearMap.range (hermitianEval p K l)

end Hermitian
theorem hermitianPoints_card (p : ℕ) [Fact p.Prime] (K : Type*) [Field K] [Fintype K]
    [CharP K p] (hK : Fintype.card K = p^2) : Fintype.card (HermitianPoints p K) = p^3 := by sorry

theorem hermitianMessage_finrank (p : ℕ) (K : Type*) [Field K] (l : ℕ) :
    Module.finrank K (hermitianMessageSpace p K l) =
      ∑ i ∈ Finset.range (min p l + 1), (l-i+1) := by sorry

def regularAwayFrom {K H : Type*} [Field K] [Field H] [Algebra K H]
    (Pinf : TauCeti.Place K H) : Submodule K H :=
  { carrier := {f | ∀ P : TauCeti.Place K H, P ≠ Pinf → f ∈ P.integers}
    zero_mem' := by sorry
    add_mem' := by sorry
    smul_mem' := by sorry }

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

theorem hermitianCode_parameters (p : ℕ) [Fact p.Prime] (K : Type*) [Field K] [Fintype K]
    [CharP K p] (hK : Fintype.card K = p^2) (l : ℕ) (hl : l*(p+1) < p^3) :
    Fintype.card (HermitianPoints p K) = p^3 ∧
    Module.finrank K (hermitianCode p K l) = ∑ i ∈ Finset.range (min p l+1), (l-i+1) ∧
    ∀ c ∈ hermitianCode p K l, c ≠ 0 → p^3-l*(p+1) ≤ hammingNorm c := by sorry

example {K : Type*} [Field K] [Fintype K] [CharP K 2] (hK : Fintype.card K = 4) :
    Fintype.card (HermitianPoints 2 K) = 8 ∧
      Module.finrank K (hermitianCode 2 K 1) = 3 := by sorry
/-! ## FF.4. Quadratic norm-one sums and the finite-plane spectrum. -/
section SotoAndrade
variable {F K : Type*} [Field F] [Fintype F] [Field K] [Fintype K]
variable [Algebra F K] [FiniteDimensional F K]
def NormOneUnits (F K : Type*) [Field F] [Field K] [Algebra F K]
    [FiniteDimensional F K] : Subgroup Kˣ :=
  (Units.map (Algebra.norm F (S := K))).ker

def unitCharZero (ε : Fˣ →* ℂˣ) (x : F) : ℂ :=
  if hx : x = 0 then 0 else (ε (Units.mk0 x hx) : ℂ)

def sotoAndradeSum (ε : Fˣ →* ℂˣ) (ω : NormOneUnits F K →* ℂˣ) (t : F) : ℂ :=
  ∑ u : NormOneUnits F K, unitCharZero ε (Algebra.trace F K (u.val : K) + t) * (ω u : ℂ)

theorem sotoAndrade_norm_le (h2 : Module.finrank F K = 2)
    (hodd : Odd (Fintype.card F)) (ε : Fˣ →* ℂˣ)
    (ω : NormOneUnits F K →* ℂˣ) (t : F)
    (htriv : ¬ (ε = 1 ∧ ω = 1))
    (hquad : ¬ (orderOf ε = 2 ∧ orderOf ω = 2 ∧ (t = 2 ∨ t = -2))) :
    ‖sotoAndradeSum ε ω t‖ ≤ 2 * Real.sqrt (Fintype.card F) ∧
      ((t = 2 ∨ t = -2) → ‖sotoAndradeSum ε ω t‖ ≤ Real.sqrt (Fintype.card F)) := by sorry

end SotoAndrade
section Terras
variable {F K : Type*} [Field F] [Fintype F] [Field K] [Fintype K]
variable [Algebra F K] [FiniteDimensional F K]
abbrev UpperHalfPlane (F : Type*) [Field F] := F × Fˣ

def upperHalfPlaneDistance (δ : F) (z w : UpperHalfPlane F) : F :=
  ((w.1-z.1)^2 - δ*((w.2 : F)-(z.2 : F))^2) / ((w.2 : F)*(z.2 : F))

def terrasAdjacency (δ a : F) : (UpperHalfPlane F → ℂ) →ₗ[ℂ] (UpperHalfPlane F → ℂ) :=
  { toFun := fun v z => ∑ w, if upperHalfPlaneDistance δ z w = a then v w else 0
    map_add' := by sorry
    map_smul' := by sorry }

def principalSeriesSum (ε₂ χ : Fˣ →* ℂˣ) (δ a : F) : ℂ :=
  ∑ y : Fˣ, (χ y : ℂ) * unitCharZero ε₂ (a*(y : F) + δ*((y : F)-1)^2)

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
namespace TauCeti.FiniteFieldSums
/-! ## FF.5. Prime-modulus estimates and exact secret-sharing fibres. -/
theorem norm_sum_stdAddChar_eval_le (f : ℤ[X]) (hd : 1 ≤ f.natDegree) (p : ℕ) [Fact p.Prime]
    (hlead : ¬ (p : ℤ) ∣ f.leadingCoeff) (hp : f.natDegree < p) :
    ‖∑ x : ZMod p, ZMod.stdAddChar ((f.map (Int.castRingHom (ZMod p))).eval x)‖ ≤
      (f.natDegree - 1 : ℝ) * Real.sqrt p := sorry

theorem norm_sum_stdAddChar_eval_le_uniform (f : ℤ[X]) (hd : 1 ≤ f.natDegree) (p : ℕ)
    [Fact p.Prime] :
    ‖∑ x : ZMod p, ZMod.stdAddChar ((f.map (Int.castRingHom (ZMod p))).eval x)‖ ≤
      max (f.natDegree - 1 : ℝ) (Real.sqrt (max f.natDegree f.leadingCoeff.natAbs)) * Real.sqrt p :=
  sorry

theorem abs_sum_quadraticChar_eval_le (g : ℤ[X]) (hn : 1 ≤ g.natDegree) (hdisc : g.discr ≠ 0)
    (p : ℕ) [Fact p.Prime] (hp2 : p ≠ 2) (hp : ¬ (p : ℤ) ∣ g.leadingCoeff * g.discr) :
    |(∑ x : ZMod p, quadraticChar (ZMod p) ((g.map (Int.castRingHom (ZMod p))).eval x) : ℤ)| ≤
      (g.natDegree - 1 : ℝ) * Real.sqrt p := sorry

noncomputable def kloostermanModP (p : ℕ) [Fact p.Prime] (m n : ZMod p) : ℂ :=
  ∑ x : (ZMod p)ˣ, ZMod.stdAddChar (m * (x : ZMod p) + n * ((x⁻¹ : (ZMod p)ˣ) : ZMod p))

theorem card_sq_eq_eval {F : Type*} [Field F] [Fintype F] [DecidableEq F] (hF : ringChar F ≠ 2)
    (g : F[X]) :
    (Fintype.card {xy : F × F // xy.2 ^ 2 = g.eval xy.1} : ℤ) =
      Fintype.card F + ∑ x : F, quadraticChar F (g.eval x) := sorry

theorem abs_card_sq_eq_eval_sub_le {F : Type*} [Field F] [Fintype F] [DecidableEq F]
    (hF : ringChar F ≠ 2) (g : F[X]) {K : Type*} [Field K] [IsAlgClosed K] [DecidableEq K] [Algebra F K]
    (hsq : ∀ (c : F) (h : K[X]), g.map (algebraMap F K) ≠ C (algebraMap F K c) * h ^ 2) :
    |((Fintype.card {xy : F × F // xy.2 ^ 2 = g.eval xy.1} : ℤ) - Fintype.card F : ℝ)| ≤
      ((g.map (algebraMap F K)).roots.toFinset.card - 1 : ℝ) * Real.sqrt (Fintype.card F) := sorry

theorem card_lifts_of_nonsingular {n : ℕ} (F : MvPolynomial (Fin n) ℤ) (p : ℕ) [Fact p.Prime]
    (m : ℕ) (hm : 1 ≤ m) (x : Fin n → ZMod (p ^ m))
    (hx : MvPolynomial.eval x (MvPolynomial.map (Int.castRingHom _) F) = 0)
    (hgrad : ∃ i, MvPolynomial.eval (fun j => ((x j).val : ZMod p))
      (MvPolynomial.map (Int.castRingHom _) (MvPolynomial.pderiv i F)) ≠ 0) :
    Nat.card {y : Fin n → ZMod (p ^ (m + 1)) //
      (∀ j, ((y j).val : ZMod (p ^ m)) = x j) ∧
        MvPolynomial.eval y (MvPolynomial.map (Int.castRingHom _) F) = 0} = p ^ (n - 1) := sorry

theorem card_zeros_mod_prime_pow {n : ℕ} (F : MvPolynomial (Fin n) ℤ) (p : ℕ) [Fact p.Prime]
    (hgood : ∀ x : Fin n → ZMod p, MvPolynomial.eval x (MvPolynomial.map (Int.castRingHom _) F) = 0 →
      ∃ i, MvPolynomial.eval x (MvPolynomial.map (Int.castRingHom _) (MvPolynomial.pderiv i F)) ≠ 0)
    (m : ℕ) (hm : 1 ≤ m) :
    Nat.card {y : Fin n → ZMod (p ^ m) // MvPolynomial.eval y (MvPolynomial.map (Int.castRingHom _) F) = 0} =
      p ^ ((m - 1) * (n - 1)) *
        Nat.card {x : Fin n → ZMod p // MvPolynomial.eval x (MvPolynomial.map (Int.castRingHom _) F) = 0} :=
  sorry

theorem diffieHellman_correct {M : Type*} [CommMonoid M] (γ : M) (x y : ℕ) :
    (γ ^ y) ^ x = (γ ^ x) ^ y := sorry

noncomputable def shamirShares {F : Type*} [Field F] {n t : ℕ} (x : Fin n → F) (s : F)
    (c : Fin (t - 1) → F) : Fin n → F :=
  fun i => (C s + ∑ j, C (c j) * X ^ ((j : ℕ) + 1)).eval (x i)

section Shamir
variable {F : Type*} [Field F] [Fintype F] [DecidableEq F] {n t : ℕ}
theorem shamir_reconstruct (x : Fin n → F) (hx : Function.Injective x) (ht : 1 ≤ t) (s : F)
    (c : Fin (t - 1) → F) (S : Finset (Fin n)) (hS : S.card = t) :
    s = ∑ i ∈ S, shamirShares (t := t) x s c i * ∏ j ∈ S.erase i, x j / (x j - x i) := sorry

theorem shamir_card_fiber (x : Fin n → F) (hx : Function.Injective x) (hx0 : ∀ i, x i ≠ 0)
    (ht : 1 ≤ t)
    (S : Finset (Fin n)) (hS : S.card ≤ t - 1) (s : F) (v : S → F) :
    Nat.card {c : Fin (t - 1) → F // ∀ i : S, shamirShares (t := t) x s c i = v i} =
      Fintype.card F ^ (t - 1 - S.card) := sorry

example [Fact (Nat.Prime 5)] : shamirShares (t := 2) (![1, 2, 3] : Fin 3 → ZMod 5) 3 ![1] =
    ![4, 0, 1] := by sorry
end Shamir

end TauCeti.FiniteFieldSums
