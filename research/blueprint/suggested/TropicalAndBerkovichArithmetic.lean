/-
This file is not the roadmap and is not exhaustive. The roadmap document is definitive.
These statements suggest Lean forms so that contributors and reviewers converge on names
and signatures. Every item is a plan; no implementation claim is made.

The typed component is TB.0: the bounded seminorm spectrum of a normed commutative ring.
TB.2 and TB.5 retain source-derived targets in the packet. Their missing analytic-curve,
annulus, formal-model and tropical carriers prevent faithful signatures here; their exact
omissions are recorded in the packet and handoff, without placeholder predicates.
-/
import Mathlib.Analysis.Normed.Unbundled.IsPowMulFaithful
import Mathlib.Topology.Order.Compact
import Mathlib.Topology.ContinuousMap.Basic
import Mathlib.Analysis.Normed.Group.Constructions
import Mathlib.Algebra.Ring.Prod

noncomputable section

namespace TauCeti.Berkovich

variable (A : Type*) [NormedCommRing A]

/-- TB.0/spectrum: a subtype of the native multiplicative ring seminorms. -/
def Spectrum := {p : MulRingSeminorm A // ∀ a, p a ≤ ‖a‖}

namespace Spectrum

variable {A} {B : Type*} [NormedCommRing B] {D : Type*} [NormedCommRing D]

-- API of TB.0/spectrum
abbrev toSeminorm (x : Spectrum A) : MulRingSeminorm A := x.val
abbrev eval (x : Spectrum A) (a : A) : ℝ := x.toSeminorm a

def ofSeminorm (p : MulRingSeminorm A) (hp : ∀ a, p a ≤ ‖a‖) : Spectrum A := sorry

theorem ofSeminorm_eval (p : MulRingSeminorm A) (hp : ∀ a, p a ≤ ‖a‖) (a : A) :
    (ofSeminorm p hp).eval a = p a := sorry

theorem ext {x y : Spectrum A} (h : ∀ a, x.eval a = y.eval a) : x = y := sorry

theorem eval_zero (x : Spectrum A) : x.eval 0 = 0 := sorry
theorem eval_one (x : Spectrum A) : x.eval 1 = 1 := sorry
theorem eval_mul (x : Spectrum A) (a b : A) : x.eval (a * b) = x.eval a * x.eval b := sorry
theorem eval_neg (x : Spectrum A) (a : A) : x.eval (-a) = x.eval a := sorry
theorem eval_add_le (x : Spectrum A) (a b : A) : x.eval (a + b) ≤ x.eval a + x.eval b := sorry
theorem eval_nonneg (x : Spectrum A) (a : A) : 0 ≤ x.eval a := sorry
theorem eval_le_norm (x : Spectrum A) (a : A) : x.eval a ≤ ‖a‖ := sorry

-- Spectrum.zeroRing_empty
example [Subsingleton A] : IsEmpty (Spectrum A) := sorry
-- Spectrum.zeroFunction_excluded
example (x : Spectrum A) : ¬ (∀ a, x.eval a = 0) := sorry
-- Spectrum.native_compatibility
example (p : MulRingSeminorm A) (hp : ∀ a, p a ≤ ‖a‖) :
    (ofSeminorm p hp).toSeminorm = p := sorry

/-- TB.0/bounded-iff-dominated: specialization of the existing power trick. -/
theorem bounded_iff_dominated (p : MulRingSeminorm A) :
    (RingHom.id A).IsBoundedWrt (normRingSeminorm A) p ↔ ∀ a, p a ≤ ‖a‖ := sorry

/-- TB.0/evaluation-topology: induced from the full function space, using every a in A. -/
instance topology : TopologicalSpace (Spectrum A) :=
  TopologicalSpace.induced (fun x : Spectrum A => x.eval) inferInstance

-- API of TB.0/evaluation-topology
theorem continuous_eval (a : A) : Continuous (fun x : Spectrum A => x.eval a) := sorry

theorem continuous_iff {Z : Type*} [TopologicalSpace Z] (f : Z → Spectrum A) :
    Continuous f ↔ ∀ a, Continuous (fun z => (f z).eval a) := sorry

theorem topology_eq_induced :
    topology (A := A) = TopologicalSpace.induced (fun x : Spectrum A => x.eval) inferInstance := sorry

-- Spectrum.topology_zero_coordinate
example : Continuous (fun x : Spectrum A => x.eval 0) := sorry
-- Spectrum.topology_product_coordinates
example (a b : A) : Continuous (fun x : Spectrum A => (x.eval a, x.eval b)) := sorry
-- Spectrum.topology_all_coordinates
example {Z : Type*} [TopologicalSpace Z] (f : Z → Spectrum A)
    (h : ∀ a, Continuous (fun z => (f z).eval a)) : Continuous f := sorry

/-- TB.0/evaluation-embedding. -/
theorem isEmbedding_eval : Topology.IsEmbedding (fun x : Spectrum A => x.eval) := sorry

/-- TB.0/evaluation-range: closed algebraic and inequality conditions in a product of reals. -/
theorem range_eval :
    Set.range (fun x : Spectrum A => x.eval) =
      {v : A → ℝ | v 0 = 0 ∧ v 1 = 1 ∧ (∀ a, v (-a) = v a) ∧
        (∀ a b, v (a + b) ≤ v a + v b) ∧ (∀ a b, v (a * b) = v a * v b) ∧
        (∀ a, 0 ≤ v a ∧ v a ≤ ‖a‖)} := sorry

/-- TB.0/closed-evaluation-range. -/
theorem isClosed_range_eval : IsClosed (Set.range (fun x : Spectrum A => x.eval)) := sorry

/-- TB.0/compact-spectrum: completeness of A is not needed for compactness. -/
instance compactSpace : CompactSpace (Spectrum A) := sorry

/-- TB.0/hausdorff-spectrum. -/
instance t2Space : T2Space (Spectrum A) := sorry

/-- TB.0/comap: contravariant pullback along a bounded ring homomorphism. -/
def comap (f : A →+* B) (hf : f.IsBounded) : C(Spectrum B, Spectrum A) := sorry

-- API of TB.0/comap
theorem comap_eval (f : A →+* B) (hf : f.IsBounded) (x : Spectrum B) (a : A) :
    (comap f hf x).eval a = x.eval (f a) := sorry

theorem comap_id (h : (RingHom.id A).IsBounded) (x : Spectrum A) :
    comap (RingHom.id A) h x = x := sorry

theorem comap_comp (f : A →+* B) (hf : f.IsBounded) (g : B →+* D)
    (hg : g.IsBounded) (hgf : (g.comp f).IsBounded) (x : Spectrum D) :
    comap (g.comp f) hgf x = comap f hf (comap g hg x) := sorry

theorem comap_continuous (f : A →+* B) (hf : f.IsBounded) : Continuous (comap f hf) := sorry

theorem comap_proof_irrel (f : A →+* B) (hf hg : f.IsBounded) : comap f hf = comap f hg := sorry

/-- TB.0/field-norm-point. -/
def normPoint (K : Type*) [NormedField K] : Spectrum K := sorry

-- API of TB.0/field-norm-point
theorem normPoint_eval (K : Type*) [NormedField K] (a : K) : (normPoint K).eval a = ‖a‖ := sorry

theorem normPoint_toMonoidWithZeroHom (K : Type*) [NormedField K] :
    (normPoint K).toSeminorm.toMonoidWithZeroHom = normHom := sorry

theorem normPoint_eq_ofSeminorm (K : Type*) [NormedField K]
    (p : MulRingSeminorm K) (h : ∀ a, p a = ‖a‖) (hp : ∀ a, p a ≤ ‖a‖) :
    normPoint K = ofSeminorm p hp := sorry

-- Spectrum.normPoint_two
example : (normPoint ℝ).eval 2 = 2 := sorry
-- Spectrum.normPoint_zero
example : (normPoint ℝ).eval 0 = 0 := sorry
-- Spectrum.normPoint_inverse
example : (normPoint ℝ).eval (2 : ℝ)⁻¹ = 1 / 2 := sorry

/-- TB.0/field-spectrum-singleton: inverse bounds force equality. -/
theorem eq_normPoint (K : Type*) [NormedField K] (x : Spectrum K) : x = normPoint K := sorry

-- Spectrum.comap_first_projection
example (h : (RingHom.fst ℝ ℝ).IsBounded) :
    (comap (RingHom.fst ℝ ℝ) h (normPoint ℝ)).eval (2, 3) = 2 := sorry
-- Spectrum.comap_second_projection
example (h : (RingHom.snd ℝ ℝ).IsBounded) :
    (comap (RingHom.snd ℝ ℝ) h (normPoint ℝ)).eval (2, 3) = 3 := sorry
-- Spectrum.comap_id_real
example (h : (RingHom.id ℝ).IsBounded) :
    comap (RingHom.id ℝ) h (normPoint ℝ) = normPoint ℝ := sorry
-- Spectrum.comap_distinguishes_projections
example (hf : (RingHom.fst ℝ ℝ).IsBounded) (hs : (RingHom.snd ℝ ℝ).IsBounded) :
    comap (RingHom.fst ℝ ℝ) hf (normPoint ℝ) ≠
      comap (RingHom.snd ℝ ℝ) hs (normPoint ℝ) := sorry
-- Spectrum.nonmultiplicative_product_norm
example : ¬ ∀ a b : ℝ × ℝ, ‖a * b‖ = ‖a‖ * ‖b‖ := sorry
-- Spectrum.topology_distinguishes_projections
example (hf : (RingHom.fst ℝ ℝ).IsBounded) (hs : (RingHom.snd ℝ ℝ).IsBounded) :
    ∃ U : Set (Spectrum (ℝ × ℝ)), IsOpen U ∧
      comap (RingHom.fst ℝ ℝ) hf (normPoint ℝ) ∈ U ∧
      comap (RingHom.snd ℝ ℝ) hs (normPoint ℝ) ∉ U := sorry
-- Spectrum.compact_real_product
example : CompactSpace (Spectrum (ℝ × ℝ)) := sorry
-- Spectrum.field_singleton_real
example (x : Spectrum ℝ) : x.eval (-3) = 3 := sorry

end Spectrum
end TauCeti.Berkovich
