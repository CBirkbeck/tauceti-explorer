import TauCeti.Analysis.InnerProductSpace.LinearPMap.SelfAdjoint
import TauCeti.Analysis.Normed.Operator.Resolvent.Unbounded
import TauCeti.Analysis.Normed.Operator.Resolvent.Analytic
import TauCeti.NumberTheory.Multiquadratic.FundamentalDiscriminant.Basic
import Mathlib.NumberTheory.LSeries.RiemannZeta
import Mathlib.NumberTheory.ArithmeticFunction.Moebius
import Mathlib.MeasureTheory.Function.L2Space
import Mathlib.MeasureTheory.Function.LpSeminorm.Count
import Mathlib.MeasureTheory.Integral.Prod
import Mathlib.MeasureTheory.Integral.DominatedConvergence
import Mathlib.Analysis.Calculus.ParametricIntegral
import Mathlib.Analysis.Calculus.Deriv.Slope
import Mathlib.Analysis.InnerProductSpace.l2Space
import Mathlib.Analysis.InnerProductSpace.Spectrum
import Mathlib.Analysis.Distribution.SchwartzSpace.Fourier
import Mathlib.Analysis.Distribution.TestFunction
import Mathlib.Analysis.LocallyConvex.Barrelled
import Mathlib.Analysis.Meromorphic.Basic
import Mathlib.Analysis.SpecialFunctions.RegularizedHypergeometric
import Mathlib.Analysis.SpecialFunctions.Gamma.Beta
import Mathlib.Analysis.Complex.UpperHalfPlane.Metric
import Mathlib.Analysis.Complex.UpperHalfPlane.Measure
import Mathlib.NumberTheory.ModularForms.CongruenceSubgroups
import Mathlib.NumberTheory.DirichletCharacter.Basic
import Mathlib.RepresentationTheory.Basic
import Mathlib.Analysis.Fourier.AddCircleMulti
import Mathlib.Analysis.Fourier.FiniteAbelian.PontryaginDuality
import Mathlib.LinearAlgebra.TensorProduct.Basic
import Mathlib.LinearAlgebra.Matrix.Charpoly.Basic
import Mathlib.RingTheory.RootsOfUnity.PrimitiveRoots
import Mathlib.Topology.Algebra.Module.Basic
import Mathlib.Algebra.Polynomial.Module.AEval
import Mathlib.Algebra.Homology.HomologicalComplex
import Mathlib.Algebra.Category.ModuleCat.Basic

/-!
# Automorphic spectral theory and trace distributions: suggested signatures

**This file is not the roadmap and is not exhaustive.** The definitive document is
`README.md`. The statements here suggest Lean forms for particular milestones, so that
contributors and reviewers converge on names and signatures; discharging all of them
finishes neither a layer nor the roadmap.

Names follow the README targets in the namespace `TauCeti.AutomorphicSpectral`; the section
headings name the README layer. Inner products are conjugate-linear in the first variable.
Projection-valued measures and the spectral theorem are those of SelfAdjointSpectralTheory,
Schatten classes those of OperatorIdeals; the corresponding structures below record the form
used in this roadmap. Objects owned by other roadmaps (adelic quotients and their measures,
normalized induction, automorphic forms and their constant terms, local factors) enter as
explicit data with the properties the statements use. Statements whose carriers no pinned
library provides are listed in the closing comment, with the carriers they need.
-/

noncomputable section
set_option autoImplicit false
open MeasureTheory Filter Set
open scoped ENNReal NNReal InnerProductSpace Topology TensorProduct
namespace TauCeti.AutomorphicSpectral
universe u v w

structure HilbertModel where
  Carrier : Type u
  normed : NormedAddCommGroup Carrier
  innerSpace : InnerProductSpace ℂ Carrier
  complete : CompleteSpace Carrier
attribute [instance] HilbertModel.normed HilbertModel.innerSpace HilbertModel.complete

/-- The real height space for a finite set of coordinate indices. The root datum is imported. -/
abbrev Height (ι : Type*) := ι → ℝ
abbrev Parameter (ι : Type*) := ι → ℂ
abbrev Operator (H : Type*) [NormedAddCommGroup H] [NormedSpace ℂ H] := H →L[ℂ] H

/-- An actual normed-target finite-order condition, used only in normed specializations. -/
def StripOrder {V : Type*} [NormedAddCommGroup V] (f : ℂ → V) (d C : ℝ) : Prop :=
  ∀ d' : ℝ, d < d' → ∀ a b : ℝ, C < a → a ≤ b →
    ∃ M : ℝ, ∀ s : ℂ, a ≤ s.re → s.re ≤ b →
      Real.exp (-(‖s‖ ^ d')) * ‖f s‖ ≤ M

def FiniteStripOrder {V : Type*} [NormedAddCommGroup V] (f : ℂ → V) (C : ℝ) : Prop :=
  ∃ d : ℝ, 0 < d ∧ StripOrder f d C

/-- One common local denominator; general bounded-set topology is left to AS.0. -/
def CommonDenominator {V : Type*} [NormedAddCommGroup V] [NormedSpace ℂ V]
    (U : Set ℂ) (f : ℂ → V) : Prop :=
  ∀ z ∈ U, ∃ n : ℕ, ∃ r : ℝ, 0 < r ∧
    ∃ g : ℂ → V, AnalyticOnNhd ℂ g (Metric.ball z r) ∧
      ∀ s ∈ Metric.ball z r, s ≠ z → g s = (s - z) ^ n • f s

/-- Imported GL_n automorphic carrier, exposing a genuine representation of the rank-n
adelic group, unramified Satake parameters and its standard L-function. -/
structure GLAutomorphicDatum (Groups : ℕ → Type u) [∀ n, Group (Groups n)]
    (Places : Type v) where
  rank : ℕ
  space : HilbertModel.{u}
  representation : Representation ℂ (Groups rank) space.Carrier
  satake : Places → Multiset ℂ
  standardL : ℂ → ℂ

/-- Actual equivalence of group actions after transporting the group along rank equality. -/
def GLAutomorphicEquivalent {Groups : ℕ → Type u} [∀ n, Group (Groups n)]
    {Places : Type v} (pi rho : GLAutomorphicDatum Groups Places) : Prop :=
  ∃ hr : pi.rank = rho.rank, ∃ e : pi.space.Carrier ≃ₗ[ℂ] rho.space.Carrier,
    ∀ g : Groups pi.rank, ∀ v : pi.space.Carrier,
      e (pi.representation g v) = rho.representation (Eq.mp (congrArg Groups hr) g) (e v)

end TauCeti.AutomorphicSpectral

/-! ## AS.0 — Hilbert fields, vector analysis and rank-one kernels -/

namespace TauCeti.AutomorphicSpectral
universe u v w

/- AS.0. A standard-Borel instance and σ-finiteness enter the completeness and separability
results. The measurable-section axioms themselves make sense on any measurable base. -/
structure measurable_hilbert_field (X : Type u) [MeasurableSpace X]
    (H : X → HilbertModel.{v}) where
  sections : Submodule ℂ (∀ x, (H x).Carrier)
  measurable_norm : ∀ s ∈ sections, Measurable (fun x => ‖s x‖)
  saturated : ∀ s, s ∈ sections ↔
    ∀ t ∈ sections, Measurable (fun x => inner ℂ (t x) (s x))
  fundamental : ℕ → ∀ x, (H x).Carrier
  fundamental_mem : ∀ n, fundamental n ∈ sections
  fundamental_dense : ∀ x,
    Dense (Submodule.span ℂ (Set.range (fun n => fundamental n x)) : Set (H x).Carrier)

namespace measurable_hilbert_field
variable {X : Type u} [MeasurableSpace X] {H : X → HilbertModel.{v}}
theorem ofFundamental (e : ℕ → ∀ x, (H x).Carrier)
    (hGram : ∀ m n, Measurable (fun x => inner ℂ (e m x) (e n x)))
    (hDense : ∀ x, Dense (Submodule.span ℂ (Set.range (fun n => e n x)) : Set (H x).Carrier)) :
    ∃ M : measurable_hilbert_field X H, M.fundamental = e := by sorry

theorem mem_iff_pairing (M : measurable_hilbert_field X H) (s : ∀ x, (H x).Carrier) :
    s ∈ M.sections ↔ ∀ n, Measurable (fun x => inner ℂ (M.fundamental n x) (s x)) := by sorry

def map_isometry {K : X → HilbertModel.{v}} (M : measurable_hilbert_field X H)
    (U : ∀ x, (H x).Carrier ≃ₗᵢ[ℂ] (K x).Carrier) : measurable_hilbert_field X K := by sorry

theorem constant_scalar (M : measurable_hilbert_field X
    (fun _ => (⟨ℂ, inferInstance, inferInstance, inferInstance⟩ : HilbertModel)))
    (hone : (fun _ => (1 : ℂ)) ∈ M.sections)
    (s : X → ℂ) : s ∈ M.sections ↔ Measurable s := by sorry

-- Test: measurable_hilbert_field.constant_scalar
-- For the standard constant ℂ field, with the constant-one section in M, M is exactly the measurable complex functions.
-- For the standard constant ℂ field (the constant-one section is measurable),
-- M is exactly the measurable complex functions.
example (M : measurable_hilbert_field X
    (fun _ => (⟨ℂ, inferInstance, inferInstance, inferInstance⟩ : HilbertModel)))
    (hone : (fun _ => (1 : ℂ)) ∈ M.sections)
    (s : X → ℂ) : s ∈ M.sections ↔ Measurable s := by sorry


theorem zero_fibre [∀ x, Subsingleton (H x).Carrier]
    (M : measurable_hilbert_field X H) (s : ∀ x, (H x).Carrier) : s ∈ M.sections := by sorry

-- Test: measurable_hilbert_field.zero_fibre
-- If every fibre is zero, M contains the unique section.
example [∀ x, Subsingleton (H x).Carrier]
    (M : measurable_hilbert_field X H) (s : ∀ x, (H x).Carrier) : s ∈ M.sections := by sorry


theorem fundamental_change (M N : measurable_hilbert_field X H)
    (hMN : ∀ n, M.fundamental n ∈ N.sections)
    (hNM : ∀ n, N.fundamental n ∈ M.sections) : M.sections = N.sections := by sorry

-- Test: measurable_hilbert_field.fundamental_change
-- Adding measurable limits of finite rational combinations to a fundamental sequence leaves M unchanged.
example (M N : measurable_hilbert_field X H)
    (hMN : ∀ n, M.fundamental n ∈ N.sections)
    (hNM : ∀ n, N.fundamental n ∈ M.sections) : M.sections = N.sections := by sorry

end measurable_hilbert_field

/-- The representative domain retains measurability and finite squared norm. -/
def SquareSections {X : Type u} [MeasurableSpace X] {H : X → HilbertModel.{v}}
    (M : measurable_hilbert_field X H) (μ : Measure X) :=
  {s : ∀ x, (H x).Carrier // s ∈ M.sections ∧ Integrable (fun x => ‖s x‖ ^ 2) μ}

/-- Complete Hilbert quotient of square-integrable sections by almost-everywhere equality. -/
def direct_integral {X : Type u} [MeasurableSpace X] {H : X → HilbertModel.{v}}
    (M : measurable_hilbert_field X H) (μ : Measure X) : HilbertModel.{max u v} := by sorry

namespace direct_integral
variable {X : Type u} [MeasurableSpace X] {H : X → HilbertModel.{v}}
variable (M : measurable_hilbert_field X H) (μ : Measure X)
def mk (s : SquareSections M μ) : (direct_integral M μ).Carrier := by sorry

theorem mk_eq_mk (s t : SquareSections M μ) :
    mk M μ s = mk M μ t ↔ ∀ᵐ x ∂μ, s.val x = t.val x := by sorry

theorem inner_mk (s t : SquareSections M μ) :
    inner ℂ (mk M μ s) (mk M μ t) = ∫ x, inner ℂ (s.val x) (t.val x) ∂μ := by sorry

/-- Reindexing with the fibre measurability hypotheses given explicitly. -/
def reindex {Y : Type u} [MeasurableSpace Y] {K : Y → HilbertModel.{v}}
    (N : measurable_hilbert_field Y K) (ν : Measure Y) (e : X ≃ᵐ Y)
    (he : MeasurePreserving e μ ν) (U : ∀ x, (H x).Carrier ≃ₗᵢ[ℂ] (K (e x)).Carrier)
    (hU : ∀ s ∈ M.sections, (fun y => cast (congrArg (fun z => (K z).Carrier) (e.apply_symm_apply y))
      (U (e.symm y) (s (e.symm y)))) ∈ N.sections)
    (hUinv : ∀ t ∈ N.sections, (fun x => (U x).symm (t (e x))) ∈ M.sections) :
    (direct_integral M μ).Carrier ≃ₗᵢ[ℂ] (direct_integral N ν).Carrier := by sorry

theorem scalar_L2 (M : measurable_hilbert_field X
    (fun _ => (⟨ℂ, inferInstance, inferInstance, inferInstance⟩ : HilbertModel)))
    (hone : (fun _ => (1 : ℂ)) ∈ M.sections) :
    Nonempty ((direct_integral M μ).Carrier ≃ₗᵢ[ℂ] Lp ℂ 2 μ) := by sorry

-- Test: direct_integral.scalar_L2
-- The standard constant ℂ field, with the constant-one section in M, identifies unitarily with L²(μ;ℂ).
-- The standard constant ℂ field identifies unitarily with L²(μ;ℂ).
example (M : measurable_hilbert_field X
    (fun _ => (⟨ℂ, inferInstance, inferInstance, inferInstance⟩ : HilbertModel)))
    (hone : (fun _ => (1 : ℂ)) ∈ M.sections) :
    Nonempty ((direct_integral M μ).Carrier ≃ₗᵢ[ℂ] Lp ℂ 2 μ) := by sorry


theorem two_atoms (a b : ℝ) (ha : 0 < a) (hb : 0 < b)
    (K : HilbertModel.{v}) (M : measurable_hilbert_field (Fin 2) (fun _ => K))
    (s : SquareSections M (ENNReal.ofReal a • Measure.dirac 0 + ENNReal.ofReal b • Measure.dirac 1)) :
    ‖mk M _ s‖ ^ 2 = a * ‖s.val 0‖ ^ 2 + b * ‖s.val 1‖ ^ 2 := by sorry

-- Test: direct_integral.two_atoms
-- For μ=aδ₀+bδ₁ with a,b>0, ‖(v₀,v₁)‖²=a‖v₀‖²+b‖v₁‖².
example (a b : ℝ) (ha : 0 < a) (hb : 0 < b)
    (K : HilbertModel.{v}) (M : measurable_hilbert_field (Fin 2) (fun _ => K))
    (s : SquareSections M (ENNReal.ofReal a • Measure.dirac 0 + ENNReal.ofReal b • Measure.dirac 1)) :
    ‖mk M _ s‖ ^ 2 = a * ‖s.val 0‖ ^ 2 + b * ‖s.val 1‖ ^ 2 := by sorry


theorem null_singleton (s t : SquareSections M μ) (x₀ : X) (hnull : μ {x₀} = 0)
    (h : ∀ x, x ≠ x₀ → s.val x = t.val x) : mk M μ s = mk M μ t := by sorry

-- Test: direct_integral.null_singleton
-- Changing a section on a μ-null singleton leaves its class unchanged even when its value changes.
example (s t : SquareSections M μ) (x₀ : X) (hnull : μ {x₀} = 0)
    (h : ∀ x, x ≠ x₀ → s.val x = t.val x) : mk M μ s = mk M μ t := by sorry

end direct_integral

/-- Bounded measurable operator fields act on the Hilbert quotient. -/
def decomposable_operator {X : Type u} [MeasurableSpace X] {H K : X → HilbertModel.{v}}
    (M : measurable_hilbert_field X H) (N : measurable_hilbert_field X K) (μ : Measure X)
    (A : ∀ x, (H x).Carrier →L[ℂ] (K x).Carrier)
    (hA : ∀ s ∈ M.sections, (fun x => A x (s x)) ∈ N.sections)
    (hBound : ∃ C : ℝ, ∀ᵐ x ∂μ, ‖A x‖ ≤ C) :
    (direct_integral M μ).Carrier →L[ℂ] (direct_integral N μ).Carrier := by sorry

namespace decomposable_operator
theorem identityMeas {X : Type u} [MeasurableSpace X] {H : X → HilbertModel.{v}}
    (M : measurable_hilbert_field X H) :
    ∀ s ∈ M.sections, (fun x => ContinuousLinearMap.id ℂ (H x).Carrier (s x)) ∈ M.sections := by sorry

theorem identityBound {X : Type u} [MeasurableSpace X] {H : X → HilbertModel.{v}}
    (μ : Measure X) : ∃ C : ℝ, ∀ᵐ x ∂μ, ‖ContinuousLinearMap.id ℂ (H x).Carrier‖ ≤ C := by sorry

variable {X : Type u} [MeasurableSpace X] {H K : X → HilbertModel.{v}}
variable (M : measurable_hilbert_field X H) (N : measurable_hilbert_field X K) (μ : Measure X)
variable (A : ∀ x, (H x).Carrier →L[ℂ] (K x).Carrier)
variable (hA : ∀ s ∈ M.sections, (fun x => A x (s x)) ∈ N.sections)
variable (hB : ∃ C : ℝ, ∀ᵐ x ∂μ, ‖A x‖ ≤ C)
theorem apply_mk (s : SquareSections M μ) (t : SquareSections N μ)
    (ht : ∀ x, t.val x = A x (s.val x)) :
    decomposable_operator M N μ A hA hB (direct_integral.mk M μ s) = direct_integral.mk N μ t := by sorry

theorem norm_eq_essSup [SigmaFinite μ] : ENNReal.ofReal ‖decomposable_operator M N μ A hA hB‖ =
    essSup (fun x => ENNReal.ofReal ‖A x‖) μ := by sorry

theorem adjoint (A' : ∀ x, (K x).Carrier →L[ℂ] (H x).Carrier)
    (hAdj : ∀ x, A' x = (A x).adjoint)
    (hA' : ∀ s ∈ N.sections, (fun x => A' x (s x)) ∈ M.sections)
    (hB' : ∃ C : ℝ, ∀ᵐ x ∂μ, ‖A' x‖ ≤ C) :
    (decomposable_operator M N μ A hA hB).adjoint =
      decomposable_operator N M μ A' hA' hB' := by sorry

theorem identity (hNonzero : Nontrivial (direct_integral M μ).Carrier) :
    decomposable_operator M M μ (fun x => ContinuousLinearMap.id ℂ (H x).Carrier)
      (identityMeas M) (identityBound μ) = ContinuousLinearMap.id ℂ (direct_integral M μ).Carrier ∧
    ‖decomposable_operator M M μ (fun x => ContinuousLinearMap.id ℂ (H x).Carrier)
      (identityMeas M) (identityBound μ)‖ = 1 := by sorry

-- Test: decomposable_operator.identity
-- For the identity operator field, its decomposable operator is the identity on the direct integral and has norm one on a nonzero scalar fibre model.
example (hNonzero : Nontrivial (direct_integral M μ).Carrier) :
    decomposable_operator M M μ (fun x => ContinuousLinearMap.id ℂ (H x).Carrier)
      (identityMeas M) (identityBound μ) = ContinuousLinearMap.id ℂ (direct_integral M μ).Carrier ∧
    ‖decomposable_operator M M μ (fun x => ContinuousLinearMap.id ℂ (H x).Carrier)
      (identityMeas M) (identityBound μ)‖ = 1 := by sorry


theorem null_change (B : ∀ x, (H x).Carrier →L[ℂ] (K x).Carrier)
    (hMeas : ∀ s ∈ M.sections, (fun x => B x (s x)) ∈ N.sections)
    (hBound : ∃ C : ℝ, ∀ᵐ x ∂μ, ‖B x‖ ≤ C) (h : ∀ᵐ x ∂μ, A x = B x) :
    decomposable_operator M N μ A hA hB = decomposable_operator M N μ B hMeas hBound := by sorry

-- Test: decomposable_operator.null_change
-- Changing A on a null set induces the same operator.
example (B : ∀ x, (H x).Carrier →L[ℂ] (K x).Carrier)
    (hMeas : ∀ s ∈ M.sections, (fun x => B x (s x)) ∈ N.sections)
    (hBound : ∃ C : ℝ, ∀ᵐ x ∂μ, ‖B x‖ ≤ C) (h : ∀ᵐ x ∂μ, A x = B x) :
    decomposable_operator M N μ A hA hB = decomposable_operator M N μ B hMeas hBound := by sorry


theorem unbounded_multiplier :
    ¬ ∃ T : Lp ℂ 2 (volume : Measure ℝ) →L[ℂ] Lp ℂ 2 (volume : Measure ℝ),
      ∀ g : ℝ → ℂ, ∀ hg : MemLp g 2 volume, HasCompactSupport g →
        ∀ᵐ x : ℝ ∂volume, T (hg.toLp g) x = (x : ℂ) * g x := by sorry

-- Test: decomposable_operator.unbounded_multiplier
-- Multiplication by the real coordinate on L²(ℝ) has no bounded extension agreeing almost everywhere on all compactly supported vectors.
example :
    ¬ ∃ T : Lp ℂ 2 (volume : Measure ℝ) →L[ℂ] Lp ℂ 2 (volume : Measure ℝ),
      ∀ g : ℝ → ℂ, ∀ hg : MemLp g 2 volume, HasCompactSupport g →
        ∀ᵐ x : ℝ ∂volume, T (hg.toLp g) x = (x : ℂ) * g x := by sorry

end decomposable_operator

/-- The dense-domain extension statement is expressed using the existing Hilbert-space maps. -/
theorem isometric_integration_map {D H : Type*}
    [NormedAddCommGroup D] [InnerProductSpace ℂ D] [CompleteSpace D]
    [NormedAddCommGroup H] [InnerProductSpace ℂ H] [CompleteSpace H]
    (S : Submodule ℂ D) (hDense : Dense (S : Set D)) (W₀ : S →ₗ[ℂ] H)
    (hGram : ∀ u v, inner ℂ (W₀ u) (W₀ v) = inner ℂ u.val v.val) :
    ∃! W : D →ₗᵢ[ℂ] H, ∀ u : S, W u.val = W₀ u := by sorry

/-- Exact projection and strong-additivity axioms, rather than operator-norm additivity. -/
structure projection_valued_measure (H : Type u)
    [NormedAddCommGroup H] [InnerProductSpace ℂ H] [CompleteSpace H] where
  projection : Set ℝ → H →L[ℂ] H
  empty_value : projection ∅ = 0
  total_value : projection Set.univ = ContinuousLinearMap.id ℂ H
  orthogonal : ∀ B, MeasurableSet B → (projection B).adjoint = projection B
  idempotent : ∀ B, MeasurableSet B → (projection B).comp (projection B) = projection B
  strong_additive : ∀ B : ℕ → Set ℝ, (∀ n, MeasurableSet (B n)) →
    Pairwise (fun i j => Disjoint (B i) (B j)) →
      ∀ v : H, HasSum (fun n => projection (B n) v) (projection (⋃ n, B n) v)

namespace projection_valued_measure
variable {H : Type u} [NormedAddCommGroup H] [InnerProductSpace ℂ H] [CompleteSpace H]
def scalarMeasure (E : projection_valued_measure H) (v : H) : Measure ℝ := by sorry

theorem inter (E : projection_valued_measure H) (B C : Set ℝ)
    (hB : MeasurableSet B) (hC : MeasurableSet C) :
    (E.projection B).comp (E.projection C) = E.projection (B ∩ C) := by sorry

def borelIntegral (E : projection_valued_measure H) (f : ℝ → ℂ)
    (hf : Measurable f) (hBound : ∃ C, ∀ x, ‖f x‖ ≤ C) : H →L[ℂ] H := by sorry

theorem scalarMeasure_apply (E : projection_valued_measure H) (v : H) (B : Set ℝ)
    (hB : MeasurableSet B) :
    E.scalarMeasure v B = ENNReal.ofReal (‖E.projection B v‖ ^ 2) := by sorry

theorem borelIntegral_inner (E : projection_valued_measure H) (f : ℝ → ℂ) (hf : Measurable f)
    (hBound : ∃ C, ∀ x, ‖f x‖ ≤ C) (v : H) :
    inner ℂ v (E.borelIntegral f hf hBound v) = ∫ t, f t ∂(E.scalarMeasure v) := by sorry

/-- A finite atomic spectral measure used to test the projection construction. -/
def diagonal_measure (a b : ℝ) : projection_valued_measure (EuclideanSpace ℂ (Fin 2)) := by sorry

theorem finite_diagonal (a b : ℝ) (B : Set ℝ) (hB : MeasurableSet B)
    (v : EuclideanSpace ℂ (Fin 2)) :
    (diagonal_measure a b).projection B v =
      WithLp.toLp 2 (fun i : Fin 2 => B.indicator (fun _ : ℝ => v i) (if i = 0 then a else b)) := by sorry

-- Test: projection_valued_measure.finite_diagonal
-- For diag(a,b), E(B)=diag(1_B(a),1_B(b)).
example (a b : ℝ) (B : Set ℝ) (hB : MeasurableSet B)
    (v : EuclideanSpace ℂ (Fin 2)) :
    (diagonal_measure a b).projection B v =
      WithLp.toLp 2 (fun i : Fin 2 => B.indicator (fun _ : ℝ => v i) (if i = 0 then a else b)) := by sorry


theorem empty (E : projection_valued_measure H) :
    E.projection ∅ = 0 ∧ E.projection Set.univ = ContinuousLinearMap.id ℂ H := by sorry

-- Test: projection_valued_measure.empty
-- E(∅)=0 and E(total)=1, including the zero Hilbert space.
example (E : projection_valued_measure H) :
    E.projection ∅ = 0 ∧ E.projection Set.univ = ContinuousLinearMap.id ℂ H := by sorry


def multiplication_measure : projection_valued_measure (Lp ℂ 2 (volume : Measure ℝ)) := by sorry

theorem multiplication (B : Set ℝ) (hB : MeasurableSet B) (f : Lp ℂ 2 (volume : Measure ℝ)) :
    ∀ᵐ x : ℝ ∂volume, (multiplication_measure.projection B f) x = B.indicator (fun y => f y) x := by sorry

-- Test: projection_valued_measure.multiplication
-- On L²(ℝ), E(B) is multiplication by 1_B.
example (B : Set ℝ) (hB : MeasurableSet B) (f : Lp ℂ 2 (volume : Measure ℝ)) :
    ∀ᵐ x : ℝ ∂volume, (multiplication_measure.projection B f) x = B.indicator (fun y => f y) x := by sorry

end projection_valued_measure

/-- Tau Ceti's `exists_isFiniteMeasure_eq_nevanlinnaKernel_add` gives the finite measure `ρ`;
the weighted measure below converts it to the subtracted form, so scalar existence is not proved
again. Uniqueness and the resolvent specialization are the additional content. -/
theorem herglotz_representation (F : ℂ → ℂ)
    (hF : AnalyticOnNhd ℂ F {z : ℂ | 0 < z.im})
    (hIm : ∀ z : ℂ, 0 < z.im → 0 ≤ (F z).im) :
    ∃! p : ℝ × ℝ × Measure ℝ,
      p.1 = (F Complex.I).re ∧ 0 ≤ p.2.1 ∧
      Integrable (fun t : ℝ => (1 + t ^ 2)⁻¹) p.2.2 ∧
      ∀ z : ℂ, 0 < z.im → F z = (p.1 : ℂ) + (p.2.1 : ℂ) * z +
        ∫ t : ℝ, ((t : ℂ) - z)⁻¹ - (t / (1 + t ^ 2) : ℝ) ∂p.2.2 := by sorry

namespace herglotz_representation
/-- Convert the library's finite measure to the subtracted-kernel convention. -/
def weightedMeasure (rho : Measure ℝ) : Measure ℝ :=
  rho.withDensity (fun t => ENNReal.ofReal (1 + t ^ 2))

theorem weighted_mass (rho : Measure ℝ) [IsFiniteMeasure rho] :
    Integrable (fun t : ℝ => (1 + t ^ 2)⁻¹) (weightedMeasure rho) ∧
      ∫ t : ℝ, (1 + t ^ 2)⁻¹ ∂weightedMeasure rho = ∫ _ : ℝ, (1 : ℝ) ∂rho := by sorry

/-- The right-hand integrand is exactly Tau Ceti's `nevanlinnaKernel z t`. -/
theorem integral_conversion (rho : Measure ℝ) [IsFiniteMeasure rho]
    (z : ℂ) (hz : 0 < z.im) :
    Integrable (fun t : ℝ => ((t : ℂ) - z)⁻¹ - (t / (1 + t ^ 2) : ℝ))
      (weightedMeasure rho) ∧
      ∫ t : ℝ, ((t : ℂ) - z)⁻¹ - (t / (1 + t ^ 2) : ℝ) ∂weightedMeasure rho =
        ∫ t : ℝ, (1 + (t : ℂ) * z) / ((t : ℂ) - z) ∂rho := by sorry

-- Tests: weighting by 1+t² is distinguished from an unweighted or reciprocal choice.
example : weightedMeasure (0 : Measure ℝ) = 0 := by sorry
example : weightedMeasure (Measure.dirac (2 : ℝ)) =
    (5 : ℝ≥0∞) • Measure.dirac (2 : ℝ) := by sorry
example : ∫ t : ℝ, (1 + t ^ 2)⁻¹ ∂weightedMeasure (Measure.dirac (2 : ℝ)) = 1 := by sorry
end herglotz_representation

end TauCeti.AutomorphicSpectral

namespace TauCeti.AutomorphicSpectral
universe u v w
section HilbertOperators
variable {H K L : Type u} [NormedAddCommGroup H] [InnerProductSpace ℂ H] [CompleteSpace H]
variable [NormedAddCommGroup K] [InnerProductSpace ℂ K] [CompleteSpace K]
variable [NormedAddCommGroup L] [InnerProductSpace ℂ L] [CompleteSpace L]

/-- Compatibility name for the native self-adjoint partial linear map. -/
abbrev SelfAdjointGraph (D : Submodule ℂ H) (A : D →ₗ[ℂ] H) : Prop :=
  IsSelfAdjoint (⟨D, A⟩ : H →ₗ.[ℂ] H)

def spectral_resolvent (E : projection_valued_measure H) (z : ℂ)
    (hz : z.im ≠ 0) : H →L[ℂ] H := by sorry

theorem spectral_resolvent_inner (E : projection_valued_measure H) (z : ℂ) (hz : z.im ≠ 0)
    (v : H) : inner ℂ v (spectral_resolvent E z hz v) =
      ∫ t : ℝ, ((t : ℂ) - z)⁻¹ ∂(projection_valued_measure.scalarMeasure E v) := by sorry

/-- The spectral convention is `(A - z I)⁻¹`; the native resolvent is its negative.
The inverse witness carries the actual domain and both inverse equations. -/
theorem spectral_resolvent_eq_neg_native (D : Submodule ℂ H) (A : D →ₗ[ℂ] H)
    (E : projection_valued_measure H) (z : ℂ) (hz : z.im ≠ 0)
    (hInverse : TauCeti.LinearPMap.IsResolventAt (⟨D, A⟩ : H →ₗ.[ℂ] H)
      z (-spectral_resolvent E z hz)) :
    spectral_resolvent E z hz =
      -TauCeti.LinearPMap.resolvent (⟨D, A⟩ : H →ₗ.[ℂ] H) z := by
  rw [TauCeti.LinearPMap.resolvent_eq_of_isResolventAt hInverse]
  simp

/-- On a separable space a self-adjoint operator is coordinate multiplication on a
measurable-multiplicity direct integral; the spectral measure itself is SelfAdjointSpectralTheory's. -/
theorem unbounded_selfadjoint_spectral [TopologicalSpace.SeparableSpace H]
    (D : Submodule ℂ H) (A : D →ₗ[ℂ] H) (hA : SelfAdjointGraph D A) :
    ∃ μ : Measure ℝ, IsFiniteMeasure μ ∧ ∃ Kf : ℝ → HilbertModel.{u},
      ∃ M : measurable_hilbert_field ℝ Kf,
        ∃ U : H ≃ₗᵢ[ℂ] (direct_integral M μ).Carrier,
          ∀ (v : H) (s : SquareSections M μ), U v = direct_integral.mk M μ s →
            (v ∈ D ↔ Integrable (fun t : ℝ => t ^ 2 * ‖s.val t‖ ^ 2) μ) ∧
            ∀ (hv : v ∈ D) (s' : SquareSections M μ),
              (∀ᵐ t ∂μ, s'.val t = (t : ℂ) • s.val t) →
              U (A ⟨v, hv⟩) = direct_integral.mk M μ s' := by sorry

theorem bounded_normal_spectral [TopologicalSpace.SeparableSpace H] (N : H →L[ℂ] H)
    (hNormal : N.adjoint.comp N = N.comp N.adjoint) :
    ∃ μ : Measure ℂ, ∃ K : ℂ → HilbertModel.{u},
      ∃ M : measurable_hilbert_field ℂ K,
        ∃ U : H ≃ₗᵢ[ℂ] (direct_integral M μ).Carrier,
          ∃ D : (direct_integral M μ).Carrier →L[ℂ] (direct_integral M μ).Carrier,
            (∀ v : H, U (N v) = D (U v)) ∧
            (∀ s t : SquareSections M μ,
              (∀ᵐ z ∂μ, t.val z = z • s.val z) →
              D (direct_integral.mk M μ s) = direct_integral.mk M μ t) ∧
            μ (spectrum ℂ N)ᶜ = 0 := by sorry

/-- Fixed-basis representative. Basis independence is the API theorem below. -/
def hilbert_schmidt {ι : Type v} (b : HilbertBasis ι ℂ H) :=
  {A : H →L[ℂ] K // Summable (fun i => ‖A (b i)‖ ^ 2)}

def hsNorm {ι : Type v} (b : HilbertBasis ι ℂ H) (A : hilbert_schmidt (K := K) b) : ℝ :=
  Real.sqrt (∑' i, ‖A.val (b i)‖ ^ 2)

def rankOne (u : H) (v : K) : H →L[ℂ] K := (innerSL ℂ u).smulRight v

namespace hilbert_schmidt
variable {ι κ : Type v} [Countable ι] [Countable κ]
theorem norm_basis (b : HilbertBasis ι ℂ H) (c : HilbertBasis κ ℂ H)
    (A : hilbert_schmidt (K := K) b) :
    Summable (fun j => ‖A.val (c j)‖ ^ 2) ∧ hsNorm b A ^ 2 = ∑' j, ‖A.val (c j)‖ ^ 2 := by sorry

theorem ideal_bound (b : HilbertBasis ι ℂ H) (c : HilbertBasis κ ℂ L)
    (A : hilbert_schmidt (K := K) b) (B : K →L[ℂ] K) (C : L →L[ℂ] H) :
    ∃ T : hilbert_schmidt (K := K) c,
      T.val = B.comp (A.val.comp C) ∧ hsNorm c T ≤ ‖B‖ * hsNorm b A * ‖C‖ := by sorry

/-- Kernel operator construction requires its explicit integrability domain. -/
def kernel_operator {X Y : Type u} [MeasurableSpace X] [MeasurableSpace Y]
    (μ : Measure X) (ν : Measure Y) (k : Lp ℂ 2 (μ.prod ν)) :
    Lp ℂ 2 ν →L[ℂ] Lp ℂ 2 μ := by sorry

theorem kernel_operator_apply {X Y : Type u} [MeasurableSpace X] [MeasurableSpace Y]
    (μ : Measure X) (ν : Measure Y) [SFinite μ] [SFinite ν]
    (k : Lp ℂ 2 (μ.prod ν)) (f : Lp ℂ 2 ν) :
    ∀ᵐ x ∂μ, kernel_operator μ ν k f x = ∫ y, k (x, y) * f y ∂ν := by sorry

theorem kernel_norm {X Y : Type u} [MeasurableSpace X] [MeasurableSpace Y]
    (μ : Measure X) (ν : Measure Y) [SFinite μ] [SFinite ν]
    (k : Lp ℂ 2 (μ.prod ν)) (b : HilbertBasis ι ℂ (Lp ℂ 2 ν)) :
    ∃ T : hilbert_schmidt (K := Lp ℂ 2 μ) b,
      T.val = kernel_operator μ ν k ∧ hsNorm b T = ‖k‖ := by sorry

theorem rank_one (b : HilbertBasis ι ℂ H) (u : H) (v : K) :
    ∃ T : hilbert_schmidt (K := K) b, T.val = rankOne u v ∧ hsNorm b T = ‖u‖ * ‖v‖ := by sorry

-- Test: hilbert_schmidt.rank_one
-- For v↦⟪u,v⟫w, ‖A‖HS=‖u‖‖w‖.
example (b : HilbertBasis ι ℂ H) (u : H) (v : K) :
    ∃ T : hilbert_schmidt (K := K) b, T.val = rankOne u v ∧ hsNorm b T = ‖u‖ * ‖v‖ := by sorry


theorem infinite_identity (b : HilbertBasis ℕ ℂ H) :
    ¬ ∃ T : hilbert_schmidt (K := H) b, T.val = ContinuousLinearMap.id ℂ H := by sorry

-- Test: hilbert_schmidt.infinite_identity
-- On a Hilbert space with an ℕ-indexed Hilbert basis the identity has no Hilbert–Schmidt representative.
example (b : HilbertBasis ℕ ℂ H) :
    ¬ ∃ T : hilbert_schmidt (K := H) b, T.val = ContinuousLinearMap.id ℂ H := by sorry


theorem finite_identity (n : ℕ) (b : HilbertBasis (Fin n) ℂ H) :
    ∃ T : hilbert_schmidt (K := H) b,
      T.val = ContinuousLinearMap.id ℂ H ∧ hsNorm b T = Real.sqrt n := by sorry

-- Test: hilbert_schmidt.finite_identity
-- On an n-dimensional Hilbert space the actual identity is Hilbert–Schmidt and has Hilbert–Schmidt norm √n.
example (n : ℕ) (b : HilbertBasis (Fin n) ℂ H) :
    ∃ T : hilbert_schmidt (K := H) b,
      T.val = ContinuousLinearMap.id ℂ H ∧ hsNorm b T = Real.sqrt n := by sorry

end hilbert_schmidt

/-- A summable rank-one expansion characterizes trace class on Hilbert space. -/
def trace_class (H : Type u) [NormedAddCommGroup H] [InnerProductSpace ℂ H]
    [CompleteSpace H] :=
  {A : H →L[ℂ] H // ∃ u v : ℕ → H,
    Summable (fun n => ‖u n‖ * ‖v n‖) ∧
      ∀ x : H, HasSum (fun n => inner ℂ (u n) x • v n) (A x)}

def traceNorm (A : trace_class H) : ℝ := by sorry
def operatorTrace (A : trace_class H) : ℂ := by sorry

namespace trace_class
/-- Bounded diagonal operator on the supplied complete orthonormal basis. -/
def harmonicDiagonal (b : HilbertBasis ℕ ℂ H) : H →L[ℂ] H := by sorry

theorem harmonicDiagonal_apply (b : HilbertBasis ℕ ℂ H) (n : ℕ) :
    harmonicDiagonal b (b n) = ((n + 1 : ℂ)⁻¹) • b n := by sorry

variable {ι κ : Type v} [Countable ι] [Countable κ]
theorem trace_basis (A : trace_class H) (b : HilbertBasis ι ℂ H) :
    Summable (fun i => ‖inner ℂ (b i) (A.val (b i))‖) ∧
      operatorTrace A = ∑' i, inner ℂ (b i) (A.val (b i)) := by sorry

theorem mul_hs (b : HilbertBasis ι ℂ H) (c : HilbertBasis κ ℂ K)
    (B : hilbert_schmidt (K := H) c) (C : hilbert_schmidt (K := K) b) :
    ∃ A : trace_class H, A.val = B.val.comp C.val ∧ traceNorm A ≤ hsNorm c B * hsNorm b C := by sorry

theorem trace_cyclic (A : trace_class H) (D : H →L[ℂ] H) :
    ∃ AD DA : trace_class H, AD.val = A.val.comp D ∧ DA.val = D.comp A.val ∧
      operatorTrace AD = operatorTrace DA := by sorry

theorem trace_continuous (A B : trace_class H) :
    ∃ T : trace_class H, T.val = A.val - B.val ∧
      ‖operatorTrace A - operatorTrace B‖ ≤ traceNorm T := by sorry

theorem rank_one_trace (u v : H) :
    ∃ T : trace_class H, T.val = rankOne u v ∧ operatorTrace T = inner ℂ u v := by sorry

-- Test: trace_class.rank_one_trace
-- tr(v↦⟪u,v⟫w)=⟪u,w⟫.
example (u v : H) :
    ∃ T : trace_class H, T.val = rankOne u v ∧ operatorTrace T = inner ℂ u v := by sorry


theorem diagonal_harmonic (b : HilbertBasis ℕ ℂ H) :
    (∃ T : hilbert_schmidt (K := H) b, T.val = harmonicDiagonal b) ∧
      ¬ ∃ T : trace_class H, T.val = harmonicDiagonal b := by sorry

-- Test: trace_class.diagonal_harmonic
-- The bounded diagonal operator with basis coefficients 1/(n+1) is Hilbert–Schmidt and has no trace-class representative.
example (b : HilbertBasis ℕ ℂ H) :
    (∃ T : hilbert_schmidt (K := H) b, T.val = harmonicDiagonal b) ∧
      ¬ ∃ T : trace_class H, T.val = harmonicDiagonal b := by sorry


theorem projection_trace (P : H →L[ℂ] H) (hIdem : P.comp P = P)
    (hAdj : P.adjoint = P) [FiniteDimensional ℂ P.range] :
    ∃ T : trace_class H, T.val = P ∧
      operatorTrace T = (Module.finrank ℂ P.range : ℂ) ∧
      traceNorm T = (Module.finrank ℂ P.range : ℝ) := by sorry

-- Test: trace_class.projection_trace
-- An orthogonal projection of rank r has trace and trace norm r.
example (P : H →L[ℂ] H) (hIdem : P.comp P = P)
    (hAdj : P.adjoint = P) [FiniteDimensional ℂ P.range] :
    ∃ T : trace_class H, T.val = P ∧
      operatorTrace T = (Module.finrank ℂ P.range : ℂ) ∧
      traceNorm T = (Module.finrank ℂ P.range : ℝ) := by sorry

end trace_class
end HilbertOperators

/-- A product of square-integrable kernels has a canonical integrable diagonal. -/
theorem kernel_trace_diagonal {X : Type u} [MeasurableSpace X] (μ : Measure X) [SFinite μ]
    (k₁ k₂ : X → X → ℂ)
    (h₁ : MemLp (Function.uncurry k₁) 2 (μ.prod μ))
    (h₂ : MemLp (Function.uncurry k₂) 2 (μ.prod μ))
    (k : X → X → ℂ)
    (hDiag : ∀ᵐ x ∂μ, k x x = ∫ y, k₁ x y * k₂ y x ∂μ) :
    Integrable (fun x => k x x) μ ∧
      ∃ T : trace_class (Lp ℂ 2 μ),
        T.val = (hilbert_schmidt.kernel_operator μ μ (h₁.toLp _)).comp
          (hilbert_schmidt.kernel_operator μ μ (h₂.toLp _)) ∧
        operatorTrace T = ∫ x, k x x ∂μ := by sorry

/-- Distribution topology is imported on a strict sequence of fixed support/level pieces. -/
@[instance_reducible] def nuclear_lf_space (E : Type u) [AddCommGroup E] [Module ℂ E]
    (pieces : ℕ → Submodule ℂ E) (topologies : ∀ n, TopologicalSpace (pieces n)) :
    TopologicalSpace E := by sorry

namespace nuclear_lf_space
abbrev RealTests := TestFunction (⊤ : TopologicalSpace.Opens ℝ) ℂ ⊤

def realCompact (n : ℕ) : TopologicalSpace.Compacts ℝ :=
  ⟨Set.Icc (-(n : ℝ)) n, isCompact_Icc⟩

def realPieces (n : ℕ) : Submodule ℂ RealTests where
  carrier := {f | Function.support f ⊆ realCompact n}
  zero_mem' := by sorry
  add_mem' := by sorry
  smul_mem' := by sorry

/-- Actual identification with the fixed-support smooth carrier, preserving evaluations. -/
def realStageEquiv (n : ℕ) :
    realPieces n ≃ₗ[ℂ] ContDiffMapSupportedIn ℝ ℂ ⊤ (realCompact n) := by sorry

@[instance_reducible] def realStageTopology (n : ℕ) : TopologicalSpace (realPieces n) :=
  TopologicalSpace.induced (realStageEquiv n) inferInstance

theorem realStageEquiv_apply (n : ℕ) (f : realPieces n) (x : ℝ) :
    realStageEquiv n f x = f.val x := by sorry

def translate (f : RealTests) (n : ℕ) : RealTests :=
  ⟨fun x => f (x - n), by sorry, by sorry, by sorry⟩

variable {E : Type u} [AddCommGroup E] [Module ℂ E]
def supportLevelPiece {G : Type v} (support : Set G) (invariant : (G → ℂ) → Prop) :
    Set (G → ℂ) := {f | Function.support f ⊆ support ∧ invariant f}

/-- The closed-embedding hypothesis is stated explicitly for the supplied stage maps. -/
theorem inclusion (m n : ℕ) (hmn : realPieces m ≤ realPieces n) :
    @Topology.IsClosedEmbedding (realPieces m) (realPieces n)
      (realStageTopology m) (realStageTopology n) (Submodule.inclusion hmn) := by sorry

theorem bounded_stage [TopologicalSpace E] (pieces : ℕ → Submodule ℂ E)
    (topologies : ∀ n, TopologicalSpace (pieces n))
    (hExhaust : ∀ x : E, ∃ n, x ∈ pieces n)
    (hIncreasing : Monotone pieces)
    (hFinal : ‹TopologicalSpace E› = nuclear_lf_space E pieces topologies)
    (hClosed : ∀ n, IsClosed (pieces n : Set E))
    (hStage : ∀ n, topologies n = TopologicalSpace.induced (Subtype.val : pieces n → E)
      ‹TopologicalSpace E›) (B : Set E) (hBounded : Bornology.IsVonNBounded ℂ B) :
    ∃ n, B ⊆ pieces n := by sorry

def distributionDual [TopologicalSpace E] : Type u := E →L[ℂ] ℂ

theorem finite_group (G : Type u) [Fintype G] :
    nuclear_lf_space (G → ℂ) (fun _ => ⊤)
      (fun _ => TopologicalSpace.induced (Subtype.val : (⊤ : Submodule ℂ (G → ℂ)) → G → ℂ)
        inferInstance) = (inferInstance : TopologicalSpace (G → ℂ)) := by sorry

-- Test: nuclear_lf_space.finite_group
-- The constant finite-group function stages induce exactly the usual finite-dimensional topology on their function space.
example (G : Type u) [Fintype G] :
    nuclear_lf_space (G → ℂ) (fun _ => ⊤)
      (fun _ => TopologicalSpace.induced (Subtype.val : (⊤ : Submodule ℂ (G → ℂ)) → G → ℂ)
        inferInstance) = (inferInstance : TopologicalSpace (G → ℂ)) := by sorry


theorem real_line :
    nuclear_lf_space RealTests realPieces realStageTopology =
      (inferInstance : TopologicalSpace RealTests) ∧
    ∀ n : ℕ, @Topology.IsClosedEmbedding (realPieces n) RealTests
      (realStageTopology n) inferInstance Subtype.val := by sorry

-- Test: nuclear_lf_space.real_line
-- For real smooth compactly supported tests, the support-stage construction agrees with Mathlib TestFunction topology, and each fixed-support stage embeds as a closed subspace.
example :
    nuclear_lf_space RealTests realPieces realStageTopology =
      (inferInstance : TopologicalSpace RealTests) ∧
    ∀ n : ℕ, @Topology.IsClosedEmbedding (realPieces n) RealTests
      (realStageTopology n) inferInstance Subtype.val := by sorry


/-- An escaping support family is not confined to any fixed compact piece. -/
theorem escaping_support (f : RealTests) (hf : f 0 ≠ 0) :
    ¬ Bornology.IsVonNBounded ℂ (Set.range (translate f)) := by sorry

-- Test: nuclear_lf_space.escaping_support
-- The translates by n of a fixed nonzero real test function are not von Neumann bounded in the actual LF topology; failure of a common support alone is not the conclusion.
example (f : RealTests) (hf : f 0 ≠ 0) :
    ¬ Bornology.IsVonNBounded ℂ (Set.range (translate f)) := by sorry

end nuclear_lf_space

/-- A nuclear map `v ↦ Σ λ_j ℓ_j(v) w_j` carries summable families to absolutely summable ones. -/
theorem locally_convex_integration {V W : Type u}
    [NormedAddCommGroup V] [NormedSpace ℂ V] [CompleteSpace V]
    [NormedAddCommGroup W] [NormedSpace ℂ W] [CompleteSpace W]
    (lam : ℕ → ℂ) (ell : ℕ → V →L[ℂ] ℂ) (w : ℕ → W)
    (hlam : Summable (fun j => ‖lam j‖)) (hell : ∀ j, ‖ell j‖ ≤ 1) (hw : ∀ j, ‖w j‖ ≤ 1)
    (T : V →L[ℂ] W) (hT : ∀ v, HasSum (fun j => (lam j * ell j v) • w j) (T v))
    (x : ℕ → V) (hx : Summable x) : Summable (fun n => ‖T (x n)‖) := by sorry

/-- Completed tensor carrier; its projective topology is construction work, not an assumed law. -/
def projective_tensor (E : Type u) (F : Type v) [NormedAddCommGroup E] [NormedSpace ℂ E]
    [NormedAddCommGroup F] [NormedSpace ℂ F] : Type (max u v) := by sorry

namespace projective_tensor
variable {E : Type u} {F : Type v} {G : Type w} [NormedAddCommGroup E] [NormedSpace ℂ E]
variable [NormedAddCommGroup F] [NormedSpace ℂ F]
variable [NormedAddCommGroup G] [NormedSpace ℂ G] [CompleteSpace G]
instance normed : NormedAddCommGroup (projective_tensor E F) := by sorry
instance normedSpace : NormedSpace ℂ (projective_tensor E F) := by sorry
instance complete : CompleteSpace (projective_tensor E F) := by sorry

def tensor : E →L[ℂ] F →L[ℂ] projective_tensor E F := by sorry

theorem lift (b : E →L[ℂ] F →L[ℂ] G) :
    ∃! T : projective_tensor E F →L[ℂ] G, ∀ x y, T (tensor x y) = b x y := by sorry

def map {E' : Type u} {F' : Type v} [NormedAddCommGroup E'] [NormedSpace ℂ E']
    [NormedAddCommGroup F'] [NormedSpace ℂ F'] (a : E →L[ℂ] E') (b : F →L[ℂ] F') :
    projective_tensor E F →L[ℂ] projective_tensor E' F' := by sorry

theorem map_comp {E' E'' : Type u} {F' F'' : Type v}
    [NormedAddCommGroup E'] [NormedSpace ℂ E'] [NormedAddCommGroup F'] [NormedSpace ℂ F']
    [NormedAddCommGroup E''] [NormedSpace ℂ E''] [NormedAddCommGroup F''] [NormedSpace ℂ F'']
    (a : E →L[ℂ] E') (b : F →L[ℂ] F') (c : E' →L[ℂ] E'') (d : F' →L[ℂ] F'') :
    (map c d).comp (map a b) = map (c.comp a) (d.comp b) := by sorry

def scalar_unit_equiv [CompleteSpace E] : projective_tensor ℂ E ≃L[ℂ] E := by sorry

theorem scalar_unit [CompleteSpace E] (c : ℂ) (x : E) :
    scalar_unit_equiv (tensor c x) = c • x := by sorry

-- Test: projective_tensor.scalar_unit
-- ℂ⊗̂πE≅E for complete E, by z⊗e↦ze.
example [CompleteSpace E] (c : ℂ) (x : E) :
    scalar_unit_equiv (tensor c x) = c • x := by sorry


def finite_matrix_equiv (m n : ℕ) :
    projective_tensor (Fin m → ℂ) (Fin n → ℂ) ≃L[ℂ] ((Fin m × Fin n) → ℂ) := by sorry

theorem finite_matrix (m n : ℕ) (x : Fin m → ℂ) (y : Fin n → ℂ) (i : Fin m) (j : Fin n) :
    finite_matrix_equiv m n (tensor x y) (i, j) = x i * y j := by sorry

-- Test: projective_tensor.finite_matrix
-- ℂᵐ⊗̂πℂⁿ≅ℂ^(m×n).
example (m n : ℕ) (x : Fin m → ℂ) (y : Fin n → ℂ) (i : Fin m) (j : Fin n) :
    finite_matrix_equiv m n (tensor x y) (i, j) = x i * y j := by sorry


theorem zero [Subsingleton E] : Subsingleton (projective_tensor E F) := by sorry

-- Test: projective_tensor.zero
-- If either factor is zero, the completed product is zero.
example [Subsingleton E] : Subsingleton (projective_tensor E F) := by sorry

end projective_tensor

/-- Normed restriction is the existing SchwartzMap. -/
abbrev vector_schwartz (E : Type u) (F : Type v) [NormedAddCommGroup E] [NormedSpace ℝ E]
    [NormedAddCommGroup F] [NormedSpace ℝ F] := SchwartzMap E F

namespace vector_schwartz
variable {E : Type u} {F : Type v} {G : Type w} [NormedAddCommGroup E] [NormedSpace ℝ E]
variable [NormedAddCommGroup F] [NormedSpace ℂ F] [NormedSpace ℝ F]
variable [NormedAddCommGroup G] [NormedSpace ℂ G] [NormedSpace ℝ G]
def tensor (φ : SchwartzMap E ℂ) (v : F) : vector_schwartz E F := by sorry

theorem tensor_apply (φ : SchwartzMap E ℂ) (v : F) (x : E) : tensor φ v x = φ x • v := by sorry

def map (T : F →L[ℂ] G) : vector_schwartz E F →L[ℂ] vector_schwartz E G :=
  SchwartzMap.postcompCLM T

/-- Fourier specialization to the self-dual real line. -/
def fourier [CompleteSpace F] : vector_schwartz ℝ F ≃L[ℂ] vector_schwartz ℝ F := by sorry

theorem fourier_apply [CompleteSpace F] (f : vector_schwartz ℝ F) (ξ : ℝ) :
    fourier f ξ = ∫ x : ℝ, Complex.exp (-(2 * Real.pi * Complex.I * x * ξ)) • f x := by sorry

theorem scalar : vector_schwartz E ℂ = SchwartzMap E ℂ := by sorry

-- Test: vector_schwartz.scalar
-- For E=ℂ this agrees with Mathlib SchwartzMap.
example : vector_schwartz E ℂ = SchwartzMap E ℂ := by sorry


def gaussian (v : F) : vector_schwartz ℝ F :=
  ⟨fun x => Real.exp (-Real.pi * x ^ 2) • v, by sorry, by sorry⟩

theorem gaussian_tensor [CompleteSpace F] (v : F) : fourier (gaussian v) = gaussian v := by sorry

-- Test: vector_schwartz.gaussian_tensor
-- The transform of e^(−π‖v‖²)e is the same Gaussian times e for self-dual Euclidean measure.
example [CompleteSpace F] (v : F) : fourier (gaussian v) = gaussian v := by sorry


theorem constant (v : F) (hv : v ≠ 0) :
    ¬ ∃ f : vector_schwartz ℝ F, ∀ x, f x = v := by sorry

-- Test: vector_schwartz.constant
-- A nonzero constant E-valued map on ℝ is not Schwartz.
example (v : F) (hv : v ≠ 0) :
    ¬ ∃ f : vector_schwartz ℝ F, ∀ x, f x = v := by sorry

end vector_schwartz

/-- One-variable normed-operator specialization of common-denominator meromorphy. -/
def operator_meromorphic {E : Type u} {F : Type v} [NormedAddCommGroup E] [NormedSpace ℂ E]
    [NormedAddCommGroup F] [NormedSpace ℂ F] (U : Set ℂ) :=
  {A : ℂ → E →L[ℂ] F // CommonDenominator U A}

namespace operator_meromorphic
/-- Algebraic direct-sum example: every vector has finite support, so these are
linear maps although no bounded operator exists on the Hilbert completion for small z. -/
def directSumPoles (z : ℂ) : (ℕ →₀ ℂ) →ₗ[ℂ] (ℕ →₀ ℂ) := by sorry

theorem directSumPoles_apply (z : ℂ) (v : ℕ →₀ ℂ) (n : ℕ) :
    directSumPoles z v n = z ^ (-(n : ℤ)) * v n := by sorry

variable {E : Type u} {F : Type v} {G : Type w} [NormedAddCommGroup E] [NormedSpace ℂ E]
variable [NormedAddCommGroup F] [NormedSpace ℂ F]
variable [NormedAddCommGroup G] [NormedSpace ℂ G]
/-- Weak meromorphy with one common local denominator and a local bound is strong meromorphy. -/
theorem regularize [CompleteSpace F] (U : Set ℂ) (A : ℂ → E →L[ℂ] F) :
    CommonDenominator U A ↔
      ∀ z ∈ U, ∃ n : ℕ, ∃ r : ℝ, 0 < r ∧
        (∀ (e : E) (ℓ : F →L[ℂ] ℂ), ∃ g : ℂ → ℂ, AnalyticOnNhd ℂ g (Metric.ball z r) ∧
          ∀ s ∈ Metric.ball z r, s ≠ z → g s = (s - z) ^ n * ℓ (A s e)) ∧
        ∃ C : ℝ, ∀ s ∈ Metric.ball z r, s ≠ z → ‖(s - z) ^ n • A s‖ ≤ C := by sorry

def coefficient (U : Set ℂ) (A : operator_meromorphic (E := E) (F := F) U)
    (z : ℂ) (order : ℤ) : E →L[ℂ] F := by sorry

theorem compose (U : Set ℂ) (A : operator_meromorphic (E := E) (F := F) U)
    (B : F →L[ℂ] G) : CommonDenominator U (fun z => B.comp (A.val z)) := by sorry

def scalar_family : operator_meromorphic (E := E) (F := E) Set.univ :=
  ⟨fun z => z⁻¹ • ContinuousLinearMap.id ℂ E, by sorry⟩

theorem scalar_pole : coefficient Set.univ (scalar_family (E := E)) 0 (-1) =
    ContinuousLinearMap.id ℂ E := by sorry

-- Test: operator_meromorphic.scalar_pole
-- For A(z)=z⁻¹id, the residue at 0 is id and is infinite rank when E is infinite dimensional.
example : coefficient Set.univ (scalar_family (E := E)) 0 (-1) =
    ContinuousLinearMap.id ℂ E := by sorry


theorem removable (U : Set ℂ) (A : operator_meromorphic (E := E) (F := F) U)
    (hA : AnalyticOnNhd ℂ A.val U) (z : ℂ) (hz : z ∈ U) (n : ℤ) (hn : n < 0) :
    coefficient U A z n = 0 := by sorry

-- Test: operator_meromorphic.removable
-- A holomorphic family has zero negative Laurent coefficients.
example (U : Set ℂ) (A : operator_meromorphic (E := E) (F := F) U)
    (hA : AnalyticOnNhd ℂ A.val U) (z : ℂ) (hz : z ∈ U) (n : ℤ) (hn : n < 0) :
    coefficient U A z n = 0 := by sorry


/-- Finite pole orders on individual basis vectors do not imply one bound. -/
theorem pointwise_orders :
    (∀ v : ℕ →₀ ℂ, ∀ n : ℕ,
      CommonDenominator Set.univ (fun z => directSumPoles z v n)) ∧
    ¬ ∃ N : ℕ, ∃ r : ℝ, 0 < r ∧ ∀ n : ℕ, ∃ g : ℂ → ℂ,
      AnalyticOnNhd ℂ g (Metric.ball 0 r) ∧
        ∀ z ∈ Metric.ball 0 r, z ≠ 0 →
          g z = z ^ N * directSumPoles z (Finsupp.single n 1) n := by sorry

-- Test: operator_meromorphic.pointwise_orders
-- For the direct-sum family with nth coordinate z^(−n), every finitely supported vector has a local denominator, but no common exponent and radius regularize all basis vectors.
example :
    (∀ v : ℕ →₀ ℂ, ∀ n : ℕ,
      CommonDenominator Set.univ (fun z => directSumPoles z v n)) ∧
    ¬ ∃ N : ℕ, ∃ r : ℝ, 0 < r ∧ ∀ n : ℕ, ∃ g : ℂ → ℂ,
      AnalyticOnNhd ℂ g (Metric.ball 0 r) ∧
        ∀ z ∈ Metric.ball 0 r, z ≠ 0 →
          g z = z ^ N * directSumPoles z (Finsupp.single n 1) n := by sorry

end operator_meromorphic

/-- One-variable normed inverse conclusion. -/
theorem analytic_fredholm {E : Type u} [NormedAddCommGroup E] [NormedSpace ℂ E]
    [CompleteSpace E] (U : Set ℂ) (hU : IsOpen U) (hConn : IsPreconnected U)
    (K : ℂ → E →L[ℂ] E) (hK : AnalyticOnNhd ℂ K U)
    (hCompact : ∀ z ∈ U, IsCompactOperator (K z))
    (z₀ : ℂ) (hz₀ : z₀ ∈ U) (hInv : IsUnit (1 - K z₀)) :
    ∃ R : operator_meromorphic (E := E) (F := E) U,
      ∀ z ∈ U, IsUnit (1 - K z) → (1 - K z) * R.val z = 1 ∧ R.val z * (1 - K z) = 1 := by sorry

/-- A pointwise limit of distributions on the LF test space is a distribution. -/
theorem distribution_convergence (T : ℕ → nuclear_lf_space.RealTests →L[ℂ] ℂ)
    (L : nuclear_lf_space.RealTests →ₗ[ℂ] ℂ)
    (h : ∀ f, Tendsto (fun n => T n f) atTop (𝓝 (L f))) : Continuous L := by sorry

theorem vector_phragmen_lindelof {V : Type u} [NormedAddCommGroup V] [NormedSpace ℂ V]
    [CompleteSpace V] (C : ℝ) (hC : 0 < C) (Zp Zm : ℂ → V)
    (hp : AnalyticOnNhd ℂ Zp {s : ℂ | C < s.re})
    (hm : AnalyticOnNhd ℂ Zm {s : ℂ | C < s.re})
    (hop : FiniteStripOrder Zp C) (hom : FiniteStripOrder Zm C)
    (scalarp scalarm : (V →L[ℂ] ℂ) → ℂ → ℂ)
    (hScalarp : ∀ ℓ, AnalyticOnNhd ℂ (scalarp ℓ) Set.univ)
    (hScalarm : ∀ ℓ, AnalyticOnNhd ℂ (scalarm ℓ) Set.univ)
    (hOrderp : ∀ ℓ, ∀ a : ℝ, FiniteStripOrder (scalarp ℓ) a)
    (hOrderm : ∀ ℓ, ∀ a : ℝ, FiniteStripOrder (scalarm ℓ) a)
    (hAgreep : ∀ ℓ s, C < s.re → scalarp ℓ s = ℓ (Zp s))
    (hAgreem : ∀ ℓ s, C < s.re → scalarm ℓ s = ℓ (Zm s))
    (hFE : ∀ ℓ s, scalarp ℓ s = scalarm ℓ (-s)) :
    ∃ Yp Ym : ℂ → V, AnalyticOnNhd ℂ Yp Set.univ ∧ AnalyticOnNhd ℂ Ym Set.univ ∧
      (∀ s, C < s.re → Yp s = Zp s ∧ Ym s = Zm s) ∧
      (∀ s, Yp s = Ym (-s)) ∧
      ∀ a : ℝ, FiniteStripOrder Yp a ∧ FiniteStripOrder Ym a := by sorry

end TauCeti.AutomorphicSpectral

namespace TauCeti.AutomorphicSpectral
universe u v w
/-- AS.0.25a: the Bessel function `J_ν(y) = (y/2)^ν ₀F̃₁(; ν+1; -y²/4)`, with the principal
complex power and Mathlib's entire regularized hypergeometric function, so every order is allowed. -/
def bessel_j (nu : ℂ) (y : ℝ) : ℂ :=
  ((y : ℂ) / 2) ^ nu * Complex.regularizedHGFun 0 {nu + 1} (-((y : ℂ) ^ 2) / 4)

/-- AS.0.25a: the modified Bessel function `I_ν(y) = (y/2)^ν ₀F̃₁(; ν+1; y²/4)`. -/
def bessel_i (nu : ℂ) (y : ℝ) : ℂ :=
  ((y : ℂ) / 2) ^ nu * Complex.regularizedHGFun 0 {nu + 1} ((y : ℂ) ^ 2 / 4)

/-- `K_ν(y) = ½ ∫₀^∞ exp(-y(u + u⁻¹)/2) u^ν du/u`, the Mellin integral of
AutomorphicLFunctionsAndLocalFactors, `AL.0/bessel-k`, written out in its defining form. -/
def bessel_k (nu : ℂ) (y : ℝ) : ℂ :=
  (1 / 2 : ℂ) * ∫ u : ℝ in Set.Ioi 0,
    Complex.exp (-(y : ℂ) * ((u : ℂ) + (u : ℂ)⁻¹) / 2) *
      Complex.exp (nu * (Real.log u : ℂ)) / (u : ℂ)

namespace bessel_j

theorem bessel_j_series (nu : ℂ) (y : ℝ) :
    HasSum (fun k : ℕ => (-1 : ℂ) ^ k * ((y : ℂ) / 2) ^ (nu + 2 * k) /
      ((k.factorial : ℂ) * Complex.Gamma (nu + k + 1))) (bessel_j nu y) := by sorry

theorem bessel_j_ode (nu : ℂ) (y : ℝ) (hy : 0 < y) :
    (y : ℂ) ^ 2 * deriv (deriv (bessel_j nu)) y + (y : ℂ) * deriv (bessel_j nu) y +
      ((y : ℂ) ^ 2 - nu ^ 2) * bessel_j nu y = 0 := by sorry

theorem bessel_j_recurrence (nu : ℂ) (y : ℝ) (hy : 0 < y) :
    bessel_j (nu - 1) y + bessel_j (nu + 1) y = 2 * nu / y * bessel_j nu y := by sorry

-- Test: J_{1/2}(y) = √(2/(πy)) sin y.
theorem bessel_j_half (y : ℝ) (hy : 0 < y) :
    bessel_j (1 / 2) y = (Real.sqrt (2 / (Real.pi * y)) * Real.sin y : ℝ) := by sorry

-- Test: J_{-n} = (-1)^n J_n, which a definition dividing by Γ instead of using 1/Γ fails.
theorem bessel_j_neg_int (n : ℕ) (y : ℝ) (hy : 0 < y) :
    bessel_j (-(n : ℂ)) y = (-1) ^ n * bessel_j n y := by sorry

end bessel_j

namespace bessel_i

theorem bessel_i_series (nu : ℂ) (y : ℝ) :
    HasSum (fun k : ℕ => ((y : ℂ) / 2) ^ (nu + 2 * k) /
      ((k.factorial : ℂ) * Complex.Gamma (nu + k + 1))) (bessel_i nu y) := by sorry

theorem bessel_i_ode (nu : ℂ) (y : ℝ) (hy : 0 < y) :
    (y : ℂ) ^ 2 * deriv (deriv (bessel_i nu)) y + (y : ℂ) * deriv (bessel_i nu) y -
      ((y : ℂ) ^ 2 + nu ^ 2) * bessel_i nu y = 0 := by sorry

-- Test: I_{1/2}(y) = √(2/(πy)) sinh y, so I is not J with the sign of y² forgotten.
theorem bessel_i_half (y : ℝ) (hy : 0 < y) :
    bessel_i (1 / 2) y = (Real.sqrt (2 / (Real.pi * y)) * Real.sinh y : ℝ) := by sorry

end bessel_i

/-- The rank-one special functions used by the modular specializations, characterized by their
defining equations; `SpecialFunctions.canonical` is the only such bundle up to equality. -/
structure SpecialFunctions where
  besselI : ℂ → ℝ → ℂ
  besselJ : ℂ → ℝ → ℂ
  besselK : ℂ → ℝ → ℂ
  completedZeta : ℂ → ℂ
  besselI_eq : ∀ (nu : ℂ) (y : ℝ), besselI nu y =
    ((y : ℂ) / 2) ^ nu * Complex.regularizedHGFun 0 {nu + 1} ((y : ℂ) ^ 2 / 4)
  besselJ_eq : ∀ (nu : ℂ) (y : ℝ), besselJ nu y =
    ((y : ℂ) / 2) ^ nu * Complex.regularizedHGFun 0 {nu + 1} (-((y : ℂ) ^ 2) / 4)
  besselK_eq : ∀ (nu : ℂ) (y : ℝ), besselK nu y =
    (1 / 2 : ℂ) * ∫ u : ℝ in Set.Ioi 0,
      Complex.exp (-(y : ℂ) * ((u : ℂ) + (u : ℂ)⁻¹) / 2) *
        Complex.exp (nu * (Real.log u : ℂ)) / (u : ℂ)
  completedZeta_eq : ∀ s : ℂ, completedZeta s = completedRiemannZeta s

namespace SpecialFunctions

/-- The bundle of AS.0.25a, `AL.0/bessel-k` and Mathlib's completed zeta function. -/
def canonical : SpecialFunctions where
  besselI := bessel_i
  besselJ := bessel_j
  besselK := bessel_k
  completedZeta := completedRiemannZeta
  besselI_eq _ _ := rfl
  besselJ_eq _ _ := rfl
  besselK_eq _ _ := rfl
  completedZeta_eq _ := rfl

example (B : SpecialFunctions) (s : ℂ) :
    B.completedZeta (1 - s) = B.completedZeta s := by
  simpa only [B.completedZeta_eq] using completedRiemannZeta_one_sub s

/-- The native residue already excludes the zero completed-zeta function. -/
theorem completedZeta_not_zero (B : SpecialFunctions) :
    ¬ ∀ s : ℂ, B.completedZeta s = 0 := by
  intro h
  have hz : (fun s : ℂ => (s - 1) * completedRiemannZeta s) = fun _ => (0 : ℂ) := by
    funext s
    rw [← B.completedZeta_eq s, h s, mul_zero]
  have ht : Tendsto (fun _ : ℂ => (0 : ℂ)) (𝓝[≠] (1 : ℂ)) (𝓝 (1 : ℂ)) := by
    simpa only [hz] using completedRiemannZeta_residue_one
  have h01 : (0 : ℂ) = 1 := tendsto_nhds_unique tendsto_const_nhds ht
  exact zero_ne_one h01

example (B : SpecialFunctions) : B.besselI 0 0 = 1 := by sorry

example (B : SpecialFunctions) (y : ℝ) (hy : 0 < y) :
    B.besselJ (1 / 2) y = (Real.sqrt (2 / (Real.pi * y)) * Real.sin y : ℝ) := by sorry

example (B : SpecialFunctions) (y : ℝ) (hy : 0 < y) :
    B.besselK (1 / 2) y = (Real.sqrt (Real.pi / (2 * y)) * Real.exp (-y) : ℝ) := by sorry
end SpecialFunctions

/-- Positive-base complex power used throughout the specializations. -/
def rpowC (x : ℝ) (s : ℂ) : ℂ := Complex.exp (s * Real.log x)
def phase (x : ℝ) : ℂ := Complex.exp (2 * Real.pi * Complex.I * x)

/-- The pinned regularized hypergeometric series defines M throughout its parameter
domain. A totalized divergent Euler integral cannot define its continuation. -/
def whittaker_m (mu nu : ℂ) (y : ℝ) : ℂ :=
  Complex.Gamma (1 + 2 * nu) * Complex.exp (-y / 2) * rpowC y (nu + 1 / 2) *
    Complex.regularizedHGFun {nu - mu + 1 / 2} {1 + 2 * nu} y

/-- Initial convergent Euler integral; its comparison with M retains both inequalities. -/
def whittakerMEuler (mu nu : ℂ) (y : ℝ) : ℂ :=
  rpowC y (nu + 1 / 2) * Complex.exp (y / 2) * Complex.Gamma (1 + 2 * nu) /
    (Complex.Gamma (nu + mu + 1 / 2) * Complex.Gamma (nu - mu + 1 / 2)) *
      ∫ t in (0 : ℝ)..1,
        rpowC t (nu + mu - 1 / 2) * rpowC (1 - t) (nu - mu - 1 / 2) * Complex.exp (-y * t)

def whittakerW (mu nu : ℂ) (y : ℝ) : ℂ :=
  rpowC y (nu + 1 / 2) * Complex.exp (y / 2) / Complex.Gamma (nu - mu + 1 / 2) *
    ∫ t in Set.Ioi (1 : ℝ),
      rpowC t (nu + mu - 1 / 2) * rpowC (t - 1) (nu - mu - 1 / 2) * Complex.exp (-y * t)
namespace whittaker_m
theorem eulerIntegral (mu nu : ℂ) (y : ℝ) (hy : 0 < y)
    (hp : 0 < (nu + mu + 1 / 2).re) (hm : 0 < (nu - mu + 1 / 2).re) :
    whittaker_m mu nu y = whittakerMEuler mu nu y := by sorry

/-- Ordinary ₁F₁ is Gamma times the pinned regularized series. -/
theorem hypergeometricSeries (mu s : ℂ) (hs : 0 < s.re)
    (y : ℝ) (hy : 0 < y) :
    whittaker_m mu (s - 1 / 2) y = Complex.exp (-y / 2) * rpowC y s *
      Complex.Gamma (2 * s) * Complex.regularizedHGFun {s - mu} {2 * s} y := by sorry

theorem decayingNormalization (mu nu : ℂ)
    (hp : 0 < (nu + mu + 1 / 2).re) (hm : 0 < (nu - mu + 1 / 2).re) :
    Tendsto (fun y : ℝ => whittakerW mu nu y /
      (rpowC y mu * Complex.exp (-y / 2))) atTop (𝓝 1) := by sorry

theorem test1 (y : ℝ) (hy : 0 < y) : whittaker_m 0 (1 / 2) y = (2 * Real.sinh (y / 2) : ℝ) := by sorry

-- Test: whittaker_m.test1
-- M_{0,1/2}(y)=2 sinh(y/2).
example (y : ℝ) (hy : 0 < y) : whittaker_m 0 (1 / 2) y = (2 * Real.sinh (y / 2) : ℝ) := by sorry


theorem test2 (y : ℝ) (hy : 0 < y) :
    whittaker_m 1 (1 / 2) y = y * Complex.exp (-y / 2) := by sorry

-- Test: whittaker_m.test2
-- At μ=1, ν=1/2 and y>0, M_{1,1/2}(y)=y e^(−y/2), so the growing-asymptotic coefficient vanishes.
-- At μ=ν+1/2, the general growing-asymptotic coefficient can vanish, so exceptional parameters require care.
example (y : ℝ) (hy : 0 < y) :
    whittaker_m 1 (1 / 2) y = y * Complex.exp (-y / 2) := by sorry


theorem test3 (t : ℝ) (ht : 0 < t) :
    whittaker_m 0 (1 / 2) (2 * t * Real.sin (Real.pi / 2)) = (2 * Real.sinh t : ℝ) := by sorry

-- Test: whittaker_m.test3
-- For t>0, M_{0,1/2}(2t sin(π/2))=2 sinh(t); replacing the argument by t sin(π/2) gives the wrong value.
-- The argument in Lemma 7 is 2 t sin θ, not t sin θ.
example (t : ℝ) (ht : 0 < t) :
    whittaker_m 0 (1 / 2) (2 * t * Real.sin (Real.pi / 2)) = (2 * Real.sinh t : ℝ) := by sorry

end whittaker_m

/-- The W integral at mu=0 needs Re(nu+1/2)>0 (DIT11 Appendix A, (A.2), p.977). Continuation to other orders requires a continued W carrier, not its divergent integral. -/
theorem whittaker_bessel_comparison (B : SpecialFunctions) (nu : ℂ) (y : ℝ) (hy : 0 < y)
    (hnu : 0 < (nu + 1 / 2).re) :
    B.besselI nu y = rpowC 2 (-2 * nu - 1 / 2) / Complex.Gamma (nu + 1) *
      rpowC y (-1 / 2) * whittaker_m 0 nu (2 * y) ∧
    B.besselK nu y = (Real.sqrt (Real.pi / (2 * y)) : ℂ) * whittakerW 0 nu (2 * y) := by sorry

theorem whittaker_asymptotics (mu nu : ℂ)
    (hp : 0 < (nu + mu + 1 / 2).re) (hm : 0 < (nu - mu + 1 / 2).re) :
    (∀ y : ℝ, 0 < y → deriv (deriv (whittaker_m mu nu)) y +
      (-1 / 4 + mu / y + (1 / 4 - nu ^ 2) / (y : ℂ) ^ 2) * whittaker_m mu nu y = 0) ∧
    (∀ y : ℝ, 0 < y → deriv (deriv (whittakerW mu nu)) y +
      (-1 / 4 + mu / y + (1 / 4 - nu ^ 2) / (y : ℂ) ^ 2) * whittakerW mu nu y = 0) ∧
    Tendsto (fun y : ℝ => whittaker_m mu nu y / rpowC y (nu + 1 / 2)) (𝓝[>] 0) (𝓝 1) ∧
    Tendsto (fun y : ℝ => whittaker_m mu nu y / (rpowC y (-mu) * Complex.exp (y / 2)))
      atTop (𝓝 (Complex.Gamma (1 + 2 * nu) / Complex.Gamma (nu - mu + 1 / 2))) := by sorry

theorem sine_power_integral (nu beta : ℂ) (hnu : 0 < nu.re) :
    (∫ theta in (0 : ℝ)..Real.pi,
      Complex.exp (Complex.I * beta * theta) * rpowC (Real.sin theta) (nu - 1)) =
      Real.pi * Complex.exp (Complex.I * Real.pi * beta / 2) * Complex.Gamma nu /
        (rpowC 2 (nu - 1) * Complex.Gamma ((nu + beta + 1) / 2) *
          Complex.Gamma ((nu - beta + 1) / 2)) := by sorry

def cycleWhittaker (eps : ℝ) (mu s : ℂ) (t : ℝ) : ℂ :=
  ∫ theta in (0 : ℝ)..Real.pi,
    Complex.exp (eps * Complex.I * (t * Real.cos theta + mu * theta)) *
      whittaker_m mu (s - 1 / 2) (2 * t * Real.sin theta) / Real.sin theta

def cycleConstant (eps : ℝ) (mu s : ℂ) : ℂ :=
  Complex.exp (eps * Complex.I * Real.pi * mu / 2) * rpowC (2 * Real.pi) (3 / 2) *
    rpowC 2 (-s) * Complex.Gamma (2 * s) /
      (Complex.Gamma ((s + 1 + mu) / 2) * Complex.Gamma ((s + 1 - mu) / 2))

theorem whittaker_cycle_integral (B : SpecialFunctions) (eps : ℝ) (heps : eps = 1 ∨ eps = -1)
    (mu s : ℂ) (hs : 0 < s.re) (t : ℝ) (ht : 0 < t) :
    cycleWhittaker eps mu s t = cycleConstant eps mu s * (Real.sqrt t : ℂ) *
      B.besselJ (s - 1 / 2) t := by sorry

theorem whittaker_integration_by_parts (eps : ℝ) (heps : eps = 1 ∨ eps = -1) (mu s : ℂ)
    (hs : 0 < s.re) (t : ℝ) (ht : 0 < t) :
    deriv (deriv (cycleWhittaker eps mu s)) t +
      (1 - s * (s - 1) / (t : ℂ) ^ 2) * cycleWhittaker eps mu s t = 0 := by sorry

/-- The rising factorial avoids a quotient of totalized Gamma at exceptional parameters. -/
def rising (a : ℂ) (n : ℕ) : ℂ := ∏ j ∈ Finset.range n, (a + j)
def cycleCoefficient (mu s : ℂ) (m n : ℕ) : ℂ :=
  2 * Real.pi * Complex.exp (Complex.I * Real.pi * mu / 2) * Complex.Gamma (2 * s) *
    (-1) ^ m * rising (s - mu) n * Complex.Gamma (s + n) /
      ((m.factorial : ℂ) * (n.factorial : ℂ) * Complex.Gamma (2 * s + n) *
        Complex.Gamma ((n + s + m + mu + 1) / 2) *
        Complex.Gamma ((n + s - m - mu + 1) / 2))

theorem whittaker_cycle_series (mu s : ℂ)
    (hs : 0 < s.re) (t : ℝ) (ht : 0 < t) :
    HasSum (fun ell : ℕ => ∑ m ∈ Finset.range (ell + 1),
      cycleCoefficient mu s m (ell - m) * rpowC t (s + ell))
      (cycleWhittaker 1 mu s t) := by sorry

theorem bessel_cycle_series (B : SpecialFunctions) (mu s : ℂ)
    (hs : 0 < s.re) (t : ℝ) (ht : 0 < t) :
    HasSum (fun r : ℕ =>
      Real.pi * Real.sqrt Real.pi * Complex.exp (Complex.I * Real.pi * mu / 2) *
        rpowC 2 (2 - 2 * s) * Complex.Gamma (2 * s) /
        (Complex.Gamma ((s + 1 + mu) / 2) * Complex.Gamma ((s + 1 - mu) / 2)) *
        (-1) ^ r * (2 : ℂ) ^ (-(2 * r : ℤ)) /
          ((r.factorial : ℂ) * Complex.Gamma (s + 1 / 2 + r)) * rpowC t (s + 2 * r))
      (cycleConstant 1 mu s * (Real.sqrt t : ℂ) * B.besselJ (s - 1 / 2) t) := by sorry

theorem cycle_series_leading_coefficients (mu s : ℂ) (hs : 0 < s.re) :
    cycleCoefficient mu s 0 0 = 2 * Real.pi * Complex.exp (Complex.I * Real.pi * mu / 2) *
      Complex.Gamma s / (Complex.Gamma ((s + 1 + mu) / 2) * Complex.Gamma ((s + 1 - mu) / 2)) ∧
      cycleCoefficient mu s 1 0 + cycleCoefficient mu s 0 1 = 0 := by sorry

/-- Imported countable arithmetic action model. -/
structure ModularGeometry where
  Index : Type
  countable : Countable Index
  orbit : Index → UpperHalfPlane → UpperHalfPlane
  derivative : Index → UpperHalfPlane → ℂ
attribute [instance] ModularGeometry.countable

/-- Eisenstein index Γ∞\PSL₂(ℤ), with coset representatives. -/
def fullModular : ModularGeometry := by sorry
/-- Eisenstein index Γ∞\Γ₀(N), with coset representatives. -/
def levelModular (N : ℕ) : ModularGeometry := by sorry

/-- Green index is the full effective group Γ₀(N)/{±I}, including translations. -/
def effectiveModularGroup (N : ℕ) : ModularGeometry := by sorry

/-- `fullModular` indexes `Γ∞\SL₂(ℤ)`: one representative for each coprime pair `±(c, d)`, acting
on `ℍ`, with derivative `(cz + d)⁻²`. -/
theorem fullModular_spec :
    ∃ e : fullModular.Index → Matrix.SpecialLinearGroup (Fin 2) ℤ,
      (∀ j z, fullModular.orbit j z = e j • z) ∧
      (∀ j z, fullModular.derivative j z = (((e j : Matrix (Fin 2) (Fin 2) ℤ) 1 0 : ℂ) * (z : ℂ) +
        ((e j : Matrix (Fin 2) (Fin 2) ℤ) 1 1 : ℂ)) ^ (-2 : ℤ)) ∧
      ∀ c d : ℤ, Int.gcd c d = 1 → ∃! j,
        ((e j : Matrix (Fin 2) (Fin 2) ℤ) 1 0 = c ∧ (e j : Matrix (Fin 2) (Fin 2) ℤ) 1 1 = d) ∨
          ((e j : Matrix (Fin 2) (Fin 2) ℤ) 1 0 = -c ∧ (e j : Matrix (Fin 2) (Fin 2) ℤ) 1 1 = -d) := by sorry

/-- `levelModular N` indexes `Γ∞\Γ₀(N)` in the same way. -/
theorem levelModular_spec (N : ℕ) :
    ∃ e : (levelModular N).Index → Matrix.SpecialLinearGroup (Fin 2) ℤ,
      (∀ j, e j ∈ CongruenceSubgroup.Gamma0 N) ∧
      (∀ j z, (levelModular N).orbit j z = e j • z) ∧
      ∀ c d : ℤ, Int.gcd c d = 1 → (N : ℤ) ∣ c → ∃! j,
        ((e j : Matrix (Fin 2) (Fin 2) ℤ) 1 0 = c ∧ (e j : Matrix (Fin 2) (Fin 2) ℤ) 1 1 = d) ∨
          ((e j : Matrix (Fin 2) (Fin 2) ℤ) 1 0 = -c ∧ (e j : Matrix (Fin 2) (Fin 2) ℤ) 1 1 = -d) := by sorry

/-- `effectiveModularGroup N` indexes `Γ₀(N)/{±1}`. -/
theorem effectiveModularGroup_spec (N : ℕ) :
    ∃ e : (effectiveModularGroup N).Index → Matrix.SpecialLinearGroup (Fin 2) ℤ,
      (∀ j, e j ∈ CongruenceSubgroup.Gamma0 N) ∧
      (∀ j z, (effectiveModularGroup N).orbit j z = e j • z) ∧
      ∀ g ∈ CongruenceSubgroup.Gamma0 N, ∃! j,
        (e j : Matrix (Fin 2) (Fin 2) ℤ) = g ∨
          (e j : Matrix (Fin 2) (Fin 2) ℤ) = -(g : Matrix (Fin 2) (Fin 2) ℤ) := by sorry


/-- Legendre Q with positive real base and Re(s)>0. -/
def legendreIntegrand (s : ℂ) (t u : ℝ) : ℂ :=
  rpowC (t + Real.sqrt (t ^ 2 - 1) * Real.cosh u) (-s)

def legendre_q (s : ℂ) (t : ℝ) : ℂ :=
  ∫ u in Set.Ioi (0 : ℝ), legendreIntegrand s t u
namespace legendre_q
def integral := legendre_q

theorem hypergeometric (s : ℂ) (hs : 0 < s.re)
    (t : ℝ) (ht : 1 < t) :
    legendre_q s t = Complex.Gamma s ^ 2 / (2 * Complex.Gamma (2 * s)) *
      rpowC (2 / (1 + t)) s * (Complex.Gamma (2 * s) *
        Complex.regularizedHGFun {s, s} {2 * s} (2 / (1 + t))) := by sorry

theorem integer_specialization (t : ℝ) (ht : 1 < t) :
    legendre_q 1 t = (1 / 2 * Real.log ((t + 1) / (t - 1)) : ℝ) ∧
      legendre_q 2 t = t * legendre_q 1 t - 1 := by sorry

theorem q_zero : legendre_q 1 3 = (1 / 2 * Real.log 2 : ℝ) := by sorry

-- Test: legendre_q.q_zero
-- At s=1, Q₀(3)=½log2.
example : legendre_q 1 3 = (1 / 2 * Real.log 2 : ℝ) := by sorry


theorem q_one : legendre_q 2 3 = (3 / 2 * Real.log 2 - 1 : ℝ) := by sorry

-- Test: legendre_q.q_one
-- At s=2, Q₁(3)=3/2 log2−1.
example : legendre_q 2 3 = (3 / 2 * Real.log 2 - 1 : ℝ) := by sorry


theorem boundary : ¬ IntegrableOn (legendreIntegrand 1 1) (Set.Ioi 0) := by sorry

-- Test: legendre_q.boundary
-- t=1 has a logarithmic singularity and is excluded from the ordinary pointwise definition.
example : ¬ IntegrableOn (legendreIntegrand 1 1) (Set.Ioi 0) := by sorry

end legendre_q

theorem legendre_q_asymptotics (s : ℝ) (hs : 1 < s) :
    (∃ C eps : ℝ, 0 < eps ∧ ∀ t : ℝ, 1 < t → t < 1 + eps →
      ‖legendre_q s t + (1 / 2 * Real.log (t - 1) : ℝ)‖ ≤ C) ∧
    ∃ C : ℝ, ∀ t : ℝ, 2 ≤ t → ‖legendre_q s t‖ ≤ C * t ^ (-s) := by sorry

/-- These curves stay in UHP for all real parameters. -/
def horizontalCurve (z : UpperHalfPlane) (t : ℝ) : UpperHalfPlane :=
  ⟨(z : ℂ) + t, by sorry⟩
def verticalLogCurve (z : UpperHalfPlane) (t : ℝ) : UpperHalfPlane :=
  ⟨(z.re : ℂ) + (z.im * Real.exp t : ℝ) * Complex.I, by sorry⟩
/-- y²∂x²+∂t²−∂t for t=log(y/y₀), hence y²(∂x²+∂y²). -/
def gzLaplacian (f : UpperHalfPlane → ℂ) (z : UpperHalfPlane) : ℂ :=
  (z.im ^ 2 : ℝ) * deriv (deriv (fun t : ℝ => f (horizontalCurve z t))) 0 +
    deriv (deriv (fun t : ℝ => f (verticalLogCurve z t))) 0 -
    deriv (fun t : ℝ => f (verticalLogCurve z t)) 0

def point_pair_invariant (s : ℂ) (z z' : UpperHalfPlane) : ℂ :=
  -2 * legendre_q s (1 + ‖(z : ℂ) - (z' : ℂ)‖ ^ 2 / (2 * z.im * z'.im))
namespace point_pair_invariant
/-- The PSL₂ action is imported from the existing upper-half-plane interface. -/
theorem invariant (s : ℂ) (g : Matrix.SpecialLinearGroup (Fin 2) ℝ) (z z' : UpperHalfPlane) :
    point_pair_invariant s (g • z) (g • z') = point_pair_invariant s z z' := by sorry

theorem s_one (z z' : UpperHalfPlane) (hne : z ≠ z') :
    point_pair_invariant 1 z z' = (Real.log (‖(z : ℂ) - (z' : ℂ)‖ ^ 2 /
      ‖star (z : ℂ) - (z' : ℂ)‖ ^ 2) : ℝ) := by sorry

theorem laplace (s : ℂ) (hs : 1 < s.re) (z z' : UpperHalfPlane) (hne : z ≠ z') :
    gzLaplacian (fun x => point_pair_invariant s x z') z = s * (s - 1) * point_pair_invariant s z z' := by sorry

theorem symmetry (s : ℂ) (z z' : UpperHalfPlane) : point_pair_invariant s z z' = point_pair_invariant s z' z := by sorry

-- Test: point_pair_invariant.symmetry
-- g_s(z,z′)=g_s(z′,z).
example (s : ℂ) (z z' : UpperHalfPlane) : point_pair_invariant s z z' = point_pair_invariant s z' z := by sorry


theorem singularity (s : ℂ) (hs : 1 < s.re) (z : UpperHalfPlane) :
    Tendsto (fun z' : UpperHalfPlane => ‖point_pair_invariant s z z'‖) (𝓝[≠] z) atTop := by sorry

-- Test: point_pair_invariant.singularity
-- The kernel is unbounded at the diagonal, so it is not a finite smooth kernel there.
example (s : ℂ) (hs : 1 < s.re) (z : UpperHalfPlane) :
    Tendsto (fun z' : UpperHalfPlane => ‖point_pair_invariant s z z'‖) (𝓝[≠] z) atTop := by sorry


theorem bare_sum (N : ℕ) (hN : 1 ≤ N) (z z' : UpperHalfPlane)
    (hOff : ∀ j : (effectiveModularGroup N).Index,
      z ≠ (effectiveModularGroup N).orbit j z') :
    ¬ Summable (fun j : (effectiveModularGroup N).Index =>
      point_pair_invariant 1 z ((effectiveModularGroup N).orbit j z')) := by sorry

-- Test: point_pair_invariant.bare_sum
-- The Γ₀(N) sum at s=1 diverges; subtract the pole before taking the finite part.
-- Full Γ₀(N)/±I lattice, off the diagonal; subtract the pole before taking the finite part.
example (N : ℕ) (hN : 1 ≤ N) (z z' : UpperHalfPlane)
    (hOff : ∀ j : (effectiveModularGroup N).Index,
      z ≠ (effectiveModularGroup N).orbit j z') :
    ¬ Summable (fun j : (effectiveModularGroup N).Index =>
      point_pair_invariant 1 z ((effectiveModularGroup N).orbit j z')) := by sorry

end point_pair_invariant

theorem legendre_q_near_one (s : ℝ) (hs : 1 < s) :
    Tendsto (fun t : ℝ => legendre_q s t - (1 / 2 * Real.log ((t + 1) / (t - 1)) : ℝ))
      (𝓝[>] 1) (𝓝 (-(deriv Complex.Gamma (s : ℂ) / Complex.Gamma s -
        deriv Complex.Gamma 1 / Complex.Gamma 1))) := by sorry

def archimedean_v_integral (k : ℕ) (s : ℂ) (t : ℝ) : ℂ :=
  ∫ x : ℝ, Complex.exp (-2 * Real.pi * Complex.I * x * t) /
    (((x : ℂ) + Complex.I) ^ (2 * k - 1) * rpowC (x ^ 2 + 1) s)
namespace archimedean_v_integral
def fourier_integral := archimedean_v_integral

theorem integrable_iff (k : ℕ) (hk : 1 ≤ k) (s : ℂ) :
    Integrable (fun x : ℝ => (((x : ℂ) + Complex.I) ^ (2 * k - 1) *
      rpowC (x ^ 2 + 1) s)⁻¹) ↔ 1 - (k : ℝ) < s.re := by sorry

theorem parameter_derivative (k : ℕ) (hk : 1 ≤ k) (s : ℂ)
    (hs : 1 - (k : ℝ) < s.re) (t : ℝ) :
    HasDerivAt (fun v => archimedean_v_integral k v t)
      (∫ x : ℝ, -Real.log (x ^ 2 + 1) * Complex.exp (-2 * Real.pi * Complex.I * x * t) /
        (((x : ℂ) + Complex.I) ^ (2 * k - 1) * rpowC (x ^ 2 + 1) s)) s := by sorry

theorem k_one (s : ℂ) : Integrable (fun x : ℝ =>
    (((x : ℂ) + Complex.I) * rpowC (x ^ 2 + 1) s)⁻¹) ↔ 0 < s.re := by sorry

-- Test: archimedean_v_integral.k_one
-- At k=1, the initial absolutely integrable domain is Re(s)>0.
example (s : ℂ) : Integrable (fun x : ℝ =>
    (((x : ℂ) + Complex.I) * rpowC (x ^ 2 + 1) s)⁻¹) ↔ 0 < s.re := by sorry


theorem threshold (k : ℕ) (hk : 1 ≤ k) : ¬ Integrable (fun x : ℝ =>
    (((x : ℂ) + Complex.I) ^ (2 * k - 1) * rpowC (x ^ 2 + 1) (1 - k))⁻¹) := by sorry

-- Test: archimedean_v_integral.threshold
-- At Re(s)=1−k the seed norm decays like |x|⁻¹ and is not integrable.
example (k : ℕ) (hk : 1 ≤ k) : ¬ Integrable (fun x : ℝ =>
    (((x : ℂ) + Complex.I) ^ (2 * k - 1) * rpowC (x ^ 2 + 1) (1 - k))⁻¹) := by sorry


theorem zero_frequency (k : ℕ) (hk : 1 ≤ k) (s : ℂ) (hs : 1 - (k : ℝ) < s.re) :
    archimedean_v_integral k s 0 = (-1) ^ k * Real.pi * Complex.I * rpowC 2 (-2 * s - 2 * k + 3) *
      Complex.Gamma (2 * s + 2 * k - 2) / (Complex.Gamma s * Complex.Gamma (s + 2 * k - 1)) := by sorry

-- Test: archimedean_v_integral.zero_frequency
-- t=0 equals the gamma formula of archimedean_v_at_zero.
example (k : ℕ) (hk : 1 ≤ k) (s : ℂ) (hs : 1 - (k : ℝ) < s.re) :
    archimedean_v_integral k s 0 = (-1) ^ k * Real.pi * Complex.I * rpowC 2 (-2 * s - 2 * k + 3) *
      Complex.Gamma (2 * s + 2 * k - 2) / (Complex.Gamma s * Complex.Gamma (s + 2 * k - 1)) := by sorry

end archimedean_v_integral

theorem archimedean_v_at_zero (k : ℕ) (hk : 1 ≤ k) (s : ℂ) (hs : 1 - (k : ℝ) < s.re) :
    archimedean_v_integral k s 0 = (-1) ^ k * Real.pi * Complex.I * rpowC 2 (-2 * s - 2 * k + 3) *
      Complex.Gamma (2 * s + 2 * k - 2) / (Complex.Gamma s * Complex.Gamma (s + 2 * k - 1)) := by sorry

/-- Entire continuation off t=0; it is distinct from the totalized initial integral. -/
def continuedV (k : ℕ) (s : ℂ) (t : ℝ) : ℂ := by sorry

theorem archimedean_v_holomorphic (k : ℕ) (hk : 1 ≤ k) :
    (∀ t : ℝ, t ≠ 0 → AnalyticOnNhd ℂ (fun s => continuedV k s t) Set.univ ∧
      ∀ s : ℂ, 1 - (k : ℝ) < s.re → continuedV k s t = archimedean_v_integral k s t) ∧
    ∀ S : Set ℂ, IsCompact S → ∃ N C T₀ : ℝ, ∀ s ∈ S, ∀ t : ℝ, T₀ ≤ |t| →
      ‖continuedV k s t‖ ≤ C * |t| ^ N * Real.exp (-2 * Real.pi * |t|) := by sorry

/-- The holomorphic extension of the normalized product, including removable values.
At Gamma poles the pointwise product of totalized Gamma and continuedV is incorrect. -/
def normalizedV (k : ℕ) (s : ℂ) (t : ℝ) : ℂ := by sorry

theorem normalizedV_eq (k : ℕ) (hk : 1 ≤ k) (s : ℂ) (t : ℝ) (ht : t ≠ 0)
    (hs : 0 < (s + 2 * k - 1).re) :
    normalizedV k s t = rpowC (Real.pi * |t|) (-s - 2 * k + 1) *
      Complex.Gamma (s + 2 * k - 1) * continuedV k s t := by sorry

theorem archimedean_v_functional_equation (k : ℕ) (hk : 1 ≤ k) (t : ℝ) (ht : t ≠ 0) :
    AnalyticOnNhd ℂ (fun s => normalizedV k s t) Set.univ ∧
      ∀ s : ℂ, normalizedV k s t = (SignType.sign t : ℝ) * normalizedV k (2 - 2 * k - s) t := by sorry

def polynomialV (k r : ℕ) (t : ℝ) : ℝ :=
  (t / 2) ^ (2 * k - 2 - 2 * r) * ∑ j ∈ Finset.range (r + 1),
    (r.choose j : ℝ) * (-t) ^ j / ((2 * k - 2 * r - 2 + j).factorial : ℝ)

theorem archimedean_v_integer_points (k r : ℕ) (hk : 1 ≤ k) (hr : r ≤ k - 1) (t : ℝ) (ht : t ≠ 0) :
    continuedV k (-(r : ℂ)) t = if t < 0 then 0 else
      2 * Real.pi * Complex.I * (-1) ^ (k - r) * polynomialV k r (4 * Real.pi * t) *
        Complex.exp (-2 * Real.pi * t) := by sorry

def auxiliaryQ (k : ℕ) (t : ℝ) : ℝ :=
  ∫ x in Set.Ioi (1 : ℝ), (x - 1) ^ k * x ^ (-(k : ℝ) - 1) * Real.exp (-x * t)

theorem archimedean_v_central_derivative (k : ℕ) (hk : 1 ≤ k) (t : ℝ) (ht : t < 0) :
    deriv (fun s => continuedV k s t) (1 - k) = -2 * Real.pi * Complex.I *
      auxiliaryQ (k - 1) (4 * Real.pi * |t|) * Complex.exp (-2 * Real.pi * t) := by sorry

theorem archimedean_v_bessel_k (B : SpecialFunctions) (s : ℂ) (t : ℝ) (ht : 0 < t) :
    normalizedV 1 s t = -2 * Complex.I / Real.sqrt t *
      (B.besselK (1 / 2 + s) (2 * Real.pi * t) + B.besselK (1 / 2 - s) (2 * Real.pi * t)) := by sorry

/-- Finite strip order in the full Schwartz topology: one exponent works for every
weighted derivative seminorm; the bounding constant may depend on the seminorm. -/
def SchwartzStripOrder {A : Type u} [NormedAddCommGroup A] [NormedSpace ℝ A]
    (Z : ℂ → SchwartzMap A ℂ) (d C : ℝ) : Prop :=
  ∀ d' : ℝ, d < d' → ∀ a b : ℝ, C < a → a ≤ b → ∀ k n : ℕ,
    ∃ M : ℝ, ∀ s : ℂ, a ≤ s.re → s.re ≤ b →
      Real.exp (-(‖s‖ ^ d')) * SchwartzMap.seminorm ℂ k n (Z s) ≤ M

/-- BPCZ A.0.11.1, pp.332–333. Differentiability here uses Mathlib's general
TVS calculus and the usual Fréchet topology of SchwartzMap, not a single norm. -/
theorem schwartz_family_continuation {A : Type u} [NormedAddCommGroup A]
    [NormedSpace ℝ A] [FiniteDimensional ℝ A]
    (C : ℝ) (hC : 0 < C) (Zp Zm : ℂ → SchwartzMap A ℂ)
    (hp : DifferentiableOn ℂ Zp {s | C < s.re})
    (hm : DifferentiableOn ℂ Zm {s | C < s.re})
    (hOrderp : ∃ d : ℝ, 0 < d ∧ SchwartzStripOrder Zp d C)
    (hOrderm : ∃ d : ℝ, 0 < d ∧ SchwartzStripOrder Zm d C)
    (scalarp scalarm : A → ℂ → ℂ)
    (hScalarp : ∀ x, AnalyticOnNhd ℂ (scalarp x) Set.univ)
    (hScalarm : ∀ x, AnalyticOnNhd ℂ (scalarm x) Set.univ)
    (hScalarOrderp : ∀ x, ∀ a : ℝ, FiniteStripOrder (scalarp x) a)
    (hScalarOrderm : ∀ x, ∀ a : ℝ, FiniteStripOrder (scalarm x) a)
    (hInitialp : ∀ s, C < s.re → ∀ x, Zp s x = scalarp x s)
    (hInitialm : ∀ s, C < s.re → ∀ x, Zm s x = scalarm x s)
    (hFE : ∀ s x, scalarp x s = scalarm x (-s)) :
    ∃ Yp Ym : ℂ → SchwartzMap A ℂ,
      DifferentiableOn ℂ Yp Set.univ ∧ DifferentiableOn ℂ Ym Set.univ ∧
      (∀ s x, Yp s x = scalarp x s ∧ Ym s x = scalarm x s) ∧
      (∀ s, C < s.re → Yp s = Zp s ∧ Ym s = Zm s) ∧
      (∀ s, Yp s = Ym (-s)) ∧
      (∀ a : ℝ, (∃ d : ℝ, 0 < d ∧ SchwartzStripOrder Yp d a) ∧
        (∃ d : ℝ, 0 < d ∧ SchwartzStripOrder Ym d a)) ∧
      (∀ Yp' Ym' : ℂ → SchwartzMap A ℂ,
        (∀ s x, Yp' s x = scalarp x s ∧ Ym' s x = scalarm x s) →
        Yp' = Yp ∧ Ym' = Ym) := by sorry

/-- BPCZ A.0.11.2, p.333, restricted to Banach spaces (one-stage LF spaces).
The conclusion constructs continuous functionals and asserts weak holomorphy and weak
finite order through evaluations. General LF carriers are not encoded by this specialization. -/
theorem lf_dual_continuation {E : Type u} [NormedAddCommGroup E] [NormedSpace ℂ E]
    [CompleteSpace E] (H : Submodule ℂ E) (hDense : Dense (H : Set E))
    (C d : ℝ) (hC : 0 < C) (hd : 0 < d) (Zp Zm : ℂ → E →L[ℂ] ℂ)
    (hp : ∀ w, AnalyticOnNhd ℂ (fun s => Zp s w) {s | C < s.re})
    (hm : ∀ w, AnalyticOnNhd ℂ (fun s => Zm s w) {s | C < s.re})
    (hOrderp : ∀ w, StripOrder (fun s => Zp s w) d C)
    (hOrderm : ∀ w, StripOrder (fun s => Zm s w) d C)
    (scalarp scalarm : H → ℂ → ℂ)
    (hScalarp : ∀ h, AnalyticOnNhd ℂ (scalarp h) Set.univ)
    (hScalarm : ∀ h, AnalyticOnNhd ℂ (scalarm h) Set.univ)
    (hScalarOrderp : ∀ h, ∀ a : ℝ, FiniteStripOrder (scalarp h) a)
    (hScalarOrderm : ∀ h, ∀ a : ℝ, FiniteStripOrder (scalarm h) a)
    (hInitialp : ∀ s, C < s.re → ∀ h : H, Zp s h = scalarp h s)
    (hInitialm : ∀ s, C < s.re → ∀ h : H, Zm s h = scalarm h s)
    (hFE : ∀ s h, scalarp h s = scalarm h (-s)) :
    ∃ Yp Ym : ℂ → E →L[ℂ] ℂ,
      (∀ w, AnalyticOnNhd ℂ (fun s => Yp s w) Set.univ ∧
        AnalyticOnNhd ℂ (fun s => Ym s w) Set.univ) ∧
      (∃ D : ℝ, 0 < D ∧ ∀ w, ∀ a : ℝ,
        StripOrder (fun s => Yp s w) D a ∧ StripOrder (fun s => Ym s w) D a) ∧
      (∀ s, C < s.re → Yp s = Zp s ∧ Ym s = Zm s) ∧
      (∀ s (h : H), Yp s h = scalarp h s ∧ Ym s h = scalarm h s) ∧
      (∀ s w, Yp s w = Ym (-s) w) ∧
      (∀ Yp' Ym' : ℂ → E →L[ℂ] ℂ,
        (∀ w, AnalyticOnNhd ℂ (fun s => Yp' s w) Set.univ ∧
          AnalyticOnNhd ℂ (fun s => Ym' s w) Set.univ) →
        (∀ s, C < s.re → Yp' s = Zp s ∧ Ym' s = Zm s) →
        Yp' = Yp ∧ Ym' = Ym) := by sorry
end TauCeti.AutomorphicSpectral

namespace TauCeti.AutomorphicSpectral
universe u v w
abbrev CycleCoordinates {r : ℕ} (l : Fin r → ℕ) := ∀ j, Fin (l j) → ℂˣ

def spectral_cycle_coordinates {r : ℕ} (l d : Fin r → ℕ) : Set (CycleCoordinates l) :=
  {z | (∀ j t, ‖(z j t : ℂ)‖ = 1) ∧ ∏ j, ∏ t, z j t ^ d j = 1}
namespace spectral_cycle_coordinates

def A {r : ℕ} (l d : Fin r → ℕ) : Set (Fin r → ℂˣ) :=
  {u | (∀ j, ‖(u j : ℂ)‖ = 1) ∧ ∏ j, u j ^ (l j * d j) = 1}
def B {r : ℕ} (l d : Fin r → ℕ) : Set (CycleCoordinates l) :=
  {z | (∀ j t, ‖(z j t : ℂ)‖ = 1) ∧ ∀ j, (∏ t, z j t) ^ d j = 1}
def B0 {r : ℕ} (l : Fin r → ℕ) : Set (CycleCoordinates l) :=
  {z | (∀ j t, ‖(z j t : ℂ)‖ = 1) ∧ ∀ j, ∏ t, z j t = 1}
def cycleTori {r : ℕ} (l d : Fin r → ℕ) := (spectral_cycle_coordinates l d, A l d, B l d, B0 l)

theorem componentProduct {r : ℕ} (l d : Fin r → ℕ)
    (hl : ∀ j, 0 < l j) (hd : ∀ j, 0 < d j) (u : Fin r → ℂˣ)
    (hu : ∀ j, u j ^ d j = 1) : ∃ z ∈ B l d, ∀ j, ∏ t, z j t = u j := by sorry

theorem embedCentral {r : ℕ} (l d : Fin r → ℕ) (u : Fin r → ℂˣ) :
    u ∈ A l d → (fun j (_ : Fin (l j)) => u j) ∈ spectral_cycle_coordinates l d := by sorry

theorem test1 (z : ℂˣ) (hz : ‖(z : ℂ)‖ = 1) :
    (fun (_ : Fin 1) (t : Fin 2) => if t = 0 then z else z⁻¹) ∈ B0 (fun _ => 2) := by sorry

-- Test: spectral_cycle_coordinates.test1
-- For one cycle l=2,d=1: A=μ₂, B=B0={(z,z⁻¹)}.
example (z : ℂˣ) (hz : ‖(z : ℂ)‖ = 1) :
    (fun (_ : Fin 1) (t : Fin 2) => if t = 0 then z else z⁻¹) ∈ B0 (fun _ => 2) := by sorry


theorem test2 : (fun (_ : Fin 1) (_ : Fin 1) => (-1 : ℂˣ)) ∈ B (fun _ => 1) (fun _ => 2) ∧
    (fun (_ : Fin 1) (_ : Fin 1) => (-1 : ℂˣ)) ∉ B0 (fun _ => 1) := by sorry

-- Test: spectral_cycle_coordinates.test2
-- For one cycle l=1,d=2: B=μ₂ while B0={1}; replacing B by its identity component loses two points.
example : (fun (_ : Fin 1) (_ : Fin 1) => (-1 : ℂˣ)) ∈ B (fun _ => 1) (fun _ => 2) ∧
    (fun (_ : Fin 1) (_ : Fin 1) => (-1 : ℂˣ)) ∉ B0 (fun _ => 1) := by sorry


theorem test3 {r : ℕ} (z : CycleCoordinates (fun _ : Fin r => 1)) :
    z ∈ B0 (fun _ => 1) ↔ ∀ j, z j 0 = 1 := by sorry

-- Test: spectral_cycle_coordinates.test3
-- For w=1, every l_j=1, A=T and B=∏_j μ_(d_j), with B0={1}.
example {r : ℕ} (z : CycleCoordinates (fun _ : Fin r => 1)) :
    z ∈ B0 (fun _ => 1) ↔ ∀ j, z j 0 = 1 := by sorry

end spectral_cycle_coordinates

def cycleDifference {r : ℕ} (l : Fin r → ℕ) (hl : ∀ j, 0 < l j)
    (z : CycleCoordinates l) : CycleCoordinates l :=
  fun j t => z j t / z j ⟨(t.val + l j - 1) % l j, by sorry⟩

theorem weyl_cycle_difference_map {r : ℕ} (l d : Fin r → ℕ) (hl : ∀ j, 0 < l j) (hd : ∀ j, 0 < d j) :
    (∀ v ∈ spectral_cycle_coordinates.B0 l, ∃ z ∈ spectral_cycle_coordinates.B l d, cycleDifference l hl z = v) ∧
      Nat.card {z : CycleCoordinates l // z ∈ spectral_cycle_coordinates.B l d ∧ cycleDifference l hl z = 1} =
        ∏ j, l j * d j := by sorry

theorem spectral_cover_fibres {r : ℕ} (l d : Fin r → ℕ) (hl : ∀ j, 0 < l j) (hd : ∀ j, 0 < d j) :
    (∀ v ∈ spectral_cycle_coordinates l d, ∃ a ∈ spectral_cycle_coordinates.A l d, ∃ c ∈ spectral_cycle_coordinates.B l d,
      (fun j t => a j * cycleDifference l hl c j t) = v) ∧
      Nat.card {p : (Fin r → ℂˣ) × CycleCoordinates l //
        p.1 ∈ spectral_cycle_coordinates.A l d ∧ p.2 ∈ spectral_cycle_coordinates.B l d ∧
          (fun j t => p.1 j * cycleDifference l hl p.2 j t) = 1} =
        (∏ j, l j) * (∏ j, l j * d j) := by sorry

section Transfer
variable {H : Type u} {K : Type v} [Group H] [Group K]
variable (p : H →* K) [Fintype p.ker] (hp : Function.Surjective p)
def compact_cover_transfer (f : H → ℂ) (y : K) : ℂ :=
  (Fintype.card p.ker : ℂ)⁻¹ * ∑ k : p.ker, f (Classical.choose (hp y) * k.val)
namespace compact_cover_transfer
def squareCover : Circle →* Circle where
  toFun z := z ^ 2
  map_one' := by sorry
  map_mul' := by sorry

instance squareCoverKernel : Fintype squareCover.ker := by sorry

theorem squareCoverSurjective : Function.Surjective squareCover := by sorry

theorem squareCover_kernel : Fintype.card squareCover.ker = 2 := by sorry


theorem transfer (f : H → ℂ) (x : H) :
    compact_cover_transfer p hp f (p x) = (Fintype.card p.ker : ℂ)⁻¹ * ∑ k : p.ker, f (x * k.val) := by sorry

theorem integralTransfer [MeasurableSpace H] [MeasurableSpace K]
    (μ : Measure H) (ν : Measure K) [IsProbabilityMeasure μ] [IsProbabilityMeasure ν]
    (hMap : MeasurePreserving p μ ν)
    (hHaar : ∀ k : p.ker, MeasurePreserving (fun x : H => x * k.val) μ μ)
    (f : H → ℂ) (hf : Integrable f μ) (hTr : Integrable (compact_cover_transfer p hp f) ν) :
    ∫ y, compact_cover_transfer p hp f y ∂ν = ∫ x, f x ∂μ := by sorry

theorem pullbackTransfer (g : K → ℂ) : compact_cover_transfer p hp (g ∘ p) = g := by sorry

theorem test1 (y : K) : compact_cover_transfer p hp (fun _ => 1) y = 1 := by sorry

-- Test: compact_cover_transfer.test1
-- Tr_id f=f and Tr_p 1=1 for every nonempty finite fibre.
example (y : K) : compact_cover_transfer p hp (fun _ => 1) y = 1 := by sorry


/-- Finite-fibre square-map computation, independent of any choice of square-root branch. -/
theorem test2 (y : Circle) :
    compact_cover_transfer squareCover squareCoverSurjective (fun z => (z : ℂ) ^ 2) y = (y : ℂ) ∧
      compact_cover_transfer squareCover squareCoverSurjective (fun z => (z : ℂ)) y = 0 := by sorry

-- Test: compact_cover_transfer.test2
-- For the circle square-cover, normalized transfer of z² is the target coordinate and transfer of z is zero.
example (y : Circle) :
    compact_cover_transfer squareCover squareCoverSurjective (fun z => (z : ℂ) ^ 2) y = (y : ℂ) ∧
      compact_cover_transfer squareCover squareCoverSurjective (fun z => (z : ℂ)) y = 0 := by sorry


theorem test3 (y : Circle) :
    (∑ k : squareCover.ker,
      (fun _ : Circle => (1 : ℂ)) (Classical.choose (squareCoverSurjective y) * k.val)) = 2 ∧
      compact_cover_transfer squareCover squareCoverSurjective (fun _ => 1) y = 1 := by sorry

-- Test: compact_cover_transfer.test3
-- For the same degree-two cover the normalized transfer of one is one, whereas the unnormalized kernel sum is two.
example (y : Circle) :
    (∑ k : squareCover.ker,
      (fun _ : Circle => (1 : ℂ)) (Classical.choose (squareCoverSurjective y) * k.val)) = 2 ∧
      compact_cover_transfer squareCover squareCoverSurjective (fun _ => 1) y = 1 := by sorry

end compact_cover_transfer

end Transfer

/-- The finite compact abelian specialization of Yu §5.2.3, pp.34–36.
The index is the entire complex character group; counting Haar is normalized to mass one.
The smooth torus and finite-component transport of the full statement are not part of this
finite specialization. -/
theorem character_inversion_fibre_average {H : Type u} {K : Type v} [CommGroup H] [CommGroup K]
    [Fintype H] [Fintype K] [MeasurableSpace H] [MeasurableSingletonClass H]
    (p : H →* K) [Fintype p.ker] (hp : Function.Surjective p)
    (μ : Measure H) [IsProbabilityMeasure μ]
    (hHaar : μ = (Fintype.card H : ℝ≥0∞)⁻¹ • Measure.count)
    (f : H → ℂ) (y : K) :
    HasSum (fun χ : AddChar (Additive K) ℂ =>
      ∫ x, χ (Additive.ofMul (p x / y)) * f x ∂μ) (compact_cover_transfer p hp f y) ∧
      Summable (fun χ : AddChar (Additive K) ℂ =>
        ‖∫ x, χ (Additive.ofMul (p x / y)) * f x ∂μ‖) := by sorry

/-- The numerical lattice estimate is a helper, not the smooth Fourier theorem. -/
theorem fourierDecaySummable {d : ℕ} (coeff : (Fin d → ℤ) → ℂ) (s : ℕ)
    (hs : d < 2 * s)
    (hBound : ∃ C : ℝ, ∀ k, ‖coeff k‖ ≤ C *
      (1 + 4 * Real.pi ^ 2 * ∑ i, (k i : ℝ) ^ 2) ^ (-(s : ℤ))) :
    Summable (fun k => ‖coeff k‖) := by sorry

/-- Smoothness is imposed on the periodic lift to the covering real vector space. -/
theorem torus_fourier_decay {d : ℕ} (f : UnitAddTorus (Fin d) → ℂ) (hf : Continuous f)
    (hSmooth : ContDiff ℝ ((⊤ : ℕ∞) : WithTop ℕ∞) (fun x : Fin d → ℝ => f (fun i => (x i : UnitAddCircle)))) :
    Summable (fun k => ‖UnitAddTorus.mFourierCoeff f k‖) ∧
      ∀ s : ℕ, d < 2 * s → ∃ C : ℝ, ∀ k : Fin d → ℤ,
        ‖UnitAddTorus.mFourierCoeff f k‖ ≤ C *
          (1 + 4 * Real.pi ^ 2 * ∑ i, (k i : ℝ) ^ 2) ^ (-(s : ℤ)) := by sorry
end TauCeti.AutomorphicSpectral

/-! ## AS.1 — Normalized induction and convergent Eisenstein families -/

namespace TauCeti.AutomorphicSpectral
universe u v w
structure InductionData (G : Type u) (ι : Type v) [Fintype ι] where
  space : HilbertModel.{u}
  evaluate : space.Carrier →ₗ[ℂ] (G → ℂ)
  height : G → Height ι
  rho : ι → ℝ

abbrev Pairing {ι : Type*} [Fintype ι] (lam : Parameter ι) (h : Height ι) : ℂ :=
  ∑ i, lam i * (h i : ℂ)

/-- Normalized induction on the inducing data: right translation weighted by `a^(λ+ρ)`,
unitary on the imaginary axis (`AF.1/normalized-real-parabolic-induction`, SR.2). -/
structure NormalizedInduction {G : Type u} [Group G] {ι : Type v} [Fintype ι]
    (D : InductionData G ι) where
  action : Parameter ι → G → Operator D.space.Carrier
  evaluate_injective : Function.Injective D.evaluate
  evaluate_action : ∀ (lam : Parameter ι) (g x : G) (v : D.space.Carrier),
    D.evaluate (action lam g v) x = D.evaluate v (x * g) *
      Complex.exp (Pairing (lam + fun i => (D.rho i : ℂ)) (D.height (x * g)) -
        Pairing (lam + fun i => (D.rho i : ℂ)) (D.height x))
  isometry_imag : ∀ lam : Parameter ι, (∀ i, (lam i).re = 0) → ∀ g v, ‖action lam g v‖ = ‖v‖

section Induction
variable {G : Type u} [Group G] {ι : Type v} [Fintype ι]
variable (D : InductionData G ι)
def induced_family (A : NormalizedInduction D) (lam : Parameter ι) (g : G) :
    Operator D.space.Carrier := A.action lam g
namespace induced_family
/-- Rank-one open-cell model of normalized induction. The Haar Jacobian of
x ↦ r x is compensated by δ^(1/2)=sqrt(r). -/
def rankOneDilation (r : ℝ) (hr : 0 < r) :
    Lp ℂ 2 (volume : Measure ℝ) →L[ℂ] Lp ℂ 2 (volume : Measure ℝ) := by sorry

theorem rankOneDilation_apply (r : ℝ) (hr : 0 < r) (f : Lp ℂ 2 (volume : Measure ℝ)) :
    ∀ᵐ x : ℝ ∂volume, rankOneDilation r hr f x = (Real.sqrt r : ℂ) * f (r * x) := by sorry

def rankOneAction (r : ℝ) (hr : 0 < r) (s : ℂ) :=
  Complex.exp (s * Real.log r) • rankOneDilation r hr

def unnormalizedDilation (r : ℝ) (hr : 0 < r) :=
  ((Real.sqrt r : ℂ)⁻¹) • rankOneDilation r hr

theorem action_comp (A : NormalizedInduction D) (lam : Parameter ι) (g h : G) :
    induced_family D A lam (g * h) =
      (induced_family D A lam g).comp (induced_family D A lam h) := by sorry

theorem unitary_axis (A : NormalizedInduction D) (lam : Parameter ι)
    (hlam : ∀ i, (lam i).re = 0) (g : G) :
    ∃ U : D.space.Carrier ≃ₗᵢ[ℂ] D.space.Carrier, ∀ v, U v = induced_family D A lam g v := by sorry

theorem flat_section (A : NormalizedInduction D) (g x : G) (v : D.space.Carrier) :
    AnalyticOnNhd ℂ (fun lam : Parameter ι => D.evaluate (induced_family D A lam g v) x)
      Set.univ := by sorry


/-- Whole-Levi specialization, with the imported discrete action supplied directly. -/
theorem whole_group (A : NormalizedInduction D) (g h : G) (v : D.space.Carrier) (hRho : D.rho = 0)
    (hHeight : ∀ x, D.height x = 0) :
    D.evaluate (induced_family D A 0 g v) h = D.evaluate v (h * g) := by sorry

-- Test: induced_family.whole_group
-- For P=G on G(𝔸)¹, ρ_P=H_P=0 and I_P is right translation on the discrete inducing space.
example (A : NormalizedInduction D) (g h : G) (v : D.space.Carrier) (hRho : D.rho = 0)
    (hHeight : ∀ x, D.height x = 0) :
    D.evaluate (induced_family D A 0 g v) h = D.evaluate v (h * g) := by sorry


theorem rank_one_half_modulus (r : ℝ) (hr : 0 < r) (s : ℂ)
    (f : Lp ℂ 2 (volume : Measure ℝ)) :
    (∀ᵐ x : ℝ ∂volume,
      rankOneAction r hr s f x = Complex.exp ((s + 1 / 2) * Real.log r) * f (r * x)) ∧
      (s.re = 0 → ‖rankOneAction r hr s f‖ = ‖f‖) := by sorry

-- Test: induced_family.rank_one_half_modulus
-- The GL₂ open-cell torus model acts by r^(s+1/2)f(rx), and preserves the L² norm for purely imaginary s.
example (r : ℝ) (hr : 0 < r) (s : ℂ)
    (f : Lp ℂ 2 (volume : Measure ℝ)) :
    (∀ᵐ x : ℝ ∂volume,
      rankOneAction r hr s f x = Complex.exp ((s + 1 / 2) * Real.log r) * f (r * x)) ∧
      (s.re = 0 → ‖rankOneAction r hr s f‖ = ‖f‖) := by sorry


theorem unnormalized_not_unitary (f : Lp ℂ 2 (volume : Measure ℝ)) (hf : f ≠ 0) :
    ‖unnormalizedDilation 4 (by norm_num) f‖ = ‖f‖ / 2 ∧
      ‖unnormalizedDilation 4 (by norm_num) f‖ ≠ ‖f‖ := by sorry

-- Test: induced_family.unnormalized_not_unitary
-- Dropping the half-modulus in the same dilation model, at r=4 a nonzero vector has half its original norm.
example (f : Lp ℂ 2 (volume : Measure ℝ)) (hf : f ≠ 0) :
    ‖unnormalizedDilation 4 (by norm_num) f‖ = ‖f‖ / 2 ∧
      ‖unnormalizedDilation 4 (by norm_num) f‖ ≠ ‖f‖ := by sorry

end induced_family

variable {J : Type w} [Countable J]
/-- Numerical weighted sum; the automorphic application supplies the full rational-coset section. -/
def eisenstein_series (representative : J → G) (lam : Parameter ι)
    (v : D.space.Carrier) (g : G) : ℂ :=
  ∑' j, D.evaluate v (representative j * g) *
    Complex.exp (Pairing (lam + fun i => (D.rho i : ℂ)) (D.height (representative j * g)))
namespace eisenstein_series
omit [Countable J] in
/-- Chamber convergence supplies these two native summability hypotheses. -/
theorem linear (r : J → G) (lam : Parameter ι) (u v : D.space.Carrier) (a b : ℂ) (g : G)
    (hu : Summable (fun j => D.evaluate u (r j * g) *
      Complex.exp (Pairing (lam + fun i => (D.rho i : ℂ)) (D.height (r j * g)))))
    (hv : Summable (fun j => D.evaluate v (r j * g) *
      Complex.exp (Pairing (lam + fun i => (D.rho i : ℂ)) (D.height (r j * g))))) :
    eisenstein_series D r lam (a • u + b • v) g =
      a * eisenstein_series D r lam u g + b * eisenstein_series D r lam v g := by
  unfold eisenstein_series
  simp_rw [map_add, map_smul, Pi.add_apply, Pi.smul_apply, smul_eq_mul,
    add_mul, mul_assoc]
  rw [(hu.mul_left a).tsum_add (hv.mul_left b), tsum_mul_left, tsum_mul_left]

omit [Countable J] in
/-- Rational-coset reindexing and representative covariance supply these equalities. -/
theorem automorphic (r : J → G) (lam : Parameter ι) (v : D.space.Carrier)
    (γ g : G) (e : J ≃ J)
    (hheight : ∀ j, D.height (r j * γ * g) = D.height (r (e j) * g))
    (heval : ∀ j, D.evaluate v (r j * γ * g) = D.evaluate v (r (e j) * g)) :
    eisenstein_series D r lam v (γ * g) = eisenstein_series D r lam v g := by
  unfold eisenstein_series
  simp_rw [← mul_assoc, hheight, heval]
  exact e.tsum_eq (fun j => D.evaluate v (r j * g) *
    Complex.exp (Pairing (lam + fun i => (D.rho i : ℂ)) (D.height (r j * g))))

omit [Countable J] in
/-- The normalized inducing action must supply weighted pointwise translation. -/
theorem right_equivariant (A : NormalizedInduction D) (r : J → G) (lam : Parameter ι)
    (v : D.space.Carrier) (g h : G)
    (htranslate : ∀ x,
      D.evaluate (induced_family D A lam h v) x *
        Complex.exp (Pairing (lam + fun i => (D.rho i : ℂ)) (D.height x)) =
      D.evaluate v (x * h) *
        Complex.exp (Pairing (lam + fun i => (D.rho i : ℂ)) (D.height (x * h)))) :
    eisenstein_series D r lam (induced_family D A lam h v) g =
      eisenstein_series D r lam v (g * h) := by
  unfold eisenstein_series
  apply tsum_congr
  intro j
  simpa only [mul_assoc] using htranslate (r j * g)

theorem whole_group (v : D.space.Carrier) (g : G) (hρ : D.rho = 0)
    (hH : D.height = 0) :
    eisenstein_series D (fun _ : Unit => (1 : G)) 0 v g = D.evaluate v g := by sorry

-- Test: eisenstein_series.whole_group
-- For P=G, E_G(g,φ,0)=φ(g).
example (v : D.space.Carrier) (g : G) (hρ : D.rho = 0)
    (hH : D.height = 0) :
    eisenstein_series D (fun _ : Unit => (1 : G)) 0 v g = D.evaluate v g := by sorry


theorem zero (r : J → G) (lam : Parameter ι) (g : G) : eisenstein_series D r lam 0 g = 0 := by sorry

-- Test: eisenstein_series.zero
-- E(g,0,λ)=0.
example (r : J → G) (lam : Parameter ι) (g : G) : eisenstein_series D r lam 0 g = 0 := by sorry

/-- The list containing only the identity of the integer group is incomplete.
Its weighted sum need not be invariant under translation. -/
private def integerSlice : InductionData (Multiplicative ℤ) Unit where
  space := ⟨ℂ, inferInstance, inferInstance, inferInstance⟩
  evaluate :=
    { toFun := fun v g => ((Multiplicative.toAdd g : ℤ) : ℂ) * v
      map_add' := by intros; ext; simp [mul_add]
      map_smul' := by intros; ext; simp [mul_left_comm] }
  height := fun _ _ => 0
  rho := fun _ => 0

@[simp] private theorem integerSlice_evaluate (v : ℂ) (g : Multiplicative ℤ) :
    integerSlice.evaluate v g = ((Multiplicative.toAdd g : ℤ) : ℂ) * v := rfl

/-- An incomplete one-element representative list changes value under translation. -/
example :
    eisenstein_series integerSlice (fun _ : Unit => 1) 0 (1 : ℂ)
      (Multiplicative.ofAdd (1 : ℤ) * 1) = 1 ∧
    eisenstein_series integerSlice (fun _ : Unit => 1) 0 (1 : ℂ) 1 = 0 := by
  simp [eisenstein_series, Pairing, show integerSlice.height = 0 from rfl,
    show integerSlice.rho = 0 from rfl]

private def paritySlice : InductionData (Multiplicative (ZMod 2)) Unit where
  space := ⟨ℂ, inferInstance, inferInstance, inferInstance⟩
  evaluate :=
    { toFun := fun v g => if Multiplicative.toAdd g = 0 then v else 0
      map_add' := by intros; ext g; split_ifs <;> simp_all
      map_smul' := by intros; ext g; split_ifs <;> simp_all }
  height := fun _ _ => 0
  rho := fun _ => 0

@[simp] private theorem paritySlice_evaluate (v : ℂ) (g : Multiplicative (ZMod 2)) :
    paritySlice.evaluate v g = (if Multiplicative.toAdd g = 0 then v else 0) := rfl

/-- The full two-element orbit has value v both before and after translation. -/
example (v : ℂ) :
    eisenstein_series paritySlice (fun j : Fin 2 => Multiplicative.ofAdd (j.val : ZMod 2))
      0 v (Multiplicative.ofAdd (1 : ZMod 2)) = v ∧
    eisenstein_series paritySlice (fun j : Fin 2 => Multiplicative.ofAdd (j.val : ZMod 2))
      0 v 1 = v := by
  norm_num [eisenstein_series, Pairing, show paritySlice.height = 0 from rfl,
    show paritySlice.rho = 0 from rfl, tsum_fintype, Fin.sum_univ_two, show (2 : ZMod 2) = 0 from rfl]
  all_goals simp only [show (2 : ZMod 2) = 0 from rfl, not_true_eq_false, false_implies]

example (v : ℂ) :
    eisenstein_series paritySlice (fun j : Fin 2 => Multiplicative.ofAdd (j.val : ZMod 2))
      0 v (Multiplicative.ofAdd (1 : ZMod 2) * 1) =
    eisenstein_series paritySlice (fun j : Fin 2 => Multiplicative.ofAdd (j.val : ZMod 2))
      0 v 1 := by
  apply automorphic paritySlice _ 0 v _ 1 (Equiv.swap 0 1)
  · intro j
    rfl
  · intro j
    fin_cases j <;> norm_num [Equiv.swap_apply_def, show (2 : ZMod 2) = 0 from rfl]
    all_goals simp only [show (2 : ZMod 2) = 0 from rfl, not_true_eq_false, false_implies]

end eisenstein_series

end Induction

/-- Convergent operator integral, restricted to supplied complete normed compact pictures. -/
def convergent_intertwiner {U E F : Type*} [MeasurableSpace U]
    [NormedAddCommGroup E] [NormedSpace ℂ E]
    [NormedAddCommGroup F] [NormedSpace ℂ F] [CompleteSpace F]
    (μ : Measure U) (kernel : U → E →L[ℂ] F) : E →L[ℂ] F :=
  ∫ u, kernel u ∂μ

namespace convergent_intertwiner

def completedXi (s : ℂ) : ℂ :=
  rpowC Real.pi (-s / 2) * Complex.Gamma (s / 2) * riemannZeta s

/-- Real spherical integral times the unramified finite-prime Euler product. The integral is convergent when Re(s)>1; that stronger chamber also converges the
zeta factors. -/
def sphericalKernel (s : ℂ) (u : ℝ) : ℂ →L[ℂ] ℂ :=
  (riemannZeta (2 * s - 1) / riemannZeta (2 * s) *
    rpowC (1 + u ^ 2) (-s)) • ContinuousLinearMap.id ℂ ℂ

def permuteBlocks {n : ℕ} (w : Equiv.Perm (Fin n)) :
    (Fin n → ℂ) →L[ℂ] (Fin n → ℂ) :=
  (ContinuousLinearEquiv.piCongrLeft ℂ (fun _ : Fin n => ℂ) w).toContinuousLinearMap

theorem permuteBlocks_apply {n : ℕ} (w : Equiv.Perm (Fin n))
    (v : Fin n → ℂ) (i : Fin n) : permuteBlocks w v i = v (w.symm i) := by
  change (Equiv.piCongrLeft (fun _ : Fin n => ℂ) w) v i = _
  simp only [Equiv.piCongrLeft_apply_eq_cast, cast_eq]

/-- The tuple is (inducing labels, spectral parameter). Both are transported,
so this slice cannot replace the target picture by an unrelated endomorphism. -/
def transportDatum {n : ℕ} (w : Equiv.Perm (Fin n))
    (datum parameter : Fin n → ℂ) : (Fin n → ℂ) × (Fin n → ℂ) :=
  (datum ∘ w.symm, parameter ∘ w.symm)

theorem identity_quotient (v : ℂ) :
    convergent_intertwiner (Measure.dirac ())
      (fun _ : Unit => ContinuousLinearMap.id ℂ ℂ) v = v := by
  simp [convergent_intertwiner]

-- Test: convergent_intertwiner.identity_quotient
-- The actual point-quotient integral returns the original vector.
example (v : ℂ) :
    convergent_intertwiner (Measure.dirac ())
      (fun _ : Unit => ContinuousLinearMap.id ℂ ℂ) v = v := by
  simp [convergent_intertwiner]

theorem sl2_spherical (s : ℂ) (hs : 1 < s.re) :
    Integrable (sphericalKernel s) (volume : Measure ℝ) ∧
      convergent_intertwiner volume (sphericalKernel s) (1 : ℂ) =
        completedXi (2 * s - 1) / completedXi (2 * s) := by sorry

-- Test: convergent_intertwiner.sl2_spherical
-- The convergent real spherical integral times its finite-prime Euler product gives ξ(2s−1)/ξ(2s) on the spherical eigenline.
example (s : ℂ) (hs : 1 < s.re) :
    Integrable (sphericalKernel s) (volume : Measure ℝ) ∧
      convergent_intertwiner volume (sphericalKernel s) (1 : ℂ) =
        completedXi (2 * s - 1) / completedXi (2 * s) := by sorry

theorem target_parabolic {n : ℕ} (w : Equiv.Perm (Fin n))
    (datum parameter v : Fin n → ℂ) (i : Fin n) :
    transportDatum w datum parameter = (datum ∘ w.symm, parameter ∘ w.symm) ∧
      convergent_intertwiner (Measure.dirac ())
        (fun _ : Unit => permuteBlocks w) v i = v (w.symm i) := by
  constructor
  · rfl
  · simp [convergent_intertwiner, permuteBlocks_apply]

-- Test: convergent_intertwiner.target_parabolic
-- The block-permutation slice transports both inducing labels and parameter, and its operator integral applies the same permutation to the section coordinates; full GL_n induction coherence is required.
example {n : ℕ} (w : Equiv.Perm (Fin n))
    (datum parameter v : Fin n → ℂ) (i : Fin n) :
    transportDatum w datum parameter = (datum ∘ w.symm, parameter ∘ w.symm) ∧
      convergent_intertwiner (Measure.dirac ())
        (fun _ : Unit => permuteBlocks w) v i = v (w.symm i) := by
  constructor
  · rfl
  · simp [convergent_intertwiner, permuteBlocks_apply]
end convergent_intertwiner

section PseudoEisenstein
variable {V : Type u} [NormedAddCommGroup V] [NormedSpace ℂ V] [CompleteSpace V]
def Laplace (h : ℝ → V) (s : ℂ) : V := ∫ x : ℝ, Complex.exp (-s * x) • h x

def IsPaleyWienerSection (Ψ : ℂ → V) : Prop :=
  ∃ h : ℝ → V, ContDiff ℝ ((⊤ : ℕ∞) : WithTop ℕ∞) h ∧ HasCompactSupport h ∧ Ψ = Laplace h

def pseudo_eisenstein (E : ℂ → V →L[ℂ] ℂ) (h : ℝ → V) (Λ : ℝ) : ℂ :=
  (1 / (2 * Real.pi) : ℂ) *
    ∫ t : ℝ, E (Λ + t * Complex.I) (Laplace h (Λ + t * Complex.I))

def torusEisenstein (x : ℝ) (s : ℂ) : ℂ →L[ℂ] ℂ :=
  Complex.exp (s * x) • ContinuousLinearMap.id ℂ ℂ

namespace pseudo_eisenstein
variable (E : ℂ → V →L[ℂ] ℂ)
theorem contour_independent (h : ℝ → ℂ) (hh : ContDiff ℝ ((⊤ : ℕ∞) : WithTop ℕ∞) h)
    (hc : HasCompactSupport h) (x Λ Λ' : ℝ) :
    pseudo_eisenstein (torusEisenstein x) h Λ =
      pseudo_eisenstein (torusEisenstein x) h Λ' := by sorry

theorem linear (h k : ℝ → V) (hh : ContDiff ℝ ((⊤ : ℕ∞) : WithTop ℕ∞) h) (hk : ContDiff ℝ ((⊤ : ℕ∞) : WithTop ℕ∞) k)
    (hc : HasCompactSupport h) (kc : HasCompactSupport k) (a b : ℂ) (Λ : ℝ)
    (h₁ : Integrable (fun t : ℝ => E (Λ + t * Complex.I) (Laplace h (Λ + t * Complex.I))))
    (h₂ : Integrable (fun t : ℝ => E (Λ + t * Complex.I) (Laplace k (Λ + t * Complex.I)))) :
    pseudo_eisenstein E (fun x => a • h x + b • k x) Λ =
      a * pseudo_eisenstein E h Λ + b * pseudo_eisenstein E k Λ := by sorry


theorem zero (Λ : ℝ) : pseudo_eisenstein E (fun _ : ℝ => (0 : V)) Λ = 0 := by sorry
-- Test: pseudo_eisenstein.zero
-- The zero Paley–Wiener section gives zero.
example (Λ : ℝ) : pseudo_eisenstein E (fun _ : ℝ => (0 : V)) Λ = 0 := by sorry

theorem split_torus (h : ℝ → ℂ) (hh : ContDiff ℝ ((⊤ : ℕ∞) : WithTop ℕ∞) h)
    (hc : HasCompactSupport h) (x Λ : ℝ) :
    pseudo_eisenstein (torusEisenstein x) h Λ = h x := by sorry
-- Test: pseudo_eisenstein.split_torus
-- For a split torus in the full-height variant, P=G and Eψ is ordinary inverse Fourier–Laplace transformation on 𝔞_G; in the fixed-central-character version 𝔞_P^G=0, so this height transform is absent.
-- Actual full-height torus specialization, with the dual measure in its definition.
example (h : ℝ → ℂ) (hh : ContDiff ℝ ((⊤ : ℕ∞) : WithTop ℕ∞) h) (hc : HasCompactSupport h) (x Λ : ℝ) :
    pseudo_eisenstein (torusEisenstein x) h Λ = h x := by sorry

theorem wrong_entire_growth :
    ¬ IsPaleyWienerSection (fun z : ℂ => Complex.exp (z ^ 4)) := by sorry
-- Test: pseudo_eisenstein.wrong_entire_growth
-- For V=ℂ, Ψ(z)=exp(z⁴) is entire but not Paley–Wiener and does not qualify for this construction. More generally exp(z⁴)v is excluded only when v≠0.
-- The entire function is excluded from the actual compact-support transform domain.
example : ¬ IsPaleyWienerSection (fun z : ℂ => Complex.exp (z ^ 4)) := by sorry
end pseudo_eisenstein

end PseudoEisenstein

section CuspidalBlocks
variable {H : Type u} [NormedAddCommGroup H] [InnerProductSpace ℂ H] [CompleteSpace H]
def cuspidal_datum_space (generators : Set H) : Submodule ℂ H :=
  (Submodule.span ℂ generators).topologicalClosure
namespace cuspidal_datum_space
/-- Quotient model detecting equality of actual generated blocks. -/
def blockSetoid : Setoid (Set H) := Setoid.ker (cuspidal_datum_space (H := H))

theorem generator_mem (S : Set H) (x : H) (hx : x ∈ S) : x ∈ cuspidal_datum_space S := by sorry

theorem right_invariant (S : Set H) (R : H →L[ℂ] H) (hR : R '' S ⊆ S) :
    ∀ x ∈ cuspidal_datum_space S, R x ∈ cuspidal_datum_space S := by sorry


/-- For P=G its generators are precisely the supplied cuspidal isotypic space. -/
theorem whole_group_cusp (C : Submodule ℂ H) (hClosed : IsClosed (C : Set H)) :
    cuspidal_datum_space (C : Set H) = C := by sorry

-- Test: cuspidal_datum_space.whole_group_cusp
-- For χ represented by (G,σ), L²_χ is the σ-isotypic cuspidal summand.
example (C : Submodule ℂ H) (hClosed : IsClosed (C : Set H)) :
    cuspidal_datum_space (C : Set H) = C := by sorry


theorem inequivalent_same_levi (C D : Submodule ℂ H)
    (hC : IsClosed (C : Set H)) (hD : IsClosed (D : Set H)) (hCD : C ≠ D) :
    cuspidal_datum_space (C : Set H) ≠ cuspidal_datum_space (D : Set H) ∧
      Quotient.mk (blockSetoid (H := H)) (C : Set H) ≠
        Quotient.mk (blockSetoid (H := H)) (D : Set H) := by sorry

-- Test: cuspidal_datum_space.inequivalent_same_levi
-- Distinct closed generated blocks remain distinct in the quotient by equality of cuspidal_datum_space; identifying this block relation with AF Weyl-associate cuspidal data is required.
example (C D : Submodule ℂ H)
    (hC : IsClosed (C : Set H)) (hD : IsClosed (D : Set H)) (hCD : C ≠ D) :
    cuspidal_datum_space (C : Set H) ≠ cuspidal_datum_space (D : Set H) ∧
      Quotient.mk (blockSetoid (H := H)) (C : Set H) ≠
        Quotient.mk (blockSetoid (H := H)) (D : Set H) := by sorry


theorem zero_generators : cuspidal_datum_space ({0} : Set H) = ⊥ := by sorry

-- Test: cuspidal_datum_space.zero_generators
-- The closed span of the zero generator set is the zero subspace.
example : cuspidal_datum_space ({0} : Set H) = ⊥ := by sorry

end cuspidal_datum_space

/-- Hilbert-space assembly after orthogonality and density have been established.
Mathlib's `IsHilbertSum.mkInternal` supplies the Hilbert sum; no new generic
Hilbert-sum theory is planned here. For Arthur §12 Lemma 12.4, (12.4), pp.64–66,
the missing automorphic input is the genuine AF cuspidal associate-class carrier,
with its pseudo-Eisenstein generators and common quotient measures. Unfolding
and Fourier inversion must prove `hOrth` and `hDense` for that system.
This conditional assembly does not assert these facts for arbitrary generators. -/
theorem cuspidal_data_orthosum {Χ : Type v} (S : Χ → Set H)
    (hOrth : OrthogonalFamily ℂ (fun χ => cuspidal_datum_space (S χ))
      (fun χ => (cuspidal_datum_space (S χ)).subtypeₗᵢ))
    (hDense : Dense (↑(Submodule.span ℂ (⋃ χ, S χ)) : Set H)) :
    IsHilbertSum ℂ (fun χ => cuspidal_datum_space (S χ))
      (fun χ => (cuspidal_datum_space (S χ)).subtypeₗᵢ) := by
  have hSpan : Submodule.span ℂ (⋃ χ, S χ) ≤ ⨆ χ, cuspidal_datum_space (S χ) := by
    refine Submodule.span_le.mpr ?_
    intro x hx
    obtain ⟨χ, hx⟩ := Set.mem_iUnion.mp hx
    exact Submodule.mem_iSup_of_mem χ
      ((Submodule.le_topologicalClosure _) (Submodule.subset_span hx))
  have hTotal : ⊤ ≤ (⨆ χ, cuspidal_datum_space (S χ)).topologicalClosure := by
    rw [← Submodule.dense_iff_topologicalClosure_eq_top.mp hDense]
    exact Submodule.topologicalClosure_mono hSpan
  let : ∀ χ, CompleteSpace (cuspidal_datum_space (S χ)) := fun χ =>
    (Submodule.isClosed_topologicalClosure (Submodule.span ℂ (S χ))).completeSpace_coe
  exact IsHilbertSum.mkInternal _ hOrth hTotal

namespace cuspidal_data_orthosum
variable {Χ : Type v} (S : Χ → Set H)
variable (hOrth : OrthogonalFamily ℂ (fun χ => cuspidal_datum_space (S χ))
  (fun χ => (cuspidal_datum_space (S χ)).subtypeₗᵢ))
variable (hDense : Dense (↑(Submodule.span ℂ (⋃ χ, S χ)) : Set H))

/-- The native unitary decomposition, after the two automorphic inputs are established. -/
def toHilbertSumEquiv : H ≃ₗᵢ[ℂ] lp (fun χ => cuspidal_datum_space (S χ)) 2 :=
  (cuspidal_data_orthosum S hOrth hDense).linearIsometryEquiv

theorem inverse_single [DecidableEq Χ] (χ : Χ) (v : cuspidal_datum_space (S χ)) :
    (toHilbertSumEquiv S hOrth hDense).symm (lp.single 2 χ v) = (v : H) :=
  (cuspidal_data_orthosum S hOrth hDense).linearIsometryEquiv_symm_apply_single v

theorem inverse_hasSum (v : lp (fun χ => cuspidal_datum_space (S χ)) 2) :
    HasSum (fun χ => (v χ : H)) ((toHilbertSumEquiv S hOrth hDense).symm v) :=
  (cuspidal_data_orthosum S hOrth hDense).hasSum_linearIsometryEquiv_symm v

-- A nonzero repeated block is not an orthogonal family.
example : ¬ OrthogonalFamily ℂ (fun _ : Bool => ℂ)
    (fun _ => (LinearIsometry.id : ℂ →ₗᵢ[ℂ] ℂ)) := by
  intro h
  have hOne := h (by decide : true ≠ false) (1 : ℂ) (1 : ℂ)
  norm_num at hOne

-- Zero generators are not total, even when the index set contains a class.
example : ¬ Dense (↑(Submodule.span ℂ (⋃ _ : Unit, ({0} : Set ℂ))) : Set ℂ) := by
  intro hd
  have hm : (1 : ℂ) ∈ closure ({0} : Set ℂ) := by
    simpa using hd (1 : ℂ)
  simp at hm

-- A single full block reconstructs the ambient space.
example : IsHilbertSum ℂ (fun _ : Unit => cuspidal_datum_space (Set.univ : Set ℂ))
    (fun _ => (cuspidal_datum_space (Set.univ : Set ℂ)).subtypeₗᵢ) := by
  apply cuspidal_data_orthosum (fun _ : Unit => (Set.univ : Set ℂ))
  · intro i j hij
    exact False.elim (hij (Subsingleton.elim i j))
  · intro x
    apply subset_closure
    apply Submodule.subset_span
    exact Set.mem_iUnion.mpr ⟨(), Set.mem_univ x⟩
end cuspidal_data_orthosum
end CuspidalBlocks

/- Yu's multiplicative parameter spaces retain their finite components. -/
def unramified_character_torus {r : Type*} [Fintype r] (n : r → ℕ) : Set (r → ℂˣ) :=
  {x | ∏ i, x i ^ n i = 1}
namespace unramified_character_torus
/-- Degree coordinates; the adelic determinant-degree isomorphism is supplied by AA. -/
def detCoordinates (r : Type*) := r → ℂˣ

def trivialOnCenter {r : Type*} [Fintype r] (n : r → ℕ) := unramified_character_torus n

def unitaryPart {r : Type*} [Fintype r] (n : r → ℕ) : Set (r → ℂˣ) :=
  {x ∈ unramified_character_torus n | ∀ i, ‖(x i : ℂ)‖ = 1}

theorem test1 (n : ℕ) (z : ℂˣ) : (fun _ : Unit => z) ∈ unramified_character_torus (fun _ => n) ↔ z ^ n = 1 := by sorry

-- Test: unramified_character_torus.test1
-- For M=G=GL_n, X_G^G={z∈C*:z^n=1}.
example (n : ℕ) (z : ℂˣ) : (fun _ : Unit => z) ∈ unramified_character_torus (fun _ => n) ↔ z ^ n = 1 := by sorry


theorem test2 : (fun _ : Unit => (-1 : ℂˣ)) ∈ unramified_character_torus (fun _ => 2) ∧
    (fun _ : Unit => (-1 : ℂˣ)) ≠ (fun _ : Unit => (1 : ℂˣ)) := by sorry

-- Test: unramified_character_torus.test2
-- For M=GL₂ and L=M, Im X_M^L=μ₂ has two points and is not connected.
example : (fun _ : Unit => (-1 : ℂˣ)) ∈ unramified_character_torus (fun _ => 2) ∧
    (fun _ : Unit => (-1 : ℂˣ)) ≠ (fun _ : Unit => (1 : ℂˣ)) := by sorry


theorem test3 (a b : ℕ) (x y : ℂˣ) :
    (fun i : Fin 2 => if i = 0 then x else y) ∈ unramified_character_torus (fun i => if i = 0 then a else b) ↔
      x ^ a * y ^ b = 1 := by sorry

-- Test: unramified_character_torus.test3
-- For M=GL_a×GL_b in G=GL_(a+b), X_M^G is given by x^a y^b=1, rather than xy=1 unless a=b=1.
example (a b : ℕ) (x y : ℂˣ) :
    (fun i : Fin 2 => if i = 0 then x else y) ∈ unramified_character_torus (fun i => if i = 0 then a else b) ↔
      x ^ a * y ^ b = 1 := by sorry

end unramified_character_torus

/-- Spherical sections in a prescribed convention; the Iwasawa map is supplied by AA. -/
def induced_spherical_section {G M : Type*} (levi : G → M) (s : M → ℂˣ) (φ : M → ℂ) : G → ℂ :=
  fun g => (s (levi g) : ℂ) * φ (levi g)
namespace induced_spherical_section
def sphericalSection {G M : Type*} (levi : G → M) (s : M → ℂˣ) (φ : M → ℂ) := induced_spherical_section levi s φ

theorem leviRestriction {M : Type*} (s : M → ℂˣ) (φ : M → ℂ) (m : M) :
    (s m : ℂ)⁻¹ * induced_spherical_section id s φ m = φ m := by sorry

def parameterTwist {M : Type*} (s lam : M → ℂˣ) : M → ℂˣ := fun m => s m * lam m

theorem test1 {M : Type*} (s : M → ℂˣ) (φ : M → ℂ) (m : M) :
    (s m : ℂ)⁻¹ * induced_spherical_section id s φ m = φ m := by sorry

-- Test: induced_spherical_section.test1
-- For prescribed s_R, the Levi restriction of s_R*phi_pi multiplied by s_R⁻¹ equals phi_pi.
example {M : Type*} (s : M → ℂˣ) (φ : M → ℂ) (m : M) :
    (s m : ℂ)⁻¹ * induced_spherical_section id s φ m = φ m := by sorry


theorem test2 {M : Type*} (φ : M → ℂ) : induced_spherical_section id (fun _ => 1) φ = φ := by sorry

-- Test: induced_spherical_section.test2
-- For R=G the modular character is1, so both displayed rho conventions give the same section.
example {M : Type*} (φ : M → ℂ) : induced_spherical_section id (fun _ => 1) φ = φ := by sorry


theorem test3 :
    induced_spherical_section id (fun _ : Unit => Units.mk0 (2 : ℂ) (by norm_num)) (fun _ => 1) () = 2 ∧
      induced_spherical_section id (fun _ : Unit => (Units.mk0 (2 : ℂ) (by norm_num))⁻¹) (fun _ => 1) () = 1 / 2 := by sorry

-- Test: induced_spherical_section.test3
-- Apply induced_spherical_section to the constant vector one with ρ=2: the positive section gives two and the inverse section gives one half.
example :
    induced_spherical_section id (fun _ : Unit => Units.mk0 (2 : ℂ) (by norm_num)) (fun _ => 1) () = 2 ∧
      induced_spherical_section id (fun _ : Unit => (Units.mk0 (2 : ℂ) (by norm_num))⁻¹) (fun _ => 1) () = 1 / 2 := by sorry

end induced_spherical_section

def induction_normalization_transport {M : Type*} (s t : M → ℂˣ) (φ : M → ℂ) : M → ℂ :=
  fun m => ((t m : ℂ) / (s m : ℂ)) * φ m
namespace induction_normalization_transport
def normalizedSection {M : Type*} (s : M → ℂˣ) (φ : M → ℂ) := induced_spherical_section id s φ

theorem changeConvention {M : Type*} (s t u : M → ℂˣ) (φ : M → ℂ) :
    induction_normalization_transport t u (induction_normalization_transport s t φ) = induction_normalization_transport s u φ ∧ induction_normalization_transport s s φ = φ := by sorry

/-- Finite-dimensional transport preserves trace; the source/target conventions are both
changed. The supplied equivalence implements the numerical t/s multiplication. -/
theorem conjugateOperators {V : Type u} [AddCommGroup V] [Module ℂ V]
    [FiniteDimensional ℂ V] (C : V ≃ₗ[ℂ] V) (A : V →ₗ[ℂ] V) :
    LinearMap.trace ℂ V (C.toLinearMap.comp (A.comp C.symm.toLinearMap)) = LinearMap.trace ℂ V A := by sorry

theorem test1 :
    induction_normalization_transport (fun _ : Unit => Units.mk0 (2 : ℂ) (by norm_num))
      (fun _ => (Units.mk0 (2 : ℂ) (by norm_num))⁻¹) (fun _ => 2) () = 1 / 2 := by sorry

-- Test: induction_normalization_transport.test1
-- The actual section transport from ρ to ρ⁻¹ sends a value-two vector to one half when ρ=2.
example :
    induction_normalization_transport (fun _ : Unit => Units.mk0 (2 : ℂ) (by norm_num))
      (fun _ => (Units.mk0 (2 : ℂ) (by norm_num))⁻¹) (fun _ => 2) () = 1 / 2 := by sorry


theorem test2 {M : Type*} (s : M → ℂˣ) (φ : M → ℂ) (m : M) :
    (s m : ℂ)⁻¹ * normalizedSection s φ m = φ m := by sorry

-- Test: induction_normalization_transport.test2
-- Restricting s_R*phi_pi and multiplying by s_R⁻¹ recovers phi_pi exactly.
example {M : Type*} (s : M → ℂˣ) (φ : M → ℂ) (m : M) :
    (s m : ℂ)⁻¹ * normalizedSection s φ m = φ m := by sorry


theorem test3 {M : Type*} [MeasurableSpace M] (μ : Measure M)
    (rho : M → ℂˣ) (phi : M → ℂ) (hInt : Integrable (fun m => ‖phi m‖ ^ 2) μ) :
    ∫ m, ‖induction_normalization_transport rho (fun m => (rho m)⁻¹) phi m‖ ^ 2 * ‖(rho m : ℂ)‖ ^ 4 ∂μ =
      ∫ m, ‖phi m‖ ^ 2 ∂μ := by sorry

-- Test: induction_normalization_transport.test3
-- The squared norm of the transported section, integrated with the compensating factor |ρ|⁴, equals the original integrated squared norm.
example {M : Type*} [MeasurableSpace M] (μ : Measure M)
    (rho : M → ℂˣ) (phi : M → ℂ) (hInt : Integrable (fun m => ‖phi m‖ ^ 2) μ) :
    ∫ m, ‖induction_normalization_transport rho (fun m => (rho m)⁻¹) phi m‖ ^ 2 * ‖(rho m : ℂ)‖ ^ 4 ∂μ =
      ∫ m, ‖phi m‖ ^ 2 ∂μ := by sorry

end induction_normalization_transport
end TauCeti.AutomorphicSpectral

namespace TauCeti.AutomorphicSpectral
universe u v w

def nonholomorphic_eisenstein (z : UpperHalfPlane) (s : ℂ) : ℂ :=
  ∑' j : fullModular.Index, rpowC (fullModular.orbit j z).im s
namespace nonholomorphic_eisenstein
def imaginaryPoint (y : ℝ) : UpperHalfPlane := ⟨(max y 1 : ℝ) * Complex.I, by sorry⟩

def identityCoset : fullModular.Index := by sorry

theorem identityCoset_orbit (z : UpperHalfPlane) :
    fullModular.orbit identityCoset z = z := by sorry

def summand (j : fullModular.Index) (z : UpperHalfPlane) (s : ℂ) : ℂ :=
  rpowC (fullModular.orbit j z).im s

def cosetSum := nonholomorphic_eisenstein

theorem primitivePairs (z : UpperHalfPlane) (s : ℂ) (hs : 1 < s.re) :
    nonholomorphic_eisenstein z s = 1 / 2 * rpowC z.im s *
      ∑' p : {p : ℤ × ℤ // p.1.gcd p.2 = 1},
        rpowC ‖(p.val.1 : ℂ) * (z : ℂ) + p.val.2‖ (-2 * s) := by sorry

theorem automorphy (γ : Matrix.SpecialLinearGroup (Fin 2) ℤ) (z : UpperHalfPlane) (s : ℂ)
    (hs : 1 < s.re) :
    nonholomorphic_eisenstein (γ • z) s = nonholomorphic_eisenstein z s ∧
      -gzLaplacian (fun w => nonholomorphic_eisenstein w s) z =
        s * (1 - s) * nonholomorphic_eisenstein z s := by sorry

theorem test1  :
    Tendsto (fun y : ℝ => nonholomorphic_eisenstein (imaginaryPoint y) 2 / (y : ℂ) ^ 2) atTop (𝓝 1) := by sorry

-- Test: nonholomorphic_eisenstein.test1
-- Along the imaginary axis E(iy,2)/y² tends to one as y tends to infinity, testing the actual Eisenstein leading constant term.
example  :
    Tendsto (fun y : ℝ => nonholomorphic_eisenstein (imaginaryPoint y) 2 / (y : ℂ) ^ 2) atTop (𝓝 1) := by sorry


theorem test2 (z : UpperHalfPlane) (s : ℂ) (hs : 1 < s.re) :
    (∑' p : {p : ℤ × ℤ // p.1.gcd p.2 = 1},
      rpowC z.im s * rpowC ‖(p.val.1 : ℂ) * (z : ℂ) + p.val.2‖ (-2 * s)) = 2 * nonholomorphic_eisenstein z s := by sorry

-- Test: nonholomorphic_eisenstein.test2
-- Summing primitive pairs without 1/2 doubles E.
example (z : UpperHalfPlane) (s : ℂ) (hs : 1 < s.re) :
    (∑' p : {p : ℤ × ℤ // p.1.gcd p.2 = 1},
      rpowC z.im s * rpowC ‖(p.val.1 : ℂ) * (z : ℂ) + p.val.2‖ (-2 * s)) = 2 * nonholomorphic_eisenstein z s := by sorry


/-- At s=1 the positive series diverges, before continuation. -/
theorem test3 (z : UpperHalfPlane) :
    ¬ Summable (fun j : fullModular.Index => rpowC (fullModular.orbit j z).im 1) := by sorry

-- Test: nonholomorphic_eisenstein.test3
-- The critical-line value requires continuation and cannot be obtained by declaring the initial series convergent there.
example (z : UpperHalfPlane) :
    ¬ Summable (fun j : fullModular.Index => rpowC (fullModular.orbit j z).im 1) := by sorry

end nonholomorphic_eisenstein

namespace eisenstein_series
theorem sl2_positive (D : InductionData (Matrix.SpecialLinearGroup (Fin 2) ℝ) Unit)
    (r : fullModular.Index → Matrix.SpecialLinearGroup (Fin 2) ℝ)
    (hr : ∀ j (z : UpperHalfPlane), r j • z = fullModular.orbit j z)
    (one : D.space.Carrier) (hOne : ∀ x, D.evaluate one x = 1)
    (hRho : D.rho = fun _ => 1 / 2)
    (hHeight : ∀ x, D.height x = fun _ => Real.log (x • UpperHalfPlane.I).im)
    (g : Matrix.SpecialLinearGroup (Fin 2) ℝ) (s : ℂ) (hs : 1 < s.re) :
    eisenstein_series D r (fun _ => s - 1 / 2) one g =
      nonholomorphic_eisenstein (g • UpperHalfPlane.I) s := by sorry

-- Test: eisenstein_series.sl2_positive
-- For Γ=SL₂(ℤ), the spherical section gives Σ_{Γ∞\Γ}Im(γz)^s for Re s>1, with λ=s−1/2.
example (D : InductionData (Matrix.SpecialLinearGroup (Fin 2) ℝ) Unit)
    (r : fullModular.Index → Matrix.SpecialLinearGroup (Fin 2) ℝ)
    (hr : ∀ j (z : UpperHalfPlane), r j • z = fullModular.orbit j z)
    (one : D.space.Carrier) (hOne : ∀ x, D.evaluate one x = 1)
    (hRho : D.rho = fun _ => 1 / 2)
    (hHeight : ∀ x, D.height x = fun _ => Real.log (x • UpperHalfPlane.I).im)
    (g : Matrix.SpecialLinearGroup (Fin 2) ℝ) (s : ℂ) (hs : 1 < s.re) :
    eisenstein_series D r (fun _ => s - 1 / 2) one g =
      nonholomorphic_eisenstein (g • UpperHalfPlane.I) s := by sorry

end eisenstein_series

def continuedE (z : UpperHalfPlane) (s : ℂ) : ℂ := by sorry
def completed_eisenstein (B : SpecialFunctions) (z : UpperHalfPlane) (s : ℂ) : ℂ :=
  B.completedZeta (2 * s) * continuedE z s

/-- Laurent coefficient helper, with a common-denominator germ supplied by AS.0. -/
def scalarCoefficient (f : ℂ → ℂ) (z : ℂ) (n : ℤ) : ℂ := by sorry

namespace completed_eisenstein
theorem completion (B : SpecialFunctions) (z : UpperHalfPlane) (s : ℂ) :
    completed_eisenstein B z s = B.completedZeta (2 * s) * continuedE z s := by sorry

def constantTerm (B : SpecialFunctions) (y : ℝ) (s : ℂ) : ℂ :=
  B.completedZeta (2 * s) * rpowC y s + B.completedZeta (2 - 2 * s) * rpowC y (1 - s)

theorem continuation (B : SpecialFunctions) (z : UpperHalfPlane) :
    CommonDenominator Set.univ (completed_eisenstein B z) ∧
      ∀ s : ℂ, 1 < s.re → completed_eisenstein B z s = B.completedZeta (2 * s) * nonholomorphic_eisenstein z s := by sorry

theorem test1 (B : SpecialFunctions) (z : UpperHalfPlane) :
    scalarCoefficient (completed_eisenstein B z) 0 (-1) = -1 / 2 ∧ scalarCoefficient (completed_eisenstein B z) 1 (-1) = 1 / 2 := by sorry

-- Test: completed_eisenstein.test1
-- Residues at 0 and 1 are −1/2 and +1/2.
example (B : SpecialFunctions) (z : UpperHalfPlane) :
    scalarCoefficient (completed_eisenstein B z) 0 (-1) = -1 / 2 ∧ scalarCoefficient (completed_eisenstein B z) 1 (-1) = 1 / 2 := by sorry


/-- The full family has a limit at the critical center, despite the two singular CT pieces. -/
theorem test2 (B : SpecialFunctions) (z : UpperHalfPlane) :
    ∃ L : ℂ, Tendsto (completed_eisenstein B z) (𝓝[≠] (1 / 2)) (𝓝 L) := by sorry

-- Test: completed_eisenstein.test2
-- At critical t=0, cancellations between meromorphic pieces require a limit.
example (B : SpecialFunctions) (z : UpperHalfPlane) :
    ∃ L : ℂ, Tendsto (completed_eisenstein B z) (𝓝[≠] (1 / 2)) (𝓝 L) := by sorry


theorem test3 (B : SpecialFunctions) (z : UpperHalfPlane) (s : ℂ)
    (hs : B.completedZeta (2 * s) ≠ 0) :
    completed_eisenstein B z s / B.completedZeta (2 * s) = continuedE z s := by sorry

-- Test: completed_eisenstein.test3
-- An uncompleted E period cannot be substituted into Theorem 3 without dividing by Λ(2 s).
example (B : SpecialFunctions) (z : UpperHalfPlane) (s : ℂ)
    (hs : B.completedZeta (2 * s) ≠ 0) :
    completed_eisenstein B z s / B.completedZeta (2 * s) = continuedE z s := by sorry

end completed_eisenstein

/-- AS.1.15a: the Kloosterman sum `S(m, n; c) = Σ_{d ∈ (ℤ/cℤ)ˣ} e((m d + n d⁻¹)/c)`, as a sum over
residues `0 ≤ d < c` prime to `c`; it is `0` for `c = 0`. -/
def kloosterman_sum (m n : ℤ) (c : ℕ) : ℂ :=
  ∑ d ∈ (Finset.range c).filter (fun d => Nat.Coprime d c),
    Complex.exp (2 * Real.pi * Complex.I *
      (((m * d + n * ((d : ZMod c)⁻¹).val : ℤ) : ℂ) / c))

namespace kloosterman_sum

theorem kloosterman_symm (m n : ℤ) (c : ℕ) :
    kloosterman_sum m n c = kloosterman_sum n m c := by sorry

theorem kloosterman_real (m n : ℤ) (c : ℕ) : (kloosterman_sum m n c).im = 0 := by sorry

-- Test: `S(m, n; 1) = 1`.
theorem kloosterman_one (m n : ℤ) : kloosterman_sum m n 1 = 1 := by sorry

-- Test: `S(m, 0; c)` is Ramanujan's sum `Σ_{d ∣ (m, c)} d μ(c/d)`.
theorem kloosterman_ramanujan (m : ℤ) (c : ℕ) (hc : 0 < c) :
    kloosterman_sum m 0 c = ∑ d ∈ (Int.gcd m c).divisors,
      (d : ℂ) * (ArithmeticFunction.moebius (c / d) : ℂ) := by sorry

end kloosterman_sum

/-- The vertical line through `z`, truncated below so that it stays in `ℍ`. -/
def verticalCurve (z : UpperHalfPlane) (t : ℝ) : UpperHalfPlane :=
  ⟨(z : ℂ) + (max t (-z.im / 2) : ℝ) * Complex.I, by sorry⟩

/-- AS.1.15a: the weight-`k` hyperbolic Laplacian
`Δ_k f = -y²(∂ₓ² + ∂ᵧ²) f + i k y (∂ₓ + i ∂ᵧ) f` (Bruinier–Funke (3.1)); `Δ_0` is the
convention-D Laplacian `-y²(∂ₓ² + ∂ᵧ²)`. -/
def weight_laplacian (k : ℝ) (f : UpperHalfPlane → ℂ) (z : UpperHalfPlane) : ℂ :=
  -((z.im ^ 2 : ℝ) : ℂ) * (deriv (deriv (fun t : ℝ => f (horizontalCurve z t))) 0 +
      deriv (deriv (fun t : ℝ => f (verticalCurve z t))) 0) +
    Complex.I * k * z.im * (deriv (fun t : ℝ => f (horizontalCurve z t)) 0 +
      Complex.I * deriv (fun t : ℝ => f (verticalCurve z t)) 0)

namespace weight_laplacian

theorem weight_laplacian_slash (k : ℤ) (g : Matrix.SpecialLinearGroup (Fin 2) ℝ) (f : UpperHalfPlane → ℂ)
    (hf : ContDiffOn ℝ 2 (fun w : ℂ => if hw : 0 < w.im then f ⟨w, hw⟩ else 0) {w : ℂ | 0 < w.im})
    (z : UpperHalfPlane) :
    weight_laplacian k (fun w => UpperHalfPlane.denom (g : GL (Fin 2) ℝ) w ^ (-k) * f (g • w)) z =
      UpperHalfPlane.denom (g : GL (Fin 2) ℝ) z ^ (-k) * weight_laplacian k f (g • z) := by sorry

-- Test: `Δ₀ y^s = s(1 - s) y^s`, while `Δ_GZ y^s = s(s - 1) y^s`.
theorem laplacian_power (s : ℂ) (z : UpperHalfPlane) :
    weight_laplacian 0 (fun w => rpowC w.im s) z = s * (1 - s) * rpowC z.im s ∧
      gzLaplacian (fun w => rpowC w.im s) z = s * (s - 1) * rpowC z.im s := by sorry

end weight_laplacian

def bessel_kloosterman_coefficient (B : SpecialFunctions) (m n : ℤ) (s : ℂ) : ℂ :=
  ∑' c : ℕ, if c = 0 then 0 else (c : ℂ)⁻¹ * kloosterman_sum m n c *
    (if m * n < 0 then B.besselI else B.besselJ)
      (2 * s - 1) (4 * Real.pi * Real.sqrt |(m * n : ℝ)| / c)
namespace bessel_kloosterman_coefficient
def nonzeroCoefficient (B : SpecialFunctions)
    (m n : ℤ) (s : ℂ) : Option ℂ :=
  if m = 0 ∨ n = 0 then none else some (bessel_kloosterman_coefficient B m n s)

def signBranch (B : SpecialFunctions) (m n : ℤ) := if m * n < 0 then B.besselI else B.besselJ

theorem initialConvergence (B : SpecialFunctions)
    (m n : ℤ) (hm : m ≠ 0) (hn : n ≠ 0) (s : ℂ) (hs : 1 < s.re) :
    Summable (fun c : ℕ => if c = 0 then 0 else (c : ℂ)⁻¹ * kloosterman_sum m n c *
      signBranch B m n (2 * s - 1) (4 * Real.pi * Real.sqrt |(m * n : ℝ)| / c)) := by sorry

theorem test1 (B : SpecialFunctions) : signBranch B 1 1 = B.besselJ := by sorry

-- Test: bessel_kloosterman_coefficient.test1
-- m=n=1 uses J.
example (B : SpecialFunctions) : signBranch B 1 1 = B.besselJ := by sorry


theorem test2 (B : SpecialFunctions) : signBranch B (-1) 1 = B.besselI := by sorry

-- Test: bessel_kloosterman_coefficient.test2
-- m=−1, n=1 uses I.
example (B : SpecialFunctions) : signBranch B (-1) 1 = B.besselI := by sorry


theorem test3 (B : SpecialFunctions) (s : ℂ) :
    nonzeroCoefficient B 1 0 s = none ∧
      nonzeroCoefficient B 1 1 s = some (bessel_kloosterman_coefficient B 1 1 s) := by sorry

-- Test: bessel_kloosterman_coefficient.test3
-- The guarded nonzero-frequency coefficient returns no value at index zero and the actual bessel_kloosterman_coefficient coefficient at index one.
example (B : SpecialFunctions) (s : ℂ) :
    nonzeroCoefficient B 1 0 s = none ∧
      nonzeroCoefficient B 1 1 s = some (bessel_kloosterman_coefficient B 1 1 s) := by sorry

end bessel_kloosterman_coefficient

def poincareSeed (B : SpecialFunctions) (m : ℤ) (s : ℂ) (z : UpperHalfPlane) : ℂ :=
  (Real.sqrt z.im : ℂ) * B.besselI (s - 1 / 2) (2 * Real.pi * |(m : ℝ)| * z.im) *
    phase (m * z.re)
def poincare_family (B : SpecialFunctions) (m : ℤ) (z : UpperHalfPlane) (s : ℂ) : ℂ :=
  if m = 0 then nonholomorphic_eisenstein z s else ∑' j : fullModular.Index, poincareSeed B m s (fullModular.orbit j z)
/-- For `n ∉ {0, m}` the `n`-th Fourier coefficient of `F_m(·, s)` at height `y` is
`2 √y Φ(m, n; s) K_{s-1/2}(2π|n|y)`. -/
theorem bessel_kloosterman_coefficient.resolventComparison (B : SpecialFunctions) (m n : ℤ) (hm : m ≠ 0) (hn : n ≠ 0)
    (hnm : n ≠ m) (s : ℂ) (hs : 1 < s.re) (y : ℝ) (hy : 0 < y) :
    ∫ x in (0 : ℝ)..1, poincare_family B m ⟨(x : ℂ) + (y : ℂ) * Complex.I, by sorry⟩ s *
        phase (-((n : ℝ) * x)) =
      2 * Real.sqrt y * bessel_kloosterman_coefficient B m n s *
        B.besselK (s - 1 / 2) (2 * Real.pi * |(n : ℝ)| * y) := by sorry

namespace poincare_family
def seed := poincareSeed

theorem automorphicSum (B : SpecialFunctions) (m : ℤ) (γ : Matrix.SpecialLinearGroup (Fin 2) ℤ)
    (z : UpperHalfPlane) (s : ℂ) (hs : 1 < s.re) :
    poincare_family B m (γ • z) s = poincare_family B m z s := by sorry

theorem resolventContinuation (B : SpecialFunctions) (m : ℤ) (z : UpperHalfPlane) :
    ∃ F : ℂ → ℂ, CommonDenominator Set.univ F ∧ ∀ s, 1 < s.re → F s = poincare_family B m z s := by sorry

theorem test1 (B : SpecialFunctions) (z : UpperHalfPlane) (s : ℂ) : poincare_family B 0 z s = nonholomorphic_eisenstein z s := by sorry

-- Test: poincare_family.test1
-- m=0 gives E by a separate definition.
example (B : SpecialFunctions) (z : UpperHalfPlane) (s : ℂ) : poincare_family B 0 z s = nonholomorphic_eisenstein z s := by sorry


theorem test2 (B : SpecialFunctions) (m : ℤ) (s : ℂ) (z : UpperHalfPlane) :
    poincareSeed B (-m) s z = (Real.sqrt z.im : ℂ) *
      B.besselI (s - 1 / 2) (2 * Real.pi * |(m : ℝ)| * z.im) * phase (-m * z.re) := by sorry

-- Test: poincare_family.test2
-- The absolute value of m occurs in the Bessel argument but not in the phase.
example (B : SpecialFunctions) (m : ℤ) (s : ℂ) (z : UpperHalfPlane) :
    poincareSeed B (-m) s z = (Real.sqrt z.im : ℂ) *
      B.besselI (s - 1 / 2) (2 * Real.pi * |(m : ℝ)| * z.im) * phase (-m * z.re) := by sorry


theorem test3 (B : SpecialFunctions) (m : ℤ) (hm : m ≠ 0) (s : ℝ) (hs : 1 < s)
    (hAsymptotic : Tendsto
      (fun y : ℝ => Complex.ofReal (Real.sqrt (4 * Real.pi ^ 2 * |(m : ℝ)| * y)) *
        B.besselI ((s : ℂ) - 1 / 2) (2 * Real.pi * |(m : ℝ)| * y) *
        Complex.ofReal (Real.exp (-2 * Real.pi * |(m : ℝ)| * y)))
      atTop (𝓝 1)) :
    ¬ IntegrableOn (fun y : ℝ =>
      ‖poincareSeed B m s ⟨(max y 1 : ℝ) * Complex.I, by sorry⟩‖ ^ 2 / y ^ 2)
      (Set.Ioi 1) := by sorry

-- Test: poincare_family.test3
-- Under the standard large-argument I-Bessel asymptotic, the actual nonzero Poincaré seed has nonintegrable squared norm on the cusp for real s>1; it cannot be inserted directly as an L² vector.
example (B : SpecialFunctions) (m : ℤ) (hm : m ≠ 0) (s : ℝ) (hs : 1 < s)
    (hAsymptotic : Tendsto
      (fun y : ℝ => Complex.ofReal (Real.sqrt (4 * Real.pi ^ 2 * |(m : ℝ)| * y)) *
        B.besselI ((s : ℂ) - 1 / 2) (2 * Real.pi * |(m : ℝ)| * y) *
        Complex.ofReal (Real.exp (-2 * Real.pi * |(m : ℝ)| * y)))
      atTop (𝓝 1)) :
    ¬ IntegrableOn (fun y : ℝ =>
      ‖poincareSeed B m s ⟨(max y 1 : ℝ) * Complex.I, by sorry⟩‖ ^ 2 / y ^ 2)
      (Set.Ioi 1) := by sorry

end poincare_family

theorem poincare_eigenfunction (B : SpecialFunctions) (m : ℤ) (z : UpperHalfPlane) (s : ℂ)
    (hs : 1 < s.re) :
    weight_laplacian 0 (fun w => poincare_family B m w s) z =
      s * (1 - s) * poincare_family B m z s := by sorry

def poincare_one_form (m : ℤ) (phi : ℝ → ℂ) (z : UpperHalfPlane) : ℂ :=
  ∑' j : fullModular.Index, phase (m * (fullModular.orbit j z).re) *
    phi (fullModular.orbit j z).im * fullModular.derivative j z
namespace poincare_one_form
def inversion (z : UpperHalfPlane) : UpperHalfPlane := ⟨-(z : ℂ)⁻¹, by sorry⟩
def cyclePullback (m : ℤ) (phi : ℝ → ℂ) (c : ℝ → UpperHalfPlane)
    (dc : ℝ → ℂ) (t : ℝ) : ℂ := poincare_one_form m phi (c t) * dc t
def oscillatingSeed (y : ℝ) : ℂ := y ^ 2 * Real.sin (Real.exp y⁻¹)

def oneFormSum := poincare_one_form

theorem weightTwo (m : ℤ) (phi : ℝ → ℂ) (γ : Matrix.SpecialLinearGroup (Fin 2) ℤ)
    (z : UpperHalfPlane) :
    poincare_one_form m phi (γ • z) *
        (((γ : Matrix (Fin 2) (Fin 2) ℤ) 1 0 : ℂ) * (z : ℂ) +
          ((γ : Matrix (Fin 2) (Fin 2) ℤ) 1 1 : ℂ)) ^ (-2 : ℤ) =
      poincare_one_form m phi z := by sorry

def parameterBounds (phi : ℝ → ℂ) (eps : ℝ) : Prop :=
  ∃ C : ℝ, ∀ y : ℝ, 0 < y → y ≤ 1 → ‖phi y‖ ≤ C * y ^ eps

theorem test1 (m : ℤ) (phi : ℝ → ℂ)
    (hphi : ContDiffOn ℝ ((⊤ : ℕ∞) : WithTop ℕ∞) phi (Set.Ioi 0))
    (hSupport : ∃ a b : ℝ, 0 < a ∧ Function.support phi ⊆ Set.Icc a b)
    (z : UpperHalfPlane) :
    poincare_one_form m phi (inversion z) * (z : ℂ) ^ (-2 : ℤ) = poincare_one_form m phi z := by sorry

-- Test: poincare_one_form.test1
-- For a smooth compactly supported seed, inversion transforms the actual Poincaré coefficient with derivative z^(−2), as required for the descended weight-two one-form.
example (m : ℤ) (phi : ℝ → ℂ)
    (hphi : ContDiffOn ℝ ((⊤ : ℕ∞) : WithTop ℕ∞) phi (Set.Ioi 0))
    (hSupport : ∃ a b : ℝ, 0 < a ∧ Function.support phi ⊆ Set.Icc a b)
    (z : UpperHalfPlane) :
    poincare_one_form m phi (inversion z) * (z : ℂ) ^ (-2 : ℤ) = poincare_one_form m phi z := by sorry


theorem test2 (m : ℤ) (phi : ℝ → ℂ) (c : ℝ → UpperHalfPlane)
    (dc : ℝ → ℂ) (a b : ℝ) :
    (∫ t in b..a, cyclePullback m phi c dc t) =
      -(∫ t in a..b, cyclePullback m phi c dc t) := by sorry

-- Test: poincare_one_form.test2
-- Reversing the interval orientation negates the integral of the actual poincare_one_form one-form pulled back along a parametrized cycle.
example (m : ℤ) (phi : ℝ → ℂ) (c : ℝ → UpperHalfPlane)
    (dc : ℝ → ℂ) (a b : ℝ) :
    (∫ t in b..a, cyclePullback m phi c dc t) =
      -(∫ t in a..b, cyclePullback m phi c dc t) := by sorry


theorem test3  : ContDiffOn ℝ ((⊤ : ℕ∞) : WithTop ℕ∞) oscillatingSeed (Set.Ioi 0) ∧
    parameterBounds oscillatingSeed 2 ∧
    ¬ ∃ C : ℝ, ∀ y : ℝ, 0 < y → y ≤ 1 → ‖deriv oscillatingSeed y‖ ≤ C := by sorry

-- Test: poincare_one_form.test3
-- The smooth positive-axis seed y² sin(exp(1/y)) satisfies the named value-bound condition of order two (hence the small-y value condition with ε = 1), while its derivative has no uniform bound near zero; a value bound does not imply the derivative majorant.
example  : ContDiffOn ℝ ((⊤ : ℕ∞) : WithTop ℕ∞) oscillatingSeed (Set.Ioi 0) ∧
    parameterBounds oscillatingSeed 2 ∧
    ¬ ∃ C : ℝ, ∀ y : ℝ, 0 < y → y ≤ 1 → ‖deriv oscillatingSeed y‖ ≤ C := by sorry

end poincare_one_form

/-- `-2i ∂_z F_m` with `∂_z = ½(∂_x - i ∂_y)`. -/
theorem whittaker_seed_derivative (B : SpecialFunctions) (m : ℤ) (hm : m ≠ 0)
    (z : UpperHalfPlane) (s : ℂ) (hs : 1 < s.re) :
    -2 * Complex.I * ((1 / 2 : ℂ) *
        (deriv (fun t : ℝ => poincare_family B m (horizontalCurve z t) s) 0 -
          Complex.I * deriv (fun t : ℝ => poincare_family B m (verticalCurve z t) s) 0)) =
      poincare_one_form m (fun y => -s * rpowC |(m : ℝ)| (-1 / 2) / (2 * Real.pi * y) *
        Complex.Gamma s / Complex.Gamma (2 * s) *
          whittaker_m (if 0 < m then 1 else -1) (s - 1 / 2) (4 * Real.pi * |(m : ℝ)| * y)) z := by sorry

def divisorSigma (s : ℂ) (n : ℕ) : ℂ := ∑ d ∈ n.divisors, rpowC d s

theorem poincare_fourier_expansion (B : SpecialFunctions)
    (m : ℤ) (hm : m ≠ 0) (z : UpperHalfPlane)
    (s : ℂ) (hs : 1 < s.re) :
    poincare_family B m z s = poincareSeed B m s z +
      2 * rpowC |(m : ℝ)| (1 / 2 - s) * divisorSigma (2 * s - 1) m.natAbs /
        ((2 * s - 1) * B.completedZeta (2 * s)) * rpowC z.im (1 - s) +
      2 * Real.sqrt z.im * ∑' n : ℤ, if n = 0 then 0 else bessel_kloosterman_coefficient B m n s *
        B.besselK (s - 1 / 2) (2 * Real.pi * |(n : ℝ)| * z.im) * phase (n * z.re) := by sorry

/-- AS.1.22: the cusp-∞ Eisenstein series of level `N`, `Σ_{γ ∈ Γ∞\Γ₀(N)} Im(γz)^s`,
for `Re s > 1`. -/
def level_eisenstein (N : ℕ) [NeZero N] (z : UpperHalfPlane) (s : ℂ) : ℂ :=
  ∑' j : (levelModular N).Index, rpowC ((levelModular N).orbit j z).im s
namespace level_eisenstein
/-- The meromorphic continuation of `level_eisenstein N z` in `s`. -/
def continued (N : ℕ) [NeZero N] (z : UpperHalfPlane) : ℂ → ℂ := by sorry

theorem continued_eq (N : ℕ) [NeZero N] (z : UpperHalfPlane) :
    CommonDenominator Set.univ (continued N z) ∧
      ∀ s : ℂ, 1 < s.re → continued N z s = level_eisenstein N z s := by sorry

def unrestrictedPairs (z : UpperHalfPlane) (s : ℂ) : ℂ :=
  ∑' p : ℤ × ℤ, if p = (0, 0) then 0 else
    rpowC z.im s * rpowC ‖(p.1 : ℂ) * (z : ℂ) + p.2‖ (-2 * s)

theorem coprime_pairs (N : ℕ) [NeZero N] (z : UpperHalfPlane) (s : ℂ) (hs : 1 < s.re) :
    level_eisenstein N z s = 1 / 2 * ∑' p : ℤ × ℤ,
      if Int.gcd p.1 p.2 = 1 ∧ (N : ℤ) ∣ p.1 then
        rpowC z.im s * rpowC ‖(p.1 : ℂ) * (z : ℂ) + p.2‖ (-2 * s) else 0 := by sorry

theorem coset_sum (N : ℕ) [NeZero N] (z : UpperHalfPlane) (s : ℂ) (hs : 1 < s.re) :
    level_eisenstein N z s = ∑' j : (levelModular N).Index,
      rpowC ((levelModular N).orbit j z).im s := by sorry

theorem level_one (z : UpperHalfPlane) (s : ℂ) (hs : 1 < s.re) :
    level_eisenstein 1 z s = nonholomorphic_eisenstein z s := by sorry

-- Test: level one gives E, with residue 3/π at s = 1.
theorem level_one_test (z : UpperHalfPlane) :
    scalarCoefficient (continued 1 z) 1 (-1) = 3 / Real.pi := by sorry

-- Test: at prime level p the residue at s = 1 is 3/(π(p+1)).
theorem prime_level (p : ℕ) [NeZero p] (hp : p.Prime) (z : UpperHalfPlane) :
    scalarCoefficient (continued p z) 1 (-1) = 3 / (Real.pi * (p + 1)) := by sorry

-- Test: the unrestricted integer-pair sum at s = 2 is 2ζ(4) times the coset series.
theorem nonprimitive (z : UpperHalfPlane) :
    unrestrictedPairs z 2 = (2 * riemannZeta 4) * nonholomorphic_eisenstein z 2 ∧
      unrestrictedPairs z 2 ≠ nonholomorphic_eisenstein z 2 := by sorry

end level_eisenstein

/-- Positive dilation `z ↦ a z` of the upper half-plane. -/
def positiveDilation (a : ℝ) (ha : 0 < a) (z : UpperHalfPlane) : UpperHalfPlane :=
  ⟨a * (z : ℂ), by sorry⟩

/-- AS.1.23: `E_N` through the level-one series and Möbius inversion. -/
theorem level_eisenstein_mobius (N : ℕ) [NeZero N] (hN : 1 ≤ N)
    (z : UpperHalfPlane) (s : ℂ) (hs : 1 < s.re) :
    level_eisenstein N z s = rpowC N (-s) *
      (∏ p ∈ N.primeFactors, (1 - rpowC p (-2 * s)))⁻¹ *
      ∑ d : N.divisors, (ArithmeticFunction.moebius d.val : ℂ) * rpowC d.val (-s) *
        nonholomorphic_eisenstein (positiveDilation ((N : ℝ) / d.val) (by sorry) z) s := by sorry

/-- Unrestricted odd-weight character-pair series; primitive Dirichlet characters and
fundamental discriminants are imported. -/
def genus_eisenstein (D2 : ℤ) (eps1 eps2 : ℤ → ℂ) (k : ℕ) (z : UpperHalfPlane) (s : ℂ) : ℂ :=
  1 / 2 * ∑' p : ℤ × ℤ, if D2 ∣ p.1 then
    eps1 p.1 * eps2 p.2 * ((p.1 : ℂ) * (z : ℂ) + p.2) ^ (-(2 * k - 1 : ℤ)) *
      rpowC z.im s * rpowC ‖(p.1 : ℂ) * (z : ℂ) + p.2‖ (-2 * s) else 0

def character_eisenstein (N delta k : ℕ) (eps : ℤ → ℂ) (z : UpperHalfPlane) (s : ℂ) : ℂ :=
  1 / 2 * ∑' p : ℤ × ℤ, if (N * delta : ℤ) ∣ p.1 ∧ p.2.gcd (N * delta) = 1 then
    eps p.2 * ((p.1 : ℂ) * (z : ℂ) + p.2) ^ (-(2 * k - 1 : ℤ)) *
      rpowC z.im s * rpowC ‖(p.1 : ℂ) * (z : ℂ) + p.2‖ (-2 * s) else 0
namespace character_eisenstein
def latticeTerm (N delta k : ℕ) (eps : ℤ → ℂ) (z : UpperHalfPlane)
    (s : ℂ) (p : ℤ × ℤ) : ℂ :=
  if (N * delta : ℤ) ∣ p.1 ∧ p.2.gcd (N * delta) = 1 then
    eps p.2 * ((p.1 : ℂ) * (z : ℂ) + p.2) ^ (-(2 * k - 1 : ℤ)) *
      rpowC z.im s * rpowC ‖(p.1 : ℂ) * (z : ℂ) + p.2‖ (-2 * s) else 0


theorem primitive_to_full (N delta k : ℕ) (hk : 1 ≤ k) (χ : DirichletCharacter ℂ delta)
    (z : UpperHalfPlane) (s : ℂ) (hs : 1 < s.re) :
    character_eisenstein N delta k (fun n => χ n) z s =
      (∑' n : ℕ, if 0 < n ∧ Nat.Coprime n N then
          χ n * rpowC n (-(2 * s + 2 * k - 1)) else 0) *
      (1 / 2 * ∑' p : ℤ × ℤ, if (N * delta : ℤ) ∣ p.1 ∧ Int.gcd p.1 p.2 = 1 then
        χ p.2 * ((p.1 : ℂ) * (z : ℂ) + p.2) ^ (-(2 * k - 1 : ℤ)) *
          rpowC z.im s * rpowC ‖(p.1 : ℂ) * (z : ℂ) + p.2‖ (-2 * s) else 0) := by sorry

theorem automorphy (N delta k : ℕ) (hk : 1 ≤ k) (χ : DirichletCharacter ℂ delta)
    (hχ : χ.IsQuadratic) (γ : Matrix.SpecialLinearGroup (Fin 2) ℤ)
    (hγ : (N * delta : ℤ) ∣ (γ : Matrix (Fin 2) (Fin 2) ℤ) 1 0) (z : UpperHalfPlane) (s : ℂ) :
    character_eisenstein N delta k (fun n => χ n) (γ • z) s =
      χ ((γ : Matrix (Fin 2) (Fin 2) ℤ) 1 1) *
        (((γ : Matrix (Fin 2) (Fin 2) ℤ) 1 0 : ℂ) * (z : ℂ) +
          ((γ : Matrix (Fin 2) (Fin 2) ℤ) 1 1 : ℂ)) ^ (2 * k - 1) *
        character_eisenstein N delta k (fun n => χ n) z s := by sorry

theorem n_one (delta k : ℕ) (eps : ℤ → ℂ) (hEps : ∀ n : ℤ, Int.gcd n delta ≠ 1 → eps n = 0)
    (z : UpperHalfPlane) (s : ℂ) :
    character_eisenstein 1 delta k eps z s = genus_eisenstein delta (fun _ => 1) eps k z s := by sorry

theorem sign_pair (N delta k : ℕ) (hk : 1 ≤ k) (eps : ℤ → ℂ)
    (hOdd : ∀ n, eps (-n) = -eps n) (z : UpperHalfPlane) (s : ℂ) (p : ℤ × ℤ) :
    latticeTerm N delta k eps z s (-p.1, -p.2) = latticeTerm N delta k eps z s p ∧
      character_eisenstein N delta k eps z s = 1 / 2 * ∑' p : ℤ × ℤ, latticeTerm N delta k eps z s p := by sorry

-- Test: character_eisenstein.sign_pair
-- With an odd character, negating both lattice indices leaves the actual character_eisenstein summand unchanged; the half-sum equals the series constructor.
example (N delta k : ℕ) (hk : 1 ≤ k) (eps : ℤ → ℂ)
    (hOdd : ∀ n, eps (-n) = -eps n) (z : UpperHalfPlane) (s : ℂ) (p : ℤ × ℤ) :
    latticeTerm N delta k eps z s (-p.1, -p.2) = latticeTerm N delta k eps z s p ∧
      character_eisenstein N delta k eps z s = 1 / 2 * ∑' p : ℤ × ℤ, latticeTerm N delta k eps z s p := by sorry


theorem n_one_test (delta k : ℕ) (eps : ℤ → ℂ) (hEps : ∀ n : ℤ, Int.gcd n delta ≠ 1 → eps n = 0)
    (z : UpperHalfPlane) (s : ℂ) :
    character_eisenstein 1 delta k eps z s = genus_eisenstein delta (fun _ => 1) eps k z s := by sorry

-- Test: character_eisenstein.n_one_test
-- N=1 gives levelδ.
example (delta k : ℕ) (eps : ℤ → ℂ) (hEps : ∀ n : ℤ, Int.gcd n delta ≠ 1 → eps n = 0)
    (z : UpperHalfPlane) (s : ℂ) :
    character_eisenstein 1 delta k eps z s = genus_eisenstein delta (fun _ => 1) eps k z s := by sorry


theorem wrong_parity (N delta k : ℕ) (hk : 1 ≤ k) (eps : ℤ → ℂ)
    (hEven : ∀ n, eps (-n) = eps n) (z : UpperHalfPlane) (s : ℂ)
    (hSum : Summable (latticeTerm N delta k eps z s)) :
    character_eisenstein N delta k eps z s = 0 := by sorry

-- Test: character_eisenstein.wrong_parity
-- With an even character and an absolutely summable odd-weight lattice family, the actual character_eisenstein series vanishes by cancellation of opposite indices.
example (N delta k : ℕ) (hk : 1 ≤ k) (eps : ℤ → ℂ)
    (hEven : ∀ n, eps (-n) = eps n) (z : UpperHalfPlane) (s : ℂ)
    (hSum : Summable (latticeTerm N delta k eps z s)) :
    character_eisenstein N delta k eps z s = 0 := by sorry

end character_eisenstein
namespace genus_eisenstein
def latticeTerm (D2 : ℤ) (eps1 eps2 : ℤ → ℂ) (k : ℕ)
    (z : UpperHalfPlane) (s : ℂ) (p : ℤ × ℤ) : ℂ :=
  if D2 ∣ p.1 then eps1 p.1 * eps2 p.2 *
    ((p.1 : ℂ) * (z : ℂ) + p.2) ^ (-(2 * k - 1 : ℤ)) *
      rpowC z.im s * rpowC ‖(p.1 : ℂ) * (z : ℂ) + p.2‖ (-2 * s) else 0
/-- The arithmetic guard uses Tau Ceti's fundamental-discriminant predicate. -/
def guardedPairSeries (D1 D2 : ℤ) (eps1 eps2 : ℤ → ℂ)
    (k : ℕ) (z : UpperHalfPlane) (s : ℂ) : Option ℂ := by
  classical
  exact if TauCeti.Multiquadratic.IsFundamentalDiscriminant D1 ∧
      TauCeti.Multiquadratic.IsFundamentalDiscriminant D2 then
    some (genus_eisenstein D2 eps1 eps2 k z s) else none


def pair_sum := genus_eisenstein

theorem d1_one (delta k : ℕ) (eps : ℤ → ℂ) (hEps : ∀ n : ℤ, Int.gcd n delta ≠ 1 → eps n = 0)
    (z : UpperHalfPlane) (s : ℂ) :
    genus_eisenstein delta (fun _ => 1) eps k z s = character_eisenstein 1 delta k eps z s := by sorry

theorem automorphy (D1 D2 : ℤ) (χ₁ : DirichletCharacter ℂ D1.natAbs)
    (χ₂ : DirichletCharacter ℂ D2.natAbs) (h₁ : χ₁.IsQuadratic) (h₂ : χ₂.IsQuadratic)
    (k : ℕ) (hk : 1 ≤ k) (γ : Matrix.SpecialLinearGroup (Fin 2) ℤ)
    (hγ : D1 * D2 ∣ (γ : Matrix (Fin 2) (Fin 2) ℤ) 1 0) (z : UpperHalfPlane) (s : ℂ) :
    genus_eisenstein D2 (fun n => χ₁ n) (fun n => χ₂ n) k (γ • z) s =
      χ₁ ((γ : Matrix (Fin 2) (Fin 2) ℤ) 1 1) * χ₂ ((γ : Matrix (Fin 2) (Fin 2) ℤ) 1 1) *
        (((γ : Matrix (Fin 2) (Fin 2) ℤ) 1 0 : ℂ) * (z : ℂ) +
          ((γ : Matrix (Fin 2) (Fin 2) ℤ) 1 1 : ℂ)) ^ (2 * k - 1) *
        genus_eisenstein D2 (fun n => χ₁ n) (fun n => χ₂ n) k z s := by sorry

theorem d1_one_test (delta k : ℕ) (eps : ℤ → ℂ) (hEps : ∀ n : ℤ, Int.gcd n delta ≠ 1 → eps n = 0)
    (z : UpperHalfPlane) (s : ℂ) :
    genus_eisenstein delta (fun _ => 1) eps k z s = character_eisenstein 1 delta k eps z s := by sorry

-- Test: genus_eisenstein.d1_one_test
-- D₁=1 gives the levelδ series.
example (delta k : ℕ) (eps : ℤ → ℂ) (hEps : ∀ n : ℤ, Int.gcd n delta ≠ 1 → eps n = 0)
    (z : UpperHalfPlane) (s : ℂ) :
    genus_eisenstein delta (fun _ => 1) eps k z s = character_eisenstein 1 delta k eps z s := by sorry


theorem odd_product (D2 : ℤ) (eps1 eps2 : ℤ → ℂ) (k : ℕ) (hk : 1 ≤ k)
    (hParity : ∀ m n, eps1 (-m) * eps2 (-n) = -(eps1 m * eps2 n))
    (z : UpperHalfPlane) (s : ℂ) (p : ℤ × ℤ) :
    latticeTerm D2 eps1 eps2 k z s (-p.1, -p.2) = latticeTerm D2 eps1 eps2 k z s p ∧
      genus_eisenstein D2 eps1 eps2 k z s = 1 / 2 * ∑' p : ℤ × ℤ, latticeTerm D2 eps1 eps2 k z s p := by sorry

-- Test: genus_eisenstein.odd_product
-- When the product of the two character parities is odd, simultaneous sign reversal preserves the actual two-character lattice summand and its half-sum is genus_eisenstein.
example (D2 : ℤ) (eps1 eps2 : ℤ → ℂ) (k : ℕ) (hk : 1 ≤ k)
    (hParity : ∀ m n, eps1 (-m) * eps2 (-n) = -(eps1 m * eps2 n))
    (z : UpperHalfPlane) (s : ℂ) (p : ℤ × ℤ) :
    latticeTerm D2 eps1 eps2 k z s (-p.1, -p.2) = latticeTerm D2 eps1 eps2 k z s p ∧
      genus_eisenstein D2 eps1 eps2 k z s = 1 / 2 * ∑' p : ℤ × ℤ, latticeTerm D2 eps1 eps2 k z s p := by sorry


theorem nonfundamental (eps1 eps2 : ℤ → ℂ) (k : ℕ) (z : UpperHalfPlane) (s : ℂ) :
    guardedPairSeries 12 1 eps1 eps2 k z s = some (genus_eisenstein 1 eps1 eps2 k z s) ∧
      guardedPairSeries 16 1 eps1 eps2 k z s = none := by sorry

-- Test: genus_eisenstein.nonfundamental
-- The constructor guard using the upstream fundamental-discriminant criterion accepts 12 and rejects 16. The raw analytic lattice sum alone does not construct primitive arithmetic characters.
example (eps1 eps2 : ℤ → ℂ) (k : ℕ) (z : UpperHalfPlane) (s : ℂ) :
    guardedPairSeries 12 1 eps1 eps2 k z s = some (genus_eisenstein 1 eps1 eps2 k z s) ∧
      guardedPairSeries 16 1 eps1 eps2 k z s = none := by sorry

end genus_eisenstein

theorem lipschitz_poisson_identity (k : ℕ) (hk : 1 ≤ k) (s : ℂ) (hs : 1 - (k : ℝ) < s.re)
    (x y : ℝ) (hy : 0 < y) :
    (∑' l : ℤ, (((x : ℂ) + y * Complex.I + l) ^ (2 * k - 1) *
      rpowC ‖(x : ℂ) + y * Complex.I + l‖ (2 * s))⁻¹) =
      rpowC y (-2 * s - 2 * k + 2) * ∑' r : ℤ, archimedean_v_integral k s (r * y) * phase (r * x) := by sorry

theorem genus_eisenstein_fourier (D1 D2 : ℤ) (hD : D1 * D2 < 0) (hOdd : Odd (D1 * D2))
    (hD1 : TauCeti.Multiquadratic.IsFundamentalDiscriminant D1)
    (hD2 : TauCeti.Multiquadratic.IsFundamentalDiscriminant D2)
    (χ₁ : DirichletCharacter ℂ D1.natAbs) (χ₂ : DirichletCharacter ℂ D2.natAbs)
    (hχ₁ : χ₁.IsPrimitive ∧ χ₁.IsQuadratic ∧ χ₁ (-1) = (D1.sign : ℂ))
    (hχ₂ : χ₂.IsPrimitive ∧ χ₂.IsQuadratic ∧ χ₂ (-1) = (D2.sign : ℂ))
    (k : ℕ) (hk : 1 ≤ k) (n : ℤ) (hn : n ≠ 0) (y : ℝ) (hy : 0 < y) (s : ℂ) (hs : 1 < s.re) :
    (∫ x in (0 : ℝ)..1, genus_eisenstein D2 (fun m => χ₁ m) (fun m => χ₂ m) k
        ⟨(x : ℂ) + (y : ℂ) * Complex.I, by sorry⟩ s * phase (-((n : ℝ) * x))) =
      χ₁ D2.natAbs * (if 0 < D2 then 1 else Complex.I) /
          rpowC D2.natAbs (2 * s + 2 * k - 3 / 2) *
        (∑ m ∈ n.natAbs.divisors, χ₁ m * χ₂ ((n / (m : ℤ) : ℤ) : ZMod D2.natAbs) *
          rpowC m (-2 * s - 2 * k + 2)) *
        rpowC y (-s - 2 * k + 2) * continuedV k s (n * y) := by sorry

theorem eisenstein_growth (s : ℝ) (hs : 1 < s) : ∃ C Y : ℝ, ∀ z : UpperHalfPlane,
    Y ≤ z.im → ‖nonholomorphic_eisenstein z s - rpowC z.im s‖ ≤ C * z.im ^ (1 - s) := by sorry

theorem eisenstein_fourier_weight_two (B : SpecialFunctions) (z : UpperHalfPlane)
    (s : ℂ) (hs : 1 < s.re) :
    nonholomorphic_eisenstein z s = rpowC z.im s + (Real.sqrt Real.pi : ℂ) * Complex.Gamma (s - 1 / 2) *
      riemannZeta (2 * s - 1) / (Complex.Gamma s * riemannZeta (2 * s)) * rpowC z.im (1 - s) +
      2 * rpowC Real.pi s * Real.sqrt z.im / (Complex.Gamma s * riemannZeta (2 * s)) *
      ∑' m : ℤ, if m = 0 then 0 else rpowC |(m : ℝ)| (1 / 2 - s) *
        divisorSigma (2 * s - 1) m.natAbs * B.besselK (s - 1 / 2)
          (2 * Real.pi * |(m : ℝ)| * z.im) * phase (m * z.re) := by sorry
end TauCeti.AutomorphicSpectral

/-! ## AS.2 — Meromorphic continuation, local normalization and residues -/

namespace TauCeti.AutomorphicSpectral
universe u v w
section Intertwiners
variable {H : Type u} [NormedAddCommGroup H] [InnerProductSpace ℂ H] [CompleteSpace H]
variable {K : Type v} [NormedAddCommGroup K] [InnerProductSpace ℂ K] [CompleteSpace K]

def local_intertwiner {N : Type w} [MeasurableSpace N] (μ : Measure N)
    (integrand : ℂ → N → H →L[ℂ] K) (s : ℂ) : H →L[ℂ] K :=
  ∫ n, integrand s n ∂μ
namespace local_intertwiner
-- The chamber integral and its continued spherical eigenline are explicitly linked.

def continuedSphericalIntegral (q : ℝ) (z : ℂ) : ℂ →L[ℂ] ℂ :=
  ((1 - (q : ℂ)⁻¹ * z) / (1 - z)) • ContinuousLinearMap.id ℂ ℂ

variable {N : Type w} [MeasurableSpace N] (μ : Measure N) (k : ℂ → N → H →L[ℂ] K)

omit [CompleteSpace H] in
theorem intertwines {G : Type*} [Group G] (IP : ℂ → G → Operator H)
    (IQ : ℂ → G → Operator K) (s : ℂ) (g : G)
    (hInt : Integrable (k s) μ)
    (hCompat : ∀ n, (k s n).comp (IP s g) = (IQ s g).comp (k s n)) :
    (local_intertwiner μ k s).comp (IP s g) = (IQ s g).comp (local_intertwiner μ k s) := by
  ext v
  change (∫ n, k s n ∂μ) (IP s g v) = IQ s g ((∫ n, k s n ∂μ) v)
  have hvInt : Integrable (fun n => k s n v) μ :=
    (ContinuousLinearMap.apply ℂ K v).integrable_comp hInt
  rw [ContinuousLinearMap.integral_apply hInt, ContinuousLinearMap.integral_apply hInt,
    ← (IQ s g).integral_comp_comm hvInt]
  apply integral_congr_ae
  filter_upwards [] with n
  simpa only [ContinuousLinearMap.comp_apply] using
    congrArg (fun A : H →L[ℂ] K => A v) (hCompat n)

theorem identity (s : ℂ) : local_intertwiner (Measure.dirac ())
    (fun _ (_ : Unit) => ContinuousLinearMap.id ℂ H) s = ContinuousLinearMap.id ℂ H := by
  simp [local_intertwiner]


theorem identity_test (s : ℂ) (v : H) : local_intertwiner (Measure.dirac ())
    (fun _ (_ : Unit) => ContinuousLinearMap.id ℂ H) s v = v := by
  simp [local_intertwiner]

-- Test: local_intertwiner.identity_test
-- When P=Q the integral is the identity.
example (s : ℂ) (v : H) : local_intertwiner (Measure.dirac ())
    (fun _ (_ : Unit) => ContinuousLinearMap.id ℂ H) s v = v := by
  simp [local_intertwiner]


def cFunction (q : ℝ) (z : ℂ) : ℂ := (1 - (q : ℂ)⁻¹ * z) / (1 - z)

def gl2ShellKernel (q : ℝ) (z : ℂ) : ℂ → ℕ → ℂ →L[ℂ] ℂ :=
  fun _ n => (if n = 0 then 1 else (1 - (q : ℂ)⁻¹) * z ^ n) •
    ContinuousLinearMap.id ℂ ℂ

theorem p_adic_gl2_spherical (q : ℝ) (hq : 1 < q) (z : ℂ) (hz : ‖z‖ < 1) :
    local_intertwiner Measure.count (gl2ShellKernel q z) 0 =
      cFunction q z • ContinuousLinearMap.id ℂ ℂ := by sorry

-- Test: local_intertwiner.p_adic_gl2_spherical
-- For GL₂(k), unramified χ₁⊗χ₂ and hyperspecial normalization, the nontrivial Weyl integral on the spherical vector equals (1−q⁻¹z)/(1−z), z=χ₁(ϖ)/χ₂(ϖ), in |z|<1.
-- The normalized valuation-shell model calls the actual integral constructor.
example (q : ℝ) (hq : 1 < q) (z : ℂ) (hz : ‖z‖ < 1) :
    local_intertwiner Measure.count (gl2ShellKernel q z) 0 =
      cFunction q z • ContinuousLinearMap.id ℂ ℂ := by sorry


theorem raw_not_unitary  :
    ‖continuedSphericalIntegral 2 (-1) (1 : ℂ)‖ = 3 / 4 ∧
      ‖continuedSphericalIntegral 2 (-1) (1 : ℂ)‖ ≠ ‖(1 : ℂ)‖ := by
  have hc : continuedSphericalIntegral 2 (-1) (1 : ℂ) = ((3 / 4 : ℝ) : ℂ) := by
    norm_num [continuedSphericalIntegral, smul_apply, smul_eq_mul]
  rw [hc]
  norm_num

-- Test: local_intertwiner.raw_not_unitary
-- The continued spherical eigenline, identified with the valuation-shell integral in its chamber, sends one to a vector of norm 3/4 at q=2,z=−1; it does not preserve norm on the unitary axis.
example  :
    ‖continuedSphericalIntegral 2 (-1) (1 : ℂ)‖ = 3 / 4 ∧
      ‖continuedSphericalIntegral 2 (-1) (1 : ℂ)‖ ≠ ‖(1 : ℂ)‖ := by
  have hc : continuedSphericalIntegral 2 (-1) (1 : ℂ) = ((3 / 4 : ℝ) : ℂ) := by
    norm_num [continuedSphericalIntegral, smul_apply, smul_eq_mul]
  rw [hc]
  norm_num

theorem continuedSphericalIntegral_eq_integral (q : ℝ) (hq : 1 < q)
    (z : ℂ) (hz : ‖z‖ < 1) : continuedSphericalIntegral q z =
      local_intertwiner Measure.count (gl2ShellKernel q z) 0 := by sorry

end local_intertwiner

/- The μ-function at a regular point: the forward and opposite local intertwining operators
compose to a scalar, recorded by the structure below. -/
structure ScalarIntertwinerPair (H : Type u) [NormedAddCommGroup H]
    [InnerProductSpace ℂ H] where
  forward : Operator H
  backward : Operator H
  scalar : ℂ
  scalar_comp : backward.comp forward = scalar • ContinuousLinearMap.id ℂ H

def mu_function (D : ScalarIntertwinerPair H) : ℂ := D.scalar⁻¹
namespace mu_function
def rescale (D : ScalarIntertwinerPair H) (c d : ℂ) : ScalarIntertwinerPair H where
  forward := c • D.forward
  backward := d • D.backward
  scalar := c * d * D.scalar
  scalar_comp := by sorry

def noRootPair : ScalarIntertwinerPair H where
  forward := ContinuousLinearMap.id ℂ H
  backward := ContinuousLinearMap.id ℂ H
  scalar := 1
  scalar_comp := by sorry

def sphericalPair (q : ℝ) (z : ℂ) : ScalarIntertwinerPair ℂ where
  forward := local_intertwiner.cFunction q z • ContinuousLinearMap.id ℂ ℂ
  backward := local_intertwiner.cFunction q z⁻¹ • ContinuousLinearMap.id ℂ ℂ
  scalar := local_intertwiner.cFunction q z * local_intertwiner.cFunction q z⁻¹
  scalar_comp := by sorry


theorem measure_change (D : ScalarIntertwinerPair H) (c d : ℝ)
    (hc : 0 < c) (hd : 0 < d) :
    (mu_function (rescale D c d))⁻¹ = (c * d : ℝ) * (mu_function D)⁻¹ := by sorry


theorem no_roots : mu_function (noRootPair (H := H)) = 1 := by sorry
-- Test: mu_function.no_roots
-- For M=G the point integral gives μ=1.
example : mu_function (noRootPair (H := H)) = 1 := by sorry

theorem gl2_spherical (q : ℝ) (hq : 1 < q) (z : ℂ) (hz : z ≠ 0) (hPole : z ≠ 1) :
    (mu_function (sphericalPair q z))⁻¹ =
      local_intertwiner.cFunction q z * local_intertwiner.cFunction q z⁻¹ := by sorry
-- Test: mu_function.gl2_spherical
-- For unramified GL₂, μ⁻¹=c(z)c(z⁻¹), c(z)=(1−q⁻¹z)/(1−z), interpreted meromorphically.
-- The scalar eigenline is linked to the μ construction; the actual local integral
-- supplying cFunction remains a separate local-representation obligation.
example (q : ℝ) (hq : 1 < q) (z : ℂ) (hz : z ≠ 0) (hPole : z ≠ 1) :
    (mu_function (sphericalPair q z))⁻¹ =
      local_intertwiner.cFunction q z * local_intertwiner.cFunction q z⁻¹ := by sorry

theorem measure_scaling :
    (mu_function (rescale (noRootPair (H := ℂ)) 2 2))⁻¹ = 4 ∧
      mu_function (rescale (noRootPair (H := ℂ)) 2 2) ≠ mu_function (noRootPair (H := ℂ)) := by sorry
-- Test: mu_function.measure_scaling
-- Rescaling both opposite measures by 2 changes μ⁻¹ by 4; μ is not measure independent.
example : (mu_function (rescale (noRootPair (H := ℂ)) 2 2))⁻¹ = 4 ∧
    mu_function (rescale (noRootPair (H := ℂ)) 2 2) ≠ mu_function (noRootPair (H := ℂ)) := by sorry
end mu_function


def residue_calculus (f : ℂ → H) (z : ℂ) : H := by sorry
namespace residue_calculus
/-- Cauchy coefficient for a circle enclosing no other polar point. -/
theorem coefficient (f : ℂ → H) (z : ℂ) (rho : ℝ) (hρ : 0 < rho)
    (hf : CommonDenominator Set.univ f)
    (hNoOtherPoles : AnalyticOnNhd ℂ f (Metric.closedBall z rho \ {z})) :
    residue_calculus f z = (1 / (2 * Real.pi) : ℂ) •
      (∫ t in (0 : ℝ)..2 * Real.pi,
        ((rho : ℂ) * Complex.exp (Complex.I * t)) • f (z + rho * Complex.exp (Complex.I * t))) := by sorry

theorem constant_term (f : ℂ → H) (T : H →L[ℂ] K) (z : ℂ)
    (hf : CommonDenominator Set.univ f) :
    residue_calculus (fun s => T (f s)) z = T (residue_calculus f z) := by sorry

/-- Linear transverse coordinate change; the differential contributes its Jacobian. -/
theorem change_coordinate (f : ℂ → H) (a : ℂ) (ha : a ≠ 0)
    (hf : CommonDenominator Set.univ f) :
    residue_calculus (fun z => a • f (a * z)) 0 = residue_calculus f 0 := by sorry

theorem two_simple_poles (v : H) :
    residue_calculus (fun z₁ => residue_calculus (fun z₂ => (z₁ * z₂)⁻¹ • v) 0) 0 = v := by sorry

-- Test: residue_calculus.two_simple_poles
-- The ordered residue of v/(z₁z₂) is v in either coordinate order.
example (v : H) :
    residue_calculus (fun z₁ => residue_calculus (fun z₂ => (z₁ * z₂)⁻¹ • v) 0) 0 = v := by sorry


theorem holomorphic_zero (f : ℂ → H) (hf : AnalyticOnNhd ℂ f Set.univ) (z : ℂ) :
    residue_calculus f z = 0 := by sorry

-- Test: residue_calculus.holomorphic_zero
-- A holomorphic family has zero residue.
example (f : ℂ → H) (hf : AnalyticOnNhd ℂ f Set.univ) (z : ℂ) :
    residue_calculus f z = 0 := by sorry


theorem pole_not_residue (v : H) : residue_calculus (fun z => (z ^ 2)⁻¹ • v) 0 = 0 := by sorry

-- Test: residue_calculus.pole_not_residue
-- The scalar family 1/z² has a pole at zero and residue zero.
example (v : H) : residue_calculus (fun z => (z ^ 2)⁻¹ • v) 0 = 0 := by sorry

end residue_calculus

/-- AL/ET supply the four actual local factor functions and their representation arguments. -/
def shahidi_normalization (Lcross Lrho epsCross epsRho : ℂ → ℂ) (M : ℂ → H →L[ℂ] K)
    (s : ℂ) : H →L[ℂ] K :=
  (Lcross (1 + s) * Lrho (1 + 2 * s) * epsCross s * epsRho (2 * s) /
    (Lcross s * Lrho (2 * s))) • M s
namespace shahidi_normalization
def unramifiedFactor (eigenvalues : List ℂ) (s : ℂ) : ℂ :=
  (eigenvalues.map (fun a => (1 - a * rpowC 2 (-s))⁻¹)).prod
-- A two-dimensional Satake parameter: ∧² has weight αβ; Sym² has α², αβ, β².
def exteriorFactor := unramifiedFactor [6]
def symmetricFactor := unramifiedFactor [4, 6, 9]
/-- `τ* = ι(τ)∨` for a character: the inverse of `τ` composed with the Galois involution `ι`
(the identity for symplectic and orthogonal groups). -/
def conjugateDual {G : Type*} [Group G] (iota : G →* G) (tau : G →* ℂˣ) (g : G) : ℂˣ :=
  (tau (iota g))⁻¹


theorem normalized_eq (Lc Lr ec er : ℂ → ℂ) (M : ℂ → H →L[ℂ] K) (s : ℂ) :
    shahidi_normalization Lc Lr ec er M s =
      (Lc (1 + s) * Lr (1 + 2 * s) * ec s * er (2 * s) / (Lc s * Lr (2 * s))) • M s := by sorry


theorem spherical (Lc Lr ec er : ℂ → ℂ) (M : ℂ → Operator H)
    (v : H) (s : ℂ) (c : ℂ)
    (hEigen : M s v = c • v)
    (hNormalize : (Lc (1 + s) * Lr (1 + 2 * s) * ec s * er (2 * s) /
      (Lc s * Lr (2 * s))) * c = 1) :
    shahidi_normalization Lc Lr ec er M s v = v := by sorry

-- Test: shahidi_normalization.spherical
-- If the spherical vector has the supplied raw eigenvalue and the actual local-factor normalizer times that eigenvalue is one, the shahidi_normalization operator fixes it. This is not asserted for an arbitrary raw operator.
example (Lc Lr ec er : ℂ → ℂ) (M : ℂ → Operator H)
    (v : H) (s : ℂ) (c : ℂ)
    (hEigen : M s v = c • v)
    (hNormalize : (Lc (1 + s) * Lr (1 + 2 * s) * ec s * er (2 * s) /
      (Lc s * Lr (2 * s))) * c = 1) :
    shahidi_normalization Lc Lr ec er M s v = v := by sorry


/-- Distinct functor tags for the even/odd orthogonal local factors. -/
inductive OrthogonalFactor | exteriorSquare | symmetricSquare

theorem orthogonal_parity  :
    shahidi_normalization (fun _ => 1) exteriorFactor (fun _ => 1) (fun _ => 1)
      (fun _ => ContinuousLinearMap.id ℂ ℂ) 3 (1 : ℂ) ≠
    shahidi_normalization (fun _ => 1) symmetricFactor (fun _ => 1) (fun _ => 1)
      (fun _ => ContinuousLinearMap.id ℂ ℂ) 3 (1 : ℂ) := by sorry

-- Test: shahidi_normalization.orthogonal_parity
-- For the two-dimensional Satake parameter (2,3), exterior-square weight 6 and symmetric-square weights 4,6,9 give different actual normalized operators at a regular parameter.
example  :
    shahidi_normalization (fun _ => 1) exteriorFactor (fun _ => 1) (fun _ => 1)
      (fun _ => ContinuousLinearMap.id ℂ ℂ) 3 (1 : ℂ) ≠
    shahidi_normalization (fun _ => 1) symmetricFactor (fun _ => 1) (fun _ => 1)
      (fun _ => ContinuousLinearMap.id ℂ ℂ) 3 (1 : ℂ) := by sorry


theorem unitary_dual {G : Type*} [Group G] (tau : G →* ℂˣ)
    (hUnitary : ∀ g, star (tau g) * tau g = 1) (g : G) :
    conjugateDual (MonoidHom.id G) tau g = star (tau g) := by sorry

-- Test: shahidi_normalization.unitary_dual
-- For a unitary character with trivial involution, the dual character is the complex conjugate.
example {G : Type*} [Group G] (tau : G →* ℂˣ)
    (hUnitary : ∀ g, star (tau g) * tau g = 1) (g : G) :
    conjugateDual (MonoidHom.id G) tau g = star (tau g) := by sorry

end shahidi_normalization


/-- Regular invertible slice of the function-field family. The source integral,
continuation, rationality and Weyl transport must provide this data; it is not
asserted for an arbitrary family of continuous linear maps. -/
structure RegularFunctionFieldFamily (P : Type*) (H : Type u)
    [NormedAddCommGroup H] [InnerProductSpace ℂ H] where
  map : P → P → ℂˣ → H ≃L[ℂ] H
  identity : ∀ P z, (map P P z).toContinuousLinearMap = ContinuousLinearMap.id ℂ H
  cocycle : ∀ S Q P z, (map S Q z).toContinuousLinearMap.comp
    (map Q P z).toContinuousLinearMap = (map S P z).toContinuousLinearMap

def operator_intertwiner_family {P : Type*} (D : RegularFunctionFieldFamily P H)
    (Q P : P) (z : ℂˣ) : Operator H := (D.map Q P z).toContinuousLinearMap
namespace operator_intertwiner_family

def integralIntertwiner {P : Type*} (D : RegularFunctionFieldFamily P H) := operator_intertwiner_family D

theorem continueOperator {P : Type*} (D : RegularFunctionFieldFamily P H) (S Q P : P) (z : ℂˣ) :
    (operator_intertwiner_family D S Q z).comp (operator_intertwiner_family D Q P z) = operator_intertwiner_family D S P z := by sorry

def ratioFamily {P : Type*} (D : RegularFunctionFieldFamily P H) (Q P : P)
    (z mu : ℂˣ) : Operator H :=
  (D.map Q P z).symm.toContinuousLinearMap.comp (operator_intertwiner_family D Q P (z / mu))

theorem test1 {P : Type*} (D : RegularFunctionFieldFamily P H) (P : P) (z : ℂˣ) :
    operator_intertwiner_family D P P z = ContinuousLinearMap.id ℂ H := by sorry

-- Test: operator_intertwiner_family.test1
-- The actual regular-point family constructor on a same-parabolic input is the identity, using its typed identity data.
example {P : Type*} (D : RegularFunctionFieldFamily P H) (P : P) (z : ℂˣ) :
    operator_intertwiner_family D P P z = ContinuousLinearMap.id ℂ H := by sorry


theorem test2 {P : Type*} (D : RegularFunctionFieldFamily P H) (Q P : P) (z : ℂˣ) :
    ratioFamily D Q P z 1 = ContinuousLinearMap.id ℂ H := by sorry

-- Test: operator_intertwiner_family.test2
-- The ratio family built from the inverse regular intertwiner and operator_intertwiner_family at λ/μ gives the identity at μ=1.
example {P : Type*} (D : RegularFunctionFieldFamily P H) (Q P : P) (z : ℂˣ) :
    ratioFamily D Q P z 1 = ContinuousLinearMap.id ℂ H := by sorry


theorem test3 {P : Type*} (D : RegularFunctionFieldFamily P H) (S Q P : P) (z : ℂˣ) :
    (operator_intertwiner_family D S Q z).comp (operator_intertwiner_family D Q P z) = operator_intertwiner_family D S P z := by sorry

-- Test: operator_intertwiner_family.test3
-- Composition of two members of the typed regular family agrees with its composed member. The source integral, continuation and Weyl transport must supply the identity/cocycle data.
example {P : Type*} (D : RegularFunctionFieldFamily P H) (S Q P : P) (z : ℂˣ) :
    (operator_intertwiner_family D S Q z).comp (operator_intertwiner_family D Q P z) = operator_intertwiner_family D S P z := by sorry

end operator_intertwiner_family

end Intertwiners
end TauCeti.AutomorphicSpectral

namespace TauCeti.AutomorphicSpectral
universe u v w

theorem completed_eisenstein_fourier (B : SpecialFunctions) (z : UpperHalfPlane) (s : ℂ) (hs : 1 < s.re) :
    completed_eisenstein B z s = completed_eisenstein.constantTerm B z.im s + 2 * Real.sqrt z.im *
      ∑' n : ℤ, if n = 0 then 0 else rpowC |(n : ℝ)| (s - 1 / 2) *
        divisorSigma (1 - 2 * s) n.natAbs * B.besselK (s - 1 / 2)
          (2 * Real.pi * |(n : ℝ)| * z.im) * phase (n * z.re) := by sorry

theorem completed_eisenstein_continuation (B : SpecialFunctions) (z : UpperHalfPlane) :
    CommonDenominator Set.univ (completed_eisenstein B z) ∧
      (∀ s : ℂ, ∀ᶠ w in 𝓝[≠] s, completed_eisenstein B z w = completed_eisenstein B z (1 - w)) ∧
      scalarCoefficient (completed_eisenstein B z) 0 (-1) = -1 / 2 ∧
        scalarCoefficient (completed_eisenstein B z) 1 (-1) = 1 / 2 := by sorry

section ModularResolvent
variable {H : Type u} [NormedAddCommGroup H] [InnerProductSpace ℂ H] [CompleteSpace H]
/-- Partial-domain inverse of the imported positive modular Laplacian. -/
def resolvent_kernel (D : Submodule ℂ H) (lap : D →ₗ[ℂ] H) (s : ℂ) : Operator H :=
  -TauCeti.LinearPMap.resolvent (⟨D, lap⟩ : H →ₗ.[ℂ] H) (s * (1 - s))
namespace resolvent_kernel
def scalarLaplacian (eigenvalue : ℂ) : (⊤ : Submodule ℂ ℂ) →ₗ[ℂ] ℂ :=
  eigenvalue • (⊤ : Submodule ℂ ℂ).subtype


omit [CompleteSpace H] in
theorem inverseEquation (D : Submodule ℂ H) (lap : D →ₗ[ℂ] H) (s : ℂ)
    (hOff : s * (1 - s) ∈ TauCeti.LinearPMap.resolventSet (⟨D, lap⟩ : H →ₗ.[ℂ] H)) :
    ∀ v : H, ∃ hD : resolvent_kernel D lap s v ∈ D,
      lap ⟨resolvent_kernel D lap s v, hD⟩ - (s * (1 - s)) • resolvent_kernel D lap s v = v := by
  intro v
  have hv := TauCeti.LinearPMap.resolvent_mem_domain hOff v
  refine ⟨D.neg_mem hv, ?_⟩
  change lap (-⟨TauCeti.LinearPMap.resolvent (⟨D, lap⟩ : H →ₗ.[ℂ] H)
    (s * (1 - s)) v, hv⟩) - (s * (1 - s)) •
      (-TauCeti.LinearPMap.resolvent (⟨D, lap⟩ : H →ₗ.[ℂ] H) (s * (1 - s)) v) = v
  have hEquation := TauCeti.LinearPMap.smul_sub_apply_resolvent hOff v
  change (s * (1 - s)) •
    TauCeti.LinearPMap.resolvent (⟨D, lap⟩ : H →ₗ.[ℂ] H) (s * (1 - s)) v -
      lap ⟨TauCeti.LinearPMap.resolvent (⟨D, lap⟩ : H →ₗ.[ℂ] H)
        (s * (1 - s)) v, hv⟩ = v at hEquation
  simpa only [map_neg, smul_neg, sub_eq_add_neg, neg_neg, add_comm] using hEquation


/-- Both shifts must have native bounded inverses;
this identity precedes construction of a spatial kernel representative. -/
theorem operatorAdjoint (D : Submodule ℂ H) (lap : D →ₗ[ℂ] H)
    (hSelf : IsSelfAdjoint (⟨D, lap⟩ : H →ₗ.[ℂ] H)) (s : ℂ)
    (hOff : s * (1 - s) ∈ TauCeti.LinearPMap.resolventSet (⟨D, lap⟩ : H →ₗ.[ℂ] H))
    (hOffStar : (star s) * (1 - star s) ∈
      TauCeti.LinearPMap.resolventSet (⟨D, lap⟩ : H →ₗ.[ℂ] H)) :
    (resolvent_kernel D lap s).adjoint = resolvent_kernel D lap (star s) := by
  ext x
  apply ext_inner_left ℂ
  intro y
  rw [ContinuousLinearMap.adjoint_inner_right]
  obtain ⟨hu, hy⟩ := inverseEquation D lap s hOff y
  obtain ⟨hv, hx⟩ := inverseEquation D lap (star s) hOffStar x
  have hSym := hSelf.isFormalAdjoint
    ⟨resolvent_kernel D lap s y, hu⟩ ⟨resolvent_kernel D lap (star s) x, hv⟩
  change inner ℂ (lap ⟨resolvent_kernel D lap s y, hu⟩) (resolvent_kernel D lap (star s) x) =
    inner ℂ (resolvent_kernel D lap s y) (lap ⟨resolvent_kernel D lap (star s) x, hv⟩) at hSym
  calc
    inner ℂ (resolvent_kernel D lap s y) x =
        inner ℂ (resolvent_kernel D lap s y)
          (lap ⟨resolvent_kernel D lap (star s) x, hv⟩ -
            ((star s) * (1 - star s)) • resolvent_kernel D lap (star s) x) := by rw [hx]
    _ = inner ℂ (lap ⟨resolvent_kernel D lap s y, hu⟩ -
          (s * (1 - s)) • resolvent_kernel D lap s y) (resolvent_kernel D lap (star s) x) := by
      simp only [inner_sub_right, inner_sub_left, inner_smul_right,
        inner_smul_left, starRingEnd_apply, star_mul, star_sub, star_one, hSym]
      ring
    _ = inner ℂ y (resolvent_kernel D lap (star s) x) := by rw [hy]

omit [CompleteSpace H] in
/-- A specified closed reducing complement C has its own partial Laplacian lapC. No arbitrary projection implies that fact. The extension at s0 is this complement inverse, not a totalized full resolvent
evaluated on its spectrum. This lemma applies to genuine spectral gaps. At DIT's
embedded cuspidal eigenvalues the continued kernel needs different weighted/test
spaces: removing the eigenline does not remove the continuous L² spectrum. -/
theorem restrictedResolvent (C : Submodule ℂ H) [CompleteSpace C]
    (DC : Submodule ℂ C) (lapC : DC →ₗ[ℂ] C) (s₀ : ℂ)
    (hOff : s₀ * (1 - s₀) ∈
      TauCeti.LinearPMap.resolventSet (⟨DC, lapC⟩ : C →ₗ.[ℂ] C)) :
    ∃ r : ℝ, 0 < r ∧ AnalyticOnNhd ℂ (resolvent_kernel DC lapC) (Metric.ball s₀ r) := by
  have hPoly : Continuous (fun s : ℂ => s * (1 - s)) := by fun_prop
  have hOpen := (TauCeti.LinearPMap.isOpen_resolventSet
    (⟨DC, lapC⟩ : C →ₗ.[ℂ] C)).preimage hPoly
  obtain ⟨r, hr, hBall⟩ := Metric.isOpen_iff.mp hOpen s₀ hOff
  refine ⟨r, hr, ?_⟩
  intro s hs
  have hParameter : AnalyticAt ℂ (fun s : ℂ => s * (1 - s)) s := by fun_prop
  exact
    ((TauCeti.LinearPMap.analyticAt_resolvent (hBall hs)).comp
      (f := fun s : ℂ => s * (1 - s)) hParameter).neg

theorem test1 (s : ℂ) (hs : s ≠ 0) (hs' : s ≠ 1) :
    resolvent_kernel ⊤ (scalarLaplacian 0) s (1 : ℂ) = -(s * (1 - s))⁻¹ := by sorry

-- Test: resolvent_kernel.test1
-- On the constant eigenline, the actual resolvent of the scalar Laplacian has value −1/[s(1−s)] away from its poles.
example (s : ℂ) (hs : s ≠ 0) (hs' : s ≠ 1) :
    resolvent_kernel ⊤ (scalarLaplacian 0) s (1 : ℂ) = -(s * (1 - s))⁻¹ := by sorry


theorem test2 (t : ℝ) :
    ¬ (∀ v : ℂ, ∃! u : (⊤ : Submodule ℂ ℂ),
      scalarLaplacian (1 / 4 + t ^ 2) u -
        ((1 / 2 + t * Complex.I) * (1 - (1 / 2 + t * Complex.I))) • u.val = v) := by sorry

-- Test: resolvent_kernel.test2
-- At the parameter 1/2+it for the scalar Laplacian eigenvalue 1/4+t², its defining inverse equation has no solution for every right-hand side; a bounded inverse cannot be used there.
example (t : ℝ) :
    ¬ (∀ v : ℂ, ∃! u : (⊤ : Submodule ℂ ℂ),
      scalarLaplacian (1 / 4 + t ^ 2) u -
        ((1 / 2 + t * Complex.I) * (1 - (1 / 2 + t * Complex.I))) • u.val = v) := by sorry


theorem test3 (s : ℂ) (hs : s ≠ 1 / 2) :
    resolvent_kernel ⊤ (scalarLaplacian (1 / 4)) s (1 : ℂ) = ((s - 1 / 2) ^ 2)⁻¹ := by sorry

-- Test: resolvent_kernel.test3
-- The actual scalar resolvent on the eigenline of eigenvalue 1/4 is (s−1/2)^(−2), so the parameter pole is double at the threshold.
example (s : ℂ) (hs : s ≠ 1 / 2) :
    resolvent_kernel ⊤ (scalarLaplacian (1 / 4)) s (1 : ℂ) = ((s - 1 / 2) ^ 2)⁻¹ := by sorry

end resolvent_kernel
end ModularResolvent


def automorphic_green (N : ℕ) (z z' : UpperHalfPlane) (s : ℂ) : ℂ := by sorry

/-- Remove the constant residue before taking the limit. No harmonicity is asserted. -/
def greenFinitePart (N : ℕ) (z z' : UpperHalfPlane) : ℂ :=
  Filter.limUnder (𝓝[≠] (1 : ℂ)) (fun s => automorphic_green N z z' s -
    scalarCoefficient (automorphic_green N z z') 1 (-1) / (s - 1))
namespace automorphic_green

theorem initial_sum (N : ℕ) (hN : 1 ≤ N) (z z' : UpperHalfPlane) (s : ℂ)
    (hs : 1 < s.re) (hOff : ∀ j : (effectiveModularGroup N).Index, z ≠ (effectiveModularGroup N).orbit j z') :
    automorphic_green N z z' s = ∑' j : (effectiveModularGroup N).Index,
      point_pair_invariant s z ((effectiveModularGroup N).orbit j z') ∧
      Summable (fun j : (effectiveModularGroup N).Index => ‖point_pair_invariant s z ((effectiveModularGroup N).orbit j z')‖) := by sorry

theorem symmetry (N : ℕ) (hN : 1 ≤ N) (z z' : UpperHalfPlane) (s : ℂ)
    (hOff : ∀ j : (effectiveModularGroup N).Index, z ≠ (effectiveModularGroup N).orbit j z') :
    automorphic_green N z z' s = automorphic_green N z' z s := by sorry

/-- The Gross–Zagier Laplacian `Δ_GZ = -Δ₀` in coordinates (AS.1.15a). -/
theorem eigenfunction
    (N : ℕ) (hN : 1 ≤ N) (z z' : UpperHalfPlane) (s : ℂ) (hs : 1 < s.re)
    (hOff : ∀ j : (effectiveModularGroup N).Index, z ≠ (effectiveModularGroup N).orbit j z') :
    gzLaplacian (fun w => automorphic_green N w z' s) z = s * (s - 1) * automorphic_green N z z' s := by sorry

theorem full_level_residue (z z' : UpperHalfPlane)
    (hOff : ∀ j : (effectiveModularGroup 1).Index, z ≠ (effectiveModularGroup 1).orbit j z') :
    scalarCoefficient (automorphic_green 1 z z') 1 (-1) = -12 := by sorry

-- Test: automorphic_green.full_level_residue
-- At N=1 the s=1 residue is −12, with hyperbolic quotient volume π/3.
example (z z' : UpperHalfPlane)
    (hOff : ∀ j : (effectiveModularGroup 1).Index, z ≠ (effectiveModularGroup 1).orbit j z') :
    scalarCoefficient (automorphic_green 1 z z') 1 (-1) = -12 := by sorry


theorem point_pair_symmetry (s : ℂ) (z z' : UpperHalfPlane) : point_pair_invariant s z z' = point_pair_invariant s z' z := by sorry

-- Test: automorphic_green.point_pair_symmetry
-- For the identity summand g_s(z,z′)=g_s(z′,z), since the point-pair invariant is symmetric.
example (s : ℂ) (z z' : UpperHalfPlane) : point_pair_invariant s z z' = point_pair_invariant s z' z := by sorry


/-- Same concrete Laplacian and off-diagonal convention as `eigenfunction`. -/
theorem finite_part_not_harmonic
    (z z' : UpperHalfPlane)
    (hOff : ∀ j : (effectiveModularGroup 1).Index, z ≠ (effectiveModularGroup 1).orbit j z') :
    gzLaplacian (fun w => greenFinitePart 1 w z') z = -12 ∧ gzLaplacian (fun w => greenFinitePart 1 w z') z ≠ 0 := by sorry

-- Test: automorphic_green.finite_part_not_harmonic
-- At N=1 the finite part after subtracting −12/(s−1) has Δ_GZ=−12≠0, so it is not harmonic.
example (z z' : UpperHalfPlane)
    (hOff : ∀ j : (effectiveModularGroup 1).Index, z ≠ (effectiveModularGroup 1).orbit j z') :
    gzLaplacian (fun w => greenFinitePart 1 w z') z = -12 ∧ gzLaplacian (fun w => greenFinitePart 1 w z') z ≠ 0 := by sorry

end automorphic_green

theorem green_kernel_continuation (N : ℕ) (hN : 1 ≤ N) (z z' : UpperHalfPlane)
    (hOff : ∀ j : (effectiveModularGroup N).Index, z ≠ (effectiveModularGroup N).orbit j z') :
    scalarCoefficient (automorphic_green N z z') 1 (-1) =
      -12 / N * ∏ p ∈ N.primeFactors, (1 + (p : ℂ)⁻¹)⁻¹ := by sorry
end TauCeti.AutomorphicSpectral

namespace TauCeti.AutomorphicSpectral
universe u v w
/-- The GL_n isobaric representation, with specified cuspidal Langlands data. -/
def isobaric_sum {Groups : ℕ → Type u} [∀ n, Group (Groups n)] {Places : Type v}
    {I : Type w} [Fintype I] (pi : I → GLAutomorphicDatum Groups Places) :
    GLAutomorphicDatum Groups Places := by sorry
namespace isobaric_sum

theorem rank {Groups : ℕ → Type u} [∀ n, Group (Groups n)] {Places : Type v}
    {I : Type w} [Fintype I] (pi : I → GLAutomorphicDatum Groups Places) :
    (isobaric_sum pi).rank = ∑ i, (pi i).rank := by sorry

theorem satake_union {Groups : ℕ → Type u} [∀ n, Group (Groups n)] {Places : Type v}
    {I : Type w} [Fintype I] (pi : I → GLAutomorphicDatum Groups Places) (place : Places) :
    (isobaric_sum pi).satake place = ∑ i, (pi i).satake place := by sorry

theorem standard_L_product {Groups : ℕ → Type u} [∀ n, Group (Groups n)] {Places : Type v}
    {I : Type w} [Fintype I] (pi : I → GLAutomorphicDatum Groups Places) (s : ℂ) :
    (isobaric_sum pi).standardL s = ∏ i, (pi i).standardL s := by sorry

theorem permutation {Groups : ℕ → Type u} [∀ n, Group (Groups n)] {Places : Type v}
    {I : Type w} [Fintype I] (pi : I → GLAutomorphicDatum Groups Places) (e : Equiv.Perm I) :
    GLAutomorphicEquivalent (isobaric_sum (pi ∘ e)) (isobaric_sum pi) := by sorry

theorem single {Groups : ℕ → Type u} [∀ n, Group (Groups n)] {Places : Type v}
    (pi : GLAutomorphicDatum Groups Places) :
    GLAutomorphicEquivalent (isobaric_sum (fun _ : Unit => pi)) pi := by sorry

-- Test: isobaric_sum.single
-- The isobaric sum of a single cusp π is π.
example {Groups : ℕ → Type u} [∀ n, Group (Groups n)] {Places : Type v}
    (pi : GLAutomorphicDatum Groups Places) :
    GLAutomorphicEquivalent (isobaric_sum (fun _ : Unit => pi)) pi := by sorry


theorem two_characters {Groups : ℕ → Type u} [∀ n, Group (Groups n)] {Places : Type v}
    (chi : Fin 2 → GLAutomorphicDatum Groups Places) (place : Places) (a b T : ℂ)
    (hA : (chi 0).satake place = {a}) (hB : (chi 1).satake place = {b}) :
    (((isobaric_sum chi).satake place).map (fun z => 1 - z * T)).prod =
      (1 - a * T) * (1 - b * T) := by sorry

-- Test: isobaric_sum.two_characters
-- For unramified characters χ₁,χ₂ the GL₂ Satake polynomial is (1−χ₁(ϖ)T)(1−χ₂(ϖ)T).
example {Groups : ℕ → Type u} [∀ n, Group (Groups n)] {Places : Type v}
    (chi : Fin 2 → GLAutomorphicDatum Groups Places) (place : Places) (a b T : ℂ)
    (hA : (chi 0).satake place = {a}) (hB : (chi 1).satake place = {b}) :
    (((isobaric_sum chi).satake place).map (fun z => 1 - z * T)).prod =
      (1 - a * T) * (1 - b * T) := by sorry


/-- The output acts on GL_2; a Hilbert direct sum of the two GL_1 actions acts on GL_1. -/
theorem not_hilbert_sum {Groups : ℕ → Type u} [∀ n, Group (Groups n)] {Places : Type v}
    (chi : Fin 2 → GLAutomorphicDatum Groups Places) (hRank : ∀ i, (chi i).rank = 1) :
    (isobaric_sum chi).rank = 2 ∧ (isobaric_sum chi).rank ≠ 1 := by sorry

-- Test: isobaric_sum.not_hilbert_sum
-- π₁⊕π₂ is not the isobaric GL_{n₁+n₂} representation: it does not even carry the same group action.
example {Groups : ℕ → Type u} [∀ n, Group (Groups n)] {Places : Type v}
    (chi : Fin 2 → GLAutomorphicDatum Groups Places) (hRank : ∀ i, (chi i).rank = 1) :
    (isobaric_sum chi).rank = 2 ∧ (isobaric_sum chi).rank ≠ 1 := by sorry

end isobaric_sum

end TauCeti.AutomorphicSpectral

/-! ## AS.3 — Truncation, Maass–Selberg relations and wave packets -/

namespace TauCeti.AutomorphicSpectral
universe u v w
section Cones
variable {ι : Type u} [Fintype ι]
def truncation_cones {r : ℕ} (roots : Fin r → Height ι →ₗ[ℝ] ℝ) (H : Height ι) : ℂ :=
  if ∀ i, 0 < roots i H then 1 else 0

def theta {r : ℕ} (coroots : Fin r → Height ι) (volume : ℝ) (nu : Parameter ι) : ℂ :=
  (volume : ℂ)⁻¹ * ∏ i, Pairing nu (coroots i)
namespace truncation_cones
def a2Roots : Fin 2 → Height (Fin 2) →ₗ[ℝ] ℝ := fun i => LinearMap.proj i
def a2Weights : Fin 2 → Height (Fin 2) →ₗ[ℝ] ℝ :=
  ![(2 / 3 : ℝ) • LinearMap.proj 0 + (1 / 3 : ℝ) • LinearMap.proj 1,
    (1 / 3 : ℝ) • LinearMap.proj 0 + (2 / 3 : ℝ) • LinearMap.proj 1]


theorem rank_zero (roots : Fin 0 → Height ι →ₗ[ℝ] ℝ) (coroots : Fin 0 → Height ι)
    (H : Height ι) (nu : Parameter ι) : truncation_cones roots H = 1 ∧ theta coroots 1 nu = 1 := by sorry


theorem theta_homogeneous {r : ℕ} (coroots : Fin r → Height ι) (vol : ℝ)
    (nu : Parameter ι) (t : ℂ) : theta coroots vol (t • nu) = t ^ r * theta coroots vol nu := by sorry

theorem rank_one (a : Height ι) (vol : ℝ) (nu : Parameter ι) :
    theta (fun _ : Fin 1 => a) vol nu = Pairing nu a / vol := by sorry

-- Test: truncation_cones.rank_one
-- For one coroot α∨, θ(ν)=ν(α∨)/vol(𝔞/ℤα∨).
example (a : Height ι) (vol : ℝ) (nu : Parameter ι) :
    theta (fun _ : Fin 1 => a) vol nu = Pairing nu a / vol := by sorry


theorem boundary {r : ℕ} (roots : Fin r → Height ι →ₗ[ℝ] ℝ) (H : Height ι)
    (i : Fin r) (hi : roots i H = 0) : truncation_cones roots H = 0 := by sorry

-- Test: truncation_cones.boundary
-- At α(H)=0 the strict root-cone indicator is 0.
example {r : ℕ} (roots : Fin r → Height ι →ₗ[ℝ] ℝ) (H : Height ι)
    (i : Fin r) (hi : roots i H = 0) : truncation_cones roots H = 0 := by sorry


/-- Type A₂: root-coordinate inverse Cartan matrix makes the two cones distinct. -/
theorem a2_distinction  :
    truncation_cones a2Roots ![-1, 3] = 0 ∧ truncation_cones a2Weights ![-1, 3] = 1 := by sorry

-- Test: truncation_cones.a2_distinction
-- The named A₂ simple-root cutoff is zero at root coordinates (−1,3), while the cutoff for the two inverse-Cartan fundamental weights is one.
example  :
    truncation_cones a2Roots ![-1, 3] = 0 ∧ truncation_cones a2Weights ![-1, 3] = 1 := by sorry

end truncation_cones
end Cones

structure TruncationData (X : Type u) (ι : Type v) [Fintype ι] where
  Proper : Type u
  finite : Fintype Proper
  Cosets : Proper → Type u
  countable : ∀ P, Countable (Cosets P)
  rank : Proper → ℕ
  constantTerm : Proper → (X → ℂ) →ₗ[ℂ] (X → ℂ)
  translate : ∀ P, Cosets P → X → X
  height : Proper → X → Height ι
  cutoff : Proper → Height ι → ℂ
attribute [instance] TruncationData.finite TruncationData.countable

/-- The whole-group term is explicitly f. -/
def arthur_truncation {X : Type u} {ι : Type v} [Fintype ι]
    (D : TruncationData X ι) (T : Height ι) (f : X → ℂ) (x : X) : ℂ :=
  f x + ∑ P, (-1 : ℂ) ^ D.rank P * ∑' j : D.Cosets P,
    D.constantTerm P f (D.translate P j x) *
      D.cutoff P (D.height P (D.translate P j x) - T)
namespace arthur_truncation
/-- Single embedded cusp strip. Global reduction theory identifies this datum with
SL₂ truncation only for sufficiently large Y on the chosen fundamental domain. -/
def cuspStripData : TruncationData ℝ Unit where
  Proper := Unit
  finite := inferInstance
  Cosets := fun _ => Unit
  countable := fun _ => inferInstance
  rank := fun _ => 1
  constantTerm := fun _ => LinearMap.id
  translate := fun _ _ y => y
  height := fun _ y _ => Real.log y
  cutoff := fun _ H => if 0 < H () then 1 else 0

variable {X : Type u} {ι : Type v} [Fintype ι] (D : TruncationData X ι)

theorem cusp_fixed (T : Height ι) (f : X → ℂ) (hcusp : ∀ P, D.constantTerm P f = 0) :
    arthur_truncation D T f = f := by sorry

/-- Local finiteness is the regular-T reduction-theory statement below; arbitrary infinite
summation linearity without convergence is not being asserted. -/
theorem linear (T : Height ι) (f g : X → ℂ) (a b : ℂ)
    (hFinite : ∀ P : D.Proper, ∀ x : X,
      Set.Finite {j : D.Cosets P | D.cutoff P (D.height P (D.translate P j x) - T) ≠ 0}) :
    arthur_truncation D T (a • f + b • g) = a • arthur_truncation D T f + b • arthur_truncation D T g := by sorry


theorem cusp (T : Height ι) (f : X → ℂ) (hcusp : ∀ P, D.constantTerm P f = 0) :
    arthur_truncation D T f = f := by sorry

-- Test: arthur_truncation.cusp
-- A cuspidal automorphic form is unchanged, not annihilated, by Λᵀ.
example (T : Height ι) (f : X → ℂ) (hcusp : ∀ P, D.constantTerm P f = 0) :
    arthur_truncation D T f = f := by sorry


/-- Standard cusp strip specialization with the strict y>Y cutoff. -/
theorem sl2_constant (y Y : ℝ) (hy : 0 < y) (hY : 0 < Y) :
    arthur_truncation cuspStripData (fun _ => Real.log Y) (fun _ => 1) y =
      if y ≤ Y then 1 else 0 := by sorry

-- Test: arthur_truncation.sl2_constant
-- The actual one-cusp strip truncation datum at T=log Y sends the constant function one to the indicator y≤Y. Global identification with SL₂ truncation uses the sufficiently-large-Y reduction theorem.
example (y Y : ℝ) (hy : 0 < y) (hY : 0 < Y) :
    arthur_truncation cuspStripData (fun _ => Real.log Y) (fun _ => 1) y =
      if y ≤ Y then 1 else 0 := by sorry


theorem rank_zero [IsEmpty D.Proper] (T : Height ι) (f : X → ℂ) : arthur_truncation D T f = f := by sorry

-- Test: arthur_truncation.rank_zero
-- When G has no proper rational parabolic, Λᵀ=id.
example [IsEmpty D.Proper] (T : Height ι) (f : X → ℂ) : arthur_truncation D T f = f := by sorry

end arthur_truncation


section Gram
variable {H : Type u} [NormedAddCommGroup H] [InnerProductSpace ℂ H] [CompleteSpace H]


end Gram

section Packets
variable {X : Type u} [MeasurableSpace X]
variable {V : Type v} [NormedAddCommGroup V] [NormedSpace ℂ V]
variable {H : Type w} [NormedAddCommGroup H] [InnerProductSpace ℂ H] [CompleteSpace H]

/-- Individual E(λ) are not vectors in the untruncated global L² space. -/
def eisenstein_wave_packet (μ : Measure X) (E : X → V →L[ℂ] H) (F : X → V) : H :=
  ∫ x, E x (F x) ∂μ
namespace eisenstein_wave_packet
local instance boolMeasurable : MeasurableSpace Bool := ⊤
def twoWeylMeasure : Measure Bool := (2 : ENNReal)⁻¹ • (Measure.dirac true + Measure.dirac false)


theorem linear (μ : Measure X) (E : X → V →L[ℂ] H) (F G : X → V) (a b : ℂ)
    (hF : Integrable (fun x => E x (F x)) μ) (hG : Integrable (fun x => E x (G x)) μ) :
    eisenstein_wave_packet μ E (a • F + b • G) = a • eisenstein_wave_packet μ E F +
      b • eisenstein_wave_packet μ E G := by sorry

theorem right_equivariant (μ : Measure X) (E : X → V →L[ℂ] H)
    (R : Operator H) (I : X → Operator V) (hI : ∀ x, R.comp (E x) = (E x).comp (I x))
    (F : X → V) (hF : Integrable (fun x => E x (F x)) μ) :
    R (eisenstein_wave_packet μ E F) = eisenstein_wave_packet μ E (fun x => I x (F x)) := by sorry

theorem truncate_integral (μ : Measure X) (E : X → V →L[ℂ] H) (F : X → V)
    (T : Operator H) (hF : Integrable (fun x => E x (F x)) μ) :
    T (eisenstein_wave_packet μ E F) = eisenstein_wave_packet μ (fun x => T.comp (E x)) F := by sorry

theorem zero (μ : Measure X) (E : X → V →L[ℂ] H) : eisenstein_wave_packet μ E 0 = 0 := by sorry

-- Test: eisenstein_wave_packet.zero
-- Zero sections give zero packets.
example (μ : Measure X) (E : X → V →L[ℂ] H) : eisenstein_wave_packet μ E 0 = 0 := by sorry


theorem rank_zero (v : H) : eisenstein_wave_packet (Measure.dirac ())
    (fun _ : Unit => ContinuousLinearMap.id ℂ H) (fun _ => v) = v := by sorry

-- Test: eisenstein_wave_packet.rank_zero
-- For P=G on [G]¹ the zero-dimensional integral gives the inducing vector.
example (v : H) : eisenstein_wave_packet (Measure.dirac ())
    (fun _ : Unit => ContinuousLinearMap.id ℂ H) (fun _ => v) = v := by sorry


theorem weyl_overcount (v : H) :
    eisenstein_wave_packet twoWeylMeasure
      (fun _ : Bool => ContinuousLinearMap.id ℂ H) (fun _ => v) = v ∧
    eisenstein_wave_packet (Measure.dirac true + Measure.dirac false)
      (fun _ : Bool => ContinuousLinearMap.id ℂ H) (fun _ => v) = 2 • v := by sorry

-- Test: eisenstein_wave_packet.weyl_overcount
-- The packet constructor over a two-element Weyl orbit with measure half counting sends a compatible constant section v to v; omitting the denominator gives 2v.
example (v : H) :
    eisenstein_wave_packet twoWeylMeasure
      (fun _ : Bool => ContinuousLinearMap.id ℂ H) (fun _ => v) = v ∧
    eisenstein_wave_packet (Measure.dirac true + Measure.dirac false)
      (fun _ : Bool => ContinuousLinearMap.id ℂ H) (fun _ => v) = 2 • v := by sorry

end eisenstein_wave_packet

end Packets

end TauCeti.AutomorphicSpectral

namespace TauCeti.AutomorphicSpectral
universe u v w
/-- Determinant-degree block projection, with a partition encoded by a finite fibre map. -/
def gln_relative_roots {I J : Type*} [Fintype I] [Fintype J] [DecidableEq J]
    (block : I → J) (H : I → ℝ) : J → ℝ := fun j => ∑ i ∈ Finset.univ.filter (fun i => block i = j), H i
namespace gln_relative_roots
def relativeProjection {r : ℕ} (n : Fin r → ℕ) (H : Fin r → ℝ) : Fin r → ℝ :=
  fun i => H i - (n i : ℝ) / (∑ j, (n j : ℝ)) * ∑ j, H j
def oneTwoBlocks : Fin 3 → Fin 2 := ![0, 1, 1]
def dualBlockProjection (H : Fin 3 → ℝ) : Fin 2 → ℝ :=
  fun i => gln_relative_roots oneTwoBlocks H i / (![1, 2] i : ℝ)

def blockProjection {I J : Type*} [Fintype I] [Fintype J] [DecidableEq J]
    (block : I → J) := gln_relative_roots block

def relativeRoot (ni nj : ℕ) (H : Fin 2 → ℝ) : ℝ := H 0 / ni - H 1 / nj

def fundamentalWeight {r : ℕ} (n : Fin r → ℕ) (j : ℕ) (H : Fin r → ℝ) : ℝ :=
  (∑ i ∈ Finset.univ.filter (fun i => i.val < j), H i) -
    (∑ i ∈ Finset.univ.filter (fun i => i.val < j), (n i : ℝ)) / (∑ i, n i) * ∑ i, H i

theorem test1  :
    gln_relative_roots oneTwoBlocks ![1, 2, 3] = ![1, 5] ∧
      dualBlockProjection ![1, 2, 3] = ![1, 5 / 2] := by sorry

-- Test: gln_relative_roots.test1
-- The actual block projection for 1|23 sends (1,2,3) to (1,5), and its averaged dual projection gives (1,5/2).
example  :
    gln_relative_roots oneTwoBlocks ![1, 2, 3] = ![1, 5] ∧
      dualBlockProjection ![1, 2, 3] = ![1, 5 / 2] := by sorry


theorem test2 (n : ℕ) (hn : 0 < n) (H : Fin 1 → ℝ) :
    relativeProjection (fun _ : Fin 1 => n) H = 0 := by sorry

-- Test: gln_relative_roots.test2
-- For the single rank-n block, n>0, subtracting the central projection gives the zero relative-height vector for every input.
example (n : ℕ) (hn : 0 < n) (H : Fin 1 → ℝ) :
    relativeProjection (fun _ : Fin 1 => n) H = 0 := by sorry


theorem test3 (x y : ℝ) : relativeRoot 1 2 ![x, y] = x - y / 2 := by sorry

-- Test: gln_relative_roots.test3
-- For blocks of ranks1 and2, α(x,y)=x−y/2 and α∨=(1,−1), with the degree-zero condition x+y=0.
example (x y : ℝ) : relativeRoot 1 2 ![x, y] = x - y / 2 := by sorry

end gln_relative_roots

def chamber_height_functions {ι : Type*} [Fintype ι] {r : ℕ}
    (roots weights : Fin r → Height ι →ₗ[ℝ] ℝ) (H : Height ι) : ℂ × ℂ :=
  (truncation_cones roots H, truncation_cones weights H)
namespace chamber_height_functions

def height {G : Type*} {ι : Type*} (degree : G → Height ι) := degree

def tau {ι : Type*} [Fintype ι] {r : ℕ} (roots : Fin r → Height ι →ₗ[ℝ] ℝ) := truncation_cones roots

def hatTau {ι : Type*} [Fintype ι] {r : ℕ} (weights : Fin r → Height ι →ₗ[ℝ] ℝ) := truncation_cones weights

theorem test1 {ι : Type*} [Fintype ι] (roots : Fin 0 → Height ι →ₗ[ℝ] ℝ) (H : Height ι) : tau roots H = 1 := by sorry

-- Test: chamber_height_functions.test1
-- The empty product of cone conditions for GL₁ is1.
example {ι : Type*} [Fintype ι] (roots : Fin 0 → Height ι →ₗ[ℝ] ℝ) (H : Height ι) : tau roots H = 1 := by sorry


theorem test2 {ι : Type*} [Fintype ι] {r : ℕ} (roots : Fin r → Height ι →ₗ[ℝ] ℝ)
    (H : Height ι) (i : Fin r) (h : roots i H = 0) : tau roots H = 0 := by sorry

-- Test: chamber_height_functions.test2
-- A point on a required wall, with the corresponding pairing zero, does not satisfy the strict cone condition.
example {ι : Type*} [Fintype ι] {r : ℕ} (roots : Fin r → Height ι →ₗ[ℝ] ℝ)
    (H : Height ι) (i : Fin r) (h : roots i H = 0) : tau roots H = 0 := by sorry


/-- The Iwasawa determinant-height identities are supplied by AA; here the invariant
unipotent and compact factors have zero determinant degree. -/
theorem test3 {G : Type*} [Group G] {ι : Type*} [Fintype ι] {r : ℕ}
    (degree : G →* Multiplicative (Height ι))
    (roots weights : Fin r → Height ι →ₗ[ℝ] ℝ) (n m k : G)
    (hn : degree n = 1) (hk : degree k = 1) :
    height (fun g => Multiplicative.toAdd (degree g)) (n * m * k) =
      height (fun g => Multiplicative.toAdd (degree g)) m ∧
    chamber_height_functions roots weights (Multiplicative.toAdd (degree (n * m * k))) =
      chamber_height_functions roots weights (Multiplicative.toAdd (degree m)) := by sorry

-- Test: chamber_height_functions.test3
-- For the determinant-height homomorphism with trivial unipotent and compact factors, the named height of nmk is that of m, and both actual cone cutoffs agree.
example {G : Type*} [Group G] {ι : Type*} [Fintype ι] {r : ℕ}
    (degree : G →* Multiplicative (Height ι))
    (roots weights : Fin r → Height ι →ₗ[ℝ] ℝ) (n m k : G)
    (hn : degree n = 1) (hk : degree k = 1) :
    height (fun g => Multiplicative.toAdd (degree g)) (n * m * k) =
      height (fun g => Multiplicative.toAdd (degree g)) m ∧
    chamber_height_functions roots weights (Multiplicative.toAdd (degree (n * m * k))) =
      chamber_height_functions roots weights (Multiplicative.toAdd (degree m)) := by sorry

end chamber_height_functions

/-- Points of the positive chamber (all simple roots positive) off every relative-root wall. -/
def auxiliary_chamber_selector {ι : Type*} [Fintype ι] {r s : ℕ}
    (simpleRoots : Fin s → Height ι →ₗ[ℝ] ℝ) (roots : Fin r → Height ι →ₗ[ℝ] ℝ) :
    Set (Height ι) := {k | (∀ j, 0 < simpleRoots j k) ∧ ∀ i, roots i k ≠ 0}
namespace auxiliary_chamber_selector
def crossedBlockRoot : Height (Fin 3) →ₗ[ℝ] ℝ :=
  (1 / 2 : ℝ) • ((LinearMap.proj (R := ℝ) (φ := fun _ : Fin 3 => ℝ) 0) + (LinearMap.proj (R := ℝ) (φ := fun _ : Fin 3 => ℝ) 2)) - (LinearMap.proj (R := ℝ) (φ := fun _ : Fin 3 => ℝ) 1)
def gl2Root : Height (Fin 2) →ₗ[ℝ] ℝ := (LinearMap.proj (R := ℝ) (φ := fun _ : Fin 2 => ℝ) 0) -
  (LinearMap.proj (R := ℝ) (φ := fun _ : Fin 2 => ℝ) 1)
def gl3SimpleRoots : Fin 2 → Height (Fin 3) →ₗ[ℝ] ℝ :=
  ![(LinearMap.proj (R := ℝ) (φ := fun _ : Fin 3 => ℝ) 0) -
      (LinearMap.proj (R := ℝ) (φ := fun _ : Fin 3 => ℝ) 1),
    (LinearMap.proj (R := ℝ) (φ := fun _ : Fin 3 => ℝ) 1) -
      (LinearMap.proj (R := ℝ) (φ := fun _ : Fin 3 => ℝ) 2)]


theorem avoidHyperplanes {ι : Type*} [Fintype ι] {r s : ℕ}
    (simpleRoots : Fin s → Height ι →ₗ[ℝ] ℝ) (roots : Fin r → Height ι →ₗ[ℝ] ℝ)
    (hRoots : ∀ i, roots i ≠ 0) (hChamber : ∃ k, ∀ j, 0 < simpleRoots j k) :
    Set.Nonempty (auxiliary_chamber_selector simpleRoots roots) := by sorry

/-- Ordered blocks are supplied by the GL root datum; signs select their positive system. -/
def orderedParabolic {ι : Type*} [Fintype ι] {r : ℕ}
    (roots : Fin r → Height ι →ₗ[ℝ] ℝ) (k : Height ι) : Fin r → Bool := fun i => decide (0 < roots i k)

theorem weylTransport {ι : Type*} [Fintype ι] {r : ℕ}
    (roots : Fin r → Height ι →ₗ[ℝ] ℝ) (e : Height ι ≃ₗ[ℝ] Height ι) (k : Height ι) :
    orderedParabolic (fun i => (roots i).comp e.toLinearMap) k = orderedParabolic roots (e k) := by sorry

theorem test1  : ![3, 2, 1] ∉ auxiliary_chamber_selector gl3SimpleRoots (fun _ : Fin 1 => crossedBlockRoot) := by sorry

-- Test: auxiliary_chamber_selector.test1
-- The vector (3,2,1) fails membership in the selector for the crossed partition {1,3}|{2}, because its block averages are equal.
example  : ![3, 2, 1] ∉ auxiliary_chamber_selector gl3SimpleRoots (fun _ : Fin 1 => crossedBlockRoot) := by sorry


theorem test2  : ![2, 0] ∈ auxiliary_chamber_selector (fun _ : Fin 1 => gl2Root) (fun _ : Fin 1 => gl2Root) ∧
    orderedParabolic (fun _ : Fin 1 => gl2Root) ![2, 0] = fun _ => true := by sorry

-- Test: auxiliary_chamber_selector.test2
-- The vector (2,0) belongs to the actual GL₂ regular selector and chooses the positive ordered parabolic.
example  : ![2, 0] ∈ auxiliary_chamber_selector (fun _ : Fin 1 => gl2Root) (fun _ : Fin 1 => gl2Root) ∧
    orderedParabolic (fun _ : Fin 1 => gl2Root) ![2, 0] = fun _ => true := by sorry


theorem test3 {ι : Type*} [Fintype ι] {r : ℕ}
    (roots : Fin r → Height ι →ₗ[ℝ] ℝ) (k : Height ι) (a : ℝ) (ha : 0 < a) :
    orderedParabolic roots (a • k) = orderedParabolic roots k := by sorry

-- Test: auxiliary_chamber_selector.test3
-- Multiplying a generic kappa by a positive real preserves every relative-root sign, hence preserves every Q_L.
example {ι : Type*} [Fintype ι] {r : ℕ}
    (roots : Fin r → Height ι →ₗ[ℝ] ℝ) (k : Height ι) (a : ℝ) (ha : 0 < a) :
    orderedParabolic roots (a • k) = orderedParabolic roots k := by sorry

end auxiliary_chamber_selector

def degree_cone_series (n : ℕ) (zeta : ℂ) (f : ℂ → ℂ) (e : ℤ) (lam : ℂ) : ℂ :=
  (n : ℂ)⁻¹ * ∑ j ∈ Finset.range n, zeta ^ (e * j) * f (lam * zeta ^ j)
namespace degree_cone_series

/-- Signed lattice cone sum, initially only where the absolute sum converges. -/
def coneSeries {I : Type*} [Countable I] (sign : ℂ) (cutoff : I → Bool)
    (monomial : I → ℂ) : ℂ := sign * ∑' H : I, if cutoff H then monomial H else 0

def degreeFourierProjector := degree_cone_series

theorem sumResidues (n : ℕ) (hn : 0 < n) (zeta : ℂ) (hPrimitive : IsPrimitiveRoot zeta n)
    (f : ℂ → ℂ) (lam : ℂ) : (∑ e ∈ Finset.range n, degree_cone_series n zeta f e lam) = f lam := by sorry

theorem test1 (f : ℂ → ℂ) (lam : ℂ) : degree_cone_series 1 1 f 0 lam = f lam := by sorry

-- Test: degree_cone_series.test1
-- For n=1 the Fourier degree projector has one term and hat1_Q^0=hat1_Q.
example (f : ℂ → ℂ) (lam : ℂ) : degree_cone_series 1 1 f 0 lam = f lam := by sorry


theorem test2 (n : ℕ) (hn : 0 < n) (zeta : ℂ) (hz : IsPrimitiveRoot zeta n)
    (f : ℂ → ℂ) (lam : ℂ) : (∑ e ∈ Finset.range n, degree_cone_series n zeta f e lam) = f lam := by sorry

-- Test: degree_cone_series.test2
-- Summing hat1_Q^e over e=0,...,n−1 recovers hat1_Q.
example (n : ℕ) (hn : 0 < n) (zeta : ℂ) (hz : IsPrimitiveRoot zeta n)
    (f : ℂ → ℂ) (lam : ℂ) : (∑ e ∈ Finset.range n, degree_cone_series n zeta f e lam) = f lam := by sorry


theorem test3 (f : ℂ → ℂ) (lam : ℂ) :
    degree_cone_series 2 (-1) f 0 lam = (f lam + f (-lam)) / 2 ∧
      degree_cone_series 2 (-1) f 1 lam = (f lam - f (-lam)) / 2 := by sorry

-- Test: degree_cone_series.test3
-- For n=2,zeta=−1, the even/odd projectors of a function f are (f(lambda)±f(lambda*eta))/2.
example (f : ℂ → ℂ) (lam : ℂ) :
    degree_cone_series 2 (-1) f 0 lam = (f lam + f (-lam)) / 2 ∧
      degree_cone_series 2 (-1) f 1 lam = (f lam - f (-lam)) / 2 := by sorry

end degree_cone_series

def floorHeight {r : ℕ} (ranks : Fin (r + 1) → ℕ) (n : ℕ) (e : ℤ) : Fin r → ℤ :=
  fun i => ⌊(e : ℝ) * ranks i.castSucc / n⌋ - ⌊(e : ℝ) * ranks i.succ / n⌋

theorem cone_series_floor_vector {r : ℕ} (ranks : Fin (r + 1) → ℕ) (n : ℕ) (hn : 0 < n)
    (hFirst : ranks 0 = 0) (hLast : ranks (Fin.last r) = n) (e : ℤ) :
    (∑ i, floorHeight ranks n e i) = -e := by sorry

def floor_monomial_family {r : ℕ} (ranks : Fin (r + 1) → ℕ) (n : ℕ) (e : ℤ) : Fin r → ℤ :=
  fun i => floorHeight ranks n e i + if i.val = 0 then 0 else 1
namespace floor_monomial_family
/-- Arthur's linear θ in Yu's multiplicative character coordinates. The monomial
λ₂⁻¹ in (5.2.4) converts its geometric-series denominator to this difference. -/
def twoBlockTheta (lambda : Fin 2 → ℂˣ) : ℂ := (lambda 0 : ℂ) - (lambda 1 : ℂ)
def twoBlockCutoff (lambda : Fin 2 → ℂˣ) : ℂ := -(twoBlockTheta lambda)⁻¹


def floorExponent := @floor_monomial_family


theorem test1  : floorHeight ![0, 1, 3] 3 1 = ![0, -1] ∧
    floor_monomial_family ![0, 1, 3] 3 1 = ![0, 0] := by sorry

-- Test: floor_monomial_family.test1
-- The named floor-height and shifted-exponent constructions for ranks (1,2), total rank three and degree one give H=(0,−1), I=(0,0).
example  : floorHeight ![0, 1, 3] 3 1 = ![0, -1] ∧
    floor_monomial_family ![0, 1, 3] 3 1 = ![0, 0] := by sorry


theorem test2 {r : ℕ} (hr : 0 < r) (ranks : Fin (r + 1) → ℕ) (n : ℕ) (hn : 0 < n)
    (hFirst : ranks 0 = 0) (hLast : ranks (Fin.last r) = n) (e : ℤ) :
    (∑ i, floor_monomial_family ranks n e i) = (r : ℤ) - 1 - e := by sorry

-- Test: floor_monomial_family.test2
-- The total of H_Q^e is−e and the total of I_Q^e is r−1−e.
example {r : ℕ} (hr : 0 < r) (ranks : Fin (r + 1) → ℕ) (n : ℕ) (hn : 0 < n)
    (hFirst : ranks 0 = 0) (hLast : ranks (Fin.last r) = n) (e : ℤ) :
    (∑ i, floor_monomial_family ranks n e i) = (r : ℤ) - 1 - e := by sorry


theorem test3 (lambda : Fin 2 → ℂˣ) (hWall : lambda 0 ≠ lambda 1) :
    (lambda 1 : ℂ)⁻¹ / (1 - (lambda 0 : ℂ) / (lambda 1 : ℂ)) = twoBlockCutoff lambda ∧
    twoBlockCutoff lambda * twoBlockTheta lambda = -1 ∧
      twoBlockCutoff lambda * (twoBlockTheta lambda)⁻¹ = -((twoBlockTheta lambda) ^ 2)⁻¹ := by sorry

-- Test: floor_monomial_family.test3
-- In multiplicative character coordinates the two-block cone expression λ₂^(−1)/(1−λ₁/λ₂) equals −1/(λ₁−λ₂). Multiplication by the actual linear θ cancels the pole; multiplying by its inverse gives a double denominator.
example (lambda : Fin 2 → ℂˣ) (hWall : lambda 0 ≠ lambda 1) :
    (lambda 1 : ℂ)⁻¹ / (1 - (lambda 0 : ℂ) / (lambda 1 : ℂ)) = twoBlockCutoff lambda ∧
    twoBlockCutoff lambda * twoBlockTheta lambda = -1 ∧
      twoBlockCutoff lambda * (twoBlockTheta lambda)⁻¹ = -((twoBlockTheta lambda) ^ 2)⁻¹ := by sorry

end floor_monomial_family


/-- Determination from the deep chamber: two quasi-polynomials on `ℤⁿ` (polynomials whose
coefficients are periodic modulo `N`) that agree on `{T | T i - T j ≥ c for i < j}` agree at
`T = 0`. This is what permits evaluation at `T = 0`. -/
theorem lattice_count_quasipolynomial (n N : ℕ) (hN : 0 < N)
    (K : Finset (Fin n → ℕ)) (a b : (Fin n → ℕ) → (Fin n → ZMod N) → ℂ) (c : ℤ)
    (hEqual : ∀ T : Fin n → ℤ, (∀ i j : Fin n, i < j → c ≤ T i - T j) →
      ∑ k ∈ K, a k (fun i => (T i : ZMod N)) * ∏ i, (T i : ℂ) ^ k i =
        ∑ k ∈ K, b k (fun i => (T i : ZMod N)) * ∏ i, (T i : ℂ) ^ k i) :
    ∑ k ∈ K, a k 0 * ∏ i, (0 : ℂ) ^ k i = ∑ k ∈ K, b k 0 * ∏ i, (0 : ℂ) ^ k i := by sorry

end TauCeti.AutomorphicSpectral

/-! ## AS.4 — Automorphic spectral completeness -/

namespace TauCeti.AutomorphicSpectral
universe u v w
section SpectralSpaces
variable {P : Type u} [Fintype P] {X : Type v} [MeasurableSpace X]
variable {H : Type w} [NormedAddCommGroup H] [InnerProductSpace ℂ H] [CompleteSpace H]

def SymmetricSection (μ : Measure X) (transport : P → P → X → X)
    (M : P → P → X → Operator H) :=
  {F : P → X → H // (∀ p, MemLp (F p) 2 μ) ∧
    ∀ p q x, F q (transport p q x) = M p q x (F p x)}

def associate_parameter_fields (μ : Measure X) (n : P → ℕ)
    (transport : P → P → X → X) (M : P → P → X → Operator H) :
    HilbertModel.{max u v w} := by sorry
namespace associate_parameter_fields
def pointSection (v : H) : SymmetricSection (Measure.dirac ())
    (fun _ _ x => x : Unit → Unit → Unit → Unit)
    (fun _ _ _ => ContinuousLinearMap.id ℂ H) := ⟨fun _ _ => v, by sorry⟩
def reflectedSection (F : ℝ → H) (hF : MemLp F 2 volume) (A : Operator H)
    (hWeyl : ∀ x, F (-x) = A (F x)) : SymmetricSection volume
    (fun _ _ x => -x : Unit → Unit → ℝ → ℝ) (fun _ _ _ => A) := ⟨fun _ => F, by sorry⟩
def fixedPointSection (A : Operator H) (v : H) (hFixed : A v = v) :
    SymmetricSection (Measure.dirac ())
      (fun _ _ x => x : Unit → Unit → Unit → Unit) (fun _ _ _ => A) := ⟨fun _ _ => v, by sorry⟩


def mk (μ : Measure X) (n : P → ℕ) (t : P → P → X → X)
    (M : P → P → X → Operator H) (F : SymmetricSection μ t M) :
    (associate_parameter_fields μ n t M).Carrier := by sorry

theorem symmetric_norm (μ : Measure X) (n : P → ℕ) (hn : ∀ p, 0 < n p)
    (t : P → P → X → X) (M : P → P → X → Operator H) (F : SymmetricSection μ t M) :
    ‖mk μ n t M F‖ ^ 2 = ∑ p, (n p : ℝ)⁻¹ * ∫ x, ‖F.val p x‖ ^ 2 ∂μ := by sorry


theorem rank_zero (v : H) :
    ‖mk (Measure.dirac ()) (fun _ : Unit => 1) (fun _ _ x => x)
      (fun _ _ _ => ContinuousLinearMap.id ℂ H) (pointSection v)‖ ^ 2 = ‖v‖ ^ 2 := by sorry

-- Test: associate_parameter_fields.rank_zero
-- A constant section over the single point with n_G=1 maps to an actual field vector whose squared norm is the original squared norm.
example (v : H) :
    ‖mk (Measure.dirac ()) (fun _ : Unit => 1) (fun _ _ x => x)
      (fun _ _ _ => ContinuousLinearMap.id ℂ H) (pointSection v)‖ ^ 2 = ‖v‖ ^ 2 := by sorry


theorem rank_one (F : ℝ → H) (hF : MemLp F 2 volume)
    (A : Operator H) (hWeyl : ∀ x, F (-x) = A (F x)) :
    ‖mk volume (fun _ : Unit => 2) (fun _ _ x => -x) (fun _ _ _ => A)
      (reflectedSection F hF A hWeyl)‖ ^ 2 = (1 / 2 : ℝ) * ∫ x, ‖F x‖ ^ 2 := by sorry

-- Test: associate_parameter_fields.rank_one
-- For a reflected compatible section over the real parameter line with n_P=2, the actual field vector has half the full integrated squared norm.
example (F : ℝ → H) (hF : MemLp F 2 volume)
    (A : Operator H) (hWeyl : ∀ x, F (-x) = A (F x)) :
    ‖mk volume (fun _ : Unit => 2) (fun _ _ x => -x) (fun _ _ _ => A)
      (reflectedSection F hF A hWeyl)‖ ^ 2 = (1 / 2 : ℝ) * ∫ x, ‖F x‖ ^ 2 := by sorry


theorem stabilizer_not_removed (A : Operator H) (v : H)
    (hv : A v = v) (hNonzero : v ≠ 0) :
    ‖mk (Measure.dirac ()) (fun _ : Unit => 2) (fun _ _ x => x)
      (fun _ _ _ => A) (fixedPointSection A v hv)‖ ^ 2 = (1 / 2 : ℝ) * ‖v‖ ^ 2 ∧
    mk (Measure.dirac ()) (fun _ : Unit => 2) (fun _ _ x => x)
      (fun _ _ _ => A) (fixedPointSection A v hv) ≠ 0 := by sorry

-- Test: associate_parameter_fields.stabilizer_not_removed
-- A nonzero vector fixed by the stabilizer operator defines a nonzero point-field vector, with the reciprocal stabilizer norm factor retained.
example (A : Operator H) (v : H)
    (hv : A v = v) (hNonzero : v ≠ 0) :
    ‖mk (Measure.dirac ()) (fun _ : Unit => 2) (fun _ _ x => x)
      (fun _ _ _ => A) (fixedPointSection A v hv)‖ ^ 2 = (1 / 2 : ℝ) * ‖v‖ ^ 2 ∧
    mk (Measure.dirac ()) (fun _ : Unit => 2) (fun _ _ x => x)
      (fun _ _ _ => A) (fixedPointSection A v hv) ≠ 0 := by sorry

end associate_parameter_fields

variable {K : Type w} [NormedAddCommGroup K] [InnerProductSpace ℂ K] [CompleteSpace K]
/-- The isometric extension of `F ↦ Σ_p n_p⁻¹ ∫ E_p(F_p)` from the symmetric sections, for an
Eisenstein family `E` satisfying the wave-packet Gram identity. -/
def spectral_map (μ : Measure X) (n : P → ℕ) (t : P → P → X → X)
    (M : P → P → X → Operator H) (E : P → X → H →L[ℂ] K)
    (hInt : ∀ (F : SymmetricSection μ t M) (p : P),
      Integrable (fun x => E p x (F.val p x)) μ)
    (hGram : ∀ F : SymmetricSection μ t M,
      ‖∑ p, (n p : ℂ)⁻¹ • eisenstein_wave_packet μ (E p) (F.val p)‖ ^ 2 =
        ∑ p, (n p : ℝ)⁻¹ * ∫ x, ‖F.val p x‖ ^ 2 ∂μ) :
    (associate_parameter_fields μ n t M).Carrier →ₗᵢ[ℂ] K := by sorry
namespace spectral_map

theorem packet_apply (μ : Measure X) (n : P → ℕ) (t : P → P → X → X)
    (M : P → P → X → Operator H) (E : P → X → H →L[ℂ] K)
    (hInt : ∀ (F : SymmetricSection μ t M) (p : P),
      Integrable (fun x => E p x (F.val p x)) μ)
    (hGram : ∀ F : SymmetricSection μ t M,
      ‖∑ p, (n p : ℂ)⁻¹ • eisenstein_wave_packet μ (E p) (F.val p)‖ ^ 2 =
        ∑ p, (n p : ℝ)⁻¹ * ∫ x, ‖F.val p x‖ ^ 2 ∂μ)
    (F : SymmetricSection μ t M) :
    spectral_map μ n t M E hInt hGram (associate_parameter_fields.mk μ n t M F) =
      ∑ p, (n p : ℂ)⁻¹ • eisenstein_wave_packet μ (E p) (F.val p) := by sorry

theorem norm (μ : Measure X) (n : P → ℕ) (hn : ∀ p, 0 < n p)
    (t : P → P → X → X) (M : P → P → X → Operator H)
    (E : P → X → H →L[ℂ] K)
    (hInt : ∀ (F : SymmetricSection μ t M) (p : P),
      Integrable (fun x => E p x (F.val p x)) μ)
    (hGram : ∀ F : SymmetricSection μ t M,
      ‖∑ p, (n p : ℂ)⁻¹ • eisenstein_wave_packet μ (E p) (F.val p)‖ ^ 2 =
        ∑ p, (n p : ℝ)⁻¹ * ∫ x, ‖F.val p x‖ ^ 2 ∂μ)
    (F : SymmetricSection μ t M) :
    ‖spectral_map μ n t M E hInt hGram (associate_parameter_fields.mk μ n t M F)‖ ^ 2 =
      ∑ p, (n p : ℝ)⁻¹ * ∫ x, ‖F.val p x‖ ^ 2 ∂μ := by sorry

/-- On the dense domain, a fibrewise action `IFib` intertwined by `E` with `R` is carried to `R`. -/
theorem right_intertwines (μ : Measure X) (n : P → ℕ) (t : P → P → X → X)
    (M : P → P → X → Operator H) (E : P → X → H →L[ℂ] K)
    (hInt : ∀ (F : SymmetricSection μ t M) (p : P),
      Integrable (fun x => E p x (F.val p x)) μ)
    (hGram : ∀ F : SymmetricSection μ t M,
      ‖∑ p, (n p : ℂ)⁻¹ • eisenstein_wave_packet μ (E p) (F.val p)‖ ^ 2 =
        ∑ p, (n p : ℝ)⁻¹ * ∫ x, ‖F.val p x‖ ^ 2 ∂μ)
    (IFib : P → X → Operator H) (R : Operator K)
    (hE : ∀ p x h, R (E p x h) = E p x (IFib p x h))
    (F G : SymmetricSection μ t M) (hFG : ∀ p x, G.val p x = IFib p x (F.val p x)) :
    spectral_map μ n t M E hInt hGram (associate_parameter_fields.mk μ n t M G) =
      R (spectral_map μ n t M E hInt hGram (associate_parameter_fields.mk μ n t M F)) := by sorry

/-- The whole-Levi packet is a zero-dimensional point integral of the cuspidal inclusion. -/
theorem cusp_component (C : H →ₗᵢ[ℂ] K) (v : H) :
    eisenstein_wave_packet (Measure.dirac ()) (fun _ : Unit => C.toContinuousLinearMap)
      (fun _ => v) = C v := by sorry

-- Test: spectral_map.cusp_component
-- The P=G cuspidal component maps identically to the AF.3 cuspidal subspace.
example (C : H →ₗᵢ[ℂ] K) (v : H) :
    eisenstein_wave_packet (Measure.dirac ()) (fun _ : Unit => C.toContinuousLinearMap)
      (fun _ => v) = C v := by sorry


theorem zero (μ : Measure X) (n : P → ℕ) (t : P → P → X → X)
    (M : P → P → X → Operator H) (E : P → X → H →L[ℂ] K)
    (hInt : ∀ (F : SymmetricSection μ t M) (p : P),
      Integrable (fun x => E p x (F.val p x)) μ)
    (hGram : ∀ F : SymmetricSection μ t M,
      ‖∑ p, (n p : ℂ)⁻¹ • eisenstein_wave_packet μ (E p) (F.val p)‖ ^ 2 =
        ∑ p, (n p : ℝ)⁻¹ * ∫ x, ‖F.val p x‖ ^ 2 ∂μ) :
    spectral_map μ n t M E hInt hGram 0 = 0 := by sorry

-- Test: spectral_map.zero
-- U(0)=0.
example (μ : Measure X) (n : P → ℕ) (t : P → P → X → X)
    (M : P → P → X → Operator H) (E : P → X → H →L[ℂ] K)
    (hInt : ∀ (F : SymmetricSection μ t M) (p : P),
      Integrable (fun x => E p x (F.val p x)) μ)
    (hGram : ∀ F : SymmetricSection μ t M,
      ‖∑ p, (n p : ℂ)⁻¹ • eisenstein_wave_packet μ (E p) (F.val p)‖ ^ 2 =
        ∑ p, (n p : ℝ)⁻¹ * ∫ x, ‖F.val p x‖ ^ 2 ∂μ) :
    spectral_map μ n t M E hInt hGram 0 = 0 := by sorry


/-- A proper Hilbert inclusion disproves inferring onto completeness from a norm law. -/
theorem proper_isometry : ∃ e : ℂ →ₗᵢ[ℂ] EuclideanSpace ℂ (Fin 2), ¬ Function.Surjective e := by sorry

-- Test: spectral_map.proper_isometry
-- A proper closed inclusion of Hilbert spaces satisfies the norm law but fails the required surjectivity condition.
example : ∃ e : ℂ →ₗᵢ[ℂ] EuclideanSpace ℂ (Fin 2), ¬ Function.Surjective e := by sorry

end spectral_map

end SpectralSpaces

section Residual
variable {H : Type u} [NormedAddCommGroup H] [InnerProductSpace ℂ H] [CompleteSpace H]

def residual_spectrum (disc cusp : Submodule ℂ H) : Submodule ℂ H := disc ⊓ cusp.orthogonal
namespace residual_spectrum
def cuspMeasure : Measure ℝ := (volume.restrict (Set.Ioi 1)).withDensity
  (fun y => ENNReal.ofReal (y ^ (-2 : ℤ)))
def cuspPower (a : ℝ) (y : ℝ) : ℂ := (y ^ a : ℝ)


theorem orthogonal (disc cusp : Submodule ℂ H) (hC : IsClosed (cusp : Set H))
    (hD : IsClosed (disc : Set H)) (hCD : cusp ≤ disc) :
    cusp ⊔ residual_spectrum disc cusp = disc ∧ disc ⊔ disc.orthogonal = ⊤ := by sorry


theorem projection_equivariant (S : Submodule ℂ H) (hS : IsClosed (S : Set H))
    (U : H ≃ₗᵢ[ℂ] H) (hU : ∀ x ∈ S, U x ∈ S) (hUi : ∀ x ∈ S, U.symm x ∈ S)
    (P : Operator H) (hP : ∀ x, P x ∈ S ∧ x - P x ∈ S.orthogonal) :
    P.comp U.toContinuousLinearEquiv.toContinuousLinearMap =
      U.toContinuousLinearEquiv.toContinuousLinearMap.comp P := by sorry

/-- In the anisotropic case AF supplies disc=cusp=the whole Hilbert space. -/
theorem anisotropic : residual_spectrum (⊤ : Submodule ℂ H) ⊤ = ⊥ := by sorry

-- Test: residual_spectrum.anisotropic
-- If G is anisotropic modulo center, there are no proper rational parabolics and L²_res=L²_cont=0.
example : residual_spectrum (⊤ : Submodule ℂ H) ⊤ = ⊥ := by sorry


theorem sl2_constant (disc cusp : Submodule ℂ H) (v : H) (hv : v ≠ 0)
    (hC : IsClosed (cusp : Set H)) (hOrth : v ∈ cusp.orthogonal)
    (hDisc : disc = cusp ⊔ Submodule.span ℂ {v}) (z : UpperHalfPlane) :
    scalarCoefficient (continuedE z) 1 (-1) = 3 / Real.pi ∧
      residual_spectrum disc cusp = Submodule.span ℂ {v} := by sorry

-- Test: residual_spectrum.sl2_constant
-- The Eisenstein residue is 3/π. In a Hilbert model with discrete space equal to cusp plus an orthogonal nonzero constant line, the actual residual_spectrum is precisely that line; the modular spectral theorem must establish the model hypotheses.
example (disc cusp : Submodule ℂ H) (v : H) (hv : v ≠ 0)
    (hC : IsClosed (cusp : Set H)) (hOrth : v ∈ cusp.orthogonal)
    (hDisc : disc = cusp ⊔ Submodule.span ℂ {v}) (z : UpperHalfPlane) :
    scalarCoefficient (continuedE z) 1 (-1) = 3 / Real.pi ∧
      residual_spectrum disc cusp = Submodule.span ℂ {v} := by sorry


/-- Cusp measure computation excludes an exponent at the nonnegative L² boundary. -/
theorem non_l2_pole (a : ℝ) (ha : 1 / 2 ≤ a) :
    ¬ MemLp (cuspPower a) 2 cuspMeasure ∧
      ¬ ∃ f : Lp ℂ 2 cuspMeasure, (fun y => (f : ℝ → ℂ) y) =ᵐ[cuspMeasure] cuspPower a := by sorry

-- Test: residual_spectrum.non_l2_pole
-- For a surviving cusp power y^a with a≥1/2, there is no L² representative for the hyperbolic cusp measure, so the power cannot be a vector in any L² residual subspace.
example (a : ℝ) (ha : 1 / 2 ≤ a) :
    ¬ MemLp (cuspPower a) 2 cuspMeasure ∧
      ¬ ∃ f : Lp ℂ 2 cuspMeasure, (fun y => (f : ℝ → ℂ) y) =ᵐ[cuspMeasure] cuspPower a := by sorry

end residual_spectrum


/-- Integrated L¹ action bound for an actual unitary representation. -/
theorem hecke_central_compatibility {G : Type v} [MeasurableSpace G]
    (μ : Measure G) (U : G → H ≃ₗᵢ[ℂ] H) (h : G → ℂ)
    (hh : Integrable h μ) (x : H)
    (hMeas : AEStronglyMeasurable (fun g => h g • U g x) μ) :
    ‖∫ g, h g • U g x ∂μ‖ ≤ (∫ g, ‖h g‖ ∂μ) * ‖x‖ := by sorry

end Residual


end TauCeti.AutomorphicSpectral

namespace TauCeti.AutomorphicSpectral
universe u v w
section YuDiscrete
variable {X : Type u} [MeasurableSpace X]
/-- The quotient and central character are supplied by AA/AF. -/
def discrete_spherical_spectrum (μ : Measure X) (theta : X → ℂ) (phi : X → ℂ) : ℝ :=
  ∫ x, ‖phi x‖ ^ 2 / ‖theta x‖ ^ 2 ∂μ
namespace discrete_spherical_spectrum

def weightedNorm := @discrete_spherical_spectrum

def discreteSubspace {H : Type*} [NormedAddCommGroup H] [InnerProductSpace ℂ H]
    (irreducibleGenerators : Set H) := cuspidal_datum_space irreducibleGenerators


theorem test1  :
    (1 : ℂ) ∈ discreteSubspace ({1} : Set ℂ) ∧
      (1 : ℂ) ∈ residual_spectrum (⊤ : Submodule ℂ ℂ) ⊥ ∧
      discrete_spherical_spectrum (Measure.dirac ()) (fun _ : Unit => 1) (fun _ => 1) = 1 := by sorry

-- Test: discrete_spherical_spectrum.test1
example  :
    (1 : ℂ) ∈ discreteSubspace ({1} : Set ℂ) ∧
      (1 : ℂ) ∈ residual_spectrum (⊤ : Submodule ℂ ℂ) ⊥ ∧
      discrete_spherical_spectrum (Measure.dirac ()) (fun _ : Unit => 1) (fun _ => 1) = 1 := by sorry


theorem test2 (μ : Measure X) (theta phi : X → ℂ) (htheta : ∀ x, ‖theta x‖ = 1) :
    discrete_spherical_spectrum μ theta phi = ∫ x, ‖phi x‖ ^ 2 ∂μ := by sorry

-- Test: discrete_spherical_spectrum.test2
-- For |theta|=1 the |theta|-weighted integrand equals |phi|².
example (μ : Measure X) (theta phi : X → ℂ) (htheta : ∀ x, ‖theta x‖ = 1) :
    discrete_spherical_spectrum μ theta phi = ∫ x, ‖phi x‖ ^ 2 ∂μ := by sorry


theorem test3 (μ : Measure X) {G : Type*} [Group G] [MulAction G X]
    (theta phi : X → ℂ) (chi : G →* ℂˣ)
    (hPhi : ∀ g x, phi (g • x) = (chi g : ℂ) * phi x)
    (hTheta : ∀ g x, theta (g • x) = (chi g : ℂ) * theta x) (g : G) :
    discrete_spherical_spectrum μ (fun x => theta (g • x)) (fun x => phi (g • x)) = discrete_spherical_spectrum μ theta phi := by sorry

-- Test: discrete_spherical_spectrum.test3
-- When the section and its weight transform by the same nonzero central character, the actual integrated discrete_spherical_spectrum norm is unchanged under central translation.
example (μ : Measure X) {G : Type*} [Group G] [MulAction G X]
    (theta phi : X → ℂ) (chi : G →* ℂˣ)
    (hPhi : ∀ g x, phi (g • x) = (chi g : ℂ) * phi x)
    (hTheta : ∀ g x, theta (g • x) = (chi g : ℂ) * theta x) (g : G) :
    discrete_spherical_spectrum μ (fun x => theta (g • x)) (fun x => phi (g • x)) = discrete_spherical_spectrum μ theta phi := by sorry

end discrete_spherical_spectrum
end YuDiscrete

/-- `DiscreteRep` is the supplied discrete spherical Levi representation carrier, including
triviality on Xi_M; it is not a newly defined automorphic representation type. -/
def discrete_pair (P : Type u) (DiscreteRep : P → Type v) := Sigma DiscreteRep
namespace discrete_pair

def pair {P : Type u} {Rep : P → Type v} (p : P) (pi : Rep p) : discrete_pair P Rep := ⟨p, pi⟩

def weylTwistEquiv {A : Type w} [Group A] {P : Type u} {Rep : P → Type v}
    [MulAction A (discrete_pair P Rep)] (g : A) : discrete_pair P Rep ≃ discrete_pair P Rep :=
  ⟨fun x => g • x, fun x => g⁻¹ • x, by sorry, by sorry⟩

def stabilizer {A : Type w} [Group A] {P : Type u} {Rep : P → Type v}
    [MulAction A (discrete_pair P Rep)] (pi : discrete_pair P Rep) : Subgroup A := MulAction.stabilizer A pi

theorem test1 {A : Type w} [Group A] {P : Type u} {Rep : P → Type v}
    [MulAction A (discrete_pair P Rep)] (pi : discrete_pair P Rep) : 1 ∈ stabilizer (A := A) pi := by sorry

-- Test: discrete_pair.test1
-- (1,1) belongs to stab(P,pi).
example {A : Type w} [Group A] {P : Type u} {Rep : P → Type v}
    [MulAction A (discrete_pair P Rep)] (pi : discrete_pair P Rep) : 1 ∈ stabilizer (A := A) pi := by sorry


theorem test2 {A : Type w} [Group A] {P : Type u} {Rep : P → Type v}
    [MulAction A (discrete_pair P Rep)] (pi : discrete_pair P Rep) (g : A) : g ∈ stabilizer pi ↔ g • pi = pi := by sorry

-- Test: discrete_pair.test2
-- (w,tau) is in the stabilizer precisely when w normalizes M and w(pi⊗tau)=pi.
example {A : Type w} [Group A] {P : Type u} {Rep : P → Type v}
    [MulAction A (discrete_pair P Rep)] (pi : discrete_pair P Rep) (g : A) : g ∈ stabilizer pi ↔ g • pi = pi := by sorry


theorem test3 {A : Type w} [Group A] {P : Type u} {Rep : P → Type v}
    [MulAction A (discrete_pair P Rep)] (pi : discrete_pair P Rep) (g : A) (hg : g ∈ stabilizer pi) :
    g⁻¹ ∈ stabilizer pi := by sorry

-- Test: discrete_pair.test3
-- The inverse stabilizer element of (w,tau) is (w⁻¹,w(tau)⁻¹), in the convention of Yu (5.2.11).
example {A : Type w} [Group A] {P : Type u} {Rep : P → Type v}
    [MulAction A (discrete_pair P Rep)] (pi : discrete_pair P Rep) (g : A) (hg : g ∈ stabilizer pi) :
    g⁻¹ ∈ stabilizer pi := by sorry

end discrete_pair

/-- Equal inertial classes use identical chosen representatives. -/
def good_discrete_pair {I : Type u} {C : Type v} (inertialClass : I → C) (chooseRep : C → I) : I → I :=
  chooseRep ∘ inertialClass
namespace good_discrete_pair
def distinguishedTuple {I C : Type*} {r : ℕ} (inertialClass : I → C)
    (chooseRep : C → I) (pi : Fin r → I) : Fin r → I := fun i => good_discrete_pair inertialClass chooseRep (pi i)
def pairStabilizer {I C T : Type*} [Group T] [MulAction T I] {r : ℕ}
    (inertialClass : I → C) (chooseRep : C → I) (pi : Fin r → I) :
    Set (Equiv.Perm (Fin r) × T) :=
  {p | ∀ i, p.2 • distinguishedTuple inertialClass chooseRep pi (p.1 i) =
    distinguishedTuple inertialClass chooseRep pi i}


def groupEqualTypes := @good_discrete_pair

def cycleData {r : ℕ} (w : Equiv.Perm (Fin r)) : Fin r → Fin r := w

/-- Permutations within each multiplicity block contribute factorials, with the separate
finite twist stabilizer cardinal. -/
def stabilizerCard {r : ℕ} (multiplicity : Fin r → ℕ) (twistCard : ℕ) : ℕ :=
  twistCard * ∏ i, (multiplicity i).factorial

theorem test1 {I C : Type*} (inertialClass : I → C) (chooseRep : C → I)
    (pi tau : I) (hSame : inertialClass pi = inertialClass tau) :
    distinguishedTuple inertialClass chooseRep ![pi, tau] ∘ Equiv.swap 0 1 =
      distinguishedTuple inertialClass chooseRep ![pi, tau] := by sorry

-- Test: good_discrete_pair.test1
-- Two raw representations in the same inertial class have equal chosen representatives under good_discrete_pair, so their distinguished tuple is fixed by transposition.
example {I C : Type*} (inertialClass : I → C) (chooseRep : C → I)
    (pi tau : I) (hSame : inertialClass pi = inertialClass tau) :
    distinguishedTuple inertialClass chooseRep ![pi, tau] ∘ Equiv.swap 0 1 =
      distinguishedTuple inertialClass chooseRep ![pi, tau] := by sorry


theorem test2 {I C : Type*} (inertialClass : I → C) (chooseRep : C → I)
    (hSection : ∀ c, inertialClass (chooseRep c) = c)
    (pi tau : I) (hDifferent : inertialClass pi ≠ inertialClass tau) :
    distinguishedTuple inertialClass chooseRep ![pi, tau] ∘ Equiv.swap 0 1 ≠
      distinguishedTuple inertialClass chooseRep ![pi, tau] := by sorry

-- Test: good_discrete_pair.test2
-- For two distinct inertial classes and a representative section of the class map, transposition does not fix the actual distinguished tuple.
example {I C : Type*} (inertialClass : I → C) (chooseRep : C → I)
    (hSection : ∀ c, inertialClass (chooseRep c) = c)
    (pi tau : I) (hDifferent : inertialClass pi ≠ inertialClass tau) :
    distinguishedTuple inertialClass chooseRep ![pi, tau] ∘ Equiv.swap 0 1 ≠
      distinguishedTuple inertialClass chooseRep ![pi, tau] := by sorry


/-- Product decomposition of good-pair stabilizers is an output, not an input assumption. -/
theorem test3 {I C T : Type*} [Group T] [MulAction T I] {r : ℕ}
    (inertialClass : I → C) (chooseRep : C → I)
    (hSection : ∀ c, inertialClass (chooseRep c) = c)
    (hTwist : ∀ (t : T) (x : I), inertialClass (t • x) = inertialClass x) (pi : Fin r → I) :
    pairStabilizer (T := T) inertialClass chooseRep pi =
      {w | ∀ i, distinguishedTuple inertialClass chooseRep pi (w i) =
        distinguishedTuple inertialClass chooseRep pi i} ×ˢ
      {t | ∀ i, t • distinguishedTuple inertialClass chooseRep pi i =
        distinguishedTuple inertialClass chooseRep pi i} := by sorry

-- Test: good_discrete_pair.test3
-- On the distinguished tuple, the actual Weyl/twist stabilizer is the product of permutation and twist stabilizers when twisting preserves inertial classes; no equality of arbitrary sets is assumed.
example {I C T : Type*} [Group T] [MulAction T I] {r : ℕ}
    (inertialClass : I → C) (chooseRep : C → I)
    (hSection : ∀ c, inertialClass (chooseRep c) = c)
    (hTwist : ∀ (t : T) (x : I), inertialClass (t • x) = inertialClass x) (pi : Fin r → I) :
    pairStabilizer (T := T) inertialClass chooseRep pi =
      {w | ∀ i, distinguishedTuple inertialClass chooseRep pi (w i) =
        distinguishedTuple inertialClass chooseRep pi i} ×ˢ
      {t | ∀ i, t • distinguishedTuple inertialClass chooseRep pi i =
        distinguishedTuple inertialClass chooseRep pi i} := by sorry

end good_discrete_pair


/-- On the critical line `E(·, s)` is integrable for the invariant measure (Mathlib's `volume`
on `ℍ`, `dx dy / y²`) over any set inside finitely many `PSL₂(ℤ)`-translates of the standard
fundamental domain: a compact part and finitely many cusp ends of width one. -/
theorem eisenstein_core_integrable (S : Set UpperHalfPlane)
    (J : Finset (effectiveModularGroup 1).Index)
    (hS : S ⊆ ⋃ j ∈ J, (effectiveModularGroup 1).orbit j ''
      {z : UpperHalfPlane | |z.re| ≤ 1 / 2 ∧ 1 ≤ ‖(z : ℂ)‖})
    (s : ℂ) (hs : s.re = 1 / 2) :
    IntegrableOn (fun z : UpperHalfPlane => ‖continuedE z s‖) S := by sorry
end TauCeti.AutomorphicSpectral

/-! ## AS.5 — Weighted cohomology and cuspidal support -/

namespace TauCeti.AutomorphicSpectral
universe u v w
def weighted_l2_complex {X : Type u} [MeasurableSpace X] (μ : Measure X)
    (p : X → ℝ) (d : (X → ℂ) →ₗ[ℂ] (X → ℂ)) : Set (X → ℂ) :=
  {f | MemLp (fun x => p x * f x) 2 μ ∧ MemLp (fun x => p x * d f x) 2 μ}
namespace weighted_l2_complex
variable {X : Type u} [MeasurableSpace X]

theorem domain (μ : Measure X) (p : X → ℝ) (d : (X → ℂ) →ₗ[ℂ] (X → ℂ)) (f : X → ℂ) :
    f ∈ weighted_l2_complex μ p d ↔
      MemLp (fun x => p x * f x) 2 μ ∧ MemLp (fun x => p x * d f x) 2 μ := by sorry

theorem weight_comparison (μ : Measure X) (p q : X → ℝ)
    (hp : Measurable p) (hq : Measurable q) (C : ℝ) (hC : 0 ≤ C)
    (hBound : ∀ x, |p x| ≤ C * |q x|) (d : (X → ℂ) →ₗ[ℂ] (X → ℂ)) :
    weighted_l2_complex μ q d ⊆ weighted_l2_complex μ p d := by sorry


theorem unit_weight (μ : Measure X) (d : (X → ℂ) →ₗ[ℂ] (X → ℂ)) (f : X → ℂ) :
    f ∈ weighted_l2_complex μ (fun _ => 1) d ↔ MemLp f 2 μ ∧ MemLp (d f) 2 μ := by sorry

-- Test: weighted_l2_complex.unit_weight
-- For p=1 this is the maximal L² de Rham graph complex.
example (μ : Measure X) (d : (X → ℂ) →ₗ[ℂ] (X → ℂ)) (f : X → ℂ) :
    f ∈ weighted_l2_complex μ (fun _ => 1) d ↔ MemLp f 2 μ ∧ MemLp (d f) 2 μ := by sorry


theorem rank_zero (μ : Measure X) (p : X → ℝ) (hp : Measurable p)
    (c C : ℝ) (hc : 0 < c) (hC : 0 < C) (hBounds : ∀ x, c ≤ p x ∧ p x ≤ C)
    (d : (X → ℂ) →ₗ[ℂ] (X → ℂ)) :
    weighted_l2_complex μ p d = weighted_l2_complex μ (fun _ => 1) d := by sorry

-- Test: weighted_l2_complex.rank_zero
-- On a compact quotient all admissible weights bounded above and below give the same form domain and cohomology.
example (μ : Measure X) (p : X → ℝ) (hp : Measurable p)
    (c C : ℝ) (hc : 0 < c) (hC : 0 < C) (hBounds : ∀ x, c ≤ p x ∧ p x ≤ C)
    (d : (X → ℂ) →ₗ[ℂ] (X → ℂ)) :
    weighted_l2_complex μ p d = weighted_l2_complex μ (fun _ => 1) d := by sorry


theorem cusp_power (a b : ℝ) (d : (ℝ → ℂ) →ₗ[ℂ] (ℝ → ℂ))
    (hDifferential : d (residual_spectrum.cuspPower a) =
      (a : ℂ) • residual_spectrum.cuspPower a) :
    residual_spectrum.cuspPower a ∈
      weighted_l2_complex residual_spectrum.cuspMeasure (fun y => y ^ b) d ↔ a + b < 1 / 2 := by sorry

-- Test: weighted_l2_complex.cusp_power
-- For the power vector y^a, weight y^b and its actual radial differential ay^a, membership in the named graph domain is equivalent to a+b<1/2; the critical boundary fails membership.
example (a b : ℝ) (d : (ℝ → ℂ) →ₗ[ℂ] (ℝ → ℂ))
    (hDifferential : d (residual_spectrum.cuspPower a) =
      (a : ℂ) • residual_spectrum.cuspPower a) :
    residual_spectrum.cuspPower a ∈
      weighted_l2_complex residual_spectrum.cuspMeasure (fun y => y ^ b) d ↔ a + b < 1 / 2 := by sorry

end weighted_l2_complex

/-- Generic algebraic cochain model used to state induced cohomology maps. Its differential
and the equality d²=0 are concrete, not unspecified proposition fields. -/
structure CochainData where
  V : ℤ → Type u
  add : ∀ q, AddCommGroup (V q)
  module : ∀ q, Module ℂ (V q)
  d : ∀ q, V q →ₗ[ℂ] V (q + 1)
  square_zero : ∀ q, (d (q + 1)).comp (d q) = 0
attribute [instance] CochainData.add CochainData.module

/-- The preceding differential transported along (q−1)+1=q. -/
def previousDifferential (C : CochainData.{u}) (q : ℤ) : C.V (q - 1) →ₗ[ℂ] C.V q where
  toFun v := Eq.mp (congrArg C.V (by omega : q - 1 + 1 = q)) (C.d (q - 1) v)
  map_add' := by sorry
  map_smul' := by sorry

/-- The comap places boundaries in the cycle subtype. -/
def cohomology (C : CochainData.{u}) (q : ℤ) : Type u :=
  (LinearMap.ker (C.d q)) ⧸
    (LinearMap.range (previousDifferential C q)).comap (LinearMap.ker (C.d q)).subtype
namespace cohomology
instance add (C : CochainData.{u}) (q : ℤ) : AddCommGroup (cohomology C q) :=
  inferInstanceAs (AddCommGroup ((LinearMap.ker (C.d q)) ⧸
    (LinearMap.range (previousDifferential C q)).comap (LinearMap.ker (C.d q)).subtype))
instance module (C : CochainData.{u}) (q : ℤ) : Module ℂ (cohomology C q) :=
  inferInstanceAs (Module ℂ ((LinearMap.ker (C.d q)) ⧸
    (LinearMap.range (previousDifferential C q)).comap (LinearMap.ker (C.d q)).subtype))
end cohomology


-- Unrelated vector spaces need not be linearly isomorphic.
example : ¬ Nonempty ((Fin 0 → ℂ) ≃ₗ[ℂ] ℂ) := by
  rintro ⟨e⟩
  have h : e.symm (1 : ℂ) = 0 := Subsingleton.elim _ _
  have he := congrArg e h
  rw [e.apply_symm_apply, e.map_zero] at he
  exact one_ne_zero he

section FiniteCharacter
variable {R : Type u} [CommRing R] {V : Type v} [AddCommGroup V] [Module R V]
/-- J-power torsion, not just the first annihilator. The n=0 contribution is zero and does
not change the union over positive n. -/
def finite_character_functor (J : Ideal R) : Submodule R V where
  carrier := {v | ∃ n : ℕ, ∀ r ∈ J ^ n, r • v = 0}
  zero_mem' := by sorry
  add_mem' := by sorry
  smul_mem' := by sorry
namespace finite_character_functor
def jordanNilpotent : (Fin 2 → ℂ) →ₗ[ℂ] (Fin 2 → ℂ) where
  toFun v := ![v 1, 0]
  map_add' := by sorry
  map_smul' := by sorry
abbrev JordanModule := Module.AEval' jordanNilpotent


theorem mem_iff (J : Ideal R) (v : V) :
    v ∈ finite_character_functor (V := V) J ↔ ∃ n : ℕ, ∀ r ∈ J ^ n, r • v = 0 := by sorry

/-- `Fin_J` on maps: the restriction of `f`, since `J`-power torsion is carried to `J`-power torsion. -/
def map {W : Type w} [AddCommGroup W] [Module R W] (J : Ideal R) (f : V →ₗ[R] W) :
    finite_character_functor (V := V) J →ₗ[R] finite_character_functor (V := W) J :=
  f.restrict (fun _ _ => by sorry)

/-- The kernel comparison proves exactness at V; injectivity is also preserved. -/
theorem left_exact {U : Type w} {W : Type w} [AddCommGroup U] [Module R U]
    [AddCommGroup W] [Module R W] (J : Ideal R) (f : U →ₗ[R] V) (g : V →ₗ[R] W)
    (hf : Function.Injective f) (hExact : LinearMap.range f = LinearMap.ker g) :
    Function.Injective (map J f) ∧ LinearMap.range (map J f) = LinearMap.ker (map J g) := by sorry

theorem zero_ideal : finite_character_functor (V := V) (⊥ : Ideal R) = ⊤ := by sorry

-- Test: finite_character_functor.zero_ideal
-- For J=0, Fin_J(V)=V.
example : finite_character_functor (V := V) (⊥ : Ideal R) = ⊤ := by sorry


theorem unit_ideal : finite_character_functor (V := V) (⊤ : Ideal R) = ⊥ := by sorry

-- Test: finite_character_functor.unit_ideal
-- For J=Z, Fin_J(V)=0.
example : finite_character_functor (V := V) (⊤ : Ideal R) = ⊥ := by sorry


/-- Size-two nilpotent Jordan block has all vectors in generalized torsion, with a proper
first kernel. This numerical test isolates the error of retaining only ker(t−a). -/
theorem nilpotent_jordan  :
    finite_character_functor (V := JordanModule)
      (Ideal.span ({Polynomial.X} : Set (Polynomial ℂ))) = ⊤ ∧
    ∃ v : JordanModule, (Polynomial.X : Polynomial ℂ) • v ≠ 0 := by sorry

-- Test: finite_character_functor.nilpotent_jordan
-- On the actual polynomial module defined by the size-two nilpotent Jordan operator, finite_character_functor for (X) is the whole module, although X does not annihilate every vector.
example  :
    finite_character_functor (V := JordanModule)
      (Ideal.span ({Polynomial.X} : Set (Polynomial ℂ))) = ⊤ ∧
    ∃ v : JordanModule, (Polynomial.X : Polynomial ℂ) • v ≠ 0 := by sorry

end finite_character_functor
end FiniteCharacter


section Filtration
variable {Q L : Type u} [Fintype Q] [Fintype L]
variable {V : Type v} [AddCommGroup V] [Module ℂ V]
variable {W : Type w} [AddCommGroup W] [Module ℂ W]
/-- Actual constant-term coefficient maps on the finite exponent set. -/
def franke_filtration (coeff : Q → L → V →ₗ[ℂ] W) (T : L → ℤ) (i : ℤ) : Submodule ℂ V where
  carrier := {v | ∀ q l, T l < i → coeff q l v = 0}
  zero_mem' := by
    intro q l _hl
    exact (coeff q l).map_zero
  add_mem' := by
    intro a b ha hb q l hl
    rw [map_add, ha q l hl, hb q l hl, zero_add]
  smul_mem' := by
    intro a v hv q l hl
    rw [map_smul, hv q l hl, smul_zero]
namespace franke_filtration
def sameParabolicCoefficients : Unit → Fin 2 → (Fin 2 → ℂ) →ₗ[ℂ] ℂ :=
  fun _ i => LinearMap.proj i


theorem mem_iff (coeff : Q → L → V →ₗ[ℂ] W) (T : L → ℤ) (i : ℤ) (v : V) :
    v ∈ franke_filtration coeff T i ↔ ∀ q l, T l < i → coeff q l v = 0 := by sorry

theorem descending (coeff : Q → L → V →ₗ[ℂ] W) (T : L → ℤ) (i : ℤ) :
    franke_filtration coeff T (i + 1) ≤ franke_filtration coeff T i := by sorry

omit [Fintype Q] [Fintype L] in

theorem single_weight (j i : ℤ) :
    franke_filtration (fun (_ : Unit) (_ : Unit) => LinearMap.id : Unit → Unit → V →ₗ[ℂ] V)
      (fun _ => j) i = if i ≤ j then ⊤ else ⊥ := by sorry

-- Test: franke_filtration.single_weight
-- If the only exponent weight has T-value j, F_T^i is the whole space for i≤j and zero for i>j.
example (j i : ℤ) :
    franke_filtration (fun (_ : Unit) (_ : Unit) => LinearMap.id : Unit → Unit → V →ₗ[ℂ] V)
      (fun _ => j) i = if i ≤ j then ⊤ else ⊥ := by sorry


theorem no_exponents (coeff : Q → L → V →ₗ[ℂ] W) (T : L → ℤ) (i : ℤ) :
    (0 : V) ∈ franke_filtration coeff T i := by sorry

-- Test: franke_filtration.no_exponents
-- The zero vector belongs to every step.
example (coeff : Q → L → V →ₗ[ℂ] W) (T : L → ℤ) (i : ℤ) :
    (0 : V) ∈ franke_filtration coeff T i := by sorry


theorem rank_only_fails  :
    (![0, 1] : Fin 2 → ℂ) ∈ franke_filtration sameParabolicCoefficients ![0, 1] 1 ∧
      (![1, 0] : Fin 2 → ℂ) ∉ franke_filtration sameParabolicCoefficients ![0, 1] 1 := by sorry

-- Test: franke_filtration.rank_only_fails
-- For two exponent coefficients of the same parabolic with T-values zero and one, the vector supported at exponent one lies in step one and the vector at exponent zero does not. Equal parabolic rank does not determine membership.
example  :
    (![0, 1] : Fin 2 → ℂ) ∈ franke_filtration sameParabolicCoefficients ![0, 1] 1 ∧
      (![1, 0] : Fin 2 → ℂ) ∉ franke_filtration sameParabolicCoefficients ![0, 1] 1 := by sorry

-- Different coefficient maps need not induce the same step.
example :
    franke_filtration (fun (_ : Unit) (_ : Unit) => LinearMap.id :
      Unit → Unit → ℂ →ₗ[ℂ] ℂ) (fun _ => 0) 1 ≠
    franke_filtration (fun (_ : Unit) (_ : Unit) => 0 :
      Unit → Unit → ℂ →ₗ[ℂ] ℂ) (fun _ => 0) 1 := by
  intro h
  have hOne : (1 : ℂ) ∈ franke_filtration
      (fun (_ : Unit) (_ : Unit) => (0 : ℂ →ₗ[ℂ] ℂ)) (fun _ => 0) 1 := by
    intro _q _l _hl
    rfl
  rw [← h] at hOne
  have hx := hOne () () (by norm_num)
  norm_num at hx
end franke_filtration
end Filtration

/-- Laurent coefficient zero after restricting along a prescribed transverse direction. -/
def eisenstein_principal_value {V : Type u} [NormedAddCommGroup V] [NormedSpace ℂ V]
    (f : ℂ → V) : V := by sorry
namespace eisenstein_principal_value
def twoVariableGerm (z : Fin 2 → ℂ) : ℂ := z 0 / z 1
def alongDirection (f : (Fin 2 → ℂ) → ℂ) (direction : Fin 2 → ℂ) : ℂ → ℂ :=
  fun t => f (t • direction)

variable {V : Type u} [NormedAddCommGroup V] [NormedSpace ℂ V]
variable {W : Type v} [NormedAddCommGroup W] [NormedSpace ℂ W]

theorem holomorphic_eval (f : ℂ → V) (hf : AnalyticAt ℂ f 0) : eisenstein_principal_value f = f 0 := by sorry

theorem linear (f g : ℂ → V) (hf : CommonDenominator Set.univ f)
    (hg : CommonDenominator Set.univ g) (a b : ℂ) (T : V →L[ℂ] W) :
    eisenstein_principal_value (fun z => a • f z + b • g z) =
      a • eisenstein_principal_value f + b • eisenstein_principal_value g ∧
        eisenstein_principal_value (fun z => T (f z)) = T (eisenstein_principal_value f) := by sorry


theorem simple_pole (v w : V) : eisenstein_principal_value (fun z => z⁻¹ • v + w) = w := by sorry

-- Test: eisenstein_principal_value.simple_pole
-- MW(z⁻¹v+w)=w.
example (v w : V) : eisenstein_principal_value (fun z => z⁻¹ • v + w) = w := by sorry


theorem holomorphic (v : V) : eisenstein_principal_value (fun _ : ℂ => v) = v := by sorry

-- Test: eisenstein_principal_value.holomorphic
-- MW of a constant vector v is v.
example (v : V) : eisenstein_principal_value (fun _ : ℂ => v) = v := by sorry


theorem direction_dependence  :
    eisenstein_principal_value (alongDirection twoVariableGerm ![1, 1]) = (1 : ℂ) ∧
      eisenstein_principal_value (alongDirection twoVariableGerm ![2, 1]) = (2 : ℂ) := by sorry

-- Test: eisenstein_principal_value.direction_dependence
-- Restrict the same named germ (z₁,z₂)↦z₁/z₂ along directions (1,1) and (2,1): the actual principal values are one and two.
example  :
    eisenstein_principal_value (alongDirection twoVariableGerm ![1, 1]) = (1 : ℂ) ∧
      eisenstein_principal_value (alongDirection twoVariableGerm ![2, 1]) = (2 : ℂ) := by sorry

end eisenstein_principal_value


-- Independent cohomological dimensions have no parity relation.
example : ¬ ∀ (dimGL dimSL : ℕ), dimGL = dimSL := by
  intro h
  have hx := h 0 1
  norm_num at hx


-- The cuspidal cohomology sum and its Hecke map are imported from ALS.5; no duplicate declaration.


-- Empty cuspidal support cannot span a nonzero module.
example : Submodule.span ℂ (∅ : Set ℂ) ≠ ⊤ := by
  simp


end TauCeti.AutomorphicSpectral

/-! ## AS.6 — Paley–Wiener theory and trace distributions -/

namespace TauCeti.AutomorphicSpectral
universe u v w
def PaleyWienerBound (f : ℂ → ℂ) (r : ℝ) : Prop :=
  ∀ N : ℕ, ∃ C : ℝ, ∀ s : ℂ,
    Real.exp (-r * |s.re|) * (1 + ‖s‖) ^ N * ‖f s‖ ≤ C

/-- The one-parameter seminorm estimate in Arthur III.4.2. Use the input bound at
N+d to absorb a distribution's polynomial order d; exponential radii add.
This is only the growth step. Differentiated coefficient relations, the actual
Hecke transform and its finite-radius inverse are still required for support. -/
theorem PaleyWienerBound.mul_of_polynomialGrowth {f gamma : ℂ → ℂ} {r R : ℝ}
    (hf : PaleyWienerBound f r)
    (hg : ∃ d : ℕ, ∃ C : ℝ, ∀ s : ℂ,
      ‖gamma s‖ ≤ C * Real.exp (R * |s.re|) * (1 + ‖s‖) ^ d) :
    PaleyWienerBound (fun s => gamma s * f s) (r + R) := by sorry

-- Growth-step tests: a central polynomial keeps radius; a translated Dirac adds
-- its support radius; the zero distribution yields zero regardless of radius.
example (f : ℂ → ℂ) (r : ℝ) (hf : PaleyWienerBound f r) (d : ℕ) :
    PaleyWienerBound (fun s => (1 + s) ^ d * f s) r := by sorry
example (f : ℂ → ℂ) (r a : ℝ) (hf : PaleyWienerBound f r) :
    PaleyWienerBound (fun s => Complex.exp ((a : ℂ) * s) * f s) (r + |a|) := by sorry
example (f : ℂ → ℂ) (r : ℝ) :
    PaleyWienerBound (fun s => (0 : ℂ) * f s) r := by sorry


section Multipliers
variable {E : Type u} [AddCommGroup E] [Module ℂ E]
variable {I : Type v}

/-- Scalar multiplication preserving a specified Fourier-image subspace. The actual
Cartan-distribution theorem must produce this property for the operator PW image. -/
structure PWMultiplier (W : Submodule ℂ (I → ℂ)) where
  symbol : I → ℂ
  preserves : ∀ f ∈ W, (fun i => symbol i * f i) ∈ W

def PWMultiplier.map {W : Submodule ℂ (I → ℂ)} (gamma : PWMultiplier W) : W →ₗ[ℂ] W where
  toFun f := ⟨fun i => gamma.symbol i * f.val i, gamma.preserves f f.property⟩
  map_add' := by sorry
  map_smul' := by sorry

def PWMultiplier.one (W : Submodule ℂ (I → ℂ)) : PWMultiplier W where
  symbol := fun _ => 1
  preserves := by sorry

def PWMultiplier.zero (W : Submodule ℂ (I → ℂ)) : PWMultiplier W where
  symbol := fun _ => 0
  preserves := by sorry

def PWMultiplier.mul {W : Submodule ℂ (I → ℂ)}
    (gamma eta : PWMultiplier W) : PWMultiplier W where
  symbol := fun i => gamma.symbol i * eta.symbol i
  preserves := by sorry

/-- Algebraic transport after a Fourier isomorphism and an image-preserving symbol
have been supplied. No arbitrary linear transform is declared invertible. -/
def spectral_multiplier {W : Submodule ℂ (I → ℂ)} (T : E ≃ₗ[ℂ] W)
    (gamma : PWMultiplier W) : E →ₗ[ℂ] E :=
  T.symm.toLinearMap.comp (gamma.map.comp T.toLinearMap)

namespace spectral_multiplier
variable {W : Submodule ℂ (I → ℂ)}
theorem character (T : E ≃ₗ[ℂ] W) (gamma : PWMultiplier W) (f : E) (i : I) :
    (T (spectral_multiplier T gamma f)).val i = gamma.symbol i * (T f).val i := by sorry

theorem composition (T : E ≃ₗ[ℂ] W) (gamma eta : PWMultiplier W) (f : E) :
    spectral_multiplier T eta (spectral_multiplier T gamma f) =
      spectral_multiplier T (PWMultiplier.mul gamma eta) f := by sorry

theorem dirac (T : E ≃ₗ[ℂ] W) (f : E) :
    spectral_multiplier T (PWMultiplier.one W) f = f := by sorry
-- Test: spectral_multiplier.dirac
-- The Dirac distribution at 0 acts as identity.
example (T : E ≃ₗ[ℂ] W) (f : E) :
    spectral_multiplier T (PWMultiplier.one W) f = f := by sorry

theorem central_polynomial (T : E ≃ₗ[ℂ] W) (p : PWMultiplier W)
    (z : E →ₗ[ℂ] E) (hz : ∀ f i, (T (z f)).val i = p.symbol i * (T f).val i) (f : E) :
    spectral_multiplier T p f = z f := by sorry
-- Test: spectral_multiplier.central_polynomial
-- For the distribution whose transform is the Harish-Chandra polynomial p_z, f_γ=zf.
example (T : E ≃ₗ[ℂ] W) (p : PWMultiplier W) (z : E →ₗ[ℂ] E)
    (hz : ∀ f i, (T (z f)).val i = p.symbol i * (T f).val i) (f : E) :
    spectral_multiplier T p f = z f := by sorry

theorem zero (T : E ≃ₗ[ℂ] W) (f : E) :
    spectral_multiplier T (PWMultiplier.zero W) f = 0 := by sorry
-- Test: spectral_multiplier.zero
-- The zero distribution sends every f to zero.
example (T : E ≃ₗ[ℂ] W) (f : E) :
    spectral_multiplier T (PWMultiplier.zero W) f = 0 := by sorry
end spectral_multiplier
end Multipliers

section Kernels
variable {G : Type u} [Group G] {J : Type v} [Countable J]
def automorphic_kernel (rational : J → G) (f : G → ℂ) (x y : G) : ℂ :=
  ∑' gamma : J, f (x⁻¹ * rational gamma * y)
namespace automorphic_kernel
def compactLogSeed (g : Multiplicative ℝ) : ℂ :=
  (max (1 - |Multiplicative.toAdd g|) 0 : ℝ)
def trivialLattice : Unit → Multiplicative ℝ := fun _ => 1


-- A periodized zero kernel does not represent an independently chosen identity map.
example :
    ((LinearMap.id : (Unit → ℂ) →ₗ[ℂ] (Unit → ℂ)) (fun _ => 1)) () ≠
      ∫ _y : Unit, automorphic_kernel (fun _ : Unit => (1 : Multiplicative ℤ))
        (fun _ => (0 : ℂ)) 1 1 * 1 ∂Measure.dirac () := by
  simp [automorphic_kernel]


def constant_term {N : Type w} [MeasurableSpace N] (ν : Measure N)
    (leviRational : J → G) (unipotent : N → G) (f : G → ℂ) (x y : G) : ℂ :=
  ∫ n, ∑' gamma : J, f (x⁻¹ * leviRational gamma * unipotent n * y) ∂ν

/-- Inversion on the rational subgroup is supplied as a bijective reindexing. -/
theorem adjoint (rational : J → G) (inverseIndex : J ≃ J)
    (hInverse : ∀ j, rational (inverseIndex j) = (rational j)⁻¹)
    (f : G → ℂ) (x y : G) :
    automorphic_kernel rational (fun g => star (f g⁻¹)) x y = star (automorphic_kernel rational f y x) := by sorry

theorem finite_group [Fintype J] (rational : J → G) (f : G → ℂ) (x y : G) :
    automorphic_kernel rational f x y = ∑ gamma : J, f (x⁻¹ * rational gamma * y) := by sorry

-- Test: automorphic_kernel.finite_group
-- For finite G(F) inside a finite group, unfolding gives the usual finite convolution matrix.
example [Fintype J] (rational : J → G) (f : G → ℂ) (x y : G) :
    automorphic_kernel rational f x y = ∑ gamma : J, f (x⁻¹ * rational gamma * y) := by sorry


/-- A model cusp diagonal with nonzero constant contribution has divergent volume integral. -/
theorem noncompact_diagonal  :
    HasCompactSupport (fun x : ℝ => compactLogSeed (Multiplicative.ofAdd x)) ∧
    ¬ Integrable (fun x : ℝ => automorphic_kernel trivialLattice compactLogSeed
      (Multiplicative.ofAdd x) (Multiplicative.ofAdd x)) volume := by sorry

-- Test: automorphic_kernel.noncompact_diagonal
example  :
    HasCompactSupport (fun x : ℝ => compactLogSeed (Multiplicative.ofAdd x)) ∧
    ¬ Integrable (fun x : ℝ => automorphic_kernel trivialLattice compactLogSeed
      (Multiplicative.ofAdd x) (Multiplicative.ofAdd x)) volume := by sorry


theorem adjoint_swap (rational : J → G) (inverseIndex : J ≃ J)
    (hInverse : ∀ j, rational (inverseIndex j) = (rational j)⁻¹)
    (f : G → ℂ) (hf : ∀ g, f g = star (f g⁻¹)) (x y : G) :
    automorphic_kernel rational f x y = star (automorphic_kernel rational f y x) := by sorry

-- Test: automorphic_kernel.adjoint_swap
-- Real inversion-invariant f has Hermitian kernel K_f(x,y)=conj(K_f(y,x)).
example (rational : J → G) (inverseIndex : J ≃ J)
    (hInverse : ∀ j, rational (inverseIndex j) = (rational j)⁻¹)
    (f : G → ℂ) (hf : ∀ g, f g = star (f g⁻¹)) (x y : G) :
    automorphic_kernel rational f x y = star (automorphic_kernel rational f y x) := by sorry

end automorphic_kernel
end Kernels

/-- Kernel truncation is a diagonal-kernel sum, distinct from Λ applied to a scalar function. -/
def coarse_truncated_kernel {P : Type u} [Fintype P] {X : Type v}
    (Cosets : P → Type w) [∀ p, Countable (Cosets p)]
    (rank : P → ℕ) (translate : ∀ p, Cosets p → X → X)
    (cutoff : P → X → ℂ) (K : P → X → X → ℂ) (x : X) : ℂ :=
  ∑ p, (-1 : ℂ) ^ rank p * ∑' j : Cosets p,
    cutoff p (translate p j x) * K p (translate p j x) (translate p j x)
namespace coarse_truncated_kernel
def cuspDiagonal (T : ℝ) : ℝ → ℂ :=
  coarse_truncated_kernel (fun _ : Bool => Unit) (fun b => if b then 1 else 0)
    (fun _ _ => id) (fun b x => if b then (if T < x then 1 else 0) else 1)
    (fun _ _ _ => 1)


-- Zero summands cannot have an independently chosen nonzero class total.
example : ¬ HasSum (fun _ : Unit => (0 : ℂ)) 1 := by
  intro h
  have hx := h.tsum_eq
  norm_num at hx


def canonical_value (polynomial : ℝ → ℂ) (T₀ : ℝ) : ℂ := polynomial T₀

theorem anisotropic {X : Type u} (K : X → X → ℂ) (x : X) :
    coarse_truncated_kernel (fun _ : Unit => Unit) (fun _ => 0)
      (fun _ _ => id) (fun _ _ => 1) (fun _ => K) x = K x x := by sorry

-- Test: coarse_truncated_kernel.anisotropic
-- With only the whole-group parabolic, the actual coarse_truncated_kernel equals the original kernel diagonal.
example {X : Type u} (K : X → X → ℂ) (x : X) :
    coarse_truncated_kernel (fun _ : Unit => Unit) (fun _ => 0)
      (fun _ _ => id) (fun _ _ => 1) (fun _ => K) x = K x x := by sorry


theorem rank_one (T : ℝ) (hT : 0 ≤ T) :
    Integrable (cuspDiagonal T) (volume.restrict (Set.Ioi 0)) ∧
      (∫ x, cuspDiagonal T x ∂volume.restrict (Set.Ioi 0)) = (T : ℂ) := by sorry

-- Test: coarse_truncated_kernel.rank_one
-- In the constant-term logarithmic cusp model, the actual two-parabolic truncated diagonal is integrable on positive heights and its integral is T for T≥0, a degree-one polynomial.
example (T : ℝ) (hT : 0 ≤ T) :
    Integrable (cuspDiagonal T) (volume.restrict (Set.Ioi 0)) ∧
      (∫ x, cuspDiagonal T x ∂volume.restrict (Set.Ioi 0)) = (T : ℂ) := by sorry


theorem zero_test {P : Type u} [Fintype P] {X : Type v}
    (Cosets : P → Type w) [∀ p, Countable (Cosets p)]
    (rank : P → ℕ) (translate : ∀ p, Cosets p → X → X)
    (cutoff : P → X → ℂ) (x : X) :
    coarse_truncated_kernel Cosets rank translate cutoff (fun _ _ _ => 0) x = 0 := by sorry

-- Test: coarse_truncated_kernel.zero_test
-- f=0 gives k_f^T=0 and J^T(f)=0.
example {P : Type u} [Fintype P] {X : Type v}
    (Cosets : P → Type w) [∀ p, Countable (Cosets p)]
    (rank : P → ℕ) (translate : ∀ p, Cosets p → X → X)
    (cutoff : P → X → ℂ) (x : X) :
    coarse_truncated_kernel Cosets rank translate cutoff (fun _ _ _ => 0) x = 0 := by sorry

end coarse_truncated_kernel


-- Independent geometric and spectral arrays need not have the same total.
example : ¬ ∀ (geometric spectral : Unit → ℂ),
    (∑' o, geometric o) = ∑' c, spectral c := by
  intro h
  have hx := h 0 (fun _ => 1)
  norm_num at hx


/-- One-complex-variable holomorphic restriction of a smooth (G,M)-family. Wall conditions themselves are explicit. -/
structure gm_family (P : Type u) (adjacent : Set (P × P)) (wall : P × P → ℂ → ℂ)
    (U : Set ℂ) where
  member : P → ℂ → ℂ
  analytic : ∀ p, AnalyticOnNhd ℂ (member p) U
  wall_agreement : ∀ pq ∈ adjacent, ∀ z ∈ U, wall pq z = 0 → member pq.1 z = member pq.2 z
namespace gm_family
def zeroValue {P : Type u} [Fintype P] {A : Set (P × P)}
    {w : P × P → ℂ → ℂ} {U : Set ℂ} (c : gm_family P A w U)
    (theta : P → ℂ → ℂ) : ℂ :=
  eisenstein_principal_value (fun z => ∑ p, c.member p z / theta p z)


theorem wall {P : Type u} {A : Set (P × P)} {w : P × P → ℂ → ℂ} {U : Set ℂ}
    (c : gm_family P A w U) (pq : P × P) (hAdj : pq ∈ A) (z : ℂ) (hz : z ∈ U)
    (hWall : w pq z = 0) : c.member pq.1 z = c.member pq.2 z := by sorry

def product {P : Type u} {A : Set (P × P)} {w : P × P → ℂ → ℂ} {U : Set ℂ}
    (c d : gm_family P A w U) : gm_family P A w U :=
  { member := fun p z => c.member p z * d.member p z
    analytic := fun p => (c.analytic p).mul (d.analytic p)
    wall_agreement := fun pq hAdj z hz hWall => by
      rw [c.wall_agreement pq hAdj z hz hWall, d.wall_agreement pq hAdj z hz hWall] }


theorem rank_zero (c : gm_family Unit ∅ (fun _ _ => 1) Set.univ) :
    zeroValue c (fun _ _ => 1) = c.member () 0 := by sorry

-- Test: gm_family.rank_zero
-- For a genuine one-member gm_family with no walls, the actual regularized zero value equals its member at zero.
example (c : gm_family Unit ∅ (fun _ _ => 1) Set.univ) :
    zeroValue c (fun _ _ => 1) = c.member () 0 := by sorry


/-- Two-chamber cancellation from the actual shared-wall equality and the native
punctured slope limit. This proof is independent of the provisional principal value. -/
theorem rank_one_limit (c : gm_family Bool {(true, false)} (fun _ z => z) Set.univ) :
    Tendsto (fun z => ∑ b : Bool, c.member b z / (if b then z else -z))
      (𝓝[≠] 0) (𝓝 (deriv (c.member true) 0 - deriv (c.member false) 0)) := by
  have hc := c.wall_agreement (true, false) (by simp) 0 (by simp) rfl
  change c.member true 0 = c.member false 0 at hc
  have hderiv := ((c.analytic true 0 (by simp)).differentiableAt.hasDerivAt).sub
    ((c.analytic false 0 (by simp)).differentiableAt.hasDerivAt)
  have hlimit := hderiv.tendsto_slope_zero
  have hzero : c.member true 0 - c.member false 0 = 0 := sub_eq_zero.mpr hc
  simp only [zero_add, Pi.sub_apply, hzero, sub_zero, smul_eq_mul] at hlimit
  convert hlimit using 1
  ext z
  simp only [Fintype.sum_bool, Bool.false_eq_true, ite_false, ite_true, div_neg]
  ring

theorem rank_one (c : gm_family Bool {(true, false)} (fun _ z => z) Set.univ) :
    Tendsto (fun z => ∑ b : Bool, c.member b z / (if b then z else -z))
      (𝓝[≠] 0) (𝓝 (deriv (c.member true) 0 - deriv (c.member false) 0)) ∧
    zeroValue c (fun b z => if b then z else -z) =
      deriv (c.member true) 0 - deriv (c.member false) 0 := by
  refine ⟨rank_one_limit c, ?_⟩
  sorry

-- Test: gm_family.rank_one
-- For a genuine two-member family with agreement on the shared wall, the full regularized sum has limit c₊′(0)−c₋′(0), and its zero-value construction has that value.
example (c : gm_family Bool {(true, false)} (fun _ z => z) Set.univ) :
    Tendsto (fun z => ∑ b : Bool, c.member b z / (if b then z else -z))
      (𝓝[≠] 0) (𝓝 (deriv (c.member true) 0 - deriv (c.member false) 0)) ∧
    zeroValue c (fun b z => if b then z else -z) =
      deriv (c.member true) 0 - deriv (c.member false) 0 := by sorry


theorem bad_wall  :
    ¬ ∃ c : gm_family Bool {(true, false)} (fun _ z => z) Set.univ,
      (∀ z, c.member true z = 1) ∧ (∀ z, c.member false z = 0) := by sorry

-- Test: gm_family.bad_wall
-- No actual gm_family on a domain containing the shared wall can have constant members one and zero on the adjacent parabolics.
example  :
    ¬ ∃ c : gm_family Bool {(true, false)} (fun _ z => z) Set.univ,
      (∀ z, c.member true z = 1) ∧ (∀ z, c.member false z = 0) := by sorry

/-- Two-chamber product identity, using the existing rank-one zero-value theorem. -/
theorem rank_one_product
    (c d : gm_family Bool {(true, false)} (fun _ z => z) Set.univ) :
    zeroValue (product c d) (fun b z => if b then z else -z) =
      zeroValue c (fun b z => if b then z else -z) * d.member true 0 +
      c.member true 0 * zeroValue d (fun b z => if b then z else -z) := by
  rw [(rank_one (product c d)).2, (rank_one c).2, (rank_one d).2]
  have hc := c.wall_agreement (true, false) (by simp) 0 (by simp) rfl
  have hd := d.wall_agreement (true, false) (by simp) 0 (by simp) rfl
  change deriv (fun z => c.member true z * d.member true z) 0 -
      deriv (fun z => c.member false z * d.member false z) 0 = _
  rw [deriv_fun_mul ((c.analytic true 0 (by simp)).differentiableAt)
      ((d.analytic true 0 (by simp)).differentiableAt),
    deriv_fun_mul ((c.analytic false 0 (by simp)).differentiableAt)
      ((d.analytic false 0 (by simp)).differentiableAt)]
  change c.member true 0 = c.member false 0 at hc
  change d.member true 0 = d.member false 0 at hd
  rw [← hc, ← hd]
  ring

/-- Analytic rank-one families with a common wall value. -/
def affineFamily (base plusSlope minusSlope : ℂ) :
    gm_family Bool {(true, false)} (fun _ z => z) Set.univ where
  member b z := base + (if b then plusSlope else minusSlope) * z
  analytic b := by fun_prop
  wall_agreement pq _ z _ hz := by simp_all

/-- A limit check uses no principal-value construction. -/
theorem affineFamily_limit (base plusSlope minusSlope : ℂ) :
    Tendsto (fun z => ∑ b : Bool, (affineFamily base plusSlope minusSlope).member b z /
      (if b then z else -z)) (𝓝[≠] 0) (𝓝 (plusSlope - minusSlope)) := by
  simpa [affineFamily] using rank_one_limit (affineFamily base plusSlope minusSlope)

example : Tendsto (fun z => ∑ b : Bool, (affineFamily 2 3 1).member b z /
    (if b then z else -z)) (𝓝[≠] 0) (𝓝 (2 : ℂ)) := by
  simpa only [show (3 : ℂ) - 1 = 2 by norm_num] using affineFamily_limit 2 3 1

example (a : ℂ) : Tendsto (fun z => ∑ b : Bool, (affineFamily 2 a a).member b z /
    (if b then z else -z)) (𝓝[≠] 0) (𝓝 (0 : ℂ)) := by
  simpa using affineFamily_limit 2 a a

example : Tendsto (fun z => ∑ b : Bool,
    (product (affineFamily 2 3 1) (affineFamily 5 7 4)).member b z /
      (if b then z else -z)) (𝓝[≠] 0) (𝓝 (16 : ℂ)) := by
  have hplus : deriv (fun z : ℂ => (2 + 3 * z) * (5 + 7 * z)) 0 = 29 := by
    rw [deriv_fun_mul (by fun_prop) (by fun_prop)]
    norm_num
  have hminus : deriv (fun z : ℂ => (2 + 1 * z) * (5 + 4 * z)) 0 = 13 := by
    rw [deriv_fun_mul (by fun_prop) (by fun_prop)]
    norm_num
  have hh := rank_one_limit (product (affineFamily 2 3 1) (affineFamily 5 7 4))
  change Tendsto _ _ (𝓝 (deriv (fun z : ℂ => (2 + 3 * z) * (5 + 7 * z)) 0 -
    deriv (fun z : ℂ => (2 + 1 * z) * (5 + 4 * z)) 0)) at hh
  simpa only [hplus, hminus, show (29 : ℂ) - 13 = 16 by norm_num] using hh


theorem affineFamily_zeroValue (base plusSlope minusSlope : ℂ) :
    zeroValue (affineFamily base plusSlope minusSlope)
      (fun b z => if b then z else -z) = plusSlope - minusSlope := by
  rw [(rank_one _).2]
  simp [affineFamily]

-- Three tests of the actual common-wall family, including a zero and nonzero coefficient.
example (a b : ℂ) :
    zeroValue (affineFamily 1 a b) (fun s z => if s then z else -z) = a - b := by
  exact affineFamily_zeroValue 1 a b

example (a : ℂ) :
    zeroValue (affineFamily 2 a a) (fun s z => if s then z else -z) = 0 := by
  rw [affineFamily_zeroValue]
  ring

example :
    zeroValue (affineFamily 2 3 1) (fun s z => if s then z else -z) = 2 := by
  rw [affineFamily_zeroValue]
  norm_num

example (a b u v : ℂ) :
    zeroValue (product (affineFamily 1 a b) (affineFamily 1 u v))
      (fun s z => if s then z else -z) = (a - b) + (u - v) := by
  rw [rank_one_product, affineFamily_zeroValue, affineFamily_zeroValue]
  simp [affineFamily]

example :
    zeroValue (product (affineFamily 2 3 1) (affineFamily 5 7 4))
      (fun s z => if s then z else -z) = 16 := by
  rw [rank_one_product, affineFamily_zeroValue, affineFamily_zeroValue]
  norm_num [affineFamily]

example : ¬ ∀ (productValue : ℂ) (c d : Unit → ℂ),
    productValue = ∑ l, c l * d l := by
  intro h
  have hx := h 1 0 0
  norm_num at hx


end gm_family


/-- AS.6.8a: the orbital integral `O_γ(f) = ∫_{G_γ\G} f(x⁻¹ γ x) dx`, over the right cosets of the
connected centralizer `Z = G_γ` with the quotient measure `μ` of fixed Haar measures. -/
def orbital_integral {G : Type u} [Group G] (Z : Subgroup G)
    [MeasurableSpace (Quotient (QuotientGroup.rightRel Z))]
    (μ : Measure (Quotient (QuotientGroup.rightRel Z))) (γ : G) (hZ : ∀ z ∈ Z, z * γ = γ * z)
    (f : G → ℂ) : ℂ :=
  ∫ x, Quotient.lift (fun g : G => f (g⁻¹ * γ * g)) (by sorry) x ∂μ

namespace orbital_integral

theorem quotient_measure {G : Type u} [Group G] (Z : Subgroup G)
    [MeasurableSpace (Quotient (QuotientGroup.rightRel Z))]
    (μ : Measure (Quotient (QuotientGroup.rightRel Z))) (γ : G) (hZ : ∀ z ∈ Z, z * γ = γ * z)
    (f : G → ℂ) (c : ℝ≥0) :
    orbital_integral Z (c • μ) γ hZ f = (c : ℂ) * orbital_integral Z μ γ hZ f := by sorry

-- Test: for central `γ` the quotient is a point and `O_γ(f) = f(γ)`.
theorem central {G : Type u} [Group G]
    [MeasurableSpace (Quotient (QuotientGroup.rightRel (⊤ : Subgroup G)))] (γ : G)
    (hγ : ∀ z : G, z * γ = γ * z) (f : G → ℂ) :
    orbital_integral ⊤ (Measure.dirac (Quotient.mk _ 1)) γ (fun z _ => hγ z) f = f γ := by sorry

-- Test: on a commutative group every element is central, so `O_γ(f) = f(γ)`.
theorem torus {G : Type u} [CommGroup G]
    [MeasurableSpace (Quotient (QuotientGroup.rightRel (⊤ : Subgroup G)))] (γ : G) (f : G → ℂ) :
    orbital_integral ⊤ (Measure.dirac (Quotient.mk _ 1)) γ (fun z _ => mul_comm z γ) f =
      f γ := by sorry

end orbital_integral

/-- The quotient by the connected centralizer, its measure and the discriminant are those of
`orbital_integral` (AS.6.8a); this records the weighted integral against them. -/
def weighted_orbital_integral {X : Type u} [MeasurableSpace X] (μ : Measure X)
    (discriminant : ℝ) (test weight : X → ℂ) : ℂ :=
  (Real.sqrt |discriminant| : ℂ) * ∫ x, test x * weight x ∂μ
namespace weighted_orbital_integral

def weight {P : Type*} [Fintype P] (heights : P → ℂ) (theta : P → ℂ → ℂ) : ℂ :=
  eisenstein_principal_value (fun z => ∑ p, Complex.exp (-z * heights p) / theta p z)

theorem full_levi {X : Type u} [MeasurableSpace X] (μ : Measure X) (D : ℝ) (f : X → ℂ) :
    weighted_orbital_integral μ D f (fun _ => 1) = (Real.sqrt |D| : ℂ) * ∫ x, f x ∂μ := by sorry


theorem rank_zero {P : Type*} [Fintype P] [Unique P] : weight (fun _ : P => 0) (fun _ _ => 1) = 1 := by sorry

-- Test: weighted_orbital_integral.rank_zero
-- M=G gives weight 1.
example {P : Type*} [Fintype P] [Unique P] : weight (fun _ : P => 0) (fun _ _ => 1) = 1 := by sorry


theorem rank_one_volume (r vol : ℝ) (hr : 0 ≤ r) (hvol : 0 < vol) :
    weight (fun b : Bool => if b then (r : ℂ) else 0)
      (fun b z => if b then -z / (vol : ℂ) else z / (vol : ℂ)) = (r * vol : ℝ) ∧
    weighted_orbital_integral (Measure.dirac ()) 1 (fun _ : Unit => 1)
      (fun _ => weight (fun b : Bool => if b then (r : ℂ) else 0)
        (fun b z => if b then -z / (vol : ℂ) else z / (vol : ℂ))) = (r * vol : ℝ) := by sorry
-- Test: weighted_orbital_integral.rank_one_volume
-- The actual two-height weight with coroot covolume vol is r·vol for r≥0, and the named point-quotient weighted orbital integral with discriminant one takes exactly that value.
example (r vol : ℝ) (hr : 0 ≤ r) (hvol : 0 < vol) :
    weight (fun b : Bool => if b then (r : ℂ) else 0)
      (fun b z => if b then -z / (vol : ℂ) else z / (vol : ℂ)) = (r * vol : ℝ) ∧
    weighted_orbital_integral (Measure.dirac ()) 1 (fun _ : Unit => 1)
      (fun _ => weight (fun b : Bool => if b then (r : ℂ) else 0)
        (fun b z => if b then -z / (vol : ℂ) else z / (vol : ℂ))) = (r * vol : ℝ) := by sorry

theorem measure_scaling {X : Type u} [MeasurableSpace X] (μ : Measure X)
    (D : ℝ) (f w : X → ℂ) (c : ℝ≥0) (hc : c ≠ 0) :
    (c : ℂ) * weighted_orbital_integral (c⁻¹ • μ) D f w =
      weighted_orbital_integral μ D f w := by sorry
-- Test: weighted_orbital_integral.measure_scaling
-- Scaling the centralizer Haar by c scales the quotient integral by c⁻¹; the global centralizer-volume coefficient scales by c and cancels it.
-- Centralizer scaling uses the inverse quotient measure and cancels its coefficient.
example {X : Type u} [MeasurableSpace X] (μ : Measure X)
    (D : ℝ) (f w : X → ℂ) (c : ℝ≥0) (hc : c ≠ 0) :
    (c : ℂ) * weighted_orbital_integral (c⁻¹ • μ) D f w =
      weighted_orbital_integral μ D f w := by sorry

end weighted_orbital_integral

section WeightedCharacters
variable {H : Type u} [NormedAddCommGroup H] [InnerProductSpace ℂ H] [CompleteSpace H]
def weighted_character (R : Operator H) (I : Operator H) (hTrace : trace_class H)
    (_hProduct : hTrace.val = R.comp I) : ℂ := operatorTrace hTrace
namespace weighted_character
def logarithmicWeight (R : ℂ → Operator H) (invR : Operator H) (z : ℂ) : Operator H :=
  invR.comp (deriv R z)
def scalarTraceClass (c : ℂ) : trace_class ℂ := ⟨c • ContinuousLinearMap.id ℂ ℂ, by sorry⟩
theorem scalarTraceClass_val (c : ℂ) : (scalarTraceClass c).val = c • ContinuousLinearMap.id ℂ ℂ := by sorry


theorem trace (R I : Operator H) (T : trace_class H) (h : T.val = R.comp I) :
    weighted_character R I T h = operatorTrace T := by sorry

theorem full_levi (I : Operator H) (T : trace_class H) (h : T.val = I) :
    weighted_character (ContinuousLinearMap.id ℂ H) I T (by sorry) = operatorTrace T := by sorry

theorem parabolic_independence (U : H ≃ₗᵢ[ℂ] H) (T : trace_class H) :
    ∃ T' : trace_class H, T'.val = U.toContinuousLinearEquiv.toContinuousLinearMap.comp
      (T.val.comp U.symm.toContinuousLinearEquiv.toContinuousLinearMap) ∧ operatorTrace T' = operatorTrace T := by sorry

theorem full_levi_test (T : trace_class H) :
    weighted_character (ContinuousLinearMap.id ℂ H) T.val T (by sorry) = operatorTrace T := by sorry

-- Test: weighted_character.full_levi_test
-- M=G recovers tr π(f).
example (T : trace_class H) :
    weighted_character (ContinuousLinearMap.id ℂ H) T.val T (by sorry) = operatorTrace T := by sorry


/-- On a regular invertible local intertwiner family, its first derivative gives the weight. -/
theorem rank_one_derivative [FiniteDimensional ℂ H]
    (R : ℂ → Operator H) (invR I : Operator H) (z : ℂ) (hR : AnalyticAt ℂ R z)
    (hInverse : invR.comp (R z) = ContinuousLinearMap.id ℂ H)
    (T : trace_class H) (hProduct : T.val = (logarithmicWeight R invR z).comp I) :
    weighted_character (logarithmicWeight R invR z) I T hProduct =
      LinearMap.trace ℂ H ((invR.comp (deriv R z)).comp I).toLinearMap := by sorry

-- Test: weighted_character.rank_one_derivative
-- On a finite-dimensional regular invertible slice, the actual weighted_character equals the trace of R(λ)^(−1)R′(λ) composed with the test operator; the trace-class witness is tied to that product.
example [FiniteDimensional ℂ H]
    (R : ℂ → Operator H) (invR I : Operator H) (z : ℂ) (hR : AnalyticAt ℂ R z)
    (hInverse : invR.comp (R z) = ContinuousLinearMap.id ℂ H)
    (T : trace_class H) (hProduct : T.val = (logarithmicWeight R invR z).comp I) :
    weighted_character (logarithmicWeight R invR z) I T hProduct =
      LinearMap.trace ℂ H ((invR.comp (deriv R z)).comp I).toLinearMap := by sorry


theorem normalization_change  :
    weighted_character
      (logarithmicWeight (fun z => Complex.exp z • ContinuousLinearMap.id ℂ ℂ)
        (ContinuousLinearMap.id ℂ ℂ) 0)
      (ContinuousLinearMap.id ℂ ℂ) (scalarTraceClass 1) (by sorry) = 1 ∧
    weighted_character
      (logarithmicWeight (fun _ => ContinuousLinearMap.id ℂ ℂ)
        (ContinuousLinearMap.id ℂ ℂ) 0)
      (ContinuousLinearMap.id ℂ ℂ) (scalarTraceClass 0) (by sorry) = 0 := by sorry

-- Test: weighted_character.normalization_change
-- The actual scalar weighted traces for the families exp(z)Id and Id at zero are one and zero. The scalar exp(z) is unitary on the imaginary axis but changes the logarithmic derivative weight.
example  :
    weighted_character
      (logarithmicWeight (fun z => Complex.exp z • ContinuousLinearMap.id ℂ ℂ)
        (ContinuousLinearMap.id ℂ ℂ) 0)
      (ContinuousLinearMap.id ℂ ℂ) (scalarTraceClass 1) (by sorry) = 1 ∧
    weighted_character
      (logarithmicWeight (fun _ => ContinuousLinearMap.id ℂ ℂ)
        (ContinuousLinearMap.id ℂ ℂ) 0)
      (ContinuousLinearMap.id ℂ ℂ) (scalarTraceClass 0) (by sorry) = 0 := by sorry

end weighted_character
end WeightedCharacters


end TauCeti.AutomorphicSpectral

namespace TauCeti.AutomorphicSpectral
universe u v w
/-- A fixed-K-type compact Hecke piece is imported as `compactPiece`; all cutoffs use that
same piece, so fibrewise support does not erase the uniform K-type requirement. -/
def almost_compact_test_space {G : Type u} (compactPiece : Set (G → ℂ))
    (height : G → ℝ) : Set (G → ℂ) :=
  {f | ∀ b : ℝ → ℂ, ContDiff ℝ ((⊤ : ℕ∞) : WithTop ℕ∞) b → HasCompactSupport b →
    (fun x => f x * b (height x)) ∈ compactPiece}
namespace almost_compact_test_space
/-- Coefficient model of a finite K-type Hecke piece. -/
def finiteTypePiece (Gamma : Finset ℕ) : Set ((ℝ × ℕ) → ℂ) :=
  {f | HasCompactSupport f ∧ ∀ x n, n ∉ Gamma → f (x, n) = 0}
def typeFamily (b : ℕ → ℝ → ℂ) (p : ℝ × ℕ) : ℂ := b p.2 p.1


theorem cutoff {G : Type u} (C : Set (G → ℂ)) (H : G → ℝ) (f : G → ℂ)
    (hf : f ∈ almost_compact_test_space C H) (b : ℝ → ℂ)
    (hb : ContDiff ℝ ((⊤ : ℕ∞) : WithTop ℕ∞) b) (hc : HasCompactSupport b) :
    (fun x => f x * b (H x)) ∈ C := by sorry

def height_covariance (phi : ℝ → ℂ) (lam : ℂ) (Z : ℝ) : ℂ := Complex.exp (lam * Z) * phi Z


theorem compact_input {G : Type u} (C : Set (G → ℂ)) (H : G → ℝ)
    (hStable : ∀ f ∈ C, ∀ b : ℝ → ℂ, ContDiff ℝ ((⊤ : ℕ∞) : WithTop ℕ∞) b → HasCompactSupport b →
      (fun x => f x * b (H x)) ∈ C) : C ⊆ almost_compact_test_space C H := by sorry

-- Test: almost_compact_test_space.compact_input
-- H(G) embeds into H_ac(G).
example {G : Type u} (C : Set (G → ℂ)) (H : G → ℝ)
    (hStable : ∀ f ∈ C, ∀ b : ℝ → ℂ, ContDiff ℝ ((⊤ : ℕ∞) : WithTop ℕ∞) b → HasCompactSupport b →
      (fun x => f x * b (H x)) ∈ C) : C ⊆ almost_compact_test_space C H := by sorry


/-- A compact smooth scalar cutoff equal to one at zero detects membership when a_G=0. -/
theorem semisimple {G : Type u} (C : Set (G → ℂ))
    (hSmul : ∀ f ∈ C, ∀ a : ℂ, a • f ∈ C) :
    almost_compact_test_space C (fun _ => 0) = C := by sorry

-- Test: almost_compact_test_space.semisimple
-- If a_G=0 then H_ac(G)=H(G), and likewise for I.
example {G : Type u} (C : Set (G → ℂ))
    (hSmul : ∀ f ∈ C, ∀ a : ℂ, a • f ∈ C) :
    almost_compact_test_space C (fun _ => 0) = C := by sorry


/-- Unbounded K-type labels on a compact height interval cannot fit a single finite Γ. -/
theorem fiberwise_only  :
    ∃ b : ℕ → ℝ → ℂ,
      (∀ n, ContDiff ℝ ((⊤ : ℕ∞) : WithTop ℕ∞) (b n) ∧ HasCompactSupport (b n)) ∧
      (∀ x, Set.Finite {n | b n x ≠ 0}) ∧
      (∀ n, ∃ x ∈ Set.Icc (0 : ℝ) 1, b n x ≠ 0) ∧
      ¬ ∃ Gamma : Finset ℕ,
        typeFamily b ∈ almost_compact_test_space (finiteTypePiece Gamma) Prod.fst := by sorry

-- Test: almost_compact_test_space.fiberwise_only
-- There is a smooth coefficient family with compact support for each K-type and finitely many nonzero types at each height, but all labels occur in one compact height interval. It lies in no almost-compact space for a fixed finite type set.
example  :
    ∃ b : ℕ → ℝ → ℂ,
      (∀ n, ContDiff ℝ ((⊤ : ℕ∞) : WithTop ℕ∞) (b n) ∧ HasCompactSupport (b n)) ∧
      (∀ x, Set.Finite {n | b n x ≠ 0}) ∧
      (∀ n, ∃ x ∈ Set.Icc (0 : ℝ) 1, b n x ≠ 0) ∧
      ¬ ∃ Gamma : Finset ℕ,
        typeFamily b ∈ almost_compact_test_space (finiteTypePiece Gamma) Prod.fst := by sorry

end almost_compact_test_space

section Invariance
variable {E : Type u} [AddCommGroup E] [Module ℂ E]
variable {L : Type v} [Fintype L]
variable {F : Type w} [AddCommGroup F] [Module ℂ F]
def invariant_recursion (J : E →ₗ[ℂ] ℂ) (phi : L → E →ₗ[ℂ] F)
    (lower : L → F →ₗ[ℂ] ℂ) (weyl : L → ℚ) : E →ₗ[ℂ] ℂ :=
  J - ∑ l, (weyl l : ℂ) • (lower l).comp (phi l)
namespace invariant_recursion

theorem recursion (J : E →ₗ[ℂ] ℂ) (phi : L → E →ₗ[ℂ] F)
    (lower : L → F →ₗ[ℂ] ℂ) (weyl : L → ℚ) (f : E) :
    invariant_recursion J phi lower weyl f = J f - ∑ l, (weyl l : ℂ) * lower l (phi l f) := by sorry

/-- Defect matching is supplied by Arthur's induction. -/
theorem invariance (J : E →ₗ[ℂ] ℂ) (phi : L → E →ₗ[ℂ] F)
    (lower : L → F →ₗ[ℂ] ℂ) (weyl : L → ℚ) (conjugate : E →ₗ[ℂ] E)
    (hDefect : ∀ f, J (conjugate f) - J f =
      ∑ l, (weyl l : ℂ) * (lower l (phi l (conjugate f)) - lower l (phi l f))) (f : E) :
    invariant_recursion J phi lower weyl (conjugate f) = invariant_recursion J phi lower weyl f := by sorry

/-- A concrete lift of a character-image functional, with its lower-Levi correction. -/
def characterLift (factored : F →ₗ[ℂ] ℂ) (transform : E →ₗ[ℂ] F)
    (phi : L → E →ₗ[ℂ] F) (lower : L → F →ₗ[ℂ] ℂ) (weyl : L → ℚ) : E →ₗ[ℂ] ℂ :=
  factored.comp transform + ∑ l, (weyl l : ℂ) • (lower l).comp (phi l)

/-- Source character support must supply this factorization; arbitrary invariant
functionals are not presumed to factor through characters. -/
theorem character_support (J : E →ₗ[ℂ] ℂ) (phi : L → E →ₗ[ℂ] F)
    (lower : L → F →ₗ[ℂ] ℂ) (weyl : L → ℚ) (transform : E →ₗ[ℂ] F)
    (factored : F →ₗ[ℂ] ℂ)
    (hFactor : J = characterLift factored transform phi lower weyl)
    (f : E) (hf : transform f = 0) : invariant_recursion J phi lower weyl f = 0 := by sorry

theorem full_levi (J : E →ₗ[ℂ] ℂ) (phi : Fin 0 → E →ₗ[ℂ] F)
    (lower : Fin 0 → F →ₗ[ℂ] ℂ) (weyl : Fin 0 → ℚ) : invariant_recursion J phi lower weyl = J := by sorry

-- Test: invariant_recursion.full_levi
-- I_G(γ,f)=J_G(γ,f) and I_G(π,Z,f)=tr π(f^Z).
example (J : E →ₗ[ℂ] ℂ) (phi : Fin 0 → E →ₗ[ℂ] F)
    (lower : Fin 0 → F →ₗ[ℂ] ℂ) (weyl : Fin 0 → ℚ) : invariant_recursion J phi lower weyl = J := by sorry


theorem zero_transform (phi : L → E →ₗ[ℂ] F)
    (lower : L → F →ₗ[ℂ] ℂ) (weyl : L → ℚ) (transform : E →ₗ[ℂ] F)
    (factored : F →ₗ[ℂ] ℂ) (f : E) (hf : transform f = 0) :
    invariant_recursion (characterLift factored transform phi lower weyl)
      phi lower weyl f = 0 := by sorry

-- Test: invariant_recursion.zero_transform
-- Build the input from its character image; then test the actual recursive subtraction.
example (phi : L → E →ₗ[ℂ] F)
    (lower : L → F →ₗ[ℂ] ℂ) (weyl : L → ℚ) (transform : E →ₗ[ℂ] F)
    (factored : F →ₗ[ℂ] ℂ) (f : E) (hf : transform f = 0) :
    invariant_recursion (characterLift factored transform phi lower weyl)
      phi lower weyl f = 0 := by sorry


theorem rank_one (J : E →ₗ[ℂ] ℂ) (phi : Unit → E →ₗ[ℂ] F)
    (lower : Unit → F →ₗ[ℂ] ℂ) (f : E) :
    invariant_recursion J phi lower (fun _ => 1 / 2) f = J f - (1 / 2 : ℂ) * lower () (phi () f) ∧
    invariant_recursion J phi lower (fun _ => 1) f = J f - lower () (phi () f) := by sorry

-- Test: invariant_recursion.rank_one
-- Global GL₂ trace recursion has Weyl ratio 1/2 (23.10); local recursion (23.3) uses one.
example (J : E →ₗ[ℂ] ℂ) (phi : Unit → E →ₗ[ℂ] F)
    (lower : Unit → F →ₗ[ℂ] ℂ) (f : E) :
    invariant_recursion J phi lower (fun _ => 1 / 2) f = J f - (1 / 2 : ℂ) * lower () (phi () f) ∧
    invariant_recursion J phi lower (fun _ => 1) f = J f - lower () (phi () f) := by sorry

end invariant_recursion
end Invariance


-- Stabilization at an independent scalar is already false for a zero sequence.
example : ¬ ∀ (geometric : ℕ → ℂ) (I : ℂ),
    ∃ N, ∀ n, N ≤ n → geometric n = I := by
  intro h
  obtain ⟨N, hN⟩ := h 0 1
  have hx := hN N le_rfl
  norm_num at hx


namespace general_euler_poincare
def compactRelativeCochains : CochainData where
  V q := Fin (if q = 0 then 1 else 0) → ℂ
  add q := inferInstance
  module q := inferInstance
  d q := 0
  square_zero q := by sorry

def rankOneRelativeCochains : CochainData where
  V q := Fin (if q = 0 ∨ q = 1 then 1 else 0) → ℂ
  add q := inferInstance
  module q := inferInstance
  d q := 0
  square_zero q := by sorry

instance compactCohomologyFinite (q : ℤ) : FiniteDimensional ℂ (cohomology compactRelativeCochains q) := by sorry
instance rankOneCohomologyFinite (q : ℤ) : FiniteDimensional ℂ (cohomology rankOneRelativeCochains q) := by sorry

def cochainDimensions (C : CochainData.{u}) [∀ q, FiniteDimensional ℂ (cohomology C q)] : ℕ → ℕ :=
  fun q => Module.finrank ℂ (cohomology C q)


/-- Concrete rank-one cancellation; source proper-induction vanishing is not asserted
for arbitrary lists of dimensions. -/
theorem induced_vanishing :
    (∑ q ∈ Finset.range 2, (-1 : ℂ) ^ q * cochainDimensions rankOneRelativeCochains q) = 0 := by sorry


theorem compact_group :
    (∑ q ∈ Finset.range 1, (-1 : ℂ) ^ q * cochainDimensions compactRelativeCochains q) = 1 ∧
    Module.finrank ℂ (cohomology compactRelativeCochains 0) = 1 := by sorry

-- Test: general_euler_poincare.compact_group
-- The degree-zero relative cochain model has Euler characteristic one and one-dimensional zeroth cohomology.
example :
    (∑ q ∈ Finset.range 1, (-1 : ℂ) ^ q * cochainDimensions compactRelativeCochains q) = 1 ∧
    Module.finrank ℂ (cohomology compactRelativeCochains 0) = 1 := by sorry


theorem parabolic_induction :
    (∑ q ∈ Finset.range 2, (-1 : ℂ) ^ q * cochainDimensions rankOneRelativeCochains q) = 0 ∧
    Module.finrank ℂ (cohomology rankOneRelativeCochains 0) = 1 ∧
    Module.finrank ℂ (cohomology rankOneRelativeCochains 1) = 1 := by sorry

-- Test: general_euler_poincare.parabolic_induction
-- The rank-one relative cochain model has Euler characteristic zero while its zeroth and first cohomology are one-dimensional.
example :
    (∑ q ∈ Finset.range 2, (-1 : ℂ) ^ q * cochainDimensions rankOneRelativeCochains q) = 0 ∧
    Module.finrank ℂ (cohomology rankOneRelativeCochains 0) = 1 ∧
    Module.finrank ℂ (cohomology rankOneRelativeCochains 1) = 1 := by sorry

namespace SimultaneousTraceChecks

/-- Two individually invertible traces on one common scalar test space. -/
def traceAt (b : Bool) : ℂ ≃ₗ[ℂ] ℂ :=
  if b then LinearEquiv.neg ℂ else LinearEquiv.refl ℂ ℂ

/-- The joint trace map retains the relation between the two traces. -/
def traces : ℂ →ₗ[ℂ] (Bool → ℂ) :=
  LinearMap.pi fun b => (traceAt b).toLinearMap

theorem image_iff (values : Bool → ℂ) :
    (∃ z : ℂ, traces z = values) ↔ values true = -values false := by
  constructor
  · rintro ⟨z, rfl⟩
    simp [traces, traceAt]
  · intro h
    refine ⟨values false, ?_⟩
    funext b
    cases b
    · simp [traces, traceAt]
    · simpa [traces, traceAt] using h.symm

/-- Surjectivity of each coordinate does not give simultaneous realization. -/
theorem incompatible_values : ¬ ∃ z : ℂ, traces z = fun _ => 1 := by
  rw [image_iff]
  norm_num

/-- The same joint map does realize a compatible nonzero pair. -/
theorem compatible_values :
    traces 1 = fun b => if b then (-1 : ℂ) else 1 := by
  funext b
  cases b <;> simp [traces, traceAt]

/-- Independent inverses choose different test elements. -/
theorem separate_inverses :
    (traceAt false).symm 1 = 1 ∧ (traceAt true).symm 1 = -1 := by
  simp [traceAt]

example : ¬ ∃ z : ℂ, traces z = fun _ => 1 := incompatible_values

example : traces 1 = fun b => if b then (-1 : ℂ) else 1 := compatible_values

example : (traceAt false).symm 1 ≠ (traceAt true).symm 1 := by
  rw [separate_inverses.1, separate_inverses.2]
  norm_num

end SimultaneousTraceChecks

end general_euler_poincare

end TauCeti.AutomorphicSpectral

namespace TauCeti.AutomorphicSpectral
universe u v w
/-- Fixed-degree integral of an already truncated kernel; integrability is a theorem. -/
def fixed_degree_trace {X : Type u} [MeasurableSpace X] (μ : Measure X) (degree : X → ℤ)
    (e : ℤ) (truncatedDiagonal : X → ℂ) : ℂ :=
  ∫ x, truncatedDiagonal x ∂μ.restrict {x | degree x = e}
namespace fixed_degree_trace

def parabolicKernel {G : Type u} [Group G] {J : Type v} [Countable J]
    {N : Type w} [MeasurableSpace N] (ν : Measure N)
    (leviRational : J → G) (unipotent : N → G) (f : G → ℂ) (x y : G) : ℂ :=
  automorphic_kernel.constant_term ν leviRational unipotent f x y

def truncate {P : Type u} [Fintype P] {X : Type v}
    (Cosets : P → Type w) [∀ p, Countable (Cosets p)]
    (rank : P → ℕ) (translate : ∀ p, Cosets p → X → X)
    (cutoff : P → X → ℂ) (K : P → X → X → ℂ) : X → ℂ :=
  coarse_truncated_kernel Cosets rank translate cutoff K

def fixedDegreeIntegral := @fixed_degree_trace

theorem test1 {X : Type u} (K : X → X → ℂ) (x : X) :
    coarse_truncated_kernel (fun _ : Unit => Unit) (fun _ => 0)
      (fun _ _ => id) (fun _ _ => 1) (fun _ => K) x = K x x := by sorry

-- Test: fixed_degree_trace.test1
-- For G=GL₁, the parabolic truncation sum has only P=G and k^T=k_G.
example {X : Type u} (K : X → X → ℂ) (x : X) :
    coarse_truncated_kernel (fun _ : Unit => Unit) (fun _ => 0)
      (fun _ _ => id) (fun _ _ => 1) (fun _ => K) x = K x x := by sorry


theorem test2 {X : Type u} [MeasurableSpace X] (μ : Measure X) (degree : X → ℤ)
    (e : ℤ) (k : ℝ → X → ℂ) : fixed_degree_trace μ degree e (k 0) =
      ∫ x, k 0 x ∂μ.restrict {x | degree x = e} := by sorry

-- Test: fixed_degree_trace.test2
-- Writing J_e^T as an integral is permitted after integrability of the restricted diagonal kernel has been proved; the value at T=0 is J_e.
example {X : Type u} [MeasurableSpace X] (μ : Measure X) (degree : X → ℤ)
    (e : ℤ) (k : ℝ → X → ℂ) : fixed_degree_trace μ degree e (k 0) =
      ∫ x, k 0 x ∂μ.restrict {x | degree x = e} := by sorry


theorem test3 (T : ℝ) (hT : 0 < T) (e : ℤ) :
    fixed_degree_trace (volume.restrict (Set.Icc (0 : ℝ) (2 * T))) (fun _ => e) e
      (coarse_truncated_kernel.cuspDiagonal T) = (T : ℂ) ∧
    fixed_degree_trace (volume.restrict (Set.Icc (0 : ℝ) (2 * T))) (fun _ => e) e
      (coarse_truncated_kernel.cuspDiagonal T) ≠
    fixed_degree_trace (volume.restrict (Set.Icc (0 : ℝ) (2 * T))) (fun _ => e) e (fun _ => 1) := by sorry

-- Test: fixed_degree_trace.test3
-- The actual fixed-degree integral of the two-parabolic cusp model on [0,2T] is T and differs from the whole-group-only integral when T>0.
example (T : ℝ) (hT : 0 < T) (e : ℤ) :
    fixed_degree_trace (volume.restrict (Set.Icc (0 : ℝ) (2 * T))) (fun _ => e) e
      (coarse_truncated_kernel.cuspDiagonal T) = (T : ℂ) ∧
    fixed_degree_trace (volume.restrict (Set.Icc (0 : ℝ) (2 * T))) (fun _ => e) e
      (coarse_truncated_kernel.cuspDiagonal T) ≠
    fixed_degree_trace (volume.restrict (Set.Icc (0 : ℝ) (2 * T))) (fun _ => e) e (fun _ => 1) := by sorry

end fixed_degree_trace

def QuasiPolynomial (f : ℤ → ℂ) : Prop :=
  ∃ period : ℕ, 0 < period ∧ ∃ p : ZMod period → Polynomial ℂ,
    ∀ t : ℤ, f t = (p (t : ZMod period)).eval (t : ℂ)


-- Fixed degree alone does not imply absolute integrability.
example : ¬ Integrable (fun _ : ℕ => (1 : ℂ)) Measure.count := by
  rw [integrable_count_iff]
  simp only [norm_one]
  intro hs
  have hh := hs.tendsto_atTop_zero
  have : (1 : ℝ) = 0 := tendsto_nhds_unique tendsto_const_nhds hh
  norm_num at this


/-- Characteristic-polynomial fibre; the bundle/finite-field carrier is imported from GN. -/
def charpoly_kernel_refinement {F : Type u} [Field F] (n : ℕ) (p : Polynomial F) :
    Set (Matrix (Fin n) (Fin n) F) := {A | A.charpoly = p}
namespace charpoly_kernel_refinement

def charpolyFibre := @charpoly_kernel_refinement

def lieKernel {I : Type u} [Countable I] {F : Type v} [Field F] (n : ℕ)
    (endomorphisms : I → Matrix (Fin n) (Fin n) F) (p : Polynomial F)
    (summand : I → ℂ) : ℂ :=
  by classical exact ∑' i, if endomorphisms i ∈ charpoly_kernel_refinement n p then summand i else 0

/- Deep-chamber quasi-polynomial continuation, not integration at nonregular T. -/

theorem test1 {F : Type u} [Field F] (n : ℕ) (a : F) :
    a • (1 : Matrix (Fin n) (Fin n) F) ∈ charpoly_kernel_refinement n ((Polynomial.X - Polynomial.C a) ^ n) := by sorry

-- Test: charpoly_kernel_refinement.test1
-- The scalar matrix a·Id belongs to the (X−a)^n characteristic-polynomial fibre.
-- The scalar matrix belongs to the specified (X−a)^n fibre.
example {F : Type u} [Field F] (n : ℕ) (a : F) :
    a • (1 : Matrix (Fin n) (Fin n) F) ∈ charpoly_kernel_refinement n ((Polynomial.X - Polynomial.C a) ^ n) := by sorry


theorem test2 {F : Type u} [Field F] (n : ℕ) (hn : 0 < n) :
    (0 : Matrix (Fin n) (Fin n) F) ∈ charpoly_kernel_refinement n (Polynomial.X ^ n) ∧
      ¬ IsUnit (0 : Matrix (Fin n) (Fin n) F) ∧
      (0 : Matrix (Fin n) (Fin n) F) ∉ charpoly_kernel_refinement n ((Polynomial.X - 1) ^ n) := by sorry

-- Test: charpoly_kernel_refinement.test2
-- For n>0, the zero matrix belongs to the X^n fibre, is not invertible, and does not belong to the (X−1)^n fibre.
-- Zero lies in the X^n fibre, is not invertible, and is excluded from the (X−1)^n fibre.
example {F : Type u} [Field F] (n : ℕ) (hn : 0 < n) :
    (0 : Matrix (Fin n) (Fin n) F) ∈ charpoly_kernel_refinement n (Polynomial.X ^ n) ∧
      ¬ IsUnit (0 : Matrix (Fin n) (Fin n) F) ∧
      (0 : Matrix (Fin n) (Fin n) F) ∉ charpoly_kernel_refinement n ((Polynomial.X - 1) ^ n) := by sorry


theorem test3 {F : Type u} [Field F] (n : ℕ) (p : Polynomial F) (A : Matrix (Fin n) (Fin n) F)
    (hA : A ∈ charpoly_kernel_refinement n p) : IsUnit A ↔ p.coeff 0 ≠ 0 := by sorry

-- Test: charpoly_kernel_refinement.test3
-- For A in the p characteristic-polynomial fibre, A is invertible iff p has nonzero constant term; on a bundle use the corresponding global Cayley–Hamilton inverse.
-- Within the p fibre, invertibility is equivalent to a nonzero constant coefficient of p.
example {F : Type u} [Field F] (n : ℕ) (p : Polynomial F) (A : Matrix (Fin n) (Fin n) F)
    (hA : A ∈ charpoly_kernel_refinement n p) : IsUnit A ↔ p.coeff 0 ≠ 0 := by sorry

end charpoly_kernel_refinement


/-- Cycle-fixed real height space. -/
def weyl_fixed_levi {r : ℕ} (w : Equiv.Perm (Fin r)) : Submodule ℝ (Fin r → ℝ) where
  carrier := {H | ∀ i, H (w i) = H i}
  zero_mem' := by sorry
  add_mem' := by sorry
  smul_mem' := by sorry
namespace weyl_fixed_levi

def leviFromCycles {r : ℕ} (w : Equiv.Perm (Fin r)) := weyl_fixed_levi w

theorem fixedVectorSpace {r : ℕ} (w : Equiv.Perm (Fin r)) (H : Fin r → ℝ) :
    H ∈ weyl_fixed_levi w ↔ H ∘ w = H := by sorry

theorem centralCharacterAction {r : ℕ} (w : Equiv.Perm (Fin r)) (lam : Fin r → ℂˣ)
    (hCycleConstant : ∀ i, lam (w i) = lam i) : lam ∘ w = lam := by sorry

theorem test1 {r : ℕ} : weyl_fixed_levi (Equiv.refl (Fin r)) = ⊤ := by sorry

-- Test: weyl_fixed_levi.test1
-- For w=1 the minimal fixed Levi is M.
example {r : ℕ} : weyl_fixed_levi (Equiv.refl (Fin r)) = ⊤ := by sorry


theorem test2 (H : Fin 2 → ℝ) : H ∈ weyl_fixed_levi (Equiv.swap 0 1) ↔ H 0 = H 1 := by sorry

-- Test: weyl_fixed_levi.test2
-- For M=GL_d×GL_d and w swapping the two blocks, L_w=GL_(2d).
example (H : Fin 2 → ℝ) : H ∈ weyl_fixed_levi (Equiv.swap 0 1) ↔ H 0 = H 1 := by sorry


theorem test3 (H : Fin 4 → ℝ) : H ∈ weyl_fixed_levi ((Equiv.swap 0 1).trans (Equiv.swap 2 3)) ↔
    H 0 = H 1 ∧ H 2 = H 3 := by sorry

-- Test: weyl_fixed_levi.test3
-- For M=GL₁^4 and w=(12)(34), L_w=GL₂×GL₂ up to permutation, rather than GL₄.
example (H : Fin 4 → ℝ) : H ∈ weyl_fixed_levi ((Equiv.swap 0 1).trans (Equiv.swap 2 3)) ↔
    H 0 = H 1 ∧ H 2 = H 3 := by sorry

end weyl_fixed_levi

/-- Determinant-coordinate monomial pairing; its additive companion uses coordinate
embedding, never a choice of logarithm. -/
def torus_pairing {I : Type u} [Fintype I] (lam : I → ℂˣ) (H : I → ℤ) : ℂˣ := ∏ i, lam i ^ H i
namespace torus_pairing

def multiplicativePairing := @torus_pairing

def linearPairing {I : Type u} [Fintype I] (lam : I → ℂˣ) (H : I → ℤ) : ℂ :=
  ∑ i, (lam i : ℂ) * H i

def centralRoots (n : ℕ) : Set ℂˣ := {z | z ^ n = 1}

theorem test1 {I : Type u} [Fintype I] (lam : I → ℂˣ) (H K : I → ℤ) :
    torus_pairing lam (H + K) = torus_pairing lam H * torus_pairing lam K := by sorry

-- Test: torus_pairing.test1
-- lambda^(H+K)=lambda^H*lambda^K for integral H,K.
example {I : Type u} [Fintype I] (lam : I → ℂˣ) (H K : I → ℤ) :
    torus_pairing lam (H + K) = torus_pairing lam H * torus_pairing lam K := by sorry


theorem test2 (a b : ℂˣ) : torus_pairing ![a, b] ![1, -1] = a / b ∧
    linearPairing ![a, b] ![1, -1] = (a : ℂ) - (b : ℂ) := by sorry

-- Test: torus_pairing.test2
-- For H=(1,−1), lambda^H=lambda1/lambda2 whereas <lambda,H>=lambda1−lambda2.
example (a b : ℂˣ) : torus_pairing ![a, b] ![1, -1] = a / b ∧
    linearPairing ![a, b] ![1, -1] = (a : ℂ) - (b : ℂ) := by sorry


theorem test3 {I : Type u} [Fintype I] (lam : I → ℂˣ) : torus_pairing lam 0 = 1 ∧ linearPairing lam 0 = 0 := by sorry

-- Test: torus_pairing.test3
-- For H=0 the multiplicative pairing is1 and the additive pairing is0.
example {I : Type u} [Fintype I] (lam : I → ℂˣ) : torus_pairing lam 0 = 1 ∧ linearPairing lam 0 = 0 := by sorry

end torus_pairing

/-- Multiplicative (G,M)-family in determinant coordinates. The adjacency relation and
coroot for each shared wall are actual AA root data, supplied here as explicit arguments. -/
structure multiplicative_gm_family {r : ℕ} (P : Type u) (A : Set (P × P))
    (coroot : P × P → Fin r → ℤ) (U : Set (Fin r → ℂˣ)) where
  member : P → (Fin r → ℂˣ) → ℂ
  regular : ∀ p, ∃ g : (Fin r → ℂ) → ℂ,
    AnalyticOnNhd ℂ g ((fun (lam : Fin r → ℂˣ) (i : Fin r) => (lam i : ℂ)) '' U) ∧
      ∀ lam ∈ U, member p lam = g (fun i => (lam i : ℂ))
  wall : ∀ pq ∈ A, ∀ lam ∈ U, torus_pairing lam (coroot pq) = 1 → member pq.1 lam = member pq.2 lam
namespace multiplicative_gm_family

theorem adjacentCompatibility {r : ℕ} {P : Type u} {A : Set (P × P)}
    {a : P × P → Fin r → ℤ} {U : Set (Fin r → ℂˣ)} (c : multiplicative_gm_family P A a U)
    (pq : P × P) (hA : pq ∈ A) (lam : Fin r → ℂˣ) (hU : lam ∈ U)
    (hWall : torus_pairing lam (a pq) = 1) : c.member pq.1 lam = c.member pq.2 lam := by sorry

def theta {r m : ℕ} (roots : Fin m → Fin r → ℤ) (lam : Fin r → ℂˣ) : ℂ :=
  ∏ j, torus_pairing.linearPairing lam (roots j)

def regularizedSum {r : ℕ} {P : Type u} [Fintype P] {A : Set (P × P)}
    {a : P × P → Fin r → ℤ} {U : Set (Fin r → ℂˣ)} (c : multiplicative_gm_family P A a U)
    (thetaQ : P → (Fin r → ℂˣ) → ℂ) (lam : Fin r → ℂˣ) : ℂ :=
  ∑ Q, c.member Q lam / thetaQ Q lam

theorem test1 (a b : ℂˣ) : theta (fun _ : Fin 1 => ![1, -1]) ![a, b] = (a : ℂ) - (b : ℂ) := by sorry

-- Test: multiplicative_gm_family.test1
-- For GL₂ with diagonal Levi, theta_B=lambda1−lambda2 and theta_Bop=lambda2−lambda1.
example (a b : ℂˣ) : theta (fun _ : Fin 1 => ![1, -1]) ![a, b] = (a : ℂ) - (b : ℂ) := by sorry


theorem test2  :
    ¬ ∃ c : multiplicative_gm_family Bool {(true, false)}
      (fun _ => ![1, -1]) (Set.univ : Set (Fin 2 → ℂˣ)),
      (∀ lam, c.member true lam = 1) ∧ (∀ lam, c.member false lam = 2) := by sorry

-- Test: multiplicative_gm_family.test2
-- The multiplicative wall equation from the actual coroot (1,−1) rejects any multiplicative_gm_family family with constant adjacent members one and two on the whole character domain.
example  :
    ¬ ∃ c : multiplicative_gm_family Bool {(true, false)}
      (fun _ => ![1, -1]) (Set.univ : Set (Fin 2 → ℂˣ)),
      (∀ lam, c.member true lam = 1) ∧ (∀ lam, c.member false lam = 2) := by sorry


theorem test3 {r : ℕ} (roots : Fin 0 → Fin r → ℤ) (lam : Fin r → ℂˣ) : theta roots lam = 1 := by sorry

-- Test: multiplicative_gm_family.test3
-- For M=G, theta_G=1 and the single holomorphic member automatically satisfies the adjacency condition.
example {r : ℕ} (roots : Fin 0 → Fin r → ℤ) (lam : Fin r → ℂˣ) : theta roots lam = 1 := by sorry

end multiplicative_gm_family


-- A genuine pole does not become removable by naming its analytic extension.
example : ¬ ∃ g : ℂ → ℂ, AnalyticAt ℂ g 1 ∧
    ∀ᶠ z in 𝓝[≠] (1 : ℂ), g z = (z - 1)⁻¹ := by
  rintro ⟨g, hg, hEq⟩
  have hlim : Tendsto (fun z : ℂ => g z * (z - 1)) (𝓝[≠] 1) (𝓝 0) := by
    have hsub : Tendsto (fun z : ℂ => z - 1) (𝓝 1) (𝓝 (1 - 1)) :=
      tendsto_id.sub tendsto_const_nhds
    have hh := hg.continuousAt.tendsto.mul hsub
    simpa using hh.mono_left nhdsWithin_le_nhds
  have hmul : (fun z : ℂ => g z * (z - 1)) =ᶠ[𝓝[≠] 1] fun _ => 1 := by
    filter_upwards [hEq, self_mem_nhdsWithin] with z hz hne
    rw [hz, inv_mul_cancel₀ (sub_ne_zero.mpr hne)]
  have hOne : Tendsto (fun z : ℂ => g z * (z - 1)) (𝓝[≠] 1) (𝓝 1) :=
    tendsto_const_nhds.congr' hmul.symm
  have : (0 : ℂ) = 1 := tendsto_nhds_unique hlim hOne
  norm_num at this


/- Basis subsets are supplied by the relative coroot datum. -/


/-- Reuse the finite covering-degree proof; the two groups need not be connected. -/
theorem torus_fourier_inversion {r : ℕ} (l d : Fin r → ℕ) (hl : ∀ j, 0 < l j) (hd : ∀ j, 0 < d j) :
    Nat.card {p : (Fin r → ℂˣ) × CycleCoordinates l //
      p.1 ∈ spectral_cycle_coordinates.A l d ∧ p.2 ∈ spectral_cycle_coordinates.B l d ∧
        (fun j t => p.1 j * cycleDifference l hl p.2 j t) = 1} =
      (∏ j, l j) * (∏ j, l j * d j) := by sorry
end TauCeti.AutomorphicSpectral

namespace TauCeti.AutomorphicSpectral
universe u v w
/-- Ordered finite-dimensional regularized trace in a chosen orthonormal basis. The
parameter `mu : ℂ` is a one-dimensional slice through the complex character torus. No cyclic permutation
is made before `weyl * twist` closes the endomorphism. -/
def finite_fibre_trace {Q : Type u} [Fintype Q] (n : ℕ) (h : Q → ℂ → ℂ)
    (ratio : Q → ℂ → Matrix (Fin n) (Fin n) ℂ)
    (weyl twist : Matrix (Fin n) (Fin n) ℂ) : ℂ :=
  Filter.limUnder (𝓝[≠] (1 : ℂ)) (fun mu =>
    Matrix.trace ((∑ q, h q mu • ratio q mu) * weyl * twist))
namespace finite_fibre_trace

/-- Source and intermediate spaces need not coincide. Both transports are retained. -/
def stabilizerTransport {A B : Type u} [AddCommGroup A] [Module ℂ A]
    [AddCommGroup B] [Module ℂ B] (U : A →ₗ[ℂ] B) (M : B →ₗ[ℂ] A) : A →ₗ[ℂ] A := M.comp U


/-- D is the full covering degree, including the finite central components. -/
def spectralContribution {A : Type u} [MeasurableSpace A] {C : Type v} [Fintype C]
    (probabilityHaar : Measure A) (stabilizerCard D : ℕ) (F : A → C → ℂ) : ℂ :=
  (stabilizerCard : ℂ)⁻¹ * ∫ lam, (D : ℂ)⁻¹ * ∑ c, F lam c ∂probabilityHaar

theorem test1 {r : ℕ} (d : Fin r → ℕ) (hd : ∀ j, 0 < d j) :
    Nat.card {p : (Fin r → ℂˣ) × CycleCoordinates (fun _ : Fin r => 1) //
      p.1 ∈ spectral_cycle_coordinates.A (fun _ => 1) d ∧ p.2 ∈ spectral_cycle_coordinates.B (fun _ => 1) d ∧
        (fun j t => p.1 j * cycleDifference (fun _ => 1) (by intro j; norm_num) p.2 j t) = 1} =
      ∏ j, d j := by sorry

-- Test: finite_fibre_trace.test1
-- For all cycle lengths one, count the actual finite kernel of the map (a,c)↦aδ(c) on the constructed A×B cover: its cardinal is ∏d_j, retaining every finite component.
example {r : ℕ} (d : Fin r → ℕ) (hd : ∀ j, 0 < d j) :
    Nat.card {p : (Fin r → ℂˣ) × CycleCoordinates (fun _ : Fin r => 1) //
      p.1 ∈ spectral_cycle_coordinates.A (fun _ => 1) d ∧ p.2 ∈ spectral_cycle_coordinates.B (fun _ => 1) d ∧
        (fun j t => p.1 j * cycleDifference (fun _ => 1) (by intro j; norm_num) p.2 j t) = 1} =
      ∏ j, d j := by sorry


/-- A twist can land in a different carrier; only the composition is an endomorphism. -/
theorem test2 {A B : Type u} [AddCommGroup A] [Module ℂ A]
    [AddCommGroup B] [Module ℂ B] (U : A →ₗ[ℂ] B) (M : B →ₗ[ℂ] A) (a : A) :
    stabilizerTransport U M a = M (U a) := by sorry

-- Test: finite_fibre_trace.test2
-- In the general stabilizer case U_tau alone need not end in A_P,pi; the trace is formed only after the Weyl transport closes the endomorphism.
example {A B : Type u} [AddCommGroup A] [Module ℂ A]
    [AddCommGroup B] [Module ℂ B] (U : A →ₗ[ℂ] B) (M : B →ₗ[ℂ] A) (a : A) :
    stabilizerTransport U M a = M (U a) := by sorry


theorem test3 (n : ℕ) (a : ℂ) (M U : Matrix (Fin n) (Fin n) ℂ) :
    finite_fibre_trace n (fun _ : Unit => fun _ => a) (fun _ _ => 1) M U = a * Matrix.trace (M * U) := by sorry

-- Test: finite_fibre_trace.test3
-- For M=L=G the parabolic sum has one term and R_G(z;v)=Id; the formula reduces to the finite character average of h_G(a) times Tr(M(1,c)∘U_tau).
example (n : ℕ) (a : ℂ) (M U : Matrix (Fin n) (Fin n) ℂ) :
    finite_fibre_trace n (fun _ : Unit => fun _ => a) (fun _ _ => 1) M U = a * Matrix.trace (M * U) := by sorry

end finite_fibre_trace


/-- Finite degree Fourier inversion uses a primitive root and every residue class.
The torus/operator order is unchanged by this scalar projection. -/
theorem degree_fourier_recovery (n : ℕ) [NeZero n] (hn : 0 < n) (zeta : ℂ) (hzeta : IsPrimitiveRoot zeta n)
    (J : ZMod n → ℂ) (twisted : ZMod n → ℂ)
    (hFourier : ∀ k, twisted k = ∑ e : ZMod n, zeta ^ (e.val * k.val) * J e) :
    ∀ e, J e = (n : ℂ)⁻¹ * ∑ k : ZMod n, zeta ^ (-(e.val * k.val : ℤ)) * twisted k := by sorry

theorem twisted_truncated_trace {X : Type u} [MeasurableSpace X] (μ : Measure X)
    (n : ℕ) (hn : 0 < n) (degree : X → ℤ) (hdeg : Measurable degree) (k : X → ℂ)
    (hk : Integrable k μ) (zeta : ℂ) (hzeta : zeta ^ n = 1) :
    (∫ x, zeta ^ degree x * k x ∂μ) = ∑ e ∈ Finset.range n,
      zeta ^ e * ∫ x, k x ∂μ.restrict {x | degree x % n = e} := by sorry


attribute [local instance] Classical.propDecidable

end TauCeti.AutomorphicSpectral


/-! ### Checks that the hypotheses of the statements above cannot be dropped -/

namespace TauCeti.AutomorphicSpectral.hypothesisChecks
universe u

-- The standard-module exponent bounds cannot hold for arbitrary finite sets.
example : ¬ (∀ a ∈ ({0} : Finset ℝ), 0 < a ∧ a < 1 / 2) := by
  norm_num

-- Zero operator families violate each unrestricted half-plane assertion.
example : ¬ (∀ s : ℂ, -1 < s.re → (0 : ℂ →L[ℂ] ℂ) ≠ 0) := by
  intro h
  exact h 0 (by norm_num) rfl

example : ¬ (∀ s : ℂ, 0 < s.re → (0 : ℂ →L[ℂ] ℂ) ≠ 0) := by
  intro h
  exact h 1 (by norm_num) rfl

example : ¬ (∀ s : ℂ, 1 / 2 ≤ s.re → (0 : ℂ →L[ℂ] ℂ) ≠ 0) := by
  intro h
  exact h 1 (by norm_num) rfl

-- Scalar normalization of an arbitrary zero integral remains zero.
example : shahidi_normalization (fun _ => 1) (fun _ => 1)
    (fun _ => 1) (fun _ => 1) (fun _ => (0 : ℂ →L[ℂ] ℂ)) 1 = 0 := by
  simp [shahidi_normalization]

namespace arthur_truncation
/-- Finite but incoherent data: a proper constant term scaled by two. -/
def incoherentData (X : Type u) : TruncationData X Unit where
  Proper := PUnit.{u + 1}
  finite := inferInstance
  Cosets := fun _ => PUnit.{u + 1}
  countable := fun _ => inferInstance
  rank := fun _ => 1
  constantTerm := fun _ => (2 : ℂ) • LinearMap.id
  translate := fun _ _ => id
  height := fun _ _ => 0
  cutoff := fun _ _ => 1

theorem incoherentData_apply {X : Type u} (T : Height Unit) (f : X → ℂ) (x : X) :
    arthur_truncation (incoherentData X) T f x = -f x := by
  simp [arthur_truncation, incoherentData]
  change f x + -(((Finset.univ : Finset PUnit.{u + 1}).card : ℂ) * (2 * f x)) = -f x
  simp only [Finset.card_univ, Fintype.card_punit, Nat.cast_one, one_mul]
  ring

-- Finite coset support alone does not imply idempotence.
example :
    (∀ P : (incoherentData Unit).Proper, ∀ x : Unit,
      Set.Finite {j : (incoherentData Unit).Cosets P |
        (incoherentData Unit).cutoff P
          ((incoherentData Unit).height P ((incoherentData Unit).translate P j x) - 0) ≠ 0}) ∧
    arthur_truncation (incoherentData Unit) 0
      (arthur_truncation (incoherentData Unit) 0 (fun _ => 1)) () ≠
      arthur_truncation (incoherentData Unit) 0 (fun _ => 1) () := by
  constructor
  · intro P x
    change Set.Finite {j : PUnit | (1 : ℂ) ≠ 0}
    exact Set.toFinite _
  · simp only [incoherentData_apply]
    norm_num

-- Even the exponent-one bound fails for an unrelated height and truncation.
example : ¬ ∃ C : ℝ, ∀ x ∈ Set.Ici (1 : ℝ),
    x ^ (1 : ℕ) * ‖arthur_truncation (incoherentData ℝ) 0 (fun _ => 1) x‖ ≤ C := by
  rintro ⟨C, hC⟩
  have h := hC (max C 1 + 1) (by simp only [Set.mem_Ici]; have := le_max_right C 1; linarith)
  simp only [incoherentData_apply] at h
  norm_num at h
  have := le_max_left C 1
  linarith
end arthur_truncation

-- An arbitrary singleton cone product has no incidence cancellation.
example : (∑ _ : Unit, (-1 : ℂ) ^ (1 : ℕ) * (1 : ℂ) * (1 : ℂ)) ≠ 0 := by
  norm_num

-- An empty unrelated Weyl sum cannot equal the Gram pairing of two ones.
example : inner ℂ (1 : ℂ) (1 : ℂ) ≠ ∑ _ : Fin 0, (0 : ℂ) := by
  norm_num

-- A positive constant error cannot be bounded by zero inducing-vector norms.
example : ¬ ∃ eps C N : ℝ, 0 < eps ∧ ∀ T : ℝ, N < T →
    ‖(1 : ℂ) - 0‖ ≤ C * ‖(0 : ℂ)‖ * ‖(0 : ℂ)‖ * Real.exp (-eps * |T|) := by
  rintro ⟨eps, C, N, _, hBound⟩
  have h := hBound (N + 1) (by linarith)
  norm_num at h

-- One polar summand prevents the asserted unrestricted regularized extension.
example : ¬ ∃ g : ℂ → ℂ, AnalyticAt ℂ g 0 ∧
    ∀ᶠ s in 𝓝[≠] (0 : ℂ), g s = ∑ _ : Unit, s⁻¹ := by
  rintro ⟨g, hg, hEq⟩
  have hlim : Tendsto (fun s : ℂ => g s * s) (𝓝[≠] 0) (𝓝 0) := by
    have hh := hg.continuousAt.tendsto.mul (tendsto_id : Tendsto (fun s : ℂ => s) (𝓝 0) (𝓝 0))
    simpa using hh.mono_left nhdsWithin_le_nhds
  have hmul : (fun s : ℂ => g s * s) =ᶠ[𝓝[≠] 0] fun _ => 1 := by
    filter_upwards [hEq, self_mem_nhdsWithin] with s hs hne
    simpa [hs, hne] using inv_mul_cancel₀ hne
  have hOne : Tendsto (fun s : ℂ => g s * s) (𝓝[≠] 0) (𝓝 1) :=
    tendsto_const_nhds.congr' hmul.symm
  have : (0 : ℂ) = 1 := tendsto_nhds_unique hlim hOne
  norm_num at this
-- These checks use native scalar L² and do not invoke admitted field constructions.
/-- An infinite atom defeats the unrestricted direct-integral norm formula. -/
abbrev infiniteAtom : Measure ℝ := (∞ : ℝ≥0∞) • Measure.dirac 0

/-- Every finite-L² class vanishes on the infinite atom. -/
theorem infiniteAtom_lp_zero (f : Lp ℂ 2 infiniteAtom) : f = 0 := by
  have hfinite := (Lp.memLp f).2
  have hpoint : f 0 = 0 := by
    by_contra h
    dsimp only [infiniteAtom] at hfinite
    rw [eLpNorm_smul_measure_of_ne_zero (by simp),
      eLpNorm_dirac f 0 (by norm_num)] at hfinite
    have hn : ‖f 0‖ₑ ≠ 0 := by simpa using h
    norm_num at hfinite
    simp [hn] at hfinite
  apply Lp.ext
  change ∀ᵐ x ∂(∞ : ℝ≥0∞) • Measure.dirac (0 : ℝ), f x = (0 : Lp ℂ 2 infiniteAtom) x
  rw [Measure.ae_ennreal_smul_measure_iff (by simp)]
  have hzero := (Lp.coeFn_zero ℂ 2 infiniteAtom)
  change ∀ᵐ x ∂(∞ : ℝ≥0∞) • Measure.dirac (0 : ℝ),
    (0 : Lp ℂ 2 infiniteAtom) x = 0 at hzero
  rw [Measure.ae_ennreal_smul_measure_iff (by simp)] at hzero
  filter_upwards [ae_eq_dirac (a := (0 : ℝ)) f, hzero] with x hx hz
  rw [hx, hz, hpoint]
  rfl

example : essSup (fun _ : ℝ => (1 : ℝ≥0∞)) infiniteAtom = 1 := by
  apply essSup_const
  intro h
  have := congrArg (fun μ : Measure ℝ => μ Set.univ) h
  simp [infiniteAtom] at this

example : ¬ SigmaFinite infiniteAtom := by
  intro h
  have := h
  have := measure_singleton_lt_top (μ := infiniteAtom) (a := (0 : ℝ))
  simp [infiniteAtom] at this

example : ENNReal.ofReal ‖ContinuousLinearMap.id ℂ (Lp ℂ 2 infiniteAtom)‖ ≠
    essSup (fun _ : ℝ => (1 : ℝ≥0∞)) infiniteAtom := by
  have : Subsingleton (Lp ℂ 2 infiniteAtom) :=
    ⟨fun f g => (infiniteAtom_lp_zero f).trans (infiniteAtom_lp_zero g).symm⟩
  have hid : ContinuousLinearMap.id ℂ (Lp ℂ 2 infiniteAtom) = 0 := by
    ext1 f
    exact Subsingleton.elim _ _
  rw [hid]
  simp only [norm_zero, ENNReal.ofReal_zero]
  rw [essSup_const]
  · norm_num
  · intro h
    have := congrArg (fun μ : Measure ℝ => μ Set.univ) h
    simp [infiniteAtom] at this
end TauCeti.AutomorphicSpectral.hypothesisChecks

/-!
## Statements not typed at the pins

The README states the following targets; no pinned library or bundle signature provides their
carriers, so they have no declaration here. A declaration with an arbitrary stand-in carrier
would assert them for data that does not satisfy them.

* **Adelic Eisenstein series and intertwining operators** need rational parabolics with their
  Levi decompositions, the height `H_P` and the induced spaces on `G(𝔸)` (AdelicAlgebraicGroups
  §3.1, which has no Lean carrier at the pins): `eisenstein_convergence`,
  `convergent_intertwiner.intertwines`, `convergent_intertwiner.identity`,
  `convergent_intertwiner.holomorphic_chamber`, `cuspidal_constant_term`, `pseudo_eisenstein_l2`,
  `pseudo_eisenstein_inner_product`, `pseudo_eisenstein.eisenstein_integral`,
  `cuspidal_datum_space.associate_eq`, `induced_family.local_tensor`, `eisenstein_continuation`,
  `local_normalization`, `intertwiner_factorization`, `local_intertwiner.meromorphic_coefficients`,
  `mu_function.opposite_composition`, `mu_function.rank_one_product` and
  `spherical_scalar_intertwiner` (AS.1–AS.2).
* **Packets of classical groups** need local L-parameters, tempered packets and standard modules
  of classical groups and their pure inner forms: `generic_packet` with `mem_iff`, `tempered`,
  `local_factor`, `tempered_packet`, `sl2_complementary` and `trivial_not_generic`;
  `shahidi_normalization.target`, `shahidi_normalization.global_product`,
  `generic_standard_module`, `tempered_gl_intertwiner`, `tempered_standard_intertwiner`,
  `generic_normalized_intertwiner` and `jiang_zhang_holomorphy` (AS.2.6a–AS.2.12).
* **Truncation and the Maass–Selberg relations** need rational constant terms on the arithmetic
  quotient, coherent root data and Siegel sets: `truncation_cones.alternating_sum`,
  `arthur_truncation.local_finite`, `truncation_projection`, `truncation_rapid_decay`,
  `cuspidal_maass_selberg`, `discrete_maass_selberg_asymptotic`, `wave_packet_gram` and
  `singular_parameter_limits` (AS.3).
* **The spectral decomposition** needs `L²(G(F)\G(𝔸)¹)` with its right regular representation and
  its cuspidal, residual and continuous parts: `spectral_orthosum`,
  `associate_parameter_fields.quotient_equiv`, `associate_parameter_fields.weyl_transport`,
  `residual_spectrum.residue_mem`, `discrete_spherical_spectrum.cuspidalInclusion`,
  `discrete_finite_multiplicity`, `compact_quotient_spectrum`, `wallach_cuspidality`,
  `moeglin_waldspurger`, `residual_twist_stabilizer`, `stabilizing_twist_spherical` and
  `residual_eisenstein_residue` (AS.4).
* **Franke's comparison** needs weighted de Rham complexes on arithmetic quotients and derived
  functors of `(𝔤, K)`-modules: `weighted_l2_complex.d_squared`, `franke_filtration.levi_compatible`,
  `weighted_regularization`, `derived_finite_character`,
  `eisenstein_principal_value.graded_independent`, `franke_graded_isomorphism`,
  `weighted_finite_character_acyclic`, `constant_term_resolution`, `franke_comparison`,
  `gl_sl_cuspidal_diagram`, `franke_schwermer_support` and `isobaric_realization` (AS.5).
* **Real harmonic analysis** needs finite-length Harish-Chandra modules of a real reductive group,
  their Grothendieck group and invariant Paley–Wiener spaces: `real_invariant_paley_wiener`,
  `real_operator_paley_wiener`, the existence of `spectral_multiplier` data for each compactly
  supported invariant distribution (Arthur's multiplier theorem; the structure above takes it as
  data), `spectral_multiplier.support`, `discrete_functional_trace` and `pseudo_coefficient` with
  `admissible_iff`, `pseudo_coefficient_trace`, `compact_group`, `general_trace_not_discrete` and
  `noncompact_centre`; `general_euler_poincare` with `trace_identity`, `no_discrete_series` and
  `no_discrete_series_test`; `almost_compact_test_space.weighted_fourier`; and `l2_lefschetz`
  (AS.6.1–AS.6.3, AS.6.13, AS.6.16a–AS.6.18).
* **The trace formula** needs right convolution on `G(F)\G(𝔸)¹`, its class decompositions and
  `(G, M)`-families attached to a root datum: `automorphic_kernel.operator`,
  `coarse_truncated_kernel.decomposition`, `coarse_truncated_kernel.levi_translation`,
  `coarse_trace_identity`, `gm_family.regularized_sum`, `gm_splitting`,
  `weighted_orbital_integral.splitting`, `fine_geometric_expansion`, `fine_spectral_expansion`,
  `invariant_trace_formula` and `compact_trace_specialization`, and the centralizer statements
  `orbital_integral.invariant`, `orbital_integral.fibre_card` and
  `orbital_integral.full_centralizer` (AS.6).
* **Function-field `GLₙ`** needs the moduli of bundles on the curve, the degree lattice and
  holomorphic families on complex character tori: `degree_cutoff_vanishing`, `cutoff_degree_order`,
  `cone_sum_levi_vanishing`, `floor_monomial_family.wallAgreement`,
  `floor_monomial_family.cutoffFactor`, `fixed_degree_continuation`,
  `charpoly_kernel_refinement.continueInT`, `coprime_nilpotent_vanishing`,
  `regularized_family_value`, `family_product_formula`, `root_product_derivative`,
  `root_coordinate_haar`, `family_argument_principle`, `family_central_vanishing`,
  `finite_fibre_trace.regularizedFamily`, `arthur_lafforgue_spectral`,
  `lafforgue_spectral_expansion` and `root_basis_identity` (AS.3, AS.6).
* **The modular `L²` realization** needs the Laplacian on `L²(Γ\ℍ)` with its Hecke–Maass
  eigenbasis and continued Poincaré series: `gl2_spectral_expansion`, `modular_weyl_estimates`,
  `cusp_decay`, `wrong_sign_weyl_vanishing`, `resolvent_kernel.kernelSymmetry`,
  `resolvent_kernel_fourier`, `resolvent_polar_part`, `poincare_residue`,
  `bessel_coefficient_residue`, and the `E_{2,s}` expansion in `eisenstein_fourier_weight_two`
  (AS.1, AS.2, AS.4).
-/
