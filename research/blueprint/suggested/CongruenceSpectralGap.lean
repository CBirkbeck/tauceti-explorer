import Mathlib.NumberTheory.ModularForms.CongruenceSubgroups
import Mathlib.Analysis.Complex.UpperHalfPlane.Measure
import Mathlib.MeasureTheory.Group.FundamentalDomain
import Mathlib.MeasureTheory.Function.L2Space
import Mathlib.Analysis.MellinTransform
import Mathlib.Analysis.MellinInversion
import Mathlib.Analysis.SpecialFunctions.Gamma.Deligne
import Mathlib.NumberTheory.DirichletCharacter.Orthogonality
import Mathlib.NumberTheory.GaussSum
import Mathlib.Analysis.SpecialFunctions.Complex.CircleAddChar
import Mathlib.Analysis.Calculus.ContDiff.Defs
import TauCeti.Analysis.InnerProductSpace.LinearPMap.SelfAdjoint

/-!
This file is not the roadmap and is not exhaustive. The roadmap document is definitive.
These statements suggest Lean forms so that contributors and reviewers converge on names
and signatures. Nothing here claims implementation; the proposed proofs use `sorry`.

Native GL_m automorphic representations and their completed Rankin–Selberg functions are
absent at the pinned baseline. Their theorems, named explicitly at the end, are described
in the document and packet rather than represented by artificial proposition carriers.
The quotient, L² operator, Mellin kernels and finite character averages use existing types.
-/

noncomputable section
open MeasureTheory Filter Set Complex
open scoped MatrixGroups Topology BigOperators ContDiff
attribute [local instance] Classical.propDecidable

namespace TauCeti.CongruenceSpectralGap

abbrev ModularQuotient (Γ : Subgroup SL(2, ℤ)) := MulAction.orbitRel.Quotient Γ UpperHalfPlane
abbrev EffectiveGroup (Γ : Subgroup SL(2, ℤ)) :=
  (MulAction.toPermHom Γ UpperHalfPlane).range

-- CSG.0: the measure is the pushforward of hyperbolic area restricted to an effective
-- fundamental domain. The kernel ±I must be removed before applying IsFundamentalDomain.
def quotientMeasure (Γ : Subgroup SL(2, ℤ))
    (hΓ : CongruenceSubgroup.IsCongruenceSubgroup Γ) : Measure (ModularQuotient Γ) := by
  sorry

abbrev QuotientL2 (Γ : Subgroup SL(2, ℤ))
    (hΓ : CongruenceSubgroup.IsCongruenceSubgroup Γ) := Lp ℂ 2 (quotientMeasure Γ hΓ)

lemma quotientMeasure_eq_map (Γ : Subgroup SL(2, ℤ))
    (hΓ : CongruenceSubgroup.IsCongruenceSubgroup Γ) (F : Set UpperHalfPlane)
    (hF : IsFundamentalDomain (EffectiveGroup Γ) F (volume : Measure UpperHalfPlane)) :
    quotientMeasure Γ hΓ = Measure.map (Quotient.mk (MulAction.orbitRel Γ UpperHalfPlane))
      ((volume : Measure UpperHalfPlane).restrict F) := by
  sorry

lemma quotientMeasure_finite (Γ : Subgroup SL(2, ℤ))
    (hΓ : CongruenceSubgroup.IsCongruenceSubgroup Γ) :
    quotientMeasure Γ hΓ univ < ⊤ := by
  sorry

lemma quotientMeasure_proof_irrel (Γ : Subgroup SL(2, ℤ))
    (hΓ hΓ' : CongruenceSubgroup.IsCongruenceSubgroup Γ) :
    quotientMeasure Γ hΓ = quotientMeasure Γ hΓ' := by
  sorry

-- quotientMeasure.level_one
example : (quotientMeasure (CongruenceSubgroup.Gamma 1)
    (CongruenceSubgroup.Gamma_is_cong_sub 1) univ).toReal = Real.pi / 3 := by
  sorry
-- quotientMeasure.nonzero
example (Γ : Subgroup SL(2, ℤ)) (hΓ : CongruenceSubgroup.IsCongruenceSubgroup Γ) :
    0 < quotientMeasure Γ hΓ univ := by
  sorry
-- quotientMeasure.level_two: the effective index is six.
example : (quotientMeasure (CongruenceSubgroup.Gamma 2)
    (CongruenceSubgroup.Gamma_is_cong_sub 2) univ).toReal = 2 * Real.pi := by
  sorry
-- quotientMeasure.domain_independence
example (Γ : Subgroup SL(2, ℤ)) (hΓ : CongruenceSubgroup.IsCongruenceSubgroup Γ)
    (F F' : Set UpperHalfPlane)
    (hF : IsFundamentalDomain (EffectiveGroup Γ) F (volume : Measure UpperHalfPlane))
    (hF' : IsFundamentalDomain (EffectiveGroup Γ) F' (volume : Measure UpperHalfPlane)) :
    (volume : Measure UpperHalfPlane) F = volume F' := by
  sorry

-- Positive Friedrichs realization of -y²(∂x²+∂y²), using orbifold smooth lifts.
def quotientLaplacian (Γ : Subgroup SL(2, ℤ))
    (hΓ : CongruenceSubgroup.IsCongruenceSubgroup Γ) :
    QuotientL2 Γ hΓ →ₗ.[ℂ] QuotientL2 Γ hΓ := by
  sorry

lemma quotientLaplacian_selfAdjoint (Γ : Subgroup SL(2, ℤ))
    (hΓ : CongruenceSubgroup.IsCongruenceSubgroup Γ) :
    IsSelfAdjoint (quotientLaplacian Γ hΓ) := by
  sorry

lemma quotientLaplacian_dense_domain (Γ : Subgroup SL(2, ℤ))
    (hΓ : CongruenceSubgroup.IsCongruenceSubgroup Γ) :
    Dense ((quotientLaplacian Γ hΓ).domain : Set (QuotientL2 Γ hΓ)) := by
  sorry

lemma quotientLaplacian_nonnegative (Γ : Subgroup SL(2, ℤ))
    (hΓ : CongruenceSubgroup.IsCongruenceSubgroup Γ)
    (u : (quotientLaplacian Γ hΓ).domain) :
    0 ≤ (inner ℂ (u : QuotientL2 Γ hΓ) (quotientLaplacian Γ hΓ u)).re := by
  sorry

lemma quotientLaplacian_kernel_constants (Γ : Subgroup SL(2, ℤ))
    (hΓ : CongruenceSubgroup.IsCongruenceSubgroup Γ)
    (u : (quotientLaplacian Γ hΓ).domain) :
    quotientLaplacian Γ hΓ u = 0 ↔
      ∃ c : ℂ, (u : QuotientL2 Γ hΓ) =ᵐ[quotientMeasure Γ hΓ] (fun _ => c) := by
  sorry

-- quotientLaplacian.zero
example (Γ : Subgroup SL(2, ℤ)) (hΓ : CongruenceSubgroup.IsCongruenceSubgroup Γ) :
    quotientLaplacian Γ hΓ 0 = 0 := by
  sorry
-- quotientLaplacian.constant
example (Γ : Subgroup SL(2, ℤ)) (hΓ : CongruenceSubgroup.IsCongruenceSubgroup Γ) :
    ∃ u : (quotientLaplacian Γ hΓ).domain,
      (u : QuotientL2 Γ hΓ) =ᵐ[quotientMeasure Γ hΓ] (fun _ => (1 : ℂ)) ∧
      quotientLaplacian Γ hΓ u = 0 := by
  sorry
-- quotientLaplacian.sign
example (Γ : Subgroup SL(2, ℤ)) (hΓ : CongruenceSubgroup.IsCongruenceSubgroup Γ)
    (u : (quotientLaplacian Γ hΓ).domain) (hu : quotientLaplacian Γ hΓ u ≠ 0) :
    0 < (inner ℂ (u : QuotientL2 Γ hΓ) (quotientLaplacian Γ hΓ u)).re := by
  sorry
-- quotientLaplacian.nontrivial: excludes the zero operator.
example (Γ : Subgroup SL(2, ℤ)) (hΓ : CongruenceSubgroup.IsCongruenceSubgroup Γ) :
    ∃ u : (quotientLaplacian Γ hΓ).domain, quotientLaplacian Γ hΓ u ≠ 0 := by
  sorry

def meanZero (Γ : Subgroup SL(2, ℤ)) (hΓ : CongruenceSubgroup.IsCongruenceSubgroup Γ) :
    Submodule ℂ (QuotientL2 Γ hΓ) := by
  sorry

lemma mem_meanZero_iff (Γ : Subgroup SL(2, ℤ))
    (hΓ : CongruenceSubgroup.IsCongruenceSubgroup Γ) (u : QuotientL2 Γ hΓ) :
    u ∈ meanZero Γ hΓ ↔ ∫ x, u x ∂quotientMeasure Γ hΓ = 0 := by
  sorry

lemma meanZero_isClosed (Γ : Subgroup SL(2, ℤ))
    (hΓ : CongruenceSubgroup.IsCongruenceSubgroup Γ) :
    IsClosed (meanZero Γ hΓ : Set (QuotientL2 Γ hΓ)) := by
  sorry

lemma meanZero_laplacian_invariant (Γ : Subgroup SL(2, ℤ))
    (hΓ : CongruenceSubgroup.IsCongruenceSubgroup Γ)
    (u : (quotientLaplacian Γ hΓ).domain) : quotientLaplacian Γ hΓ u ∈ meanZero Γ hΓ := by
  sorry

-- meanZero.zero
example (Γ : Subgroup SL(2, ℤ)) (hΓ : CongruenceSubgroup.IsCongruenceSubgroup Γ) :
    (0 : QuotientL2 Γ hΓ) ∈ meanZero Γ hΓ := by
  sorry
-- meanZero.constant_rejection
example (Γ : Subgroup SL(2, ℤ)) (hΓ : CongruenceSubgroup.IsCongruenceSubgroup Γ)
    (u : QuotientL2 Γ hΓ) (hu : u =ᵐ[quotientMeasure Γ hΓ] (fun _ => (1 : ℂ))) :
    u ∉ meanZero Γ hΓ := by
  sorry
-- meanZero.imaginary_constant_rejection
example (Γ : Subgroup SL(2, ℤ)) (hΓ : CongruenceSubgroup.IsCongruenceSubgroup Γ)
    (u : QuotientL2 Γ hΓ) (hu : u =ᵐ[quotientMeasure Γ hΓ] (fun _ => I)) :
    u ∉ meanZero Γ hΓ := by
  sorry
-- meanZero.nontrivial: excludes the zero submodule.
example (Γ : Subgroup SL(2, ℤ)) (hΓ : CongruenceSubgroup.IsCongruenceSubgroup Γ) :
    ∃ u : QuotientL2 Γ hΓ, u ∈ meanZero Γ hΓ ∧ u ≠ 0 := by
  sorry

-- Infimum of the positive-operator Rayleigh values, excluding the zero vector and constants.
def spectralGap (Γ : Subgroup SL(2, ℤ))
    (hΓ : CongruenceSubgroup.IsCongruenceSubgroup Γ) : ℝ := by
  sorry

lemma spectralGap_eq_sInf (Γ : Subgroup SL(2, ℤ))
    (hΓ : CongruenceSubgroup.IsCongruenceSubgroup Γ) :
    spectralGap Γ hΓ = sInf {r : ℝ | ∃ u : (quotientLaplacian Γ hΓ).domain,
      (u : QuotientL2 Γ hΓ) ∈ meanZero Γ hΓ ∧ (u : QuotientL2 Γ hΓ) ≠ 0 ∧
      r = (inner ℂ (u : QuotientL2 Γ hΓ) (quotientLaplacian Γ hΓ u)).re /
        ‖(u : QuotientL2 Γ hΓ)‖ ^ 2} := by
  sorry

lemma spectralGap_nonnegative (Γ : Subgroup SL(2, ℤ))
    (hΓ : CongruenceSubgroup.IsCongruenceSubgroup Γ) : 0 ≤ spectralGap Γ hΓ := by
  sorry

lemma spectralGap_le_threshold (Γ : Subgroup SL(2, ℤ))
    (hΓ : CongruenceSubgroup.IsCongruenceSubgroup Γ) : spectralGap Γ hΓ ≤ 1 / 4 := by
  sorry

lemma spectralGap_le_rayleigh (Γ : Subgroup SL(2, ℤ))
    (hΓ : CongruenceSubgroup.IsCongruenceSubgroup Γ)
    (u : (quotientLaplacian Γ hΓ).domain)
    (hu : (u : QuotientL2 Γ hΓ) ∈ meanZero Γ hΓ)
    (hne : (u : QuotientL2 Γ hΓ) ≠ 0) :
    spectralGap Γ hΓ ≤
      (inner ℂ (u : QuotientL2 Γ hΓ) (quotientLaplacian Γ hΓ u)).re /
        ‖(u : QuotientL2 Γ hΓ)‖ ^ 2 := by
  sorry

-- spectralGap.empty_small_spectrum
example (Γ : Subgroup SL(2, ℤ)) (hΓ : CongruenceSubgroup.IsCongruenceSubgroup Γ)
    (hsmall : ∀ lam : ℝ, 0 < lam → lam < 1 / 4 →
      ¬ ∃ u : (quotientLaplacian Γ hΓ).domain,
        (u : QuotientL2 Γ hΓ) ≠ 0 ∧
        quotientLaplacian Γ hΓ u = (lam : ℂ) • (u : QuotientL2 Γ hΓ)) :
    spectralGap Γ hΓ = 1 / 4 := by
  sorry
-- spectralGap.attained_bottom
example (Γ : Subgroup SL(2, ℤ)) (hΓ : CongruenceSubgroup.IsCongruenceSubgroup Γ)
    (lam : ℝ)
    (u : (quotientLaplacian Γ hΓ).domain)
    (hu : (u : QuotientL2 Γ hΓ) ∈ meanZero Γ hΓ)
    (hne : (u : QuotientL2 Γ hΓ) ≠ 0)
    (heig : quotientLaplacian Γ hΓ u = (lam : ℂ) • (u : QuotientL2 Γ hΓ))
    (hbottom : ∀ v : (quotientLaplacian Γ hΓ).domain,
      (v : QuotientL2 Γ hΓ) ∈ meanZero Γ hΓ → (v : QuotientL2 Γ hΓ) ≠ 0 →
      lam * ‖(v : QuotientL2 Γ hΓ)‖ ^ 2 ≤
        (inner ℂ (v : QuotientL2 Γ hΓ) (quotientLaplacian Γ hΓ v)).re) :
    spectralGap Γ hΓ = lam := by
  sorry
-- spectralGap.positive: excludes retaining the constant eigenvalue.
example (Γ : Subgroup SL(2, ℤ)) (hΓ : CongruenceSubgroup.IsCongruenceSubgroup Γ) :
    21 / 100 ≤ spectralGap Γ hΓ := by
  sorry

-- Scalar convention for small eigenvalues; the inserted threshold handles the empty set.
def clippedGap (small : Set ℝ) : ℝ := by
  sorry

lemma clippedGap_eq (small : Set ℝ) : clippedGap small = sInf (insert (1 / 4) small) := by
  sorry
lemma clippedGap_le (small : Set ℝ) (r : ℝ) (hr : r ∈ small)
    (hs : BddBelow (insert (1 / 4) small)) : clippedGap small ≤ r := by
  sorry
lemma le_clippedGap (small : Set ℝ) (c : ℝ) (hc : c ≤ 1 / 4)
    (hs : ∀ r ∈ small, c ≤ r) : c ≤ clippedGap small := by
  sorry
-- clippedGap.empty
example : clippedGap ∅ = 1 / 4 := by
  sorry
-- clippedGap.exceptional
example : clippedGap {(21 / 100 : ℝ)} = 21 / 100 := by
  sorry
-- clippedGap.tempered
example : clippedGap {(1 / 3 : ℝ)} = 1 / 4 := by
  sorry

theorem spectralGap_eq_clippedGap (Γ : Subgroup SL(2, ℤ))
    (hΓ : CongruenceSubgroup.IsCongruenceSubgroup Γ) :
    spectralGap Γ hΓ = clippedGap {lam : ℝ | 0 < lam ∧ lam < 1 / 4 ∧
      ∃ u : (quotientLaplacian Γ hΓ).domain,
        (u : QuotientL2 Γ hΓ) ≠ 0 ∧
        quotientLaplacian Γ hΓ u = (lam : ℂ) • (u : QuotientL2 Γ hΓ)} := by
  sorry

-- CSG.3: existing mellin/mellinInv; multiplicative normalization mellin f 0 = 1.
def firstKernel (f : ℝ → ℂ) (x : ℝ) : ℂ := by
  sorry
lemma firstKernel_eq_integral (f : ℝ → ℂ) (x : ℝ) :
    firstKernel f x = ∫ y in Ioi x, f y / (y : ℂ) := by
  sorry
lemma firstKernel_eq_mellinInv (f : ℝ → ℂ) (hf : ContDiff ℝ ∞ f)
    (hc : HasCompactSupport f) (hp : tsupport f ⊆ Ioi 0) (x : ℝ) (hx : 0 < x) :
    firstKernel f x = mellinInv 2 (fun s => mellin f s / s) x := by
  sorry
lemma firstKernel_below (f : ℝ → ℂ) (a : ℝ) (ha : 0 < a)
    (hf : ∀ y < a, f y = 0) (hI : IntegrableOn (fun y => f y / (y : ℂ)) (Ioi 0))
    (hn : mellin f 0 = 1) (x : ℝ) (hx : 0 < x) (hxa : x ≤ a) :
    firstKernel f x = 1 := by
  sorry
lemma firstKernel_above (f : ℝ → ℂ) (b x : ℝ) (hf : ∀ y > b, f y = 0)
    (hbx : b ≤ x) : firstKernel f x = 0 := by
  sorry
-- firstKernel.zero
example (x : ℝ) : firstKernel (fun _ => 0) x = 0 := by
  sorry
-- firstKernel.below_support
example (f : ℝ → ℂ) (hf : ∀ y < 1, f y = 0)
    (hI : IntegrableOn (fun y => f y / (y : ℂ)) (Ioi 0)) (hn : mellin f 0 = 1) :
    firstKernel f (1 / 2) = 1 := by
  sorry
-- firstKernel.above_support
example (f : ℝ → ℂ) (hf : ∀ y > 2, f y = 0) : firstKernel f 3 = 0 := by
  sorry

def dualKernel (f : ℝ → ℂ) (G : ℂ → ℂ) (β : ℂ) (x : ℝ) : ℂ := by
  sorry
lemma dualKernel_eq_mellinInv (f : ℝ → ℂ) (G : ℂ → ℂ) (β : ℂ) (x : ℝ) :
    dualKernel f G β x = mellinInv 2 (fun s => mellin f (-s) * G (β - s) / s) x := by
  sorry
lemma dualKernel_zero_ratio (f : ℝ → ℂ) (β : ℂ) (x : ℝ) :
    dualKernel f (fun _ => 0) β x = 0 := by
  sorry
lemma dualKernel_unit_ratio (f : ℝ → ℂ) (hf : ContDiff ℝ ∞ f)
    (hc : HasCompactSupport f) (hp : tsupport f ⊆ Ioi 0) (β : ℂ) (x : ℝ) (hx : 0 < x) :
    dualKernel f (fun _ => 1) β x = firstKernel (fun y => f y⁻¹) x := by
  sorry
-- dualKernel.zero
example (G : ℂ → ℂ) (β : ℂ) (x : ℝ) : dualKernel (fun _ => 0) G β x = 0 := by
  sorry
-- dualKernel.zero_factor
example (f : ℝ → ℂ) (β : ℂ) (x : ℝ) : dualKernel f (fun _ => 0) β x = 0 := by
  sorry
-- dualKernel.inversion
example (f : ℝ → ℂ) (hf : ContDiff ℝ ∞ f) (hc : HasCompactSupport f)
    (hp : tsupport f ⊆ Ioi 0) (β : ℂ) :
    dualKernel f (fun _ => 1) β 2 = firstKernel (fun y => f y⁻¹) 2 := by
  sorry

-- CSG.4: L(q,χ,s) is a genuine function family, not a record asserting the desired bound.
def primeTwistAverage (L : (q : ℕ) → DirichletCharacter ℂ q → ℂ → ℂ)
    (fπ Q : ℕ) (β : ℂ) : ℂ := by
  sorry
lemma primeTwistAverage_eq (L : (q : ℕ) → DirichletCharacter ℂ q → ℂ → ℂ)
    (fπ Q : ℕ) (β : ℂ) : primeTwistAverage L fπ Q β =
    ∑ q ∈ (Finset.Ioc Q (2 * Q)).filter (fun q => q.Prime ∧ ¬ q ∣ fπ),
      ∑ χ ∈ (Finset.univ : Finset (DirichletCharacter ℂ q)).filter
        (fun χ => χ ≠ 1 ∧ χ (-1 : ZMod q) = 1), L q χ β := by
  sorry
lemma primeTwistAverage_congr (L L' : (q : ℕ) → DirichletCharacter ℂ q → ℂ → ℂ)
    (fπ Q : ℕ) (β : ℂ)
    (h : ∀ q, Q < q → q ≤ 2 * Q → q.Prime → ¬ q ∣ fπ →
      ∀ χ : DirichletCharacter ℂ q, χ ≠ 1 → χ (-1 : ZMod q) = 1 → L q χ β = L' q χ β) :
    primeTwistAverage L fπ Q β = primeTwistAverage L' fπ Q β := by
  sorry
lemma primeTwistAverage_zero_of_zero (L : (q : ℕ) → DirichletCharacter ℂ q → ℂ → ℂ)
    (fπ Q : ℕ) (β : ℂ)
    (h : ∀ q, Q < q → q ≤ 2 * Q → q.Prime → ¬ q ∣ fπ →
      ∀ χ : DirichletCharacter ℂ q, χ ≠ 1 → χ (-1 : ZMod q) = 1 → L q χ β = 0) :
    primeTwistAverage L fπ Q β = 0 := by
  sorry
-- primeTwistAverage.empty_interval
example (L : (q : ℕ) → DirichletCharacter ℂ q → ℂ → ℂ) (fπ : ℕ) (β : ℂ) :
    primeTwistAverage L fπ 0 β = 0 := by
  sorry
-- primeTwistAverage.no_even_nonprincipal_mod3
example (β : ℂ) : primeTwistAverage (fun _ _ _ => 1) 1 2 β = 0 := by
  sorry
-- primeTwistAverage.mod5
example (β : ℂ) : primeTwistAverage (fun _ _ _ => 1) 1 3 β = 1 := by
  sorry
-- primeTwistAverage.bad_prime_removed
example (β : ℂ) : primeTwistAverage (fun _ _ _ => 1) 5 3 β = 0 := by
  sorry

 theorem even_nonprincipal_orthogonality (q : ℕ) [Fact q.Prime] (hq : 2 < q)
    (a : ZMod q) :
    (∑ χ ∈ (Finset.univ : Finset (DirichletCharacter ℂ q)).filter
      (fun χ => χ ≠ 1 ∧ χ (-1 : ZMod q) = 1), χ a) =
    if a = 0 then 0 else if a = 1 ∨ a = -1 then ((q : ℂ) - 1) / 2 - 1 else -1 := by
  sorry

theorem gauss_power_even_average (q k : ℕ) [Fact q.Prime] (hq : 2 < q)
    (hk : 0 < k) (r : (ZMod q)ˣ) :
    (∑ χ ∈ (Finset.univ : Finset (DirichletCharacter ℂ q)).filter
      (fun χ => χ ≠ 1 ∧ χ (-1 : ZMod q) = 1),
      star (χ (r : ZMod q)) * gaussSum χ ZMod.stdAddChar ^ k) =
      ((q : ℂ) - 1) / 2 *
        ((∑ x ∈ (Finset.univ : Finset (Fin k → (ZMod q)ˣ)).filter
          (fun x => ∏ i, x i = r), ZMod.stdAddChar (∑ i, (x i : ZMod q))) +
         (∑ x ∈ (Finset.univ : Finset (Fin k → (ZMod q)ˣ)).filter
          (fun x => ∏ i, x i = -r), ZMod.stdAddChar (∑ i, (x i : ZMod q)))) -
        (-1 : ℂ) ^ k := by
  sorry

theorem gauss_power_even_average_bound (q k : ℕ) [Fact q.Prime] (hq : 2 < q)
    (hk : 0 < k) (r : (ZMod q)ˣ) :
    ‖∑ χ ∈ (Finset.univ : Finset (DirichletCharacter ℂ q)).filter
      (fun χ => χ ≠ 1 ∧ χ (-1 : ZMod q) = 1),
      star (χ (r : ZMod q)) * gaussSum χ ZMod.stdAddChar ^ k‖ ≤
        (q - 1 : ℝ) * k * (q : ℝ) ^ (((k : ℝ) - 1) / 2) + 1 := by
  sorry

-- CSG.5: unconditional congruence theorem, using the operator constructed above.
theorem congruence_spectral_gap (Γ : Subgroup SL(2, ℤ))
    (hΓ : CongruenceSubgroup.IsCongruenceSubgroup Γ) : 21 / 100 ≤ spectralGap Γ hΓ := by
  sorry

theorem congruence_rayleigh_bound (Γ : Subgroup SL(2, ℤ))
    (hΓ : CongruenceSubgroup.IsCongruenceSubgroup Γ)
    (u : (quotientLaplacian Γ hΓ).domain)
    (hu : (u : QuotientL2 Γ hΓ) ∈ meanZero Γ hΓ) :
    (21 / 100 : ℝ) * ‖(u : QuotientL2 Γ hΓ)‖ ^ 2 ≤
      (inner ℂ (u : QuotientL2 Γ hΓ) (quotientLaplacian Γ hΓ u)).re := by
  sorry

theorem exceptional_parameter_arithmetic (r : ℝ) (hr : 0 ≤ r) (hb : 2 * r ≤ 2 / 5) :
    r ≤ 1 / 5 ∧ 21 / 100 ≤ 1 / 4 - r ^ 2 := by
  sorry

theorem curvature_scaled_gap (lam κ : ℝ) (hκ : 0 < κ) (hbound : 21 / 100 ≤ lam) :
    κ * (21 / 100) ≤ κ * lam := by
  sorry

example : (3 / 16 : ℝ) < 21 / 100 := by
  sorry
example : (21 / 100 : ℝ) < 1 / 4 := by
  sorry
example : (21 / 100 : ℝ) * (Real.pi / 3) / (8 * Real.pi) = 7 / 800 := by
  sorry
example : (1 / 4 : ℝ) - (1 / 5) ^ 2 = 21 / 100 := by
  sorry
example : (21 / 100 : ℝ) - 3 / 16 = 9 / 400 := by
  sorry

/-
The following signatures require native AF/AL/GL2 representation and automorphic spectral
carriers, or a geometric metric-rescaling interface, and are omitted under PROTOCOL §13.
Their exact statements and dependencies are in the packet:
congruence_spectral_description, exceptional_cuspidal_dictionary,
monomial_archimedean_tempered, adjoint_exceptional_parameters,
prime_twist_functional_equation, archimedean_trivial_zero,
mellin_cutoff_estimates, approximate_functional_equation,
prime_twist_average_asymptotic,
prime_twist_nonvanishing, lrs_archimedean_parameter_bound,
congruence_form_rayleigh_bound,
spectralGap_metric_rescale.
The function-family primeTwistAverage alone carries no automorphic theorem.
-/
end TauCeti.CongruenceSpectralGap
