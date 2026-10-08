import Mathlib.GroupTheory.DoubleCoset
import Mathlib.LinearAlgebra.TensorProduct.Tower
import Mathlib.GroupTheory.QuotientGroup.Basic
import Mathlib.LinearAlgebra.Trace
import Mathlib.Algebra.Lie.Rank
import Mathlib.RingTheory.Idempotents
import Mathlib.Analysis.Complex.UpperHalfPlane.Measure
import Mathlib.Analysis.Calculus.Deriv.Basic
import Mathlib.MeasureTheory.Function.LpSeminorm.Basic
import Mathlib.MeasureTheory.Integral.IntervalIntegral.Basic
import Mathlib.Algebra.Homology.QuasiIso
import Mathlib.RepresentationTheory.Homological.ContCohomology.Basic
import Mathlib.RepresentationTheory.Homological.ContCohomology.LowDegree
import Mathlib.Algebra.Lie.Cochain
import Mathlib.GroupTheory.Coset.Defs
import Mathlib.CategoryTheory.Abelian.Basic
import Mathlib.CategoryTheory.ObjectProperty.FullSubcategory
import Mathlib.Algebra.Category.ModuleCat.Abelian
import Mathlib.Algebra.Homology.HomologicalComplex
import Mathlib.Analysis.LocallyConvex.WithSeminorms
import Mathlib.RepresentationTheory.Continuous.Basic
import Mathlib.Geometry.Manifold.Algebra.LieGroup
import Mathlib.Geometry.Manifold.Algebra.LeftInvariantDerivation
import Mathlib.Geometry.Manifold.GroupLieAlgebra
import Mathlib.Geometry.Manifold.MFDeriv.Defs
import Mathlib.LinearAlgebra.Alternating.Basic
import Mathlib.LinearAlgebra.Quotient.Basic
import Mathlib.Geometry.Manifold.Instances.UnitsOfNormedAlgebra
import Mathlib.Analysis.Normed.Module.FiniteDimension
import Mathlib.Algebra.Lie.OfAssociative
import Mathlib.Algebra.Lie.Abelian
import Mathlib.Algebra.Lie.BaseChange
import Mathlib.Algebra.Lie.UniversalEnveloping
import Mathlib.MeasureTheory.Measure.Haar.Basic
import Mathlib.MeasureTheory.Integral.Bochner.Basic
import Mathlib.Geometry.Manifold.ContMDiff.Defs
import Mathlib.Topology.Algebra.Support
import Mathlib.Topology.Algebra.ClopenNhdofOne
import Mathlib.Analysis.SpecialFunctions.Pow.Real
import Mathlib.LinearAlgebra.PiTensorProduct.Basic
import Mathlib.Algebra.Colimit.Module
import Mathlib.RingTheory.MvPolynomial.Basic
import Mathlib.NumberTheory.Padics.PadicIntegers
import Mathlib.LinearAlgebra.Matrix.GeneralLinearGroup.Defs
import Mathlib.RepresentationTheory.Basic
import Mathlib.RingTheory.Ideal.Maps
import Mathlib.GroupTheory.OrderOfElement
import Mathlib.Data.ZMod.Basic
import Mathlib.MeasureTheory.Group.Circle
import Mathlib.RingTheory.PiTensorProduct
import Mathlib.Algebra.Exact.Basic
import Mathlib.MeasureTheory.Function.LpSpace.Basic
import Mathlib.LinearAlgebra.Finsupp.LinearCombination

/-!
# Automorphic forms on reductive groups: suggested Lean forms

This file is not the roadmap and is not exhaustive. The roadmap document
`research/blueprint/readmes/AutomorphicFormsOnReductiveGroups.md` is definitive;
these statements suggest Lean forms so contributors and reviewers can converge
on names and signatures. Proofs are `sorry`; no implementation is claimed.

Revision round 2 restores native differentiated pairs/modules, all-degree
relative and absolute Chevalley–Eilenberg complexes, continuous/smooth cochains,
closed Banach-product smooth Fréchet realizations, growth/Haar convolution,
archimedean distribution Hecke algebra, automorphic function/subquotient data,
left arithmetic quotient constant terms, Maass operators, local lattices and
coefficient-valued algebraic modular forms. The packet and reader specify each
native prototype's scope and list every omitted main, API and example name with
the exact missing supplier input. A name occurring in a comment does not count
as a declaration or a test.

The shared build provides pinned Mathlib, but not the pinned Tau Ceti modules.
Their declarations were checked in the source at the pin; their native algebraic
real-points, integrated reductive/classification, Hodge, arithmetic cohomology
and adelic/classical carriers must be imported through the recorded suppliers.
No arbitrary Prop field or chosen isomorphism replaces these missing conditions.
Distinct helper names identify the local lattice, supplied coefficient and GL2
weight model without claiming the corresponding full arithmetic classification.
Revision-2 independent review records the missing signatures as a section-13
correspondence failure. Elaborating the present prototype does not discharge it.
-/

set_option linter.unusedSectionVars false
set_option linter.unusedVariables false

noncomputable section
attribute [local instance 100] LieRing.ofAssociativeRing
open scoped Manifold ContDiff Topology TensorProduct
open Set

namespace TauCeti

instance functionSubmoduleCoeFun {X : Type*} (S : Submodule ℂ (X → ℂ)) :
    CoeFun S (fun _ => X → ℂ) := ⟨fun f => f.val⟩

/-- A type alias retaining the group parameter lost by the tangent-space abbrev. -/
def ComplexGroupLie {E : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E]
    {H : Type*} [TopologicalSpace H] (I : ModelWithCorners ℝ E H)
    (G : Type*) [Group G] [TopologicalSpace G] [ChartedSpace H G] : Type _ :=
  ℂ ⊗[ℝ] GroupLieAlgebra I G

instance {E : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E]
    [FiniteDimensional ℝ E] {H : Type*} [TopologicalSpace H]
    {I : ModelWithCorners ℝ E H} {G : Type*} [Group G] [TopologicalSpace G]
    [ChartedSpace H G] : AddCommGroup (ComplexGroupLie I G) := by
  unfold ComplexGroupLie
  infer_instance

instance {E : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E]
    [FiniteDimensional ℝ E] {H : Type*} [TopologicalSpace H]
    {I : ModelWithCorners ℝ E H} {G : Type*} [Group G] [TopologicalSpace G]
    [ChartedSpace H G] : Module ℂ (ComplexGroupLie I G) := by
  unfold ComplexGroupLie
  infer_instance

instance {E : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E]
    [FiniteDimensional ℝ E] {H : Type*} [TopologicalSpace H]
    {I : ModelWithCorners ℝ E H} {G : Type*} [Group G] [TopologicalSpace G]
    [ChartedSpace H G] [LieGroup I ∞ G] : LieRing (ComplexGroupLie I G) := by
  letI : LieGroup I (minSmoothness ℝ 3) G := LieGroup.of_le (n := ∞) (by simp)
  letI := instLieRingGroupLieAlgebra (I := I) (G := G)
  letI := instLieAlgebraGroupLieAlgebra (I := I) (G := G)
  unfold ComplexGroupLie
  infer_instance

instance {E : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E]
    [FiniteDimensional ℝ E] {H : Type*} [TopologicalSpace H]
    {I : ModelWithCorners ℝ E H} {G : Type*} [Group G] [TopologicalSpace G]
    [ChartedSpace H G] [LieGroup I ∞ G] : LieAlgebra ℂ (ComplexGroupLie I G) := by
  letI : LieGroup I (minSmoothness ℝ 3) G := LieGroup.of_le (n := ∞) (by simp)
  letI := instLieRingGroupLieAlgebra (I := I) (G := G)
  letI := instLieAlgebraGroupLieAlgebra (I := I) (G := G)
  unfold ComplexGroupLie
  infer_instance

end TauCeti

namespace TauCeti.Automorphic

section Functions

variable {Ginf Gf : Type*} [Group Ginf] [TopologicalSpace Ginf]
  [IsTopologicalGroup Ginf] [Group Gf] [TopologicalSpace Gf]
  [IsTopologicalGroup Gf] [LocallyCompactSpace Gf]
  [TotallyDisconnectedSpace Gf] [T2Space Gf]
  {E : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E]
  {H : Type*} [TopologicalSpace H]
  (I : ModelWithCorners ℝ E H) [ChartedSpace H Ginf]

def IsLevelInvariant (f : Ginf × Gf → ℂ) (J : Subgroup Gf) : Prop :=
  ∀ (g : Ginf × Gf) (j : J), f (g.1, g.2 * j) = f g

/-- Compact open level and actual C∞ archimedean slices. -/
def IsSmoothAdelic (f : Ginf × Gf → ℂ) : Prop :=
  (∃ J : Subgroup Gf, IsOpen (J : Set Gf) ∧ IsCompact (J : Set Gf) ∧
    IsLevelInvariant f J) ∧
  ∀ gf : Gf, ContMDiff I 𝓘(ℝ, ℂ) ∞ (fun x : Ginf => f (x, gf))

/-- Local profiniteness is necessary for constants and the subalgebra unit. -/
def SmoothAdelicFunction : Subalgebra ℂ (Ginf × Gf → ℂ) where
  carrier := {f | IsSmoothAdelic I f}
  mul_mem' := sorry
  add_mem' := sorry
  algebraMap_mem' := sorry

theorem SmoothAdelicFunction.exists_level {f : Ginf × Gf → ℂ}
    (hf : f ∈ SmoothAdelicFunction (Ginf := Ginf) (Gf := Gf) I) :
    ∃ J : Subgroup Gf, IsOpen (J : Set Gf) ∧ IsCompact (J : Set Gf) ∧
      IsLevelInvariant f J := sorry

def rightTranslate (y : Ginf × Gf) (f : Ginf × Gf → ℂ) : Ginf × Gf → ℂ :=
  fun g => f (g * y)

theorem SmoothAdelicFunction.rightTranslate [LieGroup I ∞ Ginf]
    {f : Ginf × Gf → ℂ} (hf : f ∈ SmoothAdelicFunction (Ginf := Ginf) (Gf := Gf) I)
    (y : Ginf × Gf) : rightTranslate y f ∈ SmoothAdelicFunction (Ginf := Ginf) (Gf := Gf) I := sorry

theorem SmoothAdelicFunction.iUnion_level (f : Ginf × Gf → ℂ) :
    f ∈ SmoothAdelicFunction (Ginf := Ginf) (Gf := Gf) I ↔
    ∃ J : Subgroup Gf, IsOpen (J : Set Gf) ∧ IsCompact (J : Set Gf) ∧
      IsLevelInvariant f J ∧
      ∀ gf : Gf, ContMDiff I 𝓘(ℝ, ℂ) ∞ (fun x : Ginf => f (x, gf)) := sorry

/-- Differentiate the right regular action along the actual left-invariant
vector field on the archimedean Lie group. -/
def SmoothAdelicFunction.derivAction [LieGroup I ∞ Ginf]
    [FiniteDimensional ℝ E]
    (X : GroupLieAlgebra I Ginf) :
    SmoothAdelicFunction (Ginf := Ginf) (Gf := Gf) I →ₗ[ℂ] SmoothAdelicFunction (Ginf := Ginf) (Gf := Gf) I where
  toFun f := ⟨fun g =>
    mfderiv I 𝓘(ℝ, ℂ) (fun x : Ginf => f.val (x, g.2)) g.1
      (mulInvariantVectorField X g.1), by sorry⟩
  map_add' := sorry
  map_smul' := sorry

theorem SmoothAdelicFunction.derivAction_bracket [LieGroup I ∞ Ginf]
    [FiniteDimensional ℝ E]
    (X Y : GroupLieAlgebra I Ginf) :
    SmoothAdelicFunction.derivAction (Ginf := Ginf) (Gf := Gf) I ⁅X, Y⁆ =
      (SmoothAdelicFunction.derivAction (Ginf := Ginf) (Gf := Gf) I X).comp
        (SmoothAdelicFunction.derivAction (Ginf := Ginf) (Gf := Gf) I Y) -
      (SmoothAdelicFunction.derivAction (Ginf := Ginf) (Gf := Gf) I Y).comp
        (SmoothAdelicFunction.derivAction (Ginf := Ginf) (Gf := Gf) I X) := sorry

-- This is the differentiated conjugation identity, written as its scalar chain
-- rule until the supplier's adjoint Lie automorphism is imported.
theorem SmoothAdelicFunction.derivAction_conj [LieGroup I ∞ Ginf]
    (y : Ginf) (f : SmoothAdelicFunction (Ginf := Ginf) (Gf := Gf) I)
    (X : TangentSpace I (1 : Ginf)) (g : Ginf × Gf) :
    mfderiv I 𝓘(ℝ, ℂ) (fun x : Ginf => f.val (g.1 * y * x * y⁻¹, g.2)) 1 X =
      mfderiv I 𝓘(ℝ, ℂ) (fun x : Ginf => f.val (g.1 * x, g.2)) 1
        (mfderiv I I (fun x : Ginf => y * x * y⁻¹) 1 X) := sorry

def SmoothAdelicFunction.complexLieAction [LieGroup I ∞ Ginf]
    [FiniteDimensional ℝ E] :
    (TauCeti.ComplexGroupLie I Ginf) →ₗ⁅ℂ⁆
      Module.End ℂ (SmoothAdelicFunction (Ginf := Ginf) (Gf := Gf) I) := sorry

theorem SmoothAdelicFunction.complexLieAction_tmul [LieGroup I ∞ Ginf]
    [FiniteDimensional ℝ E] (z : ℂ) (X : GroupLieAlgebra I Ginf) :
    SmoothAdelicFunction.complexLieAction (Ginf := Ginf) (Gf := Gf) I (z ⊗ₜ[ℝ] X) =
      z • SmoothAdelicFunction.derivAction (Ginf := Ginf) (Gf := Gf) I X := sorry

def SmoothAdelicFunction.envelopingAction [LieGroup I ∞ Ginf]
    [FiniteDimensional ℝ E] :
    UniversalEnvelopingAlgebra ℂ (TauCeti.ComplexGroupLie I Ginf) →ₐ[ℂ]
      Module.End ℂ (SmoothAdelicFunction (Ginf := Ginf) (Gf := Gf) I) :=
  UniversalEnvelopingAlgebra.lift ℂ
    (SmoothAdelicFunction.complexLieAction (Ginf := Ginf) (Gf := Gf) I)

-- test: smoothAdelicFunction_const, differentiated part
example [LieGroup I ∞ Ginf] [FiniteDimensional ℝ E]
    (c : ℂ) (X : GroupLieAlgebra I Ginf)
    (hc : (fun _ : Ginf × Gf => c) ∈ SmoothAdelicFunction I) :
    SmoothAdelicFunction.derivAction (Ginf := Ginf) (Gf := Gf) I X ⟨_, hc⟩ = 0 := sorry

-- test: smoothAdelicFunction_const
example (c : ℂ) : (fun _ : Ginf × Gf => c) ∈ SmoothAdelicFunction I := sorry

def TestFunction : Submodule ℂ (Ginf × Gf → ℂ) where
  carrier := {f | IsSmoothAdelic I f ∧ HasCompactSupport f}
  add_mem' := sorry
  zero_mem' := sorry
  smul_mem' := sorry

-- test: testFunction_zero
example : (0 : Ginf × Gf → ℂ) ∈ TestFunction (Ginf := Ginf) (Gf := Gf) I := sorry

-- Convolution below uses an actual Haar measure; the local place-indexed
-- restricted-tensor adapter requires the SR.1/AA.1 native exports.
end Functions

section FunctionSpaces

open MeasureTheory
variable {Ginf Gf : Type*} [Group Ginf] [TopologicalSpace Ginf]
  [IsTopologicalGroup Ginf] [LocallyCompactSpace Ginf] [T2Space Ginf]
  [SecondCountableTopology Ginf] [Group Gf] [TopologicalSpace Gf]
  [IsTopologicalGroup Gf] [LocallyCompactSpace Gf] [TotallyDisconnectedSpace Gf]
  [T2Space Gf] [SecondCountableTopology Gf]
  {E : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]
  {H : Type*} [TopologicalSpace H] (I : ModelWithCorners ℝ E H)
  [ChartedSpace H Ginf] [LieGroup I ∞ Ginf]

/-- The archimedean factor of the algebraic tensor decomposition. -/
def ArchTestFunction : Submodule ℂ (Ginf → ℂ) where
  carrier := {f | ContMDiff I 𝓘(ℝ, ℂ) ∞ f ∧ HasCompactSupport f}
  zero_mem' := sorry
  add_mem' := sorry
  smul_mem' := sorry

/-- Uniform compact-open level and compact support at the finite places. -/
def FiniteTestFunction : Submodule ℂ (Gf → ℂ) where
  carrier := {f | HasCompactSupport f ∧ ∃ J : Subgroup Gf,
    IsOpen (J : Set Gf) ∧ IsCompact (J : Set Gf) ∧ ∀ g (j : J), f (g * j) = f g}
  zero_mem' := sorry
  add_mem' := sorry
  smul_mem' := sorry

def TestFunction.tmulEquiv :
    (ArchTestFunction (Ginf := Ginf) I) ⊗[ℂ] (FiniteTestFunction (Gf := Gf)) ≃ₗ[ℂ] TestFunction (Ginf := Ginf) (Gf := Gf) I := sorry

theorem TestFunction.tmulEquiv_apply (a : ArchTestFunction (Ginf := Ginf) I)
    (b : FiniteTestFunction (Gf := Gf)) (g : Ginf × Gf) :
    TestFunction.tmulEquiv I (a ⊗ₜ[ℂ] b) g = a g.1 * b g.2 := sorry

variable [MeasurableSpace Ginf] [BorelSpace Ginf]
    [MeasurableSpace Gf] [BorelSpace Gf]

/-- The fixed Haar kernel, with the product group's multiplication convention. -/
def convolutionKernel (μ : Measure (Ginf × Gf))
    (f h : Ginf × Gf → ℂ) (g : Ginf × Gf) : ℂ :=
  ∫ x, f x * h (x⁻¹ * g) ∂μ

def TestFunction.convolution (μ : Measure (Ginf × Gf)) [μ.IsHaarMeasure]
    [μ.IsMulRightInvariant] : TestFunction (Ginf := Ginf) (Gf := Gf) I →ₗ[ℂ] TestFunction (Ginf := Ginf) (Gf := Gf) I →ₗ[ℂ] TestFunction (Ginf := Ginf) (Gf := Gf) I := sorry

theorem TestFunction.convolution_apply (μ : Measure (Ginf × Gf)) [μ.IsHaarMeasure]
    [μ.IsMulRightInvariant] (f h : TestFunction (Ginf := Ginf) (Gf := Gf) I) (g : Ginf × Gf) :
    TestFunction.convolution I μ f h g = convolutionKernel μ f h g := sorry

theorem TestFunction.convolution_assoc (μ : Measure (Ginf × Gf)) [μ.IsHaarMeasure]
    [μ.IsMulRightInvariant] (f h k : TestFunction (Ginf := Ginf) (Gf := Gf) I) :
    TestFunction.convolution I μ (TestFunction.convolution I μ f h) k =
      TestFunction.convolution I μ f (TestFunction.convolution I μ h k) := sorry

def FiniteTestFunction.convolution (μf : Measure Gf) [μf.IsHaarMeasure]
    [μf.IsMulRightInvariant] :
    FiniteTestFunction (Gf := Gf) →ₗ[ℂ]
      FiniteTestFunction (Gf := Gf) →ₗ[ℂ] FiniteTestFunction (Gf := Gf) := sorry

theorem FiniteTestFunction.convolution_apply (μf : Measure Gf) [μf.IsHaarMeasure]
    [μf.IsMulRightInvariant] (f h : FiniteTestFunction (Gf := Gf)) (g : Gf) :
    FiniteTestFunction.convolution μf f h g = ∫ x, f x * h (x⁻¹ * g) ∂μf := sorry

def FiniteTestFunction.idempotent (μf : Measure Gf) [μf.IsHaarMeasure]
    (J : Subgroup Gf) (hopen : IsOpen (J : Set Gf))
    (hcompact : IsCompact (J : Set Gf)) : FiniteTestFunction (Gf := Gf) := by
  classical
  exact ⟨fun g => if g ∈ J then ((μf (J : Set Gf)).toReal⁻¹ : ℂ) else 0, by sorry⟩

theorem TestFunction.unitIdempotent (μf : Measure Gf) [μf.IsHaarMeasure]
    [μf.IsMulRightInvariant] (J : Subgroup Gf) (ho : IsOpen (J : Set Gf))
    (hc : IsCompact (J : Set Gf)) :
    FiniteTestFunction.convolution μf (FiniteTestFunction.idempotent μf J ho hc)
      (FiniteTestFunction.idempotent μf J ho hc) = FiniteTestFunction.idempotent μf J ho hc := sorry

-- test: testFunction_idempotent; the normalized finite-level assertion is stronger
-- than its GL1 specialization with volume one.
example (μf : Measure Gf) [μf.IsHaarMeasure] [μf.IsMulRightInvariant]
    (J : Subgroup Gf) (ho : IsOpen (J : Set Gf)) (hc : IsCompact (J : Set Gf))
    (hvol : μf (J : Set Gf) = 1) :
    FiniteTestFunction.convolution μf (FiniteTestFunction.idempotent μf J ho hc)
      (FiniteTestFunction.idempotent μf J ho hc) = FiniteTestFunction.idempotent μf J ho hc := sorry

-- test: testFunction_zero, the support and convolution assertions.
example (f : TestFunction (Ginf := Ginf) (Gf := Gf) I) (h : Function.support f = ∅) : f = 0 := sorry
example (μ : Measure (Ginf × Gf)) [μ.IsHaarMeasure] [μ.IsMulRightInvariant]
    (f : TestFunction (Ginf := Ginf) (Gf := Gf) I) : TestFunction.convolution I μ 0 f = 0 := sorry

-- test: testFunction_no_unit; positive archimedean dimension is essential.
example (hdim : 0 < Module.finrank ℝ E)
    (μ : Measure (Ginf × Gf)) [μ.IsHaarMeasure] [μ.IsMulRightInvariant] :
    ¬∃ f : TestFunction (Ginf := Ginf) (Gf := Gf) I, ∀ h, TestFunction.convolution I μ f h = h := sorry

/-- The left regular derived action, with inverse in the argument. -/
def SmoothAdelicFunction.leftDerivAction (X : GroupLieAlgebra I Ginf) :
    SmoothAdelicFunction (Ginf := Ginf) (Gf := Gf) I →ₗ[ℂ]
      SmoothAdelicFunction (Ginf := Ginf) (Gf := Gf) I where
  toFun f := ⟨fun g => mfderiv I 𝓘(ℝ, ℂ)
    (fun x : Ginf => f.val (x⁻¹ * g.1, g.2)) 1 X, by sorry⟩
  map_add' := sorry
  map_smul' := sorry

def SmoothAdelicFunction.leftComplexLieAction :
    TauCeti.ComplexGroupLie I Ginf →ₗ⁅ℂ⁆
      Module.End ℂ (SmoothAdelicFunction (Ginf := Ginf) (Gf := Gf) I) := sorry

theorem SmoothAdelicFunction.leftComplexLieAction_tmul (z : ℂ)
    (X : GroupLieAlgebra I Ginf) :
    SmoothAdelicFunction.leftComplexLieAction (Ginf := Ginf) (Gf := Gf) I (z ⊗ₜ[ℝ] X) =
      z • SmoothAdelicFunction.leftDerivAction (Ginf := Ginf) (Gf := Gf) I X := sorry

def SmoothAdelicFunction.leftEnvelopingAction :
    UniversalEnvelopingAlgebra ℂ (TauCeti.ComplexGroupLie I Ginf) →ₐ[ℂ]
      Module.End ℂ (SmoothAdelicFunction (Ginf := Ginf) (Gf := Gf) I) :=
  UniversalEnvelopingAlgebra.lift ℂ
    (SmoothAdelicFunction.leftComplexLieAction (Ginf := Ginf) (Gf := Gf) I)

end FunctionSpaces

section Growth

variable {X : Type*}

/-- AF.0 growth predicate, with a supplied height rather than a new adelic datum.
For height ≥1, requiring C,N≥0 does not change moderate growth. -/
def HasModerateGrowth (height : X → ℝ) (f : X → ℂ) : Prop :=
  ∃ C N : ℝ, 0 ≤ C ∧ 0 ≤ N ∧ ∀ x, ‖f x‖ ≤ C * height x ^ N

theorem HasModerateGrowth.of_height (height height' : X → ℝ)
    (h1 : ∀ x, 1 ≤ height x) (h1' : ∀ x, 1 ≤ height' x)
    (hcomp : ∃ C M : ℝ, 0 < C ∧ 0 ≤ M ∧ ∀ x, height x ≤ C * height' x ^ M)
    {f : X → ℂ} (hf : HasModerateGrowth height f) :
    HasModerateGrowth height' f := sorry

theorem HasModerateGrowth.add (height : X → ℝ) (h1 : ∀ x, 1 ≤ height x)
    {f g : X → ℂ} (hf : HasModerateGrowth height f)
    (hg : HasModerateGrowth height g) : HasModerateGrowth height (f + g) := sorry

theorem HasModerateGrowth.of_bounded (height : X → ℝ) (h1 : ∀ x, 1 ≤ height x)
    {f : X → ℂ} (C : ℝ) (hC : ∀ x, ‖f x‖ ≤ C) :
    HasModerateGrowth height f := sorry

theorem HasModerateGrowth.comp_mul_right {G : Type*} [Group G]
    (height : G → ℝ) (h1 : ∀ x, 1 ≤ height x)
    (hmul : ∀ x y, height (x * y) ≤ height x * height y)
    {f : G → ℂ} (hf : HasModerateGrowth height f) (y : G) :
    HasModerateGrowth height (fun x => f (x * y)) := sorry

-- test: hasModerateGrowth_const
example (height : X → ℝ) (h1 : ∀ x, 1 ≤ height x) (c : ℂ) :
    HasModerateGrowth height (fun _ => c) := sorry

/-- The real archimedean restriction of the GL1 norm-character test.
The full adelic norm character remains to be restored with AA's height. -/
example (s : ℝ) :
    HasModerateGrowth (fun x : ℝˣ => max |(x : ℝ)| |((x⁻¹ : ℝˣ) : ℝ)|)
      (fun x : ℝˣ => ((|(x : ℝ)| ^ s : ℝ) : ℂ)) := sorry

/-- A concrete nonexample for the supplied polynomial height on ℝ. -/
example : ¬HasModerateGrowth (fun x : ℝ => 1 + |x|)
    (fun x : ℝ => (Real.exp x : ℂ)) := sorry

end Growth

section RestrictedTensors

variable {ι : Type*} [DecidableEq ι] (W : ι → Type*)
  [∀ i, AddCommGroup (W i)] [∀ i, Module ℂ (W i)] (φ0 : ∀ i, W i)

/-- Tensor with the distinguished vectors at the newly added indices. -/
def RestrictedTensor.transition (φ0 : ∀ i, W i) (S S' : Finset ι) (h : S ≤ S') :
    PiTensorProduct ℂ (fun i : S => W i) →ₗ[ℂ]
      PiTensorProduct ℂ (fun i : S' => W i) := sorry

theorem RestrictedTensor.transition_tprod (S S' : Finset ι) (h : S ≤ S')
    (v : ∀ i : S, W i) :
    RestrictedTensor.transition W φ0 S S' h (PiTensorProduct.tprod ℂ v) =
      PiTensorProduct.tprod ℂ (fun i : S' =>
        if hi : (i : ι) ∈ S then v ⟨i, hi⟩ else φ0 i) := sorry

theorem RestrictedTensor.transition_self (S : Finset ι) :
    RestrictedTensor.transition W φ0 S S le_rfl = LinearMap.id := sorry

theorem RestrictedTensor.transition_comp (S T U : Finset ι)
    (hST : S ≤ T) (hTU : T ≤ U) :
    (RestrictedTensor.transition W φ0 T U hTU).comp
      (RestrictedTensor.transition W φ0 S T hST) =
      RestrictedTensor.transition W φ0 S U (hST.trans hTU) := sorry

/-- Module colimit, not Mathlib's restricted product of points. -/
def RestrictedTensor : Type _ :=
  Module.DirectLimit (fun S : Finset ι => PiTensorProduct ℂ (fun i : S => W i))
    (RestrictedTensor.transition W φ0)

instance : AddCommGroup (RestrictedTensor W φ0) := by
  unfold RestrictedTensor; infer_instance

instance : Module ℂ (RestrictedTensor W φ0) := by
  unfold RestrictedTensor; infer_instance

def RestrictedTensor.of (S : Finset ι) :
    PiTensorProduct ℂ (fun i : S => W i) →ₗ[ℂ] RestrictedTensor W φ0 :=
  Module.DirectLimit.of ℂ (Finset ι)
    (fun S : Finset ι => PiTensorProduct ℂ (fun i : S => W i))
    (RestrictedTensor.transition W φ0) S

def RestrictedTensor.map {W' : ι → Type*} [∀ i, AddCommGroup (W' i)]
    [∀ i, Module ℂ (W' i)] (φ0' : ∀ i, W' i)
    (B : ∀ i, W i →ₗ[ℂ] W' i)
    (hB : ∃ S : Finset ι, ∀ i ∉ S, B i (φ0 i) = φ0' i) :
    RestrictedTensor W φ0 →ₗ[ℂ] RestrictedTensor W' φ0' := sorry

theorem RestrictedTensor.rescale (c : ι → ℂˣ) :
    Nonempty (RestrictedTensor W φ0 ≃ₗ[ℂ]
      RestrictedTensor W (fun i => (c i : ℂ) • φ0 i)) := sorry

-- test: restrictedTensor_finite
example [Fintype ι] :
    Nonempty (RestrictedTensor W φ0 ≃ₗ[ℂ] PiTensorProduct ℂ W) := sorry

-- test: restrictedTensor_polynomial
example : Nonempty (RestrictedTensor (fun _ : ℕ => Polynomial ℂ) (fun _ => 1)
    ≃ₗ[ℂ] MvPolynomial ℕ ℂ) := sorry

/-- The domain of the restricted pure-tensor constructor has a finite set of
exceptional coordinates. There is no constructor on arbitrary infinite families. -/
def RestrictedTensor.IsRestrictedPureFamily (w : ∀ i, W i) : Prop :=
  ∃ S : Finset ι, ∀ i ∉ S, w i = φ0 i

def RestrictedTensor.tprod (w : ∀ i, W i)
    (hw : RestrictedTensor.IsRestrictedPureFamily W φ0 w) : RestrictedTensor W φ0 :=
  RestrictedTensor.of W φ0 (Classical.choose hw)
    (PiTensorProduct.tprod ℂ (fun i => w i.val))

-- test: restrictedTensor_not_full
example (w : ∀ i, W i)
    (h : Set.Infinite {i | w i ∉ Submodule.span ℂ {φ0 i}}) :
    ¬RestrictedTensor.IsRestrictedPureFamily W φ0 w := sorry
end RestrictedTensors

section RestrictedAlgebras
variable {ι : Type*} [DecidableEq ι] (A : ι → Type*)
  [∀ i, Ring (A i)] [∀ i, Algebra ℂ (A i)] (e : ∀ i, A i)
  (he : ∀ i, e i * e i=e i)

/-- Idempotent stabilization preserves multiplication but usually not units.
The underlying additive group is the native module colimit above. -/
@[instance_reducible] def RestrictedTensor.algebra (he : ∀ i, e i * e i=e i) :
    NonUnitalRing (RestrictedTensor A e) where
  toAddCommGroup := inferInstance
  mul := sorry
  mul_assoc := sorry
  left_distrib := sorry
  right_distrib := sorry
  zero_mul := sorry
  mul_zero := sorry

theorem RestrictedTensor.algebra_mul_of (S : Finset ι)
    (x y : PiTensorProduct ℂ (fun i : S => A i)) :
    letI := RestrictedTensor.algebra A e he
    RestrictedTensor.of A e S x * RestrictedTensor.of A e S y =
      RestrictedTensor.of A e S (x*y) := sorry

theorem RestrictedTensor.algebra_mul_tprod (S : Finset ι)
    (x y : ∀ i : S, A i) :
    letI := RestrictedTensor.algebra A e he
    RestrictedTensor.of A e S (PiTensorProduct.tprod ℂ x) *
      RestrictedTensor.of A e S (PiTensorProduct.tprod ℂ y) =
      RestrictedTensor.of A e S (PiTensorProduct.tprod ℂ (fun i => x i*y i)) := sorry
end RestrictedAlgebras

/-- Local component of a coefficient lattice. -/
def LocalStableLattice (p : ℕ) [Fact p.Prime] (n : ℕ)
    (J : Subgroup (GL (Fin n) ℚ_[p])) :
    Set (Submodule ℤ_[p] (Fin n → ℚ_[p])) :=
  {L | L.FG ∧ Submodule.span ℚ_[p] (L : Set (Fin n → ℚ_[p])) = ⊤ ∧
    ∀ g ∈ J, ∀ v ∈ L, (g : Matrix (Fin n) (Fin n) ℚ_[p]).mulVec v ∈ L}

namespace LocalStableLattice
variable (p : ℕ) [Fact p.Prime] (n : ℕ)

theorem «exists» (J : Subgroup (GL (Fin n) ℚ_[p]))
    (hJ : IsCompact (J : Set (GL (Fin n) ℚ_[p]))) :
    (LocalStableLattice p n J).Nonempty := sorry

theorem eq_localization (J : Subgroup (GL (Fin n) ℚ_[p]))
    {L L' : Submodule ℤ_[p] (Fin n → ℚ_[p])}
    (hL : L ∈ LocalStableLattice p n J) (hL' : L' ∈ LocalStableLattice p n J) :
    ∃ m : ℕ, (∀ v ∈ L, ((p : ℤ_[p]) ^ m) • v ∈ L') ∧
      ∀ v ∈ L', ((p : ℤ_[p]) ^ m) • v ∈ L := sorry

theorem map (J : Subgroup (GL (Fin n) ℚ_[p])) (g : GL (Fin n) ℚ_[p])
    {L : Submodule ℤ_[p] (Fin n → ℚ_[p])} (hL : L ∈ LocalStableLattice p n J) :
    L.map ((Matrix.toLin' (g : Matrix (Fin n) (Fin n) ℚ_[p])).restrictScalars ℤ_[p]) ∈
      LocalStableLattice p n (J.map (MulAut.conj g).toMonoidHom) := sorry

-- Local scaling part of packet test lattice_not_unique; the concrete Sym²
-- non-homothety and global Chevalley/divided-power tests remain omitted.
example (J : Subgroup (GL (Fin n) ℚ_[p])) {L : Submodule ℤ_[p] (Fin n → ℚ_[p])}
    (hL : L ∈ LocalStableLattice p n J) :
    L.map ((p : ℤ_[p]) • LinearMap.id) ∈ LocalStableLattice p n J := sorry

end LocalStableLattice

/-- Actual abstract eigenclass data. An eigenclass need not determine sys uniquely.
Specialization to integral Betti cohomology requires the ALS supplier. -/
structure TorsionEigenSystem (T : Type*) [CommRing T]
    (H : Type*) [AddCommGroup H] [Module T H]
    (Λ : Type*) [CommRing Λ] [Module Λ H] where
  sys : T →+* Λ
  c : H
  ne_zero : c ≠ 0
  eigen : ∀ t : T, t • c = sys t • c

theorem TorsionEigenSystem.maximalIdeal {T H Λ : Type*}
    [CommRing T] [AddCommGroup H] [Module T H] [Field Λ] [Finite Λ] [Module Λ H]
    (e : TorsionEigenSystem T H Λ) :
    (RingHom.ker e.sys).IsMaximal := sorry

section AlgebraicModularForms

variable {GQ Gf : Type*} [Group GQ] [Group Gf] (ι : GQ →* Gf)
  {A : Type*} [CommRing A] {M : Type*} [AddCommGroup M] [Module A M]
  (σ : Representation A GQ M)

/-- Gross's rational convention; this is not the p-adic J-coefficient convention. -/
def AlgebraicModularForm (J : Subgroup Gf) : Submodule A (Gf → M) where
  carrier := {f | (∀ (γ : GQ) (g : Gf), f (ι γ * g) = σ γ (f g)) ∧
    ∀ g, ∀ u ∈ J, f (g * u) = f g}
  add_mem' := sorry
  zero_mem' := sorry
  smul_mem' := sorry

/-- The finite set must be exactly a set of representatives of the right cosets in JgJ:
every element lies in JgJ (`hsub`) and each element of JgJ lies in exactly one
coset `cJ` (`hreps`). Without `hsub`, extra elements outside JgJ break J-invariance. -/
def AlgebraicModularForm.hecke (J : Subgroup Gf) (g : Gf) (reps : Finset Gf)
    (hsub : ∀ c ∈ reps, ∃ a ∈ J, ∃ b ∈ J, c = a * g * b)
    (hreps : ∀ x : Gf, (∃ a ∈ J, ∃ b ∈ J, x = a * g * b) →
      ∃! c : Gf, c ∈ reps ∧ ∃ u ∈ J, x = c * u) :
    AlgebraicModularForm ι σ J →ₗ[A] AlgebraicModularForm ι σ J := sorry

theorem AlgebraicModularForm.hecke_apply (J : Subgroup Gf) (g : Gf) (reps : Finset Gf)
    (hsub : ∀ c ∈ reps, ∃ a ∈ J, ∃ b ∈ J, c = a * g * b)
    (hreps : ∀ x : Gf, (∃ a ∈ J, ∃ b ∈ J, x = a * g * b) →
      ∃! c : Gf, c ∈ reps ∧ ∃ u ∈ J, x = c * u)
    (f : AlgebraicModularForm ι σ J) (x : Gf) :
    (AlgebraicModularForm.hecke ι σ J g reps hsub hreps f).val x =
      ∑ c ∈ reps, f.val (x * c) := sorry

def AlgebraicModularForm.res {J J' : Subgroup Gf} (h : J' ≤ J) :
    AlgebraicModularForm ι σ J →ₗ[A] AlgebraicModularForm ι σ J' := sorry

@[simp] theorem AlgebraicModularForm.res_apply {J J' : Subgroup Gf} (h : J' ≤ J)
    (f : AlgebraicModularForm ι σ J) (x : Gf) :
    (AlgebraicModularForm.res ι σ h f).val x = f.val x := sorry

theorem AlgebraicModularForm.res_comp {J J' J'' : Subgroup Gf}
    (h : J' ≤ J) (h' : J'' ≤ J') :
    (AlgebraicModularForm.res ι σ h').comp (AlgebraicModularForm.res ι σ h) =
      AlgebraicModularForm.res ι σ (h'.trans h) := sorry

/-- Trace requires representatives of the finite right-coset quotient J/J′. -/
def AlgebraicModularForm.trace {J J' : Subgroup Gf} (h : J' ≤ J) (reps : Finset Gf)
    (hmem : ∀ u ∈ reps, u ∈ J)
    (hreps : ∀ x ∈ J, ∃! u : Gf, u ∈ reps ∧ ∃ v ∈ J', x = u * v) :
    AlgebraicModularForm ι σ J' →ₗ[A] AlgebraicModularForm ι σ J := sorry

theorem AlgebraicModularForm.trace_apply {J J' : Subgroup Gf} (h : J' ≤ J)
    (reps : Finset Gf) (hmem : ∀ u ∈ reps, u ∈ J)
    (hreps : ∀ x ∈ J, ∃! u : Gf, u ∈ reps ∧ ∃ v ∈ J', x = u * v)
    (f : AlgebraicModularForm ι σ J') (x : Gf) :
    (AlgebraicModularForm.trace ι σ h reps hmem hreps f).val x =
      ∑ u ∈ reps, f.val (x * u) := sorry

/-- The degree identity follows from the coset sum; it does not require a free action. -/
theorem AlgebraicModularForm.trace_res {J J' : Subgroup Gf} (h : J' ≤ J)
    (reps : Finset Gf) (hmem : ∀ u ∈ reps, u ∈ J)
    (hreps : ∀ x ∈ J, ∃! u : Gf, u ∈ reps ∧ ∃ v ∈ J', x = u * v) :
    (AlgebraicModularForm.trace ι σ h reps hmem hreps).comp
        (AlgebraicModularForm.res ι σ h) =
      (reps.card : A) • LinearMap.id := sorry

/-- The actual level-coefficient convention. A representation of J alone suffices for
this function module; weighted Hecke operators require a specified extension of that action. -/
def LevelAlgebraicModularForm (J : Subgroup Gf) (σJ : Representation A J M) :
    Submodule A (Gf → M) where
  carrier := {f | (∀ (γ : GQ) (g : Gf), f (ι γ * g) = f g) ∧
    ∀ (g : Gf) (u : J), f (g * u) = σJ u⁻¹ (f g)}
  add_mem' := sorry
  zero_mem' := sorry
  smul_mem' := sorry

/-- Abstract form of f(g)↦g_p⁻¹f(g), for a coefficient whose action really extends to
the p-component of all finite adeles. An arbitrary inertial-type J-action has no such extension. -/
def AlgebraicModularForm.rationalEquiv (J : Subgroup Gf)
    (τ : Representation A Gf M) (hτ : ∀ γ : GQ, τ (ι γ) = σ γ) :
    AlgebraicModularForm ι σ J ≃ₗ[A]
      LevelAlgebraicModularForm ι J (τ.comp J.subtype) := sorry

theorem AlgebraicModularForm.rationalEquiv_apply (J : Subgroup Gf)
    (τ : Representation A Gf M) (hτ : ∀ γ : GQ, τ (ι γ) = σ γ)
    (f : AlgebraicModularForm ι σ J) (g : Gf) :
    (AlgebraicModularForm.rationalEquiv ι σ J τ hτ f).val g = τ g⁻¹ (f.val g) := sorry

theorem AlgebraicModularForm.rationalEquiv_symm_apply (J : Subgroup Gf)
    (τ : Representation A Gf M) (hτ : ∀ γ : GQ, τ (ι γ) = σ γ)
    (f : LevelAlgebraicModularForm ι J (τ.comp J.subtype)) (g : Gf) :
    ((AlgebraicModularForm.rationalEquiv ι σ J τ hτ).symm f).val g = τ g (f.val g) := sorry

def IsSufficientlySmall {Gv : Type*} [Group Gv] (J : Subgroup Gf)
    (proj : Gf →* Gv) : Prop :=
  ∀ g ∈ J, IsOfFinOrder (proj g) → proj g = 1

def fixedSub (J : Subgroup Gf) (t : Gf) : Submodule A M where
  carrier := {m | ∀ γ : GQ,
    ι γ ∈ J.map (MulAut.conj t).toMonoidHom → σ γ m = m}
  add_mem' := sorry
  zero_mem' := sorry
  smul_mem' := sorry

theorem AlgebraicModularForm.equivSum (J : Subgroup Gf) {h : ℕ} (t : Fin h → Gf)
    (hdecomp : ∀ g : Gf, ∃! i : Fin h,
      ∃ γ : GQ, ∃ u ∈ J, g = ι γ * t i * u) :
    Nonempty (AlgebraicModularForm ι σ J ≃ₗ[A]
      ((i : Fin h) → fixedSub ι σ J (t i))) := sorry

-- test: amf_zero
example [Subsingleton M] (J : Subgroup Gf) :
    Subsingleton (AlgebraicModularForm ι σ J) := sorry

def AlgebraicModularForm.trivialEquiv (J : Subgroup Gf) :
    AlgebraicModularForm ι (Representation.trivial A GQ A) J ≃ₗ[A]
      (DoubleCoset.Quotient (ι.range : Set Gf) (J : Set Gf) → A) := sorry

theorem AlgebraicModularForm.trivialEquiv_apply (J : Subgroup Gf)
    (f : AlgebraicModularForm ι (Representation.trivial A GQ A) J) (g : Gf) :
    AlgebraicModularForm.trivialEquiv ι J f (DoubleCoset.mk ι.range J g)=f.val g := sorry

-- test: amf_trivial_coeff. Actual functions on the baseline double-coset quotient.
example (J : Subgroup Gf) :
    Nonempty (AlgebraicModularForm ι (Representation.trivial A GQ A) J ≃ₗ[A]
      (DoubleCoset.Quotient (ι.range : Set Gf) (J : Set Gf) → A)) := sorry

/-- Extra small-case check: at full level, constants are exactly invariant values. -/
example (m : M) : (fun _ : Gf => m) ∈ AlgebraicModularForm ι σ ⊤ ↔
    ∀ γ : GQ, σ γ m = m := sorry

-- test: amf_not_small_basechange, the C₂ sign coefficient invariant spaces.
-- Integral invariants are zero, while reduction modulo 2 has all of F₂ invariant.
example : (∀ m : ℤ, -m = m ↔ m = 0) ∧ (∀ m : ZMod 2, -m = m) := sorry

-- level-coefficient degenerate case
example [Subsingleton M] (J : Subgroup Gf) (σJ : Representation A J M) :
    Subsingleton (LevelAlgebraicModularForm ι J σJ) := sorry

-- level-coefficient trivial action agrees with scalar double-coset functions
example (J : Subgroup Gf) (f : Gf → M)
    (hf : f ∈ LevelAlgebraicModularForm ι J (Representation.trivial A J M))
    (γ : GQ) (g : Gf) (u : J) : f (ι γ * g * u) = f g := sorry

-- level-coefficient compatibility with the actual rational transport
example (J : Subgroup Gf) (τ : Representation A Gf M)
    (hτ : ∀ γ : GQ, τ (ι γ) = σ γ) (f : AlgebraicModularForm ι σ J) :
    (AlgebraicModularForm.rationalEquiv ι σ J τ hτ).symm
      (AlgebraicModularForm.rationalEquiv ι σ J τ hτ f) = f := sorry

-- Weighted Hecke semigroup maps and the positive-unit-rank central-character
-- branch are constructed below with actual coefficient transport. Arithmetic
-- ordinary/central class-set finiteness and the definite quaternion comparison
-- require the exact AA.3/AA.4 supplier exports recorded in the packet.
end AlgebraicModularForms

end TauCeti.Automorphic

/-
Findings /2, /6, /29 and /30: the single AF.1b real-representation proposal
includes Casselman embedding and globalization as well as classification;
globalization consumes its classification/discrete-series reduction. AL keeps
Tate's rank-one factors and imports the AF higher-rank dictionary.
The independent AF.1a cochain owner must supply ALS.4's requested absolute
characteristic-zero complex and Kostant theorem; existing relative cochains
and Mathlib's low-degree absolute cochains do not assert that full output.
An early AF.4 local-weight prefix supplies ALS/AS comparison proofs. The
rationality and torsion-eigenclass suffix imports the actual Betti/Hecke
comparison, retaining its source group hypotheses. These proposed splits
add no native signature and do not certify all stage dependencies acyclic.
-/

/-
AF.1/tempered-square-integrable takes a supplied continuous SF or unitary
Hilbert realization. Its coefficient integrability definition precedes CW.
Existence of the discrete/tempered realizations and comparison with the later
canonical SAF realization remain explicit source/signature gaps. This prevents
classification/globalization from assuming the globalization theorem in its
own initial matrix-coefficient definition.
-/

/-
AF.1/archimedean-llc-gln uses Knapp's public survey, Theorems 2 and 5
(pp.403,406), whose explicit real/complex parameter constructions and
bijections have been read. The original classification/discrete-series
proofs and the faithful native signatures remain explicit gaps.
-/

namespace TauCeti.RelativeLieCohomology

/-- Compatible analytic and Lie structures; this bundles existing classes. -/
class NormedComplexLieAlgebra (q : Type*) extends NormedAddCommGroup q, LieRing q,
    NormedSpace ℂ q, LieAlgebra ℂ q, FiniteDimensional ℂ q

open scoped Manifold TensorProduct

section Pairs

variable {E : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E]
    [FiniteDimensional ℝ E] {H : Type*} [TopologicalSpace H]
    (I : ModelWithCorners ℝ E H)
    (K : Type*) [Group K] [TopologicalSpace K] [ChartedSpace H K]
    [LieGroup I ∞ K] [CompactSpace K]
    (q : Type*) [NormedComplexLieAlgebra q]

/-- A compact pair with its actual differentiated compact-group action.
The injection is from the complexification of Mathlib's tangent Lie algebra. -/
structure Pair [CompactSpace K] where
  Ad : Representation ℂ K q
  Ad_lie : ∀ k X Y, Ad k ⁅X, Y⁆ = ⁅Ad k X, Ad k Y⁆
  iota : (TauCeti.ComplexGroupLie I K) →ₗ⁅ℂ⁆ q
  injective : Function.Injective iota
  smooth : ∀ Y : q, ContMDiff I 𝓘(ℝ, q) ∞ (fun k : K => Ad k Y)
  derivative : ∀ (X : GroupLieAlgebra I K) (Y : q),
    mfderiv I 𝓘(ℝ, q) (fun k : K => Ad k Y) 1 X = ⁅iota (1 ⊗ₜ[ℝ] X), Y⁆
  equivariant : ∀ (k : K) (X : GroupLieAlgebra I K),
    iota (1 ⊗ₜ[ℝ] (mfderiv I I (fun x : K => k * x * k⁻¹) 1 X)) =
      Ad k (iota (1 ⊗ₜ[ℝ] X))

variable {I K q}

/-- Coordinate-free derivative for a scalar-valued smooth orbit map. -/
def orbitDerivative {V : Type*} [AddCommGroup V] [Module ℂ V]
    (sigma : Representation ℂ K V) (v : V) (ell : V →ₗ[ℂ] ℂ)
    (X : GroupLieAlgebra I K) : ℂ :=
  mfderiv I 𝓘(ℝ, ℂ) (fun k : K => ell (sigma k v)) 1 X

/-- No topology on the full algebraic module is required. Smoothness is checked
on each finite orbit span through its scalar coordinates. -/
structure GKModule (P : Pair I K q) (V : Type*) [AddCommGroup V] [Module ℂ V] where
  rho : q →ₗ⁅ℂ⁆ Module.End ℂ V
  sigma : Representation ℂ K V
  locallyFinite : ∀ v : V,
    FiniteDimensional ℂ (Submodule.span ℂ (Set.range (fun k : K => sigma k v)))
  smooth : ∀ (v : V) (ell : V →ₗ[ℂ] ℂ),
    ContMDiff I 𝓘(ℝ, ℂ) ∞ (fun k : K => ell (sigma k v))
  derivative : ∀ (v : V) (ell : V →ₗ[ℂ] ℂ) (X : GroupLieAlgebra I K),
    orbitDerivative (I := I) sigma v ell X = ell (rho (P.iota (1 ⊗ₜ[ℝ] X)) v)
  covariance : ∀ (k : K) (X : q) (v : V),
    sigma k (rho X (sigma k⁻¹ v)) = rho (P.Ad k X) v

namespace GKModule

variable {P : Pair I K q} {V W : Type*} [AddCommGroup V] [Module ℂ V]
    [AddCommGroup W] [Module ℂ W]

structure Hom (A : GKModule P V) (B : GKModule P W) extends V →ₗ[ℂ] W where
  lie : ∀ X v, toLinearMap (A.rho X v) = B.rho X (toLinearMap v)
  group : ∀ k v, toLinearMap (A.sigma k v) = B.sigma k (toLinearMap v)

def trivial (P : Pair I K q) : GKModule P ℂ where
  rho := 0
  sigma := Representation.trivial ℂ K ℂ
  locallyFinite := sorry
  smooth := sorry
  derivative := sorry
  covariance := sorry

theorem deriv_eq (A : GKModule P V) (v : V) (ell : V →ₗ[ℂ] ℂ)
    (X : GroupLieAlgebra I K) :
    orbitDerivative (I := I) A.sigma v ell X = ell (A.rho (P.iota (1 ⊗ₜ[ℝ] X)) v) := sorry

-- test: gkModule_trivial
example (P : Pair I K q) (X : q) (z : ℂ) : (trivial P).rho X z = 0 := sorry

-- Distinguish local finiteness from an arbitrary countable-dimensional module.
example (A : GKModule P V) (v : V) :
    FiniteDimensional ℂ (Submodule.span ℂ (Set.range (fun k : K => A.sigma k v))) := sorry

end GKModule

end Pairs

section Cochains

variable {E : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E]
    [FiniteDimensional ℝ E] {H : Type*} [TopologicalSpace H]
    {I : ModelWithCorners ℝ E H}
    {K : Type*} [Group K] [TopologicalSpace K] [ChartedSpace H K]
    [LieGroup I ∞ K] [CompactSpace K]
    {q : Type*} [NormedComplexLieAlgebra q]
    {P : Pair I K q} {V : Type*} [AddCommGroup V] [Module ℂ V]
    (A : GKModule P V)

/-- Horizontal and K-equivariant alternating maps. Disconnected K is retained. -/
def cochains (n : ℕ) : Submodule ℂ (AlternatingMap ℂ q V (Fin n)) where
  carrier := {w | (∀ (x : Fin n → q) (i : Fin n) (X : GroupLieAlgebra I K),
    x i = P.iota (1 ⊗ₜ[ℝ] X) → w x = 0) ∧
    ∀ (k : K) (x : Fin n → q), w (fun i => P.Ad k (x i)) = A.sigma k (w x)}
  zero_mem' := sorry
  add_mem' := sorry
  smul_mem' := sorry

/-- Absolute differential; the equations below fix every sign and argument order. -/
def ceDifferential (_A : GKModule P V) (n : ℕ) :
    AlternatingMap ℂ q V (Fin n) →ₗ[ℂ] AlternatingMap ℂ q V (Fin (n+1)) := sorry

theorem ceDifferential_zero_apply (w : AlternatingMap ℂ q V (Fin 0)) (x : Fin 1 → q) :
    ceDifferential A 0 w x = A.rho (x 0) (w Fin.elim0) := sorry

theorem ceDifferential_succ_apply (n : ℕ)
    (w : AlternatingMap ℂ q V (Fin (n+1))) (x : Fin (n+2) → q) :
    ceDifferential A (n+1) w x =
      (∑ i : Fin (n+2), (-1 : ℂ)^i.val •
        A.rho (x i) (w (fun t => x (i.succAbove t)))) +
      ∑ i : Fin (n+2), ∑ j : Fin (n+1),
        if i.val < (i.succAbove j).val then
          (-1 : ℂ)^(i.val + (i.succAbove j).val) •
            w (Fin.cons ⁅x i, x (i.succAbove j)⁆
              (fun t : Fin n => x (i.succAbove (j.succAbove t))))
        else 0 := sorry

def differential (n : ℕ) : cochains A n →ₗ[ℂ] cochains A (n+1) := sorry

theorem differential_val (n : ℕ) (w : cochains A n) :
    (differential A n w).val = ceDifferential A n w.val := sorry

theorem d_comp_d (n : ℕ) :
    (differential A (n+1)).comp (differential A n) = 0 := sorry

def boundaries : (n : ℕ) → Submodule ℂ (cochains A n)
  | 0 => ⊥
  | n+1 => LinearMap.range (differential A n)

set_option backward.isDefEq.respectTransparency false in
def cohomology (n : ℕ) : Type _ := by
  let C := cochains A n
  let Z : Submodule ℂ C := LinearMap.ker (differential A n)
  let r : Setoid Z := {
    r := fun x y => x.val - y.val ∈ boundaries A n
    iseqv := by sorry }
  exact Quotient r

instance (n : ℕ) : AddCommGroup (cohomology A n) := sorry
instance (n : ℕ) : Module ℂ (cohomology A n) := sorry

def invariants : Submodule ℂ V where
  carrier := {v | (∀ X : q, A.rho X v = 0) ∧ ∀ k : K, A.sigma k v = v}
  zero_mem' := sorry
  add_mem' := sorry
  smul_mem' := sorry

def H0_eq_invariants : cohomology A 0 ≃ₗ[ℂ] invariants A := sorry

-- test: relativeCochains_compact
example (hi : Function.Surjective P.iota) (n : ℕ) (hn : 0 < n) :
    Subsingleton (cohomology A n) := sorry

-- A scalar coefficient and zero action make the differential vanish on an
-- abelian Lie algebra; this tests the actual differential, rather than dimensions.
example [IsLieAbelian q] (n : ℕ) :
    ceDifferential (GKModule.trivial P) n = 0 := sorry

end Cochains

end TauCeti.RelativeLieCohomology

namespace TauCeti.Automorphic

section GrowthSpaces

variable {Ginf Gf : Type*} [Group Ginf] [TopologicalSpace Ginf]
  [IsTopologicalGroup Ginf] [LocallyCompactSpace Ginf] [T2Space Ginf]
  [SecondCountableTopology Ginf] [Group Gf] [TopologicalSpace Gf]
  [IsTopologicalGroup Gf] [LocallyCompactSpace Gf] [TotallyDisconnectedSpace Gf]
  [T2Space Gf] [SecondCountableTopology Gf]
  {E : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]
  {H : Type*} [TopologicalSpace H] (I : ModelWithCorners ℝ E H)
  [ChartedSpace H Ginf] [LieGroup I ∞ Ginf]

local notation "Sm" => SmoothAdelicFunction (Ginf := Ginf) (Gf := Gf) I
local notation "U" => UniversalEnvelopingAlgebra ℂ (TauCeti.ComplexGroupLie I Ginf)

def rightDerivative (u : U) (f : Sm) : Sm :=
  SmoothAdelicFunction.envelopingAction I u f

def twoSidedDerivative (u v : U) (f : Sm) : Sm :=
  SmoothAdelicFunction.envelopingAction I u
    (SmoothAdelicFunction.leftEnvelopingAction I v f)

def IsBiLevelInvariant (f : Ginf × Gf → ℂ) (J : Subgroup Gf) : Prop :=
  ∀ (g : Ginf × Gf) (j k : J), f (g.1, j * g.2 * k) = f g

/-- Fixed compact support in the finite factor; no archimedean support restriction. -/
def SchwartzPiece (height : Ginf × Gf → ℝ) (C : Set Gf) (J : Subgroup Gf) :
    Submodule ℂ Sm where
  carrier := {f | IsBiLevelInvariant f.val J ∧
    (∀ g, g.2 ∉ C → f.val g = 0) ∧
    ∀ (r : ℕ) (u v : U), BddAbove
      (Set.range (fun g => (max 1 (height g)) ^ r * ‖(twoSidedDerivative I u v f).val g‖))}
  zero_mem' := sorry
  add_mem' := sorry
  smul_mem' := sorry

def SchwartzPiece.seminorm (height : Ginf × Gf → ℝ) (C : Set Gf)
    (J : Subgroup Gf) (r : ℕ) (u v : U) :
    Seminorm ℂ (SchwartzPiece I height C J) := sorry

theorem SchwartzPiece.seminorm_apply (height : Ginf × Gf → ℝ)
    (C : Set Gf) (J : Subgroup Gf) (r : ℕ) (u v : U)
    (f : SchwartzPiece I height C J) :
    SchwartzPiece.seminorm I height C J r u v f =
      sSup (Set.range (fun g => (max 1 (height g)) ^ r * ‖(twoSidedDerivative I u v f.val).val g‖)) := sorry

@[instance_reducible] def SchwartzPiece.topology (height : Ginf × Gf → ℝ) (C : Set Gf) (J : Subgroup Gf) :
    TopologicalSpace (SchwartzPiece I height C J) :=
  (SeminormFamily.moduleFilterBasis
    (fun i : ℕ × U × U => SchwartzPiece.seminorm I height C J i.1 i.2.1 i.2.2)).topology

/-- The union of the actual Schwartz pieces, with its inductive locally convex topology. -/
def SchwartzFunction (height : Ginf × Gf → ℝ) : Submodule ℂ Sm where
  carrier := {f | ∃ (C : Set Gf) (J : Subgroup Gf), IsCompact C ∧
    IsOpen (J : Set Gf) ∧ IsCompact (J : Set Gf) ∧ f ∈ SchwartzPiece I height C J}
  zero_mem' := sorry
  add_mem' := sorry
  smul_mem' := sorry

def SchwartzPiece.inclusion (height : Ginf × Gf → ℝ) (C : Set Gf) (J : Subgroup Gf)
    (hc : IsCompact C) (ho : IsOpen (J : Set Gf)) (hj : IsCompact (J : Set Gf)) :
    SchwartzPiece I height C J →ₗ[ℂ] SchwartzFunction I height := sorry

/-- All seminorms whose restrictions to every defining piece are continuous. -/
def SchwartzFunction.lfSeminorms (height : Ginf × Gf → ℝ) :=
  {p : Seminorm ℂ (SchwartzFunction I height) //
    ∀ (C : Set Gf) (J : Subgroup Gf) (hc : IsCompact C)
      (ho : IsOpen (J : Set Gf)) (hj : IsCompact (J : Set Gf)),
    @Continuous (SchwartzPiece I height C J) ℝ
      (SchwartzPiece.topology I height C J) inferInstance
      (fun f => p (SchwartzPiece.inclusion I height C J hc ho hj f))}

instance SchwartzFunction.topology (height : Ginf × Gf → ℝ) :
    TopologicalSpace (SchwartzFunction I height) :=
  (SeminormFamily.moduleFilterBasis
    (fun p : SchwartzFunction.lfSeminorms I height => p.val)).topology

/-- Weighted seminorms are finite on every Schwartz function; the LF topology also
remembers the finite-support and level pieces. -/
def SchwartzFunction.seminorm (height : Ginf × Gf → ℝ)
    (r : ℕ) (u v : U) : Seminorm ℂ (SchwartzFunction I height) := sorry

theorem SchwartzFunction.seminorm_apply (height : Ginf × Gf → ℝ)
    (r : ℕ) (u v : U) (f : SchwartzFunction I height) :
    SchwartzFunction.seminorm I height r u v f =
      sSup (Set.range (fun g => (max 1 (height g))^r *
        ‖(twoSidedDerivative I u v f.val).val g‖)) := sorry

def SchwartzFunction.ofTestFunction (height : Ginf × Gf → ℝ)
    (hheight : Continuous height) : TestFunction (Ginf := Ginf) (Gf := Gf) I →ₗ[ℂ]
      SchwartzFunction I height := sorry

variable [MeasurableSpace Ginf] [BorelSpace Ginf] [MeasurableSpace Gf] [BorelSpace Gf]

/-- Polynomial Haar integrability is an explicit AA.3 input. -/
def SchwartzFunction.convolution (height : Ginf × Gf → ℝ)
    (h1 : ∀ g, 1 ≤ height g) (hmul : ∀ g h, height (g*h) ≤ height g * height h)
    (hinv : ∀ g, height g⁻¹ = height g) (μ : MeasureTheory.Measure (Ginf × Gf))
    [μ.IsHaarMeasure] [μ.IsMulRightInvariant]
    (hint : ∃ r : ℕ, MeasureTheory.Integrable (fun g => (height g)^(-(r : ℝ))) μ) :
    SchwartzFunction I height →ₗ[ℂ] SchwartzFunction I height →ₗ[ℂ]
      SchwartzFunction I height := sorry

theorem SchwartzFunction.convolution_apply (height : Ginf × Gf → ℝ)
    (h1 : ∀ g, 1 ≤ height g) (hmul : ∀ g h, height (g*h) ≤ height g * height h)
    (hinv : ∀ g, height g⁻¹ = height g) (μ : MeasureTheory.Measure (Ginf × Gf))
    [μ.IsHaarMeasure] [μ.IsMulRightInvariant]
    (hint : ∃ r : ℕ, MeasureTheory.Integrable (fun g => (height g)^(-(r : ℝ))) μ)
    (f h : SchwartzFunction I height) (g : Ginf × Gf) :
    (SchwartzFunction.convolution I height h1 hmul hinv μ hint f h).val.val g =
      convolutionKernel μ f.val.val h.val.val g := sorry

/-- One exponent controls all right derivatives; constants may depend on u. -/
def UniformModerateGrowth (height : Ginf × Gf → ℝ) (Γ : Subgroup (Ginf × Gf))
    (N : ℝ) : Submodule ℂ Sm where
  carrier := {f | (∀ (γ : Γ) g, f.val ((γ : Ginf × Gf)*g) = f.val g) ∧
    ∀ u : U, BddAbove (Set.range (fun g => ‖(rightDerivative I u f).val g‖ / (max 1 (height g)) ^ N))}
  zero_mem' := sorry
  add_mem' := sorry
  smul_mem' := sorry

def UniformModerateGrowth.seminorm (height : Ginf × Gf → ℝ)
    (Γ : Subgroup (Ginf × Gf)) (N : ℝ) (u : U) :
    Seminorm ℂ (UniformModerateGrowth I height Γ N) := sorry

theorem UniformModerateGrowth.seminorm_apply (height : Ginf × Gf → ℝ)
    (Γ : Subgroup (Ginf × Gf)) (N : ℝ) (u : U)
    (f : UniformModerateGrowth I height Γ N) :
    UniformModerateGrowth.seminorm I height Γ N u f =
      sSup (Set.range (fun g => ‖(rightDerivative I u f.val).val g‖ / (max 1 (height g)) ^ N)) := sorry

def UniformModerateGrowth.level (height : Ginf × Gf → ℝ)
    (Γ : Subgroup (Ginf × Gf)) (N : ℝ) (J : Subgroup Gf) :
    Submodule ℂ (UniformModerateGrowth I height Γ N) where
  carrier := {f | IsLevelInvariant f.val.val J}
  zero_mem' := sorry
  add_mem' := sorry
  smul_mem' := sorry

@[instance_reducible] def UniformModerateGrowth.levelTopology
    (height : Ginf × Gf → ℝ) (Γ : Subgroup (Ginf × Gf)) (N : ℝ) (J : Subgroup Gf) :
    TopologicalSpace (UniformModerateGrowth.level I height Γ N J) :=
  (SeminormFamily.moduleFilterBasis (fun u : U =>
    (UniformModerateGrowth.seminorm I height Γ N u).comp
      (UniformModerateGrowth.level I height Γ N J).subtype)).topology

def UniformModerateGrowth.lfSeminorms (height : Ginf × Gf → ℝ)
    (Γ : Subgroup (Ginf × Gf)) (N : ℝ) :=
  {p : Seminorm ℂ (UniformModerateGrowth I height Γ N) //
    ∀ (J : Subgroup Gf), IsOpen (J : Set Gf) → IsCompact (J : Set Gf) →
    @Continuous (UniformModerateGrowth.level I height Γ N J) ℝ
      (UniformModerateGrowth.levelTopology I height Γ N J) inferInstance
      (fun f => p f.val)}

instance UniformModerateGrowth.topology (height : Ginf × Gf → ℝ)
    (Γ : Subgroup (Ginf × Gf)) (N : ℝ) :
    TopologicalSpace (UniformModerateGrowth I height Γ N) :=
  (SeminormFamily.moduleFilterBasis
    (fun p : UniformModerateGrowth.lfSeminorms I height Γ N => p.val)).topology

def UniformModerateGrowth.all (height : Ginf × Gf → ℝ)
    (Γ : Subgroup (Ginf × Gf)) : Submodule ℂ Sm where
  carrier := {f | ∃ N : ℕ, f ∈ UniformModerateGrowth I height Γ N}
  zero_mem' := sorry
  add_mem' := sorry
  smul_mem' := sorry

def UniformModerateGrowth.toAll (height : Ginf × Gf → ℝ)
    (Γ : Subgroup (Ginf × Gf)) (N : ℕ) :
    UniformModerateGrowth I height Γ N →ₗ[ℂ] UniformModerateGrowth.all I height Γ := sorry

def UniformModerateGrowth.allSeminorms (height : Ginf × Gf → ℝ)
    (Γ : Subgroup (Ginf × Gf)) :=
  {p : Seminorm ℂ (UniformModerateGrowth.all I height Γ) //
    ∀ N : ℕ, Continuous (fun f => p (UniformModerateGrowth.toAll I height Γ N f))}

instance UniformModerateGrowth.allTopology (height : Ginf × Gf → ℝ)
    (Γ : Subgroup (Ginf × Gf)) :
    TopologicalSpace (UniformModerateGrowth.all I height Γ) :=
  (SeminormFamily.moduleFilterBasis
    (fun p : UniformModerateGrowth.allSeminorms I height Γ => p.val)).topology

def UniformModerateGrowth.mono (height : Ginf × Gf → ℝ) (h1 : ∀ g, 1 ≤ height g)
    (Γ : Subgroup (Ginf × Gf)) (N M : ℝ) (hNM : N ≤ M) :
    UniformModerateGrowth I height Γ N →ₗ[ℂ] UniformModerateGrowth I height Γ M := sorry

theorem UniformModerateGrowth.hasModerateGrowth (height : Ginf × Gf → ℝ)
    (h1 : ∀ g, 1 ≤ height g) (Γ : Subgroup (Ginf × Gf)) (N : ℝ) (hN : 0 ≤ N)
    (f : UniformModerateGrowth I height Γ N) : HasModerateGrowth height f.val.val := sorry

-- test: uniformModerateGrowth_const
example (height : Ginf × Gf → ℝ) (h1 : ∀ g, 1 ≤ height g)
    (Γ : Subgroup (Ginf × Gf)) (c : ℂ) :
    (algebraMap ℂ Sm c) ∈ UniformModerateGrowth I height Γ 0 := sorry

-- test: uniformModerateGrowth_not_of_moderate. In logarithmic GL1
-- coordinate x=log(t), the height is exp(|x|), and d/dx is the Euler derivative.
example : HasModerateGrowth (fun x : ℝ => Real.exp |x|)
    (fun x => (Real.sin (Real.exp (Real.exp (2*x))) : ℂ)) ∧
    ¬HasModerateGrowth (fun x : ℝ => Real.exp |x|)
      (fun x => ((2*Real.exp (2*x)*Real.exp (Real.exp (2*x))*
        Real.cos (Real.exp (Real.exp (2*x)))) : ℂ)) := sorry

end GrowthSpaces
end TauCeti.Automorphic

namespace TauCeti.RealReductive

section AlgebraicModules

variable {E : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E]
    [FiniteDimensional ℝ E] {H : Type*} [TopologicalSpace H]
    {I : ModelWithCorners ℝ E H} {K : Type*} [Group K] [TopologicalSpace K]
    [ChartedSpace H K] [LieGroup I ∞ K] [CompactSpace K]
    {q : Type*} [TauCeti.RelativeLieCohomology.NormedComplexLieAlgebra q]
    {P : TauCeti.RelativeLieCohomology.Pair I K q}
    {V : Type*} [AddCommGroup V] [Module ℂ V]

/-- Irreducibility stated on actual invariant subspaces. -/
def IsIrreducible (σ : Representation ℂ K V) : Prop :=
  Nontrivial V ∧ ∀ S : Submodule ℂ V,
    (∀ k v, v ∈ S → σ k v ∈ S) → S = ⊥ ∨ S = ⊤

def kFinite (σ : Representation ℂ K V) : Submodule ℂ V where
  carrier := {v | FiniteDimensional ℂ (Submodule.span ℂ (Set.range (fun k => σ k v)))}
  zero_mem' := sorry
  add_mem' := sorry
  smul_mem' := sorry

def kHom (σ : Representation ℂ K (Fin 1 → ℂ))
    (τ : Representation ℂ K V) : Submodule ℂ ((Fin 1 → ℂ) →ₗ[ℂ] V) where
  carrier := {f | ∀ k v, f (σ k v) = τ k (f v)}
  zero_mem' := sorry
  add_mem' := sorry
  smul_mem' := sorry

/-- All finite dimensional K-types, not only characters. -/
def multiplicity (n : ℕ) (σ : Representation ℂ K (Fin n → ℂ))
    (τ : Representation ℂ K V) : Submodule ℂ ((Fin n → ℂ) →ₗ[ℂ] V) where
  carrier := {f | ∀ k v, f (σ k v) = τ k (f v)}
  zero_mem' := sorry
  add_mem' := sorry
  smul_mem' := sorry

def isotypic (n : ℕ) (σ : Representation ℂ K (Fin n → ℂ))
    (τ : Representation ℂ K V) : Submodule ℂ V :=
  ⨆ f : multiplicity n σ τ, LinearMap.range f.val

theorem isotypic_map {W : Type*} [AddCommGroup W] [Module ℂ W]
    (A : TauCeti.RelativeLieCohomology.GKModule P V)
    (B : TauCeti.RelativeLieCohomology.GKModule P W)
    (f : TauCeti.RelativeLieCohomology.GKModule.Hom A B) (n : ℕ)
    (σ : Representation ℂ K (Fin n → ℂ)) :
    (isotypic n σ A.sigma).map f.toLinearMap ≤ isotypic n σ B.sigma := sorry

def IsAdmissible (A : TauCeti.RelativeLieCohomology.GKModule P V) : Prop :=
  ∀ (n : ℕ) (σ : ContRepresentation ℂ K (Fin n → ℂ)),
    Continuous (fun kv : K × (Fin n → ℂ) => σ kv.1 kv.2) →
    IsIrreducible σ.toRepresentation → FiniteDimensional ℂ (multiplicity n σ.toRepresentation A.sigma)

def envelopingAction (A : TauCeti.RelativeLieCohomology.GKModule P V) :
    UniversalEnvelopingAlgebra ℂ q →ₐ[ℂ] Module.End ℂ V :=
  UniversalEnvelopingAlgebra.lift ℂ A.rho

local notation "U" => UniversalEnvelopingAlgebra ℂ q
local notation "Z" => Subalgebra.center ℂ U

def IsFinitelyGenerated (A : TauCeti.RelativeLieCohomology.GKModule P V) : Prop :=
  ∃ S : Finset V, Submodule.span ℂ
    (Set.range (fun uv : U × {v : V // v ∈ S} => envelopingAction A uv.1 uv.2)) = ⊤

def IsZFinite (A : TauCeti.RelativeLieCohomology.GKModule P V) : Prop :=
  ∃ J : Ideal Z, FiniteDimensional ℂ (Z ⧸ J) ∧
    ∀ (z : Z), z ∈ J → ∀ v, envelopingAction A z.val v = 0

structure HCModule extends TauCeti.RelativeLieCohomology.GKModule P V where
  admissible : IsAdmissible toGKModule
  finitelyGenerated : IsFinitelyGenerated toGKModule

/-- Actual central algebra characters; the Harish-Chandra parameterization is a
separate comparison with the pinned highest-weight theory. -/
abbrev InfChar (q : Type*) [LieRing q] [LieAlgebra ℂ q] :=
  Subalgebra.center ℂ (UniversalEnvelopingAlgebra ℂ q) →ₐ[ℂ] ℂ

def HasInfChar (A : TauCeti.RelativeLieCohomology.GKModule P V) (χ : InfChar q) : Prop :=
  ∀ (z : Z) v, envelopingAction A z.val v = χ z • v

def genEigenspace (A : TauCeti.RelativeLieCohomology.GKModule P V)
    (χ : InfChar q) : Submodule ℂ V where
  carrier := {v | ∀ z : Z, ∃ n : ℕ,
    ((envelopingAction A z.val - χ z • (1 : Module.End ℂ V))^n) v = 0}
  zero_mem' := sorry
  add_mem' := sorry
  smul_mem' := sorry

-- test: kFinite_trivial
example (v : V) : v ∈ kFinite (Representation.trivial ℂ K V) := sorry

-- General finite-orbit membership criterion.
example (σ : Representation ℂ K V) (v : V)
    (h : ¬FiniteDimensional ℂ (Submodule.span ℂ (Set.range (fun k => σ k v)))) :
    v ∉ kFinite σ := sorry

-- test: kFinite_finiteDim, all vectors of a finite-dimensional module are K-finite.
example [FiniteDimensional ℂ V] (σ : Representation ℂ K V) : kFinite σ = ⊤ := sorry

end AlgebraicModules

section FrechetRepresentations

variable {E : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E]
    [FiniteDimensional ℝ E] {H : Type*} [TopologicalSpace H]
    (I : ModelWithCorners ℝ E H) (G : Type*) [Group G] [TopologicalSpace G]
    [ChartedSpace H G] [LieGroup I ∞ G]
    (B : ℕ → Type*) [∀ n, NormedAddCommGroup (B n)] [∀ n, NormedSpace ℂ (B n)]
    [∀ n, CompleteSpace (B n)] (V : Submodule ℂ (∀ n, B n))

/-- A closed subspace of a countable product of Banach spaces is a Fréchet
space. Every Fréchet space admits such a presentation by its seminorm completions.
Smoothness is tested in every Banach coordinate, so this is not a Banach-only model. -/
structure SFRep [LieGroup I ∞ G] [FiniteDimensional ℝ E]
    [∀ n, CompleteSpace (B n)] (height : G → ℝ) where
  closed : IsClosed (V : Set (∀ n, B n))
  π : ContRepresentation ℂ G V
  joint : Continuous (fun gv : G × V => π gv.1 gv.2)
  smooth : ∀ (v : V) n,
    ContMDiff I 𝓘(ℝ, B n) ∞ (fun g => (π g v).val n)
  height_one : ∀ g, 1 ≤ height g
  growth : ∀ n, ∃ (S : Finset ℕ) (C N : ℝ), 0 ≤ C ∧ 0 ≤ N ∧
    ∀ (g : G) (v : V), ‖(π g v).val n‖ ≤ C * height g ^ N * ∑ j ∈ S, ‖v.val j‖

/-- A derivative valued in the actual closed Fréchet subspace. -/
def SFRep.derivAction {height : G → ℝ} (π : SFRep I G B V height) :
    TauCeti.ComplexGroupLie I G →ₗ⁅ℂ⁆ Module.End ℂ V := sorry

theorem SFRep.derivAction_coordinate {height : G → ℝ} (π : SFRep I G B V height)
    (X : GroupLieAlgebra I G) (v : V) (n : ℕ) :
    (SFRep.derivAction I G B V π (1 ⊗ₜ[ℝ] X) v).val n =
      mfderiv I 𝓘(ℝ, B n) (fun g => (π.π g v).val n) 1 X := sorry

def SFRep.smoothVectors {W : Type*} [NormedAddCommGroup W] [NormedSpace ℂ W]
    (π : ContRepresentation ℂ G W) : Submodule ℂ W where
  carrier := {v | ContMDiff I 𝓘(ℝ, W) ∞ (fun g => π g v)}
  zero_mem' := sorry
  add_mem' := sorry
  smul_mem' := sorry

/-- The K-finite carrier is algebraic, with joint continuity and differentiation
supplied by SFRep, rather than inferred from continuous individual operators. -/
def SFRep.kFinite {height : G → ℝ} (π : SFRep I G B V height)
    {K : Type*} [Group K] (ι : K →* G) : Submodule ℂ V :=
  TauCeti.RealReductive.kFinite (π.π.toRepresentation.comp ι)

def constantSequences : Submodule ℂ (ℕ → ℂ) where
  carrier := {v | ∀ n, v n = v 0}
  zero_mem' := sorry
  add_mem' := sorry
  smul_mem' := sorry

def SFRep.trivial (height : G → ℝ) (h1 : ∀ g, 1 ≤ height g) :
    SFRep I G (fun _ => ℂ) constantSequences height where
  closed := by sorry
  π := ⟨1⟩
  joint := sorry
  smooth := sorry
  height_one := h1
  growth := sorry

-- test: sfRep_trivial; the constant sequence subspace gives the one-dimensional
-- trivial representation, with its inherited complete metrizable topology.
example (height : G → ℝ) (h1 : ∀ g, 1 ≤ height g)
    (g : G) (v : constantSequences) :
    (SFRep.trivial I G height h1).π g v = v := sorry

-- test: sfRep_smoothVectors_nonexample, the membership criterion for a Banach model.
example {W : Type*} [NormedAddCommGroup W] [NormedSpace ℂ W]
    (π : ContRepresentation ℂ G W) (v : W)
    (h : ¬ContMDiff I 𝓘(ℝ, W) ∞ (fun g => π g v)) :
    v ∉ SFRep.smoothVectors I G π := sorry

end FrechetRepresentations
end TauCeti.RealReductive



namespace TauCeti.ComplexGroupLie
section
variable {E : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E]
    [FiniteDimensional ℝ E] {H : Type*} [TopologicalSpace H]
    (I : ModelWithCorners ℝ E H) (G : Type*) [Group G] [TopologicalSpace G]
    [ChartedSpace H G] [LieGroup I ∞ G]

/-- Scalar extension of the actual differential of conjugation. -/
def ad (g : G) : ComplexGroupLie I G →ₗ[ℂ] ComplexGroupLie I G := sorry

theorem ad_tmul (g : G) (z : ℂ) (X : GroupLieAlgebra I G) :
    ad I G g (z ⊗ₜ[ℝ] X) =
      z ⊗ₜ[ℝ] (mfderiv I I (fun h : G => g*h*g⁻¹) 1 X) := sorry
end
end TauCeti.ComplexGroupLie
namespace TauCeti.RealReductive

section KTypes
variable {K V : Type*} [Group K] [TopologicalSpace K] [CompactSpace K]
    [IsTopologicalGroup K] [AddCommGroup V] [Module ℂ V]

theorem kFinite_eq_iSup_isotypic (τ : Representation ℂ K V)
    (hsmooth : ∀ v : kFinite τ, ∃ (n : ℕ) (σ : ContRepresentation ℂ K (Fin n → ℂ)),
      Continuous (fun kv : K × (Fin n → ℂ) => σ kv.1 kv.2) ∧
      ∃ f : multiplicity n σ.toRepresentation τ, v.val ∈ LinearMap.range f.val) :
    kFinite τ = ⨆ (n : ℕ) (σ : ContRepresentation ℂ K (Fin n → ℂ)),
      ⨆ (_ : Continuous (fun kv : K × (Fin n → ℂ) => σ kv.1 kv.2)),
        isotypic n σ.toRepresentation τ := sorry

-- Each locally finite orbit must be smooth/continuous. Arbitrary algebraic
-- homomorphisms of a compact group need not have this decomposition.
theorem kFinite_dense [UniformSpace V] [IsUniformAddGroup V] [CompleteSpace V]
    [IsTopologicalAddGroup V]
    [ContinuousSMul ℂ V] [LocallyConvexSpace ℝ V] [T2Space V]
    (τ : ContRepresentation ℂ K V)
    (hjoint : Continuous (fun kv : K × V => τ kv.1 kv.2)) :
    Dense (kFinite τ.toRepresentation : Set V) := sorry

end KTypes

section SFCompatibility
variable {E : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E]
    [FiniteDimensional ℝ E] {H : Type*} [TopologicalSpace H]
    {I : ModelWithCorners ℝ E H} {G : Type*} [Group G] [TopologicalSpace G]
    [ChartedSpace H G] [LieGroup I ∞ G]
    {B : ℕ → Type*} [∀ n, NormedAddCommGroup (B n)] [∀ n, NormedSpace ℂ (B n)]
    [∀ n, CompleteSpace (B n)] {V : Submodule ℂ (∀ n, B n)}
    {height : G → ℝ} (π : SFRep I G B V height)

theorem SFRep.derivAction_continuous (X : TauCeti.ComplexGroupLie I G) :
    Continuous (SFRep.derivAction I G B V π X) := sorry

variable {Ek : Type*} [NormedAddCommGroup Ek] [NormedSpace ℝ Ek]
    [FiniteDimensional ℝ Ek] {Hk : Type*} [TopologicalSpace Hk]
    {Ik : ModelWithCorners ℝ Ek Hk} {K : Type*} [Group K] [TopologicalSpace K]
    [ChartedSpace Hk K] [LieGroup Ik ∞ K] [CompactSpace K]
    {q : Type*} [TauCeti.RelativeLieCohomology.NormedComplexLieAlgebra q]
    (P : TauCeti.RelativeLieCohomology.Pair Ik K q)
    (ι : K →* G) (hsmooth : ContMDiff Ik I ∞ ι)
    (φ : q ≃ₗ⁅ℂ⁆ TauCeti.ComplexGroupLie I G)
    (hφ : ∀ X : GroupLieAlgebra Ik K,
      φ (P.iota (1 ⊗ₜ[ℝ] X)) = 1 ⊗ₜ[ℝ] (mfderiv Ik I ι 1 X))
    (hAd : ∀ k X, φ (P.Ad k X) =
      TauCeti.ComplexGroupLie.ad I G (ι k) (φ X))

def SFRep.toGK (hsmooth : ContMDiff Ik I ∞ ι)
    (φ : q ≃ₗ⁅ℂ⁆ TauCeti.ComplexGroupLie I G)
    (hφ : ∀ X : GroupLieAlgebra Ik K,
      φ (P.iota (1 ⊗ₜ[ℝ] X)) = 1 ⊗ₜ[ℝ] (mfderiv Ik I ι 1 X))
    (hAd : ∀ k X, φ (P.Ad k X) = TauCeti.ComplexGroupLie.ad I G (ι k) (φ X)) :
    TauCeti.RelativeLieCohomology.GKModule P
    (SFRep.kFinite I G B V π ι) := sorry

theorem SFRep.toGK_lie (X : q) (v : SFRep.kFinite I G B V π ι) :
    ((SFRep.toGK π P ι hsmooth φ hφ hAd).rho X v).val =
      SFRep.derivAction I G B V π (φ X) v.val := sorry

def SFRep.SAF : Prop :=
  IsAdmissible (SFRep.toGK π P ι hsmooth φ hφ hAd) ∧
  IsFinitelyGenerated (SFRep.toGK π P ι hsmooth φ hφ hAd)

-- test: sfRep_kFinite_compat
example (h : SFRep.SAF π P ι hsmooth φ hφ hAd) :
    ∃ A : HCModule (P := P) (V := SFRep.kFinite I G B V π ι),
      A.toGKModule = SFRep.toGK π P ι hsmooth φ hφ hAd := sorry

end SFCompatibility
end TauCeti.RealReductive

namespace TauCeti.RelativeLieCohomology
universe uV
section Categories
variable {E : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E]
    [FiniteDimensional ℝ E] {H : Type*} [TopologicalSpace H]
    {I : ModelWithCorners ℝ E H} {K : Type*} [Group K] [TopologicalSpace K]
    [ChartedSpace H K] [LieGroup I ∞ K] [CompactSpace K]
    {q : Type*} [NormedComplexLieAlgebra q] (P : Pair I K q)

structure GKModuleCat where
  carrier : Type uV
  [addCommGroup : AddCommGroup carrier]
  [module : Module ℂ carrier]
  action : GKModule P carrier

attribute [instance] GKModuleCat.addCommGroup GKModuleCat.module

instance : CategoryTheory.Category (GKModuleCat.{uV} P) where
  Hom A B := GKModule.Hom A.action B.action
  id A := {toLinearMap := LinearMap.id, lie := by sorry, group := by sorry}
  comp f g :=
    { toLinearMap := g.toLinearMap.comp f.toLinearMap
      lie := by sorry
      group := by sorry }
  id_comp := by sorry
  comp_id := by sorry
  assoc := by sorry

instance : CategoryTheory.Preadditive (GKModuleCat.{uV} P) := sorry

/-- Kernels and cokernels carry the induced compatible, locally finite K action. -/
instance GKModule.abelian : CategoryTheory.Abelian (GKModuleCat.{uV} P) := sorry

variable {V W : Type*} [AddCommGroup V] [Module ℂ V] [AddCommGroup W] [Module ℂ W]

/-- Diagonal tensor action; finite dimensionality is needed by the HC closure
statement, not by the algebraic tensor construction itself. -/
def GKModule.tensorFinite (A : GKModule P V) (B : GKModule P W)
    [FiniteDimensional ℂ W] : GKModule P (V ⊗[ℂ] W) := sorry

theorem GKModule.tensorFinite_lie (A : GKModule P V) (B : GKModule P W)
    [FiniteDimensional ℂ W] (X : q) (v : V) (w : W) :
    (GKModule.tensorFinite P A B).rho X (v ⊗ₜ[ℂ] w) =
      (A.rho X v) ⊗ₜ[ℂ] w + v ⊗ₜ[ℂ] (B.rho X w) := sorry

theorem GKModule.tensorFinite_group (A : GKModule P V) (B : GKModule P W)
    [FiniteDimensional ℂ W] (k : K) (v : V) (w : W) :
    (GKModule.tensorFinite P A B).sigma k (v ⊗ₜ[ℂ] w) =
      (A.sigma k v) ⊗ₜ[ℂ] (B.sigma k w) := sorry

end Categories
end TauCeti.RelativeLieCohomology

namespace TauCeti.RealReductive
section HCCategory
variable {E : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E]
    [FiniteDimensional ℝ E] {H : Type*} [TopologicalSpace H]
    {I : ModelWithCorners ℝ E H} {K : Type*} [Group K] [TopologicalSpace K]
    [ChartedSpace H K] [LieGroup I ∞ K] [CompactSpace K]
    {q : Type*} [TauCeti.RelativeLieCohomology.NormedComplexLieAlgebra q]
    (P : TauCeti.RelativeLieCohomology.Pair I K q)

def hcProperty : CategoryTheory.ObjectProperty (TauCeti.RelativeLieCohomology.GKModuleCat P) :=
  fun A => IsAdmissible A.action ∧ IsFinitelyGenerated A.action

abbrev HCModuleCat := (hcProperty P).FullSubcategory

instance HCModule.abelian : CategoryTheory.Abelian (HCModuleCat P) := sorry

variable {V : Type*} [AddCommGroup V] [Module ℂ V]

def trivialInfChar : InfChar q :=
  (UniversalEnvelopingAlgebra.lift ℂ (0 : q →ₗ⁅ℂ⁆ ℂ)).comp (Subalgebra.center ℂ
    (UniversalEnvelopingAlgebra ℂ q)).val

def HCModule.trivial : HCModule (P := P) (V := ℂ) where
  toGKModule := TauCeti.RelativeLieCohomology.GKModule.trivial P
  admissible := sorry
  finitelyGenerated := sorry

-- test: hcModule_trivial
example : HasInfChar (HCModule.trivial P).toGKModule (trivialInfChar (q := q)) := sorry

-- Finite-dimensional compatible modules are HC; the algebraic highest-weight
-- identification further requires the integral group character lattice.
def HCModule.ofFiniteDimensional [FiniteDimensional ℂ V]
    (A : TauCeti.RelativeLieCohomology.GKModule P V) : HCModule (P := P) (V := V) where
  toGKModule := A
  admissible := sorry
  finitelyGenerated := sorry

-- test: hcModule_finiteDim, the native finite-dimensional compatible-module carrier.
example [FiniteDimensional ℂ V] (A : TauCeti.RelativeLieCohomology.GKModule P V) :
    (HCModule.ofFiniteDimensional P A).toGKModule = A := sorry

end HCCategory
end TauCeti.RealReductive

namespace TauCeti.RelativeLieCohomology.AbsoluteLie
universe uA
open CategoryTheory
section
variable (k L V : Type uA) [Field k] [CharZero k] [LieRing L] [LieAlgebra k L]
    [AddCommGroup V] [Module k V] [LieRingModule L V] [LieModule k L V]

/-- All degrees of the absolute Chevalley–Eilenberg complex. -/
abbrev cochains (n : ℕ) := AlternatingMap k L V (Fin n)

def differential (n : ℕ) : cochains k L V n →ₗ[k] cochains k L V (n+1) := sorry

theorem differential_zero (w : cochains k L V 0) (x : Fin 1 → L) :
    differential k L V 0 w x = ⁅x 0, w Fin.elim0⁆ := sorry

theorem differential_succ (n : ℕ) (w : cochains k L V (n+1)) (x : Fin (n+2) → L) :
    differential k L V (n+1) w x =
      (∑ i : Fin (n+2), (-1 : k)^i.val • ⁅x i, w (fun t => x (i.succAbove t))⁆) +
      ∑ i : Fin (n+2), ∑ j : Fin (n+1),
        if i.val < (i.succAbove j).val then
          (-1 : k)^(i.val + (i.succAbove j).val) •
            w (Fin.cons ⁅x i, x (i.succAbove j)⁆
              (fun t : Fin n => x (i.succAbove (j.succAbove t))))
        else 0 := sorry

theorem d_comp_d (n : ℕ) :
    (differential k L V (n+1)).comp (differential k L V n) = 0 := sorry

def complex : CochainComplex (ModuleCat k) ℕ :=
  CochainComplex.of (fun n => ModuleCat.of k (cochains k L V n))
    (fun n => ModuleCat.ofHom (differential k L V n)) (by sorry)

def oneEquivMathlib : cochains k L V 1 ≃ₗ[k] LieModule.Cohomology.oneCochain k L V := sorry

def twoEquivMathlib : cochains k L V 2 ≃ₗ[k] LieModule.Cohomology.twoCochain k L V := sorry

theorem lowDegree_compat (w : cochains k L V 1) :
    twoEquivMathlib k L V (differential k L V 1 w) =
      LieModule.Cohomology.d₁₂ k L V (oneEquivMathlib k L V w) := sorry

def map {W : Type uA} [AddCommGroup W] [Module k W] [LieRingModule L W] [LieModule k L W]
    (f : V →ₗ⁅k,L⁆ W) : complex k L V ⟶ complex k L W := sorry

theorem map_id : map k L V ((LieModuleHom.id : V →ₗ⁅k,L⁆ V)) = 𝟙 (complex k L V) := sorry

-- test: absoluteCochains_abelian
example [IsLieAbelian L] [LieModule.IsTrivial L V] (n : ℕ) :
    differential k L V n = 0 := sorry

-- test: absoluteCochains_zero, positive-degree cochains on the zero Lie algebra.
example [Subsingleton L] (n : ℕ) (hn : 0 < n) : Subsingleton (cochains k L V n) := sorry

-- test: absoluteCochains_lowDegree, compare the existing degree-one differential.
example (w : cochains k L V 1) (x y : L) :
    (twoEquivMathlib k L V (differential k L V 1 w)) x y =
      ⁅x, oneEquivMathlib k L V w y⁆ - ⁅y, oneEquivMathlib k L V w x⁆ -
        oneEquivMathlib k L V w ⁅x,y⁆ := sorry

end
end TauCeti.RelativeLieCohomology.AbsoluteLie

namespace TauCeti.Automorphic
section AutomorphicSpaces
variable {E : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]
  {H : Type*} [TopologicalSpace H] (I : ModelWithCorners ℝ E H)
  {Ginf : Type*} [Group Ginf] [TopologicalSpace Ginf] [ChartedSpace H Ginf]
  [LieGroup I ∞ Ginf] {Gf : Type*} [Group Gf] [TopologicalSpace Gf]
  [IsTopologicalGroup Gf] [LocallyCompactSpace Gf] [T2Space Gf] [TotallyDisconnectedSpace Gf]
  {K : Type*} [Group K] (ι : K →* Ginf)
local notation "Sm" => SmoothAdelicFunction (Ginf := Ginf) (Gf := Gf) I
local notation "U" => UniversalEnvelopingAlgebra ℂ (TauCeti.ComplexGroupLie I Ginf)
local notation "Z" => Subalgebra.center ℂ U

def rightKAction (ι : K →* Ginf) : Representation ℂ K Sm := sorry

theorem rightKAction_apply (k : K) (f : Sm) (g : Ginf × Gf) :
    (rightKAction I ι k f).val g = f.val (g * (ι k, 1)) := sorry

def IsZFiniteFunction (f : Sm) : Prop :=
  ∃ J : Ideal Z, FiniteDimensional ℂ (Z ⧸ J) ∧
    ∀ z : Z, z ∈ J → SmoothAdelicFunction.envelopingAction I z.val f = 0

/-- Arithmetic point maps, the height and the compact subgroup are supplier inputs. -/
def AutomorphicForm (height : Ginf × Gf → ℝ) (Γ : Subgroup (Ginf × Gf)) :
    Submodule ℂ Sm where
  carrier := {f | (∀ γ : Γ, ∀ g, f.val (γ.val * g) = f.val g) ∧
    f ∈ TauCeti.RealReductive.kFinite (rightKAction I ι) ∧
    IsZFiniteFunction I f ∧ HasModerateGrowth height f.val}
  zero_mem' := sorry
  add_mem' := sorry
  smul_mem' := sorry

theorem AutomorphicForm.leftInvariant (height : Ginf × Gf → ℝ)
    (Γ : Subgroup (Ginf × Gf)) (f : AutomorphicForm I ι height Γ) (γ : Γ) (g : Ginf × Gf) :
    f.val.val (γ.val * g) = f.val.val g := sorry

theorem AutomorphicForm.exists_level (height : Ginf × Gf → ℝ)
    (Γ : Subgroup (Ginf × Gf)) (f : AutomorphicForm I ι height Γ) :
    ∃ J : Subgroup Gf, IsCompact (J : Set Gf) ∧ IsOpen (J : Set Gf) ∧
      ∀ g j, j ∈ J → f.val.val (g * (1,j)) = f.val.val g := sorry

theorem AutomorphicForm.exists_ideal (height : Ginf × Gf → ℝ)
    (Γ : Subgroup (Ginf × Gf)) (f : AutomorphicForm I ι height Γ) :
    ∃ J : Ideal Z, FiniteDimensional ℂ (Z ⧸ J) ∧
      ∀ z : Z, z ∈ J → SmoothAdelicFunction.envelopingAction I z.val f.val = 0 := sorry

def AutomorphicForm.withCentralChar (height : Ginf × Gf → ℝ)
    (Γ : Subgroup (Ginf × Gf)) (C : Subgroup (Ginf × Gf)) (χ : C →* ℂˣ) :
    Submodule ℂ (AutomorphicForm I ι height Γ) where
  carrier := {f | ∀ z : C, ∀ g, f.val.val (g * z.val) = (χ z : ℂ) * f.val.val g}
  zero_mem' := sorry
  add_mem' := sorry
  smul_mem' := sorry

/-- A finite collection of full K-types, rather than just one-dimensional characters. -/
def AutomorphicForm.fixedType (height : Ginf × Gf → ℝ)
    (Γ : Subgroup (Ginf × Gf)) (Jf : Subgroup Gf) (J : Ideal Z)
    {m : ℕ} (types : Fin m → Σ n : ℕ, Representation ℂ K (Fin n → ℂ)) :
    Submodule ℂ (AutomorphicForm I ι height Γ) where
  carrier := {f | (∀ g j, j ∈ Jf → f.val.val (g * (1,j)) = f.val.val g) ∧
    (∀ z : Z, z ∈ J → SmoothAdelicFunction.envelopingAction I z.val f.val = 0) ∧
    f.val ∈ ⨆ t : Fin m,
      TauCeti.RealReductive.isotypic (types t).1 (types t).2 (rightKAction I ι)}
  zero_mem' := sorry
  add_mem' := sorry
  smul_mem' := sorry

/-- The analytic common-exponent theorem is recorded separately from the definition. -/
def AutomorphicForm.toUniformModerateGrowth (height : Ginf × Gf → ℝ)
    (Γ : Subgroup (Ginf × Gf)) (h1 : ∀ g, 1 ≤ height g)
    (hUM : ∀ f : AutomorphicForm I ι height Γ, ∃ N : ℕ,
      f.val ∈ UniformModerateGrowth I height Γ N) :
    AutomorphicForm I ι height Γ →ₗ[ℂ] UniformModerateGrowth.all I height Γ := sorry

theorem AutomorphicForm.toUniformModerateGrowth_apply (height : Ginf × Gf → ℝ)
    (Γ : Subgroup (Ginf × Gf)) (h1 : ∀ g, 1 ≤ height g)
    (hUM : ∀ f : AutomorphicForm I ι height Γ, ∃ N : ℕ,
      f.val ∈ UniformModerateGrowth I height Γ N) (f : AutomorphicForm I ι height Γ) :
    (AutomorphicForm.toUniformModerateGrowth I ι height Γ h1 hUM f).val = f.val := sorry

def SmoothAutomorphicForm (height : Ginf × Gf → ℝ) (Γ : Subgroup (Ginf × Gf)) :
    Submodule ℂ (UniformModerateGrowth.all I height Γ) where
  carrier := {f | IsZFiniteFunction I f.val}
  zero_mem' := sorry
  add_mem' := sorry
  smul_mem' := sorry

def SmoothAutomorphicForm.rightTranslate (height : Ginf × Gf → ℝ)
    (Γ : Subgroup (Ginf × Gf)) (hy : ∀ x y, height (x*y) ≤ height x * height y)
    (h1 : ∀ g, 1 ≤ height g) (y : Ginf × Gf) :
    SmoothAutomorphicForm I height Γ →ₗ[ℂ] SmoothAutomorphicForm I height Γ := sorry

theorem SmoothAutomorphicForm.rightTranslate_apply (height : Ginf × Gf → ℝ)
    (Γ : Subgroup (Ginf × Gf)) (hy : ∀ x y, height (x*y) ≤ height x * height y)
    (h1 : ∀ g, 1 ≤ height g) (y : Ginf × Gf) (f : SmoothAutomorphicForm I height Γ) (g : Ginf × Gf) :
    (SmoothAutomorphicForm.rightTranslate I height Γ hy h1 y f).val.val.val g =
      f.val.val.val (g*y) := sorry

-- test: automorphicForm_const; augmentation of the derived action kills constants.
example (height : Ginf × Gf → ℝ) (Γ : Subgroup (Ginf × Gf)) (h1 : ∀ g, 1 ≤ height g) :
    (⟨fun _ => 1, by sorry⟩ : Sm) ∈ AutomorphicForm I ι height Γ := sorry

-- test: smoothAutomorphic_const
example (height : Ginf × Gf → ℝ) (Γ : Subgroup (Ginf × Gf)) (h1 : ∀ g, 1 ≤ height g) :
    ∃ f : SmoothAutomorphicForm I height Γ, ∀ g, f.val.val.val g = 1 := sorry

-- test: smoothAutomorphic_carrier_obstruction, the precise membership criterion.
-- The GL2 convergent K-type sum must separately construct a vector with this property.
example (height : Ginf × Gf → ℝ) (Γ : Subgroup (Ginf × Gf))
    (f : SmoothAutomorphicForm I height Γ)
    (hf : ¬FiniteDimensional ℂ (Submodule.span ℂ
      (Set.range (fun k => rightKAction I ι k f.val.val)))) :
    f.val.val ∉ AutomorphicForm I ι height Γ := sorry

end AutomorphicSpaces
end TauCeti.Automorphic

namespace TauCeti.Automorphic
section ConstantTerms
open MeasureTheory
variable {G : Type*} [Group G] [TopologicalSpace G] [IsTopologicalGroup G]
  [T2Space G] (Γ : Subgroup G) (N : Subgroup G)

/-- Left arithmetic cosets Γ_N\\N use rightRel in Mathlib's coset convention. -/
def UnipotentQuotient := Quotient (QuotientGroup.rightRel (Γ.comap N.subtype))

instance : TopologicalSpace (UnipotentQuotient Γ N) := by
  unfold UnipotentQuotient
  infer_instance
instance : MeasurableSpace (UnipotentQuotient Γ N) := borel _
instance : BorelSpace (UnipotentQuotient Γ N) := ⟨rfl⟩

def UnipotentQuotient.mk (n : N) : UnipotentQuotient Γ N := Quotient.mk _ n

def UnipotentQuotient.rightMul (n : N) : UnipotentQuotient Γ N → UnipotentQuotient Γ N :=
  Quotient.map (fun x : N => x * n) (by sorry)

/-- A probability measure with actual right-N invariance, on the actual quotient. -/
structure QuotientProbability where
  measure : Measure (UnipotentQuotient Γ N)
  probability : IsProbabilityMeasure measure
  rightInvariant : ∀ n : N, MeasurePreserving (UnipotentQuotient.rightMul Γ N n) measure measure

attribute [instance] QuotientProbability.probability

def ContinuousInvariant : Submodule ℂ (G → ℂ) where
  carrier := {f | Continuous f ∧ ∀ γ : Γ, ∀ g, f (γ.val * g) = f g}
  zero_mem' := sorry
  add_mem' := sorry
  smul_mem' := sorry

def quotientIntegrand (f : ContinuousInvariant Γ) (g : G) : UnipotentQuotient Γ N → ℂ :=
  Quotient.lift (fun n : N => f (n.val*g)) (by sorry)

theorem quotientIntegrand_mk (f : ContinuousInvariant Γ) (g : G) (n : N) :
    quotientIntegrand Γ N f g (UnipotentQuotient.mk Γ N n) = f (n.val*g) := sorry

def constantTerm [CompactSpace (UnipotentQuotient Γ N)] (dn : QuotientProbability Γ N) :
    ContinuousInvariant Γ →ₗ[ℂ] (G → ℂ) where
  toFun f g := ∫ x, quotientIntegrand Γ N f g x ∂dn.measure
  map_add' := sorry
  map_smul' := sorry

theorem constantTerm_integrable [CompactSpace (UnipotentQuotient Γ N)]
    (dn : QuotientProbability Γ N) (f : ContinuousInvariant Γ) (g : G) :
    Integrable (quotientIntegrand Γ N f g) dn.measure := sorry

theorem constantTerm_const [CompactSpace (UnipotentQuotient Γ N)]
    (dn : QuotientProbability Γ N) (c : ℂ) (g : G) :
    constantTerm Γ N dn ⟨fun _ => c, by sorry⟩ g = c := sorry

theorem constantTerm_leftUnipotent [CompactSpace (UnipotentQuotient Γ N)]
    (dn : QuotientProbability Γ N) (f : ContinuousInvariant Γ) (n : N) (g : G) :
    constantTerm Γ N dn f (n.val*g) = constantTerm Γ N dn f g := sorry

def ContinuousInvariant.rightTranslate (y : G) : ContinuousInvariant Γ →ₗ[ℂ] ContinuousInvariant Γ :=
  { toFun := fun f => ⟨fun g => f (g*y), by sorry⟩
    map_add' := by sorry
    map_smul' := by sorry }

theorem constantTerm_rightTranslate [CompactSpace (UnipotentQuotient Γ N)]
    (dn : QuotientProbability Γ N) (f : ContinuousInvariant Γ) (y g : G) :
    constantTerm Γ N dn (ContinuousInvariant.rightTranslate Γ y f) g =
      constantTerm Γ N dn f (g*y) := sorry

-- test: constantTerm_const
example [CompactSpace (UnipotentQuotient Γ N)] (dn : QuotientProbability Γ N) (g : G) :
    constantTerm Γ N dn ⟨fun _ => 1, by sorry⟩ g = 1 := sorry

-- test: constantTerm_top; P=G has N=1, and is excluded from cuspidality tests.
example (dn : QuotientProbability Γ (⊥ : Subgroup G))
    [CompactSpace (UnipotentQuotient Γ (⊥ : Subgroup G))] (f : ContinuousInvariant Γ) :
    constantTerm Γ (⊥ : Subgroup G) dn f = f.val := sorry

-- test: constantTerm_not_full_N, Haar mass of a noncompact N is infinite.
example [MeasurableSpace N] (ν : Measure N) [ν.IsHaarMeasure] (hν : ν Set.univ = ⊤) :
    ¬Integrable (fun _ : N => (1 : ℂ)) ν := sorry

end ConstantTerms
end TauCeti.Automorphic

namespace TauCeti.Automorphic
section CentralAlgebraicForms
variable {A : Type*} [CommRing A] {M : Type*} [AddCommGroup M] [Module A M]
  {G : Type*} [Group G] (Γ C J : Subgroup G) (σ : Representation A J M) (ψ : C →* Aˣ)

/-- The central character is the right-translation character: R(z)f=ψ(z)f. -/
def CentralCharacterAlgebraicModularForm : Submodule A (G → M) where
  carrier := {f | ∀ (γ : Γ) (g : G) (z : C) (u : J),
    f (γ.val*g*z.val*u.val) = (ψ z : A) • σ u⁻¹ (f g)}
  zero_mem' := sorry
  add_mem' := sorry
  smul_mem' := sorry

def CentralCharacterAlgebraicModularForm.stabilizerValues (t : G) : Submodule A M where
  carrier := {v | ∀ (γ : Γ) (z : C) (u : J), γ.val*t*z.val*u.val = t →
    (ψ z : A) • σ u⁻¹ v = v}
  zero_mem' := sorry
  add_mem' := sorry
  smul_mem' := sorry

/-- The group acting on values, after central triples acting trivially have descended. -/
def CentralCharacterAlgebraicModularForm.effectiveStabilizer (t : G) :
    Subgroup (Units (Module.End A M)) :=
  Subgroup.closure {a | ∃ (γ : Γ) (z : C) (u : J), γ.val*t*z.val*u.val = t ∧
    a = Units.map (algebraMap A (Module.End A M)).toMonoidHom (ψ z) * σ.asGroupHom u⁻¹}

def CentralCharacterAlgebraicModularForm.equivSum {h : ℕ} (t : Fin h → G)
    (hC : ∀ z : C, ∀ g : G, z.val*g = g*z.val)
    (hreps : ∀ g, ∃ i γ z u, g = (γ : Γ).val*t i*(z : C).val*(u : J).val)
    (hsep : ∀ i j γ z u, (γ : Γ).val*t i*(z : C).val*(u : J).val = t j → i=j) :
    CentralCharacterAlgebraicModularForm Γ C J σ ψ ≃ₗ[A]
      ∀ i : Fin h, CentralCharacterAlgebraicModularForm.stabilizerValues Γ C J σ ψ (t i) := sorry

theorem CentralCharacterAlgebraicModularForm.equivSum_apply {h : ℕ} (t : Fin h → G)
    (hC : ∀ z : C, ∀ g : G, z.val*g = g*z.val)
    (hreps : ∀ g, ∃ i γ z u, g = (γ : Γ).val*t i*(z : C).val*(u : J).val)
    (hsep : ∀ i j γ z u, (γ : Γ).val*t i*(z : C).val*(u : J).val = t j → i=j)
    (f : CentralCharacterAlgebraicModularForm Γ C J σ ψ) (i : Fin h) :
    (CentralCharacterAlgebraicModularForm.equivSum Γ C J σ ψ t hC hreps hsep f i).val = f.val (t i) := sorry

def CentralCharacterAlgebraicModularForm.res {J' : Subgroup G} (h : J' ≤ J) :
    CentralCharacterAlgebraicModularForm Γ C J σ ψ →ₗ[A]
      CentralCharacterAlgebraicModularForm Γ C J' (σ.comp (Subgroup.inclusion h)) ψ := sorry

theorem CentralCharacterAlgebraicModularForm.res_apply {J' : Subgroup G} (h : J' ≤ J)
    (f : CentralCharacterAlgebraicModularForm Γ C J σ ψ) (g : G) :
    (CentralCharacterAlgebraicModularForm.res Γ C J σ ψ h f).val g = f.val g := sorry

/-- The coefficient action is genuinely extended to a Hecke semigroup. -/
def CentralCharacterAlgebraicModularForm.hecke (S : Submonoid G)
    (ιJ : J →* S) (hι : ∀ u : J, (ιJ u).val = u.val) (ρ : Representation A S M)
    (hρ : ∀ u, ρ (ιJ u) = σ u) (hcomm : ∀ s z v, ρ s ((ψ z : A) • v) = (ψ z : A) • ρ s v)
    (g : S) (reps : Finset S)
    (hcosets : ∀ x : G, (∃ u v : J, x=u.val*g.val*v.val) ↔
      ∃ r ∈ reps, ∃ u : J, x=r.val*u.val)
    (hdisjoint : ∀ r ∈ reps, ∀ r' ∈ reps, ∀ u : J, r.val*u.val=r'.val → r=r')
    (hC : ∀ z : C, ∀ x : G, z.val*x=x*z.val) :
    CentralCharacterAlgebraicModularForm Γ C J σ ψ →ₗ[A]
      CentralCharacterAlgebraicModularForm Γ C J σ ψ := sorry

theorem CentralCharacterAlgebraicModularForm.hecke_apply (S : Submonoid G)
    (ιJ : J →* S) (hι : ∀ u : J, (ιJ u).val = u.val) (ρ : Representation A S M)
    (hρ : ∀ u, ρ (ιJ u) = σ u) (hcomm : ∀ s z v, ρ s ((ψ z : A) • v) = (ψ z : A) • ρ s v)
    (g : S) (reps : Finset S)
    (hcosets : ∀ x : G, (∃ u v : J, x=u.val*g.val*v.val) ↔
      ∃ r ∈ reps, ∃ u : J, x=r.val*u.val)
    (hdisjoint : ∀ r ∈ reps, ∀ r' ∈ reps, ∀ u : J, r.val*u.val=r'.val → r=r')
    (hC : ∀ z : C, ∀ x : G, z.val*x=x*z.val)
    (f : CentralCharacterAlgebraicModularForm Γ C J σ ψ) (x : G) :
    (CentralCharacterAlgebraicModularForm.hecke Γ C J σ ψ S ιJ hι ρ hρ hcomm g reps hcosets hdisjoint hC f).val x =
      ∑ r ∈ reps, ρ r (f.val (x*r.val)) := sorry

def CentralCharacterAlgebraicModularForm.trace {J' : Subgroup G} (h : J' ≤ J) (reps : Finset J)
    (hcosets : ∀ u : J, ∃ r ∈ reps, ∃ v : J', u.val=r.val*v.val)
    (hdisjoint : ∀ r ∈ reps, ∀ r' ∈ reps, ∀ v : J', r.val*v.val=r'.val → r=r') :
    CentralCharacterAlgebraicModularForm Γ C J' (σ.comp (Subgroup.inclusion h)) ψ →ₗ[A]
      CentralCharacterAlgebraicModularForm Γ C J σ ψ := sorry

theorem CentralCharacterAlgebraicModularForm.trace_apply {J' : Subgroup G} (h : J' ≤ J) (reps : Finset J)
    (hcosets : ∀ u : J, ∃ r ∈ reps, ∃ v : J', u.val=r.val*v.val)
    (hdisjoint : ∀ r ∈ reps, ∀ r' ∈ reps, ∀ v : J', r.val*v.val=r'.val → r=r')
    (f : CentralCharacterAlgebraicModularForm Γ C J' (σ.comp (Subgroup.inclusion h)) ψ) (x : G) :
    (CentralCharacterAlgebraicModularForm.trace Γ C J σ ψ h reps hcosets hdisjoint f).val x =
      ∑ u ∈ reps, σ u (f.val (x*u.val)) := sorry

-- test: centralAMF_split_torus; quotient by the whole centre has one class.
example (Γ J : Subgroup G) :
    CentralCharacterAlgebraicModularForm Γ (⊤ : Subgroup G) J (Representation.trivial A J A) 1 ≃ₗ[A] A := sorry

-- test: centralAMF_trivial_centre
example : CentralCharacterAlgebraicModularForm Γ (⊥ : Subgroup G) J σ 1 =
    LevelAlgebraicModularForm Γ.subtype J σ := sorry

-- test: centralAMF_incompatible; overlap compatibility cannot be dropped.
example (z : C) (u : J) (hzu : z.val=u.val) (a : A)
    (hσ : ∀ v : M, σ u v = a • v) (ha : IsUnit (a*(ψ z : A)-1))
    (f : CentralCharacterAlgebraicModularForm Γ C J σ ψ) : f=0 := sorry
end CentralAlgebraicForms
end TauCeti.Automorphic

namespace TauCeti.RealReductive

/-- Coordinates z j^ε, with the nonsplit multiplication written explicitly. -/
def WeilGroupReal := ℂˣ × Bool

namespace WeilGroupReal

def conjugateUnit (z : ℂˣ) : ℂˣ := Units.map Complex.conjAe.toRingHom.toMonoidHom z

instance : Group WeilGroupReal where
  one := (1, false)
  mul x y := (x.1 * (if x.2 then conjugateUnit y.1 else y.1) *
    (if x.2 && y.2 then -1 else 1), xor x.2 y.2)
  inv x := (if x.2 then -conjugateUnit x.1⁻¹ else x.1⁻¹, x.2)
  mul_assoc := sorry
  one_mul := sorry
  mul_one := sorry
  inv_mul_cancel := sorry

instance : TopologicalSpace WeilGroupReal := inferInstanceAs (TopologicalSpace (ℂˣ × Bool))
instance : IsTopologicalGroup WeilGroupReal := sorry

def inclusion : ℂˣ →* WeilGroupReal where
  toFun z := (z, false)
  map_one' := sorry
  map_mul' := sorry

def j : WeilGroupReal := (1, true)

def component : WeilGroupReal →* Multiplicative (ZMod 2) := sorry

theorem component_apply (x : WeilGroupReal) :
    component x = Multiplicative.ofAdd (if x.2 then 1 else 0) := sorry

def norm : WeilGroupReal →* ℝˣ := sorry

theorem norm_inclusion (z : ℂˣ) : (norm (inclusion z) : ℝ) = Complex.normSq z.val := sorry

theorem norm_j : norm j = -1 := sorry

/-- The unambiguous form of z^p z̄^q uses an angular integer and a radial exponent. -/
def complexCharacter (n : ℤ) (s : ℂ) : ℂˣ →* ℂˣ := sorry

theorem complexCharacter_apply (n : ℤ) (s : ℂ) (z : ℂˣ) :
    (complexCharacter n s z : ℂ) =
      (z.val / (‖z.val‖ : ℂ)) ^ n * Complex.exp (s * (Real.log ‖z.val‖ : ℂ)) := sorry

def induced (n : ℤ) (s : ℂ) : Representation ℂ WeilGroupReal (Fin 2 → ℂ) := sorry

theorem induced_inclusion (n : ℤ) (s : ℂ) (z : ℂˣ) (v : Fin 2 → ℂ) :
    induced n s (inclusion z) v =
      ![(complexCharacter n s z : ℂ) * v 0,
        (complexCharacter (-n) s z : ℂ) * v 1] := sorry

theorem induced_j (n : ℤ) (s : ℂ) (v : Fin 2 → ℂ) :
    induced n s j v = ![((-1 : ℂ)^n)*v 1, v 0] := sorry

def restrict_complex {V : Type*} [AddCommGroup V] [Module ℂ V]
    (ρ : Representation ℂ WeilGroupReal V) : Representation ℂ ℂˣ V := ρ.comp inclusion

def IsTempered {V : Type*} [NormedAddCommGroup V] [NormedSpace ℂ V]
    (ρ : ContRepresentation ℂ WeilGroupReal V) : Prop :=
  IsCompact (closure (Set.range ρ))

theorem irreducible_classification {V : Type*} [NormedAddCommGroup V] [NormedSpace ℂ V]
    [FiniteDimensional ℂ V] (ρ : ContRepresentation ℂ WeilGroupReal V)
    (hρ : TauCeti.RealReductive.IsIrreducible ρ.toRepresentation)
    (hc : Continuous (fun x : WeilGroupReal × V => ρ x.1 x.2)) :
    (∃ (χ : ℝˣ →* ℂˣ) (e : V ≃ₗ[ℂ] ℂ), Continuous χ ∧
      ∀ w v, e (ρ w v) = (χ (norm w) : ℂ) * e v) ∨
    (∃ (n : ℤ) (s : ℂ) (e : V ≃ₗ[ℂ] (Fin 2 → ℂ)), n ≠ 0 ∧
      ∀ w v, e (ρ w v) = induced n s w (e v)) := sorry

-- test: weilReal_j_sq
example : j*j = inclusion (-1) ∧ ∀ z, j*inclusion z*j⁻¹ = inclusion (conjugateUnit z) := sorry

-- test: weilReal_ab; the universal property identifies the abelianization.
example {B : Type*} [CommGroup B] (f : WeilGroupReal →* B) :
    ∃! h : ℝˣ →* B, h.comp norm = f := sorry

-- test: weilComplex_irreducible_dim_one
example {V : Type*} [NormedAddCommGroup V] [NormedSpace ℂ V] [FiniteDimensional ℂ V]
    (ρ : ContRepresentation ℂ ℂˣ V) (hρ : TauCeti.RealReductive.IsIrreducible ρ.toRepresentation) :
    Module.finrank ℂ V = 1 := sorry

-- test: weilReal_not_split
example (w : WeilGroupReal) (hw : w.2 = true) : w*w ≠ 1 := sorry

-- test: weilReal_normCharacter, explicit composition through the real norm.
example (χ : ℝˣ →* ℂˣ) (w : WeilGroupReal) : (χ.comp norm) w = χ (norm w) := sorry

end WeilGroupReal
end TauCeti.RealReductive

namespace TauCeti.VanEst
open CategoryTheory
section Continuous
variable {𝕜 : Type} [RCLike 𝕜]
variable {G : Type} [Group G] [TopologicalSpace G] [IsTopologicalGroup G]
  {V : Type} [NormedAddCommGroup V] [NormedSpace 𝕜 V]
  (ρ : ContRepresentation 𝕜 G V)

/-- Homogeneous cochains with the entire group, including its components. -/
def continuousCochain (n : ℕ) : Submodule 𝕜 C((Fin (n+1) → G), V) where
  carrier := {f | ∀ g x, f (fun i => g*x i) = ρ g (f x)}
  zero_mem' := sorry
  add_mem' := sorry
  smul_mem' := sorry

def continuousDifferential (n : ℕ) : continuousCochain ρ n →ₗ[𝕜] continuousCochain ρ (n+1) := sorry

theorem continuousDifferential_apply (n : ℕ) (f : continuousCochain ρ n) (x : Fin (n+2) → G) :
    (continuousDifferential ρ n f).val x =
      ∑ i : Fin (n+2), (-1 : 𝕜)^i.val • f.val (fun j => x (i.succAbove j)) := sorry

theorem continuousDifferential_squared (n : ℕ) :
    (continuousDifferential ρ (n+1)).comp (continuousDifferential ρ n) = 0 := sorry

def continuousCochains : CochainComplex (ModuleCat 𝕜) ℕ :=
  CochainComplex.of (fun n => ModuleCat.of 𝕜 (continuousCochain ρ n))
    (fun n => ModuleCat.ofHom (continuousDifferential ρ n)) (by sorry)

/-- Compact-open currying is the missing bridge, rather than a second cohomology theory. -/
def continuousCochainsEquivMathlib [LocallyCompactSpace G] (n : ℕ) :
    continuousCochain ρ n ≃ₗ[𝕜] (TopRep.homogeneousCochains (TopRep.of ρ)).X n := sorry

theorem continuousCochainsEquivMathlib_d [LocallyCompactSpace G] (n : ℕ)
    (f : continuousCochain ρ n) :
    continuousCochainsEquivMathlib ρ (n+1) (continuousDifferential ρ n f) =
      ((TopRep.homogeneousCochains (TopRep.of ρ)).d n (n+1)).hom
        (continuousCochainsEquivMathlib ρ n f) := sorry

def cochains_map {G' : Type} [Group G'] [TopologicalSpace G'] [IsTopologicalGroup G']
    {W : Type} [NormedAddCommGroup W] [NormedSpace 𝕜 W]
    (τ : ContRepresentation 𝕜 G' W) (h : G' →* G) (hc : Continuous h)
    (T : V →L[𝕜] W) (hT : ∀ g v, T (ρ (h g) v) = τ g (T v)) (n : ℕ) :
    continuousCochain ρ n →ₗ[𝕜] continuousCochain τ n := sorry

theorem cochains_map_apply {G' : Type} [Group G'] [TopologicalSpace G'] [IsTopologicalGroup G']
    {W : Type} [NormedAddCommGroup W] [NormedSpace 𝕜 W]
    (τ : ContRepresentation 𝕜 G' W) (h : G' →* G) (hc : Continuous h)
    (T : V →L[𝕜] W) (hT : ∀ g v, T (ρ (h g) v) = τ g (T v)) (n : ℕ)
    (f : continuousCochain ρ n) (x : Fin (n+1) → G') :
    (cochains_map ρ τ h hc T hT n f).val x = T (f.val (fun i => h (x i))) := sorry

-- test: continuousCochains_compact
example [CompactSpace G] [FiniteDimensional 𝕜 V] (n : ℕ) (hn : 0 < n)
    (f : continuousCochain ρ n) (hf : continuousDifferential ρ n f = 0) :
    ∃ b : continuousCochain ρ (n-1), HEq (continuousDifferential ρ (n-1) b) f := sorry

-- test: continuousCochains_mathlib_compat
example [LocallyCompactSpace G] (v : ρ.invariants) :
    let f : continuousCochain ρ 0 :=
      ⟨ContinuousMap.const (Fin 1 → G) v.val, by sorry⟩
    ContinuousCohomology.d₀kerIso (TopRep.of ρ)
      ⟨continuousCochainsEquivMathlib ρ 0 f, by sorry⟩ = v := sorry
end Continuous

section Smooth
variable {E : Type} [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]
  {G : Type} [Group G] [TopologicalSpace G] [ChartedSpace E G]
  [LieGroup 𝓘(ℝ,E) ∞ G]
  {V : Type} [NormedAddCommGroup V] [NormedSpace ℂ V] [FiniteDimensional ℂ V]
  (ρ : ContRepresentation ℂ G V)

def smoothCochain (n : ℕ) : Submodule ℂ (continuousCochain ρ n) where
  carrier := {f | ContMDiff (ModelWithCorners.pi fun _ : Fin (n+1) => 𝓘(ℝ,E))
    𝓘(ℝ,V) ∞ f.val}
  zero_mem' := sorry
  add_mem' := sorry
  smul_mem' := sorry

def smoothDifferential (n : ℕ) : smoothCochain (E := E) ρ n →ₗ[ℂ] smoothCochain (E := E) ρ (n+1) := sorry

theorem smoothDifferential_val (n : ℕ) (f : smoothCochain (E := E) ρ n) :
    (smoothDifferential (E := E) ρ n f).val = continuousDifferential ρ n f.val := sorry

def smoothCochains : CochainComplex (ModuleCat ℂ) ℕ :=
  CochainComplex.of (fun n => ModuleCat.of ℂ (smoothCochain (E := E) ρ n))
    (fun n => ModuleCat.ofHom (smoothDifferential (E := E) ρ n)) (by sorry)

def smoothingInclusion : smoothCochains (E := E) ρ ⟶ continuousCochains ρ := sorry

/-- Exactness on the quotient ker(d)/im(d) is stated directly; no opaque quasi-isomorphism field. -/
theorem smoothing_surjective
    (hρ : ∀ v, ContMDiff 𝓘(ℝ,E) 𝓘(ℝ,V) ∞ (fun g => ρ g v)) (n : ℕ)
    (f : continuousCochain ρ n) (hf : continuousDifferential ρ n f = 0) :
    ∃ s : smoothCochain (E := E) ρ n, continuousDifferential ρ n s.val = 0 ∧
      (n=0 → s.val=f) ∧
      (∀ hn : 0<n, ∃ b : continuousCochain ρ (n-1),
        HEq (continuousDifferential ρ (n-1) b) (f-s.val)) := sorry
theorem smoothing_quasiIso
    (hρ : ∀ v, ContMDiff 𝓘(ℝ,E) 𝓘(ℝ,V) ∞ (fun g => ρ g v)) :
    QuasiIso (smoothingInclusion (E := E) ρ) := sorry
end Smooth
end TauCeti.VanEst

namespace TauCeti.Automorphic
open MeasureTheory
open scoped MatrixGroups

namespace MaassCuspForm

def standardDomain : Set UpperHalfPlane := {z | |z.re| ≤ 1/2 ∧ 1 ≤ ‖(z : ℂ)‖}

/-- The positive hyperbolic Laplacian; coordinate derivatives are real derivatives. -/
def laplacian (f : UpperHalfPlane → ℂ) (z : UpperHalfPlane) : ℂ :=
  -(z.im^2 : ℝ) •
    (deriv (fun x : ℝ => deriv (fun t : ℝ => f (UpperHalfPlane.ofComplex (t+z.im*Complex.I))) x) z.re +
     deriv (fun y : ℝ => deriv (fun t : ℝ => f (UpperHalfPlane.ofComplex (z.re+t*Complex.I))) y) z.im)

def constantFourier (f : UpperHalfPlane → ℂ) (y : ℝ) : ℂ :=
  ∫ x : ℝ in 0..1, f (UpperHalfPlane.ofComplex (x+y*Complex.I))

def petersson (f g : UpperHalfPlane → ℂ) : ℂ :=
  ∫ z in standardDomain, star (f z) * g z

def l2norm (f : UpperHalfPlane → ℂ) : ℝ := Real.sqrt (petersson f f).re

def reflection (z : UpperHalfPlane) : UpperHalfPlane :=
  UpperHalfPlane.ofComplex (-star (z : ℂ))

end MaassCuspForm

/-- The carrier includes smoothness, the actual Laplace equation and zero constant term. -/
def MaassCuspForm (eigenvalue : ℝ) : Submodule ℂ (UpperHalfPlane → ℂ) where
  carrier := {f | ContMDiff 𝓘(ℝ,ℂ) 𝓘(ℝ,ℂ) ∞ f ∧
    (∀ γ : SL(2,ℤ), ∀ z, f (γ • z) = f z) ∧
    MemLp f 2 (volume.restrict MaassCuspForm.standardDomain) ∧
    (∀ z, MaassCuspForm.laplacian f z = (eigenvalue : ℂ) * f z) ∧
    ∀ y : ℝ, 0 < y → MaassCuspForm.constantFourier f y = 0}
  zero_mem' := sorry
  add_mem' := sorry
  smul_mem' := sorry

namespace MaassCuspForm
variable {eigenvalue : ℝ}

def heckePoint (a d b : ℕ) (z : UpperHalfPlane) : UpperHalfPlane :=
  UpperHalfPlane.ofComplex (((a : ℂ)*(z : ℂ)+(b : ℂ))/(d : ℂ))

def heckeOperator (n : ℕ) (hn : 0<n) : MaassCuspForm eigenvalue →ₗ[ℂ] MaassCuspForm eigenvalue := sorry

theorem heckeOperator_apply (n : ℕ) (hn : 0<n) (f : MaassCuspForm eigenvalue) (z : UpperHalfPlane) :
    (heckeOperator n hn f).val z = (Real.sqrt n : ℂ)⁻¹ *
      ∑ a ∈ n.divisors, ∑ b : Fin (n/a), f.val (heckePoint a (n/a) b.val z) := sorry

theorem hecke_one (f : MaassCuspForm eigenvalue) : heckeOperator 1 (by norm_num) f = f := sorry

theorem hecke_mul (m n : ℕ) (hm : 0<m) (hn : 0<n) (f : MaassCuspForm eigenvalue) :
    heckeOperator m hm (heckeOperator n hn f) =
      ∑ d ∈ (Nat.gcd m n).divisors, heckeOperator (m*n/(d*d)) (by sorry) f := sorry

theorem hecke_selfAdjoint (n : ℕ) (hn : 0<n) (f g : MaassCuspForm eigenvalue) :
    petersson (heckeOperator n hn f).val g.val = petersson f.val (heckeOperator n hn g).val := sorry

/-- K_ir(x), including the imaginary spectral-parameter branch, via its integral formula. -/
def besselKir (r : ℂ) (x : ℝ) : ℂ :=
  ∫ t : ℝ in Set.Ioi 0, (Real.exp (-x * Real.cosh t) : ℂ) * Complex.cos (r * t)

def fourierSeries (r : ℂ) (a : ℤ → ℂ) (z : UpperHalfPlane) : ℂ :=
  2 * (Real.sqrt z.im : ℂ) * ∑' n : ℤ,
    if n=0 then 0 else a n * besselKir r (2*Real.pi*(Int.natAbs n : ℝ)*z.im) *
      Complex.exp (2*Real.pi*Complex.I*n*z.re)

structure Eigenform (eigenvalue : ℝ) where
  form : MaassCuspForm eigenvalue
  nonzero : form ≠ 0
  spectral : ℂ
  spectral_eq : (eigenvalue : ℂ) = 1/4 + spectral^2
  coefficient : ℤ → ℂ
  zeroCoefficient : coefficient 0 = 0
  normalized : coefficient 1 = 1
  expansion : ∀ z, form.val z = fourierSeries spectral coefficient z
  heckeEigen : ∀ n : ℕ, ∀ hn : 0<n,
    heckeOperator n hn form = coefficient n • form
  parity : Bool
  reflection_eq : ∀ z, form.val (reflection z) =
    (if parity then -1 else 1) * form.val z

theorem fourierCoeff_neg (f : Eigenform eigenvalue) (n : ℤ) :
    f.coefficient (-n) = f.coefficient (-1)*f.coefficient n ∧
      f.coefficient (-1) = (if f.parity then -1 else 1) := sorry

theorem fourierCoeff_real (f : Eigenform eigenvalue) (n : ℤ) : (f.coefficient n).im = 0 := sorry

-- test: maass_hecke_mul_prime
example (p : ℕ) (hp : p.Prime) (f : MaassCuspForm eigenvalue) :
    heckeOperator p hp.pos (heckeOperator p hp.pos f) =
      heckeOperator (p*p) (Nat.mul_pos hp.pos hp.pos) f + f := sorry

-- test: maass_parity_even; numerical ordering is recorded separately in the reader.
example (f : Eigenform eigenvalue) (hf : f.parity=false) (n : ℤ) :
    f.coefficient (-n) = f.coefficient n := sorry

-- test: maass_constant_not
example : (fun _ : UpperHalfPlane => (1 : ℂ)) ∉ MaassCuspForm 0 := sorry

-- test: maass_norm_not_one; the precise scaling formula keeps both normalizations visible.
example (f : MaassCuspForm eigenvalue) (a : ℂ) :
    l2norm (fun z => a*f.val z) = ‖a‖*l2norm f.val := sorry

end MaassCuspForm
end TauCeti.Automorphic

namespace TauCeti.RealReductive
open TauCeti.RelativeLieCohomology
section ContinuousNorms
variable {E Ek : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]
  [NormedAddCommGroup Ek] [NormedSpace ℝ Ek] [FiniteDimensional ℝ Ek]
  {G K : Type*} [Group G] [Group K] [TopologicalSpace G] [TopologicalSpace K]
  [ChartedSpace E G] [ChartedSpace Ek K]
  [LieGroup 𝓘(ℝ,E) ∞ G] [LieGroup 𝓘(ℝ,Ek) ∞ K] [CompactSpace K]
  {q : Type*} [NormedComplexLieAlgebra q] {P : Pair 𝓘(ℝ,Ek) K q}
  {V : Type*} [AddCommGroup V] [Module ℂ V]
  (A : HCModule (P := P) (V := V)) (ι : K →* G)
  (φ : q ≃ₗ⁅ℂ⁆ TauCeti.ComplexGroupLie 𝓘(ℝ,E) G)

/-- A Banach completion of the exact HC module, including its differentiated G-action. -/
structure GContinuousNorm where
  norm : Seminorm ℂ V
  separates : ∀ v, norm v = 0 → v=0
  B : Type*
  [banachGroup : NormedAddCommGroup B]
  [banachSpace : NormedSpace ℂ B]
  [complete : CompleteSpace B]
  representation : ContRepresentation ℂ G B
  continuous : Continuous (fun x : G × B => representation x.1 x.2)
  embedding : V →ₗ[ℂ] B
  isometry : ∀ v, ‖embedding v‖ = norm v
  dense : DenseRange embedding
  compact : ∀ k v, embedding (A.sigma k v) = representation (ι k) (embedding v)
  smooth : ∀ v, ContMDiff 𝓘(ℝ,E) 𝓘(ℝ,B) ∞ (fun g => representation g (embedding v))
  derivative : ∀ X v,
    mfderiv 𝓘(ℝ,E) 𝓘(ℝ,B) (fun g => representation g (embedding v)) 1 X =
      embedding (A.rho (φ.symm (1 ⊗ₜ[ℝ] X)) v)
  exactKFinite : ∀ b : B,
    b ∈ kFinite (representation.toRepresentation.comp ι) ↔ ∃ v, embedding v=b

attribute [instance] GContinuousNorm.banachGroup GContinuousNorm.banachSpace GContinuousNorm.complete

def monomialAction (xs : List q) : Module.End ℂ V := (xs.map A.rho).prod

def sobolevNorm (A : HCModule (P := P) (V := V)) {d : ℕ} (b : Module.Basis (Fin d) ℂ q) (p : Seminorm ℂ V) (k : ℕ) :
    Seminorm ℂ V := sorry

theorem sobolevNorm_apply {d : ℕ} (b : Module.Basis (Fin d) ℂ q) (p : Seminorm ℂ V)
    (k : ℕ) (v : V) :
    sobolevNorm A b p k v = Real.sqrt
      (∑ l ∈ Finset.range (k+1), ∑ xs : Fin l → Fin d,
        (p (monomialAction A (List.ofFn (fun i => b (xs i))) v))^2) := sorry

def SobolevLE {d : ℕ} (b : Module.Basis (Fin d) ℂ q) (p r : Seminorm ℂ V) : Prop :=
  ∃ C : ℝ, 0<C ∧ ∃ k : ℕ, ∀ v, p v ≤ C * sobolevNorm A b r k v

theorem SobolevLE.refl {d : ℕ} (b : Module.Basis (Fin d) ℂ q) (p : Seminorm ℂ V) :
    SobolevLE A b p p := sorry

theorem SobolevLE.trans {d : ℕ} (b : Module.Basis (Fin d) ℂ q) (p r s : Seminorm ℂ V)
    (h : SobolevLE A b p r) (h' : SobolevLE A b r s) : SobolevLE A b p s := sorry

def GContinuousNorm.smoothCompletion (p : GContinuousNorm A ι φ) : Submodule ℂ p.B :=
  SFRep.smoothVectors 𝓘(ℝ,E) G p.representation

-- The existence and nuclearity API require the real reductive datum and the
-- Casselman/Sobolev estimates recorded by the packet. They are not asserted for
-- arbitrary Lie groups. A nuclear Fréchet supplier is requested rather than a
-- Prop-valued stand-in for nuclearity.

-- test: gContinuous_norm_equivalence, the finite-dimensional norm comparison.
example [FiniteDimensional ℂ V] {d : ℕ} (b : Module.Basis (Fin d) ℂ q)
    (p r : Seminorm ℂ V) (hp : ∀ v, p v=0 → v=0) (hr : ∀ v, r v=0 → v=0) :
    SobolevLE A b p r ∧ SobolevLE A b r p := sorry

end ContinuousNorms
end TauCeti.RealReductive

namespace TauCeti.Automorphic
section FiniteCorners
variable {A B V : Type*} [Ring A] [Algebra ℂ A] [Ring B] [Algebra ℂ B]
  [AddCommGroup V] [Module ℂ V] [FiniteDimensional ℂ V] [Nontrivial V]
  (α : A →ₐ[ℂ] Module.End ℂ V) (β : B →ₐ[ℂ] Module.End ℂ V)

def IsSimpleAlgebraAction {R W : Type*} [Ring R] [Algebra ℂ R]
    [AddCommGroup W] [Module ℂ W] (ρ : R →ₐ[ℂ] Module.End ℂ W) : Prop :=
  Nontrivial W ∧ ∀ S : Submodule ℂ W, (∀ r w, w∈S → ρ r w∈S) → S=⊥ ∨ S=⊤

theorem finiteCornerFactorization
    (hcomm : ∀ a b, α a * β b = β b * α a)
    (hsimple : ∀ S : Submodule ℂ V,
      (∀ a b v, v∈S → α a (β b v)∈S) → S=⊥ ∨ S=⊤) :
    ∃ (r s : ℕ) (α₁ : A →ₐ[ℂ] Module.End ℂ (Fin r → ℂ))
      (β₁ : B →ₐ[ℂ] Module.End ℂ (Fin s → ℂ))
      (e : V ≃ₗ[ℂ] ((Fin r → ℂ) ⊗[ℂ] (Fin s → ℂ))),
      IsSimpleAlgebraAction α₁ ∧ IsSimpleAlgebraAction β₁ ∧
      ∀ a b v, e (α a (β b v)) = TensorProduct.map (α₁ a) (β₁ b) (e v) := sorry

end FiniteCorners

/-- Closure under multiplying local idempotents is essential: no splitting of a
proper corner submodule is assumed. The original nonunital action is explicit. -/
theorem idempotentCorner_simple {R W : Type*} [NonUnitalRing R]
    [AddCommGroup W] [Module ℂ W]
    (ρ : R →ₙ+* Module.End ℂ W)
    (hid : ∀ xs : Finset R, ∃ e : R, IsIdempotentElem e ∧ ∀ x∈xs, e*x=x ∧ x*e=x)
    (hnd : ∀ w, ∃ e, IsIdempotentElem e ∧ ρ e w=w)
    (hsimple : ∀ S : Submodule ℂ W, (∀ r w, w∈S → ρ r w∈S) → S=⊥ ∨ S=⊤)
    (e : R) (he : IsIdempotentElem e)
    (T : Submodule ℂ (LinearMap.range (ρ e)))
    (hT : ∀ a : he.Corner, ∀ w : LinearMap.range (ρ e), w∈T →
      ∃ w' : LinearMap.range (ρ e), w'.val=ρ a.val w.val ∧ w'∈T) :
    T=⊥ ∨ T=⊤ := sorry

end TauCeti.Automorphic

namespace TauCeti.Automorphic
section GL1Tests

def gl1Height (g : ℝˣ × PUnit) : ℝ := max |g.1.val| |g.1.val|⁻¹

def gl1NormCharacter (s : ℂ) (g : ℝˣ × PUnit) : ℂ :=
  Complex.exp (s * (Real.log |g.1.val| : ℂ))

-- test: smoothAdelicFunction_gl1_example, at the actual real GL₁ carrier.
example (s : ℂ) : IsSmoothAdelic 𝓘(ℝ,ℝ) (gl1NormCharacter s) := sorry

-- test: smoothAdelicFunction_archContinuous_not_smooth
example : Continuous (fun g : ℝˣ × PUnit => ((abs (Real.log (abs g.1.val)) : ℝ) : ℂ)) ∧
    ¬IsSmoothAdelic 𝓘(ℝ,ℝ) (fun g : ℝˣ × PUnit => ((abs (Real.log (abs g.1.val)) : ℝ) : ℂ)) := sorry

-- test: smoothAdelicFunction_not_of_continuous. The p-adic coordinate
-- witness is continuous but has no open multiplicative period at 1.
example (p : ℕ) [Fact p.Prime] :
    Continuous (fun g : ℝˣ × ℤ_[p]ˣ => ((‖(g.2.val : ℚ_[p])-1‖ : ℝ) : ℂ)) ∧
    ¬IsSmoothAdelic 𝓘(ℝ,ℝ)
      (fun g : ℝˣ × ℤ_[p]ˣ => ((‖(g.2.val : ℚ_[p])-1‖ : ℝ) : ℂ)) := sorry

-- test: hasModerateGrowth_abs_det; all real powers, including negative powers.
example (s : ℝ) : HasModerateGrowth gl1Height
    (fun g => (Real.rpow |g.1.val| s : ℂ)) := sorry

-- test: hasModerateGrowth_exp_not
example : ¬HasModerateGrowth gl1Height
    (fun g => (Real.exp |g.1.val| : ℂ)) := sorry

def gl1Gaussian : SmoothAdelicFunction (Ginf := ℝˣ) (Gf := PUnit) 𝓘(ℝ,ℝ) :=
  ⟨fun g => (Real.exp (-Real.pi * (g.1.val^2 + g.1.val⁻¹^2)) : ℂ), by sorry⟩

-- test: schwartzFunction_gaussian_gl1, decay at both ends of the multiplicative group.
example : gl1Gaussian ∈ SchwartzFunction 𝓘(ℝ,ℝ) gl1Height := sorry

-- test: schwartzFunction_const_not
example : (algebraMap ℂ (SmoothAdelicFunction (Ginf := ℝˣ) (Gf := PUnit) 𝓘(ℝ,ℝ)) 1)
    ∉ SchwartzFunction 𝓘(ℝ,ℝ) gl1Height := sorry

-- test: uniformModerateGrowth_gl1_character; one exponent works for every Euler derivative.
example (s : ℂ) : ∃ N : ℝ, 0≤N ∧
    (⟨gl1NormCharacter s, by sorry⟩ :
      SmoothAdelicFunction (Ginf := ℝˣ) (Gf := PUnit) 𝓘(ℝ,ℝ)) ∈
      UniformModerateGrowth 𝓘(ℝ,ℝ) gl1Height (⊥ : Subgroup (ℝˣ × PUnit)) N := sorry

end GL1Tests

section CompactSchwartz
variable {E : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]
  {G K : Type*} [Group G] [TopologicalSpace G] [IsTopologicalGroup G]
  [CompactSpace G] [T2Space G] [SecondCountableTopology G] [ChartedSpace E G]
  [LieGroup 𝓘(ℝ,E) ∞ G] [Group K] [TopologicalSpace K] [IsTopologicalGroup K]
  [CompactSpace K] [T2Space K] [TotallyDisconnectedSpace K] [SecondCountableTopology K]

-- test: schwartzFunction_compact_group
example (height : G × K → ℝ) (hc : Continuous height) :
    SchwartzFunction 𝓘(ℝ,E) height = ⊤ := sorry
end CompactSchwartz

section ClassicalGrowth
open scoped MatrixGroups
/-- The proper matrix height sees both the matrix and its inverse. -/
def sl2MatrixHeight (g : SL(2,ℝ)) : ℝ :=
  max 1 (max (Finset.univ.sup' (by simp) (fun ij : Fin 2 × Fin 2 => |g ij.1 ij.2|))
    (Finset.univ.sup' (by simp) (fun ij : Fin 2 × Fin 2 => |g⁻¹ ij.1 ij.2|)))

-- test: hasModerateGrowth_classical_compat, the explicit upper-half-plane estimate.
example (f : SL(2,ℝ) → ℂ) (hf : HasModerateGrowth sl2MatrixHeight f) :
    ∃ C : ℝ, 0≤C ∧ ∃ N : ℕ, ∀ z : UpperHalfPlane,
      ‖f z.toSL2R‖ ≤ C * (1+|z.re|+z.im+z.im⁻¹)^N := sorry
end ClassicalGrowth
end TauCeti.Automorphic

namespace TauCeti.RelativeLieCohomology
section PairMorphisms
variable {E E' : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]
  [NormedAddCommGroup E'] [NormedSpace ℝ E'] [FiniteDimensional ℝ E']
  {H H' : Type*} [TopologicalSpace H] [TopologicalSpace H']
  {I : ModelWithCorners ℝ E H} {I' : ModelWithCorners ℝ E' H'}
  {K K' : Type*} [Group K] [Group K'] [TopologicalSpace K] [TopologicalSpace K']
  [ChartedSpace H K] [ChartedSpace H' K'] [LieGroup I ∞ K] [LieGroup I' ∞ K']
  [CompactSpace K] [CompactSpace K']
  {q q' : Type*} [NormedComplexLieAlgebra q] [NormedComplexLieAlgebra q']

structure Pair.Hom (P : Pair I K q) (P' : Pair I' K' q') where
  group : K →* K'
  smooth : ContMDiff I I' ∞ group
  lie : q →ₗ⁅ℂ⁆ q'
  compactDifferential : TauCeti.ComplexGroupLie I K →ₗ⁅ℂ⁆ TauCeti.ComplexGroupLie I' K'
  compactDifferential_eq : ∀ X : GroupLieAlgebra I K,
    compactDifferential (1 ⊗ₜ[ℝ] X) = 1 ⊗ₜ[ℝ] (mfderiv I I' group 1 X)
  inclusion : lie.comp P.iota = P'.iota.comp compactDifferential
  equivariant : ∀ k X, lie (P.Ad k X) = P'.Ad (group k) (lie X)

def Pair.Hom.id (P : Pair I K q) : Pair.Hom P P := sorry

def GKModule.restrict {P : Pair I K q} {P' : Pair I' K' q'}
    {V : Type*} [AddCommGroup V] [Module ℂ V]
    (h : Pair.Hom P P') (A : GKModule P' V) : GKModule P V := sorry

theorem GKModule.restrict_lie {P : Pair I K q} {P' : Pair I' K' q'}
    {V : Type*} [AddCommGroup V] [Module ℂ V]
    (h : Pair.Hom P P') (A : GKModule P' V) (X : q) (v : V) :
    (GKModule.restrict h A).rho X v = A.rho (h.lie X) v := sorry

theorem GKModule.restrict_group {P : Pair I K q} {P' : Pair I' K' q'}
    {V : Type*} [AddCommGroup V] [Module ℂ V]
    (h : Pair.Hom P P') (A : GKModule P' V) (k : K) (v : V) :
    (GKModule.restrict h A).sigma k v = A.sigma (h.group k) v := sorry

def Pair.ofSubalgebra (P : Pair I K q) (S : LieSubalgebra ℂ q)
    [NormedComplexLieAlgebra S]
    (hAd : ∀ k X, X∈S → P.Ad k X∈S) (hi : ∀ X, P.iota X∈S) : Pair I K S := sorry

theorem Pair.ofSubalgebra_iota (P : Pair I K q) (S : LieSubalgebra ℂ q)
    [NormedComplexLieAlgebra S]
    (hAd : ∀ k X, X∈S → P.Ad k X∈S) (hi : ∀ X, P.iota X∈S)
    (X : TauCeti.ComplexGroupLie I K) :
    ((Pair.ofSubalgebra P S hAd hi).iota X).val = P.iota X := sorry

end PairMorphisms

section QuotientCochains
variable {E : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]
  {H : Type*} [TopologicalSpace H] {I : ModelWithCorners ℝ E H}
  {K : Type*} [Group K] [TopologicalSpace K] [ChartedSpace H K]
  [LieGroup I ∞ K] [CompactSpace K] {q : Type*} [NormedComplexLieAlgebra q]
  {P : Pair I K q} {V W : Type*} [AddCommGroup V] [Module ℂ V]
  [AddCommGroup W] [Module ℂ W] (A : GKModule P V)

abbrev tangentQuotient := q ⧸ P.iota.range.toSubmodule

def quotientAd (P : Pair I K q) : Representation ℂ K (tangentQuotient (P := P)) := sorry

theorem quotientAd_mk (k : K) (X : q) :
    quotientAd P k (Submodule.Quotient.mk X) = Submodule.Quotient.mk (P.Ad k X) := sorry

def quotientCochains (n : ℕ) :
    Submodule ℂ (AlternatingMap ℂ (tangentQuotient (P := P)) V (Fin n)) where
  carrier := {w | ∀ k x, w (fun i => quotientAd P k (x i)) = A.sigma k (w x)}
  zero_mem' := sorry
  add_mem' := sorry
  smul_mem' := sorry

def cochains_eq_hom (n : ℕ) : cochains A n ≃ₗ[ℂ] quotientCochains A n := sorry

theorem cochains_eq_hom_apply (n : ℕ) (w : cochains A n) (x : Fin n → q) :
    (cochains_eq_hom A n w).val (fun i => Submodule.Quotient.mk (x i)) = w.val x := sorry

def complex (A : GKModule P V) : CochainComplex (ModuleCat ℂ) ℕ :=
  CochainComplex.of (fun n => ModuleCat.of ℂ (cochains A n))
    (fun n => ModuleCat.ofHom (differential A n)) (by sorry)

def cochains_map (B : GKModule P W) (T : GKModule.Hom A B) (n : ℕ) :
    cochains A n →ₗ[ℂ] cochains B n := sorry

theorem cochains_map_apply (B : GKModule P W) (T : GKModule.Hom A B)
    (n : ℕ) (w : cochains A n) (x : Fin n → q) :
    (cochains_map A B T n w).val x = T.toLinearMap (w.val x) := sorry

def cohomology_map (B : GKModule P W) (T : GKModule.Hom A B) (n : ℕ) :
    cohomology A n →ₗ[ℂ] cohomology B n := sorry

def cohomologyEquivMathlib (n : ℕ) : cohomology A n ≃ₗ[ℂ] (complex A).homology n := sorry

-- The underlying alternating-cochain identification.
example [IsLieAbelian q] (hP : ∀ X : GroupLieAlgebra I K, P.iota (1 ⊗ₜ[ℝ] X)=0)
    (hAd : ∀ k X, P.Ad k X=X) (n : ℕ) :
    cochains (GKModule.trivial P) n ≃ₗ[ℂ] AlternatingMap ℂ q ℂ (Fin n) := sorry

-- test: relativeCochains_vector_group. Abelian bracket and trivial compact
-- action make the differential zero, so this computes cohomology itself.
example [IsLieAbelian q] (hP : ∀ X : GroupLieAlgebra I K, P.iota (1 ⊗ₜ[ℝ] X)=0)
    (hAd : ∀ k X, P.Ad k X=X) (n : ℕ) :
    cohomology (GKModule.trivial P) n ≃ₗ[ℂ] AlternatingMap ℂ q ℂ (Fin n) := sorry

end QuotientCochains
end TauCeti.RelativeLieCohomology

namespace TauCeti.RealReductive
structure PositiveRealCharacter (P : Type*) [Monoid P] extends P →* ℝˣ where
  positive : ∀ p, 0 < (toMonoidHom p : ℝ)

instance {P : Type*} [Monoid P] : CoeFun (PositiveRealCharacter P) (fun _ => P → ℝˣ) :=
  ⟨fun δ => δ.toMonoidHom⟩
instance {P : Type*} [Monoid P] : One (PositiveRealCharacter P) :=
  ⟨⟨1, by simp⟩⟩

section InducedFunctions
variable {E : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]
  {G : Type*} [Group G] [TopologicalSpace G] [ChartedSpace E G]
  [LieGroup 𝓘(ℝ,E) ∞ G]
  (B : ℕ → Type*) [∀ n, NormedAddCommGroup (B n)] [∀ n, NormedSpace ℂ (B n)]
  [∀ n, CompleteSpace (B n)] (V : Submodule ℂ (∀ n, B n))
  (P : Subgroup G) (σ : ContRepresentation ℂ P V)
  (δ : PositiveRealCharacter P) (η : P →* ℂˣ)

/-- This is the inducing-function construction. Its parabolic specialization
imports δ_P and the Langlands decomposition from the LieGroups supplier.
The Banach-coordinate presentation also covers general Fréchet coefficients. -/
def normalizedInduction : Submodule ℂ (G → V) where
  carrier := {f | (∀ n, ContMDiff 𝓘(ℝ,E) 𝓘(ℝ,B n) ∞ (fun g => (f g).val n)) ∧
    ∀ p : P, ∀ g, f (p.val*g) =
      ((Real.sqrt (δ p : ℝ) : ℂ) * (η p : ℂ)) • σ p (f g)}
  zero_mem' := sorry
  add_mem' := sorry
  smul_mem' := sorry

def normalizedInduction.rightTranslate (g : G) :
    normalizedInduction (E := E) B V P σ δ η →ₗ[ℂ] normalizedInduction (E := E) B V P σ δ η := sorry

theorem normalizedInduction.rightTranslate_apply (g x : G)
    (f : normalizedInduction (E := E) B V P σ δ η) :
    (normalizedInduction.rightTranslate (E := E) B V P σ δ η g f).val x = f.val (x*g) := sorry

def normalizedInduction.action : Representation ℂ G (normalizedInduction (E := E) B V P σ δ η) := sorry

theorem normalizedInduction.action_apply (g : G) (f : normalizedInduction (E := E) B V P σ δ η) :
    normalizedInduction.action (E := E) B V P σ δ η g f =
      normalizedInduction.rightTranslate (E := E) B V P σ δ η g f := sorry

def normalizedInduction.compactPicture {Ek : Type*} [NormedAddCommGroup Ek]
    [NormedSpace ℝ Ek] {K : Type*} [Group K] [TopologicalSpace K]
    [ChartedSpace Ek K] [LieGroup 𝓘(ℝ,Ek) ∞ K] (ι : K →* G) :
    Submodule ℂ (K → V) where
  carrier := {f | (∀ n, ContMDiff 𝓘(ℝ,Ek) 𝓘(ℝ,B n) ∞ (fun k => (f k).val n)) ∧
    ∀ (p : P) (k k' : K), ι k'=p.val →
      f (k'*k) = ((Real.sqrt (δ p : ℝ) : ℂ)*(η p : ℂ)) • σ p (f k)}
  zero_mem' := sorry
  add_mem' := sorry
  smul_mem' := sorry

def normalizedInduction.restriction {Ek : Type*} [NormedAddCommGroup Ek]
    [NormedSpace ℝ Ek] {K : Type*} [Group K] [TopologicalSpace K]
    [ChartedSpace Ek K] [LieGroup 𝓘(ℝ,Ek) ∞ K] (ι : K →* G)
    (hι : ContMDiff 𝓘(ℝ,Ek) 𝓘(ℝ,E) ∞ ι) :
    normalizedInduction (E := E) B V P σ δ η →ₗ[ℂ]
      normalizedInduction.compactPicture (Ek := Ek) B V P σ δ η ι := sorry

theorem normalizedInduction.restriction_apply {Ek : Type*} [NormedAddCommGroup Ek]
    [NormedSpace ℝ Ek] {K : Type*} [Group K] [TopologicalSpace K]
    [ChartedSpace Ek K] [LieGroup 𝓘(ℝ,Ek) ∞ K] (ι : K →* G)
    (hι : ContMDiff 𝓘(ℝ,Ek) 𝓘(ℝ,E) ∞ ι)
    (f : normalizedInduction (E := E) B V P σ δ η) (k : K) :
    (normalizedInduction.restriction (E := E) (Ek := Ek) B V P σ δ η ι hι f).val k = f.val (ι k) := sorry

/-- Bijectivity is the actual compact-picture extension theorem, rather than
an assertion that a set-theoretic factorization automatically gives smoothness. -/
def normalizedInduction.restrictK {Ek : Type*} [NormedAddCommGroup Ek]
    [NormedSpace ℝ Ek] {K : Type*} [Group K] [TopologicalSpace K]
    [ChartedSpace Ek K] [LieGroup 𝓘(ℝ,Ek) ∞ K] (ι : K →* G)
    (hι : ContMDiff 𝓘(ℝ,Ek) 𝓘(ℝ,E) ∞ ι)
    (hbij : Function.Bijective (normalizedInduction.restriction (E := E) (Ek := Ek) B V P σ δ η ι hι)) :
    normalizedInduction (E := E) B V P σ δ η ≃ₗ[ℂ]
      normalizedInduction.compactPicture (Ek := Ek) B V P σ δ η ι :=
  LinearEquiv.ofBijective _ hbij

variable {B V}
def normalizedInduction.map {B' : ℕ → Type*}
    [∀ n, NormedAddCommGroup (B' n)] [∀ n, NormedSpace ℂ (B' n)] [∀ n, CompleteSpace (B' n)]
    {V' : Submodule ℂ (∀ n, B' n)} (σ' : ContRepresentation ℂ P V')
    (T : V →L[ℂ] V') (hT : ∀ p v, T (σ p v) = σ' p (T v))
    (hsmooth : ∀ f : normalizedInduction (E := E) B V P σ δ η, ∀ n,
      ContMDiff 𝓘(ℝ,E) 𝓘(ℝ,B' n) ∞ (fun g => (T (f.val g)).val n)) :
    normalizedInduction (E := E) B V P σ δ η →ₗ[ℂ] normalizedInduction (E := E) B' V' P σ' δ η := sorry

theorem normalizedInduction.map_apply {B' : ℕ → Type*}
    [∀ n, NormedAddCommGroup (B' n)] [∀ n, NormedSpace ℂ (B' n)] [∀ n, CompleteSpace (B' n)]
    {V' : Submodule ℂ (∀ n, B' n)} (σ' : ContRepresentation ℂ P V')
    (T : V →L[ℂ] V') (hT : ∀ p v, T (σ p v) = σ' p (T v))
    (hsmooth : ∀ f : normalizedInduction (E := E) B V P σ δ η, ∀ n,
      ContMDiff 𝓘(ℝ,E) 𝓘(ℝ,B' n) ∞ (fun g => (T (f.val g)).val n))
    (f : normalizedInduction (E := E) B V P σ δ η) (g : G) :
    (normalizedInduction.map (E := E) P σ δ η σ' T hT hsmooth f).val g = T (f.val g) := sorry

-- test: normalizedInduction_top. Smooth inducing orbits are indispensable.
example (σ : ContRepresentation ℂ (⊤ : Subgroup G) V)
    (hs : ∀ v : V, ∀ n,
      ContMDiff 𝓘(ℝ,E) 𝓘(ℝ,B n) ∞ (fun g => (σ ⟨g,by simp⟩ v).val n)) :
    normalizedInduction (E := E) B V (⊤ : Subgroup G) σ 1 1 ≃ₗ[ℂ] V := sorry

-- The SL2 half-modular character is squared diagonal modulus. This scalar
-- computation fixes the normalized exponent; the native coordinate comparison
-- is imported from the real reductive supplier.
-- test: normalizedInduction_SL2
example (t : ℝ) (ht : 0<t) (ν : ℂ) :
    (Real.sqrt (t^2) : ℂ) * Complex.exp (ν * (Real.log t : ℂ)) =
      Complex.exp ((ν+1)*(Real.log t : ℂ)) := sorry

-- test: normalizedInduction_covariance. The covariance carrier for minimal
-- parabolics is the same inducing-function space; the real reductive supplier
-- supplies minimality, the δ_P identification and the Fréchet topology.
example (f : normalizedInduction (E := E) B V P σ δ η) (p : P) (g : G) :
    f.val (p.val*g) = ((Real.sqrt (δ p : ℝ) : ℂ)*(η p : ℂ)) • σ p (f.val g) := sorry
end InducedFunctions
end TauCeti.RealReductive

namespace TauCeti.RelativeLieCohomology.AbsoluteLie
universe uB
open CategoryTheory
variable (k L V : Type uB) [Field k] [CharZero k] [LieRing L] [LieAlgebra k L]
  [AddCommGroup V] [Module k V] [LieRingModule L V] [LieModule k L V]
abbrev cohomology (n : ℕ) := (complex k L V).homology n
end TauCeti.RelativeLieCohomology.AbsoluteLie

namespace TauCeti.Automorphic
universe uR
section Rationality
variable {G : Type*} [Group G] {V : Type uR} [AddCommGroup V] [Module ℂ V]

/-- The scalar twist has the original additive group and a transported scalar action.
No topology is transported through a discontinuous automorphism of ℂ. -/
structure GaloisTwistSpace (τ : ℂ ≃+* ℂ) (V : Type uR) where
  val : V
def GaloisTwistSpace.equiv (τ : ℂ ≃+* ℂ) : GaloisTwistSpace τ V ≃ V where
  toFun := GaloisTwistSpace.val
  invFun := GaloisTwistSpace.mk
  left_inv := by intro v; rfl
  right_inv := by intro v; rfl
instance (τ : ℂ ≃+* ℂ) : AddCommGroup (GaloisTwistSpace τ V) :=
  (GaloisTwistSpace.equiv (V := V) τ).addCommGroup
instance (τ : ℂ ≃+* ℂ) : Module ℂ (GaloisTwistSpace τ V) where
  smul a v := ⟨τ.symm a • v.val⟩
  one_smul := sorry
  mul_smul := sorry
  smul_zero := sorry
  smul_add := sorry
  add_smul := sorry
  zero_smul := sorry

theorem GaloisTwistSpace.smul (τ : ℂ ≃+* ℂ) (a : ℂ) (v : GaloisTwistSpace τ V) :
    (a • v : GaloisTwistSpace τ V).val = τ.symm a • v.val := rfl

def galoisTwist (ρ : Representation ℂ G V) (τ : ℂ ≃+* ℂ) :
    Representation ℂ G (GaloisTwistSpace τ V) := sorry

theorem galoisTwist_apply (ρ : Representation ℂ G V) (τ : ℂ ≃+* ℂ)
    (g : G) (v : GaloisTwistSpace τ V) : (galoisTwist ρ τ g v).val = ρ g v.val := sorry

def rationalityStabilizer (ρ : Representation ℂ G V) : Subgroup (ℂ ≃+* ℂ) where
  carrier := {τ | ∃ e : GaloisTwistSpace τ V ≃ₗ[ℂ] V,
    ∀ g v, e (galoisTwist ρ τ g v) = ρ g (e v)}
  one_mem' := sorry
  mul_mem' := sorry
  inv_mem' := sorry

def rationalityField (ρ : Representation ℂ G V) : Subfield ℂ where
  carrier := {z | ∀ τ ∈ rationalityStabilizer ρ, τ z=z}
  zero_mem' := sorry
  one_mem' := sorry
  add_mem' := sorry
  neg_mem' := sorry
  mul_mem' := sorry
  inv_mem' := sorry

theorem rationalityField_mem (ρ : Representation ℂ G V) (z : ℂ) :
    z ∈ rationalityField ρ ↔ ∀ τ ∈ rationalityStabilizer ρ, τ z=z := Iff.rfl

/-- An actual coefficient model and its scalar-extension intertwiner. -/
structure FieldModel (F : Subfield ℂ) (ρ : Representation ℂ G V) where
  W : Type uR
  [addGroup : AddCommGroup W]
  [module : Module F W]
  representation : Representation F G W
  scalarEquiv : (ℂ ⊗[F] W) ≃ₗ[ℂ] V
  intertwines : ∀ g a w,
    scalarEquiv (a ⊗ₜ[F] representation g w) = ρ g (scalarEquiv (a ⊗ₜ[F] w))

attribute [instance] FieldModel.addGroup FieldModel.module

def IsFieldOfDefinition (F : Subfield ℂ) (ρ : Representation ℂ G V) : Prop :=
  Nonempty (FieldModel F ρ)

theorem rationalityField_le (F : Subfield ℂ) (ρ : Representation ℂ G V)
    (hF : IsFieldOfDefinition F ρ) : rationalityField ρ ≤ F := sorry

-- test: rationality_trivial
example : rationalityField (Representation.trivial ℂ G ℂ) =
    (⊥ : Subfield ℂ) := sorry

-- The character case gives a direct, discriminating fixed-field computation.
def characterRepresentation (χ : G →* ℂˣ) : Representation ℂ G ℂ := sorry

theorem characterRepresentation_apply (χ : G →* ℂˣ) (g : G) (z : ℂ) :
    characterRepresentation χ g z = (χ g : ℂ)*z := sorry

-- test: rationality_gl1_finite_order. For finite-order Hecke characters the
-- arithmetic specialization imports the HeckeCharacter supplier; this is its
-- algebraic finite-part character computation, valid for every group.
example (χ : G →* ℂˣ) : rationalityField (characterRepresentation χ) =
    Subfield.closure (Set.range (fun g => (χ g : ℂ))) := sorry

-- A field model carries data beyond invariance of the isomorphism class.
-- The quaternionic Schur-index counterexample and newform-field comparison
-- require their recorded coefficient/ModularForms suppliers.
end Rationality
end TauCeti.Automorphic

namespace TauCeti.RealReductive
universe uI
section Irreducibles
open TauCeti.RelativeLieCohomology
variable {E : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]
  {H : Type*} [TopologicalSpace H] {I : ModelWithCorners ℝ E H}
  {K : Type*} [Group K] [TopologicalSpace K] [ChartedSpace H K]
  [LieGroup I ∞ K] [CompactSpace K]
  {q : Type*} [NormedComplexLieAlgebra q] {P : Pair I K q}
  {V : Type uI} [AddCommGroup V] [Module ℂ V]

def invariantSubmodule (A : GKModule P V) (S : Submodule ℂ V) : Prop :=
  (∀ X v, v∈S → A.rho X v∈S) ∧ (∀ k v, v∈S → A.sigma k v∈S)

def IsIrreducibleGK (A : GKModule P V) : Prop :=
  Nontrivial V ∧ ∀ S : Submodule ℂ V, invariantSubmodule A S → S=⊥ ∨ S=⊤

def infCharOfHC (A : HCModule (P := P) (V := V))
    (hA : IsIrreducibleGK A.toGKModule)
    (hZ : ∀ k (z : Subalgebra.center ℂ (UniversalEnvelopingAlgebra ℂ q)) v,
      A.sigma k (envelopingAction A.toGKModule z.val v)=
        envelopingAction A.toGKModule z.val (A.sigma k v)) : InfChar q := sorry

theorem infCharOfHC_spec (A : HCModule (P := P) (V := V))
    (hA : IsIrreducibleGK A.toGKModule)
    (hZ : ∀ k (z : Subalgebra.center ℂ (UniversalEnvelopingAlgebra ℂ q)) v,
      A.sigma k (envelopingAction A.toGKModule z.val v)=
        envelopingAction A.toGKModule z.val (A.sigma k v)) :
    HasInfChar A.toGKModule (infCharOfHC A hA hZ) := sorry

theorem infCharOfHC_eq_iff (A : HCModule (P := P) (V := V))
    (hA : IsIrreducibleGK A.toGKModule)
    (hZ : ∀ k (z : Subalgebra.center ℂ (UniversalEnvelopingAlgebra ℂ q)) v,
      A.sigma k (envelopingAction A.toGKModule z.val v)=
        envelopingAction A.toGKModule z.val (A.sigma k v)) (χ : InfChar q) :
    infCharOfHC A hA hZ = χ ↔ HasInfChar A.toGKModule χ := sorry

def contragredient (A : GKModule P V) : Representation ℂ K (V →ₗ[ℂ] ℂ) := sorry

theorem contragredient_apply (A : GKModule P V) (k : K) (l : V →ₗ[ℂ] ℂ) (v : V) :
    contragredient A k l v = l (A.sigma k⁻¹ v) := sorry

def restrictedDual (A : GKModule P V) : GKModule P (kFinite (contragredient A)) := sorry

theorem restrictedDual_lie (A : GKModule P V) (X : q)
    (l : kFinite (contragredient A)) (v : V) :
    ((restrictedDual A).rho X l).val v = -l.val (A.rho X v) := sorry

structure IrrAdmissibleModel (P : Pair I K q) where
  carrier : Type uI
  [addGroup : AddCommGroup carrier]
  [module : Module ℂ carrier]
  action : HCModule (P := P) (V := carrier)
  irreducible : IsIrreducibleGK action.toGKModule
  centralEquivariant : ∀ k (z : Subalgebra.center ℂ (UniversalEnvelopingAlgebra ℂ q)) v,
    action.sigma k (envelopingAction action.toGKModule z.val v)=
      envelopingAction action.toGKModule z.val (action.sigma k v)

attribute [instance] IrrAdmissibleModel.addGroup IrrAdmissibleModel.module

def IrrAdmissibleModel.isoSetoid (P : Pair I K q) : Setoid (IrrAdmissibleModel.{uI} P) where
  r A B := ∃ e : A.carrier ≃ₗ[ℂ] B.carrier,
    (∀ X v, e (A.action.rho X v) = B.action.rho X (e v)) ∧
    ∀ k v, e (A.action.sigma k v) = B.action.sigma k (e v)
  iseqv := sorry

def IrrAdmissible (P : Pair I K q) := Quotient (IrrAdmissibleModel.isoSetoid.{uI} P)

def IrrAdmissible.infChar (P : Pair I K q) : IrrAdmissible.{uI} P → InfChar q :=
  Quotient.lift (fun A => infCharOfHC A.action A.irreducible A.centralEquivariant) (by sorry)

-- The dual and group-character twist on classes also require finite generation
-- of the restricted dual and differentiation of the twisting character. These
-- are statements for the genuine reductive supplier pair, not arbitrary Pair.

-- test: irr_dual_not_conj. A real norm character supplies a concrete failure.
example : (fun g : ℝˣ => TauCeti.Automorphic.gl1NormCharacter (-1) (g,PUnit.unit)) ≠
    (fun g : ℝˣ => star (TauCeti.Automorphic.gl1NormCharacter 1 (g,PUnit.unit))) := sorry
end Irreducibles
end TauCeti.RealReductive


namespace TauCeti.Automorphic
section Ranks
variable (g k a : Type*) [LieRing g] [LieAlgebra ℝ g] [FiniteDimensional ℝ g]
  [LieRing k] [LieAlgebra ℝ k] [FiniteDimensional ℝ k]
  [LieRing a] [LieAlgebra ℝ a] [FiniteDimensional ℝ a]

/-- Absolute real Lie-algebra ranks, not dimensions of split tori. In the
arithmetic specialization a is the Lie algebra of the rational split centre. -/
def ell0 : ℤ := (LieAlgebra.rank ℝ g : ℤ) - LieAlgebra.rank ℝ k - LieAlgebra.rank ℝ a

/-- The rational formula precedes the reductive parity theorem which makes q₀ integral. -/
def q0 : ℚ := ((Module.finrank ℝ g : ℚ) - Module.finrank ℝ k -
  Module.finrank ℝ a - ell0 g k a) / 2

theorem two_q0_add_ell0 : 2*q0 g k a + ell0 g k a =
    (Module.finrank ℝ g : ℚ) - Module.finrank ℝ k - Module.finrank ℝ a := sorry

theorem q0_integral (hparity : Even ((Module.finrank ℝ g : ℤ) - Module.finrank ℝ k -
    Module.finrank ℝ a - ell0 g k a)) : ∃ z : ℤ, q0 g k a=z := sorry

def pglEll0 (r₁ r₂ n : ℕ) : ℕ := r₁*((n-1)/2) + r₂*(n-1)
def pglSymmetricDimension (r₁ r₂ n : ℕ) : ℕ :=
  r₁*(n^2-1-n*(n-1)/2) + r₂*(n^2-1)
def pglQ0 (r₁ r₂ n : ℕ) : ℕ := (pglSymmetricDimension r₁ r₂ n-pglEll0 r₁ r₂ n)/2

-- The comparison requires the actual restricted-of-scalars Lie groups and
-- their compact Lie algebras; those identifications are supplied by realPoints.
theorem ell0_resPGL (r₁ r₂ n : ℕ) (hn : 1≤n)
    (hG : LieAlgebra.rank ℝ g = r₁*(n-1)+r₂*(2*(n-1)))
    (hK : LieAlgebra.rank ℝ k = r₁*(n/2)+r₂*(n-1))
    (hA : LieAlgebra.rank ℝ a=0) : ell0 g k a = pglEll0 r₁ r₂ n := sorry

-- n=1 is the trivial group. The compact SO(1) rank is 0; the general n/2
-- formula above has the same value, so the boundary case remains included.
theorem ell0_PGL2 (r₁ r₂ : ℕ) : pglEll0 r₁ r₂ 2 = r₂ := sorry

theorem pgl_two_q0_add_ell0 (r₁ r₂ n : ℕ) (hn : 1≤n) :
    2*pglQ0 r₁ r₂ n+pglEll0 r₁ r₂ n=pglSymmetricDimension r₁ r₂ n := sorry

-- test: pglRanks_Q_numeric
example : pglEll0 1 0 2=0 ∧ pglQ0 1 0 2=1 := sorry
-- test: pglRanks_imagQuad_numeric
example : pglEll0 0 1 2=1 ∧ pglQ0 0 1 2=1 := sorry
-- test: ell0_compact. Equal group and compact Lie algebras, zero split centre.
example (hA : Module.finrank ℝ a=0) : ell0 g g a=0 ∧ q0 g g a=0 := sorry
-- test: pglRanks_absolute_not_split_numeric. The complex SL₂ factor contributes one, and the
-- incorrect split-rank subtraction contributes zero.
example : pglEll0 0 1 2=1 ∧ (1:ℤ)-1=0 := sorry
end Ranks
end TauCeti.Automorphic

namespace TauCeti.Automorphic
section AutomorphicActions
open TauCeti.RelativeLieCohomology
variable {E Ek : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]
  [NormedAddCommGroup Ek] [NormedSpace ℝ Ek] [FiniteDimensional ℝ Ek]
  {Ginf K : Type*} [Group Ginf] [Group K] [TopologicalSpace Ginf] [TopologicalSpace K]
  [ChartedSpace E Ginf] [ChartedSpace Ek K]
  [LieGroup 𝓘(ℝ,E) ∞ Ginf] [LieGroup 𝓘(ℝ,Ek) ∞ K] [CompactSpace K]
  {Gf : Type*} [Group Gf] [TopologicalSpace Gf] [IsTopologicalGroup Gf]
  [LocallyCompactSpace Gf] [TotallyDisconnectedSpace Gf] [T2Space Gf]
  (ι : K →* Ginf) (height : Ginf × Gf → ℝ) (Γ : Subgroup (Ginf × Gf))
  (h1 : ∀ g, 1≤height g) (hmul : ∀ x y, height (x*y)≤height x*height y)

def AutomorphicForm.finiteAction (h1 : ∀ g, 1≤height g)
    (hmul : ∀ x y, height (x*y)≤height x*height y) :
    Representation ℂ Gf (AutomorphicForm 𝓘(ℝ,E) ι height Γ) := sorry

theorem AutomorphicForm.finiteAction_apply (g : Gf)
    (f : AutomorphicForm 𝓘(ℝ,E) ι height Γ) (x : Ginf × Gf) :
    (AutomorphicForm.finiteAction (E := E) ι height Γ h1 hmul g f).val.val x =
      f.val.val (x*(1,g)) := sorry

theorem AutomorphicForm.finiteAction_smooth (f : AutomorphicForm 𝓘(ℝ,E) ι height Γ) :
    ∃ J : Subgroup Gf, IsOpen (J : Set Gf) ∧
      ∀ j : J, AutomorphicForm.finiteAction (E := E) ι height Γ h1 hmul j.val f=f := sorry

variable {q : Type*} [NormedComplexLieAlgebra q] (P : Pair 𝓘(ℝ,Ek) K q)
  (hsmooth : ContMDiff 𝓘(ℝ,Ek) 𝓘(ℝ,E) ∞ ι)
  (φ : q ≃ₗ⁅ℂ⁆ TauCeti.ComplexGroupLie 𝓘(ℝ,E) Ginf)
  (hφ : ∀ X : GroupLieAlgebra 𝓘(ℝ,Ek) K,
    φ (P.iota (1 ⊗ₜ[ℝ] X)) = 1 ⊗ₜ[ℝ] (mfderiv 𝓘(ℝ,Ek) 𝓘(ℝ,E) ι 1 X))
  (hAd : ∀ k X, φ (P.Ad k X) =
    TauCeti.ComplexGroupLie.ad 𝓘(ℝ,E) Ginf (ι k) (φ X))
  (hUM : ∀ f : AutomorphicForm 𝓘(ℝ,E) ι height Γ, ∃ N : ℕ,
    f.val ∈ UniformModerateGrowth 𝓘(ℝ,E) height Γ N)

/-- The common-exponent theorem is the analytic prerequisite needed to restrict
the differentiated action to the moderately growing automorphic carrier. -/
def AutomorphicForm.gkModule (h1 : ∀ g, 1≤height g)
    (P : Pair 𝓘(ℝ,Ek) K q) (hsmooth : ContMDiff 𝓘(ℝ,Ek) 𝓘(ℝ,E) ∞ ι)
    (φ : q ≃ₗ⁅ℂ⁆ TauCeti.ComplexGroupLie 𝓘(ℝ,E) Ginf)
    (hφ : ∀ X : GroupLieAlgebra 𝓘(ℝ,Ek) K,
      φ (P.iota (1 ⊗ₜ[ℝ] X))=1 ⊗ₜ[ℝ] (mfderiv 𝓘(ℝ,Ek) 𝓘(ℝ,E) ι 1 X))
    (hAd : ∀ k X, φ (P.Ad k X)=TauCeti.ComplexGroupLie.ad 𝓘(ℝ,E) Ginf (ι k) (φ X))
    (hUM : ∀ f : AutomorphicForm 𝓘(ℝ,E) ι height Γ, ∃ N : ℕ,
      f.val ∈ UniformModerateGrowth 𝓘(ℝ,E) height Γ N) :
    GKModule P (AutomorphicForm 𝓘(ℝ,E) ι height Γ) := sorry

theorem AutomorphicForm.gkModule_lie (X : q)
    (f : AutomorphicForm 𝓘(ℝ,E) ι height Γ) :
    ((AutomorphicForm.gkModule (E := E) ι height Γ h1 P hsmooth φ hφ hAd hUM).rho X f).val =
      SmoothAdelicFunction.complexLieAction 𝓘(ℝ,E) (φ X) f.val := sorry

theorem AutomorphicForm.gkModule_group (k : K)
    (f : AutomorphicForm 𝓘(ℝ,E) ι height Γ) (g : Ginf × Gf) :
    ((AutomorphicForm.gkModule (E := E) ι height Γ h1 P hsmooth φ hφ hAd hUM).sigma k f).val.val g =
      f.val.val (g*(ι k,1)) := sorry

theorem AutomorphicForm.actions_commute (g : Gf) (X : q)
    (f : AutomorphicForm 𝓘(ℝ,E) ι height Γ) :
    AutomorphicForm.finiteAction (E := E) ι height Γ h1 hmul g
      ((AutomorphicForm.gkModule (E := E) ι height Γ h1 P hsmooth φ hφ hAd hUM).rho X f) =
    (AutomorphicForm.gkModule (E := E) ι height Γ h1 P hsmooth φ hφ hAd hUM).rho X
      (AutomorphicForm.finiteAction (E := E) ι height Γ h1 hmul g f) := sorry

-- Nondegenerate global distribution-Hecke modules are identified with these
-- crossed actions by AF.2/archimedean-hecke-algebra; its native distribution
-- carrier and balanced tensor comparison are explicit supplier obligations.
end AutomorphicActions

section CuspKernels
variable {E : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]
  {Ginf : Type*} [Group Ginf] [TopologicalSpace Ginf] [ChartedSpace E Ginf]
  [LieGroup 𝓘(ℝ,E) ∞ Ginf] {Gf : Type*} [Group Gf] [TopologicalSpace Gf]
  [IsTopologicalGroup Gf] [LocallyCompactSpace Gf] [TotallyDisconnectedSpace Gf] [T2Space Gf]
  {K : Type*} [Group K] (ι : K →* Ginf)
  (height : Ginf × Gf → ℝ) (Γ : Subgroup (Ginf × Gf))

def AutomorphicForm.toContinuousInvariant :
    AutomorphicForm 𝓘(ℝ,E) ι height Γ →ₗ[ℂ] ContinuousInvariant Γ := sorry

theorem AutomorphicForm.toContinuousInvariant_apply
    (f : AutomorphicForm 𝓘(ℝ,E) ι height Γ) (g : Ginf × Gf) :
    AutomorphicForm.toContinuousInvariant (E := E) ι height Γ f g = f.val.val g := sorry

variable (RationalParabolics : Type*) (N : RationalParabolics → Subgroup (Ginf × Gf))
  [∀ p, CompactSpace (UnipotentQuotient Γ (N p))]
  (dn : ∀ p, QuotientProbability Γ (N p))

/-- The AA supplier indexes every proper rational parabolic and supplies its
unipotent radical. This kernel construction accepts precisely that family;
no claim that an arbitrary subgroup is a rational parabolic is made. -/
def CuspForm : Submodule ℂ (AutomorphicForm 𝓘(ℝ,E) ι height Γ) where
  carrier := {f | ∀ p, constantTerm Γ (N p) (dn p)
    (AutomorphicForm.toContinuousInvariant (E := E) ι height Γ f) = 0}
  zero_mem' := sorry
  add_mem' := sorry
  smul_mem' := sorry

theorem CuspForm.constantTerm_eq_zero (f : AutomorphicForm 𝓘(ℝ,E) ι height Γ) :
    f ∈ CuspForm (E := E) ι height Γ RationalParabolics N dn ↔
      ∀ p, constantTerm Γ (N p) (dn p)
        (AutomorphicForm.toContinuousInvariant (E := E) ι height Γ f)=0 := Iff.rfl

-- test: cuspForm_anisotropic. No proper rational parabolics means an empty index.
example [IsEmpty RationalParabolics] :
    CuspForm (E := E) ι height Γ RationalParabolics N dn=⊤ := sorry

-- test: cuspForm_const_not. Every nonempty proper-parabolic family detects constants.
example [Nonempty RationalParabolics] (h1 : ∀ g, 1≤height g)
    (f : AutomorphicForm 𝓘(ℝ,E) ι height Γ) (hf : ∀ g, f.val.val g=1) :
    f ∉ CuspForm (E := E) ι height Γ RationalParabolics N dn := sorry

-- test: cuspForm_nonzero_constantTerm. A nonzero constant term detects failure,
-- including E₄ after the exact classical/adelic dictionary has been imported.
example (f : AutomorphicForm 𝓘(ℝ,E) ι height Γ) (p : RationalParabolics)
    (h : constantTerm Γ (N p) (dn p)
      (AutomorphicForm.toContinuousInvariant (E := E) ι height Γ f) ≠ 0) :
    f ∉ CuspForm (E := E) ι height Γ RationalParabolics N dn := sorry
end CuspKernels
end TauCeti.Automorphic

namespace TauCeti.RealReductive
open TauCeti.Automorphic
section Distributions
variable {E : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]
  (I : ModelWithCorners ℝ E E) (G : Type*) [Group G] [TopologicalSpace G]
  [ChartedSpace E G] [LieGroup I ∞ G]

/-- A separate type keeps the smooth compact-convergence topology distinct
from pointwise convergence on the ambient function space. -/
def SmoothScalar := SmoothAdelicFunction (Ginf := G) (Gf := PUnit.{1}) I
instance : AddCommGroup (SmoothScalar I G) :=
  inferInstanceAs (AddCommGroup (SmoothAdelicFunction (Ginf := G) (Gf := PUnit.{1}) I))
instance : Module ℂ (SmoothScalar I G) :=
  inferInstanceAs (Module ℂ (SmoothAdelicFunction (Ginf := G) (Gf := PUnit.{1}) I))

def SmoothScalar.apply (f : SmoothScalar I G) (g : G) : ℂ := f.val (g,PUnit.unit)

def SmoothScalar.derivativeSeminorm (C : {C : Set G // IsCompact C})
    (u : UniversalEnvelopingAlgebra ℂ (TauCeti.ComplexGroupLie I G)) :
    Seminorm ℂ (SmoothScalar I G) := sorry

theorem SmoothScalar.derivativeSeminorm_apply (C : {C : Set G // IsCompact C})
    (u : UniversalEnvelopingAlgebra ℂ (TauCeti.ComplexGroupLie I G))
    (f : SmoothScalar I G) : SmoothScalar.derivativeSeminorm I G C u f =
    sSup (Set.range (fun g => @ite ℝ (g∈C.val) (Classical.propDecidable _)
      ‖(SmoothAdelicFunction.envelopingAction I u f).val (g,PUnit.unit)‖ 0)) := sorry

instance SmoothScalar.topology : TopologicalSpace (SmoothScalar I G) :=
  (SeminormFamily.moduleFilterBasis
    (fun i : {C : Set G // IsCompact C} ×
      UniversalEnvelopingAlgebra ℂ (TauCeti.ComplexGroupLie I G) =>
      SmoothScalar.derivativeSeminorm I G i.1 i.2)).topology
instance : IsTopologicalAddGroup (SmoothScalar I G) := sorry
instance : ContinuousSMul ℂ (SmoothScalar I G) := sorry

/-- The continuous dual of C∞(G) consists of compactly supported distributions. -/
abbrev Distribution := SmoothScalar I G →L[ℂ] ℂ

def SmoothScalar.leftTranslate (g : G) (f : SmoothScalar I G) : SmoothScalar I G :=
  ⟨fun x => f.val (g*x.1,x.2), by sorry⟩
def SmoothScalar.rightTranslate (g : G) (f : SmoothScalar I G) : SmoothScalar I G :=
  ⟨fun x => f.val (x.1*g⁻¹,x.2), by sorry⟩

def Distribution.leftAction : Representation ℂ G (Distribution I G) := sorry
def Distribution.rightAction : Representation ℂ G (Distribution I G) := sorry

theorem Distribution.leftAction_apply (g : G) (D : Distribution I G) (f : SmoothScalar I G) :
    Distribution.leftAction I G g D f = D (SmoothScalar.leftTranslate I G g f) := sorry
theorem Distribution.rightAction_apply (g : G) (D : Distribution I G) (f : SmoothScalar I G) :
    Distribution.rightAction I G g D f = D (SmoothScalar.rightTranslate I G g f) := sorry

def Distribution.convolutionInner (D : Distribution I G) (f : SmoothScalar I G) :
    SmoothScalar I G := sorry
theorem Distribution.convolutionInner_apply (D : Distribution I G) (f : SmoothScalar I G) (g : G) :
    SmoothScalar.apply I G (Distribution.convolutionInner I G D f) g =
      D (SmoothScalar.leftTranslate I G g f) := sorry
def Distribution.convolution (D D' : Distribution I G) : Distribution I G := sorry
theorem Distribution.convolution_apply (D D' : Distribution I G) (f : SmoothScalar I G) :
    Distribution.convolution I G D D' f = D (Distribution.convolutionInner I G D' f) := sorry

def Distribution.dirac (g : G) : Distribution I G := sorry
theorem Distribution.dirac_apply (g : G) (f : SmoothScalar I G) :
    Distribution.dirac I G g f=SmoothScalar.apply I G f g := sorry

instance : Ring (Distribution I G) where
  toAddCommGroup := inferInstance
  one := Distribution.dirac I G 1
  mul := Distribution.convolution I G
  mul_assoc := sorry
  one_mul := sorry
  mul_one := sorry
  left_distrib := sorry
  right_distrib := sorry
  zero_mul := sorry
  mul_zero := sorry
instance : Algebra ℂ (Distribution I G) := sorry
theorem Distribution.mul_eq_convolution (D D' : Distribution I G) :
    D*D'=Distribution.convolution I G D D' := sorry
theorem Distribution.one_apply (f : SmoothScalar I G) :
    (1 : Distribution I G) f=SmoothScalar.apply I G f 1 := sorry

def Distribution.enveloping : UniversalEnvelopingAlgebra ℂ (TauCeti.ComplexGroupLie I G)
    →ₐ[ℂ] Distribution I G := sorry
theorem Distribution.enveloping_apply
    (u : UniversalEnvelopingAlgebra ℂ (TauCeti.ComplexGroupLie I G)) (f : SmoothScalar I G) :
    Distribution.enveloping I G u f=
      (SmoothAdelicFunction.envelopingAction I u f).val (1,PUnit.unit) := sorry

variable {K : Type*} [Group K] (ι : K →* G)
def Distribution.IsSupportedOn (D : Distribution I G) : Prop :=
  ∀ f : SmoothScalar I G,
    (∃ O : Set G, IsOpen O ∧ Set.range ι⊆O ∧
      ∀ g∈O, SmoothScalar.apply I G f g=0) → D f=0

/-- Both compact translation orbits are finite-dimensional. Support is tested
on actual smooth functions vanishing near the embedded compact subgroup. -/
def archimedeanHeckeAlgebra : Submodule ℂ (Distribution I G) where
  carrier := {D | Distribution.IsSupportedOn I G ι D ∧
    D∈kFinite ((Distribution.leftAction I G).comp ι) ∧
    D∈kFinite ((Distribution.rightAction I G).comp ι)}
  zero_mem' := sorry
  add_mem' := sorry
  smul_mem' := sorry

variable [TopologicalSpace K] [CompactSpace K]
  (hι : Continuous ι)
instance archimedeanHeckeAlgebra.nonUnitalRing :
    NonUnitalRing (archimedeanHeckeAlgebra I G ι) where
  toAddCommGroup := inferInstance
  mul D D' := ⟨Distribution.convolution I G D.val D'.val, by sorry⟩
  mul_assoc := sorry
  left_distrib := sorry
  right_distrib := sorry
  zero_mul := sorry
  mul_zero := sorry
instance archimedeanHeckeAlgebra.module :
    Module ℂ (archimedeanHeckeAlgebra I G ι) := inferInstance
instance archimedeanHeckeAlgebra.isScalarTower :
    IsScalarTower ℂ (archimedeanHeckeAlgebra I G ι) (archimedeanHeckeAlgebra I G ι) := sorry
instance archimedeanHeckeAlgebra.smulCommClass :
    SMulCommClass ℂ (archimedeanHeckeAlgebra I G ι) (archimedeanHeckeAlgebra I G ι) := sorry

theorem archimedeanHeckeAlgebra.mul_val (D D' : archimedeanHeckeAlgebra I G ι) :
    (D*D').val=Distribution.convolution I G D.val D'.val := sorry

variable [MeasurableSpace K] [BorelSpace K]
  (dk : MeasureTheory.Measure K) [MeasureTheory.IsProbabilityMeasure dk]
  [dk.IsMulLeftInvariant] [dk.IsMulRightInvariant]

def archimedeanHeckeAlgebra.idempotent (hι : Continuous ι)
    (dk : MeasureTheory.Measure K) [MeasureTheory.IsProbabilityMeasure dk]
    [dk.IsMulLeftInvariant] [dk.IsMulRightInvariant] (n : ℕ) (τ : ContRepresentation ℂ K (Fin n → ℂ))
    (hjoint : Continuous (fun kv : K × (Fin n → ℂ) => τ kv.1 kv.2))
    (hτ : IsIrreducible τ.toRepresentation) : archimedeanHeckeAlgebra I G ι := sorry

theorem archimedeanHeckeAlgebra.idempotent_apply (n : ℕ)
    (τ : ContRepresentation ℂ K (Fin n → ℂ))
    (hjoint : Continuous (fun kv : K × (Fin n → ℂ) => τ kv.1 kv.2))
    (hτ : IsIrreducible τ.toRepresentation) (f : SmoothScalar I G) :
    (archimedeanHeckeAlgebra.idempotent I G ι hι dk n τ hjoint hτ).val f =
      ∫ k, (n : ℂ) * LinearMap.trace ℂ (Fin n → ℂ) (τ k⁻¹).toLinearMap *
        SmoothScalar.apply I G f (ι k) ∂dk := sorry

-- test: archHecke_compact_projector
example (n : ℕ) (τ : ContRepresentation ℂ K (Fin n → ℂ))
    (hjoint : Continuous (fun kv : K × (Fin n → ℂ) => τ kv.1 kv.2))
    (hτ : IsIrreducible τ.toRepresentation) :
    let e := archimedeanHeckeAlgebra.idempotent I G ι hι dk n τ hjoint hτ
    e*e=e := sorry

-- test: archHecke_not_unital. A positive dimensional compact subgroup has
-- infinitely many independent translates of the Dirac distribution.
example [Infinite K] (hinj : Function.Injective ι) [T2Space G] :
    (1 : Distribution I G) ∉ archimedeanHeckeAlgebra I G ι := sorry
end Distributions
end TauCeti.RealReductive
namespace TauCeti.RelativeLieCohomology
section ActualPair
variable {E Ek : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]
  [NormedAddCommGroup Ek] [NormedSpace ℝ Ek] [FiniteDimensional ℝ Ek]
  {G K : Type*} [Group G] [Group K] [TopologicalSpace G] [TopologicalSpace K]
  [ChartedSpace E G] [ChartedSpace Ek K] [LieGroup 𝓘(ℝ,E) ∞ G]
  [LieGroup 𝓘(ℝ,Ek) ∞ K] [CompactSpace K]
  {q : Type*} [NormedComplexLieAlgebra q]

def Pair.ofLieGroup (ι : K →* G) (hs : ContMDiff 𝓘(ℝ,Ek) 𝓘(ℝ,E) ∞ ι)
    (φ : q ≃ₗ⁅ℂ⁆ TauCeti.ComplexGroupLie 𝓘(ℝ,E) G)
    (dι : TauCeti.ComplexGroupLie 𝓘(ℝ,Ek) K →ₗ⁅ℂ⁆ TauCeti.ComplexGroupLie 𝓘(ℝ,E) G)
    (hd : ∀ X : GroupLieAlgebra 𝓘(ℝ,Ek) K,
      dι (1 ⊗ₜ[ℝ] X)=1 ⊗ₜ[ℝ] (mfderiv 𝓘(ℝ,Ek) 𝓘(ℝ,E) ι 1 X))
    (hi : Function.Injective dι) : Pair 𝓘(ℝ,Ek) K q := sorry

theorem Pair.ofLieGroup_iota (ι : K →* G)
    (hs : ContMDiff 𝓘(ℝ,Ek) 𝓘(ℝ,E) ∞ ι)
    (φ : q ≃ₗ⁅ℂ⁆ TauCeti.ComplexGroupLie 𝓘(ℝ,E) G)
    (dι : TauCeti.ComplexGroupLie 𝓘(ℝ,Ek) K →ₗ⁅ℂ⁆ TauCeti.ComplexGroupLie 𝓘(ℝ,E) G)
    (hd : ∀ X : GroupLieAlgebra 𝓘(ℝ,Ek) K,
      dι (1 ⊗ₜ[ℝ] X)=1 ⊗ₜ[ℝ] (mfderiv 𝓘(ℝ,Ek) 𝓘(ℝ,E) ι 1 X))
    (hi : Function.Injective dι) (X : TauCeti.ComplexGroupLie 𝓘(ℝ,Ek) K) :
    (Pair.ofLieGroup ι hs φ dι hd hi).iota X=φ.symm (dι X) := sorry

-- test: pair_ofLieGroup_compat
example (ι : K →* G) (hs : ContMDiff 𝓘(ℝ,Ek) 𝓘(ℝ,E) ∞ ι)
    (φ : q ≃ₗ⁅ℂ⁆ TauCeti.ComplexGroupLie 𝓘(ℝ,E) G)
    (dι : TauCeti.ComplexGroupLie 𝓘(ℝ,Ek) K →ₗ⁅ℂ⁆ TauCeti.ComplexGroupLie 𝓘(ℝ,E) G)
    (hd : ∀ X : GroupLieAlgebra 𝓘(ℝ,Ek) K,
      dι (1 ⊗ₜ[ℝ] X)=1 ⊗ₜ[ℝ] (mfderiv 𝓘(ℝ,Ek) 𝓘(ℝ,E) ι 1 X))
    (hi : Function.Injective dι) (X : GroupLieAlgebra 𝓘(ℝ,Ek) K) :
    φ ((Pair.ofLieGroup ι hs φ dι hd hi).iota (1 ⊗ₜ[ℝ] X))=
      1 ⊗ₜ[ℝ] (mfderiv 𝓘(ℝ,Ek) 𝓘(ℝ,E) ι 1 X) := sorry
/-- The compact group itself, transported along the actual Lie-algebra
identification; its differentiated inclusion is surjective. -/
def Pair.compact (φ : TauCeti.ComplexGroupLie 𝓘(ℝ,Ek) K ≃ₗ⁅ℂ⁆ q) :
    Pair 𝓘(ℝ,Ek) K q := sorry

theorem Pair.compact_iota (φ : TauCeti.ComplexGroupLie 𝓘(ℝ,Ek) K ≃ₗ⁅ℂ⁆ q)
    (X : TauCeti.ComplexGroupLie 𝓘(ℝ,Ek) K) :
    (Pair.compact φ).iota X=φ X := sorry

-- test: pair_compact. This tests the quotient, rather than its dimension formula.
example (φ : TauCeti.ComplexGroupLie 𝓘(ℝ,Ek) K ≃ₗ⁅ℂ⁆ q) :
    Subsingleton (q ⧸ (Pair.compact φ).iota.range.toSubmodule) := sorry

end ActualPair
end TauCeti.RelativeLieCohomology

namespace TauCeti.RealReductive
open TauCeti.Automorphic TauCeti.RelativeLieCohomology
section BalancedHecke
variable {E Ek : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]
  [NormedAddCommGroup Ek] [NormedSpace ℝ Ek] [FiniteDimensional ℝ Ek]
  {G K : Type*} [Group G] [Group K] [TopologicalSpace G] [TopologicalSpace K]
  [ChartedSpace E G] [ChartedSpace Ek K] [LieGroup 𝓘(ℝ,E) ∞ G]
  [LieGroup 𝓘(ℝ,Ek) ∞ K] [CompactSpace K]
  (ι : K →* G) (hs : ContMDiff 𝓘(ℝ,Ek) 𝓘(ℝ,E) ∞ ι)
  [MeasurableSpace K] [BorelSpace K]
  (dk : MeasureTheory.Measure K) [MeasureTheory.IsProbabilityMeasure dk]
  [dk.IsMulLeftInvariant] [dk.IsMulRightInvariant]

/-- Representative functions, with both finite orbit conditions made explicit. -/
def representativeFunctions : Submodule ℂ (SmoothScalar 𝓘(ℝ,Ek) K) where
  carrier := {r |
    FiniteDimensional ℂ (Submodule.span ℂ (Set.range
      (fun k => SmoothScalar.leftTranslate 𝓘(ℝ,Ek) K k r))) ∧
    FiniteDimensional ℂ (Submodule.span ℂ (Set.range
      (fun k => SmoothScalar.rightTranslate 𝓘(ℝ,Ek) K k r)))}
  zero_mem' := sorry
  add_mem' := sorry
  smul_mem' := sorry

/-- Negative left differentiation is the action induced by convolution
of a derivative of Dirac with a Haar density. -/
def representativeFunctions.envelopingAction :
    UniversalEnvelopingAlgebra ℂ (TauCeti.ComplexGroupLie 𝓘(ℝ,Ek) K)
      →ₐ[ℂ] Module.End ℂ (representativeFunctions (Ek := Ek) (K := K)) := sorry

theorem representativeFunctions.envelopingAction_generator
    (X : GroupLieAlgebra 𝓘(ℝ,Ek) K) (r : representativeFunctions (Ek := Ek) (K := K)) (k : K) :
    SmoothScalar.apply 𝓘(ℝ,Ek) K
      (representativeFunctions.envelopingAction
        (UniversalEnvelopingAlgebra.ι ℂ (1 ⊗ₜ[ℝ] X)) r).val k =
      -mfderiv 𝓘(ℝ,Ek) 𝓘(ℝ,ℂ)
        (fun x : K => SmoothScalar.apply 𝓘(ℝ,Ek) K r.val (x*k)) 1 X := sorry

def representativeFunctions.toHecke (hs : ContMDiff 𝓘(ℝ,Ek) 𝓘(ℝ,E) ∞ ι)
    (dk : MeasureTheory.Measure K) [MeasureTheory.IsProbabilityMeasure dk]
    [dk.IsMulLeftInvariant] [dk.IsMulRightInvariant] :
    representativeFunctions (Ek := Ek) (K := K) →ₗ[ℂ]
      archimedeanHeckeAlgebra 𝓘(ℝ,E) G ι := sorry

theorem representativeFunctions.toHecke_apply (r : representativeFunctions (Ek := Ek) (K := K))
    (f : SmoothScalar 𝓘(ℝ,E) G) :
    (representativeFunctions.toHecke ι hs dk r).val f=
      ∫ k, SmoothScalar.apply 𝓘(ℝ,Ek) K r.val k *
        SmoothScalar.apply 𝓘(ℝ,E) G f (ι k) ∂dk := sorry

variable (dι : TauCeti.ComplexGroupLie 𝓘(ℝ,Ek) K →ₗ⁅ℂ⁆ TauCeti.ComplexGroupLie 𝓘(ℝ,E) G)
  (hd : ∀ X : GroupLieAlgebra 𝓘(ℝ,Ek) K,
    dι (1 ⊗ₜ[ℝ] X)=1 ⊗ₜ[ℝ] (mfderiv 𝓘(ℝ,Ek) 𝓘(ℝ,E) ι 1 X))
  (hi : Function.Injective dι)

def compactEnveloping : UniversalEnvelopingAlgebra ℂ (TauCeti.ComplexGroupLie 𝓘(ℝ,Ek) K)
    →ₐ[ℂ] UniversalEnvelopingAlgebra ℂ (TauCeti.ComplexGroupLie 𝓘(ℝ,E) G) :=
  UniversalEnvelopingAlgebra.lift ℂ ((UniversalEnvelopingAlgebra.ι ℂ).comp dι)

/-- Tensoring over a noncommutative enveloping algebra is expressed as an
actual quotient of the complex tensor by its balance relations. -/
def heckeBalance : Submodule ℂ
    (UniversalEnvelopingAlgebra ℂ (TauCeti.ComplexGroupLie 𝓘(ℝ,E) G)
      ⊗[ℂ] representativeFunctions (Ek := Ek) (K := K)) :=
  Submodule.span ℂ {z | ∃ x u r,
    z=(x*compactEnveloping dι u) ⊗ₜ[ℂ] r -
      x ⊗ₜ[ℂ] (representativeFunctions.envelopingAction u r)}

abbrev BalancedHecke :=
  (UniversalEnvelopingAlgebra ℂ (TauCeti.ComplexGroupLie 𝓘(ℝ,E) G)
    ⊗[ℂ] representativeFunctions (Ek := Ek) (K := K)) ⧸ heckeBalance dι

def archimedeanHeckeAlgebra.tensorEquiv
    (hs : ContMDiff 𝓘(ℝ,Ek) 𝓘(ℝ,E) ∞ ι)
    (dk : MeasureTheory.Measure K) [MeasureTheory.IsProbabilityMeasure dk]
    [dk.IsMulLeftInvariant] [dk.IsMulRightInvariant]
    (hd : ∀ X : GroupLieAlgebra 𝓘(ℝ,Ek) K,
      dι (1 ⊗ₜ[ℝ] X)=1 ⊗ₜ[ℝ] (mfderiv 𝓘(ℝ,Ek) 𝓘(ℝ,E) ι 1 X))
    (hi : Function.Injective dι) (hι : Function.Injective ι) :
    BalancedHecke dι ≃ₗ[ℂ] archimedeanHeckeAlgebra 𝓘(ℝ,E) G ι := sorry

theorem archimedeanHeckeAlgebra.tensorEquiv_tmul (hι : Function.Injective ι)
    (u : UniversalEnvelopingAlgebra ℂ (TauCeti.ComplexGroupLie 𝓘(ℝ,E) G))
    (r : representativeFunctions (Ek := Ek) (K := K)) :
    (archimedeanHeckeAlgebra.tensorEquiv (ι := ι) (hs := hs) (dk := dk)
      (dι := dι) (hd := hd) (hi := hi) (hι := hι)
      (Submodule.Quotient.mk (u ⊗ₜ[ℂ] r))).val =
    Distribution.enveloping 𝓘(ℝ,E) G u * (representativeFunctions.toHecke ι hs dk r).val := sorry

variable {V : Type*} [AddCommGroup V] [Module ℂ V]
/-- Nondegenerate means actual local idempotent units act as identities on
individual vectors, rather than imposing a unit that this algebra lacks. -/
structure NondegenerateHeckeAction where
  action : archimedeanHeckeAlgebra 𝓘(ℝ,E) G ι →ₙₐ[ℂ] Module.End ℂ V
  nondegenerate : ∀ v : V, ∃ e : archimedeanHeckeAlgebra 𝓘(ℝ,E) G ι,
    e*e=e ∧ action e v=v

variable {q : Type*} [NormedComplexLieAlgebra q]
  (φ : q ≃ₗ⁅ℂ⁆ TauCeti.ComplexGroupLie 𝓘(ℝ,E) G) (hι : Function.Injective ι)

def archimedeanHeckeAlgebra.moduleEquiv
    (hs : ContMDiff 𝓘(ℝ,Ek) 𝓘(ℝ,E) ∞ ι)
    (dk : MeasureTheory.Measure K) [MeasureTheory.IsProbabilityMeasure dk]
    [dk.IsMulLeftInvariant] [dk.IsMulRightInvariant]
    (hd : ∀ X : GroupLieAlgebra 𝓘(ℝ,Ek) K,
      dι (1 ⊗ₜ[ℝ] X)=1 ⊗ₜ[ℝ] (mfderiv 𝓘(ℝ,Ek) 𝓘(ℝ,E) ι 1 X))
    (hi : Function.Injective dι) (hι : Function.Injective ι) :
    GKModule (Pair.ofLieGroup ι hs φ dι hd hi) V ≃ NondegenerateHeckeAction (E := E) (V := V) ι := sorry

def integratedRepresentative (A : GKModule (Pair.ofLieGroup ι hs φ dι hd hi) V)
    (dk : MeasureTheory.Measure K) [MeasureTheory.IsProbabilityMeasure dk]
    [dk.IsMulLeftInvariant] [dk.IsMulRightInvariant]
    (r : representativeFunctions (Ek := Ek) (K := K)) : Module.End ℂ V := sorry

theorem integratedRepresentative_apply
    (A : GKModule (Pair.ofLieGroup ι hs φ dι hd hi) V)
    (r : representativeFunctions (Ek := Ek) (K := K)) (v : V) (ell : V →ₗ[ℂ] ℂ) :
    ell (integratedRepresentative ι hs dι hd hi φ A dk r v)=
      ∫ k, SmoothScalar.apply 𝓘(ℝ,Ek) K r.val k * ell (A.sigma k v) ∂dk := sorry

theorem archimedeanHeckeAlgebra.action_tmul
    (A : GKModule (Pair.ofLieGroup ι hs φ dι hd hi) V)
    (u : UniversalEnvelopingAlgebra ℂ (TauCeti.ComplexGroupLie 𝓘(ℝ,E) G))
    (r : representativeFunctions (Ek := Ek) (K := K)) (v : V) :
    (archimedeanHeckeAlgebra.moduleEquiv (ι := ι) (hs := hs) (dk := dk)
      (dι := dι) (hd := hd) (hi := hi) (φ := φ) (hι := hι) A).action
      (archimedeanHeckeAlgebra.tensorEquiv (ι := ι) (hs := hs) (dk := dk)
      (dι := dι) (hd := hd) (hi := hi) (hι := hι)
        (Submodule.Quotient.mk (u ⊗ₜ[ℂ] r))) v =
      UniversalEnvelopingAlgebra.lift ℂ (A.rho.comp φ.symm.toLieHom) u
        (integratedRepresentative ι hs dι hd hi φ A dk r v) := sorry
end BalancedHecke
end TauCeti.RealReductive
namespace TauCeti.RealReductive
section MatrixCoefficients
variable {G K H : Type*} [Group G] [Group K] [TopologicalSpace K] [CompactSpace K]
  [IsTopologicalGroup K] [TopologicalSpace G]
  [IsTopologicalGroup G] [NormedAddCommGroup H] [NormedSpace ℂ H]
  [CompleteSpace H] (C : Subgroup G) [C.Normal] (ι : K →* G)

/-- A supplied Banach or Hilbert realization, independently of the canonical
Casselman–Wallach theorem. The central action is an actual scalar equation. -/
structure CoefficientRealization where
  π : ContRepresentation ℂ G H
  joint : Continuous (fun gv : G × H => π gv.1 gv.2)
  ψ : C →* ℂˣ
  central : ∀ c : C, ∀ v : H, π c v=(ψ c : ℂ) • v

variable {C}

def CoefficientRealization.dualK (A : CoefficientRealization (H := H) C) (ι : K →* G) :
    Representation ℂ K (H →L[ℂ] ℂ) := sorry

theorem CoefficientRealization.dualK_apply (A : CoefficientRealization (H := H) C)
    (k : K) (ell : H →L[ℂ] ℂ) (v : H) :
    A.dualK ι k ell v=ell (A.π (ι k⁻¹) v) := sorry

def CoefficientRealization.centralCoefficient (A : CoefficientRealization (H := H) C)
    (hunit : ∀ c : C, ‖(A.ψ c : ℂ)‖=1) (v : H) (ell : H →L[ℂ] ℂ) :
    G ⧸ C → ℝ := sorry

theorem CoefficientRealization.centralCoefficient_mk
    (A : CoefficientRealization (H := H) C)
    (hunit : ∀ c : C, ‖(A.ψ c : ℂ)‖=1) (v : H) (ell : H →L[ℂ] ℂ) (g : G) :
    A.centralCoefficient hunit v ell (QuotientGroup.mk g)=‖ell (A.π g v)‖ := sorry

variable (hι : Continuous ι) [MeasurableSpace (G ⧸ C)] (μ : MeasureTheory.Measure (G ⧸ C))
  [μ.IsHaarMeasure]

def IsSquareIntegrable (ι : K →* G) (hι : Continuous ι) (μ : MeasureTheory.Measure (G ⧸ C)) [μ.IsHaarMeasure]
    (A : CoefficientRealization (H := H) C) : Prop :=
  ∃ hunit : ∀ c : C, ‖(A.ψ c : ℂ)‖=1,
    ∀ v ∈ kFinite (A.π.toRepresentation.comp ι),
      ∀ ell ∈ kFinite (A.dualK ι),
        MeasureTheory.MemLp (A.centralCoefficient hunit v ell) 2 μ

def IsTempered (ι : K →* G) (hι : Continuous ι) (μ : MeasureTheory.Measure (G ⧸ C)) [μ.IsHaarMeasure]
    (A : CoefficientRealization (H := H) C) : Prop :=
  ∃ hunit : ∀ c : C, ‖(A.ψ c : ℂ)‖=1,
    ∀ ε : ℝ, 0<ε → ∀ v ∈ kFinite (A.π.toRepresentation.comp ι),
      ∀ ell ∈ kFinite (A.dualK ι),
        MeasureTheory.MemLp (A.centralCoefficient hunit v ell)
          (ENNReal.ofReal (2+ε)) μ

def CoefficientRealization.twist (A : CoefficientRealization (H := H) C)
    (χ : G →* ℂˣ) (hχ : Continuous χ) : CoefficientRealization (H := H) C := sorry

theorem CoefficientRealization.twist_apply (A : CoefficientRealization (H := H) C)
    (χ : G →* ℂˣ) (hχ : Continuous χ) (g : G) (v : H) :
    (A.twist χ hχ).π g v=(χ g : ℂ) • A.π g v := sorry

def IsEssentiallyTempered (A : CoefficientRealization (H := H) C) : Prop :=
  ∃ χ : G →* ℂˣ, ∃ hχ : Continuous χ, IsTempered ι hι μ (A.twist χ hχ)

/-- The bounded coefficient input is essential for the L² to L²⁺ε implication.
It follows from a unitary Hilbert realization, and is stated here concretely. -/
theorem IsSquareIntegrable.isTempered (A : CoefficientRealization (H := H) C)
    (hA : IsSquareIntegrable ι hι μ A)
    (hbounded : ∀ (g : G) (v : H), ‖A.π g v‖=‖v‖) : IsTempered ι hι μ A := sorry

theorem IsTempered.twist_unitary (A : CoefficientRealization (H := H) C)
    (hA : IsTempered ι hι μ A) (χ : G →* ℂˣ) (hχ : Continuous χ)
    (hu : ∀ g, ‖(χ g : ℂ)‖=1) : IsTempered ι hι μ (A.twist χ hχ) := sorry

-- test: tempered_compact. A finite quotient Haar measure and bounded
-- coefficients are the concrete compact-mod-centre computation.
example [MeasureTheory.IsFiniteMeasure μ] (A : CoefficientRealization (H := H) C)
    (hu : ∀ c : C, ‖(A.ψ c : ℂ)‖=1)
    (hb : ∀ g v, ‖A.π g v‖=‖v‖)
    (hm : ∀ v ell, MeasureTheory.AEStronglyMeasurable (A.centralCoefficient hu v ell) μ) :
    IsSquareIntegrable ι hι μ A ∧ IsTempered ι hι μ A := sorry

-- The trivial representation on an infinite-measure quotient has a constant
-- nonzero coefficient. This is the analytic core of tempered_trivial_not.
-- test: tempered_infinite_volume_trivial
example (A : CoefficientRealization (H := ℂ) C)
    (htriv : ∀ g z, A.π g z=z) (hu : ∀ c : C, ‖(A.ψ c : ℂ)‖=1)
    (hμ : μ Set.univ=⊤) : ¬IsTempered ι hι μ A := sorry
end MatrixCoefficients
end TauCeti.RealReductive
namespace TauCeti.Automorphic
open TauCeti.RelativeLieCohomology TauCeti.RealReductive
section Cohomological
variable {E : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]
  {H : Type*} [TopologicalSpace H] {I : ModelWithCorners ℝ E H}
  {K : Type*} [Group K] [TopologicalSpace K] [ChartedSpace H K]
  [LieGroup I ∞ K] [CompactSpace K] {q : Type*} [NormedComplexLieAlgebra q]
  {P : Pair I K q} {V W : Type*} [AddCommGroup V] [Module ℂ V]
  [AddCommGroup W] [Module ℂ W] [FiniteDimensional ℂ W]

/-- The coefficient is supplied as an actual finite-dimensional compatible
module. Its identification with an algebraic highest-weight representation
requires the integral group character lattice from the algebraic-group owner. -/
def IsCohomologicalWith (A : GKModule P V) (coefficient : GKModule P W) : Prop :=
  ∃ n : ℕ, Nontrivial (cohomology (GKModule.tensorFinite P A coefficient) n)

def IsCohomologicalWith.nonzeroDegree (A : GKModule P V) (B : GKModule P W)
    (h : IsCohomologicalWith A B) : ℕ := Classical.choose h

theorem IsCohomologicalWith.nonzeroDegree_nonzero (A : GKModule P V) (B : GKModule P W)
    (h : IsCohomologicalWith A B) :
    Nontrivial (cohomology (GKModule.tensorFinite P A B)
      (IsCohomologicalWith.nonzeroDegree A B h)) := sorry

/-- Wigner's lemma compares the module character with the contragredient
coefficient character; the finite dual derivative has its minus sign. -/
theorem infChar_eq_of_relativeCohomology_ne_zero
    (A : GKModule P V) (B : GKModule P W) (χ χdual : InfChar q)
    (hA : HasInfChar A χ) (hB : HasInfChar (restrictedDual B) χdual)
    (h : IsCohomologicalWith A B) : χ=χdual := sorry

theorem IsCohomologicalWith.infChar (A : GKModule P V) (B : GKModule P W)
    (χ χdual : InfChar q) (hA : HasInfChar A χ)
    (hB : HasInfChar (restrictedDual B) χdual) (h : IsCohomologicalWith A B) : χ=χdual := sorry

-- test: cohomologicalWith_trivial
example : IsCohomologicalWith (GKModule.trivial P) (GKModule.trivial P) := sorry

-- test: cohomological_zero_coefficient
-- A zero coefficient has zero cohomology in every degree.
example [Subsingleton W] (A : GKModule P V) (B : GKModule P W) :
    ¬IsCohomologicalWith A B := sorry

-- test: cohomological_wrong_character
-- Distinct infinitesimal characters are a discriminating non-example;
-- neither the tensor sign nor the dual coefficient can be discarded.
example (A : GKModule P V) (B : GKModule P W) (χ χdual : InfChar q)
    (hA : HasInfChar A χ) (hB : HasInfChar (restrictedDual B) χdual)
    (hne : χ≠χdual) : ¬IsCohomologicalWith A B := sorry
end Cohomological
end TauCeti.Automorphic
namespace TauCeti.Automorphic
open TauCeti.RelativeLieCohomology TauCeti.RealReductive
section GlobalActions
variable {E : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]
  {H : Type*} [TopologicalSpace H] {I : ModelWithCorners ℝ E H}
  {K : Type*} [Group K] [TopologicalSpace K] [ChartedSpace H K]
  [LieGroup I ∞ K] [CompactSpace K] {q : Type*} [NormedComplexLieAlgebra q]
  {P : Pair I K q} (Gf : Type*) [Group Gf] [TopologicalSpace Gf]
  {V W : Type*} [AddCommGroup V] [Module ℂ V] [AddCommGroup W] [Module ℂ W]

structure GlobalHeckeModule (P : Pair I K q) (V : Type*) [AddCommGroup V] [Module ℂ V]
    extends GKModule P V where
  finiteAction : Representation ℂ Gf V
  smoothFinite : ∀ v : V, IsOpen {g : Gf | finiteAction g v=v}
  commuteLie : ∀ g X v, finiteAction g (rho X v)=rho X (finiteAction g v)
  commuteCompact : ∀ g k v, finiteAction g (sigma k v)=sigma k (finiteAction g v)

variable {Gf}
structure GlobalHeckeModule.Hom (A : GlobalHeckeModule Gf P V)
    (B : GlobalHeckeModule Gf P W) extends GKModule.Hom A.toGKModule B.toGKModule where
  finite : ∀ g v, toLinearMap (A.finiteAction g v)=B.finiteAction g (toLinearMap v)

def GlobalHeckeModule.stable (A : GlobalHeckeModule Gf P V) (S : Submodule ℂ V) : Prop :=
  (∀ X v, v∈S → A.rho X v∈S) ∧ (∀ k v, v∈S → A.sigma k v∈S) ∧
    ∀ g v, v∈S → A.finiteAction g v∈S

def GlobalHeckeModule.submodule (A : GlobalHeckeModule Gf P V) (S : Submodule ℂ V)
    (hS : A.stable S) : GlobalHeckeModule Gf P S := sorry

def GlobalHeckeModule.quotient (A : GlobalHeckeModule Gf P V) (S : Submodule ℂ V)
    (hS : A.stable S) : GlobalHeckeModule Gf P (V ⧸ S) := sorry

structure GlobalHeckeModule.Iso (A : GlobalHeckeModule Gf P V)
    (B : GlobalHeckeModule Gf P W) where
  linear : V ≃ₗ[ℂ] W
  lie : ∀ X v, linear (A.rho X v)=B.rho X (linear v)
  compact : ∀ k v, linear (A.sigma k v)=B.sigma k (linear v)
  finite : ∀ g v, linear (A.finiteAction g v)=B.finiteAction g (linear v)

def AutomorphicSubquotient (base : GlobalHeckeModule Gf P V)
    (B : GlobalHeckeModule Gf P W) : Prop :=
  ∃ S : Submodule ℂ V, ∃ hS : base.stable S,
    ∃ T : Submodule ℂ S, ∃ hT : (base.submodule S hS).stable T,
      Nonempty (GlobalHeckeModule.Iso ((base.submodule S hS).quotient T hT) B)

def GlobalHeckeModule.IsIrreducible (A : GlobalHeckeModule Gf P V) : Prop :=
  Nontrivial V ∧ ∀ S : Submodule ℂ V, A.stable S → S=⊥ ∨ S=⊤


def GlobalHeckeModule.fixedMultiplicity (A : GlobalHeckeModule Gf P V)
    (n : ℕ) (τ : Representation ℂ K (Fin n → ℂ)) (J : Subgroup Gf) :
    Submodule ℂ ((Fin n → ℂ) →ₗ[ℂ] V) where
  carrier := {f | (∀ k v, f (τ k v)=A.sigma k (f v)) ∧
    ∀ j : J, ∀ v, A.finiteAction j (f v)=f v}
  zero_mem' := sorry
  add_mem' := sorry
  smul_mem' := sorry

def GlobalHeckeModule.IsAdmissible (A : GlobalHeckeModule Gf P V) : Prop :=
  ∀ (n : ℕ) (τ : ContRepresentation ℂ K (Fin n → ℂ)),
    Continuous (fun kv : K × (Fin n → ℂ) => τ kv.1 kv.2) →
    TauCeti.RealReductive.IsIrreducible τ.toRepresentation →
    ∀ J : Subgroup Gf, IsOpen (J : Set Gf) → IsCompact (J : Set Gf) →
      FiniteDimensional ℂ (A.fixedMultiplicity n τ.toRepresentation J)

end GlobalActions

section ActualAutomorphicSpace
variable {E Ek : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]
  [NormedAddCommGroup Ek] [NormedSpace ℝ Ek] [FiniteDimensional ℝ Ek]
  {Ginf Gf K : Type*} [Group Ginf] [Group Gf] [Group K]
  [TopologicalSpace Ginf] [TopologicalSpace Gf] [TopologicalSpace K]
  [IsTopologicalGroup Ginf] [LocallyCompactSpace Ginf] [T2Space Ginf]
  [SecondCountableTopology Ginf] [IsTopologicalGroup Gf] [LocallyCompactSpace Gf]
  [TotallyDisconnectedSpace Gf] [T2Space Gf] [SecondCountableTopology Gf]
  [ChartedSpace E Ginf] [ChartedSpace Ek K] [LieGroup 𝓘(ℝ,E) ∞ Ginf]
  [LieGroup 𝓘(ℝ,Ek) ∞ K] [CompactSpace K]
  {q : Type*} [NormedComplexLieAlgebra q] (P : Pair 𝓘(ℝ,Ek) K q)
  (ι : K →* Ginf) (height : Ginf × Gf → ℝ) (Γ : Subgroup (Ginf × Gf))
  (φ : q ≃ₗ⁅ℂ⁆ TauCeti.ComplexGroupLie 𝓘(ℝ,E) Ginf)

/-- The ambient carrier is the actual left-invariant, moderate, K-finite,
central-finite function space. Equations fix all three actions. This cannot be
instantiated with an arbitrary global representation and called automorphic. -/
structure AutomorphicFunctionAction where
  action : GlobalHeckeModule Gf P (AutomorphicForm 𝓘(ℝ,E) ι height Γ)
  lie_eq : ∀ X f,
    (action.rho X f).val=SmoothAdelicFunction.complexLieAction 𝓘(ℝ,E) (φ X) f.val
  compact_eq : ∀ k f g,
    (action.sigma k f).val.val g=f.val.val (g.1*ι k,g.2)
  finite_eq : ∀ y f g,
    (action.finiteAction y f).val.val g=f.val.val (g.1,g.2*y)

universe uAut
structure AutomorphicRepresentationModel
    (base : AutomorphicFunctionAction P ι height Γ φ) where
  carrier : Type uAut
  [addGroup : AddCommGroup carrier]
  [module : Module ℂ carrier]
  action : GlobalHeckeModule Gf P carrier
  irreducible : action.IsIrreducible
  admissible : action.IsAdmissible
  occurs : AutomorphicSubquotient base.action action

attribute [instance] AutomorphicRepresentationModel.addGroup AutomorphicRepresentationModel.module

def globalHomSpace {V W : Type*} [AddCommGroup V] [Module ℂ V]
    [AddCommGroup W] [Module ℂ W]
    (A : GlobalHeckeModule Gf P V) (B : GlobalHeckeModule Gf P W) :
    Submodule ℂ (V →ₗ[ℂ] W) where
  carrier := {f | (∀ X v, f (A.rho X v)=B.rho X (f v)) ∧
    (∀ k v, f (A.sigma k v)=B.sigma k (f v)) ∧
    ∀ g v, f (A.finiteAction g v)=B.finiteAction g (f v)}
  zero_mem' := sorry
  add_mem' := sorry
  smul_mem' := sorry

def AutomorphicRepresentationModel.homSpace
    (base : AutomorphicFunctionAction P ι height Γ φ)
    (π : AutomorphicRepresentationModel.{uAut} P ι height Γ φ base) : Submodule ℂ (π.carrier →ₗ[ℂ] AutomorphicForm 𝓘(ℝ,E) ι height Γ) :=
  globalHomSpace P π.action base.action

theorem AutomorphicRepresentationModel.finite_stabilizer_open
    (base : AutomorphicFunctionAction P ι height Γ φ)
    (π : AutomorphicRepresentationModel.{uAut} P ι height Γ φ base) (v : π.carrier) :
    IsOpen {g : Gf | π.action.finiteAction g v=v} := sorry


def AutomorphicRepresentationModel.isoSetoid
    (base : AutomorphicFunctionAction P ι height Γ φ) :
    Setoid (AutomorphicRepresentationModel.{uAut} P ι height Γ φ base) where
  r A B := Nonempty (GlobalHeckeModule.Iso A.action B.action)
  iseqv := sorry

def AutomorphicRepresentation (base : AutomorphicFunctionAction P ι height Γ φ) :=
  Quotient (AutomorphicRepresentationModel.isoSetoid.{uAut} P ι height Γ φ base)

def AutomorphicRepresentation.multiplicity
    (base : AutomorphicFunctionAction P ι height Γ φ) :
    AutomorphicRepresentation.{uAut} P ι height Γ φ base → ℕ∞ := by
  classical
  exact Quotient.lift (fun π =>
    if FiniteDimensional ℂ (AutomorphicRepresentationModel.homSpace P ι height Γ φ base π)
    then (Module.finrank ℂ (AutomorphicRepresentationModel.homSpace P ι height Γ φ base π) : ℕ∞)
    else ⊤) (by sorry)

-- Finiteness is a separate theorem using Harish-Chandra fixed-type finiteness,
-- not a consequence of defining multiplicity. The extended-natural carrier
-- records infinity instead of silently replacing an infinite dimension by 0.
-- Its native
-- arithmetic hypothesis and fixed-central-ideal supplier are recorded as gaps.

end ActualAutomorphicSpace
end TauCeti.Automorphic
namespace TauCeti.Automorphic
section ScalarExtension
variable {A B M GQ Gf : Type*} [CommRing A] [CommRing B] [Algebra A B]
  [AddCommGroup M] [Module A M] [Group GQ] [Group Gf]
  (ι : GQ →* Gf) (σ : Representation A GQ M)

def scalarExtendRepresentation (σ : Representation A GQ M) :
    Representation B GQ (B ⊗[A] M) where
  toFun g := (σ g).baseChange B
  map_one' := sorry
  map_mul' := sorry

theorem scalarExtendRepresentation_tmul (g : GQ) (b : B) (m : M) :
    scalarExtendRepresentation (B := B) σ g (b ⊗ₜ[A] m)=b ⊗ₜ[A] σ g m := sorry

/-- The canonical base-change map exists at every level. Bijectivity needs
stabilizer hypotheses; it is not baked into the unrestricted definition. -/
def AlgebraicModularForm.baseChange (J : Subgroup Gf) :
    B ⊗[A] AlgebraicModularForm ι σ J →ₗ[B]
      AlgebraicModularForm ι (scalarExtendRepresentation (B := B) σ) J := sorry

theorem AlgebraicModularForm.baseChange_tmul (J : Subgroup Gf) (b : B)
    (f : AlgebraicModularForm ι σ J) (g : Gf) :
    (AlgebraicModularForm.baseChange (B := B) ι σ J (b ⊗ₜ[A] f)).val g=b ⊗ₜ[A] f.val g := sorry

def arithmeticStabilizer (J : Subgroup Gf) (t : Gf) : Subgroup GQ :=
  J.comap ((MulAut.conj t⁻¹).toMonoidHom.comp ι)

theorem AlgebraicModularForm.baseChange_bijective (J : Subgroup Gf)
    {h : ℕ} (t : Fin h → Gf)
    (hdecomp : ∀ g : Gf, ∃! i : Fin h,
      ∃ γ : GQ, ∃ u∈J, g=ι γ*t i*u)
    [∀ i : Fin h, Fintype (arithmeticStabilizer ι J (t i))]
    (hunit : ∀ i, IsUnit (Fintype.card (arithmeticStabilizer ι J (t i)) : A)) :
    Function.Bijective (AlgebraicModularForm.baseChange (B := B) ι σ J) := sorry

variable {G : Type*} [Group G] (Γ C J : Subgroup G)
  (σJ : Representation A J M) (ψ : C →* Aˣ)

def scalarExtendCentralCharacter : C →* Bˣ :=
  (Units.map (algebraMap A B).toMonoidHom).comp ψ

def CentralCharacterAlgebraicModularForm.baseChange :
    B ⊗[A] CentralCharacterAlgebraicModularForm Γ C J σJ ψ →ₗ[B]
      CentralCharacterAlgebraicModularForm Γ C J
        (scalarExtendRepresentation (B := B) σJ) (scalarExtendCentralCharacter (B := B) C ψ) := sorry

theorem CentralCharacterAlgebraicModularForm.baseChange_tmul (b : B)
    (f : CentralCharacterAlgebraicModularForm Γ C J σJ ψ) (g : G) :
    (CentralCharacterAlgebraicModularForm.baseChange (B := B) Γ C J σJ ψ
      (b ⊗ₜ[A] f)).val g=b ⊗ₜ[A] f.val g := sorry

-- Sufficiently small level and invertible-order effective stabilizer conditions
-- make the latter map bijective through the finite-class evaluation equivalence.
-- The central-quotient arithmetic finiteness is an AA.3/AA.4 supplier obligation.
end ScalarExtension
end TauCeti.Automorphic
namespace TauCeti.Automorphic.GSp4
/-- Coordinates of the split algebraic torus T. Its character lattice is Z³.
The compact Cartan lattice has a separate parity condition after transport. -/
abbrev Weight := ℤ × ℤ × ℤ

def chamber : Fin 4 → Set (ℝ × ℝ × ℝ)
  | 0 => {x | x.1≥x.2.1 ∧ x.2.1≥0}
  | 1 => {x | x.1≥-x.2.1 ∧ -x.2.1≥0}
  | 2 => {x | -x.2.1≥x.1 ∧ x.1≥0}
  | 3 => {x | -x.2.1≥-x.1 ∧ -x.1≥0}

def openChamber : Fin 4 → Set (ℝ × ℝ × ℝ)
  | 0 => {x | x.1>x.2.1 ∧ x.2.1>0}
  | 1 => {x | x.1>-x.2.1 ∧ -x.2.1>0}
  | 2 => {x | -x.2.1>x.1 ∧ x.1>0}
  | 3 => {x | -x.2.1>-x.1 ∧ -x.1>0}

def shifted (μ : Weight) : ℝ × ℝ × ℝ :=
  ((μ.1 : ℝ)-1,(μ.2.1 : ℝ)-2,(μ.2.2 : ℝ))

def IsRegularWeight (μ : Weight) : Prop :=
  μ.1≥μ.2.1 ∧ ∃ i : Fin 4, shifted μ∈openChamber i

def IsLimitWeight (μ : Weight) : Prop := by
  classical
  exact μ.1≥μ.2.1 ∧ Fintype.card {i : Fin 4 // shifted μ∈chamber i}=2

/-- Coefficient transport from the split torus to the compact Cartan. -/
def coherentCoefficient (μ : Weight) : Weight :=
  (-μ.2.1,-μ.1,μ.1+μ.2.1+2*μ.2.2)

def hcParameter (μ : Weight) : Weight :=
  (μ.1-1,μ.2.1-2,μ.1+μ.2.1+2*μ.2.2)

def compactCartanLattice : Set Weight := {x | x.2.2 % 2=(x.1+x.2.1)%2}

theorem coherentCoefficient_parity (μ : Weight) :
    coherentCoefficient μ∈compactCartanLattice := sorry

theorem limitWeight_families (μ : Weight) : IsLimitWeight μ ↔
    (μ.2.1=2 ∧ 2≤μ.1) ∨ (μ.2.1=3-μ.1 ∧ 2≤μ.1) ∨ (μ.1=1 ∧ μ.2.1≤1) := sorry

-- test: gsp4_chambers_union
example : (⋃ i : Fin 4, chamber i)={x : ℝ × ℝ × ℝ | x.1≥x.2.1} := sorry

-- test: gsp4_limit_family
example (a c : ℤ) (ha : 2≤a) : IsLimitWeight (a,2,c) ∧
    shifted (a,2,c)∈chamber 0 ∧ shifted (a,2,c)∈chamber 1 := sorry

/-- Pilloni's two numerical weight coordinates after the imported coordinate
conversion. This computes the three regularity walls, not a representation. -/
def pilloniCohomological (k r : ℤ) : Prop := r≠2 ∧ k+r≠1 ∧ k+2*r≠3

-- test: gsp4_cohomological_weight
example : ¬pilloniCohomological 0 2 ∧ pilloniCohomological 3 3 := sorry

-- test: gsp4_compact_wall_not. A compact wall is on only one closed chamber,
-- and hence cannot define a noncompact-wall limit weight.
example (t : ℝ) (ht : 0<t) (c : ℝ) :
    (t,t,c)∈chamber 0 ∧ ∀ i : Fin 4, (t,t,c)∈chamber i → i=0 := sorry
end TauCeti.Automorphic.GSp4

namespace TauCeti.RealReductive
section CircleProjectors

def circleWeight (n : ℤ) : ContRepresentation ℂ Circle (Fin 1 → ℂ) := sorry
theorem circleWeight_apply (n : ℤ) (k : Circle) (v : Fin 1 → ℂ) (i : Fin 1) :
    circleWeight n k v i=(k : ℂ)^n*v i := sorry
theorem circleWeight_joint (n : ℤ) :
    Continuous (fun kv : Circle × (Fin 1 → ℂ) => circleWeight n kv.1 kv.2) := sorry
theorem circleWeight_irreducible (n : ℤ) : IsIrreducible (circleWeight n).toRepresentation := sorry

variable {E : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]
  {G : Type*} [Group G] [TopologicalSpace G] [ChartedSpace E G]
  [LieGroup 𝓘(ℝ,E) ∞ G]
  (ι : Circle →* G) (hι : Continuous ι)
  (dk : MeasureTheory.Measure Circle) [MeasureTheory.IsProbabilityMeasure dk]
  [dk.IsMulLeftInvariant] [dk.IsMulRightInvariant]

def circleFourierIdempotent (n : ℤ) : archimedeanHeckeAlgebra 𝓘(ℝ,E) G ι :=
  archimedeanHeckeAlgebra.idempotent 𝓘(ℝ,E) G ι hι dk 1 (circleWeight n)
    (circleWeight_joint n) (circleWeight_irreducible n)

theorem circleFourierIdempotent_apply (n : ℤ) (f : SmoothScalar 𝓘(ℝ,E) G) :
    (circleFourierIdempotent (E := E) ι hι dk n).val f=
      ∫ k, (k : ℂ)^(-n)*SmoothScalar.apply 𝓘(ℝ,E) G f (ι k) ∂dk := sorry

-- test: archHecke_circle. Orthogonal Fourier projectors, including idempotence.
example (m n : ℤ) :
    circleFourierIdempotent (E := E) ι hι dk m * circleFourierIdempotent (E := E) ι hι dk n =
      if m=n then circleFourierIdempotent (E := E) ι hι dk n else 0 := sorry

variable {V : Type*} [NormedAddCommGroup V] [NormedSpace ℂ V] [CompleteSpace V]

def circleWeightProjector (dk : MeasureTheory.Measure Circle)
    [MeasureTheory.IsProbabilityMeasure dk] [dk.IsMulLeftInvariant] [dk.IsMulRightInvariant]
    (σ : ContRepresentation ℂ Circle V)
    (hj : Continuous (fun kv : Circle × V => σ kv.1 kv.2)) (n : ℤ) : V →L[ℂ] V := sorry
theorem circleWeightProjector_apply (σ : ContRepresentation ℂ Circle V)
    (hj : Continuous (fun kv : Circle × V => σ kv.1 kv.2)) (n : ℤ) (v : V) :
    circleWeightProjector dk σ hj n v=∫ k, (k : ℂ)^(-n) • σ k v ∂dk := sorry

example (σ : ContRepresentation ℂ Circle V)
    (hj : Continuous (fun kv : Circle × V => σ kv.1 kv.2)) (m n : ℤ) (v : V)
    (hv : ∀ k : Circle, σ k v=(k : ℂ)^m • v) :
    circleWeightProjector dk σ hj n v = if n=m then v else 0 := sorry
end CircleProjectors

section CompactBalance
variable {Ek : Type*} [NormedAddCommGroup Ek] [NormedSpace ℝ Ek] [FiniteDimensional ℝ Ek]
  {K : Type*} [Group K] [TopologicalSpace K] [ChartedSpace Ek K]
  [LieGroup 𝓘(ℝ,Ek) ∞ K] [CompactSpace K]

-- test: archHecke_compact. This is the actual U(k) balance at G=K.
example : BalancedHecke (LieHom.id : TauCeti.ComplexGroupLie 𝓘(ℝ,Ek) K →ₗ⁅ℂ⁆
    TauCeti.ComplexGroupLie 𝓘(ℝ,Ek) K) ≃ₗ[ℂ]
    representativeFunctions (Ek := Ek) (K := K) := sorry
end CompactBalance
end TauCeti.RealReductive

namespace TauCeti.VanEst
section VectorGroupTests

-- test: continuousCochains_R. The coefficient field and additive real group
-- agree with the real statement; the multiplicative type tag changes notation.
example : Nonempty ((continuousCochains
    (ContRepresentation.trivial ℝ (Multiplicative ℝ) ℝ)).homology 1 ≃ₗ[ℝ] ℝ) ∧
    ∀ n : ℕ, 2≤n → Subsingleton ((continuousCochains
      (ContRepresentation.trivial ℝ (Multiplicative ℝ) ℝ)).homology n) := sorry

-- test: continuousCochains_discrete_not
example : Nonempty ((continuousCochains
    (ContRepresentation.trivial ℝ (Multiplicative ℤ) ℝ)).homology 1 ≃ₗ[ℝ] ℝ) := sorry
end VectorGroupTests
end TauCeti.VanEst

namespace TauCeti.RelativeLieCohomology
section LongExact
variable {E : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]
  {H : Type*} [TopologicalSpace H] {I : ModelWithCorners ℝ E H}
  {K : Type*} [Group K] [TopologicalSpace K] [ChartedSpace H K]
  [LieGroup I ∞ K] [CompactSpace K] {q : Type*} [NormedComplexLieAlgebra q]
  {P : Pair I K q} {V₁ V₂ V₃ : Type*}
  [AddCommGroup V₁] [Module ℂ V₁] [AddCommGroup V₂] [Module ℂ V₂]
  [AddCommGroup V₃] [Module ℂ V₃]

/-- This is the long exact sequence part of the packet theorem. Pair
restriction, the shuffle product and the Ext comparison have separate inputs. -/
theorem longExact (A : GKModule P V₁) (B : GKModule P V₂) (C : GKModule P V₃)
    (f : GKModule.Hom A B) (g : GKModule.Hom B C)
    (hf : Function.Injective f.toLinearMap) (hg : Function.Surjective g.toLinearMap)
    (hex : Function.Exact f.toLinearMap g.toLinearMap) :
    ∃ δ : ∀ n : ℕ, cohomology C n →ₗ[ℂ] cohomology A (n+1),
      Function.Injective (cohomology_map A B f 0) ∧ ∀ n : ℕ,
        Function.Exact (cohomology_map A B f n) (cohomology_map B C g n) ∧
        Function.Exact (cohomology_map B C g n) (δ n) ∧
        Function.Exact (δ n) (cohomology_map A B f (n+1)) := sorry
end LongExact
end TauCeti.RelativeLieCohomology

namespace TauCeti.Automorphic
section ConstantTermTransport
open MeasureTheory
variable {G : Type*} [Group G] [TopologicalSpace G] [IsTopologicalGroup G]
  [T2Space G] (Γ N : Subgroup G)

/-- An actual conjugation map on the left arithmetic quotient. The equality
fixes the ambient conjugation; it is not a free permutation of the quotient. -/
def UnipotentQuotient.conjugate (a : Γ) (c : N ≃* N)
    (hc : ∀ n : N, (c n).val=a.val*n.val*a.val⁻¹) :
    UnipotentQuotient Γ N → UnipotentQuotient Γ N :=
  Quotient.map c (by sorry)

theorem UnipotentQuotient.conjugate_mk (a : Γ) (c : N ≃* N)
    (hc : ∀ n : N, (c n).val=a.val*n.val*a.val⁻¹) (n : N) :
    UnipotentQuotient.conjugate Γ N a c hc (UnipotentQuotient.mk Γ N n)=
      UnipotentQuotient.mk Γ N (c n) := sorry

/-- For a rational parabolic element, the adelic product formula supplies
the displayed measure-preservation input. -/
theorem constantTerm_leftInvariant [CompactSpace (UnipotentQuotient Γ N)]
    (dn : QuotientProbability Γ N) (a : Γ) (c : N ≃* N)
    (hc : ∀ n : N, (c n).val=a.val*n.val*a.val⁻¹)
    (hm : MeasurePreserving (UnipotentQuotient.conjugate Γ N a c hc) dn.measure dn.measure)
    (f : ContinuousInvariant Γ) (g : G) :
    constantTerm Γ N dn f (a.val*g)=constantTerm Γ N dn f g := sorry

theorem constantTerm_top (dn : QuotientProbability Γ (⊥ : Subgroup G))
    [CompactSpace (UnipotentQuotient Γ (⊥ : Subgroup G))] (f : ContinuousInvariant Γ) :
    constantTerm Γ (⊥ : Subgroup G) dn f=f.val := sorry

variable (N₁ N₂ N₁₂ : Subgroup G)
  [CompactSpace (UnipotentQuotient Γ N₁)] [CompactSpace (UnipotentQuotient Γ N₂)]
  [CompactSpace (UnipotentQuotient Γ N₁₂)]
  (dn₁ : QuotientProbability Γ N₁) (dn₂ : QuotientProbability Γ N₂)
  (dn₁₂ : QuotientProbability Γ N₁₂)

/-- This states the fibre/Fubini input after the parabolic supplier has
constructed the multiplication map on the arithmetic quotients. -/
theorem constantTerm_fibreFormula
    (h₁ : N₁≤N₁₂) (h₂ : N₂≤N₁₂)
    (m : UnipotentQuotient Γ N₁ × UnipotentQuotient Γ N₂ → UnipotentQuotient Γ N₁₂)
    (hm : Continuous m)
    (hmk : ∀ n₁ : N₁, ∀ n₂ : N₂,
      m (UnipotentQuotient.mk Γ N₁ n₁,UnipotentQuotient.mk Γ N₂ n₂)=
        UnipotentQuotient.mk Γ N₁₂
          ((Subgroup.inclusion h₁ n₁)*(Subgroup.inclusion h₂ n₂)))
    (hmeasure : Measure.map m (dn₁.measure.prod dn₂.measure)=dn₁₂.measure)
    (f : ContinuousInvariant Γ) (g : G) :
    constantTerm Γ N₁₂ dn₁₂ f g=
      ∫ q₁, ∫ q₂, quotientIntegrand Γ N₁₂ f g (m (q₁,q₂)) ∂dn₂.measure ∂dn₁.measure := sorry
end ConstantTermTransport
end TauCeti.Automorphic

namespace TauCeti.RelativeLieCohomology
section DifferentiateFiniteRepresentation
variable {E Ek : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]
  [NormedAddCommGroup Ek] [NormedSpace ℝ Ek] [FiniteDimensional ℝ Ek]
  {G K : Type*} [Group G] [Group K] [TopologicalSpace G] [TopologicalSpace K]
  [ChartedSpace E G] [ChartedSpace Ek K] [LieGroup 𝓘(ℝ,E) ∞ G]
  [LieGroup 𝓘(ℝ,Ek) ∞ K] [CompactSpace K]
  {q : Type*} [NormedComplexLieAlgebra q]
  {V : Type*} [NormedAddCommGroup V] [NormedSpace ℂ V] [FiniteDimensional ℂ V]
  (ι : K →* G) (hs : ContMDiff 𝓘(ℝ,Ek) 𝓘(ℝ,E) ∞ ι)
  (φ : q ≃ₗ⁅ℂ⁆ TauCeti.ComplexGroupLie 𝓘(ℝ,E) G)
  (dι : TauCeti.ComplexGroupLie 𝓘(ℝ,Ek) K →ₗ⁅ℂ⁆ TauCeti.ComplexGroupLie 𝓘(ℝ,E) G)
  (hd : ∀ X : GroupLieAlgebra 𝓘(ℝ,Ek) K,
    dι (1 ⊗ₜ[ℝ] X)=1 ⊗ₜ[ℝ] (mfderiv 𝓘(ℝ,Ek) 𝓘(ℝ,E) ι 1 X))
  (hi : Function.Injective dι)

/-- Finite-dimensional continuous group actions are smooth. Joint continuity
is supplied explicitly because ContRepresentation alone does not assert it. -/
def GKModule.ofContRepresentation (ρ : ContRepresentation ℂ G V)
    (hj : Continuous (fun gv : G × V => ρ gv.1 gv.2)) :
    GKModule (Pair.ofLieGroup ι hs φ dι hd hi) V := sorry

theorem GKModule.ofContRepresentation_group (ρ : ContRepresentation ℂ G V)
    (hj : Continuous (fun gv : G × V => ρ gv.1 gv.2)) (k : K) (v : V) :
    (GKModule.ofContRepresentation ι hs φ dι hd hi ρ hj).sigma k v=ρ (ι k) v := sorry

-- test: gkModule_fd_compat. This is the native differential formula which
-- the pinned Tau Ceti lieMap of the representation must satisfy.
example (ρ : ContRepresentation ℂ G V)
    (hj : Continuous (fun gv : G × V => ρ gv.1 gv.2))
    (X : GroupLieAlgebra 𝓘(ℝ,E) G) (v : V) :
    (GKModule.ofContRepresentation ι hs φ dι hd hi ρ hj).rho
      (φ.symm (1 ⊗ₜ[ℝ] X)) v=
      mfderiv 𝓘(ℝ,E) 𝓘(ℝ,V) (fun g => ρ g v) 1 X := sorry
end DifferentiateFiniteRepresentation
end TauCeti.RelativeLieCohomology

namespace TauCeti.RealReductive.GL2
abbrev WeightAmbient := ℤ →₀ ℂ

/-- Compact-Cartan matrices for clockwise rotations. These replace the split
H/X/Y of Getz's §6.4 in the weight formulas of §6.5 (source issue E17). -/
def compactH : Matrix (Fin 2) (Fin 2) ℂ := !![0, -Complex.I; Complex.I, 0]
def compactX : Matrix (Fin 2) (Fin 2) ℂ :=
  !![1/2, Complex.I/2; Complex.I/2, -1/2]
def compactY : Matrix (Fin 2) (Fin 2) ℂ :=
  !![1/2, -Complex.I/2; -Complex.I/2, -1/2]

theorem compactCartan_bracket :
    ⁅compactH, compactX⁆ = (2 : ℂ) • compactX ∧
    ⁅compactH, compactY⁆ = (-2 : ℂ) • compactY ∧
    ⁅compactX, compactY⁆ = compactH := sorry

-- test: weightModel_compact_generator. J is the clockwise circle generator.
example : Complex.I • compactH =
    (!![0, 1; -1, 0] : Matrix (Fin 2) (Fin 2) ℂ) := sorry
-- test: weightModel_not_split_cartan. A split diagonal matrix is not H here.
example : compactH ≠ (!![1, 0; 0, -1] : Matrix (Fin 2) (Fin 2) ℂ) := sorry

/-- Both SO(2) weight rays, with the stated parity. An O(2) reflection action
and the integrated discrete-series identification are separate targets. -/
def WeightModel (k : ℕ) : Submodule ℂ WeightAmbient where
  carrier := {f | ∀ ell : ℤ, f ell≠0 → (k : ℤ)≤|ell| ∧ (ell-(k : ℤ))%2=0}
  zero_mem' := sorry
  add_mem' := sorry
  smul_mem' := sorry

def weightH : Module.End ℂ WeightAmbient :=
  Finsupp.linearCombination ℂ (fun ell => (ell : ℂ) • Finsupp.single ell 1)
def weightX (k : ℕ) : Module.End ℂ WeightAmbient :=
  Finsupp.linearCombination ℂ (fun ell => ((k+ell : ℂ)/2) • Finsupp.single (ell+2) 1)
def weightY (k : ℕ) : Module.End ℂ WeightAmbient :=
  Finsupp.linearCombination ℂ (fun ell => ((k-ell : ℂ)/2) • Finsupp.single (ell-2) 1)

def weightCasimir (k : ℕ) : Module.End ℂ WeightAmbient :=
  (1/4 : ℂ) • (weightH*weightH+2•(weightX k*weightY k)+2•(weightY k*weightX k))

theorem weightModel_stable (k : ℕ) (f : WeightModel k) :
    weightH f.val∈WeightModel k ∧ weightX k f.val∈WeightModel k ∧
      weightY k f.val∈WeightModel k := sorry
theorem weightModel_bracket (k : ℕ) :
    ⁅weightH,weightX k⁆=2•weightX k ∧ ⁅weightH,weightY k⁆=(-2 : ℂ)•weightY k ∧
      ⁅weightX k,weightY k⁆=weightH := sorry
theorem weightModel_casimir (k : ℕ) :
    weightCasimir k=((k : ℂ)*(k-2)/4) • (1 : Module.End ℂ WeightAmbient) := sorry

def weightCircle : Representation ℂ Circle WeightAmbient := sorry
theorem weightCircle_apply (z : Circle) (f : WeightAmbient) (ell : ℤ) :
    weightCircle z f ell=(z : ℂ)^ell*f ell := sorry

-- test: weightModel_casimir_k2. This tests the exact algebraic weight model;
-- its identification with the classified discrete series is a native gap.
example : weightCasimir 2=0 := sorry
-- test: weightModel_casimir_k12
example : weightCasimir 12=30 • (1 : Module.End ℂ WeightAmbient) := sorry
-- test: weightModel_lowest
example (k : ℕ) : weightY k (Finsupp.single (k : ℤ) 1)=0 ∧
    weightX k (Finsupp.single (-(k : ℤ)) 1)=0 := sorry
-- test: weightModel_not_k2_minus_1
example : weightCasimir 2≠(3/4 : ℂ) • (1 : Module.End ℂ WeightAmbient) := sorry
-- test: weightModel_circle_derivative. The circle angle has the prescribed sign.
example (f : WeightAmbient) (ell : ℤ) :
    deriv (fun t : ℝ => weightCircle (Circle.exp t) f ell) 0=
      Complex.I * weightH f ell := sorry
end TauCeti.RealReductive.GL2

namespace TauCeti.RealReductive
section CircleL2
variable (dk : MeasureTheory.Measure Circle)

def circleL2Regular [dk.IsMulLeftInvariant] :
    Representation ℂ Circle (MeasureTheory.Lp ℂ 2 dk) := sorry

def circleInfiniteFourier [MeasureTheory.IsProbabilityMeasure dk] :
    MeasureTheory.Lp ℂ 2 dk := sorry

/-- The continuous periodic absolute-angle function on the unit circle. -/
def circleAbsoluteAngle [MeasureTheory.IsProbabilityMeasure dk] :
    MeasureTheory.Lp ℂ 2 dk := sorry

variable [MeasureTheory.IsProbabilityMeasure dk]
  [dk.IsMulLeftInvariant] [dk.IsMulRightInvariant]

theorem circleL2Regular_apply (k : Circle) (f : MeasureTheory.Lp ℂ 2 dk) :
    ∀ᵐ z ∂dk, circleL2Regular dk k f z=f (k⁻¹*z) := sorry

theorem circleInfiniteFourier_apply : ∀ᵐ z ∂dk,
    circleInfiniteFourier dk z=∑' n : ℕ, ((2 : ℂ)^n)⁻¹*(z : ℂ)^n := sorry

theorem circleAbsoluteAngle_apply : ∀ᵐ z ∂dk,
    circleAbsoluteAngle dk z=((|Complex.arg (z : ℂ)| : ℝ) : ℂ) := sorry

-- test: kFinite_SO2_L2. Circle is the standard angular model of SO(2).
example (n : ℤ) :
    Module.finrank ℂ (isotypic 1 (circleWeight n).toRepresentation (circleL2Regular dk))=1 := sorry

-- test: kFinite_not_all. Absolute angle is a concrete non-polynomial vector.
example : circleAbsoluteAngle dk∉kFinite (circleL2Regular dk) := sorry

-- test: gkModule_not_locally_finite. Infinitely many nonzero Fourier
-- coefficients give an actual vector outside the finite compact orbit spans.
example : circleInfiniteFourier dk∉kFinite (circleL2Regular dk) := sorry
end CircleL2
end TauCeti.RealReductive

namespace TauCeti.Automorphic.LocalStableLattice
variable (p : ℕ) [Fact p.Prime]

def standard (n : ℕ) : Submodule ℤ_[p] (Fin n → ℚ_[p]) := sorry
theorem standard_mem (n : ℕ) (v : Fin n → ℚ_[p]) :
    v∈standard p n ↔ ∀ i, ∃ a : ℤ_[p], (a : ℚ_[p])=v i := sorry

-- test: localLattice_standard
example (n : ℕ) (J : Subgroup (GL (Fin n) ℚ_[p]))
    (hJ : ∀ g∈J, ∀ i j, ∃ a : ℤ_[p], (a : ℚ_[p])=(g : Matrix (Fin n) (Fin n) ℚ_[p]) i j) :
    standard p n∈LocalStableLattice p n J := sorry

-- test: localLattice_rank_zero
example (J : Subgroup (GL (Fin 0) ℚ_[p])) : LocalStableLattice p 0 J={⊥} := sorry

-- test: localLattice_not_unique
example (n : ℕ) (hn : 0<n) (J : Subgroup (GL (Fin n) ℚ_[p]))
    (L : Submodule ℤ_[p] (Fin n → ℚ_[p])) (hL : L∈LocalStableLattice p n J) :
    L.map ((p : ℤ_[p]) • LinearMap.id)∈LocalStableLattice p n J ∧
      L.map ((p : ℤ_[p]) • LinearMap.id)≠L := sorry
end TauCeti.Automorphic.LocalStableLattice

namespace TauCeti.Automorphic
section EigenclassTransport
variable {T H H' Λ Λ' : Type*} [CommRing T] [AddCommGroup H] [Module T H]
  [AddCommGroup H'] [Module T H'] [CommRing Λ] [Module Λ H]
  [CommRing Λ'] [Module Λ' H']

def TorsionEigenSystem.map (e : TorsionEigenSystem T H Λ) (κ : Λ →+* Λ')
    (f : H →ₛₗ[κ] H') (hf : ∀ (t : T) (x : H), f (t • x)=t • f x) (hne : f e.c≠0) :
    TorsionEigenSystem T H' Λ' where
  sys := κ.comp e.sys
  c := f e.c
  ne_zero := hne
  eigen := sorry

theorem TorsionEigenSystem.map_sys (e : TorsionEigenSystem T H Λ) (κ : Λ →+* Λ')
    (f : H →ₛₗ[κ] H') (hf : ∀ (t : T) (x : H), f (t • x)=t • f x) (hne : f e.c≠0) :
    (e.map κ f hf hne).sys=κ.comp e.sys := rfl

-- test: eigenclass_zero_not
example [Subsingleton H] : IsEmpty (TorsionEigenSystem T H Λ) := sorry

-- test: eigenclass_reduce_nonzero. Reduction requires an integral eigenclass
-- whose image stays nonzero, in addition to integral eigenvalues.
example (e : TorsionEigenSystem T H Λ) (κ : Λ →+* Λ')
    (f : H →ₛₗ[κ] H') (hf : ∀ (t : T) (x : H), f (t • x)=t • f x) (hne : f e.c≠0) (t : T) :
    t • (e.map κ f hf hne).c=(κ (e.sys t)) • (e.map κ f hf hne).c := sorry

end EigenclassTransport

-- test: eigenclass_finite_image_maximal. The image need not be the whole field.
example {T H Λ : Type*} [CommRing T] [AddCommGroup H] [Module T H]
    [Field Λ] [Finite Λ] [Module Λ H] (e : TorsionEigenSystem T H Λ) :
    (RingHom.ker e.sys).IsMaximal := sorry
end TauCeti.Automorphic

namespace TauCeti.Automorphic
section GrowthOperations
open MeasureTheory
variable {Ginf Gf : Type*} [Group Ginf] [TopologicalSpace Ginf]
  [IsTopologicalGroup Ginf] [LocallyCompactSpace Ginf] [T2Space Ginf]
  [SecondCountableTopology Ginf] [Group Gf] [TopologicalSpace Gf]
  [hFTop : IsTopologicalGroup Gf] [hFLocal : LocallyCompactSpace Gf] [TotallyDisconnectedSpace Gf]
  [hFT2 : T2Space Gf] [SecondCountableTopology Gf]
  {E : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]
  {H : Type*} [TopologicalSpace H] (I : ModelWithCorners ℝ E H)
  [ChartedSpace H Ginf] [LieGroup I ∞ Ginf]
  (height : Ginf × Gf → ℝ) (h1 : ∀ g, 1≤height g)
  (hmul : ∀ g h, height (g*h)≤height g*height h)
  (Γ : Subgroup (Ginf × Gf)) (N : ℝ) (hN : 0≤N)
local notation "Sm" => SmoothAdelicFunction (Ginf := Ginf) (Gf := Gf) I
local notation "q" => TauCeti.ComplexGroupLie I Ginf
local notation "U" => UniversalEnvelopingAlgebra ℂ q

/-- This is induced by the actual adjoint derivative of conjugation. -/
def envelopingAd (y : Ginf) : U →ₐ[ℂ] U := sorry
theorem envelopingAd_iota (y : Ginf) (X : q) :
    envelopingAd I y (UniversalEnvelopingAlgebra.ι ℂ X)=
      UniversalEnvelopingAlgebra.ι ℂ (TauCeti.ComplexGroupLie.ad I Ginf y X) := sorry

def smoothRightTranslate (y : Ginf × Gf) : Sm →ₗ[ℂ] Sm where
  toFun f := ⟨rightTranslate y f.val, SmoothAdelicFunction.rightTranslate I f.property y⟩
  map_add' := sorry
  map_smul' := sorry

theorem rightDerivative_rightTranslate (u : U) (y : Ginf × Gf) (f : Sm) :
    rightDerivative I u (smoothRightTranslate I y f)=
      smoothRightTranslate I y (rightDerivative I (envelopingAd I y.1⁻¹ u) f) := sorry

theorem UniformModerateGrowth.rightTranslate_mem
    (h1 : ∀ g, 1≤height g) (hmul : ∀ g h, height (g*h)≤height g*height h)
    (hN : 0≤N) (y : Ginf × Gf) (f : UniformModerateGrowth I height Γ N) :
    smoothRightTranslate I y f.val∈UniformModerateGrowth I height Γ N := sorry

def UniformModerateGrowth.rightTranslate (y : Ginf × Gf) :
    UniformModerateGrowth I height Γ N →ₗ[ℂ] UniformModerateGrowth I height Γ N where
  toFun f := ⟨smoothRightTranslate I y f.val,
    UniformModerateGrowth.rightTranslate_mem (I := I) (height := height) (Γ := Γ) (N := N) h1 hmul hN y f⟩
  map_add' := sorry
  map_smul' := sorry

theorem UniformModerateGrowth.rightTranslate_seminorm (y : Ginf × Gf) (u : U)
    (f : UniformModerateGrowth I height Γ N) :
    UniformModerateGrowth.seminorm I height Γ N u
      (UniformModerateGrowth.rightTranslate (I := I) (height := height) (Γ := Γ) (N := N) h1 hmul hN y f)≤
      height y^N*UniformModerateGrowth.seminorm I height Γ N (envelopingAd I y.1⁻¹ u) f := sorry

def UniformModerateGrowth.derivative (u : U) :
    UniformModerateGrowth I height Γ N →ₗ[ℂ] UniformModerateGrowth I height Γ N := sorry

theorem UniformModerateGrowth.derivative_val (u : U)
    (f : UniformModerateGrowth I height Γ N) :
    (UniformModerateGrowth.derivative I height Γ N u f).val=rightDerivative I u f.val := sorry

theorem UniformModerateGrowth.derivative_seminorm (u v : U)
    (f : UniformModerateGrowth I height Γ N) :
    UniformModerateGrowth.seminorm I height Γ N v
      (UniformModerateGrowth.derivative I height Γ N u f)=
      UniformModerateGrowth.seminorm I height Γ N (v*u) f := sorry

variable [MeasurableSpace Ginf] [BorelSpace Ginf] [MeasurableSpace Gf] [hFBorel : BorelSpace Gf]
  (μ : Measure (Ginf × Gf)) [μ.IsHaarMeasure] [μ.IsMulRightInvariant]
  (hinv : ∀ g, height g⁻¹=height g) (hheight : Continuous height)
  (hint : ∃ r : ℕ, Integrable (fun g => height g^(-(r : ℝ))) μ)

/-- Schwartz convolution supplies the actual smooth function, rather than
postulating an arbitrary output with the desired growth property. -/
theorem UniformModerateGrowth.convolution_mem
    (h1 : ∀ g, 1≤height g) (hmul : ∀ g h, height (g*h)≤height g*height h)
    (hN : 0≤N)
    (hinv : ∀ g, height g⁻¹=height g) (hheight : Continuous height)
    (hint : ∃ r : ℕ, Integrable (fun g => height g^(-(r : ℝ))) μ)
    (φ : C(Ginf × Gf,ℂ))
    (hΓ : ∀ (γ : Γ) g, φ ((γ : Ginf × Gf)*g)=φ g)
    (C : ℝ) (hC : 0≤C) (hφ : ∀ g, ‖φ g‖≤C*height g^N)
    (f : SchwartzFunction I height) :
    ∃ F : UniformModerateGrowth I height Γ N, ∀ g,
      F.val.val g=∫ y, f.val.val y*φ (g*y) ∂μ := sorry

variable (μf : Measure Gf) [μf.IsHaarMeasure] [μf.IsMulRightInvariant]
  (J : Subgroup Gf) (ho : IsOpen (J : Set Gf)) (hc : IsCompact (J : Set Gf))

include hFTop hFLocal hFT2 hFBorel

/-- The finite Hecke kernel is the native finite test function with its left
J-invariance stated explicitly; its integral acts on the actual level space. -/
def heckeAction (hLie : LieGroup I ∞ Ginf) (hDim : FiniteDimensional ℝ E)
    (hFTop : IsTopologicalGroup Gf) (hFLocal : LocallyCompactSpace Gf)
    (hFT2 : T2Space Gf) (hFBorel : BorelSpace Gf) (h1 : ∀ g, 1≤height g)
    (hmul : ∀ g h, height (g*h)≤height g*height h) (hN : 0≤N)
    (hheight : Continuous height) (μf : Measure Gf)
    [μf.IsHaarMeasure] [μf.IsMulRightInvariant]
    (ho : IsOpen (J : Set Gf)) (hc : IsCompact (J : Set Gf)) (f : FiniteTestFunction (Gf := Gf))
    (hbi : ∀ (j k : J) y, f ((j : Gf)*y*(k : Gf))=f y) :
    Module.End ℂ (UniformModerateGrowth.level I height Γ N J) := sorry

theorem heckeAction_apply (f : FiniteTestFunction (Gf := Gf))
    (hbi : ∀ (j k : J) y, f ((j : Gf)*y*(k : Gf))=f y)
    (φ : UniformModerateGrowth.level I height Γ N J) (g : Ginf × Gf) :
    (heckeAction (I := I) (height := height) (Γ := Γ) (N := N) (J := J) inferInstance inferInstance inferInstance inferInstance inferInstance inferInstance
      h1 hmul hN hheight μf ho hc f hbi φ).val.val.val g=
      ∫ y, f y*φ.val.val.val (g.1,g.2*y) ∂μf := sorry
end GrowthOperations
end TauCeti.Automorphic

namespace TauCeti.RelativeLieCohomology
section LowDegreeBridge
variable {E : Type} [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]
  {H : Type} [TopologicalSpace H] {I : ModelWithCorners ℝ E H}
  {K : Type} [Group K] [TopologicalSpace K] [ChartedSpace H K]
  [LieGroup I ∞ K] [CompactSpace K] {q : Type} [NormedComplexLieAlgebra q]
  {P : Pair I K q} {V : Type} [AddCommGroup V] [Module ℂ V]

@[instance_reducible] def GKModule.toLieRingModule (A : GKModule P V) : LieRingModule q V where
  bracket X v := A.rho X v
  add_lie := sorry
  lie_add := sorry
  leibniz_lie := sorry

theorem GKModule.toLieModule (A : GKModule P V) :
    letI := GKModule.toLieRingModule A
    LieModule ℂ q V := sorry

theorem d_lowDegree_compat (A : GKModule P V) (w : cochains A 1) :
    letI := GKModule.toLieRingModule A
    letI := GKModule.toLieModule A
    AbsoluteLie.twoEquivMathlib ℂ q V ((differential A 1 w).val) =
      LieModule.Cohomology.d₁₂ ℂ q V (AbsoluteLie.oneEquivMathlib ℂ q V w.val) := sorry
end LowDegreeBridge
end TauCeti.RelativeLieCohomology
