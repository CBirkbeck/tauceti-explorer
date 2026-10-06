/-
This file is not the roadmap and is not exhaustive. The roadmap document
`research/blueprint/readmes/ArithmeticQuantumTopology.md` is definitive. These
statements suggest Lean forms so that contributors and reviewers can converge on
names and signatures. They claim no implementation.

BP-ArithmeticQuantumTopology: target-level plan, implementationStatus = unchecked.
Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174;
Tau Ceti f790474821cf4256814db967cb154e7af3d0c369.

Mathlib-only interfaces below expose concrete algebra and analysis. A matrix
cokernel is not a 3-manifold, a shape chart is not the cut-cover quotient, and
linear NZ data is not a triangulation. The missing geometric, quantum, Habiro,
Bloch and dilogarithm carriers are listed by name in the final inventory, with
the packet's supplier/gap boundaries. No unspecified relation subgroup, dummy
invariant or Prop-valued substitute for a missing mathematical condition occurs.
The theorems and examples use sorry; no roadmap result is formalized here.
-/
import Mathlib.CategoryTheory.Monoidal.Braided.Basic
import Mathlib.CategoryTheory.Monoidal.Rigid.Basic
import Mathlib.Algebra.Polynomial.Laurent
import Mathlib.Analysis.Distribution.TemperedDistribution
import Mathlib.Analysis.Complex.CauchyIntegral
import Mathlib.Analysis.SpecialFunctions.Complex.Log
import Mathlib.Analysis.SpecialFunctions.Trigonometric.Complex
import Mathlib.Analysis.SpecialFunctions.Pow.Real
import Mathlib.Data.Matrix.Basis
import Mathlib.Data.ZMod.Basic
import Mathlib.LinearAlgebra.Matrix.IsDiag
import Mathlib.LinearAlgebra.Matrix.ToLin
import Mathlib.LinearAlgebra.Matrix.GeneralLinearGroup.Defs
import Mathlib.LinearAlgebra.Matrix.SpecialLinearGroup
import Mathlib.MeasureTheory.Integral.Bochner.Basic
import Mathlib.RingTheory.Localization.FractionRing
import Mathlib.RingTheory.Polynomial.Chebyshev
import Mathlib.RingTheory.RootsOfUnity.PrimitiveRoots

noncomputable section
open Polynomial LaurentPolynomial Finset MeasureTheory

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

/-! QT.1–QT.2: algebraic colour conventions. The module and quantum trace
are missing, so V below is its character polynomial rather than a fake module. -/
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

/-! QT.5: local logarithmic charts. Full Flattening requires Neumann's actual
cut-cover identifications. Extended pre-Bloch/Bloch groups are omitted pending
G5; no unspecified relation subgroup is used. Geometry stays with its supplier. -/
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
convergence. Meromorphic continuation and its divisor are not invented here. -/
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

/-! QT.7: rational pole exclusions and conditional matrix cocycle algebra.
The knot matrices are not defined by an arbitrary function: this is only the
explicit algebraic transport interface they must satisfy once supplied. -/
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
    (r : Fin n → ℤ) (ζ : ℂ) (θ : Fin n → ℂ) (m : Fin n → Fin k) : ℂ :=
  let quadratic : ℤ := ∑ i, (m i).val * ∑ j, Q i j * (m j).val
  let linear : ℤ := ∑ i, (m i).val * r i
  Complex.exp (-Real.pi * Complex.I * (quadratic : ℂ)) *
    Complex.exp (Real.pi * Complex.I * ((quadratic + linear : ℤ) : ℂ) / (k : ℂ)) *
    ∏ i, (θ i ^ (-(∑ j, Q i j * (m j).val))) /
      (∏ s ∈ range (m i).val, (1 - ζ ^ (s + 1) * (θ i)⁻¹))

/-- Only the finite weighted average, with an actual nonzero denominator.
NZ gluing and root relations belong to the geometric RootNZDatum, omitted below. -/
def rootNZAverage {n k : ℕ} (a g : (Fin n → Fin k) → ℂ)
    (_hS : ∑ m, a m ≠ 0) : ℂ := (∑ m, a m * g m) / ∑ m, a m

theorem rootNZAverage_one {n k : ℕ} (a : (Fin n → Fin k) → ℂ)
    (hS : ∑ m, a m ≠ 0) : rootNZAverage a (fun _ => 1) hS = 1 := sorry

-- rootNZ_denominator: zero weights do not supply the required hypothesis.
example {n k : ℕ} : (∑ _m : Fin n → Fin k, (0 : ℂ)) = 0 := sorry

end TauCeti.QuantumTopology

/-
Exact packet name inventory and omitted signatures

Every node, API and test name is recorded below. The executable interfaces above
cover concrete pieces; they do not claim that the full geometric or completed
objects have been stated. An API/test entry below is a specification comment,
not an elaborated theorem. For each omitted signature the named gap/import tells
what must be made expressible first, as required by PROTOCOL section 13. In
particular no relation subgroup, quotient carrier, analytic comparison predicate,
or conjectural invariant is replaced by an unconstrained Prop or an assumption
that merely repeats the intended conclusion. Once the supplier types exist,
replace the corresponding entries by actual signatures and examples.

The full formal Gaussian vertex expansion awaits the HB.4 filtered series
carrier; the generalized knot asymptotic predicates await G7/G8. No theorem in
this file asserts the omitted topological or analytic results.

ArithmeticQuantumTopology:QT.0/framed-link-and-linking-matrix
Name: framed_link_and_linking_matrix
Carrier/condition boundary: ArithmeticQuantumTopology/G1; tauceti:TauCetiRoadmap/GeometricTopology#layer-4-knot-theory-done-properly-owned-here; tauceti:TauCeti.FramedMarkovBraid; tauceti:TauCeti.MarkovEquiv; tauceti:TauCeti.BasedOrientedGaussCode.writhe
Specification: Import the framed oriented multi-component link carrier from GeometricTopology layer 4. Relative to its Seifert longitude, integer framings f_i and the pairwise linking numbers give the symmetric matrix A with A_ii=f_i and A_ij=lk(L_i,L_j) for i≠j. QT uses this interface, including crossing-sign/writhe compatibility. Tau Ceti FramedOrientedGaussCode describes one knot; FramedMarkovBraid has component framings but MarkovEquiv alone is unframed and supplies no framed link-type quotient.
API linkingMatrix [signature omitted pending the boundary above]: linkingMatrix L is a symmetric integer matrix indexed by the components of L.
API linkingMatrix_symm [signature omitted pending the boundary above]: linkingMatrix L is symmetric: its (i,j) and (j,i) entries agree.
API linkingMatrix_diag [signature omitted pending the boundary above]: The (i,i) entry of linkingMatrix L is the framing of the i-th component.
API IsAlgebraicallySplit [concrete component above; full object still uses stated boundary]: IsAlgebraicallySplit L holds when every off-diagonal entry of linkingMatrix L vanishes.
API linkingMatrix_of_move [signature omitted pending the boundary above]: The linking matrix is unchanged by the moves of the chosen carrier, so it is an invariant of the framed link type.
Test linkingMatrix_unknot [required example; omitted if its carrier/condition is absent]: The linking matrix of the 0-framed unknot is the 1-by-1 zero matrix.
Test linkingMatrix_hopf [required example; omitted if its carrier/condition is absent]: The linking matrix of the 0-framed Hopf link is [[0,1],[1,0]], which is not diagonal, so the Hopf link is not algebraically split.
Test linkingMatrix_blackboard [required example; omitted if its carrier/condition is absent]: For a diagram with the blackboard framing, the diagonal entry of the linking matrix is the writhe of that component; this distinguishes the Seifert normalisation from the blackboard one.
Test not_algebraicallySplit_of_det_ne [required example; omitted if its carrier/condition is absent]: A two-component link whose linking matrix has a nonzero off-diagonal entry is not algebraically split; in particular the Hopf link is a non-example.

ArithmeticQuantumTopology:QT.0/surgery-presentation
Name: surgery_presentation
Carrier/condition boundary: ArithmeticQuantumTopology/G1; tauceti:TauCetiRoadmap/GeometricTopology#layer-5-dehn-surgery; mathlib:Matrix.det
Specification: Import integral Dehn surgery on a framed link L in oriented S³: the meridian of the attached solid torus maps to f_i μ_i+λ_i, with λ_i the Seifert longitude. The oriented result has H₁≅coker(A:ℤ^m→ℤ^m); it is an integral homology sphere iff det A=±1. Empty surgery is S³; split union gives connected sum. The ordinary construction and Mayer–Vietoris calculation belong to GeometricTopology, Part II where its layer 5 lacks this exact interface.
API surgery [signature omitted pending the boundary above]: surgery L is the closed oriented 3-manifold obtained by surgery on the framed link L.
API surgery_empty [signature omitted pending the boundary above]: Surgery on the empty framed link is the 3-sphere.
API homology_surgery [signature omitted pending the boundary above]: The first homology of surgery L is the cokernel of linkingMatrix L.
API isIntegralHomologySphere_iff [signature omitted pending the boundary above]: surgery L is an integral homology sphere if and only if the determinant of linkingMatrix L is a unit.
API surgery_disjoint_union [signature omitted pending the boundary above]: Surgery on a split union of framed links is the connected sum of the surgeries.
Test surgery_empty_eq_sphere [required example; omitted if its carrier/condition is absent]: Surgery on the empty link is the 3-sphere, so the invariant of the empty presentation must be the invariant of the 3-sphere.
Test surgery_unknot_pm_one [required example; omitted if its carrier/condition is absent]: Surgery on the plus-one-framed unknot is again the 3-sphere: a definition that gave a different manifold here would be wrong.
Test homology_surgery_unknot_p [required example; omitted if its carrier/condition is absent]: Surgery on the p-framed unknot has first homology cyclic of order the absolute value of p; for p = 0 this is infinite cyclic, so that presentation is not an integral homology sphere.

ArithmeticQuantumTopology:QT.0/admissible-framed-link
Name: admissible_framed_link
Carrier/condition boundary: Local prerequisites in the definitive packet; see its exact hypotheses.
Specification: L is admissible iff its linking matrix is diagonal with diagonal entries in {1,−1}. Equivalently L is algebraically split and unit-framed. This is a predicate on the imported link type; existence of an admissible presentation is a separate theorem. Surgery on an admissible L is an integral homology sphere.
API IsAdmissible [concrete component above; full object still uses stated boundary]: IsAdmissible L holds when L is algebraically split and every framing is plus or minus one.
API isAdmissible_iff [concrete component above; full object still uses stated boundary]: IsAdmissible L holds if and only if linkingMatrix L is diagonal with all diagonal entries of absolute value one.
API isIntegralHomologySphere_of_isAdmissible [signature omitted pending the boundary above]: If L is admissible then surgery L is an integral homology sphere.
API isAdmissible_empty [concrete component above; full object still uses stated boundary]: The empty framed link is admissible.
Test isAdmissible_unknot_one [required example; omitted if its carrier/condition is absent]: The plus-one-framed unknot is admissible.
Test not_isAdmissible_unknot_zero [required example; omitted if its carrier/condition is absent]: The 0-framed unknot is not admissible; this is the case that separates admissibility from the algebraically split condition alone.
Test not_isAdmissible_hopf [required example; omitted if its carrier/condition is absent]: The unit-framed Hopf link is not admissible, since its off-diagonal linking number is 1.

ArithmeticQuantumTopology:QT.0/kirby-and-fenn-rourke-moves
Name: kirby_and_fenn_rourke_moves
Carrier/condition boundary: tauceti:TauCetiRoadmap/GeometricTopology#layer-5-dehn-surgery
Specification: Import Kirby equivalence (isotopy, split ±1-unknot stabilization and handle slides) and the equivalent Fenn–Rourke ±1-unknot local twisting calculus. On a symmetric linking matrix a slide is PᵀAP with P=I+E_ji; for i≠j its new ii-entry is A_ii+A_jj+2A_ij. Ordinary moves and their surgery theorem are requested from GeometricTopology, Part II, rather than duplicated in QT.
API IsKirbyMove [signature omitted pending the boundary above]: IsKirbyMove L L' holds when L' is obtained from L by one blow-up, blow-down or handle slide.
API IsFennRourkeMove [signature omitted pending the boundary above]: IsFennRourkeMove L L' holds when L' is obtained from L by one Fenn-Rourke twist.
API surgery_eq_of_isKirbyMove [signature omitted pending the boundary above]: A Kirby move does not change the surgered manifold up to orientation-preserving homeomorphism.
API linkingMatrix_congr_of_handleSlide [concrete component above; full object still uses stated boundary]: A handle slide changes the linking matrix by congruence with a unimodular matrix.
API kirbyEquiv [signature omitted pending the boundary above]: kirbyEquiv is the equivalence relation generated by isotopy and Kirby moves.
Test kirbyEquiv_empty_unknot_one [required example; omitted if its carrier/condition is absent]: The empty link and the plus-one-framed unknot are Kirby equivalent, since one blow-down relates them.
Test framing_of_handleSlide [required example; omitted if its carrier/condition is absent]: Sliding L_1 over L_2 in the 0-framed Hopf link changes the framing of the first component by f_2 + 2 lk = 0 + 2, which pins the sign convention.
Test not_kirbyEquiv_of_ne_homology [required example; omitted if its carrier/condition is absent]: Two framed links whose cokernels are non-isomorphic groups are not Kirby equivalent, since surgery is invariant; the 0-framed and 3-framed unknots are a non-example pair.

ArithmeticQuantumTopology:QT.0/hoste-move
Name: hoste_move
Carrier/condition boundary: Local prerequisites in the definitive packet; see its exact hypotheses.
Specification: A Hoste move is a Fenn–Rourke move between admissible framed links, including its inverse. The component removed is an unknotted ±1-framed component algebraically unlinked from every remaining component; deletion gives a ∓1 full twist of the strands through its spanning disc. hosteEquiv is the equivalence closure together with ambient isotopy. Both endpoint conditions are explicit; no claim is made that a move on an admissible source generally destroys admissibility.
API IsHosteMove [signature omitted pending the boundary above]: IsHosteMove L L' holds when L and L' are admissible and related by one Fenn-Rourke move.
API hosteEquiv [signature omitted pending the boundary above]: hosteEquiv is the equivalence relation on admissible framed links generated by isotopy and Hoste moves.
API isFennRourkeMove_of_isHosteMove [signature omitted pending the boundary above]: Every Hoste move is a Fenn-Rourke move.
API hosteEquiv_refl [signature omitted pending the boundary above]: hosteEquiv is reflexive on admissible links.
Test isHosteMove_blowdown_unknot [required example; omitted if its carrier/condition is absent]: Deleting a split plus-one-framed unknot from an admissible link is a Hoste move.
Test not_isHosteMove_of_framing_two [required example; omitted if its carrier/condition is absent]: Removing a 2-framed unknot is not a Hoste move: its source is not unit-framed.
Test hosteEquiv_of_isotopy [required example; omitted if its carrier/condition is absent]: Isotopic admissible links are Hoste equivalent.

ArithmeticQuantumTopology:QT.0/refined-kirby-calculus
Name: refined_kirby_calculus
Carrier/condition boundary: Local prerequisites in the definitive packet; see its exact hypotheses.
Specification: Two admissible framed links in S³ have orientation-preserving homeomorphic surgery results iff they are related by isotopy and Hoste moves. Labels/orientations used in the proof are auxiliary; the theorem is on unoriented unordered surgery links. It proves invariance using admissible intermediate presentations, without denying the ordinary Kirby-equivalence characterization.

ArithmeticQuantumTopology:QT.0/refined-presentation-existence
Name: refined_presentation_existence
Carrier/condition boundary: ArithmeticQuantumTopology/G1; tauceti:TauCetiRoadmap/GeometricTopology#layer-5-dehn-surgery
Specification: Every closed connected oriented integral homology 3-sphere admits surgery on an algebraically split ±1-framed link in S³.

ArithmeticQuantumTopology:QT.1/quantized-enveloping-algebra
Name: quantized_enveloping_algebra
Carrier/condition boundary: ArithmeticQuantumTopology/G2; mathlib:HopfAlgebra; tauceti:TauCetiRoadmap/RepresentationTheory/LieHighestWeight#layer-3-enveloping-algebra-verma-modules-and-lλ; mathlib:AdicCompletion; mathlib:UniformSpace.Completion
Specification: Over ℚ[[h]] put q=exp(h), v=exp(h/2), K=exp(hH/2). U_h(sl₂) is the h-adically complete algebra with [H,E]=2E, [H,F]=−2F, [E,F]=(K−K⁻¹)/(v−v⁻¹), interpreted by its h-adic expansion. Set e=(v−v⁻¹)E and F̃^(n)=F^nK^n/[n]_q!=v^(−n(n−1)/2)F^(n)K^n. Habiro U_q is the ℤ[q±1]-subalgebra generated by K±1,e,F̃^(n); U_q^ev uses K±2. Their PBW bases are F̃^(i)K^je^k and F̃^(i)K^(2j)e^k. U_q=U_q^ev⊕K U_q^ev. For F_p=U_q e^p U_q take the image of lim U_q/F_p in U_h and the induced tensor-power completion; do not assert injectivity of the preimage completion.
API Uq [signature omitted pending the boundary above]: The ℤ[q±1]-subalgebra generated by e=(v−v⁻¹)E, K±1 and F̃^(n)=F^nK^n/[n]_q!.
API Uqev [signature omitted pending the boundary above]: The ℤ[q±1]-subalgebra generated by e, K±2 and F̃^(n); q=v².
API basis_Uq [signature omitted pending the boundary above]: The ordered F̃^(i)K^je^k form a free ℤ[q±1]-basis; replace j by 2j for the even form.
API Uqev_le_Uq [signature omitted pending the boundary above]: Uqev is a subalgebra of Uq stable under Uq’s adjoint action.
API completion [signature omitted pending the boundary above]: The completed integral form is the image of the inverse limit for F_p=Uq e^p Uq in U_h; its tensor-power image completions are algebras. No injectivity of the inverse-limit map is presumed.
Test basis_freeness [required example; omitted if its carrier/condition is absent]: The ordered F̃^(i)K^je^k are linearly independent over ℤ[q±1], with the stated K factors and q-divided-power normalization.
Test Uqev_ne_Uq [required example; omitted if its carrier/condition is absent]: K itself lies in Uq and not in Uqev, so the two forms are different.
Test classical_limit [required example; omitted if its carrier/condition is absent]: U_h/hU_h is the classical ℚ-enveloping algebra of sl₂; h is a parameter of the ambient complete algebra, not an element asserted in the integral coefficient ring ℤ[q±1].

ArithmeticQuantumTopology:QT.1/ribbon-structure
Name: ribbon_structure
Carrier/condition boundary: Local prerequisites in the definitive packet; see its exact hypotheses.
Specification: U_h(sl₂) has ΔH=H⊗1+1⊗H, ΔE=E⊗1+K⊗E, ΔF=F⊗K⁻¹+1⊗F, S(H)=−H, S(E)=−K⁻¹E, S(F)=−FK. With D=exp(hH⊗H/4), R=D Σ_n v^(n(n−1)/2)(v−v⁻¹)^n/[n]! F^n⊗E^n. If R=Σ α⊗β, the ribbon element is r=Σ S(α)K⁻¹β and the pivotal element is κ=K⁻¹. Positive framing acts by r⁻¹, with scalar q^(n(n+2)/4) on V_n. All infinite sums live in specified h-adic completed tensor products.
API universalR [signature omitted pending the boundary above]: The universal R-matrix of U_h, an invertible element of the completed tensor square.
API yangBaxter [signature omitted pending the boundary above]: The universal R-matrix satisfies the Yang-Baxter equation.
API ribbonElement [signature omitted pending the boundary above]: The ribbon element is a central invertible element with the standard compatibility with the coproduct and antipode.
API braidedCategory_modules [signature omitted pending the boundary above]: The category of finite-rank topologically free U_h-modules is braided, with braiding given by the R-matrix.
API rigidCategory_modules [signature omitted pending the boundary above]: The same category is rigid, with duals given by the antipode and the grouplike element.
Test ribbon_unknot_framing [required example; omitted if its carrier/condition is absent]: A positive unit framing acts by r⁻¹, hence by q^(n(n+2)/4) on V_n. Using r instead reverses the anomaly.
Test R_matrix_classical_limit [required example; omitted if its carrier/condition is absent]: Modulo h the R-matrix is the identity, so the braiding degenerates to the symmetry of the classical category.
Test quantum_dimension_V1 [required example; omitted if its carrier/condition is absent]: The quantum dimension of the 2-dimensional module is the quantum integer [2], not 2; a definition returning the ordinary dimension is wrong.

ArithmeticQuantumTopology:QT.1/braided-hopf-structure
Name: braided_hopf_structure
Carrier/condition boundary: Local prerequisites in the definitive packet; see its exact hypotheses.
Specification: The braided Hopf algebra structure of the braided transmutation of U_h induces a braided Hopf algebra structure with invertible antipode on the h-adic completion of the even integral form; that is, each of the braided structure maps, and the inverses of the braiding and the antipode, carries the completed even form into the appropriate completed tensor power.

ArithmeticQuantumTopology:QT.1/bottom-tangle
Name: bottom_tangle
Carrier/condition boundary: tauceti:TauCetiRoadmap/GeometricTopology#layer-4-knot-theory-done-properly-owned-here
Specification: An n-component bottom tangle is a framed oriented union of n arcs in the cube with the i-th arc from bottom endpoint 2i to 2i−1 and no closed component. Closure by exterior arcs gives a framed link; every framed link has such a presentation. Juxtaposition tensors bottom tangles. Composition is the action of Habiro’s category B (objects b^m, suitable tangle morphisms b^m→b^n) on bottom tangles, rather than arbitrary vertical stacking of two all-bottom tangles.
API BottomTangle [signature omitted pending the boundary above]: BottomTangle n is the type of n-component bottom tangles up to isotopy.
API closure [signature omitted pending the boundary above]: closure sends a bottom tangle to a framed oriented link with the same number of components.
API closure_surjective [signature omitted pending the boundary above]: Every framed oriented link is the closure of some bottom tangle.
API bottomTangleAction [signature omitted pending the boundary above]: A B-morphism b^m→b^n acts on an m-component bottom tangle to give an n-component bottom tangle.
API tensor [signature omitted pending the boundary above]: Juxtaposition gives BT_m×BT_n→BT_(m+n).
Test closure_trivial [required example; omitted if its carrier/condition is absent]: The closure of the trivial bottom tangle is the zero-framed unlink.
Test closure_of_bottom_knot [required example; omitted if its carrier/condition is absent]: A one-component bottom tangle closes to a knot; the number of components is preserved.
Test bottomTangle_not_closed [required example; omitted if its carrier/condition is absent]: A tangle with a closed component is not a bottom tangle; this excludes the degenerate case where the universal invariant would already be a trace.

ArithmeticQuantumTopology:QT.1/universal-sl2-invariant
Name: universal_sl2_invariant
Carrier/condition boundary: Local prerequisites in the definitive packet; see its exact hypotheses.
Specification: For T∈BT_n the bead-reading rule gives J_T∈U_h completed⊗n, invariant under framed tangle isotopy and in the diagonal adjoint-invariant submodule. Crossings use R±1, local turns use the pivotal data, and products are read from right to left along the oriented components. J of the trivial bottom tangle is 1⊗⋯⊗1; tensor is juxtaposition and B-actions are represented by the corresponding braided structure maps.
API J [signature omitted pending the boundary above]: J T is the universal invariant of the bottom tangle T, an element of the completed n-fold tensor power.
API J_trivial [signature omitted pending the boundary above]: The universal invariant of the trivial bottom tangle is the unit.
API J_bottomTangleAction [signature omitted pending the boundary above]: J intertwines the category B action with the specified braided Hopf maps, where that action is defined.
API J_tensor [signature omitted pending the boundary above]: The universal invariant of a juxtaposition is the tensor product of the invariants.
API J_mem_invariants [signature omitted pending the boundary above]: The universal invariant lies in the adjoint-invariant part of the completed tensor power.
Test J_unknot_zero_framed [required example; omitted if its carrier/condition is absent]: The universal invariant of the 0-framed unknotted bottom tangle is the unit.
Test J_framing_change [required example; omitted if its carrier/condition is absent]: Adding a positive kink inserts r⁻¹ in the bead product; invariance under an unframed Reidemeister-I move would lose the framing.
Test J_hopf_nontrivial [required example; omitted if its carrier/condition is absent]: The universal invariant of the bottom tangle closing to the Hopf link is not the unit, so the invariant sees linking.

ArithmeticQuantumTopology:QT.1/universal-invariant-integrality
Name: universal_invariant_integrality
Carrier/condition boundary: Local prerequisites in the definitive packet; see its exact hypotheses.
Specification: For an algebraically split AND 0-framed n-component bottom tangle T, J_T lies in Inv((completed U_q^ev) completed⊗n), where completion means the image of the e-power tensor filtration in U_h completed⊗n. No conclusion of this form is claimed for every 0-framed link.

ArithmeticQuantumTopology:QT.2/coloured-jones
Name: coloured_jones
Carrier/condition boundary: Local prerequisites in the definitive packet; see its exact hypotheses.
Specification: For a framed m-component oriented link presented as closure of T, put J_L(V_(n₁),…,V_(n_m))=(tr_q^(V_n₁)⊗⋯⊗tr_q^(V_nm))(J_T). This is independent of T and multilinear in virtual colors. The empty link has value 1; the zero-framed unknot has [n+1]. Generic framed values may need ℤ[q^(±1/4)]; even framings give ℤ[v±1], and algebraically split zero-framed links give ℤ[q±1]. Positive framing on a V_n component multiplies by q^(n(n+2)/4). For a zero-framed knot define J^red_(K,N)=J_K(V_(N−1))/[N] as a Laurent polynomial by the divisibility theorem before root evaluation, N≥1.
API colouredJones [signature omitted pending the boundary above]: colouredJones L n is the coloured Jones polynomial of the framed link L with the given colours.
API colouredJones_unknot [signature omitted pending the boundary above]: The 0-framed unknot coloured by V_n has value the quantum integer [n+1].
API colouredJones_multilinear [signature omitted pending the boundary above]: The coloured Jones invariant is multilinear in the colours, hence extends to the representation ring.
API reducedJones [signature omitted pending the boundary above]: The reduced coloured Jones polynomial is the quotient by the value of the unknot with the same colour.
API colouredJones_framing_change [signature omitted pending the boundary above]: Changing the framing of a component multiplies the invariant by the ribbon scalar of its colour.
Test colouredJones_unknot_V1 [required example; omitted if its carrier/condition is absent]: The 0-framed unknot coloured by the 2-dimensional module has value the quantum integer [2], not 1; a definition returning 1 is the reduced one.
Test colouredJones_positive_framing [required example; omitted if its carrier/condition is absent]: The +1-framed unknot in color V₁ has q^(3/4)(v+v⁻¹), not merely [2].
Test colouredJones_split_union [required example; omitted if its carrier/condition is absent]: For a split union the invariant is the product of the invariants, so a definition that failed multiplicativity would be wrong.

ArithmeticQuantumTopology:QT.2/p-basis
Name: p_basis
Carrier/condition boundary: Local prerequisites in the definitive packet; see its exact hypotheses.
Specification: In ℚ(v)[X]=R_ℚ(v), X=V₁, define {a}=v^a−v⁻a, {n}!=∏_(j=1)^n{j}, {a}_b=∏_(j=0)^(b−1){a−j}. Set P_n=∏_(i=0)^(n−1)(X−v^(2i+1)−v^(−2i−1)), P′_n=P_n/{n}!, P″_n=P_n/{2n+1}_(2n), and P̃′_n=v^(−n(n−1)/2)P′_n. P_n is monic and forms a triangular basis over ℤ[v±1]; the three rescalings are distinct elements in the fraction-field representation algebra.
API P [concrete component above; full object still uses stated boundary]: The exact monic product P_n in R_A.
API P_prime [concrete component above; full object still uses stated boundary]: P′_n=P_n/{n}! in R_ℚ(v).
API P_doublePrime [concrete component above; full object still uses stated boundary]: P″_n=P_n/{2n+1}_(2n).
API P_tildePrime [concrete component above; full object still uses stated boundary]: P̃′_n=v^(−n(n−1)/2)P′_n.
API P_basis [concrete component above; full object still uses stated boundary]: The P_n form a monic triangular A-basis.
Test P_zero_eq_one [required example; omitted if its carrier/condition is absent]: P₀=P′₀=P″₀=1.
Test P_one [required example; omitted if its carrier/condition is absent]: P₁=X−v−v⁻¹.
Test P_rescalings_distinct [required example; omitted if its carrier/condition is absent]: P″₁=P₁/({3}{2}) whereas P′₁=P₁/{1}; the denominators are different.

ArithmeticQuantumTopology:QT.2/dual-basis-pairing
Name: dual_basis_pairing
Carrier/condition boundary: Local prerequisites in the definitive packet; see its exact hypotheses.
Specification: For m,n≥0, tr_q^(P″_m)(σ_n)=δ_mn, where the trace is linearly extended over ℚ(v) and σ_n has the Casimir normalization above.

ArithmeticQuantumTopology:QT.2/cyclotomic-expansion
Name: cyclotomic_expansion
Carrier/condition boundary: Local prerequisites in the definitive packet; see its exact hypotheses.
Specification: For a zero-framed bottom knot T with closure K there are unique a_i(K)∈ℤ[q±1], a₀=1, with J_T=Σ_i a_i(K)σ_i and a_i(K)=J_K(P″_i). In ordinary colors J_K(V_n)=Σ_(i=0)^n ({n+1+i}_(2i+1)/{1}) a_i(K). The reduced polynomial J^red_(K,N) is obtained by dividing this identity by [N] before evaluation; Habiro’s name “reduced Jones polynomial” a_i is a different normalization from J^red_(K,N).

ArithmeticQuantumTopology:QT.2/algebra-P-and-completion
Name: algebra_P_and_completion
Carrier/condition boundary: mathlib:UniformSpace.Completion
Specification: Let P be the ℤ[q±1]-span of P̃′_n in R_ℚ(v), q=v²; it is a subalgebra, not the ℤ[v±1]-span of unnormalized P_n. P_k=span_(ℤ[q±1]){P̃′_n:n≥k} is an ideal and P̂=lim P/P_k, with unique formal coordinates in P̃′_n. In the P′ basis P′_m P′_n=Σ_(i=0)^min(m,n) {m+n}!/({i}!{m−i}!{n−i}!) P′_(m+n−i); rescaling gives integral ℤ[q±1] structure coefficients for P̃′.
API algebraP [concrete component above; full object still uses stated boundary]: The ℤ[q±1]-linear span of P̃′_n=v^(−n(n−1)/2)P_n/{n}! in ℚ(v)[V₁], with q=v².
API mul_P [signature omitted pending the boundary above]: The displayed P′ multiplication rule, transported to the integral tilde basis.
API algebraP_isSubalgebra [concrete component above; full object still uses stated boundary]: The span of P̃′_n is closed under products and contains 1, so is a ℤ[q±1]-subalgebra of ℚ(v)[V₁].
API filtration [concrete component above; full object still uses stated boundary]: P_k is the ℤ[q±1]-span of P̃′_n for n≥k; it is an ideal of P and P_kP_l⊂P_max(k,l).
API completion [signature omitted pending the boundary above]: The inverse limit P̂=lim P/P_k has unique convergent coordinates in P̃′_n, with coefficients in ℤ[q±1].
Test P_zero_eq_one [required example; omitted if its carrier/condition is absent]: P 0 is the unit of the algebra.
Test mul_P_one_one [required example; omitted if its carrier/condition is absent]: P′₁P′₁=({2}!/{1}!²)P′₂+({2}!/{1}!)P′₁; the coefficients change upon tilde rescaling.
Test twistElement_not_mem [required example; omitted if its carrier/condition is absent]: The twist element lies in the completion and not in the algebra, so the completion step is necessary.

ArithmeticQuantumTopology:QT.2/integrality-algebraically-split
Name: integrality_algebraically_split
Carrier/condition boundary: HabiroCyclotomicCompletions:HC.1/the-cyclotomic-completion
Specification: For an m-component algebraically split zero-framed L, colors x_i∈P_(k_i), and k=max_i k_i, J_L(x₁,…,x_m) belongs to ({2k+1}_(q,k+1)/{1}_q)ℤ[q±1], where {a}_q=q^a−1 and {a}_(q,b)=∏_(j=0)^(b−1){a−j}_q. The empty link has value 1 separately. Consequently the multilinear map extends continuously P̂^m→ℤ[q]^ℕ, the Habiro ring.

ArithmeticQuantumTopology:QT.2/quantum-trace-integrality
Name: quantum_trace_integrality
Carrier/condition boundary: Local prerequisites in the definitive packet; see its exact hypotheses.
Specification: For x∈U_q^ev and y∈P, tr_q^y(x) lies in ℤ[q±1]. Both the even form and the tilde-normalized ℤ[q±1] color lattice are necessary hypotheses of the stated theorem.

ArithmeticQuantumTopology:QT.2/coloured-jones-determination
Name: coloured_jones_determination
Carrier/condition boundary: Local prerequisites in the definitive packet; see its exact hypotheses.
Specification: For a zero-framed knot and n≥1, the values J_K(V₀),…,J_K(V_(n−1)) determine a₀,…,a_(n−1) exactly and determine J_K(V_n) modulo ({2n+1}_(2n)) in ℤ[v±1]. The new term has coefficient {2n+1}_(2n+1)/{1}={2n+1}_(2n). This is a finite triangular consequence, not reconstruction of a knot from its invariants.

ArithmeticQuantumTopology:QT.3/twist-element
Name: twist_element
Carrier/condition boundary: Local prerequisites in the definitive packet; see its exact hypotheses.
Specification: In P̂ define ω±=Σ_(n≥0)(±1)^n v^(±n(n+3)/2)P′_n, equivalently an integral ℤ[q±1] series in P̃′_n. These satisfy ω+ω−=1. For the Hopf pairing with the even representation subalgebra S_ℚ(v)=span{V_(2j)}, ⟨ω±,x⟩=J_(U±)(x). This characterization is only on even colors, not every element of the full representation algebra. In particular ⟨ω±,V₀⟩=1.
API omega [signature omitted pending the boundary above]: omega is the twist element of the completed cyclotomic algebra, in the two sign variants.
API pairing_omega [signature omitted pending the boundary above]: The equality with the ±1-framed unknot pairing holds on S_ℚ(v), the even-color subalgebra.
API omega_mul_inv [signature omitted pending the boundary above]: The two twist elements are mutually inverse in the completed algebra.
API omega_mem_completion [signature omitted pending the boundary above]: The twist element lies in the completion of the cyclotomic algebra and not in the algebra itself.
API omega_coeff [signature omitted pending the boundary above]: The coefficients of the twist element in the cyclotomic basis are explicit Laurent polynomials.
Test pairing_omega_V0 [required example; omitted if its carrier/condition is absent]: ⟨ω±,V₀⟩=1.
Test omega_plus_mul_omega_minus [required example; omitted if its carrier/condition is absent]: The product of the two twist elements is 1, which is the algebraic shadow of blowing up and then blowing down.
Test omega_not_finite [required example; omitted if its carrier/condition is absent]: The twist element has infinitely many non-zero cyclotomic coefficients, so it is not an element of the uncompleted algebra.

ArithmeticQuantumTopology:QT.3/twisting-theorem
Name: twisting_theorem
Carrier/condition boundary: Local prerequisites in the definitive packet; see its exact hypotheses.
Specification: For algebraically split zero-framed L=L₁∪⋯∪L_m∪K with K unknotted and colors x_i∈P̂, surgery of sign ε=±1 along K satisfies J_(L_(K,ε))(x₁,…,x_m)=J_L(x₁,…,x_m,ω^(−ε)). The remaining link stays zero-framed in this algebraically split setting; the opposite exponent is essential.

ArithmeticQuantumTopology:QT.3/definition-of-JM
Name: definition_of_JM
Carrier/condition boundary: HabiroCyclotomicCompletions:HC.1/the-cyclotomic-completion
Specification: For an integral homology sphere M with admissible presentation L of component framings f_i=±1, let L⁰ be the underlying zero-framed link and set J_M=J_(L⁰)(ω^(−f₁),…,ω^(−f_m))∈ℤ[q]^ℕ. There is no product of unknot denominators in this formula. Convergence comes from QT.2’s algebraically split zero-framed multilinear extension, whose filtration generator at maximal color index tends to zero in the Habiro topology. Empty surgery gives 1.
API unifiedInvariantOfPresentation [signature omitted pending the boundary above]: The exact formula J_(L⁰)(ω^(−f_i)) in the Habiro ring, with no division.
API unifiedInvariant_empty [signature omitted pending the boundary above]: The empty admissible link gives the element 1.
API summable [signature omitted pending the boundary above]: The defining sum converges in the Habiro ring, by the divisibility theorem.
API unifiedInvariant_mirror [signature omitted pending the boundary above]: Reverse the orientation of the surgered 3-manifold by mirroring the surgery link and negating its framings: J_(−M)(q)=J_M(q⁻¹). Reversing component orientations alone is not this operation.
Test unified_empty [required example; omitted if its carrier/condition is absent]: The empty presentation gives 1, so the invariant of the 3-sphere is 1.
Test unified_unknot_pm_one [required example; omitted if its carrier/condition is absent]: The plus-one-framed unknot also presents the 3-sphere and must give 1; this is the first non-trivial instance of independence.
Test unified_converges [required example; omitted if its carrier/condition is absent]: The defining sum has terms divisible by higher and higher q-shifted factorials, so it converges in the Habiro ring; a formula without that divisibility would not define an element.

ArithmeticQuantumTopology:QT.3/JM-well-defined
Name: JM_well_defined
Carrier/condition boundary: ArithmeticQuantumTopology/G1
Specification: For an integral homology sphere M the element of the Habiro ring defined by the surgery formula does not depend on the choice of admissible framed link presenting M. Hence the assignment of that element to M is an invariant of integral homology spheres with values in the Habiro ring.

ArithmeticQuantumTopology:QT.3/JM-divisibility
Name: JM_divisibility
Carrier/condition boundary: Local prerequisites in the definitive packet; see its exact hypotheses.
Specification: For every integral homology sphere M the element J_M minus 1 is divisible in the Habiro ring by the product of the second and third cyclotomic-type factors, namely by (q squared minus 1)(q cubed minus 1) divided by (q minus 1).

ArithmeticQuantumTopology:QT.3/JM-connected-sum-and-orientation
Name: JM_connected_sum_and_orientation
Carrier/condition boundary: tauceti:TauCetiRoadmap/GeometricTopology#layer-1-manifold-library-buildout-general-dimension-general-structure-group; HabiroCyclotomicCompletions:HC.1/the-cyclotomic-completion
Specification: The unified invariant is multiplicative under connected sum, so that the invariant of a connected sum is the product of the invariants, and the invariant of the 3-sphere is 1. Reversing the orientation of an integral homology sphere replaces the invariant by the image of the invariant under the ring involution sending q to its inverse.

ArithmeticQuantumTopology:QT.4/WRT-invariant-at-a-root
Name: WRT_invariant_at_a_root
Carrier/condition boundary: mathlib:IsPrimitiveRoot
Specification: For r≥2 choose ξ primitive of order 4r and ζ=ξ⁴. Evaluate q^(1/4) at ξ. Let Ω_r=Σ_(i=0)^(r−2)[i+1]V_i and I_ζ(L)=ev_ξ J_L(Ω_r,…,Ω_r). For a surgery matrix with positive/negative inertia σ± define τ_(ζ,ξ)(M)=I_ζ(L)/(I_ζ(U+)^σ+ I_ζ(U−)^σ−), with both Gauss values nonzero. It is invariant under ordinary Kirby moves. For an integral homology sphere it is independent of ξ and written τ_ζ(M); for general closed M retain ξ. At ζ=1 the source defines τ₁(M)=1 by convention.
API wrtWithLift [signature omitted pending the boundary above]: The normalized surgery quotient retaining ζ and ξ.
API wrt [signature omitted pending the boundary above]: The IHS invariant after lift-independence, and the ζ=1 convention.
API wrt_sphere [signature omitted pending the boundary above]: τ(S³)=1.
API wrt_kirby_invariant [signature omitted pending the boundary above]: Ω_r handles slides and the two Gauss factors cancel stabilizations.
API wrt_connected_sum [signature omitted pending the boundary above]: The normalized invariant is multiplicative under connected sum in the source normalization.
Test wrt_sphere_one [required example; omitted if its carrier/condition is absent]: Empty surgery gives 1.
Test wrt_root_one [required example; omitted if its carrier/condition is absent]: At ζ=1 the invariant is 1 by the declared convention, including r=1.
Test wrt_stabilization_sign [required example; omitted if its carrier/condition is absent]: A split +1 unknot cancels the positive Gauss factor and a −1 unknot cancels the negative factor; interchanging the two fails this test.

ArithmeticQuantumTopology:QT.4/evaluation-theorem
Name: evaluation_theorem
Carrier/condition boundary: HabiroCyclotomicCompletions:HC.3/evaluation-at-a-root-of-unity
Specification: Let M be an integral homology sphere and zeta a primitive r-th root of unity. Then the evaluation at zeta of the unified invariant of M equals the sl(2) Witten-Reshetikhin-Turaev invariant of M at zeta.

ArithmeticQuantumTopology:QT.4/integrality-and-galois
Name: integrality_and_galois
Carrier/condition boundary: HabiroCyclotomicCompletions:HC.3/evaluation-at-a-root-of-unity
Specification: For every integral homology sphere M and every root of unity zeta, the Witten-Reshetikhin-Turaev invariant of M at zeta lies in the ring of integers generated by zeta, and for every field automorphism alpha of the cyclotomic field the invariant at the image of zeta is the image of the invariant.

ArithmeticQuantumTopology:QT.4/determination-by-WRT
Name: determination_by_WRT
Carrier/condition boundary: HabiroCyclotomicCompletions:HC.4/evaluation-at-individual-roots; HabiroCyclotomicCompletions:HC.4/rootwise-taylor-injectivity
Specification: For IHS M the root-value function τ_ζ(M) and J_M determine each other, by evaluation and Habiro injectivity. A subset Z of roots suffices when it has a Habiro limit point: some root has prime-power-order ratio with infinitely many members of Z. Over ℤ this is a sufficient injectivity condition; no converse is claimed for arbitrary infinite sets without that property. A finite set cannot suffice for generic Habiro elements: the product of its cyclotomic polynomials is a nonzero element killed by all its evaluations. A single rootwise Taylor expansion also determines J_M.

ArithmeticQuantumTopology:QT.4/ohtsuki-series
Name: ohtsuki_series
Carrier/condition boundary: HabiroCyclotomicCompletions:HC.3/the-taylor-map; HabiroCyclotomicCompletions:HC.3/re-expansion-of-taylor-expansions
Specification: For IHS M, σ₁(J_M)∈ℤ[[q−1]] is the Ohtsuki series, characterized by its convergent p-adic evaluations equal to τ_ζ(M) at all odd prime-power roots. The identity uses the imported HC.3 re-expansion square and Habiro’s uniqueness lemma for the product of odd-prime evaluations of ℤ[[q−1]]. This is not convergence as a complex analytic power series.

ArithmeticQuantumTopology:QT.5/ideal-tetrahedron-and-shape
Name: ideal_tetrahedron_and_shape
Carrier/condition boundary: mathlib:Complex.log; tauceti:TauCetiRoadmap/GeometricTopology#layer-7-riemannian-geometric-structures-and-volume
Specification: The supplier’s ordered ideal hyperbolic tetrahedron with four distinct boundary vertices has cross-ratio z∈ℂ∖{0,1}, with ordering normalized by (∞,0,1,z)↦z. Its companions are z′=1/(1−z), z″=1−1/z and zz′z″=−1. Im z>0 is positive orientation; real nondegenerate shapes are flat and may occur in refinement arguments. QT records the shape coordinate interface and imports the geometric carrier/isometry classification; it does not construct hyperbolic space again.
API IdealTetrahedron [signature omitted pending the boundary above]: An ordered oriented ideal tetrahedron, recorded by its shape parameter in the complement of 0 and 1.
API shape [signature omitted pending the boundary above]: shape T is the cross-ratio of the four ideal vertices in the chosen order.
API shape_companions [signature omitted pending the boundary above]: The three edge parameters are z, 1/(1-z) and 1-1/z, and their product is minus 1.
API isometry_iff_shape_eq [signature omitted pending the boundary above]: Two ordered ideal tetrahedra are orientation-preserving isometric if and only if their shapes agree.
API positively_oriented [signature omitted pending the boundary above]: A tetrahedron is positively oriented exactly when the imaginary part of its shape is positive.
Test shape_regular [required example; omitted if its carrier/condition is absent]: The regular ideal tetrahedron has shape the primitive sixth root of unity; a convention giving a different value is a different cross-ratio ordering.
Test shape_product [required example; omitted if its carrier/condition is absent]: The product of the three edge parameters is minus 1, not 1; this pins the convention.
Test shape_excludes_degenerate [required example; omitted if its carrier/condition is absent]: Shapes 0 and 1 are excluded, so a degenerate configuration is not an ideal tetrahedron.

ArithmeticQuantumTopology:QT.5/gluing-and-completeness-equations
Name: gluing_and_completeness_equations
Carrier/condition boundary: ArithmeticQuantumTopology/G4; tauceti:TauCetiRoadmap/GeometricTopology#layer-5-dehn-surgery; tauceti:TauCetiRoadmap/GeometricTopology#layer-7-riemannian-geometric-structures-and-volume
Specification: For an actual ideal face-pairing triangulation of the interior of a compact oriented 3-manifold with torus boundary, shapes give edge products and peripheral products from the incidence data. A positive geometric solution has every z_j in the upper half-plane, each edge product 1 with total dihedral angle 2π, and trivial holonomy for both generators of each cusp (equivalently the appropriate unipotent complete cusp condition in the developing representation). Edge products alone are insufficient. Geometric realization, ideal triangulation existence and finite-volume cusped rigidity are requested from GeometricTopology, Part II. A matrix equation alone is called linear gluing data, not an ideal triangulation.
API IdealTriangulation [signature omitted pending the boundary above]: Import an actual oriented cusped-manifold ideal face-pairing triangulation, with peripheral curves and nondegenerate shapes satisfying all edge and completeness equations; an arbitrary matrix equation is not this carrier.
API edgeEquation [signature omitted pending the boundary above]: At each edge, the product of the incident edge parameters is 1 and the sum of their logarithms is two pi i.
API cuspEquation [signature omitted pending the boundary above]: At each cusp, the derived holonomy of each generator is trivial.
API isGeometricSolution [signature omitted pending the boundary above]: The conjunction includes positive shapes, edge angle equations and both peripheral completeness equations.
API volume_eq_sum [signature omitted pending the boundary above]: The volume of the structure is the sum of the volumes of its tetrahedra.
Test figure_eight_solution [required example; omitted if its carrier/condition is absent]: The two-tetrahedron triangulation of the figure-eight knot complement has the solution with both shapes the primitive sixth root of unity; this is the running example.
Test edge_equation_log_form [required example; omitted if its carrier/condition is absent]: The logarithmic edge equation fixes the branch: the product form alone does not, and the two differ by multiples of two pi i.
Test not_geometric_of_negative_imaginary [required example; omitted if its carrier/condition is absent]: A solution with a shape of negative imaginary part is not geometric, so the positivity condition is not redundant.

ArithmeticQuantumTopology:QT.5/combinatorial-flattening
Name: combinatorial_flattening
Carrier/condition boundary: mathlib:Complex.log
Specification: On Neumann’s cut-plane ℤ²-cover of ℂ∖{0,1}, a point (z;p,q) determines (w₀,w₁,w₂)=(log z+pπi,−log(1−z)+qπi,log(1−z)−log z−(p+q)πi). Their sum is zero. Crossing the negative-real cut changes p by 2 and crossing the >1 cut changes q by 2; the cover has four parity components. The triple determines the point of the cover using both w₀ and w₁, not w₀ alone. Strong flattenings of triangulations impose additional parity and normal-path conditions, separately planned.
API Flattening [signature omitted pending the boundary above]: A point on the cut ℤ²-cover and its log parameters.
API flattening_sum_zero [concrete component above; full object still uses stated boundary]: w₀+w₁+w₂=0.
API flatteningEquiv [signature omitted pending the boundary above]: The cover is in bijection with combinatorial flattening triples.
API flattening_cover_transition [signature omitted pending the boundary above]: Cut transitions shift p or q by two, preserving the appropriate logarithmic parameters.
Test flattening_zero_zero [required example; omitted if its carrier/condition is absent]: On the chosen cut-plane chart p=q=0 gives (log z,−log(1−z),log(1−z)−log z).
Test flattening_determines_shape [required example; omitted if its carrier/condition is absent]: Equality of the full w-triples determines z; equality of w₀ alone is insufficient.
Test flattening_regular [required example; omitted if its carrier/condition is absent]: For z=exp(πi/3) and p=q=0 the log parameters are (πi/3,πi/3,−2πi/3), summing to zero.

ArithmeticQuantumTopology:QT.5/five-term-and-pachner
Name: five_term_and_pachner
Carrier/condition boundary: Local prerequisites in the definitive packet; see its exact hypotheses.
Specification: For five distinct ideal vertices, the alternating lifted five-shape relation is permitted iff the alternating sum of log parameters about each of their ten edges is zero. Consequently a compatible 2–3 Pachner move preserves the signed flattened-shape sum in P̂(ℂ); sheet changes also use the transfer relation. Nondegenerate vertices and the full log-edge compatibility are retained.

ArithmeticQuantumTopology:QT.5/bloch-element-of-a-triangulation
Name: bloch_element_of_a_triangulation
Carrier/condition boundary: Local prerequisites in the definitive packet; see its exact hypotheses.
Specification: For an oriented complete finite-volume hyperbolic 3-manifold M with the ordered hybrid refinement and strong flattening specified above, β̂(M)=Σ_j ε_j[z_j;p_j,q_j] belongs to B̂(ℂ) and depends only on M. More generally the labelled ordered-cycle construction gives λ:H₃(PSL₂(ℂ)^δ;ℤ)→B̂(ℂ), and the signed sum depends only on the represented homology class. Changes of strong flattening, developing points and compatible refinement do not change the class. The ordinary β_F requires the separate verified field/boundary comparison; it is not produced by a diagram or numerical shapes alone.
API blochElement [signature omitted pending the boundary above]: blochElement M is the class in the extended Bloch group attached to a flattened ideal triangulation of M.
API blochElement_exists [signature omitted pending the boundary above]: A flattening of the triangulation exists, so the element is defined.
API blochElement_indep [signature omitted pending the boundary above]: The element does not depend on the chosen flattening, only on the homology class.
API blochElement_mem_extendedBloch [signature omitted pending the boundary above]: The element lies in the extended Bloch group, the kernel of the map to the exterior square.
Test blochElement_figure_eight_volume [required example; omitted if its carrier/condition is absent]: The projected figure-eight class is 2[z₆], z₆=exp(πi/3); its Bloch–Wigner value is 2D(z₆). The full extended class must use the cusp-compatible flattening, rather than assume twice the principal lift.
Test blochElement_flattening_independent [required example; omitted if its carrier/condition is absent]: Changing the flattening by an admissible amount does not change the class.
Test blochElement_not_in_prebloch_kernel [required example; omitted if its carrier/condition is absent]: The element is non-zero for a hyperbolic manifold, since its Rogers dilogarithm has non-zero imaginary part equal to the volume.

ArithmeticQuantumTopology:QT.5/volume-and-chern-simons
Name: volume_and_chern_simons
Carrier/condition boundary: ArithmeticQuantumTopology/G5; Polylogarithms:P.2/bloch-wigner-descent; K3BlochGroups:V.4/suslin-exact-sequence; K3BlochGroups:V.6/suslin-lift-fibre
Specification: Neumann’s λ:H₃(PSL₂(ℂ)^δ;ℤ)≅B̂(ℂ) is an isomorphism and R∘λ is the Cheeger–Chern–Simons class i(Vol+i CS)=i Vol−CS modulo π²ℤ. For a complete finite-volume hyperbolic manifold R(β̂(M)) has imaginary part Vol(M). The tetrahedron identity Vol(z)=D(z) is imported from Polylogarithms P.2; QT assembles the signed sum and compares the Chern–Simons normalization. GZ uses V=i Vol+CS, so V=−conj(R) modulo the corresponding period and with a chosen representative for exponentials. This is not the ordinary K₃ Suslin isomorphism.

ArithmeticQuantumTopology:QT.1/topological-ribbon-hopf-algebras
Name: topological_ribbon_hopf_algebras
Carrier/condition boundary: mathlib:HopfAlgebra; mathlib:AdicCompletion; mathlib:UniformSpace.Completion
Specification: A topological ribbon Hopf algebra over ℂ[[h]] is topologically free, with continuous Hopf structure maps into h-adic completed tensor products, a quasitriangular R and a central invertible ribbon r. A sequence is zero-convergent when each fixed h-adic quotient has only finitely many nonzero terms. The completed tensor product, dual maps and ribbon/pivotal identities are part of the structure. This is the ambient object in Habiro–Le, not an assumption that arbitrary integral subalgebras inherit its completion.
API TopologicalRibbonHopfAlgebra [signature omitted pending the boundary above]: A complete Hopf algebra over the power series ring with an R-matrix and a ribbon element satisfying the listed axioms.
API TopologicalRibbonHopfAlgebra.R [signature omitted pending the boundary above]: The invertible element of the completed tensor square, with the quasi-triangularity identities.
API TopologicalRibbonHopfAlgebra.ribbon [signature omitted pending the boundary above]: The central invertible element with its coproduct and antipode axioms.
API TopologicalRibbonHopfAlgebra.moduleCategory [signature omitted pending the boundary above]: Finite-rank topologically free continuous modules form a ribbon category, with braiding from R and positive twist from r⁻¹.
API TopologicalRibbonHopfAlgebra.duals [signature omitted pending the boundary above]: Finite-rank topologically free modules have continuous left/right duals and evaluation/coevaluation. No rigidity of all infinite-rank topologically free modules is asserted.
API ZeroConvergent [signature omitted pending the boundary above]: Zero-convergent families and the sums they define, which is what makes infinite expansions meaningful.
Test trivialRibbonHopf [required example; omitted if its carrier/condition is absent]: The ground ring itself, with trivial R-matrix and ribbon element, is a topological ribbon Hopf algebra whose universal invariant is constant; this is the degenerate case.
Test twist_unit [required example; omitted if its carrier/condition is absent]: The twist on the tensor unit is the identity, which is the statement that the ribbon element acts trivially on the trivial module.
Test braiding_not_symmetric [required example; omitted if its carrier/condition is absent]: For the quantised enveloping algebra the braiding is not a symmetry: its square on a two-dimensional module is not the identity, which is exactly what makes the invariant see the knotting.
Test groupAlgebra_symmetric [required example; omitted if its carrier/condition is absent]: The completed group algebra of an abelian group with trivial R-matrix gives a symmetric, not merely braided, category; its universal invariant cannot distinguish a knot from the unknot.

ArithmeticQuantumTopology:QT.1/core-subalgebras-and-twist-forms
Name: core_subalgebras_and_twist_forms
Carrier/condition boundary: Local prerequisites in the definitive packet; see its exact hypotheses.
Specification: A core subalgebra X of a topological ribbon Hopf algebra is topologically free with continuous Δ(X)⊂completed X⊗X, S±1(X)⊂X, adjoint stability, and R and the pivotal element in the appropriate closures. For the clasp c=Σ c′_i⊗c″_i, both families are zero-convergent topological bases of X. If x=Σ x″_ic″_i lies in its ambient closure and y=Σ y′_ic′_i lies in X, define ⟨x,y⟩=Σ x″_iy′_i; its convergence follows from these basis conditions. Twist forms are T±(y)=⟨r±1,y⟩. Their normalization is T±(1)=1. Construction of an integral invariant also needs the integral K_n stability conditions, separately planned. No arbitrary scalar Gauss denominator is inserted.
API CoreSubalgebra [signature omitted pending the boundary above]: Topological core with both clasp basis conditions and stability.
API claspForm [signature omitted pending the boundary above]: Continuous pairing between the closure and the core with the coordinate formula above.
API CoreSubalgebra.twistForm [signature omitted pending the boundary above]: T±(y)=⟨r±1,y⟩.
API CoreSubalgebra.twistForm_one [signature omitted pending the boundary above]: Both twist forms send 1 to 1.
Test claspForm_dualBasis [required example; omitted if its carrier/condition is absent]: The two clasp basis families pair as Kronecker delta.
Test coreInvariant_empty [required example; omitted if its carrier/condition is absent]: The empty surgery presentation gives 1, without a denominator.
Test core_pairing_no_arbitrary_dual [required example; omitted if its carrier/condition is absent]: A one-sided basis without the other topological basis does not satisfy CoreSubalgebra; it cannot define the coordinate pairing.

ArithmeticQuantumTopology:QT.1/root-of-unity-categories-are-not-generically-semisimple
Name: root_of_unity_categories_are_not_generically_semisimple
Carrier/condition boundary: ArithmeticQuantumTopology/G3
Specification: Keep three settings distinct: generic h-adic finite free modules; integral PBW forms and their image completions; and specialized tilting modules at a specified root. The last category is not generically semisimple. Negligibility means every composite endomorphism has zero quantum trace, not merely that an arbitrary object has zero quantum dimension. The negligible quotient and its allowed alcove are separate constructions. Modularity needs extra root/type restrictions; general Lie-type strong Kirby colors in QT.4 do not imply a modular category at every admissible root.

ArithmeticQuantumTopology:QT.2/truncations-and-what-may-be-done-before-completion
Name: truncations_and_what_may_be_done_before_completion
Carrier/condition boundary: HabiroCyclotomicCompletions:HC.2/factorial-series; HabiroCyclotomicCompletions:HC.3/evaluation-at-a-root-of-unity
Specification: For N≥0 define Z_K,<N=Σ_(i<N)a_iσ_i in the polynomial center and, for a fixed ordinary color n, T_(K,n,N)=Σ_(i<min(N,n+1)) ({n+1+i}_(2i+1)/{1})a_i∈ℤ[v±1]. If N>n then T=J_K(V_n). Central truncations differ by a multiple of σ_N. They are not one scalar Laurent polynomial equal to every color. Evaluation of Habiro factorial-series truncations is instead the imported HC.2/HC.3 statement and must be applied to an element of that completion; no generic root cutoff for an unspecified Jones truncation is asserted.
API cyclotomicTruncation [signature omitted pending the boundary above]: Z_K,<N in the polynomial center.
API colorTruncation [signature omitted pending the boundary above]: The finite scalar sum T_(K,n,N).
API cyclotomicTruncation_trunc [signature omitted pending the boundary above]: Z_K,<M−Z_K,<N is divisible by σ_N for M≥N.
API colorTruncation_exact [signature omitted pending the boundary above]: For N>n the trace truncation equals J_K(V_n).
Test cyclotomicTruncation_zero [required example; omitted if its carrier/condition is absent]: At N=0 the truncation is 0, whereas the V₀ value becomes 1 at N=1.
Test colorTruncation_V1 [required example; omitted if its carrier/condition is absent]: At N=2 the V₁ value is [2]+{3}{2}a₁.
Test cyclotomicTruncation_compat [required example; omitted if its carrier/condition is absent]: Increasing N changes only terms divisible by σ_N.

ArithmeticQuantumTopology:QT.2/an-expansion-is-a-theorem-about-an-invariant
Name: an_expansion_is_a_theorem_about_an_invariant
Carrier/condition boundary: HabiroCyclotomicCompletions:HC.2/factorial-series
Specification: HC.2 supplies generic factorial-series representations of elements of the completion. QT.2 proves a different theorem: the integral central σ-expansion of the universal invariant of a zero-framed knot, with uniquely characterized coefficients a_i=J_K(P″_i). A completion element need not be a knot invariant; evaluation at roots alone supplies neither these coefficients nor knot presentation independence. Link divisibility is the algebraically split zero-framed multilinear theorem, not a blanket knot-basis formula for all links.

ArithmeticQuantumTopology:QT.3/rational-homology-spheres-are-not-in-this-domain
Name: rational_homology_spheres_are_not_in_this_domain
Carrier/condition boundary: Local prerequisites in the definitive packet; see its exact hypotheses.
Specification: QT.3 defines J only for integral homology spheres. For the p-framed unknot with |p|>1, H₁≅ℤ/|p| and its link is not admissible. Rational homology-sphere extensions require separate localization/coefficient and surgery theorems; neither the integral target nor the present convergence proof transfers automatically. Dependence on root lifts for general WRT manifolds is a separate qualification, not an assertion that it persists for every non-integral example.

ArithmeticQuantumTopology:QT.4/general-simple-lie-type
Name: general_simple_lie_type
Carrier/condition boundary: HabiroCyclotomicCompletions:HC.4/evaluation-at-individual-roots; HabiroCyclotomicCompletions:HC.4/rootwise-taylor-injectivity
Specification: For each finite-dimensional simple complex g there is a unique invariant J_M^g∈ℤ[q]^ℕ of oriented integral homology spheres such that ev_ξ J_M^g=τ_M^g(ξ) for ξ∈Z_g and ev_ξ J_M^g=τ_M^(Pg)(ξ) for ξ∈Z_Pg. At any other root evaluation remains defined; using it to extend the conventional invariant is a definition. At ξ=1 it is 1. Uniqueness and rootwise Taylor determination use the integral Habiro rigidity theorem. The construction uses the concrete integral core and its degree-one K_n filtration, not only an unspecified abstract core.

ArithmeticQuantumTopology:QT.4/the-coefficient-ring-may-not-be-changed
Name: the_coefficient_ring_may_not_be_changed
Carrier/condition boundary: HabiroCyclotomicCompletions:HC.4/rootwise-taylor-injectivity; HabiroCyclotomicCompletions:HC.1/the-cyclotomic-completion
Specification: The determination and integrality statements are over ℤ. Over ℚ the all-order cyclotomic completion is a product of rootwise completions, so its Taylor map at one root is not injective. QT does not transfer integral rigidity, Galois/integer target statements, or IHS coefficient results to localized, twisted or rational-homology-sphere completions without a comparison theorem.

ArithmeticQuantumTopology:QT.5/a-diagram-does-not-produce-a-bloch-class
Name: a_diagram_does_not_produce_a_bloch_class
Carrier/condition boundary: Local prerequisites in the definitive packet; see its exact hypotheses.
Specification: A knot diagram does not automatically give β_F. Required witnesses are: a complete finite-volume hyperbolic complement; genuine face-pairing and peripheral data; an ordered hybrid refinement with a strong flattening; and an algebraic shape field with the required boundary/convention comparison. Once supplied, β̂(M) is independent of permissible flattening choices. Neumann’s warning about non-manifold underlying complexes applies to Dehn-filling triangulations, not all software triangulations of cusped complements. QT.5 imports geometric existence/rigidity from GeometricTopology Part II and tetrahedron volume from Polylogarithms; it has no dependency on QT.0 surgery.

ArithmeticQuantumTopology:QT.6/the-kashaev-invariant-and-the-function-on-the-rationals
Name: the_kashaev_invariant_and_the_function_on_the_rationals
Carrier/condition boundary: ArithmeticQuantumTopology/G3; HabiroCyclotomicCompletions:HC.3/evaluation-at-a-root-of-unity
Specification: For N≥2 the Murakami–Murakami theorem identifies Kashaev ⟨K⟩_N with J^red_(K,N)(exp(2πi/N)), where color N means dimension N and the reduced polynomial is formed before specialization. For α=a/c in lowest terms, c>0, set 𝒥_K(α)=J^red_(K,c)(exp(−2πiα)); then 𝒥_K(−1/N)=⟨K⟩_N. It is one-periodic and Galois equivariant: σ_b𝒥_K(a/c)=𝒥_K(ba/c), gcd(b,c)=1. This does not mean that every value is fixed by every Galois automorphism. For 4₁, ⟨4₁⟩_N=Σ_(j=0)^(N−1)|(ζ_N;ζ_N)_j|² and the first six values are 1,5,13,27,46+2√5,89. The order-one extension is defined to be 1. Its root values come from the unified integral Habiro element H_K. The original Kashaev R-matrix presentation is used only by the MM comparison, not replanned as an additional carrier here.
API kashaevInvariant [signature omitted pending the boundary above]: The element of the ring of integers with a root of unity adjoined attached to a knot and a positive integer.
API kashaevInvariant_eq_colouredJones [signature omitted pending the boundary above]: Its identification with the evaluation of the colored Jones polynomial in the corresponding colour.
API kashaevFunction [signature omitted pending the boundary above]: 𝒥_K(a/c)=J^red_(K,c)(exp(−2πia/c)), c>0, is one-periodic and Galois equivariant; 𝒥_K(−1/N)=⟨K⟩_N.
API kashaevFunction_unique [signature omitted pending the boundary above]: The values at −1/N, periodicity and σ_b𝒥(a/c)=𝒥(ba/c) uniquely determine the rational function. Values need not be pointwise Galois fixed.
API figureEightKashaev [concrete component above; full object still uses stated boundary]: The closed form and the first values for the figure-eight knot.
Test kashaev_unknot [required example; omitted if its carrier/condition is absent]: For the unknot the Kashaev invariant is one for every order, and the periodic function is constant.
Test figureEightKashaev_small [required example; omitted if its carrier/condition is absent]: The first six values for the figure-eight knot are one, five, thirteen, twenty-seven, forty-six plus twice the square root of five, and eighty-nine; a wrong normalisation would not reproduce them.
Test kashaevFunction_periodic [required example; omitted if its carrier/condition is absent]: The function satisfies that its value at an argument plus one equals its value at the argument; this is what makes the statement at minus one over the integer meaningful.
Test kashaev_Galois_equivariance [required example; omitted if its carrier/condition is absent]: At order 5, the automorphism sending ζ₅ to ζ₅² changes 46+2√5 to 46−2√5; equivariance is not pointwise Galois invariance.

ArithmeticQuantumTopology:QT.6/the-asymptotic-series-and-its-arithmetic
Name: the_asymptotic_series_and_its_arithmetic
Carrier/condition boundary: Local prerequisites in the definitive packet; see its exact hypotheses.
Specification: The formal GSW geometric NZ series exists and is invariant under its hypotheses, with coefficients in the invariant trace field. A normalized GZ perturbative series additionally includes a one-loop square root, an eighth-root phase and the complex-volume exponential; the normalization comparison is explicit. The Kashaev all-orders analytic expansion is conjectural in general and proved only in the separately cited families. For 4₁ the GZ series begins 3^(−1/4)(1+11h/(72√−3)+697h²/(2(72√−3)²)+⋯). For 5₂ use ξ³−ξ²+1=0 with Im ξ<0 and the prefactor ζ₈/√(3ξ−2). These formal coefficients do not supply an error bound by themselves. At primitive order k the geometric input is the root-refined DG2 series, with the finite cyclic average and one-loop factor above. Its matching with HB.8’s refined Gaussian collection is a normalization obligation under the integral/parity hypotheses, not mere evaluation of the k=1 series.

ArithmeticQuantumTopology:QT.6/what-is-exported-to-the-habiro-roadmaps
Name: what_is_exported_to_the_habiro_roadmaps
Carrier/condition boundary: HabiroCyclotomicCompletions:HC.1/the-cyclotomic-completion; HabiroCyclotomicCompletions:HC.2/factorial-series
Specification: Three precise interfaces connect QT to the Habiro family: integral knot coefficients and IHS unified invariants consume HC.1–HC.4; the explicit figure-eight descendant H_m supplies new elements of the ordinary Habiro ring via HC.2; and qualified integral-NZ Nahm data consume HB.8/HB.9 and HNF HB.6/HB.7 for a K₃-indexed module. The knot-specific construction/topological comparison stays in QT. Neither formal asymptotics nor root values alone prove completion membership. Wheeler’s two-variable relative-Habiro theorem is routed as a named QT Part II after QT.2, with HR.1/HR.5 coefficient suppliers and GeometricTopology’s Alexander polynomial; it is not absorbed into the current stages.

ArithmeticQuantumTopology:QT.6/formal-and-analytic-asymptotics-are-different-outputs
Name: formal_and_analytic_asymptotics_are_different_outputs
Carrier/condition boundary: Local prerequisites in the definitive packet; see its exact hypotheses.
Specification: A formal series is an element of a coefficient ring [[h]], with no domain or error estimate. Analytic all-orders asymptotics requires a limit domain, a branch and, for every truncation M, an O(h^M) remainder with the stated uniformity. GSW supplies formal invariance; AK supplies the selected analytic leading limits; Bettin–Drappeau supplies bounded-denominator all-orders modular asymptotics for its named knot family. General GZ refinements remain conjectural. No number of computed coefficients or saddle-point equations upgrades a formal series to such a theorem.

ArithmeticQuantumTopology:QT.7/the-quantum-modularity-conjecture
Name: the_quantum_modularity_conjecture
Carrier/condition boundary: Local prerequisites in the definitive packet; see its exact hypotheses.
Specification: Conjecture (GZ QMC): for γ=(a b;c d)∈SL₂(ℤ), c>0, X→+∞ through rationals with bounded denominator, J_K(γX)∼(cX+d)^(3/2) J_K(X) Φ̂_(a/c)^geo(2πi/[c(cX+d)]). Here the completed geometric series is exp(Vgeo/[den(α)²h])Φ_α^geo(h), with the specified volume representative, one-loop phase and q convention. The relation means an all-orders asymptotic expansion, not equality of rational functions or pointwise convergence of the formal series. The positive-q Bettin–Drappeau theorem is a separately normalized proved specialization for its ten knots, requiring the explicit q-conjugation comparison.

ArithmeticQuantumTopology:QT.7/the-example-ledger
Name: the_example_ledger
Carrier/condition boundary: Local prerequisites in the definitive packet; see its exact hypotheses.
Specification: The ledger records exact knot/root/normalization/representation/shape-field data and mathematical status separately for each output. 4₁: ζ₆=e^(πi/3), ordinary Bloch class 2[ζ₆], field ℚ(√−3), exact Kashaev values 1,5,13,27,46+2√5,89 in orders 1–6 (the other primitive order-five embedding gives 46−2√5), AK decay-volume theorem for g₂, positive-q BD modular theorem, and conjectural matrix refinements. 5₂: the GZ branch ξ³−ξ²+1=0, Im ξ<0; AK g₃ decay theorem and its explicit phase; positive-q BD modular theorem; conjectural quadratic/matrix extensions. Numerical shapes/coefficients have numerical status. Neither a torus knot nor a singular gluing solution satisfies the hyperbolic/nondegenerate hypotheses of these selected theorems.
API Ledger [concrete component above; full object still uses stated boundary]: The table with one row per example and one column per kind of datum.
API LedgerColumn [concrete component above; full object still uses stated boundary]: The six columns: cyclotomic coefficients, Kashaev values, invariants at roots of unity, trace field and Bloch classes, volume and Chern-Simons, asymptotic series.
API LedgerEntry.node [signature omitted pending the boundary above]: For each entry, the node that produces it.
API LedgerEntry.status [signature omitted pending the boundary above]: For each entry, one of the five labels: proved, imported, computed, numerical, conjectural.
API ledgerRows [concrete component above; full object still uses stated boundary]: The two rows, for the figure-eight knot and for the knot five two.
Test ledger_figureEight_row [required example; omitted if its carrier/condition is absent]: Every entry of the figure-eight row is filled, and the Kashaev column reproduces the six values of the source.
Test ledger_status_consistent [required example; omitted if its carrier/condition is absent]: Each output has its own status: the selected nondegenerate formal geometric series has a source theorem, AK and BD have selected analytic theorems, while general matrix RQMC and cocycle analyticity remain conjectural. No producing conjectural statement is marked proved.
Test ledger_traceField [required example; omitted if its carrier/condition is absent]: The trace field of the figure-eight knot is the rationals with the square root of minus three adjoined, and of the knot five two the cubic field of the displayed polynomial.
Test ledger_empty_column [required example; omitted if its carrier/condition is absent]: A column that cannot be filled for a row is recorded as empty and not as agreement; this is the discipline the ledger exists to enforce.

ArithmeticQuantumTopology:QT.7/proved-cases-conjectures-and-the-executable-boundary
Name: proved_cases_conjectures_and_the_executable_boundary
Carrier/condition boundary: Local prerequisites in the definitive packet; see its exact hypotheses.
Specification: All eight accepted QT stages are decomposed here. The suggested Lean file states concrete algebraic linking-matrix predicates, Laurent-polynomial colored-Jones interfaces, flattening charts, qualified linear NZ equations/Hessians, a prescribed-contour Faddeev strip integral, figure-eight root descendants and the conditional matrix-cocycle identity. It does not encode an arbitrary relation quotient as the extended Bloch group, arbitrary matrices as ideal triangulations, or arbitrary functions as quantum invariants. Missing geometric/ribbon/complete-integral structures are named in the omission inventory with the corresponding gap/request. Generic completions, Gaussian theory, K₃/Bloch theory, quantum modularity and cusped geometry remain supplier-owned. QT Part II’s two-variable/MMR/relative-Habiro route follows QT.2 under the accepted split.

ArithmeticQuantumTopology:QT.0/admissible-band-slide-calculus
Name: admissible_band_slide_calculus
Carrier/condition boundary: Local prerequisites in the definitive packet; see its exact hypotheses.
Specification: A band slide is an algebraically cancelling pair of handle slides and preserves the linking matrix. Two admissible links with the same oriented surgery result become related by band slides and isotopy after split ±1 stabilizations. This is Habiro theorem t1; its Main Lemma applies to an oriented ordered move sequence with φ(S)=I.

ArithmeticQuantumTopology:QT.1/ribbon-category
Name: ribbon_category
Carrier/condition boundary: ArithmeticQuantumTopology/G2; mathlib:CategoryTheory.MonoidalCategory; mathlib:CategoryTheory.BraidedCategory; mathlib:CategoryTheory.RigidCategory; mathlib:CategoryTheory.ExactPairing
Specification: A ribbon category is a braided rigid monoidal category with a natural automorphism θ of the identity satisfying θ₁=id, θ_(X⊗Y)=(θ_X⊗θ_Y) followed by the double braiding, and θ_(X*)=(θ_X)* for the chosen rigid duality. All associators/unitors and the dual comparison are retained; no symmetric-braiding axiom is imposed. Its pivotal trace is the ribbon graphical closure of an endomorphism.
API RibbonCategory [concrete component above; full object still uses stated boundary]: The pinned braided rigid category together with the natural twist and the three equations above.
API ribbonTwist_tensor [concrete component above; full object still uses stated boundary]: The twist of a tensor product is the double braiding composed with the tensor of twists.
API ribbonTwist_dual [concrete component above; full object still uses stated boundary]: Dualizing θ_X gives θ_(X*).
API ribbonTrace [concrete component above; full object still uses stated boundary]: Graphical closure gives an endomorphism of the tensor unit; compare with the pivotal quantum trace.
Test ribbonTwist_unit [required example; omitted if its carrier/condition is absent]: The twist on the tensor unit is the identity.
Test ribbonTrace_vectorSpace [required example; omitted if its carrier/condition is absent]: For finite-dimensional vector spaces with flip braiding and trivial twist the ribbon trace is the ordinary trace.
Test ribbonTwist_sl2_V1 [required example; omitted if its carrier/condition is absent]: In the generic sl₂ instance a positive twist on V₁ acts as q^(3/4), so θ is not the identity.

ArithmeticQuantumTopology:QT.1/reshetikhin-turaev-functor
Name: reshetikhin_turaev_functor
Carrier/condition boundary: tauceti:TauCetiRoadmap/GeometricTopology#layer-4-knot-theory-done-properly-owned-here; mathlib:HopfAlgebra
Specification: For a ribbon Hopf algebra (A,R,r) over a field, the finite-dimensional module category admits the unique tensor functor from homogeneous colored directed ribbon graphs that sends signed colors to V or V*, coupons to their A-linear maps, crossings to flip∘R and turns to the evaluation/coevaluation with pivotal u r⁻¹. Its value on a closed colored framed link is a scalar invariant under framed isotopy. For U_h use finite free modules over the complete base and continuous structure maps. The geometric ribbon-graph presentation is imported, not a new link carrier.
API RTFunctor [signature omitted pending the boundary above]: Tensor functor with the specified generators and color duality.
API RTFunctor_coupon [signature omitted pending the boundary above]: The image of an A-linear coupon is its label.
API RTFunctor_tensor [signature omitted pending the boundary above]: Juxtaposition maps to the tensor product of maps.
API RTFunctor_closed [signature omitted pending the boundary above]: Closing a component is pivotal quantum trace.
Test RTFunctor_empty [required example; omitted if its carrier/condition is absent]: The empty closed graph evaluates to 1.
Test RTFunctor_straight [required example; omitted if its carrier/condition is absent]: The straight colored strand evaluates to id_V.
Test RTFunctor_crossing_inverse [required example; omitted if its carrier/condition is absent]: A crossing followed by its inverse is the identity; a positive crossing alone is not assumed involutive.

ArithmeticQuantumTopology:QT.1/tilting-negligible-quotient
Name: tilting_negligible_quotient
Carrier/condition boundary: tauceti:TauCetiRoadmap/RepresentationTheory/LieHighestWeight#layer-3-enveloping-algebra-verma-modules-and-lλ
Specification: Specialize the Lusztig divided-power quantum group at the source root: q=s^L, s of order lL, l′=l for odd l and l/2 for even l. For types with d_max|l′ require l′≥d_max h∨; otherwise l′>h. The tilting category consists of modules with Weyl and dual Weyl filtrations. Quotient Hom(V,W) by maps f with qtr(hf)=0 for every h:W→V. Sawin’s full ribbon functor yields a semisimple ribbon category with simples in the open affine alcove ⟨λ+ρ,θ₀⟩<l′. For sl₂ in Habiro variables v of order 2r, r≥2, the admissible colors are V₀,…,V_(r−2); the source root-lattice scaling must be compared before using this specialization. General-type modularity is not asserted.
API TiltingModule [signature omitted pending the boundary above]: Module with both Weyl and dual Weyl filtrations.
API IsNegligibleMorphism [signature omitted pending the boundary above]: f:V→W is negligible iff qtr(hf)=0 for all h:W→V.
API TiltingSemisimplification [signature omitted pending the boundary above]: The quotient ribbon category by the negligible tensor ideal.
API tiltingSimple_alcove [signature omitted pending the boundary above]: Simples are labelled by the stated open affine alcove under the root bounds.
Test negligible_identity_outside_alcove [required example; omitted if its carrier/condition is absent]: An indecomposable tilting module outside the alcove has negligible identity under the root bounds.
Test tilting_unit_not_negligible [required example; omitted if its carrier/condition is absent]: The unit has quantum trace 1 and survives.
Test sl2_alcove_rank [required example; omitted if its carrier/condition is absent]: For r=3 the two retained sl₂ labels are 0 and 1; the weight r−1=2 does not survive as a simple.

ArithmeticQuantumTopology:QT.1/general-drinfeld-jimbo-algebra
Name: general_drinfeld_jimbo_algebra
Carrier/condition boundary: mathlib:HopfAlgebra; tauceti:TauCetiRoadmap/RepresentationTheory/LieHighestWeight#layer-3-enveloping-algebra-verma-modules-and-lλ; tauceti:TauCetiRoadmap/RepresentationTheory/LieHighestWeight#layer-1-cartan-subalgebras-and-the-root-space-decomposition
Specification: For a finite-dimensional simple complex Lie algebra with normalized short-root length²=2, put d_i=(α_i,α_i)/2∈{1,2,3}, v_i=v^d_i, q=v², and use root lattice Y⊂weight lattice X with D=|X/Y|. U_h(g) has Cartan-root commutators, [E_i,F_j]=δ_ij(K_i−K_i⁻¹)/(v_i−v_i⁻¹), and quantum Serre relations of degree 1−a_ij, with K_i=exp(hH_i/2) in the source convention. The generic U_q(g) over ℂ(v) embeds in U_h(g); its PBW root-vector and Lusztig divided-power integral forms are distinguished. Classical root data and ordinary PBW are imported from LieHighestWeight.
API DrinfeldJimboDatum [signature omitted pending the boundary above]: Root/weight lattices, d_i,D and the chosen root ordering.
API DrinfeldJimboAlgebra [signature omitted pending the boundary above]: The topological quantum Serre algebra for that datum.
API quantumPBWBasis [signature omitted pending the boundary above]: Ordered root-vector divided powers and Cartan factors form the specified PBW basis.
Test DJ_sl2_relations [required example; omitted if its carrier/condition is absent]: For rank one the relations reduce to QT.1 U_h(sl₂), including the correct F weight sign.
Test DJ_serre_commuting_roots [required example; omitted if its carrier/condition is absent]: For a_ij=0 the quantum Serre relation is E_iE_j=E_jE_i.
Test DJ_root_lengths_G2 [required example; omitted if its carrier/condition is absent]: In G₂ the long-root d_i is 3; replacing every v_i by v loses the Serre coefficients.

ArithmeticQuantumTopology:QT.1/general-integral-core
Name: general_integral_core
Carrier/condition boundary: ArithmeticQuantumTopology/G2; mathlib:Polynomial.cyclotomic
Specification: For the ordered PBW data of U_h(g), the h-adic core X_h over ℂ[[√h]] has weighted basis h^(||n||/2)b_h. Over A=ℤ[v±1] adjoin the square roots √Φ_k(q) to form Ã. The integral core X_ℤ is the Ã-span of √((q;q)_n)b^Lusztig_n with the multi-index factorial and PBW ordering of Habiro–Le §5. It is free with those two-sided clasp bases and is stable under the coproduct, antipode, adjoint action, braiding, bar and mirror operations. These weighted lattices are separate from U_A and from the eventual ℤ[q±1] coefficient ring.
API weightedPBWCore [signature omitted pending the boundary above]: The √h-adic core with the displayed weighted PBW basis.
API integralQuantumCore [signature omitted pending the boundary above]: The Ã-lattice with cyclotomic square-root PBW weights.
API integralCore_twist [signature omitted pending the boundary above]: The clasp twist forms take the integral core to Ã.
API integralCore_stable [signature omitted pending the boundary above]: The specified Hopf, adjoint, braiding, bar and mirror maps preserve the core.
Test integralCore_unit [required example; omitted if its carrier/condition is absent]: The zero PBW index has weight 1 and contains the unit.
Test integralCore_sl2 [required example; omitted if its carrier/condition is absent]: Under the rank-one identification the core construction yields the sl₂ integral image used for unified invariants, with its own coefficient comparison.
Test integralCore_weights_essential [required example; omitted if its carrier/condition is absent]: The n-th positive-root basis weight contains √((q;q)_n), rather than an unweighted Lusztig basis; omitting that weight is a different lattice.

ArithmeticQuantumTopology:QT.2/finite-free-colors
Name: finite_free_colors
Carrier/condition boundary: mathlib:Polynomial.Chebyshev.S
Specification: For n≥0, V_n is the rank n+1 finite free ℚ[[h]] highest-weight U_h-module of weight n, with basis F̃^(i)v₀, 0≤i≤n, and actions as in Habiro §5.1. For a finite free module V define tr_q^V(x)=Tr(ρ_V(K⁻¹x)). The representation algebra R_A=A[V₁] has V_m V_n=Σ_(j=0)^min(m,n) V_(m+n−2j); equivalently V_n=S_n(V₁) with Mathlib’s second-kind Chebyshev S₀=1,S₁=X,S_(n+2)=XS_(n+1)−S_n. Quantum dimension is [n+1], with [n]=(v^n−v⁻n)/(v−v⁻¹).
API sl2Color [signature omitted pending the boundary above]: V_n with rank n+1 and the fixed highest-weight basis.
API quantumTrace [signature omitted pending the boundary above]: Tr(ρ(K⁻¹x)) on a finite free color.
API sl2RepRing [signature omitted pending the boundary above]: R_A=A[X], X representing V₁.
API qInt [concrete component above; full object still uses stated boundary]: The balanced Laurent quantum integer [n].
API color_Chebyshev [signature omitted pending the boundary above]: V_n equals Chebyshev.S n evaluated at V₁.
Test quantum_dimension_V0 [required example; omitted if its carrier/condition is absent]: qdim V₀=1.
Test quantum_dimension_V1 [required example; omitted if its carrier/condition is absent]: qdim V₁=v+v⁻¹, not the constant 2.
Test color_tensor_V1 [required example; omitted if its carrier/condition is absent]: V₁⊗V₁=V₂+V₀, so V₂=X²−1 rather than X².

ArithmeticQuantumTopology:QT.2/completed-even-center
Name: completed_even_center
Carrier/condition boundary: ArithmeticQuantumTopology/G2
Specification: Set C=(v−v⁻¹)²FE+vK+v⁻¹K⁻¹ and σ_n=∏_(i=1)^n(C²−q^i−2−q⁻i), σ₀=1. The center of the completed even image integral form is lim_n ℤ[q±1][C²]/(σ_n); every element has a unique expansion Σ a_n σ_n, a_n∈ℤ[q±1]. This is the even statement in the companion center theorem, distinct from the full center with coefficients in A+AC. It identifies the topology on the center used in the knot expansion.
API quantumCasimir [signature omitted pending the boundary above]: C with the stated normalization.
API sigma [signature omitted pending the boundary above]: The monic central polynomial σ_n.
API evenCenterExpansion [signature omitted pending the boundary above]: An element of the completed even center has unique coefficients a_n∈ℤ[q±1].
Test sigma_zero [required example; omitted if its carrier/condition is absent]: σ₀=1.
Test sigma_one [required example; omitted if its carrier/condition is absent]: σ₁=C²−q−2−q⁻¹.
Test sigma_Vn_vanish [required example; omitted if its carrier/condition is absent]: σ_i acts by zero on V_n when i>n, since C acts by v^(n+1)+v^(−n−1).

ArithmeticQuantumTopology:QT.2/jones-normalization-comparison
Name: jones_normalization_comparison
Carrier/condition boundary: ArithmeticQuantumTopology/G3; tauceti:TauCetiRoadmap/GeometricTopology#layer-4-knot-theory-done-properly-owned-here
Specification: For a zero-framed knot, the fundamental-color quantum invariant is unreduced: J_K(V₁)=[2]J^red_(K,2). Compare J^red_(K,2) to the GeometricTopology Jones V_K(t), V_U=1, t=A⁻⁴, using an explicitly fixed mirror/crossing convention and a proven substitution t=q or q⁻¹. The existence of such a comparison is a planned target; the source conventions read here do not fix which supplier crossing matches Habiro’s positive crossing, so the exact sign is a recorded gap, not silently selected.

ArithmeticQuantumTopology:QT.4/sl2-kirby-color
Name: sl2_kirby_color
Carrier/condition boundary: mathlib:IsPrimitiveRoot
Specification: For the primitive 4r-th root ξ, r≥2, Ω_r=Σ_(i=0)^(r−2)[i+1]V_i is the sl₂ Kirby color. Its specialized link evaluations satisfy the handle-slide identity, and its ±1-unknot values are nonzero quadratic Gauss sums. The admissible range r−2 and the choice q^(1/4)=ξ are retained together; specializing an infinite generic representation sum is not this construction.
API sl2KirbyColor [signature omitted pending the boundary above]: The finite weighted color sum Ω_r.
API sl2KirbyColor_handleSlide [signature omitted pending the boundary above]: The colored surgery link value is unchanged by a handle slide.
API sl2KirbyColor_gauss_ne_zero [signature omitted pending the boundary above]: Both ±1 unknot values are nonzero at the specified lift.
Test kirbyColor_r2 [required example; omitted if its carrier/condition is absent]: At r=2 the color is V₀.
Test kirbyColor_r3 [required example; omitted if its carrier/condition is absent]: At r=3 the labels are V₀ and V₁ with the quantum-dimension coefficients.
Test kirbyColor_no_top_weight [required example; omitted if its carrier/condition is absent]: The weight V_(r−1) is absent; its vanishing quantum dimension does not supply an extra simple color.

ArithmeticQuantumTopology:QT.4/ohtsuki-characterization
Name: ohtsuki_characterization
Carrier/condition boundary: HabiroCyclotomicCompletions:HC.3/re-expansion-of-taylor-expansions
Specification: The homomorphism ℤ[[q−1]]→∏_(p odd prime)ℤ_p[ζ_p] obtained by convergent evaluation q=ζ_p is injective. Consequently there is at most one integral formal series with a prescribed collection of these values; existence for WRT values follows from σ₁(J_M).

ArithmeticQuantumTopology:QT.4/general-core-filtration
Name: general_core_filtration
Carrier/condition boundary: ArithmeticQuantumTopology/G2; HabiroCyclotomicCompletions:HC.1/the-cyclotomic-completion
Specification: Let G be the Habiro–Le central parity extension of Y×Y/2Y, retaining its central element v̇ of order two and tensor products over that element. On U_q, deg_G(v)=v̇, deg_G(K_α)=K̇_α, deg_G(E_α)=v̇^d_α ė_α and deg_G(F_α)=ė_α⁻¹K̇_α; use the exact §6 relations rather than an abelian root grading. Set K_n=(X_ℤ^ev)^⊗n∩[(U_A^ev)^⊗n]_1, F_kK_n=(q;q)_k K_n and K̃_n its image completion inside U_h completed⊗n. Then K₀=ℤ[q±1], K̃₀=Habiro; J_T∈K̃_n for zero-linking-matrix bottom tangles and tensor twist forms map K̃_n to K̃₀.
API generalIntegralKn [signature omitted pending the boundary above]: The displayed graded intersection K_n.
API generalKnFiltration [signature omitted pending the boundary above]: F_k=(q;q)_kK_n.
API generalCompletedKn [signature omitted pending the boundary above]: Image completion inside the h-adic ambient tensor power.
API generalKn_twist [signature omitted pending the boundary above]: The tensor product of sign twist forms maps K̃_n to the ordinary integral Habiro ring.
Test generalKn_zero [required example; omitted if its carrier/condition is absent]: K₀=ℤ[q±1] and K̃₀=Habiro.
Test generalKn_degree_one [required example; omitted if its carrier/condition is absent]: An odd power of v alone has central degree v̇ and is excluded from K₀.
Test generalKn_filtration_vanishes [required example; omitted if its carrier/condition is absent]: At a q-root of order r, (q;q)_k vanishes for k≥r, compatible with the Habiro completion.

ArithmeticQuantumTopology:QT.4/general-parity-grading
Name: general_parity_grading
Carrier/condition boundary: Local prerequisites in the definitive packet; see its exact hypotheses.
Specification: G is generated by a central v̇ of order two, commuting K̇_α of order two and invertible ė_α, with K̇_α ė_β=v̇^((α,β))ė_βK̇_α and ė_αė_β=v̇^((α,β))ė_βė_α. Its quotient by ⟨v̇⟩ is Y×Y/2Y. The tensor grading amalgamates the central v̇ in all factors; G^⊗0=⟨v̇⟩. The generator degrees are deg(v)=v̇, deg(K_±α)=K̇_α, deg(E_α)=v̇^(d_α)ė_α and deg(F_α)=ė_α⁻¹K̇_α. These define the grading over ℂ(q); the even subalgebra is the sum over G^ev. This carries integral square-root cancellation information unavailable from ordinary Y-grading.
API QuantumParityGroup [signature omitted pending the boundary above]: The central parity extension with the displayed presentation.
API quantumParityDegree [signature omitted pending the boundary above]: The source G-degree on PBW generators.
API tensorParityGroup [signature omitted pending the boundary above]: G^⊗n with the central order-two elements identified.
Test parity_v_square [required example; omitted if its carrier/condition is absent]: The degree of v²=q is 1.
Test parity_K_square [required example; omitted if its carrier/condition is absent]: The degree of K_α² is 1.
Test parity_tensor_zero [required example; omitted if its carrier/condition is absent]: G^⊗0 is the two-element central group, not a trivial group.

ArithmeticQuantumTopology:QT.4/strong-kirby-colors
Name: strong_kirby_colors
Carrier/condition boundary: mathlib:IsPrimitiveRoot
Specification: For g, let D=|X/Y|, d=d_max, r=ord ξ, and choose ζ with ζ^(2D)=ξ (ζ evaluates v^(1/D)). The half-open weight box P_ζ consists of λ=Σ k_iω_i, 0≤k_i<2rD. Ω^g_ζ=Σ_(λ∈Pζ)qdim(V_λ)V_λ; Ω^(Pg)_ζ restricts λ to Y. A strong Kirby color satisfies the source strong handle-slide condition, nonzero ±1 Gauss values, and r>d(h∨−1). Define Z′_g,Z′_Pg as admissible lifts, and Z_g,Z_Pg as their images ξ. Odd r supplies projective admissibility and even r supplies full admissibility under that bound; individual lifts with the same ξ can differ. No semisimplicity at all these roots is asserted.
API StrongKirbyColor [signature omitted pending the boundary above]: The finite color with root bound, sliding condition and nonzero Gauss factors.
API admissibleRootLifts [signature omitted pending the boundary above]: Z′_g and Z′_Pg retain the root lift ζ.
API admissibleQRoots [signature omitted pending the boundary above]: Images under ζ↦ζ^(2D).
Test kirby_root_bound [required example; omitted if its carrier/condition is absent]: A root with r≤d(h∨−1) does not meet the declared strong-color bound.
Test kirby_gauss_vanishing_Aodd [required example; omitted if its carrier/condition is absent]: For A_ℓ, ℓ odd, ord ζ≡2 mod4 gives a vanishing full Gauss sum, so this lift is excluded.
Test kirby_root_one_convention [required example; omitted if its carrier/condition is absent]: At ξ=1 τ is defined as 1 separately; the strong-color root bound does not silently include it.

ArithmeticQuantumTopology:QT.4/general-wrt-comparison
Name: general_wrt_comparison
Carrier/condition boundary: HabiroCyclotomicCompletions:HC.3/evaluation-at-a-root-of-unity
Specification: At each ξ∈Z_g or Z_Pg, choose a corresponding strong Kirby lift ζ. On IHS surgery links the normalized finite color quotient using Ω^g_ζ or Ω^(Pg)_ζ is independent of the admissible lift and equals ev_ξ J_M^g. The quotient divides by separate J_(U+)(Ω)^σ+ and J_(U−)(Ω)^σ−, both nonzero. Equality outside these admissible sets is not claimed for an existing conventional RT invariant.

ArithmeticQuantumTopology:QT.5/extended-pre-bloch
Name: extended_pre_bloch
Carrier/condition boundary: ArithmeticQuantumTopology/G5; K3BlochGroups:V.3/pre-bloch-group
Specification: Let FT be the five-shape locus (x,y,y/x,(1−1/x)/(1−1/y),(1−x)/(1−y)), x,y∉{0,1},x≠y. In the fivefold Neumann cover, choose the component FT̂₀ containing the all-principal lifts when all five shapes are in the upper half-plane; put FT̂=FT̂₀+V, where V consists of sheet pairs ((p₀,q₀),(p₁,q₁),(p₁−p₀,q₂),(p₁−p₀+q₁−q₀,q₂−q₁),(q₁−q₀,q₂−q₁−p₀)). P̂(ℂ) is the free abelian group on the cover modulo the alternating lifted five-term relations AND [z;p,q]+[z;p′,q′]=[z;p,q′]+[z;p′,q]. The second relation is the transfer relation; omitting it retains an extra ℤ/2.
API LiftedFiveTerm [signature omitted pending the boundary above]: Membership in FT̂₀+V, not every unrestricted tuple of lifts.
API transferRelation [signature omitted pending the boundary above]: The four-term sheet interchange relation.
API extendedPreBloch [signature omitted pending the boundary above]: The quotient by lifted five-term and transfer relations.
API forget [signature omitted pending the boundary above]: The homomorphism forgetting sheet coordinates to P(ℂ).
Test lifted_five_term_general [required example; omitted if its carrier/condition is absent]: Forgetting a permitted lifted relation gives the ordinary five-term relation.
Test transfer_zero [required example; omitted if its carrier/condition is absent]: [z;1,1]+[z;0,0]−[z;1,0]−[z;0,1]=0 in this quotient.
Test lift_sheet_constraint [required example; omitted if its carrier/condition is absent]: For shapes in FT⁺, arbitrary sheet choices violating p₂=p₁−p₀ are not the specified lifted relation.

ArithmeticQuantumTopology:QT.5/extended-bloch-kernel
Name: extended_bloch_kernel
Carrier/condition boundary: ArithmeticQuantumTopology/G5; K3BlochGroups:V.3/exterior-kernel-bloch-group; K3BlochGroups:V.4/suslin-exact-sequence
Specification: The homomorphism ν:P̂(ℂ)→ℂ∧_ℤℂ is ν[z;p,q]=(log z+pπi)∧(−log(1−z)+qπi). Define B̂(ℂ)=ker ν, a subgroup of P̂. Forgetting gives the Neumann ordinary Bloch convention ker([z]↦2z∧(1−z)); its comparison with the K3 supplier’s antisymmetric-tensor and exterior-kernel conventions must use the named comparison, not an integral equality of all those groups.
API extendedDehn [signature omitted pending the boundary above]: The displayed logarithmic wedge homomorphism.
API extendedBloch [signature omitted pending the boundary above]: Its kernel subgroup.
API extendedBloch_forget [signature omitted pending the boundary above]: Forgetting gives an ordinary Bloch class in the explicitly stated convention.
Test extendedBloch_zero [required example; omitted if its carrier/condition is absent]: The zero class is in the kernel.
Test extendedDehn_transfer [required example; omitted if its carrier/condition is absent]: The four sheet-interchange terms have wedge sum zero.
Test extendedDehn_sheet_change [required example; omitted if its carrier/condition is absent]: Changing p by 1 changes ν by πi∧(−log(1−z)+qπi); individual generators are not automatically in the kernel.

ArithmeticQuantumTopology:QT.5/strong-flattening
Name: strong_flattening
Carrier/condition boundary: ArithmeticQuantumTopology/G4; tauceti:TauCetiRoadmap/GeometricTopology#layer-7-riemannian-geometric-structures-and-volume
Specification: For a G-labelled ordered 3-cycle K, G=PSL₂(ℂ) with discrete topology, choose developing boundary points giving nondegenerate simplex shapes. A flattening has zero parity on every normal path and zero log-parameter sum about every edge; it is strong if the log parameter also vanishes on normal paths in each vertex star. Neumann proves existence of a strong flattening. For complete finite-volume hyperbolic M use an ordered hybrid ideal/ordinary refinement with compatible face orderings; an unordered ideal triangulation alone may give only B̂/C₆. Existence of that geometric refinement is imported from the cusped GeometricTopology Part II request.
API StrongFlattening [signature omitted pending the boundary above]: Simplex flattenings satisfying edge, parity and vertex-star normal-path equations.
API strongFlattening_exists [signature omitted pending the boundary above]: Existence for the stated labelled ordered nondegenerate 3-cycle.
API strongFlattening_refinement [signature omitted pending the boundary above]: Compatible ordered geometric refinements preserve the resulting class.
Test strongFlattening_edge [required example; omitted if its carrier/condition is absent]: Every edge has log-parameter sum zero.
Test strongFlattening_parity [required example; omitted if its carrier/condition is absent]: An edge-log solution with an odd normal-path parity is not a strong flattening.
Test strongFlattening_ordering [required example; omitted if its carrier/condition is absent]: An un-ordered ideal triangulation is not the input of the full B̂-class theorem; its unordered invariant can lose C₆ information.

ArithmeticQuantumTopology:QT.5/extended-rogers-regulator
Name: extended_rogers_regulator
Carrier/condition boundary: Polylogarithms:P.1/bloch-wigner-dilogarithm; Polylogarithms:P.2/bloch-wigner-descent
Specification: On the cut-cover chart put R(z;p,q)=Li₂(z)+½log z log(1−z)+(πi/2)(p log(1−z)+q log z)−π²/6 modulo π²ℤ. The cover transition and both relation families make R:P̂(ℂ)→ℂ/π²ℤ an additive homomorphism. Restrict to B̂(ℂ). The Li₂ branch and ordinary Bloch–Wigner descent are imported from Polylogarithms; the π² quotient and sheet terms are QT’s extra geometric data.
API extendedRogers [signature omitted pending the boundary above]: The normalized expression in ℂ/π²ℤ.
API extendedRogers_transfer [signature omitted pending the boundary above]: The four-term transfer relation maps to zero.
API extendedRogers_liftedFiveTerm [signature omitted pending the boundary above]: A permitted lifted five-term relation maps to zero modulo π².
Test rogers_normalizing_constant [required example; omitted if its carrier/condition is absent]: At p=q=0 the value includes −π²/6; omitting it changes this normalization.
Test rogers_sheet_p [required example; omitted if its carrier/condition is absent]: Changing p by 2 adds πi log(1−z) before reducing periods.
Test rogers_not_plain_BlochWigner [required example; omitted if its carrier/condition is absent]: The complex regulator retains a real Chern–Simons term modulo π²; its target is not just ℝ.

ArithmeticQuantumTopology:QT.5/number-field-geometric-bloch-class
Name: number_field_geometric_bloch_class
Carrier/condition boundary: ArithmeticQuantumTopology/G4; ArithmeticQuantumTopology/G5; K3BlochGroups:V.3/exterior-kernel-bloch-group; K3BlochGroups:V.3/bloch-group; Polylogarithms:P.2/bloch-wigner-descent
Specification: For a chosen algebraic nondegenerate complete gluing solution with all shapes in a number field F, the signed symbol sum is first an element of P(F). To place it in the selected Bloch group one must prove the appropriate exterior/antisymmetric boundary vanishes and compare Neumann’s factor-two convention with K3BlochGroups. The trace-field realization must also identify the chosen embedding and any necessary field extension. For the standard figure-eight solution z₆²−z₆+1=0, F=ℚ(√−3), the ordinary class 2[z₆] has zero exterior boundary since 1−z₆=z₆⁻¹ and regulator 2D(z₆). No unverified general integral trace-field descent is asserted.

ArithmeticQuantumTopology:QT.6/neumann-zagier-datum
Name: neumann_zagier_datum
Carrier/condition boundary: mathlib:Matrix.det
Specification: An NZ datum Ξ=(A,B,ν,z,f,f″) comes from an actual ideal triangulation with a selected edge equation removed and a peripheral equation added. (A|B) is an integral upper symplectic half, hence ABᵀ=BAᵀ and rank(A|B)=N. Shapes z_j∉{0,1} solve ∏_j z_j^A_ij(1−1/z_j)^B_ij=(−1)^ν_i. Integer flattening vectors satisfy Af+Bf″=ν (and f′=1−f−f″ with the full incidence equations). For the formal Gaussian route impose det B≠0 and det Λ≠0, Λ=−B⁻¹A+diag(1/(1−z_j)). Λ is symmetric over ℚ(z). This is more than arbitrary integer matrices.
API NZDatum [signature omitted pending the boundary above]: The triangulation-derived matrices, shapes and flattening satisfying the stated equations.
API NZHessian [signature omitted pending the boundary above]: Λ=−B⁻¹A+diag(1/(1−z)).
API NZHessian_symmetric [concrete component above; full object still uses stated boundary]: ABᵀ=BAᵀ and invertible B imply symmetry of Λ.
API NZDatum_nonDegenerate [signature omitted pending the boundary above]: Both B and Λ are invertible and all shapes avoid 0 and 1.
Test NZ_singular_B [required example; omitted if its carrier/condition is absent]: A datum with det B=0 is excluded from this coordinate Gaussian formula.
Test NZ_degenerate_shape [required example; omitted if its carrier/condition is absent]: A shape 1 makes the Hessian and gluing coordinates invalid.
Test NZ_hessian_one_variable [required example; omitted if its carrier/condition is absent]: For A=0,B=1,z=1/2 the algebraic Hessian equals 2; this matrix computation alone does not certify a manifold datum.

ArithmeticQuantumTopology:QT.6/formal-nz-state-integral
Name: formal_nz_state_integral
Carrier/condition boundary: HabiroNahmSeries:HB.4/formal-gaussian-integration; Polylogarithms:P.1; QSeriesPartitionsAndMockModularForms:QM.0
Specification: For nondegenerate Ξ define ψ_h(x,z)=exp(−Σ_(k,ℓ≥0;k+ℓ/2>1) B_k x^ℓ h^(k+ℓ/2−1) Li_(2−k−ℓ)(z)/(k!ℓ!)). These nonpositive-index polylogarithms are rational functions of z. Put F_h^Ξ=exp(√h xᵀ(1−B⁻¹ν)/2+h fᵀB⁻¹Af/8)∏_jψ_h(x_j,z_j). Define Φ^Ξ(h)=⟨F_h^Ξ⟩_Λ using the imported formal Gaussian bracket at covariance Λ⁻¹. The result lies in ℚ(z)[[h]] with constant 1: Gaussian parity removes half-integral powers. This is a formal construction with no analytic contour or error assertion. It differs from the DG ψ normalization by the stated exp(h/12−x√h/2) factor.
API NZVertexSeries [signature omitted pending the boundary above]: The normalized ψ_h series with Bernoulli coefficients.
API NZFormalIntegrand [signature omitted pending the boundary above]: F_h^Ξ including its flattening exponential.
API formalNZStateIntegral [signature omitted pending the boundary above]: The imported Gaussian bracket of F_h^Ξ.
API formalNZStateIntegral_constant [signature omitted pending the boundary above]: Its constant coefficient is 1.
API formalNZStateIntegral_integralPowers [signature omitted pending the boundary above]: The resulting half-variable series descends to integer h powers.
Test formalNZ_constant [required example; omitted if its carrier/condition is absent]: At h=0 Φ^Ξ=1.
Test formalNZ_odd_moment [required example; omitted if its carrier/condition is absent]: The √h coefficient vanishes by Gaussian parity.
Test formalNZ_normalization [required example; omitted if its carrier/condition is absent]: Replacing GSW ψ by DG ψ without its exp(h/12−x√h/2) correction changes the resulting coefficients.

ArithmeticQuantumTopology:QT.6/formal-state-integral-invariance
Name: formal_state_integral_invariance
Carrier/condition boundary: ArithmeticQuantumTopology/G4; HabiroNahmSeries:HB.4/formal-gaussian-integration; tauceti:TauCetiRoadmap/GeometricTopology#layer-7-riemannian-geometric-structures-and-volume
Specification: Φ^Ξ is invariant under the GSW changes of quad, edge/peripheral choice and integer flattening and under a nondegenerate 2–3 Pachner move, with the normalization above. For the geometric discrete-faithful solution of a complete finite-volume cusped hyperbolic M the canonical Epstein–Penner cell decomposition and connected regular refinements give a topological invariant Φ_M∈k_M[[h]], k_M the invariant trace field. This does not assert connectivity of all ideal triangulations seeing an arbitrary representation.

ArithmeticQuantumTopology:QT.6/nz-to-integral-nahm
Name: nz_to_integral_nahm
Carrier/condition boundary: ArithmeticQuantumTopology/G6; HabiroNahmSeries:HB.8; K3BlochGroups:V.3/cgz-published-bloch-group
Specification: If B is unimodular over ℤ, N=I−B⁻¹A is symmetric integral. If additionally B⁻¹ν≡diag(N)+1 mod2, the NZ gluing equations are exactly 1−z_j=(−1)^N_jj∏_i z_i^N_ij. The Gaussian Hessian is Λ=N+diag(z_j/(1−z_j)); its determinant agrees with the Nahm discriminant δ=∏_j z_j^(−N_jj)det(diag(1−z)N+diag z) after the indicated nonzero monomial factors. If det B≠0 but B is not unimodular, N can be rational and this is not an input to the symmetric-integral HB.9 theorem. For the standard figure-eight comparison the Bloch index is 2[z₆] over ℚ(√−3).

ArithmeticQuantumTopology:QT.6/topological-habiro-module-comparison
Name: topological_habiro_module_comparison
Carrier/condition boundary: ArithmeticQuantumTopology/G6; HabiroNahmSeries:HB.8/refinement-gaussian-identification; HabiroNahmSeries:HB.9/module-membership; HabiroNumberFields:HB.6; HabiroNumberFields:HB.7; K3BlochGroups:V.3/cgz-published-bloch-group
Specification: For a nondegenerate isolated solution of the symmetric integral N Nahm equations obtained by the preceding qualified bridge, import the HB.8 refined Gaussian collection and HB.9 theorem giving Φ_(N,z)∈H_(R[δ^(−1/2)],ξ) at root orders prime to Δ, where ξ=Σ_j[z_j] in the checked CGZ convention. The coefficient ring R is the arithmetic ring of the chosen number field with the required units and bad-prime localization; HNF HB.6/HB.7 supply the Frobenius ring and K₃-indexed module. Identifying this collection with the normalized geometric NZ series requires the explicit phase/one-loop and classical-exponential comparison. It is a separate obligation, not an automatic assertion that every formal NZ series is in that module. At primitive order k the geometric input is the root-refined DG2 series, with the finite cyclic average and one-loop factor above. Its matching with HB.8’s refined Gaussian collection is a normalization obligation under the integral/parity hypotheses, not mere evaluation of the k=1 series.

ArithmeticQuantumTopology:QT.6/faddeev-quantum-dilogarithm
Name: faddeev_quantum_dilogarithm
Carrier/condition boundary: ArithmeticQuantumTopology/G7; Polylogarithms:P.1; mathlib:MeasureTheory.integral; mathlib:Complex.integral_boundary_rect_eq_zero_of_differentiableOn
Specification: For Re b>0, Im b≥0 put c_b=i(b+b⁻¹)/2. In |Im z|<|Im c_b| define Φ_b(z)=exp(∫_(ℝ+i0) e^(−2izw)/(4 sinh(bw)sinh(w/b)w) dw), with the prescribed contour passing above w=0, and extend meromorphically. Zeros are −c_b−mib−nib⁻¹ and poles are c_b+mib+nib⁻¹, m,n≥0, with multiplicities when the lattice points coincide. b↦b⁻¹ is its self-duality. An arbitrary ordinary real-axis integral through w=0 is not this definition.
API faddeevPhi [signature omitted pending the boundary above]: The strip integral with the above-zero contour prescription and meromorphic continuation.
API faddeevPhi_selfDual [signature omitted pending the boundary above]: Φ_b(z)=Φ_(1/b)(z).
API faddeevPhi_divisor [signature omitted pending the boundary above]: The stated zeros/poles with their multiplicities.
Test faddeevPhi_zero_pole [required example; omitted if its carrier/condition is absent]: −c_b is a zero and +c_b is a pole; exchanging them reverses the convention.
Test faddeevPhi_selfDual_b1 [required example; omitted if its carrier/condition is absent]: At b=1 the self-duality fixes the parameter.
Test faddeevPhi_contour_prescription [required example; omitted if its carrier/condition is absent]: The defining integrand has a singularity at w=0; the unsubtracted ordinary integral over ℝ is not the above-zero contour definition.

ArithmeticQuantumTopology:QT.6/faddeev-functional-inversion
Name: faddeev_functional_inversion
Carrier/condition boundary: QSeriesPartitionsAndMockModularForms:QM.0
Specification: As meromorphic identities, Φ_b(z−i b^(±1)/2)=(1+exp(2π b^(±1)z))Φ_b(z+i b^(±1)/2), and Φ_b(z)Φ_b(−z)=ζ_inv⁻¹exp(iπz²), ζ_inv=exp(iπ(1+2c_b²)/6). Where Im b²>0 the product formula is (exp(2πb(z+c_b));exp(2πib²))_∞/(exp(2πb⁻¹(z−c_b));exp(−2πib⁻²))_∞. Equalities at poles are understood meromorphically, not as ordinary finite complex values.

ArithmeticQuantumTopology:QT.6/faddeev-operator-pentagon
Name: faddeev_operator_pentagon
Carrier/condition boundary: ArithmeticQuantumTopology/G7; AutomorphicSpectralTheory:AS.0
Specification: On the standard Schrödinger Hilbert space L²(ℝ), for self-adjoint position and momentum p,q with [p,q]=1/(2πi) on the common invariant Schwartz core and b>0, the bounded unitary functional-calculus operators satisfy Φ_b(p)Φ_b(q)=Φ_b(q)Φ_b(p+q)Φ_b(p). The closure of p+q and the functional calculus are supplier analytic inputs. This operator identity is distinct from the formal noncommutative q-dilogarithm pentagon owned by HC.1.

ArithmeticQuantumTopology:QT.6/selected-analytic-state-integrals
Name: selected_analytic_state_integrals
Carrier/condition boundary: mathlib:MeasureTheory.integral; mathlib:Complex.integral_boundary_rect_eq_zero_of_differentiableOn
Specification: Choose b∈(0,1], ℏ=(b+b⁻¹)⁻², and n=2 or 3. For ε∈(0,π) define g_n(ℏ)=(2π√ℏ)⁻¹∫_(ℝ−iε) Φ_b(z/(2π√ℏ))^(−n)exp(iz²/(4πℏ)) dz, oriented left to right. The strip avoids poles of Φ_b⁻¹ (nearest is at Im z=−π); its tails decay on both ends for n>1. Cauchy deformation identifies permitted ε, defining the ℝ−i0 boundary value. AK’s figure-eight and 5₂ examples identify the absolute values of g₂ and g₃ with their selected knot state integrals after explicit unit-modulus phase correction; the exact phases are tracked in sourceIssues. General contour/analytic gluing invariance is not inferred from the formal NZ theorem.
API analyticStateIntegral [signature omitted pending the boundary above]: The displayed g_n with its b,ℏ and horizontal contour.
API analyticStateIntegral_contour [signature omitted pending the boundary above]: Permitted ε in the pole-free strip give the same value.
API analyticStateIntegral_knotExamples [signature omitted pending the boundary above]: The selected AK knot kernels at x=0 agree in absolute value after the explicit phases.
Test stateIntegral_pole_boundary [required example; omitted if its carrier/condition is absent]: The line Im z=−π reaches a pole of the inverse Φ integrand and is excluded.
Test stateIntegral_hbar_b1 [required example; omitted if its carrier/condition is absent]: At b=1 the declared parameter is ℏ=1/4.
Test stateIntegral_phase_52 [required example; omitted if its carrier/condition is absent]: χ₅₂(0)=exp(−iπ/3)g₃, so absolute values agree but exact complex values require that phase.

ArithmeticQuantumTopology:QT.6/selected-state-integral-volume
Name: selected_state_integral_volume
Carrier/condition boundary: ArithmeticQuantumTopology/G7; Polylogarithms:P.1; HabiroNahmSeries:HB.4
Specification: For the AK selected n=2,3 integrals, as ℏ→0+ on the b→0+ branch, v_n(z)=−nLi₂(−e^z)−z²/2 has v′_n(z)=n log(1+e^z)−z. The source’s contour-selected critical point z_n minimizes Im v_n in the stated strip. Its steepest-descent expansion has leading exp(v_n(z_n)/(2πiℏ)) g(z_n)^(−n)/√(i v″_n(z_n)) (1+O(ℏ)). Thus lim_(ℏ→0+)2πℏ log|g₂|=−Vol(S³∖4₁) and similarly g₃ gives −Vol(S³∖5₂). These are decay limits for AK integrals; they are not Kashaev growth theorems. Uniform deformation/error details at the Lean proof boundary are recorded as an analytic gap.

ArithmeticQuantumTopology:QT.7/representation-indexed-perturbative-family
Name: representation_indexed_perturbative_family
Carrier/condition boundary: HabiroCyclotomicCompletions:HC.3/the-taylor-map; HabiroCyclotomicCompletions:HC.3/re-expansion-of-taylor-expansions
Specification: For a knot with a finite set P_K of isolated boundary-parabolic SL₂(ℂ) representations (including the trivial σ₀), fix their branches, complex-volume representatives Vσ and perturbative normalizations. The geometric σ₁ and conjugate geometric representation are distinguished. Define κσ₀=3/2 and κσ=0 otherwise, and the selected series Φ_ασ(h), with Jσ(α)=Φ_ασ(0), α∈ℚ/ℤ. The trivial series is the rootwise Taylor series of the knot Habiro element in the chosen q=e(α)e^(−h) convention; nontrivial series use a qualified formal NZ datum and its one-loop normalization. For 4₁ |P|=3 and for 5₂ |P|=4. General well-definedness for all representations/triangulations is a comparison obligation, not the geometric GSW theorem.
API KnotPerturbativeFamily [signature omitted pending the boundary above]: The finite representation index, volumes, weights, branches and normalized series.
API representationWeight [signature omitted pending the boundary above]: 3/2 on the trivial representation and zero elsewhere.
API generalizedKashaev [signature omitted pending the boundary above]: The constant term Jσ(α) of a supplied normalized series.
API trivialSeries_Taylor [signature omitted pending the boundary above]: The trivial series uses the exact rootwise Habiro Taylor convention.
Test representationWeight_trivial [required example; omitted if its carrier/condition is absent]: κσ₀=3/2 and Vσ₀=0.
Test representationIndex_41 [required example; omitted if its carrier/condition is absent]: The selected figure-eight family has three representations.
Test representationIndex_52 [required example; omitted if its carrier/condition is absent]: The selected 5₂ family has four representations.
Test nonisolated_representation [required example; omitted if its carrier/condition is absent]: A nonisolated or degenerate stationary point is not an input to the declared one-loop formal formula.

ArithmeticQuantumTopology:QT.7/denominator-volume-cocycle
Name: denominator_volume_cocycle
Carrier/condition boundary: QSeriesPartitionsAndMockModularForms:QM.5/quantum-modular-cocycle
Specification: For γ=(a b;c d)∈PSL₂(ℤ), x=r/s∈ℚ in lowest terms with s>0 and cr+ds≠0, set λγ(x)=c/[s(cr+ds)]. It is independent of the sign of the matrix representative. Whenever γ′x and γγ′x are finite, λ_(γγ′)(x)=λγ(γ′x)+λγ′(x). The corresponding diagonal twist exp(Ṽσ λγ(x)), Ṽσ=Vσ/(2πi), combines with |cx+d|^κσ to give the GZ tweaked automorphy factor. The rational pole exclusions are part of the domain.
API denominatorCocycle [concrete component above; full object still uses stated boundary]: λγ(x) on the declared pole-free rational domain.
API denominatorCocycle_comp [concrete component above; full object still uses stated boundary]: The additive composition identity with both pole exclusions.
API tweakedAutomorphy [signature omitted pending the boundary above]: The diagonal exp(Ṽσλγ)|cx+d|^κσ.
API tweakedAutomorphy_comp [signature omitted pending the boundary above]: The factors compose on the common pole-free domain.
Test lambda_T [required example; omitted if its carrier/condition is absent]: For T=(1 1;0 1), λ_T(x)=0.
Test lambda_S_one [required example; omitted if its carrier/condition is absent]: For S=(0 −1;1 0), λ_S(1)=1.
Test lambda_S_zero [required example; omitted if its carrier/condition is absent]: x=0 is excluded from λ_S because Sx is infinite.
Test lambda_sign [required example; omitted if its carrier/condition is absent]: γ and −γ give the same λ.

ArithmeticQuantumTopology:QT.7/generalized-quantum-modularity
Name: generalized_quantum_modularity
Carrier/condition boundary: Local prerequisites in the definitive packet; see its exact hypotheses.
Specification: Conjecture (GZ GQMC): for every supplied representation σ, γ=(a b;c d), c>0, and rational X→+∞ with bounded denominator, (cX+d)^(−κσ) exp(−Ṽσλγ(X))Jσ(γX)∼Jσ(X)Φ̂_(a/c)^geo(2πi/[c(cX+d)]). The trivial σ reduces to the original QMC; nontrivial σ has weight zero but retains its complex-volume twist. All-orders error statements are analytic conjectures; neither the formal series nor the cocycle identity proves them.

ArithmeticQuantumTopology:QT.7/lift-from-values-to-series
Name: lift_from_values_to_series
Carrier/condition boundary: ArithmeticQuantumTopology/G8; HabiroCyclotomicCompletions:HC.3/the-taylor-map; HabiroCyclotomicCompletions:HC.3/re-expansion-of-taylor-expansions
Specification: Conjecture (GZ §§3.2): put ℏ=h/(2πi), x=X−ℏ and h*=h/[(cx+d)(cX+d)]. The generalized value relation lifts coefficientwise to (cX+d)^(−κσ)exp(−Ṽσλγ(X))Φ_(γX)^σ(h*)∼Φ_X^σ(h)Φ̂_(a/c)^geo(2πi/[c(cx+d)]). In completed scalar normalization this is Φ̂_(γX)^σ(h*)∼(cx+d)^(−κσ)Φ̂_X^σ(h)Φ̂_(a/c)^geo(2πi/[c(cx+d)]). Formal coefficients in h each have their own all-orders 1/X assertion; one must not differentiate a rational-point asymptotic statement as if it were a smooth function.

ArithmeticQuantumTopology:QT.7/quadratic-relations
Name: quadratic_relations
Carrier/condition boundary: Local prerequisites in the definitive packet; see its exact hypotheses.
Specification: Conjecture (GZ): Σ_(σ∈P_K∖{σ₀})Φ_ασ(h)Φ_(−α)^σ(−h)=0, with the chosen phases and representation index. It excludes the trivial representation. For 4₁ the identity follows formally from Φ_α^anti(h)=iΦ_(−α)^geo(−h). For 5₂ the nontrivial relation is supported by source computations, not a general theorem; its arithmetic trace interpretation must use the same embeddings and phase.

ArithmeticQuantumTopology:QT.7/coefficient-asymptotics
Name: coefficient_asymptotics
Carrier/condition boundary: ArithmeticQuantumTopology/G8
Specification: GZ’s experimental large-n expansion couples A_ασ(n)=[h^n]Φ_ασ to all other representations through Γ(n−ℓ+κσ)/(Vσ−Vσ′)^(n−ℓ+κσ), an integer matrix M_K and a phase-dependent prefactor. The printed CoeffAsymp uses (2π)^(κσ−1) and M₄₁=((0,1,−1),(0,0,−3),(0,3,0)); its phase must be reconciled with the adjacent coupled formulas containing 1/(2πi), as recorded in sourceIssues. A verified figure-eight target is AnFirst: A(n)∼(3/(2π))Σ_ℓ(−1)^ℓ A(ℓ)(n−ℓ−1)!/(2Vgeo)^(n−ℓ). Distinct action differences, branches and truncation meanings are required. These are conjectural knot statements; general resurgence/Borel summation theory is outside QT.

ArithmeticQuantumTopology:QT.7/matrix-refined-quantum-modularity
Name: matrix_refined_quantum_modularity
Carrier/condition boundary: ArithmeticQuantumTopology/G8
Specification: GZ supplies selected square matrices Φ_α^(σ,σ′)(h) and J(α)=Φ_α(0), indexed by P_K, with row-wise completions (den(α)h/(2πi))^κσ exp(Vσ/[den(α)²h]). Its matrix RQMC asserts Φ̂_(γX)(h*)≈jγ(x)Φ̂_X(h)Φ̂_(a/c)(2πi/[c(cx+d)]), x=X−h/(2πi), h*=h/[(cx+d)(cX+d)], for bounded-denominator X→+∞ and c>0. This is conjectural and also has a normalization obligation: the printed positive row-weight factor must be reconciled with the scalar completed negative factor in GQMChhh, before transporting a single convention. General matrix invertibility, topological well-definedness and analytic completion are not assumptions silently discharged by GSW’s geometric scalar theorem.

ArithmeticQuantumTopology:QT.7/knot-matrix-cocycle
Name: knot_matrix_cocycle
Carrier/condition boundary: QSeriesPartitionsAndMockModularForms:QM.5/quantum-modular-cocycle
Specification: Given the selected knot matrix J(x) with invertible values and a diagonal tweaked factor j̃ satisfying j̃_(γγ′)(x)=j̃γ(γ′x)j̃γ′(x), set Wγ(x)=J(γx)⁻¹j̃γ(x)J(x) on the common rational pole-free domain. Then W_(γγ′)(x)=Wγ(γ′x)Wγ′(x) is a proved algebraic identity under these explicit hypotheses. GZ’s general invertibility/unimodularity assertion is conjectural, so the unconditional knot theorem requires that separate comparison. QT owns the selected knot matrix and this comparison; the general quantum modular/cocycle framework is imported from QM.5.
API knotMatrixCocycle [signature omitted pending the boundary above]: The stated conjugated automorphy factor on its domain.
API knotMatrixCocycle_comp [signature omitted pending the boundary above]: The ordered multiplicative cocycle identity under invertibility.
API knotMatrixCocycle_id [signature omitted pending the boundary above]: The identity group element gives the identity matrix.
Test matrixCocycle_constant [required example; omitted if its carrier/condition is absent]: J=I and j̃=I give W=I.
Test matrixCocycle_noncommutative_order [required example; omitted if its carrier/condition is absent]: The composition multiplies Wγ(γ′x) before Wγ′(x).
Test matrixCocycle_singular_J [required example; omitted if its carrier/condition is absent]: A singular J(x) does not define a GL-valued W by this formula.

ArithmeticQuantumTopology:QT.7/cocycle-analytic-extension
Name: cocycle_analytic_extension
Carrier/condition boundary: ArithmeticQuantumTopology/G8; QSeriesPartitionsAndMockModularForms:QM.5; mathlib:MeasureTheory.integral; mathlib:Complex.integral_boundary_rect_eq_zero_of_differentiableOn
Specification: GZ conjectures that Wγ on ℚ∖{γ⁻¹(∞)} extends real analytically to ℝ∖{γ⁻¹(∞)}. For c≠0 the exceptional point is −d/c. The restriction to (−d/c,∞) extends holomorphically to ℂ∖(−∞,−d/c], and the restriction to (−∞,−d/c) extends holomorphically to ℂ∖[−d/c,∞). For c=0 there is no finite exceptional point. RQMC further predicts Wγ(X)≈Φ̂_(a/c)(2πi/[c(cX+d)])⁻¹ for c>0. Algebraic composition and formal inverses do not prove any analytic extension. Generic smooth/holomorphic quantum modular criteria are requested from QM.5, Part II; QT supplies the knot matrices.

ArithmeticQuantumTopology:QT.7/figure-eight-habiro-descendants
Name: figure_eight_habiro_descendants
Carrier/condition boundary: HabiroCyclotomicCompletions:HC.1/the-cyclotomic-completion; HabiroCyclotomicCompletions:HC.2/factorial-series; HabiroCyclotomicCompletions:HC.3/evaluation-at-a-root-of-unity
Specification: For m∈ℤ define H_m(q)=Σ_(n≥0)(q;q)_n(q⁻¹;q⁻¹)_n q^(mn) in the integral ordinary Habiro ring. Laurent monomials q^(mn) cause no denominator problem because q is a unit; the summands are cofinally factorial-divisible. The exact recurrence is q^(m+1)H_(m+1)+(1−2q^m)H_m+q^(m−1)H_(m−1)=1. H₀ is the figure-eight Kashaev element, and the first descendant matrix row is (1,H₀,½(qH₁−q⁻¹H₋₁)); the last entry is in ½ times the integral Habiro ring. Its Taylor coefficient of (q−1)² is −½, so it is not an element of the integral ℤ-Habiro ring. The source explicitly only asserts visible integral membership after multiplying this entry by 2. Nontrivial matrix rows involve the selected shape-field branches and are not ordinary integral Habiro elements by this formula alone.
API figureEightDescendant [signature omitted pending the boundary above]: The integral Habiro series H_m for every integer m.
API figureEightDescendant_recurrence [signature omitted pending the boundary above]: The displayed inhomogeneous three-term recurrence.
API figureEightDescendant_eval [signature omitted pending the boundary above]: At a root of order N only n<N contribute.
API figureEightDescendant_firstRow [signature omitted pending the boundary above]: The trivial row (1,H₀,Q₂) in the scalar extension by ½, with 2Q₂ integral; Q₂ is not in the integral ℤ-Habiro ring.
Test descendant_root_one [required example; omitted if its carrier/condition is absent]: ev₁H_m=1 for every m.
Test descendant_root_minus_one [required example; omitted if its carrier/condition is absent]: ev₋₁H_m=1+4(−1)^m.
Test descendant_root_three [required example; omitted if its carrier/condition is absent]: For a primitive cube root ζ, evζH₀=13.
Test descendant_recurrence_root_one [required example; omitted if its carrier/condition is absent]: At q=1 the recurrence gives 1−1+1=1.
Test descendant_half_row_not_integral [required example; omitted if its carrier/condition is absent]: The Taylor coefficient of (q−1)² in Q₂ is −½; an implementation placing this matrix entry in the integral ℤ-Habiro ring contradicts its Taylor map.

ArithmeticQuantumTopology:QT.7/bettin-drappeau-proved-cases
Name: bettin_drappeau_proved_cases
Carrier/condition boundary: ArithmeticQuantumTopology/G3; ArithmeticQuantumTopology/G7; Polylogarithms:P.1; HabiroNahmSeries:HB.4; QSeriesPartitionsAndMockModularForms:QM.0
Specification: Bettin–Drappeau prove positive-q modular asymptotics for the ten hyperbolic knots 4₁,5₂,6₁,6₂,6₃,7₃,7₄,7₅,7₆,7₇ (7₂ is excluded). Write J⁺_K(x)=J^red_(K,c)(exp(2πix)), c=den(x). For γ with α=γ∞∈ℚ and h=2πi/(x−γ⁻¹∞), for every M and rational x→+∞ of bounded denominator: J⁺_K(γx)/J⁺_K(x)=(2π/h)^(3/2)exp(i(Vol−iCS)/h)C_K(α)(Σ_(0≤n<M)D_(K,n)(α)h^n+O(h^M)). The error constant depends on α, the denominator bound and M; D_(K,n)∈F_K(e(α)); C=e(ν_K s(α)/2)c^(ν_K/2)Λ_(K,α)^(1/c)δ_K^(−1/2), with Λ in that field and δ in F_K. Branches follow the source. Its positive-q convention is compared explicitly with GZ’s negative-q colored-Jones definition before identifying phases; the general matrix refinements are not proved by this theorem.

ArithmeticQuantumTopology:QT.6/ak-leveled-positive-shapes
Name: ak_leveled_positive_shapes
Carrier/condition boundary: tauceti:TauCetiRoadmap/GeometricTopology#layer-1-manifold-library-buildout-general-dimension-general-structure-group
Specification: On an imported finite ordered oriented pseudo-3-manifold X with orientation-reversing order-preserving face pairings, a shape assigns α>0 to each local edge, with the three angles at every tetrahedron vertex summing to π. Opposite edges have equal angles. The weight ω(e) is the sum of local angles over each global edge. Balanced means internal and ω=2π; fully balanced means every edge is balanced, hence the face boundary is empty. A level is ℓ∈ℝ. With p sending a local edge to its opposite-edge pair and ε the orientation-induced cyclic antisymmetric incidence, a boundary-zero gauge g shifts α(a) by πΣ_b ε_(p(a),p(b))g(edge(b)), and shifts ℓ by Σ_e g(e)Σ_(a over e)(1/3−α(a)/π), retaining positivity. Leveled shaped equivalence uses gauge equivalence after common vertex-preserving shaped 3↔2 refinements. The inverse 2→3 move requires existence of positive new angles; it is not automatically allowed. The AK admissibility condition is H₂(X∖vertices;ℤ)=0, and composition is allowed only if the glued result remains admissible.
API AKShape.weight [signature omitted pending the boundary above]: ω(e)=Σ_(local a over e)α(a).
API AKShape.charge [signature omitted pending the boundary above]: c(a)=α(a)/(2π); each tetrahedron has three opposite-edge charges summing to 1/2.
API AKShape.gauge [signature omitted pending the boundary above]: The stated gauge action and level shift on the domain retaining positive angles; boundary gauges vanish.
API AKShape.admissible [signature omitted pending the boundary above]: Admissibility is H₂ of the complement of vertices equal to zero; it is checked again after gluing.
Test ak_regular_charges [required example; omitted if its carrier/condition is absent]: The regular tetrahedron has all local angles π/3 and all three charges 1/6.
Test ak_fullyBalanced_boundary [required example; omitted if its carrier/condition is absent]: A shape with a boundary edge cannot be fully balanced under AK’s definition.
Test ak_positive_inverse_move [required example; omitted if its carrier/condition is absent]: A proposed 2→3 move without positive new angles is excluded, even if its formal linear angle equations have a real solution.

ArithmeticQuantumTopology:QT.6/ak-charged-tetrahedron-kernel
Name: ak_charged_tetrahedron_kernel
Carrier/condition boundary: ArithmeticQuantumTopology/G7; mathlib:SchwartzMap; mathlib:TemperedDistribution; mathlib:TemperedDistribution.delta; mathlib:SchwartzMap.fourierTransformCLM; AutomorphicSpectralTheory:AS.0
Specification: For λ with ℏ=(λ+λ⁻¹)⁻²>0 and the AK quantum-dilogarithm parameter domain, put c_λ=i(λ+λ⁻¹)/2. Charges a,c>0 and b=1/2−a−c>0 define ψ_(a,c)(x)=Φ_λ(x−2c_λ(a+c))⁻¹ exp(−4πi c_λ a(x−c_λ(a+c))) exp(−πi c_λ²(4(a−c)+1)/6). Its Fourier transform is ψ̃_(a,c)(x)=∫ℝ ψ_(a,c)(y)exp(−2πixy)dy, absolutely convergent, and ψ̃′_(a,c)(x)=exp(−πix²)ψ̃_(a,c)(x)=exp(−πi/12)ψ_(c,b)(x). The positive charged kernel is the tempered distribution δ(x₀+x₂−x₁)ψ̃′_(a,c)(x₃−x₂)exp(2πix₀(x₃−x₂)); the negative kernel is its conjugate transpose. For an ordered tetrahedron, a=α(v₀v₁)/(2π) and c=α(v₀v₃)/(2π). The Dirac factor is a distribution supported on a hyperplane, never an ordinary complex-valued function.
API chargedPsi [concrete component above; full object still uses stated boundary]: The displayed charged scalar function with all three charges positive.
API chargedPsi_fourier [concrete component above; full object still uses stated boundary]: exp(−πix²) times its Fourier transform equals exp(−πi/12)ψ_(c,b)(x).
API chargedTetrahedronKernel [concrete component above; full object still uses stated boundary]: The specified distribution on four real face coordinates.
API chargedTetrahedronKernel_adjoint [signature omitted pending the boundary above]: Orientation reversal gives the conjugate transpose with incoming and outgoing face coordinates exchanged.
Test chargedPsi_regular [required example; omitted if its carrier/condition is absent]: At a=c=1/6 the third charge is b=1/6; the Fourier transform cycles the same charge triple with the specified phase.
Test chargedKernel_hyperplane [required example; omitted if its carrier/condition is absent]: The kernel pairs to zero against any test function supported away from x₀+x₂−x₁=0.
Test chargedKernel_zero_charge [required example; omitted if its carrier/condition is absent]: The charge boundary a=0 is outside the strictly positive construction; a limiting or residue invariant requires a separate theorem.

ArithmeticQuantumTopology:QT.6/ak-charged-pentagon
Name: ak_charged_pentagon
Carrier/condition boundary: ArithmeticQuantumTopology/G7; AutomorphicSpectralTheory:AS.0
Specification: For positive charge pairs (a_j,c_j), b_j=1/2−a_j−c_j>0, satisfying a₁=a₀+a₂, a₃=a₂+a₄, c₁=c₀+a₄, c₃=a₀+c₄, c₂=c₁+c₃, the charged operators satisfy T₁₂(a₄,c₄)T₁₃(a₂,c₂)T₂₃(a₀,c₀)=exp(πi c_λ²P_e/3)T₂₃(a₁,c₁)T₁₂(a₃,c₃), where P_e=2(c₀+a₂+c₄)−1/2. This is an equality of the admitted continuous Schwartz/distribution kernels. Products and contractions are defined only with the necessary generic analytic extension conditions. The scalar is part of the equality and is canceled by the AK level shift under the corresponding shaped Pachner move.

ArithmeticQuantumTopology:QT.6/ak-leveled-state-integral
Name: ak_leveled_state_integral
Carrier/condition boundary: ArithmeticQuantumTopology/G7; mathlib:TemperedDistribution; AutomorphicSpectralTheory:AS.0
Specification: For ℏ>0, the AK state integral F_ℏ(X,ℓ)=Z_ℏ(X)exp(iπℓ/(4ℏ)) is obtained by tensoring the signed charged tetrahedron kernels and contracting each identified face variable over ℝ. Its objects are finite face sets, and the morphism associated to X is in S′(ℝ^(boundary faces)). Generic contraction A:n→m, B:m→l is (π_(n,l))_*(π_(n,m)^*A·π_(m,l)^*B), admitted only when the two pulled-back wavefront sets have no opposite covectors at a common base point and their product extends continuously to the enlarged Schwartz test space S(ℝ^(n⊔m⊔l))_m of AK Appendix B. It is a partial composition, not unrestricted multiplication of distributions. On the shape/gauge/Pachner domain above this gives the stated level-normalized construction; convergence and well-definedness are the separate following theorem. Empty face boundary gives a complex scalar.
API akStateIntegral [signature omitted pending the boundary above]: The tensor contraction of signed charged kernels with exp(iπℓ/(4ℏ)), only on the admitted contraction domain.
API akStateIntegral_levelShift [concrete component above; full object still uses stated boundary]: Adding u to ℓ multiplies F by exp(iπu/(4ℏ)).
API akStateIntegral_glue [signature omitted pending the boundary above]: The distributional composition equality for a glued admissible composite, with transversality and extension discharged by the convergence theorem.
API akStateIntegral_closed [signature omitted pending the boundary above]: No boundary face variables identify the output distribution with a complex scalar.
Test ak_level_shift [required example; omitted if its carrier/condition is absent]: At ℏ>0 a level increase of 8ℏ leaves F unchanged because its phase is exp(2πi).
Test ak_bad_distribution_product [required example; omitted if its carrier/condition is absent]: δ₀·δ₀ on the same coordinate has opposite wavefront covectors and is excluded from this composition rule.
Test ak_closed_output [required example; omitted if its carrier/condition is absent]: The output for an empty face boundary has no free face-coordinate dependence; cusp links at deleted vertices do not add boundary-face variables.

ArithmeticQuantumTopology:QT.6/ak-state-integral-invariance
Name: ak_state_integral_invariance
Carrier/condition boundary: ArithmeticQuantumTopology/G7; tauceti:TauCetiRoadmap/GeometricTopology#layer-1-manifold-library-buildout-general-dimension-general-structure-group; AutomorphicSpectralTheory:AS.0
Specification: For every positively shaped pseudo-3-manifold X satisfying H₂(X∖vertices;ℤ)=0, Z_ℏ(X) is a well-defined tempered distribution. Thus F_ℏ is the AK unique *-functor on the admissible leveled shaped cobordism categroid: it respects composition exactly when the composite is admissible, orientation reversal by adjoint, and the gauge/common vertex-preserving shaped-Pachner equivalence defined above. The level compensates the charged pentagon and gauge phases. Fully balanced admissible leveled objects have empty face boundary and give scalar invariants of this qualified equivalence class. This does not assert invariance under arbitrary moves that add/remove vertices, or convergence for every shape or homology type.

ArithmeticQuantumTopology:QT.7/ak-knot-comparison-conjecture
Name: ak_knot_comparison_conjecture
Carrier/condition boundary: ArithmeticQuantumTopology/G7
Specification: Conjecture (AK, for a hyperbolic knot K in a closed oriented compact 3-manifold M): there is a smooth J_(M,K)(ℏ,x) on ℝ_>0×ℝ. (1) Every fully balanced positive ideal triangulation X of M∖K has a gauge-invariant real linear angle form λ and a real quadratic angle form φ with Z_ℏ(X)=exp(iφ/ℏ)∫ℝ J_(M,K)(ℏ,x)exp(−xλ/√ℏ)dx. (2) For any positive one-vertex H-triangulation Y approachable by weights tending to τ(K)=0 and τ(other edges)=2π, there is a real quadratic angle form ϕ such that lim_(ω→τ) Φ_b((π−ω(K))/(2πi√ℏ))Z_ℏ(Y)=exp(iϕ/ℏ−iπ/12)J_(M,K)(ℏ,0). (3) lim_(ℏ→0+)2πℏ log|J_(M,K)(ℏ,0)|=−Vol(M∖K). All relevant existence, convergence and limiting conditions are part of the conjecture. AK’s Theorem th:4-1--5-2 proves its three parts for (S³,4₁) and (S³,5₂), using χ₄₁ and χ₅₂. The general analytic/formal NZ identification additionally needs matched saddle, logarithmic branches, classical action, one-loop determinant and all-orders error estimates; no such universal comparison follows from formal Pachner invariance.

ArithmeticQuantumTopology:QT.7/kashaev-volume-conjecture
Name: kashaev_volume_conjecture
Carrier/condition boundary: Local prerequisites in the definitive packet; see its exact hypotheses.
Specification: For a hyperbolic knot K⊂S³, put ⟨K⟩_N=J^red_(K,N)(exp(2πi/N)), with dimension N and zero framing, reduced before root evaluation. The volume conjecture is lim_(N→∞)(2π/N)log|⟨K⟩_N|=Vol(S³∖K). It is conjectural for general K. With the unknot/reduced and negative-q conventions compared, γ=S sends X=N to −1/N in the quantum modular conjecture and recovers this leading exponential assertion. The volume assertion is weaker than an all-orders QMC expansion. AK’s negative decay-volume limit concerns a different analytic invariant and is not a proof of this growth statement. The separate BD theorem supplies its specified family and stronger QMC asymptotics with the positive-q normalization.

ArithmeticQuantumTopology:QT.2/unified-kashaev-invariant
Name: unified_kashaev_invariant
Carrier/condition boundary: HabiroCyclotomicCompletions:HC.1/the-cyclotomic-completion; HabiroCyclotomicCompletions:HC.3/evaluation-at-a-root-of-unity
Specification: For a zero-framed knot K with integral cyclotomic coefficients a_n(K)=J_K(P″_n), define H_K(q)=Σ_(n≥0) a_n(K)∏_(i=1)^n(2−q^i−q⁻ⁱ)=Σ a_n(K)(q;q)_n(q⁻¹;q⁻¹)_n in the scalar integral Habiro ring. This is evaluation C²↦4 of the central σ_n expansion; each product is (−1)^n q^(−n(n+1)/2)(q;q)_n², so the series converges in that ring. At a primitive root ζ of order N, evaluation equals the reduced dimension-N colored Jones polynomial J^red_(K,N)(ζ), and terms n≥N vanish. The unknot gives 1 and the order-one value is 1. This construction gives the unified Kashaev element without introducing the entire two-variable completion; that extension belongs to the recorded Part II.
API unifiedKashaevInvariant [signature omitted pending the boundary above]: The displayed factorial-square series in the imported integral Habiro ring.
API unifiedKashaevInvariant_eval [signature omitted pending the boundary above]: At primitive order N its evaluation is J^red_(K,N)(ζ).
API unifiedKashaevInvariant_truncate [signature omitted pending the boundary above]: At order N only terms n<N contribute.
API unifiedKashaevInvariant_unknot [signature omitted pending the boundary above]: The unified unknot invariant equals 1.
Test unifiedKashaev_unknot [required example; omitted if its carrier/condition is absent]: The unknot gives the constant element 1.
Test unifiedKashaev_order_one [required example; omitted if its carrier/condition is absent]: At q=1 only a₀(K)=1 remains.
Test unifiedKashaev_factorial_square [required example; omitted if its carrier/condition is absent]: The n-th product equals (−1)^n q^(−n(n+1)/2)(q;q)_n², hence has at least twice the factorial divisibility.

ArithmeticQuantumTopology:QT.6/root-nz-data
Name: root_nz_data
Carrier/condition boundary: ArithmeticQuantumTopology/G6; HabiroNahmSeries:HB.4/formal-gaussian-integration; QSeriesPartitionsAndMockModularForms:QM.0
Specification: Fix a geometric NZ datum Ξ with B∈GL_N(ℤ), symmetric Q=B⁻¹A, nonzero determinant of Λ=−Q+diag(z′), a primitive k-th root ζ, k>0, and choices θ_i^k=z_i. Put F=ℚ(z), F_k=F(ζ), E=F_k(θ); the actual Kummer Galois group embeds into (ℤ/kℤ)^N and need not be the whole product. For m represented by integers 0≤m_i<k, put a_m(θ)=exp(−πi mᵀQm) exp(πi(mᵀQm+mᵀB⁻¹ν)/k) ∏_i θ_i^(−(Qm)_i)/(ζθ_i⁻¹;ζ)_(m_i). These denominators are nonzero since z_i≠1. Assume S=Σ_m a_m≠0 and set Av(g)=Σ_m a_m g(m)/S. Put D*_k(x)=∏_(s=1)^(k−1)(1−ζ⁻ˢx)^s. With chosen roots, τ_(Ξ,k)=k^(−N/2)[det(A diag(z″)+B diag(z⁻¹)) z^(f″/k)(z″)^(−f/k)]^(−1/2)∏_i D*_k(θ_i⁻¹)^(1/k) S. The displayed fractional monomials use the chosen θ_i and roots of z″_i, not unspecified powers. The invariant scalar is qualified modulo its 2k-th-root ambiguity; it is not canonically an element of F_k.
API RootNZDatum.weights [signature omitted pending the boundary above]: The explicit a_m on (ZMod k)^N with stated integral and root choices.
API RootNZDatum.average [signature omitted pending the boundary above]: Σa_m g(m)/Σa_m, only with nonzero denominator.
API cyclicDilogarithmStar [concrete component above; full object still uses stated boundary]: The finite product D*_k(x).
API RootNZDatum.oneLoop [signature omitted pending the boundary above]: The exact τ formula with chosen square and k-th roots.
Test rootNZ_k_one [required example; omitted if its carrier/condition is absent]: For k=1, the finite average has one summand, D*₁=1 and θ=z.
Test rootNZ_denominator [required example; omitted if its carrier/condition is absent]: If the weighted sum S is zero, the normalized average is outside the constructor’s domain.
Test rootNZ_kummer_relations [required example; omitted if its carrier/condition is absent]: Repeated shapes θ₁=θ₂ cannot admit an independent automorphism rotating only θ₁ in their actual splitting field.

ArithmeticQuantumTopology:QT.6/root-refined-nz-series
Name: root_refined_nz_series
Carrier/condition boundary: ArithmeticQuantumTopology/G6; HabiroNahmSeries:HB.4/formal-gaussian-integration; Polylogarithms:P.1
Specification: On RootNZDatum, define the filtered vertex series Ψ_(k,h)(x,θ,m)=exp(Σ_(n,j≥0;n+j/2>1) h^(n+j/2−1)(−1)^j/(n!j!k^j) Σ_(s=1)^k B_n(s/k)Li_(2−n−j)(ζ^(m+s)θ⁻¹)x^j). All polylogarithm indices here are nonpositive; each coefficient is rational in the indicated algebraic arguments. Define F_(k,h)(x;m)=exp(−√h xᵀB⁻¹ν/(2k)+h fᵀB⁻¹ν/(8k))∏_iΨ_(k,h)(x_i,θ_i,m_i). The Gaussian bracket has Hessian Λ/k, hence covariance kΛ⁻¹. Put φ⁺_(Ξ,ζ)(h)=Av(⟨F_(k,h)⟩) and φ_(Ξ,ζ)=τ_(Ξ,k)φ⁺_(Ξ,ζ). Wick parity and coefficientwise finiteness give φ⁺∈1+hE[[h]]. This filtered definition is the rescaled form of DG2’s explicit §2.4 diagram rules: Π=hkΛ⁻¹, valence-zero vertices start at n=2, valence-one/two at n=1 and valence≥3 at n=0. It corrects the unfiltered printed block (E19). It is not obtained by substituting a root into the k=1 series. Choice/topological invariance and identification with Kashaev asymptotics are DG2’s qualified conjecture, modulo ζ^(1/12)exp(h/(24k)); GSW’s k=1 theorem alone proves neither at all roots.
API rootNZVertexSeries [signature omitted pending the boundary above]: The displayed degree-filtered Bernoulli-polynomial vertex expansion.
API rootNZFormalSeries [signature omitted pending the boundary above]: The normalized finite average of Gaussian brackets, with Hessian Λ/k.
API rootNZFormalSeries_constant [signature omitted pending the boundary above]: The constant coefficient of φ⁺ equals 1.
API rootNZFormalSeries_descent [signature omitted pending the boundary above]: Its coefficients lie in F(ζ), independently of the k-th shape-root choices, by the following arithmetic theorem.
Test rootNZ_constant [required example; omitted if its carrier/condition is absent]: φ⁺(0)=1 whenever S≠0.
Test rootNZ_odd_moment [required example; omitted if its carrier/condition is absent]: Wick parity removes all odd √h powers.
Test rootNZ_valence_three [required example; omitted if its carrier/condition is absent]: The n=0, j=3 vertex is necessary: two such vertices with three propagators contribute at h¹; the printed n≥1 block omits this two-loop term.

ArithmeticQuantumTopology:QT.6/root-series-arithmetic
Name: root_series_arithmetic
Carrier/condition boundary: ArithmeticQuantumTopology/G6
Specification: For the admitted RootNZDatum with nonzero S, every coefficient of φ⁺_(Ξ,ζ) lies in F(ζ) and is independent of choices θ_i^k=z_i; moreover τ_(Ξ,k)^(2k)∈F(ζ). This proves arithmetic descent of the defined formal series, not its identification with analytic Kashaev asymptotics. The proof uses the actual Kummer subgroup (or universal finite étale root algebra), allowing multiplicative relations among shapes; independent coordinate rotations are not assumed to exist as automorphisms of every selected field component.
-/
