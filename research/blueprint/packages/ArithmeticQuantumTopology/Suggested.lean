/-
This file is not the roadmap and is not exhaustive. README.md is definitive.
These statements suggest Lean forms so contributors can converge on names and
signatures. They claim no implementation. The concrete algebraic and analytic
interfaces below include rank-one completed quantum algebras; geometric supplier
carriers remain missing.
The handoff records the signatures still requiring those supplier interfaces.
-/
import Mathlib.CategoryTheory.Monoidal.Braided.Basic
import Mathlib.CategoryTheory.Monoidal.Rigid.Basic
import Mathlib.Algebra.Polynomial.Laurent
import Mathlib.Analysis.Distribution.TemperedDistribution
import Mathlib.Analysis.Meromorphic.NormalForm
import Mathlib.Analysis.Complex.CauchyIntegral
import Mathlib.Analysis.SpecialFunctions.Complex.Log
import Mathlib.Analysis.SpecialFunctions.Trigonometric.Complex
import Mathlib.Analysis.SpecialFunctions.Pow.Real
import Mathlib.Data.Matrix.Basis
import Mathlib.Data.ZMod.Basic
import Mathlib.Data.Rat.Lemmas
import Mathlib.Data.Rat.Cast.Order
import Mathlib.RingTheory.Coprime.Lemmas
import Mathlib.Tactic.LinearCombination
import Mathlib.GroupTheory.FreeAbelianGroup
import Mathlib.GroupTheory.QuotientGroup.Defs
import Mathlib.Algebra.Group.Subgroup.ZPowers.Basic
import Mathlib.Analysis.SpecialFunctions.Complex.LogDeriv
import Mathlib.LinearAlgebra.ExteriorPower.Basic
import Mathlib.Topology.Connected.PathConnected
import Mathlib.Topology.Constructions
import Mathlib.LinearAlgebra.Matrix.Trace
import Mathlib.LinearAlgebra.Matrix.Kronecker
import Mathlib.LinearAlgebra.TensorProduct.Basic
import Mathlib.RingTheory.PowerSeries.Exp
import Mathlib.RingTheory.PowerSeries.Substitution
import Mathlib.RingTheory.PowerSeries.Expand
import Mathlib.Algebra.MvPolynomial.PDeriv
import Mathlib.NumberTheory.BernoulliPolynomials
import Mathlib.LinearAlgebra.Matrix.IsDiag
import Mathlib.LinearAlgebra.Matrix.ToLin
import Mathlib.LinearAlgebra.Matrix.GeneralLinearGroup.Defs
import Mathlib.LinearAlgebra.Matrix.SpecialLinearGroup
import Mathlib.MeasureTheory.Integral.Bochner.Basic
import Mathlib.RingTheory.Localization.FractionRing
import Mathlib.RingTheory.Ideal.Quotient.Operations
import Mathlib.RingTheory.Polynomial.Chebyshev
import Mathlib.RingTheory.RootsOfUnity.PrimitiveRoots
import Mathlib.Topology.Algebra.InfiniteSum.Ring
import Mathlib.Topology.Algebra.Ring.Basic
import Mathlib.Topology.UniformSpace.Pi

import Mathlib.Algebra.FreeAlgebra
import Mathlib.Algebra.Algebra.Subalgebra.Basic
import Mathlib.Algebra.RingQuot
import Mathlib.RingTheory.PowerSeries.Inverse
import Mathlib.RingTheory.PowerSeries.Trunc
import Mathlib.Analysis.Asymptotics.Defs
import Mathlib.Algebra.Lie.Classical
import Mathlib.Algebra.Lie.UniversalEnveloping
import Mathlib.Algebra.Polynomial.AlgebraMap
import Mathlib.LinearAlgebra.Basis.Basic
import Mathlib.RingTheory.PowerSeries.PiTopology
import Mathlib.Algebra.Algebra.Subalgebra.Lattice
import Mathlib.RingTheory.TwoSidedIdeal.Operations
import Mathlib.RingTheory.Congruence.Hom
import Mathlib.RingTheory.PiTensorProduct
import Mathlib.Algebra.Category.ModuleCat.ChangeOfRings
import Mathlib.CategoryTheory.ObjectProperty.FullSubcategory
import Mathlib.LinearAlgebra.Dual.Defs
import Mathlib.LinearAlgebra.Dual.Basis
import Mathlib.Topology.Algebra.Nonarchimedean.AdicTopology
import Mathlib.LinearAlgebra.FreeModule.Finite.Basic
import TauCeti.KnotTheory.Markov

noncomputable section
open Polynomial LaurentPolynomial Finset MeasureTheory
open scoped Topology

namespace TauCeti.QuantumTopology

/-! QT.0: algebraic interfaces for imported linking matrices. -/
section LinkingMatrices
variable {n : ℕ}

def IsAlgebraicallySplit (A : Matrix (Fin n) (Fin n) ℤ) : Prop :=
  ∀ i j, i ≠ j → A i j = 0

def IsAdmissible (A : Matrix (Fin n) (Fin n) ℤ) : Prop :=
  IsAlgebraicallySplit A ∧ ∀ i, A i i = 1 ∨ A i i = -1

theorem isAdmissible_iff (A : Matrix (Fin n) (Fin n) ℤ) :
    IsAdmissible A ↔ A.IsDiag ∧ ∀ i, (A i i).natAbs = 1 := sorry

theorem isAdmissible_empty : IsAdmissible (0 : Matrix (Fin 0) (Fin 0) ℤ) := sorry

/-- Matrix-level side of homology_surgery; the geometric comparison is imported. -/
abbrev linkingMatrixCokernel (A : Matrix (Fin n) (Fin n) ℤ) : Type :=
  (Fin n → ℤ) ⧸ LinearMap.range A.mulVecLin

theorem linkingMatrixCokernel_trivial_iff (A : Matrix (Fin n) (Fin n) ℤ) :
    Subsingleton (linkingMatrixCokernel A) ↔ IsUnit A.det := sorry

theorem linkingMatrixCokernel_of_isAdmissible {A : Matrix (Fin n) (Fin n) ℤ}
    (h : IsAdmissible A) : Subsingleton (linkingMatrixCokernel A) := sorry

def handleSlide (A : Matrix (Fin n) (Fin n) ℤ) (i j : Fin n) : Matrix (Fin n) (Fin n) ℤ :=
  Matrix.transpose (1 + Matrix.single j i 1) * A * (1 + Matrix.single j i 1)

/-- Symmetry is essential to replace A_ij + A_ji by 2 A_ij. -/
theorem linkingMatrix_congr_of_handleSlide (A : Matrix (Fin n) (Fin n) ℤ)
    (hA : A.IsSymm) {i j : Fin n} (hij : i ≠ j) :
    IsUnit (1 + Matrix.single j i (1 : ℤ)).det ∧
      handleSlide A i j i i = A i i + A j j + 2 * A i j := sorry

-- linkingMatrix_hopf
example : ¬ IsAlgebraicallySplit !![(0 : ℤ), 1; 1, 0] := sorry
-- not_algebraicallySplit_of_det_ne
example (A : Matrix (Fin 2) (Fin 2) ℤ) (h : A 0 1 ≠ 0) :
    ¬ IsAlgebraicallySplit A := sorry
-- homology_surgery_unknot_p (matrix side, including ZMod 0 = ℤ)
example (p : ℤ) : Nonempty (linkingMatrixCokernel !![p] ≃+ ZMod p.natAbs) := sorry
-- isAdmissible_unknot_one
example : IsAdmissible !![(1 : ℤ)] := sorry
-- not_isAdmissible_unknot_zero
example : IsAlgebraicallySplit !![(0 : ℤ)] ∧ ¬ IsAdmissible !![(0 : ℤ)] := sorry
-- not_isAdmissible_hopf
example : ¬ IsAdmissible !![(1 : ℤ), 1; 1, 1] := sorry
-- framing_of_handleSlide
example : handleSlide !![(0 : ℤ), 1; 1, 0] 0 1 0 0 = 2 := sorry
end LinkingMatrices

/-! A framing regression against the pinned native braid presentation.
The coefficient matrix is the one-component part of the QT.0 checks; no
linking-number, geometric framing relation or surgery type is constructed. -/
namespace FramingChecks

/-- A native one-strand closure, with its only component framed by f. -/
def oneStrand (f : ℤ) : TauCeti.FramedMarkovBraid where
  forgetFraming := ⟨0, 1⟩
  framing := fun _ => f

/-- The one-component coefficient matrix, read from the actual framing field.
This fixture does not construct a geometric linking-number operation. -/
def coefficientMatrix (f : ℤ) : Matrix (Fin 1) (Fin 1) ℤ :=
  !![(oneStrand f).framing (Quotient.mk _ (0 : Fin 1))]

theorem coefficientMatrix_eq (f : ℤ) : coefficientMatrix f = !![f] := rfl

theorem forgotten_eq (f g : ℤ) :
    (oneStrand f).forgetFraming = (oneStrand g).forgetFraming := rfl

theorem markovEquiv_forget (f g : ℤ) :
    TauCeti.MarkovEquiv (oneStrand f).forgetFraming (oneStrand g).forgetFraming :=
  TauCeti.MarkovEquiv.refl _

theorem isAdmissible_coefficientMatrix_iff (f : ℤ) :
    IsAdmissible (coefficientMatrix f) ↔ f = 1 ∨ f = -1 := by
  constructor
  · intro h
    exact h.2 0
  · intro h
    constructor
    · intro i j hij
      exact (hij (Subsingleton.elim i j)).elim
    · intro i
      fin_cases i
      exact h

/-- Forgetting framing relates presentations on opposite sides of admissibility. -/
theorem framing_change_admissibility :
    TauCeti.MarkovEquiv (oneStrand 0).forgetFraming (oneStrand 1).forgetFraming ∧
      ¬ IsAdmissible (coefficientMatrix 0) ∧ IsAdmissible (coefficientMatrix 1) := by
  refine ⟨markovEquiv_forget 0 1, ?_, ?_⟩
  · rw [isAdmissible_coefficientMatrix_iff]
    norm_num
  · exact (isAdmissible_coefficientMatrix_iff 1).mpr (Or.inl rfl)

/-- Even a predicate on the forgotten carrier cannot recover these framing tests. -/
theorem admissibility_not_descends :
    ¬ ∃ P : TauCeti.MarkovBraid → Prop,
      ∀ f : ℤ, P (oneStrand f).forgetFraming ↔ IsAdmissible (coefficientMatrix f) := by
  rintro ⟨P, hP⟩
  have hOne := (hP 1).mpr framing_change_admissibility.2.2
  exact framing_change_admissibility.2.1 ((hP 0).mp hOne)

end FramingChecks

/-! QT.1: ribbon structure extends the pinned braided and rigid categories. -/
section RibbonCategories
universe u v
open CategoryTheory CategoryTheory.MonoidalCategory
variable (C : Type u) [Category.{v} C] [MonoidalCategory C]
  [BraidedCategory C] [RigidCategory C]

structure RibbonCategory where
  twist : 𝟭 C ≅ 𝟭 C
  twist_unit : twist.hom.app (𝟙_ C) = 𝟙 (𝟙_ C)
  twist_tensor : ∀ X Y : C,
    twist.hom.app (X ⊗ Y) =
      (twist.hom.app X ⊗ₘ twist.hom.app Y) ≫ (β_ X Y).hom ≫ (β_ Y X).hom
  twist_dual : ∀ X : C, twist.hom.app (Xᘁ) = (twist.hom.app X)ᘁ

variable {C}

theorem ribbonTwist_tensor (r : RibbonCategory C) (X Y : C) :
    r.twist.hom.app (X ⊗ Y) =
      (r.twist.hom.app X ⊗ₘ r.twist.hom.app Y) ≫ (β_ X Y).hom ≫ (β_ Y X).hom := sorry

theorem ribbonTwist_dual (r : RibbonCategory C) (X : C) :
    r.twist.hom.app (Xᘁ) = (r.twist.hom.app X)ᘁ := sorry

/-- Close a strand using the positive twist and right evaluation/coevaluation. -/
def ribbonTrace (r : RibbonCategory C) {X : C} (f : X ⟶ X) : (𝟙_ C) ⟶ (𝟙_ C) :=
  η_ X (Xᘁ) ≫ ((f ≫ r.twist.hom.app X) ⊗ₘ 𝟙 (Xᘁ)) ≫
    (β_ X (Xᘁ)).hom ≫ ε_ X (Xᘁ)

-- ribbonTwist_unit
example (r : RibbonCategory C) : r.twist.hom.app (𝟙_ C) = 𝟙 (𝟙_ C) := sorry
end RibbonCategories

/-! QT.1–QT.2: Laurent color conventions. V denotes a representation-algebra
polynomial; the native finite free color and its pivotal trace appear below. -/
abbrev LaurentBase := LaurentPolynomial ℤ
abbrev ColourField := FractionRing LaurentBase

def qInt (n : ℕ) : LaurentBase :=
  ∑ i ∈ range n, T ((n : ℤ) - 1 - 2 * i)

-- quantum_dimension_V1 (the character value)
example : qInt 2 = T 1 + T (-1) ∧ qInt 2 ≠ 2 := sorry

def V (n : ℕ) : Polynomial LaurentBase := Polynomial.Chebyshev.S LaurentBase n

def P (n : ℕ) : Polynomial LaurentBase :=
  ∏ i ∈ range n, (X - Polynomial.C (T (2 * i + 1) + T (-(2 * i + 1))))

theorem P_basis : ∃ b : Module.Basis ℕ LaurentBase (Polynomial LaurentBase),
    ∀ n, b n = P n := sorry

def vPower (k : ℤ) : ColourField := algebraMap LaurentBase ColourField (T k)
def quantumBrace (k : ℤ) : ColourField := vPower k - vPower (-k)
def braceFactorial (n : ℕ) : ColourField := ∏ j ∈ range n, quantumBrace (j + 1)
def fallingBrace (a : ℤ) (b : ℕ) : ColourField :=
  ∏ j ∈ range b, quantumBrace (a - j)
def P_fraction (n : ℕ) : Polynomial ColourField :=
  (P n).map (algebraMap LaurentBase ColourField)
def P_prime (n : ℕ) : Polynomial ColourField :=
  Polynomial.C ((braceFactorial n)⁻¹) * P_fraction n
def P_doublePrime (n : ℕ) : Polynomial ColourField :=
  Polynomial.C ((fallingBrace (2 * n + 1) (2 * n))⁻¹) * P_fraction n
def P_tildePrime (n : ℕ) : Polynomial ColourField :=
  Polynomial.C (vPower (-((n : ℤ) * (n - 1) / 2))) * P_prime n

/-- The actual q=v² ground subring; it is smaller than the v-Laurent ring. -/
def qGround : Subring ColourField := Subring.closure {vPower 2, vPower (-2)}

/-- The colour lattice uses the tilde-normalized basis and q ground ring. -/
def algebraP : Submodule qGround (Polynomial ColourField) :=
  Submodule.span qGround (Set.range P_tildePrime)

def filtration (k : ℕ) : Submodule qGround (Polynomial ColourField) :=
  Submodule.span qGround {x | ∃ n ≥ k, x = P_tildePrime n}

theorem algebraP_isSubalgebra (x y : Polynomial ColourField)
    (hx : x ∈ algebraP) (hy : y ∈ algebraP) : x * y ∈ algebraP := sorry

theorem filtration_mul (k l : ℕ) (x y : Polynomial ColourField)
    (hx : x ∈ filtration k) (hy : y ∈ filtration l) :
    x * y ∈ filtration (max k l) := sorry

-- P_zero_eq_one
example : P 0 = 1 ∧ P_prime 0 = 1 ∧ P_doublePrime 0 = 1 := sorry
-- P_one
example : P 1 = V 1 - Polynomial.C (qInt 2) := sorry
-- P_rescalings_distinct
example : P_doublePrime 1 ≠ P_prime 1 := sorry
-- mul_P_one_one, in the prime basis (not the tilde basis)
example : P_prime 1 * P_prime 1 =
    Polynomial.C (braceFactorial 2 / braceFactorial 1 ^ 2) * P_prime 2 +
    Polynomial.C (braceFactorial 2 / braceFactorial 1) * P_prime 1 := sorry

/-! QT.2–QT.3: the actual cyclotomic color completion and twist coordinates.
Habiro math/0605314v1, §8.1, Lemma 8.1 and (8.1), p. 28; §9.1,
Propositions 9.1–9.2, p. 33. This is the color algebra, distinct from the
scalar Habiro ring. Every finite quotient is a quotient of the lattice already
defined above, and multiplication in the inverse limit is induced from those
quotient rings. Even-color characters are concrete polynomial evaluations;
their comparison with the geometric Hopf link requires the RT interface.
-/
section CyclotomicCompletion

theorem mul_P (m n : ℕ) :
    P_prime m * P_prime n =
      ∑ i ∈ range (min m n + 1),
        Polynomial.C (braceFactorial (m + n) /
          (braceFactorial i * braceFactorial (m - i) * braceFactorial (n - i))) *
            P_prime (m + n - i) := sorry

/-- q^a as an element of the actual q=v² ground subring. -/
def qPower (a : ℤ) : qGround := ⟨vPower (2 * a), sorry⟩

theorem qPower_zero : qPower 0 = 1 := sorry
theorem qPower_add (a b : ℤ) : qPower (a + b) = qPower a * qPower b := sorry

/-- The subalgebra has exactly the carrier of the prescribed tilde lattice. -/
def colorAlgebra : Subalgebra qGround (Polynomial ColourField) where
  carrier := algebraP
  mul_mem' := fun hx hy => algebraP_isSubalgebra _ _ hx hy
  add_mem' := fun hx hy => algebraP.add_mem hx hy
  algebraMap_mem' := sorry

/-- Fix the inherited ring instance before forming ideals and their quotients. -/
instance colorAlgebraCommRing : CommRing colorAlgebra := colorAlgebra.toCommRing

theorem colorAlgebra_mem_iff (x : Polynomial ColourField) :
    x ∈ colorAlgebra ↔ x ∈ algebraP := Iff.rfl

def tildeColor (n : ℕ) : colorAlgebra := ⟨P_tildePrime n, sorry⟩

/-- The tilde colors are a basis over ℤ[q±1], rather than over ℚ(v). -/
def tildeColorBasis : Module.Basis ℕ qGround colorAlgebra := sorry

theorem tildeColorBasis_apply (n : ℕ) : tildeColorBasis n = tildeColor n := sorry
theorem tildeColor_zero : tildeColor 0 = 1 := sorry

/-- The ideal in the color algebra whose carrier is the tail lattice P_k. -/
def colorIdeal (k : ℕ) : Ideal colorAlgebra where
  carrier := {x | (x : Polynomial ColourField) ∈ filtration k}
  zero_mem' := (filtration k).zero_mem
  add_mem' := fun hx hy => (filtration k).add_mem hx hy
  smul_mem' := sorry

theorem colorIdeal_antitone {j k : ℕ} (h : j ≤ k) : colorIdeal k ≤ colorIdeal j := sorry
theorem colorIdeal_zero : colorIdeal 0 = ⊤ := sorry
theorem colorIdeal_iInf : ⨅ k, colorIdeal k = ⊥ := sorry

theorem colorIdeal_mem_iff (k : ℕ) (x : colorAlgebra) :
    x ∈ colorIdeal k ↔ ∀ n < k, tildeColorBasis.repr x n = 0 := sorry

abbrev ColorQuotient (k : ℕ) := colorAlgebra ⧸ colorIdeal k

def colorTransition {j k : ℕ} (h : j ≤ k) : ColorQuotient k →ₐ[qGround] ColorQuotient j :=
  Ideal.Quotient.factorₐ qGround (colorIdeal_antitone h)

theorem colorTransition_comp {i j k : ℕ} (hij : i ≤ j) (hjk : j ≤ k) :
    (colorTransition hij).comp (colorTransition hjk) = colorTransition (hij.trans hjk) := sorry

/-- Finite coefficients are linear coordinates; their multiplication is not pointwise. -/
def quotientCoordinates (k : ℕ) : ColorQuotient k ≃ₗ[qGround] (Fin k → qGround) := sorry

theorem quotientCoordinates_mk (k : ℕ) (x : colorAlgebra) (i : Fin k) :
    quotientCoordinates k (Ideal.Quotient.mk (colorIdeal k) x) i =
      tildeColorBasis.repr x i.val := sorry

/-- Compatible elements in the product of the genuine finite quotient algebras. -/
def completedColorAlgebra : Subalgebra qGround (∀ k, ColorQuotient k) where
  carrier := {x | ∀ (j k : ℕ) (h : j ≤ k), colorTransition h (x k) = x j}
  mul_mem' := sorry
  add_mem' := sorry
  algebraMap_mem' := sorry

abbrev completion := completedColorAlgebra

instance completionCommRing : CommRing completion := completedColorAlgebra.toCommRing

def completionProjection (k : ℕ) : completion →ₐ[qGround] ColorQuotient k where
  toFun x := x.val k
  map_zero' := rfl
  map_one' := rfl
  map_add' _ _ := rfl
  map_mul' _ _ := rfl
  commutes' _ := rfl

theorem completionProjection_compatible (x : completion) {j k : ℕ} (h : j ≤ k) :
    colorTransition h (completionProjection k x) = completionProjection j x := x.property j k h

def algebraPToCompletion : colorAlgebra →ₐ[qGround] completion where
  toFun x := ⟨fun k => Ideal.Quotient.mk (colorIdeal k) x, by
    intro j k h
    rfl⟩
  map_zero' := sorry
  map_one' := sorry
  map_add' := sorry
  map_mul' := sorry
  commutes' := sorry

theorem algebraPToCompletion_injective : Function.Injective algebraPToCompletion := sorry

/-- The k-th truncation is a finite sum, so no analytic summation is hidden here. -/
def colorPartialSum (a : ℕ → qGround) (k : ℕ) : colorAlgebra :=
  ∑ i : Fin k, a i.val • tildeColor i.val

def fromCoordinates (a : ℕ → qGround) : completion :=
  ⟨fun k => Ideal.Quotient.mk (colorIdeal k) (colorPartialSum a k), sorry⟩

def completionCoeff (x : completion) (n : ℕ) : qGround :=
  quotientCoordinates (n + 1) (completionProjection (n + 1) x) ⟨n, Nat.lt_succ_self n⟩

def completionCoordinates : completion ≃ₗ[qGround] (ℕ → qGround) where
  toFun x n := completionCoeff x n
  invFun := fromCoordinates
  left_inv := sorry
  right_inv := sorry
  map_add' := sorry
  map_smul' := sorry

theorem completionCoeff_fromCoordinates (a : ℕ → qGround) (n : ℕ) :
    completionCoeff (fromCoordinates a) n = a n := sorry

theorem completionCoeff_algebraPToCompletion (x : colorAlgebra) (n : ℕ) :
    completionCoeff (algebraPToCompletion x) n = tildeColorBasis.repr x n := sorry

theorem completionProjection_fromCoordinates (a : ℕ → qGround) (k : ℕ) :
    completionProjection k (fromCoordinates a) =
      Ideal.Quotient.mk (colorIdeal k) (colorPartialSum a k) := rfl

theorem mem_range_algebraPToCompletion_iff (x : completion) :
    x ∈ Set.range algebraPToCompletion ↔ (Function.support (completionCoordinates x)).Finite := sorry

/-- Give each finite quotient and each coefficient its discrete uniformity. -/
instance colorQuotientUniformSpace (k : ℕ) : UniformSpace (ColorQuotient k) := ⊥
instance qGroundUniformSpace : UniformSpace qGround := ⊥

instance completionUniformSpace : UniformSpace completion := inferInstanceAs (UniformSpace completedColorAlgebra)

theorem completion_isTopologicalRing : IsTopologicalRing completion := sorry
theorem completion_complete : CompleteSpace completion := sorry
theorem completion_t2 : T2Space completion := sorry

def completionCoordinateHomeomorph : completion ≃ₜ (ℕ → qGround) where
  __ := completionCoordinates.toEquiv
  continuous_toFun := sorry
  continuous_invFun := sorry

theorem completionPartialSum_tendsto (a : ℕ → qGround) :
    Filter.Tendsto (fun k => algebraPToCompletion (colorPartialSum a k))
      Filter.atTop (nhds (fromCoordinates a)) := sorry

inductive TwistSign | plus | minus

/-- Coefficients in the tilde basis: q^(n(n+1)/2) and (-1)^n q^(-n). -/
def omegaCoefficient (ε : TwistSign) (n : ℕ) : qGround :=
  match ε with
  | .plus => qPower ((n * (n + 1) / 2 : ℕ) : ℤ)
  | .minus => (-1) ^ n * qPower (-(n : ℤ))

def omega (ε : TwistSign) : completion := fromCoordinates (omegaCoefficient ε)

theorem omega_coeff (ε : TwistSign) (n : ℕ) :
    completionCoeff (omega ε) n = omegaCoefficient ε n := sorry

theorem omegaCoefficient_ne_zero (ε : TwistSign) (n : ℕ) :
    omegaCoefficient ε n ≠ 0 := sorry

theorem omega_not_finite (ε : TwistSign) : omega ε ∉ Set.range algebraPToCompletion := sorry

theorem omega_mul_inv : omega .plus * omega .minus = 1 := sorry

/-- Compare the two normalizations without replacing the tilde basis by P′. -/
theorem omega_partialSum_prime (ε : TwistSign) (k : ℕ) :
    (colorPartialSum (omegaCoefficient ε) k : Polynomial ColourField) =
      ∑ n ∈ range k,
        Polynomial.C (match ε with
          | .plus => vPower ((n * (n + 3) / 2 : ℕ) : ℤ)
          | .minus => (-1) ^ n * vPower (-((n * (n + 3) / 2 : ℕ) : ℤ))) *
            P_prime n := sorry

def evenColorPoint (p : ℕ) : ColourField := vPower (2 * p + 1) + vPower (-(2 * p + 1))

/-- Evaluation represents pairing with the normalized even color V_(2p)/[2p+1]. -/
def evenEvaluation (p : ℕ) : colorAlgebra →+* ColourField :=
  (Polynomial.evalRingHom (evenColorPoint p)).comp colorAlgebra.val.toRingHom

theorem evenEvaluation_vanish (p : ℕ) (x : colorAlgebra) (hx : x ∈ colorIdeal (p + 1)) :
    evenEvaluation p x = 0 := sorry

def evenEvaluationQuotient (p : ℕ) : ColorQuotient (p + 1) →+* ColourField :=
  Ideal.Quotient.lift (colorIdeal (p + 1)) (evenEvaluation p) (evenEvaluation_vanish p)

def evenCharacter (p : ℕ) : completion →+* ColourField :=
  (evenEvaluationQuotient p).comp (completionProjection (p + 1)).toRingHom

theorem evenCharacter_algebraPToCompletion (p : ℕ) (x : colorAlgebra) :
    evenCharacter p (algebraPToCompletion x) = Polynomial.eval (evenColorPoint p) x.val := sorry

theorem evenCharacter_fromCoordinates (p : ℕ) (a : ℕ → qGround) :
    evenCharacter p (fromCoordinates a) =
      ∑ n ∈ range (p + 1), (a n : ColourField) *
        Polynomial.eval (evenColorPoint p) (P_tildePrime n) := sorry

theorem evenCharacters_separate (x y : completion)
    (h : ∀ p, evenCharacter p x = evenCharacter p y) : x = y := sorry

theorem evenCharacter_omega (ε : TwistSign) (p : ℕ) :
    evenCharacter p (omega ε) =
      match ε with
      | .plus => vPower (2 * p * (p + 1))
      | .minus => vPower (-(2 * p * (p + 1))) := sorry

/-- Restore the unreduced quantum dimension of V_(2p). -/
def evenHopfValue (x : completion) (p : ℕ) : ColourField :=
  algebraMap LaurentBase ColourField (qInt (2 * p + 1)) * evenCharacter p x

-- omega_coeff_low_degree: catches a sign or a basis-normalization exchange.
example : completionCoeff (omega .plus) 1 = qPower 1 ∧
    completionCoeff (omega .plus) 2 = qPower 3 ∧
    completionCoeff (omega .minus) 1 = -qPower (-1) ∧
    completionCoeff (omega .minus) 2 = qPower (-2) := sorry

-- pairing_omega_V0: normalized and unreduced V₀ both have value one.
example (ε : TwistSign) : evenHopfValue (omega ε) 0 = 1 := sorry

-- omega_plus_mul_omega_minus
example : omega .plus * omega .minus = 1 := sorry

-- omega_not_finite: excludes the tempting finite polynomial carrier.
example (ε : TwistSign) : ¬ ∃ x : colorAlgebra, algebraPToCompletion x = omega ε := sorry

-- completion_truncation_zero: P/P₀ is the zero ring, not the first coefficient.
example : Subsingleton (ColorQuotient 0) := sorry

-- completion_truncation_one: the next quotient records only the constant color.
example (a : ℕ → qGround) :
    quotientCoordinates 1 (completionProjection 1 (fromCoordinates a)) 0 = a 0 := sorry

-- completion_truncation_tail: altering a higher color leaves lower precision fixed.
example (a b : ℕ → qGround) (k : ℕ) (h : ∀ n < k, a n = b n) :
    completionProjection k (fromCoordinates a) = completionProjection k (fromCoordinates b) := sorry

-- completion_mul_not_pointwise: tilde P₁² has a nonzero P₁ coefficient.
example : completionCoeff (algebraPToCompletion (tildeColor 1) ^ 2) 1 =
    qPower 1 - qPower (-1) := sorry

-- evenCharacter_first: a nontrivial even color distinguishes the two twists.
example : evenCharacter 1 (omega .plus) = vPower 4 ∧
    evenCharacter 1 (omega .minus) = vPower (-4) := sorry

end CyclotomicCompletion

/-! QT.2: native formal colors in Habiro's divided-power basis.
Habiro math/0605314v1, §5.1, pp. 18–19, (5.1)–(5.3); §5.3, p. 20;
§5.4, p. 20. Matrices act on column vectors. The generator relations below
are obligations for the actual finite free module, with no abstract module
carrier standing in for it. Extension of these generator actions to the
h-adically completed U_h, and its ribbon action, requires QT.1's completion.
-/
section FormalColors

abbrev FormalBase := PowerSeries ℚ
abbrev sl2Color (n : ℕ) := Fin (n + 1) → FormalBase
abbrev ColorMatrix (n : ℕ) := Matrix (Fin (n + 1)) (Fin (n + 1)) FormalBase

def sl2ColorBasis (n : ℕ) : Module.Basis (Fin (n + 1)) FormalBase (sl2Color n) :=
  Pi.basisFun FormalBase (Fin (n + 1))

/-- exp(a h), using the existing formal exponential and rescaling. -/
def formalExp (a : ℚ) : FormalBase := PowerSeries.rescale a (PowerSeries.exp ℚ)

def formalVPower (a : ℤ) : FormalBase := formalExp ((a : ℚ) / 2)

theorem formalVPower_add (a b : ℤ) :
    formalVPower (a + b) = formalVPower a * formalVPower b := sorry

theorem formalVPower_coeff (a : ℤ) (k : ℕ) :
    PowerSeries.coeff k (formalVPower a) = ((a : ℚ) / 2) ^ k / k.factorial := sorry

def formalVUnit : FormalBaseˣ where
  val := formalVPower 1
  inv := formalVPower (-1)
  val_inv := sorry
  inv_val := sorry

/-- v ↦ exp(h/2); the same Laurent polynomial supplies both conventions. -/
def laurentToFormal : LaurentBase →+* FormalBase :=
  LaurentPolynomial.eval₂ (Int.castRingHom FormalBase) formalVUnit

theorem laurentToFormal_T (a : ℤ) :
    laurentToFormal (T a) = formalVPower a := sorry

theorem laurentToFormal_injective : Function.Injective laurentToFormal := sorry

def formalQInt (n : ℕ) : FormalBase := laurentToFormal (qInt n)

def formalQIntSigned (a : ℤ) : FormalBase :=
  if 0 ≤ a then formalQInt a.toNat else -formalQInt (-a).toNat

theorem formalQInt_sum (n : ℕ) :
    formalQInt n = ∑ i ∈ range n, formalVPower ((n : ℤ) - 1 - 2 * i) := sorry

theorem formalQInt_brace (a : ℤ) :
    (formalVPower 1 - formalVPower (-1)) * formalQIntSigned a =
      formalVPower a - formalVPower (-a) := sorry

theorem formalQInt_constantCoeff (n : ℕ) :
    PowerSeries.constantCoeff (formalQInt n) = n := sorry

theorem formalQInt_isUnit {n : ℕ} (hn : 0 < n) : IsUnit (formalQInt n) := sorry

/-- The q-version, [n]_q=1+q+⋯+q^(n−1), not the balanced [n]. -/
def formalQIntUnbalanced (n : ℕ) : FormalBase :=
  ∑ i ∈ range n, formalVPower (2 * i)

def formalQFactorial (n : ℕ) : FormalBase :=
  ∏ i ∈ range n, formalQIntUnbalanced (i + 1)

/-- Gaussian coefficients evaluated at q=exp(h); the recurrence is polynomial. -/
def formalQChoose : ℕ → ℕ → FormalBase
  | 0, k => if k = 0 then 1 else 0
  | _ + 1, 0 => 1
  | n + 1, k + 1 =>
      formalQChoose n k + formalVPower (2 * (k + 1)) * formalQChoose n (k + 1)

def colorWeight (n : ℕ) (i : Fin (n + 1)) : ℤ := n - 2 * (i.val : ℤ)

def colorH (n : ℕ) : ColorMatrix n :=
  Matrix.diagonal fun i => PowerSeries.C (colorWeight n i : ℚ)

def colorK (n : ℕ) : ColorMatrix n :=
  Matrix.diagonal fun i => formalVPower (colorWeight n i)

def colorKinv (n : ℕ) : ColorMatrix n :=
  Matrix.diagonal fun i => formalVPower (-colorWeight n i)

/-- E v_i = v^(n-i+1) [n-i+1] v_(i-1), with v_(-1)=0. -/
def colorE (n : ℕ) : ColorMatrix n := fun i j =>
  if i.val + 1 = j.val then
    formalVPower ((n : ℤ) - j.val + 1) * formalQInt (n - j.val + 1)
  else 0

/-- F v_i = v^(i-n) [i+1] v_(i+1), with v_(n+1)=0. -/
def colorF (n : ℕ) : ColorMatrix n := fun i j =>
  if i.val = j.val + 1 then
    formalVPower ((j.val : ℤ) - n) * formalQInt (j.val + 1)
  else 0

def colorSmallE (n : ℕ) : ColorMatrix n :=
  (formalVPower 1 - formalVPower (-1)) • colorE n

/-- F̃^(m) v_i = q^(-mi) binom_q(i+m,m) v_(i+m). -/
def colorDividedF (n m : ℕ) : ColorMatrix n := fun i j =>
  if i.val = j.val + m then
    formalVPower (-2 * (m : ℤ) * j.val) * formalQChoose (j.val + m) m
  else 0

/-- Powers of e, with the source's descending q-brace product. -/
def colorSmallEPower (n m : ℕ) : ColorMatrix n := fun i j =>
  if i.val + m = j.val then
    ∏ t ∈ range m,
      (formalVPower (2 * ((n : ℤ) - j.val + m - t)) - 1)
  else 0

theorem sl2Color_finrank (n : ℕ) : Module.finrank FormalBase (sl2Color n) = n + 1 := sorry

theorem colorH_E (n : ℕ) : colorH n * colorE n - colorE n * colorH n = 2 • colorE n := sorry

theorem colorH_F (n : ℕ) : colorH n * colorF n - colorF n * colorH n = -2 • colorF n := sorry

theorem colorE_F (n : ℕ) : colorE n * colorF n - colorF n * colorE n =
    Matrix.diagonal (fun i => formalQIntSigned (colorWeight n i)) := sorry

theorem colorE_F_brace (n : ℕ) :
    (formalVPower 1 - formalVPower (-1)) •
      (colorE n * colorF n - colorF n * colorE n) = colorK n - colorKinv n := sorry

theorem colorK_mul_Kinv (n : ℕ) : colorK n * colorKinv n = 1 := sorry

theorem colorKinv_mul_K (n : ℕ) : colorKinv n * colorK n = 1 := sorry

theorem colorK_E (n : ℕ) : colorK n * colorE n = formalVPower 2 • (colorE n * colorK n) := sorry

theorem colorK_F (n : ℕ) : colorK n * colorF n = formalVPower (-2) • (colorF n * colorK n) := sorry

theorem colorK_coeff (n k : ℕ) (i j : Fin (n + 1)) :
    PowerSeries.coeff k (colorK n i j) =
      if i = j then ((colorWeight n i : ℚ) / 2) ^ k / k.factorial else 0 := sorry

theorem colorE_highestWeight (n : ℕ) :
    (colorE n).mulVec (sl2ColorBasis n 0) = 0 := sorry

theorem colorH_highestWeight (n : ℕ) :
    (colorH n).mulVec (sl2ColorBasis n 0) = (n : FormalBase) • sl2ColorBasis n 0 := sorry

theorem colorDividedF_highestWeight (n : ℕ) (i : Fin (n + 1)) :
    (colorDividedF n i.val).mulVec (sl2ColorBasis n 0) = sl2ColorBasis n i := sorry

theorem colorDividedF_normalization (n m : ℕ) :
    formalQFactorial m • colorDividedF n m = colorF n ^ m * colorK n ^ m := sorry

theorem formalQFactorial_isUnit (m : ℕ) : IsUnit (formalQFactorial m) := sorry

theorem colorSmallEPower_eq (n m : ℕ) : colorSmallEPower n m = colorSmallE n ^ m := sorry

/-- Pivotal trace on the acting matrix, using K⁻¹ on the left. -/
def quantumTrace (n : ℕ) : ColorMatrix n →ₗ[FormalBase] FormalBase where
  toFun A := Matrix.trace (colorKinv n * A)
  map_add' := sorry
  map_smul' := sorry

theorem quantumTrace_eq (n : ℕ) (A : ColorMatrix n) :
    quantumTrace n A = ∑ i, formalVPower (-colorWeight n i) * A i i := sorry

theorem quantumTrace_one (n : ℕ) : quantumTrace n 1 = formalQInt (n + 1) := sorry

theorem quantumTrace_constantCoeff (n : ℕ) (A : ColorMatrix n) :
    PowerSeries.constantCoeff (quantumTrace n A) =
      Matrix.trace (A.map PowerSeries.constantCoeff) := sorry

/-- Cyclicity requires commutation with the pivotal matrix. -/
theorem quantumTrace_mul_comm (n : ℕ) (A B : ColorMatrix n)
    (hA : A * colorKinv n = colorKinv n * A) :
    quantumTrace n (A * B) = quantumTrace n (B * A) := sorry

abbrev TensorColorMatrix (m n : ℕ) :=
  Matrix (Fin (m + 1) × Fin (n + 1)) (Fin (m + 1) × Fin (n + 1)) FormalBase
abbrev TensorColor (m n : ℕ) := (Fin (m + 1) × Fin (n + 1)) → FormalBase
abbrev CGColor (m n : ℕ) := ∀ j : Fin (min m n + 1), sl2Color (m + n - 2 * j.val)

/-- The coproduct conventions of Habiro §2.2 are part of the tensor action. -/
def tensorColorH (m n : ℕ) : TensorColorMatrix m n :=
  Matrix.kronecker (colorH m) 1 + Matrix.kronecker 1 (colorH n)

def tensorColorE (m n : ℕ) : TensorColorMatrix m n :=
  Matrix.kronecker (colorE m) 1 + Matrix.kronecker (colorK m) (colorE n)

def tensorColorF (m n : ℕ) : TensorColorMatrix m n :=
  Matrix.kronecker (colorF m) (colorKinv n) + Matrix.kronecker 1 (colorF n)

def tensorColorK (m n : ℕ) : TensorColorMatrix m n :=
  Matrix.kronecker (colorK m) (colorK n)

/-- Identification with the module tensor product, on actual pure tensors. -/
def tensorColorEquiv (m n : ℕ) :
    TensorProduct FormalBase (sl2Color m) (sl2Color n) ≃ₗ[FormalBase] TensorColor m n := sorry

theorem tensorColorEquiv_tmul (m n : ℕ) (x : sl2Color m) (y : sl2Color n)
    (i : Fin (m + 1)) (j : Fin (n + 1)) :
    tensorColorEquiv m n (x ⊗ₜ[FormalBase] y) (i, j) = x i * y j := sorry

/-- This is a representation comparison, not only a dimension equality. -/
theorem color_clebschGordan (m n : ℕ) :
    ∃ e : TensorColor m n ≃ₗ[FormalBase] CGColor m n,
      (∀ x j, e ((tensorColorH m n).mulVec x) j =
        (colorH (m + n - 2 * j.val)).mulVec (e x j)) ∧
      (∀ x j, e ((tensorColorE m n).mulVec x) j =
        (colorE (m + n - 2 * j.val)).mulVec (e x j)) ∧
      (∀ x j, e ((tensorColorF m n).mulVec x) j =
        (colorF (m + n - 2 * j.val)).mulVec (e x j)) ∧
      (∀ x j, e ((tensorColorK m n).mulVec x) j =
        (colorK (m + n - 2 * j.val)).mulVec (e x j)) := sorry

/-- Finite character in a second Laurent variable, recording H-weights. -/
def colorCharacter (n : ℕ) : LaurentPolynomial ℤ :=
  ∑ i : Fin (n + 1), T (colorWeight n i)

theorem colorCharacter_eq_qInt (n : ℕ) : colorCharacter n = qInt (n + 1) := sorry

theorem colorCharacter_tensor (m n : ℕ) :
    colorCharacter m * colorCharacter n =
      ∑ j ∈ range (min m n + 1), colorCharacter (m + n - 2 * j) := sorry

abbrev sl2RepRing := Polynomial LaurentBase

theorem color_Chebyshev (n : ℕ) : V n = Polynomial.Chebyshev.S LaurentBase n := sorry

theorem colorCharacter_Chebyshev (n : ℕ) :
    colorCharacter n = (V n).eval (T 1 + T (-1)) := sorry

theorem color_repRing_product (m n : ℕ) :
    V m * V n = ∑ j ∈ range (min m n + 1), V (m + n - 2 * j) := sorry

-- Polynomial Gaussian helpers: boundaries, first two nontrivial coefficients.
example : formalQChoose 0 0 = 1 ∧ formalQChoose 2 3 = 0 ∧
    formalQChoose 2 1 = 1 + formalVPower 2 ∧
    formalQChoose 3 2 = 1 + formalVPower 2 + formalVPower 4 := sorry
-- Laurent transport: scalar, inverse, and balanced-versus-unbalanced conventions.
example : laurentToFormal (T 0) = 1 ∧
    laurentToFormal (T 1 * T (-1)) = 1 ∧
    formalQInt 2 = formalVPower 1 + formalVPower (-1) ∧
    formalQFactorial 2 = 1 + formalVPower 2 := sorry
-- The zero color is a tensor unit for each generator, including the pivot.
example (n : ℕ) (i j : Fin (n + 1)) :
    tensorColorH 0 n (0, i) (0, j) = colorH n i j ∧
    tensorColorE 0 n (0, i) (0, j) = colorE n i j ∧
    tensorColorF 0 n (0, i) (0, j) = colorF n i j ∧
    tensorColorK 0 n (0, i) (0, j) = colorK n i j := sorry

-- quantum_dimension_V0
example : quantumTrace 0 1 = 1 := sorry
-- quantum_dimension_V1: the first nonconstant coefficient detects the ordinary trace.
example : quantumTrace 1 1 = formalVPower 1 + formalVPower (-1) ∧
    quantumTrace 1 1 ≠ 2 ∧ PowerSeries.coeff 2 (quantumTrace 1 1) = 1 / 4 := sorry
-- color_tensor_V1: full intertwining is required by color_clebschGordan above.
example : V 1 * V 1 = V 2 + V 0 ∧ V 2 = X ^ 2 - 1 ∧ V 2 ≠ X ^ 2 := sorry
-- Divided-power normalization: replacing F̃^(i) by F^i fails this small case.
example : colorDividedF 2 2 2 0 = 1 ∧ (colorF 2 ^ 2) 2 0 =
    formalVPower (-2) + formalVPower (-4) ∧ (colorF 2 ^ 2) 2 0 ≠ 1 := sorry
-- A reversed pivotal element returns v on the first matrix unit, not v⁻¹.
example : quantumTrace 1 (Matrix.single 0 0 1) = formalVPower (-1) ∧
    quantumTrace 1 (Matrix.single 0 0 1) ≠ formalVPower 1 := sorry
-- Pivotal traces are not cyclic on arbitrary endomorphisms.
example : quantumTrace 1 (colorE 1 * colorF 1) = formalVPower (-1) ∧
    quantumTrace 1 (colorF 1 * colorE 1) = formalVPower 1 ∧
    quantumTrace 1 (colorE 1 * colorF 1) ≠ quantumTrace 1 (colorF 1 * colorE 1) := sorry
-- Highest and lowest endpoints, including vanishing rather than wraparound.
example (n : ℕ) : colorSmallEPower n 0 = 1 ∧ colorDividedF n 0 = 1 ∧
    colorDividedF n (n + 1) = 0 ∧ colorE n 0 0 = 0 ∧ colorF n 0 0 = 0 := sorry
-- Specialization h=0 recovers the divided-power classical weight-two color.
example : (colorH 2).map PowerSeries.constantCoeff = !![(2 : ℚ), 0, 0; 0, 0, 0; 0, 0, -2] ∧
    (colorE 2).map PowerSeries.constantCoeff = !![(0 : ℚ), 2, 0; 0, 0, 1; 0, 0, 0] ∧
    (colorF 2).map PowerSeries.constantCoeff = !![(0 : ℚ), 0, 0; 1, 0, 0; 0, 2, 0] := sorry

end FormalColors

namespace QuantumEnveloping
open scoped PowerSeries.WithPiTopology
local instance coreRationalDiscreteUniformSpace : UniformSpace ℚ := ⊥

/-! Habiro math/0605314v1, §2.2, pp. 7–8. The noncommutative quotient
at precision p imposes h^p=0. Its Cartan relation is the truncation of
sinh(hH/2)/sinh(h/2), with the common factor h removed before inversion. -/

abbrev Words := FreeAlgebra ℚ (Fin 3)
abbrev Presentation := Polynomial Words

def wordH : Words := FreeAlgebra.ι ℚ 0
def wordE : Words := FreeAlgebra.ι ℚ 1
def wordF : Words := FreeAlgebra.ι ℚ 2

def cartanNumerator : PowerSeries (Polynomial ℚ) := PowerSeries.mk fun d =>
  if Even d then Polynomial.C (1 / ((2 : ℚ)^d * (d + 1).factorial)) * X^(d + 1) else 0

def cartanDenominator : PowerSeries (Polynomial ℚ) := PowerSeries.mk fun d =>
  if Even d then Polynomial.C (1 / ((2 : ℚ)^d * (d + 1).factorial)) else 0

def cartanSeries : PowerSeries (Polynomial ℚ) :=
  cartanNumerator * PowerSeries.invOfUnit cartanDenominator 1

theorem cartanDenominator_constant : PowerSeries.constantCoeff cartanDenominator = 1 := sorry
theorem cartanSeries_constant : PowerSeries.constantCoeff cartanSeries = X := sorry
theorem cartanSeries_odd (r : ℕ) : PowerSeries.coeff (2*r + 1) cartanSeries = 0 := sorry
theorem cartanSeries_second : PowerSeries.coeff 2 cartanSeries =
    Polynomial.C (1 / 24 : ℚ) * (X^3 - X) := sorry

def cartanTruncation (p : ℕ) : Presentation :=
  ∑ d ∈ range p,
    Polynomial.C (Polynomial.eval₂ (algebraMap ℚ Words) wordH
      (PowerSeries.coeff d cartanSeries)) * X^d

inductive Relation (p : ℕ) : Presentation → Presentation → Prop
  | parameter : Relation p (X^p) 0
  | cartanE : Relation p (Polynomial.C wordH * Polynomial.C wordE -
      Polynomial.C wordE * Polynomial.C wordH) (2 * Polynomial.C wordE)
  | cartanF : Relation p (Polynomial.C wordH * Polynomial.C wordF -
      Polynomial.C wordF * Polynomial.C wordH) (-2 * Polynomial.C wordF)
  | commutator : Relation p (Polynomial.C wordE * Polynomial.C wordF -
      Polynomial.C wordF * Polynomial.C wordE) (cartanTruncation p)

abbrev Truncation (p : ℕ) := RingQuot (Relation p)
def quotientMap (p : ℕ) : Presentation →ₐ[ℚ] Truncation p := RingQuot.mkAlgHom ℚ (Relation p)

theorem transition_respects {p q : ℕ} (hpq : p ≤ q) {x y : Presentation}
    (hxy : Relation q x y) : quotientMap p x = quotientMap p y := sorry

def transition {p q : ℕ} (hpq : p ≤ q) : Truncation q →ₐ[ℚ] Truncation p :=
  RingQuot.liftAlgHom ℚ ⟨quotientMap p, fun _ _ hxy => transition_respects hpq hxy⟩

theorem transition_quotient {p q : ℕ} (hpq : p ≤ q) (x : Presentation) :
    transition hpq (quotientMap q x) = quotientMap p x := by
  exact RingQuot.liftAlgHom_mkAlgHom_apply ℚ (quotientMap p)
    (fun _ _ hxy => transition_respects hpq hxy) x

theorem transition_refl (p : ℕ) : transition (le_refl p) = AlgHom.id ℚ (Truncation p) := sorry
theorem transition_comp {p q r : ℕ} (hpq : p ≤ q) (hqr : q ≤ r) :
    (transition hpq).comp (transition hqr) = transition (hpq.trans hqr) := sorry

/-- Actual compatible truncations, with their inherited noncommutative product. -/
def completedAlgebra : Subalgebra ℚ (∀ p, Truncation p) where
  carrier := {a | ∀ (p q : ℕ) (hpq : p ≤ q), transition hpq (a q) = a p}
  mul_mem' := by
    intro a b ha hb p q hpq
    change transition hpq (a q * b q) = a p * b p
    rw [map_mul, ha p q hpq, hb p q hpq]
  add_mem' := by
    intro a b ha hb p q hpq
    change transition hpq (a q + b q) = a p + b p
    rw [map_add, ha p q hpq, hb p q hpq]
  algebraMap_mem' := by
    intro c p q hpq
    exact (transition hpq).commutes c

abbrev Uh : Type := completedAlgebra

instance uhRing : Ring Uh := Algebra.semiringToRing ℚ

def projection (p : ℕ) : Uh →ₐ[ℚ] Truncation p where
  toFun a := a.val p
  map_zero' := rfl
  map_one' := rfl
  map_add' _ _ := rfl
  map_mul' _ _ := rfl
  commutes' _ := rfl

theorem projection_compatible (a : Uh) {p q : ℕ} (hpq : p ≤ q) :
    transition hpq (projection q a) = projection p a := a.property p q hpq

def fromPresentation : Presentation →ₐ[ℚ] Uh where
  toFun x := ⟨fun p => quotientMap p x, by
    intro p q hpq
    exact transition_quotient hpq x⟩
  map_zero' := by apply Subtype.ext; funext p; exact map_zero _
  map_one' := by apply Subtype.ext; funext p; exact map_one _
  map_add' _ _ := by apply Subtype.ext; funext p; exact map_add _ _ _
  map_mul' _ _ := by apply Subtype.ext; funext p; exact map_mul _ _ _
  commutes' _ := by apply Subtype.ext; funext p; exact AlgHom.commutes _ _

def H : Uh := fromPresentation (Polynomial.C wordH)
def E : Uh := fromPresentation (Polynomial.C wordE)
def F : Uh := fromPresentation (Polynomial.C wordF)
def parameter : Uh := fromPresentation X

/-- Evaluate a scalar power series by its finite polynomial at each precision. -/
def scalarPolynomial (p : ℕ) (a : PowerSeries ℚ) : Presentation :=
  ∑ d ∈ range p, Polynomial.C (algebraMap ℚ Words (PowerSeries.coeff d a)) * X^d

def scalar : PowerSeries ℚ →ₐ[ℚ] Uh where
  toFun a := ⟨fun p => quotientMap p (scalarPolynomial p a), sorry⟩
  map_zero' := sorry
  map_one' := sorry
  map_add' := sorry
  map_mul' := sorry
  commutes' := sorry

theorem scalar_commutes (a : PowerSeries ℚ) (u : Uh) : scalar a * u = u * scalar a := sorry

instance uhFormalAlgebra : Algebra (PowerSeries ℚ) Uh :=
  scalar.toRingHom.toAlgebra' scalar_commutes

theorem scalar_parameter : scalar PowerSeries.X = parameter := sorry
theorem scalar_injective : Function.Injective scalar := sorry
theorem H_E : H * E - E * H = 2 * E := sorry
theorem H_F : H * F - F * H = -2 * F := sorry
theorem E_F (p : ℕ) : projection p (E * F - F * E) =
    quotientMap p (cartanTruncation p) := sorry
theorem projection_parameter_pow (p : ℕ) : projection p (parameter^p) = 0 := sorry

/-- Every h-degree has finitely many ordered F/H/E monomials. This is a
linear equivalence; the polynomial carrier's commutative product is not used. -/
def pbwCoordinates : Uh ≃ₗ[ℚ] PowerSeries (MvPolynomial (Fin 3) ℚ) := sorry

theorem pbwCoordinates_monomial (i j k : ℕ) :
    pbwCoordinates (F^i * H^j * E^k) = PowerSeries.C
      (MvPolynomial.X 0^i * MvPolynomial.X 1^j * MvPolynomial.X 2^k) := sorry

theorem pbwCoordinates_parameter (u : Uh) : pbwCoordinates (parameter * u) =
    PowerSeries.X * pbwCoordinates u := sorry

/-- The h-adic topology is the inverse-limit topology of discrete quotients. -/
instance truncationUniformSpace (p : ℕ) : UniformSpace (Truncation p) := ⊥
instance uhUniformSpace : UniformSpace Uh :=
  inferInstanceAs (UniformSpace completedAlgebra)

theorem scalar_continuous : Continuous scalar := sorry
theorem uh_topologicalRing : IsTopologicalRing Uh := sorry
theorem uh_complete : CompleteSpace Uh := sorry
theorem uh_t2 : T2Space Uh := sorry
theorem fromPresentation_dense : DenseRange fromPresentation := sorry

instance pbwCoefficientUniformSpace : UniformSpace (MvPolynomial (Fin 3) ℚ) := ⊥

def pbwHomeomorph : Uh ≃ₜ PowerSeries (MvPolynomial (Fin 3) ℚ) where
  __ := pbwCoordinates.toEquiv
  continuous_toFun := sorry
  continuous_invFun := sorry

/-- Projection at precision one is the actual classical quotient. -/
def classicalLimit : Truncation 1 ≃ₐ[ℚ]
    UniversalEnvelopingAlgebra ℚ (LieAlgebra.SpecialLinear.sl (Fin 2) ℚ) := sorry

theorem classicalLimit_kernel (u : Uh) :
    projection 1 u = 0 ↔ ∃ v : Uh, u = parameter * v := sorry

-- cartan_series_constant: cancellation precedes inversion of the denominator.
example : PowerSeries.constantCoeff cartanSeries = X := cartanSeries_constant
-- cartan_series_second: detects the normalization hH/2 rather than hH.
example : PowerSeries.coeff 2 cartanSeries =
    Polynomial.C (1 / 24 : ℚ) * (X^3 - X) := cartanSeries_second
-- classical_limit: the native classical enveloping algebra, not a polynomial ring.
example : Nonempty (Truncation 1 ≃ₐ[ℚ]
    UniversalEnvelopingAlgebra ℚ (LieAlgebra.SpecialLinear.sl (Fin 2) ℚ)) :=
  ⟨classicalLimit⟩
-- parameter_not_nilpotent: a single finite truncation is not the completed algebra.
example (p : ℕ) : parameter^p ≠ 0 := sorry
-- quantum_commutator_second: the h² correction survives at precision three.
example : projection 3 (E * F - F * E - H) =
    projection 3 (scalar (PowerSeries.C (1 / 24)) * parameter^2 * (H^3 - H)) := sorry
-- noncommutative_classical_limit: a PBW coordinate equivalence is not an algebra equivalence.
example : projection 1 (H * E) ≠ projection 1 (E * H) := sorry

end QuantumEnveloping


/-! Habiro math/0605314v1, §§2.3–2.6, pp. 8–11; Lemma 2.1,
Proposition 2.2. These are subalgebras of the explicit completed U_h.
The q-version factorial differs from the balanced-v factorial. -/
namespace QuantumEnveloping
open scoped PowerSeries.WithPiTopology
local instance integralRationalDiscreteUniformSpace : UniformSpace ℚ := ⊥

def cartanExponentialPolynomial (p : ℕ) (a : ℚ) : Presentation :=
  ∑ d ∈ range p, Polynomial.C
    (algebraMap ℚ Words (a^d / d.factorial) * wordH^d) * X^d

def cartanExponential (a : ℚ) : Uh :=
  ⟨fun p => quotientMap p (cartanExponentialPolynomial p a), sorry⟩

theorem cartanExponential_add (a b : ℚ) :
    cartanExponential (a+b) = cartanExponential a * cartanExponential b := sorry

def KUnit : Uhˣ where
  val := cartanExponential (1/2)
  inv := cartanExponential (-1/2)
  val_inv := sorry
  inv_val := sorry

def K : Uh := KUnit
def Kinv : Uh := ↑KUnit⁻¹
def e : Uh := scalar (formalVPower 1 - formalVPower (-1)) * E

theorem formalQFactorial_constant (n : ℕ) :
    PowerSeries.constantCoeff (formalQFactorial n) = (n.factorial : ℚ) := sorry

def factorialUnit (n : ℕ) : ℚˣ :=
  Units.mk0 (n.factorial : ℚ) (by exact_mod_cast Nat.factorial_ne_zero n)

def inverseQFactorial (n : ℕ) : FormalBase :=
  PowerSeries.invOfUnit (formalQFactorial n) (factorialUnit n)

def Ftilde (n : ℕ) : Uh := F^n * K^n * scalar (inverseQFactorial n)

theorem Ftilde_zero : Ftilde 0 = 1 := sorry
theorem Ftilde_one : Ftilde 1 = F*K := sorry
theorem Ftilde_factorial (n : ℕ) :
    Ftilde n * scalar (formalQFactorial n) = F^n * K^n := sorry

abbrev QBase := LaurentPolynomial ℤ

/-- The integral variable is q, sent to v²; it is not sent to v. -/
def qToFormal : QBase →+* FormalBase :=
  LaurentPolynomial.eval₂ (Int.castRingHom FormalBase) (formalVUnit^2)

def qScalar : QBase →+* Uh := scalar.toRingHom.comp qToFormal

theorem qScalar_commutes (a : QBase) (u : Uh) : qScalar a*u = u*qScalar a :=
  scalar_commutes (qToFormal a) u

instance uhQAlgebra : Algebra QBase Uh := qScalar.toAlgebra' qScalar_commutes

theorem qToFormal_T (j : ℤ) : qToFormal (LaurentPolynomial.T j) =
    formalVPower (2*j) := sorry

theorem qScalar_injective : Function.Injective qScalar := sorry
theorem K_e : K*e = qScalar (LaurentPolynomial.T 1)*e*K := sorry
theorem K_Ftilde (n : ℕ) : K*Ftilde n =
    qScalar (LaurentPolynomial.T (-(n : ℤ)))*Ftilde n*K := sorry

/-- The even form has K² and K⁻² among its generators. -/
def integralForm (even : Bool) : Subalgebra QBase Uh :=
  Algebra.adjoin QBase ({e, K^(if even then 2 else 1),
    Kinv^(if even then 2 else 1)} ∪ Set.range Ftilde)

abbrev Uq := integralForm false
abbrev Uqev := integralForm true

theorem e_mem (even : Bool) : e ∈ integralForm even := by
  apply Algebra.subset_adjoin
  simp

theorem Ftilde_mem (even : Bool) (n : ℕ) : Ftilde n ∈ integralForm even := by
  apply Algebra.subset_adjoin
  exact Or.inr ⟨n, rfl⟩

theorem K_mem : K ∈ Uq := sorry
theorem Kinv_mem : Kinv ∈ Uq := sorry
theorem Uqev_le_Uq : Uqev ≤ Uq := sorry

abbrev PBWIndex := ℕ × ℤ × ℕ

def orderedIntegralMonomial (even : Bool) (a : PBWIndex) : Uh :=
  Ftilde a.1 * (KUnit ^ ((if even then 2 else 1)*a.2.1) : Uhˣ) * e^a.2.2

theorem orderedIntegralMonomial_mem (even : Bool) (a : PBWIndex) :
    orderedIntegralMonomial even a ∈ integralForm even := sorry

def basis_Uq (even : Bool) : Module.Basis PBWIndex QBase (integralForm even) := sorry

theorem basis_Uq_apply (even : Bool) (a : PBWIndex) :
    ((basis_Uq even a : integralForm even) : Uh) = orderedIntegralMonomial even a := sorry

theorem integralParity (u : Uq) : ∃! a : Uqev × Uqev,
    (u : Uh) = (a.1 : Uh) + K*(a.2 : Uh) := sorry

def integralE (even : Bool) : integralForm even := ⟨e, e_mem even⟩

/-- Native two-sided ideal generated by e^p, not a left ideal or h-adic closure. -/
def integralIdeal (even : Bool) (p : ℕ) : TwoSidedIdeal (integralForm even) :=
  TwoSidedIdeal.span {integralE even ^ p}

theorem integralIdeal_antitone (even : Bool) : Antitone (integralIdeal even) := sorry

abbrev IntegralQuotient (even : Bool) (p : ℕ) :=
  (integralIdeal even p).ringCon.Quotient

def integralQuotientMap (even : Bool) (p : ℕ) :
    integralForm even →ₐ[QBase] IntegralQuotient even p :=
  (integralIdeal even p).ringCon.mkₐ QBase

def integralTransition (even : Bool) {p q : ℕ} (hpq : p ≤ q) :
    IntegralQuotient even q →ₐ[QBase] IntegralQuotient even p :=
  RingCon.factorₐ QBase
    ((TwoSidedIdeal.ringCon_le_iff).mp (integralIdeal_antitone even hpq))

def integralInverseLimit (even : Bool) :
    Subalgebra QBase (∀ p, IntegralQuotient even p) where
  carrier := {a | ∀ (p q : ℕ) (hpq : p ≤ q), integralTransition even hpq (a q) = a p}
  mul_mem' := by
    intro a b ha hb p q hpq
    change integralTransition even hpq (a q*b q) = a p*b p
    rw [map_mul, ha p q hpq, hb p q hpq]
  add_mem' := by
    intro a b ha hb p q hpq
    change integralTransition even hpq (a q+b q) = a p+b p
    rw [map_add, ha p q hpq, hb p q hpq]
  algebraMap_mem' := by
    intro c p q hpq
    exact (integralTransition even hpq).commutes c

def fromIntegral (even : Bool) : integralForm even →ₐ[QBase] integralInverseLimit even where
  toFun u := ⟨fun p => integralQuotientMap even p u, sorry⟩
  map_zero' := by apply Subtype.ext; funext p; exact map_zero _
  map_one' := by apply Subtype.ext; funext p; exact map_one _
  map_add' _ _ := by apply Subtype.ext; funext p; exact map_add _ _ _
  map_mul' _ _ := by apply Subtype.ext; funext p; exact map_mul _ _ _
  commutes' _ := by apply Subtype.ext; funext p; exact AlgHom.commutes _ _

theorem ideal_killed_at_precision (even : Bool) (p : ℕ) :
    (integralIdeal even p).ringCon ≤
      RingCon.ker ((projection p).toRingHom.comp (integralForm even).val.toRingHom) := sorry

def integralToTruncation (even : Bool) (p : ℕ) :
    IntegralQuotient even p →+* Truncation p :=
  (integralIdeal even p).ringCon.lift
    ((projection p).toRingHom.comp (integralForm even).val.toRingHom)
    (ideal_killed_at_precision even p)

/-- The canonical map is defined coordinatewise in the actual h-adic inverse limit. -/
def integralToUh (even : Bool) : integralInverseLimit even →ₐ[QBase] Uh where
  toFun a := ⟨fun p => integralToTruncation even p (a.val p), sorry⟩
  map_zero' := by apply Subtype.ext; funext p; exact map_zero _
  map_one' := by apply Subtype.ext; funext p; exact map_one _
  map_add' _ _ := by apply Subtype.ext; funext p; exact map_add _ _ _
  map_mul' _ _ := by apply Subtype.ext; funext p; exact map_mul _ _ _
  commutes' := sorry

def completion (even : Bool) : Subalgebra QBase Uh := (integralToUh even).range

theorem integralToUh_fromIntegral (even : Bool) (u : integralForm even) :
    integralToUh even (fromIntegral even u) = (u : Uh) := sorry

theorem integralForm_le_completion (even : Bool) : integralForm even ≤ completion even := sorry
theorem evenCompletion_le : completion true ≤ completion false := sorry

-- q_variable_second_coefficient: q=e^h, rather than v=e^(h/2).
example : PowerSeries.coeff 2 (qToFormal (LaurentPolynomial.T 1)) = 1/2 := sorry
-- cartan_exponential_zero: the completed Cartan exponential has a genuine unit.
example : cartanExponential 0 = 1 := sorry
-- cartan_exponential_inverse: negative Cartan powers use the inverse, not a new generator.
example : K*Kinv = 1 ∧ Kinv*K = 1 := ⟨KUnit.val_inv, KUnit.inv_val⟩
-- divided_power_zero: the zeroth divided power is the multiplicative unit.
example : Ftilde 0 = 1 := Ftilde_zero
-- divided_power_first: detects the K factor missing from an ordinary F power.
example : Ftilde 1 = F*K := Ftilde_one
-- divided_power_product: detects the q-version factorial and the noncommutative order.
example : Ftilde 1*Ftilde 1 =
    scalar (formalVPower (-2)*formalQIntUnbalanced 2)*Ftilde 2 := sorry
-- basis_freeness: all integer Cartan powers occur, with no finite truncation of support.
example (even : Bool) : LinearIndependent QBase (basis_Uq even) :=
  (basis_Uq even).linearIndependent
-- basis_negative_cartan_power: the PBW indexing includes K^{-1}, not only K^j for j≥0.
example : ((basis_Uq false (0, -1, 0) : Uq) : Uh) = Kinv := sorry
-- Uqev_ne_Uq: even is a strict subalgebra, although it contains Ftilde(1)=FK.
example : K ∈ Uq ∧ K ∉ Uqev := sorry
-- filtration_zero: the ideal generated by e^0 gives the zero precision quotient.
example (even : Bool) : integralIdeal even 0 = ⊤ := sorry
-- filtration_power: the prescribed generator vanishes in its own quotient.
example (even : Bool) (p : ℕ) :
    integralQuotientMap even p (integralE even)^p = 0 := sorry
-- filtration_descending: stronger integral precision maps to weaker precision.
example (even : Bool) (p : ℕ) : integralIdeal even (p+1) ≤ integralIdeal even p :=
  integralIdeal_antitone even (Nat.le_succ p)
-- completion_contains_finite_form: completion is the canonical image in U_h.
example (even : Bool) (u : integralForm even) : (u : Uh) ∈ completion even :=
  integralForm_le_completion even u.property
-- completion_compatible_coordinates: its map retains every finite h-adic observation.
example (even : Bool) (a : integralInverseLimit even) (p : ℕ) :
    projection p (integralToUh even a) = integralToTruncation even p (a.val p) := rfl
-- completion_even_inclusion: the integral parity survives passage to the image.
example : completion true ≤ completion false := evenCompletion_le

end QuantumEnveloping


/-! QT.1, Habiro math/0605314v1, §2.2, pp. 7–8 and §3.1, pp. 11–12.
At each precision all tensor factors share one central parameter h.
The tensor algebra uses Mathlib's native noncommutative PiTensorProduct. -/
namespace QuantumEnveloping
open scoped TensorProduct PowerSeries.WithPiTopology
local instance tensorRationalDiscreteUniformSpace : UniformSpace ℚ := ⊥

abbrev TensorWords (n : ℕ) := ⨂[ℚ] (_ : Fin n), Words
abbrev TensorPresentation (n : ℕ) := Polynomial (TensorWords n)

def factorPresentation (n : ℕ) (i : Fin n) : Presentation →+* TensorPresentation n :=
  Polynomial.mapRingHom
    (PiTensorProduct.singleAlgHom (R := ℚ) (A := fun _ : Fin n => Words) i).toRingHom

inductive TensorRelation (n p : ℕ) : TensorPresentation n → TensorPresentation n → Prop
  | parameter : TensorRelation n p (X^p) 0
  | factor (i : Fin n) (x y : Presentation) (hxy : Relation p x y) :
      TensorRelation n p (factorPresentation n i x) (factorPresentation n i y)

abbrev TensorTruncation (n p : ℕ) := RingQuot (TensorRelation n p)

def tensorQuotientMap (n p : ℕ) : TensorPresentation n →ₐ[ℚ] TensorTruncation n p :=
  RingQuot.mkAlgHom ℚ (TensorRelation n p)

theorem tensorTransition_respects (n : ℕ) {p q : ℕ} (hpq : p ≤ q)
    {x y : TensorPresentation n} (hxy : TensorRelation n q x y) :
    tensorQuotientMap n p x = tensorQuotientMap n p y := sorry

def tensorTransition (n : ℕ) {p q : ℕ} (hpq : p ≤ q) :
    TensorTruncation n q →ₐ[ℚ] TensorTruncation n p :=
  RingQuot.liftAlgHom ℚ ⟨tensorQuotientMap n p,
    fun _ _ hxy => tensorTransition_respects n hpq hxy⟩

def completedTensorAlgebra (n : ℕ) : Subalgebra ℚ (∀ p, TensorTruncation n p) where
  carrier := {a | ∀ (p q : ℕ) (hpq : p ≤ q), tensorTransition n hpq (a q) = a p}
  mul_mem' := by
    intro a b ha hb p q hpq
    change tensorTransition n hpq (a q*b q) = a p*b p
    rw [map_mul, ha p q hpq, hb p q hpq]
  add_mem' := by
    intro a b ha hb p q hpq
    change tensorTransition n hpq (a q+b q) = a p+b p
    rw [map_add, ha p q hpq, hb p q hpq]
  algebraMap_mem' := by
    intro c p q hpq
    exact (tensorTransition n hpq).commutes c

abbrev CompletedTensor (n : ℕ) : Type := completedTensorAlgebra n

instance completedTensorRing (n : ℕ) : Ring (CompletedTensor n) := Algebra.semiringToRing ℚ

def tensorProjection (n p : ℕ) : CompletedTensor n →ₐ[ℚ] TensorTruncation n p where
  toFun a := a.val p
  map_zero' := rfl
  map_one' := rfl
  map_add' _ _ := rfl
  map_mul' _ _ := rfl
  commutes' _ := rfl

def tensorScalarPolynomial (n p : ℕ) (a : FormalBase) : TensorPresentation n :=
  ∑ d ∈ range p, Polynomial.C (algebraMap ℚ (TensorWords n) (PowerSeries.coeff d a))*X^d

def tensorScalar (n : ℕ) : FormalBase →ₐ[ℚ] CompletedTensor n where
  toFun a := ⟨fun p => tensorQuotientMap n p (tensorScalarPolynomial n p a), sorry⟩
  map_zero' := sorry
  map_one' := sorry
  map_add' := sorry
  map_mul' := sorry
  commutes' := sorry

theorem tensorScalar_commutes (n : ℕ) (a : FormalBase) (u : CompletedTensor n) :
    tensorScalar n a*u = u*tensorScalar n a := sorry

instance tensorFormalAlgebra (n : ℕ) : Algebra FormalBase (CompletedTensor n) :=
  (tensorScalar n).toRingHom.toAlgebra' (tensorScalar_commutes n)

def tensorFactorAtPrecision (n p : ℕ) (i : Fin n) :
    Truncation p →ₐ[ℚ] TensorTruncation n p :=
  RingQuot.liftAlgHom ℚ
    ⟨{ (tensorQuotientMap n p).toRingHom.comp (factorPresentation n i) with
        commutes' := sorry }, sorry⟩

def tensorInsert (n : ℕ) (i : Fin n) : Uh →ₐ[FormalBase] CompletedTensor n where
  toFun u := ⟨fun p => tensorFactorAtPrecision n p i (projection p u), sorry⟩
  map_zero' := by apply Subtype.ext; funext p; exact map_zero _
  map_one' := by apply Subtype.ext; funext p; exact map_one _
  map_add' _ _ := by apply Subtype.ext; funext p; exact map_add _ _ _
  map_mul' _ _ := by apply Subtype.ext; funext p; exact map_mul _ _ _
  commutes' := sorry

theorem tensorInsert_commute (n : ℕ) (i j : Fin n) (hij : i ≠ j) (u v : Uh) :
    Commute (tensorInsert n i u) (tensorInsert n j v) := sorry

def tensorZeroEquiv : CompletedTensor 0 ≃ₐ[FormalBase] FormalBase := sorry
def tensorOneEquiv : CompletedTensor 1 ≃ₐ[FormalBase] Uh := sorry

def tensorOfOrdinary (n : ℕ) :
    (⨂[FormalBase] (_ : Fin n), Uh) →ₐ[FormalBase] CompletedTensor n := sorry

theorem tensorOfOrdinary_tprod (n : ℕ) (u : Fin n → Uh) :
    tensorOfOrdinary n (PiTensorProduct.tprod FormalBase u) =
      (List.ofFn fun i => tensorInsert n i (u i)).prod := sorry

instance tensorTruncationUniformSpace (n p : ℕ) : UniformSpace (TensorTruncation n p) := ⊥
instance completedTensorUniformSpace (n : ℕ) : UniformSpace (CompletedTensor n) :=
  inferInstanceAs (UniformSpace (completedTensorAlgebra n))

theorem completedTensor_complete (n : ℕ) : CompleteSpace (CompletedTensor n) := sorry
theorem completedTensor_t2 (n : ℕ) : T2Space (CompletedTensor n) := sorry
theorem completedTensor_topologicalRing (n : ℕ) : IsTopologicalRing (CompletedTensor n) := sorry
theorem tensorOfOrdinary_dense (n : ℕ) : DenseRange (tensorOfOrdinary n) := sorry
theorem tensorInsert_continuous (n : ℕ) (i : Fin n) : Continuous (tensorInsert n i) := sorry

def leftLeg : Uh →ₐ[FormalBase] CompletedTensor 2 := tensorInsert 2 0
def rightLeg : Uh →ₐ[FormalBase] CompletedTensor 2 := tensorInsert 2 1

def tensorInject {m n : ℕ} (f : Fin m ↪ Fin n) :
    CompletedTensor m →ₐ[FormalBase] CompletedTensor n := sorry

theorem tensorInject_insert {m n : ℕ} (f : Fin m ↪ Fin n) (i : Fin m) (u : Uh) :
    tensorInject f (tensorInsert m i u) = tensorInsert n (f i) u := sorry

def legs12 : CompletedTensor 2 →ₐ[FormalBase] CompletedTensor 3 :=
  tensorInject ⟨Fin.castSucc, Fin.castSucc_injective 2⟩

def legs23 : CompletedTensor 2 →ₐ[FormalBase] CompletedTensor 3 :=
  tensorInject ⟨Fin.succ, Fin.succ_injective 2⟩

def legs13 : CompletedTensor 2 →ₐ[FormalBase] CompletedTensor 3 :=
  tensorInject ⟨fun i => (![0,2] : Fin 2 → Fin 3) i, by decide⟩

-- tensor_zero_is_base: empty tensor power retains h-adic scalars.
example : Nonempty (CompletedTensor 0 ≃ₐ[FormalBase] FormalBase) := ⟨tensorZeroEquiv⟩
-- tensor_one_is_Uh: a single factor is the noncommutative completed algebra.
example : Nonempty (CompletedTensor 1 ≃ₐ[FormalBase] Uh) := ⟨tensorOneEquiv⟩
-- tensor_shared_parameter: two factors do not introduce independent formal parameters.
example : leftLeg parameter = rightLeg parameter := sorry
-- tensor_cross_factors_commute: noncommutativity is confined to each individual factor.
example (u v : Uh) : Commute (leftLeg u) (rightLeg v) :=
  tensorInsert_commute 2 0 1 (by decide) u v
-- tensor_same_factor_noncommutative: the completed product is not made commutative.
example : leftLeg H*leftLeg E ≠ leftLeg E*leftLeg H := sorry
-- tensor_finite_precision: the shared parameter vanishes at the stated precision.
example (n p : ℕ) : tensorProjection n p ((tensorScalar n PowerSeries.X)^p) = 0 := sorry

end QuantumEnveloping


/-! Habiro math/0605314v1, §2.5, p. 10. The tensor filtration has
at least one e^p factor. Its zero-fold case has F_0=QBase, F_p=0 for p>0. -/
namespace QuantumEnveloping
open scoped TensorProduct

abbrev IntegralTensor (even : Bool) (n : ℕ) :=
  ⨂[QBase] (_ : Fin n), integralForm even

def integralTensorIdeal (even : Bool) (n p : ℕ) : TwoSidedIdeal (IntegralTensor even n) :=
  if n = 0 then (if p = 0 then ⊤ else ⊥) else
    TwoSidedIdeal.span (Set.range fun i : Fin n =>
      PiTensorProduct.singleAlgHom (R := QBase)
        (A := fun _ : Fin n => integralForm even) i (integralE even ^ p))

theorem integralTensorIdeal_antitone (even : Bool) (n : ℕ) :
    Antitone (integralTensorIdeal even n) := sorry

abbrev IntegralTensorQuotient (even : Bool) (n p : ℕ) :=
  (integralTensorIdeal even n p).ringCon.Quotient

def integralTensorQuotientMap (even : Bool) (n p : ℕ) :
    IntegralTensor even n →ₐ[QBase] IntegralTensorQuotient even n p :=
  (integralTensorIdeal even n p).ringCon.mkₐ QBase

def integralTensorTransition (even : Bool) (n : ℕ) {p q : ℕ} (hpq : p ≤ q) :
    IntegralTensorQuotient even n q →ₐ[QBase] IntegralTensorQuotient even n p :=
  RingCon.factorₐ QBase
    ((TwoSidedIdeal.ringCon_le_iff).mp (integralTensorIdeal_antitone even n hpq))

def integralTensorInverseLimit (even : Bool) (n : ℕ) :
    Subalgebra QBase (∀ p, IntegralTensorQuotient even n p) where
  carrier := {a | ∀ (p q : ℕ) (hpq : p ≤ q), integralTensorTransition even n hpq (a q) = a p}
  mul_mem' := by
    intro a b ha hb p q hpq
    change integralTensorTransition even n hpq (a q*b q) = a p*b p
    rw [map_mul, ha p q hpq, hb p q hpq]
  add_mem' := by
    intro a b ha hb p q hpq
    change integralTensorTransition even n hpq (a q+b q) = a p+b p
    rw [map_add, ha p q hpq, hb p q hpq]
  algebraMap_mem' := by
    intro c p q hpq
    exact (integralTensorTransition even n hpq).commutes c

def tensorQScalar (n : ℕ) : QBase →+* CompletedTensor n :=
  (tensorScalar n).toRingHom.comp qToFormal

instance completedTensorQAlgebra (n : ℕ) : Algebra QBase (CompletedTensor n) :=
  (tensorQScalar n).toAlgebra' fun a u => tensorScalar_commutes n (qToFormal a) u

def integralTensorAtPrecision (even : Bool) (n p : ℕ) :
    IntegralTensor even n →+* TensorTruncation n p := sorry

theorem integralTensorAtPrecision_tprod (even : Bool) (n p : ℕ)
    (u : Fin n → integralForm even) :
    integralTensorAtPrecision even n p (PiTensorProduct.tprod QBase u) =
      (List.ofFn fun i => tensorFactorAtPrecision n p i (projection p (u i))).prod := sorry

theorem integralTensorIdeal_killed (even : Bool) (n p : ℕ) :
    (integralTensorIdeal even n p).ringCon ≤
      RingCon.ker (integralTensorAtPrecision even n p) := sorry

def integralTensorQuotientToTruncation (even : Bool) (n p : ℕ) :
    IntegralTensorQuotient even n p →+* TensorTruncation n p :=
  (integralTensorIdeal even n p).ringCon.lift
    (integralTensorAtPrecision even n p) (integralTensorIdeal_killed even n p)

def integralTensorToAmbient (even : Bool) (n : ℕ) :
    integralTensorInverseLimit even n →ₐ[QBase] CompletedTensor n where
  toFun a := ⟨fun p => integralTensorQuotientToTruncation even n p (a.val p), sorry⟩
  map_zero' := by apply Subtype.ext; funext p; exact map_zero _
  map_one' := by apply Subtype.ext; funext p; exact map_one _
  map_add' _ _ := by apply Subtype.ext; funext p; exact map_add _ _ _
  map_mul' _ _ := by apply Subtype.ext; funext p; exact map_mul _ _ _
  commutes' := sorry

def completedIntegralTensor (even : Bool) (n : ℕ) : Subalgebra QBase (CompletedTensor n) :=
  (integralTensorToAmbient even n).range

theorem completedIntegralTensor_zero (even : Bool) :
    completedIntegralTensor even 0 =
      (Algebra.ofId QBase (CompletedTensor 0)).range := sorry

-- integral_tensor_zero_filtration: an empty tensor is not forced to vanish at positive precision.
example (even : Bool) : integralTensorIdeal even 0 0 = ⊤ ∧
    integralTensorIdeal even 0 1 = ⊥ := by simp [integralTensorIdeal]
-- integral_tensor_one_large_factor: a single e^p factor is already in F_p.
example (even : Bool) (p : ℕ) :
    PiTensorProduct.tprod QBase (![integralE even ^ p, 1] : Fin 2 → integralForm even)
      ∈ integralTensorIdeal even 2 p := sorry
-- integral_tensor_not_total_degree: e⊗e is not in F_2, although its total e degree is two.
example : PiTensorProduct.tprod QBase (![integralE false, integralE false] : Fin 2 → Uq)
    ∉ integralTensorIdeal false 2 2 := sorry
-- integral_tensor_image_coordinates: the completed integral tensor is an image in the ambient tensor.
example (even : Bool) (n : ℕ) (a : integralTensorInverseLimit even n) (p : ℕ) :
    tensorProjection n p (integralTensorToAmbient even n a) =
      integralTensorQuotientToTruncation even n p (a.val p) := rfl
-- integral_tensor_even_inclusion: this is an inclusion of images, with no inverse-limit injectivity claim.
example (n : ℕ) : completedIntegralTensor true n ≤ completedIntegralTensor false n := sorry
-- integral_tensor_product_closure: the ambient noncommutative product restricts to the actual image.
example (even : Bool) (n : ℕ) (x y : CompletedTensor n)
    (hx : x ∈ completedIntegralTensor even n) (hy : y ∈ completedIntegralTensor even n) :
    x*y ∈ completedIntegralTensor even n := (completedIntegralTensor even n).mul_mem hx hy

end QuantumEnveloping


/-! QT.1, Habiro math/0605314v1, §2.2, pp. 7–8; §2.4, p. 9;
§3.1, pp. 11–12, equations (3.1)–(3.9). Infinite series below are
specified by finite quotient formulas, so no unqualified tsum is used. -/
namespace QuantumEnveloping
open scoped TensorProduct PowerSeries.WithPiTopology
local instance ribbonRationalDiscreteUniformSpace : UniformSpace ℚ := ⊥

def coproduct : Uh →ₐ[FormalBase] CompletedTensor 2 := sorry
def counit : Uh →ₐ[FormalBase] FormalBase := sorry
def antipode : Uh →ₐ[FormalBase] Uhᵐᵒᵖ := sorry

theorem coproduct_H : coproduct H = leftLeg H+rightLeg H := sorry
theorem coproduct_E : coproduct E = leftLeg E+leftLeg K*rightLeg E := sorry
theorem coproduct_F : coproduct F = leftLeg F*rightLeg Kinv+rightLeg F := sorry
theorem coproduct_K : coproduct K = leftLeg K*rightLeg K := sorry
theorem counit_H : counit H = 0 := sorry
theorem counit_E : counit E = 0 := sorry
theorem counit_F : counit F = 0 := sorry
theorem antipode_H : MulOpposite.unop (antipode H) = -H := sorry
theorem antipode_E : MulOpposite.unop (antipode E) = -Kinv*E := sorry
theorem antipode_F : MulOpposite.unop (antipode F) = -F*K := sorry

theorem coproduct_continuous : Continuous coproduct := sorry
theorem counit_continuous : Continuous counit := sorry
theorem antipode_continuous : Continuous antipode := sorry

def coproductFirst : CompletedTensor 2 →ₐ[FormalBase] CompletedTensor 3 := sorry
def coproductLast : CompletedTensor 2 →ₐ[FormalBase] CompletedTensor 3 := sorry
def swapTensor : CompletedTensor 2 ≃ₐ[FormalBase] CompletedTensor 2 := sorry

theorem coproductFirst_left (u : Uh) : coproductFirst (leftLeg u) = legs12 (coproduct u) := sorry
theorem coproductFirst_right (u : Uh) : coproductFirst (rightLeg u) = tensorInsert 3 2 u := sorry
theorem coproductLast_left (u : Uh) : coproductLast (leftLeg u) = tensorInsert 3 0 u := sorry
theorem coproductLast_right (u : Uh) : coproductLast (rightLeg u) = legs23 (coproduct u) := sorry
theorem swapTensor_left (u : Uh) : swapTensor (leftLeg u) = rightLeg u := sorry
theorem swapTensor_right (u : Uh) : swapTensor (rightLeg u) = leftLeg u := sorry
theorem coproduct_coassociative : coproductFirst.comp coproduct = coproductLast.comp coproduct := sorry

def multiplyTensor : CompletedTensor 2 →ₗ[FormalBase] Uh := sorry
def counitLeft : CompletedTensor 2 →ₐ[FormalBase] Uh := sorry
def counitRight : CompletedTensor 2 →ₐ[FormalBase] Uh := sorry
def antipodeLeft : CompletedTensor 2 →ₗ[FormalBase] CompletedTensor 2 := sorry
def antipodeRight : CompletedTensor 2 →ₗ[FormalBase] CompletedTensor 2 := sorry

theorem multiplyTensor_pure (u v : Uh) : multiplyTensor (leftLeg u*rightLeg v) = u*v := sorry
theorem counitLeft_pure (u v : Uh) : counitLeft (leftLeg u*rightLeg v) = scalar (counit u)*v := sorry
theorem counitRight_pure (u v : Uh) : counitRight (leftLeg u*rightLeg v) = u*scalar (counit v) := sorry
theorem antipodeLeft_pure (u v : Uh) : antipodeLeft (leftLeg u*rightLeg v) =
    leftLeg (MulOpposite.unop (antipode u))*rightLeg v := sorry
theorem antipodeRight_pure (u v : Uh) : antipodeRight (leftLeg u*rightLeg v) =
    leftLeg u*rightLeg (MulOpposite.unop (antipode v)) := sorry
theorem multiplyTensor_continuous : Continuous multiplyTensor := sorry
theorem counitLeft_continuous : Continuous counitLeft := sorry
theorem counitRight_continuous : Continuous counitRight := sorry
theorem antipodeLeft_continuous : Continuous antipodeLeft := sorry
theorem antipodeRight_continuous : Continuous antipodeRight := sorry

theorem counitLeft_coproduct : counitLeft.comp coproduct = AlgHom.id FormalBase Uh := sorry
theorem counitRight_coproduct : counitRight.comp coproduct = AlgHom.id FormalBase Uh := sorry
theorem antipodeLeft_coproduct (u : Uh) :
    multiplyTensor (antipodeLeft (coproduct u)) = scalar (counit u) := sorry
theorem antipodeRight_coproduct (u : Uh) :
    multiplyTensor (antipodeRight (coproduct u)) = scalar (counit u) := sorry

def cartanTensorAtPrecision (p : ℕ) : TensorTruncation 2 p :=
  ∑ d ∈ range p, algebraMap ℚ (TensorTruncation 2 p) (1 / ((4 : ℚ)^d*d.factorial))*
    (tensorProjection 2 p (leftLeg H*rightLeg H))^d *
    (tensorProjection 2 p (tensorScalar 2 PowerSeries.X))^d

def inverseCartanTensorAtPrecision (p : ℕ) : TensorTruncation 2 p :=
  ∑ d ∈ range p, algebraMap ℚ (TensorTruncation 2 p) ((-1/4 : ℚ)^d/d.factorial)*
    (tensorProjection 2 p (leftLeg H*rightLeg H))^d *
    (tensorProjection 2 p (tensorScalar 2 PowerSeries.X))^d

def balancedFactorial (n : ℕ) : FormalBase := ∏ i ∈ range n, formalQInt (i+1)

def inverseBalancedFactorial (n : ℕ) : FormalBase :=
  PowerSeries.invOfUnit (balancedFactorial n) (factorialUnit n)

def rCoefficient (n : ℕ) : FormalBase :=
  formalVPower ((n*(n-1)/2 : ℕ) : ℤ) * (formalVPower 1-formalVPower (-1))^n *
    inverseBalancedFactorial n

def inverseRCoefficient (n : ℕ) : FormalBase :=
  (-1)^n * formalVPower (-((n*(n-1)/2 : ℕ) : ℤ)) *
    (formalVPower 1-formalVPower (-1))^n * inverseBalancedFactorial n

def universalRAtPrecision (p : ℕ) : TensorTruncation 2 p :=
  cartanTensorAtPrecision p * ∑ n ∈ range p,
    tensorProjection 2 p (tensorScalar 2 (rCoefficient n)*leftLeg (F^n)*rightLeg (E^n))

def inverseRAtPrecision (p : ℕ) : TensorTruncation 2 p :=
  (∑ n ∈ range p,
    tensorProjection 2 p (tensorScalar 2 (inverseRCoefficient n)*leftLeg (F^n)*rightLeg (E^n))) *
      inverseCartanTensorAtPrecision p

def universalR : (CompletedTensor 2)ˣ where
  val := ⟨universalRAtPrecision, sorry⟩
  inv := ⟨inverseRAtPrecision, sorry⟩
  val_inv := sorry
  inv_val := sorry

theorem universalR_quasitriangular (u : Uh) :
    (universalR : CompletedTensor 2)*coproduct u =
      swapTensor (coproduct u)*(universalR : CompletedTensor 2) := sorry

theorem universalR_coproductFirst : coproductFirst (universalR : CompletedTensor 2) =
    legs13 (universalR : CompletedTensor 2)*legs23 (universalR : CompletedTensor 2) := sorry

theorem universalR_coproductLast : coproductLast (universalR : CompletedTensor 2) =
    legs13 (universalR : CompletedTensor 2)*legs12 (universalR : CompletedTensor 2) := sorry

theorem yangBaxter :
    legs12 (universalR : CompletedTensor 2)*legs13 (universalR : CompletedTensor 2)*
      legs23 (universalR : CompletedTensor 2) =
    legs23 (universalR : CompletedTensor 2)*legs13 (universalR : CompletedTensor 2)*
      legs12 (universalR : CompletedTensor 2) := sorry

def quadraticCartanExponential (a : ℚ) : Uh :=
  ⟨fun p => quotientMap p (∑ d ∈ range p,
    Polynomial.C (algebraMap ℚ Words (a^d/d.factorial)*(wordH*(wordH+2))^d)*X^d), sorry⟩

def ribbonAtPrecision (p : ℕ) : Truncation p :=
  ∑ n ∈ range p, projection p ((-1)^n*Ftilde n*quadraticCartanExponential (-1/4)*e^n)

def inverseRibbonAtPrecision (p : ℕ) : Truncation p :=
  ∑ n ∈ range p, projection p
    (scalar (formalVPower ((n : ℤ)*(n-1)))*Ftilde n*
      (KUnit ^ (-2*(n : ℤ)) : Uhˣ)*quadraticCartanExponential (1/4)*e^n)

def ribbonElement : Uhˣ where
  val := ⟨ribbonAtPrecision, sorry⟩
  inv := ⟨inverseRibbonAtPrecision, sorry⟩
  val_inv := sorry
  inv_val := sorry

theorem ribbonElement_central (u : Uh) : Commute (ribbonElement : Uh) u := sorry
theorem ribbonElement_antipode : MulOpposite.unop (antipode (ribbonElement : Uh)) =
    (ribbonElement : Uh) := sorry
theorem ribbonElement_counit : counit (ribbonElement : Uh) = 1 := sorry
theorem ribbonElement_coproduct : coproduct (ribbonElement : Uh) =
    ↑((Units.map swapTensor.toMonoidHom universalR * universalR)⁻¹) *
      leftLeg (ribbonElement : Uh)*rightLeg (ribbonElement : Uh) := sorry

def adjointEvaluation : CompletedTensor 2 →ₗ[FormalBase] Uh →ₗ[FormalBase] Uh := sorry

theorem adjointEvaluation_pure (a b x : Uh) :
    adjointEvaluation (leftLeg a*rightLeg b) x = a*x*MulOpposite.unop (antipode b) := sorry

def adjointAction : Uh →ₗ[FormalBase] Uh →ₗ[FormalBase] Uh :=
  adjointEvaluation.comp coproduct.toLinearMap

theorem adjointAction_K (u : Uh) : adjointAction K u = K*u*Kinv := sorry
theorem adjointAction_e (u : Uh) : adjointAction e u = e*u-K*u*Kinv*e := sorry
theorem adjointAction_one (u : Uh) : adjointAction 1 u = u := sorry
theorem adjointAction_mul (a b u : Uh) : adjointAction (a*b) u = adjointAction a (adjointAction b u) := sorry
theorem integralAdjoint_stable (u : Uq) (v : Uqev) : adjointAction u v ∈ Uqev := sorry

/-- Actual finite free modules with the matrices already supplied in QT.2. -/
def colorRepresentation (n : ℕ) : Uh →ₐ[FormalBase] ColorMatrix n := sorry
theorem colorRepresentation_H (n : ℕ) : colorRepresentation n H = colorH n := sorry
theorem colorRepresentation_E (n : ℕ) : colorRepresentation n E = colorE n := sorry
theorem colorRepresentation_F (n : ℕ) : colorRepresentation n F = colorF n := sorry
theorem colorRepresentation_K (n : ℕ) : colorRepresentation n K = colorK n := sorry
theorem colorRepresentation_continuous (n : ℕ) : Continuous (colorRepresentation n) := sorry

def tensorColorRepresentation (m n : ℕ) : CompletedTensor 2 →ₐ[FormalBase]
    Matrix (Fin (m+1) × Fin (n+1)) (Fin (m+1) × Fin (n+1)) FormalBase := sorry

theorem tensorColorRepresentation_pure (m n : ℕ) (u v : Uh) :
    tensorColorRepresentation m n (leftLeg u*rightLeg v) =
      (colorRepresentation m u).kronecker (colorRepresentation n v) := sorry

theorem ribbon_color (n : ℕ) : colorRepresentation n (ribbonElement : Uh) =
    formalExp (-((n : ℚ)*(n+2))/4) • 1 := sorry

theorem twist_color (n : ℕ) : colorRepresentation n (↑ribbonElement⁻¹ : Uh) =
    formalExp (((n : ℚ)*(n+2))/4) • 1 := sorry

-- coproduct_cartan: the Cartan generator is primitive.
example : coproduct H = leftLeg H+rightLeg H := coproduct_H
-- coproduct_F_inverse_K: detects the opposite coproduct convention.
example : coproduct F = leftLeg F*rightLeg Kinv+rightLeg F := coproduct_F
-- antipode_reverses_order: the antipode lands in the opposite algebra.
example (u v : Uh) : MulOpposite.unop (antipode (u*v)) =
    MulOpposite.unop (antipode v)*MulOpposite.unop (antipode u) := sorry
-- R_matrix_classical_limit: the classical braiding degenerates to the symmetry.
example : tensorProjection 2 1 (universalR : CompletedTensor 2) = 1 := sorry
-- R_matrix_first_order: the Cartan coefficient is 1/4 and the root order is F⊗E.
example : tensorProjection 2 2 ((universalR : CompletedTensor 2)-1) =
    tensorProjection 2 2 (tensorScalar 2 PowerSeries.X*
      (PowerSeries.C (1/4 : ℚ) • (leftLeg H*rightLeg H)+leftLeg F*rightLeg E)) := sorry
-- R_matrix_inverse_order: the inverse has its Cartan exponential on the right.
example : (universalR : CompletedTensor 2)*(↑universalR⁻¹ : CompletedTensor 2) = 1 :=
  universalR.val_inv
-- ribbon_unknot_framing: a positive framing uses r⁻¹, with the source's exponent.
example : colorRepresentation 1 (↑ribbonElement⁻¹ : Uh) = formalExp (3/4) • 1 := sorry
-- ribbon_negative_framing: r has the opposite scalar; the two twists are distinguished.
example : colorRepresentation 1 (ribbonElement : Uh) = formalExp (-3/4) • 1 := sorry
-- ribbon_trivial_color: the zero color has no framing anomaly.
example : colorRepresentation 0 (ribbonElement : Uh) = 1 := sorry
-- quantum_dimension_V1: the pivotal trace retains the two formal weights.
example : quantumTrace 1 (1 : ColorMatrix 1) = formalVPower 1+formalVPower (-1) := sorry
-- adjoint_even_stability: the nontrivial adjoint action preserves the integral parity.
example (u : Uq) (v : Uqev) : adjointAction u v ∈ Uqev := integralAdjoint_stable u v

end QuantumEnveloping


/-! QT.1, Habiro math/0605314v1, §§3.2–3.3, pp. 12–14,
equations (3.10)–(3.12), Theorem 3.1 and Proposition 3.3.
Braided coproducts are linear maps; their products use the braided tensor
algebra, so they are not asserted to be ordinary tensor-algebra homomorphisms. -/
namespace QuantumEnveloping
open scoped TensorProduct PowerSeries.WithPiTopology
local instance transmutationRationalDiscreteUniformSpace : UniformSpace ℚ := ⊥

def tensorAdjoint : CompletedTensor 2 →ₗ[FormalBase] CompletedTensor 2 →ₗ[FormalBase]
    CompletedTensor 2 := sorry

theorem tensorAdjoint_pure (a b x y : Uh) :
    tensorAdjoint (leftLeg a*rightLeg b) (leftLeg x*rightLeg y) =
      leftLeg (adjointAction a x)*rightLeg (adjointAction b y) := sorry

def braidedSwap : CompletedTensor 2 ≃ₗ[FormalBase] CompletedTensor 2 where
  toFun x := swapTensor (tensorAdjoint (universalR : CompletedTensor 2) x)
  invFun x := tensorAdjoint (↑universalR⁻¹ : CompletedTensor 2) (swapTensor x)
  left_inv := sorry
  right_inv := sorry
  map_add' := sorry
  map_smul' := sorry

def transmutationContraction : CompletedTensor 2 →ₗ[FormalBase]
    CompletedTensor 2 →ₗ[FormalBase] CompletedTensor 2 := sorry

theorem transmutationContraction_pure (a b u v : Uh) :
    transmutationContraction (leftLeg a*rightLeg b) (leftLeg u*rightLeg v) =
      leftLeg (u*MulOpposite.unop (antipode b))*rightLeg (adjointAction a v) := sorry

def braidedCoproduct : Uh →ₗ[FormalBase] CompletedTensor 2 :=
  (transmutationContraction (universalR : CompletedTensor 2)).comp coproduct.toLinearMap

def antipodeEquiv : Uh ≃ₗ[FormalBase] Uh where
  toFun u := MulOpposite.unop (antipode u)
  invFun := sorry
  left_inv := sorry
  right_inv := sorry
  map_add' := sorry
  map_smul' := sorry

def braidedAntipodeContraction : CompletedTensor 2 →ₗ[FormalBase] Uh →ₗ[FormalBase] Uh := sorry
def inverseBraidedAntipodeContraction : CompletedTensor 2 →ₗ[FormalBase] Uh →ₗ[FormalBase] Uh := sorry

theorem braidedAntipodeContraction_pure (a b u : Uh) :
    braidedAntipodeContraction (leftLeg a*rightLeg b) u = b*antipodeEquiv (adjointAction a u) := sorry

theorem inverseBraidedAntipodeContraction_pure (a b u : Uh) :
    inverseBraidedAntipodeContraction (leftLeg a*rightLeg b) u =
      antipodeEquiv.symm (adjointAction a u)*b := sorry

def braidedAntipode : Uh ≃ₗ[FormalBase] Uh where
  toFun := braidedAntipodeContraction (universalR : CompletedTensor 2)
  invFun := inverseBraidedAntipodeContraction (universalR : CompletedTensor 2)
  left_inv := sorry
  right_inv := sorry
  map_add' := sorry
  map_smul' := sorry

theorem braidedSwap_continuous : Continuous braidedSwap := sorry
theorem inverseBraidedSwap_continuous : Continuous braidedSwap.symm := sorry
theorem braidedCoproduct_continuous : Continuous braidedCoproduct := sorry
theorem braidedAntipode_continuous : Continuous braidedAntipode := sorry
theorem inverseBraidedAntipode_continuous : Continuous braidedAntipode.symm := sorry

/-- The middle two factors cross before multiplication in each output factor. -/
def braidedMultiply : CompletedTensor 2 →ₗ[FormalBase]
    CompletedTensor 2 →ₗ[FormalBase] CompletedTensor 2 := sorry

theorem braidedMultiply_pure (x y u v : Uh) :
    braidedMultiply (leftLeg x*rightLeg y) (leftLeg u*rightLeg v) =
      leftLeg x * braidedSwap (leftLeg y*rightLeg u) * rightLeg v := sorry
theorem braidedMultiply_continuous :
    Continuous (fun z : CompletedTensor 2 × CompletedTensor 2 => braidedMultiply z.1 z.2) := sorry
theorem braidedMultiply_one_left (x : CompletedTensor 2) : braidedMultiply 1 x = x := sorry
theorem braidedMultiply_one_right (x : CompletedTensor 2) : braidedMultiply x 1 = x := sorry
theorem braidedMultiply_associative (x y z : CompletedTensor 2) :
    braidedMultiply (braidedMultiply x y) z = braidedMultiply x (braidedMultiply y z) := sorry
theorem braidedCoproduct_mul (x y : Uh) :
    braidedCoproduct (x*y) = braidedMultiply (braidedCoproduct x) (braidedCoproduct y) := sorry
theorem braidedCoproduct_one : braidedCoproduct 1 = 1 := sorry

def braidedCoproductFirst : CompletedTensor 2 →ₗ[FormalBase] CompletedTensor 3 := sorry
def braidedCoproductLast : CompletedTensor 2 →ₗ[FormalBase] CompletedTensor 3 := sorry
theorem braidedCoproductFirst_pure (x y : Uh) :
    braidedCoproductFirst (leftLeg x*rightLeg y) =
      legs12 (braidedCoproduct x)*tensorInsert 3 2 y := sorry
theorem braidedCoproductLast_pure (x y : Uh) :
    braidedCoproductLast (leftLeg x*rightLeg y) =
      tensorInsert 3 0 x*legs23 (braidedCoproduct y) := sorry
theorem braidedCoproductFirst_continuous : Continuous braidedCoproductFirst := sorry
theorem braidedCoproductLast_continuous : Continuous braidedCoproductLast := sorry
theorem braidedCoproduct_coassociative :
    braidedCoproductFirst.comp braidedCoproduct = braidedCoproductLast.comp braidedCoproduct := sorry
theorem counitLeft_braidedCoproduct :
    counitLeft.toLinearMap.comp braidedCoproduct = LinearMap.id := sorry
theorem counitRight_braidedCoproduct :
    counitRight.toLinearMap.comp braidedCoproduct = LinearMap.id := sorry

def braidedAntipodeLeft : CompletedTensor 2 →ₗ[FormalBase] CompletedTensor 2 := sorry
def braidedAntipodeRight : CompletedTensor 2 →ₗ[FormalBase] CompletedTensor 2 := sorry
theorem braidedAntipodeLeft_pure (x y : Uh) :
    braidedAntipodeLeft (leftLeg x*rightLeg y) = leftLeg (braidedAntipode x)*rightLeg y := sorry
theorem braidedAntipodeRight_pure (x y : Uh) :
    braidedAntipodeRight (leftLeg x*rightLeg y) = leftLeg x*rightLeg (braidedAntipode y) := sorry
theorem braidedAntipodeLeft_continuous : Continuous braidedAntipodeLeft := sorry
theorem braidedAntipodeRight_continuous : Continuous braidedAntipodeRight := sorry
theorem braidedAntipodeLeft_coproduct (x : Uh) :
    multiplyTensor (braidedAntipodeLeft (braidedCoproduct x)) = scalar (counit x) := sorry
theorem braidedAntipodeRight_coproduct (x : Uh) :
    multiplyTensor (braidedAntipodeRight (braidedCoproduct x)) = scalar (counit x) := sorry

def integralFiltration (even : Bool) (p : ℕ) : Submodule QBase Uh where
  carrier := {u | ∃ a : integralInverseLimit even, a.val p = 0 ∧ integralToUh even a = u}
  zero_mem' := sorry
  add_mem' := sorry
  smul_mem' := sorry

def integralTensorFiltration (even : Bool) (n p : ℕ) : Submodule QBase (CompletedTensor n) where
  carrier := {u | ∃ a : integralTensorInverseLimit even n,
    a.val p = 0 ∧ integralTensorToAmbient even n a = u}
  zero_mem' := sorry
  add_mem' := sorry
  smul_mem' := sorry

theorem braidedSwap_integral (x : CompletedTensor 2) (hx : x ∈ completedIntegralTensor true 2) :
    braidedSwap x ∈ completedIntegralTensor true 2 := sorry
theorem inverseBraidedSwap_integral (x : CompletedTensor 2) (hx : x ∈ completedIntegralTensor true 2) :
    braidedSwap.symm x ∈ completedIntegralTensor true 2 := sorry
theorem braidedCoproduct_integral (x : Uh) (hx : x ∈ completion true) :
    braidedCoproduct x ∈ completedIntegralTensor true 2 := sorry
theorem braidedAntipode_integral (x : Uh) (hx : x ∈ completion true) :
    braidedAntipode x ∈ completion true := sorry
theorem inverseBraidedAntipode_integral (x : Uh) (hx : x ∈ completion true) :
    braidedAntipode.symm x ∈ completion true := sorry
theorem multiplyTensor_integral (x : CompletedTensor 2) (hx : x ∈ completedIntegralTensor true 2) :
    multiplyTensor x ∈ completion true := sorry
theorem counit_integral (x : Uh) (hx : x ∈ completion true) : counit x ∈ Set.range qToFormal := sorry

theorem braidedSwap_filtration (p : ℕ) (x : CompletedTensor 2)
    (hx : x ∈ integralTensorFiltration true 2 p) :
    braidedSwap x ∈ integralTensorFiltration true 2 p := sorry
theorem braidedAntipode_filtration (p : ℕ) (x : Uh) (hx : x ∈ integralFiltration true p) :
    braidedAntipode x ∈ integralFiltration true p := sorry
theorem inverseBraidedSwap_filtration (p : ℕ) (x : CompletedTensor 2)
    (hx : x ∈ integralTensorFiltration true 2 p) :
    braidedSwap.symm x ∈ integralTensorFiltration true 2 p := sorry
theorem inverseBraidedAntipode_filtration (p : ℕ) (x : Uh) (hx : x ∈ integralFiltration true p) :
    braidedAntipode.symm x ∈ integralFiltration true p := sorry
theorem braidedCoproduct_filtration (p : ℕ) (x : Uh) (hx : x ∈ integralFiltration true p) :
    braidedCoproduct x ∈ integralTensorFiltration true 2 ((p+1)/2) := sorry
theorem multiplyTensor_filtration (p : ℕ) (x : CompletedTensor 2)
    (hx : x ∈ integralTensorFiltration true 2 p) :
    multiplyTensor x ∈ integralFiltration true p := sorry
theorem counit_filtration (p : ℕ) (hp : 0 < p) (x : Uh) (hx : x ∈ integralFiltration true p) :
    counit x = 0 := sorry

-- braided_swap_classical_limit: it specializes to the flip, not the identity.
example (x y : Uh) : tensorProjection 2 1 (braidedSwap (leftLeg x*rightLeg y)) =
    tensorProjection 2 1 (leftLeg y*rightLeg x) := sorry
-- braided_coproduct_unit: transmutation keeps the multiplicative unit.
example : braidedCoproduct 1 = 1 := sorry
-- braided_antipode_unit: the transmuted antipode preserves the unit.
example : braidedAntipode 1 = 1 := sorry
-- even_requires_transmutation: the ordinary coproduct of FK has an odd K factor.
example : coproduct (Ftilde 1) ∉ completedIntegralTensor true 2 := sorry
-- transmuted_coproduct_even: the braided coproduct has the required integral even image.
example : braidedCoproduct (Ftilde 1) ∈ completedIntegralTensor true 2 :=
  braidedCoproduct_integral _ (integralForm_le_completion true (Ftilde_mem true 1))
-- braided_antipode_invertible: an antipode without its continuous inverse is insufficient.
example (x : Uh) : braidedAntipode.symm (braidedAntipode x) = x := braidedAntipode.symm_apply_apply x
-- braided_coproduct_precision_loss: input F_5 gives output F_3, rather than a claimed F_5.
example (x : Uh) (hx : x ∈ integralFiltration true 5) :
    braidedCoproduct x ∈ integralTensorFiltration true 2 3 := braidedCoproduct_filtration 5 x hx

-- braided_product_crossing: the middle factors use the adjoint braiding.
example (x y u v : Uh) :
    braidedMultiply (leftLeg x*rightLeg y) (leftLeg u*rightLeg v) =
      leftLeg x * braidedSwap (leftLeg y*rightLeg u) * rightLeg v := braidedMultiply_pure x y u v
-- braided_product_unit: both units are tested, since the product is not commutative.
example (x : CompletedTensor 2) : braidedMultiply 1 x = x ∧ braidedMultiply x 1 = x :=
  ⟨braidedMultiply_one_left x, braidedMultiply_one_right x⟩
-- inverse_braided_antipode_precision: the inverse preserves the same integral precision.
example (x : Uh) (hx : x ∈ integralFiltration true 2) :
    braidedAntipode.symm x ∈ integralFiltration true 2 := inverseBraidedAntipode_filtration 2 x hx

end QuantumEnveloping


/-! Habiro math/0605314v1, §3.1, pp. 11–12, and §5.1, pp. 18–19.
Finite free quantum modules form a full subcategory of native ModuleCat U_h.
Restriction of scalars, ordinary module tensor products and module duals
are Mathlib constructions; no second generic category of modules is defined. -/
namespace QuantumEnveloping
open CategoryTheory CategoryTheory.MonoidalCategory
open scoped TensorProduct PowerSeries.WithPiTopology
local instance modulesRationalDiscreteUniformSpace : UniformSpace ℚ := ⊥

def finiteFreeQuantumProperty : ObjectProperty (ModuleCat Uh) := fun M =>
  Module.Free FormalBase ((ModuleCat.restrictScalars scalar.toRingHom).obj M) ∧
    Module.Finite FormalBase ((ModuleCat.restrictScalars scalar.toRingHom).obj M)

abbrev FiniteQuantumModule := finiteFreeQuantumProperty.FullSubcategory

def finiteUnderlying (V : FiniteQuantumModule) : ModuleCat FormalBase :=
  (ModuleCat.restrictScalars scalar.toRingHom).obj V.obj

instance finiteUnderlying_quantumModule (V : FiniteQuantumModule) : Module Uh (finiteUnderlying V) :=
  inferInstanceAs (Module Uh V.obj)

instance finiteUnderlying_free (V : FiniteQuantumModule) : Module.Free FormalBase (finiteUnderlying V) :=
  V.property.1
instance finiteUnderlying_finite (V : FiniteQuantumModule) : Module.Finite FormalBase (finiteUnderlying V) :=
  V.property.2

def finiteCoordinates (V : FiniteQuantumModule) : finiteUnderlying V ≃ₗ[FormalBase]
    (Fin (Module.finrank FormalBase (finiteUnderlying V)) → FormalBase) :=
  (Module.finBasis FormalBase (finiteUnderlying V)).equivFun

instance finiteUnderlyingUniformSpace (V : FiniteQuantumModule) : UniformSpace (finiteUnderlying V) :=
  UniformSpace.comap (finiteCoordinates V) inferInstance

theorem finiteUnderlying_adicTopology (V : FiniteQuantumModule) :
    (inferInstance : TopologicalSpace (finiteUnderlying V)) =
      (Ideal.span {PowerSeries.X} : Ideal FormalBase).adicModuleTopology (finiteUnderlying V) := sorry

theorem finiteUnderlying_t2 (V : FiniteQuantumModule) : T2Space (finiteUnderlying V) := sorry
theorem finiteUnderlying_complete (V : FiniteQuantumModule) : CompleteSpace (finiteUnderlying V) := sorry
theorem finiteHom_continuous {V W : FiniteQuantumModule} (f : V ⟶ W) :
    @Continuous (finiteUnderlying V) (finiteUnderlying W) inferInstance inferInstance (fun x =>
      ((ModuleCat.restrictScalars scalar.toRingHom).map f.hom x : finiteUnderlying W)) := sorry

def finiteAction (V : FiniteQuantumModule) : Uh →ₐ[FormalBase]
    Module.End FormalBase (finiteUnderlying V) := sorry

theorem finiteAction_smul (V : FiniteQuantumModule) (u : Uh) (x : finiteUnderlying V) :
    finiteAction V u x = u • x := sorry

theorem finiteAction_jointContinuous (V : FiniteQuantumModule) :
    Continuous (fun z : Uh × finiteUnderlying V => finiteAction V z.1 z.2) := sorry

def finiteTensorAction (V W : FiniteQuantumModule) : CompletedTensor 2 →ₐ[FormalBase]
    Module.End FormalBase (finiteUnderlying V ⊗[FormalBase] finiteUnderlying W) := sorry

theorem finiteTensorAction_pure (V W : FiniteQuantumModule) (u v : Uh) :
    finiteTensorAction V W (leftLeg u*rightLeg v) =
      TensorProduct.map (finiteAction V u) (finiteAction W v) := sorry

def finiteTensor (V W : FiniteQuantumModule) : FiniteQuantumModule := sorry

def finiteTensorUnderlying (V W : FiniteQuantumModule) :
    finiteUnderlying (finiteTensor V W) ≅
      ModuleCat.of FormalBase (finiteUnderlying V ⊗[FormalBase] finiteUnderlying W) := sorry

theorem finiteTensorAction_coproduct (V W : FiniteQuantumModule) (u : Uh)
    (x : finiteUnderlying (finiteTensor V W)) :
    (finiteTensorUnderlying V W).hom (finiteAction (finiteTensor V W) u x) =
      finiteTensorAction V W (coproduct u) ((finiteTensorUnderlying V W).hom x) := sorry

def finiteUnit : FiniteQuantumModule := sorry
def finiteUnitUnderlying : finiteUnderlying finiteUnit ≅ ModuleCat.of FormalBase FormalBase := sorry

theorem finiteUnitAction (u : Uh) (x : finiteUnderlying finiteUnit) :
    finiteUnitUnderlying.hom (finiteAction finiteUnit u x) = counit u*finiteUnitUnderlying.hom x := sorry

def finiteTensorHom {V W X Y : FiniteQuantumModule} (f : V ⟶ W) (g : X ⟶ Y) :
    finiteTensor V X ⟶ finiteTensor W Y := sorry
def finiteAssociator (U V W : FiniteQuantumModule) :
    finiteTensor (finiteTensor U V) W ≅ finiteTensor U (finiteTensor V W) := sorry
def finiteLeftUnitor (V : FiniteQuantumModule) : finiteTensor finiteUnit V ≅ V := sorry
def finiteRightUnitor (V : FiniteQuantumModule) : finiteTensor V finiteUnit ≅ V := sorry

instance finiteModuleMonoidalStruct : MonoidalCategoryStruct FiniteQuantumModule where
  tensorObj := finiteTensor
  tensorHom := finiteTensorHom
  whiskerLeft V _ _ f := finiteTensorHom (𝟙 V) f
  whiskerRight f V := finiteTensorHom f (𝟙 V)
  tensorUnit := finiteUnit
  associator := finiteAssociator
  leftUnitor := finiteLeftUnitor
  rightUnitor := finiteRightUnitor

instance finiteModuleMonoidal : MonoidalCategory FiniteQuantumModule :=
  MonoidalCategory.ofTensorHom sorry sorry sorry sorry sorry sorry sorry sorry sorry

def finiteBraiding (V W : FiniteQuantumModule) : finiteTensor V W ≅ finiteTensor W V := sorry

theorem finiteBraiding_formula (V W : FiniteQuantumModule)
    (x : finiteUnderlying (finiteTensor V W)) :
    (finiteTensorUnderlying W V).hom
      ((ModuleCat.restrictScalars scalar.toRingHom).map (finiteBraiding V W).hom.hom x) =
    TensorProduct.comm FormalBase _ _
      (finiteTensorAction V W (universalR : CompletedTensor 2) ((finiteTensorUnderlying V W).hom x)) := sorry

instance braidedCategory_modules : BraidedCategory FiniteQuantumModule := sorry

theorem braidedCategory_modules_braiding (V W : FiniteQuantumModule) :
    (β_ V W) = finiteBraiding V W := sorry

def finiteLeftDual (V : FiniteQuantumModule) : FiniteQuantumModule := sorry
def finiteRightDual (V : FiniteQuantumModule) : FiniteQuantumModule := sorry

def finiteLeftDualUnderlying (V : FiniteQuantumModule) :
    finiteUnderlying (finiteLeftDual V) ≅ ModuleCat.of FormalBase (Module.Dual FormalBase (finiteUnderlying V)) := sorry
def finiteRightDualUnderlying (V : FiniteQuantumModule) :
    finiteUnderlying (finiteRightDual V) ≅ ModuleCat.of FormalBase (Module.Dual FormalBase (finiteUnderlying V)) := sorry

theorem finiteLeftDualAction (V : FiniteQuantumModule) (u : Uh)
    (f : finiteUnderlying (finiteLeftDual V)) (x : finiteUnderlying V) :
    (finiteLeftDualUnderlying V).hom (finiteAction (finiteLeftDual V) u f) x =
      (finiteLeftDualUnderlying V).hom f (finiteAction V (antipodeEquiv.symm u) x) := sorry

theorem finiteRightDualAction (V : FiniteQuantumModule) (u : Uh)
    (f : finiteUnderlying (finiteRightDual V)) (x : finiteUnderlying V) :
    (finiteRightDualUnderlying V).hom (finiteAction (finiteRightDual V) u f) x =
      (finiteRightDualUnderlying V).hom f (finiteAction V (antipodeEquiv u) x) := sorry

-- Mathlib's right dual evaluates dual⊗V, and therefore uses S.
def finiteRightEvaluation (V : FiniteQuantumModule) : finiteTensor (finiteRightDual V) V ⟶ finiteUnit := sorry
def finiteRightCoevaluation (V : FiniteQuantumModule) : finiteUnit ⟶ finiteTensor V (finiteRightDual V) := sorry
def finiteLeftEvaluation (V : FiniteQuantumModule) : finiteTensor V (finiteLeftDual V) ⟶ finiteUnit := sorry
def finiteLeftCoevaluation (V : FiniteQuantumModule) : finiteUnit ⟶ finiteTensor (finiteLeftDual V) V := sorry

theorem finiteRightEvaluation_pure (V : FiniteQuantumModule)
    (f : finiteUnderlying (finiteRightDual V)) (x : finiteUnderlying V) :
    finiteUnitUnderlying.hom ((ModuleCat.restrictScalars scalar.toRingHom).map
      (finiteRightEvaluation V).hom ((finiteTensorUnderlying (finiteRightDual V) V).inv (f ⊗ₜ[FormalBase] x))) =
      (finiteRightDualUnderlying V).hom f x := sorry

theorem finiteLeftEvaluation_pure (V : FiniteQuantumModule)
    (x : finiteUnderlying V) (f : finiteUnderlying (finiteLeftDual V)) :
    finiteUnitUnderlying.hom ((ModuleCat.restrictScalars scalar.toRingHom).map
      (finiteLeftEvaluation V).hom ((finiteTensorUnderlying V (finiteLeftDual V)).inv (x ⊗ₜ[FormalBase] f))) =
      (finiteLeftDualUnderlying V).hom f x := sorry

theorem finiteRightCoevaluation_basis (V : FiniteQuantumModule) :
    (finiteTensorUnderlying V (finiteRightDual V)).hom
      ((ModuleCat.restrictScalars scalar.toRingHom).map (finiteRightCoevaluation V).hom
        (finiteUnitUnderlying.inv 1)) =
      ∑ i, (Module.finBasis FormalBase (finiteUnderlying V) i) ⊗ₜ[FormalBase]
        ((finiteRightDualUnderlying V).inv ((Module.finBasis FormalBase (finiteUnderlying V)).dualBasis i)) := sorry

theorem finiteLeftCoevaluation_basis (V : FiniteQuantumModule) :
    (finiteTensorUnderlying (finiteLeftDual V) V).hom
      ((ModuleCat.restrictScalars scalar.toRingHom).map (finiteLeftCoevaluation V).hom
        (finiteUnitUnderlying.inv 1)) =
      ∑ i, ((finiteLeftDualUnderlying V).inv ((Module.finBasis FormalBase (finiteUnderlying V)).dualBasis i))
        ⊗ₜ[FormalBase] (Module.finBasis FormalBase (finiteUnderlying V) i) := sorry

instance finiteRightExact (V : FiniteQuantumModule) : ExactPairing V (finiteRightDual V) where
  coevaluation' := finiteRightCoevaluation V
  evaluation' := finiteRightEvaluation V
  coevaluation_evaluation' := sorry
  evaluation_coevaluation' := sorry

instance finiteLeftExact (V : FiniteQuantumModule) : ExactPairing (finiteLeftDual V) V where
  coevaluation' := finiteLeftCoevaluation V
  evaluation' := finiteLeftEvaluation V
  coevaluation_evaluation' := sorry
  evaluation_coevaluation' := sorry

instance finiteHasRightDual (V : FiniteQuantumModule) : HasRightDual V where
  rightDual := finiteRightDual V
instance finiteHasLeftDual (V : FiniteQuantumModule) : HasLeftDual V where
  leftDual := finiteLeftDual V

instance rigidCategory_modules : RigidCategory FiniteQuantumModule where
  rightDual := finiteHasRightDual
  leftDual := finiteHasLeftDual

def finiteTwist (V : FiniteQuantumModule) : V ≅ V := sorry

theorem finiteTwist_formula (V : FiniteQuantumModule) (x : finiteUnderlying V) :
    (ModuleCat.restrictScalars scalar.toRingHom).map (finiteTwist V).hom.hom x =
      finiteAction V (↑ribbonElement⁻¹ : Uh) x := sorry

def finiteModuleRibbon : RibbonCategory FiniteQuantumModule where
  twist := NatIso.ofComponents finiteTwist sorry
  twist_unit := sorry
  twist_tensor := sorry
  twist_dual := sorry

def finiteColor (n : ℕ) : FiniteQuantumModule := sorry
def finiteColorUnderlying (n : ℕ) : finiteUnderlying (finiteColor n) ≅
    ModuleCat.of FormalBase (sl2Color n) := sorry

theorem finiteColor_action (n : ℕ) (u : Uh) (x : finiteUnderlying (finiteColor n)) :
    (finiteColorUnderlying n).hom (finiteAction (finiteColor n) u x) =
      (colorRepresentation n u).mulVec ((finiteColorUnderlying n).hom x) := sorry

-- module_unit_rank: the monoidal unit is the base ring, not the zero module.
example : Nonempty (finiteUnderlying finiteUnit ≅ ModuleCat.of FormalBase FormalBase) :=
  ⟨finiteUnitUnderlying⟩
-- module_tensor_native: the underlying tensor is the existing module tensor product.
example (V W : FiniteQuantumModule) : Nonempty
    (finiteUnderlying (V ⊗ W) ≅ ModuleCat.of FormalBase
      (finiteUnderlying V ⊗[FormalBase] finiteUnderlying W)) := ⟨finiteTensorUnderlying V W⟩
-- module_braiding_R: the braiding is tied to R rather than an assumed symmetric flip.
example (V W : FiniteQuantumModule) : (β_ V W) = finiteBraiding V W :=
  braidedCategory_modules_braiding V W
-- module_dual_native: duality uses the actual finite module dual.
example (V : FiniteQuantumModule) : Nonempty (finiteUnderlying (finiteLeftDual V) ≅
    ModuleCat.of FormalBase (Module.Dual FormalBase (finiteUnderlying V))) := ⟨finiteLeftDualUnderlying V⟩
-- module_color_carrier: the color object has the source's actual rank-n+1 carrier.
example (n : ℕ) : Nonempty (finiteUnderlying (finiteColor n) ≅ ModuleCat.of FormalBase (sl2Color n)) :=
  ⟨finiteColorUnderlying n⟩
-- module_twist_color_one: positive framing agrees with the scalar matrix test.
example (x : finiteUnderlying (finiteColor 1)) :
    (finiteColorUnderlying 1).hom
      ((ModuleCat.restrictScalars scalar.toRingHom).map (finiteTwist (finiteColor 1)).hom.hom x) =
      formalExp (3/4) • (finiteColorUnderlying 1).hom x := sorry

end QuantumEnveloping


/-! QT.5: concrete principal charts, followed by the full cut cover and
extended groups. Strong flattenings and geometric cycles require the actual
triangulation interface from their supplier. -/
structure ShapeChart where
  z : ℂ
  ne_zero : z ≠ 0
  ne_one : z ≠ 1

namespace ShapeChart

def nextShape (s : ShapeChart) : ℂ := 1 / (1 - s.z)
def lastShape (s : ShapeChart) : ℂ := 1 - 1 / s.z

theorem shape_product (s : ShapeChart) : s.z * s.nextShape * s.lastShape = -1 := sorry
end ShapeChart

structure FlatteningChart extends ShapeChart where
  p : ℤ
  q : ℤ

namespace FlatteningChart

def w₀ (s : FlatteningChart) : ℂ := Complex.log s.z + s.p * Real.pi * Complex.I
def w₁ (s : FlatteningChart) : ℂ := -Complex.log (1 - s.z) + s.q * Real.pi * Complex.I
def w₂ (s : FlatteningChart) : ℂ := -(s.w₀ + s.w₁)

theorem flattening_sum_zero (s : FlatteningChart) : s.w₀ + s.w₁ + s.w₂ = 0 := sorry

-- flattening_zero_zero, chart version
example (s : FlatteningChart) (hp : s.p = 0) (hq : s.q = 0) :
    s.w₀ = Complex.log s.z ∧ s.w₁ = -Complex.log (1 - s.z) := sorry
-- flattening_determines_shape: both independent log parameters are needed
example (s t : FlatteningChart) (h₀ : s.w₀ = t.w₀) (h₁ : s.w₁ = t.w₁) : s.z = t.z := sorry
end FlatteningChart

/-- A principal regular chart, not a globally flattened triangulation. -/
def regularChart : FlatteningChart where
  z := Complex.exp (Real.pi * Complex.I / 3)
  ne_zero := sorry
  ne_one := sorry
  p := 0
  q := 0

-- flattening_regular
example : regularChart.w₀ = Real.pi * Complex.I / 3 ∧
    regularChart.w₁ = Real.pi * Complex.I / 3 ∧
    regularChart.w₂ = -2 * Real.pi * Complex.I / 3 := sorry

/-! QT.5: Neumann's four-component logarithmic cover, the two relation
families, and the logarithmic Dehn map. Neumann, Definition 2.2, Lemma 2.3,
Definition 2.4, pp. 417–418, and Definition 3.1/Lemma 3.2, pp. 421–422.
The intrinsic model uses exp(2w₀)=z² and exp(-2w₁)=(1-z)²; it retains odd
sheets, unlike the ordinary simultaneous-logarithm cover. -/
namespace ExtendedBloch

abbrev Shape := {z : ℂ // z ≠ 0 ∧ z ≠ 1}

/-- Both logarithms determine the shape. The topology is the subspace topology
of ℂ³, which makes path lifting and the distinguished five-term component meaningful. -/
def Flattening := {t : ℂ × ℂ × ℂ //
  t.1 ≠ 0 ∧ t.1 ≠ 1 ∧ Complex.exp (2 * t.2.1) = t.1 ^ 2 ∧
    Complex.exp (-2 * t.2.2) = (1 - t.1) ^ 2}

instance : TopologicalSpace Flattening := inferInstanceAs (TopologicalSpace {t : ℂ × ℂ × ℂ //
  t.1 ≠ 0 ∧ t.1 ≠ 1 ∧ Complex.exp (2 * t.2.1) = t.1 ^ 2 ∧
    Complex.exp (-2 * t.2.2) = (1 - t.1) ^ 2})

def Flattening.shape (f : Flattening) : Shape := ⟨f.1.1, f.2.1, f.2.2.1⟩
def Flattening.w₀ (f : Flattening) : ℂ := f.1.2.1
def Flattening.w₁ (f : Flattening) : ℂ := f.1.2.2
def Flattening.w₂ (f : Flattening) : ℂ := -(f.w₀ + f.w₁)

theorem flattening_sum_zero (f : Flattening) : f.w₀ + f.w₁ + f.w₂ = 0 := sorry

theorem flattening_shape_recovery (f : Flattening) :
    f.shape.1 = (1 + Complex.exp (2 * f.w₀) - Complex.exp (-2 * f.w₁)) / 2 := sorry

theorem Flattening.ext {f g : Flattening}
    (h₀ : f.w₀ = g.w₀) (h₁ : f.w₁ = g.w₁) : f = g := sorry

/-- Principal chart; the cut quotient below specifies the boundary-side transitions. -/
def chart (z : Shape) (p q : ℤ) : Flattening :=
  ⟨(z.1, Complex.log z.1 + p * Real.pi * Complex.I,
    -Complex.log (1 - z.1) + q * Real.pi * Complex.I), by sorry⟩

def deck (f : Flattening) (p q : ℤ) : Flattening :=
  ⟨(f.shape.1, f.w₀ + p * Real.pi * Complex.I, f.w₁ + q * Real.pi * Complex.I),
    by sorry⟩

theorem deck_zero (f : Flattening) : deck f 0 0 = f := sorry

theorem deck_add (f : Flattening) (p q r s : ℤ) :
    deck (deck f p q) r s = deck f (p + r) (q + s) := sorry

theorem chart_deck (z : Shape) (p q r s : ℤ) :
    deck (chart z p q) r s = chart z (p + r) (q + s) := sorry

theorem chart_surjective (f : Flattening) : ∃ z p q, f = chart z p q := sorry

inductive CutSide where | upper | lower
  deriving DecidableEq

def OnCut (z : Shape) : Prop := z.1.im = 0 ∧ (z.1.re < 0 ∨ 1 < z.1.re)

structure CutPoint where
  shape : Shape
  side : CutSide
  lower_on_cut : side = .lower → OnCut shape

def cutUpper (z : Shape) : CutPoint := ⟨z, .upper, by intro h; cases h⟩
def cutLower (z : Shape) (h : OnCut z) : CutPoint := ⟨z, .lower, by intro _; exact h⟩

/-- The negative cut has arguments +π above and -π below. -/
def cutLog₀ (c : CutPoint) : ℂ :=
  Complex.log c.shape.1 -
    (if c.side = .lower ∧ c.shape.1.re < 0 then 2 * Real.pi * Complex.I else 0)

/-- Above the >1 cut, -log(1-z) has imaginary part +π. -/
def cutLog₁ (c : CutPoint) : ℂ :=
  -Complex.log (1 - c.shape.1) +
    (if c.side = .upper ∧ c.shape.1.im = 0 ∧ 1 < c.shape.1.re
      then 2 * Real.pi * Complex.I else 0)

/-- Separate the two banks by their limiting logarithms. -/
instance : TopologicalSpace CutPoint :=
  TopologicalSpace.induced (fun c => (c.shape.1, cutLog₀ c, cutLog₁ c)) inferInstance

abbrev CutRaw := CutPoint × ℤ × ℤ

inductive CutIdentification : CutRaw → CutRaw → Prop
  | negative (z : Shape) (him : z.1.im = 0) (hre : z.1.re < 0) (p q : ℤ) :
      CutIdentification (cutUpper z, p, q)
        (cutLower z ⟨him, Or.inl hre⟩, p + 2, q)
  | positive (z : Shape) (him : z.1.im = 0) (hre : 1 < z.1.re) (p q : ℤ) :
      CutIdentification (cutUpper z, p, q)
        (cutLower z ⟨him, Or.inr hre⟩, p, q + 2)

/-- Actual cut-side quotient, with its quotient topology. -/
def CutCover := Quotient (Relation.EqvGen.setoid CutIdentification)
instance : TopologicalSpace CutCover := inferInstanceAs
  (TopologicalSpace (Quotient (Relation.EqvGen.setoid CutIdentification)))

def cutClass (c : CutRaw) : CutCover := Quotient.mk _ c

def rawFlattening (c : CutRaw) : Flattening :=
  ⟨(c.1.shape.1, cutLog₀ c.1 + c.2.1 * Real.pi * Complex.I,
    cutLog₁ c.1 + c.2.2 * Real.pi * Complex.I), by sorry⟩

def cutFlattening : CutCover → Flattening := Quotient.lift rawFlattening (by sorry)

/-- The cut construction and the intrinsic log-triple model agree as spaces. -/
def flatteningEquiv : CutCover ≃ₜ Flattening where
  toEquiv := Equiv.ofBijective cutFlattening (by sorry)
  continuous_toFun := by sorry
  continuous_invFun := by sorry

theorem flatteningEquiv_raw (c : CutRaw) :
    flatteningEquiv (cutClass c) = rawFlattening c := sorry

theorem flattening_cover_transition (z : Shape) (p q : ℤ) :
    (∀ (him : z.1.im = 0) (hre : z.1.re < 0),
      cutClass (cutUpper z, p, q) = cutClass (cutLower z ⟨him, Or.inl hre⟩, p + 2, q)) ∧
    (∀ (him : z.1.im = 0) (hre : 1 < z.1.re),
      cutClass (cutUpper z, p, q) = cutClass (cutLower z ⟨him, Or.inr hre⟩, p, q + 2)) := sorry

-- flattening_zero_zero: the principal chart, including the third parameter.
example (z : Shape) : (chart z 0 0).w₀ = Complex.log z.1 ∧
    (chart z 0 0).w₁ = -Complex.log (1 - z.1) ∧
    (chart z 0 0).w₂ = Complex.log (1 - z.1) - Complex.log z.1 := sorry

-- flattening_determines_shape: both logarithms are necessary.
example (f g : Flattening) (h₀ : f.w₀ = g.w₀) (h₁ : f.w₁ = g.w₁) :
    f.shape = g.shape := sorry
example : ∃ f g : Flattening, f.w₀ = g.w₀ ∧ f.shape ≠ g.shape := sorry

-- flattening_regular: compatibility with the existing concrete chart.
def regularShape : Shape := ⟨regularChart.z, regularChart.ne_zero, regularChart.ne_one⟩
example : (chart regularShape 0 0).w₀ = Real.pi * Complex.I / 3 ∧
    (chart regularShape 0 0).w₁ = Real.pi * Complex.I / 3 ∧
    (chart regularShape 0 0).w₂ = -2 * Real.pi * Complex.I / 3 := sorry

-- Odd sheets must not collapse to the ordinary even-sheet cover.
example (z : Shape) : chart z 1 0 ≠ chart z 0 0 := sorry
example (z : Shape) : Complex.exp (chart z 1 0).w₀ = -z.1 := sorry
example (z : Shape) : ¬ Joined (chart z 0 0) (chart z 1 0) := sorry
example (z : Shape) : Joined (chart z 0 0) (chart z 2 0) := sorry

/-- Explicit ordinary five-shape locus. -/
def FiveTerm (z : Fin 5 → Shape) : Prop :=
  z 0 ≠ z 1 ∧ (z 2).1 = (z 1).1 / (z 0).1 ∧
    (z 3).1 = (1 - (z 0).1⁻¹) / (1 - (z 1).1⁻¹) ∧
    (z 4).1 = (1 - (z 0).1) / (1 - (z 1).1)

def FiveTermPositive (z : Fin 5 → Shape) : Prop :=
  FiveTerm z ∧ ∀ i, 0 < (z i).1.im

def fiveTermPreimage : Set (Fin 5 → Flattening) :=
  {f | FiveTerm (fun i => (f i).shape)}

/-- Path component of the actual five-shape preimage containing FT⁺ principal lifts.
This uses paths in the cover; it is not unrestricted choice of five sheets. -/
def LiftedFiveTermZero (f : Fin 5 → Flattening) : Prop :=
  ∃ z : Fin 5 → Shape, FiveTermPositive z ∧
    JoinedIn fiveTermPreimage (fun i => chart (z i) 0 0) f

/-- The source's five independent sheet coordinates. -/
def sheetLattice (p₀ p₁ q₀ q₁ q₂ : ℤ) : Fin 5 → ℤ × ℤ :=
  ![(p₀, q₀), (p₁, q₁), (p₁ - p₀, q₂),
    (p₁ - p₀ + q₁ - q₀, q₂ - q₁), (q₁ - q₀, q₂ - q₁ - p₀)]

def LiftedFiveTerm (f : Fin 5 → Flattening) : Prop :=
  ∃ g, LiftedFiveTermZero g ∧ ∃ p₀ p₁ q₀ q₁ q₂ : ℤ,
    ∀ i, f i = deck (g i) (sheetLattice p₀ p₁ q₀ q₁ q₂ i).1
      (sheetLattice p₀ p₁ q₀ q₁ q₂ i).2

theorem liftedFiveTerm_forget {f : Fin 5 → Flattening} (h : LiftedFiveTerm f) :
    FiveTerm (fun i => (f i).shape) := sorry

theorem liftedFiveTerm_chart_iff (z : Fin 5 → Shape) (h : FiveTermPositive z)
    (p q : Fin 5 → ℤ) : LiftedFiveTerm (fun i => chart (z i) (p i) (q i)) ↔
    p 2 = p 1 - p 0 ∧ p 3 = p 1 - p 0 + q 1 - q 0 ∧
    q 3 = q 2 - q 1 ∧ p 4 = q 1 - q 0 ∧ q 4 = q 2 - q 1 - p 0 := sorry

-- lift_sheet_constraint: illegal independent choices are rejected in FT⁺.
example (z : Fin 5 → Shape) (hz : FiveTermPositive z) (p q : Fin 5 → ℤ)
    (hp : p 2 ≠ p 1 - p 0) : ¬ LiftedFiveTerm (fun i => chart (z i) (p i) (q i)) := sorry
example (z : Fin 5 → Shape) (hz : FiveTermPositive z) (p₀ p₁ q₀ q₁ q₂ : ℤ) :
    LiftedFiveTerm (fun i => chart (z i) (sheetLattice p₀ p₁ q₀ q₁ q₂ i).1
      (sheetLattice p₀ p₁ q₀ q₁ q₂ i).2) := sorry
example : ∃ z : Fin 5 → Shape, FiveTermPositive z := sorry

abbrev FreeFlattening := FreeAbelianGroup Flattening

def fiveTermRelation (f : Fin 5 → Flattening) : FreeFlattening :=
  ∑ i, (-1 : ℤ) ^ i.val • FreeAbelianGroup.of (f i)

def transferRelation (f : Flattening) (p q p' q' : ℤ) : FreeFlattening :=
  FreeAbelianGroup.of (deck f p q) + FreeAbelianGroup.of (deck f p' q') -
    FreeAbelianGroup.of (deck f p q') - FreeAbelianGroup.of (deck f p' q)

def liftedRelations : AddSubgroup FreeFlattening :=
  AddSubgroup.closure {a | ∃ f, LiftedFiveTerm f ∧ a = fiveTermRelation f}

def transferRelations : AddSubgroup FreeFlattening :=
  AddSubgroup.closure {a | ∃ f p q p' q', a = transferRelation f p q p' q'}

def extendedRelations : AddSubgroup FreeFlattening := liftedRelations ⊔ transferRelations

abbrev extendedPreBloch := FreeFlattening ⧸ extendedRelations

def classMap : FreeFlattening →+ extendedPreBloch := QuotientAddGroup.mk' extendedRelations

def gen (f : Flattening) : extendedPreBloch := classMap (FreeAbelianGroup.of f)

theorem lifted_five_term (f : Fin 5 → Flattening) (h : LiftedFiveTerm f) :
    classMap (fiveTermRelation f) = 0 := sorry

theorem transfer_zero_general (f : Flattening) (p q p' q' : ℤ) :
    classMap (transferRelation f p q p' q') = 0 := sorry

/-- Universal property with both concrete relation families. -/
def lift {A : Type*} [AddCommGroup A] (g : Flattening → A)
    (_h₅ : ∀ f, LiftedFiveTerm f → ∑ i, (-1 : ℤ) ^ i.val • g (f i) = 0)
    (_ht : ∀ f p q p' q', g (deck f p q) + g (deck f p' q') -
      g (deck f p q') - g (deck f p' q) = 0) : extendedPreBloch →+ A :=
  QuotientAddGroup.lift extendedRelations (FreeAbelianGroup.lift g) (by sorry)

theorem lift_gen {A : Type*} [AddCommGroup A] (g : Flattening → A)
    (h₅ : ∀ f, LiftedFiveTerm f → ∑ i, (-1 : ℤ) ^ i.val • g (f i) = 0)
    (ht : ∀ f p q p' q', g (deck f p q) + g (deck f p' q') -
      g (deck f p q') - g (deck f p' q) = 0) (f : Flattening) :
    lift g h₅ ht (gen f) = g f := sorry

theorem hom_ext {A : Type*} [AddCommGroup A] (φ ψ : extendedPreBloch →+ A)
    (h : ∀ f, φ (gen f) = ψ (gen f)) : φ = ψ := sorry

/-- Import-facing forgetful map. The target P and generator map come from the
ordinary pre-Bloch supplier; no second ordinary pre-Bloch group is constructed here. -/
def forget {P : Type*} [AddCommGroup P] (g : Shape → P)
    (h₅ : ∀ z, FiveTerm z → ∑ i, (-1 : ℤ) ^ i.val • g (z i) = 0) :
    extendedPreBloch →+ P :=
  lift (fun f => g f.shape) (by sorry) (by sorry)

theorem forget_gen {P : Type*} [AddCommGroup P] (g : Shape → P)
    (h₅ : ∀ z, FiveTerm z → ∑ i, (-1 : ℤ) ^ i.val • g (z i) = 0) (f : Flattening) :
    forget g h₅ (gen f) = g f.shape := sorry

-- lifted_five_term_general: the actual forgetful relation, in any supplied P.
example {P : Type*} [AddCommGroup P] (g : Shape → P)
    (h₅ : ∀ z, FiveTerm z → ∑ i, (-1 : ℤ) ^ i.val • g (z i) = 0)
    (f : Fin 5 → Flattening) (hf : LiftedFiveTerm f) :
    forget g h₅ (classMap (fiveTermRelation f)) =
      ∑ i, (-1 : ℤ) ^ i.val • g (f i).shape := sorry

-- transfer_zero: the required (1,1), (0,0), (1,0), (0,1) test.
example (z : Shape) : gen (chart z 1 1) + gen (chart z 0 0) -
    gen (chart z 1 0) - gen (chart z 0 1) = 0 := sorry

/-- Omitting transfer retains Neumann's order-two class (Lemma 7.1/Proposition 7.2, pp. 439–440). -/
abbrev preBlochWithoutTransfer := FreeFlattening ⧸ liftedRelations

def noTransferClass : FreeFlattening →+ preBlochWithoutTransfer :=
  QuotientAddGroup.mk' liftedRelations

example (z : Shape) : noTransferClass (transferRelation (chart z 0 0) 1 1 0 0) ≠ 0 ∧
    (2 : ℤ) • noTransferClass (transferRelation (chart z 0 0) 1 1 0 0) = 0 := sorry

abbrev LogWedge := ⋀[ℤ]^2 ℂ

def wedge (a b : ℂ) : LogWedge := exteriorPower.ιMulti ℤ 2 ![a, b]

def freeDehn : FreeFlattening →+ LogWedge :=
  FreeAbelianGroup.lift (fun f => wedge f.w₀ f.w₁)

theorem freeDehn_lifted (f : Fin 5 → Flattening) (h : LiftedFiveTerm f) :
    freeDehn (fiveTermRelation f) = 0 := sorry

theorem freeDehn_transfer (f : Flattening) (p q p' q' : ℤ) :
    freeDehn (transferRelation f p q p' q') = 0 := sorry

def extendedDehn : extendedPreBloch →+ LogWedge :=
  QuotientAddGroup.lift extendedRelations freeDehn (by sorry)

theorem extendedDehn_gen (f : Flattening) :
    extendedDehn (gen f) = wedge f.w₀ f.w₁ := sorry

/-- Genuine subgroup of the constructed extended pre-Bloch quotient. -/
def extendedBloch : AddSubgroup extendedPreBloch := extendedDehn.ker

theorem extendedBloch_mem_iff (x : extendedPreBloch) :
    x ∈ extendedBloch ↔ extendedDehn x = 0 := sorry

-- extendedBloch_zero
example : (0 : extendedPreBloch) ∈ extendedBloch := sorry
-- extendedDehn_transfer
example (z : Shape) (p q p' q' : ℤ) :
    extendedDehn (gen (chart z p q) + gen (chart z p' q') -
      gen (chart z p q') - gen (chart z p' q)) = 0 := sorry
-- extendedDehn_sheet_change
example (z : Shape) (p q : ℤ) :
    extendedDehn (gen (chart z (p + 1) q)) - extendedDehn (gen (chart z p q)) =
      wedge (Real.pi * Complex.I) (chart z p q).w₁ := sorry

-- The logarithmic wedge is over ℤ, not over ℂ (where the square is zero).
example : ∃ z : Shape, gen (chart z 0 0) ∉ extendedBloch := sorry


/-- Neumann's multiplicative boundary square (Theorem 7.5, p. 441).
The additive type synonym exposes the ℤ-module of complex units. -/
abbrev UnitsWedge := ⋀[ℤ]^2 (Additive ℂˣ)

def expLinear : ℂ →ₗ[ℤ] Additive ℂˣ where
  toFun w := Additive.ofMul (Units.mk0 (Complex.exp w) (Complex.exp_ne_zero w))
  map_add' := by sorry
  map_smul' := by sorry

def exponentialBoundary : LogWedge →ₗ[ℤ] UnitsWedge :=
  (-2 : ℤ) • exteriorPower.map 2 expLinear

def shapeUnit (z : Shape) : ℂˣ := Units.mk0 z.1 z.2.1
def complementUnit (z : Shape) : ℂˣ := Units.mk0 (1 - z.1) (by sorry)

def ordinaryBoundaryGenerator (z : Shape) : UnitsWedge :=
  (2 : ℤ) • exteriorPower.ιMulti ℤ 2
    ![Additive.ofMul (shapeUnit z), Additive.ofMul (complementUnit z)]

theorem exponentialBoundary_gen (f : Flattening) :
    exponentialBoundary (extendedDehn (gen f)) = ordinaryBoundaryGenerator f.shape := sorry

/-- The supplier's boundary must have exactly the displayed factor-two convention. -/
theorem forget_boundary {P : Type*} [AddCommGroup P] (g : Shape → P)
    (h₅ : ∀ z, FiveTerm z → ∑ i, (-1 : ℤ) ^ i.val • g (z i) = 0)
    (δ : P →+ UnitsWedge) (hδ : ∀ z, δ (g z) = ordinaryBoundaryGenerator z)
    (x : extendedPreBloch) :
    δ (forget g h₅ x) = exponentialBoundary (extendedDehn x) := sorry

/-- Native kernel restriction; instantiate P,g,δ from the ordinary Bloch owner.
This does not identify exterior, factor-two, and antisymmetric-tensor kernels. -/
def extendedBloch_forget {P : Type*} [AddCommGroup P] (g : Shape → P)
    (h₅ : ∀ z, FiveTerm z → ∑ i, (-1 : ℤ) ^ i.val • g (z i) = 0)
    (δ : P →+ UnitsWedge) (hδ : ∀ z, δ (g z) = ordinaryBoundaryGenerator z) :
    extendedBloch →+ δ.ker where
  toFun x := ⟨forget g h₅ x.val, by
    change δ (forget g h₅ x.val) = 0
    rw [forget_boundary g h₅ δ hδ x.val, (extendedBloch_mem_iff x.val).mp x.property]
    exact map_zero exponentialBoundary⟩
  map_zero' := by sorry
  map_add' := by sorry

-- expLinear retains the sign on an odd sheet.
example (z : Shape) : (expLinear (chart z 1 0).w₀).toMul = -shapeUnit z := sorry
-- The factor -2 converts the inverse in w₁ to Neumann's +2 boundary.
example (z : Shape) (p q : ℤ) :
    exponentialBoundary (wedge (chart z p q).w₀ (chart z p q).w₁) =
      ordinaryBoundaryGenerator z := sorry
-- The restricted map agrees with the actual forgetful homomorphism.
example {P : Type*} [AddCommGroup P] (g : Shape → P)
    (h₅ : ∀ z, FiveTerm z → ∑ i, (-1 : ℤ) ^ i.val • g (z i) = 0)
    (δ : P →+ UnitsWedge) (hδ : ∀ z, δ (g z) = ordinaryBoundaryGenerator z)
    (x : extendedBloch) : (extendedBloch_forget g h₅ δ hδ x).val = forget g h₅ x.val := sorry

/-! QT.5: the complex-period Rogers regulator on the actual logarithmic cover.
Neumann, Proposition 2.5 and proof, pp. 419–420. `li₂` is the function supplied
by Polylogarithms:P.1/classical-polylogarithm at index 2, with its lower-bank
value on (1,∞). It is an explicit parameter until that supplier has a native
import; QT does not introduce another dilogarithm. Series, derivative and cut
limit hypotheses below specify that branch rather than assuming the regulator
or its five-term equation. The cover descent retains both cut banks.
-/
section RogersRegulator

/-- The period group is discrete integer multiples, not a real or complex span. -/
def rogersPeriods : AddSubgroup ℂ := AddSubgroup.zmultiples ((Real.pi : ℂ) ^ 2)

abbrev RogersTarget := ℂ ⧸ rogersPeriods

def rogersClass : ℂ →+ RogersTarget := QuotientAddGroup.mk' rogersPeriods

theorem rogersClass_eq_iff (a b : ℂ) :
    rogersClass a = rogersClass b ↔ ∃ n : ℤ, a - b = n * (Real.pi : ℂ) ^ 2 := sorry

/-- Imaginary part survives the real period quotient; real part remains modulo π². -/
def rogersImaginary : RogersTarget →+ ℝ :=
  QuotientAddGroup.lift rogersPeriods
    { toFun := Complex.im, map_zero' := by simp, map_add' := fun _ _ => by simp }
    (by sorry)

theorem rogersImaginary_class (a : ℂ) : rogersImaginary (rogersClass a) = a.im := rfl

/-- Correct the supplier's lower-bank value to the upper bank at x>1. -/
def cutDilog (li₂ : ℂ → ℂ) (c : CutPoint) : ℂ :=
  li₂ c.shape.1 +
    if c.side = .upper ∧ c.shape.1.im = 0 ∧ 1 < c.shape.1.re
    then 2 * Real.pi * Complex.I * Complex.log c.shape.1 else 0

/-- Formula on a specified bank, with w₁'s minus-log convention retained. -/
def rawRogers (li₂ : ℂ → ℂ) (c : CutRaw) : ℂ :=
  cutDilog li₂ c.1 - cutLog₀ c.1 * cutLog₁ c.1 / 2 +
    (Real.pi * Complex.I / 2) *
      (-(c.2.1 : ℂ) * cutLog₁ c.1 + (c.2.2 : ℂ) * cutLog₀ c.1) -
    (Real.pi : ℂ) ^ 2 / 6

/-- The two gluing identifications change the raw formula by -qπ² and +pπ². -/
theorem rawRogers_negative (li₂ : ℂ → ℂ) (z : Shape)
    (him : z.1.im = 0) (hre : z.1.re < 0) (p q : ℤ) :
    rawRogers li₂ (cutUpper z, p, q) -
      rawRogers li₂ (cutLower z ⟨him, Or.inl hre⟩, p + 2, q) =
        -(q : ℂ) * (Real.pi : ℂ) ^ 2 := by
  have hn : ¬ 1 < z.1.re := by linarith
  simp only [rawRogers, cutDilog, cutLog₀, cutLog₁, cutUpper, cutLower]
  simp [hn, hre]
  ring_nf
  simp [Complex.I_sq]

theorem rawRogers_positive (li₂ : ℂ → ℂ) (z : Shape)
    (him : z.1.im = 0) (hre : 1 < z.1.re) (p q : ℤ) :
    rawRogers li₂ (cutUpper z, p, q) -
      rawRogers li₂ (cutLower z ⟨him, Or.inr hre⟩, p, q + 2) =
        (p : ℂ) * (Real.pi : ℂ) ^ 2 := by
  have hn : ¬ z.1.re < 0 := by linarith
  simp only [rawRogers, cutDilog, cutLog₀, cutLog₁, cutUpper, cutLower]
  simp [hn, hre, him]
  ring_nf
  simp [Complex.I_sq]

theorem rawRogers_identification (li₂ : ℂ → ℂ) {a b : CutRaw}
    (h : Relation.EqvGen CutIdentification a b) :
    rogersClass (rawRogers li₂ a) = rogersClass (rawRogers li₂ b) := sorry

/-- A genuine quotient lift, not a choice of five independent principal logs. -/
def cutRogers (li₂ : ℂ → ℂ) : CutCover → RogersTarget :=
  Quotient.lift (fun c => rogersClass (rawRogers li₂ c))
    (fun _ _ h => rawRogers_identification li₂ h)

def rogersOnFlattening (li₂ : ℂ → ℂ) (f : Flattening) : RogersTarget :=
  cutRogers li₂ (flatteningEquiv.symm f)

/-- The chart formula uses precisely the supplier's lower-bank principal branch. -/
def rogersChartRaw (li₂ : ℂ → ℂ) (z : Shape) (p q : ℤ) : ℂ :=
  li₂ z.1 + Complex.log z.1 * Complex.log (1 - z.1) / 2 +
    (Real.pi * Complex.I / 2) *
      ((p : ℂ) * Complex.log (1 - z.1) + (q : ℂ) * Complex.log z.1) -
    (Real.pi : ℂ) ^ 2 / 6

theorem rogersOnFlattening_chart (li₂ : ℂ → ℂ) (z : Shape) (p q : ℤ) :
    rogersOnFlattening li₂ (chart z p q) = rogersClass (rogersChartRaw li₂ z p q) := sorry

theorem extendedRogers_transfer (li₂ : ℂ → ℂ) (f : Flattening) (p q p' q' : ℤ) :
    rogersOnFlattening li₂ (deck f p q) + rogersOnFlattening li₂ (deck f p' q') -
      rogersOnFlattening li₂ (deck f p q') - rogersOnFlattening li₂ (deck f p' q) = 0 := sorry

/- Named branch inputs from the supplier: disk series, slit derivative and lower cut limit.
Neumann's proof first derives the real five-term identity, continues it to FT⁺,
then along the distinguished lifted component and the prescribed sheet lattice. -/
variable (li₂ : ℂ → ℂ)
  (hseries : ∀ z : ℂ, ‖z‖ < 1 →
    HasSum (fun k : ℕ => z ^ (k + 1) / ((k + 1 : ℕ) : ℂ) ^ 2) (li₂ z))
  (hderiv : ∀ z : ℂ, z ≠ 0 → 1 - z ∈ Complex.slitPlane →
    HasDerivAt li₂ (-Complex.log (1 - z) / z) z)
  (hlower : ∀ x : ℝ, 1 < x →
    Filter.Tendsto (fun ε : ℝ => li₂ ((x : ℂ) - ε * Complex.I))
      (nhdsWithin 0 (Set.Ioi 0)) (nhds (li₂ x)))

include hseries hderiv hlower in
theorem extendedRogers_liftedFiveTerm (f : Fin 5 → Flattening) (hf : LiftedFiveTerm f) :
    ∑ i, (-1 : ℤ) ^ i.val • rogersOnFlattening li₂ (f i) = 0 := sorry

/-- Both relation families descend to an additive map on the existing quotient. -/
def extendedRogers : extendedPreBloch →+ RogersTarget :=
  lift (rogersOnFlattening li₂)
    (extendedRogers_liftedFiveTerm li₂ hseries hderiv hlower)
    (extendedRogers_transfer li₂)

theorem extendedRogers_gen (f : Flattening) :
    extendedRogers li₂ hseries hderiv hlower (gen f) = rogersOnFlattening li₂ f :=
  lift_gen _ _ _ f

def extendedRogersBloch : extendedBloch →+ RogersTarget :=
  (extendedRogers li₂ hseries hderiv hlower).comp extendedBloch.subtype

/-- A single flattening includes the alternating log-area correction. It need not
have imaginary value D(z); zero extended Dehn class cancels the correction in a sum. -/
theorem rogersOnFlattening_im (D : Shape → ℝ)
    (hD : ∀ z, D z = (li₂ z.1).im + Complex.arg (1 - z.1) * Real.log ‖z.1‖)
    (f : Flattening) :
    rogersImaginary (rogersOnFlattening li₂ f) = D f.shape +
      (f.w₀.re * f.w₁.im - f.w₀.im * f.w₁.re) / 2 := sorry

/-- On a kernel class, the imaginary regulator is the sum of the supplied Bloch–Wigner
values. This comparison is for classes with zero Dehn map, not individual symbols. -/
theorem extendedRogers_im (D : Shape → ℝ)
    (hD : ∀ z, D z = (li₂ z.1).im + Complex.arg (1 - z.1) * Real.log ‖z.1‖)
    (a : FreeFlattening) (ha : extendedDehn (classMap a) = 0) :
    rogersImaginary (extendedRogers li₂ hseries hderiv hlower (classMap a)) =
      FreeAbelianGroup.lift (fun f => D f.shape) a := by
  have _ := hD
  have _ := ha
  sorry

/-- Constructor tests use actual shapes, never a degenerate z=0 or z=1. -/
def halfShape : Shape := ⟨1 / 2, by norm_num, by norm_num⟩

-- rogers_normalizing_constant: the -π²/6 term leaves -π²/12 at z=1/2.
example (hhalf : li₂ (1 / 2) = (Real.pi : ℂ) ^ 2 / 12 -
    Complex.log (1 / 2) ^ 2 / 2) :
    rogersOnFlattening li₂ (chart halfShape 0 0) =
      rogersClass (-((Real.pi : ℂ) ^ 2 / 12)) := sorry

-- rogers_sheet_p: p ↦ p+2 adds +πi log(1-z), not its negative.
example (z : Shape) (p q : ℤ) :
    rogersChartRaw li₂ z (p + 2) q - rogersChartRaw li₂ z p q =
      Real.pi * Complex.I * Complex.log (1 - z.1) := by
  simp only [rogersChartRaw, Int.cast_add, Int.cast_ofNat]
  ring

example (z : Shape) (p q : ℤ) :
    rogersOnFlattening li₂ (chart z (p + 2) q) - rogersOnFlattening li₂ (chart z p q) =
      rogersClass (Real.pi * Complex.I * Complex.log (1 - z.1)) := sorry

-- rogers_not_plain_BlochWigner: nonzero real classes have imaginary part zero.
example : rogersClass (-((Real.pi : ℂ) ^ 2 / 12)) ≠ 0 ∧
    rogersImaginary (rogersClass (-((Real.pi : ℂ) ^ 2 / 12))) = 0 := sorry

-- rogers_period_control: π² dies but π²/2 survives.
example : rogersClass ((Real.pi : ℂ) ^ 2) = 0 := sorry
example : rogersClass ((Real.pi : ℂ) ^ 2 / 2) ≠ 0 := sorry

-- rogers_cut_negative: omitting q gives the wrong -qπ² period.
example (p q : ℤ) :
    rawRogers li₂ (cutUpper ⟨-1, by norm_num, by norm_num⟩, p, q) -
      rawRogers li₂ (cutLower ⟨-1, by norm_num, by norm_num⟩
        ⟨by norm_num, Or.inl (by norm_num)⟩, p + 2, q) =
      -(q : ℂ) * (Real.pi : ℂ) ^ 2 := sorry

-- rogers_cut_positive: retain the upper Li₂ correction and the +pπ² period.
example (p q : ℤ) :
    rawRogers li₂ (cutUpper ⟨2, by norm_num, by norm_num⟩, p, q) -
      rawRogers li₂ (cutLower ⟨2, by norm_num, by norm_num⟩
        ⟨by norm_num, Or.inr (by norm_num)⟩, p, q + 2) =
      (p : ℂ) * (Real.pi : ℂ) ^ 2 := sorry

-- rogers_transfer_chart
example (z : Shape) (p q p' q' : ℤ) :
    rogersOnFlattening li₂ (chart z p q) + rogersOnFlattening li₂ (chart z p' q') -
      rogersOnFlattening li₂ (chart z p q') - rogersOnFlattening li₂ (chart z p' q) = 0 := sorry

-- rogers_fiveTerm_class
example (f : Fin 5 → Flattening) (hf : LiftedFiveTerm f) :
    extendedRogers li₂ hseries hderiv hlower (classMap (fiveTermRelation f)) = 0 := by
  rw [lifted_five_term f hf, map_zero]

-- rogers_symbol_im_correction: D(1/2)=0 does not remove an odd-sheet correction.
example (hhalf : li₂ (1 / 2) = (Real.pi : ℂ) ^ 2 / 12 -
    Complex.log (1 / 2) ^ 2 / 2) :
    rogersImaginary (rogersOnFlattening li₂ (chart halfShape 1 0)) =
      Real.pi * Real.log (1 / 2) / 2 ∧
    rogersImaginary (rogersOnFlattening li₂ (chart halfShape 1 0)) ≠ 0 := sorry

end RogersRegulator

end ExtendedBloch


/-! QT.6: linear side of NZDatum. This structure intentionally has no manifold
claim. Face pairings, peripheral curves, full rank and strong flattenings are
part of the imported geometric datum and the definitive packet. -/
structure LinearNZData (n : ℕ) where
  A : Matrix (Fin n) (Fin n) ℤ
  B : Matrix (Fin n) (Fin n) ℤ
  ν : Fin n → ℤ
  z : Fin n → ℂ
  f : Fin n → ℤ
  fDoublePrime : Fin n → ℤ
  isotropic : A * B.transpose = B * A.transpose
  flattening : A.mulVec f + B.mulVec fDoublePrime = ν
  shape_ne_zero : ∀ i, z i ≠ 0
  shape_ne_one : ∀ i, z i ≠ 1
  gluing : ∀ i, (∏ j, z j ^ A i j * (1 - (z j)⁻¹) ^ B i j) = (-1 : ℂ) ^ ν i

/-- Algebraic formula underlying NZHessian. B invertibility remains explicit. -/
def linearNZHessian {n : ℕ} (A B : Matrix (Fin n) (Fin n) ℂ) (z : Fin n → ℂ) :=
  -(B⁻¹ * A) + Matrix.diagonal (fun j => 1 / (1 - z j))

theorem NZHessian_symmetric {n : ℕ} (A B : Matrix (Fin n) (Fin n) ℂ)
    (z : Fin n → ℂ) (hAB : A * B.transpose = B * A.transpose) (hB : B.det ≠ 0) :
    (linearNZHessian A B z).IsSymm := sorry

/-- Algebraic nondegeneracy, not a geometric certification. -/
def linearNZNonDegenerate {n : ℕ} (A B : Matrix (Fin n) (Fin n) ℂ) (z : Fin n → ℂ) : Prop :=
  B.det ≠ 0 ∧ (linearNZHessian A B z).det ≠ 0 ∧ ∀ j, z j ≠ 0 ∧ z j ≠ 1

-- NZ_singular_B
example {n : ℕ} (A B : Matrix (Fin n) (Fin n) ℂ) (z : Fin n → ℂ)
    (h : B.det = 0) : ¬ linearNZNonDegenerate A B z := sorry
-- NZ_degenerate_shape
example {n : ℕ} (A B : Matrix (Fin n) (Fin n) ℂ) (z : Fin n → ℂ)
    (j : Fin n) (h : z j = 1) : ¬ linearNZNonDegenerate A B z := sorry
-- NZ_hessian_one_variable
example : linearNZHessian (0 : Matrix (Fin 1) (Fin 1) ℂ) 1 (fun _ => 1/2) 0 0 = 2 := sorry

/-! A concrete real-b strip specialization of Faddeev's integral. Bochner
integrability is a theorem obligation: totality of integral does not establish
convergence. The complex meromorphic continuation is specified separately below. -/
def FaddeevStrip (b : ℝ) : Set ℂ := {z | |z.im| < (b + b⁻¹) / 2}
def AboveZeroOffset (b ε : ℝ) : Prop := 0 < ε ∧ ε < Real.pi * min b b⁻¹

def faddeevStripIntegrand (b ε : ℝ) (z : ℂ) (t : ℝ) : ℂ :=
  let w : ℂ := t + ε * Complex.I
  Complex.exp (-2 * Complex.I * z * w) /
    (4 * Complex.sinh ((b : ℂ) * w) * Complex.sinh (w / (b : ℂ)) * w)

def faddeevStripValue (b ε : ℝ) (z : ℂ) : ℂ :=
  Complex.exp (∫ t : ℝ, faddeevStripIntegrand b ε z t)

theorem faddeevStrip_integrable (b ε : ℝ) (z : ℂ) (hb : 0 < b)
    (hε : AboveZeroOffset b ε) (hz : z ∈ FaddeevStrip b) :
    Integrable (faddeevStripIntegrand b ε z) := sorry

theorem faddeevStrip_contour_independent (b ε η : ℝ) (z : ℂ) (hb : 0 < b)
    (hε : AboveZeroOffset b ε) (hη : AboveZeroOffset b η) (hz : z ∈ FaddeevStrip b) :
    faddeevStripValue b ε z = faddeevStripValue b η z := sorry

-- faddeevPhi_selfDual_b1 (strip version)
example (ε : ℝ) (z : ℂ) : faddeevStripValue 1 ε z = faddeevStripValue (1/1) ε z := sorry

/-! ## Meromorphic Faddeev function

AK, Definition 15, p. 9 and Appendix A, pp. 34–35, equations (42), (47)–(49).
The right half-plane includes the source's first-quadrant representatives and
is stable under reciprocal. Poles of a normal-form meromorphic function have
totalized value zero; divisor orders and punctured-neighborhood identities
retain their mathematical meaning.
-/

abbrev FaddeevParameter := {b : ℂ // 0 < b.re}

def faddeevCenter (b : FaddeevParameter) : ℂ :=
  Complex.I * (b.val + b.val⁻¹) / 2

def ComplexFaddeevStrip (b : FaddeevParameter) : Set ℂ :=
  {z | |z.im| < (b.val.re + b.val⁻¹.re) / 2}

def ComplexAboveZeroOffset (b : FaddeevParameter) (δ : ℝ) : Prop :=
  0 < δ ∧ δ < Real.pi * min b.val.re b.val⁻¹.re

def faddeevIntegrand (b : FaddeevParameter) (z w : ℂ) : ℂ :=
  Complex.exp (-2 * Complex.I * z * w) /
    (4 * Complex.sinh (b.val * w) * Complex.sinh (w / b.val) * w)

def faddeevContourValue (b : FaddeevParameter) (δ : ℝ) (z : ℂ) : ℂ :=
  Complex.exp (∫ t : ℝ, faddeevIntegrand b z (t + δ * Complex.I))

/-- A fully specified meromorphic continuation of the prescribed strip integral. -/
def IsFaddeevPhi (b : FaddeevParameter) (f : ℂ → ℂ) : Prop :=
  MeromorphicNFOn f Set.univ ∧
    ∀ z ∈ ComplexFaddeevStrip b, ∀ δ, ComplexAboveZeroOffset b δ →
      f z = faddeevContourValue b δ z

theorem faddeevContour_integrable (b : FaddeevParameter) (z : ℂ) (δ : ℝ)
    (hz : z ∈ ComplexFaddeevStrip b) (hδ : ComplexAboveZeroOffset b δ) :
    Integrable (fun t : ℝ => faddeevIntegrand b z (t + δ * Complex.I)) := by
  sorry

/-- Existence uses the two shifts; uniqueness uses analytic continuation and normal form. -/
theorem existsUnique_faddeevPhi (b : FaddeevParameter) :
    ∃! f : ℂ → ℂ, IsFaddeevPhi b f := by
  sorry

def faddeevPhi (b : FaddeevParameter) : ℂ → ℂ :=
  Classical.choose (existsUnique_faddeevPhi b).exists

theorem faddeevPhi_spec (b : FaddeevParameter) : IsFaddeevPhi b (faddeevPhi b) :=
  Classical.choose_spec (existsUnique_faddeevPhi b).exists

theorem faddeevPhi_meromorphic (b : FaddeevParameter) :
    MeromorphicNFOn (faddeevPhi b) Set.univ := (faddeevPhi_spec b).1

def reciprocalFaddeevParameter (b : FaddeevParameter) : FaddeevParameter :=
  ⟨b.val⁻¹, by sorry⟩

theorem faddeevPhi_selfDual (b : FaddeevParameter) (z : ℂ) :
    faddeevPhi b z = faddeevPhi (reciprocalFaddeevParameter b) z := by
  sorry

def faddeevZeroLattice (b : FaddeevParameter) (z : ℂ) : Set (ℕ × ℕ) :=
  {mn | z = -faddeevCenter b - (mn.1 : ℂ) * Complex.I * b.val -
    (mn.2 : ℂ) * Complex.I * b.val⁻¹}

def faddeevPoleLattice (b : FaddeevParameter) (z : ℂ) : Set (ℕ × ℕ) :=
  {mn | z = faddeevCenter b + (mn.1 : ℂ) * Complex.I * b.val +
    (mn.2 : ℂ) * Complex.I * b.val⁻¹}

theorem faddeevLattices_finite (b : FaddeevParameter) (z : ℂ) :
    (faddeevZeroLattice b z).Finite ∧ (faddeevPoleLattice b z).Finite := by
  sorry

theorem faddeevPhi_divisor (b : FaddeevParameter) (z : ℂ) :
    meromorphicOrderAt (faddeevPhi b) z =
      (((faddeevZeroLattice b z).ncard : ℤ) -
        ((faddeevPoleLattice b z).ncard : ℤ) : WithTop ℤ) := by
  sorry

/-- Both the b and reciprocal-b shifts are equalities of meromorphic germs. -/
theorem faddeevPhi_shift (b : FaddeevParameter) (a z : ℂ)
    (ha : a = b.val ∨ a = b.val⁻¹) :
    (fun w => faddeevPhi b (w - Complex.I * a / 2)) =ᶠ[𝓝[≠] z]
      (fun w => (1 + Complex.exp (2 * Real.pi * a * w)) *
        faddeevPhi b (w + Complex.I * a / 2)) := by
  sorry

def faddeevInversionConstant (b : FaddeevParameter) : ℂ :=
  Complex.exp (Complex.I * Real.pi * (1 + 2 * faddeevCenter b ^ 2) / 6)

theorem faddeevPhi_inversion (b : FaddeevParameter) (z : ℂ) :
    (fun w => faddeevPhi b w * faddeevPhi b (-w)) =ᶠ[𝓝[≠] z]
      (fun w => (faddeevInversionConstant b)⁻¹ *
        Complex.exp (Complex.I * Real.pi * w ^ 2)) := by
  sorry

/-- The two convergent products of AK (44), not a formal Pochhammer series. -/
def faddeevProductNumerator (b : FaddeevParameter) (z : ℂ) : ℂ :=
  ∏' n : ℕ, (1 - Complex.exp (2 * Real.pi * b.val * (z + faddeevCenter b)) *
    Complex.exp (2 * Real.pi * Complex.I * b.val ^ 2) ^ n)

def faddeevProductDenominator (b : FaddeevParameter) (z : ℂ) : ℂ :=
  ∏' n : ℕ, (1 - Complex.exp (2 * Real.pi * b.val⁻¹ * (z - faddeevCenter b)) *
    Complex.exp (-2 * Real.pi * Complex.I * b.val⁻¹ ^ 2) ^ n)

/-- Actual product convergence precedes use of the totalized `tprod`. -/
theorem faddeevProducts_multipliable (b : FaddeevParameter) (z : ℂ)
    (hb : 0 < (b.val ^ 2).im) :
    Multipliable (fun n : ℕ => 1 -
      Complex.exp (2 * Real.pi * b.val * (z + faddeevCenter b)) *
        Complex.exp (2 * Real.pi * Complex.I * b.val ^ 2) ^ n) ∧
    Multipliable (fun n : ℕ => 1 -
      Complex.exp (2 * Real.pi * b.val⁻¹ * (z - faddeevCenter b)) *
        Complex.exp (-2 * Real.pi * Complex.I * b.val⁻¹ ^ 2) ^ n) := by
  sorry

theorem faddeevPhi_product (b : FaddeevParameter) (z : ℂ)
    (hb : 0 < (b.val ^ 2).im) :
    faddeevPhi b =ᶠ[𝓝[≠] z]
      (fun w => faddeevProductNumerator b w / faddeevProductDenominator b w) := by
  sorry

/-- AK (49), for real b or |b|=1, interpreted at poles as a germ identity. -/
theorem faddeevPhi_unitarity (b : FaddeevParameter) (z : ℂ)
    (hb : b.val.im = 0 ∨ ‖b.val‖ = 1) :
    (fun w => star (faddeevPhi b w)) =ᶠ[𝓝[≠] z]
      (fun w => (faddeevPhi b (star w))⁻¹) := by
  sorry

-- faddeevPhi_zero_pole: orders distinguish points whose totalized values are both zero.
example (b : FaddeevParameter) :
    meromorphicOrderAt (faddeevPhi b) (-faddeevCenter b) = 1 ∧
      meromorphicOrderAt (faddeevPhi b) (faddeevCenter b) = -1 := by
  sorry

-- faddeevPhi_selfDual_b1
example (z : ℂ) :
    faddeevPhi ⟨1, by norm_num⟩ z =
      faddeevPhi (reciprocalFaddeevParameter ⟨1, by norm_num⟩) z := by
  sorry

-- Coincident lattice points at b=1 must be counted, rather than made simple.
example (k : ℕ) :
    meromorphicOrderAt (faddeevPhi ⟨1, by norm_num⟩)
      (-((k + 1 : ℕ) : ℂ) * Complex.I) = (k + 1 : WithTop ℤ) := by
  sorry

-- faddeevPhi_contour_prescription: the real-axis singularity has order three.
example (b : FaddeevParameter) (z : ℂ) :
    Filter.Tendsto (fun t : ℝ => (t : ℂ) ^ 3 * faddeevIntegrand b z t)
      (𝓝[≠] (0 : ℝ)) (𝓝 (1 / 4 : ℂ)) := by
  sorry

theorem faddeevPhi_contour_prescription (b : FaddeevParameter) (z : ℂ) :
    ¬ Integrable (fun t : ℝ => faddeevIntegrand b z t) := by
  sorry

/-- Compatibility of the concrete real strip interface with the meromorphic function. -/
theorem faddeevPhi_real_strip (b δ : ℝ) (hb : 0 < b) (z : ℂ)
    (hδ : AboveZeroOffset b δ) (hz : z ∈ FaddeevStrip b) :
    faddeevPhi ⟨(b : ℂ), by simpa using hb⟩ z = faddeevStripValue b δ z := by
  sorry

/-- AK's positive real b selects 0 < ℏ ≤ 1/4. -/
def AKhbar (b : ℝ) : ℝ := (b + b⁻¹) ^ (-2 : ℤ)

def analyticKnotIntegrand (n : ℕ) (b offset : ℝ) (z : ℂ) : ℂ :=
  (faddeevStripValue b offset (z / (2 * Real.pi * Real.sqrt (AKhbar b))))⁻¹ ^ n *
    Complex.exp (Complex.I * z ^ 2 / (4 * Real.pi * AKhbar b))

/-- Selected analyticStateIntegral g_n, with both contour parameters explicit. -/
def selectedIntegral (n : ℕ) (b offset ε : ℝ) : ℂ :=
  (2 * Real.pi * Real.sqrt (AKhbar b) : ℂ)⁻¹ *
    ∫ t : ℝ, analyticKnotIntegrand n b offset (t - ε * Complex.I)

theorem selectedIntegral_integrable (n : ℕ) (b offset ε : ℝ)
    (hn : 1 < n) (hb : 0 < b) (hb' : b ≤ 1)
    (ho : AboveZeroOffset b offset) (hε : 0 < ε) (hε' : ε < Real.pi) :
    Integrable (fun t : ℝ => analyticKnotIntegrand n b offset (t - ε * Complex.I)) := sorry

/-- Equality requires the pole-free strip and tails, not an arbitrary contour. -/
theorem selectedIntegral_contour_independent (n : ℕ) (b offset ε η : ℝ)
    (hn : 1 < n) (hb : 0 < b) (hb' : b ≤ 1) (ho : AboveZeroOffset b offset)
    (hε : 0 < ε) (hε' : ε < Real.pi) (hη : 0 < η) (hη' : η < Real.pi) :
    selectedIntegral n b offset ε = selectedIntegral n b offset η := sorry

/-! Real-parameter specialization of the charged AK kernel. All arguments of
faddeevStripValue in chargedPsi stay inside its defining strip. -/
structure AKCharges where
  a : ℝ
  c : ℝ
  a_pos : 0 < a
  c_pos : 0 < c
  remaining_pos : 0 < 1 / 2 - a - c

namespace AKCharges

def remaining (t : AKCharges) : ℝ := 1 / 2 - t.a - t.c

def cycle (t : AKCharges) : AKCharges where
  a := t.c
  c := t.remaining
  a_pos := t.c_pos
  c_pos := t.remaining_pos
  remaining_pos := by sorry

def regular : AKCharges where
  a := 1 / 6
  c := 1 / 6
  a_pos := by sorry
  c_pos := by sorry
  remaining_pos := by sorry

-- ak_regular_charges and chargedPsi_regular: the three normalized charges.
example : regular.a = 1 / 6 ∧ regular.c = 1 / 6 ∧ regular.remaining = 1 / 6 := sorry
-- chargedKernel_zero_charge: strict positivity is a real carrier condition.
example (t : AKCharges) : t.a ≠ 0 := sorry
end AKCharges

def AKcb (b : ℝ) : ℂ := Complex.I * ((b : ℂ) + (b : ℂ)⁻¹) / 2

def chargedPsi (b offset : ℝ) (t : AKCharges) (x : ℝ) : ℂ :=
  (faddeevStripValue b offset (x - 2 * AKcb b * (t.a + t.c)))⁻¹ *
    Complex.exp (-4 * Real.pi * Complex.I * AKcb b * t.a *
      (x - AKcb b * (t.a + t.c))) *
    Complex.exp (-Real.pi * Complex.I * AKcb b ^ 2 * (4 * (t.a - t.c) + 1) / 6)

def chargedPsiFourier (b offset : ℝ) (t : AKCharges) (x : ℝ) : ℂ :=
  ∫ y : ℝ, chargedPsi b offset t y * Complex.exp (-2 * Real.pi * Complex.I * x * y)

theorem chargedPsi_integrable (b offset : ℝ) (t : AKCharges)
    (hb : 0 < b) (ho : AboveZeroOffset b offset) :
    Integrable (chargedPsi b offset t) := sorry

/-- The Fourier phase is part of the charged kernel convention. -/
theorem chargedPsi_fourier (b offset : ℝ) (t : AKCharges) (x : ℝ)
    (hb : 0 < b) (ho : AboveZeroOffset b offset) :
    Complex.exp (-Real.pi * Complex.I * (x : ℂ) ^ 2) *
      chargedPsiFourier b offset t x =
        Complex.exp (-Real.pi * Complex.I / 12) * chargedPsi b offset t.cycle x := sorry

/-- Parametrize x₀+x₂−x₁=0 with Jacobian 1 in the integrated x₁ coordinate. -/
def chargedHyperplane (u : Fin 3 → ℝ) : Fin 4 → ℝ := ![u 0, u 0 + u 1, u 1, u 2]

def chargedKernelFactor (b offset : ℝ) (t : AKCharges) (x : Fin 4 → ℝ) : ℂ :=
  let y : ℝ := x 3 - x 2
  Complex.exp (-Real.pi * Complex.I * (y : ℂ) ^ 2) * chargedPsiFourier b offset t y *
    Complex.exp (2 * Real.pi * Complex.I * x 0 * y)

abbrev FaceTest := SchwartzMap (Fin 4 → ℝ) ℂ

def chargedKernelAction (b offset : ℝ) (t : AKCharges) (f : FaceTest) : ℂ :=
  ∫ u : Fin 3 → ℝ, chargedKernelFactor b offset t (chargedHyperplane u) *
    f (chargedHyperplane u)

/-- The two analytic hypotheses are explicit statements about this integral.
The AK convergence target discharges them; totality of integral does not.
No wavefront product or global gluing carrier is introduced here. -/
def chargedTetrahedronKernel (b offset : ℝ) (t : AKCharges)
    (hInt : ∀ f : FaceTest, Integrable (fun u : Fin 3 → ℝ =>
      chargedKernelFactor b offset t (chargedHyperplane u) * f (chargedHyperplane u)))
    (hCont : Continuous (chargedKernelAction b offset t)) :
    TemperedDistribution (Fin 4 → ℝ) ℂ :=
  ContinuousLinearMap.toPointwiseConvergenceCLM ℂ (RingHom.id ℂ) FaceTest ℂ
    { toFun := chargedKernelAction b offset t
      map_add' := by sorry
      map_smul' := by sorry
      cont := hCont }

-- chargedKernel_hyperplane: a test vanishing on the hyperplane has zero pairing.
example (b offset : ℝ) (t : AKCharges)
    (hInt : ∀ f : FaceTest, Integrable (fun u : Fin 3 → ℝ =>
      chargedKernelFactor b offset t (chargedHyperplane u) * f (chargedHyperplane u)))
    (hCont : Continuous (chargedKernelAction b offset t))
    (f : FaceTest) (hf : ∀ u, f (chargedHyperplane u) = 0) :
    chargedTetrahedronKernel b offset t hInt hCont f = 0 := sorry

/-- Distribution-valued level normalization; no invariant/functor assertion. -/
def akLevelNormalize {n : ℕ} (hbar level : ℝ)
    (Z : TemperedDistribution (Fin n → ℝ) ℂ) : TemperedDistribution (Fin n → ℝ) ℂ :=
  Complex.exp (Complex.I * Real.pi * level / (4 * hbar)) • Z

theorem akStateIntegral_levelShift {n : ℕ} (hbar level u : ℝ)
    (hh : 0 < hbar) (Z : TemperedDistribution (Fin n → ℝ) ℂ) :
    akLevelNormalize hbar (level + u) Z =
      Complex.exp (Complex.I * Real.pi * u / (4 * hbar)) • akLevelNormalize hbar level Z := sorry

-- ak_level_shift: the exact period of the level phase.
example {n : ℕ} (hbar level : ℝ) (hh : 0 < hbar)
    (Z : TemperedDistribution (Fin n → ℝ) ℂ) :
    akLevelNormalize hbar (level + 8 * hbar) Z = akLevelNormalize hbar level Z := sorry

/-! Finite root evaluations of QT.2 Kashaev and QT.7 descendants.
The integral Habiro carrier and its Taylor/evaluation maps are supplier imports. -/
def qPochC (q : ℂ) (k : ℕ) : ℂ := ∏ j ∈ range k, (1 - q ^ (j + 1))

def figureEightKashaev (x : ℚ) : ℝ :=
  ∑ k ∈ range x.den, ‖qPochC (Complex.exp (-2 * Real.pi * Complex.I * x)) k‖ ^ 2

theorem figureEightKashaev_periodic (x : ℚ) :
    figureEightKashaev (x + 1) = figureEightKashaev x := sorry

-- figureEightKashaev_small: GZ §1, p. 9, selected primitive roots.
theorem figureEightKashaev_small : figureEightKashaev (-1) = 1 ∧ figureEightKashaev (-1 / 2) = 5 ∧
    figureEightKashaev (-1 / 3) = 13 ∧ figureEightKashaev (-1 / 4) = 27 ∧
    figureEightKashaev (-1 / 5) = 46 + 2 * Real.sqrt 5 ∧
    figureEightKashaev (-1 / 6) = 89 := sorry

def figureEightDescendantAtRoot (m : ℤ) (N : ℕ) (q : ℂ) : ℂ :=
  ∑ k ∈ range N, qPochC q k * qPochC q⁻¹ k * q ^ (m * k)

-- descendant_root_one
example (m : ℤ) : figureEightDescendantAtRoot m 1 1 = 1 := sorry
-- descendant_root_minus_one
example (m : ℤ) : figureEightDescendantAtRoot m 2 (-1) = 1 + 4 * (-1 : ℂ) ^ m := sorry
-- descendant_root_three
example (q : ℂ) (hq : IsPrimitiveRoot q 3) : figureEightDescendantAtRoot 0 3 q = 13 := sorry

theorem figureEightDescendantAtRoot_recurrence (m : ℤ) (N : ℕ) (q : ℂ)
    (hN : 0 < N) (hq : IsPrimitiveRoot q N) :
    q ^ (m + 1) * figureEightDescendantAtRoot (m + 1) N q +
      (1 - 2 * q ^ m) * figureEightDescendantAtRoot m N q +
      q ^ (m - 1) * figureEightDescendantAtRoot (m - 1) N q = 1 := sorry

-- descendant_recurrence_root_one
example (m : ℤ) : figureEightDescendantAtRoot (m + 1) 1 1 -
    figureEightDescendantAtRoot m 1 1 + figureEightDescendantAtRoot (m - 1) 1 1 = 1 := sorry

/-! QT.7: the rational denominator cocycle and its explicit diagonal factor.
The volumes and weights are supplied representation data; these formulas do
not construct the representation-indexed knot matrices. GZ (arXiv:2111.06645v3),
§3.1, (3.5), Lemma 3.1, p. 16; §4.5, (4.14)–(4.15), p. 30. -/
abbrev SL₂ := Matrix.SpecialLinearGroup (Fin 2) ℤ

def rationalPoleFree (γ : SL₂) (x : ℚ) : Prop := (γ 1 0 : ℚ) * x + γ 1 1 ≠ 0

def rationalMobius (γ : SL₂) (x : ℚ) : ℚ :=
  ((γ 0 0 : ℚ) * x + γ 0 1) / ((γ 1 0 : ℚ) * x + γ 1 1)

def denominatorCocycle (γ : SL₂) (x : ℚ) : ℚ :=
  (γ 1 0 : ℚ) / ((x.den : ℚ) * ((γ 1 0 : ℚ) * x.num + (γ 1 1 : ℚ) * x.den))

private theorem rationalDenominator_mul (γ η : SL₂) (x : ℚ)
    (hη : rationalPoleFree η x) :
    ((γ 1 0 : ℚ) * rationalMobius η x + γ 1 1) *
      ((η 1 0 : ℚ) * x + η 1 1) = ((γ * η) 1 0 : ℚ) * x + (γ * η) 1 1 := by
  simp only [rationalMobius, Matrix.SpecialLinearGroup.coe_mul, Matrix.mul_apply,
    Fin.sum_univ_two, Int.cast_add, Int.cast_mul]
  unfold rationalPoleFree at hη
  rw [add_mul, mul_assoc, div_mul_cancel₀ _ hη]
  ring

theorem rationalPoleFree_mobius (γ η : SL₂) (x : ℚ)
    (hη : rationalPoleFree η x) (hγη : rationalPoleFree (γ * η) x) :
    rationalPoleFree γ (rationalMobius η x) := by
  unfold rationalPoleFree at hγη ⊢
  intro h
  have := rationalDenominator_mul γ η x hη
  rw [h, zero_mul] at this
  exact hγη this.symm

theorem rationalMobius_comp (γ η : SL₂) (x : ℚ)
    (hη : rationalPoleFree η x) (hγη : rationalPoleFree (γ * η) x) :
    rationalMobius (γ * η) x = rationalMobius γ (rationalMobius η x) := by
  have hg := rationalPoleFree_mobius γ η x hη hγη
  unfold rationalPoleFree at hη hγη hg
  simp only [rationalMobius, Matrix.SpecialLinearGroup.coe_mul, Matrix.mul_apply,
    Fin.sum_univ_two, Int.cast_add, Int.cast_mul] at *
  field_simp [hη]
  ring

/-- A primitive integer pair reduces only by a sign; squaring removes that sign. -/
private theorem primitive_den_sq (p q : ℤ) (hq : q ≠ 0) (hpq : IsCoprime p q) :
    (((p : ℚ) / q).den : ℚ) ^ 2 = (q : ℚ) ^ 2 := by
  obtain ⟨c, hn, hd⟩ := Rat.num_den_mk hq
    (show (p : ℚ) / q = Rat.divInt p q by rw [Rat.divInt_eq_div])
  rcases hpq with ⟨u, v, h⟩
  have hc : IsUnit c := isUnit_iff_dvd_one.mpr ⟨u * ((p : ℚ) / q).num +
    v * ((p : ℚ) / q).den, by linear_combination -h + u * hn + v * hd⟩
  rcases Int.isUnit_iff.mp hc with h | h
  · rw [h, one_mul] at hd
    exact_mod_cast congrArg (fun z : ℤ => z ^ (2 : ℕ)) hd.symm
  · rw [h, neg_one_mul] at hd
    have : (q : ℚ) = -(((p : ℚ) / q).den : ℚ) := by exact_mod_cast hd
    have hpow := congrArg (fun z : ℚ => z ^ (2 : ℕ)) this
    simpa only [neg_sq] using hpow.symm

private theorem denominatorCocycle_eq (γ : SL₂) (x : ℚ) :
    denominatorCocycle γ x =
      (γ 1 0 : ℚ) / ((x.den : ℚ) ^ 2 * ((γ 1 0 : ℚ) * x + γ 1 1)) := by
  have hs : (x.den : ℚ) ≠ 0 := by exact_mod_cast x.den_ne_zero
  have hx : (x.num : ℚ) = x * (x.den : ℚ) := by
    exact (div_eq_iff hs).mp x.num_div_den
  unfold denominatorCocycle
  rw [hx]
  congr 1
  ring

private theorem rationalMobius_den_sq (γ : SL₂) (x : ℚ)
    (hγ : rationalPoleFree γ x) :
    ((rationalMobius γ x).den : ℚ) ^ 2 =
      (x.den : ℚ) ^ 2 * ((γ 1 0 : ℚ) * x + γ 1 1) ^ 2 := by
  have hs : (x.den : ℚ) ≠ 0 := by exact_mod_cast x.den_ne_zero
  have hx : (x.num : ℚ) = x * (x.den : ℚ) := by
    exact (div_eq_iff hs).mp x.num_div_den
  have hden : ((γ 1 0 * x.num + γ 1 1 * x.den : ℤ) : ℚ) =
      ((γ 1 0 : ℚ) * x + γ 1 1) * (x.den : ℚ) := by
    push_cast
    rw [hx]
    ring
  have hq : γ 1 0 * x.num + γ 1 1 * x.den ≠ 0 := by
    intro hz
    have hz' : ((γ 1 0 * x.num + γ 1 1 * x.den : ℤ) : ℚ) = 0 := by exact_mod_cast hz
    rw [hden] at hz'
    exact mul_ne_zero hγ hs hz'
  have heq : rationalMobius γ x =
      ((γ 0 0 * x.num + γ 0 1 * x.den : ℤ) : ℚ) /
        ((γ 1 0 * x.num + γ 1 1 * x.den : ℤ) : ℚ) := by
    unfold rationalMobius
    calc
      _ = (((γ 0 0 : ℚ) * x + γ 0 1) * x.den) /
          (((γ 1 0 : ℚ) * x + γ 1 1) * x.den) :=
        (mul_div_mul_right _ _ hs).symm
      _ = _ := by
        congr 1 <;> push_cast <;> rw [hx] <;> ring
  have hc : IsCoprime (γ 0 0 * x.num + γ 0 1 * x.den)
      (γ 1 0 * x.num + γ 1 1 * x.den) := by
    simpa [Matrix.mulVec, dotProduct, Fin.sum_univ_two] using
      (x.isCoprime_num_den).mulVecSL (v := ![x.num, (x.den : ℤ)]) γ
  rw [heq, primitive_den_sq _ _ hq hc, hden, mul_pow]
  ring

theorem denominatorCocycle_comp (γ η : SL₂) (x : ℚ)
    (hη : rationalPoleFree η x) (hγη : rationalPoleFree (γ * η) x) :
    denominatorCocycle (γ * η) x =
      denominatorCocycle γ (rationalMobius η x) + denominatorCocycle η x := by
  have hs : (x.den : ℚ) ≠ 0 := by exact_mod_cast x.den_ne_zero
  have hd : (η 0 0 : ℚ) * η 1 1 - (η 0 1 : ℚ) * η 1 0 = 1 := by
    exact_mod_cast (show η 0 0 * η 1 1 - η 0 1 * η 1 0 = 1 by
      simpa only [Matrix.det_fin_two] using η.det_coe)
  simp only [denominatorCocycle_eq, rationalMobius_den_sq η x hη]
  have hh : (x.den : ℚ) ^ 2 * ((η 1 0 : ℚ) * x + η 1 1) ^ 2 *
      ((γ 1 0 : ℚ) * rationalMobius η x + γ 1 1) =
      (x.den : ℚ) ^ 2 * ((η 1 0 : ℚ) * x + η 1 1) *
        (((γ * η) 1 0 : ℚ) * x + (γ * η) 1 1) := by
    calc
      _ = (x.den : ℚ) ^ 2 * ((η 1 0 : ℚ) * x + η 1 1) *
          (((γ 1 0 : ℚ) * rationalMobius η x + γ 1 1) *
            ((η 1 0 : ℚ) * x + η 1 1)) := by ring
      _ = _ := by rw [rationalDenominator_mul γ η x hη]
  rw [hh]
  unfold rationalPoleFree at hη hγη
  simp only [Matrix.SpecialLinearGroup.coe_mul, Matrix.mul_apply,
    Fin.sum_univ_two, Int.cast_add, Int.cast_mul] at *
  field_simp [hs, hη, hγη]
  linear_combination (γ 1 0 : ℚ) * hd

theorem denominatorCocycle_neg (γ : SL₂) (x : ℚ) :
    denominatorCocycle (-γ) x = denominatorCocycle γ x := by
  simp only [denominatorCocycle, Matrix.SpecialLinearGroup.coe_neg, Matrix.neg_apply,
    Int.cast_neg, neg_mul, ← neg_add, mul_neg, neg_div_neg_eq]

-- lambda_T, lambda_S_one, lambda_S_zero, lambda_sign, and a denominator check.
example (x : ℚ) : denominatorCocycle ModularGroup.T x = 0 := by
  simp [denominatorCocycle, ModularGroup.T]

example : denominatorCocycle ModularGroup.S 1 = 1 := by
  norm_num [denominatorCocycle, ModularGroup.S]

example : ¬ rationalPoleFree ModularGroup.S 0 := by
  norm_num [rationalPoleFree, ModularGroup.S]

example : denominatorCocycle (-ModularGroup.S) (2 / 3) =
    denominatorCocycle ModularGroup.S (2 / 3) := denominatorCocycle_neg _ _

example : denominatorCocycle ModularGroup.S (2 / 3) = 1 / 6 := by
  norm_num [denominatorCocycle, ModularGroup.S]

/-- The entry exp(v λγ(x)) |cx+d|^κ. The real power uses a positive base
on the pole-free domain, so it introduces no complex logarithm branch.
In the knot application v = V/(2πi), and κ is 3/2 on the trivial representation
and zero on the other representations. -/
def tweakedAutomorphyEntry (v : ℂ) (κ : ℝ) (γ : SL₂) (x : ℚ) : ℂ :=
  Complex.exp (v * (denominatorCocycle γ x : ℂ)) *
    (Real.rpow |(γ 1 0 : ℝ) * (x : ℝ) + γ 1 1| κ : ℂ)

theorem tweakedAutomorphyEntry_ne_zero (v : ℂ) (κ : ℝ) (γ : SL₂) (x : ℚ)
    (hx : rationalPoleFree γ x) : tweakedAutomorphyEntry v κ γ x ≠ 0 := by
  change (γ 1 0 : ℚ) * x + γ 1 1 ≠ 0 at hx
  have hreal : (γ 1 0 : ℝ) * (x : ℝ) + γ 1 1 ≠ 0 := by exact_mod_cast hx
  apply mul_ne_zero (Complex.exp_ne_zero _)
  exact_mod_cast (ne_of_gt (Real.rpow_pos_of_pos (abs_pos.mpr hreal) κ))

theorem tweakedAutomorphyEntry_comp (v : ℂ) (κ : ℝ) (γ η : SL₂) (x : ℚ)
    (hη : rationalPoleFree η x) (hγη : rationalPoleFree (γ * η) x) :
    tweakedAutomorphyEntry v κ (γ * η) x =
      tweakedAutomorphyEntry v κ γ (rationalMobius η x) *
        tweakedAutomorphyEntry v κ η x := by
  have hr : ((γ 1 0 : ℝ) * (rationalMobius η x : ℝ) + γ 1 1) *
      ((η 1 0 : ℝ) * (x : ℝ) + η 1 1) =
      ((γ * η) 1 0 : ℝ) * (x : ℝ) + (γ * η) 1 1 := by
    exact_mod_cast rationalDenominator_mul γ η x hη
  have hp := Real.mul_rpow
    (abs_nonneg ((γ 1 0 : ℝ) * (rationalMobius η x : ℝ) + γ 1 1))
    (abs_nonneg ((η 1 0 : ℝ) * (x : ℝ) + η 1 1)) (z := κ)
  change Real.rpow (_ * _) κ = Real.rpow _ κ * Real.rpow _ κ at hp
  unfold tweakedAutomorphyEntry
  rw [denominatorCocycle_comp γ η x hη hγη, Rat.cast_add, mul_add, Complex.exp_add,
    ← hr, abs_mul, hp, Complex.ofReal_mul]
  ring

theorem tweakedAutomorphyEntry_neg (v : ℂ) (κ : ℝ) (γ : SL₂) (x : ℚ) :
    tweakedAutomorphyEntry v κ (-γ) x = tweakedAutomorphyEntry v κ γ x := by
  simp only [tweakedAutomorphyEntry, denominatorCocycle_neg,
    Matrix.SpecialLinearGroup.coe_neg, Matrix.neg_apply, Int.cast_neg,
    neg_mul, ← neg_add, abs_neg]

/-- The source's diagonal factor, with fixed volumes and weights across γ. -/
def tweakedAutomorphy {n : ℕ} (v : Fin n → ℂ) (κ : Fin n → ℝ)
    (γ : SL₂) (x : ℚ) : Matrix (Fin n) (Fin n) ℂ :=
  Matrix.diagonal fun i => tweakedAutomorphyEntry (v i) (κ i) γ x

theorem tweakedAutomorphy_comp {n : ℕ} (v : Fin n → ℂ) (κ : Fin n → ℝ)
    (γ η : SL₂) (x : ℚ)
    (hη : rationalPoleFree η x) (hγη : rationalPoleFree (γ * η) x) :
    tweakedAutomorphy v κ (γ * η) x =
      tweakedAutomorphy v κ γ (rationalMobius η x) * tweakedAutomorphy v κ η x := by
  simp only [tweakedAutomorphy, Matrix.diagonal_mul_diagonal]
  congr 1
  funext i
  exact tweakedAutomorphyEntry_comp (v i) (κ i) γ η x hη hγη

theorem tweakedAutomorphy_neg {n : ℕ} (v : Fin n → ℂ) (κ : Fin n → ℝ)
    (γ : SL₂) (x : ℚ) : tweakedAutomorphy v κ (-γ) x = tweakedAutomorphy v κ γ x := by
  simp only [tweakedAutomorphy, tweakedAutomorphyEntry_neg]

theorem tweakedAutomorphy_det_ne_zero {n : ℕ} (v : Fin n → ℂ) (κ : Fin n → ℝ)
    (γ : SL₂) (x : ℚ) (hx : rationalPoleFree γ x) :
    (tweakedAutomorphy v κ γ x).det ≠ 0 := by
  rw [tweakedAutomorphy, Matrix.det_diagonal]
  exact Finset.prod_ne_zero_iff.mpr (fun i _ => tweakedAutomorphyEntry_ne_zero (v i) (κ i) γ x hx)

def tweakedAutomorphyGL {n : ℕ} (v : Fin n → ℂ) (κ : Fin n → ℝ)
    (γ : SL₂) (x : ℚ) (hx : rationalPoleFree γ x) : Matrix.GeneralLinearGroup (Fin n) ℂ :=
  Matrix.GeneralLinearGroup.mkOfDetNeZero (tweakedAutomorphy v κ γ x)
    (tweakedAutomorphy_det_ne_zero v κ γ x hx)

theorem tweakedAutomorphyGL_coe {n : ℕ} (v : Fin n → ℂ) (κ : Fin n → ℝ)
    (γ : SL₂) (x : ℚ) (hx : rationalPoleFree γ x) :
    (tweakedAutomorphyGL v κ γ x hx : Matrix (Fin n) (Fin n) ℂ) =
      tweakedAutomorphy v κ γ x := rfl

theorem tweakedAutomorphyGL_comp {n : ℕ} (v : Fin n → ℂ) (κ : Fin n → ℝ)
    (γ η : SL₂) (x : ℚ)
    (hη : rationalPoleFree η x) (hγη : rationalPoleFree (γ * η) x) :
    tweakedAutomorphyGL v κ (γ * η) x hγη =
      tweakedAutomorphyGL v κ γ (rationalMobius η x) (rationalPoleFree_mobius γ η x hη hγη) *
        tweakedAutomorphyGL v κ η x hη := by
  apply Units.ext
  exact tweakedAutomorphy_comp v κ γ η x hη hγη

-- Translation has factor one; inversion at one retains the volume exponential.
example (v : ℂ) (κ : ℝ) (x : ℚ) : tweakedAutomorphyEntry v κ ModularGroup.T x = 1 := by
  simp [tweakedAutomorphyEntry, denominatorCocycle, ModularGroup.T]

example (v : ℂ) (κ : ℝ) : tweakedAutomorphyEntry v κ ModularGroup.S 1 = Complex.exp v := by
  norm_num [tweakedAutomorphyEntry, denominatorCocycle, ModularGroup.S]

-- The nonintegral input detects omission of den(x) in λ.
example (v : ℂ) : tweakedAutomorphyEntry v 0 ModularGroup.S (2 / 3) =
    Complex.exp (v / 6) := by
  norm_num [tweakedAutomorphyEntry, denominatorCocycle, ModularGroup.S, div_eq_mul_inv]

example (v : ℂ) (κ : ℝ) : tweakedAutomorphyEntry v κ (-ModularGroup.S) 1 =
    tweakedAutomorphyEntry v κ ModularGroup.S 1 := tweakedAutomorphyEntry_neg _ _ _ _

example {n : ℕ} (v : Fin n → ℂ) (κ : Fin n → ℝ) (x : ℚ) :
    tweakedAutomorphy v κ ModularGroup.T x = 1 := by
  simp [tweakedAutomorphy, tweakedAutomorphyEntry, denominatorCocycle, ModularGroup.T]

example {n : ℕ} (v : Fin n → ℂ) (κ : Fin n → ℝ) :
    tweakedAutomorphy v κ ModularGroup.S 1 = Matrix.diagonal (fun i => Complex.exp (v i)) := by
  norm_num [tweakedAutomorphy, tweakedAutomorphyEntry, denominatorCocycle, ModularGroup.S]

example {n : ℕ} (v : Fin n → ℂ) (κ : Fin n → ℝ) :
    tweakedAutomorphy v κ (-ModularGroup.S) 1 = tweakedAutomorphy v κ ModularGroup.S 1 :=
  tweakedAutomorphy_neg _ _ _ _

example {n : ℕ} (v : Fin n → ℂ) (κ : Fin n → ℝ) (x : ℚ)
    (hx : rationalPoleFree ModularGroup.T x) : tweakedAutomorphyGL v κ ModularGroup.T x hx = 1 := by
  apply Units.ext
  change tweakedAutomorphy v κ ModularGroup.T x = (1 : Matrix (Fin n) (Fin n) ℂ)
  simp [tweakedAutomorphy, tweakedAutomorphyEntry, denominatorCocycle, ModularGroup.T]

example {n : ℕ} (v : Fin n → ℂ) (κ : Fin n → ℝ)
    (hx : rationalPoleFree ModularGroup.S 1) :
    (tweakedAutomorphyGL v κ ModularGroup.S 1 hx : Matrix (Fin n) (Fin n) ℂ) =
      Matrix.diagonal (fun i => Complex.exp (v i)) := by
  rw [tweakedAutomorphyGL_coe v κ ModularGroup.S 1 hx]
  norm_num [tweakedAutomorphy, tweakedAutomorphyEntry, denominatorCocycle, ModularGroup.S]

-- Conditional ordered transport identity; the generic interface is requested from QM.5.
def matrixTransport {n : ℕ} (J : ℚ → Matrix.GeneralLinearGroup (Fin n) ℂ)
    (j : SL₂ → ℚ → Matrix.GeneralLinearGroup (Fin n) ℂ) (γ : SL₂) (x : ℚ) :=
  (J (rationalMobius γ x))⁻¹ * j γ x * J x

theorem matrixTransport_comp {n : ℕ} (J : ℚ → Matrix.GeneralLinearGroup (Fin n) ℂ)
    (j : SL₂ → ℚ → Matrix.GeneralLinearGroup (Fin n) ℂ) (γ η : SL₂) (x : ℚ)
    (hη : rationalPoleFree η x) (hγη : rationalPoleFree (γ * η) x)
    (hj : j (γ * η) x = j γ (rationalMobius η x) * j η x) :
    matrixTransport J j (γ * η) x =
      matrixTransport J j γ (rationalMobius η x) * matrixTransport J j η x := by
  simp only [matrixTransport, rationalMobius_comp γ η x hη hγη, hj]
  simp only [mul_assoc, mul_inv_cancel_left]

-- matrixCocycle_constant: the formula preserves the identity factor.
example {n : ℕ} (γ : SL₂) (x : ℚ) :
    matrixTransport (fun _ => (1 : Matrix.GeneralLinearGroup (Fin n) ℂ))
      (fun _ _ => 1) γ x = 1 := by
  simp [matrixTransport]

-- Invertible test matrices for the conditional transport formula, not knot data.
private def orderUpper : Matrix.GeneralLinearGroup (Fin 2) ℂ where
  val := !![1, 1; 0, 1]
  inv := !![1, -1; 0, 1]
  val_inv := by
    ext i j
    fin_cases i <;> fin_cases j <;> norm_num [Matrix.mul_apply, Fin.sum_univ_two]
  inv_val := by
    ext i j
    fin_cases i <;> fin_cases j <;> norm_num [Matrix.mul_apply, Fin.sum_univ_two]

private def orderLower : Matrix.GeneralLinearGroup (Fin 2) ℂ where
  val := !![1, 0; 1, 1]
  inv := !![1, 0; -1, 1]
  val_inv := by
    ext i j
    fin_cases i <;> fin_cases j <;> norm_num [Matrix.mul_apply, Fin.sum_univ_two]
  inv_val := by
    ext i j
    fin_cases i <;> fin_cases j <;> norm_num [Matrix.mul_apply, Fin.sum_univ_two]

private def orderJ (x : ℚ) : Matrix.GeneralLinearGroup (Fin 2) ℂ :=
  if x = 2 then orderUpper else if x = 1 then orderLower else 1

-- matrixCocycle_noncommutative_order: even j=I can yield noncommuting W factors.
example :
    matrixTransport orderJ (fun _ _ => 1) (ModularGroup.S * ModularGroup.T) 1 =
      matrixTransport orderJ (fun _ _ => 1) ModularGroup.S
          (rationalMobius ModularGroup.T 1) *
        matrixTransport orderJ (fun _ _ => 1) ModularGroup.T 1 ∧
    matrixTransport orderJ (fun _ _ => 1) (ModularGroup.S * ModularGroup.T) 1 ≠
      matrixTransport orderJ (fun _ _ => 1) ModularGroup.T 1 *
        matrixTransport orderJ (fun _ _ => 1) ModularGroup.S
          (rationalMobius ModularGroup.T 1) := by
  constructor
  · exact matrixTransport_comp _ _ _ _ _
      (by norm_num [rationalPoleFree, ModularGroup.T])
      (by
        simp only [rationalPoleFree, Matrix.SpecialLinearGroup.coe_mul,
          Matrix.mul_apply, Fin.sum_univ_two]
        norm_num [ModularGroup.S, ModularGroup.T])
      (by simp)
  · intro h
    have hh := congrArg
      (fun g : Matrix.GeneralLinearGroup (Fin 2) ℂ => (g : Matrix (Fin 2) (Fin 2) ℂ) 0 0) h
    simp only [matrixTransport, rationalMobius, Matrix.SpecialLinearGroup.coe_mul,
      Matrix.mul_apply, Fin.sum_univ_two] at hh
    norm_num [orderJ, ModularGroup.S, ModularGroup.T, Units.val_mul, orderUpper, orderLower,
      Matrix.mul_apply, Fin.sum_univ_two] at hh

-- matrixCocycle_singular_J: a zero determinant cannot enter a GL-valued J.
example : ¬ ∃ g : Matrix.GeneralLinearGroup (Fin 2) ℂ,
    (g : Matrix (Fin 2) (Fin 2) ℂ) = !![1, 1; 0, 0] := by
  rintro ⟨g, hg⟩
  have hdet := Matrix.GeneralLinearGroup.det_ne_zero g
  rw [hg] at hdet
  norm_num [Matrix.det_fin_two] at hdet

/-! QT.7: the scalar all-orders criterion, GZ v3 (1.5)–(1.6), pp. 10–11,
and (3.6)–(3.8), p. 16. The inputs are supplied knot values, complex-volume
representatives and the geometric formal series, rather than newly asserted
knot invariants. These concrete predicates specify conjectures; no theorem
asserts them for arbitrary data or for a knot whose comparison is missing.
Only finite PowerSeries.trunc polynomials are evaluated. -/

/-- The geometric expansion parameter for a positive-c modular transformation. -/
def qmcParameter (γ : SL₂) (x : ℚ) : ℂ :=
  2 * Real.pi * Complex.I /
    ((γ 1 0 : ℂ) * ((γ 1 0 : ℂ) * (x : ℂ) + γ 1 1))

/-- Evaluate the first M coefficients, with no convergence assumption on φ. -/
def qmcTruncation (φ : PowerSeries ℂ) (M : ℕ) (h : ℂ) : ℂ :=
  (PowerSeries.trunc M φ).eval h

/-- The complete scale multiplying J(X) in the generalized scalar conjecture.
v is the selected representation's normalized volume; V is the geometric
complex-volume representative. The supplied φ carries the one-loop factor. -/
def qmcScale (γ : SL₂) (κ : ℝ) (v V : ℂ) (x : ℚ) : ℂ :=
  tweakedAutomorphyEntry v κ γ x *
    Complex.exp (V / (((((γ 0 0 : ℚ) / γ 1 0).den : ℂ) ^ 2) * qmcParameter γ x))

/-- GZ GQMC, as a precise property of supplied knot-specific scalar data.
The positive-c hypothesis is part of the property. For each positive denominator
bound B and each truncation M, a single Big-O constant works for all sufficiently
large rationals of denominator at most B. The comparison includes the full
exponential and J(X), so it never divides by a possibly zero knot value. -/
def generalized_quantum_modularity (J : ℚ → ℂ) (γ : SL₂) (κ : ℝ)
    (v V : ℂ) (φ : PowerSeries ℂ) : Prop :=
  0 < γ 1 0 ∧ ∀ (B : ℕ), 0 < B → ∀ (M : ℕ),
    Asymptotics.IsBigO
      (Filter.atTop ⊓ Filter.principal {x : ℚ | x.den ≤ B})
      (fun x => J (rationalMobius γ x) -
        qmcScale γ κ v V x * J x * qmcTruncation φ M (qmcParameter γ x))
      (fun x => qmcScale γ κ v V x * J x * qmcParameter γ x ^ M)

/-- The original conjecture is precisely the trivial-row weight 3/2 and v=0. -/
def the_quantum_modularity_conjecture (J : ℚ → ℂ) (γ : SL₂)
    (V : ℂ) (φ : PowerSeries ℂ) : Prop :=
  generalized_quantum_modularity J γ (3 / 2) 0 V φ

theorem qmcTruncation_eq_sum (φ : PowerSeries ℂ) (M : ℕ) (h : ℂ) :
    qmcTruncation φ M h = ∑ n ∈ range M, PowerSeries.coeff n φ * h ^ n := by
  sorry

theorem qmcTruncation_succ (φ : PowerSeries ℂ) (M : ℕ) (h : ℂ) :
    qmcTruncation φ (M + 1) h =
      qmcTruncation φ M h + PowerSeries.coeff M φ * h ^ M := by
  sorry

/-- Determinant one ensures that a/c is reduced when c>0. -/
theorem qmcCusp_den (γ : SL₂) (hγ : 0 < γ 1 0) :
    ((γ 0 0 : ℚ) / γ 1 0).den = (γ 1 0).natAbs := by
  sorry

theorem qmcParameter_ne_zero (γ : SL₂) (x : ℚ)
    (hγ : 0 < γ 1 0) (hx : rationalPoleFree γ x) : qmcParameter γ x ≠ 0 := by
  sorry

theorem qmcParameter_tendsto_zero (γ : SL₂) (hγ : 0 < γ 1 0) :
    Filter.Tendsto (qmcParameter γ) Filter.atTop (𝓝 0) := by
  sorry

/-- A positive denominator bound includes arbitrarily large integers. -/
theorem qmc_bounded_denominator_neBot (B : ℕ) (hB : 0 < B) :
    Filter.NeBot (Filter.atTop ⊓ Filter.principal {x : ℚ | x.den ≤ B}) := by
  sorry

/-- Totalized division at the single pole never contributes to the limit. -/
theorem qmc_positive_denominator_eventually (γ : SL₂) (hγ : 0 < γ 1 0) :
    ∀ᶠ x : ℚ in Filter.atTop, 0 < (γ 1 0 : ℚ) * x + γ 1 1 := by
  sorry

theorem qmcScale_ne_zero (γ : SL₂) (κ : ℝ) (v V : ℂ) (x : ℚ)
    (hx : rationalPoleFree γ x) : qmcScale γ κ v V x ≠ 0 := by
  sorry

/-- Make the order of quantifiers, and hence the uniformity, explicit. -/
theorem generalized_quantum_modularity_iff_bound (J : ℚ → ℂ) (γ : SL₂)
    (κ : ℝ) (v V : ℂ) (φ : PowerSeries ℂ) :
    generalized_quantum_modularity J γ κ v V φ ↔
      0 < γ 1 0 ∧ ∀ (B : ℕ), 0 < B → ∀ (M : ℕ),
        ∃ C : ℝ, 0 < C ∧ ∃ N : ℚ, ∀ x : ℚ, N ≤ x → x.den ≤ B →
          ‖J (rationalMobius γ x) -
            qmcScale γ κ v V x * J x * qmcTruncation φ M (qmcParameter γ x)‖ ≤
          C * ‖qmcScale γ κ v V x * J x * qmcParameter γ x ^ M‖ := by
  sorry

/-- Ratio notation is justified only with eventual nonvanishing of J. -/
theorem generalized_quantum_modularity_iff_ratio (J : ℚ → ℂ) (γ : SL₂)
    (κ : ℝ) (v V : ℂ) (φ : PowerSeries ℂ) (hγ : 0 < γ 1 0)
    (hJ : ∀ (B : ℕ), 0 < B →
      ∀ᶠ x : ℚ in Filter.atTop ⊓ Filter.principal {x : ℚ | x.den ≤ B}, J x ≠ 0) :
    generalized_quantum_modularity J γ κ v V φ ↔
      ∀ (B : ℕ), 0 < B → ∀ (M : ℕ),
        Asymptotics.IsBigO
          (Filter.atTop ⊓ Filter.principal {x : ℚ | x.den ≤ B})
          (fun x => J (rationalMobius γ x) / (qmcScale γ κ v V x * J x) -
            qmcTruncation φ M (qmcParameter γ x))
          (fun x => qmcParameter γ x ^ M) := by
  sorry

/-- All-orders expansions determine the formal series on a nonvanishing row. -/
theorem qmc_series_unique (J : ℚ → ℂ) (γ : SL₂) (κ : ℝ) (v V : ℂ)
    (φ ψ : PowerSeries ℂ)
    (hJ : ∀ᶠ x : ℚ in Filter.atTop ⊓ Filter.principal {x : ℚ | x.den ≤ 1}, J x ≠ 0)
    (hφ : generalized_quantum_modularity J γ κ v V φ)
    (hψ : generalized_quantum_modularity J γ κ v V ψ) : φ = ψ := by
  sorry

theorem qmc_trivial_row (J : ℚ → ℂ) (γ : SL₂) (V : ℂ) (φ : PowerSeries ℂ) :
    the_quantum_modularity_conjecture J γ V φ ↔
      generalized_quantum_modularity J γ (3 / 2) 0 V φ := Iff.rfl

-- qmcParameter_S_one
example : qmcParameter ModularGroup.S 1 = 2 * Real.pi * Complex.I := by
  sorry
-- qmcParameter_S_two
example : qmcParameter ModularGroup.S 2 = Real.pi * Complex.I := by
  sorry
-- qmcParameter_sign
example (γ : SL₂) (x : ℚ) : qmcParameter (-γ) x = qmcParameter γ x := by
  sorry

-- qmcTruncation_empty
example (φ : PowerSeries ℂ) (h : ℂ) : qmcTruncation φ 0 h = 0 := by
  sorry
-- qmcTruncation_constant
example (φ : PowerSeries ℂ) (h : ℂ) :
    qmcTruncation φ 1 h = PowerSeries.coeff 0 φ := by
  sorry
-- qmcTruncation_divergent_series: factorial coefficients require no infinite evaluation.
example (h : ℂ) : qmcTruncation (PowerSeries.mk fun n => (n.factorial : ℂ)) 4 h =
    1 + h + 2 * h ^ 2 + 6 * h ^ 3 := by
  sorry

-- qmcScale_original_S: the source exponential, without an extra denominator factor.
example (V : ℂ) (x : ℚ) (hx : 0 < x) :
    qmcScale ModularGroup.S (3 / 2) 0 V x =
      (Real.rpow (x : ℝ) (3 / 2) : ℂ) *
        Complex.exp (V * (x : ℂ) / (2 * Real.pi * Complex.I)) := by
  sorry
-- qmcScale_nontrivial_row: weight zero still retains the representation twist.
example (v V : ℂ) : qmcScale ModularGroup.S 0 v V 1 =
    Complex.exp v * Complex.exp (V / (2 * Real.pi * Complex.I)) := by
  sorry
-- qmcScale_zero_volume: no exponential remains when both volumes vanish.
example (x : ℚ) (hx : x ≠ 0) : qmcScale ModularGroup.S 0 0 0 x = 1 := by
  sorry

-- qmc_bound_one: this restriction keeps exactly the integers.
example (x : ℚ) : x.den ≤ 1 ↔ ∃ n : ℤ, x = n := by
  sorry
-- qmc_bound_zero: exclude the vacuous bottom filter from the conjecture.
example : (Filter.atTop ⊓ Filter.principal {x : ℚ | x.den ≤ 0}) = ⊥ := by
  sorry
-- qmc_wrong_order: a nonzero constant error is not O(h) even along integers.
example : ¬ Asymptotics.IsBigO
    (Filter.atTop ⊓ Filter.principal {x : ℚ | x.den ≤ 1})
    (fun _ : ℚ => (1 : ℂ)) (qmcParameter ModularGroup.S) := by
  sorry
-- qmc_zero_row: nonvanishing is necessary for the uniqueness API.
example (γ : SL₂) (κ : ℝ) (v V : ℂ) (φ : PowerSeries ℂ) (hγ : 0 < γ 1 0) :
    generalized_quantum_modularity (fun _ => 0) γ κ v V φ := by
  sorry
-- qmc_translation_excluded: T has c=0 and is outside this expansion domain.
example (J : ℚ → ℂ) (κ : ℝ) (v V : ℂ) (φ : PowerSeries ℂ) :
    ¬ generalized_quantum_modularity J ModularGroup.T κ v V φ := by
  sorry
-- qmc_original_translation_excluded
example (J : ℚ → ℂ) (V : ℂ) (φ : PowerSeries ℂ) :
    ¬ the_quantum_modularity_conjecture J ModularGroup.T V φ := by
  sorry
-- qmc_original_zero_row
example (γ : SL₂) (V : ℂ) (φ : PowerSeries ℂ) (hγ : 0 < γ 1 0) :
    the_quantum_modularity_conjecture (fun _ => 0) γ V φ := by
  sorry
-- qmc_original_trivial_weight: original and generalized criteria coincide exactly.
example (J : ℚ → ℂ) (γ : SL₂) (V : ℂ) (φ : PowerSeries ℂ) :
    the_quantum_modularity_conjecture J γ V φ =
      generalized_quantum_modularity J γ (3 / 2) 0 V φ := rfl

inductive Provenance where
  | proved | imported | computed | numerical | conjectural
  deriving DecidableEq

inductive LedgerColumn where
  | cyclotomicCoefficients | kashaevValues | invariantsAtRootsOfUnity
  | traceFieldAndBlochClasses | volumeAndChernSimons | asymptoticSeries
  deriving DecidableEq

/-- Bibliographic data, not a replacement for a geometric or arithmetic carrier.
`proved` denotes a source theorem, not a Lean proof of the recorded text. -/
structure LedgerEntry where
  column : LedgerColumn
  output : String
  datum : String
  node : String
  status : Provenance
  root : String
  normalization : String
  representation : String
  shapeField : String
  source : String
  locator : String
  domain : String

abbrev Ledger := List (String × List LedgerEntry)

def ledgerColumns : List LedgerColumn :=
  [.cyclotomicCoefficients, .kashaevValues, .invariantsAtRootsOfUnity,
    .traceFieldAndBlochClasses, .volumeAndChernSimons, .asymptoticSeries]

/-- Source-specific entries. An empty cell denotes no supplied checked output;
it never asserts vanishing or agreement with another column. -/
def ledgerRows : Ledger := [
  ("4₁", [
    { column := .cyclotomicCoefficients,
      output := "product-basis coefficients",
      datum := "all coefficients 1 in Σ (q⁻¹;q⁻¹)ₙ(q;q)ₙ",
      node := "ArithmeticQuantumTopology:QT.6/the-kashaev-invariant-and-the-function-on-the-rationals",
      status := .computed,
      root := "q formal",
      normalization := "GZ Habiro product basis; not coefficients of (q;q)ₙ alone",
      representation := "trivial",
      shapeField := "Q",
      source := "https://arxiv.org/abs/2111.06645v3",
      locator := "§2.2, (2.6), p. 13",
      domain := "cyclotomic completion; finite truncation at a root" },
    { column := .kashaevValues,
      output := "orders 1–6",
      datum := "1,5,13,27,46+2√5,89",
      node := "ArithmeticQuantumTopology:QT.6/the-kashaev-invariant-and-the-function-on-the-rationals",
      status := .computed,
      root := "q=exp(−2πi/N), N=1,…,6",
      normalization := "Σ |(q;q)ₙ|²",
      representation := "trivial",
      shapeField := "Q(√5) for the order-five value",
      source := "https://arxiv.org/abs/2111.06645v3",
      locator := "§1, (1.2), p. 9",
      domain := "selected primitive roots; other order-five embedding gives 46−2√5" },
    { column := .invariantsAtRootsOfUnity,
      output := "Q₁ root row",
      datum := "1,5,13,27,44−4q²−4q³,89",
      node := "ArithmeticQuantumTopology:QT.7/figure-eight-habiro-descendants",
      status := .computed,
      root := "q=exp(2πix), den(x)=1,…,6",
      normalization := "Q₁=J; product of two finite q-factorials",
      representation := "trivial first column",
      shapeField := "Q(q)",
      source := "https://arxiv.org/abs/2111.06645v3",
      locator := "§4.3, p. 26",
      domain := "primitive roots; order-five polynomial retains the embedding" },
    { column := .traceFieldAndBlochClasses,
      output := "ordinary class",
      datum := "Q(√−3), 2[exp(πi/3)]",
      node := "ArithmeticQuantumTopology:QT.5/number-field-geometric-bloch-class",
      status := .computed,
      root := "shape exp(πi/3)",
      normalization := "ordinary Bloch convention; no torsion lift asserted",
      representation := "geometric",
      shapeField := "Q(√−3)",
      source := "https://arxiv.org/abs/2111.06645v3",
      locator := "§1, (1.3), p. 10",
      domain := "complete geometric solution" },
    { column := .volumeAndChernSimons,
      output := "g2 decay limit",
      datum := "lim 2πℏ log |g2| = −Vol(S³∖4₁)",
      node := "ArithmeticQuantumTopology:QT.6/selected-state-integral-volume",
      status := .proved,
      root := "not a root evaluation; ℏ=(b+b⁻¹)⁻²",
      normalization := "AK contour-selected integral; decay sign",
      representation := "selected geometric saddle",
      shapeField := "selected complex shape field",
      source := "https://arxiv.org/abs/1109.6295v2",
      locator := "Theorem 5, p. 11; §12, pp. 32–34",
      domain := "b→0+; contour, nondegenerate saddle and phase as in AK" },
    { column := .asymptoticSeries,
      output := "nondegenerate geometric formal series",
      datum := "GSW normalized unit series",
      node := "ArithmeticQuantumTopology:QT.6/formal-state-integral-invariance",
      status := .proved,
      root := "formal ℏ at the complete solution",
      normalization := "formal Gaussian bracket; not analytic remainder estimates",
      representation := "discrete faithful",
      shapeField := "invariant trace field",
      source := "https://arxiv.org/abs/2305.14884v2",
      locator := "Theorem 1.1, p. 4; §2.3, pp. 8–9",
      domain := "complete cusped hyperbolic manifold; regular nondegenerate refinements" },
    { column := .asymptoticSeries,
      output := "BD selected modular theorem",
      datum := "all-orders bounded-denominator asymptotics",
      node := "ArithmeticQuantumTopology:QT.7/bettin-drappeau-proved-cases",
      status := .proved,
      root := "q=exp(2πix), x rational",
      normalization := "BD positive-q, principal logarithms; no negative-q comparison assumed",
      representation := "selected hyperbolic knot",
      shapeField := "Q(√−3)",
      source := "https://arxiv.org/abs/1905.02045v2",
      locator := "Theorem 1, pp. 2–3",
      domain := "x→+∞ of bounded denominator; γ∞ finite; source phase and constants" },
    { column := .asymptoticSeries,
      output := "general matrix RQMC",
      datum := "conjectural all-orders matrix refinement",
      node := "ArithmeticQuantumTopology:QT.7/matrix-refined-quantum-modularity",
      status := .conjectural,
      root := "rational X and formal h",
      normalization := "row weights require scalar/matrix sign reconciliation",
      representation := "representation-indexed matrix",
      shapeField := "representation fields",
      source := "https://arxiv.org/abs/2111.06645v3",
      locator := "§4.5, (4.12)–(4.14), pp. 28–30",
      domain := "c>0; bounded denominator; matrix and exponential-ordering hypotheses" },
    { column := .asymptoticSeries,
      output := "general cocycle analyticity",
      datum := "conjectural extension across the cut",
      node := "ArithmeticQuantumTopology:QT.7/cocycle-analytic-extension",
      status := .conjectural,
      root := "x in the pole-free cut plane",
      normalization := "ordered matrix cocycle with its stated factors",
      representation := "representation-indexed matrix",
      shapeField := "representation fields",
      source := "https://arxiv.org/abs/2111.06645v3",
      locator := "§5.2, Conjecture 5.1, pp. 34–35; conditional Proposition 5.2, p. 36",
      domain := "selected numerical examples do not establish general analyticity" }]),
  ("5₂", [
    { column := .volumeAndChernSimons,
      output := "g3 decay limit",
      datum := "lim 2πℏ log |g3| = −Vol(S³∖5₂)",
      node := "ArithmeticQuantumTopology:QT.6/selected-state-integral-volume",
      status := .proved,
      root := "not a root evaluation; ℏ=(b+b⁻¹)⁻²",
      normalization := "AK contour-selected integral; decay sign",
      representation := "selected geometric saddle",
      shapeField := "selected complex shape field",
      source := "https://arxiv.org/abs/1109.6295v2",
      locator := "Theorem 5, p. 11; §12, pp. 32–34",
      domain := "b→0+; contour, nondegenerate saddle and phase as in AK" },
    { column := .asymptoticSeries,
      output := "nondegenerate geometric formal series",
      datum := "GSW normalized unit series",
      node := "ArithmeticQuantumTopology:QT.6/formal-state-integral-invariance",
      status := .proved,
      root := "formal ℏ at the complete solution",
      normalization := "formal Gaussian bracket; not analytic remainder estimates",
      representation := "discrete faithful",
      shapeField := "invariant trace field",
      source := "https://arxiv.org/abs/2305.14884v2",
      locator := "Theorem 1.1, p. 4; §2.3, pp. 8–9",
      domain := "complete cusped hyperbolic manifold; regular nondegenerate refinements" },
    { column := .asymptoticSeries,
      output := "BD selected modular theorem",
      datum := "all-orders bounded-denominator asymptotics",
      node := "ArithmeticQuantumTopology:QT.7/bettin-drappeau-proved-cases",
      status := .proved,
      root := "q=exp(2πix), x rational",
      normalization := "BD positive-q, principal logarithms; no negative-q comparison assumed",
      representation := "selected hyperbolic knot",
      shapeField := "Q(τ), τ³−τ+1=0, Im τ>0",
      source := "https://arxiv.org/abs/1905.02045v2",
      locator := "Theorem 1, pp. 2–3",
      domain := "x→+∞ of bounded denominator; γ∞ finite; source phase and constants" },
    { column := .asymptoticSeries,
      output := "general matrix RQMC",
      datum := "conjectural all-orders matrix refinement",
      node := "ArithmeticQuantumTopology:QT.7/matrix-refined-quantum-modularity",
      status := .conjectural,
      root := "rational X and formal h",
      normalization := "row weights require scalar/matrix sign reconciliation",
      representation := "representation-indexed matrix",
      shapeField := "representation fields",
      source := "https://arxiv.org/abs/2111.06645v3",
      locator := "§4.5, (4.12)–(4.14), pp. 28–30",
      domain := "c>0; bounded denominator; matrix and exponential-ordering hypotheses" },
    { column := .asymptoticSeries,
      output := "general cocycle analyticity",
      datum := "conjectural extension across the cut",
      node := "ArithmeticQuantumTopology:QT.7/cocycle-analytic-extension",
      status := .conjectural,
      root := "x in the pole-free cut plane",
      normalization := "ordered matrix cocycle with its stated factors",
      representation := "representation-indexed matrix",
      shapeField := "representation fields",
      source := "https://arxiv.org/abs/2111.06645v3",
      locator := "§5.2, Conjecture 5.1, pp. 34–35; conditional Proposition 5.2, p. 36",
      domain := "selected numerical examples do not establish general analyticity" },
    { column := .kashaevValues,
      output := "orders 1 and 2",
      datum := "1,13 from the double finite sum",
      node := "ArithmeticQuantumTopology:QT.6/the-kashaev-invariant-and-the-function-on-the-rationals",
      status := .computed,
      root := "q=exp(2πix); den(x)=1 or 2",
      normalization := "GZ (A.2); q times this sum is the cited colored Jones value",
      representation := "trivial",
      shapeField := "Q",
      source := "https://arxiv.org/abs/2111.06645v3",
      locator := "Appendix A.3, (A.2), pp. 78–79",
      domain := "positive-q formula; the extra q factor is retained" },
    { column := .invariantsAtRootsOfUnity,
      output := "finite root formula",
      datum := "Σₘ<N Σₖ≤ₘ q⁻⁽ᵐ⁺¹⁾ᵏ(q;q)ₘ²(q⁻¹;q⁻¹)ₖ",
      node := "ArithmeticQuantumTopology:QT.6/the-kashaev-invariant-and-the-function-on-the-rationals",
      status := .computed,
      root := "q primitive of order N>0",
      normalization := "GZ (A.2), before the colored-Jones q factor",
      representation := "trivial",
      shapeField := "Q(q)",
      source := "https://arxiv.org/abs/2111.06645v3",
      locator := "Appendix A.3, (A.2), pp. 78–79",
      domain := "finite root sum, not a WRT manifold invariant" },
    { column := .traceFieldAndBlochClasses,
      output := "selected shape field",
      datum := "Q(ξ), ξ³−ξ²+1=0, Im ξ<0",
      node := "ArithmeticQuantumTopology:QT.7/representation-indexed-perturbative-family",
      status := .computed,
      root := "selected cubic shape ξ",
      normalization := "GZ branch; no embedded-field identification with BD τ asserted",
      representation := "geometric",
      shapeField := "Q(ξ), ξ³−ξ²+1=0, Im ξ<0",
      source := "https://arxiv.org/abs/2111.06645v3",
      locator := "§1, p. 10; Appendix A.3, p. 79",
      domain := "exact polynomial and embedding; no Bloch-class output supplied here" }])]

/-- All nine conjectural producing nodes in the accepted packet. The finite
check is a provenance guard, not a proof or decision procedure for mathematics. -/
def ledgerConjecturalNodes : List String := [
  "ArithmeticQuantumTopology:QT.7/the-quantum-modularity-conjecture",
  "ArithmeticQuantumTopology:QT.7/generalized-quantum-modularity",
  "ArithmeticQuantumTopology:QT.7/lift-from-values-to-series",
  "ArithmeticQuantumTopology:QT.7/quadratic-relations",
  "ArithmeticQuantumTopology:QT.7/coefficient-asymptotics",
  "ArithmeticQuantumTopology:QT.7/matrix-refined-quantum-modularity",
  "ArithmeticQuantumTopology:QT.7/cocycle-analytic-extension",
  "ArithmeticQuantumTopology:QT.7/ak-knot-comparison-conjecture",
  "ArithmeticQuantumTopology:QT.7/kashaev-volume-conjecture"]

def ledgerEntryStatusValid (e : LedgerEntry) : Bool :=
  !ledgerConjecturalNodes.contains e.node || decide (e.status = .conjectural)

def ledgerEntryRecorded (e : LedgerEntry) : Bool :=
  [e.output, e.datum, e.node, e.root, e.normalization, e.representation,
    e.shapeField, e.source, e.locator, e.domain].all (fun s => !s.isEmpty)

/-- A missing row or column returns no outputs, rather than a default invariant. -/
def ledgerCell (k : String) (c : LedgerColumn) : List LedgerEntry :=
  ledgerRows.flatMap fun row =>
    if row.1 = k then row.2.filter (fun e => decide (e.column = c)) else []

-- ledger_figureEight_row: six cells plus the actual finite-root value signature.
-- The arithmetic conjunct depends on the proposed theorem (and its sorry);
-- the coverage conjunct checks only the concrete bibliographic table.
theorem ledger_figureEight_row : (ledgerColumns.all (fun c => !(ledgerCell "4₁" c).isEmpty) = true) ∧
    [figureEightKashaev (-1), figureEightKashaev (-1 / 2),
      figureEightKashaev (-1 / 3), figureEightKashaev (-1 / 4),
      figureEightKashaev (-1 / 5), figureEightKashaev (-1 / 6)] =
      [1, 5, 13, 27, 46 + 2 * Real.sqrt 5, 89] := by
  constructor
  · decide
  · rcases figureEightKashaev_small with ⟨h₁, h₂, h₃, h₄, h₅, h₆⟩
    rw [h₁, h₂, h₃, h₄, h₅, h₆]

-- ledger_status_consistent: check every output and its required context.
theorem ledger_status_consistent : ledgerRows.all (fun row => row.2.all
    (fun e => ledgerEntryStatusValid e && ledgerEntryRecorded e)) = true := by decide

-- ledger_missing_context: a populated record cannot omit its root,
-- normalization or source. Each mutation is checked on every actual output.
theorem ledger_missing_context : ledgerRows.all (fun row => row.2.all (fun e =>
    !ledgerEntryRecorded { e with root := "" } &&
    !ledgerEntryRecorded { e with normalization := "" } &&
    !ledgerEntryRecorded { e with source := "" })) = true := by decide

-- ledger_status_rejects_proved_conjecture: an otherwise populated entry with
-- either conjectural producing node cannot acquire a proved label.
theorem ledger_status_rejects_proved_conjecture : (ledgerCell "4₁" .asymptoticSeries).all (fun e =>
    if ledgerConjecturalNodes.contains e.node then
      !ledgerEntryStatusValid { e with status := .proved } else true) = true := by decide

-- ledger_selected_theorems: each selected formal/analytic output keeps its own
-- proved-source label, while a different output in the same column is conjectural.
theorem ledger_selected_theorems : (ledgerCell "4₁" .asymptoticSeries).map (fun e => e.status) =
    [.proved, .proved, .conjectural, .conjectural] ∧
    (ledgerCell "5₂" .volumeAndChernSimons).map (fun e => e.status) = [.proved] := by decide

-- ledger_traceField: exact recorded fields/branches, not a field-isomorphism proof.
theorem ledger_traceField : (ledgerCell "4₁" .traceFieldAndBlochClasses).map (fun e => e.datum) =
    ["Q(√−3), 2[exp(πi/3)]"] ∧
    (ledgerCell "5₂" .traceFieldAndBlochClasses).map (fun e => e.shapeField) =
    ["Q(ξ), ξ³−ξ²+1=0, Im ξ<0"] := by decide

-- ledger_empty_column: absence is explicit; it asserts no equality or vanishing.
theorem ledger_empty_column : ledgerCell "5₂" .cyclotomicCoefficients = [] ∧
    ledgerColumns.all (fun c => (ledgerCell "unlisted knot" c).isEmpty) = true := by decide

/-- GZ Appendix A.3, (A.2), pp. 78–79. Positive-q convention, before
multiplication by q to match the cited colored Jones evaluation. -/
def fiveTwoKashaevAtRoot (N : ℕ) (q : ℂ) : ℂ :=
  ∑ m ∈ range N, ∑ k ∈ range (m + 1),
    q ^ (-( ((m + 1) * k : ℕ) : ℤ)) * qPochC q m ^ 2 * qPochC q⁻¹ k

-- fiveTwo_root_zero: a zero-length truncation supplies no knot evaluation.
theorem fiveTwo_root_zero (q : ℂ) : fiveTwoKashaevAtRoot 0 q = 0 := by
  simp [fiveTwoKashaevAtRoot]
-- fiveTwo_root_one: the normalized finite sum starts at 1.
theorem fiveTwo_root_one (q : ℂ) : fiveTwoKashaevAtRoot 1 q = 1 := by
  simp [fiveTwoKashaevAtRoot, qPochC]
-- fiveTwo_root_minus_one: a different knot gives 13 rather than 4₁'s 5.
theorem fiveTwo_root_minus_one : fiveTwoKashaevAtRoot 2 (-1) = 13 := by
  norm_num [fiveTwoKashaevAtRoot, qPochC, Finset.sum_range_succ,
    Finset.prod_range_succ]
-- fiveTwo_root_normalization: the source's colored-Jones q factor changes the sign.
theorem fiveTwo_root_normalization : (-1 : ℂ) * fiveTwoKashaevAtRoot 2 (-1) = -13 := by
  norm_num [fiveTwoKashaevAtRoot, qPochC, Finset.sum_range_succ,
    Finset.prod_range_succ]

/-! Scalar algebraic components of the unified Kashaev and root-NZ plans.
These functions do not replace the missing knot or triangulation carriers. -/
def kashaevCyclotomicKernel (q : ℂ) (n : ℕ) : ℂ :=
  ∏ j ∈ range n, (2 - q ^ (j + 1) - q ^ (-(j + 1 : ℤ)))

theorem kashaevCyclotomicKernel_factorial_square (q : ℂ) (hq : q ≠ 0) (n : ℕ) :
    kashaevCyclotomicKernel q n =
      (-1 : ℂ) ^ n * q ^ (-(n * (n + 1) / 2 : ℤ)) * qPochC q n ^ 2 := sorry

-- unifiedKashaev_order_one: the coefficient a₀(K)=1 is supplied by QT.2.
example (n : ℕ) (hn : 0 < n) : kashaevCyclotomicKernel 1 n = 0 := sorry

-- unifiedKashaev_factorial_square, scalar polynomial identity.
example (q : ℂ) (hq : q ≠ 0) :
    kashaevCyclotomicKernel q 1 = -q⁻¹ * (1 - q) ^ 2 := sorry

def cyclicDilogarithmStar (k : ℕ) (ζ x : ℂ) : ℂ :=
  ∏ s ∈ range (k - 1), (1 - ζ ^ (-(s + 1 : ℤ)) * x) ^ (s + 1)

-- rootNZ_k_one: the cyclic part of the degeneration.
example (ζ x : ℂ) : cyclicDilogarithmStar 1 ζ x = 1 := sorry

def rootNZWeight {n k : ℕ} (Q : Matrix (Fin n) (Fin n) ℤ)
    (r : Fin n → ℤ) (ζ : ℂ)
    (_hζ : ζ = Complex.exp (2 * Real.pi * Complex.I / (k : ℂ)))
    (θ : Fin n → ℂ) (m : Fin n → Fin k) : ℂ :=
  let quadratic : ℤ := ∑ i, (m i).val * ∑ j, Q i j * (m j).val
  let linear : ℤ := ∑ i, (m i).val * r i
  Complex.exp (-Real.pi * Complex.I * (quadratic : ℂ)) *
    Complex.exp (Real.pi * Complex.I * ((quadratic + linear : ℤ) : ℂ) / (k : ℂ)) *
    ∏ i, (θ i ^ (-(∑ j, Q i j * (m j).val))) /
      (∏ s ∈ range (m i).val, (1 - ζ ^ (s + 1) * (θ i)⁻¹))

-- rootNZ_primitive_root_transport: conjugate the whole scalar weight.
-- These scalar inputs do not certify a geometric NZ datum.
example (ζ : ℂ) (hζ : ζ = Complex.exp (2 * Real.pi * Complex.I / (3 : ℂ))) :
    star (rootNZWeight (fun (_i _j : Fin 1) => -1) (fun _ => 1) ζ hζ
      (fun _ => 2) (fun _ => (⟨2, by decide⟩ : Fin 3))) =
      4 * ζ / ((1 - ζ ^ 2 / 2) * (1 - ζ / 2)) := sorry

/-- Only the finite weighted average, with an actual nonzero denominator.
NZ gluing and root relations belong to the geometric RootNZDatum, still requiring the supplier triangulation interface. -/
def rootNZAverage {n k : ℕ} (a g : (Fin n → Fin k) → ℂ)
    (_hS : ∑ m, a m ≠ 0) : ℂ := (∑ m, a m * g m) / ∑ m, a m

theorem rootNZAverage_one {n k : ℕ} (a : (Fin n → Fin k) → ℂ)
    (hS : ∑ m, a m ≠ 0) : rootNZAverage a (fun _ => 1) hS = 1 := sorry

-- rootNZ_denominator: zero weights do not supply the required hypothesis.
example {n k : ℕ} : (∑ _m : Fin n → Fin k, (0 : ℂ)) = 0 := sorry

/-! QT.6: polynomial vertices in t = √h.
`liNeg r z` is the import-facing value Li_{-r}(z) from Polylogarithms:P.1.
No polylogarithm or Gaussian operator is defined here. The geometric datum
and the complex-coefficient extension of HB.4 remain supplier interfaces.
The coefficients below are genuine finite polynomials, even before these
imports are instantiated. Sources: GSW §1 (4)–(7), pp. 3–4; DG2 §2.3–2.4
(20)–(25), pp. 7–8. -/
section NZVertices
variable {N : ℕ}

/-- Positive t-degree part of the GSW logarithmic vertex. At degree d,
the finite indices satisfy 2n+j=d+2; all nonpositive t-degrees are excluded. -/
def NZVertexLog (liNeg : ℕ → ℂ → ℂ) (i : Fin N) (z : ℂ) :
    PowerSeries (MvPolynomial (Fin N) ℂ) :=
  PowerSeries.mk fun d => if d = 0 then 0 else
    ∑ n ∈ (range (d + 3)).filter (fun n => 2 * n ≤ d + 2),
      let j := d + 2 - 2 * n
      MvPolynomial.C (-((_root_.bernoulli n : ℚ) : ℂ) * liNeg (n + j - 2) z /
        ((n.factorial : ℂ) * (j.factorial : ℂ))) * MvPolynomial.X i ^ j

def NZVertexSeries (liNeg : ℕ → ℂ → ℂ) (i : Fin N) (z : ℂ) :
    PowerSeries (MvPolynomial (Fin N) ℂ) :=
  PowerSeries.subst (NZVertexLog liNeg i z)
    (PowerSeries.exp (MvPolynomial (Fin N) ℂ))

theorem NZVertexLog_constant (liNeg : ℕ → ℂ → ℂ) (i : Fin N) (z : ℂ) :
    PowerSeries.constantCoeff (NZVertexLog liNeg i z) = 0 := by
  simp [NZVertexLog, PowerSeries.constantCoeff_mk]

theorem NZVertexLog_hasSubst (liNeg : ℕ → ℂ → ℂ) (i : Fin N) (z : ℂ) :
    PowerSeries.HasSubst (NZVertexLog liNeg i z) :=
  PowerSeries.HasSubst.of_constantCoeff_zero' (NZVertexLog_constant liNeg i z)

theorem NZVertexSeries_constant (liNeg : ℕ → ℂ → ℂ) (i : Fin N) (z : ℂ) :
    PowerSeries.constantCoeff (NZVertexSeries liNeg i z) = 1 := by
  change MvPowerSeries.constantCoeff (PowerSeries.subst (NZVertexLog liNeg i z)
    (PowerSeries.exp (MvPolynomial (Fin N) ℂ))) = 1
  rw [PowerSeries.constantCoeff_subst_of_constantCoeff_zero
    (NZVertexLog_constant liNeg i z)]
  simp

theorem NZVertexLog_first (liNeg : ℕ → ℂ → ℂ) (i : Fin N) (z : ℂ) :
    PowerSeries.coeff 1 (NZVertexLog liNeg i z) =
      MvPolynomial.C (liNeg 0 z / 2) * MvPolynomial.X i -
      MvPolynomial.C (liNeg 1 z / 6) * MvPolynomial.X i ^ 3 := by
  norm_num [NZVertexLog, PowerSeries.coeff_mk, Finset.sum_filter,
    Finset.sum_range_succ, Nat.factorial, div_eq_mul_inv, map_mul, mul_neg, map_neg]
  ring

-- formalNZ_vertex_second: the scalar Bernoulli term and the quartic term
-- discriminate the exponent's filter and factorials.
example (liNeg : ℕ → ℂ → ℂ) (i : Fin N) (z : ℂ) :
    PowerSeries.coeff 2 (NZVertexLog liNeg i z) =
      -MvPolynomial.C (liNeg 0 z / 12) +
      MvPolynomial.C (liNeg 1 z / 4) * MvPolynomial.X i ^ 2 -
      MvPolynomial.C (liNeg 2 z / 24) * MvPolynomial.X i ^ 4 := sorry

-- formalNZ_vertex_exponential: this is exp(log ψ), not the logarithm itself.
example (liNeg : ℕ → ℂ → ℂ) (i : Fin N) (z : ℂ) :
    PowerSeries.coeff 2 (NZVertexSeries liNeg i z) =
      PowerSeries.coeff 2 (NZVertexLog liNeg i z) +
      MvPolynomial.C (1 / 2 : ℂ) *
        PowerSeries.coeff 1 (NZVertexLog liNeg i z) ^ 2 := sorry

-- formalNZ_vertex_first: the cubic vertex survives already at degree t.
example (liNeg : ℕ → ℂ → ℂ) (i : Fin N) (z : ℂ) :
    PowerSeries.coeff 1 (NZVertexSeries liNeg i z) =
      PowerSeries.coeff 1 (NZVertexLog liNeg i z) := sorry

theorem NZVertexSeries_parity (liNeg : ℕ → ℂ → ℂ) (i : Fin N) (z : ℂ) (d : ℕ) :
    MvPolynomial.eval₂ MvPolynomial.C (fun j => -MvPolynomial.X j)
        (PowerSeries.coeff d (NZVertexSeries liNeg i z)) =
      (-1 : MvPolynomial (Fin N) ℂ) ^ d *
        PowerSeries.coeff d (NZVertexSeries liNeg i z) := sorry

/-- Exact GSW prefactor and product; Q=B⁻¹A, μ=B⁻¹ν and f is the
integer flattening cast into ℂ by the geometric NZ-data adapter. -/
def NZFormalIntegrand (liNeg : ℕ → ℂ → ℂ)
    (Q : Matrix (Fin N) (Fin N) ℂ) (μ f z : Fin N → ℂ) :
    PowerSeries (MvPolynomial (Fin N) ℂ) :=
  let linear : MvPolynomial (Fin N) ℂ :=
    ∑ i, MvPolynomial.C ((1 - μ i) / 2) * MvPolynomial.X i
  let scalar : ℂ := (∑ i, f i * (Q.mulVec f) i) / 8
  PowerSeries.subst
      (PowerSeries.monomial 1 linear + PowerSeries.monomial 2 (MvPolynomial.C scalar))
      (PowerSeries.exp (MvPolynomial (Fin N) ℂ)) *
    ∏ i, NZVertexSeries liNeg i (z i)

theorem NZFormalIntegrand_constant (liNeg : ℕ → ℂ → ℂ)
    (Q : Matrix (Fin N) (Fin N) ℂ) (μ f z : Fin N → ℂ) :
    PowerSeries.constantCoeff (NZFormalIntegrand liNeg Q μ f z) = 1 := sorry

theorem NZFormalIntegrand_first (liNeg : ℕ → ℂ → ℂ)
    (Q : Matrix (Fin N) (Fin N) ℂ) (μ f z : Fin N → ℂ) :
    PowerSeries.coeff 1 (NZFormalIntegrand liNeg Q μ f z) =
      ∑ i, (MvPolynomial.C ((1 - μ i + liNeg 0 (z i)) / 2) * MvPolynomial.X i -
        MvPolynomial.C (liNeg 1 (z i) / 6) * MvPolynomial.X i ^ 3) := sorry

theorem NZFormalIntegrand_parity (liNeg : ℕ → ℂ → ℂ)
    (Q : Matrix (Fin N) (Fin N) ℂ) (μ f z : Fin N → ℂ) (d : ℕ) :
    MvPolynomial.eval₂ MvPolynomial.C (fun i => -MvPolynomial.X i)
        (PowerSeries.coeff d (NZFormalIntegrand liNeg Q μ f z)) =
      (-1 : MvPolynomial (Fin N) ℂ) ^ d *
        PowerSeries.coeff d (NZFormalIntegrand liNeg Q μ f z) := sorry

-- formalNZ_empty_integrand: zero-dimensional products and prefactors are units.
example (liNeg : ℕ → ℂ → ℂ) (Q : Matrix (Fin 0) (Fin 0) ℂ)
    (μ f z : Fin 0 → ℂ) : NZFormalIntegrand liNeg Q μ f z = 1 := sorry

-- formalNZ_flattening_prefactor: distinguish the fᵀQf/8 term.
example (z : Fin 1 → ℂ) :
    PowerSeries.coeff 2 (NZFormalIntegrand (fun _ _ => 0)
      (1 : Matrix (Fin 1) (Fin 1) ℂ) (fun _ => 1) (fun _ => 2) z) =
      MvPolynomial.C (1 / 2 : ℂ) := sorry

/-- The filtered root logarithm includes n=0 at valence at least three.
Its domain is positive k; root and shape compatibility is imposed by the
RootNZDatum adapter, not by this polynomial coefficient function. -/
def rootNZVertexLog (liNeg : ℕ → ℂ → ℂ) (k : ℕ) (_hk : 0 < k)
    (i : Fin N) (ζ θ : ℂ) (m : Fin k) :
    PowerSeries (MvPolynomial (Fin N) ℂ) :=
  PowerSeries.mk fun d => if d = 0 then 0 else
    ∑ n ∈ (range (d + 3)).filter (fun n => 2 * n ≤ d + 2),
      let j := d + 2 - 2 * n
      MvPolynomial.C (((-1 : ℂ) ^ j /
          ((n.factorial : ℂ) * (j.factorial : ℂ) * (k : ℂ) ^ j)) *
        ∑ s ∈ range k,
          (Polynomial.bernoulli n).eval₂ (algebraMap ℚ ℂ) (((s + 1 : ℕ) : ℂ) / k) *
          liNeg (n + j - 2) (ζ ^ (m.val + s + 1) * θ⁻¹)) * MvPolynomial.X i ^ j

def rootNZVertexSeries (liNeg : ℕ → ℂ → ℂ) (k : ℕ) (hk : 0 < k)
    (i : Fin N) (ζ θ : ℂ) (m : Fin k) :
    PowerSeries (MvPolynomial (Fin N) ℂ) :=
  PowerSeries.subst (rootNZVertexLog liNeg k hk i ζ θ m)
    (PowerSeries.exp (MvPolynomial (Fin N) ℂ))

theorem rootNZVertexLog_constant (liNeg : ℕ → ℂ → ℂ) (k : ℕ) (hk : 0 < k)
    (i : Fin N) (ζ θ : ℂ) (m : Fin k) :
    PowerSeries.constantCoeff (rootNZVertexLog liNeg k hk i ζ θ m) = 0 := by
  simp [rootNZVertexLog, PowerSeries.constantCoeff_mk]

theorem rootNZVertexLog_hasSubst (liNeg : ℕ → ℂ → ℂ) (k : ℕ) (hk : 0 < k)
    (i : Fin N) (ζ θ : ℂ) (m : Fin k) :
    PowerSeries.HasSubst (rootNZVertexLog liNeg k hk i ζ θ m) :=
  PowerSeries.HasSubst.of_constantCoeff_zero'
    (rootNZVertexLog_constant liNeg k hk i ζ θ m)

theorem rootNZVertexSeries_constant (liNeg : ℕ → ℂ → ℂ) (k : ℕ) (hk : 0 < k)
    (i : Fin N) (ζ θ : ℂ) (m : Fin k) :
    PowerSeries.constantCoeff (rootNZVertexSeries liNeg k hk i ζ θ m) = 1 := by
  change MvPowerSeries.constantCoeff (PowerSeries.subst (rootNZVertexLog liNeg k hk i ζ θ m)
    (PowerSeries.exp (MvPolynomial (Fin N) ℂ))) = 1
  rw [PowerSeries.constantCoeff_subst_of_constantCoeff_zero
    (rootNZVertexLog_constant liNeg k hk i ζ θ m)]
  simp

-- rootNZ_valence_three: the t-linear cubic coefficient at k=1 cannot be omitted.
example (liNeg : ℕ → ℂ → ℂ) (i : Fin N) (θ : ℂ) :
    PowerSeries.coeff 1 (rootNZVertexLog liNeg 1 (by decide) i 1 θ 0) =
      -MvPolynomial.C (liNeg 0 θ⁻¹ / 2) * MvPolynomial.X i -
      MvPolynomial.C (liNeg 1 θ⁻¹ / 6) * MvPolynomial.X i ^ 3 := sorry

-- rootNZ_cubic_scaling: at k=2 with Li₀=0, Li₋₁=1 the exponent is −x³/24.
example (i : Fin N) (ζ θ : ℂ) :
    PowerSeries.coeff 1 (rootNZVertexLog (fun r _ => if r = 1 then 1 else 0)
      2 (by decide) i ζ θ 0) =
      -MvPolynomial.C (1 / 24 : ℂ) * MvPolynomial.X i ^ 3 := by
  norm_num [rootNZVertexLog, PowerSeries.coeff_mk, Finset.sum_filter,
    Finset.sum_range_succ, Nat.factorial]

-- rootNZ_vertex_exponential: cubic pairs contribute in degree t²=h.
example (liNeg : ℕ → ℂ → ℂ) (k : ℕ) (hk : 0 < k)
    (i : Fin N) (ζ θ : ℂ) (m : Fin k) :
    PowerSeries.coeff 2 (rootNZVertexSeries liNeg k hk i ζ θ m) =
      PowerSeries.coeff 2 (rootNZVertexLog liNeg k hk i ζ θ m) +
      MvPolynomial.C (1 / 2 : ℂ) *
        PowerSeries.coeff 1 (rootNZVertexLog liNeg k hk i ζ θ m) ^ 2 := sorry

theorem rootNZVertexSeries_parity (liNeg : ℕ → ℂ → ℂ) (k : ℕ) (hk : 0 < k)
    (i : Fin N) (ζ θ : ℂ) (m : Fin k) (d : ℕ) :
    MvPolynomial.eval₂ MvPolynomial.C (fun j => -MvPolynomial.X j)
        (PowerSeries.coeff d (rootNZVertexSeries liNeg k hk i ζ θ m)) =
      (-1 : MvPolynomial (Fin N) ℂ) ^ d *
        PowerSeries.coeff d (rootNZVertexSeries liNeg k hk i ζ θ m) := sorry

/-- Root-specific prefactor: it uses fᵀμ, not fᵀQf, and the linear term
is −xᵀμ/(2k). Both differences from GSW are retained. -/
def rootNZFormalIntegrand (liNeg : ℕ → ℂ → ℂ) (k : ℕ) (hk : 0 < k)
    (μ f θ : Fin N → ℂ) (ζ : ℂ) (m : Fin N → Fin k) :
    PowerSeries (MvPolynomial (Fin N) ℂ) :=
  let linear : MvPolynomial (Fin N) ℂ :=
    ∑ i, MvPolynomial.C (-μ i / (2 * (k : ℂ))) * MvPolynomial.X i
  let scalar : ℂ := (∑ i, f i * μ i) / (8 * (k : ℂ))
  PowerSeries.subst
      (PowerSeries.monomial 1 linear + PowerSeries.monomial 2 (MvPolynomial.C scalar))
      (PowerSeries.exp (MvPolynomial (Fin N) ℂ)) *
    ∏ i, rootNZVertexSeries liNeg k hk i ζ (θ i) (m i)

theorem rootNZFormalIntegrand_constant (liNeg : ℕ → ℂ → ℂ) (k : ℕ) (hk : 0 < k)
    (μ f θ : Fin N → ℂ) (ζ : ℂ) (m : Fin N → Fin k) :
    PowerSeries.constantCoeff (rootNZFormalIntegrand liNeg k hk μ f θ ζ m) = 1 := sorry

theorem rootNZFormalIntegrand_parity (liNeg : ℕ → ℂ → ℂ) (k : ℕ) (hk : 0 < k)
    (μ f θ : Fin N → ℂ) (ζ : ℂ) (m : Fin N → Fin k) (d : ℕ) :
    MvPolynomial.eval₂ MvPolynomial.C (fun i => -MvPolynomial.X i)
        (PowerSeries.coeff d (rootNZFormalIntegrand liNeg k hk μ f θ ζ m)) =
      (-1 : MvPolynomial (Fin N) ℂ) ^ d *
        PowerSeries.coeff d (rootNZFormalIntegrand liNeg k hk μ f θ ζ m) := sorry

-- rootNZ_empty_integrand: a product over no tetrahedra equals one.
example (liNeg : ℕ → ℂ → ℂ) (k : ℕ) (hk : 0 < k)
    (μ f θ : Fin 0 → ℂ) (ζ : ℂ) (m : Fin 0 → Fin k) :
    rootNZFormalIntegrand liNeg k hk μ f θ ζ m = 1 := sorry

-- rootNZ_linear_prefactor: retaining the sign and 1/k factor.
example (θ : Fin 1 → ℂ) (ζ : ℂ) :
    PowerSeries.coeff 1 (rootNZFormalIntegrand (fun _ _ => 0) 2 (by decide)
      (fun _ => 4) (fun _ => 0) θ ζ (fun _ => 0)) =
      -MvPolynomial.X (0 : Fin 1) := sorry

-- rootNZ_flattening_prefactor: the scalar term fᵀμ/(8k) survives at degree two.
example (θ : Fin 1 → ℂ) (ζ : ℂ) :
    PowerSeries.coeff 2 (rootNZFormalIntegrand (fun _ _ => 0) 2 (by decide)
      (fun _ => 4) (fun _ => 2) θ ζ (fun _ => 0)) =
      MvPolynomial.C (1 / 2 : ℂ) +
        MvPolynomial.C (1 / 2 : ℂ) * MvPolynomial.X (0 : Fin 1) ^ 2 := sorry

end NZVertices

/-! QT.2: the completed even center, with its actual quotient multiplication.
Habiro math/0605313v1, §9.3–9.4, pp. 19–20, Theorems 9.2 and 9.5;
§9.6, pp. 22–23, Theorem 9.13; §11, pp. 30–31, Theorem 11.2.
The indeterminate below represents C². The coefficient ring is ℤ[q±1],
where q=v². Neither the full C-center nor pointwise sequence multiplication
is substituted for this even center. Proof obligations remain admitted.
-/
namespace QuantumEnveloping
namespace EvenCenter

/-- C is an ambient central element; vC, rather than C, belongs to the q-form. -/
def quantumCasimir : Uh :=
  scalar ((formalVPower 1 - formalVPower (-1))^2) * F * E +
    scalar (formalVPower 1) * K + scalar (formalVPower (-1)) * Kinv

theorem quantumCasimir_central (u : Uh) : Commute quantumCasimir u := sorry

theorem qCasimir_mem : scalar (formalVPower 1) * quantumCasimir ∈ Uq := sorry

theorem quantumCasimir_sq_mem : quantumCasimir^2 ∈ Uqev := sorry

/-- The actual center of the existing completed even image algebra. -/
abbrev Center := Subalgebra.center QBase (QuantumEnveloping.completion true)

/-- The distinguished C² in the actual even image center. -/
def casimirSquare : Center :=
  ⟨⟨quantumCasimir^2, integralForm_le_completion true quantumCasimir_sq_mem⟩, sorry⟩

/-- Monic polynomial in Y=C², not a polynomial in C with a renamed variable. -/
def sigmaPolynomial (n : ℕ) : Polynomial QBase :=
  ∏ i ∈ range n,
    (X - Polynomial.C (LaurentPolynomial.T ((i+1 : ℕ) : ℤ) + 2 +
      LaurentPolynomial.T (-((i+1 : ℕ) : ℤ))))

def sigma (n : ℕ) : Center := Polynomial.aeval casimirSquare (sigmaPolynomial n)

theorem sigmaPolynomial_zero : sigmaPolynomial 0 = 1 := by simp [sigmaPolynomial]

theorem sigmaPolynomial_one : sigmaPolynomial 1 =
    X - Polynomial.C (LaurentPolynomial.T 1 + 2 + LaurentPolynomial.T (-1)) := by
  simp [sigmaPolynomial]

theorem sigmaPolynomial_succ (n : ℕ) : sigmaPolynomial (n+1) =
    sigmaPolynomial n *
      (X - Polynomial.C (LaurentPolynomial.T ((n+1 : ℕ) : ℤ) + 2 +
        LaurentPolynomial.T (-((n+1 : ℕ) : ℤ)))) := by
  simp [sigmaPolynomial, Finset.prod_range_succ]

theorem sigmaPolynomial_monic (n : ℕ) : (sigmaPolynomial n).Monic := sorry

theorem sigmaPolynomial_natDegree (n : ℕ) : (sigmaPolynomial n).natDegree = n := sorry

theorem sigma_zero : sigma 0 = 1 := by simp [sigma, sigmaPolynomial_zero]

theorem sigma_one : sigma 1 = casimirSquare -
    algebraMap QBase Center (LaurentPolynomial.T 1 + 2 + LaurentPolynomial.T (-1)) := by
  simp [sigma, sigmaPolynomial_one]

/-- The two-sided e-power filtration restricted to the polynomial center. -/
def sigmaIdeal (n : ℕ) : Ideal (Polynomial QBase) := Ideal.span {sigmaPolynomial n}

abbrev SigmaQuotient (n : ℕ) := Polynomial QBase ⧸ sigmaIdeal n

theorem sigmaIdeal_antitone {n m : ℕ} (h : n ≤ m) : sigmaIdeal m ≤ sigmaIdeal n := sorry

def sigmaTransition {n m : ℕ} (h : n ≤ m) : SigmaQuotient m →ₐ[QBase] SigmaQuotient n :=
  Ideal.Quotient.factorₐ QBase (sigmaIdeal_antitone h)

/-- Compatible finite polynomial quotients, with multiplication in each quotient. -/
def completedSigmaAlgebra : Subalgebra QBase (∀ n, SigmaQuotient n) where
  carrier := {x | ∀ (n m : ℕ) (h : n ≤ m), sigmaTransition h (x m) = x n}
  mul_mem' := by
    intro a b ha hb n m h
    change sigmaTransition h (a m * b m) = a n * b n
    rw [map_mul, ha n m h, hb n m h]
  add_mem' := by
    intro a b ha hb n m h
    change sigmaTransition h (a m + b m) = a n + b n
    rw [map_add, ha n m h, hb n m h]
  algebraMap_mem' := by
    intro a n m h
    exact (sigmaTransition h).commutes a

abbrev SigmaCompletion := completedSigmaAlgebra

instance sigmaCompletionCommRing : CommRing SigmaCompletion :=
  _root_.Subalgebra.toCommRing (R := QBase) (A := ∀ n : ℕ, SigmaQuotient n)
    completedSigmaAlgebra

def sigmaProjection (n : ℕ) : SigmaCompletion →ₐ[QBase] SigmaQuotient n where
  toFun x := x.val n
  map_zero' := rfl
  map_one' := rfl
  map_add' _ _ := rfl
  map_mul' _ _ := rfl
  commutes' _ := rfl

/-- Polynomial elements map to their actual congruence classes at every precision. -/
def polynomialToCompletion : Polynomial QBase →ₐ[QBase] SigmaCompletion where
  toFun p := ⟨fun n => Ideal.Quotient.mk (sigmaIdeal n) p, by intro n m h; rfl⟩
  map_zero' := Subtype.ext (funext fun n => (Ideal.Quotient.mk (sigmaIdeal n)).map_zero)
  map_one' := Subtype.ext (funext fun n => (Ideal.Quotient.mk (sigmaIdeal n)).map_one)
  map_add' p q := Subtype.ext (funext fun n => (Ideal.Quotient.mk (sigmaIdeal n)).map_add p q)
  map_mul' p q := Subtype.ext (funext fun n => (Ideal.Quotient.mk (sigmaIdeal n)).map_mul p q)
  commutes' a := by ext n; rfl

/-- Polynomial evaluation in the native even integral subalgebra. -/
def polynomialToEvenForm : Polynomial QBase →ₐ[QBase] Uqev :=
  Polynomial.aeval (⟨quantumCasimir^2, quantumCasimir_sq_mem⟩ : Uqev)

/-- The source's σ/e-power comparison, restricted to the actual even form. -/
theorem sigmaPolynomial_killed (n : ℕ) (p : Polynomial QBase)
    (hp : p ∈ sigmaIdeal n) : integralQuotientMap true n (polynomialToEvenForm p) = 0 := sorry

/-- Canonical finite-precision map, rather than an unspecified completion equivalence. -/
def sigmaToIntegralQuotient (n : ℕ) : SigmaQuotient n →ₐ[QBase] IntegralQuotient true n :=
  Ideal.Quotient.liftₐ (sigmaIdeal n)
    ((integralQuotientMap true n).comp polynomialToEvenForm) (sigmaPolynomial_killed n)

def sigmaToIntegralLimit : SigmaCompletion →ₐ[QBase] integralInverseLimit true where
  toFun x := ⟨fun n => sigmaToIntegralQuotient n (sigmaProjection n x), sorry⟩
  map_zero' := by apply Subtype.ext; funext n; exact map_zero (sigmaToIntegralQuotient n)
  map_one' := by apply Subtype.ext; funext n; exact map_one (sigmaToIntegralQuotient n)
  map_add' x y := by
    apply Subtype.ext; funext n
    exact map_add (sigmaToIntegralQuotient n) (x.val n) (y.val n)
  map_mul' x y := by
    apply Subtype.ext; funext n
    exact map_mul (sigmaToIntegralQuotient n) (x.val n) (y.val n)
  commutes' a := by
    apply Subtype.ext; funext n
    exact (sigmaToIntegralQuotient n).commutes a

/-- Realization through the existing image completion and its actual center. -/
def sigmaToCenter : SigmaCompletion →ₐ[QBase] Center where
  toFun x := ⟨⟨integralToUh true (sigmaToIntegralLimit x),
    ⟨sigmaToIntegralLimit x, rfl⟩⟩, sorry⟩
  map_zero' := sorry
  map_one' := sorry
  map_add' := sorry
  map_mul' := sorry
  commutes' := sorry

/-- Saturation gives injectivity; integral central expansions give surjectivity. -/
theorem sigmaToCenter_bijective : Function.Bijective sigmaToCenter := sorry

/-- Habiro's even center theorem for the explicitly defined infinite-series map. -/
def evenCenterRealization : SigmaCompletion ≃ₐ[QBase] Center :=
  AlgEquiv.ofBijective sigmaToCenter sigmaToCenter_bijective

theorem evenCenterRealization_polynomial (p : Polynomial QBase) :
    evenCenterRealization (polynomialToCompletion p) = Polynomial.aeval casimirSquare p := sorry

/-- Compatible integral centers are also central in the ambient h-adic algebra. -/
theorem center_ambient_central (z : Center) (u : Uh) :
    Commute ((z : QuantumEnveloping.completion true) : Uh) u := sorry

/-- Monic triangular coordinates, additive and linear but not multiplicative. -/
def sigmaQuotientCoordinates (n : ℕ) : SigmaQuotient n ≃ₗ[QBase] (Fin n → QBase) := sorry

theorem sigmaQuotientCoordinates_mk (n : ℕ) (a : Fin n → QBase) (j : Fin n) :
    sigmaQuotientCoordinates n (Ideal.Quotient.mk (sigmaIdeal n)
      (∑ i : Fin n, a i • sigmaPolynomial i.val)) j = a j := sorry

def sigmaPartialSum (a : ℕ → QBase) (n : ℕ) : Polynomial QBase :=
  ∑ i : Fin n, a i.val • sigmaPolynomial i.val

def sigmaFromCoordinates (a : ℕ → QBase) : SigmaCompletion :=
  ⟨fun n => Ideal.Quotient.mk (sigmaIdeal n) (sigmaPartialSum a n), sorry⟩

def sigmaCoeff (x : SigmaCompletion) (n : ℕ) : QBase :=
  sigmaQuotientCoordinates (n+1) (sigmaProjection (n+1) x) ⟨n, Nat.lt_succ_self n⟩

def sigmaCoordinates : SigmaCompletion ≃ₗ[QBase] (ℕ → QBase) where
  toFun x n := sigmaCoeff x n
  invFun := sigmaFromCoordinates
  left_inv := sorry
  right_inv := sorry
  map_add' := sorry
  map_smul' := sorry

/-- Unique integral σ-expansion of the actual center, not an arbitrary sequence carrier. -/
def evenCenterExpansion : Center ≃ₗ[QBase] (ℕ → QBase) :=
  evenCenterRealization.symm.toLinearEquiv.trans sigmaCoordinates

theorem evenCenterExpansion_sigma (n j : ℕ) :
    evenCenterExpansion (sigma n) j = if j = n then 1 else 0 := sorry

theorem evenCenterExpansion_ext (z w : Center)
    (h : ∀ n, evenCenterExpansion z n = evenCenterExpansion w n) : z = w :=
  evenCenterExpansion.injective (funext h)

theorem sigmaFromCoordinates_projection (a : ℕ → QBase) (n : ℕ) :
    sigmaProjection n (sigmaFromCoordinates a) =
      Ideal.Quotient.mk (sigmaIdeal n) (sigmaPartialSum a n) := rfl

/-- Intrinsic σ-adic topology on the inverse limit uses discrete integral quotients. -/
instance sigmaQuotientUniformSpace (n : ℕ) : UniformSpace (SigmaQuotient n) := ⊥
instance sigmaCoefficientUniformSpace : UniformSpace QBase := ⊥
instance sigmaCompletionUniformSpace : UniformSpace SigmaCompletion :=
  inferInstanceAs (UniformSpace completedSigmaAlgebra)

theorem sigmaCompletion_complete : CompleteSpace SigmaCompletion := sorry
theorem sigmaCompletion_t2 : T2Space SigmaCompletion := sorry
theorem sigmaCompletion_topologicalRing : IsTopologicalRing SigmaCompletion := sorry

def sigmaCoordinateHomeomorph : SigmaCompletion ≃ₜ (ℕ → QBase) where
  __ := sigmaCoordinates.toEquiv
  continuous_toFun := sorry
  continuous_invFun := sorry

theorem sigmaPartialSum_tendsto (a : ℕ → QBase) :
    Filter.Tendsto (fun n => polynomialToCompletion (sigmaPartialSum a n))
      Filter.atTop (nhds (sigmaFromCoordinates a)) := sorry

/-- Integrality and the σ/e-power comparison, not h-adic closedness of an image. -/
theorem sigma_in_integralIdeal (n : ℕ) :
    ∃ s : Uqev, (s : Uh) = ((sigma n : QuantumEnveloping.completion true) : Uh) ∧
      s ∈ integralIdeal true n := sorry

theorem quantumCasimir_color (n : ℕ) : colorRepresentation n quantumCasimir =
    (formalVPower ((n+1 : ℕ) : ℤ) + formalVPower (-((n+1 : ℕ) : ℤ))) •
      (1 : ColorMatrix n) := sorry

theorem sigma_color (n i : ℕ) :
    colorRepresentation n ((sigma i : QuantumEnveloping.completion true) : Uh) =
      (∏ j ∈ range i,
        ((formalVPower ((n+1 : ℕ) : ℤ) + formalVPower (-((n+1 : ℕ) : ℤ)))^2 -
          (formalVPower (2*((j+1 : ℕ) : ℤ)) + 2 +
            formalVPower (-2*((j+1 : ℕ) : ℤ))))) • (1 : ColorMatrix n) := sorry

theorem sigma_Vn_vanish (n i : ℕ) (h : n < i) :
    colorRepresentation n ((sigma i : QuantumEnveloping.completion true) : Uh) = 0 := sorry

-- sigma_zero: the empty product is the unit of the actual center.
example : sigma 0 = 1 := sigma_zero
-- sigma_one: detects q=v², the square and the constant 2 together.
example : sigma 1 = casimirSquare -
    algebraMap QBase Center (LaurentPolynomial.T 1 + 2 + LaurentPolynomial.T (-1)) := sigma_one
-- sigma_Vn_vanish: the color index is highest weight, not representation dimension.
example (n i : ℕ) (h : n < i) :
    colorRepresentation n ((sigma i : QuantumEnveloping.completion true) : Uh) = 0 :=
  sigma_Vn_vanish n i h
-- casimir_trivial_color: the chosen C acts by v+v⁻¹, not by zero.
example : colorRepresentation 0 quantumCasimir =
    (formalVPower 1 + formalVPower (-1)) • (1 : ColorMatrix 0) := by
  simpa using quantumCasimir_color 0
-- sigma_first_nonzero_color: σ₁ does not annihilate V₁.
example : colorRepresentation 1 ((sigma 1 : QuantumEnveloping.completion true) : Uh) ≠ 0 := sorry
-- sigma_not_pointwise: the first σ-coordinate of σ₁² is q²+q⁻²−q−q⁻¹.
example : evenCenterExpansion (sigma 1 * sigma 1) 1 =
    LaurentPolynomial.T 2 + LaurentPolynomial.T (-2) -
      LaurentPolynomial.T 1 - LaurentPolynomial.T (-1) := sorry
-- sigma_square_leading_coefficient: the next coordinate is also present.
example : evenCenterExpansion (sigma 1 * sigma 1) 2 = 1 := sorry
-- sigma_quotient_zero: precision zero is the zero ring, not the coefficient ring.
example : Subsingleton (SigmaQuotient 0) := sorry
-- sigma_quotient_one: only the scalar coordinate survives modulo σ₁.
example : Nonempty (SigmaQuotient 1 ≃ₐ[QBase] QBase) := sorry
-- sigma_all_sequences: arbitrary integral coordinates define one compatible element.
example (a : ℕ → QBase) :
    evenCenterExpansion (evenCenterRealization (sigmaFromCoordinates a)) = a := sorry
-- sigma_finite_precision: higher coordinates cannot change precision n.
example (a b : ℕ → QBase) (n : ℕ) (h : ∀ i < n, a i = b i) :
    sigmaProjection n (sigmaFromCoordinates a) = sigmaProjection n (sigmaFromCoordinates b) := sorry
-- casimir_even_parity: even scalars lie in the existing even form.
example : quantumCasimir^2 ∈ Uqev ∧ scalar (formalVPower 1)*quantumCasimir ∈ Uq :=
  ⟨quantumCasimir_sq_mem, qCasimir_mem⟩

end EvenCenter
end QuantumEnveloping

/-! QT.6: specialization of HB.4's polynomial bracket to the NZ vertices.
GSW §1 (5)–(7), pp. 3–4, and §3.1 (20), pp. 9–10; DG2 Definition 2.5,
§2.3, pp. 7–8. These are algebraic adapters, not geometric NZ data.
`G` is the imported complex-linear polynomial functional. Normalization,
negation invariance and the covariance recursion are written explicitly in
the statements that use them; no Gaussian operator is constructed here.
The geometry, rational polylogarithms and coefficient-field/base-change
instance still belong to their suppliers. -/
section NZContractions
variable {N : ℕ}

/-- Extract the even t-coefficients after applying the supplied polynomial
functional to the exact GSW integrand. At the geometric specialization
`G` has covariance Λ⁻¹. Integer-power descent is a theorem below. -/
def NZPerturbativeSeries (G : MvPolynomial (Fin N) ℂ →ₗ[ℂ] ℂ)
    (liNeg : ℕ → ℂ → ℂ) (Q : Matrix (Fin N) (Fin N) ℂ)
    (μ f z : Fin N → ℂ) : PowerSeries ℂ :=
  PowerSeries.mk fun d => G (PowerSeries.coeff (2 * d) (NZFormalIntegrand liNeg Q μ f z))

theorem NZPerturbativeSeries_coeff (G : MvPolynomial (Fin N) ℂ →ₗ[ℂ] ℂ)
    (liNeg : ℕ → ℂ → ℂ) (Q : Matrix (Fin N) (Fin N) ℂ)
    (μ f z : Fin N → ℂ) (d : ℕ) :
    PowerSeries.coeff d (NZPerturbativeSeries G liNeg Q μ f z) =
      G (PowerSeries.coeff (2 * d) (NZFormalIntegrand liNeg Q μ f z)) :=
  PowerSeries.coeff_mk _ _

theorem NZPerturbativeSeries_constant (G : MvPolynomial (Fin N) ℂ →ₗ[ℂ] ℂ)
    (hG1 : G 1 = 1) (liNeg : ℕ → ℂ → ℂ)
    (Q : Matrix (Fin N) (Fin N) ℂ) (μ f z : Fin N → ℂ) :
    PowerSeries.constantCoeff (NZPerturbativeSeries G liNeg Q μ f z) = 1 := by
  rw [← PowerSeries.coeff_zero_eq_constantCoeff_apply, NZPerturbativeSeries_coeff]
  simpa only [Nat.mul_zero, PowerSeries.coeff_zero_eq_constantCoeff_apply,
    NZFormalIntegrand_constant] using hG1

theorem NZFormalIntegrand_gaussian_odd (G : MvPolynomial (Fin N) ℂ →ₗ[ℂ] ℂ)
    (hGneg : ∀ p, G (MvPolynomial.eval₂ MvPolynomial.C
      (fun i => -MvPolynomial.X i) p) = G p)
    (liNeg : ℕ → ℂ → ℂ) (Q : Matrix (Fin N) (Fin N) ℂ)
    (μ f z : Fin N → ℂ) (d : ℕ) (hd : Odd d) :
    G (PowerSeries.coeff d (NZFormalIntegrand liNeg Q μ f z)) = 0 := by
  have h := hGneg (PowerSeries.coeff d (NZFormalIntegrand liNeg Q μ f z))
  rw [NZFormalIntegrand_parity, hd.neg_one_pow, neg_one_mul, map_neg] at h
  linear_combination (-1 / 2 : ℂ) * h

/-- Expanding h to t² recovers every contracted coefficient, including the
odd coefficients. Thus even extraction does not silently discard terms. -/
theorem NZPerturbativeSeries_integralPowers (G : MvPolynomial (Fin N) ℂ →ₗ[ℂ] ℂ)
    (hGneg : ∀ p, G (MvPolynomial.eval₂ MvPolynomial.C
      (fun i => -MvPolynomial.X i) p) = G p)
    (liNeg : ℕ → ℂ → ℂ) (Q : Matrix (Fin N) (Fin N) ℂ)
    (μ f z : Fin N → ℂ) :
    PowerSeries.expand 2 (by decide) (NZPerturbativeSeries G liNeg Q μ f z) =
      PowerSeries.mk fun d => G (PowerSeries.coeff d (NZFormalIntegrand liNeg Q μ f z)) := by
  ext d
  by_cases hd : 2 ∣ d
  · obtain ⟨e, rfl⟩ := hd
    simp only [PowerSeries.coeff_expand_mul, NZPerturbativeSeries_coeff, PowerSeries.coeff_mk]
  · rw [PowerSeries.coeff_expand_of_not_dvd 2 (by decide) _ hd, PowerSeries.coeff_mk]
    exact (NZFormalIntegrand_gaussian_odd G hGneg liNeg Q μ f z d
      (Nat.not_even_iff_odd.mp (fun h => hd h.two_dvd))).symm

/-- The root-order adapter uses the actual finite weighted average with
nonzero denominator. Its supplied bracket must have covariance kΛ⁻¹,
not Λ⁻¹. Weights/root relations and arithmetic descent are not asserted. -/
def rootNZPerturbativeSeries (G : MvPolynomial (Fin N) ℂ →ₗ[ℂ] ℂ)
    (liNeg : ℕ → ℂ → ℂ) (k : ℕ) (hk : 0 < k)
    (μ f θ : Fin N → ℂ) (ζ : ℂ) (a : (Fin N → Fin k) → ℂ)
    (hS : ∑ m, a m ≠ 0) : PowerSeries ℂ :=
  PowerSeries.mk fun d => rootNZAverage a
    (fun m => G (PowerSeries.coeff (2 * d) (rootNZFormalIntegrand liNeg k hk μ f θ ζ m))) hS

theorem rootNZPerturbativeSeries_coeff (G : MvPolynomial (Fin N) ℂ →ₗ[ℂ] ℂ)
    (liNeg : ℕ → ℂ → ℂ) (k : ℕ) (hk : 0 < k)
    (μ f θ : Fin N → ℂ) (ζ : ℂ) (a : (Fin N → Fin k) → ℂ)
    (hS : ∑ m, a m ≠ 0) (d : ℕ) :
    PowerSeries.coeff d (rootNZPerturbativeSeries G liNeg k hk μ f θ ζ a hS) =
      rootNZAverage a
        (fun m => G (PowerSeries.coeff (2 * d) (rootNZFormalIntegrand liNeg k hk μ f θ ζ m))) hS :=
  PowerSeries.coeff_mk _ _

theorem rootNZPerturbativeSeries_constant (G : MvPolynomial (Fin N) ℂ →ₗ[ℂ] ℂ)
    (hG1 : G 1 = 1) (liNeg : ℕ → ℂ → ℂ) (k : ℕ) (hk : 0 < k)
    (μ f θ : Fin N → ℂ) (ζ : ℂ) (a : (Fin N → Fin k) → ℂ)
    (hS : ∑ m, a m ≠ 0) :
    PowerSeries.constantCoeff (rootNZPerturbativeSeries G liNeg k hk μ f θ ζ a hS) = 1 := by
  rw [← PowerSeries.coeff_zero_eq_constantCoeff_apply, rootNZPerturbativeSeries_coeff]
  simpa only [Nat.mul_zero, PowerSeries.coeff_zero_eq_constantCoeff_apply,
    rootNZFormalIntegrand_constant, hG1] using rootNZAverage_one a hS

theorem rootNZFormalIntegrand_gaussian_odd (G : MvPolynomial (Fin N) ℂ →ₗ[ℂ] ℂ)
    (hGneg : ∀ p, G (MvPolynomial.eval₂ MvPolynomial.C
      (fun i => -MvPolynomial.X i) p) = G p)
    (liNeg : ℕ → ℂ → ℂ) (k : ℕ) (hk : 0 < k)
    (μ f θ : Fin N → ℂ) (ζ : ℂ) (m : Fin N → Fin k) (d : ℕ) (hd : Odd d) :
    G (PowerSeries.coeff d (rootNZFormalIntegrand liNeg k hk μ f θ ζ m)) = 0 := by
  have h := hGneg (PowerSeries.coeff d (rootNZFormalIntegrand liNeg k hk μ f θ ζ m))
  rw [rootNZFormalIntegrand_parity, hd.neg_one_pow, neg_one_mul, map_neg] at h
  linear_combination (-1 / 2 : ℂ) * h

theorem rootNZPerturbativeSeries_integralPowers (G : MvPolynomial (Fin N) ℂ →ₗ[ℂ] ℂ)
    (hGneg : ∀ p, G (MvPolynomial.eval₂ MvPolynomial.C
      (fun i => -MvPolynomial.X i) p) = G p)
    (liNeg : ℕ → ℂ → ℂ) (k : ℕ) (hk : 0 < k)
    (μ f θ : Fin N → ℂ) (ζ : ℂ) (a : (Fin N → Fin k) → ℂ)
    (hS : ∑ m, a m ≠ 0) :
    PowerSeries.expand 2 (by decide) (rootNZPerturbativeSeries G liNeg k hk μ f θ ζ a hS) =
      PowerSeries.mk fun d => rootNZAverage a
        (fun m => G (PowerSeries.coeff d (rootNZFormalIntegrand liNeg k hk μ f θ ζ m))) hS := by
  ext d
  by_cases hd : 2 ∣ d
  · obtain ⟨e, rfl⟩ := hd
    simp only [PowerSeries.coeff_expand_mul, rootNZPerturbativeSeries_coeff, PowerSeries.coeff_mk]
  · rw [PowerSeries.coeff_expand_of_not_dvd 2 (by decide) _ hd, PowerSeries.coeff_mk]
    have hodd := Nat.not_even_iff_odd.mp (fun h => hd h.two_dvd)
    simp only [rootNZFormalIntegrand_gaussian_odd G hGneg liNeg k hk μ f θ ζ _ d hodd,
      rootNZAverage, mul_zero, Finset.sum_const_zero, zero_div]

-- formalNZ_constant: normalization is conditional on the imported bracket.
example (G : MvPolynomial (Fin N) ℂ →ₗ[ℂ] ℂ) (hG1 : G 1 = 1)
    (liNeg : ℕ → ℂ → ℂ) (Q : Matrix (Fin N) (Fin N) ℂ) (μ f z : Fin N → ℂ) :
    PowerSeries.coeff 0 (NZPerturbativeSeries G liNeg Q μ f z) = 1 := by
  rw [PowerSeries.coeff_zero_eq_constantCoeff_apply]
  exact NZPerturbativeSeries_constant G hG1 liNeg Q μ f z

-- formalNZ_odd_moment: this assertion concerns the full t-series, before extraction.
example (G : MvPolynomial (Fin N) ℂ →ₗ[ℂ] ℂ)
    (hGneg : ∀ p, G (MvPolynomial.eval₂ MvPolynomial.C
      (fun i => -MvPolynomial.X i) p) = G p)
    (liNeg : ℕ → ℂ → ℂ) (Q : Matrix (Fin N) (Fin N) ℂ) (μ f z : Fin N → ℂ) :
    G (PowerSeries.coeff 1 (NZFormalIntegrand liNeg Q μ f z)) = 0 :=
  NZFormalIntegrand_gaussian_odd G hGneg liNeg Q μ f z 1 odd_one

-- formalNZ_flattening_gaussian: a scalar flattening term is retained by contraction.
-- Zero mock vertices and these matrix values are algebraic controls only.
example (G : MvPolynomial (Fin 1) ℂ →ₗ[ℂ] ℂ) (hG1 : G 1 = 1) (z : Fin 1 → ℂ) :
    PowerSeries.coeff 1 (NZPerturbativeSeries G (fun _ _ => 0)
      (1 : Matrix (Fin 1) (Fin 1) ℂ) (fun _ => 1) (fun _ => 2) z) = 1 / 2 := sorry

-- formalNZ_normalization: dropping the GSW-to-DG correction produces h/24.
-- Here the GSW integrand is 1 and the uncorrected factor is exp(tx/2-t²/12).
example (G : MvPolynomial (Fin 1) ℂ →ₗ[ℂ] ℂ) (hG1 : G 1 = 1)
    (hGcov : ∀ p, G (MvPolynomial.X (0 : Fin 1) * p) =
      G (MvPolynomial.pderiv (0 : Fin 1) p)) :
    G (PowerSeries.coeff 2 (PowerSeries.subst
      (PowerSeries.monomial 1 (MvPolynomial.C (1 / 2 : ℂ) * MvPolynomial.X (0 : Fin 1)) -
        PowerSeries.monomial 2 (MvPolynomial.C (1 / 12 : ℂ)))
      (PowerSeries.exp (MvPolynomial (Fin 1) ℂ)))) = 1 / 24 := sorry

-- rootNZ_constant: arbitrary finite weights are normalized only when S ≠ 0.
example (G : MvPolynomial (Fin N) ℂ →ₗ[ℂ] ℂ) (hG1 : G 1 = 1)
    (liNeg : ℕ → ℂ → ℂ) (k : ℕ) (hk : 0 < k)
    (μ f θ : Fin N → ℂ) (ζ : ℂ) (a : (Fin N → Fin k) → ℂ) (hS : ∑ m, a m ≠ 0) :
    PowerSeries.coeff 0 (rootNZPerturbativeSeries G liNeg k hk μ f θ ζ a hS) = 1 := by
  rw [PowerSeries.coeff_zero_eq_constantCoeff_apply]
  exact rootNZPerturbativeSeries_constant G hG1 liNeg k hk μ f θ ζ a hS

-- rootNZ_odd_moment: the parity identity holds separately for every residue index.
example (G : MvPolynomial (Fin N) ℂ →ₗ[ℂ] ℂ)
    (hGneg : ∀ p, G (MvPolynomial.eval₂ MvPolynomial.C
      (fun i => -MvPolynomial.X i) p) = G p)
    (liNeg : ℕ → ℂ → ℂ) (k : ℕ) (hk : 0 < k)
    (μ f θ : Fin N → ℂ) (ζ : ℂ) (m : Fin N → Fin k) :
    G (PowerSeries.coeff 1 (rootNZFormalIntegrand liNeg k hk μ f θ ζ m)) = 0 :=
  rootNZFormalIntegrand_gaussian_odd G hGneg liNeg k hk μ f θ ζ m 1 odd_one

-- rootNZ_covariance_scaling: variance k=2 gives h coefficient 1, not 1/2.
example (G : MvPolynomial (Fin 1) ℂ →ₗ[ℂ] ℂ) (hG1 : G 1 = 1)
    (hGcov : ∀ p, G (MvPolynomial.X (0 : Fin 1) * p) =
      2 * G (MvPolynomial.pderiv (0 : Fin 1) p))
    (θ : Fin 1 → ℂ) (ζ : ℂ) (a : (Fin 1 → Fin 2) → ℂ) (hS : ∑ m, a m ≠ 0) :
    PowerSeries.coeff 1 (rootNZPerturbativeSeries G (fun _ _ => 0) 2 (by decide)
      (fun _ => 4) (fun _ => 0) θ ζ a hS) = 1 := sorry

-- rootNZ_flattening_gaussian: the scalar half and the variance-two term add to 3/2.
example (G : MvPolynomial (Fin 1) ℂ →ₗ[ℂ] ℂ) (hG1 : G 1 = 1)
    (hGcov : ∀ p, G (MvPolynomial.X (0 : Fin 1) * p) =
      2 * G (MvPolynomial.pderiv (0 : Fin 1) p))
    (θ : Fin 1 → ℂ) (ζ : ℂ) (a : (Fin 1 → Fin 2) → ℂ) (hS : ∑ m, a m ≠ 0) :
    PowerSeries.coeff 1 (rootNZPerturbativeSeries G (fun _ _ => 0) 2 (by decide)
      (fun _ => 4) (fun _ => 2) θ ζ a hS) = 3 / 2 := sorry

-- rootNZ_valence_three_contraction: Li₀=0, Li₋₁=1, all other mock inputs zero.
-- At k=2 the log coefficients are -x³/24 and x²/16. The cubic pair
-- contributes 5/48; together the h coefficient is 11/48, not 1/8.
example (G : MvPolynomial (Fin 1) ℂ →ₗ[ℂ] ℂ) (hG1 : G 1 = 1)
    (hGcov : ∀ p, G (MvPolynomial.X (0 : Fin 1) * p) =
      2 * G (MvPolynomial.pderiv (0 : Fin 1) p))
    (θ : Fin 1 → ℂ) (ζ : ℂ) (a : (Fin 1 → Fin 2) → ℂ) (hS : ∑ m, a m ≠ 0) :
    PowerSeries.coeff 1 (rootNZPerturbativeSeries G (fun r _ => if r = 1 then 1 else 0)
      2 (by decide) (fun _ => 0) (fun _ => 0) θ ζ a hS) = 11 / 48 := sorry

-- formalNZ_bracket_not_multiplicative: the HB.4 bracket is linear, not a ring map.
example (G : MvPolynomial (Fin 1) ℂ →ₗ[ℂ] ℂ) (hG1 : G 1 = 1)
    (hGcov : ∀ p, G (MvPolynomial.X (0 : Fin 1) * p) =
      G (MvPolynomial.pderiv (0 : Fin 1) p)) :
    G (MvPolynomial.X (0 : Fin 1) ^ 2) = 1 ∧
      G (MvPolynomial.X (0 : Fin 1)) * G (MvPolynomial.X (0 : Fin 1)) = 0 := by
  have hX := hGcov 1
  simp only [mul_one, MvPolynomial.pderiv_one, map_zero] at hX
  have hX2 := hGcov (MvPolynomial.X (0 : Fin 1))
  rw [← pow_two, MvPolynomial.pderiv_X_self, hG1] at hX2
  exact ⟨hX2, by rw [hX, mul_zero]⟩

end NZContractions

end TauCeti.QuantumTopology

/- QT.7 — native Taylor signatures for the figure-eight descendants.
GZ §4.3, equation (4.5), pp. 25–26; §7.1, equations (7.1), (7.3)–(7.5),
pp. 52–53. The exact low-degree controls come from finite coefficient expansion.
The Habiro completion and its Taylor comparison remain HC.1/HC.2 suppliers.
These algebraic series do not provide the knot matrix's nontrivial shape-field rows.
-/
namespace TauCeti.QuantumTopology
namespace DescendantTaylor

/-- The actual unit q=1+t, with integral inverse. -/
def q (R : Type*) [CommRing R] : (PowerSeries R)ˣ where
  val := 1 + PowerSeries.X
  inv := PowerSeries.invOfUnit (1 + PowerSeries.X) 1
  val_inv := PowerSeries.mul_invOfUnit _ 1 (by simp)
  inv_val := PowerSeries.invOfUnit_mul _ 1 (by simp)

variable {R : Type*} [CommRing R]

@[simp] theorem q_val : (q R : PowerSeries R) = 1 + PowerSeries.X := rfl

/-- Integer exponents are powers of a unit; no Laurent denominator is lost. -/
def qpow (m : ℤ) : PowerSeries R := ↑(q R ^ m)

@[simp] theorem qpow_zero : qpow (R := R) 0 = 1 := by simp [qpow]
@[simp] theorem qpow_one : qpow (R := R) 1 = 1 + PowerSeries.X := by simp [qpow]
@[simp] theorem qpow_add (a b : ℤ) :
    qpow (R := R) (a + b) = qpow a * qpow b := by simp [qpow, zpow_add]

@[simp] theorem qpow_constant (m : ℤ) :
    PowerSeries.constantCoeff (qpow (R := R) m) = 1 := by
  let f := Units.map (PowerSeries.constantCoeff (R := R)).toMonoidHom
  have hq : f (q R) = 1 := by
    apply Units.ext
    simp [f, q]
  have h := congrArg Units.val (map_zpow f (q R) m)
  rw [hq, one_zpow] at h
  exact h

def term (m : ℤ) (n : ℕ) : PowerSeries ℤ :=
  (∏ j ∈ range n, (1 - qpow (R := ℤ) (j + 1))) *
    (∏ j ∈ range n, (1 - qpow (R := ℤ) (-(j + 1)))) * qpow (m * n)

theorem term_dvd (m : ℤ) (n : ℕ) :
    (PowerSeries.X : PowerSeries ℤ) ^ (2 * n) ∣ term m n := sorry

theorem term_coeff_zero (m : ℤ) (n d : ℕ) (hd : d < 2 * n) :
    PowerSeries.coeff d (term m n) = 0 := sorry

@[simp] theorem term_zero (m : ℤ) : term m 0 = 1 := by simp [term]

theorem term_one (m : ℤ) :
    term m 1 = -(PowerSeries.X ^ 2) * qpow (m - 1) := sorry

end DescendantTaylor

/-- Knot-specific Taylor series in t=q−1, defined by its stabilized finite coefficients.
The comparison with the imported scalar Habiro completion is a separate obligation. -/
def figureEightDescendantTaylor (m : ℤ) : PowerSeries ℤ :=
  PowerSeries.mk fun d => ∑ n ∈ range (d / 2 + 1),
    PowerSeries.coeff d (DescendantTaylor.term m n)

theorem figureEightDescendantTaylor_coeff (m : ℤ) (d N : ℕ) (hd : d < 2 * N) :
    PowerSeries.coeff d (figureEightDescendantTaylor m) =
      PowerSeries.coeff d (∑ n ∈ range N, DescendantTaylor.term m n) := sorry

theorem figureEightDescendantTaylor_recurrence (m : ℤ) :
    DescendantTaylor.qpow (m + 1) * figureEightDescendantTaylor (m + 1) +
      (1 - 2 * DescendantTaylor.qpow m) * figureEightDescendantTaylor m +
      DescendantTaylor.qpow (m - 1) * figureEightDescendantTaylor (m - 1) = 1 := sorry

@[simp] theorem figureEightDescendantTaylor_constant (m : ℤ) :
    PowerSeries.constantCoeff (figureEightDescendantTaylor m) = 1 := by
  simp [figureEightDescendantTaylor, DescendantTaylor.term]

@[simp] theorem figureEightDescendantTaylor_linear (m : ℤ) :
    PowerSeries.coeff 1 (figureEightDescendantTaylor m) = 0 := by
  simp [figureEightDescendantTaylor, DescendantTaylor.term]

theorem figureEightDescendantTaylor_quadratic (m : ℤ) :
    PowerSeries.coeff 2 (figureEightDescendantTaylor m) = -1 := sorry

theorem figureEightDescendantTaylor_cubic (m : ℤ) :
    PowerSeries.coeff 3 (figureEightDescendantTaylor m) = 1 - m := sorry

/-- The third entry of the trivial first row, over Q[[t]], with the required factor 1/2. -/
def figureEightHalfRowTaylor : PowerSeries ℚ :=
  (1 / 2 : ℚ) •
    (DescendantTaylor.qpow 1 *
      PowerSeries.map (Int.castRingHom ℚ) (figureEightDescendantTaylor 1) -
    DescendantTaylor.qpow (-1) *
      PowerSeries.map (Int.castRingHom ℚ) (figureEightDescendantTaylor (-1)))

def figureEightFirstRowTaylor : Fin 3 → PowerSeries ℚ :=
  ![1, PowerSeries.map (Int.castRingHom ℚ) (figureEightDescendantTaylor 0),
    figureEightHalfRowTaylor]

theorem figureEightHalfRowTaylor_double :
    (2 : ℚ) • figureEightHalfRowTaylor =
      PowerSeries.map (Int.castRingHom ℚ)
        (DescendantTaylor.qpow 1 * figureEightDescendantTaylor 1 -
          DescendantTaylor.qpow (-1) * figureEightDescendantTaylor (-1)) := sorry

theorem figureEightHalfRowTaylor_constant :
    PowerSeries.coeff 0 figureEightHalfRowTaylor = 0 := sorry

theorem figureEightHalfRowTaylor_linear :
    PowerSeries.coeff 1 figureEightHalfRowTaylor = 1 := sorry

theorem figureEightHalfRowTaylor_quadratic :
    PowerSeries.coeff 2 figureEightHalfRowTaylor = -1 / 2 := sorry

theorem figureEightHalfRowTaylor_cubic :
    PowerSeries.coeff 3 figureEightHalfRowTaylor = -3 / 2 := sorry

theorem figureEightHalfRowTaylor_not_integral :
    ¬ ∃ f : PowerSeries ℤ, PowerSeries.map (Int.castRingHom ℚ) f =
      figureEightHalfRowTaylor := by
  rintro ⟨f, hf⟩
  have hc : ((PowerSeries.coeff (R := ℤ) 2 f : ℤ) : ℚ) = -1 / 2 := by
    have h := congrArg (PowerSeries.coeff 2) hf
    simpa [figureEightHalfRowTaylor_quadratic] using h
  have hr : (2 : ℚ) * ((PowerSeries.coeff (R := ℤ) 2 f : ℤ) : ℚ) = -1 := by rw [hc]; norm_num
  have hz : (2 : ℤ) * PowerSeries.coeff 2 f = -1 := by exact_mod_cast hr
  omega

namespace DescendantTaylor

/-- The source convention q=exp(-h), expressed as t=q-1 for formal substitution. -/
def expMinusOne : PowerSeries ℚ := PowerSeries.rescale (-1) (PowerSeries.exp ℚ) - 1

@[simp] theorem expMinusOne_constant :
    PowerSeries.constantCoeff expMinusOne = 0 := by
  unfold expMinusOne
  rw [map_sub, map_one, ← PowerSeries.coeff_zero_eq_constantCoeff_apply,
    PowerSeries.coeff_rescale, PowerSeries.coeff_exp]
  norm_num

theorem expMinusOne_hasSubst : PowerSeries.HasSubst expMinusOne :=
  PowerSeries.HasSubst.of_constantCoeff_zero' expMinusOne_constant

theorem qpow_subst_exp (m : ℤ) :
    PowerSeries.subst expMinusOne (qpow (R := ℚ) m) =
      PowerSeries.rescale (-(m : ℚ)) (PowerSeries.exp ℚ) := sorry

end DescendantTaylor

/-- The descendant Taylor series transported to the exact q=exp(-h) convention. -/
def figureEightDescendantHSeries (m : ℤ) : PowerSeries ℚ :=
  PowerSeries.subst DescendantTaylor.expMinusOne
    (PowerSeries.map (Int.castRingHom ℚ) (figureEightDescendantTaylor m))

def figureEightHalfRowHSeries : PowerSeries ℚ :=
  PowerSeries.subst DescendantTaylor.expMinusOne figureEightHalfRowTaylor

theorem figureEightDescendantHSeries_constant (m : ℤ) :
    PowerSeries.constantCoeff (figureEightDescendantHSeries m) = 1 := by
  change MvPowerSeries.constantCoeff (PowerSeries.subst DescendantTaylor.expMinusOne
    (PowerSeries.map (Int.castRingHom ℚ) (figureEightDescendantTaylor m))) = 1
  rw [PowerSeries.constantCoeff_subst_of_constantCoeff_zero
    DescendantTaylor.expMinusOne_constant]
  rw [← PowerSeries.coeff_zero_eq_constantCoeff_apply, PowerSeries.coeff_map,
    PowerSeries.coeff_zero_eq_constantCoeff_apply, figureEightDescendantTaylor_constant]
  simp

theorem figureEightDescendantHSeries_linear (m : ℤ) :
    PowerSeries.coeff 1 (figureEightDescendantHSeries m) = 0 := sorry

theorem figureEightDescendantHSeries_quadratic (m : ℤ) :
    PowerSeries.coeff 2 (figureEightDescendantHSeries m) = -1 := sorry

theorem figureEightDescendantHSeries_cubic (m : ℤ) :
    PowerSeries.coeff 3 (figureEightDescendantHSeries m) = m := sorry

theorem figureEightDescendantHSeries_recurrence (m : ℤ) :
    PowerSeries.rescale (-(m + 1 : ℚ)) (PowerSeries.exp ℚ) *
        figureEightDescendantHSeries (m + 1) +
      (1 - 2 * PowerSeries.rescale (-(m : ℚ)) (PowerSeries.exp ℚ)) *
        figureEightDescendantHSeries m +
      PowerSeries.rescale (-(m - 1 : ℚ)) (PowerSeries.exp ℚ) *
        figureEightDescendantHSeries (m - 1) = 1 := sorry

theorem figureEightDescendantHSeries_symmetry (m : ℤ) :
    PowerSeries.rescale (-1) (figureEightDescendantHSeries m) =
      figureEightDescendantHSeries (-m) := sorry

theorem figureEightDescendantHSeries_zero_odd (n : ℕ) :
    PowerSeries.coeff (2 * n + 1) (figureEightDescendantHSeries 0) = 0 := sorry

theorem figureEightHalfRowHSeries_low :
    PowerSeries.coeff 0 figureEightHalfRowHSeries = 0 ∧
      PowerSeries.coeff 1 figureEightHalfRowHSeries = -1 ∧
      PowerSeries.coeff 2 figureEightHalfRowHSeries = 0 := sorry

theorem figureEightHalfRowHSeries_cubic :
    PowerSeries.coeff 3 figureEightHalfRowHSeries = 11 / 6 := sorry

-- descendant_Taylor_constant
example (m : ℤ) : PowerSeries.coeff 0 (figureEightDescendantTaylor m) = 1 := by
  rw [PowerSeries.coeff_zero_eq_constantCoeff_apply, figureEightDescendantTaylor_constant]
-- descendant_Taylor_linear
example (m : ℤ) : PowerSeries.coeff 1 (figureEightDescendantTaylor m) = 0 :=
  figureEightDescendantTaylor_linear m
-- descendant_Taylor_cubic
example : PowerSeries.coeff 3 (figureEightDescendantTaylor 1) = 0 ∧
    PowerSeries.coeff 3 (figureEightDescendantTaylor (-1)) = 2 := by
  constructor <;> rw [figureEightDescendantTaylor_cubic] <;> norm_num
-- descendant_Taylor_boundary_term
example : DescendantTaylor.qpow 1 * figureEightDescendantTaylor 1 -
    figureEightDescendantTaylor 0 +
    DescendantTaylor.qpow (-1) * figureEightDescendantTaylor (-1) = 1 := by
  have h := figureEightDescendantTaylor_recurrence 0
  norm_num at h
  simpa [sub_eq_add_neg] using h
-- descendant_Taylor_finite_precision
example (m : ℤ) : PowerSeries.coeff 5 (figureEightDescendantTaylor m) =
    PowerSeries.coeff 5 (∑ n ∈ range 3, DescendantTaylor.term m n) :=
  figureEightDescendantTaylor_coeff m 5 3 (by decide)
-- descendant_half_row_not_integral
example : ¬ ∃ f : PowerSeries ℤ, PowerSeries.map (Int.castRingHom ℚ) f =
    figureEightFirstRowTaylor 2 := by
  simpa [figureEightFirstRowTaylor] using figureEightHalfRowTaylor_not_integral
-- descendant_half_row_linear
example : PowerSeries.coeff 1 (figureEightFirstRowTaylor 2) = 1 := by
  simpa [figureEightFirstRowTaylor] using figureEightHalfRowTaylor_linear
-- descendant_half_row_quadratic
example : PowerSeries.coeff 2 (figureEightFirstRowTaylor 2) = -1 / 2 := by
  simpa [figureEightFirstRowTaylor] using figureEightHalfRowTaylor_quadratic
-- descendant_first_row_constant
example : (fun j => PowerSeries.coeff 0 (figureEightFirstRowTaylor j)) = ![1, 1, 0] := by
  ext j
  fin_cases j <;> simp [figureEightFirstRowTaylor, figureEightHalfRowTaylor_constant]
-- descendant_q_negative_power
example : DescendantTaylor.qpow (R := ℤ) (-1) * (1 + PowerSeries.X) = 1 := by
  rw [← DescendantTaylor.qpow_one, ← DescendantTaylor.qpow_add]
  norm_num
-- descendant_h_convention
example : PowerSeries.coeff 3 (figureEightDescendantHSeries 1) = 1 ∧
    PowerSeries.coeff 3 (figureEightDescendantHSeries (-1)) = -1 := by
  constructor <;> rw [figureEightDescendantHSeries_cubic] <;> norm_num
-- descendant_half_row_h_sign
example : PowerSeries.coeff 1 figureEightHalfRowHSeries = -1 :=
  figureEightHalfRowHSeries_low.2.1
-- descendant_half_row_h_quadratic
example : PowerSeries.coeff 2 figureEightHalfRowHSeries = 0 :=
  figureEightHalfRowHSeries_low.2.2

-- descendant_h_normalization
example (m : ℤ) : PowerSeries.constantCoeff (figureEightDescendantHSeries m) = 1 :=
  figureEightDescendantHSeries_constant m
-- descendant_h_quadratic
example : PowerSeries.coeff 2 (figureEightDescendantHSeries 0) = -1 :=
  figureEightDescendantHSeries_quadratic 0
-- descendant_h_odd
example : PowerSeries.coeff 7 (figureEightDescendantHSeries 0) = 0 :=
  figureEightDescendantHSeries_zero_odd 3
-- descendant_half_row_h_cubic
example : PowerSeries.coeff 3 figureEightHalfRowHSeries = 11 / 6 :=
  figureEightHalfRowHSeries_cubic
-- descendant_summand_zero
example (m : ℤ) : DescendantTaylor.term m 0 = 1 := DescendantTaylor.term_zero m
-- descendant_summand_one
example (m : ℤ) : DescendantTaylor.term m 1 =
    -(PowerSeries.X ^ 2) * DescendantTaylor.qpow (m - 1) := DescendantTaylor.term_one m
-- descendant_summand_two
example (m : ℤ) : PowerSeries.coeff 3 (DescendantTaylor.term m 2) = 0 :=
  DescendantTaylor.term_coeff_zero m 2 3 (by decide)
-- descendant_exp_substitution_low
example : PowerSeries.coeff 1 DescendantTaylor.expMinusOne = -1 ∧
    PowerSeries.coeff 2 DescendantTaylor.expMinusOne = 1 / 2 ∧
    PowerSeries.coeff 3 DescendantTaylor.expMinusOne = -1 / 6 := by
  norm_num [DescendantTaylor.expMinusOne, PowerSeries.coeff_rescale, Nat.factorial]

end TauCeti.QuantumTopology
