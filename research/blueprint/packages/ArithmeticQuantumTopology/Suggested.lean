/-
This file is not the roadmap and is not exhaustive. README.md is definitive.
These statements suggest Lean forms so contributors can converge on names and
signatures. They claim no implementation. The concrete algebraic and analytic
interfaces below do not supply the missing geometric or completed quantum-group carriers.
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
import Mathlib.GroupTheory.FreeAbelianGroup
import Mathlib.GroupTheory.QuotientGroup.Defs
import Mathlib.LinearAlgebra.ExteriorPower.Basic
import Mathlib.Topology.Connected.PathConnected
import Mathlib.Topology.Constructions
import Mathlib.LinearAlgebra.Matrix.Trace
import Mathlib.LinearAlgebra.Matrix.Kronecker
import Mathlib.LinearAlgebra.TensorProduct.Basic
import Mathlib.RingTheory.PowerSeries.Exp
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

-- figureEightKashaev_small
example : figureEightKashaev (-1) = 1 ∧ figureEightKashaev (-1 / 2) = 5 ∧
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
§3.1, (3.5), Lemma 3.1, p. 16; §4.2, (4.14)–(4.15), p. 30. -/
abbrev SL₂ := Matrix.SpecialLinearGroup (Fin 2) ℤ

def rationalPoleFree (γ : SL₂) (x : ℚ) : Prop := (γ 1 0 : ℚ) * x + γ 1 1 ≠ 0

def rationalMobius (γ : SL₂) (x : ℚ) : ℚ :=
  ((γ 0 0 : ℚ) * x + γ 0 1) / ((γ 1 0 : ℚ) * x + γ 1 1)

def denominatorCocycle (γ : SL₂) (x : ℚ) : ℚ :=
  (γ 1 0 : ℚ) / ((x.den : ℚ) * ((γ 1 0 : ℚ) * x.num + (γ 1 1 : ℚ) * x.den))

theorem denominatorCocycle_comp (γ η : SL₂) (x : ℚ)
    (hη : rationalPoleFree η x) (hγη : rationalPoleFree (γ * η) x) :
    denominatorCocycle (γ * η) x =
      denominatorCocycle γ (rationalMobius η x) + denominatorCocycle η x := sorry

theorem rationalPoleFree_mobius (γ η : SL₂) (x : ℚ)
    (hη : rationalPoleFree η x) (hγη : rationalPoleFree (γ * η) x) :
    rationalPoleFree γ (rationalMobius η x) := sorry

theorem rationalMobius_comp (γ η : SL₂) (x : ℚ)
    (hη : rationalPoleFree η x) (hγη : rationalPoleFree (γ * η) x) :
    rationalMobius (γ * η) x = rationalMobius γ (rationalMobius η x) := sorry

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
        tweakedAutomorphyEntry v κ η x := sorry

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
      matrixTransport J j γ (rationalMobius η x) * matrixTransport J j η x := sorry

inductive Provenance where
  | proved | imported | computed | numerical | conjectural
  deriving DecidableEq

inductive LedgerColumn where
  | cyclotomicCoefficients | kashaevValues | invariantsAtRootsOfUnity
  | traceFieldAndBlochClasses | volumeAndChernSimons | asymptoticSeries
  deriving DecidableEq

/-- Different outputs in a column have separate producing nodes and status. -/
structure LedgerEntry where
  column : LedgerColumn
  output : String
  datum : String
  node : String
  status : Provenance

abbrev Ledger := List (String × List LedgerEntry)

/-- Selected ledger entries only; the six-column ledger specification and its
complete-row tests remain in README.md. `proved` records source status,
not a Lean proof. -/
def ledgerRows : Ledger := [
  ("4₁", [
    ⟨.kashaevValues, "orders 1–6", "1,5,13,27,46+2√5,89",
      "ArithmeticQuantumTopology:QT.6/the-kashaev-invariant-and-the-function-on-the-rationals", .computed⟩,
    ⟨.traceFieldAndBlochClasses, "ordinary class", "Q(√−3), 2[exp(πi/3)]",
      "ArithmeticQuantumTopology:QT.5/number-field-geometric-bloch-class", .proved⟩,
    ⟨.asymptoticSeries, "nondegenerate geometric formal series", "GSW normalized unit series",
      "ArithmeticQuantumTopology:QT.6/formal-state-integral-invariance", .proved⟩,
    ⟨.asymptoticSeries, "general matrix RQMC", "conjectural refinement",
      "ArithmeticQuantumTopology:QT.7/matrix-refined-quantum-modularity", .conjectural⟩]),
  ("5₂", [
    ⟨.traceFieldAndBlochClasses, "selected shape field", "Q(ξ), ξ³−ξ²+1=0, Im ξ<0",
      "ArithmeticQuantumTopology:QT.7/representation-indexed-perturbative-family", .computed⟩,
    ⟨.volumeAndChernSimons, "g₃ decay limit", "lim 2πℏ log |g₃| = −Vol",
      "ArithmeticQuantumTopology:QT.6/selected-state-integral-volume", .proved⟩,
    ⟨.asymptoticSeries, "BD positive-q selected modular theorem", "all-orders bounded-denominator asymptotics",
      "ArithmeticQuantumTopology:QT.7/bettin-drappeau-proved-cases", .proved⟩,
    ⟨.asymptoticSeries, "general matrix RQMC", "conjectural refinement",
      "ArithmeticQuantumTopology:QT.7/matrix-refined-quantum-modularity", .conjectural⟩])]

-- ledger_status_consistent: status belongs to an output, not an entire column.
example : ∃ row ∈ ledgerRows, ∃ e ∈ row.2,
    e.column = .asymptoticSeries ∧ e.status = .proved := sorry


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

end TauCeti.QuantumTopology
