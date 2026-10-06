import Mathlib.Geometry.Manifold.Algebra.LieGroup
import Mathlib.Geometry.Manifold.ContMDiff.Defs
import Mathlib.Algebra.Lie.UniversalEnveloping
import Mathlib.Algebra.Lie.Basic
import Mathlib.Algebra.Lie.Subalgebra
import Mathlib.Algebra.Lie.Rank
import Mathlib.Algebra.Algebra.Subalgebra.Basic
import Mathlib.RepresentationTheory.Basic
import Mathlib.RepresentationTheory.FDRep
import Mathlib.LinearAlgebra.PiTensorProduct.Basic
import Mathlib.Algebra.Colimit.Module
import Mathlib.MeasureTheory.Group.FundamentalDomain
import Mathlib.MeasureTheory.Integral.IntervalIntegral.Basic
import Mathlib.Analysis.Complex.UpperHalfPlane.MoebiusAction
import Mathlib.Algebra.Lie.TensorProduct
import Mathlib.RingTheory.MvPolynomial.Basic
import Mathlib.RepresentationTheory.Continuous.Basic
import Mathlib.RepresentationTheory.Homological.ContCohomology.Basic
import Mathlib.LinearAlgebra.Alternating.Basic
import Mathlib.LinearAlgebra.ExteriorAlgebra.Basic
import Mathlib.LinearAlgebra.RootSystem.Defs
import Mathlib.Topology.Algebra.RestrictedProduct.Basic
import Mathlib.Topology.LocallyConstant.Basic
import Mathlib.Topology.Algebra.Support
import Mathlib.Analysis.Normed.Operator.Compact.Basic
import Mathlib.MeasureTheory.Measure.Haar.Basic
import Mathlib.NumberTheory.ModularForms.Basic
import Mathlib.NumberTheory.ModularForms.SlashActions
import Mathlib.NumberTheory.NumberField.AdeleRing
import Mathlib.NumberTheory.NumberField.InfinitePlace.Basic
import Mathlib.LinearAlgebra.Matrix.SpecialLinearGroup
import Mathlib.FieldTheory.IntermediateField.Basic
import Mathlib.FieldTheory.Galois.Basic
import Mathlib.NumberTheory.Padics.PadicIntegers
import Mathlib.GroupTheory.OrderOfElement

/-!
# Automorphic forms on reductive groups: suggested Lean forms

This file is not the roadmap and is not exhaustive. The roadmap document
`research/blueprint/readmes/AutomorphicFormsOnReductiveGroups.md` and the blueprint packet are
definitive; the statements below suggest Lean forms so that contributors and reviewers converge on
names and signatures. Every proof is `sorry`; nothing here claims an implementation.

Conventions of this prototype.

* The shared build used to elaborate this file contains Mathlib (commit 082e2d3) but not the pinned
  Tau Ceti, so Tau Ceti declarations (`TauCeti.vermaCentralCharacter`, `TauCeti.dominantChamber`,
  `TauCeti.haarAverage`, the Lie group exponential, Hecke operators on modular forms) are not
  imported; where a statement needs them it is phrased with Mathlib objects or omitted.
* Objects that other roadmaps own appear as explicitly named stand-ins, bundled in structures whose
  fields are the imported data: `AdelicData` (AdelicAlgebraicGroups AA.1-AA.3: G(𝔸) = G(F_∞) × G(𝔸_f),
  rational points, heights), the derived action of `U(𝔤_ℂ)` (built from left-invariant vector
  fields; Tau Ceti LieGroups), and `ParabolicData` (rational parabolics and their unipotent
  radicals). They must be replaced by the actual imported structures in an implementation.
* Unit tests are `example`s preceded by a comment `-- test: <name>` giving the packet's name.
-/

set_option linter.unusedSectionVars false
set_option linter.unusedVariables false
set_option linter.unusedSimpArgs false

noncomputable section

open scoped Manifold ContDiff Topology TensorProduct
open Set Filter

namespace TauCeti

/-! ## Stand-ins imported from other roadmaps -/

/-- Stand-in for AdelicAlgebraicGroups AA.1-AA.3: the adelic points `G(𝔸) = Ginf × Gf` of a
connected reductive group over a number field, its rational points, and a height. -/
structure AdelicData (Ginf Gf : Type*) [Group Ginf] [Group Gf] where
  /-- `G(F)` embedded diagonally. -/
  rational : Subgroup (Ginf × Gf)
  /-- A height `‖·‖` on `G(𝔸)` (AdelicAlgebraicGroups AA.3/adelic-height). -/
  height : Ginf × Gf → ℝ
  one_le_height : ∀ g, 1 ≤ height g
  height_mul_le : ∀ x y, height (x * y) ≤ height x * height y
  height_inv_le : ∃ C N : ℝ, ∀ x, height x⁻¹ ≤ C * height x ^ N

namespace Automorphic

variable {Ginf Gf : Type*} [Group Ginf] [TopologicalSpace Ginf] [IsTopologicalGroup Ginf]
  [Group Gf] [TopologicalSpace Gf] [IsTopologicalGroup Gf]

/-! ## AF.0 Test functions and growth -/

section AF0

variable {E : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E] {H : Type*} [TopologicalSpace H]
  (I : ModelWithCorners ℝ E H) [ChartedSpace H Ginf]

/-- Right invariance under a subgroup of the finite-adelic factor. -/
def IsLevelInvariant (f : Ginf × Gf → ℂ) (J : Subgroup Gf) : Prop :=
  ∀ (g : Ginf × Gf) (j : J), f (g.1, g.2 * j) = f g

/-- `AF.0/smooth-adelic-function`: smooth functions on `G(𝔸)`: right invariant under a compact open
subgroup of `G(𝔸_f)` and `C^∞` in the archimedean variable. -/
def IsSmoothAdelic (f : Ginf × Gf → ℂ) : Prop :=
  (∃ J : Subgroup Gf, IsOpen (J : Set Gf) ∧ IsCompact (J : Set Gf) ∧ IsLevelInvariant f J) ∧
    ∀ gf : Gf, ContMDiff I 𝓘(ℝ, ℂ) ∞ (fun x : Ginf => f (x, gf))

/-- `Automorphic.SmoothAdelicFunction`: the subalgebra of smooth functions. -/
def SmoothAdelicFunction : Subalgebra ℂ (Ginf × Gf → ℂ) where
  carrier := {f | IsSmoothAdelic I f}
  mul_mem' := sorry
  add_mem' := sorry
  algebraMap_mem' := sorry

theorem mem_smoothAdelicFunction_iff (f : Ginf × Gf → ℂ) :
    f ∈ SmoothAdelicFunction (Gf := Gf) I ↔ IsSmoothAdelic I f := Iff.rfl

theorem SmoothAdelicFunction.exists_level {f : Ginf × Gf → ℂ}
    (hf : f ∈ SmoothAdelicFunction (Gf := Gf) I) :
    ∃ J : Subgroup Gf, IsOpen (J : Set Gf) ∧ IsCompact (J : Set Gf) ∧ IsLevelInvariant f J :=
  sorry

/-- Right translation `R(y)f(g) = f(gy)`. -/
def rightTranslate (y : Ginf × Gf) (f : Ginf × Gf → ℂ) : Ginf × Gf → ℂ := fun g => f (g * y)

theorem SmoothAdelicFunction.rightTranslate [LieGroup I ∞ Ginf] {f : Ginf × Gf → ℂ}
    (hf : f ∈ SmoothAdelicFunction (Gf := Gf) I) (y : Ginf × Gf) :
    Automorphic.rightTranslate y f ∈ SmoothAdelicFunction (Gf := Gf) I := sorry

theorem rightTranslate_mul (y z : Ginf × Gf) (f : Ginf × Gf → ℂ) :
    rightTranslate (y * z) f = rightTranslate y (rightTranslate z f) := by
  funext g; simp [rightTranslate, mul_assoc]

/-- The complexified enveloping algebra `U(𝔤_ℂ)` of the archimedean Lie algebra acts on smooth
functions by the derived right regular action (stand-in: constructed from left-invariant vector
fields on `Ginf`). -/
structure DerivedAction (𝔤 : Type*) [LieRing 𝔤] [LieAlgebra ℂ 𝔤] (Ginf Gf : Type*) where
  act : UniversalEnvelopingAlgebra ℂ 𝔤 →ₐ[ℂ] Module.End ℂ (Ginf × Gf → ℂ)

variable {𝔤 : Type*} [LieRing 𝔤] [LieAlgebra ℂ 𝔤]

/-- `Automorphic.SmoothAdelicFunction.derivAction`: `X ↦ R(X)` restricted to `𝔤`. -/
def SmoothAdelicFunction.derivAction (R : DerivedAction 𝔤 Ginf Gf) (X : 𝔤) :
    Module.End ℂ (Ginf × Gf → ℂ) :=
  R.act (UniversalEnvelopingAlgebra.ι ℂ X)

/-- `X ↦ R(X)` is a Lie algebra action. -/
theorem SmoothAdelicFunction.derivAction_lie (R : DerivedAction 𝔤 Ginf Gf) (X Y : 𝔤) :
    SmoothAdelicFunction.derivAction R ⁅X, Y⁆ =
      SmoothAdelicFunction.derivAction R X * SmoothAdelicFunction.derivAction R Y -
        SmoothAdelicFunction.derivAction R Y * SmoothAdelicFunction.derivAction R X := sorry

theorem SmoothAdelicFunction.derivAction_comm_finite (R : DerivedAction 𝔤 Ginf Gf)
    (X : 𝔤) (yf : Gf) (f : Ginf × Gf → ℂ) :
    SmoothAdelicFunction.derivAction R X (Automorphic.rightTranslate ((1 : Ginf), yf) f) =
      Automorphic.rightTranslate ((1 : Ginf), yf) (SmoothAdelicFunction.derivAction R X f) := sorry

/-- `Automorphic.SmoothAdelicFunction.derivAction_conj`: `R(y∞) R(X) R(y∞)⁻¹ = R(Ad(y∞)X)`, for an
adjoint action `Ad` supplied with the Lie group. -/
theorem SmoothAdelicFunction.derivAction_conj (R : DerivedAction 𝔤 Ginf Gf)
    (Ad : Ginf → 𝔤 →ₗ⁅ℂ⁆ 𝔤) (y : Ginf) (X : 𝔤) (f : Ginf × Gf → ℂ) :
    Automorphic.rightTranslate (y, (1 : Gf))
      (SmoothAdelicFunction.derivAction R X (Automorphic.rightTranslate (y⁻¹, (1 : Gf)) f)) =
      SmoothAdelicFunction.derivAction R (Ad y X) f := sorry

theorem SmoothAdelicFunction.iUnion_level (f : Ginf × Gf → ℂ) :
    f ∈ SmoothAdelicFunction (Gf := Gf) I ↔
      (∀ gf : Gf, ContMDiff I 𝓘(ℝ, ℂ) ∞ (fun x : Ginf => f (x, gf))) ∧
        ∃ J : Subgroup Gf, IsOpen (J : Set Gf) ∧ IsCompact (J : Set Gf) ∧ IsLevelInvariant f J :=
  sorry

-- test: smoothAdelicFunction_const
example [CompactSpace Gf] (c : ℂ) : (fun _ : Ginf × Gf => c) ∈ SmoothAdelicFunction (Gf := Gf) I :=
  sorry

-- test: smoothAdelicFunction_gl1_example (stated for an abstract compact open `J` and a smooth
-- archimedean factor; the GL₁ instance needs the adelic points of GL₁ from AA.1)
example (J : Subgroup Gf) (hJo : IsOpen (J : Set Gf)) (hJc : IsCompact (J : Set Gf))
    (u : Ginf → ℂ) (hu : ContMDiff I 𝓘(ℝ, ℂ) ∞ u) :
    (fun g : Ginf × Gf => u g.1 * Set.indicator (J : Set Gf) (fun _ => (1 : ℂ)) g.2) ∈
      SmoothAdelicFunction (Gf := Gf) I := sorry

-- test: smoothAdelicFunction_not_of_continuous
example (f : Ginf × Gf → ℂ) (hf : ∀ J : Subgroup Gf, IsOpen (J : Set Gf) → ¬ IsLevelInvariant f J) :
    f ∉ SmoothAdelicFunction (Gf := Gf) I := sorry

/-- `AF.0/adelic-test-functions`: `C_c^∞(G(𝔸))`, smooth compactly supported functions. -/
def TestFunction : Submodule ℂ (Ginf × Gf → ℂ) where
  carrier := {f | IsSmoothAdelic I f ∧ HasCompactSupport f}
  add_mem' := sorry
  zero_mem' := sorry
  smul_mem' := sorry

theorem mem_testFunction_iff (f : Ginf × Gf → ℂ) :
    f ∈ TestFunction (Gf := Gf) I ↔ IsSmoothAdelic I f ∧ HasCompactSupport f := Iff.rfl

variable [MeasurableSpace Ginf] [MeasurableSpace Gf]

/-- Convolution `f * h (g) = ∫ f(x) h(x⁻¹ g) dx` for a Haar measure `μ` on `G(𝔸)`. -/
def convolution (μ : MeasureTheory.Measure (Ginf × Gf)) (f h : Ginf × Gf → ℂ) : Ginf × Gf → ℂ :=
  fun g => ∫ x, f x * h (x⁻¹ * g) ∂μ

theorem TestFunction.convolution (μ : MeasureTheory.Measure (Ginf × Gf)) {f h : Ginf × Gf → ℂ}
    (hf : f ∈ TestFunction (Gf := Gf) I) (hh : h ∈ TestFunction (Gf := Gf) I) :
    Automorphic.convolution μ f h ∈ TestFunction (Gf := Gf) I := sorry

theorem TestFunction.convolution_assoc (μ : MeasureTheory.Measure (Ginf × Gf)) {f h k : Ginf × Gf → ℂ}
    (hf : f ∈ TestFunction (Gf := Gf) I) (hh : h ∈ TestFunction (Gf := Gf) I)
    (hk : k ∈ TestFunction (Gf := Gf) I) :
    Automorphic.convolution μ (Automorphic.convolution μ f h) k =
      Automorphic.convolution μ f (Automorphic.convolution μ h k) := sorry

/-- `Automorphic.TestFunction.tmulEquiv`: `f∞ ⊗ ff ↦ (g ↦ f∞ g∞ · ff gf)` identifies the tensor
product of the factor spaces with `C_c^∞(G(𝔸))` (stated as the span description). -/
theorem TestFunction.tmulEquiv :
    TestFunction (Gf := Gf) I = Submodule.span ℂ
      {f | ∃ (u : Ginf → ℂ) (v : Gf → ℂ), ContMDiff I 𝓘(ℝ, ℂ) ∞ u ∧ HasCompactSupport u ∧
        IsLocallyConstant v ∧ HasCompactSupport v ∧ f = fun g => u g.1 * v g.2} := sorry

/-- `Automorphic.TestFunction.restrictedTensor`: the finite factor is the directed union of the
spaces supported on `G(F_S) × ∏_{v ∉ S} G(O_v)`; stated for an increasing family of open
subgroups `Gf_S` exhausting `Gf`. -/
theorem TestFunction.restrictedTensor (GS : ℕ → Subgroup Gf) (hGS : Monotone GS)
    (hcover : ∀ g : Gf, ∃ n, g ∈ GS n) (v : Gf → ℂ) (hv : IsLocallyConstant v)
    (hc : HasCompactSupport v) : ∃ n, Function.support v ⊆ GS n := sorry

/-- The idempotent `e_J = vol(J)⁻¹ 1_J` (finite factor). -/
def unitIdempotent (μf : MeasureTheory.Measure Gf) (J : Subgroup Gf) : Gf → ℂ :=
  fun g => ((μf (J : Set Gf)).toReal : ℂ)⁻¹ * Set.indicator (J : Set Gf) (fun _ => 1) g

/-- Convolution on the finite factor. -/
def convolutionFinite (μf : MeasureTheory.Measure Gf) (f h : Gf → ℂ) : Gf → ℂ :=
  fun g => ∫ x, f x * h (x⁻¹ * g) ∂μf

theorem TestFunction.unitIdempotent (μf : MeasureTheory.Measure Gf) (J : Subgroup Gf)
    (hJo : IsOpen (J : Set Gf)) (hJc : IsCompact (J : Set Gf)) (hpos : 0 < μf (J : Set Gf)) :
    convolutionFinite μf (Automorphic.unitIdempotent μf J) (Automorphic.unitIdempotent μf J) =
      Automorphic.unitIdempotent μf J := sorry

/-- `Automorphic.TestFunction.ofLocal`: locally constant compactly supported functions on the finite
factor are the finite parts of test functions (SmoothRepresentationsOfLocalGroups SR.1 carrier). -/
theorem TestFunction.ofLocal [CompactSpace Ginf] (v : Gf → ℂ) (hv : IsLocallyConstant v)
    (hc : HasCompactSupport v) (hI : ∀ gf, ContMDiff I 𝓘(ℝ, ℂ) ∞ (fun _ : Ginf => v gf)) :
    (fun g : Ginf × Gf => v g.2) ∈ TestFunction (Gf := Gf) I := sorry

-- test: testFunction_idempotent
example (μf : MeasureTheory.Measure Gf) (J : Subgroup Gf) (hJo : IsOpen (J : Set Gf))
    (hJc : IsCompact (J : Set Gf)) (h1 : μf (J : Set Gf) = 1) :
    convolutionFinite μf (Set.indicator (J : Set Gf) (fun _ => (1 : ℂ)))
      (Set.indicator (J : Set Gf) (fun _ => 1)) = Set.indicator (J : Set Gf) (fun _ => 1) := sorry

-- test: testFunction_zero
example (μ : MeasureTheory.Measure (Ginf × Gf)) (f : Ginf × Gf → ℂ) :
    Automorphic.convolution μ f 0 = 0 := by
  funext g; simp [Automorphic.convolution]

-- test: testFunction_no_unit
example (μ : MeasureTheory.Measure (Ginf × Gf)) [NoncompactSpace Gf] :
    ¬ ∃ e ∈ TestFunction (Gf := Gf) I, ∀ h ∈ TestFunction (Gf := Gf) I,
      Automorphic.convolution μ e h = h := sorry

-- test: testFunction_local_compat
example (μf : MeasureTheory.Measure Gf) (v w : Gf → ℂ) :
    convolutionFinite μf v w = fun g => ∫ x, v x * w (x⁻¹ * g) ∂μf := rfl

/-- `AF.0/adelic-schwartz-space`: Schwartz functions, rapidly decreasing with all derivatives. -/
def SchwartzFunction (A : AdelicData Ginf Gf) (R : DerivedAction 𝔤 Ginf Gf) :
    Submodule ℂ (Ginf × Gf → ℂ) := sorry

theorem mem_schwartzFunction_iff (A : AdelicData Ginf Gf) (R : DerivedAction 𝔤 Ginf Gf)
    (f : Ginf × Gf → ℂ) : f ∈ SchwartzFunction A R ↔
      IsSmoothAdelic I f ∧ ∃ C : Set Gf, IsCompact C ∧ (∀ g, f g ≠ 0 → g.2 ∈ C) ∧
        ∀ (r : ℕ) (X : UniversalEnvelopingAlgebra ℂ 𝔤), ∃ c : ℝ, ∀ g,
          A.height g ^ r * ‖R.act X f g‖ ≤ c := sorry

/-- `Automorphic.SchwartzFunction.seminorm`: `‖f‖_{r,X} = sup_g ‖g‖^r |R(X)f(g)|`. -/
def SchwartzFunction.seminorm (A : AdelicData Ginf Gf) (R : DerivedAction 𝔤 Ginf Gf) (r : ℕ)
    (X : UniversalEnvelopingAlgebra ℂ 𝔤) (f : Ginf × Gf → ℂ) : ℝ :=
  ⨆ g, A.height g ^ r * ‖R.act X f g‖

theorem SchwartzFunction.convolution (A : AdelicData Ginf Gf) (R : DerivedAction 𝔤 Ginf Gf)
    (μ : MeasureTheory.Measure (Ginf × Gf)) {f h : Ginf × Gf → ℂ} (hf : f ∈ SchwartzFunction A R)
    (hh : h ∈ SchwartzFunction A R) : Automorphic.convolution μ f h ∈ SchwartzFunction A R := sorry

theorem SchwartzFunction.ofTestFunction (A : AdelicData Ginf Gf) (R : DerivedAction 𝔤 Ginf Gf) :
    TestFunction (Gf := Gf) I ≤ SchwartzFunction A R := sorry

-- test: schwartzFunction_gaussian_gl1 (abstract form: a Schwartz function has finite seminorms)
example (A : AdelicData Ginf Gf) (R : DerivedAction 𝔤 Ginf Gf) {f : Ginf × Gf → ℂ}
    (hf : f ∈ SchwartzFunction A R) (r : ℕ) (X : UniversalEnvelopingAlgebra ℂ 𝔤) :
    ∃ c : ℝ, ∀ g, A.height g ^ r * ‖R.act X f g‖ ≤ c := sorry

-- test: schwartzFunction_const_not
example (A : AdelicData Ginf Gf) (R : DerivedAction 𝔤 Ginf Gf)
    (hunb : ¬ BddAbove (Set.range A.height)) :
    (fun _ : Ginf × Gf => (1 : ℂ)) ∉ SchwartzFunction A R := sorry

-- test: schwartzFunction_compact_group
example (A : AdelicData Ginf Gf) (R : DerivedAction 𝔤 Ginf Gf) [CompactSpace Ginf] :
    SchwartzFunction A R = TestFunction (Gf := Gf) I := sorry

/-- `AF.0/moderate-growth`. -/
def HasModerateGrowth (A : AdelicData Ginf Gf) (φ : Ginf × Gf → ℂ) : Prop :=
  ∃ C N : ℝ, ∀ g, ‖φ g‖ ≤ C * A.height g ^ N

/-- `Automorphic.HasModerateGrowth.of_height`: two heights are polynomially comparable
(AdelicAlgebraicGroups AA.3), so moderate growth does not depend on the height. -/
theorem HasModerateGrowth.of_height (A A' : AdelicData Ginf Gf)
    (hcomp : ∃ C M : ℝ, 0 ≤ M ∧ ∀ g, A'.height g ≤ C * A.height g ^ M) (hrat : A.rational = A'.rational)
    {φ : Ginf × Gf → ℂ} (h : HasModerateGrowth A' φ) : HasModerateGrowth A φ := sorry

theorem HasModerateGrowth.add (A : AdelicData Ginf Gf) {φ ψ : Ginf × Gf → ℂ}
    (hφ : HasModerateGrowth A φ) (hψ : HasModerateGrowth A ψ) : HasModerateGrowth A (φ + ψ) := sorry

theorem HasModerateGrowth.mul (A : AdelicData Ginf Gf) {φ ψ : Ginf × Gf → ℂ}
    (hφ : HasModerateGrowth A φ) (hψ : HasModerateGrowth A ψ) : HasModerateGrowth A (φ * ψ) := sorry

theorem HasModerateGrowth.comp_mul_right (A : AdelicData Ginf Gf) {φ : Ginf × Gf → ℂ}
    (hφ : HasModerateGrowth A φ) (y : Ginf × Gf) : HasModerateGrowth A (rightTranslate y φ) := sorry

theorem HasModerateGrowth.of_bounded (A : AdelicData Ginf Gf) {φ : Ginf × Gf → ℂ} (C : ℝ)
    (hC : ∀ g, ‖φ g‖ ≤ C) : HasModerateGrowth A φ :=
  ⟨C, 0, fun g => by simpa using hC g⟩

-- test: hasModerateGrowth_const
example (A : AdelicData Ginf Gf) (c : ℂ) : HasModerateGrowth A (fun _ => c) :=
  HasModerateGrowth.of_bounded A ‖c‖ (fun _ => le_rfl)

-- test: hasModerateGrowth_abs_det (abstract form: a power of the height has moderate growth)
example (A : AdelicData Ginf Gf) (s : ℝ) (hs : 0 ≤ s) :
    HasModerateGrowth A (fun g => ((A.height g ^ s : ℝ) : ℂ)) := sorry

-- test: hasModerateGrowth_exp_not
example (A : AdelicData Ginf Gf) (hunb : ¬ BddAbove (Set.range A.height)) :
    ¬ HasModerateGrowth A (fun g => ((Real.exp (A.height g) : ℝ) : ℂ)) := sorry

-- test: hasModerateGrowth_classical_compat: see `GL2.adelize_moderateGrowth` in the AF.5 section.

/-- `AF.0/uniform-moderate-growth-space`: functions of uniform moderate growth with exponent `N`
(left `G(F)`-invariant, smooth, all `U(𝔤)`-derivatives bounded by `‖g‖^N`). -/
def UniformModerateGrowth (A : AdelicData Ginf Gf) (R : DerivedAction 𝔤 Ginf Gf) (N : ℝ) :
    Submodule ℂ (Ginf × Gf → ℂ) := sorry

theorem mem_uniformModerateGrowth_iff (A : AdelicData Ginf Gf) (R : DerivedAction 𝔤 Ginf Gf)
    (N : ℝ) (φ : Ginf × Gf → ℂ) : φ ∈ UniformModerateGrowth A R N ↔
      IsSmoothAdelic I φ ∧ (∀ γ ∈ A.rational, ∀ g, φ (γ * g) = φ g) ∧
        ∀ X : UniversalEnvelopingAlgebra ℂ 𝔤, ∃ c : ℝ, ∀ g, ‖R.act X φ g‖ ≤ c * A.height g ^ N :=
  sorry

/-- `Automorphic.UniformModerateGrowth.seminorm`: `p_{N,X}(φ) = sup_g ‖g‖^{-N} |R(X)φ(g)|`. -/
def UniformModerateGrowth.seminorm (A : AdelicData Ginf Gf) (R : DerivedAction 𝔤 Ginf Gf) (N : ℝ)
    (X : UniversalEnvelopingAlgebra ℂ 𝔤) (φ : Ginf × Gf → ℂ) : ℝ :=
  ⨆ g, A.height g ^ (-N) * ‖R.act X φ g‖

theorem UniformModerateGrowth.mono (A : AdelicData Ginf Gf) (R : DerivedAction 𝔤 Ginf Gf)
    {N N' : ℝ} (h : N ≤ N') : UniformModerateGrowth A R N ≤ UniformModerateGrowth A R N' := sorry

theorem UniformModerateGrowth.hasModerateGrowth (A : AdelicData Ginf Gf)
    (R : DerivedAction 𝔤 Ginf Gf) {N : ℝ} {φ : Ginf × Gf → ℂ}
    (hφ : φ ∈ UniformModerateGrowth A R N) : HasModerateGrowth A φ := sorry

/-- Stand-in for a rational parabolic `P = M_P N_P` (AdelicAlgebraicGroups AA.3): the left
invariance group `M_P(F) N_P(𝔸)` of functions on `[G]_P`. -/
structure ParabolicData (Ginf Gf : Type*) [Group Ginf] [Group Gf] where
  /-- `M_P(F) N_P(𝔸)` -/
  leftGroup : Subgroup (Ginf × Gf)
  /-- `N_P(𝔸)` -/
  unipotent : Subgroup (Ginf × Gf)
  /-- `N_P(F)` -/
  unipotentRational : Subgroup (Ginf × Gf)
  le_left : unipotent ≤ leftGroup

/-- `Automorphic.UniformModerateGrowth.ofParabolic`: `T_N([G]_P)` for a parabolic. -/
def UniformModerateGrowth.ofParabolic (A : AdelicData Ginf Gf) (R : DerivedAction 𝔤 Ginf Gf)
    (P : ParabolicData Ginf Gf) (N : ℝ) : Submodule ℂ (Ginf × Gf → ℂ) := sorry

-- test: uniformModerateGrowth_const
example (A : AdelicData Ginf Gf) (R : DerivedAction 𝔤 Ginf Gf) [CompactSpace Gf]
    (hR : ∀ X, ∃ c : ℂ, R.act X (fun _ => 1) = fun _ => c) : (fun _ : Ginf × Gf => (1 : ℂ)) ∈ UniformModerateGrowth A R 0 := sorry

-- test: uniformModerateGrowth_gl1_character (abstract form: an eigenfunction of the derived action
-- of polynomial growth lies in `T_N`)
example (A : AdelicData Ginf Gf) (R : DerivedAction 𝔤 Ginf Gf) (χ : Ginf × Gf → ℂ) (N : ℝ)
    (hsm : IsSmoothAdelic I χ) (hinv : ∀ γ ∈ A.rational, ∀ g, χ (γ * g) = χ g)
    (hgrowth : ∀ g, ‖χ g‖ ≤ A.height g ^ N)
    (heig : ∀ X, ∃ c : ℂ, R.act X χ = c • χ) : χ ∈ UniformModerateGrowth A R N := sorry

-- test: uniformModerateGrowth_not_of_moderate
example (A : AdelicData Ginf Gf) (R : DerivedAction 𝔤 Ginf Gf) (ψ : Ginf × Gf → ℂ)
    (X : UniversalEnvelopingAlgebra ℂ 𝔤)
    (hX : ∀ N c : ℝ, ∃ g, c * A.height g ^ N < ‖R.act X ψ g‖) :
    ∀ N, ψ ∉ UniformModerateGrowth A R N := sorry

-- test: uniformModerateGrowth_arthur_compat: definitional, `UniformModerateGrowth` is Arthur's
-- "uniformly tempered" condition.

/-- `AF.0/growth-translation-differentiation`. -/
theorem UniformModerateGrowth.rightTranslate_mem (A : AdelicData Ginf Gf) (R : DerivedAction 𝔤 Ginf Gf)
    {N : ℝ} (hN : 0 ≤ N) {φ : Ginf × Gf → ℂ} (hφ : φ ∈ UniformModerateGrowth A R N) (y : Ginf × Gf) :
    rightTranslate y φ ∈ UniformModerateGrowth A R N := sorry

theorem UniformModerateGrowth.derivAction_mem (A : AdelicData Ginf Gf) (R : DerivedAction 𝔤 Ginf Gf)
    {N : ℝ} {φ : Ginf × Gf → ℂ} (hφ : φ ∈ UniformModerateGrowth A R N)
    (X : UniversalEnvelopingAlgebra ℂ 𝔤) : R.act X φ ∈ UniformModerateGrowth A R N := sorry

/-- `AF.0/convolution-to-uniform-growth`. -/
theorem UniformModerateGrowth.convolution_mem (A : AdelicData Ginf Gf) (R : DerivedAction 𝔤 Ginf Gf)
    (μ : MeasureTheory.Measure (Ginf × Gf)) {φ f : Ginf × Gf → ℂ} {N : ℝ} (hN : 0 ≤ N)
    (hφc : Continuous φ) (hφ : ∀ g, ‖φ g‖ ≤ A.height g ^ N)
    (hφinv : ∀ γ ∈ A.rational, ∀ g, φ (γ * g) = φ g) (hf : f ∈ SchwartzFunction A R) :
    (fun g => ∫ y, f y * φ (g * y) ∂μ) ∈ UniformModerateGrowth A R N := sorry

/-- `AF.0/finite-hecke-action`: the Hecke action of `J`-biinvariant functions by finite sums. -/
def heckeAction (J : Subgroup Gf) (cosets : Finset Gf) (φ : Ginf × Gf → ℂ) : Ginf × Gf → ℂ :=
  fun g => ∑ y ∈ cosets, φ (g * (1, y))

theorem heckeAction_mem (A : AdelicData Ginf Gf) (R : DerivedAction 𝔤 Ginf Gf) {N : ℝ}
    (J : Subgroup Gf) (cosets : Finset Gf) {φ : Ginf × Gf → ℂ}
    (hφ : φ ∈ UniformModerateGrowth A R N) :
    heckeAction J cosets φ ∈ UniformModerateGrowth A R N := sorry

end AF0

end Automorphic

/-! ## AF.1a Relative Lie algebra cohomology, continuous cohomology and van Est -/

namespace RelativeLieCohomology

variable (𝔮 : Type*) [LieRing 𝔮] [LieAlgebra ℂ 𝔮] (K : Type*) [Group K] [TopologicalSpace K]
  [IsTopologicalGroup K]

/-- `AF.1a/gk-pair`: a pair `(𝔮, K)`: an action of `K` on `𝔮` by Lie algebra automorphisms and the
complexified Lie algebra `𝔨_ℂ ⊆ 𝔮` of `K`, stable under `K`. The condition that the differential of
`Ad` is `ad` on `𝔨_ℂ` needs the Lie algebra of `K`, which this prototype does not attach; it is
omitted here (see the packet). -/
structure Pair where
  /-- the adjoint action -/
  Ad : K →* (𝔮 ≃ₗ[ℂ] 𝔮)
  Ad_lie : ∀ (k : K) (x y : 𝔮), Ad k ⁅x, y⁆ = ⁅Ad k x, Ad k y⁆
  /-- the image of `𝔨_ℂ` -/
  kC : LieSubalgebra ℂ 𝔮
  Ad_kC : ∀ (k : K), ∀ x ∈ kC, Ad k x ∈ kC

variable {𝔮 K}

/-- `RelativeLieCohomology.Pair.ofLieGroup`: the pair `(𝔤_ℂ, K)` of a group `G` acting on its
complexified Lie algebra, restricted to a compact subgroup `K`. -/
def Pair.ofLieGroup {G : Type*} [Group G] (Ad : G →* (𝔮 ≃ₗ[ℂ] 𝔮))
    (hAd : ∀ (g : G) (x y : 𝔮), Ad g ⁅x, y⁆ = ⁅Ad g x, Ad g y⁆) (incl : K →* G)
    (kC : LieSubalgebra ℂ 𝔮) (hkC : ∀ (k : K), ∀ x ∈ kC, Ad (incl k) x ∈ kC) : Pair 𝔮 K where
  Ad := Ad.comp incl
  Ad_lie k x y := hAd (incl k) x y
  kC := kC
  Ad_kC k x hx := hkC k x hx

/-- `RelativeLieCohomology.Pair.ofSubalgebra`: the pair `(𝔭, K)` for a `K`-stable subalgebra
`𝔭 ⊇ 𝔨_ℂ`, for example a θ-stable parabolic subalgebra. -/
def Pair.ofSubalgebra (P : Pair 𝔮 K) (𝔭 : LieSubalgebra ℂ 𝔮) (hk : P.kC ≤ 𝔭)
    (hst : ∀ (k : K), ∀ x ∈ 𝔭, P.Ad k x ∈ 𝔭) : Pair 𝔭 K := sorry

/-- `RelativeLieCohomology.Pair.Hom`: morphisms of pairs. -/
structure Pair.Hom {𝔮' K' : Type*} [LieRing 𝔮'] [LieAlgebra ℂ 𝔮'] [Group K'] [TopologicalSpace K']
    [IsTopologicalGroup K'] (P' : Pair 𝔮' K') (P : Pair 𝔮 K) where
  lie : 𝔮' →ₗ⁅ℂ⁆ 𝔮
  grp : K' →* K
  continuous_grp : Continuous grp
  map_kC : ∀ x ∈ P'.kC, lie x ∈ P.kC
  map_Ad : ∀ (k : K') (x : 𝔮'), lie (P'.Ad k x) = P.Ad (grp k) (lie x)

/-- Identity morphism of a pair. -/
def Pair.Hom.id (P : Pair 𝔮 K) : Pair.Hom P P := sorry

/-- `RelativeLieCohomology.Pair.identityComponent`: the pair `(𝔮, K°)`. -/
def Pair.identityComponent (P : Pair 𝔮 K) : Pair 𝔮 (Subgroup.connectedComponentOfOne K) where
  Ad := P.Ad.comp (Subgroup.connectedComponentOfOne K).subtype
  Ad_lie k x y := P.Ad_lie k x y
  kC := P.kC
  Ad_kC k x hx := P.Ad_kC k x hx

-- test: pair_compact
example (P : Pair 𝔮 K) (h : P.kC = ⊤) :
    Module.finrank ℂ (𝔮 ⧸ P.kC.toSubmodule) = 0 := sorry

-- test: pair_gl2_O2 (dimension part, abstractly: `dim 𝔮/𝔨_ℂ = dim 𝔮 − dim 𝔨_ℂ`)
example [FiniteDimensional ℂ 𝔮] (P : Pair 𝔮 K) :
    Module.finrank ℂ (𝔮 ⧸ P.kC.toSubmodule) =
      Module.finrank ℂ 𝔮 - Module.finrank ℂ P.kC.toSubmodule := sorry

-- test: pair_not_without_k
example (P : Pair 𝔮 K) (𝔭 : LieSubalgebra ℂ 𝔮) (h : ¬ P.kC ≤ 𝔭) :
    ¬ ∃ _ : P.kC ≤ 𝔭, ∀ (k : K), ∀ x ∈ 𝔭, P.Ad k x ∈ 𝔭 :=
  fun ⟨hk, _⟩ => h hk

-- test: pair_ofLieGroup_compat
example {G : Type*} [Group G] (Ad : G →* (𝔮 ≃ₗ[ℂ] 𝔮)) (hAd) (incl : K →* G) (kC) (hkC) (k : K) :
    (Pair.ofLieGroup Ad hAd incl kC hkC).Ad k = Ad (incl k) := rfl

variable (V : Type*) [AddCommGroup V] [Module ℂ V] [LieRingModule 𝔮 V] [LieModule ℂ 𝔮 V]

/-- `AF.1a/gk-module`: a `(𝔮, K)`-module structure on a `𝔮`-module `V`: a locally finite
`K`-action compatible with `Ad`. (Continuity of `K` on finite-dimensional stable subspaces and the
derivative condition need the Lie group structure of `K` and are omitted in this prototype.) -/
structure GKModule (P : Pair 𝔮 K) where
  ρ : Representation ℂ K V
  locallyFinite : ∀ v : V, ∃ W : Submodule ℂ V, FiniteDimensional ℂ W ∧ v ∈ W ∧
    ∀ k : K, W.map (ρ k) ≤ W
  equivariant : ∀ (k : K) (x : 𝔮) (v : V), ρ k ⁅x, ρ k⁻¹ v⁆ = ⁅P.Ad k x, v⁆

variable {V}

/-- `RelativeLieCohomology.GKModule.abelian`: subobjects (stable `𝔮`-submodules) inherit the
structure; kernels and cokernels of morphisms are `(𝔮, K)`-modules. -/
theorem GKModule.abelian {P : Pair 𝔮 K} (M : GKModule V P) (W : LieSubmodule ℂ 𝔮 V)
    (hW : ∀ k : K, (W : Submodule ℂ V).map (M.ρ k) ≤ W) : Nonempty (GKModule W P) := sorry

/-- `RelativeLieCohomology.GKModule.tensorFinite`. -/
def GKModule.tensorFinite {P : Pair 𝔮 K} {F : Type*} [AddCommGroup F] [Module ℂ F]
    [LieRingModule 𝔮 F] [LieModule ℂ 𝔮 F] [FiniteDimensional ℂ F] (M : GKModule V P)
    (N : GKModule F P) : GKModule (V ⊗[ℂ] F) P := sorry

/-- `RelativeLieCohomology.GKModule.restrict`: restriction along a morphism of pairs which is the
identity on `𝔮`. -/
def GKModule.restrict {K' : Type*} [Group K'] [TopologicalSpace K'] [IsTopologicalGroup K']
    {P : Pair 𝔮 K} {P' : Pair 𝔮 K'} (φ : K' →* K) (hφ : ∀ k, P'.Ad k = P.Ad (φ k))
    (M : GKModule V P) : GKModule V P' where
  ρ := M.ρ.comp φ
  locallyFinite v := by
    obtain ⟨W, hW, hv, hst⟩ := M.locallyFinite v
    exact ⟨W, hW, hv, fun k => hst (φ k)⟩
  equivariant k x v := by simpa [hφ, map_inv] using M.equivariant (φ k) x v

/-- `RelativeLieCohomology.GKModule.ofContRepresentation`: a finite-dimensional representation of
`K` compatible with `Ad` gives a `(𝔮, K)`-module. -/
def GKModule.ofContRepresentation {P : Pair 𝔮 K} [FiniteDimensional ℂ V]
    (ρ : Representation ℂ K V) (h : ∀ (k : K) (x : 𝔮) (v : V), ρ k ⁅x, ρ k⁻¹ v⁆ = ⁅P.Ad k x, v⁆) :
    GKModule V P :=
  ⟨ρ, fun v => ⟨⊤, inferInstance, Submodule.mem_top, fun _ => le_top⟩, h⟩

/-- `RelativeLieCohomology.GKModule.deriv_eq`: the derivative condition (2) relating `𝔨_ℂ` and `K`
cannot be stated without the Lie algebra of `K`; its consequence on centralisers is stated. -/
theorem GKModule.deriv_eq {P : Pair 𝔮 K} (M : GKModule V P) (x : 𝔮) (k : K)
    (hk : P.Ad k x = x) (v : V) : M.ρ k ⁅x, v⁆ = ⁅x, M.ρ k v⁆ := sorry

-- test: gkModule_trivial
example (P : Pair 𝔮 K) [LieRingModule 𝔮 ℂ] [LieModule ℂ 𝔮 ℂ] (h0 : ∀ (x : 𝔮) (c : ℂ), ⁅x, c⁆ = 0) :
    Nonempty (GKModule ℂ P) := sorry

-- test: gkModule_sl2_weight (weight vectors are permuted compatibly: abstract form)
example (P : Pair 𝔮 K) (M : GKModule V P) (k : K) (x : 𝔮) (v : V) :
    M.ρ k ⁅x, v⁆ = ⁅P.Ad k x, M.ρ k v⁆ := sorry

-- test: gkModule_not_locally_finite
example (P : Pair 𝔮 K) (ρ : Representation ℂ K V)
    (h : ∃ v : V, ∀ W : Submodule ℂ V, FiniteDimensional ℂ W → v ∈ W → ∃ k, ¬ W.map (ρ k) ≤ W) :
    ¬ ∃ M : GKModule V P, M.ρ = ρ := sorry

-- test: gkModule_fd_compat
example (P : Pair 𝔮 K) [FiniteDimensional ℂ V] (ρ : Representation ℂ K V) (h) :
    (GKModule.ofContRepresentation (P := P) ρ h).ρ = ρ := rfl

variable (P : Pair 𝔮 K) (M : GKModule V P)

/-- `AF.1a/relative-lie-cochain-complex`: `C^q(𝔮, K; V)`: alternating `q`-forms on `𝔮` vanishing
when an argument lies in `𝔨_ℂ` and `K`-invariant. -/
def cochains (q : ℕ) : Submodule ℂ (𝔮 [⋀^Fin q]→ₗ[ℂ] V) where
  carrier := {c | (∀ (v : Fin q → 𝔮) (i : Fin q), v i ∈ P.kC → c v = 0) ∧
    ∀ (k : K) (v : Fin q → 𝔮), M.ρ k (c (fun i => P.Ad k⁻¹ (v i))) = c v}
  add_mem' := sorry
  zero_mem' := sorry
  smul_mem' := sorry

/-- The `Hom_K(∧^q(𝔮/𝔨_ℂ), V)` side, as a submodule of alternating forms on `𝔮/𝔨_ℂ`. -/
def homK (q : ℕ) : Submodule ℂ ((𝔮 ⧸ P.kC.toSubmodule) [⋀^Fin q]→ₗ[ℂ] V) where
  carrier := {f | ∀ (k : K) (v : Fin q → 𝔮),
    M.ρ k (f (fun i => Submodule.Quotient.mk (P.Ad k⁻¹ (v i)))) =
      f (fun i => Submodule.Quotient.mk (v i))}
  add_mem' := sorry
  zero_mem' := sorry
  smul_mem' := sorry

/-- `RelativeLieCohomology.cochains_eq_hom`: `C^q ≃ Hom_K(∧^q(𝔮/𝔨_ℂ), V)`. -/
theorem cochains_eq_hom (q : ℕ) : Nonempty (cochains P M q ≃ₗ[ℂ] homK P M q) := sorry

/-- The Chevalley–Eilenberg differential on alternating forms. -/
def d (q : ℕ) : (𝔮 [⋀^Fin q]→ₗ[ℂ] V) →ₗ[ℂ] (𝔮 [⋀^Fin (q + 1)]→ₗ[ℂ] V) := sorry

/-- The differential preserves relative cochains. -/
theorem d_mem {q : ℕ} {c : 𝔮 [⋀^Fin q]→ₗ[ℂ] V} (hc : c ∈ cochains P M q) :
    d (V := V) q c ∈ cochains P M (q + 1) := sorry

theorem d_comp_d (q : ℕ) : (d (𝔮 := 𝔮) (V := V) (q + 1)).comp (d q) = 0 := sorry

/-- Relative cocycles. -/
def cocycles (q : ℕ) : Submodule ℂ (𝔮 [⋀^Fin q]→ₗ[ℂ] V) := cochains P M q ⊓ LinearMap.ker (d q)

/-- Relative coboundaries. -/
def coboundaries : (q : ℕ) → Submodule ℂ (𝔮 [⋀^Fin q]→ₗ[ℂ] V)
  | 0 => ⊥
  | n + 1 => (cochains P M n).map (d n)

/-- `RelativeLieCohomology.cohomology`: `H^q(𝔮, K; V)`. -/
def cohomology (q : ℕ) : Type _ :=
  cocycles P M q ⧸ (coboundaries P M q).comap (cocycles P M q).subtype

instance (q : ℕ) : AddCommGroup (cohomology P M q) := by unfold cohomology; infer_instance
instance (q : ℕ) : Module ℂ (cohomology P M q) := by unfold cohomology; infer_instance

/-- `(𝔮, K)`-invariants. -/
def invariants : Submodule ℂ V where
  carrier := {v | (∀ x : 𝔮, ⁅x, v⁆ = 0) ∧ ∀ k : K, M.ρ k v = v}
  add_mem' := sorry
  zero_mem' := sorry
  smul_mem' := sorry

/-- `RelativeLieCohomology.H0_eq_invariants`. -/
theorem H0_eq_invariants : Nonempty (cohomology P M 0 ≃ₗ[ℂ] invariants P M) := sorry

/-- `RelativeLieCohomology.disconnected`: relative cochains for `K` are the `K`-invariant relative
cochains for `K°`. -/
theorem disconnected (q : ℕ) (c : 𝔮 [⋀^Fin q]→ₗ[ℂ] V) :
    c ∈ cochains P M q ↔
      c ∈ cochains P.identityComponent
          (M.restrict (Subgroup.connectedComponentOfOne K).subtype (fun _ => rfl)) q ∧
        ∀ (k : K) (v : Fin q → 𝔮), M.ρ k (c (fun i => P.Ad k⁻¹ (v i))) = c v := sorry

/-- `RelativeLieCohomology.d_lowDegree_compat`: with `K` trivial and `𝔨_ℂ = 0`, `d` in degree 1
agrees with Mathlib's `LieModule.Cohomology.d₁₂` (stated on the underlying bilinear forms). -/
theorem d_lowDegree_compat (c : 𝔮 [⋀^Fin 1]→ₗ[ℂ] V) (x y : 𝔮) :
    d (V := V) 1 c ![x, y] = ⁅x, c ![y]⁆ - ⁅y, c ![x]⁆ - c ![⁅x, y⁆] := sorry

-- test: relativeCochains_compact
example (h : P.kC = ⊤) (q : ℕ) (hq : 0 < q) : Subsingleton (cohomology P M q) := sorry

-- test: relativeCochains_vector_group (dimension count `binom(n, q)` for abelian `𝔮 = ℂⁿ`,
-- `𝔨_ℂ = 0` and trivial coefficients)
example [FiniteDimensional ℂ 𝔮] (hab : ∀ x y : 𝔮, ⁅x, y⁆ = 0) (hk : P.kC = ⊥)
    (htriv : ∀ (x : 𝔮) (v : V), ⁅x, v⁆ = 0) (hK : ∀ (k : K) (v : V), M.ρ k v = v)
    (hAd : ∀ k, P.Ad k = 1) (hV : Module.finrank ℂ V = 1) (q : ℕ) :
    Module.finrank ℂ (cohomology P M q) = (Module.finrank ℂ 𝔮).choose q := sorry

-- test: relativeCochains_sl2_trivial: `H^1(𝔰𝔩₂(ℂ), SO(2); ℂ) = 0`, `H^0 = H^2 = ℂ` (needs the
-- explicit pair; recorded in the packet and the document).

-- test: relativeCochains_O2_component: the component group acts by `−1` on `∧²(𝔤/𝔨)` for `O(2)`
-- (needs the explicit pair; recorded in the packet and the document).

/-- `AF.1a/relative-cohomology-functoriality`, `RelativeLieCohomology.longExact`: the key step of the
long exact sequence: a `K`-equivariant surjection `V → V₃` induces a surjection on relative cochains
(exactness of `Hom_K(∧^q(𝔮/𝔨_ℂ), −)` on locally finite `K`-modules); the snake lemma then gives the
long exact sequence. -/
theorem longExact {V₃ : Type*} [AddCommGroup V₃] [Module ℂ V₃] [LieRingModule 𝔮 V₃]
    [LieModule ℂ 𝔮 V₃] [CompactSpace K] (M₃ : GKModule V₃ P) (p : V →ₗ⁅ℂ,𝔮⁆ V₃)
    (hp : Function.Surjective p) (hpK : ∀ (k : K) (v : V), p (M.ρ k v) = M₃.ρ k (p v)) (q : ℕ) :
    ∀ c ∈ cochains P M₃ q, ∃ c' ∈ cochains P M q, (p : V →ₗ[ℂ] V₃).compAlternatingMap c' = c :=
  sorry

end RelativeLieCohomology

namespace VanEst

variable {G : Type} [Group G] [TopologicalSpace G] [IsTopologicalGroup G]
  {V : Type} [AddCommGroup V] [Module ℂ V] [TopologicalSpace V] [IsTopologicalAddGroup V]
  [ContinuousSMul ℂ V] (ρ : ContRepresentation ℂ G V)

/-- `VanEst.continuousCochains`: homogeneous continuous cochains `C(G^{q+1}, V)^G`. -/
def continuousCochains (q : ℕ) : Submodule ℂ C(Fin (q + 1) → G, V) where
  carrier := {f | ∀ (g : G) (x : Fin (q + 1) → G), f (fun i => g * x i) = ρ g (f x)}
  add_mem' := sorry
  zero_mem' := sorry
  smul_mem' := sorry

/-- The homogeneous differential on continuous cochains. -/
def dCont (q : ℕ) : continuousCochains ρ q →ₗ[ℂ] continuousCochains ρ (q + 1) := sorry

/-- `VanEst.smoothCochains`: the smooth homogeneous cochains (for the product manifold structure
on `G^{q+1}`; the smoothness predicate is supplied with the Lie group structure). -/
def smoothCochains (IsSmooth : (q : ℕ) → C(Fin (q + 1) → G, V) → Prop) (q : ℕ) :
    Submodule ℂ (continuousCochains ρ q) where
  carrier := {f | IsSmooth q f}
  add_mem' := sorry
  zero_mem' := sorry
  smul_mem' := sorry

/-- `VanEst.continuousCochainsEquivMathlib`: comparison with Mathlib's homogeneous cochains. -/
theorem continuousCochainsEquivMathlib [LocallyCompactSpace G] (q : ℕ) :
    Nonempty (continuousCochains ρ q ≃ₗ[ℂ] (TopRep.homogeneousCochains (TopRep.of ρ)).X q) := sorry

/-- `VanEst.smoothing_quasiIso`: every continuous cocycle is cohomologous to a smooth one (for a
Lie group with its smoothness predicate). -/
theorem smoothing_quasiIso (IsSmooth : (q : ℕ) → C(Fin (q + 1) → G, V) → Prop) (q : ℕ)
    (f : continuousCochains ρ (q + 1)) (hf : dCont ρ (q + 1) f = 0) :
    ∃ s ∈ smoothCochains ρ IsSmooth (q + 1), ∃ h : continuousCochains ρ q, f = s + dCont ρ q h :=
  sorry

/-- `VanEst.cochains_map`: naturality along continuous homomorphisms `φ : G' → G`. -/
def cochains_map {G' : Type} [Group G'] [TopologicalSpace G'] [IsTopologicalGroup G']
    (φ : G' →* G) (hφ : Continuous φ) (q : ℕ) :
    continuousCochains ρ q →ₗ[ℂ]
      continuousCochains (ContRepresentation.ofMonoidHom (ρ.toMonoidHom.comp φ)) q := sorry

-- test: continuousCochains_compact
example [CompactSpace G] (q : ℕ) (hq : 0 < q) :
    Subsingleton (continuousCohomology q (TopRep.of ρ)) := sorry

-- test: continuousCochains_mathlib_compat (degree 0: invariants)
example (f : continuousCochains ρ 0) (g : G) :
    ρ g ((f : C(Fin 1 → G, V)) (fun _ => 1)) = (f : C(Fin 1 → G, V)) (fun _ => g) := by
  simpa using (f.2 g (fun _ => 1)).symm

-- test: continuousCochains_R, continuousCochains_discrete_not: explicit computations for `ℝ` and
-- `ℤ`, recorded in the packet and document.

/-- `AF.1a/van-est-isomorphism`: for `G` with finitely many components, `K` maximal compact and a
`(𝔮, K)`-module structure `M` on `V` obtained by differentiating `ρ` (the derivation is part of the
Lie group structure and is a hypothesis here), `H^q_c(G; V) ≅ H^q(𝔤, K; V)`. -/
theorem vanEstIso {𝔮 : Type*} [LieRing 𝔮] [LieAlgebra ℂ 𝔮] [LieRingModule 𝔮 V] [LieModule ℂ 𝔮 V]
    {K : Type*} [Group K] [TopologicalSpace K] [IsTopologicalGroup K] [CompactSpace K]
    (P : RelativeLieCohomology.Pair 𝔮 K) (M : RelativeLieCohomology.GKModule V P) (incl : K →* G)
    (hM : ∀ k v, M.ρ k v = ρ (incl k) v) (q : ℕ) :
    Nonempty (continuousCohomology q (TopRep.of ρ) ≃ₗ[ℂ] RelativeLieCohomology.cohomology P M q) :=
  sorry

-- Not prototyped (smooth differential forms on manifolds are missing from Mathlib; see the packet
-- gap "Smooth differential forms on manifolds"): `VanEst.invariantForms`,
-- `VanEst.invariantFormsEquivRelative`, `VanEst.invariantForms_d`,
-- `VanEst.invariantForms_componentAction`, `VanEst.quotient_maximalCompact_euclidean`,
-- `VanEst.acceptance`.

end VanEst

/-! ## AF.1 Real reductive representation foundations -/

namespace RealReductive

/-- `AF.1/real-points-lie-group`, `RealReductive.realPoints`: a closed subgroup of `GL_n(ℝ)` (the
real points of a linear algebraic group in a faithful representation) is a Lie group
(closed-subgroup theorem, Tau Ceti LieGroups Layer 2). -/
theorem realPoints (n : ℕ) (H : Subgroup (GL (Fin n) ℝ)) (hH : IsClosed (H : Set (GL (Fin n) ℝ))) :
    ∃ (d : ℕ) (cs : ChartedSpace (EuclideanSpace ℝ (Fin d)) H),
      letI := cs; LieGroup 𝓘(ℝ, EuclideanSpace ℝ (Fin d)) ∞ H := sorry

/-- The Lie algebra `{X : exp(tX) ∈ H ∀ t}` of a closed subgroup of `GL_n(ℝ)`. -/
def lieAlgebraOf (n : ℕ) (H : Subgroup (GL (Fin n) ℝ)) : Set (Matrix (Fin n) (Fin n) ℝ) :=
  {X | ∀ t : ℝ, ∃ h ∈ H, (h : Matrix (Fin n) (Fin n) ℝ) = NormedSpace.exp (t • X)}

/-- `RealReductive.realPoints_lieAlgebra`: for `H = G(ℝ)`, `lieAlgebraOf H = Lie(G)(ℝ)`; stated
with the algebraic Lie algebra given as the tangent space `𝔤` of the defining ideal. -/
theorem realPoints_lieAlgebra (n : ℕ) (H : Subgroup (GL (Fin n) ℝ))
    (𝔤 : Submodule ℝ (Matrix (Fin n) (Fin n) ℝ))
    (h𝔤 : ∀ X ∈ 𝔤, ∀ t : ℝ, ∃ h ∈ H, (h : Matrix (Fin n) (Fin n) ℝ) = NormedSpace.exp (t • X))
    (hdim : ∀ X, (∀ t : ℝ, ∃ h ∈ H, (h : Matrix (Fin n) (Fin n) ℝ) = NormedSpace.exp (t • X)) →
      X ∈ 𝔤) : lieAlgebraOf n H = 𝔤 := sorry

/-- `RealReductive.realPoints_map`: algebraic homomorphisms give continuous (smooth) homomorphisms. -/
theorem realPoints_map (n m : ℕ) (H : Subgroup (GL (Fin n) ℝ)) (H' : Subgroup (GL (Fin m) ℝ))
    (f : H →* H') (hf : ∃ F : Matrix (Fin n) (Fin n) ℝ → Matrix (Fin m) (Fin m) ℝ,
      Continuous F ∧ ∀ h : H, ((f h : GL (Fin m) ℝ) : Matrix (Fin m) (Fin m) ℝ) =
        F ((h : GL (Fin n) ℝ) : Matrix (Fin n) (Fin n) ℝ)) :
    Continuous f := sorry

/-- `RealReductive.realPoints_Ad`: conjugation preserves the Lie algebra. -/
theorem realPoints_Ad (n : ℕ) (H : Subgroup (GL (Fin n) ℝ)) (h : H) (X : Matrix (Fin n) (Fin n) ℝ)
    (hX : X ∈ lieAlgebraOf n H) :
    ((h : GL (Fin n) ℝ) : Matrix (Fin n) (Fin n) ℝ) * X * ((h⁻¹ : GL (Fin n) ℝ) : Matrix _ _ ℝ) ∈
      lieAlgebraOf n H := sorry

/-- `RealReductive.realPoints_orbitMap`: orbit maps of continuous actions are continuous. -/
theorem realPoints_orbitMap (n : ℕ) (H : Subgroup (GL (Fin n) ℝ)) {X : Type*} [TopologicalSpace X]
    [MulAction H X] [ContinuousSMul H X] (x : X) : Continuous fun h : H => h • x :=
  continuous_id.smul continuous_const

/-- `RealReductive.realPoints_finite_components`. -/
theorem realPoints_finite_components (n : ℕ) (H : Subgroup (GL (Fin n) ℝ))
    (halg : ∃ S : Set (MvPolynomial (Fin n × Fin n) ℝ),
      (H : Set (GL (Fin n) ℝ)) = {g : GL (Fin n) ℝ | ∀ p ∈ S,
        MvPolynomial.eval (fun ij => (g : Matrix (Fin n) (Fin n) ℝ) ij.1 ij.2) p = 0}) :
    Finite (ConnectedComponents H) := sorry

/-- `RealReductive.realPoints_GL_compat`: for `H = GL_n(ℝ)` the Lie algebra is all matrices. -/
theorem realPoints_GL_compat (n : ℕ) : lieAlgebraOf n ⊤ = Set.univ := sorry

-- test: realPoints_gl1
example : lieAlgebraOf 1 ⊤ = Set.univ := realPoints_GL_compat 1

-- test: realPoints_trivial
example : lieAlgebraOf 1 ⊥ = {0} := sorry

-- test: realPoints_SO2_not_dense: a subgroup that is not closed is excluded by the hypothesis.
example (n : ℕ) (H : Subgroup (GL (Fin n) ℝ)) (hH : ¬ IsClosed (H : Set (GL (Fin n) ℝ))) :
    ¬ ∃ S : Set (MvPolynomial (Fin n × Fin n) ℝ),
      (H : Set (GL (Fin n) ℝ)) = {g : GL (Fin n) ℝ | ∀ p ∈ S,
        MvPolynomial.eval (fun ij => (g : Matrix (Fin n) (Fin n) ℝ) ij.1 ij.2) p = 0} :=
  sorry

-- test: realPoints_deligne_torus: `S(ℝ) = ℂ^×` with Lie algebra `ℂ` (recorded in the packet).

/-- `AF.1/real-reductive-group`, `RealReductive.Datum`: `(G, K, θ)` with `θ` an involutive
automorphism and `K` its fixed points, compact. -/
structure Datum (G : Type*) [Group G] [TopologicalSpace G] where
  θ : G ≃* G
  θ_involutive : ∀ g, θ (θ g) = g
  K : Subgroup G
  K_eq : (K : Set G) = {g | θ g = g}
  K_compact : IsCompact (K : Set G)

variable {G : Type*} [Group G] [TopologicalSpace G] [IsTopologicalGroup G]

/-- `RealReductive.Datum.cartanDecomp`: every `g` is `k · p` with `θ(p) = p⁻¹` (`p ∈ exp 𝔭`). -/
theorem Datum.cartanDecomp (D : Datum G) (g : G) : ∃ k ∈ D.K, ∃ p : G, D.θ p = p⁻¹ ∧ g = k * p :=
  sorry

/-- `RealReductive.Datum.componentGroup`: `K` meets every connected component of `G`. -/
theorem Datum.componentGroup (D : Datum G) (g : G) :
    ∃ k ∈ D.K, connectedComponent g = connectedComponent k := sorry

/-- `RealReductive.Datum.ofAlgebraic`: the datum of `GL_n(ℝ)`, `θ(g) = (gᵀ)⁻¹`, `K = O(n)`. -/
def Datum.ofAlgebraic (n : ℕ) : Datum (GL (Fin n) ℝ) := sorry

/-- `RealReductive.Datum.conj`: two data on the same group have conjugate `K`. -/
theorem Datum.conj [ConnectedSpace G] (D D' : Datum G) :
    ∃ g : G, D'.K = D.K.map (MulAut.conj g).toMonoidHom := sorry

-- test: datum_GLn, datum_lie_compat (the polar decomposition of GL_n): see `Datum.ofAlgebraic`.
example (n : ℕ) (g : GL (Fin n) ℝ) :
    ∃ k ∈ (Datum.ofAlgebraic n).K, ∃ p, (Datum.ofAlgebraic n).θ p = p⁻¹ ∧ g = k * p :=
  Datum.cartanDecomp _ g

-- test: datum_compact
example [CompactSpace G] (D : Datum G) (hθ : ∀ g, D.θ g = g) : D.K = ⊤ := by
  ext g; simp [← SetLike.mem_coe, D.K_eq, hθ]

-- test: datum_not_any_compact: a compact subgroup missing a component is not the `K` of a datum.
example (D : Datum G) (K' : Subgroup G) (g : G)
    (hmiss : ∀ k ∈ K', connectedComponent g ≠ connectedComponent k) : D.K ≠ K' := by
  rintro rfl
  obtain ⟨k, hk, h⟩ := D.componentGroup g
  exact hmiss k hk h

variable {K : Type*} [Group K] [TopologicalSpace K] [IsTopologicalGroup K]
  {V : Type*} [AddCommGroup V] [Module ℂ V]

/-- `RealReductive.kFinite`: `K`-finite vectors: those whose `K`-orbit spans a finite-dimensional
space. -/
def kFinite (ρ : Representation ℂ K V) : Submodule ℂ V where
  carrier := {v | FiniteDimensional ℂ (Submodule.span ℂ (Set.range fun k : K => ρ k v))}
  add_mem' := sorry
  zero_mem' := sorry
  smul_mem' := sorry

/-- `RealReductive.isotypic`: the `σ`-isotypic part: the sum of images of `K`-maps from `σ`. -/
def isotypic (ρ : Representation ℂ K V) {W : Type*} [AddCommGroup W] [Module ℂ W]
    (σ : Representation ℂ K W) : Submodule ℂ V :=
  ⨆ (f : W →ₗ[ℂ] V) (_ : ∀ k, f ∘ₗ σ k = ρ k ∘ₗ f), LinearMap.range f

/-- `RealReductive.kFinite_eq_iSup_isotypic`. -/
theorem kFinite_eq_iSup_isotypic [CompactSpace K] (ρ : Representation ℂ K V) :
    kFinite ρ = ⨆ (W : FDRep ℂ K) (_ : Nonempty W), isotypic ρ W.ρ := sorry

/-- `RealReductive.kFinite_dense`: `K`-finite vectors are dense in a continuous Banach
representation of a compact group. -/
theorem kFinite_dense [CompactSpace K] {E : Type*} [NormedAddCommGroup E] [NormedSpace ℂ E]
    [CompleteSpace E] (ρ : Representation ℂ K E) (hρ : ∀ v, Continuous fun k => ρ k v)
    (hρc : ∀ k, Continuous (ρ k)) : Dense ((kFinite ρ : Submodule ℂ E) : Set E) := sorry

/-- `RealReductive.kFinite_iff_lie`: for smooth vectors `K`-finiteness can be tested with `U(𝔨)`
(stand-in: the `U(𝔨)`-action is given). -/
theorem kFinite_iff_lie [ConnectedSpace K] (ρ : Representation ℂ K V) {𝔨 : Type*} [LieRing 𝔨]
    [LieAlgebra ℂ 𝔨] [LieRingModule 𝔨 V] [LieModule ℂ 𝔨 V]
    (hstable : ∀ W : Submodule ℂ V, FiniteDimensional ℂ W →
      ((∀ k, W.map (ρ k) ≤ W) ↔ ∀ x : 𝔨, ∀ w ∈ W, ⁅x, w⁆ ∈ W)) (v : V) :
    v ∈ kFinite ρ ↔
      FiniteDimensional ℂ (LieSubmodule.lieSpan ℂ 𝔨 ({v} : Set V) : Submodule ℂ V) := sorry

/-- `RealReductive.isotypic_map`. -/
theorem isotypic_map {V' : Type*} [AddCommGroup V'] [Module ℂ V'] (ρ : Representation ℂ K V)
    (ρ' : Representation ℂ K V') (f : V →ₗ[ℂ] V') (hf : ∀ k, f ∘ₗ ρ k = ρ' k ∘ₗ f)
    {W : Type*} [AddCommGroup W] [Module ℂ W] (σ : Representation ℂ K W) :
    (isotypic ρ σ).map f ≤ isotypic ρ' σ := sorry

-- test: kFinite_trivial
example (ρ : Representation ℂ K V) [Subsingleton K] : kFinite ρ = ⊤ := sorry

-- test: kFinite_SO2_L2, kFinite_not_all, kFinite_peterWeyl_compat: need `L²(SO(2))` and the Tau Ceti
-- Peter–Weyl basis; recorded in the packet.

end RealReductive

namespace RealReductive

open RelativeLieCohomology

variable {𝔮 : Type*} [LieRing 𝔮] [LieAlgebra ℂ 𝔮] {K : Type*} [Group K] [TopologicalSpace K]
  [IsTopologicalGroup K] {V : Type*} [AddCommGroup V] [Module ℂ V] [LieRingModule 𝔮 V]
  [LieModule ℂ 𝔮 V]

variable (𝔮 V) in
/-- The action of `U(𝔤_ℂ)` on a `𝔤_ℂ`-module. -/
def uAction : UniversalEnvelopingAlgebra ℂ 𝔮 →ₐ[ℂ] Module.End ℂ V :=
  UniversalEnvelopingAlgebra.lift ℂ (LieModule.toEnd ℂ 𝔮 V)

variable (𝔮) in
/-- `Z(𝔤)`, the centre of `U(𝔤_ℂ)`. -/
abbrev Z := Subalgebra.center ℂ (UniversalEnvelopingAlgebra ℂ 𝔮)

/-- `K`-equivariant maps from a finite-dimensional `K`-representation. -/
def homK {P : Pair 𝔮 K} (M : GKModule V P) (W : FDRep ℂ K) : Submodule ℂ (W →ₗ[ℂ] V) where
  carrier := {f | ∀ k : K, f ∘ₗ W.ρ k = M.ρ k ∘ₗ f}
  add_mem' := sorry
  zero_mem' := sorry
  smul_mem' := sorry

/-- `RealReductive.IsAdmissible`: finite `K`-multiplicities. -/
def IsAdmissible {P : Pair 𝔮 K} (M : GKModule V P) : Prop :=
  ∀ W : FDRep ℂ K, FiniteDimensional ℂ (homK M W)

/-- `RealReductive.IsZFinite`: annihilated by an ideal of finite codimension of `Z(𝔤)`. -/
def IsZFinite : Prop :=
  ∃ I : Ideal (Z 𝔮), Module.Finite ℂ (Z 𝔮 ⧸ I) ∧ ∀ z ∈ I, ∀ v : V, uAction 𝔮 V z v = 0

/-- `RealReductive.HCModule`: Harish-Chandra modules (admissible and `Z(𝔤)`-finite). -/
structure HCModule (P : Pair 𝔮 K) (V : Type*) [AddCommGroup V] [Module ℂ V] [LieRingModule 𝔮 V]
    [LieModule ℂ 𝔮 V] where
  toGKModule : GKModule V P
  admissible : IsAdmissible toGKModule
  zFinite : IsZFinite (𝔮 := 𝔮) (V := V)

variable {P : Pair 𝔮 K}

/-- `RealReductive.HCModule.abelian`: stable submodules of Harish-Chandra modules are
Harish-Chandra (closure under subobjects). -/
theorem HCModule.abelian (M : HCModule P V) (W : LieSubmodule ℂ 𝔮 V)
    (hW : ∀ k : K, (W : Submodule ℂ V).map (M.toGKModule.ρ k) ≤ W) : Nonempty (HCModule P W) :=
  sorry

/-- `RealReductive.HCModule.dual`: the `K`-finite dual `Ṽ` separates points of an admissible `V`
(so that `Ṽ̃ = V`). -/
theorem HCModule.dual (M : HCModule P V) (v : V) (hv : v ≠ 0) :
    ∃ f ∈ kFinite (Representation.dual M.toGKModule.ρ), f v ≠ 0 := sorry

/-- `RealReductive.HCModule.tensorFinite`. -/
def HCModule.tensorFinite {F : Type*} [AddCommGroup F] [Module ℂ F] [LieRingModule 𝔮 F]
    [LieModule ℂ 𝔮 F] [FiniteDimensional ℂ F] (M : HCModule P V) (N : GKModule F P) :
    HCModule P (V ⊗[ℂ] F) := sorry

/-- `RealReductive.HCModule.iff_zFinite`: an admissible `(𝔤, K)`-module is finitely generated over
`U(𝔤)` iff it is `Z(𝔤)`-finite (Bernstein–Krötz Theorem 4.3). -/
theorem HCModule.iff_zFinite (M : GKModule V P) (hM : IsAdmissible M) :
    (∃ S : Finset V,
      Submodule.span ℂ (⋃ s ∈ (S : Set V), Set.range fun u => uAction 𝔮 V u s) = ⊤) ↔
      IsZFinite (𝔮 := 𝔮) (V := V) := sorry

-- test: hcModule_trivial
example (M : GKModule V P) [FiniteDimensional ℂ V] : IsAdmissible M := sorry

-- test: hcModule_tensor_not_fg (Bernstein–Krötz Remark 4.1(b)): admissibility does not imply
-- `Z(𝔤)`-finiteness.
example : ¬ ∀ (V : Type) [AddCommGroup V] [Module ℂ V] [LieRingModule 𝔮 V] [LieModule ℂ 𝔮 V]
    (M : GKModule V P), IsAdmissible M → IsZFinite (𝔮 := 𝔮) (V := V) := sorry

-- test: hcModule_discrete_series_SL2, hcModule_finiteDim_compat: recorded in the packet.

/-- `RealReductive.InfChar`: infinitesimal characters. -/
abbrev InfChar := Z 𝔮 →ₐ[ℂ] ℂ

/-- `RealReductive.HasInfChar`. -/
def HasInfChar (χ : InfChar (𝔮 := 𝔮)) : Prop :=
  ∀ (z : Z 𝔮) (v : V), uAction 𝔮 V z v = χ z • v

/-- `RealReductive.genEigenspace`: the generalized `χ`-eigenspace. -/
def genEigenspace (χ : InfChar (𝔮 := 𝔮)) : Submodule ℂ V where
  carrier := {v | ∀ z : Z 𝔮, ∃ n : ℕ, ((uAction 𝔮 V z - χ z • 1) ^ n) v = 0}
  add_mem' := sorry
  zero_mem' := sorry
  smul_mem' := sorry

/-- `RealReductive.infCharOf`: `χ_λ` for `λ` on a Cartan subalgebra, through the Harish-Chandra
isomorphism (Tau Ceti LieHighestWeight Layer 7; normalised so that the module of highest weight `μ`
has `χ_{μ+ρ}`). -/
def infCharOf (𝔥 : LieSubalgebra ℂ 𝔮) (lam : Module.Dual ℂ 𝔥) : InfChar (𝔮 := 𝔮) := sorry

/-- `RealReductive.infCharOf_eq_iff`: `χ_λ = χ_μ` iff `μ ∈ Wλ`, for the Weyl group `W` of
`(𝔮, 𝔥)` (given here as a group of linear automorphisms of `𝔥^*`). -/
theorem infCharOf_eq_iff (𝔥 : LieSubalgebra ℂ 𝔮) (W : Subgroup (Module.Dual ℂ 𝔥 ≃ₗ[ℂ] Module.Dual ℂ 𝔥))
    (lam μ : Module.Dual ℂ 𝔥) : infCharOf 𝔥 lam = infCharOf 𝔥 μ ↔ ∃ w ∈ W, μ = w lam := sorry

/-- `RealReductive.infChar_highestWeight`: a highest weight vector of weight `μ` for a Borel
`𝔟 ⊇ 𝔥` generates a module with infinitesimal character `χ_{μ+ρ}`. -/
theorem infChar_highestWeight (𝔥 : LieSubalgebra ℂ 𝔮) (ρ μ : Module.Dual ℂ 𝔥) (v : V)
    (hv : v ≠ 0) (hgen : LieSubmodule.lieSpan ℂ 𝔮 ({v} : Set V) = ⊤)
    (hwt : ∀ h : 𝔥, ⁅(h : 𝔮), v⁆ = μ h • v) (𝔫 : LieSubalgebra ℂ 𝔮)
    (hn : ∀ x ∈ 𝔫, ⁅x, v⁆ = 0) :
    HasInfChar (V := V) (infCharOf 𝔥 (μ + ρ)) := sorry

/-- `RealReductive.infChar_casimir`: `χ_λ(Ω) = ⟨lam, lam⟩ − ⟨ρ, ρ⟩` for the Casimir of a nondegenerate
invariant form (with the induced form on `𝔥^*`). -/
theorem infChar_casimir (𝔥 : LieSubalgebra ℂ 𝔮) (Ω : Z 𝔮) (B : LinearMap.BilinForm ℂ (Module.Dual ℂ 𝔥))
    (ρ lam : Module.Dual ℂ 𝔥) : infCharOf 𝔥 lam Ω = B lam lam - B ρ ρ := sorry

-- test: infChar_weyl_invariant
example (𝔥 : LieSubalgebra ℂ 𝔮) (W : Subgroup (Module.Dual ℂ 𝔥 ≃ₗ[ℂ] Module.Dual ℂ 𝔥))
    (w : Module.Dual ℂ 𝔥 ≃ₗ[ℂ] Module.Dual ℂ 𝔥) (hw : w ∈ W) (lam : Module.Dual ℂ 𝔥) :
    infCharOf 𝔥 (w lam) = infCharOf 𝔥 lam := sorry

-- test: infChar_trivial_gl2, infChar_k_weight, infChar_not_linear_action: explicit 𝔤𝔩₂
-- computations recorded in the packet and document.

/-- `AF.1/harish-chandra-admissibility`: irreducible `(𝔤, K)`-modules are admissible. -/
theorem admissible_of_irreducible [CompactSpace K] (M : GKModule V P)
    (hirr : ∀ W : LieSubmodule ℂ 𝔮 V, (∀ k : K, (W : Submodule ℂ V).map (M.ρ k) ≤ W) → W = ⊥ ∨ W = ⊤)
    [Nontrivial V] : IsAdmissible M ∧ ∃ χ : InfChar (𝔮 := 𝔮), HasInfChar (V := V) χ := sorry

/-- `RealReductive.principalSeries`: the smooth induced representation `I^∞(W)` from a minimal
parabolic `P_min` (functions `f(pg) = p·f(g)`), as functions on `G`. -/
def principalSeries {G : Type*} [Group G] [TopologicalSpace G] (Pmin : Subgroup G)
    {W : Type*} [AddCommGroup W] [Module ℂ W] [TopologicalSpace W] (σ : Representation ℂ Pmin W) :
    Submodule ℂ (G → W) where
  carrier := {f | Continuous f ∧ ∀ (p : Pmin) (g : G), f (p * g) = σ p (f g)}
  add_mem' := sorry
  zero_mem' := sorry
  smul_mem' := sorry

end RealReductive

namespace RealReductive

open RelativeLieCohomology

section PrincipalSeries

variable {G : Type*} [Group G] [TopologicalSpace G] (Pmin : Subgroup G)
  {W : Type*} [AddCommGroup W] [Module ℂ W] [TopologicalSpace W] (σ : Representation ℂ Pmin W)

/-- Right translation on `I^∞(W)`. -/
def principalSeriesAction (g : G) (f : G → W) : G → W := fun x => f (x * g)

/-- `RealReductive.principalSeries_kFinite`: `I(W)`, the `K`-finite vectors, for `K ≤ G`. -/
def principalSeries_kFinite (K : Subgroup G) : Submodule ℂ (principalSeries Pmin σ) := sorry

/-- `RealReductive.principalSeries_restrictK`: restriction to `K` is injective on `I^∞(W)` when
`G = Pmin · K` (Iwasawa decomposition), identifying `I(W)` with an induced representation of `K`. -/
theorem principalSeries_restrictK (K : Subgroup G) (hIw : ∀ g : G, ∃ p ∈ Pmin, ∃ k ∈ K, g = p * k)
    (f₁ f₂ : principalSeries Pmin σ) (h : ∀ k ∈ K, (f₁ : G → W) k = (f₂ : G → W) k) : f₁ = f₂ :=
  sorry

/-- `RealReductive.principalSeries_map`: a `Pmin`-map `W → W'` induces a `G`-map. -/
def principalSeries_map {W' : Type*} [AddCommGroup W'] [Module ℂ W'] [TopologicalSpace W']
    (σ' : Representation ℂ Pmin W') (φ : W →L[ℂ] W') (hφ : ∀ p, φ ∘ₗ σ p = σ' p ∘ₗ φ) :
    principalSeries Pmin σ →ₗ[ℂ] principalSeries Pmin σ' := sorry

/-- `RealReductive.principalSeries_dual`: the invariant pairing `∫_K ⟨f, f'⟩` between `I(σ ⊗ e^{ν+ρ})`
and `I(σ^∨ ⊗ e^{−ν+ρ})`; stated as the existence of a nondegenerate `G`-invariant pairing. -/
theorem principalSeries_dual {W' : Type*} [AddCommGroup W'] [Module ℂ W'] [TopologicalSpace W']
    (σ' : Representation ℂ Pmin W') :
    ∃ B : principalSeries Pmin σ →ₗ[ℂ] principalSeries Pmin σ' →ₗ[ℂ] ℂ,
      ∀ f, (∀ f', B f f' = 0) → f = 0 := sorry

-- test: principalSeries_GL1: for `Pmin = ⊤` the induced space is one-dimensional-type: functions
-- determined by their value at `1`.
example (f : principalSeries (⊤ : Subgroup G) (Representation.trivial ℂ (⊤ : Subgroup G) ℂ)) :
    ∀ g : G, (f : G → ℂ) g = (f : G → ℂ) 1 := by
  intro g
  have h := f.2.2 ⟨g, Subgroup.mem_top g⟩ 1
  simpa using h

-- test: principalSeries_SL2_ktypes, principalSeries_not_irreducible, principalSeries_hc_compat:
-- explicit SL₂(ℝ) computations, recorded in the packet.

end PrincipalSeries

/-- `AF.1/casselman-embedding`: every Harish-Chandra module of `(G, K)` embeds `K`-equivariantly
into a principal series `I(W)` for a finite-dimensional representation `W` of `Pmin`. -/
theorem casselman_embedding {G : Type*} [Group G] [TopologicalSpace G] [IsTopologicalGroup G]
    (Pmin K : Subgroup G) {𝔮 : Type*} [LieRing 𝔮] [LieAlgebra ℂ 𝔮] {P : Pair 𝔮 K}
    {V : Type*} [AddCommGroup V] [Module ℂ V] [LieRingModule 𝔮 V] [LieModule ℂ 𝔮 V]
    [Nontrivial V] (M : HCModule P V) :
    ∃ (W : Type) (_ : AddCommGroup W) (_ : Module ℂ W) (_ : TopologicalSpace W)
      (_ : FiniteDimensional ℂ W) (σ : Representation ℂ Pmin W)
      (ι : V →ₗ[ℂ] principalSeries Pmin σ), Function.Injective ι ∧
        ∀ (k : K) (v : V), ((ι (M.toGKModule.ρ k v) : principalSeries Pmin σ) : G → W) =
          principalSeriesAction (k : G) ((ι v : principalSeries Pmin σ) : G → W) := sorry

section Globalization

variable {G : Type*} [Group G] [TopologicalSpace G] [IsTopologicalGroup G]
  {E : Type*} [AddCommGroup E] [Module ℂ E] [TopologicalSpace E] [IsTopologicalAddGroup E]
  [ContinuousSMul ℂ E]

/-- `AF.1/sf-representation`, `RealReductive.SFRep`: a Fréchet representation of moderate growth
for a norm `‖·‖ : G → ℝ`, all of whose vectors are differentiable along one-parameter subgroups
(higher smoothness needs the Lie structure of `G` and is part of the implementation). -/
structure SFRep (normG : G → ℝ) {ι : Type*} (p : SeminormFamily ℂ E ι) where
  π : ContRepresentation ℂ G E
  withSeminorms : WithSeminorms p
  moderate : ∀ i, ∃ (s : Finset ι) (C N : ℝ), ∀ (g : G) (v : E),
    p i (π g v) ≤ C * normG g ^ N * (s.sup p) v
  differentiable : ∀ (γ : Multiplicative ℝ →* G) (v : E), ∃ w : E,
    Tendsto (fun t : ℝ => ((t⁻¹ : ℝ) : ℂ) • (π (γ (Multiplicative.ofAdd t)) v - v)) (𝓝[≠] 0) (𝓝 w)

variable {normG : G → ℝ} {ι : Type*} {p : SeminormFamily ℂ E ι}

/-- Restriction of an SF-representation to a subgroup, as a linear representation. -/
def SFRep.restrict (R : SFRep normG p) (K : Subgroup G) : Representation ℂ K E :=
  (ContinuousLinearMap.toLinearMapRingHom : (E →L[ℂ] E) →+* (E →ₗ[ℂ] E)).toMonoidHom.comp
    (R.π.toMonoidHom.comp K.subtype)

/-- `RealReductive.SFRep.kFinite`: the `K`-finite vectors. -/
def SFRep.kFinite (R : SFRep normG p) (K : Subgroup G) : Submodule ℂ E :=
  RealReductive.kFinite (R.restrict K)

/-- `RealReductive.SFRep.smoothVectors`: the vectors of a continuous representation differentiable
along every one-parameter subgroup (first step of the smooth-vector construction). -/
def SFRep.smoothVectors (π : ContRepresentation ℂ G E) : Set E :=
  {v | ∀ γ : Multiplicative ℝ →* G, ∃ w : E,
    Tendsto (fun t : ℝ => ((t⁻¹ : ℝ) : ℂ) • (π (γ (Multiplicative.ofAdd t)) v - v)) (𝓝[≠] 0) (𝓝 w)}

/-- `RealReductive.SFRep.derivAction`: the derivative along a one-parameter subgroup. -/
def SFRep.derivAction (R : SFRep normG p) (γ : Multiplicative ℝ →* G) (v : E) : E :=
  Classical.choose (R.differentiable γ v)

theorem SFRep.continuous_derivAction [T2Space E] (R : SFRep normG p) (γ : Multiplicative ℝ →* G) :
    Continuous (R.derivAction γ) := sorry

/-- `RealReductive.SFRep.SAF`: admissible SF-representations. -/
def SFRep.SAF (R : SFRep normG p) (K : Subgroup G) : Prop :=
  ∀ W : FDRep ℂ K, FiniteDimensional ℂ (RealReductive.isotypic (R.restrict K) W.ρ)

-- test: sfRep_trivial (abstract form: a finite-dimensional SF-representation is admissible)
example [FiniteDimensional ℂ E] (R : SFRep normG p) (K : Subgroup G) : R.SAF K := sorry

-- test: sfRep_kFinite_compat
example (R : SFRep normG p) (K : Subgroup G) : R.kFinite K = RealReductive.kFinite (R.restrict K) :=
  rfl

-- test: sfRep_principalSeries, sfRep_L2_not_smooth: recorded in the packet.

end Globalization

end RealReductive

namespace RealReductive

open RelativeLieCohomology MeasureTheory

variable {𝔮 : Type*} [LieRing 𝔮] [LieAlgebra ℂ 𝔮] {K : Type*} [Group K] [TopologicalSpace K]
  [IsTopologicalGroup K] {P : Pair 𝔮 K} {V : Type*} [AddCommGroup V] [Module ℂ V]
  [LieRingModule 𝔮 V] [LieModule ℂ 𝔮 V]

/-- `AF.1/g-continuous-norms`, `RealReductive.GContinuousNorm`: a norm on `V` obtained from a
continuous Banach representation `π` of `G ⊇ K` and a `K`-equivariant injection `V → E` with dense
image consisting of the `K`-finite vectors. -/
structure GContinuousNorm (G : Type*) [Group G] [TopologicalSpace G] (incl : K →* G)
    (M : GKModule V P) where
  E : Type
  [instE : NormedAddCommGroup E]
  [instS : NormedSpace ℂ E]
  [instC : CompleteSpace E]
  π : ContRepresentation ℂ G E
  ι : V →ₗ[ℂ] E
  injective : Function.Injective ι
  dense : Dense (Set.range ι)
  equivariant : ∀ (k : K) (v : V), ι (M.ρ k v) = π (incl k) (ι v)

attribute [instance] GContinuousNorm.instE GContinuousNorm.instS GContinuousNorm.instC

/-- The norm on `V` pulled back from `E`. -/
def GContinuousNorm.norm {G : Type*} [Group G] [TopologicalSpace G] {incl : K →* G}
    {M : GKModule V P} (N : GContinuousNorm G incl M) (v : V) : ℝ := ‖N.ι v‖

/-- `RealReductive.sobolevNorm`: `p_k(v) = Σ_{j ≤ k} Σ_{|α| = j} p(X^α v)` for a basis `b` of `𝔮`. -/
def sobolevNorm {ι : Type*} [Fintype ι] (b : Module.Basis ι ℂ 𝔮) (p : V → ℝ) (k : ℕ) (v : V) : ℝ :=
  ∑ j ∈ Finset.range (k + 1), ∑ f : Fin j → ι,
    p (uAction 𝔮 V (List.ofFn fun i => UniversalEnvelopingAlgebra.ι ℂ (b (f i))).prod v)

/-- `RealReductive.SobolevLE`: the Sobolev order `p ≺ q`. -/
def SobolevLE {ι : Type*} [Fintype ι] (b : Module.Basis ι ℂ 𝔮) (p q : V → ℝ) : Prop :=
  ∃ (C : ℝ) (k : ℕ), ∀ v, p v ≤ C * sobolevNorm b q k v

/-- `RealReductive.exists_gContinuousNorm`: every Harish-Chandra module has a `G`-continuous norm
(via the Casselman embedding into a principal series). -/
theorem exists_gContinuousNorm (G : Type*) [Group G] [TopologicalSpace G] (incl : K →* G)
    (M : HCModule P V) : Nonempty (GContinuousNorm G incl M.toGKModule) := sorry

-- `RealReductive.smoothCompletion_nuclear`: not prototyped (nuclear Fréchet spaces are not in
-- Mathlib).

-- test: gContinuous_finiteDim
example [FiniteDimensional ℂ V] {ι : Type*} [Fintype ι] (b : Module.Basis ι ℂ 𝔮)
    (p q : V → ℝ) (hp : ∃ C, ∀ v, p v ≤ C * q v) : SobolevLE b p q := sorry

-- test: gContinuous_principalSeries, gContinuous_not_arbitrary: recorded in the packet.

/-- `AF.1/casselman-wallach-globalization`: any two `G`-continuous norms on a Harish-Chandra module
are Sobolev-equivalent (Bernstein–Krötz Theorem 1.1). -/
theorem casselmanWallach (G : Type*) [Group G] [TopologicalSpace G] (incl : K →* G)
    (M : HCModule P V) {ι : Type*} [Fintype ι] (b : Module.Basis ι ℂ 𝔮)
    (N N' : GContinuousNorm G incl M.toGKModule) :
    SobolevLE b N.norm N'.norm ∧ SobolevLE b N'.norm N.norm := sorry

/-- `AF.1/dixmier-malliavin`: every vector of a Banach space smooth for `π` is a finite sum of
`π(f) w = ∫ f(g) π(g) w dg` with `f` smooth and compactly supported (stated for a Lie group `G` with
model `I` and Haar measure `μ`; `IsSmoothVector` is the smooth-vector predicate). -/
theorem dixmierMalliavin {G : Type*} [Group G] [TopologicalSpace G] [IsTopologicalGroup G]
    [MeasurableSpace G] (μ : Measure G) {Em : Type*} [NormedAddCommGroup Em] [NormedSpace ℝ Em]
    {H : Type*} [TopologicalSpace H] (I : ModelWithCorners ℝ Em H) [ChartedSpace H G]
    {E : Type*} [NormedAddCommGroup E] [NormedSpace ℂ E] [CompleteSpace E]
    (π : ContRepresentation ℂ G E) (IsSmoothVector : E → Prop) (v : E) (hv : IsSmoothVector v) :
    ∃ (n : ℕ) (f : Fin n → G → ℂ) (w : Fin n → E),
      (∀ i, ContMDiff I 𝓘(ℝ, ℂ) ∞ (f i) ∧ HasCompactSupport (f i)) ∧
        v = ∑ i, ∫ g, f i g • π g (w i) ∂μ := sorry

/-! ### AF.1b (proposed sub-layer): classification -/

/-- Irreducibility of a `(𝔮, K)`-module. -/
def IsIrreducible (M : GKModule V P) : Prop :=
  Nontrivial V ∧ ∀ W : LieSubmodule ℂ 𝔮 V, (∀ k : K, (W : Submodule ℂ V).map (M.ρ k) ≤ W) →
    W = ⊥ ∨ W = ⊤

/-- `RealReductive.IrrAdmissible`: irreducible admissible `(𝔤, K)`-modules on a given carrier. -/
def IrrAdmissible (V : Type*) [AddCommGroup V] [Module ℂ V] [LieRingModule 𝔮 V]
    [LieModule ℂ 𝔮 V] (P : Pair 𝔮 K) : Set (GKModule V P) :=
  {M | IsIrreducible M ∧ IsAdmissible M}

/-- `RealReductive.IrrAdmissible.infChar`: the infinitesimal character of an irreducible module. -/
theorem IrrAdmissible.infChar [CompactSpace K] (M : GKModule V P) (hM : M ∈ IrrAdmissible V P) :
    ∃! χ : InfChar (𝔮 := 𝔮), HasInfChar (V := V) χ := sorry

/-- `RealReductive.IrrAdmissible.dual`: the `K`-finite dual of an irreducible admissible module is
irreducible admissible (stated through point separation). -/
theorem IrrAdmissible.dual (M : GKModule V P) (hM : M ∈ IrrAdmissible V P) (v : V) (hv : v ≠ 0) :
    ∃ f ∈ kFinite (Representation.dual M.ρ), f v ≠ 0 := sorry

/-- `RealReductive.IrrAdmissible.twist`: twisting by a one-dimensional module preserves
irreducibility. -/
theorem IrrAdmissible.twist (M : GKModule V P) (hM : M ∈ IrrAdmissible V P)
    {F : Type*} [AddCommGroup F] [Module ℂ F] [LieRingModule 𝔮 F] [LieModule ℂ 𝔮 F]
    (hF : Module.finrank ℂ F = 1) [FiniteDimensional ℂ F] (N : GKModule F P) :
    IsIrreducible (M.tensorFinite N) := sorry

-- test: irr_compact, irr_GL1R, irr_dual_not_conj: recorded in the packet.

section Tempered

variable {G : Type*} [Group G] [TopologicalSpace G] [IsTopologicalGroup G] [MeasurableSpace G]
  (μ : Measure G) {E : Type*} [NormedAddCommGroup E] [InnerProductSpace ℂ E] [CompleteSpace E]

/-- `RealReductive.IsSquareIntegrable` (for `G` with compact centre; in general modulo `A_G`). -/
def IsSquareIntegrable (π : ContRepresentation ℂ G E) : Prop :=
  ∀ v w : E, MemLp (fun g => inner ℂ w (π g v)) 2 μ

/-- `RealReductive.IsTempered`. -/
def IsTempered (π : ContRepresentation ℂ G E) : Prop :=
  ∀ ε : ℝ, 0 < ε → ∀ v w : E, MemLp (fun g => inner ℂ w (π g v)) (ENNReal.ofReal (2 + ε)) μ

/-- `RealReductive.IsEssentiallyTempered`: some twist by a character is tempered. -/
def IsEssentiallyTempered (π : ContRepresentation ℂ G E) : Prop :=
  ∃ χ : G →* ℂˣ, Continuous χ ∧ IsTempered μ (ContRepresentation.ofMonoidHom
    { toFun := fun g => ((χ g : ℂ)) • π g
      map_one' := sorry
      map_mul' := sorry })

theorem IsSquareIntegrable.isTempered [IsFiniteMeasureOnCompacts μ] {π : ContRepresentation ℂ G E}
    (h : IsSquareIntegrable μ π) (hbdd : ∀ g v, ‖π g v‖ ≤ ‖v‖) : IsTempered μ π := sorry

theorem IsTempered.twist_unitary {π : ContRepresentation ℂ G E} (h : IsTempered μ π)
    (χ : G →* ℂˣ) (hχ : ∀ g, ‖(χ g : ℂ)‖ = 1) :
    IsTempered μ (ContRepresentation.ofMonoidHom
      { toFun := fun g => ((χ g : ℂ)) • π g
        map_one' := sorry
        map_mul' := sorry }) := sorry

-- test: tempered_compact
example [CompactSpace G] [IsFiniteMeasure μ] (π : ContRepresentation ℂ G E)
    (hunit : ∀ g v, ‖π g v‖ = ‖v‖) : IsSquareIntegrable μ π := sorry

-- test: tempered_SL2_ds, tempered_trivial_not, tempered_GL1: recorded in the packet.

end Tempered

/-- Topological irreducibility of a continuous representation on a Hilbert space. -/
def IsTopIrreducible {G : Type*} [Group G] {E : Type*} [NormedAddCommGroup E] [InnerProductSpace ℂ E]
    (π : ContRepresentation ℂ G E) : Prop :=
  Nontrivial E ∧ ∀ W : Submodule ℂ E, IsClosed (W : Set E) → (∀ g, W.map (π g : E →ₗ[ℂ] E) ≤ W) →
    W = ⊥ ∨ W = ⊤

/-- `AF.1/discrete-series` (existence criterion): `G` has irreducible square-integrable
representations iff `rank 𝔤_ℂ = rank 𝔨_ℂ` (Harish-Chandra), for the complexified Lie algebras of
`G` and of a maximal compact subgroup. -/
theorem discreteSeries {G : Type*} [Group G] [TopologicalSpace G] [IsTopologicalGroup G]
    [MeasurableSpace G] (μ : Measure G) (𝔤c 𝔨c : Type*) [LieRing 𝔤c] [LieAlgebra ℂ 𝔤c]
    [Module.Free ℂ 𝔤c] [Module.Finite ℂ 𝔤c] [LieRing 𝔨c] [LieAlgebra ℂ 𝔨c] [Module.Free ℂ 𝔨c]
    [Module.Finite ℂ 𝔨c] :
    (∃ (E : Type) (_ : NormedAddCommGroup E) (_ : InnerProductSpace ℂ E) (_ : CompleteSpace E)
      (π : ContRepresentation ℂ G E), IsTopIrreducible π ∧ IsSquareIntegrable μ π) ↔
      LieAlgebra.rank ℂ 𝔤c = LieAlgebra.rank ℂ 𝔨c := sorry

/-- `AF.1/weil-group-real`, `RealReductive.WeilGroupReal`: `W_ℝ = ℂ^× ⊔ jℂ^×` with `j² = −1` and
`jzj⁻¹ = z̄`, modelled as pairs `(z, e)` meaning `z·j^e`. -/
@[ext] structure WeilGroupReal where
  z : ℂˣ
  e : ZMod 2

namespace WeilGroupReal

/-- Complex conjugation on `ℂˣ`. -/
def conjUnits (z : ℂˣ) : ℂˣ :=
  ⟨(starRingEnd ℂ) z, (starRingEnd ℂ) ↑z⁻¹, by simp [← map_mul], by simp [← map_mul]⟩

instance : Mul WeilGroupReal where
  mul a b := if a.e = 0 then ⟨a.z * b.z, b.e⟩
    else if b.e = 0 then ⟨a.z * conjUnits b.z, 1⟩ else ⟨-(a.z * conjUnits b.z), 0⟩

instance : One WeilGroupReal := ⟨⟨1, 0⟩⟩

instance : Group WeilGroupReal where
  mul_assoc := sorry
  one_mul := sorry
  mul_one := sorry
  inv a := if a.e = 0 then ⟨a.z⁻¹, 0⟩ else ⟨-(conjUnits a.z)⁻¹, 1⟩
  inv_mul_cancel := sorry

/-- The element `j`. -/
def j : WeilGroupReal := ⟨1, 1⟩

/-- The inclusion `ℂˣ = W_ℂ → W_ℝ`. -/
def ofComplex : ℂˣ →* WeilGroupReal where
  toFun z := ⟨z, 0⟩
  map_one' := rfl
  map_mul' a b := by
    show (⟨a * b, 0⟩ : WeilGroupReal) = if (0 : ZMod 2) = 0 then _ else _
    simp

/-- `RealReductive.WeilGroupReal.norm`: the abelianisation map `W_ℝ → ℝˣ`, `z ↦ |z|²`, `j ↦ −1`. -/
def norm (w : WeilGroupReal) : ℝ := if w.e = 0 then ‖(w.z : ℂ)‖ ^ 2 else -‖(w.z : ℂ)‖ ^ 2

-- test: weilReal_j_sq
example : j * j = ofComplex (-1) := sorry

/-- `RealReductive.WeilGroupReal.restrict_complex`: restriction of a representation to `W_ℂ`. -/
def restrict_complex {n : ℕ} (ρ : WeilGroupReal →* GL (Fin n) ℂ) : ℂˣ →* GL (Fin n) ℂ :=
  ρ.comp ofComplex

/-- `RealReductive.WeilGroupReal.IsTempered`: bounded image. -/
def IsTempered {n : ℕ} (ρ : WeilGroupReal →* GL (Fin n) ℂ) : Prop :=
  ∃ C : ℝ, ∀ w i k, ‖((ρ w : GL (Fin n) ℂ) : Matrix (Fin n) (Fin n) ℂ) i k‖ ≤ C

-- `RealReductive.WeilGroupReal.irreducible_classification` and the tests `weilReal_ab`,
-- `weilComplex_irreducible_dim_one`, `weilReal_not_split`, `weilReal_character_compat` are recorded
-- in the packet; the topology on `W_ℝ` and the classification are part of the implementation.

end WeilGroupReal

/-- `recGL` at `n = 1`: characters of `ℝˣ` correspond to characters of `W_ℝ` through the norm map
(class field theory for `ℝ`). -/
def recGL_one (χ : ℝˣ →* ℂˣ) : WeilGroupReal → ℂˣ := fun w =>
  χ (Units.mk0 (WeilGroupReal.norm w) sorry)

-- Not prototyped in this file (they need the explicit pairs `(𝔤𝔩_n, O(n))`, `(𝔤𝔩_n, U(n))` and the
-- Langlands data, which are not set up here): `RealReductive.recGL` (`AF.1/archimedean-llc-gln`),
-- `RealReductive.langlandsClassification`, `RealReductive.GL2.discreteSeries` and its API
-- (`discreteSeries_casimir`, `discreteSeries_ktypes`, `discreteSeries_irreducible`,
-- `classification`) with tests `gl2DS_*`, `RealReductive.voganGenericUnitary`.

end RealReductive

namespace Automorphic

open MeasureTheory

/-! ## AF.2 Automorphic spaces and representations -/

section AF2

variable {Ginf Gf : Type*} [Group Ginf] [TopologicalSpace Ginf] [IsTopologicalGroup Ginf]
  [Group Gf] [TopologicalSpace Gf] [IsTopologicalGroup Gf]
  {E : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E] {H : Type*} [TopologicalSpace H]
  (I : ModelWithCorners ℝ E H) [ChartedSpace H Ginf]
  {𝔤 : Type*} [LieRing 𝔤] [LieAlgebra ℂ 𝔤]
  (A : AdelicData Ginf Gf) (R : DerivedAction 𝔤 Ginf Gf) (Kinf : Subgroup Ginf)

variable (𝔤) in
/-- `Z(𝔤)`. -/
abbrev Zg := Subalgebra.center ℂ (UniversalEnvelopingAlgebra ℂ 𝔤)

/-- `Z(𝔤)`-finiteness of a function. -/
def IsZFinite (φ : Ginf × Gf → ℂ) : Prop :=
  ∃ J : Ideal (Zg 𝔤), Module.Finite ℂ (Zg 𝔤 ⧸ J) ∧ ∀ z ∈ J, R.act z φ = 0

/-- Right `K∞`-finiteness of a function. -/
def IsKFinite (φ : Ginf × Gf → ℂ) : Prop :=
  FiniteDimensional ℂ (Submodule.span ℂ
    (Set.range fun k : Kinf => rightTranslate ((k : Ginf), (1 : Gf)) φ))

/-- `AF.2/automorphic-form`, `Automorphic.AutomorphicForm`: left `G(F)`-invariant, smooth, right
`K∞`-finite, `Z(𝔤)`-finite functions of moderate growth. -/
def AutomorphicForm : Submodule ℂ (Ginf × Gf → ℂ) where
  carrier := {φ | (∀ γ ∈ A.rational, ∀ g, φ (γ * g) = φ g) ∧ IsSmoothAdelic I φ ∧
    IsKFinite Kinf φ ∧ IsZFinite R φ ∧ HasModerateGrowth A φ}
  add_mem' := sorry
  zero_mem' := sorry
  smul_mem' := sorry

variable {I A R Kinf}

theorem AutomorphicForm.leftInvariant {φ : Ginf × Gf → ℂ} (hφ : φ ∈ AutomorphicForm I A R Kinf)
    {γ : Ginf × Gf} (hγ : γ ∈ A.rational) (g : Ginf × Gf) : φ (γ * g) = φ g := hφ.1 γ hγ g

theorem AutomorphicForm.exists_level {φ : Ginf × Gf → ℂ} (hφ : φ ∈ AutomorphicForm I A R Kinf) :
    ∃ J : Subgroup Gf, IsOpen (J : Set Gf) ∧ IsCompact (J : Set Gf) ∧ IsLevelInvariant φ J :=
  hφ.2.1.1

theorem AutomorphicForm.exists_ideal {φ : Ginf × Gf → ℂ} (hφ : φ ∈ AutomorphicForm I A R Kinf) :
    ∃ J : Ideal (Zg 𝔤), Module.Finite ℂ (Zg 𝔤 ⧸ J) ∧ ∀ z ∈ J, R.act z φ = 0 := hφ.2.2.2.1

variable (I A R Kinf)

/-- `Automorphic.AutomorphicForm.withCentralChar`: forms with central character `χ` on a subgroup
`Zc ≤ G(𝔸)` (the centre). -/
def AutomorphicForm.withCentralChar (Zc : Subgroup (Ginf × Gf)) (χ : Zc →* ℂˣ) :
    Submodule ℂ (Ginf × Gf → ℂ) :=
  AutomorphicForm I A R Kinf ⊓
    { carrier := {φ | ∀ (z : Zc) (g : Ginf × Gf), φ (z * g) = (χ z : ℂ) * φ g}
      add_mem' := sorry
      zero_mem' := sorry
      smul_mem' := sorry }

/-- `Automorphic.AutomorphicForm.fixedType`: `A(G, J, ξ, J_Z)`: `J`-invariant forms fixed by the
fundamental idempotent `e` of finitely many `K∞`-types and killed by the ideal `JZ`. -/
def AutomorphicForm.fixedType (J : Subgroup Gf) (e : Module.End ℂ (Ginf × Gf → ℂ))
    (JZ : Ideal (Zg 𝔤)) : Submodule ℂ (Ginf × Gf → ℂ) :=
  AutomorphicForm I A R Kinf ⊓
    { carrier := {φ | IsLevelInvariant φ J ∧ e φ = φ ∧ ∀ z ∈ JZ, R.act z φ = 0}
      add_mem' := sorry
      zero_mem' := sorry
      smul_mem' := sorry }

/-- `AF.2/automorphic-forms-uniform-growth`, `Automorphic.AutomorphicForm.toUniformModerateGrowth`. -/
theorem AutomorphicForm.mem_uniformModerateGrowth {φ : Ginf × Gf → ℂ}
    (hφ : φ ∈ AutomorphicForm I A R Kinf) : ∃ N : ℝ, φ ∈ UniformModerateGrowth A R N := sorry

theorem AutomorphicForm.toUniformModerateGrowth {φ : Ginf × Gf → ℂ}
    (hφ : φ ∈ AutomorphicForm I A R Kinf) : ∃ N : ℝ, φ ∈ UniformModerateGrowth A R N :=
  AutomorphicForm.mem_uniformModerateGrowth I A R Kinf hφ

-- test: automorphicForm_const
example [CompactSpace Gf] (hR : ∀ z : Zg 𝔤, ∃ c : ℂ, R.act z (fun _ => 1) = fun _ => c)
    (hsmooth : IsSmoothAdelic I (fun _ : Ginf × Gf => (1 : ℂ))) :
    (fun _ : Ginf × Gf => (1 : ℂ)) ∈ AutomorphicForm I A R Kinf := sorry

-- test: automorphicForm_log_not_eigen (abstract form: `Z(𝔤)`-finite does not mean eigen)
example (φ : Ginf × Gf → ℂ) (z : Zg 𝔤) (c : ℂ) (h1 : R.act z φ ≠ c • φ)
    (h2 : (R.act z - c • 1) ((R.act z - c • 1) φ) = 0) : ¬ ∀ φ', R.act z φ' = c • φ' := by
  intro h; exact h1 (h φ)

-- test: automorphicForm_not_K_finite
example (φ : Ginf × Gf → ℂ) (hφ : ¬ IsKFinite Kinf φ) : φ ∉ AutomorphicForm I A R Kinf :=
  fun h => hφ h.2.2.1

-- test: automorphicForm_gl1_character, automorphicForm_classical_compat: see the AF.5 section.

/-- `AF.2/smooth-automorphic-forms`, `Automorphic.SmoothAutomorphicForm`: `Z(𝔤)`-finite functions of
uniform moderate growth. -/
def SmoothAutomorphicForm : Submodule ℂ (Ginf × Gf → ℂ) where
  carrier := {φ | (∃ N : ℝ, φ ∈ UniformModerateGrowth A R N) ∧ IsZFinite R φ}
  add_mem' := sorry
  zero_mem' := sorry
  smul_mem' := sorry

/-- `Automorphic.SmoothAutomorphicForm.kFinite_eq`. -/
theorem SmoothAutomorphicForm.kFinite_eq (φ : Ginf × Gf → ℂ) :
    (φ ∈ SmoothAutomorphicForm A R ∧ IsKFinite Kinf φ) ↔ φ ∈ AutomorphicForm I A R Kinf := sorry

/-- `Automorphic.SmoothAutomorphicForm.rightTranslate`. -/
theorem SmoothAutomorphicForm.rightTranslate {φ : Ginf × Gf → ℂ}
    (hφ : φ ∈ SmoothAutomorphicForm A R) (y : Ginf × Gf) :
    Automorphic.rightTranslate y φ ∈ SmoothAutomorphicForm A R := sorry

-- `Automorphic.SmoothAutomorphicForm.globalization`: not prototyped (needs the Casselman–Wallach
-- globalization of `A(G, J, ·, J_Z)` as an SF-representation of `G(F_∞)`).

-- test: smoothAutomorphic_const
example (h1 : ∃ N : ℝ, (fun _ : Ginf × Gf => (1 : ℂ)) ∈ UniformModerateGrowth A R N)
    (hZ : IsZFinite R (fun _ : Ginf × Gf => (1 : ℂ))) :
    (fun _ : Ginf × Gf => (1 : ℂ)) ∈ SmoothAutomorphicForm A R := ⟨h1, hZ⟩

/-- `AF.2/harish-chandra-finiteness`: `A(G, J, ξ, J_Z)` is finite-dimensional (for `J` compact open,
`e` the idempotent of finitely many `K∞`-types and `J_Z` of finite codimension). -/
theorem AutomorphicForm.finiteDimensional_fixedType (J : Subgroup Gf) (hJo : IsOpen (J : Set Gf))
    (hJc : IsCompact (J : Set Gf)) (e : Module.End ℂ (Ginf × Gf → ℂ)) (he : IsIdempotentElem e)
    (JZ : Ideal (Zg 𝔤)) (hJZ : Module.Finite ℂ (Zg 𝔤 ⧸ JZ)) :
    FiniteDimensional ℂ (AutomorphicForm.fixedType I A R Kinf J e JZ) := sorry

/-- Classical automorphic forms on `Γ \ G(F_∞)`. -/
def ClassicalForm (Γ : Subgroup Ginf) : Submodule ℂ (Ginf → ℂ) where
  carrier := {f | (∀ γ ∈ Γ, ∀ x, f (γ * x) = f x) ∧ ContMDiff I 𝓘(ℝ, ℂ) ∞ f}
  add_mem' := sorry
  zero_mem' := sorry
  smul_mem' := sorry

/-- `AF.2/adelic-classical-bijection`: `G(𝔸) = ⊔ G(F) t_i G(F_∞) J` identifies `J`-invariant
automorphic functions with tuples of `Γ_i`-invariant functions on `G(F_∞)`. -/
theorem AutomorphicForm.classicalEquiv (J : Subgroup Gf) {h : ℕ} (t : Fin h → Gf)
    (Γ : Fin h → Subgroup Ginf)
    (hdecomp : ∀ g : Ginf × Gf, ∃ i, ∃ γ ∈ A.rational, ∃ x : Ginf, ∃ j ∈ J, g = γ * (x, t i * j)) :
    Nonempty ({φ : Ginf × Gf → ℂ // (∀ γ ∈ A.rational, ∀ g, φ (γ * g) = φ g) ∧ IsLevelInvariant φ J}
      ≃ ((i : Fin h) → {f : Ginf → ℂ // ∀ γ ∈ Γ i, ∀ x, f (γ * x) = f x})) := sorry

/-- `AF.2/automorphic-forms-module`, `Automorphic.AutomorphicForm.gkModule`: `A(G)` is stable under
`U(𝔤)` and `K∞`. -/
theorem AutomorphicForm.gkModule {φ : Ginf × Gf → ℂ} (hφ : φ ∈ AutomorphicForm I A R Kinf) :
    (∀ X, R.act X φ ∈ AutomorphicForm I A R Kinf) ∧
      ∀ k ∈ Kinf, Automorphic.rightTranslate (k, (1 : Gf)) φ ∈ AutomorphicForm I A R Kinf := sorry

/-- `Automorphic.AutomorphicForm.finiteAction`. -/
theorem AutomorphicForm.finiteAction {φ : Ginf × Gf → ℂ} (hφ : φ ∈ AutomorphicForm I A R Kinf)
    (y : Gf) : Automorphic.rightTranslate ((1 : Ginf), y) φ ∈ AutomorphicForm I A R Kinf := sorry

/-- `Automorphic.AutomorphicForm.heckeAction_compat`. -/
theorem AutomorphicForm.heckeAction_compat {φ : Ginf × Gf → ℂ}
    (hφ : φ ∈ AutomorphicForm I A R Kinf) (J : Subgroup Gf) (cosets : Finset Gf) :
    heckeAction J cosets φ ∈ AutomorphicForm I A R Kinf := sorry

/-- `Automorphic.GlobalHeckeModule`: a `(𝔤, K∞) × G(𝔸_f)`-module: commuting actions of `U(𝔤)`,
`K∞` and `G(𝔸_f)` on a complex vector space, smooth for `G(𝔸_f)`. -/
structure GlobalHeckeModule (W : Type*) [AddCommGroup W] [Module ℂ W] where
  arch : UniversalEnvelopingAlgebra ℂ 𝔤 →ₐ[ℂ] Module.End ℂ W
  kinf : Representation ℂ Kinf W
  fin : Representation ℂ Gf W
  smooth : ∀ w : W, ∃ J : Subgroup Gf, IsOpen (J : Set Gf) ∧ ∀ j ∈ J, fin j w = w
  comm : ∀ (X : UniversalEnvelopingAlgebra ℂ 𝔤) (y : Gf), arch X ∘ₗ fin y = fin y ∘ₗ arch X

/-- `Automorphic.AutomorphicSubquotient`: a pair `W' ≤ W` of stable subspaces of `A(G)`. -/
structure AutomorphicSubquotient where
  W : Submodule ℂ (Ginf × Gf → ℂ)
  W' : Submodule ℂ (Ginf × Gf → ℂ)
  le : W' ≤ W
  le_auto : W ≤ AutomorphicForm I A R Kinf
  stable : ∀ φ ∈ W, (∀ X, R.act X φ ∈ W) ∧ (∀ y : Gf, Automorphic.rightTranslate (1, y) φ ∈ W) ∧
    ∀ k ∈ Kinf, Automorphic.rightTranslate (k, (1 : Gf)) φ ∈ W
  stable' : ∀ φ ∈ W', (∀ X, R.act X φ ∈ W') ∧ (∀ y : Gf, Automorphic.rightTranslate (1, y) φ ∈ W') ∧
    ∀ k ∈ Kinf, Automorphic.rightTranslate (k, (1 : Gf)) φ ∈ W'

-- test: automorphicModule_trivial
example [CompactSpace Gf] (hconst : (fun _ : Ginf × Gf => (1 : ℂ)) ∈ AutomorphicForm I A R Kinf)
    (y : Gf) : Automorphic.rightTranslate ((1 : Ginf), y) (fun _ : Ginf × Gf => (1 : ℂ)) =
      fun _ => 1 := rfl

-- test: automorphicModule_gl1, automorphicModule_not_G_infty: recorded in the packet.

/-- `AF.2/automorphic-representation`, `Automorphic.AutomorphicRepresentation`: an irreducible
automorphic subquotient (no stable subspace strictly between `W'` and `W`). -/
structure AutomorphicRepresentation extends AutomorphicSubquotient I A R Kinf where
  lt : W' < W
  irreducible : ∀ U : Submodule ℂ (Ginf × Gf → ℂ), W' ≤ U → U ≤ W →
    (∀ φ ∈ U, (∀ X, R.act X φ ∈ U) ∧ (∀ y : Gf, Automorphic.rightTranslate (1, y) φ ∈ U) ∧
      ∀ k ∈ Kinf, Automorphic.rightTranslate (k, (1 : Gf)) φ ∈ U) → U = W' ∨ U = W

/-- `Automorphic.AutomorphicRepresentation.multiplicity`: `m(π)`, the dimension of the space of
`(𝔤, K∞) × G(𝔸_f)`-embeddings of the subquotient into `A(G)` (valued in `ℕ∞`). -/
def AutomorphicRepresentation.multiplicity (π : AutomorphicRepresentation I A R Kinf) : ℕ∞ := sorry

/-- `Automorphic.AutomorphicRepresentation.multiplicity_finite`: `m(π) < ∞`. -/
theorem AutomorphicRepresentation.multiplicity_finite (π : AutomorphicRepresentation I A R Kinf) :
    π.multiplicity ≠ ⊤ := sorry

/-- `Automorphic.AutomorphicRepresentation.centralCharacter`: the centre acts by a character. -/
theorem AutomorphicRepresentation.centralCharacter (π : AutomorphicRepresentation I A R Kinf)
    (Zc : Subgroup (Ginf × Gf)) (hZ : ∀ z ∈ Zc, ∀ g, z * g = g * z) :
    ∃ χ : Zc →* ℂˣ, ∀ (z : Zc), ∀ φ ∈ π.W, ∃ ψ ∈ π.W',
      Automorphic.rightTranslate (z : Ginf × Gf) φ = (χ z : ℂ) • φ + ψ := sorry

/-- `Automorphic.AutomorphicRepresentation.twist`: twisting by a character of `G(F) \ G(𝔸)` preserves
automorphy. -/
theorem AutomorphicRepresentation.twist (χ : Ginf × Gf →* ℂˣ) (hχ : ∀ γ ∈ A.rational, χ γ = 1)
    (hχs : IsSmoothAdelic I (fun g => (χ g : ℂ))) {φ : Ginf × Gf → ℂ}
    (hφ : φ ∈ AutomorphicForm I A R Kinf) :
    (fun g => (χ g : ℂ) * φ g) ∈ AutomorphicForm I A R Kinf := sorry

-- `Automorphic.AutomorphicRepresentation.smooth` (bijection with smooth automorphic
-- representations): not prototyped (needs the globalization of `AF.2/smooth-automorphic-forms`).
-- tests `autRep_trivial`, `autRep_gl1`, `autRep_mult_not_one`: recorded in the packet.

end AF2

/-- The transition map `⊗_{v ∈ S} W_v → ⊗_{v ∈ S'} W_v`, `w ↦ w ⊗ ⊗_{v ∈ S' \ S} φ⁰_v`. -/
def RestrictedTensor.transition {ι : Type*} [DecidableEq ι] (W : ι → Type*)
    [∀ i, AddCommGroup (W i)] [∀ i, Module ℂ (W i)] (φ0 : ∀ i, W i) (S S' : Finset ι)
    (h : S ≤ S') : PiTensorProduct ℂ (fun i : S => W i) →ₗ[ℂ] PiTensorProduct ℂ (fun i : S' => W i) :=
  sorry

/-- `AF.2/restricted-tensor-product`, `Automorphic.RestrictedTensor`: the directed colimit over
finite sets `S` of `⊗_{v ∈ S} W_v`. -/
def RestrictedTensor {ι : Type*} [DecidableEq ι] (W : ι → Type*) [∀ i, AddCommGroup (W i)]
    [∀ i, Module ℂ (W i)] (φ0 : ∀ i, W i) : Type _ :=
  Module.DirectLimit (fun S : Finset ι => PiTensorProduct ℂ (fun i : S => W i))
    (RestrictedTensor.transition W φ0)

instance {ι : Type*} [DecidableEq ι] (W : ι → Type*) [∀ i, AddCommGroup (W i)]
    [∀ i, Module ℂ (W i)] (φ0 : ∀ i, W i) : AddCommGroup (RestrictedTensor W φ0) := by
  unfold RestrictedTensor; infer_instance

instance {ι : Type*} [DecidableEq ι] (W : ι → Type*) [∀ i, AddCommGroup (W i)]
    [∀ i, Module ℂ (W i)] (φ0 : ∀ i, W i) : Module ℂ (RestrictedTensor W φ0) := by
  unfold RestrictedTensor; infer_instance

/-- `Automorphic.RestrictedTensor.of`. -/
def RestrictedTensor.of {ι : Type*} [DecidableEq ι] (W : ι → Type*) [∀ i, AddCommGroup (W i)]
    [∀ i, Module ℂ (W i)] (φ0 : ∀ i, W i) (S : Finset ι) :
    PiTensorProduct ℂ (fun i : S => W i) →ₗ[ℂ] RestrictedTensor W φ0 :=
  Module.DirectLimit.of ℂ (Finset ι) (fun S : Finset ι => PiTensorProduct ℂ (fun i : S => W i))
    (RestrictedTensor.transition W φ0) S

/-- `Automorphic.RestrictedTensor.map`: families `B_v` fixing `φ⁰_v` induce `⊗' B_v`. -/
def RestrictedTensor.map {ι : Type*} [DecidableEq ι] {W W' : ι → Type*} [∀ i, AddCommGroup (W i)]
    [∀ i, Module ℂ (W i)] [∀ i, AddCommGroup (W' i)] [∀ i, Module ℂ (W' i)] (φ0 : ∀ i, W i)
    (φ0' : ∀ i, W' i) (B : ∀ i, W i →ₗ[ℂ] W' i) (hB : ∀ i, B i (φ0 i) = φ0' i) :
    RestrictedTensor W φ0 →ₗ[ℂ] RestrictedTensor W' φ0' := sorry

/-- `Automorphic.RestrictedTensor.rescale`: rescaling the distinguished vectors gives an isomorphic
space. -/
theorem RestrictedTensor.rescale {ι : Type*} [DecidableEq ι] (W : ι → Type*)
    [∀ i, AddCommGroup (W i)] [∀ i, Module ℂ (W i)] (φ0 : ∀ i, W i) (c : ι → ℂˣ) :
    Nonempty (RestrictedTensor W φ0 ≃ₗ[ℂ] RestrictedTensor W (fun i => (c i : ℂ) • φ0 i)) := sorry

-- `Automorphic.RestrictedTensor.algebra`: the algebra structure for algebras with idempotents is
-- part of the implementation (not prototyped). Tests `restrictedTensor_finite`,
-- `restrictedTensor_polynomial`, `restrictedTensor_not_full`: recorded in the packet.

/-- `AF.2/spherical-dimension-one` (algebraic core): an irreducible finite-dimensional module over a
commutative algebra of operators is at most one-dimensional; applied to `π_v^{K_v}` under the
commutative spherical Hecke algebra (SmoothRepresentationsOfLocalGroups SR.4). -/
theorem finrank_spherical_le_one {W : Type*} [AddCommGroup W] [Module ℂ W] [FiniteDimensional ℂ W]
    (𝓗 : Subalgebra ℂ (Module.End ℂ W)) (hcomm : ∀ a ∈ 𝓗, ∀ b ∈ 𝓗, a * b = b * a)
    (hirr : ∀ U : Submodule ℂ W, (∀ a ∈ 𝓗, U.map a ≤ U) → U = ⊥ ∨ U = ⊤) :
    Module.finrank ℂ W ≤ 1 := sorry

-- `Automorphic.flath` (`AF.2/flath-factorization`): not prototyped beyond its spherical core above
-- (needs restricted tensor products of representations of `G(F_v)` indexed by places).

/-- `AF.2/nongeneric-automorphic`: a nontrivial character of a compact group integrates to zero, so
constant functions have vanishing Whittaker coefficients. -/
theorem trivial_not_generic {N : Type*} [CommGroup N] [TopologicalSpace N] [IsTopologicalGroup N]
    [CompactSpace N] [MeasurableSpace N] [BorelSpace N] (μ : Measure N) [μ.IsMulLeftInvariant]
    [IsProbabilityMeasure μ] (ψ : N →* ℂˣ) (hψ : ψ ≠ 1) (hcont : Continuous fun n => (ψ n : ℂ)) :
    ∫ n, (ψ n : ℂ) ∂μ = 0 := sorry

/-- `AF.2/holomorphic-sl2-forms` (case `F_0 = ℚ`), `Automorphic.SL2.HolomorphicForm`: holomorphic
forms of weight `k` and level `Γ ≤ SL₂(ℤ)` (Mathlib modular forms). -/
abbrev SL2.HolomorphicForm (Γ : Subgroup (Matrix.SpecialLinearGroup (Fin 2) ℤ)) (k : ℤ) :=
  ModularForm (Γ.map (Matrix.SpecialLinearGroup.mapGL ℝ)) k

-- `Automorphic.SL2.HolomorphicForm.qExpansion`, `.rationalStructure`, `.flat`, `.coefficient` and the
-- tests `sl2Hol_*` (dimension 2 in weight 12, vanishing for negative weight, compatibility with
-- Mathlib modular forms, exclusion of exponential growth): recorded in the packet; over a general
-- totally real field they need Hilbert modular forms.

/-! ## AF.3 Constant terms and cusp forms -/

section AF3

variable {Ginf Gf : Type*} [Group Ginf] [TopologicalSpace Ginf] [IsTopologicalGroup Ginf]
  [Group Gf] [TopologicalSpace Gf] [IsTopologicalGroup Gf] [MeasurableSpace Ginf]
  [MeasurableSpace Gf]

/-- `AF.3/unipotent-quotient-compact` (base case `N = G_a`): `K \ 𝔸_K` is compact (Tau Ceti
GlobalNumberFields Layer 5); the unipotent case follows by filtering `N`. -/
theorem isCompact_unipotentQuotient (K : Type*) [Field K] [NumberField K] :
    ∃ C : Set (NumberField.AdeleRing (NumberField.RingOfIntegers K) K), IsCompact C ∧
      ∀ x, ∃ a : K, x - algebraMap K _ a ∈ C := sorry

/-- `AF.3/constant-term`, `Automorphic.constantTerm`: `φ_P(g) = ∫_{N_P(F) \ N_P(𝔸)} φ(n g) dn`,
computed on a fundamental domain `D ⊆ N_P(𝔸)` with probability measure `μ`. -/
def constantTerm (μ : Measure (Ginf × Gf)) (D : Set (Ginf × Gf)) (φ : Ginf × Gf → ℂ) :
    Ginf × Gf → ℂ :=
  fun g => ∫ n in D, φ (n * g) ∂μ

/-- `Automorphic.constantTerm_rightTranslate`. -/
theorem constantTerm_rightTranslate (μ : Measure (Ginf × Gf)) (D : Set (Ginf × Gf))
    (φ : Ginf × Gf → ℂ) (y : Ginf × Gf) :
    constantTerm μ D (rightTranslate y φ) = rightTranslate y (constantTerm μ D φ) := by
  funext g; simp [constantTerm, rightTranslate, mul_assoc]

/-- `Automorphic.constantTerm_leftInvariant`: left invariance under `N_P(𝔸)` (using that `D` is a
fundamental domain for `N_P(F)` in `N_P(𝔸)` and `φ` is left `N_P(F)`-invariant). -/
theorem constantTerm_leftInvariant (μ : Measure (Ginf × Gf)) (Nrat Nad : Subgroup (Ginf × Gf))
    (D : Set (Ginf × Gf)) (hD : IsFundamentalDomain Nrat D (μ.restrict Nad)) (φ : Ginf × Gf → ℂ)
    (hφ : ∀ γ ∈ Nrat, ∀ g, φ (γ * g) = φ g) (n : Ginf × Gf) (hn : n ∈ Nad) (g : Ginf × Gf) :
    constantTerm μ D φ (n * g) = constantTerm μ D φ g := sorry

/-- `Automorphic.constantTerm_automorphic`: constant terms preserve uniform moderate growth. -/
theorem constantTerm_automorphic {𝔤 : Type*} [LieRing 𝔤] [LieAlgebra ℂ 𝔤] (A : AdelicData Ginf Gf)
    (R : DerivedAction 𝔤 Ginf Gf) (P : ParabolicData Ginf Gf) (μ : Measure (Ginf × Gf))
    (D : Set (Ginf × Gf)) (hD : IsCompact D) {N : ℝ} {φ : Ginf × Gf → ℂ}
    (hφ : φ ∈ UniformModerateGrowth A R N) :
    constantTerm μ D φ ∈ UniformModerateGrowth.ofParabolic A R P N := sorry

/-- `Automorphic.constantTerm_top`: for `N_P` trivial, `φ_G = φ`. -/
theorem constantTerm_top (φ : Ginf × Gf → ℂ) [MeasurableSingletonClass (Ginf × Gf)] :
    constantTerm (Measure.dirac 1) {1} φ = φ := by
  funext g; simp [constantTerm]

/-- `Automorphic.constantTerm_const`. -/
theorem constantTerm_const (μ : Measure (Ginf × Gf)) (D : Set (Ginf × Gf)) (hD : μ D = 1)
    (c : ℂ) : constantTerm μ D (fun _ => c) = fun _ => c := by
  funext g; simp [constantTerm, Measure.real, hD]

-- test: constantTerm_const
example (μ : Measure (Ginf × Gf)) (D : Set (Ginf × Gf)) (hD : μ D = 1) :
    constantTerm μ D (fun _ => (5 : ℂ)) = fun _ => 5 := constantTerm_const μ D hD 5

-- test: constantTerm_gl2_eisenstein, constantTerm_cusp_compat: see the AF.5 section (the GL₂
-- dictionary); constantTerm_not_full_N: recorded in the packet.

/-- `AF.3/constant-term-transitivity`: `(φ_P)_Q = φ_Q`, given the Fubini decomposition of the
fundamental domain of `N_Q` as `D_Q = D_P · D_{Q ∩ M_P}`. -/
theorem constantTerm_constantTerm (μ : Measure (Ginf × Gf)) (DP DQM DQ : Set (Ginf × Gf))
    (φ : Ginf × Gf → ℂ)
    (hD : ∀ f : Ginf × Gf → ℂ, ∫ n in DQ, f n ∂μ = ∫ m in DQM, ∫ n in DP, f (n * m) ∂μ ∂μ) :
    constantTerm μ DQM (constantTerm μ DP φ) = constantTerm μ DQ φ := by
  funext g
  simp only [constantTerm, hD (fun n => φ (n * g)), mul_assoc]

/-- A family of rational parabolics with fundamental domains for their unipotent radicals. -/
structure ParabolicFamily (Ginf Gf : Type*) [Group Ginf] [Group Gf] [MeasurableSpace Ginf]
    [MeasurableSpace Gf] where
  ι : Type
  P : ι → ParabolicData Ginf Gf
  μ : ι → Measure (Ginf × Gf)
  D : ι → Set (Ginf × Gf)

variable {E : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E] {H : Type*} [TopologicalSpace H]
  (I : ModelWithCorners ℝ E H) [ChartedSpace H Ginf]
  {𝔤 : Type*} [LieRing 𝔤] [LieAlgebra ℂ 𝔤]
  (A : AdelicData Ginf Gf) (R : DerivedAction 𝔤 Ginf Gf) (Kinf : Subgroup Ginf)
  (PF : ParabolicFamily Ginf Gf)

/-- `AF.3/cusp-form`, `Automorphic.CuspForm`: automorphic forms all of whose constant terms along
the proper rational parabolics `PF` vanish. -/
def CuspForm : Submodule ℂ (Ginf × Gf → ℂ) :=
  AutomorphicForm I A R Kinf ⊓
    { carrier := {φ | ∀ i, constantTerm (PF.μ i) (PF.D i) φ = 0}
      add_mem' := sorry
      zero_mem' := sorry
      smul_mem' := sorry }

/-- `Automorphic.CuspForm.constantTerm_eq_zero`. -/
theorem CuspForm.constantTerm_eq_zero (φ : Ginf × Gf → ℂ) :
    φ ∈ CuspForm I A R Kinf PF ↔
      φ ∈ AutomorphicForm I A R Kinf ∧ ∀ i, constantTerm (PF.μ i) (PF.D i) φ = 0 := Iff.rfl

/-- `Automorphic.CuspForm.iff_maximal_standard`: if every member of `PF` has its constant term
determined by those of a subfamily `PFmax` (transitivity and conjugation), testing `PFmax` suffices. -/
theorem CuspForm.iff_maximal_standard (S : Set PF.ι)
    (hS : ∀ (φ : Ginf × Gf → ℂ), (∀ i ∈ S, constantTerm (PF.μ i) (PF.D i) φ = 0) →
      ∀ i, constantTerm (PF.μ i) (PF.D i) φ = 0) (φ : Ginf × Gf → ℂ) :
    φ ∈ CuspForm I A R Kinf PF ↔
      φ ∈ AutomorphicForm I A R Kinf ∧ ∀ i ∈ S, constantTerm (PF.μ i) (PF.D i) φ = 0 :=
  ⟨fun h => ⟨h.1, fun i _ => h.2 i⟩, fun h => ⟨h.1, hS φ h.2⟩⟩

/-- `Automorphic.CuspForm.submodule`: stability of cusp forms under the actions. -/
theorem CuspForm.submodule {φ : Ginf × Gf → ℂ} (hφ : φ ∈ CuspForm I A R Kinf PF) (y : Gf) :
    Automorphic.rightTranslate ((1 : Ginf), y) φ ∈ CuspForm I A R Kinf PF := sorry

/-- `AF.3/anisotropic-cuspidal`: with no proper rational parabolics every automorphic form is
cuspidal. -/
theorem cuspForm_eq_top_of_anisotropic (h : IsEmpty PF.ι) :
    CuspForm I A R Kinf PF = AutomorphicForm I A R Kinf := by
  ext φ
  simp only [CuspForm, Submodule.mem_inf]
  exact ⟨fun h' => h'.1, fun h' => ⟨h', fun i => (h.false i).elim⟩⟩

-- test: cuspForm_anisotropic
example (h : IsEmpty PF.ι) : CuspForm I A R Kinf PF = AutomorphicForm I A R Kinf :=
  cuspForm_eq_top_of_anisotropic I A R Kinf PF h

-- test: cuspForm_const_not
example (i : PF.ι) (hμ : PF.μ i (PF.D i) = 1) :
    (fun _ : Ginf × Gf => (1 : ℂ)) ∉ CuspForm I A R Kinf PF := by
  intro h
  have h0 := congrFun (h.2 i) 1
  rw [constantTerm_const _ _ hμ] at h0
  exact one_ne_zero h0

-- tests cuspForm_delta, cuspForm_eisenstein_not, `Automorphic.CuspForm.classical_compat`: see AF.5.

/-- `AF.3/cusp-form-rapid-decay`, `Automorphic.CuspForm.rapidDecay`: on a Siegel set `S`. -/
theorem CuspForm.rapidDecay {φ : Ginf × Gf → ℂ} (hφ : φ ∈ CuspForm I A R Kinf PF)
    (S : Set (Ginf × Gf)) (N : ℝ) : ∃ C : ℝ, ∀ g ∈ S, ‖φ g‖ ≤ C * A.height g ^ (-N) := sorry

/-- `AF.3/cusp-forms-square-integrable`, `Automorphic.CuspForm.memL2`: square integrable on a
fundamental domain `F` of `G(F)A_G \ G(𝔸)` of finite volume. -/
theorem CuspForm.memL2 {φ : Ginf × Gf → ℂ} (hφ : φ ∈ CuspForm I A R Kinf PF)
    (μG : Measure (Ginf × Gf)) (F : Set (Ginf × Gf)) (hF : μG F < ⊤) :
    MemLp φ 2 (μG.restrict F) := sorry

/-- `Automorphic.L2Cusp`: cuspidal square-integrable functions on the fundamental domain `F`. -/
def L2Cusp (μG : Measure (Ginf × Gf)) (F : Set (Ginf × Gf)) : Submodule ℂ (Ginf × Gf → ℂ) where
  carrier := {φ | (∀ γ ∈ A.rational, ∀ g, φ (γ * g) = φ g) ∧ MemLp φ 2 (μG.restrict F) ∧
    ∀ i, ∀ᵐ g ∂μG, constantTerm (PF.μ i) (PF.D i) φ g = 0}
  add_mem' := sorry
  zero_mem' := sorry
  smul_mem' := sorry

-- `Automorphic.L2Cusp.discrete` (`AF.3/cuspidal-spectrum-discrete`): not prototyped (needs the
-- Hilbert space `L²(G(F)A_G \ G(𝔸))` of AdelicAlgebraicGroups AA.2/central-character-l2 and the
-- operators `R(f)`).

/-- `AF.3/cuspidal-automorphic-representation`, `Automorphic.CuspidalRepresentation`: an irreducible
stable subspace of cusp forms. -/
structure CuspidalRepresentation where
  W : Submodule ℂ (Ginf × Gf → ℂ)
  le_cusp : W ≤ CuspForm I A R Kinf PF
  ne_bot : W ≠ ⊥
  irreducible : ∀ U ≤ W, (∀ φ ∈ U, (∀ X, R.act X φ ∈ U) ∧
    ∀ y : Gf, Automorphic.rightTranslate ((1 : Ginf), y) φ ∈ U) → U = ⊥ ∨ U = W

/-- `Automorphic.CuspidalRepresentation.toAutomorphic`. -/
theorem CuspidalRepresentation.toAutomorphic (π : CuspidalRepresentation I A R Kinf PF) :
    π.W ≤ AutomorphicForm I A R Kinf := fun _ h => (π.le_cusp h).1

-- `Automorphic.CuspidalRepresentation.multiplicity`, `.kFinite` and the tests `cuspidalRep_*`:
-- recorded in the packet.

end AF3

/-- `AF.3/sl2-generation` (i): `SL₂(k)` is generated by the upper unipotent subgroup and any element
outside the Borel subgroup. -/
theorem SL2.closure_unipotent_eq_top (k : Type*) [Field k]
    (g : Matrix.SpecialLinearGroup (Fin 2) k) (hg : (g : Matrix (Fin 2) (Fin 2) k) 1 0 ≠ 0) :
    Subgroup.closure ({g} ∪ {n | (n : Matrix (Fin 2) (Fin 2) k) 1 0 = 0 ∧
      (n : Matrix (Fin 2) (Fin 2) k) 0 0 = 1 ∧ (n : Matrix (Fin 2) (Fin 2) k) 1 1 = 1}) = ⊤ := sorry

-- `Automorphic.SL2.eq_const_of_fourierCoeff_eq_zero` (`AF.3/sl2-fourier-vanishing`): not prototyped
-- (needs `SL₂(𝔸_{F_0})` and Fourier coefficients along `N(F_0) \ N(𝔸_{F_0})`).

/-- The point `(az + b)/d` of the upper half-plane for `a, d > 0`. -/
def heckePoint (a b d : ℤ) (ha : 0 < a) (hd : 0 < d) (z : UpperHalfPlane) : UpperHalfPlane :=
  ⟨(a * (z : ℂ) + b) / d, sorry⟩

/-- `Automorphic.MaassCuspForm.heckeOperator`: `T_m f(z) = m^{−1/2} Σ_{ad = m} Σ_{b mod d}
f((az + b)/d)` on functions on the upper half-plane. -/
def MaassCuspForm.heckeOperator (m : ℕ) (hm : 0 < m) (f : UpperHalfPlane → ℂ) :
    UpperHalfPlane → ℂ := fun z =>
  ((m : ℂ) ^ (-(1 / 2 : ℂ))) * ∑ d ∈ m.divisors, ∑ b ∈ Finset.range d,
    if h : 0 < d ∧ 0 < m / d then
      f (heckePoint (m / d : ℕ) b d (by exact_mod_cast h.2) (by exact_mod_cast h.1) z)
    else 0

/-- `AF.3/maass-cusp-forms`, `Automorphic.MaassCuspForm`: level-one Maass cusp forms (the Laplace
eigenvalue condition is part of the implementation; the invariance and cuspidality are stated). -/
structure MaassCuspForm where
  f : UpperHalfPlane → ℂ
  invariant : ∀ (γ : Matrix.SpecialLinearGroup (Fin 2) ℤ) (z : UpperHalfPlane),
    f ((Matrix.SpecialLinearGroup.mapGL ℝ γ) • z) = f z
  eigenvalue : ℝ
  constantTerm_zero : ∀ y : ℝ, (hy : 0 < y) →
    ∫ x in (0 : ℝ)..1, f ⟨(x : ℂ) + y * Complex.I, by simpa using hy⟩ = 0

/-- `Automorphic.MaassCuspForm.hecke_mul`: `T_m T_n = Σ_{d | (m,n)} T_{mn/d²}` on
`SL₂(ℤ)`-invariant functions. -/
theorem MaassCuspForm.hecke_mul (F : MaassCuspForm) (m n : ℕ) (hm : 0 < m) (hn : 0 < n) :
    MaassCuspForm.heckeOperator m hm (MaassCuspForm.heckeOperator n hn F.f) =
      ∑ d ∈ (Nat.gcd m n).divisors, if h : 0 < m * n / d ^ 2 then
        MaassCuspForm.heckeOperator (m * n / d ^ 2) h F.f else 0 := sorry

-- test: maass_hecke_mul_prime
example (F : MaassCuspForm) (p : ℕ) (hp : p.Prime) :
    MaassCuspForm.heckeOperator p hp.pos (MaassCuspForm.heckeOperator p hp.pos F.f) =
      MaassCuspForm.heckeOperator (p ^ 2) (pow_pos hp.pos 2) F.f +
        MaassCuspForm.heckeOperator 1 one_pos F.f := sorry

-- `Automorphic.MaassCuspForm.hecke_selfAdjoint`, `.fourierCoeff_neg`, `.toAdelic` and the tests
-- `maass_eigenvalue_third`, `maass_constant_not`, `maass_norm_not_one`: recorded in the packet
-- (Petersson inner product, K-Bessel expansions and adelization are part of the implementation).

end Automorphic

/-! ## AF.4 Algebraic weights and rational structures -/

namespace Automorphic

/-- `AF.4/algebraic-weight`, `Automorphic.AlgebraicWeight`: algebraic weights of `Res_{F/ℚ} GL_n`,
one weight `λ_σ ∈ ℤⁿ` for each of the `d` embeddings `σ : F → ℂ`. -/
abbrev AlgebraicWeight (n d : ℕ) := Fin d → Fin n → ℤ

namespace AlgebraicWeight

variable {n d : ℕ}

/-- `Automorphic.AlgebraicWeight.IsDominant`: `λ_{σ,1} ≥ … ≥ λ_{σ,n}` for the upper triangular
Borel. -/
def IsDominant (lam : AlgebraicWeight n d) : Prop := ∀ σ, Antitone (lam σ)

/-- The parameter `λ_σ + ρ` (with `ρ = ((n−1)/2, …, (1−n)/2)`), in `ℚⁿ`. -/
def shift (lam : AlgebraicWeight n d) (σ : Fin d) (i : Fin n) : ℚ :=
  lam σ i + ((n - 1 : ℚ) / 2 - i)

/-- `Automorphic.AlgebraicWeight.IsRegular`: `λ_σ + ρ` regular (pairwise distinct entries). -/
def IsRegular (lam : AlgebraicWeight n d) : Prop := ∀ σ, Function.Injective (shift lam σ)

/-- `Automorphic.AlgebraicWeight.rep_dual` (on weights): `−w₀λ`. -/
def dual (lam : AlgebraicWeight n d) : AlgebraicWeight n d := fun σ i => -lam σ (Fin.rev i)

theorem rep_dual (lam : AlgebraicWeight n d) (h : IsDominant lam) : IsDominant (dual lam) := by
  intro σ i j hij
  simp only [dual, neg_le_neg_iff]
  exact h σ (Fin.rev_le_rev.mpr hij)

theorem dual_dual (lam : AlgebraicWeight n d) : dual (dual lam) = lam := by
  funext σ i; simp [dual]

-- test: algWeight_dual_gl3
example : dual (fun _ : Fin 1 => ![2, 1, 0] : AlgebraicWeight 3 1) = fun _ => ![0, -1, -2] := by
  funext σ i; fin_cases i <;> rfl

-- test: algWeight_not_nondominant
example : ¬ IsDominant (fun _ : Fin 1 => ![0, 1] : AlgebraicWeight 2 1) := by
  intro h
  have := h 0 (show (0 : Fin 2) ≤ 1 by decide)
  simp at this

-- test: algWeight_zero
example : IsDominant (0 : AlgebraicWeight n d) := fun _ _ _ _ => le_rfl

-- `Automorphic.AlgebraicWeight.rep`, `.rep_highestWeight` and the test `algWeight_gl2_dim`
-- (`dim V_{(k−2,0)} = k − 1`) need the highest-weight representations of `GL_n` (Tau Ceti
-- ClassicalGroups Layer 3, not in the Mathlib-only build); not prototyped here.

/-- `AF.4/infinitesimal-character-of-weight`, `Automorphic.AlgebraicWeight.infChar_rep`: dominant
weights with the same infinitesimal character (the same multiset of entries of `λ_σ + ρ` for every
`σ`) are equal. -/
theorem infChar_rep (lam mu : AlgebraicWeight n d) (hl : IsDominant lam) (hm : IsDominant mu)
    (h : ∀ σ, (Finset.univ.val.map (shift lam σ)) = (Finset.univ.val.map (shift mu σ))) :
    lam = mu := sorry

end AlgebraicWeight

/-- `AF.4/c-l-algebraic`, `Automorphic.IsLAlgebraic`: the infinitesimal character parameters
`μ_{σ,i}` (eigenvalues, for `GL_n`) are integers. -/
def IsLAlgebraic {n d : ℕ} (μ : Fin d → Fin n → ℂ) : Prop := ∀ σ i, ∃ m : ℤ, μ σ i = m

/-- `Automorphic.IsCAlgebraic`: the parameters lie in `ρ + ℤⁿ`, i.e. `μ_{σ,i} − (n−1)/2 ∈ ℤ`. -/
def IsCAlgebraic {n d : ℕ} (μ : Fin d → Fin n → ℂ) : Prop :=
  ∀ σ i, ∃ m : ℤ, μ σ i - ((n : ℂ) - 1) / 2 = m

/-- `Automorphic.isCAlgebraic_iff_isLAlgebraic_twist`: the half-root twist by `|det|^{(n−1)/2}`. -/
theorem isCAlgebraic_iff_isLAlgebraic_twist {n d : ℕ} (μ : Fin d → Fin n → ℂ) :
    IsCAlgebraic μ ↔ IsLAlgebraic (fun σ i => μ σ i - ((n : ℂ) - 1) / 2) := Iff.rfl

/-- `Automorphic.isLAlgebraic_iff_of_rho_integral`: for `n` odd (`ρ` integral) the notions agree. -/
theorem isLAlgebraic_iff_of_rho_integral {n d : ℕ} (hn : Odd n) (μ : Fin d → Fin n → ℂ) :
    IsLAlgebraic μ ↔ IsCAlgebraic μ := sorry

/-- `Automorphic.IsAlgebraicCT_compat`: Chenevier–Taïbi's algebraicity (eigenvalues in `½ℤ` with
integral differences) is C- or L-algebraicity up to a central twist. -/
theorem IsAlgebraicCT_compat {n : ℕ} (μ : Fin 1 → Fin n → ℂ)
    (hCT : (∀ i, ∃ m : ℤ, 2 * μ 0 i = m) ∧ ∀ i j, ∃ m : ℤ, μ 0 i - μ 0 j = m) :
    ∃ w : ℂ, IsLAlgebraic (fun σ i => μ σ i - w) := sorry

-- test: algebraic_trivial_gl2: `(1/2, −1/2)` is C-algebraic and not L-algebraic.
example : IsCAlgebraic (fun _ : Fin 1 => ![(1 / 2 : ℂ), -1 / 2]) ∧
    ¬ IsLAlgebraic (fun _ : Fin 1 => ![(1 / 2 : ℂ), -1 / 2]) := sorry

-- test: algebraic_maass_not: `(ir, −ir)` with `r > 0` is neither.
example (r : ℝ) (hr : 0 < r) :
    ¬ IsLAlgebraic (fun _ : Fin 1 => ![(r : ℂ) * Complex.I, -(r : ℂ) * Complex.I]) ∧
      ¬ IsCAlgebraic (fun _ : Fin 1 => ![(r : ℂ) * Complex.I, -(r : ℂ) * Complex.I]) := sorry

-- tests algebraic_gl1, algebraic_sl2_rho_integral: recorded in the packet.

section Cohomological

open RelativeLieCohomology RealReductive

variable {𝔮 : Type*} [LieRing 𝔮] [LieAlgebra ℂ 𝔮] {K : Type*} [Group K] [TopologicalSpace K]
  [IsTopologicalGroup K] {P : Pair 𝔮 K} {V : Type*} [AddCommGroup V] [Module ℂ V]
  [LieRingModule 𝔮 V] [LieModule ℂ 𝔮 V]

/-- `AF.4/cohomological-representation`, `Automorphic.IsCohomological`: some relative Lie algebra
cohomology of `π ⊗ F` is nonzero, for a finite-dimensional `(𝔮, K)`-module `F`. -/
def IsCohomological (M : GKModule V P) : Prop :=
  ∃ (F : Type) (_ : AddCommGroup F) (_ : Module ℂ F) (_ : LieRingModule 𝔮 F) (_ : LieModule ℂ 𝔮 F)
    (_ : FiniteDimensional ℂ F) (N : GKModule F P) (q : ℕ),
      Nontrivial (cohomology P (M.tensorFinite N) q)

/-- `AF.4/wigner-lemma`: if `H^q(𝔮, K; V ⊗ F) ≠ 0`, the infinitesimal characters of `V` and `F^∨`
agree (stated: `V` has infinitesimal character `χ`, `F` has `χ_F`, and `χ` is the character of the
dual of `F`, expressed through the principal anti-automorphism of `U(𝔮)`). -/
theorem infChar_eq_of_relativeCohomology_ne_zero (M : GKModule V P) {F : Type*} [AddCommGroup F]
    [Module ℂ F] [LieRingModule 𝔮 F] [LieModule ℂ 𝔮 F] [FiniteDimensional ℂ F] (N : GKModule F P)
    (χ χF : InfChar (𝔮 := 𝔮)) (hV : HasInfChar (V := V) χ) (hF : HasInfChar (V := F) χF) (q : ℕ)
    (h : Nontrivial (cohomology P (M.tensorFinite N) q))
    (antipode : Z 𝔮 →ₐ[ℂ] Z 𝔮) : ∀ z, χ z = χF (antipode z) := sorry

/-- `Automorphic.IsCohomological.infChar`: a cohomological irreducible module has an infinitesimal
character, that of the dual of its coefficient. -/
theorem IsCohomological.infChar [CompactSpace K] (M : GKModule V P) (hM : IsCohomological M)
    (hirr : IsIrreducible M) : ∃ χ : InfChar (𝔮 := 𝔮), HasInfChar (V := V) χ := sorry

/-- `Automorphic.IsCohomological.twist`: twisting by a one-dimensional module preserves being
cohomological. -/
theorem IsCohomological.twist (M : GKModule V P) (hM : IsCohomological M) {L : Type*}
    [AddCommGroup L] [Module ℂ L] [LieRingModule 𝔮 L] [LieModule ℂ 𝔮 L] [FiniteDimensional ℂ L]
    (hL : Module.finrank ℂ L = 1) (N : GKModule L P) : IsCohomological (M.tensorFinite N) := sorry

-- `Automorphic.IsCohomological.coefficient` and the tests `cohomological_*`: recorded in the packet.

end Cohomological

/-- `AF.4/l0-q0-invariants`, `Automorphic.ell0`: `ℓ₀ = rank G_∞ − rank K_∞ − rank A_∞`. -/
def ell0 (rankG rankK rankA : ℕ) : ℤ := rankG - rankK - rankA

/-- `Automorphic.q0`: `q₀ = (dim X − ℓ₀)/2`. -/
def q0 (dimX : ℕ) (l0 : ℤ) : ℤ := (dimX - l0) / 2

/-- `Automorphic.ell0_resPGL`: `ℓ₀(Res_{F/ℚ} PGL_n)` for a field of signature `(r₁, r₂)`. -/
def ell0_resPGL (r1 r2 n : ℕ) : ℤ := r1 * ((n - 1 : ℕ) / 2 : ℕ) + r2 * (n - 1 : ℕ)

/-- `dim` of the symmetric space of `Res_{F/ℚ} PGL_n`. -/
def dimX_resPGL (r1 r2 n : ℕ) : ℕ := r1 * (n ^ 2 - 1 - n * (n - 1) / 2) + r2 * (n ^ 2 - 1)

/-- `Automorphic.ell0_PGL2`: `ℓ₀(Res_{H/ℚ} PGL₂) = r₂(H)`. -/
theorem ell0_PGL2 (r1 r2 : ℕ) : ell0_resPGL r1 r2 2 = r2 := by simp [ell0_resPGL]

/-- `Automorphic.two_q0_add_ell0`: `2q₀ + ℓ₀ = dim X` (the parity is right). -/
theorem two_q0_add_ell0 (r1 r2 n : ℕ) (hn : 1 ≤ n) :
    2 * q0 (dimX_resPGL r1 r2 n) (ell0_resPGL r1 r2 n) + ell0_resPGL r1 r2 n =
      dimX_resPGL r1 r2 n := sorry

-- test: ell0_PGL2_Q
example : ell0_resPGL 1 0 2 = 0 ∧ q0 (dimX_resPGL 1 0 2) (ell0_resPGL 1 0 2) = 1 := by decide

-- test: ell0_imag_quad
example : ell0_resPGL 0 1 2 = 1 ∧ q0 (dimX_resPGL 0 1 2) (ell0_resPGL 0 1 2) = 1 := by decide

-- test: ell0_compact
example : ell0 1 1 0 = 0 := by decide

-- test: ell0_not_split_rank: with the ℝ-split rank of `SL₂(ℂ)` (= 1) in place of its absolute rank
-- as a real group (= 2) one gets `0`, not `ℓ₀ = 1`.
example : ell0 1 1 0 ≠ ell0 2 1 0 := by decide

-- `Automorphic.relativeCohomology_tempered_range` (`AF.4/borel-wallach-tempered-range`),
-- `Automorphic.voganZuckerman`, `Automorphic.GLn.temperedCohomological` and
-- `Automorphic.clozelPurity`: not prototyped (temperedness of `(𝔤, K)`-modules, θ-stable parabolics
-- and Langlands parameters are not set up in this file).

namespace Hermitian

/-- Roots of `GSp₄(ℝ)` for the compact Cartan, in the coordinates `(a, b; c)` of Calegari–Geraghty. -/
def gsp4_roots : Finset (ℤ × ℤ × ℤ) :=
  {(2, 0, 0), (-2, 0, 0), (0, 2, 0), (0, -2, 0), (1, 1, 0), (-1, -1, 0), (1, -1, 0), (-1, 1, 0)}

/-- `Automorphic.Hermitian.compactRoots` (for `GSp₄(ℝ)`). -/
def compactRoots : Finset (ℤ × ℤ × ℤ) := {(1, -1, 0), (-1, 1, 0)}

/-- `Automorphic.Hermitian.noncompactRoots`. -/
def noncompactRoots : Finset (ℤ × ℤ × ℤ) := gsp4_roots \ compactRoots

/-- The roots of `𝔭⁺`. -/
def pPlusRoots : Finset (ℤ × ℤ × ℤ) := {(0, 2, 0), (1, 1, 0), (2, 0, 0)}

/-- Pairing of a root with a cocharacter-type vector. -/
def pair (α x : ℤ × ℤ × ℤ) : ℤ := α.1 * x.1 + α.2.1 * x.2.1 + α.2.2 * x.2.2

/-- `Automorphic.Hermitian.IsHCPositive`: `S` is the positive system of a regular `x` and its
noncompact part is the set of roots of `𝔭⁺`. -/
def IsHCPositive (S : Finset (ℤ × ℤ × ℤ)) : Prop :=
  ∃ x : ℤ × ℤ × ℤ, (∀ α ∈ gsp4_roots, pair α x ≠ 0) ∧ S = gsp4_roots.filter (fun α => 0 < pair α x) ∧
    S ∩ noncompactRoots = pPlusRoots

-- test: hermitian_gsp4_count
example : compactRoots.card = 2 ∧ pPlusRoots.card = 3 := by decide

-- test: hermitian_choice_not_forced: both compact roots can be declared positive.
example : IsHCPositive (pPlusRoots ∪ {(1, -1, 0)}) ∧ IsHCPositive (pPlusRoots ∪ {(-1, 1, 0)}) :=
  ⟨⟨(2, 1, 0), by decide, by decide, by decide⟩, ⟨(1, 2, 0), by decide, by decide, by decide⟩⟩

-- `Automorphic.Hermitian.hodgeParabolic` is `RelativeLieCohomology.Pair.ofSubalgebra` applied to
-- `𝔨_ℂ ⊕ 𝔭⁻`; `Automorphic.Hermitian.gsp4_roots` is above. Tests `hermitian_sl2`,
-- `hermitian_pilloni_compat`: recorded in the packet.

end Hermitian

/-- `AF.4/coherent-relative-cohomology`, `Automorphic.coherentCohomology`: `(𝔭_h, K)`-cohomology is
the relative Lie algebra cohomology of the pair `(𝔭_h, K)`. -/
abbrev coherentCohomology {𝔭 : Type*} [LieRing 𝔭] [LieAlgebra ℂ 𝔭] {K : Type*} [Group K]
    [TopologicalSpace K] [IsTopologicalGroup K] (P : RelativeLieCohomology.Pair 𝔭 K) {W : Type*}
    [AddCommGroup W] [Module ℂ W] [LieRingModule 𝔭 W] [LieModule ℂ 𝔭 W]
    (M : RelativeLieCohomology.GKModule W P) (q : ℕ) : Type _ :=
  RelativeLieCohomology.cohomology P M q

-- `Automorphic.coherentCohomology_eq` is `RelativeLieCohomology.cochains_eq_hom` for the pair
-- `(𝔭_h, K)`; `coherentCohomology_L2`, `coherentCohomology_cusp_to_L2` and the tests
-- `coherent_*` need `A_{(2)}(G)` (AutomorphicSpectralTheory AS.4): recorded in the packet.

namespace GSp4

/-- `Automorphic.GSp4.chamber`: the chambers `C₀, …, C₃` in the `(a, b)` coordinates. -/
def chamber : Fin 4 → Set (ℚ × ℚ)
  | 0 => {x | x.1 ≥ x.2 ∧ x.2 ≥ 0}
  | 1 => {x | x.1 ≥ -x.2 ∧ -x.2 ≥ 0}
  | 2 => {x | -x.2 ≥ x.1 ∧ x.1 ≥ 0}
  | 3 => {x | -x.2 ≥ -x.1 ∧ -x.1 ≥ 0}

/-- Interior of a chamber. -/
def chamberInterior : Fin 4 → Set (ℚ × ℚ)
  | 0 => {x | x.1 > x.2 ∧ x.2 > 0}
  | 1 => {x | x.1 > -x.2 ∧ -x.2 > 0}
  | 2 => {x | -x.2 > x.1 ∧ x.1 > 0}
  | 3 => {x | -x.2 > -x.1 ∧ -x.1 > 0}

/-- `Automorphic.GSp4.IsRegularWeight` (Definition 5.7): `(a − 1, b − 2)` lies in the interior of a
unique chamber. -/
def IsRegularWeight (a b : ℤ) : Prop :=
  ∃! i : Fin 4, ((a - 1 : ℚ), (b - 2 : ℚ)) ∈ chamberInterior i

/-- `Automorphic.GSp4.IsLimitWeight` (Definition 5.7): `(a − 1, b − 2)` lies in exactly two chambers. -/
def IsLimitWeight (a b : ℤ) : Prop :=
  ∃ i j : Fin 4, i ≠ j ∧ ∀ l, ((a - 1 : ℚ), (b - 2 : ℚ)) ∈ chamber l ↔ (l = i ∨ l = j)

/-- `Automorphic.GSp4.limitWeight_families`: the three families of limit of discrete series weights
among dominant `a ≥ b`. -/
theorem limitWeight_families (a b : ℤ) (hab : a ≥ b) :
    IsLimitWeight a b ↔ (b = 2 ∧ a ≥ 2) ∨ (b = 3 - a ∧ a ≥ 2) ∨ (a = 1 ∧ b ≤ 1) := sorry

/-- Pilloni's cohomological weight condition (footnote 5). -/
def IsCohomologicalWeight (k r : ℤ) : Prop := r ≠ 2 ∧ k + r ≠ 1 ∧ k + 2 * r ≠ 3

-- test: gsp4_chambers_union
example (x : ℚ × ℚ) : (∃ i, x ∈ chamber i) ↔ x.1 ≥ x.2 := sorry

-- test: gsp4_limit_family
example (a : ℤ) (ha : 2 ≤ a) : ((a - 1 : ℚ), ((2 : ℤ) - 2 : ℚ)) ∈ chamber 0 ∩ chamber 1 := by
  constructor
  · show _ ∧ _
    constructor <;> push_cast <;> linarith [(show (2 : ℚ) ≤ a by exact_mod_cast ha)]
  · show _ ∧ _
    constructor <;> push_cast <;> linarith [(show (2 : ℚ) ≤ a by exact_mod_cast ha)]

-- test: gsp4_cohomological_weight
example : ¬ IsCohomologicalWeight 0 2 ∧ IsCohomologicalWeight 3 3 := by
  unfold IsCohomologicalWeight; decide

-- `Automorphic.GSp4.dsRep`, `.dsRep_dual`, `.holomorphicLimit`, the theorems
-- `Automorphic.coherentCohomology_discreteSeries`,
-- `Automorphic.isDiscreteSeries_of_coherentCohomology_ne_zero`,
-- `Automorphic.GSp4.coherent_classification_largeWeight`, `Automorphic.GSp2g.limitDiscreteSeries`,
-- `Automorphic.holomorphicDiscreteSeries_minimalKType` and the test `gsp4_compact_wall_not` need the
-- discrete series of `GSp₄(ℝ)` as `(𝔤, K)`-modules: not prototyped here.

end GSp4

/-- `AF.4/coefficient-lattices`, `Automorphic.StableLattice`: `ℤ_p`-lattices in `ℚ_pⁿ` stable under a
subgroup `J ≤ GL_n(ℚ_p)` (the local component at `p` of a `J_f`-stable lattice). -/
def StableLattice (p : ℕ) [Fact p.Prime] (n : ℕ) (J : Subgroup (GL (Fin n) ℚ_[p])) :
    Set (Submodule ℤ_[p] (Fin n → ℚ_[p])) :=
  {L | L.FG ∧ Submodule.span ℚ_[p] (L : Set (Fin n → ℚ_[p])) = ⊤ ∧
    ∀ g ∈ J, ∀ v ∈ L, (g : Matrix (Fin n) (Fin n) ℚ_[p]).mulVec v ∈ L}

namespace StableLattice

variable (p : ℕ) [Fact p.Prime] (n : ℕ)

/-- `Automorphic.StableLattice.exists`: a compact subgroup stabilises some lattice. -/
theorem «exists» (J : Subgroup (GL (Fin n) ℚ_[p])) (hJ : IsCompact (J : Set (GL (Fin n) ℚ_[p]))) :
    (StableLattice p n J).Nonempty := sorry

/-- `Automorphic.StableLattice.eq_localization`: two stable lattices are commensurable, hence agree
after inverting `p` (globally: after inverting finitely many primes). -/
theorem eq_localization (J : Subgroup (GL (Fin n) ℚ_[p])) {L L' : Submodule ℤ_[p] (Fin n → ℚ_[p])}
    (hL : L ∈ StableLattice p n J) (hL' : L' ∈ StableLattice p n J) :
    ∃ m : ℕ, (∀ v ∈ L, ((p : ℤ_[p]) ^ m) • v ∈ L') ∧ ∀ v ∈ L', ((p : ℤ_[p]) ^ m) • v ∈ L := sorry

/-- `Automorphic.StableLattice.map`: `gL` is stable under `gJg⁻¹`. -/
theorem map (J : Subgroup (GL (Fin n) ℚ_[p])) (g : GL (Fin n) ℚ_[p])
    {L : Submodule ℤ_[p] (Fin n → ℚ_[p])} (hL : L ∈ StableLattice p n J) :
    L.map ((Matrix.toLin' (g : Matrix (Fin n) (Fin n) ℚ_[p])).restrictScalars ℤ_[p]) ∈
      StableLattice p n (J.map (MulAut.conj g).toMonoidHom) := sorry

-- test: lattice_not_unique
example (J : Subgroup (GL (Fin n) ℚ_[p])) {L : Submodule ℤ_[p] (Fin n → ℚ_[p])}
    (hL : L ∈ StableLattice p n J) :
    L.map ((p : ℤ_[p]) • LinearMap.id) ∈ StableLattice p n J := sorry

-- `Automorphic.StableLattice.reduction` and the tests `lattice_trivial`, `lattice_sym2`,
-- `lattice_chevalley_compat`: recorded in the packet.

end StableLattice

/-- `Automorphic.galoisTwist`: `ρ^τ` for `τ ∈ Aut(ℂ)` acting on matrix entries. -/
def galoisTwist {G : Type*} [Group G] {n : ℕ} (τ : ℂ ≃ₐ[ℚ] ℂ) (ρ : G →* GL (Fin n) ℂ) :
    G →* GL (Fin n) ℂ :=
  (Matrix.GeneralLinearGroup.map (τ : ℂ →+* ℂ)).comp ρ

/-- The stabiliser `{τ : ρ^τ ≅ ρ}`. -/
def twistStabilizer {G : Type*} [Group G] {n : ℕ} (ρ : G →* GL (Fin n) ℂ) : Subgroup (ℂ ≃ₐ[ℚ] ℂ) where
  carrier := {τ | ∃ A : GL (Fin n) ℂ, ∀ g, galoisTwist τ ρ g = A * ρ g * A⁻¹}
  mul_mem' := sorry
  one_mem' := sorry
  inv_mem' := sorry

/-- `AF.4/rationality-field`, `Automorphic.rationalityField`: `ℚ(ρ)`, the fixed field of the
stabiliser of the isomorphism class (for the finite-dimensional `K_f`-fixed parts of `π^∞`). -/
def rationalityField {G : Type*} [Group G] {n : ℕ} (ρ : G →* GL (Fin n) ℂ) : IntermediateField ℚ ℂ :=
  IntermediateField.fixedField (twistStabilizer ρ)

/-- `Automorphic.IsFieldOfDefinition`: `ρ` is conjugate to a representation with entries in `E`. -/
def IsFieldOfDefinition {G : Type*} [Group G] {n : ℕ} (E : IntermediateField ℚ ℂ)
    (ρ : G →* GL (Fin n) ℂ) : Prop :=
  ∃ A : GL (Fin n) ℂ, ∀ g i j, ((A * ρ g * A⁻¹ : GL (Fin n) ℂ) : Matrix (Fin n) (Fin n) ℂ) i j ∈ E

/-- `Automorphic.rationalityField_le`: every field of definition contains `ℚ(ρ)`. -/
theorem rationalityField_le {G : Type*} [Group G] {n : ℕ} (E : IntermediateField ℚ ℂ)
    (ρ : G →* GL (Fin n) ℂ) (hE : IsFieldOfDefinition E ρ) : rationalityField ρ ≤ E := sorry

-- test: rationality_trivial
example {G : Type*} [Group G] (n : ℕ) : IsFieldOfDefinition ⊥ (1 : G →* GL (Fin n) ℂ) := sorry

-- tests `rationality_gl1_finite_order`, `rationality_not_definition`,
-- `rationality_modularForms_compat`: recorded in the packet. `Automorphic.clozelRationality`
-- (`AF.4/clozel-rationality`) needs the Betti cohomology of locally symmetric spaces
-- (ArithmeticLocallySymmetricSpaces ALS.1-ALS.5): not prototyped.

/-- `AF.4/torsion-hecke-eigenclasses`, `Automorphic.TorsionEigenSystem`: a nonzero class `c` in a
module `H` (integral or torsion cohomology) over the Hecke algebra `T`, on which `T` acts through a
ring homomorphism to `Λ = O/λ^m`. -/
structure TorsionEigenSystem (T : Type*) [CommRing T] (H : Type*) [AddCommGroup H] [Module T H]
    (Λ : Type*) [CommRing Λ] [Module Λ H] where
  sys : T →+* Λ
  c : H
  ne_zero : c ≠ 0
  eigen : ∀ t : T, t • c = sys t • c

/-- `Automorphic.TorsionEigenSystem.maximalIdeal`: for `Λ` a field, the kernel is a maximal ideal. -/
theorem TorsionEigenSystem.maximalIdeal {T H Λ : Type*} [CommRing T] [AddCommGroup H] [Module T H]
    [Field Λ] [Module Λ H] (e : TorsionEigenSystem T H Λ) (hsurj : Function.Surjective e.sys) :
    (RingHom.ker e.sys).IsMaximal := RingHom.ker_isMaximal_of_surjective e.sys hsurj

-- `Automorphic.TorsionEigenSystem.of_char_zero`, `.lattice_indep` and the tests `torsion_*`:
-- recorded in the packet (they need the integral cohomology of ALS.1/ALS.3).

/-! ## AF.5 Comparison examples and transport -/

namespace GL2

open UpperHalfPlane

/-- `AF.5/gl2-classical-to-adelic` (archimedean part), `Automorphic.GL2.adelize`:
`φ_f(g) = det(g)^{k/2} j(g, i)^{−k} f(g·i)` for `g ∈ GL₂(ℝ)` with `det g > 0`. -/
def adelize (k : ℤ) (f : ℍ → ℂ) (g : GL (Fin 2) ℝ) : ℂ :=
  ((g.det.val : ℝ) : ℂ) ^ ((k : ℂ) / 2) * (denom g (Complex.I)) ^ (-k) * f (g • I)

/-- The rotation `r_θ ∈ SO(2)`. -/
def rot (θ : ℝ) : GL (Fin 2) ℝ :=
  ⟨!![Real.cos θ, -Real.sin θ; Real.sin θ, Real.cos θ],
    !![Real.cos θ, Real.sin θ; -Real.sin θ, Real.cos θ], sorry, sorry⟩

/-- `Automorphic.GL2.adelize_weight`: `φ_f(g r_θ) = e^{ikθ} φ_f(g)`. -/
theorem adelize_weight (k : ℤ) (f : ℍ → ℂ) (g : GL (Fin 2) ℝ) (θ : ℝ) :
    adelize k f (g * rot θ) = Complex.exp (k * θ * Complex.I) * adelize k f g := sorry

/-- `Automorphic.GL2.adelize_injective`: `f ↦ φ_f` is injective. -/
theorem adelize_injective (k : ℤ) : Function.Injective (adelize k) := sorry

/-- `Automorphic.GL2.adelize_slash_compat`: comparison with Mathlib's slash action `f ∣[k] g`. -/
theorem adelize_slash_compat (k : ℤ) (f : ℍ → ℂ) (g : GL (Fin 2) ℝ) (hg : 0 < g.det.val) :
    adelize k f g = ((g.det.val : ℝ) : ℂ) ^ ((k : ℂ) / 2 - (k - 1)) *
      (SlashAction.map k g f) I := sorry

-- test: adelize_zero
example (k : ℤ) : adelize k 0 = 0 := by
  funext g; simp [adelize]

-- `Automorphic.GL2.adelize_left`, `.adelize_level`, `.adelize_central` (need `GL₂(𝔸_ℚ)` and strong
-- approximation, AdelicAlgebraicGroups AA.5), `Automorphic.GL2.modularFormEquiv`
-- (`AF.5/gl2-dictionary`), `Automorphic.GL2.hecke_adelize` (`AF.5/gl2-hecke-normalisation`) and
-- the tests `adelize_Delta_level`, `adelize_weight_sign`, `adelize_slash_mathlib`: recorded in the
-- packet. `Automorphic.GL1.automorphicRepresentationEquiv` (`AF.5/gl1-dictionary`) needs the Hecke
-- character carrier of Tau Ceti GlobalNumberFields Layer 9: not prototyped.

end GL2

section AlgebraicModularForms

variable {GQ Gf : Type*} [Group GQ] [Group Gf] (ι : GQ →* Gf) {A : Type*} [CommRing A]
  {M : Type*} [AddCommGroup M] [Module A M] (σ : Representation A GQ M)

/-- `AF.5/algebraic-modular-forms`, `Automorphic.AlgebraicModularForm` (Gross's convention):
`f : G(𝔸_f) → M` with `f(γ g) = σ(γ) f(g)` for `γ ∈ G(F)` and `f(g u) = f(g)` for `u ∈ J`. -/
def AlgebraicModularForm (J : Subgroup Gf) : Submodule A (Gf → M) where
  carrier := {f | (∀ (γ : GQ) (g : Gf), f (ι γ * g) = σ γ (f g)) ∧ ∀ g, ∀ u ∈ J, f (g * u) = f g}
  add_mem' := sorry
  zero_mem' := sorry
  smul_mem' := sorry

/-- `Automorphic.AlgebraicModularForm.hecke`: `[J g J] f (x) = Σ_i f(x g_i)` for `J g J = ⊔ g_i J`. -/
def AlgebraicModularForm.hecke (J : Subgroup Gf) (cosets : Finset Gf) :
    AlgebraicModularForm ι σ J →ₗ[A] AlgebraicModularForm ι σ J := sorry

/-- `Automorphic.AlgebraicModularForm.res`: forms of level `J` are forms of level `J' ≤ J`. -/
theorem AlgebraicModularForm.res {J J' : Subgroup Gf} (h : J' ≤ J) :
    AlgebraicModularForm ι σ J ≤ AlgebraicModularForm ι σ J' :=
  fun _ hf => ⟨hf.1, fun g u hu => hf.2 g u (h hu)⟩

/-- `Automorphic.AlgebraicModularForm.trace`: `tr f (x) = Σ_{u ∈ J/J'} f(x u)`. -/
def AlgebraicModularForm.trace {J J' : Subgroup Gf} (h : J' ≤ J) (reps : Finset Gf) :
    AlgebraicModularForm ι σ J' →ₗ[A] AlgebraicModularForm ι σ J := sorry

/-- `Automorphic.IsSufficientlySmall` (BCGP25 Definition 5.7.2): the projection to some `G(F_v)` has
no nontrivial element of finite order. -/
def IsSufficientlySmall {Gv : Type*} [Group Gv] (J : Subgroup Gf) (proj : Gf →* Gv) : Prop :=
  ∀ g ∈ J, IsOfFinOrder (proj g) → proj g = 1

/-- `Γ_i`-invariants `M^{Γ_i}` for `Γ_i = G(F) ∩ t J t⁻¹`. -/
def fixedSub (J : Subgroup Gf) (t : Gf) : Submodule A M where
  carrier := {m | ∀ γ : GQ, ι γ ∈ J.map (MulAut.conj t).toMonoidHom → σ γ m = m}
  add_mem' := sorry
  zero_mem' := sorry
  smul_mem' := sorry

/-- `AF.5/algebraic-modular-forms-structure`, `Automorphic.AlgebraicModularForm.equivSum`:
`S(J, M) ≅ ⊕_i M^{Γ_i}` for `G(𝔸_f) = ⊔ G(F) t_i J`, `Γ_i = G(F) ∩ t_i J t_i⁻¹`. -/
theorem AlgebraicModularForm.equivSum (J : Subgroup Gf) {h : ℕ} (t : Fin h → Gf)
    (hdecomp : ∀ g : Gf, ∃! i : Fin h, ∃ γ : GQ, ∃ u ∈ J, g = ι γ * t i * u) :
    Nonempty (AlgebraicModularForm ι σ J ≃ₗ[A] ((i : Fin h) → fixedSub ι σ J (t i))) := sorry

-- test: amf_zero
example [Subsingleton M] (J : Subgroup Gf) : Subsingleton (AlgebraicModularForm ι σ J) := sorry

-- test: amf_trivial_coeff: with trivial `σ`, forms are functions constant on double cosets.
example (J : Subgroup Gf) (f : Gf → M) (hf : f ∈ AlgebraicModularForm ι (Representation.trivial A GQ M) J)
    (γ : GQ) (g : Gf) (u : Gf) (hu : u ∈ J) : f (ι γ * g * u) = f g := by
  rw [hf.2 _ u hu, hf.1 γ g]; rfl

-- `Automorphic.AlgebraicModularForm.rationalEquiv`, `.baseChange` and the tests
-- `amf_definite_quaternion`, `amf_not_small_basechange`: recorded in the packet.
-- `Automorphic.automorphicForm_resScalarsEquiv` (`AF.5/transport-compatibilities`): needs Weil
-- restriction (ReductiveGroupsPartII RG2.0a); not prototyped.

end AlgebraicModularForms

end Automorphic

end TauCeti
