import Mathlib.Analysis.Normed.Unbundled.IsPowMulFaithful
import Mathlib.Topology.Order.Compact
import Mathlib.Topology.ContinuousMap.Basic
import Mathlib.Analysis.Normed.Group.Constructions
import Mathlib.Algebra.Ring.Prod

/-!
# Berkovich spaces and tropical curves: representative target signatures

This file is not the roadmap and is not exhaustive. The definitive document is
`research/blueprint/readmes/TropicalAndBerkovichArithmetic.md`. These statements suggest Lean
forms so that contributors and reviewers converge on names and signatures. They claim no
implementation. The definitions here bundle native multiplicative seminorms and give them
the evaluation topology. Analytic spaces, metric graphs, model measures and uniformization
require their own carriers and are specified with full APIs and checks in the reader.
-/

noncomputable section

namespace TauCeti.Berkovich

open Filter Topology

variable (A : Type*) [NormedCommRing A]

/-! ## Layer 0: spectra of normed rings -/

/-- Actual normalized real-valued seminorms dominated by the specified ambient norm.
Completeness and a base field are not needed for this carrier. -/
def Spectrum := {p : MulRingSeminorm A // ∀ a, p a ≤ ‖a‖}

namespace Spectrum

variable {A} {B : Type*} [NormedCommRing B]

/-- Forget the bound while retaining Mathlib's seminorm. -/
abbrev toSeminorm (x : Spectrum A) : MulRingSeminorm A := x.val

/-- Evaluation at a ring element is the coordinate used in the topology. -/
abbrev eval (x : Spectrum A) (a : A) : ℝ := x.toSeminorm a

/-- The native seminorm and its domination proof give a point. -/
def ofSeminorm (p : MulRingSeminorm A) (hp : ∀ a, p a ≤ ‖a‖) : Spectrum A := ⟨p, hp⟩

/-- All coordinates, rather than a selected set of generators, define the topology. -/
instance topology : TopologicalSpace (Spectrum A) :=
  TopologicalSpace.induced (fun x : Spectrum A => x.eval) inferInstance

/-- The given multiplicative field norm is its spectral point. -/
def normPoint (K : Type*) [NormedField K] : Spectrum K :=
  ⟨{ (normRingSeminorm K).toAddGroupSeminorm with
      map_one' := norm_one
      map_mul' := norm_mul }, fun _ => le_rfl⟩

/-- Temkin 2.2.2.1: compactness needs neither completeness nor a nonzero ring. -/
theorem compact_univ : IsCompact (Set.univ : Set (Spectrum A)) := sorry

/-- The evaluation topology is Hausdorff. -/
theorem hausdorff : T2Space (Spectrum A) := sorry

/-- Berkovich Theorem 1.2.1: a nonzero complete Banach ring has a point. -/
theorem nonempty [CompleteSpace A] [NormOneClass A] [Nontrivial A] :
    Nonempty (Spectrum A) := sorry

/-- Berkovich Corollary 1.2.4: spectral evaluations detect units. -/
theorem isUnit_iff [CompleteSpace A] [NormOneClass A] (a : A) :
    IsUnit a ↔ ∀ x : Spectrum A, 0 < x.eval a := sorry

/-- Berkovich Theorem 1.3.1: the spectral radius is attained by a point. -/
theorem spectral_maximum [CompleteSpace A] [NormOneClass A] [Nontrivial A] (a : A) :
    ∃ x : Spectrum A, (∀ y : Spectrum A, y.eval a ≤ x.eval a) ∧
      Tendsto (fun n : ℕ => ‖a ^ (n + 1)‖ ^ ((n + 1 : ℝ)⁻¹))
        atTop (𝓝 (x.eval a)) := sorry

/-- Bounded ring maps induce continuous pullbacks with the expected evaluations. -/
theorem exists_comap (f : A →+* B) (hf : f.IsBounded) :
    ∃ g : C(Spectrum B, Spectrum A), ∀ (x : Spectrum B) (a : A),
      (g x).eval a = x.eval (f a) := sorry

/-- On a normed field, inverse bounds force every point to be the norm point. -/
theorem eq_normPoint (K : Type*) [NormedField K] (x : Spectrum K) :
    x = normPoint K := sorry

/-- The zero ring is a necessary exception to nonemptiness. -/
example [Subsingleton A] : IsEmpty (Spectrum A) := sorry

/-- The native multiplicative seminorm is recovered without changing its values. -/
example (p : MulRingSeminorm A) (hp : ∀ a, p a ≤ ‖a‖) :
    (ofSeminorm p hp).toSeminorm = p := sorry

/-- Product coordinates distinguish spectral points; the ambient norm is not multiplicative. -/
example : ¬ ∀ a b : ℝ × ℝ, ‖a * b‖ = ‖a‖ * ‖b‖ := sorry

/-- Testing all evaluations is exactly the continuity criterion. -/
example {Z : Type*} [TopologicalSpace Z] (f : Z → Spectrum A) :
    Continuous f ↔ ∀ a, Continuous (fun z => (f z).eval a) := sorry

/-- Inverse bounds determine the real field point on negative elements. -/
example (x : Spectrum ℝ) : x.eval (-3) = 3 := sorry

/-- The unit and inverse calibrate the norm point. -/
example : (normPoint ℝ).eval (2 : ℝ)⁻¹ = 1 / 2 := sorry

end Spectrum
end TauCeti.Berkovich
