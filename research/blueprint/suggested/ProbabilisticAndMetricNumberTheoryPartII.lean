import Mathlib.Analysis.PSeriesComplex
import Mathlib.Analysis.MellinTransform
import Mathlib.Analysis.Normed.Algebra.GelfandFormula
import Mathlib.Analysis.Complex.CauchyIntegral
import Mathlib.Topology.ContinuousMap.Compact
import Mathlib.Topology.Algebra.Module.LocallyConvex
import Mathlib.Data.Set.Card

/-!
This file is not the roadmap and is not exhaustive. The roadmap document is definitive.
These statements suggest Lean forms so that contributors and reviewers converge on names
and signatures. Proof admissions specify work to do; they assert no implementation.

The README owns C¹ jets on a compact convex body, the bounded transfer operator on that
carrier, cone and eigendata constructions, and the coding attractor. Their carriers are
missing at the pins. This file uses native finite functions, lists, continuous maps and
Bochner integrals only. Its raw transfer formula is a totalized sum, not an assertion of
boundedness or convergence. Here n = d + 3; mathematical coordinate j+1 is indexed by j.
-/

noncomputable section
open Filter MeasureTheory Set
open scoped Topology

namespace TauCeti.TransferOperator

/-! TO.0: light formulas on existing carriers. -/

def orderedSimplex (d : ℕ) : Set (Fin (d + 2) → ℝ) :=
  {w | (∀ i, 0 ≤ w i) ∧ Monotone w ∧ ∑ i, w i = 1}

def ratio {d : ℕ} (A : ℕ) (j : Fin (d + 1)) (w : Fin (d + 2) → ℝ) : ℝ :=
  1 + ((A : ℝ) + 1) * (1 - w j.castSucc)

def delay {d : ℕ} (A : ℕ) (j : Fin (d + 1)) (w : Fin (d + 2) → ℝ) : ℝ :=
  Real.log (ratio A j w)

def branch {d : ℕ} (A : ℕ) (j : Fin (d + 1)) (w : Fin (d + 2) → ℝ)
    (i : Fin (d + 2)) : ℝ :=
  (if hi : i.val < d + 1 then w (j.castSucc.succAbove ⟨i.val, hi⟩)
    else 1 + (A : ℝ) * (1 - w j.castSucc)) / ratio A j w

def weight {d : ℕ} (s : ℂ) (A : ℕ) (j : Fin (d + 1))
    (w : Fin (d + 2) → ℝ) : ℂ :=
  Complex.exp (-s * (delay A j w : ℂ))

def wordDelay {d : ℕ} : List (ℕ × Fin (d + 1)) → (Fin (d + 2) → ℝ) → ℝ
  | [], _ => 0
  | (A, j) :: u, w => delay A j w + wordDelay u (branch A j w)

def wordCount {d : ℕ} (w : Fin (d + 2) → ℝ) (r : ℝ) : ℕ :=
  {u : List (ℕ × Fin (d + 1)) | wordDelay u w ≤ r}.ncard

def rawTransfer {d : ℕ} (s : ℂ) (f : (Fin (d + 2) → ℝ) → ℂ)
    (w : Fin (d + 2) → ℝ) : ℂ :=
  ∑ j : Fin (d + 1), ∑' A : ℕ, weight s A j w * f (branch A j w)

theorem branch_mem {d : ℕ} {w : Fin (d + 2) → ℝ} (hw : w ∈ orderedSimplex d)
    (A : ℕ) (j : Fin (d + 1)) : branch A j w ∈ orderedSimplex d := by sorry

theorem ratio_bounds {d : ℕ} {w : Fin (d + 2) → ℝ} (hw : w ∈ orderedSimplex d)
    (A : ℕ) (j : Fin (d + 1)) :
    ((A : ℝ) + 3) / 2 ≤ ratio A j w ∧ ratio A j w ≤ (A : ℝ) + 2 := by sorry

theorem delay_lower {d : ℕ} {w : Fin (d + 2) → ℝ} (hw : w ∈ orderedSimplex d)
    (A : ℕ) (j : Fin (d + 1)) : Real.log (3 / 2) ≤ delay A j w := by sorry

theorem count_finite {d : ℕ} {w : Fin (d + 2) → ℝ} (hw : w ∈ orderedSimplex d)
    (r : ℝ) : {u : List (ℕ × Fin (d + 1)) | wordDelay u w ≤ r}.Finite := by sorry

example : ratio (d := 1) 0 0 ![(1 / 6 : ℝ), 1 / 3, 1 / 2] = 11 / 6 := by sorry
example : branch (d := 1) 0 0 ![(1 / 6 : ℝ), 1 / 3, 1 / 2] =
    ![(2 / 11 : ℝ), 3 / 11, 6 / 11] := by sorry
example : branch (d := 1) 1 1 ![(1 / 6 : ℝ), 1 / 3, 1 / 2] =
    ![(1 / 14 : ℝ), 3 / 14, 5 / 7] := by sorry
example : wordDelay (d := 0) [] ![(0 : ℝ), 1] = 0 := by sorry
example : wordCount (d := 0) ![(0 : ℝ), 1] 0 = 1 := by sorry
example : wordCount (d := 0) ![(0 : ℝ), 1] (-1) = 0 := by sorry

/-! TO.3: a milestone statable without any new data carrier.
Brouwer remains an import from current DifferentialGeometry, recorded as G1 in the packet. -/

theorem schauder_tychonoff {E : Type*} [AddCommGroup E] [Module ℝ E]
    [TopologicalSpace E] [IsTopologicalAddGroup E] [ContinuousSMul ℝ E]
    [T2Space E] [LocallyConvexSpace ℝ E]
    (K : Set E) (hcompact : IsCompact K) (hconvex : Convex ℝ K) (hne : K.Nonempty)
    (f : C(K, K)) : ∃ x : K, f x = x := by sorry

/-! TO.2 and TO.6: the shared one-sided predicate belongs to HP.0 and is not redefined.
Only the bilateral predicate and its native Mellin comparison are stated here. -/

def HasBilateralLaplace (f : ℝ → ℂ) (s z : ℂ) : Prop :=
  Integrable (fun t : ℝ => Complex.exp (-s * t) * f t) ∧
    (∫ t : ℝ, Complex.exp (-s * t) * f t) = z

theorem bilateral_mellin {f : ℝ → ℂ} {s z : ℂ} :
    HasBilateralLaplace f s z ↔
      MellinConvergent (fun u : ℝ => f (Real.log u)) (-s) ∧
        mellin (fun u : ℝ => f (Real.log u)) (-s) = z := by sorry

example {s : ℂ} (hs : 0 < s.re) (c : ℝ) :
    HasBilateralLaplace (fun t => if c ≤ t then 1 else 0) s
      (Complex.exp (-s * (c : ℂ)) / s) := by sorry

example {s : ℂ} (hs : 0 < s.re) :
    MellinConvergent (fun u : ℝ => if 1 ≤ u then (1 : ℂ) else 0) (-s) ∧
      mellin (fun u : ℝ => if 1 ≤ u then (1 : ℂ) else 0) (-s) = 1 / s := by sorry

example : ¬ HasBilateralLaplace (fun _ => (1 : ℂ)) 0 0 := by sorry

-- Boundary regularity is in the C(X)-valued norm. No continuity of α(·,t) is assumed.
theorem uniform_renewal_tauberian {X : Type*} [TopologicalSpace X] [CompactSpace X]
    (α : X → ℝ → ℝ) (a C : ℝ) (ha : 0 < a) (hC : 0 ≤ C)
    (B : C(X, ℝ)) (F : ℂ → C(X, ℂ))
    (hmeas : ∀ x, Measurable (α x))
    (hzero : ∀ x t, t < 0 → α x t = 0)
    (hmono : ∀ x, Monotone (α x))
    (hgrowth : ∀ x t, 0 ≤ t → 0 ≤ α x t ∧ α x t ≤ C * Real.exp (a * t))
    (hlaplace : ∀ s : ℂ, a < s.re → ∀ x,
      HasBilateralLaplace (fun t => (α x t : ℂ)) s (F s x))
    (hinterior : AnalyticOnNhd ℂ F {s : ℂ | a < s.re})
    (hboundary : ∀ z : ℂ, z.re = a → ∃ G : ℂ → C(X, ℂ),
      AnalyticAt ℂ G z ∧ ∀ᶠ s in 𝓝 z, a < s.re →
        ∀ x, G s x = F s x - (B x : ℂ) / (s - (a : ℂ))) :
    ∀ ε : ℝ, 0 < ε → ∃ R : ℝ, ∀ t : ℝ, R ≤ t →
      ∀ x, |Real.exp (-a * t) * α x t - B x| < ε := by sorry

-- The C¹ enhancement of B and its residue formula require the missing operator carrier;
-- those exact targets remain in TO.6 of the README.
theorem linear_semigroup_counting (d : ℕ) :
    ∃ β : ℝ, 1 < β ∧ ∃ B : (Fin (d + 2) → ℝ) → ℝ,
      ContinuousOn B (orderedSimplex d) ∧
      (∀ w ∈ orderedSimplex d, 0 < B w ∧
        rawTransfer (β : ℂ) (fun v => (B v : ℂ)) w = (B w : ℂ)) ∧
      (∀ ε : ℝ, 0 < ε → ∃ R : ℝ, ∀ r : ℝ, R ≤ r →
        ∀ w ∈ orderedSimplex d,
          |(wordCount w r : ℝ) / (B w * Real.exp (β * r)) - 1| < ε) := by sorry

/-! TO.7: the Gauss family is defined pointwise over native real/complex functions.
The weighted C¹ operator and spectral theorems are README targets. -/

def gaussBranch (A : ℕ) (x : ℝ) : ℝ := 1 / (x + (A : ℝ) + 1)

def multiplier (s : ℂ) (x : ℝ) : ℂ := Complex.exp (s * (Real.log (1 + x) : ℂ))

def rawGauss (s : ℂ) (f : ℝ → ℂ) (x : ℝ) : ℂ :=
  ∑' A : ℕ, Complex.exp (-s * (Real.log (x + (A : ℝ) + 1) : ℂ)) *
    f (gaussBranch A x)

def rawGaussGMR (s : ℂ) (f : ℝ → ℂ) (x : ℝ) : ℂ :=
  ∑' A : ℕ, Complex.exp (-s * (Real.log ((x + (A : ℝ) + 2) / (x + 1)) : ℂ)) *
    f (gaussBranch A x)

theorem gauss_conjugacy (s : ℂ) (f : ℝ → ℂ) {x : ℝ} (hx : x ∈ Icc 0 1) :
    (multiplier s x)⁻¹ * rawGaussGMR s (fun y => multiplier s y * f y) x =
      rawGauss s f x := by sorry

theorem gauss_density {x : ℝ} (hx : x ∈ Icc 0 1) :
    rawGauss 2 (fun y => 1 / ((1 + y : ℝ) : ℂ)) x = 1 / ((1 + x : ℝ) : ℂ) := by sorry

theorem gauss_gmr_eigenfunction {x : ℝ} (hx : x ∈ Icc 0 1) :
    rawGaussGMR 2 (fun y => ((1 + y : ℝ) : ℂ)) x = ((1 + x : ℝ) : ℂ) := by sorry

example : gaussBranch 0 0 = 1 := by sorry
example : gaussBranch 1 0 = 1 / 2 := by sorry
example : multiplier 0 1 = 1 := by sorry
example : gaussBranch 0 (gaussBranch 0 0) = 1 / 2 := by sorry

end TauCeti.TransferOperator
